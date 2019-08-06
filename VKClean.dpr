program VKClean;

{$R *.dres}

uses
  Vcl.Forms,
  VKClean.Main in 'VKClean.Main.pas' {FormMain},
  VK.OAuth2 in 'VK.OAuth2.pas' {FormOAuth2},
  VKClean.Groups in 'VKClean.Groups.pas',
  VKClean.Friends in 'VKClean.Friends.pas',
  VKClean.InnerLog in 'VKClean.InnerLog.pas',
  VKClean.Captcha in 'VKClean.Captcha.pas' {FormCaptcha},
  VKClean.Posts in 'VKClean.Posts.pas',
  VKClean.Photos in 'VKClean.Photos.pas',
  VKClean.Albums in 'VKClean.Albums.pas',
  VKClean.Videos in 'VKClean.Videos.pas',
  VKClean.DocTypes in 'VKClean.DocTypes.pas',
  VKClean.Docs in 'VKClean.Docs.pas',
  VKClean.RequestConstruct in 'VKClean.RequestConstruct.pas',
  VKClean.Profile in 'VKClean.Profile.pas',
  VKClean.Fave in 'VKClean.Fave.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'VK Cleaner';
  Application.CreateForm(TFormMain, FormMain);
  {$IFDEF DEBUG} ReportMemoryLeaksOnShutdown := True; {$ENDIF}
  Application.Run;
end.
