object frmSyslocfind: TfrmSyslocfind
  Left = 274
  Top = 207
  AutoScroll = False
  BiDiMode = bdLeftToRight
  Caption = #31354#24211#20301#26597#35810
  ClientHeight = 438
  ClientWidth = 680
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
    Width = 680
    Height = 399
    Align = alClient
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object grdSyslocfind: TdxDBGrid
      Tag = 10
      Left = 2
      Top = 13
      Width = 676
      Height = 384
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'locid'
      ShowSummaryFooter = True
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
      ShowHint = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -12
      BandFont.Name = #23435#20307
      BandFont.Style = []
      DataSource = dtssyslocfind
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
      OnEditing = grdSyslocfindEditing
      object locname: TdxDBGridColumn
        Alignment = taCenter
        Caption = #24211#20301
        HeaderAlignment = taCenter
        Width = 216
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locname'
        SummaryFooterType = cstCount
        SummaryFooterFormat = #20849':#'#20010
      end
    end
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 0
    Width = 680
    Height = 39
    Align = alTop
    TabOrder = 1
    StyleController = frmMain.StyleStandard
    object KBitBtn1: TKBitBtn
      Left = 416
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
      TabOrder = 0
      StyleController = frmMain.StyleStandard
    end
    object KBitBtn2: TKBitBtn
      Left = 598
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
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
    object edtprint: TKBitBtn
      Left = 507
      Top = 11
      Width = 75
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = edtprintClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #25171#21360
      TabOrder = 2
      StyleController = frmMain.StyleStandard
    end
  end
  object ppmadd: TPopupMenu
    Tag = 10
    Left = 202
    Top = 216
    object mitAddLocOld: TMenuItem
      Tag = 11
      Caption = #22686#21152
    end
    object mitDelLocOld: TMenuItem
      Tag = 11
      Caption = #21024#38500
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
  object qrysyslocfind: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    KeyField = 'locname'
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 247
    Top = 220
  end
  object dtssyslocfind: TDataSource
    DataSet = qrysyslocfind
    Left = 282
    Top = 220
  end
end
