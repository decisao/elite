program prjFornecedores;

uses
  Forms,
  fornecedores in 'fornecedores.pas' {formFornecedores},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule},
  estados in '..\[SQL]Estados\estados.pas' {formEstados},
  relaccidades in '..\[SQL]Cidades\relaccidades.pas' {dmoRelacCidades: TDataModule},
  cidades in '..\[SQL]Cidades\cidades.pas' {formCidades},
  relaclocalidades in '..\[SQL]Localidades\relaclocalidades.pas' {dmoRelacLocalidades: TDataModule},
  localidades in '..\[SQL]Localidades\localidades.pas' {formLocalidades},
  relacfornecedores in 'relacfornecedores.pas' {dmoRelacFornecedores: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformFornecedores, formFornecedores);
  Application.CreateForm(TdmoRelacFornecedores, dmoRelacFornecedores);
  Application.Run;
end.
