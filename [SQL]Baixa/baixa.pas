unit baixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBQuery, IBCustomDataSet, IBStoredProc, Db, RxMemDS, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons,
  IBDatabase;

type
  TformBaixa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memBaixa: TRxMemoryData;
    qryPagamento: TIBQuery;
    memBaixaDESCRICAO: TIBStringField;
    memBaixaES: TIntegerField;
    memBaixaDATACADAST: TDateTimeField;
    memBaixaVALOR: TCurrencyField;
    memBaixaDESCONTO: TCurrencyField;
    memBaixaMULTA_JUROS: TCurrencyField;
    memBaixaCODDOCUMENTO: TIntegerField;
    memBaixaCODCONTA: TIntegerField;
    memBaixaINFODOC: TIBStringField;
    memBaixaTIPO: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    dbrTipo: TDBRadioGroup;
    lbMULTA_JUROS: TLabel;
    dedMULTA_JUROS: TDBEdit;
    lbDESCONTO: TLabel;
    dedDESCONTO: TDBEdit;
    lbConta: TLabel;
    memBaixaTOTAL: TCurrencyField;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    qryConta: TIBQuery;
    memBaixanomeconta: TIBStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    spBaixa: TIBStoredProc;
    traBaixa: TIBTransaction;
    traConta: TIBTransaction;
    traPagamento: TIBTransaction;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure qryPagamentoAfterOpen(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure memBaixaESChange(Sender: TField);
    procedure memBaixaTIPOChange(Sender: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure memBaixaBeforePost(DataSet: TDataSet);
    procedure memBaixaAfterInsert(DataSet: TDataSet);
    procedure memBaixaCalcFields(DataSet: TDataSet);
    procedure qryContaAfterOpen(DataSet: TDataSet);
    procedure dbrTipoChange(Sender: TObject);
    procedure dedMULTA_JUROSEnter(Sender: TObject);
    procedure dedMULTA_JUROSExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    codpagamento: integer;
  end;

var
  formBaixa: TformBaixa;

implementation

{$R *.DFM}

uses contas, data_principal, imprimirrecibo;

procedure TformBaixa.FormShow(Sender: TObject);
begin
  memBaixa.open;
  with qryPagamento do
   begin
    if active then close;
    paramByName('CODIGO').AsInteger := codpagamento;
    open;
   end;
end;

procedure TformBaixa.qryPagamentoAfterOpen(DataSet: TDataSet);
begin
  with memBaixa do
   begin
    insert;
    fieldByName('DESCRICAO').AsString :=
      qryPagamento.fieldByName('DESCRICAO').AsString;
    fieldByName('ES').AsInteger :=
      qryPagamento.fieldByName('ES').AsInteger;
    fieldByName('DATACADAST').AsDateTime :=
      qryPagamento.fieldByName('DATACADAST').AsDateTime;
    fieldByName('VALOR').AsCurrency :=
      qryPagamento.fieldByName('VALOR').AsCurrency;
    fieldByName('DESCONTO').AsCurrency := 0;
    fieldByName('MULTA_JUROS').AsCurrency := 0;
    fieldByName('CODDOCUMENTO').AsInteger :=
      qryPagamento.fieldByName('CODDOCUMENTO').AsInteger;
    fieldByName('CODCONTA').AsInteger :=
      qryPagamento.fieldByName('CODCONTA').AsInteger;
    fieldByName('INFODOC').AsString :=
      qryPagamento.fieldByName('INFODOC').AsString;
    fieldByName('TIPO').AsString := 'T';
   end;

  with qryConta do
   begin
    if active then close;
    open;
   end;

end;

procedure TformBaixa.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TformBaixa.memBaixaESChange(Sender: TField);
begin
  if memBaixaES.AsInteger = 1 then
    lbConta.Caption := 'Conta a Débito'
  else
    lbConta.Caption := 'Conta a Crédito';
end;

procedure TformBaixa.memBaixaTIPOChange(Sender: TField);
begin
   lbMULTA_JUROS.Visible  := (memBaixaTIPO.AsString = 'T');
   dedMULTA_JUROS.Visible := (memBaixaTIPO.AsString = 'T');

   lbDESCONTO.Visible   := (memBaixaTIPO.AsString = 'P');
   dedDESCONTO.Visible  := (memBaixaTIPO.AsString = 'P');

   if (not dedMULTA_JUROS.Visible) and (memBaixa.State in [dsInsert, dsEdit]) then
     memBaixaMULTA_JUROS.AsCurrency := 0;
end;

procedure TformBaixa.BitBtn2Click(Sender: TObject);
begin
   { salvo as alteraçoes }
   if dmoPrincipal.Pergunta('Atenção, #! Confira os dados abaixo!' + #13#10#13#10 +
     memBaixaDESCRICAO.AsString + #13#10 + 'Valor: ' +
     FloatToStrF(memBaixaTOTAL.AsCurrency, ffCurrency, 18, 2) + #13#10#13#10 +
     'Ao clicar em Sim, a conta especificada será baixada imediatamente. ' +
     'Tem certeza que deseja efetuar essa baixa?', 'Possiga com cuidado, #!',
     1) = IDYES then
     try
      memBaixa.Post;

      { verifico a possibilidade de imprimir recibo }
      if memBaixaES.AsInteger = 2 then
       with TformImprimirRecibo.Create(Self) do
        try
          inCODMOVIMENTO := Self.qryPagamento.fieldByName('CODMOVIMENTO').AsInteger;
          inNUMERONOTA   := Self.codpagamento;
          showmodal;
        finally
          release;
        end;

     finally
      close;
     end;
end;

procedure TformBaixa.memBaixaBeforePost(DataSet: TDataSet);
begin
  with spBaixa do
   try
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    paramByName('CODIGO').AsInteger := codpagamento;
    paramByName('MULTA_JUROS').AsCurrency := memBaixaMULTA_JUROS.AsCurrency;

    if dbrTipo.ItemIndex = 0 then
      paramByName('DESCONTO').AsCurrency := memBaixaDESCONTO.AsCurrency
    else
      paramByName('DESCONTO').AsCurrency := memBaixaVALOR.AsCurrency -
         memBaixaDESCONTO.AsCurrency;

    paramByName('TIPO').AsString := memBaixaTIPO.AsString;
    paramByName('CONTA').AsInteger := memBaixaCODCONTA.AsInteger;
    paramByName('CODDOCUMENTO').AsInteger := memBaixaCODDOCUMENTO.AsInteger;
    paramByName('INFODOC').AsString := memBaixaINFODOC.AsString;
    paramByName('USUARIO').AsString := '';
    prepare;
    ExecProc;
    if prepared then unprepare;
    Transaction.Commit;
   except
    on exception do
     begin
      if prepared then unprepare;
      Transaction.Rollback;
      raise;
     end;
   end;
end;

procedure TformBaixa.memBaixaAfterInsert(DataSet: TDataSet);
begin
  dedMULTA_JUROS.SetFocus;
end;

procedure TformBaixa.memBaixaCalcFields(DataSet: TDataSet);
begin
  if dbrTipo.ItemIndex = 0 then
    memBaixaTOTAL.AsCurrency :=
      memBaixaVALOR.AsCurrency -
      memBaixaDESCONTO.AsCurrency +
      memBaixaMULTA_JUROS.AsCurrency
  else
    memBaixaTOTAL.AsCurrency :=
      memBaixaDESCONTO.AsCurrency;
end;

procedure TformBaixa.qryContaAfterOpen(DataSet: TDataSet);
begin
   (Dataset as TIBQuery).FetchAll;
end;

procedure TformBaixa.dbrTipoChange(Sender: TObject);
begin
   lbMULTA_JUROS.Visible  := (dbrTipo.ItemIndex = 0);
   dedMULTA_JUROS.Visible := (dbrTipo.ItemIndex = 0);

   lbDESCONTO.Visible   := (dbrTipo.ItemIndex = 1);
   dedDESCONTO.Visible  := (dbrTipo.ItemIndex = 1);

   if (not dedMULTA_JUROS.Visible) and (memBaixa.State in [dsInsert, dsEdit]) then
    begin
      memBaixaMULTA_JUROS.AsCurrency := 0;
      memBaixaDESCONTO.AsCurrency := memBaixaVALOR.AsCurrency;
    end;

   if dedMULTA_JUROS.Visible then
    begin
      memBaixaDESCONTO.AsCurrency := 0;
      dedMULTA_JUROS.SetFocus;
    end else dedDESCONTO.SetFocus;
end;

procedure TformBaixa.dedMULTA_JUROSEnter(Sender: TObject);
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

procedure TformBaixa.dedMULTA_JUROSExit(Sender: TObject);
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

procedure TformBaixa.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
