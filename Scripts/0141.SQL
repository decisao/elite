/*
** RELATORIOS DE ATIVACAO
*/

SET TERM ^ ;

CREATE PROCEDURE REL_ATIVACAO_ENTRADA 
RETURNS (
    CODEMPRESA INTEGER,
    RAZAOSOCIAL VARCHAR(60),
    DATA_ENTRADA TIMESTAMP,
    NF_ENTRADA INTEGER,
    APARELHO VARCHAR(60),
    SERIE VARCHAR(20),
    NUMERO_FONE VARCHAR(20),
    VALOR_TABELA NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    REBATE CHAR(1),
    VALOR_REBATE NUMERIC(9,2),
    DATA_ATIVACAO TIMESTAMP)
AS
DECLARE VARIABLE CODINDIVIDUO INTEGER;
DECLARE VARIABLE CODMOVSAIDA INTEGER;
begin

  /* seleciono as ativações */
  for
  select
    aparelo,
    serie,
    numero_fone,
    rebate,
    codindividuo,
    codmovsaida,
    codempresa
  from
    individuais
  where
    ativacao = 'S' and
    vendido = 'S' and
    ps = 'S'
  into
    :aparelho,
    :serie,
    :numero_fone,
    :rebate,
    :codindividuo,
    :codmovsaida,
    :codempresa
  do
  begin

    /* razao social da empresa */
    select
      cl.razaosocial
    from
      clientes cl
      join sisconfig si on
        (si.codcliente = cl.codigo)
    where
      si.codigo = :codempresa
    into
      :razaosocial;

    /* dados da compra e preco pago */
    select
      id.valor_venda,
      id.valor_pago,
      mo.data,
      mo.nota_numero
    from
      individuais id
      join movimentos mo on
        (mo.codigo = id.codmoventrada)
    where
      id.codigo = :codindividuo
    into
      :valor_tabela,
      :valor_pago,
      :data_entrada,
      :nf_entrada;

    /* data da ativacao */
    select
      mo.datafechamento
    from
      movimentos mo
    where
      mo.codigo = :codmovsaida
    into
      :data_ativacao;

    valor_rebate = null;
    if (rebate = 'S') then
      valor_rebate = valor_tabela - valor_pago;

    /* retorno os valores */
    suspend;
  end

end

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE REL_ATIVACAO_ENTRADA TO PUBLIC;

SET TERM ^ ;

CREATE PROCEDURE REL_ATIVACAO_REBATE6X
RETURNS (
    CODEMPRESA INTEGER,
    RAZAOSOCIAL VARCHAR(60),
    DATA_ENTRADA TIMESTAMP,
    NF_ENTRADA INTEGER,
    APARELHO VARCHAR(60),
    SERIE VARCHAR(20),
    NUMERO_FONE VARCHAR(20),
    VALOR_TABELA NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    REBATE CHAR(1),
    VALOR_REBATE NUMERIC(9,2),
    DATA_ATIVACAO TIMESTAMP)
AS
DECLARE VARIABLE CODINDIVIDUO INTEGER;
DECLARE VARIABLE CODMOVSAIDA INTEGER;
DECLARE VARIABLE PARCELAS INTEGER;
begin

  /* seleciono as ativações */
  for
  select
    aparelo,
    serie,
    numero_fone,
    rebate,
    codindividuo,
    codmovsaida,
    codempresa
  from
    individuais
  where
    ativacao = 'S' and
    vendido = 'S' and
    ps = 'S'
  into
    :aparelho,
    :serie,
    :numero_fone,
    :rebate,
    :codindividuo,
    :codmovsaida,
    :codempresa
  do
  begin

    /* razao social da empresa */
    select
      cl.razaosocial
    from
      clientes cl
      join sisconfig si on
        (si.codcliente = cl.codigo)
    where
      si.codigo = :codempresa
    into
      :razaosocial;

    /* dados da compra e preco pago */
    select
      id.valor_venda,
      id.valor_pago,
      mo.data,
      mo.nota_numero
    from
      individuais id
      join movimentos mo on
        (mo.codigo = id.codmoventrada)
    where
      id.codigo = :codindividuo
    into
      :valor_tabela,
      :valor_pago,
      :data_entrada,
      :nf_entrada;

    /* data da ativacao */
    select
      mo.datafechamento
    from
      movimentos mo
    where
      mo.codigo = :codmovsaida
    into
      :data_ativacao;

    /* numero parcelas */
    select
      count(*)
    from
      pagamentos
    where
      codmovimento = :codmovsaida
    into
      :parcelas;

    if (parcelas = 6) then
      rebate = 'S';

    valor_rebate = null;
    if (rebate = 'S') then
      valor_rebate = valor_tabela - valor_pago;

    /* retorno os valores */
    suspend;
  end

end

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE REL_ATIVACAO_REBATE6X TO PUBLIC;

SET TERM ^ ;

CREATE PROCEDURE REL_ATIVACAO_VENDAPOS
RETURNS (
    CODEMPRESA INTEGER,
    RAZAOSOCIAL VARCHAR(60),
    DATA_ENTRADA TIMESTAMP,
    NF_ENTRADA INTEGER,
    APARELHO VARCHAR(60),
    SERIE VARCHAR(20),
    NUMERO_FONE VARCHAR(20),
    VALOR_TABELA NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    REBATE CHAR(1),
    VALOR_REBATE NUMERIC(9,2),
    DATA_ATIVACAO TIMESTAMP)
AS
DECLARE VARIABLE CODINDIVIDUO INTEGER;
DECLARE VARIABLE CODMOVSAIDA INTEGER;
DECLARE VARIABLE PARCELAS INTEGER;
begin

  /* seleciono as ativações */
  for
  select
    id.aparelo,
    id.serie,
    id.numero_fone,
    id.rebate,
    id.codindividuo,
    id.codmovsaida,
    id.codempresa
  from
    individuais id
    join planos pl on
      (pl.codigo = id.codplano and
       pl.codoperadora = id.codoperadora)
  where
    id.ativacao = 'S' and
    id.vendido = 'S' and
    id.ps = 'S' and
    pl.tipo = 'D'
  into
    :aparelho,
    :serie,
    :numero_fone,
    :rebate,
    :codindividuo,
    :codmovsaida,
    :codempresa
  do
  begin

    /* razao social da empresa */
    select
      cl.razaosocial
    from
      clientes cl
      join sisconfig si on
        (si.codcliente = cl.codigo)
    where
      si.codigo = :codempresa
    into
      :razaosocial;

    /* dados da compra e preco pago */
    select
      id.valor_venda,
      id.valor_pago,
      mo.data,
      mo.nota_numero
    from
      individuais id
      join movimentos mo on
        (mo.codigo = id.codmoventrada)
    where
      id.codigo = :codindividuo
    into
      :valor_tabela,
      :valor_pago,
      :data_entrada,
      :nf_entrada;

    /* data da ativacao */
    select
      mo.datafechamento
    from
      movimentos mo
    where
      mo.codigo = :codmovsaida
    into
      :data_ativacao;

    /* numero parcelas */
    select
      count(*)
    from
      pagamentos
    where
      codmovimento = :codmovsaida
    into
      :parcelas;

    if (parcelas = 6) then
      rebate = 'S';

    valor_rebate = null;
    if (rebate = 'S') then
      valor_rebate = valor_tabela - valor_pago;

    /* retorno os valores */
    suspend;
  end

end

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE REL_ATIVACAO_VENDAPOS TO PUBLIC;

SET TERM ^ ;

CREATE PROCEDURE REL_ATIVACAO_VENDAPRE
RETURNS (
    CODEMPRESA INTEGER,
    RAZAOSOCIAL VARCHAR(60),
    DATA_ENTRADA TIMESTAMP,
    NF_ENTRADA INTEGER,
    APARELHO VARCHAR(60),
    SERIE VARCHAR(20),
    NUMERO_FONE VARCHAR(20),
    VALOR_TABELA NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    REBATE CHAR(1),
    VALOR_REBATE NUMERIC(9,2),
    DATA_ATIVACAO TIMESTAMP)
AS
DECLARE VARIABLE CODINDIVIDUO INTEGER;
DECLARE VARIABLE CODMOVSAIDA INTEGER;
DECLARE VARIABLE PARCELAS INTEGER;
begin

  /* seleciono as ativações */
  for
  select
    id.aparelo,
    id.serie,
    id.numero_fone,
    id.rebate,
    id.codindividuo,
    id.codmovsaida,
    id.codempresa
  from
    individuais id
    join planos pl on
      (pl.codigo = id.codplano and
       pl.codoperadora = id.codoperadora)
  where
    id.ativacao = 'S' and
    id.vendido = 'S' and
    id.ps = 'S' and
    pl.tipo = 'C'
  into
    :aparelho,
    :serie,
    :numero_fone,
    :rebate,
    :codindividuo,
    :codmovsaida,
    :codempresa
  do
  begin

    /* razao social da empresa */
    select
      cl.razaosocial
    from
      clientes cl
      join sisconfig si on
        (si.codcliente = cl.codigo)
    where
      si.codigo = :codempresa
    into
      :razaosocial;

    /* dados da compra e preco pago */
    select
      id.valor_venda,
      id.valor_pago,
      mo.data,
      mo.nota_numero
    from
      individuais id
      join movimentos mo on
        (mo.codigo = id.codmoventrada)
    where
      id.codigo = :codindividuo
    into
      :valor_tabela,
      :valor_pago,
      :data_entrada,
      :nf_entrada;

    /* data da ativacao */
    select
      mo.datafechamento
    from
      movimentos mo
    where
      mo.codigo = :codmovsaida
    into
      :data_ativacao;

    /* numero parcelas */
    select
      count(*)
    from
      pagamentos
    where
      codmovimento = :codmovsaida
    into
      :parcelas;

    if (parcelas = 6) then
      rebate = 'S';

    valor_rebate = null;
    if (rebate = 'S') then
      valor_rebate = valor_tabela - valor_pago;

    /* retorno os valores */
    suspend;
  end

end

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE REL_ATIVACAO_VENDAPRE TO PUBLIC;

SET TERM ^ ;

CREATE PROCEDURE REL_ATIVACAO_SIMPLES
RETURNS (
    CODEMPRESA INTEGER,
    RAZAOSOCIAL VARCHAR(60),
    DATA_ENTRADA TIMESTAMP,
    NF_ENTRADA INTEGER,
    APARELHO VARCHAR(60),
    SERIE VARCHAR(20),
    NUMERO_FONE VARCHAR(20),
    VALOR_TABELA NUMERIC(9,2),
    VALOR_PAGO NUMERIC(9,2),
    REBATE CHAR(1),
    VALOR_REBATE NUMERIC(9,2),
    DATA_ATIVACAO TIMESTAMP,
    PREPOS VARCHAR(30))
AS
DECLARE VARIABLE CODINDIVIDUO INTEGER;
DECLARE VARIABLE CODMOVSAIDA INTEGER;
DECLARE VARIABLE PARCELAS INTEGER;
DECLARE VARIABLE TIPO CHAR(1);
begin

  /* seleciono as ativações */
  for
  select
    id.aparelo,
    id.serie,
    id.numero_fone,
    id.rebate,
    id.codindividuo,
    id.codmovsaida,
    id.codempresa,
    pl.tipo
  from
    individuais id
    join planos pl on
      (pl.codigo = id.codplano and
       pl.codoperadora = id.codoperadora)
  where
    id.ativacao = 'S' and
    id.vendido = 'S' and
    id.ps = 'S' and
    id.codindividuo is null
  into
    :aparelho,
    :serie,
    :numero_fone,
    :rebate,
    :codindividuo,
    :codmovsaida,
    :codempresa,
    :tipo
  do
  begin

    /* razao social da empresa */
    select
      cl.razaosocial
    from
      clientes cl
      join sisconfig si on
        (si.codcliente = cl.codigo)
    where
      si.codigo = :codempresa
    into
      :razaosocial;

    valor_tabela = null;
    valor_pago   = null;
    valor_rebate = null;
    data_entrada = null;
    nf_entrada   = null;

    /* data da ativacao */
    select
      mo.datafechamento
    from
      movimentos mo
    where
      mo.codigo = :codmovsaida
    into
      :data_ativacao;

    /* tipo do plano */
    if (tipo = 'C') then
      prepos = 'PRE-PAGO';
    else
      prepos = 'POS-PAGO';

    /* retorno os valores */
    suspend;
  end

end

^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE REL_ATIVACAO_SIMPLES TO PUBLIC;

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (141, CURRENT_TIMESTAMP);