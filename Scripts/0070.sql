/*
** ADIONAIS NO PAGAMENTO
*/

ALTER TRIGGER PAGAMENTOS_BI0
ACTIVE BEFORE INSERT POSITION 0
as
  declare variable ultimo     integer;
  declare variable saldo      numeric(9, 2);
  declare variable saldonovo  numeric(9, 2);
begin
  /* carrego as opcoes do documento */
  select
    tipo_pag,
    tipo_doc
  from
    documentos
  where
    codigo = new.coddocumento
  into
    new.tipo_pag,
    new.tipo_doc;

  /* esta pago? */
  if (new.pago = 1) then
   begin
    /* descubro o saldo anterior */
    select
      max(codlancto)
    from
      pagamentos
    where
      codconta = new.codconta and
      codempresa = new.codempresa
    into
      :ultimo;
    if (ultimo is not null) then
     begin
       select
         saldoatu
       from
         pagamentos
       where
         codlancto = :ultimo
       into
         :saldo;
     end else saldo = 0;
    /* pego o numero deste lancamento */
    select
      sequencia
    from
      seq_obter('LANCTO')
    into
      :ultimo;
    /* gravo os valores corretos */
    new.saldoant = saldo;
    if (new.es = 1) then
      saldonovo = saldo - new.total_pago;
    if (new.es = 2) then
      saldonovo = saldo + new.total_pago;
    new.saldoatu = saldonovo;
    new.nomeusuario = USER;
    new.datapago = 'NOW';
    new.codlancto = ultimo;
   end
end!

ALTER TRIGGER PAGAMENTOS_BU0
ACTIVE BEFORE UPDATE POSITION 0
as
  declare variable ultimo     integer;
  declare variable saldo      numeric(9, 2);
  declare variable saldonovo  numeric(9, 2);
begin

  /* carrego as opcoes do documento */
  select
    tipo_pag,
    tipo_doc
  from
    documentos
  where
    codigo = new.coddocumento
  into
    new.tipo_pag,
    new.tipo_doc;

  /* esta pago? */
  if ((old.pago = 0) and (new.pago = 1)) then
   begin
    /* descubro o saldo anterior */
    select
      max(codlancto)
    from
      pagamentos
    where
      codconta = new.codconta and
      codempresa = new.codempresa
    into
      :ultimo;
    if (ultimo is not null) then
     begin
       select
         saldoatu
       from
         pagamentos
       where
         codlancto = :ultimo
       into
         :saldo;
     end else saldo = 0;
    /* pego o numero deste lancamento */
    select
      sequencia
    from
      seq_obter('LANCTO')
    into
      :ultimo;
    /* gravo os valores corretos */
    new.saldoant = saldo;
    if (new.es = 1) then
      saldonovo = saldo - new.total_pago;
    if (new.es = 2) then
      saldonovo = saldo + new.total_pago;
    new.saldoatu = saldonovo;
    new.nomeusuario = USER;
    new.datapago = 'NOW';
    new.codlancto = ultimo;
   end
end!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (70, CURRENT_TIMESTAMP)!
