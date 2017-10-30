object dmoProdutos: TdmoProdutos
  OldCreateOrder = False
  Left = 96
  Top = 92
  Height = 434
  Width = 463
  object traEstoque: TIBTransaction
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
    Left = 21
    Top = 10
  end
  object qryEstoque: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traEstoque
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formProdutos.dsrDetalhes
    SQL.Strings = (
      'select'
      '  cl.nome,'
      '  sum(id.quantidade) as quantidade'
      'from'
      '  individuais id'
      '  left join sisconfig sc on'
      '    (sc.codigo = id.codempresa)'
      '  left join clientes cl on'
      '    (cl.codigo = sc.codcliente)'
      'where'
      '  id.codproduto = :codigo and'
      '  id.vendido = '#39'N'#39
      'group by'
      '  cl.nome'
      '')
    Left = 20
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrEstoque: TDataSource
    AutoEdit = False
    DataSet = cdsEstoque
    Left = 84
    Top = 107
  end
  object traUnidade: TIBTransaction
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
    Top = 10
  end
  object qryUnidade: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traUnidade
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formProdutos.dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   UNIDADE'
      'FROM '
      '   MEDIDAS'
      'WHERE'
      '   SIGLA = :UNIDADE')
    UniDirectional = True
    Left = 177
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInput
      end>
  end
  object dsrUnidade: TDataSource
    AutoEdit = False
    DataSet = cdsUnidade
    Left = 249
    Top = 107
  end
  object qryGrupo: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traGrupo
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formProdutos.dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   GRUPO'
      'FROM '
      '   GRUPOS'
      'WHERE'
      '   CODIGO = :GRUPO')
    UniDirectional = True
    Left = 20
    Top = 233
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptInput
      end>
  end
  object traGrupo: TIBTransaction
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
    Left = 20
    Top = 186
  end
  object dsrGrupo: TDataSource
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 84
    Top = 283
  end
  object traServicos: TIBTransaction
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
    Top = 186
  end
  object qryServicos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traServicos
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formProdutos.dsrDetalhes
    SQL.Strings = (
      'SELECT '
      '   DESCRICAO, '
      '   PRECOVENDA '
      'FROM '
      '   PRODUTOS '
      'WHERE '
      '   PS = '#39'S'#39' AND'
      '   CODIGO = :CODSERVICO')
    UniDirectional = True
    Left = 177
    Top = 233
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODSERVICO'
        ParamType = ptInput
      end>
  end
  object dsrServicos: TDataSource
    AutoEdit = False
    DataSet = cdsServicos
    Left = 249
    Top = 283
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'provEstoque'
    ReadOnly = True
    Left = 85
    Top = 57
  end
  object provEstoque: TDataSetProvider
    DataSet = qryEstoque
    Constraints = True
    Options = [poReadOnly]
    Left = 85
    Top = 10
  end
  object provUnidade: TDataSetProvider
    DataSet = qryUnidade
    Constraints = True
    Options = [poReadOnly]
    Left = 249
    Top = 10
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provUnidade'
    ReadOnly = True
    Left = 249
    Top = 57
  end
  object provGrupo: TDataSetProvider
    DataSet = qryGrupo
    Constraints = True
    Options = [poReadOnly]
    Left = 85
    Top = 186
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provGrupo'
    ReadOnly = True
    Left = 85
    Top = 233
  end
  object provServicos: TDataSetProvider
    DataSet = qryServicos
    Constraints = True
    Options = [poReadOnly]
    Left = 249
    Top = 186
  end
  object cdsServicos: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provServicos'
    ReadOnly = True
    Left = 249
    Top = 233
    object cdsServicosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      FixedChar = True
      Size = 60
    end
    object cdsServicosPRECOVENDA: TBCDField
      FieldName = 'PRECOVENDA'
      currency = True
      Precision = 9
      Size = 2
    end
  end
  object traCentro: TIBTransaction
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
    Left = 345
    Top = 10
  end
  object qryCentro: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traCentro
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = formProdutos.dsrDetalhes
    SQL.Strings = (
      'SELECT'
      '   DESCRICAO'
      'FROM '
      '   CENTROS'
      'WHERE'
      '   CODIGO = :CODCENTRO AND'
      '   TIPO = '#39'L'#39)
    UniDirectional = True
    Left = 345
    Top = 57
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCENTRO'
        ParamType = ptUnknown
      end>
  end
  object provCentro: TDataSetProvider
    DataSet = qryCentro
    Constraints = True
    Options = [poReadOnly]
    Left = 417
    Top = 10
  end
  object cdsCentro: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 1
    Params = <>
    ProviderName = 'provCentro'
    ReadOnly = True
    Left = 417
    Top = 57
  end
  object dcrCentro: TDataSource
    AutoEdit = False
    DataSet = cdsCentro
    Left = 417
    Top = 107
  end
end
