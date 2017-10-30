/*
** ABERTURA E FECHAMENTO DA VENDA ONLINE
*/

SET TERM ^ ;

ALTER PROCEDURE VENDA_ABRE (
    CODMOVIMENTO INTEGER,
    CODEMPRESA INTEGER,
    CODCLIENTE INTEGER,
    CODRESPONSAVEL INTEGER,
    CODVENDEDOR INTEGER,
    CODCONDPAG INTEGER,
    CODNATUOPER VARCHAR(5),
    I01_CODBARRA VARCHAR(14),
    I01_QUANTIDADE NUMERIC(9,2),
    I01_VALOR NUMERIC(9,2),
    I01_DESCONTO NUMERIC(9,2),
    I01_ICMS NUMERIC(9,2),
    I02_CODBARRA VARCHAR(14),
    I02_QUANTIDADE NUMERIC(9,2),
    I02_VALOR NUMERIC(9,2),
    I02_DESCONTO NUMERIC(9,2),
    I02_ICMS NUMERIC(9,2),
    I03_CODBARRA VARCHAR(14),
    I03_QUANTIDADE NUMERIC(9,2),
    I03_VALOR NUMERIC(9,2),
    I03_DESCONTO NUMERIC(9,2),
    I03_ICMS NUMERIC(9,2),
    I04_CODBARRA VARCHAR(14),
    I04_QUANTIDADE NUMERIC(9,2),
    I04_VALOR NUMERIC(9,2),
    I04_DESCONTO NUMERIC(9,2),
    I04_ICMS NUMERIC(9,2),
    I05_CODBARRA VARCHAR(14),
    I05_QUANTIDADE NUMERIC(9,2),
    I05_VALOR NUMERIC(9,2),
    I05_DESCONTO NUMERIC(9,2),
    I05_ICMS NUMERIC(9,2),
    I06_CODBARRA VARCHAR(14),
    I06_QUANTIDADE NUMERIC(9,2),
    I06_VALOR NUMERIC(9,2),
    I06_DESCONTO NUMERIC(9,2),
    I06_ICMS NUMERIC(9,2),
    I07_CODBARRA VARCHAR(14),
    I07_QUANTIDADE NUMERIC(9,2),
    I07_VALOR NUMERIC(9,2),
    I07_DESCONTO NUMERIC(9,2),
    I07_ICMS NUMERIC(9,2),
    I08_CODBARRA VARCHAR(14),
    I08_QUANTIDADE NUMERIC(9,2),
    I08_VALOR NUMERIC(9,2),
    I08_DESCONTO NUMERIC(9,2),
    I08_ICMS NUMERIC(9,2),
    I09_CODBARRA VARCHAR(14),
    I09_QUANTIDADE NUMERIC(9,2),
    I09_VALOR NUMERIC(9,2),
    I09_DESCONTO NUMERIC(9,2),
    I09_ICMS NUMERIC(9,2),
    I10_CODBARRA VARCHAR(14),
    I10_QUANTIDADE NUMERIC(9,2),
    I10_VALOR NUMERIC(9,2),
    I10_DESCONTO NUMERIC(9,2),
    I10_ICMS NUMERIC(9,2),
    I11_CODBARRA VARCHAR(14),
    I11_QUANTIDADE NUMERIC(9,2),
    I11_VALOR NUMERIC(9,2),
    I11_DESCONTO NUMERIC(9,2),
    I11_ICMS NUMERIC(9,2),
    I12_CODBARRA VARCHAR(14),
    I12_QUANTIDADE NUMERIC(9,2),
    I12_VALOR NUMERIC(9,2),
    I12_DESCONTO NUMERIC(9,2),
    I12_ICMS NUMERIC(9,2))
RETURNS (
    RE_MOVIMENTO INTEGER,
    RE_01 INTEGER,
    RE_02 INTEGER,
    RE_03 INTEGER,
    RE_04 INTEGER,
    RE_05 INTEGER,
    RE_06 INTEGER,
    RE_07 INTEGER,
    RE_08 INTEGER,
    RE_09 INTEGER,
    RE_10 INTEGER,
    RE_11 INTEGER,
    RE_12 INTEGER)
AS
DECLARE VARIABLE TESTE INTEGER;
DECLARE VARIABLE CONDICAO VARCHAR(40);
DECLARE VARIABLE TEMP_SERVICOS NUMERIC(9,2);
DECLARE VARIABLE TEMP_PRODUTOS NUMERIC(9,2);
BEGIN

  RE_MOVIMENTO = 0;
  RE_01 = 0;
  RE_02 = 0;
  RE_03 = 0;
  RE_04 = 0;
  RE_05 = 0;
  RE_06 = 0;
  RE_07 = 0;
  RE_08 = 0;
  RE_09 = 0;
  RE_10 = 0;
  RE_11 = 0;
  RE_12 = 0;

  /* ABRO A VENDA */
  IF (CODMOVIMENTO > 0) THEN
   BEGIN

     /* VERIFICO SE A VENDA JÁ EXISTE */
     SELECT
       COUNT(*)
     FROM
       MOVIMENTOS
     WHERE
       CODIGO = :CODMOVIMENTO
     INTO
       :TESTE;

     IF (TESTE IS NULL) THEN
       TESTE = 0;

     /* PEGO A CONDICAO DE PAGAMENTO */
     SELECT
       CONDICAO
     FROM
       CONDPAG
     WHERE
       CODIGO = :CODCONDPAG
     INTO
       CONDICAO;

     /* SE JÁ EXISTIR ATUALIZO A VENDA */
     IF (TESTE > 0) THEN
      BEGIN

        UPDATE
          INDIVIDUAIS
        SET
          VENDIDO = 'N'
        WHERE
          CODMOVSAIDA = :CODMOVIMENTO;

        UPDATE
          MOVIMENTOS
        SET
          CODCLIENTE        = :CODCLIENTE,
          CODRESPONSAVEL    = :CODRESPONSAVEL,
          CODVENDEDOR       = :CODVENDEDOR,
          NOTA_CODNATUOPER  = :CODNATUOPER,
          CONDICAO          = :CONDICAO
        WHERE
          CODIGO = :CODMOVIMENTO;

      END ELSE
      BEGIN

        INSERT INTO
          MOVIMENTOS (
            CODIGO,
            ES,
            TIPO,
            CODCLIENTE,
            DATA,
            VALOR_SERVICOS,
            VALOR_ITENS,
            DESCONTO,
            VALOR_ICMS,
            NOTA_FRETE,
            NOTA_VALOR_FRETE,
            NOTA_VALOR_SEGURO,
            NOTA_VALOR_OUTROS,
            NOTA_QUANTIDADE,
            NOTA_PESOBRUTO,
            NOTA_PESOLIQUIDO,
            STATUS,
            CONDICAO,
            ICMSSIMPLES,
            ICMSSIMPALIQ,
            ISSALIQ,
            NOTA_DATASAIDA,
            NOTA_BASEICMSSUBST,
            NOTA_VALORICMSSUBST,
            VALOR_IPI,
            GARANTIA,
            EMPRESTIMO,
            CODEMPRESA,
            VALOR_COMISSAO,
            ECF,
            OSTIPO,
            VALOR_IPI_PRODUTOS,
            AUTORIZADO,
            CODRESPONSAVEL,
            CODVENDEDOR_ABRE,
            CODVENDEDOR,
            NOTA_CODNATUOPER,
            PRIORIDADE,
            CONDICAO,
            CODCENTRO)
          VALUES (
            :CODMOVIMENTO,
            2,
            5,
            :CODCLIENTE,
            CURRENT_TIMESTAMP,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            '',
            '',                    /* CONDICAO        */
            'N',                   /* ICMSSIMPLES     */
            0,                     /* ICMSSIMPLESALIQ */
            0,                     /* ISSALIQ         */
            CURRENT_TIMESTAMP,
            0,
            0,
            0,
            'N',
            'N',
            :CODEMPRESA,
            0,
            'N',                   /* ECF             */
            99,                    /* OSTIPO          */
            0,
            'N',
            :CODRESPONSAVEL,
            :CODRESPONSAVEL,
            :CODVENDEDOR,
            :CODNATUOPER,
            1,
            :CONDICAO,
            1);                    /* CODCENTRO       */

        /* SE DER ERRO */
        WHEN ANY DO RE_MOVIMENTO = 1;

      END

   END

  /* SE NÃO HOUVER MOVIMENTO, ABORTO */
  IF (CODMOVIMENTO = 0) THEN
    EXIT;

  /* SE DEU ERRO PASSO AOS ITENS */
  IF (RE_MOVIMENTO = 0) THEN
   BEGIN

     /******************************************************/
     /* ITEM 01                                            */
     /******************************************************/
     RE_01 = 0;
     IF (I01_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I01_CODBARRA,
            :I01_QUANTIDADE,
            :I01_VALOR,
            :I01_DESCONTO,
            :I01_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_01 = 1;

      END

     /******************************************************/
     /* ITEM 02                                            */
     /******************************************************/
     RE_02 = 0;
     IF (I02_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I02_CODBARRA,
            :I02_QUANTIDADE,
            :I02_VALOR,
            :I02_DESCONTO,
            :I02_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_02 = 1;

      END

     /******************************************************/
     /* ITEM 03                                            */
     /******************************************************/
     RE_03 = 0;
     IF (I03_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I03_CODBARRA,
            :I03_QUANTIDADE,
            :I03_VALOR,
            :I03_DESCONTO,
            :I03_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_03 = 1;

      END

     /******************************************************/
     /* ITEM 04                                            */
     /******************************************************/
     RE_04 = 0;
     IF (I04_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I04_CODBARRA,
            :I04_QUANTIDADE,
            :I04_VALOR,
            :I04_DESCONTO,
            :I04_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_04 = 1;

      END

     /******************************************************/
     /* ITEM 05                                            */
     /******************************************************/
     RE_05 = 0;
     IF (I05_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I05_CODBARRA,
            :I05_QUANTIDADE,
            :I05_VALOR,
            :I05_DESCONTO,
            :I05_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_05 = 1;

      END

     /******************************************************/
     /* ITEM 06                                            */
     /******************************************************/
     RE_06 = 0;
     IF (I06_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I06_CODBARRA,
            :I06_QUANTIDADE,
            :I06_VALOR,
            :I06_DESCONTO,
            :I06_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_06 = 1;

      END

     /******************************************************/
     /* ITEM 07                                            */
     /******************************************************/
     RE_07 = 0;
     IF (I07_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I07_CODBARRA,
            :I07_QUANTIDADE,
            :I07_VALOR,
            :I07_DESCONTO,
            :I07_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_07 = 1;

      END

     /******************************************************/
     /* ITEM 08                                            */
     /******************************************************/
     RE_08 = 0;
     IF (I08_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I08_CODBARRA,
            :I08_QUANTIDADE,
            :I08_VALOR,
            :I08_DESCONTO,
            :I08_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_08 = 1;

      END

     /******************************************************/
     /* ITEM 09                                            */
     /******************************************************/
     RE_09 = 0;
     IF (I09_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I09_CODBARRA,
            :I09_QUANTIDADE,
            :I09_VALOR,
            :I09_DESCONTO,
            :I09_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_09 = 1;

      END

     /******************************************************/
     /* ITEM 10                                            */
     /******************************************************/
     RE_10 = 0;
     IF (I10_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I10_CODBARRA,
            :I10_QUANTIDADE,
            :I10_VALOR,
            :I10_DESCONTO,
            :I10_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_10 = 1;

      END

     /******************************************************/
     /* ITEM 11                                            */
     /******************************************************/
     RE_11 = 0;
     IF (I11_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I11_CODBARRA,
            :I11_QUANTIDADE,
            :I11_VALOR,
            :I11_DESCONTO,
            :I11_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_11 = 1;

      END

     /******************************************************/
     /* ITEM 12                                            */
     /******************************************************/
     RE_12 = 0;
     IF (I12_CODBARRA > '') THEN
      BEGIN

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :I12_CODBARRA,
            :I12_QUANTIDADE,
            :I12_VALOR,
            :I12_DESCONTO,
            :I12_ICMS,
            :CODMOVIMENTO);

        /* SE DER ERRO */
        WHEN ANY DO RE_12 = 1;

      END

     /******************************************************/
     /* TOTAIS                                             */
     /******************************************************/
     SELECT
       SUM(INDIVIDUAIS.VALOR_PAGO)
     FROM
       INDIVIDUAIS INDIVIDUAIS
     WHERE
       INDIVIDUAIS.CODMOVSAIDA = :CODMOVIMENTO AND
       INDIVIDUAIS.PS          = 'S'           AND
       INDIVIDUAIS.VENDIDO     = 'S'
     INTO
       :TEMP_SERVICOS;
     IF (TEMP_SERVICOS IS NULL) THEN
       TEMP_SERVICOS = 0;

     SELECT
       SUM(INDIVIDUAIS.VALOR_PAGO)
     FROM
       INDIVIDUAIS INDIVIDUAIS
     WHERE
       INDIVIDUAIS.CODMOVSAIDA = :CODMOVIMENTO AND
       INDIVIDUAIS.PS          = 'P'           AND
       INDIVIDUAIS.VENDIDO     = 'S'
     INTO
       :TEMP_PRODUTOS;
     IF (TEMP_PRODUTOS IS NULL) THEN
       TEMP_PRODUTOS = 0;

     UPDATE
       MOVIMENTOS
     SET
       VALOR_SERVICOS = :TEMP_SERVICOS,
       VALOR_ITENS    = :TEMP_PRODUTOS
     WHERE
       CODIGO = :CODMOVIMENTO;

   END

  SUSPEND;

END

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE VENDA_FECHA (
    CODMOVIMENTO INTEGER)
RETURNS (
    RE_MOVIMENTO INTEGER)
AS
DECLARE VARIABLE TIPO INTEGER;
begin

  RE_MOVIMENTO = 0;

  /* LEIO O TIPO ATUAL */
  SELECT
    TIPO
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVIMENTO
  INTO
    :TIPO;

  IF (TIPO IN (2, 5)) THEN
   BEGIN

     IF (TIPO = 2) THEN
       TIPO = 3;
     ELSE
       TIPO = 6;

     UPDATE
       MOVIMENTOS
     SET
       TIPO = :TIPO
     WHERE
       CODIGO = :CODMOVIMENTO;

     WHEN ANY DO RE_MOVIMENTO = 1;

   END

  SUSPEND;

end

^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE VENDA_FECHA (
    CODMOVIMENTO INTEGER,
    OBSERVACOES VARCHAR(2048))
RETURNS (
    RE_MOVIMENTO INTEGER)
AS
DECLARE VARIABLE TIPO INTEGER;
begin

  RE_MOVIMENTO = 0;

  /* LEIO O TIPO ATUAL */
  SELECT
    TIPO
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVIMENTO
  INTO
    :TIPO;

  IF (TIPO IN (2, 5)) THEN
   BEGIN

     IF (TIPO = 2) THEN
       TIPO = 3;
     ELSE
       TIPO = 6;

     UPDATE
       MOVIMENTOS
     SET
       TIPO = :TIPO,
       OBSERVACOES = :OBSERVACOES
     WHERE
       CODIGO = :CODMOVIMENTO;

     WHEN ANY DO RE_MOVIMENTO = 1;

   END

  SUSPEND;

end

^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (198, CURRENT_TIMESTAMP);
COMMIT;