program VKClean;

uses
  Vcl.Forms,
  VKClean.Main in 'VKClean.Main.pas' {FormMain},
  VK.OAuth2 in 'VK.OAuth2.pas' {FormOAuth2},
  VKClean.Groups in 'VKClean.Groups.pas',
  VKClean.Friends in 'VKClean.Friends.pas',
  VKClean.InnerLog in 'VKClean.InnerLog.pas',
  VKClean.Captcha in 'VKClean.Captcha.pas' {FormCaptcha},
  VKClean.Posts in 'VKClean.Posts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'VK Cleaner';
  Application.CreateForm(TFormMain, FormMain);
  {$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF}
  Application.Run;
end.
