object formTransf: TformTransf
  Left = 284
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Transferência de Estoque'
  ClientHeight = 148
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 105
    Width = 533
    Height = 2
    Align = alTop
    Shape = bsTopLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Cursor = crHandPoint
      Caption = 'Produto'
      FocusControl = edBarra
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label1Click
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Quant.'
      FocusControl = DBEdit3
    end
    object Label3: TLabel
      Left = 144
      Top = 56
      Width = 234
      Height = 13
      Caption = 'Destino (empresa que recebe o produto)'
      FocusControl = DBLookupComboBox1
    end
    object Label4: TLabel
      Left = 64
      Top = 8
      Width = 370
      Height = 13
      Caption = 'Para produtos individuais use somente o código de barras único.'
    end
    object Label5: TLabel
      Left = 72
      Top = 56
      Width = 31
      Height = 13
      Caption = 'ICMS'
      FocusControl = DBEdit4
    end
    object edBarra: TDBEdit
      Left = 8
      Top = 24
      Width = 129
      Height = 21
      DataField = 'BARRA'
      DataSource = dsrTransf
      TabOrder = 0
      OnEnter = edBarraEnter
      OnExit = edBarraExit
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 24
      Width = 377
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DESCRICAO'
      DataSource = dsrProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 72
      Width = 57
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = dsrTransf
      TabOrder = 2
      OnEnter = edBarraEnter
      OnExit = edBarraExit
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Tag = 1
      Left = 144
      Top = 72
      Width = 377
      Height = 21
      DataField = 'EMPRESA'
      DataSource = dsrTransf
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 72
      Top = 72
      Width = 65
      Height = 21
      DataField = 'ICMS'
      DataSource = dsrTransf
      TabOrder = 3
      OnEnter = edBarraEnter
      OnExit = edBarraExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 107
    Width = 533
    Height = 41
    Align = alClient
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 280
      Top = 8
      Width = 113
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 152
      Top = 8
      Width = 113
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      TabOrder = 0
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
  object memTransf: TRxMemoryData
    FieldDefs = <>
    AfterInsert = memTransfAfterInsert
    BeforePost = memTransfBeforePost
    Left = 232
    Top = 208
    object memTransfBARRA: TStringField
      FieldName = 'BARRA'
      OnChange = memTransfBARRAChange
      Size = 13
    end
    object memTransfQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object memTransfCODEMPRESA1: TIntegerField
      FieldName = 'CODEMPRESA1'
    end
    object memTransfCODEMPRESA2: TIntegerField
      FieldName = 'CODEMPRESA2'
    end
    object memTransfEMPRESA: TStringField
      FieldKind = fkLookup
      FieldName = 'EMPRESA'
      LookupDataSet = qryEmpresa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CODEMPRESA2'
      Size = 60
      Lookup = True
    end
    object memTransfICMS: TFloatField
      FieldName = 'ICMS'
      DisplayFormat = '##0.0000'
    end
  end
  object dsrTransf: TDataSource
    DataSet = memTransf
    Left = 232
    Top = 256
  end
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrTransf
    SQL.Strings = (
      'SELECT'
      '   ID.CODPRODUTO,'
      '   PO.DESCRICAO'
      'FROM'
      '  INDIVIDUAIS ID'
      '  JOIN PRODUTOS PO ON '
      '    (ID.CODPRODUTO = PO.CODIGO)'
      'WHERE'
      '  ID.BARRA = :BARRA')
    UniDirectional = True
    Left = 168
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptUnknown
      end>
  end
  object traProduto: TIBTransaction
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
    Left = 168
    Top = 160
  end
  object dsrProduto: TDataSource
    DataSet = qryProduto
    Left = 168
    Top = 256
  end
  object traEmpresa: TIBTransaction
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
    Left = 96
    Top = 160
  end
  object qryEmpresa: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEmpresa
    BeforeOpen = qryEmpresaBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrTransf
    SQL.Strings = (
      'SELECT'
      '  SI.CODIGO,'
      '  CL.NOME'
      'FROM'
      '  SISCONFIG SI'
      '  JOIN CLIENTES CL ON'
      '    (CL.CODIGO = SI.CODCLIENTE)'
      'WHERE'
      '  SI.CODIGO <> :CODEMPRESA'
      'ORDER BY'
      '  CL.NOME')
    Left = 96
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsrEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 96
    Top = 256
  end
  object spTransf: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traTransf
    StoredProcName = 'TRANSFERENCIA'
    Left = 32
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA2'
        ParamType = ptInput
      end>
  end
  object traTransf: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 32
    Top = 160
  end
end
