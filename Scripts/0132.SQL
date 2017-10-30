/*
** CALCULO DO ICMS POR ESTIMATIVA
*/

SET TERM !;

ALTER PROCEDURE INFOVENDA (
    BARRA CHAR(14),
    CODEMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    QUANTIDADE INTEGER,
    DESCRICAO VARCHAR(100),
    ICMS NUMERIC(9,2),
    VALOR NUMERIC(9,2),
    CODSERVICO INTEGER)
AS
DECLARE VARIABLE CODPRODUTO INTEGER;
DECLARE VARIABLE UNICO INTEGER;
DECLARE VARIABLE NUMSERIE CHAR(20);
DECLARE VARIABLE PS CHAR(1);
DECLARE VARIABLE ICMSSIMPLES CHAR(1);
DECLARE VARIABLE ALIQUOTA_ICMSSIMPLES NUMERIC(9, 4);
BEGIN

  /* PEGO DADOS INICIAIS */
  SELECT
    CODIGO,
    PS,
    DESCRICAO,
    PRECOVENDA,
    CODSERVICO
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :CODIGO,
    :PS,
    :DESCRICAO,
    :VALOR,
    :CODSERVICO;

  /* SE FOR SERVIÇO */
  if (PS = 'S') then
   begin
     ICMS = 0;
     QUANTIDADE = 9999;
     SUSPEND;
     EXIT;
   end

  /* EXISTE MESMO? */
  SELECT
    COUNT(*)
  FROM
    INDIVIDUAIS
  WHERE
    BARRA = :BARRA AND
    VENDIDO = 'N' AND
    CODEMPRESA = :CODEMPRESA
  INTO
    :CODIGO;

  IF (CODIGO IS NULL) THEN
    CODIGO = 0;

  IF (CODIGO = 0) THEN
     EXCEPTION ITEM_ERRADO;

  /* SE EXISTIR, RETORNO */
  FOR
  SELECT
    INDIVIDUAIS.CODIGO,
    INDIVIDUAIS.CODPRODUTO,
    INDIVIDUAIS.UNICO,
    INDIVIDUAIS.SERIE,
    PRODUTOS.PRECOVENDA,
    PRODUTOS.ICMS,
    PRODUTOS.DESCRICAO
  FROM
    INDIVIDUAIS
    JOIN PRODUTOS ON
      (INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO)
  WHERE
    INDIVIDUAIS.BARRA = :BARRA AND
    INDIVIDUAIS.VENDIDO = 'N' AND
    INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO AND
    INDIVIDUAIS.CODEMPRESA = :CODEMPRESA
  INTO
    :CODIGO,
    :CODPRODUTO,
    :UNICO,
    :NUMSERIE,
    :VALOR,
    :ICMS,
    :DESCRICAO
  DO
  BEGIN

    /* SE FOR INDIVIDUAL, RETORNO SOMENTE ELE */
    IF (UNICO = 1) THEN
     BEGIN

       IF (NUMSERIE IS NOT NULL) THEN
         DESCRICAO = DESCRICAO || ' - ' || NUMSERIE;

       QUANTIDADE = 1;

     END ELSE
     BEGIN

       /* SE FOR NORMAL, SOMO A QUANTIDADE */
       SELECT
         SUM(QUANTIDADE)
       FROM
         INDIVIDUAIS
       WHERE
         BARRA = :BARRA AND
         VENDIDO = 'N'
       INTO
         :QUANTIDADE;

     END

    /* VERIFICO SE O ICMS EH SIMPLES OU NAO */
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

    IF (ICMSSIMPLES = 'S') THEN
      ICMS = CAST(ALIQUOTA_ICMSSIMPLES AS NUMERIC(9, 2));

    SUSPEND;
    EXIT;

  END
END!

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
BEGIN

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
   IF (NEW.TIPO = 9) THEN NEW.STATUS = 'ESTORNO';

   /* TOTAL ICMS */
   SELECT
     VALOR_ICMS
   FROM
     CALC_ICMS(NEW.CODIGO)
   INTO
     NEW.VALOR_ICMS;

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

      /* calcular impostos */
      IF ((NEW.NOTA_NUMERO IS NULL) AND (NEW.ECF = 'N')) THEN
         NEW.VALOR_ICMS = 0;

    END

   /* RATEIO DOS CUSTOS DE COMPRA */
   IF ((NEW.ES = 1) AND (NEW.TIPO = 1)) THEN
     EXECUTE PROCEDURE RATEIO_CUSTOS (
       NEW.CODIGO,
       NEW.VALOR_PRODUTOS,
       NEW.VALOR_RATEIO_CUSTO);

END!


INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (132, CURRENT_TIMESTAMP)!