unit VKClean.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ComCtrls, JSON, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.Imaging.jpeg,
  Vcl.Samples.Spin, Vcl.WinXCalendars, System.Generics.Defaults, System.Types,
  HGM.Controls.Labels, HGM.Button, HGM.Controls.PanelExt, HGM.Popup,
  System.UITypes, HGM.Controls.VirtualTable, HGM.Controls.SpinEdit,
  HGM.Common.Utils, VK.OAuth2, VKClean.Groups, VKClean.Friends, VKClean.InnerLog,
  VKClean.Posts, VKClean.RequestConstruct, VKClean.Photos, VKClean.Albums,
  VKClean.Videos, VKClean.DocTypes, VKClean.Docs, VKClean.Profile, Vcl.Menus,
  VKClean.Fave, VKClean.Notes, VKClean.Board, VKClean.Market,
  VKClean.MarketTypes;

type
  TBackToElements = (beMenu = 0, beWelcome, beGroupMenu);

  TFormMain = class(TForm)
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    OAuth2Authenticator: TOAuth2Authenticator;
    PanelHead: TPanel;
    Image1: TImage;
    PageControlMain: TPageControl;
    TabSheetAuth: TTabSheet;
    TabSheetGroups: TTabSheet;
    PanelLogin: TPanel;
    TabSheetWelcome: TTabSheet;
    LabelPS: TLabel;
    Label7: TLabel;
    TabSheetMenu: TTabSheet;
    ImageList16: TImageList;
    LabelAuthState: TLabel;
    DrawPanelLogin: TDrawPanel;
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
    TabSheetFriends: TTabSheet;
    TableExFriendClean: TTableEx;
    Panel4: TPanel;
    ButtonFlatGetFriendsDel: TButtonFlat;
    ButtonFlatFriendDel: TButtonFlat;
    ImageListProfile: TImageList;
    ImageMask: TImage;
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
    DrawPanelPostsClean: TDrawPanel;
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
    PanelMenuClient: TPanel;
    PanelMenuLeft: TPanel;
    ButtonFlatCleanFriends: TButtonFlat;
    ButtonFlatCleanGroups: TButtonFlat;
    ButtonFlatCleanMainPage: TButtonFlat;
    ButtonFlatDocs: TButtonFlat;
    ButtonFlatFave: TButtonFlat;
    ButtonFlatVideos: TButtonFlat;
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
    Shape4: TShape;
    Shape7: TShape;
    CheckBoxPostReply: TCheckBoxFlat;
    SpinEditPostReply: TlkSpinEdit;
    TabSheetPhotos: TTabSheet;
    DrawPanelPhotosClean: TDrawPanel;
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
    CheckBoxPhotosAlbums: TCheckBoxFlat;
    ButtonFlatPhotosSelectAlbums: TButtonFlat;
    ButtonFlatCurrentOwner: TButtonFlat;
    PanelPhotosAlbums: TPanel;
    TableExPhotosAlbums: TTableEx;
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
    ScrollBoxGroupMenu: TScrollBox;
    Panel9: TPanel;
    DrawPanel5: TDrawPanel;
    Label24: TLabel;
    Label25: TLabel;
    LinkOpenCurrentGroup: ThLink;
    ButtonFlat20: TButtonFlat;
    ButtonFlat22: TButtonFlat;
    Panel8: TPanel;
    ButtonFlatGroupBoard: TButtonFlat;
    Shape8: TShape;
    TabSheetVideo: TTabSheet;
    DrawPanelVideosClean: TDrawPanel;
    LabelVideosCaption: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    ButtonFlatVideosCalc: TButtonFlat;
    CheckBoxVideoLikes: TCheckBoxFlat;
    SpinEditVideoLikes: TlkSpinEdit;
    CheckBoxVideoFromOnly: TCheckBoxFlat;
    CheckBoxVideoDate: TCheckBoxFlat;
    CalendarPickerVideoDateS: TCalendarPicker;
    CalendarPickerVideoDateE: TCalendarPicker;
    ButtonFlatVideosDelete: TButtonFlat;
    CheckBoxVideoReply: TCheckBoxFlat;
    SpinEditVideoReply: TlkSpinEdit;
    CheckBoxVideoAlbums: TCheckBoxFlat;
    ButtonFlatVideoAlbumsSelect: TButtonFlat;
    Panel10: TPanel;
    ButtonFlatGetVideosInfo: TButtonFlat;
    PanelVideoAlbums: TPanel;
    TableExVideosAlbums: TTableEx;
    TabSheetAutoClean: TTabSheet;
    DrawPanelFullClean: TDrawPanel;
    Label22: TLabel;
    Shape13: TShape;
    Shape14: TShape;
    CheckBoxCleanWall: TCheckBoxFlat;
    ButtonFlat4: TButtonFlat;
    CheckBoxCleanFriends: TCheckBoxFlat;
    CheckBoxCleanGroups: TCheckBoxFlat;
    CheckBoxCleanPhotos: TCheckBoxFlat;
    CheckBoxCleanVideos: TCheckBoxFlat;
    CheckBoxCleanAudios: TCheckBoxFlat;
    CheckBoxCleanMarket: TCheckBoxFlat;
    CheckBoxCleanFaves: TCheckBoxFlat;
    CheckBoxCleanDocs: TCheckBoxFlat;
    DrawPanel6: TDrawPanel;
    Label27: TLabel;
    CheckBoxCleanSubs: TCheckBoxFlat;
    CheckBoxCleanBoards: TCheckBoxFlat;
    DrawPanel7: TDrawPanel;
    ButtonFlatAutoClean: TButtonFlat;
    DrawPanel8: TDrawPanel;
    ButtonFlatAutoCleanGroup: TButtonFlat;
    TabSheetDocs: TTabSheet;
    DrawPanelDocClean: TDrawPanel;
    LabelDocsCaption: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    ButtonFlatDocsCalc: TButtonFlat;
    CheckBoxDocsDate: TCheckBoxFlat;
    CalendarPickerDocsDateS: TCalendarPicker;
    CalendarPickerDocsDateE: TCalendarPicker;
    ButtonFlatDocsDel: TButtonFlat;
    PanelDocsTools: TPanel;
    ButtonFlatDocsGetInfo: TButtonFlat;
    PanelDocTypes: TPanel;
    TableExDocTypes: TTableEx;
    CheckBoxDocTypes: TCheckBoxFlat;
    ButtonFlatDocTypes: TButtonFlat;
    ButtonFlatGroupDocs: TButtonFlat;
    ButtonFlatNotes: TButtonFlat;
    ButtonFlatMarket: TButtonFlat;
    ButtonFlatMusic: TButtonFlat;
    ButtonFlatMessages: TButtonFlat;
    ButtonFlatGroupAudio: TButtonFlat;
    Panel12: TPanel;
    LinkBlog: ThLink;
    LinkAutor: ThLink;
    LinkLog: ThLink;
    TabSheetMessages: TTabSheet;
    DrawPanelMessagesClean: TDrawPanel;
    LabelMessagesCaption: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Shape1: TShape;
    Shape17: TShape;
    ButtonFlat11: TButtonFlat;
    CheckBoxFlat12: TCheckBoxFlat;
    CalendarPicker1: TCalendarPicker;
    CalendarPicker2: TCalendarPicker;
    ButtonFlatMessagesDel: TButtonFlat;
    CheckBoxFlat13: TCheckBoxFlat;
    ButtonFlat13: TButtonFlat;
    Panel11: TPanel;
    ButtonFlatGetMessageInfo: TButtonFlat;
    Panel13: TPanel;
    TableExUsers: TTableEx;
    EditUserSelect: TEdit;
    CheckBoxFlat14: TCheckBoxFlat;
    PopupMenuLog: TPopupMenu;
    MenuItemLogCopy: TMenuItem;
    TabSheetFave: TTabSheet;
    DrawPanelFaveClean: TDrawPanel;
    LabelFaveCaption: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Shape18: TShape;
    Shape19: TShape;
    ButtonFlatFaveCalc: TButtonFlat;
    CheckBoxFaveDate: TCheckBoxFlat;
    CalendarPickerFaveDateS: TCalendarPicker;
    CalendarPickerFaveDateE: TCalendarPicker;
    ButtonFlatFaveDel: TButtonFlat;
    CheckBoxFaveTypes: TCheckBoxFlat;
    ButtonFlatFaveTypes: TButtonFlat;
    Panel14: TPanel;
    ButtonFlatFaveGetInfo: TButtonFlat;
    PanelFaveTypes: TPanel;
    TableExFaves: TTableEx;
    TabSheetNotes: TTabSheet;
    TabSheetBoard: TTabSheet;
    TabSheetMarket: TTabSheet;
    DrawPanelNotesClean: TDrawPanel;
    LabelNotesCaption: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    ButtonFlatNotesCalc: TButtonFlat;
    CheckBoxNotesDate: TCheckBoxFlat;
    CalendarPickerNotesDateS: TCalendarPicker;
    CalendarPickerNotesDateE: TCalendarPicker;
    ButtonFlatNotesDel: TButtonFlat;
    Panel15: TPanel;
    ButtonFlatGetNotesInfo: TButtonFlat;
    DrawPanelBoardClean: TDrawPanel;
    LabelBoardCaption: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    ButtonFlatBoardCalc: TButtonFlat;
    CheckBoxBoardDateCreate: TCheckBoxFlat;
    CalendarPickerBoardDateS: TCalendarPicker;
    CalendarPickerBoardDateE: TCalendarPicker;
    ButtonFlatBoardDel: TButtonFlat;
    Panel16: TPanel;
    ButtonFlatGetBoardInfo: TButtonFlat;
    TabSheetGroupMes: TTabSheet;
    Label39: TLabel;
    CheckBoxBoardOlded: TCheckBoxFlat;
    CalendarPickerBoardDateLast: TCalendarPicker;
    ButtonFlatGroupMessages: TButtonFlat;
    CheckBoxBoardClosed: TCheckBoxFlat;
    CheckBoxBoardComments: TCheckBoxFlat;
    SpinEditBoardComments: TlkSpinEdit;
    DrawPanelMarketClean: TDrawPanel;
    LabelMarketCaption: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Shape24: TShape;
    Shape25: TShape;
    ButtonFlatMarketCalc: TButtonFlat;
    CheckBoxProductDate: TCheckBoxFlat;
    CalendarPickerProductDateS: TCalendarPicker;
    CalendarPickerProductDateE: TCalendarPicker;
    ButtonFlatMarketDel: TButtonFlat;
    CheckBoxProductTypes: TCheckBoxFlat;
    ButtonFlatProductTypes: TButtonFlat;
    Panel17: TPanel;
    ButtonFlatGetMarketInfo: TButtonFlat;
    PanelProductTypes: TPanel;
    TableExProductTypes: TTableEx;
    ButtonFlatGroupMarket: TButtonFlat;
    CheckBoxProductAmount: TCheckBoxFlat;
    SpinEditProductAmount: TlkSpinEdit;
    ComboBoxProductAmountType: TComboBox;
    ButtonFlat1: TButtonFlat;
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
    procedure DrawPanelPostsCleanPaint(Sender: TObject);
    procedure ButtonFlatWallCleanClick(Sender: TObject);
    procedure ButtonFlatPostDelClick(Sender: TObject);
    procedure hLink1Click(Sender: TObject);
    procedure ButtonFlat9Click(Sender: TObject);
    procedure ButtonFlat10Click(Sender: TObject);
    procedure ButtonFlatHelpClick(Sender: TObject);
    procedure ButtonFlatGroupID_NumClick(Sender: TObject);
    procedure ButtonFlatPhotoCleanClick(Sender: TObject);
    procedure ButtonFlatPhotosClick(Sender: TObject);
    procedure ButtonFlatVideosClick(Sender: TObject);
    procedure ButtonFlatFaveClick(Sender: TObject);
    procedure ButtonFlatDocsClick(Sender: TObject);
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
    procedure ButtonFlatGetVideosInfoClick(Sender: TObject);
    procedure ButtonFlatVideosCalcClick(Sender: TObject);
    procedure ButtonFlatVideoAlbumsSelectClick(Sender: TObject);
    procedure TableExVideosAlbumsGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExVideosAlbumsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExVideosAlbumsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatVideosDeleteClick(Sender: TObject);
    procedure ButtonFlatAutoCleanClick(Sender: TObject);
    procedure ButtonFlatAutoCleanGroupClick(Sender: TObject);
    procedure ScrollBoxMenuWallMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxMenuWallMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure ButtonFlatDocsGetInfoClick(Sender: TObject);
    procedure ButtonFlatDocTypesClick(Sender: TObject);
    procedure TableExDocTypesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExDocTypesGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExDocTypesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatGroupDocsClick(Sender: TObject);
    procedure ButtonFlatDocsCalcClick(Sender: TObject);
    procedure ButtonFlatDocsDelClick(Sender: TObject);
    procedure ButtonFlatGroupVideosClick(Sender: TObject);
    procedure ButtonFlatGroupBoardClick(Sender: TObject);
    procedure ButtonFlatMusicClick(Sender: TObject);
    procedure LinkLogClick(Sender: TObject);
    procedure ButtonFlatGetMessageInfoClick(Sender: TObject);
    procedure ButtonFlatMessagesClick(Sender: TObject);
    procedure TableExLogMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MenuItemLogCopyClick(Sender: TObject);
    procedure TableExFavesGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExFavesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExFavesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatFaveTypesClick(Sender: TObject);
    procedure ButtonFlatFaveGetInfoClick(Sender: TObject);
    procedure ButtonFlatFaveCalcClick(Sender: TObject);
    procedure ButtonFlatMarketClick(Sender: TObject);
    procedure ButtonFlatNotesClick(Sender: TObject);
    procedure ButtonFlatFaveDelClick(Sender: TObject);
    procedure ButtonFlatGetNotesInfoClick(Sender: TObject);
    procedure ButtonFlatNotesCalcClick(Sender: TObject);
    procedure ButtonFlatNotesDelClick(Sender: TObject);
    procedure ButtonFlatGetBoardInfoClick(Sender: TObject);
    procedure ButtonFlatGroupMessagesClick(Sender: TObject);
    procedure ButtonFlatBoardCalcClick(Sender: TObject);
    procedure ButtonFlatBoardDelClick(Sender: TObject);
    procedure ButtonFlatGetMarketInfoClick(Sender: TObject);
    procedure TableExProductTypesGetData(FCol, FRow: Integer; var Value: string);
    procedure TableExProductTypesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure TableExProductTypesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
    procedure ButtonFlatProductTypesClick(Sender: TObject);
    procedure ButtonFlatGroupMarketClick(Sender: TObject);
    procedure ButtonFlatMarketCalcClick(Sender: TObject);
  private
    //����� � ������ �����������
    FAuthForm: TFormOAuth2;
    FOnBeforeRedirect: TOAuth2WebFormRedirectEvent;
    FOnAfterRedirect: TOAuth2WebFormRedirectEvent;
    //����������� ����
    FPopupMenu: TFormPopup;
    //�������� ��������
    FDoCancelOperation: Boolean;
    FOpeartion: Boolean;
    FOperProgress: Integer;
    FProgOffset: Integer;
    FProgressText: string;
    //������ �� ��
    FAlbums: TAlbums;
    FAlbumsVideos: TAlbums;
    FDocs: TDocs;
    FDocTypes: TDocTypes;
    FFriends: TFriends;
    FGroups: TGroups;
    FLog: TLogs;
    FPhotos: TPhotos;
    FPosts: TPosts;
    FProfile: TProfile;
    FVideos: TVideos;
    FFaveTypes: TFaveTypes;
    FFaves: TFaves;
    FNotes: TNotes;
    FBoards: TBoards;
    FProducts: TProducts;
    FProductTypes: TProductTypes;
    //������ ������ � ������� �� ������
    FIsGroup: Boolean;
    FGroupID: Integer;
    FGroupName: string;
    FGroupIsPage: Boolean;
    //���� ���������� ������� � ��
    FLastRequest: Cardinal;
    FStartRequest: Cardinal;
    FPartOfRequest: Cardinal;
    FRequests: Integer;
    function StartOperation: Boolean;
    procedure AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
    procedure EndedOperation;
    procedure FillOwnerGroups;
    procedure GetProfile;
    procedure OpenWelcome;
    procedure SetFirstName(const Value: string);
    procedure SetOnAfterRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure SetOnBeforeRedirect(const Value: TOAuth2WebFormRedirectEvent);
    procedure SetOperProgress(const Value: Integer);
    procedure OpenMenu;
    procedure GetGroupInfo;
    property OnAfterRedirect: TOAuth2WebFormRedirectEvent read FOnAfterRedirect write SetOnAfterRedirect;
    property OnBeforeRedirect: TOAuth2WebFormRedirectEvent read FOnBeforeRedirect write SetOnBeforeRedirect;
  public
    function AskCapcha(const CapchaImg: string; var Answer: string): Boolean;
    function Execute(Request: string; Params: array of TParam): Boolean; overload;
    function Execute(Request: TRESTRequest; FreeRequset: Boolean = False): Boolean; overload;
    function IsCancel: Boolean;
    procedure CancelOperation;
    procedure Error(Text: string);
    procedure Log(Text: string);
    procedure OpenPage(Tab: TTabSheet; BackToWelcome: TBackToElements = beMenu);
    procedure ProcError(ErrorCode: Integer);
    procedure WebOpen(URL: string);
    property OperProgress: Integer read FOperProgress write SetOperProgress;
  end;

const
  {$INCLUDE APPIDENT.inc} //� ���� ����� ��������� ������������������ ������� ����, ���� �� ������� ������� �� ����
  {
  cAppID = '5xxxxxx';
  cAppKey = 'xxxxxxxxxxxxxxxxxxxxxxxx';
  ��� ������, ���������� ��������� ������ standalone-���������� ��
  }
  cEndPoint = 'https://oauth.vk.com/authorize';

const
  RequestLimit = 3; //Round(1000 / 3) + 10; //�������� ����� ��������� 3 ������� � ������� + 10 �� ���������

var
  FormMain: TFormMain;

implementation

uses
  DateUtils, ShellAPI, Math, Clipbrd, REST.Utils, VKClean.Captcha;

{$R *.dfm}

procedure WaitTime(MS: Int64);
var
  TS: Cardinal;
begin
  if MS < 0 then
    Exit;
  if MS = 0 then
  begin
    Application.ProcessMessages;
    Exit;
  end;
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
    //����� ���
    Brush.Style := bsSolid;
    Brush.Color := Color;
    FillRect(R);
    //������ �������� ���
    Brush.Color := $00FCFCFA;
    Pen.Color := $00E6DACF;
    RoundRect(R.Left, R.Top, R.Right, R.Bottom, 5, 5);
    //��������
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
    //�������
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
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelProfileMenu,
    procedure
    begin
      FPopupMenu := nil;
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

procedure TFormMain.DrawPanelPostsCleanPaint(Sender: TObject);
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
    if MessageBox(Handle, '�������� ������� ��������?', '����������', MB_ICONQUESTION or MB_YESNOCANCEL or MB_DEFBUTTON3) <> ID_YES then
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
    FProgressText := '������ �����';
    FPosts.BeginUpdate;
    FPosts.Clear;
    repeat
      if IsCancel then
        Break;
      if not Execute('wall.get', [VkOwner(-FGroupID, not FIsGroup), VkCount(MaxCnt), VkOffset(Offset)]) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      LabelWallCaption.Caption := '������ (' + Cnt.ToString + ')';
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
  ButtonFlatPostDel.Caption := '������� ������ (' + FPosts.Count.ToString + ')';
end;

function TFormMain.StartOperation: Boolean;
begin
  if FOpeartion then
    Exit(False);
  ButtonFlatCancelOp.Show;
  DrawPanelProgress.Show;
  FDoCancelOperation := False;
  FOpeartion := True;
  FProgressText := '���������';
  OperProgress := 0;
  PageControlMain.Enabled := False;
  Result := True;
end;

procedure TFormMain.TableExDocTypesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FDocTypes.IndexIn(ARow) then
    Exit;
  with TableExDocTypes.Canvas do
  begin
    if FDocTypes.Checked[ARow] then
      ImageList16.Draw(TableExDocTypes.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 8, True)
    else
      ImageList16.Draw(TableExDocTypes.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 9, True);
  end;
end;

procedure TFormMain.TableExDocTypesGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FDocTypes.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FDocTypes[FRow].Name + ' (' + FDocTypes[FRow].Count.ToString + ')';
  end;
end;

procedure TFormMain.TableExDocTypesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FDocTypes.IndexIn(TableExDocTypes.ItemIndex) then
    Exit;
  FDocTypes.Checked[TableExDocTypes.ItemIndex] := not FDocTypes.Checked[TableExDocTypes.ItemIndex];
end;

procedure TFormMain.TableExFavesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FFaveTypes.IndexIn(ARow) then
    Exit;
  if FFaveTypes.Checked[ARow] then
    ImageList16.Draw(TableExFaves.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 8, True)
  else
    ImageList16.Draw(TableExFaves.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 9, True);
end;

procedure TFormMain.TableExFavesGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FFaveTypes.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FFaveTypes[FRow].Name;
  end;
end;

procedure TFormMain.TableExFavesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FFaveTypes.IndexIn(TableExFaves.ItemIndex) then
    Exit;
  FFaveTypes.Checked[TableExFaves.ItemIndex] := not FFaveTypes.Checked[TableExFaves.ItemIndex];
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

procedure TFormMain.TableExLogMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    if not FLog.IndexIn(TableExLog.ItemIndex) then
      Exit;
    PopupMenuLog.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TFormMain.TableExPhotosAlbumsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FAlbums.IndexIn(ARow) then
    Exit;
  if FAlbums.Checked[ARow] then
    ImageList16.Draw(TableExPhotosAlbums.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 8, True)
  else
    ImageList16.Draw(TableExPhotosAlbums.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 9, True);
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

procedure TFormMain.TableExProductTypesDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FProductTypes.IndexIn(ARow) then
    Exit;
  with TableExProductTypes.Canvas do
  begin
    if FProductTypes.Checked[ARow] then
      ImageList16.Draw(TableExProductTypes.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 8, True)
    else
      ImageList16.Draw(TableExProductTypes.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 9, True);
  end;
end;

procedure TFormMain.TableExProductTypesGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FProductTypes.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FProductTypes[FRow].Section + ' - ' + FProductTypes[FRow].Name;
  end;
end;

procedure TFormMain.TableExProductTypesItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FProductTypes.IndexIn(TableExProductTypes.ItemIndex) then
    Exit;
  FProductTypes.Checked[TableExProductTypes.ItemIndex] := not FProductTypes.Checked[TableExProductTypes.ItemIndex];
end;

procedure TFormMain.TableExVideosAlbumsDrawCellData(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol <> 0 then
    Exit;
  if not FAlbumsVideos.IndexIn(ARow) then
    Exit;
  if FAlbumsVideos.Checked[ARow] then
    ImageList16.Draw(TableExVideosAlbums.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 8, True)
  else
    ImageList16.Draw(TableExVideosAlbums.Canvas, Rect.CenterPoint.X - 12, Rect.Top, 9, True);
end;

procedure TFormMain.TableExVideosAlbumsGetData(FCol, FRow: Integer; var Value: string);
begin
  if not FAlbumsVideos.IndexIn(FRow) then
    Exit;
  case FCol of
    0:
      Value := '';
    1:
      Value := FAlbumsVideos[FRow].Title + ' (' + FAlbumsVideos[FRow].Size.ToString + ')';
  end;
end;

procedure TFormMain.TableExVideosAlbumsItemColClick(Sender: TObject; MouseButton: TMouseButton; const Index: Integer);
begin
  if not FAlbumsVideos.IndexIn(TableExVideosAlbums.ItemIndex) then
    Exit;
  FAlbumsVideos.Checked[TableExVideosAlbums.ItemIndex] := not FAlbumsVideos.Checked[TableExVideosAlbums.ItemIndex];
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
  PageControlMain.Enabled := True;
  ButtonFlatCancelOp.Hide;
  DrawPanelProgress.Hide;
end;

function TFormMain.IsCancel: Boolean;
begin
  Application.ProcessMessages;
  Result := FDoCancelOperation;
end;

procedure TFormMain.ButtonFlatGetBoardInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  ButtonFlatBoardDel.Caption := '������� ����������';
  try
    if Execute('board.getTopics', [VkGroup(FGroupID), VkCount1]) then
      LabelBoardCaption.Caption := '���������� (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGetFriendsDelClick(Sender: TObject);
var
  JArr: TJSONArray;
  i: Integer;
  Item: TFriend;
  Ok: Boolean;
  Offset, Cnt: Integer;
  MaxCnt: Integer;
begin
  if not StartOperation then
    Exit;
  try
    FFriends.BeginUpdate;
    FFriends.Clear;
    if FIsGroup then
      MaxCnt := 1000
    else
      MaxCnt := 5000;
    Cnt := 0;
    Offset := 0;
    repeat
      if FIsGroup then
        Ok := Execute('groups.getMembers', [VkFields('deactivated,last_seen'), VkGroup(FGroupID), VkCount(MaxCnt), VkOffset(Offset)])
      else
        Ok := Execute('friends.get', [VkFields('deactivated,last_seen'), VkCount(MaxCnt), VkOrder('name'), VkOffset(Offset)]);
      if Ok then
      begin
        JArr := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
        Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
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
      end;
      Offset := Offset + MaxCnt;
    until Cnt <= MaxCnt;
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

procedure TFormMain.Log(Text: string);
var
  Item: TLog;
begin
  Item.DateTime := Now;
  Item.Text := Text;
  FLog.Insert(0, Item);
end;

procedure TFormMain.MenuItemLogCopyClick(Sender: TObject);
begin
  if not FLog.IndexIn(TableExLog.ItemIndex) then
    Exit;
  Clipboard.AsText := FLog[TableExLog.ItemIndex].Text;
end;

procedure TFormMain.Error(Text: string);
var
  Item: TLog;
begin
  Item.DateTime := Now;
  Item.Text := Text;
  FLog.Insert(0, Item);
  if not PanelLog.Visible then
    PanelLog.Show;
  MessageBox(Handle, PChar(Text), '������', MB_ICONSTOP or MB_OK);
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
      ErrStr := '��������� ����������� ������.����������� ��������� ������ �����.';
    2:
      ErrStr := '���������� ���������.����������� �������� ���������� � �����������https://vk.com/editapp?id={��� API_ID} ��� ������������ �������� ����� (test_mode=1)';
    3:
      ErrStr := '������� ����������� �����.����������, ��������� �� ������� �������� ����������� ������:�https://vk.com/dev/methods.';
    4:
      ErrStr := '�������� �������.';
    5:
      ErrStr := '����������� ������������ �� �������.����������, ��� �� ����������� ������������ �����������.';
    6:
      ErrStr := '������� ����� �������� � �������.�������� ������� �������� ����� �������� ��� ����������� �����execute. ��������� �� ������������ �� ������� ������� ��. �� ��������https://vk.com/dev/api_requests.';
    7:
      ErrStr := '��� ���� ��� ���������� ����� ��������.����������, �������� �� ����������� ���������� �����������. ��� ����� ������� � ������� ������account.getAppPermissions.';
    8:
      ErrStr := '�������� ������.������������������� �������� ������ ������������ ���������� (��� ����� ����� �� �������� � ��������� ������).';
    9:
      ErrStr := '������� ����� ���������� ��������.������ ��������� ����� ���������� ���������. ��� ����� ����������� ������ �� ������ �������������execute����JSONP.';
    10:
      ErrStr := '��������� ���������� ������ �������.����������� ��������� ������ �����.';
    11:
      ErrStr := '� �������� ������ ���������� ������ ���� ��������� ��� ������������ ������ ���� ���������.���������� ���������� � �����������https://vk.com/editapp?id={��� API_ID}';
    14:
      ErrStr := '��������� ���� ���� � �������� (Captcha).';
    15:
      ErrStr := '������ ��������.����������, ��� �� ����������� ������ ��������������, � ������ � �������� ��� �������� ������������ ���� � ������ ������ �����.';
    16:
      ErrStr := '��������� ���������� �������� �� ���������HTTPS, �.�. ������������ ������� ���������, ��������� ������ ����� ���������� ����������.'#13#10 + '������ �������� ��������� ����� ������, � Standalone-���������� �� ������ �������������� ��������� ��������� ���� ��������� � ������������ �������account.getInfo.';
    17:
      ErrStr := '��������� ��������� ������������.��������� ������� ������������� � ���������� ������������� ������������ �� ��������� �������� ��� ���������.';
    18:
      ErrStr := '�������� ������� ��� �������������.��������� ������������ ���� ������� ��� �������������';
    20:
      ErrStr := '������ �������� ��������� ��� �� Standalone ����������.����� ������ ��������� �������� �� ��, ��� ���� ���������� ����� ��� Standalone, ���������, ��� ��� ����������� �� �����������redirect_uri=https://oauth.vk.com/blank.html.';
    21:
      ErrStr := '������ �������� ��������� ������ ��� Standalone � Open API ����������.';
    23:
      ErrStr := '����� ��� ��������.���� ���������� ������ �� API, ������� �������� � ��������� ������, ����������� �����:�https://vk.com/dev/methods.';
    24:
      ErrStr := '��������� ������������� �� ������� ������������.';
    27:
      ErrStr := '���� ������� ���������� ��������������.';
    28:
      ErrStr := '���� ������� ���������� ��������������.';
    29:
      ErrStr := '��������� �������������� ����� �� ����� ��������������� �� ������������ �� ���������� ������� ��. �� �������� https://vk.com/dev/data_limits';
    30:
      ErrStr := '������� �������� �������������������, ������������� � �������, ���������� � ������������ ������ �������';
    33:
      ErrStr := 'Not implemented yet';
    100:
      ErrStr := '���� �� ����������� ���������� ��� �� ������� ��� �������.���������� ������ ��������� ���������� � �� ������ �� �������� � ��������� ������.';
    101:
      ErrStr := '�������� API ID ����������.�������� ���������� � ������ ���������������� �� ��������https://vk.com/apps?act=settings�� ������� � ������� ������API_ID�(������������� ����������).';
    113:
      ErrStr := '�������� ������������� ������������.����������, ��� �� ����������� ������ �������������. �������� ID �� ��������� ����� ����� �������utils.resolveScreenName.';
    150:
      ErrStr := '�������� timestamp.��������� ���������� �������� �� ������ �������utils.getServerTime.';
    200:
      ErrStr := '������ � ������� ��������.����������, ��� �� ����������� ������ �������������� (��� �������������owner_id�������������, ��� ��������� � �������������), � ������ � �������������� �������� ��� �������� ������������ ���� � ������ ������ �����.';
    201:
      ErrStr := '������ � ����� ��������.����������, ��� �� ����������� ������ �������������� (��� �������������owner_id�������������, ��� ��������� � �������������), � ������ � �������������� �������� ��� �������� ������������ ���� � ������ ������ �����.';
    203:
      ErrStr := '������ � ������ ��������.����������, ��� ������� ������������ �������� ���������� ��� ������������� ���������� (��� �������� � ������� ����� � ������).';
    300:
      ErrStr := '������ ����������.������ ������������ ������ ����� ������� ������ ������� �� ������� ��� ������������ ������ ������.';
    500:
      ErrStr := '�������� ���������. �� ������ �������� �������� ������� � ���������� ����������.���������� ��������� ����������:�https://vk.com/editapp?id={��� API_ID}&section=payments';
    600:
      ErrStr := '��� ���� �� ���������� ������ �������� � ��������� ���������.';
    603:
      ErrStr := '��������� ������ ��� ������ � ��������� ���������.';
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
    ErrStr := '����������� ������';
  end;

  Error('VKError: ' + ErrStr);
end;

function TFormMain.Execute(Request: string; Params: array of TParam): Boolean;
begin
  Result := Execute(TRequestConstruct.Request(Request, Params), True);
end;

function TFormMain.Execute(Request: TRESTRequest; FreeRequset: Boolean): Boolean;
var
  JS: TJSONValue;
  CaptchaSID: string;
  CaptchaImg: string;
  CaptchaAns: string;
  ErrorCode: Integer;
  IsDone: Boolean;
begin
  Result := False;
  try
    IsDone := False;
    Log('������: ' + Request.GetFullRequestURL);
    Request.ExecuteAsync(
      procedure
      begin
        IsDone := True;
      end);
    while not IsDone do
      Application.ProcessMessages;
    FRequests := FRequests + 1;
    //���� ��� ������ ������, �� ��������� �����
    if FRequests = 1 then
      FStartRequest := GetTickCount
    else //���� �� ������, ��
    begin //���� ��� 3 �������, �� ��� �� ����� ������� FStartRequest
      if FRequests >= RequestLimit then
      begin
        FLastRequest := GetTickCount;
        WaitTime(1000 - Int64(FLastRequest - FStartRequest));
        FRequests := 0;
      end;
    end;
    //FLastRequest := GetTickCount;
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
              if FreeRequset then
                Request.Free;
              Exit;
            end
            else
              ProcError(ErrorCode);
          end;
        24:
          begin
            CaptchaAns := JS.GetValue<string>('confirmation_text', '');
            if MessageBox(Handle, PChar(CaptchaAns), '������', MB_ICONQUESTION or MB_YESNO) = ID_YES then
            begin
              Request.Params.AddItem('confirm', '1');
              Result := Execute(Request);
              Request.Params.Delete('confirm');
              if FreeRequset then
                Request.Free;
              Exit;
            end
            else
              ProcError(ErrorCode);
          end;
      else
        ProcError(ErrorCode);
      end;
      if FreeRequset then
        Request.Free;
      Exit(False);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Error(E.Message);
    end;
  end;
  if FreeRequset then
    Request.Free;
end;

procedure TFormMain.ButtonFlatGetGroupsClick(Sender: TObject);
var
  JS: TJSONValue;
  JArr: TJSONArray;
  i, p: Integer;
  Item: TGroup;
  Offset, Cnt: Integer;
const
  MaxCnt = 1000;
begin
  if not StartOperation then
    Exit;
  try
    FProgressText := '��������� ������ �����';
    FGroups.BeginUpdate;
    FGroups.Clear;
    Offset := 0;
    Cnt := 0;
    repeat
      if Execute('groups.get', [VkExtended, VkFields('name, id'), VkCount(MaxCnt), VkOffset(Offset)]) then
      begin
        JS := RESTResponse.JSONValue;
        Cnt := JS.GetValue<integer>('response.count', 0);
        if Cnt > 0 then
        begin
          JArr := JS.GetValue<TJSONArray>('response.items');
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
          Offset := Offset + Cnt;
        end;
      end;
    until Cnt <= Offset;
    FGroups.EndUpdate;
    OperProgress := 10;
    FProgressText := '������ ������';
    for i := 0 to FGroups.Count - 1 do
    begin
      OperProgress := Round(80 / FGroups.Count * i) + 10;
      if IsCancel then
        Break;
      if Execute('wall.get', [VkOwner(-FGroups[i].ID), VkCount(2)]) then
      begin
        JS := RESTResponse.JSONValue;
        JArr := JS.GetValue<TJSONArray>('response.items');
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
      end;
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

procedure TFormMain.ButtonFlatGetPhotosInfoClick(Sender: TObject);
var
  JSArr: TJSONArray;
  i, Cnt: Integer;
  Item: TAlbum;
begin
  if not StartOperation then
    Exit;
  ButtonFlatPhotosDel.Caption := '������� ����';
  FAlbums.BeginUpdate;
  FAlbums.Clear;
  try
    Cnt := 0;
    if Execute('photos.getAll', [VkOwner(-FGroupID, not FIsGroup), VkCount1]) then
    begin
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
    end;

    if not FIsGroup then
    begin
      if Execute('photos.get', [VkAlbum('saved')]) then
      begin
        Cnt := Cnt + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
      end;
    end;
    if Execute('photos.getAlbums', [VkOwner(-FGroupID, not FIsGroup), VkNeedSystem]) then
    begin
      JSArr := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArr.Count - 1 do
      begin
        Item.ID := JSArr.Items[i].GetValue<Integer>('id', -1);
        if Item.ID = -9000 then
          Continue; //������� ������� "���������� �� ����"
        Item.OwnerID := JSArr.Items[i].GetValue<Integer>('owner_id', -1);
        Item.Created := UnixToDateTime(JSArr.Items[i].GetValue<Integer>('created', 0), False);
        Item.Size := JSArr.Items[i].GetValue<Integer>('size', 0);
        Item.Title := JSArr.Items[i].GetValue<string>('title', '');
        FAlbums.Add(Item);
      end;
    end;
    LabelPhotosCaption.Caption := '���������� (' + Cnt.ToString + ')';
  finally
    EndedOperation;
    FAlbums.EndUpdate;
  end;
end;

procedure TFormMain.ButtonFlatGetVideosInfoClick(Sender: TObject);
var
  JSArr: TJSONArray;
  i, Cnt: Integer;
  Item: TAlbum;
begin
  if not StartOperation then
    Exit;
  ButtonFlatVideosDelete.Caption := '������� �����';
  FAlbumsVideos.BeginUpdate;
  FAlbumsVideos.Clear;
  try
    //��������� ��������
    if Execute('video.getAlbums', [VkExtended, VkNeedSystem, VkOwner(-FGroupID, not FIsGroup), VkCount(100)]) then
    begin
      JSArr := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArr.Count - 1 do
      begin
        Item.ID := JSArr.Items[i].GetValue<Integer>('id', -1);
        if Item.ID = -1 then
          Continue; //������� ������� "�����������"
        Item.OwnerID := JSArr.Items[i].GetValue<Integer>('owner_id', -1);
        Item.Created := UnixToDateTime(JSArr.Items[i].GetValue<Integer>('updated_time', 0), False);
        Item.Size := JSArr.Items[i].GetValue<Integer>('count', 0);
        Item.Title := JSArr.Items[i].GetValue<string>('title', '');
        FAlbumsVideos.Add(Item);
      end;
    end;
    //
    Cnt := 0;
    for i := 0 to FAlbumsVideos.Count - 1 do
    begin
      if Execute('video.get', [VkExtended, VkAlbum(FAlbumsVideos[i].ID), VkOwner(-FGroupID, not FIsGroup), VkCount1]) then
      begin
        Cnt := Cnt + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
      end;
    end;

    LabelVideosCaption.Caption := '����������� (' + Cnt.ToString + ')';
  finally
    EndedOperation;
    FAlbumsVideos.EndUpdate;
  end;
end;

procedure TFormMain.ButtonFlatGetWallInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  ButtonFlatPostDel.Caption := '������� ������';
  try
    if Execute('wall.get', [VkOwner(-FGroupID, not FIsGroup), VkCount1]) then
    begin
      LabelWallCaption.Caption := '������ (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGroupDocsClick(Sender: TObject);
begin
  if FIsGroup and FGroupIsPage then
  begin
    MessageBox(Handle, '� ��������� �������� ��� ������� � �����������!', '', MB_ICONINFORMATION or MB_OK);
    Exit;
  end;
  OpenPage(TabSheetDocs, beGroupMenu);
  ButtonFlatDocsGetInfoClick(nil);
end;

procedure TFormMain.GetGroupInfo;
begin
  if Execute('groups.getSettings', [VkGroup(FGroupID)]) then
  begin
    ButtonFlatGroupMarket.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.market.enabled');
    ButtonFlatGroupPhotos.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.photos');
    ButtonFlatGroupVideos.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.video');
    ButtonFlatGroupAudio.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.audio');
    ButtonFlatGroupDocs.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.docs');
    ButtonFlatGroupBoard.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.topics');
    ButtonFlatGroupMessages.Enabled := RESTResponse.JSONValue.GetValue<Boolean>('response.messages');
  end;
end;

procedure TFormMain.ButtonFlatGroupID_NumClick(Sender: TObject);
begin
  FIsGroup := True;
  FGroupID := (Sender as TButtonFlat).Tag;
  FGroupName := (Sender as TButtonFlat).Caption;
  FGroupIsPage := (Sender as TButtonFlat).SubText = 'page';
  ButtonFlatCurrentOwner.Caption := FGroupName;
  ButtonFlatCurrentOwner.Visible := True;
  LinkOpenCurrentGroup.Caption := 'https://vk.com/public' + FGroupID.ToString;
  GetGroupInfo;
  OpenPage(TabSheetGroupMenu);
end;

procedure TFormMain.ButtonFlatGroupMarketClick(Sender: TObject);
begin
  OpenPage(TabSheetMarket, beGroupMenu);
  ButtonFlatGetMarketInfoClick(nil);
end;

procedure TFormMain.ButtonFlatGroupMessagesClick(Sender: TObject);
begin
  MessageBox(Handle, '���� ������� ��������� �� ��������. ��� ������������� ���������� ����������.', '���', MB_ICONINFORMATION or MB_OK);
  Exit;
end;

procedure TFormMain.ButtonFlatBoardCalcClick(Sender: TObject);
const
  MaxCnt = 100;
var
  Offset, Cnt: Integer;
  JSArray: TJSONArray;
  Item: TBoard;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := '������ ����������';
    FBoards.BeginUpdate;
    FBoards.Clear;
    repeat
      if IsCancel then
        Break;
      if not Execute('board.getTopics', [VkGroup(FGroupID), VkCount(MaxCnt), VkOffset(Offset)]) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        if IsCancel then
          Break;
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.Title := JSArray.Items[i].GetValue<string>('title');
        Item.IsClosed := JSArray.Items[i].GetValue<Boolean>('is_closed');
        if CheckBoxBoardClosed.Checked then
          if not Item.IsClosed then
            Continue;
        Item.Comments := JSArray.Items[i].GetValue<Integer>('comments');
        if CheckBoxBoardComments.Checked then
          if Item.Comments > SpinEditBoardComments.Value then
            Continue;
        Item.Created := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('created'), False);
        if CheckBoxBoardDateCreate.Checked then
          if not DateTimeInRange(DateOf(Item.Created), DateOf(CalendarPickerBoardDateS.Date), DateOf(CalendarPickerBoardDateE.Date), True) then
            Continue;
        Item.Updated := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('updated'), False);
        if CheckBoxBoardOlded.Checked then
          if DateOf(Item.Updated) > DateOf(CalendarPickerBoardDateLast.Date) then
            Continue;
        FBoards.Add(Item);
      end;
      if Cnt <= MaxCnt then
        Break;
      Offset := Offset + MaxCnt;
    until JSArray.Count <= 0;
    LabelBoardCaption.Caption := '���������� (' + Cnt.ToString + ')';
    FBoards.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatBoardDel.Caption := '������� ���������� (' + FBoards.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatGroupBoardClick(Sender: TObject);
begin
  OpenPage(TabSheetBoard, beGroupMenu);
  ButtonFlatGetBoardInfoClick(nil);
end;

procedure TFormMain.ButtonFlatBoardDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed: Boolean;
begin
  if MessageBox(Handle, PChar('����� ������� ����������: ' + FBoards.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FBoards.Count - 1 do
    begin
      OperProgress := Round(100 / FBoards.Count * i);
      FProgressText := '��������. �������� ������� ~' + Round(((FBoards.Count - i) * 400) / (1000 * 60)).ToString + ' ���.';
      if IsCancel then
        Break;
      if not Execute('board.deleteTopic', [VkGroup(FGroupID), VkTopic(FBoards[i].ID)]) then
      begin
        Log('�� ������� ������� ���������� ' + FBoards[i].ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� ���������� ' + FBoards[i].ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    FBoards.Clear;
    ButtonFlatGetBoardInfoClick(nil);
    ButtonFlatBoardDel.TimedText('������', 3000);
    ButtonFlatBoardDel.Caption := '������� ����������';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGroupPhotosClick(Sender: TObject);
begin
  OpenPage(TabSheetPhotos, beGroupMenu);
  ButtonFlatGetPhotosInfoClick(nil);
end;

procedure TFormMain.ButtonFlatGroupUsersClick(Sender: TObject);
begin
  OpenPage(TabSheetFriends, beGroupMenu);
  if FFriends.Count <= 0 then
    ButtonFlatGetFriendsDelClick(nil);
end;

procedure TFormMain.ButtonFlatGroupVideosClick(Sender: TObject);
begin
  OpenPage(TabSheetVideo, beGroupMenu);
  ButtonFlatGetVideosInfoClick(nil);
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
  i, r: Integer;
begin
  if not StartOperation then
    Exit;
  try
    FPhotos.BeginUpdate;
    FPhotos.Clear;
    AllCnt := 0;
    Cnt := 0;
    for r := 1 to 2 do
    begin
      if FIsGroup and (r = 2) then
        Continue;

      case r of
        1:
          FProgressText := '������� ����������';
        2:
          FProgressText := '������� ���������� ����������';
      end;
      Offset := 0;
      repeat
        if IsCancel then
          Break;
        case r of
          1:
            begin
              if not Execute('photos.getAll', [VkOwner(-FGroupID, not FIsGroup), VkExtended, VkCount(MaxCnt), VkOffset(Offset)]) then
                Break;
            end;
          2:
            begin
              if not Execute('photos.get', [VkAlbum('saved'), VkExtended, VkCount(MaxCnt), VkOffset(Offset)]) then
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
    LabelPhotosCaption.Caption := '���������� (' + AllCnt.ToString + ')';
    FPhotos.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatPhotosDel.Caption := '������� ���� (' + FPhotos.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatPhotosClick(Sender: TObject);
begin
  OpenPage(TabSheetPhotos);
  ButtonFlatGetPhotosInfoClick(nil);
end;

procedure TFormMain.ButtonFlatPostDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed: Boolean;
begin
  if MessageBox(Handle, PChar('����� ������� �������: ' + FPosts.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FPosts.Count - 1 do
    begin
      OperProgress := Round(100 / FPosts.Count * i);
      FProgressText := '��������. �������� ������� ~' + Round(((FPosts.Count - i) * 400) / (1000 * 60)).ToString + ' ���.';
      if IsCancel then
        Break;
      if not Execute('wall.delete', [VkOwner(FPosts[i].OwnerID), VkPost(FPosts[i].ID)]) then
      begin
        Log('�� ������� ������� ���� ' + FPosts[i].ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� ���� ' + FPosts[i].ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    ButtonFlatGetWallInfoClick(nil);
    ButtonFlatPostDel.TimedText('������', 3000);
    ButtonFlatPostDel.Caption := '������� ������';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatProductTypesClick(Sender: TObject);
var
  PT: TPoint;
begin
  PanelProductTypes.Height := Min(TableExProductTypes.DefaultRowHeight * TableExProductTypes.ItemCount, 300);
  PT := CheckBoxProductTypes.ClientToScreen(Point(0, 0));
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelProductTypes,
    procedure
    begin
      FPopupMenu := nil;
    end, PT.X, PT.Y + CheckBoxProductTypes.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlat10Click(Sender: TObject);
begin
  WebOpen('https://vk.com/app6326142_-184755622');
end;

procedure TFormMain.ButtonFlatGetMarketInfoClick(Sender: TObject);
var
  JSArray: TJSONArray;
  Item: TProductType;
  i: Integer;
  OwnerID: Integer;
begin
  if not StartOperation then
    Exit;
  ButtonFlatMarketDel.Caption := '������� ������';
  FProductTypes.BeginUpdate;
  FProductTypes.Clear;
  try
    if FIsGroup then
      OwnerID := -FGroupID
    else
      OwnerID := FProfile.ID;
    if Execute('market.get', [VkCount1, VkOwner(OwnerID)]) then
    begin
      LabelMarketCaption.Caption := '������ (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
    //
    if Execute('market.getCategories', [VkCount(1000)]) then
    begin
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id', -1);
        Item.Name := JSArray.Items[i].GetValue<string>('name', '');
        Item.Section := JSArray.Items[i].GetValue<string>('section.name', '');
        FProductTypes.Add(Item);
      end;
    end;
  finally
    FProductTypes.EndUpdate;
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGetMessageInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  ButtonFlatMessagesDel.Caption := '������� �������';
  try
    if Execute('messages.getConversations', [VkCount1, VkGroup(FGroupID, not FIsGroup)]) then
    begin
      LabelMessagesCaption.Caption := '������� (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatGetNotesInfoClick(Sender: TObject);
begin
  if not StartOperation then
    Exit;
  ButtonFlatNotesDel.Caption := '������� �������';
  try
    if Execute('notes.get', [VkCount1]) then
      LabelNotesCaption.Caption := '������� (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatDocsGetInfoClick(Sender: TObject);
var
  JSArray: TJSONArray;
  Item: TDocType;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  ButtonFlatDocsDel.Caption := '������� ���������';
  FDocTypes.BeginUpdate;
  FDocTypes.Clear;
  try
    if Execute('docs.get', [VkCount1, VkOwner(-FGroupID, not FIsGroup)]) then
    begin
      LabelDocsCaption.Caption := '��������� (' + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1).ToString + ')';
    end;
    //
    if Execute('docs.getTypes', [VkOwner(-FGroupID, not FIsGroup)]) then
    begin
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id', -1);
        if Item.ID = 7 then     //���� ���� VK API (����� ����� ��������)
          Item.Name := '�����'
        else
          Item.Name := JSArray.Items[i].GetValue<string>('name', '');
        Item.Count := JSArray.Items[i].GetValue<Integer>('count', -1);
        FDocTypes.Add(Item);
      end;
    end;
  finally
    FDocTypes.EndUpdate;
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatDocTypesClick(Sender: TObject);
var
  PT: TPoint;
begin
  PanelDocTypes.Height := Min(TableExDocTypes.DefaultRowHeight * TableExDocTypes.ItemCount, 300);
  PT := CheckBoxDocTypes.ClientToScreen(Point(0, 0));
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelDocTypes,
    procedure
    begin
      FPopupMenu := nil;
    end, PT.X, PT.Y + CheckBoxDocTypes.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlatPhotosDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed: Boolean;
begin
  if MessageBox(Handle, PChar('����� ������� ����������: ' + FPhotos.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FPhotos.Count - 1 do
    begin
      OperProgress := Round(100 / FPhotos.Count * i);
      FProgressText := '��������. �������� ������� ~' + IntToStr(Round(((FPhotos.Count - i) * 400) / (1000 * 60))) + ' ���.';
      if IsCancel then
        Break;
      if not Execute('photos.delete', [VkOwner(FPhotos[i].OwnerID), VkPhoto(FPhotos[i].ID)]) then
      begin
        Log('�� ������� ������� ���� ' + FPhotos[i].ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� ���� ' + FPhotos[i].ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    ButtonFlatGetPhotosInfoClick(nil);
    ButtonFlatPhotosDel.TimedText('������', 3000);
    ButtonFlatPhotosDel.Caption := '������� ����';
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
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelPhotosAlbums,
    procedure
    begin
      FPopupMenu := nil;
    end, PT.X, PT.Y + CheckBoxPhotosAlbums.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlatDocsClick(Sender: TObject);
begin
  OpenPage(TabSheetDocs);
  ButtonFlatDocsGetInfoClick(nil);
end;

procedure TFormMain.ButtonFlatMarketCalcClick(Sender: TObject);
const
  MaxCnt = 200;
var
  Offset, Cnt: Integer;
  JSArray: TJSONArray;
  Item: TProduct;
  i, OwnerID: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := '������ �������';
    FProducts.BeginUpdate;
    FProducts.Clear;
    if FIsGroup then
      OwnerID := -FGroupID
    else
      OwnerID := FProfile.ID;
    repeat
      if IsCancel then
        Break;
      if not Execute('market.get', [VkOwner(OwnerID), VkCount(MaxCnt), VkOffset(Offset)]) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
        Item.Title := JSArray.Items[i].GetValue<string>('title');
        Item.Amount := JSArray.Items[i].GetValue<Integer>('price.amount', -1);
        if CheckBoxProductAmount.Checked then
        begin
          case ComboBoxProductAmountType.ItemIndex of
            0:
              if Item.Amount div 100 > SpinEditProductAmount.Value then
                Continue;
            1:
              if Item.Amount div 100 < SpinEditProductAmount.Value then
                Continue;
          end;
        end;
        Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
        if CheckBoxProductDate.Checked then
          if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerProductDateS.Date), DateOf(CalendarPickerProductDateE.Date), True) then
            Continue;
        Item.CategoryID := JSArray.Items[i].GetValue<Integer>('category.id');
        if CheckBoxProductTypes.Checked then
          if FProductTypes.FindCheckedID(Item.CategoryID) < 0 then
            Continue;
        FProducts.Add(Item);
      end;
      if Cnt <= MaxCnt then
        Break;
      Offset := Offset + MaxCnt;
    until JSArray.Count <= 0;
    LabelMarketCaption.Caption := '������ (' + Cnt.ToString + ')';
    FProducts.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatMarketDel.Caption := '������� ������ (' + FProducts.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatMarketClick(Sender: TObject);
begin
  OpenPage(TabSheetMarket);
  ButtonFlatGetMarketInfoClick(nil);
end;

procedure TFormMain.ButtonFlatDocsCalcClick(Sender: TObject);
const
  MaxCnt = 2000;
var
  Offset, Cnt: Integer;
  JSArray: TJSONArray;
  Item: TDoc;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := '������ ����������';
    FDocs.BeginUpdate;
    FDocs.Clear;
    repeat
      if IsCancel then
        Break;
      if not Execute('docs.get', [VkOwner(-FGroupID, not FIsGroup), VkCount(MaxCnt), VkOffset(Offset)]) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      LabelDocsCaption.Caption := '��������� (' + Cnt.ToString + ')';
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
        Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
        Item.TypeID := JSArray.Items[i].GetValue<Integer>('type');
        if CheckBoxDocsDate.Checked then
          if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerDocsDateS.Date), DateOf(CalendarPickerDocsDateE.Date), True) then
            Continue;
        if CheckBoxDocTypes.Checked then
          if FDocTypes.FindCheckedID(Item.TypeID) < 0 then
            Continue;
        FDocs.Add(Item);
      end;
      if Cnt <= MaxCnt then
        Break;
      Offset := Offset + MaxCnt;
    until JSArray.Count <= 0;
    FDocs.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatDocsDel.Caption := '������� ��������� (' + FDocs.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatDocsDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed: Boolean;
begin
  if MessageBox(Handle, PChar('����� ������� ����������: ' + FDocs.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FDocs.Count - 1 do
    begin
      OperProgress := Round(100 / FDocs.Count * i);
      FProgressText := '��������. �������� ������� ~' + Round(((FDocs.Count - i) * 400) / (1000 * 60)).ToString + ' ���.';
      if IsCancel then
        Break;
      if not Execute('docs.delete', [VkOwner(FDocs[i].OwnerID), VkDoc(FDocs[i].ID)]) then
      begin
        Log('�� ������� ������� �������� ' + FDocs[i].ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� �������� ' + FDocs[i].ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    FDocs.Clear;
    ButtonFlatDocsGetInfoClick(nil);
    ButtonFlatDocsDel.TimedText('������', 3000);
    ButtonFlatDocsDel.Caption := '������� ���������';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatAutoCleanGroupClick(Sender: TObject);
begin
  OpenPage(TabSheetAutoClean, beGroupMenu);
end;

procedure TFormMain.ButtonFlatFaveCalcClick(Sender: TObject);
const
  MaxCnt = 100;
var
  Offset, Cnt, AllCnt: Integer;
  JSArray: TJSONArray;
  Item: TFave;
  i: Integer;
  RequestType: Integer;
begin
  if not StartOperation then
    Exit;
  try
    FFaves.BeginUpdate;
    FFaves.Clear;
    for RequestType := 0 to 1 do //fave.get, fave.getPages
    begin
      Offset := 0;
      repeat
        if IsCancel then
          Break;
        case RequestType of

          0:
            begin
              FProgressText := '������ �������� ��������';
              if not Execute('fave.get', [VkCount(MaxCnt), VkOffset(Offset)]) then
                Break;
            end;
          1:
            begin
              FProgressText := '������ ����� � ��������� � ���������';
              if not Execute('fave.getPages', [VkCount(MaxCnt), VkOffset(Offset)]) then
                Break;
            end;
        end;

        Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count', 0);
        if Cnt > 0 then
        begin
          OperProgress := Round(100 / Cnt * Offset);
          JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
          for i := 0 to JSArray.Count - 1 do
          begin
            Item.FaveType := AnsiLowerCase(JSArray.Items[i].GetValue<string>('type'));
            if CheckBoxFaveTypes.Checked then
              if FFaveTypes.FindCheckedID(Item.FaveType) < 0 then
                Continue;
            Item.Seen := JSArray.Items[i].GetValue<Boolean>('seen', True);
            Item.AddedDate := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('added_date', -1), False);

            Item.Item_ID := JSArray.Items[i].GetValue<Integer>(Item.FaveType + '.id');
            Item.ItemOwner_ID := JSArray.Items[i].GetValue<Integer>(Item.FaveType + '.owner_id', 0);
            if CheckBoxFaveDate.Checked then
              if not DateTimeInRange(DateOf(Item.AddedDate), DateOf(CalendarPickerFaveDateS.Date), DateOf(CalendarPickerFaveDateE.Date), True) then
                Continue;
            FFaves.Add(Item);
          end;
        end;
        if Cnt <= MaxCnt then
          Break;
        Offset := Offset + MaxCnt;
      until JSArray.Count <= 0;
      AllCnt := AllCnt + Cnt;
    end;
    LabelFaveCaption.Caption := '�������� (' + AllCnt.ToString + ')';
    FFaves.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatFaveDel.Caption := '������� �������� (' + FFaves.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatFaveClick(Sender: TObject);
begin
  OpenPage(TabSheetFave);
  ButtonFlatFaveGetInfoClick(nil);
end;

procedure TFormMain.ButtonFlatFaveDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed, State: Boolean;
  FaveType: string;
begin
  if MessageBox(Handle, PChar('����� ������� ��������: ' + FFaves.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FFaves.Count - 1 do
    begin
      OperProgress := Round(100 / FFaves.Count * i);
      FProgressText := '��������. �������� ������� ~' + Round(((FFaves.Count - i) * 400) / (1000 * 60)).ToString + ' ���.';
      if IsCancel then
        Break;
      FaveType := FFaves[i].FaveType;
      if FaveType = 'product' then
        State := Execute('fave.removeProduct', [VkOwner(FFaves[i].ItemOwner_ID), VkId(FFaves[i].Item_ID)])
      else if FaveType = 'post' then
        State := Execute('fave.removePost', [VkOwner(FFaves[i].ItemOwner_ID), VkId(FFaves[i].Item_ID)])
      else if FaveType = 'video' then
        State := Execute('fave.removeVideo', [VkOwner(FFaves[i].ItemOwner_ID), VkId(FFaves[i].Item_ID)])
      else if FaveType = 'article' then
        State := Execute('fave.removeArticle', [VkOwner(FFaves[i].ItemOwner_ID), VkArticle(FFaves[i].Item_ID)])
      else if FaveType = 'link' then
        State := Execute('fave.removeLink', [VkLink(FFaves[i].Item_ID)])
      else if FaveType = 'user' then
        State := Execute('fave.removePage', [VkUser(FFaves[i].Item_ID)])
      else if FaveType = 'group' then
        State := Execute('fave.removePage', [VkGroup(FFaves[i].Item_ID)]);
      if not State then
      begin
        Log('�� ������� ������� �������� ' + FFaves[i].Item_ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� �������� ' + FFaves[i].Item_ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    FFaves.Clear;
    ButtonFlatFaveGetInfoClick(nil);
    ButtonFlatFaveDel.TimedText('������', 3000);
    ButtonFlatFaveDel.Caption := '������� ��������';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatFaveGetInfoClick(Sender: TObject);
var
  Cnt: Integer;
begin
  if not StartOperation then
    Exit;
  ButtonFlatFaveDel.Caption := '������� ��������';
  try
    Cnt := 0;
    if Execute('fave.get', [VkCount1]) then
      Cnt := Cnt + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);
    if Execute('fave.getPages', [VkCount1]) then
      Cnt := Cnt + RESTResponse.JSONValue.GetValue<Integer>('response.count', -1);

    LabelFaveCaption.Caption := '�������� (' + Cnt.ToString + ')';
  finally
    EndedOperation;
  end;
end;

procedure TFormMain.ButtonFlatFaveTypesClick(Sender: TObject);
var
  PT: TPoint;
begin
  PanelFaveTypes.Height := Min(TableExFaves.DefaultRowHeight * TableExFaves.ItemCount, 300);
  PT := CheckBoxFaveTypes.ClientToScreen(Point(0, 0));
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelFaveTypes,
    procedure
    begin
      FPopupMenu := nil;
    end, PT.X, PT.Y + CheckBoxFaveTypes.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlatVideoAlbumsSelectClick(Sender: TObject);
var
  PT: TPoint;
begin
  PanelVideoAlbums.Height := Min(TableExVideosAlbums.DefaultRowHeight * TableExVideosAlbums.ItemCount, 300);
  PT := CheckBoxVideoAlbums.ClientToScreen(Point(0, 0));
  FPopupMenu := TFormPopup.CreatePopup(Self, PanelVideoAlbums,
    procedure
    begin
      FPopupMenu := nil;
    end, PT.X, PT.Y + CheckBoxVideoAlbums.Height, [psShadow]);
end;

procedure TFormMain.ButtonFlatVideosCalcClick(Sender: TObject);
const
  MaxCnt = 200;
var
  Offset, Cnt, AllCnt, a: Integer;
  JSArray: TJSONArray;
  Item: TVideo;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    FVideos.BeginUpdate;
    FVideos.Clear;
    AllCnt := 0;
    Cnt := 0;

    FProgressText := '������� ������������';
    for a := 0 to FAlbumsVideos.Count - 1 do
    begin
      if IsCancel then
        Break;
      Offset := 0;
      repeat
        if IsCancel then
          Break;
        if not Execute('video.get', [VkExtended, VkOwner(-FGroupID, not FIsGroup), VkCount(MaxCnt), VkAlbum(FAlbumsVideos[a].ID), VkOffset(Offset)]) then
          Break;

        Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
        OperProgress := Round(100 / Cnt * Offset);
        JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
        for i := 0 to JSArray.Count - 1 do
        begin
          Item.ID := JSArray.Items[i].GetValue<Integer>('id');
          Item.AlbumID := FAlbumsVideos[a].ID;
          Item.OwnerID := JSArray.Items[i].GetValue<Integer>('owner_id');
          Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
          Item.Likes := JSArray.Items[i].GetValue<Integer>('likes.count');
          Item.Reposts := JSArray.Items[i].GetValue<Integer>('reposts.count');
          if CheckBoxVideoLikes.Checked then
            if Item.Likes >= SpinEditVideoLikes.Value then
              Continue;
          if CheckBoxVideoReply.Checked then
            if Item.Reposts >= SpinEditVideoReply.Value then
              Continue;
          if FIsGroup then
          begin
            if CheckBoxVideoFromOnly.Checked then
              if Item.AlbumID = Item.OwnerID then
                Continue;
          end;
          if CheckBoxVideoDate.Checked then
            if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerVideoDateS.Date), DateOf(CalendarPickerVideoDateE.Date), True) then
              Continue;
          if CheckBoxVideoAlbums.Checked then
          begin
            if FAlbumsVideos.FindCheckedID(Item.AlbumID) < 0 then
              Continue;
          end;
          FVideos.Add(Item);
        end;
        if Cnt <= MaxCnt then
          Break;
        Offset := Offset + MaxCnt;
      until JSArray.Count <= 0;
      AllCnt := AllCnt + Cnt;
    end;

    LabelVideosCaption.Caption := '����������� (' + AllCnt.ToString + ')';
    FVideos.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatVideosDelete.Caption := '������� ����� (' + FVideos.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatVideosClick(Sender: TObject);
begin
  OpenPage(TabSheetVideo);
  ButtonFlatGetVideosInfoClick(nil);
end;

procedure TFormMain.ButtonFlatVideosDeleteClick(Sender: TObject);
var
  i: Integer;
begin
  if MessageBox(Handle, PChar('����� ������� ������������: ' + FVideos.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    for i := 0 to FVideos.Count - 1 do
    begin
      OperProgress := Round(100 / FVideos.Count * i);
      FProgressText := '��������. �������� ������� ~' + IntToStr(Round(((FVideos.Count - i) * 400) / (1000 * 60))) + ' ���.';
      if IsCancel then
        Break;

      if not Execute('videos.delete', [VkOwner(FVideos[i].OwnerID), VkVideo(FVideos[i].ID)]) then
        Break;
    end;
    ButtonFlatGetVideosInfoClick(nil);
    ButtonFlatVideosDelete.TimedText('������', 3000);
    ButtonFlatVideosDelete.Caption := '������� �����';
  finally
    EndedOperation;
  end;
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

procedure TFormMain.ButtonFlatAutoCleanClick(Sender: TObject);
begin
  OpenPage(TabSheetAutoClean);
end;

procedure TFormMain.ButtonFlatCancelOpClick(Sender: TObject);
begin
  CancelOperation;
end;

procedure TFormMain.ButtonFlatCleanFriendsClick(Sender: TObject);
begin
  OpenPage(TabSheetFriends);
  if FFriends.Count <= 0 then
    ButtonFlatGetFriendsDelClick(nil);
end;

procedure TFormMain.ButtonFlatCleanGroupsClick(Sender: TObject);
begin
  OpenPage(TabSheetGroups);
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
    if MessageBox(Handle, '������� ����������?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
      Exit;
    if Execute('groups.removeUser', [VkGroup(FGroupID), VkUser(FFriends[TableExFriendClean.ItemIndex].ID)]) then
    begin
      if RESTResponse.JSONValue.GetValue<Integer>('response', 0) = 1 then
      begin
        FFriends.Delete(TableExFriendClean.ItemIndex);
        MessageBox(Handle, '�������� ��������� �������!', '', MB_ICONINFORMATION or MB_OK);
      end;
    end;
  end
  else
  begin
    if MessageBox(Handle, '������� �� ������?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
      Exit;
    if Execute('friends.delete', [VkUser(FFriends[TableExFriendClean.ItemIndex].ID)]) then
    begin
      if RESTResponse.JSONValue.GetValue<Integer>('response.success', 0) = 1 then
      begin
        FFriends.Delete(TableExFriendClean.ItemIndex);
        MessageBox(Handle, '�������� ��������� �������!', '', MB_ICONINFORMATION or MB_OK);
      end;
    end;
  end;
end;

procedure TFormMain.ButtonFlatLeaveGroupClick(Sender: TObject);
begin
  if not FGroups.IndexIn(TableExGroupClean.ItemIndex) then
    Exit;
  if MessageBox(Handle, '����� �� ������ (����������)?', '', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) <> ID_YES then
    Exit;
  if Execute('groups.leave', [VkGroup(FGroups[TableExGroupClean.ItemIndex].ID)]) then
  begin
    if RESTResponse.JSONValue.GetValue<Integer>('response', 0) = 1 then
    begin
      FGroups.Delete(TableExGroupClean.ItemIndex);
      MessageBox(Handle, '������� ��������� �������!', '', MB_ICONINFORMATION or MB_OK);
    end;
  end;
end;

procedure TFormMain.ButtonFlatLoginClick(Sender: TObject);
begin
  LabelAuthState.Caption := '��������...';
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
  if Assigned(FPopupMenu) then
    FPopupMenu.Close;
  if MessageBox(Handle, '����� ���������� � � �������� Internet Explorer, ����������?' + #13#10#13#10 + '���� ������ ��������� ����������, �������� ��������������� ����� � ����.', '��������', MB_ICONWARNING or MB_YESNOCANCEL or MB_DEFBUTTON2) <> ID_YES then
    Exit;
  Execute('auth.logout', []);
  FAuthForm.DeleteCache('vk.com');
  DrawPanelLogin.Hide;
  FFriends.Clear;
  FGroups.Clear;
  FProfile.FirstName := '';
  ImageListProfile.Clear;
  OpenWelcome;
end;

procedure TFormMain.ButtonFlatMessagesClick(Sender: TObject);
begin
  MessageBox(Handle, '���� ������� ��������� �� ��������. ��� ������������� ���������� ����������.', '���', MB_ICONINFORMATION or MB_OK);
  Exit;
  OpenPage(TabSheetMessages);
  ButtonFlatGetMessageInfoClick(nil);
end;

procedure TFormMain.ButtonFlatMusicClick(Sender: TObject);
begin
  MessageBox(Handle, '� ���������, �� �� ��������� ��������� ������� �������� ����������� � 16 ������� 2016 ����.' + #13 + #10 + '���� � ������� �������� �����������, �� ����������� ���� �������������.', '���', MB_ICONINFORMATION or MB_OK);
end;

procedure TFormMain.ButtonFlatNotesCalcClick(Sender: TObject);
const
  MaxCnt = 100;
var
  Offset, Cnt: Integer;
  JSArray: TJSONArray;
  Item: TNote;
  i: Integer;
begin
  if not StartOperation then
    Exit;
  try
    Offset := 0;
    FProgressText := '������ �������';
    FNotes.BeginUpdate;
    FNotes.Clear;
    repeat
      if IsCancel then
        Break;
      if not Execute('notes.get', [VkCount(MaxCnt), VkOffset(Offset)]) then
        Break;
      Cnt := RESTResponse.JSONValue.GetValue<Integer>('response.count');
      OperProgress := Round(100 / Cnt * Offset);
      JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
      for i := 0 to JSArray.Count - 1 do
      begin
        if IsCancel then
          Break;
        Item.ID := JSArray.Items[i].GetValue<Integer>('id');
        Item.Title := JSArray.Items[i].GetValue<string>('title');
        Item.Date := UnixToDateTime(JSArray.Items[i].GetValue<Integer>('date'), False);
        if CheckBoxNotesDate.Checked then
          if not DateTimeInRange(DateOf(Item.Date), DateOf(CalendarPickerNotesDateS.Date), DateOf(CalendarPickerNotesDateE.Date), True) then
            Continue;
        FNotes.Add(Item);
      end;
      if Cnt <= MaxCnt then
        Break;
      Offset := Offset + MaxCnt;
    until JSArray.Count <= 0;
    LabelNotesCaption.Caption := '������� (' + Cnt.ToString + ')';
    FNotes.EndUpdate;
  finally
    EndedOperation;
  end;
  ButtonFlatNotesDel.Caption := '������� ������� (' + FNotes.Count.ToString + ')';
end;

procedure TFormMain.ButtonFlatNotesClick(Sender: TObject);
begin
  OpenPage(TabSheetNotes);
  ButtonFlatGetNotesInfoClick(nil);
end;

procedure TFormMain.ButtonFlatNotesDelClick(Sender: TObject);
var
  i: Integer;
  ErrNotifed: Boolean;
begin
  if MessageBox(Handle, PChar('����� ������� �������: ' + FNotes.Count.ToString + ' ����������?'), '��������', MB_ICONWARNING or MB_YESNOCANCEL) <> ID_YES then
    Exit;
  if not StartOperation then
    Exit;
  try
    ErrNotifed := False;
    for i := 0 to FNotes.Count - 1 do
    begin
      OperProgress := Round(100 / FNotes.Count * i);
      FProgressText := '��������. �������� ������� ~' + Round(((FNotes.Count - i) * 400) / (1000 * 60)).ToString + ' ���.';
      if IsCancel then
        Break;
      if not Execute('notes.delete', [VkNote(FNotes[i].ID)]) then
      begin
        Log('�� ������� ������� ������� ' + FNotes[i].ID.ToString);
        if not ErrNotifed then
        begin
          ErrNotifed := True;
          if MessageBox(Handle, PChar('�� ������� ������� ������� ' + FNotes[i].ID.ToString + #13#10 + '��������?'), '������', MB_ICONSTOP or MB_YESNO) = ID_YES then
            Break;
        end;
      end;
    end;
    FNotes.Clear;
    ButtonFlatGetNotesInfoClick(nil);
    ButtonFlatNotesDel.TimedText('������', 3000);
    ButtonFlatNotesDel.Caption := '������� ���������';
  finally
    EndedOperation;
  end;
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
  if Execute('groups.get', [VkFilter('admin, editor, moder'), VkFields('name, id'), VkExtended]) then
  begin
    JSArray := RESTResponse.JSONValue.GetValue<TJSONArray>('response.items');
    for i := 0 to JSArray.Count - 1 do
    begin
      with CreateButton do
      begin
        Caption := JSArray.Items[i].GetValue<string>('name');
        Tag := JSArray.Items[i].GetValue<Integer>('id');
        SubText := JSArray.Items[i].GetValue<string>('type');
      end;
    end;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FLastRequest := 0;
  FStartRequest := 0;
  FRequests := 0;
  TRequestConstruct.Response := RESTResponse;
  TRequestConstruct.Client := RESTClient;
  Caption := 'VK Cleaner ' + GetVersion;
  FProgOffset := 0;

  FLog := TLogs.Create(TableExLog);
  FGroups := TGroups.Create(TableExGroupClean);
  FFriends := TFriends.Create(TableExFriendClean);
  FPosts := TPosts.Create;
  FPhotos := TPhotos.Create;
  FVideos := TVideos.Create;
  FAlbums := TAlbums.Create(TableExPhotosAlbums);
  FAlbumsVideos := TAlbums.Create(TableExVideosAlbums);
  FDocTypes := TDocTypes.Create(TableExDocTypes);
  FDocs := TDocs.Create;
  FFaveTypes := TFaveTypes.Create(TableExFaves);
  FFaves := TFaves.Create;
  FNotes := TNotes.Create;
  FBoards := TBoards.Create;
  FProducts := TProducts.Create;
  FProductTypes := TProductTypes.Create(TableExProductTypes);

  FAuthForm := TFormOAuth2.Create(nil);
  FAuthForm.OnAfterRedirect := AfterRedirect;
  for i := 0 to PageControlMain.PageCount - 1 do
    PageControlMain.Pages[i].TabVisible := False;
  OperProgress := 0;
  OpenWelcome;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FProducts.Clear;
  FProducts.Free;
  FProductTypes.Clear;
  FProductTypes.Free;
  FBoards.Clear;
  FBoards.Free;
  FNotes.Clear;
  FNotes.Free;
  FDocTypes.Clear;
  FDocTypes.Free;
  FFaveTypes.Clear;
  FFaveTypes.Free;
  FFaves.Clear;
  FFaves.Free;
  FDocs.Clear;
  FDocs.Free;
  FAlbums.Clear;
  FAlbums.Free;
  FVideos.Clear;
  FVideos.Free;
  FAlbumsVideos.Clear;
  FAlbumsVideos.Free;
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

procedure TFormMain.FormResize(Sender: TObject);
begin
  DrawPanelVideosClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelVideosClean.Width div 2;
  DrawPanelPhotosClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelPhotosClean.Width div 2;
  DrawPanelPostsClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelPostsClean.Width div 2;
  DrawPanelFullClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelFullClean.Width div 2;
  DrawPanelFaveClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelFaveClean.Width div 2;
  DrawPanelDocClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelDocClean.Width div 2;
  DrawPanelMessagesClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelMessagesClean.Width div 2;
  DrawPanelNotesClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelNotesClean.Width div 2;
  DrawPanelBoardClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelBoardClean.Width div 2;
  DrawPanelMarketClean.Left := TabSheetWelcome.ClientRect.CenterPoint.X - DrawPanelMarketClean.Width div 2;
end;

procedure TFormMain.LinkRestorePassClick(Sender: TObject);
begin
  WebOpen('https://vk.com/restore');
end;

procedure TFormMain.lkSpinEdit1Change(Sender: TObject);
begin
  DrawPanelProgress.Repaint;
end;

procedure TFormMain.ScrollBoxMenuWallMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
  ScrollBoxMenuWall.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
end;

procedure TFormMain.ScrollBoxMenuWallMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
  ScrollBoxMenuWall.Perform(WM_VSCROLL, SB_LINEUP, 0);
end;

procedure TFormMain.SetFirstName(const Value: string);
begin
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
  if Execute('users.get', [VkFields('photo_50, nickname')]) then
  begin
    FProfile.ID := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<integer>('id', 0);
    FProfile.FirstName := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('first_name', '');
    FProfile.FullName := FProfile.FirstName + ' ' + RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('nickname', '');
    FProfile.FullName := Trim(FProfile.FullName) + ' ' + RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('last_name', '');
    FProfile.Photo50 := RESTResponse.JSONValue.GetValue<TJSONArray>('response').Items[0].GetValue<string>('photo_50', '');
    if FProfile.Photo50 <> '' then
    begin
      Mem := DownloadURL(FProfile.Photo50);
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
    SetFirstName(FProfile.FirstName);
  end;
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
  MessageBox(Handle, '��� ������. ����������� ��������.', '������', MB_ICONINFORMATION or MB_OK);
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

procedure TFormMain.LinkLogClick(Sender: TObject);
begin
  PanelLog.Show;
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
      LabelAuthState.Caption := '������';
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

