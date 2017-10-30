unit confirmasenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TformConfirmaSenha = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edUser: TEdit;
    Label2: TLabel;
    edSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfirmaSenha: TformConfirmaSenha;

implementation

uses data_principal;

{$R *.DFM}

procedure TformConfirmaSenha.FormShow(Sender: TObject);
begin
  eduser.text := dmoPrincipal.GetLogUser;
end;

procedure TformConfirmaSenha.BitBtn2Click(Sender: TObject);
begin
  if edSenha.Text <> dmoPrincipal.GetLogPass then
   begin
    Application.MessageBox(
      'Senha incorreta. A operação selecionada não pode ser completada.',
      'Senha incorreta',
      mb_OK + mb_IconError);
    modalresult := mrCancel;
   end else modalresult := mrOk;;
end;

end.
