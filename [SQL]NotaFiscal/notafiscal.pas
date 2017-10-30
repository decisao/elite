unit notafiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls;

type
  TformNotaFiscal = class(TForm)
    procedure zrDescontoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRDBText23BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ColumnHeader1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNotaFiscal: TformNotaFiscal;

implementation

uses venda_data, data_principal;

{$R *.DFM}

procedure TformNotaFiscal.zrDescontoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   with dataVenda.qryMovimentos do
     DoPrint := (fieldByName('DESCONTO').AsFloat > 0);
end;

procedure TformNotaFiscal.ZRDBText23BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
   with dataVenda.qryMovimentos do
     DoPrint := (fieldByName('DESCONTO').AsFloat > 0);

end;

procedure TformNotaFiscal.ColumnHeader1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  DoPrint := True;
end;

end.
