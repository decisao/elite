unit pagamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DBCGrids, ComCtrls, Mask;

type
  TformPagamentos = class(TForm)
    lblCLIENTE: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label5: TLabel;
    DBText2: TDBText;
    HeaderControl1: THeaderControl;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBText3: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPagamentos: TformPagamentos;

implementation

{$R *.DFM}

end.
