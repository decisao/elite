object formServicos: TformServicos
  Left = 204
  Top = 90
  Width = 477
  Height = 411
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Serviços'
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
                Width = 97
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
            Width = 43
            Height = 13
            Caption = 'Serviço'
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
          Width = 373
          Height = 291
          ActivePage = tabPessoaFisica
          Align = alClient
          TabOrder = 2
          object tabPessoaFisica: TTabSheet
            Caption = '&Serviço'
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
            object Label22: TLabel
              Left = 8
              Top = 48
              Width = 69
              Height = 13
              Caption = 'Preço Custo'
              FocusControl = DBEdit19
            end
            object Label23: TLabel
              Left = 126
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Margem lucro'
              FocusControl = DBEdit20
            end
            object Label7: TLabel
              Left = 238
              Top = 48
              Width = 72
              Height = 13
              Caption = 'Preço Venda'
              FocusControl = DBEdit3
            end
            object Label12: TLabel
              Left = 8
              Top = 96
              Width = 68
              Height = 13
              Caption = 'Cód. barras'
              FocusControl = dedBARRA
            end
            object Label19: TLabel
              Left = 8
              Top = 147
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
            object DBEdit19: TDBEdit
              Left = 8
              Top = 64
              Width = 105
              Height = 21
              DataField = 'PRECOCUSTO'
              DataSource = dsrDetalhes
              TabOrder = 2
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
              OnKeyPress = DBEdit19KeyPress
            end
            object DBEdit20: TDBEdit
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
              OnKeyPress = DBEdit3KeyPress
            end
            object dedBARRA: TDBEdit
              Left = 8
              Top = 112
              Width = 129
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
              TabOrder = 5
            end
            object DBEdit2: TDBEdit
              Left = 40
              Top = 16
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'UNIDADE'
              DataSource = dsrUnidade
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit4: TDBEdit
              Left = 200
              Top = 16
              Width = 145
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'GRUPO'
              DataSource = dsrGrupo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit16: TDBEdit
              Left = 8
              Top = 163
              Width = 57
              Height = 21
              DataField = 'CODCENTRO'
              DataSource = dsrDetalhes
              TabOrder = 8
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBEdit17: TDBEdit
              Left = 72
              Top = 163
              Width = 273
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
              TabOrder = 9
            end
            object DBCheckBox2: TDBCheckBox
              Left = 8
              Top = 208
              Width = 129
              Height = 17
              Caption = 'Ativação Telecom'
              DataField = 'ATIVACAO'
              DataSource = dsrDetalhes
              TabOrder = 10
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object tabOutros: TTabSheet
            Caption = '&Outras informações'
            object Label33: TLabel
              Left = 8
              Top = 0
              Width = 80
              Height = 13
              Caption = 'Data cadastro'
              FocusControl = DBEdit28
            end
            object Label34: TLabel
              Left = 136
              Top = 0
              Width = 74
              Height = 13
              Caption = 'Observações'
              FocusControl = DBMemo1
            end
            object DBEdit28: TDBEdit
              Left = 8
              Top = 16
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
              Left = 136
              Top = 16
              Width = 201
              Height = 185
              DataField = 'OBSERVACOES'
              DataSource = dsrDetalhes
              TabOrder = 1
              OnEnter = edtPesquisarEnter
              OnExit = edtPesquisarExit
            end
            object DBCheckBox1: TDBCheckBox
              Left = 8
              Top = 184
              Width = 97
              Height = 17
              Cursor = crHandPoint
              Caption = 'comissionado'
              DataField = 'COMISSIONADO'
              DataSource = dsrDetalhes
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
    MinMaxInfo.MinTrackHeight = 411
    MinMaxInfo.MinTrackWidth = 477
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor')
    StoredValues = <>
    Left = 196
    Top = 161
  end
  object PrinterMenu: TPopupMenu
    Left = 156
    Top = 137
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
      'SELECT * FROM Produtos'
      'WHERE ( CODIGO = :CODIGO )')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 324
    Top = 129
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
      '  BARRA = :BARRA,'
      '  PS = :PS,'
      '  COMISSIONADO = :COMISSIONADO,'
      '  CODCENTRO = :CODCENTRO,'
      '  ATIVACAO = :ATIVACAO'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' ')
    InsertSQL.Strings = (
      'insert into Produtos'
      '  (CODIGO, DESCRICAO, UNIDADE, GRUPO, PRECOCUSTO, PRECOVENDA, '
      'ICMS, MINIMO, '
      '   DATACADAST, ETIQUETA, NUMETIQ, INDIVIDUAL, SEQUENCIA, FOTO, '
      '   OBSERVACOES, BARRA, PS, COMISSIONADO, CODCENTRO, ATIVACAO)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, :UNIDADE, :GRUPO, :PRECOCUSTO, :PRECOVEN' +
        'DA,'
      ':ICMS,'
      '   :MINIMO, :DATACADAST, :ETIQUETA, :NUMETIQ, :INDIVIDUAL,'
      '   :SEQUENCIA, :FOTO, :OBSERVACOES, :BARRA, :PS, :COMISSIONADO,'
      '   :CODCENTRO, :ATIVACAO)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from Produtos'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 324
    Top = 241
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 324
    Top = 185
  end
  object FotoMenu: TPopupMenu
    Left = 249
    Top = 251
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
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.bmp;*.ico;*.emf;*.wmf)|*.gif;*.bmp;*.ico;*.emf;*.wm' +
      'f|CompuServe GIF Image (*.gif)|*.gif|Bitmaps (*.bmp)|*.bmp|Icons' +
      ' (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf' +
      ')|*.wmf'
    Title = 'Abrir imagem'
    Left = 401
    Top = 275
  end
  object qryUnidade: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traUnidade
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   UNIDADE'
      'FROM '
      '   MEDIDAS'
      'WHERE'
      '   SIGLA = :UNIDADE')
    UniDirectional = True
    Left = 25
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptUnknown
      end>
  end
  object qryGrupo: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traGrupo
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   GRUPO'
      'FROM '
      '   GRUPOS'
      'WHERE'
      '   CODIGO = :GRUPO')
    UniDirectional = True
    Left = 97
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
  end
  object dsrUnidade: TDataSource
    DataSet = qryUnidade
    Left = 25
    Top = 243
  end
  object dsrGrupo: TDataSource
    DataSet = qryGrupo
    Left = 97
    Top = 267
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
    Left = 329
    Top = 53
  end
  object traUnidade: TIBTransaction
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
    Top = 141
  end
  object traGrupo: TIBTransaction
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
    Top = 141
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
    Left = 193
    Top = 221
  end
  object qryCentro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCentro
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   DESCRICAO'
      'FROM '
      '   CENTROS'
      'WHERE'
      '   CODIGO = :CODCENTRO AND'
      '   TIPO = '#39'L'#39)
    UniDirectional = True
    Left = 193
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCENTRO'
        ParamType = ptUnknown
      end>
  end
  object dsrCentro: TDataSource
    DataSet = qryCentro
    Left = 193
    Top = 323
  end
end
