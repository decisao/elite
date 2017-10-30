unit clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet,
  IBStoredProc, DBCtrls, Mask,
  TB97Ctls, ExtDlgs, TimerLst, ToolEdit, RXDBCtrl, Mailit, IBUpdateSQL,
  IBDatabase, gridreport, ShellApi, Buttons, jpeg, DBClient, Provider,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner;

const
  CM_FORMSETUP = WM_USER + 1;

type
  TformClientes = class(TForm)
    pgcDados: TPageControl;
    tabVisual: TTabSheet;
    tabDetalhe: TTabSheet;
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    btnSalvar: TToolbarButton97;
    btnExcluir: TToolbarButton97;
    btnCancelar: TToolbarButton97;
    Panel1: TPanel;
    Dock971: TDock97;
    ToolWindow971: TToolWindow97;
    Label1: TLabel;
    Label2: TLabel;
    cmbOrdenar: TComboBox;
    edtPesquisar: TEdit;
    Dock973: TDock97;
    ToolWindow972: TToolWindow97;
    Label3: TLabel;
    Label4: TLabel;
    cmbSelecionar: TComboBox;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    PrinterMenu: TPopupMenu;
    qrySelecionar: TIBQuery;
    dscSelecionar: TDataSource;
    GridMenu: TPopupMenu;
    Ativarzebra1: TMenuItem;
    N1: TMenuItem;
    Cordalinha1: TMenuItem;
    Cordotexto1: TMenuItem;
    ColorDialog: TColorDialog;
    panDados: TPanel;
    qryDetalhes: TIBQuery;
    dsrDetalhes: TDataSource;
    dbnDetalhes: TDBNavigator;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dedNOME: TDBEdit;
    dbrPessoa: TDBRadioGroup;
    pgcDetalhes: TPageControl;
    tabPessoaFisica: TTabSheet;
    tabPessoaJuridica: TTabSheet;
    tabEndereco: TTabSheet;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    lblCIDADE: TLabel;
    DBEdit13: TDBEdit;
    lblESTADO: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    lblLOCALIZACAO: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit23: TDBEdit;
    Label29: TLabel;
    DBEdit24: TDBEdit;
    Label30: TLabel;
    DBEdit25: TDBEdit;
    Label31: TLabel;
    DBEdit26: TDBEdit;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    tabOutros: TTabSheet;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    DBMemo1: TDBMemo;
    Label35: TLabel;
    imagem: TDBImage;
    Label36: TLabel;
    DBEdit29: TDBEdit;
    Panel3: TPanel;
    lblWhere: TLabel;
    grdDados: Tzebdbgrid;
    FotoMenu: TPopupMenu;
    Colardareadetransferncia1: TMenuItem;
    Abrirdoarquivo1: TMenuItem;
    N2: TMenuItem;
    Apagar1: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    Label21: TLabel;
    DBEdit30: TDBEdit;
    edtSelecionar: TEdit;
    FormStorage: TFormStorage;
    DBCheckBox1: TDBCheckBox;
    Label47: TLabel;
    DBEdit37: TDBEdit;
    traSelecionar: TIBTransaction;
    DBCheckBox2: TDBCheckBox;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnHistorico: TToolbarButton97;
    btnArquivos: TToolbarButton97;
    btnMais: TToolbarButton97;
    btnEmail: TToolbarButton97;
    MenuMais: TPopupMenu;
    Histricofinanceiro1: TMenuItem;
    N3: TMenuItem;
    Compras1: TMenuItem;
    Vendas1: TMenuItem;
    IniciarVenda1: TMenuItem;
    AbrirOS1: TMenuItem;
    N4: TMenuItem;
    FazerOramento1: TMenuItem;
    Movimentos1: TMenuItem;
    tabSeguranca: TTabSheet;
    provSelecionar: TDataSetProvider;
    cdsSelecionar: TClientDataSet;
    Barra: TStatusBar;
    TabSheet3: TTabSheet;
    dbrTipo: TDBRadioGroup;
    provDetalhes: TDataSetProvider;
    cdsDetalhes: TClientDataSet;
    tabCredito: TTabSheet;
    Label37: TLabel;
    DBEdit31: TDBEdit;
    Label38: TLabel;
    dedLIMITECREDITO: TDBEdit;
    dbrTIPOBLOQUEIO: TDBRadioGroup;
    dbrTIPOIMPEDIMENTO: TDBRadioGroup;
    N5: TMenuItem;
    Equipamentos1: TMenuItem;
    Recebveis1: TMenuItem;
    Grade1: TMenuItem;
    N6: TMenuItem;
    Todososclientes1: TMenuItem;
    DBCheckBox3: TDBCheckBox;
    cbOcultos: TCheckBox;
    cdsDetalhesCODIGO: TIntegerField;
    cdsDetalhesPESSOAFISICA: TStringField;
    cdsDetalhesRAZAOSOCIAL: TStringField;
    cdsDetalhesNOME: TStringField;
    cdsDetalhesDATANASC: TDateTimeField;
    cdsDetalhesNATURALIDADE: TStringField;
    cdsDetalhesSEXO: TStringField;
    cdsDetalhesESTADOCIVIL: TStringField;
    cdsDetalhesRG: TStringField;
    cdsDetalhesCPF: TStringField;
    cdsDetalhesCGC: TStringField;
    cdsDetalhesIE: TStringField;
    cdsDetalhesPAI: TStringField;
    cdsDetalhesMAE: TStringField;
    cdsDetalhesLOCALIZACAO: TIntegerField;
    cdsDetalhesNUMERO: TIntegerField;
    cdsDetalhesCOMPLEMENTO: TStringField;
    cdsDetalhesBAIRRO: TIntegerField;
    cdsDetalhesCIDADE: TIntegerField;
    cdsDetalhesESTADO: TStringField;
    cdsDetalhesFONE: TStringField;
    cdsDetalhesFAX: TStringField;
    cdsDetalhesEMAIL: TStringField;
    cdsDetalhesHOMEPAGE: TStringField;
    cdsDetalhesCELULAR: TStringField;
    cdsDetalhesDATACADAST: TDateTimeField;
    cdsDetalhesOBSERVACOES: TStringField;
    cdsDetalhesCONTATO: TStringField;
    cdsDetalhesDATAFUND: TDateTimeField;
    cdsDetalhesPROFISSAO: TStringField;
    cdsDetalhesEQUIPAMENTO: TStringField;
    cdsDetalhesFOTO: TBlobField;
    cdsDetalhesSALARIO: TBCDField;
    cdsDetalhesORGAOEXP: TStringField;
    cdsDetalhesSOUNDBYTES: TIntegerField;
    cdsDetalhesPROTESTO: TStringField;
    cdsDetalhesSPC: TStringField;
    cdsDetalhesSERASA: TStringField;
    cdsDetalhesIMOVEL: TStringField;
    cdsDetalhesPROTESTO_DATA: TDateTimeField;
    cdsDetalhesSPC_DATA: TDateTimeField;
    cdsDetalhesSERASA_DATA: TDateTimeField;
    cdsDetalhesPROTESTO_USER: TStringField;
    cdsDetalhesSPC_USER: TStringField;
    cdsDetalhesSERASA_USER: TStringField;
    cdsDetalhesCODEMPREEND: TIntegerField;
    cdsDetalhesPROCESSO_OK: TStringField;
    cdsDetalhesIMOVEL_TIPO: TStringField;
    cdsDetalhesFGTS: TStringField;
    cdsDetalhesPIS: TStringField;
    cdsDetalhesVALOR_FGTS: TBCDField;
    cdsDetalhesCONTRATO: TStringField;
    cdsDetalhesKMS: TIntegerField;
    cdsDetalhesCOMISSIONADO: TStringField;
    cdsDetalhesNOMEUSER: TStringField;
    cdsDetalhesDESCONTO: TBCDField;
    cdsDetalhesFINANCEIRO: TStringField;
    cdsDetalhesESTORNO: TStringField;
    cdsDetalhesCODEMPRESA: TIntegerField;
    cdsDetalhesTROCAVENDEDOR: TStringField;
    cdsDetalhesINTERNET: TStringField;
    cdsDetalhesMUDAEMPRESA: TStringField;
    cdsDetalhesCOMISSAO: TBCDField;
    cdsDetalhesTIPO: TStringField;
    cdsDetalhesCODFORNECEDOR: TIntegerField;
    cdsDetalhesCODTRANSPORTADOR: TIntegerField;
    cdsDetalhesCODASSOCIADO: TIntegerField;
    cdsDetalhesNOME_FAMILIA: TStringField;
    cdsDetalhesRECEBIMENTO: TStringField;
    cdsDetalhesCUSTO: TStringField;
    cdsDetalhesSEQUENCIAS: TStringField;
    cdsDetalhesRECALCULO: TStringField;
    cdsDetalhesCOMPRAS: TStringField;
    cdsDetalhesTRANSFERENCIA: TStringField;
    cdsDetalhesRELATORIOS: TStringField;
    cdsDetalhesLIMITECREDITO: TBCDField;
    cdsDetalhesTIPO_BLOQUEIO: TStringField;
    cdsDetalhesTIPO_IMPEDIMENTO: TStringField;
    cdsDetalhesOCULTO: TStringField;
    cdsDetalhesVENDADIRETA: TStringField;
    cdsDetalhesTECNICOLOGIN: TStringField;
    cdsDetalhesFECHAMENTO: TStringField;
    cdsDetalhesLOG_USUARIO: TStringField;
    cdsDetalhesLOG_TIPO: TStringField;
    cdsDetalhesLOG_MAQUINA: TStringField;
    cdsDetalhesLOG_DATAREMOTO: TDateTimeField;
    cdsDetalhesSENHAWEB: TStringField;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    Label20: TLabel;
    DBEdit38: TDBEdit;
    dbcFinanceiro: TDBCheckBox;
    dbcEstorno: TDBCheckBox;
    dbcVendedor: TDBCheckBox;
    dbcSequencia: TDBCheckBox;
    dbcRecalculo: TDBCheckBox;
    dbcCusto: TDBCheckBox;
    dbcRecebimento: TDBCheckBox;
    dbcCompras: TDBCheckBox;
    dbcTransferencia: TDBCheckBox;
    dbcRelatorios: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    dbcInternet: TDBCheckBox;
    Bevel2: TBevel;
    dbcMultiempresa: TDBCheckBox;
    Label50: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label48: TLabel;
    DBEdit39: TDBEdit;
    Label49: TLabel;
    DBEdit40: TDBEdit;
    DBEdit32: TDBEdit;
    Label39: TLabel;
    DBEdit33: TDBEdit;
    Label40: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    cdsDetalhesPERCCOMIS_PROD: TBCDField;
    cdsDetalhesPERCCOMIS_PECA: TBCDField;
    cdsDetalhesPERCCOMIS_SERV: TBCDField;
    cdsDetalhesPERCCOMIS_CALCULO: TStringField;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOrdenarChange(Sender: TObject);
    procedure cmbSelecionarChange(Sender: TObject);
    procedure btnImprimirMouseEnter(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure GridMenuPopup(Sender: TObject);
    procedure Ativarzebra1Click(Sender: TObject);
    procedure Cordalinha1Click(Sender: TObject);
    procedure Cordotexto1Click(Sender: TObject);
    procedure qrySelecionarAfterOpen(DataSet: TDataSet);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure dbrPessoaChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lblESTADOClick(Sender: TObject);
    procedure lblCIDADEClick(Sender: TObject);
    procedure lblLOCALIZACAOClick(Sender: TObject);
    procedure Abrirdoarquivo1Click(Sender: TObject);
    procedure Colardareadetransferncia1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure CheckCGC1Error(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure btnArquivosClick(Sender: TObject);
    procedure btnAreasClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure IniciarVenda1Click(Sender: TObject);
    procedure AbrirOS1Click(Sender: TObject);
    procedure FazerOramento1Click(Sender: TObject);
    procedure Movimentos1Click(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure Label50Click(Sender: TObject);
    procedure cdsSelecionarAfterOpen(DataSet: TDataSet);
    procedure cdsSelecionarAfterScroll(DataSet: TDataSet);
    procedure cdsDetalhesNewRecord(DataSet: TDataSet);
    procedure cdsDetalhesAfterOpen(DataSet: TDataSet);
    procedure cdsDetalhesAfterPost(DataSet: TDataSet);
    procedure cdsSelecionarAfterRefresh(DataSet: TDataSet);
    procedure cdsDetalhesAfterDelete(DataSet: TDataSet);
    procedure provDetalhesUpdateData(Sender: TObject;
      DataSet: TClientDataSet);
    procedure cdsDetalhesReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsDetalhesBeforePost(DataSet: TDataSet);
    procedure Equipamentos1Click(Sender: TObject);
    procedure Recebveis1Click(Sender: TObject);
    procedure Grade1Click(Sender: TObject);
    procedure cbOcultosClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    acao: TReconcileAction;
    { chamadas de rotina }
    procedure FormStart(var Message: TMessage); message CM_FORMSETUP;
    procedure fldESTADOmudar(Sender: TField);
    procedure fldCIDADEmudar(Sender: TField);
    procedure fldLOCALIDADEmudar(Sender: TField);
    procedure fldBAIRROmudar(Sender: TField);
    procedure fldCODEMPRESAmudar(Sender: TField);
    procedure qryDetalhesSEXOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryDetalhesESTADOCIVILGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  public
    { Public declarations }
    inCliente: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formClientes: TformClientes;

implementation

uses data_principal, relacclientes, estados, cidades, localidades, newlocal,
  areas_cli, cli_files, venda_direta, os, orcamento, clientehistorico,
  sisconfig, reconcile, cli_equip, confirmasenha, contareceber;

type
  TCampoStr = string[30];
  TCampoDes = record
     rotulo, fisico: TCampoStr;
     iTab: byte;
  end;

const

{######################################################################
 #                                                                    #
 #   O CODIGO ABAIXO É O ÚNICO QUE PRECISA SER MODIFICADO!!!          #
 #                                                                    #
 #   Lembre-se, porém, do seguinte CHECKLIST:                         #
 #   1 - Modificar os parâmetros abaixo conforme a tabela usada       #
 #   2 - ...                                                          #
 #                                                                    #
 ######################################################################}

  { tabelas usadas }
  tblCount  = 2;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'CLIENTES',
       'CIDADES' );

  { entrada no registro do Windows }
  NomeCurto = 'clientes';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 12;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'      ; fisico: 'CODIGO'     ; iTab: 1; ),
       (rotulo: 'Tipo'        ; fisico: 'TIPO'       ; iTab: 1; ),
       (rotulo: 'Nome'        ; fisico: 'NOME'       ; iTab: 1; ),
       (rotulo: 'email'       ; fisico: 'EMAIL'      ; iTab: 1; ),
       (rotulo: 'Telefone'    ; fisico: 'FONE'       ; iTab: 1; ),
       (rotulo: 'Celular'     ; fisico: 'CELULAR'    ; iTab: 1; ),
       (rotulo: 'Razão Social'; fisico: 'RAZAOSOCIAL'; iTab: 1; ),
       (rotulo: 'RG'          ; fisico: 'RG'         ; iTab: 1; ),
       (rotulo: 'CPF'         ; fisico: 'CPF'        ; iTab: 1; ),
       (rotulo: 'CNPJ'        ; fisico: 'CGC'        ; iTab: 1; ),
       (rotulo: 'Cidade'      ; fisico: 'Cidade'     ; iTab: 2; ),
       (rotulo: 'Usuário'     ; fisico: 'NOMEUSER'   ; iTab: 1; ));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = 'CIDADES.CODIGO = CLIENTES.CIDADE AND CIDADES.ESTADO = CLIENTES.ESTADO';

  { indexes iniciais padrao para os combos }
  ixDefSel = 3;
  ixDefOrd = 3;

{######################################################################
 #                                                                    #
 #                 FINAL DO CÓDIGO CUSTOMIZÁVEL                       #
 #                                                                    #
 ######################################################################}

  { uso interno das rotinas }
  tmpSQLSel : string = '';
  tmpSQLOrd : string = '';

 var
  busca_local: byte;
  novo_registro: boolean;

{$R *.DFM}

function FldQName(i: byte): string;
begin
  result := ixTabelas[ixCampos[i].iTab] + '.' + ixCampos[i].fisico;
end;

procedure TformClientes.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformClientes.FormStart(var message: TMessage);
var
  i: byte;
  tecla: Char;
begin
     tecla := #13;

     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

     { se existirem itens no Menu de Impressão, ligo o botão }
     if PrinterMenu.Items.Count > 0 then
       btnImprimir.DropDownMenu := PrinterMenu;

     { carrego os combos com as opções }
     cmbSelecionar.Clear;
     cmbOrdenar.Clear;
     for i := 1 to ixMaximo do
      begin
         cmbOrdenar.Items.Add(ixCampos[i].rotulo);
         cmbSelecionar.Items.Add(ixCampos[i].rotulo);
      end;
     cmbOrdenar.ItemIndex := pred(ixDefOrd);
     cmbSelecionar.ItemIndex := pred(ixDefSel);

     { desativo os botões - nenhuma seleção inicial }
     btnAdicionar.Enabled := True;
     btnModificar.Enabled := False;
     btnImprimir.Enabled  := False;

     { desativo a ordenação e pesquisa }
     cmbOrdenar.Enabled := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { forço atualização }
     cmbSelecionarChange(nil);

     { verifico se existe JumpStart }
     if inCliente > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.text := IntToStr(inCliente);
       edtSelecionarKeyPress(nil, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Text := '';
       btnModificarClick(nil);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformClientes.btnAdicionarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Adicionar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := False;

     { código de adição vai aqui }
     qryDetalhes.ParamByName('CODIGO').Clear;
     with cdsDetalhes do
      begin
       Open;
       dbnDetalhes.BtnClick(nbInsert);
      end;

//     dbrTipo.Enabled         := (dmoPrincipal.GetLogUser = 'SYSDBA');
     tabSeguranca.TabVisible := (dmoPrincipal.GetLogUser = 'SYSDBA');

     dedLIMITECREDITO.Enabled   := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';
     dbrTIPOIMPEDIMENTO.Enabled := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';
     dbrTIPOBLOQUEIO.Enabled    := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';

     { mostro a página do endereço }
     with pgcDetalhes do
       ActivePage := Pages[0];

     novo_registro := true;
     if dedNOME.Canfocus then dedNOME.Setfocus;
     Screen.Cursor := crDefault;
end;

procedure TformClientes.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FORMSETUP, 0, 0);
end;

procedure TformClientes.FormCreate(Sender: TObject);
var
  inI: integer;
begin
     { configuração das transações }
//     for inI := 0 to Pred(ComponentCount) do
//      if (Components[inI] is TIBTransaction) then
//       begin
//        dmoPrincipal.config_transacao(Components[inI] as TIBTransaction);
//        ShowMessage((Components[inI] as TIBTransaction).TPB);
//       end;
       
     { inicializo o JumpStart }
     inCliente := 0;

     { crio o módulo de dados do relacionamento }
     dmoRelacClientes := TdmoRelacClientes.Create(Self);

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';
end;

procedure TformClientes.edtSelecionarKeyPress(Sender: TObject;
  var Key: Char);
var
  i, sel: byte;
  StrSQL: string;
begin
     if (cmbSelecionar.ItemIndex = 0) and (not (Key in ['0'..'9', #8, #13])) then
       Key := chr(0);

     { se foi apertado enter }
     if (key = #13) and (edtSelecionar.Text > '') then
      begin

       Screen.Cursor := crHourGlass;
       sel := succ(cmbSelecionar.ItemIndex);
       with qrySelecionar do
        begin

         { cláusula SELECT }
         StrSQL := 'SELECT ';
         for i := 1 to ixMaximo do
          begin
           StrSQL := StrSQL + ixTabelas[ixCampos[i].iTab] + '.' +
             ixCampos[i].fisico;
           if i < ixMaximo then StrSQL := StrSQL + ', '
             else StrSQL := StrSQL + ' ';
          end;

         { cláusula FROM }
         StrSQL := StrSQL + 'FROM ';
         for i := 1 to tblCount do
          begin
           StrSQL := StrSQL + ixTabelas[i];
           if i < tblCount then StrSQL := StrSQL + ', '
             else StrSQL := StrSQL + ' ';
          end;

         { cláusula WHERE }
         { ATENÇÃO: ESSA ROTINA FOI MODIFICADA PARA FUNCIONAR
           EXPRESSAO+ E CAMPO NOME (sel=1) USANDO SOUNDBYTES  }
         if (Pos('+', edtSelecionar.Text) > 0) and (sel = 2) then
          StrSQL := StrSQL + ' WHERE (SOUNDBYTES = ' +
            IntToStr(dmoPrincipal.SoundBts(PChar(edtSelecionar.Text))) +
            ')' else
          begin
            { ROTINA COMUM }
            StrSQL := StrSQL + ' WHERE (' +
              ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
            if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
                dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
              else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';
          end;

         if not cbOcultos.Checked then
           StrSQL := StrSQL + ' AND (CLIENTES.OCULTO = ''N'')';

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')';

         { salvo antes do ORDER BY }
         tmpSQLSel := StrSQL;

         { cláusula ORDER BY }
         tmpSQLOrd := ' ORDER BY ' +
            ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
            ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;

         SQL.Clear;
         SQL.Add(tmpSQLSel + tmpSQLOrd);
         open;

         with cdsSelecionar do
          begin
           if active then close;
           open;
          end;

         if not cdsSelecionar.IsEmpty then
          begin
           btnAdicionar.Enabled := True;
           btnModificar.Enabled := True;
           btnImprimir.Enabled  := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled   := True;
           grdDados.Visible     := True;
          end else btnAdicionar.Enabled := True;
        end;

       if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
       Screen.Cursor := crDefault;

      end;
end;

procedure TformClientes.cmbOrdenarChange(Sender: TObject);
begin
     edtPesquisar.Clear;
     cdsSelecionar.IndexFieldNames :=
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;
     if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
end;

procedure TformClientes.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformClientes.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformClientes.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
    cdsSelecionar.Locate(
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text,
       [loPartialKey]);

end;

procedure TformClientes.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformClientes.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformClientes.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformClientes.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformClientes.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
//     qrySelecionar.tag := 0;
//     { preencho os nomes reais dos campos }
//     for i := 1 to ixMaximo do
//        qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
//          ixCampos[i].rotulo;
//
//     { apago a quarta coluna @!! método mágico! }
//     grdDados.Columns[1].Alignment  := taCenter;
//     grdDados.Columns[1].Font.Style := [fsBold, fsItalic];
//     grdDados.Columns[3].Width      := 0;
end;

procedure TformClientes.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformClientes.btnExcluirClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbDelete);
     cdsDetalhes.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformClientes.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     { cancelo o registro }
     if cdsDetalhes.State = dsInsert then
       dmoPrincipal.CancelarSequencia(ixTabelas[1],
         cdsDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     cdsDetalhes.Close;

     if novo_registro then
       novo_registro := false;

     Screen.Cursor := crDefault;
end;

procedure TformClientes.btnModificarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Modificar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := True;

     { código de edição vai aqui }
     qryDetalhes.paramByName('CODIGO').AsInteger :=
       cdsSelecionar.fieldByName('CODIGO').AsInteger;
     with cdsDetalhes do
       Open;

     dbnDetalhes.BtnClick(nbEdit);

//     dbrTipo.Enabled         := FALSE;
     tabSeguranca.TabVisible := ((dmoPrincipal.GetLogUser = 'SYSDBA') and
       (cdsDetalhes.fieldByName('TIPO').AsString = 'A'));

     dedLIMITECREDITO.Enabled   := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';
     dbrTIPOIMPEDIMENTO.Enabled := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';
     dbrTIPOBLOQUEIO.Enabled    := dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S';

     { mostro a página do endereço }
     with pgcDetalhes do
       ActivePage := Pages[2];

     Screen.Cursor := crDefault;
end;

procedure TformClientes.dbrPessoaChange(Sender: TObject);
begin
     case dbrPessoa.ItemIndex of
      0: begin
          tabPessoaFisica.TabVisible := True;
          tabPessoaJuridica.TabVisible := False;
          pgcDetalhes.ActivePage := tabPessoaFisica;
         end;
      1: begin
          tabPessoaJuridica.TabVisible := True;
          tabPessoaFisica.TabVisible := False;
          pgcDetalhes.ActivePage := tabPessoaJuridica;
         end;
      end;
end;

procedure TformClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not cdsDetalhes.Active;
end;

procedure TformClientes.fldESTADOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     qryEstado.ParamByName('SIGLA').AsString := Sender.AsString;
     with cdsEstado do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.fldCODEMPRESAmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     qryEmpresa.ParamByName('CODEMPRESA').AsInteger := Sender.AsInteger;
     with cdsEstado do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.fldCIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryCidades do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsCidades do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.fldLOCALIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryLocalidades do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('CIDADE').AsInteger :=
          cdsDetalhes.fieldByName('CIDADE').AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsLocalidades do
       if not active then open else refresh;
     if cdsDetalhes.State in [dsInsert, dsEdit] then
       cdsDetalhes.fieldByName('BAIRRO').AsInteger :=
         cdsLocalidades.fieldByName('BAIRRO').AsInteger;
    end;
end;

procedure TformClientes.fldBAIRROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacClientes do
    begin
     with qryBairros do
      begin
       ParamByName('CODIGO').AsInteger := Sender.AsInteger;
       ParamByName('CIDADE').AsInteger :=
          cdsDetalhes.fieldByName('CIDADE').AsInteger;
       ParamByName('ESTADO').AsString :=
          cdsDetalhes.fieldByName('ESTADO').AsString;
      end;
     with cdsBairros do
       if not active then open else refresh;
    end;
end;

procedure TformClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
       if cdsDetalhes.Active then btnCancelarClick(Sender) else
        begin
         Self.ModalResult := mrCancel;
        end;

     if not cdsDetalhes.Active then
      begin
       case key of
        vk_F2: btnAdicionarClick(Sender);
        vk_F3: btnModificarClick(Sender);
       end;
      end else
      begin
       case key of
        vk_f2: begin
                if busca_local > 0 then
                 with TformNovaLocalidade.Create(Self) do
                  try
                   inCidade := cdsDetalhes.fieldByName('CIDADE').AsInteger;
                   stEstado := cdsDetalhes.fieldByName('ESTADO').AsString;
                   stCidade := dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString;
                   inLocal  := 0;
                   ShowModal;
                   if inLocal > 0 then cdsDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
                  finally
                   release;
                  end;
               end;
        vk_F9: btnSalvarClick(Sender);
       end;
      end;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if (key = vk_Return) and (atag < 3) then
      if shift = [] then Perform(wm_NextDlgCtl, 0, 0) else
       if shift = [ssShift] then Perform(wm_NextDlgCtl, 0, 0);

     if not odd(atag) then
      begin
       case key of
        vk_Down: Perform(wm_NextDlgCtl, 0, 0);
        vk_Up: Perform(wm_NextDlgCtl, 1, 0);
       end;
       if (atag = 2) and (key = vk_return) then key := 34;
      end;

     if key = 34 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, True, True);
     if key = 33 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, False, True);

     if qryDetalhes.Active and (Shift = [ssCtrl]) then
      case Key of
       69: lblESTADOClick(Sender);
       67: lblCIDADEClick(Sender);
       76: lblLOCALIZACAOClick(Sender);
      end;
end;

procedure TformClientes.edtPesquisarEnter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clInfoBK;
       TDBEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clInfoBK;
       TDBMemo(Sender).Font.Style := [fsBold];
      end;
end;

procedure TformClientes.edtPesquisarExit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.btnSalvarClick(Sender: TObject);
const
  myEnter: Char = #13;
begin
     { confirmacao de senha }
     if dmoPrincipal.cdsConfig.fieldByName('SENHA_CLIENTES').AsString = 'S' then
      try
        formConfirmaSenha := TformConfirmaSenha.Create(self);
        with formConfirmaSenha do
         if not(showmodal = mrOk) then
           exit;
      finally
        formConfirmaSenha.release;
      end;

     Screen.Cursor := crHourGlass;
     { salvo o registro }
     cdsDetalhes.Post;
     if acao in [raSkip, raAbort] then
      begin
       cdsDetalhes.edit;
       Screen.Cursor := crDefault;
       exit;
      end;


     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { verifico se é necessario ativar o grid }
     if (not grdDados.Visible) or novo_registro then
      begin
       novo_registro := false;
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := cdsDetalhes.fieldByName(ixCampos[1].fisico).asstring;
       edtSelecionarKeyPress(Sender, myEnter);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Clear;
      end;

     with dmoRelacClientes do
      begin
       cdsEstado.Close;
       cdsCidades.Close;
       cdsLocalidades.Close;
      end;

     cdsDetalhes.Close;
     cdsSelecionar.Refresh;
     
     Screen.Cursor := crDefault;

end;

procedure TformClientes.lblESTADOClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformEstados.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.cdsDetalhes.fieldByName('ESTADO').AsString :=
           qrySelecionar.fieldByName('SIGLA').AsString;
      finally
       release;
      end;
end;

procedure TformClientes.lblCIDADEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformCidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'')',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString]),
         Format('Cidades no estado "%s"',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.cdsDetalhes.fieldByName('CIDADE').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
      finally
       release;
      end;
end;

procedure TformClientes.lblLOCALIZACAOClick(Sender: TObject);
var
  nova: boolean;
begin
     Screen.Cursor := crHourGlass;
     inc(busca_local);
     nova := false;
     with TformLocalidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'') AND ' +
         '(CIDADE = %d)',
         [Self.cdsDetalhes.fieldByName('ESTADO').AsString,
          Self.cdsDetalhes.fieldByName('CIDADE').AsInteger]),
         Format('Localidades para %s - %s',
         [Trim(dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString),
          Self.cdsDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.cdsDetalhes.fieldByName('LOCALIZACAO').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
         nova := not (qrySelecionar.fieldByName('CODIGO').AsString > '');
        end;
      finally
       release;
      end;

     if nova then
       with TformNovaLocalidade.Create(Self) do
        try
         inCidade := cdsDetalhes.fieldByName('CIDADE').AsInteger;
         stEstado := cdsDetalhes.fieldByName('ESTADO').AsString;
         stCidade := dmoRelacClientes.cdsCidades.fieldByName('CIDADE').AsString;
         inLocal  := 0;
         ShowModal;
         if inLocal > 0 then cdsDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
        finally
         release;
        end;

end;

procedure TformClientes.Abrirdoarquivo1Click(Sender: TObject);
begin
  if assigned(imagem.DataSource) then
    with OpenPictureDialog do
     if Execute then
       imagem.Picture.LoadFromFile(FileName);
end;

procedure TformClientes.Colardareadetransferncia1Click(Sender: TObject);
begin
  if assigned(imagem.DataSource) then
    imagem.PasteFromClipboard;
end;

procedure TformClientes.Apagar1Click(Sender: TObject);
begin
  if assigned(imagem.DataSource) then
    imagem.CutToClipboard;
end;




procedure TformClientes.CheckCGC1Error(Sender: TObject);
begin
     ShowMessage('O CNPJ digitado não é um CNPJ válido.');
end;

procedure TformClientes.DBEdit6Exit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.DBEdit17Enter(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clInfoBK;
       TEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clInfoBK;
       TDBEdit(Sender).Font.Style := [fsBold];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clInfoBK;
       TDBMemo(Sender).Font.Style := [fsBold];
      end;

     { AutoStart }
     if cdsDetalhes.fieldByName('LOCALIZACAO').AsString = '' then
       lblLOCALIZACAOClick(Sender);
end;

procedure TformClientes.DBEdit17Exit(Sender: TObject);
begin
     if Sender is TEdit then
      begin
       TEdit(Sender).Color := clWindow;
       TEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBEdit then
      begin
       TDBEdit(Sender).Color := clWindow;
       TDBEdit(Sender).Font.Style := [];
      end;
     if Sender is TDBMemo then
      begin
       TDBMemo(Sender).Color := clWindow;
       TDBMemo(Sender).Font.Style := [];
      end;
end;

procedure TformClientes.grdDadosDblClick(Sender: TObject);
var
  scap: string;
begin
  scap := Caption;
  if Pos('->', scap) > 0 then
   begin
    scap := copy(scap, Pos('->', scap) + 2, length(scap) - Pos('->', scap) - 1);
    if Pos('->', scap) > 0 then
      ModalResult := mrOk;
   end;
end;

procedure TformClientes.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
//   if not Dataset.fieldByName('EMAIL').IsNull then
//    begin
//      btnEmail.Hint      := Trim(Dataset.fieldByName('EMAIL').AsString);
//      btnEmail.Visible   := True;
//    end else
//    begin
//      btnEmail.Hint      := '';
//      btnEmail.Visible   := False;
//    end;
end;

procedure TformClientes.qryDetalhesSEXOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
end;

procedure TformClientes.qryDetalhesESTADOCIVILGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
end;

procedure TformClientes.FormDestroy(Sender: TObject);
var
  inI: integer;
begin
     qrySelecionar.Unprepare;
     qryDetalhes.Unprepare;
     dmoRelacClientes.free;

     { configuração das transações }
     for inI := 0 to Pred(ComponentCount) do
      if (Components[inI] is TIBTransaction) then
        if (Components[inI] as TIBTransaction).InTransaction then
          ShowMessage(Format('%s esta aberto!', [(Components[inI] as TIBTransaction).name]));
end;

procedure TformClientes.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformClientes.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformClientes.btnArquivosClick(Sender: TObject);
begin

   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformCli_files.Create(Self) do
      try
       inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODCLIENTE = %d)',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Arquivos de %d - %s',
          [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger,
          Self.cdsSelecionar.fieldByName('NOME').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformClientes.btnAreasClick(Sender: TObject);
begin
   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformAreasCli.Create(Self) do
      try
       inCli := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODCLI = %d)',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Áreas para %d - %s',
          [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger,
          Self.cdsSelecionar.fieldByName('NOME').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformClientes.btnEmailClick(Sender: TObject);
var
  x: string;
begin
  x := 'mailto:'+(Sender as TToolbarButton97).Hint+'?Subject=&cc=&bcc=';
  ShellExecute(0, nil, PChar(x), nil, nil, SW_SHOWDEFAULT);
end;

procedure TformClientes.IniciarVenda1Click(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 with TformVendaDireta.Create(Self) do
  try
    inOS := 0;
    inCliente := cdsSelecionar.fieldByName('CODIGO').AsInteger;
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
  end;
end;

procedure TformClientes.AbrirOS1Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformOS.Create(Self) do
      try
        OrcamentoOS := False;
        codOrcamento := 0;
        inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
end;

procedure TformClientes.FazerOramento1Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformOrcamento.Create(Self) do
      try
        inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
end;

procedure TformClientes.Movimentos1Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformOS.Create(Self) do
      try
        OrcamentoOS := False;
        codOrcamento := 0;
        inNome := trim(Self.cdsSelecionar.fieldByName('NOME').AsString);
        Caption := Self.Caption + ' -> ' + Caption;
        showmodal;
      finally
        release;
      end;
end;

procedure TformClientes.btnHistoricoClick(Sender: TObject);
begin
   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformClienteHistorico.Create(Self) do
      try
       inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformClientes.Label50Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformSisConfig.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.cdsDetalhes.fieldByName('CODEMPRESA').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
        end;
      finally
       release;
      end;
     Screen.Cursor := crDefault;
end;

procedure TformClientes.cdsSelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin

  { trato o resultado das tabelas e exibo }
  with qrySelecionar do
   begin
    if cdsSelecionar.RecordCount > 1 then
       Barra.SimpleText := Format('Exibindo %d registros', [cdsSelecionar.RecordCount])
    else if cdsSelecionar.RecordCount = 1 then
       Barra.SimpleText := 'Exibindo 1 registro'
    else Barra.SimpleText := 'Nenhum registro encontrado.';
    if active then
     begin
      close;
      Barra.SimpleText := Barra.SimpleText +
        ' - os excedentes foram ignorados!';
     end;
   end;

   { preencho os nomes reais dos campos }
   for i := 1 to ixMaximo do
     cdsSelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
       ixCampos[i].rotulo;

   { apago a quarta coluna @!! método mágico! }
   grdDados.Columns[1].Alignment  := taCenter;
   grdDados.Columns[1].Font.Style := [fsBold, fsItalic];
   grdDados.Columns[3].Width      := 0;

end;

procedure TformClientes.cdsSelecionarAfterScroll(DataSet: TDataSet);
begin
  if not Dataset.fieldByName('EMAIL').IsNull then
   begin
    btnEmail.Hint      := Trim(Dataset.fieldByName('EMAIL').AsString);
    btnEmail.Visible   := True;
   end else
   begin
    btnEmail.Hint      := '';
    btnEmail.Visible   := False;
   end;
end;

procedure TformClientes.cdsDetalhesNewRecord(DataSet: TDataSet);
begin

  with Dataset do
   begin
    fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    { valores iniciais }
    fieldByName('DATACADAST').AsDateTime :=
      dmoPrincipal.GetServerTime;
    fieldByName('PESSOAFISICA').AsString := 'F';
    fieldByName('CONTRATO').AsString := 'N';
    fieldByName('COMISSIONADO').AsString := 'S';
    fieldByName('FGTS').AsString := 'N';
    fieldByName('VALOR_FGTS').AsCurrency := 0.0;
    fieldByName('KMS').AsInteger := 0;
    fieldByName('SOUNDBYTES').AsInteger := 0;

    fieldByName('SPC').AsString         := 'N';
    fieldByName('SERASA').AsString      := 'N';
    fieldByName('PROTESTO').AsString    := 'N';
    fieldByName('PROCESSO_OK').AsString := 'N';
    fieldByName('IMOVEL').AsString      := 'N';

    fieldByName('ESTADO').AsString :=
       dmoPrincipal.cdsCliente.fieldBYName('ESTADO').AsString;
    fieldByName('CIDADE').AsInteger :=
       dmoPrincipal.cdsCliente.fieldBYName('CODCIDADE').AsInteger;
    fieldByName('SALARIO').AsCurrency := 0.0;

    fieldByName('NOMEUSER').AsString := 'CLI' + IntToStr(
       fieldByName('CODIGO').AsInteger);
    fieldByName('DESCONTO').AsCurrency := 0.0;
    fieldByName('COMISSAO').AsCurrency := 0.0;
    fieldByName('CODEMPRESA').AsInteger := dmoPrincipal.empresa;
    fieldByName('TIPO').AsString := 'C';

    fieldByName('FINANCEIRO').AsString    := 'N';
    fieldByName('ESTORNO').AsString       := 'N';
    fieldByName('TROCAVENDEDOR').AsString := 'N';
    fieldByName('INTERNET').AsString      := 'N';
    fieldByName('MUDAEMPRESA').AsString   := 'N';
    fieldByName('VENDADIRETA').AsString   := 'N';
    fieldByName('TECNICOLOGIN').AsString  := 'N';
    fieldByName('FECHAMENTO').AsString    := 'N';

    fieldByName('LIMITECREDITO').AsCurrency  := 1000;
    fieldByName('TIPO_BLOQUEIO').AsString    := 'A';
    fieldByName('TIPO_IMPEDIMENTO').AsString := 'N';

    fieldByName('PERCCOMIS_PROD').AsCurrency := 0.0;
    fieldByName('PERCCOMIS_PECA').AsCurrency := 0.0;
    fieldByName('PERCCOMIS_SERV').AsCurrency := 0.0;
    fieldByName('PERCCOMIS_CALCULO').AsString := 'F';
   end;

end;

procedure TformClientes.cdsDetalhesAfterOpen(DataSet: TDataSet);
begin

     { mascaras }
     with Dataset do
      begin
       fieldByName('DATANASC').EditMask := '99/99/9999';
       fieldByName('DATAFUND').EditMask := '99/99/9999';
       fieldByName('CPF').EditMask := '999.999.999-99';
       fieldByName('IE').EditMask := 'aaa.aaa.999.9999';
       fieldByName('CGC').EditMask := '99.999.999/9999-99';
       fieldByName('DATACADAST').EditMask := '99/99/9999';
       fieldByName('FONE').EditMask := '(99)c999-9999';
       fieldByName('FAX').EditMask := '(99)c999-9999';
       fieldByName('CELULAR').EditMask := '(99)c999-9999';
       fieldByName('RG').EditMask := '999999999999999';
       fieldByName('PIS').EditMask := '999999999999';
       (fieldByName('SALARIO') as TBCDField).Currency := True;
       (fieldByName('LIMITECREDITO') as TBCDField).Currency := True;
       (fieldByName('VALOR_FGTS') as TBCDField).Currency := True;
       fieldByName('ORGAOEXP').EditMask := 'CCC/CC';

       (fieldByName('DESCONTO') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('DESCONTO') as TNumericField).EditFormat := '##0.00';

       (fieldByName('COMISSAO') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('COMISSAO') as TNumericField).EditFormat := '##0.00';

       (fieldByName('PERCCOMIS_PROD') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('PERCCOMIS_PROD') as TNumericField).EditFormat := '##0.00';
       (fieldByName('PERCCOMIS_PECA') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('PERCCOMIS_PECA') as TNumericField).EditFormat := '##0.00';
       (fieldByName('PERCCOMIS_SERV') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('PERCCOMIS_SERV') as TNumericField).EditFormat := '##0.00';

       { rotinas de chamada }
       fieldByName('ESTADO').OnChange       := fldESTADOmudar;
       fieldByName('CIDADE').OnChange       := fldCIDADEmudar;
       fieldByName('LOCALIZACAO').OnChange  := fldLOCALIDADEmudar;
       fieldByName('BAIRRO').OnChange       := fldBAIRROmudar;
       fieldByName('SEXO').OnGetText        := qryDetalhesSEXOGetText;
       fieldByName('ESTADOCIVIL').OnGetText := qryDetalhesESTADOCIVILGetText;
       fieldByName('CODEMPRESA').OnChange   := fldCODEMPRESAmudar;

       { forço a primeira chamada }
       fldESTADOmudar(fieldByName('ESTADO'));
       fldCIDADEmudar(fieldByName('CIDADE'));
       fldLOCALIDADEmudar(fieldByName('LOCALIZACAO'));
       fldBAIRROmudar(fieldByName('BAIRRO'));
       fldCODEMPRESAmudar(fieldByName('CODEMPRESA'));

      end;

     busca_local := 0;

     { foto - compatibilidade com o Reloaded }
     try
       imagem.DataSource := dsrDetalhes;
     except
       on exception do
        begin
          imagem.DataSource := nil;
          Screen.Cursor := crDefault;
        end;
     end;

end;

procedure TformClientes.cdsDetalhesAfterPost(DataSet: TDataSet);
begin
  with (Dataset as TClientDataset) do
   if ChangeCount > 0 then
    begin
     ApplyUpdates(1);
     if not novo_registro then cdsSelecionar.refresh;
    end;
end;

procedure TformClientes.cdsSelecionarAfterRefresh(DataSet: TDataSet);
begin
  with qrySelecionar do
   begin
    if cdsSelecionar.RecordCount > 1 then
       Barra.SimpleText := Format('Exibindo %d registros', [cdsSelecionar.RecordCount])
    else if cdsSelecionar.RecordCount = 1 then
       Barra.SimpleText := 'Exibindo 1 registro'
    else Barra.SimpleText := 'Nenhum registro encontrado.';
    if active then
     begin
      close;
      Barra.SimpleText := Barra.SimpleText +
        ' - os excedentes foram ignorados!';
     end;
   end;
end;

procedure TformClientes.cdsDetalhesAfterDelete(DataSet: TDataSet);
begin
  with (dataset as TClientDataset) do
    ApplyUpdates(1);
end;

procedure TformClientes.provDetalhesUpdateData(Sender: TObject;
  DataSet: TClientDataSet);
begin
  with Dataset.fieldByName('CODIGO') do
    ProviderFlags := ProviderFlags + [pfInWhere, pfInKey]; 
end;

procedure TformClientes.cdsDetalhesReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  acao := Action;
end;

procedure TformClientes.cdsDetalhesBeforePost(DataSet: TDataSet);
begin
  acao := raCorrect;

  with Dataset do
   begin
     fieldByName('LOG_USUARIO').AsString        := dmoPrincipal.GetLogUser;
     fieldByName('LOG_TIPO').AsString           := 'x';
     fieldByName('LOG_MAQUINA').AsString        := dmoPrincipal.NomeComputador;
     fieldByName('LOG_DATAREMOTO').AsDateTime   := now;
   end;

end;

procedure TformClientes.Equipamentos1Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   with TformCli_equip.Create(Self) do
    try
      inCliente := Self.cdsSelecionar.fieldByName('CODIGO').AsInteger;
      SetWhereDynamic(Format('(CLI_EQUIP.CODCLIENTE = %d)',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Equip. Cliente %d - %s',
          [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger,
          Self.cdsSelecionar.fieldByName('NOME').AsString]));
      Caption := Self.Caption + ' -> ' + Caption;
      showmodal;
    finally
      release;
    end;
end;

procedure TformClientes.Recebveis1Click(Sender: TObject);
begin
   if cdsSelecionar.Active then
    if not cdsSelecionar.IsEmpty then
     with TformContaReceber.Create(Self) do
      try
       SetWhereDynamic(Format('PAGAMENTOS.CODCLIENTE = %d',
        [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger]),
        Format('A Receber de %d - %s',
          [Self.cdsSelecionar.fieldByName('CODIGO').AsInteger,
          Self.cdsSelecionar.fieldByName('NOME').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;
end;

procedure TformClientes.Grade1Click(Sender: TObject);
begin
   with TformGridReport.Create(Self) do
    try
      DBGrid1.DataSource := Self.dscSelecionar;
      titulo := Self.Caption;
      showmodal;
    finally
      release;
    end;
end;

procedure TformClientes.cbOcultosClick(Sender: TObject);
var
  tecla: char;
begin
  tecla := #13;
  edtSelecionarKeyPress(Sender, tecla);
end;

end.
