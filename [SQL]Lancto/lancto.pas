unit lancto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, RxMemDS, ExtCtrls, ComCtrls, Buttons,
  IBQuery, IBCustomDataSet, IBStoredProc, IBDatabase;

type
  TformLANCTO = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memLANCTO: TRxMemoryData;
    memLANCTODATAHORA: TDateTimeField;
    memLANCTODESCRICAO: TIBStringField;
    memLANCTOVALOR: TCurrencyField;
    memLANCTOCONTADEB: TIntegerField;
    memLANCTOCONTACRE: TIntegerField;
    memLANCTOCODDOC: TIntegerField;
    memLANCTOCODBANCO: TIntegerField;
    memLANCTONUMCHEQUE: TIBStringField;
    memLANCTONUMCC: TIBStringField;
    memLANCTONUMAUTORIZ: TIBStringField;
    memLANCTONUMIDOUTROS: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsrLANCTO: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    PageControl1: TPageControl;
    tsCheque: TTabSheet;
    tsCartao: TTabSheet;
    tsOutros: TTabSheet;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    qryContaDeb: TIBQuery;
    memLANCTOnomedeb: TIBStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    qryContaCre: TIBQuery;
    memLANCTOnomecre: TIBStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    qryDoc: TIBQuery;
    memLANCTOnomedoc: TIBStringField;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    spLANCTO: TIBStoredProc;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    memLANCTOINFODOC: TIBStringField;
    traContaDeb: TIBTransaction;
    traContaCre: TIBTransaction;
    traDoc: TIBTransaction;
    traLANCTO: TIBTransaction;
    procedure memLANCTOAfterOpen(DataSet: TDataSet);
    procedure memLANCTOBeforeClose(DataSet: TDataSet);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure memLANCTOAfterInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure memLANCTOBeforePost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLANCTO: TformLANCTO;

implementation

uses
  documentos, contas, data_principal;

{$R *.DFM}

procedure TformLANCTO.memLANCTOAfterOpen(DataSet: TDataSet);
begin
  qryContaDeb.Open;
  qryContaCre.Open;
  qryDoc.open;
end;

procedure TformLANCTO.memLANCTOBeforeClose(DataSet: TDataSet);
begin
  qryDoc.close;
  qryContaCre.Close;
  qryContaDeb.Close;
end;

procedure TformLANCTO.Label4Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformContas.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.memLANCTO.fieldByName('CONTADEB').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformLANCTO.Label5Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformContas.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.memLANCTO.fieldByName('CONTACRE').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformLANCTO.Label6Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformDocumentos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.memLANCTO.fieldByName('CODDOC').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformLANCTO.memLANCTOAfterInsert(DataSet: TDataSet);
begin
   Dataset.fieldByName('DATAHORA').AsDateTime :=
         dmoPrincipal.GetServerTime;
   DBEdit2.Setfocus;
end;

procedure TformLANCTO.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TformLANCTO.FormShow(Sender: TObject);
begin
  with memLANCTO do
   begin
    open;
    insert;
   end;
end;

procedure TformLANCTO.DBEdit2Enter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clInfoBK;
       TDBEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clInfoBK;
       TDBMemo(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformLANCTO.DBEdit2Exit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformLANCTO.memLANCTOBeforePost(DataSet: TDataSet);
begin
   with memLANCTO do
    begin

     if fieldByName('CONTADEB').IsNull and
        fieldByName('CONTACRE').IsNull then
      begin
        ShowMessage('Você deve especificar pelo menos uma conta!');
        abort;
        exit;
      end;

     if fieldByName('CONTADEB').AsInteger =
        fieldByName('CONTACRE').AsInteger then
      begin
        ShowMessage('Não é possível utilizar a mesma conta para crédito e débito na mesma operação!');
        abort;
        exit;
      end;

     if fieldByName('CODDOC').IsNull then
      begin
        ShowMessage('Você deve especificar um tipo de documento!');
        abort;
        exit;
      end;

    end;

   with spLANCTO do
    try

      if not Transaction.InTransaction then
        Transaction.StartTransaction;

      if not memLANCTO.fieldByName('CONTADEB').IsNull then
       begin
        paramByName('CONTA').AsInteger :=
          memLANCTO.fieldByName('CONTADEB').AsInteger;
        paramByName('TIPO').AsString := 'D';
        paramByName('DESCRICAO').AsString :=
          memLANCTO.fieldByName('DESCRICAO').AsString;
        paramByName('VALOR').AsCurrency :=
          memLANCTO.fieldByName('VALOR').AsCurrency;
        paramByName('INFODOC').AsString :=
          memLANCTO.fieldByName('INFODOC').AsString;
        paramByName('CODDOC').AsInteger :=
          memLANCTO.fieldByName('CODDOC').AsInteger;
        paramByName('CODEMPRESA').AsInteger :=
          dmoPrincipal.empresa;
        prepare;
        ExecProc;
        if prepared then unprepare;
       end;

      if not memLANCTO.fieldByName('CONTACRE').IsNull then
       begin
        paramByName('CONTA').AsInteger :=
          memLANCTO.fieldByName('CONTACRE').AsInteger;
        paramByName('TIPO').AsString := 'C';
        paramByName('DESCRICAO').AsString :=
          memLANCTO.fieldByName('DESCRICAO').AsString;
        paramByName('VALOR').AsCurrency :=
          memLANCTO.fieldByName('VALOR').AsCurrency;
        paramByName('INFODOC').AsString :=
          memLANCTO.fieldByName('INFODOC').AsString;
        paramByName('CODDOC').AsInteger :=
          memLANCTO.fieldByName('CODDOC').AsInteger;
        paramByName('CODEMPRESA').AsInteger :=
          dmoPrincipal.empresa;
        prepare;
        ExecProc;
        if prepared then unprepare;
       end;

      Transaction.Commit;

    except
      on exception do
       begin
        if prepared then unprepare;
        Transaction.Rollback;
        raise;
       end
    end;

end;

procedure TformLANCTO.BitBtn2Click(Sender: TObject);
var
  erro: boolean;
begin
   erro := false;
   try
     memLANCTO.Post;
   except
     on exception do
      begin
       raise;
       erro := true;
      end;
   end;

   if not erro then
    begin
      if dmoPrincipal.Pergunta(
           'Lançamento efetuado com sucesso, #!' +#13#10#13#10+
           'Deseja fazer mais um lançamento e/ou transferência em conta?',
           '#, você vai continuar?',
           1) = IDYES then memLANCTO.Insert
       else close;
    end;
end;

procedure TformLANCTO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
         Self.ModalResult := mrCancel;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if key = vk_Return then
      if shift = [] then Perform(wm_NextDlgCtl, 0, 0) else
       if shift = [ssShift] then Perform(wm_NextDlgCtl, 0, 0);

     if not odd(atag) then
      begin
       case key of
        vk_Down: Perform(wm_NextDlgCtl, 0, 0);
        vk_Up: Perform(wm_NextDlgCtl, 1, 0);
       end;
      end;
end;

procedure TformLANCTO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Screen.Cursor := crDefault;
end;

end.
