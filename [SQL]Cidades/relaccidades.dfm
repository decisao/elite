object dmoRelacCidades: TdmoRelacCidades
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 258
  Top = 216
  Height = 150
  Width = 215
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
end
