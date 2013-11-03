object frmoutinselect: Tfrmoutinselect
  Left = 237
  Top = 157
  AutoScroll = False
  BiDiMode = bdLeftToRight
  Caption = #20986#24211#24211#40836
  ClientHeight = 427
  ClientWidth = 705
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
    Top = 41
    Width = 705
    Height = 386
    Align = alClient
    TabOrder = 1
    StyleController = frmMain.StyleStandard
    object grdoutinselect: TdxDBGrid
      Tag = 10
      Left = 2
      Top = 13
      Width = 701
      Height = 371
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'keyid'
      ShowGroupPanel = True
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
      PopupMenu = ppmoutin
      ShowHint = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -12
      BandFont.Name = #23435#20307
      BandFont.Style = []
      DataSource = dtsoutin
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
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoEnterThrough, edgoImmediateEditor, edgoMultiSort, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandPanelSizing, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCanAppend, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoDrawEndEllipsis, edgoIndicator, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -12
      PreviewFont.Name = #23435#20307
      PreviewFont.Style = []
      OnCustomDrawCell = grdoutinselectCustomDrawCell
      object locationbillno: TdxDBGridColumn
        Caption = #20986#20179#21333#21495
        HeaderAlignment = taCenter
        Width = 114
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locationbillno'
      end
      object skuname: TdxDBGridColumn
        Caption = #21830#21697#21517#31216
        HeaderAlignment = taCenter
        Width = 99
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuname'
      end
      object skumodel: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#22411#21495
        HeaderAlignment = taCenter
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skumodel'
      end
      object skuspec: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#35268#26684
        HeaderAlignment = taCenter
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuspec'
      end
      object piece: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20986#20179#20214#25968
        HeaderAlignment = taCenter
        Width = 73
        BandIndex = 0
        RowIndex = 0
        FieldName = 'piece'
      end
      object grossweight: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20986#20179#37325#37327
        HeaderAlignment = taCenter
        Width = 78
        BandIndex = 0
        RowIndex = 0
        FieldName = 'grossweight'
      end
      object costin: TdxDBGridColumn
        Caption = #35013#21368#36153
        HeaderAlignment = taCenter
        Width = 60
        BandIndex = 0
        RowIndex = 0
        FieldName = 'costin'
      end
      object operationdate: TdxDBGridColumn
        Caption = #20986#20179#26085#26399
        HeaderAlignment = taCenter
        Width = 95
        BandIndex = 0
        RowIndex = 0
        FieldName = 'operationdate'
      end
      object operationdatein: TdxDBGridColumn
        Caption = #36827#20179#26085#26399
        HeaderAlignment = taCenter
        Width = 87
        BandIndex = 0
        RowIndex = 0
        FieldName = 'operationdatein'
      end
      object keyid: TdxDBGridColumn
        Visible = False
        Width = 43
        BandIndex = 0
        RowIndex = 0
        FieldName = 'keyid'
      end
      object inoutdays: TdxDBGridColumn
        Caption = #24211#40836
        HeaderAlignment = taCenter
        Width = 60
        BandIndex = 0
        RowIndex = 0
        FieldName = 'inoutdays'
      end
      object bz: TdxDBGridColumn
        Caption = #26631#24535
        HeaderAlignment = taCenter
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'bz'
      end
    end
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 0
    Width = 705
    Height = 41
    Align = alTop
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object GMSStickyLabel8: TGMSStickyLabel
      Left = 9
      Top = 17
      Width = 60
      Height = 12
      Caption = #36153#29992#20851#31995#20154
      _AttachTo = edtCostCus
      _Gap = 1
    end
    object GMSStickyLabel15: TGMSStickyLabel
      Left = 354
      Top = 17
      Width = 54
      Height = 12
      Caption = '*'#32467#26463#26085#26399
      _AttachTo = dtdReceDateT
      _Gap = 1
    end
    object GMSStickyLabel10: TGMSStickyLabel
      Left = 181
      Top = 17
      Width = 54
      Height = 12
      Caption = '*'#24320#22987#26085#26399
      _AttachTo = dtdReceDateF
      _Gap = 1
    end
    object btnselect: TKBitBtn
      Left = 536
      Top = 13
      Width = 75
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnselectClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clWindowFrame
      Frame3D = False
      FrameRnd = False
      Caption = #26597#35810
      TabOrder = 3
      StyleController = frmMain.StyleStandard
    end
    object btnprint: TKBitBtn
      Left = 622
      Top = 13
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
      TabOrder = 4
      StyleController = frmMain.StyleStandard
    end
    object edtCostCus: TdxButtonEdit
      Left = 70
      Top = 13
      Width = 110
      AllowDblClk = True
      DirectInput = False
      CanDeleteText = True
      TabOrder = 0
      OnExit = edtCostCusExit
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtCostCusButtonClick
      ExistButtons = True
    end
    object dtdReceDateT: TdxDateEdit
      Left = 409
      Top = 13
      Width = 110
      TabOrder = 2
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object dtdReceDateF: TdxDateEdit
      Left = 236
      Top = 13
      Width = 110
      TabOrder = 1
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
  end
  object dtsoutin: TDataSource
    DataSet = qryoutin
    Left = 318
    Top = 164
  end
  object qryoutin: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 290
    Top = 164
  end
  object ppmoutin: TPopupMenu
    Tag = 10
    Left = 202
    Top = 176
    object mitDelLocOld: TMenuItem
      Tag = 11
      Caption = #35013#21368#36153#29992
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
end
