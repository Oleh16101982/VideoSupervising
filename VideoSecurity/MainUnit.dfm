object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 229
  ClientWidth = 886
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 224
    Top = 104
    Width = 105
    Height = 105
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pause'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 170
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Terminate'
    TabOrder = 2
  end
  object M1: TMemo
    Left = 1
    Top = 496
    Width = 707
    Height = 75
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
