unit VKClean.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, VK.OAuth2, Vcl.StdCtrls, Vcl.ComCtrls, JSON, acPNG,
  Vcl.ExtCtrls, HGM.Controls.Labels, HGM.Button, System.ImageList, Vcl.ImgList,
  HGM.Controls.PanelExt, IdHTTP, Vcl.Imaging.jpeg, HGM.Popup;

type
  TOAuth2WebFormRedirectEvent = procedure(const AURL: string; var DoCloseWebView: boolean) of object;

  TFormMain = class(TForm)
    RESTClient: TRESTClient;
    RESTRequestGetSubs: TRESTRequest;
    RESTResponse: TRESTResponse;
    OAuth2Authenticator: TOAuth2Authenticator;
    RESTRequestGetWall: TRESTRequest;
    RESTRequestLogout: TRESTRequest;
    RESTRequestGroupLeave: TRESTRequest;
    PanelHead: TPanel;
    Image1: TImage;
    PageControlMain: TPageControl;
    TabSheetAuth: TTabSheet;
    TabSheetGroupClean: TTabSheet;
    ButtonGetSubs: TButton;
    ListView1: TListView;
    ButtonGetLastPosts: TButton;
    ListView2: TListView;
    ButtonGroupLeave: TButton;
    PanelLogin: TPanel;
    TabSheetWelcome: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonFlatLogin: TButtonFlat;
    LinkRestorePass: ThLink;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelEx1: TShape;
    Label7: TLabel;
    TabSheetMenu: TTabSheet;
    ButtonFlatCleanGroups: TButtonFlat;
    ImageList16: TImageList;
    LabelAuthState: TLabel;
    DrawPanelLogin: TDrawPanel;
    RESTRequestProfile: TRESTRequest;
    LabelFirstName: TLabel;
    PanelProfileMenu: TPanel;
    ButtonFlatLogout: TButtonFlat;
    Memo1: TMemo;
    PanelWOMenu: TPanel;
    ButtonFlat1: TButtonFlat;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonGetSubsClick(Sender: TObject);
    procedure ButtonGetLastPostsClick(Sender: TObject);
    procedure ButtonGroupLeaveClick(Sender: TObject);
    procedure LinkRestorePassClick(Sender: TObject);
    procedure ButtonFlatLoginClick(Sender: TObject);
    procedure ButtonFlatCleanGroupsClick(Sender: TObject);
    procedure DrawPanelLoginMouseEnter(Sender: TObject);
    procedure DrawPanelLoginMouseLeave(Sender: TObject);
    procedure DrawPanelLoginPaint(Sender: TObject);
    procedure ButtonFlatLogoutClick(Sender: TObject);
    procedure DrawPanelLoginClick(Sender: TObject);
    procedure ButtonFlat1Click(Sender: TObject);
  private
    FAuthForm: TFormOAuth2;
    FFirstName: string;
    FPhoto50: string;
    FPhoto: TBitmap;
    FPhotoRGN: HRGN;
    FProfileMenu: TFormPopup;
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    procedure SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
    procedure GetProfile;
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write SetOnBeforeRedirect;
    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write SetOnAfterRedirect;
  public
    procedure OpenMenu;
    procedure Auth;
    procedure OpenPage(Tab: TTabSheet);
  end;

const
  {$INCLUDE APPIDENT.inc} //в этом файле находятся заккоментированные строчки ниже, чтоб не светить ключами на гите
  {
  cAppID = '7xxxxxx';
  cAppKey = 'xxxxxxxxxxxxxxxxxxxxxxxx';
  Для работы, необходимо указывать данные standalone-приложения ВК
  }
  cEndPoint = 'https://oauth.vk.com/authorize';

var
  FormMain: TFormMain;

implementation

uses
  DateUtils, ShellAPI;

{$R *.dfm}

function DownloadURL(URL: string): TMemoryStream;
var
  HTTP: TIdHTTP;
begin
  Result := TMemoryStream.Create;
  HTTP := TIdHTTP.Create(nil);
  try
    try
      HTTP.ReadTimeout := 200;
      HTTP.HandleRedirects := True;
      HTTP.Get(URL, Result);
    except
      //Ну, ошибка... Поток всё равно создан и ошибки не должно возникнуть,
      //если проверить размер потока перед его использованием
    end;
  finally
    HTTP.Free;
  end;
end;

procedure TFormMain.Auth;
begin
  LabelAuthState.Caption := 'Загрузка...';
  OAuth2Authenticator.AccessToken := EmptyStr;
  OAuth2Authenticator.ClientID := cAppID;
  OAuth2Authenticator.ClientSecret := cAppKey;
  OAuth2Authenticator.ResponseType := TOAuth2ResponseType.rtTOKEN;
  OAuth2Authenticator.AuthorizationEndpoint := cEndPoint;
  PageControlMain.ActivePage := TabSheetAuth;
  FAuthForm.ShowWithURL(PanelLogin, OAuth2Authenticator.AuthorizationRequestURI);
end;

procedure TFormMain.DrawPanelLoginClick(Sender: TObject);
var
  PT: TPoint;
begin
  PT := DrawPanelLogin.ClientToScreen(Point(0, 0));
  FProfileMenu := TFormPopup.CreatePopup(Self, PanelProfileMenu,
    procedure
    begin
      FProfileMenu := nil;
    end, PT.X, PT.Y + DrawPanelLogin.Height, [psShadow, psFrame]);
end;

procedure TFormMain.DrawPanelLoginMouseEnter(Sender: TObject);
begin
  DrawPanelLogin.Color := $0098683D;
end;

procedure TFormMain.DrawPanelLoginMouseLeave(Sender: TObject);
begin
  DrawPanelLogin.Color := PanelHead.Color;
end;

procedure TFormMain.DrawPanelLoginPaint(Sender: TObject);
var
  R: TRect;
begin
  with DrawPanelLogin.Canvas do
  begin
    R := Rect(LabelFirstName.Width + 8, DrawPanelLogin.Height div 2 - 14, LabelFirstName.Width + 8 + 28, DrawPanelLogin.Height div 2 - 14 + 28);
    if not FPhoto.Empty then
      StretchDraw(R, FPhoto);
    ImageList16.Draw(DrawPanelLogin.Canvas, R.Right, DrawPanelLogin.Height div 2 - 12, 1, True);
  end;
end;

procedure TFormMain.OpenMenu;
begin
  PanelWOMenu.Hide;
  PageControlMain.ActivePage := TabSheetMenu;
end;

procedure TFormMain.OpenPage(Tab: TTabSheet);
begin
  PanelWOMenu.Show;
  PageControlMain.ActivePage := Tab;
end;

procedure TFormMain.ButtonFlat1Click(Sender: TObject);
begin
  OpenMenu;
end;

procedure TFormMain.ButtonFlatCleanGroupsClick(Sender: TObject);
begin
  OpenPage(TabSheetGroupClean);
end;

procedure TFormMain.ButtonFlatLoginClick(Sender: TObject);
begin
  Auth;
end;

procedure TFormMain.ButtonFlatLogoutClick(Sender: TObject);
begin
  FProfileMenu.Close;
  FAuthForm.DeleteCache;
  DrawPanelLogin.Hide;
  FFirstName := '';
  FPhoto.FreeImage;
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.ButtonGetLastPostsClick(Sender: TObject);
var
  i, p: Integer;
  JS: TJSONValue;
  JArr: TJSONArray;
begin
  for i := 0 to ListView1.Items.Count - 1 do
  begin
    RESTRequestGetWall.Params.ParameterByName('owner_id').Value := '-' + ListView1.Items[i].Caption;
    RESTRequestGetWall.Execute;
    JS := RESTResponse.JSONValue;
    Memo1.Text := JS.ToJSON;
    JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
    Memo1.Text := JArr.ToJSON;
    if JArr.Count > 0 then
    begin
      if JArr.Count > 1 then
      begin
        if JArr.Items[0].GetValue<Boolean>('is_pinned', False) then
          p := 1
        else
          p := 0;
      end
      else
        p := 0;
      with ListView2.Items.Add do
      begin
        Caption := ListView1.Items[i].SubItems[0];
        SubItems.Add(DateTimeToStr(UnixToDateTime(JArr.Items[p].GetValue<Integer>('date'), False)));
        SubItems.Add(JArr.Items[p].GetValue<string>('text'));
        SubItems.Add(ListView1.Items[i].Caption);
      end;
    end;
    Sleep(400);
    Application.ProcessMessages;
  end;
end;

procedure TFormMain.ButtonGetSubsClick(Sender: TObject);
var
  JS: TJSONValue;
  JArr: TJSONArray;
  i: Integer;
begin
  RESTRequestGetSubs.Execute;
  JS := RESTResponse.JSONValue;

  JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
  Memo1.Text := JArr.ToJSON;
  for i := 0 to JArr.Count - 1 do
    with ListView1.Items.Add do
    begin
      Caption := JArr.Items[i].GetValue<Integer>('id').ToString;
      SubItems.Add(JArr.Items[i].GetValue<string>('name'));
    end;
end;

procedure TFormMain.ButtonGroupLeaveClick(Sender: TObject);
begin
  RESTRequestGroupLeave.Params.ParameterByName('group_id').Value := ListView2.Selected.SubItems[2];
  RESTRequestGroupLeave.Execute;
  Memo1.Text := RESTResponse.Content;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FPhoto := TBitmap.Create;
  FPhoto.PixelFormat := pf32bit;
  FPhoto.SetSize(50, 50);
  FPhotoRGN := CreateEllipticRgn(0, 0, 50, 50);
  FAuthForm := TFormOAuth2.Create(nil);
  FAuthForm.OnAfterRedirect := AfterRedirect;
  for i := 0 to PageControlMain.PageCount - 1 do
    PageControlMain.Pages[i].TabVisible := False;
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FAuthForm.Free;
  FPhoto.Free;
end;

procedure TFormMain.LinkRestorePassClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://vk.com/restore', nil, nil, SW_NORMAL);
end;

procedure TFormMain.SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
begin
  FOnAfterRedirect := Value;
end;

procedure TFormMain.SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
begin
  FOnBeforeRedirect := Value;
end;

procedure TFormMain.GetProfile;
var
  Mem: TMemoryStream;
  JPG: TJPEGImage;
  BMP: TBitmap;
begin
  RESTRequestProfile.Execute;
  FFirstName := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('first_name', 'Скрыто');
  FPhoto50 := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('photo_50', '');
  if FPhoto50 <> '' then
  begin
    Mem := DownloadURL(FPhoto50);
    JPG := TJPEGImage.Create;
    BMP := TBitmap.Create;
    BMP.PixelFormat := pf24bit;
    BMP.SetSize(50, 50);
    try
      if Mem.Size > 0 then
      begin
        Mem.Position := 0;
        JPG.LoadFromStream(Mem);
        BMP.Assign(JPG);
        FPhoto.TransparentColor := clFuchsia;
        FPhoto.TransparentMode := tmFixed;
        FPhoto.Transparent := True;
        FPhoto.Canvas.Brush.Color := FPhoto.TransparentColor;
        FPhoto.Canvas.FillRect(Rect(0, 0, 50, 50));
        FPhoto.Canvas.Brush.Bitmap := BMP;
        PaintRgn(FPhoto.Canvas.Handle, FPhotoRGN);
      end;
    finally
      JPG.Free;
      Mem.Free;
      BMP.Free;
    end;
  end;
  DrawPanelLogin.Show;
  DrawPanelLogin.Repaint;
end;

procedure TFormMain.AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
var
  i: integer;
  Str: string;
  Params: TStringList;
begin
  i := pos('#access_token=', AURL);
  if (i <> 0) and (OAuth2Authenticator.AccessToken = EmptyStr) then
  begin
    Str := AURL;
    Delete(Str, 1, i);
    Params := TStringList.Create;
    try
      Params.Delimiter := '&';
      Params.DelimitedText := Str;
      OAuth2Authenticator.AccessToken := Params.Values['access_token'];
      OAuth2Authenticator.AccessTokenExpiry := IncSecond(Now, StrToInt(Params.Values['expires_in']));
      LabelAuthState.Caption := 'Готово';
      GetProfile;
      Repaint;
      OpenMenu;
    finally
      Params.Free;
    end;
    DoCloseWebView := True;
  end;
end;

end.

