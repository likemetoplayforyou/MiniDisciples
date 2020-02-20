unit UDUnit;

interface

type
  TDUnitType = (utSwordsMan, utArcher, utStudent, utNovice);

  TDAttackType = (atNear, atAnyOne, atAll);

  TDTeamRowType = (trtFront, trtBack);


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
  public
    function AttackType: TDAttackType; virtual; abstract;

    property UnitType: TDUnitType read FUnitType write FUnitType;

    property DoubleCell: boolean read FDoubleCell write FDoubleCell;
    property Row: TDTeamRowType read FRow write FRow;
    property Cell: integer read FCell write FCell;
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

end.
