unit imprimirosaberta2;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  IBQuery, IBCustomDataSet, IBStoredProc,
  StdCtrls,
  ComCtrls,
  Grids,
  DBGrids,
  DOSPrint,
  Buttons,
  DBCtrls, ExtCtrls, IBDatabase;

type
  TformImprimirOSaberta2 = class(TForm)
    qryImpNota: TIBQuery;
    qryNotaCorpo: TIBQuery;
    dsrNotaCorpo: TDataSource;
    qryCabNota: TIBQuery;
    dsrCabNota: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Bevel1: TBevel;
    Panel2: TPanel;
    bbtOK: TBitBtn;
    BitBtn1: TBitBtn;
    ckLocal: TCheckBox;
    cbCopias: TComboBox;
    Label3: TLabel;
    traImpNota: TIBTransaction;
    traCabNota: TIBTransaction;
    traNotaCorpo: TIBTransaction;
    procedure Button1Click(Sender: TObject);
    procedure ImprimeNota(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryNotaCorpoBeforeOpen(DataSet: TDataSet);
    procedure qryImpNotaBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure qryCabNotaAfterOpen(DataSet: TDataSet);
    procedure qryCabNotaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    inCODMOVIMENTO,
    inNUMERONOTA: integer;
  end;

var
  formImprimirOSaberta2: TformImprimirOSaberta2;

implementation

uses data_principal;

{$R *.DFM}

procedure AplicaMascara(StrMascara: string; var CampoUnico: TField);
begin
  case CampoUnico.DataType of
    ftSmallInt,
      ftWord,
      ftFloat,
      ftCurrency,
      ftBCD,
      ftInteger: (CampoUnico as TNumericField).DisplayFormat := StrMascara;
    ftDateTime: (CampoUnico as TDateTimeField).DisplayFormat := StrMascara;
  end;
end;

procedure AplicaEfeito(StrEfeito: string; var EfeitoUnico: string);
var
  n: integer;
begin
  for n := 1 to length(StrEfeito) do
    case StrEfeito[n] of
      'N': EfeitoUnico := EfeitoUnico + '1'; // Negrito
      'I': EfeitoUnico := EfeitoUnico + '2'; // Itálico
      'C': EfeitoUnico := EfeitoUnico + '4'; // Comprimido
      'S': EfeitoUnico := EfeitoUnico + '3'; // Sublinhado
      'E': EfeitoUnico := EfeitoUnico + '5'; // Expandido
      'X': EfeitoUnico := EfeitoUnico + '6'; // SUPERCOMP
    end;
end;

function AplicaAlinhamento(StrTexto, StrAlinha: string; inTamanho: integer): string;
begin
  { removo os espaços desnecessários }
  StrTexto := trim(StrTexto);

  { alinho adicionando espaços conforme a necessidade }
  if StrAlinha = 'E' then
    begin
      if length(StrTexto) > inTamanho then
        Result := Copy(StrTexto, 1, inTamanho)
      else
        begin
          while length(StrTexto) < inTamanho do
            StrTexto := StrTexto + ' ';
          Result := StrTexto;
        end;
    end
  else if StrAlinha = 'D' then
    begin
      if length(StrTexto) > inTamanho then
        Result := Copy(StrTexto, length(StrTexto) - inTamanho + 1, inTamanho)
      else
        begin
          while length(StrTexto) < inTamanho do
            StrTexto := ' ' + StrTexto;
          Result := StrTexto;
        end;
    end
  else if StrAlinha = 'C' then
    begin
      if length(StrTexto) > inTamanho then
        Result := Copy(StrTexto, (length(StrTexto) - inTamanho) div 2, inTamanho)
      else
        begin
          while length(StrTexto) < inTamanho do
            begin
              StrTexto := ' ' + StrTexto;
              if length(StrTexto) < inTamanho then
                StrTexto := StrTexto + ' ';
            end;
          Result := StrTexto;
        end;
    end;
end;

procedure QuebraCampo(var todo, parte: string; tamanho: integer);
var
  n: integer;
begin
  if length(todo) > tamanho then
    begin

      // procuro um espaco, ou "-"
      n := tamanho + 1;
      repeat
        dec(n);
      until (todo[n] in [' ', '-']) or (n = 1);

      // cheguei no inicio?
      if n = 1 then
        begin

          // corto no tamanho justo
          parte := copy(todo, 1, tamanho);
          todo := copy(todo, tamanho + 1, length(todo) - tamanho + 1);

        end
      else
        begin

          // vou aproveitar um caracter de separacao;
          if todo[n] = ' ' then
            begin

              // corto e suprimo o espaço
              parte := copy(todo, 1, n - 1);
              todo := copy(todo, n + 1, length(todo) - n + 1);

            end
          else
            begin

              // corto usando o separador
              parte := copy(todo, 1, n);
              todo := copy(todo, n + 1, length(todo) - n + 1);

            end;
        end;

    end
  else
    begin
      parte := todo;
      todo := '';
    end;
end;

function isLiteral(StrTexto: string): boolean;
begin
  Result := StrTexto[1] = '"';
end;

function FormataLiteral(StrTexto: string): string;
var
  StrHnd: string;
  n: integer;
begin
  StrHnd := StrTexto;
  // apago a primeira ocorrencia de aspas
  Delete(StrHnd, 1, 1);
  // procuro a ultima ocorrencia e apago, se houver
  n := succ(length(StrHnd));
  repeat
    dec(n);
  until (StrHnd[n] = '"') or (n = 1);
  Result := Copy(StrHnd, 1, pred(n));
end;

procedure TformImprimirOSaberta2.ImprimeNota(Sender: TObject);
var
  Campo: TField;
  CampoStr, ParteStr, IniComm: string;
  Efeito, estilobase: string;
  n, altura, desvio, desvio_master: integer;
type
  Str01 = string[1];
  TipoReg = record
    tipo: Str01;
    callproc: string;
    SQL: string;
  end;
const
  Tipos: array[1..4] of TipoReg =
  ((tipo: 'C';
    callproc: 'REL_NOTACORPO';
    sql:
    'SELECT * FROM REL_NOTACORPO(:CODMOVIMENTO)'),
    (tipo: 'D';
    callproc: 'REL_NOTADUP';
    sql:
    'SELECT * FROM REL_NOTADUP(:CODMOVIMENTO)'),
    (tipo: 'P';
    callproc: 'REL_NOTAPRO';
    sql:
    'SELECT * FROM REL_NOTAPRO(:CODMOVIMENTO)'),
    (tipo: 'S';
    callproc: 'REL_NOTASER';
    sql:
    'SELECT * FROM REL_NOTASER(:CODMOVIMENTO)'));
begin

  // reset na impressora
  IniComm := #27#64;
  if qryCabNota.fieldByName('LINHA18').AsString = 'S' then
    IniComm := IniComm + #27#48
  else
    IniComm := IniComm + #27#50;
  IniComm := IniComm + #27#67 +
    Chr(qryCabNota.fieldByName('ALTURA').AsInteger);

  // estilo base
  estilobase := '';
  AplicaEfeito(
     qryCabNota.fieldByName('EFEITOBASE').AsString,
     estilobase
  );

  // Inicializo minha impressora DOS
  if (Pos(uppercase(dmoPrincipal.NomeComputador),
     uppercase(dmoPrincipal.cdsConfig.fieldByName('PRINT_OS_2A').AsString) ) > 0)
     or CkLocal.Checked then

    DOSPrintOpen('LPT1:', IniComm, estilobase)

  else

    DOSPrintOpen(
      Trim(qryCabNota.fieldByName('PRINT_NOTA').AsString),
      IniComm, estilobase);

  for n := 1 to 4 do
    begin

      // defino a consulta que traz os parametros
      if qryImpNota.Active then
        qryImpNota.Close;
      qryImpNota.paramByName('TIPO').AsString := Tipos[n].tipo;
      qryImpNota.Open;

      // defino a consulta que traz os dados
      if qryNotaCorpo.Active then
        qryNotaCorpo.Close;
      qryNotaCorpo.SQL.Text := Tipos[n].sql;
      qryNotaCorpo.Open;

      // desvio de impressao das linhas
      // ESSE RECURSO EH USADO NOS ITENS DOS PRODUTOS PARA GARANTIR
      // QUEBRA DE LINHA SEM DEIXAR LINHAS EM BRANCO ENTRE PRODUTOS
      desvio := 0;
      desvio_master := 0;

      // laço dos campos
      while not (qryImpNota.EOF or qryNotaCorpo.EOF) do
        begin

          // Verifico se eh literal
          if isLiteral(
            Trim(qryImpNota.fieldByName('CAMPO').AsString)
            ) then
            begin

              // Formato o campo final como Literal
              CampoStr := FormataLiteral(
                Trim(qryImpNota.fieldByName('CAMPO').AsString)
                );

            end
          else
            begin

              // separo o campo a ser impresso
              Campo := qryNotaCorpo.fieldByName(
                Trim(qryImpNota.fieldByName('CAMPO').AsString)
                );

              // defino a máscara
              AplicaMascara(
                qryImpNota.fieldByName('MASCARA').AsString,
                Campo
                );

              // Campo em formato final
              CampoStr := Campo.DisplayText;

            end;

          // defino os efeitos
          Efeito := '';
          AplicaEfeito(
            qryImpNota.fieldByName('EFEITO').AsString,
            Efeito
            );

          // se for multilinhas
          for altura := 1 to qryImpNota.fieldByName('ALTURA').AsInteger do
            begin

              // quebra o campo
              QuebraCampo(CampoStr, ParteStr,
                qryImpNota.fieldByName('TAMANHO').AsInteger);

              // defino o alinhamento
              ParteStr := AplicaAlinhamento(
                ParteStr,
                qryImpNota.fieldByName('ALINHAMENTO').AsString,
                qryImpNota.fieldByName('TAMANHO').AsInteger
                );

              // Imprimo o campo no local designado se for preciso
              if (altura = 1) or ((altura > 1) and (trim(ParteStr) > '')) then
               begin
                DOSPrintAdd(
                  qryImpNota.fieldByName('COLUNA').AsInteger,
                  qryImpNota.fieldByName('LINHA').AsInteger +
                  altura - 1 + desvio_master,
                  ParteStr,
                  Efeito
                  );
                if altura > 1 then inc(desvio);
               end;

            end;

          // ajusto o desvio
          if desvio > 0 then
           begin
            desvio_master := desvio_master + desvio;
            desvio := 0;
           end;

          // proximo conjunto de dados
          if qryImpNota.fieldByName('PROXIMO').AsString = 'S' then
            qryNotaCorpo.Next;

          // proximo campo
          qryImpNota.Next;
        end;

    end;

  DOSPrintSendPage(succ(cbCopias.ItemIndex));
  DOSPrintClose;
end;

procedure TformImprimirOSaberta2.Button1Click(Sender: TObject);
begin

  ImprimeNota(Sender);

end;

procedure TformImprimirOSaberta2.FormCreate(Sender: TObject);
var
  inI: Integer;
begin

  // Usar no OnCreate do Formulário
  for inI := 0 to Pred(ComponentCount) do
    if (Components[inI] is TIBQuery) and
      (AnsiCompareText('qryNotaCorpo', Components[inI].Name) <> 0) then
      (Components[inI] as TIBQuery).Prepare;

end;

procedure TformImprimirOSaberta2.qryNotaCorpoBeforeOpen(DataSet: TDataSet);
begin
  with (DataSet as TIBQuery) do
    paramByName('CODMOVIMENTO').AsInteger := inCODMOVIMENTO;      
end;

procedure TformImprimirOSaberta2.qryImpNotaBeforeOpen(DataSet: TDataSet);
begin
  with (DataSet as TIBQuery) do
    paramByName('NUMIMPNOTA').AsInteger :=
      qryCabNota.fieldByName('NUMIMPNOTA').AsInteger;
end;

procedure TformImprimirOSaberta2.FormShow(Sender: TObject);
begin
   Label1.Caption := Label1.Caption +
     ' n° ' + Format('%.6d', [inNUMERONOTA]);

   with qryCabNota do
    begin
      if Active then close;
      Open;
    end;

   with qryImpNota do
    begin
      if Active then Close;
      Open;
    end;

   bbtOk.SetFocus;
end;

procedure TformImprimirOSaberta2.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TformImprimirOSaberta2.qryCabNotaAfterOpen(DataSet: TDataSet);
begin
   cbCopias.ItemIndex :=
     pred(Dataset.fieldByName('COPIAS').AsInteger);
end;

procedure TformImprimirOSaberta2.qryCabNotaBeforeOpen(DataSet: TDataSet);
begin
  with (Dataset as TIBQuery) do
    paramByName('CODEMPRESA').AsInteger :=
      dmoPrincipal.empresa;
end;

end.
