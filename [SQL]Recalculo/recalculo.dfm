object formRecalculo: TformRecalculo
  Left = 299
  Top = 163
  ActiveControl = dedIni
  BorderStyle = bsDialog
  Caption = 'Recalculo de Comissões'
  ClientHeight = 102
  ClientWidth = 274
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
  object Bevel1: TBevel
    Left = 0
    Top = 58
    Width = 274
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 58
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Data inicial'
    end
    object Label2: TLabel
      Left = 152
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Data final'
    end
    object dedIni: TDateEdit
      Left = 16
      Top = 24
      Width = 117
      Height = 21
      Cursor = crHandPoint
      DialogTitle = 'Selecione a data'
      NumGlyphs = 2
      TabOrder = 0
    end
    object dedFim: TDateEdit
      Left = 152
      Top = 24
      Width = 109
      Height = 21
      Cursor = crHandPoint
      DialogTitle = 'Selecione a data'
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 61
    Width = 274
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 168
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 72
      Top = 8
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      ModalResult = 1
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
  object traRecalculo: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 32
    Top = 16
  end
  object sqlRecalculo: TIBSQL
    Database = dmoPrincipal.Database
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE COMISSAO_RECALC(:DATAINI, :DATAFIM)')
    Transaction = traRecalculo
    Left = 112
    Top = 16
  end
end
