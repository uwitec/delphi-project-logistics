object frmLocationbillno: TfrmLocationbillno
  Left = 306
  Top = 220
  AutoScroll = False
  BorderIcons = []
  Caption = #20179#21333#21495#30830#23450
  ClientHeight = 124
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object GMSStickyLabel8: TGMSStickyLabel
    Left = 38
    Top = 21
    Width = 60
    Height = 12
    Caption = #36153#29992#20851#31995#20154
    _AttachTo = edtCostCus
    _Gap = 1
  end
  object GMSStickyLabel4: TGMSStickyLabel
    Left = 26
    Top = 45
    Width = 72
    Height = 12
    Caption = #23458#25143#31867#22411#20195#30721
    _AttachTo = edtcustype
    _Gap = 1
  end
  object btnOk: TKBitBtn
    Left = 94
    Top = 80
    Width = 72
    Height = 28
    Transparent = False
    ActiveTextColor = clBlack
    NumGlyphs = 2
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    OnClick = btnOkClick
    Spacing = 0
    Radius = 5
    MiddleTransparent = False
    FrameInnerColor = clBtnHighlight
    FrameOuterColor = clBtnShadow
    FrameColor = clWindowFrame
    Frame3D = True
    FrameRnd = False
    Caption = #30830#23450
    TabOrder = 3
    StyleController = frmMain.StyleStandard
  end
  object edtCostCus: TdxButtonEdit
    Left = 99
    Top = 17
    Width = 120
    OnExitCheck = edtCostCusExitCheck
    AllowDblClk = True
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
  object edtcustype: TdxEdit
    Left = 99
    Top = 41
    Width = 120
    Enabled = False
    TabOrder = 1
    ReadOnly = True
    StyleController = frmMain.StyleStandard
    StoredValues = 64
  end
  object btnCancel: TKBitBtn
    Left = 149
    Top = 76
    Width = 74
    Height = 29
    Transparent = False
    ActiveTextColor = clBlack
    NumGlyphs = 2
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    OnClick = btnCancelClick
    Spacing = 0
    Radius = 5
    MiddleTransparent = False
    FrameInnerColor = clBtnHighlight
    FrameOuterColor = clBtnShadow
    FrameColor = clWindowFrame
    Frame3D = False
    FrameRnd = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Caption = #25918#24323'(&N)'
    TabOrder = 2
    ParentFont = False
    Visible = False
    StyleController = frmMain.StyleStandard
  end
end
