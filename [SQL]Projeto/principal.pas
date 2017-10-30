unit principal;

interface

{x$DEFINE DARUMA}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TimerLst, ComCtrls, Menus, RxCalc, RxGrdCpt, Placemnt,
  RXShell, ExtCtrls, TB97Tlbr, TB97Ctls, TB97, SpeedBar,
  StdCtrls, Just1_32, db, ImgList, Grids, DBGrids, zebdbgrid, IBSQLMonitor,
  RxHints, ActnList, PlannerCal, dxBar, auHTTP, auAutoUpgrader, AVLockG5;

const
  CM_FORMSETUP = WM_USER + 1;

type
  TformPrincipal = class(TForm)
    Calculadora: TRxCalculator;
    FormStorage: TFormStorage;
    StatusBar1: TStatusBar;
    Relogio: TTimer;
    imgMenu: TImageList;
    imgBotoes: TImageList;
    pnlCalendario: TPanel;
    grdMonitor: Tzebdbgrid;
    dxBarManager: TdxBarManager;
    Sobre1: TdxBarButton;
    Desconectar1: TdxBarButton;
    Sair1: TdxBarButton;
    Sistema1: TdxBarSubItem;
    Clientes1: TdxBarButton;
    Produtos1: TdxBarButton;
    Servios1: TdxBarButton;
    Naturezadaoperao1: TdxBarButton;
    Marcas1: TdxBarButton;
    Defeitos1: TdxBarButton;
    Veculos1: TdxBarButton;
    TiposdeOS1: TdxBarButton;
    CartasdeManuteno1: TdxBarButton;
    Formasdepagamento1: TdxBarButton;
    Contas1: TdxBarButton;
    Bancos1: TdxBarButton;
    Empreendimentos1: TdxBarButton;
    Cadastros1: TdxBarSubItem;
    Oramentos1: TdxBarButton;
    Compras1: TdxBarButton;
    Transferencia1: TdxBarButton;
    OrdemdeServio1: TdxBarButton;
    Venda1: TdxBarButton;
    Movimentos1: TdxBarSubItem;
    Extratodeconta1: TdxBarButton;
    ContasaPagar1: TdxBarButton;
    Contasareceber1: TdxBarButton;
    Financeiro1: TdxBarSubItem;
    LeituraX1: TdxBarButton;
    ReduoZ1: TdxBarButton;
    Cancelarltimocupom1: TdxBarButton;
    ECF1: TdxBarSubItem;
    Relatorios1: TdxBarButton;
    Maladireitaviaemail1: TdxBarButton;
    Relatrios1: TdxBarSubItem;
    PerfildoSistema1: TdxBarButton;
    SingleSQLTool1: TdxBarButton;
    Rguadeimpresso1: TdxBarButton;
    ModelosdeNotaFiscal1: TdxBarButton;
    GeografiadoBoletoRecibo1: TdxBarButton;
    Admin: TdxBarSubItem;
    Recalculo1: TdxBarButton;
    Sequencia1: TdxBarButton;
    ConversorDecimalHexadecimal1: TdxBarButton;
    ConsultarProduto1: TdxBarButton;
    Ferramentas1: TdxBarSubItem;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    btpClientes: TToolbarButton97;
    Separador: TToolbarSep97;
    btpAjuda: TToolbarButton97;
    btpRelatorios: TToolbarButton97;
    btpProdutos: TToolbarButton97;
    btpVenda: TToolbarButton97;
    btpOS: TToolbarButton97;
    btpConectar: TToolbarButton97;
    sepbar1: TToolbarSep97;
    sepbar3: TToolbarSep97;
    sepbar2: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    Centros1: TdxBarButton;
    Ajuda: TdxBarSubItem;
    Conteudo1: TdxBarButton;
    CondicaoPagamento1: TdxBarButton;
    PlannerCalendarGroup: TPlannerCalendarGroup;
    ArquivoMorto1: TdxBarSubItem;
    ContasPagas1: TdxBarButton;
    ContasRecebidas1: TdxBarButton;
    PlanoContas1: TdxBarButton;
    Operadoras1: TdxBarButton;
    Patrimonio1: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    auAutoUpgrader: TauAutoUpgrader;
    dxBarButton3: TdxBarButton;
    auHTTPupd: TauHTTP;
    auHTTPlog: TauHTTP;
    AVLockG51: TAVLockG5;
    dxBarButton4: TdxBarButton;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure RelogioTimer(Sender: TObject);
    procedure Localidades1Click(Sender: TObject);
    procedure btpClientesClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure btpProdutosClick(Sender: TObject);
    procedure btpOrcamentosClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Naturezadaoperao1Click(Sender: TObject);
    procedure Formasdepagamento1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure WizardBtnClick(Sender: TObject);
    procedure View2BtnClick(Sender: TObject);
    procedure View3BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure btpRelatoriosClick(Sender: TObject);
    procedure btpOSClick(Sender: TObject);
    procedure btpVendaClick(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PerfildoSistema1Click(Sender: TObject);
    procedure Sequencia1Click(Sender: TObject);
    procedure ModelosdeNotaFiscal1Click(Sender: TObject);
    procedure ConversorDecimalHexadecimal1Click(Sender: TObject);
    procedure ConsultarProduto1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Rguadeimpresso1Click(Sender: TObject);
    procedure SingleSQLTool1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure Defeitos1Click(Sender: TObject);
    procedure btpConectarClick(Sender: TObject);
    procedure Desconectar1Click(Sender: TObject);
    procedure Empreendimentos1Click(Sender: TObject);
    procedure Lanamentoimediato1Click(Sender: TObject);
    procedure Extratodeconta1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure GeografiadoBoletoRecibo1Click(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure Transferencia1Click(Sender: TObject);
    procedure LeituraX1Click(Sender: TObject);
    procedure ReduoZ1Click(Sender: TObject);
    procedure Cancelarltimocupom1Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure btpAjudaMouseEnter(Sender: TObject);
    procedure btpAjudaMouseExit(Sender: TObject);
    procedure Recalculo1Click(Sender: TObject);
    procedure TiposdeOS1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actPessoasExecute(Sender: TObject);
    procedure btpAjudaClick(Sender: TObject);
    procedure CartasdeManuteno1Click(Sender: TObject);
    procedure Centros1Click(Sender: TObject);
    procedure Conteudo1Click(Sender: TObject);
    procedure CondicaoPagamento1Click(Sender: TObject);
    procedure PlanoContas1Click(Sender: TObject);
    procedure ContasPagas1Click(Sender: TObject);
    procedure ContasRecebidas1Click(Sender: TObject);
    procedure Operadoras1Click(Sender: TObject);
    procedure Patrimonio1Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure auAutoUpgraderNoUpdateAvailable(Sender: TObject);
    procedure auAutoUpgraderEndUpgrade(Sender: TObject);
    procedure auHTTPlogDone(Sender: TObject; const ContentType: String;
      FileSize: Integer; Stream: TStream);
    procedure dxBarButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure FormStart(var Message: TMessage); message CM_FORMSETUP;
    procedure DisplayHint(Sender: TObject);
    procedure EsconderBotoes;
    procedure MostrarBotoes;
    procedure Desconectar;
    procedure SendLog;
  public
    timelogoff,
    maxtimelogoff: integer;
    contlogoff: boolean;
    natureza: string;
    { Public declarations }
    procedure LoadProfile;
    procedure UseIn;
    procedure UseOut;
  end;

var
  formPrincipal: TformPrincipal;

implementation

uses clientes, relaclocalidades, localidades, produtos,
  estados, orcamento, compras, sobre, natuoper,
  documentos, os, data_principal, venda_direta, contas,
  sisconfig, sequencia, impnota, untSerialHex,
  consulta_produto, servicos, regua, sst, marcas, defeitos, venda_data,
  empreendimento, lancto, extrato, contapagar, contareceber, impboleto, transferencias,
  daruma_fs345, veiculos, recalculo, selecionarempresa, ostipos, bancos,
  sysdba, cartas, centros, condpag, plancontas, contaspagas,
  contasrecebidas, operadoras, patrimonio, contratos, backup;

{$R *.DFM}

procedure TformPrincipal.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := GetLongHint(Application.Hint);
end;

procedure TformPrincipal.SendLog;
begin

  { log de entrada }
  auHTTPlog.POSTData :=
    'empresa=' + Caption + '&' +
    'data=' + FormatDateTime('DD.MM.YYYY HH:NN', now) + '&' +
    'sistema=ELITE ' + 
       auAutoUpgrader.VersionNumber + '&' +
    'usuario=' + dmoPrincipal.GetLogUser + '&' +
    'maquina=' + dmoPrincipal.NomeComputador + '&' +
    'id=' + dmoPrincipal.cdsConfig.FieldByName('ID').AsString;
  auHTTPlog.Read;

end;

procedure TformPrincipal.FormStart(var Message: TMessage);
begin

  grdMonitor.Visible := (ansiuppercase(ParamStr(2)) = '/M');

  { inicialização do calendário }
  PlannerCalendarGroup.StartYear := StrToInt(
    FormatDateTime('yyyy', now));
  PlannerCalendarGroup.StartMonth := StrToInt(
    FormatDateTime('mm', now));

  LoadProfile;
  UseOut;

  { versao do sistema }
  StatusBar1.Panels[3].Text := dmoPrincipal.GetMyVersion;

{$IFDEF DARUMA}
  ECF1.Visible := ivAlways;
  Compras1.Visible := ivNever;
{$ENDIF}
{$IFNDEF DARUMA}
  ECF1.Visible := ivNever;
{$ENDIF}
end;

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin
     close;
end;

procedure TformPrincipal.Clientes1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     formClientes := TformClientes.Create(Self);
     with formClientes do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        Showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.RelogioTimer(Sender: TObject);
var
  segundos: string;
begin
     StatusBar1.Panels[0].Text := FormatDateTime('hh:mm am/pm', Now);
     if contlogoff then
      begin
       timelogoff := timelogoff - 1;
       if timelogoff > 1 then
         segundos := 'segundos'
       else
         segundos := 'segundo';
       if timelogoff < 30 then
        StatusBar1.Panels[2].Text := Format(
          '%s irá desconectar em %.2d %s...',
          [dmoPrincipal.GetLogUser, timelogoff, segundos]);
       if timelogoff = 0 then Desconectar;
      end;
end;

procedure TformPrincipal.Localidades1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformLocalidades.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.btpClientesClick(Sender: TObject);
begin
     Clientes1Click(Sender);
end;

procedure TformPrincipal.Produtos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformProdutos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Oramentos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformOrcamento.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Compras1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformCompras.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;


procedure TformPrincipal.btpProdutosClick(Sender: TObject);
begin
     Produtos1Click(Sender);
end;

procedure TformPrincipal.btpOrcamentosClick(Sender: TObject);
begin
     Oramentos1Click(Sender);
end;

procedure TformPrincipal.Sobre1Click(Sender: TObject);
begin
     UseIn;
     with TformSobre.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       showmodal;
      finally
       release;
      end;
     UseOut;
end;

procedure TformPrincipal.Naturezadaoperao1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformNatuoper.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Formasdepagamento1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformDocumentos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Venda1Click(Sender: TObject);
begin
 UseIn;
 Screen.Cursor := crHourGlass;
 with TformVendaDireta.Create(Self) do
  try
    inOS := 0;
    inNatureza := natureza;
    Caption := Self.Caption + ' -> ' + Caption;
    { se a tela for pequena, maximizo a venda }
    if (Screen.Width < 700) and (Screen.Height < 550) then
      WindowState := wsMaximized else
     begin
      { se não, defino o tamanho manualmente }
      Height := 484;
      Width  := 652;
     end;
    showmodal;
  finally
    release;
    natureza := '';
  end;
 UseOut;
end;

procedure TformPrincipal.WizardBtnClick(Sender: TObject);
begin
     Oramentos1Click(Sender);
end;

procedure TformPrincipal.View2BtnClick(Sender: TObject);
begin
   Clientes1Click(Sender);
end;

procedure TformPrincipal.View3BtnClick(Sender: TObject);
begin
     Produtos1Click(Sender);
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  contlogoff := false;
  natureza := '';
  RxHints.SetHintStyle(hsRoundRect, 3, true, taLeftJustify );
  Application.OnHint := DisplayHint;                                 
end;

procedure TformPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const
  maxmsg = 5;
  msg: array[1..maxmsg] of String =
   (  'Recebi um pedido para encerrar o sistema, #. Você tem certeza?'    ,
      'Estou prestes a encerrar o sistema. Você ainda quer terminar, #?'  ,
      'Por favor #, diga se deseja mesmo encerrar o sistema...'           ,
      'Gostaria de continuar usando o sistema #? Então clique em Não!'    ,
      '#, estou quase encerrando... apenas confirme o fechamento.'       );
var
  n: integer;
begin
  n := random(maxmsg) + 1;
  CanClose := dmoPrincipal.Pergunta(
    msg[n], 'Atenção, #!', 2) = IDYES;
end;

procedure TformPrincipal.OrdemdeServio1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformOS.Create(Self) do
      try
        OrcamentoOS := False;
        codOrcamento := 0;
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.btpRelatoriosClick(Sender: TObject);
begin
  Relatorios1Click(Sender);
end;

procedure TformPrincipal.btpOSClick(Sender: TObject);
begin
    OrdemdeServio1Click(Sender);
end;

procedure TformPrincipal.btpVendaClick(Sender: TObject);
begin
    Venda1Click(Sender);
end;

procedure TformPrincipal.Contas1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformContas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.LoadProfile;
var
  i: byte;
  ativo: boolean;
begin

   with TformSelecionarEmpresa.Create(Self) do
    try
{$IFNDEF DARUMA}
     if cdsEmpresa.RecordCount > 1 then
      begin
       if showmodal = mrOK then
         dmoPrincipal.qryConfigInfo.paramByName('CODEMPRESA').AsInteger :=
            cdsEmpresa.FieldByName('CODIGO').AsInteger;
      end else
{$ENDIF}
      begin
         dmoPrincipal.qryConfigInfo.paramByName('CODEMPRESA').AsInteger :=
            cdsEmpresa.FieldByName('CODIGO').AsInteger;
      end;
    finally
     release;
    end;

   with dmoPrincipal do
    begin

     with cdsConfig do
      begin
       if active then close;
       open;
      end;

     maxtimelogoff := cdsConfig.fieldByName('LOGTIMEOFF').AsInteger;
     Self.Caption := Trim(cdsCliente.fieldByName('NOME').AsString);
     dxBarManager.Bars[0].Hidden := False;

{**********************************************************************}

     { privilegios }
     if cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S' then
      begin
        Financeiro1.Visible        := ivAlways;
        FormasdePagamento1.Visible := ivAlways;
        Contas1.Visible            := ivAlways;
        Bancos1.Visible            := ivAlways;
      end else
      begin
        Financeiro1.Visible        := ivNever;
        FormasdePagamento1.Visible := ivNever;
        Contas1.Visible            := ivNever;
        Bancos1.Visible            := ivNever;
      end;

     if cdsVendedor.fieldByName('COMPRAS').AsString = 'S' then
        Compras1.Visible           := ivAlways
     else
        Compras1.Visible           := ivNever;

     if cdsVendedor.fieldByName('TRANSFERENCIA').AsString = 'S' then
        Transferencia1.Visible     := ivAlways
     else
        Transferencia1.Visible     := ivNever;

     if cdsVendedor.fieldByName('RECALCULO').AsString = 'S' then
        Recalculo1.Visible         := ivAlways
     else
        Recalculo1.Visible         := ivNever;

     if cdsVendedor.fieldByName('SEQUENCIAS').AsString = 'S' then
        Sequencia1.Visible         := ivAlways
     else
        Sequencia1.Visible         := ivNever;

     if cdsVendedor.fieldByName('VENDADIRETA').AsString = 'S' then
      begin
        btpVenda.Visible           := True;
        Venda1.Visible             := ivAlways
      end else
      begin
        btpVenda.Visible           := False;
        Venda1.Visible             := ivNever;
      end;

     if cdsVendedor.fieldByName('RELATORIOS').AsString = 'S' then
      begin
        btpRelatorios.Visible      := True;
        Relatorios1.Visible        := ivAlways;
      end else
      begin
        btpRelatorios.Visible      := False;
        Relatorios1.Visible        := ivNever;
      end;

{**********************************************************************}

     { Envio do LOG }
     SendLog;

     { funções administrativas }
     ativo := false;
     if dmoPrincipal.GetLogUser = 'SYSDBA' then
      begin

       with TformSysdba.Create(Self) do
        try
         if showmodal = mrOk then
          begin
            for i := 1 to length(palavra) do
              palavra[i] := chr(not ord(palavra[i]));
            ativo := (palavra = dmoPrincipal.SysdbaPass);
          end;
        finally
         release;
        end;

      end;

     { bloqueio das funções para usuários não autenticados }
     if ativo then
      begin
        Admin.Visible              := ivAlways;
      end else
      begin
        Admin.Visible              := ivNever;
      end;

     { bloqueio da administração de relatórios }
     if not ativo then
      begin
       dmoPrincipal.ppReportExplorer.FolderOptions := [];
       dmoPrincipal.ppReportExplorer.ItemOptions   := [];
      end else if dmoPrincipal.ppReportExplorer.FolderOptions = [] then
       ShowMessage(
         'Para habilitar as funções de administração dos Relatórios, ' +
         'feche o sistema e o inicie novamente.');

     { tempo para logoff 10 segundos, independente do perfil }
     if ativo then
       maxtimelogoff := 10;

{**********************************************************************}

     HelpContext := 1;

    end;
end;

procedure TformPrincipal.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FORMSETUP, 0, 0);
end;

procedure TformPrincipal.PerfildoSistema1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformSisConfig.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Sequencia1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformSequencia.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.ModelosdeNotaFiscal1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformImpNota.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.ConversorDecimalHexadecimal1Click(
  Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformSerialHex.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
end;

procedure TformPrincipal.ConsultarProduto1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformConsultaProduto.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Servios1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformServicos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Rguadeimpresso1Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformRegua.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
end;

procedure TformPrincipal.SingleSQLTool1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformSST.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Marcas1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformMarcas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Defeitos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformDefeitos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.UseIn;
begin
  if not dmoPrincipal.Database.Connected then
   begin
    dmoPrincipal.DataModuleCreate(nil);
    dataVenda := TdataVenda.Create(Application);
    MostrarBotoes;
    LoadProfile;
   end {else AVLockG51.check};
  contlogoff := false;
  StatusBar1.Panels[2].Text := dmoPrincipal.GetLogUser;
end;

procedure TformPrincipal.UseOut;
begin
  if dmoPrincipal.Database.Connected then
   begin
    StatusBar1.Panels[2].Text :=
     dmoPrincipal.GetLogUser;
    timelogoff := maxtimelogoff;
    contlogoff := True;
//    dmoPrincipal.resolver_transacao;
   end else
   begin
    StatusBar1.Panels[2].Text := Format(
      '%s desconectou.',
      [dmoPrincipal.GetLogUser]);
   end;
end;

procedure TformPrincipal.btpConectarClick(Sender: TObject);
begin
     UseIn;
     UseOut;
end;

procedure TformPrincipal.MostrarBotoes;
begin

  { mostro o calendário }
  pnlCalendario.Visible := True;

  { mostro os itens de menu ativos }
  Cadastros1.Visible    := ivAlways;
  Movimentos1.Visible   := ivAlways;
  Financeiro1.Visible   := ivAlways;
  ECF1.Visible          := ivAlways;
  Relatrios1.Visible    := ivAlways;
  Ferramentas1.Visible  := ivAlways;
  Sobre1.Enabled        := True;
  Desconectar1.Enabled  := True;

  { escondo os botoes de conexao }
  btpConectar.Visible   := False;

  { mostro os botoes padroes }
  btpAjuda.Visible      := True;
  Separador.Visible     := True;
  btpClientes.Visible   := Clientes1.Visible      = ivAlways;
  btpProdutos.Visible   := Produtos1.Visible      = ivAlways;
  sepbar1.Visible       := Produtos1.Visible      = ivAlways;
  btpOS.Visible         := OrdemdeServio1.Visible = ivAlways;
  sepbar2.Visible       := OrdemdeServio1.Visible = ivAlways;
  btpVenda.Visible      := Venda1.Visible         = ivAlways;
  sepbar3.Visible       := Venda1.Visible         = ivAlways;
  btpRelatorios.Visible := Relatrios1.Visible     = ivAlways;

end;

procedure TformPrincipal.EsconderBotoes;
begin
  { escondo os botoes padroes }
//  btpAjuda.Visible      := False;
  Separador.Visible     := False;
  btpClientes.Visible   := False;
  btpProdutos.Visible   := False;
  sepbar1.Visible       := False;
  btpOS.Visible         := False;
  sepbar2.Visible       := False;
  btpVenda.Visible      := False;
  sepbar3.Visible       := False;
  btpRelatorios.Visible := False;

  { mostro os botoes de conexao }
  btpConectar.Visible   := True;

  { escondo os itens de menu ativos }
  Cadastros1.Visible    := ivNever;
  Movimentos1.Visible   := ivNever;
  Financeiro1.Visible   := ivNever;
  ECF1.Visible          := ivNever;
  Relatrios1.Visible    := ivNever;
  Ferramentas1.Visible  := ivNever;
  Sobre1.Enabled        := False;
  Desconectar1.Enabled  := False;

  { escondo o calendário }
  pnlCalendario.Visible := False;

end;

procedure TformPrincipal.Desconectar;
begin
   StatusBar1.Panels[2].Text := Format(
     '%s desconectou.',
     [dmoPrincipal.GetLogUser]);
   contlogoff := false;
   dxBarManager.Bars[0].Hidden := True;
   EsconderBotoes;
   dataVenda.free;
   dmoPrincipal.Database.Close;
   HelpContext := 2;
end;

procedure TformPrincipal.Desconectar1Click(Sender: TObject);
begin
  desconectar;
end;

procedure TformPrincipal.Empreendimentos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformEmpreendimentos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Lanamentoimediato1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformLANCTO.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Extratodeconta1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformExtrato.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.ContasaPagar1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformContaPagar.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Contasareceber1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformContaReceber.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.GeografiadoBoletoRecibo1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformImpBoleto.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Relatorios1Click(Sender: TObject);
begin
  UseIn;
  with dmoPrincipal do
    relatorio_explorer;
  UseOut;
end;

procedure TformPrincipal.Transferencia1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformTransferencias.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.LeituraX1Click(Sender: TObject);
var
  i: integer;
begin
{$IFDEF DARUMA}
  i := DAR_LeituraX('1');
{$ENDIF}
end;

procedure TformPrincipal.ReduoZ1Click(Sender: TObject);
var
  i: integer;
begin
{$IFDEF DARUMA}
  i := DAR_ReducaoZ(FormatDateTime('ddmmyyhhnnss', Now), '1');
{$ENDIF}
end;

procedure TformPrincipal.Cancelarltimocupom1Click(Sender: TObject);
var
  i: integer;
begin
{$IFDEF DARUMA}
  i := DAR_CancelaDoc('1');
{$ENDIF}
end;

procedure TformPrincipal.Veculos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformVeiculos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.btpAjudaMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformPrincipal.btpAjudaMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformPrincipal.Recalculo1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformRecalculo.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.TiposdeOS1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformOStipos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Bancos1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformBancos.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.actProdutosExecute(Sender: TObject);
begin
  Produtos1Click(Sender);
end;

procedure TformPrincipal.actPessoasExecute(Sender: TObject);
begin
     Clientes1Click(Sender);
end;

procedure TformPrincipal.btpAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(Help_Context, btpAjuda.HelpContext);
end;

procedure TformPrincipal.CartasdeManuteno1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformCartas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Centros1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformCentros.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Conteudo1Click(Sender: TObject);
begin
  Application.HelpCommand(Help_Context, btpAjuda.HelpContext);
end;

procedure TformPrincipal.CondicaoPagamento1Click(Sender: TObject);
begin
   UseIn;
   Screen.Cursor := crHourGlass;
   with TformCondPag.Create(Self) do
    try
      Caption := Self.Caption + ' -> ' + Caption;
      showmodal;
    finally
      release;
    end;
   UseOut;
end;

procedure TformPrincipal.PlanoContas1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformPlanContas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.ContasPagas1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformContasPagas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.ContasRecebidas1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformContasRecebidas.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Operadoras1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformOperadoras.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.Patrimonio1Click(Sender: TObject);
begin
     UseIn;
     Screen.Cursor := crHourGlass;
     with TformPatrimonio.Create(Self) do
      try
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
     UseOut;
end;

procedure TformPrincipal.dxBarButton1Click(Sender: TObject);
begin
   UseIn;
   natureza := '';
   Screen.Cursor := crHourGlass;
   with TformNatuoper.Create(Self) do
    try
      Caption := Self.Caption + ' -> ' + Caption;
      if (showmodal = mrOk) and (not qrySelecionar.IsEmpty) then
        natureza := qrySelecionar.fieldByName('CODIGO').AsString;
    finally
      release;
    end;
   UseOut;

   if natureza > '' then
     Venda1Click(Sender);

end;

procedure TformPrincipal.dxBarButton2Click(Sender: TObject);
begin
   UseIn;
   Screen.Cursor := crHourGlass;
   with TformContratos.Create(Self) do
    try
      Caption := Self.Caption + ' -> ' + Caption;
      showmodal;
    finally
      release;
    end;
   UseOut;
end;

procedure TformPrincipal.dxBarButton3Click(Sender: TObject);
begin
   UseIn;
   if dmoPrincipal.Update then
    begin
      auAutoUpgrader.RestartParams := ParamStr(1);
      auAutoUpgrader.CheckUpdate;
    end else
    begin
      Application.MessageBox(
        'As atualizações estão desabilitadas para seu sistema nesse ' +
        'momento. Se você entrou na Internet ou no sistema a poucos ' +
        'instantes, aguarde alguns segundos para que a consulta ' +
        'da capacidade de atualização seja feita e tente essa opção ' +
        'novamente.' + #13#10#13#10 +
        'Em caso de dúvidas, entre em contato com o Suporte Técnico.',
        'Atualizações indisponíveis',
        mb_Ok + mb_IconWarning);
    end;
   UseOut;
end;

procedure TformPrincipal.auAutoUpgraderNoUpdateAvailable(Sender: TObject);
begin
  auHTTPupd.POSTData :=
    'empresa=' + Caption + '&' +
    'data=' + FormatDateTime('DD.MM.YYYY HH:NN', now) + '&' +
    'sistema=ELITE ' +
       auAutoUpgrader.VersionNumber + '&' +
    'usuario=' + dmoPrincipal.GetLogUser + '&' +
    'resultado=Sem versão nova' + '&' +
    'maquina=' + dmoPrincipal.NomeComputador + '&' +
    'id=' + dmoPrincipal.cdsConfig.FieldByName('ID').AsString;
  auHTTPupd.Read;
end;

procedure TformPrincipal.auAutoUpgraderEndUpgrade(Sender: TObject);
begin
  auHTTPupd.POSTData :=
    'empresa=' + Caption + '&' +
    'data=' + FormatDateTime('DD.MM.YYYY HH:NN', now) + '&' +
    'sistema=ELITE ' + 
       auAutoUpgrader.VersionNumber + '&' +
    'usuario=' + dmoPrincipal.GetLogUser + '&' +
    'resultado=ATUALIZADO' + '&' +
    'maquina=' + dmoPrincipal.NomeComputador + '&' +
    'id=' + dmoPrincipal.cdsConfig.FieldByName('ID').AsString;
  auHTTPupd.Read;
end;

procedure TformPrincipal.auHTTPlogDone(Sender: TObject;
  const ContentType: String; FileSize: Integer; Stream: TStream);
var
  Str: string;
begin
  SetLength(Str, FileSize);
  Stream.Read(Str[1], FileSize); // or Move(Memory^, Str[1], Size);

  { atualizações }
  if length(Str) > 1 then
    dmoPrincipal.Update := (Str[2] = 'S');

  { alterações }  
  if (Str > '') and (Str[1] = 'N') then
   begin
     dmoPrincipal.Licenca := False;
     Application.MessageBox(
       'ATENÇÃO: ' + #13#10#13#10 +
       'O sistema está em modo de consulta. Nesse modo alguns recursos ' +
       'de cadastro, vendas e alterações poderão estar desativados. ' +
       'Mesmo assim, você será capaz de consultar todas as informações ' +
       'contidas no Banco de Dados.' + #13#10#13#10 +
       'Em caso de dúvidas, entre em contato com o Suporte Técnico.',
       'Modo de Consulta',
       mb_Ok + mb_IconWarning);
   end;
end;

procedure TformPrincipal.dxBarButton4Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   with TformBackup.Create(Self) do
    try
      Caption := Self.Caption + ' -> ' + Caption;
      showmodal;
    finally
      release;
    end;
end;

end.
