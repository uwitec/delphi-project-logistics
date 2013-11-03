object frmDxhf: TfrmDxhf
  Left = 327
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22238#22797#30701#20449
  ClientHeight = 430
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 0
    Width = 514
    Height = 66
    Align = alTop
    TabOrder = 0
    BorderPack = True
    object GMSStickyLabel3: TGMSStickyLabel
      Left = 28
      Top = 9
      Width = 48
      Height = 13
      Caption = #25163#26426#21495#30721
      _AttachTo = edttel
      _Gap = 1
    end
    object GMSStickyLabel4: TGMSStickyLabel
      Left = 272
      Top = 9
      Width = 48
      Height = 13
      Caption = #20248'  '#20808'  '#32423
      _AttachTo = ckbSendLevel
      _Gap = 1
    end
    object GMSStickyLabel14: TGMSStickyLabel
      Left = 28
      Top = 34
      Width = 48
      Height = 13
      Caption = #36816'  '#33829'  '#21830
      _AttachTo = ckbPhoneNumberType
      _Gap = 1
    end
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 272
      Top = 34
      Width = 48
      Height = 13
      Caption = #30701#20449#27169#29256
      _AttachTo = ckbmodel
      _Gap = 1
    end
    object edttel: TdxEdit
      Left = 77
      Top = 5
      Width = 120
      TabOrder = 0
      OnKeyPress = edttelKeyPress
      MaxLength = 11
      StyleController = frmMain.StyleStandard
      StoredValues = 2
    end
    object ckbPhoneNumberType: TKinPickEdit
      Left = 77
      Top = 30
      Width = 120
      AllowDblClk = True
      TabOrder = 1
      StyleController = frmMain.StyleStandard
      Items.Strings = (
        #31227#21160
        #32852#36890
        #20854#20182)
      CanDeleteText = True
      ItemFields.Strings = (
        '1'
        '2'
        '0')
    end
    object ckbSendLevel: TKinPickEdit
      Left = 321
      Top = 5
      Width = 120
      AllowDblClk = True
      TabOrder = 2
      StyleController = frmMain.StyleStandard
      Items.Strings = (
        #39640
        #20302)
      CanDeleteText = True
      ItemFields.Strings = (
        '-2'
        '-1')
    end
    object ckbmodel: TKinPickEdit
      Left = 321
      Top = 30
      Width = 120
      AllowDblClk = True
      TabOrder = 3
      StyleController = frmMain.StyleStandard
      OnChange = ckbmodelChange
      CanDeleteText = True
    end
  end
  object KGroupBox5: TKGroupBox
    Left = 0
    Top = 388
    Width = 514
    Height = 42
    Align = alBottom
    TabOrder = 2
    BorderPack = True
    object GMSStickyLabel5: TGMSStickyLabel
      Left = 74
      Top = 13
      Width = 3
      Height = 13
      _Gap = 1
    end
    object Btnreply: TKBitBtn
      Left = 425
      Top = 4
      Width = 84
      Height = 35
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00E88888888888
        8888888888888EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE8EEEEEEEEFFFFFFFFFFF
        FFFFFFFFFFFE8EEEEEEEEFFFFFFFF00000FFFFFFFFFE8EEEEEEEEFFFFFFFFFFF
        FFFFFFFFFFFE8EEEEEEEEFFFFFFFF0000000FFFFFFFE8EEEEEEEEFFFFFFFFFFF
        FFFFFFFFFFFE88888888EFFFFFFFF000000FFFFFFFFEEEEEEEE8EFFFFFFFFFFF
        FFFFFFF000FE7FFFFFE8EFFFFFFFFFFFFFFFFFF0F0FE7FFFFFE8EF00000FFFFF
        FFFFFFF000FE7FFFFFE8EFFFFFFFFFFFFFFFFFFFFFFEFFFFFFE8E77777777777
        77777777777EFFFFFFE8EEEFFFFFFFFFFFFFFFFFFEEEEEEFFFE8EEEEEFFFFFFF
        FFFFFFF00FFFFFFFFFE8EEEEEEEFFFFFFFFFF0000000000FFFE8EEEEEEEEEFFF
        FFF00FFFFFFFFFFFFFE8EEEEEEEEEEEFF000000000000FFFFFE8EEEEEEEEEEEE
        EFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEFF00000000000000FFFE8EEEEEEEEEEEF
        FFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEFF00000000000000FFFE8EEEEEEEEEEEF
        FFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEFF00000000000000FFFE8EEEEEEEEEEEF
        FFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEFFFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEF
        F000000FFFFFFFFFFFE8EEEEEEEEEEEFFFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEF
        F00000FFFFFFFFFFFFE8EEEEEEEEEEEFFFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEF
        FFFFFFFFFFFFFFFFFFE8EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      OnClick = BtnreplyClick
      BiDiMode = bdRightToLeftNoAlign
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Caption = #21457#36865
      TabOrder = 0
      ParentFont = False
      StyleController = frmMain.StyleStandard
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 66
    Width = 514
    Height = 322
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object KGroupBox3: TKGroupBox
      Left = 1
      Top = 1
      Width = 512
      Height = 320
      Align = alClient
      Caption = #22238#22797#20449#24687
      TabOrder = 0
      BorderPack = True
      object lbltel: TGMSStickyLabel
        Left = 74
        Top = 8
        Width = 3
        Height = 13
        _Gap = 1
      end
      object edtremarks: TdxMemo
        Left = 2
        Top = 14
        Width = 508
        Align = alClient
        Color = clInfoBk
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ReadOnly = False
        Height = 304
        StoredValues = 64
      end
    end
  end
  object qryDxhf: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    SQL.Strings = (
      'select * from P_Logins')
    Connection = dbsLogis1
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 126
    Top = 253
  end
  object dtsDxhf: TDataSource
    DataSet = qryDxhf
    Left = 176
    Top = 253
  end
  object ppmedit: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 367
    Top = 253
    object N1: TMenuItem
      Caption = #21024#38500
    end
    object mitdy: TMenuItem
      Caption = #25171#21360
      Visible = False
    end
  end
  object dbsLogis1: TKADODatabase
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 75
    Top = 253
  end
  object qrytmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 318
    Top = 253
  end
end
