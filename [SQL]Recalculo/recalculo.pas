unit recalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, IBSQL, IBDatabase;

type
  TformRecalculo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    dedIni: TDateEdit;
    dedFim: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    traRecalculo: TIBTransaction;
    sqlRecalculo: TIBSQL;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRecalculo: TformRecalculo;

implementation

uses data_principal;

{$R *.DFM}

procedure TformRecalculo.BitBtn2Click(Sender: TObject);
begin
   with sqlRecalculo do
    begin

     Screen.Cursor := crHourGlass;
     if not Transaction.InTransaction then
       Transaction.StartTransaction;

     try
       Params.ByName('DATAINI').AsDate := dedIni.Date;
       Params.ByName('DATAFIM').AsDate := dedFim.Date;
       ExecQuery;
     except
       on exception do
        begin
         Screen.Cursor := crDefault;
         raise;
         Transaction.Rollback;
        end;
     end;

     if Transaction.InTransaction then
      begin
       Transaction.Commit;
       Screen.Cursor := crDefault;
       ShowMessage('Recalculo efetuado!');
      end;

    end;
end;

procedure TformRecalculo.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

end.
