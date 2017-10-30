/* correção do erro das parcelas */

CREATE EXCEPTION "VALOR_PARCELA" 'O Valor das Parcelas deve ser igual ou superior ao Total'!

ALTER PROCEDURE "AUTOBAIXA" 
(
  CODMOVIMENTO INTEGER
)
AS

DECLARE VARIABLE CODDOC_AVISTA INTEGER;
DECLARE VARIABLE CODIGO INTEGER;
DECLARE VARIABLE CODDOCUMENTO INTEGER;
DECLARE VARIABLE DATAVENCIMENTO TIMESTAMP;
DECLARE VARIABLE PAGO INTEGER;
DECLARE VARIABLE PARCELA_TOTAL NUMERIC(9,2);
DECLARE VARIABLE MOVIMENTO_TOTAL NUMERIC(9,2);
begin
  /* verifico se os valores sao correspondentes */
  select
    sum(valor)
  from
    pagamentos
  where
    codmovimento = :codmovimento
  into
    :parcela_total;

  select
    nota_valor_total
  from
    movimentos
  where
    codigo = :codmovimento
  into
    :movimento_total;

  if (movimento_total > parcela_total) then
    exception valor_parcela;

  /* qual é o documento a vista? */
  select
    coddoc_avista
  from
    config_padrao
  into
    :coddoc_avista;
  /* procuro os pagamentos, algum é a vista? */
  for
  select
    codigo,
    coddocumento,
    datavencimento,
    pago
  from
    pagamentos
  where
    codmovimento = :codmovimento
  into
    :codigo,
    :coddocumento,
    :datavencimento,
    :pago
  do
  begin
    /* o documento é a vista? */
    if ((coddocumento = coddoc_avista) and (pago = 0)) then
     begin
      /* faço o lançamento */
      update
        pagamentos
      set
        pago = 1
      where
        codigo = :codigo;
     end
  end
end!

alter trigger MOVIMENTOS_AFTUPD
ACTIVE After Update position 0
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

