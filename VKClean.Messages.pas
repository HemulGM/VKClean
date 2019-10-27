unit VKClean.Messages;

interface

uses
  HGM.Controls.VirtualTable;

type
  TConversation = record
    Name: string;
    ID: Integer;
    Friend: Integer;
    ScreenName: string;
    LastMessage: record
      Text: string;
      DateTime: TDateTime;
    end;
    DialogType: string;
  end;

  TConversations = class(TTableData<TConversation>)
  end;

implementation

end.

