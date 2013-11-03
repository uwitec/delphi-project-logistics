object frmLocOutSKUDetail: TfrmLocOutSKUDetail
  Left = 271
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36827#20986#20179#21830#21697#32454#30446
  ClientHeight = 446
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
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
  object grdSKUDetail: TdxDBGrid
    Left = 0
    Top = 42
    Width = 668
    Height = 359
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'detailsno'
    ShowGroupPanel = True
    ShowSummaryFooter = True
    SummaryGroups = <
      item
        DefaultGroup = True
        SummaryItems = <
          item
            SummaryField = 'KEYID'
            SummaryDisplayField = 'SKUSNO'
            SummaryFormat = #23567#35745'#'#31508
            SummaryType = cstCount
          end>
        Name = 'grdCount'
      end>
    SummarySeparator = ', '
    Align = alClient
    Color = clInfoBk
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PopupMenu = ppmSKUDetail
    TabOrder = 1
    OnEnter = grdSKUDetailEnter
    OnExit = grdSKUDetailExit
    OnKeyDown = grdSKUDetailKeyDown
    BandFont.Charset = GB2312_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -12
    BandFont.Name = #23435#20307
    BandFont.Style = []
    DataSource = dtslocOutskudetail
    Filter.Criteria = {00000000}
    GroupPanelColor = 12615680
    GroupPanelFontColor = clWhite
    HeaderFont.Charset = GB2312_CHARSET
    HeaderFont.Color = clBlack
    HeaderFont.Height = -12
    HeaderFont.Name = #23435#20307
    HeaderFont.Style = []
    HideFocusRect = True
    IniFileName = 'KinnGrid.ini'
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCanAppend, edgoCanInsert, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoIndicator]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -12
    PreviewFont.Name = #23435#20307
    PreviewFont.Style = []
    OnChangeNodeEx = grdSKUDetailChangeNodeEx
    OnEditing = grdSKUDetailEditing
    object edtSNO: TdxDBGridColumn
      Alignment = taCenter
      Caption = 'NO'
      DisableEditor = True
      HeaderAlignment = taCenter
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'detailsno'
    end
    object UnKnowQ: TdxDBGridCheckColumn
      Caption = 'UN'
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 21
      BandIndex = 0
      RowIndex = 0
      FieldName = 'UnKnowQ'
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object conno: TdxDBGridColumn
      Caption = #31665#21495
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'conno'
    end
    object edtSKUName: TdxDBGridButtonColumn
      Alignment = taCenter
      Caption = #21830#21697
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SKUName'
      ButtonOnly = True
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtSKUNameButtonClick
    end
    object color: TdxDBGridColumn
      Caption = #39068#33394
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'color'
    end
    object skuspec: TdxDBGridColumn
      Caption = #23610#30721
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'skuspec'
    end
    object lotcode: TdxDBGridColumn
      Caption = #25209#27425
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'lotcode'
    end
    object skubrand: TdxDBGridColumn
      Caption = #21697#29260
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'skubrand'
    end
    object edtqualityname: TdxDBGridButtonColumn
      Caption = #21697#36136
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qualityname'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtqualitynameButtonClick
    end
    object edtQUANTITY: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #25968#37327
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      OnValidate = edtQUANTITYValidate
      FieldName = 'QUANTITY'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object cmbQUANTITYUOM: TdxDBGridKinPickColumn
      Alignment = taCenter
      Caption = 'QUOM'
      HeaderAlignment = taCenter
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'QUANTITYUOM'
      DropDownListStyle = True
    end
    object edtdepth: TdxDBGridColumn
      Caption = #38271
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'depth'
    end
    object edtwidth: TdxDBGridColumn
      Caption = #23485
      HeaderAlignment = taCenter
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'width'
    end
    object edtheight: TdxDBGridColumn
      Caption = #39640
      HeaderAlignment = taCenter
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'height'
    end
    object sizeuom: TdxDBGridKinPickColumn
      Caption = 'SUOM'
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sizeuom'
    end
    object remark: TdxDBGridBlobColumn
      Caption = #22791#27880
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'remark'
      BlobKind = bkMemo
    end
    object edtSKUSerialNO: TdxDBGridColumn
      Alignment = taCenter
      Caption = #21830#21697#32534#21495
      HeaderAlignment = taCenter
      Width = 67
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SerialNO'
    end
    object qtyperct: TdxDBGridColumn
      Alignment = taCenter
      Caption = #31665#20010#25968
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'qtyperct'
    end
    object allct: TdxDBGridColumn
      Alignment = taCenter
      Caption = #31665#24635#25968
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'allct'
    end
    object sealno: TdxDBGridColumn
      Alignment = taCenter
      Caption = #25176#30424#21495
      HeaderAlignment = taCenter
      Width = 79
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sealno'
    end
    object xh: TdxDBGridColumn
      Caption = #31665#21495
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'xh'
    end
    object manufacturedate: TdxDBGridColumn
      Caption = #29983#20135#26085#26399
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'manufacturedate'
    end
    object grossweight: TdxDBGridColumn
      Caption = #27611#37325
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'grossweight'
      SummaryFooterType = cstSum
    end
    object netweight: TdxDBGridColumn
      Caption = #20928#37325
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'netweight'
      SummaryFooterType = cstSum
    end
    object piece: TdxDBGridColumn
      Caption = #20214#25968
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'piece'
      SummaryFooterType = cstSum
    end
  end
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 401
    Width = 668
    Height = 45
    Align = alBottom
    TabOrder = 2
    object btnSaveClose: TKBitBtn
      Tag = 10
      Left = 502
      Top = 13
      Width = 75
      Height = 25
      Hint = #20445#23384
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000000770EE000000770E0770EE000000770E0770EE00000077
        0E0770EE000000000E0770EEEEEEEEEEEE0770EE00000000EE0770E077777777
        0E0770E0777777770E0770E0777777770E0770E0777777770E0770E077777777
        000770E077777777070770000000000000077777777777777777}
      OnClick = btnSaveCloseClick
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
      ParentShowHint = False
      ShowHint = True
      ModalResult = 1
      StyleController = frmMain.StyleStandard
    end
    object KBitBtn5: TKBitBtn
      Tag = 21
      Left = 586
      Top = 13
      Width = 75
      Height = 25
      Hint = #25918#24323'(ESC)'
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770000000000000770EE000000770E0770EE000000770E0770EE00000077
        0E077000000000000E0770990070990EEE07709990099900EE07700999999007
        0E077070999907770E077070999907770E077009999990070E07709990099907
        0007709907709907070770000000000000077777777777777777}
      OnClick = KBitBtn5Click
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #36864#20986
      TabOrder = 1
      ParentShowHint = False
      ShowHint = True
      ModalResult = 2
      StyleController = frmMain.StyleStandard
    end
    object ckbTotal: TdxCheckEdit
      Tag = 10
      Left = 349
      Top = 13
      Width = 140
      Style.BorderStyle = xbsNone
      TabOrder = 2
      Caption = #25968#37327#21512#35745#21040#20179#20301#20449#24687
      StyleController = frmMain.StyleCheck
      State = cbsChecked
    end
  end
  object Panel2: TPanel
    Tag = 10
    Left = 0
    Top = 0
    Width = 668
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    Visible = False
    object KGroupBox12: TKGroupBox
      Tag = 10
      Left = 0
      Top = 0
      Width = 668
      Height = 42
      Align = alClient
      Caption = #26465#30721#25195#25551#21306
      TabOrder = 0
      object GMSStickyLabel3: TGMSStickyLabel
        Left = 150
        Top = 19
        Width = 60
        Height = 12
        Caption = #21830#21697#24207#21015#21495
        _AttachTo = edtCustomerNo
      end
      object GMSStickyLabel2: TGMSStickyLabel
        Left = 15
        Top = 19
        Width = 24
        Height = 12
        Caption = #31665#21495
        _AttachTo = edtConnoScan
      end
      object GMSStickyLabel1: TGMSStickyLabel
        Left = 341
        Top = 19
        Width = 24
        Height = 12
        Caption = #25968#37327
        _AttachTo = edtQuantityP
      end
      object GMSStickyLabel4: TGMSStickyLabel
        Left = 439
        Top = 19
        Width = 24
        Height = 12
        Caption = #20928#37325
        _AttachTo = edtNetWeightP
      end
      object edtConnoScan: TdxEdit
        Left = 41
        Top = 15
        Width = 100
        TabOrder = 0
        StyleController = frmMain.StyleStandard
      end
      object edtQuantityP: TdxCalcEdit
        Left = 367
        Top = 15
        Width = 64
        ButtonNoShow = True
        TabOrder = 2
        StyleController = frmMain.StyleStandard
        Text = '0'
        DecimalPlaces = 0
        DisplayFormat = '0'
        StoredValues = 1
      end
      object edtNetWeightP: TdxCalcEdit
        Left = 465
        Top = 15
        Width = 64
        ButtonNoShow = True
        TabOrder = 3
        StyleController = frmMain.StyleStandard
        Text = '0'
        DecimalPlaces = 0
        DisplayFormat = '0'
        StoredValues = 1
      end
      object edtCustomerNo: TdxButtonEdit
        Left = 212
        Top = 15
        Width = 121
        TabOrder = 1
        OnExit = edtCustomerNoExit
        Buttons = <
          item
            Default = True
          end>
        OnButtonClick = edtCustomerNoButtonClick
        ExistButtons = True
      end
      object btnInput: TKBitBtn
        Left = 562
        Top = 13
        Width = 78
        Height = 25
        Hint = #23548#20837'(I)'
        Transparent = False
        ActiveTextColor = clBlack
        NumGlyphs = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        Spacing = 0
        Radius = 5
        MiddleTransparent = False
        FrameInnerColor = clBtnHighlight
        FrameOuterColor = clBtnShadow
        FrameColor = clWindowFrame
        Frame3D = True
        FrameRnd = False
        Caption = #23548#20837
        TabOrder = 4
        StyleController = frmMain.StyleStandard
      end
    end
  end
  object ppmSKUDetail: TPopupMenu
    Left = 136
    Top = 288
    object mitSkuAdd: TMenuItem
      Tag = 10
      Caption = #22686#21152
      OnClick = mitSkuAddClick
    end
    object mitSkuDel: TMenuItem
      Tag = 10
      Caption = #21024#38500
      OnClick = mitSkuDelClick
    end
    object mitcopy: TMenuItem
      Tag = 10
      Caption = #22797#21046
    end
    object mitplaste: TMenuItem
      Caption = #31896#36148
      Enabled = False
      OnClick = mitplasteClick
    end
    object mitColumnset: TMenuItem
      Caption = #21015#35774#32622
      OnClick = mitColumnsetClick
    end
  end
  object dtslocOutskudetail: TDataSource
    Left = 76
    Top = 288
  end
  object ppmSkuSelect: TPopupMenu
    Left = 152
    Top = 144
    object mitSku: TMenuItem
      Tag = 10
      Caption = #20174#21830#21697#26126#32454#20013#25361#36873
      OnClick = mitSkuClick
    end
    object mitOrder: TMenuItem
      Tag = 10
      Caption = #20174#25351#20196#36164#26009#25361#36873
      Visible = False
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 48
    Top = 248
  end
  object qrytmp1: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 88
    Top = 248
  end
end
