object formExtrato: TformExtrato
  Left = 259
  Top = 151
  BorderStyle = bsDialog
  Caption = 'Extrato de conta'
  ClientHeight = 226
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 185
    Width = 339
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 176
      Top = 8
      Width = 107
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 56
      Top = 8
      Width = 107
      Height = 25
      Cursor = crHandPoint
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 185
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 123
      Height = 13
      Cursor = crHandPoint
      Caption = 'Conta para extrato'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label1Click
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 64
      Height = 21
      DataField = 'CODCONTA'
      DataSource = dsrEXTRATO
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 32
      Width = 233
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CONTA'
      DataSource = dsrConta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 305
      Height = 70
      Caption = ' Período '
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 19
        Width = 65
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label3: TLabel
        Left = 168
        Top = 19
        Width = 57
        Height = 13
        Caption = 'Data Final'
      end
      object DBDateEdit1: TDBDateEdit
        Left = 16
        Top = 35
        Width = 121
        Height = 21
        DataField = 'DATA'
        DataSource = dsrEXTRATO
        DialogTitle = 'Selecione uma data'
        NumGlyphs = 2
        TabOrder = 0
        StartOfWeek = Sun
        Weekends = [Sun, Sat]
      end
      object DBDateEdit2: TDBDateEdit
        Left = 168
        Top = 35
        Width = 121
        Height = 21
        DataField = 'DATA2'
        DataSource = dsrEXTRATO
        DialogTitle = 'Selecione uma data'
        NumGlyphs = 2
        TabOrder = 1
        StartOfWeek = Sun
        Weekends = [Sun, Sat]
        OnChange = DBDateEdit2Change
      end
    end
    object ckFuturo: TCheckBox
      Left = 32
      Top = 141
      Width = 193
      Height = 17
      Cursor = crHandPoint
      Caption = 'Documentos futuros emitidos'
      TabOrder = 3
    end
    object ckResumo: TCheckBox
      Left = 32
      Top = 160
      Width = 129
      Height = 17
      Cursor = crHandPoint
      Caption = 'Resumo Financeiro'
      TabOrder = 4
    end
  end
  object memEXTRATO: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CODCONTA'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end>
    AfterInsert = memEXTRATOAfterInsert
    BeforePost = memEXTRATOBeforePost
    Left = 104
    Top = 88
    object memEXTRATOCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      OnChange = memEXTRATOCODCONTAChange
    end
    object memEXTRATODATA: TDateField
      FieldName = 'DATA'
    end
    object memEXTRATODATA2: TDateField
      FieldName = 'DATA2'
    end
  end
  object dsrEXTRATO: TDataSource
    DataSet = memEXTRATO
    Left = 104
    Top = 144
  end
  object qryConta: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traConta
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrEXTRATO
    SQL.Strings = (
      'SELECT '
      '  CONTA'
      'FROM '
      '  CONTAS'
      'WHERE'
      '  CODIGO = :CODCONTA')
    UniDirectional = True
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCONTA'
        ParamType = ptUnknown
      end>
  end
  object dsrConta: TDataSource
    AutoEdit = False
    DataSet = qryConta
    Left = 16
    Top = 104
  end
  object traConta: TIBTransaction
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
    Left = 33
    Top = 37
  end
  object traExtrato1: TIBTransaction
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
    Left = 177
    Top = 37
  end
  object qryExtrato1: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traExtrato1
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT     '
      '    DATAHORA,'
      '    USUARIO,'
      '    DESCRICAO,'
      '    VALORCRE,'
      '    SALDO,'
      '    LETRA,'
      '    VALORDEB,'
      '    INFODOC,'
      '    DOCUMENTO,'
      '    CLIENTE,'
      '    '#39' '#39' as GRUPO'
      'FROM '
      '    EXTRATO(:CODCONTA, :DATAINI, :DATAFIM, :CODEMPRESA)')
    Left = 176
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
    object qryExtrato1DATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
      Origin = '"EXTRATO"."DATAHORA"'
      DisplayFormat = 'dd/mm/yy hh:nn'
    end
    object qryExtrato1USUARIO: TIBStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object qryExtrato1DESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryExtrato1SALDO: TIBBCDField
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object qryExtrato1LETRA: TIBStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 1
    end
    object qryExtrato1VALORCRE: TIBBCDField
      FieldName = 'VALORCRE'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object qryExtrato1VALORDEB: TIBBCDField
      FieldName = 'VALORDEB'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object qryExtrato1INFODOC: TIBStringField
      FieldName = 'INFODOC'
      Size = 50
    end
    object qryExtrato1DOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Size = 40
    end
    object qryExtrato1CLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"EXTRATO"."CLIENTE"'
      Size = 40
    end
    object qryExtrato1GRUPO: TIBStringField
      FieldName = 'GRUPO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsrExtrato1: TDataSource
    AutoEdit = False
    DataSet = qryExtrato1
    Left = 176
    Top = 144
  end
  object ppDBExtrato: TppDBPipeline
    DataSource = dsrExtrato1
    UserName = 'DBExtrato1'
    Left = 256
    Top = 88
  end
  object ppExtrato: TppReport
    AutoStop = False
    DataPipeline = ppDBExtrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    Left = 256
    Top = 144
    Version = '7.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBExtrato'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7673
        mmLeft = 3175
        mmTop = 3175
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Extrato da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6085
        mmLeft = 4233
        mmTop = 3969
        mmWidth = 46567
        BandType = 0
      end
      object lbConta: TppLabel
        UserName = 'lbConta'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6085
        mmLeft = 53975
        mmTop = 3969
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5997
        mmLeft = 189089
        mmTop = 3969
        mmWidth = 3528
        BandType = 0
      end
      object lbPeriodo: TppLabel
        UserName = 'lbPeriodo'
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 11377
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Color = clWhite
        mmHeight = 8202
        mmLeft = 2381
        mmTop = 0
        mmWidth = 192882
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAHORA'
        DataPipeline = ppDBExtrato
        DisplayFormat = 'dd/mm/yy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 265
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'USUARIO'
        DataPipeline = ppDBExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CLIENTE'
        DataPipeline = ppDBExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 265
        mmWidth = 75671
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALORCRE'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALORDEB'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDO'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 3704
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DOCUMENTO'
        DataPipeline = ppDBExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 3704
        mmWidth = 25929
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 2646
        mmTop = 0
        mmWidth = 192352
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'SALDO'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3669
        mmLeft = 173302
        mmTop = 1058
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        BlankWhenZero = True
        DataField = 'VALORDEB'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3669
        mmLeft = 151607
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        BlankWhenZero = True
        DataField = 'VALORCRE'
        DataPipeline = ppDBExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBExtrato'
        mmHeight = 3669
        mmLeft = 129117
        mmTop = 1058
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = '*** T O T A I S ***'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3669
        mmLeft = 52123
        mmTop = 1058
        mmWidth = 36195
        BandType = 7
      end
      object ppSubFuturo: TppSubReport
        UserName = 'Futuros'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppDBExtratoDOC'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBExtratoDOC
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 200
          Top = 112
          Version = '7.0'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBExtratoDOC'
          object ppHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 16669
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 7673
              mmLeft = 3175
              mmTop = 3175
              mmWidth = 190500
              BandType = 0
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Documentos futuros emitidos no período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 14
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 3969
              mmWidth = 113506
              BandType = 0
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable2'
              VarType = vtPageNo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 14
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 6085
              mmLeft = 189177
              mmTop = 3969
              mmWidth = 3440
              BandType = 0
            end
            object lbPeriodo2: TppLabel
              UserName = 'lbPeriodo1'
              Caption = 'Período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4498
              mmTop = 11377
              mmWidth = 13229
              BandType = 0
            end
          end
          object ppDetailBand2: TppDetailBand
            BeforePrint = ppDetailBand2BeforePrint
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape5'
              Pen.Color = clWhite
              mmHeight = 7673
              mmLeft = 2646
              mmTop = 0
              mmWidth = 192088
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'DATAHORA'
              DataPipeline = ppDBExtratoDOC
              DisplayFormat = 'dd/mm/yy hh:nn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 32808
              mmTop = 0
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'CLIENTE'
              DataPipeline = ppDBExtratoDOC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 63236
              mmTop = 0
              mmWidth = 83344
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'DESCRICAO'
              DataPipeline = ppDBExtratoDOC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 63236
              mmTop = 3440
              mmWidth = 83344
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'VALORCRE'
              DataPipeline = ppDBExtratoDOC
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 147902
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'VALORDEB'
              DataPipeline = ppDBExtratoDOC
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 170921
              mmTop = 0
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'DOCUMENTO'
              DataPipeline = ppDBExtratoDOC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 4498
              mmTop = 0
              mmWidth = 26988
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = '*** TOTAL DOCUMENTOS FUTUROS EMITIDOS ***'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3669
              mmLeft = 63236
              mmTop = 1323
              mmWidth = 78105
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              BlankWhenZero = True
              DataField = 'VALORCRE'
              DataPipeline = ppDBExtratoDOC
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 148432
              mmTop = 1323
              mmWidth = 21167
              BandType = 7
            end
            object ppDBCalc6: TppDBCalc
              UserName = 'DBCalc6'
              BlankWhenZero = True
              DataField = 'VALORDEB'
              DataPipeline = ppDBExtratoDOC
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBExtratoDOC'
              mmHeight = 3704
              mmLeft = 170921
              mmTop = 1323
              mmWidth = 20108
              BandType = 7
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'DOCUMENTO'
            DataPipeline = ppDBExtratoDOC
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDBExtratoDOC'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Data e hora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 43656
                mmTop = 1588
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLine3: TppLine
                UserName = 'Line3'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 794
                mmLeft = 2646
                mmTop = 5291
                mmWidth = 192088
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'Descrição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 63500
                mmTop = 1588
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object ppLabel12: TppLabel
                UserName = 'Label101'
                Caption = 'A Receber'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 153723
                mmTop = 1588
                mmWidth = 15610
                BandType = 3
                GroupNo = 0
              end
              object ppLabel13: TppLabel
                UserName = 'Label13'
                Caption = 'A Pagar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 178859
                mmTop = 1588
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3810
                mmLeft = 4498
                mmTop = 1588
                mmWidth = 17286
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object ppLine4: TppLine
                UserName = 'Line4'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 2646
                mmTop = 0
                mmWidth = 192088
                BandType = 5
                GroupNo = 0
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = '*** TOTAL DE '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 63236
                mmTop = 1323
                mmWidth = 24871
                BandType = 5
                GroupNo = 0
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'DOCUMENTO'
                DataPipeline = ppDBExtratoDOC
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppDBExtratoDOC'
                mmHeight = 3704
                mmLeft = 87842
                mmTop = 1323
                mmWidth = 40746
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                BlankWhenZero = True
                DataField = 'VALORCRE'
                DataPipeline = ppDBExtratoDOC
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBExtratoDOC'
                mmHeight = 3704
                mmLeft = 148432
                mmTop = 1323
                mmWidth = 21167
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc4: TppDBCalc
                UserName = 'DBCalc4'
                BlankWhenZero = True
                DataField = 'VALORDEB'
                DataPipeline = ppDBExtratoDOC
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDBExtratoDOC'
                mmHeight = 3704
                mmLeft = 170921
                mmTop = 1323
                mmWidth = 20108
                BandType = 5
                GroupNo = 0
              end
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppDBExtrato
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBExtrato'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 2646
          mmTop = 5027
          mmWidth = 192352
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Data e hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 13494
          mmTop = 1323
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Usuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 33338
          mmTop = 1323
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Descrição e tipo de documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 52388
          mmTop = 1323
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 139436
          mmTop = 1323
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 162190
          mmTop = 1323
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 184944
          mmTop = 1323
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
  end
  object traExtratoDOC: TIBTransaction
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
    Left = 337
    Top = 37
  end
  object qryExtratoDOC: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traExtratoDOC
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM EXTRATO_DOC(:DATAINI, :DATAFIM, :CODEMPRESA)')
    Left = 336
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
    object qryExtratoDOCDATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
      Origin = '"EXTRATO_DOC"."DATAHORA"'
    end
    object qryExtratoDOCCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"EXTRATO_DOC"."CLIENTE"'
      Size = 40
    end
    object qryExtratoDOCDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"EXTRATO_DOC"."DESCRICAO"'
      Size = 40
    end
    object qryExtratoDOCVALORCRE: TIBBCDField
      FieldName = 'VALORCRE'
      Origin = '"EXTRATO_DOC"."VALORCRE"'
      Precision = 9
      Size = 2
    end
    object qryExtratoDOCVALORDEB: TIBBCDField
      FieldName = 'VALORDEB'
      Origin = '"EXTRATO_DOC"."VALORDEB"'
      Precision = 9
      Size = 2
    end
    object qryExtratoDOCLETRA: TIBStringField
      FieldName = 'LETRA'
      Origin = '"EXTRATO_DOC"."LETRA"'
      FixedChar = True
      Size = 1
    end
    object qryExtratoDOCINFODOC: TIBStringField
      FieldName = 'INFODOC'
      Origin = '"EXTRATO_DOC"."INFODOC"'
      Size = 50
    end
    object qryExtratoDOCDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = '"EXTRATO_DOC"."DOCUMENTO"'
      Size = 40
    end
  end
  object dsrExtratoDOC: TDataSource
    AutoEdit = False
    DataSet = qryExtratoDOC
    Left = 336
    Top = 144
  end
  object ppDBExtratoDOC: TppDBPipeline
    DataSource = dsrExtratoDOC
    UserName = 'DBExtratoDOC'
    Left = 256
    Top = 40
  end
end
