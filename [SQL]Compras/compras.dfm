object formCompras: TformCompras
  Left = 275
  Top = 156
  Width = 478
  Height = 413
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Compras'
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
    Width = 470
    Height = 379
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 462
        Height = 351
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 460
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
        object Dock973: TDock97
          Left = 1
          Top = 304
          Width = 460
          Height = 46
          BoundLines = [blBottom, blLeft, blRight]
          Position = dpBottom
          object ToolWindow972: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 444
            DockPos = 0
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
          end
        end
        object Dock972: TDock97
          Left = 375
          Top = 47
          Width = 86
          Height = 257
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
          Width = 374
          Height = 257
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 374
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
            Width = 374
            Height = 216
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
            Top = 229
            Width = 374
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
              object btnAreas: TToolbarButton97
                Left = 73
                Top = 0
                Width = 112
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Pagamentos'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = Label14Click
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnArquivos: TToolbarButton97
                Left = 0
                Top = 0
                Width = 73
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Itens'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = lblItensClick
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
        Left = 376
        Top = 0
        Width = 86
        Height = 351
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
            Height = 58
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
        Width = 376
        Height = 351
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
          ConfirmDelete = False
          TabOrder = 0
          Visible = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 374
          Height = 96
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
          object lblFORNECEDOR: TLabel
            Left = 8
            Top = 48
            Width = 75
            Height = 13
            Cursor = crHandPoint
            Caption = 'Fornecedor'
            FocusControl = DBEdit14
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = lblFORNECEDORClick
          end
          object Label15: TLabel
            Left = 217
            Top = 3
            Width = 27
            Height = 13
            Caption = 'Data'
            FocusControl = DBEdit7
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
            TabOrder = 1
          end
          object DBEdit14: TDBEdit
            Left = 8
            Top = 64
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODCLIENTE'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = DBEdit14Enter
            OnExit = edtPesquisarExit
          end
          object DBEdit15: TDBEdit
            Left = 80
            Top = 64
            Width = 273
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NOME'
            DataSource = dsrFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit7: TDBEdit
            Left = 216
            Top = 19
            Width = 137
            Height = 21
            DataField = 'DATA'
            DataSource = dsrDetalhes
            Enabled = False
            TabOrder = 0
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
        end
        object pgcDetalhes: TPageControl
          Left = 1
          Top = 97
          Width = 374
          Height = 253
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 2
          object TabSheet1: TTabSheet
            Caption = '&Informações'
            object Label6: TLabel
              Left = 8
              Top = 56
              Width = 133
              Height = 13
              Caption = 'Descrição dos Serviços'
              FocusControl = DBMemo1
            end
            object Label7: TLabel
              Left = 8
              Top = 176
              Width = 105
              Height = 13
              Caption = 'Total dos Serviços'
              FocusControl = DBEdit2
            end
            object Label12: TLabel
              Left = 280
              Top = 8
              Width = 61
              Height = 13
              Caption = 'Nota Fiscal'
              FocusControl = DBEdit8
            end
            object Label19: TLabel
              Left = 8
              Top = 8
              Width = 103
              Height = 13
              Cursor = crHandPoint
              Caption = 'Centro de Custo'
              FocusControl = DBEdit16
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label19Click
            end
            object DBMemo1: TDBMemo
              Tag = 3
              Left = 8
              Top = 72
              Width = 345
              Height = 97
              DataField = 'SERVICOS'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 192
              Width = 137
              Height = 21
              DataField = 'VALOR_SERVICOS'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit8: TDBEdit
              Left = 280
              Top = 24
              Width = 73
              Height = 21
              DataField = 'NOTA_NUMERO'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit16: TDBEdit
              Left = 8
              Top = 24
              Width = 57
              Height = 21
              DataField = 'CODCENTRO'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit17: TDBEdit
              Left = 72
              Top = 24
              Width = 201
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dsrCentro
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
          object TabSheet2: TTabSheet
            Caption = '&Totais'
            object Label8: TLabel
              Left = 116
              Top = 8
              Width = 61
              Height = 13
              Cursor = crHandPoint
              Caption = 'Total Itens'
              FocusControl = DBEdit3
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              OnClick = Label17Click
            end
            object Label9: TLabel
              Left = 8
              Top = 128
              Width = 90
              Height = 14
              Caption = 'Total da Compra'
              FocusControl = DBEdit4
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 8
              Top = 8
              Width = 81
              Height = 13
              Caption = 'Total Serviços'
              FocusControl = DBEdit5
            end
            object Label11: TLabel
              Left = 8
              Top = 88
              Width = 87
              Height = 13
              Caption = 'Valor Desconto'
              FocusControl = DBEdit6
            end
            object Label13: TLabel
              Left = 117
              Top = 88
              Width = 120
              Height = 13
              Caption = 'Cond. de Pagamento'
              FocusControl = DBEdit9
            end
            object Label16: TLabel
              Left = 8
              Top = 48
              Width = 63
              Height = 13
              Caption = 'Valor Frete'
              FocusControl = DBEdit10
            end
            object Label17: TLabel
              Left = 115
              Top = 48
              Width = 80
              Height = 13
              Caption = 'Valor "outros"'
              FocusControl = DBEdit11
            end
            object Label14: TLabel
              Left = 222
              Top = 8
              Width = 82
              Height = 13
              Cursor = crHandPoint
              Caption = 'Valor IPI itens'
              FocusControl = DBEdit12
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              OnClick = Label17Click
            end
            object Label18: TLabel
              Left = 221
              Top = 48
              Width = 102
              Height = 13
              Caption = 'Valor IPI s/outros'
              FocusControl = DBEdit13
            end
            object DBEdit3: TDBEdit
              Left = 116
              Top = 24
              Width = 97
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_ITENS'
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
            object DBEdit4: TDBEdit
              Left = 8
              Top = 144
              Width = 313
              Height = 67
              TabStop = False
              Color = clBtnFace
              DataField = 'NOTA_VALOR_TOTAL'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -48
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 24
              Width = 98
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_SERVICOS'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 104
              Width = 97
              Height = 21
              DataField = 'DESCONTO'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit10KeyPress
            end
            object DBEdit9: TDBEdit
              Left = 117
              Top = 104
              Width = 202
              Height = 21
              DataField = 'CONDICAO'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 64
              Width = 97
              Height = 21
              DataField = 'NOTA_VALOR_FRETE'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit10KeyPress
            end
            object DBEdit11: TDBEdit
              Left = 116
              Top = 64
              Width = 96
              Height = 21
              DataField = 'NOTA_VALOR_OUTROS'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit10KeyPress
            end
            object DBEdit12: TDBEdit
              Left = 222
              Top = 24
              Width = 97
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_IPI_PRODUTOS'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
            object DBEdit13: TDBEdit
              Left = 222
              Top = 64
              Width = 96
              Height = 21
              DataField = 'VALOR_IPI'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit10KeyPress
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
    Left = 252
    Top = 305
  end
  object PrinterMenu: TPopupMenu
    Left = 164
    Top = 153
    object Grade1: TMenuItem
      Caption = '&Grade'
      OnClick = Grade1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Imprimiroramento1: TMenuItem
      Caption = 'Imprimir etiquetas &4x20'
      OnClick = Imprimiroramento1Click
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
    object N3: TMenuItem
      Caption = '-'
    end
    object EmitirNotadeEntrada1: TMenuItem
      Caption = '&Emitir Nota de Entrada'
      OnClick = EmitirNotadeEntrada1Click
    end
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    AfterScroll = qrySelecionarAfterScroll
    BufferChunks = 100
    CachedUpdates = False
    Left = 252
    Top = 49
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 252
    Top = 105
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 252
    Top = 241
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
    Left = 220
    Top = 281
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterInsert = qryDetalhesAfterInsert
    AfterOpen = qryDetalhesAfterOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM MOVIMENTOS'
      'WHERE (CODIGO = :CODIGO)')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 316
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update MOVIMENTOS'
      'set'
      '  ES = :ES,'
      '  TIPO = :TIPO,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  DATA = :DATA,'
      '  EQUIPAMENTO = :EQUIPAMENTO,'
      '  PROBLEMA = :PROBLEMA,'
      '  SOLICITANTE = :SOLICITANTE,'
      '  ATENDIMENTO = :ATENDIMENTO,'
      '  SERVICOS = :SERVICOS,'
      '  VALOR_SERVICOS = :VALOR_SERVICOS,'
      '  OPCIONAIS = :OPCIONAIS,'
      '  CONDICOES1 = :CONDICOES1,'
      '  CONDICOES2 = :CONDICOES2,'
      '  VALOR_ITENS = :VALOR_ITENS,'
      '  DESCONTO = :DESCONTO,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  NOTA_NUMERO = :NOTA_NUMERO,'
      '  NOTA_DATAEMISSAO = :NOTA_DATAEMISSAO,'
      '  NOTA_CODNATUOPER = :NOTA_CODNATUOPER,'
      '  NOTA_CODTRANSPORTADOR = :NOTA_CODTRANSPORTADOR,'
      '  NOTA_PLACAVEICULO = :NOTA_PLACAVEICULO,'
      '  NOTA_UFVEICULO = :NOTA_UFVEICULO,'
      '  NOTA_FRETE = :NOTA_FRETE,'
      '  NOTA_VALOR_FRETE = :NOTA_VALOR_FRETE,'
      '  NOTA_VALOR_SEGURO = :NOTA_VALOR_SEGURO,'
      '  NOTA_VALOR_OUTROS = :NOTA_VALOR_OUTROS,'
      '  NOTA_QUANTIDADE = :NOTA_QUANTIDADE,'
      '  NOTA_ESPECIE = :NOTA_ESPECIE,'
      '  NOTA_MARCA = :NOTA_MARCA,'
      '  NOTA_VOLNUM = :NOTA_VOLNUM,'
      '  NOTA_PESOBRUTO = :NOTA_PESOBRUTO,'
      '  NOTA_PESOLIQUIDO = :NOTA_PESOLIQUIDO,'
      '  NOTA_DADOSADICIONAIS = :NOTA_DADOSADICIONAIS,'
      '  CONDICAO = :CONDICAO,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  OSTIPO = :OSTIPO,'
      '  CODCENTRO = :CODCENTRO'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into MOVIMENTOS ('
      '   CODIGO,'
      '   ES,'
      '   TIPO,'
      '   CODCLIENTE,'
      '   DATA,'
      '   EQUIPAMENTO,'
      '   PROBLEMA,'
      '   SOLICITANTE,'
      '   ATENDIMENTO,'
      '   SERVICOS,'
      '   VALOR_SERVICOS,'
      '   OPCIONAIS,'
      '   CONDICOES1,'
      '   CONDICOES2,'
      '   VALOR_ITENS,'
      '   DESCONTO,'
      '   VALOR_ICMS,'
      '   OBSERVACOES,'
      '   NOTA_NUMERO,'
      '   NOTA_DATAEMISSAO,'
      '   NOTA_CODNATUOPER,'
      '   NOTA_CODTRANSPORTADOR,'
      '   NOTA_PLACAVEICULO,'
      '   NOTA_UFVEICULO,'
      '   NOTA_FRETE,'
      '   NOTA_VALOR_FRETE,'
      '   NOTA_VALOR_SEGURO,'
      '   NOTA_VALOR_OUTROS,'
      '   NOTA_QUANTIDADE,'
      '   NOTA_ESPECIE,'
      '   NOTA_MARCA,'
      '   NOTA_VOLNUM,'
      '   NOTA_PESOBRUTO,'
      '   NOTA_PESOLIQUIDO,'
      '   NOTA_DADOSADICIONAIS,'
      '   CONDICAO,'
      '   PRIORIDADE,'
      '   CODEMPRESA,'
      '   VALOR_IPI,'
      '   OSTIPO,'
      '   CODCENTRO)'
      'values ('
      '   :CODIGO,'
      '   :ES,'
      '   :TIPO,'
      '   :CODCLIENTE,'
      '   :DATA,'
      '   :EQUIPAMENTO,'
      '   :PROBLEMA,'
      '   :SOLICITANTE,'
      '   :ATENDIMENTO,'
      '   :SERVICOS,'
      '   :VALOR_SERVICOS,'
      '   :OPCIONAIS,'
      '   :CONDICOES1,'
      '   :CONDICOES2,'
      '   :VALOR_ITENS,'
      '   :DESCONTO,'
      '   :VALOR_ICMS,'
      '   :OBSERVACOES,'
      '   :NOTA_NUMERO,'
      '   :NOTA_DATAEMISSAO,'
      '   :NOTA_CODNATUOPER,'
      '   :NOTA_CODTRANSPORTADOR,'
      '   :NOTA_PLACAVEICULO,'
      '   :NOTA_UFVEICULO,'
      '   :NOTA_FRETE,'
      '   :NOTA_VALOR_FRETE,'
      '   :NOTA_VALOR_SEGURO,'
      '   :NOTA_VALOR_OUTROS,'
      '   :NOTA_QUANTIDADE,'
      '   :NOTA_ESPECIE,'
      '   :NOTA_MARCA,'
      '   :NOTA_VOLNUM,'
      '   :NOTA_PESOBRUTO,'
      '   :NOTA_PESOLIQUIDO,'
      '   :NOTA_DADOSADICIONAIS,'
      '   :CONDICAO,'
      '   :PRIORIDADE,'
      '   :CODEMPRESA,'
      '   :VALOR_IPI,'
      '   :OSTIPO,'
      '   :CODCENTRO)'
      ''
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from MOVIMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 364
    Top = 281
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 316
    Top = 105
  end
  object qryFornecedor: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traFornecedor
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT NOME FROM CLIENTES'
      'WHERE CODIGO = :CODIGO')
    UniDirectional = True
    Left = 37
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrFornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 37
    Top = 104
  end
  object ppDBPipeline: TppDBPipeline
    DataSource = dsrEtiqueta
    UserName = 'DBPipeline'
    Left = 101
    Top = 104
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
      FieldLength = 90
      DisplayWidth = 90
      Position = 2
    end
    object ppDBPipelineppField4: TppField
      FieldAlias = 'PRECO'
      FieldName = 'PRECO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDBPipelineppField5: TppField
      FieldAlias = 'FONE'
      FieldName = 'FONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
  end
  object qryEtiqueta: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEtiqueta
    AfterOpen = qryEtiquetaAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT Individuais.BARRA, Individuais.SERIE, Individuais.NUMERO_' +
        'FONE, Individuais.QUANTIDADE, Produtos.DESCRICAO, Produtos.NUMET' +
        'IQ, Produtos.ETIQUETA, Produtos.CODIGO, Produtos.PRECOVENDA'
      'FROM MOVIMENTOS Movimentos'
      '   INNER JOIN TEMPITENS Tempitens'
      '   ON  (Movimentos.CODIGO = Tempitens.CODMOVIMENTO)  '
      '   INNER JOIN INDIVIDUAIS Individuais'
      '   ON  (Tempitens.CODIGO = Individuais.CODITEM)  '
      '   AND  (Tempitens.CODMOVIMENTO = Individuais.CODMOVENTRADA)  '
      '   INNER JOIN PRODUTOS Produtos'
      '   ON  (Individuais.CODPRODUTO = Produtos.CODIGO)  '
      'WHERE  Movimentos.CODIGO = :CODIGO'
      'ORDER BY Individuais.BARRA ')
    Left = 101
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrEtiqueta: TDataSource
    AutoEdit = False
    DataSet = memEtiqueta
    Left = 181
    Top = 96
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
    Left = 101
    Top = 160
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
        OnPrint = ppDBBarCode1Print
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
        Size = 90
      end
      item
        Name = 'PRECO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FONE'
        DataType = ftString
        Size = 20
      end>
    Left = 101
    Top = 304
    object memEtiquetaBARRA: TStringField
      FieldName = 'BARRA'
      Size = 13
    end
    object memEtiquetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object memEtiquetaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object memEtiquetaPRECO: TStringField
      FieldName = 'PRECO'
      Size = 30
    end
    object memEtiquetaFONE: TStringField
      FieldName = 'FONE'
    end
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
    Top = 65533
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
    Top = 65533
  end
  object traFornecedor: TIBTransaction
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
    Top = 65533
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
    Left = 97
    Top = 65533
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
    Left = 33
    Top = 157
  end
  object qryCentro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCentro
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DESCRICAO FROM CENTROS'
      'WHERE CODIGO = :CODIGO')
    UniDirectional = True
    Left = 37
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrCentro: TDataSource
    DataSet = qryCentro
    Left = 37
    Top = 264
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
    Left = 101
    Top = 224
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
        OnPrint = ppDBBarCode1Print
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
    Left = 173
    Top = 216
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
    Left = 253
    Top = 192
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
        OnPrint = ppDBBarCode1Print
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
        mmLeft = 2381
        mmTop = 11377
        mmWidth = 19579
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
end
