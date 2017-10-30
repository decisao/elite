program criptografia;

uses
  Forms,
  crypto in 'crypto.pas' {formCrypto},
  sysdba in 'sysdba.pas' {formSysdba};

{$E exe}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Criptografia leve';
  Application.CreateForm(TformCrypto, formCrypto);
  Application.Run;
end.
