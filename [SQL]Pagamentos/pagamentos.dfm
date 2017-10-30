object formPagamentos: TformPagamentos
  Left = 143
  Top = 107
  Width = 596
  Height = 375
  Caption = 'Pagamentos'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object lblCLIENTE: TLabel
    Left = 20
    Top = 10
    Width = 32
    Height = 14
    Cursor = crHandPoint
    Caption = 'Cliente'
    FocusControl = DBEdit14
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 416
    Top = 16
    Width = 145
    Height = 41
    Alignment = taRightJustify
    DataField = 'CODIGO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 377
    Top = 233
    Width = 185
    Height = 32
    Alignment = taRightJustify
    DataField = 'VALOR_TOTAL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -29
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 494
    Top = 5
    Width = 65
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'V E N D A'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 494
    Top = 222
    Width = 65
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'T O T A L'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit14: TDBEdit
    Left = 20
    Top = 26
    Width = 69
    Height = 22
    CharCase = ecUpperCase
    Color = clBtnFace
    DataField = 'CODCLIENTE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit15: TDBEdit
    Left = 100
    Top = 26
    Width = 281
    Height = 22
    TabStop = False
    Color = clBtnFace
    DataField = 'NOME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object HeaderControl1: THeaderControl
    Left = 17
    Top = 63
    Width = 472
    Height = 17
    Align = alNone
    DragReorder = False
    Sections = <
      item
        ImageIndex = -1
        Text = 'Código'
        Width = 102
      end
      item
        ImageIndex = -1
        Text = 'Descrição'
        Width = 222
      end
      item
        ImageIndex = -1
        Text = 'Preço'
        Width = 78
      end
      item
        ImageIndex = -1
        Text = 'ICMS'
        Width = 70
      end>
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 17
    Top = 80
    Width = 560
    Height = 140
    ColCount = 1
    PanelHeight = 28
    PanelWidth = 544
    TabOrder = 3
    RowCount = 5
    object DBText1: TDBText
      Left = 107
      Top = 2
      Width = 214
      Height = 23
      DataField = 'DESCRICAO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DBEdit1: TDBEdit
      Left = 5
      Top = 3
      Width = 92
      Height = 22
      DataField = 'BARRA'
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 328
      Top = 3
      Width = 68
      Height = 22
      DataField = 'PRECO2'
      TabOrder = 1
    end
    object DBCheckBox1: TDBCheckBox
      Left = 476
      Top = 10
      Width = 63
      Height = 17
      Caption = 'Cancela'
      DataField = 'CANCELAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit3: TDBEdit
      Left = 408
      Top = 3
      Width = 57
      Height = 22
      DataField = 'ICMSVENDA'
      TabOrder = 2
    end
  end
end
