object formBackup: TformBackup
  Left = 281
  Top = 270
  BorderStyle = bsDialog
  Caption = 'Backup'
  ClientHeight = 204
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 163
    Width = 481
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 376
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = cxButton2Click
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 272
      Top = 8
      Width = 91
      Height = 25
      TabOrder = 1
      OnClick = cxButton1Click
      Kind = bkOK
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 163
    Align = alClient
    TabOrder = 1
    object lbMsg: TLabel
      Left = 8
      Top = 112
      Width = 43
      Height = 13
      Caption = 'Destino'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 465
      Height = 91
      Caption = ' Instruções '
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 16
        Width = 420
        Height = 13
        Caption = 
          '1. No espaço abaixo digite o nome do arquivo ou escolha usando o' +
          ' botão'
      end
      object Label3: TLabel
        Left = 11
        Top = 32
        Width = 374
        Height = 13
        Caption = '2. Não é necessário interrompear a utilização do sistema na rede'
      end
      object Label4: TLabel
        Left = 11
        Top = 48
        Width = 351
        Height = 13
        Caption = '3. O backup pode demorar vários minutos para ser concluído'
      end
      object Label5: TLabel
        Left = 11
        Top = 64
        Width = 438
        Height = 13
        Caption = 
          '4. Em caso de erro ou para maiores informações, consulte o supor' +
          'te técnico'
      end
    end
    object cxbFileBackup: TComboEdit
      Left = 8
      Top = 128
      Width = 465
      Height = 21
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = cxbFileBackupClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.zip'
    Filter = 'Arquivo compactado (*.zip)|*.zip'
    Title = 'Destino do arquivo de Backup'
    Left = 200
    Top = 56
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
    ConfirmErase = False
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    MaxVolumeSize = 0
    SpanOptions = []
    SFXOptions = []
    SFXOverWriteMode = OvrAlways
    SFXPath = 'DZSFXUS.BIN'
    Left = 280
    Top = 56
  end
end
