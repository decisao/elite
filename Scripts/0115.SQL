/*
** LIMITES DE SAIDA DE PRODUTOS E SERVICOS POR NOTA/OS
*/

SET TERM !;

CREATE PROCEDURE LIMITES_SAIDA (
    CODEMPRESA INTEGER)
RETURNS (
    METODO CHAR(1),
    PRODUTOS INTEGER,
    SERVICOS INTEGER)
AS
DECLARE VARIABLE NOTA_PADRAO INTEGER;
DECLARE VARIABLE OSABERTA_PADRAO INTEGER;
DECLARE VARIABLE OSABERTA_PADRAO_2A INTEGER;
DECLARE VARIABLE OSFECHADA_PADRAO INTEGER;
begin

  /* verifico se utiliza impressão gráfica ou somente texto */
  select
    nota_padrao,
    osaberta_padrao,
    osaberta_padrao_2a,
    osfechada_padrao
  from
    sisconfig
  where
    codigo = :codempresa
  into
    :nota_padrao,
    :osaberta_padrao,
    :osaberta_padrao_2a,
    :osfechada_padrao;

  /* se todos estiverem apontados, uso somente texto */
  if ((nota_padrao is not null) and
     ((osaberta_padrao is not null) or
      (osaberta_padrao_2a is not null)) and
      (osfechada_padrao is not null)) then
    metodo = 'T';
  else
    metodo = 'G';

  /* se for houver gráficos, o limite é do programa executável */
  if ((metodo = 'G') and (nota_padrao is null)) then
   begin
    produtos = -1;
    servicos = -1;
   end else
   begin

     /* se for somente texto, procuro o menor limite de cada um */
     select
       min(pro_linhas),
       min(ser_linhas)
     from
       impnota
     where
       numimpnota = :nota_padrao or
       numimpnota = :osaberta_padrao or
       numimpnota = :osaberta_padrao_2a or
       numimpnota = :osfechada_padrao
     into
       :produtos,
       :servicos;

   end

  suspend;
end!

GRANT EXECUTE ON PROCEDURE LIMITES_SAIDA TO PUBLIC!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (115, CURRENT_TIMESTAMP)!