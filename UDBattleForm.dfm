object frmBattle: TfrmBattle
  Left = 0
  Top = 0
  Caption = 'frmBattle'
  ClientHeight = 445
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline frLeftTeam: TfrTeam
    Left = 0
    Top = 0
    Width = 310
    Height = 445
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 72
    ExplicitTop = 3
  end
  inline frRightTeam: TfrTeam
    Left = 444
    Top = 0
    Width = 310
    Height = 445
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 406
    ExplicitHeight = 445
  end
end
