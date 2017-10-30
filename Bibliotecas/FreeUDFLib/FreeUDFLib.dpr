{ Copyright:
   Gregory Deatz
   Hoagland, Longo, Moran, Dunst & Doukas
   40 Paterson Street, Box 480
   New Brunswick, NJ 08903
   (908) 545-4717
   ----------------------------
   This product is provided as-is, with no express or implied warranties of
   any kind. Use this product at your own risk.

   It is free for you to use, distribute, modify, etc.... in any way
   you see fit; however, I would appreciate if you credit me for my
   code...

   If you have suggestions, complaints or bug reports, please contact
   Gregory Deatz - gdeatz@hlmdd.com or at the phone no. above.

   Better yet, try getting hooked up with the IB mailing list:
      interbase@mers.com
   Also try
      http://www.demon.co.uk/dtuk/dtinterbaselinks.html }
library FreeUDFLib;

(*
 * Define FULDebug if you want to output debugging information to a file.
 *  - uncomment below "commented" define
 *)

{//$define FULDebug}

uses
  SysUtils,
  Classes,
  TimeFncs in 'TimeFncs.pas',
  MathFncs in 'MathFncs.pas',
  StrFncs in 'StrFncs.pas',
  User in 'User.pas',
  Encrypt in 'Encrypt.pas',
  Misc in 'Misc.pas',
  udf_glob in 'udf_glob.pas',
  BlobFncs in 'BlobFncs.pas';

exports
  // Blob functions
  BlobAsPChar,
  BlobMaxSegmentLength,
  BlobSegmentCount,
  BlobSize,
  BlobLeft,
  BlobLine,
  BlobMid,
  BlobRight,
  StrBlob,
  // Security functions
  IBPassword,
  UserMaintenance,                                      // Obsolete! (1)
  // Time/Date functions
  AddMonth,
  AddYear,
  AgeInDays,
  AgeInDaysThreshold,
  AgeInMonths,
  AgeInMonthsThreshold,
  AgeInWeeks,
  AgeInWeeksThreshold,
  CDOWLong,
  CDOWShort,
  CMonthLong,
  CMonthShort,
  DayOfMonth,
  DayOfWeek,
  DayOfYear,
  MaxDate,
  MinDate,
  Month,
  Quarter,
  StripDate,
  StripTime,
  WeekOfYear,
  WOY,
  Year,
  YearOfYear,
  // Math functions
  DollarVal,
  DoubleAbs,
  FixedPoint,
  IntegerAbs,
  IsDivisibleBy,
  Modulo,
  RoundFloat,
  Truncate,
  // String Functions
  TestaCGC,
  TestaCPF,
  Ean13,
  Character,
  CRLF,
  FindNthWord, //** Not recommended.
  FindWord, //** New
  FindWordIndex, //** New
  Left,
  LineWrap,
  lrTrim,
  lTrim,
  Mid,
  PadLeft,
  PadRight,
  ProperCase,
  Right,
  rTrim,
  StringLength, //** New
  StripString, //** New
  SubStr,
  // Data formatting routines
  GenerateFormattedName,
  ValidateNameFormat,
  // Regular expressions
  ValidateRegularExpression,                            // Not implemented!
  ValidateStringInRE,                                   // Not implemented!
  // Miscellaneous functions
  CloseDebuggerOutput,
  Debug,
  IBTempPath,
  SetDebuggerOutput,
  ValidateCycleExpression,
  EvaluateCycleExpression,
  EvaluateExpression,
  // Soundex function
  GenerateSndxIndex;   // ** NEW



begin
end.

{* ************************************************************************** *}
{* * Bug fixes, acknowledgements, etc....                                   * *}
{* ************************************************************************** *}

{* Special thanks to InterBase Corp for hosting this file!                    *}

{* Encryption routines submitted by Oleg Kukarthev, a rewrite of              *}
{*   Gérard Perreault's C code.                                               *}
{* Bug fix, Oct. 23, 1997 pOutStr is always 12 bytes long.                    *}
{*   Submitted by Stephen W. Boyd.                                            *}
{* MinDate submitted by Doug Chamberlin                                       *}
{* Bug fix, Dec. 30, 1997 to PadLeft                                          *}
{*   Submitted by rberryman@earthlink.net                                     *}
{* Bug fix, Jan. 1, 1997 to YearOfYear ('1/1/98' reports year=98, but week    *}
{*   is still 53 (of 97)                                                      *}
{*   Submitted by John Small (john@yagya.demon.co.uk)                         *}
{* Name formatting routines submitted by Graham Bremner                       *}
{*   (graham_bremner@hlmdd.com)                                               *}
{* Bug fix, Jan. 6, 1998 to PadRight                                          *}
{*   Submitted by rberryman@earthlink.net                                     *}
{* Bug fix, Mar. 10, 1998 to AddYear                                          *}
{*   Submitted by Serge Vannieuwenborgh (sva@netsol.be)                       *}
