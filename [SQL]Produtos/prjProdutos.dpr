program prjProdutos;

uses
  Forms,
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule},
  relacprodutos in 'relacprodutos.pas' {dmoRelacProdutos: TDataModule},
  produtos in 'produtos.pas' {formProdutos},
  grupos in '..\[SQL]Grupos\grupos.pas' {formGrupos},
  unidades in '..\[SQL]Unidades\unidades.pas' {formUnidades};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformProdutos, formProdutos);
  Application.Run;
end.
