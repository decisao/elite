unit contaspagas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, DbPrgrss, CurrEdit, RXDBCtrl, ToolEdit, IBUpdateSQL, IBDatabase,
  gridreport;

type
  TformContasPagas = class(TForm)
    pgcDados: TPageControl;
    tabVisual: TTabSheet;
    tabDetalhe: TTabSheet;
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    btnSalvar: TToolbarButton97;
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
    Label24: TLabel;
    Label25: TLabel;
    Panel3: TPanel;
    lblWhere: TLabel;
    grdDados: Tzebdbgrid;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    ckEmpresa: TCheckBox;
    qryDetalhesCODIGO: TIntegerField;
    qryDetalhesCODMOVIMENTO: TIntegerField;
    qryDetalhesNUMERO: TSmallintField;
    qryDetalhesDESCRICAO: TIBStringField;
    qryDetalhesES: TSmallintField;
    qryDetalhesDATACADAST: TDateTimeField;
    qryDetalhesVALOR: TIBBCDField;
    qryDetalhesCODDOCUMENTO: TIntegerField;
    qryDetalhesINFODOC: TIBStringField;
    qryDetalhesEXTERNO: TIBStringField;
    qryDetalhesARQUIVO: TIBStringField;
    qryDetalhesHISTORICO: TIBStringField;
    qryDetalhesPAGO: TSmallintField;
    qryDetalhesDATAPAGO: TDateTimeField;
    qryDetalhesDESCONTO: TIBBCDField;
    qryDetalhesMULTA_JUROS: TIBBCDField;
    qryDetalhesTOTAL_PAGO: TIBBCDField;
    qryDetalhesDATAVENCIMENTO: TDateTimeField;
    qryDetalhesSTATUS: TIBStringField;
    qryDetalhesSALDOANT: TIBBCDField;
    qryDetalhesSALDOATU: TIBBCDField;
    qryDetalhesCODCONTA: TIntegerField;
    qryDetalhesCODLANCTO: TIntegerField;
    qryDetalhesNOMEUSUARIO: TIBStringField;
    qryDetalhesCODEMPRESA: TIntegerField;
    qryDetalhesVALOR_COMISSAO: TIBBCDField;
    qryDetalhesTIPO_PAG: TIBStringField;
    qryDetalhesTIPO_DOC: TIBStringField;
    qryDetalhesCH_BANCO: TIntegerField;
    qryDetalhesCH_AGENCIA: TIntegerField;
    qryDetalhesCH_CONTA: TIntegerField;
    qryDetalhesCH_SERIE: TIBStringField;
    qryDetalhesCH_NUMERO: TIntegerField;
    qryDetalhesCODCENTRO: TIntegerField;
    qryDetalhesCODCLIENTE: TIntegerField;
    traEmpresa: TIBTransaction;
    qryEmpresa: TIBQuery;
    dsrEmpresa: TDataSource;
    traMovimento: TIBTransaction;
    qryMovimento: TIBQuery;
    dsrMovimento: TDataSource;
    traCliente: TIBTransaction;
    qryCliente: TIBQuery;
    dsrCliente: TDataSource;
    pnlEmpresa: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    pnlVenda: TPanel;
    lblVendaOS: TLabel;
    dedVendaOS: TDBEdit;
    lblParcela: TLabel;
    dedParcela: TDBEdit;
    lblCliente: TLabel;
    dedCliente: TDBEdit;
    lblDataFechamento: TLabel;
    dedDataFechamento: TDBEdit;
    pnlPessoa: TPanel;
    lblPessoa: TLabel;
    dedPessoa: TDBEdit;
    dedNomePessoa: TDBEdit;
    dedTelefone: TDBEdit;
    lblTelefone: TLabel;
    pnlDados: TPanel;
    lblHistorico: TLabel;
    DBEdit4: TDBEdit;
    Label17: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBDateEdit1: TDBDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    RxDBCalcEdit1: TRxDBCalcEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    traDocumento: TIBTransaction;
    qryDocumento: TIBQuery;
    dsrDocumento: TDataSource;
    qryDetalhesDOCUMENTO: TStringField;
    traCentro: TIBTransaction;
    qryCentro: TIBQuery;
    dsrCentro: TDataSource;
    qryDetalhesCENTRO: TStringField;
    pnlCheque: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBEdit11: TDBEdit;
    traBanco: TIBTransaction;
    qryBanco: TIBQuery;
    dsrBanco: TDataSource;
    Label20: TLabel;
    DBEdit12: TDBEdit;
    pnlOutros: TPanel;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    updSelecionar: TIBUpdateSQL;
    traPlano: TIBTransaction;
    qryPlano: TIBQuery;
    dsrPlano: TDataSource;
    qryDetalhesCODPLANO: TIntegerField;
    Label22: TLabel;
    DBEdit14: TDBEdit;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    Label26: TLabel;
    DBEdit16: TDBEdit;
    traConta: TIBTransaction;
    qryConta: TIBQuery;
    dsrConta: TDataSource;
    Panel4: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    DateEdit2: TDateEdit;
    DateEdit1: TDateEdit;
    ckCadastro: TCheckBox;
    Panel5: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ckVencimento: TCheckBox;
    Panel6: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    ckPagamento: TCheckBox;
    traEstorno: TIBTransaction;
    spEstorno: TIBStoredProc;
    ToolbarSep972: TToolbarSep97;
    btnExcluir: TToolbarButton97;
    pnlOrigem: TPanel;
    Label31: TLabel;
    lblOrigem: TLabel;
    qryDetalhesESTORNO_CODUSUARIO: TIntegerField;
    qryDetalhesESTORNO_DATA: TDateTimeField;
    qryDetalhesESTORNO_CODESTORNO: TIntegerField;
    qryDetalhesESTORNO_CODRELANC: TIntegerField;
    qryDetalhesESTORNO_NOMEUSER: TIBStringField;
    qryDetalhesCODORIGEM: TIntegerField;
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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure qryDetalhesAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure cmbDataChange(Sender: TObject);
    procedure DateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Label11Click(Sender: TObject);
    procedure lblVendaOSClick(Sender: TObject);
    procedure ckEmpresaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryMovimentoAfterOpen(DataSet: TDataSet);
    procedure qryDocumentoAfterOpen(DataSet: TDataSet);
    procedure qryDetalhesBeforeOpen(DataSet: TDataSet);
    procedure qryDetalhesAfterClose(DataSet: TDataSet);
    procedure Label17Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure lblPessoaClick(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldCODCLIENTEmudar(Sender: TField);
    procedure fldCODDOCUMENTOmudar(Sender: TField);
    procedure fldCH_BANCOmudar(Sender: TField);
    procedure fldCODPLANOmudar(Sender: TField);
  public
    { Public declarations }
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formContasPagas: TformContasPagas;

implementation

uses data_principal, documentos, compras, centros, bancos, clientes,
  plancontas;


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
  tblCount  = 3;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'PAGAMENTOS',
       'CLIENTES',
       'DOCUMENTOS' );

  { entrada no registro do Windows }
  NomeCurto = 'contapagar';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 11;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'       ; fisico: 'CODIGO'        ; iTab: 1),
       (rotulo: 'Vencimento'   ; fisico: 'DATAVENCIMENTO'; iTab: 1),
       (rotulo: 'Pagto'        ; fisico: 'DATAPAGO'      ; iTab: 1),
       (rotulo: 'Valor'        ; fisico: 'TOTAL_PAGO'    ; iTab: 1),
       (rotulo: 'Venda/OS'     ; fisico: 'CODMOVIMENTO'  ; iTab: 1),
       (rotulo: '#'            ; fisico: 'NUMERO'        ; iTab: 1),
       (rotulo: 'Cliente'      ; fisico: 'NOME'          ; iTab: 2),
       (rotulo: 'Documento'    ; fisico: 'DOCUMENTO'     ; iTab: 3),
       (rotulo: 'Cheque Banco' ; fisico: 'CH_BANCO'      ; iTab: 1),
       (rotulo: 'Cheque Número'; fisico: 'CH_NUMERO'     ; iTab: 1),
       (rotulo: 'Histórico'    ; fisico: 'DESCRICAO'     ; iTab: 1));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '(CLIENTES.CODIGO = PAGAMENTOS.CODCLIENTE) AND ' +
                   '(DOCUMENTOS.CODIGO = PAGAMENTOS.CODDOCUMENTO) AND ' +
                   '(ES = 1) AND (PAGO = 1)';

  { indexes iniciais padrao para os combos }
  ixDefSel = 7;
  ixDefOrd = 3;

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

procedure TformContasPagas.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformContasPagas.btnAdicionarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Adicionar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       DisableControls;
       ParamByName(ixCampos[1].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
      end;
     DBEdit4.SetFocus;
     Screen.Cursor := crDefault;
end;

procedure TformContasPagas.FormShow(Sender: TObject);
var
  i: byte;
begin
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
//     btnAdicionar.Enabled := True;
     btnModificar.Enabled := False;
     btnImprimir.Enabled  := False;

     { desativo a ordenação e pesquisa }
     cmbOrdenar.Enabled   := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { forço atualização }
     cmbSelecionarChange(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformContasPagas.FormCreate(Sender: TObject);
begin

   { defino a atualização das informações }
   with formStorage do
    begin
     IniSection := NomeCurto;
     Active := True;
    end;

   { inicializo a expressão dinâmica do WHERE }
   WhereArgDynamic := '';

end;

procedure TformContasPagas.edtSelecionarKeyPress(Sender: TObject;
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

         { argumento especial da DATACADAST }
         if ckCadastro.Checked then
           if (dmoPrincipal.Interdata(dateedit1.text) > '') and
              (dmoPrincipal.Interdata(dateedit2.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(PAGAMENTOS.DATACADAST AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit1.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit2.text) + ''')';

         { argumento especial da DATAVENCIMENTO }
         if ckVencimento.Checked then
           if (dmoPrincipal.Interdata(dateedit3.text) > '') and
              (dmoPrincipal.Interdata(dateedit4.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(DATAVENCIMENTO AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit3.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit4.text) + ''')';

         { argumento especial da DATAPAGO }
         if ckPagamento.Checked then
           if (dmoPrincipal.Interdata(dateedit5.text) > '') and
              (dmoPrincipal.Interdata(dateedit6.text) > '') then
           StrSQL := StrSQL + ' AND (CAST(DATAPAGO AS DATE) BETWEEN ''' +
               dmoPrincipal.Interdata(dateedit5.text) + ''' AND ''' +
               dmoPrincipal.Interdata(dateedit6.text) + ''')';

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')';

         { empresa - select }
         if not ckEmpresa.Checked then
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
//           btnAdicionar.Enabled := True;
           btnModificar.Enabled := True;
           btnImprimir.Enabled := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled := True;
           grdDados.Visible := True;
          end;
        end;

       if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
       Screen.Cursor := crDefault;

      end;
end;

procedure TformContasPagas.cmbOrdenarChange(Sender: TObject);
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
     if edtPesquisar.CanFocus then edtPesquisar.SetFocus;
end;

procedure TformContasPagas.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformContasPagas.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformContasPagas.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformContasPagas.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformContasPagas.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformContasPagas.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformContasPagas.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformContasPagas.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
   qrySelecionar.tag := 0;
   { preencho os nomes reais dos campos }
   for i := 1 to ixMaximo do
    qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
      ixCampos[i].rotulo;

   with grdDados do
    begin
     Columns[0].Width           := 0;
     Columns[1].Width           := 80;
     Columns[1].Title.Alignment := taRightJustify;
     Columns[1].Alignment       := taRightJustify;
     Columns[2].Width           := 80;
     Columns[2].Title.Alignment := taRightJustify;
     Columns[2].Alignment       := taRightJustify;
     Columns[3].Width           := 80;
     Columns[3].Title.Alignment := taRightJustify;
     Columns[3].Alignment       := taRightJustify;
     Columns[4].Width           := 65;
     Columns[4].Title.Alignment := taRightJustify;
     Columns[4].Font.Style      := [fsBold];
     Columns[5].Width           := 20;
     Columns[5].Title.Alignment := taCenter;
     Columns[5].Font.Style      := [fsBold];
    end;

   with Dataset do
    begin
     (fieldByName('DATAVENCIMENTO') as TDateTimeField).DisplayFormat := 'DD/MM/YYYY';
     (fieldByName('DATAPAGO')       as TDateTimeField).DisplayFormat := 'DD/MM/YYYY';
     (fieldByName('TOTAL_PAGO')     as TNumericField).DisplayFormat  := '#,##0.00';
    end
end;

procedure TformContasPagas.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    with Dataset do
     begin
      fieldByName('CODEMPRESA').AsInteger       := dmoPrincipal.empresa;
      fieldByName(ixCampos[1].fisico).AsInteger :=
        dmoPrincipal.LerSequencia(ixTabelas[1]);
      fieldByName('NUMERO').AsInteger           := 1;
      fieldByName('ES').AsInteger               := 2;
      fieldByName('DATACADAST').AsDateTime      := dmoPrincipal.GetServerTime;
      fieldByName('EXTERNO').AsString           := 'S';
      fieldByName('PAGO').AsInteger             := 0;
      fieldByName('MULTA_JUROS').AsCurrency     := 0;
      fieldByName('DESCONTO').AsCurrency        := 0;
      fieldByName('CODCONTA').AsInteger         :=
        dmoPrincipal.cdsConfig.fieldByname('CODCONTA_VENDACRE').AsInteger;

      fieldByName('SALDOANT').AsCurrency        := 0;
      fieldByName('SALDOATU').AsCurrency        := 0;
     end;

   with qryEmpresa do
    begin
     if active then close;
     open;
    end;

end;

procedure TformContasPagas.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformContasPagas.btnCancelarClick(Sender: TObject);
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

     Screen.Cursor := crDefault;
end;

procedure TformContasPagas.btnModificarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Modificar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       ParamByName(ixCampos[1].fisico).AsInteger :=
         qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
       Open;
      end;
     dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformContasPagas.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
   with Dataset do
    begin

       { Pessoa ou Venda? }
       pnlDados.Visible     := False;
       pnlPessoa.Visible    := fieldByName('CODMOVIMENTO').IsNull;
       pnlVenda.Visible     := not pnlPessoa.Visible;
       lblHistorico.Enabled := pnlPessoa.Visible;
       pnlDados.Visible     := True;

       { mascaras }
       (fieldByname('DATACADAST') as TDateTimeField).DisplayFormat :=
          'DD/MM/YY HH:NN';
       (fieldByname('DATAPAGO') as TDateTimeField).DisplayFormat :=
          'DD/MM/YY HH:NN';

       { rotinas de chamada }
       fieldByName('CODDOCUMENTO').OnChange := fldCODDOCUMENTOmudar;
       fieldByName('CODCLIENTE').OnChange := fldCODCLIENTEmudar;
       fieldByName('CH_BANCO').OnChange := fldCH_BANCOmudar;
       fieldByName('CODPLANO').OnChange := fldCODPLANOmudar;

       { forço a primeira chamada }
       fldCODDOCUMENTOmudar(fieldByName('CODDOCUMENTO'));
       fldCODCLIENTEmudar(fieldByName('CODCLIENTE'));
       fldCH_BANCOmudar(fieldByName('CH_BANCO'));
       fldCODPLANOmudar(fieldByName('CODPLANO'));

       if fieldByName('CODORIGEM').asInteger > 0 then
        begin
          pnlOrigem.Visible := True;
          lblOrigem.Caption := 'CONTA Nº ' +
            fieldByName('CODORIGEM').AsString;
        end else pnlOrigem.Visible := False;

    end;


   with qryEmpresa do
    begin
     if active then close;
     open;
    end;

   with qryMovimento do
    begin
     if active then close;
     open;
    end;

   with qryConta do
    begin
     if active then close;
     open;
    end;

end;

procedure TformContasPagas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformContasPagas.FormKeyDown(Sender: TObject; var Key: Word;
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

     if key = vk_Return then
      if shift = [] then Perform(wm_NextDlgCtl, 0, 0) else
       if shift = [ssShift] then Perform(wm_NextDlgCtl, 0, 0);

     if not odd(atag) then
      begin
       case key of
        vk_Down: Perform(wm_NextDlgCtl, 0, 0);
        vk_Up: Perform(wm_NextDlgCtl, 1, 0);
       end;
      end;

end;

procedure TformContasPagas.edtPesquisarEnter(Sender: TObject);
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

procedure TformContasPagas.edtPesquisarExit(Sender: TObject);
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

procedure TformContasPagas.btnSalvarClick(Sender: TObject);
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

     qryDetalhes.Close;

     updSelecionar.RefreshSQL.Clear;
     updSelecionar.RefreshSQL.Add(
       tmpSQLSel +
       ' AND PAGAMENTOS.CODIGO = ' +
       qrySelecionar.fieldByName('CODIGO').AsString
     );
     qrySelecionar.refresh;

     Screen.Cursor := crDefault;

end;

procedure TformContasPagas.grdDadosDblClick(Sender: TObject);
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

procedure TformContasPagas.cmbDataChange(Sender: TObject);
var
  Key: char;
begin
  Key := #13;
  edtSelecionarKeyPress(Sender, Key);
end;

procedure TformContasPagas.DateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  edtSelecionarKeyPress(Sender, Key);
end;

procedure TformContasPagas.Label11Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformDocumentos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODDOCUMENTO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformContasPagas.lblVendaOSClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformCompras.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       CompraOpen := True;
       codCompra :=
          Self.qryDetalhes.fieldByname('CODMOVIMENTO').AsInteger;
       ShowModal;
      finally
       release;
      end;
end;

procedure TformContasPagas.fldCODDOCUMENTOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryDetalhes do
    begin
      if state in [dsInsert, dsEdit] then
       begin
         fieldByName('TIPO_PAG').AsString :=
           qryDocumento.fieldByName('TIPO_PAG').AsString;
         fieldByName('TIPO_DOC').AsString :=
           qryDocumento.fieldByName('TIPO_DOC').AsString;
       end;
      pnlCheque.Visible := (fieldByName('TIPO_DOC').AsString = 'C');
    end;

end;

procedure TformContasPagas.fldCODCLIENTEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryCliente do
    begin
     if active then close;
     open;
    end;
end;

procedure TformContasPagas.fldCH_BANCOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryBanco do
    begin
     if active then close;
     open;
    end;
end;

procedure TformContasPagas.ckEmpresaClick(Sender: TObject);
const
  key: char = #13;
begin
  edtSelecionarKeyPress(Sender, Key);
end;

procedure TformContasPagas.btnImprimirClick(Sender: TObject);
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

procedure TformContasPagas.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformContasPagas.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformContasPagas.FormDestroy(Sender: TObject);
begin
  if qrySelecionar.Active then
    qrySelecionar.Close;

end;

procedure TformContasPagas.qryMovimentoAfterOpen(DataSet: TDataSet);
begin
  with Dataset do
   (fieldByname('DATAFECHAMENTO') as TDateTimeField).DisplayFormat :=
     'DD/MM/YY HH:NN';
end;

procedure TformContasPagas.qryDocumentoAfterOpen(DataSet: TDataSet);
begin
  (Dataset as TIBQuery).FetchAll;
end;

procedure TformContasPagas.qryDetalhesBeforeOpen(DataSet: TDataSet);
begin
  with qryDocumento do
   begin
    if active then close;
    open;
   end;
  with qryCentro do
   begin
    if active then close;
    open;
   end;
end;

procedure TformContasPagas.qryDetalhesAfterClose(DataSet: TDataSet);
begin
  if qryDocumento.Active then
    qryDocumento.Close;
  if qryCentro.Active then
    qryCentro.Close;
end;

procedure TformContasPagas.Label17Click(Sender: TObject);
begin
     with TformCentros.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       SetWhereDynamic(
        Format('(TIPO = ''%s'')', ['C']),
        Format('Centro de custo para Contas a Pagar', [])
       );
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCENTRO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformContasPagas.Label8Click(Sender: TObject);
begin
     with TformBancos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       SetWhereDynamic('',
        'Banco de Emissão do Cheque'
       );
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CH_BANCO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformContasPagas.lblPessoaClick(Sender: TObject);
begin
     with TformClientes.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;

       { JumpStart }
       if Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger <>
         dmoPrincipal.cdsConfig.fieldByName('CODCLIENTE_PADRAO').AsInteger then
           inCliente := Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger
       else
           inCliente := 0;

       ShowModal;
       if (ModalResult = mrOk) and (cdsSelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCLIENTE').AsInteger :=
           cdsSelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformContasPagas.Label20Click(Sender: TObject);
begin
     with TformPlanContas.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       SetWhereDynamic(
        Format('(TIPO in (%s))', ['''D'',''X''']),
        Format('Planos para Contas a Pagar', [])
       );
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODPLANO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformContasPagas.fldCODPLANOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryPlano do
    begin
     if active then close;
     open;
    end;
end;

procedure TformContasPagas.btnExcluirClick(Sender: TObject);
begin
  if dmoPrincipal.Pergunta('Deseja mesmo fazer o estorno dessa conta?',
    'Estorno', 0) = IDYES then
   with spEstorno do
    try
      Screen.Cursor := crHourGlass;
      if not Transaction.InTransaction then
        Transaction.StartTransaction;
      ParamByName('CODUSUARIO').AsInteger :=
        dmoPrincipal.cdsVendedor.fieldByName('CODIGO').AsInteger;
      ParamByName('CODIGO').AsInteger :=
        qryDetalhes.FieldByName('CODIGO').AsInteger;
      ExecProc;
      Transaction.Commit;
      qryDetalhes.Close;

      with pgcDados do
       begin
        tabVisual.TabVisible := True;
        ActivePage := Pages[0];
        tabDetalhe.TabVisible := False;
       end;

      Screen.Cursor := crDefault;
    except
      on exception do
       begin
         Screen.Cursor := crDefault;
         ShowMessage('Erro ao efetuar estorno.');
         Transaction.Rollback;
       end;
    end;
end;

end.
