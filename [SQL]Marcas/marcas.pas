unit marcas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, Buttons, ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppDB,
  MemTable, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppModule, daDatMod, ppBarCod, RxMemDS, IBUpdateSQL, IBDatabase, gridreport;

type
  TformMarcas = class(TForm)
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
    qryDetalhes: TIBQuery;
    updDetalhes: TIBUpdateSQL;
    dsrDetalhes: TDataSource;
    pgcDados: TPageControl;
    tabVisual: TTabSheet;
    Panel1: TPanel;
    Dock971: TDock97;
    ToolWindow971: TToolWindow97;
    Label1: TLabel;
    Label2: TLabel;
    cmbOrdenar: TComboBox;
    edtPesquisar: TEdit;
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnAdicionar: TToolbarButton97;
    btnImprimir: TToolbarButton97;
    btnModificar: TToolbarButton97;
    Panel3: TPanel;
    lblWhere: TLabel;
    grdDados: Tzebdbgrid;
    tabDetalhe: TTabSheet;
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    btnSalvar: TToolbarButton97;
    btnExcluir: TToolbarButton97;
    btnCancelar: TToolbarButton97;
    panDados: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    dbnDetalhes: TDBNavigator;
    Panel2: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnArquivos: TToolbarButton97;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure cmbOrdenarChange(Sender: TObject);
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure lblItensClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldCLIENTEmudar(Sender: TField);
    procedure fldDESCONTOmudar(Sender: TField);
  public
    { Public declarations }
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formMarcas: TformMarcas;

implementation

uses data_principal, modelos;

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
  tblCount  = 1;
  ixTabelas : array[1..tblCount] of TCampoStr =
     ( 'MARCAS' );

  { entrada no registro do Windows }
  NomeCurto = 'marcas';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 2;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'        ; fisico: 'CODIGO'     ; iTab: 1),
       (rotulo: 'Descrição'     ; fisico: 'DESCRICAO'  ; iTab: 1) );

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '';

  { indexes iniciais padrao para os combos }
  ixDefSel = 2;
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

procedure TformMarcas.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformMarcas.btnAdicionarClick(Sender: TObject);
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

     DBEdit2.Setfocus;   
     Screen.Cursor := crDefault;
end;

procedure TformMarcas.FormShow(Sender: TObject);
var
  i: byte;
const
  myEnter: char = #13;
begin
     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

     { carrego os combos com as opções }
     cmbOrdenar.Clear;
     for i := 1 to ixMaximo do
      begin
       cmbOrdenar.Items.Add(ixCampos[i].rotulo);
      end;
     cmbOrdenar.ItemIndex := pred(ixDefOrd);

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

     { forço atualização }
     edtSelecionarKeyPress(Sender, myEnter);
     Screen.Cursor := crDefault;
end;

procedure TformMarcas.FormCreate(Sender: TObject);
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

procedure TformMarcas.edtSelecionarKeyPress(Sender: TObject;
  var Key: Char);
var
  i, sel: byte;
  StrSQL: string;
begin
     { se foi apertado enter }
     if (key = #13) then
      begin

       Screen.Cursor := crHourGlass;
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

procedure TformMarcas.cmbOrdenarChange(Sender: TObject);
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

procedure TformMarcas.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False { else
//      btnImprimir.DropDownMenu := PrinterMenu; }
end;

procedure TformMarcas.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformMarcas.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformMarcas.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformMarcas.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformMarcas.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformMarcas.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;
end;

procedure TformMarcas.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);
end;

procedure TformMarcas.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;

procedure TformMarcas.btnExcluirClick(Sender: TObject);
begin
   if dmoPrincipal.Pergunta('Se você excluir essa marca, #, todos os modelos ' +
      'também serão excluídos.' + #10 + #13 + #10 + #13 +
      'Tem certeza que deseja excluir a marca?', 'Excluir',
      2) = IDYES then
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

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
    end;
end;

procedure TformMarcas.btnCancelarClick(Sender: TObject);
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

procedure TformMarcas.btnModificarClick(Sender: TObject);
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
     DBEdit2.Setfocus;
     Screen.Cursor := crDefault;
end;

procedure TformMarcas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformMarcas.fldCLIENTEmudar(Sender: TField);
begin

end;

procedure TformMarcas.fldDESCONTOmudar(Sender: TField);
begin

end;

procedure TformMarcas.FormKeyDown(Sender: TObject; var Key: Word;
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

end;

procedure TformMarcas.edtPesquisarEnter(Sender: TObject);
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

procedure TformMarcas.edtPesquisarExit(Sender: TObject);
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

procedure TformMarcas.btnSalvarClick(Sender: TObject);
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
       edtSelecionarKeyPress(Sender, myEnter);

     if edtPesquisar.Canfocus then cmbOrdenarChange(Sender);
     qrySelecionar.Locate(ixCampos[1].fisico,
         qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformMarcas.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     qryDetalhes.Unprepare;
end;


procedure TformMarcas.Label17Click(Sender: TObject);
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

procedure TformMarcas.lblItensClick(Sender: TObject);
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformModelos.Create(Self) do
      try
       inMarca := Self.qrySelecionar.fieldByName('CODIGO').AsInteger;
       SetWhereDynamic(Format('CODEQUIPAMENTO = %d',
        [Self.qrySelecionar.fieldByName('CODIGO').AsInteger]),
        Format('Modelos da marca %d - %s',
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

procedure TformMarcas.grdDadosDblClick(Sender: TObject);
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

procedure TformMarcas.btnImprimirClick(Sender: TObject);
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

procedure TformMarcas.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformMarcas.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

end.
