unit untPrintBoleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, db, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc;

type
  TformPrintBoleto = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblNome: TLabel;
    Label1: TLabel;
    lblImpressora: TLabel;
    qryCabBoleto: TIBQuery;
    qryImpBoleto: TIBQuery;
    qryBoletoCorpo: TIBQuery;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure GerarBoletos;
  public
    { Public declarations }
  end;

var
  formPrintBoleto: TformPrintBoleto;

implementation

uses DOSPrint;

{$R *.DFM}

procedure AplicaMascara(StrMascara: string; var CampoUnico: TField);
begin
  case CampoUnico.DataType of
    ftSmallInt,
    ftWord,
    ftFloat,
    ftCurrency,
    ftBCD,
    ftInteger : (CampoUnico as TNumericField).DisplayFormat  := StrMascara;
    ftDateTime: (CampoUnico as TDateTimeField).DisplayFormat := StrMascara;
  end;
end;

procedure AplicaEfeito(StrEfeito: string; var EfeitoUnico: string);
var
	n: integer;
begin
  for n := 1 to length(StrEfeito) do
    case StrEfeito[n] of
      'N': EfeitoUnico := EfeitoUnico + '1';   // Negrito
      'I': EfeitoUnico := EfeitoUnico + '2';   // Itálico
      'C': EfeitoUnico := EfeitoUnico + '4';   // Comprimido
      'S': EfeitoUnico := EfeitoUnico + '3';   // Sublinhado
      'E': EfeitoUnico := EfeitoUnico + '5';   // Expandido
    end;
end;

function AplicaAlinhamento(StrTexto, StrAlinha: string; inTamanho: integer): string;
begin
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
   end else
  if StrAlinha = 'D' then
   begin
    if length(StrTexto) > inTamanho then
      Result := Copy(StrTexto, length(StrTexto) - inTamanho + 1, inTamanho)
    else
    begin
      while length(StrTexto) < inTamanho do
      	StrTexto := ' ' + StrTexto;
      Result := StrTexto;
    end;
   end else
  if StrAlinha = 'C' then
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

procedure TformPrintBoleto.GerarBoletos;
var
	Campo: TField;
  CampoStr, IniComm: string;
  Efeito: string;
  n: integer;
begin

			IniComm := #27#64;
      if qryCabBoleto.fieldByName('LINHA18').AsString = 'S' then
         IniComm := IniComm + #27#48
      else
      	 IniComm := IniComm + #27#50;
      IniComm := IniComm + #27#67 +
         Chr(qryCabBoleto.fieldByName('ALTURA').AsInteger);

      DOSPrintOpen(qryCabBoleto.fieldByname('IMPRESSORABoleto').AsString, IniComm);

      // defino a consulta que traz os parametros
      if qryImpBoleto.Active then
        qryImpBoleto.Close;
      qryImpBoleto.paramByName('TIPO').AsString := 'D';
      qryImpBoleto.Open;

      // laço dos campos
      qryImpBoleto.First;
      while not ( qryImpBoleto.EOF ) do
       begin

        // Verifico se eh literal
        if isLiteral(
          qryImpBoleto.fieldByName('CAMPO').AsString
          ) then
          begin

            // Formato o campo final como Literal
            CampoStr := FormataLiteral(
              qryImpBoleto.fieldByName('CAMPO').AsString
              );

          end else
          begin

            // separo o campo a ser impresso
            Campo := qryBoletoCorpo.fieldByName(
              qryImpBoleto.fieldByName('CAMPO').AsString
              );

            // defino a máscara
            AplicaMascara(
              qryImpBoleto.fieldByName('MASCARA').AsString,
              Campo
              );

            // Campo em formato final
            CampoStr := Campo.DisplayText;

          end;

        // defino os efeitos
        Efeito := '';
        AplicaEfeito(
          qryImpBoleto.fieldByName('EFEITO').AsString,
          Efeito
          );

        // defino o alinhamento
        CampoStr := AplicaAlinhamento(
          CampoStr,
          qryImpBoleto.fieldByName('ALINHAMENTO').AsString,
          qryImpBoleto.fieldByName('TAMANHO').AsInteger
          );

        // Imprimo o campo no local designado
        DOSPrintAdd(
          qryImpBoleto.fieldByName('COLUNA').AsInteger,
          qryImpBoleto.fieldByName('LINHA').AsInteger,
          CampoStr,
          Efeito
          );

        // proximo campo
        qryImpBoleto.Next;
       end;

			DOSPrintSendPage(1);
      DOSPrintClose;
end;

procedure TformPrintBoleto.BitBtn2Click(Sender: TObject);
begin
   // informações dos campos
	 qryImpBoleto.Close;
   with qryImpBoleto do
    begin
     open;

     // defino a consulta que traz os dados
     if qryBoletoCorpo.Active then
       qryBoletoCorpo.Close;
     qryBoletoCorpo.Open;
     while not qryBoletoCorpo.EOF do
      begin
	     GerarBoletos;
       qryBoletoCorpo.Next;
      end;
    end;

   close;
end;

end.
