unit sst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBQuery, IBCustomDataSet, IBStoredProc, StdCtrls, Buttons, ExtCtrls,
  IBDatabase;

type
  TformSST = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qrySQL: TIBQuery;
    traSQL: TIBTransaction;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSST: TformSST;

implementation

uses data_principal;

{$R *.DFM}

procedure TformSST.BitBtn2Click(Sender: TObject);
begin
  { abro a transacao }
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := True;
  BitBtn4.Enabled := True;
  if not traSQL.InTransaction then
    traSQL.StartTransaction;
  { carrego o comando SQL do usuario }
  qrySQL.SQL.Assign(Memo1.Lines);
  { preparo e executo o comando }
  try
    qrySQL.Prepare;
    qrySQL.ExecSQL;
    if qrySQL.prepared then qrySQL.unprepare;
  except
    if qrySQL.prepared then qrySQL.unprepare;
    raise;
  end;
end;

procedure TformSST.BitBtn3Click(Sender: TObject);
begin
  { gravo tudo }
  traSQL.Commit;
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := False;
  BitBtn4.Enabled := False;
end;

procedure TformSST.BitBtn4Click(Sender: TObject);
begin
  { gravo tudo }
  traSQL.RollBack;
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := False;
  BitBtn4.Enabled := False;
end;

procedure TformSST.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TformSST.FormShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

end.
