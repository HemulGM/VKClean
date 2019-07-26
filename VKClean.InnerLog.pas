unit VKClean.InnerLog;

interface

uses
  HGM.Controls.VirtualTable;

type
  TLog = record
    DateTime: TDateTime;
    Text: string;
  end;

  TLogs = class(TTableData<TLog>)
  end;

implementation

end.

