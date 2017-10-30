ALTER PROCEDURE ESTORNO (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE NUMERO INTEGER;
DECLARE VARIABLE CODDOCUMENTO INTEGER;
DECLARE VARIABLE INFODOC VARCHAR(50);
DECLARE VARIABLE CODCONTA INTEGER;
DECLARE VARIABLE TOTAL_PAGO NUMERIC(9,2);
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE DESCRICAO VARCHAR(40);
DECLARE VARIABLE NOME VARCHAR(40);
DECLARE VARIABLE CODIGO INTEGER;
begin
  /* marco como cancelado */
  update
    movimentos
  set
    tipo = 9
  where
    codigo = :codmovimento;
  /* devolvo os produtos */
  update
    individuais
  set
    vendido = 'N'
  where
    codmovsaida = :codmovimento;
  /* verifico os pagamentos e estorno 1 a 1 */
  for
  select
    es,
    numero,
    coddocumento,
    infodoc,
    codconta,
    total_pago,
    datavencimento
  from
    pagamentos
  where
    codmovimento = :codmovimento and
    pago = 1
  into
    :es,
    :numero,
    :coddocumento,
    :infodoc,
    :codconta,
    :total_pago,
    :datavencimento
  do
  begin
    /* pego o nome do cliente */
    if (es = 1) then
     begin
       select
         fo.nome
       from
         movimentos mo
         join clientes fo on
           (fo.codigo = mo.codcliente)
       where
         mo.codigo = :codmovimento
       into
         :nome;
     end else
     begin
       select
         cl.nome
       from
         movimentos mo
         join clientes cl on
           (cl.codigo = mo.codcliente)
       where
         mo.codigo = :codmovimento
       into
         :nome;
     end
    /* monto a descricao */
    if (es = 1) then
      descricao = 'ESTORNO PARC ' || numero || ' DA COMPRA ' || codmovimento || ' ' || f_left(nome, 8);
    else
      descricao = 'ESTORNO PARC ' || numero || ' DA VENDA ' || codmovimento || ' ' || f_left(nome, 8);
    /* inverto a condicao pagar/receber */
    if (es = 1) then
      es = 2;
    else es = 1;
    /* retiro as horas */
    datavencimento = cast(datavencimento as date);
    /* pego o codigo do lancamento */
    select
      sequencia
    from
      seq_obter('PAGAMENTOS')
    into
      :codigo;
    /* gravo o estorno da parcela */
    insert into
      pagamentos (
        codigo,
        codmovimento,
        numero,
        descricao,
        es,
        datacadast,
        valor,
        externo,
        pago,
        desconto,
        multa_juros,
        datavencimento,
        saldoant,
        saldoatu,
        codconta,
        coddocumento,
        infodoc)
      values (
        :codigo,
        :codmovimento,
        :numero,
        :descricao,
        :es,
        'NOW',
        :total_pago,
        'S',
        0,
        0,
        0,
        'NOW',
        0,
        0,
        :codconta,
        :coddocumento,
        :infodoc);
  end
end!

ALTER PROCEDURE GERAPARCELAS (
    CODIGO INTEGER)
AS
DECLARE VARIABLE TOTAL NUMERIC(9,2);
DECLARE VARIABLE PARCELA NUMERIC(9,2);
DECLARE VARIABLE CONDICAO VARCHAR(40);
DECLARE VARIABLE QUANTIDADE INTEGER;
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE N INTEGER;
DECLARE VARIABLE CODPAG INTEGER;
DECLARE VARIABLE DATAMOV DATE;
DECLARE VARIABLE DIAS INTEGER;
DECLARE VARIABLE CODDOC INTEGER;
DECLARE VARIABLE CODPAGO INTEGER;
DECLARE VARIABLE DOCVISTA INTEGER;
DECLARE VARIABLE DOCPRAZO INTEGER;
DECLARE VARIABLE DESCRICAO CHAR(40);
DECLARE VARIABLE TIPO INTEGER;
DECLARE VARIABLE CODCONTA_COMPRADEB INTEGER;
DECLARE VARIABLE CODCONTA_VENDACRE INTEGER;
DECLARE VARIABLE CODCONTA INTEGER;
DECLARE VARIABLE NOME VARCHAR(16);
DECLARE VARIABLE CODCLIENTE INTEGER;
DECLARE VARIABLE CODEMPRESA INTEGER;
BEGIN
   SELECT
      VALOR_TOTAL,
      CONDICAO,
      ES,
      DATA,
      TIPO,
      CODCLIENTE,
      CODEMPRESA
   FROM
      MOVIMENTOS
   WHERE
      CODIGO = :CODIGO
   INTO
      :TOTAL,
      :CONDICAO,
      :ES,
      :DATAMOV,
      :TIPO,
      :CODCLIENTE,
      :CODEMPRESA;
   SELECT
      CODDOC_AVISTA,
      CODDOC_PRAZO,
      CODCONTA_COMPRADEB,
      CODCONTA_VENDACRE
   FROM
      SISCONFIG
   WHERE
      CODIGO = :CODEMPRESA
   INTO
      :DOCVISTA,
      :DOCPRAZO,
      :CODCONTA_COMPRADEB,
      :CODCONTA_VENDACRE;
   if (ES = 1) then
    BEGIN
     CODCONTA = CODCONTA_COMPRADEB;
     SELECT
       F_LEFT(NOME, 16)
     FROM
       CLIENTES
     WHERE
       CODIGO = :CODCLIENTE
     INTO
       :NOME;
    END
   else
    BEGIN
     CODCONTA = CODCONTA_VENDACRE;
     SELECT
       F_LEFT(NOME, 16)
     FROM
       CLIENTES
     WHERE
       CODIGO = :CODCLIENTE
     INTO
       :NOME;
   END
   IF (TOTAL <= 0) THEN EXIT;
   SELECT
      COUNT(*)
   FROM
      PARCELAS(
        :CONDICAO
      )
   INTO
      :QUANTIDADE;
   IF (QUANTIDADE > 0) THEN
    BEGIN
     DELETE FROM
      PAGAMENTOS
     WHERE
      CODMOVIMENTO = :CODIGO;
     PARCELA = CAST((TOTAL / QUANTIDADE) AS INTEGER);
     N = 0;
     FOR
     SELECT DIAS FROM PARCELAS(:CONDICAO) INTO :DIAS DO
      BEGIN
       N = N + 1;
       IF (ES = 1) THEN
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' COMPRA ' || CODIGO || ' ' || NOME;
       ELSE
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' VENDA ' || CODIGO || ' ' || NOME;
       SELECT SEQUENCIA FROM SEQ_OBTER('PAGAMENTOS') INTO :CODPAG;
       if (DIAS = 0) then
        begin
          CODDOC = DOCVISTA;
          CODPAGO = 0;
        end else
        begin
          CODDOC = DOCPRAZO;
          CODPAGO = 0;
        end
       INSERT INTO PAGAMENTOS (CODIGO, CODMOVIMENTO, NUMERO, DESCRICAO, ES,
         VALOR, DATAVENCIMENTO, CODDOCUMENTO, PAGO, CODCONTA, CODEMPRESA) VALUES (:CODPAG, :CODIGO, :N,
         :DESCRICAO, :ES, :PARCELA, :DATAMOV + :DIAS, :CODDOC, :CODPAGO, :CODCONTA, :CODEMPRESA);
      END
     UPDATE PAGAMENTOS SET VALOR = VALOR + (:TOTAL - (:PARCELA * :QUANTIDADE))
       WHERE CODMOVIMENTO = :CODIGO AND NUMERO = 1;
    END ELSE EXCEPTION CONDICAO_ERRADA;
END!

alter trigger MOVIMENTOS_AFTINS
ACTIVE After Insert position 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
    IF (NEW.VALOR_TOTAL > 0) THEN
      EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
END!

alter trigger MOVIMENTOS_AFTUPD
ACTIVE After Update position 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
   BEGIN
     IF (((NEW.VALOR_TOTAL <> OLD.VALOR_TOTAL) OR
        (NEW.CONDICAO <> OLD.CONDICAO)) AND
        (NEW.TIPO IN (1, 2, 5))) THEN
           EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
     if (NEW.TIPO IN (3, 6)) then
           EXECUTE PROCEDURE AUTOBAIXA(NEW.CODIGO);
   END
  IF (NEW.TIPO = 9) THEN
     DELETE FROM PAGAMENTOS WHERE CODMOVIMENTO = NEW.CODIGO AND
       PAGO = 0;
END!

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
DECLARE VARIABLE NOMEFOR VARCHAR(40);
begin
  for
  select
    mo.codigo,
    mo.data,
    mo.prioridade,
    mo.status,
    mo.nota_numero,
    cl.nome,
    mo.serie,
    mo.valor_total,
    mo.tipo
  from
    movimentos mo
    left join clientes cl on
      (mo.codcliente = cl.codigo)
  where
    tipo in (0, 1, 2, 3, 5, 6, 9) and
    codempresa = :empresa
  into
    :codigo,
    :data,
    :prioridade,
    :status,
    :nota_numero,
    :nome,
    :serie,
    :valor_total,
    :tipo
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

alter table "MOVIMENTOS" drop "CODFORNECEDOR"!

DROP TABLE FORNECEDORES!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (51, CURRENT_TIMESTAMP)!
