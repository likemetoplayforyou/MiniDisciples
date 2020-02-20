unit UDEnvironment;

interface

uses
  ExtCtrls, Graphics,
  UDUnit;

type
  IDEnvironment = interface
  ['{0B16C0A1-E993-4A03-B4D7-EE512EB2A129}']
    function GetImageByUnitType(AUnitType: TDUnitType): TImage;
    function GetBitmapByUnitType(AUnitType: TDUnitType): TBitmap;
  end;


var
  Environment: IDEnvironment = nil;


implementation

end.
