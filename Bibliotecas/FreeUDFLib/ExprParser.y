%{
unit ExprParser;

interface

uses
  Windows, SysUtils, Classes, ExprLexer, VariantSymbolTable, StdFuncs;


procedure GetVariantValues(val1, val2: TExprNumber; var var1, var2: Variant);
function EvaluateExpression(Expr: TStrings; ASymTab: TVariantSymbolTable;
  Errors: TStrings): Boolean;
function yyparse: Integer;

threadvar
  ExprResult: Boolean;

implementation

%}

%union {
  B: (bvalue: Boolean);
  D: (dvalue: TDateTime);
  N: (nvalue: TExprNumber);
  S: (svalue: array[0..yylmax] of Char);
}

%token '(' ')' _NOT _AND _OR _XOR _NOR _NAND
%token _EQ _NEQ _LEQ _GEQ _GT _LT _STARTS_WITH _CONTAINS
%token _PLUS _MINUS _TIMES _DIV _DIVIDE _MOD
%token <bvalue> _TRUE _FALSE
%token <dvalue> _DATE
%token <nvalue> _NUM _DATESPEC
%token <svalue> _STRING

%left  _AND _OR _XOR _NAND _NOR
%left _PLUS _MINUS
%left _TIMES _DIV _DIVIDE _MOD
%right _NOT

%type <bvalue> BillingExpr Expr CmpExpr
%type <dvalue> DateExpr
%type <nvalue> NumExpr
%type <svalue> StrExpr

%%

%{
var
  yr, mn, dy: Word;
  res, v1, v2: Variant;
%}

BillingExpr: Expr {
	$$ := $1;
	ExprResult := $1;
	}
	| {
	$$ := False;
	ExprResult := False;
	}
;
Expr: Expr _AND Expr {
	  $$ := $1 and $3;
	}
	| Expr _OR Expr {
	  $$ := $1 or $3;
	}
	| Expr _XOR Expr {
	  $$ := $1 xor $3;
	}
	| Expr _NOR Expr {
	  $$ := not ($1 or $3);
	}
	| Expr _NAND Expr {
	  $$ := not ($1 and $3);
	}
	| _NOT Expr {
	  $$ := not $2;
	}
	| '(' Expr ')' {
	  $$ := $2;
	}
	| CmpExpr {
	  $$ := $1;
	}
;
CmpExpr: _TRUE {
	  $$ := True;
	}
	| _FALSE {
	  $$ := False;
	}
	| DateExpr _EQ DateExpr {
	  $$ := ($1 = $3);
	}
	| DateExpr _NEQ DateExpr {
	  $$ := ($1 <> $3);
	}
	| DateExpr _LEQ DateExpr {
	  $$ := ($1 <= $3);
	}
	| DateExpr _GEQ DateExpr {
	  $$ := ($1 >= $3);
	}
	| DateExpr _GT DateExpr {
	  $$ := ($1 > $3);
	}
	| DateExpr _LT DateExpr {
	  $$ := ($1 < $3);
	}
	| NumExpr _EQ NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 = v2);
	}
	| NumExpr _NEQ NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 <> v2);
	}
	| NumExpr _LEQ NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 <= v2);
	}
	| NumExpr _GEQ NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 >= v2);
	}
	| NumExpr _GT NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 > v2);
	}
	| NumExpr _LT NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  $$ := (v1 < v2);
	}
	| StrExpr _EQ StrExpr {
	  $$ := (StrComp($1, $3) = 0);
	}
	| StrExpr _NEQ StrExpr {
	  $$ := (StrComp($1, $3) <> 0);
	}
	| StrExpr _LEQ StrExpr {
	  $$ := (StrComp($1, $3) <= 0);
	}
	| StrExpr _GEQ StrExpr {
	  $$ := (StrComp($1, $3) >= 0);
	}
	| StrExpr _GT StrExpr {
	  $$ := (StrComp($1, $3) > 0);
	}
	| StrExpr _LT StrExpr {
	  $$ := (StrComp($1, $3) < 0);
	}
	| StrExpr _STARTS_WITH StrExpr {
	  $$ := (Pos(String($3), String($1)) = 1);
	}
	| StrExpr _CONTAINS StrExpr {
	  $$ := (Pos(String($3), String($1)) > 0);
	}
;
DateExpr: _DATE {
	  $$ := $1;
	}
	| DateExpr _PLUS _DATESPEC _NUM {
	  if $4.NumType <> EXPR_NUMTYPE_INTEGER then
	    yyerror('Double not permitted');
	  case $3.ivalue of
	    MSPEC_DAY: $$ := $1 + $4.ivalue;
	    MSPEC_MONTH: $$ := IncMonth($1, $4.ivalue);
	    MSPEC_YEAR: begin
	      DecodeDate($1, yr, mn, dy);
	      yr := yr + $4.ivalue;
	      $$ := EncodeDate(yr, mn, dy);
	    end;
          end;
	}
	| DateExpr _PLUS _DATESPEC '(' NumExpr ')' {
	  if $5.NumType <> EXPR_NUMTYPE_INTEGER then
	    yyerror('Double not permitted');
	  case $3.ivalue of
	    MSPEC_DAY: $$ := $1 + $5.ivalue;
	    MSPEC_MONTH: $$ := IncMonth($1, $5.ivalue);
	    MSPEC_YEAR: begin
	      DecodeDate($1, yr, mn, dy);
	      yr := yr + $5.ivalue;
	      $$ := EncodeDate(yr, mn, dy);
	    end;
          end;
	}
	| DateExpr _MINUS _DATESPEC _NUM {
	  if $4.NumType <> EXPR_NUMTYPE_INTEGER then
	    yyerror('Double not permitted');
	  case $3.ivalue of
	    MSPEC_DAY: $$ := $1 - $4.ivalue;
	    MSPEC_MONTH: $$ := IncMonth($1, -$4.ivalue);
	    MSPEC_YEAR: begin
	      DecodeDate($1, yr, mn, dy);
	      yr := yr - $4.ivalue;
	      $$ := EncodeDate(yr, mn, dy);
	    end;
          end;
	}
	| DateExpr _MINUS _DATESPEC '(' NumExpr ')' {
	  if $5.NumType <> EXPR_NUMTYPE_INTEGER then
	    yyerror('Double not permitted');
	  case $3.ivalue of
	    MSPEC_DAY: $$ := $1 - $5.ivalue;
	    MSPEC_MONTH: $$ := IncMonth($1, -$5.ivalue);
	    MSPEC_YEAR: begin
	      DecodeDate($1, yr, mn, dy);
	      yr := yr - $5.ivalue;
	      $$ := EncodeDate(yr, mn, dy);
	    end;
          end;
	}
	| '(' DateExpr ')' {
	  $$ := $2;
	}
;
NumExpr: _NUM {
	  $$ := $1;
	}
	| NumExpr _PLUS NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 + v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| NumExpr _MINUS NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 - v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| NumExpr _TIMES NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 * v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| NumExpr _DIV NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 div v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| NumExpr _MOD NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 mod v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| NumExpr _DIVIDE NumExpr {
	  GetVariantValues($1, $3, v1, v2);
	  res := v1 / v2;
	  if VarType(res) = varInteger then
	    $$.ivalue := res
	  else
	    $$.dvalue := res;
	}
	| '(' NumExpr ')' {
	  $$ := $2;
	}
;
StrExpr: _STRING {
	  $$ := $1;
	}
	| StrExpr _PLUS StrExpr {
	  $$ := $1;
          StrCat($$, $3);
	}
;
%%

function EvaluateExpression(Expr: TStrings; ASymTab: TVariantSymbolTable;
  Errors: TStrings): Boolean;
begin
  yy_reset; yyerrcnt := 0;
  ExprResult := False;
  SymTab := ASymTab;
  yyin := TMemoryStream.Create;
  yyout := TMemoryStream.Create;
  yyerr := TMemoryStream.Create;
  try
    Expr.SaveToStream(yyin);
    yyin.Seek(0, soFromBeginning);
    yyparse;
    yyerr.Seek(0, soFromBeginning);
    Errors.LoadFromStream(yyerr);
  finally
    yyin.Free; yyout.Free; yyerr.Free;
    result := ExprResult;
  end;
end;

procedure GetVariantValues(val1, val2: TExprNumber; var var1, var2: Variant);
begin
  if val1.NumType = EXPR_NUMTYPE_INTEGER then
    var1 := val1.ivalue
  else
    var1 := val1.dvalue;
  if val2.NumType = EXPR_NUMTYPE_INTEGER then
    var2 := val2.ivalue
  else
    var2 := val2.dvalue;
end;

initialization

//  InitializeCriticalSection(cs_globs);

finalization

//  DeleteCriticalSection(cs_globs);

end.

