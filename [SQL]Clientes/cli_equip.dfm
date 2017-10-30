object formCli_equip: TformCli_equip
  Left = 386
  Top = 146
  Width = 477
  Height = 371
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Equipamentos'
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
  object Label8: TLabel
    Left = 24
    Top = 240
    Width = 37
    Height = 13
    Caption = 'Label8'
  end
  object pgcDados: TPageControl
    Left = 0
    Top = 0
    Width = 469
    Height = 337
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 461
        Height = 309
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
              OnClick = btnSairClick
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
          Width = 373
          Height = 261
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
            Width = 373
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
              object btnArquivos: TToolbarButton97
                Left = 0
                Top = 0
                Width = 169
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Cartas de Manutenção'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = btnArquivosClick
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
        Left = 375
        Top = 0
        Width = 86
        Height = 309
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
        Width = 375
        Height = 309
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
          Width = 373
          Height = 272
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label6: TLabel
            Left = 96
            Top = 83
            Width = 65
            Height = 13
            Caption = 'nº de Série'
            FocusControl = dedSERIE
          end
          object Label3: TLabel
            Left = 8
            Top = 3
            Width = 39
            Height = 13
            Cursor = crHandPoint
            Caption = 'Marca'
            FocusControl = dedNOME
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = Label3Click
          end
          object Label4: TLabel
            Left = 8
            Top = 43
            Width = 46
            Height = 13
            Cursor = crHandPoint
            Caption = 'Modelo'
            FocusControl = DBEdit3
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = Label4Click
          end
          object Label9: TLabel
            Left = 16
            Top = 208
            Width = 96
            Height = 13
            Caption = 'Tipo de Contrato'
          end
          object Label53: TLabel
            Left = 217
            Top = 208
            Width = 64
            Height = 13
            Caption = 'Numerador'
          end
          object dedSERIE: TDBEdit
            Left = 96
            Top = 99
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object dedNOME: TDBEdit
            Left = 8
            Top = 19
            Width = 81
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODMARCA'
            DataSource = dsrDetalhes
            TabOrder = 0
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit3: TDBEdit
            Left = 8
            Top = 59
            Width = 81
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODMODELO'
            DataSource = dsrDetalhes
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit1: TDBEdit
            Left = 96
            Top = 19
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            Color = clBtnFace
            DataField = 'DESCRICAO'
            DataSource = dsrMarca
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit4: TDBEdit
            Left = 96
            Top = 59
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            Color = clBtnFace
            DataField = 'DESCRICAO'
            DataSource = dsrModelo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 128
            Width = 337
            Height = 73
            Caption = '          '
            TabOrder = 3
            object Label5: TLabel
              Left = 88
              Top = 19
              Width = 62
              Height = 13
              Caption = 'Data Início'
              FocusControl = DBEdit2
            end
            object Label7: TLabel
              Left = 208
              Top = 19
              Width = 78
              Height = 13
              Caption = 'Data Término'
              FocusControl = DBEdit5
            end
            object DBCheckBox1: TDBCheckBox
              Left = 14
              Top = -2
              Width = 75
              Height = 17
              Caption = 'Garantia'
              DataField = 'GARANTIA'
              DataSource = dsrDetalhes
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit2: TDBEdit
              Left = 88
              Top = 35
              Width = 105
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DATAINI'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit5: TDBEdit
              Left = 208
              Top = 35
              Width = 113
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DATAFIM'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
          end
          object DBComboBox1: TDBComboBox
            Left = 16
            Top = 224
            Width = 185
            Height = 21
            DataField = 'TIPOCONTRATO'
            DataSource = dsrDetalhes
            ItemHeight = 13
            Items.Strings = (
              'Manutenção'
              'Demanda'
              'Locação'
              'Garantia')
            TabOrder = 6
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit38: TDBEdit
            Left = 216
            Top = 223
            Width = 129
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUMERADOR'
            DataSource = dsrDetalhes
            TabOrder = 7
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 371
    MinMaxInfo.MinTrackWidth = 477
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor')
    StoredValues = <>
    Left = 156
    Top = 105
  end
  object PrinterMenu: TPopupMenu
    Left = 156
    Top = 161
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 244
    Top = 105
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 244
    Top = 161
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 228
    Top = 281
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
    Top = 217
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
      'FROM Cli_equip'
      
        'WHERE ( CODCLIENTE = :CODCLIENTE AND CODEQUIPAMENTO = :CODEQUIPA' +
        'MENTO )')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 324
    Top = 105
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEQUIPAMENTO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    ModifySQL.Strings = (
      'update cli_equip'
      'set'
      '  CODMARCA = :CODMARCA,'
      '  CODMODELO = :CODMODELO,'
      '  SERIE = :SERIE,'
      '  GARANTIA = :GARANTIA,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  TIPOCONTRATO = :TIPOCONTRATO,'
      '  NUMERADOR = :NUMERADOR'
      'where'
      '  CODCLIENTE = :OLD_CODCLIENTE AND'
      '  CODEQUIPAMENTO = :OLD_CODEQUIPAMENTO'
      ' ')
    InsertSQL.Strings = (
      'insert into cli_equip'
      '  (CODCLIENTE, CODEQUIPAMENTO, CODMARCA, CODMODELO, SERIE,'
      '   GARANTIA, DATAINI, DATAFIM, TIPOCONTRATO, NUMERADOR)'
      'values'
      '  (:CODCLIENTE, :CODEQUIPAMENTO, :CODMARCA, :CODMODELO, :SERIE,'
      '   :GARANTIA, :DATAINI, :DATAFIM, :TIPOCONTRATO, :NUMERADOR)'
      ' ')
    DeleteSQL.Strings = (
      'delete from cli_equip'
      'where'
      '  CODCLIENTE = :OLD_CODCLIENTE AND'
      '  CODEQUIPAMENTO = :OLD_CODEQUIPAMENTO')
    Left = 324
    Top = 217
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 324
    Top = 161
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
    Left = 241
    Top = 53
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
    Top = 53
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
    Left = 22
    Top = 101
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
    Left = 21
    Top = 152
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
    Left = 21
    Top = 216
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
    Left = 94
    Top = 101
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
    Left = 93
    Top = 152
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
    Left = 93
    Top = 200
  end
end
