/*
** INICIALIZACAO DO MOVESTOQUE
*/

EXECUTE PROCEDURE PREENCHE_MOVESTOQUE!

DROP PROCEDURE PREENCHE_MOVESTOQUE!

CREATE TRIGGER INDIVIDUAIS_AI0 FOR INDIVIDUAIS
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN

  /* ENTRADA NO MOVESTOQUE */
  IF ((NEW.PS = 'P') AND (NEW.VENDIDO = 'N')) THEN
    INSERT INTO
      MOVESTOQUE (
        CODPRODUTO,
        CODEMPRESA,
        QUANTIDADE,
        CODINDIVIDUO,
        STATUS
        )
      VALUES (
        NEW.CODPRODUTO,
        NEW.CODEMPRESA,
        NEW.QUANTIDADE,
        NEW.CODIGO,
        'COMPRA'
        );

END!

CREATE TRIGGER INDIVIDUAIS_BU1 FOR INDIVIDUAIS
ACTIVE AFTER UPDATE POSITION 1
AS
BEGIN

  IF (NEW.PS = 'P') THEN
   BEGIN

     /* VENDA */
     IF ((OLD.VENDIDO = 'N') AND (NEW.VENDIDO = 'S')) THEN
       INSERT INTO
         MOVESTOQUE (
           CODPRODUTO,
           CODEMPRESA,
           QUANTIDADE,
           CODINDIVIDUO,
           STATUS
           )
         VALUES (
           NEW.CODPRODUTO,
           NEW.CODEMPRESA,
           NEW.QUANTIDADE,
           NEW.CODIGO,
           'VENDA'
           );

     /* ESTORNO */
     IF ((OLD.VENDIDO = 'S') AND (NEW.VENDIDO = 'N')) THEN
       INSERT INTO
         MOVESTOQUE (
           CODPRODUTO,
           CODEMPRESA,
           QUANTIDADE,
           CODINDIVIDUO,
           STATUS
           )
         VALUES (
           NEW.CODPRODUTO,
           NEW.CODEMPRESA,
           NEW.QUANTIDADE,
           NEW.CODIGO,
           'ESTORNO'
           );

   END

END!

CREATE TRIGGER INDIVIDUAIS_AD0 FOR INDIVIDUAIS
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN

  IF (OLD.PS = 'P') THEN
   BEGIN

     /* EXCLUSAO */
     IF (OLD.VENDIDO = 'N') THEN
       INSERT INTO
         MOVESTOQUE (
           CODPRODUTO,
           CODEMPRESA,
           QUANTIDADE,
           CODINDIVIDUO,
           STATUS
           )
         VALUES (
           OLD.CODPRODUTO,
           OLD.CODEMPRESA,
           OLD.QUANTIDADE,
           OLD.CODIGO,
           'EXCLUIDO/SISTEMA'
           );

   END

END!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (100, CURRENT_TIMESTAMP)!