ALTER PROCEDURE P_PRODUTOS 
RETURNS (
    CODIGO INTEGER,
    BARRA VARCHAR(14) CHARACTER SET NONE,
    DESCRICAO VARCHAR(60) CHARACTER SET NONE,
    QUANTIDADE NUMERIC(9,2),
    PRECOVENDA NUMERIC(9,2),
    LOCALIZACAO VARCHAR(40) CHARACTER SET NONE,
    PS CHAR(1) CHARACTER SET NONE,
    PRECOTOTAL NUMERIC(9,2))
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

ALTER PROCEDURE ESTORNO (
    CODMOVIMENTO INTEGER)
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE NUMERO INTEGER;
DECLARE VARIABLE CODDOCUMENTO INTEGER;
DECLARE VARIABLE INFODOC VARCHAR(50);
DECLARE VARIABLE CODCONTA INTEGER;
DECLARE VARIABLE TOTAL_PAGO NUMERIC(9,2);
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE DESCRICAO VARCHAR(40);
DECLARE VARIABLE NOME VARCHAR(40);
DECLARE VARIABLE CODIGO INTEGER;
begin

  /* marco como cancelado */
  update
    movimentos
  set
    tipo = 9
  where
    codigo = :codmovimento;

  /* devolvo os produtos */
  update
    individuais
  set
    vendido = 'N'
  where
    codmovsaida = :codmovimento;

  /* verifico os pagamentos e estorno 1 a 1 */
  for
  select
    es,
    numero,
    coddocumento,
    infodoc,
    codconta,
    total_pago,
    datavencimento
  from
    pagamentos
  where
    codmovimento = :codmovimento and
    pago = 1
  into
    :es,
    :numero,
    :coddocumento,
    :infodoc,
    :codconta,
    :total_pago,
    :datavencimento
  do
  begin

    /* pego o nome do cliente */
    if (es = 1) then
     begin

       select
         fo.nome
       from
         movimentos mo
         join fornecedores fo on
           (fo.codigo = mo.codfornecedor)
       where
         mo.codigo = :codmovimento
       into
         :nome;

     end else
     begin

       select
         cl.nome
       from
         movimentos mo
         join clientes cl on
           (cl.codigo = mo.codcliente)
       where
         mo.codigo = :codmovimento
       into
         :nome;

     end

    /* monto a descricao */
    if (es = 1) then
      descricao = 'ESTORNO PARC ' || numero || ' DA COMPRA ' || codmovimento || ' ' || f_left(nome, 8);
    else
      descricao = 'ESTORNO PARC ' || numero || ' DA VENDA ' || codmovimento || ' ' || f_left(nome, 8);

    /* inverto a condicao pagar/receber */
    if (es = 1) then
      es = 2;
    else es = 1;

    /* pego o codigo do lancamento */
    select
      sequencia
    from
      seq_obter('PAGAMENTOS')
    into
      :codigo;

    /* gravo o estorno da parcela */
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
        infodoc)
      values (
        :codigo,
        :codmovimento,
        :numero,
        :descricao,
        :es,
        'NOW',
        :total_pago,
        'S',
        0,
        0,
        0,
        'NOW',
        0,
        0,
        :codconta,
        :coddocumento,
        :infodoc);

  end
    
end!

DROP TRIGGER INDIVIDUAIS_AFTINS!

DROP TRIGGER INDIVIDUAIS_AFTUPD!

DROP TRIGGER INDIVIDUAIS_AFTDEL!

ALTER PROCEDURE REL_NOTACORPO (
    CODMOVIMENTO INTEGER)
RETURNS (
    ES SMALLINT,
    CODCLIENTE INTEGER,
    CODFORNECEDOR INTEGER,
    DATA TIMESTAMP,
    SERVICOS VARCHAR(254) CHARACTER SET NONE,
    VALOR_SERVICOS NUMERIC(9,2),
    VALOR_ITENS NUMERIC(9,2),
    DESCONTO NUMERIC(9,2),
    VALOR_PRODUTOS NUMERIC(9,2),
    VALOR_ICMS NUMERIC(9,2),
    VALOR_TOTAL NUMERIC(9,2),
    OBSERVACOES VARCHAR(2048) CHARACTER SET NONE,
    NOTA_NUMERO INTEGER,
    NOTA_DATAEMISSAO TIMESTAMP,
    NOTA_CODNATUOPER INTEGER,
    NOTA_CODTRANSPORTADOR INTEGER,
    NOTA_PLACAVEICULO VARCHAR(10) CHARACTER SET NONE,
    NOTA_UFVEICULO VARCHAR(2) CHARACTER SET NONE,
    NOTA_FRETE SMALLINT,
    NOTA_VALOR_FRETE NUMERIC(9,2),
    NOTA_VALOR_SEGURO NUMERIC(9,2),
    NOTA_VALOR_OUTROS NUMERIC(9,2),
    NOTA_VALOR_TOTAL NUMERIC(9,2),
    NOTA_QUANTIDADE NUMERIC(9,2),
    NOTA_ESPECIE VARCHAR(30) CHARACTER SET NONE,
    NOTA_MARCA VARCHAR(20) CHARACTER SET NONE,
    NOTA_VOLNUM INTEGER,
    NOTA_PESOBRUTO NUMERIC(9,2),
    NOTA_PESOLIQUIDO NUMERIC(9,2),
    NOTA_DADOSADICIONAIS VARCHAR(1024) CHARACTER SET NONE,
    CODVENDEDOR INTEGER,
    STATUS VARCHAR(20) CHARACTER SET NONE,
    CONDICAO VARCHAR(40) CHARACTER SET NONE,
    DATAINICIO TIMESTAMP,
    DATATERMINO TIMESTAMP,
    ICMSSIMPLES CHAR(1) CHARACTER SET NONE,
    ICMSSIMPALIQ NUMERIC(9,4),
    ISSALIQ NUMERIC(9,4),
    VALOR_ISS NUMERIC(9,2),
    NOTA_IESUBST VARCHAR(20) CHARACTER SET NONE,
    NOTA_DATASAIDA TIMESTAMP,
    NOTA_BASEICMS NUMERIC(9,4),
    NOTA_BASEICMSSUBST NUMERIC(9,4),
    NOTA_VALORICMSSUBST NUMERIC(9,2),
    VALOR_IPI NUMERIC(9,2),
    CODVENDEDOR_ABRE INTEGER,
    DESCONTOTXT VARCHAR(40) CHARACTER SET NONE,
    CLI_NOME VARCHAR(40) CHARACTER SET NONE,
    CLI_LOGRADOURO VARCHAR(40) CHARACTER SET NONE,
    CLI_NUMERO INTEGER,
    CLI_COMPLEMENTO VARCHAR(40) CHARACTER SET NONE,
    CLI_BAIRRO VARCHAR(60) CHARACTER SET NONE,
    CLI_CEP VARCHAR(10) CHARACTER SET NONE,
    CLI_CIDADE VARCHAR(60) CHARACTER SET NONE,
    CLI_ESTADO VARCHAR(2) CHARACTER SET NONE,
    CLI_FONE VARCHAR(20) CHARACTER SET NONE,
    CLI_FAX VARCHAR(20) CHARACTER SET NONE,
    CLI_EMAIL VARCHAR(50) CHARACTER SET NONE,
    CLI_RGIE VARCHAR(20) CHARACTER SET NONE,
    CLI_CPFCGC VARCHAR(20) CHARACTER SET NONE,
    TRA_NOME VARCHAR(40) CHARACTER SET NONE,
    TRA_LOGRADOURO VARCHAR(40) CHARACTER SET NONE,
    TRA_NUMERO INTEGER,
    TRA_COMPLEMENTO VARCHAR(40) CHARACTER SET NONE,
    TRA_BAIRRO VARCHAR(60) CHARACTER SET NONE,
    TRA_CEP VARCHAR(10) CHARACTER SET NONE,
    TRA_CIDADE VARCHAR(60) CHARACTER SET NONE,
    TRA_ESTADO VARCHAR(2) CHARACTER SET NONE,
    TRA_FONE VARCHAR(20) CHARACTER SET NONE,
    TRA_FAX VARCHAR(20) CHARACTER SET NONE,
    TRA_EMAIL VARCHAR(50) CHARACTER SET NONE,
    TRA_RGIE VARCHAR(20) CHARACTER SET NONE,
    TRA_CPFCGC VARCHAR(20) CHARACTER SET NONE,
    CODIGO INTEGER,
    MARCA VARCHAR(40) CHARACTER SET NONE,
    MODELO VARCHAR(40) CHARACTER SET NONE,
    DEFEITO VARCHAR(40) CHARACTER SET NONE,
    GARANTIA CHAR(1) CHARACTER SET NONE,
    SERIE VARCHAR(40) CHARACTER SET NONE,
    ACESSORIOS VARCHAR(40) CHARACTER SET NONE,
    CONDICAOEXTERNA VARCHAR(40) CHARACTER SET NONE,
    SOLICITANTE VARCHAR(40) CHARACTER SET NONE,
    VENDEDORABRE VARCHAR(40) CHARACTER SET NONE,
    VENDEDOR VARCHAR(40) CHARACTER SET NONE)
AS
DECLARE VARIABLE TEMP_PESSOAFISICA CHAR(1);
DECLARE VARIABLE TEMP_RAZAOSOCIAL VARCHAR(40);
DECLARE VARIABLE TEMP_IE VARCHAR(20);
DECLARE VARIABLE TEMP_CGC VARCHAR(20);
DECLARE VARIABLE CODMARCA INTEGER;
DECLARE VARIABLE CODMODELO INTEGER;
DECLARE VARIABLE CODDEFEITO INTEGER;
BEGIN
  SELECT
    CODIGO,
    ES,
    CODCLIENTE,
    CODFORNECEDOR,
    DATA,
    F_LEFT(SERVICOS, 254),
    VALOR_SERVICOS,
    VALOR_ITENS,
    DESCONTO,
    VALOR_PRODUTOS,
    VALOR_ICMS,
    VALOR_TOTAL,
    OBSERVACOES,
    NOTA_NUMERO,
    NOTA_DATAEMISSAO,
    NOTA_CODNATUOPER,
    NOTA_CODTRANSPORTADOR,
    NOTA_PLACAVEICULO,
    NOTA_UFVEICULO,
    NOTA_FRETE,
    NOTA_VALOR_FRETE,
    NOTA_VALOR_SEGURO,
    NOTA_VALOR_OUTROS,
    NOTA_VALOR_TOTAL,
    NOTA_QUANTIDADE,
    NOTA_ESPECIE,
    NOTA_MARCA,
    NOTA_VOLNUM,
    NOTA_PESOBRUTO,
    NOTA_PESOLIQUIDO,
    NOTA_DADOSADICIONAIS,
    CODVENDEDOR,
    STATUS,
    CONDICAO,
    DATAINICIO,
    DATATERMINO,
    ICMSSIMPLES,
    ICMSSIMPALIQ,
    ISSALIQ,
    VALOR_ISS,
    NOTA_IESUBST,
    NOTA_DATASAIDA,
    NOTA_BASEICMS,
    NOTA_BASEICMSSUBST,
    NOTA_VALORICMSSUBST,
    VALOR_IPI,
    CODVENDEDOR_ABRE,
    DESCONTOTXT,
    CODMARCA,
    CODMODELO,
    CODDEFEITO,
    GARANTIA,
    SERIE,
    ACESSORIOS,
    CONDICAOEXTERNA,
    SOLICITANTE
  FROM
    MOVIMENTOS MO
  WHERE
    CODIGO = :CODMOVIMENTO
  INTO
    :CODIGO,
    :ES,
    :CODCLIENTE,
    :CODFORNECEDOR,
    :DATA,
    :SERVICOS,
    :VALOR_SERVICOS,
    :VALOR_ITENS,
    :DESCONTO,
    :VALOR_PRODUTOS,
    :VALOR_ICMS,
    :VALOR_TOTAL,
    :OBSERVACOES,
    :NOTA_NUMERO,
    :NOTA_DATAEMISSAO,
    :NOTA_CODNATUOPER,
    :NOTA_CODTRANSPORTADOR,
    :NOTA_PLACAVEICULO,
    :NOTA_UFVEICULO,
    :NOTA_FRETE,
    :NOTA_VALOR_FRETE,
    :NOTA_VALOR_SEGURO,
    :NOTA_VALOR_OUTROS,
    :NOTA_VALOR_TOTAL,
    :NOTA_QUANTIDADE,
    :NOTA_ESPECIE,
    :NOTA_MARCA,
    :NOTA_VOLNUM,
    :NOTA_PESOBRUTO,
    :NOTA_PESOLIQUIDO,
    :NOTA_DADOSADICIONAIS,
    :CODVENDEDOR,
    :STATUS,
    :CONDICAO,
    :DATAINICIO,
    :DATATERMINO,
    :ICMSSIMPLES,
    :ICMSSIMPALIQ,
    :ISSALIQ,
    :VALOR_ISS,
    :NOTA_IESUBST,
    :NOTA_DATASAIDA,
    :NOTA_BASEICMS,
    :NOTA_BASEICMSSUBST,
    :NOTA_VALORICMSSUBST,
    :VALOR_IPI,
    :CODVENDEDOR_ABRE,
    :DESCONTOTXT,
    :CODMARCA,
    :CODMODELO,
    :CODDEFEITO,
    :GARANTIA,
    :SERIE,
    :ACESSORIOS,
    :CONDICAOEXTERNA,
    :SOLICITANTE;
  SELECT
    CL.NOME,
    F_LEFT(CL.RAZAOSOCIAL, 40),
    CL.PESSOAFISICA,
    CL.NUMERO,
    CL.COMPLEMENTO,
    CL.ESTADO,
    CL.FONE,
    CL.FAX,
    CL.EMAIL,
    CL.RG,
    CL.CPF,
    CL.IE,
    CL.CGC,
    LO.LOGRADOURO,
    BA.BAIRRO,
    CI.CIDADE,
    LO.CEP
  FROM
    CLIENTES CL
    LEFT JOIN LOGRADOUROS LO ON
      ( LO.CODIGO = CL.LOCALIZACAO AND
        LO.BAIRRO = CL.BAIRRO AND
        LO.CIDADE = CL.CIDADE AND
        LO.ESTADO = CL.ESTADO )
    LEFT JOIN BAIRROS BA ON
      ( BA.CODIGO = CL.BAIRRO AND
        BA.CIDADE = CL.CIDADE AND
        BA.ESTADO = CL.ESTADO )
    LEFT JOIN CIDADES CI ON
      ( CI.CODIGO = CL.CIDADE AND
        CI.ESTADO = CL.ESTADO )
  WHERE
    CL.CODIGO = :CODCLIENTE
  INTO
    :CLI_NOME,
    :TEMP_RAZAOSOCIAL,
    :TEMP_PESSOAFISICA,
    :CLI_NUMERO,
    :CLI_COMPLEMENTO,
    :CLI_ESTADO,
    :CLI_FONE,
    :CLI_FAX,
    :CLI_EMAIL,
    :CLI_RGIE,
    :CLI_CPFCGC,
    :TEMP_IE,
    :TEMP_CGC,
    :CLI_LOGRADOURO,
    :CLI_BAIRRO,
    :CLI_CIDADE,
    :CLI_CEP;
  IF ( TEMP_PESSOAFISICA = 'J' ) THEN
   BEGIN
     CLI_NOME   = TEMP_RAZAOSOCIAL;
     CLI_RGIE   = TEMP_IE;
     CLI_CPFCGC = TEMP_CGC;
   END
  SELECT
    TR.NOME,
    F_LEFT(TR.RAZAOSOCIAL, 40),
    TR.PESSOAFISICA,
    TR.NUMERO,
    TR.COMPLEMENTO,
    TR.ESTADO,
    TR.FONE,
    TR.FAX,
    TR.EMAIL,
    TR.RG,
    TR.CPF,
    TR.IE,
    TR.CGC,
    LO.LOGRADOURO,
    BA.BAIRRO,
    CI.CIDADE,
    LO.CEP
  FROM
    TRANSPORTADORES TR
    LEFT JOIN LOGRADOUROS LO ON
      ( LO.CODIGO = TR.LOCALIZACAO AND
        LO.BAIRRO = TR.BAIRRO AND
        LO.CIDADE = TR.CIDADE AND
        LO.ESTADO = TR.ESTADO )
    LEFT JOIN BAIRROS BA ON
      ( BA.CODIGO = TR.BAIRRO AND
        BA.CIDADE = TR.CIDADE AND
        BA.ESTADO = TR.ESTADO )
    LEFT JOIN CIDADES CI ON
      ( CI.CODIGO = TR.CIDADE AND
        CI.ESTADO = TR.ESTADO )
  WHERE
    TR.CODIGO = :CODCLIENTE
  INTO
    :TRA_NOME,
    :TEMP_RAZAOSOCIAL,
    :TEMP_PESSOAFISICA,
    :TRA_NUMERO,
    :TRA_COMPLEMENTO,
    :TRA_ESTADO,
    :TRA_FONE,
    :TRA_FAX,
    :TRA_EMAIL,
    :TRA_RGIE,
    :TRA_CPFCGC,
    :TEMP_IE,
    :TEMP_CGC,
    :TRA_LOGRADOURO,
    :TRA_BAIRRO,
    :TRA_CIDADE,
    :TRA_CEP;
  IF ( TEMP_PESSOAFISICA = 'J' ) THEN
   BEGIN
     TRA_NOME   = TEMP_RAZAOSOCIAL;
     TRA_RGIE   = TEMP_IE;
     TRA_CPFCGC = TEMP_CGC;
   END
  select
    nome
  from
    vendedores
  where
    codigo = :codvendedor_abre
  into
    :vendedorabre;
  select
    nome
  from
    vendedores
  where
    codigo = :codvendedor
  into
    :vendedor;
  SELECT
    DESCRICAO
  FROM
    MARCAS
  WHERE
    CODIGO = :CODMARCA
  INTO
    :MARCA;
  SELECT
    DESCRICAO
  FROM
    MODELOS
  WHERE
    CODIGO = :CODMODELO AND
    CODEQUIPAMENTO = :CODMARCA
  INTO
    :MODELO;
  SELECT
    DESCRICAO
  FROM
    DEFEITOS
  WHERE
    CODIGO = :CODDEFEITO
  INTO
    :DEFEITO;
 SUSPEND;
END!
