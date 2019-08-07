unit VKClean.MarketTypes;

interface

uses
  HGM.Controls.VirtualTable;

type
  TProductType = record
    ID: Integer;
    Name: string;
    Section: string;
  end;

  TProductTypes = class(TTableData<TProductType>)
    function FindCheckedID(Value: Integer): Integer;
  end;

implementation

{ TProductTypes }

function TProductTypes.FindCheckedID(Value: Integer): Integer;
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

