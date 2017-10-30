/* novos recursos */

CREATE PROCEDURE P_OS 
RETURNS (
    CODIGO INTEGER,
    DATA TIMESTAMP,
    PRIORIDADE INTEGER,
    STATUS VARCHAR(20),
    NOTA_NUMERO INTEGER,
    NOME VARCHAR(40),
    SERIE VARCHAR(30),
    VALOR_TOTAL NUMERIC(9,2),
    VALOR_ABERTO NUMERIC(9,2))
AS
DECLARE VARIABLE TIPO INTEGER;
begin

  for
  select
    mo.codigo,
    mo.data,
    mo.prioridade,
    mo.status,
    mo.nota_numero,
    cl.nome,
    mo.serie,
    mo.valor_total,
    mo.tipo
  from
    movimentos mo
    left join clientes cl on
      (mo.codcliente = cl.codigo)
  where
    es = 2
  into
    :codigo,
    :data,
    :prioridade,
    :status,
    :nota_numero,
    :nome,
    :serie,
    :valor_total,
    :tipo
  do
  begin

    valor_aberto = null;

    /* verifico se esta fechada a saida */
    if (tipo in (3, 6)) then
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

    /* retorno */
    suspend;
  end
end!

GRANT EXECUTE ON PROCEDURE P_OS TO PUBLIC!

CREATE PROCEDURE ULTIMAOS (
    CODCLIENTE INTEGER)
RETURNS (
    NUMERO_OS INTEGER,
    DATA TIMESTAMP,
    SOLICITANTE VARCHAR(40) CHARACTER SET NONE,
    RESPONSAVEL VARCHAR(40) CHARACTER SET NONE,
    OUTRAS_ABERTAS INTEGER,
    TODAS_FECHADAS INTEGER,
    TOTAL_FECHADAS NUMERIC(9,2),
    NUMERO_ULTIMA INTEGER,
    DATA_ULTIMA TIMESTAMP,
    VALOR_ULTIMA NUMERIC(9,2),
    SOLICITANTE_ULTIMA VARCHAR(40) CHARACTER SET NONE)
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
       left join vendedores ve on
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

GRANT EXECUTE ON PROCEDURE ULTIMAOS TO PUBLIC!

ALTER PROCEDURE P_OS 
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
begin

  for
  select
    mo.codigo,
    mo.data,
    mo.prioridade,
    mo.status,
    mo.nota_numero,
    cl.nome,
    mo.serie,
    mo.valor_total,
    mo.tipo
  from
    movimentos mo
    left join clientes cl on
      (mo.codcliente = cl.codigo)
  where
    es = 2 and
    tipo in (2, 3, 5, 6)
  into
    :codigo,
    :data,
    :prioridade,
    :status,
    :nota_numero,
    :nome,
    :serie,
    :valor_total,
    :tipo
  do
  begin

    valor_aberto = null;

    /* verifico se esta fechada a saida */
    if (tipo in (3, 6)) then
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

    /* retorno */
    suspend;
  end
end!