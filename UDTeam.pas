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


end.
