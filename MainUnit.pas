unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, Menus, CoolTrayIcon,
  IdBaseComponent, IdComponent, IdTCPServer, IdCustomHTTPServer,
  IdHTTPServer, idSocketHandle, IdIOHandlerSocket;

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
    procedure IniciarServidor(Sender: TObject);
    procedure DisplayMessage(const Msg: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Abrir1Click(Sender: TObject);
    procedure Esconder1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HTTPServerCommandGet(AThread: TIdPeerThread;
      ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
    // Some extra stuff necessary for the "Close to tray" option:
    SessionEnding: Boolean;
    procedure WMQueryEndSession(var Message: TMessage); message WM_QUERYENDSESSION;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.WMQueryEndSession(var Message: TMessage);
{ This method is a hack. It intercepts the WM_QUERYENDSESSION message.
  This way we can decide if we want to ignore the "Close to tray" option.
  Otherwise, when selected, the option would make Windows unable to shut down. }
begin
  SessionEnding := True;
  Message.Result := 1;
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
    Binding.Port := 8088;
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
begin
  SessionEnding := True;
  Application.Terminate;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
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
  viewer, qt_params, params: String;
begin
  DisplayMessage(Format( 'Command %s %s received from %s:%d',
                         [ARequestInfo.Command, ARequestInfo.Document,
                         TIdIOHandlerSocket(AThread.Connection.IOHandler).Binding.PeerIP,
                         TIdIOHandlerSocket(AThread.Connection.IOHandler).Binding.PeerPort]));
  if ARequestInfo.Document = '/open' then
  begin
    qt_params := IntToStr(ARequestInfo.Params.Count);
    if ARequestInfo.Params.Count >= 5 then
      begin
        patientid := ARequestInfo.Params.Values['-patientid'];
        accessionnumber := ARequestInfo.Params.Values['-accessionnumber'];
        crm := ARequestInfo.Params.Values['-crm'];
        uf := ARequestInfo.Params.Values['-uf'];
        password := ARequestInfo.Params.Values['-password'];
        viewer := '.\viewer_teste\viewer.exe ';
        params := '-patientid='+patientid+' -accessionnumber='+accessionnumber+' -crm='+crm+' -uf='+uf+' -password='+password+' -enableall';
        DisplayMessage('OK - ' + qt_params + ' - ' + viewer + params );
        WinExec(PChar(viewer + params), SW_SHOW);
      end
    else
      begin
        DisplayMessage('ERR - ' + qt_params);
      end;
  end;
  AResponseInfo.ResponseNo := 202;
  AResponseInfo.ContentText := 'OK';
end;

end.
