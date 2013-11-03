unit WareOrderIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, StdCtrls, CheckLst, KGroupBox,
  DBKINCGrids, KSText, DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner,
  dxEditor, GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, DbButtons,
  KBitBtn, ExtCtrls, KinPageControl, libUser, Menus, DBTables, DB ,libProc,
  DragBar, KinQuery, KUpdateSql, dxDBTLCl, dxGrClms, DBClient,
  KDataSetProvider,libUserPub;

type
  TfrmWareOrderIn = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    btnClose: TKBitBtn;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    pcWareOrder: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdWareOrder: TdxDBGrid;
    OrderID: TdxDBGridColumn;
    OrderDate: TdxDBGridColumn;
    UploadDate: TdxDBGridColumn;
    SKUName: TdxDBGridColumn;
    Quantity: TdxDBGridColumn;
    Checkname: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    pcInfo: TdxPageControl;
    tbsWareOrder: TdxTabSheet;
    tbsWareOrderSKU: TdxTabSheet;
    GMSStickyLabel42: TGMSStickyLabel;
    KGroupBox9: TKGroupBox;
    edtOrderID: TdxDBEdit;
    lblOrderID: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtOrderDate: TdxDBDateEdit;
    GMSStickyLabel22: TGMSStickyLabel;
    dtduploaddate: TdxDBDateEdit;
    btnCopy: TKBitBtn;
    btnCheck: TKBitBtn;
    btnTotal: TKBitBtn;
    btnTask: TKBitBtn;
    cmbSKUCOSTCLASSCD: TKinDbPickEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    btnRate: TKBitBtn;
    popCostRate: TPopupMenu;
    mitRateEdit: TMenuItem;
    CustomsNO: TdxDBGridColumn;
    OrderStatus: TdxDBGridColumn;
    ppmTotal: TPopupMenu;
    mitSplit: TMenuItem;
    Consigncusname: TdxDBGridColumn;
    CreateName: TdxDBGridColumn;
    MainOrder: TdxDBGridColumn;
    KGroupBox5: TKGroupBox;
    timOrderDate: TdxDBTimeEdit;
    timUploadDate: TdxDBTimeEdit;
    ppmSKUTask: TPopupMenu;
    mitSKUSelect: TMenuItem;
    mitTaskSKUSelect: TMenuItem;
    btnOrderWithTask: TKBitBtn;
    CustomsUnite: TdxDBGridColumn;
    edtCustomsINPUT: TKBitBtn;
    mitInputModal: TMenuItem;
    INPUTED: TdxDBGridColumn;
    popWareOrderOriSKU: TPopupMenu;
    mitAddOriSKU: TMenuItem;
    mitDelOriSKU: TMenuItem;
    popWareOrderSKU: TPopupMenu;
    mitAddSKU: TMenuItem;
    mitDelSKU: TMenuItem;
    N1: TMenuItem;
    mitSKU_IN: TMenuItem;
    mitSKU_IN_F: TMenuItem;
    mitLIInventory: TMenuItem;
    N2: TMenuItem;
    mitOrder_IN: TMenuItem;
    edtOrderType: TKinDbPickEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    UserName: TdxDBGridColumn;
    orderdatesj: TdxDBGridColumn;
    CheckSKUED: TdxDBGridColumn;
    ppmEdit: TPopupMenu;
    mitOperation: TMenuItem;
    Remark: TdxDBGridColumn;
    SkuNameOri: TdxDBGridColumn;
    QuantityOri: TdxDBGridColumn;
    Tasked: TdxDBGridColumn;
    dtdactualdate: TdxDBDateEdit;
    timtactualdate: TdxDBTimeEdit;
    GMSStickyLabel17: TGMSStickyLabel;
    ppmCheck: TPopupMenu;
    mitCheck: TMenuItem;
    mitCheckCancel: TMenuItem;
    Costcusname: TdxDBGridColumn;
    Cusbillno: TdxDBGridColumn;
    N3: TMenuItem;
    miOirSku: TMenuItem;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel51: TGMSStickyLabel;
    edtCusbillno: TdxDBEdit;
    cmbOrderStatus: TKinDbPickEdit;
    edtMainOrder: TdxDBEdit;
    edtBLNO: TdxDBEdit;
    iusername: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    GMSStickyLabel20: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel24: TGMSStickyLabel;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    GMSStickyLabel30: TGMSStickyLabel;
    edtCreateName: TdxDBEdit;
    dtdCreatedate: TdxDBDateEdit;
    edtModifyName: TdxDBEdit;
    dtdModifyDate: TdxDBDateEdit;
    edtcheckname: TdxDBEdit;
    edtJOBNO: TdxDBEdit;
    dtdcheckdate: TdxDBDateEdit;
    N4: TMenuItem;
    edtCustomsNO: TdxDBEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    corpno: TdxDBGridColumn;
    ppmMain: TPopupMenu;
    mitCheckMore: TMenuItem;
    mitCancelMore: TMenuItem;
    N6: TMenuItem;
    mitRelation: TMenuItem;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    GMSStickyLabel16: TGMSStickyLabel;
    ppmprint: TPopupMenu;
    N5: TMenuItem;
    grdCostquantity: TdxDBGridColumn;
    pieceori: TdxDBGridColumn;
    piecesl: TdxDBGridColumn;
    piece: TdxDBGridColumn;
    mitdelall: TMenuItem;
    btnopid: TKBitBtn;
    mitjcxhtzd: TMenuItem;
    N7: TMenuItem;
    GMSStickyLabel44: TGMSStickyLabel;
    KSText4: TKSText;
    isbond: TdxDBGridColumn;
    mitordercom: TMenuItem;
    mitcancelcom: TMenuItem;
    dtdordercomdate: TdxDBDateEdit;
    WRquantitytask: TdxDBGridColumn;
    WRquantityact: TdxDBGridColumn;
    WRpiecetask: TdxDBGridColumn;
    WRpieceact: TdxDBGridColumn;
    blno: TdxDBGridColumn;
    edtIUser: TdxDBButtonEdit;
    GMSStickyLabel31: TGMSStickyLabel;
    qryWareOrderIn: TKADOQuery;
    dtsWareOrderIn: TDataSource;
    qryWareOrderInEdit: TKADOQuery;
    dtsWareOrderInEdit: TDataSource;
    udsWareOrderInEdit: TKadoUpdateSql;
    qryWareOrderInSKU: TKADOQuery;
    dtsWareOrderInSKU: TDataSource;
    udsWareOrderInSKU: TKadoUpdateSql;
    qryWareOrderInOriSKU: TKADOQuery;
    udsWareOrderInOriSKU: TKadoUpdateSql;
    dtsWareOrderInOriSKU: TDataSource;
    qryWareorderInSkuDetail: TKADOQuery;
    udsWareorderInSkuDetail: TKadoUpdateSql;
    tbsOther: TdxTabSheet;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel32: TGMSStickyLabel;
    GMSStickyLabel33: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    ckbIsbond: TdxDBCheckEdit;
    ckbLottracked: TdxDBCheckEdit;
    ckbContwithloca: TdxDBCheckEdit;
    ckbCountcontcost: TdxDBCheckEdit;
    cmbCostcusidout: TdxDBButtonEdit;
    cmbLoadcosttype: TKinDbPickEdit;
    dxDBCheckEdit1: TdxDBCheckEdit;
    ckbCountrent: TdxDBCheckEdit;
    cmbWareRentCountWay: TKinDbPickEdit;
    cmbwarerentcounttypeOut: TKinDbPickEdit;
    GMSStickyLabel37: TGMSStickyLabel;
    edtCarriercusid: TdxDBButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCarbrand: TdxDBEdit;
    GMSStickyLabel23: TGMSStickyLabel;
    edtOriginOrder: TdxDBEdit;
    GMSStickyLabel39: TGMSStickyLabel;
    edtOrigincusid: TdxDBButtonEdit;
    GMSStickyLabel25: TGMSStickyLabel;
    edtDestOrder: TdxDBEdit;
    GMSStickyLabel38: TGMSStickyLabel;
    edtDestcusname: TdxDBButtonEdit;
    GMSStickyLabel40: TGMSStickyLabel;
    edtConsCus: TdxDBButtonEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    edtCorpno: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtSkucost: TdxDBCurrencyEdit;
    ckbistrade: TdxDBCheckEdit;
    ckbDisaccord: TdxDBCheckEdit;
    GMSStickyLabel35: TGMSStickyLabel;
    edtRouting: TdxDBBlobEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    cmbCususername: TKinDbPickEdit;
    GMSStickyLabel49: TGMSStickyLabel;
    edtCarrierName: TKinDbPickEdit;
    GMSStickyLabel50: TGMSStickyLabel;
    edtCarrierNO: TdxDBEdit;
    GMSStickyLabel34: TGMSStickyLabel;
    edtconno: TdxDBBlobEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    edtCarrierDate: TdxDBDateEdit;
    timCarrierDate: TdxDBTimeEdit;
    radLoadType: TKDBRadioGroup;
    GMSStickyLabel26: TGMSStickyLabel;
    edtConsignCusID: TdxDBButtonEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtConDescription: TdxDBBlobEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    edtConQuantityTotal: TdxDBCalcEdit;
    ckbcuscheck: TdxDBCheckEdit;
    ckbgoodscheck: TdxDBCheckEdit;
    ckbchecked: TdxDBCheckEdit;
    ckbIstally: TdxDBCheckEdit;
    GMSStickyLabel18: TGMSStickyLabel;
    edtCostopid: TdxDBButtonEdit;
    GMSStickyLabel41: TGMSStickyLabel;
    edtdrivecardno: TdxDBEdit;
    edtpicktype: TdxDBEdit;
    GMSStickyLabel43: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    memRemark1: TdxDBMemo;
    grdOriSKU: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
    ckbOriOperationType: TdxDBGridCheckColumn;
    edtCusid: TdxDBGridButtonColumn;
    CostcusnameOri: TdxDBGridButtonColumn;
    edtshippercusid: TdxDBGridButtonColumn;
    edtSKUName: TdxDBGridButtonColumn;
    skustandard: TdxDBGridColumn;
    SKU_CustomerID: TdxDBGridColumn;
    SkumodelOri: TdxDBGridColumn;
    ColorOri: TdxDBGridColumn;
    SkuspecOri: TdxDBGridColumn;
    cmbShipcusname: TdxDBGridButtonColumn;
    edtLotCode: TdxDBGridColumn;
    edtQualityName: TdxDBGridColumn;
    edtQuantity: TdxDBGridCurrencyColumn;
    cmbQUANTITYUOM: TdxDBGridKinPickColumn;
    edtPiece: TdxDBGridCurrencyColumn;
    cmbPieceUOM: TdxDBGridKinPickColumn;
    edtVolume: TdxDBGridCurrencyColumn;
    cmbVolumeUOM: TdxDBGridKinPickColumn;
    edtArea: TdxDBGridCurrencyColumn;
    cmbAreaUOM: TdxDBGridKinPickColumn;
    edtGrossWeight: TdxDBGridCurrencyColumn;
    edtNetWeight: TdxDBGridCurrencyColumn;
    cmbWeightUOM: TdxDBGridKinPickColumn;
    grdCostquantityOri: TdxDBGridCurrencyColumn;
    grdOriCostquantityuom: TdxDBGridPickColumn;
    edtcasing1: TdxDBGridCurrencyColumn;
    cmbuom1: TdxDBGridKinPickColumn;
    edtCasing2: TdxDBGridCurrencyColumn;
    cmbuom2: TdxDBGridKinPickColumn;
    edtCasing3: TdxDBGridCurrencyColumn;
    cmbUom3: TdxDBGridKinPickColumn;
    edtCasing4: TdxDBGridCurrencyColumn;
    cmbUom4: TdxDBGridKinPickColumn;
    edtCasing5: TdxDBGridCurrencyColumn;
    cmbUom5: TdxDBGridKinPickColumn;
    cmbLocationID: TdxDBGridButtonColumn;
    edtcusno: TdxDBGridColumn;
    cmbCostUOMType: TdxDBGridKinPickColumn;
    edtPrice: TdxDBGridCurrencyColumn;
    edtSKU_CostTotal: TdxDBGridCurrencyColumn;
    priceinOri: TdxDBGridCurrencyColumn;
    skucostinOri: TdxDBGridCurrencyColumn;
    cmbCurrcd: TdxDBGridKinPickColumn;
    dtdManufactureDate: TdxDBGridDateColumn;
    cmbTagEachUOM: TdxDBGridKinPickColumn;
    opname: TdxDBGridButtonColumn;
    ShipperopidOri: TdxDBGridButtonColumn;
    sequencenum: TdxDBGridColumn;
    Jobnooridp: TdxDBGridCheckColumn;
    Jobnoindp: TdxDBGridCheckColumn;
    CarriageOri: TdxDBGridCurrencyColumn;
    CarriagetotalOri: TdxDBGridCurrencyColumn;
    InsuranceOri: TdxDBGridCurrencyColumn;
    InsurancetotalOri: TdxDBGridCurrencyColumn;
    RemarkOri: TdxDBGridBlobColumn;
    carriagecurrcdOri: TdxDBGridPickColumn;
    grdmainorderin: TdxDBGridColumn;
    grdSKU: TdxDBGrid;
    edtSKUSNO: TdxDBGridColumn;
    ckbOperationType: TdxDBGridCheckColumn;
    CostcusnameSKU: TdxDBGridButtonColumn;
    NotFullSign: TdxDBGridCheckColumn;
    edtSKUCusid: TdxDBGridButtonColumn;
    edtSKUShippercusid: TdxDBGridButtonColumn;
    mainordersku: TdxDBGridColumn;
    edtSKUSKUName: TdxDBGridButtonColumn;
    SKU_CustomerID1: TdxDBGridColumn;
    Skumodelsku: TdxDBGridColumn;
    Skuspecsku: TdxDBGridColumn;
    Colorsku: TdxDBGridColumn;
    edtSKULotCode: TdxDBGridColumn;
    skustandardsku: TdxDBGridColumn;
    shipcusname: TdxDBGridButtonColumn;
    edtSKUQualityName: TdxDBGridButtonColumn;
    edtSKUQUANTITY: TdxDBGridCurrencyColumn;
    cmbSKUQUANTITYUOM: TdxDBGridKinPickColumn;
    edtSKUPiece: TdxDBGridCurrencyColumn;
    cmbSKUPieceUOM: TdxDBGridKinPickColumn;
    edtSKUVolume: TdxDBGridCurrencyColumn;
    cmbSKUVolumeUOM: TdxDBGridKinPickColumn;
    edtSKUArea: TdxDBGridCurrencyColumn;
    cmbSKUAreaUOM: TdxDBGridKinPickColumn;
    edtSKUGrossWeight: TdxDBGridCurrencyColumn;
    edtSKUNetWeight: TdxDBGridCurrencyColumn;
    cmbSKUWeightUOM: TdxDBGridKinPickColumn;
    grdSKUCostquantity: TdxDBGridCurrencyColumn;
    grdSkuCostquantityuom: TdxDBGridPickColumn;
    edtSKULocationName: TdxDBGridButtonColumn;
    edtSKUSKU_Cost: TdxDBGridCurrencyColumn;
    edtSKUCostTotal: TdxDBGridCurrencyColumn;
    priceinsku: TdxDBGridCurrencyColumn;
    skucostinsku: TdxDBGridCurrencyColumn;
    cmbSKUCostUomType: TdxDBGridKinPickColumn;
    Carriage: TdxDBGridCurrencyColumn;
    Carriagetotal: TdxDBGridCurrencyColumn;
    Insurance: TdxDBGridCurrencyColumn;
    Insurancetotal: TdxDBGridCurrencyColumn;
    edtSKUcasing1: TdxDBGridCurrencyColumn;
    cmbSKUuom1: TdxDBGridKinPickColumn;
    edtSKUcasing2: TdxDBGridCurrencyColumn;
    cmbSKUuom2: TdxDBGridKinPickColumn;
    edtSKUcasing3: TdxDBGridCurrencyColumn;
    cmbSKUuom3: TdxDBGridKinPickColumn;
    cmbSKUCurrcd: TdxDBGridKinPickColumn;
    edtSKUcasing4: TdxDBGridCurrencyColumn;
    cmbSKUuom4: TdxDBGridKinPickColumn;
    edtSKUcasing5: TdxDBGridCurrencyColumn;
    cmbSKUuom5: TdxDBGridKinPickColumn;
    dtdSKUManufactureDate: TdxDBGridDateColumn;
    edtSKUAccountNO: TdxDBGridColumn;
    cmbSKUTagEachUOM: TdxDBGridKinPickColumn;
    Operator_Account: TdxDBGridButtonColumn;
    Operator_ShipAcc: TdxDBGridButtonColumn;
    quantitytask: TdxDBGridColumn;
    quantityact: TdxDBGridColumn;
    Jobnoindpsku: TdxDBGridCheckColumn;
    Jobnooridpsku: TdxDBGridCheckColumn;
    grdRemark: TdxDBGridBlobColumn;
    carriagecurrcdsku: TdxDBGridPickColumn;
    netweighttask: TdxDBGridColumn;
    netweightact: TdxDBGridColumn;
    edtCostcusid: TdxDBButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure pcWareOrderChange(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure mitAddSKUClick(Sender: TObject);
    procedure mitDelSKUClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure edtOrigincusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtDestcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtConsignCusIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCarriercusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostcusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipperAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure qryWareOrderUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure cmbSKUNameEnter(Sender: TObject);
    procedure grdWareOrderDblClick(Sender: TObject);
    procedure cmbQualityNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShowHint(var HintStr: string; var CanShow: Boolean;
       var HintInfo: THintInfo);
    procedure cmbLocationIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnTaskClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure cmbQUANTITYUOMEnter(Sender: TObject);
    procedure cmbSKUSectionUnitEnter(Sender: TObject);
    procedure cmbSectionUnitEnter(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure ckbCountcontcostClick(Sender: TObject);
    procedure mitSplitClick(Sender: TObject);
    procedure mitSKU_INClick(Sender: TObject);
    procedure edtCustomsNO_INEnter(Sender: TObject);
    procedure edtVolumeDblClick(Sender: TObject);
    procedure edtSNOEnter(Sender: TObject);
    procedure edtCostcusidEnter(Sender: TObject);
    procedure edtCostcusidExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtAccountIDEnter(Sender: TObject);
    procedure edtAccountIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbShipperAccountIDEnter(Sender: TObject);
    procedure cmbShipperAccountIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure cmbLocationIDEnter(Sender: TObject);
    procedure cmbLocationIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure mitLIInventoryClick(Sender: TObject);
    procedure mitOrder_INClick(Sender: TObject);
    procedure grdWareOrderChangeNodeEx(Sender: TObject);
    procedure edtCostcusidExit(Sender: TObject);
    procedure mitSKUSelectClick(Sender: TObject);
    procedure mitTaskSKUSelectClick(Sender: TObject);
    procedure edtQuantityEnter(Sender: TObject);
    procedure cmbQualityNameEnter(Sender: TObject);
    procedure ckbIsbondClick(Sender: TObject);
    procedure mitInputModalClick(Sender: TObject);
    procedure grdWareOrderCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure pcInfoChange(Sender: TObject);
    procedure cmbSKUNameDblClick(Sender: TObject);
    procedure grdOriSKUChangeNodeEx(Sender: TObject);
    procedure grdOriSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdOriSKUEnter(Sender: TObject);
    procedure mitAddOriSKUClick(Sender: TObject);
    procedure grdOriSKUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdSKUChangeNodeEx(Sender: TObject);
    procedure grdSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdSKUEnter(Sender: TObject);
    procedure mitDelOriSKUClick(Sender: TObject);
    procedure edtshippercusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUCusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUShippercusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnRateClick(Sender: TObject);
    procedure grdOriSKUDblClick(Sender: TObject);
    procedure edtQuantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtSKUQUANTITYValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtSKULocationNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdSKUExit(Sender: TObject);
    procedure edtCostopidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure Operator_AccountButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure Operator_ShipAccButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure opnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShipperopidOriButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUPieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtPieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitCheckSKUClick(Sender: TObject);
    procedure mitOperationClick(Sender: TObject);
    procedure edtCarriercusidExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtCarriercusidExit(Sender: TObject);
    procedure edtConsignCusIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtConsignCusIDExit(Sender: TObject);
    procedure cmbCostcusidoutButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbCostcusidoutExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbCostcusidoutExit(Sender: TObject);
    procedure edtOrigincusidExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtDestcusnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtOrigincusidExit(Sender: TObject);
    procedure edtDestcusnameExit(Sender: TObject);
    procedure edtCostopidExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtCostopidExit(Sender: TObject);
    procedure mitCheckClick(Sender: TObject);
    procedure mitCheckCancelClick(Sender: TObject);
    procedure miOirSkuClick(Sender: TObject);
    procedure cmbShipcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure shipcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CostcusnameOriButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CostcusnameSKUButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure N4Click(Sender: TObject);
    procedure cmbCostUOMTypeValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure cmbSKUCostUomTypeValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure CarriageValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure InsuranceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure CarriageOriValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure InsuranceOriValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtPriceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtSKUSKU_CostValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitCheckMoreClick(Sender: TObject);
    procedure mitRelationClick(Sender: TObject);
    procedure mitCancelMoreClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure edtIUserButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtIUserExit(Sender: TObject);
    procedure edtIUserExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure N5Click(Sender: TObject);
    procedure edtSKUQualityNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtConsCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtConsCusExit(Sender: TObject);
    procedure edtConsCusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure mitdelallClick(Sender: TObject);
    procedure mitjcxhtzdClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure mitordercomClick(Sender: TObject);
    procedure mitcancelcomClick(Sender: TObject);
    procedure qryWareOrderInOriSKUAfterInsert(DataSet: TDataSet);
    procedure qryWareOrderInOriSKUAfterPost(DataSet: TDataSet);
    procedure qryWareOrderInOriSKUAfterScroll(DataSet: TDataSet);
    procedure qryWareOrderInOriSKUBeforePost(DataSet: TDataSet);
    procedure qryWareOrderInOriSKUBeforeScroll(DataSet: TDataSet);
    procedure qryWareOrderInSKUAfterInsert(DataSet: TDataSet);
    procedure qryWareOrderInSKUAfterPost(DataSet: TDataSet);
    procedure qryWareOrderInSKUAfterScroll(DataSet: TDataSet);
    procedure qryWareOrderInSKUBeforePost(DataSet: TDataSet);
    procedure qryWareOrderInSKUBeforeScroll(DataSet: TDataSet);
    procedure btnOrderWithTaskClick(Sender: TObject);
    procedure edtSKUSKUNameValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
  private
    { Private declarations }
    //私有变量

    DataState:TDataState;
    strWOJobno,strskuid,strskuname :string;
    blnCopy,blnSaveError,blnWare:Boolean;
    mode:TDataState;             //进入form状态模式
    Bookmark: TBookmark;         //书签
    strJobno:string;
    strSql: string;
    FilterSql: string;
    FindItem: TFindItem;          //是否需要查找
    qryInput_PreDetail,qryInput_Detail:TQuery;  //
    arrWareOrder,arrWareOrderEdit,arrWareOrderSKU,arrWareOrderOriSKU:Variant;//用于数据复制
    OldWareOrderSKU :integer;
    OldWareOrderOriSKU :integer;
    maxWareOrderOriSKU :integer;
    stroldOrderID,stroldCustomsNO,stroldCustomsUnite,stroldlotcode:string;//老的指令单号
    setPermission:TsetInt;
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    strGetCd:String;          //商品输入时防止重复判别
    strType,strID_NO:string;           //指令导入类别
    sltConType,sltConQuantity:TStringList;//用于计算箱量
    blnIsOpen,blnInserted:Boolean;                 //是否场装业务
    m_blnPost: Boolean;//在Post状态
    oldedtCostCus:string;
    strINOUTsql,strINOUTWhere:string;//记住主库sql
    strOrderType,strOrderIDType:string;//指令单类型,指令单号类型
    StrCheckLocationId:string;
    StrCheckLotCode:string;
    StrCheckType:string;
    blncheck:Boolean;
    blnOkFlag:Boolean;
    blnSelect:Boolean;
    strDel_Task:string;
    strcostuom:string; //费用单位
    sltselect:TStringList;// 库存挑选过滤
    blnop:Boolean;
    WareOrder_copyCusID,WareOrder_copyCusName,
    WareOrder_Copyshippercusid,WareOrder_Copyshippercusname:String;//用于默认从库第一条记录信息
//    wareorder_CopyCostCusid,wareorder_CopyCostCusname:String;//用于默认从库第一条记录信息     05/05/10  指令商品费用关系人与驻库同
    WareOrder_strOrderCusID,WareOrder_strOrderCusName,
    WareOrder_strOrderShippercusid,WareOrder_strOrderShippercusname,strCostcountuom:string;      //用于默认主库信息
    WareOrder_maxWareOrderSKU,WareOrder_maxWareOrderOriSKU:Integer;

    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    function  Gather:boolean;
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure InitValues;
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    procedure grdOriSKUBeforeInsert;
    procedure grdSKUBeforeInsert;
    procedure OrderCnfg;
    //费率控制过程
    //    procedure InitValuesCopy;
  public
    { Public declarations }
    strINOUT:string;            //辨别是进仓还是出仓（I：进仓；O：出仓）
    strHistMessage,strHistDetailMessage:string;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkWareOrderIn(CallMode:TDataState;pJobno:string;pqryInput_PreDetail:TQuery;pqryInput_Detail:TQuery;
                        pType:string='';pID_NO:string='');

var
  frmWareOrderIn:TfrmWareOrderIn;//收货

implementation

{$R *.dfm}
Uses Main, kindlg, Saveget,datas,datasTmp,GetUserRight,find,WareOrderType,
     ChooseSKUID,LocationIN,LocationOut,Volume,GetDllPub,GridSelect,OrderSelectCnfg,OrderUp,linprint,
     ChangeSkuName,LocationSKUSelect,Operation,ContainerSkuSelect,WareOrderSelect,LIOSKUDetail,
     dxGridOut,TransAct, WareOrderDxALL,InPutOrder;
//     SKUSelect,OrderSelectCnfg, LibBb,
//     Check, OperatorSelect,OrganizationSelect, locationselect,
//     Accountselect ,ChooseSKUID, locationINOUT ,LocationSKUSelect,
//     ChangeQuality,ChangeShipAcc,ChangeAccount,Relocation,ValueAdd,
//     LocationOUTSelect,Volume,WareOrderSelect,
//     AccountCNFGSelect,OrderWithTask,ContainerSKUSelect,ChangeSkuName,
//     LocationINOUTDx,ValueAddDx,Gridselect,chooseUsers,Operation,OrderUp;

var strpJobno:string;
    strCaption:string;

procedure WorkWareOrderIn(CallMode:TDataState;pJobno:string;pqryInput_PreDetail:TQuery;pqryInput_Detail:TQuery;
                        pType:string='';pID_NO:string='');            
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   strpJobno:=pJobno;
   if frmWareOrderIn<>nil then
   with frmWareOrderIn do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmWareOrderIn:=TfrmWareOrderIn.Create(Application);
 with frmWareOrderIn do
  begin
  {初始化所有数据集}
    //给有不同名字的控键命名
    setPermission:=[];
    strskuid:='';
    blnop:=True;

    blnCopy      :=False;             //系统默认不复制新增
    FindItem     :=TFindItem.Create;
    blnSaveError :=False;
    mode         :=CallMode;
    strJobno     :=pJobno;
    strType      :=pType;
    strID_NO     :=pID_NO;
    ScrollAfterEdit:=True;

    qryInput_PreDetail:=pqryInput_PreDetail;
    qryInput_Detail   :=pqryInput_Detail;

    sltConType:=TStringList.Create;
    sltConQuantity:=TStringList.Create;
    sltselect:= TStringList.Create;
    Application.OnShowHint := ShowHint;

     //计费商品类
    InitdbPick(cmbSKUCOSTCLASSCD,'SKUCostClass','SKUCostClassCD','SKUCostClassName','1=1');
    
    //件数单位
    InitdbPick(cmbPieceUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUPieceUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbQUANTITYUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUQUANTITYUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbUom1,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbUom2,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbUom3,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbUom4,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbUom5,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUUom1,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUUom2,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUUom3,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUUom4,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUUom5,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbTagEachUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');
    InitdbPick(cmbSKUTagEachUOM,'uom','uomname','uomname',' uomtype like "%件数%" ');

    //体积单位
    InitdbPick(cmbVolumeUOM,'uom','uomname','uomname',' uomtype like "%体积%" ');
    InitdbPick(cmbSKUVolumeUOM,'uom','uomname','uomname',' uomtype like "%体积%" ');

    //重量单位
    InitdbPick(cmbWeightUOM,'uom','uomname','uomname',' uomtype like "%重量%" ');
    InitdbPick(cmbSKUWeightUOM,'uom','uomname','uomname',' uomtype like "%重量%" ');

    //面积单位
    InitdbPick(cmbAreaUOM,'uom','uomname','uomname',' uomtype like "%面积%" ');
    InitdbPick(cmbSKUAreaUOM,'uom','uomname','uomname',' uomtype like "%面积%" ');


    InitdbPick(grdOriCostquantityuom,'uom','uomname','uomname','1=1');
    InitdbPick(grdSkuCostquantityuom,'uom','uomname','uomname','1=1');
    //    InitdbPick(cmbSizeUOM,'uom','uomname','uomname',' uomtype like "%尺寸%" ');

    //初始化币别
    InitdbPick(cmbCurrcd,'codelib','codename','codename',' codeclass="00" ');
    cmbSKUCurrcd.Items:=cmbCurrcd.Items;
    carriagecurrcdsku.items:=cmbCurrcd.Items;
    carriagecurrcdOri.items:=cmbCurrcd.Items;
//    InitdbPick(cmbSKUCurrcd,'codelib','codename','codename',' codeclass="00" ');
//    InitdbPick(carriagecurrcdsku,'codelib','codename','codename',' codeclass="00" ');
//    InitdbPick(carriagecurrcdOri,'codelib','codename','codename',' codeclass="00" ');

    //仓租算法
    InitdbPick(cmbWareRentCountWay,'codelib','codecd','codename',' codeclass="18" ');
    InitdbPick(cmbwarerentcounttypeOut,'codelib','codecd','codename',' codeclass="18" ');

    //操 作 类 型
    InitdbPick(cmbLoadcosttype,'codelib','codename','codename','codeclass="19"');

    //单位类别
    InitdbPick(cmbCostUOMType,'codelib','codecd','codename',' codeclass="05" ');
    InitdbPick(cmbSKUCostUomType,'codelib','codecd','codename',' codeclass="05" ');
    //船名
    InitdbPick(edtCarrierName,'vessel','vesselcd','vesselname','1=1');

    //      设置列头begin
      edtSKUSKU_Cost.Caption  :=getSysdata('price',2,'1','销售单价');
      edtSKUCostTotal.Caption :=getSysdata('skucost',2,'1','销售总额');
      priceinsku.Caption      :=getSysdata('pricein',2,'1','采购单价');
      skucostinsku.Caption    :=getSysdata('costin',2,'1','采购总额');

      edtPrice.Caption        :=getSysdata('price',2,'1','销售单价');
      edtSKU_CostTotal.Caption:=getSysdata('skucost',2,'1','销售总额');
      priceinOri.Caption      :=getSysdata('pricein',2,'1','采购单价');
      skucostinOri.Caption    :=getSysdata('costin',2,'1','采购总额');
//      设置列头end


    blnSelect:=False;

//    data.InitWareorder(strJobno);
    //浏览界面的qryWareOrder
    strsql :=  ' select jobno,orderid,operationtype,userid,username,mainorder,originorder,iusername, '+chr(13)+chr(10)
              +iif(getsysdata('oritask')='T',' quantitytask=(select sum(isnull(quantitytask,0)) from wareordersku where wareorder.jobno=wareordersku.jobno), ',' quantitytask="", ')+chr(13)+chr(10)
              +iif(getsysdata('oritask')='T',' quantityact=(select sum(isnull(quantityact,0)) from wareordersku where wareorder.jobno=wareordersku.jobno), ',' quantityact="", ')+chr(13)+chr(10)
              +iif(getsysdata('oritask')='T',' piecetask=(select sum(isnull(piecetask,0)) from wareordersku where wareorder.jobno=wareordersku.jobno), ',' piecetask="", ')+chr(13)+chr(10)
              +iif(getsysdata('oritask')='T',' pieceact=(select sum(isnull(pieceact,0)) from wareordersku where wareorder.jobno=wareordersku.jobno), ',' pieceact="", ')+chr(13)+chr(10)
              +'        destorder,orderdate,uploaddate,actualdate,origincusid,origincusname,'+chr(13)+chr(10)
              +'        destcusid,destcusname,cusid,cusname,shippercusid,'+chr(13)+chr(10)
              +'        shippercusname,loadtype,warerentcounttype,warerentcounttypeOut,'+chr(13)+chr(10)
              +'        createname,createdate,modifyname,modifydate,carriercusid,carriercusname,'+chr(13)+chr(10)
              +'        shipcusid,shipcusname,conscusid,conscusname,carbrand,carriername,carrierno,carrierdate,'+chr(13)+chr(10)
              +'        blno,conno,routing,skuname,pieceuom,weightuom,'+chr(13)+chr(10)
              +'        volumeuom,areauom,piece,netweight,grossweight,volume,area,quantity,'+chr(13)+chr(10)
              +'        contwithloca,lottracked,checkname,checkdate,isbond,countrent,countcontcost,'+chr(13)+chr(10)
              +'        costcusid,costcusname,disaccord,remark,skucostclasscd,quantityuom,skucost,'+chr(13)+chr(10)
              +'        conquantity,condes,customsno,customsunite=isnull(customsunite,"F"),jobnoin,cusbillno,costopid,costopname,'+chr(13)+chr(10)
              +'        kinnproject,dictatetype,costratetype,quantityori,skunameori,costcusidout,'+chr(13)+chr(10)
              +'        costcusnameout,countrentout,jobnoori,loadcosttype,sealno,consptype,contype,corpno,istally,'+chr(13)+chr(10)
              +'        iuserid,iusername, checked, cuscheck,goodscheck,'
              +'        orderDaterq=convert(char,orderdate,102), '+chr(13)+chr(10)
              +'        orderdatesj=convert(char,orderdate,108), '+chr(13)+chr(10)
              +'        checkskued=case when exists (select 1 from wareordersku where wareordersku.jobno=wareorder.jobno) then "√" else "" end,'
              +'        orderStatus=case when isnull(WareOrder.OrderStatus,"H")="H" then "等待" '+chr(13)+chr(10)
              +'                         when isnull(WareOrder.OrderStatus,"H")="R" then "执行" '+chr(13)+chr(10)
              +'                         else "完成" end,INPUTED="N", '+chr(13)+chr(10)
              +'        Tasked=case when (select count(1) '+chr(13)+chr(10)
              +'                            from Locationinitem  task (nolock)'+chr(13)+chr(10)
              +'                           where task.jobnoorder=WareOrder.Jobno )>0 then "√" else "" end, '+chr(13)+chr(10)
              +'        corpno ,cususername,costquantity,costquantityuom,picktype,drivecardno,'+chr(13)+chr(10)
              +'        keyid=WareOrder.JOBNO,pieceori,piecesl=pieceori-piece,isbond=case when isnull(isbond,"")<>"T" then "" else "√" end'+chr(13)+chr(10)
              +'  from WareOrder (nolock) '+chr(13)+chr(10)
              +' where operationtype=1 '+chr(13)+chr(10)
          +IIF(_Useridcan<>'',
              ' and (wareorder.userid in '+_Useridcan+' or wareorder.iuserid in '+_Useridcan+') ',
              ' and (WareOrder.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or WareOrder.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
              +'   and %where'+chr(13)+chr(10)
              +iif(trim(strJobno)='','',' and WareOrder.jobno="'+strJobno+'" '+chr(13)+chr(10)
                                       +' ')
              ;
    qryWareOrderIn.Close;
    qryWareOrderIn.Sql.Clear;
    qryWareOrderIn.Sql.Add(strsql);
    //编辑用的qryWareOrderEdit
    strsql :=  ' select jobno,orderid,operationtype,userid,username,mainorder,originorder,ordercomdate,'+chr(13)+chr(10)
              +'        destorder,orderdate,uploaddate,actualdate,origincusid,origincusname,'+chr(13)+chr(10)
              +'        destcusid,destcusname,orderstatus,cusid,cusname,shippercusid,'+chr(13)+chr(10)
              +'        shippercusname,loadtype,warerentcounttype,warerentcounttypeOut,'+chr(13)+chr(10)
              +'        createname,createdate,modifyname,modifydate,carriercusid,carriercusname,'+chr(13)+chr(10)
              +'        shipcusid,shipcusname,conscusid,conscusname,carbrand,carriername,carrierno,carrierdate,'+chr(13)+chr(10)
              +'        blno,conno,routing,skuname,pieceuom,weightuom,'+chr(13)+chr(10)
              +'        volumeuom,areauom,piece,netweight,grossweight,volume,area,quantity,'+chr(13)+chr(10)
              +'        contwithloca,lottracked,checkname,checkdate,isbond,countrent,countcontcost,'+chr(13)+chr(10)
              +'        costcusid,costcusname,disaccord,remark,skucostclasscd,quantityuom,skucost,'+chr(13)+chr(10)
              +'        conquantity,condes,customsno,customsunite,jobnoin,cusbillno,costopid,costopname,'+chr(13)+chr(10)
              +'        kinnproject,dictatetype,costratetype,quantityori,skunameori,costcusidout,'+chr(13)+chr(10)
              +'        costcusnameout,countrentout,jobnoori,loadcosttype,sealno,consptype,contype,corpno,istally,'+chr(13)+chr(10)
              +'        iuserid,iusername, checked, cuscheck,goodscheck,cususername,costquantity,costquantityuom,picktype,drivecardno,  '
              +'        pieceori,piecesl=pieceori-piece,istrade'+chr(13)+chr(10)
              +'   from WareOrder (nolock)'+chr(13)+chr(10)
              +'  where WareOrder.JOBNO=:JOBNO  ';
    qryWareOrderInEdit.Close;
    qryWareOrderInEdit.Sql.Clear;
    qryWareOrderInEdit.Sql.Add(strsql);

    //商品库的qry
    strsql :=  ' select WareOrderSKU.jobno,WareOrderSKU.skuid,WareOrderSKU.skuname,WareOrderSKU.lotcode,'
              +'        WareOrderSKU.quantity,WareOrderSKU.quantitytasked,WareOrderSKU.quantityoper,'+chr(13)+chr(10)
              +'        WareOrderSKU.quanititytran,WareOrderSKU.qualityname,'+chr(13)+chr(10)
              +'        WareOrderSKU.orderid,WareOrderSKU.userid,WareOrderSKU.costcusidout,'
              +'        WareOrderSKU.operationtype,WareOrderSKU.pieceuom,WareOrderSKU.weightuom,'
              +'        WareOrderSKU.volumeuom,WareOrderSKU.costcusname,WareOrderSKU.costcusnameout,'+chr(13)+chr(10)
              +'        WareOrderSKU.areauom,WareOrderSKU.piece,WareOrderSKU.netweight,WareOrderSKU.grossweight,'
              +'        WareOrderSKU.volume,WareOrderSKU.area,WareOrderSKU.orderdate,WareOrderSKU.uploaddate,'+chr(13)+chr(10)
              +'        WareOrderSKU.cusid,WareOrderSKU.cusname,WareOrderSKU.shippercusid,WareOrderSKU.shippercusname,'
              +'        WareOrderSKU.loadtype,WareOrderSKU.sno,WareOrderSKU.contwithloca,'+chr(13)+chr(10)
              +'        WareOrderSKU.lottracked,WareOrderSKU.disaccord,WareOrderSKU.price,WareOrderSKU.currcd,WareOrderSKU.skucost,'
              +'        WareOrderSKU.costuomtype,'+chr(13)+chr(10)
              +'        WareOrderSKU.orderstatus,WareOrderSKU.jobnoin,WareOrderSKU.snoin,WareOrderSKU.ldsnoin,'
              +'        wareordersku.jobnoinin,wareordersku.snoinin, '
              +'        WareOrderSKU.customsno,WareOrderSKU.tageach,WareOrderSKU.tageachuom,WareOrderSKU.warerentcounttype,'+chr(13)+chr(10)
              +'        WareOrderSKU.isbond,WareOrderSKU.countrent,WareOrderSKU.countcontcost,WareOrderSKU.locationbillno,'
              +'        WareOrderSKU.jobnoinf,WareOrderSKU.snoinf,WareOrderSKU.ldsnoinf,WareOrderSKU.costcusid,WareOrderSKU.costcusname,'+chr(13)+chr(10)
              +'        wareOrderSKU.sizeuom,WareOrderSKU.height,WareOrderSKU.width,WareOrderSKU.depth,WareOrderSKU.loadcostone,'
              +'        wareOrderSKU.customsno,wareordersku.customsnoin,WareOrderSKU.cusbillno,WareOrderSKU.uom1,WareOrderSKU.uom2,WareOrderSKU.uom3,'
              +'        wareOrderSKU.uom4,WareOrderSKU.uom5,'+chr(13)+chr(10)
              +'        wareOrderSKU.casing1,WareOrderSKU.casing2,WareOrderSKU.casing3,WareOrderSKU.casing4,WareOrderSKU.casing5,'
              +'        wareOrderSKU.manufacturedate,WareOrderSKU.costopid,WareOrderSKU.costopname,'+chr(13)+chr(10)
              +'        wareOrderSKU.opid,WareOrderSKU.opname,WareOrderSKU.shipperopid,WareOrderSKU.shipperopname,'
              +'        wareOrderSKU.notfullsign,wareOrderSKU.quantityremain,WareOrderSKU.username,WareOrderSKU.jobnoori,WareOrderSKU.snoori,'+chr(13)+chr(10)
              +'        wareOrderSKU.quantityuom,wareOrderSKU.remark, '+chr(13)+chr(10)
              +'        wareOrderSKU.costquantity,wareOrderSKU.costquantityuom,'
              +'        piecepro=sku.piecepro, '+chr(13)+chr(10)
              +'        volumepro=sku.volumepro,'+chr(13)+chr(10)
              +'        areapro=sku.areapro,'+chr(13)+chr(10)
              +'        netweightpro=sku.weightpro,'+chr(13)+chr(10)
              +'        grossweightpro=case when isnull(sku.grossweightpro,0)<>0 then sku.grossweightpro else sku.weightpro end,'+chr(13)+chr(10)
              +'        Pro1=SKU.pro1,'+chr(13)+chr(10)
              +'        pro2=SKU.pro2,'+chr(13)+chr(10)
              +'        pro3=SKU.pro3,'+chr(13)+chr(10)
              +'        pro4=SKU.pro4,'+chr(13)+chr(10)
              +'        pro5=SKU.pro5,'+chr(13)+chr(10)
              +'        wareordersku.shipcusid,wareordersku.shipcusname,'+chr(13)+chr(10)
              +'        WareOrderSKU.Locname,WareOrderSKU.locid,--LI_QuantityRemain=Detail.Quantity_RemainTask, '+chr(13)+chr(10)
              +'        jobnoindp=case when isnull(wareordersku.jobnoin,"")<>"" then "T" else "F" end,'+chr(13)+chr(10)
              +'        jobnooridp=case when isnull(wareordersku.jobnoori,"")<>"" then "T" else "F" end, '+chr(13)+chr(10)
{              +'        WO_CCAID=Detail.costcusid,sku.skucostclasscd,'+chr(13)+chr(10)
              +'        LIOIN.countwho,TaskIN.RentCountUOMType,TaskIN.CostCountUOMType, '+chr(13)+chr(10)}
              +'        sku_customerID=sku.customerno,sku.skucostclasscd,sku.customno,sku.skumodel,sku.color,sku.skuspec,sku.classid,'
              +'        wareordersku.corpno,WareOrderSKU.pricein,WareOrderSKU.SkuCostin,WareOrderSKU.mainorder,  '+chr(13)+chr(10)
              +'        WareOrderSKU.carriage,WareOrderSKU.carriagetotal,WareOrderSKU.insurance,WareOrderSKU.insurancetotal,'+chr(13)+chr(10)
              +'        WareOrderSKU.skustandard,wareordersku.carriagecurrcd,WareOrderSKU.outzoneno,WareOrderSKU.mainorderin  '+chr(13)+chr(10)
              +'   from WareOrderOriSKU WareOrderSKU (nolock)'+chr(13)+chr(10)
              +'                                     left join SKU (nolock)  '+chr(13)+chr(10)
              +'                                            on sku.skuid=wareordersku.skuid '+chr(13)+chr(10)
              +'  where WareOrderSKU.JOBNO=:JOBNO ';
    qryWareOrderInOriSKU.Close;
    qryWareOrderInOriSKU.Sql.Clear;
    qryWareOrderInOriSKU.Sql.Add(strsql);

    //商品库的qry
    strsql :=  ' select WareOrderSKU.*,keyid=WareOrderSKU.sno, '+chr(13)+chr(10)
//              +'        SKU.QUANTITYUOM,'+chr(13)+chr(10)
              +'        piecepro=sku.piecepro, '+chr(13)+chr(10)
              +'        volumepro=sku.volumepro,'+chr(13)+chr(10)
              +'        areapro=sku.areapro,'+chr(13)+chr(10)
              +'        netweightpro=sku.weightpro,'+chr(13)+chr(10)
              +'        grossweightpro=case when isnull(sku.grossweightpro,0)<>0 then sku.grossweightpro else sku.weightpro end,'+chr(13)+chr(10)
              +'        pro1=SKU.pro1,'+chr(13)+chr(10)
              +'        pro2=SKU.pro2,'+chr(13)+chr(10)
              +'        pro3=SKU.pro3,'+chr(13)+chr(10)
              +'        pro4=SKU.pro4,'+chr(13)+chr(10)
              +'        pro5=SKU.pro5,'+chr(13)+chr(10)
              +'        wareordersku.locname,wareordersku.locid,--LI_QuantityRemain=Detail.Quantity_RemainTask,'+chr(13)+chr(10)
              +'        wo_ccaid=detail.costcusid,wo_ccaname=detail.costcusname,sku.skucostclasscd, '+chr(13)+chr(10)
              +'        lioin.countwho,taskin.rentcountuomtype,taskin.costcountuomtype, '+chr(13)+chr(10)
              +'        jobnoindp=case when isnull(wareordersku.jobnoine,"")<>"" then "T" else "F" end, '
              +'        jobnooridp=case when isnull(wareordersku.jobnoori,"")<>"" then "T" else "F" end, '
              +'        sku_customerid=Sku.customerno,sku.customno,sku.skumodel,sku.color,sku.skuspec,sku.classid,  '+chr(13)+chr(10)
              +'        wareordersku.carriage,wareordersku.carriagetotal,wareordersku.insurance,wareordersku.insurancetotal,wareordersku.skustandard,wareordersku.outzoneno,wareordersku.mainorderin  '+chr(13)+chr(10)
              +'   from WareOrderSKU (nolock)'+chr(13)+chr(10)
              +'                     left join LocationoutItem TaskIN (nolock) '+chr(13)+chr(10)
              +'                            on TaskIN.Jobno=WareOrderSKU.jobnoinf '+chr(13)+chr(10)
              +'                           and TaskIN.SNO=WareOrderSKU.snoinf '+chr(13)+chr(10)
              +'                     left join Locationin LIOIN (nolock) '+chr(13)+chr(10)
              +'                            on LIOIN.Jobno=WareOrderSKU.jobnoinf '+chr(13)+chr(10)
              +'                     left join locationindetail Detail (nolock) '+chr(13)+chr(10)
              +'                            on WareOrderSKU.Jobnoin=Detail.Jobno'+chr(13)+chr(10)
              +'                           and WareOrderSKU.snoin=Detail.SNO'+chr(13)+chr(10)
              +'                           and WareOrderSKU.ldsnoin=Detail.ldsno'+chr(13)+chr(10)
              +'                     ,SKU (nolock) '+chr(13)+chr(10)
              +'  where WareOrderSKU.JOBNO=:JOBNO '+chr(13)+chr(10)
              +'    and SKU.SKUID=WareOrderSKU.SKUID '+chr(13)+chr(10);
    qryWareOrderInSKU.Close;

    qryWareOrderInSKU.Sql.Clear;
    qryWareOrderInSKU.Sql.Add(strsql);

    strsql:=' ksp_GetWareorderSkuDetailByJobno @jobno=:jobno ';
    qryWareorderInSkuDetail.Close;
    qryWareorderInSkuDetail.SQL.Clear;
    qryWareorderInSkuDetail.SQL.Add(strsql);
    qryWareorderInSkuDetail.Filtered:=true;
    //集装箱的qry
  {  strsql :=  ' select Container.* '+chr(13)
              +'   from LocationINOUTContainer Container '+chr(13)
              +'  where Container.JOBNO=:JOBNO ';
    qryWareContainer.Close;
    qryWareContainer.Sql.Clear;
    qryWareContainer.Sql.Add(strsql); }
    //假主库过滤条件
    {wql_new if _Filter_CurMonth<>'F' then
    begin }
    decodedate(date,year,month,day);
    Month_Start:=encodedate(year,month,1);
    Month_End  :=IncMonth(Month_Start,1)-1;
    {wql_new end else
    begin
      Month_Start:=date-_Filter_LessDate;
      Month_End  :=date+_Filter_MoreDate;
    end; wql_new}
    if _Loginid<>'SYSTEM' then
    SetButtonEnabled(ToolPanel,'mitWareOrderIn',trim(_UserOrgid));//设置按钮的有效性
    if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then
    begin
       qryWareOrderIn.MacroByName('where').AsString :='(convert(datetime,convert(char(8),wareorder.createdate,112))>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(datetime,convert(char(8),wareorder.createdate,112))<="'+datetostr(month_end)+'")' ;
    end else
    if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) then
    begin
       qryWareOrderIn.MacroByName('where').AsString :='(convert(datetime,convert(char(8),wareorder.createdate,112))>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(datetime,convert(char(8),wareorder.createdate,112))<="'+datetostr(month_end)+'")'
                                                   +'and (wareorder.costopid="'+_loginname+'" or wareorder.createname="'+_loginname+'")' ;
       blnop:=False;
    end;


    if trim(strJobno)='' then
    begin
      {wql_new if _ShowWithNoData='T' then
      begin
        FilterSql:=' 1=2 ';
        with FindItem do
        begin
          Field.Add('11');
          operator.Add('1');
          value.Add('');
          Exp.Add('客户单号          包含      '+'');
        end;
      end else wql_new}
      if _istask='T' then
      begin
         FilterSql:=' not exists(select 1 from wareordersku where wareordersku.jobno=wareorder.jobno )';
      end else
      begin
        FilterSql:=' (convert(datetime,convert(char(8),WareOrder.OrderDate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),WareOrder.OrderDate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('3');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('订单日期          大于等于      '+datetostr(Month_Start));
           Field.Add('3');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('订单日期          小于等于      '+datetostr(Month_End));
        end;
      end;
    end else FilterSql:='';

    if getSysdata('qdtext')='T' then
       FilterSql:=' (exists (select 1 from wareordersku detail'
                 +'                 where detail.jobno=wareorder.jobno '
                 +'                   and isnull(detail.quantity,0)-isnull(quantitytask,0)>0 )'
                 +'or not exists (select 1 from wareordersku detail '
                 +'                where detail.jobno=wareorder.jobno ))';

    qryWareOrderIn.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

    qryWareOrderIn.Open;

    if mode=stInsert then
    begin
       if not btnAdd.Enabled then
       begin
        { if _Language='CAPTIONC' then
            _strmessage:='您无权新增任务资料！'
         else
            _strmessage:=''; }
         KMessageDlg(GetMessage('frmWareOrderDxALL','001'),mtWarning,[mbOK],0);
         Close;
         Exit;
       end;
       SetControlState(stBrowse,true);
       qryWareOrderIn.open;
       grdWareOrderChangeNodeEx(nil);
       btnAdd.Click;
    end else
    begin
       SetControlState(stBrowse,true);
       qryWareOrderIn.Open;
       grdWareOrderChangeNodeEx(nil);
       if strJobno<>''
       then qryWareOrderIn.locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);

       WorkCall(stBrowse);
    end;
    {激活FORM}
//    pcWareOrder.activepage:=tbsBrowse;
    if strJobno<>'' then
    begin
       Top := Top +100;
       ShowModal;
       Free;
    end else
    begin
//wwql_new      if _ShowWithNoData='T' then btnFilter.Click;//yxr
      Show;
    end;
  end;
end;

procedure TfrmWareOrderIn.CreateParams(var Params: TCreateParams);
begin
   if strpJobno<>'' then
   begin
      self.Formstyle := fsNormal;
      self.Visible := False;
      self.Position := poScreenCenter;
   end;
   self.Caption:='进仓指令';
   inherited CreateParams(Params);
end;

procedure TfrmWareOrderIn.WorkCall(CallMode:TDataState);
{模块调用入口
   CallMode:调用状态
       stBrowse:浏览查看
       stInsert:新增
       stEdit:编辑修改}
begin
  DataState:=CallMode;
  with self do
  begin
    case DataState of
      stBrowse:
        begin
          DisableEdit;
          DisableBrowse;
          LampChange(lsBrowse);
          grdWareOrder.ClearSelection;
          if qryWareOrderIn.fieldbyname('jobno').AsString<>'' then
          grdWareOrder.FindNodeByKeyValue(qryWareOrderIn.fieldbyname('jobno').AsString).Selected:=true;
        end;
      stEdit:
        begin
          qryWareOrderIn.Edit;
          EnableEdit;
          //记录修改档案
          qryWareOrderInEdit.Edit;
          strDel_Task:='';
          stroldlotcode:='';
          WareOrder_copyCusID  :='';
          WareOrder_copyCusName:='';
          WareOrder_Copyshippercusid  :='';
          WareOrder_Copyshippercusname:='';
//wql_new          data.wareorder_CopyCostCusid  :='';
//wql_new          data.wareorder_CopyCostCusname:='';
          WareOrder_strOrderCusID:='';
          WareOrder_strOrderCusName:='';
          WareOrder_strOrderShippercusid:='';
          WareOrder_strOrderShippercusname:='';
          strCostcountuom:='';
          qryWareOrderInEdit.FieldByName('ModifyName').Asstring:=_LoginName;
          qryWareOrderInEdit.fieldByname('ModifyDate').AsDatetime:=Now;
          //在修改的状态下，对qryWareOrderInOriSKU循环
          qryWareOrderInOriSKU.DisableControls;
          Bookmark:= qryWareOrderInOriSKU.GetBookmark;
          Wareorder_maxWareOrderOriSKU:=0;
          qryWareOrderInOriSKU.First;
          while not qryWareOrderInOriSKU.Eof do
          begin
            if qryWareOrderInOriSKU.FieldByName('SNO').AsInteger>Wareorder_maxWareOrderOriSKU
               then Wareorder_maxWareOrderOriSKU:=qryWareOrderInOriSKU.FieldByName('SNO').AsInteger;
            qryWareOrderInOriSKU.Next;
          end;
          qryWareOrderInOriSKU.GotoBookmark(Bookmark);
          qryWareOrderInOriSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          qryWareOrderInOriSKU.EnableControls;
          qryWareOrderInOriSKUAfterScroll(qryWareOrderInOriSKU);
          //在修改的状态下，对qryWareOrderInSKU循环
//为了控制库存 ,创建临时表，用于保存原始状态的工作号
          {ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'     drop table #lskOldSku'+chr(13)+chr(10)
                                +'   CREATE TABLE #lskOldSku '+chr(13)+chr(10)
                                +'     ( '+chr(13)+chr(10)
                                +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                +'       snoin          smallint     not null  '+chr(13)+chr(10)
                                +'      ) '+chr(13)+chr(10)
                                 );   }
          qryWareOrderInSKU.DisableControls;
          Bookmark:= qryWareOrderInSKU.GetBookmark;
          Wareorder_maxWareOrderSKU:=0;
          qryWareOrderInSKU.First;
          while not qryWareOrderInSKU.Eof do
          begin
//为了控制库存 ,原始状态的工作号
{            ExecSql(dataTmp.qryTmp,'  insert into #lskOldSku '+chr(13)+chr(10)
                                  +'     (jobnoin,snoin) '+chr(13)+chr(10)
                                  +'   values (       '+chr(13)+chr(10)
                                  +'"'+qryWareOrderInSKU.FieldByName('jobnoin').AsString +'",  '+chr(13)+chr(10)
                                  +'"'+qryWareOrderInSKU.FieldByName('snoin').AsString +'"  '+chr(13)+chr(10)
                                  +'     ) ');
            }
            if qryWareOrderInSKU.FieldByName('SNO').AsInteger>Wareorder_maxWareOrderSKU
               then Wareorder_maxWareOrderSKU:=qryWareOrderInSKU.FieldByName('SNO').AsInteger;
            qryWareOrderInSKU.Next;
          end;
          qryWareOrderInSKU.GotoBookmark(Bookmark);
          qryWareOrderInSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          qryWareOrderInSKU.EnableControls;
          qryWareOrderInSKUAfterScroll(qryWareOrderInSKU);

          LampChange(lsEdit);
        end;
      stInsert:
        begin
//为了控制库存 ,原始状态的工作号
{wql.07.11.21          ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'     drop table #lskOldSku'+chr(13)+chr(10)
                                +'   CREATE TABLE #lskOldSku '+chr(13)+chr(10)
                                +'     ( '+chr(13)+chr(10)
                                +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                +'       snoin          smallint     not null  '+chr(13)+chr(10)
                                +'      ) '+chr(13)+chr(10)
                                 );
}
          qryWareOrderIn.Append;
          if not blncopy then
            begin
              qryWareOrderInEdit.Append;
            end;
          strDel_Task:='';
          OldWareOrderOriSKU:=0;
          wareorder_maxWareOrderOriSKU:=0;
          stroldlotcode:='';
          OldWareOrderSKU:=0;
          Wareorder_maxWareOrderSKU:=0;
          WareOrder_copyCusID  :='';
          WareOrder_copyCusName:='';
          WareOrder_Copyshippercusid  :='';
          WareOrder_Copyshippercusname:='';
//wql_new          data.wareorder_CopyCostCusid  :='';
//wql_new          data.wareorder_CopyCostCusname:='';
          WareOrder_strOrderCusID:='';
          WareOrder_strOrderCusName:='';
          WareOrder_strOrderShippercusid:='';
          WareOrder_strOrderShippercusname:='';
          strCostcountuom :='';

          InitValues;
          EnableEdit;
          //记录档案创建信息
          qryWareOrderInEdit.Edit;
          qryWareOrderInEdit.FieldByName('CreateName').Asstring:=_LoginName;
          qryWareOrderInEdit.fieldByname('CreateDate').AsDatetime:=Now;
          LampChange(lsEdit);
        end;
  end;
  end;
end;

procedure TfrmWareOrderIn.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
    setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
  SetControlState(DataState,False);
  edtOrderID.SetFocus;
  stroldOrderID:=qryWareOrderInEdit.FieldByName('OrderID').Asstring;
  stroldlotcode:=qryWareOrderInOriSKU.fieldbyname('LotCode').AsString;
  stroldCustomsNO:=qryWareOrderInEdit.FieldByName('CustomsNO').Asstring;
  stroldCustomsUnite:=qryWareOrderInEdit.FieldByName('CustomsUnite').Asstring;
   //wql.07.11.20
  {if strOrderType='' then
  begin
     if qryWareOrderIn.FieldByName('DictateType').AsString='进仓指令' then
        strOrderType:='OI'
     else
     if qryWareOrderIn.FieldByName('DictateType').AsString='出仓指令' then
        strOrderType:='OO'
     else
        strOrderType:='VA'
  end; }
  strHistMessage:='';
  strHistDetailMessage:='';
  grdOriSKU.OptionsBehavior:=grdOriSKU.OptionsBehavior+[edgoEditing];
  grdOriSKU.OptionsDB:=grdOriSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdOriSKU.ShowGroupPanel:=False;
  grdOriSKU.ClearGroupColumns;

  grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior+[edgoEditing];
  grdSKU.OptionsDB:=grdSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdSKU.ShowGroupPanel:=False;
  grdSKU.ClearGroupColumns;

  InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+qryWareOrderInEdit.fieldbyname('costcusid').AsString+'"');
end;

procedure TfrmWareOrderIn.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
    setDisable:TsetInt;
begin
  setDisable:=[];
  if trim(strJobno)='' then
  begin
    if qryWareOrderIn.RecordCount=0 then setDisable:=setDisable+[2,4];
    libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
    if qryWareOrderIn.RecordCount=0 then setDisable:=setDisable-[2,4];
  end else
  begin
    libComControl(self,[2..15]+setDisable,[1]);
  end;
  SetControlState(DataState,False);
  //恢复个控键属性
  grdOriSKU.OptionsBehavior:=grdOriSKU.OptionsBehavior-[edgoEditing];
  grdOriSKU.OptionsDB:=grdOriSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdOriSKU.ShowGroupPanel:=True;

  grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior-[edgoEditing];
  grdSKU.OptionsDB:=grdSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdSKU.ShowGroupPanel:=True;
end;

procedure TfrmWareOrderIn.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmWareOrderIn.InitValues;
{初始化时自动生成仓位代码}
var
  strorderid,strDate:string;
begin
  //赋业务联系单号
  opensql(dataTmp.qryTmp,'select datenow=getDate() ');
  strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
  opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                        +'  from genjobno where substring(Jobno,5,2)="WI"' );
  strorderid:='OJ'+strDate+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');
  qryWareOrderInEdit.FieldByName('OrderID').Asstring:=strorderid;
  strWOJobno:=genJobno('WI',strorderid);

  qryWareOrderInEdit.FieldByName('CustomsUnite').Asstring:='F';

  if blnCopy then
  begin
    blnCopy:=False;
    //qryWareOrderEdit复制
    GatherFromArray(qryWareOrderInEdit,arrWareOrderEdit,false);
    qryWareOrderInEdit.FieldByName('JOBNO').Asstring:=strWOJobno;
    qryWareOrderInEdit.FieldByName('DictateType').Asstring :='进仓指令';

    qryWareOrderInEdit.fieldByname('UserID').AsString:=_UserID;
    qryWareOrderInEdit.fieldByname('Username').AsString:=_Username;
    qryWareOrderInEdit.fieldByname('iuserid').AsString:=_UserID;
    qryWareOrderInEdit.fieldByname('iusername').AsString:=_Username;
    //qryWareOrderSKU复制
    qryWareOrderInOriSKU.DisableControls;
    GatherFromArray(qryWareOrderInOriSKU,arrWareOrderOriSKU,true);
    with qryWareOrderInOriSKU do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('JOBNO').AsString:=strWOJobno;
        FieldByName('UserID').Asstring:=_UserID;
        if FieldByName('SNO').AsInteger>maxWareOrderOriSKU
        then maxWareOrderOriSKU:=FieldByName('SNO').AsInteger;
        next;
      end;
      First;
    end;
    qryWareOrderInOriSKU.EnableControls;
    qryWareOrderInOriSKUAfterScroll(qryWareOrderInOriSKU);
  end else
  begin
    if qryInput_PreDetail<>nil then //由接口导入信息
    begin
      blnInserted:=True;//第一次没有关闭窗口时需要的判断
      qryWareOrderInEdit.Edit;
      qryWareOrderInEdit.FieldByName('JOBNO').AsString                :=strWOJobno;
      qryWareOrderInEdit.FieldByName('OperationType').AsString        :=qryInput_PreDetail.FieldByName('OperationType').AsString;
      qryWareOrderInEdit.FieldByName('OrderDate').AsDateTime          :=Now;
      qryWareOrderInEdit.FieldByName('costcusname').AsString  :=qryInput_PreDetail.FieldByName('cusname').AsString;
      qryWareOrderInEdit.FieldByName('costcusid').AsString    :=qryInput_PreDetail.FieldByName('AD_CodeCD').AsString;

      qryWareOrderInEdit.FieldByName('SKUName').AsString              :=qryInput_PreDetail.FieldByName('G_NAME').AsString;
      qryWareOrderInEdit.FieldByName('piece').AsFloat                 :=qryInput_PreDetail.FieldByName('G_PIECE').AsFloat;
      qryWareOrderInEdit.FieldByName('GrossWeight').AsFloat           :=qryInput_PreDetail.FieldByName('GROSS').AsFloat;
      qryWareOrderInEdit.FieldByName('NetWeight').AsFloat             :=qryInput_PreDetail.FieldByName('NETWEIGHT').AsFloat;

      qryWareOrderInEdit.FieldByName('CustomsNO').AsString            :=qryInput_PreDetail.FieldByName('ENTRY_NO').AsString;

      qryInput_PreDetail:=nil;
      //海关数据导入qryInPut_Detail->qryWareOrderInSKU
      qryInput_Detail.First;
      qryWareOrderInOriSKU.DisableControls;
      while not qryInput_Detail.Eof do
      begin
        if not qryInput_Detail.BOF then
        begin
//          if not qryWareOrderSKUBeforePost(qryWareOrderInSKU) then break;
        end;
        qryWareOrderInOriSKU.Append;
        qryWareOrderInOriSKU.FieldByName('jobnoin').AsString        :=qryInput_Detail.FieldByName('jobnoin').AsString;
        qryWareOrderInOriSKU.FieldByName('snoin').AsInteger         :=qryInput_Detail.FieldByName('snoin').AsInteger;
        qryWareOrderInOriSKU.FieldByName('ldsnoin').AsInteger      :=qryInput_Detail.FieldByName('ldsnoin').AsInteger;
        qryWareOrderInOriSKU.FieldByName('jobnoinf').AsString      :=qryInput_Detail.FieldByName('jobnoinf').AsString;
        qryWareOrderInOriSKU.FieldByName('snoinf').AsInteger       :=qryInput_Detail.FieldByName('snoinf').AsInteger;
        qryWareOrderInOriSKU.FieldByName('ldsnoinf').AsInteger    :=qryInput_Detail.FieldByName('ldsnoinf').AsInteger;
        qryWareOrderInOriSKU.FieldByName('SKUID').AsString           :=qryInput_Detail.FieldByName('SkuID').AsString;
        qryWareOrderInOriSKU.FieldByName('QualityName').AsString     :='正品';
        qryWareOrderInOriSKU.FieldByName('SKUName').AsString         :=qryInput_Detail.FieldByName('bdSKUName').AsString;
        qryWareOrderInOriSKU.FieldByName('QUANTITYUOM').AsString     :=qryInput_Detail.FieldByName('UOMp').AsString;
        qryWareOrderInOriSKU.FieldByName('PieceUOM').AsString        :=qryInput_Detail.FieldByName('UOMp').AsString;
        qryWareOrderInOriSKU.FieldByName('WeightUOM').AsString       :='KG';
        qryWareOrderInOriSKU.FieldByName('VolumeUOM').AsString       :='CBM';
        qryWareOrderInOriSKU.FieldByName('AreaUOM').AsString         :='SQM';
        qryWareOrderInOriSKU.FieldByName('Piece').AsFloat       :=iif(qryInput_Detail.FieldByName('Piece').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Piece').AsFloat,
                                                                 qryInput_Detail.FieldByName('QTY').AsFloat) ;
        qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat    :=iif(qryInput_Detail.FieldByName('Quantity').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Quantity').AsFloat,
                                                                 qryInput_Detail.FieldByName('QTY').AsFloat);
        qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat   :=iif(qryInput_Detail.FieldByName('NetWeight').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('NetWeight').AsFloat,
                                                                 qryInput_Detail.FieldByName('G_WEIGHT').AsFloat);
        qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat :=iif(qryInput_Detail.FieldByName('GrossWeight').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('GrossWeight').AsFloat,
                                                                 qryInput_Detail.FieldByName('G_WEIGHT').AsFloat);
        qryWareOrderInOriSKU.FieldByName('Volume').AsFloat      :=iif(qryInput_Detail.FieldByName('Volume').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Volume').AsFloat,
                                                                 strtoFloat(iif(qryInput_Detail.FieldByName('G_VOL').AsString='','0',
                                                                                qryInput_Detail.FieldByName('G_VOL').AsString)));
        qryWareOrderInOriSKU.FieldByName('Area').AsFloat        :=qryInput_Detail.FieldByName('Area').AsFloat;
        qryWareOrderInOriSKU.FieldByName('cusid').AsString         :=iif(qryInput_Detail.FieldByName('cusid').AsString<>'',
                                                                        qryInput_Detail.FieldByName('cusid').AsString,
                                                                        qryWareOrderInEdit.FieldByName('costcusid').AsString);
        qryWareOrderInOriSKU.FieldByName('shippercusid').AsString  :=iif(qryInput_Detail.FieldByName('shippercusid').AsString<>'',
                                                                        qryInput_Detail.FieldByName('shippercusid').AsString,
                                                                        qryWareOrderInEdit.FieldByName('costcusid').AsString);
        qryWareOrderInOriSKU.FieldByName('cusname').AsString       :=iif(qryInput_Detail.FieldByName('cusname').AsString<>'',
                                                                        qryInput_Detail.FieldByName('cusname').AsString,
                                                                        qryWareOrderInEdit.FieldByName('costcusname').AsString);
        qryWareOrderInOriSKU.FieldByName('shippercusname').AsString:=iif(qryInput_Detail.FieldByName('ShipAccName').AsString<>'',
                                                                        qryInput_Detail.FieldByName('ShipAccName').AsString,
                                                                        qryWareOrderInEdit.FieldByName('costcusname').AsString);

        qryWareOrderInOriSKU.fieldbyname('CustomsNO').asstring         :=qryInput_Detail.fieldbyname('IN_ENTRY_NO').asstring ;
        qryWareOrderInOriSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderInEdit.fieldbyname('CustomsNO').asstring ;
        qryWareOrderInOriSKU.fieldbyname('WO_CCAID').asstring          :=qryInput_Detail.FieldByName('costcusid').AsString;
        qryWareOrderInOriSKU.Fieldbyname('price').asFloat           :=qryInput_Detail.fieldbyname('price').asFloat ;
        qryWareOrderInOriSKU.Fieldbyname('currcd').asstring  :=qryInput_Detail.fieldbyname('currcd').asstring ;
        qryWareOrderInOriSKU.fieldbyname('skucost').asFloat      :=qryInput_Detail.fieldbyname('skucost').asFloat ;
        qryWareOrderInOriSKU.fieldbyname('costuomtype').asstring   :=qryInput_Detail.fieldbyname('costuomtype').asstring ;
        qryWareOrderInOriSKU.FieldByName('TagEachUOM').Asstring        :=qryInput_Detail.fieldbyname('TagEachUOM').asstring ;
        qryWareOrderInOriSKU.FieldByName('LocationID').Asstring        :=qryInput_Detail.fieldbyname('locid').asstring ;
        qryWareOrderInOriSKU.FieldByName('LotCode').Asstring           :=qryInput_Detail.fieldbyname('LotCode').asstring ;
        qryWareOrderInOriSKU.FieldByName('WO_TagEach').Asstring        :=qryInput_Detail.fieldbyname('WO_TagEach').asstring ;
        qryWareOrderInOriSKU.FieldByName('contwithloca').Asstring   :=qryInput_Detail.fieldbyname('contwithloca').asstring ;
        qryWareOrderInOriSKU.FieldByName('lottracked').Asstring     :=qryInput_Detail.fieldbyname('lottracked').asstring ;
        qryWareOrderInOriSKU.FieldByName('countrent').Asstring      :=qryInput_Detail.fieldbyname('countrent').asstring ;
        qryWareOrderInOriSKU.FieldByName('countcontcost').Asstring  :=qryInput_Detail.fieldbyname('countcontcost').asstring ;
        qryWareOrderInOriSKU.FieldByName('WO_CCAID').Asstring          :=qryInput_Detail.fieldbyname('WO_CCAID').asstring ;
        qryWareOrderInOriSKU.FieldByName('loadcostone').Asstring    :=qryInput_Detail.fieldbyname('loadcostone').asstring ;
//wql_new        qryWareOrderInOriSKU.FieldByName('LI_QuantityRemain').Asstring :=qryInput_Detail.fieldbyname('LI_QuantityRemain').asstring ;
        qryWareOrderInOriSKU.FieldByName('skucostclasscd').Asstring    :=qryInput_Detail.fieldbyname('skucostclasscd').asstring ;
        qryWareOrderInOriSKU.FieldByName('isbond').Asstring:=qryInput_Detail.fieldbyname('isbond').asstring ;
        qryWareOrderInOriSKU.FieldByName('warerentcounttype').Asstring :=qryInput_Detail.fieldbyname('warerentcounttype').asstring ;
        qryWareOrderInOriSKU.FieldByName('LocationBillno').Asstring    :=qryInput_Detail.fieldbyname('LocationBillno').asstring ;
        qryWareOrderInOriSKU.FieldByName('OrderStatus').Asstring:='H';
        qryWareOrderInOriSKU.FieldByName('NotFullSign').Asstring:='F';
        qryInput_Detail.next;
      end;
      qryWareOrderInOriSKU.EnableControls;

      qryWareOrderInOriSKUAfterScroll(qryWareOrderInOriSKU);
      if pcWareOrder.ActivePage<>tbsEdit then
         pcWareOrder.ActivePage:=tbsEdit;
      self.ActiveControl:=grdOriSKU;
    end else
    begin

      qryWareOrderInEdit.FieldByName('Disaccord').Asstring:='';
      qryWareOrderInEdit.FieldByName('OrderStatus').Asstring:='H';
      qryWareOrderInEdit.FieldByName('OperationType').AsInteger:=1;
      qryWareOrderInEdit.FieldByName('OrderDate').AsDateTime:=Now;
      qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring:=_ACC_warerentcounttype;
      qryWareOrderInEdit.fieldbyname('warerentcounttypeout').asstring:=_ACC_warerentcounttypeout;
//      qryWareOrderInEdit.fieldbyname('iuserid').asstring          :=_ACC_iuserid;
//      qryWareOrderInEdit.fieldbyname('iusername').asstring        :=_ACC_iusername;
      qryWareOrderInEdit.fieldbyname('loadtype').asstring         :=_ACC_loadtype;
      qryWareOrderInEdit.fieldbyname('contwithloca').asstring     :=_ACC_contwithloca;
      qryWareOrderInEdit.fieldbyname('lottracked').asstring       :=_ACC_lottracked;
      qryWareOrderInEdit.fieldbyname('isbond').asstring           :=_ACC_isbond;
      qryWareOrderInEdit.fieldbyname('countrent').asstring        :=_ACC_countrent;
      qryWareOrderInEdit.fieldbyname('countcontcost').asstring    :=_ACC_countcontcost;
//      qryWareOrderInEdit.fieldbyname('tageach').asstring          :=_ACC_tageach;
      qryWareOrderInEdit.fieldbyname('skucostclasscd').asstring   :=_ACC_skucostclasscd;
    end;

    qryWareOrderInEdit.FieldByName('JOBNO').Asstring:=strWOJOBNO;
    qryWareOrderInEdit.FieldByName('DictateType').Asstring :='进仓指令';
    qryWareOrderInEdit.FieldByName('UserID').Asstring:=_UserID;
    qryWareOrderInEdit.FieldByName('Username').Asstring:=_Username;
    qryWareOrderInEdit.fieldByname('iuserid').AsString:=_UserID;
    qryWareOrderInEdit.fieldByname('iusername').AsString:=_Username;
  end;

  qryWareOrderIn.fieldbyname('JOBNO').asstring     :=qryWareOrderInEdit.fieldbyname('JOBNO').asstring;
  qryWareOrderIn.FieldByName('DictateType').Asstring :='进仓指令';
  dataTmp.qryTmp.Close;
end;

procedure TfrmWareOrderIn.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
//
end;


procedure TfrmWareOrderIn.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  if blnCreate then
  begin
    caption:='进仓指令';
  end;
  if CallMode in SetDcs then
  begin
    btnRate.Visible :=true;
    btnTotal.Visible:=True;
  end else
  begin
    btnRate.Visible:=False;
    btnTotal.Visible:=False;
  end;
end;

function TfrmWareOrderIn.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
  extQuantity,extpiece,extoriQuantity,extoripiece:extended;
  extNetWeightRemain,extCostquantity:extended;
  strwarning,strmainorder,strmainorderin:string;
begin
  Result:=False;

  if edtOrderID.Text='' then
  begin
    pcInfo.ActivePage:=tbsWareOrder;
    ActiveControl:=edtOrderID;
    {if _Language='CAPTIONC'then
       _strmessage:='指令单号不能为空，必须填写'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','002'),mtWarning,[mbOK],0);
    exit;
  end else
  if edtCostcusid.Text='' then
  begin
//    pcWareOrder.ActivePage:=tbsEdit;
    ActiveControl:=edtCostcusid;
    {if _Language='CAPTIONC'then
       _strmessage:='费用关系人不能为空，必须填写'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','003'),mtWarning,[mbOK],0);
    exit;
  end else
  if cmbSKUCOSTCLASSCD.Text='' then
  begin
//    pcInfo.ActivePage:=tbsWareContainer;
    ActiveControl:=cmbSKUCOSTCLASSCD;
    {if _Language='CAPTIONC'then
       _strmessage:='计费商品类不能为空，必须填写'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','004'),mtWarning,[mbOK],0);
    exit;
  end else
  if cmbWareRentCountWay.Text='' then
  begin
    pcInfo.ActivePage:=tbsWareOrder;
    ActiveControl:=cmbWareRentCountWay;
    {if _Language='CAPTIONC'then
       _strmessage:='仓租计算方式不能为空，必须填写'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','005'),mtWarning,[mbOK],0);
    exit;
  end else
  if (_DB_Order='T') then
  begin
     qryWareOrderInOriSKU.First;
     if qryWareOrderInOriSKU.RecordCount>1 then
     begin
       {if _Language='CAPTIONC'then
          _strmessage:='原始指令信息只能有唯一商品信息!'
       else
          _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','007'), mtWarning, [mbOK], 0);
        exit;
     end;
  end;
  if (_isneedop<>'F') and (edtCostopid.Text='') then
  begin
     if pcInfo.ActivePage<>tbsWareOrder then pcInfo.ActivePage:=tbsWareOrder;
     kMessageDlg('业务员不能为空！', mtWarning, [mbOK], 0);
     edtCostopid.SetFocus;
     exit;
  end;

  extQuantity:=0;
  extNetWeightRemain:=0;
  extCostquantity:=0;
  extpiece:=0;
  extoriQuantity:=0;
  extoripiece:=0;
  strmainorder:='';
  strmainorderin:='';
  qryWareOrderInSKU.DisableControls;
  qryWareOrderInSKU.First;
  while not qryWareOrderInSKU.Eof do
  begin
     extQuantity:=extQuantity+qryWareOrderInSKU.FieldByName('Quantity').AsFloat;
     extpiece:=extpiece+qryWareOrderInSKU.FieldByName('piece').AsFloat;
     extNetWeightRemain:=extNetWeightRemain+qryWareOrderInSKU.FieldByName('NetWeight').AsFloat;
     extCostquantity:=extCostquantity+qryWareOrderInSKU.fieldbyname('costquantity').AsFloat;
     strmainorder:=strmainorder+qryWareOrderInOriSKU.fieldbyname('mainorder').AsString;
     strmainorderin:=strmainorderin+qryWareOrderInOriSKU.fieldbyname('mainorderin').AsString;
     qryWareOrderInSKU.Next;
  end;
  qryWareOrderInSKU.EnableControls;
  qryWareOrderInOriSKU.Edit;

  qryWareOrderInOriSKU.DisableControls;
  qryWareOrderInOriSKU.First;
  while not qryWareOrderInOriSKU.Eof do
  begin
     extoriQuantity:=extoriQuantity+qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
     extoripiece:=extoripiece+qryWareOrderInOriSKU.FieldByName('piece').AsFloat;
     qryWareOrderInOriSKU.Next;
  end;
  qryWareOrderInOriSKU.EnableControls;
  qryWareOrderInOriSKU.Edit;
  qryWareOrderInOriSKU.FieldByName('QuantityReMain').AsFloat:=qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat-extQuantity;
//wql_new  qryWareOrderInOriSKU.FieldByName('NetWeightRemain').AsFloat:=qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat-extNetWeightRemain;
  qryWareOrderInEdit.Edit;
  qryWareOrderInEdit.FieldByName('QuantityOri').AsFloat :=extoriQuantity;
  qryWareOrderInEdit.FieldByName('PieceOri').AsFloat    :=extoripiece;
  qryWareOrderInEdit.FieldByName('Piecesl').AsFloat    :=qryWareOrderInEdit.FieldByName('PieceOri').AsFloat-qryWareOrderInOriSKU.FieldByName('piece').AsFloat;
  qryWareOrderInEdit.FieldByName('SkuNameOri').AsString :=qryWareOrderInOriSKU.FieldByName('SkuName').AsString;
  qryWareOrderInEdit.FieldByName('Quantity').AsFloat    :=extQuantity;
  qryWareOrderInEdit.FieldByName('piece').AsFloat    :=extpiece;
  qryWareOrderInEdit.FieldByName('costquantity').AsFloat:=extCostquantity;
//  qryWareOrderInEdit.FieldByName('mainorderin').AsString:=qryWareOrderInOriSKU.FieldByName('mainorderin').AsString;


  if (_DB_Order='T') and (qryWareOrderInOriSKU.FieldByName('QuantityReMain').AsFloat<0) then
  begin
     kMessageDlg(GetMessage('frmWareOrderDxALL','047'), mtWarning, [mbOK], 0);    //校验后指令数量大于原始指令数量! Added by wql 2006.2.14 14:36:29
     exit;
  end;

  {if (_DB_Order='T') and (qryWareOrderInOriSKU.FieldByName('NetWeightRemain').AsFloat<0) then
  begin
     if _Language='CAPTIONC'then
        _strmessage:='校验后指令净重大于原始指令净重!'
     else
        _strmessage:='';
     kMessageDlg(GetMessage('frmWareOrderDxALL','008'), mtWarning, [mbOK], 0);
     exit;
  end;
  }
  begin
  //原始指令商品
    qryWareOrderInOriSKU.DisableControls;
    qryWareOrderInOriSKU.first;
    while not qryWareOrderInOriSKU.eof do
    begin
      //批次控制
      if (qryWareOrderInEdit.fieldbyname('lottracked').asstring='T')
      and (qryWareOrderInOriSKU.fieldbyname('LotCode').asstring='') then
      begin
        {if _Language='CAPTIONC'then
           _strmessage:='批次不能为空!'
        else
           _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','009'), mtWarning, [mbOK], 0);
        grdOriSKU.setfocus;
        qryWareOrderInOriSKU.enablecontrols;
        exit;
      end;
      qryWareOrderInOriSKU.Edit;
      qryWareOrderInOriSKU.fieldbyname('Jobno').asstring :=qryWareOrderInEdit.fieldbyname('Jobno').asstring;
      qryWareOrderInOriSKU.fieldbyname('OPERATIONTYPE').asInteger:=1;
      qryWareOrderInOriSKU.fieldbyname('userid').asstring:=qryWareOrderInEdit.fieldbyname('userid').asstring;
      qryWareOrderInOriSKU.fieldbyname('username').asstring:=qryWareOrderInEdit.fieldbyname('username').asstring;
      qryWareOrderInOriSKU.fieldbyname('OrderDate').asDateTime:=qryWareOrderInEdit.fieldbyname('OrderDate').asDateTime;
      qryWareOrderInOriSKU.fieldbyname('orderid').asstring:=qryWareOrderInEdit.fieldbyname('orderid').asstring;
      qryWareOrderInOriSKU.fieldbyname('mainorder').asstring:=qryWareOrderInEdit.fieldbyname('mainorder').asstring;
      qryWareOrderInOriSKU.fieldbyname('corpno').asstring:=qryWareOrderInEdit.fieldbyname('corpno').asstring;

{      if (strOrderType='OI') and (qryWareOrderInSKU.fieldbyname('WO_CCAID').asstring<>qryWareOrderInEdit.fieldbyname('costcusid').asstring) then
        if KmessageDlg('商品信息费用关系人与出仓指令费用关系人不同，是否要存?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        //
        else exit;
      if strInout<>'I' then
        qryWareOrderInOriSKU.fieldbyname('costcusid').asstring:=qryWareOrderInSKU.fieldbyname('WO_CCAID').asstring
      else
        qryWareOrderInOriSKU.fieldbyname('costcusid').asstring:=qryWareOrderInEdit.fieldbyname('costcusid').asstring;
}
        qryWareOrderInOriSKU.fieldbyname('jobnoinf').asstring:='';
        qryWareOrderInOriSKU.fieldbyname('snoinf').asInteger:=0;
        qryWareOrderInOriSKU.fieldbyname('ldsnoinf').asInteger:=0;
        qryWareOrderInOriSKU.fieldbyname('CustomsNO').asstring:=qryWareOrderInEdit.fieldbyname('CustomsNO').asstring;
        qryWareOrderInOriSKU.fieldbyname('isbond').asstring:=qryWareOrderInEdit.fieldbyname('isbond').asstring;
        qryWareOrderInOriSKU.fieldbyname('countrent').asstring:=qryWareOrderInEdit.fieldbyname('countrent').asstring;
        qryWareOrderInOriSKU.fieldbyname('countcontcost').asstring:=qryWareOrderInEdit.fieldbyname('countcontcost').asstring;
        qryWareOrderInOriSKU.fieldbyname('lottracked').asstring:=qryWareOrderInEdit.fieldbyname('lottracked').asstring;
        qryWareOrderInOriSKU.fieldbyname('contwithloca').asstring:=qryWareOrderInEdit.fieldbyname('contwithloca').asstring;
        qryWareOrderInOriSKU.fieldbyname('warerentcounttype').asstring:=qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring;
        qryWareOrderInOriSKU.fieldbyname('costcusid').asstring:=qryWareOrderInEdit.fieldbyname('costcusid').asstring;
        qryWareOrderInOriSKU.fieldbyname('costcusname').asstring:=qryWareOrderInEdit.fieldbyname('costcusname').asstring;
//wql_05/05/10 出仓指令挑选商品时取进仓费用关系人，因此只需对进仓指令的商品信息赋费用关系人
//      qryWareOrderInOriSKU.fieldbyname('costcusid').asstring:=qryWareOrderInEdit.fieldbyname('costcusid').asstring;
//      qryWareOrderInOriSKU.fieldbyname('costcusname').asstring:=qryWareOrderInEdit.fieldbyname('costcusname').asstring;
      qryWareOrderInOriSKU.Next;
    end;
    qryWareOrderInOriSKU.First;
    qryWareOrderInOriSKU.EnableControls;
    qryWareOrderInOriSKUAfterScroll(qryWareOrderInOriSKU);

  //指令商品
    qryWareOrderInSKU.DisableControls;
    qryWareOrderInSKU.first;
    while not qryWareOrderInSKU.eof do
    begin
      //批次控制
      if (qryWareOrderInEdit.fieldbyname('lottracked').asstring='T')
      and (qryWareOrderInSKU.fieldbyname('LotCode').asstring='') then
      begin
        {if _Language='CAPTIONC'then
           _strmessage:='批次不能为空!'
        else
           _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','009'), mtWarning, [mbOK], 0);
        if pcInfo.activepage<>tbsWareOrderSKU
        then pcInfo.activepage:=tbsWareOrderSKU;
        grdSKU.setfocus;
        qryWareOrderInSKU.enablecontrols;
        exit;
      end;
      strwarning:='';
      if ((qryWareOrderInEdit.FieldByName('jobnoin').AsString<>'')
      and (qryWareOrderInSKU.FieldByName('jobnoine').AsString='')) then
      begin
         strwarning:=strwarning+iif(_language='CAPTIONC','序号为','')+qryWareOrderInSKU.FieldByName('sno').asstring
                               +iif(_language='CAPTIONC','商品名称为','')+qryWareOrderInSKU.FieldByName('skuname').asstring+chr(13)+chr(10);
      end;
      qryWareOrderInSKU.Edit;
      qryWareOrderInSKU.fieldbyname('Jobno').asstring :=qryWareOrderInEdit.fieldbyname('Jobno').asstring;
      qryWareOrderInSKU.fieldbyname('OPERATIONTYPE').asInteger:=1;
      qryWareOrderInSKU.fieldbyname('username').asstring:=qryWareOrderInEdit.fieldbyname('username').asstring;
      qryWareOrderInSKU.fieldbyname('userid').asstring:=qryWareOrderInEdit.fieldbyname('userid').asstring;
      qryWareOrderInSKU.fieldbyname('orderid').asstring:=qryWareOrderInEdit.fieldbyname('orderid').asstring;
      qryWareOrderInSKU.fieldbyname('OrderDate').asDateTime:=qryWareOrderInEdit.fieldbyname('OrderDate').asDateTime;
      qryWareOrderInSKU.fieldbyname('mainorder').asstring:=qryWareOrderInEdit.fieldbyname('mainorder').asstring;
      qryWareOrderInSKU.fieldbyname('corpno').asstring:=qryWareOrderInEdit.fieldbyname('corpno').asstring;

{      if (strInout<>'I') and (qryWareOrderInSKU.fieldbyname('WO_CCAID').asstring<>qryWareOrderInEdit.fieldbyname('costcusid').asstring) then
        if KmessageDlg('商品信息费用关系人与出仓指令费用关系人不同，是否要存?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        //
        else exit;
}
     { wql_new
      if (strOrderType='OI') or ((strOrderType='VA') and (qryWareOrderInSKU.fieldbyname('OperationType').AsInteger=1)) then
      begin
        qryWareOrderInSKU.fieldbyname('costcusid').asstring:=qryWareOrderInEdit.fieldbyname('costcusid').asstring;
        qryWareOrderInSKU.fieldbyname('costcusname').asstring:=qryWareOrderInEdit.fieldbyname('costcusname').asstring
      end else
      begin
        qryWareOrderInSKU.fieldbyname('costcusid').asstring:=qryWareOrderInSKU.fieldbyname('WO_CCAID').asstring;
        qryWareOrderInSKU.fieldbyname('costcusname').asstring:=qryWareOrderInSKU.fieldbyname('wo_ccaname').asstring;
      end;
      wql_new }
      qryWareOrderInSKU.fieldbyname('jobnoinf').asstring:='';
      qryWareOrderInSKU.fieldbyname('snoinf').asInteger:=0;
      qryWareOrderInSKU.fieldbyname('ldsnoinf').asInteger:=0;
      qryWareOrderInSKU.fieldbyname('CustomsNO').asstring:=qryWareOrderInEdit.fieldbyname('CustomsNO').asstring;
      qryWareOrderInSKU.fieldbyname('cusbillno').asstring:=qryWareOrderInEdit.fieldbyname('cusbillno').asstring;
      qryWareOrderInSKU.fieldbyname('isbond').asstring:=qryWareOrderInEdit.fieldbyname('isbond').asstring;
      qryWareOrderInSKU.fieldbyname('countrent').asstring:=qryWareOrderInEdit.fieldbyname('countrent').asstring;
      qryWareOrderInSKU.fieldbyname('countcontcost').asstring:=qryWareOrderInEdit.fieldbyname('countcontcost').asstring;
      qryWareOrderInSKU.fieldbyname('lottracked').asstring:=qryWareOrderInEdit.fieldbyname('lottracked').asstring;
      qryWareOrderInSKU.fieldbyname('contwithloca').asstring:=qryWareOrderInEdit.fieldbyname('contwithloca').asstring;
      qryWareOrderInSKU.fieldbyname('warerentcounttype').asstring:=qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring;
      qryWareOrderInSKU.fieldbyname('costopid').asstring:=qryWareOrderInEdit.fieldbyname('costopid').asstring;

//wql_05/05/10 出仓指令挑选商品时取进仓费用关系人，因此只需对进仓指令的商品信息赋费用关系人
      qryWareOrderInSKU.fieldbyname('costcusid').asstring:=qryWareOrderInEdit.fieldbyname('costcusid').asstring;
      qryWareOrderInSKU.fieldbyname('costcusname').asstring:=qryWareOrderInEdit.fieldbyname('costcusname').asstring;
      if qryWareorderInSkuDetail.active then
      begin
         grdSKUChangeNodeEx(nil);
         qryWareorderInSkuDetail.First;
         while not qryWareorderInSkuDetail.Eof do
         begin
            qryWareorderInSkuDetail.Edit;
            qryWareorderInSkuDetail.fieldbyname('jobno').asstring:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
            qryWareorderInSkuDetail.fieldbyname('quantityremain').AsFloat:=qryWareorderInSkuDetail.fieldbyname('quantity').AsFloat;
            qryWareorderInSkuDetail.fieldbyname('lotcode').asstring:=qryWareOrderInSKU.fieldbyname('lotcode').AsString;
            qryWareorderInSkuDetail.Next;
         end;
       end;
      qryWareOrderInSKU.Next;
    end;
    qryWareOrderInSKU.First;
    qryWareOrderInSKU.EnableControls;
    qryWareOrderInSKUAfterScroll(qryWareOrderInSKU);
   //这段代码用来提示明细未对应原始指令用的
    if strwarning<>'' then
    begin
       kMessageDlg(strwarning+GetMessage('frmWareOrderDxALL','010'), mtWarning, [mbOK], 0);
       if pcInfo.activepage<>tbsWareOrderSKU
       then pcInfo.activepage:=tbsWareOrderSKU;
       grdSKU.setfocus;
    //   exit;
    end;

    //判断LocationBillNO是否有重复
    if stroldOrderID<>qryWareOrderInEdit.FieldByName('OrderID').Asstring then
    begin
      opensql(dataTmp.qryTmp,'select LBNOnum=count(1)'
                    +'  from WareOrder '
                    +' where OrderID="'+qryWareOrderInEdit.FieldByName('OrderID').Asstring+'"');
      if dataTmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0 then
         if KmessageDlg(GetMessage('frmWareOrderDxALL','011'),mtConfirmation,[mbYes,mbNo],0)=mrNO then//iif(_language='CAPTIONC','存在相同的指令单号,是否要保存?',''
            exit;
    end;

    //判断CustomsNO是否有重复
    if (stroldCustomsNO<>qryWareOrderInEdit.FieldByName('CustomsNO').Asstring) then
    begin
      opensql(dataTmp.qryTmp,'select LBNOnum=count(1)'
                    +'  from WareOrder '
                    +' where CustomsNO="'+qryWareOrderInEdit.FieldByName('CustomsNO').Asstring+'"');
      if (dataTmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0) then
         if KmessageDlg(GetMessage('frmWareOrderDxALL','012'),mtConfirmation,[mbYes,mbNo],0)=mrNO then//iif(_language='CAPTIONC','存在相同的报关单号,是否要保存?','')
            exit;
    end;

    //给假主库信息付值
    qryWareOrderIn.FieldByName('OrderID').Asstring:= qryWareOrderInEdit.FieldByName('OrderID').AsString ;
    qryWareOrderIn.FieldByName('OrderDate').Asstring:= qryWareOrderInEdit.FieldByName('OrderDate').AsString ;
    qryWareOrderIn.FieldByName('skucostclasscd').Asstring:= qryWareOrderInEdit.FieldByName('skucostclasscd').AsString ;
    qryWareOrderIn.FieldByName('UploadDate').Asstring:= qryWareOrderInEdit.FieldByName('UploadDate').AsString ;
    qryWareOrderIn.FieldByName('ActualDate').Asstring:= qryWareOrderInEdit.FieldByName('ActualDate').AsString ;
    qryWareOrderIn.FieldByName('Quantity').Asstring:= qryWareOrderInEdit.FieldByName('Quantity').AsString ;
    qryWareOrderIn.FieldByName('Piece').Asstring:= qryWareOrderInEdit.FieldByName('Piece').AsString ;
    qryWareOrderIn.FieldByName('Quantityori').Asstring:= qryWareOrderInEdit.FieldByName('Quantityori').AsString ;
    qryWareOrderIn.FieldByName('Pieceori').Asstring:= qryWareOrderInEdit.FieldByName('Pieceori').AsString ;
    qryWareOrderIn.FieldByName('Piecesl').Asstring:= qryWareOrderInEdit.FieldByName('Piecesl').AsString ;
    qryWareOrderIn.FieldByName('CreateName').Asstring:= qryWareOrderInEdit.FieldByName('CreateName').AsString ;
    qryWareOrderIn.FieldByName('CreateDate').Asstring:= qryWareOrderInEdit.FieldByName('CreateDate').AsString ;
    qryWareOrderIn.FieldByName('CheckName').Asstring:= qryWareOrderInEdit.FieldByName('CheckName').AsString ;
    qryWareOrderIn.FieldByName('CheckDate').Asstring:= qryWareOrderInEdit.FieldByName('CheckDate').AsString ;
    qryWareOrderIn.FieldByName('costcusid').Asstring:= qryWareOrderInEdit.Fieldbyname('costcusid').asstring ;
    qryWareOrderIn.FieldByName('costcusname').Asstring:= qryWareOrderInEdit.Fieldbyname('costcusname').asstring ;
    qryWareOrderIn.FieldByName('shipcusname').Asstring:= qryWareOrderInEdit.FieldByName('shipcusname').AsString ;
    qryWareOrderIn.FieldByName('shipcusid').Asstring:= qryWareOrderInEdit.FieldByName('shipcusid').AsString ;
    qryWareOrderIn.FieldByName('CustomsNO').Asstring:= qryWareOrderInEdit.FieldByName('CustomsNO').AsString ;
    qryWareOrderIn.FieldByName('customsunite').Asstring:= qryWareOrderInEdit.FieldByName('customsunite').AsString ;
    qryWareOrderIn.fieldByname('orderdaterq').asString:=datetostr(qryWareOrderInEdit.fieldByname('orderdate').AsDateTime);
    qryWareOrderIn.fieldByname('orderdatesj').asString:=timetostr(qryWareOrderInEdit.fieldByname('orderdate').AsDateTime);
    qryWareOrderIn.fieldByname('mainorder').asString:=qryWareOrderInEdit.fieldByname('mainorder').AsString;
//    qryWareOrderIn.fieldByname('mainorderin').asString:=qryWareOrderInEdit.fieldByname('mainorderin').AsString;

    Result:=True;
  end;
end;


procedure TfrmWareOrderIn.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetGroupbox(KGroupBox7);
  SetGroupbox(KGroupBox5);
  SetGroupbox(KGroupBox9);
  SetDxDbGrid(grdWareOrder);
  SetDxDbGrid(grdSKU);
  SetDxDbGrid(grdOriSKU);
  Height:=473;
  Width:=723;
  pcWareOrder.ActivePage:=tbsBrowse;
  pcInfo.ActivePage:=tbsWareOrder;
  qryWareOrderIn.connection:=_ADOConnection;
  qryWareOrderInEdit.connection:=_ADOConnection;
  qryWareOrderInSKU.connection:=_ADOConnection;
  qryWareOrderInOriSKU.connection:=_ADOConnection;
  qryWareorderInSkuDetail.connection:=_ADOConnection;
end;

procedure TfrmWareOrderIn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmWareOrderIn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid)  then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
    pcInfo.ActivePage := tbsWareOrder;
    if DataState in Setdcs then ActiveControl:=edtOrigincusid;
  end else
  if Key=Vk_F6 then
  begin
    pcInfo.ActivePage := tbsWareOrderSKU;
    if DataState in Setdcs then ActiveControl:=grdSKU;
  end;
  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pcWareOrder.ActivePage=tbsEdit then
        begin
          pcWareOrder.ActivePage:=tbsBrowse;
        end else
        begin
          pcWareOrder.ActivePage:=tbsEdit;
        end;
      Ord('T'):KeyDownControl(Key,btnFirst);
      Ord('P'):KeyDownControl(Key,btnPrior);
      Ord('N'):KeyDownControl(Key,btnNext);
      Ord('B'):KeyDownControl(Key,btnLast);
      Ord('U'):KeyDownControl(Key,btnRefresh);

      Ord('E'):KeyDownControl(Key,btnEdit);
      Ord('A'):KeyDownControl(Key,btnAdd);
      Ord('D'):KeyDownControl(Key,btnDelete);
//      Ord('C'):KeyDownControl(Key,btnCopy);

      Ord('F'):KeyDownControl(Key,btnFind);
      Ord('R'):KeyDownControl(Key,btnRefind);
      Ord('L'):KeyDownControl(Key,btnFilter);
//      Ord('O'):KeyDownControl(Key,btnPrint);

      Ord('V'):KeyDownControl(Key,btnCheck);
      Ord('S'):KeyDownControl(Key,btnTotal);
      Ord('K'):KeyDownControl(Key,btnTask);
      Vk_Escape:KeyDownControl(Key,btnClose);
    end;
  end else
  begin
    case Key of
      Vk_Escape:
       self.btnCancel.SetFocus;
      Vk_End,Ord('W'):
       if ssCtrl in Shift then self.btnSave.SetFocus;
    end;
  end;
end;

procedure TfrmWareOrderIn.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if not ScrollAfterEdit and blnOpen then
  begin
    if qryWareOrderInEdit.Active then
    begin
      qryWareOrderInEdit.Close;
      qryWareOrderInEdit.Open;
    end;
    if qryWareOrderInOriSKU.Active then
    begin
      qryWareOrderInOriSKU.Close;
      qryWareOrderInOriSKU.Open;
    end;
    if qryWareOrderInSKU.Active then
    begin
      qryWareOrderInSKU.Close;
      qryWareOrderInSKU.Open;
    end;
    ScrollAfterEdit:=True;
  end;

  if not blnPage then
  begin
    qryWareOrderInEdit.Active  :=blnOpen;
    qryWareOrderInOriSKU.Active   :=blnOpen;
    qryWareOrderInSKU.Active   :=blnOpen;
  end else
  begin
    qryWareOrderInEdit.Active  :=blnOpen;
    if pcInfo.ActivePage=tbsWareOrderSKU  then qryWareOrderInOriSKU.Active  := blnOpen;
    if pcInfo.ActivePage=tbsWareOrder  then qryWareOrderInSKU.Active  := blnOpen;
  end;
end;



procedure TfrmWareOrderIn.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryWareOrderInOriSKU.Close;
  qryWareOrderInSKU.Close;
  qryWareOrderInEdit.Close;
  qryWareOrderIn.Close;
  sltselect.Destroy;
  frmWareOrderIn:=nil;
end;

procedure TfrmWareOrderIn.btnBrowMxClick(Sender: TObject);
begin
  pcWareOrder.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
  pcWareOrderChange(self);
end;

procedure TfrmWareOrderIn.btnBrowGlClick(Sender: TObject);
begin
  pcWareOrder.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
  pcWareOrderChange(self);
end;

procedure TfrmWareOrderIn.pcWareOrderChange(Sender: TObject);
begin
   if pcWareOrder.activepage = tbsEdit then
   begin
      pcInfo.ActivePage:=tbsWareOrder;
      SetDetailActive(True,True);
      btnBrowmx.Visible := false;
      btnBrowGl.Visible := true;
   end;
   if pcWareOrder.activepage = tbsBrowse then
   begin
      btnBrowgl.Visible := false;
      btnBrowmx.Visible := true;
   end;
end;

procedure TfrmWareOrderIn.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmWareOrderIn.mitAddSKUClick(Sender: TObject);
begin
  qryWareOrderInSKU.Append;
  grdSKU.SetFocus;
  grdSKUBeforeInsert;
end;

procedure TfrmWareOrderIn.mitDelSKUClick(Sender: TObject);
begin
  if qryWareOrderInSKU.FieldByName('SNO').AsInteger<>0 then
  begin
    if qryWareOrderInSKU.FieldByName('Quantitytask').AsFloat<>0 then
    begin
       {if _Language='CAPTIONC'then
          _strmessage:='该指令单已经生成任务，不能删除！'
       else
          _strmessage:='';}
       kMessageDlg(GetMessage('frmWareOrderDxALL','013'),mtWarning,[mbOK],0);
       exit;
    end;
    if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      strDel_Task:=strDel_Task+' or SNO='+qryWareOrderInSKU.fieldbyname('SNO').Asstring;
      if sltselect.IndexOf(qryWareOrderInSKU.fieldbyname('jobnoin').AsString+
                            qryWareOrderInSKU.fieldbyname('snoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(qryWareOrderInSKU.fieldbyname('jobnoin').AsString+
                          qryWareOrderInSKU.fieldbyname('snoin').AsString));

      qryWareOrderInSKU.Delete;
      grdSKU.SetFocus;
    end;
  end;
end;

procedure TfrmWareOrderIn.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=qryWareOrderIn.fieldbyname('jobno').asstring;
  if Sender = btnRefresh then
  begin
    SetDetailActive(False,False);
    qryWareOrderIn.Close;
    qryWareOrderIn.DisableControls;
    qryWareOrderIn.Open;
    try
      qryWareOrderIn.locate('jobno',strXmh,[loCaseInsensitive, loPartialKey]);
    except
      qryWareOrderIn.Last;
    end;
    qryWareOrderIn.EnableControls;
//    grdWareOrderChangeNodeEx(nil);
//wql.05.09.16    SetDetailActive(False,False);
    SetDetailActive(True,True);
    WorkCall(stBrowse);
  end else
  begin
    RefreshCurrentData(qryWareOrderIn,' WareOrder.Jobno="'+strXmh+'" ');
//wql.05.09.16    grdWareOrderChangeNodeEx(nil);
     if pcWareOrder.ActivePage=tbsEdit then      //wql.05.09.16 
        SetDetailActive(True,True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmWareOrderIn.btnEditClick(Sender: TObject);
var
  strWareTask:String;
begin
{  if (_canmodifyother<>'T') and (qryWareOrderIn.FieldByName('CreateName').asstring<>_LoginName) then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单不是您输入的，不能修改！'
    else
       _strmessage:=''; 
    kMessageDlg(GetMessage('frmWareOrderDxALL','014'),mtWarning,[mbOK],0);
    exit;
  end; }
  if qryWareOrderIn.FieldByName('CheckName').asstring<>'' then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单已审核，不能修改！'
    else
       _strmessage:='';}
    kMessageDlg(GetMessage('frmWareOrderDxALL','015'),mtWarning,[mbOK],0);
    exit;
  end;

  if (_DB_Order<>'T')then
  begin
     OpenSql(dataTmp.qryTmp,' Select task.Jobno,task.SNO'
                           +'   from locationinitem task '+chr(13)+chr(10)
                           +'  where task.jobnoorder="'+qryWareOrderIn.FieldByName('jobno').AsString+'"');
     dataTmp.qryTmp.First;
     strWareTask:='';
     if  dataTmp.qryTmp.FieldByName('Jobno').AsString<>'' then
     begin
       while not dataTmp.qryTmp.Eof do
       begin
         strWareTask:=strWareTask+GetMessage('frmWareOrderDxALL','016')    //iif(_language='CAPTIONC','工作单号：','')
                                 +dataTmp.qryTmp.FieldByName('jobno').AsString
                                 +GetMessage('frmWareOrderDxALL','017')+dataTmp.qryTmp.FieldByName('SNO').AsString;//iif(_language='CAPTIONC','   录入序号：','')
         dataTmp.qryTmp.Next;
       end;
       strWareTask:=GetMessage('frmWareOrderDxALL','018')+chr(13)+chr(10)+strWareTask;//iif(_language='CAPTIONC','该指令单已生成任务，不能修改！如要修改请先删除任务记录！！','')
       kMessageDlg(strWareTask,mtWarning,[mbOK],0);
       exit;
     end;
  end;

  {if  edtOrderType.Text='进仓指令' then
  begin
    strINOUT:='I';
    strOrderType:='OI';
  end else if edtOrderType.Text='出仓指令' then
  begin
    strINOUT:='O';
    strOrderType:='OO';
  end; }

  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
  SetDetailActive(False,True);
  WorkCall(stEdit);
end;

procedure TfrmWareOrderIn.btnAddClick(Sender: TObject);
var
   strWareordertype:string;
begin
  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
 { if not WorkWareOrderType('指令类型',strWareordertype) then Exit
  else
  begin
    strOrderType:=strWareordertype;
    if  strOrderType='OI' then
    begin
      strOrderIDType:='OJ';
      ckbOperationTypeE.Checked:=True;
      strINOUT:='I';
    end else if strOrderType='OO' then
    begin
      strOrderIDType:='OC';
      ckbOperationTypeE.Checked:=False;
      strINOUT:='O';
    end else
    begin
      strOrderIDType:=strOrderType;
      ckbOperationTypeE.ReadOnly:=False;
    end;
  end;}

  ScrollAfterEdit:=True;
  SetDetailActive(False,True);
  Workcall(stInsert);
end;

procedure TfrmWareOrderIn.btnDeleteClick(Sender: TObject);
Var
  strWareTask:string;
begin
  if (qryWareOrderIn.FieldByName('CreateName').asstring<>_LoginName) and (_canmodifyother<>'T') then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单不是您输入的，不能删除！'
    else
       _strmessage:='';}
    kMessageDlg(GetMessage('frmWareOrderDxALL','019'),mtWarning,[mbOK],0);
    exit;
  end;
  if qryWareOrderIn.FieldByName('CheckName').asstring<>'' then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单已审核，不能删除！'
    else
       _strmessage:='';}
    kMessageDlg(GetMessage('frmWareOrderDxALL','020'),mtWarning,[mbOK],0);
    exit;
  end;
  if (qryWareOrderIn.FieldByName('jobnoin').asstring<>'') or (qryWareOrderIn.FieldByName('jobnoori').asstring<>'') then
  begin
    if _Language='CAPTIONC'then
       _strmessage:='该指令单从其他模块下达，不能删除，请到相应的模块撤销指令！'
    else
       _strmessage:='';
    kMessageDlg(GetMessage('frmWareOrderDxALL','021'),mtWarning,[mbOK],0);
    exit;
  end; 
  OpenSql(dataTmp.qryTmp,' Select Task.Jobno,Task.LocationBillno,Task.SNO '+chr(13)+chr(10)
                        +'   from '+IIF(qryWareOrderIn.FieldByName('dictatetype').AsString='进仓指令','locationinitem ','locationoutitem')+' Task (nolock)'
                        +'  where Task.Jobnoorder="'+qryWareOrderIn.FieldByName('jobno').AsString+'" ');
  dataTmp.qryTmp.First;
  strWareTask:='';
  if  dataTmp.qryTmp.FieldByName('Jobno').AsString<>'' then
  begin
    while not dataTmp.qryTmp.Eof do
    begin
      strWareTask:=strWareTask+GetMessage('frmWareOrderDxALL','022')  //iif(_language='CAPTIONC','仓单号：','')
                              +dataTmp.qryTmp.FieldByName('LocationBillno').AsString
                              +GetMessage('frmWareOrderDxALL','017')+dataTmp.qryTmp.FieldByName('SNO').AsString;//iif(_language='CAPIONC','   录入序号：','')
      dataTmp.qryTmp.Next;
    end;
    strWareTask:=GetMessage('frmWareOrderDxALL','018')+chr(13)+chr(10)+strWareTask;//iif(_language='CAPTIONC','该指令单已生成任务，不能删除！如要删除请先删除任务记录！！','')
    kMessageDlg(strWareTask,mtWarning,[mbOK],0);
    exit;
  end;

  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;

  if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    {wql.07.11.21 ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                          +'     drop table #lskOldSku');
                          }
    {wql.07.11.21 ExecSql(dataTmp.qryTmp,'  select  jobnoin,snoin into #lskOldSku from WareOrderSku(nolock)  '+chr(13)+chr(10)
                          +'   where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                           ); }
    _ADOConnection.startTransaction;
    try
       ExecSql(dataTmp.qryTmp,'delete from  WareOrder  where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderSKU  where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderOriSKU  where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  locationinoutcon where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  locationinoutconsku where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderSkuDetail  where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  genjobno where jobno="'+
               qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');

    //   kspWareOrderSku(qryWareOrderIn.FieldByName('Jobno').AsString);
//为了控制库存 ,删除临时表
{wql.07.11.21       ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                             +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                             +'     drop table #lskOldSku');   }
       qryWareOrderIn.Applyupdates;
       TdxDBGridNode(grdWareOrder.FocusedNode).Delete;
       _ADOConnection.Commit;
    except
       try
         if _ADOConnection.InTransaction then _ADOConnection.RollBack;
       except
       end;
       raise;
       WorkCall(stBrowse);
       exit;
    end;
    qryWareOrderIn.CommitUpdates;

    workcall(stbrowse);
  end;
  SetDetailActive(False,False);
  SetDetailActive(True,True);
end;

procedure TfrmWareOrderIn.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pcWareOrder.ActivePage <> tbsBrowse then pcWareOrder.ActivePage := tbsBrowse;
   pcWareOrderChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('WareOrder   ');
   para.Tables.Add('left join LocationinoutCon '
                  +'      on LocationinoutCon.jobno=WareOrder.jobno    ');

{0}   para.field.add('WareOrder.mainorder');
{1}   para.field.add('WareOrder.blno');
{2}   para.field.add('WareOrder.orderid');
{3}   para.field.add('convert(datetime,convert(char(10),WareOrder.OrderDate,102))');
{4}   para.Field.add('convert(datetime,convert(char(10),WareOrder.UploadDate,102))');
{5}   para.Field.add('convert(datetime,convert(char(10),WareOrder.actualdate,102))');
{6}   para.field.add('WareOrder.skucostclasscd');
{7}   para.field.add('WareOrder.CheckName');
{8}   para.field.add('convert(datetime,convert(char(10),WareOrder.CheckDate,102))');
{9}   para.field.add('WareOrder.CustomsNO');
{10}  para.field.add('WareOrder.costcusid');
{11}//  para.field.add('LocationinoutCon.conno');
{12}  para.field.add('WareOrder.cusbillno');

   Para.Exp.add('');

{0}   Para.Toptic.add('主订单号');
{1}   Para.Toptic.add('提单号');
{2}   Para.Toptic.Add('指令单号');
{3}   Para.Toptic.Add('订单日期');
{4}   Para.Toptic.Add('要求操作日期');
{5}   Para.Toptic.add('实际操作日期');
{6}   Para.Toptic.add('商品计费类');
{7}   Para.Toptic.add('复 核 人');
{8}   Para.Toptic.add('复核日期');
{9}   Para.Toptic.add('海关报关单号');
{10}  Para.Toptic.add('费用关系人');
{11}  //Para.Toptic.add('箱柜号');
{12}  Para.Toptic.add('客户单号');

{0}   para.Ftype.add('C');
{1}   para.Ftype.add('C');
{2}   para.Ftype.add('C');
{3}   Para.Ftype.add('D');
{4}   Para.Ftype.add('D');
{5}   para.Ftype.add('D');
{6}   para.Ftype.add('B');
{7}   Para.Ftype.add('C');
{8}   Para.Ftype.add('D');
{9}   para.Ftype.add('C');
{10}  para.Ftype.add('E');
{11} // para.Ftype.add('C');
{12}  para.Ftype.add('C');

   Para.RField.add('WareOrder.jobno');

//   if filterSql <> ''
//      then Para.Filter := ' and ' + filterSql
    Para.Filter :=''
           +'   and '+qryWareOrderIn.MacroByName('Where').AsString
           +iif(trim(strJobno)='','',' and wareOrder.jobno="'+strJobno+'" ');

   Para.OnGetValue := FindGetValue;
   Dofind(qryWareOrderIn,dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmWareOrderIn.btnRefindClick(Sender: TObject);
begin
   DoRefind(qryWareOrderIn,dataTmp.qryFind);
end;

function TfrmWareOrderIn.FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result := True;
   case pField of
     4:begin
         pItems.Clear;
         pItemFields.Clear;
         pItems.AddStrings(cmbSKUCOSTCLASSCD.Items);
         pItemFields.AddStrings(cmbSKUCOSTCLASSCD.ItemFields);
       end;
    10:
      begin
         qrySelect:=pGetCustomerSelect('C','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            PItemFields[0]  :=qrySelect.FieldByName('Cusid').asstring;
            PItems[0]       :=qrySelect.FieldByName('Cusname').asstring;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   else Result := False;
   end;
end;

procedure TfrmWareOrderIn.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pcWareOrder.ActivePage <> tbsBrowse then pcWareOrder.ActivePage := tbsBrowse;
   pcWareOrderChange(self);
   Para := TfindPara.Create;

   para.Tables.Add(' WareOrder  WareOrder ');

{0}   para.field.add('WareOrder.MainOrder');
{1}   para.field.add('WareOrder.BLNO');
{2}   para.field.add('WareOrder.OrderID');
{3}   para.field.add('convert(datetime,convert(char(10),WareOrder.OrderDate,102))');
{4}   para.Field.add('convert(datetime,convert(char(10),WareOrder.UploadDate,102))');
{5}   para.Field.add('convert(datetime,convert(char(10),WareOrder.ActualDate,102))');
{6}   para.field.add('WareOrder.skucostclasscd');
{7}   para.field.add('WareOrder.CheckName');
{8}   para.field.add('convert(datetime,convert(char(10),WareOrder.CheckDate,102))');
{9}   para.field.add('WareOrder.CustomsNO');
{10}  para.field.add('WareOrder.costcusid');
{11}  para.field.add('WareOrder.cusbillno');

   Para.Exp.add('');

{0}   Para.Toptic.add('主订单号');
{1}   Para.Toptic.add('提单号');
{2}   Para.Toptic.Add('指令单号');
{3}   Para.Toptic.Add('订单日期');
{4}   Para.Toptic.Add('要求操作日期');
{5}   Para.Toptic.add('实际操作日期');
{6}   Para.Toptic.add('商品计费类');
{7}   Para.Toptic.add('复 核 人');
{8}   Para.Toptic.add('复核日期');
{9}   Para.Toptic.add('海关报关单号');
{10}  Para.Toptic.add('费用关系人');
{11}  Para.Toptic.add('客户单号');

{0}   para.Ftype.add('C');
{1}   para.Ftype.add('C');
{2}   para.Ftype.add('C');
{3}   Para.Ftype.add('D');
{4}   Para.Ftype.add('D');
{5}   para.Ftype.add('D');
{6}   para.Ftype.add('B');
{7}   Para.Ftype.add('C');
{8}   Para.Ftype.add('D');
{9}   para.Ftype.add('C');
{10}  para.Ftype.add('E');
{11}  para.Ftype.add('C');

   Para.RField.add('jobno');

//   if filterSql<>'' then
//      Para.Filter:=' and '+filterSql
//   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);
   if strTmp <> 'null' then
   begin
     qryWareOrderIn.Close;
     qryWareOrderIn.DisableControls;
     if (strTmp<>'') and (btnopid.Enabled) then
     begin
       qryWareOrderIn.MacroByName('Where').AsString:=strTmp
     end else
     if (strTmp<>'') and (not blnop) then
     begin
       qryWareOrderIn.MacroByName('Where').AsString:=strTmp+' and (wareorder.costopid="'+_loginname+'" or wareorder.createname="'+_loginname+'")'
     end else
     if (strTmp='') and (not blnop) then
     begin
       qryWareOrderIn.MacroByName('Where').AsString:='1=1 and (wareorder.costopid="'+_loginname+'" or wareorder.createname="'+_loginname+'")'
     end else
       qryWareOrderIn.MacroByName('Where').AsString:='1=1';

     qryWareOrderIn.Open;
     qryWareOrderIn.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmWareOrderIn.btnSaveClick(Sender: TObject);
var
  strJobno,strCheckJobno:string;
  strorderid,strDate:string;
begin
  if ((DataState in setDcs) and Gather) then //新增或编辑存盘
  begin
    try
      blnWare:=True;
      while True do
      begin
          //处理日志
          if _isuserhist='T' then
          begin
             if DataState=stInsert then
             begin
               strHistMessage:='  费用关系人-'+qryWareOrderInEdit.FieldByName('CostCusName').AsString
                              +'  订单时间-'  +qryWareOrderInEdit.FieldByName('OrderDate').AsString
                              +'  指令单号-'  +qryWareOrderInEdit.FieldByName('OrderID').AsString
                              +'  指令类型-'  +qryWareOrderInEdit.FieldByName('DictateType').AsString
                              +'  商品类-'    +qryWareOrderInEdit.FieldByName('skucostclasscd').AsString
                              +'  客户单号-'  +qryWareOrderInEdit.FieldByName('cusbillno').AsString
                              +'  报关单号-'  +qryWareOrderInEdit.FieldByName('customsno').AsString
                              +'  仓租方式-'  +qryWareOrderInEdit.FieldByName('warerentcounttype').AsString
                              +'  计算仓租-'  +qryWareOrderInEdit.FieldByName('countrent').AsString;
             end else
             begin
                if VarToStr(qryWareOrderInEdit.FieldByName('OrderID').OldValue)<>qryWareOrderInEdit.FieldByName('OrderID').AsString then
                   strHistMessage:=strHistMessage
                               +'  指令单号-'+VarToStr(qryWareOrderInEdit.FieldByName('OrderID').OldValue)+' →'+qryWareOrderInEdit.FieldByName('OrderID').AsString
                else
                   strHistMessage:=strHistMessage
                               +'  指令单号-'+qryWareOrderInEdit.FieldByName('OrderID').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('CostCusName').OldValue)<>qryWareOrderInEdit.FieldByName('CostCusName').AsString then
                   strHistMessage:=strHistMessage
                               +'  费用关系人-'+VarToStr(qryWareOrderInEdit.FieldByName('CostCusName').OldValue)+' →'+qryWareOrderInEdit.FieldByName('CostCusName').AsString;
                if VarToDateTime(qryWareOrderInEdit.FieldByName('OrderDate').OldValue)<>qryWareOrderInEdit.FieldByName('OrderDate').AsDateTime then
                   strHistMessage:=strHistMessage
                               +'  订单时间-'+VarToStr(qryWareOrderInEdit.FieldByName('OrderDate').OldValue)+' →'+qryWareOrderInEdit.FieldByName('OrderDate').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('DictateType').OldValue)<>qryWareOrderInEdit.FieldByName('DictateType').AsString then
                   strHistMessage:=strHistMessage
                               +'  指令类型-'+VarToStr(qryWareOrderInEdit.FieldByName('DictateType').OldValue)+' →'+qryWareOrderInEdit.FieldByName('DictateType').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('skucostclasscd').OldValue)<>qryWareOrderInEdit.FieldByName('skucostclasscd').AsString then
                   strHistMessage:=strHistMessage
                               +'  商品类-'+VarToStr(qryWareOrderInEdit.FieldByName('skucostclasscd').OldValue)+' →'+qryWareOrderInEdit.FieldByName('skucostclasscd').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('cusbillno').OldValue)<>qryWareOrderInEdit.FieldByName('cusbillno').AsString then
                   strHistMessage:=strHistMessage
                               +'  客户单号-'+VarToStr(qryWareOrderInEdit.FieldByName('cusbillno').OldValue)+' →'+qryWareOrderInEdit.FieldByName('cusbillno').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('customsno').OldValue)<>qryWareOrderInEdit.FieldByName('customsno').AsString then
                   strHistMessage:=strHistMessage
                               +'  报关单号-'+VarToStr(qryWareOrderInEdit.FieldByName('customsno').OldValue)+' →'+qryWareOrderInEdit.FieldByName('customsno').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('warerentcounttype').OldValue)<>qryWareOrderInEdit.FieldByName('warerentcounttype').AsString then
                   strHistMessage:=strHistMessage
                               +'  仓租方式-'+VarToStr(qryWareOrderInEdit.FieldByName('warerentcounttype').OldValue)+' →'+qryWareOrderInEdit.FieldByName('warerentcounttype').AsString;
                if VarToStr(qryWareOrderInEdit.FieldByName('countrent').OldValue)<>qryWareOrderInEdit.FieldByName('countrent').AsString then
                   strHistMessage:=strHistMessage
                               +'  计算仓租-'+VarToStr(qryWareOrderInEdit.FieldByName('countrent').OldValue)+' →'+qryWareOrderInEdit.FieldByName('countrent').AsString;
             end;
          end;
          try
          _ADOConnection.Starttransaction;
          qryWareOrderInEdit.ApplyUpdates;

          qryWareOrderIn.Edit;
          qryWareOrderIn.fieldByname('JOBNO').asString:=qryWareOrderInEdit.fieldByname('Jobno').asString;
          qryWareOrderIn.fieldByname('OrderID').asString:=qryWareOrderInEdit.fieldByname('OrderID').asString;
          qryWareOrderIn.fieldByname('keyid').asString:=qryWareOrderInEdit.FieldByName('jobno').Asstring;
          m_blnPost := True;
          qryWareOrderIn.ApplyUpdates;
          m_blnPost := False;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             udsWareOrderInEdit.modifysql.text + chr(13) +
             udsWareOrderInEdit.DeleteSql.text + chr(13) +
             udsWareOrderInEdit.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( qryWareOrderInEdit.FieldByName('Jobno').AsString
                        +GetMessage('frmWareOrderDxALL','040'));//iif(_language='CAPTIONC','工作号','') iif(_language='CAPTIONC','已经被使用。程序正在查找其他可用客户编号...','')
             Application.processmessages;
             if not frmSave.stopflag then
             begin
                 //赋业务联系单号
               opensql(dataTmp.qryTmp,'select datenow=getDate() ');
               strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
               opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                                     +'  from genjobno where substring(Jobno,1,10)="'+Trim(_DataBaseID)+'WI'+strDate+'"' );
               strorderid:='OJ'+copy(datetostr(date),1,4)+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');
               qryWareOrderInEdit.FieldByName('OrderID').Asstring:=strorderid;
               strWOJobno:=genJobno('WI',strorderid);
               //strWOjobno := genJobno(strOrderType);
               if strWOjobno = '' then
               begin
                 {if _Language='CAPTIONC'then
                    _strmessage:='没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 else
                    _strmessage:=''; }
                 KmessageDlg(GetMessage('frmWareOrderDxALL','041'), mtInformation, [mbOk], 0);
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 qryWareOrderInEdit.Edit;
                 qryWareOrderInEdit.FieldByName('Jobno').AsString := strWOJobno;
               end;
             end else Break;
          end else
          begin
            raise;
            exit;
          end;
        end;
      end;
      if frmSave <> nil then
      begin
        if frmSave.stopflag then
        begin
          frmSave.Free;
          Exit;
        end else
        begin
          with frmSave do
          begin
            lblError.caption := '找到可用工作号' + strWOjobno + '，该工作号改为' + strWOjobno + '。';
            btnCancel.visible := false;
            btnOk.visible := true;
            free;
          end;
        end;
      end;

      //原始货物信息
      qryWareOrderInOriSKU.DisableControls;
      qryWareOrderInOriSKU.first;
      while not qryWareOrderInOriSKU.eof do
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.fieldbyname('JOBNO').asstring:=qryWareOrderInEdit.fieldbyname('JOBNO').asstring;
         qryWareOrderInOriSKU.Post;
         qryWareOrderInOriSKU.next;
      end;
      qryWareOrderInOriSKU.first;
      qryWareOrderInOriSKU.EnableControls;
      qryWareOrderInOriSKU.applyupdates;

      qryWareOrderInSKU.DisableControls;
      qryWareOrderInSKU.first;
      while not qryWareOrderInSKU.eof do
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.fieldbyname('JOBNO').asstring:=qryWareOrderInEdit.fieldbyname('JOBNO').asstring;
         qryWareOrderInSKU.Post;
         qryWareOrderInSKU.next;
      end;
      qryWareOrderInSKU.first;
      qryWareOrderInSKU.EnableControls;  
      qryWareOrderInSKU.applyupdates;
      if qryWareorderInSkuDetail.active then
         qryWareorderInSkuDetail.ApplyUpdates;
      //修改海关导入数据的 IsInputOrder(是否已经生成指令)
     {wql_new if (strType='HG') and (mode=stInsert) and (blnInserted) then
      begin
        execsql(dataTmp.qryTmp,'update input_predetail set IsInputOrder="T" '
                      +' where input_predetail.ID_NO="'+strID_NO+'" '
                      +'   and input_predetail.OperationType="'+iif(strINOUT='I','1','-1')+'"');
      end; wql_new}

      //如果报关单号已经改变做以下操作
      if stroldCustomsNO<>qryWareOrderInEdit.FieldByName('CustomsNO').Asstring then
      begin
          execsql(dataTmp.qryTmp,'update LocationinItem set CustomsNO="'+qryWareOrderInEdit.fieldbyname('CustomsNO').AsString+'"  '+chr(13)+chr(10)
                        +' where LocationinItem.jobnoorder="'+qryWareOrderInEdit.fieldbyname('Jobno').AsString+'" '+chr(13)+chr(10)
                        +' '+chr(13)+chr(10)
                        +'update LocationinDetail set CustomsNO="'+qryWareOrderInEdit.fieldbyname('CustomsNO').AsString+'"  '+chr(13)+chr(10)
                        +' where LocationinDetail.jobnoorder="'+qryWareOrderInEdit.fieldbyname('Jobno').AsString+'" ');
      end;

      if getSysdata('qdtext')='T' then
          execsql(dataTmp.qryTmp,'update secondout '
                                +'   set accjobno="'+qryWareOrderInEdit.fieldbyname('mainorder').AsString+'",  '+chr(13)+chr(10)
                                +'       bolade="'+qryWareOrderInEdit.fieldbyname('cusbillno').AsString+'"  '+chr(13)+chr(10)
                                +' where jobno="'+qryWareOrderInEdit.fieldbyname('Jobnoin').AsString+'" ');

      //wql.07.11.21 kspWareOrderSku(qryWareOrderIn.FieldByName('Jobno').AsString);
//处理日志
      if _isuserhist='T' then
      begin
         strHistMessage:=strHistMessage+strHistDetailMessage;
         if strHistMessage<>'' then
           execsql(dataTmp.qryTmp,'insert into UserHist '
                         +' (UserName,UserDATE,JOBNO, Remark,TypeName,modifytype)'
                         +' values ("'+_LoginName+'","'+DateTimeToStr(Now)+'","'
                         +qryWareOrderInEdit.FieldByName('jobno').AsString+'","'
                         +strHistMessage+'","进仓指令","'+iif(DataState=stEdit,'修改','新增')+'")');
      end;
      //删除商品明细
      if strDel_Task<>'' then
      begin
        strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
        strsql:=' delete from WareOrderSKUDetail '
               +'  where jobno="'+qryWareOrderIn.fieldbyname('Jobno').asstring+'"'
               +'    and '+'('+strDel_Task+') ';
        execsql(datatmp.qryTmp,strsql);
        strDel_Task:='';
      end;

//为了控制库存 ,删除临时表
      {ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                           +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                           +'     drop table #lskOldSku'
                           );  }
      _ADOConnection.Commit;
    except
      blnSaveError:=true;
      arrWareOrder:=ScatterToArray(qryWareOrderIn,true,0);
      arrWareOrderEdit:=ScatterToArray(qryWareOrderInEdit,true,0);
      m_blnPost := True;
      qryWareOrderIn.CancelUpdates;
      qryWareOrderInEdit.CancelUpdates;
      if datastate=stInsert then
      begin
        qryWareOrderIn.Append;
        qryWareOrderInEdit.Append;
      end else
      begin
        strJobno     :=qryWareOrderIn.FieldByName('Jobno').AsString;
        qryWareOrderIn.Locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);
        qryWareOrderIn.Edit;
      end;
      qryWareOrderIn.DisableControls;
      GatherFromArray(qryWareOrderIn,arrWareOrder,false);
      GatherFromArray(qryWareOrderInEdit,arrWareOrderEdit,false);
      qryWareOrderIn.EnableControls;
      m_blnPost := False;
      try
        if _ADOConnection.InTransaction then _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    qryWareOrderIn.commitUpdates;
    qryWareOrderInEdit.commitUpdates;
    qryWareOrderInOriSKU.commitUpdates;
    qryWareOrderInSKU.commitUpdates;
    if qryWareorderInSkuDetail.active then
    begin
       qryWareorderInSkuDetail.CommitUpdates;
       qryWareorderInSkuDetail.Filtered:=True;
    end;

    ScrollAfterEdit:=False;
    strskuid:='';
    WorkCall(stBrowse);
//    btnRefreshclick(self);
  end;
end;

procedure TfrmWareOrderIn.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;
//为了控制库存 ,删除临时表
{wql.07.11.21   ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                         +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'     drop table #lskOldSku'
                         );
                         }
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+qryWareOrderInEdit.FieldByName('jobno').AsString+'" ');
   qryWareOrderInSKU.CancelUpdates;
   qryWareOrderInOriSKU.CancelUpdates;
   qryWareOrderInEdit.CancelUpdates;
   qryWareOrderIn.CancelUpdates;
   if qryWareorderInSkuDetail.active then
   qryWareorderInSkuDetail.CancelUpdates;


   grdOriSKU.ResetFullRefresh;
   grdSKU.ResetFullRefresh;
   strskuid:='';
   WorkCall(stBrowse);
   pcWareOrderChange(self);
end;

procedure TfrmWareOrderIn.btnPrintClick(Sender: TObject);
//var
//wql_new  KF1Book : TKF1book;
//  strLocationBillNO,strDate,StrAccountName:string;
//  strYear,strMonth,strDay:Word;
begin
 {wql_new if (strOrderType='OO') then
  begin
    strSql:='Select LocationINOUT.LocationBillNO,cusname=Account.Account_shortName,LocationINOUT.CREATEDATE '
           +'  from WareOrderSKU '
           +'       left join LocationINOUT '
           +'              on LocationINOUT.Jobno=WareOrderSKU.jobnoinf '
           +'       left join Account '
           +'              on Account.cusid=WareOrderSKU.cusid '
           +' Where WareOrderSKU.Jobno="'+qryWareOrderIn.fieldbyname('Jobno').AsString+'"';
    opensql(dataTmp.qryTmp,strsql);
    dataTmp.qryTmp.First;
    While not dataTmp.qryTmp.Eof do
    begin
//      strLocationBillNO:=strLocationBillNO+' '+dataTmp.qryTmp.fieldbyname('LocationBillNO').AsString;
//      strDate:=strDate+'  '+dataTmp.qryTmp.fieldbyname('CREATEDATE').AsString;
      StrAccountName:=dataTmp.qryTmp.fieldbyname('cusname').AsString;
      dataTmp.qryTmp.next;
    end;
  end;

  KF1Book := TKF1book.Create;
  //打印
//  if TKBitBtn(Sender)=btnPrint then
//    KF1Book.BbHandle:=bbPrint;
  try
    strSql:='Select piece=case when isnull(WOSKU.piece,0)=0 then null else WOSKU.piece end,'
           +'       WOSKU.QUANTITY,QuantityuomName=UOM_Q.UOMName,GROSSWEIGHT=null,NETWEIGHT=null,'
           +'       BZ="",SKU.SKUName,Location.LocationName, '
           +'       PieceUOMName=case when isnull(WOSKU.piece,0)=0 then null else UOM_P.UOMName end, '
           +'       WeightUOMName=null, '
           +'       AreaUOMName=UOM_A.UOMName, '
           +'       VolumeUOMName=UOM_V.UOMName, '
           +'       WOSKU.sno,bh=1'
           +'  from WareOrderSKU WOSKU '
           +'       left join SKU left join UOM UOM_Q '
           +'                            on SKU.QuantityUom=UOM_Q.UOM '
           +'              on WOSKU.SKUID=SKU.SKUID'
           +'       left join Location'
           +'              on WOSKU.locid=Location.locid'
           +'       left join UOM UOM_P'
           +'              on WOSKU.PieceUOM=UOM_P.UOM'
           +'       left join UOM UOM_W'
           +'              on WOSKU.WeightUOM=UOM_W.UOM'
           +'       left join UOM UOM_A'
           +'              on WOSKU.AreaUOM=UOM_A.UOM'
           +'       left join UOM UOM_V'
           +'              on WOSKU.VolumeUOM=UOM_V.UOM'
           +' Where WOSKU.Jobno="'+qryWareOrderIn.fieldbyname('Jobno').AsString+'"'
           +' union all '
           +'select piece=case when isnull(WareOrder.piece,0)=0 then null else WareOrder.piece end, '
           +'       QUANTITY=case when isnull(WareOrder.QUANTITY,0)=0 then null else WareOrder.QUANTITY end, '
           +'       QuantityuomName=case when isnull(WareOrder.QUANTITY,0)=0 then null else UOM_Q.UOMName end, '
           +'       GROSSWEIGHT=case when isnull(WareOrder.GROSSWEIGHT,0)=0 then null else WareOrder.GROSSWEIGHT end, '
           +'       NETWEIGHT=case when isnull(WareOrder.NETWEIGHT,0)=0 then null else WareOrder.NETWEIGHT end, '
           +'       bz="",SKUName="合计", LocationName="", '
           +'       PieceUOMName=case when isnull(WareOrder.piece,0)=0 then null else UOM_P.UOMName end, '
           +'       WeightUOMName=UOM_W.UOMName, '
           +'       AreaUOMName=UOM_A.UOMName, '
           +'       VolumeUOMName=UOM_V.UOMName, '
           +'       sno=1,bh=2'
           +'  from WareOrder  '
           +'       left join UOM UOM_Q '
           +'              on WareOrder.QuantityUOM=UOM_Q.UOM '
           +'       left join UOM UOM_P'
           +'              on WareOrder.PieceUOM=UOM_P.UOM'
           +'       left join UOM UOM_W'
           +'              on WareOrder.WeightUOM=UOM_W.UOM'
           +'       left join UOM UOM_A'
           +'              on WareOrder.AreaUOM=UOM_A.UOM'
           +'       left join UOM UOM_V'
           +'              on WareOrder.VolumeUOM=UOM_V.UOM'
           +' Where WareOrder.Jobno="'+qryWareOrderIn.fieldbyname('Jobno').AsString+'"'
           +' order by bh,sno ';
    opensql(dataTmp.qryTmp,strsql);
    with KF1Book do
    begin
      BBdm:='900003';
      paras.Values['DB_CompanyName']:=_DB_CompanyName;
      DecodeDate(date,strYear,strMonth,strDay);
      paras.Values['Year'] :=inttostr(strYear);
      paras.Values['Month']:=inttostr(strMonth);
      paras.Values['Day']  :=inttostr(strDay);

      paras.Values['OrderDate'] :=qryWareOrderIn.fieldbyname('OrderDate').AsString;
      paras.Values['CustomsNO']     :=qryWareOrderIn.fieldbyname('CustomsNO').AsString;
      paras.Values['UserName']      :=_UserName;
      paras.Values['LocationBillNO']:=strLocationBillNO;
      paras.Values['Date']:=strDate;
      paras.Values['cusname']:=StrAccountName;
      paras.Values['Consigncusname']:=qryWareOrderIn.fieldbyname('Consigncusname').AsString;

      paras.Values['Piece']         :=IntToStr(qryWareOrderIn.fieldbyname('Piece').AsInteger);
      paras.Values['NetWeight']     :=FloatToStr(qryWareOrderIn.fieldbyname('NetWeight').AsFloat);
      paras.Values['GrossWeight']   :=FloatToStr(qryWareOrderIn.fieldbyname('GrossWeight').AsFloat);
      paras.Values['Area']          :=FloatToStr(qryWareOrderIn.fieldbyname('Area').AsFloat);
      paras.Values['Volume']        :=FloatToStr(qryWareOrderIn.fieldbyname('Volume').AsFloat);

      qryMain:=dataTmp.qryTmp;
      CreateReport;
    end;
  finally
    KF1Book.Destroy;
  end; wql_new}
end;

procedure TfrmWareOrderIn.btnCopyClick(Sender: TObject);
{复制新增的问题}
begin
  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
  pcWareOrderChange(self);
  SetDetailActive(False,True);

  arrWareOrderEdit:=ScatterToArray(qryWareOrderInEdit,true,0);
  arrWareOrderSKU :=ScatterToArray(qryWareOrderInSKU,false,0);
  arrWareOrderOriSKU :=ScatterToArray(qryWareOrderInOriSKU,false,0);
  blnCopy:=True;

  WorkCall(stInsert);
end;

procedure TfrmWareOrderIn.edtOrigincusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('L','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('origincusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('origincusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtDestcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('L','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('destcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('destcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
   end;
   end;
end;

procedure TfrmWareOrderIn.edtConsignCusIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('F','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtCarriercusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('D','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('carriercusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtCostcusidButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('A','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.cmbOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_new  if DataState in Setdcs then
  begin
    with workOperatorSelect do
    if okflag  then
    begin
      qryWareOrderInEdit.Edit;
      qryWareOrderInEdit.Fieldbyname('OPID').asstring  :=OPID;
      qryWareOrderInEdit.Fieldbyname('OPName').asstring:=Name;
    end;
  end;  wql_new}
end;

procedure TfrmWareOrderIn.cmbSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
//var
//  i:integer;
//  acontrol: TWinControl;
//wql_new  TSKUSelect:TMultSKUSelection;
//wql_new  TLocationSKUSelect:TMultLocationSKUSelect;
begin
 {wql_new  if (strOrderType='OI') or ((strOrderType='VA') and (strINOUT='I')) then
  begin
    if DataState in Setdcs then
    begin
      if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=edtCostcusid;
        KMessageDlg('费用关系人不能为空，必须填写！',mtWarning,[mbOK],0);
        Exit;
      end;

      TSKUSelect:=workSKUSelect('','','D');
      for i:=0 to 100 do
      begin
        with TSKUSelect[i] do
        if OkFlag then
        begin
          if i=0 then
          begin
            qryWareOrderInSKU.edit;
            qryWareOrderInEdit.Edit;
            qryWareOrderInEdit.fieldbyname('SKUNAME').asstring        :=SKUName_set;
            qryWareOrderInEdit.fieldbyname('Quantity').AsFloat           :=Quantity_set;
            qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=QuantityUOM_set;
          end else
          begin
//            if not qryWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//            then break;
            qryWareOrderInSKU.append;
            qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
            qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
            qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
          end;
          qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=SKUID            ;
          qryWareOrderInSKU.fieldbyname('SKUName').asstring             :=SKUName          ;
          strGetCd := SKUName;
          if LotCode<>'' then
            qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=LotCode          ;
          if Quantity<>0 then
            qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=Quantity;
          if QualityName<>'' then
            qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=QualityName      ;
          qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=PieceUOM         ;
          qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=WeightUOM        ;
          qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=VolumeUOM        ;
          qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=AreaUOM          ;
          if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
            qryWareOrderInSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
            qryWareOrderInSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
          if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
            qryWareOrderInSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
            qryWareOrderInSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

          qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring          :='';

          qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat  :=piecepro;
          qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=VolumePro;
          qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat   :=AreaPro;
          qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat:=Quantity_Weight_Prop;
          qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=Quantity_Weight_Prop;
          qryWareOrderInSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
          qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
          qryWareOrderInSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
        end;
      end;
    end;
  end else if (strOrderType='OO') or ((strOrderType='VA') and (strINOUT='O')) then
    begin
      if DataState in Setdcs then
        begin
          TLocationSKUSelect:= WorkLocationSKUSelect('and isnull(Detail.cusid,"") like "%'
                                                     +qryWareOrderInSKU.Fieldbyname('cusid').Asstring+'%"',
                                                     '出仓指令-库存商品选择','TO','OR','Quantity_RemainOrder',False);

          for i:=0 to 100 do
          begin
            if TLocationSKUSelect[i].OkFlag then
            begin
              if i=0 then
              begin
                qryWareOrderInSKU.edit;
                qryWareOrderInEdit.Edit;
                qryWareOrderInEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
                qryWareOrderInEdit.fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond;
                qryWareOrderInEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
                qryWareOrderInEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
                qryWareOrderInEdit.fieldbyname('skucostclasscd').asstring      :=TLocationSKUSelect[i].skucostclasscd;
                qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype;
                if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
                begin
                  qryWareOrderInEdit.fieldbyname('costcusid').asstring:=TLocationSKUSelect[i].costcusid;
                  qryWareOrderInEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
                end;
                ckbCountcontcostclick(self);
              end else
              begin
//                if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//                then break;
                qryWareOrderInSKU.append;
                qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
                qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
                qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
              end;
              qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=TLocationSKUSelect[i].SKUID            ;
              qryWareOrderInSKU.fieldbyname('SKUName').asstring             :=TLocationSKUSelect[i].SKUName          ;
              qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=TLocationSKUSelect[i].LotCode          ;
              qryWareOrderInSKU.Fieldbyname('locid').asstring          :=TLocationSKUSelect[i].locid       ;
              qryWareOrderInSKU.Fieldbyname('LocationName').asstring        :=TLocationSKUSelect[i].LocationName       ;
              qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=TLocationSKUSelect[i].syquantity        ;
              qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=TLocationSKUSelect[i].QualityName      ;
              qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=TLocationSKUSelect[i].PieceUOM         ;
              qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=TLocationSKUSelect[i].WeightUOM        ;
              qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=TLocationSKUSelect[i].VolumeUOM        ;
              qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=TLocationSKUSelect[i].AreaUOM          ;
              qryWareOrderInSKU.fieldbyname('Piece').AsFloat                :=TLocationSKUSelect[i].syPiece          ;
              qryWareOrderInSKU.fieldbyname('NetWeight').asFloat            :=TLocationSKUSelect[i].syNetWeight      ;
              qryWareOrderInSKU.Fieldbyname('GrossWeight').asFloat          :=TLocationSKUSelect[i].syGrossWeight    ;
              qryWareOrderInSKU.fieldbyname('Volume').asFloat               :=TLocationSKUSelect[i].syVolume         ;
              qryWareOrderInSKU.Fieldbyname('Area').asFloat                 :=TLocationSKUSelect[i].syArea           ;
              qryWareOrderInSKU.fieldbyname('cusid').asstring           :=TLocationSKUSelect[i].cusid        ;
              qryWareOrderInSKU.fieldbyname('cusname').asstring         :=TLocationSKUSelect[i].cusname      ;
              qryWareOrderInSKU.Fieldbyname('shippercusid').asstring    :=TLocationSKUSelect[i].shippercusid ;
              qryWareOrderInSKU.Fieldbyname('shippercusname').asstring  :=TLocationSKUSelect[i].shippercusname  ;
//              qryWareOrderInSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
              qryWareOrderInSKU.Fieldbyname('contwithloca').asstring     :=TLocationSKUSelect[i].contwithloca   ;
              qryWareOrderInSKU.Fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked     ;
              qryWareOrderInSKU.Fieldbyname('price').asFloat             :=TLocationSKUSelect[i].price          ;
              qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=TLocationSKUSelect[i].currcd  ;
              qryWareOrderInSKU.fieldbyname('skucost').asFloat        :=TLocationSKUSelect[i].skucost     ;
              qryWareOrderInSKU.fieldbyname('costuomtype').asstring     :=TLocationSKUSelect[i].costuomtype   ;
              qryWareOrderInSKU.Fieldbyname('jobnoin').asstring            :=TLocationSKUSelect[i].Jobno  ;
              qryWareOrderInSKU.fieldbyname('snoin').asInteger             :=TLocationSKUSelect[i].SNO    ;
              qryWareOrderInSKU.fieldbyname('ldsnoin').asInteger          :=TLocationSKUSelect[i].LD_SNO ;
              qryWareOrderInSKU.Fieldbyname('jobnoinf').asstring          :=TLocationSKUSelect[i].jobnoinf  ;
              qryWareOrderInSKU.fieldbyname('snoinf').asInteger           :=TLocationSKUSelect[i].snoinf    ;
              qryWareOrderInSKU.fieldbyname('ldsnoinf').asInteger        :=TLocationSKUSelect[i].ldsnoinf ;
              qryWareOrderInSKU.fieldbyname('CustomsNO').asstring           :=TLocationSKUSelect[i].CustomsNO ;
              qryWareOrderInSKU.fieldbyname('LocationBillNO').asstring      :=TLocationSKUSelect[i].LocationBillNO ;
              qryWareOrderInSKU.Fieldbyname('WO_TagEach').asstring          :=TLocationSKUSelect[i].WO_TagEach   ;
              qryWareOrderInSKU.Fieldbyname('TagEachUOM').asstring          :=TLocationSKUSelect[i].TagEachUOM     ;
              qryWareOrderInSKU.Fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond   ;
              qryWareOrderInSKU.Fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent     ;
              qryWareOrderInSKU.Fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost   ;
              qryWareOrderInSKU.Fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype     ;
              qryWareOrderInSKU.Fieldbyname('WO_CCAID').asstring            :=TLocationSKUSelect[i].costcusid ;
              qryWareOrderInSKU.Fieldbyname('loadcostone').asstring      :=TLocationSKUSelect[i].loadcostone ;
              qryWareOrderInSKU.Fieldbyname('skucostclasscd').asString      :=TLocationSKUSelect[i].skucostclasscd;
              qryWareOrderInSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TLocationSKUSelect[i].syquantity;
//              if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//              then break;
            end;
          end;
        end;
    end;  wql_new}
end;

procedure TfrmWareOrderIn.edtCusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInOriSKU.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.cmbShipperAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_new  if DataState in Setdcs then
  begin
    with workAccountselect('C') do
    if OkFlag then
    begin
      qryWareOrderInSKU.Edit;
      qryWareOrderInSKU.Fieldbyname('shippercusid').asstring  :=cusid;
      qryWareOrderInSKU.Fieldbyname('shippercusname').asstring:=ACCOUNT_SHORTNAME;
    end;
  end;  wql_new}
end;

procedure TfrmWareOrderIn.qryWareOrderUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction:=uaApplied;
end;

procedure TfrmWareOrderIn.cmbSKUNameEnter(Sender: TObject);
begin
   if (DataState in Setdcs) and (qryWareOrderInSKU.Fieldbyname('SKUID').asstring='') then
   begin
     qryWareOrderInSKU.Edit;
     qryWareOrderInSKU.Fieldbyname('SKUID').asstring:='';
     qryWareOrderInSKU.Fieldbyname('PieceUOM').asstring:=_PieceUOM;
     qryWareOrderInSKU.Fieldbyname('VolumeUOM').asstring:=_VolumeUOM;
     qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring:=_AreaUOM;
     qryWareOrderInSKU.Fieldbyname('WeightUOM').asstring:=_WeightUOM;
     qryWareOrderInSKU.Fieldbyname('QUANTITYUOM').asstring:=_PieceUOM;
   end;
end;

procedure TfrmWareOrderIn.grdWareOrderDblClick(Sender: TObject);
begin
   if pcWareOrder.activepage <> tbsEdit then pcWareOrder.ActivePage := tbsEdit;
end;

procedure TfrmWareOrderIn.cmbQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{
  if DataState in setDcs then
  begin
    with workQualitySelect(qryWareOrderInSKU.FieldByName('QualityName').AsString) do
    if OkFlag then
    begin
      qryWareOrderInSKU.edit;
      qryWareOrderInSKU.FieldByName('QualityName').AsString:=QualityName;
    end;
  end;
}
end;

procedure TfrmWareOrderIn.ShowHint(var HintStr: string; var CanShow: Boolean;
   var HintInfo: THintInfo);
begin
  if HintInfo.HintControl = edtCostcusid then
  begin
    OpenSql(dataTmp.qryTmp,'Select linkman,address,tel,Banker="",ACNORMB=""  from customer where cusid="'+edtCostcusid.TextField+'"');
    Hintstr := '联系人：'+dataTmp.qryTmp.FieldByName('linkman').AsString+chr(13)+chr(10)
             + '地  址：'+dataTmp.qryTmp.FieldByName('Address').AsString+chr(13)+chr(10)
             + '电  话：'+dataTmp.qryTmp.FieldByName('tel').AsString+chr(13)+chr(10)
             + '开户行：'+dataTmp.qryTmp.FieldByName('Banker').AsString+chr(13)+chr(10)
             + '帐  号：'+dataTmp.qryTmp.FieldByName('ACNORMB').AsString;
    HintInfo.HintColor := clHighlightText;
  end;
end;

procedure TfrmWareOrderIn.cmbLocationIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
 if DataState in setDcs then
  begin
    qryselect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('LocID').asstring<>'NO' then
    begin
      qryWareOrderInOriSKU.Edit;
      qryWareOrderInOriSKU.Fieldbyname('Locid').asstring:=qrySelect.fieldbyname('LocId').asstring;
      qryWareOrderInOriSKU.Fieldbyname('Locname').asstring:=qrySelect.fieldbyname('LocName').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmWareOrderIn.btnTaskClick(Sender: TObject);
var strNum:Integer;
begin
  if (qryWareOrderIn.FieldByName('CheckName').Asstring='') and (_DB_Order<>'T') then
  begin
    {if _Language='CAPTIONC' then
       _strmessage:='该指令还未审核不能生成任务！请先审核！'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','023'),mtWarning,[mbOK],0);
    Exit;
  end;
  if not qryWareOrderInSKU.active then qryWareOrderInSKU.open;
  if qryWareOrderInSKU.RecordCount=0 then
  begin
   {if _Language='CAPTIONC' then
       _strmessage:='没有商品信息！'
    else
       _strmessage:=''; }
    KmessageDlg(GetMessage('frmWareOrderDxALL','024'),mtWarning,[mbOK],0);
    Exit;
  end;
{lqs
  if _DB_Order<>'T' then
  begin
     opensql(dataTmp.qryTmp,'select acount=count(*) '
                   +'  from '+iif(qryWareOrderIn.FieldByName('DictateType').AsString='进仓指令',
                    '       locationinitem (nolock)','locationoutitem (nolock)')
                   +' where jobnoorder="'+qryWareOrderIn.FieldByName('jobno').Asstring+'"');
     if dataTmp.qryTmp.FieldByName('acount').AsInteger>0 then
       if KmessageDlg(GetMessage('frmWareOrderDxALL','025'),mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;//iif(_language='CAPTIONC','该指令单已有数据形成任务，您确定要重新生成任务吗?','')
 
  end;        }
  pcWareOrder.ActivePage := tbsEdit;
  pcInfo.ActivePage:=tbsWareOrderSKU;

  qryWareOrderInSKU.DisableControls;
  Bookmark:= qryWareOrderInSKU.GetBookmark;
  strNum:=0;
  qryWareOrderInSKU.First;
  while not qryWareOrderInSKU.Eof do
  begin
    if qryWareOrderInSKU.FieldByName('skuid').Asstring='' then strNum:=strNum+1;
    qryWareOrderInSKU.Next;
  end;
  qryWareOrderInSKU.GotoBookmark(Bookmark);
  qryWareOrderInSKU.FreeBookmark(Bookmark);
  bookMark:=nil;
  qryWareOrderInSKU.EnableControls;

  if strNum<>0 then
    begin
      if WorkChooseSKUID(qryWareOrderInSKU) then
        begin
          //更新后台数据库的商品库内容
          _ADOConnection.Starttransaction;
          qryWareOrderInSKU.first;
          qryWareOrderInSKU.EnableControls;
          qryWareOrderInSKU.applyupdates;

          //检查库存
//wql_new          CheckWareInventory(qryWareOrderInEdit.FieldByName('Jobno').AsString);
          _ADOConnection.Commit;

          qryWareOrderInSKU.commitUpdates;
        end
      else exit;
    end;
  //调用locationinout，生成任务!为了取完整的商品费率必须filtered设为False!
  WorkLocationIN(stInsert,'','ITEM',qryWareOrderInEdit,qryWareOrderInSKU)
end;

procedure TfrmWareOrderIn.mitFilterActiveClick(Sender: TObject);
begin
  grdWareOrder.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmWareOrderIn.cmbQUANTITYUOMEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderIn.cmbSKUSectionUnitEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderIn.cmbSectionUnitEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;


procedure TfrmWareOrderIn.btnTotalClick(Sender: TObject);
var
  QuantityTotal, PieceTotal:Extended;
  VolumeTotal, AreaTotal, NetWeightTotal,GrossWeightTotal:Extended;
  strSKUNameTotal,strQuantityUOM,strPieceUOM,strVolumeUOM,strAreaUOM,strWeightUOM:string;
  blnQuantityLike,blnPieceLike,blnVolumeLike,blnWeightLike,blnAreaLike:Boolean;
begin
  QuantityTotal:=0;
  PieceTotal   :=0;
  VolumeTotal  :=0;
  AreaTotal    :=0;
  NetWeightTotal   :=0;
  GrossWeightTotal :=0;

  strSKUNameTotal:='';
  blnQuantityLike:=True;
  blnPieceLike   :=True;
  blnVolumeLike  :=True;
  blnWeightLike  :=True;
  blnAreaLike    :=True;
  //指令商品
  qryWareOrderInSKU.DisableControls;
  qryWareOrderInSKU.first;
  while not qryWareOrderInSKU.eof do
  begin
    //指令商品数量合计

    if Pos(qryWareOrderInSKU.fieldbyname('skuname').AsString,strSKUNameTotal)=0 then
       strSKUNameTotal :=strSKUNameTotal+qryWareOrderInSKU.fieldbyname('skuname').AsString+' ';

    QuantityTotal:=QuantityTotal+qryWareOrderInSKU.fieldbyname('Quantity').AsFloat;
    PieceTotal:=PieceTotal+qryWareOrderInSKU.fieldbyname('Piece').AsFloat;

    if blnQuantityLike and ((trim(strQuantityUOM)='')
      or (strQuantityUOM=qryWareOrderInSKU.fieldbyname('QuantityUOM').AsString)) then
    begin
      strQuantityUOM   :=qryWareOrderInSKU.fieldbyname('QuantityUOM').AsString;
    end else
    begin
      blnQuantityLike:=False;
      strQuantityUOM   :='';
    end;

    if blnPieceLike and ((trim(strPieceUOM)='')
      or (strPieceUOM=qryWareOrderInSKU.fieldbyname('PieceUOM').AsString)) then
    begin
//      PieceTotal:=PieceTotal+qryWareOrderInSKU.fieldbyname('Piece').asInteger;
      strPieceUOM   :=qryWareOrderInSKU.fieldbyname('PieceUOM').AsString;
    end else
    begin
      blnPieceLike:=False;
//      PieceTotal:=0;
      strPieceUOM   :='';
    end;

    if blnVolumeLike and ((trim(strVolumeUOM)='')
      or (strVolumeUOM=qryWareOrderInSKU.fieldbyname('VolumeUOM').AsString)) then
    begin
      VolumeTotal:=VolumeTotal+qryWareOrderInSKU.fieldbyname('Volume').asfloat;
      strVolumeUOM   :=qryWareOrderInSKU.fieldbyname('VolumeUOM').AsString;
    end else
    begin
      blnVolumeLike:=False;
      VolumeTotal:=0;
      strVolumeUOM   :='';
    end;

    if blnAreaLike and ((trim(strAreaUOM)='')
      or (strAreaUOM=qryWareOrderInSKU.fieldbyname('AreaUOM').AsString)) then
    begin
      AreaTotal    :=AreaTotal+qryWareOrderInSKU.fieldbyname('Area').asfloat;
      strAreaUOM   :=qryWareOrderInSKU.fieldbyname('AreaUOM').AsString;
    end else
    begin
      blnAreaLike:=False;
      AreaTotal:=0;
      strAreaUOM   :='';
    end;

    if blnWeightLike and ((trim(strWeightUOM)='')
      or (strWeightUOM=qryWareOrderInSKU.fieldbyname('WeightUOM').AsString)) then
    begin
      NetWeightTotal  :=NetWeightTotal+qryWareOrderInSKU.fieldbyname('NetWeight').asfloat;
      GrossWeightTotal:=GrossWeightTotal+qryWareOrderInSKU.fieldbyname('GrossWeight').asfloat;
      strWeightUOM        :=qryWareOrderInSKU.fieldbyname('WeightUOM').AsString;
    end else
    begin
      blnWeightLike   :=False;
      NetWeightTotal  :=0;
      GrossWeightTotal:=0;
      strWeightUOM    :='';
    end;

    qryWareOrderInSKU.Next;
  end;
  qryWareOrderInSKU.First;
  qryWareOrderInSKU.EnableControls;
  qryWareOrderInSKUAfterScroll(qryWareOrderInSKU);

  //合计结果复制给主库
  qryWareOrderInEdit.Edit;
  qryWareOrderInEdit.fieldbyname('Quantity').AsFloat:=QuantityTotal;
  qryWareOrderInEdit.fieldbyname('Piece').AsFloat:=PieceTotal;
  qryWareOrderInEdit.fieldbyname('Volume').asfloat:=VolumeTotal;
  qryWareOrderInEdit.fieldbyname('Area').asfloat:=AreaTotal;
  qryWareOrderInEdit.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
  qryWareOrderInEdit.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
  qryWareOrderInEdit.fieldbyname('QuantityUOM').AsString:=strQuantityUOM;
  qryWareOrderInEdit.fieldbyname('PieceUOM').AsString:=strPieceUOM;
  qryWareOrderInEdit.fieldbyname('VolumeUOM').AsString:=strVolumeUOM;
  qryWareOrderInEdit.fieldbyname('AreaUOM').AsString:=strAreaUOM;
  qryWareOrderInEdit.fieldbyname('WeightUOM').AsString:=strWeightUOM;
  qryWareOrderInEdit.fieldbyname('skuname').AsString:=deleteJVHZ(strSKUNameTotal,50);
end;

procedure TfrmWareOrderIn.ckbCountcontcostClick(Sender: TObject);
begin
  if (DataState in Setdcs) and ckbCountcontcost.Checked then
  begin
    qryWareOrderInEdit.Edit;
    qryWareOrderInEdit.FieldByName('countrent').Asstring:='F';
  end;
end;

procedure TfrmWareOrderIn.mitSplitClick(Sender: TObject);
var
  QuantityTotal:Extended;
  VolumeTotal, AreaTotal, NetWeightTotal, GrossWeightTotal:Extended;
  extVolume, extArea, extNetWeight, extGrossWeight:Extended;
  LastSNO:integer;
begin
  QuantityTotal:=0;
  VolumeTotal  :=0;
  AreaTotal    :=0;
  NetWeightTotal   :=0;
  GrossWeightTotal :=0;
  LastSNO:=-1;
  extVolume:=0;
  extArea:=0;
  extNetWeight:=0;
  extGrossWeight:=0;
  if DataState in Setdcs then
  begin
    if (qryWareOrderInEdit.FieldByName('Volume').AsFloat=0) and
       (qryWareOrderInEdit.FieldByName('Area').AsFloat=0) and
       (qryWareOrderInEdit.FieldByName('GrossWeight').AsFloat=0) and
       (qryWareOrderInEdit.FieldByName('NetWeight').AsFloat=0) then exit;

    extVolume:=qryWareOrderInEdit.FieldByName('Volume').AsFloat;
    extArea:=qryWareOrderInEdit.FieldByName('Area').AsFloat;
    extGrossWeight:=qryWareOrderInEdit.FieldByName('GrossWeight').AsFloat;
    extNetWeight:=qryWareOrderInEdit.FieldByName('NetWeight').AsFloat;
    //取得数量合计
    qryWareOrderInSKU.DisableControls;
    qryWareOrderInSKU.first;
    while not qryWareOrderInSKU.eof do
    begin
      QuantityTotal   :=QuantityTotal+qryWareOrderInSKU.fieldbyname('Quantity').AsFloat;
      qryWareOrderInSKU.Next;
    end;
    LastSNO:=qryWareOrderInSKU.fieldbyname('SNO').AsInteger;
    qryWareOrderInSKU.First;
    qryWareOrderInSKU.EnableControls;
    qryWareOrderInSKUAfterScroll(qryWareOrderInSKU);
    //数量拆分
    qryWareOrderInSKU.DisableControls;
    qryWareOrderInSKU.first;
    while not qryWareOrderInSKU.eof do
    begin
      qryWareOrderInSKU.Edit;
      if extVolume<>0 then
        if qryWareOrderInSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderInSKU.fieldbyname('Volume').asfloat:=kround(qryWareOrderInSKU.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
        else
          qryWareOrderInSKU.fieldbyname('Volume').asfloat:=extVolume-VolumeTotal;
      if extArea<>0 then
        if qryWareOrderInSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderInSKU.fieldbyname('Area').asfloat:=kround(qryWareOrderInSKU.fieldbyname('Quantity').asFloat*extArea/QuantityTotal,4)
        else
          qryWareOrderInSKU.fieldbyname('Area').asfloat:=extArea-AreaTotal;
      if extNetWeight<>0 then
        if qryWareOrderInSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderInSKU.fieldbyname('NetWeight').asfloat:=kround(qryWareOrderInSKU.fieldbyname('Quantity').asFloat*extNetWeight/QuantityTotal,4)
        else
          qryWareOrderInSKU.fieldbyname('NetWeight').asfloat:=extNetWeight-NetWeightTotal;
      if extGrossWeight<>0 then
        if qryWareOrderInSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderInSKU.fieldbyname('GrossWeight').asfloat:=kround(qryWareOrderInSKU.fieldbyname('Quantity').asFloat*extGrossWeight/QuantityTotal,4)
        else
          qryWareOrderInSKU.fieldbyname('GrossWeight').asfloat:=extGrossWeight-GrossWeightTotal;

      VolumeTotal     :=VolumeTotal+qryWareOrderInSKU.fieldbyname('Volume').asfloat;
      AreaTotal       :=AreaTotal+qryWareOrderInSKU.fieldbyname('Area').asfloat;
      NetWeightTotal  :=NetWeightTotal+qryWareOrderInSKU.fieldbyname('NetWeight').asfloat;
      GrossWeightTotal:=GrossWeightTotal+qryWareOrderInSKU.fieldbyname('GrossWeight').asfloat;

      qryWareOrderInSKU.Next;
    end;
    qryWareOrderInSKU.First;
    qryWareOrderInSKU.EnableControls;
    qryWareOrderInSKUAfterScroll(qryWareOrderInSKU);
  end;
end;

procedure TfrmWareOrderIn.mitSKU_INClick(Sender: TObject);
var
   strJobno_IN:string;
begin
  with qryWareOrderInSKU do
  begin
    if Sender=mitSKU_IN then
    begin
      if FieldByName('jobnoin').AsString='' then exit;
      strJobno_IN:=FieldByName('jobnoin').AsString;
    end else
    if Sender=mitSKU_IN_F then
    begin
      if FieldByName('jobnoinf').AsString='' then exit;
      strJobno_IN:=FieldByName('jobnoinf').AsString;
    end;

    case strJobno_IN[5] of
    //进出仓
    'L':
       if strJobno_IN[6]='I' then
          WorkLocationIN(stBrowse,strJobno_IN,'item',nil,nil)
       else
       if strJobno_IN[6]='O' then
          WorkLocationOut(stBrowse,strJobno_IN,'item',nil,nil);
    //指令单
//    'W':
//      WorkWareOrderIn(stBrowse,strJobno_IN,nil,nil);
    {wql_new 
    'C':
    //寄仓单位变更
      if strJobno_IN[2]='A' then
        WorkChangeAccount(stBrowse,strJobno_IN,FieldByName('DataBaseID').AsString)
    //货主变更
      else
      if strJobno_IN[2]='S' then
        WorkChangeShipAcc(stBrowse,strJobno_IN,FieldByName('DataBaseID').AsString)
    //品质变更
      else
      if strJobno_IN[2]='Q' then
        WorkChangeQuality(stBrowse,strJobno_IN,FieldByName('DataBaseID').AsString);
    //移仓
    'R':
      if strJobno_IN[2]='L' then
        WorkRelocation(stBrowse,strJobno_IN,FieldByName('DataBaseID').AsString,'I');
    //库内作业
    'V':
      if strJobno_IN[2]='A' then
        workValueAdd(stBrowse,strJobno_IN,FieldByName('DataBaseID').AsString,'T'); wql_new}
    end;
  end;
end;

procedure TfrmWareOrderIn.edtCustomsNO_INEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderIn.edtVolumeDblClick(Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
begin
   jsPiece   :=qryWareOrderInSKU.FieldByName('Piece').AsFloat;
   jsHeight  :=qryWareOrderInSKU.FieldByName('Height').AsFloat;
   jsWidth   :=qryWareOrderInSKU.FieldByName('Width').AsFloat;
   jsDepth   :=qryWareOrderInSKU.FieldByName('Depth').AsFloat;
   jsVolume  :=qryWareOrderInSKU.FieldByName('Volume').AsFloat;
   jsSizeUOM :=qryWareOrderInSKU.FieldByName('SizeUOM').AsString;
   jsVolueUOM:=qryWareOrderInSKU.FieldByName('VolumeUOM').AsString;
    while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and (DataState in Setdcs) do
     begin
       qryWareOrderInSKU.Edit;
       qryWareOrderInSKU.FieldByName('Height').AsFloat    :=jsHeight;
       qryWareOrderInSKU.FieldByName('Width').AsFloat     :=jsWidth;
       qryWareOrderInSKU.FieldByName('Depth').AsFloat     :=jsDepth;
       qryWareOrderInSKU.FieldByName('Volume').AsFloat    :=jsVolume;
       qryWareOrderInSKU.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
       qryWareOrderInSKU.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
       exit;
     end;
end;

procedure TfrmWareOrderIn.edtSNOEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderIn.edtCostcusidEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    strGetCd:=edtCostcusid.Text;
    oldedtCostCus:=edtCostcusid.Text;
  end;
end;

procedure TfrmWareOrderIn.edtCostcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostcusid.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('costcusid').AsString:='';
         qryWareOrderInEdit.FieldByName('costcusname').AsString:='';
      end
{      else
      if edtCostcusid.Text<>'' then
      begin
         opensql(datatmp.qryTmp,'select top 1 cusid,cusname from customer where cusname like "%"+"'+trim(edtCostcusid.Text)+'"+"%"') ;
         if datatmp.qryTmp.RecordCount>0 then
         begin
            edtCostcusid.Text:=datatmp.qryTmp.fieldbyname('cusname').asstring;
            edtCostcusid.Textfield:=datatmp.qryTmp.fieldbyname('cusid').asstring;
         end;
      end }else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtCostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.Edit;
            qryWareOrderInEdit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
      if edtCostcusid.Text<>'' then
         InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+edtCostcusid.TextField+'"');
   end;
end;

procedure TfrmWareOrderIn.edtAccountIDEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    TdxDBButtonEdit(sender).DirectInput:=True;
    strGetCd:=edtCusid.Field.AsString;
  end;
end;

procedure TfrmWareOrderIn.edtAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
{wql_new  with TdxDBButtonEdit(sender) do
    if (Text<>'') and (Text<>strGetCd) then
    begin
      with workAccountselect('B',edtCusid.Field.AsString) do
      if okflag  then
      begin
        qryWareOrderInSKU.Edit;
        qryWareOrderInSKU.Fieldbyname('cusid').asstring  :=cusid;
        qryWareOrderInSKU.Fieldbyname('cusname').asstring:=ACCOUNT_SHORTNAME;
        strGetCd:=ACCOUNT_SHORTNAME;
      end else Failed:=True;
    end; wql_new}
end;

procedure TfrmWareOrderIn.cmbShipperAccountIDEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    TdxDBButtonEdit(sender).DirectInput:=True;
    strGetCd:=edtshippercusid.Field.AsString;
  end;
end;

procedure TfrmWareOrderIn.cmbShipperAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
 {wql_new  with TdxDBButtonEdit(sender) do
    if (Text<>'') and (Text<>strGetCd) then
    begin
      with workAccountselect('C',edtshippercusid.Field.AsString) do
      if OkFlag then
      begin
        qryWareOrderInSKU.Edit;
        qryWareOrderInSKU.Fieldbyname('shippercusid').asstring  :=cusid;
        qryWareOrderInSKU.Fieldbyname('shippercusname').asstring:=ACCOUNT_SHORTNAME;
        strGetCd:=ACCOUNT_SHORTNAME;
      end else Failed:=True;
    end; wql_new}
end;

procedure TfrmWareOrderIn.cmbLocationIDEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    if (strInOut='I')  then
       TdxDBButtonEdit(sender).DirectInput:=True
    else
       TdxDBButtonEdit(sender).DirectInput:=False;
//    strGetCd:=cmbLocationID.Text;
  end;
end;

procedure TfrmWareOrderIn.cmbLocationIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
{wql_new  if DataState in setDcs then
  begin
    with worklocationselect('','',cmbLocationID.Field.AsString) do
    if okFlag then
    begin
      qryWareOrderInSKU.Edit;
      qryWareOrderInSKU.Fieldbyname('locid').asstring:=locid;
      qryWareOrderInSKU.Fieldbyname('LocationName').asstring:=LocationName;
      strGetCd:=LocationName;
    end else Failed:=True;
  end;  wql_new}
end;

procedure TfrmWareOrderIn.mitLIInventoryClick(Sender: TObject);
var strsql,strFilter1,strFilter2:string;
begin
  strsql:='select item.Jobno,item.operationdate,item.Quantity, '
         +'       quantityremain=isnull(item.quantity,0)-isnull(item.quantitydo,0), '
         +'       quantitytaskremain=isnull(item.quantity,0)-isnull(item.quantitydotask,0), '
         +'       quantityorderremain=isnull(item.quantity,0)-isnull(item.quantitydoorder,0),'
         +'       iotype=case substring(item.Jobno,1,2)'
         +'                   when "LI" then "进仓"'
         +'                   when "LO" then "出仓"'
         +'                   when "VA" then "库内作业"'
         +'                   else "" end,'
         +'       item.locationbillno,'
         +'       keyid=item.Jobno'
         +'  from locationinitem item (nolock)'
         +' where 1=1 '
         +'   and item.Jobno="'+qryWareOrderInSKU.FieldbyName('jobnoin').AsString+'" '
         +' and item.SNO='+inttostr(qryWareOrderInSKU.FieldbyName('snoin').AsInteger)
         ;
  opensql(dataTmp.qryTmp,strsql);
  kMessageDlg(GetMessage('frmLocationOut','064')+dataTmp.qryTmp.fieldbyname('LocationBillNO').asString+','+chr(13)
             +GetMessage('frmLocationOut','065')+Floattostr(dataTmp.qryTmp.fieldbyname('quantityorderremain').AsFloat)+','+chr(13)
             +GetMessage('frmLocationOut','066')+Floattostr(dataTmp.qryTmp.fieldbyname('quantitytaskremain').AsFloat)+','+chr(13)
             +GetMessage('frmLocationOut','067')+Floattostr(dataTmp.qryTmp.fieldbyname('quantityremain').AsFloat)+'!', mtInformation, [mbOK], 0);
  //iif(_language='CAPTIONC','对应进仓的仓单号为','')  IIF(_language='CAPTIONC','该单指令数量还剩','')iif(_language='CAPTIONC','该单任务数量还剩','')
  //iif(_language='CAPTIONC','该单库存数量还剩','')
end;

procedure TfrmWareOrderIn.mitOrder_INClick(Sender: TObject);
begin
 workWareOrderSelect(qryWareOrderInSKU.FieldbyName('Jobno').AsString,
                     qryWareOrderInSKU.FieldbyName('SNO').AsInteger,
                     iif(qryWareOrderInEdit.FieldByName('DictateType').asstring='进仓指令','I','O'));
end;

procedure TfrmWareOrderIn.grdWareOrderChangeNodeEx(Sender: TObject);
begin
  if (qryWareOrderInEdit.ParamByName('Jobno').AsString<>qryWareOrderIn.FieldByName('Jobno').AsString)
    or (qryWareOrderInEdit.ParamByName('Jobno').AsString='') then
  begin
    qryWareOrderInEdit.ParamByName('Jobno').AsString:=qryWareOrderIn.FieldByName('Jobno').AsString;
    qryWareOrderInOriSKU.ParamByName('Jobno').AsString:=qryWareOrderIn.FieldByName('Jobno').AsString;
    qryWareOrderInSKU.ParamByName('Jobno').AsString:=qryWareOrderIn.FieldByName('Jobno').AsString;

    GMSStickyLabel26.Caption:='发货人';

   //控制商品细目
      qryWareorderInSkuDetail.Close;
      if not m_blnPost then
      begin
        SetDetailActive(False,False);
        if (DataState = stInsert) then SetDetailActive(False,True)
        else if pcWareOrder.ActivePage=tbsEdit then SetDetailActive(True,True);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtCostcusidExit(Sender: TObject);
begin
   blnSelect:=False;
   WareOrder_strOrderCusID:=qryWareOrderInEdit.FieldByName('costcusid').AsString;
   WareOrder_strOrderCusName:=qryWareOrderInEdit.FieldByName('costcusname').AsString;
   WareOrder_strOrderShippercusid   :=qryWareOrderInEdit.FieldByName('costcusid').Asstring;
   WareOrder_strOrderShippercusname :=qryWareOrderInEdit.FieldByName('costcusname').Asstring;
  {wql_new if (DataState in Setdcs) and (oldedtCostCus<>edtCostcusid.Text) then
  begin
    with workAccountCNFGSelect( edtCostcusid.textfield,
           edtCostcusid.text) do
    if OkFlag then
    begin
      _ACC_PreservingDigit:=PreservingDigit;
      qryWareOrderInEdit.FieldByName('isbond').Asstring :=isbond;
      if edtOrderType.Text='出仓指令' then
        qryWareOrderInEdit.FieldByName('LoadType').AsString             :=LO_LoadType
      else
        qryWareOrderInEdit.FieldByName('LoadType').AsString             :=LoadType;
      qryWareOrderInEdit.FieldByName('contwithloca').AsString      :=contwithloca;
      qryWareOrderInEdit.FieldByName('lottracked').AsString        :=lottracked;
      qryWareOrderInEdit.FieldByName('countrent').AsString         :=countrent;
      qryWareOrderInEdit.FieldByName('WO_CountLoadCost').AsString     :=WO_CountLoadCost;
      qryWareOrderInEdit.FieldByName('countcontcost').AsString     :=countcontcost;
      qryWareOrderInEdit.FieldByName('skucostclasscd').AsString       :=skucostclasscd;
      qryWareOrderInEdit.FieldByName('warerentcounttype').Asstring    :=warerentcounttype;
      data.WareOrder_strOrderCusID:=iif(cusid='',qryWareOrderInEdit.FieldByName('costcusid').AsString,cusid);
      data.WareOrder_strOrderCusName:=iif(cusname='',qryWareOrderInEdit.FieldByName('costcusname').AsString,cusname);
      data.WareOrder_strOrderShippercusid   :=iif(shippercusid<>'',shippercusid,qryWareOrderInEdit.FieldByName('costcusid').Asstring);
      data.WareOrder_strOrderShippercusname :=iif(shippercusname<>'',shippercusname,qryWareOrderInEdit.FieldByName('costcusname').Asstring);
    end;
  end; wql_new}
end;

procedure TfrmWareOrderIn.mitSKUSelectClick(Sender: TObject);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
  if strInOut='I' then
  begin
    if DataState in Setdcs then
    begin
      if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=edtCostcusid;
        {if _Language='CAPTIONC' then
           _strmessage:='费用关系人不能为空，必须填写！'
        else
            _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','003'),mtWarning,[mbOK],0);
        Exit;
      end;

      qrySelect:=PGetSKUSelect('','','D');
      qrySelect.First;
      i:=0;
      while not qrySelect.Eof do
      begin
          if i=0 then
          begin
            qryWareOrderInSKU.edit;
            qryWareOrderInEdit.Edit;
            qryWareOrderInEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
            qryWareOrderInEdit.fieldbyname('Quantity').AsFloat           :=qryselect.fieldbyname('Quantity_set').AsFloat;
            qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
          end else
          begin
//            if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//            then break;
            qryWareOrderInSKU.append;
            qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
            qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
            qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
          end;
          qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
          qryWareOrderInSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
          strGetCd := qryselect.fieldbyname('SKUName').asstring;
          if qryselect.Fieldbyname('LotCode').asstring<>'' then
            qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
          if qryselect.fieldbyname('Quantity').AsFloat<>0 then
            qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
          if qryselect.Fieldbyname('QualityName').asstring<>'' then
            qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring;
          qryWareOrderInOriSKU.fieldbyname('QuantityUOM').asstring            :=qryselect.fieldbyname('QuantityUOM').asstring;
          qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring;
          qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring;
          qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring;
          qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring;
          if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
            qryWareOrderInSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
            qryWareOrderInSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
          if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
            qryWareOrderInSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
            qryWareOrderInSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
//          if qryWareOrderInSKU.fieldByname('costcusid').AsString='' then
//            qryWareOrderInSKU.fieldByname('costcusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
//          if qryWareOrderInSKU.fieldByname('costcusname').AsString='' then
//            qryWareOrderInSKU.fieldByname('costcusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

          qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring          :='';

          qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
          qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
          qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
          qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
          qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
          qryWareOrderInSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
          qryWareOrderInSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
          qryWareOrderInSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
          qryWareOrderInSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
          qryWareOrderInSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
          qryWareOrderInSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
          qryWareOrderInSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
          qryWareOrderInSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
          qryWareOrderInSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
          qryWareOrderInSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;

          qryWareOrderInSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
          qryWareOrderInSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
          qryWareOrderInSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
          qryWareOrderInSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

          OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                +'  from skuprice '
                                +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                +'   and uomtype="'+qryWareOrderInSKU.fieldbyname('CostUOMType').AsString+'"'
                                +'   and userid like "'+_userid+'%"'
                 );
          qryWareOrderInSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
          qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
          qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
          qryWareOrderInSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
          qryWareOrderInSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
//wql_new          qryWareOrderInSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
//wql_new          qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
//wql_new          qryWareOrderInSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
         qrySelect.Next;
         Inc(i);
        end;
      end;
//    end;
    end else
    begin
      if DataState in Setdcs then
        begin
          if _isnocusfilter='T' then    //wql.05.09.26
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,'出仓指令-库存商品选择','ITEM',sltselect,blnisopen,
                                                        '','')
          else
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,'出仓指令-库存商品选择','ITEM',sltselect,blnisopen,
                                                        qryWareOrderInSKU.fieldbyname('cusid').asstring,
                                                        qryWareOrderInSKU.fieldbyname('cusname').asstring);

          for i:=0 to 500 do
          begin
            if TLocationSKUSelect[i].OkFlag then
            begin
              if i=0 then
              begin
                qryWareOrderInSKU.edit;
                qryWareOrderInEdit.Edit;
                qryWareOrderInEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
                qryWareOrderInEdit.fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond;
                qryWareOrderInEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
                qryWareOrderInEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
                qryWareOrderInEdit.fieldbyname('skucostclasscd').asstring   :=TLocationSKUSelect[i].skucostclasscd;
                qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype;
                qryWareOrderInEdit.fieldbyname('loadcosttype').asstring     :=TLocationSKUSelect[i].loadcosttype;
                if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
                begin
                  qryWareOrderInEdit.fieldbyname('costcusid').asstring  :=TLocationSKUSelect[i].costcusid;
                  qryWareOrderInEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
                end;
                ckbCountcontcostClick(self);
              end else
              begin
//                if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//                then break;
                qryWareOrderInSKU.append;
                qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
                qryWareOrderInSKU.fieldByname('jobno').AsString         :=qryWareOrderInEdit.fieldbyname('jobno').AsString;
                qryWareOrderInSKU.fieldByname('userid').AsString        :=qryWareOrderInEdit.fieldbyname('userid').AsString;
              end;
              qryWareOrderInSKU.fieldbyname('SKUID').asstring           :=TLocationSKUSelect[i].SKUID            ;
              qryWareOrderInSKU.fieldbyname('skuname').asstring         :=TLocationSKUSelect[i].skuname          ;
              qryWareOrderInSKU.Fieldbyname('LotCode').asstring         :=TLocationSKUSelect[i].LotCode          ;
              qryWareOrderInSKU.Fieldbyname('locid').asstring           :=TLocationSKUSelect[i].locid       ;
              qryWareOrderInSKU.Fieldbyname('LocName').asstring         :=TLocationSKUSelect[i].LocName       ;
              qryWareOrderInSKU.fieldbyname('Quantity').AsFloat         :=TLocationSKUSelect[i].syquantity        ;
              qryWareOrderInSKU.fieldbyname('QualityName').asstring     :=TLocationSKUSelect[i].QualityName      ;
              qryWareOrderInSKU.fieldbyname('PieceUOM').asstring        :=TLocationSKUSelect[i].PieceUOM         ;
              qryWareOrderInSKU.fieldbyname('WeightUOM').asstring       :=TLocationSKUSelect[i].WeightUOM        ;
              qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring       :=TLocationSKUSelect[i].VolumeUOM        ;
              qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring         :=TLocationSKUSelect[i].AreaUOM          ;
              qryWareOrderInSKU.fieldbyname('Piece').AsFloat            :=TLocationSKUSelect[i].syPiece          ;
              qryWareOrderInSKU.fieldbyname('NetWeight').asFloat        :=TLocationSKUSelect[i].syNetWeight      ;
              qryWareOrderInSKU.Fieldbyname('GrossWeight').asFloat      :=TLocationSKUSelect[i].syGrossWeight    ;
              qryWareOrderInSKU.fieldbyname('Volume').asFloat           :=TLocationSKUSelect[i].syVolume         ;
              qryWareOrderInSKU.Fieldbyname('Area').asFloat             :=TLocationSKUSelect[i].syArea           ;
              qryWareOrderInSKU.fieldbyname('cusid').asstring           :=TLocationSKUSelect[i].cusid        ;
              qryWareOrderInSKU.fieldbyname('cusname').asstring         :=TLocationSKUSelect[i].cusname      ;
              qryWareOrderInSKU.Fieldbyname('shippercusid').asstring    :=TLocationSKUSelect[i].shippercusid ;
              qryWareOrderInSKU.Fieldbyname('shippercusname').asstring  :=TLocationSKUSelect[i].shippercusname  ;
              qryWareOrderInSKU.Fieldbyname('shipcusid').asstring       :=TLocationSKUSelect[i].shipcusid ;
              qryWareOrderInSKU.Fieldbyname('shipcusname').asstring     :=TLocationSKUSelect[i].shipcusname  ;
              qryWareOrderInSKU.fieldbyname('costcusid').asstring       :=TLocationSKUSelect[i].costcusid        ;
              qryWareOrderInSKU.fieldbyname('costcusname').asstring     :=TLocationSKUSelect[i].costcusname      ;
//              qryWareOrderInSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
              qryWareOrderInSKU.Fieldbyname('contwithloca').asstring     :=TLocationSKUSelect[i].contwithloca   ;
              qryWareOrderInSKU.Fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked     ;
              qryWareOrderInSKU.Fieldbyname('skucost').asFloat           :=TLocationSKUSelect[i].skucost          ;
              qryWareOrderInSKU.Fieldbyname('currcd').asstring           :=TLocationSKUSelect[i].currcd  ;
              qryWareOrderInSKU.fieldbyname('price').asFloat             :=TLocationSKUSelect[i].price     ;
              qryWareOrderInSKU.fieldbyname('costuomtype').asstring      :=TLocationSKUSelect[i].costuomtype   ;
              qryWareOrderInSKU.Fieldbyname('jobnoin').asstring          :=TLocationSKUSelect[i].Jobno  ;
              qryWareOrderInSKU.fieldbyname('snoin').asInteger           :=TLocationSKUSelect[i].SNO    ;
              qryWareOrderInSKU.fieldbyname('ldsnoin').asInteger         :=TLocationSKUSelect[i].LDSNO ;
              qryWareOrderInSKU.Fieldbyname('jobnoinf').asstring         :=TLocationSKUSelect[i].jobnoinf  ;
              qryWareOrderInSKU.fieldbyname('snoinf').asInteger          :=TLocationSKUSelect[i].snoinf    ;
              qryWareOrderInSKU.fieldbyname('ldsnoinf').asInteger        :=TLocationSKUSelect[i].ldsnoinf ;
              qryWareOrderInSKU.Fieldbyname('jobnoori').asstring         :=TLocationSKUSelect[i].jobnoori  ;
              qryWareOrderInSKU.fieldbyname('snoori').asInteger          :=TLocationSKUSelect[i].snoori    ;
              if  qryWareOrderInSKU.Fieldbyname('jobnoori').asstring<>'' then
              qryWareOrderInSKU.Fieldbyname('jobnooridp').asstring       :='T';

              qryWareOrderInSKU.fieldbyname('CustomsNO').asstring        :=TLocationSKUSelect[i].CustomsNO ;
              qryWareOrderInSKU.fieldbyname('LocationBillNO').asstring   :=TLocationSKUSelect[i].LocationBillNO ;
              qryWareOrderInSKU.Fieldbyname('TagEach').asstring          :=TLocationSKUSelect[i].TagEach   ;
              qryWareOrderInSKU.Fieldbyname('TagEachUOM').asstring       :=TLocationSKUSelect[i].TagEachUOM     ;
              qryWareOrderInSKU.Fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond   ;
              qryWareOrderInSKU.Fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent     ;
              qryWareOrderInSKU.Fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost   ;
              qryWareOrderInSKU.Fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype     ;
              qryWareOrderInSKU.Fieldbyname('WO_CCAID').asstring         :=TLocationSKUSelect[i].costcusid ;
              qryWareOrderInSKU.Fieldbyname('loadcostone').asstring      :=TLocationSKUSelect[i].loadcostone ;
              qryWareOrderInSKU.Fieldbyname('skucostclasscd').asString   :=TLocationSKUSelect[i].skucostclasscd;
              qryWareOrderInSKU.Fieldbyname('carriage').asFloat          :=TLocationSKUSelect[i].carriage;
              qryWareOrderInSKU.Fieldbyname('carriagetotal').asFloat     :=TLocationSKUSelect[i].carriagetotal;
              qryWareOrderInSKU.fieldbyname('insurance').asFloat         :=TLocationSKUSelect[i].insurance;
              qryWareOrderInSKU.Fieldbyname('insurancetotal').asFloat    :=TLocationSKUSelect[i].insurancetotal;
              qryWareOrderInSKU.Fieldbyname('SKU_CustomerID').asString   :=TLocationSKUSelect[i].customerno;
              qryWareOrderInSKU.Fieldbyname('skumodel').asString         :=TLocationSKUSelect[i].skumodel;
              qryWareOrderInSKU.Fieldbyname('skuspec').asString          :=TLocationSKUSelect[i].skuspec;
              qryWareOrderInSKU.Fieldbyname('color').asString            :=TLocationSKUSelect[i].color;
//wql_new              qryWareOrderInSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TLocationSKUSelect[i].syquantity;
//              if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//              then break;
              if sltselect.IndexOf(TLocationSKUSelect[i].JOBNO+
                                   IntToStr(TLocationSKUSelect[i].sno)+
                                   IntToStr(TLocationSKUSelect[i].ldsno))=-1 then

              sltselect.Add(TLocationSKUSelect[i].JOBNO+
                            IntToStr(TLocationSKUSelect[i].sno)+
                            iif(inttostr(TLocationSKUSelect[i].LDSNO)='0','',inttostr(TLocationSKUSelect[i].LDSNO)));

            end;
          end;
        end;
    end;
end;

procedure TfrmWareOrderIn.mitTaskSKUSelectClick(Sender: TObject);
var
//wql_new  TContainerSKUSelect:TMultContainerSKUSelect;
  i:integer;
//  acontrol: TWinControl;
begin
 {wql_new if DataState in Setdcs then
     begin
      TContainerSKUSelect:=  WorkContainerSKUSelect('',strINOUT);
      for i:=0 to 100 do
      begin
         if TContainerSKUSelect[i].OkFlag then
         begin
           if i=0 then
           begin
             qryWareOrderInSKU.edit;
             qryWareOrderInEdit.edit;
             qryWareOrderInEdit.fieldbyname('lottracked').asstring       :=TContainerSKUSelect[i].lottracked;
             qryWareOrderInEdit.fieldbyname('isbond').asstring:=TContainerSKUSelect[i].isbond;
             qryWareOrderInEdit.fieldbyname('countrent').asstring        :=TContainerSKUSelect[i].countrent;
             qryWareOrderInEdit.fieldbyname('countcontcost').asstring    :=TContainerSKUSelect[i].countcontcost;
             qryWareOrderInEdit.fieldbyname('skucostclasscd').asstring      :=TContainerSKUSelect[i].skucostclasscd;
             qryWareOrderInEdit.fieldbyname('warerentcounttype').asstring   :=TContainerSKUSelect[i].warerentcounttype;
             if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
             begin
               qryWareOrderInEdit.fieldbyname('costcusid').asstring:=TContainerSKUSelect[i].costcusid;
               qryWareOrderInEdit.fieldbyname('costcusname').asstring:=TContainerSKUSelect[i].costcusname;
             end;
             ckbCountcontcostclick(self);
           end else
           begin
//             if not grdWareOrderSKUBeforePost(qryWareOrderInSKU,aControl)
//             then break;
             qryWareOrderInSKU.append;
             qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
             qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
             qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
             qryWareOrderInSKU.fieldByname('DataBaseID').AsString:=_DataBaseID;
           end;
            qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=TContainerSKUSelect[i].SKUID            ;
            qryWareOrderInSKU.fieldbyname('skuname').asstring             :=TContainerSKUSelect[i].skuname          ;
            qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=TContainerSKUSelect[i].LotCode          ;
            qryWareOrderInSKU.Fieldbyname('locid').asstring          :=TContainerSKUSelect[i].locid       ;
            qryWareOrderInSKU.Fieldbyname('LocationName').asstring        :=TContainerSKUSelect[i].LocationName       ;
            qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=TContainerSKUSelect[i].syquantity        ;
            qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=TContainerSKUSelect[i].QualityName      ;
            qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=TContainerSKUSelect[i].PieceUOM         ;
            qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=TContainerSKUSelect[i].WeightUOM        ;
            qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=TContainerSKUSelect[i].VolumeUOM        ;
            qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=TContainerSKUSelect[i].AreaUOM          ;
            qryWareOrderInSKU.fieldbyname('Piece').AsFloat                :=TContainerSKUSelect[i].syPiece          ;
            qryWareOrderInSKU.fieldbyname('NetWeight').asFloat            :=TContainerSKUSelect[i].syNetWeight      ;
            qryWareOrderInSKU.Fieldbyname('GrossWeight').asFloat          :=TContainerSKUSelect[i].syGrossWeight    ;
            qryWareOrderInSKU.fieldbyname('Volume').asFloat               :=TContainerSKUSelect[i].syVolume         ;
            qryWareOrderInSKU.Fieldbyname('Area').asFloat                 :=TContainerSKUSelect[i].syArea           ;
            qryWareOrderInSKU.fieldbyname('cusid').asstring           :=TContainerSKUSelect[i].cusid        ;
            qryWareOrderInSKU.fieldbyname('cusname').asstring         :=TContainerSKUSelect[i].cusname      ;
            qryWareOrderInSKU.Fieldbyname('shippercusid').asstring    :=TContainerSKUSelect[i].shippercusid ;
            qryWareOrderInSKU.Fieldbyname('shippercusname').asstring  :=TContainerSKUSelect[i].shippercusname  ;
//              qryWareOrderInSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderInSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
            qryWareOrderInSKU.Fieldbyname('contwithloca').asstring     :=TContainerSKUSelect[i].contwithloca   ;
            qryWareOrderInSKU.Fieldbyname('lottracked').asstring       :=TContainerSKUSelect[i].lottracked     ;
            qryWareOrderInSKU.Fieldbyname('skucost').asFloat             :=TContainerSKUSelect[i].skucost          ;
            qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=TContainerSKUSelect[i].currcd  ;
            qryWareOrderInSKU.fieldbyname('price').asFloat        :=TContainerSKUSelect[i].price     ;
            qryWareOrderInSKU.fieldbyname('costuomtype').asstring     :=TContainerSKUSelect[i].costuomtype   ;
            qryWareOrderInSKU.Fieldbyname('jobnoin').asstring            :=TContainerSKUSelect[i].jobnoin  ;
            qryWareOrderInSKU.fieldbyname('snoin').asInteger             :=TContainerSKUSelect[i].snoin    ;
            qryWareOrderInSKU.fieldbyname('ldsnoin').asInteger          :=TContainerSKUSelect[i].ldsnoin  ;
            qryWareOrderInSKU.Fieldbyname('jobnoinf').asstring          :=TContainerSKUSelect[i].jobnoinf  ;
            qryWareOrderInSKU.fieldbyname('snoinf').asInteger           :=TContainerSKUSelect[i].snoinf    ;
            qryWareOrderInSKU.fieldbyname('ldsnoinf').asInteger        :=TContainerSKUSelect[i].ldsnoinf    ;
            qryWareOrderInSKU.fieldbyname('CustomsNO').asstring           :=TContainerSKUSelect[i].CustomsNO ;
            qryWareOrderInSKU.fieldbyname('LocationBillNO').asstring      :=TContainerSKUSelect[i].LocationBillNO ;
            qryWareOrderInSKU.Fieldbyname('WO_TagEach').asstring          :=TContainerSKUSelect[i].WO_TagEach   ;
            qryWareOrderInSKU.Fieldbyname('TagEachUOM').asstring          :=TContainerSKUSelect[i].TagEachUOM     ;
            qryWareOrderInSKU.Fieldbyname('isbond').asstring:=TContainerSKUSelect[i].isbond   ;
            qryWareOrderInSKU.Fieldbyname('countrent').asstring        :=TContainerSKUSelect[i].countrent     ;
            qryWareOrderInSKU.Fieldbyname('countcontcost').asstring    :=TContainerSKUSelect[i].countcontcost   ;
            qryWareOrderInSKU.Fieldbyname('warerentcounttype').asstring   :=TContainerSKUSelect[i].warerentcounttype     ;
            qryWareOrderInSKU.Fieldbyname('WO_CCAID').asstring            :=TContainerSKUSelect[i].costcusid ;
            qryWareOrderInSKU.Fieldbyname('loadcostone').asstring      :=TContainerSKUSelect[i].loadcostone ;
            qryWareOrderInSKU.Fieldbyname('skucostclasscd').asString      :=TContainerSKUSelect[i].skucostclasscd;
            qryWareOrderInSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TContainerSKUSelect[i].syquantity;
            qryWareOrderInSKU.Fieldbyname('TK_Jobno').AsString            :=TContainerSKUSelect[i].Jobno;
            qryWareOrderInSKU.Fieldbyname('TK_sno').asInteger             :=TContainerSKUSelect[i].sno;
         end;
       end;
     end; wql_new}
end;

procedure TfrmWareOrderIn.edtQuantityEnter(Sender: TObject);
begin
{   if (strINOUT='O') and (qryWareOrderInSKU.FieldByName('customsunite').asstring='T') then
      TdxDBCalcEdit(sender).ReadOnly:=True
   else
      TdxDBCalcEdit(sender).ReadOnly:=False;}
end;

procedure TfrmWareOrderIn.cmbQualityNameEnter(Sender: TObject);
begin
   if (strINOUT='O') then
      TdxDBButtonEdit(sender).ReadOnly:=True
   else
      TdxDBButtonEdit(sender).ReadOnly:=False;
end;

procedure TfrmWareOrderIn.ckbIsbondClick(Sender: TObject);
begin
  if qryWareOrderInEdit.FieldByName('Customsunite').asstring='T' then
    qryWareOrderInEdit.FieldByName('isbond').asstring:='T';
end;

procedure TfrmWareOrderIn.mitInputModalClick(Sender: TObject);
var
  ComJobno:string;
begin
  if  mitInputModal.Checked then
  begin
    ComJobno:=qryWareOrderIn.FieldByName('Jobno').AsString;
    strINOUTsql:=qryWareOrderIn.SQL.Text;
    strINOUTWhere:=qryWareOrderIn.MacroByName('Where').AsString;
    qryWareOrderIn.Close;
    strSql:=' select jobno,orderid,operationtype,userid,username,mainorder,originorder,'+chr(13)+chr(10)
           +'        destorder,orderdate=convert(varchar(10),orderdate,102),uploaddate=convert(varchar(10),uploaddate,102), '+chr(13)+chr(10)
           +'        actualdate,origincusid,origincusname,'+chr(13)+chr(10)
           +'        destcusid,destcusname,cusid,cusname,shippercusid,'+chr(13)+chr(10)
           +'        shippercusname,loadtype,warerentcounttype,warerentcounttypeOut,'+chr(13)+chr(10)
           +'        createname,createdate,modifyname,modifydate,carriercusid,carriercusname,'+chr(13)+chr(10)
           +'        shipcusid,shipcusname,carbrand,carriername,carrierno,carrierdate,'+chr(13)+chr(10)
           +'        blno,conno,routing,skuname,pieceuom,weightuom,'+chr(13)+chr(10)
           +'        volumeuom,areauom,piece,netweight,grossweight,volume,area,quantity,'+chr(13)+chr(10)
           +'        contwithloca,lottracked,checkname,checkdate,isbond,countrent,countcontcost,'+chr(13)+chr(10)
           +'        costcusid,costcusname,disaccord,remark,skucostclasscd,quantityuom,skucost,'+chr(13)+chr(10)
           +'        conquantity,condes,customsno,customsunite,jobnoin,cusbillno,costopid,costopname,'+chr(13)+chr(10)
           +'        kinnproject,dictatetype,costratetype,quantityori,skunameori,costcusidout,'+chr(13)+chr(10)
           +'        costcusnameout,countrentout,jobnoori,loadcosttype,'+chr(13)+chr(10)
           +'        OrderStatus=case when isnull(WareOrder.OrderStatus,"H")="H" then "等待" '+chr(13)+chr(10)
           +'                         when isnull(WareOrder.OrderStatus,"H")="R" then "执行" '+chr(13)+chr(10)
           +'                         else "完成" end,INPUTED="N", '+chr(13)+chr(10)
           +'        Tasked=case when DictateType="进仓指令" then (case when (select count(1) '+chr(13)+chr(10)
           +'                                                        from Locationinitem  task (nolock)'+chr(13)+chr(10)
           +'                                                       where task.jobnoorder=WareOrder.Jobno )>0 then "√" else "" end) '+chr(13)+chr(10)
           +'                                                else (case when (select count(1) '+chr(13)+chr(10)
           +'                                                        from Locationoutitem  task (nolock)'+chr(13)+chr(10)
           +'                                                       where task.jobnoorder=WareOrder.Jobno )>0 then "√" else "" end) end, '+chr(13)+chr(10)
           +'        INPUTED=case when exists(select 1 from wareordersku  '+chr(13)+chr(10)
           +'                                 where wareordersku.jobno=wareorder.jobno '+chr(13)+chr(10)
           +'                                ) then "Y" '+chr(13)+chr(10)
           +'                    when isnull(WareOrder.customsunite,"F")="T" then "T" '+chr(13)+chr(10)
           +'                    else "N" end, '+chr(13)+chr(10)
           +'        keyid=WareOrder.JOBNO,pieceori,piecesl=pieceori-piece '+chr(13)+chr(10)
           +'  from WareOrder  '+chr(13)+chr(10)
           +' where 1=1'+chr(13)+chr(10)
           //过滤模式
//wql_new              +iif(_Filter_Completed='T',' and rtrim(isnull(WareOrder.CheckName,""))=""','')
           //是否场装
           +'   and %where'+chr(13)+chr(10)
           +iif(trim(strJobno)='','',' and WareOrder.jobno="'+strJobno+'" ');
    qryWareOrderIn.Sql.Clear;
    qryWareOrderIn.Sql.Add(strSql);
    qryWareOrderIn.MacroByName('Where').AsString:=strINOUTWhere;
  end else
  begin
    ComJobno:=qryWareOrderIn.FieldByName('Jobno').AsString;
    qryWareOrderIn.Sql.Clear;
    qryWareOrderIn.Sql.Add(strINOUTsql);
    qryWareOrderIn.MacroByName('Where').AsString:=strINOUTWhere;
  end;
  qryWareOrderIn.DisableControls;
  qryWareOrderIn.Open;
  try
    qryWareOrderIn.Locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);
  except
    qryWareOrderIn.Last;
  end;
  qryWareOrderIn.EnableControls;

  grdWareOrderChangeNodeEx(nil);
  SetDetailActive(False,False);
  SetDetailActive(True,True);
  WorkCall(stBrowse);
end;

procedure TfrmWareOrderIn.grdWareOrderCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;

   if not varisnull(ANode.Values[checkskued.Index]) and (ANode.Values[checkskued.Index]='√') then
   begin
      AColor :=clSkyBlue;
      if (not varisnull(ANode.Values[quantity.Index]) and (ANode.Values[quantity.Index]<>0) and
          (ANode.Values[quantity.Index]<ANode.Values[QuantityOri.Index])) then
        AFont.Color  := clRed;
   end;
//是否保税颜色控制
   if (ANode.Values[Isbond.Index]='√') then
      AFont.Color:=clRed ;
   if trim(ANode.Values[checkname.Index])<>'' then
      AColor := $00C1DBC1;
//dwq20051019 已下任务颜色控制
   if ANode.Values[Tasked.Index]='√' then
      AColor :=$00E7E1E8;
  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;
end;

procedure TfrmWareOrderIn.pcInfoChange(Sender: TObject);
begin
  if qryWareOrderIn.active then SetDetailActive(True,True);
end;

procedure TfrmWareOrderIn.cmbSKUNameDblClick(Sender: TObject);
begin
   if (strINOUT='I') and (DataState=stBrowse) and (qryWareOrderInSKU.FieldByName('SkuId').AsString<>'') then
   begin
      with WorkChangeSkuName(qryWareOrderInSKU.FieldByName('SkuId').AsString) do
      if OkFlag then
      btnRefreshClick(self);
   end;
end;

procedure TfrmWareOrderIn.grdOriSKUChangeNodeEx(Sender: TObject);
begin
  if grdOriSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdOriSKUBeforeInsert;
  end;
end;

procedure TfrmWareOrderIn.grdOriSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin

  if not (DataState in Setdcs)  then
    Allow:=False
  else
  begin
    qryWareOrderInSKU.first;
    if (qryWareOrderInSKU.RecordCount>0) then
    begin
//      Kmessagedlg('校验指令已生成,无法删改!', mtWarning, [mbOK], 0);
      Allow:=False
    end else
    Allow:=True;
  end;
end;

procedure TfrmWareOrderIn.grdOriSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (qryWareOrderInOriSKU.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddOriSKUClick(Sender);
  end;
end;

procedure TfrmWareOrderIn.mitAddOriSKUClick(Sender: TObject);
begin
  qryWareOrderInOriSKU.Append;
  grdOriSKU.SetFocus;
  grdOriSKUBeforeInsert;
end;

procedure TfrmWareOrderIn.grdOriSKUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with TdxDBGrid(Sender) do
  begin
    if DataState in Setdcs then
    begin
      if State<>tsEditing then
      begin
        if (Key = VK_RETURN) and (ssCtrl in Shift)
          and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridButtonColumn) then
        begin
          ShowEditor;
          TdxDBGridButtonColumn(Columns[GetFocusedAbsoluteIndex(FocusedColumn)]).OnButtonClick(Sender,GetFocusedAbsoluteIndex(FocusedColumn));
          Key:=0;
        end else
        if (Key = VK_DOWN) and (ssAlt in Shift)
          and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridPickColumn) then
        begin
          ShowEditor;
          TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
          key:=0;
        end;
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        if Name='grdOriSKU' then
          mitAddOriSKUclick(sender)
        else
          mitAddSKUClick(sender);
        key:=0;
      end;
    end;
  end;
end;

procedure TfrmWareOrderIn.grdSKUChangeNodeEx(Sender: TObject);
begin
  if grdSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdSKUBeforeInsert;
  end;
   qryWareorderInSkuDetail.Filtered:=false;
   if qryWareOrderInSKU.fieldbyname('sno').AsString<>'' then
      qryWareorderInSkuDetail.filter:='sno='+qryWareOrderInSKU.fieldbyname('sno').AsString
   else
      qryWareorderInSkuDetail.filter:='sno=-1';
   qryWareorderInSkuDetail.Filtered:=true;
end;

procedure TfrmWareOrderIn.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then
     Allow:=False else
  begin
  //指令与任务数不等时,可修改,在修改时判断是指令数是否大于任务数
    if (_DB_Order<>'T') and (qryWareOrderInSKU.FieldByName('Quantitytask').AsFloat<>0) then
       Allow:=False
    else if (_DB_Order='T') and (qryWareOrderInSKU.FieldByName('Quantitytask').AsFloat<>0) and 
       (qryWareOrderInSKU.FieldByName('Quantitytask').AsFloat=qryWareOrderInSKU.FieldByName('Quantity').AsFloat) then //<>0
       Allow:=False
    else
       Allow:=True;
  end;
end;

procedure TfrmWareOrderIn.grdSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (qryWareOrderInSKU.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddSKUClick(Sender);
  end;
end;

procedure TfrmWareOrderIn.mitDelOriSKUClick(Sender: TObject);
begin
  qryWareOrderInSKU.first;
  if (qryWareOrderInSKU.recordcount>0) then
  begin
    {if _Language='CAPTIONC' then
       _strmessage:='校验指令已生成,无法删改!'
    else
        _strmessage:='**************';}
    Kmessagedlg(GetMessage('frmWareOrderDxALL','028'), mtWarning, [mbOK], 0);
    exit;
  end else
  if qryWareOrderInOriSKU.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    qryWareOrderInOriSKU.Delete;
    grdOriSKU.SetFocus;
  end;
end;

procedure TfrmWareOrderIn.grdOriSKUBeforeInsert;
begin
  grdOriSKU.FocusedColumn:=0;
 { qryWareOrderInOriSKU.Fieldbyname('SNO').AsFloat  :=-1;

  qryWareOrderInOriSKU.fieldByname('JOBNO').AsString:=qryWareOrderInEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderInOriSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderInOriSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderInOriSKU.fieldByname('locid').AsString:='';
  qryWareOrderInOriSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderInOriSKU.fieldByname('QualityName').AsString:='正品';
  qryWareOrderInOriSKU.fieldByname('operationtype').AsInteger:=iif(strInOut='I',1,-1);
  qryWareOrderInOriSKU.fieldByname('CustomsNO').AsString:=qryWareOrderInEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderInOriSKU.fieldByname('cusid').AsString         :=iif(data.WareOrder_copyCusID='',data.WareOrder_strOrderCusID,data.WareOrder_copyCusID);
  qryWareOrderInOriSKU.fieldByname('cusname').AsString       :=iif(data.WareOrder_copyCusName='',data.WareOrder_strOrderCusName,data.WareOrder_copyCusName);
  qryWareOrderInOriSKU.fieldByname('shippercusid').AsString  :=iif(data.WareOrder_Copyshippercusid='',data.WareOrder_strOrderShippercusid,data.WareOrder_Copyshippercusid);
  qryWareOrderInOriSKU.fieldByname('shippercusname').AsString:=iif(data.WareOrder_Copyshippercusname='',data.WareOrder_strOrderShippercusname,data.WareOrder_Copyshippercusname);

  qryWareOrderInOriSKU.fieldByname('OrderStatus').AsString:=qryWareOrderInEdit.fieldByname('OrderStatus').AsString;
  qryWareOrderInOriSKU.fieldByname('NotFullSign').AsString:='F';
  }
end;

procedure TfrmWareOrderIn.grdSKUBeforeInsert;
begin
  grdSKU.FocusedColumn:=0;
  qryWareOrderInSKU.Fieldbyname('SNO').AsFloat  :=-1;

end;


procedure TfrmWareOrderIn.edtshippercusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInOriSKU.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
    if DataState in Setdcs then
    begin
       if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
       begin
         ActiveControl:=edtCostcusid;
         {if _Language='CAPTIONC' then
            _strmessage:='费用关系人不能为空，必须填写！'
         else
             _strmessage:='**************';}
         KMessageDlg(GetMessage('frmWareOrderDxALL','003'),mtWarning,[mbOK],0);
         Exit;
       end;

       qrySelect:=PGetSKUSelect('','','D');
       qrySelect.First;
       i:=0;
       while not qrySelect.Eof do
       begin
          if i=0 then
          begin
             qryWareOrderInOriSKU.edit;
             qryWareOrderInEdit.Edit;
             qryWareOrderInEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
             qryWareOrderInEdit.fieldbyname('Quantity').AsFloat        :=qryselect.fieldbyname('Quantity_set').AsFloat;
             qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
          end else
          begin
             try
                qryWareOrderInOriSKUBeforePost(qryWareOrderInOriSKU);
             except
                break;
             end;
             qryWareOrderInOriSKU.append;
             qryWareOrderInOriSKU.fieldbyname('sno').Asinteger:=-1;
             qryWareOrderInOriSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
             qryWareOrderInOriSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
          end;
          qryWareOrderInOriSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
          qryWareOrderInOriSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
          strGetCd := qryselect.fieldbyname('SKUName').asstring;
          if qryselect.Fieldbyname('LotCode').asstring<>'' then
            qryWareOrderInOriSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
          if qryselect.fieldbyname('Quantity').AsFloat<>0 then
            qryWareOrderInOriSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
          if qryselect.Fieldbyname('QualityName').asstring<>'' then
            qryWareOrderInOriSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring;
          qryWareOrderInOriSKU.fieldbyname('QuantityUOM').asstring            :=qryselect.fieldbyname('QuantityUOM').asstring;
          qryWareOrderInOriSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring;
          qryWareOrderInOriSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring;
          qryWareOrderInOriSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring;
          qryWareOrderInOriSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring;
          if qryWareOrderInOriSKU.fieldByname('cusid').AsString='' then
            qryWareOrderInOriSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInOriSKU.fieldByname('cusname').AsString='' then
            qryWareOrderInOriSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
          if qryWareOrderInOriSKU.fieldByname('shippercusid').AsString='' then
            qryWareOrderInOriSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderInOriSKU.fieldByname('shippercusname').AsString='' then
            qryWareOrderInOriSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
//wql_05/05/10 gather中统一赋值 if qryWareOrderInOriSKU.fieldByname('costcusid').AsString='' then
//wql_05/05/10 gather中统一赋值      qryWareOrderInOriSKU.fieldByname('costcusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
//wql_05/05/10 gather中统一赋值         if qryWareOrderInOriSKU.fieldByname('costcusname').AsString='' then
            qryWareOrderInOriSKU.fieldByname('costcusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

          qryWareOrderInOriSKU.fieldbyname('TagEachUOM').Asstring          :='';

          qryWareOrderInOriSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
          if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
             qryWareOrderInOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
          else
             qryWareOrderInOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
 //wql_new          qryWareOrderInOriSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
 //wql_new          qryWareOrderInOriSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
 //wql_new          qryWareOrderInOriSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
          qryWareOrderInOriSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
          qryWareOrderInOriSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
          qryWareOrderInOriSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
          qryWareOrderInOriSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
          qryWareOrderInOriSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
          qryWareOrderInOriSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;

          qryWareOrderInOriSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
          qryWareOrderInOriSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
          qryWareOrderInOriSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
          qryWareOrderInOriSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

          OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                +'  from skuprice '
                                +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                +'   and uomtype="'+qryWareOrderInOriSKU.fieldbyname('CostUOMType').AsString+'"'
                                +'   and userid like "'+_userid+'%"'
                 );
          qryWareOrderInOriSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
          qryWareOrderInOriSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
          qryWareOrderInOriSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
          qryWareOrderInOriSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
          qryWareOrderInOriSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;

          qrySelect.Next;
          Inc(i);
       end;
    end;
end;

procedure TfrmWareOrderIn.edtSKUCusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInSKU.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.edtSKUShippercusidButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInSKU.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.edtSKUSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
   if DataState in Setdcs then
   begin
     if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
     begin
       ActiveControl:=edtCostcusid;
       {if _Language='CAPTIONC' then
          _strmessage:='费用关系人不能为空，必须填写！'
       else
           _strmessage:='**************';}
       KMessageDlg(GetMessage('frmWareOrderDxALL','003'),mtWarning,[mbOK],0);
       Exit;
     end;

     qrySelect:=PGetSKUSelect('','','D');
     qrySelect.First;
     i:=0;
     while not qrySelect.Eof do
     begin
         if i=0 then
         begin
           qryWareOrderInSKU.edit;
           qryWareOrderInEdit.Edit;
           qryWareOrderInEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
           qryWareOrderInEdit.fieldbyname('Quantity').AsFloat        :=qryselect.fieldbyname('Quantity_set').AsFloat;
           qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
         end else
         begin
           try qryWareOrderInSKUBeforePost(qryWareOrderInSKU);
           except break;
           end;
           qryWareOrderInSKU.append;
           qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
           qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
           qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
         end;
         qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
         qryWareOrderInSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
         strGetCd := qryselect.fieldbyname('SKUName').asstring;;
         if qryselect.Fieldbyname('LotCode').asstring<>'' then
           qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
         if qryselect.fieldbyname('Quantity').AsFloat<>0 then
           qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
         if qryselect.Fieldbyname('QualityName').asstring<>'' then
           qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring      ;
         qryWareOrderInSKU.fieldbyname('QuantityUOM').asstring           :=qryselect.fieldbyname('QuantityUOM').asstring         ;
         qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring         ;
         qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring        ;
         qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring        ;
         qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring          ;
         if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
           qryWareOrderInSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
         if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
           qryWareOrderInSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
         if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
           qryWareOrderInSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
         if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
           qryWareOrderInSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
//wql_05/05/10 gather中统一赋值          if qryWareOrderInSKU.fieldByname('costcusid').AsString='' then
//wql_05/05/10 gather中统一赋值            qryWareOrderInSKU.fieldByname('costcusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
//wql_05/05/10 gather中统一赋值          if qryWareOrderInSKU.fieldByname('costcusname').AsString='' then
//wql_05/05/10 gather中统一赋值            qryWareOrderInSKU.fieldByname('costcusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

         qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring          :='';

         qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
         if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
            qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
         else
            qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
//          qryWareOrderInSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
//          qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
//          qryWareOrderInSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
         qryWareOrderInSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
         qryWareOrderInSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;
         qryWareOrderInSKU.fieldByname('NotFullSign').AsString:='F';

         qryWareOrderInSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
         qryWareOrderInSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
         qryWareOrderInSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
         qryWareOrderInSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

         OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                               +'  from skuprice '
                               +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                               +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                               +'   and uomtype="'+qryWareOrderInSKU.fieldbyname('CostUOMType').AsString+'"'
                               +'   and userid like "'+_userid+'%"'
                );
         qryWareOrderInSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
         qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
         qryWareOrderInSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
         qryWareOrderInSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
         qrySelect.Next;
         Inc(i);
       end;
     end;
end;

procedure TfrmWareOrderIn.btnRateClick(Sender: TObject);
var
  i,j:integer;
  intCheckQuantity,inicheckpiece,inicheckgrossweight,inichecknetweight,inicheckvolume,inicheckcostquantity,inicheckarea:extended;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
  strIsbond:string;
  strwhsql:string;
begin
  if qryWareOrderInOriSKU.RecordCount=0 then
     exit;
  if qryWareOrderInSKU.RecordCount<>0 then
  begin
     if KmessageDlg(GetMessage('frmWareOrderDxALL','030'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//iif(_language='CAPTIONC','已有商品信息，重新校验将删除已有商品信息，确定重新校验吗？','')
     begin
        qryWareOrderInSKU.DisableControls;
        qryWareOrderInSKU.First;
        while not qryWareOrderInSKU.Eof do
        begin
           qryWareOrderInSKU.Delete;
        end;
        qryWareOrderInSKU.EnableControls;
     end else exit;
  end;
  grdOriSKU.SelectAll;

  for j:=0 to (grdOriSKU.SelectedCount-1) do
  begin
    qryWareOrderInOriSKU.GotoBookmark(pointer(grdOriSKU.SelectedRows[j]));
    qryWareOrderInSKU.Append;
      if (_verify) and (strskuid<>'') then
         begin
              qryWareOrderInSKU.FieldByName('SKUID').AsString           :=strskuid;
              qryWareOrderInSKU.FieldByName('skuname').AsString         :=strskuname;
         end else
      if qryWareOrderInOriSKU.FieldByName('SKUID').AsString='' then
      begin
        OpenSql(dataTmp.qryTmp,' select top 1 * from  sku where skuname="'+qryWareOrderInOriSKU.FieldByName('skuname').AsString+'" ' );
        if dataTmp.qryTmp.FieldByName('SKUID').AsString<>''  then
        begin
           qryWareOrderInSKU.FieldByName('SKUID').AsString           :=dataTmp.qryTmp.fieldbyname('SKUID').AsString;
           qryWareOrderInSKU.FieldByName('skuname').AsString         :=dataTmp.qryTmp.fieldbyname('skuname').AsString;
        end else
        begin
           qrySelect:=pGetSkuSelect('','','D');
           qrySelect.First;
           i:=0;
           while not qrySelect.Eof do
           begin
              if i=0 then
              begin
                 qryWareOrderInEdit.Edit;
                 qryWareOrderInEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
                 qryWareOrderInEdit.fieldbyname('Quantity').AsFloat        :=qryselect.fieldbyname('Quantity_set').AsFloat;
                 qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
              end else
              begin
                 qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
                 qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
                 qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
              end;
              strskuid:=qryselect.fieldbyname('skuid').AsString;
              strskuname:=qryselect.fieldbyname('skuname').asstring;
              qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
              qryWareOrderInSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
              strGetCd := qryselect.fieldbyname('SKUName').asstring;
              if qryselect.Fieldbyname('LotCode').asstring<>'' then
                qryWareOrderInSKU.Fieldbyname('LotCode').asstring           :=qryselect.Fieldbyname('LotCode').asstring;
              if qryselect.fieldbyname('Quantity').AsFloat<>0 then
                qryWareOrderInSKU.fieldbyname('Quantity').AsFloat           :=qryselect.fieldbyname('Quantity').AsFloat;
              if qryselect.Fieldbyname('QualityName').asstring<>'' then
                qryWareOrderInSKU.fieldbyname('QualityName').asstring       :=qryselect.Fieldbyname('QualityName').asstring;
              qryWareOrderInSKU.fieldbyname('QuantityUOM').asstring:=qryselect.fieldbyname('QuantityUOM').asstring;
              qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring;
              qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring;
              qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring;
              qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring;
              if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
                qryWareOrderInSKU.fieldByname('cusid').AsString             :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
              if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
                qryWareOrderInSKU.fieldByname('cusname').AsString           :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
              if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
                qryWareOrderInSKU.fieldByname('shippercusid').AsString      :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
              if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
                qryWareOrderInSKU.fieldByname('shippercusname').AsString    :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
//wql_05/05/10 gather中统一赋值              if qryWareOrderInSKU.fieldByname('costcusid').AsString='' then
//wql_05/05/10 gather中统一赋值                qryWareOrderInSKU.fieldByname('costcusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
//wql_05/05/10 gather中统一赋值              if qryWareOrderInSKU.fieldByname('costcusname').AsString='' then
//wql_05/05/10 gather中统一赋值                qryWareOrderInSKU.fieldByname('costcusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

              qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring   :=qrySelect.fieldbyname('TagEachUOM').AsString;
              qryWareOrderInSKU.fieldbyname('NotFullSign').Asstring  :='F';

              qryWareOrderInSKU.Fieldbyname('pro1').AsFloat          :=qryselect.fieldbyname('Pro1').AsFloat;
              qryWareOrderInSKU.Fieldbyname('pro2').AsFloat          :=qryselect.fieldbyname('Pro2').AsFloat;
              qryWareOrderInSKU.Fieldbyname('pro3').AsFloat          :=qryselect.fieldbyname('Pro3').AsFloat;
              qryWareOrderInSKU.Fieldbyname('pro4').AsFloat          :=qryselect.fieldbyname('Pro4').AsFloat;
              qryWareOrderInSKU.Fieldbyname('pro5').AsFloat          :=qryselect.fieldbyname('Pro5').AsFloat;
              qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat      :=qryselect.fieldbyname('PiecePro').AsFloat;
              qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat     :=qryselect.fieldbyname('volumePro').AsFloat;
              qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat       :=qryselect.fieldbyname('AreaPro').AsFloat;
              qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat  :=qryselect.fieldbyname('weightPro').AsFloat;
              if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
                 qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
              else
                 qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('weightPro').AsFloat;
//wq;l_new              qryWareOrderInSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
//wql_new              qryWareOrderInSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
//wql_new              qryWareOrderInSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
              qryWareOrderInSKU.FieldByName('Depth').AsFloat          :=qryselect.fieldbyname('Depth').AsFloat;
              qryWareOrderInSKU.FieldByName('Width').AsFloat          :=qryselect.fieldbyname('Width').AsFloat;
              qryWareOrderInSKU.FieldByName('Height').AsFloat         :=qryselect.fieldbyname('Height').AsFloat;
              qryWareOrderInSKU.FieldByName('OrderStatus').Asstring:='H';

              qryWareOrderInSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
              qryWareOrderInSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
              qryWareOrderInSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
              qryWareOrderInSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

              OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                    +'  from skuprice '
                                    +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                    +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                    +'   and uomtype="'+qryWareOrderInSKU.fieldbyname('CostUOMType').AsString+'"'
                                    +'   and userid like "'+_userid+'%"'
                     );
              qryWareOrderInSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
              qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
              qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
              qryWareOrderInSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
              qryWareOrderInSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
              qrySelect.Next;
              Inc(i);
           end;
        end;
      end else
      begin
        qryWareOrderInSKU.FieldByName('SKUID').AsString         :=qryWareOrderInOriSKU.fieldbyname('SKUID').AsString;
        qryWareOrderInSKU.FieldByName('skuname').AsString       :=qryWareOrderInOriSKU.fieldbyname('skuname').AsString;
      end;
      qryWareOrderInSKU.fieldbyname('sno').Asinteger            :=-1;
      qryWareOrderInSKU.fieldByname('jobno').AsString           :=qryWareOrderInEdit.fieldbyname('jobno').AsString;
      qryWareOrderInSKU.fieldByname('userid').AsString          :=qryWareOrderInEdit.fieldbyname('userid').AsString;
      qryWareOrderInSKU.FieldByName('jobnoin').AsString         :=qryWareOrderInOriSKU.FieldByName('jobnoin').AsString;
      qryWareOrderInSKU.FieldByName('snoin').AsInteger          :=qryWareOrderInOriSKU.FieldByName('snoin').AsInteger;
      qryWareOrderInSKU.FieldByName('ldsnoin').AsInteger        :=qryWareOrderInOriSKU.FieldByName('ldsnoin').AsInteger;
      qryWareOrderInSKU.FieldByName('jobnoinf').AsString        :=qryWareOrderInOriSKU.FieldByName('jobnoinf').AsString;
      qryWareOrderInSKU.FieldByName('snoinf').AsInteger         :=qryWareOrderInOriSKU.FieldByName('snoinf').AsInteger;
      qryWareOrderInSKU.FieldByName('ldsnoinf').AsInteger       :=qryWareOrderInOriSKU.FieldByName('ldsnoinf').AsInteger;
      qryWareOrderInSKU.Fieldbyname('jobnoori').asstring        :=qryWareOrderInOriSKU.fieldbyname('jobnoori').AsString;
      qryWareOrderInSKU.fieldbyname('snoori').asInteger         :=qryWareOrderInOriSKU.fieldbyname('snoori').asInteger;
      qryWareOrderInSKU.Fieldbyname('jobnoine').asstring        :=qryWareOrderInOriSKU.fieldbyname('jobnoin').AsString;
      qryWareOrderInSKU.fieldbyname('snoine').asInteger         :=qryWareOrderInOriSKU.fieldbyname('snoin').asInteger;
      qryWareOrderInSKU.fieldbyname('jobnoindp').asstring       :=qryWareOrderInOriSKU.fieldbyname('jobnoindp').AsString;
      qryWareOrderInSKU.fieldbyname('jobnooridp').asstring      :=qryWareOrderInOriSKU.fieldbyname('jobnooridp').AsString;

      qryWareOrderInSKU.FieldByName('QualityName').AsString     :=qryWareOrderInOriSKU.FieldByName('QualityName').AsString ;
      qryWareOrderInSKU.FieldByName('QUANTITYUOM').AsString     :=qryWareOrderInOriSKU.FieldByName('QUANTITYUOM').AsString;
      qryWareOrderInSKU.FieldByName('PieceUOM').AsString        :=qryWareOrderInOriSKU.FieldByName('PieceUOM').AsString;
      qryWareOrderInSKU.FieldByName('WeightUOM').AsString       :=qryWareOrderInOriSKU.FieldByName('WeightUOM').AsString;
      qryWareOrderInSKU.FieldByName('VolumeUOM').AsString       :=qryWareOrderInOriSKU.FieldByName('VolumeUOM').AsString;
      qryWareOrderInSKU.FieldByName('AreaUOM').AsString         :=qryWareOrderInOriSKU.FieldByName('AreaUOM').AsString;
      qryWareOrderInSKU.Fieldbyname('costquantityuom').asstring :=qryWareOrderInOriSKU.fieldbyname('costquantityuom').AsString;
      qryWareOrderInSKU.FieldByName('uom1').AsString            :=qryWareOrderInOriSKU.FieldByName('uom1').AsString;
      qryWareOrderInSKU.FieldByName('uom2').AsString            :=qryWareOrderInOriSKU.FieldByName('uom2').AsString;
      qryWareOrderInSKU.FieldByName('uom3').AsString            :=qryWareOrderInOriSKU.FieldByName('uom3').AsString;
      qryWareOrderInSKU.FieldByName('uom4').AsString            :=qryWareOrderInOriSKU.FieldByName('uom4').AsString;
      qryWareOrderInSKU.FieldByName('uom5').AsString            :=qryWareOrderInOriSKU.FieldByName('uom5').AsString;
      qryWareOrderInSKU.FieldByName('SizeUOM').AsString         :=qryWareOrderInOriSKU.FieldByName('SizeUOM').AsString;
      qryWareOrderInSKU.FieldByName('Piece').AsFloat            :=qryWareOrderInOriSKU.FieldByName('Piece').AsFloat;
      qryWareOrderInSKU.FieldByName('Quantity').AsFloat         :=qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
      qryWareOrderInSKU.FieldByName('NetWeight').AsFloat        :=qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat;
      qryWareOrderInSKU.FieldByName('GrossWeight').AsFloat      :=qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat;
      qryWareOrderInSKU.FieldByName('Volume').AsFloat           :=qryWareOrderInOriSKU.FieldByName('Volume').AsFloat;
      qryWareOrderInSKU.FieldByName('Area').AsFloat             :=qryWareOrderInOriSKU.FieldByName('Area').AsFloat;
      qryWareOrderInSKU.Fieldbyname('Costquantity').asFloat     :=qryWareOrderInOriSKU.fieldbyname('Costquantity').AsFloat;

      qryWareOrderInSKU.FieldByName('casing1').AsFloat          :=qryWareOrderInOriSKU.FieldByName('casing1').AsFloat;
      qryWareOrderInSKU.FieldByName('casing2').AsFloat          :=qryWareOrderInOriSKU.FieldByName('casing2').AsFloat;
      qryWareOrderInSKU.FieldByName('casing3').AsFloat          :=qryWareOrderInOriSKU.FieldByName('casing3').AsFloat;
      qryWareOrderInSKU.FieldByName('casing4').AsFloat          :=qryWareOrderInOriSKU.FieldByName('casing4').AsFloat;
      qryWareOrderInSKU.FieldByName('casing5').AsFloat          :=qryWareOrderInOriSKU.FieldByName('casing5').AsFloat;
      qryWareOrderInSKU.FieldByName('Depth').AsFloat            :=qryWareOrderInOriSKU.FieldByName('Depth').AsFloat;
      qryWareOrderInSKU.FieldByName('Width').AsFloat            :=qryWareOrderInOriSKU.FieldByName('Width').AsFloat;
      qryWareOrderInSKU.FieldByName('Height').AsFloat           :=qryWareOrderInOriSKU.FieldByName('Height').AsFloat;
      qryWareOrderInSKU.FieldByName('cusid').AsString           :=qryWareOrderInOriSKU.FieldByName('cusid').AsString;
      qryWareOrderInSKU.FieldByName('cusname').AsString         :=qryWareOrderInOriSKU.FieldByName('cusname').AsString;
      qryWareOrderInSKU.FieldByName('shippercusid').AsString    :=qryWareOrderInOriSKU.FieldByName('shippercusid').AsString;
      qryWareOrderInSKU.FieldByName('shippercusname').AsString  :=qryWareOrderInOriSKU.FieldByName('shippercusname').AsString;
      qryWareOrderInSKU.Fieldbyname('shipcusid').asstring       :=qryWareOrderInOriSKU.fieldbyname('shipcusid').AsString;
      qryWareOrderInSKU.Fieldbyname('shipcusname').asstring     :=qryWareOrderInOriSKU.fieldbyname('shipcusname').AsString;
      qryWareOrderInSKU.FieldByName('costcusid').AsString       :=qryWareOrderInOriSKU.FieldByName('costcusid').AsString;
      qryWareOrderInSKU.FieldByName('costcusname').AsString     :=qryWareOrderInOriSKU.FieldByName('costcusname').AsString;

      qryWareOrderInSKU.fieldbyname('CustomsNO').asstring       :=qryWareOrderInOriSKU.fieldbyname('CustomsNO').asstring ;
      qryWareOrderInSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderInOriSKU.fieldbyname('CustomsNOin').asstring ;
      qryWareOrderInSKU.fieldbyname('WO_CCAID').asstring        :=qryWareOrderInOriSKU.FieldByName('costcusid').AsString;
      qryWareOrderInSKU.Fieldbyname('WO_CCAname').asstring      :=qryWareOrderInOriSKU.fieldbyname('costcusname').AsString;
      qryWareOrderInSKU.Fieldbyname('skucost').asFloat          :=qryWareOrderInOriSKU.fieldbyname('skucost').asFloat ;
      qryWareOrderInSKU.Fieldbyname('currcd').asstring          :=qryWareOrderInOriSKU.fieldbyname('currcd').asstring ;
      qryWareOrderInSKU.fieldbyname('price').asFloat            :=qryWareOrderInOriSKU.fieldbyname('price').asFloat ;
      qryWareOrderInSKU.FieldByName('TagEachUOM').Asstring      :=qryWareOrderInOriSKU.fieldbyname('TagEachUOM').asstring ;
      qryWareOrderInSKU.FieldByName('locid').Asstring           :=qryWareOrderInOriSKU.fieldbyname('locid').asstring ;
      //判断批次是否有重复

      opensql(dataTmp.qryTmp,'select lotnum=count(1)'
                            +'  from locationinitem(nolock) '
                            +' where lotcode="'+qryWareOrderInOriSKU.FieldByName('lotcode').Asstring+'" '
                            +'   and isnull(quantity,0)-isnull(quantitydo,0)<>0 ');
      if (_lotcode) and (dataTmp.qryTmp.fieldbyName('lotnum').asinteger<>0) then
      begin
         KmessageDlg('仓库中存在相同的物品编号:"'+qryWareOrderInOriSKU.FieldByName('lotcode').Asstring+'"!',mtWarning,[mbOK],0)
      end;


      qryWareOrderInSKU.FieldByName('LotCode').Asstring         :=qryWareOrderInOriSKU.fieldbyname('LotCode').asstring ;
//dwq20060826
      qryWareOrderInSKU.FieldByName('skustandard').Asstring     :=qryWareOrderInOriSKU.fieldbyname('skustandard').asstring ;
      qryWareOrderInSKU.FieldByName('TagEach').Asstring         :=qryWareOrderInOriSKU.fieldbyname('TagEach').asstring ;
      qryWareOrderInSKU.FieldByName('contwithloca').Asstring    :=qryWareOrderInOriSKU.fieldbyname('contwithloca').asstring ;
      qryWareOrderInSKU.FieldByName('lottracked').Asstring      :=qryWareOrderInOriSKU.fieldbyname('lottracked').asstring ;
      qryWareOrderInSKU.FieldByName('countrent').Asstring       :=qryWareOrderInOriSKU.fieldbyname('countrent').asstring ;
      qryWareOrderInSKU.FieldByName('countcontcost').Asstring   :=qryWareOrderInOriSKU.fieldbyname('countcontcost').asstring ;
//wql_new      qryWareOrderInSKU.FieldByName('WO_CCAID').Asstring          :=qryWareOrderInOriSKU.fieldbyname('WO_CCAID').asstring ;
      qryWareOrderInSKU.FieldByName('loadcostone').Asstring     :=qryWareOrderInOriSKU.fieldbyname('loadcostone').asstring ;
//wql_new      qryWareOrderInSKU.FieldByName('LI_QuantityRemain').Asstring :=qryWareOrderInOriSKU.fieldbyname('LI_QuantityRemain').asstring ;
      qryWareOrderInSKU.FieldByName('skucostclasscd').Asstring  :=qryWareOrderInOriSKU.fieldbyname('skucostclasscd').asstring ;
      qryWareOrderInSKU.FieldByName('isbond').Asstring          :=qryWareOrderInOriSKU.fieldbyname('isbond').asstring ;
      qryWareOrderInSKU.FieldByName('warerentcounttype').Asstring:=qryWareOrderInOriSKU.fieldbyname('warerentcounttype').asstring ;
      qryWareOrderInSKU.FieldByName('LocationBillno').Asstring  :=qryWareOrderInOriSKU.fieldbyname('LocationBillno').asstring ;
      qryWareOrderInSKU.FieldByName('costuomtype').Asstring     :=qryWareOrderInOriSKU.fieldbyname('costuomtype').asstring ;
      qryWareOrderInSKU.FieldByName('costuomtype').Asstring     :=qryWareOrderInOriSKU.fieldbyname('costuomtype').asstring ;
      qryWareOrderInSKU.FieldByName('cusbillno').Asstring       :=qryWareOrderInEdit.fieldbyname('cusbillno').asstring;
//{wql} qryWareOrderInSKU.FieldByName('mainorder').Asstring          :=qryWareOrderInOriSKU.fieldbyname('mainorder').asstring;

      qryWareOrderInSKU.fieldbyname('NotFullSign').Asstring       :='F';
      qryWareOrderInSKU.fieldbyname('carriage').AsFloat           :=qryWareOrderInOriSKU.fieldbyname('carriage').AsFloat;
      qryWareOrderInSKU.fieldbyname('carriagetotal').AsFloat      :=qryWareOrderInOriSKU.fieldbyname('carriagetotal').AsFloat;
      qryWareOrderInSKU.fieldbyname('insurance').AsFloat          :=qryWareOrderInOriSKU.fieldbyname('insurance').AsFloat;
      qryWareOrderInSKU.fieldbyname('insurancetotal').AsFloat     :=qryWareOrderInOriSKU.fieldbyname('insurancetotal').AsFloat;

      qryWareOrderInSKU.FieldByName('OrderStatus').Asstring:='H';

    qryWareOrderInSKU.FieldByName('OperationType').AsInteger     :=qryWareOrderInOriSKU.fieldbyname('OperationType').AsInteger;
    qryWareOrderInSKU.FieldByName('costopid').Asstring           :=qryWareOrderInOriSKU.fieldbyname('costopid').Asstring;
    qryWareOrderInSKU.FieldByName('opname').Asstring             :=qryWareOrderInOriSKU.fieldbyname('opname').Asstring;
    qryWareOrderInSKU.FieldByName('shipperopname').Asstring      :=qryWareOrderInOriSKU.fieldbyname('shipperopname').Asstring;
    try
       qryWareOrderInSKU.Post;
    except
       break;
    end;
  end;
end;

procedure TfrmWareOrderIn.grdOriSKUDblClick(Sender: TObject);
var
   jsOriPiece,jsOriVolume,jsOriHeight,jsOriWidth,jsOriDepth:extended;
   jsOriSizeUOM,jsOriVolueUOM:string;
   StrClassid,StrClassIdP:string;
begin
  if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtVolume)  then
  begin
    jsOriPiece   :=qryWareOrderInOriSKU.FieldByName('Piece').AsFloat;
    jsOriHeight  :=qryWareOrderInOriSKU.FieldByName('Height').AsFloat;
    jsOriWidth   :=qryWareOrderInOriSKU.FieldByName('Width').AsFloat;
    jsOriDepth   :=qryWareOrderInOriSKU.FieldByName('Depth').AsFloat;
    jsOriVolume  :=qryWareOrderInOriSKU.FieldByName('Volume').AsFloat;
    jsOriSizeUOM :=qryWareOrderInOriSKU.FieldByName('SizeUOM').AsString;
    jsOriVolueUOM:=qryWareOrderInOriSKU.FieldByName('VolumeUOM').AsString;
    while WorkVolume(jsOriPiece,jsOriHeight,jsOriWidth,jsOriDepth,jsOriVolume,jsOriSizeUOM,jsOriVolueUOM,iif(DataState=stBrowse,'True','False')) and (DataState in Setdcs) do
      begin
        qryWareOrderInOriSKU.Edit;
        qryWareOrderInOriSKU.FieldByName('Height').AsFloat    :=jsOriHeight;
        qryWareOrderInOriSKU.FieldByName('Width').AsFloat     :=jsOriWidth;
        qryWareOrderInOriSKU.FieldByName('Depth').AsFloat     :=jsOriDepth;
        qryWareOrderInOriSKU.FieldByName('Volume').AsFloat    :=jsOriVolume;
        qryWareOrderInOriSKU.FieldByName('SizeUOM').AsString  :=jsOriSizeUOM;
        qryWareOrderInOriSKU.FieldByName('VolumeUOM').AsString:=jsOriVolueUOM;
        exit;
      end; 
  end;
  if _DB_Order='T' then
  begin
     if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtQuantity) and (DataState in Setdcs) and (qryWareOrderInSKU.RecordCount=0)then
     begin
        OpenSql(dataTmp.qryTmp,' select Classid from Sku where skuid="'+qryWareOrderInOriSKU.FieldByName('SkuId').AsString+'" ');
        StrClassid:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,' select Top 1 Sku.Classid   '
                      +'   from WareOrderOriSku (nolock),Sku(nolock)  '
                      +'  where WareOrderOriSku.SkuId=Sku.SkuId  '
                      +'    and isnull(WareOrderOriSku.QuantityRemain,0)>0 '
                      +'    and  "'+StrClassid+'" like  Sku.ClassId+"%" '
                      +'    and WareOrderOriSku.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'  order by Sku.ClassId  ');
        StrClassIdP:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,'declare @Quantity numeric (16,4), @QuantityP numeric (16,4) '+chr(13)+chr(10)
                      +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                      +'  where id=object_id("tempdb..#lskQ") and sysstat & 0xf=3) '+chr(13)+chr(10)
                      +'   drop table #lskQ   '+chr(13)+chr(10)
                      +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                      +'  where id=object_id("tempdb..#lskP") and sysstat & 0xf=3) '+chr(13)+chr(10)
                      +'   drop table #lskP   '+chr(13)+chr(10)
                      +' select Quantity=isnull(Quantity_RemainOrder,0)  '+chr(13)+chr(10)
                      +'   into #lskQ    '+chr(13)+chr(10)
                      +'   from locationindetail Detail (nolock),Sku (nolock) '+chr(13)+chr(10)
                      +'  where Detail.TrackType="TO"  '+chr(13)+chr(10)
                      +'    and Detail.OperationType=1  '+chr(13)+chr(10)
                      +'    and isnull(Detail.Quantity_RemainOrder,0)>0   '+chr(13)+chr(10)
                      +'    and Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskQ (Quantity)    '+chr(13)+chr(10)
                      +' select isnull(QuantityReMain,0)*-1 from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select Quantity=isnull(Quantity_RemainOrder,0)  '+chr(13)+chr(10)
                      +'   into #lskP    '+chr(13)+chr(10)
                      +'   from WareInventoryDetail Detail (nolock),Sku (nolock) '+chr(13)+chr(10)
                      +'  where Detail.TrackType="TO"  '+chr(13)+chr(10)
                      +'    and Detail.OperationType=1  '+chr(13)+chr(10)
                      +'    and isnull(Detail.Quantity_RemainOrder,0)>0   '+chr(13)+chr(10)
                      +'    and Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskP (Quantity)    '+chr(13)+chr(10)
                      +' select isnull(QuantityReMain,0)*-1 from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select @Quantity=sum(isnull(Quantity,0)) from #lskQ  '+chr(13)+chr(10)
                      +' select @QuantityP=sum(isnull(Quantity,0)) from #lskP  '+chr(13)+chr(10)
                      +' select QuantityP=@QuantityP,Quantity=@Quantity  '+chr(13)+chr(10)
                      +'   drop table #lskQ  drop table #lskP  ');
        qryWareOrderInOriSKU.Edit;
        if dataTmp.qryTmp.FieldByName('Quantity').AsFloat>dataTmp.qryTmp.FieldByName('QuantityP').AsFloat then
           qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat:=dataTmp.qryTmp.FieldByname('QuantityP').AsFloat
        else
           qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat:=dataTmp.qryTmp.FieldByname('Quantity').AsFloat;
     end;
     if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtNetWeight) and (DataState in Setdcs) and (qryWareOrderInSKU.RecordCount=0)then
     begin
        OpenSql(dataTmp.qryTmp,' select Classid from Sku where skuid="'+qryWareOrderInOriSKU.FieldByName('SkuId').AsString+'" ');
        StrClassid:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,' select Top 1 Sku.Classid   '
                      +'   from WareOrderOriSku (nolock),Sku(nolock)  '
                      +'  where WareOrderOriSku.SkuId=Sku.SkuId  '
                      +'    and isnull(WareOrderOriSku.NetWeightRemain,0)>0 '
                      +'    and  "'+StrClassid+'" like  Sku.ClassId+"%" '
                      +'    and WareOrderOriSku.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'  order by Sku.ClassId  ');
        StrClassIdP:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,'declare @NetWeight numeric (16,4), @NetWeightP numeric (16,4) '+chr(13)+chr(10)
                      +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                      +'  where id=object_id("tempdb..#lskQ") and sysstat & 0xf=3) '+chr(13)+chr(10)
                      +'   drop table #lskQ   '+chr(13)+chr(10)
                      +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                      +'  where id=object_id("tempdb..#lskP") and sysstat & 0xf=3) '+chr(13)+chr(10)
                      +'   drop table #lskP   '+chr(13)+chr(10)
                      +' select NetWeight=isnull(Quantity_RemainOrder,0)*(isnull(NetWeight,0)/quantity)  '+chr(13)+chr(10)
                      +'   into #lskQ    '+chr(13)+chr(10)
                      +'   from WareInventoryDetail Detail (nolock),Sku (nolock) '+chr(13)+chr(10)
                      +'  where Detail.TrackType="TO"  '+chr(13)+chr(10)
                      +'    and Detail.OperationType=1  '+chr(13)+chr(10)
                      +'    and isnull(Detail.Quantity_RemainOrder,0)>0   '+chr(13)+chr(10)
                      +'    and Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskQ (NetWeight)    '+chr(13)+chr(10)
                      +' select isnull(QuantityRemain,0)*(isnull(NetWeight,0)/quantity)*-1 '+chr(13)+chr(10)
                      +'   from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select NetWeight=isnull(Quantity_RemainOrder,0)*(isnull(NetWeight,0)/quantity)  '+chr(13)+chr(10)
                      +'   into #lskP    '+chr(13)+chr(10)
                      +'   from WareInventoryDetail Detail (nolock),Sku (nolock) '+chr(13)+chr(10)
                      +'  where Detail.TrackType="TO"  '+chr(13)+chr(10)
                      +'    and Detail.OperationType=1  '+chr(13)+chr(10)
                      +'    and isnull(Detail.Quantity_RemainOrder,0)>0   '+chr(13)+chr(10)
                      +'    and Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskP (NetWeight)    '+chr(13)+chr(10)
                      +' select isnull(QuantityRemain,0)*(isnull(NetWeight,0)/quantity)*-1 '+chr(13)+chr(10)
                      +'   from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderInOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderInOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderInEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select @NetWeight=sum(isnull(NetWeight,0)) from #lskQ  '+chr(13)+chr(10)
                      +' select @NetWeightP=sum(isnull(NetWeight,0)) from #lskP  '+chr(13)+chr(10)
                      +' select NetWeightP=@NetWeightP,NetWeight=@NetWeight  '+chr(13)+chr(10)
                      +'   drop table #lskQ  drop table #lskP  ');
        qryWareOrderInOriSKU.Edit;
        if dataTmp.qryTmp.FieldByName('NetWeight').AsFloat>dataTmp.qryTmp.FieldByName('NetWeightP').AsFloat then
           qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat:=dataTmp.qryTmp.FieldByname('NetWeightP').AsFloat
        else
           qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat:=dataTmp.qryTmp.FieldByname('NetWeight').AsFloat;
     end;
  end;
end;

procedure TfrmWareOrderIn.edtQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      if qryWareOrderInOriSKU.FieldByName('costuomtype').AsString='quantity' then
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
                                                            *qryWareOrderInOriSKU.FieldByName('price').AsFloat;
         qryWareOrderInOriSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('pricein').AsFloat;
         qryWareOrderInOriSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('carriage').AsFloat;
         qryWareOrderInOriSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('insurance').AsFloat;
      end;
    with  grdOriSKU.InplaceEditor do
    begin
    qryWareOrderInOriSKU.Edit;
    if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderInOriSKU.FieldByName('SKUID').AsString<>''))
       and ((_DB_Order<>'T')or (_isfromsku='T'))
       then
       begin
         //件数
         if (_isfromsku='T')and (qryWareOrderInOriSKU.FieldByName('piecepro').AsFloat<>0) then
            qryWareOrderInOriSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     /qryWareOrderInOriSKU.FieldByName('piecepro').AsFloat)
         else
         if  (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderInOriSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     *qryWareOrderInOriSKU.FieldByName('Piece').AsFloat
                                                     /qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat);
         //体积
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('VolumePro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('Volume').AsFloat:=(qryWareOrderInOriSKU.FieldByName('Piece').AsFloat
                                                         *qryWareOrderInOriSKU.FieldByName('VolumePro').AsFloat)
         else
         if (_isfromsku<>'T')and (strtofloat(GetEditingText)<>0) then
            qryWareOrderInOriSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderInOriSKU.FieldByName('Volume').AsFloat
                                                     /qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
         //面积
         if (_isfromsku='T')and ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('AreaPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('Area').AsFloat:=(qryWareOrderInOriSKU.FieldByName('Piece').AsFloat
                                                       *qryWareOrderInOriSKU.FieldByName('AreaPro').AsFloat)
         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderInOriSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderInOriSKU.FieldByName('Area').AsFloat
                                                     /qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
         //净重量
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat:=(qryWareOrderInOriSKU.FieldByName('Piece').AsFloat
                                                                *qryWareOrderInOriSKU.FieldByName('NetWeightPro').AsFloat)
         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat
                                                     /qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
         //毛重量
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat:=(qryWareOrderInOriSKU.FieldByName('Piece').AsFloat
                                                                *qryWareOrderInOriSKU.FieldByName('GrossWeightPro').AsFloat)

         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat
                                                     /qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat;
       end;
     qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
    end;
    Accept:=True;
  end;
end;


procedure TfrmWareOrderIn.edtSKUQUANTITYValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=GetMessage('frmWareOrderDxALL','031');//'数量不能小于零!';
         Accept:=False;
         exit;
      end;
      if _piececal then exit;
      if qryWareOrderInSKU.FieldByName('costuomtype').AsString='quantity' then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSku.InplaceEditor.GetEditingText)
                                                            *qryWareOrderInSKU.FieldByName('price').AsFloat;
         qryWareOrderInSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('pricein').AsFloat;
         qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('carriage').AsFloat;
         qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('insurance').AsFloat;
      end;
     with  grdSKU.InplaceEditor do
     begin
       qryWareOrderInSKU.Edit;
   //    qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderInSKU.FieldByName('SKUID').AsString<>''))  then
          begin
            //件数
            if  (qryWareOrderInSKU.FieldByName('piecepro').AsFloat<>0) then
              // Modified by wql 2006.2.14 15:22:45
               {qryWareOrderInSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                        /qryWareOrderInSKU.FieldByName('piecepro').AsFloat) }
               qryWareOrderInSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText)
                                                        /qryWareOrderInSKU.FieldByName('piecepro').AsFloat;
            //体积
            if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('VolumePro').AsFloat)<>0) then
               qryWareOrderInSKU.FieldByName('Volume').AsFloat:=(qryWareOrderInSKU.FieldByName('Piece').AsFloat
                                                            *qryWareOrderInSKU.FieldByName('VolumePro').AsFloat);
            //面积
            if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('AreaPro').AsFloat)<>0) then
               qryWareOrderInSKU.FieldByName('Area').AsFloat:=(qryWareOrderInSKU.FieldByName('Piece').AsFloat
                                                          *qryWareOrderInSKU.FieldByName('AreaPro').AsFloat);
            //净重量
            if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
               qryWareOrderInSKU.FieldByName('NetWeight').AsFloat:=(qryWareOrderInSKU.FieldByName('Piece').AsFloat
                                                                   *qryWareOrderInSKU.FieldByName('NetWeightPro').AsFloat);
            //毛重量
            if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
               qryWareOrderInSKU.FieldByName('GrossWeight').AsFloat:=(qryWareOrderInSKU.FieldByName('Piece').AsFloat
                                                                   *qryWareOrderInSKU.FieldByName('GrossWeightPro').AsFloat);

          end;
        qryWareOrderInSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
        
        if UpperCase(qryWareOrderInSKU.fieldbyname('costuomtype').asstring)='SNO' then
        begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:=qryWareOrderInSKU.FieldByName('price').AsFloat;
        end else
        begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderInSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderInSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                                                                         qryWareOrderInSKU.FieldByName('price').AsFloat;
        end;
     end;
         Accept:=True;
   end;
end;

procedure TfrmWareOrderIn.edtSKULocationNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
   if DataState in setDcs then
   begin
     qryselect:=pGetLocationSelect('','','');
     if qrySelect.FieldByName('LocID').asstring<>'NO' then
     begin
       qryWareOrderInSKU.Edit;
       qryWareOrderInSKU.Fieldbyname('Locid').asstring:=qrySelect.fieldbyname('LocId').asstring;
       qryWareOrderInSKU.Fieldbyname('Locname').asstring:=qrySelect.fieldbyname('LocName').asstring;
       ReturnNext(Self);
     end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.grdSKUExit(Sender: TObject);
begin
  with TdxDBGrid(Sender) do
  try
    if Datalink.DataSet.State in  [dsInsert,dsEdit] then
    begin
      Datalink.DataSet.Post;
    end;
  except
    SetFocus;
    raise;
  end;
end;

procedure TfrmWareOrderIn.edtCostopidButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=edtCostopid;
        {if _Language='CAPTIONC' then
           _strmessage:='费用关系人不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','003'),mtWarning,[mbOK],0);
        Exit;
      end;
      if DataState in Setdcs then
      begin
         qrySelect:=pGetOperatorSelect(qryWareOrderInEdit.fieldbyname('costcusid').asstring);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('costopid').AsString  :=qrySelect.FieldByName('opid').asstring;
            qryWareOrderInEdit.FieldByName('costopname').AsString:=qrySelect.FieldByName('opname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtCostopidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostopid.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('costopid').AsString:='';
         qryWareOrderInEdit.FieldByName('costopname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(qryWareOrderInEdit.fieldbyname('costcusid').asstring);
         if qrySelect.FieldByName('OPID').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('costopid').AsString  :=qrySelect.FieldByName('OPID').asstring;
            qryWareOrderInEdit.FieldByName('costopname').AsString  :=qrySelect.FieldByName('opName').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.Operator_AccountButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderInSKU.fieldbyname('cusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='寄仓单位不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','032'),mtWarning,[mbOK],0);
        Exit;
      end;
{wql_new     getDm:=WorkchooseUsers(' isnull(LoginAccountID,"") like "'+qryWareOrderInSKU.fieldbyname('cusid').asstring+'%" ');
      if getDm.okflag then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.Fieldbyname('Operator_Account').asstring:=getDm.Mc;
      end;  wql_new}
   end;
end;

procedure TfrmWareOrderIn.Operator_ShipAccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   getDm:Tdmsr;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderInSKU.fieldbyname('shippercusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='货主不能为空，必须填写！'
        else
           _strmessage:='**************';  }
        KMessageDlg(GetMessage('frmWareOrderDxALL','033'),mtWarning,[mbOK],0);
        Exit;
      end;
{wql_new      getDm:=WorkchooseUsers(' isnull(LoginAccountID,"") like "'+qryWareOrderInSKU.fieldbyname('shippercusid').asstring+'%" ');
      if getDm.okflag then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.Fieldbyname('Operator_ShipAcc').asstring:=getDm.Mc;
      end;  wql_new}
   end;
end;

procedure TfrmWareOrderIn.opnameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderInOriSKU.fieldbyname('cusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='寄仓单位不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','032'),mtWarning,[mbOK],0);
        Exit;
      end;
      qrySelect:=pGetOperatorSelect(qryWareOrderInOriSKU.fieldbyname('cusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         qryWareOrderInOriSKU.FieldByName('opname').AsString:=qrySelect.FieldByName('opname').asstring;
         //blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.ShipperopidOriButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderInOriSKU.fieldbyname('shippercusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='货主不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','033'),mtWarning,[mbOK],0);
        Exit;
      end;
      qrySelect:=pGetOperatorSelect(qryWareOrderInOriSKU.fieldbyname('shippercusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.FieldByName('shipperopid').AsString  :=qrySelect.FieldByName('opid').asstring;
         qryWareOrderInOriSKU.FieldByName('shipperopname').AsString:=qrySelect.FieldByName('opname').asstring;
         //blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.edtSKUPieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='件数不能小于零!';
         Accept:=False;
         exit;
      end;
      if not _piececal then exit;
      if (qryWareOrderInSKU.FieldByName('costuomtype').AsString='piece')or(qryWareOrderInSKU.FieldByName('costuomtype').AsString='') then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSku.InplaceEditor.GetEditingText)
                                                            *qryWareOrderInSKU.FieldByName('price').AsFloat;
         qryWareOrderInSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('pricein').AsFloat;
         qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('carriage').AsFloat;
         qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInSKU.FieldByName('insurance').AsFloat;
      end;
      with  grdSKU.InplaceEditor do
      begin
      qryWareOrderInSKU.Edit;
  //    qryWareOrderInOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
        if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderInSKU.FieldByName('SKUID').AsString<>''))  then
        begin

           if (strtofloat(GetEditingText)<>0)  then
           begin
             if (qryWareOrderInSKU.FieldByName('Quantity').AsFloat<>0) then
             begin
                if Kmessagedlg(GetMessage('frmWareOrderDxALL','034'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//iif(_language='CAPTIONC','你确定要更改商品数量吗？'
                begin
                  qryWareOrderInSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('piecepro').AsFloat;
                end else exit;
             end else
             begin
               qryWareOrderInSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('piecepro').AsFloat;
             end;
           end;

           //体积
           if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('VolumePro').AsFloat)<>0) then
              qryWareOrderInSKU.FieldByName('Volume').AsFloat:=(strtofloat(GetEditingText)
                                                           *qryWareOrderInSKU.FieldByName('VolumePro').AsFloat);
           //面积
           if ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('AreaPro').AsFloat)<>0) then
              qryWareOrderInSKU.FieldByName('Area').AsFloat:=(strtofloat(GetEditingText)
                                                         *qryWareOrderInSKU.FieldByName('AreaPro').AsFloat);
           //净重量
           if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
              qryWareOrderInSKU.FieldByName('NetWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                  *qryWareOrderInSKU.FieldByName('NetWeightPro').AsFloat);
           //毛重量
           if ((strtofloat(GetEditingText)*qryWareOrderInSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
              qryWareOrderInSKU.FieldByName('GrossWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                  *qryWareOrderInSKU.FieldByName('GrossWeightPro').AsFloat);

         end;
        qryWareOrderInSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText);
        
        if UpperCase(qryWareOrderInSKU.fieldbyname('costuomtype').asstring)='SNO' then
        begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:=qryWareOrderInSKU.FieldByName('price').AsFloat;
        end else
        begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderInSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderInSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderInSKU.FieldByName(qryWareOrderInSKU.fieldbyname('costuomtype').asstring).AsFloat*
                                                                         qryWareOrderInSKU.FieldByName('price').AsFloat;
        end;
     end;
      Accept:=True;
 end;
end;

procedure TfrmWareOrderIn.edtPieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='件数不能小于零!';
         Accept:=False;
         exit;
      end;
      if (qryWareOrderInOriSKU.FieldByName('costuomtype').AsString='piece')or (qryWareOrderInOriSKU.FieldByName('costuomtype').AsString='') then
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
                                                            *qryWareOrderInOriSKU.FieldByName('price').AsFloat;
         qryWareOrderInOriSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('pricein').AsFloat;
         qryWareOrderInOriSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('carriage').AsFloat;
         qryWareOrderInOriSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderInOriSKU.FieldByName('insurance').AsFloat;
      end;
    with  grdOriSKU.InplaceEditor do
    begin
    qryWareOrderInOriSKU.Edit;
    if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderInOriSKU.FieldByName('SKUID').AsString<>''))
       and ((_DB_Order<>'T')or(_isfromsku='T'))  then
       begin
         //体积
         if ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('VolumePro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('Volume').AsFloat:=(strtofloat(GetEditingText)
                                                         *qryWareOrderInOriSKU.FieldByName('VolumePro').AsFloat);
         //面积
         if ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('AreaPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('Area').AsFloat:=(strtofloat(GetEditingText)
                                                       *qryWareOrderInOriSKU.FieldByName('AreaPro').AsFloat);
         //净重量
         if  ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('NetWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                *qryWareOrderInOriSKU.FieldByName('NetWeightPro').AsFloat);
         //毛重量
         if ((strtofloat(GetEditingText)*qryWareOrderInOriSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
            qryWareOrderInOriSKU.FieldByName('GrossWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                *qryWareOrderInOriSKU.FieldByName('GrossWeightPro').AsFloat);

       end;
     qryWareOrderInOriSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText);
    end;
    Accept:=True;
  end;

end;

procedure TfrmWareOrderIn.mitCheckSKUClick(Sender: TObject);
var i:integer;
begin
   if KmessageDlg(GetMessage('frmWareOrderDxALL','035'),mtConfirmation,[mbYes,mbNo],0)=mrNo then//iif(_language='CAPTIONC','该操作将选中的所有指令校验商品信息，您确定操作吗?','')
      Exit;
   with workOrderSelectCnfg do
   if okflag  then
   begin
      StrCheckLocationId:=locid;
      StrCheckLotCode:=LotCode;
      StrCheckType:=OutType;
      blncheck:=skucheck;
      blnOkFlag:=True;
   end else
   begin
      StrCheckLocationId:='';
      StrCheckLotCode:='';
      StrCheckType:='';
      blncheck:=False;
      blnOkFlag:=False;
      exit;
   end;
   _pgbClear.Visible:=True;
   _pgbClear.Position:=0;
   _pgbClear.Max:=grdWareOrder.SelectedCount;
   _labPro.Caption:='共'+inttostr(grdWareOrder.SelectedCount)+'笔';
   Application.ProcessMessages;
   for i:=grdWareOrder.SelectedCount-1 Downto 0 do
   begin
      qryWareOrderIn.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      btnRefreshClick(self);
      if (qryWareOrderIn.Fieldbyname('CheckName').asstring='') and (qryWareOrderIn.Fieldbyname('CheckSKUED').asstring='') then
      begin
        if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
//        if not ScrollAfterEdit then SetDetailActive(False,True);
        SetDetailActive(False,True);
        WorkCall(stEdit);
        btnRateClick(Self);
        btnSaveClick(Self);
      end;
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False;
   _labPro.Caption:='运行进度';
   btnRefresh.Click;
end;

procedure TfrmWareOrderIn.mitOperationClick(Sender: TObject);
begin
   pcWareOrder.ActivePage :=tbsEdit;
   pcInfo.ActivePage:=tbsWareOrderSKU;
   WorkOperation(stBrowse,qryWareOrderIn.FieldByName('Jobno').AsString,
                          qryWareOrderIn.FieldByName('UserID').AsString); 
end;

procedure TfrmWareOrderIn.OrderCnfg ;
begin
  with workOrderSelectCnfg do
   if okflag  then
   begin
      StrCheckLocationId:=locid;
      StrCheckLotCode:=LotCode;
      StrCheckType:=OutType;
      blncheck:=skucheck;
      blnOkFlag:=True;
   end else
   begin
      StrCheckLocationId:='';
      StrCheckLotCode:='';
      StrCheckType:='';
      blncheck:=False;
      blnOkFlag:=False;
   end; 
end;

procedure TfrmWareOrderIn.mitRelationClick(Sender: TObject);
var
   I:Integer;
   StrCostCusId:string;
   StrCusId:string;
   StrShipCusId:string;
   StrUpdateSql:String;
   StrUpdateOrder:string;
   StrUpdateSku:String;
begin
   with workOrderUp do
   if okflag  then
   begin
      StrCostCusId:=CostCusId;
      StrCusId:=cusid;
      StrShipCusId:=ShipCusId;
   end else
   begin
      exit;
   end;
   StrUpdateSql:='';
   StrUpdateSku:='';
   StrUpdateOrder:='';
   if StrCostCusId<>'' then
   begin
      StrUpdateSql:=StrUpdateSql+' costcusid="'+StrCostCusId+'",';
   end;
   if StrCusId<>'' then
   begin
      StrUpdateSql:=StrUpdateSql+' cusid="'+StrCusId+'",';
   end;
   if StrShipCusId<>'' then
   begin
      StrUpdateSql:=StrUpdateSql+' shippercusid="'+StrShipCusId+'",';
   end;
   StrUpdateSql:=copy(StrUpdateSql,1,length(StrUpdateSql)-1);
   StrUpdateOrder:=' update wareorder set '+StrUpdateSql+' where jobno=';
   StrUpdateSku:=' update wareorderOriSku set '+StrUpdateSql+' where jobno=';

  {wql_new frmMain.pgbClear.Visible:=True;
   frmMain.pgbClear.Position:=0;
   frmMain.pgbClear.Max:=grdWareOrder.SelectedCount;
   frmMain.labPro.Caption:='共'+inttostr(grdWareOrder.SelectedCount)+'笔'; wql_new}
   Application.ProcessMessages;
   for i:=grdWareOrder.SelectedCount-1 Downto 0 do
   begin
      if qryWareOrderIn.Fieldbyname('CheckName').asstring='' then
      begin
         qryWareOrderIn.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
         _ADOConnection.startTransaction;
         try
            ExecSql(dataTmp.qryTmp,StrUpdateOrder+'"'+qryWareOrderIn.FieldByName('jobno').AsString+'"'+' '+StrUpdateSku+'"'+qryWareOrderIn.FieldByName('jobno').AsString+'"');
            _ADOConnection.Commit;
         except
            try
              if _ADOConnection.InTransaction then _ADOConnection.RollBack;
            except
            end;
         end;
      end;
//wql_new      frmMain.pgbClear.StepBy(1);
   end;
//wql_new   frmMain.pgbClear.Visible:=False;
//wql_new   frmMain.labPro.Caption:='运行进度';
   btnRefresh.Click;
   KmessageDlg(GetMessage('frmWareOrderDxALL','036'),mtInformation,[mbOK],0);//iif(_language='CAPTIONC','更新完毕！','')  
end;

procedure TfrmWareOrderIn.edtCarriercusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCarriercusid.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('carriercusid').AsString:='';
         qryWareOrderInEdit.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('D',edtCarriercusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtCarriercusidExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderIn.edtConsignCusIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtConsignCusID.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('shipcusid').AsString:='';
         qryWareOrderInEdit.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',edtConsignCusID.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtConsignCusIDExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderIn.cmbCostcusidoutButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('C','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInEdit.FieldByName('costcusidout').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInEdit.FieldByName('costcusnameout').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.cmbCostcusidoutExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbCostcusidout.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('costcusidout').AsString:='';
         qryWareOrderInEdit.FieldByName('costcusnameout').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('C',cmbCostcusidout.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('costcusidout').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('costcusnameout').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.cmbCostcusidoutExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmWareOrderIn.edtOrigincusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOrigincusid.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('origincusid').AsString:='';
         qryWareOrderInEdit.FieldByName('origincusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('L',edtOrigincusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('origincusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('origincusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtOrigincusidExit(Sender: TObject);
begin
  blnselect:=False;
end;

procedure TfrmWareOrderIn.edtDestcusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtDestcusname.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('destcusid').AsString:='';
         qryWareOrderInEdit.FieldByName('destcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('L',edtDestcusname.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('destcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('destcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtDestcusnameExit(Sender: TObject);
begin
   blnSelect:=false;
end;

procedure TfrmWareOrderIn.edtCostopidExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderIn.mitCheckClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from wareordersku (nolock) where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','042'),mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','************')
      Exit;
   end;
   if qryWareOrderIn.FieldByName('checkname').AsString<>'' then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','043'),mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该指令已审核，不能再次审核！','*******************')
      Exit
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   ExecSql(dataTmp.qryTmp,' update wareorder '+
                          '    set checkname="'+_Loginname+'",'+
                          '        checkdate="'+DateToStr(now)+'"'+
                          '  where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.mitCheckCancelClick(Sender: TObject);
begin
   if qryWareOrderIn.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','044'),mtWarning,[mbOK],0);
      exit;
   end;
   if qryWareOrderIn.Fieldbyname('tasked').asstring<>'' then
   begin
     { if _Language='CAPTIONC' then
        _strmessage:='该笔已下达任务，不能取消审核！'
      else
        _strmessage:='*************************'; }
      KmessageDlg(GetMessage('frmWareOrderDxALL','037'),mtWarning,[mbOK],0);
      exit;
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   ExecSql(dataTmp.qryTmp,' update wareorder '+
                      '    set checkname="",'+
                      '        checkdate=null'+
                      '  where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.miOirSkuClick(Sender: TObject);
var
  TContainerSkuSelect:TMultContainerSKUSelect;
begin
   if qryWareOrderIn.FieldByName('jobnoin').AsString='' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该指令不是从其它系统下达，无需对应原始指令！'
      else
         _strmessage:='**************';}
      Kmessagedlg(GetMessage('frmWareOrderDxALL','038'),mtInformation,[mbOk],0);
      Exit;
   end;
   if qryWareOrderInSKU.FieldByName('jobnoine').asstring<>'' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该商品信息已有对应原始数据，您确定要重新对应吗?'
      else
         _strmessage:='**************'; }
      if KmessageDlg(GetMessage('frmWareOrderDxALL','039'),mtConfirmation,[mbYes,mbNo],0)<>mryes then
         exit;
   end;
   if not qryWareOrderInOriSKU.active then qryWareOrderInOriSKU.open; 
   TContainerSkuSelect:=WorkContainerSkuSelect('KINNOR','');
   if TContainerSkuSelect[0].okflag then
   begin
      qryWareOrderInSKU.edit;
      qryWareOrderInSKU.FieldByName('jobnoine').AsString:=TContainerSkuSelect[0].Jobnoin;
      qryWareOrderInSKU.FieldByName('snoine').AsInteger:=TContainerSkuSelect[0].snoin;
      qryWareOrderInSKU.FieldByName('jobnoindp').AsString:=IIF(TContainerSkuSelect[0].Jobnoin<>'','T','F');
   end;
end;

procedure TfrmWareOrderIn.cmbShipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.Edit;
         qryWareOrderInOriSKU.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInOriSKU.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.shipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderInSKU.Edit;
         qryWareOrderInSKU.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInSKU.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderIn.CostcusnameOriButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         qryWareOrderInOriSKU.edit;
         qryWareOrderInOriSKU.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInOriSKU.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmWareOrderIn.CostcusnameSKUButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         qryWareOrderInSKU.edit;
         qryWareOrderInSKU.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderInSKU.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmWareOrderIn.N4Click(Sender: TObject);
var
   skucostuom:string;
begin
   if (qryWareOrderInSKU.FieldByName('SKUID').AsString='') then
   begin
      kMessageDlg(GetMessage('frmWareOrderDxALL','039'), mtInformation, [mbOK], 0);//'请先挑选概要商品!!!'
      exit;
   end;

   if qryWareorderInSkuDetail.Active<>True then
   begin
      qryWareorderInSkuDetail.ParamByName('jobno').AsString:=qryWareOrderIn.fieldByName('jobno').AsString;
      qryWareorderInSkuDetail.Open;
   end;

   if DataState=stedit then
   begin
      _maxgridno:=0;
      qryWareorderInSkuDetail.First;
      while not qryWareorderInSkuDetail.Eof do
      begin
         if qryWareorderInSkuDetail.FieldByName('ldsno').AsInteger>_maxgridno
         then _maxgridno:=qryWareorderInSkuDetail.FieldByName('ldsno').AsInteger;
         qryWareorderInSkuDetail.Next;
      end;
   end;

   qryWareorderInSkuDetail.Filtered:=false;
   if qryWareOrderInSKU.fieldbyname('sno').AsString<>'' then
      qryWareorderInSkuDetail.filter:='sno='+qryWareorderInSkuDetail.fieldbyname('sno').AsString
   else
      qryWareorderInSkuDetail.filter:='sno=-1';
   qryWareorderInSkuDetail.Filtered:=true;

   with workLIOSKUDetail(datastate,
                  qryWareOrderIn.FieldByName('jobno').AsString,qryWareOrderInSKU.FieldByName('sno').AsInteger,
                  qryWareOrderInSKU.FieldByName('skuid').AsString,qryWareOrderInSKU.FieldByName('skuname').AsString,'lioskudetail',
                 2,'F',qryWareOrderInSKU.FieldByName('jobnoin').AsString,qryWareOrderInSKU.FieldByName('jobno').AsString,
                 qryWareOrderInSKU.FieldByName('snoin').asinteger,qryWareOrderInSKU.FieldByName('sno').asinteger,
                 qryWareOrderInSKU
                ) do
   begin
      if DataState in Setdcs then
      if OKflag=True then
      begin
         qryWareOrderInSKU.edit;
         qryWareOrderInSKU.FieldByName('quantitytask').AsFloat:=quantity;
         qryWareOrderInSKU.FieldByName('piecetask').AsFloat:=piece;
         qryWareOrderInSKU.FieldByName('areatask').AsFloat:=area;
         qryWareOrderInSKU.FieldByName('volumetask').AsFloat:=volume;
         qryWareOrderInSKU.FieldByName('grossweighttask').AsFloat:=grossweight;
         qryWareOrderInSKU.FieldByName('netweighttask').AsFloat:=netweight;
         skucostuom:=Trim(qryWareOrderInSKU.FieldByName('costuomtype').AsString);
         //wzh.05.09.09 判断件数单位
         if skucostuom='' then skucostuom:='piece';
         if UpperCase(skucostuom)='SNO' then
         begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat :=qryWareOrderInSKU.FieldByName('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat :=qryWareOrderInSKU.FieldByName('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('skucost').AsFloat :=qryWareOrderInSKU.FieldByName('price').AsFloat;
         end else
         begin
           qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat :=
                 qryWareOrderInSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderInSKU.FieldByName('carriage').AsFloat;
           qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat :=
                 qryWareOrderInSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderInSKU.FieldByName('insurance').AsFloat;
           qryWareOrderInSKU.FieldByName('skucost').AsFloat :=
                 qryWareOrderInSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderInSKU.FieldByName('price').AsFloat;
         end;
      end;
   end;
end;

procedure TfrmWareOrderIn.cmbCostUOMTypeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=cmbCostUOMType.ItemFields.Strings[cmbCostUOMType.Items.IndexOf(grdOriSKU.InplaceEditor.GetEditingText)];
      if strcostuom='' then strcostuom:='piece';
      qryWareOrderInOriSKU.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('orderdate').asdatetime)+'"'
                            +'   and skuid="'+qryWareOrderInOriSKU.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'"'
             );
      qryWareOrderInOriSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      qryWareOrderInOriSKU.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      qryWareOrderInOriSKU.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      qryWareOrderInOriSKU.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderInOriSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      qryWareOrderInOriSKU.FieldByName('SkuCostIn').AsFloat:= qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                                                                      qryWareOrderInOriSKU.FieldByName('priceIn').AsFloat;
      qryWareOrderInOriSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                                                                    qryWareOrderInOriSKU.FieldByName('price').AsFloat;
      qryWareOrderInOriSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                        dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderInOriSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                        dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
   end;
end;

procedure TfrmWareOrderIn.cmbSKUCostUomTypeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=cmbSKUCostUomType.ItemFields.Strings[cmbSKUCostUomType.Items.IndexOf(grdSKU.InplaceEditor.GetEditingText)];

      if strcostuom='' then strcostuom:='piece';
      qryWareOrderInSKU.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('orderdate').asdatetime)+'"'
                            +'   and skuid="'+qryWareOrderInSKU.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'%"'
             );
      qryWareOrderInSKU.Fieldbyname('costuomtype').asstring :=strcostuom;
      qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      qryWareOrderInSKU.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      qryWareOrderInSKU.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      qryWareOrderInSKU.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      qryWareOrderInSKU.FieldByName('SkuCostIn').AsFloat:= qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                                                                      qryWareOrderInSKU.FieldByName('priceIn').AsFloat;
      if UpperCase(strcostuom)='SNO' then
      begin
          qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderInSKU.FieldByName('price').AsFloat;
          qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
          qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end else
      begin
          qryWareOrderInSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                                                                        qryWareOrderInSKU.FieldByName('price').AsFloat;
          qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                            dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
          qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                            dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end;
   end;
end;

procedure TfrmWareOrderIn.CarriageValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInSKU.Edit;
      strcostuom:=iif(qryWareOrderInSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInSKU.FieldByName('carriage').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInSKU.FieldByName('carriage').AsFloat
      else
         qryWareOrderInSKU.FieldByName('carriagetotal').AsFloat:=
                                     qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderInSKU.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmWareOrderIn.InsuranceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInSKU.Edit;
      strcostuom:=iif(qryWareOrderInSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInSKU.FieldByName('insurance').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInSKU.FieldByName('insurance').AsFloat
      else
         qryWareOrderInSKU.FieldByName('insurancetotal').AsFloat:=
                                     qryWareOrderInSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderInSKU.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmWareOrderIn.CarriageOriValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInOriSKU.Edit;
      strcostuom:=iif(qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInOriSKU.FieldByName('carriage').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderInOriSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderInOriSKU.FieldByName('carriage').AsFloat
      else
         qryWareOrderInOriSKU.FieldByName('carriagetotal').AsFloat:=
                                     qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderInOriSKU.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmWareOrderIn.InsuranceOriValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInOriSKU.Edit;
      strcostuom:=iif(qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInOriSKU.FieldByName('insurance').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         qryWareOrderInOriSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderInOriSKU.FieldByName('insurance').AsFloat
      else
         qryWareOrderInOriSKU.FieldByName('insurancetotal').AsFloat:=
                                     qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderInOriSKU.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmWareOrderIn.edtPriceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInOriSKU.Edit;
      strcostuom:=iif(qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInOriSKU.FieldByName('price').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         qryWareOrderInOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
      else
         qryWareOrderInOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                 qryWareOrderInOriSKU.FieldByName(strcostuom).AsFloat;
    end;
end;

procedure TfrmWareOrderIn.edtSKUSKU_CostValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderInSKU.Edit;
      strcostuom:=iif(qryWareOrderInSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderInSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderInSKU.FieldByName('price').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderInSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText)
      else
        qryWareOrderInSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText)*
                                                                qryWareOrderInSKU.FieldByName(strcostuom).AsFloat;
    end;
end;

procedure TfrmWareOrderIn.mitCheckMoreClick(Sender: TObject);
var
   I,K:Integer;
   J:Integer; //记录要审核的总笔数
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   j:= grdWareOrder.SelectedCount;
   k:=0;
   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages; //为了控制进度条
   for i:=grdWareOrder.SelectedCount-1 Downto 0 do
   begin
      KMessageWait('进程：'+IntToStr(J-I)+'/'+IntToStr(j),mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      qryWareOrderIn.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      OpenSql(dataTmp.qryTmp,'select * from wareordersku(nolock) where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'" ');
      if (dataTmp.qryTmp.RecordCount=0) then
      begin
         if j=1 then                                      //审核单笔提示,审核多笔记录K
         begin
            KmessageDlg('该指令无货物信息，不能审核！',mtWarning,[mbOK],0);
            //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','***************************')
            Exit
         end else
         begin
            inc(k);
            Continue;
         end;
      end;
      if qryWareOrderIn.FieldByName('checkname').AsString<>'' then
      begin
         if j=1 then                                      //审核单笔提示,审核多笔记录K
         begin
            KmessageDlg('该指令已审核，不能再次审核！',mtWarning,[mbOK],0);
            //IIF(_Language='CAPTIONC','该指令已审核，不能再次审核！','***************************')
            Exit
         end else
         begin
            Inc(k);
            Continue;
         end;
      end;
      if qryWareOrderIn.FieldByName('CHECKNAME').AsString='' then
         execSql(dataTmp.qryTmp,'update wareorder '
                               +'   set checkname="'+_loginname+'",'
                               +'       checkdate="'+datetostr(now)+'"'
                               +' where jobno="'+qryWareOrderIn.FieldByName('Jobno').AsString+'"');
      btnRefreshClick(btnRefresh);
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   if k<>0 then
      KMessageDlg(IntToStr(k)+'/'+IntToStr(J)+GetMessage('frmWareOrderDxALL','045'),mtWarning,[mbOK],0)
      //IIF(_Language='CAPTIONC','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因无货物信息或已经审核过无法审核', '本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔无法审核')
   else
      Kmessagedlg('操作成功!',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.mitCancelMoreClick(Sender: TObject);
var
   I,K:Integer;
   J:Integer; //记录要取消审核的总笔数
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   k:=0;
   j:= grdWareOrder.SelectedCount;
   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages; //为了控制进度条
   for i:=grdWareOrder.SelectedCount-1 Downto 0 do
   begin
      KMessageWait('进程：'+IntToStr(J-I)+'/'+IntToStr(j),mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      qryWareOrderIn.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      if qryWareOrderIn.Fieldbyname('checkname').asstring='' then
      begin
         if j=1 then
         begin
            {if _Language='CAPTIONC' then
              _strmessage:='该指令还未审核，不能取消审核！'}
            KmessageDlg('该指令还未审核，不能取消审核！',mtWarning,[mbOK],0);
            exit;
         end else
         begin
            Inc(K);
            Continue;
         end;
      end;
      if qryWareOrderIn.Fieldbyname('tasked').asstring<>'' then
      begin
         if j=1 then
         begin
           { if _Language='CAPTIONC' then
              _strmessage:='该笔已下达任务，不能取消审核！'}
            KmessageDlg('该笔已下达任务，不能取消审核！',mtWarning,[mbOK],0);
            exit;
         end else
         begin
            Inc(K);
            Continue;
         end;
      end;
      execSql(dataTmp.qryTmp,'update wareorder '
                            +'   set checkname="",'
                            +'       checkdate=null '
                            +' where jobno="'+qryWareOrderIn.FieldByName('Jobno').AsString+'"');
      btnRefreshClick(btnRefresh);
      _pgbClear.StepBy(1);   //为了控制进度条
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   if k<>0 then
      KMessageDlg(IntToStr(k)+'/'+IntToStr(J)+GetMessage('frmWareOrderDxALL','046'),mtWarning,[mbOK],0)
      //IIF(_Language='CAPTIONC','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因未审核或已下达指令而无法取消审核','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因未审核或已下达指令而无法取消审核')
   else
      Kmessagedlg('操作成功!',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.N6Click(Sender: TObject);
var strNum:Integer;
begin
   OpenSql(dataTmp.qryTmp,'select * from wareordersku (nolock) where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg('该指令无货物信息，不能审核！',mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','************')
      Exit;
   end;
   if qryWareOrderIn.FieldByName('checkname').AsString='' then
   begin
      if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update wareorder '+
                             '    set checkname="'+_Loginname+'",'+
                             '        checkdate="'+DateToStr(now)+'"'+
                             '  where jobno="'+qryWareOrderIn.FieldByName('jobno').AsString+'"');
      btnRefreshClick(Self);
      if not qryWareOrderInSKU.active then qryWareOrderInSKU.open;
      if _DB_Order<>'T' then
      begin
         opensql(dataTmp.qryTmp,'select acount=count(*) '
                       +'  from locationinitem (nolock)'
                       +' where jobnoorder="'+qryWareOrderIn.FieldByName('jobno').Asstring+'"');
         if dataTmp.qryTmp.FieldByName('acount').AsInteger>0 then
           if KmessageDlg('该指令单已有数据形成任务，您确定要重新生成任务吗?',mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;//iif(_language='CAPTIONC','该指令单已有数据形成任务，您确定要重新生成任务吗?','')
      end;
      pcWareOrder.ActivePage := tbsEdit;
      pcInfo.ActivePage:=tbsWareOrderSKU;

      qryWareOrderInSKU.DisableControls;
      Bookmark:= qryWareOrderInSKU.GetBookmark;
      strNum:=0;
      qryWareOrderInSKU.First;
      while not qryWareOrderInSKU.Eof do
      begin
        if qryWareOrderInSKU.FieldByName('skuid').Asstring='' then strNum:=strNum+1;
        qryWareOrderInSKU.Next;
      end;
      qryWareOrderInSKU.GotoBookmark(Bookmark);
      qryWareOrderInSKU.FreeBookmark(Bookmark);
      bookMark:=nil;
      qryWareOrderInSKU.EnableControls;

      if strNum<>0 then
        begin
          if WorkChooseSKUID(qryWareOrderInSKU) then
            begin
              //更新后台数据库的商品库内容
              _ADOConnection.Starttransaction;
              qryWareOrderInSKU.first;
              qryWareOrderInSKU.EnableControls;
              qryWareOrderInSKU.applyupdates;

              //检查库存
              //wql_new  CheckWareInventory(qryWareOrderInEdit.FieldByName('Jobno').AsString);
              _ADOConnection.Commit;
              qryWareOrderInSKU.commitUpdates;
            end
          else exit;
        end;
      //调用locationinout，生成任务!为了取完整的商品费率必须filtered设为False!
      WorkLocationIN(stInsert,'','ITEM',qryWareOrderInEdit,qryWareOrderInSKU)
   end;
end;

procedure TfrmWareOrderIn.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin

  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        qryWareOrderInEdit.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        qryWareOrderInEdit.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmWareOrderIn.edtIUserExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmWareOrderIn.edtIUserExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtIUser.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('iuserid').AsString:='';
         qryWareOrderInEdit.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtIUser.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            qryWareOrderInEdit.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.N5Click(Sender: TObject);
var
  lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdOriSKU,lstPara,'原始指令明细');
end;

procedure TfrmWareOrderIn.edtSKUQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
       qryWareOrderInSKU.edit;
       qryWareOrderInSKU.FieldByName('QualityName').AsString
                     :=pGetqualitySelect(qryWareOrderInSKU.FieldByName('QualityName').AsString);
   end;
end;

procedure TfrmWareOrderIn.edtConsCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('G','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('conscusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.edtConsCusExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderIn.edtConsCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtConsignCusID.Text='' then
      begin
         qryWareOrderInEdit.Edit;
         qryWareOrderInEdit.FieldByName('conscusid').AsString:='';
         qryWareOrderInEdit.FieldByName('conscusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',edtConsCus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderInEdit.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderInEdit.FieldByName('conscusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderIn.mitdelallClick(Sender: TObject);
begin
   opensql(dataTmp.qryTmp,'select num=count(1)'
                 +'  from WareOrdersku '
                 +' where jobno="'+qryWareOrderInEdit.FieldByName('jobno').Asstring+'" '
                 +'   and isnull(quantitytask,0)<>0');
   if dataTmp.qryTmp.FieldByName('num').asinteger<>0 then
   begin
      {if _Language='CAPTIONC'then
         _strmessage:='该指令单已经生成任务，不能删除！'
      else
         _strmessage:='';}
      kMessageDlg(GetMessage('frmWareOrderDxALL','013'),mtWarning,[mbOK],0);
      exit;
   end else
   begin
      if KmessageDlg('你确定要删除所有的商品资料吗？',mtInformation,[mbYes,mbNo],0)=mrYes then
      begin
         qryWareOrderInSKU.First;
         while not qryWareOrderInSKU.Eof do
         begin
            strDel_Task:=strDel_Task+' or SNO='+qryWareOrderInSKU.fieldbyname('SNO').Asstring;
            qryWareOrderInSKU.Delete;
         end;
      end;
   end;
end;

procedure TfrmWareOrderIn.mitjcxhtzdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pcWareOrder.ActivePage<>tbsEdit then
      pcWareOrder.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   //出货通知单
   OpenSql(dataTmp.qryTmp,'select wareorder.jobno,wareorder.picktype,WareOrderSKU.skuname,WareOrderSKU.lotcode,wareorder.orderdate, '+chr(13)+chr(10)
                         +'       WareOrderSKU.quantity,quantityuom=WareOrderSKU.pieceuom,WareOrderSKU.locname,wareorder.createname, '+chr(13)+chr(10)
                         +'       WareOrderSKU.costcusname,orderdate=convert(char(10),wareorder.orderdate,102),wareorder.carbrand,   '+chr(13)+chr(10)
                         +'       WareOrderSKU.volume,WareOrderSKU.cusname,WareOrderSKU.orderid,uploaddate,    '+chr(13)+chr(10)
                         +'       WareOrderSKU.skustandard,WareOrderSKU.mainorder,WareOrder.remark,wareorder.username,         '+chr(13)+chr(10)
                         +'       grossweight=case when WareOrderSKU.weightuom="吨" then WareOrderSKU.grossweight*1000 else WareOrderSKU.grossweight end '+chr(13)+chr(10)
                         +'  from wareorder (nolock)                                        '+chr(13)+chr(10)
                         +'       left join WareOrderSKU (nolock)                                '+chr(13)+chr(10)
                         +'                left join sku (nolock)                                         '+chr(13)+chr(10)
                         +'                      on wareordersku.skuid=sku.skuid                               '+chr(13)+chr(10)
                         +'             on wareorder.jobno=WareOrderSKU.jobno                         '+chr(13)+chr(10)
                         +'  where wareorder.JOBNO="'+qryWareOrderInEdit.FieldByname('JOBNO').AsString+'" '+chr(13)+chr(10)
                         );
   lstpara.Add('orderid='+dataTmp.qryTmp.FieldByname('orderid').AsString);
   lstpara.Add('orderdate='+datatmp.qryTmp.fieldbyname('orderdate').AsString);
   lstpara.Add('mainorder='+dataTmp.qryTmp.FieldByname('mainorder').AsString);
   lstPara.Add('cusname='+dataTmp.qryTmp.fieldbyname('cusname').AsString);
   lstPara.Add('picktype='+dataTmp.qryTmp.fieldbyname('picktype').AsString);
   lstPara.Add('username='+dataTmp.qryTmp.fieldbyname('username').AsString);
   lstpara.Add('carbrand='+dataTmp.qryTmp.FieldByname('carbrand').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstpara.Add('createname='+dataTmp.qryTmp.FieldByname('createname').AsString);
   lstPara.Add('date='+datetostr(date));
   lstpara.Add('uploaddate='+dataTmp.qryTmp.FieldByname('uploaddate').AsString);
   Worklinprint('900096','old','进仓卸货通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmWareOrderIn.N7Click(Sender: TObject);
begin
   WorkTransact;
end;

procedure TfrmWareOrderIn.mitordercomClick(Sender: TObject);
begin
   if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
   if qryWareOrderInEdit.FieldByName('OrderStatus').AsString<>'C' then
   execSql(dataTmp.qryTmp,'update wareorder '
                         +'   set ordercomdate="'+datetostr(now)+'",OrderStatus="C" '
                         +' where jobno="'+qryWareOrderIn.FieldByName('Jobno').AsString+'"');
   Kmessagedlg('指令完成',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.mitcancelcomClick(Sender: TObject);
begin
   if qryWareOrderInEdit.FieldByName('OrderStatus').AsString='C' then
   execSql(dataTmp.qryTmp,'update wareorder '
                         +'   set ordercomdate=null,OrderStatus="H" '
                         +' where jobno="'+qryWareOrderIn.FieldByName('Jobno').AsString+'"');
   Kmessagedlg('取消完成',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderIn.qryWareOrderInOriSKUAfterInsert(
  DataSet: TDataSet);
begin
  qryWareOrderInOriSKU.Fieldbyname('SNO').AsFloat  :=-1;

  qryWareOrderInOriSKU.fieldByname('JOBNO').AsString:=qryWareOrderInEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderInOriSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderInOriSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderInOriSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderInOriSKU.fieldByname('QualityName').AsString:='正品';
  qryWareOrderInOriSKU.FieldByName('costuomtype').AsString:=iif(strCostcountuom='','piece',strCostcountuom);

  qryWareOrderInOriSKU.fieldByname('operationtype').AsInteger:=1;
  qryWareOrderInOriSKU.fieldByname('CustomsNO').AsString:=qryWareOrderInEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderInOriSKU.fieldByname('cusid').AsString         :=iif(WareOrder_copyCusID='',WareOrder_strOrderCusID,WareOrder_copyCusID);
  qryWareOrderInOriSKU.fieldByname('cusname').AsString       :=iif(WareOrder_copyCusName='',WareOrder_strOrderCusName,WareOrder_copyCusName);
  qryWareOrderInOriSKU.fieldByname('shippercusid').AsString  :=iif(WareOrder_Copyshippercusid='',WareOrder_strOrderShippercusid,WareOrder_Copyshippercusid);
  qryWareOrderInOriSKU.fieldByname('shippercusname').AsString:=iif(WareOrder_Copyshippercusname='',WareOrder_strOrderShippercusname,WareOrder_Copyshippercusname);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusid').AsString     :=iif(wareorder_CopyCostCusid='',qryWareOrderEdit.fieldbyname('costcusid').AsString,wareorder_CopyCostCusid);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusname').AsString   :=iif(wareorder_CopyCostCusname='',qryWareOrderEdit.fieldbyname('costcusname').AsString,wareorder_CopyCostCusname);

  qryWareOrderInOriSKU.fieldByname('OrderStatus').AsString:=qryWareOrderInEdit.fieldByname('OrderStatus').AsString;
  qryWareOrderInOriSKU.fieldByname('NotFullSign').AsString:='F';
end;

procedure TfrmWareOrderIn.qryWareOrderInOriSKUAfterPost(DataSet: TDataSet);
begin
  if qryWareOrderInOriSKU.fieldbyname('SKUName').asstring='' then
  begin
    qryWareOrderInOriSKU.Delete;
  end;
end;

procedure TfrmWareOrderIn.qryWareOrderInOriSKUAfterScroll(
  DataSet: TDataSet);
begin
//
end;

procedure TfrmWareOrderIn.qryWareOrderInOriSKUBeforePost(
  DataSet: TDataSet);
begin
   with grdOriSKU do
   begin
      if grdOriSKU.Datalink.DataSet.State in  [dsInsert,dsEdit]  then
      begin
        if ValueIsInvalid(FocusedNode.Values[edtSKUName.Index],edtSKUName.Field) then
        begin
          exit;
        end else
        if ValueIsInvalid(FocusedNode.Values[edtSKUName.Index],edtSKUName.Field) then
        begin
          exit;
        end else
        if ValueIsInvalid(FocusedNode.Values[edtCusid.Index],edtCusid.Field) then
        begin
          MessageBeep(0);
          if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
          raise EdxEditInvalidInput.Create('寄仓单位不可为空!');
          exit;
        end else
        if ValueIsInvalid(FocusedNode.Values[edtCusid.Index],edtCusid.Field) then
        begin
          MessageBeep(0);
          if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
          raise EdxEditInvalidInput.Create('货主不可为空!');
          exit;
        end else
        if ValueIsInvalid(FocusedNode.Values[edtQuantity.Index],edtQuantity.Field) then
        if (qryWareOrderInOriSKU.fieldbyname('quantity').asinteger=0)
          and (ValueIsInvalid(FocusedNode.Values[edtQuantity.Index],edtQuantity.Field))
          and (qryWareOrderInOriSKU.fieldbyname('NetWeight').asinteger=0)
          and (ValueIsInvalid(FocusedNode.Values[edtNetWeight.Index],edtNetWeight.Field))
          then
        begin        //VarIsNull
           MessageBeep(0);
          if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
          raise EdxEditInvalidInput.Create('数量不可为0!');
          exit;
        end;
        if grdOriSKU.Datalink.DataSet.State = dsInsert then
        begin
          WareOrder_maxWareOrderOriSKU:=WareOrder_maxWareOrderOriSKU+1;
          qryWareOrderInOriSKU.FieldByName('SNO').asinteger:=WareOrder_maxWareOrderOriSKU;
          qryWareOrderInOriSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
          qryWareOrderInOriSKU.fieldByname('OrderStatus').AsString:='H';
        end;
      end;
   end;
end;

procedure TfrmWareOrderIn.qryWareOrderInOriSKUBeforeScroll(
  DataSet: TDataSet);
begin
  WareOrder_copyCusID  :=qryWareOrderInOriSKU.fieldByname('cusid').AsString;
  WareOrder_copyCusName:=qryWareOrderInOriSKU.fieldByname('cusname').AsString;
  WareOrder_Copyshippercusid  :=qryWareOrderInOriSKU.fieldByname('shippercusid').AsString;
  WareOrder_Copyshippercusname:=qryWareOrderInOriSKU.fieldByname('shippercusname').AsString;
  strCostcountuom:=qryWareOrderInOriSKU.fieldByname('costuomtype').AsString;
end;

procedure TfrmWareOrderIn.qryWareOrderInSKUAfterInsert(DataSet: TDataSet);
begin
  qryWareOrderInSKU.fieldByname('SNO').AsInteger:=-1;
  qryWareOrderInSKU.fieldByname('JOBNO').AsString:=qryWareOrderInEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderInSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderInSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderInSKU.fieldByname('LocID').AsString:='';
  qryWareOrderInSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderInSKU.fieldByname('QualityName').AsString:='正品';

  qryWareOrderInSKU.FieldByName('costuomtype').AsString:=iif(strCostcountuom='','piece',strCostcountuom);

  qryWareOrderInSKU.fieldByname('operationtype').AsInteger:=1;
  qryWareOrderInSKU.fieldByname('CustomsNO').AsString:=qryWareOrderInEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderInSKU.fieldByname('cusid').AsString         :=iif(WareOrder_copyCusID='',WareOrder_strOrderCusID,WareOrder_copyCusID);
  qryWareOrderInSKU.fieldByname('cusname').AsString       :=iif(WareOrder_copyCusName='',WareOrder_strOrderCusName,WareOrder_copyCusName);
  qryWareOrderInSKU.fieldByname('shippercusid').AsString  :=iif(WareOrder_Copyshippercusid='',WareOrder_strOrderShippercusid,WareOrder_Copyshippercusid);
  qryWareOrderInSKU.fieldByname('shippercusname').AsString:=iif(WareOrder_Copyshippercusname='',WareOrder_strOrderShippercusname,WareOrder_Copyshippercusname);

  qryWareOrderInSKU.fieldByname('OrderStatus').AsString:=qryWareOrderInEdit.fieldByname('OrderStatus').AsString;
end;

procedure TfrmWareOrderIn.qryWareOrderInSKUAfterPost(DataSet: TDataSet);
begin
  if qryWareOrderInSKU.fieldbyname('SKUID').asstring='' then
  begin
    qryWareOrderInSKU.Delete;
  end;
end;

procedure TfrmWareOrderIn.qryWareOrderInSKUAfterScroll(DataSet: TDataSet);
begin
//
end;

procedure TfrmWareOrderIn.qryWareOrderInSKUBeforePost(DataSet: TDataSet);
begin
  with grdSKU do
  begin
     if (grdSKU.Datalink.DataSet.State in  [dsInsert,dsEdit]) then
     begin
       if ValueIsInvalid(FocusedNode.Values[edtSKUSKUName.Index],edtSKUSKUName.Field) then
       begin
         exit;
       end else
       if ValueIsInvalid(FocusedNode.Values[edtSKUSKUName.Index],edtSKUSKUName.Field) then
       begin
         exit;
       end else
       if ValueIsInvalid(FocusedNode.Values[edtSKUCusid.Index],edtSKUCusid.Field) then
       begin
         MessageBeep(0);
         if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
         raise EdxEditInvalidInput.Create('寄仓单位不可为空!');
         exit;
       end else
       if ValueIsInvalid(FocusedNode.Values[edtSKUShippercusid.Index],edtSKUShippercusid.Field) then
       begin
         MessageBeep(0);
         if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
         raise EdxEditInvalidInput.Create('货主不可为空!');
         exit;
       end else
       if ValueIsInvalid(FocusedNode.Values[edtSKUQuantity.Index],edtSKUQuantity.Field) then
       begin        //VarIsNull
         MessageBeep(0);
         if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
         raise EdxEditInvalidInput.Create('数量不可为0!');
         exit;
       end else
       if (_DB_Order='T') and (qryWareOrderInSKU.fieldbyname('quantitytask').asinteger<>0) and
          (qryWareOrderInSKU.fieldbyname('quantity').asinteger<>qryWareOrderInSKU.fieldbyname('quantitytask').asinteger)
       then
       begin
         MessageBeep(0);
         if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
         raise EdxEditInvalidInput.Create('数量要与任务数相等!');
         exit;
       end;
       if Datalink.DataSet.State = dsInsert then
       begin
         WareOrder_maxWareOrderSKU:=WareOrder_maxWareOrderSKU+1;
         qryWareOrderInSKU.FieldByName('SNO').asinteger:=WareOrder_maxWareOrderSKU;
         qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
         qryWareOrderInSKU.fieldByname('OrderStatus').AsString:='H';
       end;
    end;
  end;
end;

procedure TfrmWareOrderIn.qryWareOrderInSKUBeforeScroll(DataSet: TDataSet);
begin
  WareOrder_copyCusID  :=qryWareOrderInSKU.fieldByname('cusid').AsString;
  WareOrder_copyCusName:=qryWareOrderInSKU.fieldByname('cusname').AsString;
  WareOrder_Copyshippercusid  :=qryWareOrderInSKU.fieldByname('shippercusid').AsString;
  WareOrder_Copyshippercusname:=qryWareOrderInSKU.fieldByname('shippercusname').AsString;
  strCostcountuom:=qryWareOrderInSKU.fieldByname('costuomtype').AsString;
end;

procedure TfrmWareOrderIn.btnOrderWithTaskClick(Sender: TObject);
begin
   WorkInPutOrder('I');
end;

procedure TfrmWareOrderIn.edtSKUSKUNameValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  i:integer;
  strID,strskuname:string;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
   IF grdSKU.InplaceEditor.GetEditingText<>'' then
   begin
      if qryWareOrderInEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=edtCostcusid;
        KMessageDlg('费用关系人不能为空，必须填写！',mtWarning,[mbOK],0);
        Exit;
      end;
      opensql(datatmp.qryTmp,'select * from sku (nolock) where skuname like "%"+"'+grdSKU.InplaceEditor.GetEditingText+'"+"%"') ;
      if datatmp.qryTmp.RecordCount=1 then
      begin
         qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=datatmp.qryTmp.fieldbyname('SKUID').asstring;
         qryWareOrderInSKU.fieldbyname('skuname').asstring             :=datatmp.qryTmp.fieldbyname('SKUName').asstring;
         strGetCd := datatmp.qryTmp.fieldbyname('SKUName').asstring;;
//         if datatmp.qryTmp.Fieldbyname('LotCode').asstring<>'' then
//           qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=datatmp.qryTmp.Fieldbyname('LotCode').asstring;
//         if datatmp.qryTmp.fieldbyname('Quantity').AsFloat<>0 then
//           qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=datatmp.qryTmp.fieldbyname('Quantity').AsFloat;
//         if datatmp.qryTmp.Fieldbyname('QualityName').asstring<>'' then
//          qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=datatmp.qryTmp.Fieldbyname('QualityName').asstring      ;
         qryWareOrderInSKU.fieldbyname('QuantityUOM').asstring           :=datatmp.qryTmp.fieldbyname('QuantityUOM').asstring         ;
         qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=datatmp.qryTmp.fieldbyname('PieceUOM').asstring         ;
         qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=datatmp.qryTmp.fieldbyname('WeightUOM').asstring        ;
         qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=datatmp.qryTmp.fieldbyname('VolumeUOM').asstring        ;
         qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=datatmp.qryTmp.fieldbyname('AreaUOM').asstring          ;
         if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
           qryWareOrderInSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
         if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
           qryWareOrderInSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
         if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
           qryWareOrderInSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
         if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
           qryWareOrderInSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

         qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring          :='';

         qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat  :=datatmp.qryTmp.fieldbyname('PiecePro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=datatmp.qryTmp.fieldbyname('VolumePro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat   :=datatmp.qryTmp.fieldbyname('AreaPro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat:=datatmp.qryTmp.fieldbyname('WeightPro').AsFloat;
         if datatmp.qryTmp.Fieldbyname('grossWeightPro').asFloat<>0 then
            qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=datatmp.qryTmp.Fieldbyname('grossWeightPro').asFloat
         else
            qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=datatmp.qryTmp.fieldbyname('WeightPro').AsFloat;
         qryWareOrderInSKU.Fieldbyname('UOM1').asString        :=datatmp.qryTmp.fieldbyname('UOM1').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM2').asString        :=datatmp.qryTmp.fieldbyname('UOM2').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM3').asString        :=datatmp.qryTmp.fieldbyname('UOM3').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM4').asString        :=datatmp.qryTmp.fieldbyname('UOM4').asstring;
         qryWareOrderInSKU.Fieldbyname('UOM5').asString        :=datatmp.qryTmp.fieldbyname('UOM5').asstring;
         qryWareOrderInSKU.Fieldbyname('Pro1').AsFloat   :=datatmp.qryTmp.fieldbyname('Pro1').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro2').AsFloat   :=datatmp.qryTmp.fieldbyname('Pro2').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro3').AsFloat   :=datatmp.qryTmp.fieldbyname('Pro3').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro4').AsFloat   :=datatmp.qryTmp.fieldbyname('Pro4').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Pro5').AsFloat   :=datatmp.qryTmp.fieldbyname('Pro5').AsFloat;
         qryWareOrderInSKU.fieldByname('NotFullSign').AsString:='F';

         qryWareOrderInSKU.Fieldbyname('skuspec').Asstring   :=datatmp.qryTmp.fieldbyname('skuspec').Asstring;
         qryWareOrderInSKU.Fieldbyname('color').Asstring     :=datatmp.qryTmp.fieldbyname('color').Asstring;
         qryWareOrderInSKU.Fieldbyname('sku_customerID').Asstring:=datatmp.qryTmp.fieldbyname('customerno').Asstring;
         qryWareOrderInSKU.Fieldbyname('skumodel').Asstring  :=datatmp.qryTmp.fieldbyname('skumodel').Asstring;

         OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                               +'  from skuprice '
                               +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                               +'   and skuid="'+datatmp.qryTmp.fieldbyname('skuid').AsString+'"'
                               +'   and uomtype="'+qryWareOrderInSKU.fieldbyname('CostUOMType').AsString+'"'
                               +'   and userid like "'+_userid+'%"'
                );
         qryWareOrderInSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
         qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
         qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
         qryWareOrderInSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
         qryWareOrderInSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
      end else
      begin
         if DataState in Setdcs then
         begin
           strskuname:=grdSKU.InplaceEditor.GetEditingText;
           qrySelect:=PGetSKUSelect('','','D','',strskuname);
           qrySelect.First;
           i:=0;
           while not qrySelect.Eof do
           begin
               if i=0 then
               begin
                 qryWareOrderInSKU.edit;
                 qryWareOrderInEdit.Edit;
                 qryWareOrderInEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
                 qryWareOrderInEdit.fieldbyname('Quantity').AsFloat        :=qryselect.fieldbyname('Quantity_set').AsFloat;
                 qryWareOrderInEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
               end else
               begin
                 try qryWareOrderInSKUBeforePost(qryWareOrderInSKU);
                 except break;
                 end;
                 qryWareOrderInSKU.append;
                 qryWareOrderInSKU.fieldbyname('sno').Asinteger:=-1;
                 qryWareOrderInSKU.fieldByname('jobno').AsString:=qryWareOrderInEdit.fieldbyname('jobno').AsString;
                 qryWareOrderInSKU.fieldByname('userid').AsString:=qryWareOrderInEdit.fieldbyname('userid').AsString;
               end;
               qryWareOrderInSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
               qryWareOrderInSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
               strGetCd := qryselect.fieldbyname('SKUName').asstring;;
               if qryselect.Fieldbyname('LotCode').asstring<>'' then
                 qryWareOrderInSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
               if qryselect.fieldbyname('Quantity').AsFloat<>0 then
                 qryWareOrderInSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
               if qryselect.Fieldbyname('QualityName').asstring<>'' then
                 qryWareOrderInSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring      ;
               qryWareOrderInSKU.fieldbyname('QuantityUOM').asstring           :=qryselect.fieldbyname('QuantityUOM').asstring         ;
               qryWareOrderInSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring         ;
               qryWareOrderInSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring        ;
               qryWareOrderInSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring        ;
               qryWareOrderInSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring          ;
               if qryWareOrderInSKU.fieldByname('cusid').AsString='' then
                 qryWareOrderInSKU.fieldByname('cusid').AsString           :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
               if qryWareOrderInSKU.fieldByname('cusname').AsString='' then
                 qryWareOrderInSKU.fieldByname('cusname').AsString         :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;
               if qryWareOrderInSKU.fieldByname('shippercusid').AsString='' then
                 qryWareOrderInSKU.fieldByname('shippercusid').AsString    :=qryWareOrderInEdit.fieldbyname('costcusid').AsString;
               if qryWareOrderInSKU.fieldByname('shippercusname').AsString='' then
                 qryWareOrderInSKU.fieldByname('shippercusname').AsString  :=qryWareOrderInEdit.fieldbyname('costcusname').AsString      ;

               qryWareOrderInSKU.fieldbyname('TagEachUOM').Asstring          :='';

               qryWareOrderInSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
               qryWareOrderInSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
               qryWareOrderInSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
               qryWareOrderInSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
               if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
                  qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
               else
                  qryWareOrderInSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
               qryWareOrderInSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
               qryWareOrderInSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
               qryWareOrderInSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
               qryWareOrderInSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
               qryWareOrderInSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
               qryWareOrderInSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
               qryWareOrderInSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
               qryWareOrderInSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
               qryWareOrderInSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
               qryWareOrderInSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;
               qryWareOrderInSKU.fieldByname('NotFullSign').AsString:='F';

               qryWareOrderInSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
               qryWareOrderInSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
               qryWareOrderInSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
               qryWareOrderInSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

               OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                     +'  from skuprice '
                                     +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderInEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                     +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                     +'   and uomtype="'+qryWareOrderInSKU.fieldbyname('CostUOMType').AsString+'"'
                                     +'   and userid like "'+_userid+'%"'
                      );
               qryWareOrderInSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
               qryWareOrderInSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
               qryWareOrderInSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
               qryWareOrderInSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
               qryWareOrderInSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
               qrySelect.Next;
               Inc(i);
             end;
          end;
      end;
   end;
   opensql(datatmp.qryTmp1,'select top 1 * from sku(nolock) where skuname="'+grdSKU.InplaceEditor.GetEditingText+'"');
   if datatmp.qryTmp1.RecordCount<1 then
   begin
      ErrorText:='请重新输入商品名称或选择商品！';
      Accept:=false;
   end;
end;

end.


