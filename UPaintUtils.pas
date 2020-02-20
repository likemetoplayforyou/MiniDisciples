unit UPaintUtils;

interface

uses
  Graphics, Types;

  procedure DrawRect(ACanvas: TCanvas; ARect: TRect);

implementation


procedure DrawRect(ACanvas: TCanvas; ARect: TRect);
begin
  ACanvas.MoveTo(ARect.Left, ARect.Top);
  ACanvas.LineTo(ARect.Right, ARect.Top);
  ACanvas.LineTo(ARect.Right, ARect.Bottom);
  ACanvas.LineTo(ARect.Left, ARect.Bottom);
  ACanvas.LineTo(ARect.Left, ARect.Top);
end;


end.
