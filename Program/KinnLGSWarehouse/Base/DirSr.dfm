object frmDirSr: TfrmDirSr
  Left = 197
  Top = 178
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #36873#25321#36335#24452
  ClientHeight = 202
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object DriveComboBox1: TDriveComboBox
    Left = 2
    Top = 8
    Width = 145
    Height = 18
    BevelKind = bkTile
    Ctl3D = True
    DirList = edtDirectory
    ParentCtl3D = False
    TabOrder = 0
  end
  object edtDirectory: TDirectoryListBox
    Left = 1
    Top = 36
    Width = 365
    Height = 160
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Ctl3D = False
    ItemHeight = 16
    ParentCtl3D = False
    TabOrder = 1
  end
  object btnOpen: TKBitBtn
    Left = 372
    Top = 128
    Width = 70
    Height = 24
    Transparent = False
    ActiveTextColor = clBlack
    Spacing = 0
    Radius = 5
    MiddleTransparent = False
    FrameInnerColor = clBtnHighlight
    FrameOuterColor = clBtnShadow
    FrameColor = clWindowFrame
    Frame3D = True
    FrameRnd = False
    Caption = #25171#24320
    TabOrder = 2
    ModalResult = 1
    StyleController = frmMain.StyleStandard
  end
  object btnCancel: TKBitBtn
    Left = 372
    Top = 167
    Width = 70
    Height = 24
    Transparent = False
    ActiveTextColor = clBlack
    Spacing = 0
    Radius = 5
    MiddleTransparent = False
    FrameInnerColor = clBtnHighlight
    FrameOuterColor = clBtnShadow
    FrameColor = clWindowFrame
    Frame3D = True
    FrameRnd = False
    Caption = #25918#24323
    TabOrder = 3
    ModalResult = 2
    Cancel = True
    StyleController = frmMain.StyleStandard
  end
end
