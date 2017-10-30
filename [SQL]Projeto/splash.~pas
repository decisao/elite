unit splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg;

type
  TformSplash = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSplash: TformSplash;

implementation

{$R *.DFM}

procedure TformSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  close;
end;

end.
