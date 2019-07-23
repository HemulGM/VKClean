unit VKClean.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, VK.OAuth2, Vcl.StdCtrls, Vcl.ComCtrls, JSON, acPNG,
  Vcl.ExtCtrls, HGM.Controls.Labels, HGM.Button, System.ImageList, Vcl.ImgList,
  HGM.Controls.PanelExt, IdHTTP, Vcl.Imaging.jpeg, HGM.Popup, VKClean.Groups,
  Vcl.Grids, HGM.Controls.VirtualTable, System.Generics.Defaults,
  VKClean.Friends;

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
    PanelLogin: TPanel;
    TabSheetWelcome: TTabSheet;
    Label6: TLabel;
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
    ButtonFlatReturnToMenu: TButtonFlat;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonFlatLogin: TButtonFlat;
    LinkRestorePass: ThLink;
    Label4: TLabel;
    Label5: TLabel;
    LabelEx1: TShape;
    Panel3: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label8: TLabel;
    LinkOpenIE: ThLink;
    ButtonFlatCancelOp: TButtonFlat;
    TableExGroupClean: TTableEx;
    PanelGroupCleanTools: TPanel;
    ButtonFlatGetGroups: TButtonFlat;
    ButtonFlatLeaveGroup: TButtonFlat;
    TabSheetFriendClean: TTabSheet;
    TableExFriendClean: TTableEx;
    Panel4: TPanel;
    ButtonFlatGetFriendsDel: TButtonFlat;
    ButtonFlatFriendDel: TButtonFlat;
    RESTRequestFriends: TRESTRequest;
    ButtonFlatCleanFriends: TButtonFlat;
    LinkClearCache: ThLink;
    ImageListProfile: TImageList;
    ImageMask: TImage;
    RESTRequestFriendDel: TRESTRequest;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LinkRestorePassClick(Sender: TObject);
    procedure ButtonFlatLoginClick(Sender: TObject);
    procedure ButtonFlatCleanGroupsClick(Sender: TObject);
    procedure DrawPanelLoginMouseEnter(Sender: TObject);
    procedure DrawPanelLoginMouseLeave(Sender: TObject);
    procedure DrawPanelLoginPaint(Sender: TObject);
    procedure ButtonFlatLogoutClick(Sender: TObject);
    procedure DrawPanelLoginClick(Sender: TObject);
    procedure ButtonFlatReturnToMenuClick(Sender: TObject);
    procedure LinkOpenIEClick(Sender: TObject);
    procedure ButtonFlatCancelOpClick(Sender: TObject);
    procedure TableExGroupCleanGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatGetGroupsClick(Sender: TObject);
    procedure ButtonFlatLeaveGroupClick(Sender: TObject);
    procedure TableExFriendCleanGetData(FCol, FRow: Integer; var Value: string);
    procedure ButtonFlatGetFriendsDelClick(Sender: TObject);
    procedure ButtonFlatCleanFriendsClick(Sender: TObject);
    procedure LinkClearCacheClick(Sender: TObject);
    procedure ButtonFlatFriendDelClick(Sender: TObject);
  private
    FAuthForm: TFormOAuth2;
    FFirstName: string;
    FPhoto50: string;
    FProfileMenu: TFormPopup;
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    FDoCancelOperation: Boolean;
    FOpeartion: Boolean;
    FGroups: TGroups;
    FFriends: TFriends;
    procedure SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
    procedure GetProfile;
    procedure CancelOperation;
    function StartOperation: Boolean;
    procedure EndedOperation;
    function IsCancel: Boolean;
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
    end, PT.X, PT.Y + DrawPanelLogin.Height, [psShadow]);
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
    if ImageListProfile.Count > 0 then
      ImageListProfile.Draw(DrawPanelLogin.Canvas, R.Left, R.Top, 0, True);
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

procedure TFormMain.ButtonFlatReturnToMenuClick(Sender: TObject);
begin
  if FOpeartion then
  begin
    if MessageBox(Handle, 'Отменить текущую операцию?', 'Прерывание', MB_ICONQUESTION or MB_YESNOCANCEL or MB_DEFBUTTON3) <> ID_YES then
      Exit;
    CancelOperation;
  end;
  OpenMenu;
end;

function TFormMain.StartOperation: Boolean;
begin
  if FOpeartion then
    Exit(False);
  ButtonFlatCancelOp.Show;
  FDoCancelOperation := False;
  FOpeartion := True;
  Result := True;
end;

procedure TFormMain.TableExFriendCleanGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FFriends.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := FFriends[FRow].ID.ToString;
    1:
      Value := FFriends[FRow].Name;
    2:
      if FFriends[FRow].LastOnline <> 0 then
        Value := DateToStr(FFriends[FRow].LastOnline);
    3:
      Value := FFriends[FRow].AccState;
  end;
end;

procedure TFormMain.TableExGroupCleanGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FGroups.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := FGroups[FRow].ID.ToString;
    1:
      Value := FGroups[FRow].Name;
    2:
      if FGroups[FRow].LastMessage.DateTime <> 0 then
        Value := DateToStr(FGroups[FRow].LastMessage.DateTime);
    3:
      Value := FGroups[FRow].LastMessage.Text;
  end;
end;

procedure TFormMain.CancelOperation;
begin
  FDoCancelOperation := True;
end;

procedure TFormMain.EndedOperation;
begin
  FDoCancelOperation := False;
  FOpeartion := False;
  ButtonFlatCancelOp.Hide;
end;

function TFormMain.IsCancel: Boolean;
begin
  Application.ProcessMessages;
  Result := FDoCancelOperation;
end;

procedure TFormMain.ButtonFlatGetFriendsDelClick(Sender: TObject);
var
  JS: TJSONValue;
  JArr: TJSONArray;
  i, p: Integer;
  Item: TFriend;
begin
  if not StartOperation then
    Exit;
  try
    FFriends.BeginUpdate;
    FFriends.Clear;
    RESTRequestFriends.Execute;
    JS := RESTResponse.JSONValue;
    JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
    for i := 0 to JArr.Count - 1 do
    begin
      if IsCancel then
        Break;
      Item.Name := JArr.Items[i].GetValue<string>('first_name', '') + ' ' + JArr.Items[i].GetValue<string>('last_name', '');
      Item.ID := JArr.Items[i].GetValue<Integer>('id');
      Item.AccState := JArr.Items[i].GetValue<string>('deactivated', '');
      if Item.AccState = '' then
        Item.LastOnline := UnixToDateTime(JArr.Items[i].GetValue<Integer>('last_seen.time'), False)
      else
        Item.LastOnline := 0;
      FFriends.Add(Item);
    end;
    FFriends.Sort(TComparer<TFriend>.Construct(
      function(const Left, Right: TFriend): Integer
      begin
        Result := AnsiCompareStr(Right.AccState, Left.AccState);
        if Result = 0 then
          Result := CompareDate(Left.LastOnline, Right.LastOnline);
      end));
    FFriends.EndUpdate;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGetGroupsClick(Sender: TObject);
var
  JS: TJSONValue;
  JArr: TJSONArray;
  i, p: Integer;
  Item: TGroup;
  TS: Cardinal;
begin
  if not StartOperation then
    Exit;
  try
    FGroups.BeginUpdate;
    FGroups.Clear;
    RESTRequestGetSubs.Execute;
    JS := RESTResponse.JSONValue;
    JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
    for i := 0 to JArr.Count - 1 do
    begin
      if IsCancel then
        Break;
      Item.Name := JArr.Items[i].GetValue<string>('name');
      Item.ID := JArr.Items[i].GetValue<Integer>('id');
      FGroups.Add(Item);
    end;
    FGroups.EndUpdate;
    for i := 0 to FGroups.Count - 1 do
    begin
      if IsCancel then
        Break;
      RESTRequestGetWall.Params.ParameterByName('owner_id').Value := '-' + FGroups[i].ID.ToString;
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
        Item := FGroups[i];
        Item.LastMessage.DateTime := UnixToDateTime(JArr.Items[p].GetValue<Integer>('date'), False);
        Item.LastMessage.Text := JArr.Items[p].GetValue<string>('text');
        FGroups[i] := Item;
      end;
      TS := GetTickCount;
      while TS + 400 > GetTickCount do
        Application.ProcessMessages;
    end;

    FGroups.Sort(TComparer<TGroup>.Construct(
      function(const Left, Right: TGroup): Integer
      begin
        Result := CompareDate(Left.LastMessage.DateTime, Right.LastMessage.DateTime);
      end));
    FGroups.UpdateTable;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatCancelOpClick(Sender: TObject);
begin
  CancelOperation;
end;

procedure TFormMain.ButtonFlatCleanFriendsClick(Sender: TObject);
begin
  OpenPage(TabSheetFriendClean);
  if FFriends.Count <= 0 then
    ButtonFlatGetFriendsDelClick(nil);
end;

procedure TFormMain.ButtonFlatCleanGroupsClick(Sender: TObject);
begin
  OpenPage(TabSheetGroupClean);
  if FGroups.Count <= 0 then
    ButtonFlatGetGroupsClick(nil);
end;

procedure TFormMain.ButtonFlatFriendDelClick(Sender: TObject);
begin
  if not FFriends.IndexIn(TableExFriendClean.ItemIndex) then
    Exit;
  RESTRequestFriendDel.Params.ParameterByName('user_id').Value := FFriends[TableExFriendClean.ItemIndex].ID.ToString;
  RESTRequestFriendDel.Execute;
  if RESTResponse.JSONValue.GetValue<Integer>('response.success', 0) = 1 then
  begin
    FFriends.Delete(TableExFriendClean.ItemIndex);
    MessageBox(Handle, 'Удаление выполнено успешно!', '', MB_ICONINFORMATION or MB_OK);
  end
  else
    MessageBox(Handle, 'Произошла неизвестная ошибка', '', MB_ICONERROR or MB_OK);
end;

procedure TFormMain.ButtonFlatLeaveGroupClick(Sender: TObject);
begin
  if not FGroups.IndexIn(TableExGroupClean.ItemIndex) then
    Exit;
  RESTRequestGroupLeave.Params.ParameterByName('group_id').Value := FGroups[TableExGroupClean.ItemIndex].ID.ToString;
  RESTRequestGroupLeave.Execute;
  if RESTResponse.JSONValue.GetValue<Integer>('response', 0) = 1 then
  begin
    FGroups.Delete(TableExGroupClean.ItemIndex);
    MessageBox(Handle, 'Отписка выполнена успешно!', '', MB_ICONINFORMATION or MB_OK);
  end
  else
    MessageBox(Handle, 'Произошла неизвестная ошибка', '', MB_ICONERROR or MB_OK);
end;

procedure TFormMain.ButtonFlatLoginClick(Sender: TObject);
begin
  Auth;
end;

procedure TFormMain.ButtonFlatLogoutClick(Sender: TObject);
begin
  if Assigned(FProfileMenu) then
    FProfileMenu.Close;
  FAuthForm.DeleteCache;
  DrawPanelLogin.Hide;
  FFirstName := '';
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FGroups := TGroups.Create(TableExGroupClean);
  FFriends := TFriends.Create(TableExFriendClean);
  FAuthForm := TFormOAuth2.Create(nil);
  FAuthForm.OnAfterRedirect := AfterRedirect;
  for i := 0 to PageControlMain.PageCount - 1 do
    PageControlMain.Pages[i].TabVisible := False;
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FAuthForm.Free;
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
    BMP.SetSize(28, 28);
    try
      if Mem.Size > 0 then
      begin
        Mem.Position := 0;
        JPG.LoadFromStream(Mem);
        BMP.Canvas.StretchDraw(Rect(0, 0, 28, 28), JPG);
        ImageListProfile.Clear;
        ImageListProfile.Add(BMP, ImageMask.Picture.Bitmap);
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

procedure TFormMain.LinkClearCacheClick(Sender: TObject);
begin
  FAuthForm.DeleteCache;
  MessageBox(Handle, 'Кеш очищен. Авторизация сброшена.', 'Готово', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.LinkOpenIEClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'iexplore', 'https://m.vk.com/login', nil, SW_NORMAL);
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

