unit VKClean.RequestConstruct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IPPeerClient, REST.Client, REST.Authenticator.OAuth, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TParam = array[0..1] of string;

  TRequestConstruct = class
    class var
      Response: TRESTResponse;
    class var
      Client: TRESTClient;
  public
    class function Request(Resource: string; Params: array of TParam): TRESTRequest;
  end;

function Param(Name, Value: string; Ignore: Boolean = False): TParam;

function VkExtended: TParam;
     
function VkNeedSystem: TParam;

function VkCount1: TParam;

function VkCount(Value: Integer): TParam;  
     
function VkOffset(Value: Integer): TParam;

function VkTopic(Value: Integer): TParam;

function VkOwner(Value: Integer): TParam; overload;

function VkOwner(Value: Integer; Ignore: Boolean): TParam; overload;

function VkGroup(Value: Integer): TParam; overload;

function VkGroup(Value: Integer; Ignore: Boolean): TParam;  overload;

function VkAlbum(Value: Integer): TParam; overload;

function VkAlbum(Value: string): TParam; overload;

function VkVideo(Value: Integer): TParam;

function VkUser(Value: Integer): TParam;

function VkPost(Value: Integer): TParam;

function VkDoc(Value: Integer): TParam;

function VkPhoto(Value: Integer): TParam;

function VkFilter(Value: string): TParam;

function VkFields(Value: string): TParam;

function VkOrder(Value: string): TParam;

function VkArticle(Value: Integer): TParam;

function VkLink(Value: Integer): TParam;

function VkID(Value: Integer): TParam;

function VkNote(Value: Integer): TParam;

implementation

function VkTopic(Value: Integer): TParam;
begin
  Result[0] := 'topic_id';
  Result[1] := Value.ToString;
end;

function VkNote(Value: Integer): TParam;
begin
  Result[0] := 'note_id';
  Result[1] := Value.ToString;
end;

function VkID(Value: Integer): TParam;
begin
  Result[0] := 'id';
  Result[1] := Value.ToString;
end;

function VkLink(Value: Integer): TParam;
begin
  Result[0] := 'link_id';
  Result[1] := Value.ToString;
end;

function VkArticle(Value: Integer): TParam;
begin
  Result[0] := 'article_id';
  Result[1] := Value.ToString;
end;

function VkDoc(Value: Integer): TParam;
begin
  Result[0] := 'doc_id';
  Result[1] := Value.ToString;
end;

function VkOrder(Value: string): TParam;
begin
  Result[0] := 'order';
  Result[1] := Value;
end;

function VkFilter(Value: string): TParam;
begin
  Result[0] := 'filter';
  Result[1] := Value;
end;

function VkFields(Value: string): TParam;
begin
  Result[0] := 'fields';
  Result[1] := Value;
end;

function VkPhoto(Value: Integer): TParam;
begin
  Result[0] := 'photo_id';
  Result[1] := Value.ToString;
end;

function VkPost(Value: Integer): TParam;
begin
  Result[0] := 'post_id';
  Result[1] := Value.ToString;
end;

function VkGroup(Value: Integer; Ignore: Boolean): TParam;
begin
  if not Ignore then
  begin
    Result[0] := 'group_id';
    Result[1] := Value.ToString;
  end
  else Result[0] := '';
end;

function VkGroup(Value: Integer): TParam;
begin
  Result[0] := 'group_id';
  Result[1] := Value.ToString;
end;

function VkUser(Value: Integer): TParam;
begin
  Result[0] := 'user_id';
  Result[1] := Value.ToString;
end;

function VkOffset(Value: Integer): TParam;
begin
  Result[0] := 'offset';
  Result[1] := Value.ToString;
end;

function VkVideo(Value: Integer): TParam;
begin
  Result[0] := 'video_id';
  Result[1] := Value.ToString;
end;

function VkAlbum(Value: Integer): TParam;
begin
  Result[0] := 'album_id';
  Result[1] := Value.ToString;
end;

function VkAlbum(Value: string): TParam;
begin
  Result[0] := 'album_id';
  Result[1] := Value;
end;

function VkOwner(Value: Integer): TParam;
begin
  Result[0] := 'owner_id';
  Result[1] := Value.ToString;
end;

function VkOwner(Value: Integer; Ignore: Boolean): TParam;
begin
  if not Ignore then
  begin
    Result[0] := 'owner_id';
    Result[1] := Value.ToString;
  end
  else
    Result[0] := '';
end;

function VkCount1: TParam;
begin
  Result[0] := 'count';
  Result[1] := '1';
end;

function VkCount(Value: Integer): TParam;
begin
  Result[0] := 'count';
  Result[1] := Value.ToString;
end;

function VkExtended: TParam;
begin
  Result[0] := 'extended';
  Result[1] := '1';
end;     

function VkNeedSystem: TParam;
begin
  Result[0] := 'need_system';
  Result[1] := '1';
end;

function Param(Name, Value: string; Ignore: Boolean): TParam;
begin
  if not Ignore then
  begin
    Result[0] := Name;
    Result[1] := Value;
  end
  else
    Result[0] := '';
end;

{ TRequsetConstruct }

class function TRequestConstruct.Request(Resource: string; Params: array of TParam): TRESTRequest;
var
  Param: TParam;
begin
  Result := TRESTRequest.Create(nil);
  Result.Client := Client;
  Result.Response := Response;
  Result.Resource := Resource;
  for Param in Params do
  begin
    if Param[0] <> '' then
      Result.Params.AddItem(Param[0], Param[1]);
  end;
end;

{

if Execute(TRequsetConstruct.Create('wall.get', [['count', '200'], ['offset', '0']), True) then ...

}

end.

