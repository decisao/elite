object formSerialHex: TformSerialHex
  Left = 264
  Top = 164
  Width = 313
  Height = 194
  ActiveControl = Edit1
  BorderIcons = [biSystemMenu]
  Caption = 'Conversão de Serial'
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 234
    Height = 13
    Caption = 'Por favor, digite o número serial decimal'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Panel1: TPanel
    Left = 8
    Top = 64
    Width = 289
    Height = 49
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 98
    Top = 127
    Width = 121
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkCancel
  end
end
