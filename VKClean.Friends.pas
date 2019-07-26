unit VKClean.Friends;

interface

uses
  HGM.Controls.VirtualTable;

type
  TFriend = record
    Name: string;
    ID: Integer;
    LastOnline: TDateTime;
    AccState: string;
  end;

  TFriends = class(TTableData<TFriend>)
  end;

implementation

end.

