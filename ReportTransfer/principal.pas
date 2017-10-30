unit principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ExtCtrls, IBDatabase, Db, IBCustomDataSet,
  IBQuery, IBSQL, IBUpdateSQL;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edorigem: TcxButtonEdit;
    eddestino: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbWork: TLabel;
    OpenDialog: TOpenDialog;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabase2: TIBDatabase;
    IBTransaction2: TIBTransaction;
    qryFolder1: TIBQuery;
    qryItem1: TIBQuery;
    qryFolder1FOLDER_ID: TIntegerField;
    qryFolder1NAME: TIBStringField;
    qryFolder1PARENT_ID: TIntegerField;
    qryItem1ITEM_ID: TIntegerField;
    qryItem1FOLDER_ID: TIntegerField;
    qryItem1NAME: TIBStringField;
    qryItem1ITEM_SIZE: TIntegerField;
    qryItem1ITEM_TYPE: TIntegerField;
    qryItem1MODIFIED: TFloatField;
    qryItem1DELETED: TFloatField;
    qryItem1TEMPLATE: TBlobField;
    qryFolder2: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField2: TIntegerField;
    qryItem2: TIBQuery;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IBStringField2: TIBStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    BlobField1: TBlobField;
    IBSQL2: TIBSQL;
    updFolder2: TIBUpdateSQL;
    updItem2: TIBUpdateSQL;
    qryMaxFolder1: TIBQuery;
    qryMaxItem1: TIBQuery;
    qryMaxFolder1FOLDER: TIntegerField;
    qryMaxItem1ITEM: TIntegerField;
    procedure edorigemEnter(Sender: TObject);
    procedure edorigemExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure edorigemDblClick(Sender: TObject);
    procedure eddestinoDblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.edorigemEnter(Sender: TObject);
var
  i: word;
begin
   if Sender is TEdit then
    begin
     TEdit(Sender).Color := clInfoBK;
     TEdit(Sender).Font.Style := [fsBold];
    end;
   if Sender is TcxButtonEdit then
    begin
     TcxButtonEdit(Sender).Style.Color := clInfoBK;
     TcxButtonEdit(Sender).Style.Font.Style := [fsBold];
     TcxButtonEdit(Sender).Style.Shadow := True;
    end;

   { coloco o label em negrito }
   for i := 0 to ComponentCount -1 do
    if Components[i] is TLabel then
     if (Components[i] as TLabel).FocusControl = Sender then
      if (Components[i] as TLabel).Font.Color = clMaroon then
       (Components[i] as TLabel).Font.Style := [fsBold, fsUnderline]
      else
       (Components[i] as TLabel).Font.Style := [fsBold];
end;

procedure TForm1.edorigemExit(Sender: TObject);
var
  i: word;
begin
   if Sender is TEdit then
    begin
     TEdit(Sender).Color := clWindow;
     TEdit(Sender).Font.Style := [];
    end;
   if Sender is TcxButtonEdit then
    begin
     TcxButtonEdit(Sender).Style.Color := clWindow;
     TcxButtonEdit(Sender).Style.Font.Style := [];
     TcxButtonEdit(Sender).Style.Shadow := False;
    end;

   { coloco o label em negrito }
   for i := 0 to ComponentCount -1 do
    if Components[i] is TLabel then
     if (Components[i] as TLabel).FocusControl = Sender then
      if (Components[i] as TLabel).Font.Color = clMaroon then
       (Components[i] as TLabel).Font.Style := [fsUnderline]
      else
       (Components[i] as TLabel).Font.Style := [];
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.edorigemDblClick(Sender: TObject);
begin
  with OpenDialog do
   begin
    Title := 'Banco de Dados de Origem';
    if execute then
      edorigem.text := filename;
   end;
end;

procedure TForm1.eddestinoDblClick(Sender: TObject);
begin
  with OpenDialog do
   begin
    Title := 'Banco de Dados de Destino';
    if execute then
      eddestino.text := filename;
   end;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
var
  maxFolders, maxItems: integer;
begin

  { iniciando o serviço }
  lbWork.Caption := 'Iniciando o serviço...';
  Application.ProcessMessages;

  IBDatabase1.DatabaseName := edorigem.text;
  IBDatabase2.DatabaseName := eddestino.text;

  lbWork.Caption := 'Conectando a origem...';
  Application.ProcessMessages;

  try
    IBDatabase1.Connected := True;
  except
    on exception do
     begin
       lbWork.Caption := 'ERRO CONECTANDO ORIGEM';
       Application.ProcessMessages;
       exit;
     end;
  end;

  lbWork.Caption := 'Conectando ao destino...';
  Application.ProcessMessages;

  try
    IBDatabase2.Connected := True;
  except
    on exception do
     begin
       lbWork.Caption := 'ERRO CONECTANDO DESTINO';
       Application.ProcessMessages;
       exit;
     end;
  end;

  lbWork.Caption := 'Apagando relatórios antigos do destino...';
  Application.ProcessMessages;

  with IBSQL2 do
   begin
     if not Transaction.Active then
       Transaction.StartTransaction;
     SQL.Text := 'ALTER TRIGGER SET_FOLDER_ID INACTIVE';
     ExecQuery;
     SQL.Text := 'ALTER TRIGGER SET_ITEM_ID INACTIVE';
     ExecQuery;
     SQL.Text := 'DELETE FROM RB_ITEM';
     ExecQuery;
     SQL.Text := 'DELETE FROM RB_FOLDER';
     ExecQuery;
     Transaction.Commit;
   end;

  lbWork.Caption := 'Contando Itens na origem...';
  Application.ProcessMessages;

  with qryMaxFolder1 do
   begin
    open;
    maxFolders := fieldByName('FOLDER').AsInteger;
    close;
   end;

  with qryMaxItem1 do
   begin
    open;
    maxItems := fieldByName('ITEM').AsInteger;
    close;
   end;

  lbWork.Caption := 'Transferindo pastas...';
  Application.ProcessMessages;

  with qryFolder2 do
   begin
    open;
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
   end;

  with qryFolder1 do
   begin
    open;
    while not eof do
     begin
       lbWork.Caption := 'Transferindo pasta ' +
         trim(fieldByName('NAME').AsString) + '...';
       Application.ProcessMessages;

       qryFolder2.AppendRecord([
         fieldByName('FOLDER_ID').Value,
         fieldByName('NAME').Value,
         fieldByName('PARENT_ID').Value]);

       next;
     end;
    active := false;
   end;

  with qryFolder2 do
   begin
    Transaction.Commit;
    if active then close;
   end;

  lbWork.Caption := 'Transferindo relatórios...';
  Application.ProcessMessages;

  with qryItem2 do
   begin
    open;
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
   end;

  with qryItem1 do
   begin
    open;
    while not eof do
     begin
       lbWork.Caption := 'Transferindo relatório ' +
         trim(fieldByName('NAME').AsString) + '...';
       Application.ProcessMessages;

       qryItem2.AppendRecord([
         fieldByname('ITEM_ID').Value,
         fieldByName('FOLDER_ID').Value,
         fieldByname('NAME').Value,
         fieldByName('ITEM_SIZE').Value,
         fieldByName('ITEM_TYPE').Value,
         fieldByName('MODIFIED').Value,
         fieldByName('DELETED').Value,
         fieldByName('TEMPLATE').Value]);

       next;
     end;
    active := false;
   end;

  with qryItem2 do
   begin
    Transaction.Commit;
    if active then close;
   end;

  lbWork.Caption := 'Terminando...';
  Application.ProcessMessages;

  { ativo os triggers e seto os generators }
  with IBSQL2 do
   begin
     if not Transaction.Active then
       Transaction.StartTransaction;
     SQL.Text := 'ALTER TRIGGER SET_FOLDER_ID ACTIVE';
     ExecQuery;
     SQL.Text := 'ALTER TRIGGER SET_ITEM_ID ACTIVE';
     ExecQuery;
     SQL.Text := 'SET GENERATOR FOLDER_ID_GEN TO ' + IntToStr(maxFolders);
     ExecQuery;
     SQL.Text := 'SET GENERATOR ITEM_ID_GEN TO ' + IntToStr(maxItems);
     ExecQuery;
     Transaction.Commit;
   end;

  IBDatabase1.Connected := False;
  IBDatabase2.Connected := False;

  { termino o serviço }
  lbWork.Caption := 'Transferência concluída!';
  Application.ProcessMessages;

end;

end.
