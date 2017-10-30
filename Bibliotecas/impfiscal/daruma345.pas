unit daruma345;

interface

  function MessageBox(HWnd: Integer; Text, Caption: PChar;
             Flags: Integer): Integer;                             stdcall; external 'user32.dll' name 'MessageBoxA';  function DAR_LeVersaoDLL: Integer;  function DAR_Resposta(dest: PChar; maxlen: Integer ): Integer;   stdcall; external 'fs345_32.dll';  function DAR_Status: Integer;  function DAR_AbreSerial(conf:string): Integer;                   stdcall; external 'fs345_32.dll';  function DAR_FechaSerial (wait:char): Integer;                   stdcall; external 'fs345_32.dll';
  function DAR_Erro : Integer;                                     stdcall; external 'fs345_32.dll';

  function DAR_LeituraX(wait:char) : Integer;                      stdcall; external 'fs345_32.dll';

  function DAR_AbreCupomFiscal(wait:char) : Integer;               stdcall; external 'fs345_32.dll';

  function DAR_Desc1Lin6Dig (St: string; Cod: string; D_a: char;
             Porc: string; Preco: string; Quant: string;
             Desc: string; wait:char):Integer;                     stdcall; external 'fs345_32.dll';

  function DAR_CancelaDoc(wait:char) : Integer;                    stdcall; external 'fs345_32.dll';

  function DAR_DescFormPag(Tipo:char;Val:string;Text:string;
             wait:char): Integer;                                  stdcall; external 'fs345_32.dll';

  function DAR_Totaliza(D_a:char;Val:string;wait:char): Integer;   stdcall; external 'fs345_32.dll';

  function DAR_FechaCupom(Text:string; wait:char): Integer;        stdcall; external 'fs345_32.dll';

  function DAR_ImpHora(wait:char) : Integer;                       stdcall; external 'fs345_32.dll';

  function DAR_ReducaoZ(DatHor: string; wait:char): Integer;       stdcall; external 'fs345_32.dll';

implementation

  function DAR_LeVersaoDLL; external 'fs345_32.dll';

  function DAR_Status; external 'fs345_32.dll';

end.
