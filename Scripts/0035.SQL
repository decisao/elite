/* NOVAS IMPLEMENTAçÕES */

ALTER TABLE VENDEDORES  ADD TROCAVENDEDOR  SIMNAO!

ALTER TABLE VENDEDORES  ADD INTERNET       SIMNAO!

ALTER TABLE VENDEDORES  ADD MUDAEMPRESA    SIMNAO!

ALTER TABLE VENDEDORES  ADD COMISSAO       DINHEIRO!

ALTER TABLE MOVIMENTOS  ADD VALOR_COMISSAO DINHEIRO!

ALTER TABLE INDIVIDUAIS ADD VALOR_COMISSAO DINHEIRO!

ALTER TABLE PAGAMENTOS  ADD VALOR_COMISSAO DINHEIRO!

ALTER PROCEDURE ITVENDA_GRAVA (
    BARRA CHAR(14) CHARACTER SET NONE,
    QUANTIDADE NUMERIC(9,2),
    VALOR NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    ICMS NUMERIC(9,2),
    CODMOVSAIDA INTEGER)
AS
DECLARE VARIABLE XCODIGO INTEGER;
DECLARE VARIABLE XCODITEM INTEGER;
DECLARE VARIABLE XCODPRODUTO INTEGER;
DECLARE VARIABLE XCODMOVENTRADA INTEGER;
DECLARE VARIABLE XSEQUENCIA CHAR(4);
DECLARE VARIABLE XSERIE CHAR(20);
DECLARE VARIABLE XVENDIDO CHAR(1);
DECLARE VARIABLE XCODMOVSAIDA INTEGER;
DECLARE VARIABLE XVALOR_VENDA NUMERIC(9,2);
DECLARE VARIABLE XICMSVENDA NUMERIC(9,2);
DECLARE VARIABLE XDESCONTO NUMERIC(9,2);
DECLARE VARIABLE XIMPETIQ CHAR(1);
DECLARE VARIABLE XBARRA CHAR(14);
DECLARE VARIABLE XQUANTIDADE NUMERIC(9,2);
DECLARE VARIABLE XUNICO INTEGER;
DECLARE VARIABLE BAIXA NUMERIC(9,2);
DECLARE VARIABLE SOBRA NUMERIC(9,2);
DECLARE VARIABLE NSEQ INTEGER;
DECLARE VARIABLE PS CHAR(1);
DECLARE VARIABLE XPRECOCUSTO NUMERIC(9,2);
DECLARE VARIABLE CODEMPRESA INTEGER;
DECLARE VARIABLE COMISSAO_CLIENTE CHAR(1);
DECLARE VARIABLE COMISSAO_PRODUTO CHAR(1);
DECLARE VARIABLE PERCCOMISSAO NUMERIC(9,2);
DECLARE VARIABLE CODCLIENTE INTEGER;
DECLARE VARIABLE CODVENDEDOR INTEGER;
DECLARE VARIABLE COMISSAO NUMERIC(9,2);
BEGIN

  /* informações do produto */
  SELECT
    CODIGO,
    PRECOCUSTO,
    PS,
    COMISSIONADO
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :XPRECOCUSTO,
    :PS,
    :COMISSAO_PRODUTO;

  /* informações do movimento */
  SELECT
    CODCLIENTE,
    CODVENDEDOR,
    CODEMPRESA
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA;

  /* informações do cliente */
  SELECT
    COMISSIONADO
  FROM
    CLIENTES
  WHERE
    CODIGO = :CODCLIENTE
  INTO
    :COMISSAO_CLIENTE;

  /* informações do vendedor */
  SELECT
    COMISSAO
  FROM
    VENDEDORES
  WHERE
    CODIGO = :CODVENDEDOR
  INTO
    :PERCCOMISSAO;

  /* verifico se é PRODUTO e não serviço */
  IF ((PS = 'P') or (PS IS NULL)) THEN
   BEGIN

    /* verifico se já foi vendido nesse movimento */
    SELECT
      SUM(QUANTIDADE)
    FROM
      INDIVIDUAIS
    WHERE
      BARRA = :BARRA AND
      VENDIDO = 'S' AND
      CODMOVSAIDA = :CODMOVSAIDA AND
      CODEMPRESA = :CODEMPRESA
    INTO
      :XQUANTIDADE;

    IF (XQUANTIDADE IS NULL) THEN
      XQUANTIDADE = 0;

    /* se já foi vendido, erro, só um lançamento para cada produto diferente */
    IF (XQUANTIDADE > 0) THEN
      EXCEPTION ITEM_REPETIDO;

    /* verifico se existe estoque */
    SELECT
      SUM(QUANTIDADE)
    FROM
      INDIVIDUAIS
    WHERE
      BARRA = :BARRA AND
      VENDIDO = 'N'  AND
      CODEMPRESA = :CODEMPRESA
    INTO
      :XQUANTIDADE;

    /* se tiver estoque, faço a venda */
    IF (QUANTIDADE <= XQUANTIDADE) THEN
      BEGIN

        /* faço uma varredura dos itens no estoque */
        FOR
        SELECT
          CODIGO,
          CODITEM,
          CODPRODUTO,
          CODMOVENTRADA,
          SEQUENCIA,
          SERIE,
          VENDIDO,
          CODMOVSAIDA,
          VALOR_VENDA,
          ICMSVENDA,
          DESCONTO,
          IMPETIQ,
          BARRA,
          QUANTIDADE,
          UNICO
        FROM
          INDIVIDUAIS
        WHERE
          BARRA = :BARRA AND
          VENDIDO = 'N' AND
          CODEMPRESA = :CODEMPRESA
        ORDER BY
          CODIGO
        INTO
          :XCODIGO,
          :XCODITEM,
          :XCODPRODUTO,
          :XCODMOVENTRADA,
          :XSEQUENCIA,
          :XSERIE,
          :XVENDIDO,
          :XCODMOVSAIDA,
          :XVALOR_VENDA,
          :XICMSVENDA,
          :XDESCONTO,
          :XIMPETIQ,
          :XBARRA,
          :XQUANTIDADE,
          :XUNICO
        DO
        BEGIN

          /* tenho estoque nesse registro */
          IF (QUANTIDADE > 0) THEN
            BEGIN

              /* se a quantidade é suficiente ou maior */
              SOBRA = 0;
              IF (QUANTIDADE >= XQUANTIDADE) THEN
                BEGIN
                  BAIXA = XQUANTIDADE;
                END ELSE
                BEGIN
                  BAIXA = QUANTIDADE;
                  SOBRA = XQUANTIDADE - BAIXA;
                END

              /* se faltou, calculo para a próxima iteração */
              QUANTIDADE = QUANTIDADE - BAIXA;

              /* calculo a comissao desse item */
              IF ((COMISSAO_PRODUTO = 'S') AND (COMISSAO_CLIENTE = 'S')) THEN
                COMISSAO = ((VALOR - DESCONTO) * BAIXA) * (PERCCOMISSAO / 100);
              ELSE
                COMISSAO = 0;

              /* vendo o que for preciso */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODMOVSAIDA = :CODMOVSAIDA,
                VALOR_VENDA = :VALOR,
                DESCONTO = :DESCONTO,
                VENDIDO = 'S',
                ICMSVENDA = :ICMS,
                VALOR_COMISSAO = :COMISSAO
              WHERE
                CODIGO = :XCODIGO;

              /* se sobrou, insiro um novo item de estoque com a sobre */
              IF (SOBRA > 0) THEN
                BEGIN

                  /* pego a sequencia dos itens de estoque */
                  EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
                    RETURNING_VALUES NSEQ;

                  XVENDIDO = 'N';

                  /* insiro o registro no estoque */
                  INSERT INTO
                    INDIVIDUAIS (
                      CODIGO,
                      CODITEM,
                      CODPRODUTO,
                      CODMOVENTRADA,
                      SEQUENCIA,
                      SERIE,
                      VENDIDO,
                      VALOR_VENDA,
                      ICMSVENDA,
                      DESCONTO,
                      IMPETIQ,
                      BARRA,
                      QUANTIDADE,
                      UNICO,
                      FRACIONADO,
                      CODEMPRESA)
                    VALUES (
                      :NSEQ,
                      :XCODITEM,
                      :XCODPRODUTO,
                      :XCODMOVENTRADA,
                      :XSEQUENCIA,
                      :XSERIE,
                      :XVENDIDO,
                      :XVALOR_VENDA,
                      :XICMSVENDA,
                      :XDESCONTO,
                      :XIMPETIQ,
                      :XBARRA,
                      :SOBRA,
                      :XUNICO,
                      'S',
                      :CODEMPRESA);
              END
            END ELSE EXIT;
        END

      /* se não houver estoque, gero erro */
      END ELSE EXCEPTION ITEM_ESGOTADO;

    /* se não for produto, é SERVIÇO */
    END ELSE
    BEGIN

      /* pego a sequencia dos itens temporários */
      EXECUTE PROCEDURE SEQ_OBTER 'TEMPITENS'
         RETURNING_VALUES XCODITEM;

      /* insiro um item de serviço na quantidade exata */
      INSERT INTO
        TEMPITENS (
          CODIGO,
          CODMOVIMENTO,
          CODPRODUTO,
          QUANTIDADE,
          VALOR_UNITARIO,
          DESCONTO,
          SITTRIBU,
          MARGEM,
          REAJUSTAR,
          VALOR_VENDA,
          ICMSCOMPRA,
          ICMSVENDA)
        VALUES (
          :XCODITEM,
          :CODMOVSAIDA,
          :XCODPRODUTO,
          :QUANTIDADE,
          :XPRECOCUSTO,
          0,
          '0.0',
          0,
          'N',
          :VALOR,
          0,
          0);

      /* pego a sequencia dos itens de estoque */
      EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
         RETURNING_VALUES NSEQ;

      /* insiro um item de serviço na quantidade exata */
      INSERT INTO
        INDIVIDUAIS (
          CODIGO,
          CODITEM,
          CODPRODUTO,
          CODMOVENTRADA,
          CODMOVSAIDA,
          SEQUENCIA,
          SERIE,
          VENDIDO,
          VALOR_VENDA,
          ICMSVENDA,
          DESCONTO,
          IMPETIQ,
          BARRA,
          QUANTIDADE,
          UNICO,
          FRACIONADO,
          PS,
          CODEMPRESA)
        VALUES (
          :NSEQ,
          :XCODITEM,
          :XCODPRODUTO,
          :CODMOVSAIDA,
          :CODMOVSAIDA,
          '0000',
          '',
          'S',
          :VALOR,
          0,
          :DESCONTO,
          'N',
          :BARRA,
          :QUANTIDADE,
          0,
          'N',
          'S',
          :CODEMPRESA);
    END
END!

ALTER TRIGGER STATUS_UPDATE
ACTIVE BEFORE UPDATE POSITION 0
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
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'CANCELADO';

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

  /* calculo a comissao de cada parcela */
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
ACTIVE AFTER UPDATE POSITION 0
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

