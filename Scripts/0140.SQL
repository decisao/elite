/*
** CONTRATOS DE MANUTENÇÃO
*/

SET TERM !;

CREATE TABLE CONTRATOS (
   CODIGO          INTEIRO_VALIDO,
   DATAINI         DATADIA_VALIDA,
   DATAFIM         DATADIA_VALIDA,
   CODVENDEDOR     INTEIRO,
   CODTECNICO      INTEIRO,
   CONSTRAINT      CONTRATOS_PK
   PRIMARY KEY     (CODIGO),
   CONSTRAINT      CONTRATOS_FK01
   FOREIGN KEY     (CODVENDEDOR)
   REFERENCES      CLIENTES (CODIGO)
   ON UPDATE CASCADE,
   CONSTRAINT      CONTRATOS_FK02
   FOREIGN KEY     (CODTECNICO)
   REFERENCES      CLIENTES (CODIGO)
   ON UPDATE CASCADE,
   CONSTRAINT      CONTRATOS_FK03
   FOREIGN KEY     (CODIGO)
   REFERENCES      CLIENTES (CODIGO)
   ON UPDATE CASCADE
)!

GRANT ALL ON CONTRATOS TO PUBLIC!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (140, CURRENT_TIMESTAMP)!