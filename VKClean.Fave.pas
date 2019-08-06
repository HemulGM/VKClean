unit VKClean.Fave;

interface

uses
  HGM.Controls.VirtualTable;

type
  TFave = record
    Item_ID: Integer;
    ItemOwner_ID: Integer;
    FaveType: string;
    Seen: Boolean;
    AddedDate: TDateTime;
  end;

  TFaves = class(TTableData<TFave>)
  end;

  TFaveType = record
    Name: string;
    ID: string;
    constructor Create(AID, AName: string);
  end;

  TFaveTypes = class(TTableData<TFaveType>)
    constructor Create(AOwner: TTableEx); override;
    function FindCheckedID(Value: string): Integer;
  end;

implementation

{ TFaveTypes }

constructor TFaveTypes.Create(AOwner: TTableEx);
begin
  inherited;
  Add(TFaveType.Create('post', '������ �� �����'));
  Add(TFaveType.Create('video', '�����������'));
  Add(TFaveType.Create('product', '�����'));
  Add(TFaveType.Create('article', '������'));
  Add(TFaveType.Create('link', '������'));
  Add(TFaveType.Create('user', '����'));
  Add(TFaveType.Create('group', '����������'));
end;

function TFaveTypes.FindCheckedID(Value: string): Integer;
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

{ TFaveType }

constructor TFaveType.Create(AID, AName: string);
begin
  ID := AID;
  Name := AName;
end;

end.

