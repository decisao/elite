(* yacc -LP -D ExprParser.hp -o ExprParser.pas ExprParser.y *)
(*
 * 2/5/1998 - Gregory Deatz
 * gdeatz(at)hlmdd.com
 *
 * YYPARSE.PAS - A thread-safe version modified from the
 * template files distributed with MKS lex/yacc 3.2b.
 *                          
 * I guess MKS's copyright still stands, because I didn't change much,
 * but it would be nice if you acknowledged work where work was
 * done....
*)
(*
 * Copyright 1990, 1991 by Mortice Kern Systems Inc.
 * All rights reserved.
 *)
{$B-}   { short circuit boolean evaluations }
{LINE 1 ExprParser.y}
{LINE 2 ExprParser.y}unit ExprParser;
{LINE 3 ExprParser.y}
{LINE 4 ExprParser.y}interface
{LINE 5 ExprParser.y}
{LINE 6 ExprParser.y}uses
{LINE 7 ExprParser.y}  Windows, SysUtils, Classes, ExprLexer, VariantSymbolTable, StdFuncs;
{LINE 8 ExprParser.y}
{LINE 9 ExprParser.y}
{LINE 10 ExprParser.y}procedure GetVariantValues(val1, val2: TExprNumber; var var1, var2: Variant);
{LINE 11 ExprParser.y}function EvaluateExpression(Expr: TStrings; ASymTab: TVariantSymbolTable;
{LINE 12 ExprParser.y}  Errors: TStrings): Boolean;
{LINE 13 ExprParser.y}function yyparse: Integer;
{LINE 14 ExprParser.y}
{LINE 15 ExprParser.y}threadvar
{LINE 16 ExprParser.y}  ExprResult: Boolean;
{LINE 17 ExprParser.y}
{LINE 18 ExprParser.y}implementation
{LINE 19 ExprParser.y}
{LINE 20 ExprParser.y}
{$IFDEF YYDEBUG}
type	YY_Types = ( YY_t_NoneDefined, YY_t_bvalue, YY_t_dvalue, YY_t_nvalue, YY_t_svalue
);

{$ENDIF}

{$IFDEF YYDEBUG}
const
	yyRules: array[0..50] of yyTypedRules = (
	(name: '&00: %01 &00'; tokenType: 0),
	(name: '%01: %02'; tokenType: 1),
	(name: '%01:'; tokenType: 1),
	(name: '%02: %02 &05 %02'; tokenType: 1),
	(name: '%02: %02 &06 %02'; tokenType: 1),
	(name: '%02: %02 &07 %02'; tokenType: 1),
	(name: '%02: %02 &08 %02'; tokenType: 1),
	(name: '%02: %02 &09 %02'; tokenType: 1),
	(name: '%02: &04 %02'; tokenType: 1),
	(name: '%02: &02 %02 &03'; tokenType: 1),
	(name: '%02: %03'; tokenType: 1),
	(name: '%03: &24'; tokenType: 1),
	(name: '%03: &25'; tokenType: 1),
	(name: '%03: %04 &10 %04'; tokenType: 1),
	(name: '%03: %04 &11 %04'; tokenType: 1),
	(name: '%03: %04 &12 %04'; tokenType: 1),
	(name: '%03: %04 &13 %04'; tokenType: 1),
	(name: '%03: %04 &14 %04'; tokenType: 1),
	(name: '%03: %04 &15 %04'; tokenType: 1),
	(name: '%03: %05 &10 %05'; tokenType: 1),
	(name: '%03: %05 &11 %05'; tokenType: 1),
	(name: '%03: %05 &12 %05'; tokenType: 1),
	(name: '%03: %05 &13 %05'; tokenType: 1),
	(name: '%03: %05 &14 %05'; tokenType: 1),
	(name: '%03: %05 &15 %05'; tokenType: 1),
	(name: '%03: %06 &10 %06'; tokenType: 1),
	(name: '%03: %06 &11 %06'; tokenType: 1),
	(name: '%03: %06 &12 %06'; tokenType: 1),
	(name: '%03: %06 &13 %06'; tokenType: 1),
	(name: '%03: %06 &14 %06'; tokenType: 1),
	(name: '%03: %06 &15 %06'; tokenType: 1),
	(name: '%03: %06 &16 %06'; tokenType: 1),
	(name: '%03: %06 &17 %06'; tokenType: 1),
	(name: '%04: &26'; tokenType: 2),
	(name: '%04: %04 &18 &28 &27'; tokenType: 2),
	(name: '%04: %04 &18 &28 &02 %05 &03'; tokenType: 2),
	(name: '%04: %04 &19 &28 &27'; tokenType: 2),
	(name: '%04: %04 &19 &28 &02 %05 &03'; tokenType: 2),
	(name: '%04: &02 %04 &03'; tokenType: 2),
	(name: '%05: &27'; tokenType: 3),
	(name: '%05: %05 &18 %05'; tokenType: 3),
	(name: '%05: %05 &19 %05'; tokenType: 3),
	(name: '%05: %05 &20 %05'; tokenType: 3),
	(name: '%05: %05 &21 %05'; tokenType: 3),
	(name: '%05: %05 &23 %05'; tokenType: 3),
	(name: '%05: %05 &22 %05'; tokenType: 3),
	(name: '%05: &02 %05 &03'; tokenType: 3),
	(name: '%06: &29'; tokenType: 4),
	(name: '%06: %06 &18 %06'; tokenType: 4),
(name: '$accept'; tokenType: 0),(name: 'error'; tokenType: 0)
);
const
	yyTokenTypes: array[0..29] of yyNamedType = (
	(name: '$end'; token: 0; tokenType: 0),
	(name: 'error'; token: 256; tokenType: 0),
	(name: '''('''; token: 40; tokenType: 0),
	(name: ''')'''; token: 41; tokenType: 0),
	(name: '_NOT'; token: 257; tokenType: 0),
	(name: '_AND'; token: 258; tokenType: 0),
	(name: '_OR'; token: 259; tokenType: 0),
	(name: '_XOR'; token: 260; tokenType: 0),
	(name: '_NOR'; token: 261; tokenType: 0),
	(name: '_NAND'; token: 262; tokenType: 0),
	(name: '_EQ'; token: 263; tokenType: 0),
	(name: '_NEQ'; token: 264; tokenType: 0),
	(name: '_LEQ'; token: 265; tokenType: 0),
	(name: '_GEQ'; token: 266; tokenType: 0),
	(name: '_GT'; token: 267; tokenType: 0),
	(name: '_LT'; token: 268; tokenType: 0),
	(name: '_STARTS_WITH'; token: 269; tokenType: 0),
	(name: '_CONTAINS'; token: 270; tokenType: 0),
	(name: '_PLUS'; token: 271; tokenType: 0),
	(name: '_MINUS'; token: 272; tokenType: 0),
	(name: '_TIMES'; token: 273; tokenType: 0),
	(name: '_DIV'; token: 274; tokenType: 0),
	(name: '_DIVIDE'; token: 275; tokenType: 0),
	(name: '_MOD'; token: 276; tokenType: 0),
	(name: '_TRUE'; token: 277; tokenType: 1),
	(name: '_FALSE'; token: 278; tokenType: 1),
	(name: '_DATE'; token: 279; tokenType: 2),
	(name: '_NUM'; token: 280; tokenType: 3),
	(name: '_DATESPEC'; token: 281; tokenType: 3),
	(name: '_STRING'; token: 282; tokenType: 4)

);

{$ENDIF}
type tableyydef = array[0..    24] of integer;
var yydef: ^tableyydef;
const tblyydef: tableyydef = (


	  -1,    3,   -5,   24,   23,   22,   21,   20,   19,   18, 
	  17,   26,   25,   16,   15,   14,   13,   12,   11,   10, 
	   9,    8,    7,    6,    5
);
type tableyyex = array[0..     7] of integer;
var yyex: ^tableyyex;
const tblyyex: tableyyex = (


	   0,    4,   -1,    1,    0,    0,   -1,    1
);
type tableyyact = array[0..   234] of integer;
var yyact: ^tableyyact;
const tblyyact: tableyyact = (


	 -74,  -73,  -93,  -92,  -91,  -85,  -79,  282,  280,  279, 
	 278,  277,  257,   40,  -64,  -65,  -66,  -67,  -68,  -69, 
	 -70,  -71,  -72,  271,  270,  269,  268,  267,  266,  265, 
	 264,  263,  -52,  -53,  -54,  -55,  -56,  -57,  -58,  -59, 
	 -60,  -61,  -63,  -62,  276,  275,  274,  273,  272,  271, 
	 268,  267,  266,  265,  264,  263,  -44,  -45,  -46,  -47, 
	 -48,  -49,  -50,  -51,  272,  271,  268,  267,  266,  265, 
	 264,  263,  -36,  -37,  -38,  -39,  -40,  262,  261,  260, 
	 259,  258,  -79,  282,  -35,  -85,  280,   40,  -34,  281, 
	 -33,  281,  -32,  -91,  279,   40,  -80,  -52,  -53,  -54, 
	 -55,  -56,  -57,  -58,  -59,  -60,  -61,  -63,  -62,  276, 
	 275,  274,  273,  272,  271,  268,  267,  266,  265,  264, 
	 263,   41,  -86,  -44,  -45,  -46,  -47,  -48,  -49,  -50, 
	 -51,  272,  271,  268,  267,  266,  265,  264,  263,   41, 
	 -95,  -36,  -37,  -38,  -39,  -40,  262,  261,  260,  259, 
	 258,   41,  -72,  271,  -60,  -61,  -63,  -62,  276,  275, 
	 274,  273,  -58,  -59,  -60,  -61,  -63,  -62,  276,  275, 
	 274,  273,  272,  271,  -30,  -88,  280,   40,  -29,  -90, 
	 280,   40,  -50,  -51,  272,  271,  -80,  -58,  -59,  -60, 
	 -61,  -63,  -62,  276,  275,  274,  273,  272,  271,   41, 
	 -86,  -50,  -51,  272,  271,   41,  -87,  -58,  -59,  -60, 
	 -61,  -63,  -62,  276,  275,  274,  273,  272,  271,   41, 
	 -89,  -58,  -59,  -60,  -61,  -63,  -62,  276,  275,  274, 
	 273,  272,  271,   41,   -1
);
type tableyypact = array[0..    76] of integer;
var yypact: ^tableyypact;
const tblyypact: tableyypact = (


	   7,   77,   82,  153,  153,  153,  153,  153,  153,  153, 
	 153,  158,  158,  168,  168,  168,  168,  168,  168,  184, 
	 184,  184,  184,  184,  184,  227,  213,  203,   86,   86, 
	 193,   94,  180,  176,   86,    7,    7,    7,    7,    7, 
	 146,  131,  109,   94,   94,   94,   94,   94,   94,   91, 
	  89,   86,   86,   86,   86,   86,   86,   86,   86,   86, 
	  86,   86,   86,   83,   83,   83,   83,   83,   83,   83, 
	  83,   83,    7,    7,   64,   44,   23
);
type tableyygo = array[0..    86] of integer;
var yygo: ^tableyygo;
const tblyygo: tableyygo = (


	  -3, -101, -100,  -99,  -98,  -97,  -96,  -41,   -2,   73, 
	  72,   39,   38,   37,   36,   35,  -94,  -28,  -25,  -24, 
	 -23,  -22,  -21,  -20,  -42,  -75,   73,   48,   47,   46, 
	  45,   44,   43,   31,  -26,  -27,  -31,  -19,  -18,  -17, 
	 -16,  -15,  -14,  -13,  -12,  -84,  -83,  -82,  -81,  -43, 
	 -76,   73,   62,   61,   60,   59,   58,   57,   56,   55, 
	  54,   53,   52,   51,   34,   29,   28,  -11,  -10,   -9, 
	  -8,   -7,   -6,   -5,   -4,  -78,  -77,   71,   70,   69, 
	  68,   67,   66,   65,   64,   63,   -1
);
type tableyypgo = array[0..    51] of integer;
var yypgo: ^tableyypgo;
const tblyypgo: tableyypgo = (


	   0,    0,    0,    0,    0,   16,   16,   16,   16,   16, 
	  16,   16,   16,   16,   16,   16,   16,   16,   16,   16, 
	  16,   16,   16,   16,   16,   50,   50,   76,   76,   50, 
	  50,   50,   50,   50,   50,   25,   25,   25,   25,   25, 
	  25,   16,   16,    8,    8,    8,    8,    8,    8,    8, 
	   8,    0
);
type tableyyrlen = array[0..    51] of integer;
var yyrlen: ^tableyyrlen;
const tblyyrlen: tableyyrlen = (


	   0,    0,    0,    1,    0,    3,    3,    3,    3,    3, 
	   3,    3,    3,    3,    3,    3,    3,    3,    3,    3, 
	   3,    3,    3,    3,    3,    3,    3,    3,    1,    3, 
	   3,    3,    3,    3,    1,    3,    6,    4,    6,    4, 
	   1,    1,    1,    1,    3,    2,    3,    3,    3,    3, 
	   3,    2
);
const
	YYS0 = 0;
	YYDELTA = 50;
	YYNPACT = 77;
	YYNDEF = 25;

	YYr49 = 0;
	YYr50 = 1;
	YYr51 = 2;
	YYr1 = 3;
	YYr2 = 4;
	YYr13 = 5;
	YYr14 = 6;
	YYr15 = 7;
	YYr16 = 8;
	YYr17 = 9;
	YYr18 = 10;
	YYr19 = 11;
	YYr20 = 12;
	YYr21 = 13;
	YYr22 = 14;
	YYr23 = 15;
	YYr24 = 16;
	YYr25 = 17;
	YYr26 = 18;
	YYr27 = 19;
	YYr28 = 20;
	YYr29 = 21;
	YYr30 = 22;
	YYr31 = 23;
	YYr32 = 24;
	YYr40 = 25;
	YYr41 = 26;
	YYr48 = 27;
	YYr47 = 28;
	YYr46 = 29;
	YYr45 = 30;
	YYr44 = 31;
	YYr43 = 32;
	YYr42 = 33;
	YYr39 = 34;
	YYr38 = 35;
	YYr37 = 36;
	YYr36 = 37;
	YYr35 = 38;
	YYr34 = 39;
	YYr33 = 40;
	YYr12 = 41;
	YYr11 = 42;
	YYr10 = 43;
	YYr9 = 44;
	YYr8 = 45;
	YYr7 = 46;
	YYr6 = 47;
	YYr5 = 48;
	YYr4 = 49;
	YYr3 = 50;
	YYrACCEPT = YYr49;
	YYrERROR = YYr50;
	YYrLR2 = YYr51;

{$IFDEF YYDEBUG}
const
	yysvar: array[0..7] of string = (
	'$accept',
	'BillingExpr',
	'Expr',
	'CmpExpr',
	'DateExpr',
	'NumExpr',
	'StrExpr',
	''
);
const
	yyrmap: array[0..51] of integer = (

	  49,   50,   51,    1,    2,   13,   14,   15,   16,   17, 
	  18,   19,   20,   21,   22,   23,   24,   25,   26,   27, 
	  28,   29,   30,   31,   32,   40,   41,   48,   47,   46, 
	  45,   44,   43,   42,   39,   38,   37,   36,   35,   34, 
	  33,   12,   11,   10,    9,    8,    7,    6,    5,    4, 
	   3,    0
);
const
	yysmap: array[0..100] of integer = (

	   0,   12,   13,   53,   54,   55,   56,   57,   58,   59, 
	  60,   66,   67,   68,   69,   70,   71,   72,   73,   77, 
	  78,   79,   80,   81,   82,   98,   97,   96,   94,   92, 
	  91,   76,   75,   74,   61,   51,   50,   49,   48,   47, 
	  45,   44,   43,   42,   41,   40,   39,   38,   37,   36, 
	  35,   34,   33,   32,   31,   30,   29,   28,   27,   26, 
	  25,   24,   23,   22,   21,   20,   19,   18,   17,   16, 
	  15,   14,   11,   10,    6,    5,    4,   52,    1,   83, 
	  62,   63,   64,   65,    2,   84,   99,   93,  100,   95, 
	   3,    7,    8,    9,   85,   46,   86,   87,   88,   89,   90
);
const	yyntoken = 30;
const	yynvar = 7;
const	yynstate = 101;
const	yynrule = 52;

{$ENDIF}

{LINE 2 c:/etc/yyparse.pas}
(*
 * Automaton to interpret LALR(1) tables.
 *
 *      Alterable constants:
 *              YYSSIZE - size of state and value stacks (default 150).
 *              YYTABSIZE - always 1 more then YYSSIZE
 *
 *      Unavailable:
 *              YYERROR - simulate an error
 *                      Instead, in Pascal, code the action
 *                              goto errlabel;
 *                      to get the same effect as YYERROR.
 *              YYACCEPT - return 0 from yyparse
 *                      Instead, in Pascal, code the action
 *                              retval := 0; goto yyComplete;
 *              YYABORT - return 1 from yyparse
 *                      Instead, in Pascal, code the action
 *                              retval := 1; goto yyComplete;
 *              YYRETURN(value) - return value from yyparse.
 *                      Instead, in Pascal, code the action
 *                              retval := value; goto yyComplete;
 *      Functions:
 *              YYRECOVERING - true if syntax error detected,
 *                      and not recovered yet.
 *      Procedures:
 *              yyclearin - clear the lookahead token.
 *              yyerrok - forgive a pending error
 *              YYREAD - ensure yychar contains a lookahead token by
 *                      reading one if it does not.  See also YYSYNC.
 *      Preprocessor flags:
 *              YYSYNC - if defined, yacc guarantees to fetch a
 *                      lookahead token before any action, even if
 *                      it is not needed for a decision.
 *                      If YYSYNC is defined, YYREAD will never be
 *                      necessary unless the user explicitly sets yychar = -1
 *
 *      Copyright (c) 1990, 1991 by Mortice Kern Systems Inc.
 *      based on material Copyright (c) 1983, by the University of Waterloo
 *)
{$B-}           (* short circuit boolean evaluation *)
{$I-}           (* suppress I/O runtime library checks *)
{$J-}           (* Don't allow assignable constants *)

const
  YYERRCODE = 256;              { value of `error' }
  YYSSIZE = 150;                        { If changed, update YYTABSIZE! }
  YYTABSIZE = 151;              { *** 1 more then YYSSIZE *** }

(* global exported *)

type
  yytablerange = 0..YYTABSIZE;
  yyvaluetable = array [yytablerange] of YYSTYPE;
  yystatetable = array [yytablerange] of integer;
  pyyvaluetable = ^yyvaluetable;
  pyystatetable = ^yystatetable;

threadvar
  yyval:          YYSTYPE;     { $ }
  yypvt:          integer;     { index of $n }
  yychar:         integer;     { current token }
  yyerrflag:      integer;     { error flag }
  yynerrs:        integer;     { error count }
  retval:         integer;     { yyparse() return value }

function yyneg(s: integer): integer; forward;

procedure yyerrok;
begin
  yyerrflag := 0;
end;

procedure yyclearin;
begin
  yychar := -1;
end;

function YYRECOVERING : boolean;
begin
  result := yyerrflag <> 0;
end;

procedure YYREAD;
begin
  if yychar < 0 then begin
    yychar := yylex;
    if yychar < 0 then yychar := 0;
  end
end;

function yyparse: integer;
label
  yyerrlabel,                   { YYERROR comes here }
  yyinError,                    { come here on syntax error }
  yyStack,                      { start new entry }
  yyEncore,                     { lookup next action }
  yygo_on,                      { non-break in case statement }
  yyContin,                     { continue in C loop }
  yyComplete;                   { normal exit from yyparse() }

(* Start of locals *)
var
  yyi, yyj, yystate,            { table and state lookup }
  yyps,                         { index on state stack }
  yypv,                         { index on value stack }
  yyp, yyq: integer;            { temp indexes }
  yyv: pyyvaluetable;           { allocated value stack }
  yys: pyystatetable;           { allocated state stack }
  ivalues: yyvaluetable;
  istates: yystatetable;

{LINE 49 ExprParser.y}
{LINE 50 ExprParser.y}var
{LINE 51 ExprParser.y}  yr, mn, dy: Word;
{LINE 52 ExprParser.y}  res, v1, v2: Variant;
{LINE 53 ExprParser.y}

begin   { start of code for yyparse() }
  yyv := @ ivalues;
  yys := @ istates;
  yynerrs := 0;
  yyerrflag := 0;
  yyclearin;
  yyps := 0;
  yypv := 0;
  yystate := YYS0;                (* start state *)

yyStack:

  Inc(yyps); Inc(yypv);
  if yyps > YYSSIZE then begin
    yyerror('Parser stack overflow');
    retval := 1;
    goto yyComplete;
  end;
  yys^[yyps] := yystate;          (* stack current state *)
  yyv^[yypv] := yyval;            (* ... and value *)

  (*
   * Look up next action in action table.
   *)

yyEncore:

{$IFDEF YYSYNC}
        YYREAD;
{$ENDIF}

  if yystate >= Sizeof(tblyypact)/Sizeof(tblyypact[0]) then
    (* simple state *)
    yyi := yystate - YYDELTA        (* reduce in any case *)
  else begin
    yyp := tblyypact[yystate];
    if tblyyact[yyp] >= 0 then begin
      (* Look for a shift on yychar *)
{$IFNDEF YYSYNC}
      YYREAD;
{$ENDIF}
      yyq := yyp;
      yyi := yychar;
      while yyi < tblyyact[yyp] do Inc(yyp);
      Inc(yyp);
      if yyi = tblyyact[yyp-1] then begin
        yystate := yyneg(tblyyact[yyq + (yyq - yyp)]);
        (* stack what yylex() set *)
        yyval := YYSTYPE(yylval);
        yyclearin;              (* clear token *)
        if yyerrflag <> 0 then (* successful shift *)
          yyerrflag := yyerrflag - 1;
        goto yyStack;
      end
    end;

    (*
     * Fell through - take default action
     *)
    if yystate >= Sizeof(tblyydef)/Sizeof(tblyydef[0]) then
      goto yyinError;
    yyi := tblyydef[yystate];
    if yyi < 0 then begin
      (* default == reduce? *)
      (* Search exception table *)
      yyp := yyneg(yyi);
{$IFDEF YYSYNC}
      YYREAD;
{$ENDIF}
      yyi := tblyyex[yyp];
      while (yyi >= 0) and (yyi <> yychar) do begin
        Inc(yyp, 2);
        yyi := tblyyex[yyp];
      end;
      yyi := tblyyex[yyp+1];
    end
  end;

  yyj := tblyyrlen[yyi];
  Dec(yyps, yyj);         (* pop stacks *)
  yypvt := yypv;          (* save top *)
  Dec(yypv, yyj);
  yyval := yyv^[yypv+1];  (* default action $ = $1 *)

  case yyi of             (* perform semantic action *)
    
YYr1: begin	(* BillingExpr :  Expr *)
{LINE 55 ExprParser.y}
{LINE 56 ExprParser.y}	yyval.bvalue := yyv^[yypvt+(0)].bvalue;
{LINE 57 ExprParser.y}	ExprResult := yyv^[yypvt+(0)].bvalue;
{LINE 58 ExprParser.y}	
end;

YYr2: begin	(* BillingExpr :  *)
{LINE 59 ExprParser.y}
{LINE 60 ExprParser.y}	yyval.bvalue := False;
{LINE 61 ExprParser.y}	ExprResult := False;
{LINE 62 ExprParser.y}	
end;

YYr3: begin	(* Expr :  Expr _AND Expr *)
{LINE 64 ExprParser.y}
{LINE 65 ExprParser.y}	  yyval.bvalue := yyv^[yypvt+(-2)].bvalue and yyv^[yypvt+(0)].bvalue;
{LINE 66 ExprParser.y}	
end;

YYr4: begin	(* Expr :  Expr _OR Expr *)
{LINE 67 ExprParser.y}
{LINE 68 ExprParser.y}	  yyval.bvalue := yyv^[yypvt+(-2)].bvalue or yyv^[yypvt+(0)].bvalue;
{LINE 69 ExprParser.y}	
end;

YYr5: begin	(* Expr :  Expr _XOR Expr *)
{LINE 70 ExprParser.y}
{LINE 71 ExprParser.y}	  yyval.bvalue := yyv^[yypvt+(-2)].bvalue xor yyv^[yypvt+(0)].bvalue;
{LINE 72 ExprParser.y}	
end;

YYr6: begin	(* Expr :  Expr _NOR Expr *)
{LINE 73 ExprParser.y}
{LINE 74 ExprParser.y}	  yyval.bvalue := not (yyv^[yypvt+(-2)].bvalue or yyv^[yypvt+(0)].bvalue);
{LINE 75 ExprParser.y}	
end;

YYr7: begin	(* Expr :  Expr _NAND Expr *)
{LINE 76 ExprParser.y}
{LINE 77 ExprParser.y}	  yyval.bvalue := not (yyv^[yypvt+(-2)].bvalue and yyv^[yypvt+(0)].bvalue);
{LINE 78 ExprParser.y}	
end;

YYr8: begin	(* Expr :  _NOT Expr *)
{LINE 79 ExprParser.y}
{LINE 80 ExprParser.y}	  yyval.bvalue := not yyv^[yypvt+(0)].bvalue;
{LINE 81 ExprParser.y}	
end;

YYr9: begin	(* Expr :  '(' Expr ')' *)
{LINE 82 ExprParser.y}
{LINE 83 ExprParser.y}	  yyval.bvalue := yyv^[yypvt+(-1)].bvalue;
{LINE 84 ExprParser.y}	
end;

YYr10: begin	(* Expr :  CmpExpr *)
{LINE 85 ExprParser.y}
{LINE 86 ExprParser.y}	  yyval.bvalue := yyv^[yypvt+(0)].bvalue;
{LINE 87 ExprParser.y}	
end;

YYr11: begin	(* CmpExpr :  _TRUE *)
{LINE 89 ExprParser.y}
{LINE 90 ExprParser.y}	  yyval.bvalue := True;
{LINE 91 ExprParser.y}	
end;

YYr12: begin	(* CmpExpr :  _FALSE *)
{LINE 92 ExprParser.y}
{LINE 93 ExprParser.y}	  yyval.bvalue := False;
{LINE 94 ExprParser.y}	
end;

YYr13: begin	(* CmpExpr :  DateExpr _EQ DateExpr *)
{LINE 95 ExprParser.y}
{LINE 96 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue = yyv^[yypvt+(0)].dvalue);
{LINE 97 ExprParser.y}	
end;

YYr14: begin	(* CmpExpr :  DateExpr _NEQ DateExpr *)
{LINE 98 ExprParser.y}
{LINE 99 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue <> yyv^[yypvt+(0)].dvalue);
{LINE 100 ExprParser.y}	
end;

YYr15: begin	(* CmpExpr :  DateExpr _LEQ DateExpr *)
{LINE 101 ExprParser.y}
{LINE 102 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue <= yyv^[yypvt+(0)].dvalue);
{LINE 103 ExprParser.y}	
end;

YYr16: begin	(* CmpExpr :  DateExpr _GEQ DateExpr *)
{LINE 104 ExprParser.y}
{LINE 105 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue >= yyv^[yypvt+(0)].dvalue);
{LINE 106 ExprParser.y}	
end;

YYr17: begin	(* CmpExpr :  DateExpr _GT DateExpr *)
{LINE 107 ExprParser.y}
{LINE 108 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue > yyv^[yypvt+(0)].dvalue);
{LINE 109 ExprParser.y}	
end;

YYr18: begin	(* CmpExpr :  DateExpr _LT DateExpr *)
{LINE 110 ExprParser.y}
{LINE 111 ExprParser.y}	  yyval.bvalue := (yyv^[yypvt+(-2)].dvalue < yyv^[yypvt+(0)].dvalue);
{LINE 112 ExprParser.y}	
end;

YYr19: begin	(* CmpExpr :  NumExpr _EQ NumExpr *)
{LINE 113 ExprParser.y}
{LINE 114 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 115 ExprParser.y}	  yyval.bvalue := (v1 = v2);
{LINE 116 ExprParser.y}	
end;

YYr20: begin	(* CmpExpr :  NumExpr _NEQ NumExpr *)
{LINE 117 ExprParser.y}
{LINE 118 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 119 ExprParser.y}	  yyval.bvalue := (v1 <> v2);
{LINE 120 ExprParser.y}	
end;

YYr21: begin	(* CmpExpr :  NumExpr _LEQ NumExpr *)
{LINE 121 ExprParser.y}
{LINE 122 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 123 ExprParser.y}	  yyval.bvalue := (v1 <= v2);
{LINE 124 ExprParser.y}	
end;

YYr22: begin	(* CmpExpr :  NumExpr _GEQ NumExpr *)
{LINE 125 ExprParser.y}
{LINE 126 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 127 ExprParser.y}	  yyval.bvalue := (v1 >= v2);
{LINE 128 ExprParser.y}	
end;

YYr23: begin	(* CmpExpr :  NumExpr _GT NumExpr *)
{LINE 129 ExprParser.y}
{LINE 130 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 131 ExprParser.y}	  yyval.bvalue := (v1 > v2);
{LINE 132 ExprParser.y}	
end;

YYr24: begin	(* CmpExpr :  NumExpr _LT NumExpr *)
{LINE 133 ExprParser.y}
{LINE 134 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 135 ExprParser.y}	  yyval.bvalue := (v1 < v2);
{LINE 136 ExprParser.y}	
end;

YYr25: begin	(* CmpExpr :  StrExpr _EQ StrExpr *)
{LINE 137 ExprParser.y}
{LINE 138 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) = 0);
{LINE 139 ExprParser.y}	
end;

YYr26: begin	(* CmpExpr :  StrExpr _NEQ StrExpr *)
{LINE 140 ExprParser.y}
{LINE 141 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) <> 0);
{LINE 142 ExprParser.y}	
end;

YYr27: begin	(* CmpExpr :  StrExpr _LEQ StrExpr *)
{LINE 143 ExprParser.y}
{LINE 144 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) <= 0);
{LINE 145 ExprParser.y}	
end;

YYr28: begin	(* CmpExpr :  StrExpr _GEQ StrExpr *)
{LINE 146 ExprParser.y}
{LINE 147 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) >= 0);
{LINE 148 ExprParser.y}	
end;

YYr29: begin	(* CmpExpr :  StrExpr _GT StrExpr *)
{LINE 149 ExprParser.y}
{LINE 150 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) > 0);
{LINE 151 ExprParser.y}	
end;

YYr30: begin	(* CmpExpr :  StrExpr _LT StrExpr *)
{LINE 152 ExprParser.y}
{LINE 153 ExprParser.y}	  yyval.bvalue := (StrComp(yyv^[yypvt+(-2)].svalue, yyv^[yypvt+(0)].svalue) < 0);
{LINE 154 ExprParser.y}	
end;

YYr31: begin	(* CmpExpr :  StrExpr _STARTS_WITH StrExpr *)
{LINE 155 ExprParser.y}
{LINE 156 ExprParser.y}	  yyval.bvalue := (Pos(String(yyv^[yypvt+(0)].svalue), String(yyv^[yypvt+(-2)].svalue)) = 1);
{LINE 157 ExprParser.y}	
end;

YYr32: begin	(* CmpExpr :  StrExpr _CONTAINS StrExpr *)
{LINE 158 ExprParser.y}
{LINE 159 ExprParser.y}	  yyval.bvalue := (Pos(String(yyv^[yypvt+(0)].svalue), String(yyv^[yypvt+(-2)].svalue)) > 0);
{LINE 160 ExprParser.y}	
end;

YYr33: begin	(* DateExpr :  _DATE *)
{LINE 162 ExprParser.y}
{LINE 163 ExprParser.y}	  yyval.dvalue := yyv^[yypvt+(0)].dvalue;
{LINE 164 ExprParser.y}	
end;

YYr34: begin	(* DateExpr :  DateExpr _PLUS _DATESPEC _NUM *)
{LINE 165 ExprParser.y}
{LINE 166 ExprParser.y}	  if yyv^[yypvt+(0)].nvalue.NumType <> EXPR_NUMTYPE_INTEGER then
{LINE 167 ExprParser.y}	    yyerror('Double not permitted');
{LINE 168 ExprParser.y}	  case yyv^[yypvt+(-1)].nvalue.ivalue of
{LINE 169 ExprParser.y}	    MSPEC_DAY: yyval.dvalue := yyv^[yypvt+(-3)].dvalue + yyv^[yypvt+(0)].nvalue.ivalue;
{LINE 170 ExprParser.y}	    MSPEC_MONTH: yyval.dvalue := IncMonth(yyv^[yypvt+(-3)].dvalue, yyv^[yypvt+(0)].nvalue.ivalue);
{LINE 171 ExprParser.y}	    MSPEC_YEAR: begin
{LINE 172 ExprParser.y}	      DecodeDate(yyv^[yypvt+(-3)].dvalue, yr, mn, dy);
{LINE 173 ExprParser.y}	      yr := yr + yyv^[yypvt+(0)].nvalue.ivalue;
{LINE 174 ExprParser.y}	      yyval.dvalue := EncodeDate(yr, mn, dy);
{LINE 175 ExprParser.y}	    end;
{LINE 176 ExprParser.y}          end;
{LINE 177 ExprParser.y}	
end;

YYr35: begin	(* DateExpr :  DateExpr _PLUS _DATESPEC '(' NumExpr ')' *)
{LINE 178 ExprParser.y}
{LINE 179 ExprParser.y}	  if yyv^[yypvt+(-1)].nvalue.NumType <> EXPR_NUMTYPE_INTEGER then
{LINE 180 ExprParser.y}	    yyerror('Double not permitted');
{LINE 181 ExprParser.y}	  case yyv^[yypvt+(-3)].nvalue.ivalue of
{LINE 182 ExprParser.y}	    MSPEC_DAY: yyval.dvalue := yyv^[yypvt+(-5)].dvalue + yyv^[yypvt+(-1)].nvalue.ivalue;
{LINE 183 ExprParser.y}	    MSPEC_MONTH: yyval.dvalue := IncMonth(yyv^[yypvt+(-5)].dvalue, yyv^[yypvt+(-1)].nvalue.ivalue);
{LINE 184 ExprParser.y}	    MSPEC_YEAR: begin
{LINE 185 ExprParser.y}	      DecodeDate(yyv^[yypvt+(-5)].dvalue, yr, mn, dy);
{LINE 186 ExprParser.y}	      yr := yr + yyv^[yypvt+(-1)].nvalue.ivalue;
{LINE 187 ExprParser.y}	      yyval.dvalue := EncodeDate(yr, mn, dy);
{LINE 188 ExprParser.y}	    end;
{LINE 189 ExprParser.y}          end;
{LINE 190 ExprParser.y}	
end;

YYr36: begin	(* DateExpr :  DateExpr _MINUS _DATESPEC _NUM *)
{LINE 191 ExprParser.y}
{LINE 192 ExprParser.y}	  if yyv^[yypvt+(0)].nvalue.NumType <> EXPR_NUMTYPE_INTEGER then
{LINE 193 ExprParser.y}	    yyerror('Double not permitted');
{LINE 194 ExprParser.y}	  case yyv^[yypvt+(-1)].nvalue.ivalue of
{LINE 195 ExprParser.y}	    MSPEC_DAY: yyval.dvalue := yyv^[yypvt+(-3)].dvalue - yyv^[yypvt+(0)].nvalue.ivalue;
{LINE 196 ExprParser.y}	    MSPEC_MONTH: yyval.dvalue := IncMonth(yyv^[yypvt+(-3)].dvalue, -yyv^[yypvt+(0)].nvalue.ivalue);
{LINE 197 ExprParser.y}	    MSPEC_YEAR: begin
{LINE 198 ExprParser.y}	      DecodeDate(yyv^[yypvt+(-3)].dvalue, yr, mn, dy);
{LINE 199 ExprParser.y}	      yr := yr - yyv^[yypvt+(0)].nvalue.ivalue;
{LINE 200 ExprParser.y}	      yyval.dvalue := EncodeDate(yr, mn, dy);
{LINE 201 ExprParser.y}	    end;
{LINE 202 ExprParser.y}          end;
{LINE 203 ExprParser.y}	
end;

YYr37: begin	(* DateExpr :  DateExpr _MINUS _DATESPEC '(' NumExpr ')' *)
{LINE 204 ExprParser.y}
{LINE 205 ExprParser.y}	  if yyv^[yypvt+(-1)].nvalue.NumType <> EXPR_NUMTYPE_INTEGER then
{LINE 206 ExprParser.y}	    yyerror('Double not permitted');
{LINE 207 ExprParser.y}	  case yyv^[yypvt+(-3)].nvalue.ivalue of
{LINE 208 ExprParser.y}	    MSPEC_DAY: yyval.dvalue := yyv^[yypvt+(-5)].dvalue - yyv^[yypvt+(-1)].nvalue.ivalue;
{LINE 209 ExprParser.y}	    MSPEC_MONTH: yyval.dvalue := IncMonth(yyv^[yypvt+(-5)].dvalue, -yyv^[yypvt+(-1)].nvalue.ivalue);
{LINE 210 ExprParser.y}	    MSPEC_YEAR: begin
{LINE 211 ExprParser.y}	      DecodeDate(yyv^[yypvt+(-5)].dvalue, yr, mn, dy);
{LINE 212 ExprParser.y}	      yr := yr - yyv^[yypvt+(-1)].nvalue.ivalue;
{LINE 213 ExprParser.y}	      yyval.dvalue := EncodeDate(yr, mn, dy);
{LINE 214 ExprParser.y}	    end;
{LINE 215 ExprParser.y}          end;
{LINE 216 ExprParser.y}	
end;

YYr38: begin	(* DateExpr :  '(' DateExpr ')' *)
{LINE 217 ExprParser.y}
{LINE 218 ExprParser.y}	  yyval.dvalue := yyv^[yypvt+(-1)].dvalue;
{LINE 219 ExprParser.y}	
end;

YYr39: begin	(* NumExpr :  _NUM *)
{LINE 221 ExprParser.y}
{LINE 222 ExprParser.y}	  yyval.nvalue := yyv^[yypvt+(0)].nvalue;
{LINE 223 ExprParser.y}	
end;

YYr40: begin	(* NumExpr :  NumExpr _PLUS NumExpr *)
{LINE 224 ExprParser.y}
{LINE 225 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 226 ExprParser.y}	  res := v1 + v2;
{LINE 227 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 228 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 229 ExprParser.y}	  else
{LINE 230 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 231 ExprParser.y}	
end;

YYr41: begin	(* NumExpr :  NumExpr _MINUS NumExpr *)
{LINE 232 ExprParser.y}
{LINE 233 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 234 ExprParser.y}	  res := v1 - v2;
{LINE 235 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 236 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 237 ExprParser.y}	  else
{LINE 238 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 239 ExprParser.y}	
end;

YYr42: begin	(* NumExpr :  NumExpr _TIMES NumExpr *)
{LINE 240 ExprParser.y}
{LINE 241 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 242 ExprParser.y}	  res := v1 * v2;
{LINE 243 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 244 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 245 ExprParser.y}	  else
{LINE 246 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 247 ExprParser.y}	
end;

YYr43: begin	(* NumExpr :  NumExpr _DIV NumExpr *)
{LINE 248 ExprParser.y}
{LINE 249 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 250 ExprParser.y}	  res := v1 div v2;
{LINE 251 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 252 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 253 ExprParser.y}	  else
{LINE 254 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 255 ExprParser.y}	
end;

YYr44: begin	(* NumExpr :  NumExpr _MOD NumExpr *)
{LINE 256 ExprParser.y}
{LINE 257 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 258 ExprParser.y}	  res := v1 mod v2;
{LINE 259 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 260 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 261 ExprParser.y}	  else
{LINE 262 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 263 ExprParser.y}	
end;

YYr45: begin	(* NumExpr :  NumExpr _DIVIDE NumExpr *)
{LINE 264 ExprParser.y}
{LINE 265 ExprParser.y}	  GetVariantValues(yyv^[yypvt+(-2)].nvalue, yyv^[yypvt+(0)].nvalue, v1, v2);
{LINE 266 ExprParser.y}	  res := v1 / v2;
{LINE 267 ExprParser.y}	  if VarType(res) = varInteger then
{LINE 268 ExprParser.y}	    yyval.nvalue.ivalue := res
{LINE 269 ExprParser.y}	  else
{LINE 270 ExprParser.y}	    yyval.nvalue.dvalue := res;
{LINE 271 ExprParser.y}	
end;

YYr46: begin	(* NumExpr :  '(' NumExpr ')' *)
{LINE 272 ExprParser.y}
{LINE 273 ExprParser.y}	  yyval.nvalue := yyv^[yypvt+(-1)].nvalue;
{LINE 274 ExprParser.y}	
end;

YYr47: begin	(* StrExpr :  _STRING *)
{LINE 276 ExprParser.y}
{LINE 277 ExprParser.y}	  yyval.svalue := yyv^[yypvt+(0)].svalue;
{LINE 278 ExprParser.y}	
end;

YYr48: begin	(* StrExpr :  StrExpr _PLUS StrExpr *)
{LINE 279 ExprParser.y}
{LINE 280 ExprParser.y}	  yyval.svalue := yyv^[yypvt+(-2)].svalue;
{LINE 281 ExprParser.y}          StrCat(yyval.svalue, yyv^[yypvt+(0)].svalue);
{LINE 282 ExprParser.y}	
end;
{LINE 237 "c:/etc/yyparse.pas"}
    YYrACCEPT: begin
      retval := 0;
      goto yyComplete;
    end;
    YYrERROR: goto yyinError;
  end;

  (*
   * Look up next state in goto table.
   *)

  yyp := tblyypgo[yyi];
  yyq := yyp;
  Inc(yyp);
  yyi := yys^[yyps];
  while yyi < tblyygo[yyp] do Inc(yyp);
  if yyi = tblyygo[yyp] then
    yystate := yyneg(tblyygo[yyq + (yyq - yyp)])
  else
    yystate := yyneg(tblyygo[yyq]);
  goto yyStack;

yyerrlabel:     ;               (* come here from YYERROR *)
(*
#pragma used yyerrlabel
 *)
  yyerrflag := 1;
  if yyi = YYrERROR then begin
    Dec(yyps);
    Dec(yypv);
  end;

yyinError:
  case yyerrflag of
    0: begin             (* new error *)
      yynerrs := yynerrs + 1;
      yyi := yychar;
      yyerror('Syntax error');
      if yyi <> yychar then begin
        (* user has changed the current token *)
        (* try again *)
        yyerrflag := yyerrflag + 1;     (* avoid loops *)
        goto yyEncore;
      end;
      goto yygo_on;
    end;
    1, 2: begin          (* partially recovered *)
    yygo_on:
      yyerrflag := 3; (* need 3 valid shifts to recover *)
      (*
       * Pop states, looking for a
       * shift on `error'.
       *)
      while yyps > 0 do begin
        if yys^[yyps] >= Sizeof(tblyypact)/Sizeof(tblyypact[0]) then
          goto yyContin;
        yyp := tblyypact[yys^[yyps]];
        yyq := yyp;
        while YYERRCODE < tblyyact[yyp] do Inc(yyp);
        Inc(yyp);
        if YYERRCODE = tblyyact[yyp-1] then begin
          yystate := yyneg(tblyyact[yyq + (yyq - yyp)]);
          goto yyStack;
        end;
        (* no shift in this state *)
        (* pop stacks; try again *)
      yyContin:
        Dec(yyps); Dec(yypv);
      end; { while }
      (* no shift on error - abort *)
    end;
    3: begin
      (*
       * Erroneous token after
       * an error - discard it.
       *)
      if yychar <> 0 then begin (* but not EOF *)
        yyclearin;
        goto yyEncore;  (* try again in same state *)
      end
    end
  end; { case }
  retval := 1;            { failed }

yyComplete:             { exit yyparse by coming here }
  result := retval;
end;            { end of yyparse proper }

(*
 * Simulate bitwise negation as if it was done on a two's complement machine.
 * This makes the generated code portable to machines with different
 * representations of integers (ie. signed magnitude).
 *)
function yyneg(s: integer): integer;
begin
  result := -(s+1);
end;

{LINE 286 ExprParser.y}function EvaluateExpression(Expr: TStrings; ASymTab: TVariantSymbolTable;
{LINE 287 ExprParser.y}  Errors: TStrings): Boolean;
{LINE 288 ExprParser.y}begin
{LINE 289 ExprParser.y}  yy_reset; yyerrcnt := 0;
{LINE 290 ExprParser.y}  ExprResult := False;
{LINE 291 ExprParser.y}  SymTab := ASymTab;
{LINE 292 ExprParser.y}  yyin := TMemoryStream.Create;
{LINE 293 ExprParser.y}  yyout := TMemoryStream.Create;
{LINE 294 ExprParser.y}  yyerr := TMemoryStream.Create;
{LINE 295 ExprParser.y}  try
{LINE 296 ExprParser.y}    Expr.SaveToStream(yyin);
{LINE 297 ExprParser.y}    yyin.Seek(0, soFromBeginning);
{LINE 298 ExprParser.y}    yyparse;
{LINE 299 ExprParser.y}    yyerr.Seek(0, soFromBeginning);
{LINE 300 ExprParser.y}    Errors.LoadFromStream(yyerr);
{LINE 301 ExprParser.y}  finally
{LINE 302 ExprParser.y}    yyin.Free; yyout.Free; yyerr.Free;
{LINE 303 ExprParser.y}    result := ExprResult;
{LINE 304 ExprParser.y}  end;
{LINE 305 ExprParser.y}end;
{LINE 306 ExprParser.y}
{LINE 307 ExprParser.y}procedure GetVariantValues(val1, val2: TExprNumber; var var1, var2: Variant);
{LINE 308 ExprParser.y}begin
{LINE 309 ExprParser.y}  if val1.NumType = EXPR_NUMTYPE_INTEGER then
{LINE 310 ExprParser.y}    var1 := val1.ivalue
{LINE 311 ExprParser.y}  else
{LINE 312 ExprParser.y}    var1 := val1.dvalue;
{LINE 313 ExprParser.y}  if val2.NumType = EXPR_NUMTYPE_INTEGER then
{LINE 314 ExprParser.y}    var2 := val2.ivalue
{LINE 315 ExprParser.y}  else
{LINE 316 ExprParser.y}    var2 := val2.dvalue;
{LINE 317 ExprParser.y}end;
{LINE 318 ExprParser.y}
{LINE 319 ExprParser.y}initialization
{LINE 320 ExprParser.y}
{LINE 321 ExprParser.y}//  InitializeCriticalSection(cs_globs);
{LINE 322 ExprParser.y}
{LINE 323 ExprParser.y}finalization
{LINE 324 ExprParser.y}
{LINE 325 ExprParser.y}//  DeleteCriticalSection(cs_globs);
{LINE 326 ExprParser.y}
{LINE 327 ExprParser.y}end.
{LINE 328 ExprParser.y}
{LINE 329 ExprParser.y}

