program RemoteLauncher;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Remote Launcher PACS Viewer';
  Application.ShowMainForm := False;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
