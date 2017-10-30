/* mais correcoes */

ALTER PROCEDURE LANCTO (
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALOR NUMERIC(9,2),
    CONTA INTEGER,
    TIPO CHAR(1) CHARACTER SET NONE,
    INFODOC VARCHAR(50) CHARACTER SET NONE,
    CODDOC INTEGER)
AS
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE ES INTEGER;
begin
  /* qual o tipo do lancamento */
  if (tipo = 'D') then
    es = 1;
  if (tipo = 'C') then
    es = 2;
  /* pego o codigo */
  select
    sequencia
  from
    seq_obter('PAGAMENTOS')
  into
    :codigo;
  insert into
    pagamentos (
      codigo,
      numero,
      descricao,
      datacadast,
      valor,
      externo,
      pago,
      datapago,
      datavencimento,
      codconta,
      es,
      infodoc,
      coddocumento)
  values (
    :codigo,
    1,
    :descricao,
    'NOW',
    :valor,
    'S',
    1,
    'NOW',
    'NOW',
    :conta,
    :es,
    :infodoc,
    :coddoc);
end!


ALTER PROCEDURE EXTRATO (
    CODCONTA INTEGER,
    DATAEX TIMESTAMP)
RETURNS (
    HORA TIMESTAMP,
    USUARIO VARCHAR(30) CHARACTER SET NONE,
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALORCRE NUMERIC(9,2),
    SALDO NUMERIC(9,2),
    LETRA CHAR(1) CHARACTER SET NONE,
    VALORDEB NUMERIC(9,2),
    INFODOC VARCHAR(50) CHARACTER SET NONE,
    DOCUMENTO VARCHAR(40))
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE CONTADOR INTEGER;
DECLARE VARIABLE SALDOANT NUMERIC(9,2);
DECLARE VARIABLE CODDOCUMENTO INTEGER;
begin
  /* pego o saldo anterior */
  select
    max(codlancto)
  from
    pagamentos
  where
    cast(datapago as date) < :dataex and
    codconta = :codconta
  into
    :contador;
  select
    saldoatu
  from
    pagamentos
  where
    codlancto = :contador
  into
    :saldoant;
  hora = NULL;
  usuario = NULL;
  if (saldoant is null) then
     descricao = '*** ABERTURA DE CONTA ***';
  else
     descricao = 'SALDO ANTERIOR TRANSPORTADO';
  valorcre = NULL;
  valordeb = NULL;
  saldo = saldoant;
  letra = NULL;
  suspend;
  contador = 0;
  for
  select
    cast(datapago as time) as hora,
    nomeusuario,
    descricao,
    total_pago,
    saldoatu,
    saldoant,
    es,
    infodoc,
    coddocumento
  from
    pagamentos
  where
    codconta = :codconta and
    pago = 1 and
    cast(datapago as date) = :dataex
  order by
    codlancto
  into
    :hora,
    :usuario,
    :descricao,
    :valorcre,
    :saldo,
    :saldoant,
    :es,
    :infodoc,
    :coddocumento
  do
  begin
    contador = contador + 1;
    if (es = 1) then
     begin
      letra = 'D';
      valordeb = valorcre;
      valorcre = NULL;
     end
    else
     begin
      letra = 'C';
      valordeb = NULL;
     end

    select
      documento
    from
      documentos
    where
      codigo = :coddocumento
    into
      :documento;

    suspend;
  end
end!