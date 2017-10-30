program prjGrupos;

uses
  Forms,
  grupos in 'grupos.pas' {formGrupos},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformGrupos, formGrupos);
  Application.Run;
end.
