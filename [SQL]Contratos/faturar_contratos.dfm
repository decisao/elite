object formFaturarContratos: TformFaturarContratos
  Left = 267
  Top = 234
  BorderStyle = bsDialog
  Caption = 'Faturar Contratos'
  ClientHeight = 265
  ClientWidth = 479
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
    Width = 479
    Height = 224
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 369
      Height = 209
      Caption = ' Selecionar Contratos '
      TabOrder = 0
      object zebdbgrid1: Tzebdbgrid
        Left = 8
        Top = 24
        Width = 345
        Height = 177
        DataSource = dsrSelecionar
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Zebra = True
        ZebraColor = clInfoBk
        ZebraFontColor = clWindowText
        OnDblClick = zebdbgrid1DblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SELECIONAR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = '*'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Contratante'
            Width = 279
            Visible = True
          end>
      end
    end
    object BitBtn1: TBitBtn
      Left = 383
      Top = 13
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = '&Todos'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 383
      Top = 45
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Nenhum'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 479
    Height = 41
    Align = alBottom
    Color = clWindow
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 120
      Top = 8
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 256
      Top = 8
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn4Click
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
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AutoCalcFields = False
    OnUpdateRecord = qrySelecionarUpdateRecord
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  '#39' '#39' AS SELECIONAR,'
      '  CONTRATOS.CODIGO AS CODCLIENTE,'
      '  CONTRATOS.CODVENDEDOR,'
      '  CONTRATOS.CODTECNICO,'
      '  CONTRATOS.CODSERVICO,'
      '  CONTRATOS.CODNATUOPER,'
      '  CONTRATOS.CODCONDPAG,'
      '  CONTRATOS.VALOR,'
      '  CLIENTES.NOME'
      'FROM'
      '  CONTRATOS'
      '  LEFT JOIN CLIENTES ON '
      '    (CLIENTES.CODIGO = CONTRATOS.CODIGO)'
      'WHERE'
      '  CONTRATOS.FATURAR = '#39'S'#39
      'ORDER BY'
      '  CLIENTES.NOME')
    UpdateObject = updSelecionar
    Left = 245
    Top = 128
    object qrySelecionarSELECIONAR: TIBStringField
      FieldName = 'SELECIONAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrySelecionarNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CLIENTES"."NOME"'
      FixedChar = True
      Size = 40
    end
    object qrySelecionarCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"CONTRATOS"."CODIGO"'
      Required = True
    end
    object qrySelecionarCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = '"CONTRATOS"."CODVENDEDOR"'
    end
    object qrySelecionarCODTECNICO: TIntegerField
      FieldName = 'CODTECNICO'
      Origin = '"CONTRATOS"."CODTECNICO"'
    end
    object qrySelecionarCODSERVICO: TIntegerField
      FieldName = 'CODSERVICO'
      Origin = '"CONTRATOS"."CODSERVICO"'
      Required = True
    end
    object qrySelecionarCODNATUOPER: TIBStringField
      FieldName = 'CODNATUOPER'
      Origin = '"CONTRATOS"."CODNATUOPER"'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrySelecionarCODCONDPAG: TIntegerField
      FieldName = 'CODCONDPAG'
      Origin = '"CONTRATOS"."CODCONDPAG"'
      Required = True
    end
    object qrySelecionarVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"CONTRATOS"."VALOR"'
      Precision = 9
      Size = 2
    end
  end
  object dsrSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 245
    Top = 184
  end
  object traSelecionar: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 249
    Top = 69
  end
  object updSelecionar: TIBUpdateSQL
    ModifySQL.Strings = (
      'UPDATE CONTRATOS SET CODIGO = CODIGO')
    Left = 144
    Top = 128
  end
  object traFaturar: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 329
    Top = 69
  end
  object procFaturar: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traFaturar
    StoredProcName = 'CONTRATO_FATURAR'
    Left = 328
    Top = 128
    object procFaturarCODMOVIMENTO: TIntegerField
      FieldName = 'CODMOVIMENTO'
      Origin = '"CONTRATO_FATURAR"."CODMOVIMENTO"'
    end
  end
end
