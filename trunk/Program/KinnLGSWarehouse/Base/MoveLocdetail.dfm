object frmMoveLocdetail: TfrmMoveLocdetail
  Left = 160
  Top = 119
  BorderStyle = bsSingle
  Caption = #21306#22495#35843#25320
  ClientHeight = 514
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object ToolPanel: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    Visible = False
    object Bevel1: TBevel
      Left = 694
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object btnClose: TKBitBtn
      Tag = 1
      Left = 698
      Top = 0
      Width = 29
      Height = 28
      Hint = #36864#20986'(Esc)'
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000808000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000808000808000000000FFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
        808000808000808000000000000000000000000000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0000000808000808000808000000000FF0000FF
        0000FF0000000000000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000
        808000000000000000000000FF0000FF0000000000000000FFFFFFFFFFFF0000
        00808080808080808080C0C0C0000000808000000000808000000000FF0000FF
        0000000000FFFFFFFFFFFFFFFFFF000000000000000000000000C0C0C0000000
        808000808000808000000000FF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0000000808000808000808000000000FF000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        808000808000808000000000FF0000FF0000000000FFFFFFFFFFFFFFFFFF0000
        00000000000000000000C0C0C0000000808000808000808000000000FF0000FF
        0000FF0000000000FFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0000000
        808000808000000000000000FF0000FF0000FF00000000000000000000000000
        00C0C0C0C0C0C0C0C0C0C0C0C0000000808000000000000000FF0000FF0000FF
        0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
        000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      Align = alRight
      Layout = blGlyphTop
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      Frame = False
      FrameColor = clBlack
      Frame3D = True
      FrameRnd = False
      Caption = #36864#20986
      TabOrder = 1
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnPrint: TKBitBtn
      Tag = 1
      Left = 665
      Top = 0
      Width = 29
      Height = 28
      Hint = #25171#21360'(O)'
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
      Align = alRight
      Layout = blGlyphTop
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      Frame = False
      FrameColor = clBlack
      Frame3D = True
      FrameRnd = False
      Caption = #25171#21360
      TabOrder = 0
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
  end
  object pgcMain: TdxPageControl
    Left = 0
    Top = 28
    Width = 727
    Height = 486
    ActivePage = tbsEdit
    Align = alClient
    HideButtons = False
    HotTrack = False
    MultiLine = True
    OwnerDraw = True
    RaggedRight = False
    ScrollOpposite = False
    TabHeight = 0
    TabOrder = 1
    TabPosition = dxtpTop
    TabStop = True
    TabWidth = 0
    object tbsEdit: TdxTabSheet
      Caption = #32534#36753
      TabVisible = False
      object KGroupBox2: TKGroupBox
        Left = 0
        Top = 46
        Width = 727
        Height = 412
        Align = alClient
        TabOrder = 1
        object grdMovelocskudetail: TdxDBGrid
          Tag = 10
          Left = 2
          Top = 13
          Width = 723
          Height = 397
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'keyid'
          ShowGroupPanel = True
          ShowSummaryFooter = True
          SummaryGroups = <>
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
          OnKeyDown = grdMovelocskudetailKeyDown
          BandFont.Charset = DEFAULT_CHARSET
          BandFont.Color = clBlack
          BandFont.Height = -12
          BandFont.Name = #23435#20307
          BandFont.Style = []
          DataSource = dtslocdetail
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
          OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoUseBitmap]
          PreviewFont.Charset = DEFAULT_CHARSET
          PreviewFont.Color = clBlue
          PreviewFont.Height = -12
          PreviewFont.Name = #23435#20307
          PreviewFont.Style = []
          OnEditing = grdMovelocskudetailEditing
          object keyid: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'keyid'
          end
          object snoin: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'snoin'
          end
          object ldsnoin: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 92
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ldsnoin'
          end
          object jobnoin: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24037#20316#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 83
            BandIndex = 0
            RowIndex = 0
            FieldName = 'jobnoin'
          end
          object detailsnoin: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 140
            BandIndex = 0
            RowIndex = 0
            FieldName = 'detailsnoin'
          end
          object skuid: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuid'
          end
          object skuname: TdxDBGridColumn
            Alignment = taCenter
            Caption = #21697#21517
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuname'
          end
          object serialno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #21830#21697#32534#30721
            HeaderAlignment = taCenter
            Width = 108
            BandIndex = 0
            RowIndex = 0
            FieldName = 'serialno'
          end
          object color: TdxDBGridColumn
            Caption = #39068#33394
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'color'
          end
          object skuspec: TdxDBGridColumn
            Caption = ' '#23610#30721
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuspec'
          end
          object skubrand: TdxDBGridColumn
            Alignment = taCenter
            Caption = #21407#21306#22495
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skubrand'
          end
          object quantity: TdxDBGridColumn
            Alignment = taCenter
            Caption = #25968#37327
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantity'
          end
          object newskubrand1: TdxDBGridColumn
            Caption = #35843#25320#21306#22495
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'newskubrand'
          end
          object jobno: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'jobno'
          end
          object quantitynew: TdxDBGridCurrencyColumn
            Alignment = taLeftJustify
            Caption = #35843#25320#25968#37327
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            OnValidate = quantitynewValidate
            FieldName = 'quantitynew'
            DisplayFormat = '0.####;-,0.####'
            Nullable = False
          end
        end
      end
      object RxSplitter1: TRxSplitter
        Left = 0
        Top = 458
        Width = 727
        Height = 2
        Align = alBottom
      end
      object KGroupBox4: TKGroupBox
        Left = 0
        Top = 460
        Width = 727
        Height = 26
        Align = alBottom
        TabOrder = 3
        StyleController = frmMain.StyleStandard
        BorderPack = True
        object GMSStickyLabel1: TGMSStickyLabel
          Left = 10
          Top = 7
          Width = 36
          Height = 12
          Caption = #21019#24314#20154
          _AttachTo = edtCreateName
          _Gap = 1
        end
        object GMSStickyLabel2: TGMSStickyLabel
          Left = 141
          Top = 7
          Width = 48
          Height = 12
          Caption = #21019#24314#26085#26399
          _AttachTo = dtdcreatedate
        end
        object GMSStickyLabel4: TGMSStickyLabel
          Left = 280
          Top = 7
          Width = 36
          Height = 12
          Caption = #23457#26680#20154
          _AttachTo = edtcheckname
          _Gap = 1
        end
        object GMSStickyLabel5: TGMSStickyLabel
          Left = 414
          Top = 7
          Width = 48
          Height = 12
          Caption = #23457#26680#26085#26399
          _AttachTo = dtdcheckdate
        end
        object GMSStickyLabel7: TGMSStickyLabel
          Left = 554
          Top = 7
          Width = 36
          Height = 12
          Caption = #24037#20316#21495
          _AttachTo = edtjobno
          _Gap = 1
        end
        object edtCreateName: TdxDBEdit
          Tag = 10
          Left = 47
          Top = 3
          Width = 85
          TabOrder = 0
          DataField = 'CreateName'
          ReadOnly = True
          StyleController = frmMain.StyleStandard
          StoredValues = 64
        end
        object dtdcreatedate: TdxDBDateEdit
          Tag = 10
          Left = 191
          Top = 3
          Width = 81
          AutoLeave = True
          AllowDblClk = True
          ClickSpace = True
          TabOrder = 1
          DataField = 'createdate'
          StyleController = frmMain.StyleStandard
          StoredValues = 4
        end
        object edtcheckname: TdxDBEdit
          Tag = 10
          Left = 317
          Top = 3
          Width = 86
          TabOrder = 2
          DataField = 'checkname'
          ReadOnly = True
          StyleController = frmMain.StyleStandard
          StoredValues = 64
        end
        object dtdcheckdate: TdxDBDateEdit
          Tag = 10
          Left = 464
          Top = 3
          Width = 81
          AutoLeave = True
          AllowDblClk = True
          ClickSpace = True
          TabOrder = 3
          DataField = 'checkdate'
          StyleController = frmMain.StyleStandard
          StoredValues = 4
        end
        object edtjobno: TdxDBEdit
          Tag = 10
          Left = 591
          Top = 3
          Width = 144
          TabOrder = 4
          DataField = 'jobno'
          ReadOnly = True
          StyleController = frmMain.StyleStandard
          StoredValues = 64
        end
      end
      object KGroupBox5: TKGroupBox
        Left = 0
        Top = 0
        Width = 727
        Height = 46
        Align = alTop
        TabOrder = 0
        StyleController = frmMain.StyleStandard
        object lblfind: TGMSStickyLabel
          Left = 19
          Top = 20
          Width = 48
          Height = 12
          Caption = #26597#35810#26465#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          _AttachTo = cmbchoice
          _Gap = 1
        end
        object edtlocname: TdxButtonEdit
          Left = 221
          Top = 16
          Width = 130
          OnExitCheck = edtlocnameExitCheck
          AllowDblClk = True
          CanDeleteText = True
          TabOrder = 7
          OnExit = edtlocnameExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = edtlocnameButtonClick
          ExistButtons = True
        end
        object cmbShipAccID: TdxButtonEdit
          Left = 221
          Top = 16
          Width = 130
          OnExitCheck = cmbShipAccIDExitCheck
          AllowDblClk = True
          CanDeleteText = True
          TabOrder = 4
          OnExit = cmbShipAccIDExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = cmbShipAccIDButtonClick
          ExistButtons = True
        end
        object cmbchoice: TKinPickEdit
          Left = 68
          Top = 16
          Width = 131
          AllowDblClk = True
          TabOrder = 3
          OnExit = cmbchoiceExit
          ReadOnly = False
          StyleController = frmMain.StyleStandard
          OnChange = cmbchoiceChange
          DropDownListStyle = True
          Items.Strings = (
            #20179' '#21333' '#21495
            #21830#21697#32534#30721
            #20179'    '#20301
            #36135'    '#20027)
          ItemFields.Strings = (
            #20179' '#21333' '#21495
            #21830#21697#32534#30721
            #20179'    '#20301
            #36135'    '#20027)
          StoredValues = 64
        end
        object edtlocationbillno: TdxEdit
          Left = 221
          Top = 16
          Width = 130
          TabOrder = 5
          StyleController = frmMain.StyleStandard
        end
        object btnQuery: TKBitBtn
          Left = 407
          Top = 15
          Width = 91
          Height = 22
          Transparent = False
          ActiveTextColor = clBlack
          OnClick = btnQueryClick
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
        object btnOK: TKBitBtn
          Left = 519
          Top = 15
          Width = 91
          Height = 22
          Transparent = False
          ActiveTextColor = clBlack
          OnClick = btnOKClick
          Spacing = 0
          Radius = 5
          MiddleTransparent = False
          FrameInnerColor = clBtnHighlight
          FrameOuterColor = clBtnShadow
          FrameColor = clWindowFrame
          Frame3D = False
          FrameRnd = False
          Caption = #30830#23450
          TabOrder = 1
          StyleController = frmMain.StyleStandard
        end
        object btncancell: TKBitBtn
          Left = 623
          Top = 15
          Width = 91
          Height = 22
          Transparent = False
          ActiveTextColor = clBlack
          OnClick = btncancellClick
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
        object edtcustomerno: TdxEdit
          Left = 221
          Top = 16
          Width = 130
          TabOrder = 6
          StyleController = frmMain.StyleStandard
        end
      end
    end
  end
  object ppmFilter: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 413
    Top = 248
    object mitFilterActive: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = #24555#25463#36807#28388
    end
  end
  object popMoveLocdetail: TPopupMenu
    Tag = 10
    Left = 338
    Top = 264
    object mitAddLocOld: TMenuItem
      Tag = 11
      Caption = #22686#21152
    end
    object mitDelLocOld: TMenuItem
      Tag = 11
      Caption = #21024#38500
    end
  end
  object qrylocdetail: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 491
    Top = 330
  end
  object dtslocdetail: TDataSource
    DataSet = qrylocdetail
    Left = 440
    Top = 328
  end
  object qrytmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 571
    Top = 290
  end
end
