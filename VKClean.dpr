program VKClean;

uses
  Vcl.Forms,
  VKClean.Main in 'VKClean.Main.pas' {FormMain},
  VK.OAuth2 in 'VK.OAuth2.pas' {FormOAuth2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormOAuth2, FormOAuth2);
  Application.Run;
end.
