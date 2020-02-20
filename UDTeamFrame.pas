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
begin
  pb := Sender as TDPaintBox;

  srcBitmap := Environment.GetBitmapByUnitType(pb.DUnit.UnitType);
  if not FIsLeft then
    srcBitmap := TOwnValue<TBitmap>.Own(CopyBitmap(srcBitmap, true)).Value;
  pb.Canvas.StretchDraw(pb.ClientRect, srcBitmap);

  if pb.DUnit = FActiveDUnit then begin
    pb.Canvas.Pen.Color := clRed;
    pb.Canvas.Pen.Width := 12;
    DrawRect(pb.Canvas, pb.ClientRect);
  end;
end;


procedure TfrTeam.DUnitPanelClick(Sender: TObject);
begin
  Sleep(1);
end;


procedure TfrTeam.Init(ATeam: TDTeam; AIsLeft: boolean);
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
  end;
end;


end.
