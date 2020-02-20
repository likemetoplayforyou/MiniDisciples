unit UUtils;

interface

uses
  Controls, Graphics;

type
  TBitmapCopyProc = function(const ABitmap: TBitmap): TBitmap;

  IOwnValue<T> = interface
    function Value: T;
  end;


  TOwnValue<T: class> = class(TInterfacedObject, IOwnValue<T>)
  private
    FValue: T;

    constructor Create(AValue: T);
  public
    class function Own(AValue: T): IOwnValue<T>;

    destructor Destroy; override;

    // IOwnValue<T>
    function Value: T;
  end;


  function RotateBitmap90(const ABitmap: TBitmap): TBitmap;
  function RotateBitmap180(const ABitmap: TBitmap): TBitmap;
  function RotateBitmap270(const ABitmap: TBitmap): TBitmap;

  procedure CopyBitmap(
    ADest, ASource: TBitmap; AReverse: boolean = false); overload;
  function CopyBitmap(
    ASource: TBitmap; AReverse: boolean = false): TBitmap; overload;

  procedure CopyImageList(
    ASource, ADest: TImageList; ASourceImageCopyProc: TBitmapCopyProc = nil);

implementation

uses
  Types,
  FlipReverseRotateLibrary;


function RotateBitmap90(const ABitmap: TBitmap): TBitmap;
begin
  Result := RotateScanline90(90, ABitmap);
end;


function RotateBitmap180(const ABitmap: TBitmap): TBitmap;
begin
  Result := RotateScanline90(180, ABitmap);
end;


function RotateBitmap270(const ABitmap: TBitmap): TBitmap;
begin
  Result := RotateScanline90(270, ABitmap);
end;


procedure CopyBitmap(ADest, ASource: TBitmap; AReverse: boolean);
var
  res: TBitmap;
begin
  if AReverse then begin
    //res := FlipReverseScanLine(false, true, ASource);
    res := FlipReverseCopyRect(false, true, ASource);
    try
      ADest.Assign(res);
    finally
      res.Free;
    end;
  end
  else
    ADest.Assign(ASource);
end;


function CopyBitmap(ASource: TBitmap; AReverse: boolean): TBitmap;
begin
  if AReverse then
    Result := FlipReverseCopyRect(false, true, ASource)
  else begin
    Result := TBitmap.Create;
    Result.Assign(ASource);
  end;
end;


procedure CopyImageList(
  ASource, ADest: TImageList; ASourceImageCopyProc: TBitmapCopyProc);
var
  imgSrc, imgDst: TBitmap;
  imgSrcCopy: TBitmap;
  i: integer;
  rct: TRect;
begin
  ADest.Clear;

  rct := Rect(0, 0, ADest.Width, ADest.Height);

  imgSrc := nil;
  imgDst := nil;
  try
    imgSrc := TBitmap.Create;
    imgDst := TBitmap.Create;

    imgSrc.PixelFormat := pf24bit;
    imgDst.PixelFormat := pf24bit;

    imgDst.Width := ADest.Width;
    imgDst.Height := ADest.Height;
    for i := 0 to ASource.Count - 1 do begin
      imgDst.Canvas.FillRect(rct);
      ASource.GetBitmap(i, imgSrc);
      if Assigned(ASourceImageCopyProc) then begin
        imgSrcCopy := ASourceImageCopyProc(imgSrc);
        try
          imgDst.Canvas.StretchDraw(rct, imgSrcCopy);
        finally
          imgSrcCopy.Free;
        end;
      end
      else
        imgDst.Canvas.StretchDraw(rct, imgSrc);
      ADest.Add(imgDst, nil);
    end;
  finally
    imgSrc.Free;
    imgDst.Free;
  end;
end;


{ TOwnValue<T> }

constructor TOwnValue<T>.Create(AValue: T);
begin
  inherited Create;
  FValue := AValue;
end;


destructor TOwnValue<T>.Destroy;
begin
  FValue.Free;
  inherited;
end;


class function TOwnValue<T>.Own(AValue: T): IOwnValue<T>;
begin
  Result := TOwnValue<T>.Create(AValue);
end;


function TOwnValue<T>.Value: T;
begin
  Result := FValue;
end;


end.
