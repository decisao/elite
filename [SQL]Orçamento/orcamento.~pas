unit orcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet,
  IBStoredProc, DBCtrls, Mask, TB97Ctls, Buttons, IBUpdateSQL, IBDatabase,
  ToolEdit, RXDBCtrl;

type
  TformOrcamento = class(TForm)
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
    edtSelecionar: TEdit;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    formStorage: TFormStorage;
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
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    DBMemo2: TDBMemo;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    or_cond1: TDBMemo;
    Label14: TLabel;
    or_cond2: TDBMemo;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    qryCliente: TIBQuery;
    dsrCliente: TDataSource;
    qryDelete: TIBQuery;
    Imprimiroramento1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    spOS: TIBStoredProc;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traCliente: TIBTransaction;
    traOS: TIBTransaction;
    traDelete: TIBTransaction;
    N2: TMenuItem;
    Grade1: TMenuItem;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnAreas: TToolbarButton97;
    btnArquivos: TToolbarButton97;
    TabSheet5: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    Label42: TLabel;
    DBEdit33: TDBEdit;
    Label43: TLabel;
    DBDateEdit2: TDBDateEdit;
    TabSheet6: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label18: TLabel;
    DBMemo3: TDBMemo;
    qryDetalhesCODIGO: TIntegerField;
    qryDetalhesES: TSmallintField;
    qryDetalhesTIPO: TSmallintField;
    qryDetalhesCODCLIENTE: TIntegerField;
    qryDetalhesDATA: TDateTimeField;
    qryDetalhesEQUIPAMENTO: TIBStringField;
    qryDetalhesPROBLEMA: TIBStringField;
    qryDetalhesSOLICITANTE: TIBStringField;
    qryDetalhesATENDIMENTO: TIBStringField;
    qryDetalhesSERVICOS: TIBStringField;
    qryDetalhesVALOR_SERVICOS: TIBBCDField;
    qryDetalhesOPCIONAIS: TIBStringField;
    qryDetalhesCONDICOES1: TIBStringField;
    qryDetalhesCONDICOES2: TIBStringField;
    qryDetalhesVALOR_ITENS: TIBBCDField;
    qryDetalhesDESCONTO: TIBBCDField;
    qryDetalhesVALOR_PRODUTOS: TIBBCDField;
    qryDetalhesVALOR_ICMS: TIBBCDField;
    qryDetalhesVALOR_TOTAL: TIBBCDField;
    qryDetalhesOBSERVACOES: TIBStringField;
    qryDetalhesNOTA_NUMERO: TIntegerField;
    qryDetalhesNOTA_DATAEMISSAO: TDateTimeField;
    qryDetalhesNOTA_CODNATUOPER: TIBStringField;
    qryDetalhesNOTA_CODTRANSPORTADOR: TIntegerField;
    qryDetalhesNOTA_PLACAVEICULO: TIBStringField;
    qryDetalhesNOTA_UFVEICULO: TIBStringField;
    qryDetalhesNOTA_FRETE: TSmallintField;
    qryDetalhesNOTA_VALOR_FRETE: TIBBCDField;
    qryDetalhesNOTA_VALOR_SEGURO: TIBBCDField;
    qryDetalhesNOTA_VALOR_OUTROS: TIBBCDField;
    qryDetalhesNOTA_QUANTIDADE: TIBBCDField;
    qryDetalhesNOTA_ESPECIE: TIBStringField;
    qryDetalhesNOTA_MARCA: TIBStringField;
    qryDetalhesNOTA_VOLNUM: TIntegerField;
    qryDetalhesNOTA_PESOBRUTO: TIBBCDField;
    qryDetalhesNOTA_PESOLIQUIDO: TIBBCDField;
    qryDetalhesNOTA_DADOSADICIONAIS: TIBStringField;
    qryDetalhesCODVENDEDOR: TIntegerField;
    qryDetalhesSTATUS: TIBStringField;
    qryDetalhesCONDICAO: TIBStringField;
    qryDetalhesDATAINICIO: TDateTimeField;
    qryDetalhesDATATERMINO: TDateTimeField;
    qryDetalhesICMSSIMPLES: TIBStringField;
    qryDetalhesICMSSIMPALIQ: TIBBCDField;
    qryDetalhesISSALIQ: TIBBCDField;
    qryDetalhesVALOR_ISS: TIBBCDField;
    qryDetalhesNOTA_IESUBST: TIBStringField;
    qryDetalhesNOTA_DATASAIDA: TDateTimeField;
    qryDetalhesNOTA_BASEICMSSUBST: TIBBCDField;
    qryDetalhesNOTA_VALORICMSSUBST: TIBBCDField;
    qryDetalhesVALOR_IPI: TIBBCDField;
    qryDetalhesCODVENDEDOR_ABRE: TIntegerField;
    qryDetalhesDESCONTOTXT: TIBStringField;
    qryDetalhesCODTECNICO: TIntegerField;
    qryDetalhesCODRESPONSAVEL: TIntegerField;
    qryDetalhesCODMARCA: TIntegerField;
    qryDetalhesCODMODELO: TIntegerField;
    qryDetalhesCODDEFEITO: TIntegerField;
    qryDetalhesGARANTIA: TIBStringField;
    qryDetalhesSERIE: TIBStringField;
    qryDetalhesACESSORIOS: TIBStringField;
    qryDetalhesDATAPREVISAO: TDateTimeField;
    qryDetalhesCONDICAOEXTERNA: TIBStringField;
    qryDetalhesPRIORIDADE: TIntegerField;
    qryDetalhesEMPRESTIMO: TIBStringField;
    qryDetalhesDATAFECHAMENTO: TDateTimeField;
    qryDetalhesUSUARIOFECHAMENTO: TIBStringField;
    qryDetalhesCODEMPRESA: TIntegerField;
    qryDetalhesVALOR_COMISSAO: TIBBCDField;
    qryDetalhesECF: TIBStringField;
    qryDetalhesOSTIPO: TIntegerField;
    qryDetalhesVALOR_IPI_PRODUTOS: TIBBCDField;
    qryDetalhesTOTAL_IPI: TIBBCDField;
    qryDetalhesNOTA_BASEICMS: TIBBCDField;
    qryDetalhesNOTA_VALOR_TOTAL: TIBBCDField;
    qryDetalhesVALOR_RATEIO_CUSTO: TIBBCDField;
    qryDetalhesNOME_VENDEDOR: TIBStringField;
    qryDetalhesCODCENTRO: TIntegerField;
    qryDetalhesTEMPO_CHEGADA: TFloatField;
    qryDetalhesTEMPO_CONCLUSAO: TFloatField;
    qryDetalhesTEMPO_LANCAMENTO: TFloatField;
    qryDetalhesTEMPO_CICLO: TFloatField;
    qryDetalhesTEMPO_TECNICOS: TFloatField;
    qryDetalhesTEMPO_FORADOPRAZO: TFloatField;
    qryDetalhesDATAESTORNO: TDateTimeField;
    qryDetalhesUSUARIOESTORNO: TIBStringField;
    qryDetalhesFECHA_DATA_FLUXO: TDateTimeField;
    qryDetalhesFECHA_SEMANA_FLUXO: TIntegerField;
    qryDetalhesFECHA_MES_FLUXO: TIntegerField;
    qryDetalhesFECHA_TRIMESTRE_FLUXO: TIntegerField;
    qryDetalhesFECHA_QUADRIMESTRE_FLUXO: TIntegerField;
    qryDetalhesFECHA_SEMESTRE_FLUXO: TIntegerField;
    qryDetalhesFECHA_ANO_FLUXO: TIntegerField;
    qryDetalhesFECHA_STR_SEMANA_FLUXO: TIBStringField;
    qryDetalhesFECHA_STR_MES_FLUXO: TIBStringField;
    qryDetalhesFECHA_STR_BIMESTRE_FLUXO: TIBStringField;
    qryDetalhesFECHA_STR_TRIMESTRE_FLUXO: TIBStringField;
    qryDetalhesFECHA_STR_QUADRIMESTRE_FLUXO: TIBStringField;
    qryDetalhesFECHA_STR_SEMESTRE_FLUXO: TIBStringField;
    qryDetalhesFECHA_BIMESTRE_FLUXO: TIntegerField;
    qryDetalhesDEFEITO_DETECTADO: TIBStringField;
    qryDetalhesSERVICO_REALIZAR: TIBStringField;
    qryDetalhesAUTORIZADO: TIBStringField;
    qryDetalhesDATA_AUTORIZADO: TDateTimeField;
    qryDetalhesQUEM_AUTORIZOU: TIBStringField;
    qryDetalhesDATA_ENTREGA: TDateTimeField;
    qryDetalhesQUEM_ENTREGOU: TIBStringField;
    qryDetalhesQUEM_RECEBEU: TIBStringField;
    qryDetalhesNOTA_ENTRADA: TIntegerField;
    qryDetalhesCODPARCEIRO: TIntegerField;
    qryDetalhesPERCCOMIS_CALCULO: TIBStringField;
    qryDetalhesPERCCOMIS_PROD: TIBBCDField;
    qryDetalhesPERCCOMIS_PECA: TIBBCDField;
    qryDetalhesPERCCOMIS_SERV: TIBBCDField;
    qryDetalhesNO_VENDA: TIBStringField;
    qryDetalhesNO_ESTOQUE: TIBStringField;
    qryDetalhesNO_ICMS: TIBStringField;
    qryDetalhesNO_IPI: TIBStringField;
    qryDetalhesRETORNO: TIBStringField;
    qryDetalhesDATA_RETORNO: TDateTimeField;
    qryDetalhesFALAR_COM: TIBStringField;
    qryDetalhesQUEM_AGENDOU: TIBStringField;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOrdenarChange(Sender: TObject);
    procedure cmbSelecionarChange(Sender: TObject);
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
    procedure lblItensClick(Sender: TObject);
    procedure Imprimiroramento1Click(Sender: TObject);
    procedure Salvarcomopadro1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure Grade1Click(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure qryDetalhesAUTORIZADOChange(Sender: TField);
    procedure qryDetalhesRETORNOChange(Sender: TField);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldCLIENTEmudar(Sender: TField);
    procedure fldDESCONTOmudar(Sender: TField);
  public
    { Public declarations }
    inCliente: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formOrcamento: TformOrcamento;

implementation

uses data_principal, clientes, itsorcamento, relorcamento, os, gridreport;

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
     ( 'MOVIMENTOS',
       'CLIENTES'   );

  { entrada no registro do Windows }
  NomeCurto = 'orcamentos';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 5;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'        ; fisico: 'CODIGO'     ; iTab: 1),
       (rotulo: 'Data'          ; fisico: 'DATA'       ; iTab: 1),
       (rotulo: 'Status'        ; fisico: 'STATUS'     ; iTab: 1),
       (rotulo: 'Cliente'       ; fisico: 'NOME'       ; iTab: 2),
       (rotulo: 'Total'         ; fisico: 'VALOR_TOTAL'; iTab: 1) );

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '(MOVIMENTOS.CODCLIENTE = CLIENTES.CODIGO) AND ' +
                   '(MOVIMENTOS.ES = 0) AND (MOVIMENTOS.TIPO = 1) ';

  { indexes iniciais padrao para os combos }
  ixDefSel = 4;
  ixDefOrd = 2;

{######################################################################
 #                                                                    #
 #                 FINAL DO CÓDIGO CUSTOMIZÁVEL                       #
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

procedure TformOrcamento.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformOrcamento.btnAdicionarClick(Sender: TObject);
var
   filename: string;
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
     with qryDetalhes do
      begin
       DisableControls;
       ParamByName(ixCampos[1].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
      end;

//     { carrego os valores padrão para os memos }
//     try
//       filename := ExtractFilePath(ParamStr(0));
//       if filename[length(filename)] <> '\' then
//         filename := filename + '\';
//       or_cond1.lines.LoadFromFile(filename + 'ORCOND1.TXT');
//       or_cond2.lines.LoadFromFile(filename + 'ORCOND2.TXT');
//       qryDetalhes.fieldByName('CONDICOES1').AsString :=
//          or_cond1.lines.text;
//       qryDetalhes.fieldByName('CONDICOES2').AsString :=
//          or_cond2.lines.text;
//     except
//       on exception do beep;
//     end;

     { condições armazenadas no banco de dados }
     or_cond1.Lines.Text := dmoPrincipal.cdsConfig.fieldByName('OSCOND1').AsString;
     or_cond2.Lines.Text := dmoPrincipal.cdsConfig.fieldByName('OSCOND2').AsString;
     qryDetalhes.fieldByName('CONDICOES1').AsString := or_cond1.Lines.Text;
     qryDetalhes.fieldByName('CONDICOES2').AsString := or_cond2.Lines.Text;

     DBEdit14Enter(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformOrcamento.FormShow(Sender: TObject);
var
  i: byte;
begin
     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

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
     btnImprimir.Enabled := False;

     { desativo a ordenação e pesquisa }
     cmbOrdenar.Enabled := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { preparo a Query }
     qryDetalhes.Prepare;
     qryCliente.Prepare;
     qryDelete.Prepare;

     { forço atualização }
     cmbSelecionarChange(Sender);
     Screen.Cursor := crDefault;

     if inCliente > 0 then
       btnAdicionarClick(Sender);
end;

procedure TformOrcamento.FormCreate(Sender: TObject);
begin
     inCliente := 0;

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';

end;

procedure TformOrcamento.edtSelecionarKeyPress(Sender: TObject;
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
         StrSQL := StrSQL + ' WHERE (' +
           ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
         if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
             dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
           else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')';

         { empresa - select }
         StrSQL := StrSQL + ' AND (' + ixTabelas[1] + '.CODEMPRESA = ' +
           IntToStr(dmoPrincipal.empresa) + ')';

         { salvo antes do ORDER BY }
         tmpSQLSel := StrSQL;

         { cláusula ORDER BY }
         tmpSQLOrd := ' ORDER BY ' +
            ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
            ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;

         SQL.Clear;
         SQL.Add(tmpSQLSel + tmpSQLOrd);
         open;

         if not IsEmpty then
          begin
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

procedure TformOrcamento.cmbOrdenarChange(Sender: TObject);
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

procedure TformOrcamento.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformOrcamento.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformOrcamento.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformOrcamento.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformOrcamento.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformOrcamento.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformOrcamento.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     with Dataset do
//       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TNumericField).DisplayFormat := '#,##0.00';

end;

procedure TformOrcamento.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    with Dataset do
     begin
      { orçamento não é entrada nem saída }
      fieldByName('CODEMPRESA').AsInteger := dmoPrincipal.empresa;
      fieldByName('ES').AsInteger := 0;
      fieldByName('PRIORIDADE').AsInteger := 1;
      { tipo 1 = orçamento }
      fieldByName('TIPO').AsInteger := 1;
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
      fieldByName('STATUS').AsString := 'N/F';
      fieldByName('CONDICAO').AsString := '0/';
      fieldByName('DESCONTOTXT').AsString := 'DESCONTO';
      fieldByName('NOTA_PESOBRUTO').AsCurrency := 0.0;
      fieldByName('NOTA_PESOLIQUIDO').AsCurrency := 0.0;

      fieldByName('NOTA_DATASAIDA').AsDateTime :=
         dmoPrincipal.GetServerTime;
      fieldByName('ICMSSIMPLES').AsString := 'N';
      fieldByName('ICMSSIMPALIQ').AsCurrency := 0.0;
      fieldByName('ISSALIQ').AsCurrency := 0.0;
      fieldByName('NOTA_BASEICMS').AsCurrency := 0.0;
      fieldByName('NOTA_BASEICMSSUBST').AsCurrency := 0.0;
      fieldByName('NOTA_VALORICMSSUBST').AsCurrency := 0.0;
      fieldByName('VALOR_IPI').AsCurrency := 0.0;
      fieldByName('GARANTIA').AsString := 'N';
      fieldByName('EMPRESTIMO').AsString := 'N';
      fieldByName('VALOR_COMISSAO').AsCurrency := 0.0;

      fieldByName('NOTA_CODNATUOPER').AsString :=
           dmoPrincipal.cdsConfig.fieldByName('NATUOPER_PADRAO').AsString;

      fieldByName('CODCENTRO').AsInteger := 1;
      fieldByName('OSTIPO').AsInteger    := 99;

      if inCliente > 0 then
        fieldByName('CODCLIENTE').AsInteger := inCliente;

     end;

    inCliente := 0;

end;

procedure TformOrcamento.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformOrcamento.btnExcluirClick(Sender: TObject);
begin
   if dmoPrincipal.Pergunta('Se você excluir este orçamento #, todos os itens ' +
      'dele também serão excluídos.' + #10 + #13 + #10 + #13 +
      'Tem certeza que deseja excluir o orçamento?', 'Excluir', 2) = IDYES then
    begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     qryDelete.ParamByName('cod').AsInteger :=
       qryDetalhes.fieldByName('CODIGO').AsInteger;
     qryDelete.ExecSQL;
     dbnDetalhes.BtnClick(nbDelete);
     dmoPrincipal.SalvarRegistro(qryDetalhes);
     qryDetalhes.Close;
     qryCliente.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
    end;
end;

procedure TformOrcamento.btnCancelarClick(Sender: TObject);
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
       dmoPrincipal.CancelarSequencia(ixTabelas[1],
         qryDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;
     qryCliente.Close;
     
     Screen.Cursor := crDefault;
end;

procedure TformOrcamento.btnModificarClick(Sender: TObject);
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

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       ParamByName(ixCampos[1].fisico).AsInteger :=
         qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
       Open;
      end;
     if not (qryDetalhes.State in [dsEdit, dsInsert]) then
        dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformOrcamento.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

       { rotinas de chamada }
       fieldByName('CODCLIENTE').OnChange := fldCLIENTEmudar;
       fieldByName('DESCONTO').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_ITENS').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_SERVICOS').OnChange := fldDESCONTOmudar;

       { forço a primeira chamada }
       fldCLIENTEmudar(fieldByName('CODCLIENTE'));

      end;


end;

procedure TformOrcamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformOrcamento.fldCLIENTEmudar(Sender: TField);
begin
  qryCliente.Close;

  if Sender.AsString > '' then
   with qryCliente do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;
end;

procedure TformOrcamento.fldDESCONTOmudar(Sender: TField);
begin
  with qryDetalhes do
    fieldByName('VALOR_TOTAL').AsCurrency :=
      (fieldByName('VALOR_ITENS').AsCurrency +
      fieldByName('VALOR_SERVICOS').AsCurrency) -
      fieldByName('DESCONTO').AsCurrency;
end;

procedure TformOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
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

     if qryDetalhes.Active and (Shift = [ssCtrl]) then
      case Key of
       67: lblCLIENTEClick(Sender);
      end;
     if (not qryDetalhes.Active) and (Shift = [ssCtrl]) then
      case Key of
       73: lblITENSClick(Sender);
      end;
end;

procedure TformOrcamento.edtPesquisarEnter(Sender: TObject);
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

procedure TformOrcamento.edtPesquisarExit(Sender: TObject);
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

procedure TformOrcamento.btnSalvarClick(Sender: TObject);
const
   myEnter: Char = #13;
begin
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

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { verifico se é necessario ativar o grid }
     if not grdDados.Visible then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := qryDetalhes.fieldByName(ixCampos[1].fisico).asstring;
       edtSelecionarKeyPress(Sender, myEnter);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Clear;
      end;

     if edtPesquisar.Canfocus then cmbOrdenarChange(Sender);
     qrySelecionar.Locate(ixCampos[1].fisico,
         qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformOrcamento.lblCLIENTEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;

       { JumpStart }
       inCliente := Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger;

       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformOrcamento.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryCliente.Active then qryCliente.Close;
     qryDetalhes.Unprepare;
     qryCliente.Unprepare;
     qryDelete.Unprepare;
end;


procedure TformOrcamento.Label17Click(Sender: TObject);
begin
     with TformITorcamento.Create(Self) do
      try
       inOrcamento := Self.qryDetalhes.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
        [Self.qryDetalhes.fieldByName('CODIGO').AsInteger]),
        Format('Orçamento %d - %s', [Self.qryDetalhes.fieldByName('CODIGO').AsInteger,
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

procedure TformOrcamento.lblItensClick(Sender: TObject);
var
  codigo: longint;
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty  then
     with TformITorcamento.Create(Self) do
      try
       inOrcamento := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Itens do orçamento %d - %s',
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

     { volto o ponteiro onde ele estava }
     with qrySelecionar do
      begin
       codigo := fieldbyName('CODIGO').AsInteger;
       close;
       open;
       if not locate('CODIGO', codigo, []) then beep;
      end;

end;

procedure TformOrcamento.Imprimiroramento1Click(Sender: TObject);
var
  codigo: longint;
begin
     codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
     with TrelatOrcamento.Create(Self) do
      try
       qryOrcamento.ParamByName('codigo').AsInteger := codigo;
       qryOrcamento.open;
       Preview;
      finally
       free;
      end;
end;

procedure TformOrcamento.Salvarcomopadro1Click(Sender: TObject);
begin
     ShowMessage((Sender as TDBMemo).Name);
end;


procedure TformOrcamento.SpeedButton1Click(Sender: TObject);
var
   filename: string;
begin
   if dmoPrincipal.Pergunta('#, você tem certeza que deseja salvar este texto de ' +
      '"Condições Gerais" como padrão dos orçamentos?', 'Salvar', 2) = IDYES then
    begin
     filename := ExtractFilePath(ParamStr(0));
     if filename[length(filename)] <> '\' then
       filename := filename + '\';
     filename := filename + 'ORCOND1.TXT';
     or_cond1.lines.SaveToFile(filename);
    end;
end;

procedure TformOrcamento.SpeedButton2Click(Sender: TObject);
var
   filename: string;
begin
   if dmoPrincipal.Pergunta('#, você tem certeza que deseja salvar este texto de ' +
      '"Condições de Pagamento" como padrão dos orçamentos?', 'Salvar', 2) = IDYES then
    begin
     filename := ExtractFilePath(ParamStr(0));
     if filename[length(filename)] <> '\' then
       filename := filename + '\';
     filename := filename + 'ORCOND2.TXT';
     or_cond2.lines.SaveToFile(filename);
    end;
end;



procedure TformOrcamento.SpeedButton3Click(Sender: TObject);
var
   filename: string;
begin
   if dmoPrincipal.Pergunta('#, você está prestes a substituir o texto de ' +
      '"Condições Gerais" pelo texto padrão. Continuar?', 'Salvar', 2) = IDYES then
    begin
     filename := ExtractFilePath(ParamStr(0));
     if filename[length(filename)] <> '\' then
       filename := filename + '\';
     filename := filename + 'ORCOND1.TXT';
     or_cond1.lines.LoadFromFile(filename);
     qryDetalhes.FieldByName('CONDICOES1').AsString :=
       or_cond1.lines.text;
    end;
end;

procedure TformOrcamento.SpeedButton4Click(Sender: TObject);
var
   filename: string;
begin
   if dmoPrincipal.Pergunta('#, você está prestes a substituir o texto de ' +
      '"Condições de Pagamento" pelo texto padrão. Continuar?', 'Salvar',
      2) = IDYES then
    begin
     filename := ExtractFilePath(ParamStr(0));
     if filename[length(filename)] <> '\' then
       filename := filename + '\';
     filename := filename + 'ORCOND2.TXT';
     or_cond2.lines.LoadFromFile(filename);
     qryDetalhes.FieldByName('CONDICOES2').AsString :=
       or_cond2.lines.text;
    end;
end;

procedure TformOrcamento.Label16Click(Sender: TObject);
var
   n: longint;
begin
 if dmoPrincipal.Pergunta('Olá #. Você me pediu para transformar este ' +
   'orçamento em uma Ordem de Serviço aberta. Se os produtos não estiverem ' +
   'disponíveis no estoque esta tarefa não poderá ser concluída.' + #13#10#13#10 +
   'Deseja continuar?', 'Orçamento -> OS', 2) = IDYES then
  begin

   n := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;

   with spOS do
    begin
     paramByName('CODMOVIMENTO').AsInteger := n;

     try
       if not Transaction.InTransaction then
         Transaction.StartTransaction;
       Prepare;
       ExecProc;
       if prepared then unprepare;
       Transaction.CommitRetaining;
     except
       on exception do
        begin
         if prepared then unprepare;
         Transaction.RollbackRetaining;
         ShowMessage('Não foi possível transportar esta OS.' + #13+#10+
           'Não existem os produtos indicados no estoque ou houve um ' +
           'erro que não pode ser classificado.');
         exit;
        end;
     end;

     if paramByName('TODOS').AsString = 'N' then
      ShowMessage('Nem todos os produtos puderam ser transportados.' +
         #13+#10+
         'Existem produtos individuais com número de série único que ' +
         'deverão ser lançados manualmente depois.');

    end;

   with TformOS.Create(Self) do
    try
      OrcamentoOS := True;
      codOrcamento := n;
      DateEdit2.Text := DateToStr(dmoPrincipal.GetServerTime + 1);
      Caption := Self.Caption + ' -> ' + Caption;
      showmodal;
    finally
      release;
    end;

   with qrySelecionar do
    begin
     close;
     open;
    end;

  end;
end;

procedure TformOrcamento.DBEdit14Enter(Sender: TObject);
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

procedure TformOrcamento.grdDadosDblClick(Sender: TObject);
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

procedure TformOrcamento.Grade1Click(Sender: TObject);
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

procedure TformOrcamento.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformOrcamento.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformOrcamento.qryDetalhesAUTORIZADOChange(Sender: TField);
begin
  if (qryDetalhes.fieldByName('AUTORIZADO').AsString = 'S') and
     (qryDetalhes.state = dsEdit) then
    qryDetalhes.fieldByName('DATA_AUTORIZADO').AsDateTime :=
      dmoPrincipal.GetServerTime;
end;

procedure TformOrcamento.qryDetalhesRETORNOChange(Sender: TField);
begin
  if (qryDetalhes.fieldByName('RETORNO').AsString = 'S') and
     (qryDetalhes.State = dsEdit) then
   begin
     qryDetalhes.fieldByName('DATA_RETORNO').AsDateTime :=
       dmoPrincipal.GetServerTime + 30;
     qryDetalhes.fieldByName('QUEM_AGENDOU').AsString :=
       dmoPrincipal.GetLogUser;
   end;
end;

end.
