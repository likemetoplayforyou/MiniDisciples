unit UDTeamFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs,
  UDTeam, UDUnit;

type
  TfrTeam = class(TFrame)
  private
    FIsLeft: boolean;
    FActiveDUnit: TDUnit;

    procedure DUnitPanelClick(Sender: TObject);
    procedure DUnitPaint(Sender: TObject);
  public
    { Public declarations }
    procedure Init(ATeam: TDTeam; AIsLeft: boolean);
  end;

implementation

{$R *.dfm}

uses
  ExtCtrls,
  FlipReverseRotateLibrary,
  UUtils, UPaintUtils,
  UDEnvironment;

type
  TDPaintBox = class(TPaintBox)
  private
    FDUnit: TDUnit;
  public
    property DUnit: TDUnit read FDUnit;
  end;


{ TfrTeam }

procedure TfrTeam.DUnitPaint(Sender: TObject);
var
  pb: TDPaintBox;
  srcBitmap: TBitmap;
  rc: TRect;
begin
  pb := Sender as TDPaintBox;

  srcBitmap := Environment.GetImageByUnitType(pb.DUnit.UnitType).Picture.Bitmap;
  if not FIsLeft then
    srcBitmap := TOwnValue<TBitmap>.Own(CopyBitmap(srcBitmap)).Value;
  pb.Canvas.StretchDraw(pb.ClientRect, srcBitmap);

  if pb.DUnit = FActiveDUnit then begin
    pb.Canvas.Pen.Color := 255;
    pb.Canvas.Pen.Width := 5;
    //pb.Canvas.

    //pb.Canvas.Brush.Color := clWhite;
    //pb.Canvas.Brush.Color := 255 * 257;
    rc := pb.ClientRect;
//    pb.Canvas.Polygon(
//      [
//        Point(rc.Left, rc.Top), Point(rc.Right, rc.Top),
//        Point(rc.Right, rc.Bottom), Point(rc.Left, rc.Bottom)
//      ]
//    );
    DrawRect(pb.Canvas, pb.ClientRect);
    //pb.Canvas.FrameRect(Rect(10, 10, 20, 20));
    //pb.Canvas.FrameRect(pb.ClientRect);
  end;
end;


procedure TfrTeam.DUnitPanelClick(Sender: TObject);
begin
  Sleep(1);
end;


procedure TfrTeam.Init(ATeam: TDTeam; AIsLeft: boolean);

  procedure copyReverse(ADest, ASource: TBitmap);
  var
    res: TBitmap;
  begin
    //res := FlipReverseScanLine(false, true, ASource);
    res := FlipReverseCopyRect(false, true, ASource);
    try
      ADest.Assign(res);
    finally
      res.Free;
    end;
  end;

var
  dunit: TDUnit;
  pn: TPanel;
  img: TImage;
  pb: TDPaintBox;
  srcBitmap: TBitmap;
begin
  FIsLeft := AIsLeft;

  for dunit in ATeam.DUnits do begin
    if FActiveDUnit = nil then
      FActiveDUnit := dunit;

    pn := TPanel.Create(Self);
    pn.Parent := Self;
    pn.OnClick := DUnitPanelClick;

    pb := TDPaintBox.Create(Self);
    pb.FDUnit := dunit;
    pb.Parent := pn;
    pb.Align := alClient;
    pb.OnPaint := DUnitPaint;
    //pb.Stretch := true;
    pb.OnClick := DUnitPanelClick;

    pn.Height := ClientHeight div 3;
    pn.Top := pn.Height * dunit.Cell;

    if dunit.DoubleCell then begin
      pn.Width := ClientWidth;
      pn.Left := 0;
    end
    else begin
      pn.Width := ClientWidth div 2;
      if AIsLeft then begin
        if dunit.Row = trtFront then
          pn.Left := pn.Width
        else
          pn.Left := 0;
      end
      else begin
        if dunit.Row = trtFront then
          pn.Left := 0
        else
          pn.Left := pn.Width;
      end;
    end;

//    srcBitmap := Environment.GetImageByUnitType(dunit.UnitType).Picture.Bitmap;
//    if AIsLeft then
//      img.Picture.Bitmap.Assign(srcBitmap)
//    else
//      copyReverse(img.Picture.Bitmap, srcBitmap);

//    if srcBitmap.ScanLine[0] <> nil then
//      sleep(1);
  end;
end;


end.
