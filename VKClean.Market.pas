unit VKClean.Market;

interface

uses
  HGM.Controls.VirtualTable;

type
  TProduct = record
    ID: Integer;
    CategoryID: Integer;
    OwnerID: Integer;
    Title: string;
    Amount: Integer;
    Date: TDateTime;
  end;

  TProducts = class(TTableData<TProduct>)
  end;

implementation

end.

