object Form1: TForm1
  Left = 228
  Top = 211
  Width = 1239
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1231
    716)
  PixelsPerInch = 120
  TextHeight = 16
  object dbgrid_test_1: TTntDBGrid
    Left = 128
    Top = 336
    Width = 1088
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dbsource_test_1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn_open_1: TTntButton
    Left = 16
    Top = 16
    Width = 97
    Height = 33
    Caption = 'Open1'
    TabOrder = 1
    OnClick = btn_open_1Click
  end
  object TntMemo1: TTntMemo
    Left = 128
    Top = 72
    Width = 1088
    Height = 257
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '/* '
      
        '-- SELECT * FROM Customer                        -- '#1074#1099#1074#1086#1076' '#1074#1089#1077#1081' '#1090 +
        #1072#1073#1083#1080#1094#1099
      
        '-- SELECT * FROM Customer WHERE Country = "US"   -- '#1074#1099#1074#1077#1089#1090#1080' '#1090#1086#1083#1100 +
        #1082#1086' '#1079#1072#1087#1080#1089#1080' '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1089#1090#1088#1072#1085#1072' = US'
      
        '-- SELECT * FROM Customer WHERE Country = '#39'US'#39' OR Country = '#39'Can' +
        'ada'#39
      
        '-- SELECT * FROM Customer WHERE Country IN ('#39'US'#39', '#39'Canada'#39', '#39'Fij' +
        'i'#39')'
      
        '-- SELECT DISTINCT Country FROM Customer         -- '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1085 +
        #1072#1073#1086#1088' '#1089#1090#1088#1072#1085' (Country)'
      
        '-- SELECT DISTINCT Country,State FROM Customer   -- '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1085 +
        #1072#1073#1086#1088' '#1087#1072#1088' (Country <-> State)'
      '*/'
      ''
      'SELECT * FROM Customer WHERE Country IN ('#39'US'#39', '#39'Canada'#39', '#39'Fiji'#39')'
      ''
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object check_UseADO: TCheckBox
    Left = 16
    Top = 432
    Width = 97
    Height = 17
    Caption = 'Use ADO'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object TntMemo2: TTntMemo
    Left = 336
    Top = 8
    Width = 857
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '/* '
      
        '-- SELECT * FROM Customer                        -- '#1074#1099#1074#1086#1076' '#1074#1089#1077#1081' '#1090 +
        #1072#1073#1083#1080#1094#1099
      
        '-- SELECT * FROM Customer WHERE Country = "US"   -- '#1074#1099#1074#1077#1089#1090#1080' '#1090#1086#1083#1100 +
        #1082#1086' '#1079#1072#1087#1080#1089#1080' '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1089#1090#1088#1072#1085#1072' = US'
      
        '-- SELECT * FROM Customer WHERE Country = '#39'US'#39' OR Country = '#39'Can' +
        'ada'#39
      
        '-- SELECT * FROM Customer WHERE Country IN ('#39'US'#39', '#39'Canada'#39', '#39'Fij' +
        'i'#39')'
      
        '-- SELECT DISTINCT Country FROM Customer         -- '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1085 +
        #1072#1073#1086#1088' '#1089#1090#1088#1072#1085' (Country)'
      
        '-- SELECT DISTINCT Country,State FROM Customer   -- '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1085 +
        #1072#1073#1086#1088' '#1087#1072#1088' (Country <-> State)'
      '*/'
      ''
      'SELECT * FROM Customer WHERE Country IN ('#39'US'#39', '#39'Canada'#39', '#39'Fiji'#39')'
      ''
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    Visible = False
  end
  object dbquery_test_1: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'TestSession1'
    Left = 48
    Top = 256
  end
  object dbsource_test_1: TDataSource
    DataSet = dbquery_test_1
    Left = 48
    Top = 96
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 512
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 'Data Source=MyTestDatabase1.mdb;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 456
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 560
  end
  object ADOConnection2: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=MyTestDB1;Data Source=(loca' +
      'ldb)\MSSQLLocalDB;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 48
    Top = 656
  end
  object Session1: TSession
    NetFileDir = '.'
    SessionName = 'TestSession1'
    Left = 48
    Top = 200
  end
end
