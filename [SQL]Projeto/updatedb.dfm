object formUpdateDB: TformUpdateDB
  Left = 293
  Top = 267
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Atualizações Críticas'
  ClientHeight = 159
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbMsg: TLabel
    Left = 8
    Top = 104
    Width = 417
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Inicializando...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pb: TProgressBar
    Left = 8
    Top = 120
    Width = 417
    Height = 33
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 417
    Height = 89
    Caption = ' Recomendações '
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 394
      Height = 13
      Caption = 
        '1. Certifique-se que todos os usuários da rede estão fora do sis' +
        'tema'
    end
    object Label3: TLabel
      Left = 12
      Top = 48
      Width = 370
      Height = 13
      Caption = '3. Mantenha o computador ligado até o término das atualizações'
    end
    object Label4: TLabel
      Left = 12
      Top = 64
      Width = 366
      Height = 13
      Caption = '4. Recomendamos uso de NoBreak e bons sistemas de energia '
    end
    object Label5: TLabel
      Left = 12
      Top = 32
      Width = 313
      Height = 13
      Caption = '2. Feche todos os outros programas neste computador'
    end
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 128
    Top = 72
  end
  object IBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAX(NUMERO) AS ULTIMO FROM SCRIPTVER')
    Left = 200
    Top = 72
    object IBQueryULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object tmrProcesso: TTimer
    Enabled = False
    Interval = 512
    OnTimer = tmrProcessoTimer
    Left = 264
    Top = 72
  end
  object tmrFinal: TTimer
    Enabled = False
    Interval = 1024
    OnTimer = tmrFinalTimer
    Left = 264
    Top = 24
  end
  object ZipMaster: TZipMaster
    AddCompLevel = 9
    AddOptions = [AddMove, AddUpdate]
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR]
    ExtrOptions = []
    HowToDelete = htdFinal
    Trace = False
    Unattended = False
    Verbose = False
    VersionInfo = '1.78'
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    MaxVolumeSize = 0
    SpanOptions = []
    SFXOptions = []
    SFXOverWriteMode = OvrAlways
    SFXPath = 'DZSFXUS.BIN'
    Left = 328
    Top = 72
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'localhost:d:\cd\ib_server\empresa1.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=morais77')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    BeforeConnect = IBDatabaseBeforeConnect
    Left = 56
    Top = 72
  end
end
