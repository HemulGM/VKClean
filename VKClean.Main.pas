unit VKClean.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, VK.OAuth2, Vcl.StdCtrls, Vcl.ComCtrls, JSON, acPNG,
  Vcl.ExtCtrls, HGM.Controls.Labels, HGM.Button, System.ImageList, Vcl.ImgList,
  HGM.Controls.PanelExt, Vcl.Imaging.jpeg, HGM.Popup, VKClean.Groups, Vcl.Grids,
  HGM.Controls.VirtualTable, System.Generics.Defaults, VKClean.Friends,
  HGM.Controls.SpinEdit, VKClean.InnerLog, System.Net.HttpClient,
  Vcl.Samples.Spin, Vcl.WinXCalendars, VKClean.Posts;

type
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
    ImageList16: TImageList;
    LabelAuthState: TLabel;
    DrawPanelLogin: TDrawPanel;
    RESTRequestProfile: TRESTRequest;
    LabelFirstName: TLabel;
    PanelProfileMenu: TPanel;
    ButtonFlatLogout: TButtonFlat;
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
    LinkClearCache: ThLink;
    ImageListProfile: TImageList;
    ImageMask: TImage;
    RESTRequestFriendDel: TRESTRequest;
    PanelHint1: TPanel;
    Shape3: TShape;
    Label10: TLabel;
    ButtonFlatCloseHint1: TButtonFlat;
    Image2: TImage;
    Panel5: TPanel;
    ButtonFlatCleanFriends: TButtonFlat;
    ButtonFlatCleanGroups: TButtonFlat;
    Shape2: TShape;
    ButtonFlatAppDel: TButtonFlat;
    LinkBlog: ThLink;
    LinkAutor: ThLink;
    Shape4: TShape;
    ButtonFlatCleanMainPage: TButtonFlat;
    PanelLog: TPanel;
    Shape5: TShape;
    Panel7: TPanel;
    ButtonFlatCloseLog: TButtonFlat;
    Label9: TLabel;
    TableExLog: TTableEx;
    TabSheetWall: TTabSheet;
    TimerAnimate: TTimer;
    DrawPanelProgress: TDrawPanel;
    ButtonFlatOpenGroup: TButtonFlat;
    Panel6: TPanel;
    ButtonFlatGetWallInfo: TButtonFlat;
    ButtonFlat2: TButtonFlat;
    RESTRequestGetPosts: TRESTRequest;
    Panel8: TDrawPanel;
    LabelWallCaption: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ButtonFlatWallClean: TButtonFlat;
    CheckBoxPostLikes: TCheckBoxFlat;
    SpinEditPostLikes: TlkSpinEdit;
    CheckBoxPostFromOnly: TCheckBoxFlat;
    CheckBoxPostDateOnly: TCheckBoxFlat;
    CalendarPickerPostDateStart: TCalendarPicker;
    CalendarPickerPostDateEnd: TCalendarPicker;
    ButtonFlatPostDel: TButtonFlat;
    RESTRequestDelPosts: TRESTRequest;
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
    procedure ButtonFlatAppDelClick(Sender: TObject);
    procedure ButtonFlatCloseHint1Click(Sender: TObject);
    procedure LinkBlogClick(Sender: TObject);
    procedure LinkAutorClick(Sender: TObject);
    procedure DrawPanelProgressPaint(Sender: TObject);
    procedure lkSpinEdit1Change(Sender: TObject);
    procedure ButtonFlatCloseLogClick(Sender: TObject);
    procedure TableExLogGetData(FCol, FRow: Integer; var Value: string);
    procedure TimerAnimateTimer(Sender: TObject);
    procedure ButtonFlatOpenGroupClick(Sender: TObject);
    procedure ButtonFlatCleanMainPageClick(Sender: TObject);
    procedure ComboBoxGiftUsersMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
    procedure ButtonFlatGetWallInfoClick(Sender: TObject);
    procedure Panel8Paint(Sender: TObject);
    procedure ButtonFlatWallCleanClick(Sender: TObject);
    procedure ButtonFlatPostDelClick(Sender: TObject);
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
    FLog: TLogs;
    FPosts: TPosts;
    FOperProgress: Integer;
    FProgOffset: Integer;
    FProgressText: string;
    procedure SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
    procedure GetProfile;
    procedure CancelOperation;
    function StartOperation: Boolean;
    procedure EndedOperation;
    function IsCancel: Boolean;
    procedure SetFirstName(const Value: string);
    procedure SetOperProgress(const Value: Integer);
    function Execute(Request: TRESTRequest): Boolean;
    procedure Error(Text: string);
    function AskCapcha(const CapchaImg: string; var Answer: string): Boolean;
    procedure WebOpen(URL: string);
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write SetOnBeforeRedirect;
    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write SetOnAfterRedirect;
  public
    procedure OpenMenu;
    procedure Auth;
    procedure OpenPage(Tab: TTabSheet);
    property FirstName: string read FFirstName write SetFirstName;
    property OperProgress: Integer read FOperProgress write SetOperProgress;
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

function DownloadURL(URL: string): TMemoryStream;

implementation

uses
  DateUtils, ShellAPI, Math, REST.Utils, VKClean.Captcha;

{$R *.dfm}

procedure WaitTime(MS: Cardinal);
var
  TS: Cardinal;
begin

  TS := GetTickCount;
  while TS + MS > GetTickCount do
    Application.ProcessMessages;
end;

function DownloadURL(URL: string): TMemoryStream;
var
  HTTP: THTTPClient;
begin
  Result := TMemoryStream.Create;
  HTTP := THTTPClient.Create;
  try
    try
      HTTP.ResponseTimeout := 1000;
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

procedure TFormMain.DrawPanelProgressPaint(Sender: TObject);
var
  R, PR: TRect;
  S: string;
  i, cnt: Integer;
begin
  with DrawPanelProgress.Canvas do
  begin
    R := DrawPanelProgress.ClientRect;
    //Общий фон
    Brush.Style := bsSolid;
    Brush.Color := Color;
    FillRect(R);
    //Пустой прогресс бар
    Brush.Color := $00FCFCFA;
    Pen.Color := $00E6DACF;
    RoundRect(R.Left, R.Top, R.Right, R.Bottom, 5, 5);
    //Прогресс
    Brush.Color := $00EADED3;
    PR := R;
    PR.Inflate(-1, -1);
    PR.Width := Round((PR.Width / 100) * FOperProgress);
    for i := -60 to PR.Width do
    begin
      if i mod 20 = 0 then
        if Pen.Color = $00F0E6DD then
          Pen.Color := $00EADED3
        else
          Pen.Color := $00F0E6DD;

      MoveTo(i + FProgOffset, PR.Bottom - 1);
      LineTo(i + 20 + FProgOffset, PR.Top - 1);
    end;
    if FOperProgress < 100 then
    begin
      PR := R;
      PR.Inflate(-1, -1);
      PR.Left := Round((PR.Width / 100) * FOperProgress);
      Brush.Color := $00FCFCFA;
      FillRect(PR);
    end;
    //Обводка
    Pen.Color := $00E6DACF;
    Brush.Style := bsClear;
    RoundRect(R.Left, R.Top, R.Right, R.Bottom, 5, 5);
    S := FProgressText + ' ' + FOperProgress.ToString + '%';
    Font.Color := $00A88563;
    Font.Size := 9;
    TextRect(R, S, [tfSingleLine, tfCenter, tfVerticalCenter]);
  end;
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
  Application.ProcessMessages;
end;

procedure TFormMain.Panel8Paint(Sender: TObject);
var
  Panel: TDrawPanel absolute Sender;
begin
  with Panel.Canvas do
  begin
    Brush.Color := Color;
    FillRect(Panel.ClientRect);
    Pen.Color := $00E8E4E3;
    Brush.Color := clWhite;
    RoundRect(Panel.ClientRect, 5, 5);
  end;
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

procedure TFormMain.ButtonFlatWallCleanClick(Sender: TObject);
var
  Offset, Cnt: Integer;
  JS: TJSONValue;
  JSArray: TJSONArray;
  Item: TPost;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := 'Анализ стены';
    RESTRequestGetPosts.Params.ParameterByName('count').Value := '100';
    FPosts.BeginUpdate;
    FPosts.Clear;
    repeat
      if IsCancel then
        Break;
      RESTRequestGetPosts.Params.ParameterByName('offset').Value := Offset.ToString;
      if not Execute(RESTRequestGetPosts) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.FromID := JSArray.Items[i].GetValue<Integer>('from_id');
        Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
        Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
        Item.Likes := JSArray.Items[i].GetValue<Integer>('likes.count');
        if CheckBoxPostLikes.Checked then
          if Item.Likes >= SpinEditPostLikes.Value then
            Continue;
        if CheckBoxPostFromOnly.Checked then
          if Item.FromID = Item.OwnerID then
            Continue;
        if CheckBoxPostDateOnly.Checked then
          if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerPostDateStart.Date), DateOf(CalendarPickerPostDateEnd.Date), True) then
            Continue;
        FPosts.Add(Item);
      end;
      Offset := Offset + 100;
    until JSArray.Count <= 0;
    FPosts.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatPostDel.Caption := 'Удалить посты (' + FPosts.Count.ToString + ')';
end;

function TFormMain.StartOperation: Boolean;
begin
  if FOpeartion then
    Exit(False);
  ButtonFlatCancelOp.Show;
  DrawPanelProgress.Show;
  FDoCancelOperation := False;
  FOpeartion := True;
  FProgressText := 'Выполнено';
  OperProgress := 0;
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

procedure TFormMain.TableExLogGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FLog.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := DateTimeToStr(FLog[FRow].DateTime);
    1:
      Value := FLog[FRow].Text;
  end;
end;

procedure TFormMain.TimerAnimateTimer(Sender: TObject);
begin
  FProgOffset := FProgOffset + 1;
  if FProgOffset = 40 then
    FProgOffset := 0;
  DrawPanelProgress.Repaint;
end;

procedure TFormMain.CancelOperation;
begin
  FDoCancelOperation := True;
end;

procedure TFormMain.ComboBoxGiftUsersMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
begin
  Height := 26;
end;

procedure TFormMain.EndedOperation;
begin
  OperProgress := 100;
  FDoCancelOperation := False;
  FOpeartion := False;
  ButtonFlatCancelOp.Hide;
  DrawPanelProgress.Hide;
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
    OperProgress := 10;
    for i := 0 to JArr.Count - 1 do
    begin
      OperProgress := Round(80 / FGroups.Count * i) + 10;
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

procedure TFormMain.Error(Text: string);
var
  Item: TLog;
begin
  Item.DateTime := Now;
  Item.Text := Text;
  FLog.Add(Item);
  if not PanelLog.Visible then
    PanelLog.Show;
  MessageBox(Handle, PChar(Text), 'Ошибка', MB_ICONSTOP or MB_OK);
end;

function TFormMain.AskCapcha(const CapchaImg: string; var Answer: string): Boolean;
begin
  Result := TFormCaptcha.Execute(CapchaImg, Answer);
end;

function TFormMain.Execute(Request: TRESTRequest): Boolean;
var
  JS: TJSONValue;
  CaptchaSID: string;
  CaptchaImg: string;
  CaptchaAns: string;
begin
  Result := False;
  try
    Request.Execute;
    if RESTResponse.JSONValue.TryGetValue<TJSONValue>('error', JS) then
    begin
      case JS.GetValue<Integer>('error_code', -1) of
        14:
          begin
            CaptchaSID := JS.GetValue<string>('captcha_sid', '');
            CaptchaImg := JS.GetValue<string>('captcha_img', '');
            if AskCapcha(CaptchaImg, CaptchaAns) then
            begin
              Request.Params.AddHeader('captcha_sid', CaptchaSID);
              Request.Params.AddHeader('captcha_key', CaptchaAns);
              Result := Execute(Request);
              Request.Params.Delete('captcha_sid');
              Request.Params.Delete('captcha_key');
              Exit;
            end;
          end;
        24:
          begin
            CaptchaAns := JS.GetValue<string>('confirmation_text', '');
            if MessageBox(Handle, PChar(CaptchaAns), 'Вопрос', MB_ICONQUESTION or MB_YESNO) = ID_YES then
            begin
              Request.Params.AddHeader('confirm', '1');
              Result := Execute(Request);
              Request.Params.Delete('confirm');
              Exit;
            end;
          end;
      end;

      Error(JS.GetValue<string>('error_msg', 'Неизвестная ошибка'));
      Exit(False);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Error(E.Message);
    end;
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
    if Execute(RESTRequestGetSubs) then
    begin
      JS := RESTResponse.JSONValue;
      JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
      for i := 0 to JArr.Count - 1 do
      begin
        if IsCancel then
          Break;
        Item.Name := JArr.Items[i].GetValue<string>('name');
        Item.ID := JArr.Items[i].GetValue<Integer>('id');
        Item.ScreenName := JArr.Items[i].GetValue<string>('screen_name');
        Item.LastMessage.DateTime := 0;
        FGroups.Add(Item);
      end;
      FGroups.EndUpdate;
      OperProgress := 10;
      for i := 0 to FGroups.Count - 1 do
      begin
        OperProgress := Round(80 / FGroups.Count * i) + 10;
        if IsCancel then
          Break;
        RESTRequestGetWall.Params.ParameterByName('owner_id').Value := '-' + FGroups[i].ID.ToString;
        RESTRequestGetWall.Execute;
        JS := RESTResponse.JSONValue;
        JArr := JS.GetValue<TJSONValue>('response.items') as TJSONArray;
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
        WaitTime(400);
      end;

      FGroups.Sort(TComparer<TGroup>.Construct(
        function(const Left, Right: TGroup): Integer
        begin
          Result := CompareDate(Left.LastMessage.DateTime, Right.LastMessage.DateTime);
        end));
    end;
    FGroups.UpdateTable;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGetWallInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  try
    RESTRequestGetPosts.Params.ParameterByName('offset').Value := '0';
    RESTRequestGetPosts.Params.ParameterByName('count').Value := '1';
    if Execute(RESTRequestGetPosts) then
    begin
      LabelWallCaption.Caption := 'Посты (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatPostDelClick(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, PChar('Будет удалено записей: ' + FPosts.Count.ToString + ' Продолжить?'), 'Внимание', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    for i := 0 to FPosts.Count - 1 do
    begin
      OperProgress := Round(100 / FPosts.Count * i);
      FProgressText := 'Удаление. Осталось времени ~' + IntToStr(Round(((FPosts.Count - i) * 400) / (1000 * 60))) + ' мин.';
      if IsCancel then
        Break;
      RESTRequestDelPosts.Params.ParameterByName('owner_id').Value := FPosts[i].OwnerID.ToString;
      RESTRequestDelPosts.Params.ParameterByName('post_id').Value := FPosts[i].ID.ToString;
      if not Execute(RESTRequestDelPosts) then Break;
      WaitTime(400);
    end;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatAppDelClick(Sender: TObject);
begin
  PanelHint1.Show;
  Application.ProcessMessages;
  WebOpen('https://vk.com/settings?act=apps');
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

procedure TFormMain.ButtonFlatCleanMainPageClick(Sender: TObject);
begin
  OpenPage(TabSheetWall);
  ButtonFlatGetWallInfoClick(nil);
end;

procedure TFormMain.ButtonFlatCloseHint1Click(Sender: TObject);
begin
  PanelHint1.Hide;
end;

procedure TFormMain.ButtonFlatCloseLogClick(Sender: TObject);
begin
  PanelLog.Hide;
end;

procedure TFormMain.ButtonFlatFriendDelClick(Sender: TObject);
begin
  if not FFriends.IndexIn(TableExFriendClean.ItemIndex) then
    Exit;
  if MessageBox(Handle, 'Удалить из друзей?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
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
  if MessageBox(Handle, 'Отписаться от группы?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
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
  if MessageBox(Handle, 'Выход произойдет и в браузере Internet Explorer, продолжить?' + #13#10#13#10 + 'Если хотите отключить приложение, выберите соответствующий пункт в Меню.', 'Внимание', MB_ICONWARNING or MB_YESNOCANCEL or MB_DEFBUTTON2) <> ID_YES then
    Exit;
  FAuthForm.DeleteCache;
  DrawPanelLogin.Hide;
  FFriends.Clear;
  FGroups.Clear;
  FirstName := '';
  ImageListProfile.Clear;
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.WebOpen(URL: string);
begin
  ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_NORMAL);
end;

procedure TFormMain.ButtonFlatOpenGroupClick(Sender: TObject);
begin
  if not FGroups.IndexIn(TableExGroupClean.ItemIndex) then
    Exit;
  WebOpen('https://vk.com/' + FGroups[TableExGroupClean.ItemIndex].ScreenName);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FProgOffset := 0;
  FLog := TLogs.Create(TableExLog);
  FGroups := TGroups.Create(TableExGroupClean);
  FFriends := TFriends.Create(TableExFriendClean);
  FPosts := TPosts.Create;
  FAuthForm := TFormOAuth2.Create(nil);
  FAuthForm.OnAfterRedirect := AfterRedirect;
  for i := 0 to PageControlMain.PageCount - 1 do
    PageControlMain.Pages[i].TabVisible := False;
  PageControlMain.ActivePage := TabSheetWelcome;
  OperProgress := 0;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FPosts.Clear;
  FPosts.Free;
  FGroups.Clear;
  FGroups.Free;
  FFriends.Clear;
  FFriends.Free;
  FLog.Clear;
  FLog.Free;
  FAuthForm.Free;
end;

procedure TFormMain.LinkRestorePassClick(Sender: TObject);
begin
  WebOpen('https://vk.com/restore');
end;

procedure TFormMain.lkSpinEdit1Change(Sender: TObject);
begin
  DrawPanelProgress.Repaint;
end;

procedure TFormMain.SetFirstName(const Value: string);
begin
  FFirstName := Value;
  LabelFirstName.Caption := Value;
end;

procedure TFormMain.SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
begin
  FOnAfterRedirect := Value;
end;

procedure TFormMain.SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
begin
  FOnBeforeRedirect := Value;
end;

procedure TFormMain.SetOperProgress(const Value: Integer);
begin
  FOperProgress := Min(Max(Value, 0), 100);
  DrawPanelProgress.Repaint;
end;

procedure TFormMain.GetProfile;
var
  Mem: TMemoryStream;
  JPG: TJPEGImage;
  BMP: TBitmap;
begin
  RESTRequestProfile.Execute;
  FirstName := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('first_name', 'Скрыто');
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

procedure TFormMain.LinkAutorClick(Sender: TObject);
begin
  WebOpen('https://vk.com/hemulgm');
end;

procedure TFormMain.LinkBlogClick(Sender: TObject);
begin
  WebOpen('https://vk.com/vk_cleaner_hgm');
end;

procedure TFormMain.LinkClearCacheClick(Sender: TObject);
begin
  FAuthForm.DeleteCache;
  MessageBox(Handle, 'Кэш очищен. Авторизация сброшена.', 'Готово', MB_ICONINFORMATION or MB_OK);
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
  i := Pos('#access_token=', AURL);
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

