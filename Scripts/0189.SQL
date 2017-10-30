/*
** FICHA DE MOVIMENTACAO DE ESTOQUE
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
         'S',
         'P',
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

DELETE FROM MOVESTOQUE;

ALTER TABLE MOVESTOQUE DROP CONSTRAINT MOVESTOQUE_FK03;

alter table "MOVESTOQUE" drop "CODINDIVIDUO";

DROP TRIGGER MOVESTOQUE_BI0;

DROP TRIGGER MOVESTOQUE_BU0;

alter table "MOVESTOQUE" drop "ESTOQUE";

ALTER TABLE MOVESTOQUE ADD CODMOVIMENTO INTEIRO_VALIDO;

ALTER TABLE MOVESTOQUE ADD ESTOQUE_ANTERIOR DINHEIRO;

ALTER TABLE MOVESTOQUE ADD ESTOQUE COMPUTED BY (ESTOQUE_ANTERIOR + QUANTIDADE);

SET TERM ^ ;

CREATE TRIGGER INDIVIDUAIS_AI1000 FOR INDIVIDUAIS
ACTIVE AFTER INSERT POSITION 1000
AS
DECLARE VARIABLE ESTOQUE NUMERIC(9, 2);
begin
  /* Trigger text */
  IF ((NEW.FRACIONADO = 'N') AND (NEW.PS = 'P')) THEN
   BEGIN

     SELECT FIRST 1
       ESTOQUE
     FROM
       MOVESTOQUE
     WHERE
       CODEMPRESA = NEW.CODEMPRESA AND
       CODPRODUTO = NEW.CODPRODUTO
     ORDER BY
       DATA DESC
     INTO
       :ESTOQUE;

     IF (ESTOQUE IS NULL) THEN
       ESTOQUE = 0;

     INSERT INTO
       MOVESTOQUE(
         CODPRODUTO,
         DATA,
         CODEMPRESA,
         QUANTIDADE,
         STATUS,
         CODMOVIMENTO,
         ESTOQUE_ANTERIOR)
       VALUES (
         NEW.CODPRODUTO,
         CURRENT_TIMESTAMP,
         NEW.CODEMPRESA,
         NEW.QUANTIDADE,
         'COMPRA',
         NEW.CODMOVENTRADA,
         :ESTOQUE);

   END
end

^

SET TERM ; ^

SET TERM ^ ;

CREATE TRIGGER INDIVIDUAIS_AU1000 FOR INDIVIDUAIS
ACTIVE AFTER UPDATE POSITION 1000
AS
DECLARE VARIABLE ESTOQUE NUMERIC(9, 2);
begin

  /* VENDA DE PRODUTO */
  IF ((OLD.VENDIDO = 'N') AND (NEW.VENDIDO = 'S') AND (NEW.PS = 'P')) THEN
   BEGIN

     SELECT FIRST 1
       ESTOQUE
     FROM
       MOVESTOQUE
     WHERE
       CODEMPRESA = NEW.CODEMPRESA AND
       CODPRODUTO = NEW.CODPRODUTO
     ORDER BY
       DATA DESC
     INTO
       :ESTOQUE;

     IF (ESTOQUE IS NULL) THEN
       ESTOQUE = 0;

     INSERT INTO
       MOVESTOQUE(
         CODPRODUTO,
         DATA,
         CODEMPRESA,
         QUANTIDADE,
         STATUS,
         CODMOVIMENTO,
         ESTOQUE_ANTERIOR)
       VALUES (
         NEW.CODPRODUTO,
         CURRENT_TIMESTAMP,
         NEW.CODEMPRESA,
         (NEW.QUANTIDADE * -1),
         'VENDA',
         NEW.CODMOVSAIDA,
         :ESTOQUE);

   END

  /* ESTORNO DE PRODUTO */
  IF ((OLD.VENDIDO = 'S') AND (NEW.VENDIDO = 'N') AND (NEW.PS = 'P')) THEN
   BEGIN

     SELECT FIRST 1
       ESTOQUE
     FROM
       MOVESTOQUE
     WHERE
       CODEMPRESA = NEW.CODEMPRESA AND
       CODPRODUTO = NEW.CODPRODUTO
     ORDER BY
       DATA DESC
     INTO
       :ESTOQUE;

     IF (ESTOQUE IS NULL) THEN
       ESTOQUE = 0;

     INSERT INTO
       MOVESTOQUE(
         CODPRODUTO,
         DATA,
         CODEMPRESA,
         QUANTIDADE,
         STATUS,
         CODMOVIMENTO,
         ESTOQUE_ANTERIOR)
       VALUES (
         NEW.CODPRODUTO,
         CURRENT_TIMESTAMP,
         NEW.CODEMPRESA,
         NEW.QUANTIDADE,
         'ESTORNO',
         NEW.CODMOVSAIDA,
         :ESTOQUE);

   END

end

^

SET TERM ; ^

SET TERM ^ ;

CREATE TRIGGER INDIVIDUAIS_AD0 FOR INDIVIDUAIS
ACTIVE AFTER DELETE POSITION 0
AS
DECLARE VARIABLE ESTOQUE NUMERIC(9, 2);
begin

  /* VENDA DE PRODUTO */
  IF ((OLD.VENDIDO = 'N') AND (OLD.PS = 'P')) THEN
   BEGIN

     SELECT FIRST 1
       ESTOQUE
     FROM
       MOVESTOQUE
     WHERE
       CODEMPRESA = OLD.CODEMPRESA AND
       CODPRODUTO = OLD.CODPRODUTO
     ORDER BY
       DATA DESC
     INTO
       :ESTOQUE;

     IF (ESTOQUE IS NULL) THEN
       ESTOQUE = 0;

     INSERT INTO
       MOVESTOQUE(
         CODPRODUTO,
         DATA,
         CODEMPRESA,
         QUANTIDADE,
         STATUS,
         CODMOVIMENTO,
         ESTOQUE_ANTERIOR)
       VALUES (
         OLD.CODPRODUTO,
         CURRENT_TIMESTAMP,
         OLD.CODEMPRESA,
         (OLD.QUANTIDADE * -1),
         'EXCLUSÃO',
         OLD.CODMOVENTRADA,
         :ESTOQUE);

   END

end

^

SET TERM ; ^

alter table MOVESTOQUE
add constraint MOVESTOQUE_FK03
foreign key (CODMOVIMENTO)
references MOVIMENTOS(CODIGO)
on update CASCADE;

ALTER TABLE MOVESTOQUE DROP CONSTRAINT MOVESTOQUE_FK01;

alter table MOVESTOQUE
add constraint MOVESTOQUE_FK01
foreign key (CODPRODUTO)
references PRODUTOS(CODIGO)
on update CASCADE;

SET TERM ^ ;

ALTER TRIGGER INDIVIDUAIS_AI1000
ACTIVE AFTER INSERT POSITION 1000
AS
DECLARE VARIABLE ESTOQUE NUMERIC(9, 2);
begin
  /* Trigger text */
  IF ((NEW.FRACIONADO = 'N') AND (NEW.VENDIDO = 'N') AND (NEW.PS = 'P')) THEN
   BEGIN

     SELECT FIRST 1
       ESTOQUE
     FROM
       MOVESTOQUE
     WHERE
       CODEMPRESA = NEW.CODEMPRESA AND
       CODPRODUTO = NEW.CODPRODUTO
     ORDER BY
       DATA DESC
     INTO
       :ESTOQUE;

     IF (ESTOQUE IS NULL) THEN
       ESTOQUE = 0;

     INSERT INTO
       MOVESTOQUE(
         CODPRODUTO,
         DATA,
         CODEMPRESA,
         QUANTIDADE,
         STATUS,
         CODMOVIMENTO,
         ESTOQUE_ANTERIOR)
       VALUES (
         NEW.CODPRODUTO,
         CURRENT_TIMESTAMP,
         NEW.CODEMPRESA,
         NEW.QUANTIDADE,
         'COMPRA',
         NEW.CODMOVENTRADA,
         :ESTOQUE);

   END
end

^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (189, CURRENT_TIMESTAMP);
COMMIT;