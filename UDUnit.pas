unit UDUnit;

interface

uses
  Generics.Collections;

type
  TDUnitType = (utSwordsMan, utArcher, utStudent, utNovice);

  TDAttackType = (atNear, atAnyOne, atAll);

  TDTeamRowType = (trtFront, trtBack);


  TDTeam = class;


  TDUnit = class(TObject)
  private
    FUnitType: TDUnitType;
    FName: string;
    FHealth: integer;
    FInitiative: integer;
    FAttackType: TDAttackType;
    FDamage: integer;
    FAccuracy: integer;

    FDoubleCell: boolean;
    FRow: TDTeamRowType;
    FCell: integer;

    FTeam: TDTeam;
  public
    function AttackType: TDAttackType; virtual; abstract;

    property UnitType: TDUnitType read FUnitType write FUnitType;

    property DoubleCell: boolean read FDoubleCell write FDoubleCell;
    property Row: TDTeamRowType read FRow write FRow;
    property Cell: integer read FCell write FCell;
  end;


  TDTeam = class(TObject)
  private
    FDUnits: TList<TDUnit>;

    function GetDUnits: TEnumerable<TDUnit>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddDUnit(ADUnit: TDUnit);

    property DUnits: TEnumerable<TDUnit> read GetDUnits;
  end;


  TDUnitInfo = record
    UnitType: TDUnitType;
    Name: string;
  end;


const
  DUNIT_INFOS: array [TDUnitType] of TDUnitInfo = (
    (UnitType: utSwordsMan; Name: 'SwordsMan'),
    (UnitType: utArcher; Name: 'Archer'),
    (UnitType: utStudent; Name: 'Student'),
    (UnitType: utNovice; Name: 'Novice')
  );

implementation


{ TDTeam }

procedure TDTeam.AddDUnit(ADUnit: TDUnit);
begin
  FDUnits.Add(ADUnit);
  ADUnit.FTeam := Self;
end;


constructor TDTeam.Create;
begin
  inherited Create;
  FDUnits := TObjectList<TDUnit>.Create(true);
end;


destructor TDTeam.Destroy;
begin
  FDUnits.Free;
  inherited;
end;


function TDTeam.GetDUnits: TEnumerable<TDUnit>;
begin
  Result := FDUnits;
end;


end.
