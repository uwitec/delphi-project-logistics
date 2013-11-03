object frmLocOutDetail: TfrmLocOutDetail
  Left = 233
  Top = 132
  BorderStyle = bsSingle
  Caption = #20986#20179
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
  OnKeyDown = FormKeyDown
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
    object Bevel2: TBevel
      Left = 417
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object Bevel3: TBevel
      Left = 537
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object Bevel5: TBevel
      Left = 541
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object Bevel1: TBevel
      Left = 694
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object Bevel4: TBevel
      Left = 603
      Top = 0
      Width = 4
      Height = 28
      Align = alRight
      Shape = bsRightLine
    end
    object btnEdit: TKBitBtn
      Tag = 2
      Left = 421
      Top = 0
      Width = 29
      Height = 28
      Hint = #20462#25913'(E)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        888888888888888888888888888888888888888FFFFFFFFFF888888000000000
        0888887777777777888888880000000088888887777777788888888880000008
        8888888877777788888888888800008888888888877778888888888888800888
        8888888888778888888888888888888888888888888888888888888888888888
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
      Caption = #20462#25913
      TabOrder = 0
      ParentShowHint = False
      ShowHint = True
      Visible = False
      AutoWidth = True
    end
    object btnAdd: TKBitBtn
      Tag = 1
      Left = 450
      Top = 0
      Width = 29
      Height = 28
      Hint = #26032#22686'(A)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        88888888888888888888888888888888888888888888FFF88888888888800088
        88888888888777F8888888888880008888888888888777F88888888888800088
        888888888FF777FFFF8888880000000008888888777777777F88888800000000
        08888888777777777F8888880000000008888888777777777888888888800088
        88888888888777F8888888888880008888888888888777F88888888888800088
        8888888888877788888888888888888888888888888888888888888888888888
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
      Caption = #26032#22686
      TabOrder = 1
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnDelete: TKBitBtn
      Tag = 4
      Left = 479
      Top = 0
      Width = 29
      Height = 28
      Hint = #21024#38500'(D)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        88888888FFFFFFFFFF8888880000000000888887777777777F88888800000000
        00888887777777777F8888880000000000888887777777777888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
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
      Caption = #21024#38500
      TabOrder = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      AutoWidth = True
    end
    object btnSave: TKBitBtn
      Tag = 10
      Left = 545
      Top = 0
      Width = 29
      Height = 28
      Hint = #20445#23384'(^W)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777FFFFFFFFFFFFF7700000000000007778888888888888F70EE00000077
        0E0778F7888888F78F8F70EE000000770E0778F7888888F78F8F70EE00000077
        0E0778F7888888FF8F8F70EE000000000E0778F788888888878F70EEEEEEEEEE
        EE0778F77FFFFFFFF78F70EE00000000EE0778F7888888887F8F70E077777777
        0E0778F8F77777778F8F70E0777777770E0778F8F77777778F8F70E077777777
        0E0778F8F77777778F8F70E0777777770E0778F8F77777778F8F70E077777777
        000778F8F7777777888F70E077777777070778F8FFFFFFFF8F8F700000000000
        0007788888888888888777777777777777777777777777777777}
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
      Caption = #20445#23384
      TabOrder = 4
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnCancel: TKBitBtn
      Tag = 10
      Left = 574
      Top = 0
      Width = 29
      Height = 28
      Hint = #25918#24323'(Esc)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777FFFFFFFFFFFFF7700000000000007778888888888888F70EE00000077
        0E0778F7888888F78F8F70EE000000770E0778F7888888F78F8F70EE00000077
        0E0778FF888888FF8F8F7000000000000E07788888888888878F70990070990E
        EE0778F788F8778FF78F709990099900EE0778FF788777887F8F700999999007
        0E077887F77778878F8F7070999907770E0778F8F7778F778F8F707099990777
        0E0778F8777787FF8F8F7009999990070E07788777FF788F8F8F709990099907
        000778F77887F78F888F709907709907070778FF8FF8FF8F8F8F700000000000
        0007788888888888888777777777777777777777777777777777}
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
      Caption = #25918#24323
      TabOrder = 5
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
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
      TabOrder = 9
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btncopy: TKBitBtn
      Tag = 2
      Left = 508
      Top = 0
      Width = 29
      Height = 28
      Hint = #22797#21046#26032#22686'(C)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        888888888888888888888888888888888888888888FFF8888888888880008888
        888888888777F8888888888880008888888888888777F8888888888880008888
        88888888F777FFFF888888000000000988888877777777738888880000000099
        9888887777777733388888000000099999888877777773333388888880009999
        99988888877733333338888880008899988888888777F8333888888880008899
        9888888887778833388888888888889998888888888888333888888888899999
        8888888888833333888888888888888888888888888888888888}
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
      Caption = #22797#21046
      TabOrder = 3
      ParentShowHint = False
      ShowHint = True
      Visible = False
      AutoWidth = True
    end
    object btnCheck: TKBitBtn
      Tag = 2
      Left = 636
      Top = 0
      Width = 29
      Height = 28
      Hint = #23457#26680'(V)'
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777FFFFFFFFFFF7777000000000007777788888888888F7770FFFFFFF888
        0777787F777777778F7779077777777F07777787F77777778F7779907777777F
        07777778777777778F7779997777777F07777777777777778F7779997777777F
        077777777F7777778F7779990787778F09977777877F7FFF87F779997D080000
        70977777778788887877799978D000FFFF977777777888F777F77999777D70FF
        F09777777FFF78F778777799000FD0FF077777778887F87F877777797770FD00
        7777777777787F8877777777777700D77777777777778877777777777777777D
        77777777777777777777777777777777D7777777777777777777}
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
      Caption = #23457#26680
      TabOrder = 7
      ParentShowHint = False
      ShowHint = True
      Visible = False
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
      TabOrder = 8
      ParentShowHint = False
      ShowHint = True
      AutoWidth = True
    end
    object btnPaste: TKBitBtn
      Tag = 2
      Left = 607
      Top = 0
      Width = 29
      Height = 28
      Hint = #30830#35748#31227#20179#25805#20316
      Transparent = False
      ActiveTextColor = clBlack
      NumGlyphs = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
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
      Caption = #30830#35748
      TabOrder = 6
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
        Top = 81
        Width = 727
        Height = 403
        Align = alClient
        Caption = #36135#29289#20449#24687
        TabOrder = 2
        object grdMoveLocOld: TdxDBGrid
          Tag = 10
          Left = 2
          Top = 13
          Width = 723
          Height = 388
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
              SummaryItems = <
                item
                  SummaryField = 'checked'
                  SummaryDisplayField = 'checked'
                  SummaryType = cstCount
                end
                item
                  SummaryField = 'quantity'
                  SummaryDisplayField = 'quantity'
                  SummaryFormat = ',0.####'
                  SummaryType = cstSum
                end
                item
                  SummaryField = 'piece'
                  SummaryDisplayField = 'piece'
                  SummaryFormat = ',0.####'
                  SummaryType = cstSum
                end
                item
                  SummaryField = 'grossweight'
                  SummaryDisplayField = 'grossweight'
                  SummaryFormat = ',0.####'
                  SummaryType = cstSum
                end
                item
                  SummaryField = 'netweight'
                  SummaryDisplayField = 'netweight'
                  SummaryFormat = ',0.####'
                  SummaryType = cstSum
                end>
              Name = 'grdMoveLocOldSummaryGroup2'
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
          PopupMenu = popMoveLocOld
          ShowHint = False
          TabOrder = 0
          OnEnter = grdMoveLocOldEnter
          OnExit = grdMoveLocOldExit
          OnKeyDown = grdMoveLocOldKeyDown
          BandFont.Charset = DEFAULT_CHARSET
          BandFont.Color = clBlack
          BandFont.Height = -12
          BandFont.Name = #23435#20307
          BandFont.Style = []
          DataSource = dtsMoveLocOld
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
          OnEditing = grdMoveLocOldEditing
          object sno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sno'
            SummaryFooterType = cstCount
            SummaryFooterField = 'sno'
            SummaryFooterFormat = #24635#31508#25968':#'
            SummaryType = cstCount
          end
          object checked: TdxDBGridCheckColumn
            Caption = #36873#25321
            HeaderAlignment = taCenter
            MinWidth = 20
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'checked'
            SummaryFooterType = cstCount
            SummaryFooterField = 'checked'
            SummaryFooterFormat = #24635#31508#25968':#'
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            SummaryType = cstCount
          end
          object snoin: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24207#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 95
            BandIndex = 0
            RowIndex = 0
            FieldName = 'snoin'
          end
          object ldsnoin: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 143
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ldsnoin'
          end
          object jobnoin: TdxDBGridColumn
            Alignment = taCenter
            Caption = #24037#20316#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 132
            BandIndex = 0
            RowIndex = 0
            FieldName = 'jobnoin'
          end
          object detailsnoin: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 218
            BandIndex = 0
            RowIndex = 0
            FieldName = 'detailsnoin'
          end
          object skuid: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuid'
          end
          object mainorder: TdxDBGridColumn
            Caption = #20027#35746#21333#21495
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'mainorder'
          end
          object shippercusname: TdxDBGridColumn
            Caption = #36135#20027
            HeaderAlignment = taCenter
            Width = 92
            BandIndex = 0
            RowIndex = 0
            FieldName = 'shippercusname'
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
            Caption = #28034#23618#21495
            HeaderAlignment = taCenter
            Width = 168
            BandIndex = 0
            RowIndex = 0
            FieldName = 'serialno'
          end
          object locname: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20179#20301
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 121
            BandIndex = 0
            RowIndex = 0
            FieldName = 'locname'
          end
          object sealno: TdxDBGridColumn
            Alignment = taCenter
            Caption = #25176#30424#21495
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 93
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sealno'
          end
          object quantity: TdxDBGridColumn
            Alignment = taCenter
            Caption = #25968#37327
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantity'
          end
          object jobno: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'jobno'
          end
          object piece: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20214#25968
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'piece'
            SummaryFooterType = cstSum
          end
          object grossweight: TdxDBGridColumn
            Alignment = taCenter
            Caption = #27611#37325
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'grossweight'
            SummaryFooterType = cstSum
          end
          object netweight: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20928#37325
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'netweight'
            SummaryFooterType = cstSum
          end
          object volume: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20307#31215
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'volume'
          end
          object area: TdxDBGridColumn
            Alignment = taCenter
            Caption = #38754#31215
            HeaderAlignment = taCenter
            Width = 47
            BandIndex = 0
            RowIndex = 0
            FieldName = 'area'
          end
          object quantitynew: TdxDBGridCurrencyColumn
            Alignment = taLeftJustify
            Caption = #20986#20179#25968#37327
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantitynew'
            DisplayFormat = '0.####;-,0.####'
            Nullable = False
          end
          object piecenew: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20986#20179#20214#25968
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'piecenew'
          end
          object grossweightnew: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20986#20179#27611#37325
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'grossweightnew'
          end
          object netweightnew: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20986#20179#20928#37325
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'netweightnew'
          end
          object volumenew: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20986#20179#20307#31215
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'volumenew'
          end
          object areanew: TdxDBGridColumn
            Alignment = taCenter
            Caption = #20986#20179#38754#31215
            HeaderAlignment = taCenter
            Width = 71
            BandIndex = 0
            RowIndex = 0
            FieldName = 'areanew'
          end
          object color: TdxDBGridColumn
            Caption = #21830#21697#39068#33394
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'color'
          end
          object skuspec: TdxDBGridColumn
            Caption = #21830#21697#35268#26684
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skuspec'
          end
          object skumodel: TdxDBGridColumn
            Caption = #21830#21697#22411#21495
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'skumodel'
          end
        end
      end
      object RxSplitter1: TRxSplitter
        Left = 0
        Top = 484
        Width = 727
        Height = 2
        Align = alBottom
      end
      object KGroupBox5: TKGroupBox
        Left = 0
        Top = 0
        Width = 727
        Height = 41
        Align = alTop
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        StyleController = frmMain.StyleStandard
        object lblfind: TGMSStickyLabel
          Left = 7
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
        object lblF: TGMSStickyLabel
          Left = 169
          Top = 20
          Width = 12
          Height = 12
          Caption = #20174
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Visible = False
          _AttachTo = cmbstockno
          _Gap = 1
        end
        object lblT: TGMSStickyLabel
          Left = 315
          Top = 19
          Width = 12
          Height = 12
          Caption = #21040
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Visible = False
          _AttachTo = cmbsealno
          _Gap = 1
        end
        object cmbchoice: TKinPickEdit
          Left = 56
          Top = 16
          Width = 110
          AllowDblClk = True
          TabOrder = 4
          OnExit = cmbchoiceExit
          ReadOnly = False
          StyleController = frmMain.StyleStandard
          OnChange = cmbchoiceChange
          DropDownListStyle = True
          Items.Strings = (
            #20027#35746#21333#21495
            #21697'    '#21517
            #20179'    '#20301
            #36135'    '#20027
            #25176' '#30424' '#21495)
          ItemFields.Strings = (
            #20027#35746#21333#21495
            #21697'    '#21517
            #20179'    '#20301
            #36135'    '#20027
            #25176' '#30424' '#21495)
          StoredValues = 64
        end
        object edtmainorder: TdxEdit
          Left = 182
          Top = 16
          Width = 130
          TabOrder = 7
          StyleController = frmMain.StyleStandard
        end
        object edtskuname: TdxButtonEdit
          Left = 182
          Top = 16
          Width = 130
          OnExitCheck = edtskunameExitCheck
          AllowDblClk = True
          CanDeleteText = True
          TabOrder = 6
          OnExit = edtskunameExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = edtskunameButtonClick
          ExistButtons = True
        end
        object edtlocname: TdxButtonEdit
          Left = 182
          Top = 16
          Width = 130
          OnExitCheck = edtlocnameExitCheck
          AllowDblClk = True
          CanDeleteText = True
          TabOrder = 9
          OnExit = edtlocnameExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = edtlocnameButtonClick
          ExistButtons = True
        end
        object btnQuery: TKBitBtn
          Left = 473
          Top = 13
          Width = 75
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
        object cmbShipAccID: TdxButtonEdit
          Left = 182
          Top = 16
          Width = 130
          OnExitCheck = cmbShipAccIDExitCheck
          AllowDblClk = True
          CanDeleteText = True
          TabOrder = 8
          OnExit = cmbShipAccIDExit
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = cmbShipAccIDButtonClick
          ExistButtons = True
        end
        object cmbstockno: TdxEdit
          Left = 182
          Top = 16
          Width = 130
          TabOrder = 5
          StyleController = frmMain.StyleStandard
        end
        object btncancell: TKBitBtn
          Left = 648
          Top = 13
          Width = 75
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
        object btnOK: TKBitBtn
          Left = 561
          Top = 13
          Width = 75
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
        object cmbsealno: TdxEdit
          Left = 328
          Top = 15
          Width = 130
          TabOrder = 3
          Visible = False
          StyleController = frmMain.StyleStandard
        end
      end
      object KGroupBox1: TKGroupBox
        Left = 0
        Top = 41
        Width = 727
        Height = 40
        Align = alTop
        Caption = #20986#20179#21333#20449#24687
        TabOrder = 1
        StyleController = frmMain.StyleStandard
        object GMSStickyLabel15: TGMSStickyLabel
          Left = 355
          Top = 20
          Width = 48
          Height = 12
          Caption = #35745#21010#26085#26399
          _AttachTo = dtdReceDateT
          _Gap = 1
        end
        object GMSStickyLabel1: TGMSStickyLabel
          Left = 178
          Top = 20
          Width = 60
          Height = 12
          Caption = #36153#29992#20851#31995#20154
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          _AttachTo = edtCusname
        end
        object GMSStickyLabel80: TGMSStickyLabel
          Left = 6
          Top = 20
          Width = 48
          Height = 12
          Hint = #25509#25910#25351#20196#24182#36827#34892#25351#20196#25805#20316#30340#37096#38376
          Caption = #25191#34892#37096#38376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          _AttachTo = edtIuserId
        end
        object GMSStickyLabel2: TGMSStickyLabel
          Left = 523
          Top = 20
          Width = 48
          Height = 12
          Caption = #20027#35746#21333#21495
          _AttachTo = edtMainorderO
          _Gap = 1
        end
        object dtdReceDateT: TdxDateEdit
          Left = 404
          Top = 16
          Width = 107
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 2
          StyleController = frmMain.StyleStandard
          StoredValues = 4
        end
        object edtCusname: TdxButtonEdit
          Tag = 10
          Left = 240
          Top = 16
          Width = 102
          AllowDblClk = True
          ClickSpace = True
          DirectInput = False
          CanDeleteText = True
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = edtCusnameButtonClick
          ExistButtons = True
        end
        object edtIuserId: TdxButtonEdit
          Tag = 10
          Left = 56
          Top = 16
          Width = 109
          AllowDblClk = True
          ClickSpace = True
          DirectInput = False
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          StyleController = frmMain.StyleStandard
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = edtIuserIdButtonClick
          ExistButtons = True
        end
        object edtMainorderO: TdxEdit
          Left = 572
          Top = 16
          Width = 117
          TabOrder = 3
          StyleController = frmMain.StyleStandard
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
  object popMoveLocOld: TPopupMenu
    Tag = 10
    Left = 242
    Top = 248
    object mitAddLocOld: TMenuItem
      Tag = 11
      Caption = #20840#37096#36873#23450
      OnClick = mitAddLocOldClick
    end
    object mitDelLocOld: TMenuItem
      Tag = 11
      Caption = #20840#37096#19981#36873
      OnClick = mitDelLocOldClick
    end
  end
  object dtsMoveLocOld: TDataSource
    DataSet = qryMoveLocOld
    Left = 429
    Top = 330
  end
  object qryMoveLocOld: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    AfterPost = qryMoveLocOldAfterPost
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
end
