object frmDisrepair: TfrmDisrepair
  Left = 27
  Top = 102
  Width = 794
  Height = 493
  Caption = #30772#25439#26597#35810
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
    Top = 99
    Width = 778
    Height = 358
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
    object grdDisrepair: TdxDBGrid
      Left = 2
      Top = 13
      Width = 774
      Height = 343
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
      ShowHint = False
      TabOrder = 0
      DataSource = dtsDisrepair
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
      object costcusname: TdxDBGridColumn
        Caption = #36153#29992#20851#31995#20154
        HeaderAlignment = taCenter
        Width = 83
        BandIndex = 0
        RowIndex = 0
        FieldName = 'costcusname'
      end
      object cusname: TdxDBGridColumn
        Caption = #23492#20179#21333#20301
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cusname'
        SummaryFooterType = cstCount
        SummaryFooterFormat = #24635#31508#25968':0'
      end
      object locationbillno: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20179#21333#21495
        HeaderAlignment = taCenter
        Width = 59
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locationbillno'
      end
      object skuname: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#21517#31216
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuname'
      end
      object customerno: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#32534#30721
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'customerno'
      end
      object skumodel: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#22411#21495
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skumodel'
      end
      object skuspec: TdxDBGridColumn
        Alignment = taCenter
        Caption = #21830#21697#35268#26684
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'skuspec'
      end
      object LotCode: TdxDBGridColumn
        Alignment = taCenter
        Caption = #25209#27425
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'LotCode'
      end
      object QualityName: TdxDBGridColumn
        Caption = #21697#36136
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'QualityName'
      end
      object shippercusname: TdxDBGridColumn
        Alignment = taCenter
        Caption = #36135#20027
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'shippercusname'
      end
      object operationdate: TdxDBGridColumn
        Caption = #36827#20179#26085#26399
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'operationdate'
      end
      object locname: TdxDBGridColumn
        Caption = #20179#20301
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'locname'
      end
      object ProPiece: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20214#20196#25968
        HeaderAlignment = taCenter
        Width = 53
        BandIndex = 0
        RowIndex = 0
        FieldName = 'PiecePro'
      end
      object cusbillno: TdxDBGridColumn
        Alignment = taCenter
        Caption = #35746#21333#21495
        HeaderAlignment = taCenter
        Width = 59
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cusbillno'
      end
      object quantity: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #25968#37327
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantity'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object quantityuom: TdxDBGridColumn
        Alignment = taCenter
        Caption = #25968#37327#21333#20301
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantityuom'
      end
      object piece: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = #20214#25968
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'piece'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object pieceuom: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20214#25968#21333#20301
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'pieceuom'
      end
      object volume: TdxDBGridColumn
        Caption = #20307#31215
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'volume'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object volumeuom: TdxDBGridColumn
        Alignment = taCenter
        Caption = #20307#31215#21333#20301
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'volumeuom'
      end
      object netweight: TdxDBGridColumn
        Caption = #20928#37325
        HeaderAlignment = taCenter
        Width = 47
        BandIndex = 0
        RowIndex = 0
        FieldName = 'netweight'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object netweightuom: TdxDBGridColumn
        Alignment = taCenter
        Caption = #37325#37327#21333#20301
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'weightuom'
      end
      object quantitysl: TdxDBGridColumn
        Caption = #30772#25439#25968#37327
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'quantitysl'
        SummaryFooterType = cstSum
        SummaryFooterFormat = '0.####;-,0.####'
      end
      object Remark: TdxDBGridColumn
        Alignment = taCenter
        Caption = #30772#25439#31243#24230
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Remark'
      end
      object brokenmark: TdxDBGridColumn
        Alignment = taCenter
        Caption = #30772#25439#24773#20917
        HeaderAlignment = taCenter
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'brokenmark'
      end
    end
  end
  object ToolPanel: TPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Bevel2: TBevel
      Left = 681
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object btnClose: TKBitBtn
      Tag = 1
      Left = 749
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
      OnClick = btnCloseClick
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
      TabOrder = 5
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnFirst: TDBBitBtnK
      Tag = 1
      Left = 565
      Top = 0
      Width = 29
      Height = 28
      Hint = #39318#24352'(T)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4FFFFFF808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C08080800000000000000000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C8D0D4C8
        D0D4C8D0D4FFFFFF808080808080808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C08080800000000000000000000000000000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C8D0D4FF
        FFFF808080808080808080808080808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C00000008080808080800000000000000000000000000000000000000000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D480808080
        8080808080808080808080808080808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C08080800000000000000000000000000000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C8D0D4C8
        D0D4808080808080808080808080808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C08080800000000000000000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4808080808080808080FFFFFFC8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000
        00C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4808080C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
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
      Caption = #39318#24352
      TabOrder = 0
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
      DBOperator = dboFirst
    end
    object btnPrior: TDBBitBtnK
      Tag = 1
      Left = 594
      Top = 0
      Width = 29
      Height = 28
      Hint = #21069#24352'(P)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888F88888888888887088888888888888F7F888888888887000
        888888888888F777F8888888887000008888888888F77777F888888870000000
        8888888887777777F8888888887000008888888888877777F888888888887000
        8888888888888777F88888888888887088888888888888878888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888}
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
      Caption = #21069#24352
      TabOrder = 1
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
      DBOperator = dboPrior
    end
    object btnNext: TDBBitBtnK
      Tag = 1
      Left = 623
      Top = 0
      Width = 29
      Height = 28
      Hint = #21518#24352'(N)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFC8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFFFF
        FFFFFFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000000000000000808080C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
        8080FFFFFFFFFFFFFFFFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000000000000000000000000000808080C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
        8080808080808080FFFFFFFFFFFFFFFFFFC8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000008080
        80C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
        8080808080808080808080808080C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000000000000000000000000000808080C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
        8080808080808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000000000000000808080C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808080808080
        8080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
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
      Caption = #21518#24352
      TabOrder = 2
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
      DBOperator = dboNext
    end
    object btnLast: TDBBitBtnK
      Tag = 1
      Left = 652
      Top = 0
      Width = 29
      Height = 28
      Hint = #26411#24352'(B)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFC8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFFFFFFFFFF
        FFFFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000000000000000808080C0C0C0C0C0C0C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4808080808080808080FF
        FFFFFFFFFFFFFFFFC8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000000000000000000000000000808080C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D480808080808080808080
        8080808080FFFFFFFFFFFFFFFFFFC8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C00000000000000000000000000000000000000000008080808080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D480808080808080808080
        8080808080808080808080C8D0D4C8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000000000000000000000000000808080C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D480808080808080808080
        8080808080C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000000000000000808080C0C0C0C0C0C0C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4808080808080808080C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080FFFFFFC8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0000000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
        80000000C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
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
      Caption = #26411#24352
      TabOrder = 3
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
      DBOperator = dboLast
    end
    object btnRefresh: TKBitBtn
      Tag = 1
      Left = 685
      Top = 0
      Width = 29
      Height = 28
      Hint = #21047#26032'(U)'
      Transparent = False
      ActiveTextColor = clBlack
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888887078888888888870078888888888880078888
        8888888870788888888888880088888888888888008880000088888800788870
        0088888870078700008888888000000070888888887000788088888888888888
        8888888888888888888888888888888888888888888888888888}
      OnClick = btnRefreshClick
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
      ParentCtl3d = False
      Ctl3d = True
      Caption = #21047#26032
      TabOrder = 4
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnPrint: TKBitBtn
      Tag = 1
      Left = 714
      Top = 0
      Width = 35
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
      TabOrder = 6
      ParentShowHint = False
      PopupMenu = ppmprint
      ShowHint = True
      PopupMenuMark = True
      AutoWidth = True
      ClickPopup = True
    end
  end
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 28
    Width = 778
    Height = 71
    Align = alTop
    TabOrder = 2
    BorderPack = True
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 404
      Top = 8
      Width = 48
      Height = 13
      Caption = #21830'        '#21697
      _AttachTo = cmbSKUName
      _Gap = 1
    end
    object GMSStickyLabel5: TGMSStickyLabel
      Left = 10
      Top = 8
      Width = 48
      Height = 13
      Caption = #23492#20179#21333#20301
      _AttachTo = edtCus
      _Gap = 1
    end
    object GMSStickyLabel8: TGMSStickyLabel
      Left = 198
      Top = 8
      Width = 60
      Height = 13
      Caption = #36153#29992#20851#31995#20154
      _AttachTo = edtCostCus
      _Gap = 1
    end
    object GMSStickyLabel15: TGMSStickyLabel
      Left = 210
      Top = 30
      Width = 48
      Height = 13
      Caption = #32467#26463#26085#26399
      _AttachTo = dtdReceDateT
      _Gap = 1
    end
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 10
      Top = 30
      Width = 48
      Height = 13
      Caption = #24320#22987#26085#26399
      _AttachTo = dtdReceDateF
      _Gap = 1
    end
    object GMSStickyLabel16: TGMSStickyLabel
      Left = 600
      Top = 8
      Width = 48
      Height = 13
      Caption = #21830#21697#32534#30721
      _AttachTo = edtcustomerno
      _Gap = 1
    end
    object GMSStickyLabel10: TGMSStickyLabel
      Left = 10
      Top = 52
      Width = 48
      Height = 13
      Caption = #21830#21697#22411#21495
      _AttachTo = cmbskumodel
      _Gap = 1
    end
    object GMSStickyLabel13: TGMSStickyLabel
      Left = 210
      Top = 52
      Width = 48
      Height = 13
      Caption = #21830#21697#35268#26684
      _AttachTo = edtskuspec
      _Gap = 1
    end
    object GMSStickyLabel11: TGMSStickyLabel
      Left = 404
      Top = 30
      Width = 48
      Height = 13
      Caption = #21830#21697#23646#24615
      _AttachTo = cmbskuclassname
      _Gap = 1
    end
    object GMSStickyLabel12: TGMSStickyLabel
      Left = 404
      Top = 52
      Width = 48
      Height = 13
      Caption = #27604'        '#20363
      _AttachTo = edtpiecepro
      _Gap = 1
    end
    object edtCus: TdxButtonEdit
      Left = 59
      Top = 4
      Width = 120
      AllowDblClk = True
      DirectInput = False
      CanDeleteText = True
      TabOrder = 0
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtCusButtonClick
      ExistButtons = True
    end
    object cmbSKUName: TdxButtonEdit
      Left = 453
      Top = 4
      Width = 120
      AllowDblClk = True
      DirectInput = False
      CanDeleteText = True
      TabOrder = 4
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = cmbSKUNameButtonClick
      ExistButtons = True
    end
    object dtdReceDateF: TdxDateEdit
      Left = 59
      Top = 26
      Width = 120
      TabOrder = 2
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object dtdReceDateT: TdxDateEdit
      Left = 259
      Top = 26
      Width = 120
      TabOrder = 3
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
    object edtCostCus: TdxButtonEdit
      Left = 259
      Top = 4
      Width = 120
      AllowDblClk = True
      DirectInput = False
      CanDeleteText = True
      TabOrder = 1
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtCostCusButtonClick
      ExistButtons = True
    end
    object edtcustomerno: TdxEdit
      Left = 649
      Top = 4
      Width = 120
      TabOrder = 5
      StyleController = frmMain.StyleStandard
    end
    object cmbskumodel: TKinPickEdit
      Left = 59
      Top = 48
      Width = 120
      AllowDblClk = True
      TabOrder = 6
      StyleController = frmMain.StyleStandard
      Items.Strings = (
        #23454#38469#24211#23384
        #25351#20196#24211#23384
        #20219#21153#24211#23384)
      CanDeleteText = True
      ItemFields.Strings = (
        #23454#38469#24211#23384
        #25351#20196#24211#23384
        #20219#21153#24211#23384)
    end
    object edtskuspec: TdxEdit
      Left = 259
      Top = 48
      Width = 120
      TabOrder = 7
      StyleController = frmMain.StyleStandard
    end
    object cmbskuclassname: TKinPickEdit
      Left = 453
      Top = 26
      Width = 120
      AllowDblClk = True
      TabOrder = 8
      StyleController = frmMain.StyleStandard
      Items.Strings = (
        #23454#38469#24211#23384
        #25351#20196#24211#23384
        #20219#21153#24211#23384)
      CanDeleteText = True
      ItemFields.Strings = (
        #23454#38469#24211#23384
        #25351#20196#24211#23384
        #20219#21153#24211#23384)
    end
    object edtpiecepro: TdxEdit
      Left = 453
      Top = 48
      Width = 120
      TabOrder = 9
      StyleController = frmMain.StyleStandard
    end
    object ckbquantitysl: TdxCheckEdit
      Left = 598
      Top = 41
      Width = 116
      Style.BorderStyle = xbsNone
      TabOrder = 10
      Caption = #30772#25439#25968#37327#19981#20026'0'
      ReadOnly = False
      StyleController = frmMain.StyleCheck
      StoredValues = 64
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
  object qryDisrepair: TKADOQuery
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
  object dtsDisrepair: TDataSource
    DataSet = qryDisrepair
    Left = 164
    Top = 224
  end
  object ppmprint: TPopupMenu
    Tag = 10
    AutoHotkeys = maManual
    Left = 698
    Top = 32
    object N1: TMenuItem
      Caption = #25171#21360#25152#26377#36164#26009
      OnClick = N1Click
    end
  end
end
