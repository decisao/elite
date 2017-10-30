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
       valor - desconto,
       datavencimento
     from
       pagamentos
     where
       codigo = :codigo
     into
       :codmovimento,
       :descricao,
       :es,
       :valor,
       :datavencimento;

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
         coddocumento)
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
         :coddocumento);

   end

end!

