object formPassword: TformPassword
  Left = 303
  Top = 267
  BorderStyle = bsDialog
  Caption = 'Trocar Senha'
  ClientHeight = 190
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 149
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 113
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuário (login):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Senha atual:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 80
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Senha Nova:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 112
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Senha Nova:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 121
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'para confirmação'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUsuario: TEdit
      Left = 136
      Top = 13
      Width = 161
      Height = 21
      TabStop = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtSenhaAtual: TEdit
      Left = 136
      Top = 45
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object edtSenhaNova1: TEdit
      Left = 136
      Top = 77
      Width = 161
      Height = 21
      TabOrder = 2
    end
    object edtSenhaNova2: TEdit
      Left = 136
      Top = 109
      Width = 161
      Height = 21
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 149
    Width = 357
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 136
      Top = 8
      Width = 99
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 248
      Top = 8
      Width = 99
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
