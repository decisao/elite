unit ocorrencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, zebdbgrid, ExtCtrls, TB97Ctls, TB97, TB97Tlbr;

type
  TformOcorrencia = class(TForm)
    Dock975: TDock97;
    Toolbar971: TToolbar97;
    btnSair: TToolbarButton97;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    zebdbgrid1: Tzebdbgrid;
    Label1: TLabel;
    procedure zebdbgrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOcorrencia: TformOcorrencia;

implementation

uses os, data_principal;

{$R *.DFM}

procedure TformOcorrencia.zebdbgrid1DblClick(Sender: TObject);
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

procedure TformOcorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_escape then
       Self.ModalResult := mrCancel;

     if key = 13 then
       Self.ModalResult := mrOk;
end;

procedure TformOcorrencia.FormShow(Sender: TObject);
begin
  zebdbgrid1.setfocus;
end;

procedure TformOcorrencia.btnSairMouseEnter(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [fsBold, fsUnderline];
end;

procedure TformOcorrencia.btnSairMouseExit(Sender: TObject);
begin
   if Sender is TToolbarButton97 then
     (Sender as TToolbarButton97).Font.Style := [];
end;

end.
