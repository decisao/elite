unit regua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, Buttons, ExtCtrls;

type
  TformRegua = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    nLinhas: TRxSpinEdit;
    nColunas: TRxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    c18: TCheckBox;
    cComp: TCheckBox;
    ePorta: TEdit;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRegua: TformRegua;

implementation

uses DOSPrint;

{$R *.DFM}

procedure TformRegua.BitBtn2Click(Sender: TObject);
var
  inicial, efeito: string;
  coluna, linha: integer;
begin
  { verifico se eh comprimido }
  if cComp.checked then
    efeito := '1'
  else
    efeito := '';
  { verifico se vai ser com 1/8 de linha }
  if c18.checked then
    inicial := #27#48
  else
    inicial := #27#50;
  { inicio a impressao }
  DOSPrintOpen(ePorta.text, inicial, '');
  { linhas e colunas }
  for linha := 0 to Trunc(nLinhas.value) - 1 do
   for coluna := 0 to Trunc(nColunas.value) - 1 do
     if linha = 0 then
       DOSPrintAdd(coluna, linha, IntToStr(coluna mod 10), efeito)
     else if coluna = 0 then
       DOSPrintAdd(coluna, linha, IntToStr(linha), efeito);
  { fechamento da impressao }
  DOSPrintSendPage(1);
  DOSPrintClose;
end;

procedure TformRegua.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

end.
