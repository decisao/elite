object formITorcamento: TformITorcamento
  Left = 266
  Top = 124
  Width = 475
  Height = 363
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Itens'
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
    Width = 467
    Height = 329
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 459
        Height = 301
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 457
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
          Left = 372
          Top = 47
          Width = 86
          Height = 253
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
          Width = 371
          Height = 253
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 371
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
            Width = 371
            Height = 240
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
        Height = 303
        BoundLines = [blTop, blBottom, blLeft, blRight]
        Color = clBtnHighlight
        Position = dpRight
        object Toolbar971: TToolbar97
          Left = 0
          Top = 0
          Caption = 'Toolbar972'
          Color = clBtnHighlight
          DockPos = 0
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
        Height = 303
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
          Height = 344
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblPRODUTO: TLabel
            Left = 8
            Top = 24
            Width = 51
            Height = 13
            Cursor = crHandPoint
            Caption = 'Produto'
            FocusControl = dedCODPRODUTO
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = lblPRODUTOClick
          end
          object Label5: TLabel
            Left = 80
            Top = 149
            Width = 65
            Height = 13
            Caption = 'Quantidade'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 80
            Top = 69
            Width = 77
            Height = 13
            Caption = 'Valor unitário'
            FocusControl = DBEdit2
          end
          object Label7: TLabel
            Left = 80
            Top = 109
            Width = 53
            Height = 13
            Caption = 'Desconto'
            FocusControl = DBEdit3
          end
          object Label8: TLabel
            Left = 80
            Top = 189
            Width = 84
            Height = 13
            Caption = 'TOTAL do item'
            FocusControl = DBEdit4
          end
          object Label9: TLabel
            Left = 208
            Top = 69
            Width = 31
            Height = 13
            Caption = 'ICMS'
            FocusControl = DBEdit6
          end
          object Label11: TLabel
            Left = 208
            Top = 109
            Width = 46
            Height = 13
            Caption = 'Margem'
            FocusControl = DBEdit9
          end
          object Label12: TLabel
            Left = 208
            Top = 149
            Width = 48
            Height = 13
            Caption = 'Imagem'
            FocusControl = DBEdit4
          end
          object dedCODPRODUTO: TDBEdit
            Left = 8
            Top = 40
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODPRODUTO'
            DataSource = dsrDetalhes
            TabOrder = 0
            OnEnter = dedCODPRODUTOEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit15: TDBEdit
            Left = 80
            Top = 40
            Width = 273
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'DESCRICAO'
            DataSource = dsrProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 165
            Width = 113
            Height = 21
            DataField = 'QUANTIDADE'
            DataSource = dsrDetalhes
            TabOrder = 3
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 85
            Width = 113
            Height = 22
            DataField = 'VALOR_UNITARIO'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 125
            Width = 113
            Height = 21
            DataField = 'DESCONTO'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit4: TDBEdit
            Left = 80
            Top = 205
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'VALOR_TOTAL'
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
          object DBEdit5: TDBEdit
            Left = 80
            Top = 8
            Width = 177
            Height = 22
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clBtnFace
            DataField = 'GRUPO'
            DataSource = dsrProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            Left = 208
            Top = 85
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'ICMS'
            DataSource = dsrProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            Left = 272
            Top = 8
            Width = 81
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'UNIDADE'
            DataSource = dsrProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit9: TDBEdit
            Left = 208
            Top = 125
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'MARGEM'
            DataSource = dsrProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBImage1: TDBImage
            Left = 208
            Top = 165
            Width = 113
            Height = 95
            DataField = 'FOTO'
            DataSource = dsrProduto
            Stretch = True
            TabOrder = 10
          end
        end
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 365
    MinMaxInfo.MinTrackWidth = 477
    UseRegistry = True
    StoredProps.Strings = (
      'grdDados.Zebra'
      'grdDados.ZebraColor'
      'grdDados.ZebraFontColor')
    StoredValues = <>
    Left = 148
    Top = 129
  end
  object PrinterMenu: TPopupMenu
    Left = 148
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
    Left = 148
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
    Left = 148
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
      'SELECT * FROM TEMPITENS'
      'WHERE (CODIGO = :CODIGO)')
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
      'update TEMPITENS'
      'set'
      '  CODMOVIMENTO = :CODMOVIMENTO,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  DESCONTO = :DESCONTO,'
      '  SITTRIBU = :SITTRIBU,'
      '  MARGEM = :MARGEM,'
      '  VALOR_VENDA = :VALOR_VENDA,'
      '  ICMSCOMPRA = :ICMSCOMPRA,'
      '  ICMSVENDA = :ICMSVENDA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TEMPITENS'
      
        '  (CODIGO, CODMOVIMENTO, CODPRODUTO, QUANTIDADE, VALOR_UNITARIO,' +
        ' '
      'DESCONTO, '
      '  SITTRIBU, MARGEM, VALOR_VENDA, ICMSCOMPRA, ICMSVENDA)'
      'values'
      '  (:CODIGO, :CODMOVIMENTO, :CODPRODUTO, :QUANTIDADE, '
      ':VALOR_UNITARIO, :DESCONTO, '
      '   :SITTRIBU, :MARGEM, :VALOR_VENDA, :ICMSCOMPRA, :ICMSVENDA)')
    DeleteSQL.Strings = (
      'delete from TEMPITENS'
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
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    AutoCalcFields = False
    AfterOpen = qryProdutoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT PRODUTOS.CODIGO , DESCRICAO , PRECOVENDA , '
      ' MARGEM , ICMS , FOTO, GRUPOS.GRUPO , '
      ' MEDIDAS.UNIDADE'
      'FROM PRODUTOS, MEDIDAS, GRUPOS'
      'WHERE ( PRODUTOS.UNIDADE = MEDIDAS.SIGLA )'
      '  AND'
      ' ( PRODUTOS.GRUPO = GRUPOS.CODIGO )'
      '  AND'
      ' ('
      ' ( PRODUTOS.CODIGO = :CODIGO )'
      ' )')
    UniDirectional = True
    Left = 24
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrProduto: TDataSource
    AutoEdit = False
    DataSet = qryProduto
    Left = 24
    Top = 224
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
  object traProduto: TIBTransaction
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
    Top = 101
  end
end
