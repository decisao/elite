/*
** CADASTRO DE CONTRATOS - FATURAMENTO
*/

ALTER TABLE CONTRATOS ADD VALOR DINHEIRO;

ALTER TABLE CONTRATOS ADD CODNATUOPER STR05_VALIDO;

ALTER TABLE CONTRATOS ADD CODSERVICO INTEIRO_VALIDO;

ALTER TABLE CONTRATOS ADD CODCONDPAG INTEIRO_VALIDO;

ALTER TABLE CONTRATOS
ADD CONSTRAINT CONTRATOS_FK04
FOREIGN KEY (CODNATUOPER)
REFERENCES NATUOPER(CODIGO)
ON UPDATE CASCADE;

ALTER TABLE CONTRATOS
ADD CONSTRAINT CONTRATOS_FK05
FOREIGN KEY (CODSERVICO)
REFERENCES PRODUTOS(CODIGO)
ON UPDATE CASCADE;

ALTER TABLE CONTRATOS
ADD CONSTRAINT CONTRATOS_FK06
FOREIGN KEY (CODCONDPAG)
REFERENCES CONDPAG(CODIGO)
ON UPDATE CASCADE;

ALTER TABLE CONTRATOS ADD FATURAR SIMNAO;

SET TERM ^ ;

CREATE PROCEDURE CONTRATO_FATURAR (
    CODEMPRESA INTEGER,
    CODCLIENTE INTEGER,
    CODRESPONSAVEL INTEGER,
    CODVENDEDOR INTEGER,
    CODCONDPAG INTEGER,
    CODNATUOPER VARCHAR(5),
    CODSERVICO INTEGER,
    VALOR NUMERIC(9,2))
RETURNS (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE CONDICAO VARCHAR(40);
DECLARE VARIABLE TEMP_CODBARRA VARCHAR(14);
DECLARE VARIABLE TEMP_VALOR NUMERIC(9, 2);
DECLARE VARIABLE TEMP_DESCONTO NUMERIC(9, 2);
DECLARE VARIABLE TEMP_ICMS NUMERIC(9, 4);
BEGIN

  CODMOVIMENTO = 0;

  EXECUTE PROCEDURE SEQ_OBTER('MOVIMENTOS')
    RETURNING_VALUES :CODMOVIMENTO;

  /* PEGO A CONDICAO DE PAGAMENTO */
  SELECT
    CONDICAO
  FROM
    CONDPAG
  WHERE
    CODIGO = :CODCONDPAG
  INTO
    :CONDICAO;

  /* BLOCO DO MOVIMENTO */
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
        CONDICAO)
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
        :CONDICAO);

    /* SE DER ERRO */
    WHEN ANY DO CODMOVIMENTO = 0;

  END

  /* SE NÃO HOUVER MOVIMENTO, ABORTO */
  IF (CODMOVIMENTO = 0) THEN
    EXIT;

  /* SE NAO DEU ERRO PASSO AOS ITENS */
  IF (CODMOVIMENTO > 0) THEN
   BEGIN

     /******************************************************/
     /* SERVICO 01                                         */
     /******************************************************/
     IF (CODSERVICO > 0) THEN
      BEGIN

        /* BUSCO OS DADOS DO SERVICO */
        SELECT
          BARRA,
          PRECOVENDA,
          ICMS
        FROM
          PRODUTOS
        WHERE
          CODIGO = :CODSERVICO
        INTO
          :TEMP_CODBARRA,
          :TEMP_VALOR,
          :TEMP_ICMS;

        TEMP_DESCONTO = TEMP_VALOR - VALOR;

        /* VENDO O ITEM */
        EXECUTE PROCEDURE
          ITVENDA_GRAVA(
            :TEMP_CODBARRA,
            1,
            :TEMP_VALOR,
            :TEMP_DESCONTO,
            :TEMP_ICMS,
            :CODMOVIMENTO);

        SELECT
          SUM(VALOR_PAGO)
        FROM
          INDIVIDUAIS
        WHERE
          CODMOVSAIDA = :CODMOVIMENTO
        INTO
          :TEMP_VALOR;

        UPDATE
          MOVIMENTOS
        SET
          TIPO = 6,
          VALOR_SERVICOS = :TEMP_VALOR
        WHERE
          CODIGO = :CODMOVIMENTO;

        /* SE DER ERRO */
        WHEN ANY DO CODMOVIMENTO = 0;

      END

   END

  SUSPEND;

END

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE CONTRATO_FATURAR TO PUBLIC;

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (181, CURRENT_TIMESTAMP);
COMMIT;