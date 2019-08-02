unit VKClean.DocTypes;

interface

uses
  HGM.Controls.VirtualTable;

type
  TDocType = record
    ID: Integer;
    Name: string;
    Count: Integer;
  end;

  TDocTypes = class(TTableData<TDocType>)
    function FindCheckedID(Value: Integer): Integer;
  end;

implementation

{ TDocTypes }

function TDocTypes.FindCheckedID(Value: Integer): Integer;
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

