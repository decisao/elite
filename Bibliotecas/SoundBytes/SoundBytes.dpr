library SoundBytes;

uses
  SysUtils;

function SoundBts(Name: PChar): SmallInt; cdecl;
  const
    SoundExTable: array[65..122] of byte =
     (0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2,0,0,0,0,0,0,
      0,1,2,3,0,1,2,0,0,2,2,4,5,5,0,1,2,6,2,3,0,1,0,2,0,2);
  var
    i, l, s, SO, x: byte;
    Multiple: word;
  begin
    if Name > '' then
     begin
      Result := Ord(UpCase(Name[0]));
      SO := 0;
      Multiple := 26;
      l := Pred(StrLen(Name));
      for i := 1 to l do
       begin
        s := Ord(Name[i]);
        if (s > 64) and (s < 123) then
         begin
          x := SoundExTable[s];
          if (x > 0) and (x <> SO) then
           begin
            Result := Result + (x * Multiple);
            if (Multiple = 26 * 6 * 6) then break;
            Multiple := Multiple * 6;
            SO := x;
           end;
         end;
       end;
     end else Result := 0;
  end;

//  function ean13(codi: pchar): pchar; cdecl;
//  var
//    soma, i: word;
//    digi: string;
//  begin
//    soma := 0;
//    for i := 0 to 11 do
//     if odd(i) then soma := soma + StrToInt(codi[i]) * 1 else
//       soma := soma + StrToInt(codi[i]) * 3;
//    digi := IntToStr(10 - (soma mod 10));
//    codi[12] := digi[1];
//    result := codi;
//  end;

  exports SoundBts;
//  exports ean13;

begin

end.
