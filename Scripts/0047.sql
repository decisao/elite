/* ANTES DE RODAR ESSE SCRIPT, EXECUTE O SEGUINTE CÓDIGO */

/* SELECT                */
/*   NOMEUSER,           */
/*   COUNT(CODIGO)       */
/* FROM                  */
/*   CLIENTES            */
/* GROUP BY              */
/*   NOMEUSER            */
/* HAVING                */
/*   COUNT(CODIGO) > 1   */

/* DESCUBRA OS USUARIOS COM DUPLICIDADE E RESOLVA-OS!!! */


CREATE UNIQUE INDEX CLIENTES_NOMEUSER ON CLIENTES(NOMEUSER)!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (47, CURRENT_TIMESTAMP)!
