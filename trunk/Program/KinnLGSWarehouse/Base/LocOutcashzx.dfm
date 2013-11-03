object frmLocOutcashzx: TfrmLocOutcashzx
  Left = 261
  Top = 67
  BorderStyle = bsSingle
  Caption = #20837#24211#26657#39564
  ClientHeight = 591
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object pgcMain: TdxPageControl
    Left = 0
    Top = 0
    Width = 837
    Height = 591
    ActivePage = tbsEdit
    Align = alClient
    HideButtons = False
    HotTrack = False
    MultiLine = True
    OwnerDraw = True
    RaggedRight = False
    ScrollOpposite = False
    TabHeight = 0
    TabOrder = 0
    TabPosition = dxtpTop
    TabStop = True
    TabWidth = 0
    object tbsEdit: TdxTabSheet
      Caption = #32534#36753
      TabVisible = False
      object RxSplitter1: TRxSplitter
        Left = 0
        Top = 589
        Width = 837
        Height = 2
        Align = alBottom
      end
      object KGroupBox3: TKGroupBox
        Left = 0
        Top = 49
        Width = 837
        Height = 49
        Align = alTop
        TabOrder = 1
        StyleController = frmMain.StyleStandard
        object GMSStickyLabel5: TGMSStickyLabel
          Left = 239
          Top = 14
          Width = 64
          Height = 16
          Caption = #21830#21697#32534#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = edtcustomerno
          _Gap = 1
        end
        object GMSStickyLabel6: TGMSStickyLabel
          Left = 10
          Top = 14
          Width = 64
          Height = 16
          Caption = #31665' '#26465' '#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = edtlotcode
          _Gap = 1
        end
        object edtcustomerno: TdxEdit
          Left = 304
          Top = 10
          Width = 150
          OnExitCheck = edtcustomernoExitCheck
          TabOrder = 4
          TabStop = False
          OnExit = edtcustomernoExit
          AutoSize = False
          StyleController = frmMain.StyleStandard
          Height = 32
        end
        object btncash: TKBitBtn
          Left = 740
          Top = 8
          Width = 80
          Height = 37
          Transparent = False
          ActiveTextColor = clBlack
          OnClick = btncashClick
          Spacing = 0
          Radius = 5
          MiddleTransparent = False
          FrameInnerColor = clBtnHighlight
          FrameOuterColor = clBtnShadow
          FrameColor = clWindowFrame
          Frame3D = False
          FrameRnd = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #26657#39564#30830#35748
          TabOrder = 0
          Enabled = False
          ParentFont = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object btnzx: TKBitBtn
          Left = 560
          Top = 9
          Width = 81
          Height = 37
          Transparent = False
          ActiveTextColor = clBlack
          OnClick = btnzxClick
          Spacing = 0
          Radius = 5
          MiddleTransparent = False
          FrameInnerColor = clBtnHighlight
          FrameOuterColor = clBtnShadow
          FrameColor = clWindowFrame
          Frame3D = False
          FrameRnd = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #20851#31665
          TabOrder = 1
          Enabled = False
          ParentFont = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object btnprint: TKBitBtn
          Left = 647
          Top = 9
          Width = 80
          Height = 37
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #35013#31665#25171#21360
          TabOrder = 2
          Enabled = False
          ParentFont = False
          Visible = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object edtlotcode: TdxEdit
          Left = 75
          Top = 10
          Width = 150
          OnExitCheck = edtlotcodeExitCheck
          TabOrder = 3
          TabStop = False
          OnExit = edtlotcodeExit
          AutoSize = False
          StyleController = frmMain.StyleStandard
          Height = 32
        end
        object ckbcheck: TdxCheckEdit
          Left = 469
          Top = 16
          Width = 52
          Style.BorderStyle = xbsNone
          TabOrder = 5
          Caption = #25187#25968
          ReadOnly = False
          StyleController = frmMain.StyleCheck
          StoredValues = 64
        end
      end
      object KGroupBox1: TKGroupBox
        Left = 0
        Top = 0
        Width = 837
        Height = 49
        Align = alTop
        TabOrder = 0
        StyleController = frmMain.StyleStandard
        object GMSStickyLabel1: TGMSStickyLabel
          Left = 10
          Top = 14
          Width = 64
          Height = 16
          Caption = #23458#25143#21333#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = edtcusbillno
          _Gap = 1
        end
        object GMSStickyLabel3: TGMSStickyLabel
          Left = 239
          Top = 14
          Width = 64
          Height = 16
          Caption = #24037#21378#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = edtorigincusname
          _Gap = 1
        end
        object edtcusbillno: TdxEdit
          Left = 75
          Top = 10
          Width = 150
          OnExitCheck = edtcusbillnoExitCheck
          TabOrder = 0
          OnExit = edtcusbillnoExit
          AutoSize = False
          StyleController = frmMain.StyleStandard
          Height = 32
        end
        object edtorigincusname: TdxEdit
          Left = 304
          Top = 10
          Width = 148
          OnExitCheck = edtcustomernoExitCheck
          Enabled = False
          TabOrder = 1
          OnExit = edtcustomernoExit
          AutoSize = False
          ReadOnly = False
          StyleController = frmMain.StyleStandard
          Height = 32
          StoredValues = 64
        end
      end
      object KGroupBox5: TKGroupBox
        Left = 0
        Top = 424
        Width = 837
        Height = 165
        Align = alBottom
        Caption = #31665#23376#20449#24687
        TabOrder = 4
        object grdlotcode: TdxDBGrid
          Tag = 10
          Left = 2
          Top = 13
          Width = 833
          Height = 150
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'lotcode'
          ShowGroupPanel = True
          ShowSummaryFooter = True
          SummaryGroups = <
            item
              DefaultGroup = True
              SummaryItems = <
                item
                  SummaryField = 'quantity'
                  SummaryDisplayField = 'quantity'
                  SummaryType = cstSum
                end>
              Name = 'grdcashskuSummaryGroup2'
            end>
          SummarySeparator = ', '
          Align = alClient
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          BandFont.Charset = DEFAULT_CHARSET
          BandFont.Color = clBlack
          BandFont.Height = -12
          BandFont.Name = #23435#20307
          BandFont.Style = []
          DataSource = dtsskuxz
          Filter.Criteria = {00000000}
          GroupPanelColor = 12615680
          GroupPanelFontColor = clWhite
          GroupNodeColor = clMoneyGreen
          HeaderColor = clSilver
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clBlack
          HeaderFont.Height = -12
          HeaderFont.Name = #23435#20307
          HeaderFont.Style = []
          IniFileName = 'LocationINOUT.ini'
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSelect, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoUseBitmap]
          PreviewFont.Charset = DEFAULT_CHARSET
          PreviewFont.Color = clBlue
          PreviewFont.Height = -12
          PreviewFont.Name = #23435#20307
          PreviewFont.Style = []
          object xzsno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 50
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sno'
            SummaryFooterType = cstCount
          end
          object xzlotcode: TdxDBGridColumn
            Alignment = taCenter
            Caption = #31665#26465#30721
            HeaderAlignment = taCenter
            Width = 141
            BandIndex = 0
            RowIndex = 0
            FieldName = 'lotcode'
            SummaryFooterType = cstCount
          end
          object xzquantity: TdxDBGridColumn
            Caption = #25968#37327
            HeaderAlignment = taCenter
            Width = 84
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantity'
          end
          object xznetweight: TdxDBGridColumn
            Caption = #20928#37325
            HeaderAlignment = taCenter
            Width = 95
            BandIndex = 0
            RowIndex = 0
            FieldName = 'netweight'
          end
          object xzgrossweight: TdxDBGridColumn
            Caption = #27611#37325
            HeaderAlignment = taCenter
            Width = 92
            BandIndex = 0
            RowIndex = 0
            FieldName = 'grossweight'
          end
          object outzonenoxz: TdxDBGridColumn
            Caption = #31665#21495
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'outzoneno'
          end
        end
      end
      object KGroupBox6: TKGroupBox
        Left = 0
        Top = 98
        Width = 837
        Height = 323
        Align = alClient
        TabOrder = 2
        object KGroupBox2: TKGroupBox
          Left = 2
          Top = 13
          Width = 451
          Height = 308
          Align = alClient
          Caption = #35746#21333#20449#24687
          TabOrder = 0
          object grdcashsku: TdxDBGrid
            Tag = 10
            Left = 2
            Top = 13
            Width = 447
            Height = 293
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'skuid'
            ShowGroupPanel = True
            ShowSummaryFooter = True
            SummaryGroups = <
              item
                DefaultGroup = True
                SummaryItems = <
                  item
                    SummaryField = 'quantity'
                    SummaryDisplayField = 'quantity'
                    SummaryType = cstSum
                  end>
                Name = 'grdcashskuSummaryGroup2'
              end>
            SummarySeparator = ', '
            Align = alClient
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -12
            BandFont.Name = #23435#20307
            BandFont.Style = []
            DataSource = dtsskudetailcashzx
            Filter.Criteria = {00000000}
            GroupPanelColor = 12615680
            GroupPanelFontColor = clWhite
            GroupNodeColor = clMoneyGreen
            HeaderColor = clSilver
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -12
            HeaderFont.Name = #23435#20307
            HeaderFont.Style = []
            HideFocusRect = True
            IniFileName = 'LocationINOUT.ini'
            OptionsBehavior = [edgoAutoSort, edgoBandButtonClicking, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
            OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks, edgoUseLocate]
            OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoHideFocusRect, edgoIndicator, edgoRowSelect]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -12
            PreviewFont.Name = #23435#20307
            PreviewFont.Style = []
            OnCustomDrawCell = grdcashskuCustomDrawCell
            object outzoneno: TdxDBGridColumn
              Caption = #31665#21495
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'outzoneno'
            end
            object lotcode: TdxDBGridColumn
              Alignment = taCenter
              Caption = #31665#26465#30721
              HeaderAlignment = taCenter
              Width = 150
              BandIndex = 0
              RowIndex = 0
              FieldName = 'lotcode'
              SummaryFooterType = cstCount
            end
            object customerno: TdxDBGridColumn
              Caption = #21830#21697#32534#30721
              HeaderAlignment = taCenter
              Width = 114
              BandIndex = 0
              RowIndex = 0
              FieldName = 'customerno'
            end
            object color: TdxDBGridColumn
              Caption = #21830#21697#39068#33394
              HeaderAlignment = taCenter
              Width = 82
              BandIndex = 0
              RowIndex = 0
              FieldName = 'color'
            end
            object colorid: TdxDBGridColumn
              Caption = #39068#33394#20195#30721
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'colorid'
            end
            object skuspec: TdxDBGridColumn
              Caption = #21830#21697#23610#30721
              HeaderAlignment = taCenter
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skuspec'
            end
            object quantity: TdxDBGridColumn
              Alignment = taCenter
              Caption = #25968#37327
              HeaderAlignment = taCenter
              Width = 55
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantity'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '0;-,0'
            end
            object quantitysm: TdxDBGridColumn
              Caption = #25195#25551#25968#37327
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantitysm'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '0;-,0'
            end
            object jobno: TdxDBGridColumn
              Alignment = taCenter
              Caption = #24037#20316#21495
              HeaderAlignment = taCenter
              Visible = False
              Width = 71
              BandIndex = 0
              RowIndex = 0
              FieldName = 'jobno'
            end
            object sno: TdxDBGridColumn
              Alignment = taCenter
              Caption = #24207#21495
              HeaderAlignment = taCenter
              Visible = False
              Width = 52
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sno'
              SummaryFooterType = cstCount
            end
            object cys: TdxDBGridColumn
              Caption = #21097#20313#25968
              HeaderAlignment = taCenter
              Width = 50
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cys'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '0;-,0'
            end
            object quantityuom: TdxDBGridColumn
              Caption = #21333#20301
              HeaderAlignment = taCenter
              Width = 48
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantityuom'
            end
            object skuname: TdxDBGridColumn
              Alignment = taCenter
              Caption = #21830#21697#21517#31216
              DisableEditor = True
              HeaderAlignment = taCenter
              Width = 129
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skuname'
            end
            object ischeck: TdxDBGridColumn
              Caption = #31665#29366#24577
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ischeck'
            end
            object skucards: TdxDBGridColumn
              Caption = #21830#21697#26465#30721
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skucards'
            end
          end
        end
        object KGroupBox4: TKGroupBox
          Left = 456
          Top = 13
          Width = 379
          Height = 308
          Align = alRight
          Caption = #25195#25551#35760#24405
          TabOrder = 2
          object grdskudetail: TdxDBGrid
            Tag = 10
            Left = 2
            Top = 13
            Width = 375
            Height = 293
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'sno'
            ShowGroupPanel = True
            ShowSummaryFooter = True
            SummaryGroups = <
              item
                DefaultGroup = True
                SummaryItems = <>
                Name = 'grdcashskuSummaryGroup2'
              end>
            SummarySeparator = ', '
            Align = alClient
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -12
            BandFont.Name = #23435#20307
            BandFont.Style = []
            DataSource = dtsskudetail
            Filter.Criteria = {00000000}
            GroupPanelColor = 12615680
            GroupPanelFontColor = clWhite
            GroupNodeColor = clMoneyGreen
            HeaderColor = clSilver
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -12
            HeaderFont.Name = #23435#20307
            HeaderFont.Style = []
            IniFileName = 'LocationINOUT.ini'
            OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSelect, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
            OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -12
            PreviewFont.Name = #23435#20307
            PreviewFont.Style = []
            object snosm1: TdxDBGridCurrencyColumn
              Alignment = taCenter
              Caption = #24207#21495
              HeaderAlignment = taCenter
              Width = 40
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sno'
              DisplayFormat = ',0;-,0'
              Nullable = False
            end
            object customernosm: TdxDBGridColumn
              Caption = #21830#21697#32534#30721
              HeaderAlignment = taCenter
              Width = 91
              BandIndex = 0
              RowIndex = 0
              FieldName = 'customerno'
              SummaryFooterType = cstCount
            end
            object colorsm: TdxDBGridColumn
              Caption = #21830#21697#39068#33394
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'color'
            end
            object skuspecsm: TdxDBGridColumn
              Caption = #21830#21697#23610#30721
              HeaderAlignment = taCenter
              Width = 57
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skuspec'
            end
            object quantitysm1: TdxDBGridColumn
              Alignment = taCenter
              Caption = #25968#37327
              HeaderAlignment = taCenter
              Width = 67
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantity'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '0;-,0'
            end
            object coloridsm: TdxDBGridColumn
              Caption = #39068#33394#20195#30721
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'colorid'
            end
            object quantityuomsm: TdxDBGridColumn
              Caption = #21333#20301
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantityuom'
            end
            object skunamesm: TdxDBGridColumn
              Alignment = taCenter
              Caption = #21830#21697#21517#31216
              DisableEditor = True
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skuname'
            end
            object skucardssm: TdxDBGridColumn
              Caption = #21830#21697#26465#30721
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'skucards'
            end
          end
        end
        object RxSplitter2: TRxSplitter
          Left = 453
          Top = 13
          Width = 3
          Height = 308
          ControlFirst = KGroupBox2
          ControlSecond = KGroupBox4
          Align = alRight
          ParentColor = True
        end
      end
      object RxSplitter3: TRxSplitter
        Left = 0
        Top = 421
        Width = 837
        Height = 3
        ControlFirst = KGroupBox5
        ControlSecond = KGroupBox6
        Align = alBottom
        ParentColor = True
      end
    end
  end
  object ppmFilter: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 413
    Top = 247
    object mitFilterActive: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = #24555#25463#36807#28388
    end
  end
  object dtsskudetailcashzx: TDataSource
    DataSet = qryskudetailcashzx
    Left = 429
    Top = 330
  end
  object qryskudetailcashzx: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    AfterPost = qryskudetailcashzxAfterPost
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 401
    Top = 330
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 491
    Top = 330
  end
  object qrytmp1: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 523
    Top = 330
  end
  object qryskuxz: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    AfterPost = qryskudetailcashzxAfterPost
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 401
    Top = 378
  end
  object dtsskuxz: TDataSource
    DataSet = qryskuxz
    Left = 429
    Top = 378
  end
  object qryskudetail: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    AfterPost = qryskudetailcashzxAfterPost
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 409
    Top = 418
  end
  object dtsskudetail: TDataSource
    DataSet = qryskudetail
    Left = 437
    Top = 402
  end
end
