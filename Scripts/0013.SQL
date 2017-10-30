/* mais correcoes */

CREATE PROCEDURE AUTOBAIXA (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE CODDOC_AVISTA INTEGER;
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE CODDOCUMENTO INTEGER;
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE PAGO INTEGER;
begin

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

GRANT EXECUTE ON PROCEDURE AUTOBAIXA TO PUBLIC!

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
declare variable NOME VARCHAR(16);
declare variable CODCLIENTE INTEGER;
declare variable CODFORNECEDOR INTEGER;
BEGIN
   SELECT
      CODDOC_AVISTA,
      CODDOC_PRAZO,
      CODCONTA_COMPRADEB,
      CODCONTA_VENDACRE
   FROM
      CONFIG_PADRAO
   INTO
      :DOCVISTA,
      :DOCPRAZO,
      :CODCONTA_COMPRADEB,
      :CODCONTA_VENDACRE;
   SELECT
      VALOR_TOTAL,
      CONDICAO,
      ES,
      DATA,
      TIPO,
      CODCLIENTE,
      CODFORNECEDOR
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
      :CODFORNECEDOR;
   if (ES = 1) then
    BEGIN
     CODCONTA = CODCONTA_COMPRADEB;
     SELECT
       F_LEFT(NOME, 16)
     FROM
       FORNECEDORES
     WHERE
       CODIGO = :CODFORNECEDOR
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
         VALOR, DATAVENCIMENTO, CODDOCUMENTO, PAGO, CODCONTA) VALUES (:CODPAG, :CODIGO, :N,
         :DESCRICAO, :ES, :PARCELA, :DATAMOV + :DIAS, :CODDOC, :CODPAGO, :CODCONTA);
      END
     UPDATE PAGAMENTOS SET VALOR = VALOR + (:TOTAL - (:PARCELA * :QUANTIDADE))
       WHERE CODMOVIMENTO = :CODIGO AND NUMERO = 1;
    END ELSE EXCEPTION CONDICAO_ERRADA;
END!

ALTER PROCEDURE REL_NOTAPRO (
    CODMOVIMENTO INTEGER)
RETURNS (
    CODIGO INTEGER,
    BARRA CHAR(13) CHARACTER SET NONE,
    DESCRICAO1 VARCHAR(40) CHARACTER SET NONE,
    DESCRICAO2 VARCHAR(60) CHARACTER SET NONE,
    SERIE VARCHAR(20) CHARACTER SET NONE,
    VALOR_VENDA NUMERIC(9,2),
    ICMS_VENDA NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    QUANTIDADE NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    VALOR_ICMS NUMERIC(9,2),
    SITTRIBU CHAR(3) CHARACTER SET NONE)
AS
BEGIN
   FOR
   SELECT
     ID.CODPRODUTO,
     ID.BARRA,
     PO.DESCRICAO,
     ID.SERIE,
     ID.VALOR_VENDA,
     ID.ICMSVENDA,
     ID.DESCONTO,
     TI.SITTRIBU,
     SUM(ID.QUANTIDADE),
     SUM(ID.VALOR_PAGO),
     SUM(ID.VALOR_ICMS)
   FROM
     INDIVIDUAIS ID
     LEFT JOIN PRODUTOS PO ON
       ( PO.CODIGO = ID.CODPRODUTO )
     LEFT JOIN TEMPITENS TI ON
       ( TI.CODMOVIMENTO = ID.CODMOVENTRADA AND
         TI.CODPRODUTO   = ID.CODPRODUTO    AND
         TI.CODIGO       = ID.CODITEM )
   WHERE
     ID.CODMOVSAIDA = :CODMOVIMENTO AND
     ID.VENDIDO = 'S' AND
     ID.PS = 'P'
   GROUP BY
     ID.CODPRODUTO,
     ID.BARRA,
     PO.DESCRICAO,
     ID.SERIE,
     ID.VALOR_VENDA,
     ID.ICMSVENDA,
     ID.DESCONTO,
     TI.SITTRIBU
   INTO
     :CODIGO,
     :BARRA,
     :DESCRICAO1,
     :SERIE,
     :VALOR_VENDA,
     :ICMS_VENDA,
     :DESCONTO,
     :SITTRIBU,
     :QUANTIDADE,
     :VALOR_PAGO,
     :VALOR_ICMS
   DO
   BEGIN
     if (serie <> 'N/F') then
        DESCRICAO2 = DESCRICAO1 || ' ' || SERIE;
     else
        DESCRICAO2 = DESCRICAO1;
     SUSPEND;
   END
END!

ALTER TRIGGER MOVIMENTOS_AFTUPD 
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

CREATE PROCEDURE BAIXA (
    CODIGO INTEGER,
    MULTA_JUROS NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    TIPO CHAR(1),
    CONTA INTEGER,
    CODDOCUMENTO INTEGER,
    INFODOC VARCHAR(50))
AS
DECLARE VARIABLE CODMOVIMENTO INTEGER;
DECLARE VARIABLE NUMERO INTEGER;
DECLARE VARIABLE DESCRICAO VARCHAR(40);
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE VALOR NUMERIC(9,2);
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE NOVONUM NUMERIC(15,2);
begin

  /* faço a baixa */
  update
    pagamentos
  set
    pago = 1,
    multa_juros = :multa_juros,
    desconto = :desconto,
    codconta = :conta,
    coddocumento = :coddocumento,
    infodoc = :infodoc
  where
    codigo = :codigo;

  /* é uma baixa parcial */
  if ((tipo = 'P') and (desconto > 0)) then
   begin

     /* leio os dados do pagamento */
     select
       codmovimento,
       F_LEFT(descricao, 35),
       es,
       valor - desconto,
       datavencimento
     from
       pagamentos
     where
       codigo = :codigo
     into
       :codmovimento,
       :descricao,
       :es,
       :valor,
       :datavencimento;

     /* pego o proximo codigo */
     select
       sequencia
     from
       seq_obter('PAGAMENTOS')
     into
       :codigo;

     /* acerto a descricao */
     descricao = 'ADIC ' || descricao;

     /* pego o numero novo */
     select
       max(numero) + 1
     from
       pagamentos
     where
       codmovimento = :codmovimento
     into
       :novonum;

     /* insiro o pagamento restante */
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
         codconta)
       values (
         :codigo,
         :codmovimento,
         :novonum,
         :descricao,
         :es,
         'NOW',
         :valor,
         'S',
         0,
         0,
         0,
         :datavencimento,
         0,
         0,
         :conta);

   end

end!

GRANT EXECUTE ON PROCEDURE BAIXA TO PUBLIC!

