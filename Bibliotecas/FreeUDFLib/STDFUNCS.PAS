(*
 * StdFuncs -
 *   A file chock full of functions that should exist in Delphi, but
 *   don't, like "Max", "GetTempFile", "Soundex", etc...
 *)
unit StdFuncs;

interface

uses
  Windows, Classes, SysUtils;

type
  EParserError = class(Exception);
  TCharSet = set of Char;

function FindTokenStartingAt(st: String; var i: Integer;
  TokenChars: TCharSet; TokenCharsInToken: Boolean): String;
function GetTempFile(FilePrefix: String): String;
function Max(n1, n2: Integer): Integer;
function Min(n1, n2: Integer): Integer;
function Soundex(st: String): String;
function StripString(st: String; CharsToStrip: String): String;
function Year(d: TDateTime): Integer;

var
  TempPath: PChar;
  TempPathLength: Integer;

implementation

uses
  StdConsts;

function FindTokenStartingAt(st: String; var i: Integer;
  TokenChars: TCharSet; TokenCharsInToken: Boolean): String;
var
  Len, j: Integer;
begin
  if (i < 1) then i := 1;
  j := i; Len := Length(st);
  while (j <= Len) and
        ((TokenCharsInToken and (not (st[j] in TokenChars))) or
         ((not TokenCharsInToken) and (st[j] in TokenChars))) do Inc(j);
  i := j;
  while (j <= Len) and
        (((not TokenCharsInToken) and (not (st[j] in TokenChars))) or
         (TokenCharsInToken and (st[j] in TokenChars))) do Inc(j);
  if (i > Len) then
    result := ''
  else
    result := Copy(st, i, j - i);
  i := j;
end;

function GetTempFile(FilePrefix: String): String;
var
  sz: PChar;
begin
  GetMem(sz, TempPathLength + EIGHT_PLUS_THREE + 3);
  try
    GetTempFileName(TempPath, PChar(FilePrefix), 0, sz);
    result := String(sz);
  finally
    FreeMem(sz);
  end;
end;

function Max(n1, n2: Integer): Integer;
begin
  if (n1 > n2) then
    result := n1
  else
    result := n2;
end;

function Min(n1, n2: Integer): Integer;
begin
  if (n1 < n2) then
    result := n1
  else
    result := n2;
end;

function Soundex(st: String): String;
var
  code: Char;
  i, j, len: Integer;
begin
  result := ' 0000';
  if (st = '') then exit;
  result[1] := UpCase(st[1]);
  j := 2;                   
  i := 2;
  len := Length(st);
  while (i <= len) and (j < 6) do begin
    case st[i] of
      'B', 'F', 'P', 'V', 'b', 'f', 'p', 'v' : code := '1';
      'C', 'G', 'J', 'K', 'Q', 'S', 'X', 'Z',
      'c', 'g', 'j', 'k', 'q', 's', 'x', 'z' : code := '2';
      'D', 'T', 'd', 't' :                     code := '3';
      'L', 'l' :                               code := '4';
      'M', 'N', 'm', 'n' :                     code := '5';
      'R', 'r' :                               code := '6';
    else
      code := '0';
    end; {case}

    if (code <> '0') and (code <> result[j - 1]) then begin
      result[j] := code;
      inc(j);
    end;
    inc(i);
  end;
end;

function StripString(st: String; CharsToStrip: String): String;
var
  i: Integer;
begin
  result := '';
  for i := 1 to Length(st) do begin
    if Pos(st[i], CharsToStrip) = 0 then
      result := result + st[i];
  end;
end;

function Year(d: TDateTime): Integer;
var
  y, m, day: Word;
begin
  DecodeDate(d, y, m, day);
  result := y;
end;

initialization

  TempPathLength := GetTempPath(0, nil) + 1;
  GetMem(TempPath, TempPathLength);
  GetTempPath(TempPathLength, TempPath);

finalization

  FreeMem(TempPath, TempPathLength);

end.
