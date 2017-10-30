object formSisConfig: TformSisConfig
  Left = 429
  Top = 222
  Width = 481
  Height = 417
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Perfil do Sistema'
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
    Width = 473
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
        Width = 465
        Height = 362
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 463
          Height = 46
          BoundLines = [blTop, blLeft, blRight]
          object ToolWindow971: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 448
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
          Top = 315
          Width = 463
          Height = 46
          BoundLines = [blBottom, blLeft, blRight]
          Position = dpBottom
          object ToolWindow972: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 448
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
          end
        end
        object Dock972: TDock97
          Left = 378
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
          Width = 377
          Height = 268
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 377
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
            Width = 377
            Height = 255
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
        end
      end
    end
    object tabDetalhe: TTabSheet
      Tag = 1
      Caption = '&Detalhes'
      object Dock975: TDock97
        Left = 379
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
        Width = 379
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
          TabOrder = 0
          Visible = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 377
          Height = 52
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
          object DBCheckBox4: TDBCheckBox
            Left = 224
            Top = 24
            Width = 153
            Height = 17
            Caption = 'Selecionar este perfil'
            DataField = 'PADRAO'
            DataSource = dsrDetalhes
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object pgcDetalhes: TPageControl
          Left = 1
          Top = 53
          Width = 377
          Height = 308
          ActivePage = tabEndereco
          Align = alClient
          TabOrder = 2
          object tabPessoaFisica: TTabSheet
            Caption = 'I&dentidade'
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 133
              Height = 13
              Cursor = crHandPoint
              Caption = 'Empresa do Sistema'
              FocusControl = DBEdit2
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label6Click
            end
            object Label7: TLabel
              Left = 8
              Top = 56
              Width = 176
              Height = 13
              Cursor = crHandPoint
              Caption = 'Cliente Consumidor Padrão'
              FocusControl = DBEdit3
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label7Click
            end
            object Label8: TLabel
              Left = 8
              Top = 104
              Width = 168
              Height = 13
              Caption = 'Valor limite para Consumidor'
              FocusControl = DBEdit6
            end
            object Label40: TLabel
              Left = 8
              Top = 176
              Width = 147
              Height = 13
              Caption = 'Dias de atraso permitidos'
              FocusControl = DBEdit45
            end
            object Bevel3: TBevel
              Left = -2
              Top = 168
              Width = 369
              Height = 9
              Shape = bsTopLine
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 24
              Width = 64
              Height = 21
              DataField = 'CODCLIENTE'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 72
              Width = 64
              Height = 21
              DataField = 'CODCLIENTE_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit4: TDBEdit
              Left = 80
              Top = 24
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dmoSisconfig.dsrEmpresa
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
              Left = 80
              Top = 72
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOME'
              DataSource = dmoSisconfig.dsrCliente
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
              Left = 8
              Top = 120
              Width = 64
              Height = 21
              DataField = 'VALOR_LIMITE'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit45: TDBEdit
              Left = 8
              Top = 192
              Width = 64
              Height = 21
              DataField = 'BLOQUEIO_DIAS'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object tabEndereco: TTabSheet
            Caption = '&Fiscal'
            object Label9: TLabel
              Left = 8
              Top = 8
              Width = 71
              Height = 13
              Caption = '&Aliquota ISS'
              FocusControl = DBEdit7
            end
            object Label34: TLabel
              Left = 8
              Top = 176
              Width = 106
              Height = 13
              Caption = 'Taxa Juros ao Mês'
              FocusControl = DBEdit40
            end
            object Bevel1: TBevel
              Left = 0
              Top = 56
              Width = 369
              Height = 9
              Shape = bsTopLine
            end
            object lblNatuoper: TLabel
              Left = 6
              Top = 67
              Width = 173
              Height = 13
              Cursor = crHandPoint
              Caption = 'Natureza padrão da Venda'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = lblNatuoperClick
            end
            object Bevel2: TBevel
              Left = -2
              Top = 168
              Width = 369
              Height = 9
              Shape = bsTopLine
            end
            object Label19: TLabel
              Left = 6
              Top = 115
              Width = 183
              Height = 13
              Cursor = crHandPoint
              Caption = 'Natureza padrão da Compra'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label19Click
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 24
              Width = 89
              Height = 21
              DataField = 'ALIQUOTA_ISS'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit8: TDBEdit
              Left = 112
              Top = 24
              Width = 89
              Height = 21
              DataField = 'ALIQUOTA_ICMSSIMPLES'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBCheckBox1: TDBCheckBox
              Left = 112
              Top = 7
              Width = 105
              Height = 17
              Caption = 'ICMS Simples'
              DataField = 'ICMSSIMPLES'
              DataSource = dsrDetalhes
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit40: TDBEdit
              Left = 8
              Top = 192
              Width = 89
              Height = 21
              DataField = 'JUROS_MES'
              DataSource = dsrDetalhes
              TabOrder = 5
            end
            object DBEdit48: TDBEdit
              Left = 6
              Top = 83
              Width = 67
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NATUOPER_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 3
            end
            object DBEdit49: TDBEdit
              Left = 82
              Top = 83
              Width = 263
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NATUREZA'
              DataSource = dmoSisconfig.dsrNatuoper
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit13: TDBEdit
              Left = 6
              Top = 131
              Width = 67
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NATUOPER_COMPRA'
              DataSource = dsrDetalhes
              TabOrder = 6
            end
            object DBEdit14: TDBEdit
              Left = 82
              Top = 131
              Width = 263
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NATUREZA'
              DataSource = dmoSisconfig.dsrNatuoperC
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
          object tabOutros: TTabSheet
            Caption = '&Contas'
            object Label13: TLabel
              Left = 8
              Top = 8
              Width = 183
              Height = 13
              Cursor = crHandPoint
              Caption = 'Conta para Compra a Débito'
              FocusControl = DBEdit15
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label13Click
            end
            object Label14: TLabel
              Left = 8
              Top = 56
              Width = 178
              Height = 13
              Cursor = crHandPoint
              Caption = 'Conta para Venda a Crédito'
              FocusControl = DBEdit16
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label14Click
            end
            object DBEdit15: TDBEdit
              Left = 8
              Top = 24
              Width = 64
              Height = 21
              DataField = 'CODCONTA_COMPRADEB'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit16: TDBEdit
              Left = 8
              Top = 72
              Width = 64
              Height = 21
              DataField = 'CODCONTA_VENDACRE'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit20: TDBEdit
              Left = 80
              Top = 24
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CONTA'
              DataSource = dmoSisconfig.dsrCCD
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit21: TDBEdit
              Left = 80
              Top = 72
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CONTA'
              DataSource = dmoSisconfig.dsrCVC
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object TabSheet1: TTabSheet
            Caption = '&Documentos'
            ImageIndex = 4
            object Label20: TLabel
              Left = 8
              Top = 8
              Width = 171
              Height = 13
              Cursor = crHandPoint
              Caption = 'Documento Padrão à Vista'
              FocusControl = DBEdit18
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label20Click
            end
            object Label21: TLabel
              Left = 8
              Top = 56
              Width = 176
              Height = 13
              Cursor = crHandPoint
              Caption = 'Documento Padrão à Prazo'
              FocusControl = DBEdit19
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label21Click
            end
            object DBEdit18: TDBEdit
              Left = 8
              Top = 24
              Width = 64
              Height = 21
              DataField = 'CODDOC_AVISTA'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit19: TDBEdit
              Left = 8
              Top = 72
              Width = 64
              Height = 21
              DataField = 'CODDOC_PRAZO'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit24: TDBEdit
              Left = 80
              Top = 24
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DOCUMENTO'
              DataSource = dmoSisconfig.dsrDOCvista
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit25: TDBEdit
              Left = 80
              Top = 72
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DOCUMENTO'
              DataSource = dmoSisconfig.dsrDOCprazo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'La&youts'
            ImageIndex = -1
            object Label27: TLabel
              Left = 8
              Top = 8
              Width = 119
              Height = 13
              Cursor = crHandPoint
              Caption = 'Nota fiscal padrão'
              FocusControl = DBEdit29
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label27Click
            end
            object Label30: TLabel
              Left = 8
              Top = 56
              Width = 163
              Height = 13
              Cursor = crHandPoint
              Caption = 'Abertura de OS modelo 1'
              FocusControl = DBEdit35
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label30Click
            end
            object Label31: TLabel
              Left = 8
              Top = 152
              Width = 177
              Height = 13
              Cursor = crHandPoint
              Caption = 'Fechamento de OS e Venda'
              FocusControl = DBEdit37
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label31Click
            end
            object Label36: TLabel
              Left = 8
              Top = 200
              Width = 137
              Height = 13
              Cursor = crHandPoint
              Caption = 'Impressão de Recibo'
              FocusControl = DBEdit43
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label36Click
            end
            object Label37: TLabel
              Left = 296
              Top = 56
              Width = 39
              Height = 13
              Caption = 'Cópias'
            end
            object Label38: TLabel
              Left = 296
              Top = 152
              Width = 39
              Height = 13
              Caption = 'Cópias'
            end
            object Label39: TLabel
              Left = 296
              Top = 200
              Width = 39
              Height = 13
              Caption = 'Cópias'
            end
            object Label26: TLabel
              Left = 8
              Top = 104
              Width = 163
              Height = 13
              Cursor = crHandPoint
              Caption = 'Abertura de OS modelo 2'
              FocusControl = DBEdit22
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label26Click
            end
            object Label41: TLabel
              Left = 296
              Top = 104
              Width = 39
              Height = 13
              Caption = 'Cópias'
            end
            object DBEdit29: TDBEdit
              Left = 8
              Top = 24
              Width = 57
              Height = 21
              DataField = 'NOTA_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit30: TDBEdit
              Left = 72
              Top = 24
              Width = 273
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoSisconfig.dsrImpNota
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit35: TDBEdit
              Left = 8
              Top = 72
              Width = 57
              Height = 21
              DataField = 'OSABERTA_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit36: TDBEdit
              Left = 72
              Top = 72
              Width = 217
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoSisconfig.dsrOSaberta
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object DBEdit37: TDBEdit
              Left = 8
              Top = 168
              Width = 57
              Height = 21
              DataField = 'OSFECHADA_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit38: TDBEdit
              Left = 72
              Top = 168
              Width = 217
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoSisconfig.dsrOSfechada
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object DBEdit43: TDBEdit
              Left = 8
              Top = 216
              Width = 57
              Height = 21
              DataField = 'RECIBO_PADRAO'
              DataSource = dsrDetalhes
              TabOrder = 7
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit44: TDBEdit
              Left = 72
              Top = 216
              Width = 217
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoSisconfig.dsrRecibo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBComboBox1: TDBComboBox
              Left = 296
              Top = 72
              Width = 49
              Height = 21
              Style = csDropDownList
              DataField = 'COPIAS_OS'
              DataSource = dsrDetalhes
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4')
              TabOrder = 2
            end
            object DBComboBox2: TDBComboBox
              Left = 296
              Top = 168
              Width = 49
              Height = 21
              Style = csDropDownList
              DataField = 'COPIAS_OS2'
              DataSource = dsrDetalhes
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4')
              TabOrder = 6
            end
            object DBComboBox3: TDBComboBox
              Left = 296
              Top = 216
              Width = 49
              Height = 21
              Style = csDropDownList
              DataField = 'COPIAS_RECIBO'
              DataSource = dsrDetalhes
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4')
              TabOrder = 8
            end
            object DBEdit22: TDBEdit
              Left = 8
              Top = 120
              Width = 57
              Height = 21
              DataField = 'OSABERTA_PADRAO_2A'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit46: TDBEdit
              Left = 72
              Top = 120
              Width = 217
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dmoSisconfig.dsrOSaberta2
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 13
            end
            object DBComboBox4: TDBComboBox
              Left = 296
              Top = 120
              Width = 49
              Height = 21
              Style = csDropDownList
              DataField = 'COPIAS_OS_2A'
              DataSource = dsrDetalhes
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4')
              TabOrder = 4
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'I&mpressoras'
            ImageIndex = 5
            object Label11: TLabel
              Left = 8
              Top = 8
              Width = 146
              Height = 13
              Cursor = crHandPoint
              Caption = 'Abertura de OS modelo 1'
              FocusControl = DBEdit9
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 8
              Top = 128
              Width = 59
              Height = 13
              Cursor = crHandPoint
              Caption = 'Nota fiscal'
              FocusControl = DBEdit10
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 8
              Top = 168
              Width = 149
              Height = 13
              Cursor = crHandPoint
              Caption = 'Preenchimento de Boletos'
              FocusControl = DBEdit28
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 8
              Top = 88
              Width = 159
              Height = 13
              Cursor = crHandPoint
              Caption = 'Fechamento de OS e Venda'
              FocusControl = DBEdit41
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 8
              Top = 208
              Width = 127
              Height = 13
              Cursor = crHandPoint
              Caption = 'Impressão de Recibos'
              FocusControl = DBEdit42
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label42: TLabel
              Left = 8
              Top = 48
              Width = 146
              Height = 13
              Cursor = crHandPoint
              Caption = 'Abertura de OS modelo 2'
              FocusControl = DBEdit47
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit9: TDBEdit
              Left = 8
              Top = 24
              Width = 337
              Height = 21
              DataField = 'PRINT_OS'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 144
              Width = 337
              Height = 21
              DataField = 'PRINT_NOTA'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit28: TDBEdit
              Left = 8
              Top = 184
              Width = 337
              Height = 21
              DataField = 'PRINT_BOLETO'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit41: TDBEdit
              Left = 8
              Top = 104
              Width = 337
              Height = 21
              DataField = 'PRINT_OS2'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit42: TDBEdit
              Left = 8
              Top = 224
              Width = 337
              Height = 21
              DataField = 'PRINT_RECIBO'
              DataSource = dsrDetalhes
              TabOrder = 5
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit47: TDBEdit
              Left = 8
              Top = 64
              Width = 337
              Height = 21
              DataField = 'PRINT_OS_2A'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet4: TTabSheet
            Caption = '&Moeda'
            ImageIndex = 6
            object Label16: TLabel
              Left = 8
              Top = 8
              Width = 104
              Height = 13
              Caption = 'Moeda no singular'
              FocusControl = DBEdit11
            end
            object Label17: TLabel
              Left = 8
              Top = 48
              Width = 91
              Height = 13
              Caption = 'Moeda no plural'
              FocusControl = DBEdit12
            end
            object Label18: TLabel
              Left = 8
              Top = 88
              Width = 121
              Height = 13
              Caption = 'Centavos no singular'
              FocusControl = DBEdit26
            end
            object Label22: TLabel
              Left = 8
              Top = 128
              Width = 102
              Height = 13
              Caption = 'Centavo no plural'
              FocusControl = DBEdit27
            end
            object DBEdit11: TDBEdit
              Left = 8
              Top = 24
              Width = 244
              Height = 21
              DataField = 'MOEDASINGULAR'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit12: TDBEdit
              Left = 8
              Top = 64
              Width = 244
              Height = 21
              DataField = 'MOEDAPLURAL'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit26: TDBEdit
              Left = 8
              Top = 104
              Width = 244
              Height = 21
              DataField = 'CENTAVOSINGULAR'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit27: TDBEdit
              Left = 8
              Top = 144
              Width = 244
              Height = 21
              DataField = 'CENTAVOPLURAL'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet5: TTabSheet
            Caption = '&Serviços'
            ImageIndex = 7
            object Label28: TLabel
              Left = 8
              Top = 64
              Width = 175
              Height = 13
              Cursor = crHandPoint
              Caption = 'Unidade de medida padrão'
              FocusControl = DBEdit31
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label28Click
            end
            object Label29: TLabel
              Left = 8
              Top = 112
              Width = 89
              Height = 13
              Cursor = crHandPoint
              Caption = 'Grupo padrão'
              FocusControl = DBEdit33
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = Label29Click
            end
            object Bevel5: TBevel
              Left = 0
              Top = 48
              Width = 369
              Height = 9
              Shape = bsTopLine
            end
            object DBEdit31: TDBEdit
              Left = 8
              Top = 80
              Width = 64
              Height = 21
              DataField = 'MEDIDA_SER'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit32: TDBEdit
              Left = 80
              Top = 80
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'UNIDADE'
              DataSource = dmoSisconfig.dsrMEDIDA_SER
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit33: TDBEdit
              Left = 8
              Top = 128
              Width = 64
              Height = 21
              DataField = 'GRUPO_SER'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit34: TDBEdit
              Left = 80
              Top = 128
              Width = 265
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'GRUPO'
              DataSource = dmoSisconfig.dsrGRUPO_SER
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBCheckBox8: TDBCheckBox
              Left = 8
              Top = 16
              Width = 169
              Height = 17
              Caption = 'Técnico Login = Vendedor'
              DataField = 'SENHA_CLIENTES'
              DataSource = dsrDetalhes
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object TabSheet6: TTabSheet
            Caption = '&Segurança'
            ImageIndex = 8
            object Label32: TLabel
              Left = 8
              Top = 8
              Width = 172
              Height = 13
              Caption = 'Tempo para logoff automático'
              FocusControl = DBEdit39
            end
            object Label33: TLabel
              Left = 79
              Top = 27
              Width = 54
              Height = 13
              Caption = 'segundos'
            end
            object Bevel4: TBevel
              Left = 0
              Top = 64
              Width = 369
              Height = 9
              Shape = bsTopLine
            end
            object Label12: TLabel
              Left = 8
              Top = 72
              Width = 199
              Height = 13
              Caption = 'Ativar confirmação de senha para:'
            end
            object DBEdit39: TDBEdit
              Left = 8
              Top = 24
              Width = 64
              Height = 21
              DataField = 'LOGTIMEOFF'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBCheckBox2: TDBCheckBox
              Left = 24
              Top = 88
              Width = 169
              Height = 17
              Caption = 'Salvar dados do Cliente'
              DataField = 'SENHA_CLIENTES'
              DataSource = dsrDetalhes
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 24
              Top = 104
              Width = 169
              Height = 17
              Caption = 'Salvar dados do Produto'
              DataField = 'SENHA_PRODUTOS'
              DataSource = dsrDetalhes
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 24
              Top = 120
              Width = 137
              Height = 17
              Caption = 'Salvar dados da OS'
              DataField = 'SENHA_OS'
              DataSource = dsrDetalhes
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox6: TDBCheckBox
              Left = 24
              Top = 136
              Width = 185
              Height = 17
              Caption = 'Fechamento de OS e Venda'
              DataField = 'SENHA_FECHAMENTO'
              DataSource = dsrDetalhes
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox7: TDBCheckBox
              Left = 24
              Top = 152
              Width = 209
              Height = 17
              Caption = 'Baixa de Conta Receber/Pagar'
              DataField = 'SENHA_BAIXA'
              DataSource = dsrDetalhes
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Msg Saidas'
            ImageIndex = 9
            object Label43: TLabel
              Left = 8
              Top = 8
              Width = 108
              Height = 13
              Caption = 'Mensagem na O.S.'
            end
            object Label44: TLabel
              Left = 8
              Top = 128
              Width = 119
              Height = 13
              Caption = 'Mensagem na Venda'
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 24
              Width = 337
              Height = 89
              DataField = 'MENSAGEM_OS'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBMemo2: TDBMemo
              Left = 8
              Top = 144
              Width = 337
              Height = 89
              DataField = 'MENSAGEM_VENDA'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Msg Orçamentos'
            ImageIndex = 10
            object Label45: TLabel
              Left = 8
              Top = 8
              Width = 212
              Height = 13
              Caption = 'Condições de Execução dos Serviços'
            end
            object Label46: TLabel
              Left = 8
              Top = 128
              Width = 145
              Height = 13
              Caption = 'Condições de Pagamento'
            end
            object DBMemo3: TDBMemo
              Left = 8
              Top = 24
              Width = 337
              Height = 89
              DataField = 'OSCOND1'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBMemo4: TDBMemo
              Left = 8
              Top = 144
              Width = 337
              Height = 89
              DataField = 'OSCOND2'
              DataSource = dsrDetalhes
              TabOrder = 1
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
    Left = 148
    Top = 153
  end
  object PrinterMenu: TPopupMenu
    Left = 148
    Top = 201
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 212
    Top = 153
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 212
    Top = 201
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 148
    Top = 249
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
    Left = 212
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
      'SELECT *'
      'FROM SISCONFIG'
      'WHERE  CODIGO = :CODIGO ')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 276
    Top = 153
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from SisConfig '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update SisConfig'
      'set'
      '  CODCLIENTE = :CODCLIENTE,'
      '  CODCONTA_COMPRADEB = :CODCONTA_COMPRADEB,'
      '  CODCONTA_VENDACRE = :CODCONTA_VENDACRE,'
      '  CODCLIENTE_PADRAO = :CODCLIENTE_PADRAO,'
      '  VALOR_LIMITE = :VALOR_LIMITE,'
      '  ALIQUOTA_ISS = :ALIQUOTA_ISS,'
      '  ALIQUOTA_ICMSSIMPLES = :ALIQUOTA_ICMSSIMPLES,'
      '  ICMSSIMPLES = :ICMSSIMPLES,'
      '  CODDOC_AVISTA = :CODDOC_AVISTA,'
      '  CODDOC_PRAZO = :CODDOC_PRAZO,'
      '  MDI = :MDI,'
      '  AUTOLAUNCH = :AUTOLAUNCH,'
      '  AUTOLAUNCH_TIME = :AUTOLAUNCH_TIME,'
      '  PADRAO = :PADRAO,'
      '  PRINT_OS = :PRINT_OS,'
      '  PRINT_NOTA = :PRINT_NOTA,'
      '  PRINT_BOLETO = :PRINT_BOLETO,'
      '  MOEDASINGULAR = :MOEDASINGULAR,'
      '  MOEDAPLURAL = :MOEDAPLURAL,'
      '  CENTAVOSINGULAR = :CENTAVOSINGULAR,'
      '  CENTAVOPLURAL = :CENTAVOPLURAL,'
      '  NOTA_PADRAO = :NOTA_PADRAO,'
      '  OSABERTA_PADRAO = :OSABERTA_PADRAO,'
      '  OSFECHADA_PADRAO = :OSFECHADA_PADRAO,'
      '  MEDIDA_SER = :MEDIDA_SER,'
      '  GRUPO_SER = :GRUPO_SER,'
      '  LOGTIMEOFF = :LOGTIMEOFF,'
      '  PRINT_OS2 = :PRINT_OS2,'
      '  PRINT_RECIBO = :PRINT_RECIBO,'
      '  JUROS_MES = :JUROS_MES,'
      '  COPIAS_OS = :COPIAS_OS,'
      '  COPIAS_OS2 = :COPIAS_OS2,'
      '  COPIAS_RECIBO = :COPIAS_RECIBO,'
      '  RECIBO_PADRAO = :RECIBO_PADRAO,'
      '  FISCAL_MAQ = :FISCAL_MAQ,'
      '  FISCAL_CONF = :FISCAL_CONF,'
      '  BLOQUEIO_DIAS = :BLOQUEIO_DIAS,'
      '  OSABERTA_PADRAO_2A = :OSABERTA_PADRAO_2A,'
      '  COPIAS_OS_2A = :COPIAS_OS_2A,'
      '  PRINT_OS_2A = :PRINT_OS_2A,'
      '  NATUOPER_PADRAO = :NATUOPER_PADRAO,'
      '  SENHA_CLIENTES = :SENHA_CLIENTES,'
      '  SENHA_PRODUTOS = :SENHA_PRODUTOS,'
      '  SENHA_FECHAMENTO = :SENHA_FECHAMENTO,'
      '  SENHA_OS = :SENHA_OS,'
      '  SENHA_BAIXA = :SENHA_BAIXA,'
      '  TECNICOLOGIN_VENDEDOR = :TECNICOLOGIN_VENDEDOR,'
      '  ID = :ID,'
      '  NATUOPER_COMPRA = :NATUOPER_COMPRA,'
      '  MENSAGEM_OS = :MENSAGEM_OS,'
      '  MENSAGEM_VENDA = :MENSAGEM_VENDA,'
      '  OSCOND1 = :OSCOND1,'
      '  OSCOND2 = :OSCOND2'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into SisConfig'
      '  (CODIGO, CODCLIENTE, CODCONTA_COMPRADEB, CODCONTA_VENDACRE, '
      'CODCLIENTE_PADRAO, '
      
        '   VALOR_LIMITE, ALIQUOTA_ISS, ALIQUOTA_ICMSSIMPLES, ICMSSIMPLES' +
        ', '
      'CODDOC_AVISTA, '
      '   CODDOC_PRAZO, MDI, AUTOLAUNCH, AUTOLAUNCH_TIME, PADRAO, '
      'PRINT_OS, PRINT_NOTA, '
      '   PRINT_BOLETO, MOEDASINGULAR, MOEDAPLURAL, CENTAVOSINGULAR, '
      'CENTAVOPLURAL, '
      '   NOTA_PADRAO, OSABERTA_PADRAO, OSFECHADA_PADRAO, MEDIDA_SER, '
      'GRUPO_SER, '
      '   LOGTIMEOFF, PRINT_OS2, PRINT_RECIBO, JUROS_MES, COPIAS_OS, '
      'COPIAS_OS2, '
      '   COPIAS_RECIBO, RECIBO_PADRAO, FISCAL_MAQ, FISCAL_CONF, '
      'BLOQUEIO_DIAS, '
      '   OSABERTA_PADRAO_2A, COPIAS_OS_2A, PRINT_OS_2A, '
      'NATUOPER_PADRAO, SENHA_CLIENTES, '
      '   SENHA_PRODUTOS, SENHA_FECHAMENTO, SENHA_OS, SENHA_BAIXA, '
      'TECNICOLOGIN_VENDEDOR, '
      '   ID, NATUOPER_COMPRA, MENSAGEM_OS, MENSAGEM_VENDA, OSCOND1, '
      'OSCOND2)'
      'values'
      
        '  (:CODIGO, :CODCLIENTE, :CODCONTA_COMPRADEB, :CODCONTA_VENDACRE' +
        ', '
      ':CODCLIENTE_PADRAO, '
      
        '   :VALOR_LIMITE, :ALIQUOTA_ISS, :ALIQUOTA_ICMSSIMPLES, :ICMSSIM' +
        'PLES, '
      ':CODDOC_AVISTA, '
      '   :CODDOC_PRAZO, :MDI, :AUTOLAUNCH, :AUTOLAUNCH_TIME, :PADRAO, '
      ':PRINT_OS, '
      '   :PRINT_NOTA, :PRINT_BOLETO, :MOEDASINGULAR, :MOEDAPLURAL, '
      ':CENTAVOSINGULAR, '
      '   :CENTAVOPLURAL, :NOTA_PADRAO, :OSABERTA_PADRAO, '
      ':OSFECHADA_PADRAO, :MEDIDA_SER, '
      
        '   :GRUPO_SER, :LOGTIMEOFF, :PRINT_OS2, :PRINT_RECIBO, :JUROS_ME' +
        'S, '
      ':COPIAS_OS, '
      '   :COPIAS_OS2, :COPIAS_RECIBO, :RECIBO_PADRAO, :FISCAL_MAQ, '
      ':FISCAL_CONF, '
      
        '   :BLOQUEIO_DIAS, :OSABERTA_PADRAO_2A, :COPIAS_OS_2A, :PRINT_OS' +
        '_2A, '
      ':NATUOPER_PADRAO, '
      '   :SENHA_CLIENTES, :SENHA_PRODUTOS, :SENHA_FECHAMENTO, '
      ':SENHA_OS, :SENHA_BAIXA, '
      '   :TECNICOLOGIN_VENDEDOR, :ID, :NATUOPER_COMPRA, :MENSAGEM_OS, '
      ':MENSAGEM_VENDA, '
      '   :OSCOND1, :OSCOND2)')
    DeleteSQL.Strings = (
      'delete from SisConfig'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 276
    Top = 249
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 276
    Top = 201
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
    Left = 209
    Top = 101
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
    Left = 273
    Top = 101
  end
end
