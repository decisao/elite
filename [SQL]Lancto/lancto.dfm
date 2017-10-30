object formLANCTO: TformLANCTO
  Left = 169
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Lançamento imeditato em Conta'
  ClientHeight = 299
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 258
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Data e Hora'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 56
      Height = 13
      Caption = 'Descrição'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 328
      Top = 48
      Width = 50
      Height = 13
      Caption = 'V a l o r'
      FocusControl = DBEdit3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 88
      Width = 70
      Height = 14
      Cursor = crHandPoint
      Caption = 'Conta Débito'
      FocusControl = DBEdit4
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 16
      Top = 128
      Width = 76
      Height = 14
      Cursor = crHandPoint
      Caption = 'Conta Crédito'
      FocusControl = DBEdit5
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label5Click
    end
    object Label6: TLabel
      Left = 16
      Top = 168
      Width = 63
      Height = 14
      Cursor = crHandPoint
      Caption = 'Documento'
      FocusControl = DBEdit6
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label6Click
    end
    object Label11: TLabel
      Left = 16
      Top = 208
      Width = 157
      Height = 13
      Caption = 'Informações do documento'
      FocusControl = DBEdit11
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 137
      Height = 21
      Color = clBtnFace
      DataField = 'DATAHORA'
      DataSource = dsrLANCTO
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 64
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = dsrLANCTO
      TabOrder = 1
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 328
      Top = 64
      Width = 113
      Height = 21
      DataField = 'VALOR'
      DataSource = dsrLANCTO
      TabOrder = 2
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 104
      Width = 64
      Height = 21
      DataField = 'CONTADEB'
      DataSource = dsrLANCTO
      TabOrder = 3
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 144
      Width = 64
      Height = 21
      DataField = 'CONTACRE'
      DataSource = dsrLANCTO
      TabOrder = 5
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 184
      Width = 64
      Height = 21
      DataField = 'CODDOC'
      DataSource = dsrLANCTO
      TabOrder = 7
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
    object PageControl1: TPageControl
      Left = 328
      Top = 96
      Width = 113
      Height = 153
      ActivePage = tsOutros
      TabOrder = 9
      Visible = False
      object tsCheque: TTabSheet
        Caption = 'Cheque'
        object Label7: TLabel
          Left = 8
          Top = 0
          Width = 35
          Height = 13
          Caption = 'Banco'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 8
          Top = 40
          Width = 89
          Height = 13
          Caption = 'Conta Corrente'
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 8
          Top = 80
          Width = 93
          Height = 13
          Caption = 'Número Cheque'
          FocusControl = DBEdit9
        end
        object DBEdit7: TDBEdit
          Left = 8
          Top = 16
          Width = 64
          Height = 21
          DataField = 'CODBANCO'
          DataSource = dsrLANCTO
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 8
          Top = 56
          Width = 89
          Height = 21
          DataField = 'NUMCC'
          DataSource = dsrLANCTO
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 8
          Top = 96
          Width = 89
          Height = 21
          DataField = 'NUMCHEQUE'
          DataSource = dsrLANCTO
          TabOrder = 2
        end
      end
      object tsCartao: TTabSheet
        Caption = 'Cartão'
        ImageIndex = 1
      end
      object tsOutros: TTabSheet
        Caption = 'Outros'
        ImageIndex = 2
        object Label10: TLabel
          Left = 0
          Top = 0
          Width = 88
          Height = 13
          Caption = 'NUMIDOUTROS'
          FocusControl = DBEdit10
        end
        object DBEdit10: TDBEdit
          Left = 0
          Top = 16
          Width = 97
          Height = 21
          DataField = 'NUMIDOUTROS'
          DataSource = dsrLANCTO
          TabOrder = 0
        end
      end
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 88
      Top = 104
      Width = 225
      Height = 21
      DataField = 'nomedeb'
      DataSource = dsrLANCTO
      TabOrder = 4
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 88
      Top = 144
      Width = 225
      Height = 21
      DataField = 'nomecre'
      DataSource = dsrLANCTO
      TabOrder = 6
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 88
      Top = 184
      Width = 225
      Height = 21
      DataField = 'nomedoc'
      DataSource = dsrLANCTO
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 16
      Top = 224
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      DataField = 'INFODOC'
      DataSource = dsrLANCTO
      TabOrder = 10
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Exit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 258
    Width = 454
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 328
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 200
      Top = 8
      Width = 113
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object memLANCTO: TRxMemoryData
    FieldDefs = <>
    AfterOpen = memLANCTOAfterOpen
    BeforeClose = memLANCTOBeforeClose
    AfterInsert = memLANCTOAfterInsert
    BeforePost = memLANCTOBeforePost
    Left = 232
    Top = 8
    object memLANCTODATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
    end
    object memLANCTODESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object memLANCTOVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object memLANCTOCONTADEB: TIntegerField
      FieldName = 'CONTADEB'
    end
    object memLANCTOCONTACRE: TIntegerField
      FieldName = 'CONTACRE'
    end
    object memLANCTOCODDOC: TIntegerField
      FieldName = 'CODDOC'
    end
    object memLANCTOCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
    end
    object memLANCTONUMCC: TIBStringField
      FieldName = 'NUMCC'
      Size = 10
    end
    object memLANCTONUMCHEQUE: TIBStringField
      FieldName = 'NUMCHEQUE'
      Size = 10
    end
    object memLANCTONUMAUTORIZ: TIBStringField
      FieldName = 'NUMAUTORIZ'
      Size = 10
    end
    object memLANCTONUMIDOUTROS: TIBStringField
      FieldName = 'NUMIDOUTROS'
    end
    object memLANCTOnomedeb: TIBStringField
      FieldKind = fkLookup
      FieldName = 'nomedeb'
      LookupDataSet = qryContaDeb
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CONTA'
      KeyFields = 'CONTADEB'
      Size = 40
      Lookup = True
    end
    object memLANCTOnomecre: TIBStringField
      FieldKind = fkLookup
      FieldName = 'nomecre'
      LookupDataSet = qryContaCre
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CONTA'
      KeyFields = 'CONTACRE'
      Size = 40
      Lookup = True
    end
    object memLANCTOnomedoc: TIBStringField
      FieldKind = fkLookup
      FieldName = 'nomedoc'
      LookupDataSet = qryDoc
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DOCUMENTO'
      KeyFields = 'CODDOC'
      Size = 40
      Lookup = True
    end
    object memLANCTOINFODOC: TIBStringField
      FieldName = 'INFODOC'
      Size = 50
    end
  end
  object dsrLANCTO: TDataSource
    DataSet = memLANCTO
    Left = 296
    Top = 8
  end
  object qryContaDeb: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traContaDeb
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CONTAS'
      'ORDER BY CODIGO')
    Left = 24
    Top = 192
  end
  object qryContaCre: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traContaCre
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CONTAS'
      'ORDER BY CODIGO')
    Left = 96
    Top = 192
  end
  object qryDoc: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDoc
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM DOCUMENTOS'
      'ORDER BY CODIGO')
    Left = 168
    Top = 192
  end
  object spLANCTO: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traLANCTO
    StoredProcName = 'LANCTO'
    Left = 240
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INFODOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end>
  end
  object traContaDeb: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 25
    Top = 133
  end
  object traContaCre: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 97
    Top = 133
  end
  object traDoc: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 169
    Top = 133
  end
  object traLANCTO: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 241
    Top = 133
  end
end
