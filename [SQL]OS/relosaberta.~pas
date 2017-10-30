{ QuickReport list template }

unit relosaberta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, qrprntr, DB, IBQuery, IBCustomDataSet, IBStoredProc, ExtCtrls, MemTable,
  IBDatabase, RxMemDS;

type
  TrelatOSaberta = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRLabel37: TQRLabel;
    QRShape7: TQRShape;
    QRShape12: TQRShape;
    qryOrcamento: TIBQuery;
    qryItens: TIBQuery;
    meSERVICOS: TQRMemo;
    meOPCIONAIS: TQRMemo;
    meCONDICOES1: TQRMemo;
    meCONDICOES2: TQRMemo;
    QRShape17: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRImage2: TQRImage;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRDBText24: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape18: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText26: TQRDBText;
    QRShape10: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    meEQUIPAMENTO: TQRMemo;
    QRLabel23: TQRLabel;
    QRShape24: TQRShape;
    mePROBLEMA: TQRMemo;
    QRLabel30: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText38: TQRDBText;
    traOrcamento: TIBTransaction;
    traItens: TIBTransaction;
    memItens: TRxMemoryData;
    memItensCODIGO: TStringField;
    memItensDESCRICAO: TStringField;
    memItensVALOR_UNITARIO: TStringField;
    memItensDESCONTO: TStringField;
    memItensQUANTIDADE: TStringField;
    memItensVALOR_TOTAL: TStringField;
    procedure relatOrcamentoPreview(Sender: TObject);
    procedure qryOrcamentoAfterOpen(DataSet: TDataSet);
    procedure qryItensAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relatOSaberta: TrelatOSaberta;

implementation

uses data_principal, preview;


{$R *.DFM}

procedure TrelatOSaberta.relatOrcamentoPreview(Sender: TObject);
begin
     with TformPreview.Create(Self) do
      begin

       pQuickReport := Self;
       QRPreview.QRPrinter := TQRPrinter(Sender);
       Show;

      end;

end;

procedure TrelatOSaberta.qryOrcamentoAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

       if fieldByName('SERVICOS').AsString > '' then
           meSERVICOS.Lines.Text := fieldByName('SERVICOS').AsString
       else
           meSERVICOS.Lines.Text := ' ';

       if fieldByName('CONDICOES1').AsString > '' then
           meCONDICOES1.Lines.Text := fieldByName('CONDICOES1').AsString
       else
           meCONDICOES1.Lines.Text := ' ';

       if fieldByName('CONDICOES2').AsString > '' then
           meCONDICOES2.Lines.Text := fieldByName('CONDICOES2').AsString
       else
           meCONDICOES2.Lines.Text := ' ';

       if fieldByName('EQUIPAMENTO').AsString > '' then
           meEQUIPAMENTO.Lines.Text := fieldByName('EQUIPAMENTO').AsString
       else
           meEQUIPAMENTO.Lines.Text := ' ';

       if fieldByName('PROBLEMA').AsString > '' then
           mePROBLEMA.Lines.Text := fieldByName('PROBLEMA').AsString
       else
           mePROBLEMA.Lines.Text := ' ';

       if fieldByName('OPCIONAIS').AsString > '' then
           meOPCIONAIS.Lines.Text := fieldByName('OPCIONAIS').AsString else
        begin
         meOPCIONAIS.Lines.Text := ' ';
         QRLabel31.Caption := ' ';
        end;

      end;

     qryItens.ParamByName('codigo').AsInteger :=
       Dataset.fieldByName('CODIGO').AsInteger;
     qryItens.open;
end;


procedure TrelatOSaberta.qryItensAfterOpen(DataSet: TDataSet);
var
   i: byte;
begin
    with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_UNITARIO') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

       memItens.Open;
       for i := 1 to RecordCount + (8 - (RecordCount mod 8)) do
        begin
         if eof then
            memItens.InsertRecord([' ', ' ', ' ', ' ', ' ', ' ']) else
         begin
            memItens.InsertRecord([fieldByName('CODPRODUTO').AsString,
               fieldByName('DESCRICAO').AsString,
               FloatToStrF(fieldByName('VALOR_UNITARIO').AsCurrency, ffCurrency, 18, 2),
               FloatToStrF(fieldByName('DESCONTO').AsCurrency, ffCurrency, 18, 2),
               fieldByName('QUANTIDADE').AsString,
               FloatToStrF(fieldbyname('VALOR_TOTAL').AsCurrency, ffCurrency, 18, 2)]);
            next;
         end;
        end;


      end;

end;
















end.
