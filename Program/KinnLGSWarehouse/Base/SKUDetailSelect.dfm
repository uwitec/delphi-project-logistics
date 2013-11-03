object frmSkuDetailSelect: TfrmSkuDetailSelect
  Left = 238
  Top = 148
  Width = 598
  Height = 454
  Caption = #21830#21697#36164#26009#32454#30446#36873#25321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object grdSkuDetailSelect: TdxDBGrid
    Left = 0
    Top = 97
    Width = 590
    Height = 281
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'keyId'
    ShowGroupPanel = True
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alTop
    Color = clInfoBk
    TabOrder = 1
    OnDblClick = btnOkClick
    DataSource = dtsWareInventoryDetail
    Filter.Criteria = {00000000}
    GroupPanelColor = 12615680
    HideFocusRect = True
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
    object customsno: TdxDBGridColumn
      Caption = #25253#20851#21333#21495
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'customsno'
    end
    object locationbillno: TdxDBGridColumn
      Caption = #20179#21333#21495
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'locationbillno'
    end
    object SerialNO: TdxDBGridColumn
      Caption = #21830#21697#32534#21495
      HeaderAlignment = taCenter
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SerialNO'
    end
    object SKUID: TdxDBGridColumn
      Alignment = taLeftJustify
      Caption = #21830#21697#21517#31216
      HeaderAlignment = taCenter
      Width = 95
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SKUName'
    end
    object sealno: TdxDBGridColumn
      Caption = #31665#21495
      HeaderAlignment = taCenter
      Width = 102
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sealno'
    end
    object lotcode: TdxDBGridColumn
      Caption = #25209#27425
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'lotcode'
    end
    object QT_Remain: TdxDBGridCurrencyColumn
      Caption = #25968#37327
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'syQuantity'
      SummaryFooterType = cstSum
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object SYPiece: TdxDBGridCurrencyColumn
      Caption = #20214#25968
      HeaderAlignment = taCenter
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SYPiece'
      SummaryFooterType = cstSum
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object SYNetWeight: TdxDBGridCurrencyColumn
      Caption = #20928#37325
      HeaderAlignment = taCenter
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SYNetWeight'
      SummaryFooterType = cstSum
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object SYGrossWeight: TdxDBGridCurrencyColumn
      Caption = #27611#37325
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SYGrossWeight'
      SummaryFooterType = cstSum
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object SYVolume: TdxDBGridCurrencyColumn
      Caption = #20307#31215
      HeaderAlignment = taCenter
      Width = 62
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SYVolume'
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
    object SYArea: TdxDBGridCurrencyColumn
      Caption = #38754#31215
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SYArea'
      DisplayFormat = '0.####;-,0.####'
      Nullable = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 6
      Top = 80
      Width = 204
      Height = 12
      Caption = #22312#19979#38754#30340#21015#34920#20013#36873#25321#20320#25152#38656#35201#30340#21830#21697#65306
    end
    object GMSStickyLabel7: TGMSStickyLabel
      Left = 214
      Top = 27
      Width = 48
      Height = 12
      Caption = #21830#21697#21517#31216
      _AttachTo = edtSkuName
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 214
      Top = 59
      Width = 48
      Height = 12
      Caption = #25209'    '#27425
      _AttachTo = edtlotcode
    end
    object btnRefresh: TKBitBtn
      Left = 456
      Top = 24
      Width = 96
      Height = 49
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnRefreshClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #21047#26032
      TabOrder = 3
      StyleController = frmMain.StyleStandard
    end
    object edtSkuName: TdxEdit
      Left = 264
      Top = 23
      Width = 150
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
    object edtlotcode: TdxEdit
      Left = 264
      Top = 55
      Width = 150
      TabOrder = 2
      StyleController = frmMain.StyleStandard
    end
    object pgcBlnoAndConno: TdxPageControl
      Left = 19
      Top = 3
      Width = 182
      Height = 73
      ActivePage = tbsBillNO
      HideButtons = False
      HotTrack = False
      MultiLine = False
      OwnerDraw = False
      RaggedRight = False
      ScrollOpposite = False
      TabHeight = 0
      TabOrder = 0
      TabPosition = dxtpTop
      TabStop = True
      TabWidth = 0
      object blnolb: TdxTabSheet
        Caption = #20179#21333#21495
        object memLocationBillno: TdxMemo
          Left = 0
          Top = 0
          Width = 182
          Align = alClient
          Color = clWhite
          TabOrder = 0
          StyleController = frmMain.StyleMemo
          ScrollBars = ssVertical
          SelectionBar = False
          Height = 51
        end
      end
      object dxTabSheet1: TdxTabSheet
        Caption = #20027#35746#21333#21495
        object memMainOrder: TdxMemo
          Left = 0
          Top = 0
          Width = 182
          Align = alClient
          Color = clWhite
          TabOrder = 0
          StyleController = frmMain.StyleMemo
          ScrollBars = ssVertical
          SelectionBar = False
          Height = 51
        end
      end
      object dxTabSheet2: TdxTabSheet
        Caption = #23458#25143#21333#21495
        object memCusBillno: TdxMemo
          Left = 0
          Top = 0
          Width = 182
          Align = alClient
          Color = clWhite
          TabOrder = 0
          StyleController = frmMain.StyleMemo
          ScrollBars = ssVertical
          SelectionBar = False
          Height = 51
        end
      end
      object tbsBillNO: TdxTabSheet
        Caption = #25253#20851#21333#21495
        object memCustomsno: TdxMemo
          Left = 0
          Top = 0
          Width = 182
          Align = alClient
          Color = clWhite
          TabOrder = 0
          StyleController = frmMain.StyleMemo
          ScrollBars = ssVertical
          SelectionBar = False
          Height = 51
        end
      end
      object dxTabSheet3: TdxTabSheet
        Caption = #31665'    '#21495
        object memsealno: TdxMemo
          Left = 0
          Top = 0
          Width = 182
          Align = alClient
          Color = clWhite
          TabOrder = 0
          StyleController = frmMain.StyleMemo
          ScrollBars = ssVertical
          SelectionBar = False
          Height = 51
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 378
    Width = 590
    Height = 42
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object btnOk: TKBitBtn
      Left = 374
      Top = 9
      Width = 74
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
      Frame3D = False
      FrameRnd = False
      Caption = #30830#23450'(&Y)'
      TabOrder = 2
      StyleController = frmMain.StyleStandard
    end
    object btnCancel: TKBitBtn
      Left = 478
      Top = 9
      Width = 74
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      OnClick = btnCancelClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #25918#24323'(&N)'
      TabOrder = 3
      StyleController = frmMain.StyleStandard
    end
    object btnSelectAll: TKBitBtn
      Left = 38
      Top = 9
      Width = 95
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
      OnClick = btnSelectAllClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #20840#37096#36873#23450'(&Y)'
      TabOrder = 0
      StyleController = frmMain.StyleStandard
    end
    object btnCancleAll: TKBitBtn
      Left = 166
      Top = 9
      Width = 95
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      OnClick = btnCancleAllClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #20840#37096#25918#24323'(&N)'
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
  end
  object dtsWareInventoryDetail: TDataSource
    DataSet = qrySkuDetailSelect
    Left = 248
    Top = 240
  end
  object qrySkuDetailSelect: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 216
    Top = 240
  end
end
