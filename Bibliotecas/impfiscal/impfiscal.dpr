library impfiscal;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  daruma345 in 'daruma345.pas';

{$R *.RES}

begin

  { seleciona impressora - uso interno        }
  function Impressora(config: Pchar): integer;
  var
    impressora: string;
  begin
    impressora := string(config);
    if pos('DARUMA', impressora) > 0 then
      Result := 1
    else
      Result := 0;
  end;

  { inicializa a comunicação com a impressora }
  { retorna TRUE se for bem sucedido!         }
  function Iniciar(config: PChar): boolean;
  begin

    { para DARUMA345 }
    if Impressora(config) = 1 then
     begin


     end;

  end;

  { abertura de cupom fiscal                  }
  { retorna o número do cupom aberto          }
  function AbreCupom(config: PChar): integer;

  { lançamento de produto                     }
  function Produto(config: PChar);

  { subtotalização do cupom, antes do pagto   }
  function Subtotal(config: PChar);

  { pagamento - deve ser chamada 1 a 1        }
  function Pagamento(config: PChar);

  { totalização do cupom                      }
  function Total(config: PChar);

  { fechamento do cupom com mensagem          }
  function Fechamento(config: PChar);

  { cancelamento de 1 produto                 }
  function CancelaProduto(config: PChar);

  { cancelamento de cupom                     }
  function CancelaCupom(config: PChar);

  { leitura X                                 }
  function LeituraX(config: PChar);

  { reducao Z                                 }
  function ReducaoZ(config: PChar);

end.
