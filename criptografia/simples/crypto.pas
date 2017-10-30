unit crypto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TformCrypto = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCrypto: TformCrypto;

implementation

uses sysdba;

{$R *.DFM}

procedure TformCrypto.Button1Click(Sender: TObject);
var
  texto,
  textohex,
  textorev: string;
  i: byte;
begin

  { rotina de criptografia 1}
  texto    := edit1.text;
  textohex := '';
  textorev := '';

  { criptografo }
  for i := 1 to length(texto) do
    texto[i] := chr(not ord(texto[i]));

  { hex }
  for i := 1 to length(texto) do
    textohex := textohex + '#' + IntToStr(ord(texto[i]));

  { revertido }
  for i := 1 to length(texto) do
    textorev := textorev + chr(not ord(texto[i]));

  edit2.text := texto;
  edit3.text := textohex;
  edit4.text := textorev;

end;

procedure TformCrypto.Button2Click(Sender: TObject);
const
  chave: string = 'adriana';
var
  texto,
  textohex,
  textorev: string;
  i: byte;
begin

  { rotina de criptografia 1}
  texto    := edit1.text;
  textohex := '';
  textorev := '';
  chave    := edit5.text;

  { criptografo }
  for i := 1 to length(texto) do
    texto[i] := chr(ord(texto[i]) xor ord(chave[(i mod length(chave))+1]));

  { hex }
  for i := 1 to length(texto) do
    textohex := textohex + '#' + IntToStr(ord(texto[i]));

  { revertido }
  for i := 1 to length(texto) do
    textorev := textorev + chr(ord(texto[i]) xor ord(chave[(i mod length(chave))+1]));

  edit2.text := texto;
  edit3.text := textohex;
  edit4.text := textorev;

end;

procedure TformCrypto.Button3Click(Sender: TObject);
begin
  with TformSysdba.Create(Self) do
   try
    if ShowModal = mrOK then Self.Edit1.Text := palavra;
   finally
    release;
   end;
end;

end.
