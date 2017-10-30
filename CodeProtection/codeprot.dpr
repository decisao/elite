program codeprot;

uses
  Forms,
  principal in 'principal.pas' {formPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
