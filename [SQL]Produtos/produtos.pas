unit produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet,
  IBStoredProc, DBCtrls, Mask, TB97Ctls, ExtDlgs, Buttons, IBUpdateSQL,
  IBDatabase, gridreport, RxMemDS, ppCtrls, ppBands, ppPrnabl, ppClass,
  ppBarCod, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe;

const
  CM_FORMSETUP = WM_USER + 1;

type
  TformProdutos = class(TForm)
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
    Label6: TLabel;
    dedNOME: TDBEdit;
    pgcDetalhes: TPageControl;
    tabPessoaFisica: TTabSheet;
    tabEndereco: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    tabOutros: TTabSheet;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    lblWhere: TLabel;
    grdDados: Tzebdbgrid;
    FotoMenu: TPopupMenu;
    Colardareadetransferncia1: TMenuItem;
    Abrirdoarquivo1: TMenuItem;
    N2: TMenuItem;
    Apagar1: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    lblUNIDADE: TLabel;
    DBEdit14: TDBEdit;
    lblGRUPO: TLabel;
    DBEdit13: TDBEdit;
    lbPrecoCusto: TLabel;
    dedPrecoCusto: TDBEdit;
    lbMargem: TLabel;
    dedMargem: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    ckEtiqueta: TDBCheckBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    ckIndividual: TDBCheckBox;
    DBImage1: TDBImage;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    dedBARRA: TDBEdit;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    TabSheet1: TTabSheet;
    zebdbgrid1: Tzebdbgrid;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnVender: TToolbarButton97;
    btnArquivos: TToolbarButton97;
    btnEmail: TToolbarButton97;
    MenuMais: TPopupMenu;
    Movimentos1: TMenuItem;
    N3: TMenuItem;
    QuemCompra1: TMenuItem;
    QuemVende1: TMenuItem;
    ToolbarButton971: TToolbarButton97;
    cbOcultos: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    updSelecionar: TIBUpdateSQL;
    Panel4: TPanel;
    ckStretch: TCheckBox;
    traEtiqueta: TIBTransaction;
    qryEtiqueta: TIBQuery;
    ppDBPipeline: TppDBPipeline;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBBarCode1: TppDBBarCode;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppReport3x10: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBBarCode2: TppDBBarCode;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    ppReportPreco: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppColumnHeaderBand3: TppColumnHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppColumnFooterBand3: TppColumnFooterBand;
    ppFooterBand3: TppFooterBand;
    dsrEtiqueta: TDataSource;
    memEtiqueta: TRxMemoryData;
    memEtiquetaBARRA: TStringField;
    memEtiquetaCODIGO: TIntegerField;
    memEtiquetaDESCRICAO: TStringField;
    Grade1: TMenuItem;
    N4: TMenuItem;
    Imprimiretiquetas4x201: TMenuItem;
    Imprimiretiquetas3x101: TMenuItem;
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
    TabSheet2: TTabSheet;
    DBCheckBox3: TDBCheckBox;
    traMarca: TIBTransaction;
    qryMarca: TIBQuery;
    dsrMarca: TDataSource;
    traModelo: TIBTransaction;
    qryModelo: TIBQuery;
    dsrModelo: TDataSource;
    GroupBox1: TGroupBox;
    lbMarca: TLabel;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    lbModelo: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label18: TLabel;
    DBEdit21: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
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
    procedure lblUNIDADEClick(Sender: TObject);
    procedure lblGRUPOClick(Sender: TObject);
    procedure Abrirdoarquivo1Click(Sender: TObject);
    procedure Colardareadetransferncia1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure lblMENSAGEMClick(Sender: TObject);
    procedure lblREAJUSTEClick(Sender: TObject);
    procedure dedPrecoCustoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure ckIndividualClick(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure ckEtiquetaClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label95Click(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure qryServicosAfterOpen(DataSet: TDataSet);
    procedure lblArquivosClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure btnVenderClick(Sender: TObject);
    procedure cbOcultosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuemCompra1Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure qrySelecionarAfterOpen(DataSet: TDataSet);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure ckStretchClick(Sender: TObject);
    procedure qryEtiquetaAfterOpen(DataSet: TDataSet);
    procedure Grade1Click(Sender: TObject);
    procedure Imprimiretiquetas4x201Click(Sender: TObject);
    procedure Imprimiretiquetas3x101Click(Sender: TObject);
    procedure Imprimiretiquetaspreo4x201Click(Sender: TObject);
    procedure Imprimiretiquetaspreo3x101Click(Sender: TObject);
    procedure lbMarcaClick(Sender: TObject);
    procedure lbModeloClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure FormStart(var Message: TMessage); message CM_FORMSETUP;
    procedure fldPRECOCUSTOmudar(Sender: TField);
    procedure fldPRECOVENDAmudar(Sender: TField);
    procedure fldUNIDADEmudar(Sender: TField);
    procedure fldGRUPOmudar(Sender: TField);
    procedure fldCODSERVICOmudar(Sender: TField);
    procedure fldCODCENTROmudar(Sender: TField);
    procedure fldCODMARCAmudar(Sender: TField);
    procedure fldCODMODELOmudar(Sender: TField);
  public
    { Public declarations }
    inProduto: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formProdutos: TformProdutos;

implementation

uses data_principal, grupos, unidades, mensagens, variacoes,
  consulta_produto, servicos, histoque, pro_files, venda_direta,
  data_produtos, quemcompra, centros, confirmasenha, marcas, modelos;

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
     ( 'PRODUTOS',
       'INDIVIDUAIS' );

  { entrada no registro do Windows }
  NomeCurto = 'produtos';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 9;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'         ; fisico: 'CODIGO'       ; iTab: 1),
       (rotulo: 'Localização'    ; fisico: 'LOCALIZACAO'  ; iTab: 1),
       (rotulo: 'Oculto'         ; fisico: 'OCULTO'       ; iTab: 1),
       (rotulo: 'Nome do Produto'; fisico: 'DESCRICAO'    ; iTab: 1),
       (rotulo: 'Valor'          ; fisico: 'PRECOVENDA'   ; iTab: 1),
       (rotulo: 'c/Serviço'      ; fisico: 'PRECOTOTAL'   ; iTab: 1),
       (rotulo: 'Estoque'        ; fisico: 'LOCAL'        ; iTab: 1),
       (rotulo: 'Tudo'           ; fisico: 'TOTAL'        ; iTab: 1),
       (rotulo: 'Código Barra'   ; fisico: 'BARRA'        ; iTab: 1));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = 'PRODUTOS.PS = ''P''';

  { indexes iniciais padrao para os combos }
  ixDefSel = 4;
  ixDefOrd = 4;

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

procedure TformProdutos.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformProdutos.FormStart(var Message: TMessage);
var
  i: byte;
  tecla: char;
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
     btnImprimir.Enabled := False;

     { desativo a ordenação e pesquisa }
     cmbOrdenar.Enabled := False;
     edtPesquisar.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { forço atualização }
     cmbSelecionarChange(nil);

     { verifico se existe JumpStart }
     if inProduto > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.text := IntToStr(inProduto);
       edtSelecionarKeyPress(nil, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Text := '';
       btnModificarClick(nil);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformProdutos.btnAdicionarClick(Sender: TObject);
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

     with pgcDetalhes do
      begin
       tabPessoaFisica.TabVisible := True;
       ActivePage := Pages[0];
      end;

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       tag := 1;
       DisableControls;
       ParamByName(ixCampos[1].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
       dedNOME.Setfocus;
      end;
     Screen.Cursor := crDefault;
end;

procedure TformProdutos.FormShow(Sender: TObject);
begin
  PostMessage(Handle, CM_FORMSETUP, 0, 0);
end;

procedure TformProdutos.FormCreate(Sender: TObject);
begin
     inProduto := 0;

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';

     { crio o módulo de dados do relacionamento }
     dmoProdutos := TdmoProdutos.Create(Self);

end;

procedure TformProdutos.edtSelecionarKeyPress(Sender: TObject;
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
         StrSQL :=
            'SELECT                                             ' +
            '  PRODUTOS.CODIGO,                                 ' +
            '  PRODUTOS.LOCALIZACAO,                            ' +
            '  PRODUTOS.OCULTO,                                 ' +
            '  PRODUTOS.DESCRICAO,                              ' +
            '  PRODUTOS.PRECOVENDA,                             ' +
            '  PRODUTOS.PRECOTOTAL,                             ' +
            '  (                                                ' +
            '    SELECT                                         ' +
            '      SUM(QUANTIDADE)                              ' +
            '    FROM                                           ' +
            '      INDIVIDUAIS                                  ' +
            '    WHERE                                          ' +
            '      INDIVIDUAIS.VENDIDO = ''N'' AND              ' +
            '      INDIVIDUAIS.CODEMPRESA = '  +
               IntToStr(dmoPrincipal.empresa)  +
            '  AND                                              ' +
            '      INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO     ' +
            '  ) AS LOCAL,                                      ' +
            '  (                                                ' +
            '    SELECT                                         ' +
            '      SUM(QUANTIDADE)                              ' +
            '    FROM                                           ' +
            '      INDIVIDUAIS                                  ' +
            '    WHERE                                          ' +
            '      INDIVIDUAIS.VENDIDO = ''N'' AND              ' +
            '      INDIVIDUAIS.CODPRODUTO = PRODUTOS.CODIGO     ' +
            '  ) AS TOTAL,                                      ' +
            '  PRODUTOS.BARRA ';

         { cláusula FROM }
         StrSQL := StrSQL +
            'FROM PRODUTOS PRODUTOS ';

         { cláusula WHERE }
         StrSQL := StrSQL + ' WHERE (' +
           ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
         if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
             dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
           else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';

         if not cbOcultos.Checked then
           StrSQL := StrSQL + ' AND (PRODUTOS.OCULTO = ''N'')';

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

         if qrySelecionar.Active then
           qrySelecionar.close;
         qrySelecionar.open;

         if not qrySelecionar.IsEmpty then
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

procedure TformProdutos.cmbOrdenarChange(Sender: TObject);
begin
     edtPesquisar.Clear;
     tmpSQLOrd := ' ORDER BY ' +
       ixTabelas[ixCampos[succ(cmbOrdenar.ItemIndex)].iTab] + '.' +
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico;
     with qrySelecionar do
      begin
       SQL.Clear;
       SQL.Add(tmpSQLSel + tmpSQLOrd);
      end;
     with qrySelecionar do
      begin
       if active then close;
       open;
      end;
     edtPesquisar.SetFocus;
end;

procedure TformProdutos.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformProdutos.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformProdutos.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
    qrySelecionar.Locate(
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text,
       [loPartialKey]);
end;

procedure TformProdutos.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformProdutos.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformProdutos.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformProdutos.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformProdutos.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia('PRODUTOS');

    { valores iniciais }
    Dataset.fieldByName('DATACADAST').AsDateTime :=
       dmoPrincipal.GetServerTime;
    Dataset.fieldByName('ETIQUETA').AsString := 'S';
    Dataset.fieldByName('INDIVIDUAL').AsString := 'N';
    Dataset.fieldByName('OCULTO').AsString := 'N';
    Dataset.fieldByName('COMISSIONADO').AsString := 'S';
    Dataset.fieldByName('NUMETIQ').AsInteger := 1;
    Dataset.fieldByName('SEQUENCIA').AsInteger := 0;
    Dataset.fieldByName('BARRA').AsString := '0000000000000';
    Dataset.fieldByName('PS').AsString := 'P';
    Dataset.fieldByName('ATIVACAO').AsString := 'N';
    Dataset.fieldByName('CODCENTRO').AsInteger := 1;
    Dataset.fieldByName('CADEQUIPAMENTO').AsString := 'N';
    Dataset.fieldByName('TIPOPRODUTO').AsString := 'F';
    ckEtiquetaClick(nil);
end;

procedure TformProdutos.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformProdutos.btnExcluirClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbDelete);
     dmoPrincipal.SalvarRegistro(qryDetalhes);
     qryDetalhes.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     updSelecionar.RefreshSQL.Clear;
     updSelecionar.RefreshSQL.Add(
       tmpSQLSel +
       ' AND PRODUTOS.CODIGO = ' +
       qrySelecionar.fieldByName('CODIGO').AsString
     );
     qrySelecionar.refresh;

     Screen.Cursor := crDefault;
end;

procedure TformProdutos.btnCancelarClick(Sender: TObject);
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
       dmoPrincipal.CancelarSequencia('PRODUTOS',
         qryDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;

     Screen.Cursor := crDefault;
end;

procedure TformProdutos.btnModificarClick(Sender: TObject);
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

     { se não tiver acesso ao financeiro, nao mostro tudo }
     if dmoPrincipal.cdsVendedor.fieldByName('CUSTO').AsString = 'N' then
      begin
       lbPrecoCusto.Visible  := False;
       dedPrecoCusto.Visible := False;
       lbMargem.Visible      := False;
       dedMargem.Visible     := False;
       DBEdit3.ReadOnly      := True;
      end else
      begin
       lbPrecoCusto.Visible  := True;
       dedPrecoCusto.Visible := True;
       lbMargem.Visible      := True;
       dedMargem.Visible     := True;
       DBEdit3.ReadOnly      := False;
      end;

     { código de adição vai aqui }
     with qryDetalhes do
      begin
       tag := 0;
       ParamByName(ixCampos[1].fisico).AsInteger :=
         qrySelecionar.fieldByName(ixCampos[1].fisico).AsInteger;
       Open;
      end;
     dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformProdutos.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     { mascaras }
     with Dataset do
      begin
       fieldByName('DATACADAST').EditMask := '99/99/9999';
       fieldByName('UNIDADE').EditMask := 'CC';

       (fieldByName('PRECOCUSTO')   as TIBBCDField).Currency := True;
       (fieldByName('PRECOVENDA')   as TIBBCDField).Currency := True;
       (fieldByName('PRECOSERVICO') as TIBBCDField).Currency := True;

       (fieldByName('ICMS') as TNumericField).DisplayFormat := '##0.0000 ''%''';
       (fieldByName('ICMS') as TNumericField).EditFormat := '##0.00';

       (fieldByName('MARGEM') as TNumericField).DisplayFormat := '##0.0000 ''%''';
       (fieldByName('MARGEM') as TNumericField).EditFormat := '##0.00';

       { rotinas de chamada }
       fieldByName('PRECOCUSTO').OnChange := fldPRECOCUSTOmudar;
       fieldByName('PRECOVENDA').OnChange := fldPRECOVENDAmudar;

       fieldByName('GRUPO').OnChange      := fldGRUPOmudar;
       fieldByName('UNIDADE').OnChange    := fldUNIDADEmudar;
       fieldByName('CODSERVICO').OnChange := fldCODSERVICOmudar;
       fieldByName('CODCENTRO').OnChange  := fldCODCENTROmudar;

       fieldByName('CODMARCA').OnChange  := fldCODMARCAmudar;
       fieldByName('CODMODELO').OnChange := fldCODMODELOmudar;

       { primeira chamada }
       fldGRUPOmudar(fieldByName('GRUPO'));
       fldUNIDADEmudar(fieldByName('UNIDADE'));
       fldCODSERVICOmudar(fieldByName('CODSERVICO'));
       fldCODCENTROmudar(fieldByName('CODCENTRO'));
       fldCODMARCAmudar(fieldByName('CODMARCA'));
       fldCODMODELOmudar(fieldByName('CODMODELO'));
      end;

    with dmoProdutos.cdsEstoque do
     begin
      if active then close;
      open;
     end;

     { foto - compatibilidade com o Reloaded }
     try
       DBImage1.DataSource := dsrDetalhes;
     except
       on exception do
        begin
          DBImage1.DataSource := nil;
          Screen.Cursor := crDefault;
        end;
     end;
end;

procedure TformProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

//procedure TformProdutos.fldUNIDADEmudar0(Sender: TField);
//begin
//  if Sender.AsString > '' then
//   with dmoRelacProdutos.qryMedidas do
//    begin
//     close;
//     ParamByName('SIGLA').AsString := Sender.AsString;
//     open;
//   end;
//end;

//procedure TformProdutos.fldGRUPOmudar(Sender: TField);
//begin
//  if Sender.AsString > '' then
//   with dmoRelacProdutos.qryGrupos do
//    begin
//     close;
//     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
//     open;
//    end;
//end;

procedure TformProdutos.fldPRECOCUSTOmudar(Sender: TField);
var
  custo, venda, mora: extended;
begin
  mora  := 0.0;
  custo := Sender.AsCurrency;
  venda := qryDetalhes.fieldByName('PRECOVENDA').AsCurrency;
  if (venda > custo) and (custo > 0.0) then
    mora := ((venda * 100) / custo) - 100 else
    if (custo = 0.0) and (venda > 0.0) then mora := (venda * 100) / venda;
  if (Sender.Dataset.State in [dsEdit, dsInsert]) then
    qryDetalhes.fieldByName('MARGEM').AsFloat := mora;
end;

procedure TformProdutos.fldPRECOVENDAmudar(Sender: TField);
var
  custo, venda, mora: extended;
begin
  mora  := 0.0;
  custo := qryDetalhes.fieldByName('PRECOCUSTO').AsCurrency;
  venda := Sender.AsCurrency;
  if (venda > custo) and (custo > 0.0) then
    mora := ((venda * 100) / custo) - 100 else
    if (custo = 0.0) and (venda > 0.0) then mora := (venda * 100) / venda;
  if (Sender.Dataset.State in [dsEdit, dsInsert]) then
    qryDetalhes.fieldByName('MARGEM').AsFloat := mora;
end;

procedure TformProdutos.FormKeyDown(Sender: TObject; var Key: Word;
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
       71: lblGRUPOClick(Sender);
       85: lblUNIDADEClick(Sender);
      end;
     if (not qryDetalhes.Active) and (Shift = [ssCtrl]) then
      case Key of
       77: lblMENSAGEMClick(Sender);
       82: lblREAJUSTEClick(Sender);
      end;
end;

procedure TformProdutos.edtPesquisarEnter(Sender: TObject);
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

procedure TformProdutos.edtPesquisarExit(Sender: TObject);
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

procedure TformProdutos.btnSalvarClick(Sender: TObject);
const
     myEnter: Char = #13;
begin
     { confirmacao de senha }
     if dmoPrincipal.cdsConfig.fieldByName('SENHA_PRODUTOS').AsString = 'S' then
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
     if (not grdDados.Visible) or (qryDetalhes.tag = 1) then
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
       ' AND PRODUTOS.CODIGO = ' +
       qrySelecionar.fieldByName('CODIGO').AsString
     );
     qrySelecionar.refresh;

     Screen.Cursor := crDefault;

end;

procedure TformProdutos.lblUNIDADEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformUnidades.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.qryDetalhes.fieldByName('UNIDADE').AsString :=
           qrySelecionar.fieldByName('SIGLA').AsString;
        end;
      finally
       release;
      end;
end;

procedure TformProdutos.lblGRUPOClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformGrupos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.qryDetalhes.fieldByName('GRUPO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
        end;
      finally
       release;
      end;
end;

procedure TformProdutos.Abrirdoarquivo1Click(Sender: TObject);
begin
  with OpenPictureDialog do
   if Execute then
     DBImage1.Picture.LoadFromFile(FileName);
end;

procedure TformProdutos.Colardareadetransferncia1Click(Sender: TObject);
begin
     DBImage1.PasteFromClipboard;
end;

procedure TformProdutos.Apagar1Click(Sender: TObject);
begin
        DBImage1.CutToClipboard;
end;

procedure TformProdutos.lblMENSAGEMClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;  
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty  then
     with TformMensagem.Create(Self) do
      try
       inProduto := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODPRODUTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Mensagens %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;


procedure TformProdutos.lblREAJUSTEClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformReajustes.Create(Self) do
      try
       inProduto := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODPRODUTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Reajustes %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformProdutos.dedPrecoCustoKeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);
end;

procedure TformProdutos.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformProdutos.ckIndividualClick(Sender: TObject);
begin
   if ckIndividual.Checked then
    begin
     if qryDetalhes.State in [dsInsert, dsEdit] then
       qryDetalhes.fieldByName('BARRA').AsString :=
         dmoPrincipal.Ean13('999' + DBEdit1.Text + '00000');
     dedBARRA.OnEnter := NIL;
     dedBARRA.OnExit  := NIL;
     dedBARRA.Enabled := False;
     dedBARRA.Color   := clBtnFace;
    end else
    begin
     dedBARRA.Enabled := True;
     dedBARRA.Color := clWindow;
     dedBARRA.OnEnter := edtPesquisarEnter;
     dedBARRA.OnExit  := edtPesquisarExit;
    end;

end;

procedure TformProdutos.Label13Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformConsultaProduto.Create(Self) do
      try
       inDescricao := trim(Self.qrySelecionar.fieldByName('DESCRICAO').AsString);
       SetWhereDynamic(Format('(INDIVIDUAIS.CODPRODUTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Movimentos %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformProdutos.ckEtiquetaClick(Sender: TObject);
begin
  if qryDetalhes.State in [dsInsert, dsEdit] then
   if ckEtiqueta.Checked and (not ckIndividual.Checked) then
     qryDetalhes.fieldByName('BARRA').AsString :=
       dmoPrincipal.Ean13('999' + DBEdit1.Text + '00000');
end;

procedure TformProdutos.Label14Click(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformServicos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.qryDetalhes.fieldByName('CODSERVICO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
         Self.qryDetalhes.fieldByName('PRECOSERVICO').AsFloat :=
           qrySelecionar.fieldByName('PRECOVENDA').AsFloat;
        end;
      finally
       release;
      end;
end;

procedure TformProdutos.Label95Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformHistoque.Create(Self) do
      try
       inProduto := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODPRODUTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Estoque %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformProdutos.grdDadosDblClick(Sender: TObject);
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

procedure TformProdutos.fldUNIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoProdutos.cdsUnidade do
    begin
     if active then close;
     open;
    end;
end;

procedure TformProdutos.fldGRUPOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoProdutos.cdsGrupo do
    begin
     if active then close;
     open;
    end;
end;

procedure TformProdutos.fldCODSERVICOmudar(Sender: TField);
begin
   with dmoProdutos.cdsServicos do
    begin
     if active then close;
     if Sender.AsString > '' then open;
    end;
end;

procedure TformProdutos.fldCODCENTROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoProdutos.cdsCentro do
    begin
     if active then close;
     open;
    end;
end;

procedure TformProdutos.qryServicosAfterOpen(DataSet: TDataSet);
begin
  with dataset do
    (fieldByName('PRECOVENDA') as TIBBCDField).Currency := True;
end;

procedure TformProdutos.lblArquivosClick(Sender: TObject);
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformPro_files.Create(Self) do
      try
       inProduto := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('(CODPRODUTO = %d)',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Arquivos de %d - %s',
          [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformProdutos.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformProdutos.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformProdutos.btnVenderClick(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 if qrySelecionar.Active then
  if not qrySelecionar.IsEmpty then
   with TformVendaDireta.Create(Self) do
    try
      inOS := 0;
      inBarra := qrySelecionar.fieldByName('BARRA').AsString;
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
 updSelecionar.RefreshSQL.Clear;
 updSelecionar.RefreshSQL.Add(
   tmpSQLSel +
   ' AND PRODUTOS.CODIGO = ' +
   qrySelecionar.fieldByName('CODIGO').AsString
 );
 qrySelecionar.refresh;
end;

procedure TformProdutos.cbOcultosClick(Sender: TObject);
var
  tecla: char;
begin
  tecla := #13;
  edtSelecionarKeyPress(Sender, tecla);
end;

procedure TformProdutos.FormDestroy(Sender: TObject);
begin
  dmoProdutos.free;
end;

procedure TformProdutos.QuemCompra1Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformQuemCompra.Create(Self) do
      try
       inProduto := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       titulo := Format('Quem Compra Produto %d - %s',
         [Self.qrySelecionar.fieldByName('CODIGO').AsInteger,
          Self.qrySelecionar.fieldByName('DESCRICAO').AsString]);
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;

end;

procedure TformProdutos.Label19Click(Sender: TObject);
begin
     with TformCentros.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       SetWhereDynamic(
        Format('(TIPO = ''%s'')', ['L']),
        Format('Centro de Lucro para %d - %s',
          [Self.qryDetalhes.fieldByName('CODIGO').AsInteger,
           Self.qryDetalhes.fieldByName('DESCRICAO').AsString])
       );
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODCENTRO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformProdutos.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     grdDados.Columns[0].Width           := 45;
     grdDados.Columns[1].Width           := 85;
     grdDados.Columns[2].Alignment       := taCenter;
     grdDados.Columns[2].Title.Alignment := taCenter;
     grdDados.Columns[3].Width           := 330;
     grdDados.Columns[4].Title.Alignment := taRightJustify;
     grdDados.Columns[5].Title.Alignment := taRightJustify;
     grdDados.Columns[6].Alignment       := taCenter;
     grdDados.Columns[6].Title.Alignment := taCenter;
     grdDados.Columns[6].Width           := 55;
     grdDados.Columns[7].Alignment       := taCenter;
     grdDados.Columns[7].Title.Alignment := taCenter;
     grdDados.Columns[7].Width           := 55;

     if cbOcultos.Checked then
        grdDados.Columns[2].Width   := 45
     else
        grdDados.Columns[2].Width   := 0;

     with qrySelecionar do
      begin
       (fieldByName('PRECOVENDA') as TNumericField).DisplayFormat := '#,##0.00';
       (fieldByName('PRECOTOTAL') as TNumericField).DisplayFormat := '#,##0.00';
      end;
end;

procedure TformProdutos.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
   btnVender.Visible := (qrySelecionar.fieldByName('LOCAL').AsInteger > 0);
end;

procedure TformProdutos.ckStretchClick(Sender: TObject);
begin
  DBImage1.Stretch := ckStretch.Checked;
end;

procedure TformProdutos.qryEtiquetaAfterOpen(DataSet: TDataSet);
var
  salto, i, maxetiq, pag: integer;
begin
        try
          salto := StrToInt(InputBox('Saltar etiquetas',
            'Digite o número de etiquetas para saltar:' , '0'));
        except
          on exception do salto := 0;
        end;

        try
          maxetiq := StrToInt(InputBox('Número de etiquetas',
            'Digite o número de etiquetas a imprimir:' , '1'));
        except
          on exception do maxetiq := 0;
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
          memEtiqueta.Post;
         end;

        with qryEtiqueta do
         begin
          first;
          while not eof do
           begin
             if fieldByName('ETIQUETA').AsString = 'S' then
              for i := 1 to maxetiq do
               begin
                memEtiqueta.Append;
                memEtiqueta['BARRA']     := fieldByName('BARRA').AsString;
                memEtiqueta['CODIGO']    := fieldByName('CODIGO').AsInteger;
                memEtiqueta['DESCRICAO'] := fieldByName('DESCRICAO').AsString;

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

procedure TformProdutos.Grade1Click(Sender: TObject);
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

procedure TformProdutos.Imprimiretiquetas4x201Click(Sender: TObject);
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

procedure TformProdutos.Imprimiretiquetas3x101Click(Sender: TObject);
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

procedure TformProdutos.Imprimiretiquetaspreo4x201Click(Sender: TObject);
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

procedure TformProdutos.Imprimiretiquetaspreo3x101Click(Sender: TObject);
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

procedure TformProdutos.lbMarcaClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
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
end;

procedure TformProdutos.lbModeloClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
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
end;

procedure TformProdutos.fldCODMARCAmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryMarca do
    begin
     if active then close;
     open;
    end;
end;

procedure TformProdutos.fldCODMODELOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryModelo do
    begin
     if active then close;
     open;
    end;
end;

end.
