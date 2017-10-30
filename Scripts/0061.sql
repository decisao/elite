
ALTER TABLE PRODUTOS ADD OCULTO SIMNAO!

ALTER PROCEDURE P_PRODUTOS (
    EMPRESA INTEGER)
RETURNS (
    CODIGO INTEGER,
    BARRA VARCHAR (14),
    DESCRICAO VARCHAR (60),
    QUANTIDADE NUMERIC (9, 2),
    PRECOVENDA NUMERIC (9, 2),
    LOCALIZACAO VARCHAR (40),
    PS CHAR (1),
    PRECOTOTAL NUMERIC (9, 2),
    OCULTO CHAR(1))
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
    PS,
    OCULTO
  from
    PRODUTOS
  order by
    DESCRICAO
  into
    :CODIGO,
    :BARRA,
    :DESCRICAO,
    :PRECOVENDA,
    :LOCALIZACAO,
    :CODSERVICO,
    :PS,
    :OCULTO
  do
  begin
    PRECOTOTAL = NULL;

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

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (61, CURRENT_TIMESTAMP)!
