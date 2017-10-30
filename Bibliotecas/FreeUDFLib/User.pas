unit User;

interface

uses
  SysUtils,
  Classes,
  Windows;

 // Obsolete! *DON'T USE THIS FUNCTION. IT WILL SOON NOT EXIST!*
{ This is a function for adding users, deleting users and
  changing a user's password.
  It worked with IB 4.1, but I don't use it anymore (I use
  IBPassword in Encrypt.pas in conjunction with the included
  chgpasswd script to maintain passwords from my application).
  Since I don't use it anymore, it might not work now, and I
  probably won't fix it either.
  If anyone out there prefers this to IBPassword, and takes it
  upon themselves to fix this, let me know, and I'll add your fixes... }
function UserMaintenance(username, password, sysuname, syspword,
                                   action: PChar): Integer; cdecl;

const
  UM_ERROR                        = 100001;
  UM_CANNOT_DETERMINE_ACTION      = 100002;
  UM_CANNOT_SET_ENV_ISC_USERNAME  = 100003;
  UM_CANNOT_SET_ENV_ISC_PASSWORD  = 100004;
  UM_SYSUSER_NOT_VALID            = 100005;
  UM_SYSPASSWORD_NOT_VALID        = 100006;
  UM_CANNOT_EXECUTE_PROCESS       = 100007;

implementation

uses udf_glob;

function UserMaintenance(username, password, sysuname, syspword,
                                   action: PChar): Integer;
var
  Startup: TStartupInfo;
  Process: TProcessInformation;
  Status: DWORD;
  IB_BIN,                      // InterBase Server BIN directory.
  szApp,                       // IB_BIN + '\gsec.exe'
  szCmdLine,                   // szApp + whatever arguments....
  sysu, sysp,                  // System username and password (sysuname, syspword)
  uname, pword: String;        // username and password
  szIB_BIN: array[0..255] of char;
  env: Pointer;
begin
  {$ifdef FULDebug}
  WriteDebug('UserMaintenance() - Enter');
  {$endif}
  // Default the result to 100000 (i.e. failure).
  result := UM_ERROR;

  { Initialize the StartupInfo structure... It's not really worth
    explaining. It's just required for the CreateProcess function. (See
    on-line help on CreateProcess if you're interested. }
  Startup.lpReserved := PChar(0);
  Startup.lpDesktop := PChar(0);
  Startup.lpTitle := PChar(0);
  Startup.dwFlags := STARTF_USESHOWWINDOW;
  Startup.wShowWindow := SW_SHOWDEFAULT;
  Startup.cbReserved2 := 0;
  Startup.lpReserved2 := PByte(0);

  // Cleanup username, password, sysuname, syspword
  uname := TrimRight(String(username));
  pword := TrimRight(String(password));
  sysu := TrimRight(String(sysuname));
  sysp := TrimRight(String(syspword));

  // Get the path of GSEC.
  if GetEnvironmentVariable('IB_BIN', szIB_BIN, 255) <= 0 then
    IB_BIN := 'C:\Program Files\Borland\IntrBase\Bin'
  else
    IB_BIN := String(szIB_BIN);

  // Action in (1 = add, 2 = delete, 3 = modify)
  // (Construct the szApp, szCmdLine, set system password, system username, etc...)
  szApp := IB_BIN + '\gsec.exe';  // This is lpApplicationName (See CreateProcess)

  // szCmdLine is lpCommandLine (See CreateProcess)
  case action[0] of
    'A': szCmdLine := szApp + ' -add ' + uname + ' -pw ' + pword;
    'D': szCmdLine := szApp + ' -delete ' + uname;
    'M': szCmdLine := szApp + ' -modify ' + uname + ' -pw ' + pword;
    else begin
      result := UM_CANNOT_DETERMINE_ACTION;
      exit;
    end;
  end;

  if ((sysu = 'SYSDBA') and
      (not SetEnvironmentVariable(PChar('ISC_USER'), PChar(sysu)))) then begin
    result := UM_CANNOT_SET_ENV_ISC_USERNAME;
    exit;
  end else if (sysu <> 'SYSDBA') then begin
    result := UM_SYSUSER_NOT_VALID;
    exit;
  end;

  if ((sysp <> '') and
      (not SetEnvironmentVariable(PChar('ISC_PASSWORD'), PChar(sysp)))) then begin
    result := UM_CANNOT_SET_ENV_ISC_PASSWORD;
    exit;
  end else if (sysp = '') then begin
    result := UM_SYSPASSWORD_NOT_VALID;
    exit;
  end;

  { Running this program requires the following environment variables
    to be present as entered above: ISC_USER and ISC_PASSWORD. It is
    considered a security breach if the ISC_USER name and ISC_PASSWORD
    environment variables are set in the server, since just about anybody could
    get to them, thus users cannot change passwords by themselves. Rather, they
    must change their password in the presence of a DBA. }
  env := GetEnvironmentStrings();
  if (CreateProcess(
                    PChar(szApp),                  // lpApplicationName
                    PChar(szCmdLine),              // lpCommandLine
                    PSecurityAttributes(0),        // lpProcessAttributes
                    PSecurityAttributes(0),        // lpThreadAttributes
                    False,                         // bInheritHandles
                    HIGH_PRIORITY_CLASS, // dwCreationFlags
                    env,                           // lpEnvironment
                    PChar(0),                      // lpCurrentDirectory
                    Startup,                       // lpStartupInfo
                    Process                        // lpProcessInformation
                   )) then begin
    GetExitCodeProcess(Process.hProcess, Status);
    while Status = STILL_ACTIVE do begin
      Sleep(10);
      GetExitCodeProcess(Process.hProcess, Status);
    end;
    result := Status;
  end;
  {$ifdef FULDebug}
  WriteDebug('UserMaintenance() - Exit');
  {$endif}
end;


end.
