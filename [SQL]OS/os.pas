unit os;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, Buttons, ToolEdit, ZRPrntr, IBUpdateSQL, IBDatabase, gridreport,
  RXDBCtrl, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppDB, ppBands,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe;

const
  CM_FORMSETUP = WM_USER + 1;

type
  TformOS = class(TForm)
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
    dataini: TToolWindow97;
    Label3: TLabel;
    Label4: TLabel;
    cmbSelecionar: TComboBox;
    edtSelecionar: TEdit;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    formStorage: TFormStorage;
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
    updDetalhes: TIBUpdateSQL;
    dsrDetalhes: TDataSource;
    dbnDetalhes: TDBNavigator;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    lblCLIENTE: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Panel3: TPanel;
    grdDados: Tzebdbgrid;
    lblWhere: TLabel;
    pgcDetalhes: TPageControl;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    tbsProdutos: TTabSheet;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    qryCliente: TIBQuery;
    dsrCliente: TDataSource;
    qryDelete: TIBQuery;
    tbsOS: TTabSheet;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    updClientes: TIBUpdateSQL;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    qryVendedores: TIBQuery;
    dsrVendedores: TDataSource;
    qryProdutos: TIBQuery;
    dsrProdutos: TDataSource;
    PrintMenu: TPopupMenu;
    menuImpGrade: TMenuItem;
    N2: TMenuItem;
    menuImpOS: TMenuItem;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    Label26: TLabel;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label27: TLabel;
    DBEdit19: TDBEdit;
    Label28: TLabel;
    DBEdit20: TDBEdit;
    qryMarca: TIBQuery;
    dsrMarca: TDataSource;
    qryModelo: TIBQuery;
    dsrModelo: TDataSource;
    qryDefeito: TIBQuery;
    dsrDefeito: TDataSource;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label29: TLabel;
    DBEdit22: TDBEdit;
    DBMemo2: TDBMemo;
    Label30: TLabel;
    ckPrioridade: TCheckBox;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    qryServicos: TIBQuery;
    dsrServicos: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    zebdbgrid1: Tzebdbgrid;
    Panel9: TPanel;
    Label12: TLabel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel10: TPanel;
    Label31: TLabel;
    zebdbgrid2: Tzebdbgrid;
    spESTORNO: TIBStoredProc;
    qryUltimaOS: TIBQuery;
    DBEdit2: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    ckTudo: TCheckBox;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traESTORNO: TIBTransaction;
    traUltimaOS: TIBTransaction;
    traDelete: TIBTransaction;
    traCliente: TIBTransaction;
    traProdutos: TIBTransaction;
    traServicos: TIBTransaction;
    traVendedores: TIBTransaction;
    traMarca: TIBTransaction;
    traModelo: TIBTransaction;
    traDefeito: TIBTransaction;
    traEquipamento: TIBTransaction;
    qryEquipamento: TIBQuery;
    dsrEquipamento: TDataSource;
    lbEquipamento: TLabel;
    traOcorrencia: TIBTransaction;
    qryOcorrencia: TIBQuery;
    dsrOcorrencia: TDataSource;
    Label6: TLabel;
    btnVoltar: TToolbarButton97;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnReceber: TToolbarButton97;
    btnLancamentos: TToolbarButton97;
    traHistorico: TIBTransaction;
    qryHistorico: TIBQuery;
    DBEdit26: TDBEdit;
    lbTipoOS: TLabel;
    traTipoOS: TIBTransaction;
    qryTipoOS: TIBQuery;
    dsrTipoOS: TDataSource;
    TabSheet1: TTabSheet;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    Label34: TLabel;
    DBMemo3: TDBMemo;
    traTecnicos: TIBTransaction;
    qryTecnicos: TIBQuery;
    dsrTecnicos: TDataSource;
    TabSheet3: TTabSheet;
    zebdbgrid3: Tzebdbgrid;
    traVendedor: TIBTransaction;
    qryVendedor: TIBQuery;
    dsrVendedor: TDataSource;
    TabSheet4: TTabSheet;
    Label36: TLabel;
    DBEdit29: TDBEdit;
    Label37: TLabel;
    DBEdit30: TDBEdit;
    Label38: TLabel;
    DBEdit31: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label33: TLabel;
    DBEdit24: TDBEdit;
    Label35: TLabel;
    DBEdit25: TDBEdit;
    Label40: TLabel;
    DBEdit28: TDBEdit;
    OrdemdeServiomodelo21: TMenuItem;
    N3: TMenuItem;
    updSelecionar: TIBUpdateSQL;
    Panel6: TPanel;
    Label39: TLabel;
    DBEdit27: TDBEdit;
    Label41: TLabel;
    DBEdit32: TDBEdit;
    tabAutoriza: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    Label42: TLabel;
    DBEdit33: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit36: TDBEdit;
    Label46: TLabel;
    DBEdit37: TDBEdit;
    updTecnicos: TIBUpdateSQL;
    btnInicio: TButton;
    btnTermino: TButton;
    qryTecnicosCODMOVIMENTO: TIntegerField;
    qryTecnicosCODVENDEDOR: TIntegerField;
    qryTecnicosDATAINI: TDateTimeField;
    qryTecnicosDATAFIM: TDateTimeField;
    Label32: TLabel;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    Label47: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit1: TDBDateEdit;
    Panel8: TPanel;
    Label14: TLabel;
    Label20: TLabel;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    ckFechamento: TCheckBox;
    Panel11: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ckPrevisao: TCheckBox;
    Panel12: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    DateEdit2: TDateEdit;
    DateEdit1: TDateEdit;
    ckAbertura: TCheckBox;
    qryTecnicosPORCENTAGEM: TIBBCDField;
    Label52: TLabel;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    traParceiro: TIBTransaction;
    qryParceiro: TIBQuery;
    dsrParceiro: TDataSource;
    Label53: TLabel;
    DBEdit38: TDBEdit;
    traOSequip: TIBTransaction;
    qryOSequip: TIBQuery;
    dsrOSequip: TDataSource;
    traCarta: TIBTransaction;
    qryCarta: TIBQuery;
    qryCartaCODIGO: TIntegerField;
    qryCartaDATA: TDateTimeField;
    qryCartaNUMERADOR: TIntegerField;
    qryCartaSERVICOS: TIBStringField;
    qryCartaTECNICO: TIBStringField;
    dsrCarta: TDataSource;
    EmitirNotaFiscal1: TMenuItem;
    N4: TMenuItem;
    CartadeManuteno1: TMenuItem;
    ppDBPipeline: TppDBPipeline;
    ppReportCarta: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    qryTecnicosNOMEUSER: TIBStringField;
    pplbCliente: TppLabel;
    pplbequipamento: TppLabel;
    Label54: TLabel;
    DBComboBox2: TDBComboBox;
    traOperadora: TIBTransaction;
    qryOperadora: TIBQuery;
    dsrOperadora: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label55: TLabel;
    Button1: TButton;
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
    procedure qryDetalhesAfterInsert(DataSet: TDataSet);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure qryDetalhesAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lblCLIENTEClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure lbLancamentoClick(Sender: TObject);
    procedure Imprimiroramento1Click(Sender: TObject);
    procedure Salvarcomopadro1Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure menuImpGradeClick(Sender: TObject);
    procedure menuImpOSClick(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure qryProdutosAfterOpen(DataSet: TDataSet);
    procedure ckPrioridadeClick(Sender: TObject);
    procedure lbEquipamentoClick(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure grdDadosDblClick(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure DBEdit20Enter(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure lbTipoOSClick(Sender: TObject);
    procedure OrdemdeServiomodelo21Click(Sender: TObject);
    procedure EmitirNotaFiscal1Click(Sender: TObject);
    procedure qryTecnicosAfterPost(DataSet: TDataSet);
    procedure btnInicioClick(Sender: TObject);
    procedure btnTerminoClick(Sender: TObject);
    procedure Label52Click(Sender: TObject);
    procedure CartadeManuteno1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qryOperadoraAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure FormStart(var Message: TMessage); message CM_FORMSETUP;
    procedure fldCLIENTEmudar(Sender: TField);
    procedure fldDESCONTOmudar(Sender: TField);
    procedure fldCODMARCAmudar(Sender: TField);
    procedure fldCODMODELOmudar(Sender: TField);
    procedure fldCODDEFEITOmudar(Sender: TField);
    procedure fldCODPARCEIROmudar(Sender: TField);
    procedure fldOSTIPOmudar(Sender: TField);
    procedure fldCODVENDEDOR_ABREmudar(Sender: TField);
    procedure fldAUTORIZADOmudar(Sender: TField);
    procedure fldDATA_ENTREGAmudar(Sender: TField);
    procedure fldLOGISTICAAoExibir(Sender: TField;
       var Text: String; DisplayText: Boolean);
    procedure qryDetalhesLOCALIZACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  public
    { Public declarations }
    OSopen: boolean;
    OrcamentoOS: boolean;
    codOrcamento: longint;
    inCliente: longint;
    inNome: string;
    novo: boolean;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formOS: TformOS;

implementation

uses data_principal, clientes, itsorcamento, relosaberta, 
  venda_direta, os_texto, contareceber, os_nota, marcas, modelos, defeitos,
  imprimirosaberta, imprimirosfechada, equipamentos, ocorrencias,
  clientehistorico, ostipos, os_nota2, imprimirosaberta2, imprimirnota,
  confirmasenha;

type
  TCampoStr = string[30];
  TCampoDes = record
     rotulo, fisico: TCampoStr;
     iTab: byte;
  end;

const

{######################################################################
 #                                                                    #
 #   O CODIGO ABAIXO � O �NICO QUE PRECISA SER MODIFICADO!!!          #
 #                                                                    #
 #   Lembre-se, por�m, do seguinte CHECKLIST:                         #
 #   1 - Modificar os par�metros abaixo conforme a tabela usada       #
 #   2 - ...                                                          #
 #                                                                    #
 ######################################################################}

  { tabelas usadas }
  tblCount  = 4;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'MO',
       'CL1',
       'OS',
       'CL2'        );

  { entrada no registro do Windows }
  NomeCurto = 'os';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 14;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'C�digo'        ; fisico: 'CODIGO'           ; iTab: 1),
       (rotulo: 'Data'          ; fisico: 'DATA'             ; iTab: 1),
       (rotulo: 'P'             ; fisico: 'PRIORIDADE'       ; iTab: 1),
       (rotulo: 'F'             ; fisico: 'ECF'              ; iTab: 1),
       (rotulo: 'Prazo'         ; fisico: 'LOGISTICA'        ; iTab: 1),
       (rotulo: 'Status'        ; fisico: 'STATUS'           ; iTab: 1),
       (rotulo: 'Nota fiscal'   ; fisico: 'NOTA_NUMERO'      ; iTab: 1),
       (rotulo: 'Cliente'       ; fisico: 'NOME'             ; iTab: 2),
       (rotulo: 'Nro. S�rie'    ; fisico: 'SERIE'            ; iTab: 1),
       (rotulo: 'Total'         ; fisico: 'NOTA_VALOR_TOTAL' ; iTab: 1),
       (rotulo: 'em Aberto'     ; fisico: 'VALOR_ABERTO'     ; iTab: 1),
       (rotulo: 'Tipo'          ; fisico: 'TIPO'             ; iTab: 3),
       (rotulo: 'Parceiro'      ; fisico: 'NOME'             ; iTab: 4),
       (rotulo: 'E/S'           ; fisico: 'ES'               ; iTab: 1));

  { express�o adicional do where - n�o pode ser mudada em run-time }
  { para acrescentar par�mentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '';

  { indexes iniciais padrao para os combos }
  ixDefSel = 8;
  ixDefOrd = 2;

{######################################################################
 #                                                                    #
 #                 FINAL DO C�DIGO CUSTOMIZ�VEL                       #
 #                                                                    #
 ######################################################################}

  { uso interno das rotinas }
  tmpSQLSel : string = '';
  tmpSQLOrd : string = '';

{$R *.DFM}

function FldQName(i: byte): string;
begin
  result := ixTabelas[ixCampos[i].iTab] + '.' + ixCampos[i].fisico;
end;

procedure TformOS.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformOS.qryDetalhesLOCALIZACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
end;

procedure TformOS.FormStart(var Message: TMessage);
var
  i: byte;
  tecla: char;
begin
     { escondo a p�gina de detalhes }
     tabDetalhe.TabVisible := False;

     { carrego os combos com as op��es }
     cmbSelecionar.Clear;
     cmbOrdenar.Clear;
     for i := 1 to ixMaximo do
      begin
       cmbOrdenar.Items.Add(ixCampos[i].rotulo);
       cmbSelecionar.Items.Add(ixCampos[i].rotulo);
      end;
     cmbOrdenar.ItemIndex    := pred(ixDefOrd);
     cmbSelecionar.ItemIndex := pred(ixDefSel);

     { desativo os bot�es - nenhuma sele��o inicial }
     btnAdicionar.Enabled := True;
     btnModificar.Enabled := False;
     btnImprimir.Enabled  := False;

     { desativo a ordena��o e pesquisa }
     cmbOrdenar.Enabled   := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { preparo a Query }
     qryDetalhes.Prepare;
     qryCliente.Prepare;
     qryVendedores.Prepare;
     qryDelete.Prepare;
     qryMarca.Prepare;
     qryModelo.Prepare;
     qryDefeito.Prepare;
     qryEquipamento.Prepare;
     qryOcorrencia.Prepare;
     qryTipoOS.Prepare;
     qryOperadora.Prepare;

     { for�o atualiza��o }
     cmbSelecionarChange(nil);
     Screen.Cursor := crDefault;

     { Or�amento }
     if OrcamentoOS or OSopen then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := IntToStr(codOrcamento);
       formStorage.Active := False;
       if not OSopen then
        begin
         DateEdit1.Text := DateToStr(dmoPrincipal.GetServerTime);
         DateEdit2.Text := DateToStr(dmoPrincipal.GetServerTime + 1);
        end else
        begin
         DateEdit1.Clear;
         DateEdit2.Clear;
        end;
       tecla := #13;
       edtSelecionarKeyPress(nil, tecla);
       edtSelecionar.Text := '';
       btnModificarClick(nil);
       if OSopen then
         pgcDetalhes.ActivePage := tbsProdutos;
      end;

     if inCliente > 0 then
       btnAdicionarClick(nil);

     if inNome > '' then
      begin
       edtSelecionar.Text := inNome;
       tecla := #13;
       edtSelecionarKeyPress(nil, tecla);
      end;

end;

procedure TformOS.btnAdicionarClick(Sender: TObject);
var
   filename: string;
begin
     novo := true;
     
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Adicionar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := False;

     { c�digo de adi��o vai aqui }
     with qryDetalhes do
      begin
       DisableControls;
       ParamByName(ixCampos[1].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
      end;

     { se estiver fechado, somente o cancelar estar� ativo }
     btnSalvar.Enabled   := qryDetalhes.fieldByName('TIPO').AsInteger = 2;
     btnCancelar.Visible := qryDetalhes.fieldByName('TIPO').AsInteger = 2;
     btnVoltar.Visible   := not btnCancelar.Visible;

     btnInicio.Enabled   := False;
     btnTermino.Enabled  := False;

     DBEdit14Enter(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformOS.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FORMSETUP, 0, 0);
end;

procedure TformOS.FormCreate(Sender: TObject);
begin

     OrcamentoOS := false;
     OSopen := false;
     inCliente := 0;
     inNome := '';

     { defino a atualiza��o das informa��es }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a express�o din�mica do WHERE }
     WhereArgDynamic := '';

end;

procedure TformOS.edtSelecionarKeyPress(Sender: TObject;
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

         { cl�usula SELECT }
//         StrSQL := 'SELECT ';
//         for i := 1 to ixMaximo do
//          begin
//           StrSQL := StrSQL + ixTabelas[ixCampos[i].iTab] + '.' +
//             ixCampos[i].fisico;
//           if i < ixMaximo then StrSQL := StrSQL + ', '
//             else StrSQL := StrSQL + ' ';
//          end;

         { cl�usula FROM }
//         StrSQL := StrSQL + 'FROM ';
//         for i := 1 to tblCount do
//          begin
//           StrSQL := StrSQL + ixTabelas[i];
//
//           if i < tblCount then StrSQL := StrSQL + ', '
//             else StrSQL := StrSQL + ' ';
//          end;

         { select est�tico }
         StrSQL :=
           'SELECT                                                     ' +
           '  MO.CODIGO,                                       ' +
           '  MO.DATA,                                         ' +
           '  MO.PRIORIDADE,                                   ' +
           '  MO.ECF,                                          ' +
           '  CAST(((MO.DATAPREVISAO - CURRENT_TIMESTAMP) * 24) AS DOUBLE PRECISION) AS LOGISTICA, ' +
           '  MO.STATUS,                                       ' +
           '  MO.NOTA_NUMERO,                                  ' +
           '  CL1.NOME,                                           ' +
           '  MO.SERIE,                                        ' +
           '  MO.NOTA_VALOR_TOTAL,                             ' +
           '  (SELECT SUM(PA.VALOR) FROM PAGAMENTOS PA WHERE PA.PAGO = 0 AND PA.CODMOVIMENTO = MO.CODIGO) AS VALOR_ABERTO, ' +
           '  OS.TIPO,                                            ' +
           '  CL2.NOME,                                                 ' +
           '  MO.ES                                                 ' +
           'FROM                                                       ' +
           '  MOVIMENTOS MO                                    ' +
           '  LEFT JOIN CLIENTES CL1 ON                           ' +
           '    (CL1.CODIGO = MO.CODCLIENTE)              ' +
           '  LEFT JOIN OSTIPOS OS ON                             ' +
           '    (OS.CODIGO = MO.OSTIPO)                   ' +
           '  LEFT JOIN CLIENTES CL2 ON                                ' +
           '    (CL2.CODIGO = MO.CODPARCEIRO)                  ';


         { cl�usula WHERE }
         StrSQL := StrSQL + ' WHERE (' +
           ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
         if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
             dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
           else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';

         { empresa }
         StrSQL := StrSQL + ' AND (MO.CODEMPRESA = ' +
           IntToStr(dmoPrincipal.empresa) + ')';

         { prioridade }
         if ckPrioridade.Checked then
           StrSQL := StrSQL + ' AND (MO.STATUS = ''OS ABERTA'')';

         { tudo }
         if ckTudo.Checked and (not ckPrioridade.Checked) then
          StrSQL := StrSQL + ' AND (MO.TIPO IN (2, 3, 5, 6)) ' +
            'AND (MO.ES = 2)';

         { argumento especial da DATA }
         if ckAbertura.Checked then
           if (dmoPrincipal.Interdata(dateedit1.text) > '') and
              (dmoPrincipal.Interdata(dateedit2.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(MO.DATA AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit1.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit2.text) + ''')';

         { argumento especial da DATAPREVISAO }
         if ckPrevisao.Checked then
           if (dmoPrincipal.Interdata(dateedit3.text) > '') and
              (dmoPrincipal.Interdata(dateedit4.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(MO.DATAPREVISAO AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit3.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit4.text) + ''')';

         { argumento especial da DATAFECHAMENTO }
         if ckFechamento.Checked then
           if (dmoPrincipal.Interdata(dateedit5.text) > '') and
              (dmoPrincipal.Interdata(dateedit6.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(MO.DATAFECHAMENTO AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit5.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit6.text) + ''')';

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')';

         { salvo antes do ORDER BY }
         tmpSQLSel := StrSQL;

         { cl�usula ORDER BY }
         if ckPrioridade.Checked then
           tmpSQLOrd := ' ORDER BY 5 '
//           tmpSQLOrd := ' ORDER BY ' +
//              ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.PRIORIDADE, ' +
//              ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
//              ixCampos[succ(cmbOrdenar.ItemIndex)].fisico
         else
           tmpSQLOrd := ' ORDER BY ' +
              ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
              ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;

         SQL.Clear;
         SQL.Add(tmpSQLSel + tmpSQLOrd);

//         ShowMessage(tmpSQLSel + tmpSQLOrd);

         open;

         if not IsEmpty then
          begin
           grdDados.Columns[4].Visible := ckPrioridade.Checked;
           btnAdicionar.Enabled := True;
           btnModificar.Enabled := True;
           btnImprimir.Enabled := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled := True;
           grdDados.Visible := True;
          end else btnAdicionar.Enabled := True;
        end;

       if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
       Screen.Cursor := crDefault;

      end;
end;

procedure TformOS.cmbOrdenarChange(Sender: TObject);
begin
     edtPesquisar.Clear;
     tmpSQLOrd := ' ORDER BY ' +
       ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;
     with qrySelecionar do
      begin
       SQL.Clear;
       SQL.Add(tmpSQLSel + tmpSQLOrd);
       open;
      end;
     edtPesquisar.SetFocus;
end;

procedure TformOS.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformOS.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False { else
//      btnImprimir.DropDownMenu := PrinterMenu; }
end;

procedure TformOS.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformOS.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformOS.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformOS.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformOS.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformOS.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     grdDados.Columns[0].Width      := 60;

     grdDados.Columns[1].Width      := 110;
     grdDados.Columns[1].Alignment  := taCenter;
     grdDados.Columns[1].Title.Alignment := taCenter;

     grdDados.Columns[2].Width      := 12;
     grdDados.Columns[2].Font.Style := [fsBold];

     grdDados.Columns[4].Width           := 80;
     grdDados.Columns[4].Font.Style      := [fsBold];
     grdDados.Columns[4].Alignment       := taRightJustify;
     grdDados.Columns[4].Title.Alignment := taRightJustify;

     { escondo a coluna da nota fiscal }
     grdDados.Columns[6].Width     := 0;

     grdDados.Columns[8].Width     := 0;

     grdDados.Columns[9].Width     := 90;

     grdDados.Columns[10].Width    := 90;
     grdDados.Columns[10].Font.Style := [fsBold];

     with Dataset do
       begin
         (fieldByName('DATA') as TDateTimeField).DisplayFormat := 'DD/MM/YY HH:NN';
         (fieldByName('NOTA_VALOR_TOTAL') as TNumericField).DisplayFormat := '##,##0.00;; ';
         (fieldByName('VALOR_ABERTO') as TNumericField).DisplayFormat := '##,##0.00;; ';
         (fieldByName('LOGISTICA') as TNumericField).DisplayFormat := '###0.00;+###0.00;';
         FieldByName('LOGISTICA').OnGetText := fldLOGISTICAAoExibir;
       end;

     qrySelecionarAfterScroll(DataSet);
end;

procedure TformOS.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia('MOVIMENTOS');

//    ShowMessage(IntToStr(dmoPrincipal.empresa));

    with Dataset do
     begin
      fieldByName('CODEMPRESA').AsInteger := dmoPrincipal.empresa;
      fieldByName('PRIORIDADE').AsInteger := 5;
      fieldByName('ES').AsInteger := 2;
      fieldByName('TIPO').AsInteger := 2;
      fieldByName('DATA').AsDateTime :=
        dmoPrincipal.GetServerTime;
      fieldByName('VALOR_SERVICOS').AsCurrency := 0.0;
      fieldByName('VALOR_ITENS').AsCurrency := 0.0;
      fieldByName('NOTA_VALOR_FRETE').AsCurrency := 0.0;
      fieldByName('NOTA_VALOR_SEGURO').AsCurrency := 0.0;
      fieldByName('NOTA_VALOR_OUTROS').AsCurrency := 0.0;
      fieldByName('VALOR_ICMS').AsCurrency := 0.0;
      fieldByName('DESCONTO').AsCurrency := 0.0;
      fieldByName('NOTA_QUANTIDADE').AsInteger := 0;
      fieldByName('NOTA_FRETE').AsInteger := 2;
      fieldByName('STATUS').AsString := 'ABRINDO OS';
      fieldByName('CONDICAO').AsString := '0/';
      fieldByName('ICMSSIMPLES').AsString := 'S';
      fieldByName('NOTA_DATASAIDA').AsDateTime :=
        dmoPrincipal.GetServerTime;
      fieldByName('NOTA_BASEICMS').AsCurrency := 0.0;
      fieldByName('NOTA_BASEICMSSUBST').AsCurrency := 0.0;
      fieldByName('NOTA_VALORICMSSUBST').AsCurrency := 0.0;
      fieldByName('VALOR_IPI').AsCurrency := 0.0;
      fieldByName('GARANTIA').AsString := 'N';
      fieldByName('EMPRESTIMO').AsString := 'N';
      
      fieldByName('ICMSSIMPLES').AsString :=
           dmoPrincipal.cdsConfig.fieldByName('ICMSSIMPLES').AsString;
      fieldByName('ICMSSIMPALIQ').AsFloat :=
           dmoPrincipal.cdsConfig.fieldByName('ALIQUOTA_ICMSSIMPLES').AsFloat;
      fieldByName('ISSALIQ').AsFloat      :=
           dmoPrincipal.cdsConfig.fieldByName('ALIQUOTA_ISS').AsFloat;

      fieldByName('CODVENDEDOR_ABRE').AsInteger      :=
           dmoPrincipal.cdsVendedor.fieldByName('CODIGO').AsInteger;
      fieldByName('NOTA_CODNATUOPER').AsString :=
           dmoPrincipal.cdsConfig.fieldByName('NATUOPER_PADRAO').AsString;

      fieldByName('NOTA_PESOBRUTO').AsCurrency := 0.0;
      fieldByName('NOTA_PESOLIQUIDO').AsCurrency := 0.0;

      fieldByName('AUTORIZADO').AsString := 'N';

      if inCliente > 0 then
        fieldByName('CODCLIENTE').AsInteger := inCliente;
      fieldByName('CODCENTRO').AsInteger := 1;
     end;

    inCliente := 0;

    { fecho o qryEquipamentos para resetar a busca }
    with qryEquipamento do
      if active then close;
    with qryOcorrencia do
      if active then close;
    with qryTipoOS do
      if active then close;

end;

procedure TformOS.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;

procedure TformOS.btnExcluirClick(Sender: TObject);
var
  marca: TbookmarkStr;
begin
   if dmoPrincipal.Pergunta('#, se voc� estornar essa Sa�da, todos os produtos ' +
      'ser�o devolvidos, incluindo a movimenta��o financeira.' + #10 + #13 + #10 + #13 +
      'Tem certeza que deseja excluir a OS?', 'Prossiga com cautela, #.',
      2) = IDYES then
    begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     with spEstorno do
      try
       if not Transaction.InTransaction then
         Transaction.StartTransaction;
       ParamByName('codmovimento').AsInteger :=
           qryDetalhes.fieldByName('CODIGO').AsInteger;
       ParamByName('usuarioestorno').AsString :=
           dmoPrincipal.GetLogUser;
       Prepare;
       ExecProc;
       if prepared then unprepare;
       Transaction.Commit;
      except
       on exception do
        begin
         if prepared then unprepare;
         Transaction.Rollback;
         raise;
        end;
      end;
     qryDetalhes.Close;
     qryCliente.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with qrySelecionar do
      begin
       disablecontrols;
       marca := bookmark;
       close;
       open;
       bookmark := marca;
       enablecontrols;
      end;

     Screen.Cursor := crDefault;
    end;
end;

procedure TformOS.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { cancelo o registro }
     if qryDetalhes.State = dsInsert then
       dmoPrincipal.CancelarSequencia('MOVIMENTOS',
         qryDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;
     qryCliente.Close;
     qryDefeito.Close;
     
     Screen.Cursor := crDefault;
end;

procedure TformOS.btnModificarClick(Sender: TObject);
begin
     novo := false;

     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Modificar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := True;

     { c�digo de adi��o vai aqui }
     with qryDetalhes do
      begin
       ParamByName(ixCampos[1].fisico).AsInteger :=
         qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
       Open;
      end;

     if dmoPrincipal.cdsVendedor.fieldByName('TECNICOLOGIN').AsString = 'S' then
      begin
        if qryTecnicos.IsEmpty then
         begin
          btnInicio.Enabled := True;
          btnTermino.Enabled := False;
         end else
         begin
          btnInicio.Enabled := False;
          btnTermino.Enabled := qryTecnicos.fieldByName('DATAFIM').IsNull;
         end;
      end else
      begin
        btnInicio.Enabled := False;
        btnTermino.Enabled := False;
      end;

     { se estiver fechado, somente o cancelar estar� ativo }
     btnSalvar.Enabled   := qryDetalhes.fieldByName('TIPO').AsInteger = 2;
     btnCancelar.Visible := qryDetalhes.fieldByName('TIPO').AsInteger = 2;
     btnVoltar.Visible   := not btnCancelar.Visible;
     btnExcluir.Enabled  :=
        dmoPrincipal.cdsVendedor.fieldByName('ESTORNO').AsString = 'S';

     if qryDetalhes.fieldByName('TIPO').AsInteger = 2 then
       if not (qryDetalhes.State in [dsEdit, dsInsert]) then
         dbnDetalhes.BtnClick(nbEdit);

     Screen.Cursor := crDefault;
end;

procedure TformOS.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     qrySelecionar.tag := 0;
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_ICMS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_ISS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_COMISSAO') as TIBBCDField).Currency := True;

       (fieldByName('DATA_AUTORIZADO') as TDateTimeField).EditMask := '99/99/99 99:99';
       (fieldByName('DATA_AUTORIZADO') as TDateTimeField).DisplayFormat := 'dd/mm/yy hh:nn';

       (fieldByName('DATA_ENTREGA') as TDateTimeField).EditMask := '99/99/99 99:99';
       (fieldByName('DATA_ENTREGA') as TDateTimeField).DisplayFormat := 'dd/mm/yy hh:nn';

       (fieldByName('DATAPREVISAO') as TDateTimeField).EditMask := '99/99/99 99:99';
       (fieldByName('DATAPREVISAO') as TDateTimeField).DisplayFormat := 'dd/mm/yy hh:nn';

       (fieldByName('DATAFECHAMENTO') as TDateTimeField).EditMask := '99/99/99 99:99';
       (fieldByName('DATAFECHAMENTO') as TDateTimeField).DisplayFormat := 'dd/mm/yy hh:nn';

       { rotinas de chamada }
       fieldByName('CODCLIENTE').OnChange       := fldCLIENTEmudar;
       fieldByName('DESCONTO').OnChange         := fldDESCONTOmudar;
       fieldByName('VALOR_ITENS').OnChange      := fldDESCONTOmudar;
       fieldByName('VALOR_SERVICOS').OnChange   := fldDESCONTOmudar;

       fieldByName('CODMARCA').OnChange         := fldCODMARCAmudar;
       fieldByName('CODMODELO').OnChange        := fldCODMODELOmudar;
       fieldByName('CODDEFEITO').OnChange       := fldCODDEFEITOmudar;
       fieldByName('CODVENDEDOR_ABRE').OnChange := fldCODVENDEDOR_ABREmudar;
       fieldByName('OSTIPO').OnChange           := fldOSTIPOmudar;

       fieldByName('AUTORIZADO').OnChange       := fldAUTORIZADOmudar;
       fieldByName('DATA_ENTREGA').OnChange     := fldDATA_ENTREGAmudar;

       fieldByName('CODPARCEIRO').OnChange     := fldCODPARCEIROmudar;

       fieldByName('LOCALIZACAO').OnGetText    := qryDetalhesLOCALIZACAOGetText;

       { primeira chamada }
       fldCODMARCAmudar(fieldByName('CODMARCA'));
       fldCODMODELOmudar(fieldByName('CODMODELO'));
       fldCODDEFEITOmudar(fieldByName('CODDEFEITO'));
       fldCODVENDEDOR_ABREmudar(fieldByName('CODVENDEDOR_ABRE'));
       fldOSTIPOmudar(fieldByName('OSTIPO'));

       fldCLIENTEmudar(fieldByName('CODCLIENTE'));

       fldCODPARCEIROmudar(fieldByName('CODPARCEIRO'));

       if OrcamentoOS then
        begin
         edit;
         fieldByName('STATUS').AsString := 'ABRINDO OS';
        end;

       if dmoPrincipal.GetLogUser = 'SYSDBA' then
        begin
         Label21.Enabled := True;
         DBEdit10.Enabled := True;
        end;

       if qryProdutos.Active then qryProdutos.Close;
       qryProdutos.Open;

       if qryServicos.Active then qryServicos.Close;
       qryServicos.Open;

       if qryTecnicos.Active then qryTecnicos.Close;
       qryTecnicos.Open;

       if qryVendedor.Active then qryVendedor.Close;
       qryVendedor.Open;

       if qryOperadora.Active then qryOperadora.Close;
       qryOperadora.Open;

     end;


end;

procedure TformOS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformOS.fldCLIENTEmudar(Sender: TField);
var
  estatistica: string;
begin
  qryCliente.Close;

  if Sender.AsString > '' then
   with qryCliente do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;

  with qryUltimaOS do
   begin
    if Active then close;
    open;

    if fieldByName('OUTRAS_ABERTAS').IsNull then
      estatistica := 'N�o.';

    if fieldByName('OUTRAS_ABERTAS').AsInteger = 0 then
      estatistica := 'N�o.';

    if fieldByName('OUTRAS_ABERTAS').AsInteger = 1 then
      estatistica := 'Sim, mais 1 (uma) OS.';

    if fieldByName('OUTRAS_ABERTAS').AsInteger > 1 then
      estatistica := Format('Sim, mais %d outras.',
          [fieldByName('OUTRAS_ABERTAS').AsInteger]);

    if (not fieldByName('NUMERO_OS').IsNull) and
       (qryDetalhes.State in [dsInsert]) then
      { mostro os dados }
      if dmoPrincipal.Pergunta(
         Format('O cliente selecionado j� possui OS em aberto!' + #13#10#13#10 +
           'N�mero da �ltima OS: %d' + #13#10 +
           'Aberta em %s' + #13#10 +
           'Respons�vel pela abertura: %s' + #13#10 +
           'Solicitada por: %s' + #13#10#13#10 +
           'Existem outras OS em aberto al�m desta? %s' + #13#10#13#10 +
           'Deseja continuar fazendo a abertura atual?',
           [fieldByName('NUMERO_OS').AsInteger,
            formatDateTime('dddd, dd "de" mmmm "de" yyyy, "�s" H"h"mm"min"',
               fieldByName('DATA').AsDateTime),
            fieldByName('RESPONSAVEL').AsString,
            fieldByName('SOLICITANTE').AsString,
            estatistica]),
         'Aten��o, #!', 1) = IDNO then btnCancelarClick(nil);
   end;
end;

procedure TformOS.fldDESCONTOmudar(Sender: TField);
begin
  with qryDetalhes do
    fieldByName('VALOR_TOTAL').AsCurrency :=
      (fieldByName('VALOR_ITENS').AsCurrency +
      fieldByName('VALOR_SERVICOS').AsCurrency) -
      fieldByName('DESCONTO').AsCurrency;
end;

procedure TformOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
       if qryDetalhes.Active then btnCancelarClick(Sender) else
        begin
         Self.ModalResult := mrCancel;
        end;

     if not qryDetalhes.Active then
      begin
       case key of
        vk_F2: btnAdicionarClick(Sender);
        vk_F3: btnModificarClick(Sender);
       end;
      end else
      begin
       case key of
        vk_F9: btnSalvarClick(Sender);
       end;
      end;

     if ActiveControl = nil then atag := 0 else
       atag := ActiveControl.Tag;

     if (key = vk_Return) and (atag < 2) then
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

end;

procedure TformOS.edtPesquisarEnter(Sender: TObject);
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

procedure TformOS.edtPesquisarExit(Sender: TObject);
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

procedure TformOS.btnSalvarClick(Sender: TObject);
const
   myEnter: Char = #13;
begin
     { confirmacao de senha }
     if dmoPrincipal.cdsConfig.fieldByName('SENHA_OS').AsString = 'S' then
      try
        formConfirmaSenha := TformConfirmaSenha.Create(self);
        with formConfirmaSenha do
         if not(showmodal = mrOk) then
           exit;
      finally
        formConfirmaSenha.release;
      end;


    if qryDetalhes.fieldByName('TIPO').AsInteger = 2 then
       if not (( qryDetalhes.fieldByName('CODCLIENTE').AsString > '' ) and
         (qryDetalhes.fieldByName('CODVENDEDOR_ABRE').AsString > '')) then
        begin
         ShowMessage('Os campos do CODIGO DO CLIENTE e do CODIGO DE QUEM ' +
           'ABRIU A O.S. precisam estar preenchidos corretamente!');
         exit;
        end;

     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbPost);
     try
       dmoPrincipal.SalvarRegistro(qryDetalhes);
     except
       on exception do
        begin
         dbnDetalhes.BtnClick(nbEdit);
         Screen.Cursor := crDefault;
         raise;
        end;
     end;
     qryCliente.Close;
     qryDefeito.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { verifico se � necessario ativar o grid }
     if novo then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := qryDetalhes.fieldByName(ixCampos[1].fisico).asstring;
       edtSelecionarKeyPress(Sender, myEnter);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Clear;
      end else
      begin
       updSelecionar.RefreshSQL.Clear;
       updSelecionar.RefreshSQL.Add(
         tmpSQLSel +
         ' AND MOVIMENTOS.CODIGO = ' +
         qrySelecionar.fieldByName('CODIGO').AsString
       );
       qrySelecionar.refresh;
      end;
     qryDetalhes.Close;

     Screen.Cursor := crDefault;
end;

procedure TformOS.lblCLIENTEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;

       { passo o c�digo para o JumpStart }
       inCliente := Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger;

       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;

     with qryHistorico do
      begin
        if active then close;
        open;
      end;

     if qryHistorico.fieldByName('BLOQUEIO').AsString = 'S' then
      begin
        with TformClienteHistorico.Create(Self) do
         try
          inCliente := Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger;
          Caption := Self.Caption + ' -> ' + Caption;
          ShowModal;
         finally
          release;
         end;

        if dmoPrincipal.cdsVendedor.fieldByName('FINANCEIRO').AsString = 'S' then
         begin
           if Application.MessageBox('Essa pergunta foi exibida porque voc� ' +
                'tem acesso a privil�gios financeiros do sistema, e o cliente ' +
                'selecionado est� bloqueado conforme o sistema foi instru�do.' + #13#10#13#10 +
                'Deseja liberar esse cliente?',
                'Liberar cliente',
                mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
            qryDetalhes.fieldByName('CODCLIENTE').Clear;

         end else qryDetalhes.fieldByName('CODCLIENTE').Clear;
      end;
      
end;

procedure TformOS.FormDestroy(Sender: TObject);
begin
     if qryMarca.Active then qryMarca.Close;
     if qryModelo.Active then qryModelo.Close;
     if qryDefeito.Active then qryDefeito.Close;
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryCliente.Active then qryCliente.Close;
     if qryVendedores.Active then qryVendedores.Close;
     if qryEquipamento.Active then qryEquipamento.Close;
     if qryOcorrencia.Active then qryOcorrencia.Close;
     if qryTipoOS.Active then qryTipoOS.Close;
     if qryOperadora.Active then qryOperadora.Close;
     qryMarca.UnPrepare;
     qryModelo.Unprepare;
     qryDefeito.Unprepare;
     qryDetalhes.Unprepare;
     qryCliente.Unprepare;
     qryVendedores.Unprepare;
     qryEquipamento.Unprepare;
     qryOcorrencia.Unprepare;
     qryTipoOS.Unprepare;
     qryDelete.Unprepare;
     qryOperadora.Unprepare;
end;


procedure TformOS.Label17Click(Sender: TObject);
begin
     with TformITorcamento.Create(Self) do
      try
       inOrcamento := Self.qryDetalhes.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
        [Self.qryDetalhes.fieldByName('CODIGO').AsInteger]),
        Format('Or�amento %d - %s', [Self.qryDetalhes.fieldByName('CODIGO').AsInteger,
          qryCliente.fieldByName('NOME').AsString]));
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

     with qryDetalhes do
       fldCLIENTEmudar(fieldByName('CODCLIENTE'));

end;

procedure TformOS.lbLancamentoClick(Sender: TObject);
var
  marca: TBookmarkStr;
begin
     Screen.Cursor := crHourGlass;
     with TformVendaDireta.Create(Self) do
      try
        inOS := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
        Caption := Self.Caption + ' -> ' + Caption;
        if (Screen.Width < 700) and (Screen.Height < 550) then
          WindowState := wsMaximized else
         begin
          { se n�o, defino o tamanho manualmente }
          Height := 484;
          Width  := 652;
         end;
        showmodal;
      finally
        release;
      end;

     with qrySelecionar do
      begin
       disablecontrols;
       marca := bookmark;
       close;
       open;
       bookmark := marca;
       enablecontrols;
      end;

   Screen.Cursor := crDefault;
end;

procedure TformOS.Imprimiroramento1Click(Sender: TObject);
var
  codigo: longint;
begin
{     codigo := qrySelecionar.fieldByName(FldQName(1)).AsInteger;
     with TrelatOrcamento.Create(Application) do
      try
       qryOrcamento.ParamByName('codigo').AsInteger := codigo;
       qryOrcamento.open;
       if dmoPrincipal.Repreview then Preview else Print;
      finally
       release;
      end;}
end;

procedure TformOS.Salvarcomopadro1Click(Sender: TObject);
begin
     ShowMessage((Sender as TDBMemo).Name);
end;


procedure TformOS.Label21Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryVendedores.Close;
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;

       { JumpStart }
       inCliente := Self.qryDetalhes.fieldByName('CODVENDEDOR_ABRE').AsInteger;

       SetWhereDynamic('(TIPO = ''A'')', '');
       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODVENDEDOR_ABRE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
     qryVendedores.Open;
end;

procedure TformOS.menuImpGradeClick(Sender: TObject);
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

procedure TformOS.menuImpOSClick(Sender: TObject);
var
  codigo: longint;
begin
   codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;

   if pos('ABERT', qrySelecionar.fieldByName('STATUS').AsString) > 0 then
    begin

     if dmoPrincipal.cdsConfig.fieldByName('OSABERTA_PADRAO').IsNull then
      begin

       { OS GRAFICA }
       with TformOSnota.Create(Self) do
        try
         if qryOSnota.Active then qryOSnota.Close;
         qryOSnota.ParamByName('codigo').AsInteger := codigo;
         qryOSnota.open;
         qrMSG.Caption := dmoPrincipal.cdsConfig.fieldByName('MENSAGEM_OS').AsString;
         qrOSnota.Preview;
        finally
         release;
        end;

      end else
      begin

       { OS TEXTO }
       with TformImprimirOSaberta.Create(Self) do
        try
          inCODMOVIMENTO := codigo;
          inNUMERONOTA := codigo;
          showmodal;
        finally
          release;
        end;

      end;

    end else
    begin

     if dmoPrincipal.cdsConfig.fieldByName('OSABERTA_PADRAO').IsNull then
      begin

       { OS GRAFICA }
       with TformOSnota.Create(Self) do
        try
         if qryOSnota.Active then qryOSnota.Close;
         qryOSnota.ParamByName('codigo').AsInteger := codigo;
         qryOSnota.open;
         qrMSG.Caption := dmoPrincipal.cdsConfig.fieldByName('MENSAGEM_OS').AsString;
         qrOSnota.Preview;
        finally
         release;
        end;

      end else
      begin

       { OS TEXTO }
       with TformImprimirOSfechada.Create(Self) do
        try
          inCODMOVIMENTO := codigo;
          inNUMERONOTA := codigo;
          showmodal;
        finally
          release;
        end;

      end;

    end;
end;

procedure TformOS.Label13Click(Sender: TObject);
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformContaReceber.Create(Self) do
      try
       SetWhereDynamic(Format('PAGAMENTOS.CODMOVIMENTO = %d',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('A Receber de %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('NOME').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;
end;

procedure TformOS.Label16Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryMarca.Close;
     with TformMarcas.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODMARCA').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
     qryMarca.Open;
end;

procedure TformOS.Label23Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryModelo.Close;
     with TformModelos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       inMarca := Self.qryDetalhes.fieldByName('CODMARCA').AsInteger;
       SetWhereDynamic(Format('CODEQUIPAMENTO = %d',
        [Self.qryDetalhes.fieldByName('CODMARCA').AsInteger]),
        Format('Modelos da marca %d - %s',
          [Self.qryDetalhes.fieldByName('CODMARCA').AsInteger,
          Self.qryMarca.fieldByName('DESCRICAO').AsString]));
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODMODELO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
     qryModelo.Open;
end;

procedure TformOS.Label28Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryDefeito.Close;
     with TformDefeitos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODDEFEITO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
     qryDefeito.Open;
end;

procedure TformOS.DBEdit14Enter(Sender: TObject);
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
     if qryDetalhes.Active then
      if (qryDetalhes.fieldByName('CODCLIENTE').AsString = '') and
        (qryDetalhes.State in [dsInsert, dsEdit]) then
       lblCLIENTEClick(Sender);
end;

procedure TformOS.qryProdutosAfterOpen(DataSet: TDataSet);
begin
   with Dataset do
     (fieldByName('VALOR_PAGO') as TIBBCDField).Currency := True;
end;

procedure TformOS.ckPrioridadeClick(Sender: TObject);
var
   tecla: char;
begin
   tecla := #13;
   edtSelecionarKeyPress(Sender, tecla);
end;

procedure TformOS.lbEquipamentoClick(Sender: TObject);
var
  primeira: boolean;
  garantia: string;
begin
  primeira := not qryEquipamento.Active;

  with qryEquipamento do
   begin
    if active then close;
    open;
   end;

  if not qryEquipamento.IsEmpty then
   with TformEquipamento.Create(self) do
    try
     if showmodal = mrOk then
      begin

       if self.qryEquipamento.fieldByName('GARANTIA').AsString = 'S' then
        begin
          if (now > self.qryEquipamento.fieldByName('DATAINI').AsDateTime) and
            (now < self.qryEquipamento.fieldByName('DATAFIM').AsDateTime) then
            garantia := 'S'
          else
            garantia := 'N';
        end else garantia := 'N';

       if garantia = 'S' then
         garantia := 'Sim'
       else
         garantia := 'N�o';

       if Application.MessageBox(PChar(Format(
          'Informa��es do equipamento escolhido: ' +#13#10#13#10+
          'Marca: %s' + #13#10+
          'Modelo: %s' + #13#10+
          'S�rie: %s' + #13#10+
          'Garantia: %s' + #13#10+
          'Contrato: %s' + #13#10#13#10+
          'Confirma a escolha do equipamento?', [
          self.qryEquipamento.fieldByName('MARCA').AsString,
          self.qryEquipamento.fieldByName('MODELO').AsString,
          self.qryEquipamento.fieldByName('SERIE').AsString,
          garantia,
          self.qryEquipamento.fieldByName('TIPOCONTRATO').AsString])),
          'Equipamento',
          mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        begin

           Self.qryDetalhes.fieldByName('CODMARCA').AsInteger :=
             Self.qryEquipamento.fieldByName('CODMARCA').AsInteger;
           Self.qryDetalhes.fieldByName('CODMODELO').AsInteger :=
             Self.qryEquipamento.fieldByName('CODMODELO').AsInteger;
           Self.qryDetalhes.fieldByName('SERIE').AsString :=
             Self.qryEquipamento.fieldByName('SERIE').AsString;

        end;

      end;
    finally
     release;
    end
  else if not primeira then ShowMessage('Nenhum equipamento encontrado.');

end;

procedure TformOS.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
  btnLancamentos.Enabled :=
    (pos('FECHADA', qrySelecionar.fieldByName('STATUS').AsString) = 0);
  btnModificar.Enabled :=
    (pos('OS',    qrySelecionar.fieldByName('STATUS').AsString) > 0) or
    (pos('VENDA', qrySelecionar.fieldByName('STATUS').AsString) > 0);
  btnImprimir.Enabled :=
    (pos('OS',    qrySelecionar.fieldByName('STATUS').AsString) > 0) or
    (pos('VENDA', qrySelecionar.fieldByName('STATUS').AsString) > 0);
  EmitirNotaFiscal1.Enabled := (not
    (qrySelecionar.FieldByName('NOTA_NUMERO').AsInteger > 0)) and
    (pos('FECH', qrySelecionar.fieldByName('STATUS').AsString) > 0);
//  btnImprimir.Enabled := lbLancamento.Enabled;
  btnReceber.Enabled :=
    (qrySelecionar.FieldByName('VALOR_ABERTO').AsFloat > 0);
end;


procedure TformOS.grdDadosDblClick(Sender: TObject);
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

procedure TformOS.fldCODMARCAmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryMarca do
    begin
     if active then close;
     open;
    end;
end;

procedure TformOS.fldCODMODELOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryModelo do
    begin
     if active then close;
     open;
    end;
end;

procedure TformOS.fldCODDEFEITOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryDefeito do
    begin
     if active then close;
     open;
    end;
end;

procedure TformOS.fldOSTIPOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryTipoOS do
    begin
     if active then close;
     open;
     if Sender.Dataset.State in [dsInsert, dsEdit] then
       Sender.Dataset.fieldByName('DATAPREVISAO').AsDateTime :=
         Sender.Dataset.fieldByName('DATA').AsDateTime +
         fieldByName('DIAS').AsInteger +
         fieldByName('HORAS').AsFloat * 0.04167;
    end;
end;

procedure TformOS.fldCODVENDEDOR_ABREmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryVendedores do
    begin
     if active then close;
     open;
    end;
end;

procedure TformOS.fldAUTORIZADOmudar(Sender: TField);
begin
  if (Sender.AsString = 'S') and (qryDetalhes.fieldByName('DATA_AUTORIZADO').IsNull) then
    qryDetalhes.fieldByName('DATA_AUTORIZADO').AsDateTime :=
      dmoPrincipal.GetServerTime;
end;

procedure TformOS.fldDATA_ENTREGAmudar(Sender: TField);
begin
  if (not Sender.IsNull) and (qryDetalhes.fieldByName('QUEM_ENTREGOU').IsNull) then
    qryDetalhes.fieldByName('QUEM_ENTREGOU').AsString :=
      dmoPrincipal.GetLogUser;
end;

procedure TformOS.DBEdit13Enter(Sender: TObject);
begin
     if not qryEquipamento.Active then
       lbEquipamentoClick(Sender);

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

procedure TformOS.Label6Click(Sender: TObject);
var
  primeira: boolean;
begin
  primeira := not qryOcorrencia.Active;

  with qryOcorrencia do
   begin
    if active then close;
    open;
   end;

  if not qryOcorrencia.IsEmpty then
   with TformOcorrencia.Create(self) do
    try
     if showmodal = mrOk then
      begin
       Self.qryDetalhes.fieldByName('CODDEFEITO').AsInteger :=
         Self.qryOcorrencia.fieldByName('CODDEFEITO').AsInteger;
      end;
    finally
     release;
    end
  else if not primeira then ShowMessage('Nenhuma ocorr�ncia encontrada.');
end;

procedure TformOS.DBEdit20Enter(Sender: TObject);
begin
     if not qryOcorrencia.Active then
       Label6Click(Sender);

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

procedure TformOS.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformOS.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformOS.lbTipoOSClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformOStipos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('OSTIPO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformOS.OrdemdeServiomodelo21Click(Sender: TObject);
var
  codigo: longint;
begin
   codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;

   if pos('ABERT', qrySelecionar.fieldByName('STATUS').AsString) > 0 then
    begin

     if dmoPrincipal.cdsConfig.fieldByName('OSABERTA_PADRAO_2A').IsNull then
      begin

       { OS GRAFICA }
       with TformOSnota2.Create(Self) do
        try
         if qryOSnota.Active then qryOSnota.Close;
         qryOSnota.ParamByName('codigo').AsInteger := codigo;
         qryOSnota.open;
         qrMSG.Caption := dmoPrincipal.cdsConfig.fieldByName('MENSAGEM_OS').AsString;
         qrOSnota.Preview;
        finally
         release;
        end;

      end else
      begin

       { OS TEXTO }
       with TformImprimirOSaberta2.Create(Self) do
        try
          inCODMOVIMENTO := codigo;
          inNUMERONOTA := codigo;
          showmodal;
        finally
          release;
        end;

      end;

    end else
    begin

     if dmoPrincipal.cdsConfig.fieldByName('OSABERTA_PADRAO_2A').IsNull then
      begin

       { OS GRAFICA }
       with TformOSnota2.Create(Self) do
        try
         if qryOSnota.Active then qryOSnota.Close;
         qryOSnota.ParamByName('codigo').AsInteger := codigo;
         qryOSnota.open;
         qrMSG.Caption := dmoPrincipal.cdsConfig.fieldByName('MENSAGEM_OS').AsString;
         qrOSnota.Preview;
        finally
         release;
        end;

      end else
      begin

       { OS TEXTO }
       with TformImprimirOSfechada.Create(Self) do
        try
          inCODMOVIMENTO := codigo;
          inNUMERONOTA := codigo;
          showmodal;
        finally
          release;
        end;

      end;

    end;
end;

procedure TformOS.EmitirNotaFiscal1Click(Sender: TObject);
begin
   with TformImprimirNota.Create(Self) do
    try
      inCODMOVIMENTO :=
        qrySelecionar.fieldByName('CODIGO').AsInteger;
      showmodal;
    finally
      release;
    end;
end;

procedure TformOS.qryTecnicosAfterPost(DataSet: TDataSet);
begin
  dmoPrincipal.SalvarRegistro(qryTecnicos);
end;

procedure TformOS.btnInicioClick(Sender: TObject);
begin
  with qryTecnicos do
   begin

    insert;
    fieldByName('CODMOVIMENTO').AsInteger :=
      qryDetalhes.fieldByName('CODIGO').AsInteger;
    fieldByName('CODVENDEDOR').AsInteger :=
      dmoPrincipal.cdsVendedor.fieldByName('CODIGO').AsInteger;
    fieldByName('NOMEUSER').AsString :=
      dmoPrincipal.cdsVendedor.fieldByName('NOME').AsString;
    fieldByName('DATAINI').AsDateTime :=
      dmoPrincipal.GetServerTime;
    fieldByName('PORCENTAGEM').AsFloat := 100.0;
    post;

    // t�cnico login como vendedor
    if dmoPrincipal.cdsConfig.FieldByName('TECNICOLOGIN_VENDEDOR').AsString = 'S' then
     begin
       qryDetalhes.FieldByName('CODVENDEDOR').AsInteger :=
         dmoPrincipal.cdsVendedor.fieldByName('CODIGO').AsInteger;
     end

   end;
  if btnInicio.Enabled then
    btnInicio.Enabled := False;
end;

procedure TformOS.btnTerminoClick(Sender: TObject);
begin
  with qryTecnicos do
   begin
    if trim(fieldByName('NOMEUSER').AsString) = dmoPrincipal.GetLogUser then
     begin
       edit;
       fieldByName('DATAFIM').AsDateTime :=
          dmoPrincipal.GetServerTime;
       post;
     end else ShowMessage('Somente o t�cnico que iniciou a O.S. pode terminar!');
   end;
  if btnTermino.Enabled then
    btnTermino.Enabled := False;
end;

procedure TformOS.fldLOGISTICAAoExibir(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsFloat < 0 then
    Text := '+'
  else
    Text := '';

  if Abs(Sender.AsFloat) < 24.0 then
    Text := Text + Format('%dh %.2dm', [
      Trunc(Abs(Sender.AsFloat)),
      Trunc(Frac(Abs(Sender.AsFloat)) * 60)
    ])
  else
    if Abs(Sender.AsFloat) < 720 then
      Text := Text + Format('%dD %.2dh', [
        Trunc(Abs(Sender.AsFloat / 24)),
        Trunc(Frac(Abs(Sender.AsFloat / 24)) * 24)
      ])
    else
      Text := Text + Format('%dM %.2dD', [
        Trunc(Abs(Sender.AsFloat / 720)),
        Trunc(Frac(Abs(Sender.AsFloat / 720)) * 30)
      ]);

  DisplayText := True;
end;

procedure TformOS.Label52Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;

       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODPARCEIRO').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformOS.fldCODPARCEIROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryParceiro do
    begin
     if active then close;
     open;
    end;
end;

procedure TformOS.CartadeManuteno1Click(Sender: TObject);
begin
  with qryOSequip do
   begin
     if active then close;
     open;
   end;
  with qryCarta do
   begin
     if active then close;
     open;
   end;
  pplbCliente.Caption := 'CLIENTE: ' + qryOSequip.fieldByName('CLIENTE').AsString;
  pplbEquipamento.Caption := 'EQUIPAMENTO: ' +
    trim(qryOSequip.fieldByName('MARCA').AsString) + ' ' +
    trim(qryOSequip.fieldByName('MODELO').AsString) + ' - S�RIE: ' +
    qryOSequip.fieldByName('SERIE').AsString;
  ppReportCarta.Print;
end;

procedure TformOS.Button1Click(Sender: TObject);
begin
   with qryDetalhes do
    begin

      if fieldByName('QUEM_RECEBEU').AsString > '' then
       if dmoPrincipal.cdsVendedor.FieldByName('ESTORNO').AsString = 'N' then
        begin
          Application.MessageBox('Entrega j� efetuada.', 'Entrega',
            mb_IconWarning + mb_Ok);
          exit;
        end else
        begin
          if Application.MessageBox('Deseja excluir os dados da entrega atual?',
            'Entrega', mb_IconQuestion + mb_DefButton2 + mb_YesNo) = IDYES then
           begin
             fieldByName('QUEM_RECEBEU').Clear;
             fieldByName('QUEM_ENTREGOU').Clear;
             fieldByName('DATA_ENTREGA').Clear;
           end;
          exit;
        end;

      if state in [dsEdit, dsInsert] then
       begin
         fieldByName('QUEM_RECEBEU').AsString := uppercase(
           InputBox('Entrega', 'Quem est� recebendo o equipamento?', ''));
         if fieldByName('QUEM_RECEBEU').AsString > '' then
          begin
            fieldByName('QUEM_ENTREGOU').AsString :=
              dmoPrincipal.GetLogUser;
            fieldByName('DATA_ENTREGA').AsDateTime :=
              dmoPrincipal.GetServerTime;
          end;
       end;
    end;
end;

procedure TformOS.qryOperadoraAfterOpen(DataSet: TDataSet);
begin
  (Dataset as TIBQuery).FetchAll;
end;

end.
