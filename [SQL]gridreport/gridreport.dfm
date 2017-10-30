object formGridReport: TformGridReport
  Left = 209
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Ferramenta de impressão da grade'
  ClientHeight = 142
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 142
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBoxFields: TGroupBox
      Left = 8
      Top = 2
      Width = 369
      Height = 133
      Caption = ' Colunas '
      TabOrder = 0
      object rbAllFields: TRadioButton
        Left = 11
        Top = 18
        Width = 54
        Height = 17
        Cursor = crHandPoint
        Caption = 'Todas'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbAllFieldsClick
      end
      object rbSelectFields: TRadioButton
        Left = 11
        Top = 37
        Width = 146
        Height = 17
        Cursor = crHandPoint
        Caption = 'Quero selecionar:'
        TabOrder = 1
        OnClick = rbAllFieldsClick
      end
      object ListBoxFields: TListBox
        Left = 144
        Top = 15
        Width = 213
        Height = 108
        Cursor = crHandPoint
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 176
        Top = 48
        Width = 177
        Height = 64
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Visible = False
      end
    end
  end
  object Dock972: TDock97
    Left = 385
    Top = 0
    Width = 86
    Height = 142
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
        OnMouseEnter = btnImprimirMouseEnter
        OnMouseExit = btnImprimirMouseExit
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
        OnClick = btnPreviewClick
        OnMouseEnter = btnImprimirMouseEnter
        OnMouseExit = btnImprimirMouseExit
      end
    end
  end
end
