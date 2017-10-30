ALTER PROCEDURE ITVENDA_GRAVA (
    BARRA CHAR (14),
    QUANTIDADE NUMERIC (9, 2),
    VALOR NUMERIC (9, 2),
    DESCONTO NUMERIC (9, 2),
    ICMS NUMERIC (9, 2),
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
BEGIN
  /* informações do produto */
  SELECT
    CODIGO,
    PRECOCUSTO,
    PS,
    COMISSIONADO
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :XPRECOCUSTO,
    :PS,
    :COMISSAO_PRODUTO;
  /* informações do movimento */
  SELECT
    CODCLIENTE,
    CODVENDEDOR,
    CODEMPRESA
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODCLIENTE,
    :CODVENDEDOR,
    :CODEMPRESA;
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
              /* vendo o que for preciso */
              UPDATE
                INDIVIDUAIS
              SET
                QUANTIDADE = :BAIXA,
                CODMOVSAIDA = :CODMOVSAIDA,
                VALOR_VENDA = :VALOR,
                DESCONTO = :DESCONTO,
                VENDIDO = 'S',
                ICMSVENDA = :ICMS,
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

ALTER PROCEDURE ULTIMAOS (
    CODCLIENTE INTEGER)
RETURNS (
    NUMERO_OS INTEGER,
    DATA TIMESTAMP,
    SOLICITANTE VARCHAR (40),
    RESPONSAVEL VARCHAR (40),
    OUTRAS_ABERTAS INTEGER,
    TODAS_FECHADAS INTEGER,
    TOTAL_FECHADAS NUMERIC (9, 2),
    NUMERO_ULTIMA INTEGER,
    DATA_ULTIMA TIMESTAMP,
    VALOR_ULTIMA NUMERIC (9, 2),
    SOLICITANTE_ULTIMA VARCHAR (40))
AS
begin
  /* procuro a ultima os em aberto */
  select
    max(codigo)
  from
    movimentos
  where
    es = 2 and
    tipo = 2 and
    codcliente = :codcliente
  into
    :numero_os;
  /* se existir, faço outras pesquisas */
  if (numero_os is not null) then
   begin
     /* dados da ultima OS aberta */
     select
       mo.data,
       mo.solicitante,
       ve.nome
     from
       movimentos mo
       left join clientes ve on
         (mo.codvendedor_abre = ve.codigo)
     where
       mo.codigo = :numero_os
     into
       :data,
       :solicitante,
       :responsavel;
     /* existem outras os abertas? */
     select
       count(codigo)
     from
       movimentos
     where
       es = 2 and
       tipo = 2 and
       codcliente = :codcliente
     into
       :outras_abertas;
     outras_abertas = outras_abertas - 1;
     /* quantas os fechadas */
     select
       count(codigo),
       sum(nota_valor_total)
     from
       movimentos
     where
       es = 2 and
       tipo in (3, 6) and
       codcliente = :codcliente
     into
       :todas_fechadas,
       :total_fechadas;
     /* procuro a última fechada */
     select
       max(codigo)
     from
       movimentos
     where
       es = 2 and
       tipo in (3, 6) and
       codcliente = :codcliente
     into
       :numero_ultima;
     /* informações da última fechada */
     select
       data,
       nota_valor_total,
       solicitante
     from
       movimentos
     where
       codigo = :numero_ultima
     into
       :data_ultima,
       :valor_ultima,
       :solicitante_ultima;
   end
  /* retorno os valores */
  suspend;
end!

ALTER PROCEDURE ORCAMENTO_OS (
    CODMOVIMENTO INTEGER)
RETURNS (
    TODOS CHAR (1))
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

ALTER TABLE OS_VENDER DROP CONSTRAINT OS_VENDER_FK02!

delete from os_vender!

alter table OS_VENDER
add constraint OS_VENDER_FK02
foreign key (CODVENDEDOR)
references CLIENTES(CODIGO)
on update CASCADE!

DROP TABLE VENDEDORES!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (52, CURRENT_TIMESTAMP)!