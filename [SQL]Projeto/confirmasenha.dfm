object formConfirmaSenha: TformConfirmaSenha
  Left = 283
  Top = 286
  ActiveControl = edSenha
  BorderStyle = bsDialog
  Caption = 'Confirmação de Senha'
  ClientHeight = 143
  ClientWidth = 226
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
    Top = 0
    Width = 226
    Height = 102
    Align = alClient
    BevelOuter = bvSpace
    Color = clInfoBk
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Nome do Usuário'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Senha'
    end
    object edUser: TEdit
      Left = 16
      Top = 24
      Width = 193
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edSenha: TEdit
      Left = 16
      Top = 64
      Width = 193
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 102
    Width = 226
    Height = 41
    Align = alBottom
    Color = clWindow
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 120
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
