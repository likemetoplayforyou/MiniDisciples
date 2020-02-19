unit UDTeamFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs,
  UDTeam;

type
  TfrTeam = class(TFrame)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(ATeam: TDTeam; AIsLeft: boolean);
  end;

implementation

{$R *.dfm}

uses
  ExtCtrls,
  FlipReverseRotateLibrary,
  UDUnit, UDEnvironment;

{ TfrTeam }

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
  img: TImage;
  srcBitmap: TBitmap;
begin
  for dunit in ATeam.DUnits do begin
    img := TImage.Create(Self);
    img.Parent := Self;
    img.Stretch := true;
    //img.OnClick

    img.Height := ClientHeight div 3;
    img.Top := img.Height * dunit.Cell;

    if dunit.DoubleCell then begin
      img.Width := ClientWidth;
      img.Left := 0;
    end
    else begin
      img.Width := ClientWidth div 2;
      if AIsLeft then begin
        if dunit.Row = trtFront then
          img.Left := img.Width
        else
          img.Left := 0;
      end
      else begin
        if dunit.Row = trtFront then
          img.Left := 0
        else
          img.Left := img.Width;
      end;
    end;

    srcBitmap := Environment.GetImageByUnitType(dunit.UnitType).Picture.Bitmap;
    if AIsLeft then
      img.Picture.Bitmap.Assign(srcBitmap)
    else
      copyReverse(img.Picture.Bitmap, srcBitmap);
  end;
end;


end.
