unit os_nota2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemTable, IBQuery, IBCustomDataSet, IBStoredProc, ZRCtrls, ZReport, StdCtrls, Qrctrls, QuickRpt,
  ExtCtrls, qrprntr, IBDatabase, RxMemDS, PsQrCtrls;

type
  TformOSnota2 = class(TForm)
    qryOSnota: TIBQuery;
    qryItens: TIBQuery;
    qrOSnota: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape4: TQRShape;
    QRLabel21: TQRLabel;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qryOSnotaES: TSmallintField;
    qryOSnotaCODCLIENTE: TIntegerField;
    qryOSnotaDATA: TDateTimeField;
    qryOSnotaVALOR_SERVICOS: TIBBCDField;
    qryOSnotaVALOR_ITENS: TIBBCDField;
    qryOSnotaDESCONTO: TIBBCDField;
    qryOSnotaVALOR_PRODUTOS: TIBBCDField;
    qryOSnotaVALOR_ICMS: TIBBCDField;
    qryOSnotaVALOR_TOTAL: TIBBCDField;
    qryOSnotaNOTA_NUMERO: TIntegerField;
    qryOSnotaNOTA_DATAEMISSAO: TDateTimeField;
    qryOSnotaNOTA_CODTRANSPORTADOR: TIntegerField;
    qryOSnotaNOTA_PLACAVEICULO: TIBStringField;
    qryOSnotaNOTA_UFVEICULO: TIBStringField;
    qryOSnotaNOTA_FRETE: TSmallintField;
    qryOSnotaNOTA_VALOR_FRETE: TIBBCDField;
    qryOSnotaNOTA_VALOR_SEGURO: TIBBCDField;
    qryOSnotaNOTA_VALOR_OUTROS: TIBBCDField;
    qryOSnotaNOTA_VALOR_TOTAL: TIBBCDField;
    qryOSnotaNOTA_QUANTIDADE: TIBBCDField;
    qryOSnotaNOTA_ESPECIE: TIBStringField;
    qryOSnotaNOTA_MARCA: TIBStringField;
    qryOSnotaNOTA_VOLNUM: TIntegerField;
    qryOSnotaNOTA_PESOBRUTO: TIBBCDField;
    qryOSnotaNOTA_PESOLIQUIDO: TIBBCDField;
    qryOSnotaCODVENDEDOR: TIntegerField;
    qryOSnotaSTATUS: TIBStringField;
    qryOSnotaCONDICAO: TIBStringField;
    qryOSnotaDATAINICIO: TDateTimeField;
    qryOSnotaDATATERMINO: TDateTimeField;
    qryOSnotaICMSSIMPLES: TIBStringField;
    qryOSnotaVALOR_ISS: TIBBCDField;
    qryOSnotaNOTA_IESUBST: TIBStringField;
    qryOSnotaNOTA_DATASAIDA: TDateTimeField;
    qryOSnotaNOTA_VALORICMSSUBST: TIBBCDField;
    qryOSnotaVALOR_IPI: TIBBCDField;
    qryOSnotaCODVENDEDOR_ABRE: TIntegerField;
    qryOSnotaDESCONTOTXT: TIBStringField;
    qryOSnotaCLI_NOME: TIBStringField;
    qryOSnotaCLI_NUMERO: TIntegerField;
    qryOSnotaCLI_COMPLEMENTO: TIBStringField;
    qryOSnotaCLI_BAIRRO: TIBStringField;
    qryOSnotaCLI_CEP: TIBStringField;
    qryOSnotaCLI_CIDADE: TIBStringField;
    qryOSnotaCLI_ESTADO: TIBStringField;
    qryOSnotaCLI_FONE: TIBStringField;
    qryOSnotaCLI_FAX: TIBStringField;
    qryOSnotaCLI_EMAIL: TIBStringField;
    qryOSnotaCLI_RGIE: TIBStringField;
    qryOSnotaCLI_CPFCGC: TIBStringField;
    qryOSnotaTRA_NOME: TIBStringField;
    qryOSnotaTRA_LOGRADOURO: TIBStringField;
    qryOSnotaTRA_NUMERO: TIntegerField;
    qryOSnotaTRA_COMPLEMENTO: TIBStringField;
    qryOSnotaTRA_BAIRRO: TIBStringField;
    qryOSnotaTRA_CEP: TIBStringField;
    qryOSnotaTRA_CIDADE: TIBStringField;
    qryOSnotaTRA_ESTADO: TIBStringField;
    qryOSnotaTRA_FONE: TIBStringField;
    qryOSnotaTRA_FAX: TIBStringField;
    qryOSnotaTRA_EMAIL: TIBStringField;
    qryOSnotaTRA_RGIE: TIBStringField;
    qryOSnotaTRA_CPFCGC: TIBStringField;
    qryOSnotaCODIGO: TIntegerField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    qryOSnotaMARCA: TIBStringField;
    qryOSnotaMODELO: TIBStringField;
    qryOSnotaDEFEITO: TIBStringField;
    qryOSnotaGARANTIA: TIBStringField;
    qryOSnotaSERIE: TIBStringField;
    qryOSnotaACESSORIOS: TIBStringField;
    qryOSnotaCONDICAOEXTERNA: TIBStringField;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel32: TQRLabel;
    QRShape12: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel38: TQRLabel;
    QRShape13: TQRShape;
    QRLabel39: TQRLabel;
    QRShape14: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    qryOSnotaSERVICOS: TIBStringField;
    qryOSnotaSOLICITANTE: TIBStringField;
    traOSnota: TIBTransaction;
    traItens: TIBTransaction;
    qryOSnotaOBSERVACOES: TIBStringField;
    qryOSnotaNOTA_CODNATUOPER: TIBStringField;
    qryOSnotaNOTA_DADOSADICIONAIS: TIBStringField;
    qryOSnotaICMSSIMPALIQ: TIBBCDField;
    qryOSnotaISSALIQ: TIBBCDField;
    qryOSnotaNOTA_BASEICMS: TIBBCDField;
    qryOSnotaNOTA_BASEICMSSUBST: TIBBCDField;
    qryOSnotaVENDEDORABRE: TIBStringField;
    qryOSnotaVENDEDOR: TIBStringField;
    qryOSnotaUSUARIO: TIBStringField;
    qryOSnotaCLI_CONTRATO: TIBStringField;
    qryOSnotaCLI_KM: TIntegerField;
    qryOSnotaNATUREZAOPERACAO: TIBStringField;
    memItens: TRxMemoryData;
    memItensCODIGO: TStringField;
    memItensDESCRICAO: TStringField;
    memItensVALOR_UNITARIO: TStringField;
    memItensDESCONTO: TStringField;
    memItensQUANTIDADE: TStringField;
    memItensVALOR_TOTAL: TStringField;
    PsQRDBImage1: TPsQRDBImage;
    PsQRDBText1: TPsQRDBText;
    PsQRDBText2: TPsQRDBText;
    PsQRDBText3: TPsQRDBText;
    QRLabel4: TPsQRLabel;
    QRDBText34: TPsQRDBText;
    PsQRLabel1: TPsQRLabel;
    QRDBText36: TPsQRDBText;
    QRLabel3: TPsQRLabel;
    QRDBText37: TPsQRDBText;
    QRLabel1: TPsQRLabel;
    QRDBText35: TPsQRDBText;
    PsQRDBText4: TPsQRDBText;
    QRDBText33: TPsQRDBText;
    PsQRDBText5: TPsQRDBText;
    PsQRDBText6: TPsQRDBText;
    QRLabel2: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText18: TQRDBText;
    qryOSnotaCODEMPRESA: TIntegerField;
    qryOSnotaEMPRESA_NOME: TIBStringField;
    qryOSnotaEMPRESA_RAZAOSOCIAL: TIBStringField;
    qryOSnotaEMPRESA_CNPJ: TIBStringField;
    qryOSnotaEMPRESA_IE: TIBStringField;
    qryOSnotaEMPRESA_LOGRADOURO: TIBStringField;
    qryOSnotaEMPRESA_NUMERO: TIntegerField;
    qryOSnotaEMPRESA_COMPLEMENTO: TIBStringField;
    qryOSnotaEMPRESA_BAIRRO: TIBStringField;
    qryOSnotaEMPRESA_CIDADE: TIBStringField;
    qryOSnotaEMPRESA_ESTADO: TIBStringField;
    qryOSnotaEMPRESA_CEP: TIBStringField;
    qryOSnotaEMPRESA_FONE: TIBStringField;
    qryOSnotaTIPOOS: TIBStringField;
    PsQRDBText9: TPsQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    qryOSnotaCLI_LOGRADOURO: TIBStringField;
    QRDBText9: TQRDBText;
    qryOSnotaCLI_RAZAOSOCIAL: TIBStringField;
    qryOSnotaXX_ENTRADA: TIBStringField;
    qryOSnotaXX_SAIDA: TIBStringField;
    qryItensCODIGO: TIntegerField;
    qryItensBARRA: TIBStringField;
    qryItensDESCRICAO1: TIBStringField;
    qryItensDESCRICAO2: TIBStringField;
    qryItensSERIE: TIBStringField;
    qryItensVALOR_VENDA: TIBBCDField;
    qryItensICMS_VENDA: TIBBCDField;
    qryItensDESCONTO: TIBBCDField;
    qryItensQUANTIDADE: TIBBCDField;
    qryItensVALOR_PAGO: TIBBCDField;
    qryItensVALOR_ICMS: TIBBCDField;
    qryItensSITTRIBU: TIBStringField;
    qryItensUNIDADE: TIBStringField;
    qryItensVALOR_ITEM: TIBBCDField;
    QRDBText14: TQRDBText;
    qrMSG: TQRLabel;
    procedure qryOSnotaAfterOpen(DataSet: TDataSet);
    procedure qryItensAfterOpen(DataSet: TDataSet);
    procedure qrOSnotaPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOSnota2: TformOSnota2;

implementation

uses data_principal, preview;

{$R *.DFM}

procedure TformOSnota2.qryOSnotaAfterOpen(DataSet: TDataSet);
begin

     qryItens.ParamByName('codigo').AsInteger :=
       Dataset.fieldByName('CODIGO').AsInteger;
     qryItens.open;

end;

procedure TformOSnota2.qryItensAfterOpen(DataSet: TDataSet);
var
   i: byte;
begin
    with Dataset do
      begin

       memItens.Open;
       for i := 1 to RecordCount + (11 - (RecordCount mod 11)) do
        begin
         if eof then
            memItens.AppendRecord([' ', ' ', ' ', ' ', ' ', ' ']) else
         begin
            memItens.AppendRecord([
               fieldByName('BARRA').AsString,
               fieldByName('DESCRICAO1').AsString,
               FloatToStrF(fieldByName('VALOR_VENDA').AsCurrency -
                 fieldByName('DESCONTO').AsCurrency, ffCurrency, 18, 2),
               '0,00',
               fieldByName('QUANTIDADE').AsString,
               FloatToStrF(fieldbyname('VALOR_PAGO').AsCurrency, ffCurrency,
               18, 2)]);
            next;
         end;
        end;


      end;

end;

procedure TformOSnota2.qrOSnotaPreview(Sender: TObject);
begin
     with TformPreview.Create(Self) do
      begin

       pQuickReport := qrOSnota;
       QRPreview.QRPrinter := TQRPrinter(Sender);
       Show;

      end;
end;

end.
