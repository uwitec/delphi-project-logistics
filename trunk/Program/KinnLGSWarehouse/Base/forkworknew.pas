unit forkworknew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, dxDBELib,KDataSetProvider,GetDllPub, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, RXSplit, dxPageControl;

type
  Tfrmforkworknew = class(TForm)
    pgcLocationINOUT: TdxPageControl;
    tbsInfo: TdxTabSheet;
    tbsCasing: TdxTabSheet;
    tbsSKU: TdxTabSheet;
    RxSplitter1: TRxSplitter;
    tbsautoCost: TdxTabSheet;
    tbslocinskudetail: TdxTabSheet;
    KGroupBox5: TKGroupBox;
    GMSStickyLabel62: TGMSStickyLabel;
    GMSStickyLabel63: TGMSStickyLabel;
    GMSStickyLabel64: TGMSStickyLabel;
    GMSStickyLabel65: TGMSStickyLabel;
    GMSStickyLabel66: TGMSStickyLabel;
    GMSStickyLabel67: TGMSStickyLabel;
    edtConnoScan: TdxEdit;
    edtQuantityP: TdxCalcEdit;
    edtNetWeightP: TdxCalcEdit;
    edtCustomerNo: TdxButtonEdit;
    btnInput: TKBitBtn;
    edtPath: TdxButtonEdit;
    cmbTemple: TKinDbPickEdit;
    grdSKUDetail: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
    UnKnowQ: TdxDBGridCheckColumn;
    dxDBGridColumn1: TdxDBGridColumn;
    edtSKUName: TdxDBGridButtonColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    lotcode: TdxDBGridColumn;
    skubrand: TdxDBGridColumn;
    edtqualityname: TdxDBGridButtonColumn;
    edtQUANTITY: TdxDBGridCurrencyColumn;
    cmbQUANTITYUOM: TdxDBGridKinPickColumn;
    edtdepth: TdxDBGridColumn;
    edtwidth: TdxDBGridColumn;
    edtheight: TdxDBGridColumn;
    sizeuom: TdxDBGridKinPickColumn;
    dxDBGridBlobColumn1: TdxDBGridBlobColumn;
    edtSKUSerialNO: TdxDBGridColumn;
    dxDBGridCurrencyColumn1: TdxDBGridCurrencyColumn;
    sealno: TdxDBGridColumn;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel20: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel24: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    GMSStickyLabel30: TGMSStickyLabel;
    GMSStickyLabel31: TGMSStickyLabel;
    edtopnamekg: TdxButtonEdit;
    edtopname1kg: TdxButtonEdit;
    edtopname2kg: TdxButtonEdit;
    edtopname3kg: TdxButtonEdit;
    edtopname4kg: TdxButtonEdit;
    edtopname5kg: TdxButtonEdit;
    edtopname6kg: TdxButtonEdit;
    edtopname7kg: TdxButtonEdit;
    edtnetweightkg: TdxEdit;
    edtnetweight1kg: TdxEdit;
    edtnetweight2kg: TdxEdit;
    edtnetweight3kg: TdxEdit;
    edtnetweight4kg: TdxEdit;
    edtnetweight5kg: TdxEdit;
    edtnetweight6kg: TdxEdit;
    edtnetweight7kg: TdxEdit;
    edtlocationbillnokg: TdxEdit;
    edtnetweighttotalkg: TdxEdit;
    btnCancelkg: TKBitBtn;
    btnOkkg: TKBitBtn;
    btnSharingkg: TKBitBtn;
    edtminquantity: TdxEdit;
    edtminquantity1: TdxEdit;
    edtminquantity2: TdxEdit;
    edtminquantity3: TdxEdit;
    edtminquantity4: TdxEdit;
    edtminquantity5: TdxEdit;
    edtminquantity6: TdxEdit;
    edtminquantity7: TdxEdit;
    edtpricejl: TdxEdit;
    edtopnamejl: TdxButtonEdit;
    edtnetweightjl: TdxEdit;
    edtminquantityjl: TdxEdit;
    edtpricekg: TdxEdit;
    GroupBox1: TGroupBox;
    radquantitytype: TKRadioGroup;
    GMSStickyLabel131: TGMSStickyLabel;
    GMSStickyLabel132: TGMSStickyLabel;
    GMSStickyLabel133: TGMSStickyLabel;
    GMSStickyLabel134: TGMSStickyLabel;
    GMSStickyLabel135: TGMSStickyLabel;
    GMSStickyLabel136: TGMSStickyLabel;
    GMSStickyLabel137: TGMSStickyLabel;
    GMSStickyLabel138: TGMSStickyLabel;
    GMSStickyLabel139: TGMSStickyLabel;
    edtnetweightkggzl: TdxEdit;
    edtnetweight1kggzl: TdxEdit;
    edtnetweight2kggzl: TdxEdit;
    edtnetweight3kggzl: TdxEdit;
    edtnetweight4kggzl: TdxEdit;
    edtnetweight5kggzl: TdxEdit;
    edtnetweight6kggzl: TdxEdit;
    edtnetweight7kggzl: TdxEdit;
    edtnetweightjlgzl: TdxEdit;
    GMSStickyLabel32: TGMSStickyLabel;
    GMSStickyLabel33: TGMSStickyLabel;
    GMSStickyLabel34: TGMSStickyLabel;
    GMSStickyLabel35: TGMSStickyLabel;
    GMSStickyLabel36: TGMSStickyLabel;
    GMSStickyLabel37: TGMSStickyLabel;
    GMSStickyLabel38: TGMSStickyLabel;
    GMSStickyLabel39: TGMSStickyLabel;
    GMSStickyLabel40: TGMSStickyLabel;
    GMSStickyLabel41: TGMSStickyLabel;
    GMSStickyLabel42: TGMSStickyLabel;
    GMSStickyLabel43: TGMSStickyLabel;
    GMSStickyLabel44: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    GMSStickyLabel46: TGMSStickyLabel;
    GMSStickyLabel47: TGMSStickyLabel;
    GMSStickyLabel48: TGMSStickyLabel;
    GMSStickyLabel49: TGMSStickyLabel;
    GMSStickyLabel50: TGMSStickyLabel;
    GMSStickyLabel51: TGMSStickyLabel;
    GMSStickyLabel52: TGMSStickyLabel;
    GMSStickyLabel53: TGMSStickyLabel;
    GMSStickyLabel54: TGMSStickyLabel;
    GMSStickyLabel55: TGMSStickyLabel;
    GMSStickyLabel56: TGMSStickyLabel;
    GMSStickyLabel57: TGMSStickyLabel;
    GMSStickyLabel68: TGMSStickyLabel;
    edtopnamecc: TdxButtonEdit;
    edtopname1cc: TdxButtonEdit;
    edtopname2cc: TdxButtonEdit;
    edtopname3cc: TdxButtonEdit;
    edtopname4cc: TdxButtonEdit;
    edtopname5cc: TdxButtonEdit;
    edtopname6cc: TdxButtonEdit;
    edtopname7cc: TdxButtonEdit;
    edtnetweightcc: TdxEdit;
    edtnetweight1cc: TdxEdit;
    edtnetweight2cc: TdxEdit;
    edtnetweight3cc: TdxEdit;
    edtnetweight4cc: TdxEdit;
    edtnetweight5cc: TdxEdit;
    edtnetweight6cc: TdxEdit;
    edtnetweight7cc: TdxEdit;
    edtlocationbillnocc: TdxEdit;
    edtnetweighttotalcc: TdxEdit;
    btnCancelcc: TKBitBtn;
    btnOkcc: TKBitBtn;
    btnSharingcc: TKBitBtn;
    edtminquantitycc: TdxEdit;
    edtminquantity1cc: TdxEdit;
    edtminquantity2cc: TdxEdit;
    edtminquantity3cc: TdxEdit;
    edtminquantity4cc: TdxEdit;
    edtminquantity5cc: TdxEdit;
    edtminquantity6cc: TdxEdit;
    edtminquantity7cc: TdxEdit;
    edtpricecc: TdxEdit;
    GMSStickyLabel140: TGMSStickyLabel;
    GMSStickyLabel141: TGMSStickyLabel;
    GMSStickyLabel142: TGMSStickyLabel;
    GMSStickyLabel143: TGMSStickyLabel;
    GMSStickyLabel144: TGMSStickyLabel;
    GMSStickyLabel145: TGMSStickyLabel;
    GMSStickyLabel146: TGMSStickyLabel;
    GMSStickyLabel147: TGMSStickyLabel;
    edtnetweightccgzl: TdxEdit;
    edtnetweight1ccgzl: TdxEdit;
    edtnetweight2ccgzl: TdxEdit;
    edtnetweight3ccgzl: TdxEdit;
    edtnetweight4ccgzl: TdxEdit;
    edtnetweight5ccgzl: TdxEdit;
    edtnetweight6ccgzl: TdxEdit;
    edtnetweight7ccgzl: TdxEdit;
    GMSStickyLabel58: TGMSStickyLabel;
    GMSStickyLabel59: TGMSStickyLabel;
    GMSStickyLabel60: TGMSStickyLabel;
    GMSStickyLabel61: TGMSStickyLabel;
    GMSStickyLabel69: TGMSStickyLabel;
    GMSStickyLabel70: TGMSStickyLabel;
    GMSStickyLabel71: TGMSStickyLabel;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel76: TGMSStickyLabel;
    GMSStickyLabel77: TGMSStickyLabel;
    GMSStickyLabel78: TGMSStickyLabel;
    GMSStickyLabel79: TGMSStickyLabel;
    GMSStickyLabel80: TGMSStickyLabel;
    GMSStickyLabel81: TGMSStickyLabel;
    GMSStickyLabel82: TGMSStickyLabel;
    GMSStickyLabel83: TGMSStickyLabel;
    GMSStickyLabel84: TGMSStickyLabel;
    GMSStickyLabel85: TGMSStickyLabel;
    GMSStickyLabel86: TGMSStickyLabel;
    GMSStickyLabel87: TGMSStickyLabel;
    GMSStickyLabel88: TGMSStickyLabel;
    GMSStickyLabel89: TGMSStickyLabel;
    GMSStickyLabel90: TGMSStickyLabel;
    GMSStickyLabel91: TGMSStickyLabel;
    edtopnamezx: TdxButtonEdit;
    edtopname1zx: TdxButtonEdit;
    edtopname2zx: TdxButtonEdit;
    edtopname3zx: TdxButtonEdit;
    edtopname4zx: TdxButtonEdit;
    edtopname5zx: TdxButtonEdit;
    edtopname6zx: TdxButtonEdit;
    edtopname7zx: TdxButtonEdit;
    edtnetweightzx: TdxEdit;
    edtnetweight1zx: TdxEdit;
    edtnetweight2zx: TdxEdit;
    edtnetweight3zx: TdxEdit;
    edtnetweight4zx: TdxEdit;
    edtnetweight5zx: TdxEdit;
    edtnetweight6zx: TdxEdit;
    edtnetweight7zx: TdxEdit;
    edtlocationbillnozx: TdxEdit;
    edtnetweighttotalzx: TdxEdit;
    btnCancelzx: TKBitBtn;
    btnOkzx: TKBitBtn;
    btnSharingzx: TKBitBtn;
    edtminquantityzx: TdxEdit;
    edtminquantity1zx: TdxEdit;
    edtminquantity2zx: TdxEdit;
    edtminquantity3zx: TdxEdit;
    edtminquantity4zx: TdxEdit;
    edtminquantity5zx: TdxEdit;
    edtminquantity6zx: TdxEdit;
    edtminquantity7zx: TdxEdit;
    edtpricezx: TdxEdit;
    GMSStickyLabel92: TGMSStickyLabel;
    GMSStickyLabel93: TGMSStickyLabel;
    GMSStickyLabel94: TGMSStickyLabel;
    GMSStickyLabel95: TGMSStickyLabel;
    GMSStickyLabel96: TGMSStickyLabel;
    GMSStickyLabel97: TGMSStickyLabel;
    GMSStickyLabel98: TGMSStickyLabel;
    GMSStickyLabel99: TGMSStickyLabel;
    edtnetweightzxgzl: TdxEdit;
    edtnetweight1zxgzl: TdxEdit;
    edtnetweight2zxgzl: TdxEdit;
    edtnetweight3zxgzl: TdxEdit;
    edtnetweight4zxgzl: TdxEdit;
    edtnetweight5zxgzl: TdxEdit;
    edtnetweight6zxgzl: TdxEdit;
    edtnetweight7zxgzl: TdxEdit;
    GMSStickyLabel100: TGMSStickyLabel;
    GMSStickyLabel101: TGMSStickyLabel;
    GMSStickyLabel102: TGMSStickyLabel;
    GMSStickyLabel103: TGMSStickyLabel;
    GMSStickyLabel104: TGMSStickyLabel;
    GMSStickyLabel105: TGMSStickyLabel;
    GMSStickyLabel106: TGMSStickyLabel;
    GMSStickyLabel107: TGMSStickyLabel;
    GMSStickyLabel108: TGMSStickyLabel;
    GMSStickyLabel109: TGMSStickyLabel;
    GMSStickyLabel110: TGMSStickyLabel;
    GMSStickyLabel111: TGMSStickyLabel;
    GMSStickyLabel112: TGMSStickyLabel;
    GMSStickyLabel113: TGMSStickyLabel;
    GMSStickyLabel114: TGMSStickyLabel;
    GMSStickyLabel115: TGMSStickyLabel;
    GMSStickyLabel116: TGMSStickyLabel;
    GMSStickyLabel117: TGMSStickyLabel;
    GMSStickyLabel118: TGMSStickyLabel;
    GMSStickyLabel119: TGMSStickyLabel;
    GMSStickyLabel120: TGMSStickyLabel;
    GMSStickyLabel121: TGMSStickyLabel;
    GMSStickyLabel122: TGMSStickyLabel;
    GMSStickyLabel123: TGMSStickyLabel;
    GMSStickyLabel124: TGMSStickyLabel;
    GMSStickyLabel125: TGMSStickyLabel;
    GMSStickyLabel126: TGMSStickyLabel;
    edtopnameqt: TdxButtonEdit;
    edtopname1qt: TdxButtonEdit;
    edtopname2qt: TdxButtonEdit;
    edtopname3qt: TdxButtonEdit;
    edtopname4qt: TdxButtonEdit;
    edtopname5qt: TdxButtonEdit;
    edtopname6qt: TdxButtonEdit;
    edtopname7qt: TdxButtonEdit;
    edtnetweightqt: TdxEdit;
    edtnetweight1qt: TdxEdit;
    edtnetweight2qt: TdxEdit;
    edtnetweight3qt: TdxEdit;
    edtnetweight4qt: TdxEdit;
    edtnetweight5qt: TdxEdit;
    edtnetweight6qt: TdxEdit;
    edtnetweight7qt: TdxEdit;
    edtlocationbillnoqt: TdxEdit;
    edtnetweighttotalqt: TdxEdit;
    btnCancelqt: TKBitBtn;
    btnOkqt: TKBitBtn;
    btnSharingqt: TKBitBtn;
    edtminquantityqt: TdxEdit;
    edtminquantity1qt: TdxEdit;
    edtminquantity2qt: TdxEdit;
    edtminquantity3qt: TdxEdit;
    edtminquantity4qt: TdxEdit;
    edtminquantity5qt: TdxEdit;
    edtminquantity6qt: TdxEdit;
    edtminquantity7qt: TdxEdit;
    edtpriceqt: TdxEdit;
    GMSStickyLabel127: TGMSStickyLabel;
    GMSStickyLabel128: TGMSStickyLabel;
    GMSStickyLabel129: TGMSStickyLabel;
    GMSStickyLabel130: TGMSStickyLabel;
    GMSStickyLabel148: TGMSStickyLabel;
    GMSStickyLabel149: TGMSStickyLabel;
    GMSStickyLabel150: TGMSStickyLabel;
    GMSStickyLabel151: TGMSStickyLabel;
    edtnetweightqtgzl: TdxEdit;
    edtnetweight1qtgzl: TdxEdit;
    edtnetweight2qtgzl: TdxEdit;
    edtnetweight3qtgzl: TdxEdit;
    edtnetweight4qtgzl: TdxEdit;
    edtnetweight5qtgzl: TdxEdit;
    edtnetweight6qtgzl: TdxEdit;
    edtnetweight7qtgzl: TdxEdit;
    GMSStickyLabel152: TGMSStickyLabel;
    edtopname8zx: TdxButtonEdit;
    edtnetweight8zx: TdxEdit;
    GMSStickyLabel153: TGMSStickyLabel;
    GMSStickyLabel154: TGMSStickyLabel;
    edtnetweight8zxgzl: TdxEdit;
    GMSStickyLabel155: TGMSStickyLabel;
    edtminquantity8zx: TdxEdit;
    GMSStickyLabel156: TGMSStickyLabel;
    edtopname9zx: TdxButtonEdit;
    edtnetweight9zx: TdxEdit;
    GMSStickyLabel157: TGMSStickyLabel;
    GMSStickyLabel158: TGMSStickyLabel;
    edtnetweight9zxgzl: TdxEdit;
    GMSStickyLabel159: TGMSStickyLabel;
    edtminquantity9zx: TdxEdit;
    GMSStickyLabel160: TGMSStickyLabel;
    edtopname10zx: TdxButtonEdit;
    edtnetweight10zx: TdxEdit;
    GMSStickyLabel161: TGMSStickyLabel;
    GMSStickyLabel162: TGMSStickyLabel;
    edtnetweight10zxgzl: TdxEdit;
    GMSStickyLabel163: TGMSStickyLabel;
    edtminquantity10zx: TdxEdit;
    GMSStickyLabel164: TGMSStickyLabel;
    edtopname11zx: TdxButtonEdit;
    edtnetweight11zx: TdxEdit;
    GMSStickyLabel165: TGMSStickyLabel;
    GMSStickyLabel166: TGMSStickyLabel;
    edtnetweight11zxgzl: TdxEdit;
    GMSStickyLabel167: TGMSStickyLabel;
    edtminquantity11zx: TdxEdit;
    GMSStickyLabel168: TGMSStickyLabel;
    edtopname8qt: TdxButtonEdit;
    GMSStickyLabel169: TGMSStickyLabel;
    edtnetweight8qt: TdxEdit;
    GMSStickyLabel170: TGMSStickyLabel;
    edtnetweight8qtgzl: TdxEdit;
    GMSStickyLabel171: TGMSStickyLabel;
    edtminquantity8qt: TdxEdit;
    GMSStickyLabel172: TGMSStickyLabel;
    edtopname9qt: TdxButtonEdit;
    GMSStickyLabel173: TGMSStickyLabel;
    edtnetweight9qt: TdxEdit;
    GMSStickyLabel174: TGMSStickyLabel;
    edtnetweight9qtgzl: TdxEdit;
    GMSStickyLabel175: TGMSStickyLabel;
    edtminquantity9qt: TdxEdit;
    edtopnamejl1: TdxButtonEdit;
    edtnetweightjl1: TdxEdit;
    edtnetweightjl1gzl: TdxEdit;
    edtminquantityjl1: TdxEdit;
    GMSStickyLabel176: TGMSStickyLabel;
    GMSStickyLabel177: TGMSStickyLabel;
    GMSStickyLabel178: TGMSStickyLabel;
    GMSStickyLabel179: TGMSStickyLabel;
    GMSStickyLabel180: TGMSStickyLabel;
    GMSStickyLabel181: TGMSStickyLabel;
    edtpricecc3: TdxEdit;
    GMSStickyLabel182: TGMSStickyLabel;
    edtpricecc2: TdxEdit;
    GMSStickyLabel183: TGMSStickyLabel;
    GMSStickyLabel184: TGMSStickyLabel;
    GMSStickyLabel185: TGMSStickyLabel;
    edtpricecc4: TdxEdit;
    GMSStickyLabel186: TGMSStickyLabel;
    edtpricecc5: TdxEdit;
    GMSStickyLabel187: TGMSStickyLabel;
    edtpricecc6: TdxEdit;
    GMSStickyLabel188: TGMSStickyLabel;
    edtpricecc7: TdxEdit;
    GMSStickyLabel189: TGMSStickyLabel;
    GMSStickyLabel190: TGMSStickyLabel;
    edtpricecc8: TdxEdit;
    GMSStickyLabel191: TGMSStickyLabel;
    edtpricecc1: TdxEdit;
    GMSStickyLabel192: TGMSStickyLabel;
    edtpricezx1: TdxEdit;
    GMSStickyLabel193: TGMSStickyLabel;
    edtpricezx2: TdxEdit;
    GMSStickyLabel194: TGMSStickyLabel;
    edtpricezx3: TdxEdit;
    GMSStickyLabel195: TGMSStickyLabel;
    edtpricezx4: TdxEdit;
    GMSStickyLabel196: TGMSStickyLabel;
    edtpricezx5: TdxEdit;
    GMSStickyLabel197: TGMSStickyLabel;
    GMSStickyLabel198: TGMSStickyLabel;
    edtpricezx6: TdxEdit;
    GMSStickyLabel199: TGMSStickyLabel;
    edtpricezx10: TdxEdit;
    GMSStickyLabel200: TGMSStickyLabel;
    edtpricezx11: TdxEdit;
    GMSStickyLabel201: TGMSStickyLabel;
    edtpricezx7: TdxEdit;
    GMSStickyLabel202: TGMSStickyLabel;
    edtpricezx8: TdxEdit;
    GMSStickyLabel203: TGMSStickyLabel;
    edtpricezx9: TdxEdit;
    GMSStickyLabel204: TGMSStickyLabel;
    edtpricezx12: TdxEdit;
    GMSStickyLabel205: TGMSStickyLabel;
    edtpricejl1: TdxEdit;
    GMSStickyLabel206: TGMSStickyLabel;
    edtpricekg3: TdxEdit;
    GMSStickyLabel207: TGMSStickyLabel;
    edtpricejl2: TdxEdit;
    GMSStickyLabel208: TGMSStickyLabel;
    edtpricekg1: TdxEdit;
    GMSStickyLabel209: TGMSStickyLabel;
    edtpricekg2: TdxEdit;
    GMSStickyLabel210: TGMSStickyLabel;
    edtpricekg4: TdxEdit;
    GMSStickyLabel211: TGMSStickyLabel;
    edtpricekg5: TdxEdit;
    GMSStickyLabel212: TGMSStickyLabel;
    edtpricekg6: TdxEdit;
    GMSStickyLabel213: TGMSStickyLabel;
    edtpricekg7: TdxEdit;
    GMSStickyLabel214: TGMSStickyLabel;
    edtpricekg8: TdxEdit;
    GMSStickyLabel215: TGMSStickyLabel;
    GMSStickyLabel216: TGMSStickyLabel;
    edtopname12zx: TdxButtonEdit;
    GMSStickyLabel217: TGMSStickyLabel;
    edtnetweight12zx: TdxEdit;
    GMSStickyLabel218: TGMSStickyLabel;
    edtnetweight12zxgzl: TdxEdit;
    GMSStickyLabel219: TGMSStickyLabel;
    edtminquantity12zx: TdxEdit;
    GMSStickyLabel220: TGMSStickyLabel;
    edtpricezx13: TdxEdit;
    GMSStickyLabel221: TGMSStickyLabel;
    edtopname13zx: TdxButtonEdit;
    GMSStickyLabel222: TGMSStickyLabel;
    edtnetweight13zx: TdxEdit;
    GMSStickyLabel223: TGMSStickyLabel;
    edtnetweight13zxgzl: TdxEdit;
    GMSStickyLabel224: TGMSStickyLabel;
    edtminquantity13zx: TdxEdit;
    GMSStickyLabel225: TGMSStickyLabel;
    edtpricezx14: TdxEdit;
    GMSStickyLabel226: TGMSStickyLabel;
    edtopname14zx: TdxButtonEdit;
    GMSStickyLabel227: TGMSStickyLabel;
    edtnetweight14zx: TdxEdit;
    GMSStickyLabel228: TGMSStickyLabel;
    edtnetweight14zxgzl: TdxEdit;
    GMSStickyLabel229: TGMSStickyLabel;
    edtminquantity14zx: TdxEdit;
    GMSStickyLabel230: TGMSStickyLabel;
    edtpricezx15: TdxEdit;
    GMSStickyLabel231: TGMSStickyLabel;
    edtopname15zx: TdxButtonEdit;
    GMSStickyLabel232: TGMSStickyLabel;
    edtnetweight15zx: TdxEdit;
    GMSStickyLabel233: TGMSStickyLabel;
    edtnetweight15zxgzl: TdxEdit;
    GMSStickyLabel234: TGMSStickyLabel;
    edtminquantity15zx: TdxEdit;
    GMSStickyLabel235: TGMSStickyLabel;
    edtpricezx16: TdxEdit;
    GMSStickyLabel236: TGMSStickyLabel;
    edtopname16zx: TdxButtonEdit;
    GMSStickyLabel237: TGMSStickyLabel;
    edtnetweight16zx: TdxEdit;
    GMSStickyLabel238: TGMSStickyLabel;
    edtnetweight16zxgzl: TdxEdit;
    GMSStickyLabel239: TGMSStickyLabel;
    edtminquantity16zx: TdxEdit;
    GMSStickyLabel240: TGMSStickyLabel;
    edtpricezx17: TdxEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelkgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtopnamekgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname1kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname2kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname3kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname5kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname6kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname7kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnOkkgClick(Sender: TObject);
    procedure radquantitytypeClick(Sender: TObject);
    procedure btnSharingkgClick(Sender: TObject);
    procedure edtopname4kgButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopnamejlButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnOkccClick(Sender: TObject);
    procedure btnSharingccClick(Sender: TObject);
    procedure btnSharingzxClick(Sender: TObject);
    procedure btnOkzxClick(Sender: TObject);
    procedure btnOkqtClick(Sender: TObject);
    procedure btnSharingqtClick(Sender: TObject);
    procedure edtopnameccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname1ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname2ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname3ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname4ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname5ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname6ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname7ccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopnamezxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname1zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname2zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname3zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname4zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname5zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname6zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname7zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopnameqtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname1qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname2qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname3qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname4qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname5qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname6qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname7qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopnamejl1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname8zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname9zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname10zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname11zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname8qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname9qtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure pgcLocationINOUTChange(Sender: TObject);
    procedure edtopname12zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname13zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname14zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname15zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname16zxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    netweight,piece,volume,quantity,grossweight,casing5:Extended;
    strtable,strtabledetail,strjobno,strlocationbillno,strdate,strcustomsno,strcusbillno,strforktype:string;
    procedure  checkforkwork;

  public
    { Public declarations }

  end;

procedure Workforkworknew(pstrjobno:string;pstrtype:string;pstforktype:string);

var
   frmforkworknew: Tfrmforkworknew;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub,forkworkload;

procedure Workforkworknew(pstrjobno:string;pstrtype:string;pstforktype:string);
begin
   if frmforkworknew <> nil then
   with frmforkworknew do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmforkworknew:=Tfrmforkworknew.Create(Application);
   with frmforkworknew do
   begin
     strforktype:=pstforktype;
     //lzw20090622
     if strforktype='F' then
     begin
        pgcLocationINOUT.ActivePage:=tbsCasing;
     end;
     if strforktype='T' then
     begin
        pgcLocationINOUT.ActivePage:=tbsInfo;
     end;
     if strforktype='Z' then
     begin
        pgcLocationINOUT.ActivePage:=tbsSKU;
     end;
     if strforktype='Q' then
     begin
        pgcLocationINOUT.ActivePage:=tbsautoCost;
     end;
     //dwq考虑到移仓和其他操作
     if pstrtype='LI' then //进仓
     begin
        strtable:='locationin' ;
        strtabledetail:='locationinitem';
     end else
     if pstrtype='LO' then //出仓
     begin
        strtable:='locationout' ;
        strtabledetail:='locationoutitem';
     end else
     if pstrtype='ML' then //移仓
     begin
        strtable:='moveloc';
        strtabledetail:='movelocold';
     end else
     if pstrtype='QT' then //其他操作
     begin
        strtable:='locationother';
        strtabledetail:='locationothertask';
     end;
     OpenSql(dataTmp.qryTmp2,'select inout.jobno,inout.locationbillno,inout.customsno,inout.cusbillno,  '+chr(13)+chr(10)
                           +'       opdate=convert(varchar(10),inout.operationdate,102),'+chr(13)+chr(10)
                           +'       piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                           +'       quantity=sum(isnull(detail.quantity,0)),'+chr(13)+chr(10)
                           +'       volume=sum(isnull(detail.volume,0)),'+chr(13)+chr(10)
                           +'       grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                           +'       netweight=sum(isnull(detail.netweight,0)),'+chr(13)+chr(10)
                           +'       casing5=sum(isnull(detail.casing5,0))'+chr(13)+chr(10)
                           +'  from '+strtable+' inout left join '+strtabledetail+' detail  '+chr(13)+chr(10)
                           +'                                 on inout.jobno=detail.jobno '+chr(13)+chr(10)
                           +' where inout.jobno="'+pstrjobno+'"   '+chr(13)+chr(10)
                           +' group by inout.jobno,inout.locationbillno,inout.customsno,inout.cusbillno, '+chr(13)+chr(10)
                           +'          convert(varchar(10),inout.operationdate,102) '+chr(13)+chr(10)
                           );
     strjobno:=pstrjobno;
     strcusbillno:=dataTmp.qryTmp2.FieldByName('cusbillno').AsString;
     strlocationbillno:=dataTmp.qryTmp2.FieldByName('locationbillno').AsString;
     strdate:=dataTmp.qryTmp2.FieldByName('opdate').AsString;
     //dwq根据取数量等判断工作量取什么数值
     grossweight:=dataTmp.qryTmp2.FieldByName('grossweight').AsFloat;
     edtlocationbillnokg.Text:=strlocationbillno;
     edtnetweighttotalkg.Text:=FloatToStr(grossweight);

     edtlocationbillnocc.Text:=strlocationbillno;
     edtnetweighttotalcc.Text:=FloatToStr(grossweight);

     edtlocationbillnozx.Text:=strlocationbillno;
     edtnetweighttotalzx.Text:=FloatToStr(grossweight);

     edtlocationbillnoqt.Text:=strlocationbillno;
     edtnetweighttotalqt.Text:=FloatToStr(grossweight);
     edtnetweightjl.Text:=FloatToStr(grossweight);
     edtnetweightjl1.Text:=FloatToStr(grossweight);
     showmodal;
   end;
end;

procedure Tfrmforkworknew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmforkworknew.btnCancelkgClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmforkworknew.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
  // SetGroupbox(GroupBox1);
end;

procedure Tfrmforkworknew.FormDestroy(Sender: TObject);
begin
   frmforkworknew:=nil;
end;

procedure Tfrmforkworknew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure Tfrmforkworknew.edtopnamekgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:integer;
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   i:=qrySelect.RecordCount;
   qrySelect.First;
   while i>0 do
   begin
      if i=8  then
      begin
         edtopname7kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname7kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=7  then
      begin
         edtopname6kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname6kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=6  then
      begin
         edtopname5kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname5kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=5  then
      begin
         edtopname4kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname4kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=4  then
      begin
         edtopname3kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname3kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=3  then
      begin
         edtopname2kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname2kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=2  then
      begin
         edtopname1kg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname1kg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=1  then
      begin
         edtopnamekg.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopnamekg.Text  :=qrySelect.FieldByName('opname').asstring;
      end;

      i:=i-1;
      qryselect.Next;
   end;
end;

procedure Tfrmforkworknew.edtopname1kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname1kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname1kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname2kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname2kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname2kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname3kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname3kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname3kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname4kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname4kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname4kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname5kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname5kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname5kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname6kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname6kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname6kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname7kgButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname7kg.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname7kg.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.btnOkkgClick(Sender: TObject);
var
   maxsno:Integer;
   strnetweight,strnetweightgzl:string;
   strprice:string;
   strminquantity,strminquantity1,strminquantity2,strminquantity3,strminquantity4,strminquantity5,strminquantity6,strminquantity7:string;
begin
   strforktype:='T';
   OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         +'  and isnull(forktype,"F")="'+strforktype+'" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp1.RecordCount<>0 then
   begin
      KMessageDlg('该票业务的已分摊！',mtWarning,[mbOK],0);
      Exit;
   end;
   if edtpricekg.Text='' then
   begin
      KmessageDlg('库管单价不能为空!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   if edtpricejl.Text='' then
   begin
      KmessageDlg('值班单价不能为空!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   if ((edtopnamejl.Text='') and (edtopnamejl1.Text='') and(edtopnamekg.Text='') and(edtopname1kg.Text='') and (edtopname2kg.Text='') and
      (edtopname3kg.Text='') and(edtopname4kg.Text='') and (edtopname5kg.Text='') and (edtopname6kg.Text='') and (edtopname7kg.Text='')) then
   begin
      KmessageDlg('没有安排工作人员!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;

   if ((edtnetweightjl.Text='') and (edtnetweightjl1.Text='') and (edtnetweight1kg.Text='') and (edtnetweight2kg.Text='') and
      (edtnetweight3kg.Text='') and (edtnetweight4kg.Text='') and (edtnetweight5kg.Text='') and (edtnetweight6kg.Text='') and (edtnetweight7kg.Text='')) then
   begin
      KmessageDlg('没有安排工作量!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   OpenSql(dataTmp.qryTmp,'select sno=max(sno) from forkworkload (nolock)'+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         );
   maxsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
   maxsno:=maxsno+1;
   if KmessageDlg('确定这样安排工作量吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      if edtopnamejl.Text<>'' then
      begin
         strnetweight:=edtnetweightjl.Text;
         strnetweightgzl:=edtnetweightjlgzl.Text;
         strprice:=iif(edtpricejl1.Text<>'',edtpricejl1.Text,edtpricejl.Text);
         strminquantity:=iif(edtminquantityjl.Text<>'',edtminquantityjl.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnamejl.TextField+'","'+edtopnamejl.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopnamejl1.Text<>'' then
      begin
         strnetweight:=edtnetweightjl1.Text;
         strnetweightgzl:=edtnetweightjl1gzl.Text;
         strprice:=iif(edtpricejl2.Text<>'',edtpricejl2.Text,edtpricejl.Text);
         strminquantity:=iif(edtminquantityjl1.Text<>'',edtminquantityjl1.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnamejl1.TextField+'","'+edtopnamejl1.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopnamekg.Text<>'' then
      begin
         strnetweight:=edtnetweightkg.Text;
         strnetweightgzl:=edtnetweightkggzl.Text;
         strprice:=iif(edtpricekg1.Text<>'',edtpricekg1.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity.Text<>'',edtminquantity.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnamekg.TextField+'","'+edtopnamekg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname1kg.Text<>'' then
      begin
         strnetweight:=edtnetweight1kg.Text;
         strnetweightgzl:=edtnetweight1kggzl.Text;
         strprice:=iif(edtpricekg2.Text<>'',edtpricekg2.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity1.Text<>'',edtminquantity1.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname1kg.TextField+'","'+edtopname1kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname2kg.Text<>'' then
      begin
         strnetweight:=edtnetweight2kg.Text;
         strnetweightgzl:=edtnetweight2kggzl.Text;
         strprice:=iif(edtpricekg3.Text<>'',edtpricekg3.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity2.Text<>'',edtminquantity2.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname2kg.TextField+'","'+edtopname2kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname3kg.Text<>'' then
      begin
         strnetweight:=edtnetweight3kg.Text;
         strnetweightgzl:=edtnetweight3kggzl.Text;
         strprice:=iif(edtpricekg4.Text<>'',edtpricekg4.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity3.Text<>'',edtminquantity3.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname3kg.TextField+'","'+edtopname3kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname4kg.Text<>'' then
      begin
         strnetweight:=edtnetweight4kg.Text;
         strnetweightgzl:=edtnetweight4kggzl.Text;
         strprice:=iif(edtpricekg5.Text<>'',edtpricekg5.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity4.Text<>'',edtminquantity4.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname4kg.TextField+'","'+edtopname4kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname5kg.Text<>'' then
      begin
         strnetweight:=edtnetweight5kg.Text;
         strnetweightgzl:=edtnetweight5kggzl.Text;
         strprice:=iif(edtpricekg6.Text<>'',edtpricekg6.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity5.Text<>'',edtminquantity5.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname5kg.TextField+'","'+edtopname5kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname6kg.Text<>'' then
      begin
         strnetweight:=edtnetweight6kg.Text;
         strnetweightgzl:=edtnetweight6kggzl.Text;
         strprice:=iif(edtpricekg7.Text<>'',edtpricekg7.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity6.Text<>'',edtminquantity6.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname6kg.TextField+'","'+edtopname6kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname7kg.Text<>'' then
      begin
         strnetweight:=edtnetweight7kg.Text;
         strnetweightgzl:=edtnetweight7kggzl.Text;
         strprice:=iif(edtpricekg8.Text<>'',edtpricekg8.Text,edtpricekg.Text);
         strminquantity:=iif(edtminquantity7.Text<>'',edtminquantity7.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname7kg.TextField+'","'+edtopname7kg.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
   end;
end;

procedure Tfrmforkworknew.radquantitytypeClick(Sender: TObject);
begin
   if radquantitytype.ItemIndex=0 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      piece:=dataTmp.qryTmp2.FieldByName('piece').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(piece);
      edtnetweightjl.Text:=FloatToStr(piece);
      edtnetweightjl1.Text:=FloatToStr(piece);
      edtnetweighttotalcc.Text:=FloatToStr(piece);
      edtnetweighttotalzx.Text:=FloatToStr(piece);
      edtnetweighttotalqt.Text:=FloatToStr(piece);

      GMSStickyLabel117.Caption:='件数总工作量';
      GMSStickyLabel82.Caption:='件数总工作量';
      GMSStickyLabel49.Caption:='件数总工作量';
      GMSStickyLabel18.Caption:='件数总工作量';
   end else
   if radquantitytype.ItemIndex=1 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      grossweight:=dataTmp.qryTmp2.FieldByName('grossweight').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(grossweight);
      edtnetweightjl.Text:=FloatToStr(grossweight);
      edtnetweightjl1.Text:=FloatToStr(grossweight);
      edtnetweighttotalcc.Text:=FloatToStr(grossweight);
      edtnetweighttotalzx.Text:=FloatToStr(grossweight);
      edtnetweighttotalqt.Text:=FloatToStr(grossweight);

      GMSStickyLabel117.Caption:='毛重总工作量';
      GMSStickyLabel82.Caption:='毛重总工作量';
      GMSStickyLabel49.Caption:='毛重总工作量';
      GMSStickyLabel18.Caption:='毛重总工作量';
   end else
   if radquantitytype.ItemIndex=2 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      netweight:=dataTmp.qryTmp2.FieldByName('netweight').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(netweight);
      edtnetweightjl.Text:=FloatToStr(netweight);
      edtnetweightjl1.Text:=FloatToStr(netweight);
      edtnetweighttotalcc.Text:=FloatToStr(netweight);
      edtnetweighttotalzx.Text:=FloatToStr(netweight);
      edtnetweighttotalqt.Text:=FloatToStr(netweight);

      GMSStickyLabel117.Caption:='净重总工作量';
      GMSStickyLabel82.Caption:='净重总工作量';
      GMSStickyLabel49.Caption:='净重总工作量';
      GMSStickyLabel18.Caption:='净重总工作量';

   end else
   if radquantitytype.ItemIndex=3 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      quantity:=dataTmp.qryTmp2.FieldByName('quantity').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(quantity);
      edtnetweightjl.Text:=FloatToStr(quantity);
      edtnetweightjl1.Text:=FloatToStr(quantity);
      edtnetweighttotalcc.Text:=FloatToStr(quantity);
      edtnetweighttotalzx.Text:=FloatToStr(quantity);
      edtnetweighttotalqt.Text:=FloatToStr(quantity);

      GMSStickyLabel117.Caption:='数量总工作量';
      GMSStickyLabel82.Caption:='数量总工作量';
      GMSStickyLabel49.Caption:='数量总工作量';
      GMSStickyLabel18.Caption:='数量总工作量';

   end else
   if radquantitytype.ItemIndex=4 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      volume:=dataTmp.qryTmp2.FieldByName('volume').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(volume);
      edtnetweightjl.Text:=FloatToStr(volume);
      edtnetweightjl1.Text:=FloatToStr(volume);
      edtnetweighttotalcc.Text:=FloatToStr(volume);
      edtnetweighttotalzx.Text:=FloatToStr(volume);
      edtnetweighttotalqt.Text:=FloatToStr(volume);
      GMSStickyLabel117.Caption:='体积总工作量';
      GMSStickyLabel82.Caption:='体积总工作量';
      GMSStickyLabel49.Caption:='体积总工作量';
      GMSStickyLabel18.Caption:='体积总工作量';

   end;
   if radquantitytype.ItemIndex=5 then
   begin
      edtnetweightkg.Text:='';
      edtnetweight1kg.Text:='';
      edtnetweight2kg.Text:='';
      edtnetweight3kg.Text:='';
      edtnetweight4kg.Text:='';
      edtnetweight5kg.Text:='';
      edtnetweight6kg.Text:='';
      edtnetweight7kg.Text:='';
      edtnetweightkggzl.Text:='';
      edtnetweight1kggzl.Text:='';
      edtnetweight2kggzl.Text:='';
      edtnetweight3kggzl.Text:='';
      edtnetweight4kggzl.Text:='';
      edtnetweight5kggzl.Text:='';
      edtnetweight6kggzl.Text:='';
      edtnetweight7kggzl.Text:='';

      edtnetweightcc.Text:='';
      edtnetweight1cc.Text:='';
      edtnetweight2cc.Text:='';
      edtnetweight3cc.Text:='';
      edtnetweight4cc.Text:='';
      edtnetweight5cc.Text:='';
      edtnetweight6cc.Text:='';
      edtnetweight7cc.Text:='';
      edtnetweightccgzl.Text:='';
      edtnetweight1ccgzl.Text:='';
      edtnetweight2ccgzl.Text:='';
      edtnetweight3ccgzl.Text:='';
      edtnetweight4ccgzl.Text:='';
      edtnetweight5ccgzl.Text:='';
      edtnetweight6ccgzl.Text:='';
      edtnetweight7ccgzl.Text:='';

      edtnetweightzx.Text:='';
      edtnetweight1zx.Text:='';
      edtnetweight2zx.Text:='';
      edtnetweight3zx.Text:='';
      edtnetweight4zx.Text:='';
      edtnetweight5zx.Text:='';
      edtnetweight6zx.Text:='';
      edtnetweight7zx.Text:='';
      edtnetweight8zx.Text:='';
      edtnetweight9zx.Text:='';
      edtnetweight10zx.Text:='';
      edtnetweight11zx.Text:='';

      edtnetweightzxgzl.Text:='';
      edtnetweight1zxgzl.Text:='';
      edtnetweight2zxgzl.Text:='';
      edtnetweight3zxgzl.Text:='';
      edtnetweight4zxgzl.Text:='';
      edtnetweight5zxgzl.Text:='';
      edtnetweight6zxgzl.Text:='';
      edtnetweight7zxgzl.Text:='';
      edtnetweight8zxgzl.Text:='';
      edtnetweight9zxgzl.Text:='';
      edtnetweight10zxgzl.Text:='';
      edtnetweight11zxgzl.Text:='';

      edtnetweightqt.Text:='';
      edtnetweight1qt.Text:='';
      edtnetweight2qt.Text:='';
      edtnetweight3qt.Text:='';
      edtnetweight4qt.Text:='';
      edtnetweight5qt.Text:='';
      edtnetweight6qt.Text:='';
      edtnetweight7qt.Text:='';
      edtnetweight8qt.Text:='';
      edtnetweight9qt.Text:='';
      edtnetweightqtgzl.Text:='';
      edtnetweight1qtgzl.Text:='';
      edtnetweight2qtgzl.Text:='';
      edtnetweight3qtgzl.Text:='';
      edtnetweight4qtgzl.Text:='';
      edtnetweight5qtgzl.Text:='';
      edtnetweight6qtgzl.Text:='';
      edtnetweight7qtgzl.Text:='';
      edtnetweight8qtgzl.Text:='';
      edtnetweight9qtgzl.Text:='';
      casing5:=dataTmp.qryTmp2.FieldByName('casing5').AsFloat;
      edtnetweighttotalkg.Text:=FloatToStr(casing5);
      edtnetweightjl.Text:=FloatToStr(casing5);
      edtnetweightjl1.Text:=FloatToStr(casing5);
      edtnetweighttotalcc.Text:=FloatToStr(casing5);
      edtnetweighttotalzx.Text:=FloatToStr(casing5);
      edtnetweighttotalqt.Text:=FloatToStr(casing5);
      GMSStickyLabel117.Caption:='过磅总工作量';
      GMSStickyLabel82.Caption:='过磅总工作量';
      GMSStickyLabel49.Caption:='过磅总工作量';
      GMSStickyLabel18.Caption:='过磅总工作量';

   end;
end;

procedure Tfrmforkworknew.btnSharingkgClick(Sender: TObject);
var
   num,maxsno:Integer;
   strnetweight,costquantity:string;
begin
   strforktype:='T';
   checkforkwork;
   num:=0;
   if edtopnamekg.Text<>'' then
      num:=num+1;
   if edtopname1kg.Text<>'' then
      num:=num+1;
   if edtopname2kg.Text<>'' then
      num:=num+1;
   if edtopname3kg.Text<>'' then
      num:=num+1;
   if edtopname4kg.Text<>'' then
      num:=num+1;
   if edtopname5kg.Text<>'' then
      num:=num+1;
   if edtopname6kg.Text<>'' then
      num:=num+1;
   if edtopname7kg.Text<>'' then
      num:=num+1;
   costquantity :=edtnetweighttotalkg.Text;

   strnetweight:=FloatToStr(StrToFloat(costquantity)/num);
   if edtopnamejl.Text<>'' then
      edtnetweightjlgzl.Text:=edtnetweightjl.Text;
   if edtopnamejl1.Text<>'' then
      edtnetweightjl1gzl.Text:=edtnetweightjl1.Text;
   if edtopnamekg.Text<>'' then
      edtnetweightkg.Text:=strnetweight;
      edtnetweightkggzl.Text:=edtnetweightkg.Text;
   if edtopname1kg.Text<>'' then
      edtnetweight1kg.Text:=strnetweight;
      edtnetweight1kggzl.Text:=edtnetweight1kg.Text;
   if edtopname2kg.Text<>'' then
      edtnetweight2kg.Text:=strnetweight;
      edtnetweight2kggzl.Text:=edtnetweight2kg.Text;
   if edtopname3kg.Text<>'' then
      edtnetweight3kg.Text:=strnetweight;
      edtnetweight3kggzl.Text:=edtnetweight3kg.Text;
   if edtopname4kg.Text<>'' then
      edtnetweight4kg.Text:=strnetweight;
      edtnetweight4kggzl.Text:=edtnetweight4kg.Text;
   if edtopname5kg.Text<>'' then
      edtnetweight5kg.Text:=strnetweight;
      edtnetweight5kggzl.Text:=edtnetweight5kg.Text;
   if edtopname6kg.Text<>'' then
      edtnetweight6kg.Text:=strnetweight;
      edtnetweight6kggzl.Text:=edtnetweight6kg.Text;
   if edtopname7kg.Text<>'' then
      edtnetweight7kg.Text:=strnetweight;
      edtnetweight7kggzl.Text:=edtnetweight7kg.Text;
end;

//dwq增加一个是否已经分摊的事件，在分摊事件和radworktypeClick事件中调用
procedure Tfrmforkworknew.checkforkwork;
{变量值更新数据库前,对值处理过程}
begin
   OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         +'  and isnull(forktype,"F")="'+strforktype+'" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp1.RecordCount<>0 then
   begin
      KMessageDlg('该票业务的已分摊！',mtWarning,[mbOK],0);
      Exit;
   end;
end;

procedure Tfrmforkworknew.edtopnamejlButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopnamejl.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopnamejl.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.btnOkccClick(Sender: TObject);
var
   maxsno:Integer;
   strnetweight,strnetweightgzl:string;
   strprice:string;
   strminquantity,strminquantity1,strminquantity2,strminquantity3,strminquantity4,strminquantity5,strminquantity6,strminquantity7:string;
begin
   strforktype:='F';
   OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         +'  and isnull(forktype,"F")="'+strforktype+'" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp1.RecordCount<>0 then
   begin
      KMessageDlg('该票业务的已分摊！',mtWarning,[mbOK],0);
      Exit;
   end;
   if edtpricecc.Text='' then
   begin
      KmessageDlg('叉车单价不能为空!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   if ((edtopnamecc.Text='') and(edtopname1cc.Text='') and (edtopname2cc.Text='') and (edtopname3cc.Text='') and
      (edtopname4cc.Text='') and (edtopname5cc.Text='') and (edtopname6cc.Text='') and (edtopname7cc.Text='')) then
   begin
      KmessageDlg('没有安排工作人员!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;

   if ((edtnetweightcc.Text='') and(edtnetweight1cc.Text='') and (edtnetweight2cc.Text='') and (edtnetweight3cc.Text='') and
      (edtnetweight4cc.Text='') and (edtnetweight5cc.Text='') and (edtnetweight6cc.Text='') and (edtnetweight7cc.Text='')) then
   begin
      KmessageDlg('没有安排工作量!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   OpenSql(dataTmp.qryTmp,'select sno=max(sno) from forkworkload (nolock)'+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         );
   maxsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
   maxsno:=maxsno+1;
   if KmessageDlg('确定这样安排工作量吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      if edtopnamecc.Text<>'' then
      begin
         strnetweight:=edtnetweightcc.Text;
         strnetweightgzl:=edtnetweightccgzl.Text;
         strprice:=iif(edtpricecc1.Text<>'',edtpricecc1.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantitycc.Text<>'',edtminquantitycc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnamecc.TextField+'","'+edtopnamecc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               //+'        '+edtminquantity.Text+'  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname1cc.Text<>'' then
      begin
         strnetweight:=edtnetweight1cc.Text;
         strnetweightgzl:=edtnetweight1ccgzl.Text;
         strprice:=iif(edtpricecc2.Text<>'',edtpricecc2.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity1cc.Text<>'',edtminquantity1cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname1cc.TextField+'","'+edtopname1cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname2cc.Text<>'' then
      begin
         strnetweight:=edtnetweight2cc.Text;
         strnetweightgzl:=edtnetweight2ccgzl.Text;
         strprice:=iif(edtpricecc3.Text<>'',edtpricecc3.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity2cc.Text<>'',edtminquantity2cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname2cc.TextField+'","'+edtopname2cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname3cc.Text<>'' then
      begin
         strnetweight:=edtnetweight3cc.Text;
         strnetweightgzl:=edtnetweight3ccgzl.Text;
         strprice:=iif(edtpricecc4.Text<>'',edtpricecc4.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity3cc.Text<>'',edtminquantity3cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname3cc.TextField+'","'+edtopname3cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname4cc.Text<>'' then
      begin
         strnetweight:=edtnetweight4cc.Text;
         strnetweightgzl:=edtnetweight4ccgzl.Text;
         strprice:=iif(edtpricecc5.Text<>'',edtpricecc5.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity4cc.Text<>'',edtminquantity4cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname4cc.TextField+'","'+edtopname4cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname5cc.Text<>'' then
      begin
         strnetweight:=edtnetweight5cc.Text;
         strnetweightgzl:=edtnetweight5ccgzl.Text;
         strprice:=iif(edtpricecc6.Text<>'',edtpricecc6.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity5cc.Text<>'',edtminquantity5cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname5cc.TextField+'","'+edtopname5cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname6cc.Text<>'' then
      begin
         strnetweight:=edtnetweight6cc.Text;
         strnetweightgzl:=edtnetweight6ccgzl.Text;
        strprice:=iif(edtpricecc7.Text<>'',edtpricecc7.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity6cc.Text<>'',edtminquantity6cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname6cc.TextField+'","'+edtopname6cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname7cc.Text<>'' then
      begin
         strnetweight:=edtnetweight7cc.Text;
         strnetweightgzl:=edtnetweight7ccgzl.Text;
         strprice:=iif(edtpricecc8.Text<>'',edtpricecc8.Text,edtpricecc.Text);
         strminquantity:=iif(edtminquantity7cc.Text<>'',edtminquantity7cc.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname7cc.TextField+'","'+edtopname7cc.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
   end;

end;

procedure Tfrmforkworknew.btnSharingccClick(Sender: TObject);
var
   num,maxsno:Integer;
   strnetweight,costquantity:string;
begin
   strforktype:='F';
   checkforkwork;
   num:=0;
   if edtopnamecc.Text<>'' then
      num:=num+1;
   if edtopname1cc.Text<>'' then
      num:=num+1;
   if edtopname2cc.Text<>'' then
      num:=num+1;
   if edtopname3cc.Text<>'' then
      num:=num+1;
   if edtopname4cc.Text<>'' then
      num:=num+1;
   if edtopname5cc.Text<>'' then
      num:=num+1;
   if edtopname6cc.Text<>'' then
      num:=num+1;
   if edtopname7cc.Text<>'' then
      num:=num+1;
   costquantity :=edtnetweighttotalcc.Text;

   strnetweight:=FloatToStr(StrToFloat(costquantity)/num);
   if edtopnamecc.Text<>'' then
      edtnetweightcc.Text:=strnetweight;
      edtnetweightccgzl.Text:=edtnetweightcc.Text;
   if edtopname1cc.Text<>'' then
      edtnetweight1cc.Text:=strnetweight;
      edtnetweight1ccgzl.Text:=edtnetweight1cc.Text;
   if edtopname2cc.Text<>'' then
      edtnetweight2cc.Text:=strnetweight;
      edtnetweight2ccgzl.Text:=edtnetweight2cc.Text;
   if edtopname3cc.Text<>'' then
      edtnetweight3cc.Text:=strnetweight;
      edtnetweight3ccgzl.Text:=edtnetweight3cc.Text;
   if edtopname4cc.Text<>'' then
      edtnetweight4cc.Text:=strnetweight;
      edtnetweight4ccgzl.Text:=edtnetweight4cc.Text;
   if edtopname5cc.Text<>'' then
      edtnetweight5cc.Text:=strnetweight;
      edtnetweight5ccgzl.Text:=edtnetweight5cc.Text;
   if edtopname6cc.Text<>'' then
      edtnetweight6cc.Text:=strnetweight;
      edtnetweight6ccgzl.Text:=edtnetweight6cc.Text;
   if edtopname7cc.Text<>'' then
      edtnetweight7cc.Text:=strnetweight;
      edtnetweight7ccgzl.Text:=edtnetweight7cc.Text;

end;

procedure Tfrmforkworknew.btnSharingzxClick(Sender: TObject);
var
   num,maxsno:Integer;
   strnetweight,costquantity:string;
begin
   strforktype:='Z';
   checkforkwork;
   num:=0;
   if edtopnamezx.Text<>'' then
      num:=num+1;
   if edtopname1zx.Text<>'' then
      num:=num+1;
   if edtopname2zx.Text<>'' then
      num:=num+1;
   if edtopname3zx.Text<>'' then
      num:=num+1;
   if edtopname4zx.Text<>'' then
      num:=num+1;
   if edtopname5zx.Text<>'' then
      num:=num+1;
   if edtopname6zx.Text<>'' then
      num:=num+1;
   if edtopname7zx.Text<>'' then
      num:=num+1;
   if edtopname8zx.Text<>'' then
      num:=num+1;
   if edtopname9zx.Text<>'' then
      num:=num+1;
   if edtopname10zx.Text<>'' then
      num:=num+1;
   if edtopname11zx.Text<>'' then
      num:=num+1;
   if edtopname12zx.Text<>'' then
      num:=num+1;
   if edtopname13zx.Text<>'' then
      num:=num+1;
   if edtopname14zx.Text<>'' then
      num:=num+1;
   if edtopname15zx.Text<>'' then
      num:=num+1;
   if edtopname16zx.Text<>'' then
      num:=num+1;

   costquantity :=edtnetweighttotalzx.Text;

   strnetweight:=FloatToStr(StrToFloat(costquantity)/num);
   if edtopnamezx.Text<>'' then
      edtnetweightzx.Text:=strnetweight;
      edtnetweightzxgzl.Text:=edtnetweightzx.Text;
   if edtopname1zx.Text<>'' then
      edtnetweight1zx.Text:=strnetweight;
      edtnetweight1zxgzl.Text:=edtnetweight1zx.Text;
   if edtopname2zx.Text<>'' then
      edtnetweight2zx.Text:=strnetweight;
      edtnetweight2zxgzl.Text:=edtnetweight2zx.Text;
   if edtopname3zx.Text<>'' then
      edtnetweight3zx.Text:=strnetweight;
      edtnetweight3zxgzl.Text:=edtnetweight3zx.Text;
   if edtopname4zx.Text<>'' then
      edtnetweight4zx.Text:=strnetweight;
      edtnetweight4zxgzl.Text:=edtnetweight4zx.Text;
   if edtopname5zx.Text<>'' then
      edtnetweight5zx.Text:=strnetweight;
      edtnetweight5zxgzl.Text:=edtnetweight5zx.Text;
   if edtopname6zx.Text<>'' then
      edtnetweight6zx.Text:=strnetweight;
      edtnetweight6zxgzl.Text:=edtnetweight6zx.Text;
   if edtopname7zx.Text<>'' then
      edtnetweight7zx.Text:=strnetweight;
      edtnetweight7zxgzl.Text:=edtnetweight7zx.Text;
   if edtopname8zx.Text<>'' then
      edtnetweight8zx.Text:=strnetweight;
      edtnetweight8zxgzl.Text:=edtnetweight8zx.Text;
   if edtopname9zx.Text<>'' then
      edtnetweight9zx.Text:=strnetweight;
      edtnetweight9zxgzl.Text:=edtnetweight9zx.Text;
   if edtopname10zx.Text<>'' then
      edtnetweight10zx.Text:=strnetweight;
      edtnetweight10zxgzl.Text:=edtnetweight10zx.Text;
   if edtopname11zx.Text<>'' then
      edtnetweight11zx.Text:=strnetweight;
      edtnetweight11zxgzl.Text:=edtnetweight11zx.Text;
   if edtopname12zx.Text<>'' then
      edtnetweight12zx.Text:=strnetweight;
      edtnetweight12zxgzl.Text:=edtnetweight12zx.Text;
   if edtopname13zx.Text<>'' then
      edtnetweight13zx.Text:=strnetweight;
      edtnetweight13zxgzl.Text:=edtnetweight13zx.Text;
   if edtopname14zx.Text<>'' then
      edtnetweight14zx.Text:=strnetweight;
      edtnetweight14zxgzl.Text:=edtnetweight14zx.Text;
   if edtopname15zx.Text<>'' then
      edtnetweight15zx.Text:=strnetweight;
      edtnetweight15zxgzl.Text:=edtnetweight15zx.Text;
   if edtopname16zx.Text<>'' then
      edtnetweight16zx.Text:=strnetweight;
      edtnetweight16zxgzl.Text:=edtnetweight16zx.Text;

end;

procedure Tfrmforkworknew.btnOkzxClick(Sender: TObject);
var
   maxsno:Integer;
   strnetweight,strnetweightgzl:string;
   strprice:string;
   strminquantity,strminquantity1,strminquantity2,strminquantity3,strminquantity4,strminquantity5,strminquantity6,strminquantity7:string;
begin
   strforktype:='Z';
   OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         +'  and isnull(forktype,"F")="'+strforktype+'" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp1.RecordCount<>0 then
   begin
      KMessageDlg('该票业务的已分摊！',mtWarning,[mbOK],0);
      Exit;
   end;
   if edtpricezx.Text='' then
   begin
      KmessageDlg('装卸单价不能为空!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   if ((edtopnamezx.Text='') and(edtopname1zx.Text='') and (edtopname2zx.Text='') and (edtopname3zx.Text='') and
      (edtopname4zx.Text='') and (edtopname5zx.Text='') and (edtopname6zx.Text='') and (edtopname7zx.Text='')and
      (edtopname8zx.Text='') and (edtopname9zx.Text='') and (edtopname10zx.Text='') and (edtopname11zx.Text='')and
      (edtopname12zx.Text='') and (edtopname13zx.Text='') and (edtopname14zx.Text='') and (edtopname15zx.Text='')
      and (edtopname16zx.Text='')
      ) then
   begin
      KmessageDlg('没有安排工作人员!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;

   if ((edtnetweightzx.Text='') and(edtnetweight1zx.Text='') and (edtnetweight2zx.Text='') and (edtnetweight3zx.Text='') and
      (edtnetweight4zx.Text='') and (edtnetweight5zx.Text='') and (edtnetweight6zx.Text='') and (edtnetweight7zx.Text='') and
      (edtnetweight8zx.Text='') and (edtnetweight9zx.Text='') and (edtnetweight10zx.Text='') and (edtnetweight11zx.Text='')and
      (edtnetweight12zx.Text='') and (edtnetweight13zx.Text='') and (edtnetweight14zx.Text='') and (edtnetweight15zx.Text='')and
      (edtnetweight16zx.Text='')
      )  then
   begin
      KmessageDlg('没有安排工作量!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   OpenSql(dataTmp.qryTmp,'select sno=max(sno) from forkworkload (nolock)'+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         );
   maxsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
   maxsno:=maxsno+1;
   if KmessageDlg('确定这样安排工作量吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      if edtopnamezx.Text<>'' then
      begin
         strnetweight:=edtnetweightzx.Text;
         strnetweightgzl:=edtnetweightzxgzl.Text;
         strprice:=iif(edtpricezx1.Text<>'',edtpricezx1.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantityzx.Text<>'',edtminquantityzx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnamezx.TextField+'","'+edtopnamezx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               //+'        '+edtminquantity.Text+'  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname1zx.Text<>'' then
      begin
         strnetweight:=edtnetweight1zx.Text;
         strnetweightgzl:=edtnetweight1zxgzl.Text;
         strprice:=iif(edtpricezx2.Text<>'',edtpricezx2.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity1zx.Text<>'',edtminquantity1zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname1zx.TextField+'","'+edtopname1zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname2zx.Text<>'' then
      begin
         strnetweight:=edtnetweight2zx.Text;
         strnetweightgzl:=edtnetweight2zxgzl.Text;
         strprice:=iif(edtpricezx3.Text<>'',edtpricezx3.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity2zx.Text<>'',edtminquantity2zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname2zx.TextField+'","'+edtopname2zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname3zx.Text<>'' then
      begin
         strnetweight:=edtnetweight3zx.Text;
         strnetweightgzl:=edtnetweight3zxgzl.Text;
         strprice:=iif(edtpricezx4.Text<>'',edtpricezx4.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity3zx.Text<>'',edtminquantity3zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname3zx.TextField+'","'+edtopname3zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname4zx.Text<>'' then
      begin
         strnetweight:=edtnetweight4zx.Text;
         strnetweightgzl:=edtnetweight4zxgzl.Text;
         strprice:=iif(edtpricezx5.Text<>'',edtpricezx5.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity4zx.Text<>'',edtminquantity4zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname4zx.TextField+'","'+edtopname4zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname5zx.Text<>'' then
      begin
         strnetweight:=edtnetweight5zx.Text;
         strnetweightgzl:=edtnetweight5zxgzl.Text;
         strprice:=iif(edtpricezx6.Text<>'',edtpricezx6.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity5zx.Text<>'',edtminquantity5zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname5zx.TextField+'","'+edtopname5zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname6zx.Text<>'' then
      begin
         strnetweight:=edtnetweight6zx.Text;
         strnetweightgzl:=edtnetweight6zxgzl.Text;
         strprice:=iif(edtpricezx7.Text<>'',edtpricezx7.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity6zx.Text<>'',edtminquantity6zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname6zx.TextField+'","'+edtopname6zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname7zx.Text<>'' then
      begin
         strnetweight:=edtnetweight7zx.Text;
         strnetweightgzl:=edtnetweight7zxgzl.Text;
         strprice:=iif(edtpricezx8.Text<>'',edtpricezx8.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity7zx.Text<>'',edtminquantity7zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname7zx.TextField+'","'+edtopname7zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname8zx.Text<>'' then
      begin
         strnetweight:=edtnetweight8zx.Text;
         strnetweightgzl:=edtnetweight8zxgzl.Text;
         strprice:=iif(edtpricezx9.Text<>'',edtpricezx9.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity8zx.Text<>'',edtminquantity8zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname8zx.TextField+'","'+edtopname8zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname9zx.Text<>'' then
      begin
         strnetweight:=edtnetweight9zx.Text;
         strnetweightgzl:=edtnetweight9zxgzl.Text;
         strprice:=iif(edtpricezx10.Text<>'',edtpricezx10.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity9zx.Text<>'',edtminquantity9zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname9zx.TextField+'","'+edtopname9zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname10zx.Text<>'' then
      begin
         strnetweight:=edtnetweight10zx.Text;
         strnetweightgzl:=edtnetweight10zxgzl.Text;
         strprice:=iif(edtpricezx11.Text<>'',edtpricezx11.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity10zx.Text<>'',edtminquantity10zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname10zx.TextField+'","'+edtopname10zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname11zx.Text<>'' then
      begin
         strnetweight:=edtnetweight11zx.Text;
         strnetweightgzl:=edtnetweight11zxgzl.Text;
         strprice:=iif(edtpricezx12.Text<>'',edtpricezx12.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity11zx.Text<>'',edtminquantity11zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname11zx.TextField+'","'+edtopname11zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname12zx.Text<>'' then
      begin
         strnetweight:=edtnetweight12zx.Text;
         strnetweightgzl:=edtnetweight12zxgzl.Text;
         strprice:=iif(edtpricezx13.Text<>'',edtpricezx13.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity12zx.Text<>'',edtminquantity12zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname12zx.TextField+'","'+edtopname12zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname13zx.Text<>'' then
      begin
         strnetweight:=edtnetweight13zx.Text;
         strnetweightgzl:=edtnetweight13zxgzl.Text;
         strprice:=iif(edtpricezx14.Text<>'',edtpricezx14.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity13zx.Text<>'',edtminquantity13zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname13zx.TextField+'","'+edtopname13zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname14zx.Text<>'' then
      begin
         strnetweight:=edtnetweight14zx.Text;
         strnetweightgzl:=edtnetweight14zxgzl.Text;
         strprice:=iif(edtpricezx15.Text<>'',edtpricezx15.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity14zx.Text<>'',edtminquantity14zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname14zx.TextField+'","'+edtopname14zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname15zx.Text<>'' then
      begin
         strnetweight:=edtnetweight15zx.Text;
         strnetweightgzl:=edtnetweight15zxgzl.Text;
         strprice:=iif(edtpricezx16.Text<>'',edtpricezx16.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity15zx.Text<>'',edtminquantity15zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname15zx.TextField+'","'+edtopname15zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname16zx.Text<>'' then
      begin
         strnetweight:=edtnetweight16zx.Text;
         strnetweightgzl:=edtnetweight16zxgzl.Text;
         strprice:=iif(edtpricezx17.Text<>'',edtpricezx17.Text,edtpricezx.Text);
         strminquantity:=iif(edtminquantity16zx.Text<>'',edtminquantity16zx.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname16zx.TextField+'","'+edtopname16zx.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
   end;

end;

procedure Tfrmforkworknew.btnOkqtClick(Sender: TObject);
var
   maxsno:Integer;
   strnetweight,strnetweightgzl:string;
   strprice:string;
   strminquantity,strminquantity1,strminquantity2,strminquantity3,strminquantity4,strminquantity5,strminquantity6,strminquantity7:string;
begin
   strforktype:='Q';
   OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         +'  and isnull(forktype,"F")="'+strforktype+'" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp1.RecordCount<>0 then
   begin
      KMessageDlg('该票业务的已分摊！',mtWarning,[mbOK],0);
      Exit;
   end;
   if edtpriceqt.Text='' then
   begin
      KmessageDlg('单价不能为空!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   if ((edtopnameqt.Text='') and(edtopname1qt.Text='') and (edtopname2qt.Text='') and (edtopname3qt.Text='') and
      (edtopname4qt.Text='') and (edtopname5qt.Text='') and (edtopname6qt.Text='') and (edtopname7qt.Text='') and
      (edtopname8qt.Text='') and (edtopname9qt.Text='')
      ) then
   begin
      KmessageDlg('没有安排工作人员!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;

   if ((edtnetweightqt.Text='') and(edtnetweight1qt.Text='') and (edtnetweight2qt.Text='') and (edtnetweight3qt.Text='') and
      (edtnetweight4qt.Text='') and (edtnetweight5qt.Text='') and (edtnetweight6qt.Text='') and (edtnetweight7qt.Text='') and
      (edtnetweight8qt.Text='') and (edtnetweight9qt.Text='')
      ) then
   begin
      KmessageDlg('没有安排工作量!!!',mtConfirmation,[mbYes,mbNo],0);
      Exit;
   end;
   OpenSql(dataTmp.qryTmp,'select sno=max(sno) from forkworkload (nolock)'+chr(13)+chr(10)
                         +'where jobnoin="'+strjobno+'" '+chr(13)+chr(10)
                         );
   maxsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
   maxsno:=maxsno+1;
   if KmessageDlg('确定这样安排工作量吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      if edtopnameqt.Text<>'' then
      begin
         strnetweight:=edtnetweightqt.Text;
         strnetweightgzl:=edtnetweightqtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantityqt.Text<>'',edtminquantityqt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopnameqt.TextField+'","'+edtopnameqt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               //+'        '+edtminquantity.Text+'  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname1qt.Text<>'' then
      begin
         strnetweight:=edtnetweight1qt.Text;
         strnetweightgzl:=edtnetweight1qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity1qt.Text<>'',edtminquantity1qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname1qt.TextField+'","'+edtopname1qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname2qt.Text<>'' then
      begin
         strnetweight:=edtnetweight2qt.Text;
         strnetweightgzl:=edtnetweight2qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity2qt.Text<>'',edtminquantity2qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname2qt.TextField+'","'+edtopname2qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname3qt.Text<>'' then
      begin
         strnetweight:=edtnetweight3qt.Text;
         strnetweightgzl:=edtnetweight3qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity3qt.Text<>'',edtminquantity3qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname3qt.TextField+'","'+edtopname3qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname4qt.Text<>'' then
      begin
         strnetweight:=edtnetweight4qt.Text;
         strnetweightgzl:=edtnetweight4qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity4qt.Text<>'',edtminquantity4qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname4qt.TextField+'","'+edtopname4qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname5qt.Text<>'' then
      begin
         strnetweight:=edtnetweight5qt.Text;
         strnetweightgzl:=edtnetweight5qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity5qt.Text<>'',edtminquantity5qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname5qt.TextField+'","'+edtopname5qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname6qt.Text<>'' then
      begin
         strnetweight:=edtnetweight6qt.Text;
         strnetweightgzl:=edtnetweight6qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity6qt.Text<>'',edtminquantity6qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname6qt.TextField+'","'+edtopname6qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname7qt.Text<>'' then
      begin
         strnetweight:=edtnetweight7qt.Text;
         strnetweightgzl:=edtnetweight7qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity7qt.Text<>'',edtminquantity7qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname7qt.TextField+'","'+edtopname7qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname8qt.Text<>'' then
      begin
         strnetweight:=edtnetweight8qt.Text;
         strnetweightgzl:=edtnetweight8qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity8qt.Text<>'',edtminquantity8qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname8qt.TextField+'","'+edtopname8qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
      if edtopname9qt.Text<>'' then
      begin
         strnetweight:=edtnetweight9qt.Text;
         strnetweightgzl:=edtnetweight9qtgzl.Text;
         strprice:=iif(edtpriceqt.Text<>'',edtpriceqt.Text,0);
         strminquantity:=iif(edtminquantity9qt.Text<>'',edtminquantity9qt.Text,0);
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                               +'       (sno,opid,opname,'+chr(13)+chr(10)
                               +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                               +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                               +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                               +'values ('+IntToStr(maxsno)+',"'+edtopname9qt.TextField+'","'+edtopname9qt.Text+'", '+chr(13)+chr(10)
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                               +'        '+strnetweight+','+strnetweightgzl+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'" ,'+chr(13)+chr(10)
                               +'        '+strprice+','+strminquantity+',"'+strcusbillno+'"  )'+chr(13)+chr(10)
                               );
         maxsno:=maxsno+1;
      end;
   end;

end;

procedure Tfrmforkworknew.btnSharingqtClick(Sender: TObject);
var
   num,maxsno:Integer;
   strnetweight,costquantity:string;
begin
   strforktype:='Q';
   checkforkwork;
   num:=0;
   if edtopnameqt.Text<>'' then
      num:=num+1;
   if edtopname1qt.Text<>'' then
      num:=num+1;
   if edtopname2qt.Text<>'' then
      num:=num+1;
   if edtopname3qt.Text<>'' then
      num:=num+1;
   if edtopname4qt.Text<>'' then
      num:=num+1;
   if edtopname5qt.Text<>'' then
      num:=num+1;
   if edtopname6qt.Text<>'' then
      num:=num+1;
   if edtopname7qt.Text<>'' then
      num:=num+1;
   if edtopname8qt.Text<>'' then
      num:=num+1;
   if edtopname9qt.Text<>'' then
      num:=num+1;
   costquantity :=edtnetweighttotalqt.Text;

   strnetweight:=FloatToStr(StrToFloat(costquantity)/num);
   if edtopnameqt.Text<>'' then
      edtnetweightqt.Text:=strnetweight;
      edtnetweightqtgzl.Text:=edtnetweightqt.Text;
   if edtopname1qt.Text<>'' then
      edtnetweight1qt.Text:=strnetweight;
      edtnetweight1qtgzl.Text:=edtnetweight1qt.Text;
   if edtopname2qt.Text<>'' then
      edtnetweight2qt.Text:=strnetweight;
      edtnetweight2qtgzl.Text:=edtnetweight2qt.Text;
   if edtopname3qt.Text<>'' then
      edtnetweight3qt.Text:=strnetweight;
      edtnetweight3qtgzl.Text:=edtnetweight3qt.Text;
   if edtopname4qt.Text<>'' then
      edtnetweight4qt.Text:=strnetweight;
      edtnetweight4qtgzl.Text:=edtnetweight4qt.Text;
   if edtopname5qt.Text<>'' then
      edtnetweight5qt.Text:=strnetweight;
      edtnetweight5qtgzl.Text:=edtnetweight5qt.Text;
   if edtopname6qt.Text<>'' then
      edtnetweight6qt.Text:=strnetweight;
      edtnetweight6qtgzl.Text:=edtnetweight6qt.Text;
   if edtopname7qt.Text<>'' then
      edtnetweight7qt.Text:=strnetweight;
      edtnetweight7qtgzl.Text:=edtnetweight7qt.Text;
   if edtopname8qt.Text<>'' then
      edtnetweight8qt.Text:=strnetweight;
      edtnetweight8qtgzl.Text:=edtnetweight8qt.Text;
   if edtopname9qt.Text<>'' then
      edtnetweight9qt.Text:=strnetweight;
      edtnetweight9qtgzl.Text:=edtnetweight9qt.Text;

end;

procedure Tfrmforkworknew.edtopnameccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:integer;
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   i:=qrySelect.RecordCount;
   qrySelect.First;
   while i>0 do
   begin
      if i=8  then
      begin
         edtopname7cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname7cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=7  then
      begin
         edtopname6cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname6cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=6  then
      begin
         edtopname5cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname5cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=5  then
      begin
         edtopname4cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname4cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=4  then
      begin
         edtopname3cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname3cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=3  then
      begin
         edtopname2cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname2cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=2  then
      begin
         edtopname1cc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname1cc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=1  then
      begin
         edtopnamecc.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopnamecc.Text  :=qrySelect.FieldByName('opname').asstring;
      end;

      i:=i-1;
      qryselect.Next;
   end;

end;

procedure Tfrmforkworknew.edtopname1ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname1cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname1cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname2ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname2cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname2cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname3ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname3cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname3cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkworknew.edtopname4ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname4cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname4cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname5ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname5cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname5cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname6ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname6cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname6cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname7ccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname7cc.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname7cc.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopnamezxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:integer;
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   i:=qrySelect.RecordCount;
   qrySelect.First;
   while i>0 do
   begin
      if i=17  then
      begin
         edtopname16zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname16zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=16  then
      begin
         edtopname15zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname15zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=15  then
      begin
         edtopname14zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname14zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=14  then
      begin
         edtopname13zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname13zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=13  then
      begin
         edtopname12zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname12zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=12  then
      begin
         edtopname11zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname11zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=11  then
      begin
         edtopname10zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname10zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=10  then
      begin
         edtopname9zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname9zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=9  then
      begin
         edtopname8zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname8zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=8  then
      begin
         edtopname7zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname7zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=7  then
      begin
         edtopname6zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname6zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=6  then
      begin
         edtopname5zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname5zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=5  then
      begin
         edtopname4zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname4zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=4  then
      begin
         edtopname3zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname3zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=3  then
      begin
         edtopname2zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname2zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=2  then
      begin
         edtopname1zx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopname1zx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;
      if i=1  then
      begin
         edtopnamezx.TextField  :=qrySelect.FieldByName('opid').asstring;
         edtopnamezx.Text  :=qrySelect.FieldByName('opname').asstring;
      end;

      i:=i-1;
      qryselect.Next;
   end;

end;

procedure Tfrmforkworknew.edtopname1zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname1zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname1zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname2zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname2zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname2zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname3zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname3zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname3zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname4zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname4zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname4zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname5zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname5zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname5zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname6zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname6zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname6zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname7zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname7zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname7zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopnameqtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopnameqt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopnameqt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname1qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname1qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname1qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname2qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname2qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname2qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname3qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname3qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname3qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname4qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname4qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname4qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname5qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname5qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname5qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname6qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname6qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname6qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname7qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname7qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname7qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopnamejl1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopnamejl1.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopnamejl1.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname8zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname8zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname8zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname9zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname9zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname9zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname10zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname10zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname10zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname11zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname11zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname11zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname8qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname8qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname8qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname9qtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname9qt.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname9qt.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.pgcLocationINOUTChange(Sender: TObject);
begin
   if pgcLocationINOUT.ActivePage<>tbsSKU then
   begin
      frmforkworknew.Height:=504;
   end;
   if pgcLocationINOUT.ActivePage=tbsSKU then
   begin
      frmforkworknew.Height:=644;
   end;
end;

procedure Tfrmforkworknew.edtopname12zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname12zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname12zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname13zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname13zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname13zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname14zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname14zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname14zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname15zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname15zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname15zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

procedure Tfrmforkworknew.edtopname16zxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname16zx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname16zx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

end.
