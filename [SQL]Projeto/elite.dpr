program elite;

uses
  Forms,
  daIBExpress,
  ppChrt,
  ppChrtDP,
  ppChrtUI,
  ppChDPEd,
  principal in 'principal.pas' {formPrincipal},
  cidades in '..\[SQL]Cidades\cidades.pas' {formCidades},
  relaccidades in '..\[SQL]Cidades\relaccidades.pas' {dmoRelacCidades: TDataModule},
  data_principal in '..\[SQL]ModuloPrincipal\data_principal.pas' {dmoPrincipal: TDataModule},
  clientes in '..\[SQL]Clientes\clientes.pas' {formClientes},
  relacclientes in '..\[SQL]Clientes\relacclientes.pas' {dmoRelacClientes: TDataModule},
  estados in '..\[SQL]Estados\estados.pas' {formEstados},
  relacfornecedores in '..\[SQL]Fornecedores\relacfornecedores.pas' {dmoRelacFornecedores: TDataModule},
  grupos in '..\[SQL]Grupos\grupos.pas' {formGrupos},
  localidades in '..\[SQL]Localidades\localidades.pas' {formLocalidades},
  relaclocalidades in '..\[SQL]Localidades\relaclocalidades.pas' {dmoRelacLocalidades: TDataModule},
  produtos in '..\[SQL]Produtos\produtos.pas' {formProdutos},
  unidades in '..\[SQL]Unidades\unidades.pas' {formUnidades},
  itsorcamento in '..\[SQL]Orçamento\itsorcamento.pas' {formITorcamento},
  orcamento in '..\[SQL]Orçamento\orcamento.pas' {formOrcamento},
  bairros in '..\[SQL]Bairros\bairros.pas' {formBairros},
  compras in '..\[SQL]Compras\compras.pas' {formCompras},
  itcompra in '..\[SQL]Compras\itcompra.pas' {formITcompra},
  mensagens in '..\[SQL]Mensagens\mensagens.pas' {formMensagem},
  sobre in '..\[SQL]Sobre\sobre.pas' {formSobre},
  variacoes in '..\[SQL]Variações\variacoes.pas' {formReajustes},
  natuoper in '..\[SQL]Natuoper\natuoper.pas' {formNatuoper},
  documentos in '..\[SQL]Documentos\documentos.pas' {formDocumentos},
  newlocal in '..\[SQL]as_NovaLocalidade\newlocal.pas' {formNovaLocalidade},
  itindividuo in '..\[SQL]Compras\itindividuo.pas' {formITindividuais},
  preview in '..\[SQL]Preview\preview.pas' {formPreview},
  DOSPrint in '..\[SQL]DosPrint\dosprint.pas',
  os in '..\[SQL]OS\os.pas' {formOS},
  relorcamento in '..\[SQL]Orçamento\relorcamento.pas' {relatOrcamento: TQuickRep},
  relosaberta in '..\[SQL]OS\relosaberta.pas' {relatOSaberta: TQuickRep},
  venda_direta in '..\[SQL]Venda\venda_direta.pas' {formVendaDireta},
  venda_data in '..\[SQL]Venda\venda_data.pas' {dataVenda: TDataModule},
  notafiscal in '..\[SQL]NotaFiscal\notafiscal.pas' {formNotaFiscal},
  sisconfig in '..\[SQL]SisConfig\sisconfig.pas' {formSisConfig},
  contas in '..\[SQL]Contas\contas.pas' {formContas},
  os_texto in '..\[SQL]OStexto\os_texto.pas' {formOStexto},
  os_nota in '..\[SQL]OStexto\os_nota.pas' {formOSnota},
  sequencia in '..\[SQL]Sequencia\sequencia.pas' {formSequencia},
  notamodelo in '..\[SQL]NotaModelo\notamodelo.pas' {formNotaModelo},
  untSerialHex in '..\[SQL]SerialHex\untSerialHex.pas' {formSerialHex},
  consulta_produto in '..\[SQL]ConsultaProduto\consulta_produto.pas' {formConsultaProduto},
  comprapag in '..\[SQL]Compras\comprapag.pas' {formCompraPag},
  ospag in '..\[SQL]OS\ospag.pas' {formOSpag},
  impnota in '..\[SQL]ImpNota\impnota.pas' {formImpNota},
  impnotacorpo in '..\[SQL]ImpNota\impnotacorpo.pas' {formImpNotaCorpo},
  impnotadup in '..\[SQL]ImpNota\impnotadup.pas' {formImpNotaDup},
  impnotapro in '..\[SQL]ImpNota\impnotapro.pas' {formImpNotaPro},
  impnotaser in '..\[SQL]ImpNota\impnotaser.pas' {formImpNotaSer},
  servicos in '..\[SQL]Serviços\servicos.pas' {formServicos},
  paramNFcorpo in '..\[SQL]ImpNota\paramNFcorpo.pas' {formParamNFCorpo},
  paramNFdup in '..\[SQL]ImpNota\paramNFdup.pas' {formParamNFDup},
  paramNFpro in '..\[SQL]ImpNota\paramNFpro.pas' {formParamNFPro},
  paramNFser in '..\[SQL]ImpNota\paramNFser.pas' {formParamNFSer},
  imprimirnota in '..\[SQL]ImpNota\imprimirnota.pas' {formImprimirNota},
  regua in '..\[SQL]Regua\regua.pas' {formRegua},
  sst in '..\[SQL]SST\sst.pas' {formSST},
  marcas in '..\[SQL]Marcas\marcas.pas' {formMarcas},
  modelos in '..\[SQL]Modelos\modelos.pas' {formModelos},
  defeitos in '..\[SQL]Defeitos\defeitos.pas' {formDefeitos},
  histoque in '..\[SQL]Variações\histoque.pas' {formHistoque},
  empreendimento in '..\[SQL]Empreendimentos\empreendimento.pas' {formEmpreendimentos},
  areasemp in '..\[SQL]Areas_emp\areasemp.pas' {formAreasEmp},
  areas_cli in '..\[SQL]Areas_cli\areas_cli.pas' {formAreasCli},
  lancto in '..\[SQL]Lancto\lancto.pas' {formLANCTO},
  extrato in '..\[SQL]Extrato\extrato.pas' {formExtrato},
  relextrato in '..\[SQL]Extrato\relextrato.pas' {formRelExtrato},
  contareceber in '..\[SQL]ContaReceber\contareceber.pas' {formContaReceber},
  imprimirosaberta in '..\[SQL]OS\imprimirosaberta.pas' {formImprimirOSaberta},
  imprimirosfechada in '..\[SQL]Venda\imprimirosfechada.pas' {formImprimirOSfechada},
  baixa in '..\[SQL]Baixa\baixa.pas' {formBaixa},
  login in '..\[SQL]Login\login.pas' {formLogin},
  impboleto in '..\[SQL]ImpBoleto\impboleto.pas' {formImpBoleto},
  impboletocorpo in '..\[SQL]ImpBoleto\impboletocorpo.pas' {formImpBoletoCorpo},
  imprimirrecibo in '..\[SQL]ImpBoleto\imprimirrecibo.pas' {formImprimirRecibo},
  selecionarempresa in '..\[SQL]ModuloPrincipal\selecionarempresa.pas' {formSelecionarEmpresa},
  transf in '..\[SQL]Transf\transf.pas' {formTransf},
  daruma_fs345 in '..\[SQL]Venda\daruma_fs345.pas',
  gridreport in '..\[SQL]gridreport\gridreport.pas' {formGridReport},
  equipamentos in '..\[SQL]OS\equipamentos.pas' {formEquipamento},
  ocorrencias in '..\[SQL]OS\ocorrencias.pas' {formOcorrencia},
  veiculos in '..\[SQL]Veiculos\veiculos.pas' {formVeiculos},
  cli_files in '..\[SQL]Clientes\cli_files.pas' {formCli_files},
  pro_files in '..\[SQL]Produtos\pro_files.pas' {formPro_files},
  pessoas in '..\[SQL]Pessoas\pessoas.pas' {formPessoas},
  clientehistorico in '..\[SQL]Clientes\clientehistorico.pas' {formClienteHistorico},
  recalculo in '..\[SQL]Recalculo\recalculo.pas' {formRecalculo},
  reconcile in '..\[SQL]ModuloPrincipal\reconcile.pas' {ReconcileErrorForm},
  ostipos in '..\[SQL]OSTipos\ostipos.pas' {formOStipos},
  bancos in '..\[SQL]Bancos\bancos.pas' {formBancos},
  transferencias in '..\[SQL]Transf\transferencias.pas' {formTransferencias},
  sysdba in '..\criptografia\simples\sysdba.pas' {formSysdba},
  dataSisconfig in '..\[SQL]SisConfig\dataSisconfig.pas' {dmoSisconfig: TDataModule},
  os_nota2 in '..\[SQL]OStexto\os_nota2.pas' {formOSnota2},
  imprimirosaberta2 in '..\[SQL]OS\imprimirosaberta2.pas' {formImprimirOSaberta2},
  data_produtos in '..\[SQL]Produtos\data_produtos.pas' {dmoProdutos: TDataModule},
  splash in 'splash.pas' {formSplash},
  cli_equip in '..\[SQL]Clientes\cli_equip.pas' {formCli_equip},
  cartas in '..\[SQL]Cartas\cartas.pas' {formCartas},
  cartas_perguntas in '..\[SQL]Cartas\cartas_perguntas.pas' {formCartas_perguntas},
  cartas_legendas in '..\[SQL]Cartas\cartas_legendas.pas' {formCartas_legendas},
  cartas_cartaitem in '..\[SQL]Cartas\cartas_cartaitem.pas' {formCartas_CartaItem},
  cartas_carta in '..\[SQL]Cartas\cartas_carta.pas' {formCartas_Carta},
  cli_receber in '..\[SQL]Clientes\cli_receber.pas' {formCli_receber},
  quemcompra in '..\[SQL]Produtos\quemcompra.pas' {formQuemCompra},
  Prin in '..\xadrez\Prin.pas' {frmPrin},
  centros in '..\[SQL]Centros\centros.pas' {formCentros},
  condpag in '..\[SQL]CondPag\condpag.pas' {formCondPag},
  password in '..\[SQL]UserAdmin\password.pas' {formPassword},
  contapagar in '..\[SQL]ContaPagar\contapagar.pas' {formContaPagar},
  plancontas in '..\[SQL]PlanContas\plancontas.pas' {formPlanContas},
  contaspagas in '..\[SQL]ContaPagar\contaspagas.pas' {formContasPagas},
  contasrecebidas in '..\[SQL]ContaReceber\contasrecebidas.pas' {formContasRecebidas},
  operadoras in '..\[SQL]Operadoras\operadoras.pas' {formOperadoras},
  planos in '..\[SQL]Operadoras\planos.pas' {formPlanos},
  ativacao in '..\[SQL]Operadoras\ativacao.pas' {formAtivacao},
  contratos in '..\[SQL]Contratos\contratos.pas' {formContratos},
  patrimonio in '..\[SQL]Patrimonio\patrimonio.pas' {formPatrimonio},
  confirmasenha in 'confirmasenha.pas' {formConfirmaSenha},
  faturar_contratos in '..\[SQL]Contratos\faturar_contratos.pas' {formFaturarContratos},
  updatedb in 'updatedb.pas' {formUpdateDB},
  backup in 'backup.pas' {formBackup};

{$R *.RES}

//  CODIGO MODIFICADO MANUALMENTE
//  Application.Initialize;
//  Application.Title := 'Sistema Empresa1';
//  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
//  if dmoPrincipal.Database.Connected then
//   begin
//    Application.CreateForm(TformPrincipal, formPrincipal);
//    Application.CreateForm(TdataVenda, dataVenda);
//    Application.Run;
//   end else dmoPrincipal.Free;

begin
  Application.Initialize;
  Application.Title := 'Empresa1 Elite';
  Application.HelpFile := 'empresa1.hlp';
  try
    formSplash := TformSplash.Create(Application);
    formSplash.showmodal;
  finally
    formSplash.release;
  end;

  Application.CreateForm(TdmoPrincipal, dmoPrincipal);
  if dmoPrincipal.Database.Connected then
   begin
    Application.CreateForm(TformPrincipal, formPrincipal);

    // avlock
    with formPrincipal.avlockg51 do
     if ParamStr(1) = '' then
      begin
        encryptionkey:='m0ra15r315';
        execute;
      end;

    Application.CreateForm(TdataVenda, dataVenda);
    Application.Run;
   end else dmoPrincipal.Free;
end.

