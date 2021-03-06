
ALTER TABLE SISCONFIG ADD BLOQUEIO_DIAS INTEIRO_CHEIO1!

CREATE PROCEDURE HISTORICO (
    CODCLIENTE INTEGER,
    CODEMPRESA INTEGER)
RETURNS (
    NOME VARCHAR (40),
    MOVIMENTOS INTEGER,
    TOTAL_MOVIMENTOS NUMERIC (9, 2),
    TOTAL_PAGO NUMERIC (9, 2),
    TOTAL_ARECEBER NUMERIC (9, 2),
    TOTAL_ATRASO NUMERIC (9, 2),
    DATA_MAISATRASADO TIMESTAMP,
    DIAS_ATRASO INTEGER,
    BLOQUEIO CHAR (1))
AS
    DECLARE VARIABLE DIAS_SISTEMA INTEGER;
BEGIN

  /* NOME */
  SELECT
    NOME
  FROM
    CLIENTES
  WHERE
    CODIGO = :CODCLIENTE
  INTO
    :NOME;

  /* MOVIMENTOS, TOTAL_MOVIMENTOS */
  SELECT
    COUNT(MO.CODIGO),
    SUM(PA.TOTAL_PAGO)
  FROM
    MOVIMENTOS MO
    LEFT JOIN PAGAMENTOS PA ON
      (MO.CODIGO = PA.CODMOVIMENTO)
  WHERE
    MO.CODCLIENTE = :CODCLIENTE AND
    MO.TIPO IN (3, 6)
  INTO
    :MOVIMENTOS,
    :TOTAL_MOVIMENTOS;

  /* TOTAL_PAGO */
  SELECT
    SUM(PA.TOTAL_PAGO)
  FROM
    MOVIMENTOS MO
    LEFT JOIN PAGAMENTOS PA ON
      (MO.CODIGO = PA.CODMOVIMENTO)
  WHERE
    MO.CODCLIENTE = :CODCLIENTE AND
    MO.TIPO IN (3, 6) AND
    PA.PAGO = 1
  INTO
    :TOTAL_PAGO;

  /* TOTAL_ARECEBER */
  SELECT
    SUM(PA.TOTAL_PAGO)
  FROM
    MOVIMENTOS MO
    LEFT JOIN PAGAMENTOS PA ON
      (MO.CODIGO = PA.CODMOVIMENTO)
  WHERE
    MO.CODCLIENTE = :CODCLIENTE AND
    MO.TIPO IN (3, 6) AND
    PA.PAGO = 0 AND
    PA.DATAVENCIMENTO >= CURRENT_TIMESTAMP
  INTO
    :TOTAL_ARECEBER;

  /* TOTAL_ATRASO, DATA_MAISATRASADO, DIAS_ATRASO */
  SELECT
    SUM(PA.TOTAL_PAGO),
    MIN(PA.DATAVENCIMENTO)
  FROM
    MOVIMENTOS MO
    LEFT JOIN PAGAMENTOS PA ON
      (MO.CODIGO = PA.CODMOVIMENTO)
  WHERE
    MO.CODCLIENTE = :CODCLIENTE AND
    MO.TIPO IN (3, 6) AND
    PA.PAGO = 0 AND
    PA.DATAVENCIMENTO < CURRENT_TIMESTAMP
  INTO
    :TOTAL_ATRASO,
    :DATA_MAISATRASADO;
  DIAS_ATRASO = CAST((CURRENT_TIMESTAMP - DATA_MAISATRASADO) AS INTEGER);

  /* BLOQUEIO */
  SELECT
    BLOQUEIO_DIAS
  FROM
    SISCONFIG
  WHERE
    CODIGO = :CODEMPRESA
  INTO
    :DIAS_SISTEMA;
  IF (DIAS_ATRASO >= DIAS_SISTEMA) THEN
     BLOQUEIO = 'S';
  ELSE
     BLOQUEIO = 'N';

  SUSPEND;
END!

GRANT EXECUTE ON PROCEDURE HISTORICO TO PUBLIC!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (58, CURRENT_TIMESTAMP)!