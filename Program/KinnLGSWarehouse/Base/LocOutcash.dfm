object frmLocOutcash: TfrmLocOutcash
  Left = 127
  Top = 174
  BorderStyle = bsSingle
  Caption = #20837#24211#26657#39564
  ClientHeight = 467
  ClientWidth = 727
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
    Width = 727
    Height = 467
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
      object KGroupBox2: TKGroupBox
        Left = 0
        Top = 49
        Width = 727
        Height = 416
        Align = alClient
        TabOrder = 1
        object grdcashsku: TdxDBGrid
          Tag = 10
          Left = 2
          Top = 13
          Width = 723
          Height = 401
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'bs'
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
          PopupMenu = ppmgrdsku
          ShowHint = False
          TabOrder = 0
          BandFont.Charset = DEFAULT_CHARSET
          BandFont.Color = clBlack
          BandFont.Height = -12
          BandFont.Name = #23435#20307
          BandFont.Style = []
          DataSource = dtsskudetailcash
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
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoUseBitmap]
          PreviewFont.Charset = DEFAULT_CHARSET
          PreviewFont.Color = clBlue
          PreviewFont.Height = -12
          PreviewFont.Name = #23435#20307
          PreviewFont.Style = []
          OnEditing = grdcashskuEditing
          object customerno: TdxDBGridColumn
            Caption = #21830#21697#32534#30721
            HeaderAlignment = taCenter
            Width = 114
            BandIndex = 0
            RowIndex = 0
            FieldName = 'customerno'
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
          object color: TdxDBGridColumn
            Caption = #21830#21697#39068#33394
            HeaderAlignment = taCenter
            Width = 99
            BandIndex = 0
            RowIndex = 0
            FieldName = 'color'
          end
          object skuspec: TdxDBGridColumn
            Caption = #21830#21697#23610#30721
            HeaderAlignment = taCenter
            Width = 98
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuspec'
          end
          object quantityuom: TdxDBGridColumn
            Caption = #21333#20301
            HeaderAlignment = taCenter
            Width = 72
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantityuom'
          end
          object quantity: TdxDBGridColumn
            Alignment = taCenter
            Caption = #25968#37327
            HeaderAlignment = taCenter
            Width = 84
            BandIndex = 0
            RowIndex = 0
            OnValidate = quantityValidate
            FieldName = 'quantity'
            SummaryFooterType = cstSum
          end
          object jobno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24037#20316#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 74
            BandIndex = 0
            RowIndex = 0
            FieldName = 'jobno'
          end
          object sno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 54
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sno'
            SummaryFooterType = cstCount
          end
          object conno: TdxDBGridColumn
            Caption = #31665#21495
            HeaderAlignment = taCenter
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'conno'
          end
        end
      end
      object RxSplitter1: TRxSplitter
        Left = 0
        Top = 465
        Width = 727
        Height = 2
        ControlFirst = KGroupBox2
        Align = alBottom
      end
      object KGroupBox3: TKGroupBox
        Left = 0
        Top = 0
        Width = 727
        Height = 49
        Align = alTop
        TabOrder = 0
        StyleController = frmMain.StyleStandard
        object GMSStickyLabel5: TGMSStickyLabel
          Left = 6
          Top = 14
          Width = 84
          Height = 21
          Caption = #21830#21697#32534#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = edtcustomerno
          _Gap = 1
        end
        object edtcustomerno: TdxEdit
          Left = 91
          Top = 10
          Width = 169
          OnExitCheck = edtcustomernoExitCheck
          TabOrder = 3
          OnExit = edtcustomernoExit
          AutoSize = False
          StyleController = frmMain.StyleStandard
          Height = 32
        end
        object btncash: TKBitBtn
          Left = 636
          Top = 8
          Width = 87
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
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #26657#39564#30830#35748
          TabOrder = 0
          ParentFont = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object btnzx: TKBitBtn
          Left = 480
          Top = 9
          Width = 70
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
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #35013#31665
          TabOrder = 1
          ParentFont = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object btnprint: TKBitBtn
          Left = 551
          Top = 9
          Width = 83
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
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Caption = #35013#31665#25171#21360
          TabOrder = 2
          Enabled = False
          ParentFont = False
          ClickKey = 0
          StyleController = frmMain.StyleStandard
        end
        object ckbcheck: TdxCheckEdit
          Left = 261
          Top = 16
          Width = 92
          Style.BorderStyle = xbsNone
          TabOrder = 4
          Caption = #21644#35746#21333#27604#23545
          ReadOnly = False
          StyleController = frmMain.StyleCheck
          StoredValues = 64
        end
        object cmblocID: TdxButtonEdit
          Left = 352
          Top = 18
          Width = 121
          AllowDblClk = True
          DirectInput = False
          CanDeleteText = True
          TabOrder = 5
          OnExit = cmblocIDExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = cmblocIDButtonClick
          ExistButtons = True
        end
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
  object dtsskudetailcash: TDataSource
    DataSet = qryskudetailcash
    Left = 429
    Top = 330
  end
  object qryskudetailcash: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    AfterPost = qryskudetailcashAfterPost
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
  object ppmgrdsku: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 381
    Top = 215
    object middel: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = #21024#38500
      OnClick = middelClick
    end
  end
end
