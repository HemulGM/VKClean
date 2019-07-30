unit VKClean.Photos;

interface

uses
  HGM.Controls.VirtualTable;

type
  TPhoto = record
    ID: Integer;
    AlbumID: Integer;
    OwnerID: Integer;
    Date: TDateTime;
    Likes: Integer;
    Reposts: Integer;
  end;

  TPhotos = class(TTableData<TPhoto>)
  end;

implementation

end.

