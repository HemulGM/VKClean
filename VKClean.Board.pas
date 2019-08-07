unit VKClean.Board;

interface

uses
  HGM.Controls.VirtualTable;

type
  TBoard = record
    ID: Integer;
    Title: string;
    IsClosed: Boolean;
    Created: TDateTime;
    Updated: TDateTime;
    Comments: Integer;
  end;

  TBoards = class(TTableData<TBoard>)
  end;

  {
  "id": 35487172,
"title": "Streaming API Contest",
"created": 1498643013,
"created_by": 101,
"updated": 1501764414,
"updated_by": 928041,
"is_closed": 1,
"is_fixed": 1,
"comments": 80
  }

implementation

end.

