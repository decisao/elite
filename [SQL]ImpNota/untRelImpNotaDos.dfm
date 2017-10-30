object formImprimirNota: TformImprimirNota
  Left = 123
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Impressão da Nota Fiscal'
  ClientHeight = 113
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 73
    BevelWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 196
      Height = 24
      Caption = 'Nota Fiscal de Saída'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 105
      Height = 14
      Caption = 'Para ser impressa em'
    end
    object DBText1: TDBText
      Left = 16
      Top = 48
      Width = 289
      Height = 17
      DataField = 'PRINT_NOTA'
      DataSource = dsrCabNota
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtOK: TBitBtn
      Left = 352
      Top = 40
      Width = 97
      Height = 25
      TabOrder = 0
      OnClick = Button1Click
      Kind = bkOK
    end
  end
  object qryImpNota: TIBQuery
    BeforeOpen = qryImpNotaBeforeOpen
    DatabaseName = 'DatabaseServer'
    SessionName = 'DatabaseSession'
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      #9'IMPNOTA_RESUMO(:NUMIMPNOTA)'
      'WHERE'
      '        TIPO = :TIPO'
      ''
      ' '
      ' '
      ' ')
    Left = 232
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMIMPNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object qryNotaCorpo: TIBQuery
    BeforeOpen = qryNotaCorpoBeforeOpen
    DatabaseName = 'DatabaseServer'
    SessionName = 'DatabaseSession'
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      '        :CALLPROC (:CODMOVIMENTO)')
    Left = 350
    Top = 4
    ParamData = <
      item
        DataType = ftString
        Name = 'CALLPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsrNotaCorpo: TDataSource
    DataSet = qryNotaCorpo
    Left = 348
    Top = 52
  end
  object qryCabNota: TIBQuery
    AfterOpen = qryCabNotaAfterOpen
    DatabaseName = 'DatabaseServer'
    SessionName = 'DatabaseSession'
    SQL.Strings = (
      'SELECT'
      '  IM.NUMIMPNOTA,'
      '  IM.DESCRICAO,'
      '  IM.LINHA18,'
      '  IM.DUP_LINHAINI,'
      '  IM.DUP_COLUNAS,'
      '  IM.DUP_LINHAS,'
      '  IM.DUP_TAMANHOCOL,'
      '  IM.PRO_LINHAINI,'
      '  IM.PRO_LINHAS,'
      '  IM.SER_LINHAINI,'
      '  IM.SER_LINHAS,'
      '  IM.ALTURA,'
      '  CI.PRINT_NOTA'
      'FROM'
      '  IMPNOTA IM, CONFIG_PADRAO CI'
      'WHERE'
      '  IM.NUMIMPNOTA = CI.NOTA_PADRAO'
      '')
    Left = 288
    Top = 8
  end
  object dsrCabNota: TDataSource
    DataSet = qryCabNota
    Left = 291
    Top = 54
  end
end
