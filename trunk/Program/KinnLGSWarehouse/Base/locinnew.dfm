object frmLocinnew: TfrmLocinnew
  Left = 565
  Top = 244
  AutoScroll = False
  BiDiMode = bdLeftToRight
  Caption = #36827#20179#24405#20837
  ClientHeight = 361
  ClientWidth = 274
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object GMSStickyLabel4: TGMSStickyLabel
    Left = 197
    Top = 15
    Width = 48
    Height = 12
    Alignment = taRightJustify
    Caption = #21830#21697#32534#30721
    _Gap = 1
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 0
    Width = 274
    Height = 361
    Align = alClient
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 26
      Top = 44
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #20837#20179#21333#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtmainorder
      _Gap = 1
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 26
      Top = 82
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #21830#21697#32534#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtcustomerno
      _Gap = 1
    end
    object GMSStickyLabel3: TGMSStickyLabel
      Left = 26
      Top = 119
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #25176' '#30424' '#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtpltid
      _Gap = 1
    end
    object GMSStickyLabel5: TGMSStickyLabel
      Left = 26
      Top = 157
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #31665' '#20010' '#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtqtyperct
      _Gap = 1
    end
    object GMSStickyLabel6: TGMSStickyLabel
      Left = 26
      Top = 195
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #24635' '#31665' '#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtallct
      _Gap = 1
    end
    object GMSStickyLabel7: TGMSStickyLabel
      Left = 26
      Top = 233
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = #24211'    '#20301
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      _AttachTo = edtlocname
      _Gap = 1
    end
    object edtmainorder: TdxDBEdit
      Tag = 10
      Left = 83
      Top = 40
      Width = 164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edtmainorderExit
      OnKeyDown = edtmainorderKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'mainorder'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Height = 25
      StoredValues = 1
    end
    object edtcustomerno: TdxDBEdit
      Tag = 10
      Left = 83
      Top = 78
      Width = 164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edtcustomernoExit
      OnKeyDown = edtcustomernoKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'customerno'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Height = 25
      StoredValues = 1
    end
    object edtpltid: TdxDBEdit
      Tag = 10
      Left = 83
      Top = 115
      Width = 164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edtpltidExit
      OnKeyDown = edtpltidKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'pltid'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Height = 25
      StoredValues = 1
    end
    object edtqtyperct: TdxDBEdit
      Tag = 10
      Left = 83
      Top = 153
      Width = 164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = edtqtyperctExit
      OnKeyDown = edtqtyperctKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'qtyperct'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Height = 25
      StoredValues = 1
    end
    object edtallct: TdxDBEdit
      Tag = 10
      Left = 83
      Top = 191
      Width = 164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = edtallctExit
      OnKeyDown = edtallctKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'allct'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Height = 25
      StoredValues = 1
    end
    object edtlocname: TdxDBButtonEdit
      Tag = 10
      Left = 83
      Top = 229
      Width = 164
      OnExitCheck = edtlocnameExitCheck
      AllowDblClk = True
      ClickSpace = True
      Field = 'locID'
      TabOrder = 5
      OnExit = edtlocnameExit
      OnKeyDown = edtlocnameKeyDown
      Alignment = taLeftJustify
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'locname'
      DataSource = dtslocinnew
      StyleController = frmMain.StyleStandard
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = edtlocnameButtonClick
      Height = 25
      StoredValues = 1
      ExistButtons = True
    end
    object btnOk: TKBitBtn
      Left = 109
      Top = 324
      Width = 75
      Height = 24
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Caption = #30830#23450
      TabOrder = 6
      ParentFont = False
      StyleController = frmMain.StyleStandard
    end
  end
  object udslocinnew: TKadoUpdateSql
    ModifySQL.Strings = (
      'update locinnew'
      'set'
      '   mainorder = :mainorder ,'
      '   customerno = :customerno,'
      '   qtyperct = :qtyperct,'
      '   pltid = :pltid,'
      '   allct = :allct,'
      '   locname = :locname,'
      '   opdate = :opdate,'
      '   opname = :opname,'
      '   completeid = :completeid'
      'where '
      '  jobno = :OLD_jobno ')
    InsertSQL.Strings = (
      'insert into locinnew'
      '(mainorder,customerno,qtyperct,'
      ' pltid,allct,locname,opdate,'
      ' opname,completeid)'
      'values'
      '(:mainorder, :customerno, :qtyperct,'
      ' :pltid, :allct, :locname, :opdate,'
      ' :opname, :completeid)')
    DeleteSQL.Strings = (
      'delete from locinnew'
      'where '
      '  jobno = :OLD_jobno ')
    Separator = '!'
    Left = 152
    Top = 442
  end
  object dtslocinnew: TDataSource
    DataSet = qrylocinnew
    Left = 125
    Top = 442
  end
  object qrylocinnew: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    UpdateObject = udslocinnew
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 97
    Top = 442
  end
  object qryTmp: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 211
    Top = 442
  end
  object qrytmp1: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 259
    Top = 442
  end
end
