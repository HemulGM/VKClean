program VKClean;

uses
  Vcl.Forms,
  VKClean.Main in 'VKClean.Main.pas' {FormMain},
  VK.OAuth2 in 'VK.OAuth2.pas' {FormOAuth2},
  VKClean.Groups in 'VKClean.Groups.pas',
  VKClean.Friends in 'VKClean.Friends.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
