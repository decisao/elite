object dmoRelacClientes: TdmoRelacClientes
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Left = 100
  Top = 196
  Height = 473
  Width = 878
  object qryEstado: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEstado
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ESTADO'
      'FROM Estados'
      'WHERE SIGLA = :SIGLA ')
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
    DataSet = cdsEstado
    Left = 96
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
    Left = 376
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
    DataSet = cdsCidades
    Left = 440
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
      '( ESTADO = :ESTADO )')
    UniDirectional = True
    Left = 200
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
    DataSet = cdsLocalidades
    Left = 280
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
    Left = 536
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
    DataSet = cdsBairros
    Left = 592
    Top = 120
  end
  object traEstado: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
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
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 200
    Top = 8
  end
  object traCidades: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 376
    Top = 8
  end
  object traBairros: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 536
    Top = 8
  end
  object provEstado: TDataSetProvider
    DataSet = qryEstado
    Constraints = True
    Left = 96
    Top = 8
  end
  object cdsEstado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provEstado'
    ReadOnly = True
    Left = 96
    Top = 64
  end
  object provLocalidades: TDataSetProvider
    DataSet = qryLocalidades
    Constraints = True
    Left = 280
    Top = 8
  end
  object cdsLocalidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provLocalidades'
    ReadOnly = True
    Left = 280
    Top = 64
  end
  object provCidades: TDataSetProvider
    DataSet = qryCidades
    Constraints = True
    Left = 440
    Top = 8
  end
  object cdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provCidades'
    ReadOnly = True
    Left = 440
    Top = 64
  end
  object provBairros: TDataSetProvider
    DataSet = qryBairros
    Constraints = True
    Left = 592
    Top = 8
  end
  object cdsBairros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provBairros'
    ReadOnly = True
    Left = 592
    Top = 64
  end
  object traEmpresa: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 25
    Top = 184
  end
  object qryEmpresa: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEmpresa
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  SI.CODIGO,'
      '  CL.NOME'
      'FROM'
      '  SISCONFIG SI'
      '  JOIN CLIENTES CL ON'
      '    (SI.CODCLIENTE = CL.CODIGO)'
      'WHERE'
      '  SI.CODIGO = :CODEMPRESA'
      'ORDER BY'
      '  CL.NOME')
    UniDirectional = True
    Left = 25
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dsrEmpresa: TDataSource
    AutoEdit = False
    DataSet = cdsEmpresa
    Left = 95
    Top = 300
  end
  object provEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Constraints = True
    Left = 96
    Top = 184
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'provEmpresa'
    ReadOnly = True
    Left = 96
    Top = 240
  end
end
