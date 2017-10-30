object formCidades: TformCidades
  Left = 154
  Top = 116
  Width = 477
  Height = 411
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Cidades'
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
        Width = 461
        Height = 349
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
        object Dock973: TDock97
          Left = 1
          Top = 302
          Width = 459
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
          Left = 374
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
          Width = 373
          Height = 255
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
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
            Height = 242
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
        Left = 375
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
        Width = 375
        Height = 349
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
          Height = 200
          Align = alTop
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
            Left = 80
            Top = 11
            Width = 95
            Height = 13
            Caption = 'Nome da Cidade'
            FocusControl = DBEdit2
          end
          object lblESTADO: TLabel
            Left = 8
            Top = 56
            Width = 44
            Height = 13
            Cursor = crHandPoint
            Caption = 'Estado'
            FocusControl = DBEdit14
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = lblESTADOClick
          end
          object Label7: TLabel
            Left = 8
            Top = 100
            Width = 22
            Height = 13
            Caption = 'SID'
            FocusControl = DBEdit3
          end
          object Label8: TLabel
            Left = 80
            Top = 100
            Width = 27
            Height = 13
            Caption = 'DDD'
            FocusControl = DBEdit4
          end
          object Label9: TLabel
            Left = 8
            Top = 144
            Width = 23
            Height = 13
            Caption = 'CEP'
            FocusControl = DBEdit5
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 27
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
          object DBEdit2: TDBEdit
            Left = 80
            Top = 27
            Width = 265
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CIDADE'
            DataSource = dsrDetalhes
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit14: TDBEdit
            Left = 8
            Top = 72
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ESTADO'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit15: TDBEdit
            Left = 80
            Top = 72
            Width = 137
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'ESTADO'
            DataSource = dmoRelacCidades.dsrEstado
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit3: TDBEdit
            Left = 8
            Top = 116
            Width = 65
            Height = 21
            DataField = 'SID'
            DataSource = dsrDetalhes
            TabOrder = 4
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit4: TDBEdit
            Left = 80
            Top = 116
            Width = 41
            Height = 21
            DataField = 'DDD'
            DataSource = dsrDetalhes
            TabOrder = 5
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit5: TDBEdit
            Left = 8
            Top = 160
            Width = 113
            Height = 21
            DataField = 'CEP'
            DataSource = dsrDetalhes
            TabOrder = 6
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
    Left = 156
    Top = 129
  end
  object PrinterMenu: TPopupMenu
    Left = 156
    Top = 185
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 244
    Top = 129
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 244
    Top = 185
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 156
    Top = 297
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
    Top = 241
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterInsert = qryDetalhesAfterInsert
    AfterOpen = qryDetalhesAfterOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT CODIGO, CIDADE, '
      ' ESTADO, SID, DDD, CEP'
      'FROM Cidades'
      'WHERE ( CODIGO = :CODIGO ) AND ( ESTADO = :ESTADO)')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 324
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
  end
  object updDetalhes: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CIDADE,'
      '  ESTADO,'
      '  SID,'
      '  DDD,'
      '  CEP'
      'from CIDADES '
      'where'
      '  CODIGO = :CODIGO and'
      '  ESTADO = :ESTADO')
    ModifySQL.Strings = (
      'update CIDADES'
      'set'
      '  CIDADE = :CIDADE,'
      '  ESTADO = :ESTADO,'
      '  SID = :SID,'
      '  DDD = :DDD,'
      '  CEP = :CEP'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  ESTADO = :OLD_ESTADO')
    InsertSQL.Strings = (
      'insert into CIDADES'
      '  (CODIGO, CIDADE, ESTADO, SID, DDD, CEP)'
      'values'
      '  (:CODIGO, :CIDADE, :ESTADO, :SID, :DDD, :CEP)')
    DeleteSQL.Strings = (
      'delete from CIDADES'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  ESTADO = :OLD_ESTADO')
    Left = 324
    Top = 241
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 324
    Top = 185
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
    Left = 245
    Top = 80
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
    Left = 329
    Top = 77
  end
end
