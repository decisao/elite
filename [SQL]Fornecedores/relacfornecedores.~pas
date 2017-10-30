unit relacfornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, IBDatabase;

type
  TdmoRelacFornecedores = class(TDataModule)
    qryEstado: TIBQuery;
    dsrEstado: TDataSource;
    qryCidades: TIBQuery;
    dsrCidades: TDataSource;
    qryLocalidades: TIBQuery;
    dsrLocalidades: TDataSource;
    qryBairros: TIBQuery;
    dsrBairros: TDataSource;
    traEstado: TIBTransaction;
    traLocalidades: TIBTransaction;
    traCidades: TIBTransaction;
    traBairros: TIBTransaction;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure Loaded; override;
  public
    { Public declarations }
  end;

var
  dmoRelacFornecedores: TdmoRelacFornecedores;

implementation

uses data_principal;

{$R *.DFM}

procedure TdmoRelacFornecedores.Loaded;
begin
   qryEstado.Prepare;
   qryLocalidades.Prepare;
   qryCidades.Prepare;
   qryBairros.Prepare;
end;

procedure TdmoRelacFornecedores.DataModuleDestroy(Sender: TObject);
begin
   if qryEstado.Active then qryEstado.Close;
   if qryLocalidades.Active then qryLocalidades.Close;
   if qryCidades.Active then qryCidades.Close;
   if qryBairros.Active then qryBairros.Close;
   qryEstado.UnPrepare;
   qryLocalidades.UnPrepare;
   qryCidades.UnPrepare;
   qryBairros.UnPrepare;
end;

end.
