object formCrypto: TformCrypto
  Left = 131
  Top = 157
  Width = 544
  Height = 288
  Caption = 'Teste de criptografia'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 78
    Height = 13
    Caption = 'Texto original'
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 121
    Height = 13
    Caption = 'Criptografado TEXTO'
  end
  object Label3: TLabel
    Left = 16
    Top = 152
    Width = 106
    Height = 13
    Caption = 'Criptografado HEX'
  end
  object Label4: TLabel
    Left = 16
    Top = 192
    Width = 55
    Height = 13
    Caption = 'Revertido'
  end
  object Label5: TLabel
    Left = 184
    Top = 16
    Width = 143
    Height = 13
    Caption = 'Chave para criptografia2'
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 16
    Top = 128
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 16
    Top = 168
    Width = 505
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 16
    Top = 208
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'C1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 72
    Width = 75
    Height = 25
    Caption = 'C2'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit5: TEdit
    Left = 184
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object Button3: TButton
    Left = 96
    Top = 72
    Width = 73
    Height = 25
    Caption = 'SYSDBA'
    TabOrder = 7
    OnClick = Button3Click
  end
end
