unit graph;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, mxgraph, ComCtrls,
  TB97Tlbr, TB97Ctls, TB97, Placemnt, TeeFunci, Series, ExtDlgs;

type
  TformGraph = class(TForm)
    Dock971: TDock97;
    StatusBar1: TStatusBar;
    DecisionGraph1: TDecisionGraph;
    FormStorage1: TFormStorage;
    Series1: TPieSeries;
    TeeFunction1: TAddTeeFunction;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    Toolbar971: TToolbar97;
    btnPrint: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    Save: TToolbarButton97;
    ToolbarButton971: TToolbarButton97;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formGraph: TformGraph;

implementation

{$R *.DFM}


procedure TformGraph.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TformGraph.btnPrintClick(Sender: TObject);
begin
     if PrintDialog1.Execute then
        DecisionGraph1.PrintLandscape;
end;


procedure TformGraph.SaveClick(Sender: TObject);
begin
     with SavePictureDialog1 do
      if Execute then
       begin
        Case FilterIndex of
         1: DecisionGraph1.SaveToBitmapFile(filename);
         2: DecisionGraph1.SaveToMetafile(filename);
        end;
       end;
end;


procedure TformGraph.ToolbarButton971Click(Sender: TObject);
begin
     DecisionGraph1.CopyToClipboardBitmap;
end;


end.
