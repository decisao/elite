unit cli_equip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, IBUpdateSQL, IBDatabase, gridreport;

type
  TformCli_equip = class(TForm)
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
    Label6: TLabel;
    dedSERIE: TDBEdit;
    Panel3: TPanel;
    grdDados: Tzebdbgrid;
    lblWhere: TLabel;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    Label3: TLabel;
    dedNOME: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    traMarca: TIBTransaction;
    qryMarca: TIBQuery;
    dsrMarca: TDataSource;
    traModelo: TIBTransaction;
    qryModelo: TIBQuery;
    dsrModelo: TDataSource;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnArquivos: TToolbarButton97;
    DBComboBox1: TDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label53: TLabel;
    DBEdit38: TDBEdit;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
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
    procedure grdDadosDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure qryDetalhesAfterOpen(DataSet: TDataSet);
    procedure btnArquivosClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    procedure fldCODMARCAmudar(Sender: TField);
    procedure fldCODMODELOmudar(Sender: TField);
  public
    { Public declarations }
    inCliente: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formCli_equip: TformCli_equip;

implementation

uses data_principal, marcas, modelos, cartas_carta;

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
     ( 'CLI_EQUIP',
       'MARCAS',
       'MODELOS' );

  { entrada no registro do Windows }
  NomeCurto = 'cli_equip';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 6;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Cliente'   ; fisico: 'CODCLIENTE'    ; iTab: 1),
       (rotulo: 'Número'    ; fisico: 'CODEQUIPAMENTO'; iTab: 1),
       (rotulo: 'Marca'     ; fisico: 'DESCRICAO'     ; iTab: 2),
       (rotulo: 'Modelo'    ; fisico: 'DESCRICAO'     ; iTab: 3),
       (rotulo: 'nº Série'  ; fisico: 'SERIE'         ; iTab: 1),
       (rotulo: 'Contrato'  ; fisico: 'TIPOCONTRATO'  ; iTab: 1));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic =
    'CLI_EQUIP.CODMARCA  = MARCAS.CODIGO AND ' +
    'CLI_EQUIP.CODMARCA  = MODELOS.CODEQUIPAMENTO AND ' +
    'CLI_EQUIP.CODMODELO = MODELOS.CODIGO';

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

procedure TformCli_equip.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformCli_equip.btnAdicionarClick(Sender: TObject);
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
       ParamByName(ixCampos[2].fisico).Clear;
       Open;
       EnableControls;
       dbnDetalhes.BtnClick(nbInsert);
       dedNOME.Setfocus;
      end;
     Screen.Cursor := crDefault;
end;

procedure TformCli_equip.FormShow(Sender: TObject);
var
  i: byte;
const
  myEnter: char = #13;
begin
     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

     { se existirem itens no Menu de Impressão, ligo o botão }
     if PrinterMenu.Items.Count > 0 then
       btnImprimir.DropDownMenu := PrinterMenu;

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

procedure TformCli_equip.btnSairClick(Sender: TObject);
begin
//     close;
end;

procedure TformCli_equip.FormCreate(Sender: TObject);
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

procedure TformCli_equip.edtSelecionarKeyPress(Sender: TObject;
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

         { cláusula WHERE }
         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' WHERE (' + WhereArgStatic + ')';
         if WhereArgDynamic > '' then
          begin
           if WhereArgStatic = '' then
              StrSQL := StrSQL + ' WHERE ('
           else
              StrSQL := StrSQL + ' AND ( ';
           StrSQL := StrSQL + WhereArgDynamic + ')';
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

procedure TformCli_equip.cmbOrdenarChange(Sender: TObject);
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

procedure TformCli_equip.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformCli_equip.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformCli_equip.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformCli_equip.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformCli_equip.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformCli_equip.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformCli_equip.qrySelecionarAfterOpen(DataSet: TDataSet);
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
     Columns[0].Width := 0;
     Columns[1].Width := 50;
     Columns[2].Title.Caption := 'Marca';
     Columns[2].Width := 140;
     Columns[3].Title.Caption := 'Modelo';
     Columns[3].Width := 140;
    end
end;

procedure TformCli_equip.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
  with Dataset do
   begin
     fieldByname('CODCLIENTE').AsInteger := inCliente;
     fieldByName('CODEQUIPAMENTO').AsInteger := 0;
   end;
end;

procedure TformCli_equip.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformCli_equip.btnExcluirClick(Sender: TObject);
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

procedure TformCli_equip.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { cancelo o registro }
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;

     Screen.Cursor := crDefault;
end;

procedure TformCli_equip.btnModificarClick(Sender: TObject);
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
       ParamByName(ixCampos[2].fisico).AsInteger :=
         qrySelecionar.fieldByName(ixCampos[2].fisico).AsInteger;
       Open;
      end;
     dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformCli_equip.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformCli_equip.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  atag: byte;
begin
     if key = vk_escape then
       if qryDetalhes.Active then btnCancelarClick(Sender) else
        begin
         Self.ModalResult := mrCancel;
         Close;
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
      end;

end;

procedure TformCli_equip.edtPesquisarEnter(Sender: TObject);
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

procedure TformCli_equip.edtPesquisarExit(Sender: TObject);
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

procedure TformCli_equip.btnSalvarClick(Sender: TObject);
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
     qrySelecionar.Locate(
        ixCampos[1].fisico + ';' + ixCampos[2].fisico,
        VarArrayOf([
          qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger,
          qryDetalhes.fieldByName(ixCampos[2].fisico).AsInteger]),
          []);
     qryDetalhes.Close;
     Screen.Cursor := crDefault;

end;

procedure TformCli_equip.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     qryDetalhes.Unprepare;
end;

procedure TformCli_equip.grdDadosDblClick(Sender: TObject);
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

procedure TformCli_equip.btnImprimirClick(Sender: TObject);
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

procedure TformCli_equip.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformCli_equip.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformCli_equip.Label3Click(Sender: TObject);
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

procedure TformCli_equip.Label4Click(Sender: TObject);
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

procedure TformCli_equip.fldCODMARCAmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryMarca do
    begin
     if active then close;
     open;
    end;
end;

procedure TformCli_equip.fldCODMODELOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryModelo do
    begin
     if active then close;
     open;
    end;
end;

procedure TformCli_equip.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
  with dataset do
   begin
    (fieldByName('DATAINI') as TDateTimeField).DisplayFormat := 'dd/mm/yyyy';
    (fieldByName('DATAINI') as TDateTimeField).EditMask      := '00/00/0000';

    (fieldByName('DATAFIM') as TDateTimeField).DisplayFormat := 'dd/mm/yyyy';
    (fieldByName('DATAFIM') as TDateTimeField).EditMask      := '00/00/0000';

    fieldByName('CODMARCA').OnChange  := fldCODMARCAmudar;
    fieldByName('CODMODELO').OnChange := fldCODMODELOmudar;

    fldCODMARCAmudar(fieldByName('CODMARCA'));
    fldCODMODELOmudar(fieldByName('CODMODELO'));
   end
end;

procedure TformCli_equip.btnArquivosClick(Sender: TObject);
begin
   if qrySelecionar.Active then
    if not qrySelecionar.IsEmpty then
     with TformCartas_Carta.Create(Self) do
      try
       inCliente     := Self.qrySelecionar.fieldByname('CODCLIENTE').AsInteger;
       inEquipamento := Self.qrySelecionar.fieldByName('CODEQUIPAMENTO').AsInteger;
       SetWhereDynamic(Format('CARTAS_OS.CODCLIENTE = %d AND CARTAS_OS.CODEQUIPAMENTO = %d',
        [Self.qrySelecionar.fieldByName('CODCLIENTE').AsInteger,
         Self.qrySelecionar.fieldByName('CODEQUIPAMENTO').AsInteger]),
        Format('Cartas Equip.: %s - %s',
          [trim(Self.qrySelecionar.fieldByName('DESCRICAO').AsString),
          Self.qrySelecionar.fieldByName('DESCRICAO1').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        { calcular a soma aqui }
        beep;

      finally
       release;
      end;
end;

end.
