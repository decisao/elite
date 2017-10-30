unit servicos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, ExtDlgs, Buttons, IBUpdateSQL, IBDatabase, gridreport;

type
  TformServicos = class(TForm)
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
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    qryUnidade: TIBQuery;
    qryGrupo: TIBQuery;
    dsrUnidade: TDataSource;
    dsrGrupo: TDataSource;
    Label12: TLabel;
    dedBARRA: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traUnidade: TIBTransaction;
    traGrupo: TIBTransaction;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnArquivos: TToolbarButton97;
    DBCheckBox1: TDBCheckBox;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    traCentro: TIBTransaction;
    qryCentro: TIBQuery;
    dsrCentro: TDataSource;
    DBCheckBox2: TDBCheckBox;
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
    procedure lblUNIDADEClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblGRUPOClick(Sender: TObject);
    procedure lblREAJUSTEClick(Sender: TObject);
    procedure DBEdit19KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure ckIndividualClick(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure ckEtiquetaClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure Label19Click(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldPRECOCUSTOmudar(Sender: TField);
    procedure fldPRECOVENDAmudar(Sender: TField);
    procedure fldUNIDADEmudar(Sender: TField);
    procedure fldGRUPOmudar(Sender: TField);
    procedure fldCODCENTROmudar(Sender: TField);
  public
    { Public declarations }
    inProduto: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formServicos: TformServicos;

implementation

uses data_principal, grupos, unidades, mensagens, variacoes,
  consulta_produto, centros;

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
     ( 'PRODUTOS' );

  { entrada no registro do Windows }
  NomeCurto = 'servicos';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 4;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'         ; fisico: 'CODIGO'    ; iTab: 1),
       (rotulo: 'Código Barra'   ; fisico: 'BARRA'     ; iTab: 1),
       (rotulo: 'Serviço'        ; fisico: 'DESCRICAO' ; iTab: 1),
       (rotulo: 'Valor'          ; fisico: 'PRECOVENDA'; iTab: 1) );

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '(PS = ''S'')';

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

{$R *.DFM}

function FldQName(i: byte): string;
begin
  result := ixTabelas[ixCampos[i].iTab] + '.' + ixCampos[i].fisico;
end;

procedure TformServicos.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformServicos.btnAdicionarClick(Sender: TObject);
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
       dedNOME.Setfocus;
      end;
     Screen.Cursor := crDefault;
end;

procedure TformServicos.FormShow(Sender: TObject);
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

     { preparo a Query }
     qryDetalhes.Prepare;
     qryUnidade.Prepare;
     qryGrupo.Prepare;

     { forço atualização }
     cmbSelecionarChange(Sender);

     { verifico se existe JumpStart }
     if inProduto > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.text := IntToStr(inProduto);
       edtSelecionarKeyPress(Sender, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Text := '';
       btnModificarClick(Sender);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformServicos.FormCreate(Sender: TObject);
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

end;

procedure TformServicos.edtSelecionarKeyPress(Sender: TObject;
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

procedure TformServicos.cmbOrdenarChange(Sender: TObject);
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

procedure TformServicos.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformServicos.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformServicos.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformServicos.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformServicos.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformServicos.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformServicos.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformServicos.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     with Dataset do
      (fieldByName('PRECOVENDA') as TIBBCDField).Currency := True;

end;

procedure TformServicos.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    { valores iniciais }
    Dataset.fieldByName('DATACADAST').AsDateTime :=
       dmoPrincipal.GetServerTime;
    Dataset.fieldByName('ETIQUETA').AsString := 'S';
    Dataset.fieldByName('INDIVIDUAL').AsString := 'N';
    Dataset.fieldByName('COMISSIONADO').AsString := 'S';
    Dataset.fieldByName('NUMETIQ').AsInteger := 1;
    Dataset.fieldByName('SEQUENCIA').AsInteger := 0;
    Dataset.fieldByName('MINIMO').AsInteger := 0;
    Dataset.fieldByName('ICMS').AsFloat := 0.0;
    Dataset.fieldByName('BARRA').AsString := '0000000000000';
    Dataset.fieldByName('PS').AsString := 'S';
    Dataset.fieldByName('ATIVACAO').AsString := 'N';
    Dataset.fieldByName('CADEQUIPAMENTO').AsString := 'N';
    Dataset.fieldByName('TIPOPRODUTO').AsString := 'S';
    Dataset.fieldByName('CODCENTRO').AsInteger := 1;
    Dataset.fieldByName('PRECOCUSTO').AsFloat := 0.0;
    Dataset.fieldByName('PRECOVENDA').AsFloat := 0.0;
    Dataset.fieldByName('UNIDADE').AsString :=
           dmoPrincipal.cdsConfig.fieldByName('MEDIDA_SER').AsString;
    Dataset.fieldByName('GRUPO').AsString :=
           dmoPrincipal.cdsConfig.fieldByName('GRUPO_SER').AsString;
    ckEtiquetaClick(nil);
end;

procedure TformServicos.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformServicos.btnExcluirClick(Sender: TObject);
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

procedure TformServicos.btnCancelarClick(Sender: TObject);
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

procedure TformServicos.btnModificarClick(Sender: TObject);
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
     dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformServicos.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     { mascaras }
     with Dataset do
      begin
       fieldByName('DATACADAST').EditMask := '99/99/9999';
       fieldByName('UNIDADE').EditMask := 'CC';

       (fieldByName('PRECOCUSTO') as TIBBCDField).Currency := True;
       (fieldByName('PRECOVENDA') as TIBBCDField).Currency := True;

       (fieldByName('ICMS') as TNumericField).DisplayFormat := '##0.0000 ''%''';
       (fieldByName('ICMS') as TNumericField).EditFormat := '##0.00';

       (fieldByName('MARGEM') as TNumericField).DisplayFormat := '##0.0000 ''%''';
       (fieldByName('MARGEM') as TNumericField).EditFormat := '##0.00';

       { rotinas de chamada }
       fieldByName('PRECOCUSTO').OnChange := fldPRECOCUSTOmudar;
       fieldByName('PRECOVENDA').OnChange := fldPRECOVENDAmudar;

       { forço a primeira chamada }
       fldPRECOCUSTOmudar(fieldByName('PRECOCUSTO'));
       fldPRECOVENDAmudar(fieldByName('PRECOVENDA'));

       fieldByName('GRUPO').OnChange      := fldGRUPOmudar;
       fieldByName('UNIDADE').OnChange    := fldUNIDADEmudar;
       fieldByName('CODCENTRO').OnChange  := fldCODCENTROmudar;

       { primeira chamada }
       fldGRUPOmudar(fieldByName('GRUPO'));
       fldUNIDADEmudar(fieldByName('UNIDADE'));
       fldCODCENTROmudar(fieldByName('CODCENTRO'));
      end;

end;

procedure TformServicos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformServicos.fldPRECOCUSTOmudar(Sender: TField);
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

procedure TformServicos.fldPRECOVENDAmudar(Sender: TField);
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

procedure TformServicos.FormKeyDown(Sender: TObject; var Key: Word;
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

     if key = vk_Return then
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
       82: lblREAJUSTEClick(Sender);
      end;
end;

procedure TformServicos.edtPesquisarEnter(Sender: TObject);
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

procedure TformServicos.edtPesquisarExit(Sender: TObject);
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

procedure TformServicos.btnSalvarClick(Sender: TObject);
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

     if edtPesquisar.Canfocus then cmbOrdenarChange(Sender);
     qrySelecionar.Locate(ixCampos[1].fisico,
         qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformServicos.lblUNIDADEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryUnidade.Close;
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
     qryUnidade.Open;
end;

procedure TformServicos.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryUnidade.Active then qryUnidade.Close;
     if qryGrupo.Active then qryGrupo.Close;
     qryDetalhes.Unprepare;
     qryUnidade.Unprepare;
     qryGrupo.Unprepare;   
end;

procedure TformServicos.lblGRUPOClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     qryGrupo.Close;
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
     qryGrupo.Open;
end;

procedure TformServicos.lblREAJUSTEClick(Sender: TObject);
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

procedure TformServicos.DBEdit19KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);
end;

procedure TformServicos.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformServicos.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformServicos.ckIndividualClick(Sender: TObject);
begin
     qryDetalhes.fieldByName('BARRA').AsString :=
       dmoPrincipal.Ean13('111' + DBEdit1.Text + '00000');
end;

procedure TformServicos.Label13Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformConsultaProduto.Create(Self) do
      try
       inDescricao := Trim(Self.qrySelecionar.fieldByName('DESCRICAO').AsString);
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

procedure TformServicos.ckEtiquetaClick(Sender: TObject);
begin
     qryDetalhes.fieldByName('BARRA').AsString :=
       dmoPrincipal.Ean13('111' + DBEdit1.Text + '00000');
end;

procedure TformServicos.grdDadosDblClick(Sender: TObject);
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

procedure TformServicos.fldUNIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryUnidade do
    begin
     if active then close;
     open;
    end;
end;

procedure TformServicos.fldCODCENTROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryCentro do
    begin
     if active then close;
     open;
    end;
end;

procedure TformServicos.fldGRUPOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryGrupo do
    begin
     if active then close;
     open;
    end;
end;

procedure TformServicos.btnImprimirClick(Sender: TObject);
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

procedure TformServicos.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformServicos.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformServicos.Label19Click(Sender: TObject);
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

end.
