/*
** DOCUMENTOS FUTUROS NO EXTRATO
*/

SET TERM !;

CREATE PROCEDURE EXTRATO_DOC (
    DATAINI DATE,
    DATAFIM DATE,
    CODEMPRESA INTEGER)
RETURNS (
    DATAHORA TIMESTAMP,
    CLIENTE VARCHAR(40),
    DESCRICAO VARCHAR(40),
    VALORCRE NUMERIC(9,2),
    VALORDEB NUMERIC(9,2),
    LETRA CHAR(1),
    INFODOC VARCHAR(50),
    DOCUMENTO VARCHAR(40))
AS
DECLARE VARIABLE ES INTEGER;
DECLARE VARIABLE CONTADOR INTEGER;
begin
  contador = 0;

  for
  select
    pa.datacadast,
    pa.descricao,
    pa.valor,
    pa.es,
    pa.infodoc,
    cl.nome,
    dc.documento
  from
    pagamentos pa
    left join clientes cl on
      (cl.codigo = pa.codcliente)
    left join documentos dc on
      (dc.codigo = pa.coddocumento)
  where
    pa.pago = 0 and
    cast(pa.datacadast as date) between :dataini and :datafim and
    pa.codempresa = :codempresa
  order by
    dc.documento,
    pa.datacadast
  into
    :datahora,
    :descricao,
    :valorcre,
    :es,
    :infodoc,
    :cliente,
    :documento
  do
  begin

    contador = contador + 1;

    if (es = 1) then
     begin
      letra = 'D';
      valordeb = valorcre;
      valorcre = NULL;
     end else
     begin
      letra = 'C';
      valordeb = NULL;
     end

    suspend;

  end
end!

GRANT EXECUTE ON PROCEDURE EXTRATO_DOC TO PUBLIC!

SET TERM ;!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (164, CURRENT_TIMESTAMP);
COMMIT;
