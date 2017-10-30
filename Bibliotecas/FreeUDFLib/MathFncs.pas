unit MathFncs;

interface

function DollarVal(var Value: Double): PChar; cdecl; export;
function DoubleAbs(var Value: Double): Double; cdecl; export;
function FixedPoint(var Value: Double; var DecimalPlaces: Integer): PChar; cdecl; export;
function IntegerAbs(var Value: Integer): Integer; cdecl; export;
function Modulo(var Numerator, Denominator: Integer): Integer; cdecl; export;
function IsDivisibleBy(var Numerator, Denominator: Integer): Integer; cdecl; export;
function RoundFloat(var Value, RoundToNearest: Double): Double; cdecl; export;
function Truncate(var Value: Double): Integer; cdecl; export;

implementation

uses
  SysUtils, udf_glob;

function DollarVal(var Value: Double): PChar;
begin
  {$ifdef FULDebug}
  WriteDebug('DollarVal() - Enter');
  {$endif}
  result := MakeResultString(PChar(Format('%.2m', [Value])), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('DollarVal() - Exit');
  {$endif}
end;

function DoubleAbs(var Value: Double): Double;
begin
  {$ifdef FULDebug}
  WriteDebug('DoubleAbs() - Enter');
  {$endif}
  result := Abs(Value);
  {$ifdef FULDebug}
  WriteDebug('DoubleAbs() - Exit');
  {$endif}
end;

function FixedPoint(var Value: Double; var DecimalPlaces: Integer): PChar;
begin
  {$ifdef FULDebug}
  WriteDebug('FixedPoint() - Enter');
  {$endif}
  result := MakeResultString(
    PChar(Format('%.*f', [DecimalPlaces, Value])), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('FixedPoint() - Exit');
  {$endif}
end;

function IntegerAbs(var Value: Integer): Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('IntegerAbs() - Enter');
  {$endif}
  result := Abs(Value);
  {$ifdef FULDebug}
  WriteDebug('IntegerAbs() - Exit');
  {$endif}
end;

{ In the following two functions, I have made the following "judgment".
    Since InterBase will crash if the user accidentally "divides by zero",
    these functions return an "inappropriate" value when confronted with
    a Denominator = 0. In particular, Modulo, will return 0, which is
    an arbitrary value. IsDivisibleBy simply returns false.
    Any SYSDBA should keep this in mind when using these functions }
function Modulo(var Numerator, Denominator: Integer): Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('Modulo() - Enter');
  {$endif}
  if (Denominator = 0) then
    result := 0
  else
    result := Numerator mod Denominator;
  {$ifdef FULDebug}
  WriteDebug('Modulo() - Exit');
  {$endif}
end;

function IsDivisibleBy(var Numerator, Denominator: Integer): Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('IsDivisibleBy() - Enter');
  {$endif}
  if (Denominator = 0) then
    result := 0
  else if (Numerator = 0) then
    result := 1
  else if (Numerator mod Denominator > 0) then
    result := 0
  else result := 1;
  {$ifdef FULDebug}
  WriteDebug('IsDivisibleBy() - Exit');
  {$endif}
end;

function RoundFloat(var Value, RoundToNearest: Double): Double;
var
  int_val, int_rnd, remainder: Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('RoundFloat() - Enter');
  {$endif}
  int_val := Round(Value * 100.00);
  int_rnd := Round(RoundToNearest * 100.00);
  if int_rnd = 0 then begin
    result := 0;
    exit;
  end;
  remainder := int_val mod int_rnd;
  if (remainder > 0) then begin
    if (int_rnd div remainder > 2) then // round down
      result := int_val - remainder
    else                                // round up
      result := int_val + (int_rnd - remainder);
    // Now divide the result by 100 to get the proper result.
    result := result / 100;
  end else
    result := Value;
  {$ifdef FULDebug}
  WriteDebug('RoundFloat() - Exit');
  {$endif}
end;

function Truncate(var Value: Double): Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('Truncate() - Enter');
  {$endif}
  result := Trunc(Value);
  {$ifdef FULDebug}
  WriteDebug('Truncate() - Exit');
  {$endif}
end;

end.
