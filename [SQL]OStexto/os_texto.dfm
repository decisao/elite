object formOStexto: TformOStexto
  Left = 83
  Top = 56
  Width = 646
  Height = 401
  Caption = 'Imprimir OS formato texto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object qryOrcamento: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traOrcamento
    AfterOpen = qryOrcamentoAfterOpen
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '        MOVIMENTOS.CODIGO ,'
      '        MOVIMENTOS.DATA ,'
      '        MOVIMENTOS.SERVICOS ,'
      '        MOVIMENTOS.VALOR_SERVICOS ,'
      '        MOVIMENTOS.OPCIONAIS ,'
      '        MOVIMENTOS.CONDICOES1 ,'
      '        MOVIMENTOS.CONDICOES2 ,'
      '        MOVIMENTOS.VALOR_ITENS ,'
      '        MOVIMENTOS.DESCONTO ,'
      '        MOVIMENTOS.PROBLEMA,'
      '        MOVIMENTOS.EQUIPAMENTO,'
      '        MOVIMENTOS.SOLICITANTE,'
      '        MOVIMENTOS.VALOR_TOTAL ,'
      '        CLIENTES.NOME ,'
      '        CLIENTES.PESSOAFISICA ,'
      '        LOGRADOUROS.LOGRADOURO ,'
      '        CLIENTES.NUMERO ,'
      '        CLIENTES.COMPLEMENTO ,'
      '        BAIRROS.BAIRRO ,'
      '        LOGRADOUROS.CEP ,'
      '        CIDADES.CIDADE ,'
      '        CIDADES.ESTADO ,'
      '        CLIENTES.FONE ,'
      '        CLIENTES.FAX ,'
      '        CLIENTES.CELULAR ,'
      '        CLIENTES.EMAIL ,'
      '        CLIENTES.CONTATO ,'
      '        CLIENTES.RG ,'
      '        CLIENTES.CPF ,'
      '        CLIENTES.CGC ,'
      '        CLIENTES.IE,'
      '        CLIENTES.RAZAOSOCIAL,'
      '        VENDEDORES.NOME'
      'FROM'
      '        MOVIMENTOS,'
      '        CLIENTES,'
      '        BAIRROS,'
      '        CIDADES,'
      '        LOGRADOUROS,'
      '        VENDEDORES'
      ''
      'WHERE ( MOVIMENTOS.CODCLIENTE = CLIENTES.CODIGO )'
      '  AND'
      '( MOVIMENTOS.CODVENDEDOR_ABRE = VENDEDORES.CODIGO )'
      'AND'
      ' ( CLIENTES.LOCALIZACAO = LOGRADOUROS.CODIGO )'
      '  AND'
      ' ( LOGRADOUROS.CIDADE = CIDADES.CODIGO )'
      '  AND'
      ' ( LOGRADOUROS.BAIRRO = BAIRROS.CODIGO )'
      '  AND'
      ' ('
      ' ( MOVIMENTOS.CODIGO = :codigo )'
      ' )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UniDirectional = True
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object qryItens: TIBQuery
    Database = dmoPrincipal.Database
    Transaction = traItens
    AutoCalcFields = False
    BufferChunks = 100
    CachedUpdates = False
    SQL.Strings = (
      'SELECT INDIVIDUAIS.CODPRODUTO , PRODUTOS.DESCRICAO ,'
      
        ' INDIVIDUAIS.QUANTIDADE , INDIVIDUAIS.VALOR_VENDA AS VALOR_UNITA' +
        'RIO , '
      ' INDIVIDUAIS.DESCONTO , INDIVIDUAIS.VALOR_PAGO AS VALOR_TOTAL'
      'FROM INDIVIDUAIS, PRODUTOS'
      'WHERE ( INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO )'
      '  AND'
      ' ('
      ' ( INDIVIDUAIS.CODMOVSAIDA = :codigo ) AND'
      ' ( INDIVIDUAIS.VENDIDO = '#39'S'#39' )'
      ' )'
      ' ')
    Left = 120
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object traOrcamento: TIBTransaction
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
    Left = 41
    Top = 5
  end
  object traItens: TIBTransaction
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
    Left = 121
    Top = 5
  end
end
