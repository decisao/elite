object formITcompra: TformITcompra
  Left = 240
  Top = 170
  Width = 473
  Height = 361
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
    Width = 465
    Height = 327
    ActivePage = tabVisual
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tabVisual: TTabSheet
      Caption = '&Pesquisa e Seleção'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 457
        Height = 299
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Dock971: TDock97
          Left = 1
          Top = 1
          Width = 455
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
          Left = 370
          Top = 47
          Width = 86
          Height = 251
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
          Width = 369
          Height = 251
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object lblWhere: TLabel
            Left = 0
            Top = 0
            Width = 369
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
            Width = 369
            Height = 210
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
            Top = 223
            Width = 369
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
                Width = 161
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Produtos Individuais'
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
        Left = 371
        Top = 0
        Width = 86
        Height = 299
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
        Width = 371
        Height = 299
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
          Width = 369
          Height = 302
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblCLIENTE: TLabel
            Left = 8
            Top = 8
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
            OnClick = lblCLIENTEClick
          end
          object Label5: TLabel
            Left = 80
            Top = 93
            Width = 65
            Height = 13
            Caption = 'Quantidade'
            FocusControl = DBEdit1
          end
          object Label6: TLabel
            Left = 80
            Top = 53
            Width = 77
            Height = 13
            Caption = 'Valor unitário'
            FocusControl = DBEdit2
          end
          object Label8: TLabel
            Left = 80
            Top = 133
            Width = 84
            Height = 13
            Caption = 'TOTAL do item'
            FocusControl = DBEdit4
          end
          object Label11: TLabel
            Left = 208
            Top = 173
            Width = 46
            Height = 13
            Caption = 'Margem'
            FocusControl = DBEdit9
          end
          object Label12: TLabel
            Left = 208
            Top = 53
            Width = 48
            Height = 13
            Caption = 'Imagem'
            FocusControl = DBEdit4
          end
          object Label3: TLabel
            Left = 80
            Top = 213
            Width = 78
            Height = 13
            Caption = 'ICMS compra'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 80
            Top = 253
            Width = 70
            Height = 13
            Caption = 'ICMS venda'
            FocusControl = DBEdit5
          end
          object Label7: TLabel
            Left = 208
            Top = 253
            Width = 108
            Height = 13
            Caption = 'Situação Tributária'
            FocusControl = DBEdit7
          end
          object Label9: TLabel
            Left = 80
            Top = 173
            Width = 64
            Height = 13
            Caption = 'IPI compra'
            FocusControl = DBEdit8
          end
          object dedCODPRODUTO: TDBEdit
            Left = 8
            Top = 24
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
            Top = 24
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
            TabOrder = 12
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 109
            Width = 113
            Height = 21
            DataField = 'QUANTIDADE'
            DataSource = dsrDetalhes
            TabOrder = 2
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit1KeyPress
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 69
            Width = 113
            Height = 21
            DataField = 'VALOR_UNITARIO'
            DataSource = dsrDetalhes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit2KeyPress
          end
          object DBEdit4: TDBEdit
            Left = 80
            Top = 149
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
            TabOrder = 3
          end
          object DBEdit9: TDBEdit
            Left = 208
            Top = 189
            Width = 121
            Height = 21
            TabStop = False
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
            TabOrder = 10
          end
          object DBImage1: TDBImage
            Left = 208
            Top = 69
            Width = 121
            Height = 102
            DataField = 'FOTO'
            Stretch = True
            TabOrder = 9
            TabStop = False
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 229
            Width = 113
            Height = 21
            DataField = 'ICMSCOMPRA'
            DataSource = dsrDetalhes
            TabOrder = 5
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit3KeyPress
          end
          object DBEdit5: TDBEdit
            Left = 80
            Top = 269
            Width = 113
            Height = 21
            DataField = 'ICMSVENDA'
            DataSource = dsrDetalhes
            TabOrder = 6
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit5KeyPress
          end
          object DBEdit6: TDBEdit
            Left = 208
            Top = 229
            Width = 121
            Height = 21
            DataField = 'VALOR_VENDA'
            DataSource = dsrDetalhes
            TabOrder = 8
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit6KeyPress
          end
          object DBCheckBox1: TDBCheckBox
            Left = 208
            Top = 212
            Width = 137
            Height = 17
            Caption = 'Reajustar preço venda'
            DataField = 'REAJUSTAR'
            DataSource = dsrDetalhes
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit7: TDBEdit
            Left = 208
            Top = 269
            Width = 121
            Height = 21
            DataField = 'SITTRIBU'
            DataSource = dsrDetalhes
            TabOrder = 7
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit8: TDBEdit
            Left = 80
            Top = 189
            Width = 113
            Height = 21
            DataField = 'IPI'
            DataSource = dsrDetalhes
            TabOrder = 4
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
            OnKeyPress = DBEdit3KeyPress
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
    Left = 140
    Top = 169
  end
  object PrinterMenu: TPopupMenu
    Left = 140
    Top = 113
  end
  object qrySelecionar: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traSelecionar
    AfterOpen = qrySelecionarAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    Left = 236
    Top = 113
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 276
    Top = 161
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 196
    Top = 41
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
    Left = 236
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
      'SELECT * FROM TEMPITENS'
      'WHERE (CODIGO = :CODIGO)')
    UniDirectional = True
    UpdateObject = updDetalhes
    Left = 340
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
      'update TEMPITENS'
      'set'
      '  CODMOVIMENTO = :CODMOVIMENTO,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO,'
      '  DESCONTO = :DESCONTO,'
      '  SITTRIBU = :SITTRIBU,'
      '  MARGEM = :MARGEM,'
      '  REAJUSTAR = :REAJUSTAR,'
      '  VALOR_VENDA = :VALOR_VENDA,'
      '  ICMSCOMPRA = :ICMSCOMPRA,'
      '  ICMSVENDA = :ICMSVENDA,'
      '  IPI = :IPI'
      'where'
      '  CODIGO = :OLD_CODIGO'
      ' ')
    InsertSQL.Strings = (
      'insert into TEMPITENS'
      
        '  (CODIGO, CODMOVIMENTO, CODPRODUTO, QUANTIDADE, VALOR_UNITARIO,' +
        ' '
      'DESCONTO, '
      '   SITTRIBU, MARGEM, REAJUSTAR, VALOR_VENDA, ICMSCOMPRA, '
      'ICMSVENDA, IPI)'
      'values'
      '  (:CODIGO, :CODMOVIMENTO, :CODPRODUTO, :QUANTIDADE,'
      ':VALOR_UNITARIO, :DESCONTO,'
      '   :SITTRIBU, :MARGEM, :REAJUSTAR, :VALOR_VENDA, :ICMSCOMPRA,'
      ':ICMSVENDA, :IPI)'
      ' ')
    DeleteSQL.Strings = (
      'delete from TEMPITENS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 340
    Top = 217
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 340
    Top = 169
  end
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    AutoCalcFields = False
    AfterOpen = qryProdutoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO , PRECOVENDA , PRECOCUSTO,'
      ' MARGEM , ICMS ,  FOTO'
      'FROM PRODUTOS'
      'WHERE '
      ' ( CODIGO = :CODIGO )'
      '')
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
    Left = 337
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
    Top = 109
  end
end
