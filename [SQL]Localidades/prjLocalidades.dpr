program prjLocalidades;

uses
  Forms,
  localidades in 'localidades.pas' {formLocalidades},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule},
  relaclocalidades in 'relaclocalidades.pas' {dmoRelacLocalidades: TDataModule},
  relaccidades in '..\[SQL]Cidades\relaccidades.pas' {dmoRelacCidades: TDataModule},
  cidades in '..\[SQL]Cidades\cidades.pas' {formCidades},
  estados in '..\[SQL]Estados\estados.pas' {formEstados};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformLocalidades, formLocalidades);
  Application.Run;
end.
