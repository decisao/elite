program prjEstados;

uses
  Forms,
  estados in 'estados.pas' {formEstados},
  data_principal in '..\[Local]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  Application.CreateForm(TformEstados, formEstados);
  Application.Run;
end.
