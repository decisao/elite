/* atualiza o cadastro de clientes */

EXECUTE PROCEDURE COPIA_TRANSPORTADORES!

DROP PROCEDURE COPIA_TRANSPORTADORES!

ALTER TABLE CLIENTES ADD CODASSOCIADO INTEIRO!

CREATE PROCEDURE COPIA_ASSOCIADOS
AS
declare variable codigo        integer;
declare variable pessoafisica  char(1);
declare variable razaosocial   varchar(50);
declare variable nome          varchar(40);
declare variable datanasc      timestamp;
declare variable naturalidade  varchar(40);
declare variable sexo          varchar(20);
declare variable estadocivil   varchar(20);
declare variable rg            varchar(20);
declare variable cpf           varchar(20);
declare variable cgc           varchar(20);
declare variable ie            varchar(20);
declare variable pai           varchar(40);
declare variable mae           varchar(40);
declare variable localizacao   integer;
declare variable numero        integer;
declare variable complemento   varchar(40);
declare variable bairro        integer;
declare variable cidade        integer;
declare variable estado        char(2);
declare variable fone          varchar(20);
declare variable fax           varchar(20);
declare variable email         varchar(50);
declare variable homepage      varchar(60);
declare variable celular       varchar(20);
declare variable datacadast    timestamp;
declare variable observacoes   varchar(2048);
declare variable contato       varchar(40);
declare variable datafund      timestamp;
declare variable orgaoexp      varchar(6);
declare variable nomeuser      varchar(30);
declare variable codcliente    integer;
declare variable desconto      numeric(9, 2);
declare variable codempresa    integer;
declare variable comissao      numeric(9, 2);
declare variable tipo          char(1);
declare variable financeiro    char(1);
declare variable estorno       char(1);
declare variable trocavendedor char(1);
declare variable internet      char(1);
declare variable mudaempresa   char(1);
begin

  for
  select
    codigo,
    pessoafisica,
    razaosocial,
    nome,
    datanasc,
    naturalidade,
    sexo,
    estadocivil,
    rg,
    cpf,
    cgc,
    ie,
    pai,
    mae,
    localizacao,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    fone,
    fax,
    email,
    homepage,
    celular,
    datacadast,
    observacoes,
    contato,
    datafund,
    orgaoexp,
    nomeuser,
    desconto,
    codempresa,
    comissao,
    financeiro,
    estorno,
    trocavendedor,
    internet,
    mudaempresa
  from
    vendedores
  into
    :codigo,
    :pessoafisica,
    :razaosocial,
    :nome,
    :datanasc,
    :naturalidade,
    :sexo,
    :estadocivil,
    :rg,
    :cpf,
    :cgc,
    :ie,
    :pai,
    :mae,
    :localizacao,
    :numero,
    :complemento,
    :bairro,
    :cidade,
    :estado,
    :fone,
    :fax,
    :email,
    :homepage,
    :celular,
    :datacadast,
    :observacoes,
    :contato,
    :datafund,
    :orgaoexp,
    :nomeuser,
    :desconto,
    :codempresa,
    :comissao,
    :financeiro,
    :estorno,
    :trocavendedor,
    :internet,
    :mudaempresa
  do
  begin

    select
      sequencia
    from
      seq_obter('CLIENTES')
    into
      :codcliente;

    insert into
      clientes (
        codigo,
        codassociado,
        pessoafisica,
        razaosocial,
    	nome,
    	datanasc,
    	naturalidade,
    	sexo,
    	estadocivil,
    	rg,
    	cpf,
    	cgc,
    	ie,
    	pai,
    	mae,
    	localizacao,
    	numero,
    	complemento,
    	bairro,
    	cidade,
    	estado,
    	fone,
    	fax,
    	email,
    	homepage,
    	celular,
    	datacadast,
    	observacoes,
    	contato,
    	datafund,
    	orgaoexp,
	nomeuser,
	desconto,
	codempresa,
	comissao,
	tipo,
	financeiro,
	estorno,
	trocavendedor,
	internet,
	mudaempresa)
      values (
        :codcliente,
        :codigo,
        :pessoafisica,
        :razaosocial,
    	:nome,
    	:datanasc,
    	:naturalidade,
    	:sexo,
    	:estadocivil,
    	:rg,
    	:cpf,
    	:cgc,
    	:ie,
    	:pai,
    	:mae,
    	:localizacao,
    	:numero,
    	:complemento,
    	:bairro,
    	:cidade,
    	:estado,
    	:fone,
    	:fax,
    	:email,
    	:homepage,
    	:celular,
    	:datacadast,
    	:observacoes,
    	:contato,
    	:datafund,
    	:orgaoexp,
	:nomeuser,
	:desconto,
	:codempresa,
	:comissao,
	'A',
	:financeiro,
	:estorno,
	:trocavendedor,
	:internet,
	:mudaempresa);

  end
end!


INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (45, CURRENT_TIMESTAMP)!