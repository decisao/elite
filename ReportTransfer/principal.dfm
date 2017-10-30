object Form1: TForm1
  Left = 139
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'ReportTransfer 1.1.1.232'
  ClientHeight = 202
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 513
    Height = 9
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 415
    Height = 23
    Caption = 'empresa1.com - transferência de relatórios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 162
    Height = 13
    Caption = 'Banco de Dados de ORIGEM'
    FocusControl = edorigem
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 168
    Height = 13
    Caption = 'Banco de Dados de DESTINO'
    FocusControl = eddestino
  end
  object lbWork: TLabel
    Left = 8
    Top = 144
    Width = 513
    Height = 13
    AutoSize = False
    Caption = 
      'Por favor, escolha os bancos de origem e destino, então clique e' +
      'm Iniciar'
  end
  object edorigem: TcxButtonEdit
    Left = 7
    Top = 63
    Width = 513
    Height = 21
    Cursor = crHandPoint
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 0
    OnDblClick = edorigemDblClick
    OnEnter = edorigemEnter
    OnExit = edorigemExit
  end
  object eddestino: TcxButtonEdit
    Left = 7
    Top = 111
    Width = 513
    Height = 21
    Cursor = crHandPoint
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 1
    OnDblClick = eddestinoDblClick
    OnEnter = edorigemEnter
    OnExit = edorigemExit
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Iniciar!'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 96
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'gdb'
    Filter = 'Firebird Databases (*.gdb)|*.gdb'
    Left = 16
    Top = 8
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\ib_server\2001.GDB'
    Params.Strings = (
      'user_name=SYSDBA')
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 96
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saNone
    Left = 96
    Top = 56
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = 'D:\ib_server\2001.GDB'
    Params.Strings = (
      'user_name=SYSDBA')
    DefaultTransaction = IBTransaction2
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 464
    Top = 8
  end
  object IBTransaction2: TIBTransaction
    Active = False
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saNone
    Left = 464
    Top = 56
  end
  object qryFolder1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RB_FOLDER ORDER BY FOLDER_ID')
    Left = 176
    Top = 8
    object qryFolder1FOLDER_ID: TIntegerField
      FieldName = 'FOLDER_ID'
      Origin = '"RB_FOLDER"."FOLDER_ID"'
    end
    object qryFolder1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"RB_FOLDER"."NAME"'
      Required = True
      Size = 60
    end
    object qryFolder1PARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
      Origin = '"RB_FOLDER"."PARENT_ID"'
      Required = True
    end
  end
  object qryItem1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RB_ITEM ORDER BY ITEM_ID')
    Left = 176
    Top = 56
    object qryItem1ITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
      Origin = '"RB_ITEM"."ITEM_ID"'
    end
    object qryItem1FOLDER_ID: TIntegerField
      FieldName = 'FOLDER_ID'
      Origin = '"RB_ITEM"."FOLDER_ID"'
      Required = True
    end
    object qryItem1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"RB_ITEM"."NAME"'
      Required = True
      Size = 60
    end
    object qryItem1ITEM_SIZE: TIntegerField
      FieldName = 'ITEM_SIZE'
      Origin = '"RB_ITEM"."ITEM_SIZE"'
    end
    object qryItem1ITEM_TYPE: TIntegerField
      FieldName = 'ITEM_TYPE'
      Origin = '"RB_ITEM"."ITEM_TYPE"'
      Required = True
    end
    object qryItem1MODIFIED: TFloatField
      FieldName = 'MODIFIED'
      Origin = '"RB_ITEM"."MODIFIED"'
      Required = True
    end
    object qryItem1DELETED: TFloatField
      FieldName = 'DELETED'
      Origin = '"RB_ITEM"."DELETED"'
    end
    object qryItem1TEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = '"RB_ITEM"."TEMPLATE"'
      BlobType = ftBlob
      Size = 8
    end
  end
  object qryFolder2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RB_FOLDER')
    UpdateObject = updFolder2
    Left = 400
    Top = 8
    object IntegerField1: TIntegerField
      FieldName = 'FOLDER_ID'
      Origin = '"RB_FOLDER"."FOLDER_ID"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NAME'
      Origin = '"RB_FOLDER"."NAME"'
      Required = True
      Size = 60
    end
    object IntegerField2: TIntegerField
      FieldName = 'PARENT_ID'
      Origin = '"RB_FOLDER"."PARENT_ID"'
      Required = True
    end
  end
  object qryItem2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RB_ITEM')
    UpdateObject = updItem2
    Left = 400
    Top = 56
    object IntegerField3: TIntegerField
      FieldName = 'ITEM_ID'
      Origin = '"RB_ITEM"."ITEM_ID"'
    end
    object IntegerField4: TIntegerField
      FieldName = 'FOLDER_ID'
      Origin = '"RB_ITEM"."FOLDER_ID"'
      Required = True
    end
    object IBStringField2: TIBStringField
      FieldName = 'NAME'
      Origin = '"RB_ITEM"."NAME"'
      Required = True
      Size = 60
    end
    object IntegerField5: TIntegerField
      FieldName = 'ITEM_SIZE'
      Origin = '"RB_ITEM"."ITEM_SIZE"'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ITEM_TYPE'
      Origin = '"RB_ITEM"."ITEM_TYPE"'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'MODIFIED'
      Origin = '"RB_ITEM"."MODIFIED"'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'DELETED'
      Origin = '"RB_ITEM"."DELETED"'
    end
    object BlobField1: TBlobField
      FieldName = 'TEMPLATE'
      Origin = '"RB_ITEM"."TEMPLATE"'
      BlobType = ftBlob
      Size = 8
    end
  end
  object IBSQL2: TIBSQL
    Database = IBDatabase2
    ParamCheck = True
    Transaction = IBTransaction2
    Left = 400
    Top = 112
  end
  object updFolder2: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  FOLDER_ID,'
      '  NAME,'
      '  PARENT_ID'
      'from RB_FOLDER '
      'where'
      '  NAME = :NAME and'
      '  PARENT_ID = :PARENT_ID')
    ModifySQL.Strings = (
      'update RB_FOLDER'
      'set'
      '  FOLDER_ID = :FOLDER_ID,'
      '  NAME = :NAME,'
      '  PARENT_ID = :PARENT_ID'
      'where'
      '  NAME = :OLD_NAME and'
      '  PARENT_ID = :OLD_PARENT_ID')
    InsertSQL.Strings = (
      'insert into RB_FOLDER'
      '  (FOLDER_ID, NAME, PARENT_ID)'
      'values'
      '  (:FOLDER_ID, :NAME, :PARENT_ID)')
    DeleteSQL.Strings = (
      'delete from RB_FOLDER'
      'where'
      '  NAME = :OLD_NAME and'
      '  PARENT_ID = :OLD_PARENT_ID')
    Left = 336
    Top = 8
  end
  object updItem2: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ITEM_ID,'
      '  FOLDER_ID,'
      '  NAME,'
      '  ITEM_SIZE,'
      '  ITEM_TYPE,'
      '  MODIFIED,'
      '  DELETED,'
      '  TEMPLATE'
      'from RB_ITEM '
      'where'
      '  FOLDER_ID = :FOLDER_ID and'
      '  NAME = :NAME and'
      '  ITEM_TYPE = :ITEM_TYPE and'
      '  MODIFIED = :MODIFIED')
    ModifySQL.Strings = (
      'update RB_ITEM'
      'set'
      '  ITEM_ID = :ITEM_ID,'
      '  FOLDER_ID = :FOLDER_ID,'
      '  NAME = :NAME,'
      '  ITEM_SIZE = :ITEM_SIZE,'
      '  ITEM_TYPE = :ITEM_TYPE,'
      '  MODIFIED = :MODIFIED,'
      '  DELETED = :DELETED,'
      '  TEMPLATE = :TEMPLATE'
      'where'
      '  FOLDER_ID = :OLD_FOLDER_ID and'
      '  NAME = :OLD_NAME and'
      '  ITEM_TYPE = :OLD_ITEM_TYPE and'
      '  MODIFIED = :OLD_MODIFIED')
    InsertSQL.Strings = (
      'insert into RB_ITEM'
      
        '  (ITEM_ID, FOLDER_ID, NAME, ITEM_SIZE, ITEM_TYPE, MODIFIED, DEL' +
        'ETED, TEMPLATE)'
      'values'
      
        '  (:ITEM_ID, :FOLDER_ID, :NAME, :ITEM_SIZE, :ITEM_TYPE, :MODIFIE' +
        'D, :DELETED, '
      '   :TEMPLATE)')
    DeleteSQL.Strings = (
      'delete from RB_ITEM'
      'where'
      '  FOLDER_ID = :OLD_FOLDER_ID and'
      '  NAME = :OLD_NAME and'
      '  ITEM_TYPE = :OLD_ITEM_TYPE and'
      '  MODIFIED = :OLD_MODIFIED')
    Left = 336
    Top = 56
  end
  object qryMaxFolder1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAX(FOLDER_ID) AS FOLDER FROM RB_FOLDER')
    Left = 176
    Top = 104
    object qryMaxFolder1FOLDER: TIntegerField
      FieldName = 'FOLDER'
    end
  end
  object qryMaxItem1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MAX(ITEM_ID) AS ITEM FROM RB_ITEM ')
    Left = 176
    Top = 152
    object qryMaxItem1ITEM: TIntegerField
      FieldName = 'ITEM'
    end
  end
end
