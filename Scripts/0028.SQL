CREATE PROCEDURE TRANSFERENCIA (
    BARRA CHAR(14) CHARACTER SET NONE,
    QUANTIDADE NUMERIC(9,2),
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
BEGIN

  /* busco o código do produto e vejo se eh produto */
  SELECT
    CODIGO,
    PS
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :PS;

  /* se for produto mesmo */
  IF ((PS = 'P') or (PS IS NULL)) THEN
   BEGIN

    /* qual é a quantidade disponível? */
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

    /* se a quantidade permitir a transferencia */
    IF (QUANTIDADE <= XQUANTIDADE) THEN
      BEGIN

        /* verifico item a item o que deve ser transferido */
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

          /* tenho o que transferir? */
          IF (QUANTIDADE > 0) THEN
            BEGIN

              /* zero a sobra */
              SOBRA = 0;

              /* se preciso mais do que esse item - levo esse inteiro */
              IF (QUANTIDADE >= XQUANTIDADE) THEN
                BEGIN
                  BAIXA = XQUANTIDADE;
                END ELSE
                BEGIN

                  /* se não, somente o solicitado */
                  BAIXA = QUANTIDADE;
                  SOBRA = XQUANTIDADE - BAIXA;
                END

              /* defino a quantidade */
              QUANTIDADE = QUANTIDADE - BAIXA;

              /* atualizo a quantidade e faço a transferencia */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODEMPRESA = :CODEMPRESA2
              WHERE
                CODIGO = :XCODIGO;

              /* se  existe sobra, gravo o registro */
              IF (SOBRA > 0) THEN
                BEGIN

                  /* obtenho a sequencia */
                  EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
                    RETURNING_VALUES NSEQ;

                  XVENDIDO = 'N';
                  INSERT INTO INDIVIDUAIS (CODIGO, CODITEM, CODPRODUTO,
                    CODMOVENTRADA, SEQUENCIA, SERIE, VENDIDO, VALOR_VENDA,
                    ICMSVENDA, DESCONTO, IMPETIQ, BARRA, QUANTIDADE, UNICO,
                    FRACIONADO, CODEMPRESA) VALUES (:NSEQ, :XCODITEM, :XCODPRODUTO,
                    :XCODMOVENTRADA, :XSEQUENCIA, :XSERIE, :XVENDIDO,
                    :XVALOR_VENDA, :XICMSVENDA, :XDESCONTO, :XIMPETIQ,
                    :XBARRA, :SOBRA, :XUNICO, 'S', :CODEMPRESA1);
              END
            END ELSE EXIT;
        END
      END ELSE EXCEPTION ITEM_ESGOTADO;
   END
END!

GRANT EXECUTE ON PROCEDURE TRANSFERENCIA TO PUBLIC!
