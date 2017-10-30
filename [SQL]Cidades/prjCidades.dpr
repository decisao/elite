program prjCidades;

uses
  Forms,
  cidades in 'cidades.pas' {formCidades},
  relaccidades in 'relaccidades.pas' {dmoRelacCidades: TDataModule},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule},
  estados in '..\[SQL]Estados\estados.pas' {formEstados};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformCidades, formCidades);
  Application.Run;
end.
