/* ###################################### */
/* #                                    # */
/* #    alteracoes da    2 0 0 1        # */
/* #                                    # */
/* ###################################### */

/* campo que guarda localizacao do produto no estoque/amoxarifado */
ALTER TABLE PRODUTOS    ADD LOCAL    STR20!

/* controle de saldos das contas */
ALTER TABLE PAGAMENTOS  ADD SALDOANT DINHEIRO!
ALTER TABLE PAGAMENTOS  ADD SALDOATU DINHEIRO!

/* controle de contas nos lancamentos */
ALTER TABLE PAGAMENTOS  ADD CODCONTA INTEIRO_VALIDO!

/* valor inicial do campo */
UPDATE PAGAMENTOS SET CODCONTA = 11!

/* chave extrangeira para controle */
ALTER TABLE PAGAMENTOS ADD
  CONSTRAINT PAGAMENTOS_FK02
  FOREIGN KEY (CODCONTA) REFERENCES CONTAS (CODIGO)
  ON UPDATE CASCADE!

/* controle da sequencia dos lancamentos */
ALTER TABLE PAGAMENTOS  ADD CODLANCTO INTEIRO!

/* controle de quem faz os lancamentos */
ALTER TABLE PAGAMENTOS  ADD NOMEUSUARIO STR30!

/* apago os triggers e procedures que serao substituidos */
DROP TRIGGER   MOVIMENTOS_AFTINS!
DROP TRIGGER   MOVIMENTOS_AFTUPD!
DROP PROCEDURE GERAPARCELAS!

/* Novos triggers e procedures */

CREATE PROCEDURE GERAPARCELAS (
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
BEGIN
   SELECT
      CODDOC_AVISTA,
      CODDOC_PRAZO,
      CODCONTA_COMPRADEB,
      CODCONTA_VENDACRE
   FROM
      CONFIG_PADRAO
   INTO
      :DOCVISTA,
      :DOCPRAZO,
      :CODCONTA_COMPRADEB,
      :CODCONTA_VENDACRE;
   SELECT
      VALOR_TOTAL,
      CONDICAO,
      ES,
      DATA,
      TIPO
   FROM
      MOVIMENTOS
   WHERE
      CODIGO = :CODIGO
   INTO
      :TOTAL,
      :CONDICAO,
      :ES,
      :DATAMOV,
      :TIPO;
   if (ES = 1) then
     CODCONTA = CODCONTA_COMPRADEB;
   else
     CODCONTA = CODCONTA_VENDACRE;
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
          DESCRICAO = 'PARCELA ' || N || '/' || QUANTIDADE || ' DA COMPRA ' || CODIGO;
       ELSE
          DESCRICAO = 'PARCELA ' || N || '/' || QUANTIDADE || ' DA VENDA ' || CODIGO;
       SELECT SEQUENCIA FROM SEQUENCIA WHERE TABELA = 'PAGAMENTOS' INTO :CODPAG;
       UPDATE SEQUENCIA SET SEQUENCIA = :CODPAG WHERE TABELA = 'PAGAMENTOS';
       if (DIAS = 0) then
        begin
          CODDOC = DOCVISTA;
          if (TIPO IN (3, 6)) then
             CODPAGO = 1;
          else
             CODPAGO = 0;
        end else
        begin
          CODDOC = DOCPRAZO;
          CODPAGO = 0;
        end
       INSERT INTO PAGAMENTOS (CODIGO, CODMOVIMENTO, NUMERO, DESCRICAO, ES,
         VALOR, DATAVENCIMENTO, CODDOCUMENTO, PAGO, CODCONTA) VALUES (:CODPAG, :CODIGO, :N,
         :DESCRICAO, :ES, :PARCELA, :DATAMOV + :DIAS, :CODDOC, :CODPAGO, :CODCONTA);
      END
     UPDATE PAGAMENTOS SET VALOR = VALOR + (:TOTAL - (:PARCELA * :QUANTIDADE))
       WHERE CODMOVIMENTO = :CODIGO AND NUMERO = 1;
    END ELSE EXCEPTION CONDICAO_ERRADA;
END!

GRANT EXECUTE ON PROCEDURE GERAPARCELAS TO PUBLIC!

CREATE TRIGGER MOVIMENTOS_AFTINS FOR MOVIMENTOS
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
    IF (NEW.VALOR_TOTAL > 0) THEN
      EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
END!

CREATE TRIGGER MOVIMENTOS_AFTUPD FOR MOVIMENTOS
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  IF (NEW.ES IN (1, 2)) THEN
   IF ((NEW.VALOR_TOTAL <> OLD.VALOR_TOTAL) OR
      (NEW.TIPO IN (1, 2, 5)) OR
      ((NEW.TIPO = 3) AND (OLD.TIPO = 2)) OR
      ((NEW.TIPO = 6) AND (OLD.TIPO = 5)) OR
      (NEW.CONDICAO <> OLD.CONDICAO)) THEN
     EXECUTE PROCEDURE GERAPARCELAS(NEW.CODIGO);
  IF (NEW.ES = 9) THEN
     DELETE FROM PAGAMENTOS WHERE CODMOVIMENTO = NEW.CODIGO AND
       PAGO = 0;
END!

CREATE TRIGGER PAGAMENTOS_BI0 FOR PAGAMENTOS
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
      codconta = new.codconta
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

CREATE TRIGGER PAGAMENTOS_BU0 FOR PAGAMENTOS
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
      codconta = new.codconta
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

CREATE PROCEDURE LANCTO (
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALOR NUMERIC(9,2),
    CONTA INTEGER,
    TIPO CHAR(1) CHARACTER SET NONE)
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
      es)
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
    :es);
end!

GRANT EXECUTE ON PROCEDURE LANCTO TO PUBLIC!

CREATE PROCEDURE EXTRATO (
    CODCONTA INTEGER,
    DATAEX TIMESTAMP)
RETURNS (
    HORA TIMESTAMP,
    USUARIO VARCHAR(30) CHARACTER SET NONE,
    DESCRICAO VARCHAR(40) CHARACTER SET NONE,
    VALORCRE NUMERIC(9,2),
    SALDO NUMERIC(9,2),
    LETRA CHAR(1) CHARACTER SET NONE,
    VALORDEB NUMERIC(9,2))
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE CONTADOR INTEGER;
DECLARE VARIABLE SALDOANT NUMERIC(9,2);
begin
  /* pego o saldo anterior */
  select
    max(codlancto)
  from
    pagamentos
  where
    cast(datapago as date) < :dataex and
    codconta = :codconta
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
    es
  from
    pagamentos
  where
    codconta = :codconta and
    pago = 1 and
    cast(datapago as date) = :dataex
  order by
    codlancto
  into
    :hora,
    :usuario,
    :descricao,
    :valorcre,
    :saldo,
    :saldoant,
    :es
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
    suspend;
  end
end!

GRANT EXECUTE ON PROCEDURE EXTRATO TO PUBLIC!

ALTER TABLE PRODUTOS ADD LOCALIZACAO STR40!

CREATE PROCEDURE P_PRODUTOS 
RETURNS (
    CODIGO INTEGER,
    BARRA VARCHAR(14),
    DESCRICAO VARCHAR(60),
    QUANTIDADE NUMERIC(9,2),
    PRECOVENDA NUMERIC(9,2),
    LOCALIZACAO VARCHAR(40),
    PS CHAR(1))
AS
DECLARE VARIABLE CODSERVICO INTEGER;
DECLARE VARIABLE VALORSERVICO NUMERIC(9,2);
begin
  for
  select
    CODIGO,
    BARRA,
    DESCRICAO,
    QUANTIDADE,
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
    :QUANTIDADE,
    :PRECOVENDA,
    :LOCALIZACAO,
    :CODSERVICO,
    :PS
  do
  begin

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
          PRECOVENDA = PRECOVENDA + VALORSERVICO;

      end

    suspend;
   end
end!

GRANT EXECUTE ON PROCEDURE P_PRODUTOS TO PUBLIC!

ALTER PROCEDURE INFOVENDA (
    BARRA CHAR(14) CHARACTER SET NONE)
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
    BARRA = :BARRA AND VENDIDO = 'N' INTO CODIGO;
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
         INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO
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





