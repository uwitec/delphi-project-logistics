object frmCZoutCount: TfrmCZoutCount
  Left = 134
  Top = 184
  AutoScroll = False
  BorderIcons = []
  Caption = #20179#31199#35745#25552
  ClientHeight = 156
  ClientWidth = 336
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
  object btnOk: TKBitBtn
    Left = 55
    Top = 109
    Width = 75
    Height = 30
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
    Caption = #35745#25552'(&Y)'
    TabOrder = 0
    StyleController = frmMain.StyleStandard
  end
  object btnCancel: TKBitBtn
    Left = 200
    Top = 109
    Width = 75
    Height = 30
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
    TabOrder = 1
    ParentFont = False
    StyleController = frmMain.StyleStandard
  end
  object KGroupBox6: TKGroupBox
    Tag = 10
    Left = 3
    Top = 8
    Width = 331
    Height = 93
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    StyleController = frmMain.StyleStandard
    BorderPack = True
    object GMSStickyLabel38: TGMSStickyLabel
      Left = -75
      Top = -23
      Width = 36
      Height = 12
      Caption = #19994#21153#21592
    end
    object GMSStickyLabel7: TGMSStickyLabel
      Left = 68
      Top = 30
      Width = 48
      Height = 12
      Caption = #26368#20302#25910#36153
      _AttachTo = edtpricein
    end
    object GMSStickyLabel10: TGMSStickyLabel
      Left = 69
      Top = 50
      Width = 48
      Height = 12
      Caption = #35745#36153#26085#26399
      _AttachTo = dtdReceDateF
      _Gap = 1
    end
    object edtpricein: TdxCurrencyEdit
      Left = 118
      Top = 26
      Width = 85
      TabOrder = 0
      StyleController = frmMain.StyleStandard
      DisplayFormat = ',0.000'
      StoredValues = 0
    end
    object dtdReceDateF: TdxDateEdit
      Left = 118
      Top = 46
      Width = 85
      TabOrder = 1
      StyleController = frmMain.StyleStandard
      StoredValues = 4
    end
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 5
    Top = 9
  end
end
