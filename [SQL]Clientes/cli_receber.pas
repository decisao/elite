unit cli_receber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, CurrEdit, RXDBCtrl, ToolEdit, IBUpdateSQL, IBDatabase, gridreport;

type
  TformCli_receber = class(TForm)
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
    Label24: TLabel;
    Label25: TLabel;
    Panel3: TPanel;
    grdDados: Tzebdbgrid;
    lblWhere: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    grpPago: TGroupBox;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    qryDocumento: TIBQuery;
    ToolbarSep973: TToolbarSep97;
    btnBaixa: TToolbarButton97;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    dsrDocumento: TDataSource;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traDocumento: TIBTransaction;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnReceberMarcados: TToolbarButton97;
    btnMarcar: TToolbarButton97;
    Dock976: TDock97;
    ToolWindow972: TToolWindow97;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtMarcados: TEdit;
    edtTotalMarca: TEdit;
    edtTotal: TEdit;
    updSelecionar: TIBUpdateSQL;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject);
    procedure cmbOrdenarChange(Sender: TObject);
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
    procedure qryDetalhesAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure grdDadosDblClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure qrySelecionarAfterPost(DataSet: TDataSet);
    procedure btnMarcarClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    procedure fldCODDOCUMENTOmudar(Sender: TField);
    procedure fldPAGOAoExibir(Sender: TField;
       var Text: String; DisplayText: Boolean);
  public
    { Public declarations }
    inCliente: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formCli_receber: TformCli_receber;

implementation

uses data_principal, baixa, documentos;

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
       'DOCUMENTOS',
       'MOVIMENTOS'  );

  { entrada no registro do Windows }
  NomeCurto = 'cli_receber';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 7;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'        ; fisico: 'CODIGO'        ; iTab: 1),
       (rotulo: 'Marca'         ; fisico: 'PAGO'          ; iTab: 1),
       (rotulo: 'Data'          ; fisico: 'DATAVENCIMENTO'; iTab: 1),
       (rotulo: 'Descrição'     ; fisico: 'DESCRICAO'     ; iTab: 1),
       (rotulo: 'Valor'         ; fisico: 'VALOR'         ; iTab: 1),
       (rotulo: 'Documento'     ; fisico: 'DOCUMENTO'     ; iTab: 2),
       (rotulo: 'Cód.Cliente'   ; fisico: 'CODCLIENTE'    ; iTab: 3) );

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic =
    'PAGAMENTOS.CODDOCUMENTO = DOCUMENTOS.CODIGO AND ' +
    'PAGAMENTOS.CODMOVIMENTO = MOVIMENTOS.CODIGO AND ' +
    'PAGAMENTOS.ES = 2 AND PAGAMENTOS.PAGO = 0';

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

procedure TformCli_receber.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformCli_receber.btnAdicionarClick(Sender: TObject);
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
     DBDateEdit1.SetFocus;
     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.FormShow(Sender: TObject);
var
  i: byte;
begin
     { escondo a página de detalhes }
     tabDetalhe.TabVisible := False;

     { carrego os combos com as opções }
     cmbOrdenar.Clear;
     for i := 2 to ixMaximo do
       cmbOrdenar.Items.Add(ixCampos[i].rotulo);
     cmbOrdenar.ItemIndex := pred(ixDefOrd);

     { desativo os botões - nenhuma seleção inicial }
     btnAdicionar.Enabled := False;
     btnModificar.Enabled := False;
     btnImprimir.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { preparo a Query }
     qryDetalhes.Prepare;
     qryDocumento.Prepare;

     { forço atualização }
     edtSelecionarKeyPress(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.FormCreate(Sender: TObject);
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

procedure TformCli_receber.edtSelecionarKeyPress(Sender: TObject);
var
  i, sel: byte;
  StrSQL: string;
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
         StrSQL := StrSQL + ' WHERE ';

         { argumento especial do WHERE }
         if WhereArgStatic > '' then
           StrSQL := StrSQL + ' (' + WhereArgStatic + ')';
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
//           btnAdicionar.Enabled := True;
           btnModificar.Enabled := True;
           btnImprimir.Enabled := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled := True;
           grdDados.Visible := True;
           cmbOrdenarChange(Sender);
          end { else btnAdicionar.Enabled := True; }
        end;

       Screen.Cursor := crDefault;
end;

procedure TformCli_receber.cmbOrdenarChange(Sender: TObject);
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
       if not IsEmpty then
        begin
         grdDados.Visible := True;
         btnModificar.Enabled := True;
        end;
      end;
     edtPesquisar.SetFocus;
end;

procedure TformCli_receber.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformCli_receber.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformCli_receber.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformCli_receber.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformCli_receber.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformCli_receber.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformCli_receber.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
  soma: extended;
begin
   qrySelecionar.tag := 0;
   { preencho os nomes reais dos campos }
   for i := 1 to ixMaximo do
    qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
      ixCampos[i].rotulo;

   { apago a primeira coluna @!! método mágico! }
   grdDados.Columns[0].Width := 0;
   grdDados.Columns[5].Width := 0;

   grdDados.Columns[1].Width      := 45;
   grdDados.Columns[1].Alignment  := taCenter;
   grdDados.Columns[1].Font.Style := [fsBold];

   grdDados.Columns[2].Width     := 90;

   with Dataset do
    begin
      (FieldByName('VALOR') as TIBBCDField).Currency := True;
      FieldByName('PAGO').OnGetText := fldPAGOAoExibir;
      
      soma := 0;
      disablecontrols;
      while not eof do
       begin
        soma := soma + fieldByName('VALOR').AsCurrency;
        next;
       end;
      first;
      enablecontrols;

      edtTotal.Text := FloatToStrF(soma, ffCurrency, 18, 2);
    end;
end;

procedure TformCli_receber.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;

procedure TformCli_receber.btnExcluirClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbDelete);
     dmoPrincipal.SalvarRegistro(qryDetalhes);
     qryDetalhes.Close;
     qryDocumento.Close;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     cmbOrdenarChange(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.btnCancelarClick(Sender: TObject);
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
     qryDocumento.Close;

     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.btnModificarClick(Sender: TObject);
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
       grpPago.Visible := (fieldByName('PAGO').Asinteger = 1);
       btnSalvar.Enabled  := (fieldByName('PAGO').AsInteger = 0);
       btnExcluir.Enabled := (fieldByName('PAGO').AsInteger = 0);
       btnBaixa.Enabled := (fieldByName('PAGO').AsInteger = 0);
      end;
     dbnDetalhes.BtnClick(nbEdit);
     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     with Dataset do
      begin

       { mascaras }
       (fieldByName('VALOR') as TIBBCDField).Currency := True;
       (fieldByName('TOTAL_PAGO') as TIBBCDField).Currency := True;

       { rotinas de chamada }
       fieldByName('CODDOCUMENTO').OnChange := fldCODDOCUMENTOmudar;

       { forço a primeira chamada }
       fldCODDOCUMENTOmudar(fieldByName('CODDOCUMENTO'));

      end;

end;

procedure TformCli_receber.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformCli_receber.FormKeyDown(Sender: TObject; var Key: Word;
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
        { vk_F2: btnAdicionarClick(Sender); }
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

procedure TformCli_receber.edtPesquisarEnter(Sender: TObject);
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

procedure TformCli_receber.edtPesquisarExit(Sender: TObject);
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

procedure TformCli_receber.btnSalvarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbPost);
     try
       dmoPrincipal.SalvarRegistro(qryDetalhes);
       qryDocumento.Close;
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

     cmbOrdenarChange(Sender);

     { localizo o registro que estava editando }
     qrySelecionar.Locate(ixCampos[1].fisico,
        qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;


     Screen.Cursor := crDefault;

end;

procedure TformCli_receber.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryDocumento.Active then qryDocumento.Close;
     qryDetalhes.Unprepare;
     qryDocumento.Unprepare;
end;




procedure TformCli_receber.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformCli_receber.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformCli_receber.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformCli_receber.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformCli_receber.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
        dmoPrincipal.PointToComma(Key);

end;

procedure TformCli_receber.grdDadosDblClick(Sender: TObject);
begin
  with qrySelecionar do
   begin
    edit;
    if fieldByName('PAGO').AsInteger = 1 then
      fieldByName('PAGO').AsInteger := 0
    else
      fieldByName('PAGO').AsInteger := 1;
    post;
   end
end;

procedure TformCli_receber.btnBaixaClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbPost);
     try
       dmoPrincipal.SalvarRegistro(qryDetalhes);
       qryDocumento.Close;
     except
       on exception do
        begin
         dbnDetalhes.BtnClick(nbEdit);
         Screen.Cursor := crDefault;
         raise;
        end;
     end;

     with TformBaixa.Create(Self) do
      try
        codpagamento := Self.qryDetalhes.fieldByName('CODIGO').AsInteger;
        showmodal;
      finally
        release;
      end;

     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     cmbOrdenarChange(Sender);

     { localizo o registro que estava editando }
     qrySelecionar.Locate(ixCampos[1].fisico,
        qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;


     Screen.Cursor := crDefault;
end;

procedure TformCli_receber.Label13Click(Sender: TObject);
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

procedure TformCli_receber.fldCODDOCUMENTOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryDocumento do
    begin
     if active then close;
     open;
    end;
end;

procedure TformCli_receber.btnImprimirClick(Sender: TObject);
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

procedure TformCli_receber.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformCli_receber.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformCli_receber.fldPAGOAoExibir(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if Sender.AsInteger = 1 then
    Text := 'X'
  else
    Text := '';
  DisplayText := True;
  
end;

procedure TformCli_receber.qrySelecionarAfterPost(DataSet: TDataSet);
var
  marca: Tbookmarkstr;
  soma: extended;
  n: integer;
begin
   with Dataset do
    begin
      (FieldByName('VALOR') as TIBBCDField).Currency := True;
      FieldByName('PAGO').OnGetText := fldPAGOAoExibir;

      soma := 0;
      n := 0;
      marca := BookMark;
      disablecontrols;
      first;
      while not eof do
       begin
        if fieldByName('PAGO').AsInteger = 1 then
         begin
          soma := soma + fieldByName('VALOR').AsCurrency;
          inc(n);
         end;
        next;
       end;
      Bookmark := marca;
      enablecontrols;

      if soma > 0 then
         edtTotalMarca.Text := FloatToStrF(soma, ffCurrency, 18, 2)
      else
         edtTotalMarca.text := '';

      if n > 0 then
         edtMarcados.text   := IntToStr(n)
      else
         edtMarcados.text   := '';

      if edtTotalMarca.Text = edtTotal.Text then
        btnMarcar.Caption := 'Desmarcar tudo'
      else
        btnMarcar.Caption := 'Marcar tudo';

      btnReceberMarcados.Enabled := (n > 1);

    end;
end;

procedure TformCli_receber.btnMarcarClick(Sender: TObject);
var
  marca : TBookMarkStr;
  acao: boolean;
begin
   acao := (btnMarcar.Caption = 'Desmarcar tudo');
   with qrySelecionar do
    begin
      marca := BookMark;
      disablecontrols;
      first;
      while not eof do
       begin
        edit;
        if acao then
          fieldByname('PAGO').AsInteger := 0
        else
          fieldByname('PAGO').AsInteger := 1;
        post;
        next;
       end;
      Bookmark := marca;
      enablecontrols;
    end;

end;

end.
