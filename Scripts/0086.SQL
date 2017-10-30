/*
** TBUDF (vai substituir a FreeUDFlib, copiar TBUDF.DLL ou TBUDF.SO)
*/

declare external function udf_Ver
returns double precision by value
entry_point 'udf_Ver' module_name 'tbudf'!

declare external function udf_Len
cstring(254)
returns integer by value
entry_point 'udf_Len' module_name 'tbudf'!

declare external function udf_Pos
cstring(254), cstring(254)
returns integer by value
entry_point 'udf_Pos' module_name 'tbudf'!

declare external function udf_Copy
cstring(254), integer, integer
returns cstring(254)
entry_point 'udf_Copy' module_name 'tbudf'!

declare external function udf_Left
cstring(254), integer
returns cstring(254)
entry_point 'udf_Left' module_name 'tbudf'!

declare external function udf_Right
cstring(254), integer
returns cstring(254)
entry_point 'udf_Right' module_name 'tbudf'!

declare external function udf_Replace
cstring(254), cstring(254), cstring(254)
returns cstring(254)
entry_point 'udf_Replace' module_name 'tbudf'!

declare external function udf_Stuff
cstring(254), integer, integer, cstring(254)
returns cstring(254)
entry_point 'udf_Stuff' module_name 'tbudf'!

declare external function udf_Strip
cstring(254), cstring(254)
returns cstring(254)
entry_point 'udf_Strip' module_name 'tbudf'!

declare external function udf_Upper
cstring(254)
returns cstring(254)
entry_point 'udf_Upper' module_name 'tbudf'!

declare external function udf_Lower
cstring(254)
returns cstring(254)
entry_point 'udf_Lower' module_name 'tbudf'!

declare external function udf_AnsiUpper
cstring(254)
returns cstring(254)
entry_point 'udf_AnsiUpper' module_name 'tbudf'!

declare external function udf_AnsiLower
cstring(254)
returns cstring(254)
entry_point 'udf_AnsiLower' module_name 'tbudf'!

declare external function udf_StrOfChr
cstring(254), cstring(1), integer
returns parameter 1
entry_point 'udf_StrOfChr' module_name 'tbudf'!

declare external function udf_Space
cstring(254), integer
returns parameter 1
entry_point 'udf_Space' module_name 'tbudf'!

declare external function udf_Repeat
cstring(254), cstring(254), integer
returns parameter 1
entry_point 'udf_Repeat' module_name 'tbudf'!

declare external function udf_Digits
cstring(254)
returns cstring(254)
entry_point 'udf_Digits' module_name 'tbudf'!

declare external function udf_LTrim
cstring(254)
returns cstring(254)
entry_point 'udf_LTrim' module_name 'tbudf'!

declare external function udf_RTrim
cstring(254)
returns cstring(254)
entry_point 'udf_RTrim' module_name 'tbudf'!

declare external function udf_Trim
cstring(254)
returns cstring(254)
entry_point 'udf_Trim' module_name 'tbudf'!

declare external function udf_PadL
cstring(254), cstring(254), integer
returns cstring(254)
entry_point 'udf_PadL' module_name 'tbudf'!

declare external function udf_PadR
cstring(254), cstring(254), integer
returns cstring(254)
entry_point 'udf_PadR' module_name 'tbudf'!

declare external function udf_StrZero
cstring(20), integer, integer
returns parameter 1
entry_point 'udf_StrZero' module_name 'tbudf'!

declare external function udf_Chr
cstring(1), smallint
returns parameter 1
entry_point 'udf_Chr' module_name 'tbudf'!

declare external function udf_Ord
cstring(254)
returns smallint by value
entry_point 'udf_Ord' module_name 'tbudf'!

declare external function udf_IsLower
cstring(254)
returns smallint by value
entry_point 'udf_IsLower' module_name 'tbudf'!

declare external function udf_IsUpper
cstring(254)
returns smallint by value
entry_point 'udf_IsUpper' module_name 'tbudf'!

declare external function udf_IsDigit
cstring(254)
returns smallint by value
entry_point 'udf_IsDigit' module_name 'tbudf'!

declare external function udf_IsAlpha
cstring(254)
returns smallint by value
entry_point 'udf_IsAlpha' module_name 'tbudf'!

declare external function udf_CollateBr
cstring(254)
returns cstring(254)
entry_point 'udf_CollateBr' module_name 'tbudf'!

declare external function udf_IntToHex
cstring(20), integer, integer
returns parameter 1
entry_point 'udf_IntToHex' module_name 'tbudf'!

declare external function udf_HexToInt
cstring(20)
returns integer by value
entry_point 'udf_HexToInt' module_name 'tbudf'!

declare external function udf_Year
timestamp
returns smallint by value
entry_point 'udf_Year' module_name 'tbudf'!

declare external function udf_Month
timestamp
returns smallint by value
entry_point 'udf_Month' module_name 'tbudf'!

declare external function udf_Day
timestamp
returns smallint by value
entry_point 'udf_Day' module_name 'tbudf'!

declare external function udf_Hour
timestamp
returns smallint by value
entry_point 'udf_Hour' module_name 'tbudf'!

declare external function udf_Minute
timestamp
returns smallint by value
entry_point 'udf_Minute' module_name 'tbudf'!

declare external function udf_Second
timestamp
returns smallint by value
entry_point 'udf_Second' module_name 'tbudf'!

declare external function udf_EncDate
timestamp, smallint, smallint, smallint
returns parameter 1
entry_point 'udf_EncDate' module_name 'tbudf'!

declare external function udf_EncTime
timestamp, smallint, smallint, smallint
returns parameter 1
entry_point 'udf_EncTime' module_name 'tbudf'!

declare external function udf_EncTS
timestamp, smallint, smallint, smallint, smallint, smallint, smallint
returns parameter 1
entry_point 'udf_EncTS' module_name 'tbudf'!

declare external function udf_YearSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_YearSpan' module_name 'tbudf'!

declare external function udf_MonthSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_MonthSpan' module_name 'tbudf'!

declare external function udf_WeekSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_WeekSpan' module_name 'tbudf'!

declare external function udf_DaySpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_DaySpan' module_name 'tbudf'!

declare external function udf_HourSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_HourSpan' module_name 'tbudf'!

declare external function udf_MinuteSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_MinuteSpan' module_name 'tbudf'!

declare external function udf_SecondSpan
timestamp, timestamp
returns double precision by value
entry_point 'udf_SecondSpan' module_name 'tbudf'!

declare external function udf_YearsBetween
timestamp, timestamp
returns integer by value
entry_point 'udf_YearsBetween' module_name 'tbudf'!

declare external function udf_MonthsBetween
timestamp, timestamp
returns integer by value
entry_point 'udf_MonthsBetween' module_name 'tbudf'!

declare external function udf_WeeksBetween
timestamp, timestamp
returns integer by value
entry_point 'udf_WeeksBetween' module_name 'tbudf'!

declare external function udf_DaysBetween
timestamp, timestamp
returns integer by value
entry_point 'udf_DaysBetween' module_name 'tbudf'!

declare external function udf_HoursBetween
timestamp, timestamp
returns numeric(18,0) by value
entry_point 'udf_HoursBetween' module_name 'tbudf'!

declare external function udf_MinutesBetween
timestamp, timestamp
returns numeric(18,0) by value
entry_point 'udf_MinutesBetween' module_name 'tbudf'!

declare external function udf_SecondsBetween
timestamp, timestamp
returns numeric(18,0) by value
entry_point 'udf_SecondsBetween' module_name 'tbudf'!

declare external function udf_Age
timestamp
returns integer by value
entry_point 'udf_Age' module_name 'tbudf'!

declare external function udf_Age2
timestamp, timestamp
returns integer by value
entry_point 'udf_Age2' module_name 'tbudf'!

declare external function udf_IncYear
timestamp, integer
returns timestamp
entry_point 'udf_IncYear' module_name 'tbudf'!

declare external function udf_IncMonth
timestamp, integer
returns timestamp
entry_point 'udf_IncMonth' module_name 'tbudf'!

declare external function udf_IncWeek
timestamp, integer
returns timestamp
entry_point 'udf_IncWeek' module_name 'tbudf'!

declare external function udf_IncDay
timestamp, integer
returns timestamp
entry_point 'udf_IncDay' module_name 'tbudf'!

declare external function udf_IncHour
timestamp, integer
returns timestamp
entry_point 'udf_IncHour' module_name 'tbudf'!

declare external function udf_IncMinute
timestamp, integer
returns timestamp
entry_point 'udf_IncMinute' module_name 'tbudf'!

declare external function udf_IncSecond
timestamp, integer
returns timestamp
entry_point 'udf_IncSecond' module_name 'tbudf'!

declare external function udf_IncDate
timestamp, integer, integer, integer
returns timestamp
entry_point 'udf_IncDate' module_name 'tbudf'!

declare external function udf_IncTime
timestamp, integer, integer, integer
returns timestamp
entry_point 'udf_IncTime' module_name 'tbudf'!

declare external function udf_IncTS
timestamp, integer, integer, integer, integer, integer, integer
returns timestamp
entry_point 'udf_IncTS' module_name 'tbudf'!

declare external function udf_MaxDate
timestamp, timestamp
returns timestamp
entry_point 'udf_MaxDate' module_name 'tbudf'!

declare external function udf_MaxTime
timestamp, timestamp
returns timestamp
entry_point 'udf_MaxTime' module_name 'tbudf'!

declare external function udf_MaxTS
timestamp, timestamp
returns timestamp
entry_point 'udf_MaxTS' module_name 'tbudf'!

declare external function udf_MinDate
timestamp, timestamp
returns timestamp
entry_point 'udf_MinDate' module_name 'tbudf'!

declare external function udf_MinTime
timestamp, timestamp
returns timestamp
entry_point 'udf_MinTime' module_name 'tbudf'!

declare external function udf_MinTS
timestamp, timestamp
returns timestamp
entry_point 'udf_MinTS' module_name 'tbudf'!

declare external function udf_MonthStart
timestamp, smallint, smallint
returns parameter 1
entry_point 'udf_MonthStart' module_name 'tbudf'!

declare external function udf_MonthEnd
timestamp, smallint, smallint
returns parameter 1
entry_point 'udf_MonthEnd' module_name 'tbudf'!

declare external function udf_LastDay
smallint, smallint
returns smallint by value
entry_point 'udf_LastDay' module_name 'tbudf'!

declare external function udf_DayFrac
timestamp
returns double precision by value
entry_point 'udf_DayFrac' module_name 'tbudf'!

declare external function udf_YearDay
timestamp
returns smallint by value
entry_point 'udf_YearDay' module_name 'tbudf'!

declare external function udf_WeekDay
timestamp
returns smallint by value
entry_point 'udf_WeekDay' module_name 'tbudf'!

declare external function udf_DayName
cstring(15), timestamp
returns parameter 1
entry_point 'udf_DayName' module_name 'tbudf'!

declare external function udf_SDayName
cstring(5), timestamp
returns parameter 1
entry_point 'udf_SDayName' module_name 'tbudf'!

declare external function udf_MonthName
cstring(15), timestamp
returns parameter 1
entry_point 'udf_MonthName' module_name 'tbudf'!

declare external function udf_SMonthName
cstring(5), timestamp
returns parameter 1
entry_point 'udf_SMonthName' module_name 'tbudf'!

declare external function udf_NVL
double precision
returns double precision by value
entry_point 'udf_NVL' module_name 'tbudf'!

declare external function udf_Frac
double precision
returns double precision by value
entry_point 'udf_Frac' module_name 'tbudf'!

declare external function udf_Int
double precision
returns double precision by value
entry_point 'udf_Int' module_name 'tbudf'!

declare external function udf_Trunc
double precision
returns integer by value
entry_point 'udf_Trunc' module_name 'tbudf'!

declare external function udf_TruncDec
double precision, smallint
returns double precision by value
entry_point 'udf_TruncDec' module_name 'tbudf'!

declare external function udf_Round
double precision
returns integer by value
entry_point 'udf_Round' module_name 'tbudf'!

declare external function udf_RoundDec
double precision, smallint
returns double precision by value
entry_point 'udf_RoundDec' module_name 'tbudf'!

declare external function udf_Ceil
double precision
returns integer by value
entry_point 'udf_Ceil' module_name 'tbudf'!

declare external function udf_Floor
double precision
returns integer by value
entry_point 'udf_Floor' module_name 'tbudf'!

declare external function udf_Max
double precision, double precision
returns double precision by value
entry_point 'udf_Max' module_name 'tbudf'!

declare external function udf_Min
double precision, double precision
returns double precision by value
entry_point 'udf_Min' module_name 'tbudf'!

declare external function udf_Abs
double precision
returns double precision by value
entry_point 'udf_Abs' module_name 'tbudf'!

declare external function udf_Sign
double precision
returns smallint by value
entry_point 'udf_Sign' module_name 'tbudf'!

declare external function udf_Odd
integer
returns smallint by value
entry_point 'udf_Odd' module_name 'tbudf'!

declare external function udf_Div
integer, integer
returns integer by value
entry_point 'udf_Div' module_name 'tbudf'!

declare external function udf_Mod
integer, integer
returns integer by value
entry_point 'udf_Mod' module_name 'tbudf'!

declare external function udf_DZero
double precision, double precision
returns double precision by value
entry_point 'udf_DZero' module_name 'tbudf'!

declare external function udf_Exp
double precision
returns double precision by value
entry_point 'udf_Exp' module_name 'tbudf'!

declare external function udf_Factorial
integer
returns numeric(18,0) by value
entry_point 'udf_Factorial' module_name 'tbudf'!

declare external function udf_Sqr
double precision
returns double precision by value
entry_point 'udf_Sqr' module_name 'tbudf'!

declare external function udf_Sqrt
double precision
returns double precision by value
entry_point 'udf_Sqrt' module_name 'tbudf'!

declare external function udf_Power
double precision, double precision
returns double precision by value
entry_point 'udf_Power' module_name 'tbudf'!

declare external function udf_LnXP1
double precision
returns double precision by value
entry_point 'udf_LnXP1' module_name 'tbudf'!

declare external function udf_Log10
double precision
returns double precision by value
entry_point 'udf_Log10' module_name 'tbudf'!

declare external function udf_Log2
double precision
returns double precision by value
entry_point 'udf_Log2' module_name 'tbudf'!

declare external function udf_LogN
double precision, double precision
returns double precision by value
entry_point 'udf_LogN' module_name 'tbudf'!

declare external function udf_Rand
returns double precision by value
entry_point 'udf_Rand' module_name 'tbudf'!

declare external function udf_RandInt
integer, integer
returns integer by value
entry_point 'udf_RandInt' module_name 'tbudf'!

/*------------------------------------------------------------------*/

declare external function udf_Pi
returns double precision by value
entry_point 'udf_Pi' module_name 'tbudf'!

declare external function udf_DegToRad
double precision
returns double precision by value
entry_point 'udf_DegToRad' module_name 'tbudf'!

declare external function udf_RadToDeg
double precision
returns double precision by value
entry_point 'udf_RadToDeg' module_name 'tbudf'!

declare external function udf_Cos
double precision
returns double precision by value
entry_point 'udf_Cos' module_name 'tbudf'!

declare external function udf_Sin
double precision
returns double precision by value
entry_point 'udf_Sin' module_name 'tbudf'!

declare external function udf_Tan
double precision
returns double precision by value
entry_point 'udf_Tan' module_name 'tbudf'!

declare external function udf_CoTan
double precision
returns double precision by value
entry_point 'udf_CoTan' module_name 'tbudf'!

declare external function udf_ACos
double precision
returns double precision by value
entry_point 'udf_ACos' module_name 'tbudf'!

declare external function udf_ASin
double precision
returns double precision by value
entry_point 'udf_ASin' module_name 'tbudf'!

declare external function udf_ATan
double precision
returns double precision by value
entry_point 'udf_ATan' module_name 'tbudf'!

declare external function udf_Hypot
double precision, double precision
returns double precision by value
entry_point 'udf_Hypot' module_name 'tbudf'!

/*------------------------------------------------------------------*/

declare external function udf_Not
integer
returns integer by value
entry_point 'udf_Not' module_name 'tbudf'!

declare external function udf_And
integer, integer
returns integer by value
entry_point 'udf_And' module_name 'tbudf'!

declare external function udf_Or
integer, integer
returns integer by value
entry_point 'udf_Or' module_name 'tbudf'!

declare external function udf_Xor
integer, integer
returns integer by value
entry_point 'udf_Xor' module_name 'tbudf'!

declare external function udf_ShL
integer, integer
returns integer by value
entry_point 'udf_ShL' module_name 'tbudf'!

declare external function udf_ShR
integer, integer
returns integer by value
entry_point 'udf_ShR' module_name 'tbudf'!

declare external function udf_GetBit
integer, smallint
returns integer by value
entry_point 'udf_GetBit' module_name 'tbudf'!

declare external function udf_SetBit
integer, smallint, smallint
returns integer by value
entry_point 'udf_SetBit' module_name 'tbudf'!

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (86, CURRENT_TIMESTAMP)!