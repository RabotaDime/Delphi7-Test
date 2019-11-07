object form_MainFesco: Tform_MainFesco
  Left = 183
  Top = 128
  Width = 1305
  Height = 812
  Caption = 'form_MainFesco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object TntLabel1: TTntLabel
    Left = 216
    Top = 21
    Width = 49
    Height = 18
    Caption = #1040#1075#1077#1085#1090': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object TntLabel2: TTntLabel
    Left = 672
    Top = 24
    Width = 78
    Height = 18
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object TntLabel3: TTntLabel
    Left = 216
    Top = 50
    Width = 50
    Height = 18
    Caption = #1055#1086#1080#1089#1082': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object TntDBGrid1: TTntDBGrid
    Left = 232
    Top = 584
    Width = 1041
    Height = 177
    DataSource = dbsource_Fesco1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object TntButton1: TTntButton
    Left = 16
    Top = 664
    Width = 97
    Height = 33
    Caption = 'TntButton1'
    TabOrder = 1
    OnClick = TntButton1Click
  end
  object TntGroupBox1: TTntGroupBox
    Left = 16
    Top = 96
    Width = 473
    Height = 457
    Caption = ' '#1055#1086#1076#1093#1086#1076#1103#1097#1080#1077' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1093#1086#1076#1099' '
    TabOrder = 2
    DesignSize = (
      473
      457)
    object dbgrid_FactList: TTntDBGrid
      Left = 8
      Top = 24
      Width = 457
      Height = 425
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dbsource_FactList
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object TntGroupBox2: TTntGroupBox
    Left = 800
    Top = 96
    Width = 481
    Height = 457
    Caption = ' '#1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1088#1072#1089#1093#1086#1076#1099' '
    TabOrder = 3
    DesignSize = (
      481
      457)
    object dbgrid_PlanList: TTntDBGrid
      Left = 8
      Top = 24
      Width = 465
      Height = 425
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dbsource_PlanList
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object TntGroupBox3: TTntGroupBox
    Left = 496
    Top = 96
    Width = 297
    Height = 457
    Caption = ' '#1057#1074#1103#1079#1099#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '
    TabOrder = 4
    object TntDBGrid2: TTntDBGrid
      Left = 8
      Top = 24
      Width = 281
      Height = 425
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object btn_LoadLists: TTntButton
    Left = 16
    Top = 16
    Width = 169
    Height = 33
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 5
    OnClick = btn_LoadListsClick
  end
  object combo_AgentList: TTntDBComboBox
    Left = 272
    Top = 76
    Width = 345
    Height = 24
    Style = csDropDownList
    AutoDropDown = True
    ItemHeight = 16
    Sorted = True
    TabOrder = 6
    OnChange = combo_AgentListChange
    OnDropDown = combo_AgentListChange
  end
  object TntDBComboBox2: TTntDBComboBox
    Left = 760
    Top = 20
    Width = 345
    Height = 24
    AutoDropDown = True
    DataSource = dbsource_FactAgentsList
    ItemHeight = 16
    TabOrder = 7
  end
  object edit_AgentFilter: TTntEdit
    Left = 272
    Top = 48
    Width = 345
    Height = 24
    TabOrder = 8
    Text = 'Agent B'
    OnChange = edit_AgentFilterChange
  end
  object TntButton2: TTntButton
    Left = 16
    Top = 576
    Width = 89
    Height = 33
    Caption = 'SQL Tests'
    TabOrder = 9
    OnClick = TntButton2Click
  end
  object memo_SQLDebug1: TTntMemo
    Left = 248
    Top = 568
    Width = 1041
    Height = 177
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'memo_SQLDebug1')
    ParentFont = False
    TabOrder = 10
  end
  object TntComboBox1: TTntComboBox
    Left = 272
    Top = 20
    Width = 345
    Height = 24
    AutoDropDown = True
    DragMode = dmAutomatic
    ItemHeight = 16
    TabOrder = 11
    Text = 'TntComboBox1'
    OnChange = TntComboBox1Change
    OnSelect = TntComboBox1Select
  end
  object adoconnection_FescoDB1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=FescoTest1;Data Source=(loc' +
      'aldb)\MSSQLLocalDB;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 168
    Top = 8
  end
  object adoquery_Query1: TADOQuery
    Connection = adoconnection_FescoDB1
    Parameters = <>
    Left = 16
    Top = 632
  end
  object dbsource_Fesco1: TDataSource
    DataSet = adoquery_Query1
    Left = 80
    Top = 632
  end
  object XPManifest1: TXPManifest
    Left = 24
    Top = 720
  end
  object adoquery_FactAgentsList: TADOQuery
    Connection = adoconnection_FescoDB1
    Parameters = <>
    Left = 440
    Top = 8
  end
  object adoquery_PlanList: TADOQuery
    Connection = adoconnection_FescoDB1
    Parameters = <>
    Left = 1192
    Top = 408
  end
  object dbsource_FactAgentsList: TDataSource
    DataSet = adoquery_FactAgentsList
    Left = 536
    Top = 24
  end
  object dbsource_PlanList: TDataSource
    DataSet = adoquery_PlanList
    Left = 1192
    Top = 456
  end
  object adoquery_FactList: TADOQuery
    Connection = adoconnection_FescoDB1
    Parameters = <>
    Left = 112
    Top = 336
  end
  object dbsource_FactList: TDataSource
    DataSet = adoquery_FactList
    Left = 216
    Top = 336
  end
end
