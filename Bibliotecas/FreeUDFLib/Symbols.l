%{
unit Symbols;
{$DEFINE YYIOSTREAMED}

interface

uses
  Windows, Classes, SysUtils, StdFuncs, StdConsts, VariantSymbolTable;

{$DEFINE YYLMAX_DEFINED}
const
  yylmax = 1023;
  yylmax1 = yylmax + 1;

procedure GetValue(delim: Integer);
procedure LoadSymbols(Symbols: TStrings; SymTab: TVariantSymbolTable;
  Errors: TStrings);
procedure yyerror(msg: String);
function yylex: Integer;

threadvar
  yyin, yyout, yyerr: TStream;
  sym_name: String;
  sym_val: Variant;

implementation

procedure yyerror(msg: String);
begin
  msg := msg + CRLF;
  yyerr.WriteBuffer(msg[1], Length(msg));
end;

%}

FirstSymbolNameChar [A-Za-z_\.]
SymbolNameChar [A-Za-z0-9_\.]
Digit [0-9]
WhiteSpace [ \t\r\n]
InvalidChar [^A-Za-z0-9_\. \t\r\n]

%s YYSYMBOL_VALUE

%%
<INITIAL>{FirstSymbolNameChar}{SymbolNameChar}+ {
  sym_name := String(yytext);
  YYBEGIN(YYSYMBOL_VALUE);
}
<INITIAL>{WhiteSpace}+ {
  // Do nothing with whitespace
}
<YYSYMBOL_VALUE>"'" {
  GetValue(Integer(''''));
  sym_val := String(yytext);
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;
}
<YYSYMBOL_VALUE>\" {
  GetValue(Integer('"'));
  sym_val := String(yytext);
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;
}
<YYSYMBOL_VALUE>"{" {
  GetValue(Integer('}'));
  sym_val := StrToDate(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;
}
<YYSYMBOL_VALUE>[-$]?{Digit}+ {
  sym_val := StrToInt(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;
}
<YYSYMBOL_VALUE>[-]?{Digit}+\.{Digit}* {
  sym_val := StrToFloat(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;
}
<YYSYMBOL_VALUE>{WhiteSpace}+ {
  // Do nothing
}
%%

procedure GetValue(delim: Integer);
var
  ch, i: Integer;
begin
  ch := input;
  i := 0;
  while ((ch > 0) and (i < yylmax1)) do begin
    if (ch = delim) then begin
      ch := input;
      if (ch <> delim) then begin
        unput(ch);
	break;
      end;
    end;
    yytext[i] := Char(ch);
    Inc(i);
    ch := input;
  end;
  if (ch <= 0) then
    yyerror('EOF detected in symbol value');
  if (i = yylmax1) then
    yyerror('String too long');
  yytext[i] := #0;
end;

procedure LoadSymbols(Symbols: TStrings; SymTab: TVariantSymbolTable;
  Errors: TStrings);
begin
  yy_reset;
  yyin := TMemoryStream.Create;
  yyout := TMemoryStream.Create;
  yyerr := TMemoryStream.Create;
  try
    Symbols.SaveToStream(yyin);
    yyin.Seek(0, soFromBeginning);
    while (yylex <> 0) do begin
      if (sym_name = '') then
        yyerror('No symbol name provided.')
      else
        SymTab.CreateSymbol(UpperCase(sym_name), sym_val);
      sym_name := '';
    end;
    yyerr.Seek(0, soFromBeginning);
    Errors.LoadFromStream(yyerr);
  finally
    yyin.Free; yyout.Free; yyerr.Free;
  end;
end;

initialization

  yylex_initialization;

finalization

  yylex_finalization;

end.
