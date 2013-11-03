object frmCqgzcx: TfrmCqgzcx
  Left = 233
  Top = 157
  Width = 791
  Height = 515
  Caption = #33337#26399#36319#36394#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 57
    Width = 783
    Height = 424
    Align = alClient
    Caption = #35814#32454#20449#24687
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    StyleController = frmMain.StyleStandard
    object grdCqgzcx: TdxDBGrid
      Left = 2
      Top = 13
      Width = 779
      Height = 409
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'jobno'
      ShowGroupPanel = True
      ShowSummaryFooter = True
      SummaryGroups = <
        item
          DefaultGroup = True
          SummaryItems = <
            item
              SummaryField = 'piece'
              SummaryDisplayField = 'piece'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end
            item
              SummaryField = 'quantity'
              SummaryDisplayField = 'quantity'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end
            item
              SummaryField = 'volume'
              SummaryDisplayField = 'volume'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end
            item
              SummaryField = 'Area'
              SummaryDisplayField = 'Area'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end
            item
              SummaryField = 'NetWeight'
              SummaryDisplayField = 'NetWeight'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end
            item
              SummaryField = 'GrossWeight'
              SummaryDisplayField = 'GrossWeight'
              SummaryFormat = ',0.####'
              SummaryType = cstSum
            end>
          Name = 'grdWareInventorySummaryGroup2'
        end>
      SummarySeparator = ', '
      Align = alClient
      Color = clInfoBk
      ParentShowHint = False
      PopupMenu = ppmedit
      ShowHint = False
      TabOrder = 0
      DataSource = dtsCqgzcx
      Filter.Criteria = {00000000}
      GroupPanelColor = 12615680
      GroupPanelFontColor = clWhite
      GroupNodeColor = clMoneyGreen
      HideFocusRect = True
      IniFileName = 'kinnGrid.ini'
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoImmediateEditor, edgoMultiSelect, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoIndicator, edgoRowSelect, edgoUseBitmap]
      ShowRowFooter = True
      object createdate: TdxDBGridColumn
        Alignment = taCenter
        Caption = #23548#20837#26085#26399
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'createdate'
      end
      object carrino: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #33337#21517#33322#27425
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'carrino'
      end
      object YDH: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #36816#21333#21495
        HeaderAlignment = taCenter
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'YDH'
      end
      object conno: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #38598#35013#31665#21495
        HeaderAlignment = taCenter
        Width = 91
        BandIndex = 0
        RowIndex = 0
        FieldName = 'conno'
      end
      object fh: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #23553#21495
        HeaderAlignment = taCenter
        Width = 72
        BandIndex = 0
        RowIndex = 0
        FieldName = 'fh'
      end
      object spec: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #23610#23544
        HeaderAlignment = taCenter
        Width = 66
        BandIndex = 0
        RowIndex = 0
        FieldName = 'spec'
      end
      object grdshr: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #25910#36135#20154
        HeaderAlignment = taCenter
        Width = 79
        BandIndex = 0
        RowIndex = 0
        FieldName = 'shr'
      end
      object md: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #38376#28857
        HeaderAlignment = taCenter
        Width = 72
        BandIndex = 0
        RowIndex = 0
        FieldName = 'md'
      end
      object lxr: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #32852#31995#20154
        HeaderAlignment = taCenter
        Width = 76
        BandIndex = 0
        RowIndex = 0
        FieldName = 'lxr'
      end
      object dh: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #30005#35805
        HeaderAlignment = taCenter
        Width = 86
        BandIndex = 0
        RowIndex = 0
        FieldName = 'dh'
      end
      object jobno: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #24037#20316#21495
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'jobno'
      end
    end
  end
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 0
    Width = 783
    Height = 57
    Align = alTop
    TabOrder = 0
    BorderPack = True
    object GMSStickyLabel4: TGMSStickyLabel
      Left = 12
      Top = 26
      Width = 48
      Height = 13
      Caption = #33337#21517#33322#27425
      _AttachTo = edtcarrino
      _Gap = 1
    end
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 200
      Top = 26
      Width = 36
      Height = 13
      Caption = #36816#21333#21495
      _AttachTo = edtydh
      _Gap = 1
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 388
      Top = 26
      Width = 48
      Height = 13
      Caption = #38598#35013#31665#21495
      _AttachTo = edtconno
      _Gap = 1
    end
    object btnRefresh: TKBitBtn
      Left = 603
      Top = 19
      Width = 75
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnRefreshClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #21047#26032
      TabOrder = 0
      StyleController = frmMain.StyleStandard
    end
    object edtcarrino: TdxEdit
      Left = 61
      Top = 22
      Width = 120
      TabOrder = 2
      StyleController = frmMain.StyleStandard
    end
    object edtydh: TdxEdit
      Left = 237
      Top = 22
      Width = 120
      TabOrder = 3
      StyleController = frmMain.StyleStandard
    end
    object edtconno: TdxEdit
      Left = 437
      Top = 22
      Width = 120
      TabOrder = 4
      StyleController = frmMain.StyleStandard
    end
    object btnprint: TKBitBtn
      Left = 699
      Top = 19
      Width = 75
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnprintClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #25171#21360
      TabOrder = 1
      Enabled = False
      StyleController = frmMain.StyleStandard
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 207
    Top = 225
  end
  object qryCqgzcx: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    SQL.Strings = (
      'select * from P_Logins')
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 135
    Top = 224
  end
  object dtsCqgzcx: TDataSource
    DataSet = qryCqgzcx
    Left = 164
    Top = 224
  end
  object ppmedit: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 615
    Top = 224
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
    object mitdy: TMenuItem
      Caption = #25171#21360
      OnClick = mitdyClick
    end
  end
end
