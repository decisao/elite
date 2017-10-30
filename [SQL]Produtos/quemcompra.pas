unit quemcompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, TB97Ctls, TB97, Db, IBCustomDataSet, IBQuery, ComCtrls;

type
  TformQuemCompra = class(TForm)
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnImprimir: TToolbarButton97;
    StatusBar1: TStatusBar;
    qryQuemCompra: TIBQuery;
    dsrQuemCompra: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure qryQuemCompraBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    inProduto: longint;
    titulo: string;
  end;

var
  formQuemCompra: TformQuemCompra;

implementation

uses data_principal;

{$R *.DFM}

procedure TformQuemCompra.FormShow(Sender: TObject);
begin
  qryQuemCompra.Open;
end;

procedure TformQuemCompra.qryQuemCompraBeforeOpen(DataSet: TDataSet);
begin
  qryQuemCompra.paramByname('codproduto').AsInteger := inProduto;
end;

end.
