/*
** RECALCULO MANUAL DAS COMISSOES
*/

CREATE PROCEDURE COMISSAO_RECALC (
  DATAINI DATE,
  DATAFIM DATE)
AS
DECLARE VARIABLE CODCLIENTE INTEGER;
DECLARE VARIABLE CLI_COMISSIONADO CHAR(1);
DECLARE VARIABLE PRO_COMISSIONADO CHAR(1);
DECLARE VARIABLE CODPRODUTO INTEGER;
DECLARE VARIABLE CODINDIVIDUAL INTEGER;
DECLARE VARIABLE CODIGO_MOV INTEGER;
DECLARE VARIABLE CODVENDEDOR INTEGER;
DECLARE VARIABLE PARCELAS INTEGER;
DECLARE VARIABLE VALOR_PAGO NUMERIC(9,2);
DECLARE VARIABLE PERC_COMISSAO NUMERIC(9,2);
begin
  PERC_COMISSAO = 0.0;
  VALOR_PAGO    = 0.0;
  
  /* SELECIONAR AS OS's  */
  FOR
  SELECT
    CODIGO,
    CODCLIENTE,
    CODVENDEDOR
  FROM
    MOVIMENTOS
  WHERE
    (TIPO IN (3, 6)) AND
    (DATA BETWEEN :DATAINI AND :DATAFIM)
  ORDER BY
    CODIGO
  INTO
    :CODIGO_MOV,
    :CODCLIENTE,
    :CODVENDEDOR
  DO
  BEGIN
    
    /* verifico se o cliente eh comissionado */
    SELECT
      COMISSIONADO
    FROM
      clientes
    WHERE
      CODIGO = :CODCLIENTE
    INTO
      :CLI_COMISSIONADO;
    

    /* verifico a comissao do vendedor */
    SELECT
      COMISSAO
    FROM
      CLIENTES
    WHERE
      CODIGO = :CODVENDEDOR
    INTO
      :PERC_COMISSAO;

    if (PERC_COMISSAO IS NULL) then PERC_COMISSAO = 0.0;

    FOR
    SELECT
      CODIGO,
      CODPRODUTO,
      VALOR_PAGO
    FROM
      INDIVIDUAIS
    WHERE
      VENDIDO = 'S' AND
      PS = 'P' AND
      CODMOVSAIDA = :CODIGO_MOV
    INTO
      :CODINDIVIDUAL,
      :CODPRODUTO,
      :VALOR_PAGO
    DO
    BEGIN

      /* vejo se o produto eh comissionado */
      SELECT
        COMISSIONADO
      FROM
        PRODUTOS
      WHERE
        CODIGO = :CODPRODUTO
      INTO
        :PRO_COMISSIONADO;

      /* vou comissionar? */
      if ((CLI_COMISSIONADO = 'S') AND (PRO_COMISSIONADO = 'S') AND (PERC_COMISSAO > 0) AND (VALOR_PAGO > 0)) then
         UPDATE
           INDIVIDUAIS
         SET
           VALOR_COMISSAO = CAST(((:VALOR_PAGO * :PERC_COMISSAO) / 100) AS NUMERIC(9,2))
         WHERE
           CODIGO = :CODINDIVIDUAL;
       else
         UPDATE
           INDIVIDUAIS
         SET
           VALOR_COMISSAO = 0.0
         WHERE
           CODIGO = :CODINDIVIDUAL;
    END

    /* pego o total de comissioes */
    SELECT
      SUM(VALOR_COMISSAO)
    FROM
      INDIVIDUAIS
    WHERE
      CODMOVSAIDA = :CODIGO_MOV AND
      VENDIDO = 'S' AND
      PS = 'P'
    INTO
      :VALOR_PAGO;

    if (VALOR_PAGO IS NULL) THEN VALOR_PAGO = 0.0;

    /* atualizo os movimentos */
    UPDATE
      MOVIMENTOS
    SET
      VALOR_COMISSAO = CAST(:VALOR_PAGO AS NUMERIC(9,2))
    WHERE
      CODIGO = :CODIGO_MOV;

    /* pego o numero de parcelas */
    SELECT
      COUNT(CODIGO)
    FROM
      PAGAMENTOS
    WHERE
      CODMOVIMENTO = :CODIGO_MOV
    INTO
      :PARCELAS;
    if (PARCELAS IS NULL) then PARCELAS = 0;

    /* calculo por recebimento */
    if ((VALOR_PAGO > 0) AND (PARCELAS > 0)) then
       VALOR_PAGO = VALOR_PAGO / CAST(PARCELAS AS NUMERIC(9,2));

    /* atualizo os recebimentos */
    UPDATE
      PAGAMENTOS
    SET
      VALOR_COMISSAO = :VALOR_PAGO
    WHERE
      CODMOVIMENTO = :CODIGO_MOV;

  END
end!

DROP TRIGGER INDIVIDUAIS_BEFUPD!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (67, CURRENT_TIMESTAMP)!
