unit BlobFncs;

interface

uses
  SysUtils, ibase, ib_externals, udf_glob, StdFuncs;

// Information functions
function BlobMaxSegmentLength(Blob: PBlob): Integer; cdecl; export;
function BlobSegmentCount(Blob: PBlob): Integer; cdecl; export;
function BlobSize(Blob: PBlob): Integer; cdecl; export;
// String-ish functions
{* Obviously, these functions should be used with care, and only when you are
   confident that your blob is not overly large.
   Since varchars can go all the way to 32767 (I think), I find
   Blobs to be somewhat useless as containers for large strings, but
   here are some functions to do it anyways... }
function BlobAsPChar(Blob: PBlob): PChar; cdecl; export;
function BlobLeft(Blob: PBlob; var Number: Integer): PChar; cdecl; export;
function BlobLine(Blob: PBlob; var Number: Integer): PChar; cdecl; export;
function BlobMid(Blob: PBlob; var Start, Number: Integer): PChar; cdecl; export;
function BlobRight(Blob: PBlob; var Number: Integer): PChar; cdecl; export;
function StrBlob(sz: PChar; Blob: PBlob): PBlob; cdecl; export;

implementation

const
  CRLF = #13 + #10;

function BlobMaxSegmentLength(Blob: PBlob): Integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobMaxSegmentLength() - Enter');
  {$endif}
  result := 0;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  result := Blob^.MaxSegmentLength;
  {$ifdef FULDebug}
  WriteDebug('BlobMaxSegmentLength() - Exit');
  {$endif}
end;

function BlobSegmentCount(Blob: PBlob): Integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobSegmentCount() - Enter');
  {$endif}
  result := 0;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  result := Blob^.SegmentCount;
  {$ifdef FULDebug}
  WriteDebug('BlobSegmentCount() - Exit');
  {$endif}
end;

function BlobSize(Blob: PBlob): Integer; cdecl; export;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobSize() - Enter');
  {$endif}
  result := 0;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  result := Blob^.TotalSize;
  {$ifdef FULDebug}
  WriteDebug('BlobSize() - Exit');
  {$endif}
end;

function BlobAsPChar(Blob: PBlob): PChar; cdecl; export;
var
  bytes_read, bytes_left, total_bytes_read: Long;
  st: String;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobAsPChar() - Enter');
  {$endif}
  result := nil;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  with Blob^ do begin
    SetString(st, nil, TotalSize);
    total_bytes_read := 0;                  // total bytes read is 0.
    bytes_left := TotalSize;                // I have TotalSize bytes to read.
    if (bytes_left = 0) then exit;          // if I've nothing to copy, exit.
    repeat
      // Using BlobHandle, store at most "bytes_left" bytes in
      //   the buffer starting where I last left off
      GetSegment(BlobHandle, @result[total_bytes_read + 1], bytes_left, bytes_read);
      // Increment total_bytes_read by the number of bytes actually read.
      Inc(total_bytes_read, bytes_read);
      // Decrement bytes_left by the number of bytes actually read.
      Dec(bytes_left, bytes_read);
    until bytes_left <= 0;
  end;
  result := MakeResultString(PChar(st), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('BlobAsPChar() - Exit');
  {$endif}
end;

function BlobLeft(Blob: PBlob; var Number: Integer): PChar;
var
  bytes_read, bytes_left, total_bytes_read: Long;
  st: String;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobLeft() - Enter');
  {$endif}
  result := nil;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  with Blob^ do begin
    SetString(st, nil, Number);
    total_bytes_read := 0;                  // total bytes read is 0.
    bytes_left := Min(TotalSize, Number);        // I have Min(TotalSize, n) bytes to read.
    st[bytes_left] := #0;               // Set the terminating null value.
    if (bytes_left = 0) then exit;          // if I've nothing to copy, exit.
    repeat
      // Using BlobHandle, store at most "bytes_left" bytes in
      //   the buffer starting where I last left off
      GetSegment(BlobHandle, @st[total_bytes_read + 1], bytes_left, bytes_read);
      // Increment total_bytes_read by the number of bytes actually read.
      Inc(total_bytes_read, bytes_read);
      // Decrement bytes_left by the number of bytes actually read.
      Dec(bytes_left, bytes_read);
    until bytes_left <= 0;
  end;
  result := MakeResultString(PChar(st), nil, 0);
  {$ifdef FULDebug}
  WriteDebug('BlobLeft() - Exit');
  {$endif}
end;

// Lines are zero based.
function BlobLine(Blob: PBlob; var Number: Integer): PChar;
var
  i, j: Integer;
begin
  { First read the whole blob into a character buffer, then
    scan through the entire blob, reusing the first part of the
    buffer to write the Number-th line of the Blob. }
  {$ifdef FULDebug}
  WriteDebug('BlobLine() - Enter');
  {$endif}
  result := BlobAsPChar(Blob);
  if result[0] = #0 then exit;
  j := -1;
  while (Number >= 0) and ((j = -1) or (result[j] <> #0)) do begin
    i := -1;
    repeat
      Inc(i); Inc(j);
      // Here only write to the return string if j > i.
      if (j > i) then
        result[i] := result[j];
    until (result[j] in [#0, #10, #13]);
    // if current character is cr then check to see if there
    // is a line feed following it.
    if (result[j] in [#10, #13]) then begin
      result[i] := #0; // "End" the current line.
      if (result[j+1] = #10) then Inc(j);
    end;
    Dec(Number);
  end;
  if Number <> -1 then result[0] := #0;
  {$ifdef FULDebug}
  WriteDebug('BlobLine() - Exit');
  {$endif}
end;

function BlobMid(Blob: PBlob; var Start, Number: Integer): PChar;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobMid() - Enter');
  {$endif}
  result := BlobAsPChar(Blob);
  result := MakeResultString(
    PChar(Copy(result, Start + 1, Number)), result, 0);
  {$ifdef FULDebug}
  WriteDebug('BlobMid() - Exit');
  {$endif}
end;

function BlobRight(Blob: PBlob; var Number: Integer): PChar;
begin
  {$ifdef FULDebug}
  WriteDebug('BlobRight() - Enter');
  {$endif}
  result := BlobAsPChar(Blob);
  result := MakeResultString(
    PChar(Copy(result, Length(result) - Number + 1, Number)), result, 0);
  {$ifdef FULDebug}
  WriteDebug('BlobRight() - Exit');
  {$endif}
end;

// According to IB docs, this is how you do it for blobs.
// First pass the "first" argument
// Second, pass the "return" argument (A Blob) as the last argument.
// then you would just declare the external function in
// IB as shown below
function StrBlob(sz: PChar; Blob: PBlob): PBlob;
begin
  {$ifdef FULDebug}
  WriteDebug('StrBlob() - Enter');
  {$endif}
  result := Blob;
  if (not Assigned(Blob)) or
     (not Assigned(Blob^.BlobHandle)) then exit;
  Blob^.PutSegment(Blob^.BlobHandle, sz, StrLen(sz));
  {$ifdef FULDebug}
  WriteDebug('StrBlob() - Exit');
  {$endif}
end;

end.
