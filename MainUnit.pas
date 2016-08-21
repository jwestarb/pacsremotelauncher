unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, Menus, CoolTrayIcon,
  IdBaseComponent, IdComponent, IdTCPServer, IdCustomHTTPServer,
  IdHTTPServer, idSocketHandle, IdIOHandlerSocket, Registry;

type
  TMainForm = class(TForm)
    TopPanel: TPanel;
    PageControl: TPageControl;
    TabLog: TTabSheet;
    TabTest: TTabSheet;
    Log: TMemo;
    BtnClose: TSpeedButton;
    TrayIcon: TCoolTrayIcon;
    PopupMenu: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    BtnMinimize: TSpeedButton;
    Esconder1: TMenuItem;
    HTTPServer: TIdHTTPServer;
    TabConfig: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edPort: TEdit;
    edViewer: TEdit;
    BitBtn1: TBitBtn;
    ckInitWin: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPac: TEdit;
    edAcNum: TEdit;
    edCrm: TEdit;
    edUf: TEdit;
    edPass: TEdit;
    BitBtn2: TBitBtn;
    procedure GravarConfig;
    procedure LerConfig;
    procedure IniciarServidor(Sender: TObject);
    procedure DisplayMessage(const Msg: String);
    procedure ExecutaViewer(patientid: String;
                            accessionnumber: String;
                            crm: String;
                            uf: String;
                            password: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Abrir1Click(Sender: TObject);
    procedure Esconder1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HTTPServerCommandGet(AThread: TIdPeerThread;
      ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    // Some extra stuff necessary for the "Close to tray" option:
    SessionEnding: Boolean;
    Port: Integer;
    Viewer: String;
    procedure WMQueryEndSession(var Message: TMessage); message WM_QUERYENDSESSION;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.GravarConfig();
var
  reg: TRegistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  with reg do
    begin
      try
        if OpenKey('\Software\RemoteLauncher', True) then
          begin
            reg.WriteInteger('Port', StrtoInt(edPort.Text));
            reg.WriteString('PacsViewer', edViewer.Text);
            Port := StrtoInt(edPort.Text);
            Viewer := edViewer.Text;
          end;
        CloseKey();
        if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True) then
          begin
            if (ckInitWin.Checked) then
              begin
                WriteString('RemoteLauncher', ParamStr(0));
              end
            else
              begin
                reg.DeleteValue('RemoteLauncher');
              end;
        end;
        CloseKey;
      finally
        Free;
      end;
    end;
end;

procedure TMainForm.LerConfig();
var
  reg: TRegistry;
begin
  reg:=TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  with reg do
    begin
      try
        if OpenKey('\Software\RemoteLauncher', False) then
          begin
            if (ValueExists('Port')) then
              Port := ReadInteger('Port')
            else
              Port := 8088;
            if (ValueExists('PacsViewer')) then
              Viewer := ReadString('PacsViewer')
            else
              Viewer := '.\viewer_teste\viewer.exe';
            edPort.Text := InttoStr(Port);
            edViewer.Text := Viewer;
          end
        else
          begin
            Port := 8088;
            Viewer := '.\viewer_teste\viewer.exe';
          end;
        CloseKey();
        if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True) then
          begin
            ckInitWin.Checked := reg.ValueExists('RemoteLauncher');
          end;
        CloseKey;
      finally
        reg.Free;
      end;
    end;
end;

procedure TMainForm.WMQueryEndSession(var Message: TMessage);
{ This method is a hack. It intercepts the WM_QUERYENDSESSION message.
  This way we can decide if we want to ignore the "Close to tray" option.
  Otherwise, when selected, the option would make Windows unable to shut down. }
begin
  SessionEnding := True;
  Message.Result := 1;
end;

procedure TMainForm.ExecutaViewer(patientid: String;
                                  accessionnumber: String;
                                  crm: String;
                                  uf: String;
                                  password: String);
var
  params: String;
begin
  viewer := Viewer;
  params := ' -patientid='+patientid+' -accessionnumber='+accessionnumber+' -crm='+crm+' -uf='+uf+' -password='+password+' -enableall';
  DisplayMessage(viewer + params);
  WinExec(PChar(viewer + params), SW_SHOW);
end;

procedure TMainForm.DisplayMessage(const Msg: String);
begin
  Log.Lines.Add(Msg);
end;

procedure TMainForm.IniciarServidor(Sender: TObject);
var
  Binding : TIdSocketHandle;
begin
  if not HTTPServer.Active then
  begin
    HTTPServer.Bindings.Clear;
    Binding := HTTPServer.Bindings.Add;
    Binding.Port := Port;
    Binding.IP := '0.0.0.0';
  end;

  try
    HTTPServer.Active := true;
    DisplayMessage(format('Listening for HTTP connections on %s:%d.',[HTTPServer.Bindings[0].IP, HTTPServer.Bindings[0].Port]));
  except
    on e: exception do
      begin
       DisplayMessage(format('Exception %s in Activate. Error is:"%s".', [e.ClassName, e.Message]));
      end;
  end;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := SessionEnding;
  if not CanClose then
  begin
    TrayIcon.HideMainForm;
    TrayIcon.IconVisible := True;
  end;
end;

procedure TMainForm.Abrir1Click(Sender: TObject);
begin
  TrayIcon.ShowMainForm;
end;

procedure TMainForm.Esconder1Click(Sender: TObject);
begin
  Application.Minimize;
  TrayIcon.HideMainForm;
end;

procedure TMainForm.BtnCloseClick(Sender: TObject);
var
  senhaDigitada: String;
begin
  InputQuery('Sair', 'Senha:', senhaDigitada);
  if (senhaDigitada = 'pacshnsc') then
    begin
      SessionEnding := True;
      Application.Terminate;
    end
  else
    begin
      ShowMessage('Senha inválida');
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LerConfig;
  SessionEnding := False;
  IniciarServidor(MainForm);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DisplayMessage('Stop listening.');
  HTTPServer.Active := false;
  HTTPServer.Intercept := nil;
end;

procedure TMainForm.HTTPServerCommandGet(AThread: TIdPeerThread;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  patientid, accessionnumber, crm , uf, password: String;
  qt_params, params: String;
begin
  DisplayMessage(Format( 'Command %s %s received from %s:%d',
                         [ARequestInfo.Command, ARequestInfo.Document,
                         TIdIOHandlerSocket(AThread.Connection.IOHandler).Binding.PeerIP,
                         TIdIOHandlerSocket(AThread.Connection.IOHandler).Binding.PeerPort]));
  if ARequestInfo.Document = '/' then
  begin
    qt_params := IntToStr(ARequestInfo.Params.Count);
    if ARequestInfo.Params.Count >= 5 then
      begin
        patientid := ARequestInfo.Params.Values['-patientid'];
        accessionnumber := ARequestInfo.Params.Values['-accessionnumber'];
        crm := ARequestInfo.Params.Values['-crm'];
        uf := ARequestInfo.Params.Values['-uf'];
        password := ARequestInfo.Params.Values['-password'];
        params := '-patientid='+patientid+' -accessionnumber='+accessionnumber+' -crm='+crm+' -uf='+uf+' -password='+password+' -enableall';
        DisplayMessage('OK - ' + qt_params);
        ExecutaViewer(patientid, accessionnumber, crm , uf, password);
      end
    else
      begin
        DisplayMessage('ERR - ' + qt_params);
      end;
  end;
  AResponseInfo.ResponseNo := 202;
  AResponseInfo.ContentText := 'OK';
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  GravarConfig;
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
  ExecutaViewer(edPac.Text,
                edAcNum.Text,
                edCrm.Text,
                edUf.Text,
                edPass.Text);
end;

end.
