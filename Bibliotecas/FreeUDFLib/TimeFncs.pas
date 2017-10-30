unit TimeFncs;

interface

uses
  SysUtils, Classes, ib_externals, ibase;

function AddMonth(ib_date: PISC_QUAD;
  var months_to_add: Integer): PISC_QUAD; cdecl; export;
function AddYear(ib_date: PISC_QUAD;
  var years_to_add: Integer): PISC_QUAD; cdecl; export;
function AgeInDays(ib_date,
  ib_date_reference: PISC_QUAD): integer; cdecl; export;
function AgeInDaysThreshold(ib_date, ib_date_reference: PISC_QUAD;
  var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
function AgeInMonths(ib_date,
  ib_date_reference: PISC_QUAD): integer; cdecl; export;
function AgeInMonthsThreshold(ib_date, ib_date_reference: PISC_QUAD;
  var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
function AgeInWeeks(ib_date,
  ib_date_reference: PISC_QUAD): integer; cdecl; export;
function AgeInWeeksThreshold(ib_date, ib_date_reference: PISC_QUAD;
  var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
function CDOWLong(ib_date: PISC_QUAD): PChar; cdecl; export;
function CDOWShort(ib_date: PISC_QUAD): PChar; cdecl; export;
function CMonthLong(ib_date: PISC_QUAD): PChar; cdecl; export;
function CMonthShort(ib_date: PISC_QUAD): PChar; cdecl; export;
function DayOfMonth(ib_date: PISC_QUAD): integer; cdecl; export;
function DayOfWeek(ib_date: PISC_QUAD): integer; cdecl; export;
function DayOfYear(ib_date: PISC_QUAD): integer; cdecl; export;
procedure InternalWeekOfYear(ib_date: PISC_QUAD; var Week, Year: Integer);
function IsLeapYear(year: Integer): integer; cdecl; export;
function MaxDate(ib_d1, ib_d2: PISC_QUAD): PISC_QUAD; cdecl; export;
function MinDate(ib_d1, ib_d2: PISC_QUAD): PISC_QUAD; cdecl; export;
function Month(ib_date: PISC_QUAD): integer; cdecl; export;
function Quarter(ib_date: PISC_QUAD): integer; cdecl; export;
function StripDate(ib_date: PISC_QUAD): PISC_QUAD; cdecl; export;
function StripTime(ib_date: PISC_QUAD): PISC_QUAD; cdecl; export;
function WeekOfYear(ib_date: PISC_QUAD): integer; cdecl; export;
function WOY(ib_date: PISC_QUAD): PChar; cdecl; export;
function Year(ib_date: PISC_QUAD):  integer; cdecl; export;
function YearOfYear(ib_date: PISC_QUAD): integer; cdecl; export;


implementation

uses
  udf_glob;

function AddMonth(ib_date: PISC_QUAD; var months_to_add: Integer): PISC_QUAD;
var
  tm_date, res_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('AddMonth() - Enter');
  {$endif}
  InitializeTCTimeStructure(res_date);
  isc_decode_date(ib_date, @tm_date);
  with res_date do begin
    // Respect the "time" setting in the passed date
    tm_sec := tm_date.tm_sec;
    tm_min := tm_date.tm_min;
    tm_hour := tm_date.tm_hour;
    tm_isdst := tm_date.tm_isdst;
    // Now add the month
    tm_mday := tm_date.tm_mday;
    tm_mon  := (tm_date.tm_mon + ((months_to_add mod 12) + 12)) mod 12;
    tm_year := tm_date.tm_year + (months_to_add div 12);
    if (months_to_add > 0) and (tm_mon < tm_date.tm_mon) then
      Inc(tm_year)
    else if (months_to_add < 0) and (tm_mon > tm_date.tm_mon) then
      Dec(tm_year);
    // 30 days has 9, 4, 6, 11 all have 31 except 2
    if (tm_mon <> cFeb) then begin
      if (tm_mday > 30) and (tm_mon in [cSep, cApr, cJun, cNov]) then
        tm_mday := 30;
    end else if (tm_mday > 28) then
      tm_mday := IsLeapYear(cYearOffset + tm_year) + 28;
  end;
  result := MakeResultQuad(nil, nil);
  isc_encode_date(@res_date, result);
  {$ifdef FULDebug}
  WriteDebug('AddMonth() - Exit');
  {$endif}
end;

function AddYear(ib_date: PISC_QUAD; var years_to_add: Integer): PISC_QUAD;
var
  tm_date, res_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('AddYear() - Enter');
  {$endif}
  InitializeTCTimeStructure(res_date);
  isc_decode_date(ib_date, @tm_date);
  with res_date do begin
    // Respect the "time" setting in the passed date
    tm_sec := tm_date.tm_sec;
    tm_min := tm_date.tm_min;
    tm_hour := tm_date.tm_hour;
    tm_isdst := tm_date.tm_isdst;
    // Now add the year
    tm_mday := tm_date.tm_mday;
    tm_mon := tm_date.tm_mon;
    tm_year := tm_date.tm_year + years_to_add;
    if (tm_mon = cFeb) and (tm_mday > 28) then
      tm_mday := 28 + IsLeapYear(cYearOffset + tm_year);
  end;
  result := MakeResultQuad(nil, nil);
  isc_encode_date(@res_date, result);
  {$ifdef FULDebug}
  WriteDebug('AddYear() - Exit');
  {$endif}
end;

function AgeInDays(ib_date, ib_date_reference: PISC_QUAD): integer; cdecl; export;
var
  tm_date, tm_date_reference: tm;
  d_date, d_date_reference: TDateTime;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInDays() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  isc_decode_date(ib_date_reference, @tm_date_reference);
  d_date := EncodeDate(tm_date.tm_year + cYearOffset,
                       tm_date.tm_mon + 1,
                       tm_date.tm_mday);
  d_date_reference := EncodeDate(tm_date_reference.tm_year + cYearOffset,
                                 tm_date_reference.tm_mon + 1,
                                 tm_date_reference.tm_mday);
  result := Trunc(d_date_reference - d_date);
  {$ifdef FULDebug}
  WriteDebug('AgeInDays() - Exit');
  {$endif}
end;

function AgeInDaysThreshold(ib_date, ib_date_reference: PISC_QUAD;
                            var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInDaysThreshold() - Enter');
  {$endif}
  result := AgeInDays(ib_date, ib_date_reference);
  if ((UseMin = 1) and (result < Min)) then
    result := Min
  else if ((UseMax = 1) and (result > Max)) then
    result := Max;
  {$ifdef FULDebug}
  WriteDebug('AgeInDaysThreshold() - Exit');
  {$endif}
end;

function AgeInMonths(ib_date, ib_date_reference: PISC_QUAD): integer;
var
  tm_date, tm_date_reference: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInMonths() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  isc_decode_date(ib_date_reference, @tm_date_reference);
  result := ((tm_date_reference.tm_year - tm_date.tm_year) * 12) +
              tm_date_reference.tm_mon - tm_date.tm_mon;
  {$ifdef FULDebug}
  WriteDebug('AgeInMonths() - Exit');
  {$endif}
end;

function AgeInMonthsThreshold(ib_date, ib_date_reference: PISC_QUAD;
                              var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInMonthsThreshold() - Enter');
  {$endif}
  result := AgeInMonths(ib_date, ib_date_reference);
  if ((UseMin = 1) and (result < Min)) then
    result := Min
  else if ((UseMax = 1) and (result > Max)) then
    result := Max;
  {$ifdef FULDebug}
  WriteDebug('AgeInMonthsThreshold() - Exit');
  {$endif}
end;

{ As a rule, weeks always begin on Sunday, so, if the date is
  6/21/97, (a Saturday), and your date reference is 6/22/97,
  a Sunday, AgeInWeeks will return a 1.
  If the two dates fall in the same week, then it returns 0. }
function AgeInWeeks(ib_date, ib_date_reference: PISC_QUAD): integer;
var
  tm_date, tm_date_reference: tm;
  d_date, d_date_reference: TDateTime;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInWeeks() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  isc_decode_date(ib_date_reference, @tm_date_reference);
  d_date := EncodeDate(tm_date.tm_year + cYearOffset,
                       tm_date.tm_mon + 1,
                       tm_date.tm_mday);
  d_date_reference := EncodeDate(tm_date_reference.tm_year + cYearOffset,
                                 tm_date_reference.tm_mon + 1,
                                 tm_date_reference.tm_mday);
  result := Trunc((d_date_reference - SysUtils.DayOfWeek(d_date_reference)) -
                  (d_date - SysUtils.DayOfWeek(d_date))) div 7;
  {$ifdef FULDebug}
  WriteDebug('AgeInWeeks() - Exit');
  {$endif}
end;

function AgeInWeeksThreshold(ib_date, ib_date_reference: PISC_QUAD;
                             var Min, UseMin, Max, UseMax: Integer): integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('AgeInWeeksThreshold() - Enter');
  {$endif}
  result := AgeInWeeks(ib_date, ib_date_reference);
  if ((UseMin = 1) and (result < Min)) then
    result := Min
  else if ((UseMax = 1) and (result > Max)) then
    result := Max;
  {$ifdef FULDebug}
  WriteDebug('AgeInWeeksThreshold() - Exit');
  {$endif}
end;

{ LongDayNames, ShortDayNames, LongMonthNames, ShortMonthNames are all
  defined in SysUtils. }
function CDOWLong(ib_date: PISC_QUAD): PChar;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('CDOWLong() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := MakeResultString(
    PChar(LongDayNames[tm_date.tm_wday + 1]), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('CDOWLong() - Exit');
  {$endif}
end;

function CDOWShort(ib_date: PISC_QUAD): PChar;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('CDOWShort() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := MakeResultString(
    PChar(ShortDayNames[tm_date.tm_wday + 1]), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('CDOWShort() - Exit');
  {$endif}
end;

function CMonthLong(ib_date: PISC_QUAD): PChar;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('CMonthLong() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := MakeResultString(
    PChar(LongMonthNames[tm_date.tm_mon + 1]), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('CMonthLong() - Exit');
  {$endif}
end;

function CMonthShort(ib_date: PISC_QUAD): PChar;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('CMonthShort() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := MakeResultString(PChar(ShortMonthNames[tm_date.tm_mon + 1]), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('CMonthShort() - Exit');
  {$endif}
end;

function DayOfMonth(ib_date: PISC_QUAD): integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('DayOfMonth() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := tm_date.tm_mday;
  {$ifdef FULDebug}
  WriteDebug('DayOfMonth() - Exit');
  {$endif}
end;

function DayOfWeek(ib_date: PISC_QUAD): integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('DayOfWeek() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := tm_date.tm_wday + 1;
  {$ifdef FULDebug}
  WriteDebug('DayOfWeek() - Exit');
  {$endif}
end;

function DayOfYear(ib_date: PISC_QUAD): integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('DayOfYear() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := tm_date.tm_yday + 1;
  {$ifdef FULDebug}
  WriteDebug('DayOfYear() - Exit');
  {$endif}
end;

{ Simple observations:
    7 * 52 = 364 = a common year + 1 (or 2 if it is a leap year)
    There are 365-366 days in the year.
    A week is Sunday - Saturday.
  So....
  We define three inter-related functions:
    WeekOfYear - returning the week number of the year
    WOY        - returning a PChar which is the concatenation
                 of WeekOfYear and YearOfYear
    YearOfYear - returning the correct year for the Week (read on...)
  if the year begins on a Sun - Wed, then Jan 1 is considered to begin
    Week #1.
  if the year begins on Thu - Sat, then Jan 1 is considered to still
    be part of the last week of the previous year.
  if the year begins on a Wed OR
     the year begins on a Tue or Wed and its a leap year THEN
    the year has 53 weeks in it...
   }
procedure InternalWeekOfYear(ib_date: PISC_QUAD; var Week, Year: Integer);
var
  tm_date: tm;
  dow_ybeg: Integer;
  ThisLeapYear, LastLeapYear: Boolean;
begin
  {$ifdef FULDebug}
  WriteDebug('InternalWeekOfYear() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  // When did the year begin?
  Year := tm_date.tm_year + cYearOffset;
  dow_ybeg := SysUtils.DayOfWeek(EncodeDate(Word(tm_date.tm_year + cYearOffset), 1, 1));
  ThisLeapYear := IsLeapYear(tm_date.tm_year + cYearOffset) = 1;
  LastLeapYear := IsLeapYear(tm_date.tm_year + cYearOffset - 1) = 1;
  // Get the Sunday beginning this week.
  Week := (tm_date.tm_yday - tm_date.tm_wday + 1);
  (*
   * If the Sunday beginning this week was last year, then
   *   if this year begins on a Wednesday or previous, then
   *   this is most certainly the first week of the year.
   *   if this year begins on a thursday or
   *     last year was a leap year and this year begins on a friday, then
   *   this week is 53 of last year.
   *   Otherwise this week is 52 of last year.
   *)
  if Week <= 0 then begin
    if (dow_ybeg <= dWed) then
      Week := 1
    else if (dow_ybeg = dThu) or (LastLeapYear and (dow_ybeg = dFri)) then begin
      Week := 53;
      Dec(Year);
    end else begin
      Week := 52;
      Dec(Year);
    end;
  (* If the Sunday beginning this week falls in this year!!! Yeah
   *   if the year begins on a Sun, Mon, Tue or Wed then
   *     This week # is (Week + 7) div 7
   *   otherwise this week is
   *     Week div 7 + 1.
   *   if the week is > 52 then
   *     if this year began on a wed or this year is leap year and it
   *       began on a tuesday, then set the week to 53.
   *     otherwise set the week to 1 of *next* year.
   *)
  end else begin
    if (dow_ybeg <= dWed) then
      Week := (Week + 6 + dow_ybeg) div 7
    else
      Week := (Week div 7) + 1;
    if Week > 52 then begin
      if (dow_ybeg = dWed) or (ThisLeapYear and (dow_ybeg = dTue)) then
        Week := 53
      else begin
        Week := 1;
        Inc(Year);
      end;
    end;
  end;
  {$ifdef FULDebug}
  WriteDebug('InternalWeekOfYear() - Exit');
  {$endif}
end;

function IsLeapYear(year: Integer): Integer;
var
  ybeg, yend: TDateTime;
begin
  {$ifdef FULDebug}
  WriteDebug('IsLeapYear() - Enter');
  {$endif}
  ybeg := EncodeDate(Word(year), 1, 1);
  yend := EncodeDate(Word(year), 12, 31);
  if yend - ybeg + 1 = 366 then
    result := 1
  else
    result := 0;
  {$ifdef FULDebug}
  WriteDebug('IsLeapYear() - Exit');
  {$endif}
end;

function MaxDate(ib_d1, ib_d2: PISC_QUAD): PISC_QUAD;
begin
  result := MakeResultQuad(nil, nil);
  if (ib_d1^.gds_quad_high > ib_d2^.gds_quad_high) then
    result^ := ib_d1^
  else if (ib_d1^.gds_quad_high < ib_d2^.gds_quad_high) then
    result^ := ib_d2^
  else if (ib_d1^.gds_quad_low > ib_d2.gds_quad_low) then
    result^ := ib_d1^
  else
    result^ := ib_d2^;
end;

function MinDate(ib_d1, ib_d2: PISC_QUAD): PISC_QUAD;
begin
  result := MakeResultQuad(nil, nil);
  if (ib_d1^.gds_quad_high < ib_d2^.gds_quad_high) then
    result^ := ib_d1^
  else if (ib_d1^.gds_quad_high > ib_d2^.gds_quad_high) then
    result^ := ib_d2^
  else if (ib_d1^.gds_quad_low < ib_d2.gds_quad_low) then
    result^ := ib_d1^
  else
    result^ := ib_d2^;
end;

function Month(ib_date: PISC_QUAD): integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('Month() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := tm_date.tm_mon + 1;
  {$ifdef FULDebug}
  WriteDebug('Month() - Exit');
  {$endif}
end;

function Quarter(ib_date: PISC_QUAD): integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('Quarter() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := (tm_date.tm_mon div 3) + 1;
  {$ifdef FULDebug}
  WriteDebug('Quarter() - Exit');
  {$endif}
end;

function StripDate(ib_date: PISC_QUAD): PISC_QUAD;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('StripDate() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  with tm_date do begin
    tm_mday   := 0;
    tm_mon    := 0;
    tm_year   := 0;
    tm_wday   := 0;
    tm_yday   := 0;
  end;
  result := MakeResultQuad(nil, nil);
  isc_encode_date(@tm_date, result);
  {$ifdef FULDebug}
  WriteDebug('StripDate() - Exit');
  {$endif}
end;

function StripTime(ib_date: PISC_QUAD): PISC_QUAD;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('StripTime() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  with tm_date do begin
    tm_sec    := 0;
    tm_min    := 0;
    tm_hour   := 0;
    tm_isdst  := 0;
  end;
  result := MakeResultQuad(nil, nil);
  isc_encode_date(@tm_date, result);
  {$ifdef FULDebug}
  WriteDebug('StripTime() - Exit');
  {$endif}
end;

function WeekOfYear(ib_date: PISC_QUAD): Integer;
var
  yr: Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('WeekOfYear() - Enter');
  {$endif}
  InternalWeekOfYear(ib_date, result, yr);
  {$ifdef FULDebug}
  WriteDebug('WeekOfYear() - Exit');
  {$endif}
end;

function WOY(ib_date: PISC_QUAD): PChar;
var
  wk, yr: Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('WOY() - Enter');
  {$endif}
  InternalWeekOfYear(ib_date, wk, yr);
  result := MakeResultString(PChar(Format('%d%.2d', [yr, wk])), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('WOY() - Exit');
  {$endif}
end;

function Year(ib_date: PISC_QUAD): Integer;
var
  tm_date: tm;
begin
  {$ifdef FULDebug}
  WriteDebug('Year() - Enter');
  {$endif}
  isc_decode_date(ib_date, @tm_date);
  result := tm_date.tm_year + cYearOffset;
  {$ifdef FULDebug}
  WriteDebug('Year() - Exit');
  {$endif}
end;

function YearOfYear(ib_date: PISC_QUAD): integer;
var
  wk: Integer;
begin
  {$ifdef FULDebug}
  WriteDebug('YearOfYear() - Enter');
  {$endif}
  InternalWeekOfYear(ib_date, wk, result);
  {$ifdef FULDebug}
  WriteDebug('YearOfYear() - Exit');
  {$endif}
end;

end.
