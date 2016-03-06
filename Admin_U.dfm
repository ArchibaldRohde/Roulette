object frmAdmin: TfrmAdmin
  Left = 270
  Top = 330
  Width = 402
  Height = 482
  Caption = 'Admin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object imgStudent: TImage
    Left = 200
    Top = 64
    Width = 137
    Height = 177
    Proportional = True
    Stretch = True
  end
  object lblTop: TLabel
    Left = 8
    Top = 8
    Width = 270
    Height = 35
    Caption = 'Add/Remove Student'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnHome: TBitBtn
    Left = 200
    Top = 248
    Width = 75
    Height = 25
    Caption = '&HOME'
    TabOrder = 0
    OnClick = btnHomeClick
    Kind = bkAll
  end
  object gAdd: TGroupBox
    Left = 8
    Top = 64
    Width = 185
    Height = 225
    Caption = 'Add new student'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblName: TLabel
      Left = 10
      Top = 40
      Width = 53
      Height = 19
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblImagepath: TLabel
      Left = 7
      Top = 96
      Width = 128
      Height = 19
      Caption = 'Image location:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtName: TEdit
      Left = 8
      Top = 64
      Width = 169
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object LoadFromFile: TButton
      Left = 6
      Top = 120
      Width = 99
      Height = 25
      Caption = 'LoadFromFile'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = LoadFromFileClick
    end
    object btnAdd: TButton
      Left = 6
      Top = 192
      Width = 91
      Height = 25
      Caption = 'Add student'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAddClick
    end
    object edtPath: TEdit
      Left = 8
      Top = 152
      Width = 137
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 296
    Width = 185
    Height = 121
    Caption = 'Remove student'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 53
      Height = 19
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtRem: TEdit
      Left = 8
      Top = 56
      Width = 161
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnremove: TButton
      Left = 8
      Top = 88
      Width = 129
      Height = 25
      Caption = 'Remove student'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnremoveClick
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 160
    Top = 248
  end
end
