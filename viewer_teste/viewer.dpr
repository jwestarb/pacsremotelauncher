program viewer;

uses
  Forms,
  UfPrincipal in 'UfPrincipal.pas' {fPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Teste Viewer PACS';
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
