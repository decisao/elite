object formImpNota: TformImpNota
  Left = 132
  Top = 90
  Width = 474
  Height = 411
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Geografia da NF'
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
    Width = 466
    Height = 377
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 458
        Height = 349
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 456
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
          Top = 302
          Width = 456
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
          Left = 371
          Top = 47
          Width = 86
          Height = 255
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
          Width = 370
          Height = 255
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 370
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
            Width = 370
            Height = 214
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
            Top = 227
            Width = 370
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
                Width = 96
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Duplicatas'
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
              object btnArquivos: TToolbarButton97
                Left = 0
                Top = 0
                Width = 73
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Corpo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = lblMENSAGEMClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnEmail: TToolbarButton97
                Left = 259
                Top = 0
                Width = 90
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Serviços'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = Label17Click
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object ToolbarButton971: TToolbarButton97
                Left = 169
                Top = 0
                Width = 90
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
                ParentShowHint = False
                ShowHint = True
                OnClick = Label13Click
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
        Left = 372
        Top = 0
        Width = 86
        Height = 349
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
        Width = 372
        Height = 349
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
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
          Width = 370
          Height = 347
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            Left = 8
            Top = 11
            Width = 40
            Height = 13
            Caption = 'Código'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 8
            Top = 59
            Width = 56
            Height = 13
            Caption = 'Descrição'
            FocusControl = dedNOME
          end
          object Label7: TLabel
            Left = 80
            Top = 11
            Width = 34
            Height = 13
            Caption = 'Altura'
            FocusControl = DBEdit2
          end
          object Label18: TLabel
            Left = 152
            Top = 11
            Width = 63
            Height = 13
            Caption = 'Efeito base'
            FocusControl = DBEdit11
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 27
            Width = 64
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NUMIMPNOTA'
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
            Left = 8
            Top = 75
            Width = 337
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = dsrDetalhes
            TabOrder = 4
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 27
            Width = 64
            Height = 21
            DataField = 'ALTURA'
            DataSource = dsrDetalhes
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 224
            Top = 11
            Width = 137
            Height = 39
            Caption = ' Espaço entre linhas '
            Columns = 2
            DataField = 'LINHA18'
            DataSource = dsrDetalhes
            Items.Strings = (
              '1/6'
              '1/8')
            TabOrder = 3
            Values.Strings = (
              'N'
              'S')
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 104
            Width = 353
            Height = 65
            Caption = ' Duplicatas '
            TabOrder = 5
            object Label8: TLabel
              Left = 136
              Top = 16
              Width = 46
              Height = 13
              Caption = 'Colunas'
              FocusControl = DBEdit3
            end
            object Label9: TLabel
              Left = 264
              Top = 16
              Width = 66
              Height = 13
              Caption = 'tam.Coluna'
              FocusControl = DBEdit4
            end
            object Label10: TLabel
              Left = 200
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Linhas'
              FocusControl = DBEdit5
            end
            object Label16: TLabel
              Left = 8
              Top = 16
              Width = 47
              Height = 13
              Caption = 'Linha ini'
              FocusControl = DBEdit10
            end
            object Label13: TLabel
              Left = 72
              Top = 16
              Width = 57
              Height = 13
              Caption = 'Coluna ini'
              FocusControl = DBEdit12
            end
            object DBEdit3: TDBEdit
              Left = 136
              Top = 32
              Width = 57
              Height = 21
              DataField = 'DUP_COLUNAS'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit4: TDBEdit
              Left = 264
              Top = 32
              Width = 57
              Height = 21
              DataField = 'DUP_TAMANHOCOL'
              DataSource = dsrDetalhes
              TabOrder = 4
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit5: TDBEdit
              Left = 200
              Top = 32
              Width = 57
              Height = 21
              DataField = 'DUP_LINHAS'
              DataSource = dsrDetalhes
              TabOrder = 3
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 32
              Width = 57
              Height = 21
              DataField = 'DUP_LINHAINI'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit12: TDBEdit
              Left = 72
              Top = 32
              Width = 57
              Height = 21
              DataField = 'DUP_COLUNAINI'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 176
            Width = 353
            Height = 65
            Caption = ' Produtos '
            TabOrder = 6
            object Label12: TLabel
              Left = 72
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Linhas'
              FocusControl = DBEdit7
            end
            object Label11: TLabel
              Left = 8
              Top = 16
              Width = 47
              Height = 13
              Caption = 'Linha ini'
              FocusControl = DBEdit6
            end
            object DBEdit7: TDBEdit
              Left = 72
              Top = 32
              Width = 57
              Height = 21
              DataField = 'PRO_LINHAS'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 32
              Width = 57
              Height = 21
              DataField = 'PRO_LINHAINI'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object GroupBox3: TGroupBox
            Left = 8
            Top = 248
            Width = 353
            Height = 65
            Caption = ' Serviços '
            TabOrder = 7
            object Label14: TLabel
              Left = 8
              Top = 16
              Width = 47
              Height = 13
              Caption = 'Linha ini'
              FocusControl = DBEdit8
            end
            object Label15: TLabel
              Left = 72
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Linhas'
              FocusControl = DBEdit9
            end
            object DBEdit8: TDBEdit
              Left = 8
              Top = 32
              Width = 57
              Height = 21
              DataField = 'SER_LINHAINI'
              DataSource = dsrDetalhes
              TabOrder = 0
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit9: TDBEdit
              Left = 72
              Top = 32
              Width = 57
              Height = 21
              DataField = 'SER_LINHAS'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object DBEdit11: TDBEdit
            Left = 152
            Top = 27
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'EFEITOBASE'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
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
    Left = 380
    Top = 129
  end
  object PrinterMenu: TPopupMenu
    Left = 380
    Top = 185
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 468
    Top = 129
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 468
    Top = 185
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 52
    Top = 329
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
    Left = 380
    Top = 241
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterInsert = qryDetalhesAfterInsert
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM IMPNOTA'
      'WHERE ( NUMIMPNOTA = :NUMIMPNOTA )')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 548
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMIMPNOTA'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update IMPNOTA'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  LINHA18 = :LINHA18,'
      '  ALTURA = :ALTURA,'
      '  DUP_LINHAINI = :DUP_LINHAINI,'
      '  DUP_COLUNAS = :DUP_COLUNAS,'
      '  DUP_COLUNAINI = :DUP_COLUNAINI,'
      '  DUP_TAMANHOCOL = :DUP_TAMANHOCOL,'
      '  DUP_LINHAS = :DUP_LINHAS,'
      '  PRO_LINHAINI = :PRO_LINHAINI,'
      '  PRO_LINHAS = :PRO_LINHAS,'
      '  SER_LINHAINI = :SER_LINHAINI,'
      '  SER_LINHAS = :SER_LINHAS,'
      '  EFEITOBASE = :EFEITOBASE'
      'where'
      '  NUMIMPNOTA = :OLD_NUMIMPNOTA'
      ' ')
    InsertSQL.Strings = (
      'insert into IMPNOTA'
      
        '  (NUMIMPNOTA, DESCRICAO, LINHA18, ALTURA, DUP_LINHAINI, DUP_COL' +
        'UNAINI, DUP_COLUNAS, DUP_TAMANHOCOL, '
      
        '   DUP_LINHAS, PRO_LINHAINI, PRO_LINHAS, SER_LINHAINI, SER_LINHA' +
        'S, EFEITOBASE)'
      'values'
      
        '  (:NUMIMPNOTA, :DESCRICAO, :LINHA18, :ALTURA, :DUP_LINHAINI, :D' +
        'UP_COLUNAINI, :DUP_COLUNAS,'
      
        '   :DUP_TAMANHOCOL, :DUP_LINHAS, :PRO_LINHAINI, :PRO_LINHAS, :SE' +
        'R_LINHAINI,'
      '   :SER_LINHAS, :EFEITOBASE)'
      ' ')
    DeleteSQL.Strings = (
      'delete from IMPNOTA'
      'where'
      '  NUMIMPNOTA = :OLD_NUMIMPNOTA')
    Left = 548
    Top = 241
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 548
    Top = 185
  end
  object FotoMenu: TPopupMenu
    Left = 465
    Top = 243
    object Abrirdoarquivo1: TMenuItem
      Caption = '&Abrir do arquivo...'
    end
    object Colardareadetransferncia1: TMenuItem
      Caption = '&Colar (da área de transferência)'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Apagar1: TMenuItem
      Caption = 'Apaga&r'
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
    Left = 465
    Top = 69
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
    Left = 545
    Top = 69
  end
end
