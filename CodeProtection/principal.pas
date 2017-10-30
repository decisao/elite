unit principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, IBDatabase, Db, IBCustomDataSet, IBQuery, DBISAMTb, ComCtrls;

type
  TformPrincipal = class(TForm)
    IBDatabase: TIBDatabase;
    IBQuery: TIBQuery;
    IBTransaction: TIBTransaction;
    MainMenu: TMainMenu;
    CodeProtection1: TMenuItem;
    ProtectaInterBasedatabase1: TMenuItem;
    Restorefromstoredcode1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    DBISAMSession: TDBISAMSession;
    DBISAMDatabase: TDBISAMDatabase;
    DBISAMTable: TDBISAMTable;
    N3: TMenuItem;
    Localdatabaserepair1: TMenuItem;
    Localdatabasebackup1: TMenuItem;
    DBISAMTableCODIGO: TAutoIncField;
    DBISAMTableTIPO: TStringField;
    DBISAMTableNOME: TStringField;
    DBISAMTableFONTE: TBlobField;
    StatusBar1: TStatusBar;
    procedure ProtectaInterBasedatabase1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.DFM}

procedure TformPrincipal.ProtectaInterBasedatabase1Click(Sender: TObject);
begin

   with IBQuery do
    begin
     if active then close;
     open;
     fetchall;
    end;

   with DBISAMTable do
    begin
     if active then close;
     open;
    end;

   while not IBQuery.eof do
    begin

     DBISAMTable.InsertRecord([
        nil,
        'P',
        trim(IBQuery.fieldByName('RDB$PROCEDURE_NAME').AsString),
        IBQuery.fieldByName('RDB$PROCEDURE_SOURCE').AsString
     ]);

     IBQuery.next;

    end;

   DBISAMTable.close;
   IBQuery.close;

end;

end.
