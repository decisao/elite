unit relextrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, Qrctrls, qrprntr, QuickRpt, ExtCtrls,
  IBDatabase;

type
  TformRelExtrato = class(TForm)
    qrExtrato: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    qryExtrato: TIBQuery;
    QRLabel1: TQRLabel;
    qryExtratoUSUARIO: TIBStringField;
    qryExtratoDESCRICAO: TIBStringField;
    qryExtratoSALDO: TIBBCDField;
    qryExtratoLETRA: TIBStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    qryExtratoVALORCRE: TIBBCDField;
    qryExtratoVALORDEB: TIBBCDField;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qryExtratoINFODOC: TIBStringField;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qryExtratoDOCUMENTO: TIBStringField;
    traExtrato: TIBTransaction;
    qryExtratoDATAHORA: TDateTimeField;
    qryExtratoCLIENTE: TIBStringField;
    procedure qrExtratoPreview(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelExtrato: TformRelExtrato;

implementation

uses
  preview, data_principal;

{$R *.DFM}

procedure TformRelExtrato.qrExtratoPreview(Sender: TObject);
begin
     with TformPreview.Create(Self) do
      begin

       pQuickReport := qrExtrato;
       QRPreview.QRPrinter := TQRPrinter(Sender);
       Show;

      end;
end;

procedure TformRelExtrato.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Trim(qryExtrato.fieldByName('INFODOC').AsString) > '' then
   Sender.Height := 33 else
   Sender.Height := 17;
end;

end.
