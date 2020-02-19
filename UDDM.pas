unit UDDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  UDEnvironment, UDUnit, pngimage;

type
  TDDM = class(TForm, IDEnvironment)
    imgSwordsMan: TImage;
  private
    { Private declarations }
  public
    function GetImageByUnitType(AUnitType: TDUnitType): TImage;
  end;

var
  DDM: TDDM;

implementation

{$R *.dfm}

{ TDDM }

function TDDM.GetImageByUnitType(AUnitType: TDUnitType): TImage;
begin
  case AUnitType of
    utSwordsMan: Result := imgSwordsMan;
    else
      Result := nil;
  end;
end;


initialization
//  Environment := DDM;


end.
