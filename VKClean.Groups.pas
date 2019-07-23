unit VKClean.Groups;

interface
  uses
    HGM.Controls.VirtualTable;

  type
    TGroup = record
      Name: string;
      ID: Integer;
      LastMessage: record
        Text: string;
        DateTime: TDateTime;
      end;
    end;
    TGroups = class(TTableData<TGroup>)

    end;

implementation

end.
