object dataVenda: TdataVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 103
  Top = 104
  Height = 562
  Width = 784
  object memItens: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'BARRA'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_REAL'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'PS'
        DataType = ftString
        Size = 1
      end>
    AfterInsert = memItensAfterInsert
    BeforePost = memItensBeforePost
    AfterPost = memItensAfterPost
    BeforeDelete = memItensBeforeDelete
    OnCalcFields = memItensCalcFields
    Left = 40
    Top = 64
    object memItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object memItensBARRA: TStringField
      FieldName = 'BARRA'
      OnChange = memItensBARRAChange
      Size = 14
    end
    object memItensDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object memItensQUANTIDADE: TFloatField
      ConstraintErrorMessage = 'A quantidade deve ser positiva!'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 2
    end
    object memItensVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
      Precision = 2
    end
    object memItensVALOR_REAL: TFloatField
      FieldName = 'VALOR_REAL'
      OnChange = memItensVALOR_REALChange
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      currency = True
      Precision = 2
    end
    object memItensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      OnChange = memItensDESCONTOChange
      DisplayFormat = '#,##0.00 '#39'%'#39
      EditFormat = '#,##0.00'
      currency = True
      Precision = 2
    end
    object memItensTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      currency = True
      Precision = 2
      Calculated = True
    end
    object memItensPS: TStringField
      FieldName = 'PS'
      Size = 1
    end
    object memItensINDICE: TIntegerField
      FieldName = 'INDICE'
    end
  end
  object dsrItens: TDataSource
    AutoEdit = False
    DataSet = memItens
    Left = 40
    Top = 112
  end
  object InfoItem: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traInfoItem
    ForcedRefresh = True
    AutoCalcFields = False
    StoredProcName = 'INFOVENDA'
    Left = 120
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'QUANTIDADE'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'ICMS'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODSERVICO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMOVIMENTO'
        ParamType = ptInput
      end>
  end
  object qryClientes: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traClientes
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT '
      '  *'
      'FROM '
      '  REL_CLIENTES '
      'WHERE'
      '  CODIGO = :CODCLIENTE'
      '')
    UniDirectional = True
    Left = 120
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptUnknown
      end>
  end
  object dsrClientes: TDataSource
    AutoEdit = False
    DataSet = qryClientes
    Left = 120
    Top = 424
  end
  object qryVendedores: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traVendedores
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT NOME FROM CLIENTES'
      'WHERE CODIGO = :CODVENDEDOR'
      '')
    UniDirectional = True
    Left = 200
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVENDEDOR'
        ParamType = ptUnknown
      end>
  end
  object dsrVendedores: TDataSource
    AutoEdit = False
    DataSet = qryVendedores
    Left = 200
    Top = 424
  end
  object dsrMovimentos: TDataSource
    AutoEdit = False
    DataSet = qryMovimentos
    Left = 368
    Top = 112
  end
  object GravaItem: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traGravaItem
    StoredProcName = 'ITVENDA_GRAVA'
    Left = 200
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'ICMS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMOVSAIDA'
        ParamType = ptInput
      end>
  end
  object CancelaItem: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traCancelaItem
    StoredProcName = 'ITVENDA_CANCELA'
    Left = 280
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMOVSAIDA'
        ParamType = ptInput
      end>
  end
  object qryPagamentos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traPagamentos
    ForcedRefresh = True
    AfterOpen = qryPagamentosAfterOpen
    AfterPost = qryPagamentosAfterPost
    BeforePost = qryPagamentosBeforePost
    BufferChunks = 100
    CachedUpdates = True
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT '
      ''
      'CODIGO,'
      'NUMERO,'
      'DATAVENCIMENTO,'
      'VALOR,'
      'CODDOCUMENTO,'
      'INFODOC,'
      'TIPO_PAG,'
      'TIPO_DOC'
      ''
      'FROM PAGAMENTOS'
      'WHERE CODMOVIMENTO = :CODIGO'
      'ORDER BY'
      'NUMERO')
    UpdateObject = updPagamentos
    Left = 456
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryPagamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"PAGAMENTOS"."CODIGO"'
      Required = True
    end
    object qryPagamentosNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Origin = '"PAGAMENTOS"."NUMERO"'
      Required = True
    end
    object qryPagamentosDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = '"PAGAMENTOS"."DATAVENCIMENTO"'
      Required = True
    end
    object qryPagamentosVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"PAGAMENTOS"."VALOR"'
      Precision = 9
      Size = 2
    end
    object qryPagamentosCODDOCUMENTO: TIntegerField
      FieldName = 'CODDOCUMENTO'
      Origin = '"PAGAMENTOS"."CODDOCUMENTO"'
    end
    object qryPagamentosINFODOC: TIBStringField
      FieldName = 'INFODOC'
      Origin = '"PAGAMENTOS"."INFODOC"'
      FixedChar = True
      Size = 50
    end
    object qryPagamentosTIPO_PAG: TIBStringField
      FieldName = 'TIPO_PAG'
      Origin = '"PAGAMENTOS"."TIPO_PAG"'
      FixedChar = True
      Size = 1
    end
    object qryPagamentosTIPO_DOC: TIBStringField
      FieldName = 'TIPO_DOC'
      Origin = '"PAGAMENTOS"."TIPO_DOC"'
      FixedChar = True
      Size = 1
    end
    object qryPagamentosdocumento: TStringField
      FieldKind = fkLookup
      FieldName = 'documento'
      LookupDataSet = qryDocumentos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DOCUMENTO'
      KeyFields = 'CODDOCUMENTO'
      Size = 30
      Lookup = True
    end
  end
  object dsrPagamentos: TDataSource
    DataSet = qryPagamentos
    Left = 456
    Top = 264
  end
  object updPagamentos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'SELECT '
      ''
      'CODIGO,'
      'NUMERO,'
      'DATAVENCIMENTO,'
      'VALOR,'
      'CODDOCUMENTO,'
      'INFODOC'
      ''
      'FROM PAGAMENTOS'
      'WHERE CODMOVIMENTO = :CODIGO'
      'ORDER BY'
      'NUMERO')
    ModifySQL.Strings = (
      'update PAGAMENTOS'
      'set'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VALOR = :VALOR,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  INFODOC = :INFODOC'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into PAGAMENTOS'
      '  (CODIGO, NUMERO, DATAVENCIMENTO, VALOR, CODDOCUMENTO, INFODOC)'
      'values'
      '  (:CODIGO, :NUMERO, :DATAVENCIMENTO, :VALOR, :CODDOCUMENTO, '
      ':INFODOC)')
    DeleteSQL.Strings = (
      'delete from PAGAMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 544
    Top = 216
  end
  object TimerPagamentos: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerPagamentosTimer
    Left = 544
    Top = 264
  end
  object qryDocumentos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traDocumentos
    AutoCalcFields = False
    AfterOpen = qryDocumentosAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CODIGO,'
      '  DOCUMENTO'
      'FROM '
      '  DOCUMENTOS'
      'ORDER BY'
      '  DOCUMENTO'
      ''
      '')
    Left = 368
    Top = 216
  end
  object dsrDocumentos: TDataSource
    AutoEdit = False
    DataSet = qryDocumentos
    Left = 368
    Top = 264
  end
  object qryTransportador: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traTransportador
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrMovimentos
    SQL.Strings = (
      
        'SELECT Transportadores.CODIGO, Transportadores.PESSOAFISICA, Tra' +
        'nsportadores.RAZAOSOCIAL, Transportadores.NOME, Transportadores.' +
        'RG, Transportadores.CPF, Transportadores.CGC, Transportadores.IE' +
        ', Transportadores.NUMERO, Transportadores.ESTADO, Transportadore' +
        's.FONE, Logradouros.LOGRADOURO, Logradouros.CEP, Bairros.BAIRRO,' +
        ' Cidades.CIDADE, Cidades.ESTADO'
      'FROM CLIENTES Transportadores'
      '   INNER JOIN LOGRADOUROS Logradouros'
      '   ON  (Transportadores.LOCALIZACAO = Logradouros.CODIGO)  '
      '   AND  (Transportadores.BAIRRO = Logradouros.BAIRRO)  '
      '   AND  (Transportadores.CIDADE = Logradouros.CIDADE)  '
      '   AND  (Transportadores.ESTADO = Logradouros.ESTADO)  '
      '   INNER JOIN BAIRROS Bairros'
      '   ON  (Logradouros.BAIRRO = Bairros.CODIGO)  '
      '   AND  (Logradouros.CIDADE = Bairros.CIDADE)  '
      '   AND  (Logradouros.ESTADO = Bairros.ESTADO)  '
      '   INNER JOIN CIDADES Cidades'
      '   ON  (Bairros.CIDADE = Cidades.CODIGO)  '
      '   AND  (Bairros.ESTADO = Cidades.ESTADO)  '
      'WHERE'
      '  Transportadores.CODIGO = :NOTA_CODTRANSPORTADOR'
      '')
    UniDirectional = True
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NOTA_CODTRANSPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object dsrTransportador: TDataSource
    AutoEdit = False
    DataSet = qryTransportador
    Left = 40
    Top = 264
  end
  object qryLoadItens: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traLoadItens
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT'
      '  Individuais.CODPRODUTO,'
      '  Individuais.SERIE,'
      '  Individuais.VALOR_VENDA,'
      '  Individuais.DESCONTO,'
      '  Individuais.BARRA,'
      '  Individuais.UNICO,'
      '  Individuais.ICMSVENDA,'
      '  Individuais.PS,'
      '  Tempitens.SITTRIBU,'
      '  Produtos.DESCRICAO,'
      '  Produtos.UNIDADE,'
      '  sum(Individuais.QUANTIDADE) as QUANTIDADE,'
      '  sum(Individuais.VALOR_PAGO) as VALOR_PAGO'
      'FROM INDIVIDUAIS Individuais'
      '   INNER JOIN TEMPITENS Tempitens'
      '   ON  (Individuais.CODITEM = Tempitens.CODIGO)  '
      '   AND  (Individuais.CODPRODUTO = Tempitens.CODPRODUTO) '
      '   AND  (Individuais.CODMOVENTRADA = Tempitens.CODMOVIMENTO) '
      '   INNER JOIN PRODUTOS Produtos'
      '   ON  (Tempitens.CODPRODUTO = Produtos.CODIGO)  '
      'WHERE'
      '   Individuais.VENDIDO = '#39'S'#39' AND'
      '   Individuais.CODMOVSAIDA = :CODIGO '
      'GROUP BY'
      '  Individuais.CODPRODUTO,'
      '  Individuais.SERIE,'
      '  Individuais.VALOR_VENDA,'
      '  Individuais.DESCONTO,'
      '  Individuais.BARRA,'
      '  Individuais.UNICO,'
      '  Individuais.ICMSVENDA,'
      '  Individuais.PS,'
      '  Tempitens.SITTRIBU,'
      '  Produtos.DESCRICAO,'
      '  Produtos.UNIDADE')
    UniDirectional = True
    Left = 120
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object dsrLoadItens: TDataSource
    AutoEdit = False
    DataSet = qryLoadItens
    Left = 120
    Top = 264
  end
  object qryTecnico: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traTecnico
    AutoCalcFields = False
    AfterOpen = qryTecnicoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, NOME FROM CLIENTES'
      'WHERE TIPO = '#39'A'#39' AND OCULTO = '#39'N'#39
      'ORDER BY NOME'
      '')
    Left = 200
    Top = 216
  end
  object dsrTecnico: TDataSource
    AutoEdit = False
    DataSet = qryTecnico
    Left = 200
    Top = 264
  end
  object qryOS_VENDER: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOS_VENDER
    ForcedRefresh = True
    AfterDelete = qryOS_VENDERAfterPost
    AfterInsert = qryOS_VENDERAfterInsert
    AfterOpen = qryOS_VENDERAfterOpen
    AfterPost = qryOS_VENDERAfterPost
    BufferChunks = 100
    CachedUpdates = True
    DataSource = dsrMovimentos
    SQL.Strings = (
      'SELECT * FROM OS_VENDER WHERE CODMOVIMENTO = :CODIGO')
    UpdateObject = updOS_VENDER
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qryOS_VENDERCODMOVIMENTO: TIntegerField
      FieldName = 'CODMOVIMENTO'
      Origin = '"OS_VENDER"."CODMOVIMENTO"'
      Required = True
    end
    object qryOS_VENDERCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = '"OS_VENDER"."CODVENDEDOR"'
      Required = True
    end
    object qryOS_VENDERDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Origin = '"OS_VENDER"."DATAINI"'
    end
    object qryOS_VENDERDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = '"OS_VENDER"."DATAFIM"'
    end
    object qryOS_VENDERPORCENTAGEM: TIBBCDField
      FieldName = 'PORCENTAGEM'
      Origin = '"OS_VENDER"."PORCENTAGEM"'
      Precision = 9
      Size = 2
    end
    object qryOS_VENDERCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = '"OS_VENDER"."CODVEICULO"'
    end
    object qryOS_VENDERKMINI: TIntegerField
      FieldName = 'KMINI'
      Origin = '"OS_VENDER"."KMINI"'
    end
    object qryOS_VENDERKMFIM: TIntegerField
      FieldName = 'KMFIM'
      Origin = '"OS_VENDER"."KMFIM"'
    end
    object qryOS_VENDERKM_TOTAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'KM_TOTAL'
      Origin = '"OS_VENDER"."KM_TOTAL"'
      ReadOnly = True
    end
    object qryOS_VENDERTMINUTOS: TIntegerField
      FieldName = 'TMINUTOS'
      Origin = '"OS_VENDER"."TMINUTOS"'
    end
    object qryOS_VENDERtecnico: TStringField
      FieldKind = fkLookup
      FieldName = 'tecnico'
      LookupDataSet = qryTecnico
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'CODVENDEDOR'
      Size = 40
      Lookup = True
    end
    object qryOS_VENDERveiculo: TStringField
      FieldKind = fkLookup
      FieldName = 'veiculo'
      LookupDataSet = qryVeiculo
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODVEICULO'
      Size = 40
      Lookup = True
    end
  end
  object updOS_VENDER: TIBUpdateSQL
    ModifySQL.Strings = (
      'update OS_VENDER'
      'set'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PORCENTAGEM = :PORCENTAGEM,'
      '  CODVEICULO = :CODVEICULO,'
      '  KMINI = :KM_INI,'
      '  KMFIM = :KMFIM'
      'where'
      '  CODMOVIMENTO = :OLD_CODMOVIMENTO and'
      '  CODVENDEDOR = :OLD_CODVENDEDOR and'
      '  DATAINI = :OLD_DATAINI')
    InsertSQL.Strings = (
      'insert into OS_VENDER'
      
        '  (CODMOVIMENTO, CODVENDEDOR, DATAINI, DATAFIM, PORCENTAGEM, COD' +
        'VEICULO, KMINI, KMFIM)'
      'values'
      
        '  (:CODMOVIMENTO, :CODVENDEDOR, :DATAINI, :DATAFIM, :PORCENTAGEM' +
        ', :CODVEICULO, :KMINI, :KMFIM)')
    DeleteSQL.Strings = (
      'delete from OS_VENDER'
      'where'
      '  CODMOVIMENTO = :OLD_CODMOVIMENTO and'
      '  CODVENDEDOR = :OLD_CODVENDEDOR and'
      '  DATAINI = :OLD_DATAINI')
    Left = 40
    Top = 424
  end
  object qryServico: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traServico
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  BARRA'
      'FROM'
      '  PRODUTOS'
      'WHERE'
      '  CODIGO = :CODSERVICO AND'
      '  PS = '#39'S'#39
      '  ')
    UniDirectional = True
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODSERVICO'
        ParamType = ptUnknown
      end>
  end
  object updMovimentos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  ES,'
      '  TIPO,'
      '  CODCLIENTE,'
      '  DATA,'
      '  EQUIPAMENTO,'
      '  PROBLEMA,'
      '  SOLICITANTE,'
      '  ATENDIMENTO,'
      '  SERVICOS,'
      '  VALOR_SERVICOS,'
      '  OPCIONAIS,'
      '  CONDICOES1,'
      '  CONDICOES2,'
      '  VALOR_ITENS,'
      '  DESCONTO,'
      '  VALOR_PRODUTOS,'
      '  VALOR_ICMS,'
      '  VALOR_TOTAL,'
      '  OBSERVACOES,'
      '  NOTA_NUMERO,'
      '  NOTA_DATAEMISSAO,'
      '  NOTA_CODNATUOPER,'
      '  NOTA_CODTRANSPORTADOR,'
      '  NOTA_PLACAVEICULO,'
      '  NOTA_UFVEICULO,'
      '  NOTA_FRETE,'
      '  NOTA_VALOR_FRETE,'
      '  NOTA_VALOR_SEGURO,'
      '  NOTA_VALOR_OUTROS,'
      '  NOTA_QUANTIDADE,'
      '  NOTA_ESPECIE,'
      '  NOTA_MARCA,'
      '  NOTA_VOLNUM,'
      '  NOTA_PESOBRUTO,'
      '  NOTA_PESOLIQUIDO,'
      '  NOTA_DADOSADICIONAIS,'
      '  CODVENDEDOR,'
      '  STATUS,'
      '  CONDICAO,'
      '  DATAINICIO,'
      '  DATATERMINO,'
      '  ICMSSIMPLES,'
      '  ICMSSIMPALIQ,'
      '  ISSALIQ,'
      '  VALOR_ISS,'
      '  NOTA_IESUBST,'
      '  NOTA_DATASAIDA,'
      '  NOTA_BASEICMSSUBST,'
      '  NOTA_VALORICMSSUBST,'
      '  VALOR_IPI,'
      '  CODVENDEDOR_ABRE,'
      '  DESCONTOTXT,'
      '  CODTECNICO,'
      '  CODRESPONSAVEL,'
      '  CODMARCA,'
      '  CODMODELO,'
      '  CODDEFEITO,'
      '  GARANTIA,'
      '  SERIE,'
      '  ACESSORIOS,'
      '  DATAPREVISAO,'
      '  CONDICAOEXTERNA,'
      '  PRIORIDADE,'
      '  EMPRESTIMO,'
      '  DATAFECHAMENTO,'
      '  USUARIOFECHAMENTO,'
      '  CODEMPRESA,'
      '  VALOR_COMISSAO,'
      '  ECF,'
      '  OSTIPO,'
      '  VALOR_IPI_PRODUTOS,'
      '  TOTAL_IPI,'
      '  NOTA_BASEICMS,'
      '  NOTA_VALOR_TOTAL,'
      '  VALOR_RATEIO_CUSTO,'
      '  NOME_VENDEDOR,'
      '  CODCENTRO,'
      '  TEMPO_CHEGADA,'
      '  TEMPO_CONCLUSAO,'
      '  TEMPO_LANCAMENTO,'
      '  TEMPO_CICLO,'
      '  TEMPO_TECNICOS,'
      '  TEMPO_FORADOPRAZO,'
      '  DATAESTORNO,'
      '  USUARIOESTORNO,'
      '  FECHA_DATA_FLUXO,'
      '  FECHA_SEMANA_FLUXO,'
      '  FECHA_MES_FLUXO,'
      '  FECHA_TRIMESTRE_FLUXO,'
      '  FECHA_QUADRIMESTRE_FLUXO,'
      '  FECHA_SEMESTRE_FLUXO,'
      '  FECHA_ANO_FLUXO,'
      '  FECHA_STR_SEMANA_FLUXO,'
      '  FECHA_STR_MES_FLUXO,'
      '  FECHA_STR_BIMESTRE_FLUXO,'
      '  FECHA_STR_TRIMESTRE_FLUXO,'
      '  FECHA_STR_QUADRIMESTRE_FLUXO,'
      '  FECHA_STR_SEMESTRE_FLUXO,'
      '  FECHA_BIMESTRE_FLUXO,'
      '  DEFEITO_DETECTADO,'
      '  SERVICO_REALIZAR,'
      '  AUTORIZADO,'
      '  DATA_AUTORIZADO,'
      '  QUEM_AUTORIZOU,'
      '  DATA_ENTREGA,'
      '  QUEM_ENTREGOU,'
      '  QUEM_RECEBEU,'
      '  NOTA_ENTRADA,'
      '  CODPARCEIRO,'
      '  PERCCOMIS_CALCULO,'
      '  PERCCOMIS_PROD,'
      '  PERCCOMIS_PECA,'
      '  PERCCOMIS_SERV'
      'from MOVIMENTOS '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update MOVIMENTOS'
      'set'
      '  ES = :ES,'
      '  TIPO = :TIPO,'
      '  CODCLIENTE = :CODCLIENTE,'
      '  DATA = :DATA,'
      '  EQUIPAMENTO = :EQUIPAMENTO,'
      '  PROBLEMA = :PROBLEMA,'
      '  SOLICITANTE = :SOLICITANTE,'
      '  ATENDIMENTO = :ATENDIMENTO,'
      '  SERVICOS = :SERVICOS,'
      '  VALOR_SERVICOS = :VALOR_SERVICOS,'
      '  OPCIONAIS = :OPCIONAIS,'
      '  CONDICOES1 = :CONDICOES1,'
      '  CONDICOES2 = :CONDICOES2,'
      '  VALOR_ITENS = :VALOR_ITENS,'
      '  DESCONTO = :DESCONTO,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  NOTA_NUMERO = :NOTA_NUMERO,'
      '  NOTA_DATAEMISSAO = :NOTA_DATAEMISSAO,'
      '  NOTA_CODNATUOPER = :NOTA_CODNATUOPER,'
      '  NOTA_CODTRANSPORTADOR = :NOTA_CODTRANSPORTADOR,'
      '  NOTA_PLACAVEICULO = :NOTA_PLACAVEICULO,'
      '  NOTA_UFVEICULO = :NOTA_UFVEICULO,'
      '  NOTA_FRETE = :NOTA_FRETE,'
      '  NOTA_VALOR_FRETE = :NOTA_VALOR_FRETE,'
      '  NOTA_VALOR_SEGURO = :NOTA_VALOR_SEGURO,'
      '  NOTA_VALOR_OUTROS = :NOTA_VALOR_OUTROS,'
      '  NOTA_QUANTIDADE = :NOTA_QUANTIDADE,'
      '  NOTA_ESPECIE = :NOTA_ESPECIE,'
      '  NOTA_MARCA = :NOTA_MARCA,'
      '  NOTA_VOLNUM = :NOTA_VOLNUM,'
      '  NOTA_PESOBRUTO = :NOTA_PESOBRUTO,'
      '  NOTA_PESOLIQUIDO = :NOTA_PESOLIQUIDO,'
      '  NOTA_DADOSADICIONAIS = :NOTA_DADOSADICIONAIS,'
      '  CODVENDEDOR = :CODVENDEDOR,'
      '  STATUS = :STATUS,'
      '  CONDICAO = :CONDICAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATATERMINO = :DATATERMINO,'
      '  ICMSSIMPLES = :ICMSSIMPLES,'
      '  ICMSSIMPALIQ = :ICMSSIMPALIQ,'
      '  ISSALIQ = :ISSALIQ,'
      '  NOTA_IESUBST = :NOTA_IESUBST,'
      '  NOTA_DATASAIDA = :NOTA_DATASAIDA,'
      '  NOTA_BASEICMSSUBST = :NOTA_BASEICMSSUBST,'
      '  NOTA_VALORICMSSUBST = :NOTA_VALORICMSSUBST,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  CODRESPONSAVEL = :CODRESPONSAVEL,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  ECF = :ECF,'
      '  OSTIPO = :OSTIPO,'
      '  CODCENTRO = :CODCENTRO,'
      '  PERCCOMIS_CALCULO = :PERCCOMIS_CALCULO,'
      '  PERCCOMIS_PROD = :PERCCOMIS_PROD,'
      '  PERCCOMIS_PECA = :PERCCOMIS_PECA,'
      '  PERCCOMIS_SERV = :PERCCOMIS_SERV'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into MOVIMENTOS'
      
        '  (CODIGO, ES, TIPO, CODCLIENTE, DATA, EQUIPAMENTO, PROBLEMA, SO' +
        'LICITANTE, '
      'ATENDIMENTO, '
      '   SERVICOS, VALOR_SERVICOS, OPCIONAIS, CONDICOES1, CONDICOES2, '
      'VALOR_ITENS, '
      '   DESCONTO, OBSERVACOES, NOTA_NUMERO, NOTA_DATAEMISSAO, '
      'NOTA_CODNATUOPER, '
      '   NOTA_CODTRANSPORTADOR, NOTA_PLACAVEICULO, NOTA_UFVEICULO, '
      'NOTA_FRETE, '
      '   NOTA_VALOR_FRETE, NOTA_VALOR_SEGURO, NOTA_VALOR_OUTROS, '
      'NOTA_QUANTIDADE, '
      '   NOTA_ESPECIE, NOTA_MARCA, NOTA_VOLNUM, NOTA_PESOBRUTO, '
      'NOTA_PESOLIQUIDO, '
      '   NOTA_DADOSADICIONAIS, CODVENDEDOR, STATUS, CONDICAO, '
      'DATAINICIO, DATATERMINO, '
      
        '   ICMSSIMPLES, ICMSSIMPALIQ, ISSALIQ, NOTA_IESUBST, NOTA_DATASA' +
        'IDA, '
      'NOTA_BASEICMSSUBST, '
      '   NOTA_VALORICMSSUBST, VALOR_IPI, CODRESPONSAVEL, PRIORIDADE, '
      'ECF, OSTIPO, '
      '   CODCENTRO, PERCCOMIS_CALCULO, PERCCOMIS_PROD, '
      'PERCCOMIS_PECA, PERCCOMIS_SERV, CODEMPRESA)'
      'values'
      
        '  (:CODIGO, :ES, :TIPO, :CODCLIENTE, :DATA, :EQUIPAMENTO, :PROBL' +
        'EMA, '
      ':SOLICITANTE, '
      
        '   :ATENDIMENTO, :SERVICOS, :VALOR_SERVICOS, :OPCIONAIS, :CONDIC' +
        'OES1, '
      ':CONDICOES2, '
      '   :VALOR_ITENS, :DESCONTO, :OBSERVACOES, :NOTA_NUMERO, '
      ':NOTA_DATAEMISSAO, '
      '   :NOTA_CODNATUOPER, :NOTA_CODTRANSPORTADOR, '
      ':NOTA_PLACAVEICULO, :NOTA_UFVEICULO, '
      '   :NOTA_FRETE, :NOTA_VALOR_FRETE, :NOTA_VALOR_SEGURO, '
      ':NOTA_VALOR_OUTROS, '
      '   :NOTA_QUANTIDADE, :NOTA_ESPECIE, :NOTA_MARCA, :NOTA_VOLNUM, '
      ':NOTA_PESOBRUTO, '
      '   :NOTA_PESOLIQUIDO, :NOTA_DADOSADICIONAIS, :CODVENDEDOR, '
      ':STATUS, :CONDICAO, '
      
        '   :DATAINICIO, :DATATERMINO, :ICMSSIMPLES, :ICMSSIMPALIQ, :ISSA' +
        'LIQ, '
      ':NOTA_IESUBST, '
      '   :NOTA_DATASAIDA, :NOTA_BASEICMSSUBST, :NOTA_VALORICMSSUBST, '
      ':VALOR_IPI, '
      '   :CODRESPONSAVEL, :PRIORIDADE, :ECF, :OSTIPO, :CODCENTRO, '
      ':PERCCOMIS_CALCULO, '
      
        '   :PERCCOMIS_PROD, :PERCCOMIS_PECA, :PERCCOMIS_SERV, :CODEMPRES' +
        'A)'
      ' ')
    DeleteSQL.Strings = (
      'delete from MOVIMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 456
    Top = 112
  end
  object qryMovimentos: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traMovimentos
    ForcedRefresh = True
    AfterClose = qryMovimentosAfterClose
    AfterEdit = qryMovimentosAfterEdit
    AfterInsert = qryMovimentosAfterInsert
    AfterOpen = qryMovimentosAfterOpen
    AfterPost = qryMovimentosAfterPost
    BeforePost = qryMovimentosBeforePost
    BufferChunks = 100
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM MOVIMENTOS WHERE CODIGO = :codigo')
    UniDirectional = True
    UpdateObject = updMovimentos
    Left = 368
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object traTransportador: TIBTransaction
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
    Left = 40
    Top = 168
  end
  object traLoadItens: TIBTransaction
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
    Left = 120
    Top = 168
  end
  object traTecnico: TIBTransaction
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
    Left = 200
    Top = 168
  end
  object traDocumentos: TIBTransaction
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
    Left = 368
    Top = 168
  end
  object traPagamentos: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 456
    Top = 168
  end
  object traInfoItem: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 120
    Top = 16
  end
  object traGravaItem: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 200
    Top = 16
  end
  object traCancelaItem: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 280
    Top = 16
  end
  object traMovimentos: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 368
    Top = 16
  end
  object traOS_VENDER: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'write'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 40
    Top = 328
  end
  object traServico: TIBTransaction
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
    Left = 456
    Top = 16
  end
  object traClientes: TIBTransaction
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
    Left = 120
    Top = 328
  end
  object traVendedores: TIBTransaction
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
    Left = 200
    Top = 328
  end
  object traProduto: TIBTransaction
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
    Left = 280
    Top = 328
  end
  object qryProduto: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traProduto
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    DataSource = dsrItens
    SQL.Strings = (
      'SELECT'
      '  PO.ICMS AS ICMS,'
      '  PO.UNIDADE AS UNIDADE'
      'FROM'
      '  PRODUTOS PO'
      '  JOIN INDIVIDUAIS ID ON'
      '   (ID.CODPRODUTO = PO.CODIGO)'
      'WHERE'
      '  ID.BARRA = :BARRA')
    UniDirectional = True
    Left = 280
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'BARRA'
        ParamType = ptUnknown
      end>
  end
  object dsrProduto: TDataSource
    AutoEdit = False
    DataSet = qryProduto
    Left = 280
    Top = 424
  end
  object traVeiculo: TIBTransaction
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
    Left = 280
    Top = 168
  end
  object qryVeiculo: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traVeiculo
    AutoCalcFields = False
    AfterOpen = qryTecnicoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO FROM VEICULOS'
      'ORDER BY DESCRICAO'
      '')
    Left = 280
    Top = 216
  end
  object dsrVeiculo: TDataSource
    AutoEdit = False
    DataSet = qryVeiculo
    Left = 280
    Top = 264
  end
  object traDaruma: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 368
    Top = 328
  end
  object spDaruma: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traDaruma
    StoredProcName = 'ICMS_DARUMA345'
    Left = 368
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'ALIQUOTA_FISCAL'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'ICMS'
        ParamType = ptInput
      end>
  end
  object traLimites: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 456
    Top = 328
  end
  object spLimites: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traLimites
    StoredProcName = 'LIMITES_SAIDA'
    Left = 456
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'METODO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PRODUTOS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'SERVICOS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end>
  end
  object traICMS: TIBTransaction
    Active = False
    DefaultDatabase = dmoPrincipal.Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read'
      'read_committed'
      'rec_version'
      'wait')
    AutoStopAction = saCommit
    Left = 544
    Top = 328
  end
  object spICMS: TIBStoredProc
    Database = dmoPrincipal.Database
    Transaction = traICMS
    StoredProcName = 'CALC_ICMS'
    Left = 544
    Top = 376
    ParamData = <
      item
        DataType = ftBCD
        Name = 'VALOR_ICMS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODMOVIMENTO'
        ParamType = ptInput
      end>
  end
  object traAtivacao: TIBTransaction
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
    Left = 544
    Top = 16
  end
  object qryAtivacao: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traAtivacao
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  PO.ATIVACAO,'
      '  ID.CODIGO'
      'FROM'
      '  PRODUTOS PO '
      '  JOIN INDIVIDUAIS ID ON'
      '    (ID.CODPRODUTO = PO.CODIGO)'
      'WHERE'
      '  ID.BARRA = :BARRA AND'
      '  ID.CODMOVSAIDA = :CODMOVIMENTO AND'
      '  ID.PS = '#39'S'#39' AND'
      '  ID.VENDIDO = '#39'S'#39)
    UniDirectional = True
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BARRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODMOVIMENTO'
        ParamType = ptUnknown
      end>
  end
end
