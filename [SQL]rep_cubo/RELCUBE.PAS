unit relcube;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  qrctrls, qrprntr, quickrpt, ExtCtrls, Grids, mxgrid, mxstore, mxDB;

type
  TfrmCubeReport = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    qrlCubeSummary: TQRLabel;
    DecisionCube1: TDecisionCube;
    DecisionGrid1: TDecisionGrid;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1BeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    Procedure CreateLabels(i, w: integer; p:string);
    Procedure FreeLabels;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RowCounter,
    MaxCols: integer;
    ColumnLabels: array[0..29] of TQRLabel;
    DataLabels: array[0..29] of TQRLabel;
    SafeToRun : boolean;
    LabelWidth: integer;
  end;

var
  frmCubeReport: TfrmCubeReport;

implementation

uses preview, principal;

{$R *.DFM}

procedure TfrmCubeReport.FormCreate(Sender: TObject);
begin
  // Until we initialize our variables, it's not safe to run the
  // the report.  This will get initialized to false when the
  // program loads.
  SafeToRun := false;
end;

procedure TfrmCubeReport.CreateLabels(i, w: integer; p: string);
var
  nIdx: integer;
begin
  // If the user disables either the column header or the detail band,
  // then we can't run this report
  if (QuickRep1.Bands.HasDetail) and (QuickRep1.Bands.HasColumnHeader) then
  begin
    // If the user disabled the title band, we turn it back on, but we lose
    // the controls on it.  Here's how to test for that.  Another would be to
    // check to make sure that qrlCubeSummary is not nil.
    try
      with DecisionCube1 do
        qrlCubeSummary.Caption := GetSummaryName(CurrentSummary);
    except
      MessageDlg('Problema com o título da banda.', mtWarning, [mbOK], 0);
    end;

    with DecisionGrid1 do
    begin
      // We don't count the first two columns
      MaxCols := ColCount - 1;

      // Make sure that our array does not go out of bounds.  This arbitrary
      // for thsi example. You would define to meet your own needs.
      if MaxCols > 29 then
        MaxCols := 29;

      // pick up our label width
      if i = 0 then
        LabelWidth := (QuickRep1.Bands.ColumnHeaderBand.Width div MaxCols) - 2
      else
        LabelWidth := w;

      // Now loop the columns.  We create our column header and detail controls
      // and we also set the column header captions
      nIdx := 0;

      while nIdx < MaxCols do
      begin
        // We create the TQRLabels and set their properties so that they will
        // output at runtime.

        ColumnLabels[nIdx] := TQRLabel.Create(Self);
        with ColumnLabels[nIdx] do
        begin
          // You can set the text attributes any way that you want.
          Font.Name := 'Arial';
          Font.Style := [fsBold];
          Font.Size := 6;
          Color := clSilver;
          alignment := taCenter;

          // You must set the parent property or this control will not
          // appear on the report
          Parent := QuickRep1.Bands.ColumnHeaderBand;
          Height := Parent.Height;
          AlignToBand := False;
          Top := 0;
          Autosize := false;
          Width := LabelWidth;

          // Grab the captions from the DecisionGrid
          Caption := Cells[nIdx-1, -1];

          // If the user selects on the vertical dimension, then we set the
          // caption to the name of the summary function that had we picked up
          // when the mainform was created.  It's not the best solution, but it
          // appears to work.
          if (nIdx = 1) and (Caption = '') then
            Caption := p;

          if nIdx = 0 then
            Left := 0
          else begin
            Left := ColumnLabels[nIdx-1].Left + ColumnLabels[nIdx-1].Width + 2
          end;
        end;

        DataLabels[nIdx] := TQRLabel.Create(Self);
        with DataLabels[nIdx] do
        begin
          // The first detail column is the header, so we set the color,
          // alignment, and fon style to make it stand out.
          if nIdx = 0 then
          begin
            alignment := taLeftJustify;
            Color := clSilver;
            Font.Name := 'Arial';
            Font.Style := [fsBold];
            Font.Size := 6;
          end
          else
          begin
            // This example only has numeric data, so I have forced
            // everything to be right justfied.  You can alter this code
            // to match your data
            alignment := taRightJustify;
          end;

          // Set the summary column to silver
          if ((RowCount - FixedRows) > 1) then
            if nIdx = (MaxCols-1) then
              Color := clSilver;

          // If only one dimension has been selected, then force the detail columns
          // to clWhite
          if FixedRows = 2 then
            Color := clWhite;

          Parent := QuickRep1.Bands.DetailBand;
          Height := Parent.Height;
          AlignToBand := False;
          Top := 0;
          Autosize := false;

          // Size the detail labels to match the horizontal properties of the
          // column header labels so that they line up evenly
          Left := ColumnLabels[nIdx].Left;
          Width := ColumnLabels[nIdx].Width;
        end;
        Inc(nIdx);
      end;

      // Some additional code to handle pivot variations
      if ColumnLabels[MaxCols -1].Caption = '[Error]' then
      begin
        for nIdx := 0 to MaxCols-1 do
          ColumnLabels[nIdx].Caption := Cells[nIdx-2, -1];;
      end;

    end;

    // We are ready to run, so set the flag
    SafeToRun := True;
  end;
end;

procedure TfrmCubeReport.FreeLabels;
var
  nIdx: integer;
begin
  // Set the flag to false as this report will no longer be able to run.
  SafeToRun := false;
  for nIdx := 0 to 19 do
  begin
    if ColumnLabels[nIdx] <> nil then
    begin
      ColumnLabels[nIdx].Free;
      ColumnLabels[nIdx] := nil;
    end;
    if DataLabels[nIdx] <> nil then
    begin
      DataLabels[nIdx].Free;
      DataLabels[nIdx] := nil;
    end;
  end;
end;

procedure TfrmCubeReport.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  nIdx: integer;
begin
  // Check to see if we can process any data
  MoreData := SafeToRun;

  if MoreData then
    with DecisionGrid1 do
    begin
      // Make sure that we still have more rows to read from the grid
      // This method does not always work
//      MoreData := RowCounter < RowCount - 1;

      // The number of rows to output will vary depending on the settings.
      // This will make sure that we have not gone to far
      MoreData := Cells[-FixedCols+1, RowCounter] <> '[Error]';


      // start with the first column in this row
      nIdx := 0;

      while nIdx < MaxCols do
      begin
        with DataLabels[nIdx] do
        begin
          // Get the current data
          Caption := Cells[nIdx-FixedCols+1, RowCounter];

          Color := clWhite;

          // Set the summay fields to a different color
          if Caption = 'Sum' then
            Color := $00D8D8D8;

          // If we have more than 1 dimension in the output and it's the last
          // row, then we are on the summary line and we set the color to match.
          // If you have disabled the summary row, then you would modify this
          // code to handle that.
          if (RowCounter > 0) and (RowCounter = (RowCount -3)) then
            Color := clSilver;
        end;
        // Move to the next column in this row
        Inc(nIdx);
      end;

      // Move to the next column
      Inc(RowCounter);
    end;
end;

procedure TfrmCubeReport.QuickRep1BeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  // Initialize our row counter.  Any variables that need to be
  // reset when you run a report must be put in the report's
  // BeforePrint event.
  RowCounter := 0;
end;

procedure TfrmCubeReport.QuickRep1Preview(Sender: TObject);
begin
     with TformPreview.Create(formPrincipal) do
      begin

       pQuickReport := QuickRep1;
       QRPreview.QRPrinter := TQRPrinter(Sender);
       Show;

      end;

end;

end.
