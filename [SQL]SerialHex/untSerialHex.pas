unit untSerialHex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TformSerialHex = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSerialHex: TformSerialHex;

implementation

uses data_principal;

{$R *.DFM}

procedure TformSerialHex.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TformSerialHex.Edit1Exit(Sender: TObject);
begin
    Panel1.Caption :=
      dmoPrincipal.DecimalToHexa(Edit1.text);
end;

procedure TformSerialHex.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
   begin
    Edit1Exit(Sender);
    Edit1.SetFocus;
   end;
  if Key = #27 then close;
end;

procedure TformSerialHex.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

end.
