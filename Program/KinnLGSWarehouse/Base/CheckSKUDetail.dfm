object frmCheckSKUDetail: TfrmCheckSKUDetail
  Left = 274
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21830#21697#26657#39564
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
  OnActivate = FormActivate
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
    KeyField = 'detailSno'
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
          end
          item
            SummaryField = 'quantity'
            SummaryFormat = '#'
            SummaryType = cstSum
          end>
        Name = 'grdCount'
      end>
    SummarySeparator = ', '
    Align = alBottom
    Color = clInfoBk
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PopupMenu = ppmSKUDetail
    TabOrder = 2
    OnEnter = grdSKUDetailEnter
    OnExit = grdSKUDetailExit
    OnKeyDown = grdSKUDetailKeyDown
    BandFont.Charset = GB2312_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -12
    BandFont.Name = #23435#20307
    BandFont.Style = []
    DataSource = dtsskudetail
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
    object edtSKUSNO: TdxDBGridColumn
      Alignment = taCenter
      Caption = 'NO'
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
    object edtSKUSKUName: TdxDBGridButtonColumn
      Alignment = taCenter
      Caption = #21830#21697
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SKUName'
      ButtonOnly = True
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtSKUSKUNameButtonClick
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
    object conno: TdxDBGridColumn
      Caption = #31665#21495
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'conno'
    end
    object lotcode: TdxDBGridColumn
      Caption = #25209#27425
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'lotcode'
    end
    object edtQUANTITY: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #25968#37327
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'QUANTITY'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object edtcolor: TdxDBGridColumn
      Caption = #39068#33394
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'color'
    end
    object edtskuspec: TdxDBGridColumn
      Caption = #35268#26684
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'skuspec'
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
    object quantity_piece_prop: TdxDBGridCurrencyColumn
      Caption = #25968#37327'/'#20214
      HeaderAlignment = taCenter
      Width = 65
      BandIndex = 0
      RowIndex = 0
      OnValidate = quantity_piece_propValidate
      FieldName = 'quantity_piece_prop'
      DisplayFormat = '0.####;-0.####'
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
    object edtPiece: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #20214#25968
      HeaderAlignment = taCenter
      Width = 56
      BandIndex = 0
      RowIndex = 0
      OnValidate = edtPieceValidate
      FieldName = 'Piece'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object cmbPieceUOM: TdxDBGridKinPickColumn
      Alignment = taCenter
      Caption = 'PUOM'
      HeaderAlignment = taCenter
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PieceUOM'
      DropDownListStyle = True
    end
    object edtVolume: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #20307#31215
      HeaderAlignment = taCenter
      Width = 56
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Volume'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.##;-,0.##'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object cmbVolumeUOM: TdxDBGridKinPickColumn
      Alignment = taCenter
      Caption = 'VUOM'
      HeaderAlignment = taCenter
      Width = 51
      BandIndex = 0
      RowIndex = 0
      OnValidate = cmbVolumeUOMValidate
      FieldName = 'VolumeUOM'
      DropDownListStyle = True
    end
    object edtArea: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #38754#31215
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Area'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object cmbAreaUOM: TdxDBGridKinPickColumn
      Alignment = taCenter
      Caption = 'AUOM'
      HeaderAlignment = taCenter
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'AreaUOM'
      DropDownListStyle = True
    end
    object manufacturedate: TdxDBGridColumn
      Caption = #29983#20135#26085#26399
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'manufacturedate'
    end
    object edtGrossWeight: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #27611#37325
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'GrossWeight'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object edtNetWeight: TdxDBGridCurrencyColumn
      Alignment = taRightJustify
      Caption = #20928#37325
      HeaderAlignment = taCenter
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NetWeight'
      SummaryFooterType = cstSum
      SummaryFooterFormat = '0.####;-,0.####'
      DecimalPlaces = 4
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object cmbWeightUOM: TdxDBGridKinPickColumn
      Caption = 'WUOM'
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WeightUOM'
      DropDownListStyle = True
    end
    object edtdepth: TdxDBGridColumn
      Caption = #38271
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      OnValidate = edtdepthValidate
      FieldName = 'depth'
    end
    object edtwidth: TdxDBGridColumn
      Caption = #23485
      HeaderAlignment = taCenter
      Width = 35
      BandIndex = 0
      RowIndex = 0
      OnValidate = edtwidthValidate
      FieldName = 'width'
    end
    object edtheight: TdxDBGridColumn
      Caption = #39640
      HeaderAlignment = taCenter
      Width = 35
      BandIndex = 0
      RowIndex = 0
      OnValidate = edtheightValidate
      FieldName = 'height'
    end
    object sizeuom: TdxDBGridKinPickColumn
      Caption = 'SUOM'
      HeaderAlignment = taCenter
      Width = 47
      BandIndex = 0
      RowIndex = 0
      OnValidate = sizeuomValidate
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
    object sealno: TdxDBGridColumn
      Caption = #25176#30424#21495
      HeaderAlignment = taCenter
      Width = 60
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
  end
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 401
    Width = 668
    Height = 45
    Align = alBottom
    TabOrder = 3
    object btnSave: TKBitBtn
      Tag = 10
      Left = 417
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
      Caption = #20445#23384
      TabOrder = 2
      ParentShowHint = False
      ShowHint = True
      StyleController = frmMain.StyleStandard
    end
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
      Caption = #30830#35748
      TabOrder = 3
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
      TabOrder = 4
      ParentShowHint = False
      ShowHint = True
      ModalResult = 2
      StyleController = frmMain.StyleStandard
    end
    object btnEdit: TKBitBtn
      Tag = 2
      Left = 332
      Top = 13
      Width = 75
      Height = 25
      Hint = #20462#25913'(E)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        888888888888888888888888888888888888888FFFFFFFFFF888888000000000
        0888887777777777888888880000000088888887777777788888888880000008
        8888888877777788888888888800008888888888877778888888888888800888
        8888888888778888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888}
      OnClick = btnEditClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #20462#25913
      TabOrder = 1
      ParentShowHint = False
      ShowHint = True
      Visible = False
      StyleController = frmMain.StyleStandard
    end
    object ckbTotal: TdxCheckEdit
      Tag = 10
      Left = 184
      Top = 13
      Width = 137
      Style.BorderStyle = xbsNone
      TabOrder = 0
      Caption = #21512#35745#21040#21830#21697#20219#21153#20449#24687
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
        Left = 165
        Top = 18
        Width = 60
        Height = 12
        Caption = #21830#21697#24207#21015#21495
        _AttachTo = edtSerialNOScan
      end
      object GMSStickyLabel2: TGMSStickyLabel
        Left = 11
        Top = 18
        Width = 24
        Height = 12
        Caption = #31665#21495
        _AttachTo = edtLotCodeScan
      end
      object GMSStickyLabel1: TGMSStickyLabel
        Left = 359
        Top = 18
        Width = 24
        Height = 12
        Caption = #25968#37327
        _AttachTo = edtQuantityP
      end
      object GMSStickyLabel4: TGMSStickyLabel
        Left = 455
        Top = 18
        Width = 24
        Height = 12
        Caption = #20928#37325
        _AttachTo = edtNetWeightP
      end
      object edtLotCodeScan: TdxEdit
        Left = 37
        Top = 14
        Width = 121
        TabOrder = 1
        StyleController = frmMain.StyleStandard
      end
      object edtSerialNOScan: TdxEdit
        Left = 227
        Top = 14
        Width = 121
        TabOrder = 2
        OnExit = edtSerialNOScanExit
        ReadOnly = False
        StyleController = frmMain.StyleStandard
        StoredValues = 64
      end
      object btnInput: TKBitBtn
        Left = 576
        Top = 11
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
        TabOrder = 0
        StyleController = frmMain.StyleStandard
      end
      object edtQuantityP: TdxCalcEdit
        Left = 385
        Top = 14
        Width = 64
        ButtonNoShow = True
        TabOrder = 3
        StyleController = frmMain.StyleStandard
        Text = '0'
        DecimalPlaces = 0
        DisplayFormat = '0'
        StoredValues = 1
      end
      object edtNetWeightP: TdxCalcEdit
        Left = 481
        Top = 14
        Width = 64
        ButtonNoShow = True
        TabOrder = 4
        StyleController = frmMain.StyleStandard
        Text = '0'
        DecimalPlaces = 0
        DisplayFormat = '0'
        StoredValues = 1
      end
    end
  end
  object Panel1: TPanel
    Tag = 10
    Left = 0
    Top = 0
    Width = 668
    Height = 42
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object KGroupBox2: TKGroupBox
      Tag = 10
      Left = 0
      Top = 0
      Width = 668
      Height = 42
      Caption = #21830#21697#32454#30446#23548#20837
      TabOrder = 0
      object GMSStickyLabel13: TGMSStickyLabel
        Left = 11
        Top = 18
        Width = 48
        Height = 12
        Caption = #25968#25454#25991#20214
        _AttachTo = edtPath
      end
      object KBitBtn1: TKBitBtn
        Left = 576
        Top = 11
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
        OnClick = KBitBtn1Click
        Spacing = 0
        Radius = 5
        MiddleTransparent = False
        FrameInnerColor = clBtnHighlight
        FrameOuterColor = clBtnShadow
        FrameColor = clWindowFrame
        Frame3D = True
        FrameRnd = False
        Caption = #23548#20837
        TabOrder = 0
        StyleController = frmMain.StyleStandard
      end
      object edtPath: TdxButtonEdit
        Tag = 10
        Left = 61
        Top = 14
        Width = 492
        AllowDblClk = True
        TabOrder = 1
        StyleController = frmMain.StyleStandard
        Buttons = <
          item
            Default = True
          end>
        OnButtonClick = edtPathButtonClick
        ExistButtons = True
      end
    end
  end
  object ppmSKUDetail: TPopupMenu
    Left = 72
    Top = 408
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
      OnClick = mitcopyClick
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
  object dtsskudetail: TDataSource
    Left = 108
    Top = 408
  end
  object ppmSkuSelect: TPopupMenu
    Left = 153
    Top = 144
    object mitSku: TMenuItem
      Tag = 10
      Caption = #20174#21830#21697#36164#26009#25361#36873
      OnClick = mitSkuClick
    end
    object mitOrder: TMenuItem
      Tag = 10
      Caption = #20174#25351#20196#36164#26009#25361#36873
      OnClick = mitOrderClick
    end
    object mitskudetail: TMenuItem
      Caption = #21830#21697#26126#32454
      Visible = False
      OnClick = mitskudetailClick
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 80
    Top = 360
  end
  object qrytmp1: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 128
    Top = 360
  end
  object AqryMtf: TADOQuery
    AutoCalcFields = False
    Connection = conMtf
    CursorType = ctStatic
    EnableBCD = False
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from [sheet1$]')
    Left = 144
    Top = 248
  end
  object conMtf: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 174
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Tag = 10
    Filter = '(Excel'#25991#20214')*.xls|*.xls'
    Left = 208
    Top = 248
  end
end
