unit VKClean.Posts;

interface

uses
  HGM.Controls.VirtualTable;

type
  TPost = record
    ID: Integer;
    FromID: Integer;
    OwnerID: Integer;
    Date: TDateTime;
    Likes: Integer;
  end;

  TPosts = class(TTableData<TPost>)
  end;

implementation

end.

