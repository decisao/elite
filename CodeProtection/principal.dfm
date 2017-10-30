object formPrincipal: TformPrincipal
  Left = 179
  Top = 118
  Width = 544
  Height = 375
  Caption = 'CODEPROTECTION Toll for InterBase'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 302
    Width = 536
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'D:\ib_server\EMPRESA1.GDB'
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 136
    Top = 88
  end
  object IBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  RDB$PROCEDURE_NAME,'
      '  RDB$PROCEDURE_SOURCE'
      'FROM'
      '  RDB$PROCEDURES'
      'WHERE'
      '  RDB$SYSTEM_FLAG = 0'
      'ORDER BY'
      '  RDB$PROCEDURE_NAME')
    Left = 136
    Top = 136
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase
    DefaultAction = TACommitRetaining
    AutoStopAction = saCommit
    Left = 136
    Top = 184
  end
  object MainMenu: TMainMenu
    Left = 64
    Top = 88
    object CodeProtection1: TMenuItem
      Caption = '&CodeProtection'
      object About1: TMenuItem
        Caption = '&About...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ProtectaInterBasedatabase1: TMenuItem
        Caption = '&Protect an InterBase database...'
        OnClick = ProtectaInterBasedatabase1Click
      end
      object Restorefromstoredcode1: TMenuItem
        Caption = '&Restore from stored code...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Localdatabaserepair1: TMenuItem
        Caption = '&Local database repair...'
      end
      object Localdatabasebackup1: TMenuItem
        Caption = 'Local database backup...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
      end
    end
  end
  object DBISAMSession: TDBISAMSession
    EngineVersion = '1.21'
    Active = True
    KeepConnections = False
    SessionName = 'codeprotection'
    Left = 216
    Top = 88
  end
  object DBISAMDatabase: TDBISAMDatabase
    EngineVersion = '1.21'
    Connected = True
    DatabaseName = 'codeprotection'
    Directory = 'D:\empresa1\CodeProtection'
    SessionName = 'codeprotection'
    Left = 216
    Top = 136
  end
  object DBISAMTable: TDBISAMTable
    DatabaseName = 'codeprotection'
    SessionName = 'codeprotection'
    EngineVersion = '1.21'
    TableName = 'CODEPROT.DAT'
    LockRetryCount = 15
    LockWaitTime = 100
    ForceBufferFlush = False
    Left = 216
    Top = 184
    object DBISAMTableCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Required = True
    end
    object DBISAMTableTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object DBISAMTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 31
    end
    object DBISAMTableFONTE: TBlobField
      FieldName = 'FONTE'
      BlobType = ftBlob
    end
  end
end
