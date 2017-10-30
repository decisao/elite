unit relacorcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc;

type
  TdmoRelacOrcamento = class(TDataModule)
    procedure qryProdutoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Loaded; override;
  public
    { Public declarations }
  end;

var
  dmoRelacOrcamento: TdmoRelacOrcamento;

implementation

uses data_principal, cidades;

{$R *.DFM}

procedure TdmoRelacOrcamento.Loaded;
begin

end;

procedure TdmoRelacOrcamento.qryProdutoAfterOpen(DataSet: TDataSet);
begin
     { mascaras }
     with Dataset do
      begin

       (fieldByName('PRECOVENDA') as TFloatField).Currency := True;

       (fieldByName('ICMS') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('ICMS') as TNumericField).EditFormat := '##0.00';

       (fieldByName('MARGEM') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('MARGEM') as TNumericField).EditFormat := '##0.00';

      end;
end;

end.
