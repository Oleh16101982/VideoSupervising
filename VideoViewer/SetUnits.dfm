object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 430
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TV1: TTreeView
    Left = 4
    Top = 4
    Width = 160
    Height = 233
    Indent = 19
    TabOrder = 0
    OnChange = TV1Change
  end
  object VW: TVideoWindow
    Left = 4
    Top = 243
    Width = 160
    Height = 124
    FilterGraph = FG
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object P0: TPanel
    Left = 170
    Top = 8
    Width = 243
    Height = 359
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 52
      Top = 17
      Width = 127
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1078#1091#1088#1085#1072#1083#1091' '#1089#1086#1073#1099#1090#1080#1081
    end
    object Label2: TLabel
      Left = 4
      Top = 71
      Width = 113
      Height = 13
      Caption = #1052#1072#1089#1082#1072' '#1092#1072#1081#1083#1072' '#1078#1091#1088#1085#1072#1083#1072
    end
    object Label3: TLabel
      Left = 44
      Top = 101
      Width = 120
      Height = 13
      Caption = #1055#1091#1090#1100' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1089#1085#1080#1084#1082#1086#1074
    end
    object Label4: TLabel
      Left = 52
      Top = 156
      Width = 116
      Height = 13
      Caption = #1064#1088#1080#1092#1090' '#1090#1077#1082#1089#1090#1072' '#1074#1099#1074#1086#1076#1072
      Enabled = False
    end
    object Label5: TLabel
      Left = 44
      Top = 4
      Width = 149
      Height = 13
      Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object E01: TEdit
      Left = 4
      Top = 36
      Width = 201
      Height = 21
      TabOrder = 0
      OnChange = E01Change
      OnExit = E01Exit
    end
    object E02: TEdit
      Left = 4
      Top = 120
      Width = 201
      Height = 21
      TabOrder = 1
      OnExit = E02Exit
    end
    object B01: TButton
      Left = 204
      Top = 35
      Width = 29
      Height = 23
      Caption = ' ... '
      TabOrder = 2
      OnClick = B01Click
    end
    object B02: TButton
      Left = 204
      Top = 119
      Width = 29
      Height = 23
      Caption = ' ... '
      TabOrder = 3
      OnClick = B02Click
    end
    object E03: TEdit
      Left = 123
      Top = 65
      Width = 110
      Height = 21
      TabOrder = 4
      OnChange = E03Change
      OnExit = E03Exit
    end
    object E04: TEdit
      Left = 8
      Top = 175
      Width = 197
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object B03: TButton
      Left = 204
      Top = 173
      Width = 25
      Height = 23
      Caption = ' ... '
      Enabled = False
      TabOrder = 6
    end
  end
  object P1: TPanel
    Left = 170
    Top = 8
    Width = 243
    Height = 359
    TabOrder = 3
    Visible = False
    object Label6: TLabel
      Left = 60
      Top = 4
      Width = 115
      Height = 13
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 96
      Top = 68
      Width = 50
      Height = 13
      Caption = #1058#1072#1081#1084#1072#1091#1090#1099
    end
    object Label8: TLabel
      Left = 12
      Top = 89
      Width = 142
      Height = 13
      Caption = #1055#1077#1088#1077#1076' '#1079#1072#1087#1091#1089#1082#1086#1084' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    end
    object Label9: TLabel
      Left = 12
      Top = 123
      Width = 125
      Height = 13
      Caption = #1044#1083#1103' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1076#1074#1080#1078#1077#1085#1080#1103
    end
    object Label10: TLabel
      Left = 12
      Top = 149
      Width = 105
      Height = 13
      Caption = #1055#1086#1089#1083#1077' '#1089#1084#1077#1085#1099' '#1082#1072#1084#1077#1088#1099
    end
    object Label11: TLabel
      Left = 8
      Top = 178
      Width = 127
      Height = 13
      Caption = #1055#1086#1089#1083#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1072#1084#1077#1088#1099
    end
    object Label12: TLabel
      Left = 12
      Top = 209
      Width = 85
      Height = 13
      Caption = #1052#1077#1078#1076#1091' '#1089#1085#1080#1084#1082#1072#1084#1080
    end
    object Label22: TLabel
      Left = 8
      Top = 23
      Width = 37
      Height = 13
      Alignment = taCenter
      Caption = 'Label22'
    end
    object ChB11: TCheckBox
      Left = 8
      Top = 47
      Width = 73
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      TabOrder = 0
      OnClick = ChB11Click
    end
    object ChB12: TCheckBox
      Left = 92
      Top = 45
      Width = 125
      Height = 17
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1074#1080#1078#1077#1085#1080#1103
      TabOrder = 1
      OnClick = ChB12Click
    end
    object ME11: TMaskEdit
      Left = 160
      Top = 86
      Width = 52
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = '      '
      OnExit = ME11Exit
    end
    object ME12: TMaskEdit
      Left = 160
      Top = 120
      Width = 52
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 3
      Text = '      '
      OnExit = ME12Exit
    end
    object ME13: TMaskEdit
      Left = 160
      Top = 147
      Width = 52
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 4
      Text = '      '
      OnExit = ME13Exit
    end
    object ME14: TMaskEdit
      Left = 160
      Top = 174
      Width = 52
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 5
      Text = '      '
      OnExit = ME14Exit
    end
    object ME15: TMaskEdit
      Left = 160
      Top = 201
      Width = 52
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 6
      Text = '      '
      OnExit = ME15Exit
    end
  end
  object P2: TPanel
    Left = 170
    Top = 8
    Width = 408
    Height = 359
    TabOrder = 4
    object Label13: TLabel
      Left = 163
      Top = 55
      Width = 42
      Height = 13
      Caption = #1071#1088#1082#1086#1089#1090#1100
    end
    object Label14: TLabel
      Left = 128
      Top = 82
      Width = 77
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1089#1090#1085#1086#1089#1090#1100
    end
    object Label15: TLabel
      Left = 131
      Top = 108
      Width = 74
      Height = 13
      Caption = #1054#1090#1090#1077#1085#1086#1082' (Hue)'
    end
    object Label16: TLabel
      Left = 129
      Top = 137
      Width = 76
      Height = 13
      Caption = #1053#1072#1089#1099#1097#1077#1085#1085#1086#1089#1090#1100
    end
    object Label17: TLabel
      Left = 159
      Top = 163
      Width = 46
      Height = 13
      Caption = #1056#1077#1079#1082#1086#1089#1090#1100
    end
    object Label18: TLabel
      Left = 168
      Top = 190
      Width = 30
      Height = 13
      Caption = #1043#1072#1084#1084#1072
    end
    object Label19: TLabel
      Left = 130
      Top = 217
      Width = 73
      Height = 13
      Caption = #1041#1072#1083#1072#1085#1089' '#1073#1077#1083#1086#1075#1086
    end
    object Label20: TLabel
      Left = 125
      Top = 244
      Width = 66
      Height = 13
      Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
    end
    object Label21: TLabel
      Left = 134
      Top = 271
      Width = 68
      Height = 13
      Caption = #1059#1089#1080#1083#1080#1077' (Gain)'
    end
    object Label24: TLabel
      Left = 27
      Top = 32
      Width = 54
      Height = 13
      Caption = #1043#1086#1073#1072#1083#1100#1085#1072#1103
    end
    object Label25: TLabel
      Left = 79
      Top = 71
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 1'
    end
    object Label26: TLabel
      Left = 78
      Top = 101
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 2'
    end
    object Label27: TLabel
      Left = 78
      Top = 120
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 3'
    end
    object Label28: TLabel
      Left = 76
      Top = 145
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 4'
    end
    object Label29: TLabel
      Left = 78
      Top = 172
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 5'
    end
    object Label30: TLabel
      Left = 76
      Top = 199
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 6'
    end
    object Label31: TLabel
      Left = 78
      Top = 226
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 7'
    end
    object Label32: TLabel
      Left = 78
      Top = 257
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 8'
    end
    object Label33: TLabel
      Left = 78
      Top = 276
      Width = 33
      Height = 13
      Caption = #1059#1079#1077#1083' 9'
    end
    object Label34: TLabel
      Left = 78
      Top = 303
      Width = 39
      Height = 13
      Caption = #1059#1079#1077#1083' 10'
    end
    object Label35: TLabel
      Left = 27
      Top = 44
      Width = 88
      Height = 13
      Caption = #1095#1091#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
    end
    object Label23: TLabel
      Left = 172
      Top = 311
      Width = 127
      Height = 13
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
    end
    object Label36: TLabel
      Left = 277
      Top = 26
      Width = 65
      Height = 13
      Caption = '% '#1076#1074#1080#1078#1077#1085#1080#1103
    end
    object ChB21: TCheckBox
      Left = 4
      Top = 3
      Width = 73
      Height = 17
      Caption = #1054#1089#1085#1086#1074#1085#1072#1103
      TabOrder = 0
      OnClick = ChB21Click
    end
    object ChB22: TCheckBox
      Left = 80
      Top = 3
      Width = 74
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1077#1085#1072
      TabOrder = 1
      OnClick = ChB22Click
    end
    object ME210: TMaskEdit
      Left = 4
      Top = 63
      Width = 69
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '          '
      OnExit = ME210Exit
    end
    object ME211: TMaskEdit
      Left = 4
      Top = 90
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '          '
      OnExit = ME211Exit
    end
    object ME212: TMaskEdit
      Left = 4
      Top = 114
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '          '
      OnExit = ME212Exit
    end
    object ME213: TMaskEdit
      Left = 4
      Top = 137
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '          '
      OnExit = ME213Exit
    end
    object ME214: TMaskEdit
      Left = 4
      Top = 164
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '          '
      OnExit = ME214Exit
    end
    object ME215: TMaskEdit
      Left = 4
      Top = 191
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 7
      Text = '          '
      OnExit = ME215Exit
    end
    object ME216: TMaskEdit
      Left = 4
      Top = 218
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 8
      Text = '          '
      OnExit = ME216Exit
    end
    object ME217: TMaskEdit
      Left = 4
      Top = 245
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 9
      Text = '          '
      OnExit = ME217Exit
    end
    object ME218: TMaskEdit
      Left = 4
      Top = 268
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 10
      Text = '          '
      OnExit = ME218Exit
    end
    object ME219: TMaskEdit
      Left = 4
      Top = 295
      Width = 68
      Height = 21
      EditMask = '9999999999;1;_'
      MaxLength = 10
      TabOrder = 11
      Text = '          '
      OnExit = ME219Exit
    end
    object TB21: TTrackBar
      Left = 249
      Top = 47
      Width = 145
      Height = 34
      TabOrder = 12
      OnChange = TB21Change
    end
    object TB22: TTrackBar
      Left = 244
      Top = 79
      Width = 145
      Height = 34
      TabOrder = 13
      OnChange = TB22Change
    end
    object TB23: TTrackBar
      Left = 244
      Top = 106
      Width = 145
      Height = 34
      TabOrder = 14
      OnChange = TB23Change
    end
    object TB24: TTrackBar
      Left = 244
      Top = 133
      Width = 145
      Height = 34
      TabOrder = 15
      OnChange = TB24Change
    end
    object TB25: TTrackBar
      Left = 244
      Top = 160
      Width = 150
      Height = 34
      TabOrder = 16
      OnChange = TB25Change
    end
    object TB26: TTrackBar
      Left = 244
      Top = 187
      Width = 150
      Height = 34
      TabOrder = 17
      OnChange = TB26Change
    end
    object TB27: TTrackBar
      Left = 244
      Top = 214
      Width = 150
      Height = 34
      TabOrder = 18
      OnChange = TB27Change
    end
    object ChB24: TCheckBox
      Left = 209
      Top = 3
      Width = 109
      Height = 17
      Caption = #1062#1074#1077#1090#1085#1072#1103' '#1082#1072#1084#1077#1088#1072
      TabOrder = 19
    end
    object TB28: TTrackBar
      Left = 244
      Top = 241
      Width = 150
      Height = 34
      TabOrder = 20
      OnChange = TB28Change
    end
    object TB29: TTrackBar
      Left = 244
      Top = 268
      Width = 150
      Height = 34
      TabOrder = 21
      OnChange = TB29Change
    end
    object ChB23: TCheckBox
      Left = 316
      Top = 3
      Width = 73
      Height = 17
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 22
      OnClick = ChB23Click
    end
    object ME21: TMaskEdit
      Left = 211
      Top = 52
      Width = 35
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 23
      Text = '      '
      OnExit = ME21Exit
    end
    object ME22: TMaskEdit
      Left = 211
      Top = 79
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 24
      Text = '      '
      OnExit = ME22Exit
    end
    object ME23: TMaskEdit
      Left = 211
      Top = 106
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 25
      Text = '      '
      OnExit = ME23Exit
    end
    object ME24: TMaskEdit
      Left = 211
      Top = 133
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 26
      Text = '      '
      OnExit = ME24Exit
    end
    object ME25: TMaskEdit
      Left = 211
      Top = 160
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 27
      Text = '      '
      OnExit = ME25Exit
    end
    object ME26: TMaskEdit
      Left = 211
      Top = 187
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 28
      Text = '      '
      OnExit = ME26Exit
    end
    object ME27: TMaskEdit
      Left = 209
      Top = 214
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 29
      Text = '      '
      OnExit = ME27Exit
    end
    object ME28: TMaskEdit
      Left = 209
      Top = 241
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 30
      Text = '      '
      OnExit = ME28Exit
    end
    object ME29: TMaskEdit
      Left = 209
      Top = 268
      Width = 34
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 31
      Text = '      '
      OnExit = ME29Exit
    end
    object ME220: TMaskEdit
      Left = 4
      Top = 36
      Width = 17
      Height = 21
      EditMask = '9;1; '
      MaxLength = 1
      TabOrder = 32
      Text = ' '
      OnExit = ME220Exit
    end
    object CB1: TComboBox
      Left = 8
      Top = 330
      Width = 397
      Height = 21
      ItemHeight = 13
      TabOrder = 33
      OnChange = CB1Change
    end
    object ME221: TMaskEdit
      Left = 348
      Top = 20
      Width = 32
      Height = 21
      EditMask = '99;1; '
      MaxLength = 2
      TabOrder = 34
      Text = '  '
      OnExit = ME221Exit
    end
  end
  object Button1: TButton
    Left = 76
    Top = 380
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 204
    Top = 380
    Width = 75
    Height = 25
    Caption = #1048#1089#1093#1086#1076#1085#1099#1077
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 342
    Top = 380
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1080#1090#1100
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 475
    Top = 380
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 8
  end
  object FG: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 8
    Top = 8
  end
  object FL: TFilter
    BaseFilter.data = {
      0E01000037D415438C5BD011BD3B00A0C911CE86FA0000004000640065007600
      6900630065003A0070006E0070003A005C005C003F005C007000630069002300
      760065006E005F00310030003900650026006400650076005F00300033003600
      650026007300750062007300790073005F003000300030003100310030003000
      320026007200650076005F003000320023003400260032003900660035003000
      340034003200260030002600310038006600300023007B003600350065003800
      37003700330064002D0038006600350036002D0031003100640030002D006100
      3300620039002D00300030006100300063003900320032003300310039003600
      7D005C0067006C006F00620061006C000000}
    FilterGraph = FG
    Left = 72
    Top = 8
  end
  object SG: TSampleGrabber
    FilterGraph = FG
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 40
    Top = 8
  end
end
