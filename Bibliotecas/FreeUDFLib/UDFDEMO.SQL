/* Alpha version */

/*********************************************************/
/*                                                       */
/*      InterBase User Defined Fuctions examples         */
/*       Copyright (c) 1996 Borland Demo Center          */
/*                                                       */
/*      Written by:                                      */
/*        Oleg Kukarthev                                 */
/*        E-mail:     dima@bor.compnet.ru                */
/*                                                       */
/*********************************************************/

/* Before run this script you must place UDFDemo.dll as said in UDFLib.pas */

create database "IB_SERVER:/PATH/UDFS.GDB" user "SYSDBA" password "masterkey";

/* After UDF is created and declared to a database, it can be used in SQL */
/* statements whereever a built-in function is permited.                  */

set autoddl off;

create table TestUDF(
  S SmallInt not null,
  I Integer,
  C Char(10),
  V VarChar(10),
  D Date,
  B Blob sub_type Text,
  primary key (S)
);

declare external function AddA
  smallint, integer
returns
  integer by value
entry_point "Add_A"
module_name "UDFDemo";

declare external function AddB
  smallint, integer
returns
  integer
entry_point "Add_B"
module_name "UDFDemo";

declare external function Fctrl
  smallint
returns
  double precision by value
entry_point "Factorial"
module_name "UDFDemo";

declare external function ConcatA
  cstring(255), varchar(255)
returns
  varchar(255)
entry_point "ConcatString_A"
module_name "UDFDemo";

declare external function ConcatB
  cstring(255), varchar(255)
returns
  cstring(255)
entry_point "ConcatString_B"
module_name "UDFDemo";


declare external function CharLen
  cstring(255)
returns
  integer by value
entry_point "CharLength"
module_name "UDFDemo";

declare external function IntToHex
  integer, varchar(10)
returns
  parameter 2
entry_point "HexValue"
module_name "UDFDemo";

declare external function VarCharLen
  varchar(255)
returns
  integer by value
entry_point "VarCharLength"
module_name "UDFDemo";

declare external function DateToStr
  date
returns
  cstring(255)
entry_point "DateToString"
module_name "UDFDemo";

declare external function ServerDate
returns
  date
entry_point "NowToDate"
module_name "UDFDemo";

declare external function Check_Point
  cstring(255)
returns
  integer by value
entry_point "CheckPoint"
module_name "UDFDemo";

declare external function BlobInfo
  blob
returns
  cstring(255)
entry_point "BlobInfo"
module_name "UDFDemo";

declare external function BlobSearchSubStr
  blob, cstring(255)
returns
  integer by value
entry_point "BlobSearch"
module_name "UDFDemo";

/*
drop external function AddA;
drop external function AddB;
drop external function Fctrl;
drop external function ConcatA;
drop external function ConcatB;
drop external function IntToHex
drop external function VarCharLen
drop external function DateToStr;
drop external function ServerDate;
drop external function BlobInfo;
drop external function BlobSearchSubStr;
*/

commit work;

set term ^;

create procedure Len
  returns (CsLen SmallInt, VcLen SmallInt)
as
  declare variable Cs char(10);
  declare variable Vc varchar(10);
begin
  for select C, V
  from TestUDF
  into :Cs, :Vc
  do begin
    CsLen = CharLen(Cs);
    VcLen = VarCharLen(Vc);
    suspend;
  end
end^

create procedure Hex(I Integer)
  returns (V VarChar(10))
as
begin
  V = IntToHex(I);
  suspend;
end^

set term ; ^

commit work;

insert into TestUDF (S, I, C, V, D)
values (10, 100, '12345', 'ABCD ', '1.10.96 23:45:01.234');
/* It's VarChar field, so this ^ space "wouldn't be lost" */

insert into testUDF (S, I, C, V, D)
values (100, 10, 'ABCD ', '12345', '10.1.96 1:23:56.789');
/*                    ^                          */
/* It's Char field, so this space "will be lost" */

commit work;

/* Use follow SQL statments to test UDFs
select AddA(S, 5), AddB(5, I), Fctrl(99)
from TestUDF
where AddA(S, I) = 110;

select CharLen(ConcatA(C, V)), ConcatA(C, V)
from TestUDF;

select CharLen(ConcatA(C, '67890')), ConcatA(C, '67890')
from TestUDF;

select CharLen(ConcatA('!@#$%', V)), ConcatA('!@#$%', V)
from TestUDF;

select CharLen(ConcatA('!@#$%', '67890')), ConcatA('!@#$%', '67890')
from TestUDF;

select VarCharLen(ConcatB(C, V)), ConcatB(C, V)
from TestUDF;

select VarCharLen(ConcatB(C, '67890')), ConcatB(C, '67890')
from TestUDF;

select VarCharLen(ConcatB('!@#$%', V)), ConcatB('!@#$%', V)
from TestUDF;

select VarCharLen(ConcatB('!@#$%', '67890')), ConcatB('!@#$%', '67890')
from TestUDF;

select *
from Len;

select I, IntToHex(I)
from TestUDF;

select *
from Hex(305419896);

select D, DateToStr(D)
from TestUDF;

select ServerDate(), DateToStr(ServerDate())
from TestUDF;

Use any tools to fill blob field, then test blob functions

select BlobInfo(B)
from TestUDF;

select B, BlobSearchSubStr(B, 'Text to find')
from TestUDF;
*/


