unit UDTeam;

interface

uses
  Generics.Collections,
  UDUnit;

type
  TDTeamRow = class(TObject)
  private
    FDUnits: TList<TDUnit>;

    function GetDUnit(AIndex: integer): TDUnit;
    procedure SetDUnit(AIndex: integer; AUnit: TDUnit);
  public
    constructor Create;
    destructor Destroy; override;

    property DUnit[AIndex: integer]: TDUnit read GetDUnit write SetDUnit;
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


implementation

{ TDTeamRow }

constructor TDTeamRow.Create;
begin
  inherited Create;
  FDUnits := TObjectList<TDUnit>.Create(true);
end;


destructor TDTeamRow.Destroy;
begin
  FDUnits.Free;
  inherited;
end;


function TDTeamRow.GetDUnit(AIndex: integer): TDUnit;
begin

end;


procedure TDTeamRow.SetDUnit(AIndex: integer; AUnit: TDUnit);
begin

end;


{ TDTeam }

procedure TDTeam.AddDUnit(ADUnit: TDUnit);
begin
  FDUnits.Add(ADUnit);
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
