// Alpha version

{********************************************************}
{                                                        }
{       InterBase User Defined Fuctions examples         }
{       Copyright (c) 1996 Borland Demo Center           }
{                                                        }
{       Written by:                                      }
{         Oleg Kukarthev                                 }
{         E-mail: ok@bor.compnet.ru                      }
{                                                        }
{********************************************************}

{.$Define Debug}
// Creating User Defined Fuctions is explained in the
// InterBase Programmer's Guide, chapter 11, pp.213-224

// Declaring with User Defined Fuctions is explained in the
// InterBase Data Definition Guide, chapter 11, pp.171-174

unit UDFLib;

interface
uses
  SysUtils;

type
// C, C++     Delphi          InterBase
  Short     = SmallInt;    // SmallInt
  Long      = Longint;     // Integer
  // int    = Integer;     // Integer
  Float     = Single;      // Float
  // Double = Double;      // Double
  // *void, *char = PChar; // Char(???), VarChar(???), CString

  PSmallInt = ^SmallInt;
  PInteger  = ^Integer;
  PShort    = ^Short;
  PLong     = ^Long;
  PFloat    = ^Float;
  PDouble   = ^Double;

  TBlob = record
    GetSegment : function(Handle : Pointer; Buffer : PChar;
     SegmentLen : Integer; var Length : Integer) : WordBool; cdecl;
    Handle : Pointer;               // Blob handle
    SegCount,                       // Number of Blob segments
    MaxSegLength,                   // Max length of Blob segment
    TotalLength : Integer;          // Total Blob length
    PutSegment : procedure; cdecl;
  end;

  PIBDateTime = ^TIBDateTime;
  TIBDateTime = record
    Days,                           // Date: Days since ??.??.????
    MSec10 : Integer;               // Time: Millisecond * 10 since midnigth
  end;

const                               // Date translation constants
  MSecsPerDay10 = MSecsPerDay * 10; // Milliseconds per day * 10
  IBDateDelta = 15018;              // Days between Delphi and InterBase dates

  ResultStringSize = 255;

// Variable to return values in, needs to be static (global).
var
  ResultString: Array [0..ResultStringSize] of Char;
  ResultSmallInt: SmallInt;
  ResultInteger: Integer;
  ResultFloat: Float;
  ResultDouble: Double;
  ResultIBDateTime: TIBDateTime;

  {$Ifdef Debug}
    X : Text;
  {$Endif}

const
 {MaxBufSize = 32768;}
  MaxBufSize = 256;

implementation

// SmallInt, Integer, Single and Double usage examples:

// ==============================================
// User Defined Function definition example:
//  declare external function Add_Short_Long  <- Name of UDF
//    smallint, integer    <- parameters are passed by REFERENCE ALWAYS !!!
//  returns
//    integer by value     <- Result is returned either by VALUE or by REFERENCE
//  entry_point "Add_A"    <- this name is case sensitive !!!
//  module_name "UDFDemo"; <- this is DLL name, where function resides
// ==============================================
function Add_A(var iSmall: SmallInt; var iLong: Integer): Integer; cdecl; export;
//             ^^^                   ^^^                  ^^^^^^^  ^^^^^  ^^^^^^
//          by reference          by reference         by value    call convention
begin
  Result := iSmall + iLong;
end;

// ==============================================
//  declare external function ...
//    smallint, integer    <- parameters are passed by REFERENCE
//  returns
//    integer              <- Result is returned ether by VALUE or by REFERENCE
//  entry_point "Add_B"    <- this name is case sensitive !!!
//  module_name "UDFDemo"; <- this is DLL name where function is reside !!!
// ==============================================
function Add_B(var iSmall: SmallInt; var iLong: Integer): PInteger; cdecl; export;
//             ^^^                   ^^^                  ^^^^^^^^
//          by reference          by reference         by reference
begin
  ResultInteger := iSmall + iLong;
//^^^^^^^^^^^^^ this is static (global) variable in DataSeg, not on Stack !!!
// Win32 each process using DLL maps DLLs DataSeg to the process address space,
// so each process have its own copy of ResultInteger
  Result := @ResultInteger;
end;

// ==============================================
//  declare external function ...
//    smallint
//  returns
//    double by value
//  ...
//  ...
// ==============================================
function Factorial(var n: SmallInt): Double; cdecl; export;
var
 n_1 : SmallInt;
begin
  n_1 := n - 1;
  if (n < 0) or (n > 100) then
    Result := -1.0
  else if n = 0 then
    Result := 1.0
  else
    Result := Factorial(n_1) * n;
end;


// Char(CString), VarChar usage examples:
// Example:
//  After writeing string 'ABCDE' to a Char(10) field, it contains
//   'ABCDE     ' i.e. Char(NNN) fields always padded with spaces to
//   the length NNN.
//  So 'A', 'A    ' and 'A         ' strings are equal from the point
//  of view Char(10) field,
//  if You want to make a distinglish there strings, use VarChar(10) field.

procedure TrimRight(CString: PChar);
var
  PChr: PChar;
begin
  PChr := CString + StrLen(CString) - 1;
  while (PChr > CString) and (PChr[0] = ' ') do
   Dec(PChr);
  PChr[1] := #0;
end;

// ==============================================
//  declare external function ...
//    cstring(1000), varchar(1000) <- If actual parameter size > declared size
//                                    string truncation ERROR will occur
//  returns
//    varchar(1000)                <- If result string size > declared size
//                                    result string truncation will occur
//  ...                               If result string size < declared size
//  ...                               result string will be expanded with spaces
// ==============================================
function ConcatString_A(CString, VarChar: PChar): PChar; cdecl; export;
var
  CStringLength, VarCharLength: SmallInt;
begin
  TrimRight(CString);
  CStringLength := StrLen(CString);
  //               ^^^^^^ UDF can use some functions ...

  // 1st and 2nd bytes of a VarChar are the length of the VarChar
  VarCharLength := PSmallInt(VarChar)^;
  // VarCharLength := StrLen(VarChar + 2); <- Never use that !!!

  {$Ifdef Debug}
    Writeln(X, '*** ConcatString_A ***');
    Writeln(X, 'CStringLength ', CStringLength);
    Writeln(X, 'VarCharLength ', VarCharLength);
    Writeln(X);
    Flush(X);
  {$Endif}

  StrCopy(ResultString + 2, CString);
  StrLCat(ResultString + 2, VarChar + 2, CStringLength + VarCharLength);

  // Set VarChar length
  PSmallInt(@ResultString)^ := CStringLength + VarCharLength;

  Result := ResultString;
end;

// ==============================================
//  declare external function ...
//    varchar(1000)
//  returns
//    cstring(1000)
//  ...
//  ...
// ==============================================
function ConcatString_B(CString, VarChar: PChar): PChar; cdecl; export;
var
  CStringLength, VarCharLength: SmallInt;
begin
  TrimRight(CString);

  CStringLength := StrLen(CString);
  VarCharLength := PSmallInt(VarChar)^;

  StrCopy(ResultString, CString);
  StrLCat(ResultString, VarChar + 2, CStringLength + VarCharLength);
  ResultString[CStringLength + VarCharLength] := #0;

  Result := ResultString;
end;

// ==============================================
//  declare external function ...
//    cstring(1000)
//  returns
//    integer by value
//  ...
//  ...
// ==============================================
function CharLength(CString: PChar): Integer; cdecl; export;
begin
  Result := StrLen(CString);
end;

// If you don't want to use static variable to return values for
// cstring(?), varchar(?), you must use following declaration:
// ==============================================
//  declare external function ...
//    integer, varchar(10) <- parameters are passed by REFERENCE
//  returns
//    parameter 2          <- Result is returned by REFERENCE
//  ...                       in 2-nd input variable
//  ...
// ==============================================
// Caution: Don't work for Integer, Single etc. types,
// so use return by value instead
procedure HexValue(var iLong: Integer; VarChar: PChar); cdecl; export;
//                 ^^^                          ^^^^^
//              by reference    preallocated area pointer,
var                         //  used for store function result
  HexStr : ShortString;
begin
  HexStr := IntToHex(iLong, 8);
  try
    StrPCopy(VarChar + 2, HexStr);
    // StrPCopy(VarChar + 2, '$' + HexStr);
    // StrPCopy(VarChar + 2, '0x' + HexStr);
    PSmallInt(VarChar)^ := Length(HexStr);
  except
    // I'm not sure this actually protect InterBase from crush,
    // so declare ... varchar(sufficient length) to avoid any exceptions
    PSmallInt(VarChar)^ := 0; // Exit beyond preallocated area
  end;
end;

// ==============================================
//  declare external function ...
//    varchar(1000)
//  returns
//    integer by value
//  ...
//  ...
// ==============================================
function VarCharLength(VarChar: PChar): Integer; cdecl; export;
begin
  Result := PSmallInt(VarChar)^;
  // Result := StrLen(VarChar + 2); <- Never use that !!!
end;

// Date usage examples:

// ==============================================
//  declare external function ...
//    date
//  returns
//    cstring(255)
//  ...
//  ...
// ==============================================
function DateToString(var IBDateTime: TIBDateTime): PChar; cdecl; export;
var
  DateTime: TDateTime;
begin
  with IBDateTime do
    DateTime := Days - IBDateDelta + MSec10 / MSecsPerDay10;

  StrPCopy(ResultString,
    FormatDateTime('"Date is" dddd, dd mmmm yyyy  "Time is" h:mm:ss', DateTime));

  Result := ResultString;
end;

// ==============================================
//  declare external function ...
//                   <- No parameters
//  returns
//    date
//  ...
//  ...
// ==============================================
function NowToDate: PIBDateTime; cdecl; export;
var
  DateTime: TDateTime;
  DelphyDays : Integer;
begin
  DateTime := Now;
  DelphyDays := Trunc(DateTime);
  with ResultIBDateTime do begin
    Days := DelphyDays + IBDateDelta;
    MSec10 := Trunc((DateTime - DelphyDays) * MSecsPerDay10);
  end;
  Result := @ResultIBDateTime;
end;

// Debugging usage examples:

function CheckPoint(CString: PChar): Integer; cdecl; export;
begin
  {$Ifdef Debug}
    Writeln(X, '*** ', CString);
    Flush(X);
  {$Endif}
  Result := 0;
end;

// Blob usage examples:

// ==============================================
//  declare external function ...
//    blob
//  returns
//    cstring(255)
//  ...
//  ...
// ==============================================
function BlobInfo(var Blob : TBlob) : PChar; cdecl; export;
begin
  with Blob do
    if Assigned(Handle) then
      StrLFmt(ResultString, ResultStringSize,
        'num. of seg.:%d  max. seg. len.:%d  total len.:%d',
        [SegCount, MaxSegLength, TotalLength])
    else
      StrCopy(ResultString, '<empty BLOB>');

  Result := ResultString;
end;


function SearchSample(Buf, Sample : PChar) : Boolean;
begin
  Result := StrPos(Buf, Sample) <> nil;
end;

{ read blob segments to ResultString, until it possible }
function FillBuffer(var Blob : TBlob; Buf : PChar; FreeBufLen : Integer;
  var ReadLen : Integer) : Boolean;
var
  EndOfBlob : Boolean;
  GotLength : Integer;
begin
  ReadLen := 0;
  GotLength := 0; { !?! }
  repeat
    with Blob do
      EndOfBlob := not GetSegment(Handle, Buf + ReadLen, FreeBufLen, GotLength);

    Inc(ReadLen, GotLength);
    Dec(FreeBufLen, GotLength);
  until EndOfBlob or (FreeBufLen = 0);

  Buf[ReadLen] := #0;
  Result := EndOfBlob;
end;

// ==============================================
//  declare external function ...
//    blob, cstring(1)
//  returns
//    integer by value
//  ...
//  ...
// ==============================================
function BlobSearch(var Blob : TBlob; KeyWord : PChar) : Integer; cdecl; export;
var
  KeyWordLen, ReadLength, Offset : Integer;
  EndOfBlob, Found : Boolean;
  Buf : PChar;
begin
  Result := 0;
  with Blob do
    if (not Assigned(Handle)) or (TotalLength = 0) then Exit;

  Result := -2;
  KeyWordLen := StrLen(KeyWord) - 1;
  if KeyWordLen >= MaxBufSize then Exit;

  try
    Found := False;
    GetMem(Buf, MaxBufSize + 1);

    Result := -1;
    if not Assigned(Buf) then Exit;

    Offset := 0;
    repeat
      EndOfBlob := FillBuffer(Blob, Buf + Offset, MaxBufSize - Offset, ReadLength);

      if ReadLength + Offset >= KeyWordLen then begin
        Found := SearchSample(Buf, KeyWord);
        StrMove(Buf, Buf + ReadLength + Offset - KeyWordLen, KeyWordLen);
        Offset := KeyWordLen;
      end
      else
        Offset := Offset + ReadLength; // Only at the end of Blob
    until EndOfBlob or Found;

  finally
    FreeMem(Buf, MaxBufSize + 1);
  end;

  Result := Integer(Found);
end;

// Don't forget to export UDFs !!!
exports
  Add_A, Add_B, HexValue, Factorial,
  ConcatString_A, ConcatString_B, CharLength, VarCharLength,
  DateToString, NowToDate, CheckPoint,
  BlobInfo, BlobSearch;


   Important !!! After reading, please comment this line.
// After your DLL with UDFs has been successfully compiled,
// You must place it
// >>> on InterBase Server <<<
// ether InterBase\bin or any other directory
// included in the search path.


{$Ifdef Debug}
  initialization
    AssignFile(X, 'f:\ib\ss\bin\UDFDemo.log'); // This is path on IB Server !!!
    Rewrite(X);                               // F: is native (not mapped) server drive  
  finalization                                // Change it as you need
    Close(X);
{$Endif}
end.


