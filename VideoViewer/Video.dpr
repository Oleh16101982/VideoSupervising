program Video;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  MoDetect in 'MoDetect.pas',
  clLogAcceptor1 in 'clLogAcceptor1.pas',
  clReadThread1 in 'clReadThread1.pas',
  uUtils in 'uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
