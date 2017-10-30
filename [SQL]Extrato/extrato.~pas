unit extrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Db, IBQuery, IBCustomDataSet, IBStoredProc, ToolEdit, RXDBCtrl, Mask,
  RxMemDS, ExtCtrls, IBDatabase, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache,
  ppModule, raCodMod, ppStrtch, ppSubRpt;

type
  TformExtrato = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memEXTRATO: TRxMemoryData;
    memEXTRATOCODCONTA: TIntegerField;
    memEXTRATODATA: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsrEXTRATO: TDataSource;
    qryConta: TIBQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit2: TDBEdit;
    dsrConta: TDataSource;
    traConta: TIBTransaction;
    memEXTRATODATA2: TDateField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBDateEdit2: TDBDateEdit;
    ckFuturo: TCheckBox;
    traExtrato1: TIBTransaction;
    qryExtrato1: TIBQuery;
    qryExtrato1DATAHORA: TDateTimeField;
    qryExtrato1USUARIO: TIBStringField;
    qryExtrato1DESCRICAO: TIBStringField;
    qryExtrato1SALDO: TIBBCDField;
    qryExtrato1LETRA: TIBStringField;
    qryExtrato1VALORCRE: TIBBCDField;
    qryExtrato1VALORDEB: TIBBCDField;
    qryExtrato1INFODOC: TIBStringField;
    qryExtrato1DOCUMENTO: TIBStringField;
    qryExtrato1CLIENTE: TIBStringField;
    dsrExtrato1: TDataSource;
    ppDBExtrato: TppDBPipeline;
    ppExtrato: TppReport;
    traExtratoDOC: TIBTransaction;
    qryExtratoDOC: TIBQuery;
    dsrExtratoDOC: TDataSource;
    ppDBExtratoDOC: TppDBPipeline;
    qryExtratoDOCDATAHORA: TDateTimeField;
    qryExtratoDOCCLIENTE: TIBStringField;
    qryExtratoDOCDESCRICAO: TIBStringField;
    qryExtratoDOCVALORCRE: TIBBCDField;
    qryExtratoDOCVALORDEB: TIBBCDField;
    qryExtratoDOCLETRA: TIBStringField;
    qryExtratoDOCINFODOC: TIBStringField;
    qryExtratoDOCDOCUMENTO: TIBStringField;
    qryExtrato1GRUPO: TIBStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    lbConta: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lbPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBText9: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppSubFuturo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppShape3: TppShape;
    ppLabel11: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    lbPeriodo2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppHeaderBand2: TppHeaderBand;
    ckResumo: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memEXTRATOAfterInsert(DataSet: TDataSet);
    procedure memEXTRATOBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memEXTRATOCODCONTAChange(Sender: TField);
    procedure Label1Click(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure DBDateEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formExtrato: TformExtrato;

implementation

uses relextrato, data_principal, contas;

{$R *.DFM}

procedure TformExtrato.BitBtn2Click(Sender: TObject);
begin
  with memExtrato do
   try
     if state in [dsInsert, dsEdit] then post else
      begin
       edit;
       post;
      end;
   finally
   end;
end;

procedure TformExtrato.FormShow(Sender: TObject);
begin
   qryConta.prepare;
   with memExtrato do
    begin
     open;
     insert;
    end;
end;

procedure TformExtrato.memEXTRATOAfterInsert(DataSet: TDataSet);
begin
  with Dataset do
   begin
    fieldByname('DATA').AsDateTime  := dmoPrincipal.GetServerTime;
    fieldByname('DATA2').AsDateTime := dmoPrincipal.GetServerTime;
    fieldByName('CODCONTA').AsInteger :=
      dmoPrincipal.cdsConfig.fieldByName('CODCONTA_VENDACRE').AsInteger;
   end;
  DBEdit1.SetFocus;
end;

procedure TformExtrato.memEXTRATOBeforePost(DataSet: TDataSet);
begin

  { passagem de parâmetros }
  with qryExtrato1 do
   begin
     if active then close;
     paramByName('CODCONTA').AsInteger :=
       Self.memEXTRATO.fieldByName('CODCONTA').AsInteger;
     paramByName('DATAINI').AsDateTime :=
       Self.memEXTRATO.fieldByName('DATA').AsDateTime;
     paramByName('DATAFIM').AsDateTime :=
       Self.memEXTRATO.fieldByName('DATA2').AsDateTime;
     paramByName('CODEMPRESA').AsINteger :=
       dmoPrincipal.empresa;
     prepare;
   end;

  with qryExtratoDOC do
   begin
     if active then close;
     paramByName('DATAINI').AsDateTime :=
       Self.memEXTRATO.fieldByName('DATA').AsDateTime;
     paramByName('DATAFIM').AsDateTime :=
       Self.memEXTRATO.fieldByName('DATA2').AsDateTime;
     paramByName('CODEMPRESA').AsINteger :=
       dmoPrincipal.empresa;
     prepare;
   end;

  lbConta.Caption := Format('%d - %s', [
    Self.memEXTRATO.fieldByName('CODCONTA').AsInteger,
    Trim(Self.qryConta.fieldByName('CONTA').AsString)]);

  lbPeriodo.Caption := Format('Período de %s até %s',
    [FormatDateTime('DD/MM/YYYY',
     Self.memEXTRATO.fieldByName('DATA').AsDateTime),
     FormatDateTime('DD/MM/YYYY',
     Self.memEXTRATO.fieldByName('DATA2').AsDateTime)]);
  lbPeriodo2.Caption := lbPeriodo.Caption;

  ppSubFuturo.Visible := ckFuturo.Checked;

  ppExtrato.Print;   

//  with TformRelExtrato.Create(Self) do
//   try
//     { informações do cabeçalho }
//     qrExtrato.ReportTitle := 'Extrato de Conta';
//     QrLabel1.Caption := Format('Conta %.5d - %s', [
//        Self.memEXTRATO.fieldByName('CODCONTA').AsInteger,
//        Trim(Self.qryConta.fieldByName('CONTA').AsString)]);
//     QrLabel2.Caption :=
//        Format('Período de %s até %s',
//          [FormatDateTime('DD/MM/YYYY',
//             Self.memEXTRATO.fieldByName('DATA').AsDateTime),
//           FormatDateTime('DD/MM/YYYY',
//             Self.memEXTRATO.fieldByName('DATA2').AsDateTime)]);
//
//     { passagem de parâmetros }
//     with qryExtrato do
//      begin
//       paramByName('CODCONTA').AsInteger :=
//         Self.memEXTRATO.fieldByName('CODCONTA').AsInteger;
//       paramByName('DATAINI').AsDateTime :=
//         Self.memEXTRATO.fieldByName('DATA').AsDateTime;
//       paramByName('DATAFIM').AsDateTime :=
//         Self.memEXTRATO.fieldByName('DATA2').AsDateTime;
//       paramByName('CODEMPRESA').AsINteger :=
//         dmoPrincipal.empresa;
//       prepare;
//       open;
//      end;
//
//     { mostro o extrato }
//     qrExtrato.Preview;
//
//   finally
//     release;
//   end;
end;

procedure TformExtrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with qryConta do
   begin
    if active then close;
    unprepare;
   end;
  Screen.Cursor := crDefault;
end;

procedure TformExtrato.memEXTRATOCODCONTAChange(Sender: TField);
begin
  with qryConta do
   begin
    if active then close;
    open;
   end;
end;

procedure TformExtrato.Label1Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformContas.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.memEXTRATO.fieldByName('CODCONTA').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformExtrato.ppDetailBand1BeforePrint(Sender: TObject);
begin
  if odd(qryExtrato1.RecNo) then
    ppShape2.Brush.Color := clBtnFace
  else
    ppShape2.Brush.Color := clWhite;
end;

procedure TformExtrato.ppDetailBand2BeforePrint(Sender: TObject);
begin
  if odd(qryExtratoDOC.RecNo) then
    ppShape5.Brush.Color := clBtnFace
  else
    ppShape5.Brush.Color := clWhite;
end;

procedure TformExtrato.DBDateEdit2Change(Sender: TObject);
begin
  ckResumo.Enabled := (DBDateEdit2.Date = Date);
end;

end.
