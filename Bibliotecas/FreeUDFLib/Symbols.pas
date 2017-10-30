(* lex -LP -o Symbols.pas Symbols.l *)
{LINE 1 Symbols.l}

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
type
	yy_state_t = byte;
const
	YYNEWLINE = 10;
	INITIAL = 0;
	YYSYMBOL_VALUE = 2;
const
	yy_endst = 15;
	yy_nxtmax = 314;

{LINE 1 c:/etc/yylex.pas}
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
{$B-}		(* short circuit boolean evaluation *)
{$I-}           (* suppress I/O runtime library checks *)
{$J-}           (* Don't allow assignable constants *)

const
	YY_LA_SIZE = 2;

type tableyy_la_act = array[0..10] of word;
var yy_la_act: ^tableyy_la_act;
const tblyy_la_act: tableyy_la_act = (
 1, 0, 2, 3, 4, 5, 7, 6, 6, 5, 0
);

type tableyy_look = array[0..0] of byte;
var yy_look: ^tableyy_look;
const tblyy_look: tableyy_look = (
 0
);

type tableyy_final = array[0..15] of integer;
var yy_final: ^tableyy_final;
const tblyy_final: tableyy_final = (
 0, 0, 0, 1, 2, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 10

);

type tableyy_begin = array[0..4] of yy_state_t;
var yy_begin: ^tableyy_begin;
const tblyy_begin: tableyy_begin = (
 0, 0, 4, 4, 0
);

type tableyy_next = array[0..315] of yy_state_t;
var yy_next: ^tableyy_next;
const tblyy_next: tableyy_next = (
 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, 2, 2, 2, 15, 2,
 11, 11, 15, 15, 11, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
 2, 15, 2, 15, 15, 15, 15, 11, 15, 15, 15, 15, 15, 15, 1, 12,
 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 15, 15, 15, 15, 15,
 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 15, 15, 15, 15, 1,
 15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 15, 3, 3, 3,
 3, 3, 3, 3, 3, 3, 3, 15, 15, 15, 15, 15, 15, 15, 3, 3,
 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 3, 3, 3, 3, 3, 3, 3, 3, 15, 15, 15, 15, 3, 15, 3, 3,
 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 3, 3, 3, 3, 3, 3, 3, 3, 11, 11, 15, 15, 11, 13, 13, 13,
 13, 13, 13, 13, 13, 13, 13, 15, 15, 15, 15, 15, 15, 15, 15, 11,
 15, 6, 15, 8, 15, 15, 5, 15, 15, 15, 15, 15, 9, 15, 15, 10,
 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 14, 14, 14, 14, 14, 14,
 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0
);

type tableyy_check = array[0..315] of yy_state_t;
var yy_check: ^tableyy_check;
const tblyy_check: tableyy_check = (
 $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, 0, 0, 2, 2, 0, $FF, 2,
 11, 11, $FF, $FF, 11, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
 0, $FF, 2, $FF, $FF, $FF, $FF, 11, $FF, $FF, $FF, $FF, $FF, $FF, 0, 10,
 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, $FF, $FF, $FF, $FF, $FF,
 $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $FF, $FF, $FF, $FF, 0,
 $FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, $FF, 1, 1, 1,
 1, 1, 1, 1, 1, 1, 1, $FF, $FF, $FF, $FF, $FF, $FF, $FF, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, $FF, $FF, $FF, $FF, 1, $FF, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, $FF, $FF, 4, 12, 12, 12,
 12, 12, 12, 12, 12, 12, 12, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, 4,
 $FF, 4, $FF, 4, $FF, $FF, 4, $FF, $FF, $FF, $FF, $FF, 4, $FF, $FF, 4,
 4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8, 8,
 8, 8, 8, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
 $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
 $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
 $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, 4, 0
);

type tableyy_default = array[0..15] of yy_state_t;
var yy_default: ^tableyy_default;
const tblyy_default: tableyy_default = (
 15, 15, 15, 1, 15, 15, 15, 15, 15, 10, 15, 15, 15, 12, 8, 0

);

type tableyy_base = array[0..15] of integer;
var yy_base: ^tableyy_base;
const tblyy_base: tableyy_base = (
 0, 77, 2, 315, 191, 315, 315, 315, 201, 2, 1, 7, 157, 315, 315, 315

);


{LINE 21 c:/etc/yylex.pas}


(*
 * the following can be redefined by the user.
 *)
{$IFNDEF YYLMAX_DEFINED}
{$DEFINE YYLMAX_DEFINED}
const
  YYLMAX = 100;		(* token and pushback buffer size *)
  YYLMAX1 = 101;    	(**** always 1 more then YYLMAX ****)
{$ENDIF}

(*
 * yy_sbuf[0:yyleng-1] contains the states corresponding to yytext.
 * yytext[0:yyleng-1] contains the current token.
 * yytext[yyleng:yy_end-1] contains pushed-back characters.
 * When the user action routine is active,
 * yy_save contains yytext[yyleng], which is set to '\0'.
 * Things are different when YY_PRESERVE is defined.
 * YYFILE_EXTERNAL allows the definition of yyin and yyout in
 * other modules of your Pascal project based on lex output
 *)
var
   cs_globs :  TRTLCriticalSection;

threadvar
{$IFNDEF YYTEXT_BUF_EXTERNAL}
	yytext: array[0..YYLMAX1] of char; (* text buffer (really yytext) *)
{$ENDIF}
	yy_sbuf: array[0..YYLMAX1] of yy_state_t;	(* state buffer *)
{$IFNDEF YYIOSTREAMED}
{$IFNDEF YYFILE_EXTERNAL}
	yyin,
	yyout,
        yyerr: text;
{$ENDIF}
{$ENDIF}
	yyLexFatal: integer;

const
  YY_INTERACTIVE = 1;  (* bit faster if 0 *)
  yybits: array[0..7] of Byte = (1, 2, 4, 8, 16, 32, 64, 128);

threadvar
  yylineno,
  yyleng,
  yy_end,
  yy_start,
  yy_lastc: Integer;
  yy_save: char;		(* saved yytext[yyleng] *)

(* Need a definition for yywrap to compile
 * Either issue 'use wrap' after compiling /lib/yywrap.pas,
 * or uncomment the following simple definition:
 *)
{$IFNDEF YYWRAP_EXTERNAL}
function yywrap: integer;
begin
  yywrap := 1;
end;
{$ENDIF}

(* built-in functions for yylex *)

function input: integer; forward;
procedure unput(c: integer); forward;

procedure ECHO (msg: string);
begin
{$IFNDEF YYIOSTREAMED}
  write(yyout, msg);
{$ELSE}
  yyout.WriteBuffer(msg[1], Length(msg));
{$ENDIF}
end;

(*
 * yygetc: return next character from input
 * Turbo Pascal seems to have a bug in release 4.0
 * wherein Eof(yyin) fails after ^Z is typed on a terminal read
 * Suppress runtime library checking and do our own.
 *)
function yygetc : integer;
var
  ch: char;
begin
{$IFNDEF YYIOSTREAMED}
  if not EOF(yyin) then begin
    Read(yyin, ch);
    if IOResult <> 0 then
      result := -1
    else
      result := ord(ch)
  end else
    result := -1
{$ELSE}
  (* Read the input from TStream object *)
  if yyin.Position < yyin.Size then begin
    yyin.ReadBuffer(ch, 1);
    result := Ord(ch);
  end else
    result := -1;
{$ENDIF}
end;

procedure output(c: char);
begin
{$IFNDEF YYIOSTREAMED}
  write(yyout, c);
{$ELSE}
  yyout.WriteBuffer(c, 1);
{$ENDIF}
end;

procedure YY_FATAL (msg: string);
begin
{$IFNDEF YYIOSTREAMED}
  writeln(yyerr, 'yylex: ',msg);
{$ELSE}
  msg := msg + #13 + #10;
  yyout.WriteBuffer(msg[1], Length(msg));
{$ENDIF}
  yyLexFatal := 1;
end;

procedure YY_INIT;
begin
  yy_start := 0;
  yyleng := 0;
  yy_end := 0;
  yy_lastc := YYNEWLINE
end;

procedure yy_reset;
begin
  YY_INIT;
  yylineno := 1;
end;

procedure YYBEGIN (state: integer);
begin
  yy_start := state
end;

procedure NLSTATE;
begin
  yy_lastc := YYNEWLINE
end;

(*
 * the following must not be redefined.
 *)
procedure YY_SCANNER; forward;
procedure YY_USER; forward;

procedure YY_USER;	(* set up yytext for user *)
begin
  yy_save := yytext[yyleng];
  yytext[yyleng] := Char(0)
end;

procedure YY_SCANNER;	(* set up yytext for scanner *)
begin
  yytext[yyleng] := yy_save
end;

procedure yyless (n: integer);
begin
  if (n >= 0) and (n <= yy_end) then begin
    YY_SCANNER;
    yyleng := n;
    YY_USER
  end
end;

(* The following (yycomment) can be changed *)

(*J * yycomment(trailing-comment-string)
 *	skip comment input, accounting for newlines
 *)
procedure yycomment (mat: string);
var
  c:	integer;
  icp:	integer;
  done:	boolean;
begin
  icp := c;
  done := false;
  while (icp <= length(mat)) and (not done) do begin
    c := input;
    if c = -1 then begin
      YY_FATAL('end of file in comment');
      done := true
    end else if c <> ord(mat[icp]) then begin
      if c = ord(mat[1]) then
        icp := 2
      else
        icp := 1;
    end else
      inc(icp)
  end;
end;


(*
 * The actual lexical scanner
 *)
function yylex : integer;

{LINE 230 c:/etc/yylex.pas}

var
	retval, c, i, yyst, yybase: integer;
	yyfmin, yyfmax: integer;	(* yy_la_act index of final states *)
	yyoldi, yyoleng: integer;	(* base i, yyleng before look-ahead *)
	yyeof: integer;			(* 1 if eof has already been read *)
label
	yy_again,
	yy_contin,
	yy_jammed,
	yy_search,
	yy_found,
	done_loop,
	loop_exit,
	yy_reject,
	yy_more,
	yylexReturn;

begin
  yyLexFatal := 0;
  yyeof := 0;
  i := yyleng;
  YY_SCANNER;

  yy_again:
    yyleng := i;
    (* determine previous char. *)
    if i > 0 then
      yy_lastc := Integer(yytext[i-1]);
    (* scan previously accepted token adjusting yylineno *)
    while (i > 0) do begin
      dec(i);
      if Integer(yytext[i]) = YYNEWLINE then
        inc(yylineno)
    end;
    (* adjust pushback *)
    dec(yy_end, yyleng);
    for i := 0 to yy_end - 1 do
      yytext[i] := yytext[yyleng + i];
    i := 0;
  yy_contin:
    yyoldi := i;

    (* run the state machine until it jams *)
    if yy_lastc = YYNEWLINE then
      yyst := tblyy_begin[yy_start + 1]
    else
      yyst := tblyy_begin[yy_start];
    yy_sbuf[i] := yyst;

    repeat
      if i >= YYLMAX then begin
        YY_FATAL('Token buffer overflow');
	if yyLexFatal = 1 then begin
	  retval := -2;
	  goto yylexReturn;
        end;
      end;
      (* get input char *)
      if i < yy_end then
        c := Integer(yytext[i])    (* get pushback char *)
      else begin
      	if yyeof = 0 then
	  c := yygetc
        else
	  c := -1;
        if c <> -1 then begin
          yy_end := i+1;
	  yytext[i] := chr(c)
        end else begin	(* end of file *)
          if i = yyoldi then begin
            yyeof := 0;
	    if yywrap <> 0 then begin
              retval := 0;
              goto yylexReturn
            end else
              goto yy_again
          end else begin
            yyeof := 1;	(* don't re-read EOF *)
            goto loop_exit
          end
        end
      end;
      (* look up next state *)
      yybase := tblyy_base[yyst] + c;
      while (yybase > yy_nxtmax) or (tblyy_check[yybase] <> yyst) do begin
        if yyst = yy_endst then
          goto yy_jammed;
        yyst := tblyy_default[yyst];
        yybase := tblyy_base[yyst] + c
      end;
      yyst := tblyy_next[yybase];

    yy_jammed:
      inc(i);
      yy_sbuf[i] := yyst
    until (yyst = yy_endst) or (YY_INTERACTIVE <> 0) and
          (tblyy_base[yyst] > yy_nxtmax) and
          (tblyy_default[yyst] = yy_endst) ;

  loop_exit:
    if yyst <> yy_endst then
      inc(i);

  yy_search:
    (* search backward for a final state *)
    dec(i);
    while i > yyoldi do begin
      yyst := yy_sbuf[i];
      yyfmin := tblyy_final[yyst];
      yyfmax := tblyy_final[yyst+1];
      if yyfmin < yyfmax then
        goto yy_found;	(* found final state(s) *)
      dec(i);
    end;
    (* no match, default action *)
    i := yyoldi + 1;
    output(char(yytext[yyoldi]));
    goto yy_again;

  yy_found:
    yyoleng := i;		(* save length for REJECT *)
    (* pushback look-ahead RHS *)
    c := (integer(tblyy_la_act[yyfmin]) shr 9) - 1;

    if c >= 0 then begin		(* trailing context? *)
      while true do begin
        dec(i);
        if i < yyoldi then begin
          i := yyoleng;
          goto done_loop
        end else begin
          yyst := yy_sbuf[i];
          if ((tblyy_look[c*YY_LA_SIZE+word(yyst) div 8] and
               yybits[word(yyst) mod 8]) <> 0) then
            goto done_loop;
        end
      end;
    done_loop:
    end;

    (* perform action *)
    yyleng := i;
    YY_USER;
    case (tblyy_la_act[yyfmin] and $1FF) of
0:
begin
{LINE 45 Symbols.l}
	
  sym_name := String(yytext);
  YYBEGIN(YYSYMBOL_VALUE);


end;
1:
begin
{LINE 49 Symbols.l}
	
  // Do nothing with whitespace


end;
2:
begin
{LINE 52 Symbols.l}
	
  GetValue(Integer(''''));
  sym_val := String(yytext);
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;


end;
3:
begin
{LINE 59 Symbols.l}
	
  GetValue(Integer('"'));
  sym_val := String(yytext);
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;


end;
4:
begin
{LINE 66 Symbols.l}
	
  GetValue(Integer('}'));
  sym_val := StrToDate(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;


end;
5:
begin
{LINE 73 Symbols.l}
	
  sym_val := StrToInt(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;


end;
6:
begin
{LINE 79 Symbols.l}
	
  sym_val := StrToFloat(String(yytext));
  YYBEGIN(INITIAL);
  retval := 1;
  goto yylexReturn;


end;
7:
begin
{LINE 85 Symbols.l}
	
  // Do nothing


end;

{LINE 375 c:/etc/yylex.pas}

    end;
    YY_SCANNER;
    i := yyleng;
    goto yy_again;			(* action fell though *)

  yy_reject:
    YY_SCANNER;
    i := yyoleng;			(* restore original yytext *)
    inc(yyfmin);
    if yyfmin < yyfmax then
      goto yy_found		(* another final state, same length *)
    else
      goto yy_search;		(* try shorter yytext *)

  yy_more:
    YY_SCANNER;
    i := yyleng;
    if i > 0 then
      yy_lastc := Integer(yytext[i-1]);
    goto yy_contin;

yylexReturn:
    result := retval
end;		{ end of yylex }

(*
 * user callable input/unput functions.
 *)
(* get input char with pushback *)
function input: integer;
var
  c: integer;
begin
  if yy_end > yyleng then begin
    dec(yy_end);
    for c := 0 to yy_end-yyleng-1 do
      yytext[yyleng+c] := yytext[yyleng+1+c];
    c := ord(yy_save);
    YY_USER;
  end else
    c := yygetc;
  yy_lastc := c;
  if c = YYNEWLINE then
    inc(yylineno);
  result := c;
end;

(* pushback char *)
procedure unput(c: integer);
var
  i: word;
begin
  if yy_end >= YYLMAX then
    YY_FATAL('Push-back buffer overflow')
  else begin
    if yy_end > yyleng then begin
      yytext[yyleng] := yy_save;
      for i := 0 to yy_end - yyleng - 1 do
        yytext[yyleng+i+1] := yytext[yyleng];
      yytext[yyleng] := Char(0);
    end;
    inc(yy_end);
    yy_save := chr(c);

    if c = YYNEWLINE then
      dec(yylineno);
  end;
end;

procedure yylex_initialization;
begin
  InitializeCriticalSection(cs_globs);
  yy_reset;
end;

procedure yylex_finalization;
begin
  DeleteCriticalSection(cs_globs);
end;

{LINE 89 Symbols.l}

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
