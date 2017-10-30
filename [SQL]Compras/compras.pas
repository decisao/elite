unit compras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, Buttons, ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppDB,
  MemTable, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppModule, daDatMod, ppBarCod, RxMemDS, IBUpdateSQL, IBDatabase, gridreport;

type
  TformCompras = class(TForm)
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
    lblFORNECEDOR: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Panel3: TPanel;
    grdDados: Tzebdbgrid;
    lblWhere: TLabel;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    qryFornecedor: TIBQuery;
    dsrFornecedor: TDataSource;
    Imprimiroramento1: TMenuItem;
    ppDBPipeline: TppDBPipeline;
    qryEtiqueta: TIBQuery;
    dsrEtiqueta: TDataSource;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppDBBarCode1: TppDBBarCode;
    memEtiqueta: TRxMemoryData;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traFornecedor: TIBTransaction;
    traEtiqueta: TIBTransaction;
    N2: TMenuItem;
    Grade1: TMenuItem;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnAreas: TToolbarButton97;
    btnArquivos: TToolbarButton97;
    EmitirNotadeEntrada1: TMenuItem;
    pgcDetalhes: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    traCentro: TIBTransaction;
    qryCentro: TIBQuery;
    dsrCentro: TDataSource;
    ppReport3x10: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBBarCode2: TppDBBarCode;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    N3: TMenuItem;
    Imprimiretiquetas3x101: TMenuItem;
    ppDBText1: TppDBText;
    memEtiquetaBARRA: TStringField;
    memEtiquetaCODIGO: TIntegerField;
    ppDBText2: TppDBText;
    ppReportPreco: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand3: TppFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    Imprimiretiquetaspreo4x201: TMenuItem;
    ppReport3x10preco: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppColumnHeaderBand4: TppColumnHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppDBBarCode3: TppDBBarCode;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppColumnFooterBand4: TppColumnFooterBand;
    ppFooterBand4: TppFooterBand;
    Imprimiretiquetaspreo3x101: TMenuItem;
    memEtiquetaPRECO: TStringField;
    memEtiquetaFONE: TStringField;
    memEtiquetaDESCRICAO: TStringField;
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
    procedure lblFORNECEDORClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure lblItensClick(Sender: TObject);
    procedure Imprimiroramento1Click(Sender: TObject);
    procedure Salvarcomopadro1Click(Sender: TObject);
    procedure qryEtiquetaAfterOpen(DataSet: TDataSet);
    procedure ppDBBarCode1Print(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure Grade1Click(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure EmitirNotadeEntrada1Click(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure Label19Click(Sender: TObject);
    procedure Imprimiretiquetas3x101Click(Sender: TObject);
    procedure Imprimiretiquetaspreo4x201Click(Sender: TObject);
    procedure Imprimiretiquetaspreo3x101Click(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldCLIENTEmudar(Sender: TField);
    procedure fldDESCONTOmudar(Sender: TField);
    procedure fldCODCENTROmudar(Sender: TField);
  public
    { Public declarations }
    CompraOpen: boolean;
    CodCompra: integer;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formCompras: TformCompras;

implementation

uses data_principal, clientes, itcompra, comprapag, imprimirnota, centros;

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
  NomeCurto = 'compras';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 5;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'        ; fisico: 'CODIGO'          ; iTab: 1),
       (rotulo: 'Data'          ; fisico: 'DATA'            ; iTab: 1),
       (rotulo: 'Fornecedor'    ; fisico: 'NOME'            ; iTab: 2),
       (rotulo: 'Nota fiscal'   ; fisico: 'NOTA_NUMERO'     ; iTab: 1),
       (rotulo: 'Total'         ; fisico: 'NOTA_VALOR_TOTAL'; iTab: 1) );

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '(MOVIMENTOS.CODCLIENTE = CLIENTES.CODIGO) AND ' +
                   '(MOVIMENTOS.ES = 1) AND (MOVIMENTOS.TIPO = 1) ';

  { indexes iniciais padrao para os combos }
  ixDefSel = 3;
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

procedure TformCompras.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformCompras.btnAdicionarClick(Sender: TObject);
var
   filename: string;
begin
     Screen.Cursor := crHourGlass;

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       DisableControls;
       ParamByName(ixCampos[1].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
      end;

     with pgcDados do
      begin
       tabDetalhe.TabVisible := True;
       tabDetalhe.Caption := 'Adicionar um registro';
       ActivePage := Pages[1];
       tabVisual.TabVisible := False;
      end;
     btnExcluir.Enabled := False;

     Screen.Cursor := crDefault;
     DBEdit14.SetFocus;
end;

procedure TformCompras.FormShow(Sender: TObject);
var
  i: byte;
  tecla: char;
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
     qryFornecedor.Prepare;
     qryEtiqueta.Prepare;

     { forço atualização }
     cmbSelecionarChange(Sender);
     Screen.Cursor := crDefault;

     { Orçamento }
     if CompraOpen then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.Text := IntToStr(CodCompra);
       formStorage.Active := False;
       tecla := #13;
       edtSelecionarKeyPress(Sender, tecla);
       edtSelecionar.Text := '';
      end;

end;

procedure TformCompras.FormCreate(Sender: TObject);
begin

     CompraOpen := false;

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';

end;

procedure TformCompras.edtSelecionarKeyPress(Sender: TObject;
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

procedure TformCompras.cmbOrdenarChange(Sender: TObject);
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

procedure TformCompras.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformCompras.btnImprimirMouseEnter(Sender: TObject);
begin
     if PrinterMenu.Items.Count = 0 then
      btnImprimir.Enabled := False { else
      btnImprimir.DropDownMenu := PrinterMenu; }
end;

procedure TformCompras.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformCompras.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformCompras.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformCompras.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformCompras.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformCompras.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     with Dataset do
       (fieldByName('NOTA_VALOR_TOTAL') as TIBBCDField).Currency := True;
end;

procedure TformCompras.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    with Dataset do
     begin
      { orçamento não é entrada nem saída }
      fieldByName('CODEMPRESA').AsInteger := dmoPrincipal.empresa;
      fieldByName('ES').AsInteger := 1;
      fieldByName('PRIORIDADE').AsInteger := 5;
      { tipo 1 = orçamento }
      fieldByName('TIPO').AsInteger := 1;
      fieldByName('DATA').AsDateTime :=
         dmoPrincipal.GetServerTime;
      fieldByName('VALOR_SERVICOS').AsCurrency := 0.0;
      fieldByName('VALOR_ITENS').AsCurrency := 0.0;
      fieldByName('VALOR_IPI_PRODUTOS').AsCurrency := 0.0;
      fieldByName('DESCONTO').AsCurrency := 0.0;
      fieldByName('NOTA_FRETE').AsInteger := 2;
      fieldByName('NOTA_VALOR_FRETE').AsCurrency := 0.0;
      fieldByName('NOTA_VALOR_SEGURO').AsCurrency := 0.0;
      fieldByName('NOTA_VALOR_OUTROS').AsCurrency := 0.0;
      fieldByName('VALOR_ICMS').AsCurrency := 0.0;
      fieldByName('NOTA_QUANTIDADE').AsInteger := 0;
      fieldByName('NOTA_FRETE').AsInteger := 2;
      fieldByName('STATUS').AsString := 'COMPRA';
      fieldByName('CONDICAO').AsString := '0/';
      fieldByName('NOTA_PESOBRUTO').AsCurrency := 0.0;
      fieldByName('NOTA_PESOLIQUIDO').AsCurrency := 0.0;
      fieldByName('OSTIPO').AsInteger := 99;

      fieldByName('CODCENTRO').AsInteger := 2;

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
     end;

end;

procedure TformCompras.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;

procedure TformCompras.btnExcluirClick(Sender: TObject);
begin
   if dmoPrincipal.Pergunta('Se você excluir esta compra, todos os produtos ' +
      'serão também excluídos.' + #10 + #13 + #10 + #13 +
      'Tem certeza que deseja excluir o orçamento?', 'Leia com cuidado, #.',
      2) = IDYES then
    begin
     Screen.Cursor := crHourGlass;

     dbnDetalhes.BtnClick(nbDelete);
     dmoPrincipal.SalvarRegistro(qryDetalhes);
     qryDetalhes.Close;
     qryFornecedor.Close;

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

procedure TformCompras.btnCancelarClick(Sender: TObject);
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
     qryFornecedor.Close;

     Screen.Cursor := crDefault;
end;

procedure TformCompras.btnModificarClick(Sender: TObject);
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

procedure TformCompras.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR_ITENS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_SERVICOS') as TIBBCDField).Currency := True;
       (fieldByName('NOTA_VALOR_TOTAL') as TIBBCDField).Currency := True;
       (fieldByName('NOTA_VALOR_FRETE') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_IPI_PRODUTOS') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_IPI') as TIBBCDField).Currency := True;
       (fieldByName('NOTA_VALOR_OUTROS') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;

       { rotinas de chamada }
       fieldByName('CODCLIENTE').OnChange := fldCLIENTEmudar;
       fieldByName('DESCONTO').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_ITENS').OnChange := fldDESCONTOmudar;
       fieldByName('VALOR_SERVICOS').OnChange := fldDESCONTOmudar;
       fieldByName('NOTA_VALOR_OUTROS').OnChange := fldDESCONTOmudar;
       fieldByName('NOTA_VALOR_FRETE').OnChange := fldDESCONTOmudar;
       fieldByName('CODCENTRO').OnChange := fldCODCENTROmudar;

       { forço a primeira chamada }
       fldCLIENTEmudar(fieldByName('CODCLIENTE'));
       fldCODCENTROmudar(fieldByName('CODCENTRO'));

      end;


end;

procedure TformCompras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformCompras.fldCLIENTEmudar(Sender: TField);
begin
  qryFornecedor.Close;

  if Sender.AsString > '' then
   with qryFornecedor do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;
end;

procedure TformCompras.fldCODCENTROmudar(Sender: TField);
begin
  qryCentro.Close;

  if Sender.AsString > '' then
   with qryCentro do
    begin
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
    end;
end;

procedure TformCompras.fldDESCONTOmudar(Sender: TField);
begin
  with qryDetalhes do
    fieldByName('NOTA_VALOR_TOTAL').AsCurrency :=
      (fieldByName('VALOR_ITENS').AsCurrency +
      fieldByName('VALOR_SERVICOS').AsCurrency +
      fieldByName('NOTA_VALOR_FRETE').AsCurrency +
      fieldByName('NOTA_VALOR_OUTROS').AsCurrency) -
      fieldByName('DESCONTO').AsCurrency;
end;

procedure TformCompras.FormKeyDown(Sender: TObject; var Key: Word;
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
      end;

     if key = 34 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, True, True);
     if key = 33 then
       with pgcDetalhes do
         ActivePage := FindNextPage(ActivePage, False, True);
end;

procedure TformCompras.edtPesquisarEnter(Sender: TObject);
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

procedure TformCompras.edtPesquisarExit(Sender: TObject);
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

procedure TformCompras.btnSalvarClick(Sender: TObject);
const
   myEnter: Char = #13;
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbPost);
     try
       dmoPrincipal.SalvarRegistro(qryDetalhes);
       qryFornecedor.Close;
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

     if edtPesquisar.Canfocus then cmbOrdenarChange(Sender);
     qrySelecionar.Locate(ixCampos[1].fisico,
         qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformCompras.lblFORNECEDORClick(Sender: TObject);
begin
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

procedure TformCompras.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryFornecedor.Active then qryFornecedor.Close;
     if qryEtiqueta.Active then qryEtiqueta.Close;
     qryDetalhes.Unprepare;
     qryFornecedor.Unprepare;
     qryEtiqueta.Unprepare;
end;


procedure TformCompras.Label17Click(Sender: TObject);
begin
//     with TformITorcamento.Create(Self) do
//      try
//       inOrcamento := Self.qryDetalhes.fieldByName('CODIGO').AsInteger;
//       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
//        [Self.qryDetalhes.fieldByName('CODIGO').AsInteger]),
//        Format('Orçamento %d - %s', [Self.qryDetalhes.fieldByName('CODIGO').AsInteger,
//          qryCliente.fieldByName('NOME').AsString]));
//       ShowModal;
//       if (ModalResult = mrOk) and (qrySelecionar.Active) then
//        { calcular a soma aqui }
//        beep;
//
//      finally
//       release;
//      end;
//
//     with qryDetalhes do
//       fldCLIENTEmudar(fieldByName('CODFORNECEDOR'));
//
end;

procedure TformCompras.lblItensClick(Sender: TObject);
var
  codigo: longint;
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformITcompra.Create(Self) do
      try
       inCompra := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Itens da compra %d - %s',
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

procedure TformCompras.Imprimiroramento1Click(Sender: TObject);
var
  codigo: longint;
begin
  try
    codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
    if codigo > 0 then
     with qryEtiqueta do
      begin
       tag := 1;
       if Active then Close;
       parambyname('CODIGO').AsInteger := codigo;
       Open;
       ppreport.Print;
      end;
  except
    on Exception do beep;
  end;
end;

procedure TformCompras.Salvarcomopadro1Click(Sender: TObject);
begin
//     ShowMessage((Sender as TDBMemo).Name);
end;


procedure TformCompras.qryEtiquetaAfterOpen(DataSet: TDataSet);
var
  salto, i, pag: integer;
begin
        try
          salto := StrToInt(InputBox('Saltar etiquetas',
            'Digite o número de etiquetas para saltar:' , '0'));
        except
          on exception do salto := 0;
        end;

        pag := 1;
        if qryEtiqueta.Tag in [3, 4] then
          try
            pag := StrToInt(InputBox('Número de pagamentos',
              'Digite o número de pagamentos:' , '1'));
          except
            on exception do pag := 1;
          end;


        if memEtiqueta.Active then memEtiqueta.close;
        memEtiqueta.open;
        for i := 1 to salto do
         begin
          memEtiqueta.Append;
          memEtiqueta['BARRA']     := '';
          memEtiqueta['CODIGO']    := null;
          memEtiqueta['DESCRICAO'] := '';
          memEtiqueta['PRECO']     := '';
          memEtiqueta['FONE']      := '';
          memEtiqueta.Post;
         end;

        with qryEtiqueta do
         begin
          first;
          while not eof do
           begin
             if fieldByName('ETIQUETA').AsString = 'S' then
              for i := 1 to (fieldByName('NUMETIQ').AsInteger * fieldByName('QUANTIDADE').AsInteger) do
               begin
                memEtiqueta.Append;
                memEtiqueta['BARRA']     := trim(fieldByName('BARRA').AsString);
                memEtiqueta['CODIGO']    := fieldByName('CODIGO').AsInteger;
                memEtiqueta['DESCRICAO'] := trim(fieldByName('DESCRICAO').AsString)  +
                  ' ' + trim(fieldByName('NUMERO_FONE').AsString);
                memEtiqueta['FONE']      := fieldByName('NUMERO_FONE').AsString;

                if (tag in [3, 4]) and (pag > 1) then
                  memEtiqueta['PRECO']     :=
                    format('%d x %.2f',
                      [pag, (fieldByName('PRECOVENDA').AsCurrency / pag)])
                else
                  memEtiqueta['PRECO']     := format('%.2f', [fieldByName('PRECOVENDA').AsCurrency]);

                memEtiqueta.Post;
               end;
            next;
           end;
         end;
end;

procedure TformCompras.ppDBBarCode1Print(Sender: TObject);
begin
   with ppDBBarCode1 do
     Visible := (Data <> '0000000000000');
end;

procedure TformCompras.Label14Click(Sender: TObject);
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformCompraPag.Create(Self) do
      try
       inCompra := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODMOVIMENTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Pagamentos da compra %d - %s',
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

procedure TformCompras.DBEdit14Enter(Sender: TObject);
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
//     if qryDetalhes.State in [dsInsert] then
//       if qryDetalhes.fieldByName('CODCLIENTE').AsString = '' then
//         lblFORNECEDORClick(Sender);
end;

procedure TformCompras.grdDadosDblClick(Sender: TObject);
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

procedure TformCompras.Grade1Click(Sender: TObject);
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

procedure TformCompras.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformCompras.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformCompras.EmitirNotadeEntrada1Click(Sender: TObject);
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

procedure TformCompras.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
  EmitirNotadeEntrada1.Enabled := not
    (qrySelecionar.FieldByName('NOTA_NUMERO').AsInteger > 0);
end;

procedure TformCompras.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  dmoPrincipal.PointToComma(Key);
end;

procedure TformCompras.Label19Click(Sender: TObject);
begin
     with TformCentros.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       SetWhereDynamic(
        Format('(TIPO = ''%s'')', ['C']),
        Format('Centro de Custo para %s', ['Compras'])
       );
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCENTRO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformCompras.Imprimiretiquetas3x101Click(Sender: TObject);
var
  codigo: longint;
begin
  try
    codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
    if codigo > 0 then
     with qryEtiqueta do
      begin
       tag := 2;
       if Active then Close;
       parambyname('CODIGO').AsInteger := codigo;
       Open;
       ppreport3x10.Print;
      end;
  except
    on Exception do beep;
  end;
end;

procedure TformCompras.Imprimiretiquetaspreo4x201Click(Sender: TObject);
var
  codigo: longint;
begin
  try
    codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
    if codigo > 0 then
     with qryEtiqueta do
      begin
       tag := 3;
       if Active then Close;
       parambyname('CODIGO').AsInteger := codigo;
       Open;
       ppreportpreco.Print;
      end;
  except
    on Exception do beep;
  end;
end;

procedure TformCompras.Imprimiretiquetaspreo3x101Click(Sender: TObject);
var
  codigo: longint;
begin
  try
    codigo := qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
    if codigo > 0 then
     with qryEtiqueta do
      begin
       tag := 4;
       if Active then Close;
       parambyname('CODIGO').AsInteger := codigo;
       Open;
       ppreport3x10preco.Print;
      end;
  except
    on Exception do beep;
  end;
end;

end.
