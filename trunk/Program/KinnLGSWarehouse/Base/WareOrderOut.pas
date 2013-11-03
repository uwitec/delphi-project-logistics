unit WareOrderOut;

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
  TfrmWareOrderOut = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btnEdit: TKBitBtn;
//
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
    tbsWareOrderOriSKU: TdxTabSheet;
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
    grdOriSKU: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
    edtSKUName: TdxDBGridButtonColumn;
    edtQuantity: TdxDBGridCurrencyColumn;
    edtPiece: TdxDBGridCurrencyColumn;
    edtArea: TdxDBGridCurrencyColumn;
    edtLotCode: TdxDBGridColumn;
    edtQualityName: TdxDBGridColumn;
    edtGrossWeight: TdxDBGridCurrencyColumn;
    edtcasing1: TdxDBGridCurrencyColumn;
    edtCasing2: TdxDBGridCurrencyColumn;
    edtCasing3: TdxDBGridCurrencyColumn;
    popWareOrderOriSKU: TPopupMenu;
    mitAddOriSKU: TMenuItem;
    mitDelOriSKU: TMenuItem;
    edtCusid: TdxDBGridButtonColumn;
    cmbLocationID: TdxDBGridButtonColumn;
    edtshippercusid: TdxDBGridButtonColumn;
    edtVolume: TdxDBGridCurrencyColumn;
    edtNetWeight: TdxDBGridCurrencyColumn;
    edtCasing4: TdxDBGridCurrencyColumn;
    edtCasing5: TdxDBGridCurrencyColumn;
    edtSKU_CostTotal: TdxDBGridCurrencyColumn;
    dtdManufactureDate: TdxDBGridDateColumn;
    popWareOrderSKU: TPopupMenu;
    mitAddSKU: TMenuItem;
    mitDelSKU: TMenuItem;
    N1: TMenuItem;
    mitSKU_IN: TMenuItem;
    mitSKU_IN_F: TMenuItem;
    mitLIInventory: TMenuItem;
    N2: TMenuItem;
    mitOrder_IN: TMenuItem;
    edtPrice: TdxDBGridCurrencyColumn;
    edtcusno: TdxDBGridColumn;
    edtOrderType: TKinDbPickEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    OrderTypeName: TdxDBGridColumn;
    ckbOriOperationType: TdxDBGridCheckColumn;
    opname: TdxDBGridButtonColumn;
    ShipperopidOri: TdxDBGridButtonColumn;
    GMSStickyLabel8: TGMSStickyLabel;
    edtCostcusid: TdxDBButtonEdit;
    UserName: TdxDBGridColumn;
    orderdatesj: TdxDBGridColumn;
    CheckSKUED: TdxDBGridColumn;
    ppmEdit: TPopupMenu;
    mitOperation: TMenuItem;
    SKU_CustomerID: TdxDBGridColumn;
    Remark: TdxDBGridColumn;
    SkuNameOri: TdxDBGridColumn;
    QuantityOri: TdxDBGridColumn;
    Tasked: TdxDBGridColumn;
    dtdactualdate: TdxDBDateEdit;
    timtactualdate: TdxDBTimeEdit;
    GMSStickyLabel17: TGMSStickyLabel;
    sequencenum: TdxDBGridColumn;
    cmbQUANTITYUOM: TdxDBGridKinPickColumn;
    cmbPieceUOM: TdxDBGridKinPickColumn;
    cmbVolumeUOM: TdxDBGridKinPickColumn;
    cmbAreaUOM: TdxDBGridKinPickColumn;
    cmbWeightUOM: TdxDBGridKinPickColumn;
    cmbuom1: TdxDBGridKinPickColumn;
    cmbuom2: TdxDBGridKinPickColumn;
    cmbUom3: TdxDBGridKinPickColumn;
    cmbUom4: TdxDBGridKinPickColumn;
    cmbUom5: TdxDBGridKinPickColumn;
    cmbCostUOMType: TdxDBGridKinPickColumn;
    cmbCurrcd: TdxDBGridKinPickColumn;
    cmbTagEachUOM: TdxDBGridKinPickColumn;
    ppmCheck: TPopupMenu;
    mitCheck: TMenuItem;
    mitCheckCancel: TMenuItem;
    Costcusname: TdxDBGridColumn;
    Cusbillno: TdxDBGridColumn;
    Jobnoindp: TdxDBGridCheckColumn;
    Jobnooridp: TdxDBGridCheckColumn;
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
    radLoadType: TKDBRadioGroup;
    iusername: TdxDBGridColumn;
    cmbShipcusname: TdxDBGridButtonColumn;
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
    CostcusnameOri: TdxDBGridButtonColumn;
    N4: TMenuItem;
    edtCustomsNO: TdxDBEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    CarriageOri: TdxDBGridCurrencyColumn;
    CarriagetotalOri: TdxDBGridCurrencyColumn;
    InsuranceOri: TdxDBGridCurrencyColumn;
    InsurancetotalOri: TdxDBGridCurrencyColumn;
    corpno: TdxDBGridColumn;
    SkumodelOri: TdxDBGridColumn;
    ColorOri: TdxDBGridColumn;
    SkuspecOri: TdxDBGridColumn;
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
    RemarkOri: TdxDBGridBlobColumn;
    KSText3: TKSText;
    GMSStickyLabel16: TGMSStickyLabel;
    priceinOri: TdxDBGridCurrencyColumn;
    skucostinOri: TdxDBGridCurrencyColumn;
    ppmprint: TPopupMenu;
    N5: TMenuItem;
    skustandard: TdxDBGridColumn;
    mainorderin: TdxDBGridColumn;
    grdCostquantity: TdxDBGridColumn;
    grdOriCostquantityuom: TdxDBGridPickColumn;
    grdCostquantityOri: TdxDBGridCurrencyColumn;
    pieceori: TdxDBGridColumn;
    piecesl: TdxDBGridColumn;
    piece: TdxDBGridColumn;
    carriagecurrcdOri: TdxDBGridPickColumn;
    mitdelall: TMenuItem;
    outzoneno: TdxDBGridColumn;
    btnopid: TKBitBtn;
    mitjcxhtzd: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    GMSStickyLabel44: TGMSStickyLabel;
    KSText4: TKSText;
    isbond: TdxDBGridColumn;
    customsnoin: TdxDBGridColumn;
    mitordercom: TMenuItem;
    mitcancelcom: TMenuItem;
    dtdordercomdate: TdxDBDateEdit;
    WRquantitytask: TdxDBGridColumn;
    WRquantityact: TdxDBGridColumn;
    WRpiecetask: TdxDBGridColumn;
    WRpieceact: TdxDBGridColumn;
    blno: TdxDBGridColumn;
    ppmprintqd: TPopupMenu;
    MenuItem1: TMenuItem;
    grdmainorderin: TdxDBGridColumn;
    edtIUser: TdxDBButtonEdit;
    GMSStickyLabel31: TGMSStickyLabel;
    udsWareorderOutSkuDetail: TKadoUpdateSql;
    qryWareorderOutSkuDetail: TKADOQuery;
    dtsWareOrderOutOriSKU: TDataSource;
    udsWareOrderOutOriSKU: TKadoUpdateSql;
    qryWareOrderOutOriSKU: TKADOQuery;
    udsWareOrderOutSKU: TKadoUpdateSql;
    dtsWareOrderOutSKU: TDataSource;
    qryWareOrderOutSKU: TKADOQuery;
    udsWareOrderOutEdit: TKadoUpdateSql;
    dtsWareOrderOutEdit: TDataSource;
    qryWareOrderOutEdit: TKADOQuery;
    dtsWareOrderOut: TDataSource;
    qryWareOrderOut: TKADOQuery;
    dxTabSheet1: TdxTabSheet;
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
    GMSStickyLabel49: TGMSStickyLabel;
    edtCarrierName: TKinDbPickEdit;
    GMSStickyLabel50: TGMSStickyLabel;
    edtCarrierNO: TdxDBEdit;
    GMSStickyLabel34: TGMSStickyLabel;
    edtconno: TdxDBBlobEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    edtCarrierDate: TdxDBDateEdit;
    timCarrierDate: TdxDBTimeEdit;
    GMSStickyLabel18: TGMSStickyLabel;
    edtCostopid: TdxDBButtonEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtConDescription: TdxDBBlobEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    edtConQuantityTotal: TdxDBCalcEdit;
    ckbDisaccord: TdxDBCheckEdit;
    ckbcuscheck: TdxDBCheckEdit;
    ckbgoodscheck: TdxDBCheckEdit;
    ckbchecked: TdxDBCheckEdit;
    ckbIstally: TdxDBCheckEdit;
    ckbistrade: TdxDBCheckEdit;
    memRemark1: TdxDBMemo;
    GMSStickyLabel45: TGMSStickyLabel;
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
    GMSStickyLabel26: TGMSStickyLabel;
    edtConsignCusID: TdxDBButtonEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    edtCorpno: TdxDBEdit;
    GMSStickyLabel41: TGMSStickyLabel;
    edtdrivecardno: TdxDBEdit;
    GMSStickyLabel35: TGMSStickyLabel;
    edtRouting: TdxDBBlobEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtSkucost: TdxDBCurrencyEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    cmbCususername: TKinDbPickEdit;
    GMSStickyLabel43: TGMSStickyLabel;
    edtpicktype: TdxDBEdit;
    GMSStickyLabel40: TGMSStickyLabel;
    edtConsCus: TdxDBButtonEdit;
    grdSKU: TdxDBGrid;
    edtSKUSNO: TdxDBGridColumn;
    ckbOperationType: TdxDBGridCheckColumn;
    CostcusnameSKU: TdxDBGridButtonColumn;
    NotFullSign: TdxDBGridCheckColumn;
    edtSKUCusid: TdxDBGridButtonColumn;
    edtSKUShippercusid: TdxDBGridButtonColumn;
    mainordersku: TdxDBGridColumn;
    customsnoinsku: TdxDBGridColumn;
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
    grdoutzoneno: TdxDBGridColumn;
    netweighttask: TdxDBGridColumn;
    netweightact: TdxDBGridColumn;
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
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure mitordercomClick(Sender: TObject);
    procedure mitcancelcomClick(Sender: TObject);
    procedure qryWareOrderOutOriSKUAfterInsert(DataSet: TDataSet);
    procedure qryWareOrderOutOriSKUAfterPost(DataSet: TDataSet);
    procedure qryWareOrderOutOriSKUAfterScroll(DataSet: TDataSet);
    procedure qryWareOrderOutSKUAfterInsert(DataSet: TDataSet);
    procedure qryWareOrderOutSKUAfterPost(DataSet: TDataSet);
    procedure qryWareOrderOutSKUAfterScroll(DataSet: TDataSet);
    procedure qryWareOrderOutSKUBeforePost(DataSet: TDataSet);
    procedure qryWareOrderOutSKUBeforeScroll(DataSet: TDataSet);
    procedure qryWareOrderOutOriSKUBeforeScroll(DataSet: TDataSet);
    procedure qryWareOrderOutOriSKUBeforePost(DataSet: TDataSet);
    procedure btnOrderWithTaskClick(Sender: TObject);
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
    procedure ChangeUOMItem(blnFull:Boolean;pstrUOMType:string);
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

procedure WorkWareOrderOut(CallMode:TDataState;pJobno:string;pqryInput_PreDetail:TQuery;pqryInput_Detail:TQuery;
                        pType:string='';pID_NO:string='');

var
  frmWareOrderOut:TfrmWareOrderOut;//收货

implementation

{$R *.dfm}
Uses Main, kindlg, Saveget,datas,datasTmp,GetUserRight,find,WareOrderType,
     ChooseSKUID,LocationIN,LocationOut,Volume,GetDllPub,GridSelect,OrderSelectCnfg,OrderUp,linprint,
     ChangeSkuName,LocationSKUSelect,Operation,ContainerSkuSelect,WareOrderSelect,LIOSKUDetail,
     dxGridOut,TransAct,WareOrderIn,InPutOrder,LocSkuDetailSelect;

var strpJobno:string;
    strCaption:string;

procedure WorkWareOrderOut(CallMode:TDataState;pJobno:string;pqryInput_PreDetail:TQuery;pqryInput_Detail:TQuery;
                        pType:string='';pID_NO:string='');            
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   strpJobno:=pJobno;
   if frmWareOrderOut<>nil then
   with frmWareOrderOut do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmWareOrderOut:=TfrmWareOrderOut.Create(Application);
 with frmWareOrderOut do
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

    if getSysdata('qdtext')='T' then
    begin
       btnPrint.PopupMenu:=ppmprintqd;
    end;
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

    //单位
    ChangeUOMItem(True,'');
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
              +' where operationtype=-1 '+chr(13)+chr(10)
          +IIF(_Useridcan<>'',
              ' and (wareorder.userid in '+_Useridcan+' or wareorder.iuserid in '+_Useridcan+') ',
              ' and (WareOrder.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or WareOrder.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
              +'   and %where'+chr(13)+chr(10)
              +iif(trim(strJobno)='','',' and WareOrder.jobno="'+strJobno+'" '+chr(13)+chr(10)
                                       +' ')
              ;
    qryWareOrderOut.Close;
    qryWareOrderOut.Sql.Clear;
    qryWareOrderOut.Sql.Add(strsql);
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
              +'        pieceori,piecesl=pieceori-piece,istrade '+chr(13)+chr(10)
              +'   from WareOrder (nolock)'+chr(13)+chr(10)
              +'  where WareOrder.JOBNO=:JOBNO  ';
    qryWareOrderOutEdit.Close;
    qryWareOrderOutEdit.Sql.Clear;
    qryWareOrderOutEdit.Sql.Add(strsql);

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
    qryWareOrderOutOriSKU.Close;
    qryWareOrderOutOriSKU.Sql.Clear;
    qryWareOrderOutOriSKU.Sql.Add(strsql);

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
    qryWareOrderOutSKU.Close;

    qryWareOrderOutSKU.Sql.Clear;
    qryWareOrderOutSKU.Sql.Add(strsql);

    strsql:=' ksp_GetWareorderSkuDetailByJobno @jobno=:jobno ';
    qryWareorderOutSkuDetail.Close;
    qryWareorderOutSkuDetail.SQL.Clear;
    qryWareorderOutSkuDetail.SQL.Add(strsql);
    qryWareorderOutSkuDetail.Filtered:=true;
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
    SetButtonEnabled(ToolPanel,'mitWareOrderOut',trim(_UserOrgid));//设置按钮的有效性
    if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then
    begin
       qryWareOrderOut.MacroByName('where').AsString :='(convert(datetime,convert(char(8),wareorder.createdate,112))>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(datetime,convert(char(8),wareorder.createdate,112))<="'+datetostr(month_end)+'")' ;
    end else
    if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) then
    begin
       qryWareOrderOut.MacroByName('where').AsString :='(convert(datetime,convert(char(8),wareorder.createdate,112))>="'+datetostr(Month_Start)+'")'
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
      end else wql_new}  if _istask='T' then
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

    qryWareOrderOut.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

    qryWareOrderOut.Open;

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
       qryWareOrderOut.open;
       grdWareOrderChangeNodeEx(nil);
       btnAdd.Click;
    end else
    begin
       SetControlState(stBrowse,true);
       qryWareOrderOut.Open;
       grdWareOrderChangeNodeEx(nil);
       if strJobno<>''
       then qryWareOrderOut.locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);

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

procedure TfrmWareOrderOut.CreateParams(var Params: TCreateParams);
begin
   if strpJobno<>'' then
   begin
      self.Formstyle := fsNormal;
      self.Visible := False;
      self.Position := poScreenCenter;
   end;
   self.Caption:='出仓指令';
   inherited CreateParams(Params);
end;

procedure TfrmWareOrderOut.WorkCall(CallMode:TDataState);
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
          if qryWareOrderOut.fieldbyname('jobno').AsString<>'' then
          grdWareOrder.FindNodeByKeyValue(qryWareOrderOut.fieldbyname('jobno').AsString).Selected:=true;
        end;
      stEdit:
        begin
          qryWareOrderOut.Edit;
          EnableEdit;
          //记录修改档案
          qryWareOrderOutEdit.Edit;
          strDel_Task:='';
          stroldlotcode:='';
          data.WareOrder_copyCusID  :='';
          data.WareOrder_copyCusName:='';
          data.WareOrder_Copyshippercusid  :='';
          data.WareOrder_Copyshippercusname:='';
//wql_new          data.wareorder_CopyCostCusid  :='';
//wql_new          data.wareorder_CopyCostCusname:='';
          data.WareOrder_strOrderCusID:='';
          data.WareOrder_strOrderCusName:='';
          data.WareOrder_strOrderShippercusid:='';
          data.WareOrder_strOrderShippercusname:='';
          data.strCostcountuom:='';
          qryWareOrderOutEdit.FieldByName('ModifyName').Asstring:=_LoginName;
          qryWareOrderOutEdit.fieldByname('ModifyDate').AsDatetime:=Now;
          //在修改的状态下，对qryWareOrderOutOriSKU循环
          qryWareOrderOutOriSKU.DisableControls;
          Bookmark:= qryWareOrderOutOriSKU.GetBookmark;
          data.Wareorder_maxWareOrderOriSKU:=0;
          qryWareOrderOutOriSKU.First;
          while not qryWareOrderOutOriSKU.Eof do
          begin
            if qryWareOrderOutOriSKU.FieldByName('SNO').AsInteger>data.Wareorder_maxWareOrderOriSKU
               then data.Wareorder_maxWareOrderOriSKU:=qryWareOrderOutOriSKU.FieldByName('SNO').AsInteger;
            qryWareOrderOutOriSKU.Next;
          end;
          qryWareOrderOutOriSKU.GotoBookmark(Bookmark);
          qryWareOrderOutOriSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          qryWareOrderOutOriSKU.EnableControls;
          qryWareOrderOutOriSKUAfterScroll(qryWareOrderOutOriSKU);
          //在修改的状态下，对qryWareOrderOutSKU循环
//为了控制库存 ,创建临时表，用于保存原始状态的工作号
          ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'     drop table #lskOldSku'+chr(13)+chr(10)
                                +'   CREATE TABLE #lskOldSku '+chr(13)+chr(10)
                                +'     ( '+chr(13)+chr(10)
                                +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                +'       snoin          smallint     not null  '+chr(13)+chr(10)
                                +'      ) '+chr(13)+chr(10)
                                 );
          qryWareOrderOutSKU.DisableControls;
          Bookmark:= qryWareOrderOutSKU.GetBookmark;
          data.Wareorder_maxWareOrderSKU:=0;
          qryWareOrderOutSKU.First;
          while not qryWareOrderOutSKU.Eof do
          begin
//为了控制库存 ,原始状态的工作号
            ExecSql(dataTmp.qryTmp,'  insert into #lskOldSku '+chr(13)+chr(10)
                                  +'     (jobnoin,snoin) '+chr(13)+chr(10)
                                  +'   values (       '+chr(13)+chr(10)
                                  +'"'+qryWareOrderOutSKU.FieldByName('jobnoin').AsString +'",  '+chr(13)+chr(10)
                                  +'"'+qryWareOrderOutSKU.FieldByName('snoin').AsString +'"  '+chr(13)+chr(10)
                                  +'     ) ');
            if qryWareOrderOutSKU.FieldByName('SNO').AsInteger>data.Wareorder_maxWareOrderSKU
               then data.Wareorder_maxWareOrderSKU:=qryWareOrderOutSKU.FieldByName('SNO').AsInteger;
            qryWareOrderOutSKU.Next;
          end;
          qryWareOrderOutSKU.GotoBookmark(Bookmark);
          qryWareOrderOutSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          qryWareOrderOutSKU.EnableControls;
          qryWareOrderOutSKUAfterScroll(qryWareOrderOutSKU);

          LampChange(lsEdit);
        end;
      stInsert:
        begin
//为了控制库存 ,原始状态的工作号
          ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'     drop table #lskOldSku'+chr(13)+chr(10)
                                +'   CREATE TABLE #lskOldSku '+chr(13)+chr(10)
                                +'     ( '+chr(13)+chr(10)
                                +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                +'       snoin          smallint     not null  '+chr(13)+chr(10)
                                +'      ) '+chr(13)+chr(10)
                                 );
          qryWareOrderOut.Append;
          if not blncopy then
            begin
              qryWareOrderOutEdit.Append;
            end;
          strDel_Task:='';
          OldWareOrderOriSKU:=0;
          data.wareorder_maxWareOrderOriSKU:=0;
          stroldlotcode:='';
          OldWareOrderSKU:=0;
          data.Wareorder_maxWareOrderSKU:=0;
          data.WareOrder_copyCusID  :='';
          data.WareOrder_copyCusName:='';
          data.WareOrder_Copyshippercusid  :='';
          data.WareOrder_Copyshippercusname:='';
//wql_new          data.wareorder_CopyCostCusid  :='';
//wql_new          data.wareorder_CopyCostCusname:='';
          data.WareOrder_strOrderCusID:='';
          data.WareOrder_strOrderCusName:='';
          data.WareOrder_strOrderShippercusid:='';
          data.WareOrder_strOrderShippercusname:='';
          data.strCostcountuom :='';

          InitValues;
          EnableEdit;
          //记录档案创建信息
          qryWareOrderOutEdit.Edit;
          qryWareOrderOutEdit.FieldByName('CreateName').Asstring:=_LoginName;
          qryWareOrderOutEdit.fieldByname('CreateDate').AsDatetime:=Now;
          LampChange(lsEdit);
        end;
  end;
  end;
end;

procedure TfrmWareOrderOut.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
    setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
  SetControlState(DataState,False);
  edtOrderID.SetFocus;
  stroldOrderID:=qryWareOrderOutEdit.FieldByName('OrderID').Asstring;
  stroldlotcode:=qryWareOrderOutOriSKU.fieldbyname('LotCode').AsString;
  stroldCustomsNO:=qryWareOrderOutEdit.FieldByName('CustomsNO').Asstring;
  stroldCustomsUnite:=qryWareOrderOutEdit.FieldByName('CustomsUnite').Asstring;

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

  InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+qryWareOrderOutEdit.fieldbyname('costcusid').AsString+'"');
end;

procedure TfrmWareOrderOut.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
    setDisable:TsetInt;
begin
  setDisable:=[];
  if trim(strJobno)='' then
  begin
    if qryWareOrderOut.RecordCount=0 then setDisable:=setDisable+[2,4];
    libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
    if qryWareOrderOut.RecordCount=0 then setDisable:=setDisable-[2,4];
  end else
  begin
    libComControl(self,[2..15]+setDisable,[1]);
  end;
  SetControlState(DataState,False);
  //恢复个控键属性
//  ChangeUOMItem(True,'');
  grdOriSKU.OptionsBehavior:=grdOriSKU.OptionsBehavior-[edgoEditing];
  grdOriSKU.OptionsDB:=grdOriSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdOriSKU.ShowGroupPanel:=True;

  grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior-[edgoEditing];
  grdSKU.OptionsDB:=grdSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdSKU.ShowGroupPanel:=True;
end;

procedure TfrmWareOrderOut.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmWareOrderOut.InitValues;
{初始化时自动生成仓位代码}
var
  strorderid,strDate:string;
begin
  //赋业务联系单号
  opensql(dataTmp.qryTmp,'select datenow=getDate() ');
  strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
  opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                        +'  from genjobno where substring(Jobno,5,2)="WO"' );
  strorderid:='OC'+strDate+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');
  qryWareOrderOutEdit.FieldByName('OrderID').Asstring:=strorderid;
  strWOJobno:=genJobno('WO',strorderid);

  qryWareOrderOutEdit.FieldByName('CustomsUnite').Asstring:='F';

  if blnCopy then
  begin
    blnCopy:=False;
    //qryWareOrderEdit复制
    GatherFromArray(qryWareOrderOutEdit,arrWareOrderEdit,false);
    qryWareOrderOutEdit.FieldByName('JOBNO').Asstring:=strWOJobno;
    qryWareOrderOutEdit.FieldByName('DictateType').Asstring :='出仓指令';

    qryWareOrderOutEdit.fieldByname('UserID').AsString:=_UserID;
    qryWareOrderOutEdit.fieldByname('Username').AsString:=_Username;
    qryWareOrderOutEdit.fieldByname('iuserid').AsString:=_UserID;
    qryWareOrderOutEdit.fieldByname('iusername').AsString:=_Username;
    //qryWareOrderSKU复制
    qryWareOrderOutOriSKU.DisableControls;
    GatherFromArray(qryWareOrderOutOriSKU,arrWareOrderOriSKU,true);
    with qryWareOrderOutOriSKU do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('JOBNO').AsString:=strWOJobno;
        FieldByName('UserID').Asstring:=_UserID;
        if FieldByName('SNO').AsInteger>data.maxWareOrderOriSKU
        then data.maxWareOrderOriSKU:=FieldByName('SNO').AsInteger;
        next;
      end;
      First;
    end;
    qryWareOrderOutOriSKU.EnableControls;
    qryWareOrderOutOriSKUAfterScroll(qryWareOrderOutOriSKU);
  end else
  begin
    if qryInput_PreDetail<>nil then //由接口导入信息
    begin
      blnInserted:=True;//第一次没有关闭窗口时需要的判断
      //qryWareOrderOutEdit
      qryWareOrderOutEdit.Edit;
      qryWareOrderOutEdit.FieldByName('JOBNO').AsString                :=strWOJobno;
      qryWareOrderOutEdit.FieldByName('OperationType').AsString        :=qryInput_PreDetail.FieldByName('OperationType').AsString;
      qryWareOrderOutEdit.FieldByName('OrderDate').AsDateTime          :=Now;
//      qryWareOrderOutEdit.FieldByName('CarrierAccountID').AsString     :=qryInput_PreDetail.FieldByName('CarrierAccountID').AsString;
//      qryWareOrderOutEdit.FieldByName('ConsignAccountID').AsString     :=qryInput_PreDetail.FieldByName('ConsignAccountID').AsString;
//      qryWareOrderOutEdit.FieldByName('CarrierAccountName').AsString   :=qryInput_PreDetail.FieldByName('CarrierAccountName').AsString;
//      qryWareOrderOutEdit.FieldByName('CONSIGNACCOUNTName').AsString   :=qryInput_PreDetail.FieldByName('ConsignAccountName').AsString;
//      qryWareOrderOutEdit.FieldByName('Carbrand').AsString             :=qryInput_PreDetail.FieldByName('Carbrand').AsString;
//      qryWareOrderOutEdit.FieldByName('CarrierName').AsString          :=qryInput_PreDetail.FieldByName('CarrierName').AsString;
//      qryWareOrderOutEdit.FieldByName('CarrierNO').AsString            :=qryInput_PreDetail.FieldByName('CarrierNO').AsString;
      qryWareOrderOutEdit.FieldByName('costcusname').AsString  :=qryInput_PreDetail.FieldByName('cusname').AsString;
      qryWareOrderOutEdit.FieldByName('costcusid').AsString    :=qryInput_PreDetail.FieldByName('AD_CodeCD').AsString;

      qryWareOrderOutEdit.FieldByName('SKUName').AsString              :=qryInput_PreDetail.FieldByName('G_NAME').AsString;
      qryWareOrderOutEdit.FieldByName('piece').AsFloat                 :=qryInput_PreDetail.FieldByName('G_PIECE').AsFloat;
      qryWareOrderOutEdit.FieldByName('GrossWeight').AsFloat           :=qryInput_PreDetail.FieldByName('GROSS').AsFloat;
      qryWareOrderOutEdit.FieldByName('NetWeight').AsFloat             :=qryInput_PreDetail.FieldByName('NETWEIGHT').AsFloat;

     {wql_new  with workAccountCNFGSelect( qryWareOrderOutEdit.FieldByName('costcusid').AsString,
             qryWareOrderOutEdit.FieldByName('costcusname').AsString) do
      if OkFlag then
      begin
        _ACC_PreservingDigit:=PreservingDigit;
        qryWareOrderOutEdit.FieldByName('isbond').Asstring :=isbond;
        if edtOrderType.Text='出仓指令' then
          qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LO_LoadType
        else
          qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LoadType;

        qryWareOrderOutEdit.FieldByName('WO_ContWithLoca').AsString      :=contwithloca;
        qryWareOrderOutEdit.FieldByName('lottracked').AsString        :=lottracked;
        qryWareOrderOutEdit.FieldByName('countrent').AsString         :=countrent;
        qryWareOrderOutEdit.FieldByName('WO_CountLoadCost').AsString     :=WO_CountLoadCost;
        qryWareOrderOutEdit.FieldByName('countcontcost').AsString     :=countcontcost;
        qryWareOrderOutEdit.FieldByName('SKUCOSTCLASSCD').AsString       :=SKUCOSTCLASSCD;
        qryWareOrderOutEdit.FieldByName('WareRentCountType').Asstring    :=WareRentCountType;
        data.WareOrder_strOrderCusID:=iif(AccountID='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,AccountID);
        data.WareOrder_strOrderCusName:=iif(cusname='',qryWareOrderOutEdit.FieldByName('costcusname').AsString,cusname);
        data.WareOrder_strOrderShippercusid:=iif(ShipperAccountID='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,ShipperAccountID);
        data.WareOrder_strOrderShippercusname:=iif(shippercusname='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,shippercusname);
      end; wql_new}
//      qryWareOrderOutEdit.FieldByName('PieceUOM').AsString             :=qryInput_PreDetail.FieldByName('PieceUOM').AsString;
//      qryWareOrderOutEdit.FieldByName('WeightUOM').AsString            :=qryInput_PreDetail.FieldByName('WeightUOM').AsString;
//      qryWareOrderOutEdit.FieldByName('VolumeUOM').AsString            :=qryInput_PreDetail.FieldByName('VolumeUOM').AsString;
//      qryWareOrderOutEdit.FieldByName('AreaUOM').AsString              :=qryInput_PreDetail.FieldByName('AreaUOM').AsString;
//      qryWareOrderOutEdit.FieldByName('OPID').AsString                 :=qryInput_PreDetail.FieldByName('OPID').AsString;
//      qryWareOrderOutEdit.FieldByName('OPName').AsString               :=qryInput_PreDetail.FieldByName('OPName').AsString;
//      qryWareOrderOutEdit.FieldByName('isbond').AsString :=qryInput_PreDetail.FieldByName('isbond').AsString;
//      qryWareOrderOutEdit.FieldByName('WO_Remark').AsString            :=qryInput_PreDetail.FieldByName('WO_Remark').AsString;
//      qryWareOrderOutEdit.FieldByName('QuantityUOM').AsString          :=qryInput_PreDetail.FieldByName('QuantityUOM').AsString;
//      qryWareOrderOutEdit.FieldByName('skucost').AsFloat         :=qryInput_PreDetail.FieldByName('skucost').AsFloat;
      qryWareOrderOutEdit.FieldByName('CustomsNO').AsString            :=qryInput_PreDetail.FieldByName('ENTRY_NO').AsString;

      qryInput_PreDetail:=nil;
      //海关数据导入qryInPut_Detail->qryWareOrderOutSKU
      qryInput_Detail.First;
      qryWareOrderOutOriSKU.DisableControls;
      while not qryInput_Detail.Eof do
      begin
        if not qryInput_Detail.BOF then
        begin
//          if not qryWareOrderSKUBeforePost(qryWareOrderOutSKU) then break;
        end;
        qryWareOrderOutOriSKU.Append;
        qryWareOrderOutOriSKU.FieldByName('jobnoin').AsString        :=qryInput_Detail.FieldByName('jobnoin').AsString;
        qryWareOrderOutOriSKU.FieldByName('snoin').AsInteger         :=qryInput_Detail.FieldByName('snoin').AsInteger;
        qryWareOrderOutOriSKU.FieldByName('ldsnoin').AsInteger      :=qryInput_Detail.FieldByName('ldsnoin').AsInteger;
        qryWareOrderOutOriSKU.FieldByName('jobnoinf').AsString      :=qryInput_Detail.FieldByName('jobnoinf').AsString;
        qryWareOrderOutOriSKU.FieldByName('snoinf').AsInteger       :=qryInput_Detail.FieldByName('snoinf').AsInteger;
        qryWareOrderOutOriSKU.FieldByName('ldsnoinf').AsInteger    :=qryInput_Detail.FieldByName('ldsnoinf').AsInteger;
        qryWareOrderOutOriSKU.FieldByName('SKUID').AsString           :=qryInput_Detail.FieldByName('SkuID').AsString;
        qryWareOrderOutOriSKU.FieldByName('QualityName').AsString     :='正品';
        qryWareOrderOutOriSKU.FieldByName('SKUName').AsString         :=qryInput_Detail.FieldByName('bdSKUName').AsString;
        qryWareOrderOutOriSKU.FieldByName('QUANTITYUOM').AsString     :=qryInput_Detail.FieldByName('UOMp').AsString;
        qryWareOrderOutOriSKU.FieldByName('PieceUOM').AsString        :=qryInput_Detail.FieldByName('UOMp').AsString;
        qryWareOrderOutOriSKU.FieldByName('WeightUOM').AsString       :='KG';
        qryWareOrderOutOriSKU.FieldByName('VolumeUOM').AsString       :='CBM';
        qryWareOrderOutOriSKU.FieldByName('AreaUOM').AsString         :='SQM';
        qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat       :=iif(qryInput_Detail.FieldByName('Piece').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Piece').AsFloat,
                                                                 qryInput_Detail.FieldByName('QTY').AsFloat) ;
        qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat    :=iif(qryInput_Detail.FieldByName('Quantity').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Quantity').AsFloat,
                                                                 qryInput_Detail.FieldByName('QTY').AsFloat);
        qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat   :=iif(qryInput_Detail.FieldByName('NetWeight').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('NetWeight').AsFloat,
                                                                 qryInput_Detail.FieldByName('G_WEIGHT').AsFloat);
        qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat :=iif(qryInput_Detail.FieldByName('GrossWeight').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('GrossWeight').AsFloat,
                                                                 qryInput_Detail.FieldByName('G_WEIGHT').AsFloat);
        qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat      :=iif(qryInput_Detail.FieldByName('Volume').AsFloat<>0,
                                                                 qryInput_Detail.FieldByName('Volume').AsFloat,
                                                                 strtoFloat(iif(qryInput_Detail.FieldByName('G_VOL').AsString='','0',
                                                                                qryInput_Detail.FieldByName('G_VOL').AsString)));
        qryWareOrderOutOriSKU.FieldByName('Area').AsFloat        :=qryInput_Detail.FieldByName('Area').AsFloat;
        qryWareOrderOutOriSKU.FieldByName('cusid').AsString         :=iif(qryInput_Detail.FieldByName('cusid').AsString<>'',
                                                                        qryInput_Detail.FieldByName('cusid').AsString,
                                                                        qryWareOrderOutEdit.FieldByName('costcusid').AsString);
        qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString  :=iif(qryInput_Detail.FieldByName('shippercusid').AsString<>'',
                                                                        qryInput_Detail.FieldByName('shippercusid').AsString,
                                                                        qryWareOrderOutEdit.FieldByName('costcusid').AsString);
        qryWareOrderOutOriSKU.FieldByName('cusname').AsString       :=iif(qryInput_Detail.FieldByName('cusname').AsString<>'',
                                                                        qryInput_Detail.FieldByName('cusname').AsString,
                                                                        qryWareOrderOutEdit.FieldByName('costcusname').AsString);
        qryWareOrderOutOriSKU.FieldByName('shippercusname').AsString:=iif(qryInput_Detail.FieldByName('ShipAccName').AsString<>'',
                                                                        qryInput_Detail.FieldByName('ShipAccName').AsString,
                                                                        qryWareOrderOutEdit.FieldByName('costcusname').AsString);

        qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring         :=qryInput_Detail.fieldbyname('IN_ENTRY_NO').asstring ;
        qryWareOrderOutOriSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderOutEdit.fieldbyname('CustomsNO').asstring ;
        qryWareOrderOutOriSKU.fieldbyname('WO_CCAID').asstring          :=qryInput_Detail.FieldByName('costcusid').AsString;
        qryWareOrderOutOriSKU.Fieldbyname('price').asFloat           :=qryInput_Detail.fieldbyname('price').asFloat ;
        qryWareOrderOutOriSKU.Fieldbyname('currcd').asstring  :=qryInput_Detail.fieldbyname('currcd').asstring ;
        qryWareOrderOutOriSKU.fieldbyname('skucost').asFloat      :=qryInput_Detail.fieldbyname('skucost').asFloat ;
        qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring   :=qryInput_Detail.fieldbyname('costuomtype').asstring ;
        qryWareOrderOutOriSKU.FieldByName('TagEachUOM').Asstring        :=qryInput_Detail.fieldbyname('TagEachUOM').asstring ;
        qryWareOrderOutOriSKU.FieldByName('LocationID').Asstring        :=qryInput_Detail.fieldbyname('locid').asstring ;
        qryWareOrderOutOriSKU.FieldByName('LotCode').Asstring           :=qryInput_Detail.fieldbyname('LotCode').asstring ;
        qryWareOrderOutOriSKU.FieldByName('WO_TagEach').Asstring        :=qryInput_Detail.fieldbyname('WO_TagEach').asstring ;
        qryWareOrderOutOriSKU.FieldByName('contwithloca').Asstring   :=qryInput_Detail.fieldbyname('contwithloca').asstring ;
        qryWareOrderOutOriSKU.FieldByName('lottracked').Asstring     :=qryInput_Detail.fieldbyname('lottracked').asstring ;
        qryWareOrderOutOriSKU.FieldByName('countrent').Asstring      :=qryInput_Detail.fieldbyname('countrent').asstring ;
        qryWareOrderOutOriSKU.FieldByName('countcontcost').Asstring  :=qryInput_Detail.fieldbyname('countcontcost').asstring ;
        qryWareOrderOutOriSKU.FieldByName('WO_CCAID').Asstring          :=qryInput_Detail.fieldbyname('WO_CCAID').asstring ;
        qryWareOrderOutOriSKU.FieldByName('loadcostone').Asstring    :=qryInput_Detail.fieldbyname('loadcostone').asstring ;
//wql_new        qryWareOrderOutOriSKU.FieldByName('LI_QuantityRemain').Asstring :=qryInput_Detail.fieldbyname('LI_QuantityRemain').asstring ;
        qryWareOrderOutOriSKU.FieldByName('skucostclasscd').Asstring    :=qryInput_Detail.fieldbyname('skucostclasscd').asstring ;
        qryWareOrderOutOriSKU.FieldByName('isbond').Asstring:=qryInput_Detail.fieldbyname('isbond').asstring ;
        qryWareOrderOutOriSKU.FieldByName('warerentcounttype').Asstring :=qryInput_Detail.fieldbyname('warerentcounttype').asstring ;
        qryWareOrderOutOriSKU.FieldByName('LocationBillno').Asstring    :=qryInput_Detail.fieldbyname('LocationBillno').asstring ;
        qryWareOrderOutOriSKU.FieldByName('OrderStatus').Asstring:='H';
        qryWareOrderOutOriSKU.FieldByName('NotFullSign').Asstring:='F';
        qryInput_Detail.next;
      end;
      qryWareOrderOutOriSKU.EnableControls;

      qryWareOrderOutOriSKUAfterScroll(qryWareOrderOutOriSKU);
      if pcWareOrder.ActivePage<>tbsEdit then
         pcWareOrder.ActivePage:=tbsEdit;
      if pcInfo.ActivePage<>tbsWareOrderOriSKU then
         pcInfo.ActivePage:=tbsWareOrderOriSKU;
      self.ActiveControl:=grdOriSKU;
    end else
    begin
    //qryWareOrderOutEdit

     {wql_new  with workAccountCNFGSelect( qryWareOrderOutEdit.FieldByName('costcusid').AsString,
             qryWareOrderOutEdit.FieldByName('costcusname').AsString) do
      if OkFlag then
      begin
        _ACC_PreservingDigit:=PreservingDigit;
        qryWareOrderOutEdit.FieldByName('isbond').Asstring :=isbond;
        if edtOrderType.Text='出仓指令' then
          qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LO_LoadType
        else
          qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LoadType;
        qryWareOrderOutEdit.FieldByName('contwithloca').AsString      :=contwithloca;
        qryWareOrderOutEdit.FieldByName('lottracked').AsString        :=lottracked;
        qryWareOrderOutEdit.FieldByName('countrent').AsString         :=countrent;
        qryWareOrderOutEdit.FieldByName('WO_CountLoadCost').AsString     :=WO_CountLoadCost;
        qryWareOrderOutEdit.FieldByName('countcontcost').AsString     :=countcontcost;
        qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString       :=skucostclasscd;
        qryWareOrderOutEdit.FieldByName('warerentcounttype').Asstring    :=warerentcounttype;
        data.WareOrder_strOrderCusID:=iif(cusid='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,cusid);
        data.WareOrder_strOrderCusName:=iif(cusname='',qryWareOrderOutEdit.FieldByName('costcusname').AsString,cusname);
        data.WareOrder_strOrderShippercusid:=iif(shippercusid='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,shippercusid);
        data.WareOrder_strOrderShippercusname:=iif(shippercusname='',qryWareOrderOutEdit.FieldByName('costcusname').AsString,shippercusname);
      end; wql_new}

      qryWareOrderOutEdit.FieldByName('Disaccord').Asstring:='';
//wql_new      qryWareOrderOutEdit.FieldByName('AutoTotal').Asstring:='T';
      qryWareOrderOutEdit.FieldByName('OrderStatus').Asstring:='H';
      qryWareOrderOutEdit.FieldByName('OperationType').AsInteger:=-1;
      qryWareOrderOutEdit.FieldByName('OrderDate').AsDateTime:=Now;
      qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring:=_ACC_warerentcounttype;
      qryWareOrderOutEdit.fieldbyname('warerentcounttypeout').asstring:=_ACC_warerentcounttypeout;
//      qryWareOrderOutEdit.fieldbyname('iuserid').asstring          :=_ACC_iuserid;
//      qryWareOrderOutEdit.fieldbyname('iusername').asstring        :=_ACC_iusername;
      qryWareOrderOutEdit.fieldbyname('loadtype').asstring         :=_ACC_loadtype;
      qryWareOrderOutEdit.fieldbyname('contwithloca').asstring     :=_ACC_contwithloca;
      qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=_ACC_lottracked;
      qryWareOrderOutEdit.fieldbyname('isbond').asstring           :=_ACC_isbond;
      qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=_ACC_countrent;
      qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=_ACC_countcontcost;
//      qryWareOrderOutEdit.fieldbyname('tageach').asstring          :=_ACC_tageach;
      qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring   :=_ACC_skucostclasscd;
    end;

    qryWareOrderOutEdit.FieldByName('JOBNO').Asstring:=strWOJOBNO;
    qryWareOrderOutEdit.FieldByName('DictateType').Asstring :='出仓指令';
    qryWareOrderOutEdit.FieldByName('UserID').Asstring:=_UserID;
    qryWareOrderOutEdit.FieldByName('Username').Asstring:=_Username;
    qryWareOrderOutEdit.fieldByname('iuserid').AsString:=_UserID;
    qryWareOrderOutEdit.fieldByname('iusername').AsString:=_Username;
  end;

  //qryWareOrderOut
  qryWareOrderOut.fieldbyname('JOBNO').asstring     :=qryWareOrderOutEdit.fieldbyname('JOBNO').asstring;
  qryWareOrderOut.FieldByName('DictateType').Asstring :='出仓指令';
  dataTmp.qryTmp.Close;
end;

procedure TfrmWareOrderOut.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
//
end;


procedure TfrmWareOrderOut.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  if blnCreate then
  begin
    caption:='出仓指令';
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

function TfrmWareOrderOut.Gather:boolean;
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
     qryWareOrderOutOriSKU.First;
     if qryWareOrderOutOriSKU.RecordCount>1 then
     begin
       {if _Language='CAPTIONC'then
          _strmessage:='原始指令信息只能有唯一商品信息!'
       else
          _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','007'), mtWarning, [mbOK], 0);
        exit;
     end;
  end;
{  if (_isneedop<>'F') and (edtCostopid.Text='') then
  begin
     if pcInfo.ActivePage<>tbsWareOrder then pcInfo.ActivePage:=tbsWareOrder;
     kMessageDlg('业务员不能为空！', mtWarning, [mbOK], 0);
     edtCostopid.SetFocus;
     exit;}

  extQuantity:=0;
  extNetWeightRemain:=0;
  extCostquantity:=0;
  extpiece:=0;
  extoriQuantity:=0;
  extoripiece:=0;
  strmainorder:='';
  strmainorderin:='';
  qryWareOrderOutSKU.DisableControls;
  qryWareOrderOutSKU.First;
  while not qryWareOrderOutSKU.Eof do
  begin
     extQuantity:=extQuantity+qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
     extpiece:=extpiece+qryWareOrderOutSKU.FieldByName('piece').AsFloat;
     extNetWeightRemain:=extNetWeightRemain+qryWareOrderOutSKU.FieldByName('NetWeight').AsFloat;
     extCostquantity:=extCostquantity+qryWareOrderOutSKU.fieldbyname('costquantity').AsFloat;
     strmainorder:=strmainorder+qryWareOrderOutOriSKU.fieldbyname('mainorder').AsString;
//     strmainorderin:=strmainorderin+qryWareOrderOutOriSKU.fieldbyname('mainorderin').AsString;
     qryWareOrderOutSKU.Next;
  end;
  qryWareOrderOutSKU.EnableControls;
  qryWareOrderOutOriSKU.Edit;

  qryWareOrderOutOriSKU.DisableControls;
  qryWareOrderOutOriSKU.First;
  while not qryWareOrderOutOriSKU.Eof do
  begin
     extoriQuantity:=extoriQuantity+qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
     extoripiece:=extoripiece+qryWareOrderOutOriSKU.FieldByName('piece').AsFloat;
     qryWareOrderOutOriSKU.Next;
  end;
  qryWareOrderOutOriSKU.EnableControls;
  qryWareOrderOutOriSKU.Edit;
  qryWareOrderOutOriSKU.FieldByName('QuantityReMain').AsFloat:=qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat-extQuantity;
//wql_new  qryWareOrderOutOriSKU.FieldByName('NetWeightRemain').AsFloat:=qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat-extNetWeightRemain;
  qryWareOrderOutEdit.Edit;
  qryWareOrderOutEdit.FieldByName('QuantityOri').AsFloat :=extoriQuantity;
  qryWareOrderOutEdit.FieldByName('PieceOri').AsFloat    :=extoripiece;
  qryWareOrderOutEdit.FieldByName('Piecesl').AsFloat    :=qryWareOrderOutEdit.FieldByName('PieceOri').AsFloat-qryWareOrderOutOriSKU.FieldByName('piece').AsFloat;
  qryWareOrderOutEdit.FieldByName('SkuNameOri').AsString :=qryWareOrderOutOriSKU.FieldByName('SkuName').AsString;
  qryWareOrderOutEdit.FieldByName('Quantity').AsFloat    :=extQuantity;
  qryWareOrderOutEdit.FieldByName('piece').AsFloat    :=extpiece;
  qryWareOrderOutEdit.FieldByName('costquantity').AsFloat:=extCostquantity;
//  qryWareOrderOutEdit.FieldByName('mainorderin').AsString:=qryWareOrderOutOriSKU.FieldByName('mainorderin').AsString;


  if (_DB_Order='T') and (qryWareOrderOutOriSKU.FieldByName('QuantityReMain').AsFloat<0) then
  begin
     kMessageDlg(GetMessage('frmWareOrderDxALL','047'), mtWarning, [mbOK], 0);    //校验后指令数量大于原始指令数量! Added by wql 2006.2.14 14:36:29
     exit;
  end;

  {if (_DB_Order='T') and (qryWareOrderOutOriSKU.FieldByName('NetWeightRemain').AsFloat<0) then
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
    qryWareOrderOutOriSKU.DisableControls;
    qryWareOrderOutOriSKU.first;
    while not qryWareOrderOutOriSKU.eof do
    begin
      //批次控制
      if (qryWareOrderOutEdit.fieldbyname('lottracked').asstring='T')
      and (qryWareOrderOutOriSKU.fieldbyname('LotCode').asstring='') then
      begin
        {if _Language='CAPTIONC'then
           _strmessage:='批次不能为空!'
        else
           _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','009'), mtWarning, [mbOK], 0);
        if pcInfo.activepage<>tbsWareOrderOriSKU
        then pcInfo.activepage:=tbsWareOrderOriSKU;
        grdOriSKU.setfocus;
        qryWareOrderOutOriSKU.enablecontrols;
        exit;
      end;
      qryWareOrderOutOriSKU.Edit;
      qryWareOrderOutOriSKU.fieldbyname('Jobno').asstring :=qryWareOrderOutEdit.fieldbyname('Jobno').asstring;
      qryWareOrderOutOriSKU.fieldbyname('OPERATIONTYPE').asInteger:=-1;
      qryWareOrderOutOriSKU.fieldbyname('userid').asstring:=qryWareOrderOutEdit.fieldbyname('userid').asstring;
      qryWareOrderOutOriSKU.fieldbyname('username').asstring:=qryWareOrderOutEdit.fieldbyname('username').asstring;
      qryWareOrderOutOriSKU.fieldbyname('OrderDate').asDateTime:=qryWareOrderOutEdit.fieldbyname('OrderDate').asDateTime;
      qryWareOrderOutOriSKU.fieldbyname('orderid').asstring:=qryWareOrderOutEdit.fieldbyname('orderid').asstring;
      qryWareOrderOutOriSKU.fieldbyname('mainorder').asstring:=qryWareOrderOutEdit.fieldbyname('mainorder').asstring;
      qryWareOrderOutOriSKU.fieldbyname('corpno').asstring:=qryWareOrderOutEdit.fieldbyname('corpno').asstring;
      qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring:=qryWareOrderOutEdit.fieldbyname('CustomsNO').asstring;

  //wql_05/05/10 出仓指令挑选商品时取进仓费用关系人，因此只需对进仓指令的商品信息赋费用关系人
//      qryWareOrderOutOriSKU.fieldbyname('costcusid').asstring:=qryWareOrderOutEdit.fieldbyname('costcusid').asstring;
//      qryWareOrderOutOriSKU.fieldbyname('costcusname').asstring:=qryWareOrderOutEdit.fieldbyname('costcusname').asstring;
      qryWareOrderOutOriSKU.Next;
    end;
    qryWareOrderOutOriSKU.First;
    qryWareOrderOutOriSKU.EnableControls;
    qryWareOrderOutOriSKUAfterScroll(qryWareOrderOutOriSKU);

  //指令商品
    qryWareOrderOutSKU.DisableControls;
    qryWareOrderOutSKU.first;
    while not qryWareOrderOutSKU.eof do
    begin
      //批次控制
      if (qryWareOrderOutEdit.fieldbyname('lottracked').asstring='T')
      and (qryWareOrderOutSKU.fieldbyname('LotCode').asstring='') then
      begin
        {if _Language='CAPTIONC'then
           _strmessage:='批次不能为空!'
        else
           _strmessage:='';}
        kMessageDlg(GetMessage('frmWareOrderDxALL','009'), mtWarning, [mbOK], 0);
        if pcInfo.activepage<>tbsWareOrder
        then pcInfo.activepage:=tbsWareOrder;
        grdSKU.setfocus;
        qryWareOrderOutSKU.enablecontrols;
        exit;
      end;
      strwarning:='';
      if ((qryWareOrderOutEdit.FieldByName('jobnoin').AsString<>'')
      and (qryWareOrderOutSKU.FieldByName('jobnoine').AsString='')) then
      begin
         strwarning:=strwarning+iif(_language='CAPTIONC','序号为','')+qryWareOrderOutSKU.FieldByName('sno').asstring
                               +iif(_language='CAPTIONC','商品名称为','')+qryWareOrderOutSKU.FieldByName('skuname').asstring+chr(13)+chr(10);
      end;
      qryWareOrderOutSKU.Edit;
      qryWareOrderOutSKU.fieldbyname('Jobno').asstring :=qryWareOrderOutEdit.fieldbyname('Jobno').asstring;
      qryWareOrderOutSKU.fieldbyname('OPERATIONTYPE').asInteger:=-1;
      qryWareOrderOutSKU.fieldbyname('username').asstring:=qryWareOrderOutEdit.fieldbyname('username').asstring;
      qryWareOrderOutSKU.fieldbyname('userid').asstring:=qryWareOrderOutEdit.fieldbyname('userid').asstring;
      qryWareOrderOutSKU.fieldbyname('orderid').asstring:=qryWareOrderOutEdit.fieldbyname('orderid').asstring;
      qryWareOrderOutSKU.fieldbyname('OrderDate').asDateTime:=qryWareOrderOutEdit.fieldbyname('OrderDate').asDateTime;
      qryWareOrderOutSKU.fieldbyname('mainorder').asstring:=qryWareOrderOutEdit.fieldbyname('mainorder').asstring;
      qryWareOrderOutSKU.fieldbyname('corpno').asstring:=qryWareOrderOutEdit.fieldbyname('corpno').asstring;

      if qryWareorderOutSkuDetail.active then
      begin
         grdSKUChangeNodeEx(nil);
         qryWareorderOutSkuDetail.First;
         while not qryWareorderOutSkuDetail.Eof do
         begin
            qryWareorderOutSkuDetail.Edit;
            qryWareorderOutSkuDetail.fieldbyname('jobno').asstring:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
            qryWareorderOutSkuDetail.fieldbyname('quantityremain').AsFloat:=qryWareorderOutSkuDetail.fieldbyname('quantity').AsFloat;
            qryWareorderOutSkuDetail.fieldbyname('lotcode').asstring:=qryWareOrderOutSKU.fieldbyname('lotcode').AsString;
            qryWareorderOutSkuDetail.Next;
         end;
       end;
    qryWareOrderOutSKU.Next;
    end;
    qryWareOrderOutSKU.First;
    qryWareOrderOutSKU.EnableControls;
    qryWareOrderOutSKUAfterScroll(qryWareOrderOutSKU);
   //wql.11.16这段代码曾造惨烈杀害,后来被发现,今天让她复生,后观者如果要杀害她在群里面说个理由先
   //这段代码是用来提示明细未对应原始指令用的
    if strwarning<>'' then
    begin
       kMessageDlg(strwarning+GetMessage('frmWareOrderDxALL','010'), mtWarning, [mbOK], 0);
       if pcInfo.activepage<>tbsWareOrder
       then pcInfo.activepage:=tbsWareOrder;
       grdSKU.setfocus;
    //   exit;
    end;

    //判断LocationBillNO是否有重复
    if stroldOrderID<>qryWareOrderOutEdit.FieldByName('OrderID').Asstring then
    begin
      opensql(dataTmp.qryTmp,'select LBNOnum=count(1)'
                    +'  from WareOrder '
                    +' where OrderID="'+qryWareOrderOutEdit.FieldByName('OrderID').Asstring+'"');
      if dataTmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0 then
         if KmessageDlg(GetMessage('frmWareOrderDxALL','011'),mtConfirmation,[mbYes,mbNo],0)=mrNO then//iif(_language='CAPTIONC','存在相同的指令单号,是否要保存?',''
            exit;
    end;

    //判断CustomsNO是否有重复
    if (stroldCustomsNO<>qryWareOrderOutEdit.FieldByName('CustomsNO').Asstring) then
    begin
      opensql(dataTmp.qryTmp,'select LBNOnum=count(1)'
                    +'  from WareOrder '
                    +' where CustomsNO="'+qryWareOrderOutEdit.FieldByName('CustomsNO').Asstring+'"');
      if (dataTmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0) then
         if KmessageDlg(GetMessage('frmWareOrderDxALL','012'),mtConfirmation,[mbYes,mbNo],0)=mrNO then//iif(_language='CAPTIONC','存在相同的报关单号,是否要保存?','')
            exit;
    end;

    //给假主库信息付值
    qryWareOrderOut.FieldByName('OrderID').Asstring:= qryWareOrderOutEdit.FieldByName('OrderID').AsString ;
    qryWareOrderOut.FieldByName('OrderDate').Asstring:= qryWareOrderOutEdit.FieldByName('OrderDate').AsString ;
    qryWareOrderOut.FieldByName('skucostclasscd').Asstring:= qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString ;
    qryWareOrderOut.FieldByName('UploadDate').Asstring:= qryWareOrderOutEdit.FieldByName('UploadDate').AsString ;
    qryWareOrderOut.FieldByName('ActualDate').Asstring:= qryWareOrderOutEdit.FieldByName('ActualDate').AsString ;
    qryWareOrderOut.FieldByName('Quantity').Asstring:= qryWareOrderOutEdit.FieldByName('Quantity').AsString ;
    qryWareOrderOut.FieldByName('Piece').Asstring:= qryWareOrderOutEdit.FieldByName('Piece').AsString ;
    qryWareOrderOut.FieldByName('Quantityori').Asstring:= qryWareOrderOutEdit.FieldByName('Quantityori').AsString ;
    qryWareOrderOut.FieldByName('Pieceori').Asstring:= qryWareOrderOutEdit.FieldByName('Pieceori').AsString ;
    qryWareOrderOut.FieldByName('Piecesl').Asstring:= qryWareOrderOutEdit.FieldByName('Piecesl').AsString ;
    qryWareOrderOut.FieldByName('CreateName').Asstring:= qryWareOrderOutEdit.FieldByName('CreateName').AsString ;
    qryWareOrderOut.FieldByName('CreateDate').Asstring:= qryWareOrderOutEdit.FieldByName('CreateDate').AsString ;
    qryWareOrderOut.FieldByName('CheckName').Asstring:= qryWareOrderOutEdit.FieldByName('CheckName').AsString ;
    qryWareOrderOut.FieldByName('CheckDate').Asstring:= qryWareOrderOutEdit.FieldByName('CheckDate').AsString ;
    qryWareOrderOut.FieldByName('costcusid').Asstring:= qryWareOrderOutEdit.Fieldbyname('costcusid').asstring ;
    qryWareOrderOut.FieldByName('costcusname').Asstring:= qryWareOrderOutEdit.Fieldbyname('costcusname').asstring ;
    qryWareOrderOut.FieldByName('shipcusname').Asstring:= qryWareOrderOutEdit.FieldByName('shipcusname').AsString ;
    qryWareOrderOut.FieldByName('shipcusid').Asstring:= qryWareOrderOutEdit.FieldByName('shipcusid').AsString ;
    qryWareOrderOut.FieldByName('CustomsNO').Asstring:= qryWareOrderOutEdit.FieldByName('CustomsNO').AsString ;
    qryWareOrderOut.FieldByName('customsunite').Asstring:= qryWareOrderOutEdit.FieldByName('customsunite').AsString ;
    qryWareOrderOut.fieldByname('orderdaterq').asString:=datetostr(qryWareOrderOutEdit.fieldByname('orderdate').AsDateTime);
    qryWareOrderOut.fieldByname('orderdatesj').asString:=timetostr(qryWareOrderOutEdit.fieldByname('orderdate').AsDateTime);
    qryWareOrderOut.fieldByname('mainorder').asString:=qryWareOrderOutEdit.fieldByname('mainorder').AsString;
//    qryWareOrderOut.fieldByname('mainorderin').asString:=qryWareOrderOutEdit.fieldByname('mainorderin').AsString;

    Result:=True;
  end;
end;


procedure TfrmWareOrderOut.FormCreate(Sender: TObject);
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
  qryWareOrderOut.connection:=_ADOConnection;
  qryWareOrderOutEdit.connection:=_ADOConnection;
  qryWareOrderOutSKU.connection:=_ADOConnection;
  qryWareOrderOutOriSKU.connection:=_ADOConnection;
  qryWareorderOutSkuDetail.connection:=_ADOConnection;
end;

procedure TfrmWareOrderOut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmWareOrderOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid)  then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
    pcInfo.ActivePage := tbsWareOrder;
    if DataState in Setdcs then ActiveControl:=edtOrigincusid;
  end else
  if Key=Vk_F5 then
  begin
    pcInfo.ActivePage := tbsWareOrderOriSKU;
    if DataState in Setdcs then ActiveControl:=grdOriSKU;
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

procedure TfrmWareOrderOut.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if not ScrollAfterEdit and blnOpen then
  begin
    if qryWareOrderOutEdit.Active then
    begin
      qryWareOrderOutEdit.Close;
      qryWareOrderOutEdit.Open;
    end;
    if qryWareOrderOutOriSKU.Active then
    begin
      qryWareOrderOutOriSKU.Close;
      qryWareOrderOutOriSKU.Open;
    end;
    if qryWareOrderOutSKU.Active then
    begin
      qryWareOrderOutSKU.Close;
      qryWareOrderOutSKU.Open;
    end;
    ScrollAfterEdit:=True;
  end;

  if not blnPage then
  begin
    qryWareOrderOutEdit.Active  :=blnOpen;
    qryWareOrderOutOriSKU.Active   :=blnOpen;
    qryWareOrderOutSKU.Active   :=blnOpen;
  end else
  begin
    qryWareOrderOutEdit.Active  :=blnOpen;
    if pcInfo.ActivePage=tbsWareOrder  then qryWareOrderOutSKU.Active  := blnOpen;
    if pcInfo.ActivePage=tbsWareOrderOriSKU  then qryWareOrderOutOriSKU.Active  := blnOpen;
  end;
end;



procedure TfrmWareOrderOut.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryWareOrderOutOriSKU.Close;
  qryWareOrderOutSKU.Close;
  qryWareOrderOutEdit.Close;
  qryWareOrderOut.Close;
  sltselect.Destroy;
  frmWareOrderOut:=nil;
end;

procedure TfrmWareOrderOut.ChangeUOMItem(blnFull:Boolean;pstrUOMType:string);
{用于改变单位列表的内容
 blnFull    :是否全部
 pstrUOMType:费用单位类别 Quantity数量、Piece件数、NetWeight净重、
                         GrossWeight毛重、Volume体积、Area面积
}
//var strUOMType:string;
begin
  //调整单位过滤
{  if not blnFull then
     if uppercase(pstrUOMType)='Q' then
        strUOMType:='P'
     else if (uppercase(pstrUOMType)='N') or (uppercase(pstrUOMType)='G') then
        strUOMType:='W'
     else strUOMType:=uppercase(pstrUOMType);
  //清空
  cmbCountUOM.items.clear;
  cmbCountUOM.itemfields.clear;
  if blnFull then
    OpenSql(dataTmp.qryTmp, 'Select UOM,UOMName From UOM order by UOMType,UOM')
  else
    OpenSql(dataTmp.qryTmp, 'Select UOM,UOMName '
                   +'  From UOM '
                   +' where UOMType="'+strUOMType+'"'
                   +' order by UOMType,UOM');
  //赋值
  while (not dataTmp.qryTmp.Eof) do
  begin
    cmbCountUOM.items.add(dataTmp.qryTmp.Fieldbyname('UOMName').asstring);
    cmbCountUOM.itemfields.add(dataTmp.qryTmp.Fieldbyname('UOM').asstring);
    dataTmp.qryTmp.Next;
  end;
  dataTmp.qryTmp.Close;}
end;

procedure TfrmWareOrderOut.btnBrowMxClick(Sender: TObject);
begin
  pcWareOrder.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
  pcWareOrderChange(self);
end;

procedure TfrmWareOrderOut.btnBrowGlClick(Sender: TObject);
begin
  pcWareOrder.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
  pcWareOrderChange(self);
end;

procedure TfrmWareOrderOut.pcWareOrderChange(Sender: TObject);
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

procedure TfrmWareOrderOut.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmWareOrderOut.mitAddSKUClick(Sender: TObject);
begin
  qryWareOrderOutSKU.Append;
  grdSKU.SetFocus;
  grdSKUBeforeInsert;
end;

procedure TfrmWareOrderOut.mitDelSKUClick(Sender: TObject);
begin
  if qryWareOrderOutSKU.FieldByName('SNO').AsInteger<>0 then
  begin
    if qryWareOrderOutSKU.FieldByName('Quantitytask').AsFloat<>0 then
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
      strDel_Task:=strDel_Task+' or SNO='+qryWareOrderOutSKU.fieldbyname('SNO').Asstring;
      if sltselect.IndexOf(qryWareOrderOutSKU.fieldbyname('jobnoin').AsString+
                            qryWareOrderOutSKU.fieldbyname('snoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(qryWareOrderOutSKU.fieldbyname('jobnoin').AsString+
                          qryWareOrderOutSKU.fieldbyname('snoin').AsString));

      qryWareOrderOutSKU.Delete;
      grdSKU.SetFocus;
    end;
  end;
end;

procedure TfrmWareOrderOut.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=qryWareOrderOut.fieldbyname('jobno').asstring;
  if Sender = btnRefresh then
  begin
    SetDetailActive(False,False);
    qryWareOrderOut.Close;
    qryWareOrderOut.DisableControls;
    qryWareOrderOut.Open;
    try
      qryWareOrderOut.locate('jobno',strXmh,[loCaseInsensitive, loPartialKey]);
    except
      qryWareOrderOut.Last;
    end;
    qryWareOrderOut.EnableControls;
//    grdWareOrderChangeNodeEx(nil);
//wql.05.09.16    SetDetailActive(False,False);
    SetDetailActive(True,True);
    WorkCall(stBrowse);
  end else
  begin
    RefreshCurrentData(qryWareOrderOut,' WareOrder.Jobno="'+strXmh+'" ');
//wql.05.09.16    grdWareOrderChangeNodeEx(nil);
     if pcWareOrder.ActivePage=tbsEdit then      //wql.05.09.16 
        SetDetailActive(True,True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmWareOrderOut.btnEditClick(Sender: TObject);
var
  strWareTask:String;
begin
{  if (_canmodifyother<>'T') and (qryWareOrderOut.FieldByName('CreateName').asstring<>_LoginName) then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单不是您输入的，不能修改！'
    else
       _strmessage:=''; 
    kMessageDlg(GetMessage('frmWareOrderDxALL','014'),mtWarning,[mbOK],0);
    exit;
  end; }
  if qryWareOrderOut.FieldByName('CheckName').asstring<>'' then
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
                           +'   from locationoutitem task '+chr(13)+chr(10)
                           +'  where task.jobnoorder="'+qryWareOrderOut.FieldByName('jobno').AsString+'"');
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

  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
  SetDetailActive(False,True);
  WorkCall(stEdit);
end;

procedure TfrmWareOrderOut.btnAddClick(Sender: TObject);
var
   strWareordertype:string;
begin
  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
  ScrollAfterEdit:=True;
  SetDetailActive(False,True);
  Workcall(stInsert);
end;

procedure TfrmWareOrderOut.btnDeleteClick(Sender: TObject);
Var
  strWareTask:string;
begin
  if (qryWareOrderOut.FieldByName('CreateName').asstring<>_LoginName) and (_canmodifyother<>'T') then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单不是您输入的，不能删除！'
    else
       _strmessage:='';}
    kMessageDlg(GetMessage('frmWareOrderDxALL','019'),mtWarning,[mbOK],0);
    exit;
  end;
  if qryWareOrderOut.FieldByName('CheckName').asstring<>'' then
  begin
    {if _Language='CAPTIONC'then
       _strmessage:='该指令单已审核，不能删除！'
    else
       _strmessage:='';}
    kMessageDlg(GetMessage('frmWareOrderDxALL','020'),mtWarning,[mbOK],0);
    exit;
  end;
  if (qryWareOrderOut.FieldByName('jobnoin').asstring<>'') or (qryWareOrderOut.FieldByName('jobnoori').asstring<>'') then
  begin
    if _Language='CAPTIONC'then
       _strmessage:='该指令单从其他模块下达，不能删除，请到相应的模块撤销指令！'
    else
       _strmessage:='';
    kMessageDlg(GetMessage('frmWareOrderDxALL','021'),mtWarning,[mbOK],0);
    exit;
  end; 
  OpenSql(dataTmp.qryTmp,' Select Task.Jobno,Task.LocationBillno,Task.SNO '+chr(13)+chr(10)
                        +'   from '+IIF(qryWareOrderOut.FieldByName('dictatetype').AsString='进仓指令','locationinitem ','locationoutitem')+' Task (nolock)'
                        +'  where Task.Jobnoorder="'+qryWareOrderOut.FieldByName('jobno').AsString+'" ');
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
    ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                          +'     drop table #lskOldSku');
    ExecSql(dataTmp.qryTmp,'  select  jobnoin,snoin into #lskOldSku from WareOrderSku(nolock)  '+chr(13)+chr(10)
                          +'   where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                           );
    _ADOConnection.startTransaction;
    try
      {wql_new Execsql(dataTmp.qryTmp,'update input_predetail set IsInputOrder="F" '
                     +' where input_predetail.entry_no="'+qryWareOrderOutEdit.FieldByName('CustomsNO').AsString+'" '
                     +'   and input_predetail.OperationType="'+iif(strINOUT='I','1','-1')+'" ');  wql_new}
       ExecSql(dataTmp.qryTmp,'delete from  WareOrder  where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderSKU  where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderOriSKU  where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  locationinoutcon where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  locationinoutconsku where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  WareOrderSkuDetail  where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
       ExecSql(dataTmp.qryTmp,'delete from  genjobno where jobno="'+
               qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');

       kspWareOrderSku(qryWareOrderOut.FieldByName('Jobno').AsString);
//为了控制库存 ,删除临时表
       ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                             +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                             +'     drop table #lskOldSku');
       qryWareOrderOut.Applyupdates;
       //检查库存
//wql_new       CheckWareInventory(qryWareOrderOutEdit.FieldByName('Jobno').AsString);
       {wql_new if uppercase(qryWareOrderOut.FieldByName('KinnProject').AsString)='KINNBOND' then
       begin
          if copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,1,6)=_DataBaseid+'RN' then
          begin
             execSql(dataTmp.qryTmpO,' update Recenotify set Rn_planid="F",Rn_InID="F",Rn_skucode="" '
                             +'  where Jobno="'+Copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,5,14)+'"'
                             +'    and DataBaseID="'+_DataBaseID+'"');
             execSql(dataTmp.qryTmpO,' update RecenotifyItem set Rn_planid="F",Rn_InID="F",Rn_skucode="" '
                             +'  where Jobno="'+Copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,5,14)+'"'
                             +'    and DataBaseID="'+_DataBaseID+'"')
          end else
          if (copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,1,6)=_DataBaseid+'IR') and (trim(_KinnProgramCD)='') then
             execSql(dataTmp.qryTmpO,' update ImReceivesku set planid="F",whskuid="" '
                             +'  where Jobno="'+Copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,5,14)+'"'
                             +'    and DataBaseID="'+_DataBaseID+'"')
          else if (copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,1,6)=_DataBaseid+'FR') then   //and (trim(_KinnProgramCD)='')  wql
             execSql(dataTmp.qryTmpO,' update FirCusRecordsku set planid="F"'+iif(trim(_KinnProgramCD)='',',whskuid="",inputid="F" ','')
                             +'  where Jobno="'+Copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,5,14)+'"'
                             +'    and DataBaseID="'+_DataBaseID+'"')
          else if (copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,1,6)=_DataBaseid+'SO') then //and (trim(_KinnProgramCD)<>'')
             execSql(dataTmp.qryTmpO,' update SecondOutsku set planid="F" '
                             +'  where Jobno="'+Copy(qryWareOrderOut.FieldByName('JobnoEx').AsString,5,14)+'"'
                             +'    and DataBaseID="'+_DataBaseID+'"');
       end; wql_new}
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
    qryWareOrderOut.CommitUpdates;

    workcall(stbrowse);
  end;
  SetDetailActive(False,False);
  SetDetailActive(True,True);
end;

procedure TfrmWareOrderOut.btnFindClick(Sender: TObject);
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
           +'   and '+qryWareOrderOut.MacroByName('Where').AsString
           +iif(trim(strJobno)='','',' and wareOrder.jobno="'+strJobno+'" ');

   Para.OnGetValue := FindGetValue;
   Dofind(qryWareOrderOut,dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmWareOrderOut.btnRefindClick(Sender: TObject);
begin
   DoRefind(qryWareOrderOut,dataTmp.qryFind);
end;

function TfrmWareOrderOut.FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
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

procedure TfrmWareOrderOut.btnFilterClick(Sender: TObject);
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
     qryWareOrderOut.Close;
     qryWareOrderOut.DisableControls;
     if (strTmp<>'') and (btnopid.Enabled) then
     begin
       qryWareOrderOut.MacroByName('Where').AsString:=strTmp
     end else
     if (strTmp<>'') and (not blnop) then
     begin
       qryWareOrderOut.MacroByName('Where').AsString:=strTmp+' and (wareorder.costopid="'+_loginname+'" or wareorder.createname="'+_loginname+'")'
     end else
     if (strTmp='') and (not blnop) then
     begin
       qryWareOrderOut.MacroByName('Where').AsString:='1=1 and (wareorder.costopid="'+_loginname+'" or wareorder.createname="'+_loginname+'")'
     end else
       qryWareOrderOut.MacroByName('Where').AsString:='1=1';

     qryWareOrderOut.Open;
     qryWareOrderOut.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmWareOrderOut.btnSaveClick(Sender: TObject);
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
               strHistMessage:='  费用关系人-'+qryWareOrderOutEdit.FieldByName('CostCusName').AsString
                              +'  订单时间-'  +qryWareOrderOutEdit.FieldByName('OrderDate').AsString
                              +'  指令单号-'  +qryWareOrderOutEdit.FieldByName('OrderID').AsString
                              +'  指令类型-'  +qryWareOrderOutEdit.FieldByName('DictateType').AsString
                              +'  商品类-'    +qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString
                              +'  客户单号-'  +qryWareOrderOutEdit.FieldByName('cusbillno').AsString
                              +'  报关单号-'  +qryWareOrderOutEdit.FieldByName('customsno').AsString
                              +'  仓租方式-'  +qryWareOrderOutEdit.FieldByName('warerentcounttype').AsString
                              +'  计算仓租-'  +qryWareOrderOutEdit.FieldByName('countrent').AsString;
             end else
             begin
                if VarToStr(qryWareOrderOutEdit.FieldByName('OrderID').OldValue)<>qryWareOrderOutEdit.FieldByName('OrderID').AsString then
                   strHistMessage:=strHistMessage
                               +'  指令单号-'+VarToStr(qryWareOrderOutEdit.FieldByName('OrderID').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('OrderID').AsString
                else
                   strHistMessage:=strHistMessage
                               +'  指令单号-'+qryWareOrderOutEdit.FieldByName('OrderID').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('CostCusName').OldValue)<>qryWareOrderOutEdit.FieldByName('CostCusName').AsString then
                   strHistMessage:=strHistMessage
                               +'  费用关系人-'+VarToStr(qryWareOrderOutEdit.FieldByName('CostCusName').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('CostCusName').AsString;
                if VarToDateTime(qryWareOrderOutEdit.FieldByName('OrderDate').OldValue)<>qryWareOrderOutEdit.FieldByName('OrderDate').AsDateTime then
                   strHistMessage:=strHistMessage
                               +'  订单时间-'+VarToStr(qryWareOrderOutEdit.FieldByName('OrderDate').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('OrderDate').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('DictateType').OldValue)<>qryWareOrderOutEdit.FieldByName('DictateType').AsString then
                   strHistMessage:=strHistMessage
                               +'  指令类型-'+VarToStr(qryWareOrderOutEdit.FieldByName('DictateType').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('DictateType').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('skucostclasscd').OldValue)<>qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString then
                   strHistMessage:=strHistMessage
                               +'  商品类-'+VarToStr(qryWareOrderOutEdit.FieldByName('skucostclasscd').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('cusbillno').OldValue)<>qryWareOrderOutEdit.FieldByName('cusbillno').AsString then
                   strHistMessage:=strHistMessage
                               +'  客户单号-'+VarToStr(qryWareOrderOutEdit.FieldByName('cusbillno').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('cusbillno').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('customsno').OldValue)<>qryWareOrderOutEdit.FieldByName('customsno').AsString then
                   strHistMessage:=strHistMessage
                               +'  报关单号-'+VarToStr(qryWareOrderOutEdit.FieldByName('customsno').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('customsno').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('warerentcounttype').OldValue)<>qryWareOrderOutEdit.FieldByName('warerentcounttype').AsString then
                   strHistMessage:=strHistMessage
                               +'  仓租方式-'+VarToStr(qryWareOrderOutEdit.FieldByName('warerentcounttype').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('warerentcounttype').AsString;
                if VarToStr(qryWareOrderOutEdit.FieldByName('countrent').OldValue)<>qryWareOrderOutEdit.FieldByName('countrent').AsString then
                   strHistMessage:=strHistMessage
                               +'  计算仓租-'+VarToStr(qryWareOrderOutEdit.FieldByName('countrent').OldValue)+' →'+qryWareOrderOutEdit.FieldByName('countrent').AsString;
             end;
          end;
          try
          _ADOConnection.Starttransaction;
          qryWareOrderOutEdit.ApplyUpdates;

          qryWareOrderOut.Edit;
          qryWareOrderOut.fieldByname('JOBNO').asString:=qryWareOrderOutEdit.fieldByname('Jobno').asString;
          qryWareOrderOut.fieldByname('OrderID').asString:=qryWareOrderOutEdit.fieldByname('OrderID').asString;
          qryWareOrderOut.fieldByname('keyid').asString:=qryWareOrderOutEdit.FieldByName('jobno').Asstring;
          m_blnPost := True;
          qryWareOrderOut.ApplyUpdates;
          m_blnPost := False;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             data.udsWareOrderEdit.modifysql.text + chr(13) +
             data.udsWareOrderEdit.DeleteSql.text + chr(13) +
             data.udsWareOrderEdit.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( qryWareOrderOutEdit.FieldByName('Jobno').AsString
                        +GetMessage('frmWareOrderDxALL','040'));//iif(_language='CAPTIONC','工作号','') iif(_language='CAPTIONC','已经被使用。程序正在查找其他可用客户编号...','')
             Application.processmessages;
             if not frmSave.stopflag then
             begin
                 //赋业务联系单号
               opensql(dataTmp.qryTmp,'select datenow=getDate() ');
               strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
               opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                                     +'  from genjobno where substring(Jobno,1,10)="'+Trim(_DataBaseID)+'WO'+strDate+'"' );
               strorderid:='OC'+copy(datetostr(date),1,4)+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');
               qryWareOrderOutEdit.FieldByName('OrderID').Asstring:=strorderid;
               strWOJobno:=genJobno('WO',strorderid);
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
                 qryWareOrderOutEdit.Edit;
                 qryWareOrderOutEdit.FieldByName('Jobno').AsString := strWOJobno;
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
      qryWareOrderOutOriSKU.DisableControls;
      qryWareOrderOutOriSKU.first;
      while not qryWareOrderOutOriSKU.eof do
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.fieldbyname('JOBNO').asstring:=qryWareOrderOutEdit.fieldbyname('JOBNO').asstring;
         qryWareOrderOutOriSKU.Post;
         qryWareOrderOutOriSKU.next;
      end;
      qryWareOrderOutOriSKU.first;
      qryWareOrderOutOriSKU.EnableControls;
      qryWareOrderOutOriSKU.applyupdates;

      qryWareOrderOutSKU.DisableControls;
      qryWareOrderOutSKU.first;
      while not qryWareOrderOutSKU.eof do
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.fieldbyname('JOBNO').asstring:=qryWareOrderOutEdit.fieldbyname('JOBNO').asstring;
         qryWareOrderOutSKU.Post;
         qryWareOrderOutSKU.next;
      end;
      qryWareOrderOutSKU.first;
      qryWareOrderOutSKU.EnableControls;
      qryWareOrderOutSKU.applyupdates;
      if qryWareorderOutSkuDetail.active then
         qryWareorderOutSkuDetail.ApplyUpdates;
      //修改海关导入数据的 IsInputOrder(是否已经生成指令)
     {wql_new if (strType='HG') and (mode=stInsert) and (blnInserted) then
      begin
        execsql(dataTmp.qryTmp,'update input_predetail set IsInputOrder="T" '
                      +' where input_predetail.ID_NO="'+strID_NO+'" '
                      +'   and input_predetail.OperationType="'+iif(strINOUT='I','1','-1')+'"');
      end; wql_new}

      //如果报关单号已经改变做以下操作
      if stroldCustomsNO<>qryWareOrderOutEdit.FieldByName('CustomsNO').Asstring then
      begin
          execsql(dataTmp.qryTmp,'update LocationoutItem set CustomsNO="'+qryWareOrderOutEdit.fieldbyname('CustomsNO').AsString+'"  '+chr(13)+chr(10)
                        +' where LocationoutItem.jobnoorder="'+qryWareOrderOutEdit.fieldbyname('Jobno').AsString+'" ')
      end;

      if getSysdata('qdtext')='T' then
          execsql(dataTmp.qryTmp,'update secondout '
                                +'   set accjobno="'+qryWareOrderOutEdit.fieldbyname('mainorder').AsString+'",  '+chr(13)+chr(10)
                                +'       bolade="'+qryWareOrderOutEdit.fieldbyname('cusbillno').AsString+'"  '+chr(13)+chr(10)
                                +' where jobno="'+qryWareOrderOutEdit.fieldbyname('Jobnoin').AsString+'" ');

      kspWareOrderSku(qryWareOrderOut.FieldByName('Jobno').AsString);
//处理日志
      if _isuserhist='T' then
      begin
         strHistMessage:=strHistMessage+strHistDetailMessage;
         if strHistMessage<>'' then
           execsql(dataTmp.qryTmp,'insert into UserHist '
                         +' (UserName,UserDATE,JOBNO, Remark,TypeName,modifytype)'
                         +' values ("'+_LoginName+'","'+DateTimeToStr(Now)+'","'
                         +qryWareOrderOutEdit.FieldByName('jobno').AsString+'","'
                         +strHistMessage+'","出仓指令","'+iif(DataState=stEdit,'修改','新增')+'")');
      end;
      //删除商品明细
      if strDel_Task<>'' then
      begin
        strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
        strsql:=' delete from WareOrderSKUDetail '
               +'  where jobno="'+qryWareOrderOut.fieldbyname('Jobno').asstring+'"'
               +'    and '+'('+strDel_Task+') ';
        execsql(datatmp.qryTmp,strsql);
        strDel_Task:='';
      end;

//为了控制库存 ,删除临时表
      ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                           +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                           +'     drop table #lskOldSku'
                           );
      _ADOConnection.Commit;
    except
      blnSaveError:=true;
      arrWareOrder:=ScatterToArray(qryWareOrderOut,true,0);
      arrWareOrderEdit:=ScatterToArray(qryWareOrderOutEdit,true,0);
      m_blnPost := True;
      qryWareOrderOut.CancelUpdates;
      qryWareOrderOutEdit.CancelUpdates;
      if datastate=stInsert then
      begin
        qryWareOrderOut.Append;
        qryWareOrderOutEdit.Append;
      end else
      begin
        strJobno     :=qryWareOrderOut.FieldByName('Jobno').AsString;
        qryWareOrderOut.Locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);
        qryWareOrderOut.Edit;
      end;
      qryWareOrderOut.DisableControls;
      GatherFromArray(qryWareOrderOut,arrWareOrder,false);
      GatherFromArray(qryWareOrderOutEdit,arrWareOrderEdit,false);
      qryWareOrderOut.EnableControls;
      m_blnPost := False;
      try
        if _ADOConnection.InTransaction then _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    qryWareOrderOut.commitUpdates;
    qryWareOrderOutEdit.commitUpdates;
    qryWareOrderOutOriSKU.commitUpdates;
    qryWareOrderOutSKU.commitUpdates;
    if qryWareorderOutSkuDetail.active then
    begin
       qryWareorderOutSkuDetail.CommitUpdates;
       qryWareorderOutSkuDetail.Filtered:=True;
    end;

    ScrollAfterEdit:=False;
    strskuid:='';
    WorkCall(stBrowse);
//    btnRefreshclick(self);
  end;
end;

procedure TfrmWareOrderOut.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;
//为了控制库存 ,删除临时表
   {ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                         +'    where id=object_id("tempdb..#lskOldSku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'     drop table #lskOldSku'
                         ); }
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+qryWareOrderOutEdit.FieldByName('jobno').AsString+'" ');
   qryWareOrderOutSKU.CancelUpdates;
   qryWareOrderOutOriSKU.CancelUpdates;
   qryWareOrderOutEdit.CancelUpdates;
   qryWareOrderOut.CancelUpdates;
   if qryWareorderOutSkuDetail.active then
   qryWareorderOutSkuDetail.CancelUpdates;


   grdOriSKU.ResetFullRefresh;
   grdSKU.ResetFullRefresh;
   strskuid:='';
   WorkCall(stBrowse);
   pcWareOrderChange(self);
end;

procedure TfrmWareOrderOut.btnPrintClick(Sender: TObject);
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
           +' Where WareOrderSKU.Jobno="'+qryWareOrderOut.fieldbyname('Jobno').AsString+'"';
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
           +' Where WOSKU.Jobno="'+qryWareOrderOut.fieldbyname('Jobno').AsString+'"'
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
           +' Where WareOrder.Jobno="'+qryWareOrderOut.fieldbyname('Jobno').AsString+'"'
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

      paras.Values['OrderDate'] :=qryWareOrderOut.fieldbyname('OrderDate').AsString;
      paras.Values['CustomsNO']     :=qryWareOrderOut.fieldbyname('CustomsNO').AsString;
      paras.Values['UserName']      :=_UserName;
      paras.Values['LocationBillNO']:=strLocationBillNO;
      paras.Values['Date']:=strDate;
      paras.Values['cusname']:=StrAccountName;
      paras.Values['Consigncusname']:=qryWareOrderOut.fieldbyname('Consigncusname').AsString;

      paras.Values['Piece']         :=IntToStr(qryWareOrderOut.fieldbyname('Piece').AsInteger);
      paras.Values['NetWeight']     :=FloatToStr(qryWareOrderOut.fieldbyname('NetWeight').AsFloat);
      paras.Values['GrossWeight']   :=FloatToStr(qryWareOrderOut.fieldbyname('GrossWeight').AsFloat);
      paras.Values['Area']          :=FloatToStr(qryWareOrderOut.fieldbyname('Area').AsFloat);
      paras.Values['Volume']        :=FloatToStr(qryWareOrderOut.fieldbyname('Volume').AsFloat);

      qryMain:=dataTmp.qryTmp;
      CreateReport;
    end;
  finally
    KF1Book.Destroy;
  end; wql_new}
end;

procedure TfrmWareOrderOut.btnCopyClick(Sender: TObject);
{复制新增的问题}
begin
  if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
  pcWareOrderChange(self);
  SetDetailActive(False,True);

  arrWareOrderEdit:=ScatterToArray(qryWareOrderOutEdit,true,0);
  arrWareOrderSKU :=ScatterToArray(qryWareOrderOutSKU,false,0);
  arrWareOrderOriSKU :=ScatterToArray(qryWareOrderOutOriSKU,false,0);
  blnCopy:=True;

  WorkCall(stInsert);
end;

procedure TfrmWareOrderOut.edtOrigincusidButtonClick(Sender: TObject;
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
            qryWareOrderOutEdit.FieldByName('origincusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('origincusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtDestcusnameButtonClick(Sender: TObject;
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
            qryWareOrderOutEdit.FieldByName('destcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('destcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
   end;
   end;
end;

procedure TfrmWareOrderOut.edtConsignCusIDButtonClick(Sender: TObject;
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
            qryWareOrderOutEdit.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtCarriercusidButtonClick(Sender: TObject;
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
            qryWareOrderOutEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('carriercusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtCostcusidButtonClick(
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
            qryWareOrderOutEdit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.cmbOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_new  if DataState in Setdcs then
  begin
    with workOperatorSelect do
    if okflag  then
    begin
      qryWareOrderOutEdit.Edit;
      qryWareOrderOutEdit.Fieldbyname('OPID').asstring  :=OPID;
      qryWareOrderOutEdit.Fieldbyname('OPName').asstring:=Name;
    end;
  end;  wql_new}
end;

procedure TfrmWareOrderOut.cmbSKUNameButtonClick(Sender: TObject;
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
      if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
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
            qryWareOrderOutSKU.edit;
            qryWareOrderOutEdit.Edit;
            qryWareOrderOutEdit.fieldbyname('SKUNAME').asstring        :=SKUName_set;
            qryWareOrderOutEdit.fieldbyname('Quantity').AsFloat           :=Quantity_set;
            qryWareOrderOutEdit.fieldbyname('QuantityUOM').asstring    :=QuantityUOM_set;
          end else
          begin
//            if not qryWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//            then break;
            qryWareOrderOutSKU.append;
            qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
            qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
            qryWareOrderOutSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
          end;
          qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=SKUID            ;
          qryWareOrderOutSKU.fieldbyname('SKUName').asstring             :=SKUName          ;
          strGetCd := SKUName;
          if LotCode<>'' then
            qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=LotCode          ;
          if Quantity<>0 then
            qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=Quantity;
          if QualityName<>'' then
            qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=QualityName      ;
          qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=PieceUOM         ;
          qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=WeightUOM        ;
          qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=VolumeUOM        ;
          qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=AreaUOM          ;
          if qryWareOrderOutSKU.fieldByname('cusid').AsString='' then
            qryWareOrderOutSKU.fieldByname('cusid').AsString           :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderOutSKU.fieldByname('cusname').AsString='' then
            qryWareOrderOutSKU.fieldByname('cusname').AsString         :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;
          if qryWareOrderOutSKU.fieldByname('shippercusid').AsString='' then
            qryWareOrderOutSKU.fieldByname('shippercusid').AsString    :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderOutSKU.fieldByname('shippercusname').AsString='' then
            qryWareOrderOutSKU.fieldByname('shippercusname').AsString  :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;

          qryWareOrderOutSKU.fieldbyname('TagEachUOM').Asstring          :='';

          qryWareOrderOutSKU.Fieldbyname('piecepro').AsFloat  :=piecepro;
          qryWareOrderOutSKU.Fieldbyname('VolumePro').asFloat :=VolumePro;
          qryWareOrderOutSKU.Fieldbyname('AreaPro').asFloat   :=AreaPro;
          qryWareOrderOutSKU.Fieldbyname('NetWeightPro').asFloat:=Quantity_Weight_Prop;
          qryWareOrderOutSKU.Fieldbyname('GrossWeightPro').asFloat:=Quantity_Weight_Prop;
          qryWareOrderOutSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
          qryWareOrderOutSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
          qryWareOrderOutSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
        end;
      end;
    end;
  end else if (strOrderType='OO') or ((strOrderType='VA') and (strINOUT='O')) then
    begin
      if DataState in Setdcs then
        begin
          TLocationSKUSelect:= WorkLocationSKUSelect('and isnull(Detail.cusid,"") like "%'
                                                     +qryWareOrderOutSKU.Fieldbyname('cusid').Asstring+'%"',
                                                     '出仓指令-库存商品选择','TO','OR','Quantity_RemainOrder',False);

          for i:=0 to 100 do
          begin
            if TLocationSKUSelect[i].OkFlag then
            begin
              if i=0 then
              begin
                qryWareOrderOutSKU.edit;
                qryWareOrderOutEdit.Edit;
                qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
                qryWareOrderOutEdit.fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond;
                qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
                qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
                qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring      :=TLocationSKUSelect[i].skucostclasscd;
                qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype;
                if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
                begin
                  qryWareOrderOutEdit.fieldbyname('costcusid').asstring:=TLocationSKUSelect[i].costcusid;
                  qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
                end;
                ckbCountcontcostclick(self);
              end else
              begin
//                if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//                then break;
                qryWareOrderOutSKU.append;
                qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
                qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
                qryWareOrderOutSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
              end;
              qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=TLocationSKUSelect[i].SKUID            ;
              qryWareOrderOutSKU.fieldbyname('SKUName').asstring             :=TLocationSKUSelect[i].SKUName          ;
              qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=TLocationSKUSelect[i].LotCode          ;
              qryWareOrderOutSKU.Fieldbyname('locid').asstring          :=TLocationSKUSelect[i].locid       ;
              qryWareOrderOutSKU.Fieldbyname('LocationName').asstring        :=TLocationSKUSelect[i].LocationName       ;
              qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=TLocationSKUSelect[i].syquantity        ;
              qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=TLocationSKUSelect[i].QualityName      ;
              qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=TLocationSKUSelect[i].PieceUOM         ;
              qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=TLocationSKUSelect[i].WeightUOM        ;
              qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=TLocationSKUSelect[i].VolumeUOM        ;
              qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=TLocationSKUSelect[i].AreaUOM          ;
              qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=TLocationSKUSelect[i].syPiece          ;
              qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=TLocationSKUSelect[i].syNetWeight      ;
              qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=TLocationSKUSelect[i].syGrossWeight    ;
              qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=TLocationSKUSelect[i].syVolume         ;
              qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=TLocationSKUSelect[i].syArea           ;
              qryWareOrderOutSKU.fieldbyname('cusid').asstring           :=TLocationSKUSelect[i].cusid        ;
              qryWareOrderOutSKU.fieldbyname('cusname').asstring         :=TLocationSKUSelect[i].cusname      ;
              qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring    :=TLocationSKUSelect[i].shippercusid ;
              qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring  :=TLocationSKUSelect[i].shippercusname  ;
//              qryWareOrderOutSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
              qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring     :=TLocationSKUSelect[i].contwithloca   ;
              qryWareOrderOutSKU.Fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked     ;
              qryWareOrderOutSKU.Fieldbyname('price').asFloat             :=TLocationSKUSelect[i].price          ;
              qryWareOrderOutSKU.Fieldbyname('currcd').asstring    :=TLocationSKUSelect[i].currcd  ;
              qryWareOrderOutSKU.fieldbyname('skucost').asFloat        :=TLocationSKUSelect[i].skucost     ;
              qryWareOrderOutSKU.fieldbyname('costuomtype').asstring     :=TLocationSKUSelect[i].costuomtype   ;
              qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring            :=TLocationSKUSelect[i].Jobno  ;
              qryWareOrderOutSKU.fieldbyname('snoin').asInteger             :=TLocationSKUSelect[i].SNO    ;
              qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=TLocationSKUSelect[i].LD_SNO ;
              qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring          :=TLocationSKUSelect[i].jobnoinf  ;
              qryWareOrderOutSKU.fieldbyname('snoinf').asInteger           :=TLocationSKUSelect[i].snoinf    ;
              qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger        :=TLocationSKUSelect[i].ldsnoinf ;
              qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring           :=TLocationSKUSelect[i].CustomsNO ;
              qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring      :=TLocationSKUSelect[i].LocationBillNO ;
              qryWareOrderOutSKU.Fieldbyname('WO_TagEach').asstring          :=TLocationSKUSelect[i].WO_TagEach   ;
              qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring          :=TLocationSKUSelect[i].TagEachUOM     ;
              qryWareOrderOutSKU.Fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond   ;
              qryWareOrderOutSKU.Fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent     ;
              qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost   ;
              qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype     ;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring            :=TLocationSKUSelect[i].costcusid ;
              qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring      :=TLocationSKUSelect[i].loadcostone ;
              qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString      :=TLocationSKUSelect[i].skucostclasscd;
              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TLocationSKUSelect[i].syquantity;
//              if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//              then break;
            end;
          end;
        end;
    end;  wql_new}
end;

procedure TfrmWareOrderOut.edtCusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutOriSKU.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.cmbShipperAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_new  if DataState in Setdcs then
  begin
    with workAccountselect('C') do
    if OkFlag then
    begin
      qryWareOrderOutSKU.Edit;
      qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring  :=cusid;
      qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring:=ACCOUNT_SHORTNAME;
    end;
  end;  wql_new}
end;

procedure TfrmWareOrderOut.qryWareOrderUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction:=uaApplied;
end;

procedure TfrmWareOrderOut.cmbSKUNameEnter(Sender: TObject);
begin
   if (DataState in Setdcs) and (qryWareOrderOutSKU.Fieldbyname('SKUID').asstring='') then
   begin
     qryWareOrderOutSKU.Edit;
     qryWareOrderOutSKU.Fieldbyname('SKUID').asstring:='';
     qryWareOrderOutSKU.Fieldbyname('PieceUOM').asstring:=_PieceUOM;
     qryWareOrderOutSKU.Fieldbyname('VolumeUOM').asstring:=_VolumeUOM;
     qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring:=_AreaUOM;
     qryWareOrderOutSKU.Fieldbyname('WeightUOM').asstring:=_WeightUOM;
     qryWareOrderOutSKU.Fieldbyname('QUANTITYUOM').asstring:=_PieceUOM;
   end;
end;

procedure TfrmWareOrderOut.grdWareOrderDblClick(Sender: TObject);
begin
   if pcWareOrder.activepage <> tbsEdit then pcWareOrder.ActivePage := tbsEdit;
end;

procedure TfrmWareOrderOut.cmbQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{
  if DataState in setDcs then
  begin
    with workQualitySelect(qryWareOrderOutSKU.FieldByName('QualityName').AsString) do
    if OkFlag then
    begin
      qryWareOrderOutSKU.edit;
      qryWareOrderOutSKU.FieldByName('QualityName').AsString:=QualityName;
    end;
  end;
}
end;

procedure TfrmWareOrderOut.ShowHint(var HintStr: string; var CanShow: Boolean;
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

procedure TfrmWareOrderOut.cmbLocationIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
 if DataState in setDcs then
  begin
    qryselect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('LocID').asstring<>'NO' then
    begin
      qryWareOrderOutOriSKU.Edit;
      qryWareOrderOutOriSKU.Fieldbyname('Locid').asstring:=qrySelect.fieldbyname('LocId').asstring;
      qryWareOrderOutOriSKU.Fieldbyname('Locname').asstring:=qrySelect.fieldbyname('LocName').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmWareOrderOut.btnTaskClick(Sender: TObject);
var strNum:Integer;
begin
  if (qryWareOrderOut.FieldByName('CheckName').Asstring='') and (_DB_Order<>'T') then
  begin
    {if _Language='CAPTIONC' then
       _strmessage:='该指令还未审核不能生成任务！请先审核！'
    else
       _strmessage:='';}
    KmessageDlg(GetMessage('frmWareOrderDxALL','023'),mtWarning,[mbOK],0);
    Exit;
  end;
  if not qryWareOrderOutSKU.active then qryWareOrderOutSKU.open;
  if qryWareOrderOutSKU.RecordCount=0 then
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
                   +'  from '+iif(qryWareOrderOut.FieldByName('DictateType').AsString='进仓指令',
                    '       locationinitem (nolock)','locationoutitem (nolock)')
                   +' where jobnoorder="'+qryWareOrderOut.FieldByName('jobno').Asstring+'"');
     if dataTmp.qryTmp.FieldByName('acount').AsInteger>0 then
       if KmessageDlg(GetMessage('frmWareOrderDxALL','025'),mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;//iif(_language='CAPTIONC','该指令单已有数据形成任务，您确定要重新生成任务吗?','')
 
  end;        }
  pcWareOrder.ActivePage := tbsEdit;
  pcInfo.ActivePage:=tbsWareOrder;

  qryWareOrderOutSKU.DisableControls;
  Bookmark:= qryWareOrderOutSKU.GetBookmark;
  strNum:=0;
  qryWareOrderOutSKU.First;
  while not qryWareOrderOutSKU.Eof do
  begin
    if qryWareOrderOutSKU.FieldByName('skuid').Asstring='' then strNum:=strNum+1;
    qryWareOrderOutSKU.Next;
  end;
  qryWareOrderOutSKU.GotoBookmark(Bookmark);
  qryWareOrderOutSKU.FreeBookmark(Bookmark);
  bookMark:=nil;
  qryWareOrderOutSKU.EnableControls;

  if strNum<>0 then
    begin
      if WorkChooseSKUID(qryWareOrderOutSKU) then
        begin
          //更新后台数据库的商品库内容
          _ADOConnection.Starttransaction;
          qryWareOrderOutSKU.first;
          qryWareOrderOutSKU.EnableControls;
          qryWareOrderOutSKU.applyupdates;

          //检查库存
//wql_new          CheckWareInventory(qryWareOrderOutEdit.FieldByName('Jobno').AsString);
          _ADOConnection.Commit;

          qryWareOrderOutSKU.commitUpdates;
        end
      else exit;
    end;
  //调用locationinout，生成任务!为了取完整的商品费率必须filtered设为False!
  if qryWareOrderOut.FieldByName('DictateType').AsString='出仓指令' then
  WorkLocationOUT(stInsert,'','ITEM',qryWareOrderOutEdit,qryWareOrderOutSKU);
end;

procedure TfrmWareOrderOut.mitFilterActiveClick(Sender: TObject);
begin
  grdWareOrder.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmWareOrderOut.cmbQUANTITYUOMEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderOut.cmbSKUSectionUnitEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderOut.cmbSectionUnitEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;


procedure TfrmWareOrderOut.btnTotalClick(Sender: TObject);
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
  qryWareOrderOutSKU.DisableControls;
  qryWareOrderOutSKU.first;
  while not qryWareOrderOutSKU.eof do
  begin
    //指令商品数量合计

    if Pos(qryWareOrderOutSKU.fieldbyname('skuname').AsString,strSKUNameTotal)=0 then
       strSKUNameTotal :=strSKUNameTotal+qryWareOrderOutSKU.fieldbyname('skuname').AsString+' ';

    QuantityTotal:=QuantityTotal+qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat;
    PieceTotal:=PieceTotal+qryWareOrderOutSKU.fieldbyname('Piece').AsFloat;

    if blnQuantityLike and ((trim(strQuantityUOM)='')
      or (strQuantityUOM=qryWareOrderOutSKU.fieldbyname('QuantityUOM').AsString)) then
    begin
      strQuantityUOM   :=qryWareOrderOutSKU.fieldbyname('QuantityUOM').AsString;
    end else
    begin
      blnQuantityLike:=False;
      strQuantityUOM   :='';
    end;

    if blnPieceLike and ((trim(strPieceUOM)='')
      or (strPieceUOM=qryWareOrderOutSKU.fieldbyname('PieceUOM').AsString)) then
    begin
//      PieceTotal:=PieceTotal+qryWareOrderOutSKU.fieldbyname('Piece').asInteger;
      strPieceUOM   :=qryWareOrderOutSKU.fieldbyname('PieceUOM').AsString;
    end else
    begin
      blnPieceLike:=False;
//      PieceTotal:=0;
      strPieceUOM   :='';
    end;

    if blnVolumeLike and ((trim(strVolumeUOM)='')
      or (strVolumeUOM=qryWareOrderOutSKU.fieldbyname('VolumeUOM').AsString)) then
    begin
      VolumeTotal:=VolumeTotal+qryWareOrderOutSKU.fieldbyname('Volume').asfloat;
      strVolumeUOM   :=qryWareOrderOutSKU.fieldbyname('VolumeUOM').AsString;
    end else
    begin
      blnVolumeLike:=False;
      VolumeTotal:=0;
      strVolumeUOM   :='';
    end;

    if blnAreaLike and ((trim(strAreaUOM)='')
      or (strAreaUOM=qryWareOrderOutSKU.fieldbyname('AreaUOM').AsString)) then
    begin
      AreaTotal    :=AreaTotal+qryWareOrderOutSKU.fieldbyname('Area').asfloat;
      strAreaUOM   :=qryWareOrderOutSKU.fieldbyname('AreaUOM').AsString;
    end else
    begin
      blnAreaLike:=False;
      AreaTotal:=0;
      strAreaUOM   :='';
    end;

    if blnWeightLike and ((trim(strWeightUOM)='')
      or (strWeightUOM=qryWareOrderOutSKU.fieldbyname('WeightUOM').AsString)) then
    begin
      NetWeightTotal  :=NetWeightTotal+qryWareOrderOutSKU.fieldbyname('NetWeight').asfloat;
      GrossWeightTotal:=GrossWeightTotal+qryWareOrderOutSKU.fieldbyname('GrossWeight').asfloat;
      strWeightUOM        :=qryWareOrderOutSKU.fieldbyname('WeightUOM').AsString;
    end else
    begin
      blnWeightLike   :=False;
      NetWeightTotal  :=0;
      GrossWeightTotal:=0;
      strWeightUOM    :='';
    end;

    qryWareOrderOutSKU.Next;
  end;
  qryWareOrderOutSKU.First;
  qryWareOrderOutSKU.EnableControls;
  qryWareOrderOutSKUAfterScroll(qryWareOrderOutSKU);

  //合计结果复制给主库
  qryWareOrderOutEdit.Edit;
  qryWareOrderOutEdit.fieldbyname('Quantity').AsFloat:=QuantityTotal;
  qryWareOrderOutEdit.fieldbyname('Piece').AsFloat:=PieceTotal;
  qryWareOrderOutEdit.fieldbyname('Volume').asfloat:=VolumeTotal;
  qryWareOrderOutEdit.fieldbyname('Area').asfloat:=AreaTotal;
  qryWareOrderOutEdit.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
  qryWareOrderOutEdit.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
  qryWareOrderOutEdit.fieldbyname('QuantityUOM').AsString:=strQuantityUOM;
  qryWareOrderOutEdit.fieldbyname('PieceUOM').AsString:=strPieceUOM;
  qryWareOrderOutEdit.fieldbyname('VolumeUOM').AsString:=strVolumeUOM;
  qryWareOrderOutEdit.fieldbyname('AreaUOM').AsString:=strAreaUOM;
  qryWareOrderOutEdit.fieldbyname('WeightUOM').AsString:=strWeightUOM;
  qryWareOrderOutEdit.fieldbyname('skuname').AsString:=deleteJVHZ(strSKUNameTotal,50);
end;

procedure TfrmWareOrderOut.ckbCountcontcostClick(Sender: TObject);
begin
  if (DataState in Setdcs) and ckbCountcontcost.Checked then
  begin
    qryWareOrderOutEdit.Edit;
    qryWareOrderOutEdit.FieldByName('countrent').Asstring:='F';
  end;
end;

procedure TfrmWareOrderOut.mitSplitClick(Sender: TObject);
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
    if (qryWareOrderOutEdit.FieldByName('Volume').AsFloat=0) and
       (qryWareOrderOutEdit.FieldByName('Area').AsFloat=0) and
       (qryWareOrderOutEdit.FieldByName('GrossWeight').AsFloat=0) and
       (qryWareOrderOutEdit.FieldByName('NetWeight').AsFloat=0) then exit;

    extVolume:=qryWareOrderOutEdit.FieldByName('Volume').AsFloat;
    extArea:=qryWareOrderOutEdit.FieldByName('Area').AsFloat;
    extGrossWeight:=qryWareOrderOutEdit.FieldByName('GrossWeight').AsFloat;
    extNetWeight:=qryWareOrderOutEdit.FieldByName('NetWeight').AsFloat;
    //取得数量合计
    qryWareOrderOutSKU.DisableControls;
    qryWareOrderOutSKU.first;
    while not qryWareOrderOutSKU.eof do
    begin
      QuantityTotal   :=QuantityTotal+qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat;
      qryWareOrderOutSKU.Next;
    end;
    LastSNO:=qryWareOrderOutSKU.fieldbyname('SNO').AsInteger;
    qryWareOrderOutSKU.First;
    qryWareOrderOutSKU.EnableControls;
    qryWareOrderOutSKUAfterScroll(qryWareOrderOutSKU);
    //数量拆分
    qryWareOrderOutSKU.DisableControls;
    qryWareOrderOutSKU.first;
    while not qryWareOrderOutSKU.eof do
    begin
      qryWareOrderOutSKU.Edit;
      if extVolume<>0 then
        if qryWareOrderOutSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderOutSKU.fieldbyname('Volume').asfloat:=kround(qryWareOrderOutSKU.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
        else
          qryWareOrderOutSKU.fieldbyname('Volume').asfloat:=extVolume-VolumeTotal;
      if extArea<>0 then
        if qryWareOrderOutSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderOutSKU.fieldbyname('Area').asfloat:=kround(qryWareOrderOutSKU.fieldbyname('Quantity').asFloat*extArea/QuantityTotal,4)
        else
          qryWareOrderOutSKU.fieldbyname('Area').asfloat:=extArea-AreaTotal;
      if extNetWeight<>0 then
        if qryWareOrderOutSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderOutSKU.fieldbyname('NetWeight').asfloat:=kround(qryWareOrderOutSKU.fieldbyname('Quantity').asFloat*extNetWeight/QuantityTotal,4)
        else
          qryWareOrderOutSKU.fieldbyname('NetWeight').asfloat:=extNetWeight-NetWeightTotal;
      if extGrossWeight<>0 then
        if qryWareOrderOutSKU.fieldbyname('SNO').asfloat<>LastSNO then
          qryWareOrderOutSKU.fieldbyname('GrossWeight').asfloat:=kround(qryWareOrderOutSKU.fieldbyname('Quantity').asFloat*extGrossWeight/QuantityTotal,4)
        else
          qryWareOrderOutSKU.fieldbyname('GrossWeight').asfloat:=extGrossWeight-GrossWeightTotal;

      VolumeTotal     :=VolumeTotal+qryWareOrderOutSKU.fieldbyname('Volume').asfloat;
      AreaTotal       :=AreaTotal+qryWareOrderOutSKU.fieldbyname('Area').asfloat;
      NetWeightTotal  :=NetWeightTotal+qryWareOrderOutSKU.fieldbyname('NetWeight').asfloat;
      GrossWeightTotal:=GrossWeightTotal+qryWareOrderOutSKU.fieldbyname('GrossWeight').asfloat;

      qryWareOrderOutSKU.Next;
    end;
    qryWareOrderOutSKU.First;
    qryWareOrderOutSKU.EnableControls;
    qryWareOrderOutSKUAfterScroll(qryWareOrderOutSKU);
  end;
end;

procedure TfrmWareOrderOut.mitSKU_INClick(Sender: TObject);
var strJobno_IN:string;
begin
  with qryWareOrderOutSKU do
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
    'W':
      WorkWareOrderIn(stBrowse,strJobno_IN,nil,nil);
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

procedure TfrmWareOrderOut.edtCustomsNO_INEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderOut.edtVolumeDblClick(Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
begin
   jsPiece   :=qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
   jsHeight  :=qryWareOrderOutSKU.FieldByName('Height').AsFloat;
   jsWidth   :=qryWareOrderOutSKU.FieldByName('Width').AsFloat;
   jsDepth   :=qryWareOrderOutSKU.FieldByName('Depth').AsFloat;
   jsVolume  :=qryWareOrderOutSKU.FieldByName('Volume').AsFloat;
   jsSizeUOM :=qryWareOrderOutSKU.FieldByName('SizeUOM').AsString;
   jsVolueUOM:=qryWareOrderOutSKU.FieldByName('VolumeUOM').AsString;
    while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and (DataState in Setdcs) do
     begin
       qryWareOrderOutSKU.Edit;
       qryWareOrderOutSKU.FieldByName('Height').AsFloat    :=jsHeight;
       qryWareOrderOutSKU.FieldByName('Width').AsFloat     :=jsWidth;
       qryWareOrderOutSKU.FieldByName('Depth').AsFloat     :=jsDepth;
       qryWareOrderOutSKU.FieldByName('Volume').AsFloat    :=jsVolume;
       qryWareOrderOutSKU.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
       qryWareOrderOutSKU.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
       exit;
     end;
end;

procedure TfrmWareOrderOut.edtSNOEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmWareOrderOut.edtCostcusidEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    strGetCd:=edtCostcusid.Text;
    oldedtCostCus:=edtCostcusid.Text;
  end;
end;

procedure TfrmWareOrderOut.edtCostcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostcusid.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('costcusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtCostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.Edit;
            qryWareOrderOutEdit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
      if edtCostcusid.Text<>'' then
         InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+edtCostcusid.TextField+'"');
   end;
end;

procedure TfrmWareOrderOut.edtAccountIDEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    if (strInOut='I')  then
       TdxDBButtonEdit(sender).DirectInput:=True
    else
    begin
       TdxDBButtonEdit(sender).DirectInput:=False;
//       TdxDBButtonEdit(sender).ReadOnly:=True;
    end;   
    strGetCd:=edtCusid.Field.AsString;
  end;
end;

procedure TfrmWareOrderOut.edtAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
{wql_new  with TdxDBButtonEdit(sender) do
    if (Text<>'') and (Text<>strGetCd) then
    begin
      with workAccountselect('B',edtCusid.Field.AsString) do
      if okflag  then
      begin
        qryWareOrderOutSKU.Edit;
        qryWareOrderOutSKU.Fieldbyname('cusid').asstring  :=cusid;
        qryWareOrderOutSKU.Fieldbyname('cusname').asstring:=ACCOUNT_SHORTNAME;
        strGetCd:=ACCOUNT_SHORTNAME;
      end else Failed:=True;
    end; wql_new}
end;

procedure TfrmWareOrderOut.cmbShipperAccountIDEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
    if (strInOut='I')  then
       TdxDBButtonEdit(sender).DirectInput:=True
    else
       TdxDBButtonEdit(sender).DirectInput:=False;
    strGetCd:=edtshippercusid.Field.AsString;
  end;
end;

procedure TfrmWareOrderOut.cmbShipperAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
 {wql_new  with TdxDBButtonEdit(sender) do
    if (Text<>'') and (Text<>strGetCd) then
    begin
      with workAccountselect('C',edtshippercusid.Field.AsString) do
      if OkFlag then
      begin
        qryWareOrderOutSKU.Edit;
        qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring  :=cusid;
        qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring:=ACCOUNT_SHORTNAME;
        strGetCd:=ACCOUNT_SHORTNAME;
      end else Failed:=True;
    end; wql_new}
end;

procedure TfrmWareOrderOut.cmbLocationIDEnter(Sender: TObject);
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

procedure TfrmWareOrderOut.cmbLocationIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
{wql_new  if DataState in setDcs then
  begin
    with worklocationselect('','',cmbLocationID.Field.AsString) do
    if okFlag then
    begin
      qryWareOrderOutSKU.Edit;
      qryWareOrderOutSKU.Fieldbyname('locid').asstring:=locid;
      qryWareOrderOutSKU.Fieldbyname('LocationName').asstring:=LocationName;
      strGetCd:=LocationName;
    end else Failed:=True;
  end;  wql_new}
end;

procedure TfrmWareOrderOut.mitLIInventoryClick(Sender: TObject);
var strsql,strFilter1,strFilter2:string;
begin
  strFilter1:=' and item.Jobno="'+qryWareOrderOutSKU.FieldbyName('jobnoin').AsString+'" '
             +' and item.SNO='+inttostr(qryWareOrderOutSKU.FieldbyName('snoin').AsInteger)
              ;
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
         +' where 1=1 '+strFilter1
         ;
  opensql(dataTmp.qryTmp,strsql);
  kMessageDlg(GetMessage('frmLocationOut','064')+dataTmp.qryTmp.fieldbyname('LocationBillNO').asString+','+chr(13)
             +GetMessage('frmLocationOut','065')+Floattostr(dataTmp.qryTmp.fieldbyname('quantityorderremain').AsFloat)+','+chr(13)
             +GetMessage('frmLocationOut','066')+Floattostr(dataTmp.qryTmp.fieldbyname('quantitytaskremain').AsFloat)+','+chr(13)
             +GetMessage('frmLocationOut','067')+Floattostr(dataTmp.qryTmp.fieldbyname('quantityremain').AsFloat)+'!', mtInformation, [mbOK], 0);
  //iif(_language='CAPTIONC','对应进仓的仓单号为','')  IIF(_language='CAPTIONC','该单指令数量还剩','')iif(_language='CAPTIONC','该单任务数量还剩','')
  //iif(_language='CAPTIONC','该单库存数量还剩','')
end;

procedure TfrmWareOrderOut.mitOrder_INClick(Sender: TObject);
begin
 workWareOrderSelect(qryWareOrderOutSKU.FieldbyName('Jobno').AsString,
                     qryWareOrderOutSKU.FieldbyName('SNO').AsInteger,
                     iif(qryWareOrderOutEdit.FieldByName('DictateType').asstring='进仓指令','I','O'));
end;

procedure TfrmWareOrderOut.grdWareOrderChangeNodeEx(Sender: TObject);
begin
  if (qryWareOrderOutEdit.ParamByName('Jobno').AsString<>qryWareOrderOut.FieldByName('Jobno').AsString)
    or (qryWareOrderOutEdit.ParamByName('Jobno').AsString='') then
  begin
    qryWareOrderOutEdit.ParamByName('Jobno').AsString:=qryWareOrderOut.FieldByName('Jobno').AsString;
    qryWareOrderOutOriSKU.ParamByName('Jobno').AsString:=qryWareOrderOut.FieldByName('Jobno').AsString;
    qryWareOrderOutSKU.ParamByName('Jobno').AsString:=qryWareOrderOut.FieldByName('Jobno').AsString;
   //控制商品细目
      qryWareorderOutSkuDetail.Close;
      if not m_blnPost then
      begin
        SetDetailActive(False,False);
        if (DataState = stInsert) then SetDetailActive(False,True)
        else if pcWareOrder.ActivePage=tbsEdit then SetDetailActive(True,True);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtCostcusidExit(Sender: TObject);
begin
   blnSelect:=False;
   data.WareOrder_strOrderCusID:=qryWareOrderOutEdit.FieldByName('costcusid').AsString;
   data.WareOrder_strOrderCusName:=qryWareOrderOutEdit.FieldByName('costcusname').AsString;
   data.WareOrder_strOrderShippercusid   :=qryWareOrderOutEdit.FieldByName('costcusid').Asstring;
   data.WareOrder_strOrderShippercusname :=qryWareOrderOutEdit.FieldByName('costcusname').Asstring;
  {wql_new if (DataState in Setdcs) and (oldedtCostCus<>edtCostcusid.Text) then
  begin
    with workAccountCNFGSelect( edtCostcusid.textfield,
           edtCostcusid.text) do
    if OkFlag then
    begin
      _ACC_PreservingDigit:=PreservingDigit;
      qryWareOrderOutEdit.FieldByName('isbond').Asstring :=isbond;
      if edtOrderType.Text='出仓指令' then
        qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LO_LoadType
      else
        qryWareOrderOutEdit.FieldByName('LoadType').AsString             :=LoadType;
      qryWareOrderOutEdit.FieldByName('contwithloca').AsString      :=contwithloca;
      qryWareOrderOutEdit.FieldByName('lottracked').AsString        :=lottracked;
      qryWareOrderOutEdit.FieldByName('countrent').AsString         :=countrent;
      qryWareOrderOutEdit.FieldByName('WO_CountLoadCost').AsString     :=WO_CountLoadCost;
      qryWareOrderOutEdit.FieldByName('countcontcost').AsString     :=countcontcost;
      qryWareOrderOutEdit.FieldByName('skucostclasscd').AsString       :=skucostclasscd;
      qryWareOrderOutEdit.FieldByName('warerentcounttype').Asstring    :=warerentcounttype;
      data.WareOrder_strOrderCusID:=iif(cusid='',qryWareOrderOutEdit.FieldByName('costcusid').AsString,cusid);
      data.WareOrder_strOrderCusName:=iif(cusname='',qryWareOrderOutEdit.FieldByName('costcusname').AsString,cusname);
      data.WareOrder_strOrderShippercusid   :=iif(shippercusid<>'',shippercusid,qryWareOrderOutEdit.FieldByName('costcusid').Asstring);
      data.WareOrder_strOrderShippercusname :=iif(shippercusname<>'',shippercusname,qryWareOrderOutEdit.FieldByName('costcusname').Asstring);
    end;
  end; wql_new}
end;

procedure TfrmWareOrderOut.mitSKUSelectClick(Sender: TObject);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
  if strInOut='I' then
  begin
    if DataState in Setdcs then
    begin
      if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
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
            qryWareOrderOutSKU.edit;
            qryWareOrderOutEdit.Edit;
            qryWareOrderOutEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
            qryWareOrderOutEdit.fieldbyname('Quantity').AsFloat           :=qryselect.fieldbyname('Quantity_set').AsFloat;
            qryWareOrderOutEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
          end else
          begin
//            if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//            then break;
            qryWareOrderOutSKU.append;
            qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
            qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
            qryWareOrderOutSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
          end;
          qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
          qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
          strGetCd := qryselect.fieldbyname('SKUName').asstring;
          if qryselect.Fieldbyname('LotCode').asstring<>'' then
            qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
          if qryselect.fieldbyname('Quantity').AsFloat<>0 then
            qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
          if qryselect.Fieldbyname('QualityName').asstring<>'' then
            qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring;
          qryWareOrderOutOriSKU.fieldbyname('QuantityUOM').asstring            :=qryselect.fieldbyname('QuantityUOM').asstring;
          qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring;
          qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring;
          qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring;
          qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring;
          if qryWareOrderOutSKU.fieldByname('cusid').AsString='' then
            qryWareOrderOutSKU.fieldByname('cusid').AsString           :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderOutSKU.fieldByname('cusname').AsString='' then
            qryWareOrderOutSKU.fieldByname('cusname').AsString         :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;
          if qryWareOrderOutSKU.fieldByname('shippercusid').AsString='' then
            qryWareOrderOutSKU.fieldByname('shippercusid').AsString    :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
          if qryWareOrderOutSKU.fieldByname('shippercusname').AsString='' then
            qryWareOrderOutSKU.fieldByname('shippercusname').AsString  :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;
//          if qryWareOrderOutSKU.fieldByname('costcusid').AsString='' then
//            qryWareOrderOutSKU.fieldByname('costcusid').AsString           :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
//          if qryWareOrderOutSKU.fieldByname('costcusname').AsString='' then
//            qryWareOrderOutSKU.fieldByname('costcusname').AsString         :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;

          qryWareOrderOutSKU.fieldbyname('TagEachUOM').Asstring          :='';

          qryWareOrderOutSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
          qryWareOrderOutSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
          qryWareOrderOutSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
          qryWareOrderOutSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
          qryWareOrderOutSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
          qryWareOrderOutSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;

          qryWareOrderOutSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
          qryWareOrderOutSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
          qryWareOrderOutSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
          qryWareOrderOutSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

          OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                +'  from skuprice '
                                +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderOutEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                +'   and uomtype="'+qryWareOrderOutSKU.fieldbyname('CostUOMType').AsString+'"'
                                +'   and userid like "'+_userid+'%"'
                 );
          qryWareOrderOutSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
          qryWareOrderOutSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
          qryWareOrderOutSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
          qryWareOrderOutSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
          qryWareOrderOutSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
//wql_new          qryWareOrderOutSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
//wql_new          qryWareOrderOutSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
//wql_new          qryWareOrderOutSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
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
                                                        qryWareOrderOutSKU.fieldbyname('cusid').asstring,
                                                        qryWareOrderOutSKU.fieldbyname('cusname').asstring);

          for i:=0 to 500 do
          begin
            if TLocationSKUSelect[i].OkFlag then
            begin
              if i=0 then
              begin
                qryWareOrderOutSKU.edit;
                qryWareOrderOutEdit.Edit;
                qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
                qryWareOrderOutEdit.fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond;
                qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
                qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
                qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring   :=TLocationSKUSelect[i].skucostclasscd;
                qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype;
                qryWareOrderOutEdit.fieldbyname('loadcosttype').asstring     :=TLocationSKUSelect[i].loadcosttype;
                if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
                begin
                  qryWareOrderOutEdit.fieldbyname('costcusid').asstring  :=TLocationSKUSelect[i].costcusid;
                  qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
                end;
                ckbCountcontcostClick(self);
              end else
              begin
//                if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//                then break;
                qryWareOrderOutSKU.append;
                qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
                qryWareOrderOutSKU.fieldByname('jobno').AsString         :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
                qryWareOrderOutSKU.fieldByname('userid').AsString        :=qryWareOrderOutEdit.fieldbyname('userid').AsString;
              end;
              qryWareOrderOutSKU.fieldbyname('SKUID').asstring           :=TLocationSKUSelect[i].SKUID            ;
              qryWareOrderOutSKU.fieldbyname('skuname').asstring         :=TLocationSKUSelect[i].skuname          ;
              qryWareOrderOutSKU.Fieldbyname('LotCode').asstring         :=TLocationSKUSelect[i].LotCode          ;
              qryWareOrderOutSKU.Fieldbyname('locid').asstring           :=TLocationSKUSelect[i].locid       ;
              qryWareOrderOutSKU.Fieldbyname('LocName').asstring         :=TLocationSKUSelect[i].LocName       ;
              qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat         :=TLocationSKUSelect[i].syquantity        ;
              qryWareOrderOutSKU.fieldbyname('QualityName').asstring     :=TLocationSKUSelect[i].QualityName      ;
              qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring        :=TLocationSKUSelect[i].PieceUOM         ;
              qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring       :=TLocationSKUSelect[i].WeightUOM        ;
              qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring       :=TLocationSKUSelect[i].VolumeUOM        ;
              qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring         :=TLocationSKUSelect[i].AreaUOM          ;
              qryWareOrderOutSKU.fieldbyname('Piece').AsFloat            :=TLocationSKUSelect[i].syPiece          ;
              qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat        :=TLocationSKUSelect[i].syNetWeight      ;
              qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat      :=TLocationSKUSelect[i].syGrossWeight    ;
              qryWareOrderOutSKU.fieldbyname('Volume').asFloat           :=TLocationSKUSelect[i].syVolume         ;
              qryWareOrderOutSKU.Fieldbyname('Area').asFloat             :=TLocationSKUSelect[i].syArea           ;
              qryWareOrderOutSKU.fieldbyname('cusid').asstring           :=TLocationSKUSelect[i].cusid        ;
              qryWareOrderOutSKU.fieldbyname('cusname').asstring         :=TLocationSKUSelect[i].cusname      ;
              qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring    :=TLocationSKUSelect[i].shippercusid ;
              qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring  :=TLocationSKUSelect[i].shippercusname  ;
              qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring       :=TLocationSKUSelect[i].shipcusid ;
              qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring     :=TLocationSKUSelect[i].shipcusname  ;
              qryWareOrderOutSKU.fieldbyname('costcusid').asstring       :=TLocationSKUSelect[i].costcusid        ;
              qryWareOrderOutSKU.fieldbyname('costcusname').asstring     :=TLocationSKUSelect[i].costcusname      ;
//              qryWareOrderOutSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
              qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring     :=TLocationSKUSelect[i].contwithloca   ;
              qryWareOrderOutSKU.Fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked     ;
              qryWareOrderOutSKU.Fieldbyname('skucost').asFloat           :=TLocationSKUSelect[i].skucost          ;
              qryWareOrderOutSKU.Fieldbyname('currcd').asstring           :=TLocationSKUSelect[i].currcd  ;
              qryWareOrderOutSKU.fieldbyname('price').asFloat             :=TLocationSKUSelect[i].price     ;
              qryWareOrderOutSKU.fieldbyname('costuomtype').asstring      :=TLocationSKUSelect[i].costuomtype   ;
              qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring          :=TLocationSKUSelect[i].Jobno  ;
              qryWareOrderOutSKU.fieldbyname('snoin').asInteger           :=TLocationSKUSelect[i].SNO    ;
              qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger         :=TLocationSKUSelect[i].LDSNO ;
              qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring         :=TLocationSKUSelect[i].jobnoinf  ;
              qryWareOrderOutSKU.fieldbyname('snoinf').asInteger          :=TLocationSKUSelect[i].snoinf    ;
              qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger        :=TLocationSKUSelect[i].ldsnoinf ;
              qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring         :=TLocationSKUSelect[i].jobnoori  ;
              qryWareOrderOutSKU.fieldbyname('snoori').asInteger          :=TLocationSKUSelect[i].snoori    ;
              if  qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring<>'' then
              qryWareOrderOutSKU.Fieldbyname('jobnooridp').asstring       :='T';

              qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring        :=TLocationSKUSelect[i].CustomsNO ;
              qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring   :=TLocationSKUSelect[i].LocationBillNO ;
              qryWareOrderOutSKU.Fieldbyname('TagEach').asstring          :=TLocationSKUSelect[i].TagEach   ;
              qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring       :=TLocationSKUSelect[i].TagEachUOM     ;
              qryWareOrderOutSKU.Fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond   ;
              qryWareOrderOutSKU.Fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent     ;
              qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost   ;
              qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype     ;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring         :=TLocationSKUSelect[i].costcusid ;
              qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring      :=TLocationSKUSelect[i].loadcostone ;
              qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString   :=TLocationSKUSelect[i].skucostclasscd;
              qryWareOrderOutSKU.Fieldbyname('carriage').asFloat          :=TLocationSKUSelect[i].carriage;
              qryWareOrderOutSKU.Fieldbyname('carriagetotal').asFloat     :=TLocationSKUSelect[i].carriagetotal;
              qryWareOrderOutSKU.fieldbyname('insurance').asFloat         :=TLocationSKUSelect[i].insurance;
              qryWareOrderOutSKU.Fieldbyname('insurancetotal').asFloat    :=TLocationSKUSelect[i].insurancetotal;
              qryWareOrderOutSKU.Fieldbyname('SKU_CustomerID').asString   :=TLocationSKUSelect[i].customerno;
              qryWareOrderOutSKU.Fieldbyname('skumodel').asString         :=TLocationSKUSelect[i].skumodel;
              qryWareOrderOutSKU.Fieldbyname('skuspec').asString          :=TLocationSKUSelect[i].skuspec;
              qryWareOrderOutSKU.Fieldbyname('color').asString            :=TLocationSKUSelect[i].color;
//wql_new              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TLocationSKUSelect[i].syquantity;
//              if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
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

procedure TfrmWareOrderOut.mitTaskSKUSelectClick(Sender: TObject);
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
             qryWareOrderOutSKU.edit;
             qryWareOrderOutEdit.edit;
             qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TContainerSKUSelect[i].lottracked;
             qryWareOrderOutEdit.fieldbyname('isbond').asstring:=TContainerSKUSelect[i].isbond;
             qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TContainerSKUSelect[i].countrent;
             qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TContainerSKUSelect[i].countcontcost;
             qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring      :=TContainerSKUSelect[i].skucostclasscd;
             qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring   :=TContainerSKUSelect[i].warerentcounttype;
             if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
             begin
               qryWareOrderOutEdit.fieldbyname('costcusid').asstring:=TContainerSKUSelect[i].costcusid;
               qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=TContainerSKUSelect[i].costcusname;
             end;
             ckbCountcontcostclick(self);
           end else
           begin
//             if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//             then break;
             qryWareOrderOutSKU.append;
             qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
             qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
             qryWareOrderOutSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
             qryWareOrderOutSKU.fieldByname('DataBaseID').AsString:=_DataBaseID;
           end;
            qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=TContainerSKUSelect[i].SKUID            ;
            qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=TContainerSKUSelect[i].skuname          ;
            qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=TContainerSKUSelect[i].LotCode          ;
            qryWareOrderOutSKU.Fieldbyname('locid').asstring          :=TContainerSKUSelect[i].locid       ;
            qryWareOrderOutSKU.Fieldbyname('LocationName').asstring        :=TContainerSKUSelect[i].LocationName       ;
            qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=TContainerSKUSelect[i].syquantity        ;
            qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=TContainerSKUSelect[i].QualityName      ;
            qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=TContainerSKUSelect[i].PieceUOM         ;
            qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=TContainerSKUSelect[i].WeightUOM        ;
            qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=TContainerSKUSelect[i].VolumeUOM        ;
            qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=TContainerSKUSelect[i].AreaUOM          ;
            qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=TContainerSKUSelect[i].syPiece          ;
            qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=TContainerSKUSelect[i].syNetWeight      ;
            qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=TContainerSKUSelect[i].syGrossWeight    ;
            qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=TContainerSKUSelect[i].syVolume         ;
            qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=TContainerSKUSelect[i].syArea           ;
            qryWareOrderOutSKU.fieldbyname('cusid').asstring           :=TContainerSKUSelect[i].cusid        ;
            qryWareOrderOutSKU.fieldbyname('cusname').asstring         :=TContainerSKUSelect[i].cusname      ;
            qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring    :=TContainerSKUSelect[i].shippercusid ;
            qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring  :=TContainerSKUSelect[i].shippercusname  ;
//              qryWareOrderOutSKU.Fieldbyname('piecepro').asFloat  :=TLocationSKUSelect[i].syPiece/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.Fieldbyname('VolumePro').asFloat :=TLocationSKUSelect[i].syVolume/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('NetWeightPro').asFloat   :=TLocationSKUSelect[i].syNetWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('GrossWeightPro').asFloat :=TLocationSKUSelect[i].syGrossWeight/TLocationSKUSelect[i].syquantity;
//              qryWareOrderOutSKU.fieldbyname('AreaPro').asFloat   :=TLocationSKUSelect[i].syArea/TLocationSKUSelect[i].syquantity;
            qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring     :=TContainerSKUSelect[i].contwithloca   ;
            qryWareOrderOutSKU.Fieldbyname('lottracked').asstring       :=TContainerSKUSelect[i].lottracked     ;
            qryWareOrderOutSKU.Fieldbyname('skucost').asFloat             :=TContainerSKUSelect[i].skucost          ;
            qryWareOrderOutSKU.Fieldbyname('currcd').asstring    :=TContainerSKUSelect[i].currcd  ;
            qryWareOrderOutSKU.fieldbyname('price').asFloat        :=TContainerSKUSelect[i].price     ;
            qryWareOrderOutSKU.fieldbyname('costuomtype').asstring     :=TContainerSKUSelect[i].costuomtype   ;
            qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring            :=TContainerSKUSelect[i].jobnoin  ;
            qryWareOrderOutSKU.fieldbyname('snoin').asInteger             :=TContainerSKUSelect[i].snoin    ;
            qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=TContainerSKUSelect[i].ldsnoin  ;
            qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring          :=TContainerSKUSelect[i].jobnoinf  ;
            qryWareOrderOutSKU.fieldbyname('snoinf').asInteger           :=TContainerSKUSelect[i].snoinf    ;
            qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger        :=TContainerSKUSelect[i].ldsnoinf    ;
            qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring           :=TContainerSKUSelect[i].CustomsNO ;
            qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring      :=TContainerSKUSelect[i].LocationBillNO ;
            qryWareOrderOutSKU.Fieldbyname('WO_TagEach').asstring          :=TContainerSKUSelect[i].WO_TagEach   ;
            qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring          :=TContainerSKUSelect[i].TagEachUOM     ;
            qryWareOrderOutSKU.Fieldbyname('isbond').asstring:=TContainerSKUSelect[i].isbond   ;
            qryWareOrderOutSKU.Fieldbyname('countrent').asstring        :=TContainerSKUSelect[i].countrent     ;
            qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring    :=TContainerSKUSelect[i].countcontcost   ;
            qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring   :=TContainerSKUSelect[i].warerentcounttype     ;
            qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring            :=TContainerSKUSelect[i].costcusid ;
            qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring      :=TContainerSKUSelect[i].loadcostone ;
            qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString      :=TContainerSKUSelect[i].skucostclasscd;
            qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TContainerSKUSelect[i].syquantity;
            qryWareOrderOutSKU.Fieldbyname('TK_Jobno').AsString            :=TContainerSKUSelect[i].Jobno;
            qryWareOrderOutSKU.Fieldbyname('TK_sno').asInteger             :=TContainerSKUSelect[i].sno;
         end;
       end;
     end; wql_new}
end;

procedure TfrmWareOrderOut.edtQuantityEnter(Sender: TObject);
begin
{   if (strINOUT='O') and (qryWareOrderOutSKU.FieldByName('customsunite').asstring='T') then
      TdxDBCalcEdit(sender).ReadOnly:=True
   else
      TdxDBCalcEdit(sender).ReadOnly:=False;}
end;

procedure TfrmWareOrderOut.cmbQualityNameEnter(Sender: TObject);
begin
   if (strINOUT='O') then
      TdxDBButtonEdit(sender).ReadOnly:=True
   else
      TdxDBButtonEdit(sender).ReadOnly:=False;
end;

procedure TfrmWareOrderOut.ckbIsbondClick(Sender: TObject);
begin
  if qryWareOrderOutEdit.FieldByName('Customsunite').asstring='T' then
    qryWareOrderOutEdit.FieldByName('isbond').asstring:='T';
end;

procedure TfrmWareOrderOut.mitInputModalClick(Sender: TObject);
var
  ComJobno:string;
begin
  if  mitInputModal.Checked then
  begin
    ComJobno:=qryWareOrderOut.FieldByName('Jobno').AsString;
    strINOUTsql:=qryWareOrderOut.SQL.Text;
    strINOUTWhere:=qryWareOrderOut.MacroByName('Where').AsString;
    qryWareOrderOut.Close;
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
    qryWareOrderOut.Sql.Clear;
    qryWareOrderOut.Sql.Add(strSql);
    qryWareOrderOut.MacroByName('Where').AsString:=strINOUTWhere;
  end else
  begin
    ComJobno:=qryWareOrderOut.FieldByName('Jobno').AsString;
    qryWareOrderOut.Sql.Clear;
    qryWareOrderOut.Sql.Add(strINOUTsql);
    qryWareOrderOut.MacroByName('Where').AsString:=strINOUTWhere;
  end;
  qryWareOrderOut.DisableControls;
  qryWareOrderOut.Open;
  try
    qryWareOrderOut.Locate('Jobno',strJobno,[loCaseInsensitive, loPartialKey]);
  except
    qryWareOrderOut.Last;
  end;
  qryWareOrderOut.EnableControls;

  grdWareOrderChangeNodeEx(nil);
  SetDetailActive(False,False);
  SetDetailActive(True,True);
  WorkCall(stBrowse);
end;

procedure TfrmWareOrderOut.grdWareOrderCustomDrawCell(Sender: TObject;
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

procedure TfrmWareOrderOut.pcInfoChange(Sender: TObject);
begin
  if qryWareOrderOut.active then SetDetailActive(True,True);
end;

procedure TfrmWareOrderOut.cmbSKUNameDblClick(Sender: TObject);
begin
   if (strINOUT='I') and (DataState=stBrowse) and (qryWareOrderOutSKU.FieldByName('SkuId').AsString<>'') then
   begin
      with WorkChangeSkuName(qryWareOrderOutSKU.FieldByName('SkuId').AsString) do
      if OkFlag then
      btnRefreshClick(self);
   end;
end;

procedure TfrmWareOrderOut.grdOriSKUChangeNodeEx(Sender: TObject);
begin
  if grdOriSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdOriSKUBeforeInsert;
  end;
end;

procedure TfrmWareOrderOut.grdOriSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin

  if not (DataState in Setdcs)  then
    Allow:=False
  else
  begin
    qryWareOrderOutSKU.first;
    if (qryWareOrderOutSKU.RecordCount>0) then
    begin
//      Kmessagedlg('校验指令已生成,无法删改!', mtWarning, [mbOK], 0);
      Allow:=False
    end else
    Allow:=True;
  end;
end;

procedure TfrmWareOrderOut.grdOriSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (qryWareOrderOutOriSKU.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddOriSKUClick(Sender);
  end;
end;

procedure TfrmWareOrderOut.mitAddOriSKUClick(Sender: TObject);
begin
  qryWareOrderOutOriSKU.Append;
  grdOriSKU.SetFocus;
  grdOriSKUBeforeInsert;
end;

procedure TfrmWareOrderOut.grdOriSKUKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWareOrderOut.grdSKUChangeNodeEx(Sender: TObject);
begin
  if grdSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdSKUBeforeInsert;
  end;
   qryWareorderOutSkuDetail.Filtered:=false;
   if qryWareOrderOutSKU.fieldbyname('sno').AsString<>'' then
      qryWareorderOutSkuDetail.filter:='sno='+qryWareOrderOutSKU.fieldbyname('sno').AsString
   else
      qryWareorderOutSkuDetail.filter:='sno=-1';
   qryWareorderOutSkuDetail.Filtered:=true;
end;

procedure TfrmWareOrderOut.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then
     Allow:=False else
  begin
  //指令与任务数不等时,可修改,在修改时判断是指令数是否大于任务数
    if (_DB_Order<>'T') and (qryWareOrderOutSKU.FieldByName('Quantitytask').AsFloat<>0) then
       Allow:=False
    else if (_DB_Order='T') and (qryWareOrderOutSKU.FieldByName('Quantitytask').AsFloat<>0) and 
       (qryWareOrderOutSKU.FieldByName('Quantitytask').AsFloat=qryWareOrderOutSKU.FieldByName('Quantity').AsFloat) then //<>0
       Allow:=False
    else
       Allow:=True;
  end;
end;

procedure TfrmWareOrderOut.grdSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (qryWareOrderOutSKU.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddSKUClick(Sender);
  end;
end;

procedure TfrmWareOrderOut.mitDelOriSKUClick(Sender: TObject);
begin
  qryWareOrderOutSKU.first;
  if (qryWareOrderOutSKU.recordcount>0) then
  begin
    {if _Language='CAPTIONC' then
       _strmessage:='校验指令已生成,无法删改!'
    else
        _strmessage:='**************';}
    Kmessagedlg(GetMessage('frmWareOrderDxALL','028'), mtWarning, [mbOK], 0);
    exit;
  end else
  if qryWareOrderOutOriSKU.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    qryWareOrderOutOriSKU.Delete;
    grdOriSKU.SetFocus;
  end;
end;

procedure TfrmWareOrderOut.grdOriSKUBeforeInsert;
begin
  grdOriSKU.FocusedColumn:=0;
  qryWareOrderOutOriSKU.Fieldbyname('SNO').AsFloat  :=-1;

  qryWareOrderOutOriSKU.fieldByname('JOBNO').AsString:=qryWareOrderOutEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderOutOriSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('QualityName').AsString:='正品';
  qryWareOrderOutOriSKU.FieldByName('costuomtype').AsString:=iif(strCostcountuom='','piece',strCostcountuom);

  qryWareOrderOutOriSKU.fieldByname('operationtype').AsInteger:=-1;
  qryWareOrderOutOriSKU.fieldByname('CustomsNO').AsString:=qryWareOrderOutEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('cusid').AsString         :=iif(WareOrder_copyCusID='',WareOrder_strOrderCusID,WareOrder_copyCusID);
  qryWareOrderOutOriSKU.fieldByname('cusname').AsString       :=iif(WareOrder_copyCusName='',WareOrder_strOrderCusName,WareOrder_copyCusName);
  qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString  :=iif(WareOrder_Copyshippercusid='',WareOrder_strOrderShippercusid,WareOrder_Copyshippercusid);
  qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString:=iif(WareOrder_Copyshippercusname='',WareOrder_strOrderShippercusname,WareOrder_Copyshippercusname);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusid').AsString     :=iif(wareorder_CopyCostCusid='',qryWareOrderEdit.fieldbyname('costcusid').AsString,wareorder_CopyCostCusid);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusname').AsString   :=iif(wareorder_CopyCostCusname='',qryWareOrderEdit.fieldbyname('costcusname').AsString,wareorder_CopyCostCusname);

  qryWareOrderOutOriSKU.fieldByname('OrderStatus').AsString:=qryWareOrderOutEdit.fieldByname('OrderStatus').AsString;
  qryWareOrderOutOriSKU.fieldByname('NotFullSign').AsString:='F';
 { qryWareOrderOutOriSKU.Fieldbyname('SNO').AsFloat  :=-1;

  qryWareOrderOutOriSKU.fieldByname('JOBNO').AsString:=qryWareOrderOutEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderOutOriSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('locid').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('QualityName').AsString:='正品';
  qryWareOrderOutOriSKU.fieldByname('operationtype').AsInteger:=iif(strInOut='I',1,-1);
  qryWareOrderOutOriSKU.fieldByname('CustomsNO').AsString:=qryWareOrderOutEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('cusid').AsString         :=iif(data.WareOrder_copyCusID='',data.WareOrder_strOrderCusID,data.WareOrder_copyCusID);
  qryWareOrderOutOriSKU.fieldByname('cusname').AsString       :=iif(data.WareOrder_copyCusName='',data.WareOrder_strOrderCusName,data.WareOrder_copyCusName);
  qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString  :=iif(data.WareOrder_Copyshippercusid='',data.WareOrder_strOrderShippercusid,data.WareOrder_Copyshippercusid);
  qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString:=iif(data.WareOrder_Copyshippercusname='',data.WareOrder_strOrderShippercusname,data.WareOrder_Copyshippercusname);

  qryWareOrderOutOriSKU.fieldByname('OrderStatus').AsString:=qryWareOrderOutEdit.fieldByname('OrderStatus').AsString;
  qryWareOrderOutOriSKU.fieldByname('NotFullSign').AsString:='F';
  }
end;

procedure TfrmWareOrderOut.grdSKUBeforeInsert;
begin
  grdSKU.FocusedColumn:=0;
  qryWareOrderOutSKU.Fieldbyname('SNO').AsFloat  :=-1;

end;


procedure TfrmWareOrderOut.edtshippercusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutOriSKU.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
  if (strOrderType='OI') or (strOrderType='OP') or ((strOrderType='VA') and (strInOut='I')) or (_isfromsku='T') then
  begin
     if DataState in Setdcs then
     begin
        if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
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
              qryWareOrderOutOriSKU.edit;
              qryWareOrderOutEdit.Edit;
              qryWareOrderOutEdit.fieldbyname('skuname').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
              qryWareOrderOutEdit.fieldbyname('Quantity').AsFloat        :=qryselect.fieldbyname('Quantity_set').AsFloat;
              qryWareOrderOutEdit.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
           end else
           begin
              try
                 qryWareOrderOutOriSKUBeforePost(qryWareOrderOutOriSKU);
              except
                 break;
              end;
              qryWareOrderOutOriSKU.append;
              qryWareOrderOutOriSKU.fieldbyname('sno').Asinteger:=-1;
              qryWareOrderOutOriSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
              qryWareOrderOutOriSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
           end;
           qryWareOrderOutOriSKU.fieldbyname('SKUID').asstring               :=qryselect.fieldbyname('SKUID').asstring;
           qryWareOrderOutOriSKU.fieldbyname('skuname').asstring             :=qryselect.fieldbyname('SKUName').asstring;
           strGetCd := qryselect.fieldbyname('SKUName').asstring;
           if qryselect.Fieldbyname('LotCode').asstring<>'' then
             qryWareOrderOutOriSKU.Fieldbyname('LotCode').asstring             :=qryselect.Fieldbyname('LotCode').asstring;
           if qryselect.fieldbyname('Quantity').AsFloat<>0 then
             qryWareOrderOutOriSKU.fieldbyname('Quantity').AsFloat             :=qryselect.fieldbyname('Quantity').AsFloat;
           if qryselect.Fieldbyname('QualityName').asstring<>'' then
             qryWareOrderOutOriSKU.fieldbyname('QualityName').asstring         :=qryselect.Fieldbyname('QualityName').asstring;
           qryWareOrderOutOriSKU.fieldbyname('QuantityUOM').asstring            :=qryselect.fieldbyname('QuantityUOM').asstring;
           qryWareOrderOutOriSKU.fieldbyname('PieceUOM').asstring            :=qryselect.fieldbyname('PieceUOM').asstring;
           qryWareOrderOutOriSKU.fieldbyname('WeightUOM').asstring           :=qryselect.fieldbyname('WeightUOM').asstring;
           qryWareOrderOutOriSKU.fieldbyname('VolumeUOM').asstring           :=qryselect.fieldbyname('VolumeUOM').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('AreaUOM').asstring             :=qryselect.fieldbyname('AreaUOM').asstring;
           if qryWareOrderOutOriSKU.fieldByname('cusid').AsString='' then
             qryWareOrderOutOriSKU.fieldByname('cusid').AsString           :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
           if qryWareOrderOutOriSKU.fieldByname('cusname').AsString='' then
             qryWareOrderOutOriSKU.fieldByname('cusname').AsString         :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;
           if qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString='' then
             qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString    :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
           if qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString='' then
             qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString  :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;
//wql_05/05/10 gather中统一赋值 if qryWareOrderOutOriSKU.fieldByname('costcusid').AsString='' then
//wql_05/05/10 gather中统一赋值      qryWareOrderOutOriSKU.fieldByname('costcusid').AsString           :=qryWareOrderOutEdit.fieldbyname('costcusid').AsString;
//wql_05/05/10 gather中统一赋值         if qryWareOrderOutOriSKU.fieldByname('costcusname').AsString='' then
             qryWareOrderOutOriSKU.fieldByname('costcusname').AsString         :=qryWareOrderOutEdit.fieldbyname('costcusname').AsString      ;

           qryWareOrderOutOriSKU.fieldbyname('TagEachUOM').Asstring          :='';

           qryWareOrderOutOriSKU.Fieldbyname('piecepro').AsFloat  :=qryselect.fieldbyname('PiecePro').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('VolumePro').asFloat :=qryselect.fieldbyname('VolumePro').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('AreaPro').asFloat   :=qryselect.fieldbyname('AreaPro').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('NetWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
           if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
              qryWareOrderOutOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
           else
              qryWareOrderOutOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
  //wql_new          qryWareOrderOutOriSKU.Fieldbyname('costuomtype').asstring     :=iif(strInout='I',costuomtype,SKU_PriceUOMType);
  //wql_new          qryWareOrderOutOriSKU.Fieldbyname('currcd').asstring    :=iif(strInout='I',currcd,SKU_PriceCurrency);
  //wql_new          qryWareOrderOutOriSKU.Fieldbyname('skucost').asFloat             :=iif(strInout='I',skucost ,SKU_Price);
           qryWareOrderOutOriSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('Pro1').AsFloat   :=qryselect.fieldbyname('Pro1').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('Pro2').AsFloat   :=qryselect.fieldbyname('Pro2').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('Pro3').AsFloat   :=qryselect.fieldbyname('Pro3').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('Pro4').AsFloat   :=qryselect.fieldbyname('Pro4').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('Pro5').AsFloat   :=qryselect.fieldbyname('Pro5').AsFloat;

           qryWareOrderOutOriSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
           qryWareOrderOutOriSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
           qryWareOrderOutOriSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
           qryWareOrderOutOriSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

           OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                 +'  from skuprice '
                                 +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderOutEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                 +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                 +'   and uomtype="'+qryWareOrderOutOriSKU.fieldbyname('CostUOMType').AsString+'"'
                                 +'   and userid like "'+_userid+'%"'
                  );
           qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
           qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
           qryWareOrderOutOriSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
           qryWareOrderOutOriSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
           qryWareOrderOutOriSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;

           qrySelect.Next;
           Inc(i);
        end;
     end;
   end   else
   begin
      if DataState in Setdcs then
        begin
          if _DB_Order<>'T' then
          begin
             if _isnocusfilter='T' then   //wql.05.09.26
                TLocationSKUSelect:= WorkLocationSKUSelect('',0,'出仓指令-库存商品选择','ITEM',sltselect,blnisopen,
                                                           '','')
             else
                TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                           '出仓指令-库存商品选择','ITEM',sltselect,blnisopen,qryWareOrderOutOriSKU.fieldbyname('cusid').asstring,
                                                           qryWareOrderOutOriSKU.fieldbyname('cusname').asstring);

             for i:=0 to 500 do
             begin
               if TLocationSKUSelect[i].OkFlag then
               begin
                 if i=0 then
                 begin
                   qryWareOrderOutOriSKU.edit;
                   qryWareOrderOutEdit.Edit;
                   qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
                   qryWareOrderOutEdit.fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond;
                   qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
                   qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
                   qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring   :=TLocationSKUSelect[i].skucostclasscd;
                   qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype;
                   if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
                   begin
                     qryWareOrderOutEdit.fieldbyname('costcusid').asstring      :=TLocationSKUSelect[i].costcusid;
                     qryWareOrderOutEdit.fieldbyname('costcusname').asstring    :=TLocationSKUSelect[i].costcusname;
                   end;
                   ckbCountcontcostClick(self);
                 end else
                 begin
                   try qryWareOrderOutOriSKUBeforePost(qryWareOrderOutOriSKU);
                   except break;
                   end;
                   qryWareOrderOutOriSKU.append;
                   qryWareOrderOutOriSKU.fieldbyname('sno').Asinteger:=-1;
                   qryWareOrderOutOriSKU.fieldByname('jobno').AsString          :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
                   qryWareOrderOutOriSKU.fieldByname('userid').AsString         :=qryWareOrderOutEdit.fieldbyname('userid').AsString;
                 end;
                 qryWareOrderOutOriSKU.fieldbyname('SKUID').asstring            :=TLocationSKUSelect[i].SKUID            ;
                 qryWareOrderOutOriSKU.fieldbyname('skuname').asstring          :=TLocationSKUSelect[i].skuname          ;
                 qryWareOrderOutOriSKU.Fieldbyname('LotCode').asstring          :=TLocationSKUSelect[i].LotCode          ;
                 qryWareOrderOutOriSKU.Fieldbyname('locid').asstring            :=TLocationSKUSelect[i].locid       ;
                 qryWareOrderOutOriSKU.Fieldbyname('LocName').asstring          :=TLocationSKUSelect[i].LocName       ;
                 qryWareOrderOutOriSKU.fieldbyname('Quantity').AsFloat          :=TLocationSKUSelect[i].syquantity        ;
                 qryWareOrderOutOriSKU.fieldbyname('QualityName').asstring      :=TLocationSKUSelect[i].QualityName      ;
                 qryWareOrderOutOriSKU.fieldbyname('PieceUOM').asstring         :=TLocationSKUSelect[i].PieceUOM         ;
                 qryWareOrderOutOriSKU.fieldbyname('WeightUOM').asstring        :=TLocationSKUSelect[i].WeightUOM        ;
                 qryWareOrderOutOriSKU.fieldbyname('VolumeUOM').asstring        :=TLocationSKUSelect[i].VolumeUOM        ;
                 qryWareOrderOutOriSKU.Fieldbyname('AreaUOM').asstring          :=TLocationSKUSelect[i].AreaUOM          ;
                 qryWareOrderOutOriSKU.fieldbyname('Piece').AsFloat             :=TLocationSKUSelect[i].syPiece          ;
                 qryWareOrderOutOriSKU.fieldbyname('NetWeight').asFloat         :=TLocationSKUSelect[i].syNetWeight      ;
                 qryWareOrderOutOriSKU.Fieldbyname('GrossWeight').asFloat       :=TLocationSKUSelect[i].syGrossWeight    ;
                 qryWareOrderOutOriSKU.fieldbyname('Volume').asFloat            :=TLocationSKUSelect[i].syVolume         ;
                 qryWareOrderOutOriSKU.Fieldbyname('Area').asFloat              :=TLocationSKUSelect[i].syArea           ;
                 qryWareOrderOutOriSKU.fieldbyname('cusid').asstring            :=TLocationSKUSelect[i].cusid        ;
                 qryWareOrderOutOriSKU.fieldbyname('cusname').asstring          :=TLocationSKUSelect[i].cusname      ;
                 qryWareOrderOutOriSKU.Fieldbyname('shippercusid').asstring     :=TLocationSKUSelect[i].shippercusid ;
                 qryWareOrderOutOriSKU.Fieldbyname('shippercusname').asstring   :=TLocationSKUSelect[i].shippercusname  ;
                 qryWareOrderOutOriSKU.Fieldbyname('shipcusid').asstring        :=TLocationSKUSelect[i].shipcusid ;
                 qryWareOrderOutOriSKU.Fieldbyname('shipcusname').asstring      :=TLocationSKUSelect[i].shipcusname  ;
                 qryWareOrderOutOriSKU.fieldbyname('costcusid').asstring        :=TLocationSKUSelect[i].costcusid        ;
                 qryWareOrderOutOriSKU.fieldbyname('costcusname').asstring      :=TLocationSKUSelect[i].costcusname      ;

                 qryWareOrderOutOriSKU.Fieldbyname('contwithloca').asstring     :=TLocationSKUSelect[i].contwithloca   ;
                 qryWareOrderOutOriSKU.Fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked     ;
                 qryWareOrderOutOriSKU.Fieldbyname('skucost').asFloat           :=TLocationSKUSelect[i].skucost          ;
                 qryWareOrderOutOriSKU.Fieldbyname('currcd').asstring           :=TLocationSKUSelect[i].currcd  ;
                 qryWareOrderOutOriSKU.fieldbyname('price').asFloat             :=TLocationSKUSelect[i].price     ;
                 qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring      :=TLocationSKUSelect[i].costuomtype   ;
//wql_new                 qryWareOrderOutOriSKU.Fieldbyname('jobnoin').asstring            :=TLocationSKUSelect[i].Jobno  ;
//wql_new                 qryWareOrderOutOriSKU.fieldbyname('snoin').asInteger             :=TLocationSKUSelect[i].SNO    ;
//wql_new                 qryWareOrderOutOriSKU.fieldbyname('ldsnoin').asInteger          :=TLocationSKUSelect[i].LDSNO ;
                 qryWareOrderOutOriSKU.Fieldbyname('jobnoori').asstring         :=TLocationSKUSelect[i].jobnoori  ;
                 qryWareOrderOutOriSKU.fieldbyname('snoori').asInteger          :=TLocationSKUSelect[i].snoori    ;
                 if  qryWareOrderOutOriSKU.Fieldbyname('jobnoori').asstring<>'' then
                 qryWareOrderOutOriSKU.Fieldbyname('jobnooridp').asstring       :='T';

                 qryWareOrderOutOriSKU.Fieldbyname('jobnoinf').asstring         :=TLocationSKUSelect[i].jobnoinf  ;
                 qryWareOrderOutOriSKU.fieldbyname('snoinf').asInteger          :=TLocationSKUSelect[i].snoinf    ;
                 qryWareOrderOutOriSKU.fieldbyname('ldsnoinf').asInteger        :=TLocationSKUSelect[i].ldsnoinf ;
                 qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring        :=TLocationSKUSelect[i].CustomsNO ;
                 qryWareOrderOutOriSKU.fieldbyname('LocationBillNO').asstring   :=TLocationSKUSelect[i].LocationBillNO ;
                 qryWareOrderOutOriSKU.fieldbyname('mainorderin').asstring      :=TLocationSKUSelect[i].mainorder ;
                 qryWareOrderOutOriSKU.Fieldbyname('TagEach').asstring          :=TLocationSKUSelect[i].TagEach   ;
                 qryWareOrderOutOriSKU.Fieldbyname('TagEachUOM').asstring       :=TLocationSKUSelect[i].TagEachUOM     ;
                 qryWareOrderOutOriSKU.Fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond   ;
                 qryWareOrderOutOriSKU.Fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent     ;
                 qryWareOrderOutOriSKU.Fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost   ;
                 qryWareOrderOutOriSKU.Fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype     ;
//wql_new                 qryWareOrderOutOriSKU.Fieldbyname('WO_CCAID').asstring            :=TLocationSKUSelect[i].costcusid ;
                 qryWareOrderOutOriSKU.Fieldbyname('loadcostone').asstring      :=TLocationSKUSelect[i].loadcostone ;
//wql_new                 qryWareOrderOutOriSKU.Fieldbyname('skucostclasscd').asString      :=TLocationSKUSelect[i].skucostclasscd;
                 qryWareOrderOutOriSKU.Fieldbyname('UOM1').asString             :=TLocationSKUSelect[i].UOM1;
                 qryWareOrderOutOriSKU.Fieldbyname('UOM2').asString             :=TLocationSKUSelect[i].UOM2;
                 qryWareOrderOutOriSKU.Fieldbyname('UOM3').asString             :=TLocationSKUSelect[i].UOM3;
                 qryWareOrderOutOriSKU.Fieldbyname('UOM4').asString             :=TLocationSKUSelect[i].UOM4;
                 qryWareOrderOutOriSKU.Fieldbyname('UOM5').asString             :=TLocationSKUSelect[i].UOM5;
//lqs_new              qryWareOrderOutOriSKU.Fieldbyname('Pro1').AsFloat   :=TLocationSKUSelect[i].Pro1;
//                 qryWareOrderOutOriSKU.Fieldbyname('Pro2').AsFloat   :=TLocationSKUSelect[i].Pro2;
//                 qryWareOrderOutOriSKU.Fieldbyname('Pro3').AsFloat   :=TLocationSKUSelect[i].Pro3;
//                 qryWareOrderOutOriSKU.Fieldbyname('Pro4').AsFloat   :=TLocationSKUSelect[i].Pro4;
//                 qryWareOrderOutOriSKU.Fieldbyname('Pro5').AsFloat   :=TLocationSKUSelect[i].Pro5;
                 qryWareOrderOutOriSKU.Fieldbyname('Casing1').AsFloat           :=TLocationSKUSelect[i].Casing1;
                 qryWareOrderOutOriSKU.Fieldbyname('Casing2').AsFloat           :=TLocationSKUSelect[i].Casing2;
                 qryWareOrderOutOriSKU.Fieldbyname('Casing3').AsFloat           :=TLocationSKUSelect[i].Casing3;
                 qryWareOrderOutOriSKU.Fieldbyname('Casing4').AsFloat           :=TLocationSKUSelect[i].Casing4;
                 qryWareOrderOutOriSKU.Fieldbyname('Casing5').AsFloat           :=TLocationSKUSelect[i].Casing5;

                 qryWareOrderOutOriSKU.Fieldbyname('carriage').asFloat          :=TLocationSKUSelect[i].carriage;
                 qryWareOrderOutOriSKU.Fieldbyname('carriagetotal').asFloat     :=TLocationSKUSelect[i].carriagetotal;
                 qryWareOrderOutOriSKU.fieldbyname('insurance').asFloat         :=TLocationSKUSelect[i].insurance;
                 qryWareOrderOutOriSKU.Fieldbyname('insurancetotal').asFloat    :=TLocationSKUSelect[i].insurancetotal;
                 qryWareOrderOutOriSKU.Fieldbyname('ManufactureDate').AsDateTime:=TLocationSKUSelect[i].ManufactureDate;
                 qryWareOrderOutOriSKU.Fieldbyname('SKU_CustomerID').asString   :=TLocationSKUSelect[i].customerno;
                 qryWareOrderOutOriSKU.Fieldbyname('skumodel').asString         :=TLocationSKUSelect[i].skumodel;
                 qryWareOrderOutOriSKU.Fieldbyname('skuspec').asString          :=TLocationSKUSelect[i].skuspec;
                 qryWareOrderOutOriSKU.Fieldbyname('color').asString            :=TLocationSKUSelect[i].color;
                 if qryWareOrderOutOriSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then qryWareOrderOutOriSKU.Fieldbyname('ManufactureDate').Clear;
               end;
             end;
          end else
          begin
             qrySelect:=PGetSKUSelect('','','D');
             qrySelect.First;
             i:=0;
             while not qrySelect.Eof do
             begin
                 if i=0 then
                  begin
                     qryWareOrderOutOriSKU.edit;
                     qryWareOrderOutEdit.Edit;
 //wql_new                    qryWareOrderOutOriSKU.fieldbyname('ClassId').asstring               :=qryselect.fieldbyname('SKUID').asstring            ;
                     qryWareOrderOutOriSKU.fieldbyname('SKUID').asstring        :=qryselect.fieldbyname('SKUID').asstring            ;
                     qryWareOrderOutOriSKU.fieldbyname('skuname').asstring      :=qryselect.fieldbyname('skuname').asstring          ;
                     if qryselect.fieldbyname('QualityName').asstring<>'' then
                       qryWareOrderOutOriSKU.fieldbyname('QualityName').asstring:=qryselect.fieldbyname('QualityName').asstring      ;
                     qryWareOrderOutOriSKU.fieldbyname('QuantityUOM').asstring  :=qryselect.fieldbyname('QuantityUOM').asstring         ;
                     qryWareOrderOutOriSKU.fieldbyname('PieceUOM').asstring     :=qryselect.fieldbyname('PieceUOM').asstring         ;
                     qryWareOrderOutOriSKU.fieldbyname('WeightUOM').asstring    :=qryselect.fieldbyname('WeightUOM').asstring        ;
                     qryWareOrderOutOriSKU.fieldbyname('VolumeUOM').asstring    :=qryselect.fieldbyname('VolumeUOM').asstring        ;
                     qryWareOrderOutOriSKU.Fieldbyname('AreaUOM').asstring      :=qryselect.fieldbyname('AreaUOM').asstring          ;
                     qryWareOrderOutOriSKU.Fieldbyname('piecepro').AsFloat      :=qryselect.fieldbyname('PiecePro').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('VolumePro').asFloat     :=qryselect.fieldbyname('VolumePro').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('AreaPro').asFloat       :=qryselect.fieldbyname('AreaPro').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('NetWeightPro').asFloat  :=qryselect.fieldbyname('WeightPro').AsFloat;
                     if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
                        qryWareOrderOutOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
                     else
                        qryWareOrderOutOriSKU.Fieldbyname('GrossWeightPro').asFloat:=qryselect.fieldbyname('WeightPro').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('UOM1').asString        :=qryselect.fieldbyname('UOM1').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('UOM2').asString        :=qryselect.fieldbyname('UOM2').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('UOM3').asString        :=qryselect.fieldbyname('UOM3').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('UOM4').asString        :=qryselect.fieldbyname('UOM4').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('UOM5').asString        :=qryselect.fieldbyname('UOM5').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('Pro1').AsFloat         :=qryselect.fieldbyname('Pro1').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('Pro2').AsFloat         :=qryselect.fieldbyname('Pro2').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('Pro3').AsFloat         :=qryselect.fieldbyname('Pro3').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('Pro4').AsFloat         :=qryselect.fieldbyname('Pro4').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('Pro5').AsFloat         :=qryselect.fieldbyname('Pro5').AsFloat;

                     qryWareOrderOutOriSKU.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('sku_customerID').Asstring:=qryselect.fieldbyname('customerno').Asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

                     OpenSql(dataTmp.qryTmp1,'select top 1 carriage,insurance,currcd,price,pricein '
                                           +'  from skuprice '
                                           +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderOutEdit.fieldbyname('OrderDate').asdatetime)+'"'
                                           +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                                           +'   and uomtype="'+qryWareOrderOutOriSKU.fieldbyname('CostUOMType').AsString+'"'
                                           +'   and userid like "'+_userid+'%"'
                            );
                     qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat :=dataTmp.qryTmp1.fieldbyname('carriage').AsFloat;
                     qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp1.fieldbyname('insurance').AsFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp1.Fieldbyname('Currcd').asstring;
                     qryWareOrderOutOriSKU.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp1.Fieldbyname('pricein').asFloat;
                     qryWareOrderOutOriSKU.Fieldbyname('price').asFloat    :=dataTmp.qryTmp1.Fieldbyname('price').asFloat;
                  end;
                qrySelect.Next;
                Inc(i);
             end;

          end;
        end;
    end;
end;

procedure TfrmWareOrderOut.edtSKUCusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutSKU.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.edtSKUShippercusidButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutSKU.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.edtSKUSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  i:integer;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
begin
   if DataState in Setdcs then
     begin
       if (_DB_Order='T') and (qryWareOrderOutOriSKU.FieldByName('SkuId').AsString='') then
       begin
         {if _Language='CAPTIONC' then
            _strmessage:='没有商品原始信息，无法进行校验商品信息挑选！'
         else
             _strmessage:='**************';}
         kMessageDlg(GetMessage('frmWareOrderDxALL','029'),mtWarning,[mbOK],0);
         exit;
       end;
       if _DB_Order='T' then
       begin
          if _isnocusfilter='T' then  //wql.05.09.26
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,blnisopen,'',
                                                        '','','',qryWareOrderOutOriSKU.FieldByName('skuname').AsString,
                                                        qryWareOrderOutOriSKU.FieldByName('ClassId').AsString )
          else
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,blnisopen,qryWareOrderOutSKU.Fieldbyname('cusid').Asstring,
                                                        qryWareOrderOutSKU.Fieldbyname('cusname').Asstring,'','',qryWareOrderOutOriSKU.FieldByName('skuname').AsString,
                                                        qryWareOrderOutOriSKU.FieldByName('ClassId').AsString,False,qryWareOrderOutEdit.FieldByName('istrade').AsString );
       end else
       begin
          if _isnocusfilter='T' then    //wql.05.09.26
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,blnisopen,'','')
          else
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,blnisopen,qryWareOrderOutSKU.Fieldbyname('cusid').Asstring,
                                                        qryWareOrderOutSKU.Fieldbyname('cusname').Asstring,'','','','',False,qryWareOrderOutEdit.FieldByName('istrade').AsString);
       end;
       for i:=0 to 500 do
       begin
         if TLocationSKUSelect[i].OkFlag then
         begin
           if i=0 then
           begin
             qryWareOrderOutSKU.edit;
             qryWareOrderOutEdit.Edit;
             qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
             qryWareOrderOutEdit.fieldbyname('isbond').asstring:=TLocationSKUSelect[i].isbond;
             qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
             qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
             qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring      :=TLocationSKUSelect[i].skucostclasscd;
             qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype;
             qryWareOrderOutEdit.fieldbyname('loadcosttype').asstring            :=TLocationSKUSelect[i].loadcosttype;
             if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
             begin
               qryWareOrderOutEdit.fieldbyname('costcusid').asstring:=TLocationSKUSelect[i].costcusid;
               qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
               qryWareOrderOutEdit.fieldbyname('costopid').asstring:=TLocationSKUSelect[i].opid;
               qryWareOrderOutEdit.fieldbyname('costopname').asstring:=TLocationSKUSelect[i].opname;
             end;
             ckbCountcontcostClick(self);
           end else
           begin
             try qryWareOrderOutSKUBeforePost(qryWareOrderOutSKU);
             except break;
             end;
             qryWareOrderOutSKU.append;
             qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
             qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
             qryWareOrderOutSKU.fieldByname('userid').AsString:=qryWareOrderOutEdit.fieldbyname('userid').AsString;
           end;
           qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=TLocationSKUSelect[i].SKUID            ;
           qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=TLocationSKUSelect[i].skuname          ;
           qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=TLocationSKUSelect[i].LotCode          ;
           qryWareOrderOutSKU.Fieldbyname('locid').asstring               :=TLocationSKUSelect[i].locid       ;
           qryWareOrderOutSKU.Fieldbyname('LocName').asstring             :=TLocationSKUSelect[i].LocName       ;
           qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=TLocationSKUSelect[i].syquantity        ;
           qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=TLocationSKUSelect[i].QualityName      ;
           qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=TLocationSKUSelect[i].PieceUOM         ;
           qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=TLocationSKUSelect[i].WeightUOM        ;
           qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=TLocationSKUSelect[i].VolumeUOM        ;
           qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=TLocationSKUSelect[i].AreaUOM          ;
           qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=TLocationSKUSelect[i].syPiece          ;
           qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=TLocationSKUSelect[i].syNetWeight      ;
           qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=TLocationSKUSelect[i].syGrossWeight    ;
           qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=TLocationSKUSelect[i].syVolume         ;
           qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=TLocationSKUSelect[i].syArea           ;
           qryWareOrderOutSKU.fieldbyname('cusid').asstring               :=TLocationSKUSelect[i].cusid        ;
           qryWareOrderOutSKU.fieldbyname('cusname').asstring             :=TLocationSKUSelect[i].cusname      ;
           qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring        :=TLocationSKUSelect[i].shippercusid ;
           qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring      :=TLocationSKUSelect[i].shippercusname  ;
           qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring           :=TLocationSKUSelect[i].shipcusid ;
           qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring         :=TLocationSKUSelect[i].shipcusname  ;
           qryWareOrderOutSKU.fieldbyname('costcusid').asstring           :=TLocationSKUSelect[i].costcusid        ;
           qryWareOrderOutSKU.fieldbyname('costcusname').asstring         :=TLocationSKUSelect[i].costcusname      ;

           qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring        :=TLocationSKUSelect[i].contwithloca   ;
           qryWareOrderOutSKU.Fieldbyname('lottracked').asstring          :=TLocationSKUSelect[i].lottracked     ;
           qryWareOrderOutSKU.Fieldbyname('skucost').asFloat              :=TLocationSKUSelect[i].skucost          ;
           qryWareOrderOutSKU.Fieldbyname('currcd').asstring              :=TLocationSKUSelect[i].currcd  ;
           qryWareOrderOutSKU.fieldbyname('price').asFloat                :=TLocationSKUSelect[i].price     ;
           qryWareOrderOutSKU.fieldbyname('costuomtype').asstring         :=TLocationSKUSelect[i].costuomtype   ;
           qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring             :=TLocationSKUSelect[i].Jobno  ;
           qryWareOrderOutSKU.fieldbyname('snoin').asInteger              :=TLocationSKUSelect[i].SNO    ;
           qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger            :=TLocationSKUSelect[i].LDSNO ;
           qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring            :=TLocationSKUSelect[i].jobnoinf  ;
           qryWareOrderOutSKU.fieldbyname('snoinf').asInteger             :=TLocationSKUSelect[i].snoinf    ;
           qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger           :=TLocationSKUSelect[i].ldsnoinf ;
           qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring            :=TLocationSKUSelect[i].jobnoori  ;
           qryWareOrderOutSKU.fieldbyname('snoori').asInteger             :=TLocationSKUSelect[i].snoori    ;
           if qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring<>'' then
           qryWareOrderOutSKU.Fieldbyname('jobnooridp').asstring          :='T'  ;

           qryWareOrderOutSKU.fieldbyname('CustomsNOin').asstring         :=TLocationSKUSelect[i].CustomsNO ;
           qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring      :=TLocationSKUSelect[i].LocationBillNO ;
           qryWareOrderOutSKU.fieldbyname('mainorderin').asstring         :=TLocationSKUSelect[i].mainorder ;
           qryWareOrderOutSKU.Fieldbyname('TagEach').asstring             :=TLocationSKUSelect[i].TagEach   ;
           qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring          :=TLocationSKUSelect[i].TagEachUOM     ;
           qryWareOrderOutSKU.Fieldbyname('isbond').asstring              :=TLocationSKUSelect[i].isbond   ;
           qryWareOrderOutSKU.Fieldbyname('countrent').asstring           :=TLocationSKUSelect[i].countrent     ;
           qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring       :=TLocationSKUSelect[i].countcontcost   ;
           qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring   :=TLocationSKUSelect[i].warerentcounttype     ;
           qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring            :=TLocationSKUSelect[i].costcusid ;
           qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring         :=TLocationSKUSelect[i].loadcostone ;
           qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString      :=TLocationSKUSelect[i].skucostclasscd;
//wql_new              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=TLocationSKUSelect[i].syquantity;
           qryWareOrderOutSKU.Fieldbyname('UOM1').asString                :=TLocationSKUSelect[i].UOM1;
           qryWareOrderOutSKU.Fieldbyname('UOM2').asString                :=TLocationSKUSelect[i].UOM2;
           qryWareOrderOutSKU.Fieldbyname('UOM3').asString                :=TLocationSKUSelect[i].UOM3;
           qryWareOrderOutSKU.Fieldbyname('UOM4').asString                :=TLocationSKUSelect[i].UOM4;
           qryWareOrderOutSKU.Fieldbyname('UOM5').asString                :=TLocationSKUSelect[i].UOM5;
//lqs_new              qryWareOrderOutSKU.Fieldbyname('Pro1').AsFloat   :=TLocationSKUSelect[i].Pro1;
//              qryWareOrderOutSKU.Fieldbyname('Pro2').AsFloat   :=TLocationSKUSelect[i].Pro2;
//              qryWareOrderOutSKU.Fieldbyname('Pro3').AsFloat   :=TLocationSKUSelect[i].Pro3;
//              qryWareOrderOutSKU.Fieldbyname('Pro4').AsFloat   :=TLocationSKUSelect[i].Pro4;
//              qryWareOrderOutSKU.Fieldbyname('Pro5').AsFloat   :=TLocationSKUSelect[i].Pro5;
           qryWareOrderOutSKU.Fieldbyname('Casing1').AsFloat             :=TLocationSKUSelect[i].Casing1;
           qryWareOrderOutSKU.Fieldbyname('Casing2').AsFloat             :=TLocationSKUSelect[i].Casing2;
           qryWareOrderOutSKU.Fieldbyname('Casing3').AsFloat             :=TLocationSKUSelect[i].Casing3;
           qryWareOrderOutSKU.Fieldbyname('Casing4').AsFloat             :=TLocationSKUSelect[i].Casing4;
           qryWareOrderOutSKU.Fieldbyname('Casing5').AsFloat             :=TLocationSKUSelect[i].Casing5;
           qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime  :=TLocationSKUSelect[i].ManufactureDate;
           if qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then qryWareOrderOutSKU.Fieldbyname('ManufactureDate').Clear;
           qryWareOrderOutSKU.Fieldbyname('costopid').asString           :=TLocationSKUSelect[i].opid;
           qryWareOrderOutSKU.Fieldbyname('costopname').asString         :=TLocationSKUSelect[i].opname;
           qryWareOrderOutSKU.Fieldbyname('opid').asString               :=TLocationSKUSelect[i].opid;
           qryWareOrderOutSKU.Fieldbyname('opname').asString             :=TLocationSKUSelect[i].opname;
//              qryWareOrderOutSKU.Fieldbyname('Operator_ShipAcc').asString    :=TLocationSKUSelect[i].Operator_ShipAcc;
           qryWareOrderOutSKU.Fieldbyname('NotFullSign').asString        :=TLocationSKUSelect[i].NotFullSign;

           qryWareOrderOutSKU.Fieldbyname('carriage').asFloat            :=TLocationSKUSelect[i].carriage;
           qryWareOrderOutSKU.Fieldbyname('carriagetotal').asFloat       :=TLocationSKUSelect[i].carriagetotal;
           qryWareOrderOutSKU.fieldbyname('insurance').asFloat           :=TLocationSKUSelect[i].insurance;
           qryWareOrderOutSKU.Fieldbyname('insurancetotal').asFloat      :=TLocationSKUSelect[i].insurancetotal;
           qryWareOrderOutSKU.Fieldbyname('SKU_CustomerID').asString     :=TLocationSKUSelect[i].customerno;
           qryWareOrderOutSKU.Fieldbyname('skumodel').asString           :=TLocationSKUSelect[i].skumodel;
           qryWareOrderOutSKU.Fieldbyname('skuspec').asString            :=TLocationSKUSelect[i].skuspec;
           qryWareOrderOutSKU.Fieldbyname('color').asString              :=TLocationSKUSelect[i].color;
//              if not grdWareOrderSKUBeforePost(qryWareOrderOutSKU,aControl)
//              then break;
         end;
       end;
     end;
end;

procedure TfrmWareOrderOut.btnRateClick(Sender: TObject);
var
  i,j:integer;
  intCheckQuantity,inicheckpiece,inicheckgrossweight,inichecknetweight,inicheckvolume,inicheckcostquantity,inicheckarea:extended;
  qrySelect:TKADOQuery;
  TLocationSKUSelect:TMultLocationSKUSelect;
  strIsbond:string;
  strwhsql:string;
begin
  if qryWareOrderOutOriSKU.RecordCount=0 then
     exit;
  if qryWareOrderOutSKU.RecordCount<>0 then
  begin
     if KmessageDlg(GetMessage('frmWareOrderDxALL','030'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//iif(_language='CAPTIONC','已有商品信息，重新校验将删除已有商品信息，确定重新校验吗？','')
     begin
        qryWareOrderOutSKU.DisableControls;
        qryWareOrderOutSKU.First;
        while not qryWareOrderOutSKU.Eof do
        begin
           qryWareOrderOutSKU.Delete;
        end;
        qryWareOrderOutSKU.EnableControls;      
     end else exit;
  end;
  grdOriSKU.SelectAll;
    if sender=btnRate then
    OrderCnfg;
    if blnOkFlag then
    begin
      strIsbond:=UpperCase(getSysdata('isbond',2,'1','F'));
      for j:=0 to (grdOriSKU.SelectedCount-1) do
      begin
        qryWareOrderOutOriSKU.GotoBookmark(pointer(grdOriSKU.SelectedRows[j]));
        intCheckQuantity:=qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
        inicheckpiece:=qryWareOrderOutOriSKU.FieldByName('piece').AsFloat;
        inichecknetweight:=qryWareOrderOutOriSKU.FieldByName('netweight').AsFloat;
        inicheckgrossweight:=qryWareOrderOutOriSKU.FieldByName('grossweight').AsFloat;
        inicheckvolume:=qryWareOrderOutOriSKU.FieldByName('volume').AsFloat;
        inicheckarea:=qryWareOrderOutOriSKU.FieldByName('area').AsFloat;
        inicheckcostquantity:=qryWareOrderOutOriSKU.FieldByName('costquantity').AsFloat;
        if getSysdata('secloc')='T' then
        OpenSql(dataTmp.qryTmp,'select jobnoin,snoin from seconditem '
                              +' where jobno="'+qryWareOrderOutOriSKU.FieldByName('jobnoinin').AsString+'"'
                              +'   and sno="'+qryWareOrderOutOriSKU.FieldByName('snoinin').AsString+'"');
//20051213dwq 出仓指令校验
        if (qryWareOrderOutOriSKU.FieldByName('SKUID').AsString<>'')
           and (qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat>0)
           and (qryWareOrderOutOriSKU.FieldByName('jobnoinin').AsString<>'')
           and (qryWareOrderOutOriSKU.FieldByName('snoinin').AsString<>'') then
           strwhsql:='declare @SKUID char(40), '+chr(13)+chr(10)
                    +'        @MainOrder char(30),'+chr(13)+chr(10)
                    +'        @jobnoex char(40), '+chr(13)+chr(10)
                    +'        @snoex integer, '+chr(13)+chr(10)
                    +'        @jobnoitem char(40), '+chr(13)+chr(10)
                    +'        @snoitem integer, '+chr(13)+chr(10)
                    +'        @jobnoori char(40), '+chr(13)+chr(10)
                    +'        @snoori integer '+chr(13)+chr(10)
                    +'  select @SKUID="'+qryWareOrderOutOriSKU.FieldByName('SKUID').AsString+'",'+chr(13)+chr(10)
                    +'         @MainOrder="'+qryWareOrderOutOriSKU.FieldByName('mainorder').AsString+'",'+chr(13)+chr(10)
                    +'         @jobnoex="'+qryWareOrderOutOriSKU.FieldByName('Jobnoinin').AsString+'",'+chr(13)+chr(10)
                    +'         @snoex='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoinin').asinteger)+','+chr(13)+chr(10)
                    +iif(getSysdata('secloc')='T',' @jobnoitem="'+datatmp.qryTmp.FieldByName('Jobnoin').AsString+'",'+chr(13)+chr(10)
                    +'         @snoitem='+inttostr(datatmp.qryTmp.FieldByName('Snoin').asinteger)+', ','')
                    +'         @jobnoori="'+qryWareOrderOutOriSKU.FieldByName('Jobnoori').AsString+'",'+chr(13)+chr(10)
                    +'         @snoori='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoori').asinteger)+chr(13)+chr(10)
                    +'/*进仓数据*/ '+chr(13)+chr(10)
                    +'select item.Jobno,item.transferdate,item.SKUID,item.skuname,item.quantityuom,'+chr(13)+chr(10)
                    +'       item.sno,item.jobnoori,item.snoori,item.lotcode,item.skuspec,item.customsno,item.locationbillno, '+chr(13)+chr(10)
                    +'       item.qualityname,item.pieceuom,item.weightuom,item.volumeuom,item.areauom,item.costquantityuom,'+chr(13)+chr(10)
                    +'       item.costcusid,item.costcusname,'+chr(13)+chr(10)
    //wql_new                +'       Detail.Quantity, Detail.Piece,Detail.NetWeight,Detail.GrossWeight,Detail.Volume,Detail.Area, '+chr(13)+chr(10)
                    +'       item.skucost,item.costuomtype,item.lottracked, '+chr(13)+chr(10)
                    +'       item.currcd,item.tageach,item.tageachuom,item.tagtotal, '+chr(13)+chr(10)
                    +'       item.cusid,item.cusname,item.shippercusid,item.shippercusname, '+chr(13)+chr(10)
                    +'       item.locid,item.locname,item.jobnoin,item.snoin,item.ldsnoin,item.jobnoinf,item.snoinf,item.ldsnoinf, '+chr(13)+chr(10)
                    +'       item.contwithloca,item.isbond,item.countrent,item.countcontcost,item.warerentcounttype, '+chr(13)+chr(10)
                    +'       item.carriage,item.carriagetotal,item.insurance,item.insurancetotal,'
    //wql_new                +'       SKU.piecepro,SKU.VolumePro,SKU.Quantity_Weight_Prop,SKU.AreaPro , '+chr(13)+chr(10)
                    +'       locationin.mainorder,sku.skucostclasscd, '+chr(13)+chr(10)
                    +'       depth=isnull(item.depth,0),width=isnull(item.width,0),height=isnull(item.height,0), '+chr(13)+chr(10)
                    +'       locationin.loadcostone,item.rentcountuomtype,item.costcountuomtype,item.price, '+chr(13)+chr(10)
    //wql_new                +'       costopid=Task.costopid, '+chr(13)+chr(10)
                    +'       jobnooridp=case when isnull(item.jobnoori,"")<>"" then "T" else "F" end, '
                    +'       item.notfullsign,item.manufacturedate,item.shipcusid,item.shipcusname, '+chr(13)+chr(10)
                    +'       uom1=isnull(item.uom1,""),uom2=isnull(item.uom2,""),'+chr(13)+chr(10)
                    +'       uom3=isnull(item.uom3,""),uom4=isnull(item.uom4,""),uom5=isnull(item.uom5,""),'+chr(13)+chr(10)
                    +'       qt_remain     =isnull(item.quantity,0)-isnull(item.quantitydoorder,0), '+chr(13)+chr(10)
                    +'       syPiece       =isnull(item.piece,0)-isnull(item.piecedoorder,0), '+chr(13)+chr(10)
                    +'       synetweight   =isnull(item.netweight,0)-isnull(item.netweightdoorder,0), '+chr(13)+chr(10)
                    +'       SYgrossweight =isnull(item.grossweight,0)-isnull(item.grossweightdoorder,0), '+chr(13)+chr(10)
                    +'       SYVolume      =isnull(item.volume,0)-isnull(item.volumedoorder,0), '+chr(13)+chr(10)
                    +'       SYArea        =isnull(item.area,0)-isnull(item.areadoorder,0), '+chr(13)+chr(10)
                    +'       SYCostquantity=isnull(item.costquantity,0)-isnull(item.costquantitydoorder,0), '+chr(13)+chr(10)
                    +'       sycasing1  =isnull(item.casing1,0)-isnull(item.casing1doorder,0), '+chr(13)+chr(10)
                    +'       sycasing2  =isnull(item.casing2,0)-isnull(item.casing2doorder,0), '+chr(13)+chr(10)
                    +'       sycasing3  =isnull(item.casing3,0)-isnull(item.casing3doorder,0), '+chr(13)+chr(10)
                    +'       sycasing4  =isnull(item.casing4,0)-isnull(item.casing4doorder,0), '+chr(13)+chr(10)
                    +'       sycasing5  =isnull(item.casing5,0)-isnull(item.casing5doorder,0) '+chr(13)+chr(10)
                    +'  from locationinitem item(nolock) '+chr(13)+chr(10)
                    +'       left join Locationin(nolock) '+chr(13)+chr(10)
                    +'              on Locationin.Jobno=item.jobnoinf '+chr(13)+chr(10)
                    +'       left join location (nolock)'+chr(13)+chr(10)
                    +'              on location.locid=item.locid '+chr(13)+chr(10)
                    +'       left join sku(nolock) '+chr(13)+chr(10)
                    +'              on sku.skuid=item.skuid '+chr(13)+chr(10)
                    +'       left join wareordersku(nolock) '+chr(13)+chr(10)
                    +'              on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                    +'             and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                    +'  where isnull(item.quantity,0)-isnull(item.quantitydoorder,0)>0 '+chr(13)+chr(10)
//                    +'    and isnull(item.skuId,"")=rtrim(@skuid)  '+chr(13)+chr(10)
                    +'    and isnull(item.mainorder,"") =rtrim(@mainorder) '+chr(13)+chr(10)
                    +iif(getSysdata('secloc')='T','    and ((isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" '+chr(13)+chr(10)
                    +'    and isnull(wareordersku.snoine,0)=@snoex) '+chr(13)+chr(10)
                    +'     or (isnull(item.Jobno,"") like "%"+rtrim(@Jobnoitem)+"%" '+chr(13)+chr(10)
                    +'    and isnull(item.sno,0)=@snoitem)) ', '    and isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" '+chr(13)+chr(10)
                    +'    and isnull(wareordersku.snoine,0)=@snoex')
                    +iif(StrCheckType='0',' order by item.jobnoori desc,item.snoori desc,item.transferdate,item.jobno  ',' order by item.jobnoori desc,item.snoori desc,item.transferdate desc,item.jobno desc') ;
        if (qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat>0)
           and (qryWareOrderOutOriSKU.FieldByName('jobnoinin').AsString<>'')
           and (qryWareOrderOutOriSKU.FieldByName('snoinin').AsString<>'') then
           strwhsql:='declare @SKUID char(40), '+chr(13)+chr(10)
                    +'        @MainOrder char(30),'+chr(13)+chr(10)
                    +'        @jobnoex char(40), '+chr(13)+chr(10)
                    +'        @snoex integer, '+chr(13)+chr(10)
                    +'        @jobnoitem char(40), '+chr(13)+chr(10)
                    +'        @snoitem integer, '+chr(13)+chr(10)
                    +'        @jobnoori char(40), '+chr(13)+chr(10)
                    +'        @snoori integer '+chr(13)+chr(10)
                    +'  select @SKUID="'+qryWareOrderOutOriSKU.FieldByName('SKUID').AsString+'",'+chr(13)+chr(10)
                    +'         @MainOrder="'+qryWareOrderOutOriSKU.FieldByName('mainorder').AsString+'",'+chr(13)+chr(10)
                    +'         @jobnoex="'+qryWareOrderOutOriSKU.FieldByName('Jobnoinin').AsString+'",'+chr(13)+chr(10)
                    +'         @snoex='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoinin').asinteger)+','+chr(13)+chr(10)
                    +iif(getSysdata('secloc')='T',' @jobnoitem="'+datatmp.qryTmp.FieldByName('Jobnoin').AsString+'",'+chr(13)+chr(10)
                    +'         @snoitem='+inttostr(datatmp.qryTmp.FieldByName('Snoin').asinteger)+', ','')
                    +'         @jobnoori="'+qryWareOrderOutOriSKU.FieldByName('Jobnoori').AsString+'",'+chr(13)+chr(10)
                    +'         @snoori='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoori').asinteger)+chr(13)+chr(10)
                    +'/*进仓数据*/ '+chr(13)+chr(10)
                    +'select item.Jobno,item.transferdate,item.SKUID,item.skuname,item.quantityuom,'+chr(13)+chr(10)
                    +'       item.sno,item.jobnoori,item.snoori,item.lotcode,item.skuspec,item.customsno,item.locationbillno, '+chr(13)+chr(10)
                    +'       item.qualityname,item.pieceuom,item.weightuom,item.volumeuom,item.areauom,item.costquantityuom,'+chr(13)+chr(10)
                    +'       item.costcusid,item.costcusname,'+chr(13)+chr(10)
    //wql_new                +'       Detail.Quantity, Detail.Piece,Detail.NetWeight,Detail.GrossWeight,Detail.Volume,Detail.Area, '+chr(13)+chr(10)
                    +'       item.skucost,item.costuomtype,item.lottracked, '+chr(13)+chr(10)
                    +'       item.currcd,item.tageach,item.tageachuom,item.tagtotal, '+chr(13)+chr(10)
                    +'       item.cusid,item.cusname,item.shippercusid,item.shippercusname, '+chr(13)+chr(10)
                    +'       item.locid,item.locname,item.jobnoin,item.snoin,item.ldsnoin,item.jobnoinf,item.snoinf,item.ldsnoinf, '+chr(13)+chr(10)
                    +'       item.contwithloca,item.isbond,item.countrent,item.countcontcost,item.warerentcounttype, '+chr(13)+chr(10)
                    +'       item.carriage,item.carriagetotal,item.insurance,item.insurancetotal,'
    //wql_new                +'       SKU.piecepro,SKU.VolumePro,SKU.Quantity_Weight_Prop,SKU.AreaPro , '+chr(13)+chr(10)
                    +'       locationin.mainorder,sku.skucostclasscd, '+chr(13)+chr(10)
                    +'       depth=isnull(item.depth,0),width=isnull(item.width,0),height=isnull(item.height,0), '+chr(13)+chr(10)
                    +'       locationin.loadcostone,item.rentcountuomtype,item.costcountuomtype,item.price, '+chr(13)+chr(10)
    //wql_new                +'       costopid=Task.costopid, '+chr(13)+chr(10)
                    +'       jobnooridp=case when isnull(item.jobnoori,"")<>"" then "T" else "F" end, '
                    +'       item.notfullsign,item.manufacturedate,item.shipcusid,item.shipcusname, '+chr(13)+chr(10)
                    +'       uom1=isnull(item.uom1,""),uom2=isnull(item.uom2,""),'+chr(13)+chr(10)
                    +'       uom3=isnull(item.uom3,""),uom4=isnull(item.uom4,""),uom5=isnull(item.uom5,""),'+chr(13)+chr(10)
                    +'       qt_remain     =isnull(item.quantity,0)-isnull(item.quantitydoorder,0), '+chr(13)+chr(10)
                    +'       syPiece       =isnull(item.piece,0)-isnull(item.piecedoorder,0), '+chr(13)+chr(10)
                    +'       synetweight   =isnull(item.netweight,0)-isnull(item.netweightdoorder,0), '+chr(13)+chr(10)
                    +'       SYgrossweight =isnull(item.grossweight,0)-isnull(item.grossweightdoorder,0), '+chr(13)+chr(10)
                    +'       SYVolume      =isnull(item.volume,0)-isnull(item.volumedoorder,0), '+chr(13)+chr(10)
                    +'       SYArea        =isnull(item.area,0)-isnull(item.areadoorder,0), '+chr(13)+chr(10)
                    +'       SYCostquantity=isnull(item.costquantity,0)-isnull(item.costquantitydoorder,0), '+chr(13)+chr(10)
                    +'       sycasing1  =isnull(item.casing1,0)-isnull(item.casing1doorder,0), '+chr(13)+chr(10)
                    +'       sycasing2  =isnull(item.casing2,0)-isnull(item.casing2doorder,0), '+chr(13)+chr(10)
                    +'       sycasing3  =isnull(item.casing3,0)-isnull(item.casing3doorder,0), '+chr(13)+chr(10)
                    +'       sycasing4  =isnull(item.casing4,0)-isnull(item.casing4doorder,0), '+chr(13)+chr(10)
                    +'       sycasing5  =isnull(item.casing5,0)-isnull(item.casing5doorder,0) '+chr(13)+chr(10)
                    +'  from locationinitem item(nolock) '+chr(13)+chr(10)
                    +'       left join Locationin(nolock) '+chr(13)+chr(10)
                    +'              on Locationin.Jobno=item.jobnoinf '+chr(13)+chr(10)
                    +'       left join location (nolock)'+chr(13)+chr(10)
                    +'              on location.locid=item.locid '+chr(13)+chr(10)
                    +'       left join sku(nolock) '+chr(13)+chr(10)
                    +'              on sku.skuid=item.skuid '+chr(13)+chr(10)
                    +'       left join wareordersku(nolock) '+chr(13)+chr(10)
                    +'              on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                    +'             and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                    +'  where isnull(item.quantity,0)-isnull(item.quantitydoorder,0)>0 '+chr(13)+chr(10)
//                    +'    and isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" '+chr(13)+chr(10)
//                    +'    and isnull(wareordersku.snoine,0)=@snoex '+chr(13)+chr(10)
                    +iif(getSysdata('secloc')='T','    and ((isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" '+chr(13)+chr(10)
                    +'    and isnull(wareordersku.snoine,0)=@snoex) '+chr(13)+chr(10)
                    +'     or (isnull(item.Jobno,"") like "%"+rtrim(@Jobnoitem)+"%" '+chr(13)+chr(10)
                    +'    and isnull(item.sno,0)=@snoitem)) ', '    and isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" '+chr(13)+chr(10)
                    +'    and isnull(wareordersku.snoine,0)=@snoex')
                    +iif(StrCheckType='0',' order by item.jobnoori desc,item.snoori desc,item.transferdate,item.jobno  ',' order by item.jobnoori desc,item.snoori desc,item.transferdate desc,item.jobno desc') ;
            if (qryWareOrderOutOriSKU.FieldByName('SKUID').AsString<>'')
           and (qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat>0)
           and (qryWareOrderOutOriSKU.FieldByName('jobnoinin').AsString='')
           and (qryWareOrderOutOriSKU.FieldByName('snoinin').AsString='') then
              strwhsql:='declare @SKUID char(40), '+chr(13)+chr(10)
                +'        @QualityName char(80),'+chr(13)+chr(10)
                +'        @locid char(40),'+chr(13)+chr(10)
                +'        @QUANTITY int,'+chr(13)+chr(10)
                +'        @LotCode char(100),'+chr(13)+chr(10)
                +'        @LocationBillNO char(30),'+chr(13)+chr(10)
                +'        @CustomsNO char(50),'+chr(13)+chr(10)
                +'        @cusid char(20),'+chr(13)+chr(10)
                +'        @shippercusid char(20),'+chr(13)+chr(10)
                +'        @MainOrder char(30),'+chr(13)+chr(10)
                +'        @jobno char(40), '+chr(13)+chr(10)
                +'        @OPERATIONTYPE integer, '+chr(13)+chr(10)
                +'        @SNO integer, '+chr(13)+chr(10)
                +'        @LD_SNO integer, '+chr(13)+chr(10)
                +'        @sysl numeric(16,4), '+chr(13)+chr(10)
                +'        @OSQuantity numeric(16,4), '+chr(13)+chr(10)
                +'        @ISPiece numeric(16,4), '+chr(13)+chr(10)
                +'        @ISNetWeight numeric(16,4), '+chr(13)+chr(10)
                +'        @ISGrossWeight numeric(16,4), '+chr(13)+chr(10)
                +'        @ISVolume numeric(16,4), '+chr(13)+chr(10)
                +'        @ISArea numeric(16,4), '+chr(13)+chr(10)
                +'        @jobnoex char(40), '+chr(13)+chr(10)
                +'        @snoex integer, '+chr(13)+chr(10)
                +'        @jobnoori char(40), '+chr(13)+chr(10)
                +'        @snoori integer '+chr(13)+chr(10)
                +'  select @SKUID="'+qryWareOrderOutOriSKU.FieldByName('SKUID').AsString+'",'+chr(13)+chr(10)
                +'         @QualityName="'+qryWareOrderOutOriSKU.FieldByName('QualityName').AsString+'",'+chr(13)+chr(10)
                +'         @locid="'+StrCheckLocationId+'",'+chr(13)+chr(10)
                +'         @QUANTITY=0,'+chr(13)+chr(10)
                +'         @LotCode="'+iif(getSysdata('eachlot',2,'1','')='T',qryWareOrderOutOriSKU.FieldByName('lotcode').AsString,StrCheckLotCode)+'",'+chr(13)+chr(10)
//                +'         @LotCode="'+StrCheckLotCode+'",'+chr(13)+chr(10)
                +'         @LocationBillNO="",'+chr(13)+chr(10)
                +'         @CustomsNO="",'+chr(13)+chr(10)
                +'         @cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'", '+chr(13)+chr(10)
                +'         @shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'",'+chr(13)+chr(10)
                +'         @MainOrder="'+qryWareOrderOutOriSKU.FieldByName('mainorder').AsString+'",'+chr(13)+chr(10)
                +'         @jobnoex="'+qryWareOrderOutOriSKU.FieldByName('Jobnoinin').AsString+'",'+chr(13)+chr(10)
                +'         @snoex='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoinin').asinteger)+','+chr(13)+chr(10)
                +'         @jobnoori="'+qryWareOrderOutOriSKU.FieldByName('Jobnoori').AsString+'",'+chr(13)+chr(10)
                +'         @snoori='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoori').asinteger)+chr(13)+chr(10)
                +'/*进仓数据*/ '+chr(13)+chr(10)
                +'select item.Jobno,item.transferdate,item.SKUID,item.skuname,item.quantityuom,'+chr(13)+chr(10)
                +'       item.sno,item.jobnoori,item.snoori,item.lotcode,item.skuspec,item.customsno,item.locationbillno, '+chr(13)+chr(10)
                +'       item.qualityname,item.pieceuom,item.weightuom,item.volumeuom,item.areauom,item.costquantityuom,'+chr(13)+chr(10)
                +'       item.costcusid,item.costcusname,'+chr(13)+chr(10)
//wql_new                +'       Detail.Quantity, Detail.Piece,Detail.NetWeight,Detail.GrossWeight,Detail.Volume,Detail.Area, '+chr(13)+chr(10)
                +'       item.skucost,item.costuomtype,item.lottracked, '+chr(13)+chr(10)
                +'       item.currcd,item.tageach,item.tageachuom,item.tagtotal, '+chr(13)+chr(10)
                +'       item.cusid,item.cusname,item.shippercusid,item.shippercusname, '+chr(13)+chr(10)
                +'       item.locid,item.locname,item.jobnoin,item.snoin,item.ldsnoin,item.jobnoinf,item.snoinf,item.ldsnoinf, '+chr(13)+chr(10)
                +'       item.contwithloca,item.isbond,item.countrent,item.countcontcost,item.warerentcounttype, '+chr(13)+chr(10)
                +'       item.carriage,item.carriagetotal,item.insurance,item.insurancetotal,'
//wql_new                +'       SKU.piecepro,SKU.VolumePro,SKU.Quantity_Weight_Prop,SKU.AreaPro , '+chr(13)+chr(10)
                +'       locationin.mainorder,sku.skucostclasscd, '+chr(13)+chr(10)
                +'       depth=isnull(item.depth,0),width=isnull(item.width,0),height=isnull(item.height,0), '+chr(13)+chr(10)
                +'       locationin.loadcostone,item.rentcountuomtype,item.costcountuomtype,item.price, '+chr(13)+chr(10)
//wql_new                +'       costopid=Task.costopid, '+chr(13)+chr(10)
                +'       jobnooridp=case when isnull(item.jobnoori,"")<>"" then "T" else "F" end, '
                +'       item.notfullsign,item.manufacturedate,item.shipcusid,item.shipcusname, '+chr(13)+chr(10)
                +'       uom1=isnull(item.uom1,""),uom2=isnull(item.uom2,""),'+chr(13)+chr(10)
                +'       uom3=isnull(item.uom3,""),uom4=isnull(item.uom4,""),uom5=isnull(item.uom5,""),'+chr(13)+chr(10)
                +'       qt_remain   =isnull(item.quantity,0)-isnull(item.quantitydoorder,0), '+chr(13)+chr(10)
                +'       syPiece      =isnull(item.piece,0)-isnull(item.piecedoorder,0), '+chr(13)+chr(10)
                +'       synetweight  =isnull(item.netweight,0)-isnull(item.netweightdoorder,0), '+chr(13)+chr(10)
                +'       SYgrossweight=isnull(item.grossweight,0)-isnull(item.grossweightdoorder,0), '+chr(13)+chr(10)
                +'       SYVolume     =isnull(item.volume,0)-isnull(item.volumedoorder,0), '+chr(13)+chr(10)
                +'       SYArea       =isnull(item.area,0)-isnull(item.areadoorder,0), '+chr(13)+chr(10)
                +'       SYCostquantity=isnull(item.costquantity,0)-isnull(item.costquantitydoorder,0), '+chr(13)+chr(10)
                +'       sycasing1     =isnull(item.casing1,0)-isnull(item.casing1doorder,0), '+chr(13)+chr(10)
                +'       sycasing2     =isnull(item.casing2,0)-isnull(item.casing2doorder,0), '+chr(13)+chr(10)
                +'       sycasing3     =isnull(item.casing3,0)-isnull(item.casing3doorder,0), '+chr(13)+chr(10)
                +'       sycasing4     =isnull(item.casing4,0)-isnull(item.casing4doorder,0), '+chr(13)+chr(10)
                +'       sycasing5     =isnull(item.casing5,0)-isnull(item.casing5doorder,0) '+chr(13)+chr(10)
                +'  from locationinitem item(nolock) '+chr(13)+chr(10)
                +'       left join Locationin(nolock) '+chr(13)+chr(10)
                +'              on Locationin.Jobno=item.jobnoinf '+chr(13)+chr(10)
                +'       left join location (nolock)'+chr(13)+chr(10)
                +'              on location.locid=item.locid '+chr(13)+chr(10)
                +'       left join sku(nolock) '+chr(13)+chr(10)
                +'              on sku.skuid=item.skuid '+chr(13)+chr(10)
                +'       left join wareordersku(nolock) '+chr(13)+chr(10)
                +'              on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                +'             and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                +'  where isnull(item.quantity,0)-isnull(item.quantitydoorder,0)>0 '+chr(13)+chr(10)
                +iif(blncheck=True,' and isnull(item.skuId,"")=rtrim(@skuid)' ,'') +chr(13)+chr(10)
                +'    and isnull(item.qualityname,"") like "%"+rtrim(@qualityname)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.lotcode,"") like "%"+rtrim(@lotcode)+"%" '+chr(13)+chr(10)
                +'    and isnull(Location.locid,"") like "%"+rtrim(@locid)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.locationbillno,"") like "%"+rtrim(@locationbillno)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.customsno,"") like "%"+rtrim(@customsno)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.cusid,"") like "%"+rtrim(@cusid)+"%" '+chr(13)+chr(10)
//                +'    and isnull(item.shippercusid,"") like "%"+rtrim(@shippercusid)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.mainorder,"") =rtrim(@mainorder) '+chr(13)+chr(10)
                +iif(strIsbond='T','    and isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" ','')+chr(13)+chr(10)
                +iif(strIsbond='T','    and isnull(wareordersku.snoine,0)=@snoex ','')+chr(13)+chr(10)
{                +'    and isnull(item.Jobnoori,"") like "%"+rtrim(@jobnoori)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.snoori,0)=@snoori '+chr(13)+chr(10)}
//                +iif(StrCheckType='0',' order by item.LotCode,item.transferdate,item.jobno,item.jobnoori,item.snoori  ',' order by item.LotCode desc,item.transferdate desc ,item.jobno desc,item.jobnoori,item.snoori ')+chr(13)+chr(10)
                +iif(StrCheckType='0',' order by item.jobnoori desc,item.snoori desc,item.transferdate,item.jobno  ',' order by item.jobnoori desc,item.snoori desc,item.transferdate desc,item.jobno desc') ;
        begin
{          OpenSql(dataTmp.qryTmp,'declare @SKUID char(40), '+chr(13)+chr(10)
                +'        @QualityName char(80),'+chr(13)+chr(10)
                +'        @locid char(40),'+chr(13)+chr(10)
                +'        @QUANTITY int,'+chr(13)+chr(10)
                +'        @LotCode char(100),'+chr(13)+chr(10)
                +'        @LocationBillNO char(30),'+chr(13)+chr(10)
                +'        @CustomsNO char(50),'+chr(13)+chr(10)
                +'        @cusid char(20),'+chr(13)+chr(10)
                +'        @shippercusid char(20),'+chr(13)+chr(10)
                +'        @MainOrder char(30),'+chr(13)+chr(10)
                +'        @jobno char(40), '+chr(13)+chr(10)
                +'        @OPERATIONTYPE integer, '+chr(13)+chr(10)
                +'        @SNO integer, '+chr(13)+chr(10)
                +'        @LD_SNO integer, '+chr(13)+chr(10)
                +'        @sysl numeric(16,4), '+chr(13)+chr(10)
                +'        @OSQuantity numeric(16,4), '+chr(13)+chr(10)
                +'        @ISPiece numeric(16,4), '+chr(13)+chr(10)
                +'        @ISNetWeight numeric(16,4), '+chr(13)+chr(10)
                +'        @ISGrossWeight numeric(16,4), '+chr(13)+chr(10)
                +'        @ISVolume numeric(16,4), '+chr(13)+chr(10)
                +'        @ISArea numeric(16,4), '+chr(13)+chr(10)
                +'        @jobnoex char(40), '+chr(13)+chr(10)
                +'        @snoex integer, '+chr(13)+chr(10)
                +'        @jobnoori char(40), '+chr(13)+chr(10)
                +'        @snoori integer '+chr(13)+chr(10)
                +'  select @SKUID="'+qryWareOrderOutOriSKU.FieldByName('SKUID').AsString+'",'+chr(13)+chr(10)
                +'         @QualityName="'+qryWareOrderOutOriSKU.FieldByName('QualityName').AsString+'",'+chr(13)+chr(10)
                +'         @locid="'+StrCheckLocationId+'",'+chr(13)+chr(10)
                +'         @QUANTITY=0,'+chr(13)+chr(10)
                +'         @LotCode="'+iif(getSysdata('eachlot',2,'1','')='T',qryWareOrderOutOriSKU.FieldByName('lotcode').AsString,StrCheckLotCode)+'",'+chr(13)+chr(10)
                +'         @LocationBillNO="",'+chr(13)+chr(10)
                +'         @CustomsNO="",'+chr(13)+chr(10)
                +'         @cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'", '+chr(13)+chr(10)
                +'         @shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'",'+chr(13)+chr(10)
                +'         @MainOrder="'+qryWareOrderOutOriSKU.FieldByName('mainorder').AsString+'",'+chr(13)+chr(10)
                +'         @jobnoex="'+qryWareOrderOutOriSKU.FieldByName('Jobnoinin').AsString+'",'+chr(13)+chr(10)
                +'         @snoex='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoinin').asinteger)+','+chr(13)+chr(10)
                +'         @jobnoori="'+qryWareOrderOutOriSKU.FieldByName('Jobnoori').AsString+'",'+chr(13)+chr(10)
                +'         @snoori='+inttostr(qryWareOrderOutOriSKU.FieldByName('Snoori').asinteger)+chr(13)+chr(10)
                +'/*进仓数据*/ '+chr(13)+chr(10)
                +'select item.Jobno,item.transferdate,item.SKUID,item.skuname,item.quantityuom,'+chr(13)+chr(10)
                +'       item.sno,item.jobnoori,item.snoori,item.lotcode,item.customsno,item.locationbillno, '+chr(13)+chr(10)
                +'       item.qualityname,item.pieceuom,item.weightuom,item.volumeuom,item.areauom,'+chr(13)+chr(10)
                +'       item.costcusid,item.costcusname,'+chr(13)+chr(10)
//wql_new                +'       Detail.Quantity, Detail.Piece,Detail.NetWeight,Detail.GrossWeight,Detail.Volume,Detail.Area, '+chr(13)+chr(10)
                +'       item.skucost,item.costuomtype,item.lottracked, '+chr(13)+chr(10)
                +'       item.currcd,item.tageach,item.tageachuom,item.tagtotal, '+chr(13)+chr(10)
                +'       item.cusid,item.cusname,item.shippercusid,item.shippercusname, '+chr(13)+chr(10)
                +'       item.locid,item.locname,item.jobnoin,item.snoin,item.ldsnoin,item.jobnoinf,item.snoinf,item.ldsnoinf, '+chr(13)+chr(10)
                +'       item.contwithloca,item.isbond,item.countrent,item.countcontcost,item.warerentcounttype, '+chr(13)+chr(10)
                +'       item.carriage,item.carriagetotal,item.insurance,item.insurancetotal,'
//wql_new                +'       SKU.piecepro,SKU.VolumePro,SKU.Quantity_Weight_Prop,SKU.AreaPro , '+chr(13)+chr(10)
                +'       locationin.mainorder,sku.skucostclasscd, '+chr(13)+chr(10)
                +'       depth=isnull(item.depth,0),width=isnull(item.width,0),height=isnull(item.height,0), '+chr(13)+chr(10)
                +'       locationin.loadcostone,item.rentcountuomtype,item.costcountuomtype,item.price, '+chr(13)+chr(10)
//wql_new                +'       costopid=Task.costopid, '+chr(13)+chr(10)
                +'       jobnooridp=case when isnull(item.jobnoori,"")<>"" then "T" else "F" end, '
                +'       item.notfullsign,item.manufacturedate,item.shipcusid,item.shipcusname, '+chr(13)+chr(10)
                +'       uom1=isnull(item.uom1,""),uom2=isnull(item.uom2,""),'+chr(13)+chr(10)
                +'       uom3=isnull(item.uom3,""),uom4=isnull(item.uom4,""),uom5=isnull(item.uom5,""),'+chr(13)+chr(10)
                +'       qt_remain   =isnull(item.quantity,0)-isnull(item.quantitydoorder,0), '+chr(13)+chr(10)
                +'       syPiece      =isnull(item.piece,0)-isnull(item.piecedoorder,0), '+chr(13)+chr(10)
                +'       synetweight  =isnull(item.netweight,0)-isnull(item.netweightdoorder,0), '+chr(13)+chr(10)
                +'       SYgrossweight=isnull(item.grossweight,0)-isnull(item.grossweightdoorder,0), '+chr(13)+chr(10)
                +'       SYVolume     =isnull(item.volume,0)-isnull(item.volumedoorder,0), '+chr(13)+chr(10)
                +'       SYArea       =isnull(item.area,0)-isnull(item.areadoorder,0), '+chr(13)+chr(10)
                +'       sycasing1  =isnull(item.casing1,0)-isnull(item.casing1doorder,0), '+chr(13)+chr(10)
                +'       sycasing2  =isnull(item.casing2,0)-isnull(item.casing2doorder,0), '+chr(13)+chr(10)
                +'       sycasing3  =isnull(item.casing3,0)-isnull(item.casing3doorder,0), '+chr(13)+chr(10)
                +'       sycasing4  =isnull(item.casing4,0)-isnull(item.casing4doorder,0), '+chr(13)+chr(10)
                +'       sycasing5  =isnull(item.casing5,0)-isnull(item.casing5doorder,0) '+chr(13)+chr(10)
                +'  from locationinitem item(nolock) '+chr(13)+chr(10)
                +'       left join Locationin(nolock) '+chr(13)+chr(10)
                +'              on Locationin.Jobno=item.jobnoinf '+chr(13)+chr(10)
                +'       left join location (nolock)'+chr(13)+chr(10)
                +'              on location.locid=item.locid '+chr(13)+chr(10)
                +'       left join sku(nolock) '+chr(13)+chr(10)
                +'              on sku.skuid=item.skuid '+chr(13)+chr(10)
                +'       left join wareordersku(nolock) '+chr(13)+chr(10)
                +'              on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                +'             and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                +'  where isnull(item.quantity,0)-isnull(item.quantitydoorder,0)>0 '+chr(13)+chr(10)
                +iif(blncheck=True,' and isnull(item.skuId,"")=rtrim(@skuid)' ,'') +chr(13)+chr(10)
                +'    and isnull(item.qualityname,"") like "%"+rtrim(@qualityname)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.lotcode,"") like "%"+rtrim(@lotcode)+"%" '+chr(13)+chr(10)
                +'    and isnull(Location.locid,"") like "%"+rtrim(@locid)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.locationbillno,"") like "%"+rtrim(@locationbillno)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.customsno,"") like "%"+rtrim(@customsno)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.cusid,"") like "%"+rtrim(@cusid)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.shippercusid,"") like "%"+rtrim(@shippercusid)+"%" '+chr(13)+chr(10)
                +'    and isnull(item.mainorder,"") =rtrim(@mainorder) '+chr(13)+chr(10)
                +iif(strIsbond='T','    and isnull(wareordersku.Jobnoine,"") like "%"+rtrim(@Jobnoex)+"%" ','')+chr(13)+chr(10)
                +iif(strIsbond='T','    and isnull(wareordersku.snoine,0)=@snoex ','')+chr(13)+chr(10)
//                +'    and isnull(item.Jobnoori,"") like "%"+rtrim(@jobnoori)+"%" '+chr(13)+chr(10)
//                +'    and isnull(item.snoori,0)=@snoori '+chr(13)+chr(10)
//                +iif(StrCheckType='0',' order by item.LotCode,item.transferdate,item.jobno,item.jobnoori,item.snoori  ',' order by item.LotCode desc,item.transferdate desc ,item.jobno desc,item.jobnoori,item.snoori ')+chr(13)+chr(10)
                +iif(StrCheckType='0',' order by item.jobnoori desc,item.snoori desc,item.transferdate,item.jobno  ',' order by item.jobnoori desc,item.snoori desc,item.transferdate desc,item.jobno desc ')+chr(13)+chr(10)
                +' '); }
          OpenSql(dataTmp.qryTmp,strwhsql);
          dataTmp.qryTmp.First;

          if (j=0) then
          begin
            qryWareOrderOutEdit.Edit;
            qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=dataTmp.qryTmp.fieldbyname('lottracked').AsString;
            qryWareOrderOutEdit.fieldbyname('isbond').asstring:=dataTmp.qryTmp.fieldbyname('isbond').AsString;
            qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=dataTmp.qryTmp.fieldbyname('countrent').AsString;
            qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=dataTmp.qryTmp.fieldbyname('countcontcost').AsString;
            qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring      :=dataTmp.qryTmp.fieldbyname('skucostclasscd').AsString;
            qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring   :=dataTmp.qryTmp.fieldbyname('warerentcounttype').AsString;

            if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
            begin
              qryWareOrderOutEdit.fieldbyname('costcusid').asstring:=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=dataTmp.qryTmp.fieldbyname('costcusname').AsString;
            end;
          end;

          while not dataTmp.qryTmp.Eof  do
          begin
            if  intCheckQuantity>dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat then
            begin
              qryWareOrderOutSKU.Append;
              qryWareOrderOutSKU.fieldbyname('sno').Asinteger                :=-1;
              qryWareOrderOutSKU.fieldByname('jobno').AsString               :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
              qryWareOrderOutSKU.fieldByname('userid').AsString              :=qryWareOrderOutEdit.fieldbyname('userid').AsString;

              qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;


              qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=dataTmp.qryTmp.fieldbyname('syPiece').AsFloat;
              qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=dataTmp.qryTmp.fieldbyname('syNetWeight').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=dataTmp.qryTmp.fieldbyname('syGrossWeight').AsFloat;
              qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=dataTmp.qryTmp.fieldbyname('syVolume').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=dataTmp.qryTmp.fieldbyname('syArea').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('Costquantity').asFloat         :=dataTmp.qryTmp.fieldbyname('syCostquantity').AsFloat;
//dwq20060117
              qryWareOrderOutSKU.fieldbyname('casing1').AsFloat                :=dataTmp.qryTmp.fieldbyname('sycasing1').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing2').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing2').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing3').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing3').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing4').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing4').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing5').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing5').AsFloat;

              qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=dataTmp.qryTmp.fieldbyname('SKUID').AsString;
              qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=dataTmp.qryTmp.fieldbyname('skuname').AsString;
              qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=dataTmp.qryTmp.fieldbyname('LotCode').AsString;
//dwq20060827
              qryWareOrderOutSKU.Fieldbyname('skustandard').asstring         :=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
              qryWareOrderOutSKU.Fieldbyname('locid').asstring               :=dataTmp.qryTmp.fieldbyname('locid').AsString;
              qryWareOrderOutSKU.Fieldbyname('locname').asstring             :=dataTmp.qryTmp.fieldbyname('locname').AsString;
              qryWareOrderOutSKU.fieldbyname('qualityname').asstring         :=dataTmp.qryTmp.fieldbyname('qualityname').AsString;
              qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=dataTmp.qryTmp.fieldbyname('PieceUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=dataTmp.qryTmp.fieldbyname('WeightUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=dataTmp.qryTmp.fieldbyname('VolumeUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=dataTmp.qryTmp.fieldbyname('AreaUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('costquantityuom').asstring     :=dataTmp.qryTmp.fieldbyname('costquantityuom').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom1').asString                :=dataTmp.qryTmp.fieldbyname('uom1').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom2').asString                :=dataTmp.qryTmp.fieldbyname('uom2').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom3').asString                :=dataTmp.qryTmp.fieldbyname('uom3').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom4').asString                :=dataTmp.qryTmp.fieldbyname('uom4').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom5').asString                :=dataTmp.qryTmp.fieldbyname('uom5').AsString;
              qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime   :=dataTmp.qryTmp.fieldbyname('ManufactureDate').AsDateTime;
              if qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then qryWareOrderOutSKU.Fieldbyname('ManufactureDate').Clear;
              qryWareOrderOutSKU.FieldByName('Depth').AsFloat                :=dataTmp.qryTmp.fieldbyname('Depth').AsFloat;
              qryWareOrderOutSKU.FieldByName('Width').AsFloat                :=dataTmp.qryTmp.fieldbyname('Width').AsFloat;
              qryWareOrderOutSKU.FieldByName('Height').AsFloat               :=dataTmp.qryTmp.fieldbyname('Height').AsFloat;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('cusbillno').Asstring           :=qryWareOrderOutEdit.fieldbyname('cusbillno').asstring;
              qryWareOrderOutSKU.FieldByName('mainorder').Asstring           :=qryWareOrderOutOriSKU.fieldbyname('mainorder').asstring;
              qryWareOrderOutSKU.FieldByName('mainorderin').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('mainorderin').asstring;
//cyh

              qryWareOrderOutSKU.fieldbyname('cusid').asstring           :=dataTmp.qryTmp.fieldbyname('cusid').AsString;
              qryWareOrderOutSKU.fieldbyname('cusname').asstring         :=dataTmp.qryTmp.fieldbyname('cusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring    :=dataTmp.qryTmp.fieldbyname('shippercusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring  :=dataTmp.qryTmp.fieldbyname('shippercusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring       :=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring     :=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusid').asstring       :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusname').asstring     :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;

              qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring     :=dataTmp.qryTmp.fieldbyname('contwithloca').AsString;
              qryWareOrderOutSKU.Fieldbyname('lottracked').asstring       :=dataTmp.qryTmp.fieldbyname('lottracked').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucost').asFloat           :=dataTmp.qryTmp.fieldbyname('skucost').asFloat;
              qryWareOrderOutSKU.Fieldbyname('currcd').asstring           :=dataTmp.qryTmp.fieldbyname('currcd').AsString;
              qryWareOrderOutSKU.fieldbyname('price').asFloat             :=dataTmp.qryTmp.fieldbyname('price').asFloat;
              qryWareOrderOutSKU.fieldbyname('costuomtype').asstring      :=dataTmp.qryTmp.fieldbyname('costuomtype').AsString;
              qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring          :=dataTmp.qryTmp.fieldbyname('Jobno').AsString;
              qryWareOrderOutSKU.fieldbyname('snoin').asInteger           :=dataTmp.qryTmp.fieldbyname('SNO').asInteger;
//wql_new              qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=dataTmp.qryTmp.fieldbyname('LD_SNO').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring          :=dataTmp.qryTmp.fieldbyname('jobnoinf').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinf').asInteger           :=dataTmp.qryTmp.fieldbyname('snoinf').asInteger;
              qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger         :=dataTmp.qryTmp.fieldbyname('ldsnoinf').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring          :=dataTmp.qryTmp.fieldbyname('jobnoori').AsString;
              qryWareOrderOutSKU.fieldbyname('snoori').asInteger           :=dataTmp.qryTmp.fieldbyname('snoori').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoine').asstring          :=qryWareOrderOutOriSKU.fieldbyname('jobnoin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoine').asInteger           :=qryWareOrderOutOriSKU.fieldbyname('snoin').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinin').asstring          :=qryWareOrderOutOriSKU.fieldbyname('jobnoinin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinin').asInteger           :=qryWareOrderOutOriSKU.fieldbyname('snoinin').asInteger;
              qryWareOrderOutSKU.fieldbyname('jobnoindp').asstring         :=qryWareOrderOutOriSKU.fieldbyname('jobnoindp').AsString;
              qryWareOrderOutSKU.fieldbyname('jobnooridp').asstring        :=dataTmp.qryTmp.fieldbyname('jobnooridp').AsString;

              qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring      :=dataTmp.qryTmp.fieldbyname('LocationBillNO').AsString;
              qryWareOrderOutSKU.Fieldbyname('TagEach').asstring             :=dataTmp.qryTmp.fieldbyname('TagEach').AsString;
              qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring          :=dataTmp.qryTmp.fieldbyname('TagEachUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('isbond').asstring              :=dataTmp.qryTmp.fieldbyname('isbond').AsString;
              qryWareOrderOutSKU.Fieldbyname('countrent').asstring           :=dataTmp.qryTmp.fieldbyname('countrent').AsString;
              qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring       :=dataTmp.qryTmp.fieldbyname('countcontcost').AsString;
              qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring   :=dataTmp.qryTmp.fieldbyname('warerentcounttype').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring            :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAname').asstring          :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring         :=dataTmp.qryTmp.fieldbyname('loadcostone').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString      :=dataTmp.qryTmp.fieldbyname('skucostclasscd').AsString;
//wql_new              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('NotFullSign').asString         :=dataTmp.qryTmp.fieldbyname('NotFullSign').AsString;
              qryWareOrderOutSKU.fieldbyname('carriage').AsFloat             :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
              qryWareOrderOutSKU.fieldbyname('carriagetotal').AsFloat        :=dataTmp.qryTmp.fieldbyname('carriagetotal').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurance').AsFloat            :=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurancetotal').AsFloat       :=dataTmp.qryTmp.fieldbyname('insurancetotal').AsFloat;

              qryWareOrderOutSKU.FieldByName('OperationType').AsInteger      :=qryWareOrderOutOriSKU.fieldbyname('OperationType').AsInteger;
              qryWareOrderOutSKU.FieldByName('costopid').Asstring            :=qryWareOrderOutOriSKU.fieldbyname('costopid').Asstring;

              qryWareOrderOutSKU.FieldByName('opid').Asstring                :=qryWareOrderOutOriSKU.fieldbyname('opid').Asstring;
              qryWareOrderOutSKU.FieldByName('opname').Asstring              :=qryWareOrderOutOriSKU.fieldbyname('opname').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopid').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('shipperopid').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopname').Asstring       :=qryWareOrderOutOriSKU.fieldbyname('shipperopname').Asstring;
              qryWareOrderOutSKU.FieldByName('OrderStatus').Asstring:='H';
              qryWareOrderOutSKU.FieldByName('outzoneno').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('outzoneno').asstring;
              qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring       :=qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring ;
              qryWareOrderOutSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderOutOriSKU.fieldbyname('CustomsNOin').asstring ;
              intCheckQuantity:=intCheckQuantity-dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Post;
            end else if (intCheckQuantity=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat) then
            begin
              qryWareOrderOutSKU.Append;
              qryWareOrderOutSKU.fieldbyname('sno').Asinteger                :=-1;
              qryWareOrderOutSKU.fieldByname('jobno').AsString               :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
              qryWareOrderOutSKU.fieldByname('userid').AsString              :=qryWareOrderOutEdit.fieldbyname('userid').AsString;

              qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;

              qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=dataTmp.qryTmp.fieldbyname('syPiece').AsFloat;
              qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=dataTmp.qryTmp.fieldbyname('syNetWeight').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=dataTmp.qryTmp.fieldbyname('syGrossWeight').AsFloat;
              qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=dataTmp.qryTmp.fieldbyname('syVolume').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=dataTmp.qryTmp.fieldbyname('syArea').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('Costquantity').asFloat         :=dataTmp.qryTmp.fieldbyname('syCostquantity').AsFloat;
//dwq20060117
              qryWareOrderOutSKU.fieldbyname('casing1').AsFloat                :=dataTmp.qryTmp.fieldbyname('sycasing1').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing2').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing2').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing3').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing3').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing4').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing4').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing5').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing5').AsFloat;

              qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=dataTmp.qryTmp.fieldbyname('SKUID').AsString;
              qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=dataTmp.qryTmp.fieldbyname('skuname').AsString;
              qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=dataTmp.qryTmp.fieldbyname('LotCode').AsString;
//dwq20060827
              qryWareOrderOutSKU.Fieldbyname('skustandard').asstring         :=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
              qryWareOrderOutSKU.Fieldbyname('locid').asstring               :=dataTmp.qryTmp.fieldbyname('locid').AsString;
              qryWareOrderOutSKU.Fieldbyname('Locname').asstring             :=dataTmp.qryTmp.fieldbyname('Locname').AsString;
              qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=dataTmp.qryTmp.fieldbyname('QualityName').AsString;
              qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=dataTmp.qryTmp.fieldbyname('PieceUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=dataTmp.qryTmp.fieldbyname('WeightUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=dataTmp.qryTmp.fieldbyname('VolumeUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=dataTmp.qryTmp.fieldbyname('AreaUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('costquantityuom').asstring     :=dataTmp.qryTmp.fieldbyname('costquantityuom').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom1').asString                :=dataTmp.qryTmp.fieldbyname('uom1').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom2').asString                :=dataTmp.qryTmp.fieldbyname('uom2').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom3').asString                :=dataTmp.qryTmp.fieldbyname('uom3').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom4').asString                :=dataTmp.qryTmp.fieldbyname('uom4').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom5').asString                :=dataTmp.qryTmp.fieldbyname('uom5').AsString;
              qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime   :=dataTmp.qryTmp.fieldbyname('ManufactureDate').AsDateTime;
              if qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then qryWareOrderOutSKU.Fieldbyname('ManufactureDate').Clear;
              qryWareOrderOutSKU.FieldByName('Depth').AsFloat                :=dataTmp.qryTmp.fieldbyname('Depth').AsFloat;
              qryWareOrderOutSKU.FieldByName('Width').AsFloat                :=dataTmp.qryTmp.fieldbyname('Width').AsFloat;
              qryWareOrderOutSKU.FieldByName('Height').AsFloat               :=dataTmp.qryTmp.fieldbyname('Height').AsFloat;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('cusbillno').Asstring           :=qryWareOrderOutEdit.fieldbyname('cusbillno').asstring;
              qryWareOrderOutSKU.FieldByName('mainorder').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('mainorder').asstring;
              qryWareOrderOutSKU.FieldByName('mainorderin').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('mainorderin').asstring;

              qryWareOrderOutSKU.fieldbyname('cusid').asstring               :=dataTmp.qryTmp.fieldbyname('cusid').AsString;
              qryWareOrderOutSKU.fieldbyname('cusname').asstring             :=dataTmp.qryTmp.fieldbyname('cusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring        :=dataTmp.qryTmp.fieldbyname('shippercusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring      :=dataTmp.qryTmp.fieldbyname('shippercusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring           :=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring         :=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusid').asstring           :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusname').asstring         :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;

              qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring        :=dataTmp.qryTmp.fieldbyname('contwithloca').AsString;
              qryWareOrderOutSKU.Fieldbyname('lottracked').asstring          :=dataTmp.qryTmp.fieldbyname('lottracked').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucost').asFloat              :=dataTmp.qryTmp.fieldbyname('skucost').asFloat;
              qryWareOrderOutSKU.Fieldbyname('currcd').asstring              :=dataTmp.qryTmp.fieldbyname('currcd').AsString;
              qryWareOrderOutSKU.fieldbyname('price').asFloat                :=dataTmp.qryTmp.fieldbyname('price').asFloat;
              qryWareOrderOutSKU.fieldbyname('costuomtype').asstring         :=dataTmp.qryTmp.fieldbyname('costuomtype').AsString;
              qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring             :=dataTmp.qryTmp.fieldbyname('Jobno').AsString;
              qryWareOrderOutSKU.fieldbyname('snoin').asInteger              :=dataTmp.qryTmp.fieldbyname('SNO').asInteger;
//wql_new              qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=dataTmp.qryTmp.fieldbyname('LD_SNO').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring            :=dataTmp.qryTmp.fieldbyname('jobnoinf').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinf').asInteger             :=dataTmp.qryTmp.fieldbyname('snoinf').asInteger;
              qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger           :=dataTmp.qryTmp.fieldbyname('ldsnoinf').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring            :=dataTmp.qryTmp.fieldbyname('jobnoori').AsString;
              qryWareOrderOutSKU.fieldbyname('snoori').asInteger             :=dataTmp.qryTmp.fieldbyname('snoori').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoine').asstring            :=qryWareOrderOutOriSKU.fieldbyname('jobnoin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoine').asInteger             :=qryWareOrderOutOriSKU.fieldbyname('snoin').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinin').asstring           :=qryWareOrderOutOriSKU.fieldbyname('jobnoinin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinin').asInteger            :=qryWareOrderOutOriSKU.fieldbyname('snoinin').asInteger;
              qryWareOrderOutSKU.fieldbyname('jobnoindp').asstring           :=qryWareOrderOutOriSKU.fieldbyname('jobnoindp').AsString;
              qryWareOrderOutSKU.fieldbyname('jobnooridp').asstring          :=dataTmp.qryTmp.fieldbyname('jobnooridp').AsString;

              qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring      :=dataTmp.qryTmp.fieldbyname('LocationBillNO').AsString;
              qryWareOrderOutSKU.Fieldbyname('TagEach').asstring             :=dataTmp.qryTmp.fieldbyname('TagEach').AsString;
              qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring          :=dataTmp.qryTmp.fieldbyname('TagEachUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('isbond').asstring              :=dataTmp.qryTmp.fieldbyname('isbond').AsString;
              qryWareOrderOutSKU.Fieldbyname('countrent').asstring           :=dataTmp.qryTmp.fieldbyname('countrent').AsString;
              qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring       :=dataTmp.qryTmp.fieldbyname('countcontcost').AsString;
              qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring   :=dataTmp.qryTmp.fieldbyname('warerentcounttype').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring            :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAname').asstring          :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring         :=dataTmp.qryTmp.fieldbyname('loadcostone').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString      :=dataTmp.qryTmp.fieldbyname('skucostclasscd').AsString;
//wql_new              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('NotFullSign').asString         :=dataTmp.qryTmp.fieldbyname('NotFullSign').AsString;
              qryWareOrderOutSKU.fieldbyname('carriage').AsFloat             :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
              qryWareOrderOutSKU.fieldbyname('carriagetotal').AsFloat        :=dataTmp.qryTmp.fieldbyname('carriagetotal').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurance').AsFloat            :=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurancetotal').AsFloat       :=dataTmp.qryTmp.fieldbyname('insurancetotal').AsFloat;

              qryWareOrderOutSKU.FieldByName('OperationType').AsInteger      :=qryWareOrderOutOriSKU.fieldbyname('OperationType').AsInteger;
              qryWareOrderOutSKU.FieldByName('costopid').Asstring            :=qryWareOrderOutOriSKU.fieldbyname('costopid').Asstring;

              qryWareOrderOutSKU.FieldByName('opid').Asstring                :=qryWareOrderOutOriSKU.fieldbyname('opid').Asstring;
              qryWareOrderOutSKU.FieldByName('opname').Asstring              :=qryWareOrderOutOriSKU.fieldbyname('opname').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopid').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('shipperopid').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopname').Asstring       :=qryWareOrderOutOriSKU.fieldbyname('shipperopname').Asstring;
              qryWareOrderOutSKU.FieldByName('OrderStatus').Asstring:='H';
              qryWareOrderOutSKU.FieldByName('outzoneno').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('outzoneno').asstring;
              qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring       :=qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring ;
              qryWareOrderOutSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderOutOriSKU.fieldbyname('CustomsNOin').asstring ;
              qryWareOrderOutSKU.Post;
              intCheckQuantity:=0;
              break;
            end else
            begin
              qryWareOrderOutSKU.Append;
              qryWareOrderOutSKU.fieldbyname('sno').Asinteger                :=-1;
              qryWareOrderOutSKU.fieldByname('jobno').AsString               :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
              qryWareOrderOutSKU.fieldByname('userid').AsString              :=qryWareOrderOutEdit.fieldbyname('userid').AsString;

              qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat             :=intCheckQuantity;
              if inicheckpiece<=dataTmp.qryTmp.fieldbyname('syPiece').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('Piece').AsFloat             :=inicheckpiece
              else
                 qryWareOrderOutSKU.fieldbyname('Piece').AsFloat                :=dataTmp.qryTmp.fieldbyname('syPiece').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              if inichecknetweight<=dataTmp.qryTmp.fieldbyname('syNetWeight').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('NetWeight').AsFloat             :=inichecknetweight
              else
                 qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat            :=dataTmp.qryTmp.fieldbyname('syNetWeight').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              if inicheckGrossWeight<=dataTmp.qryTmp.fieldbyname('syGrossWeight').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('GrossWeight').AsFloat             :=inicheckGrossWeight
              else
                 qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat          :=dataTmp.qryTmp.fieldbyname('syGrossWeight').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              if inicheckVolume<=dataTmp.qryTmp.fieldbyname('syVolume').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('Volume').AsFloat             :=inicheckVolume
              else
                 qryWareOrderOutSKU.fieldbyname('Volume').asFloat               :=dataTmp.qryTmp.fieldbyname('syVolume').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              if inicheckArea<=dataTmp.qryTmp.fieldbyname('syArea').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('Area').AsFloat             :=inicheckArea
              else
                 qryWareOrderOutSKU.Fieldbyname('Area').asFloat                 :=dataTmp.qryTmp.fieldbyname('syArea').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              if inicheckCostquantity<=dataTmp.qryTmp.fieldbyname('syCostquantity').AsFloat then
                 qryWareOrderOutSKU.fieldbyname('Costquantity').AsFloat             :=inicheckCostquantity
              else
                 qryWareOrderOutSKU.Fieldbyname('Costquantity').asFloat         :=dataTmp.qryTmp.fieldbyname('syCostquantity').AsFloat;
//dwq20060117
              qryWareOrderOutSKU.fieldbyname('casing1').AsFloat                :=dataTmp.qryTmp.fieldbyname('sycasing1').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing2').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing2').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing3').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing3').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.fieldbyname('casing4').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing4').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('casing5').asFloat                :=dataTmp.qryTmp.fieldbyname('sycasing5').AsFloat*intCheckQuantity/dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;

              qryWareOrderOutSKU.fieldbyname('SKUID').asstring               :=dataTmp.qryTmp.fieldbyname('SKUID').AsString;
              qryWareOrderOutSKU.fieldbyname('skuname').asstring             :=dataTmp.qryTmp.fieldbyname('skuname').AsString;
              qryWareOrderOutSKU.Fieldbyname('LotCode').asstring             :=dataTmp.qryTmp.fieldbyname('LotCode').AsString;
//dwq20060827
              qryWareOrderOutSKU.Fieldbyname('skustandard').asstring         :=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
              qryWareOrderOutSKU.Fieldbyname('locid').asstring               :=dataTmp.qryTmp.fieldbyname('locid').AsString;
              qryWareOrderOutSKU.Fieldbyname('LocName').asstring             :=dataTmp.qryTmp.fieldbyname('LocName').AsString;
              qryWareOrderOutSKU.fieldbyname('QualityName').asstring         :=dataTmp.qryTmp.fieldbyname('QualityName').AsString;
              qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring            :=dataTmp.qryTmp.fieldbyname('PieceUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring           :=dataTmp.qryTmp.fieldbyname('WeightUOM').AsString;
              qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring           :=dataTmp.qryTmp.fieldbyname('VolumeUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring             :=dataTmp.qryTmp.fieldbyname('AreaUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('costquantityuom').asstring     :=dataTmp.qryTmp.fieldbyname('costquantityuom').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom1').asString                :=dataTmp.qryTmp.fieldbyname('uom1').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom2').asString                :=dataTmp.qryTmp.fieldbyname('uom2').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom3').asString                :=dataTmp.qryTmp.fieldbyname('uom3').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom4').asString                :=dataTmp.qryTmp.fieldbyname('uom4').AsString;
              qryWareOrderOutSKU.Fieldbyname('uom5').asString                :=dataTmp.qryTmp.fieldbyname('uom5').AsString;
              qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime   :=dataTmp.qryTmp.fieldbyname('ManufactureDate').AsDateTime;
              if qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then  qryWareOrderOutSKU.Fieldbyname('ManufactureDate').Clear;
              qryWareOrderOutSKU.FieldByName('Depth').AsFloat                :=dataTmp.qryTmp.fieldbyname('Depth').AsFloat;
              qryWareOrderOutSKU.FieldByName('Width').AsFloat                :=dataTmp.qryTmp.fieldbyname('Width').AsFloat;
              qryWareOrderOutSKU.FieldByName('Height').AsFloat               :=dataTmp.qryTmp.fieldbyname('Height').AsFloat;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('costuomtype').Asstring         :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
              qryWareOrderOutSKU.FieldByName('cusbillno').Asstring           :=qryWareOrderOutEdit.fieldbyname('cusbillno').asstring;
              qryWareOrderOutSKU.FieldByName('mainorder').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('mainorder').asstring;

              qryWareOrderOutSKU.fieldbyname('cusid').asstring           :=dataTmp.qryTmp.fieldbyname('cusid').AsString;
              qryWareOrderOutSKU.fieldbyname('cusname').asstring         :=dataTmp.qryTmp.fieldbyname('cusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring    :=dataTmp.qryTmp.fieldbyname('shippercusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring  :=dataTmp.qryTmp.fieldbyname('shippercusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring       :=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring     :=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusid').asstring       :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.fieldbyname('costcusname').asstring     :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;

              qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring     :=dataTmp.qryTmp.fieldbyname('contwithloca').AsString;
              qryWareOrderOutSKU.Fieldbyname('lottracked').asstring       :=dataTmp.qryTmp.fieldbyname('lottracked').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucost').asFloat           :=dataTmp.qryTmp.fieldbyname('skucost').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('currcd').asstring           :=dataTmp.qryTmp.fieldbyname('currcd').AsString;
              qryWareOrderOutSKU.fieldbyname('price').asFloat             :=dataTmp.qryTmp.fieldbyname('price').AsFloat;
              qryWareOrderOutSKU.fieldbyname('costuomtype').asstring      :=dataTmp.qryTmp.fieldbyname('costuomtype').AsString;
              qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring          :=dataTmp.qryTmp.fieldbyname('Jobno').AsString;
              qryWareOrderOutSKU.fieldbyname('snoin').asInteger           :=dataTmp.qryTmp.fieldbyname('SNO').asInteger;
//wql_new              qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=dataTmp.qryTmp.fieldbyname('LD_SNO').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring          :=dataTmp.qryTmp.fieldbyname('jobnoinf').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinf').asInteger           :=dataTmp.qryTmp.fieldbyname('snoinf').asInteger;
              qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger         :=dataTmp.qryTmp.fieldbyname('ldsnoinf').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring          :=dataTmp.qryTmp.fieldbyname('jobnoori').AsString;
              qryWareOrderOutSKU.fieldbyname('snoori').asInteger           :=dataTmp.qryTmp.fieldbyname('snoori').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoine').asstring          :=qryWareOrderOutOriSKU.fieldbyname('jobnoin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoine').asInteger           :=qryWareOrderOutOriSKU.fieldbyname('snoin').asInteger;
              qryWareOrderOutSKU.Fieldbyname('jobnoinin').asstring          :=qryWareOrderOutOriSKU.fieldbyname('jobnoinin').AsString;
              qryWareOrderOutSKU.fieldbyname('snoinin').asInteger           :=qryWareOrderOutOriSKU.fieldbyname('snoinin').asInteger;
              qryWareOrderOutSKU.fieldbyname('jobnoindp').asstring         :=qryWareOrderOutOriSKU.fieldbyname('jobnoindp').AsString;
              qryWareOrderOutSKU.fieldbyname('jobnooridp').asstring        :=dataTmp.qryTmp.fieldbyname('jobnooridp').AsString;

              qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring    :=dataTmp.qryTmp.fieldbyname('LocationBillNO').AsString;
//              qryWareOrderOutSKU.Fieldbyname('WO_TagEach').asstring        :=dataTmp.qryTmp.fieldbyname('WO_TagEach').AsString;
              qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring        :=dataTmp.qryTmp.fieldbyname('TagEachUOM').AsString;
              qryWareOrderOutSKU.Fieldbyname('isbond').asstring            :=dataTmp.qryTmp.fieldbyname('isbond').AsString;
              qryWareOrderOutSKU.Fieldbyname('countrent').asstring         :=dataTmp.qryTmp.fieldbyname('countrent').AsString;
              qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring     :=dataTmp.qryTmp.fieldbyname('countcontcost').AsString;
              qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring :=dataTmp.qryTmp.fieldbyname('warerentcounttype').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring          :=dataTmp.qryTmp.fieldbyname('costcusid').AsString;
              qryWareOrderOutSKU.Fieldbyname('WO_CCAname').asstring        :=dataTmp.qryTmp.fieldbyname('costcusname').AsString;
              qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring       :=dataTmp.qryTmp.fieldbyname('loadcostone').AsString;
              qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString    :=dataTmp.qryTmp.fieldbyname('skucostclasscd').AsString;
//wql_new              qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat    :=dataTmp.qryTmp.fieldbyname('QT_Remain').AsFloat;
              qryWareOrderOutSKU.Fieldbyname('NotFullSign').asString       :=dataTmp.qryTmp.fieldbyname('NotFullSign').AsString;
              qryWareOrderOutSKU.fieldbyname('carriage').AsFloat           :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
              qryWareOrderOutSKU.fieldbyname('carriagetotal').AsFloat      :=dataTmp.qryTmp.fieldbyname('carriagetotal').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurance').AsFloat          :=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
              qryWareOrderOutSKU.fieldbyname('insurancetotal').AsFloat     :=dataTmp.qryTmp.fieldbyname('insurancetotal').AsFloat;

              qryWareOrderOutSKU.FieldByName('OperationType').AsInteger    :=qryWareOrderOutOriSKU.fieldbyname('OperationType').AsInteger;
              qryWareOrderOutSKU.FieldByName('costopid').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('costopid').Asstring;

              qryWareOrderOutSKU.FieldByName('opid').Asstring              :=qryWareOrderOutOriSKU.fieldbyname('opid').Asstring;
              qryWareOrderOutSKU.FieldByName('opname').Asstring            :=qryWareOrderOutOriSKU.fieldbyname('opname').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopid').Asstring       :=qryWareOrderOutOriSKU.fieldbyname('shipperopid').Asstring;
              qryWareOrderOutSKU.FieldByName('shipperopname').Asstring     :=qryWareOrderOutOriSKU.fieldbyname('shipperopname').Asstring;
              qryWareOrderOutSKU.FieldByName('OrderStatus').Asstring:='H';
              qryWareOrderOutSKU.FieldByName('outzoneno').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('outzoneno').asstring;
              qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring       :=qryWareOrderOutOriSKU.fieldbyname('CustomsNO').asstring ;
              qryWareOrderOutSKU.fieldbyname('CustomsNOin').asstring     :=qryWareOrderOutOriSKU.fieldbyname('CustomsNOin').asstring ;
              qryWareOrderOutSKU.Post;
              intCheckQuantity:=0;
              break;
            end;
            dataTmp.qryTmp.Next;
          end;
        end;
      end;
    end;
    Exit;

 {wql.07.11.24
  for j:=0 to (grdOriSKU.SelectedCount-1) do
  begin
    qryWareOrderOutOriSKU.GotoBookmark(pointer(grdOriSKU.SelectedRows[j]));
    qryWareOrderOutSKU.Append;
           if _isnocusfilter='T' then    //wql.05.09.26
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,True,
                                                        '','')
           else
             TLocationSKUSelect:= WorkLocationSKUSelect('',0,
                                                        '出仓指令-库存商品选择','ITEM',sltselect,True,
                                                        qryWareOrderOutOriSKU.fieldbyname('cusid').asstring,
                                                        qryWareOrderOutOriSKU.fieldbyname('cusname').asstring);
        for i:=0 to 100 do
        begin
          if TLocationSKUSelect[i].OkFlag then
          begin
            if i=0 then
            begin
              qryWareOrderOutEdit.Edit;
              qryWareOrderOutEdit.fieldbyname('lottracked').asstring       :=TLocationSKUSelect[i].lottracked;
              qryWareOrderOutEdit.fieldbyname('isbond').asstring           :=TLocationSKUSelect[i].isbond;
              qryWareOrderOutEdit.fieldbyname('countrent').asstring        :=TLocationSKUSelect[i].countrent;
              qryWareOrderOutEdit.fieldbyname('countcontcost').asstring    :=TLocationSKUSelect[i].countcontcost;
              qryWareOrderOutEdit.fieldbyname('skucostclasscd').asstring   :=TLocationSKUSelect[i].skucostclasscd;
              qryWareOrderOutEdit.fieldbyname('warerentcounttype').asstring:=TLocationSKUSelect[i].warerentcounttype;
              if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
              begin
                qryWareOrderOutEdit.fieldbyname('costcusid').asstring  :=TLocationSKUSelect[i].costcusid;
                qryWareOrderOutEdit.fieldbyname('costcusname').asstring:=TLocationSKUSelect[i].costcusname;
              end;
              ckbCountcontcostClick (self);
            end else
            begin
              qryWareOrderOutSKU.fieldbyname('sno').Asinteger:=-1;
              qryWareOrderOutSKU.fieldByname('jobno').AsString          :=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
              qryWareOrderOutSKU.fieldByname('userid').AsString         :=qryWareOrderOutEdit.fieldbyname('userid').AsString;
            end;
            qryWareOrderOutSKU.fieldbyname('SKUID').asstring            :=TLocationSKUSelect[i].SKUID            ;
            qryWareOrderOutSKU.fieldbyname('skuname').asstring          :=TLocationSKUSelect[i].skuname          ;
            qryWareOrderOutSKU.Fieldbyname('LotCode').asstring          :=TLocationSKUSelect[i].LotCode          ;
            qryWareOrderOutSKU.Fieldbyname('locid').asstring            :=TLocationSKUSelect[i].locid       ;
            qryWareOrderOutSKU.Fieldbyname('locname').asstring          :=TLocationSKUSelect[i].locname       ;
            qryWareOrderOutSKU.fieldbyname('Quantity').AsFloat          :=TLocationSKUSelect[i].syquantity        ;
            qryWareOrderOutSKU.fieldbyname('QualityName').asstring      :=TLocationSKUSelect[i].QualityName      ;
            qryWareOrderOutSKU.fieldbyname('PieceUOM').asstring         :=TLocationSKUSelect[i].PieceUOM         ;
            qryWareOrderOutSKU.fieldbyname('WeightUOM').asstring        :=TLocationSKUSelect[i].WeightUOM        ;
            qryWareOrderOutSKU.fieldbyname('VolumeUOM').asstring        :=TLocationSKUSelect[i].VolumeUOM        ;
            qryWareOrderOutSKU.Fieldbyname('AreaUOM').asstring          :=TLocationSKUSelect[i].AreaUOM          ;
            qryWareOrderOutSKU.Fieldbyname('costquantityuom').asstring  :=TLocationSKUSelect[i].costquantityuom          ;
            qryWareOrderOutSKU.fieldbyname('Piece').AsFloat             :=TLocationSKUSelect[i].syPiece          ;
            qryWareOrderOutSKU.fieldbyname('NetWeight').asFloat         :=TLocationSKUSelect[i].syNetWeight      ;
            qryWareOrderOutSKU.Fieldbyname('GrossWeight').asFloat       :=TLocationSKUSelect[i].syGrossWeight    ;
            qryWareOrderOutSKU.fieldbyname('Volume').asFloat            :=TLocationSKUSelect[i].syVolume         ;
            qryWareOrderOutSKU.Fieldbyname('Area').asFloat              :=TLocationSKUSelect[i].syArea           ;
            qryWareOrderOutSKU.Fieldbyname('Costquantity').asFloat      :=TLocationSKUSelect[i].syCostquantity   ;
            qryWareOrderOutSKU.Fieldbyname('Costquantityuom').AsString  :=TLocationSKUSelect[i].Costquantityuom   ;

            qryWareOrderOutSKU.Fieldbyname('uom1').asString             :=TLocationSKUSelect[i].uom1;
            qryWareOrderOutSKU.Fieldbyname('uom2').asString             :=TLocationSKUSelect[i].uom2;
            qryWareOrderOutSKU.Fieldbyname('uom3').asString             :=TLocationSKUSelect[i].uom3;
            qryWareOrderOutSKU.Fieldbyname('uom4').asString             :=TLocationSKUSelect[i].uom4;
            qryWareOrderOutSKU.Fieldbyname('uom5').asString             :=TLocationSKUSelect[i].uom5;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Quantity_CONE_Prop').AsFloat   :=TLocationSKUSelect[i].Quantity_CONE_Prop;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Quantity_CTWO_Prop').AsFloat   :=TLocationSKUSelect[i].Quantity_CTWO_Prop;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Quantity_CTHR_Prop').AsFloat   :=TLocationSKUSelect[i].Quantity_CTHR_Prop;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Quantity_CFOU_Prop').AsFloat   :=TLocationSKUSelect[i].Quantity_CFOU_Prop;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Quantity_CFIV_Prop').AsFloat   :=TLocationSKUSelect[i].Quantity_CFIV_Prop;
            qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime:=TLocationSKUSelect[i].ManufactureDate;
            if qryWareOrderOutSKU.Fieldbyname('ManufactureDate').AsDateTime=0 then qryWareOrderOutSKU.Fieldbyname('ManufactureDate').Clear;
            qryWareOrderOutSKU.FieldByName('casing1').AsFloat           :=TLocationSKUSelect[i].sycasing1;
            qryWareOrderOutSKU.FieldByName('casing2').AsFloat           :=TLocationSKUSelect[i].sycasing2;
            qryWareOrderOutSKU.FieldByName('casing3').AsFloat           :=TLocationSKUSelect[i].sycasing3;
            qryWareOrderOutSKU.FieldByName('casing4').AsFloat           :=TLocationSKUSelect[i].sycasing4;
            qryWareOrderOutSKU.FieldByName('casing5').AsFloat           :=TLocationSKUSelect[i].sycasing5;
            qryWareOrderOutSKU.FieldByName('Depth').AsFloat             :=TLocationSKUSelect[i].Depth;
            qryWareOrderOutSKU.FieldByName('Width').AsFloat             :=TLocationSKUSelect[i].Width;
            qryWareOrderOutSKU.FieldByName('Height').AsFloat            :=TLocationSKUSelect[i].Height;
            qryWareOrderOutSKU.FieldByName('costuomtype').Asstring      :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
            qryWareOrderOutSKU.FieldByName('costuomtype').Asstring      :=qryWareOrderOutOriSKU.fieldbyname('costuomtype').asstring ;
            qryWareOrderOutSKU.FieldByName('cusbillno').Asstring        :=qryWareOrderOutEdit.fieldbyname('cusbillno').asstring;
//       qryWareOrderOutSKU.FieldByName('mainorder').Asstring          :=qryWareOrderOutOriSKU.fieldbyname('mainorder').asstring;

            qryWareOrderOutSKU.fieldbyname('cusid').asstring             :=TLocationSKUSelect[i].cusid        ;
            qryWareOrderOutSKU.fieldbyname('cusname').asstring           :=TLocationSKUSelect[i].cusname      ;
            qryWareOrderOutSKU.Fieldbyname('shippercusid').asstring      :=TLocationSKUSelect[i].shippercusid ;
            qryWareOrderOutSKU.Fieldbyname('shippercusname').asstring    :=TLocationSKUSelect[i].shippercusname  ;
            qryWareOrderOutSKU.Fieldbyname('shipcusid').asstring         :=TLocationSKUSelect[i].shipcusid ;
            qryWareOrderOutSKU.Fieldbyname('shipcusname').asstring       :=TLocationSKUSelect[i].shipcusname  ;
            qryWareOrderOutSKU.fieldbyname('costcusid').asstring         :=TLocationSKUSelect[i].costcusid    ;
            qryWareOrderOutSKU.fieldbyname('costcusname').asstring       :=TLocationSKUSelect[i].costcusname  ;

            qryWareOrderOutSKU.Fieldbyname('contwithloca').asstring      :=TLocationSKUSelect[i].contwithloca   ;
            qryWareOrderOutSKU.Fieldbyname('lottracked').asstring        :=TLocationSKUSelect[i].lottracked     ;
            qryWareOrderOutSKU.Fieldbyname('skucost').asFloat            :=TLocationSKUSelect[i].skucost          ;
            qryWareOrderOutSKU.Fieldbyname('currcd').asstring            :=TLocationSKUSelect[i].currcd  ;
            qryWareOrderOutSKU.fieldbyname('price').asFloat              :=TLocationSKUSelect[i].price     ;
            qryWareOrderOutSKU.fieldbyname('costuomtype').asstring       :=TLocationSKUSelect[i].costuomtype   ;
            qryWareOrderOutSKU.Fieldbyname('jobnoin').asstring           :=TLocationSKUSelect[i].Jobno  ;
            qryWareOrderOutSKU.fieldbyname('snoin').asInteger            :=TLocationSKUSelect[i].SNO    ;
            qryWareOrderOutSKU.fieldbyname('ldsnoin').asInteger          :=TLocationSKUSelect[i].LDSNO ;
            qryWareOrderOutSKU.Fieldbyname('jobnoinf').asstring          :=TLocationSKUSelect[i].jobnoinf  ;
            qryWareOrderOutSKU.fieldbyname('snoinf').asInteger           :=TLocationSKUSelect[i].snoinf    ;
            qryWareOrderOutSKU.fieldbyname('ldsnoinf').asInteger         :=TLocationSKUSelect[i].ldsnoinf ;
            qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring          :=TLocationSKUSelect[i].jobnoori  ;
            qryWareOrderOutSKU.fieldbyname('snoori').asInteger           :=TLocationSKUSelect[i].snoori    ;
            if  qryWareOrderOutSKU.Fieldbyname('jobnoori').asstring<>'' then
            qryWareOrderOutSKU.Fieldbyname('jobnooridp').asstring            :='T';

//wql_new            qryWareOrderOutSKU.Fieldbyname('jobnoine').asstring          :=''  ;
//wql_new            qryWareOrderOutSKU.fieldbyname('snoine').asInteger           :=0  ;

            qryWareOrderOutSKU.fieldbyname('jobnoindp').asstring         :='F';
            qryWareOrderOutSKU.fieldbyname('jobnooridp').asstring        :=iif(TLocationSKUSelect[i].jobnoori<>'','T','F');

            qryWareOrderOutSKU.fieldbyname('CustomsNO').asstring         :=TLocationSKUSelect[i].CustomsNO ;
            qryWareOrderOutSKU.fieldbyname('LocationBillNO').asstring    :=TLocationSKUSelect[i].LocationBillNO ;
            qryWareOrderOutSKU.Fieldbyname('TagEach').asstring           :=TLocationSKUSelect[i].TagEach   ;
            qryWareOrderOutSKU.Fieldbyname('TagEachUOM').asstring        :=TLocationSKUSelect[i].TagEachUOM     ;
            qryWareOrderOutSKU.Fieldbyname('isbond').asstring            :=TLocationSKUSelect[i].isbond   ;
            qryWareOrderOutSKU.Fieldbyname('countrent').asstring         :=TLocationSKUSelect[i].countrent     ;
            qryWareOrderOutSKU.Fieldbyname('countcontcost').asstring     :=TLocationSKUSelect[i].countcontcost   ;
            qryWareOrderOutSKU.Fieldbyname('warerentcounttype').asstring :=TLocationSKUSelect[i].warerentcounttype     ;
            qryWareOrderOutSKU.Fieldbyname('WO_CCAID').asstring          :=TLocationSKUSelect[i].costcusid ;
            qryWareOrderOutSKU.Fieldbyname('WO_CCAname').asstring        :=TLocationSKUSelect[i].costcusname ;
            qryWareOrderOutSKU.Fieldbyname('loadcostone').asstring       :=TLocationSKUSelect[i].loadcostone ;
            qryWareOrderOutSKU.Fieldbyname('skucostclasscd').asString    :=TLocationSKUSelect[i].skucostclasscd;
            qryWareOrderOutSKU.Fieldbyname('LI_QuantityRemain').AsFloat  :=TLocationSKUSelect[i].syquantity;
//wql_new            qryWareOrderOutSKU.Fieldbyname('costopid').asString    :=TLocationSKUSelect[i].costopid;
            qryWareOrderOutSKU.Fieldbyname('opname').asString            :=TLocationSKUSelect[i].opname;
//wql_new            qryWareOrderOutSKU.Fieldbyname('Operator_ShipAcc').asString    :=TLocationSKUSelect[i].Operator_ShipAcc;
            qryWareOrderOutSKU.Fieldbyname('NotFullSign').asString       :=TLocationSKUSelect[i].NotFullSign;
            qryWareOrderOutSKU.Fieldbyname('carriage').asFloat           :=TLocationSKUSelect[i].carriage;
            qryWareOrderOutSKU.Fieldbyname('carriagetotal').asFloat      :=TLocationSKUSelect[i].carriagetotal;
            qryWareOrderOutSKU.fieldbyname('insurance').asFloat          :=TLocationSKUSelect[i].insurance;
            qryWareOrderOutSKU.Fieldbyname('insurancetotal').asFloat     :=TLocationSKUSelect[i].insurancetotal;
            qryWareOrderOutSKU.Fieldbyname('SKU_CustomerID').asString    :=TLocationSKUSelect[i].customerno;
            qryWareOrderOutSKU.Fieldbyname('skumodel').asString          :=TLocationSKUSelect[i].skumodel;
            qryWareOrderOutSKU.Fieldbyname('skuspec').asString           :=TLocationSKUSelect[i].skuspec;
            qryWareOrderOutSKU.Fieldbyname('color').asString             :=TLocationSKUSelect[i].color;

            qryWareOrderOutSKU.FieldByName('OrderStatus').Asstring:='H';
        end;
      end;

    qryWareOrderOutSKU.FieldByName('OperationType').AsInteger     :=qryWareOrderOutOriSKU.fieldbyname('OperationType').AsInteger;
    qryWareOrderOutSKU.FieldByName('costopid').Asstring           :=qryWareOrderOutOriSKU.fieldbyname('costopid').Asstring;
    qryWareOrderOutSKU.FieldByName('opname').Asstring             :=qryWareOrderOutOriSKU.fieldbyname('opname').Asstring;
    qryWareOrderOutSKU.FieldByName('shipperopname').Asstring      :=qryWareOrderOutOriSKU.fieldbyname('shipperopname').Asstring;
    try
       qryWareOrderOutSKU.Post;
    except
       break;
    end;
  end; }
end;

procedure TfrmWareOrderOut.grdOriSKUDblClick(Sender: TObject);
var
   jsOriPiece,jsOriVolume,jsOriHeight,jsOriWidth,jsOriDepth:extended;
   jsOriSizeUOM,jsOriVolueUOM:string;
   StrClassid,StrClassIdP:string;
begin
  if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtVolume)  then
  begin
    jsOriPiece   :=qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat;
    jsOriHeight  :=qryWareOrderOutOriSKU.FieldByName('Height').AsFloat;
    jsOriWidth   :=qryWareOrderOutOriSKU.FieldByName('Width').AsFloat;
    jsOriDepth   :=qryWareOrderOutOriSKU.FieldByName('Depth').AsFloat;
    jsOriVolume  :=qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat;
    jsOriSizeUOM :=qryWareOrderOutOriSKU.FieldByName('SizeUOM').AsString;
    jsOriVolueUOM:=qryWareOrderOutOriSKU.FieldByName('VolumeUOM').AsString;
    while WorkVolume(jsOriPiece,jsOriHeight,jsOriWidth,jsOriDepth,jsOriVolume,jsOriSizeUOM,jsOriVolueUOM,iif(DataState=stBrowse,'True','False')) and (DataState in Setdcs) do
      begin
        qryWareOrderOutOriSKU.Edit;
        qryWareOrderOutOriSKU.FieldByName('Height').AsFloat    :=jsOriHeight;
        qryWareOrderOutOriSKU.FieldByName('Width').AsFloat     :=jsOriWidth;
        qryWareOrderOutOriSKU.FieldByName('Depth').AsFloat     :=jsOriDepth;
        qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat    :=jsOriVolume;
        qryWareOrderOutOriSKU.FieldByName('SizeUOM').AsString  :=jsOriSizeUOM;
        qryWareOrderOutOriSKU.FieldByName('VolumeUOM').AsString:=jsOriVolueUOM;
        exit;
      end; 
  end;
  if _DB_Order='T' then
  begin
     if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtQuantity) and (DataState in Setdcs) and (qryWareOrderOutSKU.RecordCount=0)then
     begin
        OpenSql(dataTmp.qryTmp,' select Classid from Sku where skuid="'+qryWareOrderOutOriSKU.FieldByName('SkuId').AsString+'" ');
        StrClassid:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,' select Top 1 Sku.Classid   '
                      +'   from WareOrderOriSku (nolock),Sku(nolock)  '
                      +'  where WareOrderOriSku.SkuId=Sku.SkuId  '
                      +'    and isnull(WareOrderOriSku.QuantityRemain,0)>0 '
                      +'    and  "'+StrClassid+'" like  Sku.ClassId+"%" '
                      +'    and WareOrderOriSku.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
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
                      +'    and Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskQ (Quantity)    '+chr(13)+chr(10)
                      +' select isnull(QuantityReMain,0)*-1 from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
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
                      +'    and Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskP (Quantity)    '+chr(13)+chr(10)
                      +' select isnull(QuantityReMain,0)*-1 from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select @Quantity=sum(isnull(Quantity,0)) from #lskQ  '+chr(13)+chr(10)
                      +' select @QuantityP=sum(isnull(Quantity,0)) from #lskP  '+chr(13)+chr(10)
                      +' select QuantityP=@QuantityP,Quantity=@Quantity  '+chr(13)+chr(10)
                      +'   drop table #lskQ  drop table #lskP  ');
        qryWareOrderOutOriSKU.Edit;
        if dataTmp.qryTmp.FieldByName('Quantity').AsFloat>dataTmp.qryTmp.FieldByName('QuantityP').AsFloat then
           qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat:=dataTmp.qryTmp.FieldByname('QuantityP').AsFloat
        else
           qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat:=dataTmp.qryTmp.FieldByname('Quantity').AsFloat;
     end;
     if (grdOriSKU.Columns[grdOriSKU.FocusedColumn] = edtNetWeight) and (DataState in Setdcs) and (qryWareOrderOutSKU.RecordCount=0)then
     begin
        OpenSql(dataTmp.qryTmp,' select Classid from Sku where skuid="'+qryWareOrderOutOriSKU.FieldByName('SkuId').AsString+'" ');
        StrClassid:=dataTmp.qryTmp.FieldByName('Classid').AsString;
        OpenSql(dataTmp.qryTmp,' select Top 1 Sku.Classid   '
                      +'   from WareOrderOriSku (nolock),Sku(nolock)  '
                      +'  where WareOrderOriSku.SkuId=Sku.SkuId  '
                      +'    and isnull(WareOrderOriSku.NetWeightRemain,0)>0 '
                      +'    and  "'+StrClassid+'" like  Sku.ClassId+"%" '
                      +'    and WareOrderOriSku.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and WareOrderOriSku.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
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
                      +'    and Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassid+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskQ (NetWeight)    '+chr(13)+chr(10)
                      +' select isnull(QuantityRemain,0)*(isnull(NetWeight,0)/quantity)*-1 '+chr(13)+chr(10)
                      +'   from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
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
                      +'    and Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' insert into #lskP (NetWeight)    '+chr(13)+chr(10)
                      +' select isnull(QuantityRemain,0)*(isnull(NetWeight,0)/quantity)*-1 '+chr(13)+chr(10)
                      +'   from WareOrderOriSku Detail(nolock),Sku (nolock)   '+chr(13)+chr(10)
                      +'  where Detail.cusid="'+qryWareOrderOutOriSKU.FieldByName('cusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.shippercusid="'+qryWareOrderOutOriSKU.FieldByName('shippercusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and Detail.costcusid="'+qryWareOrderOutEdit.FieldByName('costcusid').AsString+'"     '+chr(13)+chr(10)
                      +'    and isnull(Detail.QuantityReMain,0)>0   '+chr(13)+chr(10)
                      +'    and Sku.SkuId=Detail.SkuId  '+chr(13)+chr(10)
                      +'    and Sku.ClassId like "'+StrClassidP+'%"   '+chr(13)+chr(10)
//                      +'     or "'+StrClassid+'" like "%"+Sku.ClassId)   '+chr(13)+chr(10)
                      +' select @NetWeight=sum(isnull(NetWeight,0)) from #lskQ  '+chr(13)+chr(10)
                      +' select @NetWeightP=sum(isnull(NetWeight,0)) from #lskP  '+chr(13)+chr(10)
                      +' select NetWeightP=@NetWeightP,NetWeight=@NetWeight  '+chr(13)+chr(10)
                      +'   drop table #lskQ  drop table #lskP  ');
        qryWareOrderOutOriSKU.Edit;
        if dataTmp.qryTmp.FieldByName('NetWeight').AsFloat>dataTmp.qryTmp.FieldByName('NetWeightP').AsFloat then
           qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=dataTmp.qryTmp.FieldByname('NetWeightP').AsFloat
        else
           qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=dataTmp.qryTmp.FieldByname('NetWeight').AsFloat;
     end;
  end;
end;

procedure TfrmWareOrderOut.edtQuantityValidate(Sender: TObject;
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
      if qryWareOrderOutOriSKU.FieldByName('costuomtype').AsString='quantity' then
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
                                                            *qryWareOrderOutOriSKU.FieldByName('price').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('pricein').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat;
      end;
    with  grdOriSKU.InplaceEditor do
    begin
    qryWareOrderOutOriSKU.Edit;
    if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderOutOriSKU.FieldByName('SKUID').AsString<>''))
       and ((_DB_Order<>'T')or (_isfromsku='T'))
       then
       begin
         //件数
         if (_isfromsku='T')and (qryWareOrderOutOriSKU.FieldByName('piecepro').AsFloat<>0) then
            qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     /qryWareOrderOutOriSKU.FieldByName('piecepro').AsFloat)
         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat);
         //体积
         if  (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('VolumePro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat:=(qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat
                                                         *qryWareOrderOutOriSKU.FieldByName('VolumePro').AsFloat)
         else
         if  (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
         //面积
         if (_isfromsku='T')and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('AreaPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Area').AsFloat:=(qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat
                                                       *qryWareOrderOutOriSKU.FieldByName('AreaPro').AsFloat)
         else
         if  (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('Area').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
         //净重量
         if  (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=(qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat
                                                                *qryWareOrderOutOriSKU.FieldByName('NetWeightPro').AsFloat)
         else
         if  (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
         //毛重量
         if (_isfromsku='T')and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat:=(qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat
                                                                *qryWareOrderOutOriSKU.FieldByName('GrossWeightPro').AsFloat)

         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat;
       end;
     qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
    end;
    Accept:=True;
  end;
end;


procedure TfrmWareOrderOut.edtSKUQUANTITYValidate(Sender: TObject;
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
      if qryWareOrderOutSKU.FieldByName('costuomtype').AsString='quantity' then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSku.InplaceEditor.GetEditingText)
                                                            *qryWareOrderOutSKU.FieldByName('price').AsFloat;
         qryWareOrderOutSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('pricein').AsFloat;
         qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('carriage').AsFloat;
         qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('insurance').AsFloat;
      end;
     with  grdSKU.InplaceEditor do
     begin
       qryWareOrderOutSKU.Edit;
   //    qryWareOrderOutOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderOutSKU.FieldByName('SKUID').AsString<>''))  then
          begin
            //件数
            if (strtofloat(GetEditingText)<>0) then
               qryWareOrderOutSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText)
                                                        *qryWareOrderOutSKU.FieldByName('Piece').AsFloat
                                                        /qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
            //体积
            if (strtofloat(GetEditingText)<>0) then
               qryWareOrderOutSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                        *qryWareOrderOutSKU.FieldByName('Volume').AsFloat
                                                        /qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
            //面积
            if (strtofloat(GetEditingText)<>0) then
               qryWareOrderOutSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                        *qryWareOrderOutSKU.FieldByName('Area').AsFloat
                                                        /qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
            //净重量
            if (strtofloat(GetEditingText)<>0) then
               qryWareOrderOutSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *qryWareOrderOutSKU.FieldByName('NetWeight').AsFloat
                                                        /qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
            //毛重量
            if (strtofloat(GetEditingText)<>0) then
               qryWareOrderOutSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *qryWareOrderOutSKU.FieldByName('GrossWeight').AsFloat
                                                        /qryWareOrderOutSKU.FieldByName('Quantity').AsFloat;
          end;
        qryWareOrderOutSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
        
        if UpperCase(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring)='SNO' then
        begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:=qryWareOrderOutSKU.FieldByName('price').AsFloat;
        end else
        begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderOutSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderOutSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                                                                         qryWareOrderOutSKU.FieldByName('price').AsFloat;
        end;
     end;
         Accept:=True;
   end;
end;

procedure TfrmWareOrderOut.edtSKULocationNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
   if DataState in setDcs then
   begin
     qryselect:=pGetLocationSelect('','','');
     if qrySelect.FieldByName('LocID').asstring<>'NO' then
     begin
       qryWareOrderOutSKU.Edit;
       qryWareOrderOutSKU.Fieldbyname('Locid').asstring:=qrySelect.fieldbyname('LocId').asstring;
       qryWareOrderOutSKU.Fieldbyname('Locname').asstring:=qrySelect.fieldbyname('LocName').asstring;
       ReturnNext(Self);
     end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.grdSKUExit(Sender: TObject);
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

procedure TfrmWareOrderOut.edtCostopidButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderOutEdit.fieldbyname('costcusid').asstring='' then
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
         qrySelect:=pGetOperatorSelect(qryWareOrderOutEdit.fieldbyname('costcusid').asstring);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('costopid').AsString  :=qrySelect.FieldByName('opid').asstring;
            qryWareOrderOutEdit.FieldByName('costopname').AsString:=qrySelect.FieldByName('opname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtCostopidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostopid.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('costopid').AsString:='';
         qryWareOrderOutEdit.FieldByName('costopname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(qryWareOrderOutEdit.fieldbyname('costcusid').asstring);
         if qrySelect.FieldByName('OPID').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('costopid').AsString  :=qrySelect.FieldByName('OPID').asstring;
            qryWareOrderOutEdit.FieldByName('costopname').AsString  :=qrySelect.FieldByName('opName').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.Operator_AccountButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderOutSKU.fieldbyname('cusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='寄仓单位不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','032'),mtWarning,[mbOK],0);
        Exit;
      end;
{wql_new     getDm:=WorkchooseUsers(' isnull(LoginAccountID,"") like "'+qryWareOrderOutSKU.fieldbyname('cusid').asstring+'%" ');
      if getDm.okflag then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.Fieldbyname('Operator_Account').asstring:=getDm.Mc;
      end;  wql_new}
   end;
end;

procedure TfrmWareOrderOut.Operator_ShipAccButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   getDm:Tdmsr;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderOutSKU.fieldbyname('shippercusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='货主不能为空，必须填写！'
        else
           _strmessage:='**************';  }
        KMessageDlg(GetMessage('frmWareOrderDxALL','033'),mtWarning,[mbOK],0);
        Exit;
      end;
{wql_new      getDm:=WorkchooseUsers(' isnull(LoginAccountID,"") like "'+qryWareOrderOutSKU.fieldbyname('shippercusid').asstring+'%" ');
      if getDm.okflag then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.Fieldbyname('Operator_ShipAcc').asstring:=getDm.Mc;
      end;  wql_new}
   end;
end;

procedure TfrmWareOrderOut.opnameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderOutOriSKU.fieldbyname('cusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='寄仓单位不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','032'),mtWarning,[mbOK],0);
        Exit;
      end;
      qrySelect:=pGetOperatorSelect(qryWareOrderOutOriSKU.fieldbyname('cusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         qryWareOrderOutOriSKU.FieldByName('opname').AsString:=qrySelect.FieldByName('opname').asstring;
         //blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.ShipperopidOriButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if qryWareOrderOutOriSKU.fieldbyname('shippercusid').asstring='' then
      begin
        {if _Language='CAPTIONC' then
           _strmessage:='货主不能为空，必须填写！'
        else
           _strmessage:='**************';}
        KMessageDlg(GetMessage('frmWareOrderDxALL','033'),mtWarning,[mbOK],0);
        Exit;
      end;
      qrySelect:=pGetOperatorSelect(qryWareOrderOutOriSKU.fieldbyname('shippercusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.FieldByName('shipperopid').AsString  :=qrySelect.FieldByName('opid').asstring;
         qryWareOrderOutOriSKU.FieldByName('shipperopname').AsString:=qrySelect.FieldByName('opname').asstring;
         //blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.edtSKUPieceValidate(Sender: TObject;
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
      if (qryWareOrderOutSKU.FieldByName('costuomtype').AsString='piece')or(qryWareOrderOutSKU.FieldByName('costuomtype').AsString='') then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSku.InplaceEditor.GetEditingText)
                                                            *qryWareOrderOutSKU.FieldByName('price').AsFloat;
         qryWareOrderOutSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('pricein').AsFloat;
         qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('carriage').AsFloat;
         qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdSku.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutSKU.FieldByName('insurance').AsFloat;
      end;
      with  grdSKU.InplaceEditor do
      begin
      qryWareOrderOutSKU.Edit;
        if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderOutSKU.FieldByName('SKUID').AsString<>''))  then
        begin
           if (strtofloat(GetEditingText)<>0) then
           begin
             if Kmessagedlg(GetMessage('frmWareOrderDxALL','034'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//iif(_language='CAPTIONC','你确定要更改商品数量吗？','')
             begin
               qryWareOrderOutSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText)
                                                    *qryWareOrderOutSKU.FieldByName('Quantity').AsFloat
                                                    /qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
             end;
           end;

           //体积
           if (strtofloat(GetEditingText)<>0) then
              qryWareOrderOutSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                       *qryWareOrderOutSKU.FieldByName('Volume').AsFloat
                                                       /qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
           //面积
           if (strtofloat(GetEditingText)<>0) then
              qryWareOrderOutSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                       *qryWareOrderOutSKU.FieldByName('Area').AsFloat
                                                       /qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
           //净重量
           if (strtofloat(GetEditingText)<>0) then
              qryWareOrderOutSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                       *qryWareOrderOutSKU.FieldByName('NetWeight').AsFloat
                                                       /qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
           //毛重量
           if (strtofloat(GetEditingText)<>0) then
              qryWareOrderOutSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                       *qryWareOrderOutSKU.FieldByName('GrossWeight').AsFloat
                                                       /qryWareOrderOutSKU.FieldByName('Piece').AsFloat;
         end;
        qryWareOrderOutSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText);
        
        if UpperCase(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring)='SNO' then
        begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:=qryWareOrderOutSKU.FieldByName('price').AsFloat;
        end else
        begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderOutSKU.fieldbyname('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                             qryWareOrderOutSKU.fieldbyname('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderOutSKU.FieldByName(qryWareOrderOutSKU.fieldbyname('costuomtype').asstring).AsFloat*
                                                                         qryWareOrderOutSKU.FieldByName('price').AsFloat;
        end;
     end;
      Accept:=True;
 end;
end;

procedure TfrmWareOrderOut.edtPieceValidate(Sender: TObject;
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
      if (qryWareOrderOutOriSKU.FieldByName('costuomtype').AsString='piece')or (qryWareOrderOutOriSKU.FieldByName('costuomtype').AsString='') then
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
                                                            *qryWareOrderOutOriSKU.FieldByName('price').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('pricein').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat;
         qryWareOrderOutOriSKU.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                         qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat;
      end;
    with  grdOriSKU.InplaceEditor do
    begin
    qryWareOrderOutOriSKU.Edit;
    if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (qryWareOrderOutOriSKU.FieldByName('SKUID').AsString<>''))
       and ((_DB_Order<>'T')or(_isfromsku='T'))  then
       begin
         //体积
         if  (_isfromsku='T')and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('VolumePro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat:=(strtofloat(GetEditingText)
                                                         *qryWareOrderOutOriSKU.FieldByName('VolumePro').AsFloat)
         else
         if  (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('Volume').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat;
         //面积
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('AreaPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Area').AsFloat:=(strtofloat(GetEditingText)
                                                       *qryWareOrderOutOriSKU.FieldByName('AreaPro').AsFloat)
         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('Area').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat;
         //净重量
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('NetWeightPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                *qryWareOrderOutOriSKU.FieldByName('NetWeightPro').AsFloat)
         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('NetWeight').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat;
         //毛重量
         if (_isfromsku='T') and ((strtofloat(GetEditingText)*qryWareOrderOutOriSKU.FieldByName('GrossWeightPro').AsFloat)<>0) then
            qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat:=(strtofloat(GetEditingText)
                                                                *qryWareOrderOutOriSKU.FieldByName('GrossWeightPro').AsFloat)

         else
         if (_isfromsku<>'T') and (strtofloat(GetEditingText)<>0) then
            qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *qryWareOrderOutOriSKU.FieldByName('GrossWeight').AsFloat
                                                     /qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat;
       end;
     qryWareOrderOutOriSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText);
    end;
    Accept:=True;
  end;

end;

procedure TfrmWareOrderOut.mitCheckSKUClick(Sender: TObject);
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
      qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      btnRefreshClick(self);
      if (qryWareOrderOut.Fieldbyname('CheckName').asstring='') and (qryWareOrderOut.Fieldbyname('CheckSKUED').asstring='') then
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

procedure TfrmWareOrderOut.mitOperationClick(Sender: TObject);
begin
   pcWareOrder.ActivePage :=tbsEdit;
   pcInfo.ActivePage:=tbsWareOrder;
   WorkOperation(stBrowse,qryWareOrderOut.FieldByName('Jobno').AsString,
                          qryWareOrderOut.FieldByName('UserID').AsString); 
end;

procedure TfrmWareOrderOut.OrderCnfg ;
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

procedure TfrmWareOrderOut.mitRelationClick(Sender: TObject);
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
      if qryWareOrderOut.Fieldbyname('CheckName').asstring='' then
      begin
         qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
         _ADOConnection.startTransaction;
         try
            ExecSql(dataTmp.qryTmp,StrUpdateOrder+'"'+qryWareOrderOut.FieldByName('jobno').AsString+'"'+' '+StrUpdateSku+'"'+qryWareOrderOut.FieldByName('jobno').AsString+'"');
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

procedure TfrmWareOrderOut.edtCarriercusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCarriercusid.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('carriercusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('D',edtCarriercusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtCarriercusidExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderOut.edtConsignCusIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtConsignCusID.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('shipcusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',edtConsignCusID.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtConsignCusIDExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderOut.cmbCostcusidoutButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('C','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutEdit.FieldByName('costcusidout').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutEdit.FieldByName('costcusnameout').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.cmbCostcusidoutExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbCostcusidout.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('costcusidout').AsString:='';
         qryWareOrderOutEdit.FieldByName('costcusnameout').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('C',cmbCostcusidout.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('costcusidout').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('costcusnameout').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.cmbCostcusidoutExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmWareOrderOut.edtOrigincusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOrigincusid.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('origincusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('origincusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('L',edtOrigincusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('origincusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('origincusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtOrigincusidExit(Sender: TObject);
begin
  blnselect:=False;
end;

procedure TfrmWareOrderOut.edtDestcusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtDestcusname.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('destcusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('destcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('L',edtDestcusname.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('destcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('destcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtDestcusnameExit(Sender: TObject);
begin
   blnSelect:=false;
end;

procedure TfrmWareOrderOut.edtCostopidExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderOut.mitCheckClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from wareordersku (nolock) where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','042'),mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','************')
      Exit;
   end;
   if qryWareOrderOut.FieldByName('checkname').AsString<>'' then
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
                          '  where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.mitCheckCancelClick(Sender: TObject);
begin
   if qryWareOrderOut.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','044'),mtWarning,[mbOK],0);
      exit;
   end;
   if qryWareOrderOut.Fieldbyname('tasked').asstring<>'' then
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
                      '  where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.miOirSkuClick(Sender: TObject);
var
  TContainerSkuSelect:TMultContainerSKUSelect;
begin
   if qryWareOrderOut.FieldByName('jobnoin').AsString='' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该指令不是从其它系统下达，无需对应原始指令！'
      else
         _strmessage:='**************';}
      Kmessagedlg(GetMessage('frmWareOrderDxALL','038'),mtInformation,[mbOk],0);
      Exit;
   end;
   if qryWareOrderOutSKU.FieldByName('jobnoine').asstring<>'' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该商品信息已有对应原始数据，您确定要重新对应吗?'
      else
         _strmessage:='**************'; }
      if KmessageDlg(GetMessage('frmWareOrderDxALL','039'),mtConfirmation,[mbYes,mbNo],0)<>mryes then
         exit;
   end;
   if not qryWareOrderOutOriSKU.active then qryWareOrderOutOriSKU.open; 
   TContainerSkuSelect:=WorkContainerSkuSelect('KINNOR','');
   if TContainerSkuSelect[0].okflag then
   begin
      qryWareOrderOutSKU.edit;
      qryWareOrderOutSKU.FieldByName('jobnoine').AsString:=TContainerSkuSelect[0].Jobnoin;
      qryWareOrderOutSKU.FieldByName('snoine').AsInteger:=TContainerSkuSelect[0].snoin;
      qryWareOrderOutSKU.FieldByName('jobnoindp').AsString:=IIF(TContainerSkuSelect[0].Jobnoin<>'','T','F');
   end;
end;

procedure TfrmWareOrderOut.cmbShipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.Edit;
         qryWareOrderOutOriSKU.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutOriSKU.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.shipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qryWareOrderOutSKU.Edit;
         qryWareOrderOutSKU.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutSKU.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareOrderOut.CostcusnameOriButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         qryWareOrderOutOriSKU.edit;
         qryWareOrderOutOriSKU.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutOriSKU.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmWareOrderOut.CostcusnameSKUButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         qryWareOrderOutSKU.edit;
         qryWareOrderOutSKU.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qryWareOrderOutSKU.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmWareOrderOut.N4Click(Sender: TObject);
var
   skucostuom:string;
   i:integer;
   strfilter:string;
   mulSelect:TMultLocSkuDetailSelect;
begin
   if (qryWareOrderOutSKU.FieldByName('SKUID').AsString='') then
   begin
      kMessageDlg(GetMessage('frmWareOrderDxALL','039'), mtInformation, [mbOK], 0);//'请先挑选概要商品!!!'
      exit;
   end;

   if qryWareorderOutSkuDetail.Active<>True then
   begin
      qryWareorderOutSkuDetail.ParamByName('jobno').AsString:=qryWareOrderOut.fieldByName('jobno').AsString;
      qryWareorderOutSkuDetail.Open;
   end;

   if DataState=stedit then
   begin
      _maxgridno:=0;
      qryWareorderOutSkuDetail.First;
      while not qryWareorderOutSkuDetail.Eof do
      begin
         if qryWareorderOutSkuDetail.FieldByName('ldsno').AsInteger>_maxgridno
         then _maxgridno:=qryWareorderOutSkuDetail.FieldByName('ldsno').AsInteger;
         qryWareorderOutSkuDetail.Next;
      end;
   end;

   qryWareorderOutSkuDetail.Filtered:=false;
   if qryWareOrderOutSKU.fieldbyname('sno').AsString<>'' then
      qryWareorderOutSkuDetail.filter:='sno='+qryWareorderOutSkuDetail.fieldbyname('sno').AsString
   else
      qryWareorderOutSkuDetail.filter:='sno=-1';
   qryWareorderOutSkuDetail.Filtered:=true;
   with workLIOSKUDetail(datastate,
                  qryWareOrderOut.FieldByName('jobno').AsString,qryWareOrderOutSKU.FieldByName('sno').AsInteger,
                  qryWareOrderOutSKU.FieldByName('skuid').AsString,qryWareOrderOutSKU.FieldByName('skuname').AsString,'lioskudetail',
                 2,'F',qryWareOrderOutSKU.FieldByName('jobnoin').AsString,qryWareOrderOutSKU.FieldByName('jobno').AsString,
                 qryWareOrderOutSKU.FieldByName('snoin').asinteger,qryWareOrderOutSKU.FieldByName('sno').asinteger,
                 qryWareOrderOutSKU
                ) do
   begin
      if DataState in Setdcs then
      if OKflag=True then
      begin
         qryWareOrderOutSKU.edit;
         qryWareOrderOutSKU.FieldByName('quantitytask').AsFloat:=quantity;
         qryWareOrderOutSKU.FieldByName('piecetask').AsFloat:=piece;
         qryWareOrderOutSKU.FieldByName('areatask').AsFloat:=area;
         qryWareOrderOutSKU.FieldByName('volumetask').AsFloat:=volume;
         qryWareOrderOutSKU.FieldByName('grossweighttask').AsFloat:=grossweight;
         qryWareOrderOutSKU.FieldByName('netweighttask').AsFloat:=netweight;
         skucostuom:=Trim(qryWareOrderOutSKU.FieldByName('costuomtype').AsString);
         //wzh.05.09.09 判断件数单位
         if skucostuom='' then skucostuom:='piece';
         if UpperCase(skucostuom)='SNO' then
         begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat :=qryWareOrderOutSKU.FieldByName('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat :=qryWareOrderOutSKU.FieldByName('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('skucost').AsFloat :=qryWareOrderOutSKU.FieldByName('price').AsFloat;
         end else
         begin
           qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat :=
                 qryWareOrderOutSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderOutSKU.FieldByName('carriage').AsFloat;
           qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat :=
                 qryWareOrderOutSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderOutSKU.FieldByName('insurance').AsFloat;
           qryWareOrderOutSKU.FieldByName('skucost').AsFloat :=
                 qryWareOrderOutSKU.FieldByName(skucostuom).AsFloat*
                 qryWareOrderOutSKU.FieldByName('price').AsFloat;
         end;
      end;
   end;
end;

procedure TfrmWareOrderOut.cmbCostUOMTypeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=cmbCostUOMType.ItemFields.Strings[cmbCostUOMType.Items.IndexOf(grdOriSKU.InplaceEditor.GetEditingText)];
      if strcostuom='' then strcostuom:='piece';
      qryWareOrderOutOriSKU.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderOutEdit.fieldbyname('orderdate').asdatetime)+'"'
                            +'   and skuid="'+qryWareOrderOutOriSKU.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'"'
             );
      qryWareOrderOutOriSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      qryWareOrderOutOriSKU.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('SkuCostIn').AsFloat:= qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                                                                      qryWareOrderOutOriSKU.FieldByName('priceIn').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                                                                    qryWareOrderOutOriSKU.FieldByName('price').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                        dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderOutOriSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                        dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
   end;
end;

procedure TfrmWareOrderOut.cmbSKUCostUomTypeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=cmbSKUCostUomType.ItemFields.Strings[cmbSKUCostUomType.Items.IndexOf(grdSKU.InplaceEditor.GetEditingText)];

      if strcostuom='' then strcostuom:='piece';
      qryWareOrderOutSKU.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(qryWareOrderOutEdit.fieldbyname('orderdate').asdatetime)+'"'
                            +'   and skuid="'+qryWareOrderOutSKU.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'%"'
             );
      qryWareOrderOutSKU.Fieldbyname('costuomtype').asstring :=strcostuom;
      qryWareOrderOutSKU.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      qryWareOrderOutSKU.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      qryWareOrderOutSKU.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      qryWareOrderOutSKU.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      qryWareOrderOutSKU.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      qryWareOrderOutSKU.FieldByName('SkuCostIn').AsFloat:= qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                                                                      qryWareOrderOutSKU.FieldByName('priceIn').AsFloat;
      if UpperCase(strcostuom)='SNO' then
      begin
          qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderOutSKU.FieldByName('price').AsFloat;
          qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
          qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end else
      begin
          qryWareOrderOutSKU.FieldByName('SkuCost').AsFloat:= qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                                                                        qryWareOrderOutSKU.FieldByName('price').AsFloat;
          qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                            dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
          qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                            dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end;
   end;
end;

procedure TfrmWareOrderOut.CarriageValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutSKU.Edit;
      strcostuom:=iif(qryWareOrderOutSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutSKU.FieldByName('carriage').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutSKU.FieldByName('carriage').AsFloat
      else
         qryWareOrderOutSKU.FieldByName('carriagetotal').AsFloat:=
                                     qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderOutSKU.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmWareOrderOut.InsuranceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutSKU.Edit;
      strcostuom:=iif(qryWareOrderOutSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutSKU.FieldByName('insurance').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutSKU.FieldByName('insurance').AsFloat
      else
         qryWareOrderOutSKU.FieldByName('insurancetotal').AsFloat:=
                                     qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderOutSKU.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmWareOrderOut.CarriageOriValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutOriSKU.Edit;
      strcostuom:=iif(qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderOutOriSKU.FieldByName('carriagetotal').AsFloat:=qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat
      else
         qryWareOrderOutOriSKU.FieldByName('carriagetotal').AsFloat:=
                                     qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderOutOriSKU.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmWareOrderOut.InsuranceOriValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutOriSKU.Edit;
      strcostuom:=iif(qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         qryWareOrderOutOriSKU.FieldByName('insurancetotal').AsFloat:=qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat
      else
         qryWareOrderOutOriSKU.FieldByName('insurancetotal').AsFloat:=
                                     qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat*
                                     qryWareOrderOutOriSKU.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmWareOrderOut.edtPriceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdOriSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutOriSKU.Edit;
      strcostuom:=iif(qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutOriSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutOriSKU.FieldByName('price').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         qryWareOrderOutOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)
      else
         qryWareOrderOutOriSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText)*
                                                                 qryWareOrderOutOriSKU.FieldByName(strcostuom).AsFloat;
    end;
end;

procedure TfrmWareOrderOut.edtSKUSKU_CostValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKU.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareOrderOutSKU.Edit;
      strcostuom:=iif(qryWareOrderOutSKU.fieldbyname('costuomtype').AsString='','piece',qryWareOrderOutSKU.fieldbyname('costuomtype').AsString);
      qryWareOrderOutSKU.FieldByName('price').AsFloat:=StrToFloat(grdOriSKU.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         qryWareOrderOutSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText)
      else
        qryWareOrderOutSKU.FieldByName('skucost').AsFloat:=StrToFloat(grdSKU.InplaceEditor.GetEditingText)*
                                                                qryWareOrderOutSKU.FieldByName(strcostuom).AsFloat;
    end;
end;

procedure TfrmWareOrderOut.mitCheckMoreClick(Sender: TObject);
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
      qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      OpenSql(dataTmp.qryTmp,'select * from wareordersku(nolock) where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'" ');
      if (dataTmp.qryTmp.RecordCount=0) then
      begin
         if j=1 then                                      //审核单笔提示,审核多笔记录K
         begin
            KmessageDlg(GetMessage('frmWareOrderDxALL','042'),mtWarning,[mbOK],0);
            //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','***************************')
            Exit
         end else
         begin
            inc(k);
            Continue;
         end;
      end;
      if qryWareOrderOut.FieldByName('checkname').AsString<>'' then
      begin
         if j=1 then                                      //审核单笔提示,审核多笔记录K
         begin
            KmessageDlg(GetMessage('frmWareOrderDxALL','043'),mtWarning,[mbOK],0);
            //IIF(_Language='CAPTIONC','该指令已审核，不能再次审核！','***************************')
            Exit
         end else
         begin
            Inc(k);
            Continue;
         end;
      end;
      if qryWareOrderOut.FieldByName('CHECKNAME').AsString='' then
         execSql(dataTmp.qryTmp,'update wareorder '
                               +'   set checkname="'+_loginname+'",'
                               +'       checkdate="'+datetostr(now)+'"'
                               +' where jobno="'+qryWareOrderOut.FieldByName('Jobno').AsString+'"');
      btnRefreshClick(btnRefresh);
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   if k<>0 then
      KMessageDlg(IntToStr(k)+'/'+IntToStr(J)+GetMessage('frmWareOrderDxALL','045'),mtWarning,[mbOK],0)
      //IIF(_Language='CAPTIONC','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因无货物信息或已经审核过无法审核', '本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔无法审核')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.mitCancelMoreClick(Sender: TObject);
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
      qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      if qryWareOrderOut.Fieldbyname('checkname').asstring='' then
      begin
         if j=1 then
         begin
            {if _Language='CAPTIONC' then
              _strmessage:='该指令还未审核，不能取消审核！'}
            KmessageDlg(GetMessage('frmWareOrderDxALL','044'),mtWarning,[mbOK],0);
            exit;
         end else
         begin
            Inc(K);
            Continue;
         end;
      end;
      if qryWareOrderOut.Fieldbyname('tasked').asstring<>'' then
      begin
         if j=1 then
         begin
           { if _Language='CAPTIONC' then
              _strmessage:='该笔已下达任务，不能取消审核！'}
            KmessageDlg(GetMessage('frmWareOrderDxALL','037'),mtWarning,[mbOK],0);
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
                            +' where jobno="'+qryWareOrderOut.FieldByName('Jobno').AsString+'"');
      btnRefreshClick(btnRefresh);
      _pgbClear.StepBy(1);   //为了控制进度条
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   if k<>0 then
      KMessageDlg(IntToStr(k)+'/'+IntToStr(J)+GetMessage('frmWareOrderDxALL','046'),mtWarning,[mbOK],0)
      //IIF(_Language='CAPTIONC','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因未审核或已下达指令而无法取消审核','本次共'+IntToStr(J)+'笔,其中'+IntToStr(k)+'笔因未审核或已下达指令而无法取消审核')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.N6Click(Sender: TObject);
var strNum:Integer;
begin
   OpenSql(dataTmp.qryTmp,'select * from wareordersku (nolock) where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg(GetMessage('frmWareOrderDxALL','042'),mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该指令无货物信息，不能审核！','************')
      Exit;
   end;
   if qryWareOrderOut.FieldByName('checkname').AsString='' then
   begin
      if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update wareorder '+
                             '    set checkname="'+_Loginname+'",'+
                             '        checkdate="'+DateToStr(now)+'"'+
                             '  where jobno="'+qryWareOrderOut.FieldByName('jobno').AsString+'"');
      btnRefreshClick(Self);
      if not qryWareOrderOutSKU.active then qryWareOrderOutSKU.open;
      if _DB_Order<>'T' then
      begin
         opensql(dataTmp.qryTmp,'select acount=count(*) '
                       +'  from locationoutitem (nolock)'
                       +' where jobnoorder="'+qryWareOrderOut.FieldByName('jobno').Asstring+'"');
         if dataTmp.qryTmp.FieldByName('acount').AsInteger>0 then
           if KmessageDlg(GetMessage('frmWareOrderDxALL','025'),mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;//iif(_language='CAPTIONC','该指令单已有数据形成任务，您确定要重新生成任务吗?','')
      end;
      pcWareOrder.ActivePage := tbsEdit;
      pcInfo.ActivePage:=tbsWareOrder;

      qryWareOrderOutSKU.DisableControls;
      Bookmark:= qryWareOrderOutSKU.GetBookmark;
      strNum:=0;
      qryWareOrderOutSKU.First;
      while not qryWareOrderOutSKU.Eof do
      begin
        if qryWareOrderOutSKU.FieldByName('skuid').Asstring='' then strNum:=strNum+1;
        qryWareOrderOutSKU.Next;
      end;
      qryWareOrderOutSKU.GotoBookmark(Bookmark);
      qryWareOrderOutSKU.FreeBookmark(Bookmark);
      bookMark:=nil;
      qryWareOrderOutSKU.EnableControls;

      if strNum<>0 then
        begin
          if WorkChooseSKUID(qryWareOrderOutSKU) then
            begin
              //更新后台数据库的商品库内容
              _ADOConnection.Starttransaction;
              qryWareOrderOutSKU.first;
              qryWareOrderOutSKU.EnableControls;
              qryWareOrderOutSKU.applyupdates;

              //检查库存
              //wql_new  CheckWareInventory(qryWareOrderOutEdit.FieldByName('Jobno').AsString);
              _ADOConnection.Commit;
              qryWareOrderOutSKU.commitUpdates;
            end
          else exit;
        end;
      //调用locationinout，生成任务!为了取完整的商品费率必须filtered设为False!
      WorkLocationOUT(stInsert,'','ITEM',qryWareOrderOutEdit,qryWareOrderOutSKU);
     {wql_new else if qryWareOrderOut.FieldByName('DictateType').AsString='库内作业指令' then
      WorkValueAddDx(stInsert,'','','T'); wql_new }
   end;
end;

procedure TfrmWareOrderOut.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin

  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        qryWareOrderOutEdit.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        qryWareOrderOutEdit.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmWareOrderOut.edtIUserExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmWareOrderOut.edtIUserExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtIUser.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('iuserid').AsString:='';
         qryWareOrderOutEdit.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtIUser.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            qryWareOrderOutEdit.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.N5Click(Sender: TObject);
var
  lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdOriSKU,lstPara,'原始指令明细');
end;

procedure TfrmWareOrderOut.edtSKUQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
       qryWareOrderOutSKU.edit;
       qryWareOrderOutSKU.FieldByName('QualityName').AsString
                     :=pGetqualitySelect(qryWareOrderOutSKU.FieldByName('QualityName').AsString);
   end;
end;

procedure TfrmWareOrderOut.edtConsCusButtonClick(Sender: TObject;
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
            qryWareOrderOutEdit.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('conscusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.edtConsCusExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmWareOrderOut.edtConsCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtConsignCusID.Text='' then
      begin
         qryWareOrderOutEdit.Edit;
         qryWareOrderOutEdit.FieldByName('conscusid').AsString:='';
         qryWareOrderOutEdit.FieldByName('conscusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',edtConsCus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            qryWareOrderOutEdit.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            qryWareOrderOutEdit.FieldByName('conscusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareOrderOut.mitdelallClick(Sender: TObject);
begin
   opensql(dataTmp.qryTmp,'select num=count(1)'
                 +'  from WareOrdersku '
                 +' where jobno="'+qryWareOrderOutEdit.FieldByName('jobno').Asstring+'" '
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
         qryWareOrderOutSKU.First;
         while not qryWareOrderOutSKU.Eof do
         begin
            strDel_Task:=strDel_Task+' or SNO='+qryWareOrderOutSKU.fieldbyname('SNO').Asstring;
            qryWareOrderOutSKU.Delete;
         end;
      end;
   end;
end;

procedure TfrmWareOrderOut.mitjcxhtzdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pcWareOrder.ActivePage<>tbsEdit then
      pcWareOrder.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   //出货通知单
   OpenSql(dataTmp.qryTmp,'select wareorder.jobno,WareOrderSKU.skuname,WareOrderSKU.lotcode,orderdate=convert(char(10),wareorder.orderdate,102), '+chr(13)+chr(10)
                         +'       WareOrderSKU.quantity,quantityuom=WareOrderSKU.pieceuom,WareOrderSKU.locname,wareorder.createname, '+chr(13)+chr(10)
                         +'       WareOrderSKU.costcusname,WareOrderSKU.netweight,wareorder.mainorder,WareOrder.carbrand,  '+chr(13)+chr(10)
                         +'       WareOrderSKU.volume,WareOrderSKU.cusname,WareOrderSKU.orderid,  '+chr(13)+chr(10)
                         +'       WareOrderSKU.skustandard,WareOrderSKU.mainorder,uploaddate,   '+chr(13)+chr(10)
                         +'       wareorder.drivecardno,grossweight=case when WareOrderSKU.weightuom="吨" then WareOrderSKU.grossweight*1000 else WareOrderSKU.grossweight end '+chr(13)+chr(10)
                         +'  from wareorder (nolock)                                        '+chr(13)+chr(10)
                         +'       left join WareOrderSKU (nolock)                                '+chr(13)+chr(10)
                         +'              left join sku (nolock)                                         '+chr(13)+chr(10)
                         +'                    on wareordersku.skuid=sku.skuid                               '+chr(13)+chr(10)
                         +'             on wareorder.jobno=WareOrderSKU.jobno                         '+chr(13)+chr(10)
                         +'  where wareorder.JOBNO="'+qryWareOrderOutEdit.FieldByname('JOBNO').AsString+'" '+chr(13)+chr(10)
                         );
   lstpara.Add('orderid='+dataTmp.qryTmp.FieldByname('orderid').AsString);
   lstpara.Add('orderdate='+datatmp.qryTmp.fieldbyname('orderdate').asstring);
   lstpara.Add('mainorder='+datatmp.qryTmp.FieldByname('mainorder').AsString);
   lstPara.Add('cusname='+dataTmp.qryTmp.fieldbyname('cusname').AsString);
   lstPara.Add('drivecardno='+dataTmp.qryTmp.fieldbyname('drivecardno').AsString);
   lstPara.Add('username='+qryWareOrderOutEdit.fieldbyname('username').AsString);
   lstpara.Add('carbrand='+dataTmp.qryTmp.FieldByname('carbrand').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstpara.Add('createname='+dataTmp.qryTmp.FieldByname('createname').AsString);
   lstPara.Add('date='+datetostr(date));
   lstpara.Add('uploaddate='+dataTmp.qryTmp.FieldByname('uploaddate').AsString);
   Worklinprint('900095','old','出仓提货通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmWareOrderOut.N7Click(Sender: TObject);
begin
   WorkTransact;
end;

procedure TfrmWareOrderOut.N8Click(Sender: TObject);
var
   lstPara:TStringList;
   strjobno1:string;
   i:Integer;
begin
   if pcWareOrder.ActivePage<>tbsEdit then
      pcWareOrder.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   strjobno1:='';
   GenInformations(lstPara);
   for i:=grdWareOrder.SelectedCount-1 downto 0 do
   begin
      qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      strjobno1:= strjobno1+' or wareorder.jobno="'+qryWareOrderOut.fieldbyname('jobno').AsString+'" '  ;
   end;
   opensql(dataTmp.qryTmp,'select wareorder.jobno,wareorder.username,wareorder.iusername, '+chr(13)+chr(10)
                         +'       UploadDate=convert(char(10),wareorder.UploadDate,102),               '+chr(13)+chr(10)
                         +'       wareorder.costcusname,wareorder.Carbrand,wareorder.mainorder,        '+chr(13)+chr(10)
                         +'       sku.outzoneno,sku.LotCode,wareorder.jobnoin,sku.skuname,             '+chr(13)+chr(10)
                         +'       sku.skustandard,sku.volume,sku.grossweight,secondoutsku.accjobnoin,isbond=case when isnull(wareorder.isbond,"F")<>"T" then "否" else "是" end   '+chr(13)+chr(10)
                         +'  from wareorder(nolock)                                                    '+chr(13)+chr(10)
                         +'       left join wareorderorisku sku(nolock)                                   '+chr(13)+chr(10)
                         +'                 left join secondoutsku (nolock)                            '+chr(13)+chr(10)
                         +'                        on sku.jobnoin=secondoutsku.jobno                  '+chr(13)+chr(10)
                         +'                       and sku.snoin=secondoutsku.sno                      '+chr(13)+chr(10)
                         +'              on wareorder.jobno=sku.jobno                                    '+chr(13)+chr(10)
                         +' where 1=2                                                                   '+chr(13)+chr(10)
                         +strjobno1
                         );

   lstpara.Add('UploadDate='+dataTmp.qryTmp.FieldByname('UploadDate').AsString);
   lstpara.Add('tzrq='+datetostr(date));
   lstpara.Add('Carbrand='+dataTmp.qryTmp.FieldByname('Carbrand').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstPara.Add('zbr='+_loginname);
   lstpara.Add('username='+dataTmp.qryTmp.FieldByname('username').AsString);
   lstpara.Add('iusername='+dataTmp.qryTmp.FieldByname('iusername').AsString);

   Worklinprint('100088','old','保税堆场出仓提货通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmWareOrderOut.N9Click(Sender: TObject);
var
   lstPara:TStringList;
   strjobno1:string;
   i:Integer;
begin
   if pcWareOrder.ActivePage<>tbsEdit then
      pcWareOrder.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   strjobno1:='';
   GenInformations(lstPara);
{   for i:=grdWareOrder.SelectedCount-1 downto 0 do
   begin
      qryWareOrderOut.GotoBookmark(Pointer(grdWareOrder.SelectedRows[i]));
      strjobno1:= strjobno1+' or wareorder.jobno="'+qryWareOrderOut.fieldbyname('jobno').AsString+'" '  ;
   end;      }

   opensql(dataTmp.qryTmp,'select wareorder.jobno,wareorder.username,wareorder.iusername,'+chr(13)+chr(10)
                         +'       UploadDate=convert(char(10),wareorder.UploadDate,102),                        '+chr(13)+chr(10)
                         +'       wareorder.costcusname,wareorder.Carbrand,wareordersku.outzoneno,             '+chr(13)+chr(10)
                         +'       wareordersku.LotCode,wareorder.jobnoin,wareordersku.skuname,                  '+chr(13)+chr(10)
                         +'       wareordersku.skustandard,wareordersku.volume,wareordersku.grossweight,      '+chr(13)+chr(10)
                         +'       wareordersku.piece,plancontainer.receno,secondcustoms.accjobno,            '+chr(13)+chr(10)
                         +'       wareorder.mainorder,wareordersku.quantity,isbond=case when isnull(wareorder.isbond,"F")<>"T" then "否" else "是" end '+chr(13)+chr(10)
                         +'  from wareordersku,wareorder                                                      '+chr(13)+chr(10)
                         +'                 left join plancontainer                                           '+chr(13)+chr(10)
                         +'                           left join seconditem                                     '+chr(13)+chr(10)
                         +'                                     left join secondcustoms                        '+chr(13)+chr(10)
                         +'                                            on seconditem.jobno=secondcustoms.jobno  '+chr(13)+chr(10)
                         +'                                  on seconditem.sno=plancontainer.snoin              '+chr(13)+chr(10)
                         +'                                 and seconditem.receno=plancontainer.receno           '+chr(13)+chr(10)
                         +'                        on  wareorder.jobnoin= plancontainer.jobno                   '+chr(13)+chr(10)
                         +' where wareorder.jobno=wareordersku.jobno                                          '+chr(13)+chr(10)
                         +'   and wareorder.jobno="'+qryWareOrderOut.fieldbyname('jobno').AsString+'"            '+chr(13)+chr(10)
                         );

   lstpara.Add('UploadDate='+dataTmp.qryTmp.FieldByname('UploadDate').AsString);
   lstpara.Add('tzrq='+datetostr(date));
   lstpara.Add('Carbrand='+dataTmp.qryTmp.FieldByname('Carbrand').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstPara.Add('zbr='+_loginname);
   lstpara.Add('username='+dataTmp.qryTmp.FieldByname('username').AsString);
   lstpara.Add('iusername='+dataTmp.qryTmp.FieldByname('iusername').AsString);

   Worklinprint('100097','old','保税出口出货提货通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmWareOrderOut.mitordercomClick(Sender: TObject);
begin
   if pcWareOrder.ActivePage<>tbsEdit then pcWareOrder.ActivePage:=tbsEdit;
   if qryWareOrderOutEdit.FieldByName('OrderStatus').AsString<>'C' then
   execSql(dataTmp.qryTmp,'update wareorder '
                         +'   set ordercomdate="'+datetostr(now)+'",OrderStatus="C" '
                         +' where jobno="'+qryWareOrderOut.FieldByName('Jobno').AsString+'"');
   Kmessagedlg('指令完成',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.mitcancelcomClick(Sender: TObject);
begin
   if qryWareOrderOutEdit.FieldByName('OrderStatus').AsString='C' then
   execSql(dataTmp.qryTmp,'update wareorder '
                         +'   set ordercomdate=null,OrderStatus="H" '
                         +' where jobno="'+qryWareOrderOut.FieldByName('Jobno').AsString+'"');
   Kmessagedlg('取消完成',mtInformation,[mbOk],0);
end;

procedure TfrmWareOrderOut.qryWareOrderOutOriSKUAfterInsert(
  DataSet: TDataSet);
begin
  //grdOriSKU.FocusedColumn:=0;
 { qryWareOrderOutOriSKU.Fieldbyname('SNO').AsFloat  :=-1;

  qryWareOrderOutOriSKU.fieldByname('JOBNO').AsString:=qryWareOrderOutEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderOutOriSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderOutOriSKU.fieldByname('QualityName').AsString:='正品';
  qryWareOrderOutOriSKU.FieldByName('costuomtype').AsString:=iif(strCostcountuom='','piece',strCostcountuom);

  qryWareOrderOutOriSKU.fieldByname('operationtype').AsInteger:=-1;
  qryWareOrderOutOriSKU.fieldByname('CustomsNO').AsString:=qryWareOrderOutEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderOutOriSKU.fieldByname('cusid').AsString         :=iif(WareOrder_copyCusID='',WareOrder_strOrderCusID,WareOrder_copyCusID);
  qryWareOrderOutOriSKU.fieldByname('cusname').AsString       :=iif(WareOrder_copyCusName='',WareOrder_strOrderCusName,WareOrder_copyCusName);
  qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString  :=iif(WareOrder_Copyshippercusid='',WareOrder_strOrderShippercusid,WareOrder_Copyshippercusid);
  qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString:=iif(WareOrder_Copyshippercusname='',WareOrder_strOrderShippercusname,WareOrder_Copyshippercusname);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusid').AsString     :=iif(wareorder_CopyCostCusid='',qryWareOrderEdit.fieldbyname('costcusid').AsString,wareorder_CopyCostCusid);
//wql_new  qryWareOrderOriSKU.fieldByname('costcusname').AsString   :=iif(wareorder_CopyCostCusname='',qryWareOrderEdit.fieldbyname('costcusname').AsString,wareorder_CopyCostCusname);

  qryWareOrderOutOriSKU.fieldByname('OrderStatus').AsString:=qryWareOrderOutEdit.fieldByname('OrderStatus').AsString;
  qryWareOrderOutOriSKU.fieldByname('NotFullSign').AsString:='F';  }
end;

procedure TfrmWareOrderOut.qryWareOrderOutOriSKUAfterPost(
  DataSet: TDataSet);
begin
  if qryWareOrderOutOriSKU.fieldbyname('SKUName').asstring='' then
  begin
    qryWareOrderOutOriSKU.Delete;
  end;
end;

procedure TfrmWareOrderOut.qryWareOrderOutOriSKUAfterScroll(
  DataSet: TDataSet);
begin
//
end;

procedure TfrmWareOrderOut.qryWareOrderOutSKUAfterInsert(
  DataSet: TDataSet);
begin
  qryWareOrderOutSKU.fieldByname('SNO').AsInteger:=-1;
  qryWareOrderOutSKU.fieldByname('JOBNO').AsString:=qryWareOrderOutEdit.fieldbyname('JOBNO').AsString;
  qryWareOrderOutSKU.fieldByname('UserID').AsString:=_UserID;
  qryWareOrderOutSKU.fieldByname('SKUID').AsString:='';
  qryWareOrderOutSKU.fieldByname('LocID').AsString:='';
  qryWareOrderOutSKU.fieldByname('LOTCODE').AsString:='';
  qryWareOrderOutSKU.fieldByname('QualityName').AsString:='正品';

  qryWareOrderOutSKU.FieldByName('costuomtype').AsString:=iif(strCostcountuom='','piece',strCostcountuom);

  qryWareOrderOutSKU.fieldByname('operationtype').AsInteger:=-1;
  qryWareOrderOutSKU.fieldByname('CustomsNO').AsString:=qryWareOrderOutEdit.fieldbyname('CustomsNO').AsString;
  qryWareOrderOutSKU.fieldByname('cusid').AsString         :=iif(WareOrder_copyCusID='',WareOrder_strOrderCusID,WareOrder_copyCusID);
  qryWareOrderOutSKU.fieldByname('cusname').AsString       :=iif(WareOrder_copyCusName='',WareOrder_strOrderCusName,WareOrder_copyCusName);
  qryWareOrderOutSKU.fieldByname('shippercusid').AsString  :=iif(WareOrder_Copyshippercusid='',WareOrder_strOrderShippercusid,WareOrder_Copyshippercusid);
  qryWareOrderOutSKU.fieldByname('shippercusname').AsString:=iif(WareOrder_Copyshippercusname='',WareOrder_strOrderShippercusname,WareOrder_Copyshippercusname);
//wql_new  qryWareOrderSKU.fieldByname('costcusid').AsString     :=iif(wareorder_CopyCostCusid='',qryWareOrderEdit.fieldbyname('costcusid').AsString,wareorder_CopyCostCusid);
//wql_new  qryWareOrderSKU.fieldByname('costcusname').AsString   :=iif(wareorder_CopyCostCusname='',qryWareOrderEdit.fieldbyname('costcusname').AsString,wareorder_CopyCostCusname);

  qryWareOrderOutSKU.fieldByname('OrderStatus').AsString:=qryWareOrderOutEdit.fieldByname('OrderStatus').AsString;
end;

procedure TfrmWareOrderOut.qryWareOrderOutSKUAfterPost(DataSet: TDataSet);
begin
  if qryWareOrderOutSKU.fieldbyname('SKUID').asstring='' then
  begin
    qryWareOrderOutSKU.Delete;
  end;
end;

procedure TfrmWareOrderOut.qryWareOrderOutSKUAfterScroll(
  DataSet: TDataSet);
begin
//
end;

procedure TfrmWareOrderOut.qryWareOrderOutSKUBeforePost(DataSet: TDataSet);
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
       if (_DB_Order='T') and (qryWareOrderOutSKU.fieldbyname('quantitytask').asinteger<>0) and
          (qryWareOrderOutSKU.fieldbyname('quantity').asinteger<>qryWareOrderOutSKU.fieldbyname('quantitytask').asinteger)
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
         qryWareOrderOutSKU.FieldByName('SNO').asinteger:=WareOrder_maxWareOrderSKU;
         qryWareOrderOutSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
         qryWareOrderOutSKU.fieldByname('OrderStatus').AsString:='H';
       end;
    end;
  end;
end;

procedure TfrmWareOrderOut.qryWareOrderOutSKUBeforeScroll(
  DataSet: TDataSet);
begin
  WareOrder_copyCusID  :=qryWareOrderOutSKU.fieldByname('cusid').AsString;
  WareOrder_copyCusName:=qryWareOrderOutSKU.fieldByname('cusname').AsString;
  WareOrder_Copyshippercusid  :=qryWareOrderOutSKU.fieldByname('shippercusid').AsString;
  WareOrder_Copyshippercusname:=qryWareOrderOutSKU.fieldByname('shippercusname').AsString;
  strCostcountuom:=qryWareOrderOutSKU.fieldByname('costuomtype').AsString;
end;

procedure TfrmWareOrderOut.qryWareOrderOutOriSKUBeforeScroll(
  DataSet: TDataSet);
begin
  WareOrder_copyCusID  :=qryWareOrderOutOriSKU.fieldByname('cusid').AsString;
  WareOrder_copyCusName:=qryWareOrderOutOriSKU.fieldByname('cusname').AsString;
  WareOrder_Copyshippercusid  :=qryWareOrderOutOriSKU.fieldByname('shippercusid').AsString;
  WareOrder_Copyshippercusname:=qryWareOrderOutOriSKU.fieldByname('shippercusname').AsString;
  strCostcountuom:=qryWareOrderOutOriSKU.fieldByname('costuomtype').AsString;
end;

procedure TfrmWareOrderOut.qryWareOrderOutOriSKUBeforePost(
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
        if (qryWareOrderOutOriSKU.fieldbyname('quantity').asinteger=0)
          and (ValueIsInvalid(FocusedNode.Values[edtQuantity.Index],edtQuantity.Field))
          and (qryWareOrderOutOriSKU.fieldbyname('NetWeight').asinteger=0)
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
          qryWareOrderOutOriSKU.FieldByName('SNO').asinteger:=WareOrder_maxWareOrderOriSKU;
          qryWareOrderOutOriSKU.fieldByname('jobno').AsString:=qryWareOrderOutEdit.fieldbyname('jobno').AsString;
          qryWareOrderOutOriSKU.fieldByname('OrderStatus').AsString:='H';
        end;
      end;
   end;
end;

procedure TfrmWareOrderOut.btnOrderWithTaskClick(Sender: TObject);
begin
   WorkInPutOrder('O');
end;

end.


