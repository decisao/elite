program prjOrcamento;

uses
  Forms,
  orcamento in 'orcamento.pas' {formOrcamento},
  relacorcamento in 'relacorcamento.pas' {dmoRelacOrcamento: TDataModule},
  relacclientes in '..\[SQL]Clientes\relacclientes.pas' {dmoRelacClientes: TDataModule},
  clientes in '..\[SQL]Clientes\clientes.pas' {formClientes},
  estados in '..\[SQL]Estados\estados.pas' {formEstados},
  relaccidades in '..\[SQL]Cidades\relaccidades.pas' {dmoRelacCidades: TDataModule},
  cidades in '..\[SQL]Cidades\cidades.pas' {formCidades},
  relaclocalidades in '..\[SQL]Localidades\relaclocalidades.pas' {dmoRelacLocalidades: TDataModule},
  localidades in '..\[SQL]Localidades\localidades.pas' {formLocalidades},
  itsorcamento in 'itsorcamento.pas' {formITorcamento},
  relacprodutos in '..\[SQL]Produtos\relacprodutos.pas' {dmoRelacProdutos: TDataModule},
  produtos in '..\[SQL]Produtos\produtos.pas' {formProdutos},
  grupos in '..\[SQL]Grupos\grupos.pas' {formGrupos},
  unidades in '..\[SQL]Unidades\unidades.pas' {formUnidades},
  data_principal in '..\[SQL]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformOrcamento, formOrcamento);
  Application.Run;
end.
