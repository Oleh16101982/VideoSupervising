object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080
  ClientHeight = 486
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TV1: TTreeView
    Left = 0
    Top = 8
    Width = 149
    Height = 233
    Indent = 19
    TabOrder = 0
    OnChange = TV1Change
    Items.NodeData = {
      010300000023000000000000000100000001000000FFFFFFFF00000000000000
      00051E0431044904380435042D000000000000000200000002000000FFFFFFFF
      00000000000000000A23044104420440043E0439044104420432043004270000
      000000000000000000FFFFFFFFFFFFFFFF00000000000000000721043E043104
      4B04420438044F04}
  end
  object VW: TVideoWindow
    Left = 0
    Top = 259
    Width = 160
    Height = 120
    FilterGraph = FG
    VMROptions.Mode = vmrWindowed
    Color = clBlack
    Visible = False
  end
  object P1: TPanel
    Left = 155
    Top = 8
    Width = 374
    Height = 470
    TabOrder = 2
    Visible = False
    object L11: TLabel
      Left = 152
      Top = 8
      Width = 17
      Height = 13
      Caption = 'L11'
    end
    object L12: TLabel
      Left = 192
      Top = 24
      Width = 140
      Height = 13
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1082#1085#1072' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    end
    object L13: TLabel
      Left = 199
      Top = 52
      Width = 54
      Height = 13
      Caption = #1051#1077#1074'.'#1082#1086#1086#1088#1076
    end
    object L14: TLabel
      Left = 198
      Top = 85
      Width = 55
      Height = 13
      Caption = #1042#1077#1088#1093#1082#1086#1086#1088#1076
    end
    object L15: TLabel
      Left = 216
      Top = 123
      Width = 37
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072
    end
    object L16: TLabel
      Left = 213
      Top = 159
      Width = 40
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072
    end
    object ChB1: TCheckBox
      Left = 8
      Top = 28
      Width = 69
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1077#1085
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 51
      Width = 125
      Height = 17
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1074#1080#1078#1077#1085#1080#1103
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 74
      Width = 97
      Height = 17
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object UpDown1: TUpDown
      Left = 311
      Top = 40
      Width = 16
      Height = 24
      TabOrder = 3
    end
    object ME1: TMaskEdit
      Left = 259
      Top = 43
      Width = 54
      Height = 21
      TabOrder = 4
    end
    object ME2: TMaskEdit
      Left = 259
      Top = 77
      Width = 54
      Height = 21
      TabOrder = 5
    end
    object ME3: TMaskEdit
      Left = 259
      Top = 115
      Width = 54
      Height = 21
      TabOrder = 6
    end
    object ME4: TMaskEdit
      Left = 259
      Top = 151
      Width = 54
      Height = 21
      TabOrder = 7
    end
    object UpDown2: TUpDown
      Left = 312
      Top = 77
      Width = 16
      Height = 24
      TabOrder = 8
    end
    object UpDown3: TUpDown
      Left = 312
      Top = 115
      Width = 16
      Height = 24
      TabOrder = 9
    end
    object UpDown4: TUpDown
      Left = 312
      Top = 151
      Width = 16
      Height = 24
      TabOrder = 10
    end
  end
  object P0: TPanel
    Left = 307
    Top = 8
    Width = 373
    Height = 470
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 34
      Top = 33
      Width = 212
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1076#1077#1090#1077#1082#1090#1086#1088#1072' '#1076#1074#1080#1078#1077#1085#1080#1103
    end
    object Label2: TLabel
      Left = 130
      Top = 68
      Width = 116
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1084#1077#1078#1076#1091' '#1089#1085#1080#1084#1082#1072#1084#1080
    end
    object Label3: TLabel
      Left = 152
      Top = 107
      Width = 94
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1079#1072#1087#1091#1089#1082#1072
    end
    object Label4: TLabel
      Left = 88
      Top = 140
      Width = 158
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1087#1086#1089#1083#1077' '#1089#1084#1077#1085#1099' '#1082#1072#1084#1077#1088#1099
    end
    object Label5: TLabel
      Left = 6
      Top = 178
      Width = 243
      Height = 13
      Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1087#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1082#1072#1084#1077#1088#1099
    end
    object ME01: TMaskEdit
      Left = 252
      Top = 26
      Width = 50
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 0
      Text = '      '
    end
    object ME02: TMaskEdit
      Left = 252
      Top = 65
      Width = 50
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 1
      Text = '      '
    end
    object ME03: TMaskEdit
      Left = 252
      Top = 101
      Width = 50
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 2
      Text = '      '
    end
    object ME04: TMaskEdit
      Left = 252
      Top = 137
      Width = 50
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 3
      Text = '      '
    end
    object ME05: TMaskEdit
      Left = 255
      Top = 173
      Width = 49
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 4
      Text = '      '
    end
    object UD01: TUpDown
      Left = 300
      Top = 23
      Width = 16
      Height = 24
      Max = 32565
      TabOrder = 5
      OnChanging = UD01Changing
    end
    object UD02: TUpDown
      Left = 300
      Top = 64
      Width = 16
      Height = 24
      Max = 32565
      TabOrder = 6
      OnChanging = UD02Changing
    end
    object UD03: TUpDown
      Left = 300
      Top = 100
      Width = 16
      Height = 24
      Max = 32565
      TabOrder = 7
      OnChanging = UD03Changing
    end
    object UD04: TUpDown
      Left = 300
      Top = 137
      Width = 16
      Height = 24
      Max = 32565
      TabOrder = 8
      OnChanging = UD04Changing
    end
    object UD05: TUpDown
      Left = 300
      Top = 172
      Width = 16
      Height = 24
      Max = 32565
      TabOrder = 9
      OnChanging = UD05Changing
    end
  end
  object FG: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 16
    Top = 72
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
    Left = 68
    Top = 72
  end
  object SG: TSampleGrabber
    FilterGraph = FG
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 40
    Top = 128
  end
end
