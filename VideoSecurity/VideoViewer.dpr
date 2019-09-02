program VideoViewer;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form2},
  clThServer in 'clThServer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
