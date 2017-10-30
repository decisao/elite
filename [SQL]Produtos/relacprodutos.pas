unit relacprodutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc;

type
  TdmoRelacProdutos = class(TDataModule)
    qryMedidas: TIBQuery;
    dsrMedidas: TDataSource;
    qryGrupos: TIBQuery;
    dsrGrupos: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure Loaded; override;
  public
    { Public declarations }
  end;

var
  dmoRelacProdutos: TdmoRelacProdutos;

implementation

uses data_principal;

{$R *.DFM}

procedure TdmoRelacProdutos.Loaded;
begin
  qryMedidas.Prepare;
  qryGrupos.Prepare;
end;

procedure TdmoRelacProdutos.DataModuleDestroy(Sender: TObject);
begin
   if qryMedidas.Active then qryMedidas.Close;
   if qryGrupos.Active then qryGrupos.Close;
   qryMedidas.Unprepare;
   qryGrupos.Unprepare;
end;

end.
