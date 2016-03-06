object frmMain: TfrmMain
  Left = 288
  Top = 175
  Width = 280
  Height = 137
  Caption = 'Roulette'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 106
    Height = 27
    Caption = 'Roulette'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Lucida Handwriting'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 123
    Height = 13
    Caption = 'Insert number of photo'#39's:'
  end
  object edtNum: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '220'
  end
  object btnGo: TBitBtn
    Left = 184
    Top = 64
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'GO!'
    TabOrder = 1
    OnClick = btnGoClick
    Kind = bkOK
  end
end
