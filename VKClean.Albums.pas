unit VKClean.Albums;

interface

uses
  HGM.Controls.VirtualTable;

type
  TAlbum = record
    ID: Integer;
    OwnerID: Integer;
    Created: TDateTime;
    Title: string;
    Size: Integer;
  end;

  TAlbums = class(TTableData<TAlbum>)
    function FindCheckedID(Value: Integer): Integer;
  end;

implementation

{ TAlbums }

function TAlbums.FindCheckedID(Value: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count-1 do
  begin
    if not Checked[i] then Continue;
    if Items[i].ID = Value then Exit(i);
  end;
end;

end.

