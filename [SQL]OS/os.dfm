object formOS: TformOS
  Left = 282
  Top = 159
  Width = 679
  Height = 520
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Movimentos (OS e Vendas)'
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
    Width = 671
    Height = 486
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 663
        Height = 458
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 661
          Height = 46
          BoundLines = [blTop, blLeft, blRight]
          object ToolWindow971: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 646
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
          Top = 336
          Width = 661
          Height = 121
          BoundLines = [blBottom, blLeft, blRight]
          Position = dpBottom
          object dataini: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 116
            ClientAreaWidth = 646
            DockPos = 0
            FullSize = True
            TabOrder = 0
            object Label3: TLabel
              Left = 4
              Top = 7
              Width = 83
              Height = 13
              Caption = 'S&elecionar por'
              Transparent = True
            end
            object Label4: TLabel
              Left = 135
              Top = 7
              Width = 162
              Height = 13
              Caption = '&Que satisfaçam a expressão'
              Transparent = True
            end
            object cmbSelecionar: TComboBox
              Tag = 1
              Left = 3
              Top = 22
              Width = 118
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbSelecionarChange
            end
            object edtSelecionar: TEdit
              Left = 134
              Top = 22
              Width = 499
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = edtSelecionarKeyPress
            end
            object ckPrioridade: TCheckBox
              Left = 480
              Top = 3
              Width = 150
              Height = 17
              Cursor = crHandPoint
              Caption = 'OS abertas, prioridade'
              TabOrder = 2
              OnClick = ckPrioridadeClick
            end
            object ckTudo: TCheckBox
              Left = 320
              Top = 3
              Width = 150
              Height = 17
              Cursor = crHandPoint
              Caption = 'Somente OS e Vendas'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = ckPrioridadeClick
            end
            object Panel8: TPanel
              Left = 430
              Top = 49
              Width = 210
              Height = 62
              BevelOuter = bvLowered
              Color = clInfoBk
              TabOrder = 4
              object Label14: TLabel
                Left = 7
                Top = 21
                Width = 84
                Height = 13
                Caption = 'Fecham. inicial'
                Transparent = True
              end
              object Label20: TLabel
                Left = 111
                Top = 21
                Width = 76
                Height = 13
                Caption = 'Fecham. final'
                Transparent = True
              end
              object DateEdit5: TDateEdit
                Left = 6
                Top = 35
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 0
              end
              object DateEdit6: TDateEdit
                Left = 110
                Top = 36
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 1
              end
              object ckFechamento: TCheckBox
                Left = 6
                Top = 3
                Width = 203
                Height = 17
                Cursor = crHandPoint
                Caption = 'Filtrar por Data de Fechamento'
                Color = clInfoBk
                ParentColor = False
                TabOrder = 2
              end
            end
            object Panel11: TPanel
              Left = 215
              Top = 49
              Width = 210
              Height = 62
              BevelOuter = bvLowered
              Color = clInfoBk
              TabOrder = 5
              object Label48: TLabel
                Left = 7
                Top = 21
                Width = 66
                Height = 13
                Caption = 'Prev. inicial'
                Transparent = True
              end
              object Label49: TLabel
                Left = 111
                Top = 21
                Width = 58
                Height = 13
                Caption = 'Prev. final'
                Transparent = True
              end
              object DateEdit3: TDateEdit
                Left = 6
                Top = 35
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 0
              end
              object DateEdit4: TDateEdit
                Left = 110
                Top = 36
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 1
              end
              object ckPrevisao: TCheckBox
                Left = 6
                Top = 3
                Width = 195
                Height = 17
                Cursor = crHandPoint
                Caption = 'Filtrar por Previsão Atend.'
                TabOrder = 2
              end
            end
            object Panel12: TPanel
              Left = -1
              Top = 49
              Width = 210
              Height = 62
              BevelOuter = bvLowered
              Color = clInfoBk
              TabOrder = 6
              object Label50: TLabel
                Left = 7
                Top = 21
                Width = 86
                Height = 13
                Caption = 'Abertura inicial'
                Transparent = True
              end
              object Label51: TLabel
                Left = 111
                Top = 21
                Width = 78
                Height = 13
                Caption = 'Abertura final'
                Transparent = True
              end
              object DateEdit2: TDateEdit
                Left = 110
                Top = 35
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 0
              end
              object DateEdit1: TDateEdit
                Left = 6
                Top = 36
                Width = 99
                Height = 21
                DialogTitle = 'Selecione uma Data'
                NumGlyphs = 2
                StartOfWeek = Sun
                Weekends = [Sun, Sat]
                TabOrder = 1
              end
              object ckAbertura: TCheckBox
                Left = 6
                Top = 3
                Width = 195
                Height = 17
                Cursor = crHandPoint
                Caption = 'Filtrar por Data de Abertura'
                TabOrder = 2
              end
            end
          end
        end
        object Dock972: TDock97
          Left = 576
          Top = 47
          Width = 86
          Height = 289
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
              Caption = '&Abrir OS'
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
              DropdownMenu = PrintMenu
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
          Width = 575
          Height = 289
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 575
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
            Width = 575
            Height = 248
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
            Top = 261
            Width = 575
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
              object btnReceber: TToolbarButton97
                Left = 129
                Top = 0
                Width = 104
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'A Receber'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = Label13Click
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnLancamentos: TToolbarButton97
                Left = 0
                Top = 0
                Width = 129
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Lançar && Baixar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = lbLancamentoClick
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
        Left = 577
        Top = 0
        Width = 86
        Height = 458
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
            Top = 180
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
            Top = 186
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Estornar'
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
          object btnVoltar: TToolbarButton97
            Left = 0
            Top = 120
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Voltar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageIndex = 11
            Images = dmoPrincipal.imgBotoes
            Layout = blGlyphTop
            Opaque = False
            ParentFont = False
            Visible = False
            OnClick = btnCancelarClick
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
          end
        end
      end
      object panDados: TPanel
        Left = 0
        Top = 0
        Width = 577
        Height = 458
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
          Width = 575
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
            Left = 369
            Top = 3
            Width = 27
            Height = 13
            Caption = 'Data'
            FocusControl = DBEdit7
          end
          object Label19: TLabel
            Left = 72
            Top = 3
            Width = 36
            Height = 13
            Caption = 'Status'
            FocusControl = DBEdit9
          end
          object Label18: TLabel
            Left = 369
            Top = 47
            Width = 124
            Height = 13
            Caption = 'Previsão atendimento'
          end
          object Label7: TLabel
            Left = 273
            Top = 3
            Width = 58
            Height = 13
            Caption = 'Prioridade'
            FocusControl = DBEdit7
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 19
            Width = 57
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
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODCLIENTE'
            DataSource = dsrDetalhes
            TabOrder = 1
            OnEnter = DBEdit14Enter
            OnExit = edtPesquisarExit
          end
          object DBEdit15: TDBEdit
            Left = 72
            Top = 64
            Width = 281
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
            Left = 368
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
          object DBEdit9: TDBEdit
            Left = 72
            Top = 19
            Width = 169
            Height = 21
            TabStop = False
            Color = clBtnShadow
            DataField = 'STATUS'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit18: TDBEdit
            Left = 368
            Top = 63
            Width = 137
            Height = 21
            DataField = 'DATAPREVISAO'
            DataSource = dsrDetalhes
            TabOrder = 5
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBComboBox1: TDBComboBox
            Left = 272
            Top = 18
            Width = 57
            Height = 21
            DataField = 'PRIORIDADE'
            DataSource = dsrDetalhes
            ItemHeight = 13
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
            TabOrder = 6
          end
        end
        object pgcDetalhes: TPageControl
          Left = 1
          Top = 97
          Width = 575
          Height = 360
          ActivePage = tbsOS
          Align = alClient
          TabOrder = 2
          object tbsOS: TTabSheet
            Caption = 'Solicitação'
            ImageIndex = 4
            object Label17: TLabel
              Left = 272
              Top = 2
              Width = 59
              Height = 13
              Caption = 'Solicitante'
              FocusControl = DBEdit8
            end
            object Label21: TLabel
              Left = 8
              Top = 3
              Width = 115
              Height = 13
              Cursor = crHandPoint
              Caption = 'Quem abriu a OS?'
              Enabled = False
              FocusControl = DBEdit10
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label21Click
            end
            object Label26: TLabel
              Left = 9
              Top = 90
              Width = 150
              Height = 13
              Caption = 'ESN/IMEI/DEC/HEX/Serial'
            end
            object Label16: TLabel
              Left = 8
              Top = 47
              Width = 39
              Height = 13
              Cursor = crHandPoint
              Caption = 'Marca'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label16Click
            end
            object Label23: TLabel
              Left = 216
              Top = 47
              Width = 46
              Height = 13
              Cursor = crHandPoint
              Caption = 'Modelo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label23Click
            end
            object Label27: TLabel
              Left = 9
              Top = 130
              Width = 61
              Height = 13
              Caption = 'Acessórios'
            end
            object Label28: TLabel
              Left = 216
              Top = 129
              Width = 71
              Height = 13
              Cursor = crHandPoint
              Caption = 'Ocorrência'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label28Click
            end
            object Label29: TLabel
              Left = 217
              Top = 90
              Width = 245
              Height = 13
              Caption = 'Condições gerais / estado do equipamento'
            end
            object Label30: TLabel
              Left = 9
              Top = 170
              Width = 162
              Height = 13
              Caption = 'Detalhamento da ocorrência'
            end
            object lbEquipamento: TLabel
              Left = 50
              Top = 47
              Width = 160
              Height = 13
              Cursor = crHandPoint
              Caption = 'pesquisar equipamentos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lbEquipamentoClick
            end
            object Label6: TLabel
              Left = 292
              Top = 129
              Width = 145
              Height = 13
              Cursor = crHandPoint
              Caption = 'pesquisar ocorrências'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label6Click
            end
            object lbTipoOS: TLabel
              Left = 384
              Top = 47
              Width = 69
              Height = 13
              Cursor = crHandPoint
              Caption = 'Tipo de OS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lbTipoOSClick
            end
            object Label52: TLabel
              Left = 8
              Top = 240
              Width = 55
              Height = 13
              Cursor = crHandPoint
              Caption = 'Parceiro'
              FocusControl = DBEdit34
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label52Click
            end
            object Label53: TLabel
              Left = 369
              Top = 240
              Width = 64
              Height = 13
              Caption = 'Numerador'
            end
            object Label55: TLabel
              Left = 9
              Top = 282
              Width = 61
              Height = 13
              Caption = 'Operadora'
            end
            object DBEdit8: TDBEdit
              Left = 272
              Top = 18
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SOLICITANTE'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 19
              Width = 49
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODVENDEDOR_ABRE'
              DataSource = dsrDetalhes
              Enabled = False
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit13: TDBEdit
              Left = 8
              Top = 62
              Width = 49
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODMARCA'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = DBEdit13Enter
              OnExit = edtPesquisarExit
            end
            object DBEdit16: TDBEdit
              Left = 216
              Top = 62
              Width = 49
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODMODELO'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit17: TDBEdit
              Left = 8
              Top = 105
              Width = 201
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SERIE'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit19: TDBEdit
              Left = 8
              Top = 145
              Width = 201
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ACESSORIOS'
              DataSource = dsrDetalhes
              TabOrder = 6
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit20: TDBEdit
              Left = 216
              Top = 144
              Width = 49
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODDEFEITO'
              DataSource = dsrDetalhes
              TabOrder = 7
              OnEnter = DBEdit20Enter
              OnExit = edtPesquisarExit
            end
            object DBEdit22: TDBEdit
              Left = 216
              Top = 105
              Width = 281
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CONDICAOEXTERNA'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBMemo2: TDBMemo
              Left = 8
              Top = 184
              Width = 489
              Height = 49
              DataField = 'SERVICOS'
              DataSource = dsrDetalhes
              TabOrder = 8
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit2: TDBEdit
              Left = 64
              Top = 62
              Width = 145
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
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 272
              Top = 62
              Width = 105
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
              TabOrder = 10
            end
            object DBEdit21: TDBEdit
              Left = 272
              Top = 144
              Width = 225
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dsrDefeito
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit23: TDBEdit
              Left = 64
              Top = 19
              Width = 201
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrVendedores
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBEdit26: TDBEdit
              Left = 384
              Top = 62
              Width = 113
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'TIPO'
              DataSource = dsrTipoOS
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 13
            end
            object DBEdit34: TDBEdit
              Left = 8
              Top = 256
              Width = 57
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODPARCEIRO'
              DataSource = dsrDetalhes
              TabOrder = 14
              OnEnter = DBEdit14Enter
              OnExit = edtPesquisarExit
            end
            object DBEdit35: TDBEdit
              Left = 72
              Top = 256
              Width = 281
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrParceiro
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
            end
            object DBEdit38: TDBEdit
              Left = 368
              Top = 255
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMERADOR'
              DataSource = dsrDetalhes
              TabOrder = 16
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 8
              Top = 296
              Width = 345
              Height = 21
              DataField = 'OPERADORA'
              DataSource = dsrDetalhes
              KeyField = 'NOME'
              ListField = 'NOME'
              ListSource = dsrOperadora
              TabOrder = 17
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Técnicos'
            ImageIndex = 4
            object zebdbgrid3: Tzebdbgrid
              Left = 0
              Top = 89
              Width = 567
              Height = 243
              Align = alClient
              DataSource = dsrTecnicos
              TabOrder = 0
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
                  FieldName = 'NOMEUSER'
                  Title.Caption = 'Nome do Técnico'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Verdana'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAINI'
                  Title.Caption = 'Data Inicial'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Verdana'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAFIM'
                  Title.Caption = 'Data Final'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Verdana'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 567
              Height = 89
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label39: TLabel
                Left = 8
                Top = 2
                Width = 103
                Height = 13
                Caption = 'Defeito Detectado'
                FocusControl = DBEdit27
              end
              object Label41: TLabel
                Left = 8
                Top = 42
                Width = 104
                Height = 13
                Caption = 'Serviço a Realizar'
                FocusControl = DBEdit32
              end
              object DBEdit27: TDBEdit
                Left = 8
                Top = 18
                Width = 401
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DEFEITO_DETECTADO'
                DataSource = dsrDetalhes
                TabOrder = 0
                OnEnter = edtPesquisarEnter
                OnExit = edtPesquisarExit
              end
              object DBEdit32: TDBEdit
                Left = 8
                Top = 58
                Width = 401
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SERVICO_REALIZAR'
                DataSource = dsrDetalhes
                TabOrder = 1
                OnEnter = edtPesquisarEnter
                OnExit = edtPesquisarExit
              end
              object btnInicio: TButton
                Left = 424
                Top = 16
                Width = 75
                Height = 25
                Cursor = crHandPoint
                Caption = 'Início'
                TabOrder = 2
                OnClick = btnInicioClick
              end
              object btnTermino: TButton
                Left = 424
                Top = 56
                Width = 75
                Height = 25
                Cursor = crHandPoint
                Caption = 'Término'
                TabOrder = 3
                OnClick = btnTerminoClick
              end
            end
          end
          object tbsProdutos: TTabSheet
            Caption = '&Produtos/Serviços'
            object Splitter1: TSplitter
              Left = 0
              Top = 160
              Width = 567
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object Panel4: TPanel
              Left = 0
              Top = 163
              Width = 567
              Height = 169
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel5: TPanel
                Left = 0
                Top = 19
                Width = 567
                Height = 150
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object zebdbgrid1: Tzebdbgrid
                  Left = 0
                  Top = 0
                  Width = 567
                  Height = 150
                  Align = alClient
                  DataSource = dsrServicos
                  TabOrder = 0
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
                      Title.Caption = 'Cód. Barras'
                      Title.Font.Charset = ANSI_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -11
                      Title.Font.Name = 'Verdana'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCRICAO'
                      Title.Caption = 'Descrição'
                      Title.Font.Charset = ANSI_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -11
                      Title.Font.Name = 'Verdana'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'QUANTIDADE'
                      Title.Caption = 'Quantidade'
                      Title.Font.Charset = ANSI_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -11
                      Title.Font.Name = 'Verdana'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VALOR_PAGO'
                      Title.Caption = 'Valor Total'
                      Title.Font.Charset = ANSI_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -11
                      Title.Font.Name = 'Verdana'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end>
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 567
                Height = 19
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label12: TLabel
                  Left = 8
                  Top = 3
                  Width = 118
                  Height = 13
                  Caption = 'Serviços lançados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 567
              Height = 160
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 567
                Height = 19
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label31: TLabel
                  Left = 8
                  Top = 3
                  Width = 120
                  Height = 13
                  Caption = 'Produtos lançados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object zebdbgrid2: Tzebdbgrid
                Left = 0
                Top = 19
                Width = 567
                Height = 141
                Align = alClient
                DataSource = dsrProdutos
                TabOrder = 1
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
                    Title.Caption = 'Cód. Barras'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'Descrição'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANTIDADE'
                    Title.Caption = 'Quantidade'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_PAGO'
                    Title.Caption = 'Valor Total'
                    Title.Font.Charset = ANSI_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Verdana'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end>
              end
            end
          end
          object tabAutoriza: TTabSheet
            Caption = 'Autorização'
            ImageIndex = 3
            object Label42: TLabel
              Left = 176
              Top = 2
              Width = 97
              Height = 13
              Caption = 'Quem autorizou?'
              FocusControl = DBEdit33
            end
            object Label43: TLabel
              Left = 176
              Top = 42
              Width = 97
              Height = 13
              Caption = 'Data autorização'
            end
            object Label32: TLabel
              Left = 9
              Top = 95
              Width = 74
              Height = 13
              Caption = 'Observações'
            end
            object Label54: TLabel
              Left = 8
              Top = 242
              Width = 97
              Height = 13
              Caption = 'Data autorização'
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 8
              Top = 2
              Width = 153
              Height = 81
              Caption = ' Cliente Autorizou? '
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
              Width = 321
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUEM_AUTORIZOU'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBMemo4: TDBMemo
              Left = 8
              Top = 110
              Width = 489
              Height = 123
              DataField = 'OPCIONAIS'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
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
            object DBComboBox2: TDBComboBox
              Left = 8
              Top = 256
              Width = 297
              Height = 21
              Style = csDropDownList
              DataField = 'LOCALIZACAO'
              DataSource = dsrDetalhes
              ItemHeight = 13
              Items.Strings = (
                'ATENDIMENTO / ENTRADA'
                'ATENDIMENTO / SAIDA'
                'LABORATORIO / PENDENTE'
                'LABORATORIO / EM EXECUÇÃO'
                'SUPORTE / AGUARDANDO REPARO'
                'SUPORTE / AGUARDANDO APROVAÇÃO'
                'SUPORTE / CONCLUÍDO'
                'SUPORTE / ENTRADA')
              TabOrder = 4
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Fechamento'
            ImageIndex = 5
            object Label36: TLabel
              Left = 8
              Top = 3
              Width = 55
              Height = 13
              Caption = 'Vendedor'
              FocusControl = DBEdit29
            end
            object Label37: TLabel
              Left = 8
              Top = 43
              Width = 110
              Height = 13
              Caption = 'Usuário que fechou'
              FocusControl = DBEdit30
            end
            object Label38: TLabel
              Left = 176
              Top = 43
              Width = 98
              Height = 13
              Caption = 'Data fechamento'
              FocusControl = DBEdit31
            end
            object Label40: TLabel
              Left = 176
              Top = 3
              Width = 88
              Height = 13
              Caption = 'Comissão Total'
              FocusControl = DBEdit28
            end
            object Label44: TLabel
              Left = 8
              Top = 82
              Width = 93
              Height = 13
              Caption = 'Data da entrega'
            end
            object Label45: TLabel
              Left = 176
              Top = 82
              Width = 95
              Height = 13
              Caption = 'Quem entregou?'
              FocusControl = DBEdit36
            end
            object Label46: TLabel
              Left = 8
              Top = 122
              Width = 82
              Height = 13
              Caption = 'Quem retirou?'
              FocusControl = DBEdit37
            end
            object Label47: TLabel
              Left = 9
              Top = 167
              Width = 163
              Height = 13
              Caption = 'Observações do fechamento'
            end
            object DBEdit29: TDBEdit
              Left = 8
              Top = 19
              Width = 153
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dsrVendedor
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit30: TDBEdit
              Left = 8
              Top = 59
              Width = 153
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'USUARIOFECHAMENTO'
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
            object DBEdit31: TDBEdit
              Left = 176
              Top = 59
              Width = 153
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DATAFECHAMENTO'
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
            object DBEdit28: TDBEdit
              Left = 176
              Top = 19
              Width = 153
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_COMISSAO'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit36: TDBEdit
              Left = 176
              Top = 98
              Width = 153
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'QUEM_ENTREGOU'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit37: TDBEdit
              Left = 8
              Top = 138
              Width = 153
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clBtnFace
              DataField = 'QUEM_RECEBEU'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 2
            end
            object DBMemo5: TDBMemo
              Left = 8
              Top = 182
              Width = 489
              Height = 51
              DataField = 'OBSERVACOES'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBDateEdit1: TDBDateEdit
              Left = 8
              Top = 98
              Width = 153
              Height = 21
              TabStop = False
              DataField = 'DATA_ENTREGA'
              DataSource = dsrDetalhes
              ReadOnly = True
              Color = clBtnFace
              DialogTitle = 'Selecione a Data'
              NumGlyphs = 2
              TabOrder = 0
              StartOfWeek = Sun
              Weekends = [Sun, Sat]
            end
            object Button1: TButton
              Left = 176
              Top = 136
              Width = 153
              Height = 25
              Caption = 'Efetuar entrega'
              TabOrder = 8
              OnClick = Button1Click
            end
          end
          object TabSheet2: TTabSheet
            Caption = '&Totais'
            object Label8: TLabel
              Left = 8
              Top = 47
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
              Top = 144
              Width = 128
              Height = 13
              Caption = 'Total do Movimento'
              FocusControl = DBEdit4
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 176
              Top = 47
              Width = 99
              Height = 13
              Caption = 'Total de Serviços'
              FocusControl = DBEdit5
            end
            object Label11: TLabel
              Left = 360
              Top = 47
              Width = 105
              Height = 13
              Caption = 'Valor do Desconto'
              FocusControl = DBEdit6
            end
            object Label22: TLabel
              Left = 8
              Top = 3
              Width = 63
              Height = 13
              Caption = 'Número NF'
              FocusControl = DBEdit12
            end
            object Label33: TLabel
              Left = 176
              Top = 3
              Width = 81
              Height = 13
              Cursor = crHandPoint
              Caption = 'Total do ICMS'
              FocusControl = DBEdit24
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              OnClick = Label17Click
            end
            object Label35: TLabel
              Left = 360
              Top = 3
              Width = 71
              Height = 13
              Cursor = crHandPoint
              Caption = 'Total do ISS'
              FocusControl = DBEdit25
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              OnClick = Label17Click
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 62
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
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 160
              Width = 489
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
              TabOrder = 1
            end
            object DBEdit5: TDBEdit
              Left = 176
              Top = 62
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
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 360
              Top = 62
              Width = 137
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCONTO'
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
            object DBEdit12: TDBEdit
              Left = 8
              Top = 19
              Width = 137
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOTA_NUMERO'
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
            object DBCheckBox1: TDBCheckBox
              Left = 104
              Top = 1
              Width = 57
              Height = 17
              TabStop = False
              Caption = 'ECF'
              DataField = 'ECF'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit24: TDBEdit
              Left = 176
              Top = 19
              Width = 137
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_ICMS'
              DataSource = dsrDetalhes
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit25: TDBEdit
              Left = 360
              Top = 19
              Width = 137
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VALOR_ISS'
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
          end
          object TabSheet1: TTabSheet
            Caption = 'Sistema Antigo'
            ImageIndex = 3
            object Label13: TLabel
              Left = 9
              Top = 2
              Width = 74
              Height = 13
              Caption = 'Equipamento'
            end
            object Label34: TLabel
              Left = 9
              Top = 74
              Width = 54
              Height = 13
              Caption = 'Problema'
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 16
              Width = 489
              Height = 49
              TabStop = False
              Color = clBtnFace
              DataField = 'EQUIPAMENTO'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 0
            end
            object DBMemo3: TDBMemo
              Left = 8
              Top = 88
              Width = 489
              Height = 49
              TabStop = False
              Color = clBtnFace
              DataField = 'PROBLEMA'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 1
            end
            object DBCheckBox2: TDBCheckBox
              Left = 428
              Top = -1
              Width = 77
              Height = 17
              TabStop = False
              Caption = 'Garantia'
              DataField = 'GARANTIA'
              DataSource = dsrDetalhes
              ReadOnly = True
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 492
    MinMaxInfo.MinTrackWidth = 679
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor'
      'Splitter1.Top'
      'DateEdit1.Text'
      'DateEdit2.Text'
      'DateEdit3.Text'
      'DateEdit4.Text'
      'DateEdit5.Text'
      'DateEdit6.Text'
      'ckPrevisao.Checked'
      'ckPrioridade.Checked'
      'ckFechamento.Checked'
      'ckAbertura.Checked'
      'ckTudo.Checked')
    StoredValues = <>
    Left = 484
    Top = 89
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    AfterScroll = qrySelecionarAfterScroll
    BufferChunks = 100
    CachedUpdates = False
    UpdateObject = updSelecionar
    Left = 292
    Top = 105
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 300
    Top = 153
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 708
    Top = 153
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
    Left = 708
    Top = 201
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
    Left = 388
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
      'update MOVIMENTOS'
      'set'
      '  ES = :ES,'
      '  TIPO = :TIPO,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  DATA = :DATA,'
      '  SOLICITANTE = :SOLICITANTE,'
      '  ATENDIMENTO = :ATENDIMENTO,'
      '  SERVICOS = :SERVICOS,'
      '  VALOR_SERVICOS = :VALOR_SERVICOS,'
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
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  STATUS = :STATUS,'
      '  CONDICAO = :CONDICAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATATERMINO = :DATATERMINO,'
      '  ICMSSIMPLES = :ICMSSIMPLES,'
      '  ICMSSIMPALIQ = :ICMSSIMPALIQ,'
      '  ISSALIQ = :ISSALIQ,'
      '  NOTA_IESUBST = :NOTA_IESUBST,'
      '  NOTA_DATASAIDA = :NOTA_DATASAIDA,'
      '  NOTA_BASEICMSSUBST = :NOTA_BASEICMSSUBST,'
      '  NOTA_VALORICMSSUBST = :NOTA_VALORICMSSUBST,'
      '  CODVENDEDOR_ABRE = :CODVENDEDOR_ABRE,'
      '  CODMARCA = :CODMARCA,'
      '  CODMODELO = :CODMODELO,'
      '  CODDEFEITO = :CODDEFEITO,'
      '  DATAPREVISAO = :DATAPREVISAO,'
      '  GARANTIA = :GARANTIA,'
      '  ACESSORIOS = :ACESSORIOS,'
      '  SERIE = :SERIE,'
      '  CONDICAOEXTERNA = :CONDICAOEXTERNA,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  EMPRESTIMO = :EMPRESTIMO,'
      '  OSTIPO = :OSTIPO,'
      '  CODCENTRO = :CODCENTRO,'
      '  DEFEITO_DETECTADO = :DEFEITO_DETECTADO,'
      '  SERVICO_REALIZAR = :SERVICO_REALIZAR,'
      '  AUTORIZADO = :AUTORIZADO,'
      '  DATA_AUTORIZADO = :DATA_AUTORIZADO,'
      '  QUEM_AUTORIZOU = :QUEM_AUTORIZOU,'
      '  DATA_ENTREGA = :DATA_ENTREGA,'
      '  QUEM_ENTREGOU = :QUEM_ENTREGOU,'
      '  QUEM_RECEBEU = :QUEM_RECEBEU,'
      '  NOTA_ENTRADA = :NOTA_ENTRADA,'
      '  OPCIONAIS = :OPCIONAIS,'
      '  CODPARCEIRO = :CODPARCEIRO,'
      '  NUMERADOR = :NUMERADOR,'
      '  LOCALIZACAO = :LOCALIZACAO'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into MOVIMENTOS ('
      '   CODIGO,'
      '   ES,'
      '   TIPO,'
      '   CODCLIENTE,'
      '   DATA,'
      '   SOLICITANTE,'
      '   ATENDIMENTO,'
      '   SERVICOS,'
      '   VALOR_SERVICOS,'
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
      '   CODVENDEDOR,'
      '   STATUS,'
      '   CONDICAO,'
      '   DATAINICIO,'
      '   DATATERMINO,'
      '   ICMSSIMPLES,'
      '   ICMSSIMPALIQ,'
      '   ISSALIQ,'
      '   NOTA_IESUBST,'
      '   NOTA_DATASAIDA,'
      '   NOTA_BASEICMSSUBST,'
      '   NOTA_VALORICMSSUBST,'
      '   CODVENDEDOR_ABRE,'
      '   DATAPREVISAO,'
      '   GARANTIA,'
      '   CODMARCA,'
      '   CODMODELO,'
      '   CODDEFEITO,'
      '   ACESSORIOS,'
      '   SERIE,'
      '   CONDICAOEXTERNA,'
      '   PRIORIDADE,'
      '   EMPRESTIMO,'
      '   CODEMPRESA,'
      '   OSTIPO,'
      '   CODCENTRO,'
      '   DEFEITO_DETECTADO,'
      '   SERVICO_REALIZAR,'
      '   AUTORIZADO,'
      '   DATA_AUTORIZADO,'
      '   QUEM_AUTORIZOU,'
      '   DATA_ENTREGA,'
      '   QUEM_ENTREGOU,'
      '   QUEM_RECEBEU,'
      '   NOTA_ENTRADA,'
      '   OPCIONAIS,'
      '   CODPARCEIRO,'
      '   NUMERADOR,'
      '   LOCALIZACAO)'
      'values ('
      '   :CODIGO,'
      '   :ES,'
      '   :TIPO,'
      '   :CODCLIENTE,'
      '   :DATA,'
      '   :SOLICITANTE,'
      '   :ATENDIMENTO,'
      '   :SERVICOS,'
      '   :VALOR_SERVICOS,'
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
      '   :CODVENDEDOR,'
      '   :STATUS,'
      '   :CONDICAO,'
      '   :DATAINICIO,'
      '   :DATATERMINO,'
      '   :ICMSSIMPLES,'
      '   :ICMSSIMPALIQ,'
      '   :ISSALIQ,'
      '   :NOTA_IESUBST,'
      '   :NOTA_DATASAIDA,'
      '   :NOTA_BASEICMSSUBST,'
      '   :NOTA_VALORICMSSUBST,'
      '   :CODVENDEDOR_ABRE,'
      '   :DATAPREVISAO,'
      '   :GARANTIA,'
      '   :CODMARCA,'
      '   :CODMODELO,'
      '   :CODDEFEITO,'
      '   :ACESSORIOS,'
      '   :SERIE,'
      '   :CONDICAOEXTERNA,'
      '   :PRIORIDADE,'
      '   :EMPRESTIMO,'
      '   :CODEMPRESA,'
      '   :OSTIPO,'
      '   :CODCENTRO,'
      '   :DEFEITO_DETECTADO,'
      '   :SERVICO_REALIZAR,'
      '   :AUTORIZADO,'
      '   :DATA_AUTORIZADO,'
      '   :QUEM_AUTORIZOU,'
      '   :DATA_ENTREGA,'
      '   :QUEM_ENTREGOU,'
      '   :QUEM_RECEBEU,'
      '   :NOTA_ENTRADA,'
      '   :OPCIONAIS,'
      '   :CODPARCEIRO,'
      '   :NUMERADOR,'
      '   :LOCALIZACAO)'
      ''
      ''
      ''
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from MOVIMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 388
    Top = 209
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 388
    Top = 161
  end
  object qryCliente: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCliente
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, NOME, EQUIPAMENTO FROM CLIENTES'
      'WHERE CODIGO = :CODIGO')
    UniDirectional = True
    Left = 856
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrCliente: TDataSource
    DataSet = qryCliente
    Left = 853
    Top = 384
  end
  object qryDelete: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = dmoPrincipal.traObterSequencia
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'DELETE FROM TEMPITENS WHERE CODMOVIMENTO = :cod')
    UniDirectional = True
    Left = 245
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object updClientes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  EQUIPAMENTO = :EQUIPAMENTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into CLIENTES'
      '  (EQUIPAMENTO)'
      'values'
      '  (:EQUIPAMENTO)')
    DeleteSQL.Strings = (
      'delete from CLIENTES'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 854
    Top = 440
  end
  object qryVendedores: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traVendedores
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   NOME '
      'FROM '
      '   CLIENTES'
      'WHERE'
      '   CODIGO = :CODVENDEDOR_ABRE'
      '')
    UniDirectional = True
    Left = 485
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVENDEDOR_ABRE'
        ParamType = ptUnknown
      end>
  end
  object dsrVendedores: TDataSource
    AutoEdit = False
    DataSet = qryVendedores
    Left = 485
    Top = 392
  end
  object qryProdutos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProdutos
    AfterOpen = qryProdutosAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   DESCRICAO2 AS DESCRICAO,'
      '   BARRA,'
      '   QUANTIDADE,'
      '   VALOR_PAGO'
      'FROM'
      '   REL_NOTAPRO(:CODIGO)'
      'ORDER BY'
      '   BARRA')
    Left = 333
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrProdutos: TDataSource
    AutoEdit = False
    DataSet = qryProdutos
    Left = 357
    Top = 376
  end
  object PrintMenu: TPopupMenu
    Left = 605
    Top = 232
    object menuImpGrade: TMenuItem
      Caption = '&Grade'
      OnClick = menuImpGradeClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object menuImpOS: TMenuItem
      Caption = 'OS / modelo &1'
      OnClick = menuImpOSClick
    end
    object OrdemdeServiomodelo21: TMenuItem
      Caption = 'OS / modelo &2'
      OnClick = OrdemdeServiomodelo21Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object CartadeManuteno1: TMenuItem
      Caption = 'Carta de Manutenção'
      OnClick = CartadeManuteno1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object EmitirNotaFiscal1: TMenuItem
      Caption = 'Emitir Nota Fiscal'
      OnClick = EmitirNotaFiscal1Click
    end
  end
  object qryMarca: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMarca
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   DESCRICAO'
      'FROM '
      '   MARCAS'
      'WHERE'
      '   CODIGO = :CODMARCA')
    UniDirectional = True
    Left = 549
    Top = 328
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
    Left = 589
    Top = 464
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
    Left = 621
    Top = 328
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
    Left = 613
    Top = 384
  end
  object qryDefeito: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDefeito
    ForcedRefresh = True
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '  DESCRICAO'
      'FROM '
      '  DEFEITOS'
      'WHERE'
      '  CODIGO = :CODDEFEITO')
    Left = 797
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDEFEITO'
        ParamType = ptUnknown
      end>
  end
  object dsrDefeito: TDataSource
    AutoEdit = False
    DataSet = qryDefeito
    Left = 797
    Top = 208
  end
  object qryServicos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traServicos
    AfterOpen = qryProdutosAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   DESCRICAO2 AS DESCRICAO,'
      '   BARRA,'
      '   QUANTIDADE,'
      '   VALOR_PAGO'
      'FROM'
      '   REL_NOTASER(:CODIGO)'
      'ORDER BY'
      '   BARRA')
    Left = 405
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrServicos: TDataSource
    AutoEdit = False
    DataSet = qryServicos
    Left = 405
    Top = 392
  end
  object spESTORNO: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traESTORNO
    StoredProcName = 'ESTORNO'
    Left = 469
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMOVIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIOESTORNO'
        ParamType = ptInput
      end>
  end
  object qryUltimaOS: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traUltimaOS
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  ULTIMAOS(:CODCLIENTE)'
      '  ')
    Left = 621
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
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
    Left = 297
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
    Left = 393
    Top = 61
  end
  object traESTORNO: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 473
    Top = 141
  end
  object traUltimaOS: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 625
    Top = 101
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
    Left = 241
    Top = 317
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
    Left = 857
    Top = 285
  end
  object traProdutos: TIBTransaction
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
    Top = 277
  end
  object traServicos: TIBTransaction
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
    Left = 401
    Top = 277
  end
  object traVendedores: TIBTransaction
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
    Left = 481
    Top = 277
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
    Left = 553
    Top = 277
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
    Left = 617
    Top = 277
  end
  object traDefeito: TIBTransaction
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
    Left = 801
    Top = 109
  end
  object traEquipamento: TIBTransaction
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
    Left = 129
    Top = 61
  end
  object qryEquipamento: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEquipamento
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  CE.CODMARCA,'
      '  MA.DESCRICAO AS MARCA,'
      '  CE.CODMODELO,'
      '  MD.DESCRICAO AS MODELO,'
      '  CE.SERIE,'
      '  CE.GARANTIA,'
      '  CE.DATAINI,'
      '  CE.DATAFIM,'
      '  CE.TIPOCONTRATO'
      'FROM'
      '  CLI_EQUIP CE'
      '  LEFT JOIN MARCAS MA ON'
      '    (CE.CODMARCA = MA.CODIGO)'
      '  LEFT JOIN MODELOS MD ON'
      '    (CE.CODMODELO = MD.CODIGO)'
      'WHERE'
      '  CE.CODCLIENTE = :CODCLIENTE')
    Left = 125
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end>
  end
  object dsrEquipamento: TDataSource
    AutoEdit = False
    DataSet = qryEquipamento
    Left = 125
    Top = 160
  end
  object traOcorrencia: TIBTransaction
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
    Left = 1081
    Top = 125
  end
  object qryOcorrencia: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOcorrencia
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  MO.CODDEFEITO,'
      '  DE.DESCRICAO,'
      '  COUNT(MO.CODIGO),'
      '  MAX(MO.DATA)'
      'FROM'
      '  MOVIMENTOS MO'
      '  JOIN DEFEITOS DE ON'
      '    (MO.CODDEFEITO = DE.CODIGO)'
      'WHERE'
      '  MO.CODMARCA = :CODMARCA AND'
      '  MO.CODMODELO = :CODMODELO AND'
      '  MO.CODDEFEITO IS NOT NULL'
      'GROUP BY'
      '  MO.CODDEFEITO,'
      '  DE.DESCRICAO')
    Left = 1077
    Top = 176
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
  object dsrOcorrencia: TDataSource
    AutoEdit = False
    DataSet = qryOcorrencia
    Left = 1077
    Top = 224
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
    Left = 217
    Top = 65
  end
  object qryHistorico: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traHistorico
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  HISTORICO(:CODCLIENTE, :CODEMPRESA)')
    Left = 217
    Top = 113
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
  object traTipoOS: TIBTransaction
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
    Left = 697
    Top = 277
  end
  object qryTipoOS: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traTipoOS
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   TIPO,'
      '   DIAS,'
      '   HORAS'
      'FROM'
      '   OSTIPOS'
      'WHERE'
      '   CODIGO = :OSTIPO')
    Left = 693
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OSTIPO'
        ParamType = ptUnknown
      end>
  end
  object dsrTipoOS: TDataSource
    AutoEdit = False
    DataSet = qryTipoOS
    Left = 693
    Top = 376
  end
  object traTecnicos: TIBTransaction
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
    Left = 777
    Top = 285
  end
  object qryTecnicos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traTecnicos
    AfterPost = qryTecnicosAfterPost
    BufferChunks = 100
    CachedUpdates = True
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  OS.CODMOVIMENTO,'
      '  OS.CODVENDEDOR,'
      '  CL.NOMEUSER,'
      '  OS.DATAINI,'
      '  OS.DATAFIM,'
      '  OS.PORCENTAGEM'
      'FROM'
      '  OS_VENDER OS '
      '  JOIN CLIENTES CL ON'
      '    (CL.CODIGO = OS.CODVENDEDOR)'
      'WHERE'
      '  OS.CODMOVIMENTO = :CODIGO'
      'ORDER BY'
      '  OS.DATAINI')
    UpdateObject = updTecnicos
    Left = 781
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryTecnicosCODMOVIMENTO: TIntegerField
      FieldName = 'CODMOVIMENTO'
      Origin = '"OS_VENDER"."CODMOVIMENTO"'
      Required = True
    end
    object qryTecnicosCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = '"OS_VENDER"."CODVENDEDOR"'
      Required = True
    end
    object qryTecnicosDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Origin = '"OS_VENDER"."DATAINI"'
      Required = True
    end
    object qryTecnicosDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = '"OS_VENDER"."DATAFIM"'
      ProviderFlags = []
    end
    object qryTecnicosPORCENTAGEM: TIBBCDField
      FieldName = 'PORCENTAGEM'
      Origin = '"OS_VENDER"."PORCENTAGEM"'
      Precision = 9
      Size = 2
    end
    object qryTecnicosNOMEUSER: TIBStringField
      FieldName = 'NOMEUSER'
      Origin = '"CLIENTES"."NOMEUSER"'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object dsrTecnicos: TDataSource
    AutoEdit = False
    DataSet = qryTecnicos
    Left = 781
    Top = 384
  end
  object traVendedor: TIBTransaction
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
    Top = 61
  end
  object qryVendedor: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traVendedor
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  CLIENTES'
      'WHERE'
      '  CODIGO = :CODVENDEDOR')
    Left = 53
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVENDEDOR'
        ParamType = ptUnknown
      end>
  end
  object dsrVendedor: TDataSource
    AutoEdit = False
    DataSet = qryVendedor
    Left = 53
    Top = 160
  end
  object updSelecionar: TIBUpdateSQL
    Left = 301
    Top = 215
  end
  object updTecnicos: TIBUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '  OS_VENDER'
      'SET'
      '  CODMOVIMENTO = :CODMOVIMENTO,'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PORCENTAGEM = :PORCENTAGEM'
      'WHERE'
      '  CODMOVIMENTO = :CODMOVIMENTO AND'
      '  CODVENDEDOR = :CODVENDEDOR AND'
      '  DATAINI = :DATAINI')
    InsertSQL.Strings = (
      'INSERT INTO'
      '  OS_VENDER(CODMOVIMENTO, CODVENDEDOR, DATAINI, PORCENTAGEM)'
      'VALUES (:CODMOVIMENTO, :CODVENDEDOR, :DATAINI, :PORCENTAGEM)')
    Left = 782
    Top = 440
  end
  object traParceiro: TIBTransaction
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
    Left = 185
    Top = 317
  end
  object qryParceiro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traParceiro
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT NOME FROM CLIENTES'
      'WHERE CODIGO = :CODPARCEIRO')
    UniDirectional = True
    Left = 184
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPARCEIRO'
        ParamType = ptUnknown
      end>
  end
  object dsrParceiro: TDataSource
    DataSet = qryParceiro
    Left = 181
    Top = 416
  end
  object traOSequip: TIBTransaction
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
    Top = 221
  end
  object qryOSequip: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOSequip
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dscSelecionar
    SQL.Strings = (
      'SELECT'
      '  MO.CODCLIENTE,'
      '  CL.NOME AS CLIENTE,'
      '  MO.CODMARCA,'
      '  MA.DESCRICAO AS MARCA,'
      '  MO.CODMODELO,'
      '  MD.DESCRICAO AS MODELO,'
      '  MO.SERIE'
      'FROM'
      '  MOVIMENTOS MO'
      '  JOIN MARCAS MA ON'
      '    (MA.CODIGO = MO.CODMARCA)'
      '  JOIN MODELOS MD ON'
      '    (MD.CODEQUIPAMENTO = MO.CODMARCA AND'
      '     MD.CODIGO         = MO.CODMODELO)'
      '  JOIN CLIENTES CL ON'
      '    (CL.CODIGO = MO.CODCLIENTE)'
      'WHERE'
      '  MO.CODIGO = :CODIGO'
      '')
    Left = 45
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrOSequip: TDataSource
    AutoEdit = False
    DataSet = qryOSequip
    Left = 45
    Top = 320
  end
  object traCarta: TIBTransaction
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
    Left = 129
    Top = 221
  end
  object qryCarta: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCarta
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrOSequip
    SQL.Strings = (
      'SELECT FIRST 18'
      '  MO.CODIGO,'
      '  MO.DATA,'
      '  MO.NUMERADOR,'
      '  MO.SERVICOS,'
      
        '  (SELECT FIRST 1 TE.NOMEUSER FROM OS_VENDER OS JOIN CLIENTES TE' +
        ' ON (TE.CODIGO = OS.CODVENDEDOR) WHERE OS.CODMOVIMENTO = MO.CODI' +
        'GO) AS TECNICO'
      'FROM'
      '  MOVIMENTOS MO'
      'WHERE'
      '  MO.CODCLIENTE = :CODCLIENTE AND'
      '  MO.CODMARCA   = :CODMARCA   AND'
      '  MO.CODMODELO  = :CODMODELO  AND'
      '  MO.SERIE      = :SERIE'
      'ORDER BY'
      '  MO.DATA DESC')
    Left = 125
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODMARCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODMODELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end>
    object qryCartaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MOVIMENTOS"."CODIGO"'
      Required = True
    end
    object qryCartaDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = '"MOVIMENTOS"."DATA"'
      Required = True
    end
    object qryCartaNUMERADOR: TIntegerField
      FieldName = 'NUMERADOR'
      Origin = '"MOVIMENTOS"."NUMERADOR"'
    end
    object qryCartaSERVICOS: TIBStringField
      FieldName = 'SERVICOS'
      Origin = '"MOVIMENTOS"."SERVICOS"'
      Size = 1024
    end
    object qryCartaTECNICO: TIBStringField
      FieldName = 'TECNICO'
      FixedChar = True
      Size = 40
    end
  end
  object dsrCarta: TDataSource
    AutoEdit = False
    DataSet = qryCarta
    Left = 125
    Top = 320
  end
  object ppDBPipeline: TppDBPipeline
    DataSource = dsrCarta
    UserName = 'DBPipeline'
    Left = 213
    Top = 167
    object ppDBPipelineppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipelineppField2: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipelineppField3: TppField
      FieldAlias = 'NUMERADOR'
      FieldName = 'NUMERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipelineppField4: TppField
      FieldAlias = 'SERVICOS'
      FieldName = 'SERVICOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipelineppField5: TppField
      FieldAlias = 'TECNICO'
      FieldName = 'TECNICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object ppReportCarta: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
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
    Left = 213
    Top = 215
    Version = '7.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'CARTA DE MANUTENÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 5800
        mmLeft = 3175
        mmTop = 3175
        mmWidth = 62484
        BandType = 0
      end
      object pplbCliente: TppLabel
        UserName = 'lbCliente'
        Caption = 'lbCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 10319
        mmWidth = 14859
        BandType = 0
      end
      object pplbequipamento: TppLabel
        UserName = 'lbequipamento'
        Caption = 'lbequipamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 15610
        mmWidth = 25061
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'OS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODIGO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 4191
        mmLeft = 10848
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DATA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATA'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 4191
        mmLeft = 44450
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TÉCNICO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 69586
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TECNICO'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 4191
        mmLeft = 88106
        mmTop = 0
        mmWidth = 35454
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'NUMERADO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 127794
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMERADOR'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 4191
        mmLeft = 150813
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'SERVICOS'
        DataPipeline = ppDBPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBPipeline'
        mmHeight = 7673
        mmLeft = 10848
        mmTop = 5821
        mmWidth = 183092
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 14817
        mmWidth = 197380
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object traOperadora: TIBTransaction
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
    Left = 433
    Top = 461
  end
  object qryOperadora: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOperadora
    AfterOpen = qryOperadoraAfterOpen
    BufferChunks = 1000
    CachedUpdates = True
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   NOME'
      'FROM '
      '   OPERADORAS'
      'ORDER BY'
      '  NOME')
    UniDirectional = True
    Left = 429
    Top = 512
  end
  object dsrOperadora: TDataSource
    AutoEdit = False
    DataSet = qryOperadora
    Left = 501
    Top = 512
  end
end
