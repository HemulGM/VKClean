unit VKClean.Videos;

interface

uses
  HGM.Controls.VirtualTable;

type
  TVideo = record
    ID: Integer;
    AlbumID: Integer;
    OwnerID: Integer;
    Date: TDateTime;
    Likes: Integer;
    Reposts: Integer;
  end;

  TVideos = class(TTableData<TVideo>)
  end;

  {
  id": 456239194,
"owner_id": 58553419,
"title": "45 Days in the Himalayas - A Time-Lapse Film",
"duration": 150,
"description": "",
"date": 1563987671,
"comments": 0,
"views": 10,
"width": 1280,
"height": 720,
  }

implementation

end.

