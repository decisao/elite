/*
** DEFINICAO DE VENDA/ESTOQUE/ICMS/IPI POR NATUREZA DE OPERACAO
** INCLUI CORRECAO NA ORDENACAO DAS VENDAS DOS ITENS EM ESTOQUE (POR ORDEM DE COMPRA)
*/

ALTER TABLE NATUOPER ADD VENDA SIMNAO;

UPDATE NATUOPER SET VENDA = 'N';

ALTER TABLE NATUOPER ADD ESTOQUE SIMNAO;

UPDATE NATUOPER SET ESTOQUE = 'N';

ALTER TABLE NATUOPER ADD ICMS SIMNAO;

UPDATE NATUOPER SET ICMS = 'N';

ALTER TABLE NATUOPER ADD IPI SIMNAO;

UPDATE NATUOPER SET IPI = 'N';

CREATE EXCEPTION INDIVIDUO_ESTOQUE 'PRODUTOS INDIVIDUAIS PRECISAM DE MOVIMENTACAO DE ESTOQUE';

CREATE EXCEPTION MOV_PREVIA 'NECESSARIA MOVIMENTACAO PREVIA';

COMMIT;

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
DECLARE VARIABLE ESTOQUE CHAR(1);
DECLARE VARIABLE TMP_ICMS CHAR(1);
DECLARE VARIABLE TMP_IPI CHAR(1);
DECLARE VARIABLE CODNATUOPER VARCHAR(5);
DECLARE VARIABLE CODCOMPRA INTEGER;
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
    ECF,
    NOTA_CODNATUOPER
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA,
    :ECF,
    :CODNATUOPER;

  /* INFORMACOES DA NATUREZA DE OPERACAO */
  SELECT
    ESTOQUE,
    ICMS,
    IPI
  FROM
    NATUOPER
  WHERE
    CODIGO = :CODNATUOPER
  INTO
    :ESTOQUE,
    :TMP_ICMS,
    :TMP_IPI;

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

  /* NAO POSSUI MOVIMENTACAO DE ESTOQUE */
  IF ((PS = 'P') AND (ESTOQUE = 'N')) THEN
   BEGIN

     /* CODIGO DO PRODUTO */
     SELECT
       PO.CODIGO
     FROM
       PRODUTOS PO
     WHERE
       PO.BARRA = :BARRA
     INTO
       :XCODPRODUTO;

     IF (XCODPRODUTO IS NULL) THEN
       EXCEPTION INDIVIDUO_ESTOQUE;

     /* CODIGO DA ULTIMA COMPRA */
     SELECT
       MAX(TM.CODIGO)
     FROM
       TEMPITENS TM
       JOIN MOVIMENTOS MO ON
         (MO.CODIGO = TM.CODMOVIMENTO)
     WHERE
       TM.CODPRODUTO = :XCODPRODUTO AND
       MO.ES         = 1            AND
       MO.TIPO       = 1            AND
       MO.CODCLIENTE = :CODCLIENTE
     INTO
       :CODCOMPRA;

     IF (CODCOMPRA IS NULL) THEN
       EXCEPTION MOV_PREVIA;

     SELECT
       CODMOVIMENTO,
       ICMSCOMPRA,
       CAST((VALOR_TOTAL / QUANTIDADE) AS NUMERIC(9, 2))
     FROM
       TEMPITENS
     WHERE
       CODIGO = :CODCOMPRA
     INTO
       :XCODMOVENTRADA,
       :XICMSVENDA,
       :XPRECOCUSTO;

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
         :CODCOMPRA,
         :XCODPRODUTO,
         :XCODMOVENTRADA,
         :CODMOVSAIDA,
         '0000',
         '',
         'S',
         :VALOR,
         :XICMSVENDA,
         :DESCONTO,
         'N',
         :BARRA,
         :QUANTIDADE,
         0,
         'N',
         'S',
         :CODEMPRESA,
         :XPRECOCUSTO);

   END ELSE

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
                COMISSAO = 0.0;

              IF (COMISSAO IS NULL) THEN
                COMISSAO = 0.0;

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

COMMIT;

SET TERM ^ ;

ALTER PROCEDURE ITVENDA_CANCELA (
    BARRA CHAR(14),
    CODMOVSAIDA INTEGER)
AS
DECLARE VARIABLE ESTOQUE CHAR(1);
BEGIN

  UPDATE
    INDIVIDUAIS
  SET
    VENDIDO = 'N'
  WHERE
    BARRA = :BARRA AND
    CODMOVSAIDA = :CODMOVSAIDA;

END

^

SET TERM ; ^

SET TERM ^ ;

CREATE TRIGGER INDIVIDUAIS_AU0 FOR INDIVIDUAIS
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE ESTOQUE CHAR(1);
begin

  /* APAGO OS ITENS ESTORNADOS DE MOVIMENTOS SEM ESTOQUE */
  /* SENAO VAI INCREMENTAR ESTOQUE DE PRODUTOS */

  SELECT
    NA.ESTOQUE
  FROM
    NATUOPER NA
    JOIN MOVIMENTOS MO ON
      (MO.NOTA_CODNATUOPER = MO.CODIGO)
  WHERE
    MO.CODIGO = NEW.CODMOVSAIDA
  INTO
    :ESTOQUE;

  IF (ESTOQUE = 'N') THEN
    DELETE FROM
      INDIVIDUAIS
    WHERE
      CODIGO = NEW.CODIGO;

end

^

SET TERM ; ^

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
DECLARE VARIABLE ESTOQUE CHAR(1);
DECLARE VARIABLE TMP_ICMS CHAR(1);
DECLARE VARIABLE TMP_IPI CHAR(1);
DECLARE VARIABLE CODNATUOPER VARCHAR(5);
DECLARE VARIABLE CODCOMPRA INTEGER;
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
    ECF,
    NOTA_CODNATUOPER
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA,
    :ECF,
    :CODNATUOPER;

  /* INFORMACOES DA NATUREZA DE OPERACAO */
  SELECT
    ESTOQUE,
    ICMS,
    IPI
  FROM
    NATUOPER
  WHERE
    CODIGO = :CODNATUOPER
  INTO
    :ESTOQUE,
    :TMP_ICMS,
    :TMP_IPI;

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

  /* NAO POSSUI MOVIMENTACAO DE ESTOQUE */
  IF ((PS = 'P') AND (ESTOQUE = 'N')) THEN
   BEGIN

     /* CODIGO DO PRODUTO */
     SELECT
       PO.CODIGO
     FROM
       PRODUTOS PO
     WHERE
       PO.BARRA = :BARRA
     INTO
       :XCODPRODUTO;

     IF (XCODPRODUTO IS NULL) THEN
       EXCEPTION INDIVIDUO_ESTOQUE;

     /* CODIGO DA ULTIMA COMPRA */
     SELECT
       MAX(TM.CODIGO)
     FROM
       TEMPITENS TM
       JOIN MOVIMENTOS MO ON
         (MO.CODIGO = TM.CODMOVIMENTO)
     WHERE
       TM.CODPRODUTO = :XCODPRODUTO AND
       MO.ES         = 1            AND
       MO.TIPO       = 1
     INTO
       :CODCOMPRA;

     IF (CODCOMPRA IS NULL) THEN
       EXCEPTION MOV_PREVIA;

     SELECT
       CODMOVIMENTO,
       ICMSCOMPRA,
       CAST((VALOR_TOTAL / QUANTIDADE) AS NUMERIC(9, 2))
     FROM
       TEMPITENS
     WHERE
       CODIGO = :CODCOMPRA
     INTO
       :XCODMOVENTRADA,
       :XICMSVENDA,
       :XPRECOCUSTO;

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
         :CODCOMPRA,
         :XCODPRODUTO,
         :XCODMOVENTRADA,
         :CODMOVSAIDA,
         '0000',
         '',
         'S',
         :VALOR,
         :XICMSVENDA,
         :DESCONTO,
         'N',
         :BARRA,
         :QUANTIDADE,
         0,
         'N',
         'S',
         :CODEMPRESA,
         :XPRECOCUSTO);

   END ELSE

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
                COMISSAO = 0.0;

              IF (COMISSAO IS NULL) THEN
                COMISSAO = 0.0;

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

DROP TRIGGER INDIVIDUAIS_AU0;

SET TERM ^ ;

ALTER PROCEDURE ITVENDA_CANCELA (
    BARRA CHAR(14),
    CODMOVSAIDA INTEGER)
AS
DECLARE VARIABLE ESTOQUE CHAR(1);
BEGIN

  UPDATE
    INDIVIDUAIS
  SET
    VENDIDO = 'N'
  WHERE
    BARRA = :BARRA AND
    CODMOVSAIDA = :CODMOVSAIDA;

  /* verifico se o movimento nao tem mov. estoque */
  SELECT
    NA.ESTOQUE
  FROM
    NATUOPER NA
    JOIN MOVIMENTOS MO ON
      (MO.NOTA_CODNATUOPER = NA.CODIGO)
  WHERE
    MO.CODIGO = :CODMOVSAIDA
  INTO
    :ESTOQUE;

  IF (ESTOQUE = 'N') THEN
    DELETE FROM
      INDIVIDUAIS
    WHERE
      BARRA = :BARRA AND
      CODMOVSAIDA = :CODMOVSAIDA;
END

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE ESTORNO (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE ESTOQUE CHAR(1);
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
DECLARE VARIABLE CODCENTRO INTEGER;
DECLARE VARIABLE CODCLIENTE INTEGER;
BEGIN

  /* MARCO COMO CANCELADO */
  UPDATE
    MOVIMENTOS
  SET
    TIPO = 9,
    USUARIOESTORNO = USER,
    DATAESTORNO = CURRENT_TIMESTAMP
  WHERE
    CODIGO = :CODMOVIMENTO;

  /* DEVOLVO OS PRODUTOS */
  UPDATE
    INDIVIDUAIS
  SET
    VENDIDO = 'N'
  WHERE
    CODMOVSAIDA = :CODMOVIMENTO;

  /* SE NAO POSSUIR MOV. ESTOQUE APAGO OS ITENS */
  SELECT
    NA.ESTOQUE
  FROM
    NATUOPER NA
    JOIN MOVIMENTOS MO ON
      (MO.NOTA_CODNATUOPER = NA.CODIGO)
  WHERE
    MO.CODIGO = :CODMOVIMENTO
  INTO
    :ESTOQUE;

  IF (ESTOQUE = 'N') THEN
    DELETE FROM
      INDIVIDUAIS
    WHERE
      CODMOVSAIDA = :CODMOVIMENTO;

  /* VERIFICO OS PAGAMENTOS E ESTORNO 1 A 1 */
  FOR
  SELECT
    ES,
    NUMERO,
    CODDOCUMENTO,
    INFODOC,
    CODCONTA,
    TOTAL_PAGO,
    DATAVENCIMENTO,
    CODCENTRO,
    CODCLIENTE
  FROM
    PAGAMENTOS
  WHERE
    CODMOVIMENTO = :CODMOVIMENTO AND
    PAGO = 1
  INTO
    :ES,
    :NUMERO,
    :CODDOCUMENTO,
    :INFODOC,
    :CODCONTA,
    :TOTAL_PAGO,
    :DATAVENCIMENTO,
    :CODCENTRO,
    :CODCLIENTE
  DO
  BEGIN

    /* PEGO O NOME DO CLIENTE */
    IF (ES = 1) THEN
     BEGIN

       SELECT
         FO.NOME
       FROM
         MOVIMENTOS MO
         JOIN CLIENTES FO ON
           (FO.CODIGO = MO.CODCLIENTE)
       WHERE
         MO.CODIGO = :CODMOVIMENTO
       INTO
         :NOME;

     END ELSE
     BEGIN

       SELECT
         CL.NOME
       FROM
         MOVIMENTOS MO
         JOIN CLIENTES CL ON
           (CL.CODIGO = MO.CODCLIENTE)
       WHERE
         MO.CODIGO = :CODMOVIMENTO
       INTO
         :NOME;

     END

    /* MONTO A DESCRICAO */
    IF (ES = 1) THEN
      DESCRICAO = 'ESTORNO PARC ' || NUMERO || ' DA COMPRA ' || CODMOVIMENTO || ' ' || UDF_LEFT(NOME, 8);
    ELSE
      DESCRICAO = 'ESTORNO PARC ' || NUMERO || ' DA VENDA ' || CODMOVIMENTO || ' ' || UDF_LEFT(NOME, 8);

    /* INVERTO A CONDICAO PAGAR/RECEBER */
    IF (ES = 1) THEN
      ES = 2;
    ELSE ES = 1;

    /* RETIRO AS HORAS */
    DATAVENCIMENTO = CAST(DATAVENCIMENTO AS DATE);

    /* PEGO O CODIGO DO LANCAMENTO */
    SELECT
      SEQUENCIA
    FROM
      SEQ_OBTER('PAGAMENTOS')
    INTO
      :CODIGO;

    /* GRAVO O ESTORNO DA PARCELA */
    INSERT INTO
      PAGAMENTOS (
        CODIGO,
        CODMOVIMENTO,
        NUMERO,
        DESCRICAO,
        ES,
        DATACADAST,
        VALOR,
        EXTERNO,
        PAGO,
        DESCONTO,
        MULTA_JUROS,
        DATAVENCIMENTO,
        SALDOANT,
        SALDOATU,
        CODCONTA,
        CODDOCUMENTO,
        INFODOC,
        CODCENTRO,
        CODCLIENTE)
      VALUES (
        :CODIGO,
        :CODMOVIMENTO,
        :NUMERO,
        :DESCRICAO,
        :ES,
        'NOW',
        :TOTAL_PAGO,
        'S',
        0,
        0,
        0,
        'NOW',
        0,
        0,
        :CODCONTA,
        :CODDOCUMENTO,
        :INFODOC,
        :CODCENTRO,
        :CODCLIENTE);
  END
END

^

SET TERM ; ^

SET TERM ^ ;

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
DECLARE VARIABLE CODCENTRO INTEGER;
DECLARE VARIABLE XES INTEGER;
DECLARE VARIABLE VENDA CHAR(1);
BEGIN

   /* DADOS DO MOVIMENTO */
   SELECT
      NOTA_VALOR_TOTAL,
      CONDICAO,
      ES,
      CURRENT_DATE,
      TIPO,
      CODCLIENTE,
      CODEMPRESA,
      CODCENTRO
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
      :CODEMPRESA,
      :CODCENTRO;

   /* TEM FATURAMENTO? */
   SELECT
     NA.VENDA
   FROM
     NATUOPER NA
     JOIN MOVIMENTOS MO ON
       (MO.NOTA_CODNATUOPER = NA.CODIGO)
   WHERE
     MO.CODIGO = :CODIGO
   INTO
     :VENDA;

   IF (VENDA = 'N') THEN
     EXIT;

   /* DADOS DO PERFIL DA EMPRESA */
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
   /* SE FOR ENTRADA */
   IF (ES = 1) THEN
    BEGIN
     CODCONTA = CODCONTA_COMPRADEB;
     SELECT
       UDF_LEFT(NOME, 16)
     FROM
       CLIENTES
     WHERE
       CODIGO = :CODCLIENTE
     INTO
       :NOME;
    END ELSE
    /* SE FOR UMA SAIDA */
    BEGIN
     CODCONTA = CODCONTA_VENDACRE;
     SELECT
       UDF_LEFT(NOME, 16)
     FROM
       CLIENTES
     WHERE
       CODIGO = :CODCLIENTE
     INTO
       :NOME;
   END
   /* SE O VALOR FOR ZERO NAO GERO NADA */
   IF (TOTAL <= 0) THEN EXIT;
   /* QUANTIDADE DE PARCELAS */
   SELECT
      COUNT(*)
   FROM
      PARCELAS(
        :CONDICAO
      )
   INTO
      :QUANTIDADE;
   /* SE TIVER PELO MENOS 1 PARCELA, GERO */
   IF (QUANTIDADE > 0) THEN
    BEGIN
      /* APAGO AS PARCELAS ANTIGAS */
      DELETE FROM
        PAGAMENTOS
      WHERE
        CODMOVIMENTO = :CODIGO;
      /* VALOR DA PARCELA */
      PARCELA = CAST((TOTAL / QUANTIDADE) AS INTEGER);
      /* GERACAO DAS PARCELAS */
      N = 0;
      FOR
      SELECT
        DIAS
      FROM
        PARCELAS(:CONDICAO)
      INTO
        :DIAS
      DO
      BEGIN
        /* NUMERO DA PARCELA */
        N = N + 1;
        /* DESCRICAO DA PARCELA */
        IF (ES = 1) THEN
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' COMPRA ' || CODIGO || ' ' || NOME;
        ELSE
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' VENDA ' || CODIGO || ' ' || NOME;
        /* CODIGO SEQUENCIAL */
        SELECT
          SEQUENCIA
        FROM
          SEQ_OBTER('PAGAMENTOS')
        INTO
          :CODPAG;
        /* PARCELA A VISTA X PARCELA A PRAZO */
        IF (DIAS = 0) THEN
         BEGIN
           CODDOC = DOCVISTA;
           CODPAGO = 0;
         END ELSE
         BEGIN
           CODDOC = DOCPRAZO;
           CODPAGO = 0;
         END
        /* ESCONDO OS PAGAMENTOS DE OS E VENDA ABERTAS */
        XES = ES;
        IF ((XES = 2) AND (TIPO IN (3, 5))) THEN
          XES = 0;
        /* INSIRO A PARCELA */
        INSERT INTO
          PAGAMENTOS (
            CODIGO,
            CODMOVIMENTO,
            NUMERO,
            DESCRICAO,
            ES,
            VALOR,
            DATAVENCIMENTO,
            CODDOCUMENTO,
            PAGO,
            CODCONTA,
            CODEMPRESA,
            CODCENTRO,
            CODCLIENTE)
          VALUES (
            :CODPAG,
            :CODIGO,
            :N,
            :DESCRICAO,
            :XES,
            :PARCELA,
            :DATAMOV + :DIAS,
            :CODDOC,
            :CODPAGO,
            :CODCONTA,
            :CODEMPRESA,
            :CODCENTRO,
            :CODCLIENTE);
      END
      /* DIFERENÇA NA PRIMEIRA PARCELA */
      UPDATE
        PAGAMENTOS
      SET
        VALOR = VALOR + (:TOTAL - (:PARCELA * :QUANTIDADE))
      WHERE
        CODMOVIMENTO = :CODIGO AND NUMERO = 1;
    END ELSE EXCEPTION CONDICAO_ERRADA;
END

^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER MOVIMENTOS_AFTINS
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
    IF (NEW.VALOR_TOTAL > 0) THEN
      EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
END
^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER MOVIMENTOS_AFTUPD
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
   BEGIN
     IF (((NEW.VALOR_TOTAL <> OLD.VALOR_TOTAL) OR
        (NEW.CONDICAO <> OLD.CONDICAO)) AND
        (NEW.TIPO IN (1, 2, 5))) THEN
           EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
     IF ((NEW.TIPO IN (3, 6)) AND (OLD.TIPO IN (2, 5))) THEN
           EXECUTE PROCEDURE AUTOBAIXA(NEW.CODIGO);
   END
  IF ((NEW.TIPO = 9) OR (NEW.VALOR_TOTAL = 0)) THEN
     DELETE FROM PAGAMENTOS WHERE CODMOVIMENTO = NEW.CODIGO AND
       PAGO = 0;
END
^

SET TERM ; ^

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
DECLARE VARIABLE ESTOQUE CHAR(1);
DECLARE VARIABLE TMP_ICMS CHAR(1);
DECLARE VARIABLE TMP_IPI CHAR(1);
DECLARE VARIABLE CODNATUOPER VARCHAR(5);
DECLARE VARIABLE CODCOMPRA INTEGER;
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
    ECF,
    NOTA_CODNATUOPER
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA,
    :ECF,
    :CODNATUOPER;

  /* INFORMACOES DA NATUREZA DE OPERACAO */
  SELECT
    ESTOQUE,
    ICMS,
    IPI
  FROM
    NATUOPER
  WHERE
    CODIGO = :CODNATUOPER
  INTO
    :ESTOQUE,
    :TMP_ICMS,
    :TMP_IPI;

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

  /* NAO POSSUI MOVIMENTACAO DE ESTOQUE */
  IF ((PS = 'P') AND (ESTOQUE = 'N')) THEN
   BEGIN

     /* CODIGO DO PRODUTO */
     SELECT
       PO.CODIGO
     FROM
       PRODUTOS PO
     WHERE
       PO.BARRA = :BARRA
     INTO
       :XCODPRODUTO;

     IF (XCODPRODUTO IS NULL) THEN
       EXCEPTION INDIVIDUO_ESTOQUE;

     /* CODIGO DA ULTIMA COMPRA */
     SELECT
       MAX(TM.CODIGO)
     FROM
       TEMPITENS TM
       JOIN MOVIMENTOS MO ON
         (MO.CODIGO = TM.CODMOVIMENTO)
     WHERE
       TM.CODPRODUTO = :XCODPRODUTO AND
       MO.ES         = 1            AND
       MO.TIPO       = 1
     INTO
       :CODCOMPRA;

     IF (CODCOMPRA IS NULL) THEN
       EXCEPTION MOV_PREVIA;

     SELECT
       CODMOVIMENTO,
       ICMSCOMPRA,
       CAST((VALOR_TOTAL / QUANTIDADE) AS NUMERIC(9, 2))
     FROM
       TEMPITENS
     WHERE
       CODIGO = :CODCOMPRA
     INTO
       :XCODMOVENTRADA,
       :XICMSVENDA,
       :XPRECOCUSTO;

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
         :CODCOMPRA,
         :XCODPRODUTO,
         :XCODMOVENTRADA,
         :CODMOVSAIDA,
         '0000',
         '',
         'S',
         :VALOR,
         :XICMSVENDA,
         :DESCONTO,
         'N',
         :BARRA,
         :QUANTIDADE,
         0,
         'N',
         'S',
         :CODEMPRESA,
         :XPRECOCUSTO);

   END ELSE

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
          ID.CODIGO,
          ID.CODITEM,
          ID.CODPRODUTO,
          ID.CODMOVENTRADA,
          ID.SEQUENCIA,
          ID.SERIE,
          ID.VENDIDO,
          ID.CODMOVSAIDA,
          ID.VALOR_VENDA,
          ID.ICMSVENDA,
          ID.DESCONTO,
          ID.IMPETIQ,
          ID.BARRA,
          ID.QUANTIDADE,
          ID.UNICO,
          ID.CUSTO_PRODUTO,
          ID.CUSTO_IPI,
          ID.CUSTO_RATEIO,
          ID.CUSTO_ICMS,
          ID.CUSTO_ISS
        FROM
          INDIVIDUAIS ID
          LEFT JOIN MOVIMENTOS MO ON
            (MO.CODIGO = ID.CODMOVENTRADA)
        WHERE
          ID.BARRA = :BARRA AND
          ID.VENDIDO = 'N' AND
          ID.CODEMPRESA = :CODEMPRESA
        ORDER BY
          MO.DATA
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
                COMISSAO = 0.0;

              IF (COMISSAO IS NULL) THEN
                COMISSAO = 0.0;

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

SET TERM ^ ;

ALTER TRIGGER INDIVIDUAIS_BU0
ACTIVE BEFORE UPDATE POSITION 0
AS
  DECLARE VARIABLE ICMSSIMPLES CHAR(1);
  DECLARE VARIABLE ALIQUOTA_ICMSSIMPLES NUMERIC(9, 4);
  DECLARE VARIABLE ALIQUOTA_ISS NUMERIC(9, 4);
  DECLARE VARIABLE VALOR_ICMSCOMPRA NUMERIC(9, 2);
  DECLARE VARIABLE VALOR_ICMSVENDA NUMERIC(9, 2);
  DECLARE VARIABLE QUANTIDADE NUMERIC(9, 2);
  DECLARE VARIABLE XICMS CHAR(1);
BEGIN

  /* ESTE TRIGGER CALCULA OS IMPOSTOS DE VENDA E VERIFICA A QUANTIDADE */

  /* VERIFICAÇÃO DA QUANTIDADE */
  IF ((NEW.QUANTIDADE IS NULL) OR (NEW.QUANTIDADE = 0)) THEN
    EXCEPTION QUANTIDADE_POSITIVA;

  /* FOI VENDIDO O ITEM? */
  IF ((OLD.VENDIDO = 'N') AND (NEW.VENDIDO = 'S')) THEN
   BEGIN

     /* PRODUTO OU SERVIÇO? */
     IF (NEW.PS = 'P') THEN
      BEGIN

        /* PRODUTO */

        /* DADOS DO ICMS DA EMPRESA */
        SELECT
          ALIQUOTA_ICMSSIMPLES,
          ICMSSIMPLES
        FROM
          SISCONFIG
        WHERE
          CODIGO = NEW.CODEMPRESA
        INTO
          :ALIQUOTA_ICMSSIMPLES,
          :ICMSSIMPLES;

        /* ICMS É SIMPLES OU SUBTRAÇÃO? */
        IF (ICMSSIMPLES = 'S') THEN
         BEGIN

           /* ICMS SIMPLES */
           /* O ICMS É UMA CONSTANTE */
           NEW.ICMSVENDA = ALIQUOTA_ICMSSIMPLES;
           /* SOMENTE APLICAR A ALIQUOTA */
           NEW.CUSTO_ICMS =
             (NEW.VALOR_PAGO / NEW.QUANTIDADE) *
             (ALIQUOTA_ICMSSIMPLES / 100);

         END ELSE
         BEGIN

           /* ICMS DE SUBTRAÇÃO */

           /* RECUPERO O CUSTO DE ICMS DA COMPRA */
           SELECT
             VALOR_ICMSCOMPRA,
             QUANTIDADE
           FROM
             TEMPITENS
           WHERE
             CODIGO = NEW.CODITEM AND
             CODMOVIMENTO = NEW.CODMOVENTRADA AND
             CODPRODUTO = NEW.CODPRODUTO
           INTO
             :VALOR_ICMSCOMPRA,
             :QUANTIDADE;

           /* CALCULO SOMENTE O ITEM COMPRADO */
           IF (VALOR_ICMSCOMPRA IS NULL) THEN
             VALOR_ICMSCOMPRA = 0;
           VALOR_ICMSCOMPRA = (VALOR_ICMSCOMPRA / QUANTIDADE);

           /* CALCULO SOMENTE O ITEM VENDIDO */
           VALOR_ICMSVENDA =
             (NEW.VALOR_ICMS / NEW.QUANTIDADE);

           /* APLICO O RESULTADO DA SUBTRAÇÃO */
           NEW.CUSTO_ICMS =
             (VALOR_ICMSVENDA - VALOR_ICMSCOMPRA);

         END

         /* BLOQUEIO DE ICMS */
         SELECT
           NA.ICMS
         FROM
           NATUOPER NA
           JOIN MOVIMENTOS MO ON
             (MO.NOTA_CODNATUOPER = NA.CODIGO)
         WHERE
           MO.CODIGO = NEW.CODMOVSAIDA
         INTO
           :XICMS;

         IF (XICMS = 'N') THEN
           NEW.ICMSVENDA = 0;


      END ELSE
      BEGIN

        /* SERVIÇO */

        /* RECUPERO A ALIQUOTA DO ISS DA EMPRESA */
        SELECT
          ALIQUOTA_ISS
        FROM
          SISCONFIG
        WHERE
          CODIGO = NEW.CODEMPRESA
        INTO
          :ALIQUOTA_ISS;

        /* APLICO A ALIQUOTA PARA 1 ITEM */
        NEW.CUSTO_ISS =
          (NEW.VALOR_PAGO / NEW.QUANTIDADE) *
          (ALIQUOTA_ISS / 100);

      END

   END /* VENDIDO? */

END

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE REL_NOTAPRO (
    CODMOVIMENTO INTEGER)
RETURNS (
    CODIGO INTEGER,
    BARRA CHAR(13),
    DESCRICAO1 VARCHAR(60),
    DESCRICAO2 VARCHAR(80),
    SERIE VARCHAR(20),
    VALOR_VENDA NUMERIC(9,2),
    ICMS_VENDA NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    QUANTIDADE NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    VALOR_ICMS NUMERIC(9,2),
    SITTRIBU CHAR(3),
    UNIDADE CHAR(2),
    VALOR_ITEM NUMERIC(9,2),
    IPI NUMERIC(9, 4))
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE XIPI CHAR(1);
BEGIN

   /* VERIFICO SE EH COMPRA OU VENDA */
   SELECT
     ES
   FROM
     MOVIMENTOS
   WHERE
     CODIGO = :CODMOVIMENTO
   INTO
     :ES;

   IF (ES = 1) THEN
    BEGIN

      /* COMPRA */
      FOR
      SELECT
        TI.CODPRODUTO,
        PO.BARRA,
        PO.DESCRICAO,
        PO.UNIDADE,
        'N/F',
        TI.VALOR_UNITARIO,
        TI.ICMSCOMPRA,
        TI.DESCONTO,
        TI.SITTRIBU,
        TI.QUANTIDADE,
        TI.VALOR_TOTAL,
        TI.VALOR_ICMSCOMPRA
      FROM
        TEMPITENS TI
        LEFT JOIN PRODUTOS PO ON
          ( PO.CODIGO = TI.CODPRODUTO )
      WHERE
        TI.CODMOVIMENTO = :CODMOVIMENTO
      INTO
        :CODIGO,
        :BARRA,
        :DESCRICAO1,
        :UNIDADE,
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
        IF (SERIE <> 'N/F') THEN
           DESCRICAO2 = UDF_TRIM(DESCRICAO1) || ' ' || SERIE;
        ELSE
           DESCRICAO2 = DESCRICAO1;
        VALOR_ITEM = VALOR_VENDA - DESCONTO;
        SUSPEND;
      END

    END ELSE
    BEGIN

      /* VENDA */
      FOR
      SELECT
        ID.CODPRODUTO,
        ID.BARRA,
        PO.DESCRICAO,
        PO.UNIDADE,
        ID.SERIE,
        ID.VALOR_VENDA,
        ID.ICMSVENDA,
        ID.DESCONTO,
        TI.SITTRIBU,
        TI.IPI,
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
        PO.UNIDADE,
        ID.SERIE,
        ID.VALOR_VENDA,
        ID.ICMSVENDA,
        ID.DESCONTO,
        TI.SITTRIBU,
        TI.IPI
      INTO
        :CODIGO,
        :BARRA,
        :DESCRICAO1,
        :UNIDADE,
        :SERIE,
        :VALOR_VENDA,
        :ICMS_VENDA,
        :DESCONTO,
        :SITTRIBU,
        :IPI,
        :QUANTIDADE,
        :VALOR_PAGO,
        :VALOR_ICMS
      DO
      BEGIN
        IF (SERIE <> 'N/F') THEN
           DESCRICAO2 = UDF_TRIM(DESCRICAO1) || ' ' || SERIE;
        ELSE
           DESCRICAO2 = DESCRICAO1;
        VALOR_ITEM = VALOR_VENDA - DESCONTO;

        /* VERIFICO SE CORTO IPI */
        SELECT
          NA.IPI
        FROM
          NATUOPER NA
          JOIN MOVIMENTOS MO ON
            (MO.NOTA_CODNATUOPER = NA.CODIGO)
        WHERE
          MO.CODIGO = :CODMOVIMENTO
        INTO
          :XIPI;

        IF (XIPI = 'N') THEN
          IPI = NULL;

        SUSPEND;
      END

   END

END

^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER STATUS_UPDATE
ACTIVE BEFORE UPDATE POSITION 0
AS
DECLARE VARIABLE PRIMEIRO TIMESTAMP;
DECLARE VARIABLE ULTIMO TIMESTAMP;
DECLARE VARIABLE TOTAL DOUBLE PRECISION;
BEGIN
   IF (NEW.TIPO = 0) THEN NEW.STATUS = 'ORÇAMENTO';
   IF (NEW.TIPO = 1) THEN NEW.STATUS = 'COMPRA';
   IF (NEW.TIPO = 2) THEN NEW.STATUS = 'OS ABERTA';
   IF (NEW.TIPO = 3) THEN NEW.STATUS = 'OS FECHADA';
   IF (NEW.TIPO = 4) THEN NEW.STATUS = 'PRE ASSITENCIA';
   IF (NEW.TIPO = 5) THEN NEW.STATUS = 'VENDA ABERTA';
   IF (NEW.TIPO = 6) THEN NEW.STATUS = 'VENDA FECHADA';
   IF (NEW.TIPO = 7) THEN NEW.STATUS = 'N/F';
   IF (NEW.TIPO = 8) THEN NEW.STATUS = 'REMESSA';
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'ESTORNO';

   /* calcular impostos */
/*   IF ((OLD.NOTA_NUMERO IS NULL)     AND
       (NEW.NOTA_NUMERO IS NOT NULL) AND
       (NEW.ES = 2)                  AND
       (NEW.TIPO IN (3, 6)))         THEN
    BEGIN
*/      /* TOTAL ICMS */
/*      EXECUTE PROCEDURE CALC_ICMS(NEW.CODIGO)
        RETURNING_VALUES NEW.VALOR_ICMS;
    END
*/
   /* FECHOU A VENDA */
   IF ((OLD.TIPO IN (2, 5)) AND (NEW.TIPO IN (3, 6))) THEN
    BEGIN

      /* USUÁRIO, DATA E HORA DO FECHAMENTO */
      NEW.DATAFECHAMENTO = 'NOW';
      NEW.USUARIOFECHAMENTO = USER;

      /* TOTAL DA COMISSAO */
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

      /* TEMPOS DE ATENDIMENTO, SE FOR OS */
      IF (NEW.TIPO = 3) THEN
       BEGIN

         SELECT
           MIN(DATAINI),
           MAX(DATAFIM),
           SUM(THORAS)
         FROM
           OS_VENDER
         WHERE
           CODMOVIMENTO = NEW.CODIGO
         INTO
           :PRIMEIRO,
           :ULTIMO,
           :TOTAL;

         NEW.TEMPO_CHEGADA    = CAST(
           UDF_MINUTESBETWEEN(NEW.DATA, PRIMEIRO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_CONCLUSAO  = CAST(
           UDF_MINUTESBETWEEN(NEW.DATA, ULTIMO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_LANCAMENTO = CAST(
           UDF_MINUTESBETWEEN(ULTIMO, NEW.DATAFECHAMENTO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_TECNICOS = TOTAL;

         NEW.DATAINICIO  = PRIMEIRO;

         NEW.DATATERMINO = ULTIMO;

         IF (PRIMEIRO > NEW.DATAPREVISAO) THEN
           NEW.TEMPO_FORADOPRAZO = CAST(
             UDF_MINUTESBETWEEN(NEW.DATAPREVISAO, PRIMEIRO)
             AS DOUBLE PRECISION) / 60;
         ELSE
           NEW.TEMPO_FORADOPRAZO = 0;

       END

      NEW.TEMPO_CICLO = CAST(
        UDF_MINUTESBETWEEN(NEW.DATA, NEW.DATAFECHAMENTO)
        AS DOUBLE PRECISION) / 60;

    END

   /* RATEIO DOS CUSTOS DE COMPRA */
   IF ((NEW.ES = 1) AND (NEW.TIPO = 1)) THEN
     EXECUTE PROCEDURE RATEIO_CUSTOS (
       NEW.CODIGO,
       NEW.VALOR_PRODUTOS,
       NEW.VALOR_RATEIO_CUSTO);

END

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE CALC_ICMS (
    CODMOVIMENTO INTEGER)
RETURNS (
    VALOR_ICMS NUMERIC(9,2),
    VALOR_IPI NUMERIC(9,2))
AS
DECLARE VARIABLE VALOR_PAGO NUMERIC(9,2);
DECLARE VARIABLE IPI NUMERIC(9,2);
begin
  SELECT
    SUM(ID.VALOR_ICMS),
    SUM(ID.VALOR_PAGO),
    MAX(IT.IPI)
  FROM
    INDIVIDUAIS ID
    JOIN TEMPITENS IT ON
      (IT.CODIGO = ID.CODITEM)
  WHERE
    CODMOVSAIDA = :CODMOVIMENTO AND
    VENDIDO = 'S'
  INTO
    :VALOR_ICMS,
    :VALOR_PAGO,
    :IPI;

  VALOR_IPI = VALOR_PAGO * (IPI / 100);

  IF (VALOR_IPI IS NULL) THEN
    VALOR_IPI = 0;

  IF (VALOR_ICMS IS NULL) THEN
    VALOR_ICMS = 0;

  SUSPEND;
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE CALC_ICMS (
    CODMOVIMENTO INTEGER)
RETURNS (
    VALOR_ICMS NUMERIC(9,2),
    VALOR_IPI NUMERIC(9,2))
AS
DECLARE VARIABLE VALOR_PAGO NUMERIC(9,2);
DECLARE VARIABLE IPI NUMERIC(9,2);
DECLARE VARIABLE XIPI CHAR(1);
begin
  SELECT
    SUM(ID.VALOR_ICMS),
    SUM(ID.VALOR_PAGO),
    MAX(IT.IPI)
  FROM
    INDIVIDUAIS ID
    JOIN TEMPITENS IT ON
      (IT.CODIGO = ID.CODITEM)
  WHERE
    CODMOVSAIDA = :CODMOVIMENTO AND
    VENDIDO = 'S'
  INTO
    :VALOR_ICMS,
    :VALOR_PAGO,
    :IPI;

  VALOR_IPI = VALOR_PAGO * (IPI / 100);

  /* VERIFICO IPI */
  SELECT
    NA.IPI
  FROM
    NATUOPER NA
    JOIN MOVIMENTOS MO ON
      (MO.NOTA_CODNATUOPER = NA.CODIGO)
  WHERE
    MO.CODIGO = :CODMOVIMENTO
  INTO
    :XIPI;

  IF (XIPI IS NULL) THEN
    XIPI = 'N';

  IF ((VALOR_IPI IS NULL) OR (XIPI = 'N')) THEN
    VALOR_IPI = 0;

  IF (VALOR_ICMS IS NULL) THEN
    VALOR_ICMS = 0;

  SUSPEND;
end

^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER STATUS_UPDATE
ACTIVE BEFORE UPDATE POSITION 0
AS
DECLARE VARIABLE PRIMEIRO TIMESTAMP;
DECLARE VARIABLE ULTIMO TIMESTAMP;
DECLARE VARIABLE TOTAL DOUBLE PRECISION;
BEGIN
   IF (NEW.TIPO = 0) THEN NEW.STATUS = 'ORÇAMENTO';
   IF (NEW.TIPO = 1) THEN NEW.STATUS = 'COMPRA';
   IF (NEW.TIPO = 2) THEN NEW.STATUS = 'OS ABERTA';
   IF (NEW.TIPO = 3) THEN NEW.STATUS = 'OS FECHADA';
   IF (NEW.TIPO = 4) THEN NEW.STATUS = 'PRE ASSITENCIA';
   IF (NEW.TIPO = 5) THEN NEW.STATUS = 'VENDA ABERTA';
   IF (NEW.TIPO = 6) THEN NEW.STATUS = 'VENDA FECHADA';
   IF (NEW.TIPO = 7) THEN NEW.STATUS = 'N/F';
   IF (NEW.TIPO = 8) THEN NEW.STATUS = 'REMESSA';
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'ESTORNO';

   /* calcular impostos */
   IF ((OLD.NOTA_NUMERO IS NULL)     AND
       (NEW.NOTA_NUMERO IS NOT NULL) AND
       (NEW.ES = 2)                  AND
       (NEW.TIPO IN (3, 6)))         THEN
    BEGIN
      /* TOTAL ICMS */
      EXECUTE PROCEDURE CALC_ICMS(NEW.CODIGO)
        RETURNING_VALUES NEW.VALOR_ICMS, NEW.VALOR_IPI_PRODUTOS;
    END

   /* FECHOU A VENDA */
   IF ((OLD.TIPO IN (2, 5)) AND (NEW.TIPO IN (3, 6))) THEN
    BEGIN

      /* USUÁRIO, DATA E HORA DO FECHAMENTO */
      NEW.DATAFECHAMENTO = 'NOW';
      NEW.USUARIOFECHAMENTO = USER;

      /* TOTAL DA COMISSAO */
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

      /* TEMPOS DE ATENDIMENTO, SE FOR OS */
      IF (NEW.TIPO = 3) THEN
       BEGIN

         SELECT
           MIN(DATAINI),
           MAX(DATAFIM),
           SUM(THORAS)
         FROM
           OS_VENDER
         WHERE
           CODMOVIMENTO = NEW.CODIGO
         INTO
           :PRIMEIRO,
           :ULTIMO,
           :TOTAL;

         NEW.TEMPO_CHEGADA    = CAST(
           UDF_MINUTESBETWEEN(NEW.DATA, PRIMEIRO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_CONCLUSAO  = CAST(
           UDF_MINUTESBETWEEN(NEW.DATA, ULTIMO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_LANCAMENTO = CAST(
           UDF_MINUTESBETWEEN(ULTIMO, NEW.DATAFECHAMENTO)
           AS DOUBLE PRECISION) / 60;

         NEW.TEMPO_TECNICOS = TOTAL;

         NEW.DATAINICIO  = PRIMEIRO;

         NEW.DATATERMINO = ULTIMO;

         IF (PRIMEIRO > NEW.DATAPREVISAO) THEN
           NEW.TEMPO_FORADOPRAZO = CAST(
             UDF_MINUTESBETWEEN(NEW.DATAPREVISAO, PRIMEIRO)
             AS DOUBLE PRECISION) / 60;
         ELSE
           NEW.TEMPO_FORADOPRAZO = 0;

       END

      NEW.TEMPO_CICLO = CAST(
        UDF_MINUTESBETWEEN(NEW.DATA, NEW.DATAFECHAMENTO)
        AS DOUBLE PRECISION) / 60;

    END

   /* RATEIO DOS CUSTOS DE COMPRA */
   IF ((NEW.ES = 1) AND (NEW.TIPO = 1)) THEN
     EXECUTE PROCEDURE RATEIO_CUSTOS (
       NEW.CODIGO,
       NEW.VALOR_PRODUTOS,
       NEW.VALOR_RATEIO_CUSTO);

END

^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (176, CURRENT_TIMESTAMP);
COMMIT;