unit UDUnit;

interface

type
  TDUnitType = (utSwordsMan, utArcher);

  TDAttackType = (atNear, atAnyOne, atAll);

  TDTeamRowType = (trtFront, trtBack);


  TDUnit = class(TObject)
  private
    FUnitType: TDUnitType;
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


implementation

end.
