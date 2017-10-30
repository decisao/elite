object formContaReceber: TformContaReceber
  Left = 195
  Top = 198
  Width = 636
  Height = 463
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Contas a Receber'
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
    Width = 628
    Height = 429
    ActivePage = tabDetalhe
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 401
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 618
          Height = 46
          BoundLines = [blTop, blLeft, blRight]
          object ToolWindow971: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 603
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
              Width = 243
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
          Top = 309
          Width = 618
          Height = 91
          BoundLines = [blBottom, blLeft, blRight]
          Position = dpBottom
          object ToolWindow972: TToolWindow97
            Left = 0
            Top = 0
            Caption = #39
            ClientAreaHeight = 86
            ClientAreaWidth = 603
            DockPos = 0
            TabOrder = 0
            object Label3: TLabel
              Left = 4
              Top = 4
              Width = 83
              Height = 13
              Caption = 'S&elecionar por'
              Transparent = True
            end
            object Label4: TLabel
              Left = 135
              Top = 4
              Width = 162
              Height = 13
              Caption = '&Que satisfaçam a expressão'
              Transparent = True
            end
            object Label12: TLabel
              Left = 135
              Top = 44
              Width = 63
              Height = 13
              Caption = 'Cad. inicial'
              Transparent = True
            end
            object Label13: TLabel
              Left = 247
              Top = 44
              Width = 55
              Height = 13
              Caption = 'Cad. final'
              Transparent = True
            end
            object Label22: TLabel
              Left = 375
              Top = 43
              Width = 68
              Height = 13
              Caption = 'Venc. inicial'
              Transparent = True
            end
            object Label23: TLabel
              Left = 487
              Top = 43
              Width = 60
              Height = 13
              Caption = 'Venc. final'
              Transparent = True
            end
            object cmbSelecionar: TComboBox
              Tag = 1
              Left = 3
              Top = 19
              Width = 118
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbSelecionarChange
            end
            object edtSelecionar: TEdit
              Left = 134
              Top = 19
              Width = 459
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = edtSelecionarKeyPress
            end
            object DateEdit1: TDateEdit
              Left = 134
              Top = 59
              Width = 107
              Height = 21
              NumGlyphs = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
              TabOrder = 2
              OnKeyPress = DateEdit1KeyPress
            end
            object DateEdit2: TDateEdit
              Left = 246
              Top = 58
              Width = 107
              Height = 21
              NumGlyphs = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
              TabOrder = 3
              OnKeyPress = DateEdit1KeyPress
            end
            object ckEmpresa: TCheckBox
              Left = 374
              Top = 2
              Width = 211
              Height = 17
              Cursor = crHandPoint
              Caption = 'Pesquisar em todas as Empresas'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = ckEmpresaClick
            end
            object DateEdit3: TDateEdit
              Left = 374
              Top = 57
              Width = 107
              Height = 21
              NumGlyphs = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
              TabOrder = 5
              OnKeyPress = DateEdit1KeyPress
            end
            object DateEdit4: TDateEdit
              Left = 486
              Top = 57
              Width = 107
              Height = 21
              NumGlyphs = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
              TabOrder = 6
              OnKeyPress = DateEdit1KeyPress
            end
          end
        end
        object Dock972: TDock97
          Left = 533
          Top = 47
          Width = 86
          Height = 262
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
          Width = 532
          Height = 262
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 532
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
            Width = 532
            Height = 219
            Align = alClient
            DataSource = dscSelecionar
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            Top = 232
            Width = 532
            Height = 30
            BoundLines = [blTop, blBottom, blLeft, blRight]
            Color = clInfoBk
            Position = dpBottom
            object Toolbar973: TToolbar97
              Left = 0
              Top = 0
              Caption = 'Toolbar973'
              Color = clInfoBk
              CloseButton = False
              DockMode = dmCannotFloat
              DockPos = 0
              TabOrder = 0
              object btnReceberMarcados: TToolbarButton97
                Left = 127
                Top = 0
                Width = 81
                Height = 24
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Baixa'
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnMarcar: TToolbarButton97
                Left = 0
                Top = 0
                Width = 121
                Height = 24
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Marcar todos'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = btnMarcarClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object ToolbarSep974: TToolbarSep97
                Left = 121
                Top = 0
              end
            end
            object ToolWindow973: TToolWindow97
              Left = 221
              Top = 0
              Caption = 'ToolWindow973'
              Color = clInfoBk
              ClientAreaHeight = 24
              ClientAreaWidth = 247
              DockPos = 221
              TabOrder = 1
              object Label27: TLabel
                Left = 11
                Top = 5
                Width = 110
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total dos Marcados'
              end
              object edtTotal: TEdit
                Left = 127
                Top = 2
                Width = 114
                Height = 21
                Color = clBtnFace
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
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
        Left = 534
        Top = 0
        Width = 86
        Height = 401
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
          object ToolbarSep973: TToolbarSep97
            Left = 0
            Top = 186
          end
          object btnBaixa: TToolbarButton97
            Left = 0
            Top = 192
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Baixa'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageIndex = 10
            Images = dmoPrincipal.imgBotoes
            Layout = blGlyphTop
            Opaque = False
            ParentFont = False
            OnClick = btnBaixaClick
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
          end
        end
      end
      object panDados: TPanel
        Left = 0
        Top = 0
        Width = 534
        Height = 401
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
          Left = 232
          Top = 352
          Width = 240
          Height = 25
          DataSource = dsrDetalhes
          TabOrder = 0
          Visible = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 532
          Height = 399
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlEmpresa: TPanel
            Left = 0
            Top = 0
            Width = 532
            Height = 45
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label5: TLabel
              Left = 8
              Top = 5
              Width = 40
              Height = 13
              Caption = 'Código'
              FocusControl = DBEdit1
            end
            object Label15: TLabel
              Left = 216
              Top = 5
              Width = 57
              Height = 13
              Caption = 'Empresa'
              FocusControl = DBEdit9
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 20
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
              TabOrder = 0
            end
            object DBEdit9: TDBEdit
              Left = 216
              Top = 20
              Width = 41
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODIGO'
              DataSource = dsrEmpresa
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit10: TDBEdit
              Left = 264
              Top = 20
              Width = 249
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrEmpresa
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
          object pnlVenda: TPanel
            Left = 0
            Top = 45
            Width = 532
            Height = 42
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object lblVendaOS: TLabel
              Left = 8
              Top = 1
              Width = 65
              Height = 13
              Cursor = crHandPoint
              Caption = 'Venda/OS'
              FocusControl = dedVendaOS
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblVendaOSClick
            end
            object lblParcela: TLabel
              Left = 80
              Top = 1
              Width = 42
              Height = 13
              Caption = 'Parcela'
              FocusControl = dedParcela
            end
            object lblCliente: TLabel
              Left = 128
              Top = 1
              Width = 40
              Height = 13
              Caption = 'Cliente'
              FocusControl = dedParcela
            end
            object lblDataFechamento: TLabel
              Left = 384
              Top = 1
              Width = 100
              Height = 13
              Caption = 'Data Fechamento'
              FocusControl = dedDataFechamento
            end
            object dedVendaOS: TDBEdit
              Left = 8
              Top = 17
              Width = 64
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODMOVIMENTO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dedParcela: TDBEdit
              Left = 80
              Top = 17
              Width = 41
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NUMERO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dedCliente: TDBEdit
              Left = 128
              Top = 17
              Width = 249
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrMovimento
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dedDataFechamento: TDBEdit
              Left = 384
              Top = 17
              Width = 129
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DATAFECHAMENTO'
              DataSource = dsrMovimento
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
          object pnlPessoa: TPanel
            Left = 0
            Top = 87
            Width = 532
            Height = 42
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            object lblPessoa: TLabel
              Left = 8
              Top = 0
              Width = 46
              Height = 13
              Cursor = crHandPoint
              Caption = 'Pessoa'
              FocusControl = dedPessoa
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblPessoaClick
            end
            object lblTelefone: TLabel
              Left = 384
              Top = 0
              Width = 49
              Height = 13
              Caption = 'Telefone'
              FocusControl = dedTelefone
            end
            object dedPessoa: TDBEdit
              Left = 8
              Top = 16
              Width = 65
              Height = 21
              DataField = 'CODCLIENTE'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object dedNomePessoa: TDBEdit
              Left = 80
              Top = 16
              Width = 297
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrCliente
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dedTelefone: TDBEdit
              Left = 384
              Top = 16
              Width = 129
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'FONE'
              DataSource = dsrCliente
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
          object pnlDados: TPanel
            Left = 0
            Top = 129
            Width = 532
            Height = 120
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            Visible = False
            object lblHistorico: TLabel
              Left = 8
              Top = 0
              Width = 58
              Height = 13
              Cursor = crHandPoint
              Caption = 'Histórico'
              FocusControl = DBEdit4
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 8
              Top = 80
              Width = 100
              Height = 13
              Cursor = crHandPoint
              Caption = 'Centro de lucro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label17Click
            end
            object Label11: TLabel
              Left = 8
              Top = 40
              Width = 139
              Height = 13
              Cursor = crHandPoint
              Caption = 'Forma de pagamento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label11Click
            end
            object Label9: TLabel
              Left = 384
              Top = 40
              Width = 110
              Height = 13
              Caption = 'Data Vencimento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 248
              Top = 40
              Width = 34
              Height = 13
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 384
              Top = 0
              Width = 83
              Height = 13
              Caption = 'Data Cadastro'
              FocusControl = DBEdit2
            end
            object Label20: TLabel
              Left = 248
              Top = 80
              Width = 145
              Height = 13
              Cursor = crHandPoint
              Caption = 'Classificação no plano'
              FocusControl = DBEdit12
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label20Click
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 16
              Width = 369
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DESCRICAO'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 8
              Top = 96
              Width = 233
              Height = 21
              DataField = 'CENTRO'
              DataSource = dsrDetalhes
              TabOrder = 4
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 8
              Top = 56
              Width = 233
              Height = 21
              DataField = 'DOCUMENTO'
              DataSource = dsrDetalhes
              TabOrder = 1
            end
            object DBDateEdit1: TDBDateEdit
              Left = 384
              Top = 56
              Width = 129
              Height = 21
              DataField = 'DATAVENCIMENTO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 3
            end
            object RxDBCalcEdit1: TRxDBCalcEdit
              Left = 248
              Top = 56
              Width = 129
              Height = 21
              DataField = 'VALOR'
              DataSource = dsrDetalhes
              DisplayFormat = '#,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit2: TDBEdit
              Left = 384
              Top = 16
              Width = 129
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DATACADAST'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
            end
            object DBEdit12: TDBEdit
              Left = 248
              Top = 96
              Width = 265
              Height = 21
              TabStop = False
              DataField = 'DESCRICAO'
              DataSource = dsrPlano
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
          end
          object pnlCheque: TPanel
            Left = 0
            Top = 249
            Width = 532
            Height = 64
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 169
              Height = 13
              Caption = 'INFORMAÇÕES DO CHEQUE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Top = 24
              Width = 39
              Height = 13
              Cursor = crHandPoint
              Caption = 'Banco'
              FocusControl = DBEdit3
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label8Click
            end
            object Label14: TLabel
              Left = 224
              Top = 24
              Width = 45
              Height = 13
              Caption = 'Agência'
              FocusControl = DBEdit6
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 288
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Conta'
              FocusControl = DBEdit7
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 368
              Top = 24
              Width = 30
              Height = 13
              Caption = 'Série'
              FocusControl = DBEdit8
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 432
              Top = 24
              Width = 45
              Height = 13
              Caption = 'Número'
              FocusControl = DBEdit11
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 40
              Width = 49
              Height = 21
              DataField = 'CH_BANCO'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit5: TDBEdit
              Left = 64
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrBanco
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit6: TDBEdit
              Left = 224
              Top = 40
              Width = 57
              Height = 21
              DataField = 'CH_AGENCIA'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit7: TDBEdit
              Left = 288
              Top = 40
              Width = 73
              Height = 21
              DataField = 'CH_CONTA'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit8: TDBEdit
              Left = 368
              Top = 40
              Width = 57
              Height = 21
              DataField = 'CH_SERIE'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit11: TDBEdit
              Left = 432
              Top = 40
              Width = 81
              Height = 21
              DataField = 'CH_NUMERO'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object pnlOutros: TPanel
            Left = 0
            Top = 353
            Width = 532
            Height = 46
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 5
            object Label21: TLabel
              Left = 8
              Top = 8
              Width = 114
              Height = 13
              Caption = 'Outras Informações'
              FocusControl = DBEdit13
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit13: TDBEdit
              Left = 8
              Top = 24
              Width = 505
              Height = 21
              CharCase = ecUpperCase
              DataField = 'INFODOC'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object pnlOrigem: TPanel
            Left = 0
            Top = 313
            Width = 532
            Height = 40
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 6
            Visible = False
            object Label26: TLabel
              Left = 8
              Top = 8
              Width = 368
              Height = 13
              Caption = 'RELANÇAMENTO AUTOMÁTICO PROVENIENTE DE ESTORNO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblOrigem: TLabel
              Left = 8
              Top = 24
              Width = 67
              Height = 13
              Caption = 'CONTA Nº '
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 463
    MinMaxInfo.MinTrackWidth = 636
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor'
      'DateEdit1.Text'
      'DateEdit2.Text'
      'DateEdit3.Text'
      'DateEdit4.Text')
    StoredValues = <>
    Left = 196
    Top = 265
  end
  object PrinterMenu: TPopupMenu
    Left = 132
    Top = 265
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    AfterPost = qrySelecionarAfterPost
    OnUpdateRecord = qrySelecionarUpdateRecord
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      '')
    UpdateObject = updSelecionar
    Left = 476
    Top = 169
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 476
    Top = 217
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 132
    Top = 225
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
    Left = 196
    Top = 225
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterClose = qryDetalhesAfterClose
    AfterInsert = qryDetalhesAfterInsert
    AfterOpen = qryDetalhesAfterOpen
    BeforeOpen = qryDetalhesBeforeOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT *'
      'FROM Pagamentos'
      'WHERE  CODIGO = :CODIGO')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 548
    Top = 169
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"PAGAMENTOS"."CODIGO"'
      Required = True
    end
    object qryDetalhesCODMOVIMENTO: TIntegerField
      FieldName = 'CODMOVIMENTO'
      Origin = '"PAGAMENTOS"."CODMOVIMENTO"'
    end
    object qryDetalhesNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Origin = '"PAGAMENTOS"."NUMERO"'
      Required = True
    end
    object qryDetalhesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PAGAMENTOS"."DESCRICAO"'
      Required = True
      FixedChar = True
      Size = 40
    end
    object qryDetalhesES: TSmallintField
      FieldName = 'ES'
      Origin = '"PAGAMENTOS"."ES"'
    end
    object qryDetalhesDATACADAST: TDateTimeField
      FieldName = 'DATACADAST'
      Origin = '"PAGAMENTOS"."DATACADAST"'
    end
    object qryDetalhesVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"PAGAMENTOS"."VALOR"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesCODDOCUMENTO: TIntegerField
      FieldName = 'CODDOCUMENTO'
      Origin = '"PAGAMENTOS"."CODDOCUMENTO"'
    end
    object qryDetalhesINFODOC: TIBStringField
      FieldName = 'INFODOC'
      Origin = '"PAGAMENTOS"."INFODOC"'
      FixedChar = True
      Size = 50
    end
    object qryDetalhesEXTERNO: TIBStringField
      FieldName = 'EXTERNO'
      Origin = '"PAGAMENTOS"."EXTERNO"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesARQUIVO: TIBStringField
      FieldName = 'ARQUIVO'
      Origin = '"PAGAMENTOS"."ARQUIVO"'
      FixedChar = True
      Size = 50
    end
    object qryDetalhesHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Origin = '"PAGAMENTOS"."HISTORICO"'
      Size = 1024
    end
    object qryDetalhesPAGO: TSmallintField
      FieldName = 'PAGO'
      Origin = '"PAGAMENTOS"."PAGO"'
    end
    object qryDetalhesDATAPAGO: TDateTimeField
      FieldName = 'DATAPAGO'
      Origin = '"PAGAMENTOS"."DATAPAGO"'
    end
    object qryDetalhesDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"PAGAMENTOS"."DESCONTO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesMULTA_JUROS: TIBBCDField
      FieldName = 'MULTA_JUROS'
      Origin = '"PAGAMENTOS"."MULTA_JUROS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesTOTAL_PAGO: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_PAGO'
      Origin = '"PAGAMENTOS"."TOTAL_PAGO"'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object qryDetalhesDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = '"PAGAMENTOS"."DATAVENCIMENTO"'
      Required = True
    end
    object qryDetalhesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"PAGAMENTOS"."STATUS"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesSALDOANT: TIBBCDField
      FieldName = 'SALDOANT'
      Origin = '"PAGAMENTOS"."SALDOANT"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesSALDOATU: TIBBCDField
      FieldName = 'SALDOATU'
      Origin = '"PAGAMENTOS"."SALDOATU"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      Origin = '"PAGAMENTOS"."CODCONTA"'
      Required = True
    end
    object qryDetalhesCODLANCTO: TIntegerField
      FieldName = 'CODLANCTO'
      Origin = '"PAGAMENTOS"."CODLANCTO"'
    end
    object qryDetalhesNOMEUSUARIO: TIBStringField
      FieldName = 'NOMEUSUARIO'
      Origin = '"PAGAMENTOS"."NOMEUSUARIO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesCODEMPRESA: TIntegerField
      FieldName = 'CODEMPRESA'
      Origin = '"PAGAMENTOS"."CODEMPRESA"'
    end
    object qryDetalhesVALOR_COMISSAO: TIBBCDField
      FieldName = 'VALOR_COMISSAO'
      Origin = '"PAGAMENTOS"."VALOR_COMISSAO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesTIPO_PAG: TIBStringField
      FieldName = 'TIPO_PAG'
      Origin = '"PAGAMENTOS"."TIPO_PAG"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesTIPO_DOC: TIBStringField
      FieldName = 'TIPO_DOC'
      Origin = '"PAGAMENTOS"."TIPO_DOC"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesCH_BANCO: TIntegerField
      FieldName = 'CH_BANCO'
      Origin = '"PAGAMENTOS"."CH_BANCO"'
    end
    object qryDetalhesCH_AGENCIA: TIntegerField
      FieldName = 'CH_AGENCIA'
      Origin = '"PAGAMENTOS"."CH_AGENCIA"'
    end
    object qryDetalhesCH_CONTA: TIntegerField
      FieldName = 'CH_CONTA'
      Origin = '"PAGAMENTOS"."CH_CONTA"'
    end
    object qryDetalhesCH_SERIE: TIBStringField
      FieldName = 'CH_SERIE'
      Origin = '"PAGAMENTOS"."CH_SERIE"'
      FixedChar = True
      Size = 10
    end
    object qryDetalhesCH_NUMERO: TIntegerField
      FieldName = 'CH_NUMERO'
      Origin = '"PAGAMENTOS"."CH_NUMERO"'
    end
    object qryDetalhesCODCENTRO: TIntegerField
      FieldName = 'CODCENTRO'
      Origin = '"PAGAMENTOS"."CODCENTRO"'
      Required = True
    end
    object qryDetalhesCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"PAGAMENTOS"."CODCLIENTE"'
      Required = True
    end
    object qryDetalhesDOCUMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DOCUMENTO'
      LookupDataSet = qryDocumento
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DOCUMENTO'
      KeyFields = 'CODDOCUMENTO'
      Size = 40
      Lookup = True
    end
    object qryDetalhesCENTRO: TStringField
      FieldKind = fkLookup
      FieldName = 'CENTRO'
      LookupDataSet = qryCentro
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODCENTRO'
      Size = 40
      Lookup = True
    end
    object qryDetalhesCODPLANO: TIntegerField
      FieldName = 'CODPLANO'
      Origin = '"PAGAMENTOS"."CODPLANO"'
    end
    object qryDetalhesESTORNO_CODUSUARIO: TIntegerField
      FieldName = 'ESTORNO_CODUSUARIO'
      Origin = '"PAGAMENTOS"."ESTORNO_CODUSUARIO"'
    end
    object qryDetalhesESTORNO_DATA: TDateTimeField
      FieldName = 'ESTORNO_DATA'
      Origin = '"PAGAMENTOS"."ESTORNO_DATA"'
    end
    object qryDetalhesESTORNO_CODESTORNO: TIntegerField
      FieldName = 'ESTORNO_CODESTORNO'
      Origin = '"PAGAMENTOS"."ESTORNO_CODESTORNO"'
    end
    object qryDetalhesESTORNO_CODRELANC: TIntegerField
      FieldName = 'ESTORNO_CODRELANC'
      Origin = '"PAGAMENTOS"."ESTORNO_CODRELANC"'
    end
    object qryDetalhesESTORNO_NOMEUSER: TIBStringField
      FieldName = 'ESTORNO_NOMEUSER'
      Origin = '"PAGAMENTOS"."ESTORNO_NOMEUSER"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesCODORIGEM: TIntegerField
      FieldName = 'CODORIGEM'
      Origin = '"PAGAMENTOS"."CODORIGEM"'
    end
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update Pagamentos'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  INFODOC = :INFODOC,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCENTRO = :CODCENTRO,'
      '  TIPO_PAG = :TIPO_PAG,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  CH_BANCO = :CH_BANCO,'
      '  CH_AGENCIA = :CH_AGENCIA,'
      '  CH_CONTA = :CH_CONTA,'
      '  CH_SERIE = :CH_SERIE,'
      '  CH_NUMERO = :CH_NUMERO,'
      '  CODPLANO = :CODPLANO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into Pagamentos ('
      '  DESCRICAO,'
      '  VALOR,'
      '  CODDOCUMENTO,'
      '  DATAVENCIMENTO,'
      '  NUMERO,'
      '  ES,'
      '  DATACADAST,'
      '  EXTERNO,'
      '  PAGO,'
      '  MULTA_JUROS,'
      '  DESCONTO,'
      '  CODIGO,'
      '  CODCONTA,'
      '  INFODOC,'
      '  SALDOANT,'
      '  SALDOATU,'
      '  CODEMPRESA,'
      '  CODPLANO,'
      '  CODCLIENTE,'
      '  CODCENTRO,'
      '  TIPO_PAG,'
      '  TIPO_DOC,'
      '  CH_BANCO,'
      '  CH_AGENCIA,'
      '  CH_CONTA,'
      '  CH_SERIE,'
      '  CH_NUMERO'
      ')'
      'values ('
      '  :DESCRICAO,'
      '  :VALOR,'
      '  :CODDOCUMENTO,'
      '  :DATAVENCIMENTO,'
      '  :NUMERO,'
      '  :ES,'
      '  :DATACADAST,'
      '  :EXTERNO,'
      '  :PAGO,'
      '  :MULTA_JUROS,'
      '  :DESCONTO,'
      '  :CODIGO,'
      '  :CODCONTA,'
      '  :INFODOC,'
      '  :SALDOANT,'
      '  :SALDOATU,'
      '  :CODEMPRESA,'
      '  :CODPLANO,'
      '  :CODCLIENTE,'
      '  :CODCENTRO,'
      '  :TIPO_PAG,'
      '  :TIPO_DOC,'
      '  :CH_BANCO,'
      '  :CH_AGENCIA,'
      '  :CH_CONTA,'
      '  :CH_SERIE,'
      '  :CH_NUMERO'
      ')'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from Pagamentos'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 548
    Top = 265
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 548
    Top = 217
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
    Left = 476
    Top = 121
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
    Left = 548
    Top = 121
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
    Left = 25
    Top = 61
  end
  object qryEmpresa: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEmpresa
    ForcedRefresh = True
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  SI.CODIGO,'
      '  CL.NOME'
      'FROM'
      '  SISCONFIG SI'
      '  JOIN CLIENTES CL ON'
      '     (SI.CODCLIENTE = CL.CODIGO)'
      'WHERE'
      '  SI.CODIGO = :CODEMPRESA')
    UniDirectional = True
    Left = 25
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end>
  end
  object dsrEmpresa: TDataSource
    AutoEdit = False
    DataSet = qryEmpresa
    Left = 25
    Top = 170
  end
  object traMovimento: TIBTransaction
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
    Left = 89
    Top = 61
  end
  object qryMovimento: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMovimento
    ForcedRefresh = True
    AfterOpen = qryMovimentoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  CL.NOME,'
      '  MO.DATA,'
      '  MO.DATAFECHAMENTO'
      'FROM'
      '  MOVIMENTOS MO'
      '  JOIN CLIENTES CL ON'
      '   (CL.CODIGO = MO.CODCLIENTE)'
      'WHERE'
      '  MO.CODIGO = :CODMOVIMENTO')
    UniDirectional = True
    Left = 89
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsrMovimento: TDataSource
    AutoEdit = False
    DataSet = qryMovimento
    Left = 89
    Top = 170
  end
  object traCliente: TIBTransaction
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
    Left = 153
    Top = 61
  end
  object qryCliente: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCliente
    ForcedRefresh = True
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  NOME,'
      '  FONE'
      'FROM'
      '  CLIENTES'
      'WHERE'
      '  CODIGO = :CODCLIENTE')
    UniDirectional = True
    Left = 153
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end>
  end
  object dsrCliente: TDataSource
    AutoEdit = False
    DataSet = qryCliente
    Left = 153
    Top = 170
  end
  object traDocumento: TIBTransaction
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
    Left = 217
    Top = 61
  end
  object qryDocumento: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDocumento
    ForcedRefresh = True
    AfterOpen = qryDocumentoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DOCUMENTO,'
      '  TIPO_PAG,'
      '  TIPO_DOC'
      'FROM'
      '  DOCUMENTOS'
      'ORDER BY'
      '  DOCUMENTO')
    Left = 217
    Top = 114
  end
  object dsrDocumento: TDataSource
    AutoEdit = False
    DataSet = qryDocumento
    Left = 217
    Top = 170
  end
  object traCentro: TIBTransaction
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
    Left = 281
    Top = 61
  end
  object qryCentro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCentro
    ForcedRefresh = True
    AfterOpen = qryDocumentoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAO'
      'FROM'
      '  CENTROS'
      'WHERE'
      '  TIPO = '#39'L'#39
      'ORDER BY'
      '  DESCRICAO')
    Left = 281
    Top = 114
  end
  object dsrCentro: TDataSource
    AutoEdit = False
    DataSet = qryCentro
    Left = 281
    Top = 170
  end
  object traBanco: TIBTransaction
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
    Left = 345
    Top = 61
  end
  object qryBanco: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traBanco
    ForcedRefresh = True
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  BANCOS'
      'WHERE'
      '  CODIGO = :CH_BANCO'
      '')
    UniDirectional = True
    Left = 345
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CH_BANCO'
        ParamType = ptUnknown
      end>
  end
  object dsrBanco: TDataSource
    AutoEdit = False
    DataSet = qryBanco
    Left = 345
    Top = 170
  end
  object updSelecionar: TIBUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '   PAGAMENTOS'
      'SET'
      '  PAGO = :PAGO'
      'WHERE'
      '  CODIGO = :CODIGO')
    Left = 476
    Top = 265
  end
  object traPlano: TIBTransaction
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
    Left = 409
    Top = 61
  end
  object qryPlano: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traPlano
    ForcedRefresh = True
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  UDF_TRIM(CODPLANO) || '#39' '#39' || DESCRICAO AS DESCRICAO'
      'FROM'
      '  PLANCONTAS'
      'WHERE'
      '  CODIGO = :CODPLANO')
    UniDirectional = True
    Left = 409
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPLANO'
        ParamType = ptUnknown
      end>
  end
  object dsrPlano: TDataSource
    AutoEdit = False
    DataSet = qryPlano
    Left = 409
    Top = 170
  end
end
