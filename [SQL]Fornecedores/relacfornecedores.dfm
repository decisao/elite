object dmoRelacFornecedores: TdmoRelacFornecedores
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Left = 269
  Top = 261
  Height = 240
  Width = 424
  object qryEstado: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEstado
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ESTADO'
      'FROM Estados'
      'WHERE ( SIGLA = :SIGLA )')
    UniDirectional = True
    Left = 24
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'SIGLA'
        ParamType = ptUnknown
      end>
  end
  object dsrEstado: TDataSource
    AutoEdit = False
    DataSet = qryEstado
    Left = 24
    Top = 120
  end
  object qryCidades: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCidades
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CIDADE'
      'FROM Cidades'
      'WHERE ( ( CODIGO = :CODIGO ) AND'
      '  ( ESTADO = :ESTADO ) )')
    UniDirectional = True
    Left = 152
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
  end
  object dsrCidades: TDataSource
    AutoEdit = False
    DataSet = qryCidades
    Left = 152
    Top = 120
  end
  object qryLocalidades: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traLocalidades
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT LOGRADOURO, BAIRRO, CEP  '
      'FROM Logradouros'
      'WHERE ( CODIGO = :CODIGO )  AND'
      '( CIDADE = :CIDADE )  AND'
      '( ESTADO = :ESTADO )'
      ''
      '')
    UniDirectional = True
    Left = 88
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
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
  object dsrLocalidades: TDataSource
    AutoEdit = False
    DataSet = qryLocalidades
    Left = 88
    Top = 120
  end
  object qryBairros: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traBairros
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT BAIRRO'
      'FROM BAIRROS'
      'WHERE ( ( CODIGO = :CODIGO ) AND'
      '  ( ESTADO = :ESTADO ) AND ( CIDADE = :CIDADE ) )')
    UniDirectional = True
    Left = 216
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CIDADE'
        ParamType = ptUnknown
      end>
  end
  object dsrBairros: TDataSource
    AutoEdit = False
    DataSet = qryBairros
    Left = 216
    Top = 120
  end
  object traEstado: TIBTransaction
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
    Left = 24
    Top = 8
  end
  object traLocalidades: TIBTransaction
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
    Left = 88
    Top = 8
  end
  object traCidades: TIBTransaction
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
    Left = 152
    Top = 8
  end
  object traBairros: TIBTransaction
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
    Left = 216
    Top = 8
  end
end
