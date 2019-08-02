unit VKClean.Docs;

interface

uses
  HGM.Controls.VirtualTable;

type
  TDoc = record
    ID: Integer;
    TypeID: Integer;
    OwnerID: Integer;
    Date: TDateTime;
  end;

  TDocs = class(TTableData<TDoc>)
  end;

implementation

end.

