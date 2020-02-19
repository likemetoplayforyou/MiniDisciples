program MiniDisciples;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {frmMain},
  UDUnit in 'UDUnit.pas',
  UDBattleForm in 'UDBattleForm.pas' {frmBattle},
  UDBattleRowFrame in 'UDBattleRowFrame.pas' {frBattleRow: TFrame},
  UDTeam in 'UDTeam.pas',
  UDTeamFrame in 'UDTeamFrame.pas' {frTeam: TFrame},
  UDEnvironment in 'UDEnvironment.pas',
  UDDM in 'UDDM.pas' {DDM},
  FlipReverseRotateLibrary in 'Libs\FlipReverseRotateLibrary.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  //Application.CreateForm(TfrmBattle, frmBattle);
  Application.CreateForm(TDDM, DDM);

  Environment := DDM;

  Application.Run;
end.
