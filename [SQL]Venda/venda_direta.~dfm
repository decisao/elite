object formVendaDireta: TformVendaDireta
  Left = 283
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Venda direta'
  ClientHeight = 433
  ClientWidth = 626
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcDados: TPageControl
    Left = 0
    Top = 0
    Width = 626
    Height = 433
    ActivePage = tabItens
    Align = alClient
    TabOrder = 0
    OnChange = pgcDadosChange
    object tabDados: TTabSheet
      Caption = 'Dados da Saída'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 618
        Height = 49
        Align = alTop
        BevelOuter = bvLowered
        Color = clBtnHighlight
        TabOrder = 0
        object lblCLIENTE: TLabel
          Left = 6
          Top = 2
          Width = 45
          Height = 13
          Cursor = crHandPoint
          Caption = 'Cliente'
          FocusControl = dedENTRADACLI
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = lblCLIENTEClick
        end
        object DBText2: TDBText
          Left = 432
          Top = 1
          Width = 180
          Height = 42
          Alignment = taRightJustify
          DataField = 'CODIGO'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dedENTRADACLI: TDBEdit
          Left = 6
          Top = 18
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODCLIENTE'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 0
          OnEnter = dedENTRADACLIEnter
          OnExit = dedCODCLIENTEExit
        end
        object DBEdit15: TDBEdit
          Left = 83
          Top = 18
          Width = 238
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOME'
          DataSource = dataVenda.dsrClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 370
        Width = 618
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 1
        object btnContinuar1: TButton
          Left = 440
          Top = 7
          Width = 171
          Height = 25
          Cursor = crHandPoint
          Caption = '&Continuar'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnContinuar1Click
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 49
        Width = 618
        Height = 321
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 2
        object DBCtrlGrid2: TDBCtrlGrid
          Left = 1
          Top = 18
          Width = 530
          Height = 302
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          DataSource = DataSource
          PanelHeight = 100
          PanelWidth = 513
          TabOrder = 0
          RowCount = 3
          SelectedColor = clBtnShadow
          object Label5: TLabel
            Left = 10
            Top = 7
            Width = 50
            Height = 13
            Cursor = crHandPoint
            Caption = 'Técnico'
            FocusControl = dedENTRADACLI
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = Label5Click
          end
          object Label36: TLabel
            Left = 217
            Top = 8
            Width = 29
            Height = 13
            Caption = 'inicio'
          end
          object Label41: TLabel
            Left = 337
            Top = 8
            Width = 24
            Height = 13
            Caption = 'final'
          end
          object Label42: TLabel
            Left = 444
            Top = 7
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'participação'
          end
          object Label43: TLabel
            Left = 10
            Top = 47
            Width = 47
            Height = 13
            Cursor = crHandPoint
            Caption = 'Veículo'
            FocusControl = dedENTRADACLI
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = Label43Click
          end
          object Label44: TLabel
            Left = 297
            Top = 48
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'inicial'
          end
          object Label45: TLabel
            Left = 425
            Top = 48
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'final'
          end
          object DBEdit41: TDBEdit
            Left = 216
            Top = 21
            Width = 113
            Height = 21
            DataField = 'DATAINI'
            DataSource = DataSource
            TabOrder = 0
            OnEnter = dedCODCLIENTEEnter
            OnExit = dedCODCLIENTEExit
          end
          object DBEdit42: TDBEdit
            Left = 336
            Top = 21
            Width = 113
            Height = 21
            DataField = 'DATAFIM'
            DataSource = DataSource
            TabOrder = 1
            OnEnter = dedCODCLIENTEEnter
            OnExit = dedCODCLIENTEExit
          end
          object DBEdit43: TDBEdit
            Left = 456
            Top = 20
            Width = 57
            Height = 21
            DataField = 'PORCENTAGEM'
            DataSource = DataSource
            TabOrder = 2
            OnEnter = dedCODCLIENTEEnter
            OnExit = dedCODCLIENTEExit
          end
          object DBEdit47: TDBEdit
            Left = 216
            Top = 61
            Width = 113
            Height = 21
            DataField = 'KMINI'
            DataSource = DataSource
            TabOrder = 3
            OnEnter = dedCODCLIENTEEnter
            OnExit = dedCODCLIENTEExit
          end
          object DBEdit48: TDBEdit
            Left = 336
            Top = 61
            Width = 113
            Height = 21
            DataField = 'KMFIM'
            DataSource = DataSource
            TabOrder = 4
            OnEnter = dedCODCLIENTEEnter
            OnExit = dedCODCLIENTEExit
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 8
            Top = 21
            Width = 201
            Height = 21
            DataField = 'tecnico'
            DataSource = DataSource
            TabOrder = 5
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 8
            Top = 61
            Width = 201
            Height = 21
            DataField = 'veiculo'
            DataSource = DataSource
            TabOrder = 6
          end
        end
        object Panel14: TPanel
          Left = 1
          Top = 1
          Width = 616
          Height = 17
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'TÉCNICOS QUE EFETUARAM OS SERVIÇOS'
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Dock972: TDock97
          Left = 531
          Top = 18
          Width = 86
          Height = 302
          BoundLines = [blTop, blBottom, blLeft, blRight]
          Position = dpRight
          object Toolbar972: TToolbar97
            Left = 0
            Top = 0
            Caption = 'Toolbar972'
            Color = clBtnHighlight
            DockPos = 0
            FullSize = True
            TabOrder = 0
            object btnSair: TToolbarButton97
              Left = 0
              Top = 66
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Sair desta janela'
              Caption = 'Excluir'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageIndex = 5
              Images = dmoPrincipal.imgBotoes
              Layout = blGlyphTop
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnSairClick
            end
            object ToolbarSep971: TToolbarSep97
              Left = 0
              Top = 60
            end
            object btnAdicionar: TToolbarButton97
              Left = 0
              Top = 0
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Adiciona um novo registro'
              Caption = '&Adicionar'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageIndex = 0
              Images = dmoPrincipal.imgBotoes
              Layout = blGlyphTop
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnAdicionarClick
            end
          end
        end
      end
    end
    object tabItens: TTabSheet
      Caption = 'Itens'
      object Panel3: TPanel
        Left = 0
        Top = 370
        Width = 618
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object btnContinuar2: TButton
          Left = 440
          Top = 6
          Width = 171
          Height = 25
          Cursor = crHandPoint
          Caption = '&Continuar'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnContinuar2Click
        end
        object btnAnterior2: TButton
          Left = 8
          Top = 6
          Width = 91
          Height = 25
          Cursor = crHandPoint
          Caption = '&Anterior'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnAnterior2Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 276
        Width = 618
        Height = 94
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 49
          Width = 83
          Height = 13
          Caption = 'Valor Serviços'
        end
        object Label7: TLabel
          Left = 130
          Top = 49
          Width = 139
          Height = 13
          Caption = 'Condição de Pagamento'
        end
        object DBText3: TDBText
          Left = 392
          Top = 52
          Width = 222
          Height = 39
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -32
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Valor Produtos'
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 65
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_SERVICOS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit4KeyPress
        end
        object DBEdit8: TDBEdit
          Left = 130
          Top = 65
          Width = 255
          Height = 21
          DataField = 'CONDICAO'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 0
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
        object DBEdit37: TDBEdit
          Left = 8
          Top = 23
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_ITENS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit4KeyPress
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 50
        Width = 618
        Height = 45
        Align = alTop
        BevelOuter = bvLowered
        Color = clGray
        TabOrder = 2
        object lblBarras: TLabel
          Left = 9
          Top = 2
          Width = 51
          Height = 13
          Cursor = crHandPoint
          Caption = 'Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = lblBarrasClick
        end
        object Label9: TLabel
          Left = 364
          Top = 3
          Width = 62
          Height = 14
          Caption = '&Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 437
          Top = 3
          Width = 74
          Height = 14
          Caption = '&Valor unitário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 543
          Top = 3
          Width = 52
          Height = 14
          Caption = '&Desconto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 71
          Top = 2
          Width = 49
          Height = 13
          Cursor = crHandPoint
          Caption = 'Serviço'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = Label34Click
        end
        object Label37: TLabel
          Left = 62
          Top = 2
          Width = 8
          Height = 13
          Cursor = crHandPoint
          Caption = '/'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBMemo2: TDBMemo
          Left = 128
          Top = 4
          Width = 225
          Height = 35
          TabStop = False
          Color = clBtnFace
          DataField = 'DESCRICAO'
          DataSource = dataVenda.dsrItens
          TabOrder = 4
        end
        object dedBARRA: TDBEdit
          Left = 6
          Top = 17
          Width = 115
          Height = 21
          DataField = 'BARRA'
          DataSource = dataVenda.dsrItens
          TabOrder = 0
          OnEnter = dedBARRAEnter
          OnExit = dedCODCLIENTEExit
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 363
          Top = 18
          Width = 70
          Height = 21
          DataField = 'QUANTIDADE'
          DataSource = dataVenda.dsrItens
          DisplayFormat = '#,##0.00'
          NumGlyphs = 2
          TabOrder = 1
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
        object RxDBCalcEdit2: TRxDBCalcEdit
          Left = 436
          Top = 18
          Width = 102
          Height = 21
          DataField = 'VALOR_REAL'
          DataSource = dataVenda.dsrItens
          DisplayFormat = '#,##0.00'
          NumGlyphs = 2
          TabOrder = 2
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
        object RxDBCalcEdit3: TRxDBCalcEdit
          Left = 542
          Top = 18
          Width = 74
          Height = 21
          DataField = 'DESCONTO'
          DataSource = dataVenda.dsrItens
          DisplayFormat = '##0.00 '#39'%'#39
          NumGlyphs = 2
          TabOrder = 3
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
      end
      object zebdbgrid1: Tzebdbgrid
        Left = 0
        Top = 95
        Width = 618
        Height = 181
        Align = alClient
        DataSource = dataVenda.dsrItens
        Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = GridMenu
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Zebra = True
        ZebraColor = clAqua
        ZebraFontColor = clWindowText
        Columns = <
          item
            Expanded = False
            FieldName = 'BARRA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 248
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_REAL'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Width = 76
            Visible = True
          end>
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 618
        Height = 50
        Align = alTop
        BevelOuter = bvLowered
        Color = clBtnHighlight
        TabOrder = 4
        object DBText6: TDBText
          Left = 456
          Top = 7
          Width = 161
          Height = 38
          Alignment = taRightJustify
          DataField = 'CODIGO'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 3
          Width = 45
          Height = 13
          Cursor = crHandPoint
          Caption = 'Cliente'
          FocusControl = dedENTRADACLI
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = lblCLIENTEClick
        end
        object lblVendedor: TLabel
          Left = 305
          Top = 3
          Width = 62
          Height = 13
          Cursor = crHandPoint
          Caption = 'Vendedor'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          OnClick = Label35Click
        end
        object DBEdit2: TDBEdit
          Left = 67
          Top = 19
          Width = 230
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOME'
          DataSource = dataVenda.dsrClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 6
          Top = 19
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODCLIENTE'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 1
          OnEnter = dedENTRADACLIEnter
          OnExit = dedCODCLIENTEExit
        end
        object DBEdit5: TDBEdit
          Left = 305
          Top = 19
          Width = 149
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOME'
          DataSource = dataVenda.dsrVendedores
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object tabFatura: TTabSheet
      Caption = 'Faturamento'
      ImageIndex = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 618
        Height = 48
        Align = alTop
        BevelOuter = bvLowered
        Color = clBtnHighlight
        TabOrder = 0
        object Label6: TLabel
          Left = 6
          Top = 3
          Width = 45
          Height = 13
          Cursor = crArrow
          Caption = 'Cliente'
          FocusControl = DBEdit3
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 424
          Top = 1
          Width = 193
          Height = 46
          Alignment = taRightJustify
          DataField = 'CODIGO'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit3: TDBEdit
          Left = 6
          Top = 18
          Width = 69
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'CODCLIENTE'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
        object DBEdit9: TDBEdit
          Left = 86
          Top = 18
          Width = 283
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOME'
          DataSource = dataVenda.dsrClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 369
        Width = 618
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 1
        object btnAnterior3: TButton
          Left = 8
          Top = 8
          Width = 91
          Height = 25
          Cursor = crHandPoint
          Caption = '&Anterior'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnAnterior3Click
        end
        object btnFinal: TButton
          Left = 448
          Top = 8
          Width = 164
          Height = 25
          Cursor = crHandPoint
          Caption = '&Continuar depois...'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnMouseUp = btnFinalMouseUp
        end
        object ckFechar: TCheckBox
          Left = 200
          Top = 11
          Width = 193
          Height = 17
          Cursor = crHandPoint
          Caption = '&Fechar a venda e imprimir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = ckFecharClick
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 196
        Width = 618
        Height = 86
        Align = alBottom
        BevelOuter = bvLowered
        Color = clBtnHighlight
        TabOrder = 2
        object Label15: TLabel
          Left = 9
          Top = 3
          Width = 67
          Height = 13
          Caption = 'Base ICMS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 113
          Top = 3
          Width = 70
          Height = 13
          Caption = 'Valor ICMS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 217
          Top = 3
          Width = 103
          Height = 13
          Caption = 'Base ICMS Subst.'
        end
        object Label18: TLabel
          Left = 321
          Top = 3
          Width = 105
          Height = 13
          Caption = 'Valor ICMS Subst.'
        end
        object Label8: TLabel
          Left = 9
          Top = 42
          Width = 96
          Height = 13
          Caption = 'Valor Produtos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 113
          Top = 42
          Width = 63
          Height = 13
          Caption = 'Valor Frete'
        end
        object Label19: TLabel
          Left = 217
          Top = 42
          Width = 75
          Height = 13
          Caption = 'Valor Seguro'
        end
        object Label20: TLabel
          Left = 321
          Top = 42
          Width = 97
          Height = 13
          Caption = 'Outras Despesas'
        end
        object Label21: TLabel
          Left = 425
          Top = 3
          Width = 94
          Height = 13
          Caption = 'Valor Serviços'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 529
          Top = 3
          Width = 60
          Height = 13
          Caption = 'Valor ISS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 425
          Top = 42
          Width = 58
          Height = 13
          Caption = 'Valor IPI'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 529
          Top = 42
          Width = 84
          Height = 13
          Caption = 'TOTAL  NOTA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit17: TDBEdit
          Left = 8
          Top = 18
          Width = 90
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOTA_BASEICMS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit18: TDBEdit
          Left = 112
          Top = 18
          Width = 91
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_ICMS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit19: TDBEdit
          Left = 216
          Top = 18
          Width = 91
          Height = 21
          DataField = 'NOTA_BASEICMSSUBST'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 2
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit20: TDBEdit
          Left = 320
          Top = 18
          Width = 91
          Height = 21
          DataField = 'NOTA_VALORICMSSUBST'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 3
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit21: TDBEdit
          Left = 8
          Top = 57
          Width = 90
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_PRODUTOS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit22: TDBEdit
          Left = 112
          Top = 57
          Width = 91
          Height = 21
          DataField = 'NOTA_VALOR_FRETE'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 4
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit23: TDBEdit
          Left = 216
          Top = 57
          Width = 91
          Height = 21
          DataField = 'NOTA_VALOR_SEGURO'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 5
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit24: TDBEdit
          Left = 320
          Top = 57
          Width = 91
          Height = 21
          DataField = 'NOTA_VALOR_OUTROS'
          DataSource = dataVenda.dsrMovimentos
          TabOrder = 6
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit25: TDBEdit
          Left = 424
          Top = 18
          Width = 91
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_SERVICOS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit26: TDBEdit
          Left = 528
          Top = 18
          Width = 91
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_ISS'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit27: TDBEdit
          Left = 424
          Top = 57
          Width = 91
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VALOR_IPI'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
          OnKeyPress = DBEdit17KeyPress
        end
        object DBEdit28: TDBEdit
          Left = 528
          Top = 57
          Width = 91
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NOTA_VALOR_TOTAL'
          DataSource = dataVenda.dsrMovimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 48
        Width = 618
        Height = 148
        Align = alClient
        ColCount = 2
        Color = clBtnFace
        DataSource = dataVenda.dsrPagamentos
        PanelHeight = 49
        PanelWidth = 300
        ParentColor = False
        TabOrder = 3
        RowCount = 3
        SelectedColor = clBtnShadow
        object DBText4: TDBText
          Left = 9
          Top = 1
          Width = 40
          Height = 20
          DataField = 'NUMERO'
          DataSource = dataVenda.dsrPagamentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 67
          Top = 10
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 223
          Top = 9
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 150
          Top = 9
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBDateEdit1: TDBDateEdit
          Left = 9
          Top = 23
          Width = 89
          Height = 21
          DataField = 'DATAVENCIMENTO'
          DataSource = dataVenda.dsrPagamentos
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBEdit14: TDBEdit
          Left = 104
          Top = 22
          Width = 81
          Height = 21
          DataField = 'VALOR'
          DataSource = dataVenda.dsrPagamentos
          TabOrder = 1
          OnEnter = dedCODCLIENTEEnter
          OnExit = dedCODCLIENTEExit
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 192
          Top = 22
          Width = 105
          Height = 21
          DataField = 'documento'
          DataSource = dataVenda.dsrPagamentos
          TabOrder = 2
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 282
        Width = 618
        Height = 87
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 4
        object Page95Control1: TPage95Control
          Left = 1
          Top = 1
          Width = 616
          Height = 85
          ActivePage = Tab95Sheet1
          Align = alClient
          HotTrack = False
          TabInactiveFont.Charset = DEFAULT_CHARSET
          TabInactiveFont.Color = clWindowText
          TabInactiveFont.Height = -11
          TabInactiveFont.Name = 'MS Sans Serif'
          TabInactiveFont.Style = []
          MultiLine = True
          TabOrder = 0
          TextRotation = trVertical
          VerticalTabs = True
          object Tab95Sheet1: TTab95Sheet
            Caption = 'Observações'
            GripAlign = gaLeft
            ImageIndex = -1
            StaticPageIndex = -1
            TabVisible = True
            object Label33: TLabel
              Left = 8
              Top = -3
              Width = 74
              Height = 13
              Caption = 'Observações'
            end
            object DBText5: TDBText
              Left = 328
              Top = 1
              Width = 247
              Height = 48
              Alignment = taRightJustify
              DataField = 'VALOR_TOTAL'
              DataSource = dataVenda.dsrMovimentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -43
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBMemo3: TDBMemo
              Tag = 4
              Left = 8
              Top = 12
              Width = 233
              Height = 59
              DataField = 'OBSERVACOES'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 0
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object ckICMSSIMP: TDBCheckBox
              Left = 246
              Top = 29
              Width = 89
              Height = 17
              Caption = 'ICMS Simples'
              DataField = 'ICMSSIMPLES'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object edtICMSSIMP: TDBEdit
              Left = 246
              Top = 49
              Width = 89
              Height = 21
              DataField = 'ICMSSIMPALIQ'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 2
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
          end
          object Tab95Sheet2: TTab95Sheet
            Caption = 'Transportador'
            GripAlign = gaLeft
            ImageIndex = -1
            StaticPageIndex = -1
            TabVisible = True
            object lblTransportador: TLabel
              Left = 4
              Top = -3
              Width = 94
              Height = 13
              Cursor = crHandPoint
              Caption = 'Transportador'
              FocusControl = DBEdit13
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblTransportadorClick
            end
            object Label25: TLabel
              Left = 465
              Top = -1
              Width = 75
              Height = 13
              Caption = 'Placa Veiculo'
            end
            object Label26: TLabel
              Left = 545
              Top = -1
              Width = 14
              Height = 13
              Caption = 'UF'
            end
            object Label27: TLabel
              Left = 4
              Top = 36
              Width = 65
              Height = 13
              Caption = 'Quantidade'
            end
            object Label28: TLabel
              Left = 76
              Top = 36
              Width = 43
              Height = 13
              Caption = 'Espécie'
            end
            object Label29: TLabel
              Left = 212
              Top = 36
              Width = 34
              Height = 13
              Caption = 'Marca'
            end
            object Label30: TLabel
              Left = 300
              Top = 36
              Width = 45
              Height = 13
              Caption = 'Número'
            end
            object Label31: TLabel
              Left = 412
              Top = 36
              Width = 62
              Height = 13
              Caption = 'Peso Bruto'
            end
            object Label32: TLabel
              Left = 499
              Top = 36
              Width = 71
              Height = 13
              Caption = 'Peso Liquido'
            end
            object DBEdit13: TDBEdit
              Left = 4
              Top = 13
              Width = 63
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOTA_CODTRANSPORTADOR'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 0
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit16: TDBEdit
              Left = 76
              Top = 13
              Width = 255
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dataVenda.dsrTransportador
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 343
              Top = -3
              Width = 114
              Height = 39
              Caption = ' Frete por conta do '
              Columns = 2
              DataField = 'NOTA_FRETE'
              DataSource = dataVenda.dsrMovimentos
              Items.Strings = (
                'Emit.'
                'Dest.')
              TabOrder = 1
              Values.Strings = (
                '1'
                '2')
            end
            object DBEdit29: TDBEdit
              Left = 465
              Top = 14
              Width = 74
              Height = 22
              CharCase = ecUpperCase
              DataField = 'NOTA_PLACAVEICULO'
              DataSource = dataVenda.dsrMovimentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit30: TDBEdit
              Left = 545
              Top = 14
              Width = 32
              Height = 22
              CharCase = ecUpperCase
              DataField = 'NOTA_UFVEICULO'
              DataSource = dataVenda.dsrMovimentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit31: TDBEdit
              Left = 3
              Top = 50
              Width = 64
              Height = 21
              DataField = 'NOTA_QUANTIDADE'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 4
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit32: TDBEdit
              Left = 75
              Top = 50
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOTA_ESPECIE'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 5
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit33: TDBEdit
              Left = 211
              Top = 50
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOTA_MARCA'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 6
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit34: TDBEdit
              Left = 299
              Top = 50
              Width = 104
              Height = 21
              DataField = 'NOTA_NUMERO'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 7
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit35: TDBEdit
              Left = 411
              Top = 50
              Width = 80
              Height = 21
              DataField = 'NOTA_PESOBRUTO'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 8
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
            object DBEdit36: TDBEdit
              Left = 498
              Top = 50
              Width = 80
              Height = 21
              DataField = 'NOTA_PESOLIQUIDO'
              DataSource = dataVenda.dsrMovimentos
              TabOrder = 9
              OnEnter = dedCODCLIENTEEnter
              OnExit = dedCODCLIENTEExit
            end
          end
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 328
    Top = 136
    object actClientes: TAction
      Caption = 'actClientes'
      ShortCut = 16451
      OnExecute = lblCLIENTEClick
    end
    object actVendedores: TAction
      Caption = 'actVendedores'
      ShortCut = 16470
      OnExecute = lblVendedorClick
    end
    object actBarras: TAction
      Caption = 'actBarras'
      ShortCut = 16450
      OnExecute = lblBarrasClick
    end
    object actNovoProduto: TAction
      Caption = 'actNovoProduto'
      ShortCut = 113
      OnExecute = actNovoProdutoExecute
    end
    object actGravaProduto: TAction
      ShortCut = 120
      OnExecute = actGravaProdutoExecute
    end
    object actCancelaProduto: TAction
      Caption = 'actCancelaProduto'
      ShortCut = 27
    end
    object actNatuoper: TAction
      Caption = 'actNatuoper'
      ShortCut = 32846
      OnExecute = lblNatuoperClick
    end
    object actTranportador: TAction
      Caption = 'actTranportador'
      ShortCut = 32852
      OnExecute = lblTransportadorClick
    end
  end
  object GridMenu: TPopupMenu
    Left = 439
    Top = 257
    object CancelarItem1: TMenuItem
      Caption = '&Cancelar Item'
      OnClick = CancelarItem1Click
    end
  end
  object DataSource: TDataSource
    DataSet = dataVenda.qryOS_VENDER
    Left = 357
    Top = 288
  end
  object traHistorico: TIBTransaction
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
    Left = 49
    Top = 97
  end
  object qryHistorico: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traHistorico
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dataVenda.dsrMovimentos
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  HISTORICO(:CODCLIENTE, :CODEMPRESA)')
    Left = 49
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
