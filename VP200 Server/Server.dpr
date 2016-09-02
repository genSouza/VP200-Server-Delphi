program Server;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  VP200Commands in 'VP200Commands.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
