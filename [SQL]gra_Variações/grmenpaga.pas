{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 2.0 for Delphi 3.0                          ::
  ::                                                         ::
  :: Example Decision Cube Report                            ::
  :: February 19th, 1998                                     ::
  ::                                                         ::
  :: Delphi 3 Client/Server required for this demo           ::
  ::                                                         ::
  :: Copyright (c) 1998 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no   fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit grmenpaga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, mxpivsrc, Db, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc, mxtables, mxstore, mxDB, Grids, mxgrid,
  StdCtrls, Spin, qrcomped, qrextra, Placemnt, TB97Tlbr, TB97Ctls,
  ComCtrls, TB97;

type
  TformGRvariacoes = class(TForm)
    DecisionSource1: TDecisionSource;
    DecisionCube1: TDecisionCube;
    DecisionQuery1: TDecisionQuery;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Dock971: TDock97;
    FormStorage1: TFormStorage;
    Toolbar971: TToolbar97;
    btAjuda: TToolbarButton97;
    btnPrint: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    btnGraph: TToolbarButton97;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnLayoutClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure DecisionSource1SummaryChange(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateCaption;
  public
    { Public declarations }
    pivot_summary: string;
  end;

var
  formGRvariacoes: TformGRvariacoes;

implementation

uses relcube, graph, data_principal;

{$R *.DFM}

procedure TformGRvariacoes.btnPreviewClick(Sender: TObject);
begin
  with TfrmCubeReport.Create(Self) do
  begin
    // Elieser
    // compatibilidade MDI
    DecisionCube1 := Self.DecisionCube1;
    DecisionGrid1 := Self.DecisionGrid1;

    // Create the labels for the report.  Dynamicly creating the labels
    // allows us to redefine the report when the orientation is changed
    // by the user
    CreateLabels(0, 0, pivot_summary);

    // Call the preview
    QuickRep1.ReportTitle := Self.Caption;
    QuickRep1.Preview;

    // Free the labels on the report
    FreeLabels;
    Free;
  end;
end;

procedure TformGRvariacoes.FormCreate(Sender: TObject);
begin
  DecisionQuery1.Open;
  // When the application starts up, we grab two values, the default
  // column width, and the name of the summary function used in the
  // decisiongrid.  If you use a radically different DecisionCube setup,
  // then you may have to modify this code.
  with DecisionGrid1 do
  begin
    //SpinEdit1.Value := DefaultColWidth;
    pivot_summary := Cells[-1,RowCount-FixedRows-1];
  end;
  UpdateCaption;
end;

procedure TformGRvariacoes.RadioGroup1Click(Sender: TObject);
begin
  // SpinEdit1.Enabled := RadioGroup1.ItemIndex = 1;
end;

procedure TformGRvariacoes.btnLayoutClick(Sender: TObject);
begin
  // We give the user the opportunity to change the layout of
  // the report.  Since this report is driven by the OnNeedData
  // event, the preview button on the report will display a blank
  // report.  There is also code to disable the report output if the
  // user removes either the column header or detail bands.  These
  // two bands are required for this report.

  with TQRCompEd.Create(Self) do
  try
// This line is commented out because we don't need any datasets for
// this report.  I have left it to show how it would be used if you
// wanted to add this functionality to another report.
//    AvailableDataSets:=AllDataSets(TForm(frmCubeReport),true);
    QuickRep := frmCubeReport.QuickRep1;
    ShowModal;

    // The user has the ability to change enough settings so that the
    // report will not run.  After they make their changes, we make sure
    // that the report will still run.  When the report runs, we'll
    // throw up a message to warn the user not to change this setting,

    with frmCubeReport.QuickRep1.Bands do
    begin
      if not HasColumnHeader then HasColumnHeader := true;
      if not HasDetail then HasDetail := true;
      if not HasTitle then HasTitle := true;
    end;

  finally
    Free;
  end
end;

procedure TformGRvariacoes.btnPrintClick(Sender: TObject);
begin
  with TfrmCubeReport.Create(Self) do
  begin
    // Elieser
    // compatibilidade MDI
    DecisionCube1 := Self.DecisionCube1;
    DecisionGrid1 := Self.DecisionGrid1;

    // Create the labels for the report.  Dynamicly creating the labels
    // allows us to redefine the report when the orientation is changed
    // by the user
    CreateLabels(0, 0, pivot_summary);

    // Print the report.  First we prompt the user for the printer
    // selection and if OK is selected, we print the report.  With
    // 2.0J and later, the Tag property of the report is set to -1
    // if the user cancels the printersetup dialog box.
    // NOTE:  When you call the printerseup method, prior to running
    // the report, the number of pages is unknown and will be displayed
    // as 10000 in the dialog.
    with QuickRep1 do
    begin
      PrinterSetup;
      if Tag = 0 then
        Print;
    end;

    // Free the labels on the report
    FreeLabels;
    Free;
  end;
end;

procedure TformGRvariacoes.DecisionSource1SummaryChange(Sender: TObject);
begin
  // When the user changes the layout of the grid, we update the
  // form's caption
  UpdateCaption;
end;

procedure TformGRvariacoes.UpdateCaption;
begin
  with DecisionCube1 do
    // self.Caption := Application.Title + ' - ' + GetSummaryName(CurrentSummary);
    beep;
end;




procedure TformGRvariacoes.btnGraphClick(Sender: TObject);
begin
     with TformGraph.Create(Self) do
      begin
       Caption := Caption + Self.Caption;
       DecisionGraph1.DecisionSource := Self.DecisionSource1;
       DecisionGraph1.Title.Text[0] := Caption;
       Show;
      end;
end;

procedure TformGRvariacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TformGRvariacoes.FormShow(Sender: TObject);
begin
     Screen.Cursor := crDefault;
end;

end.
