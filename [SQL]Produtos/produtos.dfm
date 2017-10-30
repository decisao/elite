object formProdutos: TformProdutos
  Left = 332
  Top = 166
  Width = 555
  Height = 417
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Produtos'
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
    Width = 547
    Height = 383
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 539
        Height = 355
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 537
          Height = 46
          BoundLines = [blTop, blLeft, blRight]
          object ToolWindow971: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 522
            DockPos = 0
            FullSize = True
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
        object Dock973: TDock97
          Left = 1
          Top = 308
          Width = 537
          Height = 46
          BoundLines = [blBottom, blLeft, blRight]
          Position = dpBottom
          object ToolWindow972: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 522
            DockPos = 0
            FullSize = True
            TabOrder = 0
            object Label3: TLabel
              Left = 4
              Top = 1
              Width = 83
              Height = 13
              Caption = 'S&elecionar por'
              Transparent = True
            end
            object Label4: TLabel
              Left = 135
              Top = 1
              Width = 162
              Height = 13
              Caption = '&Que satisfaçam a expressão'
              Transparent = True
            end
            object cmbSelecionar: TComboBox
              Tag = 1
              Left = 3
              Top = 16
              Width = 118
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbSelecionarChange
            end
            object edtSelecionar: TEdit
              Left = 134
              Top = 16
              Width = 283
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = edtSelecionarKeyPress
            end
            object cbOcultos: TCheckBox
              Left = 334
              Top = -1
              Width = 83
              Height = 17
              Cursor = crHandPoint
              Caption = 'ver ocultos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = cbOcultosClick
            end
          end
        end
        object Dock972: TDock97
          Left = 452
          Top = 47
          Width = 86
          Height = 261
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
              Top = 186
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
              OnMouseEnter = btnAdicionarMouseEnter
              OnMouseExit = btnAdicionarMouseExit
            end
            object ToolbarSep971: TToolbarSep97
              Left = 0
              Top = 180
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
              OnMouseEnter = btnAdicionarMouseEnter
              OnMouseExit = btnAdicionarMouseExit
            end
            object btnImprimir: TToolbarButton97
              Left = 0
              Top = 120
              Width = 80
              Height = 60
              Cursor = crHandPoint
              Hint = 'Opções de Impressão'
              DropdownMenu = PrinterMenu
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
              OnMouseEnter = btnAdicionarMouseEnter
              OnMouseExit = btnAdicionarMouseExit
            end
            object btnModificar: TToolbarButton97
              Left = 0
              Top = 60
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
              OnMouseEnter = btnAdicionarMouseEnter
              OnMouseExit = btnAdicionarMouseExit
            end
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 47
          Width = 451
          Height = 261
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 451
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
            Width = 451
            Height = 220
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
          object Dock974: TDock97
            Left = 0
            Top = 233
            Width = 451
            Height = 28
            BoundLines = [blTop, blBottom, blLeft, blRight]
            Color = clInfoBk
            Position = dpBottom
            object Toolbar973: TToolbar97
              Left = 0
              Top = 0
              Caption = 'Toolbar973'
              Color = clInfoBk
              CloseButton = False
              DockPos = 0
              FullSize = True
              TabOrder = 0
              object btnVender: TToolbarButton97
                Left = 185
                Top = 0
                Width = 80
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Vender'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                Visible = False
                OnClick = btnVenderClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnArquivos: TToolbarButton97
                Left = 0
                Top = 0
                Width = 89
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Arquivos'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = lblArquivosClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnEmail: TToolbarButton97
                Left = 265
                Top = 0
                Width = 81
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                DropdownMenu = MenuMais
                Caption = 'ver mais'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Layout = blGlyphRight
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object ToolbarButton971: TToolbarButton97
                Left = 89
                Top = 0
                Width = 96
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Reajustes'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = lblREAJUSTEClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
            end
          end
        end
      end
    end
    object tabDetalhe: TTabSheet
      Tag = 1
      Caption = '&Detalhes'
      object Dock975: TDock97
        Left = 453
        Top = 0
        Width = 86
        Height = 355
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
          object ToolbarSep972: TToolbarSep97
            Left = 0
            Top = 120
          end
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
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
          end
          object btnExcluir: TToolbarButton97
            Left = 0
            Top = 126
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Excluir'
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
            OnClick = btnExcluirClick
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
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
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
          end
        end
      end
      object panDados: TPanel
        Left = 0
        Top = 0
        Width = 453
        Height = 355
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
          Width = 451
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            Left = 8
            Top = 3
            Width = 40
            Height = 13
            Caption = 'Código'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 80
            Top = 3
            Width = 44
            Height = 13
            Caption = 'Produto'
            FocusControl = dedNOME
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 19
            Width = 64
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'CODIGO'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dedNOME: TDBEdit
            Left = 80
            Top = 19
            Width = 265
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = dsrDetalhes
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
        end
        object pgcDetalhes: TPageControl
          Left = 1
          Top = 57
          Width = 451
          Height = 297
          ActivePage = tabPessoaFisica
          Align = alClient
          TabOrder = 2
          object tabPessoaFisica: TTabSheet
            Caption = '&Produto'
            object lblUNIDADE: TLabel
              Left = 8
              Top = 0
              Width = 125
              Height = 13
              Cursor = crHandPoint
              Caption = 'Unidade de medida'
              FocusControl = DBEdit14
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblUNIDADEClick
            end
            object lblGRUPO: TLabel
              Left = 152
              Top = 0
              Width = 39
              Height = 13
              Cursor = crHandPoint
              Caption = 'Grupo'
              FocusControl = DBEdit13
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblGRUPOClick
            end
            object lbPrecoCusto: TLabel
              Left = 8
              Top = 48
              Width = 69
              Height = 13
              Caption = 'Preço Custo'
              FocusControl = dedPrecoCusto
            end
            object lbMargem: TLabel
              Left = 126
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Margem lucro'
              FocusControl = dedMargem
            end
            object Label7: TLabel
              Left = 238
              Top = 48
              Width = 72
              Height = 13
              Caption = 'Preço Venda'
              FocusControl = DBEdit3
            end
            object Label8: TLabel
              Left = 8
              Top = 144
              Width = 31
              Height = 13
              Caption = 'ICMS'
              FocusControl = DBEdit4
            end
            object Label9: TLabel
              Left = 102
              Top = 144
              Width = 49
              Height = 13
              Caption = 'Volumes'
              FocusControl = DBEdit5
            end
            object Label10: TLabel
              Left = 166
              Top = 144
              Width = 40
              Height = 13
              Caption = 'Mínimo'
              FocusControl = DBEdit6
            end
            object Label11: TLabel
              Left = 288
              Top = 192
              Width = 45
              Height = 13
              Caption = 'Estoque'
              FocusControl = DBEdit7
            end
            object Label12: TLabel
              Left = 8
              Top = 192
              Width = 68
              Height = 13
              Caption = 'Cód. barras'
              FocusControl = dedBARRA
            end
            object Label14: TLabel
              Left = 8
              Top = 96
              Width = 130
              Height = 13
              Cursor = crHandPoint
              Caption = 'Serviço relacionado'
              FocusControl = DBEdit2
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label14Click
            end
            object Label16: TLabel
              Left = 138
              Top = 192
              Width = 65
              Height = 13
              Caption = 'Localização'
              FocusControl = DBEdit8
            end
            object Label17: TLabel
              Left = 238
              Top = 144
              Width = 104
              Height = 13
              Caption = '+Valor do Serviço'
              FocusControl = DBEdit9
            end
            object DBEdit14: TDBEdit
              Left = 8
              Top = 16
              Width = 25
              Height = 21
              CharCase = ecUpperCase
              DataField = 'UNIDADE'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit13: TDBEdit
              Left = 152
              Top = 16
              Width = 41
              Height = 21
              DataField = 'GRUPO'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object dedPrecoCusto: TDBEdit
              Left = 8
              Top = 64
              Width = 105
              Height = 21
              DataField = 'PRECOCUSTO'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = dedPrecoCustoKeyPress
            end
            object dedMargem: TDBEdit
              Left = 126
              Top = 64
              Width = 99
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'MARGEM'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnExit = edtPesquisarExit
            end
            object DBEdit3: TDBEdit
              Left = 238
              Top = 64
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRECOVENDA'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 160
              Width = 81
              Height = 21
              DataField = 'ICMS'
              DataSource = dsrDetalhes
              TabOrder = 6
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit4KeyPress
            end
            object ckEtiqueta: TDBCheckBox
              Left = 8
              Top = 240
              Width = 129
              Height = 17
              Caption = 'Imprimir etiquetas'
              DataField = 'ETIQUETA'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = ckEtiquetaClick
            end
            object DBEdit5: TDBEdit
              Left = 102
              Top = 160
              Width = 51
              Height = 21
              DataField = 'NUMETIQ'
              DataSource = dsrDetalhes
              TabOrder = 7
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object ckIndividual: TDBCheckBox
              Tag = 2
              Left = 200
              Top = 240
              Width = 145
              Height = 17
              Caption = 'Numeração individual'
              DataField = 'INDIVIDUAL'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = ckIndividualClick
            end
            object DBEdit6: TDBEdit
              Left = 166
              Top = 160
              Width = 59
              Height = 21
              DataField = 'MINIMO'
              DataSource = dsrDetalhes
              TabOrder = 8
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit7: TDBEdit
              Left = 288
              Top = 208
              Width = 57
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'LOCAL'
              DataSource = dscSelecionar
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
            end
            object dedBARRA: TDBEdit
              Left = 8
              Top = 208
              Width = 121
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
              TabOrder = 10
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 112
              Width = 57
              Height = 21
              DataField = 'CODSERVICO'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit8: TDBEdit
              Left = 138
              Top = 208
              Width = 139
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LOCALIZACAO'
              DataSource = dsrDetalhes
              TabOrder = 11
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit9: TDBEdit
              Left = 238
              Top = 160
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRECOSERVICO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit10: TDBEdit
              Left = 40
              Top = 16
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'UNIDADE'
              DataSource = dmoProdutos.dsrUnidade
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
            end
            object DBEdit11: TDBEdit
              Left = 200
              Top = 16
              Width = 145
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'GRUPO'
              DataSource = dmoProdutos.dsrGrupo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 16
            end
            object DBEdit12: TDBEdit
              Left = 72
              Top = 112
              Width = 273
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoProdutos.dsrServicos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
            end
          end
          object TabSheet1: TTabSheet
            Caption = '&Estoque'
            ImageIndex = 3
            object zebdbgrid1: Tzebdbgrid
              Left = 0
              Top = 0
              Width = 443
              Height = 276
              Align = alClient
              DataSource = dmoProdutos.dsrEstoque
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Verdana'
              TitleFont.Style = []
              ZebraColor = clAqua
              ZebraFontColor = clWindowText
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Title.Caption = 'Empresa'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Verdana'
                  Title.Font.Style = [fsBold]
                  Width = 236
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANTIDADE'
                  Title.Caption = 'Disponível'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Verdana'
                  Title.Font.Style = [fsBold]
                  Width = 74
                  Visible = True
                end>
            end
          end
          object tabEndereco: TTabSheet
            Caption = 'I&magem'
            object DBImage1: TDBImage
              Tag = 2
              Left = 0
              Top = 17
              Width = 443
              Height = 259
              Align = alClient
              DataField = 'FOTO'
              PopupMenu = FotoMenu
              TabOrder = 0
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 443
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object ckStretch: TCheckBox
                Left = 0
                Top = 0
                Width = 121
                Height = 17
                Caption = 'Ajustar tamanho'
                TabOrder = 0
                OnClick = ckStretchClick
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = '&Comportamento'
            ImageIndex = 4
            object DBRadioGroup1: TDBRadioGroup
              Left = 8
              Top = 192
              Width = 377
              Height = 49
              Caption = '     '
              Columns = 2
              DataField = 'TIPOPRODUTO'
              DataSource = dsrDetalhes
              Items.Strings = (
                'Produto Final'
                'Componente (peças)')
              TabOrder = 3
              Values.Strings = (
                'F'
                'C')
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 8
              Width = 377
              Height = 177
              Caption = '       '
              TabOrder = 1
              object lbMarca: TLabel
                Left = 16
                Top = 24
                Width = 39
                Height = 13
                Cursor = crHandPoint
                Caption = 'Marca'
                FocusControl = DBEdit15
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold, fsUnderline]
                ParentFont = False
                OnClick = lbMarcaClick
              end
              object lbModelo: TLabel
                Left = 16
                Top = 72
                Width = 46
                Height = 13
                Cursor = crHandPoint
                Caption = 'Modelo'
                FocusControl = DBEdit19
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold, fsUnderline]
                ParentFont = False
                OnClick = lbModeloClick
              end
              object Label18: TLabel
                Left = 16
                Top = 120
                Width = 108
                Height = 13
                Caption = 'Garantia (em dias)'
                FocusControl = DBEdit21
              end
              object DBEdit15: TDBEdit
                Left = 16
                Top = 40
                Width = 73
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CODMARCA'
                DataSource = dsrDetalhes
                TabOrder = 0
                OnEnter = edtPesquisarEnter
                OnExit = edtPesquisarExit
              end
              object DBEdit18: TDBEdit
                Left = 96
                Top = 40
                Width = 257
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'DESCRICAO'
                DataSource = dsrMarca
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit19: TDBEdit
                Left = 16
                Top = 88
                Width = 73
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CODMODELO'
                DataSource = dsrDetalhes
                TabOrder = 2
                OnEnter = edtPesquisarEnter
                OnExit = edtPesquisarExit
              end
              object DBEdit20: TDBEdit
                Left = 96
                Top = 88
                Width = 257
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'DESCRICAO'
                DataSource = dsrModelo
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit21: TDBEdit
                Left = 16
                Top = 136
                Width = 73
                Height = 21
                DataField = 'GARANTIA'
                DataSource = dsrDetalhes
                TabOrder = 4
                OnEnter = edtPesquisarEnter
                OnExit = edtPesquisarExit
                OnKeyPress = dedPrecoCustoKeyPress
              end
            end
            object DBCheckBox3: TDBCheckBox
              Left = 21
              Top = 6
              Width = 315
              Height = 17
              Cursor = crHandPoint
              Caption = 'Cadastrar equipamento automaticamente na venda'
              DataField = 'CADEQUIPAMENTO'
              DataSource = dsrDetalhes
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox4: TDBCheckBox
              Left = 22
              Top = 190
              Width = 103
              Height = 17
              Cursor = crHandPoint
              Caption = 'Comissionado'
              DataField = 'COMISSIONADO'
              DataSource = dsrDetalhes
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object tabOutros: TTabSheet
            Caption = '&Outras informações'
            object Label33: TLabel
              Left = 8
              Top = 208
              Width = 80
              Height = 13
              Caption = 'Data cadastro'
              FocusControl = DBEdit28
            end
            object Label34: TLabel
              Left = 8
              Top = 0
              Width = 116
              Height = 13
              Caption = 'Detalhes do Produto'
              FocusControl = DBMemo1
            end
            object Label19: TLabel
              Left = 8
              Top = 163
              Width = 103
              Height = 13
              Cursor = crHandPoint
              Caption = 'Centro de Lucro'
              FocusControl = DBEdit16
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label19Click
            end
            object DBEdit28: TDBEdit
              Left = 8
              Top = 224
              Width = 113
              Height = 21
              DataField = 'DATACADAST'
              DataSource = dsrDetalhes
              Enabled = False
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBMemo1: TDBMemo
              Tag = 4
              Left = 8
              Top = 16
              Width = 337
              Height = 137
              DataField = 'OBSERVACOES'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBCheckBox1: TDBCheckBox
              Tag = 2
              Left = 224
              Top = 226
              Width = 121
              Height = 17
              Caption = 'Oculto (não listar)'
              DataField = 'OCULTO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit16: TDBEdit
              Left = 8
              Top = 179
              Width = 57
              Height = 21
              DataField = 'CODCENTRO'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit17: TDBEdit
              Left = 72
              Top = 179
              Width = 273
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoProdutos.dcrCentro
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 411
    MinMaxInfo.MinTrackWidth = 477
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor')
    StoredValues = <>
    Left = 156
    Top = 359
  end
  object PrinterMenu: TPopupMenu
    Left = 96
    Top = 409
    object Grade1: TMenuItem
      Caption = '&Grade'
      OnClick = Grade1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Imprimiretiquetas4x201: TMenuItem
      Caption = 'Imprimir etiquetas &4x20'
      OnClick = Imprimiretiquetas4x201Click
    end
    object Imprimiretiquetas3x101: TMenuItem
      Caption = 'Imprimir etiquetas &3x10'
      OnClick = Imprimiretiquetas3x101Click
    end
    object Imprimiretiquetaspreo4x201: TMenuItem
      Caption = 'Imprimir etiquetas &preço 4x20'
      OnClick = Imprimiretiquetaspreo4x201Click
    end
    object Imprimiretiquetaspreo3x101: TMenuItem
      Caption = 'Imprimir etiquetas preço 3x10'
      OnClick = Imprimiretiquetaspreo3x101Click
    end
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    AfterScroll = qrySelecionarAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    UpdateObject = updSelecionar
    Left = 328
    Top = 240
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 328
    Top = 296
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 36
    Top = 409
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
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 156
    Top = 409
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterInsert = qryDetalhesAfterInsert
    AfterOpen = qryDetalhesAfterOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM Produtos'
      'WHERE ( CODIGO = :CODIGO )')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 432
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update Produtos'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  UNIDADE = :UNIDADE,'
      '  GRUPO = :GRUPO,'
      '  PRECOCUSTO = :PRECOCUSTO,'
      '  PRECOVENDA = :PRECOVENDA,'
      '  ICMS = :ICMS,'
      '  MINIMO = :MINIMO,'
      '  DATACADAST = :DATACADAST,'
      '  ETIQUETA = :ETIQUETA,'
      '  NUMETIQ = :NUMETIQ,'
      '  SEQUENCIA = :SEQUENCIA,'
      '  FOTO = :FOTO,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  PS = :PS,'
      '  CODSERVICO = :CODSERVICO,'
      '  LOCALIZACAO = :LOCALIZACAO,'
      '  COMISSIONADO = :COMISSIONADO,'
      '  OCULTO = :OCULTO,'
      '  CODCENTRO = :CODCENTRO,'
      '  PRECOSERVICO = :PRECOSERVICO,'
      '  CADEQUIPAMENTO = :CADEQUIPAMENTO,'
      '  CODMARCA = :CODMARCA,'
      '  CODMODELO = :CODMODELO,'
      '  GARANTIA = :GARANTIA,'
      '  TIPOPRODUTO = :TIPOPRODUTO'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into Produtos'
      
        '  (CODIGO, DESCRICAO, UNIDADE, GRUPO, PRECOCUSTO, PRECOVENDA, IC' +
        'MS, MINIMO,'
      '   DATACADAST, ETIQUETA, NUMETIQ, INDIVIDUAL, SEQUENCIA, FOTO,'
      '   OBSERVACOES, BARRA, PS, CODSERVICO, LOCALIZACAO, '
      '   COMISSIONADO, OCULTO, CODCENTRO, ATIVACAO, PRECOSERVICO,'
      '   CADEQUIPAMENTO, CODMARCA, CODMODELO, GARANTIA, TIPOPRODUTO)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, :UNIDADE, :GRUPO, :PRECOCUSTO, :PRECOVEN' +
        'DA, :ICMS,'
      '   :MINIMO, :DATACADAST, :ETIQUETA, :NUMETIQ, :INDIVIDUAL,'
      
        '   :SEQUENCIA, :FOTO, :OBSERVACOES, :BARRA, :PS, :CODSERVICO, :L' +
        'OCALIZACAO,'
      '   :COMISSIONADO, :OCULTO, :CODCENTRO, :ATIVACAO, :PRECOSERVICO,'
      
        '   :CADEQUIPAMENTO, :CODMARCA, :CODMODELO, :GARANTIA, :TIPOPRODU' +
        'TO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from Produtos'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 432
    Top = 352
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 432
    Top = 296
  end
  object FotoMenu: TPopupMenu
    Left = 97
    Top = 359
    object Abrirdoarquivo1: TMenuItem
      Caption = '&Abrir do arquivo...'
      OnClick = Abrirdoarquivo1Click
    end
    object Colardareadetransferncia1: TMenuItem
      Caption = '&Colar (da área de transferência)'
      OnClick = Colardareadetransferncia1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Apagar1: TMenuItem
      Caption = 'Apaga&r'
      OnClick = Apagar1Click
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.bmp;*.ico;*.emf;*.wmf)|*.gif;*.bmp;*.ico;*.emf;*.wm' +
      'f|CompuServe GIF Image (*.gif)|*.gif|Bitmaps (*.bmp)|*.bmp|Icons' +
      ' (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf' +
      ')|*.wmf'
    Title = 'Abrir imagem'
    Left = 97
    Top = 473
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
    Left = 328
    Top = 184
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
    Left = 432
    Top = 184
  end
  object MenuMais: TPopupMenu
    Images = dmoPrincipal.imgBotoesPeq
    Left = 37
    Top = 359
    object Movimentos1: TMenuItem
      Caption = '&Movimentos...'
      ImageIndex = 0
      OnClick = Label13Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object QuemCompra1: TMenuItem
      Caption = 'Quem &Compra?'
      ImageIndex = 0
      OnClick = QuemCompra1Click
    end
    object QuemVende1: TMenuItem
      Caption = 'Quem &Vende?'
      ImageIndex = 0
    end
  end
  object updSelecionar: TIBUpdateSQL
    Left = 328
    Top = 352
  end
  object traEtiqueta: TIBTransaction
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
    Left = 624
    Top = 192
  end
  object qryEtiqueta: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEtiqueta
    AfterOpen = qryEtiquetaAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT Produtos.BARRA, Produtos.DESCRICAO, Produtos.NUMETIQ, Pro' +
        'dutos.ETIQUETA, Produtos.CODIGO, Produtos.PRECOVENDA'
      'FROM PRODUTOS Produtos'
      'WHERE  Produtos.CODIGO = :CODIGO'
      'ORDER BY Produtos.BARRA ')
    Left = 624
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object ppDBPipeline: TppDBPipeline
    DataSource = dsrEtiqueta
    UserName = 'DBPipeline'
    Left = 704
    Top = 248
    object ppDBPipelineppField1: TppField
      FieldAlias = 'BARRA'
      FieldName = 'BARRA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppDBPipelineppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipelineppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipelineppField4: TppField
      FieldAlias = 'PRECO'
      FieldName = 'PRECO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
  end
  object ppReport: TppReport
    AutoStop = False
    Columns = 4
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 282000
    PrinterSetup.mmPaperWidth = 214500
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    Left = 792
    Top = 192
    Version = '7.0'
    mmColumnWidth = 47000
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 11229
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        BarCodeType = bcEAN_13
        BarColor = clWindowText
        DataField = 'BARRA'
        DataPipeline = ppDBPipeline
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 11377
        mmLeft = 6615
        mmTop = 265
        mmWidth = 39423
        BandType = 4
        mmBarWidth = 330
        mmWideBarRatio = 76200
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15229
      mmPrintPosition = 0
    end
  end
  object ppReport3x10: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '5000'
      '74166'
      '143332')
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 12000
    PrinterSetup.mmPaperHeight = 282000
    PrinterSetup.mmPaperWidth = 214500
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    Left = 792
    Top = 248
    Version = '7.0'
    mmColumnWidth = 68166
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppDBBarCode2: TppDBBarCode
        UserName = 'DBBarCode1'
        BarCodeType = bcEAN_13
        BarColor = clWindowText
        DataField = 'BARRA'
        DataPipeline = ppDBPipeline
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 11377
        mmLeft = 23813
        mmTop = 11906
        mmWidth = 39423
        BandType = 4
        mmBarWidth = 330
        mmWideBarRatio = 76200
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 6615
        mmLeft = 3175
        mmTop = 2381
        mmWidth = 60854
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CODIGO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 5027
        mmLeft = 3704
        mmTop = 11377
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppColumnFooterBand2: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppReportPreco: TppReport
    AutoStop = False
    Columns = 4
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 282000
    PrinterSetup.mmPaperWidth = 214500
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    Left = 792
    Top = 304
    Version = '7.0'
    mmColumnWidth = 47000
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 11229
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand3: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 7408
        mmLeft = 4763
        mmTop = 1323
        mmWidth = 40746
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        ShiftWithParent = True
        DataField = 'PRECO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 8467
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppColumnFooterBand3: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15229
      mmPrintPosition = 0
    end
  end
  object dsrEtiqueta: TDataSource
    AutoEdit = False
    DataSet = memEtiqueta
    Left = 624
    Top = 304
  end
  object memEtiqueta: TRxMemoryData
    Active = True
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'BARRA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PRECO'
        DataType = ftString
        Size = 30
      end>
    Left = 704
    Top = 192
    object memEtiquetaBARRA: TStringField
      FieldName = 'BARRA'
      Size = 13
    end
    object memEtiquetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object memEtiquetaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object memEtiquetaPRECO: TStringField
      FieldName = 'PRECO'
      Size = 30
    end
  end
  object ppReport3x10preco: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '5000'
      '74166'
      '143332')
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 12000
    PrinterSetup.mmPaperHeight = 282000
    PrinterSetup.mmPaperWidth = 214500
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    Left = 792
    Top = 360
    Version = '7.0'
    mmColumnWidth = 68166
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand4: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppDBBarCode3: TppDBBarCode
        UserName = 'DBBarCode1'
        BarCodeType = bcEAN_13
        BarColor = clWindowText
        DataField = 'BARRA'
        DataPipeline = ppDBPipeline
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 11377
        mmLeft = 23813
        mmTop = 11906
        mmWidth = 39423
        BandType = 4
        mmBarWidth = 330
        mmWideBarRatio = 76200
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 6615
        mmLeft = 3175
        mmTop = 2381
        mmWidth = 60854
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataField = 'PRECO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 5027
        mmLeft = 1852
        mmTop = 11377
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppColumnFooterBand4: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object traMarca: TIBTransaction
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
    Left = 174
    Top = 197
  end
  object qryMarca: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMarca
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   DESCRICAO'
      'FROM '
      '   MARCAS'
      'WHERE'
      '   CODIGO = :CODMARCA')
    UniDirectional = True
    Left = 173
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMARCA'
        ParamType = ptUnknown
      end>
  end
  object dsrMarca: TDataSource
    AutoEdit = False
    DataSet = qryMarca
    Left = 173
    Top = 312
  end
  object traModelo: TIBTransaction
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
    Left = 246
    Top = 197
  end
  object qryModelo: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traModelo
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '  DESCRICAO'
      'FROM '
      '  MODELOS '
      'WHERE '
      '  CODEQUIPAMENTO = :CODMARCA AND'
      '  CODIGO = :CODMODELO')
    UniDirectional = True
    Left = 245
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMARCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODMODELO'
        ParamType = ptUnknown
      end>
  end
  object dsrModelo: TDataSource
    AutoEdit = False
    DataSet = qryModelo
    Left = 245
    Top = 296
  end
end
