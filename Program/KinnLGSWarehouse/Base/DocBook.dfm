object frmDocBook: TfrmDocBook
  Left = 210
  Top = 169
  Width = 482
  Height = 279
  Caption = #25991#26723#31649#29702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object KGroupBox1: TKGroupBox
    Left = 0
    Top = 0
    Width = 474
    Height = 65
    Align = alTop
    Caption = 'KGroupBox1'
    TabOrder = 0
    StyleController = frmMain.StyleStandard
    object GMSStickyLabel1: TGMSStickyLabel
      Left = 17
      Top = 17
      Width = 36
      Height = 12
      Caption = #19994#21153#21495
      _AttachTo = edtDOCID
    end
    object GMSStickyLabel2: TGMSStickyLabel
      Left = 166
      Top = 17
      Width = 24
      Height = 12
      Caption = #31867#21035
      _AttachTo = edtDOCTYPE
    end
    object edtDOCID: TdxEdit
      Left = 55
      Top = 13
      Width = 89
      Color = clWhite
      TabOrder = 0
      StyleController = frmMain.StyleStandard
    end
    object edtDOCTYPE: TdxEdit
      Left = 192
      Top = 13
      Width = 89
      Color = clWhite
      TabOrder = 1
      StyleController = frmMain.StyleStandard
    end
    object btnAdd: TKBitBtn
      Left = 15
      Top = 38
      Width = 66
      Height = 22
      Transparent = False
      ActiveTextColor = clBlack
      OnClick = btnAddClick
      Spacing = 0
      Radius = 5
      MiddleTransparent = False
      FrameInnerColor = clBtnHighlight
      FrameOuterColor = clBtnShadow
      FrameColor = clBlack
      Frame3D = True
      FrameRnd = False
      Caption = 'btnAdd'
      TabOrder = 2
    end
  end
  object KGroupBox2: TKGroupBox
    Left = 0
    Top = 65
    Width = 474
    Height = 187
    Align = alClient
    Caption = #38468#20214
    TabOrder = 1
    StyleController = frmMain.StyleStandard
    object lvAttachment: TKinListView
      Left = 2
      Top = 13
      Width = 470
      Height = 172
      Align = alClient
      Columns = <>
      TabOrder = 0
      ViewStyle = vsSmallIcon
      OnGetImageIndex = lvAttachmentGetImageIndex
      Msg1 = #25991#20214' "%s" '#19981#23384#22312'!'
      Msg2 = '"%s" '#19981#26159#19968#20010#26377#25928#30340#25991#20214'!'
    end
  end
  object dtsDocBook: TDataSource
    DataSet = qryDocBook
    Left = 104
    Top = 56
  end
  object qryDocBook: TKADOQuery
    Macros = <>
    Aggregates = <>
    Params = <>
    UpdateObject = udsDocBook
    SQL.Strings = (
      'select * from DocBook')
    EnableBCD = True
    CommandTimeCout = 30
    ExecuteOptions = []
    Left = 144
    Top = 56
  end
  object udsDocBook: TKadoUpdateSql
    ModifySQL.Strings = (
      'update DocBook'
      'set'
      '  DOCTYPE = :DOCTYPE,'
      '  DOCID = :DOCID,'
      '  SNO = :SNO,'
      '  FileSize = :FileSize,'
      '  FileName = :FileName,'
      '  FileContent = :FileContent'
      'where'
      '  DOCTYPE = :OLD_DOCTYPE and'
      '  DOCID = :OLD_DOCID and'
      '  SNO = :OLD_SNO')
    InsertSQL.Strings = (
      'insert into DocBook'
      '  (DOCTYPE, DOCID, SNO, FileSize, FileName, FileContent)'
      'values'
      '  (:DOCTYPE, :DOCID, :SNO, :FileSize, :FileName, :FileContent)')
    DeleteSQL.Strings = (
      'delete from DocBook'
      'where'
      '  DOCTYPE = :OLD_DOCTYPE and'
      '  DOCID = :OLD_DOCID and'
      '  SNO = :OLD_SNO')
    Separator = '!'
    Left = 184
    Top = 56
  end
end
