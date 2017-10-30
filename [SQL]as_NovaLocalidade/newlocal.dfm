object formNovaLocalidade: TformNovaLocalidade
  Left = 255
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Nova Localidade'
  ClientHeight = 199
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 418
    Height = 25
    Caption = 'Assistente para Cadastro de Localidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 26
    Width = 457
    Height = 9
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 428
    Height = 13
    Caption = 'Rua, Avenida, Travessa, Alameda etc (escrever somente o nome)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb_Cidade: TLabel
    Left = 8
    Top = 29
    Width = 441
    Height = 24
    AutoSize = False
    Caption = 'FRANCA - SP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 101
    Height = 13
    Caption = 'Nome do Bairro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 336
    Top = 104
    Width = 24
    Height = 13
    Caption = 'CEP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLOGRADOURO: TEdit
    Left = 8
    Top = 72
    Width = 441
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnEnter = edtLOGRADOUROEnter
    OnExit = edtLOGRADOUROExit
  end
  object cbxBAIRRO: TComboBox
    Tag = 1
    Left = 8
    Top = 120
    Width = 313
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object edtCEP: TMaskEdit
    Left = 336
    Top = 120
    Width = 113
    Height = 21
    EditMask = '99999-999;1;_'
    MaxLength = 9
    TabOrder = 2
    Text = '     -   '
    OnEnter = edtLOGRADOUROEnter
    OnExit = edtLOGRADOUROExit
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 168
    Width = 113
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 168
    Width = 113
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
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
  object qryBairro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traBairro
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT BAIRROS.BAIRRO , BAIRROS.CODIGO'
      'FROM BAIRROS BAIRROS'
      'WHERE ( ( BAIRROS.CIDADE = :CIDADE ) AND'
      '  ( BAIRROS.ESTADO = :ESTADO ) )'
      'ORDER BY'
      ' BAIRROS.BAIRRO')
    Left = 8
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
  end
  object FonteBairro: TDataSource
    DataSet = qryBairro
    Left = 56
    Top = 136
  end
  object qryLogradouros: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traLogradouros
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT LOGRADOUROS.CODIGO , '
      ' LOGRADOUROS.LOGRADOURO , '
      ' LOGRADOUROS.BAIRRO , LOGRADOUROS.CEP , '
      ' LOGRADOUROS.CIDADE , '
      ' LOGRADOUROS.ESTADO , '
      ' LOGRADOUROS.EXTENSO'
      'FROM LOGRADOUROS LOGRADOUROS'
      'WHERE ( LOGRADOUROS.CODIGO = :CODIGO )')
    UniDirectional = True
    UpdateObject = updLogradouros
    Left = 128
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryBairros: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traBairros
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT BAIRROS.CODIGO , BAIRROS.BAIRRO , '
      ' BAIRROS.CIDADE , BAIRROS.ESTADO'
      'FROM BAIRROS BAIRROS'
      'WHERE ( BAIRROS.CODIGO = :CODIGO )')
    UniDirectional = True
    UpdateObject = updBairros
    Left = 192
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object updBairros: TIBUpdateSQL
    ModifySQL.Strings = (
      'update BAIRROS'
      'set'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  ESTADO = :ESTADO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into BAIRROS'
      '  (CODIGO, BAIRRO, CIDADE, ESTADO)'
      'values'
      '  (:CODIGO, :BAIRRO, :CIDADE, :ESTADO)')
    DeleteSQL.Strings = (
      'delete from BAIRROS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 264
    Top = 136
  end
  object updLogradouros: TIBUpdateSQL
    ModifySQL.Strings = (
      'update LOGRADOUROS'
      'set'
      '  LOGRADOURO = :LOGRADOURO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  CIDADE = :CIDADE,'
      '  ESTADO = :ESTADO,'
      '  EXTENSO = :EXTENSO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into LOGRADOUROS'
      '  (CODIGO, LOGRADOURO, BAIRRO, CEP, CIDADE, ESTADO, EXTENSO)'
      'values'
      
        '  (:CODIGO, :LOGRADOURO, :BAIRRO, :CEP, :CIDADE, :ESTADO, :EXTEN' +
        'SO)')
    DeleteSQL.Strings = (
      'delete from LOGRADOUROS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 336
    Top = 136
  end
  object traLogradouros: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 129
    Top = 85
  end
  object traBairros: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 193
    Top = 85
  end
  object traBairro: TIBTransaction
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
    Left = 9
    Top = 77
  end
end
