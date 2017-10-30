unit selecionarempresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IBDatabase, Db, IBCustomDataSet, IBQuery,
  RxLookup, DBClient, Provider;

type
  TformSelecionarEmpresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    rxbEmpresa: TRxDBLookupCombo;
    Label1: TLabel;
    qryEmpresa: TIBQuery;
    traEmpresa: TIBTransaction;
    dsEmpresa: TDataSource;
    provEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelecionarEmpresa: TformSelecionarEmpresa;

implementation

uses data_principal;

{$R *.DFM}

procedure TformSelecionarEmpresa.FormCreate(Sender: TObject);
begin
   cdsEmpresa.open;
end;

end.
