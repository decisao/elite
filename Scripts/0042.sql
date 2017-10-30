/* unificação dos cadastros */

CREATE DOMAIN DOM_TIPOPESSOA AS CHAR(1) NOT NULL 
   CHECK (VALUE IN ('C', 'F', 'A', 'T', '3'))!

ALTER TABLE CLIENTES ADD NOMEUSER      STR30_VALIDO!
ALTER TABLE CLIENTES ADD DESCONTO      DINHEIRO!
ALTER TABLE CLIENTES ADD FINANCEIRO    SIMNAO!
ALTER TABLE CLIENTES ADD ESTORNO       SIMNAO!
ALTER TABLE CLIENTES ADD CODEMPRESA    INTEIRO_VALIDO!
ALTER TABLE CLIENTES ADD TROCAVENDEDOR SIMNAO!
ALTER TABLE CLIENTES ADD INTERNET      SIMNAO!
ALTER TABLE CLIENTES ADD MUDAEMPRESA   SIMNAO!
ALTER TABLE CLIENTES ADD COMISSAO      DINHEIRO!
ALTER TABLE CLIENTES ADD TIPO          DOM_TIPOPESSOA!

CREATE PROCEDURE CONFIG_PESSOAS1 
AS
DECLARE VARIABLE NOMEUSER VARCHAR(30);
DECLARE VARIABLE CODIGO INTEGER;
begin

  for
  select
    codigo
  from
    clientes
  into
    :codigo
  do
  begin

    nomeuser = 'CLI' || codigo;

    update
      clientes
    set
      nomeuser   = :nomeuser,
      desconto   = 0,
      codempresa = 1,
      comissao   = 0,
      tipo       = 'C'
    where
      codigo     = :codigo;

  end

end!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (42, CURRENT_TIMESTAMP)!
