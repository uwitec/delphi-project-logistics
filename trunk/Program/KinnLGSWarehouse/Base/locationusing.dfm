object frmlocationusing: Tfrmlocationusing
  Left = 352
  Top = 203
  Width = 601
  Height = 433
  Caption = #20179#24211#21033#29992#29575#26597#35810
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
    Top = 38
    Width = 593
    Height = 361
    Align = alClient
    Caption = #35814#32454#20449#24687
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object grdlocationusing: TdxDBGrid
      Left = 2
      Top = 13
      Width = 589
      Height = 346
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'locid'
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
      ShowHint = False
      TabOrder = 0
      DataSource = dtslocationusing
      Filter.Criteria = {00000000}
      GroupPanelColor = 12615680
      GroupPanelFontColor = clWhite
      GroupNodeColor = clMoneyGreen
      HideFocusRect = True
      IniFileName = 'kinnGrid.ini'
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoImmediateEditor, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoIndicator, edgoRowSelect, edgoUseBitmap]
      ShowRowFooter = True
      object locname: TdxDBGridColumn
        Caption = #20179#20301
        HeaderAlignment = taCenter
        Width = 91
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locname'
      end
      object usingarea: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #20351#29992#38754#31215
        HeaderAlignment = taCenter
        Width = 106
        BandIndex = 0
        RowIndex = 0
        FieldName = 'usingarea'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object area: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #24635#38754#31215
        HeaderAlignment = taCenter
        Width = 131
        BandIndex = 0
        RowIndex = 0
        FieldName = 'area'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object usrate: TdxDBGridColumn
        Caption = #21033#29992#29575
        HeaderAlignment = taCenter
        Width = 125
        BandIndex = 0
        RowIndex = 0
        FieldName = 'usrate'
      end
    end
  end
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 0
    Width = 593
    Height = 38
    Align = alTop
    TabOrder = 1
    BorderPack = True
    object GMSStickyLabel3: TGMSStickyLabel
      Left = 14
      Top = 11
      Width = 36
      Height = 13
      Caption = #20179'    '#20301
      _AttachTo = cmblocID
      _Gap = 1
    end
    object cmblocID: TdxButtonEdit
      Left = 51
      Top = 7
      Width = 98
      AllowDblClk = True
      DirectInput = False
      CanDeleteText = True
      TabOrder = 0
      OnExit = cmblocIDExit
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = cmblocIDButtonClick
      ExistButtons = True
    end
    object radBBtype: TKRadioGroup
      Left = 206
      Top = 8
      Width = 235
      Height = 23
      Columns = 5
      ItemIndex = 2
      Items.Strings = (
        #19968#32423
        #20108#32423
        #19977#32423
        #22235#32423
        #20116#32423)
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
    object btnRefresh: TKBitBtn
      Left = 468
      Top = 5
      Width = 75
      Height = 25
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777778087777777777780087777777777770087777
        7777777780877777777777770077777777777777007770000077777700877780
        0077777780087800007777777000000080777777778000877077777777777777
        7777777777777777777777777777777777777777777777777777}
      OnClick = btnRefreshClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = True
      FrameRnd = False
      Caption = #21047#26032'(&R)'
      TabOrder = 2
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
  object qrylocationusing: TKADOQuery
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
  object dtslocationusing: TDataSource
    DataSet = qrylocationusing
    Left = 164
    Top = 224
  end
  object ppmprint: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 743
    Top = 72
    object N1: TMenuItem
      Caption = #25171#21360#25152#26377#36164#26009
    end
  end
end
