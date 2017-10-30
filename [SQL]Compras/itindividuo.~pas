unit itindividuo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, IBUpdateSQL, IBDatabase, gridreport;

type
  TformITindividuais = class(TForm)
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
    Dock972: TDock97;
    Toolbar972: TToolbar97;
    btnSair: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
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
    lblCLIENTE: TLabel;
    dedCODPRODUTO: TDBEdit;
    DBEdit15: TDBEdit;
    Panel3: TPanel;
    grdDados: Tzebdbgrid;
    lblWhere: TLabel;
    qryProduto: TIBQuery;
    dsrProduto: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    DBImage1: TDBImage;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    qryCompra: TIBQuery;
    dsrCompra: TDataSource;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    qryVenda: TIBQuery;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    TabSheet3: TTabSheet;
    lbTempo: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    lbICMS: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Label16: TLabel;
    Bevel2: TBevel;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    dsrVenda: TDataSource;
    ckAutoInc: TCheckBox;
    N2: TMenuItem;
    menuAutoInc: TMenuItem;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    traCompra: TIBTransaction;
    traVenda: TIBTransaction;
    traProduto: TIBTransaction;
    TabSheet4: TTabSheet;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    traOperadora: TIBTransaction;
    qryOperadora: TIBQuery;
    dsrOperadora: TDataSource;
    traPlano: TIBTransaction;
    qryPlano: TIBQuery;
    dsrPlano: TDataSource;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    Label22: TLabel;
    DBEdit20: TDBEdit;
    Label23: TLabel;
    DBEdit21: TDBEdit;
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
    procedure FormDestroy(Sender: TObject);
    procedure qryCompraAfterOpen(DataSet: TDataSet);
    procedure qryVendaAfterOpen(DataSet: TDataSet);
    procedure menuAutoIncClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnModificarMouseEnter(Sender: TObject);
    procedure btnModificarMouseExit(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldCODPRODUTOmudar(Sender: TField);
    procedure fldCODOPERADORAmudar(Sender: TField);
    procedure fldCODPLANOmudar(Sender: TField);
    procedure fldQUANTIDADEmudar(Sender: TField);
  public
    { Public declarations }
    inCompra: longint;
    inProduto: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formITindividuais: TformITindividuais;

implementation

uses data_principal, produtos, operadoras, planos;

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
     ( 'INDIVIDUAIS' );

  { entrada no registro do Windows }
  NomeCurto = 'itsindividuais';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 6;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: '#no'            ; fisico: 'CODIGO'     ; iTab: 1),
       (rotulo: 'Código de Barra'; fisico: 'BARRA'      ; iTab: 1),
       (rotulo: 'Série/ESN/IMEI' ; fisico: 'SERIE'      ; iTab: 1),
       (rotulo: 'ICCID'          ; fisico: 'SERIE2'     ; iTab: 1),
       (rotulo: 'Itens'          ; fisico: 'QUANTIDADE' ; iTab: 1),
       (rotulo: 'Vendido?'       ; fisico: 'VENDIDO'    ; iTab: 1) );

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

procedure TformITindividuais.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
end;

procedure TformITindividuais.FormShow(Sender: TObject);
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
     btnModificar.Enabled := False;
     btnImprimir.Enabled := False;

     { desativo a grid }
     grdDados.Visible := False;

     { inicializo o Avanco Automatico }
     menuAutoInc.Checked := ckAutoInc.Checked;

     { preparo a Query }
     qryDetalhes.Prepare;
     qryProduto.Prepare;
     qryCompra.Prepare;
     qryVenda.Prepare;

     { forço atualização }
     edtSelecionarKeyPress(Sender);
     Screen.Cursor := crDefault;
end;

procedure TformITindividuais.FormCreate(Sender: TObject);
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

procedure TformITindividuais.edtSelecionarKeyPress(Sender: TObject);
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
          if WhereArgStatic > '' then
           StrSQL := StrSQL + ' AND (' + WhereArgDynamic + ')' else
           StrSQL := StrSQL + '(' + WhereArgDynamic + ')';

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
           btnModificar.Enabled := True;
           btnImprimir.Enabled := True;
           edtPesquisar.Enabled := True;
           cmbOrdenar.Enabled := True;
           grdDados.Visible := True;
           cmbOrdenarChange(Sender);
          end;
        end;

       Screen.Cursor := crDefault;
end;

procedure TformITindividuais.cmbOrdenarChange(Sender: TObject);
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

procedure TformITindividuais.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformITindividuais.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformITindividuais.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformITindividuais.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformITindividuais.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformITindividuais.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformITindividuais.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     { apago a primeira coluna @!! método mágico! }
     grdDados.Columns[0].Width     := 0;
     grdDados.Columns[2].Alignment := taRightJustify;
end;

procedure TformITindividuais.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    with Dataset do
     begin
      fieldByName('CODIGO').AsInteger :=
       dmoPrincipal.LerSequencia(ixTabelas[1]);

      fieldByName('CODMOVIMENTO').AsInteger := inCompra;
      fieldByName('QUANTIDADE').AsInteger := 1;
      fieldByName('DESCONTO').AsCurrency := 0.0;
      fieldByName('REAJUSTAR').AsString := 'S';
     end;

end;

procedure TformITindividuais.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformITindividuais.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     { salvo o registro }
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;
     qryProduto.Close;

     Screen.Cursor := crDefault;
end;

procedure TformITindividuais.btnModificarClick(Sender: TObject);
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

procedure TformITindividuais.qryDetalhesAfterOpen(DataSet: TDataSet);
var
  Diferenca: TDateTime;
  dificms: Extended;
  temp: string;
begin
     with Dataset do
      begin

       fieldByName('NUMERO_FONE').EditMask := '(99)c999-9999';

       { rotinas de chamada }
       fieldByName('CODPRODUTO').OnChange := fldCODPRODUTOmudar;
       fieldByName('CODOPERADORA').OnChange := fldCODOPERADORAmudar;
       fieldByName('CODPLANO').OnChange := fldCODPLANOmudar;

       fldCODPRODUTOmudar(fieldByName('CODPRODUTO'));
       fldCODOPERADORAmudar(fieldByName('CODOPERADORA'));
       fldCODPLANOmudar(fieldByName('CODPLANO'));

       with qryCompra do
        begin
         if Active then Close;
         parambyname('CODIGO').AsInteger :=
            Dataset.fieldByName('CODIGO').AsInteger;
         open;
        end;
       with qryVenda do
        begin
         if Active then Close;
         open;
        end;

       { calculo do tempo no estoque }
       lbTempo.Caption := 'não disponível.';
       if (not qryVenda.FieldByName('DATA').IsNull) and
          (not qryCompra.FieldByName('DATA').IsNull) then
        begin
         Diferenca := qryVenda.Fieldbyname('DATA').AsDateTime -
            qryCompra.fieldByName('DATA').AsDateTime;
         { início }
         lbTempo.Caption := 'O produto permaneceu no estoque por ';
         { 1 ou mais dias }
         if Trunc(Diferenca) > 0 then
          if Trunc(Diferenca) = 1 then
           lbTempo.Caption := lbTempo.Caption +
             IntToStr(Trunc(Diferenca)) + ' dia e ' else
           lbTempo.Caption := lbTempo.Caption +
             IntToStr(Trunc(Diferenca)) + ' dias e ';
         { 1 ou mais horas }
         temp := FormatDateTime('h', Frac(Diferenca));
         if temp <> '0' then
          if temp = '1' then
           lbTempo.Caption := lbTempo.Caption +
             temp + ' hora e ' else
           lbTempo.Caption := lbTempo.Caption +
             temp + ' horas e ';
         { minutos }
         lbTempo.Caption := lbTempo.Caption +
           FormatDateTime('m', Frac(Diferenca)) + ' minutos.';
        end;

       { calculo do ICMS }
       lbICMS.Caption := 'disponível somente após a venda.';
       if (not qryVenda.FieldByName('VALOR_ICMS').IsNull) and
          (not qryCompra.FieldByName('VALOR_ICMSCOMPRA').IsNull) then
        begin
         dificms := qryVenda.Fieldbyname('VALOR_ICMS').AsCurrency -
            qryCompra.fieldByName('VALOR_ICMSCOMPRA').AsCurrency;
         lbICMS.Caption := Format('O ICMS devido na operação é de %s.',
          [FloatToStrF(dificms, ffCurrency, 18, 2)]);
        end;

      end;
end;

procedure TformITindividuais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformITindividuais.fldCODPRODUTOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryProduto do
    begin
     close;
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     open;
     if Sender.Dataset.State in [dsInsert, dsEdit] then
      begin
       qryDetalhes.fieldByname('VALOR_UNITARIO').AsFloat :=
         fieldByName('PRECOCUSTO').AsFloat;
       qryDetalhes.fieldByname('VALOR_VENDA').AsFloat :=
         fieldByName('PRECOVENDA').AsFloat;
       qryDetalhes.fieldByName('MARGEM').AsFloat :=
         fieldByName('MARGEM').AsFloat;
       qryDetalhes.fieldByName('ICMSCOMPRA').AsFloat :=
         fieldByName('ICMS').AsFloat;
       qryDetalhes.fieldByName('ICMSVENDA').AsFloat :=
         fieldByName('ICMS').AsFloat;
      end;
    end;
end;

procedure TformITindividuais.fldCODOPERADORAmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryOperadora do
    begin
     if active then close;
     open;
    end;
end;

procedure TformITindividuais.fldCODPLANOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with qryPlano do
    begin
     if active then close;
     open;
    end;
end;

procedure TformITindividuais.fldQUANTIDADEmudar(Sender: TField);
begin
    with Sender.Dataset do
     if State in [dsInsert, dsEdit] then
       fieldByname('VALOR_TOTAL').AsCurrency :=
         (fieldByName('VALOR_UNITARIO').AsCurrency *
          fieldByName('QUANTIDADE').AsCurrency) -
          fieldByName('DESCONTO').AsCurrency;
end;

procedure TformITindividuais.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TformITindividuais.edtPesquisarEnter(Sender: TObject);
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

procedure TformITindividuais.edtPesquisarExit(Sender: TObject);
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

procedure TformITindividuais.btnSalvarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     { salvo o registro }
     dbnDetalhes.BtnClick(nbPost);
     try
       dmoPrincipal.SalvarRegistro(qryDetalhes);
       qryProduto.Close;
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

     { avanço atomático }
     if (not qrySelecionar.EOF) and ckAutoInc.Checked then
       qrySelecionar.Next;

     Screen.Cursor := crDefault;

end;

procedure TformITindividuais.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     if qryProduto.Active then qryProduto.Close;
     if qryCompra.Active then qryCompra.Close;
     if qryVenda.Active then qryVenda.Close;
     qryDetalhes.Unprepare;
     qryProduto.Unprepare;
     qryCompra.Unprepare;
     qryVenda.Unprepare;
end;




procedure TformITindividuais.qryCompraAfterOpen(DataSet: TDataSet);
begin
    with Dataset do
     begin
       (fieldByName('PRECO') as TIBBCDField).Currency := True;

       (fieldByName('VALOR_ICMSCOMPRA') as TNumericField).DisplayFormat := '#,##0.00';
       (fieldByName('VALOR_ICMSCOMPRA') as TNumericField).EditFormat := '#,##0.00';

       (fieldByName('ICMSCOMPRA') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('ICMSCOMPRA') as TNumericField).EditFormat := '##0.00';
     end;
end;

procedure TformITindividuais.qryVendaAfterOpen(DataSet: TDataSet);
begin
    with Dataset do
     begin
       (fieldByName('VALOR_VENDA') as TIBBCDField).Currency := True;
       (fieldByName('DESCONTO') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_PAGO') as TIBBCDField).Currency := True;
       (fieldByName('VALOR_ICMS') as TIBBCDField).Currency := True;

       (fieldByName('ICMSVENDA') as TNumericField).DisplayFormat := '##0.00 ''%''';
       (fieldByName('ICMSVENDA') as TNumericField).EditFormat := '##0.00';
     end;
end;

procedure TformITindividuais.menuAutoIncClick(Sender: TObject);
begin
   ckAutoInc.Checked := not ckAutoInc.Checked;
   menuAutoInc.Checked := ckAutoInc.Checked;
end;

procedure TformITindividuais.grdDadosDblClick(Sender: TObject);
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

procedure TformITindividuais.btnImprimirClick(Sender: TObject);
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

procedure TformITindividuais.btnModificarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformITindividuais.btnModificarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformITindividuais.Label21Click(Sender: TObject);
begin
     with TformOperadoras.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODOPERADORA').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;
end;

procedure TformITindividuais.Label22Click(Sender: TObject);
begin
   if not qryDetalhes.fieldByName('CODOPERADORA').IsNull then
     with TformPlanos.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       inOperadora := Self.qryDetalhes.fieldByName('CODOPERADORA').AsInteger;
       SetWhereDynamic(Format('(CODOPERADORA = %d)',
        [Self.qryDetalhes.fieldByName('CODOPERADORA').AsInteger]),
        Format('Planos da %d - %s',
          [Self.qryDetalhes.fieldByName('CODOPERADORA').AsInteger,
          Self.qryOperadora.fieldByName('NOME').AsString]));
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CODPLANO').AsInteger :=
           qrySelecionar.fieldByName('CODIGO').AsInteger;
      finally
       release;
      end;

end;

end.
