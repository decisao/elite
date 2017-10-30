unit plancontas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, IBUpdateSQL, IBDatabase, gridreport, 
  ImgList, dxPSCore, dxtree, dxdbtree, dxPSTVLnk, dxPSdxDBTVLnk;

type
  TformPlanContas = class(TForm)
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
    pnlDescendente: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    lblWhere: TLabel;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    ImageList1: TImageList;
    Images: TImageList;
    DBEdit1: TDBEdit;
    traPai: TIBTransaction;
    qryPai: TIBQuery;
    dsrPai: TDataSource;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    dedNOME: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    menuAdicionar: TPopupMenu;
    Planoraiz1: TMenuItem;
    Planodescendente1: TMenuItem;
    dxComponentPrinter: TdxComponentPrinter;
    DBTreeList: TdxDBTreeView;
    dxComponentPrinterLink1: TdxDBTreeViewReportLink;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSelecionarKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirMouseEnter(Sender: TObject);
    procedure qrySelecionarAfterOpen(DataSet: TDataSet);
    procedure qryDetalhesAfterInsert(DataSet: TDataSet);
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
//    procedure DBTreeListGetStateIndex(Sender: TObject;
//      Node: TdxTreeListNode; var Index: Integer);
    procedure qryDetalhesAfterOpen(DataSet: TDataSet);
    procedure Planoraiz1Click(Sender: TObject);
    procedure Planodescendente1Click(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    procedure fldCODPAImudar(Sender: TField);
  public
    { Public declarations }
    inCarta: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formPlanContas: TformPlanContas;

implementation

uses data_principal;

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
     ( 'PLANCONTAS' );

  { entrada no registro do Windows }
  NomeCurto = 'plancontas';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 3;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'   ; fisico: 'CODIGO'     ; iTab: 1),
       (rotulo: 'Pai'      ; fisico: 'CODPAI'     ; iTab: 1),
       (rotulo: 'Legenda'  ; fisico: 'LEGENDA'    ; iTab: 1));

  { expressão adicional do where - não pode ser mudada em run-time }
  { para acrescentar parâmentos em run-time use SetWhereDynamic!   }
  WhereArgStatic = '';

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

procedure TformPlanContas.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformPlanContas.FormShow(Sender: TObject);
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

     { desativo os botões - nenhuma seleção inicial }
     btnAdicionar.Enabled := True;
     btnModificar.Enabled := False;
     btnImprimir.Enabled := False;

     { preparo a Query }
     qryDetalhes.Prepare;

     { forço atualização }
     edtSelecionarKeyPress(Sender, myEnter);
     Screen.Cursor := crDefault;
end;

procedure TformPlanContas.btnSairClick(Sender: TObject);
begin
//     close;
end;

procedure TformPlanContas.FormCreate(Sender: TObject);
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

procedure TformPlanContas.edtSelecionarKeyPress(Sender: TObject;
  var Key: Char);
var
  i, sel: byte;
  StrSQL: string;
begin
   with qrySelecionar do
    begin

     Screen.Cursor := crHourGlass;
     open;

     if not IsEmpty then
      begin
       btnAdicionar.Enabled := True;
       btnModificar.Enabled := True;
       btnImprimir.Enabled := True;
      end else btnAdicionar.Enabled := True;
    end;

   Screen.Cursor := crDefault;

end;

procedure TformPlanContas.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformPlanContas.qrySelecionarAfterOpen(DataSet: TDataSet);
begin
   qrySelecionar.tag := 0;
   DBTreeList.Refresh;
   DBTreeList.FullExpand;
   btnModificar.Enabled := not Dataset.IsEmpty;
   btnImprimir.Enabled  := not Dataset.IsEmpty;
end;

procedure TformPlanContas.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
  with Dataset do
   begin
     fieldByName(ixCampos[1].fisico).AsInteger :=
       dmoPrincipal.LerSequencia(ixTabelas[1]);
     fieldByname('TIPO').AsString := 'X';
     fieldByname('CODPLANO').AsString := 'AUTO';
   end
end;

procedure TformPlanContas.btnExcluirClick(Sender: TObject);
var
  marca: TBookmarkStr;
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

     with qrySelecionar do
      begin
       disablecontrols;
       marca := BookMark;
       close;
       open;
       BookMark := marca;
       enablecontrols;
      end;
     Screen.Cursor := crDefault;
end;

procedure TformPlanContas.btnCancelarClick(Sender: TObject);
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

procedure TformPlanContas.btnModificarClick(Sender: TObject);
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

procedure TformPlanContas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformPlanContas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TformPlanContas.edtPesquisarEnter(Sender: TObject);
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

procedure TformPlanContas.edtPesquisarExit(Sender: TObject);
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

procedure TformPlanContas.btnSalvarClick(Sender: TObject);
var
  marca: TBookmarkStr;
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
     qryDetalhes.Close;

     with qrySelecionar do
      begin
       disablecontrols;
       marca := BookMark;
       close;
       open;
       BookMark := marca;
       enablecontrols;
      end;
     Screen.Cursor := crDefault;

end;

procedure TformPlanContas.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     qryDetalhes.Unprepare;
end;

procedure TformPlanContas.grdDadosDblClick(Sender: TObject);
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

procedure TformPlanContas.btnImprimirClick(Sender: TObject);
begin
  dxComponentPrinter.Preview;
end;

procedure TformPlanContas.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformPlanContas.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

//procedure TformPlanContas.DBTreeListGetStateIndex(Sender: TObject;
//  Node: TdxTreeListNode; var Index: Integer);
//begin
//  if Node.Expanded then
//    Index := 1
//  else Index := 0;
//end;

procedure TformPlanContas.fldCODPAImudar(Sender: TField);
begin
  if Sender.AsString > '' then
   begin
     with qryPai do
      begin
       if active then close;
       if Sender.AsInteger > 0 then open;
      end;
     pnlDescendente.Visible := not (Sender.AsInteger = -1);
   end;
end;



procedure TformPlanContas.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
  with Dataset do
   begin
     fieldByName('CODPAI').OnChange := fldCODPAImudar;
     fldCODPAImudar(fieldByName('CODPAI'));
   end;
end;

procedure TformPlanContas.Planoraiz1Click(Sender: TObject);
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
       fieldByName('CODPAI').AsInteger := -1;
       dedNOME.Setfocus;
      end;
     Screen.Cursor := crDefault;

end;

procedure TformPlanContas.Planodescendente1Click(Sender: TObject);
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
       fieldByName('CODPAI').AsInteger :=
         qrySelecionar.fieldByName('CODIGO').AsInteger;
       dedNOME.Setfocus;
      end;
     Screen.Cursor := crDefault;

end;

end.
