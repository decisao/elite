program prjUnidades;

uses
  Forms,
  unidades in 'unidades.pas' {formUnidades},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformUnidades, formUnidades);
  Application.Run;
end.
