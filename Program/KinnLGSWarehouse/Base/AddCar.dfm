object frmAddcar: TfrmAddcar
  Left = 266
  Top = 289
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #38750#19994#21153#36710#36742#30331#35760
  ClientHeight = 297
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000099999990000000000000000000000999999999999900000000000000
    000BBBBBB9999999999900000000000000BBBBBBBBBBB9999999900000000000
    0000BBBBBBBBBBBB999999900000000000000000BBBBBBBBB99999990000000C
    CCCCCCCCCCCCBBBBBB999999000000CCCCCCCCCCCCCCCCCBBB99999990000000
    000000000000000BBB9999999900000000000000000000BBBB9999999900CCCC
    CCCCCCCCCCCCBBBBB99999999990CCCCCCCCCCCCCCBBBBBB9999999999900000
    000000000BBBBBB9999999999990000000000000BBBBB999999999999999CCCC
    CCCCCCCBBBB99999999999999999CCCCCCCCCCCBBB9999999999999999990000
    0000000BBBB9999999999999999900000000000BBBBB9999999999999999CCCC
    CCCCCCCCCBBBB999999999999999CCCCCCCCCCCCCCBBBBB99999999999990000
    00000000000BBBBBB999999999900000000000000000BBBBBB9999999990CCCC
    CCCCCCCCCCCCCCBBBBBB999999900CCCCCCCCCCCCCCCCCCCBBBBBB9999000000
    00000000000000000BBBBBB9990000000000000000000000000BBBBBB000000C
    CCCCCCCCCCCCCCCCCCCCCBBBB000000CCCCCCCCCCCCCCCCCCCCCCCBB00000000
    0000000000000000000000000000000000000000000000000000000000000000
    000CCCCCCCCCCCCCCCCC00000000000000000CCCCCCCCCCCCC0000000000FFF0
    1FFFFF8003FFFE0000FFFC00007FFF00001FFFF0000FE000000FC0000007FFFF
    E003FFFFC0030000000100000001FFF80001FFF000000000000000000000FFE0
    0000FFE000000000000000000000FFFE0001FFFF00010000000180000003FFFF
    F803FFFFFE07E0000007E000000FFFFFFFFFFFFFFFFFFE0000FFFF8003FF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 0
    Width = 535
    Height = 297
    Align = alClient
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    BorderPack = True
    object gsmDate: TGMSStickyLabel
      Left = 337
      Top = 87
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #21040#36798#26102#38388
      _AttachTo = dtdarrivedate
    end
    object gsmblno: TGMSStickyLabel
      Left = 182
      Top = 21
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #21496'    '#26426
      _AttachTo = edtdrivername
    end
    object gsmCarrierNo: TGMSStickyLabel
      Left = 6
      Top = 21
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36710' '#29260' '#21495
      _AttachTo = edtconveno
    end
    object gsmBoxNo: TGMSStickyLabel
      Left = 6
      Top = 54
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36523#20221#35777#21495
      _AttachTo = edtxszh
    end
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 337
      Top = 54
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #30005'    '#35805
      _AttachTo = edtdrivertel
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 337
      Top = 21
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #39550#39542#35777#21495
      _AttachTo = edtdriveridcar
    end
    object GMSStickyLabel3: TGMSStickyLabel
      Left = 14
      Top = 138
      Width = 42
      Height = 12
      Alignment = taRightJustify
      Caption = #21407'   '#30001
      _AlignTo = alTop
      _AttachTo = memoRemark
    end
    object GMSStickyLabel4: TGMSStickyLabel
      Left = 6
      Top = 87
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #20179' '#21333' '#21495
      _AttachTo = edtlocationbillno
    end
    object GMSStickyLabel5: TGMSStickyLabel
      Left = 170
      Top = 87
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #36827#21345#21475#37325#37327
      _AttachTo = edtweightin
    end
    object GMSStickyLabel6: TGMSStickyLabel
      Left = 170
      Top = 120
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #20986#21345#21475#37325#37327
      _AttachTo = edtweightout
    end
    object GMSStickyLabel7: TGMSStickyLabel
      Left = 337
      Top = 120
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #31163#24320#26102#38388
      _AttachTo = dtdloadcomdate
    end
    object dtdarrivedate: TdxDateEdit
      Tag = 10
      Left = 387
      Top = 83
      Width = 80
      AutoLeave = True
      AllowDblClk = True
      ClickSpace = True
      TabOrder = 5
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 68
    end
    object edtconveno: TdxEdit
      Tag = 10
      Left = 56
      Top = 17
      Width = 120
      TabOrder = 0
      CharCase = ecUpperCase
      StyleController = frmMain.StyleStandard
    end
    object edtdrivername: TdxEdit
      Tag = 10
      Left = 232
      Top = 17
      Width = 92
      TabOrder = 1
      OnExit = edtdrivernameExit
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object memoRemark: TdxMemo
      Tag = 10
      Left = 14
      Top = 152
      Width = 503
      Color = clInfoBk
      TabOrder = 6
      Alignment = taLeftJustify
      CharCase = ecUpperCase
      StyleController = frmMain.StyleMemo
      ScrollBars = ssVertical
      SelectionBar = False
      Height = 96
      StoredValues = 1
    end
    object btnOk: TKBitBtn
      Left = 132
      Top = 259
      Width = 80
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      OnClick = btnOkClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #30830#23450
      TabOrder = 7
      StyleController = frmMain.StyleStandard
    end
    object btnCancel: TKBitBtn
      Left = 347
      Top = 260
      Width = 80
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033337733333333333333333F333333333333
        0000333911733333973333333377F333333F3333000033391117333911733333
        37F37F333F77F33300003339111173911117333337F337F3F7337F3300003333
        911117111117333337F3337F733337F3000033333911111111733333337F3337
        3333F7330000333333911111173333333337F333333F73330000333333311111
        7333333333337F3333373333000033333339111173333333333337F333733333
        00003333339111117333333333333733337F3333000033333911171117333333
        33337333337F333300003333911173911173333333373337F337F33300003333
        9117333911173333337F33737F337F33000033333913333391113333337FF733
        37F337F300003333333333333919333333377333337FFF730000333333333333
        3333333333333333333777330000333333333333333333333333333333333333
        0000}
      OnClick = btnCancelClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #21462#28040
      TabOrder = 8
      StyleController = frmMain.StyleStandard
    end
    object edtxszh: TdxEdit
      Tag = 10
      Left = 56
      Top = 50
      Width = 268
      TabOrder = 4
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object edtdrivertel: TdxEdit
      Tag = 10
      Left = 387
      Top = 50
      Width = 128
      TabOrder = 3
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object edtdriveridcar: TdxEdit
      Tag = 10
      Left = 387
      Top = 17
      Width = 130
      TabOrder = 2
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object edtlocationbillno: TdxEdit
      Tag = 10
      Left = 56
      Top = 83
      Width = 105
      TabOrder = 9
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object edtweightin: TdxEdit
      Tag = 10
      Left = 232
      Top = 83
      Width = 92
      TabOrder = 10
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object edtweightout: TdxEdit
      Tag = 10
      Left = 232
      Top = 116
      Width = 92
      TabOrder = 11
      CharCase = ecUpperCase
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 64
    end
    object dtdloadcomdate: TdxDateEdit
      Tag = 10
      Left = 387
      Top = 116
      Width = 79
      AutoLeave = True
      AllowDblClk = True
      ClickSpace = True
      TabOrder = 12
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      StoredValues = 68
    end
    object timloadcomdate: TdxTimeEdit
      Tag = 10
      Left = 467
      Top = 116
      Width = 47
      TabOrder = 13
      StyleController = frmMain.StyleStandard
      TimeEditFormat = tfHourMin
      StoredValues = 5
    end
    object timarrivedate: TdxTimeEdit
      Tag = 10
      Left = 467
      Top = 83
      Width = 48
      TabOrder = 14
      StyleController = frmMain.StyleStandard
      TimeEditFormat = tfHourMin
      StoredValues = 5
    end
  end
  object qryCar: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    SQL.Strings = (
      'select * from Icon')
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 298
    Top = 157
  end
  object dsCar: TDataSource
    DataSet = qryCar
    Left = 398
    Top = 155
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    SQL.Strings = (
      'select * from Icon')
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 381
    Top = 196
  end
end
