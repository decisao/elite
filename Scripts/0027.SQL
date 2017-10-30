/* MULTIEMPRESA                                                                   */
/* ------------------------------------------------------------------------------ */
/* Esse script deve ser rodado somente nos bancos de dados destinados a operacao  */
/* multiempresa. Essa atualização é crítica.                                      */
/* ------------------------------------------------------------------------------ */

/* adiciono o campo de controle da empresa do movimento */
ALTER TABLE MOVIMENTOS ADD CODEMPRESA INTEIRO_CHEIO1!

/* crio o indice para que as buscas sejam rapidas */
CREATE INDEX MOVIMENTOS_SI06 ON MOVIMENTOS (CODEMPRESA)!

/* crio a chave estrangeira para o sisconfig */
ALTER TABLE MOVIMENTOS ADD CONSTRAINT MOVIMENTOS_FK07
   FOREIGN KEY (CODEMPRESA) REFERENCES SISCONFIG (CODIGO)
   ON UPDATE CASCADE!

/* adiciono o campo de controle da empresa do movimento */
ALTER TABLE INDIVIDUAIS ADD CODEMPRESA INTEIRO_CHEIO1!

/* crio o indice para que as buscas sejam rapidas */
CREATE INDEX INDIVIDUAIS_SI10 ON INDIVIDUAIS (CODEMPRESA)!

/* crio a chave estrangeira para o sisconfig */
ALTER TABLE INDIVIDUAIS ADD CONSTRAINT INDIVIDUAIS_FK03
   FOREIGN KEY (CODEMPRESA) REFERENCES SISCONFIG (CODIGO)
   ON UPDATE CASCADE!

/* adiciono o campo de controle da empresa do movimento */
ALTER TABLE PAGAMENTOS ADD CODEMPRESA INTEIRO_CHEIO1!

/* crio o indice para que as buscas sejam rapidas */
CREATE INDEX PAGAMENTOS_SI08 ON PAGAMENTOS (CODEMPRESA)!

/* crio a chave estrangeira para o sisconfig */
ALTER TABLE PAGAMENTOS ADD CONSTRAINT PAGAMENTOS_FK03
   FOREIGN KEY (CODEMPRESA) REFERENCES SISCONFIG (CODIGO)
   ON UPDATE CASCADE!

/* visualizacao das ordens de servico */
ALTER PROCEDURE P_OS (
    EMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    DATA TIMESTAMP,
    PRIORIDADE INTEGER,
    STATUS VARCHAR(20) CHARACTER SET NONE,
    NOTA_NUMERO INTEGER,
    NOME VARCHAR(40) CHARACTER SET NONE,
    SERIE VARCHAR(30) CHARACTER SET NONE,
    VALOR_TOTAL NUMERIC(9,2),
    VALOR_ABERTO NUMERIC(9,2),
    TIPO INTEGER)
AS
DECLARE VARIABLE NOMEFOR VARCHAR(40);
begin
  for
  select
    mo.codigo,
    mo.data,
    mo.prioridade,
    mo.status,
    mo.nota_numero,
    cl.nome,
    fo.nome,
    mo.serie,
    mo.valor_total,
    mo.tipo
  from
    movimentos mo
    left join clientes cl on
      (mo.codcliente = cl.codigo)
    left join fornecedores fo on
      (mo.codfornecedor = fo.codigo)
  where
    tipo in (0, 1, 2, 3, 5, 6, 9) and
    codempresa = :empresa
  into
    :codigo,
    :data,
    :prioridade,
    :status,
    :nota_numero,
    :nome,
    :nomefor,
    :serie,
    :valor_total,
    :tipo
  do
  begin
    valor_aberto = null;
    /* verifico se esta fechada a saida */
    if (tipo in (1, 3, 6)) then
     begin
       select
         sum(valor)
       from
         pagamentos
       where
         codmovimento = :codigo and
         pago = 0
       into
         :valor_aberto;
     end
    if (tipo = 1) then
     nome = nomefor;
    /* retorno */
    suspend;
  end
end!

ALTER PROCEDURE P_PRODUTOS (
    EMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    BARRA VARCHAR(14) CHARACTER SET NONE,
    DESCRICAO VARCHAR(60) CHARACTER SET NONE,
    QUANTIDADE NUMERIC(9,2),
    PRECOVENDA NUMERIC(9,2),
    LOCALIZACAO VARCHAR(40) CHARACTER SET NONE,
    PS CHAR(1) CHARACTER SET NONE,
    PRECOTOTAL NUMERIC(9,2),
    ESTOQUELOCAL NUMERIC(9,2))
AS
DECLARE VARIABLE CODSERVICO INTEGER;
DECLARE VARIABLE VALORSERVICO NUMERIC(9,2);
begin
  for
  select
    CODIGO,
    BARRA,
    DESCRICAO,
    PRECOVENDA,
    LOCALIZACAO,
    CODSERVICO,
    PS
  from
    PRODUTOS
  into
    :CODIGO,
    :BARRA,
    :DESCRICAO,
    :PRECOVENDA,
    :LOCALIZACAO,
    :CODSERVICO,
    :PS
  do
  begin
    PRECOTOTAL = NULL;
    /* quantidade em estoque */
    select
      sum(quantidade)
    from
      individuais
    where
      codproduto = :codigo and
      vendido = 'N'
    into
      :quantidade;
    /* quantidade em estoque local */
    select
      sum(quantidade)
    from
      individuais
    where
      codproduto = :codigo and
      vendido = 'N' and
      codempresa = :empresa
    into
      :estoquelocal;
    if (CODSERVICO is not null) then
      begin
        /* procuro o servico */
        SELECT
          PRECOVENDA
        FROM
          PRODUTOS
        WHERE
          CODIGO = :CODSERVICO AND
          PS = 'S'
        INTO
          :VALORSERVICO;
        if (valorservico is not null) then
          PRECOTOTAL = PRECOVENDA + VALORSERVICO;
      end
    suspend;
   end
end!

ALTER TRIGGER ORSOMA_INS
ACTIVE AFTER INSERT POSITION 0
AS
   DECLARE VARIABLE SOMA       NUMERIC(9,2);
   DECLARE VARIABLE CODIGO     INTEGER;
   DECLARE VARIABLE ES         CHAR(1);
   DECLARE VARIABLE TIPO       CHAR(1);
   DECLARE VARIABLE ETIQUETA   CHAR(1);
   DECLARE VARIABLE NUMETIQ    INTEGER;
   DECLARE VARIABLE INDIVIDUAL CHAR(1);
   DECLARE VARIABLE SEQUENCIA  INTEGER;
   DECLARE VARIABLE SEQUENSTR  CHAR(4);
   DECLARE VARIABLE N          INTEGER;
   DECLARE VARIABLE C          INTEGER;
   DECLARE VARIABLE BARRA      CHAR(14);
   DECLARE VARIABLE PS         CHAR(1);
   declare variable EMPRESA    INTEGER;
BEGIN
 /* VERIFICO SE EXISTE CÓDIGO DE BARRAS VÁLIDO */
 SELECT BARRA, PS FROM PRODUTOS WHERE CODIGO = NEW.CODPRODUTO INTO :BARRA, :PS;
 IF (BARRA = '0000000000000') THEN
      EXCEPTION BARRA_NECESSARIA;
 IF (PS = 'P') THEN
  BEGIN
   CODIGO = NEW.CODMOVIMENTO;
   SELECT ES, TIPO, CODEMPRESA FROM MOVIMENTOS WHERE CODIGO = :CODIGO
     INTO :ES, :TIPO, :EMPRESA;
   IF ((ES = 1) AND (TIPO = 1)) THEN
    BEGIN
      UPDATE PRODUTOS SET PRECOCUSTO = NEW.VALOR_UNITARIO
        WHERE CODIGO = NEW.CODPRODUTO;
      IF (NEW.REAJUSTAR = 'S') THEN
        UPDATE PRODUTOS SET PRECOVENDA = NEW.VALOR_VENDA,
          ICMS = NEW.ICMSVENDA WHERE CODIGO = NEW.CODPRODUTO;
      SELECT ETIQUETA, INDIVIDUAL, SEQUENCIA, BARRA FROM PRODUTOS
        WHERE CODIGO = NEW.CODPRODUTO
        INTO :ETIQUETA, :INDIVIDUAL, :SEQUENCIA, :BARRA;
      N = 0;
      IF (INDIVIDUAL = 'S') THEN
       BEGIN
        WHILE (N < NEW.QUANTIDADE) DO
         BEGIN
           N = N + 1;
           SEQUENCIA = (SEQUENCIA + 1);
           IF (SEQUENCIA > 99) THEN SEQUENSTR = ('0' || SEQUENCIA);
            ELSE IF (SEQUENCIA > 9) THEN SEQUENSTR = ('00' || SEQUENCIA);
             ELSE IF (SEQUENCIA > 0) THEN SEQUENSTR = ('000' || SEQUENCIA);
              ELSE SEQUENSTR = '0000';
           BARRA = EAN('999' || NEW.CODPRODUTO || SEQUENSTR || '0');
           EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
             RETURNING_VALUES C;
           INSERT INTO INDIVIDUAIS (CODIGO, CODITEM, CODPRODUTO, CODMOVENTRADA, SEQUENCIA,
             ICMSVENDA, VALOR_VENDA, IMPETIQ, QUANTIDADE, UNICO, BARRA, CODEMPRESA) VALUES (:C,
             NEW.CODIGO, NEW.CODPRODUTO, NEW.CODMOVIMENTO, :SEQUENSTR, NEW.ICMSVENDA,
             NEW.VALOR_VENDA, :ETIQUETA, 1, 1, :BARRA, :EMPRESA);
         END
        UPDATE PRODUTOS SET SEQUENCIA = (SEQUENCIA + NEW.QUANTIDADE)
          WHERE CODIGO = NEW.CODPRODUTO;
       END ELSE
       BEGIN
           EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
             RETURNING_VALUES C;
           INSERT INTO INDIVIDUAIS (CODIGO, CODITEM, CODPRODUTO, CODMOVENTRADA, SEQUENCIA,
             ICMSVENDA, VALOR_VENDA, IMPETIQ, QUANTIDADE, UNICO, BARRA, CODEMPRESA) VALUES (:C,
             NEW.CODIGO, NEW.CODPRODUTO, NEW.CODMOVIMENTO, '0000', NEW.ICMSVENDA,
             NEW.VALOR_VENDA, :ETIQUETA, NEW.QUANTIDADE, 0, :BARRA, :EMPRESA);
       END
    END
   UPDATE MOVIMENTOS SET VALOR_ITENS = VALOR_ITENS + NEW.VALOR_TOTAL
     WHERE CODIGO = :CODIGO;
  END
END!

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
DECLARE VARIABLE CODFORNECEDOR INTEGER;
DECLARE VARIABLE CODEMPRESA INTEGER;
BEGIN
   SELECT
      VALOR_TOTAL,
      CONDICAO,
      ES,
      DATA,
      TIPO,
      CODCLIENTE,
      CODFORNECEDOR,
      CODEMPRESA
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
      :CODFORNECEDOR,
      :CODEMPRESA;
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
   if (ES = 1) then
    BEGIN
     CODCONTA = CODCONTA_COMPRADEB;
     SELECT
       F_LEFT(NOME, 16)
     FROM
       FORNECEDORES
     WHERE
       CODIGO = :CODFORNECEDOR
     INTO
       :NOME;
    END
   else
    BEGIN
     CODCONTA = CODCONTA_VENDACRE;
     SELECT
       F_LEFT(NOME, 16)
     FROM
       CLIENTES
     WHERE
       CODIGO = :CODCLIENTE
     INTO
       :NOME;
   END
   IF (TOTAL <= 0) THEN EXIT;
   SELECT
      COUNT(*)
   FROM
      PARCELAS(
        :CONDICAO
      )
   INTO
      :QUANTIDADE;
   IF (QUANTIDADE > 0) THEN
    BEGIN
     DELETE FROM
      PAGAMENTOS
     WHERE
      CODMOVIMENTO = :CODIGO;
     PARCELA = CAST((TOTAL / QUANTIDADE) AS INTEGER);
     N = 0;
     FOR
     SELECT DIAS FROM PARCELAS(:CONDICAO) INTO :DIAS DO
      BEGIN
       N = N + 1;
       IF (ES = 1) THEN
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' COMPRA ' || CODIGO || ' ' || NOME;
       ELSE
          DESCRICAO = 'PARC ' || N || '/' || QUANTIDADE || ' VENDA ' || CODIGO || ' ' || NOME;
       SELECT SEQUENCIA FROM SEQ_OBTER('PAGAMENTOS') INTO :CODPAG;
       if (DIAS = 0) then
        begin
          CODDOC = DOCVISTA;
          CODPAGO = 0;
        end else
        begin
          CODDOC = DOCPRAZO;
          CODPAGO = 0;
        end
       INSERT INTO PAGAMENTOS (CODIGO, CODMOVIMENTO, NUMERO, DESCRICAO, ES,
         VALOR, DATAVENCIMENTO, CODDOCUMENTO, PAGO, CODCONTA, CODEMPRESA) VALUES (:CODPAG, :CODIGO, :N,
         :DESCRICAO, :ES, :PARCELA, :DATAMOV + :DIAS, :CODDOC, :CODPAGO, :CODCONTA, :CODEMPRESA);
      END
     UPDATE PAGAMENTOS SET VALOR = VALOR + (:TOTAL - (:PARCELA * :QUANTIDADE))
       WHERE CODMOVIMENTO = :CODIGO AND NUMERO = 1;
    END ELSE EXCEPTION CONDICAO_ERRADA;
END!

ALTER TRIGGER MOVIMENTOS_AFTINS
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
    IF (NEW.VALOR_TOTAL > 0) THEN
      EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
END!

ALTER TRIGGER MOVIMENTOS_AFTUPD
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
   BEGIN
     IF (((NEW.VALOR_TOTAL <> OLD.VALOR_TOTAL) OR
        (NEW.CONDICAO <> OLD.CONDICAO)) AND
        (NEW.TIPO IN (1, 2, 5))) THEN
           EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
     if (NEW.TIPO IN (3, 6)) then
           EXECUTE PROCEDURE AUTOBAIXA(NEW.CODIGO);
   END
  IF (NEW.TIPO = 9) THEN
     DELETE FROM PAGAMENTOS WHERE CODMOVIMENTO = NEW.CODIGO AND
       PAGO = 0;
END!

ALTER PROCEDURE INFOVENDA (
    BARRA CHAR(14) CHARACTER SET NONE,
    CODEMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    QUANTIDADE INTEGER,
    DESCRICAO VARCHAR(100) CHARACTER SET NONE,
    ICMS NUMERIC(9,2),
    VALOR NUMERIC(9,2),
    CODSERVICO INTEGER)
AS
DECLARE VARIABLE CODPRODUTO INTEGER;
DECLARE VARIABLE UNICO INTEGER;
DECLARE VARIABLE NUMSERIE CHAR(20);
DECLARE VARIABLE PS CHAR(1);
BEGIN
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
  if (PS = 'S') then
   begin
    ICMS = 0;
    QUANTIDADE = 9999;
    SUSPEND;
    EXIT;
   end
  SELECT COUNT(*) FROM INDIVIDUAIS WHERE
    BARRA = :BARRA AND VENDIDO = 'N' AND
    CODEMPRESA = :CODEMPRESA INTO CODIGO;
  IF (CODIGO IS NULL) THEN CODIGO = 0;
  IF (CODIGO = 0) THEN
     EXCEPTION ITEM_ERRADO;
  FOR
  SELECT INDIVIDUAIS.CODIGO,
         INDIVIDUAIS.CODPRODUTO,
         INDIVIDUAIS.UNICO,
         INDIVIDUAIS.SERIE,
         PRODUTOS.PRECOVENDA,
         PRODUTOS.ICMS,
         PRODUTOS.DESCRICAO
    FROM INDIVIDUAIS
    JOIN PRODUTOS ON (INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO)
   WHERE INDIVIDUAIS.BARRA = :BARRA AND
         INDIVIDUAIS.VENDIDO = 'N' AND
         INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO AND
         INDIVIDUAIS.CODEMPRESA = :CODEMPRESA
    INTO :CODIGO, :CODPRODUTO, :UNICO, :NUMSERIE, :VALOR, :ICMS, :DESCRICAO
  DO
  BEGIN
    IF (UNICO = 1) THEN
     BEGIN
       IF (NUMSERIE IS NOT NULL) THEN
         DESCRICAO = DESCRICAO || ' - ' || NUMSERIE;
       QUANTIDADE = 1;
     END ELSE
     BEGIN
       SELECT SUM(QUANTIDADE)
       FROM INDIVIDUAIS
       WHERE BARRA = :BARRA AND
             VENDIDO = 'N'
       INTO :QUANTIDADE;
     END
    SUSPEND;
    EXIT;
  END
END!

ALTER PROCEDURE ITVENDA_GRAVA (
    BARRA CHAR(14) CHARACTER SET NONE,
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
BEGIN
  SELECT
    CODIGO,
    PRECOCUSTO,
    PS
  FROM
    PRODUTOS
  WHERE
    BARRA = :BARRA
  INTO
    :XCODPRODUTO,
    :XPRECOCUSTO,
    :PS;
  SELECT
    CODEMPRESA
  FROM
    MOVIMENTOS
  WHERE
    CODIGO = :CODMOVSAIDA
  INTO
    :CODEMPRESA;
  IF ((PS = 'P') or (PS IS NULL)) THEN
   BEGIN
    SELECT SUM(QUANTIDADE) FROM INDIVIDUAIS
      WHERE BARRA = :BARRA AND VENDIDO = 'S' AND CODMOVSAIDA = :CODMOVSAIDA
      AND CODEMPRESA = :CODEMPRESA
      INTO :XQUANTIDADE;
    IF (XQUANTIDADE IS NULL) THEN XQUANTIDADE = 0;
    IF (XQUANTIDADE > 0) THEN
      EXCEPTION ITEM_REPETIDO;
    SELECT SUM(QUANTIDADE) FROM INDIVIDUAIS
    WHERE BARRA = :BARRA AND VENDIDO = 'N'  AND CODEMPRESA = :CODEMPRESA
    INTO :XQUANTIDADE;
    IF (QUANTIDADE <= XQUANTIDADE) THEN
      BEGIN
        FOR
        SELECT CODIGO, CODITEM, CODPRODUTO, CODMOVENTRADA, SEQUENCIA, SERIE,
          VENDIDO, CODMOVSAIDA, VALOR_VENDA, ICMSVENDA, DESCONTO, IMPETIQ,
          BARRA, QUANTIDADE, UNICO FROM INDIVIDUAIS
          WHERE BARRA = :BARRA AND VENDIDO = 'N'
          AND CODEMPRESA = :CODEMPRESA ORDER BY CODIGO
          INTO :XCODIGO, :XCODITEM, :XCODPRODUTO, :XCODMOVENTRADA,
          :XSEQUENCIA, :XSERIE, :XVENDIDO, :XCODMOVSAIDA, :XVALOR_VENDA,
          :XICMSVENDA, :XDESCONTO, :XIMPETIQ, :XBARRA, :XQUANTIDADE, :XUNICO
        DO
        BEGIN
          IF (QUANTIDADE > 0) THEN
            BEGIN
              SOBRA = 0;
              IF (QUANTIDADE >= XQUANTIDADE) THEN
                BEGIN
                  BAIXA = XQUANTIDADE;
                END ELSE
                BEGIN
                  BAIXA = QUANTIDADE;
                  SOBRA = XQUANTIDADE - BAIXA;
                END
              QUANTIDADE = QUANTIDADE - BAIXA;
              UPDATE INDIVIDUAIS SET QUANTIDADE = :BAIXA,
                CODMOVSAIDA = :CODMOVSAIDA, VALOR_VENDA = :VALOR,
                DESCONTO = :DESCONTO, VENDIDO = 'S', ICMSVENDA = :ICMS
                WHERE CODIGO = :XCODIGO;
              IF (SOBRA > 0) THEN
                BEGIN
                  EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
                    RETURNING_VALUES NSEQ;
                  XVENDIDO = 'N';
                  INSERT INTO INDIVIDUAIS (CODIGO, CODITEM, CODPRODUTO,
                    CODMOVENTRADA, SEQUENCIA, SERIE, VENDIDO, VALOR_VENDA,
                    ICMSVENDA, DESCONTO, IMPETIQ, BARRA, QUANTIDADE, UNICO,
                    FRACIONADO, CODEMPRESA) VALUES (:NSEQ, :XCODITEM, :XCODPRODUTO,
                    :XCODMOVENTRADA, :XSEQUENCIA, :XSERIE, :XVENDIDO,
                    :XVALOR_VENDA, :XICMSVENDA, :XDESCONTO, :XIMPETIQ,
                    :XBARRA, :SOBRA, :XUNICO, 'S', :CODEMPRESA);
              END
            END ELSE EXIT;
        END
      END ELSE EXCEPTION ITEM_ESGOTADO;
    END ELSE
    BEGIN
      EXECUTE PROCEDURE SEQ_OBTER 'TEMPITENS'
         RETURNING_VALUES XCODITEM;
      INSERT INTO TEMPITENS (CODIGO, CODMOVIMENTO, CODPRODUTO,
         QUANTIDADE, VALOR_UNITARIO, DESCONTO,
         SITTRIBU, MARGEM, REAJUSTAR, VALOR_VENDA,
         ICMSCOMPRA, ICMSVENDA) VALUES (:XCODITEM,
         :CODMOVSAIDA, :XCODPRODUTO, 1, :XPRECOCUSTO,
         0, '0.0', 0, 'N', :VALOR, 0, 0);
      EXECUTE PROCEDURE SEQ_OBTER 'INDIVIDUAIS'
         RETURNING_VALUES NSEQ;
      INSERT INTO INDIVIDUAIS (CODIGO, CODITEM, CODPRODUTO,
         CODMOVENTRADA, CODMOVSAIDA, SEQUENCIA, SERIE, VENDIDO, VALOR_VENDA,
         ICMSVENDA, DESCONTO, IMPETIQ, BARRA, QUANTIDADE, UNICO,
         FRACIONADO, PS, CODEMPRESA) VALUES (:NSEQ, :XCODITEM, :XCODPRODUTO,
         :CODMOVSAIDA, :CODMOVSAIDA, '0000', '', 'S',
         :VALOR, 0, :DESCONTO, 'N',
         :BARRA, 1, 0, 'N', 'S', :CODEMPRESA);
    END
END!

ALTER PROCEDURE EXTRATO (
    CODCONTA INTEGER,
    DATAEX TIMESTAMP,
    CODEMPRESA INTEGER)
RETURNS (
    HORA TIMESTAMP,
    USUARIO VARCHAR(30) CHARACTER SET NONE,
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALORCRE NUMERIC(9,2),
    SALDO NUMERIC(9,2),
    LETRA CHAR(1) CHARACTER SET NONE,
    VALORDEB NUMERIC(9,2),
    INFODOC VARCHAR(50) CHARACTER SET NONE,
    DOCUMENTO VARCHAR(40) CHARACTER SET NONE)
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE CONTADOR INTEGER;
DECLARE VARIABLE SALDOANT NUMERIC(9,2);
DECLARE VARIABLE CODDOCUMENTO INTEGER;
begin
  /* pego o saldo anterior */
  select
    max(codlancto)
  from
    pagamentos
  where
    cast(datapago as date) < :dataex and
    codconta = :codconta and
    codempresa = :codempresa
  into
    :contador;
  select
    saldoatu
  from
    pagamentos
  where
    codlancto = :contador
  into
    :saldoant;
  hora = NULL;
  usuario = NULL;
  if (saldoant is null) then
     descricao = '*** ABERTURA DE CONTA ***';
  else
     descricao = 'SALDO ANTERIOR TRANSPORTADO';
  valorcre = NULL;
  valordeb = NULL;
  saldo = saldoant;
  letra = NULL;
  suspend;
  contador = 0;
  for
  select
    cast(datapago as time) as hora,
    nomeusuario,
    descricao,
    total_pago,
    saldoatu,
    saldoant,
    es,
    infodoc,
    coddocumento
  from
    pagamentos
  where
    codconta = :codconta and
    pago = 1 and
    cast(datapago as date) = :dataex and
    codempresa = :codempresa
  order by
    codlancto
  into
    :hora,
    :usuario,
    :descricao,
    :valorcre,
    :saldo,
    :saldoant,
    :es,
    :infodoc,
    :coddocumento
  do
  begin
    contador = contador + 1;
    if (es = 1) then
     begin
      letra = 'D';
      valordeb = valorcre;
      valorcre = NULL;
     end
    else
     begin
      letra = 'C';
      valordeb = NULL;
     end
    select
      documento
    from
      documentos
    where
      codigo = :coddocumento
    into
      :documento;
    suspend;
  end
end!

ALTER PROCEDURE LANCTO (
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALOR NUMERIC(9,2),
    CONTA INTEGER,
    TIPO CHAR(1) CHARACTER SET NONE,
    INFODOC VARCHAR(50) CHARACTER SET NONE,
    CODDOC INTEGER,
    CODEMPRESA INTEGER)
AS
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE ES INTEGER;
begin
  /* qual o tipo do lancamento */
  if (tipo = 'D') then
    es = 1;
  if (tipo = 'C') then
    es = 2;
  /* pego o codigo */
  select
    sequencia
  from
    seq_obter('PAGAMENTOS')
  into
    :codigo;
  insert into
    pagamentos (
      codigo,
      numero,
      descricao,
      datacadast,
      valor,
      externo,
      pago,
      datapago,
      datavencimento,
      codconta,
      es,
      infodoc,
      coddocumento,
      codempresa)
  values (
    :codigo,
    1,
    :descricao,
    'NOW',
    :valor,
    'S',
    1,
    'NOW',
    'NOW',
    :conta,
    :es,
    :infodoc,
    :coddoc,
    :codempresa);
end!

ALTER PROCEDURE BAIXA (
    CODIGO INTEGER,
    MULTA_JUROS NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    TIPO CHAR(1) CHARACTER SET NONE,
    CONTA INTEGER,
    CODDOCUMENTO INTEGER,
    INFODOC VARCHAR(50) CHARACTER SET NONE)
AS
DECLARE VARIABLE CODMOVIMENTO INTEGER;
DECLARE VARIABLE NUMERO INTEGER;
DECLARE VARIABLE DESCRICAO VARCHAR(40);
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE VALOR NUMERIC(9,2);
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE NOVONUM NUMERIC(15,2);
DECLARE VARIABLE CODEMPRESA INTEGER;
begin
  /* faço a baixa */
  update
    pagamentos
  set
    pago = 1,
    multa_juros = :multa_juros,
    desconto = :desconto,
    codconta = :conta,
    coddocumento = :coddocumento,
    infodoc = :infodoc
  where
    codigo = :codigo;
  /* é uma baixa parcial */
  if ((tipo = 'P') and (desconto > 0)) then
   begin
     /* leio os dados do pagamento */
     select
       codmovimento,
       F_LEFT(descricao, 35),
       es,
       desconto,
       datavencimento,
       codempresa
     from
       pagamentos
     where
       codigo = :codigo
     into
       :codmovimento,
       :descricao,
       :es,
       :valor,
       :datavencimento,
       :codempresa;
     /* pego o proximo codigo */
     select
       sequencia
     from
       seq_obter('PAGAMENTOS')
     into
       :codigo;
     /* acerto a descricao */
     descricao = 'ADIC ' || descricao;
     /* pego o numero novo */
     select
       max(numero) + 1
     from
       pagamentos
     where
       codmovimento = :codmovimento
     into
       :novonum;
     /* insiro o pagamento restante */
     insert into
       pagamentos (
         codigo,
         codmovimento,
         numero,
         descricao,
         es,
         datacadast,
         valor,
         externo,
         pago,
         desconto,
         multa_juros,
         datavencimento,
         saldoant,
         saldoatu,
         codconta,
         coddocumento,
         codempresa)
       values (
         :codigo,
         :codmovimento,
         :novonum,
         :descricao,
         :es,
         'NOW',
         :valor,
         'S',
         0,
         0,
         0,
         :datavencimento,
         0,
         0,
         :conta,
         :coddocumento,
         :codempresa);
   end
end!

ALTER TRIGGER PAGAMENTOS_BI0
ACTIVE BEFORE INSERT POSITION 0
as
  declare variable ultimo     integer;
  declare variable saldo      numeric(9, 2);
  declare variable saldonovo  numeric(9, 2);
begin
  /* esta pago? */
  if (new.pago = 1) then
   begin
    /* descubro o saldo anterior */
    select
      max(codlancto)
    from
      pagamentos
    where
      codconta = new.codconta and
      codempresa = new.codempresa
    into
      :ultimo;
    if (ultimo is not null) then
     begin
       select
         saldoatu
       from
         pagamentos
       where
         codlancto = :ultimo
       into
         :saldo;
     end else saldo = 0;
    /* pego o numero deste lancamento */
    select
      sequencia
    from
      seq_obter('LANCTO')
    into
      :ultimo;
    /* gravo os valores corretos */
    new.saldoant = saldo;
    if (new.es = 1) then
      saldonovo = saldo - new.total_pago;
    if (new.es = 2) then
      saldonovo = saldo + new.total_pago;
    new.saldoatu = saldonovo;
    new.nomeusuario = USER;
    new.datapago = 'NOW';
    new.codlancto = ultimo;
   end
end!

ALTER TRIGGER PAGAMENTOS_BU0
ACTIVE BEFORE UPDATE POSITION 0
as
  declare variable ultimo     integer;
  declare variable saldo      numeric(9, 2);
  declare variable saldonovo  numeric(9, 2);
begin
  /* esta pago? */
  if ((old.pago = 0) and (new.pago = 1)) then
   begin
    /* descubro o saldo anterior */
    select
      max(codlancto)
    from
      pagamentos
    where
      codconta = new.codconta and
      codempresa = new.codempresa
    into
      :ultimo;
    if (ultimo is not null) then
     begin
       select
         saldoatu
       from
         pagamentos
       where
         codlancto = :ultimo
       into
         :saldo;
     end else saldo = 0;
    /* pego o numero deste lancamento */
    select
      sequencia
    from
      seq_obter('LANCTO')
    into
      :ultimo;
    /* gravo os valores corretos */
    new.saldoant = saldo;
    if (new.es = 1) then
      saldonovo = saldo - new.total_pago;
    if (new.es = 2) then
      saldonovo = saldo + new.total_pago;
    new.saldoatu = saldonovo;
    new.nomeusuario = USER;
    new.datapago = 'NOW';
    new.codlancto = ultimo;
   end
end!

