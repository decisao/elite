unit data_produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Provider, DBClient, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TdmoProdutos = class(TDataModule)
    traEstoque: TIBTransaction;
    qryEstoque: TIBQuery;
    dsrEstoque: TDataSource;
    traUnidade: TIBTransaction;
    qryUnidade: TIBQuery;
    dsrUnidade: TDataSource;
    qryGrupo: TIBQuery;
    traGrupo: TIBTransaction;
    dsrGrupo: TDataSource;
    traServicos: TIBTransaction;
    qryServicos: TIBQuery;
    dsrServicos: TDataSource;
    cdsEstoque: TClientDataSet;
    provEstoque: TDataSetProvider;
    provUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    provGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    provServicos: TDataSetProvider;
    cdsServicos: TClientDataSet;
    traCentro: TIBTransaction;
    qryCentro: TIBQuery;
    provCentro: TDataSetProvider;
    cdsCentro: TClientDataSet;
    dcrCentro: TDataSource;
    cdsServicosDESCRICAO: TStringField;
    cdsServicosPRECOVENDA: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmoProdutos: TdmoProdutos;

implementation

uses produtos;

{$R *.DFM}

end.
