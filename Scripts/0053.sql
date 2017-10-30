
ALTER PROCEDURE P_OS (
    EMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    DATA TIMESTAMP,
    PRIORIDADE INTEGER,
    STATUS VARCHAR (20),
    NOTA_NUMERO INTEGER,
    NOME VARCHAR (40),
    SERIE VARCHAR (30),
    VALOR_TOTAL NUMERIC (9, 2),
    VALOR_ABERTO NUMERIC (9, 2),
    TIPO INTEGER)
AS
begin
  for
  select
    mo.codigo,
    mo.serie,
    mo.valor_total,
    mo.tipo,
    mo.data,
    mo.prioridade,
    mo.status,
    mo.nota_numero,
    cl.nome
  from
    movimentos mo
    left join clientes cl on
      (mo.codcliente = cl.codigo)
  where
    mo.tipo in (0, 1, 2, 3, 5, 6, 9) and
    mo.codempresa = :empresa
  into
    :codigo,
    :serie,
    :valor_total,
    :tipo,
    :data,
    :prioridade,
    :status,
    :nota_numero,
    :nome
  do
  begin
    valor_aberto = null;
    /* verifico se esta fechada a saida */
    if (tipo in (1, 3, 6)) then
     begin
       select
         sum(valor)
       from
         pagamentos
       where
         codmovimento = :codigo and
         pago = 0
       into
         :valor_aberto;
     end
    /* retorno */
    suspend;
  end
end!

alter trigger STATUS_INSERT
ACTIVE Before Insert position 0
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
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'ESTORNADO';
   IF (NEW.ICMSSIMPLES = 'S') THEN
      NEW.VALOR_ICMS = (NEW.VALOR_ITENS * (NEW.ICMSSIMPALIQ / 100));
   ELSE
   BEGIN
      SELECT
        SUM(VALOR_ICMS)
      FROM
        INDIVIDUAIS
      WHERE
        CODMOVSAIDA = NEW.CODIGO
      INTO
        NEW.VALOR_ICMS;
      if (NEW.VALOR_ICMS IS NULL) THEN
        NEW.VALOR_ICMS = 0;
   END
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

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (53, CURRENT_TIMESTAMP)!