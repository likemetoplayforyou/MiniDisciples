unit UDBattleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  UDUnit, UDTeamFrame;

type
  TfrmBattle = class(TForm)
    pnLeftTeam: TPanel;
    frLeftTeam: TfrTeam;
    pnRightTeam: TPanel;
    frRightTeam: TfrTeam;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FLeftTeam: TDTeam;
    FRightTeam: TDTeam;
  public
    { Public declarations }
  end;

//var
//  frmBattle: TfrmBattle;

implementation

{$R *.dfm}

procedure TfrmBattle.FormCreate(Sender: TObject);

  procedure addUnit(
    ATeam: TDTeam; AUnitType: TDUnitType;
    ADoubleCell: boolean; ARow: TDTeamRowType; ACell: integer);
  var
    dunit: TDUnit;
  begin
    dunit := TDUnit.Create;
    ATeam.AddDUnit(dunit);

    dunit.UnitType := AUnitType;
    dunit.DoubleCell := ADoubleCell;
    dunit.Row := ARow;
    dunit.Cell := ACell;
  end;

begin
  inherited;
  FLeftTeam := TDTeam.Create;
  addUnit(FLeftTeam, utSwordsMan, false, trtFront, 0);
  addUnit(FLeftTeam, utNovice, false, trtBack, 0);
  addUnit(FLeftTeam, utArcher, false, trtFront, 1);
  addUnit(FLeftTeam, utStudent, true, trtFront, 2);

  FRightTeam := TDTeam.Create;
  addUnit(FRightTeam, utSwordsMan, false, trtBack, 0);
  addUnit(FRightTeam, utNovice, true, trtBack, 1);
  addUnit(FRightTeam, utArcher, false, trtFront, 2);

  frLeftTeam.Init(FLeftTeam, true);
  frRightTeam.Init(FRightTeam, false);

  pnLeftTeam.Color := clYellow;
end;


procedure TfrmBattle.FormDestroy(Sender: TObject);
begin
  FRightTeam.Free;
  FLeftTeam.Free;
  inherited;
end;


end.
