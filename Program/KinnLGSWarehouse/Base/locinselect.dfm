object frmLocinselect: TfrmLocinselect
  Left = 247
  Top = 123
  AutoScroll = False
  BiDiMode = bdLeftToRight
  Caption = #20986#24211#26680#23545
  ClientHeight = 505
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 39
    Width = 769
    Height = 232
    Align = alTop
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object grdlocinskudetail: TdxDBGrid
      Tag = 10
      Left = 2
      Top = 13
      Width = 765
      Height = 217
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'keyid'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = ppmadd
      ShowHint = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -12
      BandFont.Name = #23435#20307
      BandFont.Style = []
      DataSource = dtslocinskudetail
      Filter.Criteria = {00000000}
      GroupPanelColor = clBlack
      GroupPanelFontColor = clWhite
      GroupNodeColor = clMoneyGreen
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = #23435#20307
      HeaderFont.Style = []
      HideFocusRect = True
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandPanelSizing, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCanAppend, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -12
      PreviewFont.Name = #23435#20307
      PreviewFont.Style = []
      OnCustomDrawCell = grdlocinskudetailCustomDrawCell
      object skuname: TdxDBGridColumn
        Caption = #21830#21697#21517#31216
        HeaderAlignment = taCenter
        Width = 94
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuname'
      end
      object sealno: TdxDBGridColumn
        Alignment = taCenter
        Caption = #25176#30424#21495
        HeaderAlignment = taCenter
        Width = 112
        BandIndex = 0
        RowIndex = 0
        FieldName = 'sealno'
      end
      object qtyperct: TdxDBGridColumn
        Alignment = taCenter
        Caption = #31665#20010#25968
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'qtyperct'
      end
      object piece: TdxDBGridColumn
        Alignment = taCenter
        Caption = #31665#25968
        HeaderAlignment = taCenter
        Width = 72
        BandIndex = 0
        RowIndex = 0
        FieldName = 'piece'
      end
      object quantity: TdxDBGridColumn
        Alignment = taCenter
        Caption = #25968#37327
        HeaderAlignment = taCenter
        Width = 60
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantity'
      end
      object locname: TdxDBGridButtonColumn
        Alignment = taCenter
        Caption = #24211#20301
        HeaderAlignment = taCenter
        Width = 97
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locname'
        Buttons = <
          item
            Default = True
          end>
      end
      object quantitycp: TdxDBGridColumn
        Caption = #23436#25104#25968#37327
        HeaderAlignment = taCenter
        Width = 81
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantitycp'
      end
      object keyid: TdxDBGridColumn
        Visible = False
        Width = 37
        BandIndex = 0
        RowIndex = 0
        FieldName = 'keyid'
      end
      object quantitysy: TdxDBGridColumn
        Caption = #26410#23436#25104#25968#37327
        HeaderAlignment = taCenter
        Width = 90
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantitysy'
      end
    end
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 0
    Width = 769
    Height = 39
    Align = alTop
    TabOrder = 1
    StyleController = frmMain.StyleStandard
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 15
      Top = 15
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #20986#20179#21333#21495
      _AttachTo = edtmainorder
      _Gap = 1
    end
    object lbldisid: TGMSStickyLabel
      Left = 233
      Top = 16
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #21457#36135'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
      _AttachTo = cmbdisid
      _Gap = 1
    end
    object edtmainorder: TdxEdit
      Tag = 10
      Left = 64
      Top = 11
      Width = 109
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtmainorderKeyDown
      StyleController = frmMain.StyleStandard
    end
    object KBitBtn1: TKBitBtn
      Left = 210
      Top = 11
      Width = 75
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = KBitBtn1Click
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #26597#35810
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
    object KBitBtn2: TKBitBtn
      Left = 300
      Top = 11
      Width = 75
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = KBitBtn2Click
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #36864#20986
      TabOrder = 2
      StyleController = frmMain.StyleStandard
    end
    object btnprint: TKBitBtn
      Left = 390
      Top = 11
      Width = 75
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnprintClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #25171#21360
      TabOrder = 3
      StyleController = frmMain.StyleStandard
    end
    object cmbdisid: TKinPickEdit
      Tag = 10
      Left = 270
      Top = 12
      Width = 109
      TabOrder = 4
      Visible = False
      OnExit = cmbdisidExit
      OnKeyDown = cmbdisidKeyDown
      StyleController = frmMain.StyleStandard
      ImmediateDropDown = True
      LookUp = True
    end
  end
  object KGroupBox3: TKGroupBox
    Left = 0
    Top = 271
    Width = 769
    Height = 234
    Align = alClient
    TabOrder = 2
    StyleController = frmMain.StyleStandard
    object grdlocoutskudetail: TdxDBGrid
      Tag = 10
      Left = 2
      Top = 13
      Width = 765
      Height = 219
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'keyid'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = ppmadd
      ShowHint = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -12
      BandFont.Name = #23435#20307
      BandFont.Style = []
      DataSource = dtslocoutskudetail
      Filter.Criteria = {00000000}
      GroupPanelColor = 12615680
      GroupPanelFontColor = clWhite
      GroupNodeColor = clMoneyGreen
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = #23435#20307
      HeaderFont.Style = []
      HideFocusRect = True
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandPanelSizing, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCanAppend, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -12
      PreviewFont.Name = #23435#20307
      PreviewFont.Style = []
      object grdqtyperct: TdxDBGridColumn
        Alignment = taCenter
        Caption = #31665#20010#25968
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'qtyperct'
      end
      object grdallct: TdxDBGridColumn
        Alignment = taCenter
        Caption = #24635#31665#25968
        HeaderAlignment = taCenter
        Width = 67
        BandIndex = 0
        RowIndex = 0
        FieldName = 'allct'
      end
      object grdlocname: TdxDBGridColumn
        Alignment = taCenter
        Caption = #24211#20301
        HeaderAlignment = taCenter
        Width = 70
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locname'
      end
      object grdjobno: TdxDBGridColumn
        Alignment = taCenter
        Caption = #24037#20316#21495
        HeaderAlignment = taCenter
        Visible = False
        Width = 134
        BandIndex = 0
        RowIndex = 0
        FieldName = 'jobno'
      end
      object grdquantity: TdxDBGridColumn
        Alignment = taCenter
        Caption = #25968#37327
        HeaderAlignment = taCenter
        Width = 69
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantity'
      end
      object skuname1: TdxDBGridColumn
        Caption = #21830#21697#21517#31216
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuname'
      end
      object disid: TdxDBGridColumn
        Caption = #21457#36135'ID'
        HeaderAlignment = taCenter
        Width = 79
        BandIndex = 0
        RowIndex = 0
        FieldName = 'disid'
      end
    end
  end
  object dtslocinskudetail: TDataSource
    DataSet = qrylocinskudetail
    Left = 318
    Top = 164
  end
  object qrylocinskudetail: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 290
    Top = 164
  end
  object ppmadd: TPopupMenu
    Tag = 10
    Left = 202
    Top = 216
    object mitDelLocOld: TMenuItem
      Tag = 11
      Caption = #21024#38500
      OnClick = mitDelLocOldClick
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 396
    Top = 164
  end
  object qrylocoutskudetail: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 287
    Top = 316
  end
  object dtslocoutskudetail: TDataSource
    DataSet = qrylocoutskudetail
    Left = 314
    Top = 316
  end
  object KADOQuery2: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 393
    Top = 316
  end
end
