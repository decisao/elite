object formOrcamento: TformOrcamento
  Left = 432
  Top = 155
  Width = 491
  Height = 417
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Orçamentos'
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
    Width = 483
    Height = 390
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 475
        Height = 362
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 473
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
          Top = 315
          Width = 473
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
          Left = 388
          Top = 47
          Width = 86
          Height = 268
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
          Width = 387
          Height = 268
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 387
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
            Width = 387
            Height = 227
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
            Top = 240
            Width = 387
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
                Left = 89
                Top = 0
                Width = 90
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Abrir OS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = Label16Click
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
                Caption = 'Produtos'
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
        Left = 389
        Top = 0
        Width = 86
        Height = 362
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
        Width = 389
        Height = 362
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
          Width = 387
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
          object lblCLIENTE: TLabel
            Left = 8
            Top = 48
            Width = 45
            Height = 13
            Cursor = crHandPoint
            Caption = 'Cliente'
            FocusControl = DBEdit14
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = lblCLIENTEClick
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
            TabOrder = 0
          end
          object DBEdit14: TDBEdit
            Left = 8
            Top = 64
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODCLIENTE'
            DataSource = dsrDetalhes
            TabOrder = 1
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
            DataSource = dsrCliente
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit7: TDBEdit
            Left = 216
            Top = 19
            Width = 137
            Height = 21
            DataField = 'DATA'
            DataSource = dsrDetalhes
            Enabled = False
            TabOrder = 3
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
        end
        object pgcDetalhes: TPageControl
          Left = 1
          Top = 97
          Width = 387
          Height = 264
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 2
          object TabSheet1: TTabSheet
            Caption = '&Serviços'
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 199
              Height = 13
              Caption = 'Descrição dos Materiais e Serviços'
              FocusControl = DBMemo1
            end
            object Label7: TLabel
              Left = 8
              Top = 128
              Width = 157
              Height = 13
              Caption = 'Total (Materiais e Serviços)'
              FocusControl = DBEdit2
            end
            object DBMemo1: TDBMemo
              Tag = 3
              Left = 8
              Top = 24
              Width = 345
              Height = 97
              DataField = 'SERVICOS'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit2: TDBEdit
              Tag = 2
              Left = 8
              Top = 144
              Width = 137
              Height = 21
              DataField = 'VALOR_SERVICOS'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet3: TTabSheet
            Caption = '&Opcionais'
            object Label12: TLabel
              Left = 8
              Top = 8
              Width = 344
              Height = 13
              Caption = 'Produtos e Serviços Opcionais (não incluídos no orçamento)'
              FocusControl = DBMemo2
            end
            object DBMemo2: TDBMemo
              Tag = 3
              Left = 8
              Top = 24
              Width = 337
              Height = 113
              DataField = 'OPCIONAIS'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet4: TTabSheet
            Caption = '&Condições Gerais'
            object Label13: TLabel
              Left = 8
              Top = 8
              Width = 212
              Height = 13
              Caption = 'Condições de Execução dos Serviços'
              FocusControl = or_cond1
            end
            object Label14: TLabel
              Left = 8
              Top = 112
              Width = 145
              Height = 13
              Caption = 'Condições de Pagamento'
              FocusControl = or_cond2
            end
            object SpeedButton1: TSpeedButton
              Left = 328
              Top = 51
              Width = 25
              Height = 25
              Flat = True
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888000088877777777777777778000088000000000000000778000080BF
                B0FFFFFFF0BFB078000080FBF0F00FFFF0FBF078000080BFB0F77FFFF0BFB078
                000080FBF0FFFFFFF0FBF078000080BFBF0000000FBFB078000080FBFBFBFBFB
                FBFBF078000080BFBFBFBFBFBFBFB078000080FBFBFBFBFBFBFBF078000080BF
                BFBFBFBFBFBFB078000080FBF000000000FBF078000080BF0FFFFFFFF0BFB078
                000080FB0FCCCCCCF0FBF078000080BF0FFFFFFFF0BFB078000080FB0FCCCCCC
                F0F0F078000080BF0FFFFFFFF0BFB08800008800000000000000088800008888
                88888888888888880000}
              OnClick = SpeedButton1Click
            end
            object SpeedButton2: TSpeedButton
              Left = 328
              Top = 154
              Width = 25
              Height = 25
              Flat = True
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                77777777000077788888888888888887000077000000000000000887000070BF
                B0FFFFFFF0BFB087000070FBF0F00FFFF0FBF087000070BFB0F88FFFF0BFB087
                000070FBF0FFFFFFF0FBF087000070BFBF0000000FBFB087000070FBFBFBFBFB
                FBFBF087000070BFBFBFBFBFBFBFB087000070FBFBFBFBFBFBFBF087000070BF
                BFBFBFBFBFBFB087000070FBF000000000FBF087000070BF0FFFFFFFF0BFB087
                000070FB0FCCCCCCF0FBF087000070BF0FFFFFFFF0BFB087000070FB0FCCCCCC
                F0F0F087000070BF0FFFFFFFF0BFB07700007700000000000000077700007777
                77777777777777770000}
              OnClick = SpeedButton2Click
            end
            object SpeedButton3: TSpeedButton
              Left = 328
              Top = 26
              Width = 25
              Height = 25
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333330000003333333333333333330000003333333333333333330000003800
                000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
                000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
                B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
                FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
                0000330000033333333333000000333333333333333333000000333333333333
                333333000000333333333333333333000000}
              OnClick = SpeedButton3Click
            end
            object SpeedButton4: TSpeedButton
              Left = 328
              Top = 129
              Width = 25
              Height = 25
              Flat = True
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333330000003333333333333333330000003333333333333333330000003800
                000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
                000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
                B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
                FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
                0000330000033333333333000000333333333333333333000000333333333333
                333333000000333333333333333333000000}
              OnClick = SpeedButton4Click
            end
            object or_cond1: TDBMemo
              Tag = 3
              Left = 8
              Top = 24
              Width = 313
              Height = 81
              DataField = 'CONDICOES1'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object or_cond2: TDBMemo
              Tag = 3
              Left = 8
              Top = 128
              Width = 313
              Height = 81
              DataField = 'CONDICOES2'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet2: TTabSheet
            Caption = '&Totais'
            object Label8: TLabel
              Left = 8
              Top = 8
              Width = 85
              Height = 13
              Cursor = crHandPoint
              Caption = 'Total dos Itens'
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
              Top = 112
              Width = 108
              Height = 14
              Caption = 'Total do Orçamento'
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
              Top = 56
              Width = 165
              Height = 13
              Caption = 'Total de Materiais e Serviços'
              FocusControl = DBEdit5
            end
            object Label11: TLabel
              Left = 192
              Top = 32
              Width = 87
              Height = 13
              Caption = 'Valor a deduzir'
              FocusControl = DBEdit6
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 24
              Width = 137
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
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 128
              Width = 329
              Height = 67
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_TOTAL'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -48
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 72
              Width = 137
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
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 192
              Top = 72
              Width = 137
              Height = 21
              DataField = 'DESCONTO'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit8: TDBEdit
              Left = 192
              Top = 48
              Width = 137
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DESCONTOTXT'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet5: TTabSheet
            Caption = 'Aprovação'
            ImageIndex = 4
            object Label42: TLabel
              Left = 176
              Top = 2
              Width = 91
              Height = 13
              Caption = 'Quem aprovou?'
              FocusControl = DBEdit33
            end
            object Label43: TLabel
              Left = 176
              Top = 42
              Width = 91
              Height = 13
              Caption = 'Data aprovação'
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 8
              Top = 2
              Width = 153
              Height = 81
              Caption = ' Cliente Aprovou? '
              DataField = 'AUTORIZADO'
              DataSource = dsrDetalhes
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 0
              Values.Strings = (
                'S'
                'N')
            end
            object DBEdit33: TDBEdit
              Left = 176
              Top = 18
              Width = 153
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUEM_AUTORIZOU'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBDateEdit2: TDBDateEdit
              Left = 176
              Top = 56
              Width = 153
              Height = 21
              DataField = 'DATA_AUTORIZADO'
              DataSource = dsrDetalhes
              DialogTitle = 'Selecione a Data'
              NumGlyphs = 2
              TabOrder = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Retorno'
            ImageIndex = 5
            object Label16: TLabel
              Left = 176
              Top = 2
              Width = 56
              Height = 13
              Caption = 'Falar com'
              FocusControl = DBEdit9
            end
            object Label17: TLabel
              Left = 176
              Top = 42
              Width = 73
              Height = 13
              Caption = 'Data retorno'
            end
            object Label18: TLabel
              Left = 9
              Top = 95
              Width = 74
              Height = 13
              Caption = 'Observações'
            end
            object DBRadioGroup2: TDBRadioGroup
              Left = 8
              Top = 2
              Width = 153
              Height = 81
              Caption = ' Retornar Ligação? '
              DataField = 'RETORNO'
              DataSource = dsrDetalhes
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 0
              Values.Strings = (
                'S'
                'N')
            end
            object DBEdit9: TDBEdit
              Left = 176
              Top = 18
              Width = 153
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FALAR_COM'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBDateEdit1: TDBDateEdit
              Left = 176
              Top = 56
              Width = 153
              Height = 21
              DataField = 'DATA_RETORNO'
              DataSource = dsrDetalhes
              DialogTitle = 'Selecione a Data'
              NumGlyphs = 2
              TabOrder = 2
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
            end
            object DBMemo3: TDBMemo
              Left = 8
              Top = 110
              Width = 321
              Height = 91
              DataField = 'PROBLEMA'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
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
    Left = 556
    Top = 321
  end
  object PrinterMenu: TPopupMenu
    Left = 556
    Top = 377
    object Grade1: TMenuItem
      Caption = '&Grade'
      OnClick = Grade1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Imprimiroramento1: TMenuItem
      Caption = '&Orçcamento selecionado'
      OnClick = Imprimiroramento1Click
    end
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 636
    Top = 321
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 636
    Top = 377
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 636
    Top = 433
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
    Left = 556
    Top = 433
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
    Left = 708
    Top = 321
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MOVIMENTOS"."CODIGO"'
      Required = True
    end
    object qryDetalhesES: TSmallintField
      FieldName = 'ES'
      Origin = '"MOVIMENTOS"."ES"'
      Required = True
    end
    object qryDetalhesTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = '"MOVIMENTOS"."TIPO"'
      Required = True
    end
    object qryDetalhesCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = '"MOVIMENTOS"."CODCLIENTE"'
      Required = True
    end
    object qryDetalhesDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = '"MOVIMENTOS"."DATA"'
      Required = True
    end
    object qryDetalhesEQUIPAMENTO: TIBStringField
      FieldName = 'EQUIPAMENTO'
      Origin = '"MOVIMENTOS"."EQUIPAMENTO"'
      Size = 1024
    end
    object qryDetalhesPROBLEMA: TIBStringField
      FieldName = 'PROBLEMA'
      Origin = '"MOVIMENTOS"."PROBLEMA"'
      Size = 1024
    end
    object qryDetalhesSOLICITANTE: TIBStringField
      FieldName = 'SOLICITANTE'
      Origin = '"MOVIMENTOS"."SOLICITANTE"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesATENDIMENTO: TIBStringField
      FieldName = 'ATENDIMENTO'
      Origin = '"MOVIMENTOS"."ATENDIMENTO"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesSERVICOS: TIBStringField
      FieldName = 'SERVICOS'
      Origin = '"MOVIMENTOS"."SERVICOS"'
      Size = 1024
    end
    object qryDetalhesVALOR_SERVICOS: TIBBCDField
      FieldName = 'VALOR_SERVICOS'
      Origin = '"MOVIMENTOS"."VALOR_SERVICOS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesOPCIONAIS: TIBStringField
      FieldName = 'OPCIONAIS'
      Origin = '"MOVIMENTOS"."OPCIONAIS"'
      Size = 1024
    end
    object qryDetalhesCONDICOES1: TIBStringField
      FieldName = 'CONDICOES1'
      Origin = '"MOVIMENTOS"."CONDICOES1"'
      Size = 1024
    end
    object qryDetalhesCONDICOES2: TIBStringField
      FieldName = 'CONDICOES2'
      Origin = '"MOVIMENTOS"."CONDICOES2"'
      Size = 1024
    end
    object qryDetalhesVALOR_ITENS: TIBBCDField
      FieldName = 'VALOR_ITENS'
      Origin = '"MOVIMENTOS"."VALOR_ITENS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"MOVIMENTOS"."DESCONTO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesVALOR_PRODUTOS: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_PRODUTOS'
      Origin = '"MOVIMENTOS"."VALOR_PRODUTOS"'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object qryDetalhesVALOR_ICMS: TIBBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"MOVIMENTOS"."VALOR_ICMS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesVALOR_TOTAL: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      Origin = '"MOVIMENTOS"."VALOR_TOTAL"'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object qryDetalhesOBSERVACOES: TIBStringField
      FieldName = 'OBSERVACOES'
      Origin = '"MOVIMENTOS"."OBSERVACOES"'
      Size = 2048
    end
    object qryDetalhesNOTA_NUMERO: TIntegerField
      FieldName = 'NOTA_NUMERO'
      Origin = '"MOVIMENTOS"."NOTA_NUMERO"'
    end
    object qryDetalhesNOTA_DATAEMISSAO: TDateTimeField
      FieldName = 'NOTA_DATAEMISSAO'
      Origin = '"MOVIMENTOS"."NOTA_DATAEMISSAO"'
    end
    object qryDetalhesNOTA_CODNATUOPER: TIBStringField
      FieldName = 'NOTA_CODNATUOPER'
      Origin = '"MOVIMENTOS"."NOTA_CODNATUOPER"'
      FixedChar = True
      Size = 5
    end
    object qryDetalhesNOTA_CODTRANSPORTADOR: TIntegerField
      FieldName = 'NOTA_CODTRANSPORTADOR'
      Origin = '"MOVIMENTOS"."NOTA_CODTRANSPORTADOR"'
    end
    object qryDetalhesNOTA_PLACAVEICULO: TIBStringField
      FieldName = 'NOTA_PLACAVEICULO'
      Origin = '"MOVIMENTOS"."NOTA_PLACAVEICULO"'
      FixedChar = True
      Size = 10
    end
    object qryDetalhesNOTA_UFVEICULO: TIBStringField
      FieldName = 'NOTA_UFVEICULO'
      Origin = '"MOVIMENTOS"."NOTA_UFVEICULO"'
      FixedChar = True
      Size = 2
    end
    object qryDetalhesNOTA_FRETE: TSmallintField
      FieldName = 'NOTA_FRETE'
      Origin = '"MOVIMENTOS"."NOTA_FRETE"'
    end
    object qryDetalhesNOTA_VALOR_FRETE: TIBBCDField
      FieldName = 'NOTA_VALOR_FRETE'
      Origin = '"MOVIMENTOS"."NOTA_VALOR_FRETE"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_VALOR_SEGURO: TIBBCDField
      FieldName = 'NOTA_VALOR_SEGURO'
      Origin = '"MOVIMENTOS"."NOTA_VALOR_SEGURO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_VALOR_OUTROS: TIBBCDField
      FieldName = 'NOTA_VALOR_OUTROS'
      Origin = '"MOVIMENTOS"."NOTA_VALOR_OUTROS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_QUANTIDADE: TIBBCDField
      FieldName = 'NOTA_QUANTIDADE'
      Origin = '"MOVIMENTOS"."NOTA_QUANTIDADE"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_ESPECIE: TIBStringField
      FieldName = 'NOTA_ESPECIE'
      Origin = '"MOVIMENTOS"."NOTA_ESPECIE"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesNOTA_MARCA: TIBStringField
      FieldName = 'NOTA_MARCA'
      Origin = '"MOVIMENTOS"."NOTA_MARCA"'
      FixedChar = True
    end
    object qryDetalhesNOTA_VOLNUM: TIntegerField
      FieldName = 'NOTA_VOLNUM'
      Origin = '"MOVIMENTOS"."NOTA_VOLNUM"'
    end
    object qryDetalhesNOTA_PESOBRUTO: TIBBCDField
      FieldName = 'NOTA_PESOBRUTO'
      Origin = '"MOVIMENTOS"."NOTA_PESOBRUTO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_PESOLIQUIDO: TIBBCDField
      FieldName = 'NOTA_PESOLIQUIDO'
      Origin = '"MOVIMENTOS"."NOTA_PESOLIQUIDO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_DADOSADICIONAIS: TIBStringField
      FieldName = 'NOTA_DADOSADICIONAIS'
      Origin = '"MOVIMENTOS"."NOTA_DADOSADICIONAIS"'
      Size = 1024
    end
    object qryDetalhesCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = '"MOVIMENTOS"."CODVENDEDOR"'
    end
    object qryDetalhesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"MOVIMENTOS"."STATUS"'
      Required = True
      FixedChar = True
    end
    object qryDetalhesCONDICAO: TIBStringField
      FieldName = 'CONDICAO'
      Origin = '"MOVIMENTOS"."CONDICAO"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = '"MOVIMENTOS"."DATAINICIO"'
    end
    object qryDetalhesDATATERMINO: TDateTimeField
      FieldName = 'DATATERMINO'
      Origin = '"MOVIMENTOS"."DATATERMINO"'
    end
    object qryDetalhesICMSSIMPLES: TIBStringField
      FieldName = 'ICMSSIMPLES'
      Origin = '"MOVIMENTOS"."ICMSSIMPLES"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesICMSSIMPALIQ: TIBBCDField
      FieldName = 'ICMSSIMPALIQ'
      Origin = '"MOVIMENTOS"."ICMSSIMPALIQ"'
      Precision = 9
      Size = 4
    end
    object qryDetalhesISSALIQ: TIBBCDField
      FieldName = 'ISSALIQ'
      Origin = '"MOVIMENTOS"."ISSALIQ"'
      Precision = 9
      Size = 4
    end
    object qryDetalhesVALOR_ISS: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_ISS'
      Origin = '"MOVIMENTOS"."VALOR_ISS"'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object qryDetalhesNOTA_IESUBST: TIBStringField
      FieldName = 'NOTA_IESUBST'
      Origin = '"MOVIMENTOS"."NOTA_IESUBST"'
      FixedChar = True
    end
    object qryDetalhesNOTA_DATASAIDA: TDateTimeField
      FieldName = 'NOTA_DATASAIDA'
      Origin = '"MOVIMENTOS"."NOTA_DATASAIDA"'
    end
    object qryDetalhesNOTA_BASEICMSSUBST: TIBBCDField
      FieldName = 'NOTA_BASEICMSSUBST'
      Origin = '"MOVIMENTOS"."NOTA_BASEICMSSUBST"'
      Precision = 9
      Size = 4
    end
    object qryDetalhesNOTA_VALORICMSSUBST: TIBBCDField
      FieldName = 'NOTA_VALORICMSSUBST'
      Origin = '"MOVIMENTOS"."NOTA_VALORICMSSUBST"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"MOVIMENTOS"."VALOR_IPI"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesCODVENDEDOR_ABRE: TIntegerField
      FieldName = 'CODVENDEDOR_ABRE'
      Origin = '"MOVIMENTOS"."CODVENDEDOR_ABRE"'
    end
    object qryDetalhesDESCONTOTXT: TIBStringField
      FieldName = 'DESCONTOTXT'
      Origin = '"MOVIMENTOS"."DESCONTOTXT"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesCODTECNICO: TIntegerField
      FieldName = 'CODTECNICO'
      Origin = '"MOVIMENTOS"."CODTECNICO"'
    end
    object qryDetalhesCODRESPONSAVEL: TIntegerField
      FieldName = 'CODRESPONSAVEL'
      Origin = '"MOVIMENTOS"."CODRESPONSAVEL"'
    end
    object qryDetalhesCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = '"MOVIMENTOS"."CODMARCA"'
    end
    object qryDetalhesCODMODELO: TIntegerField
      FieldName = 'CODMODELO'
      Origin = '"MOVIMENTOS"."CODMODELO"'
    end
    object qryDetalhesCODDEFEITO: TIntegerField
      FieldName = 'CODDEFEITO'
      Origin = '"MOVIMENTOS"."CODDEFEITO"'
    end
    object qryDetalhesGARANTIA: TIBStringField
      FieldName = 'GARANTIA'
      Origin = '"MOVIMENTOS"."GARANTIA"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"MOVIMENTOS"."SERIE"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesACESSORIOS: TIBStringField
      FieldName = 'ACESSORIOS'
      Origin = '"MOVIMENTOS"."ACESSORIOS"'
      FixedChar = True
      Size = 50
    end
    object qryDetalhesDATAPREVISAO: TDateTimeField
      FieldName = 'DATAPREVISAO'
      Origin = '"MOVIMENTOS"."DATAPREVISAO"'
    end
    object qryDetalhesCONDICAOEXTERNA: TIBStringField
      FieldName = 'CONDICAOEXTERNA'
      Origin = '"MOVIMENTOS"."CONDICAOEXTERNA"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesPRIORIDADE: TIntegerField
      FieldName = 'PRIORIDADE'
      Origin = '"MOVIMENTOS"."PRIORIDADE"'
    end
    object qryDetalhesEMPRESTIMO: TIBStringField
      FieldName = 'EMPRESTIMO'
      Origin = '"MOVIMENTOS"."EMPRESTIMO"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesDATAFECHAMENTO: TDateTimeField
      FieldName = 'DATAFECHAMENTO'
      Origin = '"MOVIMENTOS"."DATAFECHAMENTO"'
    end
    object qryDetalhesUSUARIOFECHAMENTO: TIBStringField
      FieldName = 'USUARIOFECHAMENTO'
      Origin = '"MOVIMENTOS"."USUARIOFECHAMENTO"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesCODEMPRESA: TIntegerField
      FieldName = 'CODEMPRESA'
      Origin = '"MOVIMENTOS"."CODEMPRESA"'
    end
    object qryDetalhesVALOR_COMISSAO: TIBBCDField
      FieldName = 'VALOR_COMISSAO'
      Origin = '"MOVIMENTOS"."VALOR_COMISSAO"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesECF: TIBStringField
      FieldName = 'ECF'
      Origin = '"MOVIMENTOS"."ECF"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesOSTIPO: TIntegerField
      FieldName = 'OSTIPO'
      Origin = '"MOVIMENTOS"."OSTIPO"'
      Required = True
    end
    object qryDetalhesVALOR_IPI_PRODUTOS: TIBBCDField
      FieldName = 'VALOR_IPI_PRODUTOS'
      Origin = '"MOVIMENTOS"."VALOR_IPI_PRODUTOS"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesTOTAL_IPI: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL_IPI'
      Origin = '"MOVIMENTOS"."TOTAL_IPI"'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryDetalhesNOTA_BASEICMS: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'NOTA_BASEICMS'
      Origin = '"MOVIMENTOS"."NOTA_BASEICMS"'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryDetalhesNOTA_VALOR_TOTAL: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'NOTA_VALOR_TOTAL'
      Origin = '"MOVIMENTOS"."NOTA_VALOR_TOTAL"'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryDetalhesVALOR_RATEIO_CUSTO: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_RATEIO_CUSTO'
      Origin = '"MOVIMENTOS"."VALOR_RATEIO_CUSTO"'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryDetalhesNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"MOVIMENTOS"."NOME_VENDEDOR"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesCODCENTRO: TIntegerField
      FieldName = 'CODCENTRO'
      Origin = '"MOVIMENTOS"."CODCENTRO"'
    end
    object qryDetalhesTEMPO_CHEGADA: TFloatField
      FieldName = 'TEMPO_CHEGADA'
      Origin = '"MOVIMENTOS"."TEMPO_CHEGADA"'
    end
    object qryDetalhesTEMPO_CONCLUSAO: TFloatField
      FieldName = 'TEMPO_CONCLUSAO'
      Origin = '"MOVIMENTOS"."TEMPO_CONCLUSAO"'
    end
    object qryDetalhesTEMPO_LANCAMENTO: TFloatField
      FieldName = 'TEMPO_LANCAMENTO'
      Origin = '"MOVIMENTOS"."TEMPO_LANCAMENTO"'
    end
    object qryDetalhesTEMPO_CICLO: TFloatField
      FieldName = 'TEMPO_CICLO'
      Origin = '"MOVIMENTOS"."TEMPO_CICLO"'
    end
    object qryDetalhesTEMPO_TECNICOS: TFloatField
      FieldName = 'TEMPO_TECNICOS'
      Origin = '"MOVIMENTOS"."TEMPO_TECNICOS"'
    end
    object qryDetalhesTEMPO_FORADOPRAZO: TFloatField
      FieldName = 'TEMPO_FORADOPRAZO'
      Origin = '"MOVIMENTOS"."TEMPO_FORADOPRAZO"'
    end
    object qryDetalhesDATAESTORNO: TDateTimeField
      FieldName = 'DATAESTORNO'
      Origin = '"MOVIMENTOS"."DATAESTORNO"'
    end
    object qryDetalhesUSUARIOESTORNO: TIBStringField
      FieldName = 'USUARIOESTORNO'
      Origin = '"MOVIMENTOS"."USUARIOESTORNO"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesFECHA_DATA_FLUXO: TDateTimeField
      FieldName = 'FECHA_DATA_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_DATA_FLUXO"'
    end
    object qryDetalhesFECHA_SEMANA_FLUXO: TIntegerField
      FieldName = 'FECHA_SEMANA_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_SEMANA_FLUXO"'
    end
    object qryDetalhesFECHA_MES_FLUXO: TIntegerField
      FieldName = 'FECHA_MES_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_MES_FLUXO"'
    end
    object qryDetalhesFECHA_TRIMESTRE_FLUXO: TIntegerField
      FieldName = 'FECHA_TRIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_TRIMESTRE_FLUXO"'
    end
    object qryDetalhesFECHA_QUADRIMESTRE_FLUXO: TIntegerField
      FieldName = 'FECHA_QUADRIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_QUADRIMESTRE_FLUXO"'
    end
    object qryDetalhesFECHA_SEMESTRE_FLUXO: TIntegerField
      FieldName = 'FECHA_SEMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_SEMESTRE_FLUXO"'
    end
    object qryDetalhesFECHA_ANO_FLUXO: TIntegerField
      FieldName = 'FECHA_ANO_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_ANO_FLUXO"'
    end
    object qryDetalhesFECHA_STR_SEMANA_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_SEMANA_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_SEMANA_FLUXO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesFECHA_STR_MES_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_MES_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_MES_FLUXO"'
      FixedChar = True
    end
    object qryDetalhesFECHA_STR_BIMESTRE_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_BIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_BIMESTRE_FLUXO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesFECHA_STR_TRIMESTRE_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_TRIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_TRIMESTRE_FLUXO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesFECHA_STR_QUADRIMESTRE_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_QUADRIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_QUADRIMESTRE_FLUXO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesFECHA_STR_SEMESTRE_FLUXO: TIBStringField
      FieldName = 'FECHA_STR_SEMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_STR_SEMESTRE_FLUXO"'
      FixedChar = True
      Size = 30
    end
    object qryDetalhesFECHA_BIMESTRE_FLUXO: TIntegerField
      FieldName = 'FECHA_BIMESTRE_FLUXO'
      Origin = '"MOVIMENTOS"."FECHA_BIMESTRE_FLUXO"'
    end
    object qryDetalhesDEFEITO_DETECTADO: TIBStringField
      FieldName = 'DEFEITO_DETECTADO'
      Origin = '"MOVIMENTOS"."DEFEITO_DETECTADO"'
      FixedChar = True
      Size = 60
    end
    object qryDetalhesSERVICO_REALIZAR: TIBStringField
      FieldName = 'SERVICO_REALIZAR'
      Origin = '"MOVIMENTOS"."SERVICO_REALIZAR"'
      FixedChar = True
      Size = 60
    end
    object qryDetalhesAUTORIZADO: TIBStringField
      FieldName = 'AUTORIZADO'
      Origin = '"MOVIMENTOS"."AUTORIZADO"'
      OnChange = qryDetalhesAUTORIZADOChange
      FixedChar = True
      Size = 1
    end
    object qryDetalhesDATA_AUTORIZADO: TDateTimeField
      FieldName = 'DATA_AUTORIZADO'
      Origin = '"MOVIMENTOS"."DATA_AUTORIZADO"'
    end
    object qryDetalhesQUEM_AUTORIZOU: TIBStringField
      FieldName = 'QUEM_AUTORIZOU'
      Origin = '"MOVIMENTOS"."QUEM_AUTORIZOU"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesDATA_ENTREGA: TDateTimeField
      FieldName = 'DATA_ENTREGA'
      Origin = '"MOVIMENTOS"."DATA_ENTREGA"'
    end
    object qryDetalhesQUEM_ENTREGOU: TIBStringField
      FieldName = 'QUEM_ENTREGOU'
      Origin = '"MOVIMENTOS"."QUEM_ENTREGOU"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesQUEM_RECEBEU: TIBStringField
      FieldName = 'QUEM_RECEBEU'
      Origin = '"MOVIMENTOS"."QUEM_RECEBEU"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesNOTA_ENTRADA: TIntegerField
      FieldName = 'NOTA_ENTRADA'
      Origin = '"MOVIMENTOS"."NOTA_ENTRADA"'
    end
    object qryDetalhesCODPARCEIRO: TIntegerField
      FieldName = 'CODPARCEIRO'
      Origin = '"MOVIMENTOS"."CODPARCEIRO"'
    end
    object qryDetalhesPERCCOMIS_CALCULO: TIBStringField
      FieldName = 'PERCCOMIS_CALCULO'
      Origin = '"MOVIMENTOS"."PERCCOMIS_CALCULO"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesPERCCOMIS_PROD: TIBBCDField
      FieldName = 'PERCCOMIS_PROD'
      Origin = '"MOVIMENTOS"."PERCCOMIS_PROD"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesPERCCOMIS_PECA: TIBBCDField
      FieldName = 'PERCCOMIS_PECA'
      Origin = '"MOVIMENTOS"."PERCCOMIS_PECA"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesPERCCOMIS_SERV: TIBBCDField
      FieldName = 'PERCCOMIS_SERV'
      Origin = '"MOVIMENTOS"."PERCCOMIS_SERV"'
      Precision = 9
      Size = 2
    end
    object qryDetalhesNO_VENDA: TIBStringField
      FieldName = 'NO_VENDA'
      Origin = '"MOVIMENTOS"."NO_VENDA"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesNO_ESTOQUE: TIBStringField
      FieldName = 'NO_ESTOQUE'
      Origin = '"MOVIMENTOS"."NO_ESTOQUE"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesNO_ICMS: TIBStringField
      FieldName = 'NO_ICMS'
      Origin = '"MOVIMENTOS"."NO_ICMS"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesNO_IPI: TIBStringField
      FieldName = 'NO_IPI'
      Origin = '"MOVIMENTOS"."NO_IPI"'
      FixedChar = True
      Size = 1
    end
    object qryDetalhesRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"MOVIMENTOS"."RETORNO"'
      OnChange = qryDetalhesRETORNOChange
      FixedChar = True
      Size = 1
    end
    object qryDetalhesDATA_RETORNO: TDateTimeField
      FieldName = 'DATA_RETORNO'
      Origin = '"MOVIMENTOS"."DATA_RETORNO"'
    end
    object qryDetalhesFALAR_COM: TIBStringField
      FieldName = 'FALAR_COM'
      Origin = '"MOVIMENTOS"."FALAR_COM"'
      FixedChar = True
      Size = 40
    end
    object qryDetalhesQUEM_AGENDOU: TIBStringField
      FieldName = 'QUEM_AGENDOU'
      Origin = '"MOVIMENTOS"."QUEM_AGENDOU"'
      FixedChar = True
      Size = 40
    end
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
      '  DESCONTOTXT = :DESCONTOTXT,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  OSTIPO = :OSTIPO,'
      '  CODCENTRO = :CODCENTRO,'
      '  AUTORIZADO = :AUTORIZADO,'
      '  DATA_AUTORIZADO = :DATA_AUTORIZADO,'
      '  QUEM_AUTORIZOU = :QUEM_AUTORIZOU,'
      '  RETORNO = :RETORNO,'
      '  DATA_RETORNO = :DATA_RETORNO,'
      '  FALAR_COM = :FALAR_COM,'
      '  QUEM_AGENDOU = :QUEM_AGENDOU'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into MOVIMENTOS('
      '  CODIGO,'
      '  ES,'
      '  TIPO,'
      '  CODCLIENTE,'
      '  DATA,'
      '  EQUIPAMENTO,'
      '  PROBLEMA,'
      '  SOLICITANTE,'
      '  ATENDIMENTO,'
      '  SERVICOS,'
      '  VALOR_SERVICOS,'
      '  OPCIONAIS,'
      '  CONDICOES1,'
      '  CONDICOES2,'
      '  VALOR_ITENS,'
      '  DESCONTO,'
      '  VALOR_ICMS,'
      '  OBSERVACOES,'
      '  NOTA_NUMERO,'
      '  NOTA_DATAEMISSAO,'
      '  NOTA_CODNATUOPER,'
      '  NOTA_CODTRANSPORTADOR,'
      '  NOTA_PLACAVEICULO,'
      '  NOTA_UFVEICULO,'
      '  NOTA_FRETE,'
      '  NOTA_VALOR_FRETE,'
      '  NOTA_VALOR_SEGURO,'
      '  NOTA_VALOR_OUTROS,'
      '  NOTA_QUANTIDADE,'
      '  NOTA_ESPECIE,'
      '  NOTA_MARCA,'
      '  NOTA_VOLNUM,'
      '  NOTA_PESOBRUTO,'
      '  NOTA_PESOLIQUIDO,'
      '  NOTA_DADOSADICIONAIS,'
      '  DESCONTOTXT,'
      '  PRIORIDADE,'
      '  CODEMPRESA,'
      '  VALOR_COMISSAO,'
      '  OSTIPO,'
      '  CODCENTRO)'
      'values ('
      '  :CODIGO,'
      '  :ES,'
      '  :TIPO,'
      '  :CODCLIENTE,'
      '  :DATA,'
      '  :EQUIPAMENTO,'
      '  :PROBLEMA,'
      '  :SOLICITANTE,'
      '  :ATENDIMENTO,'
      '  :SERVICOS,'
      '  :VALOR_SERVICOS,'
      '  :OPCIONAIS,'
      '  :CONDICOES1,'
      '  :CONDICOES2,'
      '  :VALOR_ITENS,'
      '  :DESCONTO,'
      '  :VALOR_ICMS,'
      '  :OBSERVACOES,'
      '  :NOTA_NUMERO,'
      '  :NOTA_DATAEMISSAO,'
      '  :NOTA_CODNATUOPER,'
      '  :NOTA_CODTRANSPORTADOR,'
      '  :NOTA_PLACAVEICULO,'
      '  :NOTA_UFVEICULO,'
      '  :NOTA_FRETE,'
      '  :NOTA_VALOR_FRETE,'
      '  :NOTA_VALOR_SEGURO,'
      '  :NOTA_VALOR_OUTROS,'
      '  :NOTA_QUANTIDADE,'
      '  :NOTA_ESPECIE,'
      '  :NOTA_MARCA,'
      '  :NOTA_VOLNUM,'
      '  :NOTA_PESOBRUTO,'
      '  :NOTA_PESOLIQUIDO,'
      '  :NOTA_DADOSADICIONAIS,'
      '  :DESCONTOTXT,'
      '  :PRIORIDADE,'
      '  :CODEMPRESA,'
      '  :VALOR_COMISSAO,'
      '  :OSTIPO,'
      '  :CODCENTRO)'
      ''
      '')
    DeleteSQL.Strings = (
      'delete from MOVIMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 708
    Top = 433
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 708
    Top = 377
  end
  object qryCliente: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCliente
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT NOME FROM CLIENTES'
      'WHERE CODIGO = :CODIGO')
    UniDirectional = True
    Left = 429
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrCliente: TDataSource
    DataSet = qryCliente
    Left = 429
    Top = 376
  end
  object qryDelete: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDelete
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'DELETE FROM TEMPITENS WHERE CODMOVIMENTO = :cod')
    UniDirectional = True
    Left = 485
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object spOS: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traOS
    AutoCalcFields = False
    StoredProcName = 'ORCAMENTO_OS'
    Left = 485
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMOVIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TODOS'
        ParamType = ptOutput
      end>
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
    Left = 633
    Top = 245
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
    Left = 705
    Top = 245
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
    Left = 425
    Top = 277
  end
  object traOS: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 489
    Top = 277
  end
  object traDelete: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 489
    Top = 381
  end
end
