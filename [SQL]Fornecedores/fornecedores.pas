unit fornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, ComCtrls, StdCtrls, TB97, TB97Tlwn, ExtCtrls, Grids,
  DBGrids, zebdbgrid, Placemnt, Menus, Db, IBQuery, IBCustomDataSet, IBStoredProc, DBCtrls, Mask,
  TB97Ctls, IBUpdateSQL, IBDatabase, gridreport, ShellApi;

type
  TformFornecedores = class(TForm)
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
    dbrPessoa: TDBRadioGroup;
    pgcDetalhes: TPageControl;
    tabPessoaFisica: TTabSheet;
    tabPessoaJuridica: TTabSheet;
    tabEndereco: TTabSheet;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    lblCIDADE: TLabel;
    DBEdit13: TDBEdit;
    lblESTADO: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    lblLOCALIZACAO: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit23: TDBEdit;
    Label29: TLabel;
    DBEdit24: TDBEdit;
    Label30: TLabel;
    DBEdit25: TDBEdit;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    tabOutros: TTabSheet;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    DBMemo1: TDBMemo;
    Label36: TLabel;
    DBEdit29: TDBEdit;
    Panel3: TPanel;
    lblWhere: TLabel;
    grdDados: Tzebdbgrid;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    traSelecionar: TIBTransaction;
    traDetalhes: TIBTransaction;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    btnEmail: TToolbarButton97;
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
    procedure dbrPessoaChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure lblESTADOClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblCIDADEClick(Sender: TObject);
    procedure lblLOCALIZACAOClick(Sender: TObject);
    procedure CheckCPF1Error(Sender: TObject);
    procedure CheckCGC1Error(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure qrySelecionarAfterScroll(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarMouseEnter(Sender: TObject);
    procedure btnAdicionarMouseExit(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
    WhereArgDynamic: string;
    { chamadas de rotina }
    procedure fldESTADOmudar(Sender: TField);
    procedure fldCIDADEmudar(Sender: TField);
    procedure fldLOCALIDADEmudar(Sender: TField);
    procedure fldBAIRROmudar(Sender: TField);
  public
    { Public declarations }
    inFornecedor: longint;
    procedure SetWhereDynamic(st, stmsg: string);
  end;

var
  formFornecedores: TformFornecedores;

implementation

uses data_principal, relacfornecedores, estados, cidades, localidades,
  newlocal;

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
     ( 'FORNECEDORES' );

  { entrada no registro do Windows }
  NomeCurto = 'fornecedores';

  { rotulos e nomes fisicos dos campos }
  ixMaximo  = 9;
  ixCampos  : array[1..ixMaximo] of TCampoDes =
     ( (rotulo: 'Código'      ; fisico: 'CODIGO'     ; iTab: 1),
       (rotulo: 'Nome'        ; fisico: 'NOME'       ; iTab: 1),
       (rotulo: 'email'       ; fisico: 'EMAIL'      ; iTab: 1),
       (rotulo: 'Razão Social'; fisico: 'RAZAOSOCIAL'; iTab: 1),
       (rotulo: 'RG'          ; fisico: 'RG'         ; iTab: 1),
       (rotulo: 'CPF'         ; fisico: 'CPF'        ; iTab: 1),
       (rotulo: 'CGC'         ; fisico: 'CGC'        ; iTab: 1),
       (rotulo: 'Telefone'    ; fisico: 'FONE'       ; iTab: 1),
       (rotulo: 'Celular'     ; fisico: 'CELULAR'    ; iTab: 1) );

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

 var
  busca_local: byte;

{$R *.DFM}

function FldQName(i: byte): string;
begin
  result := ixTabelas[ixCampos[i].iTab] + '.' + ixCampos[i].fisico;
end;

procedure TformFornecedores.SetWhereDynamic(st, stmsg: string);
begin
  WhereArgDynamic := st;
  with lblWhere do
   begin
    Visible := (stmsg > '');
    if Visible then Caption := ' ' + stmsg;
   end;
  Application.ProcessMessages;
end;

procedure TformFornecedores.btnAdicionarClick(Sender: TObject);
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
       dedNOME.SetFocus;
      end;
     Application.ProcessMessages;
     Screen.Cursor := crDefault;
end;

procedure TformFornecedores.FormShow(Sender: TObject);
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

     { forço atualização }
     cmbSelecionarChange(Sender);
     Application.ProcessMessages;

     { verifico se existe JumpStart }
     if inFornecedor > 0 then
      begin
       cmbSelecionar.ItemIndex := 0;
       edtSelecionar.text := IntToStr(inFornecedor);
       edtSelecionarKeyPress(Sender, tecla);
       cmbSelecionar.ItemIndex := pred(ixDefSel);
       edtSelecionar.Text := '';
       btnModificarClick(Sender);
      end;

     Screen.Cursor := crDefault;
end;

procedure TformFornecedores.FormCreate(Sender: TObject);
begin
     inFornecedor := 0;

     { crio o módulo de dados do relacionamento }
     dmoRelacFornecedores := TdmoRelacFornecedores.Create(Self);

     { defino a atualização das informações }
     with formStorage do
      begin
       IniSection := NomeCurto;
       Active := True;
      end;

     { inicializo a expressão dinâmica do WHERE }
     WhereArgDynamic := '';

end;

procedure TformFornecedores.edtSelecionarKeyPress(Sender: TObject;
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
         { ATENÇÃO: ESSA ROTINA FOI MODIFICADA PARA FUNCIONAR
           EXPRESSAO+ E CAMPO NOME (sel=1) USANDO SOUNDBYTES  }
         if (Pos('+', edtSelecionar.Text) > 0) and (sel = 2) then
          StrSQL := StrSQL + ' WHERE (SOUNDBYTES = ' +
            IntToStr(dmoPrincipal.SoundBts(PChar(edtSelecionar.Text))) +
            ')' else
          begin
            { ROTINA COMUM }
            StrSQL := StrSQL + ' WHERE (' +
              ixTabelas[ixCampos[sel].iTab] + '.' + ixCampos[sel].fisico;
            if sel > 1 then StrSQL := StrSQL + ' LIKE ''' +
                dmoPrincipal.Coringa(edtSelecionar.Text) + ''')'
              else StrSQL := StrSQL + ' = ' + edtSelecionar.Text + ')';
          end;

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
     Application.ProcessMessages;
end;

procedure TformFornecedores.cmbOrdenarChange(Sender: TObject);
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

procedure TformFornecedores.cmbSelecionarChange(Sender: TObject);
begin
     edtSelecionar.Clear;
     edtSelecionar.SetFocus;
end;

procedure TformFornecedores.btnImprimirMouseEnter(Sender: TObject);
begin
//     if PrinterMenu.Items.Count = 0 then
//      btnImprimir.Enabled := False;
end;

procedure TformFornecedores.edtPesquisarChange(Sender: TObject);
begin
   if edtPesquisar.Text > '' then
     if dmoPrincipal.QueryLocate(qrySelecionar,
       ixCampos[succ(cmbOrdenar.ItemIndex)].fisico,
       edtPesquisar.Text) then beep;
end;

procedure TformFornecedores.GridMenuPopup(Sender: TObject);
begin
     AtivarZebra1.Checked := grdDados.Zebra;
end;

procedure TformFornecedores.Ativarzebra1Click(Sender: TObject);
begin
     grdDados.Zebra := not grdDados.Zebra;
end;

procedure TformFornecedores.Cordalinha1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraColor;
       if Execute then
        grdDados.ZebraColor := Color;
      end;
end;

procedure TformFornecedores.Cordotexto1Click(Sender: TObject);
begin
     with ColorDialog do
      begin
       Color := grdDados.ZebraFontColor;
       if Execute then
        grdDados.ZebraFontColor := Color;
      end;
end;

procedure TformFornecedores.qrySelecionarAfterOpen(DataSet: TDataSet);
var
  i: byte;
begin
     qrySelecionar.tag := 0;
     { preencho os nomes reais dos campos }
     for i := 1 to ixMaximo do
      qrySelecionar.fieldByName(ixCampos[i].fisico).DisplayLabel :=
        ixCampos[i].rotulo;

     { apago a primeira coluna @!! método mágico! }
     grdDados.Columns[2].Width := 0;
end;

procedure TformFornecedores.qryDetalhesAfterInsert(DataSet: TDataSet);
begin
    Dataset.fieldByName(ixCampos[1].fisico).AsInteger :=
      dmoPrincipal.LerSequencia(ixTabelas[1]);

    { valores iniciais }
    Dataset.fieldByName('DATACADAST').AsDateTime :=
       dmoPrincipal.GetServerTime;
    Dataset.fieldByName('PESSOAFISICA').AsString := 'J';
    Dataset.fieldByName('ESTADO').AsString :=
       dmoPrincipal.qryCliente.fieldBYName('ESTADO').AsString;
    Dataset.fieldByName('CIDADE').Asinteger :=
       dmoPrincipal.qryCliente.fieldBYName('CODCIDADE').AsInteger;
    Dataset.fieldByName('SOUNDBYTES').Asinteger := 0;

    Application.ProcessMessages;
end;

procedure TformFornecedores.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (cmbOrdenar.ItemIndex = 0) and (not (Key in ['0'..'9', #8])) then
       Key := chr(0);
end;








procedure TformFornecedores.btnExcluirClick(Sender: TObject);
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

     with dmoRelacFornecedores do
      begin
       qryCidades.Close;
       qryEstado.Close;
       qryLocalidades.Close;
      end;

     cmbOrdenarChange(Sender);
     Application.ProcessMessages;
     Screen.Cursor := crDefault;
end;

procedure TformFornecedores.btnCancelarClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with pgcDados do
      begin
       tabVisual.TabVisible := True;
       ActivePage := Pages[0];
       tabDetalhe.TabVisible := False;
      end;

     with dmoRelacFornecedores do
      begin
       qryCidades.Close;
       qryEstado.Close;
       qryLocalidades.Close;
      end;

     { cancelo o registro }
     if qryDetalhes.State = dsInsert then
       dmoPrincipal.CancelarSequencia(ixTabelas[1],
         qryDetalhes.fieldByName(ixCampos[1].fisico).asInteger);
     dbnDetalhes.BtnClick(nbCancel);
     qryDetalhes.Close;

     Application.ProcessMessages;
     Screen.Cursor := crDefault;
end;

procedure TformFornecedores.btnModificarClick(Sender: TObject);
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

     { mostro a página do endereço }
     with pgcDetalhes do
       ActivePage := Pages[2];

     Application.ProcessMessages;
     Screen.Cursor := crDefault;
end;

procedure TformFornecedores.qryDetalhesAfterOpen(DataSet: TDataSet);
begin
     { mascaras }
     with Dataset do
      begin
       fieldByName('DATANASC').EditMask := '99/99/9999';
       fieldByName('DATAFUND').EditMask := '99/99/9999';
       fieldByName('CPF').EditMask := '999.999.999-99';
       fieldByName('IE').EditMask := 'aaa.aaa.999.9999';
       fieldByName('CGC').EditMask := '99.999.999/9999-99';
       fieldByName('DATACADAST').EditMask := '99/99/9999';
       fieldByName('FONE').EditMask := '(99)c999-9999';
       fieldByName('FAX').EditMask := '(99)c999-9999';
       fieldByName('CELULAR').EditMask := '(99)c999-9999';
       fieldByName('RG').EditMask := '999999999999999';
       fieldByName('ORGAOEXP').EditMask := 'ccc/cc';

       { rotinas de chamada }
       fieldByName('ESTADO').OnChange := fldESTADOmudar;
       fieldByName('CIDADE').OnChange := fldCIDADEmudar;
       fieldByName('LOCALIZACAO').OnChange := fldLOCALIDADEmudar;
       fieldByName('BAIRRO').OnChange := fldBAIRROmudar;

       { forço a primeira chamada }
       fldESTADOmudar(fieldByName('ESTADO'));
       fldCIDADEmudar(fieldByName('CIDADE'));
       fldLOCALIDADEmudar(fieldByName('LOCALIZACAO'));
       fldBAIRROmudar(fieldByName('BAIRRO'));

      end;

     busca_local := 0;

end;

procedure TformFornecedores.dbrPessoaChange(Sender: TObject);
begin
     case dbrPessoa.ItemIndex of
      0: begin
          tabPessoaFisica.TabVisible := True;
          tabPessoaJuridica.TabVisible := False;
          pgcDetalhes.ActivePage := tabPessoaFisica;
         end;
      1: begin
          tabPessoaJuridica.TabVisible := True;
          tabPessoaFisica.TabVisible := False;
          pgcDetalhes.ActivePage := tabPessoaJuridica;
         end;
      end;
     Application.ProcessMessages;
end;

procedure TformFornecedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := not qryDetalhes.Active;
end;

procedure TformFornecedores.fldESTADOmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacFornecedores.qryEstado do
    begin
     close;
     ParamByName('SIGLA').AsString := Sender.AsString;
     open;
    end;
end;

procedure TformFornecedores.fldCIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacFornecedores.qryCidades do
    begin
     close;
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     ParamByName('ESTADO').AsString :=
        qryDetalhes.fieldByName('ESTADO').AsString;
     open;
    end;
end;

procedure TformFornecedores.fldLOCALIDADEmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacFornecedores.qryLocalidades do
    begin
     close;
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     ParamByName('CIDADE').AsInteger :=
        qryDetalhes.fieldByName('CIDADE').AsInteger;
     ParamByName('ESTADO').AsString :=
        qryDetalhes.fieldByName('ESTADO').AsString;
     open;
     if qryDetalhes.State in [dsInsert, dsEdit] then
       qryDetalhes.fieldByName('BAIRRO').AsInteger :=
         fieldByName('BAIRRO').AsInteger;
    end;
end;

procedure TformFornecedores.fldBAIRROmudar(Sender: TField);
begin
  if Sender.AsString > '' then
   with dmoRelacFornecedores.qryBairros do
    begin
     close;
     ParamByName('CODIGO').AsInteger := Sender.AsInteger;
     ParamByName('CIDADE').AsInteger :=
        qryDetalhes.fieldByName('CIDADE').AsInteger;
     ParamByName('ESTADO').AsString :=
        qryDetalhes.fieldByName('ESTADO').AsString;
     open;
    end;
end;

procedure TformFornecedores.FormKeyDown(Sender: TObject; var Key: Word;
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
        vk_f2: begin
                if busca_local > 0 then
                 with TformNovaLocalidade.Create(Self) do
                  try
                   inCidade := qryDetalhes.fieldByName('CIDADE').AsInteger;
                   stEstado := qryDetalhes.fieldByName('ESTADO').AsString;
                   stCidade := dmoRelacFornecedores.qryCidades.fieldByName('CIDADE').AsString;
                   inLocal  := 0;
                   ShowModal;
                   if inLocal > 0 then qryDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
                  finally
                   release;
                  end;
               end;
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
       69: lblESTADOClick(Sender);
       67: lblCIDADEClick(Sender);
       76: lblLOCALIZACAOClick(Sender);
      end;
end;

procedure TformFornecedores.edtPesquisarEnter(Sender: TObject);
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

procedure TformFornecedores.edtPesquisarExit(Sender: TObject);
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

procedure TformFornecedores.btnSalvarClick(Sender: TObject);
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

     with dmoRelacFornecedores do
      begin
       qryCidades.Close;
       qryEstado.Close;
       qryLocalidades.Close;
      end;

     if edtPesquisar.Canfocus then cmbOrdenarChange(Sender);
     qrySelecionar.Locate(ixCampos[1].fisico,
         qryDetalhes.fieldByName(ixCampos[1].fisico).AsInteger, []);
     qryDetalhes.Close;
     Application.ProcessMessages;
     Screen.Cursor := crDefault;

end;

procedure TformFornecedores.lblESTADOClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformEstados.Create(Self) do
      try
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('ESTADO').AsString :=
           qrySelecionar.fieldByName('SIGLA').AsString;
      finally
       release;
      end;
     Application.ProcessMessages;
end;

procedure TformFornecedores.FormDestroy(Sender: TObject);
begin
     if qrySelecionar.Active then qrySelecionar.Close;
     qryDetalhes.Unprepare;
     dmoRelacFornecedores.free;
end;

procedure TformFornecedores.lblCIDADEClick(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     with TformCidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'')',
         [Self.qryDetalhes.fieldByName('ESTADO').AsString]),
         Format('Cidades no estado "%s"',
         [Self.qryDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
         Self.qryDetalhes.fieldByName('CIDADE').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
      finally
       release;
      end;
     Application.ProcessMessages;
end;

procedure TformFornecedores.lblLOCALIZACAOClick(Sender: TObject);
var
  nova: boolean;
begin
     Screen.Cursor := crHourGlass;
     inc(busca_local);
     nova := false;
     with TformLocalidades.Create(Self) do
      try
       SetWhereDynamic(Format('(ESTADO = ''%s'') AND ' +
         '(CIDADE = %d)',
         [Self.qryDetalhes.fieldByName('ESTADO').AsString,
          Self.qryDetalhes.fieldByName('CIDADE').AsInteger]),
         Format('Localidades para %s - %s',
         [Trim(dmoRelacFornecedores.qryCidades.fieldByName('CIDADE').AsString),
          Self.qryDetalhes.fieldByName('ESTADO').AsString]));
       Caption := Self.Caption + ' -> ' + Caption;
       ShowModal;
       if (ModalResult = mrOk) and (qrySelecionar.Active) then
        begin
         Self.qryDetalhes.fieldByName('LOCALIZACAO').AsString :=
           qrySelecionar.fieldByName('CODIGO').AsString;
         nova := not (qrySelecionar.fieldByName('CODIGO').AsString > '');
        end;
      finally
       release;
      end;

     if nova then
       with TformNovaLocalidade.Create(Self) do
        try
         inCidade := qryDetalhes.fieldByName('CIDADE').AsInteger;
         stEstado := qryDetalhes.fieldByName('ESTADO').AsString;
         stCidade := dmoRelacFornecedores.qryCidades.fieldByName('CIDADE').AsString;
         inLocal  := 0;
         ShowModal;
         if inLocal > 0 then qryDetalhes.FieldByName('LOCALIZACAO').AsInteger := inLocal;
        finally
         release;
        end;

     Application.ProcessMessages;
end;

procedure TformFornecedores.CheckCPF1Error(Sender: TObject);
begin
     ShowMessage('O CPF digitado não é um CPF válido.');
end;

procedure TformFornecedores.CheckCGC1Error(Sender: TObject);
begin
     ShowMessage('O CNPJ digitado não é um CNPJ válido.');
end;

procedure TformFornecedores.DBEdit17Enter(Sender: TObject);
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
     if qryDetalhes.fieldByName('LOCALIZACAO').AsString = '' then
       lblLOCALIZACAOClick(Sender);
end;

procedure TformFornecedores.grdDadosDblClick(Sender: TObject);
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

procedure TformFornecedores.qrySelecionarAfterScroll(DataSet: TDataSet);
begin
   if not Dataset.fieldByName('EMAIL').IsNull then
    begin
      btnEmail.Hint      := Trim(Dataset.fieldByName('EMAIL').AsString);
      btnEmail.Visible   := True;
    end else
    begin
      btnEmail.Hint      := '';
      btnEmail.Visible   := False;
    end;
end;

procedure TformFornecedores.btnImprimirClick(Sender: TObject);
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

procedure TformFornecedores.btnAdicionarMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformFornecedores.btnAdicionarMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

procedure TformFornecedores.btnEmailClick(Sender: TObject);
var
  x: string;
begin
  x := 'mailto:'+(Sender as TToolbarButton97).Hint+'?Subject=&cc=&bcc=';
  ShellExecute(0, nil, PChar(x), nil, nil, SW_SHOWDEFAULT);
end;

end.
