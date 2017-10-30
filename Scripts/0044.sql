/* atualiza o cadastro de clientes */

EXECUTE PROCEDURE COPIA_FORNECEDORES!

DROP PROCEDURE COPIA_FORNECEDORES!

ALTER TABLE CLIENTES ADD CODTRANSPORTADOR INTEIRO!

CREATE PROCEDURE COPIA_TRANSPORTADORES
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
    orgaoexp
  from
    transportadores
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
    :orgaoexp
  do
  begin

    nomeuser = 'TRA' || codigo;

    select
      sequencia
    from
      seq_obter('CLIENTES')
    into
      :codcliente;

    insert into
      clientes (
        codigo,
        codtransportador,
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
	tipo)
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
	0,
	1,
	0,
	'T');

  end
end!


INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (44, CURRENT_TIMESTAMP)!