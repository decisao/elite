unit faturar_contratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBCustomDataSet, IBUpdateSQL, Db, IBDatabase, IBQuery, Grids, DBGrids,
  zebdbgrid, StdCtrls, Buttons, ExtCtrls, IBStoredProc;

type
  TformFaturarContratos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    zebdbgrid1: Tzebdbgrid;
    qrySelecionar: TIBQuery;
    dsrSelecionar: TDataSource;
    traSelecionar: TIBTransaction;
    qrySelecionarSELECIONAR: TIBStringField;
    qrySelecionarNOME: TIBStringField;
    updSelecionar: TIBUpdateSQL;
    traFaturar: TIBTransaction;
    procFaturar: TIBStoredProc;
    qrySelecionarCODCLIENTE: TIntegerField;
    qrySelecionarCODVENDEDOR: TIntegerField;
    qrySelecionarCODTECNICO: TIntegerField;
    qrySelecionarCODSERVICO: TIntegerField;
    qrySelecionarCODNATUOPER: TIBStringField;
    qrySelecionarCODCONDPAG: TIntegerField;
    qrySelecionarVALOR: TIBBCDField;
    procFaturarCODMOVIMENTO: TIntegerField;
    procedure qrySelecionarUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure FormShow(Sender: TObject);
    procedure zebdbgrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFaturarContratos: TformFaturarContratos;

implementation

uses data_principal, imprimirnota;

{$R *.DFM}

procedure TformFaturarContratos.qrySelecionarUpdateRecord(
  DataSet: TDataSet; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  UpdateAction := IBCustomDataset.uaApplied;
end;

procedure TformFaturarContratos.FormShow(Sender: TObject);
begin
  with qrySelecionar do
   begin
     if active then close;
     open;
   end;
end;

procedure TformFaturarContratos.zebdbgrid1DblClick(Sender: TObject);
begin
  with qrySelecionar do
   begin
     if active then
      begin
        edit;
        if fieldByName('SELECIONAR').AsString = 'X' then
          fieldByName('SELECIONAR').AsString := ' '
        else
          fieldByName('SELECIONAR').AsString := 'X';
        post;
      end;
   end;
end;

procedure TformFaturarContratos.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TformFaturarContratos.BitBtn3Click(Sender: TObject);
var
  codmov: longint;
  marca: TBookMarkStr;
begin
  if dmoPrincipal.Pergunta('Atenção, #: Os contratos serão faturados ' +
    'sequencialmente, um a um, conforme a seleção efetuada. ' +
    'Deseja continuar?', 'Faturar', 0) = IDYES then
   begin

     with qrySelecionar do
      begin
        disablecontrols;
        marca := BookMark;
        first;
        while not eof do
         begin
           if fieldByName('SELECIONAR').AsString = 'X' then
            begin

              try
                if not traFaturar.InTransaction then
                  traFaturar.StartTransaction;

                procFaturar.ParamByName('CODEMPRESA').AsInteger :=
                  dmoPrincipal.empresa;
                procFaturar.ParamByName('CODCLIENTE').AsInteger :=
                  qrySelecionar.fieldByName('CODCLIENTE').AsInteger;
                procFaturar.ParamByName('CODRESPONSAVEL').AsInteger :=
                  qrySelecionar.fieldByName('CODTECNICO').AsInteger;
                procFaturar.ParamByName('CODVENDEDOR').AsInteger :=
                  qrySelecionar.fieldByName('CODVENDEDOR').AsInteger;
                procFaturar.ParamByName('CODCONDPAG').AsInteger :=
                  qrySelecionar.fieldByName('CODCONDPAG').AsInteger;
                procFaturar.ParamByName('CODSERVICO').AsInteger :=
                  qrySelecionar.fieldByName('CODSERVICO').AsInteger;
                procFaturar.ParamByName('CODNATUOPER').AsString :=
                  trim(qrySelecionar.fieldByName('CODNATUOPER').AsString);
                procFaturar.ParamByName('VALOR').AsFloat :=
                  qrySelecionar.fieldByName('VALOR').AsFloat;

                procFaturar.Prepare;
                procFaturar.ExecProc;

                codmov := procFaturar.ParamByName('CODMOVIMENTO').AsInteger;
                traFaturar.Commit;
                procFaturar.UnPrepare;

                { impressão da nota usando a Geografia NF configurada }
                if codmov > 0 then
                 with TformImprimirNota.Create(Self) do
                  try
                    Caption := Self.qrySelecionar.fieldByName('NOME').AsString;
                    inCODMOVIMENTO := codmov;
                    showmodal;
                  finally
                    release;
                  end;

              except

              end;

            end;
           next;
         end;

        BookMark := marca;
        enablecontrols;
      end;
     close;
   end

end;

procedure TformFaturarContratos.BitBtn1Click(Sender: TObject);
var
  marca: TBookMarkStr;
begin
  with qrySelecionar do
   begin
     disablecontrols;
     marca := BookMark;
     first;
     while not eof do
      begin
        edit;
        fieldByName('SELECIONAR').AsString := 'X';
        post;
        next;
      end;
     BookMark := marca;
     enablecontrols;
   end;
end;

procedure TformFaturarContratos.BitBtn2Click(Sender: TObject);
var
  marca: TBookMarkStr;
begin
  with qrySelecionar do
   begin
     disablecontrols;
     marca := BookMark;
     first;
     while not eof do
      begin
        edit;
        fieldByName('SELECIONAR').AsString := ' ';
        post;
        next;
      end;
     BookMark := marca;
     enablecontrols;
   end;
end;

end.
