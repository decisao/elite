object formImprimirNota: TformImprimirNota
  Left = 380
  Top = 241
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Impressão da Nota Fiscal'
  ClientHeight = 254
  ClientWidth = 448
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
  object Bevel1: TBevel
    Left = 0
    Top = 217
    Width = 448
    Height = 2
    Align = alTop
    Shape = bsTopLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 9
      Width = 221
      Height = 25
      Caption = 'Imprimir Nota Fiscal '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 126
      Height = 13
      Caption = 'Para ser impressa em'
    end
    object DBText1: TDBText
      Left = 16
      Top = 48
      Width = 289
      Height = 17
      DataField = 'PRINT_NOTA'
      DataSource = dsrCabNota
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 8
      Top = 72
      Width = 433
      Height = 9
      Shape = bsTopLine
    end
    object lblNatuoper: TLabel
      Left = 14
      Top = 83
      Width = 144
      Height = 13
      Cursor = crHandPoint
      Caption = 'Natureza da operação'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = lblNatuoperClick
    end
    object Label3: TLabel
      Left = 302
      Top = 84
      Width = 119
      Height = 13
      Caption = 'Data e hora emissão'
    end
    object Label4: TLabel
      Left = 302
      Top = 124
      Width = 61
      Height = 13
      Caption = 'Data saída'
    end
    object Label5: TLabel
      Left = 14
      Top = 125
      Width = 74
      Height = 13
      Caption = 'Observações'
    end
    object DBEdit10: TDBEdit
      Left = 14
      Top = 99
      Width = 59
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOTA_CODNATUOPER'
      DataSource = dsrMovimentos
      TabOrder = 0
      OnEnter = DBEdit10Enter
      OnExit = DBEdit10Exit
    end
    object DBEdit45: TDBEdit
      Left = 82
      Top = 99
      Width = 207
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'NATUREZA'
      DataSource = dsrNatuoper
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 302
      Top = 99
      Width = 131
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOTA_DATAEMISSAO'
      DataSource = dsrMovimentos
      TabOrder = 2
      OnEnter = DBEdit10Enter
      OnExit = DBEdit10Exit
    end
    object DBEdit2: TDBEdit
      Left = 302
      Top = 139
      Width = 131
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOTA_DATASAIDA'
      DataSource = dsrMovimentos
      TabOrder = 3
      OnEnter = DBEdit10Enter
      OnExit = DBEdit10Exit
    end
    object DBMemo3: TDBMemo
      Tag = 4
      Left = 14
      Top = 140
      Width = 275
      Height = 59
      DataField = 'OBSERVACOES'
      DataSource = dsrMovimentos
      TabOrder = 4
      OnEnter = DBEdit10Enter
      OnExit = DBEdit10Exit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 219
    Width = 448
    Height = 35
    Align = alClient
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 1
    object bbtOK: TBitBtn
      Left = 233
      Top = 4
      Width = 97
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
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
    object ckLocal: TCheckBox
      Left = 16
      Top = 8
      Width = 193
      Height = 17
      Cursor = crHandPoint
      Caption = 'redirecionamento local'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 337
      Top = 4
      Width = 97
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object qryImpNota: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traImpNota
    BeforeOpen = qryImpNotaBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'IMPNOTA_RESUMO(:NUMIMPNOTA)'
      'WHERE'
      '        TIPO = :TIPO'
      ''
      ' '
      ' '
      ' ')
    Left = 552
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMIMPNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object qryNotaCorpo: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traNotaCorpo
    BeforeOpen = qryNotaCorpoBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      '        :CALLPROC (:CODMOVIMENTO)')
    Left = 686
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'CALLPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsrNotaCorpo: TDataSource
    DataSet = qryNotaCorpo
    Left = 684
    Top = 108
  end
  object qryCabNota: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCabNota
    BeforeOpen = qryCabNotaBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  IM.NUMIMPNOTA,'
      '  IM.DESCRICAO,'
      '  IM.LINHA18,'
      '  IM.DUP_LINHAINI,'
      '  IM.DUP_COLUNAS,'
      '  IM.DUP_LINHAS,'
      '  IM.DUP_TAMANHOCOL,'
      '  IM.DUP_COLUNAINI,'
      '  IM.PRO_LINHAINI,'
      '  IM.PRO_LINHAS,'
      '  IM.SER_LINHAINI,'
      '  IM.SER_LINHAS,'
      '  IM.ALTURA,'
      '  IM.EFEITOBASE,'
      '  CI.PRINT_NOTA'
      'FROM'
      '  IMPNOTA IM, SISCONFIG CI'
      'WHERE'
      '  IM.NUMIMPNOTA = CI.NOTA_PADRAO AND'
      '  CI.CODIGO = :CODEMPRESA'
      '')
    UniDirectional = True
    Left = 624
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsrCabNota: TDataSource
    DataSet = qryCabNota
    Left = 619
    Top = 110
  end
  object traImpNota: TIBTransaction
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
    Left = 553
    Top = 13
  end
  object traCabNota: TIBTransaction
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
    Left = 617
    Top = 13
  end
  object traNotaCorpo: TIBTransaction
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
    Left = 681
    Top = 13
  end
  object qryMovimentos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMovimentos
    AfterOpen = qryMovimentosAfterOpen
    AfterPost = qryMovimentosAfterPost
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOTA_CODNATUOPER,'
      '  OBSERVACOES,'
      '  NOTA_DATAEMISSAO,'
      '  NOTA_DATASAIDA,'
      '  NOTA_NUMERO'
      'FROM'
      '  MOVIMENTOS'
      'WHERE'
      '  CODIGO = :CODMOVIMENTO')
    UpdateObject = updMovimentos
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object traMovimentos: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saNone
    Left = 160
    Top = 8
  end
  object dsrMovimentos: TDataSource
    DataSet = qryMovimentos
    Left = 160
    Top = 104
  end
  object updMovimentos: TIBUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '   MOVIMENTOS'
      'SET'
      '  NOTA_CODNATUOPER = :NOTA_CODNATUOPER,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  NOTA_DATAEMISSAO = :NOTA_DATAEMISSAO,'
      '  NOTA_DATASAIDA = :NOTA_DATASAIDA,'
      '  NOTA_NUMERO = :NOTA_NUMERO'
      'WHERE'
      '  CODIGO = :CODIGO')
    Left = 240
    Top = 56
  end
  object traNatuoper: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 80
    Top = 8
  end
  object qryNatuoper: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traNatuoper
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT'
      '  NATUREZA'
      'FROM'
      '  NATUOPER'
      'WHERE'
      '  CODIGO = :NOTA_CODNATUOPER')
    Left = 80
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'NOTA_CODNATUOPER'
        ParamType = ptUnknown
      end>
  end
  object dsrNatuoper: TDataSource
    AutoEdit = False
    DataSet = qryNatuoper
    Left = 80
    Top = 104
  end
end
