object formITindividuais: TformITindividuais
  Left = 262
  Top = 138
  Width = 477
  Height = 420
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Individuos'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
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
    Width = 469
    Height = 393
    ActivePage = tabDetalhe
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 461
        Height = 365
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 459
          Height = 46
          BoundLines = [blTop, blLeft, blRight]
          object ToolWindow971: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 444
            DockPos = 0
            TabOrder = 0
            object Label1: TLabel
              Left = 4
              Top = 1
              Width = 41
              Height = 13
              Caption = '&Campo'
              Transparent = True
            end
            object Label2: TLabel
              Left = 135
              Top = 1
              Width = 78
              Height = 13
              Caption = '&Pesquisar por'
              Transparent = True
            end
            object cmbOrdenar: TComboBox
              Tag = 1
              Left = 3
              Top = 16
              Width = 118
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbOrdenarChange
            end
            object edtPesquisar: TEdit
              Left = 134
              Top = 16
              Width = 283
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnChange = edtPesquisarChange
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = edtPesquisarKeyPress
            end
          end
        end
        object Dock972: TDock97
          Left = 374
          Top = 47
          Width = 86
          Height = 317
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
              Top = 126
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Sair desta janela'
              Caption = '&Saída'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageIndex = 6
              Images = dmoPrincipal.imgBotoes
              Layout = blGlyphTop
              ModalResult = 1
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnMouseEnter = btnModificarMouseEnter
              OnMouseExit = btnModificarMouseExit
            end
            object ToolbarSep971: TToolbarSep97
              Left = 0
              Top = 120
            end
            object btnImprimir: TToolbarButton97
              Left = 0
              Top = 60
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Opções de Impressão'
              Caption = '&Impressão'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageIndex = 2
              Images = dmoPrincipal.imgBotoes
              Layout = blGlyphTop
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnImprimirClick
              OnMouseEnter = btnModificarMouseEnter
              OnMouseExit = btnModificarMouseExit
            end
            object btnModificar: TToolbarButton97
              Left = 0
              Top = 0
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Modifica os dados do registro selecionado'
              Caption = '&Detalhes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ImageIndex = 1
              Images = dmoPrincipal.imgBotoes
              Layout = blGlyphTop
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btnModificarClick
              OnMouseEnter = btnModificarMouseEnter
              OnMouseExit = btnModificarMouseExit
            end
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 47
          Width = 373
          Height = 317
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 373
            Height = 13
            Align = alTop
            Caption = 'lblWhere'
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Visible = False
          end
          object grdDados: Tzebdbgrid
            Tag = 1
            Left = 0
            Top = 13
            Width = 373
            Height = 304
            Align = alClient
            DataSource = dscSelecionar
            PopupMenu = GridMenu
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            Zebra = True
            ZebraColor = clAqua
            ZebraFontColor = clWindowText
            OnDblClick = grdDadosDblClick
          end
          object ckAutoInc: TCheckBox
            Left = 256
            Top = 256
            Width = 97
            Height = 17
            Caption = 'ckAutoInc'
            TabOrder = 1
            Visible = False
          end
        end
      end
    end
    object tabDetalhe: TTabSheet
      Tag = 1
      Caption = '&Detalhes'
      object Dock975: TDock97
        Left = 375
        Top = 0
        Width = 86
        Height = 365
        BoundLines = [blTop, blBottom, blLeft, blRight]
        Position = dpRight
        object Toolbar971: TToolbar97
          Left = 0
          Top = 0
          Caption = 'Toolbar972'
          Color = clBtnHighlight
          DockPos = 0
          FullSize = True
          TabOrder = 0
          object btnSalvar: TToolbarButton97
            Left = 0
            Top = 0
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = 'Sal&var'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageIndex = 3
            Images = dmoPrincipal.imgBotoes
            Layout = blGlyphTop
            Opaque = False
            ParentFont = False
            OnClick = btnSalvarClick
            OnMouseEnter = btnModificarMouseEnter
            OnMouseExit = btnModificarMouseExit
          end
          object btnCancelar: TToolbarButton97
            Left = 0
            Top = 60
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Cancelar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageIndex = 4
            Images = dmoPrincipal.imgBotoes
            Layout = blGlyphTop
            Opaque = False
            ParentFont = False
            OnClick = btnCancelarClick
            OnMouseEnter = btnModificarMouseEnter
            OnMouseExit = btnModificarMouseExit
          end
        end
      end
      object panDados: TPanel
        Left = 0
        Top = 0
        Width = 375
        Height = 365
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Label24: TLabel
          Left = 8
          Top = 80
          Width = 45
          Height = 13
          Caption = 'Número'
        end
        object Label25: TLabel
          Left = 94
          Top = 80
          Width = 80
          Height = 13
          Caption = 'Complemento'
        end
        object dbnDetalhes: TDBNavigator
          Left = 8
          Top = 320
          Width = 240
          Height = 25
          DataSource = dsrDetalhes
          TabOrder = 0
          Visible = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 373
          Height = 184
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblCLIENTE: TLabel
            Left = 8
            Top = 8
            Width = 44
            Height = 13
            Cursor = crHandPoint
            Caption = 'Produto'
            FocusControl = dedCODPRODUTO
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 263
            Top = 48
            Width = 24
            Height = 13
            Caption = 'Foto'
            FocusControl = DBImage1
          end
          object Label4: TLabel
            Left = 8
            Top = 96
            Width = 105
            Height = 13
            Caption = 'Série / ESN / IMEI'
            FocusControl = DBEdit1
          end
          object Label19: TLabel
            Left = 80
            Top = 48
            Width = 100
            Height = 13
            Caption = 'Código de Barras'
            FocusControl = DBEdit17
          end
          object Label23: TLabel
            Left = 8
            Top = 136
            Width = 76
            Height = 13
            Caption = 'Chip / ICCID'
            FocusControl = DBEdit21
          end
          object dedCODPRODUTO: TDBEdit
            Left = 8
            Top = 24
            Width = 65
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clBtnFace
            DataField = 'CODPRODUTO'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit15: TDBEdit
            Left = 80
            Top = 24
            Width = 281
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
          object DBImage1: TDBImage
            Left = 262
            Top = 63
            Width = 99
            Height = 79
            DataField = 'FOTO'
            DataSource = dsrProduto
            Stretch = True
            TabOrder = 2
            TabStop = False
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 112
            Width = 225
            Height = 21
            DataField = 'SERIE'
            DataSource = dsrDetalhes
            TabOrder = 3
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit17: TDBEdit
            Left = 80
            Top = 64
            Width = 153
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'BARRA'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit21: TDBEdit
            Left = 8
            Top = 152
            Width = 225
            Height = 21
            DataField = 'SERIE2'
            DataSource = dsrDetalhes
            TabOrder = 5
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
        end
        object PageControl1: TPageControl
          Left = 1
          Top = 185
          Width = 373
          Height = 179
          ActivePage = TabSheet4
          Align = alClient
          TabOrder = 2
          object TabSheet1: TTabSheet
            Caption = '&Compra'
            object Label5: TLabel
              Left = 8
              Top = 8
              Width = 64
              Height = 13
              Caption = 'Fornecedor'
              FocusControl = DBEdit2
            end
            object Label7: TLabel
              Left = 8
              Top = 50
              Width = 98
              Height = 13
              Caption = 'Valor de Compra'
              FocusControl = DBEdit4
            end
            object Label8: TLabel
              Left = 192
              Top = 50
              Width = 31
              Height = 13
              Caption = 'ICMS'
              FocusControl = DBEdit5
            end
            object Label9: TLabel
              Left = 264
              Top = 50
              Width = 83
              Height = 13
              Caption = 'Valor do ICMS'
              FocusControl = DBEdit6
            end
            object DBText1: TDBText
              Left = 184
              Top = 1
              Width = 169
              Height = 17
              Alignment = taRightJustify
              DataField = 'DATA'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 96
              Top = 50
              Width = 65
              Height = 13
              Caption = 'Quantidade'
              FocusControl = DBEdit14
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 24
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'CODCLIENTE'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 96
              Top = 24
              Width = 260
              Height = 21
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 66
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'PRECO'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 192
              Top = 66
              Width = 64
              Height = 21
              Color = clBtnFace
              DataField = 'ICMSCOMPRA'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 264
              Top = 66
              Width = 90
              Height = 21
              Color = clBtnFace
              DataField = 'VALOR_ICMSCOMPRA'
              DataSource = dsrCompra
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit14: TDBEdit
              Left = 96
              Top = 66
              Width = 89
              Height = 21
              Color = clBtnFace
              DataField = 'QUANTIDADE'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
          object TabSheet2: TTabSheet
            Caption = '&Venda'
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 40
              Height = 13
              Caption = 'Cliente'
              FocusControl = DBEdit7
            end
            object Label11: TLabel
              Left = 8
              Top = 50
              Width = 72
              Height = 13
              Caption = 'Valor Tabela'
              FocusControl = DBEdit9
            end
            object Label12: TLabel
              Left = 104
              Top = 50
              Width = 53
              Height = 13
              Caption = 'Desconto'
              FocusControl = DBEdit10
            end
            object Label13: TLabel
              Left = 242
              Top = 50
              Width = 62
              Height = 13
              Caption = 'Valor Pago'
              FocusControl = DBEdit11
            end
            object Label14: TLabel
              Left = 8
              Top = 92
              Width = 31
              Height = 13
              Caption = 'ICMS'
              FocusControl = DBEdit12
            end
            object Label15: TLabel
              Left = 104
              Top = 92
              Width = 83
              Height = 13
              Caption = 'Valor do ICMS'
              FocusControl = DBEdit13
            end
            object DBText2: TDBText
              Left = 180
              Top = 1
              Width = 169
              Height = 17
              Alignment = taRightJustify
              DataField = 'DATA'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 184
              Top = 50
              Width = 38
              Height = 13
              Caption = 'Quant.'
              FocusControl = DBEdit16
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 24
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'CODCLIENTE'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit8: TDBEdit
              Left = 104
              Top = 24
              Width = 244
              Height = 21
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit9: TDBEdit
              Left = 8
              Top = 66
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'VALOR_VENDA'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit10: TDBEdit
              Left = 104
              Top = 66
              Width = 73
              Height = 21
              Color = clBtnFace
              DataField = 'DESCONTO'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit11: TDBEdit
              Left = 242
              Top = 66
              Width = 105
              Height = 21
              Color = clBtnFace
              DataField = 'VALOR_PAGO'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit12: TDBEdit
              Left = 8
              Top = 108
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'ICMSVENDA'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit13: TDBEdit
              Left = 104
              Top = 108
              Width = 81
              Height = 21
              Color = clBtnFace
              DataField = 'VALOR_ICMS'
              DataSource = dsrVenda
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 194
              Top = 94
              Width = 153
              Height = 41
              Caption = ' Situação '
              Columns = 2
              DataField = 'VENDIDO'
              DataSource = dsrVenda
              Items.Strings = (
                'Vendido'
                'Devolvido')
              ReadOnly = True
              TabOrder = 7
              Values.Strings = (
                'S'
                'N')
            end
            object DBEdit16: TDBEdit
              Left = 184
              Top = 66
              Width = 49
              Height = 21
              Color = clBtnFace
              DataField = 'QUANTIDADE'
              DataSource = dsrVenda
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
          object TabSheet4: TTabSheet
            Caption = 'Telecom'
            ImageIndex = 3
            object Label20: TLabel
              Left = 8
              Top = 8
              Width = 116
              Height = 13
              Caption = 'Número de Ativação'
              FocusControl = DBEdit18
            end
            object Label21: TLabel
              Left = 8
              Top = 48
              Width = 69
              Height = 13
              Cursor = crHandPoint
              Caption = 'Operadora'
              FocusControl = DBEdit19
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label21Click
            end
            object Label22: TLabel
              Left = 8
              Top = 88
              Width = 109
              Height = 13
              Cursor = crHandPoint
              Caption = 'Plano de Serviço'
              FocusControl = DBEdit20
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label22Click
            end
            object DBEdit18: TDBEdit
              Left = 8
              Top = 24
              Width = 137
              Height = 21
              DataField = 'NUMERO_FONE'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit19: TDBEdit
              Left = 8
              Top = 64
              Width = 345
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrOperadora
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit20: TDBEdit
              Left = 8
              Top = 104
              Width = 345
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrPlano
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet3: TTabSheet
            Caption = '&Estatística'
            ImageIndex = 2
            object lbTempo: TLabel
              Left = 12
              Top = 22
              Width = 333
              Height = 31
              AutoSize = False
              Caption = 'lbTempo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object lbICMS: TLabel
              Left = 12
              Top = 70
              Width = 333
              Height = 35
              AutoSize = False
              Caption = 'lbICMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label10: TLabel
              Left = 10
              Top = 4
              Width = 187
              Height = 13
              Caption = 'T E M P O    N O    E S T O Q U E'
            end
            object Bevel1: TBevel
              Left = 8
              Top = 18
              Width = 345
              Height = 7
              Shape = bsTopLine
            end
            object Label16: TLabel
              Left = 10
              Top = 52
              Width = 90
              Height = 13
              Caption = 'I M P O S T O S'
            end
            object Bevel2: TBevel
              Left = 8
              Top = 66
              Width = 345
              Height = 7
              Shape = bsTopLine
            end
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 420
    MinMaxInfo.MinTrackWidth = 477
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor'
      'ckAutoInc.Checked')
    StoredValues = <>
    Left = 28
    Top = 297
  end
  object PrinterMenu: TPopupMenu
    Left = 28
    Top = 201
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 252
    Top = 113
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 252
    Top = 177
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 452
    Top = 353
    object Ativarzebra1: TMenuItem
      Caption = '&Ativar zebra'
      OnClick = Ativarzebra1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cordalinha1: TMenuItem
      Caption = 'Cor da li&nha'
      OnClick = Cordalinha1Click
    end
    object Cordotexto1: TMenuItem
      Caption = 'Cor do t&exto'
      OnClick = Cordotexto1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object menuAutoInc: TMenuItem
      Caption = '&Avanço automático'
      OnClick = menuAutoIncClick
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 28
    Top = 249
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterInsert = qryDetalhesAfterInsert
    AfterOpen = qryDetalhesAfterOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM INDIVIDUAIS'
      'WHERE (CODIGO = :CODIGO)')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 324
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update INDIVIDUAIS'
      'set'
      '  SERIE = :SERIE,'
      '  SERIE2 = :SERIE2,  '
      '  NUMERO_FONE = :NUMERO_FONE,'
      '  CODOPERADORA = :CODOPERADORA,'
      '  CODPLANO = :CODPLANO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into INDIVIDUAIS'
      
        '  (CODIGO, CODITEM, CODPRODUTO, CODMOVENTRADA, SEQUENCIA, BARRA,' +
        ' '
      'SERIE, '
      '   VENDIDO, CODMOVSAIDA, VALOR_VENDA, ICMSVENDA, DESCONTO, '
      'VALOR_PAGO, '
      '   VALOR_ICMS, IMPETIQ)'
      'values'
      '  (:CODIGO, :CODITEM, :CODPRODUTO, :CODMOVENTRADA, :SEQUENCIA, '
      ':BARRA, '
      '   :SERIE, :VENDIDO, :CODMOVSAIDA, :VALOR_VENDA, :ICMSVENDA, '
      ':DESCONTO, '
      '   :VALOR_PAGO, :VALOR_ICMS, :IMPETIQ)')
    DeleteSQL.Strings = (
      'delete from INDIVIDUAIS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 388
    Top = 225
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 324
    Top = 177
  end
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO ,  FOTO'
      'FROM PRODUTOS'
      'WHERE '
      ' ( CODIGO = :CODIGO )'
      '')
    UniDirectional = True
    Left = 168
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrProduto: TDataSource
    AutoEdit = False
    DataSet = qryProduto
    Left = 168
    Top = 296
  end
  object qryCompra: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCompra
    AfterOpen = qryCompraAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  MOVIMENTOS.CODCLIENTE,'
      '  MOVIMENTOS.DATA,'
      '  CLIENTES.NOME,'
      '  (TEMPITENS.VALOR_UNITARIO - TEMPITENS.DESCONTO) AS PRECO,'
      '  TEMPITENS.ICMSCOMPRA,'
      '  TEMPITENS.VALOR_ICMSCOMPRA'
      'FROM'
      '  MOVIMENTOS,'
      '  CLIENTES,'
      '  TEMPITENS,'
      '  INDIVIDUAIS'
      'WHERE'
      '  (INDIVIDUAIS.CODIGO = :CODIGO) AND'
      '  (INDIVIDUAIS.CODITEM = TEMPITENS.CODIGO ) AND'
      '  (INDIVIDUAIS.CODPRODUTO = TEMPITENS.CODPRODUTO ) AND'
      '  (INDIVIDUAIS.CODMOVENTRADA = TEMPITENS.CODMOVIMENTO ) AND'
      '  (TEMPITENS.CODMOVIMENTO = MOVIMENTOS.CODIGO) AND'
      '  (MOVIMENTOS.CODCLIENTE = CLIENTES.CODIGO)'
      ' ')
    UniDirectional = True
    Left = 521
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrCompra: TDataSource
    AutoEdit = False
    DataSet = qryCompra
    Left = 521
    Top = 171
  end
  object qryVenda: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traVenda
    AfterOpen = qryVendaAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  ID.CODPRODUTO,'
      '  CL.NOME,'
      '  ID.VENDIDO,'
      '  ID.QUANTIDADE,'
      '  ID.VALOR_PAGO,'
      '  ID.VALOR_ICMS,'
      '  ID.VALOR_VENDA,'
      '  ID.DESCONTO,'
      '  ID.ICMSVENDA,'
      '  MV.CODCLIENTE,'
      '  MV.DATA'
      'FROM'
      '  INDIVIDUAIS ID,'
      '  MOVIMENTOS MV,'
      '  CLIENTES CL'
      'WHERE'
      '  ID.CODMOVSAIDA = MV.CODIGO AND'
      '  MV.CODCLIENTE  = CL.CODIGO AND'
      '  ID.CODIGO = :CODIGO'
      ' ')
    UniDirectional = True
    Left = 593
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrVenda: TDataSource
    AutoEdit = False
    DataSet = qryVenda
    Left = 593
    Top = 171
  end
  object traSelecionar: TIBTransaction
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
    Left = 249
    Top = 61
  end
  object traDetalhes: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 321
    Top = 61
  end
  object traCompra: TIBTransaction
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
    Left = 529
    Top = 45
  end
  object traVenda: TIBTransaction
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
    Left = 585
    Top = 61
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
    Left = 241
    Top = 181
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
    Left = 216
    Top = 208
  end
  object qryOperadora: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOperadora
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  OPERADORAS'
      'WHERE'
      '  CODIGO = :CODOPERADORA')
    UniDirectional = True
    Left = 216
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODOPERADORA'
        ParamType = ptUnknown
      end>
  end
  object dsrOperadora: TDataSource
    DataSet = qryOperadora
    Left = 216
    Top = 304
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
    Left = 296
    Top = 208
  end
  object qryPlano: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traPlano
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  PLANOS'
      'WHERE'
      '  CODIGO = :CODPLANO AND'
      '  CODOPERADORA = :CODOPERADORA')
    UniDirectional = True
    Left = 296
    Top = 256
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
  object dsrPlano: TDataSource
    DataSet = qryPlano
    Left = 296
    Top = 304
  end
end
