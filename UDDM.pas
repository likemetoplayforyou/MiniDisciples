unit UDDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Generics.Collections,
  UDEnvironment, UDUnit, pngimage;

type
  TDDM = class(TForm, IDEnvironment)
    imgSwordsMan: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDUnitBitmaps: TDictionary<TDUnitType, TBitmap>;
  public
    function GetImageByUnitType(AUnitType: TDUnitType): TImage;
    function GetBitmapByUnitType(AUnitType: TDUnitType): TBitmap;
  end;

var
  DDM: TDDM;

implementation

{$R *.dfm}

{ TDDM }

procedure TDDM.FormCreate(Sender: TObject);
var
  duInfo: TDUnitInfo;
  bitmap: TBitmap;
begin
  inherited;
  FDUnitBitmaps :=
    TObjectDictionary<TDUnitType, TBitmap>.Create([doOwnsValues]);

  for duInfo in DUNIT_INFOS do begin
    bitmap := TBitmap.Create;
    FDUnitBitmaps.Add(duInfo.UnitType, bitmap);

    bitmap.LoadFromFile('Images/' + duInfo.Name + '.bmp');
  end;
end;


function TDDM.GetBitmapByUnitType(AUnitType: TDUnitType): TBitmap;
begin
  Result := FDUnitBitmaps[AUnitType];
end;


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
