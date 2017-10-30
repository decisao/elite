/*
** BUG DA QUANTIDADE ZERO
*/

SET TERM ^ ;

ALTER PROCEDURE ITVENDA_GRAVA (
    BARRA CHAR(14),
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
DECLARE VARIABLE ALIQUOTA_ICMSPRODUTO NUMERIC(9,4);
DECLARE VARIABLE ECF CHAR(1);
DECLARE VARIABLE ICMSSIMPLES CHAR(1);
DECLARE VARIABLE ALIQUOTA_ICMSSIMPLES NUMERIC(9,4);
DECLARE VARIABLE XCUSTO_PRODUTO NUMERIC(9,2);
DECLARE VARIABLE XCUSTO_IPI NUMERIC(9,2);
DECLARE VARIABLE XCUSTO_RATEIO NUMERIC(9,2);
DECLARE VARIABLE XCUSTO_ICMS NUMERIC(9,2);
DECLARE VARIABLE XCUSTO_ISS NUMERIC(9,2);
BEGIN

  /* verifico a quantidade */
  if (quantidade <= 0) then
    exception quantidade_positiva;

  /* informações do produto */
  SELECT
    CODIGO,
    PRECOCUSTO,
    PS,
    COMISSIONADO,
    ICMS
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :XPRECOCUSTO,
    :PS,
    :COMISSAO_PRODUTO,
    :ALIQUOTA_ICMSPRODUTO;

  /* informações do movimento */
  SELECT
    CODCLIENTE,
    CODVENDEDOR,
    CODEMPRESA,
    ECF
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA,
    :ECF;

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
    CLIENTES
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
          UNICO,
          CUSTO_PRODUTO,
          CUSTO_IPI,
          CUSTO_RATEIO,
          CUSTO_ICMS,
          CUSTO_ISS
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
          :XUNICO,
          :XCUSTO_PRODUTO,
          :XCUSTO_IPI,
          :XCUSTO_RATEIO,
          :XCUSTO_ICMS,
          :XCUSTO_ISS
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

              /* se for ecf, aliquota do cadastro de produtos */
              IF (ECF = 'S') THEN
                XICMSVENDA = ALIQUOTA_ICMSPRODUTO;

              /* verifico o icms correto */
              SELECT
                ICMSSIMPLES,
                ALIQUOTA_ICMSSIMPLES
              FROM
                SISCONFIG
              WHERE
                CODIGO = :CODEMPRESA
              INTO
                :ICMSSIMPLES,
                :ALIQUOTA_ICMSSIMPLES;

              /* se for simples, aliquota simples */
              IF (ICMSSIMPLES = 'S') THEN
                XICMSVENDA = ALIQUOTA_ICMSSIMPLES;

              /* vendo o que for preciso */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODMOVSAIDA = :CODMOVSAIDA,
                VALOR_VENDA = :VALOR,
                DESCONTO = :DESCONTO,
                VENDIDO = 'S',
                ICMSVENDA = :XICMSVENDA,
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
                      CODEMPRESA,
                      CUSTO_PRODUTO,
                      CUSTO_IPI,
                      CUSTO_RATEIO,
                      CUSTO_ICMS,
                      CUSTO_ISS)
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
                      :CODEMPRESA,
                      :XCUSTO_PRODUTO,
                      :XCUSTO_IPI,
                      :XCUSTO_RATEIO,
                      :XCUSTO_ICMS,
                      :XCUSTO_ISS);

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
          CODEMPRESA,
          CUSTO_PRODUTO)
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
          :CODEMPRESA,
          :XPRECOCUSTO);
    END
END

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE ORCAMENTO_OS(
    CODMOVIMENTO INTEGER)
RETURNS (
    TODOS CHAR(1))
AS
  DECLARE VARIABLE ES          INTEGER;
  DECLARE VARIABLE TIPO        INTEGER;
  DECLARE VARIABLE SERVICOS    VARCHAR(1024);
  DECLARE VARIABLE BARRA       CHAR(14);
  DECLARE VARIABLE INDIVIDUAL  CHAR(1);
  DECLARE VARIABLE VALOR       NUMERIC(9, 2);
  DECLARE VARIABLE DESCONTO    NUMERIC(9, 2);
  DECLARE VARIABLE ICMS        NUMERIC(9, 2);
  DECLARE VARIABLE QUANTIDADE  NUMERIC(9, 2);
  DECLARE VARIABLE CODPRODUTO  INTEGER;
  DECLARE VARIABLE SOMA        NUMERIC(9, 2);
BEGIN
  TODOS = 'S';
  SOMA  = 0;
  /* VERIFICO SE O MOVIMENTO PASSADO EH MESMO UM ORCAMENTO */
  SELECT
    ES,
    TIPO,
    SERVICOS
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVIMENTO
  INTO
    :ES,
    :TIPO,
    :SERVICOS;
  IF ( ES = 0 AND TIPO = 1 ) THEN
   BEGIN
     /* DEFINO COMO OS ABERTA */
     ES   = 2;
     TIPO = 2;
     /* ATUALIZO OS PRODUTOS ORCADOS */
     FOR
     SELECT
       TI.CODPRODUTO,
       TI.QUANTIDADE,
       TI.VALOR_UNITARIO,
       TI.DESCONTO,
       TI.ICMSVENDA,
       PR.BARRA,
       PR.INDIVIDUAL
     FROM
       TEMPITENS TI
       JOIN PRODUTOS PR ON
         (TI.CODPRODUTO = PR.CODIGO)
     WHERE
       TI.CODMOVIMENTO = :CODMOVIMENTO
     INTO
       :CODPRODUTO,
       :QUANTIDADE,
       :VALOR,
       :DESCONTO,
       :ICMS,
       :BARRA,
       :INDIVIDUAL
     DO
     BEGIN
       IF ( INDIVIDUAL = 'N' ) THEN
        BEGIN
         EXECUTE PROCEDURE ITVENDA_GRAVA
           :BARRA,
           :QUANTIDADE,
           :VALOR,
           :DESCONTO,
           :ICMS,
           :CODMOVIMENTO;
         SOMA = SOMA + (VALOR - DESCONTO) * QUANTIDADE;
        END ELSE TODOS = 'N';
     END
     /* APAGO OS ITENS TEMPORARIOS */
     DELETE FROM
       TEMPITENS
     WHERE
       CODMOVIMENTO = :CODMOVIMENTO;
     /* ATUALIZO O MOVIMENTOS */
     UPDATE
       MOVIMENTOS
     SET
       ES          = :ES,
       TIPO        = :TIPO,
       PROBLEMA    = :SERVICOS,
       VALOR_ITENS = :SOMA
     WHERE
       CODIGO   = :CODMOVIMENTO;
   END
END

^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (165, CURRENT_TIMESTAMP);
COMMIT;