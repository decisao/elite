unit backup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  ZipMstr, Buttons, Mask, ToolEdit;

type
  TformBackup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbMsg: TLabel;
    SaveDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ZipMaster: TZipMaster;
    cxbFileBackup: TComboEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure cxButton1Click(Sender: TObject);
    procedure cxbFileBackupClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario,
    senha: string;
  end;

var
  formBackup: TformBackup;

implementation

uses principal, data_principal;

{$R *.dfm}

function ExecAndWait(const FileName, Params: ShortString; const WinState: Word): boolean; export;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: ShortString;
begin
  { Coloca o nome do arquivo entre aspas, devido a possibilidade de existir espaços nos nomes longos do Windows 9x }
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
   begin
     cb := SizeOf(StartInfo);
     dwFlags := STARTF_USESHOWWINDOW;
     wShowWindow := WinState;
   end;
  Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
  { Aguarda o encerramento do programa executado }
  if Result then
   begin
     WaitForSingleObject(ProcInfo.hProcess, INFINITE);
     { Libera os Handles utilizados }
     CloseHandle(ProcInfo.hProcess);
     CloseHandle(ProcInfo.hThread);
   end;
end;

procedure TformBackup.cxButton1Click(Sender: TObject);
var
  stFBK,
  stZIP: string;
begin

  if cxbFileBackup.Text > '' then
   try

     stZIP := cxbFileBackup.Text;
     stFBK := copy(stZIP, 1, length(stZIP) - 3) + 'fbk';

     Screen.Cursor := crHourGlass;
     lbMsg.Caption := 'Executando o Backup...';
     lbMsg.Font.Style := [fsBold];
     Application.ProcessMessages;

     { abro/executo o arquivo }
     ExecAndWait(dmoPrincipal.GetAppDir + '\gbak.exe',
         ' -b -t "' +
         dmoPrincipal.Database.DatabaseName +
         '" "' + stFBK + '"' +
         ' -user ' + usuario + ' -pas ' + senha,
         sw_ShowMinimized);

     lbMsg.Caption := 'Compactando o arquivo...';
     Application.ProcessMessages;

     { compactar o arquivo fbk }
     ZipMaster.FSpecArgs.Add(stFBK);
     ZipMaster.ZipFileName := stZIP;
     ZipMaster.Add;

     Screen.Cursor := crDefault;

     Application.MessageBox(
       'Backup concluído com êxito!',
       'Concluído',
       mb_Ok + mb_IconInformation);

     close;

   except
     on exception do
      begin
        Screen.Cursor := crDefault;
        Application.MessageBox(
          'Problemas impediram a execução do Backup.',
          'Erro',
          mb_Ok + mb_IconWarning);
      end;
   end;

end;

procedure TformBackup.cxbFileBackupClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    cxbFileBackup.Text := SaveDialog.FileName;
end;

procedure TformBackup.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TformBackup.FormCreate(Sender: TObject);
begin
  usuario := 'SYSDBA';
  if ParamStr(1) > '' then
    senha := 'morais77'
  else
    senha := 'masterkey';

  ZipMaster.Load_Zip_Dll;
  ZipMaster.Load_Unz_Dll;
end;

procedure TformBackup.FormDestroy(Sender: TObject);
begin
  ZipMaster.Unload_Zip_Dll;
  ZipMaster.Unload_Unz_Dll;
end;

procedure TformBackup.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

end.
