%{
unit ExprLexer;
{$DEFINE YYIOSTREAMED}

interface

uses
  Windows, Classes, SysUtils, StdFuncs, StdConsts, VariantSymbolTable;

{$DEFINE YYLMAX_DEFINED}
const
  yylmax = 1023;
  yylmax1 = yylmax + 1;
  MSPEC_DAY = 1;
  MSPEC_MONTH = 2;
  MSPEC_YEAR = 3;
  EXPR_NUMTYPE_INTEGER = 1;
  EXPR_NUMTYPE_DOUBLE = 2;

type
  TExprNumber = record
    case NumType: Byte of
      1: (ivalue: Integer);
      2: (dvalue: Double);
  end;

{$I ExprParser.hp}

procedure GetString(str_delim: Integer);
procedure yyerror(msg: String);
procedure yy_reset;
function yylex: Integer;

threadvar
  yyin, yyout, yyerr: TStream;
  yyerrcnt: Integer;
  yylval: YYSTYPE;
  SymTab: TVariantSymbolTable;

implementation

procedure yyerror(msg: String);
begin
  msg := msg + CRLF;
  yyerr.WriteBuffer(msg[1], Length(msg));
  Inc(yyerrcnt);
end;

%}

Alpha [A-Za-z]
Digit [0-9]
WordChar [A-Za-z0-9_\.]
WhiteSpace [ \t\n\r]

%p 10000

%%
%{
var
  v: Variant;
%}
[()] {
  retval := Integer(yytext[0]);
  goto yylexReturn;
}
"/*" yycomment('*/')
[Nn][Oo][Tt] {
  retval := _NOT;
  goto yylexReturn;
}
\" {
  retval := _STRING;
  GetString(Integer('"'));
  StrCopy(yylval.svalue, yytext);
  goto yylexReturn;
}
"'" {
  retval := _STRING;
  GetString(Integer(''''));
  StrCopy(yylval.svalue, yytext);
  goto yylexReturn;
}
"{" {
  retval := _DATE;
  GetString(Integer('}'));
  yylval.dvalue := StrToDate(String(yytext));
  goto yylexReturn;
}
[-]?{Digit}+\.{Digit}+ {
  retval := _NUM;
  yylval.nvalue.NumType := EXPR_NUMTYPE_DOUBLE;
  yylval.nvalue.dvalue := StrToFloat(String(yytext));
  goto yylexReturn;
}
[-]?{Digit}+ {
  retval := _NUM;
  yylval.nvalue.NumType := EXPR_NUMTYPE_INTEGER;
  yylval.nvalue.ivalue := StrToInt(String(yytext));
  goto yylexReturn;
}
"$"{Digit}+ {
  retval := _NUM;
  yylval.nvalue.NumType := EXPR_NUMTYPE_INTEGER;
  yylval.nvalue.ivalue := StrToInt(String(yytext));
  goto yylexReturn;
}
[Aa][Nn][Dd] {
  retval := _AND;
  goto yylexReturn;
}
[Nn][Aa][Nn][Dd] {
  retval := _NAND;
  goto yylexReturn;
}
[Oo][Rr] {
  retval := _OR;
  goto yylexReturn;
}
[Xx][Oo][Rr] {
  retval := _XOR;
  goto yylexReturn;
}
[Nn][Oo][Rr] {
  retval := _NOR;
  goto yylexReturn;
}
"=" {
  retval := _EQ;
  goto yylexReturn;
}
"!=" {
  retval := _NEQ;
  goto yylexReturn;
}
"<>" {
  retval := _NEQ;
  goto yylexReturn;
}
"<=" {
  retval := _LEQ;
  goto yylexReturn;
}
">=" {
  retval := _GEQ;
  goto yylexReturn;
}
">" {
  retval := _GT;
  goto yylexReturn;
}
"<" {
  retval := _LT;
  goto yylexReturn;
}
[Ss][Tt][Aa][Rr][Tt][Ss]_[Ww][Ii][Tt][Hh] {
  retval := _STARTS_WITH;
  goto yylexReturn;
}
[Cc][Oo][Nn][Tt][Aa][Ii][Nn][Ss] {
  retval := _CONTAINS;
  goto yylexReturn;
}
[Tt][Rr][Uu][Ee] {
  retval := _TRUE;
  goto yylexReturn;
}
[Ff][Aa][Ll][Ss][Ee] {
  retval := _FALSE;
  goto yylexReturn;
}
"+" {
  retval := _PLUS;
  goto yylexReturn;
}
"-" {
  retval := _MINUS;
  goto yylexReturn;
}
"*" {
  retval := _TIMES;
  goto yylexReturn;
}
[Dd][Ii][Vv] {
  retval := _DIV;
  goto yylexReturn;
}
"/" {
  retval := _DIVIDE;
  goto yylexReturn;
}
[Mm][Oo][Dd] {
  retval := _MOD;
  goto yylexReturn;
}
[Mm][Oo][Nn][Tt][Hh] {
  retval := _DATESPEC;
  yylval.nvalue.ivalue := MSPEC_MONTH;
  goto yylexReturn;
}
[Dd][Aa][Yy] {
  retval := _DATESPEC;
  yylval.nvalue.ivalue := MSPEC_DAY;
  goto yylexReturn;
}
[Yy][Ee][Aa][Rr] {
  retval := _DATESPEC;
  yylval.nvalue.ivalue := MSPEC_YEAR;
  goto yylexReturn;
}
{WordChar}+ {
  v := SymTab.Value[UpperCase(String(yytext))];
  case VarType(v) of
    varDate: begin
      retval := _DATE;
      yylval.dvalue := v;
    end;
    varInteger, varDouble: begin
      retval := _NUM;
      if VarType(v) = varInteger then begin
        yylval.nvalue.NumType := EXPR_NUMTYPE_INTEGER;
        yylval.nvalue.ivalue := v;
      end else begin
        yylval.nvalue.NumType := EXPR_NUMTYPE_DOUBLE;
        yylval.nvalue.dvalue := v;
      end;
    end;
    varString: begin
      retval := _STRING;
      StrPCopy(yylval.svalue, v);
    end;
    else begin
      retval := _STRING;
      StrPCopy(yylval.svalue, '');
    end;
  end;
  goto yylexReturn;
}
{WhiteSpace}+ {
  (* Skip over white space *)
}
%%

procedure GetString(str_delim: Integer);
var
  ch, i: Integer;
begin
  ch := input;
  i := 0;
  while ((ch >= 0) and (i < yylmax1)) do begin
    if (ch = str_delim) then begin
      ch := input;
      if (ch <> str_delim) then begin
        unput(ch);
	break;
      end;
    end;
    yytext[i] := Char(ch);
    Inc(i);
    ch := input;
  end;
  if (ch < 0) then
    yyerror('EOF detected in symbol value');
  if (i = yylmax1) then
    yyerror('String too long');
  yytext[i] := #0;
end;

initialization

  InitializeCriticalSection(cs_globs);

finalization

  DeleteCriticalSection(cs_globs);

end.
