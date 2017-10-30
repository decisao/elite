
ALTER PROCEDURE AUTOBAIXA (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE CODDOC_AVISTA INTEGER;
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE CODDOCUMENTO INTEGER;
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE PAGO INTEGER;
DECLARE VARIABLE PARCELA_TOTAL NUMERIC(9,2);
DECLARE VARIABLE MOVIMENTO_TOTAL NUMERIC(9,2);
DECLARE VARIABLE VALOR_COMISSAO NUMERIC(9,2);
declare variable XPARC INTEGER;
begin
  /* verifico se os valores sao correspondentes */
  select
    count(codigo),
    sum(valor)
  from
    pagamentos
  where
    codmovimento = :codmovimento
  into
    :xparc,
    :parcela_total;
  select
    nota_valor_total,
    valor_comissao
  from
    movimentos
  where
    codigo = :codmovimento
  into
    :movimento_total,
    :valor_comissao;

  /* calculo a comissao de cada parcela, com seguranca */
  if (valor_comissao is null) then
    valor_comissao = 0;
  if (xparc is null) then
    xparc = 0;

  if ((valor_comissao > 0) and (xparc > 0)) then
    valor_comissao = (valor_comissao / cast(xparc as numeric(9,2)));

  if (movimento_total > parcela_total) then
    exception valor_parcela;

  /* qual é o documento a vista? */
  select
    coddoc_avista
  from
    config_padrao
  into
    :coddoc_avista;
  /* procuro os pagamentos, algum é a vista? */
  for
  select
    codigo,
    coddocumento,
    datavencimento,
    pago
  from
    pagamentos
  where
    codmovimento = :codmovimento
  into
    :codigo,
    :coddocumento,
    :datavencimento,
    :pago
  do
  begin
    /* atualizo a comissao */
    update
      pagamentos
    set
      valor_comissao = :valor_comissao
    where
      codigo = :codigo;
    /* o documento é a vista? */
    if ((coddocumento = coddoc_avista) and (pago = 0)) then
     begin
      /* faço o lançamento */
      update
        pagamentos
      set
        pago = 1
      where
        codigo = :codigo;
     end
  end
end!

ALTER TRIGGER MOVIMENTOS_AFTUPD
AFTER UPDATE POSITION 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
   BEGIN
     IF (((NEW.VALOR_TOTAL <> OLD.VALOR_TOTAL) OR
        (NEW.CONDICAO <> OLD.CONDICAO)) AND
        (NEW.TIPO IN (1, 2, 5))) THEN
           EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
     if ((NEW.TIPO IN (3, 6)) AND (OLD.TIPO IN (2, 5))) then
           EXECUTE PROCEDURE AUTOBAIXA(NEW.CODIGO);
   END
  IF ((NEW.TIPO = 9) or (NEW.VALOR_TOTAL = 0)) THEN
     DELETE FROM PAGAMENTOS WHERE CODMOVIMENTO = NEW.CODIGO AND
       PAGO = 0;
END!

alter trigger STATUS_UPDATE
ACTIVE Before Update position 0
AS
BEGIN
   IF (NEW.TIPO = 0) THEN NEW.STATUS = 'ORÇAMENTO';
   IF (NEW.TIPO = 1) THEN NEW.STATUS = 'COMPRA';
   IF (NEW.TIPO = 2) THEN NEW.STATUS = 'OS ABERTA';
   IF (NEW.TIPO = 3) THEN NEW.STATUS = 'OS FECHADA';
   IF (NEW.TIPO = 4) THEN NEW.STATUS = 'PRE ASSITENCIA';
   IF (NEW.TIPO = 5) THEN NEW.STATUS = 'VENDA ABERTA';
   IF (NEW.TIPO = 6) THEN NEW.STATUS = 'VENDA FECHADA';
   IF (NEW.TIPO = 7) THEN NEW.STATUS = 'N/F';
   IF (NEW.TIPO = 8) THEN NEW.STATUS = 'N/F';
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'ESTORNO';
   /* fechou a venda */
   IF ((OLD.TIPO IN (2, 5)) AND (NEW.TIPO IN (3, 6))) THEN
    BEGIN
     /* usuário, data e hora do fechamento */
     NEW.DATAFECHAMENTO = 'NOW';
     NEW.USUARIOFECHAMENTO = USER;
     /* total da comissao */
     SELECT
       SUM(VALOR_COMISSAO)
     FROM
       INDIVIDUAIS
     WHERE
       CODMOVSAIDA = OLD.CODIGO AND
       VENDIDO = 'S'
     INTO
       NEW.VALOR_COMISSAO;
     IF (NEW.VALOR_COMISSAO IS NULL) THEN
       NEW.VALOR_COMISSAO = 0.0;
    END
   IF (NEW.ICMSSIMPLES = 'S') THEN
      NEW.VALOR_ICMS = (NEW.VALOR_ITENS * (NEW.ICMSSIMPALIQ / 100));
   ELSE
   BEGIN
      SELECT
        SUM(VALOR_ICMS)
      FROM
        INDIVIDUAIS
      WHERE
        CODMOVSAIDA = NEW.CODIGO AND
        VENDIDO = 'S'
      INTO
        NEW.VALOR_ICMS;
      if (NEW.VALOR_ICMS IS NULL) THEN
        NEW.VALOR_ICMS = 0;
   END
END!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (60, CURRENT_TIMESTAMP)!
