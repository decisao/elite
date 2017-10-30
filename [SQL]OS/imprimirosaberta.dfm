object formImprimirOSaberta: TformImprimirOSaberta
  Left = 268
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'OS / Modelo 1'
  ClientHeight = 112
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 74
    Width = 457
    Height = 2
    Align = alTop
    Shape = bsTopLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 9
      Width = 194
      Height = 25
      Caption = 'Abrir OS modelo 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 126
      Height = 13
      Caption = 'Para ser impressa em'
    end
    object DBText1: TDBText
      Left = 16
      Top = 48
      Width = 252
      Height = 17
      DataField = 'PRINT_NOTA'
      DataSource = dsrCabNota
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 392
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Cópias'
    end
    object cbCopias: TComboBox
      Left = 392
      Top = 40
      Width = 49
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 457
    Height = 36
    Align = alClient
    Color = clBtnHighlight
    TabOrder = 1
    object bbtOK: TBitBtn
      Left = 240
      Top = 5
      Width = 97
      Height = 25
      Cursor = crHandPoint
      TabOrder = 0
      OnClick = Button1Click
      Kind = bkOK
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 5
      Width = 97
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object ckLocal: TCheckBox
      Left = 16
      Top = 8
      Width = 177
      Height = 17
      Cursor = crHandPoint
      Caption = 'redirecionamento local'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 2
    end
  end
  object qryImpNota: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traImpNota
    BeforeOpen = qryImpNotaBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
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
    Left = 48
    Top = 60
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
    Database = dmoPrincipal.Database
    Transaction = traNotaCorpo
    BeforeOpen = qryNotaCorpoBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      #9'*'
      'FROM'
      '        :CALLPROC (:CODMOVIMENTO)')
    Left = 206
    Top = 12
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
    Left = 308
    Top = 36
  end
  object qryCabNota: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCabNota
    AfterOpen = qryCabNotaAfterOpen
    BeforeOpen = qryCabNotaBeforeOpen
    BufferChunks = 100
    CachedUpdates = False
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
      '  IM.EFEITOBASE,'
      '  CI.PRINT_OS AS PRINT_NOTA,'
      '  CI.COPIAS_OS AS COPIAS'
      'FROM'
      '  IMPNOTA IM, SISCONFIG CI'
      'WHERE'
      '  IM.NUMIMPNOTA = CI.OSABERTA_PADRAO AND'
      '  CI.CODIGO = :CODEMPRESA'
      ''
      ' '
      ' ')
    UniDirectional = True
    Left = 112
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsrCabNota: TDataSource
    DataSet = qryCabNota
    Left = 243
    Top = 38
  end
  object traImpNota: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 49
    Top = 5
  end
  object traCabNota: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 105
    Top = 5
  end
  object traNotaCorpo: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    IdleTimer = 1024
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 177
    Top = 5
  end
end
