unit Prin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, MmSystem, Menus, ChessBrd, ToolWin, ComCtrls, Spin, ExtCtrls,
  MPlayer, Shellapi;

type
  TfrmPrin = class(TForm)
    Painel1: TPanel;
    Frente2: TPanel;
    ChessBrd1: TChessBrd;
    MainMenu1: TMainMenu;
    Jogo1: TMenuItem;
    Avanar1: TMenuItem;
    Retroceder1: TMenuItem;
    NovoJogo1: TMenuItem;
    Opes1: TMenuItem;
    TiposdePeas1: TMenuItem;
    Coordenadas1: TMenuItem;
    Linhas1: TMenuItem;
    BrancasemCima1: TMenuItem;
    PeasBrancas1: TMenuItem;
    PeasPretas1: TMenuItem;
    btVoltar: TSpeedButton;
    btParar: TSpeedButton;
    btAvancar: TSpeedButton;
    btPensar: TSpeedButton;
    btNovo: TSpeedButton;
    Label1: TLabel;
    ListBox1: TListBox;
    ParardePensar1: TMenuItem;
    Continuar1: TMenuItem;
    Imprimir1: TMenuItem;
    Sair1: TMenuItem;
    N2: TMenuItem;
    Humano1: TMenuItem;
    Computador1: TMenuItem;
    Humano2: TMenuItem;
    Computador2: TMenuItem;
    btoutro: TSpeedButton;
    S1: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ConfigurarImpresso1: TMenuItem;
    Imprimir2: TMenuItem;
    RichEdit1: TRichEdit;
    ImprimirFormulrio1: TMenuItem;
    Normal1: TMenuItem;
    N3Dimenso1: TMenuItem;
    TamanhoPequeno1: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Salvar1: TMenuItem;
    SalvarComo1: TMenuItem;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    Abrir1: TMenuItem;
    OpenDialog1: TOpenDialog;
    N1: TMenuItem;
    Nvel1: TMenuItem;
    Principiante1: TMenuItem;
    Novato1: TMenuItem;
    NvelMdio1: TMenuItem;
    Experiente1: TMenuItem;
    Mestre1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure  erros (Sender: TObject; E: Exception);
    procedure ListBox1Click(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure ChessBrd1LegalMove(Sender: TObject; oldSq, newSq: Square);
    procedure btAvancarClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure btPararClick(Sender: TObject);
    procedure btPensarClick(Sender: TObject);
    procedure Principiante1Click(Sender: TObject);
    procedure Novato1Click(Sender: TObject);
    procedure NvelMdio1Click(Sender: TObject);
    procedure Experiente1Click(Sender: TObject);
    procedure Mestre1Click(Sender: TObject);
    procedure BrancasemCima1Click(Sender: TObject);
    procedure Coordenadas1Click(Sender: TObject);
    procedure Linhas1Click(Sender: TObject);
    procedure ChessBrd1Mate(Sender: TObject; oldSq, newSq: Square);
    procedure ChessBrd1Capture(Sender: TObject; oldSq, newSq: Square;
      CapturedPiece: Char);
    procedure ChessBrd1Draw(Sender: TObject);
    procedure Retroceder1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure NovoJogo1Click(Sender: TObject);
    procedure Avanar1Click(Sender: TObject);
    procedure ParardePensar1Click(Sender: TObject);
    procedure Continuar1Click(Sender: TObject);
    procedure Humano1Click(Sender: TObject);
    procedure Computador1Click(Sender: TObject);
    procedure Humano2Click(Sender: TObject);
    procedure Computador2Click(Sender: TObject);
    procedure ChessBrd1Check(Sender: TObject; oldSq, newSq: Square);
    procedure S1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChessBrd1Promotion(Sender: TObject; oldSq, newSq: Square;
      var NewPiece: Char);
    procedure ConfigurarImpresso1Click(Sender: TObject);
    procedure Imprimir2Click(Sender: TObject);
    procedure ImprimirFormulrio1Click(Sender: TObject);
    procedure ChessBrd1IllegalMove(Sender: TObject; square: Square);
    procedure Normal1Click(Sender: TObject);
    procedure N3Dimenso1Click(Sender: TObject);
    procedure TamanhoPequeno1Click(Sender: TObject);
    procedure btoutroClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure SalvarComo1Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
   NomeArq: string;
   Alterado: Boolean;
  public
    function Salvar: Boolean;
    function SalvarComo: Boolean;
  end;

var
  frmPrin: TfrmPrin;

implementation

uses Sobre;

{$R *.DFM}

procedure TFrmPrin.Erros(Sender: TObject; E:Exception);
var
  mens: String;
begin
    mens := '';

    if E is EInOutError then
    Mens := 'Erro de arquivo'
    Else
    if E is EOutofMemory then
    Mens := 'Falta de memória'
    Else
    if E is EConvertError then
    Mens := 'Erro na conversão de dados';

    if Mens = '' then    Exit
	{ showmessage(entrada + ' Papirus v.01') }
	 else
	 Showmessage(Mens);
	 end;

function TFrmPrin.Salvar: Boolean;
Begin
If NomeArq = '' then
   Result:= SalvarComo // pede um nome de arquivo
   else
   begin
   Panel1.Caption:= 'Salvando o Jogo Xadrez 2000!';
   Memo1.Lines.SaveToFile (NomeArq);
   Alterado:= False;
   Result:= True;
   end;
end;

function TfrmPrin.SalvarComo: Boolean;
begin
SaveDialog1.FileName:= NomeArq;
If SaveDialog1.Execute then
begin
NomeArq:= SaveDialog1.FileName;
Salvar;
Caption:= 'Xadrez 2000 - ' + NomeArq;
Result:= True;
Panel1.Caption:= 'Salvando o Jogo Xadrez 2000!';
end
else
Result:= False;
end;

procedure TfrmPrin.ListBox1Click(Sender: TObject);
begin
    Chessbrd1.GotoMove(1+(ListBox1.ItemIndex+1) shr 1,((ListBox1.ItemIndex+1) mod 2)=0);
end;

procedure TfrmPrin.btNovoClick(Sender: TObject);
var
    list: TStringList;
begin
    NomeArq:= '';
    Caption:= 'Xadrez 2000 - Novo Jogo';
    Chessbrd1.NewGame;
    Chessbrd1.Think;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
    Panel1.Caption:= 'Iniciando o Jogo!';
    Edit1.Text:= DateTimeToStr(Now);
    Edit2.Text:= '';
    Edit3.Text:= '';
end;

procedure TfrmPrin.ChessBrd1LegalMove(Sender: TObject; oldSq,
  newSq: Square);
var
    list: TStringList;
begin
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
    Panel1.Caption:= 'Continuando a partida!';
end;

procedure TfrmPrin.btAvancarClick(Sender: TObject);
var
    list: TStringList;
begin
    Chessbrd1.MoveForward;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
end;

procedure TfrmPrin.btVoltarClick(Sender: TObject);
var
    list: TStringList;
begin
    Chessbrd1.MoveBackward;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
end;

procedure TfrmPrin.btPararClick(Sender: TObject);
begin
    Chessbrd1.CancelThinking;
    Panel1.Caption:= 'Pausa na partida!';
end;

procedure TfrmPrin.btPensarClick(Sender: TObject);
begin
    Chessbrd1.Think;
    Panel1.Caption:= 'Continuando a partida!';
end;

procedure TfrmPrin.Principiante1Click(Sender: TObject);
begin
Principiante1.Checked:= True;
Novato1.Checked:= False;
NvelMdio1.Checked:= False;
Experiente1.Checked:= False;
Mestre1.Checked:= False;
Chessbrd1.SearchDepth:=1;
end;

procedure TfrmPrin.Novato1Click(Sender: TObject);
begin
Principiante1.Checked:= False;
Novato1.Checked:= True;
NvelMdio1.Checked:= False;
Experiente1.Checked:= False;
Mestre1.Checked:= False;
Chessbrd1.SearchDepth:=2;
end;

procedure TfrmPrin.NvelMdio1Click(Sender: TObject);
begin
Principiante1.Checked:= False;
Novato1.Checked:= False;
NvelMdio1.Checked:= True;
Experiente1.Checked:= False;
Mestre1.Checked:= False;
Chessbrd1.SearchDepth:=3;
end;

procedure TfrmPrin.Experiente1Click(Sender: TObject);
begin
Principiante1.Checked:= False;
Novato1.Checked:= False;
NvelMdio1.Checked:= False;
Experiente1.Checked:= True;
Mestre1.Checked:= False;
Chessbrd1.SearchDepth:=4;
end;

procedure TfrmPrin.Mestre1Click(Sender: TObject);
begin
Principiante1.Checked:= False;
Novato1.Checked:= False;
NvelMdio1.Checked:= False;
Experiente1.Checked:= False;
Mestre1.Checked:= True;
Chessbrd1.SearchDepth:=5;
end;

procedure TfrmPrin.BrancasemCima1Click(Sender: TObject);
begin
    if (Brancasemcima1.Checked = False) then
    begin
        Brancasemcima1.Checked:= True;
        Chessbrd1.WhiteOnTop:= True;
    end
    else
    begin
        Brancasemcima1.Checked:= False;
        Chessbrd1.WhiteOnTop:= False;
        end;
end;

procedure TfrmPrin.Coordenadas1Click(Sender: TObject);
var
    cset: CoordSet;
begin
    if (Coordenadas1.Checked = False) then
    begin
        Coordenadas1.Checked:= True;
        Include (cset,North);
        Include (cset,East);
        Include (cset,West);
        Include (cset,South);
    end
    else
    begin
        Coordenadas1.Checked:= False;
        Exclude (cset,North);
        Exclude (cset,East);
        Exclude (cset,West);
        Exclude (cset,South);
    end;
    Chessbrd1.DisplayCoords:=cset;

end;

procedure TfrmPrin.Linhas1Click(Sender: TObject);
begin
    if (Linhas1.Checked = False) then
    begin
        Linhas1.Checked:= True;
        Chessbrd1.BoardLines:= True;
    end
    else
    begin
        Linhas1.Checked:= False;
        Chessbrd1.BoardLines:= False;
        end;
end;

procedure TfrmPrin.ChessBrd1Mate(Sender: TObject; oldSq, newSq: Square);
begin
  PlaySound (PChar ('mate.wav'),
  0, snd_Async);
  Edit2.Text:= DateTimeToStr(Now);
  Edit3.Text:= TimeToStr(StrToDateTime(Edit2.Text) - StrToDateTime(Edit1.Text));
  Panel1.Caption:= 'XEQUE MATE! Tempo: ' + Edit3.Text + ' hs';
end;

procedure TfrmPrin.ChessBrd1Capture(Sender: TObject; oldSq, newSq: Square;
  CapturedPiece: Char);
begin
  PlaySound (PChar ('Captura.wav'),
  0, snd_Async);
  Panel1.Caption:= 'Peça capturada!';
end;

procedure TfrmPrin.ChessBrd1Draw(Sender: TObject);
begin
  PlaySound (PChar ('Empate.wav'),
  0, snd_Async);
  Edit2.Text:= DateTimeToStr(Now);
  Edit3.Text:= TimeToStr(StrToDateTime(Edit2.Text) - StrToDateTime(Edit1.Text));
  Panel1.Caption:= 'Partida empatada! - Tempo: ' + Edit3.Text + ' hs';
end;

procedure TfrmPrin.Retroceder1Click(Sender: TObject);
var
    list: TStringList;
begin
    Chessbrd1.MoveBackward;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
end;

procedure TfrmPrin.Sair1Click(Sender: TObject);
begin
close;
end;

procedure TfrmPrin.NovoJogo1Click(Sender: TObject);
var
    list: TStringList;
begin
    NomeArq:= '';
    Caption:= 'Xadrez 2000 - Nova Partida';
    Chessbrd1.NewGame;
    Chessbrd1.Think;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
    Panel1.Caption:= 'Iniciando a Partida!';
    Edit1.Text:= TimeToStr(Time);
    Edit2.Text:= '';
    Edit3.Text:= '';
end;

procedure TfrmPrin.Avanar1Click(Sender: TObject);
var
    list: TStringList;
begin
    Chessbrd1.MoveForward;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;
end;

procedure TfrmPrin.ParardePensar1Click(Sender: TObject);
begin
    Chessbrd1.CancelThinking;
    Panel1.Caption:= 'Pausa na Partida!';
end;

procedure TfrmPrin.Continuar1Click(Sender: TObject);
begin
    Chessbrd1.Think;
    Panel1.Caption:= 'Continuando a Partida!';
end;

procedure TfrmPrin.Humano1Click(Sender: TObject);
begin
    if (Humano1.Checked = False) then
    begin
        Humano1.Checked:= True;
        Computador1.Checked:= False;
        Chessbrd1.ComputerPlaysWhite:= False;
    end
    else
    begin
        Humano1.Checked:= False;
        Computador1.Checked:= True;
        Chessbrd1.ComputerPlaysWhite:= True;
        end;
end;

procedure TfrmPrin.Computador1Click(Sender: TObject);
begin
    if (Computador1.Checked = False) then
    begin
        Humano1.Checked:= False;
        Computador1.Checked:= True;
        Chessbrd1.ComputerPlaysWhite:= True;
    end
    else
    begin
        Humano1.Checked:= True;
        Computador1.Checked:= False;
        Chessbrd1.ComputerPlaysWhite:= True;
        end;
end;

procedure TfrmPrin.Humano2Click(Sender: TObject);
begin
    if (Humano2.Checked = False) then
    begin
        Humano2.Checked:= True;
        Computador2.Checked:= False;
        Chessbrd1.ComputerPlaysBlack:= False;
    end
    else
    begin
        Humano2.Checked:= False;
        Computador2.Checked:= True;
        Chessbrd1.ComputerPlaysBlack:= True;
        end;
end;

procedure TfrmPrin.Computador2Click(Sender: TObject);
begin
 if (Computador2.Checked = False) then
    begin
        Humano2.Checked:= False;
        Computador2.Checked:= True;
        Chessbrd1.ComputerPlaysBlack:= True;
    end
    else
    begin
        Humano2.Checked:= True;
        Computador2.Checked:= False;
        Chessbrd1.ComputerPlaysBlack:= True;
        end;
end;



procedure TfrmPrin.ChessBrd1Check(Sender: TObject; oldSq, newSq: Square);
begin
  PlaySound (PChar ('Cheque.wav'),
  0, snd_Async);
  Panel1.Caption:= 'Xeque!';
end;

procedure TfrmPrin.S1Click(Sender: TObject);
begin
    if (s1.Checked = True) then
    begin
    s1.Checked:= False;
    MediaPlayer1.Stop;
    MediaPlayer1.Notify := False;
    end
    else
    begin
    s1.Checked:= True;
    MediaPlayer1.Notify := True;
    MediaPlayer1.Play;
    end;
end;

procedure TfrmPrin.FormCreate(Sender: TObject);
begin
    application.title := 'Xadrez 2000';
    application.onexception:=erros;
    MediaPlayer1.Filename := 'bachbmin.mid';
    MediaPlayer1.Open;
    MediaPlayer1.Notify := True;
    MediaPlayer1.Play;
    Edit1.Text:= DateTimeToStr(Now);
end;

procedure TfrmPrin.ChessBrd1Promotion(Sender: TObject; oldSq,
  newSq: Square; var NewPiece: Char);
begin
  PlaySound (PChar ('Bell.wav'),
  0, snd_Async);
  Panel1.Caption:= 'Peão Promovido!';
end;

procedure TfrmPrin.ConfigurarImpresso1Click(Sender: TObject);
begin
PrinterSetupDialog1.Execute;
end;

procedure TfrmPrin.Imprimir2Click(Sender: TObject);
begin
RichEdit1.Lines:= ListBox1.Items;
RichEdit1.Print (NomeArq);
end;

procedure TfrmPrin.ImprimirFormulrio1Click(Sender: TObject);
begin
frmPrin.Print;
end;

procedure TfrmPrin.ChessBrd1IllegalMove(Sender: TObject; square: Square);
begin
    Panel1.Caption:= 'Lance errado!';
end;

procedure TfrmPrin.Normal1Click(Sender: TObject);
begin
    if (Normal1.Checked = False) then
    begin
        Normal1.Checked:= True;
        N3Dimenso1.Checked:= False;
        TamanhoPequeno1.Checked:= False;
        Chessbrd1.StandardSize:= Size40;
end;
end;

procedure TfrmPrin.N3Dimenso1Click(Sender: TObject);
begin
    if (N3Dimenso1.Checked = False) then
    begin
        Normal1.Checked:= False;
        N3Dimenso1.Checked:= True;
        TamanhoPequeno1.Checked:= False;
        Chessbrd1.StandardSize:= SizeAndrew40;
end;
end;

procedure TfrmPrin.TamanhoPequeno1Click(Sender: TObject);
begin
    if (TamanhoPequeno1.Checked = False) then
    begin
        Normal1.Checked:= False;
        N3Dimenso1.Checked:= False;
        TamanhoPequeno1.Checked:= True;
        Chessbrd1.StandardSize:= SizeCm36;
end;
end;

procedure TfrmPrin.btoutroClick(Sender: TObject);
begin
RichEdit1.Lines:= ListBox1.Items;
RichEdit1.Print (NomeArq);
end;

procedure TfrmPrin.Salvar1Click(Sender: TObject);
begin
Memo1.Text:= ChessBrd1.Position;
Salvar;
end;

procedure TfrmPrin.Abrir1Click(Sender: TObject);
var
    list: TStringList;
begin
If OpenDialog1.Execute then
begin
    Edit1.Text:= TimeToStr(Time);
    Chessbrd1.NewGame;
    Chessbrd1.Think;
    list:=TStringList.Create;
    Chessbrd1.GetMoveList(list);
    ListBox1.Items:=list;
    list.Free;

NomeArq:= OpenDialog1.FileName;
Memo1.Lines.LoadFromFile (NomeArq);
Alterado:= False;
Caption:= 'Fast Chess - '+ NomeArq;
ChessBrd1.Position:= Memo1.Text;
Panel1.Caption:= 'Abrindo Jogo existente!';

end;

end;

procedure TfrmPrin.SalvarComo1Click(Sender: TObject);
begin
Memo1.Text:= ChessBrd1.Position;
SalvarComo;
end;

procedure TfrmPrin.MediaPlayer1Notify(Sender: TObject);
begin
    if (s1.Checked = True) then
    MediaPlayer1.Play;
end;

end.
