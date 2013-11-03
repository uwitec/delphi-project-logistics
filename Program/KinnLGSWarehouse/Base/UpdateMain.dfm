object frmUpdateMain: TfrmUpdateMain
  Left = 234
  Top = 115
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #19994#21153#36164#26009#35843#25972
  ClientHeight = 428
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object gmsLocationBillNO: TGMSStickyLabel
    Left = 17
    Top = 32
    Width = 48
    Height = 12
    Caption = #20179' '#21333' '#21495
    _AttachTo = edtLocationBillNO
    _Gap = 0
  end
  object GMSStickyLabel9: TGMSStickyLabel
    Left = 181
    Top = 32
    Width = 60
    Height = 12
    Caption = #36153#29992#20851#31995#20154
    _AttachTo = edtCostAccount
    _Gap = 0
  end
  object btnOk: TKBitBtn
    Left = 255
    Top = 365
    Width = 85
    Height = 27
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
    TabOrder = 0
    StyleController = frmMain.StyleStandard
  end
  object btnCancel: TKBitBtn
    Left = 392
    Top = 364
    Width = 88
    Height = 27
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
    Caption = #21462#28040'(&N)'
    TabOrder = 1
    StyleController = frmMain.StyleStandard
  end
  object edtLocationBillNO: TdxDBEdit
    Left = 65
    Top = 28
    Width = 115
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    CharCase = ecUpperCase
    DataField = 'LocationBillNO'
    DataSource = dtsMain
    ReadOnly = True
    StyleController = frmMain.StyleStandard
    StoredValues = 64
  end
  object edtCostAccount: TdxDBButtonEdit
    Left = 241
    Top = 28
    Width = 112
    AllowDblClk = True
    ClickSpace = True
    CanDeleteText = True
    Field = 'WO_COUNTCONTACCOUNTID'
    TabOrder = 3
    DataField = 'costcusname'
    DataSource = dtsMain
    ReadOnly = True
    StyleController = frmMain.StyleStandard
    Buttons = <
      item
        Default = True
      end>
    StoredValues = 64
    ExistButtons = True
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 80
    Width = 714
    Height = 273
    Caption = #19994#21153#36164#26009
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    StyleController = frmMain.StyleStandard
    BorderPack = True
    object GMSStickyLabel6: TGMSStickyLabel
      Left = 17
      Top = 132
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #21457' '#36135' '#20154
      _AttachTo = cmbConsignAccountID
    end
    object GMSStickyLabel7: TGMSStickyLabel
      Left = 17
      Top = 169
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #25215' '#36816' '#20154
      _AttachTo = cmbCarrierAccountID
    end
    object GMSStickyLabel14: TGMSStickyLabel
      Left = 17
      Top = 206
      Width = 48
      Height = 12
      Caption = #19994' '#21153' '#21592
      _AttachTo = edtOPID
    end
    object GMSStickyLabel49: TGMSStickyLabel
      Left = 190
      Top = 59
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #33337'    '#21517
      _AttachTo = edtCarrierName
    end
    object gmsBillNO: TGMSStickyLabel
      Left = 541
      Top = 22
      Width = 48
      Height = 12
      Caption = #25552' '#21333' '#21495
      _AttachTo = edtBlNO
    end
    object GMSStickyLabel50: TGMSStickyLabel
      Left = 190
      Top = 96
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #33322'    '#27425
      _AttachTo = edtCARRIERNO
    end
    object GMSStickyLabel15: TGMSStickyLabel
      Left = 366
      Top = 169
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36135'    '#20540
      _AttachTo = edtTotalCost
    end
    object GMSStickyLabel16: TGMSStickyLabel
      Left = 478
      Top = 59
      Width = 24
      Height = 12
      Caption = #31665#37327
      _AttachTo = edtConQuantityTotal
    end
    object gmsConDescription: TGMSStickyLabel
      Left = 366
      Top = 59
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #31665#37327#25551#36848
      _AttachTo = edtConDescription
    end
    object GMSStickyLabel23: TGMSStickyLabel
      Left = 17
      Top = 59
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #20379#24212#21830#21495
      _AttachTo = edtOriginOrder
    end
    object GMSStickyLabel25: TGMSStickyLabel
      Left = 17
      Top = 96
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #37319#36141#21830#21495
      _AttachTo = edtDestOrder
    end
    object GMSStickyLabel18: TGMSStickyLabel
      Left = 17
      Top = 22
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #20027' '#35746' '#21333
      _AttachTo = edtMainOrder
    end
    object GMSStickyLabel19: TGMSStickyLabel
      Left = 366
      Top = 96
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36710' '#29260' '#21495
      _AttachTo = edtCarbrand
    end
    object GMSStickyLabel35: TGMSStickyLabel
      Left = 366
      Top = 132
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36335#32447#25551#36848
      _AttachTo = edtRouting
    end
    object GMSStickyLabel21: TGMSStickyLabel
      Left = 541
      Top = 132
      Width = 48
      Height = 12
      Caption = #21040#22496#26102#38388
      _AttachTo = edtETSH
    end
    object GMSStickyLabel22: TGMSStickyLabel
      Left = 190
      Top = 206
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #30446' '#30340' '#28207
      _AttachTo = edtFC_PORTDCD
    end
    object GMSStickyLabel26: TGMSStickyLabel
      Left = 190
      Top = 169
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #20013' '#36716' '#28207
      _AttachTo = edtFC_TRANSCD
    end
    object GMSStickyLabel27: TGMSStickyLabel
      Left = 190
      Top = 132
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36215' '#36816' '#28207
      _AttachTo = edtFC_PORTLCD
    end
    object GMSStickyLabel8: TGMSStickyLabel
      Left = 366
      Top = 22
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #26588'    '#21495
      _AttachTo = edtconno
    end
    object GMSStickyLabel24: TGMSStickyLabel
      Left = 541
      Top = 96
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36215#36816#26102#38388
      _AttachTo = dtdcarrierdate
    end
    object GMSStickyLabel28: TGMSStickyLabel
      Left = 541
      Top = 59
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #35013#26588#26102#38388
      _AttachTo = dtdconloaddate
    end
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 541
      Top = 169
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #25253#20851#21333#21495
      _AttachTo = customsno1
    end
    object GMSStickyLabel32: TGMSStickyLabel
      Left = 190
      Top = 22
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #23458#25143#37096#32452
      _AttachTo = cmbCususername
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 366
      Top = 206
      Width = 48
      Height = 12
      Caption = #25805#20316#31867#22411
      _AttachTo = cmbLoadcosttype
    end
    object GMSStickyLabel3: TGMSStickyLabel
      Left = 541
      Top = 206
      Width = 48
      Height = 12
      Caption = #22791'    '#27880
    end
    object GMSStickyLabel36: TGMSStickyLabel
      Left = 190
      Top = 238
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #27531#25439#24773#20917
      _AttachTo = edtbrokenmark
    end
    object cmbConsignAccountID: TdxDBButtonEdit
      Tag = 10
      Left = 67
      Top = 128
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      Field = 'shipcusid'
      TabOrder = 3
      DataField = 'shipcusname'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = cmbConsignAccountIDButtonClick
      ExistButtons = True
    end
    object cmbCarrierAccountID: TdxDBButtonEdit
      Tag = 10
      Left = 67
      Top = 165
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      Field = 'carriercusid'
      TabOrder = 4
      DataField = 'carriercusname'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = cmbCarrierAccountIDButtonClick
      ExistButtons = True
    end
    object edtOPID: TdxDBButtonEdit
      Tag = 10
      Left = 67
      Top = 202
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      CanDeleteText = True
      Field = 'opid'
      TabOrder = 23
      DataField = 'opname'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtOPIDButtonClick
      ExistButtons = True
    end
    object edtBlNO: TdxDBEdit
      Tag = 10
      Left = 591
      Top = 18
      Width = 114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      CharCase = ecUpperCase
      DataField = 'BLNO'
      DataSource = dtsMain
      MaxLength = 30
      StyleController = frmMain.StyleStandard
      StoredValues = 2
    end
    object edtCARRIERNO: TdxDBEdit
      Tag = 10
      Left = 240
      Top = 92
      Width = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      CharCase = ecUpperCase
      DataField = 'CARRIERNO'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
    end
    object edtTotalCost: TdxDBCalcEdit
      Tag = 10
      Left = 416
      Top = 165
      Width = 113
      ButtonNoShow = True
      TabOrder = 15
      TabStop = False
      DataField = 'skucost'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      DisplayFormat = ',0.##'
      Nullable = True
      StoredValues = 1
    end
    object edtConQuantityTotal: TdxDBCalcEdit
      Tag = 10
      Left = 504
      Top = 55
      Width = 25
      ButtonNoShow = True
      TabOrder = 12
      TabStop = False
      DataField = 'CONQuantity'
      DataSource = dtsMain
      ReadOnly = False
      StyleController = frmMain.StyleStandard
      DecimalPlaces = 4
      DisplayFormat = ',0.####'
      Nullable = True
      StoredValues = 113
    end
    object edtOriginOrder: TdxDBEdit
      Tag = 10
      Left = 67
      Top = 55
      Width = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      CharCase = ecUpperCase
      DataField = 'OriginOrder'
      DataSource = dtsMain
      MaxLength = 0
      StyleController = frmMain.StyleStandard
      StoredValues = 2
    end
    object edtDestOrder: TdxDBEdit
      Tag = 10
      Left = 67
      Top = 92
      Width = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      CharCase = ecUpperCase
      DataField = 'DestOrder'
      DataSource = dtsMain
      MaxLength = 0
      StyleController = frmMain.StyleStandard
      StoredValues = 2
    end
    object edtMainOrder: TdxDBEdit
      Tag = 10
      Left = 67
      Top = 18
      Width = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      CharCase = ecUpperCase
      DataField = 'MainOrder'
      DataSource = dtsMain
      MaxLength = 0
      StyleController = frmMain.StyleStandard
      StoredValues = 2
    end
    object edtCarbrand: TdxDBEdit
      Tag = 10
      Left = 416
      Top = 92
      Width = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      CharCase = ecUpperCase
      DataField = 'carbrand'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
    end
    object edtETSH: TdxDBDateEdit
      Tag = 10
      Left = 591
      Top = 128
      Width = 70
      ClickSpace = True
      TabOrder = 19
      DataField = 'ETSH'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object timETSH: TdxDBTimeEdit
      Tag = 10
      Left = 661
      Top = 128
      Width = 44
      TabOrder = 20
      DataField = 'ETSH'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      TimeEditFormat = tfHourMin
      StoredValues = 5
    end
    object edtFC_PORTDCD: TdxDBButtonEdit
      Tag = 10
      Left = 240
      Top = 202
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      CanDeleteText = True
      Field = 'portd'
      TabOrder = 9
      DataField = 'PORTD'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtFC_PORTDCDButtonClick
      ExistButtons = True
    end
    object edtFC_TRANSCD: TdxDBButtonEdit
      Tag = 10
      Left = 240
      Top = 165
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      CanDeleteText = True
      Field = 'trans'
      TabOrder = 8
      DataField = 'TRANS'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtFC_TRANSCDButtonClick
      ExistButtons = True
    end
    object edtFC_PORTLCD: TdxDBButtonEdit
      Tag = 10
      Left = 240
      Top = 128
      Width = 113
      AllowDblClk = True
      ClickSpace = True
      CanDeleteText = True
      Field = 'portl'
      TabOrder = 7
      DataField = 'PORTL'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtFC_PORTLCDButtonClick
      ExistButtons = True
    end
    object edtCarrierName: TKinDbPickEdit
      Tag = 10
      Left = 240
      Top = 55
      Width = 113
      TabOrder = 5
      StyleController = frmMain.StyleStandard
      ImmediateDropDown = True
      ShowItemField = True
      LookUpEdit = True
      DataField = 'CarrierName'
      DataSource = dtsMain
    end
    object edtconno: TdxDBBlobEdit
      Tag = 10
      Left = 416
      Top = 18
      Width = 113
      TabOrder = 10
      DataField = 'conno'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      BlobKind = bkMemo
      BlobPaintStyle = bpsText
    end
    object edtConDescription: TdxDBBlobEdit
      Tag = 10
      Left = 416
      Top = 55
      Width = 60
      TabOrder = 11
      DataField = 'ConDes'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      BlobKind = bkMemo
      BlobPaintStyle = bpsText
    end
    object dtdcarrierdate: TdxDBDateEdit
      Tag = 10
      Left = 591
      Top = 92
      Width = 70
      AutoLeave = True
      AllowDblClk = True
      ClickSpace = True
      TabOrder = 17
      DataField = 'carrierdate'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object tmtcarrierdate: TdxDBTimeEdit
      Tag = 10
      Left = 661
      Top = 55
      Width = 44
      TabOrder = 18
      DataField = 'conloaddate'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      TimeEditFormat = tfHourMin
      StoredValues = 5
    end
    object edtRouting: TdxDBBlobEdit
      Tag = 10
      Left = 416
      Top = 128
      Width = 113
      TabOrder = 14
      DataField = 'Routing'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      BlobKind = bkMemo
      BlobPaintStyle = bpsText
    end
    object dtdconloaddate: TdxDBDateEdit
      Tag = 10
      Left = 591
      Top = 55
      Width = 70
      ClickSpace = True
      TabOrder = 21
      DataField = 'conloaddate'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object tmtconloaddate: TdxDBTimeEdit
      Tag = 10
      Left = 661
      Top = 92
      Width = 44
      TabOrder = 22
      DataField = 'carrierdate'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      TimeEditFormat = tfHourMin
      StoredValues = 5
    end
    object customsno1: TdxDBEdit
      Tag = 10
      Left = 591
      Top = 165
      Width = 114
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 24
      CharCase = ecUpperCase
      DataField = 'customsno'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
    end
    object cmbCususername: TKinDbPickEdit
      Tag = 10
      Left = 240
      Top = 18
      Width = 113
      TabOrder = 25
      StyleController = frmMain.StyleStandard
      ImmediateDropDown = True
      LookUpEdit = True
      DataField = 'cususername'
      DataSource = dtsMain
    end
    object cmbLoadcosttype: TKinDbPickEdit
      Left = 416
      Top = 202
      Width = 113
      TabOrder = 26
      StyleController = frmMain.StyleStandard
      DropDownListStyle = True
      CanDeleteText = True
      LookUp = True
      LookUpEdit = True
      DataField = 'loadcosttype'
      DataSource = dtsMain
    end
    object edtremark: TdxDBBlobEdit
      Tag = 10
      Left = 591
      Top = 202
      Width = 113
      TabOrder = 27
      DataField = 'remark'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      BlobKind = bkMemo
      BlobPaintStyle = bpsText
    end
    object ckbisbroken: TdxDBCheckEdit
      Tag = 10
      Left = 63
      Top = 234
      Width = 114
      TabOrder = 28
      Alignment = taLeftJustify
      Caption = #26377#27531#25439
      DataField = 'isbroken'
      DataSource = dtsMain
      StyleController = frmMain.StyleCheck
      ValueChecked = 'T'
      ValueUnchecked = 'F'
      NullStyle = nsUnchecked
      StoredValues = 1
    end
    object edtbrokenmark: TdxDBBlobEdit
      Tag = 10
      Left = 240
      Top = 234
      Width = 113
      TabOrder = 29
      Alignment = taLeftJustify
      DataField = 'brokenmark'
      DataSource = dtsMain
      StyleController = frmMain.StyleStandard
      BlobKind = bkMemo
      BlobPaintStyle = bpsText
      StoredValues = 1
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 160
    Top = 376
  end
  object qryMain: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 192
    Top = 376
  end
  object dtsMain: TDataSource
    DataSet = qryMain
    Left = 225
    Top = 375
  end
end
