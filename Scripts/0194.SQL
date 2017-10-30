/*
** CALCULO CORRETO DO ESTOQUE ATUAL
*/

DROP TRIGGER INDIVIDUAIS_AI1000;

DROP TRIGGER INDIVIDUAIS_AU1000;

DROP TRIGGER INDIVIDUAIS_AD0;

DROP PROCEDURE TRANSFERENCIA;

alter table "MOVESTOQUE" drop "ESTOQUE";

DELETE FROM MOVESTOQUE;

ALTER TABLE MOVESTOQUE ADD ESTOQUE DINHEIRO;

SET TERM ^ ;

CREATE TRIGGER MOVESTOQUE_BI0 FOR MOVESTOQUE
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  /* CALCULO DO ESTOQUE ATUAL */
  NEW.ESTOQUE = NEW.ESTOQUE_ANTERIOR + NEW.QUANTIDADE;
end

^

SET TERM ; ^

SET TERM ^ ;

CREATE PROCEDURE TRANSFERENCIA (
    BARRA CHAR(14),
    QUANTIDADE NUMERIC(9,2),
    ICMS NUMERIC(9,4),
    CODEMPRESA1 INTEGER,
    CODEMPRESA2 INTEGER)
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
DECLARE VARIABLE DESCRICAO VARCHAR(60);
DECLARE VARIABLE ESTOQUE NUMERIC(9,2);
BEGIN
  /* BUSCO O CÓDIGO DO PRODUTO E VEJO SE EH PRODUTO */
  SELECT
    CODIGO,
    DESCRICAO,
    PS
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :DESCRICAO,
    :PS;
  /* SE FOR PRODUTO MESMO */
  IF ((PS = 'P') OR (PS IS NULL)) THEN
   BEGIN
    /* QUAL É A QUANTIDADE DISPONÍVEL? */
    SELECT
      SUM(QUANTIDADE)
    FROM
      INDIVIDUAIS
    WHERE
      BARRA = :BARRA AND
      VENDIDO = 'N'  AND
      CODEMPRESA = :CODEMPRESA1
    INTO
      :XQUANTIDADE;
    /* SE A QUANTIDADE PERMITIR A TRANSFERENCIA */
    IF (QUANTIDADE <= XQUANTIDADE) THEN
      BEGIN

        /* GRAVO A TRANSFERENCIA */
        INSERT INTO
          TRANSFERENCIAS (
            DATA,
            CODBARRA,
            DESCRICAO,
            QUANTIDADE,
            CODEMPRESA1,
            CODEMPRESA2,
            USUARIO,
            ICMS)
          VALUES (
            CURRENT_TIMESTAMP,
            :BARRA,
            :DESCRICAO,
            CAST(:QUANTIDADE AS INTEGER),
            :CODEMPRESA1,
            :CODEMPRESA2,
            USER,
            :ICMS);

        /* VERIFICO ITEM A ITEM O QUE DEVE SER TRANSFERIDO */
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
          CODEMPRESA = :CODEMPRESA1
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

          /* TENHO O QUE TRANSFERIR? */
          IF (QUANTIDADE > 0) THEN
            BEGIN

              /* ZERO A SOBRA */
              SOBRA = 0;

              /* SE PRECISO MAIS DO QUE ESSE ITEM - LEVO ESSE INTEIRO */
              IF (QUANTIDADE >= XQUANTIDADE) THEN
                BEGIN
                  BAIXA = XQUANTIDADE;
                END ELSE
                BEGIN
                  /* SE NÃO, SOMENTE O SOLICITADO */
                  BAIXA = QUANTIDADE;
                  SOBRA = XQUANTIDADE - BAIXA;
                END

              /* DEFINO A QUANTIDADE */
              QUANTIDADE = QUANTIDADE - BAIXA;

              /* ATUALIZO A QUANTIDADE E FAÇO A TRANSFERENCIA */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODEMPRESA = :CODEMPRESA2,
                ICMSVENDA  = :ICMS
              WHERE
                CODIGO = :XCODIGO;

              /* SE  EXISTE SOBRA, GRAVO O REGISTRO */
              IF (SOBRA > 0) THEN
                BEGIN

                  /* OBTENHO A SEQUENCIA */
                  EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
                    RETURNING_VALUES NSEQ;

                  XVENDIDO = 'N';

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
                      :ICMS,
                      :XDESCONTO,
                      :XIMPETIQ,
                      :XBARRA,
                      :SOBRA,
                      :XUNICO,
                      'S',
                      :CODEMPRESA1);

                END

              /* ANOTO A TRANSFERENCIA */
              /* LOJA DEBITADA */
              SELECT FIRST 1
                ESTOQUE
              FROM
                MOVESTOQUE
              WHERE
                CODEMPRESA = :CODEMPRESA1 AND
                CODPRODUTO = :XCODPRODUTO
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
                  :XCODPRODUTO,
                  CURRENT_TIMESTAMP,
                  :CODEMPRESA1,
                  (:QUANTIDADE * -1),
                  'TRANSFERENCIA PARA ' || UDF_PADL(:CODEMPRESA2, '0', 4),
                  0,
                  :ESTOQUE);

              /* LOJA CREDITADA */
              SELECT FIRST 1
                ESTOQUE
              FROM
                MOVESTOQUE
              WHERE
                CODEMPRESA = :CODEMPRESA2 AND
                CODPRODUTO = :XCODPRODUTO
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
                  :XCODPRODUTO,
                  CURRENT_TIMESTAMP,
                  :CODEMPRESA2,
                  :QUANTIDADE,
                  'TRANSFERENCIA DE ' || UDF_PADL(:CODEMPRESA1, '0', 4),
                  0,
                  :ESTOQUE);

            END ELSE EXIT;

        END

      END ELSE EXCEPTION ITEM_ESGOTADO;
   END
END

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE TRANSFERENCIA TO PUBLIC;

SET TERM ^ ;

CREATE TRIGGER INDIVIDUAIS_AD1000 FOR INDIVIDUAIS
ACTIVE AFTER DELETE POSITION 1000
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

CREATE TRIGGER INDIVIDUAIS_AI1000 FOR INDIVIDUAIS
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

SET TERM ^ ;

ALTER PROCEDURE TRANSFERENCIA (
    BARRA CHAR(14),
    QUANTIDADE NUMERIC(9,2),
    ICMS NUMERIC(9,4),
    CODEMPRESA1 INTEGER,
    CODEMPRESA2 INTEGER)
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
DECLARE VARIABLE DESCRICAO VARCHAR(60);
DECLARE VARIABLE ESTOQUE NUMERIC(9,2);
DECLARE VARIABLE TQUANT NUMERIC(9, 2);
BEGIN

  TQUANT = QUANTIDADE;

  /* BUSCO O CÓDIGO DO PRODUTO E VEJO SE EH PRODUTO */
  SELECT
    CODIGO,
    DESCRICAO,
    PS
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :DESCRICAO,
    :PS;
  /* SE FOR PRODUTO MESMO */
  IF ((PS = 'P') OR (PS IS NULL)) THEN
   BEGIN
    /* QUAL É A QUANTIDADE DISPONÍVEL? */
    SELECT
      SUM(QUANTIDADE)
    FROM
      INDIVIDUAIS
    WHERE
      BARRA = :BARRA AND
      VENDIDO = 'N'  AND
      CODEMPRESA = :CODEMPRESA1
    INTO
      :XQUANTIDADE;
    /* SE A QUANTIDADE PERMITIR A TRANSFERENCIA */
    IF (QUANTIDADE <= XQUANTIDADE) THEN
      BEGIN

        /* GRAVO A TRANSFERENCIA */
        INSERT INTO
          TRANSFERENCIAS (
            DATA,
            CODBARRA,
            DESCRICAO,
            QUANTIDADE,
            CODEMPRESA1,
            CODEMPRESA2,
            USUARIO,
            ICMS)
          VALUES (
            CURRENT_TIMESTAMP,
            :BARRA,
            :DESCRICAO,
            CAST(:QUANTIDADE AS INTEGER),
            :CODEMPRESA1,
            :CODEMPRESA2,
            USER,
            :ICMS);

        /* VERIFICO ITEM A ITEM O QUE DEVE SER TRANSFERIDO */
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
          CODEMPRESA = :CODEMPRESA1
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

          /* TENHO O QUE TRANSFERIR? */
          IF (QUANTIDADE > 0) THEN
            BEGIN

              /* ZERO A SOBRA */
              SOBRA = 0;

              /* SE PRECISO MAIS DO QUE ESSE ITEM - LEVO ESSE INTEIRO */
              IF (QUANTIDADE >= XQUANTIDADE) THEN
                BEGIN
                  BAIXA = XQUANTIDADE;
                END ELSE
                BEGIN
                  /* SE NÃO, SOMENTE O SOLICITADO */
                  BAIXA = QUANTIDADE;
                  SOBRA = XQUANTIDADE - BAIXA;
                END

              /* DEFINO A QUANTIDADE */
              QUANTIDADE = QUANTIDADE - BAIXA;

              /* ATUALIZO A QUANTIDADE E FAÇO A TRANSFERENCIA */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODEMPRESA = :CODEMPRESA2,
                ICMSVENDA  = :ICMS
              WHERE
                CODIGO = :XCODIGO;

              /* SE  EXISTE SOBRA, GRAVO O REGISTRO */
              IF (SOBRA > 0) THEN
                BEGIN

                  /* OBTENHO A SEQUENCIA */
                  EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
                    RETURNING_VALUES NSEQ;

                  XVENDIDO = 'N';

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
                      :ICMS,
                      :XDESCONTO,
                      :XIMPETIQ,
                      :XBARRA,
                      :SOBRA,
                      :XUNICO,
                      'S',
                      :CODEMPRESA1);

                END

              /* ANOTO A TRANSFERENCIA */
              /* LOJA DEBITADA */
              SELECT FIRST 1
                ESTOQUE
              FROM
                MOVESTOQUE
              WHERE
                CODEMPRESA = :CODEMPRESA1 AND
                CODPRODUTO = :XCODPRODUTO
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
                  :XCODPRODUTO,
                  CURRENT_TIMESTAMP,
                  :CODEMPRESA1,
                  (:TQUANT * -1),
                  'TRANSFERENCIA PARA ' || UDF_PADL(:CODEMPRESA2, '0', 4),
                  0,
                  :ESTOQUE);

              /* LOJA CREDITADA */
              SELECT FIRST 1
                ESTOQUE
              FROM
                MOVESTOQUE
              WHERE
                CODEMPRESA = :CODEMPRESA2 AND
                CODPRODUTO = :XCODPRODUTO
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
                  :XCODPRODUTO,
                  CURRENT_TIMESTAMP,
                  :CODEMPRESA2,
                  :TQUANT,
                  'TRANSFERENCIA DE ' || UDF_PADL(:CODEMPRESA1, '0', 4),
                  0,
                  :ESTOQUE);

            END ELSE EXIT;

        END

      END ELSE EXCEPTION ITEM_ESGOTADO;
   END
END

^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (194, CURRENT_TIMESTAMP);
COMMIT;