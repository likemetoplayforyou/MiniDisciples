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
    procedure DUnitPanelClick(Sender: TObject);
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
  srcBitmap: TBitmap;
begin
  for dunit in ATeam.DUnits do begin
    pn := TPanel.Create(Self);
    pn.Parent := Self;
    pn.OnClick := DUnitPanelClick;

    img := TImage.Create(Self);
    img.Parent := pn;
    img.Align := alClient;
    img.Stretch := true;
    //img.OnClick := DUnitPanelClick;

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

    srcBitmap := Environment.GetImageByUnitType(dunit.UnitType).Picture.Bitmap;
    if AIsLeft then
      img.Picture.Bitmap.Assign(srcBitmap)
    else
      copyReverse(img.Picture.Bitmap, srcBitmap);

    if srcBitmap.ScanLine[0] <> nil then
      sleep(1);
  end;
end;


end.
