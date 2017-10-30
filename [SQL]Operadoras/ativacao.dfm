object formAtivacao: TformAtivacao
  Left = 149
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Ativação Telecom'
  ClientHeight = 264
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 139
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Aparelho'
    end
    object Label2: TLabel
      Left = 368
      Top = 8
      Width = 23
      Height = 13
      Caption = 'ESN'
    end
    object Label3: TLabel
      Left = 368
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Número'
    end
    object Label4: TLabel
      Left = 16
      Top = 48
      Width = 69
      Height = 13
      Cursor = crHandPoint
      Caption = 'Operadora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 16
      Top = 88
      Width = 109
      Height = 13
      Cursor = crHandPoint
      Caption = 'Plano de Serviço'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label5Click
    end
    object Label6: TLabel
      Left = 368
      Top = 88
      Width = 77
      Height = 13
      Caption = 'Tipo do Plano'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 345
      Height = 21
      DataField = 'APARELO'
      DataSource = dsrAtivacao
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 368
      Top = 24
      Width = 145
      Height = 21
      DataField = 'SERIE'
      DataSource = dsrAtivacao
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 368
      Top = 64
      Width = 145
      Height = 21
      DataField = 'NUMERO_FONE'
      DataSource = dsrAtivacao
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 64
      Width = 345
      Height = 21
      Color = clBtnFace
      DataField = 'NOME'
      DataSource = dsrOperadora
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 104
      Width = 345
      Height = 21
      Color = clBtnFace
      DataField = 'NOME'
      DataSource = dsrPlano
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 368
      Top = 104
      Width = 145
      Height = 21
      Color = clBtnFace
      DataField = 'TIPO'
      DataSource = dsrPlano
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 223
    Width = 536
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 432
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 328
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      ModalResult = 1
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
  object pnlCompra: TPanel
    Left = 0
    Top = 139
    Width = 536
    Height = 84
    Align = alBottom
    TabOrder = 2
    object Label7: TLabel
      Left = 16
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Código Barras'
    end
    object Label8: TLabel
      Left = 216
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Valor original'
    end
    object Label9: TLabel
      Left = 368
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Valor pago'
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      Color = clBtnFace
      DataField = 'BARRA'
      DataSource = dsrProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit8: TDBEdit
      Left = 216
      Top = 24
      Width = 145
      Height = 21
      Color = clBtnFace
      DataField = 'VALOR_VENDA'
      DataSource = dsrProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 368
      Top = 24
      Width = 145
      Height = 21
      Color = clBtnFace
      DataField = 'VALOR_PAGO'
      DataSource = dsrProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 56
      Width = 169
      Height = 17
      Caption = 'Incluir na lista de Rebate'
      DataField = 'REBATE'
      DataSource = dsrAtivacao
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  object traAtivacao: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 440
    Top = 32
  end
  object qryAtivacao: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traAtivacao
    AfterEdit = qryAtivacaoAfterEdit
    AfterOpen = qryAtivacaoAfterOpen
    AfterPost = qryAtivacaoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  APARELO,'
      '  SERIE,'
      '  NUMERO_FONE,'
      '  CODOPERADORA,'
      '  CODPLANO,'
      '  REBATE,'
      '  ATIVACAO,'
      '  CODINDIVIDUO'
      'FROM'
      '  INDIVIDUAIS'
      'WHERE'
      '  CODIGO = :CODIGO')
    UpdateObject = updAtivacao
    Left = 440
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrAtivacao: TDataSource
    DataSet = qryAtivacao
    Left = 440
    Top = 128
  end
  object updAtivacao: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODITEM,'
      '  CODPRODUTO,'
      '  CODMOVENTRADA,'
      '  SEQUENCIA,'
      '  SERIE,'
      '  VENDIDO,'
      '  CODMOVSAIDA,'
      '  VALOR_VENDA,'
      '  ICMSVENDA,'
      '  DESCONTO,'
      '  QUANTIDADE,'
      '  VALOR_PAGO,'
      '  VALOR_ICMS,'
      '  IMPETIQ,'
      '  BARRA,'
      '  UNICO,'
      '  FRACIONADO,'
      '  PS,'
      '  CODEMPRESA,'
      '  VALOR_COMISSAO,'
      '  CUSTO_PRODUTO,'
      '  CUSTO_IPI,'
      '  CUSTO_RATEIO,'
      '  CUSTO_ICMS,'
      '  CUSTO_COMISSAO,'
      '  CUSTO_ISS,'
      '  CUSTO_TOTAL,'
      '  TOTAL_IPI,'
      '  TOTAL_ICMS,'
      '  TOTAL_ISS,'
      '  TOTAL_CUSTO,'
      '  TOTAL_LUCRO,'
      '  LUCRO_ITEM,'
      '  NUMERO_FONE,'
      '  CODOPERADORA,'
      '  CODPLANO,'
      '  REBATE,'
      '  ATIVACAO,'
      '  CODINDIVIDUO,'
      '  APARELO'
      'from INDIVIDUAIS '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update INDIVIDUAIS'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO_FONE = :NUMERO_FONE,'
      '  CODOPERADORA = :CODOPERADORA,'
      '  CODPLANO = :CODPLANO,'
      '  REBATE = :REBATE,'
      '  ATIVACAO = :ATIVACAO,'
      '  CODINDIVIDUO = :CODINDIVIDUO,'
      '  APARELO = :APARELO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into INDIVIDUAIS'
      '  (CODIGO, SERIE, NUMERO_FONE, CODOPERADORA, CODPLANO, REBATE, '
      'ATIVACAO, '
      '   CODINDIVIDUO, APARELO)'
      'values'
      
        '  (:CODIGO, :SERIE, :NUMERO_FONE, :CODOPERADORA, :CODPLANO, :REB' +
        'ATE, '
      ':ATIVACAO, '
      '   :CODINDIVIDUO, :APARELO)')
    DeleteSQL.Strings = (
      'delete from INDIVIDUAIS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 440
    Top = 176
  end
  object traOperadora: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 176
    Top = 32
  end
  object qryOperadora: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOperadora
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrAtivacao
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  OPERADORAS'
      'WHERE'
      '  CODIGO = :CODOPERADORA')
    UniDirectional = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODOPERADORA'
        ParamType = ptUnknown
      end>
  end
  object dsrOperadora: TDataSource
    DataSet = qryOperadora
    Left = 176
    Top = 128
  end
  object dsrPlano: TDataSource
    DataSet = qryPlano
    Left = 256
    Top = 128
  end
  object qryPlano: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traPlano
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrAtivacao
    SQL.Strings = (
      'SELECT'
      '  NOME,'
      '  TIPO'
      'FROM'
      '  PLANOS'
      'WHERE'
      '  CODIGO = :CODPLANO AND'
      '  CODOPERADORA = :CODOPERADORA')
    UniDirectional = True
    Left = 256
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODOPERADORA'
        ParamType = ptUnknown
      end>
  end
  object traPlano: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 256
    Top = 32
  end
  object traProduto: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 80
    Top = 32
  end
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    AfterOpen = qryProdutoAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  ID.CODIGO,'
      '  ID.NUMERO_FONE,'
      '  ID.CODOPERADORA,'
      '  ID.CODPLANO,'
      '  ID.SERIE,'
      '  ID.BARRA,'
      '  ID.VALOR_VENDA,'
      '  ID.VALOR_PAGO,'
      '  PO.DESCRICAO AS APARELO'
      'FROM'
      '  INDIVIDUAIS ID'
      '  JOIN PRODUTOS PO ON'
      '   (PO.CODIGO = ID.CODPRODUTO)'
      'WHERE'
      '  ID.CODMOVSAIDA = :CODMOVIMENTO AND'
      '  ID.PS = '#39'P'#39' AND'
      '  ID.UNICO = 1 AND'
      '  ID.VENDIDO = '#39'S'#39)
    UniDirectional = True
    Left = 80
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsrProduto: TDataSource
    DataSet = qryProduto
    Left = 80
    Top = 128
  end
end
