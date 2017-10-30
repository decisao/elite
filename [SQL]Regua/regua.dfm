object formRegua: TformRegua
  Left = 267
  Top = 170
  BorderStyle = bsDialog
  Caption = 'Régua para geografia de impressão'
  ClientHeight = 135
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 94
    Width = 380
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clBtnHighlight
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 280
      Top = 9
      Width = 91
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 184
      Top = 9
      Width = 91
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkOK
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 380
    Height = 94
    Align = alClient
    Caption = ' Configurações '
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Linhas'
    end
    object Label2: TLabel
      Left = 104
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Colunas'
    end
    object Label3: TLabel
      Left = 192
      Top = 16
      Width = 111
      Height = 13
      Caption = 'Porta de impressão'
    end
    object nLinhas: TRxSpinEdit
      Left = 16
      Top = 32
      Width = 73
      Height = 21
      Value = 66
      TabOrder = 0
    end
    object nColunas: TRxSpinEdit
      Left = 104
      Top = 32
      Width = 73
      Height = 21
      Value = 80
      TabOrder = 1
    end
    object c18: TCheckBox
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Usando 1/8 linha'
      TabOrder = 2
    end
    object cComp: TCheckBox
      Left = 192
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Comprimido'
      TabOrder = 3
    end
    object ePorta: TEdit
      Left = 192
      Top = 32
      Width = 169
      Height = 21
      TabOrder = 4
      Text = 'LPT1:'
    end
  end
end
