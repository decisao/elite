object formPrintBoleto: TformPrintBoleto
  Left = 286
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Impressão de Boletos de cobrança'
  ClientHeight = 137
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 490
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 384
      Top = 9
      Width = 91
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 287
      Top = 9
      Width = 91
      Height = 25
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkOK
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 490
    Height = 96
    Align = alClient
    Caption = ' Boleto '
    TabOrder = 1
    object lblNome: TLabel
      Left = 17
      Top = 21
      Width = 457
      Height = 14
      AutoSize = False
      Caption = 'lblNome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 153
      Height = 14
      Caption = 'Os boletos serão impressos em'
    end
    object lblImpressora: TLabel
      Left = 17
      Top = 69
      Width = 457
      Height = 14
      AutoSize = False
      Caption = 'lblImpressora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qryCabBoleto: TIBQuery
    SQL.Strings = (
      'SELECT'
      '  BO.LINHA18,'
      '  BO.ALTURA,'
      '  CP.PRINT_BOLETO'
      'FROM'
      '  CONFIG_PADRAO CP,'
      '  IMPBOLETO BO,'
      '  PAGAMENTOS PG'
      'WHERE'
      '  BO.CODDOCUMENTO = PG.CODDOCUMENTO AND'
      '  PG.CODMOVIMENTO = :CODMOVIMENTO'
      ' ')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryImpBoleto: TIBQuery
    Left = 280
    Top = 16
  end
  object qryBoletoCorpo: TIBQuery
    Left = 368
    Top = 16
  end
end
