unit VKClean.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ComCtrls, JSON, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.Imaging.jpeg,
  Vcl.Samples.Spin, Vcl.WinXCalendars, System.Generics.Defaults,
  HGM.Controls.Labels, HGM.Button, HGM.Controls.PanelExt, HGM.Popup,
  HGM.Controls.VirtualTable, HGM.Controls.SpinEdit, HGM.Common.Utils, VK.OAuth2,
  VKClean.Groups, VKClean.Friends, VKClean.InnerLog, VKClean.Posts,
  VKClean.Photos, VKClean.Albums;

type
  TBackToElements = (beMenu = 0, beWelcome, beGroupMenu);

  TFormMain = class(TForm)
    RESTClient: TRESTClient;
    RESTRequestGetGroups: TRESTRequest;
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
    LabelPS: TLabel;
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
    PanelMainHead: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
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
    ImageListProfile: TImageList;
    ImageMask: TImage;
    RESTRequestFriendDel: TRESTRequest;
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
    RESTRequestGetPosts: TRESTRequest;
    DrawPanelPosts: TDrawPanel;
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
    PanelMenuClient: TPanel;
    PanelMenuLeft: TPanel;
    LinkBlog: ThLink;
    LinkAutor: ThLink;
    ButtonFlatCleanFriends: TButtonFlat;
    ButtonFlatCleanGroups: TButtonFlat;
    ButtonFlatCleanMainPage: TButtonFlat;
    ButtonFlat1: TButtonFlat;
    ButtonFlat3: TButtonFlat;
    ButtonFlat4: TButtonFlat;
    Shape3: TShape;
    Shape6: TShape;
    ButtonFlatPhotos: TButtonFlat;
    ScrollBoxMenuWall: TScrollBox;
    DrawPanelMenuWallDelApp: TDrawPanel;
    Label10: TLabel;
    Image2: TImage;
    PanelMenuBottom: TPanel;
    DrawPanelMenuWallMenu: TDrawPanel;
    DrawPanelMenuWallWalcome: TDrawPanel;
    ButtonFlatAppDel: TButtonFlat;
    Label13: TLabel;
    Label14: TLabel;
    ButtonFlat6: TButtonFlat;
    ButtonFlat7: TButtonFlat;
    Label15: TLabel;
    LinkAutor2: ThLink;
    ButtonFlat8: TButtonFlat;
    hLink1: ThLink;
    Image3: TImage;
    Image4: TImage;
    Label16: TLabel;
    ButtonFlat9: TButtonFlat;
    ButtonFlat10: TButtonFlat;
    ButtonFlatHelp: TButtonFlat;
    Shape2: TShape;
    PanelOwnerGroups: TPanel;
    ButtonFlatGroupID_Num: TButtonFlat;
    RESTRequestOwnerGroups: TRESTRequest;
    Shape4: TShape;
    Shape7: TShape;
    CheckBoxPostReply: TCheckBoxFlat;
    SpinEditPostReply: TlkSpinEdit;
    TabSheetPhotos: TTabSheet;
    DrawPanel1: TDrawPanel;
    LabelPhotosCaption: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    ButtonFlatPhotoClean: TButtonFlat;
    CheckBoxPhotosLikes: TCheckBoxFlat;
    SpinEditPhotosLikes: TlkSpinEdit;
    CheckBoxPhotosFromOnly: TCheckBoxFlat;
    CheckBoxPhotosDateOnly: TCheckBoxFlat;
    CalendarPickerPhotosDateS: TCalendarPicker;
    CalendarPickerPhotosDateE: TCalendarPicker;
    ButtonFlatPhotosDel: TButtonFlat;
    CheckBoxPhotosReply: TCheckBoxFlat;
    SpinEditPhotosReples: TlkSpinEdit;
    Panel5: TPanel;
    ButtonFlatGetPhotosInfo: TButtonFlat;
    RESTRequestGetPhotos: TRESTRequest;
    RESTRequestDelPhotos: TRESTRequest;
    CheckBoxPhotosAlbums: TCheckBoxFlat;
    ButtonFlatPhotosSelectAlbums: TButtonFlat;
    ButtonFlatCurrentOwner: TButtonFlat;
    PanelPhotosAlbums: TPanel;
    TableExPhotosAlbums: TTableEx;
    RESTRequestGetAlbums: TRESTRequest;
    RESTRequestGetSavedPhotos: TRESTRequest;
    DrawPanelAuth: TDrawPanel;
    Label4: TLabel;
    Label5: TLabel;
    LinkRestorePass: ThLink;
    ButtonFlatLogin: TButtonFlat;
    TabSheetLicense: TTabSheet;
    RichEditLicense: TRichEdit;
    ScrollBox1: TScrollBox;
    DrawPanel2: TDrawPanel;
    Label6: TLabel;
    Label19: TLabel;
    LinkLicense: ThLink;
    DrawPanelWarning: TDrawPanel;
    Label1: TLabel;
    Label8: TLabel;
    LinkClearCache: ThLink;
    LinkOpenIE: ThLink;
    DrawPanelDataProtect: TDrawPanel;
    Label18: TLabel;
    Label17: TLabel;
    TabSheetGroupMenu: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    hLink2: ThLink;
    hLink3: ThLink;
    ButtonFlatGroupUsers: TButtonFlat;
    ButtonFlatGroupWall: TButtonFlat;
    ButtonFlatGroupVideos: TButtonFlat;
    ButtonFlatGroupPhotos: TButtonFlat;
    ScrollBox2: TScrollBox;
    Panel9: TPanel;
    DrawPanel5: TDrawPanel;
    Label24: TLabel;
    Label25: TLabel;
    LinkOpenCurrentGroup: ThLink;
    ButtonFlat20: TButtonFlat;
    ButtonFlat22: TButtonFlat;
    Panel8: TPanel;
    ButtonFlatGroupMessage: TButtonFlat;
    Shape1: TShape;
    Shape8: TShape;
    RESTRequestGetGroupSub: TRESTRequest;
    RESTRequestGroupRemoveUser: TRESTRequest;
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
    procedure DrawPanelPostsPaint(Sender: TObject);
    procedure ButtonFlatWallCleanClick(Sender: TObject);
    procedure ButtonFlatPostDelClick(Sender: TObject);
    procedure hLink1Click(Sender: TObject);
    procedure ButtonFlat9Click(Sender: TObject);
    procedure ButtonFlat10Click(Sender: TObject);
    procedure ButtonFlatHelpClick(Sender: TObject);
    procedure ButtonFlatGroupID_NumClick(Sender: TObject);
    procedure ButtonFlatPhotoCleanClick(Sender: TObject);
    procedure ButtonFlatPhotosClick(Sender: TObject);
    procedure ButtonFlat4Click(Sender: TObject);
    procedure ButtonFlat3Click(Sender: TObject);
    procedure ButtonFlat1Click(Sender: TObject);
    procedure ButtonFlatPhotosDelClick(Sender: TObject);
    procedure ButtonFlatPhotosSelectAlbumsClick(Sender: TObject);
    procedure ButtonFlatGetPhotosInfoClick(Sender: TObject);
    procedure TableExPhotosAlbumsGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExPhotosAlbumsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExPhotosAlbumsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure LinkLicenseClick(Sender: TObject);
    procedure LinkOpenCurrentGroupClick(Sender: TObject);
    procedure ButtonFlatGroupWallClick(Sender: TObject);
    procedure ButtonFlatGroupUsersClick(Sender: TObject);
    procedure ButtonFlatGroupPhotosClick(Sender: TObject);
  private
    FAuthForm: TFormOAuth2;
    FFirstName: string;
    FPhoto50: string;
    FProfileMenu: TFormPopup;
    FAlbumsMenu: TFormPopup;
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    FDoCancelOperation: Boolean;
    FOpeartion: Boolean;
    FGroups: TGroups;
    FFriends: TFriends;
    FLog: TLogs;
    FPosts: TPosts;
    FPhotos: TPhotos;
    FAlbums: TAlbums;
    FOperProgress: Integer;
    FProgOffset: Integer;
    FProgressText: string;
    FFullName: string;
    FIsGroup: Boolean;
    FGroupID: Integer;
    FGroupName: string;
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
    procedure ProcError(ErrorCode: Integer);
    procedure FillOwnerGroups;
    procedure OpenWelcome;
    procedure Log(Text: string);
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write SetOnBeforeRedirect;
    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write SetOnAfterRedirect;
  public
    procedure OpenMenu;
    procedure OpenPage(Tab: TTabSheet; BackToWelcome: TBackToElements = beMenu);
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

procedure TFormMain.DrawPanelProgressPaint(Sender: TObject);
var
  R, PR: TRect;
  S: string;
  i: Integer;
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
  DrawPanelLogin.Color := ColorDarker(PanelHead.Color, 30);
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
  FIsGroup := False;
  ButtonFlatCurrentOwner.Visible := False;
  PanelWOMenu.Hide;
  PageControlMain.ActivePage := TabSheetMenu;
end;

procedure TFormMain.OpenPage(Tab: TTabSheet; BackToWelcome: TBackToElements);
begin
  ButtonFlatReturnToMenu.Tag := Ord(BackToWelcome);

  PanelWOMenu.Show;
  PageControlMain.ActivePage := Tab;
  if Tab = TabSheetWall then
  begin
    //FGroupName
  end;
  if Tab = TabSheetPhotos then
  begin
    CheckBoxPhotosFromOnly.Enabled := not FIsGroup;
  end;
  Application.ProcessMessages;
end;

procedure TFormMain.DrawPanelPostsPaint(Sender: TObject);
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
  case TBackToElements(ButtonFlatReturnToMenu.Tag) of
    beWelcome:
      OpenWelcome;
    beMenu:
      OpenMenu;
    beGroupMenu:
      OpenPage(TabSheetGroupMenu, beMenu);
  end;
end;

procedure TFormMain.ButtonFlatWallCleanClick(Sender: TObject);
const
  MaxCnt = 100;
var
  Offset, Cnt: Integer;
  JSArray: TJSONArray;
  Item: TPost;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := 'Анализ стены';
    if FIsGroup then
      RESTRequestGetPosts.Params.AddItem('owner_id', '-' + FGroupID.ToString)
    else
      RESTRequestGetPosts.Params.Delete('owner_id');
    RESTRequestGetPosts.Params.ParameterByName('count').Value := MaxCnt.ToString;
    FPosts.BeginUpdate;
    FPosts.Clear;
    repeat
      if IsCancel then
        Break;
      RESTRequestGetPosts.Params.ParameterByName('offset').Value := Offset.ToString;
      if not Execute(RESTRequestGetPosts) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      LabelWallCaption.Caption := 'Посты (' + Cnt.ToString + ')';
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.FromID := JSArray.Items[i].GetValue<Integer>('from_id');
        Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
        Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
        Item.Likes := JSArray.Items[i].GetValue<Integer>('likes.count');
        Item.Reposts := JSArray.Items[i].GetValue<Integer>('reposts.count');
        if CheckBoxPostLikes.Checked then
          if Item.Likes >= SpinEditPostLikes.Value then
            Continue;
        if CheckBoxPostReply.Checked then
          if Item.Reposts >= SpinEditPostReply.Value then
            Continue;
        if CheckBoxPostFromOnly.Checked then
          if Item.FromID = Item.OwnerID then
            Continue;
        if CheckBoxPostDateOnly.Checked then
          if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerPostDateStart.Date), DateOf(CalendarPickerPostDateEnd.Date), True) then
            Continue;
        FPosts.Add(Item);
      end;
      if Cnt <= MaxCnt then
        Break;
      Offset := Offset + MaxCnt;
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

procedure TFormMain.TableExPhotosAlbumsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FAlbums.IndexIn(ARow) then
    Exit;
  with TableExPhotosAlbums.Canvas do
  begin
    if FAlbums.Checked[ARow] then
      ImageList16.Draw(TableExPhotosAlbums.Canvas, Rect.Left, Rect.Top, 8, True)
    else
      ImageList16.Draw(TableExPhotosAlbums.Canvas, Rect.Left, Rect.Top, 9, True);
  end;
end;

procedure TFormMain.TableExPhotosAlbumsGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FAlbums.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FAlbums[FRow].Title + ' (' + FAlbums[FRow].Size.ToString + ')';
  end;
end;

procedure TFormMain.TableExPhotosAlbumsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FAlbums.IndexIn(TableExPhotosAlbums.ItemIndex) then
    Exit;
  FAlbums.Checked[TableExPhotosAlbums.ItemIndex] := not FAlbums.Checked[TableExPhotosAlbums.ItemIndex];
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
  JArr: TJSONArray;
  i: Integer;
  Item: TFriend;
  Ok: Boolean;
begin
  if not StartOperation then
    Exit;
  try
    FFriends.BeginUpdate;
    FFriends.Clear;
    if FIsGroup then
    begin
      RESTRequestGetGroupSub.Params.AddItem('group_id', FGroupID.ToString);
      Ok := Execute(RESTRequestGetGroupSub)
    end
    else
      Ok := Execute(RESTRequestFriends);
    if Ok then
    begin
      JArr := RESTResponse.JSONValue.GetValue<TJSONValue>('response.items') as TJSONArray;
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
    end;
    FFriends.EndUpdate;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.Log(Text: string);
var
  Item: TLog;
begin
  Item.DateTime := Now;
  Item.Text := Text;
  FLog.Add(Item);
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

procedure TFormMain.ProcError(ErrorCode: Integer);
var
  ErrStr: string;
begin
  case ErrorCode of
    1:
      ErrStr := 'Произошла неизвестная ошибка. Попробуйте повторить запрос позже.';
    2:
      ErrStr := 'Приложение выключено. Необходимо включить приложение в настройках https://vk.com/editapp?id={Ваш API_ID} или использовать тестовый режим (test_mode=1)';
    3:
      ErrStr := 'Передан неизвестный метод. Проверьте, правильно ли указано название вызываемого метода: https://vk.com/dev/methods.';
    4:
      ErrStr := 'Неверная подпись.';
    5:
      ErrStr := 'Авторизация пользователя не удалась. Убедитесь, что Вы используете верную схему авторизации.';
    6:
      ErrStr := 'Слишком много запросов в секунду. Задайте больший интервал между вызовами или используйте метод execute. Подробнее об ограничениях на частоту вызовов см. на странице https://vk.com/dev/api_requests.';
    7:
      ErrStr := 'Нет прав для выполнения этого действия. Проверьте, получены ли нужные права доступа при авторизации. Это можно сделать с помощью метода account.getAppPermissions.';
    8:
      ErrStr := 'Неверный запрос. Проверьте синтаксис запроса и список используемых параметров (его можно найти на странице с описанием метода).';
    9:
      ErrStr := 'Слишком много однотипных действий. Нужно сократить число однотипных обращений. Для более эффективной работы Вы можете использовать execute или JSONP.';
    10:
      ErrStr := 'Произошла внутренняя ошибка сервера. Попробуйте повторить запрос позже.';
    11:
      ErrStr := 'В тестовом режиме приложение должно быть выключено или пользователь должен быть залогинен. Выключите приложение в настройках https://vk.com/editapp?id={Ваш API_ID}';
    14:
      ErrStr := 'Требуется ввод кода с картинки (Captcha).';
    15:
      ErrStr := 'Доступ запрещён. Убедитесь, что Вы используете верные идентификаторы, и доступ к контенту для текущего пользователя есть в полной версии сайта.';
    16:
      ErrStr := 'Требуется выполнение запросов по протоколу HTTPS, т.к. пользователь включил настройку, требующую работу через безопасное соединение.'#13#10 + ' Чтобы избежать появления такой ошибки, в Standalone-приложении Вы можете предварительно проверять состояние этой настройки у пользователя методом account.getInfo.';
    17:
      ErrStr := 'Требуется валидация пользователя. Действие требует подтверждения — необходимо перенаправить пользователя на служебную страницу для валидации.';
    18:
      ErrStr := 'Страница удалена или заблокирована. Страница пользователя была удалена или заблокирована';
    20:
      ErrStr := 'Данное действие запрещено для не Standalone приложений. Если ошибка возникает несмотря на то, что Ваше приложение имеет тип Standalone, убедитесь, что при авторизации Вы используете redirect_uri=https://oauth.vk.com/blank.html.';
    21:
      ErrStr := 'Данное действие разрешено только для Standalone и Open API приложений.';
    23:
      ErrStr := 'Метод был выключен. Все актуальные методы ВК API, которые доступны в настоящий момент, перечислены здесь: https://vk.com/dev/methods.';
    24:
      ErrStr := 'Требуется подтверждение со стороны пользователя.';
    27:
      ErrStr := 'Ключ доступа сообщества недействителен.';
    28:
      ErrStr := 'Ключ доступа приложения недействителен.';
    29:
      ErrStr := 'Достигнут количественный лимит на вызов метода Подробнее об ограничениях на количество вызовов см. на странице https://vk.com/dev/data_limits';
    30:
      ErrStr := 'Профиль является приватным Информация, запрашиваемая о профиле, недоступна с используемым ключом доступа';
    33:
      ErrStr := 'Not implemented yet';
    100:
      ErrStr := 'Один из необходимых параметров был не передан или неверен. Проверьте список требуемых параметров и их формат на странице с описанием метода.';
    101:
      ErrStr := 'Неверный API ID приложения. Найдите приложение в списке администрируемых на странице https://vk.com/apps?act=settings и укажите в запросе верный API_ID (идентификатор приложения).';
    113:
      ErrStr := 'Неверный идентификатор пользователя. Убедитесь, что Вы используете верный идентификатор. Получить ID по короткому имени можно методом utils.resolveScreenName.';
    150:
      ErrStr := 'Неверный timestamp. Получить актуальное значение Вы можете методом utils.getServerTime.';
    200:
      ErrStr := 'Доступ к альбому запрещён. Убедитесь, что Вы используете верные идентификаторы (для пользователей owner_idположительный, для сообществ — отрицательный), и доступ к запрашиваемому контенту для текущего пользователя есть в полной версии сайта.';
    201:
      ErrStr := 'Доступ к аудио запрещён. Убедитесь, что Вы используете верные идентификаторы (для пользователей owner_idположительный, для сообществ — отрицательный), и доступ к запрашиваемому контенту для текущего пользователя есть в полной версии сайта.';
    203:
      ErrStr := 'Доступ к группе запрещён. Убедитесь, что текущий пользователь является участником или руководителем сообщества (для закрытых и частных групп и встреч).';
    300:
      ErrStr := 'Альбом переполнен. Перед продолжением работы нужно удалить лишние объекты из альбома или использовать другой альбом.';
    500:
      ErrStr := 'Действие запрещено. Вы должны включить переводы голосов в настройках приложения. Проверьте настройки приложения: https://vk.com/editapp?id={Ваш API_ID}&section=payments';
    600:
      ErrStr := 'Нет прав на выполнение данных операций с рекламным кабинетом.';
    603:
      ErrStr := 'Произошла ошибка при работе с рекламным кабинетом.';
    3300:
      ErrStr := 'Recaptcha needed';
    3301:
      ErrStr := 'Phone validation needed';
    3302:
      ErrStr := 'Password validation needed';
    3303:
      ErrStr := 'Otp app validation needed';
    3304:
      ErrStr := 'Email confirmation needed';
    3305:
      ErrStr := 'Assert votes';
  else
    ErrStr := 'Неизвестная ошибка';
  end;

  Error('VKError: ' + ErrStr);
end;

function TFormMain.Execute(Request: TRESTRequest): Boolean;
var
  JS: TJSONValue;
  CaptchaSID: string;
  CaptchaImg: string;
  CaptchaAns: string;
  ErrorCode: Integer;
begin
  Result := False;
  try
    Request.Execute;
    if RESTResponse.JSONValue.TryGetValue<TJSONValue>('error', JS) then
    begin
      ErrorCode := JS.GetValue<Integer>('error_code', -1);
      case ErrorCode of
        14:
          begin
            CaptchaSID := JS.GetValue<string>('captcha_sid', '');
            CaptchaImg := JS.GetValue<string>('captcha_img', '');
            if AskCapcha(CaptchaImg, CaptchaAns) then
            begin
              Request.Params.AddItem('captcha_sid', CaptchaSID);
              Request.Params.AddItem('captcha_key', CaptchaAns);
              Result := Execute(Request);
              Request.Params.Delete('captcha_sid');
              Request.Params.Delete('captcha_key');
              Exit;
            end
            else
              ProcError(ErrorCode);
          end;
        24:
          begin
            CaptchaAns := JS.GetValue<string>('confirmation_text', '');
            if MessageBox(Handle, PChar(CaptchaAns), 'Вопрос', MB_ICONQUESTION or MB_YESNO) = ID_YES then
            begin
              Request.Params.AddItem('confirm', '1');
              Result := Execute(Request);
              Request.Params.Delete('confirm');
              Exit;
            end
            else
              ProcError(ErrorCode);
          end;
      else
        ProcError(ErrorCode);
      end;
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
begin
  if not StartOperation then
    Exit;
  try
    FGroups.BeginUpdate;
    FGroups.Clear;
    if Execute(RESTRequestGetGroups) then
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

procedure TFormMain.ButtonFlatGetPhotosInfoClick(Sender: TObject);
var
  JSArr: TJSONArray;
  i, Cnt: Integer;
  Item: TAlbum;
begin
  if not StartOperation then
    Exit;
  ButtonFlatPhotosDel.Caption := 'Удалить фото';
  FAlbums.BeginUpdate;
  FAlbums.Clear;
  try
    if FIsGroup then
      RESTRequestGetPhotos.Params.AddItem('owner_id', '-' + FGroupID.ToString)
    else
      RESTRequestGetPhotos.Params.Delete('owner_id');
    RESTRequestGetPhotos.Params.ParameterByName('offset').Value := '0';
    RESTRequestGetPhotos.Params.ParameterByName('count').Value := '1';
    Cnt := 0;
    if FIsGroup then
      RESTRequestGetPhotos.Params.AddItem('owner_id', '-' + FGroupID.ToString)
    else
      RESTRequestGetPhotos.Params.Delete('owner_id');
    if Execute(RESTRequestGetPhotos) then
    begin
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
    end;
    if not FIsGroup then
    begin
      if Execute(RESTRequestGetSavedPhotos) then
      begin
        Cnt := Cnt + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
      end;
    end;
    WaitTime(400);
    LabelPhotosCaption.Caption := 'Фотографии (' + Cnt.ToString + ')';
    if FIsGroup then
      RESTRequestGetAlbums.Params.AddItem('owner_id', '-' + FGroupID.ToString)
    else
      RESTRequestGetAlbums.Params.Delete('owner_id');
    if Execute(RESTRequestGetAlbums) then
    begin
      JSArr := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArr.Count - 1 do
      begin
        Item.ID := JSArr.Items[i].GetValue<Integer>('id', -1);
        if Item.ID = -9000 then
          Continue; //Пропуск альбома "Фотографии со мной"
        Item.OwnerID := JSArr.Items[i].GetValue<Integer>('owner_id', -1);
        Item.Created := UnixToDateTime(JSArr.Items[i].GetValue<Integer>('created', 0), False);
        Item.Size := JSArr.Items[i].GetValue<Integer>('size', 0);
        Item.Title := JSArr.Items[i].GetValue<string>('title', '');
        FAlbums.Add(Item);
      end;
    end;
  finally
    EndedOperation;
    FAlbums.EndUpdate;
  end;
end;

procedure TFormMain.ButtonFlatGetWallInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  ButtonFlatPostDel.Caption := 'Удалить посты';
  try
    if FIsGroup then
      RESTRequestGetPosts.Params.AddItem('owner_id', '-' + FGroupID.ToString)
    else
      RESTRequestGetPosts.Params.Delete('owner_id');
    RESTRequestGetPosts.Params.ParameterByName('offset').Value := '0';
    RESTRequestGetPosts.Params.ParameterByName('count').Value := '1';
    Log('Запрос: ' + RESTRequestGetPosts.GetFullRequestURL);
    if Execute(RESTRequestGetPosts) then
    begin
      LabelWallCaption.Caption := 'Посты (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGroupID_NumClick(Sender: TObject);
begin
  FIsGroup := True;
  FGroupID := (Sender as TButtonFlat).Tag;
  FGroupName := (Sender as TButtonFlat).Caption;
  ButtonFlatCurrentOwner.Caption := FGroupName;
  ButtonFlatCurrentOwner.Visible := True;
  LinkOpenCurrentGroup.Caption := 'https://vk.com/public' + FGroupID.ToString;
  OpenPage(TabSheetGroupMenu);
end;

procedure TFormMain.ButtonFlatGroupPhotosClick(Sender: TObject);
begin
  OpenPage(TabSheetPhotos, beGroupMenu);
  ButtonFlatGetPhotosInfoClick(nil);
end;

procedure TFormMain.ButtonFlatGroupUsersClick(Sender: TObject);
begin
  OpenPage(TabSheetFriendClean, beGroupMenu);
  if FFriends.Count <= 0 then
    ButtonFlatGetFriendsDelClick(nil);
end;

procedure TFormMain.ButtonFlatGroupWallClick(Sender: TObject);
begin
  OpenPage(TabSheetWall, beGroupMenu);
  ButtonFlatGetWallInfoClick(nil);
end;

procedure TFormMain.ButtonFlatHelpClick(Sender: TObject);
begin
  WebOpen('https://vk.com/topic-184755622_39900323');
end;

procedure TFormMain.ButtonFlatPhotoCleanClick(Sender: TObject);
const
  MaxCnt = 200;
var
  Offset, Cnt, AllCnt: Integer;
  JSArray: TJSONArray;
  Item: TPhoto;
  i, Alb, r: Integer;
begin
  if not StartOperation then
    Exit;
  try
    FPhotos.BeginUpdate;
    FPhotos.Clear;
    AllCnt := 0;
    for r := 1 to 2 do
    begin
      Offset := 0;
      case r of
        1:
          begin
            FProgressText := 'Подсчёт фотографий';
            if FIsGroup then
              RESTRequestGetPhotos.Params.AddItem('owner_id', '-' + FGroupID.ToString)
            else
              RESTRequestGetPhotos.Params.Delete('owner_id');
            RESTRequestGetPhotos.Params.ParameterByName('count').Value := MaxCnt.ToString;
          end;
        2:
          begin
            FProgressText := 'Подсчёт сохранённых фотографий';
            if FIsGroup then
              Continue;
            RESTRequestGetSavedPhotos.Params.ParameterByName('count').Value := MaxCnt.ToString;
          end;
      end;
      repeat
        if IsCancel then
          Break;
        case r of
          1:
            begin
              RESTRequestGetPhotos.Params.ParameterByName('offset').Value := Offset.ToString;
              if not Execute(RESTRequestGetPhotos) then
                Break;
            end;
          2:
            begin
              RESTRequestGetSavedPhotos.Params.ParameterByName('offset').Value := Offset.ToString;
              if not Execute(RESTRequestGetSavedPhotos) then
                Break;
            end;
        end;

        Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
        OperProgress := Round(100 / Cnt * Offset);
        JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
        for i := 0 to JSArray.Count - 1 do
        begin
          Item.ID := JSArray.Items[i].GetValue<Integer>('id');
          Item.AlbumID := JSArray.Items[i].GetValue<Integer>('album_id');
          Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
          Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
          Item.Likes := JSArray.Items[i].GetValue<Integer>('likes.count');
          Item.Reposts := JSArray.Items[i].GetValue<Integer>('reposts.count');
          if CheckBoxPhotosLikes.Checked then
            if Item.Likes >= SpinEditPhotosLikes.Value then
              Continue;
          if CheckBoxPhotosReply.Checked then
            if Item.Reposts >= SpinEditPhotosReples.Value then
              Continue;
          if FIsGroup then
          begin
            if CheckBoxPhotosFromOnly.Checked then
              if Item.AlbumID = Item.OwnerID then
                Continue;
          end;
          if CheckBoxPhotosDateOnly.Checked then
            if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerPhotosDateS.Date), DateOf(CalendarPickerPhotosDateE.Date), True) then
              Continue;
          if CheckBoxPhotosAlbums.Checked then
          begin
            if FAlbums.FindCheckedID(Item.AlbumID) < 0 then
              Continue;
          end;
          FPhotos.Add(Item);
        end;
        if Cnt <= MaxCnt then
          Break;
        Offset := Offset + MaxCnt;
      until JSArray.Count <= 0;
      AllCnt := AllCnt + Cnt;
    end;
    LabelPhotosCaption.Caption := 'Фотографии (' + AllCnt.ToString + ')';
    FPhotos.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatPhotosDel.Caption := 'Удалить фото (' + FPhotos.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatPhotosClick(Sender: TObject);
begin
  OpenPage(TabSheetPhotos);
  ButtonFlatGetPhotosInfoClick(nil);
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
      if not Execute(RESTRequestDelPosts) then
        Break;
      WaitTime(400);
    end;
    ButtonFlatGetWallInfoClick(nil);
    ButtonFlatPostDel.TimedText('Готово', 3000);
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlat10Click(Sender: TObject);
begin
  WebOpen('https://vk.com/app6326142_-184755622');
end;

procedure TFormMain.ButtonFlatPhotosDelClick(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, PChar('Будет удалено фотографий: ' + FPhotos.Count.ToString + ' Продолжить?'), 'Внимание', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    for i := 0 to FPhotos.Count - 1 do
    begin
      OperProgress := Round(100 / FPhotos.Count * i);
      FProgressText := 'Удаление. Осталось времени ~' + IntToStr(Round(((FPhotos.Count - i) * 400) / (1000 * 60))) + ' мин.';
      if IsCancel then
        Break;
      RESTRequestDelPhotos.Params.AddItem('owner_id', FPhotos[i].OwnerID.ToString);
      RESTRequestDelPhotos.Params.AddItem('photo_id', FPhotos[i].ID.ToString);
      if not Execute(RESTRequestDelPhotos) then
        Break;
      WaitTime(400);
    end;
    ButtonFlatGetPhotosInfoClick(nil);
    ButtonFlatPhotosDel.TimedText('Готово', 3000);
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatPhotosSelectAlbumsClick(Sender: TObject);
var
  PT: TPoint;
begin
  PanelPhotosAlbums.Height := Min(TableExPhotosAlbums.DefaultRowHeight * TableExPhotosAlbums.ItemCount, 300);
  PT := CheckBoxPhotosAlbums.ClientToScreen(Point(0, 0));
  FAlbumsMenu := TFormPopup.CreatePopup(Self, PanelPhotosAlbums,
    procedure
    begin
      FAlbumsMenu := nil;
    end, PT.X, PT.Y + CheckBoxPhotosAlbums.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlat1Click(Sender: TObject);
begin
  MessageBox(Handle, 'В скором времени будет доступно!', 'В разработке', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.ButtonFlat3Click(Sender: TObject);
begin
  MessageBox(Handle, 'В скором времени будет доступно!', 'В разработке', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.ButtonFlat4Click(Sender: TObject);
begin
  MessageBox(Handle, 'В скором времени будет доступно!', 'В разработке', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.ButtonFlat9Click(Sender: TObject);
begin
  WebOpen('https://vk.com/app5727453_-184755622');
end;

procedure TFormMain.ButtonFlatAppDelClick(Sender: TObject);
begin
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

procedure TFormMain.ButtonFlatCloseLogClick(Sender: TObject);
begin
  PanelLog.Hide;
end;

procedure TFormMain.ButtonFlatFriendDelClick(Sender: TObject);
begin
  if not FFriends.IndexIn(TableExFriendClean.ItemIndex) then
    Exit;
  if FIsGroup then
  begin
    if MessageBox(Handle, 'Удалить подписчика?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
      Exit;
    RESTRequestGroupRemoveUser.Params.AddItem('group_id', FGroupID.ToString);
    RESTRequestGroupRemoveUser.Params.ParameterByName('user_id').Value := FFriends[TableExFriendClean.ItemIndex].ID.ToString;
    if not Execute(RESTRequestGroupRemoveUser) then
      Exit;
    if RESTResponse.JSONValue.GetValue<Integer>('response', 0) = 1 then
    begin
      FFriends.Delete(TableExFriendClean.ItemIndex);
      MessageBox(Handle, 'Удаление выполнено успешно!', '', MB_ICONINFORMATION or MB_OK);
    end;
  end
  else
  begin
    if MessageBox(Handle, 'Удалить из друзей?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
      Exit;
    RESTRequestFriendDel.Params.ParameterByName('user_id').Value := FFriends[TableExFriendClean.ItemIndex].ID.ToString;
    if not Execute(RESTRequestFriendDel) then
      Exit;
    if RESTResponse.JSONValue.GetValue<Integer>('response.success', 0) = 1 then
    begin
      FFriends.Delete(TableExFriendClean.ItemIndex);
      MessageBox(Handle, 'Удаление выполнено успешно!', '', MB_ICONINFORMATION or MB_OK);
    end;
  end;

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
  LabelAuthState.Caption := 'Загрузка...';
  OAuth2Authenticator.AccessToken := EmptyStr;
  OAuth2Authenticator.ClientID := cAppID;
  OAuth2Authenticator.ClientSecret := cAppKey;
  OAuth2Authenticator.ResponseType := TOAuth2ResponseType.rtTOKEN;
  OAuth2Authenticator.AuthorizationEndpoint := cEndPoint;
  PageControlMain.ActivePage := TabSheetAuth;
  Repaint;
  FAuthForm.ShowWithURL(PanelLogin, OAuth2Authenticator.AuthorizationRequestURI);
end;

procedure TFormMain.OpenWelcome;
begin
  PanelWOMenu.Hide;
  PageControlMain.ActivePage := TabSheetWelcome;
end;

procedure TFormMain.ButtonFlatLogoutClick(Sender: TObject);
begin
  if Assigned(FProfileMenu) then
    FProfileMenu.Close;
  if MessageBox(Handle, 'Выход произойдет и в браузере Internet Explorer, продолжить?' + #13#10#13#10 + 'Если хотите отключить приложение, выберите соответствующий пункт в Меню.', 'Внимание', MB_ICONWARNING or MB_YESNOCANCEL or MB_DEFBUTTON2) <> ID_YES then
    Exit;
  FAuthForm.DeleteCache('vk.com');
  DrawPanelLogin.Hide;
  FFriends.Clear;
  FGroups.Clear;
  FirstName := '';
  ImageListProfile.Clear;
  OpenWelcome;
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

procedure TFormMain.FillOwnerGroups;
var
  i: Integer;
  JSArray: TJSONArray;

  function CreateButton: TButtonFlat;
  begin
    Result := TButtonFlat.Create(Self);
    Result.Parent := PanelOwnerGroups;
    Result.AlignWithMargins := True;
    Result.Left := 3;
    Result.Top := 50;
    Result.Width := 157;
    Result.Height := 28;
    Result.Align := alTop;
  //Result.Caption := 'VK Cleaner by HGM';
    Result.Margins.SetBounds(3, 0, 3, 0);
    Result.Font.Color := $00735429;
    Result.FontOver.Color := $00735429;
    Result.FontDown.Color := $00735429;
    Result.ColorNormal := 15789805;
    Result.ColorOver := 15459809;
    Result.ColorPressed := 15789805;
    Result.IgnorBounds := True;
    Result.ImageIndentRight := 5;
    Result.ImageIndex := 0;
    Result.Images := ImageList16;
    Result.OnClick := ButtonFlatGroupID_NumClick;
    Result.RoundRectParam := 6;
    Result.Shape := stRoundRect;
    Result.ShowFocusRect := False;
    Result.TabOrder := 0;
    Result.TabStop := True;
    Result.TextFormat := [tfSingleLine, tfVerticalCenter, tfWordEllipsis];
  end;

begin
  while PanelOwnerGroups.ControlCount > 0 do
    PanelOwnerGroups.Controls[0].Free;
  if Execute(RESTRequestOwnerGroups) then
  begin
    JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
    for i := 0 to JSArray.Count - 1 do
    begin
      with CreateButton do
      begin
        Caption := JSArray.Items[i].GetValue<string>('name');
        Tag := JSArray.Items[i].GetValue<Integer>('id');
      end;
    end;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Caption := 'VK Cleaner ' + GetVersion;
  FProgOffset := 0;
  FLog := TLogs.Create(TableExLog);
  FGroups := TGroups.Create(TableExGroupClean);
  FFriends := TFriends.Create(TableExFriendClean);
  FPosts := TPosts.Create;
  FPhotos := TPhotos.Create;
  FAlbums := TAlbums.Create(TableExPhotosAlbums);
  FAuthForm := TFormOAuth2.Create(nil);
  FAuthForm.OnAfterRedirect := AfterRedirect;
  for i := 0 to PageControlMain.PageCount - 1 do
    PageControlMain.Pages[i].TabVisible := False;
  OperProgress := 0;
  OpenWelcome;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FAlbums.Clear;
  FAlbums.Free;
  FPhotos.Clear;
  FPhotos.Free;
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
  FirstName := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('first_name', '');
  FFullName := FirstName + ' ' + RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('nickname', '');
  FFullName := Trim(FFullName) + ' ' + RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('last_name', '');
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

procedure TFormMain.hLink1Click(Sender: TObject);
begin
  WebOpen('https://hemulgm.ru/vk-cleaner/');
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
  FAuthForm.DeleteCache('vk.com');
  MessageBox(Handle, 'Кэш очищен. Авторизация сброшена.', 'Готово', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.LinkLicenseClick(Sender: TObject);
var
  RS: TResourceStream;
begin
  RS := TResourceStream.Create(HInstance, 'LicenseRTF', RT_RCDATA);
  try
    if RS.Size > 0 then
    begin
      RS.Position := 0;
      RichEditLicense.Lines.LoadFromStream(RS);
    end;
  finally
    RS.Free;
  end;
  OpenPage(TabSheetLicense, beWelcome);
end;

procedure TFormMain.LinkOpenCurrentGroupClick(Sender: TObject);
begin
  WebOpen((Sender as ThLink).Caption);
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
      FillOwnerGroups;
      Repaint;
      OpenMenu;
    finally
      Params.Free;
    end;
    DoCloseWebView := True;
  end;
end;

end.

