unit os_texto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemTable, IBQuery, IBCustomDataSet, IBStoredProc, ZRCtrls, ZReport, StdCtrls,
  IBDatabase;

type
  TformOStexto = class(TForm)
    qryOrcamento: TIBQuery;
    qryItens: TIBQuery;
    traOrcamento: TIBTransaction;
    traItens: TIBTransaction;
    procedure qryOrcamentoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOStexto: TformOStexto;

implementation

uses data_principal;

{$R *.DFM}

procedure TformOStexto.qryOrcamentoAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

//       if fieldByName('SERVICOS').AsString > '' then
//           meSERVICOS.Lines.Text := fieldByName('SERVICOS').AsString
//       else
//           meSERVICOS.Lines.Text := ' ';

//       if fieldByName('CONDICOES1').AsString > '' then
//           meCONDICOES1.Lines.Text := fieldByName('CONDICOES1').AsString
//       else
//           meCONDICOES1.Lines.Text := ' ';

//       if fieldByName('CONDICOES2').AsString > '' then
//           meCONDICOES2.Lines.Text := fieldByName('CONDICOES2').AsString
//       else
//           meCONDICOES2.Lines.Text := ' ';

//       if fieldByName('EQUIPAMENTO').AsString > '' then
//           meEQUIPAMENTO.Lines.Text := fieldByName('EQUIPAMENTO').AsString
//       else
//           meEQUIPAMENTO.Lines.Text := ' ';

//       if fieldByName('PROBLEMA').AsString > '' then
//           mePROBLEMA.Lines.Text := fieldByName('PROBLEMA').AsString
//       else
//           mePROBLEMA.Lines.Text := ' ';

//       if fieldByName('OPCIONAIS').AsString > '' then
//           meOPCIONAIS.Lines.Text := fieldByName('OPCIONAIS').AsString else
//        begin
//         meOPCIONAIS.Lines.Text := ' ';
//         QRLabel31.Caption := ' ';
//        end;

      end;

     qryItens.ParamByName('codigo').AsInteger :=
       Dataset.fieldByName('CODIGO').AsInteger;
     qryItens.open;

end;

end.
