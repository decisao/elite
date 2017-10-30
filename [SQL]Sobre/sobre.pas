unit sobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Db, IBQuery, IBCustomDataSet, IBStoredProc, RXCtrls,
  IBDatabase;

type
  TformSobre = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PageControl3: TPageControl;
    TabSheet8: TTabSheet;
    tabCreditos: TTabSheet;
    TabSheet10: TTabSheet;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SecretPanel1: TSecretPanel;
    Label8: TLabel;
    Label9: TLabel;
    dsrCliente: TDataSource;
    Label25: TLabel;
    lbVersion: TLabel;
    Label11: TLabel;
    traVersao: TIBTransaction;
    qryVersao: TIBQuery;
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSobre: TformSobre;

implementation

uses data_principal;

{$R *.DFM}

procedure TformSobre.SecretPanel1DblClick(Sender: TObject);
begin
  SecretPanel1.Play;
end;

procedure TformSobre.FormShow(Sender: TObject);
begin
  with qryVersao do
   begin
    if active then close;
    open;

    lbVersion.Caption := Format('%s v%d - %s', [dmoPrincipal.GetMyVersion,
       fieldByName('NUMERO').asInteger,
       FormatDateTime('DD/MM/YY', fieldByName('DATA').AsDateTime)]);

    close;
   end;
end;

procedure TformSobre.PageControl3Change(Sender: TObject);
begin
  if PageControl3.ActivePage = tabCreditos then
    with SecretPanel1 do
     begin
      if active then active := false;
      active := true;
     end;
end;

end.
