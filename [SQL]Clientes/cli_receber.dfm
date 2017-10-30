object formCli_receber: TformCli_receber
  Left = 294
  Top = 103
  Width = 477
  Height = 416
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'A Receber'
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
    Height = 382
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
        Height = 354
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
              Enabled = False
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
              object btnReceberMarcados: TToolbarButton97
                Left = 137
                Top = 0
                Width = 152
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Receber Marcados'
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
              object btnMarcar: TToolbarButton97
                Left = 0
                Top = 0
                Width = 137
                Height = 22
                Cursor = crHandPoint
                Color = clInfoBk
                Caption = 'Marcar tudo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Verdana'
                Font.Style = []
                ImageIndex = 0
                Images = dmoPrincipal.imgBotoesPeq
                Layout = blGlyphRight
                ParentFont = False
                OnClick = btnMarcarClick
                OnMouseEnter = btnAdicionarMouseEnter
                OnMouseExit = btnAdicionarMouseExit
              end
            end
          end
        end
        object Dock976: TDock97
          Left = 1
          Top = 308
          Width = 459
          Height = 45
          Position = dpBottom
          object ToolWindow972: TToolWindow97
            Left = 0
            Top = 0
            Caption = 'ToolWindow971'
            ClientAreaHeight = 41
            ClientAreaWidth = 444
            DockPos = 0
            TabOrder = 0
            object Label11: TLabel
              Left = 324
              Top = 1
              Width = 72
              Height = 13
              Caption = 'Total Listado'
              Transparent = True
            end
            object Label14: TLabel
              Left = 77
              Top = 1
              Width = 80
              Height = 13
              Caption = 'Total Marcado'
              Transparent = True
            end
            object Label15: TLabel
              Left = 4
              Top = 1
              Width = 54
              Height = 13
              Caption = 'Marcados'
              Transparent = True
            end
            object edtMarcados: TEdit
              Left = 4
              Top = 16
              Width = 61
              Height = 21
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object edtTotalMarca: TEdit
              Left = 76
              Top = 16
              Width = 109
              Height = 21
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object edtTotal: TEdit
              Left = 324
              Top = 16
              Width = 109
              Height = 21
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
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
        Height = 354
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
          object ToolbarSep973: TToolbarSep97
            Left = 0
            Top = 186
          end
          object btnBaixa: TToolbarButton97
            Left = 0
            Top = 192
            Width = 80
            Height = 60
            Cursor = crHandPoint
            Caption = '&Baixa'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ImageIndex = 10
            Images = dmoPrincipal.imgBotoes
            Layout = blGlyphTop
            Opaque = False
            ParentFont = False
            OnClick = btnBaixaClick
            OnMouseEnter = btnAdicionarMouseEnter
            OnMouseExit = btnAdicionarMouseExit
          end
        end
      end
      object panDados: TPanel
        Left = 0
        Top = 0
        Width = 375
        Height = 354
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
          Height = 302
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 45
            Height = 13
            Caption = 'Número'
            FocusControl = DBEdit1
          end
          object Label4: TLabel
            Left = 8
            Top = 52
            Width = 142
            Height = 13
            Caption = 'Descrição do movimento'
            FocusControl = DBEdit2
          end
          object Label5: TLabel
            Left = 80
            Top = 8
            Width = 83
            Height = 13
            Caption = 'Data Cadastro'
            FocusControl = DBEdit3
          end
          object Label6: TLabel
            Left = 8
            Top = 96
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label12: TLabel
            Left = 216
            Top = 8
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label13: TLabel
            Left = 120
            Top = 96
            Width = 73
            Height = 13
            Cursor = crHandPoint
            Caption = 'Documento'
            FocusControl = DBEdit9
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            OnClick = Label13Click
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 24
            Width = 64
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NUMERO'
            DataSource = dsrDetalhes
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit2: TDBEdit
            Left = 8
            Top = 68
            Width = 313
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = dsrDetalhes
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 24
            Width = 89
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'DATACADAST'
            DataSource = dsrDetalhes
            ReadOnly = True
            TabOrder = 6
          end
          object grpPago: TGroupBox
            Left = 8
            Top = 152
            Width = 353
            Height = 129
            Caption = ' Pagamento '
            TabOrder = 4
            Visible = False
            object Label7: TLabel
              Left = 16
              Top = 24
              Width = 95
              Height = 13
              Caption = 'Data Pagamento'
              FocusControl = DBEdit5
            end
            object Label8: TLabel
              Left = 16
              Top = 72
              Width = 53
              Height = 13
              Caption = 'Desconto'
              FocusControl = DBEdit6
            end
            object Label9: TLabel
              Left = 128
              Top = 72
              Width = 94
              Height = 13
              Caption = 'Multa e/ou Juros'
              FocusControl = DBEdit7
            end
            object Label10: TLabel
              Left = 232
              Top = 72
              Width = 62
              Height = 13
              Caption = 'Valor Total'
              FocusControl = DBEdit8
            end
            object DBEdit5: TDBEdit
              Left = 16
              Top = 40
              Width = 89
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DATAPAGO'
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
            object DBEdit6: TDBEdit
              Left = 16
              Top = 88
              Width = 89
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
              TabOrder = 1
            end
            object DBEdit7: TDBEdit
              Left = 128
              Top = 88
              Width = 81
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'MULTA_JUROS'
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
            object DBEdit8: TDBEdit
              Left = 232
              Top = 88
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'TOTAL_PAGO'
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
          end
          object DBDateEdit1: TDBDateEdit
            Left = 216
            Top = 24
            Width = 105
            Height = 21
            DataField = 'DATAVENCIMENTO'
            DataSource = dsrDetalhes
            NumGlyphs = 2
            TabOrder = 0
          end
          object RxDBCalcEdit1: TRxDBCalcEdit
            Left = 8
            Top = 112
            Width = 105
            Height = 21
            DataField = 'VALOR'
            DataSource = dsrDetalhes
            DisplayFormat = '#,##0.00'
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBEdit9: TDBEdit
            Left = 120
            Top = 112
            Width = 57
            Height = 21
            DataField = 'CODDOCUMENTO'
            DataSource = dsrDetalhes
            TabOrder = 3
            OnEnter = edtPesquisarEnter
            OnExit = edtPesquisarExit
          end
          object DBEdit10: TDBEdit
            Left = 184
            Top = 112
            Width = 137
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'DOCUMENTO'
            DataSource = dsrDocumento
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
      end
    end
  end
  object formStorage: TFormStorage
    Active = False
    MinMaxInfo.MinTrackHeight = 416
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
    AfterPost = qrySelecionarAfterPost
    BufferChunks = 100
    CachedUpdates = True
    UpdateObject = updSelecionar
    Left = 236
    Top = 113
  end
  object dscSelecionar: TDataSource
    AutoEdit = False
    DataSet = qrySelecionar
    Left = 236
    Top = 177
  end
  object GridMenu: TPopupMenu
    OnPopup = GridMenuPopup
    Left = 236
    Top = 233
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
    Left = 140
    Top = 233
  end
  object qryDetalhes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDetalhes
    AfterOpen = qryDetalhesAfterOpen
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM PAGAMENTOS'
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
      'update PAGAMENTOS'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into PAGAMENTOS'
      
        '  (CODIGO, CODMOVIMENTO, NUMERO, DESCRICAO, ES, DATACADAST, VALO' +
        'R, CODDOCUMENTO, '
      
        '   INFODOC, EXTERNO, ARQUIVO, HISTORICO, PAGO, DATAPAGO, DESCONT' +
        'O, MULTA_JUROS, '
      '   TOTAL_PAGO, DATAVENCIMENTO, STATUS)'
      'values'
      
        '  (:CODIGO, :CODMOVIMENTO, :NUMERO, :DESCRICAO, :ES, :DATACADAST' +
        ', :VALOR, '
      
        '   :CODDOCUMENTO, :INFODOC, :EXTERNO, :ARQUIVO, :HISTORICO, :PAG' +
        'O, :DATAPAGO, '
      
        '   :DESCONTO, :MULTA_JUROS, :TOTAL_PAGO, :DATAVENCIMENTO, :STATU' +
        'S)')
    DeleteSQL.Strings = (
      'delete from PAGAMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 340
    Top = 233
  end
  object dsrDetalhes: TDataSource
    AutoEdit = False
    DataSet = qryDetalhes
    Left = 340
    Top = 169
  end
  object qryDocumento: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDocumento
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '  DOCUMENTO'
      'FROM'
      '  DOCUMENTOS'
      'WHERE'
      '  CODIGO = :CODDOCUMENTO  ')
    UniDirectional = True
    Left = 45
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsrDocumento: TDataSource
    AutoEdit = False
    DataSet = qryDocumento
    Left = 93
    Top = 250
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
  object traDocumento: TIBTransaction
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
    Left = 41
    Top = 181
  end
  object updSelecionar: TIBUpdateSQL
    ModifySQL.Strings = (
      'UPDATE'
      '   PAGAMENTOS'
      'SET'
      '  PAGO = :PAGO'
      'WHERE'
      '  CODIGO = :CODIGO')
    Left = 189
    Top = 223
  end
end
