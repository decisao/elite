object formQuemCompra: TformQuemCompra
  Left = 53
  Top = 58
  Width = 651
  Height = 480
  Caption = 'Quem Compra?'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Dock972: TDock97
    Left = 557
    Top = 0
    Width = 86
    Height = 427
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
        Top = 66
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Sair desta janela'
        Caption = '&Sa�da'
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
      end
      object ToolbarSep971: TToolbarSep97
        Left = 0
        Top = 60
      end
      object btnImprimir: TToolbarButton97
        Left = 0
        Top = 0
        Width = 80
        Height = 60
        Cursor = crHandPoint
        Hint = 'Op��es de Impress�o'
        Caption = '&Impress�o'
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
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 643
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object qryQuemCompra: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = dmoPrincipal.traDefault
    BeforeOpen = qryQuemCompraBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      '  id.quantidade         as quantidade,'
      '  cast(mo.data as date) as data,'
      '  mo.nome_vendedor      as vendedor,'
      '  cl.nome               as cliente,'
      '  cl.fone               as telefone,'
      '  ci.cidade             as cidade,'
      '  ci.estado             as estado'
      'from'
      '  individuais id'
      '  left join movimentos mo on'
      '    (mo.codigo = id.codmovsaida)'
      '  left join clientes cl on'
      '    (cl.codigo = mo.codcliente)'
      '  left join cidades ci on'
      '    (ci.codigo = cl.cidade and'
      '     ci.estado = cl.estado)'
      'where'
      '  id.codproduto = :codproduto')
    Left = 120
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codproduto'
        ParamType = ptUnknown
      end>
  end
  object dsrQuemCompra: TDataSource
    AutoEdit = False
    DataSet = qryQuemCompra
    Left = 120
    Top = 184
  end
end
