unit UDEnvironment;

interface

uses
  ExtCtrls,
  UDUnit;

type
  IDEnvironment = interface
  ['{0B16C0A1-E993-4A03-B4D7-EE512EB2A129}']
    function GetImageByUnitType(AUnitType: TDUnitType): TImage;
  end;


var
  Environment: IDEnvironment = nil;


implementation

end.
