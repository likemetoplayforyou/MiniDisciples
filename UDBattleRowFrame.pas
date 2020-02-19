unit UDBattleRowFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, Generics.Collections;

type
  TfrBattleRow = class(TFrame)
  private
    FCells: TList<TBitBtn>;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Init(ACellCount: integer);
  end;


implementation

{$R *.dfm}

{ TfrBattleRow }

constructor TfrBattleRow.Create(AOwner: TComponent);
begin
  inherited;
  FCells := TObjectList<TBitBtn>.Create(false);
end;


destructor TfrBattleRow.Destroy;
begin
  FCells.Free;
  inherited;
end;


procedure TfrBattleRow.Init(ACellCount: integer);
var
  i: integer;
  cell: TBitBtn;
begin
  FCells.Free;

  for i := 0 to ACellCount - 1 do begin
    cell := TBitBtn.Create(Self);
    cell.Parent := Self;
    cell.Width := ClientWidth;
    cell.Height := ClientHeight div 3;
    cell.Left := 0;
    cell.Top := i * cell.Height;
  end;
end;


end.
