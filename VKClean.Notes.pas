unit VKClean.Notes;

interface

uses
  HGM.Controls.VirtualTable;

type
  TNote = record
    ID: Integer;
    Title: string;
    Date: TDateTime;
  end;

  TNotes = class(TTableData<TNote>)
  end;

implementation

end.



{
"id": 11934106,
"owner_id": 58553419,
"comments": 0,
"read_comments": 0,
"date": 1497606004,
"title": "—сылки",
}