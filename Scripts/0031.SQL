/* alteraçoes no orçamento */

CREATE TRIGGER ORSOMA_UPD FOR TEMPITENS
ACTIVE AFTER UPDATE POSITION 0
as
  declare variable diferenca numeric(9, 2);
begin
  /* diferença */
  diferenca = new.valor_total - old.valor_total;

  /* atualizo o valor */
  update
    movimentos
  set
    valor_itens = valor_itens + :diferenca
  where
    codigo = old.codmovimento;
end!

CREATE EXCEPTION COMPRA_ALTER "O movimento nao pode ser modificado"!

alter trigger TEMPITENS_BEFUPD01
ACTIVE Before Update position 0
as
    declare variable BARRA CHAR(14);
    declare variable tipo  integer;
begin
    /* VERIFICO SE EXISTE CÓDIGO DE BARRAS VÁLIDO */
    SELECT BARRA FROM PRODUTOS WHERE CODIGO = NEW.CODPRODUTO INTO :BARRA;
    if (BARRA = '0000000000000') then
        EXCEPTION BARRA_NECESSARIA;
        
    select
      es
    from
      movimentos
    where
      codigo = old.codmovimento
    into
      :tipo;
    if (tipo > 0) then
      exception compra_alter;
end!

