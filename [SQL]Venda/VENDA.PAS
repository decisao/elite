unit venda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, DBCGrids, Db, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc,
  MemTable, TB97Tlbr, TB97Ctls, TB97, Buttons, Placemnt;

type
  TformVenda = class(TForm)
    Panel1: TPanel;
    lblCLIENTE: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    memVenda: TMemoryTable;
    dsrVenda: TDataSource;
    memVendaCODIGO: TIntegerField;
    memVendaBARRA: TIBStringField;
    memVendaDESCRICAO: TIBStringField;
    memVendaPRECO1: TCurrencyField;
    memVendaPRECO2: TCurrencyField;
    memVendaDESCONTO: TCurrencyField;
    memVendaCANCELAR: TBooleanField;
    TimerVenda: TTimer;
    TimerCancel: TTimer;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    HeaderControl1: THeaderControl;
    DBEdit3: TDBEdit;
    memVendaICMSVENDA: TFloatField;
    qryMovimentos: TIBQuery;
    dsrMovimentos: TDataSource;
    updMovimentos: TIBUpdateSQL;
    DBText2: TDBText;
    qryCliente: TIBQuery;
    dsrCliente: TDataSource;
    DBText3: TDBText;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FormStorage: TFormStorage;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    qryVendedor: TIBQuery;
    dsrVendedor: TDataSource;
    procedure TimerVendaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCancelTimer(Sender: TObject);
    procedure memVendaPRECO2Change(Sender: TField);
    procedure memVendaAfterOpen(DataSet: TDataSet);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure qryMovimentosAfterInsert(DataSet: TDataSet);
    procedure lblCLIENTEClick(Sender: TObject);
    procedure qryMovimentosAfterOpen(DataSet: TDataSet);
    procedure DBEdit14Enter(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fldCLIENTEmudar(Sender: TField);
    procedure fldVENDEDORmudar(Sender: TField);
    procedure fldDESCONTOmudar(Sender: TField);
  end;

var
  formVenda: TformVenda;

implementation

uses data_principal, clientes, vendedores, produtos;

{$R *.DFM}

procedure TformVenda.TimerVendaTimer(Sender: TObject);
var
  soma: extended;
begin

end;

procedure TformVenda.FormShow(Sender: TObject);
begin
//     qryMovimentos.Prepare;
     memVenda.Open;
     qryMovimentos.Open;
     qryMovimentos.Insert;
     DBEdit14.SetFocus;
end;

procedure TformVenda.TimerCancelTimer(Sender: TObject);
begin
     TimerCancel.Enabled := False;
     memVenda.Cancel;
end;

procedure TformVenda.memVendaPRECO2Change(Sender: TField);
begin
     TimerVenda.Enabled := True;
end;

procedure TformVenda.memVendaAfterOpen(DataSet: TDataSet);
begin
    with Dataset do
      begin
       (fieldByName('ICMSVENDA') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('ICMSVENDA') as TNumericField).EditFormat := '##0.00';
      end;
end;

procedure TformVenda.DBCheckBox1Click(Sender: TObject);
begin
   memVendaPRECO2Change(nil);
end;

procedure TformVenda.qryMovimentosAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName('CODIGO').AsInteger :=
      dmoPrincipal.LerSequencia('MOVIMENTOS');

    with Dataset do
     begin
      { orçamento não é entrada nem saída }
      fieldByName('ES').AsInteger := 2;
      { tipo 1 = orçamento }
      fieldByName('TIPO').AsInteger := 5;
      fieldByName('DATA').AsDateTime := Now;
      fieldByName('VALOR_SERVICOS').AsCurrency := 0.0;
      fieldByName('VALOR_ITENS').AsCurrency := 0.0;
      fieldByName('DESCONTO').AsCurrency := 0.0;
     end;

    Application.ProcessMessages;

end;

procedure TformVenda.fldCLIENTEmudar(Sender: TField);
begin
  qryCliente.Close;

  if Sender.AsString > '' then
   with qryCliente do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;
end;

procedure TformVenda.fldVENDEDORmudar(Sender: TField);
begin
  qryVendedor.Close;

  if Sender.AsString > '' then
   with qryVendedor do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;
end;

procedure TformVenda.lblCLIENTEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryMovimentos.fieldByName('CODCLIENTE').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       free;
      end;
     Application.ProcessMessages;
end;

procedure TformVenda.fldDESCONTOmudar(Sender: TField);
begin
  with qryMovimentos do
    fieldByName('VALOR_TOTAL').AsCurrency :=
      (fieldByName('VALOR_ITENS').AsCurrency +
      fieldByName('VALOR_SERVICOS').AsCurrency) -
      fieldByName('DESCONTO').AsCurrency;
  Application.ProcessMessages;
end;

procedure TformVenda.qryMovimentosAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

       { rotinas de chamada }
       fieldByName('CODCLIENTE').OnChange := fldCLIENTEmudar;
       fieldByName('CODVENDEDOR').OnChange := fldVENDEDORmudar;
       fieldByName('DESCONTO').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_ITENS').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_SERVICOS').OnChange := fldDESCONTOmudar;

       { forço a primeira chamada }
       fldCLIENTEmudar(fieldByName('CODCLIENTE'));
       fldVENDEDORmudar(fieldByName('CODVENDEDOR'));

      end;

end;

procedure TformVenda.DBEdit14Enter(Sender: TObject);
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

procedure TformVenda.DBEdit14Exit(Sender: TObject);
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

procedure TformVenda.Label6Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformVendedores.Create(Self) do
      try
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryMovimentos.fieldByName('CODVENDEDOR').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       free;
      end;
     Application.ProcessMessages;

end;

procedure TformVenda.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F4 then
   begin
     Screen.Cursor := crHourGlass;
     with TformProdutos.Create(Self) do
      try
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        if not (Self.memVenda.State in [dsInsert, dsEdit]) then
         begin
          Self.memVenda.Edit;
          Self.memVenda.fieldByName('BARRA').AsString :=
            qrySelecionar.fieldByName('BARRA').AsString;
         end;
      finally
       free;
      end;
     Application.ProcessMessages;
   end;

end;

end.
