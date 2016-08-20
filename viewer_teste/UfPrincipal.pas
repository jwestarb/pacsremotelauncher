unit UfPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfPrincipal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.FormShow(Sender: TObject);
var
  I: Integer;
begin
  Label13.Caption := InttoStr(ParamCount);
  if (ParamCount >= 5) then
    begin
      Label6.Caption := ParamStr(1);
      Label7.Caption := ParamStr(2);
      Label8.Caption := ParamStr(3);
      Label9.Caption := ParamStr(4);
      Label10.Caption := ParamStr(5);
    end
  else
    begin
      Label11.Caption := 'Não foram passados pelo menos 5 parametros.';
    end;

  if (ParamCount >= 6) then
    begin
      Label11.Caption := 'Foram passados mais que 5 parametros.';
    end;

  for I := 1 to ParamCount do
    begin
      ListBox1.AddItem(ParamStr(I),Sender);
    end;
end;

end.
