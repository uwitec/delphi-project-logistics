unit LocationOut;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, DBTables, KUpdateSql, DB, KinQuery, dxEdLib, RXSplit, KSText,
  dxDBTLCl, dxGrClms, dxExEdtr, dxDBELib, KGroupBox, DBCtrls, ComCtrls,
  frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls, GMSLabel, dxTL,
  dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons, ExtCtrls,KDataSetProvider,libproc,
  DBClient;

type
  TfrmLocationOut = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btncopy: TKBitBtn;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdLocationOut: TdxDBGrid;
    TASKDATE: TdxDBGridColumn;
    LocationBillNO: TdxDBGridColumn;
    SKUNAME: TdxDBGridColumn;
    QUANTITYTasked: TdxDBGridColumn;
    costcusname: TdxDBGridColumn;
    OPERATIONDATE: TdxDBGridColumn;
    CHECKNAME: TdxDBGridColumn;
    CountName: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel20: TGMSStickyLabel;
    edtIUser: TdxDBButtonEdit;
    pgcLocationINOUT: TdxPageControl;
    tbsInfo: TdxTabSheet;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdTaskDate: TdxDBDateEdit;
    gmsOperationDate: TGMSStickyLabel;
    dtdOperationDate: TdxDBDateEdit;
    tbsSKU: TdxTabSheet;
    KGroupBox3: TKGroupBox;
    gmsLocationBillNO: TGMSStickyLabel;
    edtLocationBillNO: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    dtdAccountBillNO: TdxDBEdit;
    KGroupBox9: TKGroupBox;
    ckbTariff: TdxDBCheckEdit;
    ckbCountRent: TdxDBCheckEdit;
    ckbLocation: TdxDBCheckEdit;
    ckbLotsCode: TdxDBCheckEdit;
    ckbTag: TdxDBCheckEdit;
    ckbContract: TdxDBCheckEdit;
    Panel1: TPanel;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    edtCostCus: TdxDBButtonEdit;
    cmbSKUClass: TKinDbPickEdit;
    LoadTypeName: TdxDBGridColumn;
    USERname: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    Bevel4: TBevel;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    KSText4: TKSText;
    ppmLocationINOUTDetail: TPopupMenu;
    mitAddLocationINOUTDetail: TMenuItem;
    mitDelLocationINOUTDetail: TMenuItem;
    ppmSKUTask: TPopupMenu;
    mitSKUSelect: TMenuItem;
    mitOrderSKUSelect: TMenuItem;
    CONDescription: TdxDBGridColumn;
    btnTotal: TKBitBtn;
    ppmTotal: TPopupMenu;
    mitSplit: TMenuItem;
    tbsautoCost: TdxTabSheet;
    GMSStickyLabel12: TGMSStickyLabel;
    cmbWareRentcountType: TKinDbPickEdit;
    N2: TMenuItem;
    mitDetail_IN: TMenuItem;
    ppmLocationINItem: TPopupMenu;
    mitItem_IN: TMenuItem;
    CustomsNO: TdxDBGridColumn;
    ppmPrint: TPopupMenu;
    mitLIOout: TMenuItem;
    CreateUserName: TdxDBGridColumn;
    mitDetailLIInventory: TMenuItem;
    N5: TMenuItem;
    mitItemLIInventory: TMenuItem;
    shippercusname: TdxDBGridColumn;
    btnOper: TKBitBtn;
    GMSStickyLabel4: TGMSStickyLabel;
    cmbCountWho: TKinDbPickEdit;
    Piece: TdxDBGridColumn;
    mitSkuDetailItem: TMenuItem;
    OPERATIONNAME: TdxDBGridColumn;
    KGroupBox12: TKGroupBox;
    memremark: TdxDBMemo;
    Bsbz: TdxDBGridColumn;
    mitINCOWork: TMenuItem;
    timTASKDATE: TdxDBTimeEdit;
    timOperationDate: TdxDBTimeEdit;
    mitComplete: TMenuItem;
    taskisComplete: TdxDBGridColumn;
    ppmAccount: TPopupMenu;
    ckbWO_CountWith1: TdxDBCheckEdit;
    ppmEdit: TPopupMenu;
    mitEdit: TMenuItem;
    ppmOper: TPopupMenu;
    mitOper: TMenuItem;
    mitUpdateMain: TMenuItem;
    mitTotalDetail: TMenuItem;
    PieceTasked: TdxDBGridColumn;
    VolumeTasked: TdxDBGridColumn;
    Volume: TdxDBGridColumn;
    AccountBillno: TdxDBGridColumn;
    grdLocationOutItem: TdxDBGrid;
    snoItem: TdxDBGridCurrencyColumn;
    cusNameItem: TdxDBGridButtonColumn;
    ShippercusNameItem: TdxDBGridButtonColumn;
    SKUNameItem: TdxDBGridButtonColumn;
    LotCodeItem: TdxDBGridColumn;
    QualityNameItem: TdxDBGridButtonColumn;
    ManufactureDateItem: TdxDBGridDateColumn;
    QuantityItem: TdxDBGridCurrencyColumn;
    QuantityUOMItem: TdxDBGridPickColumn;
    PieceItem: TdxDBGridCurrencyColumn;
    pieceuomItem: TdxDBGridPickColumn;
    VolumeItem: TdxDBGridCurrencyColumn;
    VolumeUOMItem: TdxDBGridPickColumn;
    areaItem: TdxDBGridCurrencyColumn;
    AreaUOMItem: TdxDBGridPickColumn;
    GrossWeightItem: TdxDBGridCurrencyColumn;
    NetWeightItem: TdxDBGridCurrencyColumn;
    WeightUOMItem: TdxDBGridPickColumn;
    LocItem: TdxDBGridButtonColumn;
    priceItem: TdxDBGridCurrencyColumn;
    currcdItem: TdxDBGridPickColumn;
    skucostItem: TdxDBGridCurrencyColumn;
    casing1Item: TdxDBGridCurrencyColumn;
    uom1Item: TdxDBGridPickColumn;
    casing2Item: TdxDBGridCurrencyColumn;
    uom2Item: TdxDBGridPickColumn;
    casing3Item: TdxDBGridCurrencyColumn;
    uom3Item: TdxDBGridPickColumn;
    casing4Item: TdxDBGridCurrencyColumn;
    uom4Item: TdxDBGridPickColumn;
    casing5Item: TdxDBGridCurrencyColumn;
    loadgroupcusnameItem: TdxDBGridButtonColumn;
    forkgroupcusnameItem: TdxDBGridButtonColumn;
    liftmachinecusnameItem: TdxDBGridButtonColumn;
    TagEachUOMItem: TdxDBGridPickColumn;
    TagTotalItem: TdxDBGridCurrencyColumn;
    grdLocationOutDetail: TdxDBGrid;
    LotCodeDetail: TdxDBGridColumn;
    QualityNameDetail: TdxDBGridButtonColumn;
    ManufactureDateDetail: TdxDBGridDateColumn;
    QuantityDetail: TdxDBGridCurrencyColumn;
    QuantityUOMDetail: TdxDBGridPickColumn;
    PieceDetail: TdxDBGridCurrencyColumn;
    pieceuomDetail: TdxDBGridPickColumn;
    VolumeDetail: TdxDBGridCurrencyColumn;
    VolumeUOMDetail: TdxDBGridPickColumn;
    areaDetail: TdxDBGridCurrencyColumn;
    AreaUOMDetail: TdxDBGridPickColumn;
    GrossWeightDetail: TdxDBGridCurrencyColumn;
    NetWeightDetail: TdxDBGridCurrencyColumn;
    WeightUOMDetail: TdxDBGridPickColumn;
    LocNameDetail: TdxDBGridButtonColumn;
    casing1Detail: TdxDBGridCurrencyColumn;
    uom1Detail: TdxDBGridPickColumn;
    casing2Detail: TdxDBGridCurrencyColumn;
    uom2Detail: TdxDBGridPickColumn;
    casing3Detail: TdxDBGridCurrencyColumn;
    uom3Detail: TdxDBGridPickColumn;
    casing4Detail: TdxDBGridCurrencyColumn;
    uom4Detail: TdxDBGridPickColumn;
    casing5Detail: TdxDBGridCurrencyColumn;
    OPERATIONDATEDetail: TdxDBGridDateColumn;
    TagNODetail: TdxDBGridColumn;
    SerialNODetail: TdxDBGridColumn;
    RxSplitter1: TRxSplitter;
    ppmWare: TPopupMenu;
    btnware: TKBitBtn;
    mitRelocation: TMenuItem;
    NotFullSignItem: TdxDBGridCheckColumn;
    NotFullSignDetail: TdxDBGridCheckColumn;
    mitlocoutskudetail: TMenuItem;
    TASKDATEsj: TdxDBGridColumn;
    OPERTYPE: TdxDBGridColumn;
    mitaccount: TMenuItem;
    btnCost: TKBitBtn;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel49: TGMSStickyLabel;
    GMSStickyLabel50: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel27: TGMSStickyLabel;
    cmbConsignAccountID: TdxDBButtonEdit;
    cmbCarrierAccountID: TdxDBButtonEdit;
    edtOPID: TdxDBButtonEdit;
    edtCARRIERNO: TdxDBEdit;
    edtConQuantityTotal: TdxDBCalcEdit;
    edtOriginOrder: TdxDBEdit;
    edtDestOrder: TdxDBEdit;
    edtMainOrder: TdxDBEdit;
    edtFC_PORTDCD: TdxDBButtonEdit;
    edtFC_TRANSCD: TdxDBButtonEdit;
    edtFC_PORTLCD: TdxDBButtonEdit;
    edtCarrierName: TKinDbPickEdit;
    tageachuomDetail: TdxDBGridPickColumn;
    costuomtypeDetail: TdxDBGridKinPickColumn;
    currcdDetail: TdxDBGridPickColumn;
    priceDetail: TdxDBGridCurrencyColumn;
    priceinDetail: TdxDBGridCurrencyColumn;
    skucostinDetail: TdxDBGridCurrencyColumn;
    skucostDetail: TdxDBGridCurrencyColumn;
    CostUOMTypeItem: TdxDBGridKinPickColumn;
    rateuomtypeCost: TdxDBGridKinPickColumn;
    rentcountuomtypeItem: TdxDBGridKinPickColumn;
    uom5item: TdxDBGridPickColumn;
    uom5Detail: TdxDBGridPickColumn;
    mitAddLocItem: TMenuItem;
    QuantitytaskItem: TdxDBGridCurrencyColumn;
    priceinIItem: TdxDBGridCurrencyColumn;
    skucostinItem: TdxDBGridCurrencyColumn;
    VolumetaskItem: TdxDBGridCurrencyColumn;
    piecetaskItem: TdxDBGridCurrencyColumn;
    ItemTaskEdit: TKBitBtn;
    ItemDetailEdit1: TKBitBtn;
    Bevel6: TBevel;
    areataskItem: TdxDBGridCurrencyColumn;
    grossweighttaskItem: TdxDBGridCurrencyColumn;
    netweighttaskItem: TdxDBGridCurrencyColumn;
    mitdelLocINItem: TMenuItem;
    LDSNODetail: TdxDBGridColumn;
    ppmdel: TPopupMenu;
    mitDelDetail: TMenuItem;
    N7: TMenuItem;
    N12: TMenuItem;
    mitlocccCheck: TMenuItem;
    mitLocUnCheck: TMenuItem;
    loacccheckname: TdxDBGridColumn;
    tbsCasing: TdxTabSheet;
    grdcasing: TdxDBGrid;
    snocasing: TdxDBGridColumn;
    consigncusnameCasing: TdxDBGridButtonColumn;
    VolumeTaskCasing: TdxDBGridCurrencyColumn;
    PieceTaskCasing: TdxDBGridCurrencyColumn;
    PriceInCasing: TdxDBGridCurrencyColumn;
    SkuCostInCasing: TdxDBGridCurrencyColumn;
    ShipperCusNameCasing: TdxDBGridButtonColumn;
    AreaTaskCasing: TdxDBGridCurrencyColumn;
    GrossWeightCasing: TdxDBGridCurrencyColumn;
    NetWeightTaskCasing: TdxDBGridCurrencyColumn;
    RemarkCasing: TdxDBGridBlobColumn;
    QualityNameCasing: TdxDBGridButtonColumn;
    SkuNameCasing: TdxDBGridButtonColumn;
    OperationDateCasing: TdxDBGridDateColumn;
    QuantityTaskCasing: TdxDBGridCurrencyColumn;
    QuantityUomCasing: TdxDBGridPickColumn;
    PieceUomCasing: TdxDBGridPickColumn;
    VolumeUomCasing: TdxDBGridPickColumn;
    WeightUomCasing: TdxDBGridPickColumn;
    AreaUomCasing: TdxDBGridPickColumn;
    currcdCasing: TdxDBGridPickColumn;
    KGroupBox4: TKGroupBox;
    mitCasingAdd: TKBitBtn;
    mitCasingDel: TKBitBtn;
    mitItemClear: TKBitBtn;
    mitCasingTasked: TKBitBtn;
    ppmcasing: TPopupMenu;
    mitaddcasing: TMenuItem;
    mitdelcasing: TMenuItem;
    mainorderinItem: TdxDBGridColumn;
    mitLocAdust: TMenuItem;
    mitLocToTrans: TMenuItem;
    costcusidItem: TdxDBGridButtonColumn;
    N13: TMenuItem;
    btnDelDetail: TKBitBtn;
    mitCheckOne: TMenuItem;
    mitCancelOne: TMenuItem;
    rdgLoadType: TKDBRadioGroup;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    gmsConDescription: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel35: TGMSStickyLabel;
    edtconno: TdxDBBlobEdit;
    GMSStickyLabel21: TGMSStickyLabel;
    edtConDescription: TdxDBBlobEdit;
    edtRouting: TdxDBBlobEdit;
    edtBlNO: TdxDBEdit;
    dtdcarrierdate: TdxDBDateEdit;
    tmtcarrierdate: TdxDBTimeEdit;
    edtETSH: TdxDBDateEdit;
    timETSH: TdxDBTimeEdit;
    dtdconloaddate: TdxDBDateEdit;
    tmtconloaddate: TdxDBTimeEdit;
    gmsBillNO: TGMSStickyLabel;
    GMSStickyLabel24: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    cmbLoadCostType: TKinDbPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    ConditionDescItem: TdxDBGridColumn;
    grpinfobar: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel31: TGMSStickyLabel;
    GMSStickyLabel32: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCountName: TdxDBEdit;
    edtCheckName: TdxDBEdit;
    edtOperationName: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    edtCostCHECKNAME: TdxDBEdit;
    edtloacccheckname: TdxDBEdit;
    mitTOConsel: TMenuItem;
    grdAutoCost: TdxDBGrid;
    grdSnoCost: TdxDBGridColumn;
    grdCostCDCost: TdxDBGridKinPickColumn;
    grdIsInComeCost: TdxDBGridCheckColumn;
    grdIsMainRateCost: TdxDBGridCheckColumn;
    grdCostCusCost: TdxDBGridKinPickColumn;
    grdRateCusCost: TdxDBGridKinPickColumn;
    grdCostCusNameCost: TdxDBGridButtonColumn;
    grdRateCusNameCost: TdxDBGridButtonColumn;
    ppmCost: TPopupMenu;
    mitCostdel: TMenuItem;
    mitCostAdd: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    costuomtypecasing: TdxDBGridKinPickColumn;
    rentcountuomtypeoutItem: TdxDBGridKinPickColumn;
    casing1taskItem: TdxDBGridCurrencyColumn;
    casing2taskItem: TdxDBGridCurrencyColumn;
    casing3taskItem: TdxDBGridCurrencyColumn;
    casing4taskItem: TdxDBGridCurrencyColumn;
    casing5taskItem: TdxDBGridCurrencyColumn;
    btnCostRate: TKBitBtn;
    mitAddAutoCost: TMenuItem;
    mitUpdAutoCost: TMenuItem;
    mitDelAutoCost: TMenuItem;
    N6: TMenuItem;
    grdCountway: TdxDBGridPickColumn;
    CusbillnoinCasing: TdxDBGridColumn;
    edtCustomsNO: TdxDBEdit;
    gmsCustomsNO: TGMSStickyLabel;
    edtcorpno: TdxDBEdit;
    GMSStickyLabel33: TGMSStickyLabel;
    carriageitem: TdxDBGridCurrencyColumn;
    carriagetotalitem: TdxDBGridCurrencyColumn;
    insuranceItem: TdxDBGridCurrencyColumn;
    insurancetotalItem: TdxDBGridCurrencyColumn;
    RemarkItem: TdxDBGridBlobColumn;
    btnAppend: TKBitBtn;
    mitoutware: TMenuItem;
    mitstockup: TMenuItem;
    customernoItem: TdxDBGridColumn;
    tallycusiditem: TdxDBGridButtonColumn;
    skumodelitem: TdxDBGridColumn;
    skuspecitem: TdxDBGridColumn;
    coloritem: TdxDBGridColumn;
    mitfhzxd: TMenuItem;
    Connocasing: TdxDBGridColumn;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    grossweight: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
    mitfzckd: TMenuItem;
    cusname: TdxDBGridColumn;
    pmCheck: TPopupMenu;
    mitCheckMany: TMenuItem;
    mitCancelMany: TMenuItem;
    mainorder: TdxDBGridColumn;
    conno: TdxDBGridColumn;
    dtdGetcondate: TdxDBDateEdit;
    timGetcondate: TdxDBTimeEdit;
    GMSStickyLabel34: TGMSStickyLabel;
    Skuwtve: TdxDBGridCurrencyColumn;
    cmbCususername: TKinDbPickEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    costquantityItem: TdxDBGridCurrencyColumn;
    costquantityuomItem: TdxDBGridPickColumn;
    costquantityDetail: TdxDBGridCurrencyColumn;
    costquantityuomDetail: TdxDBGridPickColumn;
    costquantitytaskItem: TdxDBGridCurrencyColumn;
    costquantitytasked: TdxDBGridColumn;
    costquantity: TdxDBGridColumn;
    mitGetAutoCount: TMenuItem;
    conscusnameItem: TdxDBGridButtonColumn;
    carriagecurrcdItem: TdxDBGridPickColumn;
    edttaskcheckname: TdxDBEdit;
    GMSStickyLabel37: TGMSStickyLabel;
    N11: TMenuItem;
    mitTaskCheck: TMenuItem;
    mitConcelTask: TMenuItem;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel38: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    KSText5: TKSText;
    GMSStickyLabel39: TGMSStickyLabel;
    taskcheckname: TdxDBGridColumn;
    mniItemTask_Order_O: TMenuItem;
    sequencenumitem: TdxDBGridCurrencyColumn;
    outzoneno: TdxDBGridColumn;
    edtcarbrand: TdxDBBlobEdit;
    btnopid: TKBitBtn;
    mitsalescount: TMenuItem;
    ckbstockup: TdxDBCheckEdit;
    btnHS: TKBitBtn;
    edtconno1: TdxDBEdit;
    edtcarbrand1: TdxDBEdit;
    mitgetskucost: TMenuItem;
    mitcancelsales: TMenuItem;
    mitxshwccd: TMenuItem;
    corpnoitem: TdxDBGridColumn;
    pieceproitem: TdxDBGridColumn;
    mitdelcount: TMenuItem;
    cusbillnoin: TdxDBGridColumn;
    mitforkwork: TMenuItem;
    ckbcountrentout: TdxDBCheckEdit;
    ppmNo: TPopupMenu;
    mitcusbillno: TMenuItem;
    ppmNO2: TPopupMenu;
    mitblno: TMenuItem;
    mitforkworkunload: TMenuItem;
    edtOrderWeight: TdxDBCalcEdit;
    GMSStickyLabel40: TGMSStickyLabel;
    mitDocBookPic: TMenuItem;
    btnIn: TKBitBtn;
    transordered: TdxDBGridColumn;
    mitinoutquery: TMenuItem;
    pmppmcountcz: TPopupMenu;
    mitcountcz: TMenuItem;
    mitcancelcountcz: TMenuItem;
    skumodeldetail: TdxDBGridColumn;
    skuspecdetail: TdxDBGridColumn;
    remarkdetail: TdxDBGridColumn;
    mitliooutmainorder: TMenuItem;
    blno: TdxDBGridColumn;
    grdcustomsno: TdxDBGridColumn;
    customsnoin: TdxDBGridColumn;
    ppmprintqd: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    ckbistrade: TdxDBCheckEdit;
    edtTotalCost: TdxDBCalcEdit;
    grdshipcusname: TdxDBGridColumn;
    tbslocinskudetail: TdxTabSheet;
    KGroupBox5: TKGroupBox;
    GMSStickyLabel42: TGMSStickyLabel;
    GMSStickyLabel43: TGMSStickyLabel;
    GMSStickyLabel44: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    GMSStickyLabel46: TGMSStickyLabel;
    GMSStickyLabel47: TGMSStickyLabel;
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
    mainorderItem: TdxDBGridColumn;
    mitpickinglist: TMenuItem;
    mitpickinglistrp: TMenuItem;
    cmbwarerentcounttypeout: TKinDbPickEdit;
    GMSStickyLabel48: TGMSStickyLabel;
    checkdate: TdxDBGridColumn;
    mitpickinglistzdy: TMenuItem;
    mitopload: TMenuItem;
    mitopunload: TMenuItem;
    mitcustoms: TMenuItem;
    mitoutsend: TMenuItem;
    qryTmp: TKADOQuery;
    manudatestringitem: TdxDBGridPickColumn;
    manudatestringdetail: TdxDBGridPickColumn;
    heightdetail: TdxDBGridCurrencyColumn;
    customernodetail: TdxDBGridColumn;
    carbrand: TdxDBGridColumn;
    btnapprove: TKBitBtn;
    edtmincostin: TdxDBCalcEdit;
    GMSStickyLabel51: TGMSStickyLabel;
    cmbbusinesstype: TKinDbPickEdit;
    GMSStickyLabel52: TGMSStickyLabel;
    mitchecklook: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    mitcanclecost : TMenuItem;
    mitcostforkwork : TMenuItem;
    ItemDetailEdit: TKBitBtn;
    mitworkitem: TMenuItem;
    edtInspectionNo: TdxDBEdit;
    GMSStickyLabel53: TGMSStickyLabel;
    ppmhxtext: TPopupMenu;
    MenuItem2: TMenuItem;
    edtcusbillnoSearch: TdxEdit;
	grdloadcosttype: TdxDBGridColumn;
    quantityshortitem: TdxDBGridColumn;
    quantityshortdetail: TdxDBGridColumn;
    mitOutsZ: TMenuItem;
    KGroupBox6: TKGroupBox;
    GMSStickyLabel54: TGMSStickyLabel;
    GMSStickyLabel55: TGMSStickyLabel;
    GMSStickyLabel56: TGMSStickyLabel;
    GMSStickyLabel57: TGMSStickyLabel;
    GMSStickyLabel58: TGMSStickyLabel;
    GMSStickyLabel59: TGMSStickyLabel;
    GMSStickyLabel60: TGMSStickyLabel;
    GMSStickyLabel61: TGMSStickyLabel;
    GMSStickyLabel62: TGMSStickyLabel;
    GMSStickyLabel63: TGMSStickyLabel;
    edtconnowyfq: TdxDBEdit;
    edtcarbrandwyfq: TdxDBEdit;
    dtdconloaddatewyfq: TdxDBDateEdit;
    timconloaddatewyfq: TdxDBTimeEdit;
    dtdcarrierdatewyfq: TdxDBDateEdit;
    timcarrierdatewyfq: TdxDBTimeEdit;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    edtvolume: TdxDBEdit;
    edtgrossweight: TdxDBEdit;
    dxDBButtonEdit2: TdxDBButtonEdit;
    dxDBButtonEdit1: TdxDBButtonEdit;
    connoitem: TdxDBGridColumn;
    customsnoout: TdxDBGridColumn;
    mitoutRF: TMenuItem;
    btncanclecheck: TKBitBtn;
    mitlocoutskuitem: TMenuItem;
    mitoutinselect: TMenuItem;
    ppmdha: TPopupMenu;
    mitckddha: TMenuItem;
    mitDetail_IN_F: TMenuItem;
    mitItem_IN_F: TMenuItem;
    ppmxt: TPopupMenu;
    mitxtckd: TMenuItem;
    ppmmt: TPopupMenu;
    MenuItem4: TMenuItem;
    mitice: TMenuItem;
    edtcarbrandds: TKinDbPickEdit;
    mitadjust: TMenuItem;
    mitcustomscc: TMenuItem;
    mitfzckmxd: TMenuItem;
    N4: TMenuItem;
    ppmjjhy: TPopupMenu;
    mitjjhyckd: TMenuItem;
    mitjgckd: TMenuItem;
    mitjgckplan: TMenuItem;
    mitBH: TMenuItem;
    mitQXBH: TMenuItem;
    theorderstate: TdxDBGridColumn;
    thebhstate: TdxDBGridColumn;
    printed: TdxDBGridColumn;
    routing: TdxDBGridColumn;
    destorder: TdxDBGridColumn;
    qhqd: TMenuItem;
    N16: TMenuItem;
    mitoutid: TMenuItem;
    outid: TdxDBGridColumn;
    plantable: TMenuItem;
    bbczqd: TMenuItem;
    addsku: TdxDBGridColumn;
    bhqd: TMenuItem;
    djkbhqd: TMenuItem;
    gjkbhqd: TMenuItem;
    wbhqd: TMenuItem;
    mitcancleout: TMenuItem;
    checkout: TMenuItem;
    procedure btnBrowMxClick(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btncopyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcMainChange(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdLocationOutDblClick(Sender: TObject);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtIUserButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure ShowHint(var HintStr: string; var CanShow: Boolean;
       var HintInfo: THintInfo);
    procedure mitAddLocationINOUTDetailClick(Sender: TObject);
    procedure mitDelLocationINOUTDetailClick(Sender: TObject);
    procedure mitSKUSelectClick(Sender: TObject);
    procedure mitOrderSKUSelectClick(Sender: TObject);
    procedure ckbContractClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure mitSplitClick(Sender: TObject);
    procedure mitDetail_INClick(Sender: TObject);
    procedure mitItem_INClick(Sender: TObject);
    procedure edtCostCusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtSNOEnter(Sender: TObject);
    procedure edtCost_SNOEnter(Sender: TObject);
    procedure edtCostCusEnter(Sender: TObject);
    procedure btnOperClick(Sender: TObject);
    procedure grdLocationOutCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure mitSkuDetailItemClick(Sender: TObject);
    procedure edtCostCusExit(Sender: TObject);
    procedure mitINCOWorkClick(Sender: TObject);
    procedure mitTotalDetailClick(Sender: TObject);
    procedure edtFC_PORTDCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_TRANSCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_PORTLCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dtdAccountBillNOExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtCustomsNOExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure mitOperationClick(Sender: TObject);
    procedure AccountNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdLocationOutItemDblClick(Sender: TObject);
    procedure grdLocationOutItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdLocationOutItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShippercusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure LocItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure loadgroupcusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure forkgroupcusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure liftmachinecusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ppmLocationINOUTItemPopup(Sender: TObject);
    procedure grdLocationOutDetailDblClick(Sender: TObject);
    procedure grdLocationOutDetailEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdLocationOutDetailEnter(Sender: TObject);
    procedure grdLocationOutDetailKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure LocNameDetailButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameDetailButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitRelocationClick(Sender: TObject);
    procedure edtPieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure PieceDetailValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitlocoutskudetailClick(Sender: TObject);
    procedure mitCostItemDXClick(Sender: TObject);
    procedure mitCheckOneClick(Sender: TObject);
    procedure mitCancelOneClick(Sender: TObject);
    procedure mitaccountClick(Sender: TObject);
    procedure btnCostClick(Sender: TObject);
    procedure mitAddLocItemClick(Sender: TObject);
    procedure QuantitytaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdLocationOutItemExit(Sender: TObject);
    procedure piecetaskItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdLocationOutItemEnter(Sender: TObject);
    procedure mitdelLocINItemClick(Sender: TObject);
    procedure grdLocationOutItemChangeNodeEx(Sender: TObject);
    procedure cmbConsignAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbConsignAccountIDExit(Sender: TObject);
    procedure cmbConsignAccountIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure cmbCarrierAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbCarrierAccountIDExit(Sender: TObject);
    procedure cmbCarrierAccountIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtOPIDExit(Sender: TObject);
    procedure edtOPIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtIUserExit(Sender: TObject);
    procedure edtIUserExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure SKUNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdLocationOutDetailExit(Sender: TObject);
    procedure pgcLocationINOUTChange(Sender: TObject);
    procedure grdLocationOutChangeNodeEx(Sender: TObject);
    procedure ppmdelPopup(Sender: TObject);
    procedure mitlocccCheckClick(Sender: TObject);
    procedure mitLocUnCheckClick(Sender: TObject);
    procedure grdcasingEnter(Sender: TObject);
    procedure mitCasingAddClick(Sender: TObject);
    procedure mitCasingDelClick(Sender: TObject);
    procedure grdcasingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdcasingExit(Sender: TObject);
    procedure PieceTaskCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure QualityNameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PriceInCasingValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure consigncusnameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShipperCusNameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure SkuNameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitCasingTaskedClick(Sender: TObject);
    procedure VolumeTaskCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitLocAdustClick(Sender: TObject);
    procedure mitLocToTransClick(Sender: TObject);
    procedure costcusidItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CostUOMTypeItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure priceItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure priceinIItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure VolumetaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure areataskItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grossweighttaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure netweighttaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure N13Click(Sender: TObject);
    procedure mitLIOoutClick(Sender: TObject);
    procedure mitItemLIInventoryClick(Sender: TObject);
    procedure mitDetailLIInventoryClick(Sender: TObject);
    procedure ShipcusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitTOConselClick(Sender: TObject);
    procedure mitCostdelClick(Sender: TObject);
    procedure mitCostAddClick(Sender: TObject);
    procedure grdAutoCostEnter(Sender: TObject);
    procedure grdAutoCostExit(Sender: TObject);
    procedure grdAutoCostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCostCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure loadgroupcusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure forkgroupcusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure liftmachinecusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure N3Click(Sender: TObject);
    procedure grdRateCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityTaskCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure AreaTaskCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure GrossWeightCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure NetWeightTaskCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure costuomtypecasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdcasingDblClick(Sender: TObject);
    procedure casing1taskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure casing2taskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure casing3taskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure casing4taskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure casing5taskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure btnCostRateClick(Sender: TObject);
    procedure mitAddAutoCostClick(Sender: TObject);
    procedure mitUpdAutoCostClick(Sender: TObject);
    procedure mitDelAutoCostClick(Sender: TObject);
    procedure grdAutoCostEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdIsMainRateCostChange(Sender: TObject);
    procedure carriageitemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure insuranceItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnAppendClick(Sender: TObject);
    procedure mitoutwareClick(Sender: TObject);
    procedure mitstockupClick(Sender: TObject);
    procedure tallycusiditemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure tallycusiditemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitfhzxdClick(Sender: TObject);
    procedure OPERATIONDATEDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure grdLocationOutDetailChangeNodeEx(Sender: TObject);
    procedure LocNameDetailValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitfzckdClick(Sender: TObject);
    procedure mitCheckManyClick(Sender: TObject);
    procedure mitCancelManyClick(Sender: TObject);
    procedure grdCountwayValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitGetAutoCountClick(Sender: TObject);
    procedure conscusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitTaskCheckClick(Sender: TObject);
    procedure mitConcelTaskClick(Sender: TObject);
    procedure mniItemTask_Order_OClick(Sender: TObject);
    procedure mitUpdateMainClick(Sender: TObject);
    procedure mitsalescountClick(Sender: TObject);
    procedure btnHSClick(Sender: TObject);
    procedure mitgetskucostClick(Sender: TObject);
    procedure mitcancelsalesClick(Sender: TObject);
    procedure mitxshwccdClick(Sender: TObject);
    procedure mitdelcountClick(Sender: TObject);
    procedure mitforkworkClick(Sender: TObject);
    procedure mitcusbillnoClick(Sender: TObject);
    procedure mitblnoClick(Sender: TObject);
    procedure mitforkworkunloadClick(Sender: TObject);
    procedure mitDocBookPicClick(Sender: TObject);
    procedure btnInClick(Sender: TObject);
    procedure mitinoutqueryClick(Sender: TObject);
    procedure mitcountczClick(Sender: TObject);
    procedure mitcancelcountczClick(Sender: TObject);
    procedure mitliooutmainorderClick(Sender: TObject);
    procedure mitpickinglistClick(Sender: TObject);
    procedure mitpickinglistrpClick(Sender: TObject);
    procedure mitpickinglistzdyClick(Sender: TObject);
    procedure mitoploadClick(Sender: TObject);
    procedure mitopunloadClick(Sender: TObject);
    procedure mitcustomsClick(Sender: TObject);
    procedure mitoutsendClick(Sender: TObject);
    procedure mitcostforkworkClick(Sender: TObject);
    procedure mitcanclecostClick(Sender: TObject);
    procedure btnapproveClick(Sender: TObject);
    procedure mitchecklookClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure ItemDetailEdit1Click(Sender: TObject);
    procedure mitworkitemClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure edtcusbillnoSearchExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure GrossWeightDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure NetWeightDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure pmCheckPopup(Sender: TObject);
	procedure mitOutsZClick(Sender: TObject);
    procedure quantityshortitemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure ppmPrintPopup(Sender: TObject);
    procedure timOperationDateDblClick(Sender: TObject);
    procedure mitoutRFClick(Sender: TObject);
    procedure mitlocoutskuitemClick(Sender: TObject);
    procedure mitoutinselectClick(Sender: TObject);
    procedure mitckddhaClick(Sender: TObject);
    procedure miticeClick(Sender: TObject);
    procedure mitadjustClick(Sender: TObject);
    procedure mitcustomsccClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure mitfzckmxdClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure mitjgckdClick(Sender: TObject);
    procedure mitjgckplanClick(Sender: TObject);
    procedure mitBHClick(Sender: TObject);
    procedure mitQXBHClick(Sender: TObject);
    procedure qhqdClick(Sender: TObject);
    procedure mitoutidClick(Sender: TObject);
    procedure plantableClick(Sender: TObject);
    procedure bbczqdClick(Sender: TObject);
    procedure mitcancleoutClick(Sender: TObject);
    procedure bhqdClick(Sender: TObject);
    procedure djkbhqdClick(Sender: TObject);
    procedure gjkbhqdClick(Sender: TObject);
    procedure wbhqdClick(Sender: TObject);
    procedure checkoutClick(Sender: TObject);
  private
    { Private declarations }
    //私有变量
    FindItem: TFindItem;               //查找
    mode:TDataState;                   //进入form状态模式
    strSql:string;                     //sql语句
    Bookmark: TBookmark;               //书签
    blnCopy:Boolean;                   //是否复制
    blnSaveError:Boolean;              //是否产生数据保存错误
    strFlow,                           //流程代码
    strInOut,                          //进出标志
    strJobno:string;                   //定位工作号
    arrInOut,arrLocationINOUT,         //用于数据复制
    arrLocationoutItem,arrlocationoutDetail,arrlocoutItemCasing:Variant;

    strDel_Task,strdel_detail:string;                       //任务,实际商品删除时从表控制
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    blnSkuOpen,blnCasingOpen:Boolean;           //判断是否曾经翻到过商品,打包信息页面
    blnAutoCost:Boolean;           //判断是否曾经翻到过计费页面
    blnqryOutChange:Boolean;           //判断是否要执行假主库移动的事件
    blnMainPage:Boolean;           //判断是否要执行主页面翻动事件
    blnItemPage:Boolean;         //判断是否要执行从库页面翻动事件
    blnCostRate:boolean;        //判断是否有费率树根

    qryWareOrderEdit,qryWareOrderSKU:TKADOQuery;  //
    strJobnoOrder:String;
    strGetCd:String;                   //商品输入时防止重复判别
    stroldLocationBillNO,stroldCustomsNO:string;       //老的仓单号
    CopyRentCountUOMType,CopyCostCountUOMType,
    CopyQuality:String;//用于任务商品新增默认
    iOutCostType:integer;              //应付费用属性(在按修改和页面翻动时确定)
                                       //            0   还未确定
                                       //            1   属于整柜
                                       //            2   属于散货
    delNetWeight,delArea,delVolume,delGrossWeight:Extended;
    delQuantity,delPiece:Extended;//用于实际商品明细输入多条记入时用
    blnTotaled:Boolean;//是否已经合计过
    blnBLJS:Boolean;//是否按比例计算
    strCostCountUOMType,               //装卸费类计费单位
    strRentCountUOMType,strRentCountUOMTypeout:string;        //仓租费类计费单位
    QuantityDetailOldValue,
    QuantityTaskOldValue,
    QuantityOldValue:extended;
    grdLocationOutDetailReadOnly,       //grd编辑控制
    grdLocationINOUTItemReadOnly:Boolean;
    copyloadgroupcusid,copyloadgroupcusname,          //装卸队复制
    copyforkgroupcusid,copyforkgroupcusname,
    copyliftmachinecusid,copyliftmachinecusname,
    copycusid,copycusname,
    CopyShippercusID,CopyShippercusName:String;//用于集装箱信息新增默认
    // Added by wql 2005-12-6 20:34:13
    copySkuwtv:Extended;     //用于轻重货标准

    blnSelect:Boolean;
    stroldCostcus:string;   //费用关系人按钮事件相关
    sltCostUomItem:TStringList;
    strcostuom:string;       //费用单位
    blnop:Boolean;
//用户日志
    strHistMessage:string;
    sltselect:TStringList;// 库存挑选过滤
    blnCopyAutoCost:Boolean;
    Present: TDateTime;
    blntotal:Boolean;//任务实际校验不同，是否合计到任务
    Year,Month,Day:word;
    strcusid,strcusname,strlocno:string;

    //二次校验参数
    blnScheck:Boolean;      //是否需要二次校验
    strFirstSkuid:string;  //第一次输入的商品代码
    extFirstNum:Extended; //第一次输入的数量（或是件数、净重）
    blnFirst:Boolean;  //是否是第一次输入
    Isyearctrl:string;
    strisyearctrl:string;
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    procedure InitValues;
    function  FindGetValue(pField:Integer;pItems,pItemFields:TStrings):boolean;
    function  FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    function  CheckModifyMode(pstrCallMode:string;pstrIsdel:boolean):Boolean;
    procedure CountSKUQuantity(var pqrySKU:TKADOQuery; OldValue:extended;pstrtype:string='DETAIL');
    procedure UpdateTransferInfo(strSender: string);
    function  CheckItemDetailInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer):Boolean;
    function  CheckItemTaskInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer;pBoolean:Boolean=True):Boolean;
    function  CompareTaskItem(pstrType:string):Boolean;
    procedure GetLocationSKU(thedate:TDateTime);
    procedure grdLocationINItemMenuItemOnClick(Sender: TObject);
    procedure grdLocationOutDetailBeforeInsert;
    procedure grdLocationOutItemBeforeInsert;
    procedure grdCasingBeforeinsert;
    procedure grdAutoCostBeforeInsert;
    procedure GetCasingSKU;
    procedure checknull;
    procedure GetCusCnfg;
    procedure CountSKUPiece(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    function skuoutcontrol:boolean;
    function GetLocationBillNO:String;
    function GetLocationBillNOin:String;
  public
    { Public declarations }
    DataState:TDataState;              //form状态
    maxLocationOutDetail,maxLocationOutItem,maxLocOutItemCasing,maxAutocountcost,maxdetailsno:integer;    //
    m_blnPost: Boolean;//在保存时是否要Post
    strHistDetailMessage:string; //用户日志
    blnChangeItem:boolean; //判断是否要执行ksp_locationoutitem
    blnChangeDetail:boolean; //判断是否要执行ksp_locationoutdetail
    strDel_skudetail:string; //库存相关,locskudetail删除记录
    strSysCus:string; //项目型客户个性化配置
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocationOut(CallMode:TDataState; pstrJobno,pstrFlow:string;
             pqryWareOrderEdit:TKADOQuery;pqryWareOrderSKU:TKADOQuery);

var
  frmLocationOut:TfrmLocationOut;

implementation

{$R *.dfm}
Uses Main,libUser,kindlg,Saveget,datas,datasSelect,datasTmp,GetDllPub,libuserPub,LocationSKUSelect,
     GetUserRight,LocationIN,WareOrderdxAll,LocCasingSelect,WareOrderSKUSelect,ActPrint,linprint,libbb,
     WareOrderInfset,Operation,Volume,WareRateView,LIOSKUDetail,stockup,SelLoc,LocOutSKUDetail,SS,UpDateMain,
     Locationbillno,GetLocation, forkwork, Inoutquery, CZCountDate,InPutlocin,outdetailzx,
     CZoutCount,CostItemDx, libRmBb,forkworknew,forkworkload,RFINtxt,locoutitemsku,outinselect,outprint;

var
    strpJobno:string;
    strCaption:string;

procedure WorkLocationOut(CallMode:TDataState; pstrJobno,pstrFlow:string;
             pqryWareOrderEdit:TKADOQuery;pqryWareOrderSKU:TKADOQuery);
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pstrFlow   :流程标志 ITEM 任务 DETAIL  实际
}
var
   Filtersql:string;
   year,month,day:word;
   month_start,month_end:TDate;
   strMenuItemName:string;
   StrDefFilterSql:string;
begin
  if pstrFlow='ITEM' then strCaption:='出仓管理--任务'
  else strCaption:='出仓管理--实际';
  if frmLocationOut <> nil then
  with frmLocationOut do
  begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
  end;
  if pstrflow='ITEM' then strMenuItemName:='mitLocationOuttask'
  else strMenuItemName:='mitLocationOutAct';
  frmLocationOut:=TfrmLocationOut.Create(application);
  strpJobno:=pstrJobno;
  with frmLocationOut do
  begin
     strSysCus:=getSysdata('cusname');
     if _sinotrans=True then
     begin
        mitLIOout.Visible:=False;
        N13.Visible:=False;
        mitoutware.Visible:=False;
        mitstockup.Visible:=False;
        mitfzckd.Visible:=False;
        mitfhzxd.Visible:=False;
        mitxshwccd.Visible:=False;
        mitinoutquery.Visible:=False;
        mitliooutmainorder.Visible:=False;
     end;

     if _general='T' then
     begin
        N13.Visible:=False;
        mitoutware.Visible:=False;
        mitstockup.Visible:=False;
        mitfzckd.Visible:=False;
        mitfhzxd.Visible:=False;
        mitxshwccd.Visible:=False;
        mitinoutquery.Visible:=False;
        mitliooutmainorder.Visible:=False;
        mitpickinglist.Visible:=False;
        mitpickinglistzdy.Visible:=False;
        mitoutsend.Visible:=False;
        mitpickinglistrp.Visible:=False;
     end;  
     if getSysdata('cchk')='T' then
        _DB_CheckSelf:='F';
     //二次校验 获取是否需要二次校验
     blnScheck:=getSysdata('scheck')='T';
     blnFirst:=True;

     if pstrFlow='DETAIL' then  ItemTaskEdit.Enabled:=false;
     blncostrate:=btnCostrate.enabled;
     m_blnPost:=true;
     blnCopy :=False;
     FindItem:= TFindItem.Create;
     sltCostUomItem:=TstringList.Create;
     sltselect:=TstringList.Create;
     blnSaveError:=False;
     mode    :=CallMode;
     strFlow :=pstrFlow;
     strJobno:=pstrJobno;
     FilterSql:='';
     ScrollAfterEdit:=True;
     blnSkuOpen:=False;
     blnAutoCost:=False;
     blnCasingOpen:=False;
     blnTotaled:=False;
     strJobnoOrder:='';
     delNetWeight:=0;
     delArea:=0;
     delVolume:=0;
     delQuantity:=0;
     delPiece:=0;
     delGrossWeight:=0;
     blnqryOutChange:=True;
     blnMainPage:=True;
     blnItemPage:=True;
//lzw20100623
     //blnop:=True;
     qryWareOrderEdit:=pqryWareOrderEdit;
     qryWareOrderSKU :=pqryWareOrderSKU;
     Application.OnShowHint := ShowHint;

     if _paper='T' then
     begin
        btnHS.Visible:=True;
        edtconno1.Visible:=True;
        edtcarbrand1.Visible:=True;
        edtconno.Visible:=False;
        edtcarbrand.Visible:=False;
        corpnoitem.Caption:='机台号';
        pieceproitem.Visible:=True;
        OpenSql(dataTmp.qryTmp,'  select Isyearctrl from UserOrg where userorgid="'+_userorgid+'" ');
        Isyearctrl:=dataTmp.qryTmp.fieldByname('Isyearctrl').AsString;
        if Isyearctrl='T' then
           strisyearctrl:=' and substring(convert(varchar(10),inout.taskdate,102),1,4)=substring(convert(varchar(10),getdate(),102),1,4) ';
     end else
     begin
        btnHS.Visible:=False;
        edtconno1.Visible:=False;
        edtcarbrand1.Visible:=False;
        edtconno.Visible:=True;
        edtcarbrand.Visible:=True;
        corpnoitem.Caption:='公司编号';
        pieceproitem.Visible:=False;
     end;
     if getSysdata('qdtext')='T' then
     begin
        btnPrint.PopupMenu:=ppmPrintqd;
        heightdetail.Visible:=True;
        mitoutRF.Visible:=True;
        mitadjust.Visible:=True;
     end;
     if (getSysdata('xytext')='T') then
     begin
        GMSStickyLabel32.Visible:=false;
        edtloacccheckname.Visible:=false;
     end;
     //lzw20091111
     if getSysdata('hxtext')='T' then
     begin
        btnPrint.PopupMenu:=ppmhxtext;
     end;
     if _manufacture='T' then
     begin
        GMSStickyLabel6.Caption :='供应商';
        GMSStickyLabel23.Caption:='供应商单号';
        GMSStickyLabel25.Caption :='计划员';
        GMSStickyLabel27.Caption :='发货地';
        ConditionDescItem.Caption :='存储容器';
        outzoneno.Caption :='工位';
        corpnoitem.Caption :='工程号';
     end ;

     if _StrSysCus='SWZ' then
     begin
        GMSStickyLabel25.Caption:='作业设备';
        GMSStickyLabel24.Caption:='作业时间从';
        GMSStickyLabel28.Caption:='作业时间到';
        GMSStickyLabel23.Caption:='车 皮 号';
        GMSStickyLabel33.Caption:='合 同 号';
        customernoItem.Caption:='商品产地';
        customernodetail.Caption:='商品产地';
        btnapprove.Visible:=True;
        GMSStickyLabel35.Caption:='身份证号';
        //lzw20100603
        mitforkwork.Visible:=True;
        mitforkworkunload.Visible:=True;
        mitopload.Visible:=True;
        mitopunload.Visible:=True;
        mitchecklook.Visible:=True;
        N14.Visible:=True;
        N15.Visible:=True;
        btncanclecheck.Visible:=True;
        mitCancelOne.Visible:=True;
        mitCancelMany.Visible:=True;
        mitcostforkwork.Visible:=True;
        mitcanclecost.Visible:=True;
        //lzw20100125
        skucostinDetail.Visible:=False;
        skucostinItem.Visible:=False;
        priceinDetail.Visible:=False;
        priceItem.Visible:=False;
        skucostDetail.Caption:='销售总额';
        skucostItem.Caption:='销售总额';
        priceDetail.Caption:='销售单价';
        priceItem.Caption:='销售单价';
        mitworkitem.Visible:=True;
     end;
     //lzw20100921
     if _StrSysCus='CF' then
     begin
        mitoutinselect.Visible:=True;
     end;
     //lzw20100812东海岸
     if _StrSysCus='DHA' then
     begin
        skucostDetail.Caption:='货值';
        skucostItem.Caption:='货值';
        priceDetail.Caption:='单价';
        priceItem.Caption:='单价';
        casing2Detail.Caption:='码头重量';
        casing2taskItem.Caption:='码头重量';
        casing2Item.Caption:='码头重量';
        casing1taskItem.Caption:='任务托盘数';
        casing1Item.Caption:='托盘数';
        casing1Detail.Caption:='托盘数';
        mitlocoutskuitem.Visible:=True;
        btnware.Visible:=False;
        ItemTaskEdit.Visible:=False;
        ItemDetailEdit.Visible:=False;
        btnIn.Visible:=False;
        btnCost.PopupMenuMark:=False;
        mitlocccCheck.Visible:=False;
        mitLocUnCheck.Visible:=False;
        mitUpdateMain.Visible:=False;
        //N8.Visible:=False;
        //N9.Visible:=False;
        mitGetAutoCount.Visible:=False;
        mitdelcount.Visible:=False;
        mitDocBookPic.Visible:=False;
        mitcustoms.Visible:=False;
        btnAppend.Visible:=False;
        btnPrint.PopupMenu:=ppmdha;
        mitSkuDetailItem.Visible:=False;
        mitINCOWork.Visible:=False;
        mitTotalDetail.Visible:=False;
        //edtcarbrandds.Visible:=False;
        edtcarbrand1.Visible:=true;
        //lzw20110419
        edtcarbrandds.Items.Clear;
        edtcarbrandds.ItemFields.Clear;
        OpenSql(datatmp.qryTmp, 'Select distinct conveno From locationinoutcon (nolock) '
                       +' where isnull(locationbillno,"")="" '
                       +' order by conveno');
        datatmp.qryTmp.First;
        while (not datatmp.qryTmp.Eof) do
        begin
          edtcarbrandds.Items.add(datatmp.qryTmp.Fieldbyname('conveno').asstring);
          edtcarbrandds.ItemFields.add(datatmp.qryTmp.Fieldbyname('conveno').asstring);
          datatmp.qryTmp.Next;
        end;
        datatmp.qryTmp.Close;
     end;
     //lihuiling 陆海金贸
     if _StrSysCus='LHJM' then
     begin
        GMSStickyLabel35.Caption:='身份证号';

     end;
     //lzw20111101嘉功
     if _StrSysCus='JG' then
     begin
        ckbstockup.Visible:=True;
        mitlocoutskuitem.Visible:=True;
        mitworkitem.Visible:=False;
        N13.Visible:=False;
        mitstockup.Visible:=False;
        mitfhzxd.Visible:=False;
        mitfzckd.Visible:=False;
        mitxshwccd.Visible:=False;
        mitinoutquery.Visible:=False;
        mitliooutmainorder.Visible:=False;
        mitpickinglist.Visible:=False;
        mitpickinglistrp.Visible:=False;
        mitoutsend.Visible:=False;
        mitOutsZ.Visible:=False;
        N4.Visible:=False;
        mitpickinglistzdy.Visible:=False;
        mitoutware.Visible:=False;
        mitLIOout.Visible:=False;
        mitjgckd.Visible:=True;
        mitjgckplan.Visible:=True;
        GMSStickyLabel25.Caption:='包装方式' ;
        GMSStickyLabel35.Caption:='目的地' ;
        mitBH.Visible:=True;
        mitQXBH.Visible:=True;
        mitoutid.Visible:=True;
        qhqd.Visible:=True;
        GMSStickyLabel29.Caption:='备货完成时间';//备货完成时间
        GMSStickyLabel23.Caption:='计费吨合计';
        plantable.Visible:=True;
        qhqd.Visible:=True;
        bbczqd.Visible:=True;
        bhqd.Visible:=True;
        djkbhqd.Visible:=True;
        gjkbhqd.Visible:=True;
        wbhqd.Visible:=True;
        checkout.Visible:=True;
     end;

     //lzw20101021闽台
     if _StrSysCus='MT' then
     begin
        mitlocoutskuitem.Visible:=True;
        btnware.Visible:=False;
        ItemTaskEdit.Visible:=False;
        ItemDetailEdit.Visible:=False;
        btnIn.Visible:=False;
        btnCost.PopupMenuMark:=False;
        mitlocccCheck.Visible:=False;
        mitLocUnCheck.Visible:=False;
        mitUpdateMain.Visible:=False;
        N8.Visible:=False;
        N9.Visible:=False;
        mitGetAutoCount.Visible:=False;
        mitdelcount.Visible:=False;
        mitDocBookPic.Visible:=False;
        mitcustoms.Visible:=False;
        btnAppend.Visible:=False;
        btnPrint.PopupMenu:=ppmmt;
        mitSkuDetailItem.Visible:=False;
        mitINCOWork.Visible:=False;
        mitTotalDetail.Visible:=False;
     end;
     //lzw20111017晋江环宇
     if _StrSysCus='JJHY' then
     begin
        mitlocoutskuitem.Visible:=True;
        btnware.Visible:=False;
        ItemTaskEdit.Visible:=False;
        ItemDetailEdit.Visible:=False;
        //btnIn.Visible:=False;
        btnCost.PopupMenuMark:=False;
        mitlocccCheck.Visible:=False;
        mitLocUnCheck.Visible:=False;
        mitUpdateMain.Visible:=False;
        N8.Visible:=False;
        N9.Visible:=False;
        mitGetAutoCount.Visible:=False;
        mitdelcount.Visible:=False;
        mitDocBookPic.Visible:=False;
        mitcustoms.Visible:=False;
        btnAppend.Visible:=False;
        btnPrint.PopupMenu:=ppmjjhy;
        mitSkuDetailItem.Visible:=False;
        mitINCOWork.Visible:=False;
        mitTotalDetail.Visible:=False;
        mitforkwork.Visible:=True;
        mitforkworkunload.Visible:=True;
        mitopload.Visible:=True;
        mitopunload.Visible:=True;
        mitchecklook.Visible:=True;
        N14.Visible:=True;
        N15.Visible:=True;
        btncanclecheck.Visible:=True;
        mitCancelOne.Visible:=True;
        mitCancelMany.Visible:=True;
        mitcostforkwork.Visible:=True;
        mitcanclecost.Visible:=True;
     end;
     //lzw20110615夏商物流
     if _StrSysCus='XSWL' then
     begin
        N13.Visible:=False;
        mitoutware.Visible:=False;
        mitstockup.Visible:=False;
        mitfhzxd.Visible:=False;
        mitfzckd.Visible:=False;
        mitinoutquery.Visible:=False;
        mitliooutmainorder.Visible:=False;
        mitpickinglist.Visible:=False;
        mitpickinglistzdy.Visible:=False;
        mitoutsend.Visible:=False;
        mitOutsZ.Visible:=False;

        mitlocoutskuitem.Visible:=True;
        btnware.Visible:=False;
        ItemTaskEdit.Visible:=False;
        ItemDetailEdit.Visible:=False;
        btnIn.Visible:=False;
        btnCost.PopupMenuMark:=False;
        mitlocccCheck.Visible:=False;
        mitLocUnCheck.Visible:=False;
        mitUpdateMain.Visible:=False;
        //N8.Visible:=False;
        //N9.Visible:=False;
        //mitGetAutoCount.Visible:=False;
        //mitdelcount.Visible:=False;
        mitDocBookPic.Visible:=False;
        mitcustoms.Visible:=False;
        btnAppend.Visible:=False;
        mitSkuDetailItem.Visible:=False;
        mitINCOWork.Visible:=False;
        mitTotalDetail.Visible:=False;
     end;

     if _StrSysCus='HQWL' then
     begin
        ckbTag.Caption:='是否回空';
     end;
//上海日陆配置
     if _StrSysCus='SHRL' then
     begin
        mainorderItem.Caption:='海关出库号';
        GMSStickyLabel18.Caption:='海关出库号';
        mainorder.Caption:='海关出库号';
//        corpnoitem.Caption:='瓶号';
        skumodelitem.Caption:='原产国';
        mainorderinItem.caption:='海关进库号';
        mitOper.Caption:='批量取得出货时间';

        casing1taskItem.Caption:='任务出库托盘数';
        casing1Item.Caption:='出库托盘数';
        casing1Detail.Caption:='出库托盘数';

        casing5taskItem.Caption:='任务库存托盘数扣减';
        casing5Item.Caption:='库存托盘数扣减';
        casing5Detail.Caption:='库存托盘数扣减';

        mitaccount.Visible:=False;
        mitcustomscc.Visible:=true;
        mitgetskucost.Visible:=False;
        mitsalescount.Visible:=False;
        mitcancelsales.Visible:=False;
        mitforkwork.Visible :=False;
        mitopload.Visible  :=False;
        mitopunload.Visible :=False;
        mitforkworkunload.Visible :=False;
        N14.Visible    :=False;
        N15.Visible  :=False;
        mitchecklook.Visible :=False;
        mitOutsZ.Visible :=False;
     end;

//苏州威扬
      if _strSysCus='SZWY' then
      begin
         corpnoitem.Caption:='托盘号';
         casing5taskItem.Caption:='任务托盘';
         casing5Item.Caption:='托盘';
         casing5Detail.Caption:='托盘';
         GMSStickyLabel22.Caption:='目的地';
         KGroupBox6.Visible:=True;
         KGroupBox2.Visible:=False;
         GMSStickyLabel2.Caption:='指示书番号';
      end;
     //lzw20101004
     if _strSysCus='XT' then
     begin
        KGroupBox6.Visible:=True;
        KGroupBox2.Visible:=False;
        btnPrint.PopupMenu:=ppmxt;
        btnapprove.Visible:=True;
        //lzw20101209
        mitlocoutskuitem.Visible:=True;
        btnware.Visible:=False;
        ItemTaskEdit.Visible:=False;
        ItemDetailEdit.Visible:=False;
        btnIn.Visible:=False;
        btnCost.PopupMenuMark:=False;
        mitlocccCheck.Visible:=False;
        mitLocUnCheck.Visible:=False;
        mitUpdateMain.Visible:=False;
        N8.Visible:=False;
        N9.Visible:=False;
        mitGetAutoCount.Visible:=False;
        mitdelcount.Visible:=False;
        mitDocBookPic.Visible:=False;
        mitcustoms.Visible:=False;
        btnAppend.Visible:=False;
        mitSkuDetailItem.Visible:=False;
        mitINCOWork.Visible:=False;
        mitTotalDetail.Visible:=False;
        mitfzckmxd.Visible:=True;
        btnapprove.caption:='整箱';
     end;

     //计费商品类
     InitdbPick(cmbSKUClass,'SKUCostClass','SKUCostClassCD','SKUCostClassName','1=1');
     //件数单位
     InitdbPick(QuantityUOMItem,'UOM','UOMName','UOMName','UOMType="件数"');
 //   Item单位初始化,,件数,外包,标签
     pieceuomItem.Items.Clear;
     uom1Item.Items.Clear;
     uom2Item.Items.Clear;
     uom3Item.Items.Clear;
     uom4Item.Items.Clear;
     uom5Item.Items.Clear;
     TagEachUOMItem.Items.Clear;
 //Detail单位初始化
     QuantityUOMDetail.Items.Clear;
     PieceUOMDetail.Items.Clear;
     uom1Detail.Items.Clear;
     uom2Detail.Items.Clear;
     uom3Detail.Items.Clear;
     uom4Detail.Items.Clear;
     uom5Detail.Items.Clear;
     tageachuomDetail.Items.Clear;
     pieceuomItem.Items.Assign(QuantityUOMItem.items);
     uom1Item.Items.Assign(QuantityUOMItem.items);
     uom2Item.Items.Assign(QuantityUOMItem.items);
     uom3Item.Items.Assign(QuantityUOMItem.items);
     uom4Item.Items.Assign(QuantityUOMItem.items);
     uom5Item.Items.Assign(QuantityUOMItem.items);
     TagEachUOMItem.Items.Assign(QuantityUOMItem.items);
     tageachuomDetail.Items.Assign(QuantityUOMItem.items);
     QuantityUOMDetail.Items.Assign(QuantityUOMItem.items);
     PieceUOMDetail.Items.Assign(QuantityUOMItem.items);
     uom1Detail.Items.Assign(QuantityUOMItem.items);
     uom2Detail.Items.Assign(QuantityUOMItem.items);
     uom3Detail.Items.Assign(QuantityUOMItem.items);
     uom4Detail.Items.Assign(QuantityUOMItem.items);
     uom5Detail.Items.Assign(QuantityUOMItem.items);
     QuantityUomCasing.Items.Assign(QuantityUOMItem.items);
     PieceUomCasing.Items.Assign(QuantityUOMItem.items);
     //体积单位
     InitdbPick(VolumeUOMItem,'UOM','UOMName','UOMName','UOMType="体积"');
     VolumeUOMDetail.Items.Clear;
     VolumeUOMDetail.items:=VolumeUOMItem.items;
     VolumeUOMcasing.items:=VolumeUOMItem.items;
     //重量单位
     InitdbPick(WeightUOMItem,'UOM','UOMName','UOMName','UOMType="重量"');
     WeightUOMDetail.Items.Clear;
     WeightUOMDetail.items:=WeightUOMItem.items;
     WeightUOMCasing.items:=WeightUOMItem.items;
     //面积单位
     InitdbPick(AreaUOMitem,'UOM','UOMName','UOMName','UOMType="面积"');
     AreaUOMDetail.Items.Clear;
     AreaUOMDetail.items:=AreaUOMitem.items;
     AreaUOMCasing.items:=AreaUOMitem.items;
     //计费
     InitdbPick(costquantityuomItem,'UOM','UOMName','UOMName','1=1');
     costquantityuomDetail.Items.Assign(costquantityuomItem.Items);

     //币种
     InitdbPick(currcdItem,'codelib','codename','codename','codeclass="00"');
     currcdDetail.items.clear;
     currcdDetail.items:=currcdItem.items;
     currcdCasing.items.clear;
     currcdCasing.items:=currcdItem.items;
     carriagecurrcdItem.Items:=currcdItem.Items;
     //仓租算法
     InitdbPick(cmbWareRentcountType,'codelib','codecd','codename','codeclass="18"');
     InitdbPick(cmbwarerentcounttypeout,'codelib','codecd','codename','codeclass="18"');
     //操作类型
     InitdbPick(cmbLoadCostType,'codelib','codename','codename','codeclass="19"');
     //仓租非仓租
     InitdbPick(rateuomtypeCost,'codelib','codecd','codename','codeclass="05"');
     rentcountuomtypeItem.Items.Clear;
     rentcountuomtypeItem.ItemFields.Clear;
     rentcountuomtypeItem.Items.Assign(rateuomtypeCost.Items);
     rentcountuomtypeItem.ItemFields.Assign(rateuomtypeCost.ItemFields);
     rentcountuomtypeoutItem.Items.Clear;
     rentcountuomtypeoutItem.ItemFields.Clear;
     rentcountuomtypeoutItem.Items.Assign(rateuomtypeCost.Items);
     rentcountuomtypeoutItem.ItemFields.Assign(rateuomtypeCost.ItemFields);

     CostUOMTypeItem.Items.Clear;
     CostUOMTypeItem.ItemFields.Clear;
     CostUOMTypeItem.Items.Assign(rateuomtypeCost.Items);
     CostUOMTypeItem.ItemFields.Assign(rateuomtypeCost.ItemFields);
     sltCostUomItem.Assign(rateuomtypeCost.Items);
     costuomtypeDetail.Items.Clear;
     costuomtypeDetail.ItemFields.Clear;
     costuomtypeDetail.Items.Assign(rateuomtypeCost.Items);
     costuomtypeDetail.ItemFields.Assign(rateuomtypeCost.ItemFields);

//     InitdbPick(costcountuomtypecasing,'codelib','codecd','codename','codeclass="05"');
     //费用项目
      InitdbPick(grdCostCDCost,'costcode','costcd',IIF(_Language='CAPTIONC','costname','costename'),'1=1');
      //船名
      InitdbPick(edtCarrierName,'vessel','vesselcd','vesselname','1=1');
      //费用关系指向人
      InitdbPick(grdCostCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');
      InitdbPick(grdRateCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');

      InitdbPick(cmbbusinesstype,'codelib','codecd','codename','codeclass="63"');

//      设置列头begin
      if strSysCus<>'SWZ' then
      begin
        priceinIItem.Caption    :=getSysdata('pricein',2,'1','采购单价');
        skucostinItem.Caption  :=getSysdata('costin',2,'1','采购总额');
        priceItem.Caption :=getSysdata('price',2,'1','销售单价');
        skucostItem.Caption:=getSysdata('skucost',2,'1','销售总额');
      end;
//      设置列头end


     //假主库过滤条件
//     if _Filter_CurMonth<>'F' then
//     begin

           //lzw20120104
            decodedate(date,year,month,day);
     if _strsyscus='LHJM' THEN
     BEGIN
        opensql(datatmp.qryTmp,'select yf=(DateAdd(Month,-1,GETDATE()))');
        decodedate(datatmp.qryTmp.FieldByName('yf').asdatetime,year,month,day);
        Month_Start:=encodedate(year,month,1);
        Month_End  :=IncMonth(Month_Start,2);
     end else
     if  _strsyscus='JG'  then
     begin
 //       Month_Start:=encodedate(year,month,1)-31;
        decodedate(date,year,month,day);
        Month_Start:=encodedate(year,month-1,1);
        Month_End  :=IncMonth(Month_Start,2)-1;
     end else
     begin
        decodedate(date,year,month,day);
        Month_Start:=encodedate(year,month,1);
        Month_End  :=IncMonth(Month_Start,1)-1;
     end;

     //lzw20100623
     blnop:=True;
{     end else
     begin
        Month_Start:=date-_Filter_LessDate;
        Month_End  :=date+_Filter_MoreDate;
     end;}
     if trim(strJobno)='' then
     begin
           FilterSql:=' (convert(datetime,convert(char(8),Inout.TaskDate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),Inout.TaskDate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('12');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('计划日期          大于等于      '+datetostr(Month_Start));
           Field.Add('12');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('计划日期          小于等于      '+datetostr(Month_End));
        end;
     end else FilterSql:='';
     if _Loginid<>'SYSTEM' then
     SetButtonEnabled(ToolPanel,strMenuItemName,trim(_userorgid));//设置按钮的有效性
// Modified by cyh 2008.07.09 8:49:16
{     if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then
     begin
        FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                  +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")';
     end else }
   {  if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) and(_strSysCus<>'JG') then
     begin
        FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                  +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")'
                                                  +'and (inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'")' ;
        blnop:=False;
     end ;   }
     // Modified by lihl 2012.03.01
    if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then
    begin
       FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                  +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")';
    end else
    if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) then
    begin
       FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                  +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")'
                                                  +'and (inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'")' ;
        blnop:=False;
    end;


     //初始化qry
     StrDefFilterSql:=GetdefFilter(IIF(strFlow='ITEM','出仓任务','出仓实际'));
     if (StrDefFilterSql<>'') and (trim(strJobno)='') then
        FilterSql:= StrDefFilterSql;
     _qrymacroout:=iif(FilterSql<>'',FilterSql,' 1=1');
     _qrymacroout:=_qrymacroout+strisyearctrl;

     data.InitLocatinOut(strFlow,strJobno);
     SetMasterDetailState(false);
     if mode=stInsert then
     begin
        if not btnAdd.Enabled then
        begin
           {if _Language='CAPTIONC' then _strmessage:='您无权新增任务资料！'
           else _strmessage:='您无权新增任务资料！'; }
           KMessageDlg(GetMessage('frmLocationOut','001'),mtWarning,[mbOK],0);
           Close;
           Exit;
        end;
//        SetControlState(stBrowse,true);
        data.qryOut.open;
        btnAdd.Click;
     end else
     begin
//        SetControlState(stBrowse,true);
        data.qryOut.open;
        if strJobno<>''
        then data.qryOut.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
        WorkCall(stBrowse);
     end;

     {激活FORM}
     if (strJobno<>'') and (_StrSysCus<>'JG') then
     begin
        Top := Top +100;
        ShowModal;
        Free;
     end else Show;
  end;

end;

procedure TfrmLocationOut.CreateParams(var Params: TCreateParams);
begin
   if strpJobno<>'' then
   begin
      self.Formstyle := fsNormal;
      self.Visible := False;
      self.Position := poScreenCenter;
   end;
   self.Caption:=strCaption;
   inherited CreateParams(Params);
end;

procedure TfrmLocationOut.WorkCall(CallMode:TDataState);
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
             grdLocationOut.ClearSelection;
             if data.qryOut.fieldbyname('jobno').AsString<>'' then
                grdLocationOut.FindNodeByKeyValue(data.qryOut.fieldbyname('jobno').AsString).Selected:=true;

          end;
        stEdit:
          begin
             data.qryOut.Edit;
             EnableEdit;
             data.qryLocationOut.Edit;
             strjobnoorder:='';
             CopyRentCountUOMType:='';
             CopyCostCountUOMType:='';
             CopyQuality:='';
             copycusID  :='';
             copycusName:='';
             CopyShippercusID  :='';
             CopyShipperCusName:='';
             CopyRentCountUOMType:='';
             CopyCostCountUOMType:='';
             CopyQuality:='';
             // Added by wql 2005-12-6 20:19:26
             copySkuwtv:=0;

             iOutCostType:=0;
             strDel_Task:='';
             strdel_detail:='';
             strDel_skudetail:='';
             sltselect.Clear;
             blntotal:=false;
             strCostCountUOMType:='';
             strRentCountUOMType:='';
             strRentCountUOMTypeout:='';

             //在修改的状态下，对data.qryLocationOutDetail循环
             //为了控制库存 ,创建临时表，用于保存原始状态的工作号
             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldDetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldDetail'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldDetail '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoin          smallint     not null , '+chr(13)+chr(10)
                                   +'       ldsnoin        smallint     not null '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );
             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldItemWBKNCF") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldItemWBKNCF'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldItemWBKNCF '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoin          smallint     not null , '+chr(13)+chr(10)
                                   +'       jobnoorder        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoorder          smallint     not null  '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );
             if _isCasing='T' then
                ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                      +'    where id=object_id("tempdb..#lskOldCasing") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                      +'     drop table #lskOldCasing'+chr(13)+chr(10)
                                      +'   CREATE TABLE #lskOldCasing '+chr(13)+chr(10)
                                      +'     ( '+chr(13)+chr(10)
                                      +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                      +'       snoin          smallint     not null '+chr(13)+chr(10)
                                      +'      ) '+chr(13)+chr(10)
                                       );
             data.qryLocationOutDetail.DisableControls;
             Bookmark:= data.qryLocationOutDetail.GetBookmark;
             maxLocationOutDetail:=0;
             data.qryLocationOutDetail.Filtered:=False;
             data.qryLocationOutDetail.First;
             while not data.qryLocationOutDetail.Eof do
             begin
                //为了控制库存 ,原始状态的工作号
                ExecSql(dataTmp.qryTmp,'  insert into #lskOldDetail '+chr(13)+chr(10)
                                      +'     (jobnoin,snoin,ldsnoin) '+chr(13)+chr(10)
                                      +'   values (       '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutDetail.FieldByName('jobnoin').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutDetail.FieldByName('snoin').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutDetail.FieldByName('ldsnoin').AsString +'"  '+chr(13)+chr(10)
                                      +'     ) ');
                if data.qryLocationOutDetail.FieldByName('ldsno').AsInteger>maxLocationOutDetail
                then maxLocationOutDetail:=data.qryLocationOutDetail.FieldByName('ldsno').AsInteger;
                data.qryLocationOutDetail.Next;
             end;
             data.qryLocationOutDetail.Filtered:=True;
             data.qryLocationOutDetail.GotoBookmark(Bookmark);
             data.qryLocationOutDetail.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryLocationOutDetail.EnableControls;
             data.qryLocationOutItem.DisableControls;
             Bookmark:= data.qryLocationOutItem.GetBookmark;
             maxLocationOutItem:=0;
             data.qryLocationOutItem.First;
             while not data.qryLocationOutItem.Eof do
             begin
                //为了控制库存 ,原始状态的工作号
                ExecSql(dataTmp.qryTmp,'  insert into #lskOldItemWBKNCF '+chr(13)+chr(10)
                                      +'     (jobnoin,snoin,jobnoorder,snoorder) '+chr(13)+chr(10)
                                      +'   values (       '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutItem.FieldByName('jobnoin').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutItem.FieldByName('snoin').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutItem.FieldByName('jobnoorder').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationOutItem.FieldByName('snoorder').AsString +'"  '+chr(13)+chr(10)
                                      +'     ) ');
                if data.qryLocationOutItem.FieldByName('SNO').AsInteger>maxLocationOutItem
                then maxLocationOutItem:=data.qryLocationOutItem.FieldByName('SNO').AsInteger;
                //判断是否是散货方式
                if (data.qryLocationOutItem.FieldByName('loadgroupcusid').AsString<>'')
                  or (data.qryLocationOutItem.FieldByName('forkgroupcusid').AsString<>'')
                  or (data.qryLocationOutItem.FieldByName('forkgroupcusname').AsString<>'') then
                    iOutCostType:=2;
                data.qryLocationOutItem.Next;
             end;
             data.qryLocationOutItem.GotoBookmark(Bookmark);
             data.qryLocationOutItem.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryLocationOutItem.EnableControls;
             //打包信息
             if _isCasing='T' then
             begin
                data.qryLocOutItemCasing.DisableControls;
                Bookmark:= data.qryLocOutItemCasing.GetBookmark;
                maxLocOutItemCasing:=0;
                data.qryLocOutItemCasing.First;
                while not data.qryLocOutItemCasing.Eof do
                begin
                  //为了控制库存 ,原始状态的工作号
                  ExecSql(dataTmp.qryTmp,'  insert into #lskOldcasing '+chr(13)+chr(10)
                                        +'     (jobnoin,snoin) '+chr(13)+chr(10)
                                        +'   values (       '+chr(13)+chr(10)
                                        +'"'+data.qryLocOutItemCasing.FieldByName('jobnoin').AsString +'",  '+chr(13)+chr(10)
                                        +'"'+data.qryLocOutItemCasing.FieldByName('snoin').AsString +'"  '+chr(13)+chr(10)
                                        +'     ) ');
                  if data.qryLocOutItemCasing.FieldByName('SNO').AsInteger>maxLocOutItemCasing
                  then maxLocOutItemCasing:=data.qryLocOutItemCasing.FieldByName('SNO').AsInteger;
                  data.qryLocOutItemCasing.Next;
               end;
               data.qryLocOutItemCasing.GotoBookmark(Bookmark);
               data.qryLocOutItemCasing.FreeBookmark(Bookmark);
               bookMark:=nil;
               data.qryLocOutItemCasing.EnableControls;
             end;
             data.qryautocountcostout.DisableControls;
             Bookmark:= data.qryautocountcostout.GetBookmark;
             maxAutocountcost:=0;
             data.qryautocountcostout.First;
             while not data.qryautocountcostout.Eof do
             begin
               if data.qryautocountcostout.FieldByName('sno').AsInteger>maxAutocountcost
               then maxAutocountcost:=data.qryautocountcostout.FieldByName('sno').AsInteger;
               data.qryautocountcostout.Next;
             end;
             data.qryautocountcostout.GotoBookmark(Bookmark);
             data.qryautocountcostout.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryautocountcostout.EnableControls;

             LampChange(lsEdit);
          end;
        stInsert:
          begin
             //为了控制库存 ,原始状态的工作号
//whl 放在存储过程里处理了
             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldDetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldDetail'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldDetail '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoin          smallint     not null , '+chr(13)+chr(10)
                                   +'       ldsnoin        smallint     not null '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );
             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldItemWBKNCF") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldItemWBKNCF'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldItemWBKNCF '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoin          smallint     not null , '+chr(13)+chr(10)
                                   +'       jobnoorder        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoorder          smallint     not null  '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );
             if _isCasing='T' then
                ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                      +'    where id=object_id("tempdb..#lskOldCasing") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                      +'     drop table #lskOldCasing'+chr(13)+chr(10)
                                      +'   CREATE TABLE #lskOldCasing '+chr(13)+chr(10)
                                      +'     ( '+chr(13)+chr(10)
                                      +'       jobnoin        varchar(20)  not null , '+chr(13)+chr(10)
                                      +'       snoin          smallint     not null '+chr(13)+chr(10)
                                      +'      ) '+chr(13)+chr(10)
                                       );     
//             SetDetailActive(False,False);//whl
             SetMasterDetailState(false);
             data.qryOut.Append;
             SetDetailActive(False,True);//whl
             //赋初值
             strDel_Task:='';
             strdel_detail:='';
             strDel_skudetail:='';
             sltselect.Clear;
             maxLocationOutDetail:=0;
             maxLocOutItemCasing:=0;
             maxAutocountcost:=0;
             _maxgridnoout:=0;
             CopyRentCountUOMType:='';
             CopyCostCountUOMType:='';
             CopyQuality:='';
             iOutCostType:=0;
             strCostCountUOMType:='';
             strRentCountUOMType:='';
             strRentCountUOMTypeout:='';
             strjobnoorder:='';

             copycusID  :='';
             copycusName:='';
             CopyShippercusID  :='';
             CopyShipperCusName:='';
             CopyRentCountUOMType:='';
             CopyCostCountUOMType:='';
             CopyQuality:='';
             // Added by wql 2005-12-6 20:19:26
             copySkuwtv:=0;
             InitValues;
             EnableEdit;
             //记录档案创建信息
             data.qryLocationOut.Edit;
             data.qryLocationOut.FieldByName('createname').Asstring:=_LoginName;
             data.qryLocationOut.fieldByname('CreateDate').AsDatetime:=GetServerDate;
             data.qryOut.Edit;
             data.qryout.FieldByName('jobno').AsString:=data.qrylocationout.fieldbyname('jobno').AsString;
             LampChange(lsEdit);
          end;
      end;
   end;
end;

procedure TfrmLocationOut.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
  setDisable:TsetInt;
begin
   setDisable:=[];
   libComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
   SetControlState(DataState,False);
   stroldLocationBillNO:=data.qryLocationOut.FieldByName('LocationBillNO').Asstring;
   stroldCustomsNO:=data.qryLocationOut.FieldByName('CustomsNO').Asstring;
   //lzw20091110
   if getSysdata('hxtext')='T' then
   begin
      ckbTariff.Enabled:=False;
      ckbTag.Enabled:=False;
      ckbContract.Enabled:=False;
      ckbWO_CountWith1.Enabled:=False;
      ckbLocation.Enabled:=False;
      ckbstockup.Enabled:=False;
      ckbLotsCode.Enabled:=False;
      ckbistrade.Enabled:=False;
      ckbCountRent.Enabled:=False;
      ckbcountrentout.Enabled:=False;
      cmbWareRentcountType.Enabled:=False;
      cmbwarerentcounttypeout.Enabled:=False;
      cmbbusinesstype.Enabled:=False;
   end;
   grdLocationOutItem.OptionsBehavior:=grdLocationOutItem.OptionsBehavior+[edgoEditing];
   grdLocationOutItem.OptionsDB:=grdLocationOutItem.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdLocationOutItem.ShowGroupPanel:=False;
   grdLocationOutItem.ClearGroupColumns;
   grdLocationOutItem.Filter.Active:=False;
   if _strsyscus='JG' then
      grdLocationOutItem.OptionsBehavior:=grdLocationOutItem.OptionsBehavior-[edgoMultiSelect];

   grdLocationOutDetail.OptionsBehavior:=grdLocationOutItem.OptionsBehavior+[edgoEditing];
   grdLocationOutDetail.OptionsDB:=grdLocationOutItem.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdLocationOutDetail.ShowGroupPanel:=False;
   grdLocationOutDetail.ClearGroupColumns;
   grdLocationOutDetail.Filter.Active:=False;

   grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior+[edgoEditing];
   grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdAutoCost.ShowGroupPanel:=False;
   grdAutoCost.ClearGroupColumns;

   grdLocationOutItem.OptionsView:=grdLocationOutItem.OptionsView-[edgorowselect] ;
   grdLocationOutDetail.OptionsView:=grdLocationOutDetail.OptionsView-[edgorowselect];

   strHistDetailMessage:='';
   strHistMessage  :='';

   blnChangeItem:=False;
   blnChangeDetail:=False;
   InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
end;

procedure TfrmLocationOut.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   if data.qryOut.fieldbyname('Jobno').asstring='' then setDisable:=setDisable+[2,4];
   libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
   if data.qryOut.fieldbyname('Jobno').asstring='' then setDisable:=setDisable-[2,4];
   SetControlState(DataState,False);

   grdLocationOutItem.OptionsBehavior:=grdLocationOutItem.OptionsBehavior-[edgoEditing];
   grdLocationOutItem.OptionsDB:=grdLocationOutItem.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdLocationOutItem.ShowGroupPanel:=True;
   grdLocationOutDetail.OptionsBehavior:=grdLocationOutItem.OptionsBehavior-[edgoEditing];
   grdLocationOutDetail.OptionsDB:=grdLocationOutItem.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdLocationOutDetail.ShowGroupPanel:=True;
   if _strsyscus='JG' then
      grdLocationOutItem.OptionsBehavior:=grdLocationOutItem.OptionsBehavior+[edgoMultiSelect];

   grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior-[edgoEditing];
   grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdAutoCost.ShowGroupPanel:=True;

   grdLocationOutItem.OptionsView:=grdLocationOutItem.OptionsView+[edgorowselect] ;
   grdLocationOutDetail.OptionsView:=grdLocationOutDetail.OptionsView+[edgorowselect];
end;

procedure TfrmLocationOut.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

function TfrmLocationOut.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   QuantityTotalDetail, PieceTotalDetail:Extended;
   VolumeTotalDetail, AreaTotalDetail, NetWeightTotalDetail, GrossWeightTotalDetail:Extended;
   casing1TotalDetail, casing2TotalDetail, casing3TotalDetail, casing4TotalDetail,casing5TotalDetail:Extended;
   costquantityTotalDetail:Extended;   //计费数量
   strLocID,strLocName,strshippercusname,strcusname:string;
   sltAutoCost:TStringList;//判断计费条条目重复记录
   strNO:string;
   strcostcd,strcostratetype,strsql1,strmainorder:string;
   strBH,StrWBH:string;
begin
   Result:=False;
   sltAutoCost:=TStringList.Create;
   if dtdAccountBillNO.Text<>'' then
   begin
      OpenSql(dataTmp.qryTmp,' select num=count(1) from locationout (nolock) '
                            +'  where jobno<>"'+data.qrylocationout.Fieldbyname('jobno').AsString+'"  '
                            +'    and costcusid="'+data.qrylocationout.Fieldbyname('costcusid').AsString+'" '
                            +'    and iuserid="'+data.qrylocationout.Fieldbyname('iuserid').AsString+'" '
                            +'    and cusbillno="'+dtdAccountBillNO.Text+'"  ');
      if dataTmp.qryTmp.FieldByName('num').AsInteger<>0 then
      begin
         if KmessageDlg('存在相同的客户单号，您确认要保存吗',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      end;
   end;

   if dtdTaskDate.Date=0 then
   begin
      {if _Language='CAPTIONC' then _strmessage:='计划日期不能为空，必须填写'
      else _strmessage:='**************'; }
      KMessageDlg(GetMessage('frmLocationOut','002'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end else//任务时不判断
   if (dtdTaskDate.Text>dtdOperationDate.Text)
      and (data.qrylocationout.FieldByName('operationname').AsString<>'') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='计划日期不能迟于上架日期！'
      else _strmessage:='计划日期不能迟于上架日期！'; }
      KMessageDlg(GetMessage('frmLocationOUT','080'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end else
   if (getSysdata('qdtext')='T') and (dtdAccountBillNO.Text='')  then
   begin
      KMessageDlg('客户单号不能为空',mtWarning,[mbOK],0);
      dtdAccountBillNO.SetFocus;
      Exit;
   end else
   if edtIUser.Text='' then
   begin
      ActiveControl:=edtIUser;
      {if _Language='CAPTIONC' then _strmessage:='执行部门不能为空，必须填写'
      else _strmessage:='**************'; }
      KMessageDlg(GetMessage('frmLocationOut','003'),mtWarning,[mbOK],0);
      Exit;
   end else
      //lzw20110419
   {if (edtcarbrandds.Text='') and (_strsyscus='DHA') then
   begin
      ActiveControl:=edtcarbrandds;
      KMessageDlg('车牌号不能为空',mtWarning,[mbOK],0);
      Exit;
   end else }
   if cmbSKUClass.Text='' then
   begin
      ActiveControl:=cmbSKUClass;
      {if _Language='CAPTIONC' then _strmessage:='商品类，必须填写！'
      else _strmessage:='**************'; }
      KMessageDlg(GetMessage('frmLocationOut','004'),mtWarning,[mbOK],0);
      Exit;
   end else
   if cmbWareRentcountType.Text='' then
   begin
     pgcLocationINOUT.ActivePage:=tbsInfo;
     ActiveControl:=cmbWareRentcountType;
     {if _Language='CAPTIONC'then
        _strmessage:='仓租计算方式不能为空，必须填写'
     else
        _strmessage:='';}
     KmessageDlg(GetMessage('frmLocationOut','005'),mtWarning,[mbOK],0);
     exit;
   end else
   if edtCostCus.Text='' then
   begin
      ActiveControl:=edtCostCus;
     { if _Language='CAPTIONC' then _strmessage:='费用关系人不能为空，必须填写！'
      else _strmessage:='**************';  }
      KMessageDlg(GetMessage('frmLocationOut','006'),mtWarning,[mbOK],0);
      Exit;
   end else          //批次控制
   if (_isneedop<>'F') and (edtOPID.Text='') then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=edtOPID;
      KMessageDlg('业务员不能为空！',mtWarning,[mbOK],0);
      Exit;
   end else
   if (cmbwarerentcounttypeout.Text='') and (ckbcountrentout.Checked) then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=cmbwarerentcounttypeout;
      KMessageDlg('应付仓租计算方式不能为空！',mtWarning,[mbOK],0);
      Exit;
   end else
   if (cmbLoadCostType.Text='') and (_paper='T') then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=cmbLoadCostType;
      {if _Language='CAPTIONC' then _strmessage:='执行部门不能为空，必须填写'
      else _strmessage:='执行部门不能为空，必须填写'; }
      KMessageDlg('操作类型不能为空！',mtWarning,[mbOK],0);
      Exit;
   end else
   if (data.qrylocationout.fieldbyname('lottracked').asstring='T')
   and (data.qrylocationoutItem.fieldbyname('LotCode').asstring='') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='批次不能为空!'
      else _strmessage:='**************'; }
      KMessageDlg(GetMessage('frmLocationOut','007'),mtWarning,[mbOK],0);
      if pgcLocationINOUT.activepage<>tbsSKU
      then pgcLocationINOUT.activepage:=tbsSKU;
      grdLocationoutItem.setfocus;
      data.qrylocationoutItem.enablecontrols;
      exit;
   end;
   strshippercusname:='';
   strcusname:='';
   strmainorder:='';
   data.qryLocationout.Edit;
   data.qryLocationout.FieldByName('taskiscomplete').AsString:='T';

   data.qryLocOutItemCasing.DisableControls;
   data.qrylocationoutDetail.DisableControls;
   data.qrylocationoutItem.DisableControls;

   data.qrylocationoutdetail.Filtered:=false;
   if data.qrylocationoutDetail.IsEmpty  then
   begin
      data.qryLocationout.FieldByName('operationdate').Clear;
      data.qryLocationout.FieldByName('operationname').AsString:='';
      data.qryLocationout.FieldByName('taskiscomplete').AsString:='F';
   end;
   checknull;
   data.qrylocationoutDetail.Filtered:=true;
   if _isCasing='T' then
   begin
      data.qryLocOutItemCasing.First;
      while not data.qryLocOutItemCasing.Eof do
      begin
         data.qryLocOutItemCasing.Edit;
         data.qryLocOutItemCasing.fieldbyname('operationtype').asInteger :=-1;
         data.qryLocOutItemCasing.FieldByName('taskdate').AsDateTime:=data.qryLocationout.FieldByName('taskdate').AsDateTime;
         data.qryLocOutItemCasing.FieldByName('userid').AsString:=data.qryLocationout.FieldByName('userid').AsString;
         data.qryLocOutItemCasing.FieldByName('username').AsString:=data.qryLocationout.FieldByName('username').AsString;
         data.qryLocOutItemCasing.FieldByName('iuserid').AsString:=data.qryLocationout.FieldByName('iuserid').AsString;
         data.qryLocOutItemCasing.FieldByName('iusername').AsString:=data.qryLocationout.FieldByName('iusername').AsString;
         data.qryLocOutItemCasing.fieldbyname('mainorder').asstring:=data.qryLocationout.fieldbyname('mainorder').asstring;
         data.qryLocOutItemCasing.fieldbyname('WareRentCountType').asstring:=data.qryLocationout.fieldbyname('WareRentCountType').asstring;
         data.qryLocOutItemCasing.fieldbyname('WareRentCountTypeout').asstring:=data.qryLocationout.fieldbyname('WareRentCountTypeout').asstring;
         data.qryLocOutItemCasing.fieldbyname('countrent').asstring:=data.qryLocationout.fieldbyname('countrent').asstring;
         data.qryLocOutItemCasing.fieldbyname('countrentout').asstring:=data.qryLocationout.fieldbyname('countrentout').asstring;
         data.qryLocOutItemCasing.fieldbyname('countcontcost').asstring:=data.qryLocationout.fieldbyname('countcontcost').asstring;
         data.qryLocOutItemCasing.fieldbyname('LotTracked').asstring:=data.qryLocationout.fieldbyname('LotTracked').asstring;
         data.qryLocOutItemCasing.fieldbyname('TagEach').asstring:=data.qryLocationout.fieldbyname('TagEach').asstring;
         data.qryLocOutItemCasing.fieldbyname('CONTWITHLOCA').asstring:=data.qryLocationout.fieldbyname('CONTWITHLOCA').asstring;
         data.qryLocOutItemCasing.fieldbyname('loadcostone').asstring:=data.qryLocationout.fieldbyname('loadcostone').asstring;
         data.qryLocOutItemCasing.fieldbyname('Cusbillno').asstring:=data.qryLocationout.fieldbyname('Cusbillno').asstring;

         data.qryLocOutItemCasing.Next;
      end;
   end;
   strBH:='0';
   StrWBH:='0';
   data.qrylocationoutItem.first;
   while not data.qrylocationoutItem.eof do
   begin
//判断与主库信息是否一致
      if not (
      //heckItemTaskInfo('LotTracked','按批次',0,-2) and
      CheckItemTaskInfo('TagEach','按标签管理',0,-2) and
      CheckItemTaskInfo('isbond','保税',0,-2) and
      //CheckItemTaskInfo('CountRent','计算仓租',0,-2) and
      CheckItemTaskInfo('CountContCost','包干',0,-2) and
      CheckItemTaskInfo('WareRentCountType','仓租计算方式',0,-2,False) ) then
      begin
        if pgcLocationINOUT.activepage<>tbsSKU
        then pgcLocationINOUT.activepage:=tbsSKU;
        grdLocationOutItem.setfocus;
        data.qrylocationoutItem.enablecontrols;
        data.qrylocationoutDetail.enablecontrols;
        data.qryLocOutItemCasing.EnableControls;
        exit;
      end;

      //继承主库信息
      data.qrylocationoutItem.Edit;
      strmainorder:=strmainorder+','+data.qrylocationoutItem.fieldbyname('mainorder').AsString;
      data.qryLocationOutitem.fieldbyname('OPERATIONTYPE').asInteger :=-1;
      data.qryLocationOutitem.fieldbyname('userid').AsString   :=data.qryLocationOut.fieldbyname('userid').AsString;
      data.qryLocationOutitem.fieldbyname('username').AsString :=data.qryLocationOut.fieldbyname('username').AsString;
      data.qrylocationoutItem.fieldbyname('TaskDate').asDateTime :=data.qrylocationout.fieldbyname('TaskDate').asDateTime;
      data.qrylocationoutItem.fieldbyname('iuserid').asstring    :=data.qrylocationout.fieldbyname('iuserid').asstring;
      data.qrylocationoutItem.fieldbyname('iusername').asstring  :=data.qrylocationout.fieldbyname('iusername').asstring;
      if (_paper<>'T') and (strSysCus<>'SZWY') and (strSysCus<>'SHRL') then
         data.qrylocationoutItem.fieldbyname('corpno').asstring     :=data.qrylocationout.fieldbyname('corpno').asstring;
      data.qrylocationoutItem.fieldbyname('Customsno').asstring  :=data.qrylocationout.fieldbyname('Customsno').asstring;
      data.qrylocationoutItem.fieldbyname('LocationBillno').asstring:=data.qrylocationout.fieldbyname('LocationBillno').asstring;
      if getSysdata('warerent')<>'T' then
         data.qrylocationoutItem.fieldbyname('WareRentCountType').asstring:=data.qrylocationout.fieldbyname('WareRentCountType').asstring;
      data.qrylocationoutItem.fieldbyname('costcusidout').asstring  :=data.qrylocationout.fieldbyname('costcusidout').asstring;
      data.qrylocationoutItem.fieldbyname('costcusnameout').asstring:=data.qrylocationout.fieldbyname('costcusnameout').asstring;
      data.qrylocationoutItem.fieldbyname('WareRentCountTypeout').asstring:=data.qrylocationout.fieldbyname('WareRentCountTypeout').asstring;
      data.qrylocationoutItem.fieldbyname('OperationDate').AsString  :=data.qrylocationout.fieldbyname('OperationDate').AsString;
      data.qrylocationoutItem.fieldbyname('operationname').asString    :=data.qrylocationout.fieldbyname('operationname').asString;
      data.qrylocationoutItem.fieldbyname('isbond').asstring     :=data.qrylocationout.fieldbyname('isbond').asstring;
      data.qrylocationoutitem.fieldbyname('countrent').asstring  :=data.qrylocationout.fieldbyname('countrent').asstring;
      data.qrylocationoutitem.fieldbyname('countrentout').asstring  :=data.qrylocationout.fieldbyname('countrentout').asstring;
      data.qrylocationoutitem.fieldbyname('countcontcost').asstring:=data.qrylocationout.fieldbyname('countcontcost').asstring;
      data.qrylocationoutItem.fieldbyname('LotTracked').asstring   :=data.qrylocationout.fieldbyname('LotTracked').asstring;
      data.qrylocationoutItem.fieldbyname('TagEach').asstring      :=data.qrylocationout.fieldbyname('TagEach').asstring;
      data.qrylocationoutItem.fieldbyname('contwithloca').asstring :=data.qrylocationout.fieldbyname('CONTWITHLOCA').asstring;
      data.qrylocationoutItem.fieldbyname('loadcostone').asstring :=data.qrylocationout.fieldbyname('loadcostone').asstring;
      data.qrylocationoutItem.fieldbyname('cusbillno').asstring :=data.qrylocationout.fieldbyname('cusbillno').asstring;
      if (strSysCus<>'SZWY') and (data.qrylocationout.fieldbyname('mainorder').asstring<>'')  then
         data.qrylocationoutItem.fieldbyname('mainorder').asstring :=data.qrylocationout.fieldbyname('mainorder').asstring;
      if _StrSysCus='SHRL' then
         data.qrylocationoutItem.fieldbyname('NotFullSign').asstring :='F';

      if data.qrylocationoutItem.fieldbyname('NotFullSign').asstring ='T' then
         strBH:='1'
      else
         strWBH:='1';

      if (data.qrylocationout.fieldbyname('TagEach').asstring<>'T') then
      begin
        data.qrylocationoutItem.fieldbyname('TagEachUOM').asstring:='';
        data.qrylocationoutItem.fieldbyname('TagTotal').asInteger:=0;
      end;
      QuantityTotalDetail   :=0;
      PieceTotalDetail      :=0;
      VolumeTotalDetail     :=0;
      AreaTotalDetail       :=0;
      NetWeightTotalDetail  :=0;
      GrossWeightTotalDetail:=0;
      casing1TotalDetail    :=0;
      casing2TotalDetail    :=0;
      casing3TotalDetail    :=0;
      casing4TotalDetail    :=0;
      casing5TotalDetail    :=0;
      costquantityTotalDetail:=0;   //计费数量

      if (strFlow='DETAIL') and (data.qrylocationout.fieldbyname('ISTRADE').asstring='T') then
      begin
         OpenSql(dataTmp.qryTmp,'select costcd from costcode where costname="信用证"');
         strsql1:=dataTmp.qryTmp.fieldbyname('costcd').AsString ;
         OpenSql(dataTmp.qryTmp1,'select costitem.iocost     '+chr(13)+chr(10)
                                +'  from costitem(nolock),locationinitem (nolock) ,locationoutitem (nolock)           '+chr(13)+chr(10)
                                +' where locationinitem.jobno=locationoutitem.jobnoinf   '+chr(13)+chr(10)
                                +'   and locationinitem.jobno=costitem.jobno           '+chr(13)+chr(10)
                                +'   and locationoutitem.jobno="'+data.qrylocationout.fieldbyname('jobno').AsString+'"                 '+chr(13)+chr(10)
                                +'   and costitem.costcd="'+strsql1+'" '+chr(13)+chr(10)
                                 );
         dataTmp.qryTmp1.First;
         while not dataTmp.qryTmp1.Eof do
         begin
            if dataTmp.qryTmp1.FieldByName('iocost').AsFloat<>0 then
            begin
               strcostcd:=getSysdata('bondcost');
               if _costtype then
               begin
                  OpenSql(dataTmp.qryTmp,'ksp_Nobondtrade @jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" ,'
                                        +'             @costcd="'+strcostcd+'" '
                                );
               end else
               begin
                  OpenSql(dataTmp.qryTmp,'ksp_Nobondtradevolume @jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" ,'
                                        +'                   @costcd="'+strcostcd+'"        '
                                );
               end;
               dataTmp.qryTmp.First;
               while not dataTmp.qryTmp.Eof do
               begin
                  if (dataTmp.qryTmp.FieldByName('rate').AsFloat>1) and
                     (data.qrylocationout.FieldByName('costcheckname').AsString='') then
                  begin
                     KMessageDlg('实收金额小余该笔业务金额,不能出货！',mtInformation,[mbOk],0);
                     Exit;
                  end;
                  dataTmp.qryTmp.Next;
               end;
            end else
            begin
               KMessageDlg('该笔业务未收款!,不能出货！',mtInformation,[mbOk],0);
               Exit;
            end;
            dataTmp.qryTmp1.Next;
         end;
      end;

      if ((strFlow='ITEM') and (data.qrylocationout.fieldbyname('operationname').asstring<>'')
         or (strFlow='DETAIL')) then   //上架商品
      begin
         grdLocationOutItemChangeNodeEx(nil);
         strLocID:='-1';
         strLocName:='-1';
         data.qrylocationoutDetail.first;
         while not data.qrylocationoutDetail.eof do
         begin
            {if _Language='CAPTIONC' then _strmessage:='该笔仓位资料出货日期比该单出货日期晚3天，是否保存?'
            else _strmessage:='该笔仓位资料出货日期比该单出货日期晚3天，是否保存?'; }
{            if (data.qrylocationoutDetail.fieldbyname('OperationDate').asDateTime>(data.qrylocationout.fieldbyname('OperationDate').asDateTime+3))
              and (KmessageDlg(GetMessage('frmLocationOut','008'),mtConfirmation,[mbYes,mbNo],0)<>mryes) then
            begin
               if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
               grdLocationoutDetail.setfocus;
               data.qrylocationoutDetail.enablecontrols;
               data.qrylocationoutItem.enablecontrols;
               data.qryLocOutItemCasing.EnableControls;
               exit;
            end;    }
            data.qrylocationoutDetail.Edit;
            data.qrylocationoutDetail.fieldbyname('jobno').asstring          :=data.qrylocationout.fieldbyname('jobno').asstring;
            data.qrylocationoutDetail.fieldbyname('OPERATIONTYPE').asInteger :=-1;
            if (_paper='T') or (_StrSysCus='SHRL') then
               data.qrylocationoutDetail.fieldbyname('corpno').asstring         :=data.qrylocationoutItem.fieldbyname('corpno').asstring
            else
               data.qrylocationoutDetail.fieldbyname('corpno').asstring         :=data.qrylocationout.fieldbyname('corpno').asstring;
            data.qrylocationoutDetail.fieldbyname('customsno').asstring      :=data.qrylocationout.fieldbyname('customsno').asstring;
            data.qrylocationoutDetail.fieldbyname('locationbillno').asstring :=data.qrylocationout.fieldbyname('locationbillno').asstring;
            data.qrylocationoutDetail.fieldbyname('cusbillno').asstring      :=data.qrylocationout.fieldbyname('cusbillno').asstring;
            data.qrylocationoutDetail.fieldbyname('TaskDate').asDateTime     :=data.qrylocationout.fieldbyname('TaskDate').asDateTime;
            data.qrylocationoutDetail.fieldbyname('userid').asstring         :=data.qrylocationout.fieldbyname('userid').asstring;
            data.qrylocationoutDetail.fieldbyname('username').asstring       :=data.qrylocationout.fieldbyname('username').asstring;
            data.qrylocationoutDetail.fieldbyname('iuserid').asstring        :=data.qrylocationout.fieldbyname('iuserid').asstring;
            data.qrylocationoutDetail.fieldbyname('iusername').asstring      :=data.qrylocationout.fieldbyname('iusername').asstring;
            data.qrylocationoutDetail.fieldbyname('locationbillnoin').asstring:=data.qryLocationOutItem.Fieldbyname('locationbillnoin').AsString;
            data.qrylocationoutDetail.fieldbyname('customsnoin').asstring     :=data.qryLocationOutItem.Fieldbyname('customsnoin').AsString;
            data.qrylocationoutDetail.fieldbyname('cusbillnoin').asstring     :=data.qryLocationOutItem.Fieldbyname('cusbillnoin').AsString;
            data.qrylocationoutDetail.fieldbyname('countrentout').asstring    :=data.qryLocationOutItem.fieldbyname('countrentout').asstring;
            data.qrylocationoutDetail.fieldbyname('mainorderin').asstring     :=data.qryLocationOutItem.Fieldbyname('mainorderin').AsString;
            data.qrylocationoutDetail.fieldbyname('mainorder').asstring     :=data.qryLocationOutItem.Fieldbyname('mainorder').AsString;
            data.qrylocationoutDetail.fieldbyname('costcusid').asstring       :=data.qryLocationOutItem.fieldbyname('costcusid').asstring;
            data.qrylocationoutDetail.fieldbyname('costcusname').asstring     :=data.qryLocationOutItem.fieldbyname('costcusname').asstring;
            data.qrylocationoutDetail.fieldbyname('costcusidout').asstring    :=data.qryLocationOutItem.fieldbyname('costcusidout').asstring;
            data.qrylocationoutDetail.fieldbyname('costcusnameout').asstring  :=data.qryLocationOutItem.fieldbyname('costcusnameout').asstring;
            data.qrylocationoutDetail.fieldbyname('cusid').asstring           :=data.qryLocationOutItem.Fieldbyname('cusid').AsString;
            data.qrylocationoutDetail.fieldbyname('cusname').asstring         :=data.qryLocationOutItem.Fieldbyname('cusname').AsString;
            data.qrylocationoutDetail.fieldbyname('shippercusid').asstring    :=data.qryLocationOutItem.Fieldbyname('shippercusid').AsString;
            data.qrylocationoutDetail.fieldbyname('shippercusname').asstring  :=data.qryLocationOutItem.Fieldbyname('shippercusname').AsString;
            data.qrylocationoutDetail.fieldbyname('shipcusid').asstring       :=data.qryLocationOutItem.Fieldbyname('shipcusid').AsString;
            data.qrylocationoutDetail.fieldbyname('shipcusname').asstring     :=data.qryLocationOutItem.Fieldbyname('shipcusname').AsString;
            data.qrylocationoutDetail.fieldbyname('lottracked').asstring      :=data.qryLocationOutItem.Fieldbyname('lottracked').AsString;
            data.qrylocationoutDetail.fieldbyname('contwithloca').asstring    :=data.qryLocationOutItem.Fieldbyname('contwithloca').AsString;
            data.qrylocationoutDetail.fieldbyname('isbond').asstring          :=data.qryLocationOutItem.Fieldbyname('isbond').AsString;
            data.qrylocationoutDetail.fieldbyname('countrent').asstring       :=data.qryLocationOutItem.Fieldbyname('countrent').AsString;
            data.qrylocationoutDetail.fieldbyname('countrentout').asstring       :=data.qryLocationOutItem.Fieldbyname('countrentout').AsString;
            data.qrylocationoutDetail.fieldbyname('countcontcost').asstring   :=data.qryLocationOutItem.Fieldbyname('countcontcost').AsString;
            data.qrylocationoutDetail.fieldbyname('warerentcounttypeout').asstring  :=data.qrylocationout.fieldbyname('warerentcounttypeout').asstring;
            data.qrylocationoutDetail.fieldbyname('warerentcounttype').asstring     :=data.qryLocationOutItem.Fieldbyname('warerentcounttype').AsString;
            data.qrylocationoutDetail.fieldbyname('jobnoorder').asstring            :=data.qryLocationOutItem.Fieldbyname('jobnoorder').AsString;
            data.qrylocationoutDetail.fieldbyname('snoorder').asstring              :=data.qryLocationOutItem.Fieldbyname('snoorder').AsString;
            data.qrylocationoutDetail.fieldbyname('loadgroupcusid').asstring        :=data.qryLocationOutItem.Fieldbyname('loadgroupcusid').AsString;
            data.qrylocationoutDetail.fieldbyname('loadgroupcusname').asstring      :=data.qryLocationOutItem.Fieldbyname('loadgroupcusname').AsString;
            data.qrylocationoutDetail.fieldbyname('forkgroupcusid').asstring        :=data.qryLocationOutItem.Fieldbyname('forkgroupcusid').AsString;
            data.qrylocationoutDetail.fieldbyname('forkgroupcusname').asstring      :=data.qryLocationOutItem.Fieldbyname('forkgroupcusname').AsString;
            data.qrylocationoutDetail.fieldbyname('liftmachinecusid').asstring      :=data.qryLocationOutItem.Fieldbyname('liftmachinecusid').AsString;
            data.qrylocationoutDetail.fieldbyname('liftmachinecusname').asstring    :=data.qryLocationOutItem.Fieldbyname('liftmachinecusname').AsString;
            if _StrSysCus='SHRL' then
               data.qrylocationOutDetail.fieldbyname('NotFullSign').asstring :='F';
            //威扬
            if _StrSysCus='SZWY' then
            data.qrylocationoutDetail.fieldbyname('quantityshort').AsInteger    :=data.qryLocationOutItem.Fieldbyname('quantityshort').AsInteger;

            if getSysdata('qdtext')='T' then
               data.qrylocationoutDetail.fieldbyname('operationdate').asstring    :=data.qryLocationOutItem.Fieldbyname('operationdate').AsString;
            if getSysdata('notlot')<>'T' then //系统参数中控制不校验实际与任务的批次号
            begin
               if not (CheckItemDetailInfo('LotCode','批次',0,-1)) then
   //               CheckItemDetailInfo('TagEachUOM','标签单位',0,-1) and
   //               CheckItemDetailInfo('PieceUOM','件数单位',0,-1) and
   //               CheckItemDetailInfo('VolumeUOM','体积单位',0,-1) and
   //               CheckItemDetailInfo('AreaUOM','面积单位',0,-1) and
   //               CheckItemDetailInfo('WeightUOM','重量单位',0,-1) and
   //               CheckItemDetailInfo('LotTracked','按批次',0,-2) and
   //               CheckItemDetailInfo('TagEach','按标签管理',0,-2) and
   //               CheckItemDetailInfo('isbond','保税',0,-2)) then
   //               CheckItemDetailInfo('COUNTRENT','计算仓租',0,-2) and
   //               CheckItemDetailInfo('COUNTCONTCOST','包干',0,-2) and
   //               CheckItemDetailInfo('WareRentCountType','仓租计算方式',0,-2) ) then
               begin
                 if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
                 data.qrylocationoutItem.enablecontrols;
                 data.qrylocationoutDetail.enablecontrols;
                 data.qryLocOutItemCasing.EnableControls;
                 grdLocationOutDetail.setfocus;
                 exit;
               end;
            end;
              //仓位信息只有一条时,继承仓位信息
            if strLocID='-1' then
            begin
               strLocID  :=data.qrylocationoutDetail.fieldbyname('locid').asString;
               strLocName:=data.qrylocationoutDetail.fieldbyname('LocName').asString;
            end else
            begin
               strLocID  :='';
               strLocName:='';
            end;
            QuantityTotalDetail   :=QuantityTotalDetail+data.qrylocationoutDetail.fieldbyname('Quantity').AsFloat;
            PieceTotalDetail      :=PieceTotalDetail+data.qrylocationoutDetail.fieldbyname('Piece').AsFloat;
            VolumeTotalDetail     :=VolumeTotalDetail+data.qrylocationoutDetail.fieldbyname('Volume').asfloat;
            AreaTotalDetail       :=AreaTotalDetail+data.qrylocationoutDetail.fieldbyname('Area').asfloat;
            NetWeightTotalDetail  :=NetWeightTotalDetail+data.qrylocationoutDetail.fieldbyname('NetWeight').asfloat;
            GrossWeightTotalDetail:=GrossWeightTotalDetail+data.qrylocationoutDetail.fieldbyname('GrossWeight').asfloat;

            casing1TotalDetail     :=casing1TotalDetail+data.qrylocationoutDetail.fieldbyname('casing1').AsFloat;
            casing2TotalDetail     :=casing2TotalDetail+data.qrylocationoutDetail.fieldbyname('casing2').AsFloat;
            casing3TotalDetail     :=casing3TotalDetail+data.qrylocationoutDetail.fieldbyname('casing3').asfloat;
            casing4TotalDetail     :=casing4TotalDetail+data.qrylocationoutDetail.fieldbyname('casing4').asfloat;
            casing5TotalDetail     :=casing5TotalDetail+data.qrylocationoutDetail.fieldbyname('casing5').asfloat;
            costquantityTotalDetail:=costquantityTotalDetail+data.qrylocationoutDetail.fieldbyname('costquantity').asfloat;   //计费数量
            if data.qryLocOutSkudetail.Active then
            begin
               grdLocationOutDetailChangeNodeEx(nil);
               data.qryLocOutSkudetail.First;
               while not data.qryLocOutSkudetail.Eof do
               begin
                  data.qryLocOutSkudetail.Edit;
                  data.qryLocOutSkudetail.FieldByName('operationdate').AsDateTime
                                                :=data.qrylocationoutDetail.FieldByName('operationdate').AsDateTime;
                  data.qryLocOutSkudetail.FieldByName('iuserid').AsString
                                                :=data.qrylocationout.FieldByName('iuserid').AsString;
                  data.qryLocOutSkudetail.FieldByName('iusername').AsString
                                                :=data.qrylocationout.FieldByName('iusername').AsString;
                  data.qryLocOutSkudetail.Next;
               end;
            end;
            data.qrylocationoutDetail.Next;
         end;
         if data.qrylocationoutItem.fieldbyName('locid').asstring='' then
         begin
            data.qrylocationoutItem.fieldbyName('locid').asstring  :=IIF(strLocID='-1','',strLocID);
            data.qrylocationoutItem.fieldbyName('locname').asstring:=IIF(strLocName='-1','',strLocName);
         end;
         if data.qryLocationoutDetail.IsEmpty then
         begin
            data.qryLocationout.FieldByName('taskiscomplete').AsString:='F';
         end
{         else if data.qrylocationoutItem.fieldbyName('locid').asstring='' then
         begin
            if _Language='CAPTIONC' then _strmessage:='仓位不能为空!'
            else _strmessage:='仓位不能为空';
            KMessageDlg(_strmessage,mtWarning,[mbOK],0);
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            grdLocationOutItem.SetFocus;
            data.qrylocationoutdetail.enablecontrols;
            data.qrylocationoutItem.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            exit;
         end};
      end;
      //当实际数不等于任务数时自动更改任务数＝实际数
      if getSysdata('qdtext')='T' then
      begin
      //仓位商品数量合计
         if (QuantityTotalDetail-data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('实际数量不能大于任务数量',mtWarning,[mbOK],0);
            exit;
         end else
         if (PieceTotalDetail-data.qrylocationoutItem.fieldbyName('piecetask').AsFloat>0.00001)then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('实际件数不能大于任务件数',mtWarning,[mbOK],0);
            exit;
         end else
          if (GrossWeightTotalDetail-data.qrylocationoutItem.fieldbyName('grossweighttask').AsFloat>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('实际毛重不能大于任务毛重',mtWarning,[mbOK],0);
            exit;
         end else
         if (NetWeightTotalDetail-data.qrylocationoutItem.fieldbyName('netweighttask').AsFloat>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('实际净重不能大于任务净重',mtWarning,[mbOK],0);
            exit;
         end else
         if (VolumeTotalDetail-data.qrylocationoutItem.fieldbyName('volumetask').AsFloat>0.00001)then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('实际体积不能大于任务体积',mtWarning,[mbOK],0);
            exit;
         end else
         if (data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat=QuantityTotalDetail)
            and (Abs(data.qrylocationoutItem.fieldbyName('Piecetask').AsFloat-PieceTotalDetail)>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('任务数量与实际数量相同，任务件数与实际件数不同，请更改!',mtWarning,[mbOK],0);
            exit;
         end else
         if (data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat=QuantityTotalDetail)
            and (Abs(data.qrylocationoutItem.fieldbyName('Volumetask').AsFloat-VolumeTotalDetail)>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('任务数量与实际数量相同，任务体积与实际体积不同，请更改!',mtWarning,[mbOK],0);
            exit;
         end else
         if (data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat=QuantityTotalDetail)
            and (Abs(data.qrylocationoutItem.fieldbyName('NetWeighttask').AsFloat-NetWeightTotalDetail)>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('任务数量与实际数量相同，任务净重与实际净重不同，请更改!',mtWarning,[mbOK],0);
            exit;
         end else
         if (data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat=QuantityTotalDetail)
            and (Abs(data.qrylocationoutItem.fieldbyName('GrossWeighttask').AsFloat-GrossWeightTotalDetail)>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('任务数量与实际数量相同，任务毛重与实际毛重不同，请更改!',mtWarning,[mbOK],0);
            exit;
         end else
         if (data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat=QuantityTotalDetail)
            and (Abs(data.qrylocationoutItem.fieldbyName('areatask').AsFloat-AreaTotalDetail)>0.00001) then
         begin
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            data.qrylocationoutItem.enablecontrols;
            data.qrylocationoutDetail.enablecontrols;
            data.qryLocOutItemCasing.EnableControls;
            grdLocationOutDetail.setfocus;
            KMessageDlg('任务数量与实际数量相同，任务面积与实际面积不同，请更改!',mtWarning,[mbOK],0);
            exit;
         end;
      end else
      begin
         if _StrSysCus='JG' then
         begin
            if not(CheckItemDetailInfo('Quantity','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的数量',QuantityTotalDetail,2) and
                  CheckItemDetailInfo('Piece','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的件数',PieceTotalDetail,2) and
                  CheckItemDetailInfo('Volume','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的体积',VolumeTotalDetail,2) and
                  CheckItemDetailInfo('Area','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的面积',AreaTotalDetail,2) and
                  CheckItemDetailInfo('NetWeight','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的净重',NetWeightTotalDetail,2) and
                  CheckItemDetailInfo('GrossWeight','任务序号：'+data.qrylocationoutItem.fieldbyName('sno').Asstring+'的毛重',GrossWeightTotalDetail,2)
                  //lzw20101202and
                  //CheckItemDetailInfo('costquantity','计费量',costquantityTotalDetail,2)
                  ) then
            begin
               if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
               data.qrylocationoutItem.enablecontrols;
               data.qrylocationoutDetail.enablecontrols;
               data.qryLocOutItemCasing.EnableControls;
               grdLocationOutDetail.setfocus;
               exit;
            end;
         end else
         begin
            if not(CheckItemDetailInfo('Quantity','数量',QuantityTotalDetail,2) and
                  CheckItemDetailInfo('Piece','件数',PieceTotalDetail,2) and
                  CheckItemDetailInfo('Volume','体积',VolumeTotalDetail,2) and
                  CheckItemDetailInfo('Area','面积',AreaTotalDetail,2) and
                  CheckItemDetailInfo('NetWeight','净重',NetWeightTotalDetail,2) and
                  CheckItemDetailInfo('GrossWeight','毛重',GrossWeightTotalDetail,2)
                  //lzw20101202and
                  //CheckItemDetailInfo('costquantity','计费量',costquantityTotalDetail,2)
                  ) then
            begin
               if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
               data.qrylocationoutItem.enablecontrols;
               data.qrylocationoutDetail.enablecontrols;
               data.qryLocOutItemCasing.EnableControls;
               grdLocationOutDetail.setfocus;
               exit;
            end;
         end
      end;

      data.qrylocationoutItem.fieldbyName('Quantity').AsFloat     :=QuantityTotalDetail;
      data.qrylocationoutItem.fieldbyName('Piece').AsFloat        :=PieceTotalDetail;
      if _StrSysCus<>'SZWY' then
      begin
         data.qrylocationoutItem.fieldbyName('Volume').AsFloat       :=VolumeTotalDetail;
         data.qrylocationoutItem.fieldbyName('GrossWeight').AsFloat  :=GrossWeightTotalDetail;
      end else
      begin
         if data.qrylocationoutItem.fieldbyName('GrossWeight').AsFloat=0 then
            data.qrylocationoutItem.fieldbyName('GrossWeight').AsFloat  :=GrossWeightTotalDetail;
         if data.qrylocationoutItem.fieldbyName('Volume').AsFloat=0 then
            data.qrylocationoutItem.fieldbyName('Volume').AsFloat  :=GrossWeightTotalDetail;
      end;
      data.qrylocationoutItem.fieldbyName('NetWeight').AsFloat    :=NetWeightTotalDetail;
      data.qrylocationoutItem.fieldbyName('area').AsFloat         :=AreaTotalDetail;

      data.qrylocationoutItem.fieldbyName('casing1').AsFloat       :=casing1TotalDetail;
      data.qrylocationoutItem.fieldbyName('casing2').AsFloat       :=casing2TotalDetail;
      data.qrylocationoutItem.fieldbyName('casing3').AsFloat       :=casing3TotalDetail;
      data.qrylocationoutItem.fieldbyName('casing4').AsFloat       :=casing4TotalDetail;
      data.qrylocationoutItem.fieldbyName('casing5').AsFloat       :=casing5TotalDetail;
      data.qrylocationoutItem.fieldbyName('costquantity').AsFloat  :=costquantityTotalDetail;

      if data.qrylocationout.FieldByName('operationname').AsString<>'' then
      begin
         data.qrylocationoutItem.fieldbyName('Quantitytask').AsFloat     :=QuantityTotalDetail;
         data.qrylocationoutItem.fieldbyName('Piecetask').AsFloat        :=PieceTotalDetail;
         data.qrylocationoutItem.fieldbyName('Volumetask').AsFloat       :=VolumeTotalDetail;
         data.qrylocationoutItem.fieldbyName('NetWeighttask').AsFloat    :=NetWeightTotalDetail;
         data.qrylocationoutItem.fieldbyName('GrossWeighttask').AsFloat  :=GrossWeightTotalDetail;
         data.qrylocationoutItem.fieldbyName('areatask').AsFloat         :=AreaTotalDetail;
         data.qrylocationoutItem.fieldbyName('costquantitytask').AsFloat :=costquantityTotalDetail;
      end;
      if Pos(data.qrylocationoutItem.fieldbyname('shippercusname').AsString,strshippercusname)=0 then
         strshippercusname:=strshippercusname+data.qrylocationoutItem.fieldbyname('shippercusname').AsString+' ';
      if Pos(data.qrylocationoutItem.fieldbyname('cusname').AsString,strcusname)=0 then
         strcusname:=strcusname+data.qrylocationoutItem.fieldbyname('cusname').AsString+' ';
      data.qrylocationoutItem.Next;
   end;
   data.qrylocationoutItem.First;
   data.qrylocationoutItem.EnableControls;
   data.qrylocationoutDetail.EnableControls;
   data.qryLocOutItemCasing.EnableControls;

   if (strWBH='1') and (strBH='1') then
      data.qrylocationout.fieldbyname('bhstate').asstring:='1'
   else
   if (strWBH='0') and (strBH='1') then
      data.qrylocationout.fieldbyname('bhstate').asstring:='2'
   else
      data.qrylocationout.fieldbyname('bhstate').asstring:='0';


   sltAutoCost.clear;
   strNo:='';
   data.qryautocountcostout.DisableControls;
   data.qryautocountcostout.First;
   while not data.qryautocountcostout.Eof do
   begin
      {if sltAutoCost.IndexOf(data.qryautocountcostout.fieldbyname('costcd').asstring
                      +data.qryautocountcostout.fieldbyname('isincome').asstring
                      +data.qryautocountcostout.fieldbyname('ismainrate').asstring
                      +data.qryautocountcostout.fieldbyname('costcusid').asstring
                      +data.qryautocountcostout.fieldbyname('costcusname').asstring
                      +data.qryautocountcostout.fieldbyname('ratecusid').asstring
                      +data.qryautocountcostout.fieldbyname('ratecusname').asstring
                      +data.qryautocountcostout.fieldbyname('ratecus').asstring
                      +data.qryautocountcostout.fieldbyname('costcus').asstring
                      +data.qryautocountcostout.fieldbyname('rateuomtype').asstring
                      +data.qryautocountcostout.FieldByName('countway').AsString)<>-1 then
      strNo:=strNO+data.qryautocountcostout.fieldbyname('sno').asstring+','
      else
         sltAutoCost.Add(data.qryautocountcostout.fieldbyname('costcd').asstring
                         +data.qryautocountcostout.fieldbyname('isincome').asstring
                         +data.qryautocountcostout.fieldbyname('ismainrate').asstring
                         +data.qryautocountcostout.fieldbyname('costcusid').asstring
                         +data.qryautocountcostout.fieldbyname('costcusname').asstring
                         +data.qryautocountcostout.fieldbyname('ratecusid').asstring
                         +data.qryautocountcostout.fieldbyname('ratecusname').asstring
                         +data.qryautocountcostout.fieldbyname('ratecus').asstring
                         +data.qryautocountcostout.fieldbyname('costcus').asstring
                         +data.qryautocountcostout.fieldbyname('rateuomtype').asstring
                         +data.qryautocountcostout.FieldByName('countway').AsString
                         );  }
     data.qryautocountcostout.Next;
   end;
   data.qryautocountcostout.First;
   data.qryautocountcostout.EnableControls;
   if strNO<>'' then
   begin
      if KmessageDlg('NO.'+strNO+GetMessage('TW','001'),mtConfirmation,[mbYes,mbNo],0)<>mryes then //'是重复计费条目，是否保存?'
      Exit;
   end;

    //判断LocationBillNO是否有重复
   opensql(datatmp.qryTmp,'select LBNOnum=count(1)'
                 +'  from LocationOut '
                 +' where LocationBillNO="'+data.qrylocationout.FieldByName('LocationBillNO').Asstring+'"'
                 +'   and jobno<>"'+data.qrylocationout.FieldByName('jobno').Asstring+'"'
                 );
   if datatmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0 then
   begin
      KMessageDlg('该仓单号已存在，不允许保存！',mtWarning,[mbOK],0);
      exit;
   end;

   data.qrylocationout.Edit;
   //lzw20101108
   data.qrylocationout.fieldbyname('Shippercusid').asString:=iif(copyShippercusID<>'',copyShippercusID,data.qrylocationout.fieldByname('costcusid').AsString);
   data.qrylocationout.fieldbyname('Shippercusname').asString:=iif(copyShippercusname<>'',copyShippercusname,data.qrylocationout.fieldByname('costcusname').AsString);
   data.qrylocationout.fieldbyname('cusid').asString:=iif(copycusID<>'',copycusID,data.qrylocationout.fieldByname('costcusid').AsString);
   data.qrylocationout.fieldbyname('cusname').asString:=iif(copycusname<>'',copycusname,data.qrylocationout.fieldByname('costcusname').AsString);
   //lzw20110121
   if (strmainorder<>'')and(data.qryLocationout.fieldbyname('mainorder').asString='') then
   //lzw 20080603
   begin
      if (getSysdata('xytext')<>'T') and (_strsyscus='DHA')then
      data.qryLocationout.fieldbyname('mainorder').asString:=strmainorder;
      if (_strsyscus='JJXY')  then
      begin
         opensql(datatmp.qryTmp,'select isday=isnull(isday,"") from customer(nolock)'
                               +' where cusid="'+data.qryLocationout.fieldbyname('costcusid').asString+'" '
                 );
         if datatmp.qryTmp.fieldbyname('isday').asString='T' then
         begin
            data.qryLocationout.fieldbyname('mainorder').asString:=strmainorder;
         end;
      end;
   end;

   btnTotal.Click;

   data.qryout.edit;
   data.qryout.fieldbyname('taskiscomplete').asstring   :=data.qrylocationout.FieldByName('taskiscomplete').AsString;
   data.qryout.fieldbyname('Jobno').asstring            :=data.qrylocationout.fieldbyname('Jobno').asstring;
   data.qryout.fieldbyname('UserID').asstring           :=data.qrylocationout.fieldbyname('UserID').asstring;
   data.qryout.fieldbyname('iuserid').asstring          :=data.qrylocationout.fieldbyname('iuserid').asstring;
   data.qryout.fieldbyname('iUserName').asstring        :=data.qrylocationout.fieldbyname('iUserName').asstring;
   data.qryout.fieldbyname('TaskDate').asDatetime       :=data.qrylocationout.fieldbyname('TaskDate').asDateTime;
   data.qryout.fieldbyname('CARRIERDATE').asDatetime    :=data.qrylocationout.fieldbyname('CARRIERDATE').asDateTime;
   data.qryout.fieldbyname('OPERATIONDATE').asDatetime  :=data.qrylocationout.fieldbyname('OPERATIONDATE').asDateTime;        ;
   data.qryout.fieldbyname('conloaddate').AsString    :=Copy(Trim(data.qrylocationout.fieldbyname('conloaddate').AsString),1,10);    
   data.qryout.fieldbyname('CreateName').asstring       :=data.qrylocationout.fieldbyname('CreateName').asstring;
   data.qryout.fieldbyname('operationname').asstring    :=data.qrylocationout.fieldbyname('operationname').asstring;
   data.qryout.fieldbyname('corpno').asstring           :=data.qrylocationout.fieldbyname('corpno').asstring;
   data.qryout.fieldbyname('LocationBillNO').asstring   :=data.qrylocationout.fieldbyname('LocationBillNO').asstring;
   data.qryout.fieldbyname('MainOrder').asstring        :=data.qrylocationout.fieldbyname('MainOrder').asstring;
   data.qryout.fieldbyname('cusbillno').asstring        :=data.qrylocationout.fieldbyname('cusbillno').asstring;
   data.qryout.fieldbyname('checkname').asstring        :=data.qrylocationout.fieldbyname('checkname').asstring;
//    data.qryout.fieldbyname('ACTCHKUserName').asstring       :=data.qrylocationout.fieldbyname('ACTCHKUserName').asstring;
   data.qryout.fieldbyname('CountName').asstring        :=data.qrylocationout.fieldbyname('CountName').asstring;
   data.qryout.fieldbyname('SKUName').asstring          :=data.qrylocationout.fieldbyname('SKUName').asstring;
   data.qryout.fieldbyname('QuantityTasked').asstring   :=data.qrylocationout.fieldbyname('QuantityTasked').asstring;
   data.qryout.fieldbyname('costcusid').asstring        :=data.qrylocationout.fieldbyname('costcusid').asstring;
   data.qryout.fieldbyname('costcusname').asstring      :=data.qrylocationout.fieldbyname('costcusname').asstring;
   data.qryout.fieldbyname('Shippercusid').asString     :=data.qrylocationout.fieldbyname('Shippercusid').asString;
   data.qryout.fieldbyname('cusname').asString          :=data.qrylocationout.fieldbyname('cusname').asString;
   data.qryout.fieldbyname('LoadTypeName').asstring     :=iif(rdgLoadType.ItemIndex=0,'散货','整柜');
   data.qryout.fieldbyname('condes').asstring           :=data.qrylocationout.fieldbyname('condes').asstring;
   data.qryout.fieldbyname('CustomsNO').asstring        :=data.qrylocationout.fieldbyname('CustomsNO').asstring;
   data.qryout.fieldbyname('Piece').AsFloat             :=data.qrylocationout.fieldbyname('Piece').AsFloat;
//    data.qryout.fieldbyname('GrossWeight').asFloat           :=data.qrylocationout.fieldbyname('GrossWeight').asFloat;
   data.qryout.fieldbyname('loadcosttype').AsString     :=data.qrylocationout.fieldbyname('loadcosttype').AsString;
   data.qryout.fieldbyname('PieceTasked').asFloat       :=data.qrylocationout.fieldbyname('PieceTasked').asFloat;
   data.qryout.fieldbyname('VolumeTasked').asFloat      :=data.qrylocationout.fieldbyname('VolumeTasked').asFloat;
   data.qryout.fieldbyname('Volume').asFloat            :=data.qrylocationout.fieldbyname('Volume').asFloat;
   //data.qryout.fieldbyname('quantity').asFloat          :=data.qrylocationout.fieldbyname('quantity').asFloat;
   data.qryout.fieldbyname('quantitytasked').asFloat          :=data.qrylocationout.fieldbyname('quantitytasked').asFloat;
   data.qryout.fieldbyname('grossweight').asFloat       :=data.qrylocationout.fieldbyname('grossweight').asFloat;
   data.qryout.fieldbyname('netweight').asFloat         :=data.qrylocationout.fieldbyname('netweight').asFloat;
   data.qryout.FieldByName('TASKDATErq').AsString       :=datetostr(data.qrylocationout.FieldByName('TASKDATE').Asdatetime);
   data.qryout.FieldByName('TASKDATEsj').AsString       :=timetostr(data.qrylocationout.FieldByName('TASKDATE').Asdatetime);
   data.qryout.fieldbyname('conno').AsString            :=data.qrylocationout.fieldbyname('conno').AsString;
   //lzw 20081217
   data.qryout.fieldbyname('blno').AsString             :=data.qrylocationout.fieldbyname('blno').AsString;
   //lzw20110325
   if _strsyscus='SWZ' then
   begin
      opensql(datatmp.qrytmp,'select netweightremain=sum(isnull(item.netweight,0))-sum(isnull(item.netweightdo,0)), '
                            +'       item.costcusid,item.costcusname,cuscontract.minprice   '
                            +'  from locationinitem item(nolock),cuscontract(nolock)       '
                            +' where isnull(item.costcusid,"")=isnull(cuscontract.lcusid,"")    '
                            +'   and item.costcusid="'+data.qrylocationout.fieldbyname('costcusid').asstring+'"  '
                            +' group by item.costcusid,item.costcusname,cuscontract.minprice'
             );
      if (datatmp.qrytmp.recordcount>0) and
         ((datatmp.qrytmp.fieldbyname('netweightremain').asfloat-data.qryLocationout.fieldbyname('NetWeightTasked').asFloat<datatmp.qrytmp.fieldbyname('minprice').asfloat)) then
      begin
         KMessageDlg('库存重量-出货重量,低于质押重量！',mtInformation,[mbOk],0);

      end;
   end;

   Result:=True;
end;

procedure TfrmLocationOut.InitValues;
{新增时赋初始值}
var
  strCreateID:string;
  qryselect:TKADOQuery;  
//  acontrol: TWinControl;
begin
   //赋业务联系单号
  { opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                 +'  from genjobno where substring(docno1,1,2)="CC"  '
                 +'       and substring(jobno,5,2)="LO"  '
                 +'       and substring(docno1,3,4)="'+copy(datetostr(getserverdate),1,4)+'"' );//out cc
   data.qryLocationOut.edit;
   data.qryLocationOut.FieldByName('OperationType').AsInteger :=-1;
   data.qryLocationOut.FieldByName('LocationBillNO').Asstring:='CC'+copy(datetostr(getserverdate),1,4) //out cc
                                                           +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   }
   data.qryLocationOut.edit;
   data.qryLocationOut.FieldByName('OperationType').AsInteger :=-1;
   if _paper='T' then
   begin
      data.qryLocationOut.FieldByName('costcusid').Asstring:=strcusid;
      data.qryLocationOut.FieldByName('costcusname').Asstring:=strcusname;
      data.qryLocationOut.FieldByName('locationbillno').Asstring:=strlocno;
   end else
      data.qryLocationOut.FieldByName('LocationBillNO').Asstring:=GetLocationBillNO;
   strCreateID:=genJobno('LO',data.qryLocationOut.FieldByName('LocationBillNO').Asstring);//out
   //lzw20091202
   if getSysdata('hxtext')='T' then
   begin
      cmbLoadCostType.Text:='';
   end;
   if blnCopy then
   begin
      blnCopy:=False;
      //data.qryLocationOut复制
      GatherFromArray(data.qryLocationOut,arrLocationINOUT,false);
      data.qryLocationOut.FieldByName('Jobno').Asstring:=strCreateID;
      data.qryLocationOut.FieldByName('UserID').Asstring:=_UserID;
      data.qryLocationOut.FieldByName('operationname').Asstring:='';
      data.qryLocationOut.FieldByName('OPERATIONDate').Clear;
      data.qryLocationOut.FieldByName('checkname').Asstring:='';
      data.qryLocationOut.FieldByName('CheckDate').Clear;
      data.qryLocationOut.FieldByName('CountUserName').Asstring:='';
      data.qryLocationOut.FieldByName('CountDate').Clear;
      data.qryLocationOut.FieldByName('ACTCHKUserName').Asstring:='';
      data.qryLocationOut.FieldByName('ACTCHKDate').Clear;
      //data.qryLocationOutItemTask复制
      data.qryLocationOutItem.DisableControls;
      GatherFromArray(data.qryLocationOutItem,arrLocationoutItem,true);
      with data.qryLocationOutItem do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('Jobno').Asstring:=strCreateID;
          FieldByName('UserID').Asstring:=_UserID;
          if FieldByName('SNO').AsInteger>maxLocationOutItem
          then maxLocationOutItem:=FieldByName('SNO').AsInteger;
          next;
        end;
        First;
      end;
      data.qryLocationOutItem.EnableControls;
   end else
   begin
      if qryWareOrderEdit<>nil then //由指令单导入信息
      begin
         //data.qryLocationOut
         strJobnoOrder:=qryWareOrderEdit.FieldByName('Jobno').AsString;
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('JOBNO').AsString                :=strCreateID;
         data.qryLocationOut.FieldByName('jobnoori').AsString             :=qryWareOrderEdit.FieldByName('jobnoori').AsString;
         data.qryLocationOut.FieldByName('jobnoine').AsString             :=qryWareOrderEdit.FieldByName('jobnoin').AsString;
         data.qryLocationOut.FieldByName('ordercreatename').AsString      :=qryWareOrderEdit.FieldByName('createname').AsString;
         if (_strSysCus='JG') and (qryWareOrderEdit.FieldByName('uploaddate').AsDateTime<>0 ) then
            data.qryLocationOut.FieldByName('conloaddate').AsDateTime     :=qryWareOrderEdit.FieldByName('uploaddate').AsDateTime;
         if (_strSysCus='JG')then
             data.qrylocationout.FieldByName('stockup').AsString          :='T' ;
         data.qryLocationOut.FieldByName('TASKDATE').AsDateTime           :=GetServerDate;
         data.qryLocationOut.FieldByName('LoadType').AsString             :=qryWareOrderEdit.FieldByName('LoadType').AsString;
         data.qryLocationOut.FieldByName('Carriercusid').AsString         :=qryWareOrderEdit.FieldByName('Carriercusid').AsString;
         data.qryLocationOut.FieldByName('shipcusid').AsString            :=qryWareOrderEdit.FieldByName('shipcusid').AsString;
         data.qryLocationOut.FieldByName('CarriercusName').AsString       :=qryWareOrderEdit.FieldByName('CarriercusName').AsString;
         data.qryLocationOut.FieldByName('shipcusname').AsString          :=qryWareOrderEdit.FieldByName('shipcusname').AsString;
         data.qryLocationOut.FieldByName('Carbrand').AsString             :=qryWareOrderEdit.FieldByName('Carbrand').AsString;
         data.qryLocationOut.FieldByName('carrierno').AsString            :=qryWareOrderEdit.FieldByName('carrierno').AsString;
         data.qryLocationOut.FieldByName('CarrierName').AsString            :=qryWareOrderEdit.FieldByName('CarrierName').AsString;
         data.qryLocationOut.FieldByName('costcusname').AsString          :=qryWareOrderEdit.FieldByName('costcusname').AsString;
         data.qryLocationOut.FieldByName('costcusid').AsString            :=qryWareOrderEdit.FieldByName('costcusid').AsString;
         data.qryLocationOut.FieldByName('MainOrder').AsString            :=qryWareOrderEdit.FieldByName('MainOrder').AsString;
         data.qryLocationOut.FieldByName('cusbillno').AsString            :=qryWareOrderEdit.FieldByName('cusbillno').AsString;

         //lzw20111116

         data.qryLocationOut.FieldByName('Routing').AsString            :=qryWareOrderEdit.FieldByName('Routing').AsString;
         data.qryLocationOut.FieldByName('corpno').AsString            :=qryWareOrderEdit.FieldByName('corpno').AsString;
         data.qryLocationOut.FieldByName('DestOrder').AsString            :=qryWareOrderEdit.FieldByName('DestOrder').AsString;

        if qryWareOrderEdit.FieldByName('quantity').AsFloat<>qryWareOrderEdit.FieldByName('quantityori').AsFloat then
            data.qryLocationOut.FieldByName('orderstate').AsString            :='0'
         else
            data.qryLocationOut.FieldByName('orderstate').AsString            :='1';
   //lhl
         if qryWareOrderEdit.FieldByName('CarrierDate').AsDateTime<>0 then
            data.qryLocationOut.FieldByName('CarrierDate').AsDateTime     :=qryWareOrderEdit.FieldByName('CarrierDate').AsDateTime
         else
            data.qryLocationOut.FieldByName('CarrierDate').Clear;
         data.qryLocationOut.FieldByName('BLNO').AsString                 :=qryWareOrderEdit.FieldByName('BLNO').AsString;
         data.qryLocationOut.FieldByName('CONNO').AsString                :=qryWareOrderEdit.FieldByName('CONNO').AsString;
         data.qryLocationOut.FieldByName('SealNO').AsString               :=qryWareOrderEdit.FieldByName('SealNO').AsString;
         data.qryLocationOut.FieldByName('CONType').AsString              :=qryWareOrderEdit.FieldByName('CONType').AsString;
         data.qryLocationOut.FieldByName('CONSPType').AsString            :=qryWareOrderEdit.FieldByName('CONSPType').AsString;
         data.qryLocationOut.FieldByName('Routing').AsString              :=qryWareOrderEdit.FieldByName('Routing').AsString;
         data.qryLocationOut.FieldByName('SKUName').AsString              :=qryWareOrderEdit.FieldByName('SKUName').AsString;
         data.qryLocationOut.FieldByName('PieceUOM').AsString             :=qryWareOrderEdit.FieldByName('PieceUOM').AsString;
         data.qryLocationOut.FieldByName('WeightUOM').AsString            :=qryWareOrderEdit.FieldByName('WeightUOM').AsString;
         data.qryLocationOut.FieldByName('VolumeUOM').AsString            :=qryWareOrderEdit.FieldByName('VolumeUOM').AsString;
         data.qryLocationOut.FieldByName('AreaUOM').AsString              :=qryWareOrderEdit.FieldByName('AreaUOM').AsString;
         data.qryLocationOut.FieldByName('OPID').AsString                 :=qryWareOrderEdit.FieldByName('CostOPID').AsString;
         data.qryLocationOut.FieldByName('OPName').AsString               :=qryWareOrderEdit.FieldByName('CostOPName').AsString;
         data.qryLocationOut.FieldByName('Remark').AsString               :=qryWareOrderEdit.FieldByName('Remark').AsString;
         data.qryLocationOut.FieldByName('SKUCOSTCLASSCD').AsString       :=qryWareOrderEdit.FieldByName('SKUCOSTCLASSCD').AsString;
         data.qryLocationOut.FieldByName('QuantityUOM').AsString          :=qryWareOrderEdit.FieldByName('QuantityUOM').AsString;
         data.qryLocationOut.FieldByName('skucost').AsFloat               :=qryWareOrderEdit.FieldByName('skucost').AsFloat;
         data.qryLocationOut.FieldByName('CustomsNO').AsString            :=qryWareOrderEdit.FieldByName('CustomsNO').AsString;
         //lzw20090907
         data.qryLocationOut.FieldByName('InspectionNo').AsString            :=qryWareOrderEdit.FieldByName('InspectionNo').AsString;
         data.qryLocationOut.FieldByName('countwith1').Asstring:='F';
         data.qryLocationOut.FieldByName('WareRentCountType').Asstring    :=qryWareOrderEdit.FieldByName('WareRentCountType').AsString;;
         data.qryLocationOut.FieldByName('contwithloca').AsString         :=qryWareOrderEdit.FieldByName('contwithloca').AsString;
         data.qryLocationOut.FieldByName('LotTracked').AsString           :=qryWareOrderEdit.FieldByName('LotTracked').AsString;
         data.qryLocationOut.FieldByName('IsBond').AsString               :=qryWareOrderEdit.FieldByName('IsBond').AsString;
         data.qryLocationOut.FieldByName('countrent').AsString            :=qryWareOrderEdit.FieldByName('countrent').AsString;
         data.qryLocationOut.FieldByName('countcontcost').AsString        :=qryWareOrderEdit.FieldByName('countcontcost').AsString;
         data.qryLocationOut.fieldbyname('loadcosttype').asstring         :=qryWareOrderEdit.FieldByName('loadcosttype').AsString;
         data.qryLocationOut.fieldbyname('cususername').asstring          :=qryWareOrderEdit.FieldByName('cususername').AsString;
         data.qryLocationOut.fieldbyname('costquantitytasked').AsFloat    :=qryWareOrderEdit.FieldByName('costquantity').AsFloat;
         data.qryLocationOut.fieldbyname('costquantityuom').asstring      :=qryWareOrderEdit.FieldByName('costquantityuom').AsString;
         //lzw 20080731
         if getSysdata('qdtext')='T' then
            data.qryLocationOut.fieldbyname('OriginOrder').asstring       :=qryWareOrderEdit.FieldByName('origincusname').AsString;
         if  _wareuserid='T' then
         begin
            data.qryLocationOut.FieldByName('UserID').Asstring:=qryWareOrderEdit.FieldByName('userid').AsString;
            data.qryLocationOut.FieldByName('Username').Asstring:=qryWareOrderEdit.FieldByName('username').AsString;
            data.qryLocationOut.FieldByName('iUserID').Asstring:=qryWareOrderEdit.FieldByName('iuserid').AsString;
            data.qryLocationOut.FieldByName('iUsername').Asstring:=qryWareOrderEdit.FieldByName('iusername').AsString;
         end;
         //lzw20090512
         if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
         begin
            opensql(datatmp.qryTmp,'select  mincostin from  customer(nolock ) '
                           +' where cusid="'+qryWareOrderEdit.FieldByName('costcusid').AsString+'"  '
                   );
            data.qryLocationOut.FieldByName('mincostin').Asstring:=datatmp.qryTmp.FieldByName('mincostin').AsString;
         end;
         //lzw20090429
         if _StrSysCus='SWZ' then
         begin
            GetCusCnfg;
            OpenSql(datatmp.qryTmp,'select * from contract (nolock)    '+chr(13)+chr(10)
                                  +' where signcusid="'+data.qryLocationOut.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                                  +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                                  +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                               );
            if datatmp.qryTmp.RecordCount<>0 then
            begin
               data.qryLocationOut.FieldByName('corpno').AsString  :=datatmp.qryTmp.FieldByName('contractno').asstring;
            end;
         end else
         begin
           //取客户配置
         qrySelect:=pGetCuscnfgSelect( data.qryLocationOut.FieldByName('costcusid').AsString,
                                       data.qryLocationOut.FieldByName('costcusname').AsString,'仓储');

         if (qrySelect.FieldByName('jobno').AsString<>'NO') and not qryselect.isempty then
           data.qryLocationOut.FieldByName('TagEach').Asstring:=qrySelect.FieldByName('TagEach').Asstring;
           strCostCountUOMType:=qrySelect.FieldByName('CostCountUOMType').Asstring;
           strRentCountUOMType:=qrySelect.FieldByName('RentCountUOMType').Asstring;
           strRentCountUOMTypeOut:=qrySelect.FieldByName('RentCountUOMTypeout').Asstring;
           copyloadgroupcusid     :=qrySelect.FieldByName('loadgroupcusid').Asstring;
           copyloadgroupcusname   :=qrySelect.FieldByName('loadgroupcusname').Asstring;
           copyforkgroupcusid     :=qrySelect.FieldByName('forkgroupcusid').Asstring;
           copyforkgroupcusname   :=qrySelect.FieldByName('forkgroupcusname').Asstring;
           copyliftmachinecusid   :=qrySelect.FieldByName('liftmachinecusid').Asstring;
           copyliftmachinecusname :=qrySelect.FieldByName('liftmachinecusname').Asstring;
         end;
         qryWareOrderEdit:=nil;
         if  pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   //任务增加
         mitAddLocItemClick(self);
         qryWareOrderSKU.First;
         while not qryWareOrderSKU.Eof do
         begin
            //lzw20110704
            if (qryWareOrderSku.FieldByName('quantity').AsFloat-qryWareOrderSku.FieldByName('quantitytask').AsFloat>0)
               //and (qrywareordersku.fieldbyname('piece').asfloat-qrywareordersku.fieldbyname('piecetask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('netweight').asfloat-qrywareordersku.fieldbyname('netweighttask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('grossweight').asfloat-qrywareordersku.fieldbyname('grossweighttask').asfloat>=0)
               //and ((qrywareordersku.fieldbyname('volume').asfloat-qrywareordersku.fieldbyname('volumetask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('area').asfloat-qrywareordersku.fieldbyname('areatask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing1').asfloat-qrywareordersku.fieldbyname('casing1task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing2').asfloat-qrywareordersku.fieldbyname('casing2task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing3').asfloat-qrywareordersku.fieldbyname('casing3task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing4').asfloat-qrywareordersku.fieldbyname('casing4task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing5').asfloat-qrywareordersku.fieldbyname('casing5task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('costquantity').AsFloat-qrywareordersku.fieldbyname('costquantitytask').AsFloat>=0)
             //  or (_DB_Order<>'T')
            then
            begin
               if qryWareOrderSKU.BOF then
               begin
                  data.qryLocationOut.Edit;
                  data.qrylocationout.fieldbyname('countwho').asstring        :=qrywareordersku.fieldbyname('countwho').asstring;
               end;
               data.qrylocationoutitem.append;
               data.qrylocationoutitem.fieldbyname('jobnoorder').asstring      :=qrywareordersku.fieldbyname('jobno').asstring;
               data.qrylocationoutitem.fieldbyname('snoorder').asinteger       :=qrywareordersku.fieldbyname('sno').asinteger;
               data.qrylocationoutitem.fieldbyname('skuid').asstring           :=qrywareordersku.fieldbyname('skuid').asstring;
//dwq20051208
               data.qrylocationoutitem.fieldbyname('mainorderin').asstring     :=qrywareordersku.fieldbyname('mainorderin').asstring;
               data.qrylocationoutitem.fieldbyname('mainorder').asstring       :=qrywareordersku.fieldbyname('mainorder').asstring;
               data.qrylocationoutitem.fieldbyname('lotcode').asstring         :=qrywareordersku.fieldbyname('lotcode').asstring;
               data.qrylocationoutitem.fieldbyname('quantitytask').asfloat     :=qrywareordersku.fieldbyname('quantity').asfloat-qrywareordersku.fieldbyname('quantitytask').asfloat;
               data.qrylocationoutitem.fieldbyname('sequencenum').asstring     :=qrywareordersku.fieldbyname('sequencenum').asstring;
               data.qrylocationoutitem.fieldbyname('qualityname').asstring     :=qrywareordersku.fieldbyname('qualityname').asstring;
               data.qrylocationoutitem.fieldbyname('skuname').asstring         :=qrywareordersku.fieldbyname('skuname').asstring;
               data.qrylocationoutitem.fieldbyname('operationtype').asstring   :=qrywareordersku.fieldbyname('operationtype').asstring;
               data.qrylocationoutitem.fieldbyname('pieceuom').asstring        :=qrywareordersku.fieldbyname('pieceuom').asstring;
               data.qrylocationoutitem.fieldbyname('weightuom').asstring       :=qrywareordersku.fieldbyname('weightuom').asstring;
               data.qrylocationoutitem.fieldbyname('volumeuom').asstring       :=qrywareordersku.fieldbyname('volumeuom').asstring;
               data.qrylocationoutitem.fieldbyname('areauom').asstring         :=qrywareordersku.fieldbyname('areauom').asstring;
               data.qrylocationoutitem.fieldbyname('piecetask').asfloat        :=qrywareordersku.fieldbyname('piece').asfloat-qrywareordersku.fieldbyname('piecetask').asfloat;
               data.qrylocationoutitem.fieldbyname('netweighttask').asfloat    :=qrywareordersku.fieldbyname('netweight').asfloat-qrywareordersku.fieldbyname('netweighttask').asfloat;
               data.qrylocationoutitem.fieldbyname('grossweighttask').asfloat  :=qrywareordersku.fieldbyname('grossweight').asfloat-qrywareordersku.fieldbyname('grossweighttask').asfloat;
               data.qrylocationoutitem.fieldbyname('volumetask').asfloat       :=qrywareordersku.fieldbyname('volume').asfloat-qrywareordersku.fieldbyname('volumetask').asfloat;
               data.qrylocationoutitem.fieldbyname('areatask').asfloat         :=qrywareordersku.fieldbyname('area').asfloat-qrywareordersku.fieldbyname('areatask').asfloat;
               data.qrylocationoutitem.fieldbyname('costcusid').asstring    :=qrywareordersku.fieldbyname('costcusid').asstring;
               data.qrylocationoutitem.fieldbyname('costcusname').asstring         :=qrywareordersku.fieldbyname('costcusname').asstring;
               data.qrylocationoutitem.fieldbyname('cusid').asstring           :=qrywareordersku.fieldbyname('cusid').asstring;
               data.qrylocationoutitem.fieldbyname('shippercusid').asstring    :=qrywareordersku.fieldbyname('shippercusid').asstring;
               data.qrylocationoutitem.fieldbyname('cusname').asstring         :=qrywareordersku.fieldbyname('cusname').asstring;
               data.qrylocationoutitem.fieldbyname('shippercusname').asstring  :=qrywareordersku.fieldbyname('shippercusname').asstring;
               data.qrylocationoutitem.fieldbyname('shipcusid').asstring       :=qrywareordersku.fieldbyname('shipcusid').asstring;
               data.qrylocationoutitem.fieldbyname('shipcusname').asstring     :=qrywareordersku.fieldbyname('shipcusname').asstring;
               data.qrylocationoutitem.fieldbyname('conscusid').asstring       :=qrywareordersku.fieldbyname('conscusid').asstring;
               data.qrylocationoutitem.fieldbyname('conscusname').asstring     :=qrywareordersku.fieldbyname('conscusname').asstring;
               data.qrylocationoutitem.fieldbyname('price').asfloat            :=qrywareordersku.fieldbyname('price').asfloat;
               data.qrylocationoutitem.fieldbyname('currcd').asstring          :=qrywareordersku.fieldbyname('currcd').asstring;
               data.qrylocationoutitem.fieldbyname('skucost').asfloat          :=qrywareordersku.fieldbyname('skucost').asfloat;
               data.qrylocationoutitem.fieldbyname('pricein').asfloat          :=qrywareordersku.fieldbyname('pricein').asfloat;
               data.qrylocationoutitem.fieldbyname('skucostin').asfloat        :=qrywareordersku.fieldbyname('skucostin').asfloat;
               data.qrylocationoutitem.fieldbyname('costuomtype').asstring     :=qrywareordersku.fieldbyname('costuomtype').asstring;
               data.qrylocationoutitem.fieldbyname('locname').asstring         :=qrywareordersku.fieldbyname('locname').asstring;
               data.qrylocationoutitem.fieldbyname('locid').asstring           :=qrywareordersku.fieldbyname('locid').asstring;
               data.qrylocationoutitem.fieldbyname('quantityuom').asstring     :=qrywareordersku.fieldbyname('quantityuom').asstring            ;
               data.qrylocationoutitem.fieldbyname('piecepro').asfloat         :=qrywareordersku.fieldbyname('piecepro').asfloat  ;
               data.qrylocationoutitem.fieldbyname('volumepro').asfloat        :=qrywareordersku.fieldbyname('volumepro').asfloat ;
               data.qrylocationoutitem.fieldbyname('areapro').asfloat          :=qrywareordersku.fieldbyname('areapro').asfloat   ;
               data.qrylocationoutitem.fieldbyname('netweightpro').asfloat     :=qrywareordersku.fieldbyname('netweightpro').asfloat ;
               data.qrylocationoutitem.fieldbyname('grossweightpro').asfloat   :=qrywareordersku.fieldbyname('grossweightpro').asfloat ;
               data.qrylocationoutitem.fieldbyname('manufacturedate').asdatetime:=qrywareordersku.fieldbyname('manufacturedate').asdatetime ;
               if data.qrylocationoutitem.fieldbyname('manufacturedate').asdatetime=0 then
                  data.qrylocationoutitem.fieldbyname('manufacturedate').clear;

               data.qrylocationoutitem.fieldbyname('uom1').asstring        :=qrywareordersku.fieldbyname('uom1').asstring;
               data.qrylocationoutitem.fieldbyname('uom2').asstring        :=qrywareordersku.fieldbyname('uom2').asstring;
               data.qrylocationoutitem.fieldbyname('uom3').asstring        :=qrywareordersku.fieldbyname('uom3').asstring;
               data.qrylocationoutitem.fieldbyname('uom4').asstring        :=qrywareordersku.fieldbyname('uom4').asstring;
               data.qrylocationoutitem.fieldbyname('uom5').asstring        :=qrywareordersku.fieldbyname('uom5').asstring;
               data.qrylocationoutitem.fieldbyname('casing1task').asfloat  :=qrywareordersku.fieldbyname('casing1').asfloat-qrywareordersku.fieldbyname('casing1task').asfloat;
               data.qrylocationoutitem.fieldbyname('casing2task').asfloat  :=qrywareordersku.fieldbyname('casing2').asfloat-qrywareordersku.fieldbyname('casing2task').asfloat;
               data.qrylocationoutitem.fieldbyname('casing3task').asfloat  :=qrywareordersku.fieldbyname('casing3').asfloat-qrywareordersku.fieldbyname('casing3task').asfloat;
               data.qrylocationoutitem.fieldbyname('casing4task').asfloat  :=qrywareordersku.fieldbyname('casing4').asfloat-qrywareordersku.fieldbyname('casing4task').asfloat;
               data.qrylocationoutitem.fieldbyname('casing5task').asfloat  :=qrywareordersku.fieldbyname('casing5').asfloat-qrywareordersku.fieldbyname('casing5task').asfloat;
               data.qrylocationoutitem.fieldbyname('pro1').asfloat         :=qrywareordersku.fieldbyname('pro1').asfloat ;
               data.qrylocationoutitem.fieldbyname('pro2').asfloat         :=qrywareordersku.fieldbyname('pro2').asfloat ;
               data.qrylocationoutitem.fieldbyname('pro3').asfloat         :=qrywareordersku.fieldbyname('pro3').asfloat ;
               data.qrylocationoutitem.fieldbyname('pro4').asfloat         :=qrywareordersku.fieldbyname('pro4').asfloat ;
               data.qrylocationoutitem.fieldbyname('pro5').asfloat         :=qrywareordersku.fieldbyname('pro5').asfloat ;
               data.qrylocationoutitem.fieldbyname('jobnoin').asstring     :=qrywareordersku.fieldbyname('jobnoin').asstring ;
               data.qrylocationoutitem.fieldbyname('snoin').asinteger      :=qrywareordersku.fieldbyname('snoin').asinteger;
               data.qrylocationoutitem.fieldbyname('snolocin').asinteger   :=qrywareordersku.fieldbyname('snolocin').asinteger;
               data.qrylocationoutitem.fieldbyname('ldsnoin').asinteger    :=qrywareordersku.fieldbyname('ldsnoin').asinteger;
               data.qrylocationoutitem.fieldbyname('jobnoinf').asstring    :=qrywareordersku.fieldbyname('jobnoinf').asstring ;
               data.qrylocationoutitem.fieldbyname('snoinf').asinteger     :=qrywareordersku.fieldbyname('snoinf').asinteger;
               data.qrylocationoutitem.fieldbyname('ldsnoinf').asinteger   :=qrywareordersku.fieldbyname('ldsnoinf').asinteger;
               data.qrylocationoutitem.fieldbyname('jobnoori').asstring    :=qrywareordersku.fieldbyname('jobnoori').asstring ;
               data.qrylocationoutitem.fieldbyname('snoori').asinteger     :=qrywareordersku.fieldbyname('oriskusno').asinteger;
               data.qrylocationoutitem.fieldbyname('customsno').asstring   :=qrywareordersku.fieldbyname('customsno').asstring ;
               data.qrylocationoutitem.fieldbyname('customsnoin').asstring   :=qrywareordersku.fieldbyname('customsnoin').asstring ;
               data.qrylocationoutitem.fieldbyname('cusbillnoin').asstring   :=qrywareordersku.fieldbyname('cusbillnoin').asstring ;
               data.qrylocationoutitem.fieldbyname('locationbillnoin').asstring   :=qrywareordersku.fieldbyname('locationbillno').asstring ;
               data.qrylocationoutitem.fieldbyname('lottracked').asstring       :=qrywareordersku.fieldbyname('lottracked').asstring ;
               data.qrylocationoutitem.fieldbyname('tageach').asstring          :=qrywareordersku.fieldbyname('tageach').asstring ;
               data.qrylocationoutitem.fieldbyname('tageachuom').asstring       :=qrywareordersku.fieldbyname('tageachuom').asstring ;
               data.qrylocationoutitem.fieldbyname('warerentcounttype').asstring:=qrywareordersku.fieldbyname('warerentcounttype').asstring ;
               data.qrylocationoutitem.fieldbyname('isbond').asstring           :=qrywareordersku.fieldbyname('isbond').asstring ;
               data.qrylocationoutitem.fieldbyname('countrent').asstring        :=qrywareordersku.fieldbyname('countrent').asstring ;
               data.qrylocationoutitem.fieldbyname('countcontcost').asstring    :=qrywareordersku.fieldbyname('countcontcost').asstring ;
               data.qrylocationoutitem.fieldbyname('loadcostone').asstring      :=qrywareordersku.fieldbyname('loadcostone').asstring ;
               data.qrylocationoutitem.fieldbyname('customerno').asstring       :=qrywareordersku.fieldbyname('SKU_CustomerID').asstring ;
               data.qrylocationoutitem.fieldbyname('corpno').asstring           :=qrywareordersku.fieldbyname('corpno').asstring ;
               if qrywareordersku.fieldbyname('skustandard').asstring<>'' then
                  data.qrylocationoutitem.fieldbyname('skuspec').asstring         :=qrywareordersku.fieldbyname('skustandard').asstring
               else
                  data.qrylocationoutitem.fieldbyname('skuspec').asstring          :=qrywareordersku.fieldbyname('skuspec').asstring ;
               data.qrylocationoutitem.fieldbyname('skumodel').asstring         :=qrywareordersku.fieldbyname('skumodel').asstring ;
               data.qrylocationoutitem.fieldbyname('color').asstring            :=qrywareordersku.fieldbyname('color').asstring ;
//cyh
               data.qrylocationoutitem.fieldbyname('outzoneno').asstring            :=qrywareordersku.fieldbyname('outzoneno').asstring ;
               data.qrylocationoutitem.fieldbyname('remark').asstring            :=qrywareordersku.fieldbyname('remark').asstring ;    //lihl20120309

               data.qrylocationoutitem.fieldbyname('sno').asinteger             :=-1;
               data.qrylocationoutitem.fieldbyname('jobno').asstring            :=strcreateid;
               data.qrylocationoutitem.fieldbyname('userid').asstring           :=_userid;
  //wql_new             data.qrylocationoutitem.fieldbyname('costcusid').asstring        :=qrywareordersku.fieldbyname('costcusid').asstring;
               data.qrylocationoutitem.fieldbyname('skucostclasscd').asstring   :=qrywareordersku.fieldbyname('skucostclasscd').asstring;
               data.qrylocationoutitem.fieldbyname('notfullsign').asstring      :=qrywareordersku.fieldbyname('notfullsign').asstring;
               data.qrylocationoutitem.fieldbyname('loadgroupcusid').asstring    :=copyloadgroupcusid;
               data.qrylocationoutitem.fieldbyname('loadgroupcusname').asstring  :=copyloadgroupcusname;
               data.qrylocationoutitem.fieldbyname('forkgroupcusid').asstring    :=copyforkgroupcusid;
               data.qrylocationoutitem.fieldbyname('forkgroupcusname').asstring  :=copyforkgroupcusname;
               data.qrylocationoutitem.fieldbyname('liftmachinecusid').asstring  :=copyliftmachinecusid;
               data.qrylocationoutitem.fieldbyname('liftmachinecusname').asstring:=copyliftmachinecusname;

               data.qrylocationoutitem.fieldbyname('RentCountUOMType').asstring   :=strRentCountUOMType;
               data.qrylocationoutitem.fieldbyname('RentCountUOMTypeout').asstring:=strRentCountUOMTypeOut;
               data.qrylocationoutitem.fieldbyname('CostCountUOMType').asstring   :=strCostCountUOMType;
               data.qrylocationoutitem.fieldbyname('costquantitytask').AsFloat    :=qrywareordersku.fieldbyname('costquantity').AsFloat-qrywareordersku.fieldbyname('costquantitytask').AsFloat;
               data.qrylocationoutitem.fieldbyname('costquantityuom').asstring    :=qrywareordersku.fieldbyname('costquantityuom').asstring;
               data.qrylocationoutitem.fieldbyname('carriagecurrcd').asstring    :=qrywareordersku.fieldbyname('carriagecurrcd').asstring;

               try
                 data.qryLocationOutItem.Post;
               except
                 break;
               end;
            end;
            qryWareOrderSKU.next;
         end;
  //      data.qryLocationOutItemTask.EnableControls;
         if pgcLocationINOUT.ActivePage<>tbsSKU then
           pgcLocationINOUT.ActivePage:=tbsSKU;
         self.ActiveControl:=grdLocationOutItem;
      end else
      begin
         //data.qryLocationOut
         data.qryLocationOut.Edit;
         data.qryLocationOut.fieldbyname('loadtype').AsString         :=_acc_loadtypeout ;
         data.qryLocationOut.fieldbyname('contwithloca').AsString     :=_acc_contwithloca;
         data.qryLocationOut.fieldbyname('lottracked').AsString       :=_acc_lottracked;
         data.qryLocationOut.fieldbyname('isbond').AsString           :=_acc_isbond;
         data.qryLocationOut.fieldbyname('countrent').AsString        :=_acc_countrent;
         data.qryLocationOut.fieldbyname('countcontcost').AsString    :=_acc_countcontcost;
         data.qryLocationOut.fieldbyname('tageach').AsString          :=_acc_tageach;
         data.qryLocationOut.fieldbyname('skucostclasscd').AsString   :=_acc_skucostclasscd;
         data.qryLocationOut.fieldbyname('warerentcounttype').AsString:=_acc_warerentcounttype;
  //       data.qryLocationOut.fieldbyname('countwho').AsString         :=_acc_countwho;
         data.qryLocationOut.fieldbyname('iuserid').AsString          :=_acc_iuserid;
         data.qryLocationOut.fieldbyname('iusername').AsString        :=_acc_iusername;
         data.qryLocationOut.fieldbyname('loadtype').AsString         :=_acc_loadtype;
         strCostCountUOMType:=_ACC_CostCountUOMType;
         strRentCountUOMType:=_ACC_RentCountUOMType;
         strRentCountUOMTypeout:=_ACC_rentcountuomtypeout;
         data.qryLocationOut.FieldByName('taskdate').AsDateTime:=GetServerDate;
         data.qryLocationOut.FieldByName('UserID').Asstring:=_UserID;
         data.qryLocationOut.FieldByName('Username').Asstring:=_Username;
         data.qryLocationOut.FieldByName('iUserID').Asstring:=_UserID;
         data.qryLocationOut.FieldByName('iUsername').Asstring:=_Username;
      end;
      data.qryLocationOut.FieldByName('jobno').Asstring:=strCreateID;
      //从指令下达任务时 组织延续指令的组织
      if _wareuserid<>'T' then
      begin
         data.qryLocationOut.FieldByName('UserID').Asstring:=_UserID;
         data.qryLocationOut.FieldByName('Username').Asstring:=_Username;
         data.qryLocationOut.FieldByName('iUserID').Asstring:=_UserID;
         data.qryLocationOut.FieldByName('iUsername').Asstring:=_Username;
      end;
      data.qryLocationOut.FieldByName('countwith1').Asstring:='F';
   end;
   //赋业务联系单号
 {  opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(LocationBillNO,7,8))) '
                 +'  from genjobno where substring(LocationBillNO,1,2)="CC"  '
                 +'       and substring(jobno,1,2)="LO"  '
                 +'       and substring(LocationBillNO,3,4)="'+copy(datetostr(date),1,4)+'"' );//out cc
   data.qryLocationOut.FieldByName('LocationBillNO').Asstring:='CC'+copy(datetostr(date),1,4) //out cc
                                                           +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   ExecSql(dataTmp.qryTmp,'update genjobno '
                         +'   set docno1="'+data.qryout.fieldbyname('LocationBillNO').AsString+'"'
                         +'  where jobno="'+data.qryOut.fieldbyname('jobno').AsString+'"');}
end;

function TfrmLocationOut.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
    2:
     begin
        qrySelect:=pGetCustomerSelect('A','');
        if qrySelect.FieldByName('cusid').AsString<>'NO' then
        begin
           PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
           PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
        end;
        freeandnil(qrySelect);
     end;
    6:
      begin
         qrySelect:=pGetOrganizationSelect('','','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            PItems[0]      :=qrySelect.FieldByName('username').asstring;
            PItemFields[0] :=qrySelect.FieldByName('userid').asstring;
         end;
         freeandnil(qrySelect);
      end;
    7:
      begin
        pItems.Assign(cmbSKUClass.Items);
        pItemFields.Assign(cmbSKUClass.ItemFields);
      end;
    8:
      begin
        pItems.Assign(rdgLoadType.Values);
        pItemFields.Assign(rdgLoadType.Values);
      end;
    9:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('保税');
         pItemFields.Add('F');
         pItems.Add('非保税');
      end;
    10:
      begin
         qrySelect:=pGetOperatorSelect('');
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            PItems[0] :=qrySelect.FieldByName('opname').asstring; 
            PItemFields[0]:=qrySelect.FieldByName('opid').asstring;
         end;
         qrySelect:=nil;
      end;
    13:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('包干');
         pItemFields.Add('F');
         pItems.Add('非包干');
      end;
    14:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('包仓');
         pItemFields.Add('F');
         pItems.Add('非包仓');
      end;
    15:
      begin
         pItems.Assign(cmbWareRentcountType.Items);
         pItemFields.Assign(cmbWareRentcountType.ItemFields);
      end;
    else
      Result:=False;
  end;
end;

//=================断开数据源＝＝＝＝＝＝＝＝＝＝＝＝＝//
procedure TfrmLocationOut.SetMasterDetailState(blnConnect:Boolean);
begin
   data.qryLocationout.DataSource       :=nil;
   data.qryLocationoutItem.DataSource   :=nil;
   data.qryLocationoutDetail.DataSource :=nil;
   data.qryLocOutItemCasing.DataSource  :=nil;
   data.qryautocountcostout.DataSource  :=nil;
   data.qryLocOutSkudetail.DataSource   :=nil;
end;

procedure TfrmLocationOut.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
//   if blnOpen then
//   begin
   if blnPage then
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         //如果从表的qry已经打开，这时连接数据源时会造成sql刷两次，因此要先关掉qry
         if (data.qryLocationOut.DataSource=nil) and (data.qryLocationOut.Active) then
            data.qryLocationOut.Close;
         data.qryLocationOut.DataSource:=data.dtsOut;
         data.qryLocationOut.Active:=true;
         //lzw 07.11.29
         if pgcLocationINOUT.ActivePage=tbslocinskudetail then
         begin
            if (data.qryLocInSkuDetail.DataSource=nil) and (data.qryLocInSkuDetail.Active) then
                data.qryLocInSkuDetail.Close;
            data.qryLocInSkuDetail.DataSource:=data.dtsOut;
            data.qryLocInSkuDetail.Active:=True;
            if data.qryLocInSkuDetail.Active<>True then
            begin
               data.qryLocInSkuDetail.ParamByName('jobno').AsString:=data.qrylocationout.fieldByName('jobno').AsString;
               data.qryLocInSkuDetail.Open;
            end;
         end;
         //
         if pgcLocationINOUT.ActivePage=tbsSKU then
         begin
            if (data.qryLocationOutItem.DataSource=nil) and (data.qryLocationOutItem.Active) then
               data.qryLocationOutItem.Close;
            data.qryLocationOutItem.DataSource:=data.dtsOut;
            data.qryLocationOutItem.Active:=true;
            if (data.qryLocationOutDetail.DataSource=nil) and (data.qryLocationOutDetail.Active) then
               data.qryLocationOutDetail.Close;
            data.qryLocationOutDetail.DataSource:=data.dtsOut;
            data.qryLocationOutDetail.Active:=true;

{            if (data.qryLocOutSkudetail.DataSource=nil) and (data.qryLocOutSkudetail.Active) then
               data.qryLocOutSkudetail.Close;
            data.qryLocOutSkudetail.DataSource:=data.dtsOut;}
 //           data.qryLocationOutDetail.Active:=true;  点击菜单时打开
         end else
         if pgcLocationINOUT.ActivePage=tbsCasing then
         begin
            if _iscasing='T' then //打包业务是否存在
            begin
               if (data.qryLocOutItemCasing.DataSource=nil) and (data.qryLocOutItemCasing.Active) then
                  data.qryLocOutItemCasing.Close;
               data.qryLocOutItemCasing.DataSource:=data.dtsOut;
               data.qryLocOutItemCasing.Active:=true;
            end;
         end;
         if pgcLocationINOUT.ActivePage=tbsAutoCost then
         begin
            if (data.qryautocountcostout.DataSource=nil) and (data.qryautocountcostout.Active) then
               data.qryautocountcostout.Close;
            data.qryautocountcostout.DataSource:=data.dtsOut;
            data.qryautocountcostout.Active:=true;
         end;

      end;
   end else
   begin
      if (data.qryLocationOut.DataSource=nil) and (data.qryLocationOut.Active) then
         data.qryLocationOut.Close;
      data.qryLocationOut.DataSource:=data.dtsOut;
      data.qryLocationOut.Active:=true;
      if (data.qryLocationOutItem.DataSource=nil) and (data.qryLocationOutItem.Active) then
         data.qryLocationOutItem.Close;
      data.qryLocationOutItem.DataSource:=data.dtsOut;
      data.qryLocationOutItem.Active:=true;
      if (data.qryLocationOutDetail.DataSource=nil) and (data.qryLocationOutDetail.Active) then
         data.qryLocationOutDetail.Close;
      data.qryLocationOutDetail.DataSource:=data.dtsOut;
      data.qryLocationOutDetail.Active:=true;
      //locoutskudetail
{      if (data.qryLocOutSkudetail.DataSource=nil) and (data.qryLocOutSkudetail.Active) then
         data.qryLocOutSkudetail.Close;
      data.qryLocOutSkudetail.DataSource:=data.dtsOut;}

      if tbsCasing.TabVisible then
      begin
         if (data.qryLocOutItemCasing.DataSource=nil) and (data.qryLocOutItemCasing.Active) then
            data.qryLocOutItemCasing.Close;
         data.qryLocOutItemCasing.DataSource:=data.dtsOut;
         data.qryLocOutItemCasing.Active:=true;
      end;
      if (data.qryautocountcostout.DataSource=nil) and (data.qryautocountcostout.Active) then
         data.qryautocountcostout.Close;
      data.qryautocountcostout.DataSource:=data.dtsOut;
      data.qryautocountcostout.Active:=true;
   end;
{   end else
   begin
      data.qryLocationout.DataSource       :=nil;
      data.qryLocationoutItem.DataSource   :=nil;
      data.qryLocationoutDetail.DataSource :=nil;
      data.qryLocOutItemCasing.DataSource  :=nil;
   end;}
end;

procedure TfrmLocationOut.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
   btnOper.Visible:=ItemDetailEdit.Enabled;
   mitEdit.Visible:=btnOper.Visible;
   btnAppend.Visible:=btnAppend.Enabled;
   btnDelete.Visible:=btnDelete.Enabled;
   dtdOperationDate.Enabled:=false;
   timOperationDate.Enabled:=false;

   if DataState=stInsert then btnTotal.Visible:=False else btnTotal.Visible:=True;
   if _isCasing<>'T' then tbsCasing.TabVisible:=False;
   if strSysCus<>'WYFQ' then
   tbsautoCost.Enabled:=blnCostRate;
   if strFlow='ITEM' then
   begin
      grdLocationOutDetailReadOnly  :=true;
      mitAddLocationINOUTDetail.Enabled:=False;
      mitDelLocationINOUTDetail.Enabled:=False;
      mitRelocation.Visible:=false;
   end else
   if strFlow='DETAIL' then
   begin
      dtdTaskDate.ReadOnly:=true;
      timTaskDate.ReadOnly:=true;
      edtIUser.ReadOnly   :=True;
      btnAdd.Visible      :=false;
      grdLocationOutDetailReadOnly  :=False;  //lqs 09.27    //实际直接控制detail
      grdLocationINOUTItemReadOnly:=true;
      mitAddLocItem.Visible:=False;
      mitdelLocINItem.Visible:=false;
      mitTotalDetail.Visible:=false;
      mitINCOWork.Visible:=false;
      edtCostCus.ReadOnly:=True;
      grdAutoCost.Enabled:=false;
   end;
   if not (DataState in Setdcs) then
   begin
      btnTotal.Visible:=False;
      btnOper.Visible:=false;
   end else
   begin
      if strflow='ITEM' then
      begin
         if (data.qrylocationout.FieldByName('operationname').AsString<>'') then
         begin  //已拣货的任务数据不能修改
            edtIUser.ReadOnly:=True;
         end else
            edtIUser.ReadOnly:=False;
         dtdTaskDate.setfocus;
      end;
   end;
end;

procedure TfrmLocationOut.btnBrowMxClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmLocationOut.btnBrowGlClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmLocationOut.btnRefreshClick(Sender: TObject);
var
   strJobno:string;
   qryTmp:TKADOQuery;
   arrData:Variant;
begin
   strJobno     :=data.qryOut.FieldByName('Jobno').AsString;
   if Sender = btnRefresh then
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
//         SetDetailActive(False,false);
         SetMasterDetailState(false);
         blnqryOutChange:=False;
      end;
      data.qryOut.Close;

      data.qryOut.Open;
      data.qryOut.DisableControls;
      if not data.qryOut.Locate('Jobno',
                          VarArrayOf([strJobno]),
                          [loCaseInsensitive, loPartialKey]) then
      begin
         data.qryOut.Last;
         grdLocationOutChangeNodeEx(nil);
      end;
      data.qryOut.EnableControls;
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetDetailActive(False,True);
         blnqryOutChange:=True;
      end;
      WorkCall(stBrowse);
   end else
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetMasterDetailState(false);
//         SetDetailActive(False,false);
         blnqryOutChange:=False;
      end;
      qryTmp:=TKADOQuery.Create(Application);
      qryTmp.Connection :=_ADOConnection;
      qryTmp.Sql.Text:=data.qryOut.Sql.Text;
      qryTmp.SQL.Text:='ksp_GetLocationoutMasterbyjobno @jobno="'+strjobno+'",'
                      +'                         @userid="'+_userid+'",'
                      +'                         @useridcan='''+_Useridcan+''','
                      +'                         @strfilter="1=1"';
      qryTmp.Open;
      arrData:=ScatterToArray(qryTmp,True,0);
      GatherFromArray(data.qryOut,arrData,false);
      data.qryOut.ApplyUpdates;
      qryTmp.Free;
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetDetailActive(False,True);
         blnqryOutChange:=True;
      end;
      WorkCall(stBrowse);
   end;
end;

procedure TfrmLocationOut.btnEditClick(Sender: TObject);
//  GetLocation:TGetLocation;
begin
   if pgcMain.ActivePage<>tbsBrowse then pgcMain.ActivePage:=tbsBrowse;
   btnRefreshClick(btnEdit);
   if (Sender<>btnAppend) then
   if not CheckModifyMode('E',True) then Exit;
   blnMainPage:=False;
   blnqryOutChange:=False;
   blnItemPage:=False;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   //dwq 2009.3.6
   if (not skuoutcontrol) and (_StrSysCus='SWZ') then Exit;
   

   if (ItemDetailEdit.Enabled) and (data.qryOut.FieldByName('createname').AsString='')
     and (data.qryLocationOutItem.FieldByName('Jobno').AsString='') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='任务商品资料不完整,不能执行该操作!'
      else _strmessage:='任务商品资料不完整,不能执行该操作!';}
      kMessageDlg(GetMessage('frmLocationOut','009'), mtWarning, [mbOK], 0);
      exit;
   end;

   SetMasterDetailState(false);
   WorkCall(stEdit);
//by whl 控制追加时不允许修改
   if (Sender=btnAppend) then
   btnOper.Enabled:=False;

   if (strFlow='ITEM') and (data.qryLocationOut.fieldbyname('operationname').asstring<>'') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='商品数量任务与实际不一致，您需要将实际的数量赋给任务吗?'
      else _strmessage:='商品数量任务与实际不一致，您需要将实际的数量赋给任务吗?';}
      if not CompareTaskItem('EQ') and
        (KmessageDlg(GetMessage('frmLocationOut','010'),mtConfirmation,[mbYes,mbNo],0)=mrYes)
      then CompareTaskItem('VA');
   end;
   if (Sender=mitEdit) and (ItemDetailEdit.Enabled) then btnOperClick(mitOper);
   if _isoriinfo='T' then
   begin
      ExecSql(datatmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                            +'     where id=object_id("tempdb..#lskorderItemout") and sysstat & 0xf=3) '+chr(13)+chr(10)
                            +'   drop table #lskorderItemout '+chr(13)+chr(10)
                            +'   CREATE TABLE #lskorderItemout '+chr(13)+chr(10)
                            +'     ('+chr(13)+chr(10)
                            +'           jobnoop        varchar(20)  not null ,'+chr(13)+chr(10)
                            +'           snoop          smallint     not null , '+chr(13)+chr(10)
                            +'           jobnoori        varchar(20) null ,'+chr(13)+chr(10)
                            +'     )');
       ExecSql(datatmp.qryTmp,'  ksp_OriInfoLocationout '+data.qryOut.fieldbyname('jobno').AsString+',"P"');
    end;
end;

procedure TfrmLocationOut.btnAddClick(Sender: TObject);
begin
   ScrollAfterEdit:=True;
   blnqryOutChange:=False;
   blnItemPage:=False;
   blnMainPage:=False;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if _paper='T' then
   begin
      with WorkLocationbillno('-1') do
      if OkFlag then
      begin
         strcusid:=strcostcusid;
         strcusname:=strcostcusname;
         strlocno:=strlocationbillno;
      end else
      begin
         blnqryOutChange:=True;
         blnItemPage:=True;
         blnMainPage:=True;
         Exit;
      end;
   end;
   WorkCall(stInsert);
   if _paper='T' then
   begin
      GetCusCnfg;
      if data.qrylocationout.FieldByName('iuserid').AsString='' then
      begin
         data.qrylocationout.FieldByName('iuserid').AsString:=_Userid;
         data.qrylocationout.FieldByName('iusername').AsString:=_Username;
      end;
   end;
   SetMasterDetailState(false);
end;

procedure TfrmLocationOut.btnDeleteClick(Sender: TObject);
var
   strojobno:string;  //lorderopinfo相关,记录当前jobno
begin
   if Sender<>btnDelete then
   begin
      if data.qryOut.FieldByName('operationname').AsString='' then
      begin
         {if _Language='CAPTIONC' then
            _strmessage:='该笔还未产生出货,无法取消!'
         else
            _strmessage:='该笔还未产生出货,无法取消!';}
         KMessageDlg(GetMessage('frmLocationOut','011'),mtWarning,[mbyes],0);
         exit;
      end;
   end;
   if pgcMain.ActivePage<>tbsBrowse then pgcMain.ActivePage:=tbsBrowse;
   btnRefreshClick(btnEdit);
   if not CheckModifyMode('D',IIF(Sender=btnDelete,True,False)) then exit;//判断是否能修改删除
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if Sender=btnDelete then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该操作将删除该笔资料的所有内容，您确定吗?'
      else }
         _strmessage:=_strdel;
   end else
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该操作将取消该笔实际出货，您确定吗?'
      else
         _strmessage:='该操作将取消该笔实际出货，您确定吗?';}
         _strmessage:=GetMessage('frmLocationOut','012');
   end;
   if KmessageDlg(_strmessage,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      strojobno:=data.qryout.FieldByName('jobno').AsString;
      SetMasterDetailState(false);
//                  SetDetailActive(False,false);
//为了控制库存 ,创建临时表，用于保存原始状态的工作号
      droplsk('#lskOldItemWBKNCF');
      ExecSql(dataTmp.qryTmp,'  select  jobnoin,snoin,jobnoorder,snoorder into #lskOldItemWBKNCF from locationoutItem(nolock)  '+chr(13)+chr(10)
                            +'   where jobno="'+data.qryout.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                             );
      if _isCasing='T' then
      begin
         droplsk('#lskOldcasing');
         ExecSql(dataTmp.qryTmp,'  select  jobnoin,snoin into #lskOldcasing from locationoutItemcasing(nolock)  '+chr(13)+chr(10)
                               +'   where jobno="'+data.qryout.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                                );
      end;
      if _isoriinfo='T' then //跟踪指令信息
      begin
         ExecSql(datatmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                               +'     where id=object_id("tempdb..#lskorderItemout") and sysstat & 0xf=3) '+chr(13)+chr(10)
                               +'   drop table #lskorderItemout '+chr(13)+chr(10)
                               +'   CREATE TABLE #lskorderItemout '+chr(13)+chr(10)
                               +'     ( '+chr(13)+chr(10)
                               +'           jobnoop        varchar(20)  not null ,'+chr(13)+chr(10)
                               +'           snoop          smallint     not null ,'+chr(13)+chr(10)
                               +'           jobnoori        varchar(20) null ,'+chr(13)+chr(10)
                               +'     )');
         ExecSql(datatmp.qryTmp,'  ksp_OriInfoLocationout '+strojobno+',"P"');
      end;
      if Sender<>btnDelete then
      begin
         droplsk('#lskOldDetail');
         ExecSql(dataTmp.qryTmp,'  select jobnoin,snoin,ldsnoin into #lskOldDetail  from locationoutdetail(nolock)  '+chr(13)+chr(10)
                               +'   where jobno="'+data.qryout.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                                );
      end;

      _ADOConnection.startTransaction;
      try
         if Sender=btnDelete then
         begin
           //处理日志
           if _isuserhist='T' then
           begin
              strHistMessage:='  仓单号-'+data.qryLocationout.FieldByName('locationbillno').Asstring
                             +'  客户单号-'+data.qryLocationout.FieldByName('cusbillno').Asstring
                             +'  费用关系人-'+data.qryLocationout.FieldByName('costcusname').Asstring;
              if strHistMessage<>'' then
               execsql(dataTmp.qryTmp,'insert into UserHist '
                             +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                             +' values ("'+_LoginName+'",getdate(),"'+data.qryLocationout.FieldByName('jobno').Asstring+'","' +strHistMessage+'","出仓任务","删除")');
           end;
            ExecSql(dataTmp.qryTmp,' delete from locationoutitem '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationout '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationinoutcon '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationinoutconsku '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from locoutskudetail '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
//                                  +'    and operationtype=-1 '
                                  +' delete from locationoutitemcasing '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from autocountcost '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from genjobno '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from costitem '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' delete from warecostrate '
                                  +'  where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                                  +' update skudetailout '          //配货
                                  +'    set jobnoout=null '
                                  +'  where jobnoout="'+data.qryOut.fieldbyname('jobno').AsString+'"'
                    );
            //lzw20090630
            if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
            ExecSql(dataTmp.qryTmp,' delete from forkworkload '
                                  +'  where jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" '
                    );
            kspLocationOutItem(data.qryOut.FieldByName('Jobno').AsString,'T');
            if _isCasing='T' then kspLocationOutCasing(data.qryOut.FieldByName('Jobno').AsString,'T');
//            kspLocationOutskudetail(data.qryOut.fieldbyname('jobno').AsString,'','T');
            data.qryout.delete;
            data.qryOut.Applyupdates;
         end else
         begin
            //处理日志
            if _isuserhist='T' then
            begin
               strHistMessage:='  仓单号-'+data.qryLocationout.FieldByName('locationbillno').Asstring
                              +'  客户单号-'+data.qryLocationout.FieldByName('cusbillno').Asstring
                              +'  费用关系人-'+data.qryLocationout.FieldByName('costcusname').Asstring;
               if strHistMessage<>'' then
                 execsql(dataTmp.qryTmp,'insert into UserHist '
                               +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                               +' values ("'+_LoginName+'",getdate(),"'
                               +data.qryLocationout.FieldByName('jobno').Asstring+'","'
                               +strHistMessage+'","出仓任务","取消上架")');
            end;
            //lzw20100520之前只处理了detail，为什么没处理locoutskudetail
            ExecSql(datatmp.qryTmp,'delete from  LocationoutDetail'
                          +'         where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" '
                          +'        delete from  LocoutskuDetail'
                          +'         where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" '
                          +'        update LocoutskuDetail set ldsno=-1'
                          +'         where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" ');
            ExecSql(datatmp.qryTmp,'update LocationoutItem '
                           +'       set quantity=0,piece=0,volume=0,netweight=0,grossweight=0,area=0,'
                           +'           casing1=0,casing2=0,casing3=0,casing4=0,casing5=0,costquantity=0,'
                           +'           OperationDate=null,operationname="" '
                           +' where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" ');
            data.qrylocationout.Edit;
            data.qrylocationout.FieldByName('operationname').AsString:='';
            data.qrylocationout.FieldByName('OperationDate').Clear;
            data.qryOut.Edit;
            data.qryOut.FieldByName('operationname').AsString:='';
            data.qryOut.FieldByName('OperationDate').Clear;
            data.qrylocationout.Applyupdates;
            data.qryOut.Applyupdates;
            kspLocationOutDetail(data.qryOut.FieldByName('Jobno').AsString,'T');
           //是否可以简化,不需要检验Item??
            kspLocationOutItem(data.qryOut.FieldByName('Jobno').AsString,'T');
            //lzw20100820维护明细写得有问题，先改Ekun
            if (getSysdata('qdtext')='T') and (_strsyscus='XT') then
            begin
               OpenSql(qryTmp,'ksp_whlocinskudetail @jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" ' );
            end else
            begin
               kspLocationOutskudetail(data.qryOut.fieldbyname('jobno').AsString,'','T');
            end;

            ExecSql(datatmp.qryTmp,'update  locoutskudetail set ldsno=-11'
                          +' where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" ');
            //
            if (_strSysCus='JG') then
            ExecSql(datatmp.qryTmp,'update locationout set outid="F"   '
                          +' where Jobno="'+data.qryOut.FieldByName('Jobno').AsString+'" ');

            droplsk('#lskOldDetail');
         end;
         droplsk('#lskOldItemWBKNCF');
         if _isCasing='T' then
            droplsk('#lskOldCasing');
         if _isoriinfo='T' then
         ExecSql(datatmp.qryTmp,' ksp_OriInfoLocationout '+strojobno+',"E"');
         _ADOConnection.Commit;
      except
        try
          if _ADOConnection.InTransaction then _ADOConnection.RollBack;
        except
        end;
        SetDetailActive(False,True);
        WorkCall(stBrowse);
        raise;
        exit;
      end;
      data.qryout.CommitUpdates;
      //lzw20101101
      if _strsyscus='XT' then
      begin
         execsql(datatmp.qryTmp2,'    if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'               where id=object_id("tempdb..#lskindetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'  drop table #lskindetail         '+chr(13)+chr(10)
                                +'select insku.jobno,insku.sno,insku.ldsno,insku.detailsno,                      '+chr(13)+chr(10)
                                +'       insku.quantity,insku.quantityremain,outsum=sum(isnull(outsku.quantity,0)) '+chr(13)+chr(10)
                                +'  into #lskindetail                                                '+chr(13)+chr(10)
                                +'  from locinskudetail insku(nolock),locoutskudetail outsku(nolock)       '+chr(13)+chr(10)
                                +' where insku.jobno=outsku.jobnoin                                        '+chr(13)+chr(10)
                                +'   and insku.sno=outsku.snoin                                            '+chr(13)+chr(10)
                                +'   and insku.ldsno=outsku.ldsnoin                                        '+chr(13)+chr(10)
                                +'   and insku.detailsno=outsku.detailsnoin                                '+chr(13)+chr(10)
                                +' group by insku.jobno,insku.sno,insku.ldsno,insku.detailsno,insku.quantity,insku.quantityremain  '+chr(13)+chr(10)
                                +'update locinskudetail set                                          '+chr(13)+chr(10)
                                +'       quantityremain=insku.quantity-insku.outsum                        '+chr(13)+chr(10)
                                +'  from #lskindetail insku                                             '+chr(13)+chr(10)
                                +' where insku.jobno=locinskudetail.jobno                               '+chr(13)+chr(10)
                                +'   and insku.sno=locinskudetail.sno                                   '+chr(13)+chr(10)
                                +'   and insku.ldsno=locinskudetail.ldsno                               '+chr(13)+chr(10)
                                +'   and insku.detailsno=locinskudetail.detailsno                       '+chr(13)+chr(10)
                                +'   and isnull(insku.quantity,0)-isnull(insku.outsum,0)<> isnull(insku.quantityremain,0) '+chr(13)+chr(10)
                                +'update locinskudetail set                                                '+chr(13)+chr(10)
                                +'       quantityremain=quantity                                           '+chr(13)+chr(10)
                                +' where not exists(select 1 from locoutskudetail(nolock)                  '+chr(13)+chr(10)
                                +'                   where locinskudetail.jobno=locoutskudetail.jobnoin    '+chr(13)+chr(10)
                                +'                     and locinskudetail.sno=locoutskudetail.snoin        '+chr(13)+chr(10)
                                +'                     and locinskudetail.ldsno=locoutskudetail.ldsnoin    '+chr(13)+chr(10)
                                +'                     and locinskudetail.detailsno=locoutskudetail.detailsnoin  '+chr(13)+chr(10)
                                +'                   )                                                      '+chr(13)+chr(10)
                                +'   and isnull(locinskudetail.quantity,0)<> isnull(locinskudetail.quantityremain,0) '+chr(13)+chr(10)
                                //lzw20120227
                                +'   and len(locinskudetail.jobno)=20    '+chr(13)+chr(10)
                 );
      end;
      SetDetailActive(False,True);
      WorkCall(stBrowse);
   end;
end;

procedure TfrmLocationOut.btncopyClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   arrLocationINOUT:=ScatterToArray(data.qryLocationOut,True,0);
   arrLocationoutItem:=ScatterToArray(data.qryLocationOutItem,False,0);
   blnCopy:=True;
   WorkCall(stInsert);
end;

procedure TfrmLocationOut.btnFindClick(Sender: TObject);
var
   Para:TFindPara;
begin
//  if pgcMain.ActivePage<>tbsBrowse then  pgcMain.ActivePage:=tbsBrowse;
   Para:=TFindPara.Create;

   Para.Tables.Add('locationout inout');

{0}  Para.Field.Add('inout.locationbillno');
{0}  Para.Toptic.Add('仓 单 号');
{0}  Para.Ftype.Add('C');

{1}   Para.Field.Add('inout.mainorder');
{1}   Para.Toptic.Add('主订单号');
{1}   Para.Ftype.Add('C');

{2}   Para.Field.Add('inout.costcusid');
{2}   Para.Toptic.Add('费用关系人');
{2}   Para.Ftype.Add('E');

{3}   Para.Field.Add('inout.cusbillno');
{3}   Para.Toptic.Add('客户单号');
{3}   Para.Ftype.Add('C');

{4}   Para.Field.Add('inout.customsno');
{4}   Para.Toptic.Add('报关单号');
{4}   Para.Ftype.Add('C');

{5}  Para.Field.Add('inout.blno');
{5}  Para.Toptic.Add('提 单 号');
{5}  Para.Ftype.Add('C');

{6}   Para.Field.Add('inout.iuserid');
{6}   Para.Toptic.Add('执行部门');
{6}   Para.Ftype.Add('E');

{7}   Para.Field.Add('inout.skucostclasscd');
{7}   Para.Toptic.Add('商 品 类');
{7}   Para.Ftype.Add('B');

{8}   Para.Field.Add('inout.loadtype');
{8}   Para.Toptic.Add('是否整柜');
{8}   Para.Ftype.Add('B');

{9}   Para.Field.Add('inout.isbond');
{9}   Para.Toptic.Add('是否保税');
{9}   Para.Ftype.Add('B');

{10}   Para.Field.Add('inout.opid');
{10}   Para.Toptic.Add('业务员');
{10}   Para.Ftype.Add('E');

{11}   Para.Field.Add('inout.skuname');
{11}   Para.Toptic.Add('商品名称');
{11}   Para.Ftype.Add('C');

{12}  Para.Field.Add('convert(datetime,convert(char(10),inout.taskdate,102))');
{12}  Para.Toptic.Add('计划日期');
{12}  Para.Ftype.Add('D');

{13}  Para.Field.Add('inout.countcontcost');
{13}  Para.Toptic.Add('包干标志');
{13}  Para.Ftype.Add('B');

{14}  Para.Field.Add('inout.contwithloca');
{14}  Para.Toptic.Add('包仓标志');
{14}  Para.Ftype.Add('B');

{15}  Para.Field.Add('inout.warerentcounttype');
{15}  Para.Toptic.Add('仓租计算方式');
{15}  Para.Ftype.Add('B');

{16}  Para.Field.Add('convert(datetime,convert(char(10),inout.operationdate,102))');
{16}  Para.Toptic.Add('出货日期');
{16}  Para.Ftype.Add('D');

{17}  Para.Field.Add('inout.createname');
{17}  Para.Toptic.Add('创 建 人');
{17}  Para.Ftype.Add('C');

{18}  Para.Field.Add('inout.operationname');
{18}  Para.Toptic.Add('出 货 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.checkname');
{19}  Para.Toptic.Add('审 核 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.jobno');
{20}  Para.Toptic.Add('工作单号');
{20}  Para.Ftype.Add('C');

{21}  Para.Field.Add('inout.conno');
{21}  Para.Toptic.Add('柜号');
{21}  Para.Ftype.Add('C');

   Para.RField.Add('INOUT.jobno');
   _qrymacroout:=_qrymacroout+strisyearctrl;
   Para.Filter:=' '
               +' and '+_qrymacroout
               +IIF(_Useridcan<>'',
               ' and (userid in '+_Useridcan+' or iuserid in'+_Useridcan+' )',
               ' and (userid like "'+_Userid+'%" or iuserid like "'+_Userid+'%")')
               +iif(trim(strJobno)='','',' and inout.jobno="'+strJobno+'" ');

   Para.OnGetValue:=FindGetValue;
   Dofind(data.qryOut,dataTmp.qryFind,Para,FindItem);
//   Dofind(data.qryOut,dataTmp.qryFind,Para,TFindItem(nil));
end;

procedure TfrmLocationOut.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryOut,datatmp.qryfind);
end;

procedure TfrmLocationOut.btnFilterClick(Sender: TObject);
var
   Para:TFindPara;
   StrTmp:String;
begin
//  if pgcMain.ActivePage<>tbsBrowse then  pgcMain.ActivePage:=tbsBrowse;
   Para:=TFindPara.Create;

   Para.Tables.Add('locationout inout');

{0}  Para.Field.Add('inout.locationbillno');
{0}  Para.Toptic.Add('仓 单 号');
{0}  Para.Ftype.Add('C');

{1}   Para.Field.Add('inout.mainorder');
   if strSysCus='SHRL' then
      {1}   Para.Toptic.Add('海关进库号')
   else
      {1}   Para.Toptic.Add('主订单号');
{1}   Para.Ftype.Add('C');

{2}   Para.Field.Add('inout.costcusid');
{2}   Para.Toptic.Add('费用关系人');
{2}   Para.Ftype.Add('E');

{3}   Para.Field.Add('inout.cusbillno');
      if _StrSysCus<>'WYFQ' then
{3}   Para.Toptic.Add('客户单号')
      else
{3}   Para.Toptic.Add('调拨单号');
{3}   Para.Ftype.Add('C');

{4}   Para.Field.Add('inout.customsno');
{4}   Para.Toptic.Add('报关单号');
{4}   Para.Ftype.Add('C');

{5}  Para.Field.Add('inout.blno');
{5}  Para.Toptic.Add('提 单 号');
{5}  Para.Ftype.Add('C');

{6}   Para.Field.Add('inout.iuserid');
{6}   Para.Toptic.Add('执行部门');
{6}   Para.Ftype.Add('E');

{7}   Para.Field.Add('inout.skucostclasscd');
{7}   Para.Toptic.Add('商 品 类');
{7}   Para.Ftype.Add('B');

{8}   Para.Field.Add('inout.loadtype');
{8}   Para.Toptic.Add('是否整柜');
{8}   Para.Ftype.Add('B');

{9}   Para.Field.Add('inout.isbond');
{9}   Para.Toptic.Add('是否保税');
{9}   Para.Ftype.Add('B');

{10}   Para.Field.Add('inout.opid');
{10}   Para.Toptic.Add('业务员');
{10}   Para.Ftype.Add('E');

{11}   Para.Field.Add('inout.skuname');
{11}   Para.Toptic.Add('商品名称');
{11}   Para.Ftype.Add('C');

{12}  Para.Field.Add('convert(datetime,convert(char(10),inout.taskdate,102))');
{12}  Para.Toptic.Add('计划日期');
{12}  Para.Ftype.Add('D');

{13}  Para.Field.Add('inout.countcontcost');
{13}  Para.Toptic.Add('包干标志');
{13}  Para.Ftype.Add('B');

{14}  Para.Field.Add('inout.contwithloca');
{14}  Para.Toptic.Add('包仓标志');
{14}  Para.Ftype.Add('B');

{15}  Para.Field.Add('inout.warerentcounttype');
{15}  Para.Toptic.Add('仓租计算方式');
{15}  Para.Ftype.Add('B');

{16}  Para.Field.Add('convert(datetime,convert(char(10),inout.operationdate,102))');
{16}  Para.Toptic.Add('出货日期');
{16}  Para.Ftype.Add('D');

{17}  Para.Field.Add('inout.createname');
{17}  Para.Toptic.Add('创 建 人');
{17}  Para.Ftype.Add('C');

{18}  Para.Field.Add('inout.operationname');
{18}  Para.Toptic.Add('出 货 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.checkname');
{19}  Para.Toptic.Add('审 核 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.jobno');
{20}  Para.Toptic.Add('工作单号');
{20}  Para.Ftype.Add('C');

{21}  Para.Field.Add('inout.conno');
{21}  Para.Toptic.Add('柜号');
{21}  Para.Ftype.Add('C');

 if strSysCus='JG' then
 begin
  {22} para.field.add('inout.routing');
   {22}  Para.Toptic.add('目 的 地');
   {22}  para.Ftype.add('C');
 end;  //lihl 2012.05.08

   Para.Exp.Add('');

   Para.OnGetValue:=FindGetValue;
   Para.OnGetSql := FindGetSql;

   StrTmp:=DoFilter(Para, FindItem );

   if strTmp<>'null' then
   begin
      data.qryOut.Close;
      data.qryOut.DisableControls;
      if (_Loginid<>'SYSTEM') and (not blnop)  and(_strSysCus<>'JG') then
      begin
          _qrymacroout:=IIF(strTmp<>'',StrTmp,'1=1')+'and inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'"'
      end else
      _qrymacroOut:=IIF(strTmp<>'',StrTmp,'1=1');
      _qrymacroout:=_qrymacroout+strisyearctrl;

{      data.qryOut.sql.Text:='ksp_GetLocationoutMasterbyjobno @jobno="",'
                          +'                         @userid="'+_userid+'",'
                          +'                         @useridcan='''+_Useridcan+''','
                          +'                         @strfilter='''+_qrymacroOut+'''';}
      data.qryOut.MacroByName('where').AsString:=''''+_qrymacroout+'''';          //by whl

      data.qryOut.Open;
      data.qryOut.EnableControls;
   end;
   WorkCall(stBrowse);
end;

procedure TfrmLocationOut.btnSaveClick(Sender: TObject);
var
   strCreateID,strJobno:string;
   blnSuc:Boolean;

   Stime:Tdatetime;
   strtimemessage:string;
begin
   Stime:=time;

   blnSuc:=true;
   if (DataState in Setdcs) and Gather then  //新增或 编辑存盘
   begin

      strtimemessage:='gather:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
      stime:=time;

      try
         while True do
         begin
            try
            //处理日志
               if _isuserhist='T' then
               begin
                  if DataState=stInsert then
                  begin
                    strHistMessage:='  费用关系人-'+data.qryLocationout.FieldByName('CostCusName').AsString
                                   +'  仓单号-'+data.qryLocationout.FieldByName('LocationBillNO').AsString
                                   +'  执行组织-'+data.qryLocationout.FieldByName('IuserName').AsString
                                   +'  商品类-'+data.qryLocationout.FieldByName('skucostclasscd').AsString
                                   +'  客户单号-'+data.qryLocationout.FieldByName('cusbillno').AsString
                                   +'  报关单号-'+data.qryLocationout.FieldByName('customsno').AsString
                                   +'  仓租方式-'+data.qryLocationout.FieldByName('warerentcounttype').AsString
                                   +'  计算仓租-'+data.qryLocationout.FieldByName('countrent').AsString;
                  end else
                  begin
                     if VarToStr(data.qryLocationout.FieldByName('LocationBillNO').OldValue)<>data.qryLocationout.FieldByName('LocationBillNO').AsString then
                        strHistMessage:='  仓单号-'+VarToStr(data.qryLocationout.FieldByName('LocationBillNO').OldValue)+' →'+data.qryLocationout.FieldByName('LocationBillNO').AsString
                     else
                        strHistMessage:=strHistMessage
                                    +'  仓单号-'+data.qryLocationout.FieldByName('LocationBillNO').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('CostCusName').OldValue)<>data.qryLocationout.FieldByName('CostCusName').AsString then
                        strHistMessage:=strHistMessage
                                    +'  费用关系人-'+VarToStr(data.qryLocationout.FieldByName('CostCusName').OldValue)+' →'+data.qryLocationout.FieldByName('CostCusName').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('IuserName').OldValue)<>data.qryLocationout.FieldByName('IuserName').AsString then
                        strHistMessage:=strHistMessage
                                    +'  执行组织-'+VarToStr(data.qryLocationout.FieldByName('IuserName').OldValue)+' →'+data.qryLocationout.FieldByName('IuserName').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('skucostclasscd').OldValue)<>data.qryLocationout.FieldByName('skucostclasscd').AsString then
                        strHistMessage:=strHistMessage
                                    +'  商品类-'+VarToStr(data.qryLocationout.FieldByName('skucostclasscd').OldValue)+' →'+data.qryLocationout.FieldByName('skucostclasscd').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('cusbillno').OldValue)<>data.qryLocationout.FieldByName('cusbillno').AsString then
                        strHistMessage:=strHistMessage
                                    +'  客户单号-'+VarToStr(data.qryLocationout.FieldByName('cusbillno').OldValue)+' →'+data.qryLocationout.FieldByName('cusbillno').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('customsno').OldValue)<>data.qryLocationout.FieldByName('customsno').AsString then
                        strHistMessage:=strHistMessage
                                    +'  报关单号-'+VarToStr(data.qryLocationout.FieldByName('customsno').OldValue)+' →'+data.qryLocationout.FieldByName('customsno').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('warerentcounttype').OldValue)<>data.qryLocationout.FieldByName('warerentcounttype').AsString then
                        strHistMessage:=strHistMessage
                                    +'  仓租方式-'+VarToStr(data.qryLocationout.FieldByName('warerentcounttype').OldValue)+' →'+data.qryLocationout.FieldByName('warerentcounttype').AsString;
                     if VarToStr(data.qryLocationout.FieldByName('countrent').OldValue)<>data.qryLocationout.FieldByName('countrent').AsString then
                        strHistMessage:=strHistMessage
                                    +'  计算仓租-'+VarToStr(data.qryLocationout.FieldByName('countrent').OldValue)+' →'+data.qryLocationout.FieldByName('countrent').AsString;
                  end;
               end;
               _ADOConnection.Starttransaction;
               arrLocationINOUT:=ScatterToArray(data.qryLocationOut,true,0);
               data.qryLocationOut.ApplyUpdates;
               Break;
            except
               _ADOConnection.Rollback; //先结束事务
               if Error.HandleException(Exception(ExceptObject),data.udsLocationin.InsertSql.text)=Re_KeyRepeat then
               begin
                  blnSuc:=False;
                  WorkSaveGet(data.qryLocationOut.FieldByName('Jobno').AsString +GetMessage('frmLocationOut','013'));// '工作号''已经被使用。程序正在查找其他可用代码...'
                  Application.processmessages;
                  if not frmSave.stopflag then
                  begin
                    strCreateID := genJobno('LO');
                    if strCreateID = '' then
                    begin
                      KmessageDlg(GetMessage('frmLocationOut','014'), mtInformation, [mbOk], 0);//'没有可用的代码或网络忙，请稍侯重试或联系系统管理员.'
                      frmSave.stopflag := True;
                      Break;
                    end else
                    begin
                      data.qryLocationOut.Edit;
                      data.qryLocationOut.FieldByName('Jobno').AsString := strCreateID;
                      //赋业务联系单号
                      opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                                    +'  from genjobno where substring(docno1,1,2)="CC" '
                                    +'  and substring(docno1,3,4)="'+copy(datetostr(date),1,4)+'"' );
                      data.qryLocationOut.FieldByName('LocationBillNO').Asstring:='CC'+copy(datetostr(date),1,4)
                                                                              +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
                      data.qryOut.Edit;
                      data.qryOut.FieldByName('Jobno').AsString := strCreateID;
                      data.qryOut.FieldByName('LocationBillNO').AsString := data.qryLocationOut.FieldByName('LocationBillNO').Asstring;
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
                 lblError.caption := '找到可用代码' + strCreateID + '，该代码改为' + strCreateID + '。';
                 btnCancel.visible := false;
                 btnOk.visible := true;
                 free;
               end;
            end;
         end;
         if not blnSuc then
         begin
            data.qryOut.edit;
            data.qryOut.fieldbyname('Jobno').asstring:=strCreateID;
            //data.qryLocationOutDetail复制
            data.qryLocationOutDetail.DisableControls;
            data.qryLocationOutDetail.Filtered:=False;
            data.qryLocationOutDetail.First;
            while not data.qryLocationOutDetail.Eof do
            begin
               data.qryLocationOutDetail.Edit;
               data.qryLocationOutDetail.FieldByName('Jobno').AsString:=strCreateID;
               data.qryLocationOutDetail.next;
            end;
            data.qryLocationOutDetail.First;
            data.qryLocationOutDetail.Filtered:=True;
            data.qryLocationOutDetail.EnableControls;
            //data.qryLocationOutItem复制
            data.qryLocationOutItem.DisableControls;
            data.qryLocationOutItem.First;
            while not data.qryLocationOutItem.Eof do
            begin
               data.qryLocationOutItem.Edit;
               data.qryLocationOutItem.FieldByName('Jobno').AsString:=strCreateID;
               data.qryLocationOutItem.next;
            end;
            data.qryLocationOutItem.First;
            data.qryLocationOutItem.EnableControls;
            if _isCasing='T' then
            begin
               data.qryLocOutItemCasing.DisableControls;
               data.qryLocOutItemCasing.First;
               while not data.qryLocOutItemCasing.Eof do
               begin
                  data.qryLocOutItemCasing.Edit;
                  data.qryLocOutItemCasing.FieldByName('Jobno').AsString:=strCreateID;
                  data.qryLocOutItemCasing.next;
               end;
               data.qryLocOutItemCasing.First;
               data.qryLocOutItemCasing.EnableControls;
            end;
            data.qryautocountcostout.DisableControls;
            data.qryautocountcostout.First;
            while not data.qryautocountcostout.Eof do
            begin
               data.qryautocountcostout.Edit;
               data.qryautocountcostout.FieldByName('Jobno').AsString:=strCreateID;
               data.qryautocountcostout.next;
            end;
            data.qryautocountcostout.First;
            data.qryautocountcostout.EnableControls;
         end;
         m_blnPost := True;
 //        m_blnPost := False;
         //新增时不对删除商品明细做删除前库存更新
         if DataState<>stinsert then
         begin
            strSql:=strDel_Task;
            strSql:=iif(strSql='',strDel_detail,IIF(strDel_detail='',strSql,strSql+' or '+strDel_detail));
            strsql:=iif(strSql='',strDel_skudetail,IIF(strDel_skudetail='',strSql,strSql+' or '+strDel_skudetail));
            if strsql<>'' then
                kspLocationOutskudetail(data.qryOut.fieldbyname('jobno').AsString,strsql,'T');
         end;
         if data.qryLocOutSkudetail.Active then
         begin
            data.qryLocOutSkudetail.Filtered:=False;
            data.qryLocOutSkudetail.ApplyUpdates;
         end;
         data.qryLocOutItemCasing.DisableControls;
         data.qryLocationOutItem.DisableControls;
         data.qryLocationOutDetail.DisableControls;
//         arrInOut:=ScatterToArray(data.qryOut,true,0);
         arrLocationoutItem:=ScatterToArray(data.qrylocationoutItem,False,0);
         data.qryLocationOutDetail.Filtered:=False;
         arrlocationoutDetail:=ScatterToArray(data.qrylocationoutdetail,False,0);
//         data.qryOut.ApplyUpdates;     假主放最后app,否则从表app出错后放弃时cancel不掉
         data.qryLocationOutItem.applyupdates;
         if _isCasing='T' then
         begin
            arrlocoutItemCasing:=ScatterToArray(data.qryLocOutItemCasing,False,0);
            data.qryLocOutItemCasing.ApplyUpdates;
         end;
         data.qryLocationOutDetail.applyupdates;
         data.qryautocountcostout.applyupdates;
         //删除商品明细
         if strDel_Task<>'' then
         begin
//            strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
            strsql:={' delete from LIOSKUDetail '
                   +'  where jobno="'+data.qryout.fieldbyname('Jobno').asstring+'"'
                   +'    and OperationType=-1 '
                   +'    and '+'('+strDel_Task+') '
                   +}' delete from locoutskudetail '
                   +'  where jobno="'+data.qryout.fieldbyname('jobno').asstring+'"'
                   +'    and '+'('+strDel_Task+')';
            execsql(datatmp.qryTmp,strsql);
//            strDel_Task:='';
         end;
         if strDel_detail<>'' then
         begin
//            strDel_detail:=copy(strdel_detail,4,length(strdel_detail)- 3);
            strsql:=' delete from locoutskudetail '
                   +'  where jobno="'+data.qryout.fieldbyname('jobno').asstring+'"'
                   +'    and '+'('+strDel_detail+')';
            execsql(datatmp.qryTmp,strsql);
//            strDel_detail:='';
         end;
         strtimemessage:=strtimemessage+'gather hou:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
         stime:=time;

         //为了控制库存, 生成库存及控制库存不小于零
         if blnChangeDetail then  //如果改变了数量等信息才控制库存
         kspLocationOutDetail(data.qryOut.FieldByName('Jobno').AsString);

         strtimemessage:=strtimemessage+'detail:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
         stime:=time;

         if blnChangeitem then  //如果改变了数量等信息才控制库存
         kspLocationOutItem(data.qryOut.FieldByName('Jobno').AsString);

         strtimemessage:=strtimemessage+'item:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
         stime:=time;
         if _isCasing='T' then
            kspLocationOutcasing(data.qryOut.FieldByName('Jobno').AsString);

         strtimemessage:=strtimemessage+'casing:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
         stime:=time;
         //仓位商品明细
         if data.qryLocOutSkudetail.Active then
            kspLocationOutskudetail(data.qryOut.fieldbyname('jobno').AsString,'');
         if (_isskudetail='T') and (strJobnoOrder<>'') then
         begin
        //处理商品明细
             ExecSql(dataTmp.qryTmp,' insert into locOutskudetail '+chr(13)+chr(10)
                                   +'   (jobno,skuid,skuname,quantityuom, '+chr(13)+chr(10)
                                   +'   pieceuom,weightuom,volumeuom,areauom,quantity, '+chr(13)+chr(10)
                                   +'   piece,netweight,grossweight,volume,area,sno, '+chr(13)+chr(10)
                                   +'   jobnoin,snoin,ldsnoin,sizeuom,height,width, '+chr(13)+chr(10)
                                   +'   depth,ldsno,conno,remark, '+chr(13)+chr(10)
    //wql.05.09.30                               +'   depth,ldsno,quantityremain,conno,remark, '+chr(13)+chr(10)
                                   +'   manufacturedate, '+chr(13)+chr(10)
                                   +'   serialno,lotcode,detailsno,detailsnoin, '+chr(13)+chr(10)
                                   +'   opersno,unknowq,qualityname,skubrand) '+chr(13)+chr(10)
                                   +' select  '+chr(13)+chr(10)
                                    +'   jobno="'+data.qryout.FieldByName('Jobno').AsString+'",sku.skuid,sku.skuname,sku.quantityuom, '+chr(13)+chr(10)
                                    +'   sku.pieceuom,sku.weightuom,sku.volumeuom,sku.areauom,sku.quantity, '+chr(13)+chr(10)
                                    +'   sku.piece,sku.netweight,sku.grossweight,sku.volume,sku.area,item.sno, '+chr(13)+chr(10)
                                    +'   sku.jobnoin,sku.snoin,sku.ldsnoin,sku.sizeuom,sku.height,sku.width, '+chr(13)+chr(10)
    //wql.05.09.30                                +'   sku.depth,sku.ldsno,sku.quantityremain,sku.conno,sku.remark, '+chr(13)+chr(10)
                                    +'   sku.depth,sku.ldsno,sku.conno,sku.remark, '+chr(13)+chr(10)
                                    +'   sku.manufacturedate, '+chr(13)+chr(10)
                                    +'   sku.serialno,sku.lotcode,sku.detailsno,sku.detailsnoin, '+chr(13)+chr(10)
                                    +'   sku.opersno,sku.unknowq,sku.qualityname,sku.skubrand '+chr(13)+chr(10)
                                    +'  from wareorderskudetail sku (nolock),locationoutitem item (nolock)  '+chr(13)+chr(10)
                                    +' where sku.jobno="'+strJobnoOrder+'"  '+chr(13)+chr(10)
                                    +'   and sku.jobno=item.jobnoorder   '+chr(13)+chr(10)
                                    +'   and sku.sno=item.snoorder    ');
         end;
         if (_conwaretoitem='T') and (strJobnoOrder<>'')  then
         begin
             ExecSql(dataTmp.qryTmp,'insert into locationinoutcon '
                                   +'        (jobno,userid,username,conno,sealno,contype,consptype,conquantity,'+chr(13)+chr(10)
                                   +'        remark,sno,liftconcusid,liftconcusname,loadgroupcusid,loadgroupcusname,'+chr(13)+chr(10)
                                   +'        forkgroupcusid,forkgroupcusname,liftmachinecusid,liftmachinecusname,conveno,'+chr(13)+chr(10)
                                   +'        convetype,xszh,drivername,driveridcar,iscon,blno,operationtype,drivecardno,'+chr(13)+chr(10)
                                   +'        tallycusid,tallycusname,drivertel)'+chr(13)+chr(10)
                                   +' select jobno="'+data.qryout.fieldbyname('jobno').AsString+'",'+chr(13)+chr(10)
                                   +'        userid,username,conno,sealno,contype,consptype,conquantity,'+chr(13)+chr(10)
                                   +'        remark,sno,liftconcusid,liftconcusname,loadgroupcusid,loadgroupcusname,'+chr(13)+chr(10)
                                   +'        forkgroupcusid,forkgroupcusname,liftmachinecusid,liftmachinecusname,conveno,'+chr(13)+chr(10)
                                   +'        convetype,xszh,drivername,driveridcar,iscon,blno,operationtype,drivecardno,'+chr(13)+chr(10)
                                   +'        tallycusid,tallycusname,drivertel'+chr(13)+chr(10)
                                   +'   from locationinoutcon '
                                   +'  where jobno="'+strJobnoOrder+'"');
             ExecSql(dataTmp.qryTmp,'insert into locationinoutconsku '
                                   +'        (jobno,skuid,lotcode,qualityname,userid,username,quantityuom,pieceuom,weightuom,'+chr(13)+chr(10)
                                   +'        volumeuom,areauom,quantity,piece,netweight,grossweight,volume,area,cusid,cusname,'+chr(13)+chr(10)
                                   +'        shippercusid,shippercusname,sno,tagno,serialno,ldsno,jobnoin,snoin,taskdate,sizeuom,'+chr(13)+chr(10)
                                   +'        height,width,depth,iscon,cusbillno,uom1,uom2,uom3,uom4,uom5,casing1,casing2,casing3,'+chr(13)+chr(10)
                                   +'        casing4,casing5,manufacturedate,costuomtype,skuname,costquantity,costquantityuom  )  '+chr(13)+chr(10)
                                   +' select jobno="'+data.qryOut.fieldbyname('jobno').AsString+'",'+chr(13)+chr(10)
                                   +'        skuid,lotcode,qualityname,'
                                   +'        userid="'+_userid+'",'
                                   +'        username="'+_username+'",'
                                   +'        quantityuom,pieceuom,weightuom,'+chr(13)+chr(10)
                                   +'        volumeuom,areauom,quantity,piece,netweight,grossweight,volume,area,cusid,cusname,'+chr(13)+chr(10)
                                   +'        shippercusid,shippercusname,sno,tagno,serialno,ldsno,jobnoin,snoin,taskdate,sizeuom,'+chr(13)+chr(10)
                                   +'        height,width,depth,iscon,cusbillno,uom1,uom2,uom3,uom4,uom5,casing1,casing2,casing3,'+chr(13)+chr(10)
                                   +'        casing4,casing5,manufacturedate,costuomtype,skuname,costquantity,costquantityuom    '+chr(13)+chr(10)
                                   +'   from locationinoutconsku '
                                   +'  where jobno="'+strJobnoOrder+'"');
         end;

         if _isoriinfo='T' then  //订单跟踪
         ExecSql(dataTmp.qryTmp,'ksp_OriInfoLocationout '
                               +data.qryOut.FieldByName('Jobno').AsString
                               +','+IIF(DataState=stInsert,'"I"','"E"')
                );
         if _isuserhist='T' then   //用户日志
         begin
            strHistMessage:=strHistMessage+strHistDetailMessage;
            if strHistMessage<>'' then
              execsql(dataTmp.qryTmp,'insert into UserHist '
                            +' (UserName,UserDATE,JOBNO, Remark,TypeName,modifytype)'
                            +' values ("'+_LoginName+'",getdate(),"'
                            +data.qryLocationout.FieldByName('jobno').AsString+'","'
                            +strHistMessage+'","出仓任务","'+iif(DataState=stEdit,'修改','新增')+'")');
         end;

         strtimemessage:=strtimemessage+'dd:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
         stime:=time;
{         if frmLIOSKUDetail<>nil then
         begin
            frmLIOSKUDetail.isupdate:=True;
            frmLIOSKUDetail.Destroy;
         end;
         if not _skudetailupdsucc then
         begin
            try
            except
            end;
            raise Exception.Create('商品明细更新出错!');
         end;  }
         if _isskudetail='T' then      //默认从对应进仓生成出仓商品明细
            ExecSql(dataTmp.qryTmp,'ksp_outskudetail @jobno="'+data.qryLocationout.fieldbyname('jobno').AsString+'"');

         if _paper='T' then
         ExecSql(dataTmp.qryTmp,' update genjobno set docno1="'+data.qryLocationout.FieldByName('locationbillno').AsString+'" '
                               +'  where jobno="'+data.qryLocationout.FieldByName('Jobno').AsString+'" '
                );
          //lzw20110419
         if _strsyscus='DHA' then
         ExecSql(dataTmp.qryTmp,' update locationinoutcon set            '
                               +'        locationbillno="'+data.qryLocationout.FieldByName('locationbillno').AsString+'" '
                               +'  where conveno="'+data.qryLocationout.FieldByName('carbrand').AsString+'" '
                               +'    and isnull(locationbillno,"")="" '
                );
         data.qryOut.ApplyUpdates;
         _ADOConnection.Commit;
      except
         if datastate=stInsert then
         begin
            data.qryLocationOut.Edit;
            data.qryLocationOut.FieldByName('operationname').AsString:='';
            data.qryLocationOut.FieldByName('OperationDate').Clear;

            data.qryOut.Edit;
            data.qryOut.FieldByName('operationname').AsString:='';
//            arrLocationoutItem:=ScatterToArray(data.qrylocationoutItem,False,0);
//            data.qryLocationOutItem.CancelUpdates;
//            data.qryLocationOutDetail.CancelUpdates;
         end;
         data.qryLocationOutDetail.Filtered:=True;
         data.qryLocationOutItem.EnableControls;
         data.qryLocationOutDetail.EnableControls;
         data.qryLocOutItemCasing.EnableControls;
         blnSaveError:=true;
//         arrInOut:=ScatterToArray(data.qryOut,true,0);
//         arrLocationINOUT:=ScatterToArray(data.qryLocationOut,true,0);
//         m_blnPost := True;
         strJobno     :=data.qryOut.FieldByName('Jobno').AsString;
//         data.qryOut.CancelUpdates;
//         data.qryLocationOut.CancelUpdates;
//         if datastate=stInsert then
//         begin
//假主不删除,否则记录移动,jobno将不正确
//         data.qryOut.Delete;
         data.qryLocationOut.Delete;
//         data.qryOut.Append;
//         data.qryLocationOut.Append;
//         end else
//         begin
//         data.qryOut.Edit;
//         end;
//         data.qryOut.DisableControls;
         m_blnPost:=false;//在Post状态
//         GatherFromArray(data.qryOut,arrInOut,true);
         GatherFromArray(data.qryLocationOut,arrLocationINOUT,true);
//         data.qryOut.EnableControls;
         //casing复制
         if _isCasing='T' then
         begin
            data.qryLocOutItemCasing.DisableControls;
            data.qryLocOutItemCasing.First;
            while not data.qryLocOutItemCasing.Eof do
            begin
               data.qryLocOutItemCasing.Delete;
            end;
            data.qryLocOutItemCasing.First;
            data.qryLocOutItemCasing.EnableControls;

            data.qryLocOutItemCasing.DisableControls;
            GatherFromArray(data.qryLocOutItemCasing,arrlocoutItemCasing,true);
            data.qryLocOutItemCasing.EnableControls;
         end;
//         data.qryLocOutItemCasing.Post;

         //item,detail复制
         data.qrylocationoutItem.DisableControls;
         data.qrylocationoutItem.First;
         while not data.qrylocationoutItem.Eof do
         begin
            data.qryLocationOutItem.Delete;
         end;
         data.qrylocationoutItem.EnableControls;

         data.qrylocationoutdetail.Filtered:=false;
         data.qrylocationoutdetail.DisableControls;
         data.qrylocationoutdetail.First;
         while not data.qrylocationoutdetail.Eof do
            data.qrylocationoutdetail.Delete;
         data.qrylocationoutdetail.EnableControls;

         data.qrylocationoutdetail.DisableControls;
         data.qrylocationoutItem.DisableControls;
         GatherFromArray(data.qrylocationoutdetail,arrLocationoutdetail,true);
         GatherFromArray(data.qryLocationOutItem,arrLocationoutItem,true);
{//         data.qryLocationOutItem.DisableControls;
         data.qryLocationOutItem.First;
         while not data.qryLocationOutItem.Eof do
         begin
           data.qryLocationOutItem.Edit;
           data.qryLocationOutItem.FieldByName('Jobno').Asstring:=data.qryOut.FieldByName('Jobno').AsString;
           data.qryLocationOutItem.next;
         end;
}
//        data.qrylocationoutdetail.Post;
         data.qryLocationOutItem.Post;
         data.qrylocationoutdetail.Filtered:=True;
//         data.qryLocationOutItem.First;
         grdLocationOutItemChangeNodeEx(nil);
         data.qryLocationOutItem.EnableControls;
         data.qrylocationoutdetail.EnableControls;
         m_blnPost := true;
         try
            if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         exit;
     end;
 //为了控制库存 ,删除临时表
     droplsk('#lskOldDetail');
     droplsk('#lskOldItemWBKNCF');
     if _isCasing='T' then  droplsk('#lskOldCasing');
     data.qryOut.CommitUpdates;
     if _isCasing='T' then  data.qryLocOutItemCasing.CommitUpdates;
     data.qryLocationOutItem.CommitUpdates;
     data.qryLocationOut.CommitUpdates;
     data.qryLocationOutDetail.CommitUpdates;
     data.qryautocountcostout.CommitUpdates;
     data.qryLocationOutDetail.Filtered:=True;
     if data.qryLocOutSkudetail.Active then
     begin
        data.qryLocOutSkudetail.CommitUpdates;
        data.qryLocOutSkudetail.Filtered:=true;
     end;
     data.qryLocationOutItem.EnableControls;
     data.qryLocationOutDetail.EnableControls;
     data.qryLocOutItemCasing.EnableControls;
//     grdLocationOutDetailReadOnly:=True;
//tmp     SetDetailActive(False,True);
     ScrollAfterEdit:=False;
     blnqryOutChange:=True;
     blnItemPage:=True;
     blnMainPage:=True;
     WorkCall(stBrowse);
     if getSysdata('qdtext')='T' then
        ExecSql(dataTmp.qryTmp,'delete locationoutitem '
                              +' where jobno="'+data.qryout.fieldbyname('jobno').asstring+'" '
                              +'   and isnull(quantitytask,0)=0'
                              +iif(strFlow='DETAIL',' or isnull(quantity,0)=0',''));
     strtimemessage:=strtimemessage+'js:'+copy(floattostr((time-stime)*24*3600),1,7)+'秒'+chr(13)+chr(10);
     //KMessageDlg(strtimemessage,mtWarning,[mbyes],0);
     //dwq 2009.3.6
     if (not skuoutcontrol) and (_StrSysCus='SWZ') then Exit;

     if (_transorder<>'') and (cmbLoadCostType.Text=_transorder) then
     begin
        if KmessageDlg('是否下达配置指令',mtConfirmation,[mbYes,mbNo],0)=mrYes then
           mitLocToTransClick(Sender);
     end;
     //lzw20101202
     if _StrSysCus='MT' then
     begin
        ExecSql(dataTmp.qryTmp,' update locationoutitem set costquantityuom=weightuom,      '
                              +'        costquantitytask=case when (ROUND(netweighttask,-3)=0) then 1000 else ROUND(netweighttask,-3) end, '
                              +'        costquantity=case when (ROUND(netweight,-3)=0) then 1000 else ROUND(netweight,-3) end '
                              +'  where jobno="'+data.qryLocationout.FieldByName('Jobno').AsString+'" '
            );
     end;
     //lzw20101202
      if _paper='T' then
      begin
         ExecSql(dataTmp.qryTmp,' update locoutskudetail set locationbillno=item.locationbillno  '
                               +'   from locationoutitem item(nolock) '
                               +'  where item.jobno=locoutskudetail.jobno '
                               +'    and item.sno=locoutskudetail.sno '
                               +'    and item.jobno="'+data.qryLocationout.FieldByName('Jobno').AsString+'" '
                               +'    and locoutskudetail.jobno="'+data.qryLocationout.FieldByName('Jobno').AsString+'" '
             );
      end;
   end;
end;

procedure TfrmLocationOut.btnCancelClick(Sender: TObject);
var
   strjobno:string;
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)<>mryes then exit;
//为了控制库存 ,删除临时表
   droplsk('#lskOldDetail');
   droplsk('#lskOldItemWBKNCF');
   if _isCasing='T' then droplsk('#lskOldCasing');
   strjobno:=data.qryout.FieldByName('jobno').AsString;
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+strjobno+'" ');
   data.qryautocountcostout.CancelUpdates;
   if data.qryLocOutSkudetail.Active then
      data.qryLocOutSkudetail.CancelUpdates;
   if _isCasing='T' then data.qryLocOutItemCasing.CancelUpdates;
   data.qryLocationOutDetail.CancelUpdates;
   data.qryLocationOutItem.CancelUpdates;
   data.qryLocationOut.CancelUpdates;
   data.qryOut.CancelUpdates;
   data.qryout.Locate('Jobno',
                     VarArrayOf([strJobno]),
                     [loCaseInsensitive, loPartialKey]);
   if DataState=stInsert then
   SetDetailActive(False,True);
   blnqryOutChange:=True;
   blnMainPage:=True;
   blnItemPage:=True;
   WorkCall(stBrowse);
   if frmLIOSKUDetail<>nil then
   begin
      frmLIOSKUDetail.isupdate:=False;
      frmLIOSKUDetail.Destroy;
   end;
end;

procedure TfrmLocationOut.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLocationOut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmLocationOut.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox3);
   SetGroupbox(KGroupBox7);
   SetGroupbox(KGroupBox9);
   SetGroupbox(KGroupBox12);
   SetGroupbox(grpinfobar);
   SetDxDbGrid(grdLocationOut);
   SetDxDbGrid(grdLocationOutItem);
   SetDxDbGrid(grdLocationOutDetail);
   SetDxDbGrid(grdAutoCost);
   SetDxDbGrid(grdcasing);
   SetDxDbGrid(grdSKUDetail);
   height:=535;
   width:=780;
   grdLocationOutItem.LoadFromIniFile('D:/KinnGrid.ini');
   grdLocationOutDetail.LoadFromIniFile('D:/KinnGrid.ini');
   pgcMain.ActivePage:=tbsBrowse;
   pgcLocationINOUT.ActivePage:=tbsInfo;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmLocationOut.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   sltCostUomitem.Destroy;
   sltselect.Destroy;
   grdLocationOutItem.SaveToIniFile('D:/KinnGrid.ini');
   grdLocationOutDetail.SaveToIniFile('D:/KinnGrid.ini');
//先关闭从库
   data.qryautocountcostout.Close;
   data.qryLocOutItemCasing.Close;
   data.qryLocationOutDetail.Close;
   data.qryLocationOutItem.Close;
   data.qryLocationOut.Close;
   data.qryOut.Close;
   frmLocationOut:=nil;
end;

procedure TfrmLocationOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
   if (Key=Vk_F4) and tbsInfo.TabVisible then
   begin
     pgcLocationINOUT.Activepage:=tbsInfo;
     if DataState in Setdcs then ActiveControl:=edtOPID;
   end else
   if (Key=Vk_F6) and tbscasing.TabVisible then
   begin
     pgcLocationINOUT.Activepage:=tbsCasing;
     if DataState in Setdcs then ActiveControl:=grdCasing;
   end else
   if (Key=Vk_F5) and tbsSKU.TabVisible then
   begin
     pgcLocationINOUT.Activepage:=tbsSKU;
     if DataState in Setdcs then ActiveControl:=grdLocationoutItem;
   end else
   if (Key=Vk_F7) and tbsAutoCost.TabVisible then
   begin
     pgcLocationINOUT.Activepage:=tbsAutoCost;
     if DataState in Setdcs then ActiveControl:=grdAutoCost;
   end;
   if DataState = stBrowse then
   begin
      case Key of
         VK_F3:
           if pgcMain.ActivePage=tbsEdit then
           begin
             pgcMain.ActivePage:=tbsBrowse;
             grdLocationOut.SetFocus;
           end else
           begin
             pgcMain.ActivePage:=tbsEdit;
           end;
         Ord('T'):KeyDownControl(Key,btnFirst);
         Ord('P'):KeyDownControl(Key,btnPrior);
         Ord('N'):KeyDownControl(Key,btnNext);
         Ord('B'):KeyDownControl(Key,btnLast);
         Ord('U'):KeyDownControl(Key,btnRefresh);

         Ord('E'):KeyDownControl(Key,btnEdit);
         Ord('A'):KeyDownControl(Key,btnAdd);
         Ord('D'):KeyDownControl(Key,btnDelete);
//         Ord('C'):KeyDownControl(Key,btnCopy);

         Ord('F'):KeyDownControl(Key,btnFind);
         Ord('R'):KeyDownControl(Key,btnRefind);
         Ord('L'):KeyDownControl(Key,btnFilter);
   //      Ord('O'):KeyDownControl(Key,btnPrint);

         Ord('V'):KeyDownControl(Key,btnCheck);

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

procedure TfrmLocationOut.pgcMainChange(Sender: TObject);
begin
   if pgcMain.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      btnFirst.SkipGroup:=True;
      btnPrior.SkipGroup:=True;
      btnNext.SkipGroup:=True;
      btnLast.SkipGroup:=True;
      if (ScrollAfterEdit) and (blnMainPage) then
      SetDetailActive(True,True);
      ScrollAfterEdit:=False;
   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
      btnFirst.SkipGroup:=False;
      btnPrior.SkipGroup:=False;
      btnNext.SkipGroup:=False;
      btnLast.SkipGroup:=False;
      SetMasterDetailState(false);
//      SetDetailActive(False,False);
   end;
end;

procedure TfrmLocationOut.mitFilterActiveClick(Sender: TObject);
begin
   grdLocationOut.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmLocationOut.grdLocationOutDblClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmLocationOut.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('A','');
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOut.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            //lzw20090512
            if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
            begin
               data.qryLocationOut.FieldByName('mincostin').AsString  :=qrySelect.FieldByName('mincostin').asstring;
            end;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         freeandnil(qrySelect);
      end else
      begin
         GetCusCnfg;
      end;
      //lzw20090319
      if _StrSysCus='SWZ' then
      begin
         OpenSql(datatmp.qryTmp,'select * from contract (nolock)    '+chr(13)+chr(10)
                               +' where signcusid="'+data.qryLocationOut.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                               +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                               +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
         if datatmp.qryTmp.RecordCount<>0 then
         begin
            data.qryLocationOut.FieldByName('corpno').AsString  :=datatmp.qryTmp.FieldByName('contractno').asstring;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qryLocationOut.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qryLocationOut.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     freeandnil(qrySelect);
  end;
end;

procedure TfrmLocationOut.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryLocationOut.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         data.qryLocationOut.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.Showhint(var HintStr: string; var CanShow: Boolean;
   var HintInfo: THintInfo);
begin
   if HintInfo.HintControl =edtCreateName  then
   begin
      Hintstr := data.qryLocationOut.FieldByName('CREATEDate').AsString;
      HintInfo.HintColor := clHighlightText;
   end else
   if HintInfo.HintControl =edtOperationName  then
   begin
      Hintstr := data.qryLocationOut.FieldByName('OPERATIONDate').AsString;
      HintInfo.HintColor := clHighlightText;
   end else
   if HintInfo.HintControl =edtCheckName  then
   begin
      Hintstr := data.qryLocationOut.FieldByName('CHECKDate').AsString;
      HintInfo.HintColor := clHighlightText;
   end else
   if HintInfo.HintControl =edtCountName  then
   begin
      Hintstr := data.qryLocationOut.FieldByName('CountDate').AsString;
      HintInfo.HintColor := clHighlightText;
   end;
   {if HintInfo.HintControl = grdLocationOutItem then
   begin
      Hintstr := '1件数='+data.qryLocationOutItem.FieldByName('PiecePro').AsString+' 数量'+chr(13)+chr(10)
               + '1件数='+data.qryLocationOutItem.FieldByName('AreaPro').AsString+' 面积'+chr(13)+chr(10)
               + '1件数='+data.qryLocationOutItem.FieldByName('VolumePro').AsString+' 体积'+chr(13)+chr(10)
               + '1件数='+data.qryLocationOutItem.FieldByName('NetWeightPro').AsString+' 重量'+chr(13)+chr(10)
               + '商品编码：'+data.qryLocationOutItem.FieldByName('customerno').AsString+chr(13)+chr(10)
               + '商品型号：'+data.qryLocationOutItem.FieldByName('skumodel').AsString+chr(13)+chr(10)
               + '商品规格：'+data.qryLocationOutItem.FieldByName('skuspec').AsString+chr(13)+chr(10)
               + '商品颜色：'+data.qryLocationOutItem.FieldByName('color').AsString+chr(13)+chr(10)
//               + '海关编码：'+data.qryLocationOutItem.FieldByName('customno').AsString+chr(13)+chr(10)
//               + '商品描述：'+data.qryLocationOutItem.FieldByName('skudes').AsString
               ;
      HintInfo.HintColor := clHighlightText;
   end;}
end;

function TfrmLocationOut.CheckModifyMode(pstrCallMode:string;pstrIsdel:boolean):Boolean;
{检查是否可修改或删除、生成（到货、上架、直接上架、拣货、出货、直接出货）
  pstrCallMode：修改 E dit
                删除 D elete
                新增 A dd
                生成 G enerate
}
begin
   Result:=False;
   if pstrCallMode='D' then
   begin
      if pstrIsdel then //删除
      begin
         if (data.qryOut.FieldByName('operationname').AsString<>'') then
         begin
            {if _Language='CAPTIONC' then _strmessage:='该笔出仓已产生出货，不能直接删除!'
            else _strmessage:='该笔出仓已产生出货，不能直接删除!';}
            kMessageDlg(GetMessage('frmLocationOut','016'), mtWarning, [mbOK], 0);
            Exit;
         end;
      end else
      begin   //取消上架
         if (data.qryOut.FieldByName('operationname').AsString='') then
         begin
            {if _Language='CAPTIONC' then _strmessage:='该笔出仓还未出货，无法取消出货!'
            else _strmessage:='该笔出仓还未出货，无法取消出货!';}
            kMessageDlg(GetMessage('frmLocationOut','017'), mtWarning, [mbOK], 0);
            Exit;
         end;
      end;
      if (data.qryOut.FieldByName('transordered').AsString='T') then
      begin
         {if _Language='CAPTIONC' then _strmessage:='已下达配送指令,无法取消出货!'
         else _strmessage:='已下达配送指令,无法取消出货!';}
         kMessageDlg(GetMessage('frmLocationOut','018'), mtWarning, [mbOK], 0);
         Exit;
      end;
      if (data.qryOut.FieldByName('wareordered').AsString='T') then
      begin
         {if _Language='CAPTIONC' then _strmessage:='已下达进仓指令,无法取消出货!'
         else _strmessage:='已下达进仓指令,无法取消出货!';}
         kMessageDlg(GetMessage('frmLocationOut','019'), mtWarning, [mbOK], 0);
         Exit;
      end;

   end;
   if strFlow='DETAIL' then
   begin
      if (data.qryOut.FieldByName('operationname').AsString<>'') and
         (data.qryOut.FieldByName('operationname').AsString<>_LoginName) and
         (_canmodifyother<>'T') then
      begin
         {if _Language='CAPTIONC' then _strmessage:='该直接出货不是您输入的，不能修改、删除!'
         else _strmessage:='该直接出货不是您输入的，不能修改、删除!';}
         kMessageDlg(GetMessage('frmLocationOut','020'), mtWarning, [mbOK], 0);
         exit;
      end;
   end else
   begin
      if pstrCallMode='D' then
      begin
         if pstrIsdel then //删除
         begin
            if (data.qryOut.FieldByName('createname').AsString<>_LoginName) and
               (_canmodifyother<>'T') then
            begin  //只能修改自己新增的
               {if _Language='CAPTIONC' then _strmessage:='该出仓任务不是你录入的，不能修改,删除!'
               else _strmessage:='该出仓任务不是你录入的，不能修改,删除!'; }
               kMessageDlg(GetMessage('frmLocationOut','021'), mtWarning, [mbOK], 0);
               exit;
            end;
         end else
         begin
            if (data.qryOut.FieldByName('operationname').AsString<>'') and
               (data.qryOut.FieldByName('operationname').AsString<>_LoginName) and
               (_canmodifyother<>'T') then
            begin  //只能修改自己新增的
               {if _Language='CAPTIONC' then _strmessage:='该直接出货不是您输入的，不能修改、删除!'
               else _strmessage:='该直接出货不是您输入的，不能修改、删除!';}
               kMessageDlg(GetMessage('frmLocationOut','020'), mtWarning, [mbOK], 0);
               Result:=False;
               exit;
            end else
         end;
      end else
      begin
         if (data.qryOut.FieldByName('createname').AsString<>_LoginName) and
            (_canmodifyother<>'T') then
         begin  //只能修改自己新增的
            {if _Language='CAPTIONC' then _strmessage:='该出仓任务不是你录入的，不能修改,删除!'
            else _strmessage:='该出仓任务不是你录入的，不能修改,删除!'; }
            kMessageDlg(GetMessage('frmLocationOut','021'), mtWarning, [mbOK], 0);
            exit;
         end;
      end;
   end;

   if (data.qryOut.FieldByName('CheckName').AsString<>'') then
   begin  //已审核的任务数据不能修改
      {if _Language='CAPTIONC' then _strmessage:='该笔已审核，不能修改、删除!'
      else _strmessage:='该笔已审核，不能修改、删除!'; }
      kMessageDlg(GetMessage('frmLocationOut','023'), mtWarning, [mbOK], 0);
      exit;
   end;

   if (data.qryOut.FieldByName('taskCheckName').AsString<>'') and (_strsyscus='XSWL')
   and (UpperCase(strFlow)='ITEM')  then
   begin  //已审核的任务数据不能修改
     { if _Language='CAPTIONC' then _strmessage:='该笔已复核，不能修改、删除!'
      else _strmessage:='该笔已审核，不能修改、删除!'; }
      kMessageDlg(GetMessage('frmLocationOut','086'), mtWarning, [mbOK], 0);
      exit;
   end;

   OpenSql(dataTmp.qryTmp,'select costcheckname,RateName,CountComplete from cost(nolock) '
                         +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
   if (dataTmp.qryTmp.FieldByName('costcheckname').AsString<>'') then
   begin//判断是否财务审核
      {if _Language='CAPTIONC' then _strmessage:='该笔已财务审核，不能修改、删除!'
      else _strmessage:='该笔已财务审核，不能修改、删除!';  }
      kMessageDlg(GetMessage('frmLocationOut','022'), mtWarning, [mbOK], 0);
      datatmp.qrytmp.close;
      exit;
   end else
   if trim(datatmp.qryTmp.FieldByName('RateName').AsString)<>'' then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
      else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'; }
      kMessageDlg(GetMessage('frmLocationIN','015'), mtWarning, [mbOK], 0);
      datatmp.qrytmp.close;
      exit;
   end;

   if (data.qryOut.FieldByName('loacccheckname').AsString<>'')
      and (UpperCase(strFlow)='ITEM')  then
   begin
      kMessageDlg(GetMessage('frmLocationOut','088'), mtWarning, [mbOK], 0);
      exit;
   end;

   OpenSql(datatmp.qryTmp,'select num=count(1) '
                         +'  from costitem(nolock) '
                         +' where jobno="'+data.qryout.FieldByName('Jobno').AsString+'" '
                         +'   and (isnull(costcheckname,"")<>"" '
                         +'    or  isnull(iocost,0)<>0 ) '
                        );
   if datatmp.qryTmp.FieldByName('num').AsInteger<>0 then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
      else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'; }
     // kMessageDlg(GetMessage('frmLocationIN','015'), mtWarning, [mbOK], 0);
      kMessageDlg('该业务资料的费用已经审核或核销，请确认!', mtWarning, [mbOK], 0);
      exit;
   end;   
   Result:=True;
end;

procedure TfrmLocationOut.mitAddLocationINOUTDetailClick(
  Sender: TObject);
begin
   if (data.qryLocationoutItem.IsEmpty) or (grdLocationOutDetailReadOnly) then exit;
   grdLocationOutDetail.setfocus;
   data.qryLocationOutDetail.append;
   grdLocationOutDetailBeforeInsert;
end;

procedure TfrmLocationOut.mitDelLocationINOUTDetailClick(
  Sender: TObject);
begin
   if (data.qryLocationoutItem.IsEmpty) or (grdLocationOutDetailReadOnly) then exit;
   if data.qryLocationOutDetail.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      if data.qryLocationOutDetail.UpdateStatus = usModified then data.qryLocationOutDetail.RevertRecord;

      grdLocationOutDetail.setfocus;
      if sltselect.IndexOf(data.qryLocationOutDetail.fieldbyname('jobnoin').AsString+
                            data.qryLocationOutDetail.fieldbyname('snoin').AsString+
                            data.qryLocationOutDetail.fieldbyname('ldsnoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(data.qryLocationOutDetail.fieldbyname('jobnoin').AsString+
                          data.qryLocationOutDetail.fieldbyname('snoin').AsString+
                          data.qryLocationOutDetail.fieldbyname('ldsnoin').AsString));
      if strDel_Detail='' then
         strDel_Detail:=' (SNO='+data.qrylocationoutdetail.fieldbyname('SNO').Asstring
                       +'  and ldsno='+data.qrylocationoutdetail.fieldbyname('ldSNO').Asstring+')'
      else
         strDel_Detail:=strDel_Detail+' or (SNO='+data.qrylocationoutdetail.fieldbyname('SNO').Asstring
                                     +' and ldsno='+data.qrylocationoutdetail.fieldbyname('ldSNO').Asstring+')';

      data.qryLocationOutDetail.delete;
   end;
end;

procedure TfrmLocationOut.mitSKUSelectClick(Sender: TObject);
var
   i:integer;
//   qrySelect:TKADOQuery;
//   Quantity:extended;
   mulSKUSelect:TMultLocationSKUSelect;
   strSkuSelect:string;
begin
//out
   begin
     begin
        //保税商品出仓必须从指令资料中选择(出于报关流程的控制),
        //对于非保税商品,若指令资料中仍存在非完成的指令数量,也必须从指令资料中选择
      if _isnocusfilter='T' then       //wql.05.09.26
        mulSKUSelect:=  WorkLocationSKUSelect('',0,
                                              iif(_DB_TariffLOOrder='T','非保税库存商品选择','库存商品选择'),strFlow,sltselect,False,
                                              '','','','','t')
      else
        mulSKUSelect:=  WorkLocationSKUSelect('',0,
                                              iif(_DB_TariffLOOrder='T','非保税库存商品选择','库存商品选择'),strFlow,sltselect,False,
                                              data.qryLocationOutItem.fieldbyname('cusid').asstring,data.qryLocationOutItem.fieldbyname('cusName').asstring,
                                              data.qryLocationOutItem.fieldbyname('Shippercusid').asstring,data.qryLocationOutItem.fieldbyname('ShippercusName').asstring,
                                              '','',false,data.qrylocationout.fieldbyname('istrade').AsString);

        for i:=0 to 500 do
        begin
           if mulSKUSelect[i].OkFlag then
           begin
              if i=0 then
              begin
                 data.qryLocationOutItem.edit;
                 data.qryLocationOut.Edit;
                 data.qryLocationOut.fieldbyname('lottracked').asstring          :=mulSKUSelect[i].LotTracked;
                 data.qryLocationOut.fieldbyname('tageach').asstring             :=mulSKUSelect[i].TagEach;
                 if data.qryLocationOut.fieldbyname('warerentcounttype').asstring='' then
                    data.qryLocationOut.fieldbyname('warerentcounttype').asstring   :=mulSKUSelect[i].WareRentCountType;
                 if data.qryLocationOut.fieldbyname('warerentcounttypeout').asstring='' then
                    data.qryLocationOut.fieldbyname('warerentcounttypeout').asstring:=mulSKUSelect[i].WareRentCountTypeout;
                 data.qryLocationOut.fieldbyname('isbond').asstring              :=mulSKUSelect[i].isbond;
                 data.qryLocationOut.fieldbyname('countrent').asstring           :=mulSKUSelect[i].COUNTRENT;
                 data.qryLocationOut.fieldbyname('countcontcost').asstring       :=mulSKUSelect[i].COUNTCONTCOST;
                 data.qryLocationOut.fieldbyname('SKUCOSTCLASSCD').asstring      :=mulSKUSelect[i].SKUCOSTCLASSCD;
                 data.qryLocationOut.fieldbyname('CountWho').asstring            :=mulSKUSelect[i].CountWho;
                 //操作类型不用于装卸费的计算标准，进出仓可能不一致
//                 if _paper<>'T' then
//                    data.qryLocationOut.fieldbyname('loadcosttype').asstring        :=mulSKUSelect[i].loadcosttype;
                 if data.qryLocationOut.fieldbyname('loadcosttype').asstring='' then
                 data.qryLocationOut.fieldbyname('loadcosttype').asstring        :=mulSKUSelect[i].loadcosttype;
                 data.qryLocationOut.fieldbyname('countloadcost').asstring       :=iif(mulSKUSelect[i].COUNTCONTCOST='T','F','T');
                 if data.qryLocationOut.fieldbyname('costcusid').asstring='' then
                 begin
                   data.qryLocationOut.fieldbyname('costcusid').asstring         :=mulSKUSelect[i].costcusid;
                   data.qryLocationOut.fieldbyname('costcusname').asstring       :=mulSKUSelect[i].costcusname;
                   data.qryLocationOut.fieldbyname('opid').asstring              :=mulSKUSelect[i].opid;
                   data.qryLocationOut.fieldbyname('opname').asstring            :=mulSKUSelect[i].opName;
                 end;
              end else
              begin
                 try
                   data.qryLocationOutItem.Post;
                 except
                   break;
                 end;
                 data.qryLocationOutItem.append;
                 data.qryLocationOutItem.fieldbyname('sno').Asinteger  :=-1;
                 data.qryLocationOutItem.fieldByname('jobno').AsString :=data.qryLocationOut.fieldbyname('jobno').AsString;
                 data.qryLocationOutItem.fieldByname('userid').AsString:=data.qryLocationOut.fieldbyname('userid').AsString;
              end;
              data.qryLocationOutItem.fieldbyname('skuid').asstring               :=mulSKUSelect[i].SKUID;
              data.qryLocationOutItem.fieldbyname('skuname').asstring             :=mulSKUSelect[i].SKUName;
              strGetCd := mulSKUSelect[i].SKUName;
              data.qryLocationOutItem.Fieldbyname('LotCode').asstring             :=mulSKUSelect[i].LotCode;
              data.qryLocationOutItem.fieldbyname('Quantitytask').AsFloat         :=mulSKUSelect[i].syquantity;//noknow
              data.qryLocationOutItem.fieldbyname('QualityName').asstring         :=mulSKUSelect[i].QualityName;
              data.qryLocationOutItem.fieldbyname('QuantityUOM').asstring         :=mulSKUSelect[i].QuantityUOM;
              data.qryLocationOutItem.fieldbyname('PieceUOM').asstring            :=mulSKUSelect[i].PieceUOM;
              data.qryLocationOutItem.fieldbyname('WeightUOM').asstring           :=mulSKUSelect[i].WeightUOM;
              data.qryLocationOutItem.fieldbyname('VolumeUOM').asstring           :=mulSKUSelect[i].VolumeUOM;
              data.qryLocationOutItem.Fieldbyname('AreaUOM').asstring             :=mulSKUSelect[i].AreaUOM;
              data.qryLocationOutItem.fieldbyname('Piecetask').AsFloat            :=mulSKUSelect[i].syPiece;
              data.qryLocationOutItem.fieldbyname('NetWeighttask').asFloat        :=mulSKUSelect[i].syNetWeight;
              data.qryLocationOutItem.Fieldbyname('GrossWeighttask').asFloat      :=mulSKUSelect[i].syGrossWeight;
              data.qryLocationOutItem.fieldbyname('Volumetask').asFloat           :=mulSKUSelect[i].syVolume;
              data.qryLocationOutItem.Fieldbyname('Areatask').asFloat             :=mulSKUSelect[i].syArea;
              data.qryLocationOutItem.fieldbyname('costcusid').asstring           :=mulSKUSelect[i].costcusid   ;
              data.qryLocationOutItem.fieldbyname('costcusName').asstring         :=mulSKUSelect[i].costcusname ;
              data.qryLocationOutItem.fieldbyname('costcusidout').asstring        :=mulSKUSelect[i].costcusidout;
              data.qryLocationOutItem.fieldbyname('costcusNameout').asstring      :=mulSKUSelect[i].costcusNameout;
              data.qryLocationOutItem.fieldbyname('cusid').asstring               :=mulSKUSelect[i].cusid;
              data.qryLocationOutItem.fieldbyname('cusName').asstring             :=mulSKUSelect[i].cusname;
              data.qryLocationOutItem.Fieldbyname('Shippercusid').asstring        :=mulSKUSelect[i].Shippercusid ;
              data.qryLocationOutItem.Fieldbyname('ShippercusName').asstring      :=mulSKUSelect[i].ShipperCusName  ;
              data.qryLocationOutItem.Fieldbyname('Shipcusid').asstring           :=mulSKUSelect[i].Shipcusid ;
              data.qryLocationOutItem.Fieldbyname('ShipcusName').asstring         :=mulSKUSelect[i].ShipCusName  ;
              data.qryLocationOutItem.Fieldbyname('conscusid').asstring           :=mulSKUSelect[i].conscusid ;
              data.qryLocationOutItem.Fieldbyname('conscusName').asstring         :=mulSKUSelect[i].consCusName  ;
              data.qryLocationOutItem.Fieldbyname('corpno').asstring         :=mulSKUSelect[i].corpno  ;
              data.qryLocationOutItem.Fieldbyname('PiecePro').asFloat      :=0;
              data.qryLocationOutItem.Fieldbyname('VolumePro').asFloat     :=0;
              data.qryLocationOutItem.fieldbyname('NetWeightPro').asFloat  :=0;
              data.qryLocationOutItem.fieldbyname('GrossWeightPro').asFloat:=0;
              data.qryLocationOutItem.fieldbyname('AreaPro').asFloat       :=0;

              data.qryLocationOutItem.Fieldbyname('UOM1').asstring        :=mulSKUSelect[i].UOM1;
              data.qryLocationOutItem.Fieldbyname('UOM2').asstring        :=mulSKUSelect[i].UOM2;
              data.qryLocationOutItem.Fieldbyname('UOM3').asstring        :=mulSKUSelect[i].UOM3;
              data.qryLocationOutItem.Fieldbyname('UOM4').asstring        :=mulSKUSelect[i].UOM4;
              data.qryLocationOutItem.Fieldbyname('UOM5').asstring        :=mulSKUSelect[i].UOM5;
              data.qryLocationOutItem.Fieldbyname('pro1').asFloat         :=0;
              data.qryLocationOutItem.Fieldbyname('pro2').asFloat         :=0;
              data.qryLocationOutItem.Fieldbyname('pro3').asFloat         :=0;
              data.qryLocationOutItem.Fieldbyname('pro4').asFloat         :=0;
              data.qryLocationOutItem.Fieldbyname('pro5').asFloat         :=0;
              data.qryLocationOutItem.Fieldbyname('Casing1task').asFloat            :=mulSKUSelect[i].syCasing1;
              data.qryLocationOutItem.Fieldbyname('Casing2task').asFloat            :=mulSKUSelect[i].syCasing2;
              data.qryLocationOutItem.Fieldbyname('Casing3task').asFloat            :=mulSKUSelect[i].syCasing3;
              data.qryLocationOutItem.Fieldbyname('Casing4task').asFloat            :=mulSKUSelect[i].syCasing4;
              data.qryLocationOutItem.Fieldbyname('Casing5task').asFloat            :=mulSKUSelect[i].syCasing5;
              data.qrylocationoutItem.FieldByName('remark').AsString            :=mulskuselect[i].remark;

              data.qryLocationOutItem.Fieldbyname('price').asFloat              :=mulSKUSelect[i].price;
              data.qryLocationOutItem.Fieldbyname('Currcd').asstring            :=mulSKUSelect[i].Currcd;
              data.qryLocationOutItem.Fieldbyname('carriagecurrcd').asstring    :=mulSKUSelect[i].carriagecurrcd;
              data.qryLocationOutItem.fieldbyname('SKUCost').asFloat            :=mulSKUSelect[i].SKUCost;
              data.qryLocationOutItem.Fieldbyname('priceIn').asFloat            :=mulSKUSelect[i].priceIn;
              data.qryLocationOutItem.fieldbyname('SKUCostIn').asFloat          :=mulSKUSelect[i].SKUCostIn;
              data.qryLocationOutItem.Fieldbyname('carriage').asFloat           :=mulSKUSelect[i].carriage;
              data.qryLocationOutItem.Fieldbyname('carriagetotal').asFloat     :=mulSKUSelect[i].carriagetotal;
              data.qryLocationOutItem.fieldbyname('insurance').asFloat          :=mulSKUSelect[i].insurance;
              data.qryLocationOutItem.Fieldbyname('insurancetotal').asFloat     :=mulSKUSelect[i].insurancetotal;

              data.qryLocationOutItem.fieldbyname('CostUOMType').asstring       :=mulSKUSelect[i].CostUOMType;

              data.qryLocationOutItem.fieldbyname('LOcName').asstring           :=mulSKUSelect[i].LOcName;
              data.qryLocationOutItem.fieldbyname('locid').asstring             :=mulSKUSelect[i].locid;

              data.qryLocationOutItem.fieldbyname('JOBNOIN').asstring            :=mulSKUSelect[i].Jobno;
              data.qryLocationOutItem.Fieldbyname('SNOIN').asInteger             :=mulSKUSelect[i].SNO;
              data.qryLocationOutItem.Fieldbyname('SNOLocIN').asInteger          :=mulSKUSelect[i].LDSNO;
              data.qryLocationOutItem.Fieldbyname('LDSNOIN').asInteger           :=0;

              data.qryLocationOutItem.fieldbyname('JobnoINF').asstring           :=mulSKUSelect[i].JobnoINF;
              data.qryLocationOutItem.Fieldbyname('SNOINF').asInteger            :=mulSKUSelect[i].SNOINF;
              data.qryLocationOutItem.Fieldbyname('LDSNOINF').asInteger          :=mulSKUSelect[i].LDSNOINF;
              data.qryLocationOutItem.Fieldbyname('jobnoori').AsString           :=mulSKUSelect[i].jobnoori;
              data.qryLocationOutItem.Fieldbyname('snoori').AsInteger            :=mulSKUSelect[i].snoori;
              data.qryLocationOutItem.fieldbyname('snoorder').asstring           :='';
              data.qryLocationOutItem.fieldbyname('jobnoorder').asstring         :='';

              data.qryLocationOutItem.Fieldbyname('locationbillnoin').AsString   :=mulSKUSelect[i].locationbillno;
              data.qryLocationOutItem.Fieldbyname('customsnoin').AsString        :=mulSKUSelect[i].customsno;
              data.qryLocationOutItem.Fieldbyname('cusbillnoin').AsString        :=mulSKUSelect[i].cusbillno;
              data.qryLocationOutItem.Fieldbyname('mainorderin').AsString        :=mulSKUSelect[i].mainorder;
             //wql/07.11.15
             // data.qryLocationOutItem.Fieldbyname('mainorder').AsString        :=mulSKUSelect[i].mainorder;

              data.qryLocationOutItem.fieldbyname('LotTracked').asstring         :=mulSKUSelect[i].LotTracked;
              data.qryLocationOutItem.fieldbyname('TagEach').asstring            :=mulSKUSelect[i].TagEach;
              data.qryLocationOutItem.fieldbyname('TagEachUOM').asstring         :=mulSKUSelect[i].TagEachUOM;
              data.qryLocationOutItem.fieldbyname('WareRentCountType').asstring  :=mulSKUSelect[i].WareRentCountType;
//              data.qryLocationOutItem.fieldbyname('WareRentCountTypeout').asstring  :=mulSKUSelect[i].WareRentCountTypeout;
              data.qryLocationOutItem.fieldbyname('isbond').asstring             :=mulSKUSelect[i].isbond;
              data.qryLocationOutItem.fieldbyname('COUNTRENT').asstring          :=mulSKUSelect[i].COUNTRENT;
              data.qryLocationOutItem.fieldbyname('COUNTCONTCOST').asstring      :=mulSKUSelect[i].COUNTCONTCOST;
              data.qryLocationOutItem.Fieldbyname('LOADCOSTONE').asString        :=mulSKUSelect[i].LOADCOSTONE;
              data.qryLocationOutItem.fieldbyname('SKUCOSTCLASSCD').asstring     :=mulSKUSelect[i].SKUCOSTCLASSCD;
              data.qryLocationOutItem.Fieldbyname('RentCountUOMType').asString   :=mulSKUSelect[i].RentCountUOMType;
              data.qryLocationOutItem.Fieldbyname('RentCountUOMTypeout').asString:=mulSKUSelect[i].RentCountUOMTypeout;
              data.qryLocationOutItem.Fieldbyname('CostCountUOMType').asString   :=mulSKUSelect[i].CostCountUOMType;
              data.qryLocationOutItem.Fieldbyname('NotFullSign').asString        :=mulSKUSelect[i].NotFullSign;
              data.qryLocationOutItem.fieldbyname('Depth').asFloat          :=mulSKUSelect[i].Depth;
              data.qryLocationOutItem.fieldbyname('Width').asFloat          :=mulSKUSelect[i].Width;
              data.qryLocationOutItem.fieldbyname('Height').asFloat         :=mulSKUSelect[i].Height;
              data.qrylocationoutItem.FieldByName('istrade').AsString       :=mulSKUSelect[i].istrade;

              data.qryLocationOutItem.fieldbyname('skumodel').asstring      :=mulSKUSelect[i].skumodel;
              data.qryLocationOutItem.fieldbyname('skuspec').asstring       :=mulSKUSelect[i].skuspec;
              data.qryLocationOutItem.fieldbyname('color').asstring         :=mulSKUSelect[i].color;
              data.qryLocationOutItem.fieldbyname('customerno').asstring    :=mulSKUSelect[i].customerno;
              data.qryLocationOutItem.fieldbyname('loadgroupcusid').asstring:=copyloadgroupcusid;
              data.qryLocationOutItem.fieldbyname('loadgroupcusname').asstring:=copyloadgroupcusname;
              data.qryLocationOutItem.fieldbyname('forkgroupcusid').asstring:=copyforkgroupcusid;
              data.qryLocationOutItem.fieldbyname('forkgroupcusname').asstring:=copyforkgroupcusname;
              data.qryLocationOutItem.fieldbyname('liftmachinecusid').asstring:=copyliftmachinecusid;
              data.qryLocationOutItem.fieldbyname('liftmachinecusname').asstring:=copyliftmachinecusname;
              data.qryLocationOutItem.fieldbyname('conditiondesc').asstring:=mulSKUSelect[i].conditiondesc;
              data.qryLocationOutItem.fieldbyname('ManufactureDate').AsDateTime:=mulSKUSelect[i].ManufactureDate;
              if data.qryLocationOutItem.fieldbyname('ManufactureDate').asDateTime=0 then
                 data.qryLocationOutItem.fieldbyname('ManufactureDate').Clear;
              //威扬
              if strSysCus<>'SZWY' then
                 data.qryLocationOutItem.fieldbyname('mainorder').asstring       :=mulSKUSelect[i].mainorder
              else
              begin
                 data.qryLocationOutItem.fieldbyname('quantityshort').AsInteger:=mulSKUSelect[i].quantityshort;
                 if data.qryLocationOutItem.fieldbyname('mainorder').Asstring='' then
                    data.qryLocationOutItem.fieldbyname('mainorder').Asstring:='REP';
              end;

              if mulSKUSelect[i].SKUCOSTCLASSCD<>'' then
                 data.qrylocationoutItem.FieldByName('skucustomname').AsString :=
                     cmbSKUClass.Items[cmbSKUClass.ItemFields.indexof(mulSKUSelect[i].SKUCOSTCLASSCD)];
              strSkuSelect:='';
              strSkuSelect:=mulSKUSelect[i].JOBNO+IntToStr(mulSKUSelect[i].sno)+iif(inttostr(mulSKUSelect[i].LDSNO)='0','',inttostr(mulSKUSelect[i].LDSNO));
              if sltselect.IndexOf(strSkuSelect)=-1 then
                 sltselect.Add(strSkuSelect);
              data.qryLocationOutItem.Fieldbyname('costquantitytask').asFloat   :=mulSKUSelect[i].sycostquantity;
              data.qryLocationOutItem.Fieldbyname('costquantityuom').asstring   :=mulSKUSelect[i].costquantityuom;

              if (_paper='T') then
              begin
                 OpenSql(dataTmp.qrytmp,'  select piecepro from sku (nolock) where skuid="'+mulSKUSelect[i].SKUID+'" ');
                 data.qryLocationOutItem.Fieldbyname('propiece').asFloat:=dataTmp.qrytmp.fieldByname('piecepro').AsFloat;
                 dataTmp.qrytmp.Close;
              end;

              data.qryLocationOutItem.Fieldbyname('manudatestring').asstring   :=mulSKUSelect[i].manudatestring;
           end;
        end;
     end;
   end;
end;

procedure TfrmLocationOut.CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended;pstrtype:string='DETAIL');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   quantityfield,piecefield,volumefield,netweightfield,grossweightfield,areafield,
   casing1field,casing2field,casing3field,casing4field,casing5field,costquantityfield:string;
begin
  if _piececal then exit;
  if strSysCus<>'SZWY' then
  begin
     if _weightcal then Exit;
  end;
  if pstrtype='ITEM' then
  begin
     quantityfield:='quantitytask';
     piecefield:='piecetask';
     volumefield:='volumetask';
     netweightfield:='netweighttask';
     grossweightfield:='grossweighttask';
     areafield   :='areatask';
     casing1field:='casing1task';
     casing2field:='casing2task';
     casing3field:='casing3task';
     casing4field:='casing4task';
     casing5field:='casing5task';
     costquantityfield:='costquantitytask';
  end else
  begin
     quantityfield:='quantity';
     piecefield:='piece';
     volumefield:='volume';
     netweightfield:='netweight';
     grossweightfield:='grossweight';
     areafield   :='area';
     casing1field:='casing1';
     casing2field:='casing2';
     casing3field:='casing3';
     casing4field:='casing4';
     casing5field:='casing5';
     costquantityfield:='costquantity';
  end;
  with pqrySKU do
  begin
     //件数
     if ((OldValue<>0)) then
     FieldByName(piecefield).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(piecefield).AsFloat
                                          /oldValue);
    //体积
     if (OldValue<>0) then
     FieldByName(volumefield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(volumefield).AsFloat
                                          /oldValue;
    //面积
     if (OldValue<>0) then
     FieldByName(areafield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(areafield).AsFloat
                                          /oldValue;
    //净重
     if (OldValue<>0) then
     FieldByName(netweightfield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(netweightfield).AsFloat
                                          /oldValue;
    //毛重
     if (OldValue<>0)  then
     FieldByName(grossweightfield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(grossweightfield).AsFloat
                                          /oldValue;
    //外包装一
     if (OldValue<>0) then
     FieldByName(casing1field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing1field).AsFloat
                                          /oldValue);
    //外包装二
     if (OldValue<>0) then
     FieldByName(casing2field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing2field).AsFloat
                                          /oldValue);
    //外包装三
     if (OldValue<>0) then
     FieldByName(casing3field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing3field).AsFloat
                                          /oldValue);
   //外包装四
     if (OldValue<>0) then
     FieldByName(casing4field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing4field).AsFloat
                                          /oldValue);
   //外包装五
     if (OldValue<>0) then
     FieldByName(casing5field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing5field).AsFloat
                                          /oldValue);
     //计费单位量
     if (OldValue<>0) then
     FieldByName(costquantityfield).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(costquantityfield).AsFloat
                                          /oldValue);
  end;
end;

procedure TfrmLocationOut.mitOrderSKUSelectClick(Sender: TObject);
var
  i:integer;
  TWareOrderSKUSelect:TMultWareOrderSKUSelect;
  strwareorderSkuSelect:string;
begin
   begin
      if _StrSysCus='JG' then
        TWareOrderSKUSelect:=  WorkWareOrderSKUSelect('OUT','','',
                                                    data.qrylocationoutItem.fieldbyname('shippercusid').asstring,
                                                    data.qrylocationoutItem.fieldbyname('shippercusname').asstring,
                                                    sltselect,False,
                                                    data.qrylocationoutItem.fieldbyname('istrade').AsString)
      else
      TWareOrderSKUSelect:=  WorkWareOrderSKUSelect('OUT',data.qrylocationoutItem.fieldbyname('cusid').asstring,
                                                    data.qrylocationoutItem.fieldbyname('cusname').asstring,
                                                    data.qrylocationoutItem.fieldbyname('shippercusid').asstring,
                                                    data.qrylocationoutItem.fieldbyname('shippercusname').asstring,
                                                    sltselect,False,
                                                    data.qrylocationout.fieldbyname('istrade').AsString);
      for i:=0 to 300 do
      begin
         if TWareOrderSKUSelect[i].OkFlag then
         begin
            if i=0 then
            begin
               data.qryLocationOutItem.edit;
               data.qryLocationOut.Edit;
               data.qryLocationOut.fieldbyname('LotTracked').asstring          :=TWareOrderSKUSelect[i].LotTracked;
               data.qryLocationOut.fieldbyname('TagEach').asstring             :=TWareOrderSKUSelect[i].TagEach;
               if data.qryLocationOut.fieldbyname('WareRentCountType').asstring='' then
                  data.qryLocationOut.fieldbyname('WareRentCountType').asstring   :=TWareOrderSKUSelect[i].WareRentCountType;
               data.qryLocationOut.fieldbyname('isbond').asstring              :=TWareOrderSKUSelect[i].isbond;
               data.qryLocationOut.fieldbyname('COUNTRENT').asstring           :=TWareOrderSKUSelect[i].COUNTRENT;
               data.qryLocationOut.fieldbyname('COUNTCONTCOST').asstring       :=TWareOrderSKUSelect[i].COUNTCONTCOST;
               if data.qryLocationOut.fieldbyname('SKUCOSTCLASSCD').asstring='' then
                  data.qryLocationOut.fieldbyname('SKUCOSTCLASSCD').asstring      :=TWareOrderSKUSelect[i].SKUCOSTCLASSCD;
               data.qryLocationOut.fieldbyname('CountWho').asstring            :=TWareOrderSKUSelect[i].CountWho;
               if data.qryLocationOut.fieldbyname('loadcosttype').asstring='' then
                  data.qryLocationOut.fieldbyname('loadcosttype').asstring        :=TWareOrderSKUSelect[i].loadcosttype;
               if data.qryLocationOut.fieldbyname('costcusid').asstring='' then
                 begin
                    data.qryLocationOut.fieldbyname('costcusid').asstring       :=TWareOrderSKUSelect[i].costcusid;
                    data.qryLocationOut.fieldbyname('costcusname').asstring     :=TWareOrderSKUSelect[i].costcusname;
                 end;
     //          ckbTariffClick(self);
               if (data.qryLocationOut.fieldbyname('CustomsNO').asstring='') then
               begin
                  data.qryLocationOut.fieldbyname('CustomsNO').asstring:=TWareOrderSKUSelect[i].CustomsNO
               end;
               if (data.qryLocationOut.fieldbyname('cusbillno').asstring='') then
               begin
                  data.qryLocationOut.fieldbyname('cusbillno').asstring:=TWareOrderSKUSelect[i].cusbillno
               end;

            end else
            begin
               try
                 data.qryLocationOutItem.Post;
               except
                 break;
               end;
               data.qryLocationOutItem.append;
               data.qryLocationOutItem.fieldbyname('sno').Asinteger       :=-1;
               data.qryLocationOutItem.fieldByname('jobno').AsString      :=data.qryLocationOut.fieldbyname('jobno').AsString;
               data.qryLocationOutItem.fieldByname('userid').AsString     :=data.qryLocationOut.fieldbyname('userid').AsString;
            end;
            data.qrylocationoutitem.fieldbyname('jobnoorder').asstring   :=twareorderskuselect[i].jobno            ;
            data.qrylocationoutitem.fieldbyname('skuid').asstring        :=twareorderskuselect[i].skuid            ;
            data.qrylocationoutitem.fieldbyname('skuname').asstring      :=twareorderskuselect[i].skuname            ;
            strgetcd                                                     := twareorderskuselect[i].skuname;
            data.qrylocationoutitem.fieldbyname('snoorder').asinteger    :=twareorderskuselect[i].sno              ;
            data.qrylocationoutitem.fieldbyname('lotcode').asstring      :=twareorderskuselect[i].lotcode          ;
            data.qrylocationoutitem.fieldbyname('quantitytask').asfloat      :=twareorderskuselect[i].syquantity         ;
            if twareorderskuselect[i].qualityname<>'' then
            data.qrylocationoutitem.fieldbyname('qualityname').asstring  :=twareorderskuselect[i].qualityname
            else
            data.qrylocationoutitem.fieldbyname('qualityname').asstring     :='正品';
            data.qrylocationoutitem.fieldbyname('quantityuom').asstring     :=twareorderskuselect[i].quantityuom         ;
            data.qrylocationoutitem.fieldbyname('pieceuom').asstring        :=twareorderskuselect[i].pieceuom         ;
            data.qrylocationoutitem.fieldbyname('weightuom').asstring       :=twareorderskuselect[i].weightuom        ;
            data.qrylocationoutitem.fieldbyname('volumeuom').asstring       :=twareorderskuselect[i].volumeuom        ;
            data.qrylocationoutitem.fieldbyname('areauom').asstring         :=twareorderskuselect[i].areauom          ;
            data.qrylocationoutitem.fieldbyname('piecetask').asfloat            :=twareorderskuselect[i].sypiece            ;
            data.qrylocationoutitem.fieldbyname('netweighttask').asfloat        :=twareorderskuselect[i].synetweight        ;
            data.qrylocationoutitem.fieldbyname('grossweighttask').asfloat      :=twareorderskuselect[i].sygrossweight      ;
            data.qrylocationoutitem.fieldbyname('volumetask').asfloat           :=twareorderskuselect[i].syvolume           ;
            data.qrylocationoutitem.fieldbyname('areatask').asfloat             :=twareorderskuselect[i].syarea             ;
            data.qrylocationoutitem.fieldbyname('cusid').asstring           :=twareorderskuselect[i].cusid        ;
            data.qrylocationoutitem.fieldbyname('cusname').asstring         :=twareorderskuselect[i].cusname      ;
            data.qrylocationoutitem.fieldbyname('shippercusid').asstring    :=twareorderskuselect[i].shippercusid ;
            data.qrylocationoutitem.fieldbyname('shippercusname').asstring  :=twareorderskuselect[i].shippercusname ;
            data.qrylocationoutitem.fieldbyname('shipcusid').asstring       :=twareorderskuselect[i].shipcusid ;
            data.qrylocationoutitem.fieldbyname('shipcusname').asstring     :=twareorderskuselect[i].shipcusname ;
            data.qrylocationoutitem.fieldbyname('costcusid').asstring       :=twareorderskuselect[i].costcusid ;
            data.qrylocationoutitem.fieldbyname('costcusname').asstring     :=twareorderskuselect[i].costcusname ;
            if (_strsyscus='SHRL') and (twareorderskuselect[i].locid='') then
            begin
               Opensql(datatmp.qryTmp,' select top 1 locid,locname from locationindetail(nolock) '
                                     +'  where jobno="'+twareorderskuselect[i].jobnoin+'" '
                                     +'    and sno='+inttostr(twareorderskuselect[i].snoin)+' '
                                     +'    and isnull(quantity,0)-isnull(quantitydo,0)>='+data.qrylocationoutitem.fieldbyname('quantitytask').asstring
                      );
               data.qrylocationoutitem.fieldbyname('locid').asstring           :=datatmp.qryTmp.fieldbyname('locid').asstring;
               data.qrylocationoutitem.fieldbyname('locname').asstring         :=datatmp.qryTmp.fieldbyname('locname').asstring;
            end else
            begin
               data.qrylocationoutitem.fieldbyname('locid').asstring           :=twareorderskuselect[i].locid       ;
               data.qrylocationoutitem.fieldbyname('locname').asstring         :=twareorderskuselect[i].locname     ;
            end;
            data.qrylocationoutitem.fieldbyname('piecepro').asfloat         :=0;
            data.qrylocationoutitem.fieldbyname('volumepro').asfloat        :=0;
            data.qrylocationoutitem.fieldbyname('netweightpro').asfloat     :=0;
            data.qrylocationoutitem.fieldbyname('grossweightpro').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('areapro').asfloat          :=0;

            data.qrylocationoutitem.fieldbyname('uom1').asstring            :=twareorderskuselect[i].uom1;
            data.qrylocationoutitem.fieldbyname('uom2').asstring            :=twareorderskuselect[i].uom2;
            data.qrylocationoutitem.fieldbyname('uom3').asstring            :=twareorderskuselect[i].uom3;
            data.qrylocationoutitem.fieldbyname('uom4').asstring            :=twareorderskuselect[i].uom4;
            data.qrylocationoutitem.fieldbyname('uom5').asstring            :=twareorderskuselect[i].uom5;
            data.qrylocationoutitem.fieldbyname('pro1').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('pro2').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('pro3').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('pro4').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('pro5').asfloat   :=0;
            data.qrylocationoutitem.fieldbyname('casing1task').asfloat       :=twareorderskuselect[i].sycasing1;
            data.qrylocationoutitem.fieldbyname('casing2task').asfloat       :=twareorderskuselect[i].sycasing2;
            data.qrylocationoutitem.fieldbyname('casing3task').asfloat       :=twareorderskuselect[i].sycasing3;
            data.qrylocationoutitem.fieldbyname('casing4task').asfloat       :=twareorderskuselect[i].sycasing4;
            data.qrylocationoutitem.fieldbyname('casing5task').asfloat       :=twareorderskuselect[i].sycasing5;

            data.qrylocationoutitem.fieldbyname('price').asfloat             :=twareorderskuselect[i].price;
            data.qrylocationoutitem.fieldbyname('currcd').asstring           :=twareorderskuselect[i].currcd;
            data.qryLocationOutItem.Fieldbyname('carriagecurrcd').asstring    :=twareorderskuselect[i].carriagecurrcd;
            data.qrylocationoutitem.fieldbyname('skucost').asfloat           :=twareorderskuselect[i].skucost;
            data.qrylocationoutitem.fieldbyname('pricein').asfloat           :=twareorderskuselect[i].pricein;
            data.qrylocationoutitem.fieldbyname('skucostin').asfloat         :=twareorderskuselect[i].skucostin;
            data.qrylocationoutitem.fieldbyname('costuomtype').asstring      :=twareorderskuselect[i].costuomtype;
            data.qrylocationoutitem.fieldbyname('jobnoin').asstring          :=twareorderskuselect[i].jobnoin;
            data.qrylocationoutitem.fieldbyname('snoin').asinteger           :=twareorderskuselect[i].snoin;
            data.qrylocationoutitem.fieldbyname('snolocin').asinteger        :=twareorderskuselect[i].snolocin;
            data.qrylocationoutitem.fieldbyname('jobnoori').asstring         :=twareorderskuselect[i].jobnoori;
            if (_strsyscus='JG')  then
            begin
                data.qrylocationoutitem.fieldbyname('snoori').asinteger      :=twareorderskuselect[i].oriskusno;
            end else
            begin
                data.qrylocationoutitem.fieldbyname('snoori').asinteger      :=twareorderskuselect[i].snoori;
            end;
            data.qrylocationoutitem.fieldbyname('ldsnoin').asinteger         :=twareorderskuselect[i].ldsnoin;
            data.qrylocationoutitem.fieldbyname('jobnoinf').asstring         :=twareorderskuselect[i].jobnoinf;
            data.qrylocationoutitem.fieldbyname('snoinf').asinteger          :=twareorderskuselect[i].snoinf;
            data.qrylocationoutitem.fieldbyname('ldsnoinf').asinteger        :=twareorderskuselect[i].ldsnoinf;
            data.qrylocationoutitem.fieldbyname('customsno').asstring        :=twareorderskuselect[i].customsno;
            data.qrylocationoutitem.fieldbyname('customsnoin').asstring        :=twareorderskuselect[i].customsnoin;
            data.qrylocationoutitem.fieldbyname('locationbillnoin').asstring   :=twareorderskuselect[i].locationbillno;
            data.qrylocationoutitem.fieldbyname('cusbillnoin').asstring      :=twareorderskuselect[i].cusbillnoin;
            data.qrylocationoutitem.fieldbyname('lottracked').asstring       :=twareorderskuselect[i].lottracked;
            data.qrylocationoutitem.fieldbyname('tageach').asstring          :=twareorderskuselect[i].tageach;
            data.qrylocationoutitem.fieldbyname('tageachuom').asstring       :=twareorderskuselect[i].tageachuom;
            if data.qrylocationoutitem.fieldbyname('warerentcounttype').asstring='' then
               data.qrylocationoutitem.fieldbyname('warerentcounttype').asstring:=twareorderskuselect[i].warerentcounttype;
            data.qrylocationoutitem.fieldbyname('isbond').asstring           :=twareorderskuselect[i].isbond;
            data.qrylocationoutitem.fieldbyname('countrent').asstring        :=twareorderskuselect[i].countrent;
            data.qrylocationoutitem.fieldbyname('countcontcost').asstring    :=twareorderskuselect[i].countcontcost;
            data.qrylocationoutitem.fieldbyname('loadcostone').asstring      :=twareorderskuselect[i].loadcostone;
            data.qrylocationoutitem.fieldbyname('skucostclasscd').asstring   :=twareorderskuselect[i].skucostclasscd;
            data.qrylocationoutitem.fieldbyname('rentcountuomtype').asstring :=twareorderskuselect[i].rentcountuomtype;
            data.qrylocationoutitem.fieldbyname('costcountuomtype').asstring :=twareorderskuselect[i].costcountuomtype;

            data.qryLocationOutItem.fieldbyname('skumodel').asstring         :=twareorderskuselect[i].skumodel;
            data.qryLocationOutItem.fieldbyname('skuspec').asstring          :=twareorderskuselect[i].skuspec;
            data.qryLocationOutItem.fieldbyname('color').asstring            :=twareorderskuselect[i].color;
            data.qryLocationOutItem.fieldbyname('customerno').asstring       :=twareorderskuselect[i].customerno;
            data.qryLocationOutItem.fieldbyname('outzoneno').asstring       :=twareorderskuselect[i].outzoneno;
            data.qryLocationOutItem.fieldbyname('mainorder').asstring       :=twareorderskuselect[i].mainorder;
            data.qryLocationOutItem.fieldbyname('mainorderin').asstring       :=twareorderskuselect[i].mainorderin;
            if twareorderskuselect[i].SKUCOSTCLASSCD<>'' then
               data.qrylocationoutItem.FieldByName('skucustomname').AsString :=
                  cmbSKUClass.Items[cmbSKUClass.ItemFields.indexof(twareorderskuselect[i].SKUCOSTCLASSCD)];
            //lzw20100304
            strwareorderSkuSelect:='';
            strwareorderSkuSelect:=twareorderskuselect[i].JOBNO+IntToStr(twareorderskuselect[i].sno);
            if sltselect.IndexOf(strwareorderSkuSelect)=-1 then
               sltselect.Add(strwareorderSkuSelect);

            data.qryLocationOutItem.fieldbyname('remark').asstring           :=twareorderskuselect[i].remark;
            data.qryLocationOutItem.fieldbyname('costquantitytask').AsFloat      :=twareorderskuselect[i].sycostquantity;
            data.qryLocationOutItem.fieldbyname('costquantityuom').asstring  :=twareorderskuselect[i].costquantityuom;

         end;
      end;
   end;
end;

procedure TfrmLocationOut.UpdateTransferInfo(strSender: string);
{将data.qryLocationOutItem中的相关信息更新到data.qryLocationOutDetail中
}
begin
   if DataState in Setdcs then
   begin
      data.qryLocationOutDetail.DisableControls;
      Bookmark:= data.qryLocationOutDetail.GetBookmark;
      data.qryLocationOutDetail.First;
      while not data.qryLocationOutDetail.Eof do
      begin
         data.qryLocationOutDetail.Edit;
         if uppercase(strSender)='TAGTOTAL' then
           data.qryLocationOutDetail.Fieldbyname('TagTotal').asInteger:=data.qryLocationOutItem.Fieldbyname('TagTotal').asInteger;
         if uppercase(strSender)='TRANSFERLOCATION' then
           data.qryLocationOutDetail.Fieldbyname('Location_Transfer').asstring:=data.qryLocationOutItem.Fieldbyname('Location_Transfer').asstring;
         data.qryLocationOutDetail.Next;
      end;
      data.qryLocationOutDetail.GotoBookmark(Bookmark);
      data.qryLocationOutDetail.FreeBookmark(Bookmark);
      bookMark:=nil;
      data.qryLocationOutDetail.EnableControls;
   end;
end;

function TfrmLocationOut.CheckItemDetailInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer):Boolean;
{校验data.qryLocationOutItem、data.qryLocationOut与data.qryLocationOutDetail的数据,是否一致
   pstrFieldENGName:字段英文名
   pstrFieldCHNName:字段中文名
   pValueDetail:该字段当前值
   pType       :当取值为-1时表示字段类型为字符型,且与data.qryLocationOutItem比较
                当取值为-2时表示字段类型为字符型,且与data.qryLocationOut比较
                当取值为1时表示字段类型为数字型,且与data.qryLocationOutItem比较
}
begin
   result:=True;
   
   if pType=-1 then
   begin
      if data.qryLocationOutDetail.fieldbyname(pstrFieldENGName).AsString<>data.qryLocationOutItem.fieldbyname(pstrFieldENGName).AsString then
      begin
         kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+data.qryLocationOutDetail.fieldbyname(pstrFieldENGName).AsString
                    +','+GetMessage('frmLocationIN','025')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);
         // '该条仓位信息中的'',与商品-实际中的' '不一致!'
         result:=False;
      end;
   end else
   if pType=-2 then
   begin
     if iif(data.qryLocationOutDetail.fieldbyname(pstrFieldENGName).AsString='','F',data.qryLocationOutDetail.fieldbyname(pstrFieldENGName).AsString)<>data.qryLocationOut.fieldbyname(pstrFieldENGName).AsString then
     begin
        kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+data.qryLocationOutDetail.fieldbyname(pstrFieldENGName).AsString
                   +','+GetMessage('frmLocationIN','027')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);
        //'该条仓位信息中的'',与基本信息中的'  '不一致!'
        result:=False;
     end;
   end else
   if pType=2 then
   begin
      if blntotal=True then
      begin
         Result:=true;
         exit;
      end;
      if //(pValueDetail<>0) and
         (KRound(pValueDetail,4)<>KRound(data.qryLocationOutItem.fieldbyname(pstrFieldENGName).AsFloat,4))
         then
      begin
         if _StrSysCus='JG' then
         begin
           kMessageDlg(pstrFieldCHNName+'与出仓实际仓位信息中的数量不一致！', mtWarning, [mbOK], 0);
         end else
         begin
           kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+FloatTOStr(pValueDetail)
                      +','+GetMessage('frmLocationIN','025')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);
         end;
         //'该条仓位信息中的' ',与商品-实际中的''不一致!'
         result:=False;
         blntotal:=false;

//         if KMessageDlg('出仓任务需和实际信息一致,更正任务信息吗?',mtConfirmation,[mbyes,mbno],0)<>mryes then
//         begin
//            result:=False;
//            blntotal:=false;
//         end else
//         begin
//            Result:=true;
//            blntotal:=True;
//         end;
      end;
   end else
   if pType=1 then
   begin
      if (pValueDetail<>0) and
         (KRound(pValueDetail,4)>KRound(data.qryLocationOutItem.fieldbyname(pstrFieldENGName).AsFloat,4))
         then
      begin
         kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+FloatTOStr(pValueDetail)
                    +','+GetMessage('frmLocationIN','028')+pstrFieldCHNName+'!', mtWarning, [mbOK], 0);
         //'该条仓位信息中的' ',大于商品-实际中的'
         result:=False;
      end;
   end;
end;
  //出仓才用的校验
function TfrmLocationout.CheckItemTaskInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer;pBoolean:Boolean=True):Boolean;
{校验data.qryLocationOutItemTask、data.qryLocationOut的数据,是否一致
   pstrFieldENGName:字段英文名
   pstrFieldCHNName:字段中文名
   pValueDetail:该字段当前值
   pType       :当取值为-1时表示字段类型为字符型,且与data.qryLocationOutItem比较
                当取值为-2时表示字段类型为字符型,且与data.qryLocationOut比较
                当取值为1时表示字段类型为数字型,且与data.qryLocationOutItem比较
}
var
  blncheck:Boolean;
begin
  result:=True;
  blncheck:=false;

  if ((getSysdata('warerent')='T') and (pstrFieldENGName='WareRentCountType')) then
     blncheck:=True;

  if ((getSysdata('qdtext')='T') and (pstrFieldENGName='isbond')) then
     blncheck:=True;

  if (pType=-2) and (not blncheck) then
  begin
    if iif(pBoolean and (data.qrylocationoutItem.fieldbyname(pstrFieldENGName).AsString=''),'F',data.qryLocationOutItem.fieldbyname(pstrFieldENGName).AsString) <>
       iif(pBoolean and (data.qryLocationOut.fieldbyname(pstrFieldENGName).AsString=''),'F',data.qryLocationOut.fieldbyname(pstrFieldENGName).AsString) then
    begin
      kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+data.qryLocationOutItem.fieldbyname(pstrFieldENGName).AsString
                 +','+GetMessage('frmLocationIN','027')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);
     //'该条任务信息中的'  ',与基本信息中的' '不一致!'
      result:=False;
    end;
  end;
end;

procedure TfrmLocationOut.ckbContractClick(Sender: TObject);
begin
   if (DataState in Setdcs) and ckbContract.Checked then
   begin
      data.qryLocationOut.Edit;
      data.qryLocationOut.FieldByName('COUNTLOADCOST').Asstring:='F';
      data.qryLocationOut.FieldByName('COUNTRENT').Asstring:='F';
   end;
end;

procedure TfrmLocationOut.btnTotalClick(Sender: TObject);
var
   QuantityTotal, PieceTotal:Extended;
   VolumeTotal, AreaTotal, NetWeightTotal, GrossWeightTotal:Extended;
   QuantityTotalTask, PieceTotalTask:Extended;
   VolumeTotalTask, AreaTotalTask, NetWeightTotalTask, GrossWeightTotalTask:Extended;
   CostTotal,CostTotalIn:Extended;
   strSKUNameTotal:string;
   costquantitytotal,costquantitytasktotal:Extended;

//   strQuantityUOM,strPieceUOM,strVolumeUOM,strAreaUOM,strWeightUOM:string;
//   blnQuantityLike,blnPieceLike,blnVolumeLike,blnWeightLike,blnAreaLike:Boolean;
begin
   if DataState in Setdcs then
   begin
      data.qryLocationout.Edit;
      QuantityTotalTask:=0;
      PieceTotalTask   :=0;
      VolumeTotalTask  :=0;
      AreaTotalTask    :=0;
      NetWeightTotalTask  :=0;
      GrossWeightTotalTask:=0;
      QuantityTotal:=0;
      PieceTotal:=0;
      VolumeTotal:=0;
      AreaTotal:=0;
      NetWeightTotal:=0;
      GrossWeightTotal:=0;
      CostTotal:=0;
      CostTotalIn:=0;
      costquantitytotal:=0;
      costquantitytasktotal:=0;
      strSKUNameTotal:='';
//      blnQuantityLike:=True;
//      blnPieceLike   :=True;
//      blnVolumeLike  :=True;
//      blnWeightLike  :=True;
//      blnAreaLike    :=True;
      data.qryLocationoutItem.DisableControls;
      Bookmark:= data.qryLocationoutItem.GetBookmark;
      data.qryLocationoutItem.First;
      while not data.qryLocationoutItem.Eof do
      begin
         QuantityTotalTask:=QuantityTotalTask
                            +data.qryLocationoutItem.fieldbyname('quantitytask').AsFloat;
         PieceTotalTask:=PieceTotalTask+data.qryLocationoutItem.fieldbyname('piecetask').AsFloat;
         QuantityTotal :=QuantityTotal
                            +data.qryLocationoutItem.fieldbyname('quantity').AsFloat;
         PieceTotal:=PieceTotal+data.qryLocationoutItem.fieldbyname('piece').AsFloat;
         CostTotal           :=CostTotal+data.qryLocationoutItem.fieldbyname('SKUCost').asfloat;
         CostTotalIn         :=CostTotalIn+data.qryLocationoutItem.fieldbyname('SKUCostIn').asfloat;
         NetWeightTotalTask:=NetWeightTotalTask+data.qryLocationoutItem.fieldbyname('NetWeighttask').asfloat;
         NetWeightTotal:=NetWeightTotal+data.qryLocationoutItem.fieldbyname('NetWeight').asfloat;
         GrossWeightTotalTask:=GrossWeightTotalTask+data.qryLocationoutItem.fieldbyname('GrossWeighttask').asfloat;
         GrossWeightTotal:=GrossWeightTotal+data.qryLocationoutItem.fieldbyname('GrossWeight').asfloat;
         AreaTotalTask:=AreaTotalTask+data.qryLocationoutItem.fieldbyname('Areatask').asfloat;
         AreaTotal:=AreaTotal+data.qryLocationoutItem.fieldbyname('Area').asfloat;
         VolumeTotalTask:=VolumeTotalTask+data.qryLocationoutItem.fieldbyname('Volumetask').asfloat;
         VolumeTotal:=VolumeTotal+data.qryLocationoutItem.fieldbyname('Volume').asfloat;
         costquantitytotal:=costquantitytotal+data.qryLocationoutItem.fieldbyname('costquantity').asfloat;
         costquantitytasktotal:=costquantitytasktotal+data.qryLocationoutItem.fieldbyname('costquantitytask').asfloat;

         if Pos(data.qryLocationoutItem.fieldbyname('SKUName').AsString,strSKUNameTotal)=0 then
            strSKUNameTotal:=strSKUNameTotal+data.qryLocationoutItem.fieldbyname('SKUName').AsString+' ';  


{
         if blnQuantityLike and ((trim(strQuantityUOM)='')
            or (strQuantityUOM=data.qryLocationoutItem.fieldbyname('QuantityUOM').AsString)) then
         begin
            strQuantityUOM   :=data.qryLocationoutItem.fieldbyname('QuantityUOM').AsString;
         end else blnQuantityLike:=False;

         if blnPieceLike and ((trim(strQuantityUOM)='')
            or (strPieceUOM=data.qryLocationoutItem.fieldbyname('PieceUOM').AsString)) then
         begin
            strPieceUOM   :=data.qryLocationoutItem.fieldbyname('PieceUOM').AsString;
         end else blnPieceLike:=False;

         if blnVolumeLike and ((trim(strQuantityUOM)='')
             or (strVolumeUOM=data.qryLocationoutItem.fieldbyname('VolumeUOM').AsString)) then
         begin
             VolumeTotalTask:=VolumeTotalTask+data.qryLocationoutItem.fieldbyname('Volumetask').asfloat;
             VolumeTotal:=VolumeTotal+data.qryLocationoutItem.fieldbyname('Volume').asfloat;
             strVolumeUOM   :=data.qryLocationoutItem.fieldbyname('VolumeUOM').AsString;
         end else blnVolumeLike:=False;

         if blnWeightLike and ((trim(strQuantityUOM)='')
            or (strWeightUOM=data.qryLocationoutItem.fieldbyname('WeightUOM').AsString)) then
         begin
            NetWeightTotalTask:=NetWeightTotalTask+data.qryLocationoutItem.fieldbyname('NetWeighttask').asfloat;
            NetWeightTotal:=NetWeightTotal+data.qryLocationoutItem.fieldbyname('NetWeight').asfloat;
            GrossWeightTotalTask:=GrossWeightTotalTask+data.qryLocationoutItem.fieldbyname('GrossWeighttask').asfloat;
            GrossWeightTotal:=GrossWeightTotal+data.qryLocationoutItem.fieldbyname('GrossWeight').asfloat;
            strWeightUOM   :=data.qryLocationoutItem.fieldbyname('WeightUOM').AsString;
         end else blnWeightLike:=False;

         if blnAreaLike and ((trim(strQuantityUOM)='')
            or (strAreaUOM=data.qryLocationoutItem.fieldbyname('AreaUOM').AsString)) then
         begin
            AreaTotalTask:=AreaTotalTask+data.qryLocationoutItem.fieldbyname('Areatask').asfloat;
            AreaTotal:=AreaTotal+data.qryLocationoutItem.fieldbyname('Area').asfloat;
            strAreaUOM   :=data.qryLocationoutItem.fieldbyname('AreaUOM').AsString;
         end else blnAreaLike:=False;

         CostTotal           :=CostTotal+data.qryLocationoutItem.fieldbyname('SKUCost').asfloat;
         CostTotalIn         :=CostTotalIn+data.qryLocationoutItem.fieldbyname('SKUCostIn').asfloat;
}
         data.qryLocationoutItem.Next;
      end;
      data.qryLocationoutItem.GotoBookmark(Bookmark);
      data.qryLocationoutItem.FreeBookmark(Bookmark);
      bookMark:=nil;
      data.qryLocationoutItem.EnableControls;
{
      if ((trim(data.qryLocationout.fieldbyname('SKUNAME').asString)='') or
         (_TotalExistsUpdate='T')) and (strSKUNameTotal<>'') then
         data.qryLocationout.fieldbyname('SKUNAME').asString:=deleteJVHZ(strSKUNameTotal,50);
      if (data.qryLocationout.fieldbyname('Quantitytasked').AsFloat=0) or
         (_TotalExistsUpdate='T') then
      begin
         data.qryLocationout.fieldbyname('Quantitytasked').AsFloat:=QuantityTotalTask;
         data.qryLocationout.fieldbyname('Quantity').AsFloat:=QuantityTotal;
      end;

      if (data.qryLocationout.fieldbyname('PieceTasked').AsFloat=0) or
         (_TotalExistsUpdate='T') then
      begin
          data.qryLocationout.fieldbyname('PieceTasked').AsFloat:=PieceTotalTask;
          data.qryLocationout.fieldbyname('Piece').AsFloat:=PieceTotal;
      end;
      if blnQuantityLike then
      begin
         data.qryLocationout.fieldbyname('QuantityUOM').asString:=strQuantityUOM;
      end else
      begin
         data.qryLocationout.fieldbyname('QuantityUOM').asString:='';
      end;
      if (blnPieceLike) then
      begin
         data.qryLocationout.fieldbyname('PieceUOM').asString:=strPieceUOM;
      end else
      begin
         data.qryLocationout.fieldbyname('PieceUOM').asString:='';
      end;
      if (blnVolumeLike) then
      begin
         data.qryLocationout.fieldbyname('Volume').asfloat:=VolumeTotal;
         data.qryLocationout.fieldbyname('VolumeTasked').asfloat:=VolumeTotalTask;
         data.qryLocationout.fieldbyname('VolumeUOM').asString:=strVolumeUOM;
      end else
      begin
         data.qryLocationout.fieldbyname('Volume').asfloat:=0;
         data.qryLocationout.fieldbyname('VolumeTasked').asfloat:=0;
         data.qryLocationout.fieldbyname('VolumeUOM').asString:='';
      end;
      if (blnAreaLike)  then
      begin
          data.qryLocationout.fieldbyname('Area').asfloat:=AreaTotal;
          data.qryLocationout.fieldbyname('AreaTasked').asfloat:=AreaTotalTask;
          data.qryLocationout.fieldbyname('AreaUOM').asString:=strAreaUOM;
      end else
      begin
         data.qryLocationout.fieldbyname('AreaTasked').asfloat:=0;
         data.qryLocationout.fieldbyname('Area').asfloat:=0;
         data.qryLocationout.fieldbyname('AreaUOM').asString:='';
      end;
      if (blnWeightLike)   then
      begin
         data.qryLocationout.fieldbyname('NetWeightTasked').asFloat:=NetWeightTotalTask;
         data.qryLocationout.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
         data.qryLocationout.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
         data.qryLocationout.fieldbyname('GrossWeightTasked').asFloat:=GrossWeightTotalTask;
         data.qryLocationout.fieldbyname('WeightUOM').asString:=strWeightUOM;
      end else
      begin
         data.qryLocationout.fieldbyname('NetWeight').asFloat:=0;
         data.qryLocationout.fieldbyname('GrossWeight').asFloat:=0;
         data.qryLocationout.fieldbyname('NetWeightTasked').asFloat:=0;
         data.qryLocationout.fieldbyname('GrossWeightTasked').asFloat:=0;
         data.qryLocationout.fieldbyname('WeightUOM').asString:='';
      end;
      data.qryLocationout.fieldbyname('SKUCost').asFloat:=CostTotal;
  //out    data.qryLocationout.fieldbyname('SKUCostIn').asFloat:=CostTotalin;
}
//全部合计
      data.qryLocationout.fieldbyname('Quantitytasked').AsFloat:=QuantityTotalTask;
      data.qryLocationout.fieldbyname('Quantity').AsFloat:=QuantityTotal;
      data.qryLocationout.fieldbyname('PieceTasked').AsFloat:=PieceTotalTask;
      data.qryLocationout.fieldbyname('Piece').AsFloat:=PieceTotal;
      data.qryLocationout.fieldbyname('Volume').asfloat:=VolumeTotal;
      data.qryLocationout.fieldbyname('VolumeTasked').asfloat:=VolumeTotalTask;
      data.qryLocationout.fieldbyname('Area').asfloat:=AreaTotal;
      data.qryLocationout.fieldbyname('AreaTasked').asfloat:=AreaTotalTask;
      data.qryLocationout.fieldbyname('NetWeightTasked').asFloat:=NetWeightTotalTask;
      data.qryLocationout.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
      data.qryLocationout.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
      data.qryLocationout.fieldbyname('GrossWeightTasked').asFloat:=GrossWeightTotalTask;
      data.qryLocationout.fieldbyname('costquantity').asFloat:=costquantitytotal;
      data.qryLocationout.fieldbyname('costquantityTasked').asFloat:=costquantitytasktotal;
      data.qryLocationout.fieldbyname('SKUCost').asFloat:=CostTotal;
      data.qryLocationout.fieldbyname('SKUname').AsString:=strSKUNameTotal;
      blnTotaled:=True;
   end;
end;

procedure TfrmLocationOut.mitSplitClick(Sender: TObject);
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
   if DataState in Setdcs then
   begin
      if strFlow='ITEM' then
      begin
         if (data.qryLocationout.FieldByName('VolumeTasked').AsFloat=0) and
            (data.qryLocationout.FieldByName('AreaTasked').AsFloat=0) and
            (data.qryLocationout.FieldByName('GrossWeightTasked').AsFloat=0) and
            (data.qryLocationout.FieldByName('NetWeightTasked').AsFloat=0) then exit;

         extVolume:=data.qryLocationout.FieldByName('VolumeTasked').AsFloat;
         extArea:=data.qryLocationout.FieldByName('AreaTasked').AsFloat;
         extGrossWeight:=data.qryLocationout.FieldByName('GrossWeightTasked').AsFloat;
         extNetWeight:=data.qryLocationout.FieldByName('NetWeightTasked').AsFloat;
         //取得数量合计
         data.qryLocationoutItem.DisableControls;
         data.qryLocationoutItem.first;
         while not data.qryLocationoutItem.eof do
         begin
            QuantityTotal   :=QuantityTotal+data.qryLocationoutItem.fieldbyname('Quantitytask').AsFloat;
            data.qryLocationoutItem.Next;
         end;
         LastSNO:=data.qryLocationoutItem.fieldbyname('SNO').AsInteger;
         data.qryLocationoutItem.First;
         data.qryLocationoutItem.EnableControls;
         //数量拆分
         data.qryLocationoutItem.DisableControls;
         data.qryLocationoutItem.first;
         while not data.qryLocationoutItem.eof do
         begin
            data.qryLocationoutItem.Edit;
            if extVolume<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('Volumetask').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantitytask').asFloat*extVolume/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('Volumetask').asfloat:=extVolume-VolumeTotal;
            if extArea<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('Areatask').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantitytask').asFloat*extArea/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('Areatask').asfloat:=extArea-AreaTotal;
            if extNetWeight<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('NetWeighttask').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantitytask').asFloat*extNetWeight/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('NetWeighttask').asfloat:=extNetWeight-NetWeightTotal;
            if extGrossWeight<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('GrossWeighttask').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantitytask').asFloat*extGrossWeight/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('GrossWeighttask').asfloat:=extGrossWeight-GrossWeightTotal;

            VolumeTotal     :=VolumeTotal+data.qryLocationoutItem.fieldbyname('Volumetask').asfloat;
            AreaTotal       :=AreaTotal+data.qryLocationoutItem.fieldbyname('Areatask').asfloat;
            NetWeightTotal  :=NetWeightTotal+data.qryLocationoutItem.fieldbyname('NetWeighttask').asfloat;
            GrossWeightTotal:=GrossWeightTotal+data.qryLocationoutItem.fieldbyname('GrossWeighttask').asfloat;

            data.qryLocationoutItem.Next;
         end;
         data.qryLocationoutItem.First;
         data.qryLocationoutItem.EnableControls;
      end;
      if ItemDetailEdit.Enabled and not grdLocationINOUTItemReadOnly then  //实际商品
      begin
         if (data.qryLocationout.FieldByName('Volume').AsFloat=0) and
            (data.qryLocationout.FieldByName('Area').AsFloat=0) and
            (data.qryLocationout.FieldByName('GrossWeight').AsFloat=0) and
            (data.qryLocationout.FieldByName('NetWeight').AsFloat=0) then exit;

         extVolume:=data.qryLocationout.FieldByName('Volume').AsFloat;
         extArea:=data.qryLocationout.FieldByName('Area').AsFloat;
         extGrossWeight:=data.qryLocationout.FieldByName('GrossWeight').AsFloat;
         extNetWeight:=data.qryLocationout.FieldByName('NetWeight').AsFloat;
         //取得数量合计
         data.qryLocationoutItem.DisableControls;
         data.qryLocationoutItem.first;
         while not data.qryLocationoutItem.eof do
         begin
            QuantityTotal   :=QuantityTotal+data.qryLocationoutItem.fieldbyname('Quantity').AsFloat;
            data.qryLocationoutItem.Next;
         end;
         LastSNO:=data.qryLocationoutItem.fieldbyname('SNO').AsInteger;
         data.qryLocationoutItem.First;
         data.qryLocationoutItem.EnableControls;
         //数量拆分
         data.qryLocationoutItem.DisableControls;
         data.qryLocationoutItem.first;
         while not data.qryLocationoutItem.eof do
         begin
            data.qryLocationoutItem.Edit;
            if extVolume<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('Volume').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('Volume').asfloat:=extVolume-VolumeTotal;
            if extArea<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('Area').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantity').asFloat*extArea/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('Area').asfloat:=extArea-AreaTotal;
            if extNetWeight<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('NetWeight').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantity').asFloat*extNetWeight/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('NetWeight').asfloat:=extNetWeight-NetWeightTotal;
            if extGrossWeight<>0 then
              if data.qryLocationoutItem.fieldbyname('SNO').asfloat<>LastSNO then
                data.qryLocationoutItem.fieldbyname('GrossWeight').asfloat:=kround(data.qryLocationoutItem.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
              else
                data.qryLocationoutItem.fieldbyname('GrossWeight').asfloat:=extGrossWeight-GrossWeightTotal;

            VolumeTotal     :=VolumeTotal+data.qryLocationoutItem.fieldbyname('Volume').asfloat;
            AreaTotal       :=AreaTotal+data.qryLocationoutItem.fieldbyname('Area').asfloat;
            NetWeightTotal  :=NetWeightTotal+data.qryLocationoutItem.fieldbyname('NetWeight').asfloat;
            GrossWeightTotal:=GrossWeightTotal+data.qryLocationoutItem.fieldbyname('GrossWeight').asfloat;

            data.qryLocationoutItem.Next;
         end;
         data.qryLocationoutItem.First;
         data.qryLocationoutItem.EnableControls;
      end;
   end;
end;

procedure TfrmLocationOut.mitDetail_INClick(Sender: TObject);
var strJobnoIN:string;
begin
   with data.qryLocationOutDetail do
   begin
      if Sender=mitDetail_IN then
      begin
        if FieldByName('JobnoIN').AsString='' then exit;
        strJobnoIN:=FieldByName('JobnoIN').AsString;
      end else
      if Sender=mitDetail_IN_F  then
      begin
        if FieldByName('JobnoINF').AsString='' then exit;
        strJobnoIN:=FieldByName('JobnoINF').AsString;
      end;

      case strJobnoIN[5] of
      //进出仓
      'L':
          WorkLocationIN(stBrowse,strJobnoIN,strFlow,nil,nil);
      //指令单
      'O':
  //        WorkWareOrder(stBrowse,strJobnoIN,_databaseid,strInOut,nil,nil);
      end;
   end;
end;

procedure TfrmLocationOut.mitItem_INClick(Sender: TObject);
var
   strJobnoIN:string;
begin
   with data.qryLocationOutItem do
   begin
      if Sender=mitItem_IN then
      begin
         if FieldByName('JobnoIN').AsString='' then exit;
         strJobnoIN:=FieldByName('JobnoIN').AsString;
      end else
      if Sender=mitItem_IN_F then
      begin
         if FieldByName('JobnoINF').AsString='' then exit;
         strJobnoIN:=FieldByName('JobnoINF').AsString;
      end;
      case strJobnoIN[5] of
      //进出仓
      'L':
          WorkLocationIN(stBrowse,strJobnoIN,strFlow,nil,nil);
      //指令单
      'O':
  //         WorkWareOrderdxAll(stBrowse,strJobnoIN,_databaseid,nil,nil);
      //移仓
      end;
   end;
end;

procedure TfrmLocationOut.edtCostCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostCus.Text='' then
      begin
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('costcusid').AsString:='';
         data.qryLocationOut.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtCostCus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOut.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            //lzw20090512
            if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
            begin
               data.qryLocationOut.FieldByName('mincostin').AsString  :=qrySelect.FieldByName('mincostin').asstring;
            end;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
      if edtCostCus.Text<>'' then
         InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+edtCostCus.TextField+'"');
   end;
end;

procedure TfrmLocationOut.edtSNOEnter(Sender: TObject);
begin
   if (DataState in Setdcs) then
      TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmLocationOut.edtCost_SNOEnter(Sender: TObject);
begin
   if (DataState in Setdcs) then
      TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmLocationOut.edtCostCusEnter(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      TdxDBButtonEdit(sender).DirectInput:=True;
      stroldCostcus:=edtCostcus.Text;
   end;
end;

function TfrmLocationOut.CompareTaskItem(pstrType:string):Boolean;
//比较任务与实际，返回值表示是否一致
//pstrType:  操作类型  LA比较实际的数量不得大于任务数量
//                     VA将实际数量赋予任务数量
//                     EQ比较实际数量与任务数量是否一致
begin
   Result:=False;
   data.qryLocationOutItem.DisableControls;
   data.qryLocationOutItem.first;
   while not data.qryLocationOutItem.eof do
   begin
      if pstrType='LA' then
      begin
         if data.qryLocationOutItem.FieldByName('Quantity').AsFloat>data.qryLocationOutItem.FieldByName('Quantitytask').AsFloat then
         begin
    //        kMessageDlg('商品实际数量不得大于任务数量!', mtWarning, [mbOK], 0);
            if pgcLocationINOUT.activepage<>tbsSKU
            then pgcLocationINOUT.activepage:=tbsSKU;
            grdLocationOutItem.setfocus;
            data.qryLocationOutItem.EnableControls;
            exit;
         end;
      end else
      if pstrType='VA' then
      begin
         data.qryLocationOutItem.Edit;
         data.qryLocationOutItem.fieldbyname('Quantitytask').AsFloat :=data.qryLocationOutItem.fieldbyname('Quantity').AsFloat ;
         data.qryLocationOutItem.fieldbyname('Piecetask').AsFloat    :=data.qryLocationOutItem.fieldbyname('Piece').AsFloat    ;
         data.qryLocationOutItem.fieldbyname('Volumetask').asfloat     :=data.qryLocationOutItem.fieldbyname('Volume').asfloat     ;
         data.qryLocationOutItem.fieldbyname('Areatask').asfloat       :=data.qryLocationOutItem.fieldbyname('Area').asfloat       ;
         data.qryLocationOutItem.fieldbyname('NetWeighttask').asfloat  :=data.qryLocationOutItem.fieldbyname('NetWeight').asfloat  ;
         data.qryLocationOutItem.fieldbyname('GrossWeighttask').asfloat:=data.qryLocationOutItem.fieldbyname('GrossWeight').asfloat;
         data.qryLocationOutItem.Edit;
         data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat:=0;
      end else
      if pstrType='EQ' then
      begin
         if (data.qryLocationOutItem.FieldByName('Quantity').AsFloat<>data.qryLocationOutItem.FieldByName('Quantitytask').AsFloat)
            and (data.qryLocationOutItem.FieldByName('Quantity').AsFloat<>0) then   //lqs
         begin
   //        kMessageDlg('商品实际数量不等于任务数量!', mtWarning, [mbOK], 0);
           if pgcLocationINOUT.activepage<>tbsSKU
           then pgcLocationINOUT.activepage:=tbsSKU;
           grdLocationOutItem.setfocus;
           data.qryLocationOutItem.EnableControls;
           exit;
        end;
      end;
      data.qryLocationOutItem.Next;
   end;
   data.qryLocationOutItem.First;
   data.qryLocationOutItem.EnableControls;
   Result:=True;
end;


procedure TfrmLocationOut.btnOperClick(Sender: TObject);
var
   Present: TDateTime;
   GetLocation:TGetLocation;
   blnNotCheck:boolean;
   strjobnoorder:string;
   strfinishstate: string;
begin
   if _strsyscus='JG' then
   begin
      blnNotCheck:=false;
      data.qryLocationOutItem.first;
      data.qrylocationoutItem.DisableControls;
      while (not data.qryLocationOutItem.Eof) and (not blnNotCheck)  do
      begin
         if data.qrylocationoutitem.FieldByName('NotFullSign').asstring='F' then
            blnNotCheck:=true;
         data.qrylocationoutItem.Next;
      end;
      data.qrylocationoutItem.EnableControls;
      data.qryLocationOutItem.first;

      if blnNotCheck then
      begin
         kMessageDlg('该出仓任务未完全备货，不能执行出货操作!', mtWarning, [mbOK], 0);
         exit;
      end;

      OpenSql(dataTmp.qryTmp,' select top 1 jobnoorder            '+chr(13)+chr(10)
                            +'   from locationoutitem  (nolock)                                                       '+chr(13)+chr(10)
                            +'  where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)
                            +'    and isnull(locationoutitem.jobnoorder,"")<>""                                       '+chr(13)+chr(10)
                            );
      strjobnoorder:=dataTmp.qryTmp.Fieldbyname('jobnoorder').AsString;
      OpenSql(dataTmp.qryTmp,' select num=count(1)             '+chr(13)+chr(10)
                            +'   from wareorderorisku  (nolock)                                                       '+chr(13)+chr(10)
                            +'  where wareorderorisku.jobno="'+strjobnoorder+'"                                       '+chr(13)+chr(10)
                            +'    and isnull(quantity,0)>isnull(quantityorder,0)                                      '+chr(13)+chr(10)
                            );
      OpenSql(dataTmp.qryTmp1,' select finishstate                                    '+chr(13)+chr(10)
                            +'   from wareorder  (nolock)                                  '+chr(13)+chr(10)
                            +'  where wareorder.jobno="'+strjobnoorder+'"                  '+chr(13)+chr(10)
                            );
      if (dataTmp.qryTmp.FieldByName('num').AsInteger<>0) and (dataTmp.qryTmp1.Fieldbyname('finishstate').AsString<>'T') then
      begin
         kMessageDlg('该出仓任务对应的出仓指令未完全拣货，不允许执行出货操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;

   skuoutcontrol;
   if (data.qryOut.FieldByName('loacccheckname').AsString='') and (_loacccheck='T') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='还未经财务出仓确认,不能执行该操作!'
      else _strmessage:='还未经财务出仓确认,不能执行该操作!';}
      kMessageDlg(GetMessage('frmLocationOut','024'), mtWarning, [mbOK], 0);
      exit;
   end;
   //lzw20120228
   if (data.qryOut.FieldByName('taskcheckname').AsString='') and (getSysdata('xytext')='T') then
   begin
      kMessageDlg('还未复核,不能出仓!', mtWarning, [mbOK], 0);
      exit;
   end;
   if (data.qryLocationOut.FieldByName('OperationName').AsString='')
      and (data.qryLocationOutItem.FieldByName('Jobno').AsString='') then
   begin
{      if _Language='CAPTIONC' then _strmessage:='任务商品资料不完整,不能执行该操作!'
      else _strmessage:='任务商品资料不完整,不能执行该操作!';}
      kMessageDlg(GetMessage('frmLocationOut','025'), mtWarning, [mbOK], 0);
      exit;
   end;
   if _strsyscus='XSWL' then
   begin
      if data.qryLocationOut.FieldByName('taskcheckname').asstring='' then
      begin
         kMessageDlg('该笔未复核,不能执行出货操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   // lzw  07.11.19

   if (data.qryLocationOut.FieldByName('OperationName').AsString<>'SYSTEM')  then
   begin
      if (data.qryLocationOut.FieldByName('OperationName').AsString<>_LoginName)
         and (data.qryLocationOut.FieldByName('OperationName').AsString<>'')
         and (_canmodifyother<>'T')then
      begin
         {if _Language='CAPTIONC' then
            _strmessage:='出货资料不是由您录入的,不能执行该操作!'
         else
            _strmessage:='出货资料不是由您录入的,不能执行该操作!';}
         kMessageDlg(GetMessage('frmLocationOut','026'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   //lzw20110615
   if _strsyscus='XSWL' then
   begin
      if data.qryLocationOut.FieldByName('taskcheckname').asstring='' then
      begin
         kMessageDlg('该笔未复核,不能执行出货操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   Present:=GetServerDate;
   GetLocation:=workGetLocation('','',True,'O');
   Present:=iif(GetLocation.ROperationDate=0,Present,GetLocation.ROperationDate);
   if not GetLocation.OkFlag then exit;

   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   data.qrylocationoutdetail.DisableControls;
   data.qrylocationoutItem.DisableControls;
   data.qryLocationOutItem.first;
   while not data.qryLocationOutItem.Eof do
   begin
      grdLocationOutItemChangeNodeEx(nil);
      if data.qrylocationoutdetail.IsEmpty then
      begin
         data.qryLocationOutItem.Edit;
         data.qryLocationOutItem.FieldByName('operationdate').AsDateTime:=Present;
         data.qryLocationOutItem.FieldByName('quantity').AsFloat   :=data.qryLocationOutItem.FieldByName('quantitytask').AsFloat;
         data.qryLocationOutItem.FieldByName('piece').AsFloat      :=data.qryLocationOutItem.FieldByName('piecetask').AsFloat;
         data.qryLocationOutItem.FieldByName('area').AsFloat       :=data.qryLocationOutItem.FieldByName('areatask').AsFloat;
         data.qryLocationOutItem.FieldByName('volume').AsFloat     :=data.qryLocationOutItem.FieldByName('volumetask').AsFloat;
         data.qryLocationOutItem.FieldByName('netweight').AsFloat  :=data.qryLocationOutItem.FieldByName('netweighttask').AsFloat;
         data.qryLocationOutItem.FieldByName('grossweight').AsFloat:=data.qryLocationOutItem.FieldByName('grossweighttask').AsFloat;
         data.qryLocationOutItem.FieldByName('casing1').AsFloat    :=data.qryLocationOutItem.FieldByName('casing1task').AsFloat;
         data.qryLocationOutItem.FieldByName('casing2').AsFloat    :=data.qryLocationOutItem.FieldByName('casing2task').AsFloat;
         data.qryLocationOutItem.FieldByName('casing3').AsFloat    :=data.qryLocationOutItem.FieldByName('casing3task').AsFloat;
         data.qryLocationOutItem.FieldByName('casing4').AsFloat    :=data.qryLocationOutItem.FieldByName('casing4task').AsFloat;
         data.qryLocationOutItem.FieldByName('casing5').AsFloat    :=data.qryLocationOutItem.FieldByName('casing5task').AsFloat;
         if (Sender=mitOper) then GetLocationSKU(Present);
      end;
      data.qrylocationoutitem.next;
   end;
   data.qrylocationoutItem.EnableControls;
   data.qrylocationoutdetail.EnableControls;
  //直接上架/直接出货
   if (data.qryLocationOut.FieldByName('OperationName').AsString='') then
   begin
      grdLocationINOUTItemReadOnly:=False;
      if data.qryLocationoutItem.fieldbyname('SKUID').asstring<>'' then
      begin
         data.qryLocationout.Edit;
         data.qryLocationout.FieldByName('OperationName').AsString:=_LoginName;
         data.qryLocationout.FieldByName('OperationDate').AsDateTime:=Present;
	 if _StrSysCus<>'SZWY' then
            data.qryLocationout.FieldByName('conloaddate').AsDateTime:=Present;
      end;
   end;
   grdLocationOutDetailReadOnly:=False;
   mitAddLocationINOUTDetail.Enabled:=True;
   mitDelLocationINOUTDetail.Enabled:=True;
   dtdOperationDate.Enabled:=true;
   timOperationDate.Enabled:=True;
end;

procedure TfrmLocationOut.grdLocationOutCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;
   if ANode.Values[taskisComplete.Index]='T' then
      AFont.Color :=clRed
   else if ((ANode.Values[Piece.Index]<>null) and (ANode.Values[Piece.Index]<>0)) and
           (ANode.Values[PieceTasked.Index]>ANode.Values[Piece.Index])
            then
      AFont.Color :=clFuchsia;
   if (trim(ANode.Values[OPERATIONNAME.Index])='') and (_strsyscus<>'XSWL')  then
   begin
      AColor := clInfoBk;
   end else
   if (trim(ANode.Values[taskcheckname.Index])='') and (trim(ANode.Values[checkname.Index])='') then
   begin
      AColor := clSilver;
   end else
   if (trim(ANode.Values[loacccheckname.Index])='') and (_loacccheck='T') then
   begin
      AColor := clGray;
   end else
   if trim(ANode.Values[checkname.Index])='' then
   begin
      AColor := clSkyBlue;
   end else
   begin
      AColor := $00C1DBC1;
   end;
   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;
   if (trim(ANode.Values[outid.index])='T') and (trim(ANode.Strings[OPERATIONDATE.index])='') then
   begin
      AColor := clFuchsia;
   end;
end;

procedure TfrmLocationOut.mitSkuDetailItemClick(Sender: TObject);
begin
   if (data.qryLocationOutItem.FieldByName('SKUID').AsString='') then
   begin
      kMessageDlg(GetMessage('frmLocationOut','027'), mtInformation, [mbOK], 0); //'请先挑选概要商品!!!'
      exit;
   end;

   if data.qryLocOutSkuDetail.Active<>True then
   begin
      data.qryLocOutSkudetail.ParamByName('jobno').AsString:=data.qryLocationOut.fieldByName('jobno').AsString;
      data.qryLocOutSkuDetail.Open;
   end;

   if DataState=stedit then
   begin
      _maxgridnoout:=0;
      data.qryLocOutSkuDetail.First;
      while not data.qryLocOutSkuDetail.Eof do
      begin
         if data.qryLocOutSkuDetail.FieldByName('detailsno').AsInteger>_maxgridnoout
         then _maxgridnoout:=data.qryLocOutSkuDetail.FieldByName('detailsno').AsInteger;
         data.qryLocOutSkuDetail.Next;
      end;
   end;

   if data.qryLocationOutItem.FieldByName('sno').AsInteger<0 then
      data.qryLocationOutItem.Post;

   data.qryLocOutSkuDetail.Filtered:=false;
   if data.qryLocationOutItem.fieldbyname('sno').AsString<>'' then
      data.qryLocOutSkuDetail.filter:='sno='+data.qryLocationOutItem.fieldbyname('sno').AsString
   else
      data.qryLocOutSkuDetail.filter:='sno=-1';
   data.qryLocOutSkuDetail.Filtered:=true;

   //wql.05.10.27   with workLIOSKUDetail(IIF(data.qrylocationoutItem.FieldByName('operationname').AsString<>'',stBrowse,datastate),
   with workLIOSKUDetail(IIF(data.qryLocationOutDetail.IsEmpty=False,stBrowse,datastate),
                  data.qryLocationOutItem.FieldByName('jobno').AsString,data.qryLocationOutItem.FieldByName('sno').AsInteger,
                  data.qryLocationOutItem.FieldByName('skuid').AsString,data.qryLocationOutItem.FieldByName('skuname').AsString,'locoutskudetail',
                 -1,'F',data.qryLocationOutItem.FieldByName('jobnoin').AsString,data.qryLocationOutItem.FieldByName('jobnoorder').AsString,
                 data.qryLocationOutItem.FieldByName('snoin').asinteger,data.qryLocationOutItem.FieldByName('snoorder').asinteger
                ) do
   begin
      if DataState in Setdcs then
      if OKflag=True then
      begin
         data.qryLocationOutItem.edit;
         data.qryLocationOutItem.FieldByName('quantitytask').AsFloat:=quantity;
         data.qryLocationOutItem.FieldByName('piecetask').AsFloat:=piece;
         data.qryLocationOutItem.FieldByName('areatask').AsFloat:=area;
         data.qryLocationOutItem.FieldByName('volumetask').AsFloat:=volume;
         data.qryLocationOutItem.FieldByName('grossweighttask').AsFloat:=grossweight;
         data.qryLocationOutItem.FieldByName('netweighttask').AsFloat:=netweight;
         if UpperCase(data.qryLocationOutItem.FieldByName('costuomtype').AsString)='SNO' then
         begin
            data.qryLocationOutItem.FieldByName('carriagetotal').AsFloat :=data.qryLocationOutItem.FieldByName('carriage').AsFloat;
            data.qryLocationOutItem.FieldByName('insurancetotal').AsFloat :=data.qryLocationOutItem.FieldByName('insurance').AsFloat;
            data.qryLocationOutItem.FieldByName('skucost').AsFloat :=data.qryLocationOutItem.FieldByName('price').AsFloat;
         end else
         begin
            data.qryLocationOutItem.FieldByName('carriagetotal').AsFloat :=
                  data.qryLocationOutItem.FieldByName(data.qryLocationOutItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                  data.qryLocationOutItem.FieldByName('carriage').AsFloat;
            data.qryLocationOutItem.FieldByName('insurancetotal').AsFloat :=
                  data.qryLocationOutItem.FieldByName(data.qryLocationOutItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                  data.qryLocationOutItem.FieldByName('insurance').AsFloat;
            data.qryLocationOutItem.FieldByName('skucost').AsFloat :=
                  data.qryLocationOutItem.FieldByName(data.qryLocationOutItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                  data.qryLocationOutItem.FieldByName('price').AsFloat;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.edtCostCusExit(Sender: TObject);
begin
   blnSelect:=False;
   if (DataState in Setdcs) and (stroldCostcus<>edtCostCus.Text) then
   begin
      GetCusCnfg;
   end;
end;

procedure TfrmLocationOut.mitINCOWorkClick(Sender: TObject);
var
   strAccount_LoadGroup,strAccount_LoadGroupName,
   strAccount_ForkGroup,strAccount_ForkGroupName,
   strAccount_LiftMachine,strAccount_LiftMachineName:String;
begin
   if KmessageDlg(GetMessage('frmLocationOut','029'),//'是否用本笔记录的装卸队，叉车，吊机替换其他记录？'
                   mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      strAccount_LoadGroup      :=data.qryLocationOutItem.fieldbyname('loadgroupcusid').AsString;
      strAccount_LoadGroupName  :=data.qryLocationOutItem.fieldbyname('loadgroupcusname').AsString;
      strAccount_ForkGroup      :=data.qryLocationOutItem.fieldbyname('forkgroupcusid').AsString;
      strAccount_ForkGroupName  :=data.qryLocationOutItem.fieldbyname('forkgroupcusname').AsString;
      strAccount_LiftMachine    :=data.qryLocationOutItem.fieldbyname('liftmachinecusid').AsString;
      strAccount_LiftMachineName:=data.qryLocationOutItem.fieldbyname('liftmachinecusname').AsString;
      data.qryLocationOutItem.First;
      while not data.qryLocationOutItem.Eof do
      begin
         data.qryLocationOutItem.Edit;
         data.qryLocationOutItem.fieldbyname('loadgroupcusid').AsString:=strAccount_LoadGroup;
         data.qryLocationOutItem.fieldbyname('loadgroupcusname').AsString:=strAccount_LoadGroupName;
         data.qryLocationOutItem.fieldbyname('forkgroupcusid').AsString:=strAccount_ForkGroup;
         data.qryLocationOutItem.fieldbyname('forkgroupcusname').AsString:=strAccount_ForkGroupName;
         data.qryLocationOutItem.fieldbyname('liftmachinecusid').AsString:=strAccount_LiftMachine;
         data.qryLocationOutItem.fieldbyname('liftmachinecusname').AsString:=strAccount_LiftMachineName;
         data.qryLocationOutItem.Next;
      end;
   end;
end;

function TfrmLocationOut.FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
begin
{   Result := '';
   case pField of
   //过滤货主
      21: if pValue <> ''
            then Result:=''
                        +'  exists ( select 1 from locationoutitem Task(nolock)    '
                        +'            where Task.jobno=INOUT.jobno               '
                        +'              and Task.shippercusid="'+pValue+'" ) '
          else if pValue = '' then Result:=' 1=1';
      25: if pValue = 'Y'
            then Result:=' (isnull(Inout.operationname,"")<>"") and '
                        +' (not exists (select 1 from locationoutitem item(nolock) '
                        +'           where item.jobno=Inout.jobno '
                        +'             and isnull(item.Quantity-item.quantitydo,0)>0 )) '
          else if pValue = 'N'
            then Result:=' (isnull(Inout.operationname,"")="") or '
                        +' (not exists (select 1 from locationoutitem item(nolock) '
                        +'           where item.jobno=Inout.jobno '
                        +'             and isnull(item.Quantity-item.quantitydo,0)>0 )) ';
   end;}
end;


procedure TfrmLocationOut.GetLocationSKU(thedate:TDateTime);
begin
//out
    if strSysCus='SWZ' then
    begin
       openSql(datatmp.qryTmp,' select * '
                             +'   from LocationinDetail Detail (NOLOCK)  '
                             +'  where isnull(Detail.Jobno,"") ="'+data.qryLocationOutItem.fieldbyname('JobnoIN').asstring+'" '+chr(13)+chr(10)
                             +'    and isnull(Detail.SNO,0) = '+data.qryLocationOutItem.fieldbyname('SNOIN').AsString +chr(13)+chr(10)
                              );
    end else
    begin
       if _OutLoc='T' then
       begin
          openSql(datatmp.qryTmp,' select * '
                                +'   from LocationinDetail Detail (NOLOCK)  '
                                +'  where isnull(Detail.Jobno,"") ="'+data.qryLocationOutItem.fieldbyname('JobnoIN').asstring+'" '+chr(13)+chr(10)
                                +'    and isnull(Detail.SNO,0) = '+data.qryLocationOutItem.fieldbyname('SNOIN').AsString +chr(13)+chr(10)
                                +'    and isnull(quantity,0)-isnull(quantitydo,0)>0 ' +chr(13)+chr(10)
                                +iif(data.qrylocationoutitem.fieldbyname('snolocin').AsString<>'' ,'   and isnull(Detail.ldSNO,0) = '+data.qryLocationOutItem.fieldbyname('SNOLocIN').AsString,''  )+chr(13)+chr(10)
                                 );
          if datatmp.qryTmp.RecordCount=0 then
             openSql(datatmp.qryTmp,' select * '
                                   +'   from LocationinDetail Detail (NOLOCK)  '
                                   +'  where isnull(Detail.Jobno,"") ="'+data.qryLocationOutItem.fieldbyname('JobnoIN').asstring+'" '+chr(13)+chr(10)
                                   +'    and isnull(Detail.SNO,0) = '+data.qryLocationOutItem.fieldbyname('SNOIN').AsString +chr(13)+chr(10)
                                   +'    and isnull(quantity,0)-isnull(quantitydo,0)>0 ' +chr(13)+chr(10)
                                    );
       end else
       begin
          openSql(datatmp.qryTmp,' select * '
                                +'   from LocationinDetail Detail (NOLOCK)  '
                                +'  where isnull(Detail.Jobno,"") ="'+data.qryLocationOutItem.fieldbyname('JobnoIN').asstring+'" '+chr(13)+chr(10)
                                +'    and isnull(Detail.SNO,0) = '+data.qryLocationOutItem.fieldbyname('SNOIN').AsString +chr(13)+chr(10)
                                 );
       end;
    end;
    if datatmp.qryTmp.RecordCount=1 then
    begin
       data.qryLocationOutDetail.Append;
       data.qryLocationOutDetail.fieldbyname('ldsno').Asinteger:=-1;
       if grdLocationoutDetail.FocusedNode=nil then
       begin
          maxLocationOutDetail:=maxLocationOutDetail+1;
          data.qryLocationOutDetail.Fieldbyname('ldSNO').asInteger:=maxLocationOutDetail;
       end;
       data.qryLocationOutDetail.Fieldbyname('jobnoorder').asString     :=data.qryLocationOutItem.Fieldbyname('jobnoorder').asString;
       data.qryLocationOutDetail.Fieldbyname('snoorder').asInteger      :=data.qryLocationOutItem.Fieldbyname('snoorder').asInteger;
       data.qryLocationOutDetail.Fieldbyname('TagTotal').asInteger      :=data.qryLocationOutItem.Fieldbyname('TagTotal').asInteger;
       data.qryLocationOutDetail.fieldbyname('OperationDate').asDateTime:=thedate;
       data.qryLocationOutDetail.FieldByName('SNO').AsInteger:=data.qryLocationOutItem.fieldbyname('SNO').AsInteger;
       data.qryLocationOutDetail.fieldbyname('OPERATIONTYPE').Asinteger:=-1;

//       data.qryLocationOutDetail.Fieldbyname('PiecePro').asFloat      :=0;
//       data.qryLocationOutDetail.Fieldbyname('VolumePro').asFloat     :=0;
//       data.qryLocationOutDetail.fieldbyname('NetWeightPro').asFloat  :=0;
//       data.qryLocationOutDetail.fieldbyname('GrossWeightPro').asFloat:=0;
//       data.qryLocationOutDetail.fieldbyname('AreaPro').asFloat       :=0;

       data.qryLocationOutDetail.Fieldbyname('Quantity').AsFloat   :=data.qryLocationOutItem.Fieldbyname('Quantitytask').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Piece').AsFloat      :=data.qryLocationOutItem.Fieldbyname('Piecetask').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Volume').asFloat     :=data.qryLocationOutItem.Fieldbyname('Volumetask').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Area').asFloat       :=data.qryLocationOutItem.Fieldbyname('Areatask').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('NetWeight').asFloat  :=data.qryLocationOutItem.Fieldbyname('NetWeighttask').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('GrossWeight').asFloat:=data.qryLocationOutItem.Fieldbyname('GrossWeighttask').AsFloat;

       data.qryLocationOutDetail.fieldbyname('ManufactureDate').asDateTime:=datatmp.qryTmp.fieldbyname('ManufactureDate').asDateTime ;
       if data.qryLocationOutDetail.fieldbyname('ManufactureDate').asDateTime=0 then   data.qryLocationOutDetail.fieldbyname('ManufactureDate').Clear;
       //lzw 20081205
       data.qryLocationOutDetail.Fieldbyname('manudatestring').asstring                :=datatmp.qryTmp.FieldByName('manudatestring').asstring;

       data.qryLocationOutDetail.Fieldbyname('UOM1').asstring                :=datatmp.qryTmp.FieldByName('UOM1').asstring;
       data.qryLocationOutDetail.Fieldbyname('UOM2').asstring                :=datatmp.qryTmp.FieldByName('UOM2').asstring;
       data.qryLocationOutDetail.Fieldbyname('UOM3').asstring                :=datatmp.qryTmp.FieldByName('UOM3').asstring;
       data.qryLocationOutDetail.Fieldbyname('UOM4').asstring                :=datatmp.qryTmp.FieldByName('UOM4').asstring;
       data.qryLocationOutDetail.Fieldbyname('UOM5').asstring                :=datatmp.qryTmp.FieldByName('UOM5').asstring;
       data.qryLocationOutDetail.Fieldbyname('Casing1').asFloat              :=data.qryLocationOutItem.Fieldbyname('Casing1task').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Casing2').asFloat              :=data.qryLocationOutItem.Fieldbyname('Casing2task').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Casing3').asFloat              :=data.qryLocationOutItem.Fieldbyname('Casing3task').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Casing4').asFloat              :=data.qryLocationOutItem.Fieldbyname('Casing4task').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('Casing5').asFloat              :=data.qryLocationOutItem.Fieldbyname('Casing5task').AsFloat;
       data.qryLocationOutDetail.Fieldbyname('NotFullSign').asstring         :=data.qryLocationOutItem.FieldByName('NotFullSign').asstring;
       data.qryLocationOutDetail.fieldbyname('SKUID').asstring               :=datatmp.qryTmp.FieldByName('SKUID').asstring;
       data.qryLocationOutDetail.fieldbyname('SKUname').asstring             :=datatmp.qryTmp.FieldByName('SKUname').asstring;
       //lzw 20090319
       if (_StrSysCus='SWZ') or (_StrSysCus='SHRL') then
       begin
          data.qryLocationOutDetail.fieldbyname('skuspec').asstring          :=data.qryLocationOutItem.FieldByName('skuspec').asstring;
          data.qryLocationOutDetail.fieldbyname('skumodel').asstring         :=data.qryLocationOutItem.FieldByName('skumodel').asstring;
          data.qryLocationOutDetail.fieldbyname('customerno').asstring       :=data.qryLocationOutItem.FieldByName('customerno').asstring;
       end;
       data.qryLocationOutDetail.fieldbyname('corpno').asstring              :=data.qryLocationOutItem.FieldByName('corpno').asstring;
       //lzw201009016
       data.qryLocationOutDetail.fieldbyname('skuspec').asstring          :=data.qryLocationOutItem.FieldByName('skuspec').asstring;
       data.qryLocationOutDetail.fieldbyname('skumodel').asstring         :=data.qryLocationOutItem.FieldByName('skumodel').asstring;

       data.qryLocationOutDetail.Fieldbyname('LotCode').asstring             :=datatmp.qryTmp.FieldByName('LotCode').asstring;
       data.qryLocationOutDetail.fieldbyname('QualityName').asstring         :=datatmp.qryTmp.FieldByName('QualityName').asstring;
       data.qryLocationOutDetail.fieldbyname('QuantityUOM').asstring         :=datatmp.qryTmp.FieldByName('QuantityUOM').asstring;
       data.qryLocationOutDetail.fieldbyname('PieceUOM').asstring            :=datatmp.qryTmp.FieldByName('PieceUOM').asstring;
       data.qryLocationOutDetail.fieldbyname('WeightUOM').asstring           :=datatmp.qryTmp.FieldByName('WeightUOM').asstring;
       data.qryLocationOutDetail.fieldbyname('VolumeUOM').asstring           :=datatmp.qryTmp.FieldByName('VolumeUOM').asstring;
       data.qryLocationOutDetail.Fieldbyname('AreaUOM').asstring             :=datatmp.qryTmp.FieldByName('AreaUOM').asstring;
       data.qryLocationOutDetail.fieldbyname('costuomtype').asString         :=datatmp.qryTmp.FieldByName('costuomtype').asString;
       data.qryLocationOutDetail.fieldbyname('price').asFloat                :=datatmp.qryTmp.FieldByName('price').AsFloat;
       data.qryLocationOutDetail.fieldbyname('Currcd').asString              :=datatmp.qryTmp.FieldByName('Currcd').asstring;
       //lzw20100824
       if  (_strSysCus='SWZ') or (strSysCus='DHA') then
       begin
          data.qryLocationOutDetail.fieldbyname('SKUCost').asFloat              :=data.qryLocationOutItem.FieldByName('SKUCost').AsFloat;
          data.qryLocationOutDetail.fieldbyname('SKUCostIn').asFloat            :=data.qryLocationOutItem.FieldByName('SKUCostIn').AsFloat;
       end else
       begin
          data.qryLocationOutDetail.fieldbyname('SKUCost').asFloat              :=datatmp.qryTmp.FieldByName('SKUCost').AsFloat;
          data.qryLocationOutDetail.fieldbyname('SKUCostIn').asFloat            :=datatmp.qryTmp.FieldByName('SKUCostIn').AsFloat;
       end;
       data.qryLocationOutDetail.fieldbyname('price').asFloat                :=datatmp.qryTmp.FieldByName('price').AsFloat;
       data.qryLocationOutDetail.fieldbyname('priceIn').asFloat              :=datatmp.qryTmp.FieldByName('priceIn').AsFloat;
       data.qryLocationOutDetail.fieldbyname('TagEach').asstring             :=datatmp.qryTmp.FieldByName('TagEach').asstring;
       data.qryLocationOutDetail.fieldbyname('TagEachUOM').asstring          :=datatmp.qryTmp.FieldByName('TagEachUOM').asstring;
       data.qryLocationOutDetail.fieldbyname('TagTotal').asFloat             :=datatmp.qryTmp.FieldByName('TagTotal').AsFloat;
       data.qryLocationOutDetail.fieldbyname('TagNO').asString               :=datatmp.qryTmp.FieldByName('TagNO').asstring;
       data.qryLocationOutDetail.fieldbyname('locid').asString               :=datatmp.qryTmp.FieldByName('locid').asstring;
       data.qryLocationOutDetail.fieldbyname('LocName').asString             :=datatmp.qryTmp.FieldByName('LocName').asstring;
       data.qryLocationOutDetail.fieldbyname('LDSNOIN').asInteger            :=datatmp.qryTmp.FieldByName('ldsno').AsInteger;
       data.qryLocationOutDetail.fieldbyname('SerialNO').asString            :=datatmp.qryTmp.FieldByName('SerialNO').asstring;
       data.qryLocationOutDetail.fieldbyname('JobnoIN').asstring             :=datatmp.qryTmp.FieldByName('Jobno').asstring;
       data.qryLocationOutDetail.fieldbyname('SNOIN').asInteger              :=datatmp.qryTmp.FieldByName('SNO').AsInteger;
       data.qryLocationOutDetail.fieldbyname('LDSNOINF').asInteger           :=datatmp.qryTmp.FieldByName('LDSNOINF').AsInteger;
       data.qryLocationOutDetail.fieldbyname('JobnoINF').asstring            :=datatmp.qryTmp.FieldByName('JobnoINF').asstring;
       data.qryLocationOutDetail.fieldbyname('SNOINF').asInteger             :=datatmp.qryTmp.FieldByName('SNOINF').AsInteger;
       data.qryLocationOutDetail.fieldbyname('LocationBillNOIN').asstring    :=datatmp.qryTmp.FieldByName('LocationBillNO').asstring;
       data.qryLocationOutDetail.fieldbyname('costcusid').asstring           :=datatmp.qryTmp.FieldByName('costcusid').asstring;
       data.qryLocationOutDetail.fieldbyname('costcusName').asstring         :=datatmp.qryTmp.FieldByName('costcusName').asstring;
       data.qryLocationOutDetail.fieldbyname('cusid').asstring               :=datatmp.qryTmp.FieldByName('cusid').asstring;
       data.qryLocationOutDetail.fieldbyname('cusname').asstring             :=datatmp.qryTmp.FieldByName('cusname').asstring;
       data.qryLocationOutDetail.Fieldbyname('Shippercusid').asstring        :=datatmp.qryTmp.FieldByName('Shippercusid').asstring;
       data.qryLocationOutDetail.Fieldbyname('Shippercusname').asstring      :=datatmp.qryTmp.FieldByName('Shippercusname').asstring;
       data.qryLocationOutDetail.fieldbyname('isbond').asstring              :=datatmp.qryTmp.FieldByName('isbond').asstring;
       data.qryLocationOutDetail.fieldbyname('WareRentCountType').asstring   :=datatmp.qryTmp.FieldByName('WareRentCountType').asstring;
       data.qryLocationOutDetail.fieldbyname('costquantity').asstring        :=data.qryLocationOutItem.FieldByName('costquantitytask').asstring;
       data.qryLocationOutDetail.fieldbyname('costquantityuom').asstring     :=datatmp.qryTmp.FieldByName('costquantityuom').asstring;

       //威扬
       data.qryLocationOutDetail.fieldbyname('quantityshort').AsInteger     :=datatmp.qryTmp.FieldByName('quantityshort').AsInteger;

        if (_StrSysCus='JG') then
        begin
           data.qryLocationOutDetail.fieldbyname('remark').AsString             :=data.qryLocationOutItem.FieldByName('remark').AsString;  //lihl 2012.03.20
        end else
        begin
           data.qryLocationOutDetail.fieldbyname('remark').AsString             :=datatmp.qryTmp.FieldByName('remark').AsString;
        end;
       //lzw 20080331
       //data.qryLocationOutDetail.fieldbyname('conditiondesc').asstring     :=datatmp.qryTmp.FieldByName('conditiondesc').asstring;
       try
          data.qryLocationOutDetail.Post;
       except
          exit;
       end;
   end;
end;

procedure TfrmLocationOut.mitTotalDetailClick(Sender: TObject);
var
   fltQuantity,fltPiece,fltVolume,fltArea,fltGrossWeight,fltNetWeight:Extended;
begin
   {if _Language='CAPTIONC' then _strmessage:='是否用本记录的具体仓位信息中的合并资料，替换本记录的资料？'
   else _strmessage:='是否用本记录的具体仓位信息中的合并资料，替换本记录的资料？';}
   if KmessageDlg(GetMessage('frmLocationOut','033'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      fltQuantity:=0;
      fltPiece:=0;
      fltVolume:=0;
      fltArea:=0;
      fltGrossWeight:=0;
      fltNetWeight:=0;
      data.qryLocationOutDetail.First;
      while not data.qryLocationOutDetail.Eof do
      begin
         fltQuantity:=fltQuantity+data.qryLocationOutDetail.fieldbyname('Quantity').AsFloat;
         fltPiece:=fltPiece+data.qryLocationOutDetail.fieldbyname('Piece').AsFloat;
         fltVolume:=fltVolume+data.qryLocationOutDetail.fieldbyname('Volume').AsFloat;
         fltArea:=fltArea+data.qryLocationOutDetail.fieldbyname('Area').AsFloat;
         fltGrossWeight:=fltGrossWeight+data.qryLocationOutDetail.fieldbyname('GrossWeight').AsFloat;
         fltNetWeight:=fltNetWeight+data.qryLocationOutDetail.fieldbyname('NetWeight').AsFloat;
         data.qryLocationOutDetail.Next;
      end;
      data.qryLocationOutItem.Edit;
      data.qryLocationOutItem.fieldbyname('Quantity').AsFloat:=fltQuantity;
      data.qryLocationOutItem.fieldbyname('Piece').AsFloat:=fltPiece;
      data.qryLocationOutItem.fieldbyname('Volume').AsFloat:=fltVolume;
      data.qryLocationOutItem.fieldbyname('Area').AsFloat:=fltArea;
      data.qryLocationOutItem.fieldbyname('GrossWeight').AsFloat:=fltGrossWeight;
      data.qryLocationOutItem.fieldbyname('NetWeight').AsFloat:=fltNetWeight;
      data.qryLocationOutDetail.First;
   end;
end;

procedure TfrmLocationOut.edtFC_PORTDCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('F','');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationout.FieldByName('portd').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.edtFC_TRANSCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('F','');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qrylocationout.FieldByName('TRANS').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
        // data.qryLocationout.FieldByName('TRANS').AsString  :=qrySelect.FieldByName('portename').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.edtFC_PORTLCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('F','');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qrylocationout.FieldByName('portl').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.dtdAccountBillNOExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (DataState in Setdcs) and (_DB_CHK_AccountBillno='T') then
   begin
      OpenSql(datatmp.qryTmp,'select num=count(1) from locationout(nolock) '
                    +' where cusbillno="'+trim(dtdAccountBillNO.Text)+'" ');
      if datatmp.qryTmp.FieldByName('num').AsInteger<>0 then
      begin
         dtdAccountBillNO.SetFocus;
         {if _Language='CAPTIONC' then _strmessage:='客户单号不能相同!'
         else _strmessage:='客户单号不能相同!';}
         KmessageDlg(GetMessage('frmLocationOut','034'),mtInformation,[mbOK],0);
         exit;
      end;
   end;
end;

procedure TfrmLocationOut.edtCustomsNOExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (DataState in Setdcs) and (_DB_CHK_CustomsNO='T') then
   begin
      OpenSql(datatmp.qryTmp,'select num=count(1) from locationout(nolock) '
                    +' where CustomsNO="'+trim(edtCustomsNO.Text)+'" ');
      if datatmp.qryTmp.FieldByName('num').AsInteger<>0 then
      begin
         edtCustomsNO.SetFocus;
         {if _Language='CAPTIONC' then _strmessage:='报关单号不能相同!'
         else _strmessage:='报关单号不能相同!';}
         KmessageDlg(GetMessage('frmLocationOut','035'),mtInformation,[mbOK],0);
         exit;
      end;
   end;
end;

procedure TfrmLocationOut.mitOperationClick(Sender: TObject);
begin
   WorkOperation(stBrowse,data.qryOut.FieldByName('Jobno').AsString,
                          data.qryOut.FieldByName('UserID').AsString);

end;

procedure TfrmLocationOut.AccountNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{
  if DataState in setDcs then
  begin
    with workaccountselect('B') do
    if OkFlag then
    begin
      data.qryLocationOutItemTask.edit;
      data.qryLocationOutItemTask.FieldByName('cusid').AsString:=accountid;
      data.qryLocationOutItemTask.FieldByName('cusname').AsString:=account_shortname;
    end;
  end;
}
end;

procedure TfrmLocationOut.QualityNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{
  if DataState in setDcs then
  begin
    with workQualitySelect(data.qryLocationOutItemTask.FieldByName('QualityName').AsString) do
    if OkFlag then
    begin
      data.qryLocationOutItemTask.edit;
      data.qryLocationOutItemTask.FieldByName('QualityName').AsString:=QualityName;
    end;
  end;
}
end;

procedure TfrmLocationOut.grdLocationOutItemDblClick(
  Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
//   piecefieldname,volfieldname,GWfieldname:string;
begin
{
   if strFlow='ITEM' then
   begin
      piecefieldname:='Piecetask';
      volfieldname  :='Volumetask';
      GWfieldname   :='GrossWeighttask';
   end else
   begin
      piecefieldname:='Piece';
      volfieldname  :='Volume';
      GWfieldname   :='GrossWeight';
   end;
}
   if UpperCase(grdLocationOutItem.Columns[grdLocationOutItem.GetFocusedAbsoluteIndex(grdLocationOutItem.FocusedColumn)].FieldName)='VOLUMETASK'
   then
   begin
      jsPiece   :=data.qryLocationOutItem.FieldByName('piecetask').AsFloat;
      jsHeight  :=data.qryLocationOutItem.FieldByName('Height').AsFloat;
      jsWidth   :=data.qryLocationOutItem.FieldByName('Width').AsFloat;
      jsDepth   :=data.qryLocationOutItem.FieldByName('Depth').AsFloat;
      jsVolume  :=data.qryLocationOutItem.FieldByName('volumetask').AsFloat;
      jsSizeUOM :=data.qryLocationOutItem.FieldByName('SizeUOM').AsString;
      jsVolueUOM:=data.qryLocationOutItem.FieldByName('VolumeUOM').AsString;
      while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
           (DataState in Setdcs) and (Not grdLocationINOUTItemReadOnly)do
      begin
        data.qryLocationOutItem.Edit;
        data.qryLocationOutItem.FieldByName('Height').AsFloat    :=jsHeight;
        data.qryLocationOutItem.FieldByName('Width').AsFloat     :=jsWidth;
        data.qryLocationOutItem.FieldByName('Depth').AsFloat     :=jsDepth;
        data.qryLocationOutItem.FieldByName('volumetask').AsFloat    :=jsVolume;
        data.qryLocationOutItem.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
        data.qryLocationOutItem.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
        exit;
      end;
   end;
end;

procedure TfrmLocationOut.grdLocationOutItemEditing(
  Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=True;
   if not (DataState in Setdcs) then Allow:=False
   else
   begin
      if (_paper<>'F') and (getSysdata('control')='T') then
      begin
         with grdLocationOutItem do
         begin
            if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITYTASK') then
            begin
               if _piececal=True then
                  Allow:=False
               else
                  Allow:=True
            end else
            if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECETASK') then
            begin
               if _piececal=True then
                  Allow:=True
               else
                  Allow:=False
            end
         end;
      end;
      //lzw20120308
      if (getSysdata('xytext')='T') and (data.qryout.FieldByName('taskcheckname').AsString<>'')and(data.qryLocationoutitem.IsEmpty<>true) then
      begin
         allow:=false;
      end;
      if (data.qryLocationOutDetail.IsEmpty=true) and (strFlow='ITEM') then
      begin
         if grdLocationINOUTItemReadOnly then allow:=false
         else
         begin
            with grdLocationOutItem do
            begin
               if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CUSNAME') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCUSNAME') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOTCODE') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CUSTOMSNOIN') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUALITYNAME') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CONDITIONDESC') or
                  //lzw 20081205
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='MANUDATESTRING') or
                  (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='MANUFACTUREDATE')

               then
//                   or (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPCUSNAME')
               begin
                  if data.qrylocationoutItem.FieldByName('skuid').AsString<>'' then allow:=False;
               end;
            end;
         end;
      end else
      begin
         with grdLocationOutItem do
         begin
            if not ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOADGROUPCUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='FORKGROUPCUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LIFTMACHINECUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='sequencenum')) then
            Allow:=False;
         end;
      end;
   end;
End;

procedure TfrmLocationOut.grdLocationOutItemKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   with TdxDBGrid(Sender) do
   begin
      if (Key = VK_Space) and
        ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUME') or
         (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='GROSSWEIGHT')) then
      begin
         grdLocationOutItemDblClick(Sender);
         key:=0;
         exit;
      end;
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
            if (Key = VK_DELETE) and (ssCtrl in Shift) then
            begin
               if uppercase(Name)='GRDLOCATIONOUTITEM' then
                 mitdelLocINItemClick(sender);
               key:=0;
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.cusNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin //in out 不同
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutitem.edit;
         data.qryLocationOutitem.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutitem.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.ShippercusNameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryLocationOutitem.edit;
         data.qryLocationOutitem.FieldByName('Shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutitem.FieldByName('ShippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.QualityNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
      data.qryLocationOutItem.edit;
      data.qryLocationOutItem.FieldByName('QualityName').AsString
                    :=pGetqualitySelect(data.qryLocationOutItem.FieldByName('QualityName').AsString);
  end;
end;

procedure TfrmLocationOut.LocItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
      qrySelect:=pGetLocationSelect('','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         data.qryLocationOutItem.edit;
         data.qryLocationOutItem.FieldByName('LocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         data.qryLocationOutItem.FieldByName('LocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.QuantityItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityOldValue:=data.qryLocationOutItem.FieldByName('Quantity').AsFloat;
      data.qryLocationOutItem.Edit;
      data.qryLocationOutItem.FieldByName('Quantity').AsFloat:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
      data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText))
                  +data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat-QuantityOldValue;
      blnBLJS:=True;
      CountSKUQuantity(data.qryLocationOutItem,QuantityOldValue);
      blnBLJS:=False;
   end;
end;

procedure TfrmLocationOut.loadgroupcusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutitem.edit;
         data.qryLocationOutItem.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutItem.FieldByName('loadgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.forkgroupcusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutitem.edit;
         data.qryLocationOutItem.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutItem.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.liftmachinecusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutitem.edit;
         data.qryLocationOutItem.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutItem.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmLocationOut.ppmLocationINOUTItemPopup(Sender: TObject);
var
   I,J: integer;
   menuItem: TMenuItem;
   numItem:Integer;
begin
 //  TPopupMenu(Sender).Items.Clear;
   if strInout='I' then
      numItem:=12
   else
      numItem:=12;
   J:=TPopupMenu(Sender).Items.Count;
   if J>numItem then
   begin
      for I:= numItem to J-1 do
      begin
         TPopupMenu(Sender).Items.Delete(numItem);
      end;
   end;

   with grdLocationOutItem do
   for I:= 0 to ColumnCount -1 do
   begin
      menuItem := TMenuItem.Create(self);
      menuItem.Caption := Columns[I].Caption;

      if pos('*',Columns[I].Caption)>0 then menuItem.Enabled:=False;

      menuItem.Checked := Columns[I].Visible;
      menuItem.OnClick := grdLocationINItemMenuItemOnClick;
      if Columns[I].GroupIndex <> -1 then
         menuItem.Enabled := False;
      TPopupMenu(Sender).Items.add(menuItem);
   end;
end;

procedure TfrmLocationOut.grdLocationINItemMenuItemOnClick(Sender: TObject);
var
   numItem:Integer;
begin
   if strInout='I' then
      numItem:=12
   else
      numItem:=12;
   grdLocationOutItem.Columns[ppmLocationINItem.Items.IndexOf(TMenuItem(Sender))-numItem].Visible :=
                                                             not  TMenuItem(Sender).Checked;
end;

procedure TfrmLocationOut.grdLocationOutDetailDblClick(
  Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
begin
   if UpperCase(grdLocationOutDetail.Columns[grdLocationOutDetail.GetFocusedAbsoluteIndex(grdLocationOutDetail.FocusedColumn)].FieldName)='VOLUME' then
   begin
      jsPiece   :=data.qryLocationOutDetail.FieldByName('Piece').AsFloat;
      jsHeight  :=data.qryLocationOutDetail.FieldByName('Height').AsFloat;
      jsWidth   :=data.qryLocationOutDetail.FieldByName('Width').AsFloat;
      jsDepth   :=data.qryLocationOutDetail.FieldByName('Depth').AsFloat;
      jsVolume  :=data.qryLocationOutDetail.FieldByName('Volume').AsFloat;
      jsSizeUOM :=data.qryLocationOutDetail.FieldByName('SizeUOM').AsString;
      jsVolueUOM:=data.qryLocationOutDetail.FieldByName('VolumeUOM').AsString;
      while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
      (DataState in Setdcs) and (not grdLocationOutDetailReadOnly) do
      begin
        data.qryLocationOutDetail.Edit;
        data.qryLocationOutDetail.FieldByName('Height').AsFloat    :=jsHeight;
        data.qryLocationOutDetail.FieldByName('Width').AsFloat     :=jsWidth;
        data.qryLocationOutDetail.FieldByName('Depth').AsFloat     :=jsDepth;
        data.qryLocationOutDetail.FieldByName('Volume').AsFloat    :=jsVolume;
        data.qryLocationOutDetail.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
        data.qryLocationOutDetail.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
        exit;
      end;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailEditing(
  Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=False;
   if (DataState in Setdcs) and not grdLocationOutDetailReadOnly then
   begin
      with grdLocationOutDetail do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITYUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOTCODE') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUALITYNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='TAGNO') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SERIALNO') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='MANUFACTUREDATE') or
             // LZW 20081205
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='MANUDATESTRING') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECEUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='NOTFULLSIGN') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='AREAUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUMEUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='WEIGHTUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM1') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM2') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM3') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM4') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM5') then
         begin
            Allow:=False
         end else
            Allow:=True;
      end;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailEnter(
  Sender: TObject);
begin
   if (DataState in setdcs) and not grdLocationOutDetailReadOnly then
   begin
      if data.qryLocationOutitem.IsEmpty<>true then
      begin
         if data.qryLocationOutDetail.IsEmpty=True then
            mitAddLocationINOUTDetailClick(Sender);
         grdLocationOutDetail.PopupMenu:=ppmLocationINOUTDetail;
      end else grdLocationOutDetail.PopupMenu:=nil;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   with TdxDBGrid(Sender) do
   begin
      if (Key = VK_Space) and
        ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUME') or
         (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='GROSSWEIGHT')) then
      begin
         grdLocationOutItemDblClick(Sender);
         key:=0;
         exit;
      end;
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
            if uppercase(Name)='GRDLOCATIONOUTDETAIL' then
              mitDelLocationINOUTDetailClick(sender);
            key:=0;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.LocNameDetailButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   i:integer;
   mulSKUSelect:TMultLocationSKUSelect;
   present:Tdatetime;
   strClassid:string;
begin
   if DataState in Setdcs then
   begin
      if data.qryLocationOutItem.fieldbyname('SKUID').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的商品！'
         else _strmessage:='请先填写商品信息中的商品！';}
         kMessageDlg(GetMessage('frmLocationOut','036'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationOutItem.fieldbyname('cusid').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的寄仓单位！'
         else _strmessage:='请先填写商品信息中的寄仓单位！';}
         kMessageDlg(GetMessage('frmLocationOut','037'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationOutItem.fieldbyname('Shippercusid').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的货主！'
         else _strmessage:='请先填写商品信息中的货主！';}
         kMessageDlg(GetMessage('frmLocationOut','038'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationOutItem.fieldbyname('QualityName').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的品质！'
         else _strmessage:='请先填写商品信息中的品质！';}
         kMessageDlg(GetMessage('frmLocationOut','039'), mtWarning, [mbOK], 0);
         exit;
      end;
  //out
      begin
         OpenSql(dataTmp.qryTmp,'select classid '
                               +'  from sku (nolock) '
                               +' where skuid="'+data.qryLocationOutItem.fieldbyname('skuid').AsString+'"');
         strClassid:=dataTmp.qryTmp.fieldbyname('classid').AsString;

         mulSKUSelect:=WorkLocationSKUSelect(data.qryLocationOutItem.fieldbyname('jobnoin').asstring,
                                             data.qryLocationOutItem.fieldbyname('SNOIN').AsInteger,
                                             data.qryLocationOutItem.fieldbyname('SKUName').asstring+'---商品出仓仓位输入',
                                             'DETAIL',sltselect,False,'','','','',data.qryLocationOutItem.fieldbyname('SKUName').asstring,
                                             strClassid);
         present:=GetServerDate;
         for i:=0 to 500 do
         begin
            if mulSKUSelect[i].locid='' then break;
            if mulSKUSelect[i].OkFlag then
            begin
               if i=0
               then data.qryLocationOutDetail.edit
               else
               begin
                  try
                    data.qryLocationOutDetail.Post;
                  except
                    break;
                  end;

                  data.qryLocationOutDetail.append;
                  data.qryLocationOutDetail.fieldByname('jobno').AsString:=data.qryLocationOutItem.fieldbyname('jobno').AsString;
                  data.qryLocationOutDetail.FieldByName('SNO').AsInteger:=data.qryLocationOutItem.fieldbyname('SNO').AsInteger;
//                  data.qryLocationOutDetail.fieldByname('userid').AsString:=data.qryLocationOutItem.fieldbyname('userid').AsString;
                  data.qryLocationOutDetail.fieldbyname('ldsno').Asinteger:=-1;
               end;
               data.qryLocationOutDetail.Fieldbyname('jobnoorder').asString :=data.qryLocationOutItem.Fieldbyname('jobnoorder').asString;
               data.qryLocationOutDetail.Fieldbyname('snoorder').asInteger :=data.qryLocationOutItem.Fieldbyname('snoorder').asInteger;
               data.qryLocationOutDetail.Fieldbyname('TagTotal').asInteger        :=data.qryLocationOutItem.Fieldbyname('TagTotal').asInteger;
               data.qryLocationOutDetail.fieldbyname('OperationDate').asDateTime:=data.qryLocationOut.fieldbyname('OperationDate').asDateTime;
               data.qryLocationOutDetail.fieldbyname('ManufactureDate').asDateTime:=mulSKUSelect[i].ManufactureDate;
               if data.qryLocationOutDetail.fieldbyname('ManufactureDate').asDateTime=0 then  data.qryLocationOutDetail.fieldbyname('ManufactureDate').Clear;
               //LZW 20081205
               data.qryLocationOutDetail.Fieldbyname('manudatestring').asstring        :=mulSKUSelect[i].manudatestring;
               data.qryLocationOutDetail.Fieldbyname('UOM1').asstring        :=mulSKUSelect[i].UOM1;
               data.qryLocationOutDetail.Fieldbyname('UOM2').asstring        :=mulSKUSelect[i].UOM2;
               data.qryLocationOutDetail.Fieldbyname('UOM3').asstring        :=mulSKUSelect[i].UOM5;
               data.qryLocationOutDetail.Fieldbyname('UOM4').asstring        :=mulSKUSelect[i].UOM4;
               data.qryLocationOutDetail.Fieldbyname('UOM5').asstring        :=mulSKUSelect[i].UOM5;
               data.qryLocationOutDetail.Fieldbyname('Casing1').asFloat            :=mulSKUSelect[i].Casing1;
               data.qryLocationOutDetail.Fieldbyname('Casing2').asFloat            :=mulSKUSelect[i].Casing2;
               data.qryLocationOutDetail.Fieldbyname('Casing3').asFloat            :=mulSKUSelect[i].Casing3;
               data.qryLocationOutDetail.Fieldbyname('Casing4').asFloat            :=mulSKUSelect[i].Casing4;
               data.qryLocationOutDetail.Fieldbyname('Casing5').asFloat            :=mulSKUSelect[i].Casing5;

               data.qryLocationOutDetail.fieldbyname('SKUID').asstring               :=mulSKUSelect[i].SKUID;
               data.qryLocationOutDetail.fieldbyname('SKUName').asstring               :=mulSKUSelect[i].SKUname;
               //lzw20090319
               if _StrSysCus='SWZ' then
               begin
                  data.qryLocationOutDetail.fieldbyname('skuspec').asstring          :=mulSKUSelect[i].skuspec;
                  data.qryLocationOutDetail.fieldbyname('skumodel').asstring         :=mulSKUSelect[i].skumodel;
                  data.qryLocationOutDetail.fieldbyname('customerno').asstring       :=mulSKUSelect[i].customerno;
               end;
               data.qryLocationOutDetail.Fieldbyname('LotCode').asstring             :=mulSKUSelect[i].LotCode;
               data.qryLocationOutDetail.fieldbyname('Quantity').AsFloat             :=mulSKUSelect[i].syquantity;
               data.qryLocationOutDetail.fieldbyname('QualityName').asstring         :=mulSKUSelect[i].QualityName;
               data.qryLocationOutDetail.fieldbyname('QuantityUOM').asstring         :=mulSKUSelect[i].QuantityUOM;
               data.qryLocationOutDetail.fieldbyname('PieceUOM').asstring            :=mulSKUSelect[i].PieceUOM;
               data.qryLocationOutDetail.fieldbyname('WeightUOM').asstring           :=mulSKUSelect[i].WeightUOM;
               data.qryLocationOutDetail.fieldbyname('VolumeUOM').asstring           :=mulSKUSelect[i].VolumeUOM;
               data.qryLocationOutDetail.Fieldbyname('AreaUOM').asstring             :=mulSKUSelect[i].AreaUOM;
               data.qryLocationOutDetail.fieldbyname('Piece').AsFloat                :=mulSKUSelect[i].syPiece;
               data.qryLocationOutDetail.fieldbyname('NetWeight').asFloat            :=mulSKUSelect[i].syNetWeight;
               data.qryLocationOutDetail.Fieldbyname('GrossWeight').asFloat          :=mulSKUSelect[i].syGrossWeight;
               data.qryLocationOutDetail.fieldbyname('Volume').asFloat               :=mulSKUSelect[i].syVolume;
               data.qryLocationOutDetail.Fieldbyname('Area').asFloat                 :=mulSKUSelect[i].syArea;
               data.qryLocationOutDetail.Fieldbyname('costquantity').asFloat         :=mulSKUSelect[i].syCostquantity;
               data.qryLocationOutDetail.Fieldbyname('costquantityuom').asstring     :=mulSKUSelect[i].costquantityuom;
//               data.qryLocationOutDetail.fieldbyname('cusid').asstring               :=mulSKUSelect[i].cusid;
//               data.qryLocationOutDetail.Fieldbyname('Shippercusid').asstring        :=mulSKUSelect[i].Shippercusid;
//               data.qryLocationOutDetail.fieldbyname('LotTracked').asstring          :=mulSKUSelect[i].LotTracked;
               data.qryLocationOutDetail.fieldbyname('price').asFloat                :=mulSKUSelect[i].price;
               data.qryLocationOutDetail.fieldbyname('costuomtype').asString         :=mulSKUSelect[i].costuomtype;
               data.qryLocationOutDetail.fieldbyname('Currcd').asString              :=mulSKUSelect[i].Currcd;
               data.qryLocationOutDetail.fieldbyname('SKUCost').asFloat              :=mulSKUSelect[i].SKUCost;
               data.qryLocationOutDetail.fieldbyname('pricein').asFloat              :=mulSKUSelect[i].pricein;
               data.qryLocationOutDetail.fieldbyname('SKUCostin').asFloat            :=mulSKUSelect[i].SKUCostin;
               data.qryLocationOutDetail.fieldbyname('TagEach').asstring             :=mulSKUSelect[i].TagEach;
               data.qryLocationOutDetail.fieldbyname('TagEachUOM').asstring          :=mulSKUSelect[i].TagEachUOM;
               data.qryLocationOutDetail.fieldbyname('TagTotal').asFloat             :=mulSKUSelect[i].TagTotal;
               data.qryLocationOutDetail.fieldbyname('TagNO').asString               :=mulSKUSelect[i].TagNO;
               data.qryLocationOutDetail.fieldbyname('locid').asString               :=mulSKUSelect[i].locid;
               data.qryLocationOutDetail.fieldbyname('locname').asString             :=mulSKUSelect[i].locname;
               data.qryLocationOutDetail.fieldbyname('LDSNOIN').asInteger            :=mulSKUSelect[i].LDSNO;
               data.qryLocationOutDetail.fieldbyname('SerialNO').asString            :=mulSKUSelect[i].SerialNO;
               data.qryLocationOutDetail.fieldbyname('JobnoIN').asstring             :=mulSKUSelect[i].Jobno;
               data.qryLocationOutDetail.fieldbyname('SNOIN').asInteger              :=mulSKUSelect[i].SNO;
               data.qryLocationOutDetail.fieldbyname('LDSNOINF').asInteger           :=mulSKUSelect[i].LDSNOINF;
               data.qryLocationOutDetail.fieldbyname('JobnoINF').asstring            :=mulSKUSelect[i].JobnoINF;
               data.qryLocationOutDetail.fieldbyname('SNOINF').asInteger             :=mulSKUSelect[i].SNOINF;
               data.qryLocationOutDetail.fieldbyname('NotFullSign').asstring         :=mulSKUSelect[i].NotFullSign  ;
               data.qryLocationOutDetail.fieldbyname('remark').asstring              :=mulSKUSelect[i].remark  ;

               if strSysCus<>'WYFQ' then
                  data.qryLocationOutDetail.fieldbyname('operationdate').AsDateTime  :=present  
               else
                  data.qryLocationOutDetail.fieldbyname('operationdate').AsDateTime  :=data.qryLocationOut.fieldbyname('operationdate').AsDateTime  ;
               data.qryLocationOutDetail.fieldbyname('Depth').asFloat             :=mulSKUSelect[i].Depth;
               data.qryLocationOutDetail.fieldbyname('Width').asFloat             :=mulSKUSelect[i].Width;
               data.qryLocationOutDetail.fieldbyname('Height').asFloat            :=mulSKUSelect[i].Height;
               if sltselect.IndexOf(mulSKUSelect[i].JOBNO+
                                     IntToStr(mulSKUSelect[i].sno)+
                                     IntToStr(mulSKUSelect[i].ldsno))=-1 then

               sltselect.Add(mulSKUSelect[i].JOBNO+
                             FloatToStr(mulSKUSelect[i].sno)+
                             iif(inttostr(mulSKUSelect[i].LDSNO)='0','',inttostr(mulSKUSelect[i].LDSNO)));
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.QualityNameDetailButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
      data.qryLocationOutDetail.edit;
      data.qryLocationOutDetail.FieldByName('QualityName').AsString
                    :=pGetqualitySelect(data.qryLocationOutDetail.FieldByName('QualityName').AsString);
  end;
end;

procedure TfrmLocationOut.QuantityDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityDetailOldValue:=data.qryLocationOutDetail.FieldByName('Quantity').AsFloat;
      data.qryLocationOutDetail.Edit;
      data.qryLocationOutDetail.FieldByName('Quantity').AsFloat:=StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText));
      blnBLJS:=True;
      CountSKUQuantity(data.qryLocationOutDetail,QuantityDetailOldValue);
      blnBLJS:=False;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailBeforeInsert;
begin
   data.qryLocationOutDetail.fieldbyname('ldsno').Asinteger:=-1;
   data.qryLocationOutDetail.fieldByname('jobno').AsString:=data.qryLocationOut.fieldbyname('jobno').AsString;
   data.qryLocationOutDetail.FieldByName('SNO').AsInteger:=data.qryLocationOutItem.fieldbyname('SNO').AsInteger;
   if (getSysdata('qdtext')='T') or (strSysCus='WYFQ') then
      data.qryLocationOutDetail.fieldbyname('OperationDate').asDateTime:=data.qrylocationout.fieldbyname('OperationDate').asDateTime
   else
      data.qryLocationOutDetail.fieldbyname('OperationDate').asDateTime:=GetServerDate;
end;

procedure TfrmLocationOut.mitRelocationClick(Sender: TObject);
var
   blnChecked:Boolean;
begin
{
//in
  blnChecked:=False;
  if WorkUpDateDetail(data.qryLocationOutDetail.FieldByName('Jobno').AsString,
               _databaseid,
               'LocationINOUTDetail',
               data.qryLocationOutDetail.FieldByName('sno').AsInteger,
               data.qryLocationOutDetail.FieldByName('ldsno').AsInteger,
               True,blnChecked) then     btnRefreshClick(self);
//ine
}
end;

procedure TfrmLocationOut.edtPieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(iif(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityOldValue:=data.qryLocationOutItem.FieldByName('Piece').AsFloat;
      data.qryLocationOutItem.Edit;
      data.qryLocationOutItem.FieldByName('Piece').AsFloat:=StrToFloat(iif(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
      blnBLJS:=True;
      CountSKUPiece(data.qryLocationOutItem,QuantityOldValue);
      blnBLJS:=False;
      data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat:=data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat
                  +data.qryLocationOutItem.FieldByName('QuantitySL').AsFloat-QuantityOldValue;
   end;

end;

procedure TfrmLocationOut.PieceDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityDetailOldValue:=data.qryLocationOutDetail.FieldByName('Piece').AsFloat;
      data.qryLocationOutDetail.Edit;
      data.qryLocationOutDetail.FieldByName('Piece').AsFloat:=StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText));
      blnBLJS:=True;
      CountSKUPiece(data.qryLocationoutDetail,QuantityDetailOldValue);
      blnBLJS:=False;
   end;
end;

procedure TfrmLocationOut.mitlocoutskudetailClick(Sender: TObject);
begin
   if data.qrylocationoutdetail.FieldByName('locid').AsString='' then
   begin
      KMessageDlg('仓位不可为空!',mtWarning,[mbOK],0);
      exit;
   end;
   if data.qryLocOutSkudetail.Active<>True then
   begin
      data.qryLocOutSkudetail.ParamByName('jobno').AsString:=data.qryLocationOut.fieldByName('jobno').AsString;
      data.qryLocOutSkudetail.Open;
      //qrylocoutskudetail
   end;
   if DataState=stedit then
   begin
      _maxgridnoout:=0;
      data.qryLocOutSkudetail.First;
      while not data.qryLocOutSkudetail.Eof do
      begin
        if data.qryLocOutSkudetail.FieldByName('detailsno').AsInteger>_maxgridnoout
        then _maxgridnoout:=data.qryLocOutSkudetail.FieldByName('detailsno').AsInteger;
        data.qryLocOutSkudetail.Next;
      end;
   end;
   grdLocationOutDetailChangeNodeEx(nil);
   WorkLocOutSKUDetail(IIF(grdLocationOutDetailReadOnly,stBrowse,DataState) ,data.qryOut.FieldByName('jobno').AsString,
                      data.qryLocationOutItem.fieldbyname('customerno').AsString,
                      data.qryLocationOutDetail.FieldByName('SNO').AsInteger,
                      data.qryLocationOutDetail.FieldByName('ldsno').AsInteger,
                      _maxgridnoout,
                      data.qryLocOutSkuDetail,data.qryLocationOutDetail);
end;

procedure TfrmLocationOut.mitCostItemDXClick(Sender: TObject);
begin
//  WorkCostItemDx(data.qryOut.FieldByName('Jobno').AsString,True);
end;

procedure TfrmLocationOut.mitCheckOneClick(Sender: TObject);
begin
   {if _Language='CAPTIONC' then _strmessage:='该操作将审核选中的所有资料，您确定操作吗?'
   else _strmessage:='该操作将审核选中的所有资料，您确定操作吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','040'),mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   if (data.qryOut.FieldByName('checkname').AsString='') and
      (data.qryout.FieldByName('taskiscomplete').AsString<>'T') then
   begin
      KMessageDlg('该'+GetMessage('frmLocationOut','043'),mtInformation,[mbOK],0);
      Exit;
   end else
      execSql(datatmp.qryTmp,'update LocationOut '
                   +'   set checkname="'+_loginname+'",'
                   +'       CHECKDATE="'+datetostr(GetServerDate)+'"'
                   +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(GetMessage('frmLocationOut','041'),mtInformation,[mbOk],0);
   //'41审核完成'
end;

procedure TfrmLocationOut.mitCancelOneClick(Sender: TObject);
begin
   {if _Language='CAPTIONC' then _strmessage:='该操作将选中的所有资料取消审核，确定操作吗?'
   else _strmessage:='该操作将选中的所有资料取消审核，确定操作吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','044'),mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   if (data.qryOut.FieldByName('costcheckname').AsString<>'')
      or (data.qryOut.FieldByName('countname').AsString<>'')
      or ((_DB_CheckSelf='T') and (_LoginId<>'SYSTEM') and
         (_loginName<>data.qryOut.FieldByName('checkname').AsString)) then
   begin
      KmessageDlg('该'+GetMessage('frmLocationOut','046'),mtInformation,[mbOK],0);
      Exit
   end else
      execSql(datatmp.qryTmp,'update Locationout '+chr(13)+chr(10)
                  +'   set checkname="",'+chr(13)+chr(10)
                  +'       checkdate=null'+chr(13)+chr(10)
                  +'  from locationout '+chr(13)+chr(10)
                  +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
   btnRefreshClick(btnRefresh);
   Kmessagedlg(GetMessage('frmLocationOut','045'), mtInformation,[mbOk],0);
   //45任务取消审核完成！'
end;

procedure TfrmLocationOut.mitaccountClick(Sender: TObject);
var
//   GetAccount:TGetAccount;
   StrAccountId:String;
   StrAccountName:String;
   StrDataName:String;
begin
   if data.qryLocationOutItem.RecordCount<>0 then
   begin
//      GetAccount:=workGetAccount('');
//      StrAccountId:=GetAccount.AccountID;
//      StrAccountName:=GetAccount.AccountName;
//      StrDataName:=GetAccount.DataName;
      if StrAccountId<>'' then
      begin
         data.qryLocationOutItem.DisableControls;
         data.qryLocationOutItem.First;
         while not data.qryLocationOutItem.Eof do
         begin
            data.qryLocationOutItem.Edit;
            data.qryLocationOutItem.FieldByName(trim(StrDataName)).AsString:=StrAccountId;
            data.qryLocationOutItem.FieldByName(trim(StrDataName)+'Name').AsString:=StrAccountName;
            data.qryLocationOutItem.Next;
         end;
         iOutCostType:=2;
         data.qryLocationOutItem.EnableControls;
      end;
   end;
end;

procedure TfrmLocationOut.btnCostClick(Sender: TObject);
begin
  //lzw 20080528
  //WorkCostItemDx(data.qryOut.FieldByName('Jobno').AsString);
  pWorkFormDll('FINANCE',PChar('COSTITEM'+data.qryOut.FieldByName('Jobno').AsString));
end;

procedure TfrmLocationOut.mitAddLocItemClick(Sender: TObject);
begin
   if data.qryLocationOut.FieldByName('operationname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该单已经产生出货,无法在本单增加任务!'
      else
         _strmessage:='该单已经产生出货,无法在本单增加任务!';}
      KMessageDlg(GetMessage('frmLocationOut','047'),mtWarning,[mbyes],0);
      exit;
   end;
   grdLocationOutItem.setfocus;
   data.qryLocationOutItem.append;
   grdLocationOutItemBeforeInsert;
end;

procedure TfrmLocationOut.grdLocationOutItemBeforeInsert;
begin
   data.qryLocationOutItem.fieldbyname('SNO').Asinteger:=-1;
   data.qryLocationOutItem.fieldByname('jobno').AsString:=data.qryLocationOut.fieldbyname('jobno').AsString;
   data.qryLocationOutItem.fieldByname('RentCountUOMType').AsString   :=
                                                    iif(strRentCountUOMType<>'',strRentCountUOMType,'piece');
   data.qryLocationOutItem.fieldByname('RentCountUOMTypeout').AsString:=
                                                    iif(strRentCountUOMTypeout<>'',strRentCountUOMTypeout,'piece');
   data.qryLocationOutItem.fieldByname('CostCountUOMType').AsString   :=
                                                    iif(strCostCountUOMType<>'',strCostCountUOMType,'piece');
   data.qrylocationoutItem.fieldByname('CostUOMType').AsString       :='piece';
   strcostuom:='piece';
   data.qryLocationOutItem.fieldbyname('QualityName').Asstring:=iif(CopyQuality<>'',CopyQuality,'正品');

   data.qryLocationOutItem.fieldByname('cusid').AsString        :=
                    IIF(copycusID='',data.qryLocationOut.fieldByname('costcusid').AsString,copycusID);
   data.qryLocationOutItem.fieldByname('cusname').AsString      :=
                    IIF(copycusName='',data.qryLocationOut.fieldByname('costcusname').AsString,copycusName);
   data.qryLocationOutItem.fieldByname('shippercusid').AsString  :=
                    IIF(CopyShippercusID='',data.qryLocationOut.fieldByname('costcusid').AsString,CopyShippercusID);
   data.qryLocationOutItem.fieldByname('shippercusname').AsString:=
                    IIF(CopyShipperCusName='',data.qryLocationOut.fieldByname('costcusname').AsString,CopyShipperCusName);
   data.qryLocationOutItem.fieldByname('costcusid').AsString  :=data.qryLocationOut.fieldByname('costcusid').AsString;
   data.qryLocationOutItem.fieldByname('costcusname').AsString  :=data.qryLocationOut.fieldByname('costcusname').AsString;
   data.qryLocationOutItem.fieldbyname('loadgroupcusid').asstring:=copyloadgroupcusid;
   data.qryLocationOutItem.fieldbyname('loadgroupcusname').asstring:=copyloadgroupcusname;
   data.qryLocationOutItem.fieldbyname('forkgroupcusid').asstring:=copyforkgroupcusid;
   data.qryLocationOutItem.fieldbyname('forkgroupcusname').asstring:=copyforkgroupcusname;
   data.qryLocationOutItem.fieldbyname('liftmachinecusid').asstring:=copyliftmachinecusid;
   data.qryLocationOutItem.fieldbyname('liftmachinecusname').asstring:=copyliftmachinecusname;
   data.qrylocationout.FieldByName('stockup').AsString:='T'; //lihl  2012.03.19
end;

procedure TfrmLocationOut.QuantitytaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
     if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     //二次校验  开始
     if (blnScheck) and (_IsManager<>'T') then
     begin
        if blnFirst then
        begin
           extFirstNum:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
           grdLocationOutItem.InplaceEditor.SetEditingText('0');
           blnFirst:=False;
           ErrorText:='为确保信息的正确性，请你再次输入！';
           Accept:=False;
           Exit;
        end else
        begin
           blnFirst:=True;
           if extFirstNum<>StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText)) then
           begin
              grdLocationOutItem.InplaceEditor.SetEditingText('0');
              ErrorText:='两次输入数值不符，请重新输入！';
              Accept:=False;
              exit;
           end;
        end;
     end;
     //二次校验 过程结束
     if _paper='T' then
     begin
        QuantityTaskOldValue:=KRound(data.qryLocationOutItem.FieldByName('QuantityTask').AsFloat,3);
        strcostuom:=IIF(data.qryLocationOutItem.FieldByName('CostUOMType').AsString='',
                        'piece',
                        data.qryLocationOutItem.FieldByName('CostUOMType').AsString);
        data.qryLocationOutItem.Edit;
        data.qryLocationOutItem.FieldByName('QuantityTask').AsFloat:=KRound(StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText),3);
        CountSKUQuantity(data.qryLocationOutItem,QuantityTaskOldValue,'ITEM');
     end else
     begin
     QuantityTaskOldValue:=data.qryLocationOutItem.FieldByName('QuantityTask').AsFloat;
     strcostuom:=IIF(data.qryLocationOutItem.FieldByName('CostUOMType').AsString='',
                     'piece',
                     data.qryLocationOutItem.FieldByName('CostUOMType').AsString);
     data.qryLocationOutItem.Edit;
     data.qryLocationOutItem.FieldByName('QuantityTask').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);
     CountSKUQuantity(data.qryLocationOutItem,QuantityTaskOldValue,'ITEM');
     end;
     //威扬
     if data.qryLocationOutItem.FieldByName('quantityshort').AsInteger<>0 then
        data.qryLocationOutItem.FieldByName('casing5task').AsFloat:=Trunc(data.qryLocationOutItem.FieldByName('quantitytask').AsFloat/data.qryLocationOutItem.FieldByName('quantityshort').AsFloat);


     if UpperCase(data.qryLocationOutItem.FieldByName('CostUOMType').AsString)='SNO' then
     begin
        data.qryLocationOutItem.FieldByName('SkuCost').AsFloat:=data.qryLocationOutItem.FieldByName('Price').AsFloat;
        data.qryLocationOutItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationOutItem.FieldByName('pricein').AsFloat;
        data.qryLocationOutItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutItem.FieldByName('carriage').AsFloat;
        data.qryLocationOutItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutItem.FieldByName('insurance').AsFloat;
     end else
     begin
        data.qryLocationOutItem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutItem.FieldByName(strcostuom+'task').AsFloat*
                                                                        data.qryLocationOutItem.FieldByName('Price').AsFloat;
        data.qryLocationOutItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationOutItem.FieldByName(strcostuom+'task').AsFloat*
                                                                        data.qryLocationOutItem.FieldByName('pricein').AsFloat;
        data.qryLocationOutItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutItem.FieldByName(strcostuom+'task').AsFloat*
                                                                        data.qryLocationOutItem.FieldByName('carriage').AsFloat;
        data.qryLocationOutItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutItem.FieldByName(strcostuom+'task').AsFloat*
                                                                        data.qryLocationOutItem.FieldByName('insurance').AsFloat;
     end;
     Accept:=True;
   end;
end;


procedure TfrmLocationOut.grdLocationOutItemExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
         if DataLink.DataSet.State in [dsinsert,dsedit] then
         begin
            Datalink.DataSet.Post;
         end;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmLocationOut.piecetaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      //二次校验  开始
      if (blnScheck) and (_IsManager<>'T') then
      begin
         if blnFirst then
         begin
            extFirstNum:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
            grdLocationOutItem.InplaceEditor.SetEditingText('0');
            blnFirst:=False;
            ErrorText:='为确保信息的正确性，请你再次输入！';
            Accept:=False;
            Exit;
         end else
         begin
            blnFirst:=True;
            if extFirstNum<>StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText)) then
            begin
               grdLocationOutItem.InplaceEditor.SetEditingText('0');
               ErrorText:='两次输入数值不符，请重新输入！';
               Accept:=False;
               exit;
            end;
         end;
      end;
      //二次校验 过程结束
      QuantityTaskOldValue:=data.qryLocationOutItem.FieldByName('Piecetask').AsFloat;
      data.qryLocationOutItem.Edit;
      data.qryLocationOutItem.FieldByName('Piecetask').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);
      blnBLJS:=True;
      CountSKUPiece(data.qryLocationoutItem,QuantityTaskOldValue,'task');
      blnBLJS:=False;
      if UpperCase(data.qrylocationoutItem.FieldByName('costuomtype').AsString+'task')=UpperCase(piecetaskItem.FieldName) then
      begin
         data.qryLocationOutItem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutItem.FieldByName('Piecetask').AsFloat*
                                                                         data.qryLocationOutItem.FieldByName('price').AsFloat;
         data.qryLocationOutItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationOutItem.FieldByName('Piecetask').AsFloat*
                                                                         data.qryLocationOutItem.FieldByName('Pricein').AsFloat;
         data.qryLocationOutItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutItem.FieldByName('Piecetask').AsFloat*
                                                                         data.qryLocationOutItem.FieldByName('carriage').AsFloat;
         data.qryLocationOutItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutItem.FieldByName('Piecetask').AsFloat*
                                                                         data.qryLocationOutItem.FieldByName('insurance').AsFloat;
      end;
      //lzw 20090820

      if _StrSysCus='SWZ' then
      begin
         opensql(qryTmp,'select pieceremain=isnull(wareoutitem.piece,0)-isnull((select sum(isnull(locationoutitem.piecetask,0)) '+chr(13)+chr(10)
                       +'                                        from locationoutitem(nolock)  '+chr(13)+chr(10)
                       +'                                       where wareoutitem.costcusid=locationoutitem.costcusid  '+chr(13)+chr(10)
                       +'                                         and wareoutitem.mainorder=locationoutitem.mainorder '+chr(13)+chr(10)
                       +'                                         and wareoutitem.skuid=locationoutitem.skuid  '+chr(13)+chr(10)
                       +'                                       group by locationoutitem.costcusid,locationoutitem.mainorder,locationoutitem.skuid ),0) '+chr(13)+chr(10)
                       +'  from wareoutitem(nolock)      '+chr(13)+chr(10)
                       +' where wareoutitem.costcusid="'+data.qryLocationOutItem.FieldByName('costcusid').AsString+'" '+chr(13)+chr(10)
                       +'   and wareoutitem.mainorder="'+data.qrylocationout.FieldByName('mainorder').AsString+'" '+chr(13)+chr(10)
                       +'   and wareoutitem.skuid="'+data.qryLocationOutItem.FieldByName('skuid').AsString+'" '+chr(13)+chr(10)

                );
         if qryTmp.RecordCount>0 then
         begin
            if qryTmp.FieldByName('pieceremain').AsFloat<StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText) then
            begin
               ErrorText:='实际出货件数不能大于计划件数！';
               Accept:=False;
               Exit;
            end;
         end;
      end;  
      Accept:=True;
   end;
end;

procedure TfrmLocationOut.grdLocationOutItemEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryLocationOutItem.IsEmpty=True)
      and (not grdLocationINOUTItemReadOnly) then
   begin
      mitAddLocItemClick(Sender);
   end;
end;

procedure TfrmLocationOut.mitdelLocINItemClick(Sender: TObject);
begin
   if not data.qryLocationoutDetail.IsEmpty then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该笔已经产生出货,请先删除出货!'
      else _strmessage:='该笔已经产生出货,请先删除出货!';}
      Kmessagedlg(GetMessage('frmLocationOut','048'),mtWarning,[mbyes], 0);
      exit;
   end;
   if data.qryLocationOutItem.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      if strDel_Task='' then strDel_Task:=' (SNO='+data.qryLocationOutItem.fieldbyname('SNO').Asstring+')'
      else strDel_Task:=strDel_Task+' or (SNO='+data.qryLocationOutItem.fieldbyname('SNO').Asstring+')';
      grdLocationOutItem.setfocus;
{      data.qryLocationOutDetail.First;
      while not data.qryLocationOutDetail.Eof do
      begin
         data.qryLocationOutDetail.Delete;
      end;
}
      if sltselect.IndexOf(data.qrylocationoutItem.fieldbyname('jobnoin').AsString+
                            data.qrylocationoutItem.fieldbyname('snoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(data.qrylocationoutItem.fieldbyname('jobnoin').AsString+
                          data.qrylocationoutItem.fieldbyname('snoin').AsString));
      data.qryLocationOutItem.delete;
   end;
end;

procedure TfrmLocationOut.grdLocationOutItemChangeNodeEx(Sender: TObject);
begin
   data.qryLocationOutDetail.Filtered:=false;
   if data.qryLocationOutItem.fieldbyname('SNO').AsString<>'' then
      data.qryLocationOutDetail.filter:='SNO='+data.qryLocationOutItem.fieldbyname('SNO').AsString
   else
      data.qryLocationOutDetail.filter:='SNO=-1';
   data.qryLocationOutDetail.Filtered:=true;
   {if DataState in setdcs then
   begin
      //...处理状态
      if ActiveControl <> grdLocationOutItem then Exit;
      //...
      if TdxDBGrid(Sender).DataSource.DataSet.State = dsBrowse then
      begin
         TdxDBGrid(Sender).DataSource.DataSet.Edit;
         TdxDBGrid(Sender).ShowEditor;
      end;
   end;}
end;

procedure TfrmLocationOut.cmbConsignAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then //如果配置可以直接输入则不用校验  and(_ConCusInput='F')
   begin
      if _StrSysCus<>'SHRL' then
      begin
         qrySelect:=pGetCustomerSelect('G','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOut.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
      end else
      begin
         qrySelect:=pGetCusChildSelect(data.qrylocationout.FieldByname('costcusid').AsString,'');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qrylocationout.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrylocationout.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            data.qrylocationout.FieldByName('Routing').AsString  :=qrySelect.FieldByName('address').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
      end;   
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.cmbConsignAccountIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationOut.cmbConsignAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (_ConCusInput='F') then //如果配置可以直接输入则不用校验
   begin
      if cmbConsignAccountID.Text='' then
      begin
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('shipcusid').AsString:='';
         data.qryLocationOut.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('G',cmbConsignAccountID.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('cusid').asstring;
            data.qryLocationOut.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOut.cmbCarrierAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if getSysdata('hxtext')='T' then
      begin
         qrySelect:=pGetDriverSelect('','');
         if qrySelect.FieldByName('Driverid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Driverid').asstring;
            data.qryLocationOut.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Drivername').asstring;
            //data.qryLocationOut.FieldByName('carbrand').AsString  :=qrySelect.FieldByName('DriveCardNO').asstring;
            data.qryLocationOut.FieldByName('remark').AsString  :=qrySelect.FieldByName('Drivername').asstring+qrySelect.FieldByName('DriveCardNO').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end else
      begin
         qrySelect:=pGetCustomerSelect('D','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOut.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOut.cmbCarrierAccountIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationOut.cmbCarrierAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (_ConCusInput='F') then
   begin
      if cmbCarrierAccountID.Text='' then
      begin
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('carriercusid').AsString:='';
         data.qryLocationOut.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         if getSysdata('hxtext')='T' then
         begin
            qrySelect:=pGetDriverSelect('',cmbConsignAccountID.Text);
            if qrySelect.FieldByName('Driverid').AsString<>'NO' then
            begin
               data.qryLocationOut.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Driverid').asstring;
               data.qryLocationOut.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Drivername').asstring;
            end else failed:=true;
            FreeAndNil(qrySelect);
         end else
         begin
            qrySelect:=pGetCustomerSelect('D',cmbCarrierAccountID.Text);
            if qrySelect.FieldByName('cusid').AsString<>'NO' then
            begin
               data.qryLocationOut.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
               data.qryLocationOut.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            end else failed:=true;
            FreeAndNil(qrySelect);
         end;
      end;
   end;
end;

procedure TfrmLocationOut.edtOPIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationOut.edtOPIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOPID.Text='' then
      begin
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('opid').AsString:='';
         data.qryLocationOut.FieldByName('opname').AsString:='';
      end else
      if not blnSelect then
      begin
         if _paper='T' then
         begin
            qrySelect:=pGetOperatorSelect(edtOPID.Text);
         end else
         begin
            qrySelect:=pGetOperatorSelect(edtOPID.TextField);
         end;    

         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
            data.qryLocationOut.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOut.edtIUserExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationOut.edtIUserExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtIUser.Text='' then
      begin
         data.qryLocationOut.Edit;
         data.qryLocationOut.FieldByName('iuserid').AsString:='';
         data.qryLocationOut.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtIUser.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qryLocationOut.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qryLocationOut.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOut.SKUNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pt:TPoint;
   rect:TRect;
begin
   if DataState in Setdcs then
//lzw20090820
   if _StrSysCus='SWZ' then
   begin
      if edtMainOrder.Text='' then
      begin

         Kmessagedlg('主订单号不能为空', mtInformation,[mbOk],0);
         edtMainOrder.SetFocus;
      end;
   end;
   begin
     if (data.qryLocationOutItem.FieldByName('jobnoorder').AsString='') then
     begin
        rect:=grdLocationOutItem.CellRect(grdLocationOutItem.FocusedNode,SKUNameItem.Index);
        pt:=ClientToScreen(Point(rect.Left+grdLocationOutItem.left+tbsSKU.left+tbsEdit.left,
            rect.Bottom +grdLocationOutItem.Top +tbsSKU.Top +tbsEdit.Top +pgcLocationINOUT.Top
           +pgcMain.Top));
        ppmSKUTask.Popup(pt.x,pt.y);
     end else
        mitOrderSKUSelect.Click;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
         if DataLink.DataSet.State in [dsinsert,dsedit] then
         begin
            Datalink.DataSet.Post;
         end;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmLocationOut.pgcLocationINOUTChange(Sender: TObject);
begin
//   data.qryOut.DataSource:=data.dtsOut;
   if (not blnSkuOpen) and (pgcLocationINOUT.ActivePage=tbsSKU) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnSkuOpen:=True;
   end else
   if (not blnCasingOpen) and (pgcLocationINOUT.ActivePage=tbsCasing) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnCasingOpen:=True;
   end else
   if (not blnAutoCost) and (pgcLocationINOUT.ActivePage=tbsautoCost) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnAutoCost:=True;
   end;
end;

procedure TfrmLocationOut.grdLocationOutChangeNodeEx(Sender: TObject);
begin
   ScrollAfterEdit:=True;
   blnSkuOpen:=False;
   blnAutoCost:=False;
   blnCasingOpen:=False;
//控制商品细目
   data.qryLocOutSkuDetail.Close;

   if (pgcMain.ActivePage=tbsEdit) and (blnqryOutChange) then
      SetDetailActive(True,True);
end;

procedure TfrmLocationOut.ppmdelPopup(Sender: TObject);
begin
   if (data.qryout.FieldByName('operationname').AsString='') then
   begin
      mitDelDetail.Caption:='未有出货数据';
      mitDelDetail.Enabled:=False;
   end else
   begin
      mitDelDetail.Caption:='取消出货';
      mitDelDetail.Enabled:=True;
   end;
   mitDelDetail.Enabled:= ItemDetailEdit.Enabled;
end;

procedure TfrmLocationOut.mitlocccCheckClick(Sender: TObject);
begin
   {if _Language='CAPTIONC' then _strmessage:='该操作将对该笔出仓资料进行财务确认，您确定要确认吗?'
   else _strmessage:='该操作将对该笔出仓资料进行财务确认，您确定要确认吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','049'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      ExecSql(dataTmp.qryTmp,'update LocationOUT'
                    +'   set loacccheckname="'+_LoginName+'",'
                    +'       loacccheckdate=getdate() '
                    +' where Jobno="'+data.qryOUT.FieldByName('Jobno').AsString+'" ');
      btnRefreshClick(Self);
   end;
end;

procedure TfrmLocationOut.mitLocUnCheckClick(Sender: TObject);
begin
   if data.qryOut.FieldByName('loacccheckname').AsString='' then exit;
   if data.qryOut.FieldByName('operationname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='已经产生出货,不能取消财务确认'
      else _strmessage:='已经产生出货,不能取消财务确认';}
      KmessageDlg(GetMessage('frmLocationOut','050'),mtWarning,[mbYes],0);
      exit;
   end;
   if (_canmodifyother<>'T') and (data.qryOut.FieldByName('loacccheckname').AsString<>_LoginName) then
   begin
      KmessageDlg(GetMessage('frmLocationOut','087'),mtWarning,[mbYes],0);//是否是同人修改
      exit;
   end;
   {if _Language='CAPTIONC' then _strmessage:='该操作将取消对该笔出仓资料的财务确认，您确定要确认吗?'
   else _strmessage:='该操作将取消对该笔出仓资料的财务确认，您确定要确认吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','051'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      ExecSql(dataTmp.qryTmp,'update LocationOUT'
                    +'   set loacccheckname="",'
                    +'       loacccheckdate=""'
                    +' where Jobno="'+data.qryOUT.FieldByName('Jobno').AsString+'" ');
      btnRefreshClick(Self);
   end;
end;

procedure TfrmLocationOut.grdcasingEnter(Sender: TObject);
begin
   if (DataState in Setdcs) and (data.qryLocoutItemCasing.IsEmpty) then
   begin
      mitCasingAddClick(sender);
   end;
end;

procedure TfrmLocationOut.mitCasingAddClick(Sender: TObject);
begin
   data.qryLocOutItemCasing.Append;
   grdCasing.SetFocus;
   grdCasingBeforeinsert;
end;

procedure TfrmLocationOut.mitCasingDelClick(Sender: TObject);
begin
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdCasing.setfocus;
      data.qryLocOutItemCasing.delete;
   end;
end;

procedure Tfrmlocationout.grdCasingBeforeinsert;
begin
   data.qryLocOutItemCasing.Edit;
   data.qryLocOutItemCasing.FieldByName('jobno').AsString:=data.qrylocationout.FieldByName('jobno').asString;
   data.qryLocOutItemCasing.FieldByName('sno').AsInteger:=-1;
   data.qryLocOutItemCasing.FieldByName('operationtype').AsInteger:=-1;
   data.qryLocOutItemCasing.FieldByName('currcd').AsString:=_currcd;
   data.qryLocOutItemCasing.FieldByName('costcountuomtype').AsString:='Volumetask';
end;

procedure TfrmLocationOut.grdcasingKeyDown(Sender: TObject; var Key: Word;
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
           if uppercase(Name)='GRDCASING' then
             mitCasingDelClick(sender);
           key:=0;
        end;
      end;
   end;
end;

procedure TfrmLocationOut.grdcasingExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
         if DataLink.DataSet.State in [dsinsert,dsedit] then
         begin
           data.qryLocOutItemCasing.Post;
         end;
      except
         Setfocus;
     raise;
     end;
   end;
end;

procedure TfrmLocationOut.PieceTaskCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('Piecetask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(PieceTaskCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('Piecetask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;
      end;
   end;
end;

procedure TfrmLocationOut.QualityNameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
     data.qryLocOutItemCasing.edit;
     data.qryLocOutItemCasing.FieldByName('QualityName').AsString
                   :=pGetqualitySelect(data.qryLocOutItemCasing.FieldByName('QualityName').AsString);
  end;
end;

procedure TfrmLocationOut.PriceInCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   struomtype:string;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      struomtype:=data.qryLocOutItemCasing.FieldByName('costuomtype').AsString;
      data.qryLocOutItemCasing.Edit;
      data.qryLocOutItemCasing.FieldByName('pricein').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      data.qryLocOutItemCasing.FieldByName('SkuCostin').AsFloat:= data.qryLocOutItemCasing.FieldByName('volumetask').AsFloat*
                                                                      data.qryLocOutItemCasing.FieldByName('pricein').AsFloat;
      Accept:=True;
   end;
end;

procedure TfrmLocationOut.consigncusnameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocOutItemCasing.Edit;
         data.qryLocOutItemCasing.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocOutItemCasing.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.ShipperCusNameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocOutItemCasing.Edit;
         data.qryLocOutItemCasing.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocOutItemCasing.FieldByName('shippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         data.qryLocOutItemCasing.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocOutItemCasing.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         data.qryLocOutItemCasing.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocOutItemCasing.FieldByName('costcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.SkuNameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:Integer;
   mulcasingSelect:TMultLocCasingSelect;
begin
   mulcasingSelect:=WorkLocCasingSelect('');
   for i:=0 to 100 do
   begin
      if mulcasingSelect[i].OkFlag then
      begin
         if i=0 then
         begin
            data.qryLocOutItemCasing.Edit;
         end else
         begin
            try
               data.qryLocOutItemCasing.Post;
            except
               Break;
            end;
            data.qryLocOutItemCasing.Append;
//            data.qryLocOutItemCasing.FieldByName('jobno').AsString:=data.qryLocationout.fieldbyname('jobno').AsString;
//            data.qryLocOutItemCasing.FieldByName('operationtype').AsInteger:=1;
         end;
         data.qryLocOutItemCasing.FieldByName('jobno').AsString            :=data.qryLocationout.fieldbyname('jobno').AsString;
         data.qryLocOutItemCasing.FieldByName('operationdate').AsDateTime  :=mulcasingSelect[i].OperationDate;
         data.qryLocOutItemCasing.FieldByName('skuid').AsString            :=mulcasingSelect[i].skuid;
         data.qryLocOutItemCasing.FieldByName('qualityname').AsString      :=mulcasingSelect[i].QualityName;
         data.qryLocOutItemCasing.FieldByName('jobnoin').AsString          :=mulcasingSelect[i].Jobno;
         data.qryLocOutItemCasing.FieldByName('snoin').AsInteger           :=mulcasingSelect[i].sno;
         data.qryLocOutItemCasing.FieldByName('ldsnoin').AsInteger        :=mulcasingSelect[i].ldsno;
         data.qryLocOutItemCasing.FieldByName('jobnoinf').AsString         :=mulcasingSelect[i].JobnoINf;
         data.qryLocOutItemCasing.FieldByName('snoinf').AsInteger          :=mulcasingSelect[i].snoINf;
         data.qryLocOutItemCasing.FieldByName('ldsnoinf').AsInteger        :=mulcasingSelect[i].ldsnoINf;
         data.qryLocOutItemCasing.FieldByName('snocasingin').AsInteger     :=mulcasingSelect[i].sno;
         data.qryLocOutItemCasing.FieldByName('mainorder').AsString        :=mulcasingSelect[i].MainOrder;
//         data.qryLocOutItemCasing.FieldByName('cusbillno').AsString        :=mulcasingSelect[i].cusbillno;
         data.qryLocOutItemCasing.FieldByName('cusbillnoin').AsString        :=mulcasingSelect[i].cusbillno;
         data.qryLocOutItemCasing.FieldByName('SKUName').AsString          :=mulcasingSelect[i].SKUName;
         data.qryLocOutItemCasing.FieldByName('shipcusid').AsString        :=mulcasingSelect[i].shipcusid;
         data.qryLocOutItemCasing.FieldByName('shipcusname').AsString      :=mulcasingSelect[i].shipcusname;
         data.qryLocOutItemCasing.FieldByName('locid').AsString            :=mulcasingSelect[i].locid;
         data.qryLocOutItemCasing.FieldByName('locname').AsString          :=mulcasingSelect[i].locname;
         data.qryLocOutItemCasing.FieldByName('quantitytask').AsFloat      :=mulcasingSelect[i].syquantity;
         data.qryLocOutItemCasing.FieldByName('piecetask').AsFloat         :=mulcasingSelect[i].sypiece;
         data.qryLocOutItemCasing.FieldByName('volumetask').AsFloat        :=mulcasingSelect[i].syvolume;
         data.qryLocOutItemCasing.FieldByName('netweighttask').AsFloat     :=mulcasingSelect[i].synetweight;
         data.qryLocOutItemCasing.FieldByName('grossweighttask').AsFloat   :=mulcasingSelect[i].syGrossWeight;
         data.qryLocOutItemCasing.FieldByName('areatask').AsFloat          :=mulcasingSelect[i].syarea;
         data.qryLocOutItemCasing.FieldByName('costcusid').AsString        :=mulcasingSelect[i].costcusid;
         data.qryLocOutItemCasing.FieldByName('costcusname').AsString      :=mulcasingSelect[i].costcusname;
         data.qryLocOutItemCasing.FieldByName('costcusidout').AsString     :=mulcasingSelect[i].costcusidout;
         data.qryLocOutItemCasing.FieldByName('costcusnameout').AsString   :=mulcasingSelect[i].costcusnameout;
         data.qryLocOutItemCasing.FieldByName('cusid').AsString            :=mulcasingSelect[i].cusid;
         data.qryLocOutItemCasing.FieldByName('cusname').AsString          :=mulcasingSelect[i].cusname;
         data.qryLocOutItemCasing.FieldByName('shippercusid').AsString     :=mulcasingSelect[i].Shippercusid;
         data.qryLocOutItemCasing.FieldByName('Shippercusname').AsString   :=mulcasingSelect[i].Shippercusname;
         data.qryLocOutItemCasing.FieldByName('quantityuom').AsString      :=mulcasingSelect[i].quantityuom;
         data.qryLocOutItemCasing.FieldByName('pieceuom').AsString         :=mulcasingSelect[i].pieceuom;
         data.qryLocOutItemCasing.FieldByName('areauom').AsString          :=mulcasingSelect[i].areauom;
         data.qryLocOutItemCasing.FieldByName('volumeuom').AsString        :=mulcasingSelect[i].volumeuom;
         data.qryLocOutItemCasing.FieldByName('weightuom').AsString        :=mulcasingSelect[i].weightuom;
         data.qryLocOutItemCasing.FieldByName('currcd').AsString           :=mulcasingSelect[i].currcd;
         data.qryLocOutItemCasing.FieldByName('pricein').AsFloat           :=mulcasingSelect[i].pricein;
         data.qryLocOutItemCasing.FieldByName('skucostin').AsFloat         :=mulcasingSelect[i].skucostin;

         data.qryLocOutItemCasing.FieldByName('conno').AsString       :=mulcasingSelect[i].conno;
         data.qryLocOutItemCasing.FieldByName('lotcode').AsString          :=mulcasingSelect[i].LotCode;
         data.qryLocOutItemCasing.FieldByName('costuomtype').AsString      :=mulcasingSelect[i].costuomtype;
      end;
   end;

end;

procedure TfrmLocationOut.mitCasingTaskedClick(Sender: TObject);
begin
   if DataState in Setdcs then
   begin
     if data.qrylocationout.FieldByName('operationname').AsString<>'' then
     begin
        {if _Language='CAPTIONC' then
           _strmessage:='该笔已经产生出货，请先执行取消出货操作!'
        else
           _strmessage:='***************************************';}
        KMessageDlg(GetMessage('frmLocationOut','052'),mtWarning,[mbok],0);
        exit;
     end;
     if data.qrylocationoutItem.Active<>True then data.qrylocationoutItem.Open;
     if not data.qrylocationoutItem.IsEmpty then
     begin
        {if _Language='CAPTIONC' then
           _strmessage:='该操作将覆盖任务中的商品,确定吗？'
        else
           _strmessage:='***************************************';}
        if (KMessageDlg(GetMessage('frmLocationOut','053'),mtConfirmation,[mbyes,mbno],0)<>mryes) then
        exit;
     end;
     data.qrylocationoutItem.DisableControls;
     data.qrylocationoutdetail.DisableControls;
     data.qrylocationoutItem.First;
     while not data.qrylocationoutItem.Eof do
     begin
        data.qrylocationoutdetail.First;
        while not data.qrylocationoutdetail.Eof do
        begin
           data.qrylocationoutdetail.Delete;
        end;
        data.qrylocationoutItem.Delete;
     end;
     data.qrylocationoutdetail.EnableControls;
     data.qrylocationoutItem.EnableControls;
     GetCasingSKU;
   end;
end;

procedure TfrmLocationOut.GetCasingSKU;
var
   strcasing,strsqlcasing:string;
begin
   data.qryLocOutItemCasing.DisableControls;
   data.qryLocOutItemCasing.First;
   strcasing:='  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'    where id=object_id("tempdb..#lskcasingsku") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'     drop table #lskcasingsku'
             +' create table #lskcasingsku '+chr(13)+chr(10)
             +'   (  jobno  varchar(40) not null, '+chr(13)+chr(10)
             +'      sno    integer not null,'+chr(13)+chr(10)
             +'      snocasing integer )  '+chr(13)+chr(10);
   while not data.qryLocOutItemCasing.Eof do
   begin
      strcasing:=strcasing+' insert into #lskcasingsku '+chr(13)+chr(10)
                          +'             values("'+data.qryLocOutItemCasing.fieldbyname('jobnoin').AsString+'",'+chr(13)+chr(10)
                          +'                    "'+IntToStr(data.qryLocOutItemCasing.fieldbyname('sno').asinteger)+'", '+chr(13)+chr(10)
                          +'                   "'+IntToStr(data.qryLocOutItemCasing.fieldbyname('snocasingin').asinteger)+'") '+chr(13)+chr(10);
      data.qryLocOutItemCasing.next;
   end;
   data.qryLocOutItemCasing.EnableControls;
   ExecSql(dataTmp.qryTmp,strcasing);
   strsqlcasing:=' select item.*,snocasing1=#lskcasingsku.sno, '+chr(13)+chr(10)
                +'        syquantity=item.quantitytask-isnull(item.quantitydotask,0),'+chr(13)+chr(10)
                +'        sypiece=item.piecetask-isnull(item.piecedotask,0),'+chr(13)+chr(10)
                +'        syvolume=item.volumetask-isnull(item.volumedotask,0),'+chr(13)+chr(10)
                +'        syarea =item.areatask-isnull(item.areadotask,0),'+chr(13)+chr(10)
                +'        synetweight= item.netweighttask-isnull(item.netweightdotask,0),'+chr(13)+chr(10)
                +'        sygrossweight=item.grossweighttask-isnull(item.grossweightdotask,0),'+chr(13)+chr(10)
                +'        sycasing1 =item.casing1task-isnull(item.casing1dotask,0),'+chr(13)+chr(10)
                +'        sycasing2 =item.casing2task-isnull(item.casing2dotask,0),'+chr(13)+chr(10)
                +'        sycasing3 =item.casing3task-isnull(item.casing3dotask,0),'+chr(13)+chr(10)
                +'        sycasing4 =item.casing4task-isnull(item.casing4dotask,0),'+chr(13)+chr(10)
                +'        sycasing5 =item.casing5task-isnull(item.casing5dotask,0) '+chr(13)+chr(10)
                +'   from locationinitem item (nolock),#lskcasingsku '+chr(13)+chr(10)
                +'    where item.jobno=#lskcasingsku.jobno '+chr(13)+chr(10)
                +'      and item.quantity-isnull(item.quantitydotask,0)>0 '+chr(13)+chr(10)
                +'      and item.quantity-isnull(item.quantitydoorder,0)>0 '+chr(13)+chr(10)
                +'      and item.snocasing=#lskcasingsku.snocasing ';
   OpenSql(datatmp.qryTmp,strsqlcasing);
   datatmp.qryTmp.First;
   while not dataTmp.qryTmp.Eof do
   begin
      data.qrylocationoutItem.Append;
      data.qrylocationoutItem.FieldByName('snocasingin').asstring         :=dataTmp.qrytmp.fieldbyname('snocasing').asstring;
      data.qrylocationoutItem.FieldByName('snocasing').AsInteger          :=dataTmp.qrytmp.fieldbyname('snocasing1').AsInteger;
      data.qryLocationOutItem.fieldbyname('SKUID').asstring               :=dataTmp.qrytmp.fieldbyname('SKUID').asstring;
      data.qryLocationOutItem.fieldbyname('SKUName').asstring             :=dataTmp.qrytmp.fieldbyname('SKUName').asstring;
      data.qryLocationOutItem.Fieldbyname('LotCode').asstring             :=dataTmp.qrytmp.fieldbyname('LotCode').asstring;
      data.qryLocationOutItem.fieldbyname('Quantitytask').AsFloat         :=dataTmp.qrytmp.fieldbyname('syquantity').AsFloat;//
      data.qryLocationOutItem.fieldbyname('QualityName').asstring         :=dataTmp.qrytmp.fieldbyname('QualityName').asstring;
      data.qryLocationOutItem.fieldbyname('QuantityUOM').asstring         :=dataTmp.qrytmp.fieldbyname('QuantityUOM').asstring;
      data.qryLocationOutItem.fieldbyname('PieceUOM').asstring            :=dataTmp.qrytmp.fieldbyname('PieceUOM').asstring;
      data.qryLocationOutItem.fieldbyname('WeightUOM').asstring           :=dataTmp.qrytmp.fieldbyname('WeightUOM').asstring;
      data.qryLocationOutItem.fieldbyname('VolumeUOM').asstring           :=dataTmp.qrytmp.fieldbyname('VolumeUOM').asstring;
      data.qryLocationOutItem.Fieldbyname('AreaUOM').asstring             :=dataTmp.qrytmp.fieldbyname('AreaUOM').asstring;
      data.qryLocationOutItem.fieldbyname('Piecetask').AsFloat            :=dataTmp.qrytmp.fieldbyname('sypiece').AsFloat; //
      data.qryLocationOutItem.fieldbyname('NetWeighttask').asFloat        :=dataTmp.qrytmp.fieldbyname('synetweight').asFloat; //
      data.qryLocationOutItem.Fieldbyname('GrossWeighttask').asFloat      :=dataTmp.qrytmp.fieldbyname('sygrossweight').asFloat; //
      data.qryLocationOutItem.fieldbyname('Volumetask').asFloat           :=dataTmp.qrytmp.fieldbyname('syvolume').asFloat; //
      data.qryLocationOutItem.Fieldbyname('Areatask').asFloat             :=dataTmp.qrytmp.fieldbyname('syarea').asFloat; //
      data.qryLocationOutItem.fieldbyname('cusid').asstring               :=dataTmp.qrytmp.fieldbyname('cusid').asstring;
      data.qryLocationOutItem.fieldbyname('cusName').asstring         :=dataTmp.qrytmp.fieldbyname('cusName').asstring;
      data.qryLocationOutItem.Fieldbyname('Shippercusid').asstring        :=dataTmp.qrytmp.fieldbyname('Shippercusid').asstring;
      data.qryLocationOutItem.Fieldbyname('ShippercusName').asstring      :=dataTmp.qrytmp.fieldbyname('ShippercusName').asstring;
      data.qryLocationOutItem.Fieldbyname('Shipcusid').asstring        :=dataTmp.qrytmp.fieldbyname('Shipcusid').asstring;
      data.qryLocationOutItem.Fieldbyname('ShipcusName').asstring      :=dataTmp.qrytmp.fieldbyname('ShipcusName').asstring;
      data.qryLocationOutItem.Fieldbyname('costcusid').asstring        :=dataTmp.qrytmp.fieldbyname('costcusid').asstring;
      data.qryLocationOutItem.Fieldbyname('costcusName').asstring      :=dataTmp.qrytmp.fieldbyname('costcusName').asstring;
      data.qryLocationOutItem.Fieldbyname('PiecePro').asFloat      :=0;
      data.qryLocationOutItem.Fieldbyname('VolumePro').asFloat     :=0;
      data.qryLocationOutItem.fieldbyname('NetWeightPro').asFloat  :=0;
      data.qryLocationOutItem.fieldbyname('GrossWeightPro').asFloat:=0;
      data.qryLocationOutItem.fieldbyname('AreaPro').asFloat       :=0;

      data.qryLocationOutItem.Fieldbyname('UOM1').asstring        :=dataTmp.qrytmp.fieldbyname('UOM1').asstring;
      data.qryLocationOutItem.Fieldbyname('UOM2').asstring        :=dataTmp.qrytmp.fieldbyname('UOM2').asstring;
      data.qryLocationOutItem.Fieldbyname('UOM3').asstring        :=dataTmp.qrytmp.fieldbyname('UOM3').asstring;
      data.qryLocationOutItem.Fieldbyname('UOM4').asstring        :=dataTmp.qrytmp.fieldbyname('UOM4').asstring;
      data.qryLocationOutItem.Fieldbyname('UOM5').asstring        :=dataTmp.qrytmp.fieldbyname('UOM5').asstring;
      data.qryLocationOutItem.Fieldbyname('pro1').asFloat         :=0;
      data.qryLocationOutItem.Fieldbyname('pro2').asFloat         :=0;
      data.qryLocationOutItem.Fieldbyname('pro3').asFloat         :=0;
      data.qryLocationOutItem.Fieldbyname('pro4').asFloat         :=0;
      data.qryLocationOutItem.Fieldbyname('pro5').asFloat         :=0;
      data.qryLocationOutItem.Fieldbyname('Casing1').asFloat            :=dataTmp.qrytmp.fieldbyname('sycasing1').asFloat;    //
      data.qryLocationOutItem.Fieldbyname('Casing2').asFloat            :=dataTmp.qrytmp.fieldbyname('sycasing2').asFloat;    //
      data.qryLocationOutItem.Fieldbyname('Casing3').asFloat            :=dataTmp.qrytmp.fieldbyname('sycasing3').asFloat;    //
      data.qryLocationOutItem.Fieldbyname('Casing4').asFloat            :=dataTmp.qrytmp.fieldbyname('sycasing4').asFloat;    //
      data.qryLocationOutItem.Fieldbyname('Casing5').asFloat            :=dataTmp.qrytmp.fieldbyname('sycasing5').asFloat;    //

      data.qryLocationOutItem.Fieldbyname('price').asFloat              :=dataTmp.qrytmp.fieldbyname('price').asFloat;
      data.qryLocationOutItem.Fieldbyname('Currcd').asstring            :=dataTmp.qrytmp.fieldbyname('Currcd').asstring;
      data.qryLocationOutItem.fieldbyname('SKUCost').asFloat            :=dataTmp.qrytmp.fieldbyname('SKUCost').asFloat;
      data.qryLocationOutItem.Fieldbyname('priceIn').asFloat            :=dataTmp.qrytmp.fieldbyname('priceIn').asFloat;
      data.qryLocationOutItem.fieldbyname('SKUCostIn').asFloat          :=dataTmp.qrytmp.fieldbyname('SKUCostIn').asFloat;
      data.qryLocationOutItem.fieldbyname('CostUOMType').asstring       :=dataTmp.qrytmp.fieldbyname('CostUOMType').asstring;

      data.qryLocationOutItem.fieldbyname('locname').asstring:=dataTmp.qrytmp.fieldbyname('locname').asstring;
      data.qryLocationOutItem.fieldbyname('locid').asstring    :=dataTmp.qrytmp.fieldbyname('locid').asstring;

      data.qryLocationOutItem.fieldbyname('JOBNOIN').asstring           :=dataTmp.qrytmp.fieldbyname('JOBNO').asstring;
      data.qryLocationOutItem.Fieldbyname('SNOIN').asInteger            :=dataTmp.qrytmp.fieldbyname('SNO').asInteger;
      data.qryLocationOutItem.Fieldbyname('LDSNOIN').asInteger          :=dataTmp.qrytmp.fieldbyname('LDSNOin').asInteger;
      data.qryLocationOutItem.fieldbyname('JobnoINF').asstring          :=dataTmp.qrytmp.fieldbyname('JobnoINF').asstring;
      data.qryLocationOutItem.Fieldbyname('SNOINF').asInteger           :=dataTmp.qrytmp.fieldbyname('SNOINF').asInteger;
      data.qryLocationOutItem.Fieldbyname('LDSNOINF').asInteger         :=dataTmp.qrytmp.fieldbyname('LDSNOINF').asInteger;
      data.qryLocationOutItem.Fieldbyname('jobnoori').AsString          :=dataTmp.qrytmp.fieldbyname('jobnoori').asstring;
      data.qryLocationOutItem.Fieldbyname('snoori').AsString            :=dataTmp.qrytmp.fieldbyname('snoori').asstring;
      data.qryLocationOutItem.fieldbyname('snoorder').asstring          :='';
      data.qryLocationOutItem.fieldbyname('jobnoorder').asstring        :='';

      data.qryLocationOutItem.Fieldbyname('locationbillnoin').AsString  :=dataTmp.qrytmp.fieldbyname('locationbillno').asstring;
      data.qryLocationOutItem.Fieldbyname('customsnoin').AsString       :=dataTmp.qrytmp.fieldbyname('customsno').asstring;
      data.qryLocationOutItem.Fieldbyname('cusbillnoin').AsString       :=dataTmp.qrytmp.fieldbyname('cusbillno').asstring;
      data.qryLocationOutItem.Fieldbyname('mainorderin').AsString       :=dataTmp.qrytmp.fieldbyname('mainorder').asstring;

      data.qryLocationOutItem.fieldbyname('LotTracked').asstring         :=dataTmp.qrytmp.fieldbyname('LotTracked').asstring;
      data.qryLocationOutItem.fieldbyname('TagEach').asstring            :=dataTmp.qrytmp.fieldbyname('TagEach').asstring;
      data.qryLocationOutItem.fieldbyname('TagEachUOM').asstring         :=dataTmp.qrytmp.fieldbyname('TagEachUOM').asstring;
      data.qryLocationOutItem.fieldbyname('WareRentCountType').asstring  :=dataTmp.qrytmp.fieldbyname('WareRentCountType').asstring;
      data.qryLocationOutItem.fieldbyname('WareRentCountTypeOut').asstring  :=dataTmp.qrytmp.fieldbyname('WareRentCountTypeOut').asstring;
      data.qryLocationOutItem.fieldbyname('isbond').asstring             :=dataTmp.qrytmp.fieldbyname('isbond').asstring;
      data.qryLocationOutItem.fieldbyname('COUNTRENT').asstring          :=dataTmp.qrytmp.fieldbyname('COUNTRENT').asstring;
      data.qryLocationOutItem.fieldbyname('COUNTCONTCOST').asstring      :=dataTmp.qrytmp.fieldbyname('COUNTCONTCOST').asstring;
      data.qryLocationOutItem.Fieldbyname('LOADCOSTONE').asString        :=dataTmp.qrytmp.fieldbyname('LOADCOSTONE').asstring;
      data.qryLocationOutItem.Fieldbyname('RentCountUOMType').asString   :=dataTmp.qrytmp.fieldbyname('RentCountUOMType').asstring;
      data.qryLocationOutItem.Fieldbyname('CostCountUOMType').asString   :=dataTmp.qrytmp.fieldbyname('CostCountUOMType').asstring;
      data.qryLocationOutItem.Fieldbyname('NotFullSign').asString        :=dataTmp.qrytmp.fieldbyname('NotFullSign').asstring;
      try
         data.qrylocationoutItem.Post;
      except
         Break;
      end;
      dataTmp.qryTmp.Next;

   end;

end;

procedure TfrmLocationOut.VolumeTaskCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'')  then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('VolumeTask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(VolumeTaskCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('VolumeTask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationOut.mitLocAdustClick(Sender: TObject);
var
   struserid,strusername,strjobnoloc,strjobnoware,strorderid:string;
begin
   if data.qryOut.FieldByName('taskiscomplete').AsString<>'T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单还未完成出货,无法下达指令!'
      else _strmessage:='该单还未完成出货,无法下达指令!';}
      KMessageDlg(GetMessage('frmLocationOut','054'),mtInformation,[mbyes],0);
      exit;
   end;
   if data.qryOut.FieldByName('transordered').AsString='T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单已经生成配送指令'
      else _strmessage:='**********************';}
      KMessageDlg(GetMessage('frmLocationOut','055'),mtInformation,[mbyes],0);
      exit;
   end;
   if data.qryOut.FieldByName('wareordered').AsString='T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单已经生成进仓指令'
      else _strmessage:='**********************';}
      KMessageDlg(GetMessage('frmLocationOut','056'),mtInformation,[mbyes],0);
      exit;
   end;
   if not WorkWareOrderInfset(struserid,strusername) then Exit;
   _ADOConnection.StartTransaction;
   try
      opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                   +'  from genjobno where substring(docno1,1,2)="OI" and substring(docno1,3,4)="'+copy(datetostr(date),1,4)+'"' );
      strorderid  :='OJ'+copy(datetostr(date),1,4)
                    +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
      strjobnoloc:=data.qryOut.fieldbyname('jobno').AsString;
      strjobnoware:=GenJobno('WO',strorderid);
      ExecSql(dataTmp.qryTmp,'exec ksp_LocOutToWare "'+strjobnoloc+'","'+strjobnoware+'","'
                                                      +_userid+'","'+_username+'","'
                                                      +struserid+'","'+strusername+'","'
                                                      +strorderid+'","'+_Loginname+'"' );
      _ADOConnection.Commit;
      {if _Language='CAPTIONC' then _strmessage:='进仓指令下达成功'
      else _strmessage:='进仓指令下达成功';}
      KMessageDlg(GetMessage('frmLocationOut','057'),mtInformation,[mbyes],0);
   except
      if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      {if _Language='CAPTIONC' then _strmessage:='进仓指令下达失败,请与管理员联系'
      else _strmessage:='进仓指令下达失败,请与管理员联系' ;}
      KMessageDlg(GetMessage('frmLocationOut','058'),mtInformation,[mbyes],0);
      Exit;
   end;
   btnRefreshClick(mitLocAdust);
end;

procedure TfrmLocationOut.mitLocToTransClick(Sender: TObject);
var
   strInvono,strJobnotrans,struserid,strusername,strjobnoloc:string;
begin
   if data.qryOut.FieldByName('taskiscomplete').AsString<>'T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单还未完成出货,无法下达指令!'
      else _strmessage:='该单还未完成出货,无法下达指令!';}
      KMessageDlg(GetMessage('frmLocationOut','059'),mtInformation,[mbyes],0);
      exit;
   end;
   if data.qryOut.FieldByName('transordered').AsString='T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单已经生成配送指令'
      else _strmessage:='**********************';}
      KMessageDlg(GetMessage('frmLocationOut','060'),mtInformation,[mbyes],0);
      exit;
   end;
   if data.qryOut.FieldByName('wareordered').AsString='T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单已经生成进仓指令'
      else _strmessage:='**********************';}
      KMessageDlg(GetMessage('frmLocationOut','061'),mtInformation,[mbyes],0);
      exit;
   end;
   if not WorkWareOrderInfset(struserid,strusername) then Exit;
   _ADOConnection.StartTransaction;
   try
      opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                   +'  from genjobno where substring(docno1,1,2)="TO" and substring(docno1,3,4)="'+copy(datetostr(date),1,4)+'"' );
      if _paper='T' then
         strInvono:=''
      else
         strInvono  :='TO'+copy(datetostr(date),1,4)
                       +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
      strJobnotrans:=GenJobno('TO',strInvono);
      strjobnoloc:=data.qryOut.fieldbyname('jobno').AsString;
      ExecSql(dataTmp.qryTmp,'exec ksp_LocOutToTrans "'+strjobnoloc+'","'+strJobnotrans+'","'
                                                       +_userid+'","'+_username+'","'
                                                       +struserid+'","'+strusername+'","'
                                                       +strInvono+'","'+_Loginname+'"');
      _ADOConnection.Commit;
      {if _Language='CAPTIONC' then _strmessage:='配送指令下达成功!'
      else _strmessage:='**********************';}
      KMessageDlg(GetMessage('frmLocationOut','062'),mtInformation,[mbyes],0);
   except
      if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      {if _Language='CAPTIONC' then _strmessage:='配送指令下达失败,请与管理员联系'
      else _strmessage:='**********************' ;}
      KMessageDlg(GetMessage('frmLocationOut','063'),mtInformation,[mbyes],0);
      Exit;
   end;
   btnRefreshClick(mitLocToTrans);
end;

procedure TfrmLocationOut.costcusidItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryLocationOutItem.edit;
         data.qryLocationOutItem.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutitem.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         blnSelect:=True;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationOut.CostUOMTypeItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=CostUOMTypeItem.ItemFields.Strings[sltCostUomItem.indexof(grdLocationoutItem.InplaceEditor.GetEditingText)];
      data.qryLocationOutitem.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice (nolock) '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(data.qrylocationout.fieldbyname('taskdate').asdatetime)+'"'
                            +'   and skuid="'+data.qryLocationOutitem.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'%"'
             );
      data.qryLocationOutitem.Fieldbyname('costuomtype').asstring  :=strcostuom;
      data.qryLocationOutitem.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      data.qryLocationOutitem.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      data.qryLocationOutitem.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      data.qryLocationOutitem.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      data.qryLocationOutitem.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      if UpperCase(strcostuom)='SNO' then
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end else
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:=data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                           dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:=data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                           dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end;
   end;
end;

procedure TfrmLocationOut.priceItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationOutitem.Edit;
      strcostuom:=data.qrylocationoutItem.fieldbyname('costuomtype').AsString;
      data.qryLocationOutitem.FieldByName('price').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:=data.qryLocationOutitem.FieldByName('price').AsFloat
      else
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                                                                data.qryLocationOutitem.FieldByName('price').AsFloat;
    end;
end;

procedure TfrmLocationOut.priceinIItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationOutitem.Edit;
      strcostuom:=data.qrylocationoutItem.fieldbyname('costuomtype').AsString;
      data.qryLocationOutitem.FieldByName('pricein').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         data.qryLocationOutitem.FieldByName('SkuCostin').AsFloat:=data.qryLocationOutitem.FieldByName('pricein').AsFloat
      else
         data.qryLocationOutitem.FieldByName('SkuCostin').AsFloat:= data.qryLocationOutitem.FieldByName(strcostuom+'task').AsFloat*
                                                                data.qryLocationOutitem.FieldByName('pricein').AsFloat;
    end;

end;

procedure TfrmLocationOut.VolumetaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qryLocationOutitem.FieldByName('Volumetask').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationOutitem.fieldbyname('costuomtype').AsString+'task')=UpperCase(VolumetaskItem.FieldName) then
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutitem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutitem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('insurance').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.areataskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qryLocationOutitem.FieldByName('areatask').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationOutitem.fieldbyname('costuomtype').AsString+'task')=UpperCase(areataskItem.FieldName) then
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutitem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutitem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('insurance').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.grossweighttaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;

      if _StrSysCus='HQWL' then
      begin
         QuantityTaskOldValue:=data.qrylocationoutItem.FieldByName('grossweighttask').AsFloat;
         strcostuom:=IIF(data.qrylocationoutItem.FieldByName('CostUOMType').AsString='',
                         'piece',
                         data.qrylocationoutItem.FieldByName('CostUOMType').AsString);
         data.qrylocationoutItem.Edit;
         data.qrylocationoutItem.FieldByName('grossweighttask').AsFloat:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUgrossweight(data.qrylocationoutItem,QuantityTaskOldValue,'task');
         blnBLJS:=False;         
      end else
      begin
         data.qrylocationoutItem.Edit;
         data.qryLocationOutitem.FieldByName('grossweighttask').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      end;

      if UpperCase(data.qryLocationOutitem.fieldbyname('costuomtype').AsString+'task')=UpperCase(grossweighttaskitem.FieldName) then
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutitem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutitem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('insurance').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.netweighttaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      //二次校验  开始
      if (blnScheck) and (_IsManager<>'T') then
      begin
         if blnFirst then
         begin
            extFirstNum:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
            grdLocationOutItem.InplaceEditor.SetEditingText('0');
            blnFirst:=False;
            ErrorText:='为确保信息的正确性，请你再次输入！';
            Accept:=False;
            Exit;
         end else
         begin
            blnFirst:=True;
            if extFirstNum<>StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText)) then
            begin
               grdLocationOutItem.InplaceEditor.SetEditingText('0');
               ErrorText:='两次输入数值不符，请重新输入！';
               Accept:=False;
               exit;
            end;
         end;
      end;
      //二次校验 过程结束
      if _StrSysCus='HQWL' then
      begin
         QuantityTaskOldValue:=data.qrylocationoutItem.FieldByName('netweighttask').AsFloat;
         strcostuom:=IIF(data.qrylocationoutItem.FieldByName('CostUOMType').AsString='',
                         'piece',
                         data.qrylocationoutItem.FieldByName('CostUOMType').AsString);
         data.qrylocationoutItem.Edit;
         data.qrylocationoutItem.FieldByName('netweighttask').AsFloat:=StrToFloat(IIF(grdLocationOutItem.InplaceEditor.GetEditingText='',0,grdLocationOutItem.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qrylocationoutItem,QuantityTaskOldValue,'task');
         blnBLJS:=False;
      end else
      begin
         data.qrylocationoutItem.Edit;
         data.qryLocationOutitem.FieldByName('netweighttask').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      end;

      if UpperCase(data.qryLocationOutitem.fieldbyname('costuomtype').AsString+'task')=UpperCase(netweighttaskItem.FieldName) then
      begin
         data.qryLocationOutitem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationOutitem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('priceIn').AsFloat;
         data.qryLocationOutitem.FieldByName('SkuCost').AsFloat:= data.qryLocationOutitem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('price').AsFloat;
         data.qryLocationOutitem.FieldByName('carriagetotal').AsFloat:= data.qryLocationOutitem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('carriage').AsFloat;
         data.qryLocationOutitem.FieldByName('insurancetotal').AsFloat:= data.qryLocationOutitem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationOutitem.FieldByName('insurance').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.N13Click(Sender: TObject);
begin
   workActPrint('','900002',data.qryOut.fieldbyname('jobno').AsString,data.qryOut.fieldbyname('corpno').AsString);
end;

procedure TfrmLocationOut.mitLIOoutClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday,stryeartask,strmonthtask,strdaytask:Word;
   strdate,strusername,strcache:string;
   strcustaskoract,strjobnoprint:string; //按客户的配置要求，可以自己选择打印任务还是实际
   //_SkuHB,_taskordetail:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   //lzw 20090310
   if _StrSysCus='SWZ' then
   begin
      skuoutcontrol;
   end;
   //lzw20120406
   opensql(datatmp.qrytmp,'select isprint from locationout(nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
         );
   if datatmp.qrytmp.FieldByname('isprint').AsString='T' then
   begin
      if KmessageDlg('该出仓单已被打过!，请确认是否要重新打印？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
      exit;
   end;
   ExecSql(qryTmp,'update locationout  '+chr(13)+chr(10)
              +'   set printname="'+_loginname+'",isprint="T" '+chr(13)+chr(10)
              +' where jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
       );
   lstPara:=TStringList.Create;
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   strusername:=data.qrylocationout.FieldByname('username').AsString;
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('tasktime='+data.qrylocationout.FieldByname('taskdate').AsString);
   lstpara.Add('thetime='+copy(data.qrylocationout.FieldByname('taskdate').AsString,12,5));
   lstpara.Add('isbond='+data.qrylocationout.FieldByname('isbond').AsString);
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('Routing='+data.qrylocationout.FieldByname('Routing').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('PORTL='+data.qrylocationout.FieldByname('PORTL').AsString);
   lstpara.Add('PORTD='+data.qrylocationout.FieldByname('PORTD').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('condes='+data.qrylocationout.FieldByname('condes').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('cusname='+data.qrylocationout.FieldByname('cusname').Asstring);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstPara.Add('CARBRAND='+data.qryLocationOut.FieldByname('CARBRAND').AsString);
   lstPara.Add('CARRIERNO='+data.qryLocationOut.FieldByname('CARRIERNO').AsString);
   lstpara.Add('carriercusname='+data.qryLocationOut.FieldByname('carriercusname').Asstring);
   lstpara.Add('carrierdate='+data.qrylocationout.FieldByname('carrierdate').AsString);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('iusername='+data.qrylocationout.FieldByname('iusername').AsString);
   lstpara.Add('createdate='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('createname='+data.qrylocationout.FieldByname('createname').AsString);
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstPara.Add('loadcosttype='+data.qryLocationOut.FieldByname('loadcosttype').AsString);
   //lzw20120228
   lstPara.Add('shippercusname='+data.qrylocationout.fieldByname('shippercusname').AsString);
   lstPara.Add('loacccheckname='+data.qrylocationout.fieldByname('loacccheckname').AsString);
   lstPara.Add('taskcheckname='+data.qrylocationout.fieldbyname('taskcheckname').AsString);
   //******* wzh.05.08.30  begin ********//
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));
   lstpara.Add('costcusname='+data.qrylocationout.FieldByname('costcusname').Asstring);
   lstpara.Add('shipcusname='+data.qrylocationout.FieldByname('shipcusname').Asstring);
   lstpara.Add('trans='+data.qrylocationout.FieldByname('TRANS').Asstring);
   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   //lzw20090731
   DecodeDate(data.qrylocationout.FieldByname('TASKDATE').AsDateTime,strYeartask,strMonthtask,strDaytask);

   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   lstpara.Add('oyear='+inttostr(stryear));
   lstpara.Add('omonth='+inttostr(strmonth));
   lstpara.Add('oday='+inttostr(strday));
   lstpara.Add('oyeartask='+inttostr(stryeartask));
   lstpara.Add('omonthtask='+inttostr(strmonthtask));
   lstpara.Add('odaytask='+inttostr(strdaytask));

   lstPara.Add('operationdate='+strdate);
   lstPara.Add('operationdate1='+copy(data.qrylocationout.FieldByname('OperationDate').AsString,1,10));
   lstpara.Add('stockup='+iif(data.qrylocationout.FieldByname('TRANS').Asstring='T','请提前备货！！',''));

   if data.qryLocationOut.FieldByname('loadcosttype').AsString='送货' then
   begin
      lstPara.Add('loadtype1='+'''√''');
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype1='+'');
   end
   else if data.qryLocationOut.FieldByname('loadcosttype').AsString='自提' then
   begin
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype2='+'''√''');
      lstPara.Add('loadtype3='+'');
   end
   else
   begin
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype2='+'');
      lstPara.Add('loadtype3='+'''√');
   end;
   lstPara.Add('jobno='+data.qryLocationOut.FieldByname('jobno').AsString);

   //900052作业出入库联系单中用到
   lstpara.Add('title='+'产成品出库运输作业单');
   lstPara.Add('date='+DateToStr(Now));
   lstPara.Add('date='+DatetimeToStr(Now));
   //重复及不规范命名:一个月后更新无问题删除    lqs
   lstpara.Add('ck='+data.qrylocationout.FieldByname('iusername').AsString);
   lstpara.Add('zdrq='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('qysj='+data.qrylocationout.FieldByname('carrierdate').AsString);
   lstpara.Add('ddbh='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('zydh='+data.qrylocationout.FieldByname('LocationBillNO').AsString);
   lstPara.Add('cg='+data.qryLocationOut.FieldByname('opname').AsString);
   lstPara.Add('kp='+data.qryLocationOut.FieldByname('CreateName').AsString);
   lstPara.Add('carno='+data.qryLocationOut.FieldByname('CARBRAND').AsString);
   lstpara.Add('driver='+data.qryLocationOut.FieldByname('carriercusname').Asstring);
   lstPara.Add('loginname='+_Loginname);
   //
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   //助记符
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);

   //收货单位电话,地址
   OpenSql(dataTmp.qryTmp,'select cuscname,address,linkman,tel  '
                         +'  from customer (nolock)      '
                         +' where cusid="'+data.qrylocationout.FieldByname('shipcusid').AsString+'" ');
   lstPara.Add('shipaddress='+dataTmp.qryTmp.fieldByname('address').AsString);
   lstPara.Add('linkman='+dataTmp.qryTmp.fieldByname('linkman').AsString);
   lstPara.Add('tel='+dataTmp.qryTmp.fieldbyname('tel').AsString);
   //取上级部门
   OpenSql(dataTmp.qryTmp,'select pusername from organization  (nolock) where userid="'+data.qrylocationout.FieldByname('iuserid').Asstring+'"');
   lstPara.Add('pusername='+dataTmp.qryTmp.fieldbyname('pusername').AsString);
   
   OpenSql(dataTmp.qryTmp,'select tjhj=sum(isnull(volume,0)),slhj=sum(isnull(quantity,0)), '
                         +'       jzhj=sum(isnull(netweight,0)),    '
                         +'       rwtjhj=sum(isnull(volumetask,0)),rwslhj=sum(isnull(quantitytask,0))    '
                         +'  from locationoutitem (nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('tjhj='+dataTmp.qryTmp.FieldByname('tjhj').AsString);
   lstPara.Add('slhj='+dataTmp.qryTmp.FieldByname('slhj').AsString);
   lstPara.Add('jzhj='+dataTmp.qryTmp.FieldByname('jzhj').AsString);
   lstPara.Add('rwtjhj='+dataTmp.qryTmp.FieldByname('rwtjhj').AsString);
   lstPara.Add('rwslhj='+dataTmp.qryTmp.FieldByname('rwslhj').AsString);

   OpenSql(dataTmp.qryTmp,'select managecusname '
                         +'  from secondout (nolock) '
                         +' where customsno="'+data.qrylocationout.FieldByname('customsno').AsString+'" '
                         );
   lstPara.Add('managecusname='+dataTmp.qryTmp.FieldByname('managecusname').AsString);
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select top 1 locationinoutcon.* '
                         +'  from locationinoutcon (nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
                         +'   and isnull(iscon,"F")="F" '
                         );
   lstPara.Add('drivername='+dataTmp.qryTmp.FieldByname('drivername').AsString);
   lstPara.Add('driveridcar='+dataTmp.qryTmp.FieldByname('driveridcar').AsString);
   lstPara.Add('conveno='+dataTmp.qryTmp.FieldByname('conveno').AsString);
   lstPara.Add('drivertel='+dataTmp.qryTmp.FieldByname('drivertel').AsString);
   lstPara.Add('CONNO1='+dataTmp.qryTmp.FieldByname('CONNO').AsString);

   strcache:='';
   OpenSql(dataTmp.qryTmp,'select distinct forkgroupcusname  '
                         +'  from locationoutitem (nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
                         );
   if dataTmp.qryTmp.FieldByName('forkgroupcusname').AsString<>'' then
   begin
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         if (dataTmp.qryTmp.FieldByName('forkgroupcusname').AsString<>strcache) then
         begin
            if strcache='' then
               strcache:=dataTmp.qryTmp.FieldByName('forkgroupcusname').AsString
            else
               strcache:=strcache+'/'+dataTmp.qryTmp.FieldByName('forkgroupcusname').AsString;
         end;
         dataTmp.qryTmp.Next;
      end;
   end;
   lstPara.Add('forkgroupcusname='+strcache);

   strcustaskoract:='';
   if (getSysdata('qdtext')='T') or (_StrSysCus='WYFQ') then
   begin
      if KmessageDlg('请选择打印任务数据还是实际数据，点击是则为打印任务，否则打印实际。',mtConfirmation,[mbYes,mbNo],0)=mrYes then
         strcustaskoract:='TASK'
      else
         strcustaskoract:='ACT';
   end;

   if _StrSysCus='SHRL' then   //whl 2010.07.30 上海日陆，若没有做实际则打任务数据
   begin
      if data.qrylocationout.FieldByName('OPERATIONNAME').AsString='' then
         strcustaskoract:='TASK';
   end;

   if _SkuHB='F' then
   begin
      if (strcustaskoract='ACT') or ((strcustaskoract='') and (_LOPrintTask='F')) then
         OpenSql(dataTmp.qryTmp,'select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.ManufactureDate,detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,skucostbb=isnull(detail.skucost,0),       '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))*500),'+chr(13)+chr(10)
                               +'       piece=detail.piece,skuclass="'+cmbSKUClass.Text+'",      '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end,            '+chr(13)+chr(10)
                               +'       netweight=detail.netweight,                              '+chr(13)+chr(10)
                               +'       netweightint=detail.netweight,                           '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweight,                          '+chr(13)+chr(10)
                               +'       volume=detail.volume,detail.QualityName,                 '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       area=detail.area,  '+chr(13)+chr(10)
                               // Added by wql 2006.2.22 9:56:30
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillnoin ,detail.cusbillno,detail.corpno,price=detail.pricein,'+chr(13)+chr(10)
                               //add by cyh 06.04.08
                               +'       detail.locationBillNo,detail.piece,detail.netweight,detail.grossweight,detail.Volume,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'        model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1)'+chr(13)+chr(10)
                               +'                else  sku.skuspec end ,   '+chr(13)+chr(10)
                               +'        isbond=case when isnull(detail.isbond,"F")<>"T" then "否" else "是" end,locationout.transway ,sku.weightpro,    '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','',' syquantity=isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0) , '+chr(13)+chr(10)
                                     )
                               +iif(_StrSysCus<>'SHRL','',' sypiece=isnull(locationindetail.piece,0)-isnull(locationindetail.piecedo,0) , '+chr(13)+chr(10)
                                     )
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'  from locationoutdetail detail(nolock)  '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','','   left join locationindetail (nolock) '+chr(13)+chr(10)
                               +'                                 on locationindetail.jobno=detail.jobnoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.sno=detail.snoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.ldsno=detail.ldsnoin       '+chr(13)+chr(10)
                                          )
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +'               left join locationout(nolock)   '+chr(13)+chr(10)
                               +'                      on locationout.jobno=detail.jobno '+chr(13)+chr(10)
                               +' where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '
                               +iif(_paper='T','order by detail.sno ','')
                               )
      else
         OpenSql(dataTmp.qryTmp,'select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,   '+chr(13)+chr(10)
                               +'       sku.skuspec,detail.ManufactureDate, detail.cusbillnoin,     '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,skucostbb=isnull(detail.skucost,0),   '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantitytask=detail.quantitytask,                           '+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),   '+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))*500),'+chr(13)+chr(10)
                               +'       detail.quantitytask,detail.manufacturedate,                 '+chr(13)+chr(10)
                               +'       piece=detail.piecetask,skuclass="'+cmbSKUClass.Text+'",     '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end, '+chr(13)+chr(10)
                               +'       netweight=detail.netweighttask,                             '+chr(13)+chr(10)
                               +'       netweightint=detail.netweight,                           '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweighttask,                         '+chr(13)+chr(10)
                               +'       volume=detail.volumetask,detail.QualityName,                       '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       area=detail.areatask,detail.mainorder , '+chr(13)+chr(10)
                               // Added by wql 2006.2.22 9:56:30
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillnoin ,detail.cusbillno,detail.corpno,price=detail.pricein,'+chr(13)+chr(10)
                               //add by cyh 06.04.08
                               +'       detail.locationBillNo,detail.piecetask,detail.netweighttask, '+chr(13)+chr(10)
                               +'       detail.grossweighttask,detail.Volumetask,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'       model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,isbond=case when isnull(detail.isbond,"F")<>"T" then "否" else "是" end,                                                                                                                  '+chr(13)+chr(10)
                               +'       detail.outzoneno,locationout.transway,sku.weightpro,legaluom=null ,sku.pricein ,             '+chr(13)+chr(10)
                               +'       skucost=convert(numeric(16,4), case sku.legaluom when "quantity" then isnull(detail.quantitytask,0)*sku.pricein  '+chr(13)+chr(10)
                               +'                                      when "piece" then isnull(detail.piecetask,0)*sku.pricein                             '+chr(13)+chr(10)
                               +'                                      when "volume" then isnull(detail.volumetask,0)*sku.pricein                           '+chr(13)+chr(10)
                               +'                                      when "grossweight" then isnull(detail.grossweighttask,0)*sku.pricein                 '+chr(13)+chr(10)
                               +'                                      when "netweight" then isnull(detail.netweighttask,0)*sku.pricein                     '+chr(13)+chr(10)
                               +'                                      end), '
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','',' syquantity=case when isnull(detail.quantity,0)=0   '+chr(13)+chr(10)
                               +'                                           then isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0)-isnull(detail.quantitytask,0)  '+chr(13)+chr(10)
                               +'                                           else isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0) end, '+chr(13)+chr(10)
                                     )
                               +iif(_StrSysCus<>'SHRL','',' sypiece=case when isnull(detail.quantity,0)=0   '+chr(13)+chr(10)
                               +'                                           then isnull(locationindetail.piece,0)-isnull(locationindetail.piecedo,0)-isnull(detail.piecetask,0)  '+chr(13)+chr(10)
                               +'                                           else isnull(locationindetail.piece,0)-isnull(locationindetail.piecedo,0) end, '+chr(13)+chr(10)
                                     )
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'  from locationoutitem detail(nolock)    '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','','   left join locationindetail (nolock) '+chr(13)+chr(10)
                               +'                                 on locationindetail.jobno=detail.jobnoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.sno=detail.snoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.ldsno=detail.snolocin       '+chr(13)+chr(10)
                                          )
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +'               left join locationout(nolock)   '+chr(13)+chr(10)
                               +'                      on locationout.jobno=detail.jobno '+chr(13)+chr(10)
                               +' where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '
                               +iif(_paper='T','order by detail.sno ','')
                               );
   end else
   begin
      if (strcustaskoract='ACT') or ((strcustaskoract='') and (_LOPrintTask='F')) then
         OpenSql(dataTmp.qryTmp,'  select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.ManufactureDate,detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'         detail.lotcode,detail.skuname,  skucostbb=sum(isnull(detail.skucost,0)),   '+chr(13)+chr(10)
                               +'         locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                               +'         quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'         quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                               +'         m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                               +'         skuclass="'+cmbSKUClass.Text+'",detail.QualityName,     '+chr(13)+chr(10)
                               +'         detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'         detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'         detail.cusbillno,detail.corpno, quantitypiece=sku.piecepro,price=isnull(detail.pricein,0),'+chr(13)+chr(10)
                               +'         casing1=sum(isnull(detail.casing1,0)),        '+chr(13)+chr(10)
                               //add by cyh 06.04.08
                               +'         detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
//                               +'         detail.piece,detail.netweight,detail.grossweight,detail.Volume, '+chr(13)+chr(10)
                               +'         lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,    '+chr(13)+chr(10)
                               +'         model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,locationout.transway,isbond=case when isnull(detail.isbond,"F")<>"T" then "否" else "是" end,sku.weightpro,            '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','',' syquantity=sum(isnull(locationindetail.quantity,0))-sum(isnull(locationindetail.quantitydo,0)) , '+chr(13)+chr(10)
                                     )
                               +iif(_StrSysCus<>'SHRL','',' sypiece=sum(isnull(locationindetail.piece,0))-sum(isnull(locationindetail.piecedo,0)) , '+chr(13)+chr(10)
                                     )
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'    from locationoutdetail detail (nolock) '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','','   left join locationindetail (nolock) '+chr(13)+chr(10)
                               +'                                 on locationindetail.jobno=detail.jobnoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.sno=detail.snoin       '+chr(13)+chr(10)
                               +'                                and locationindetail.ldsno=detail.ldsnoin       '+chr(13)+chr(10)
                                          )
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +'               left join locationout(nolock)   '+chr(13)+chr(10)
                               +'                      on locationout.jobno=detail.jobno '+chr(13)+chr(10)
                               +'   where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'   group by detail.customsno,detail.customsnoin,detail.jobno,detail.locname,detail.locid,detail.lotcode,detail.skuname,sku.skumodel,sku.skuspec,detail.cusbillnoin,  '
                               +'            detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,detail.isbond,'+chr(13)+chr(10)
                               +'            detail.areauom,sku.customerno,detail.cusbillno,detail.corpno,sku.piecepro, detail.pricein,'+chr(13)+chr(10)
                               +'            detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,detail.ManufactureDate,  '+chr(13)+chr(10)
//whl                               +'            detail.piecetask,detail.netweighttask,detail.grossweighttask,detail.Volumetask,  '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),sku.piecepro,detail.mainorder,locationout.transway,'+chr(13)+chr(10)
                               +'            case when (charindex("(",detail.LotCode,1)>0)                                                             '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'                     then                                                                                                               '+chr(13)+chr(10)
                               +'                     substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'               else  "" end ,sku.weightpro,detail.QualityName                                                             '+chr(13)+chr(10)
                                )
      else
         OpenSql(dataTmp.qryTmp,'  select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'         detail.lotcode,detail.skuname,  skucostbb=sum(isnull(detail.skucost,0)),   '+chr(13)+chr(10)
                               +'         locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                      then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'         detail.manufacturedate,'+chr(13)+chr(10)       //wzh.05.08.30
//whl                               +'         detail.quantitytask, '+chr(13)+chr(10)
                               +'         quantity=sum(isnull(detail.quantitytask,0)),piece=sum(isnull(detail.piecetask,0)),'+chr(13)+chr(10)
                               +'         quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'         quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'         netweight=sum(isnull(detail.netweighttask,0)),grossweight=sum(isnull(detail.grossweighttask,0)),'+chr(13)+chr(10)
                               +'         netweightint=sum(isnull(detail.netweight,0)),                           '+chr(13)+chr(10)
                               +'         m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'         volume=sum(isnull(detail.volumetask,0)),area=sum(isnull(detail.areatask,0)),  '+chr(13)+chr(10)
                               +'         skuclass="'+cmbSKUClass.Text+'",detail.QualityName,     '+chr(13)+chr(10)
                               +'         detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'         detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'         detail.locationbillnoin ,detail.cusbillno,detail.corpno,quantitypiece=sku.piecepro,price=isnull(detail.pricein,0),detail.mainorder,'+chr(13)+chr(10)
//add by cyh 06.04.08
                               +'         detail.locationBillNo,piecetask=sum(isnull(detail.piecetask,0)),netweighttask=sum(isnull(detail.netweighttask,0)),grossweighttask=sum(isnull(detail.grossweighttask,0)),  '+chr(13)+chr(10)
                               +'         Volumetask=sum(isnull(detail.Volumetask,0)),detail.ShippercusName,detail.ShipcusName,detail.shippercusname ,             '+chr(13)+chr(10)
                               +'         lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                   and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                   and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                  then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                  else detail.lotcode end,          '+chr(13)+chr(10)
                               +'         model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,                                                                                                                  '+chr(13)+chr(10)
                               +'         detail.outzoneno,locationout.transway,sku.weightpro,'+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','',' syquantity=case when sum(isnull(detail.quantity,0))=0   '+chr(13)+chr(10)
                               +'                                           then sum(isnull(locationindetail.quantity,0))-sum(isnull(locationindetail.quantitydo,0))-sum(isnull(detail.quantitytask,0))  '+chr(13)+chr(10)
                               +'                                           else sum(isnull(locationindetail.quantity,0))-sum(isnull(locationindetail.quantitydo,0)) end, '+chr(13)+chr(10)
                                     )
                               +iif(_StrSysCus<>'SHRL','',' sypiece=case when sum(isnull(detail.quantity,0))=0   '+chr(13)+chr(10)
                               +'                                           then sum(isnull(locationindetail.piece,0))-sum(isnull(locationindetail.piecedo,0))-sum(isnull(detail.piecetask,0))  '+chr(13)+chr(10)
                               +'                                           else sum(isnull(locationindetail.piece,0))-sum(isnull(locationindetail.piecedo,0)) end, '+chr(13)+chr(10)
                                     )
                               +'         classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'         classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'    from locationoutitem detail(nolock)   '+chr(13)+chr(10)
                               //上海日陆配置，要求打余量
                               +iif(_StrSysCus<>'SHRL','','   left join locationindetail (nolock) '+chr(13)+chr(10)
                               +'                                    on locationindetail.jobno=detail.jobnoin       '+chr(13)+chr(10)
                               +'                                   and locationindetail.sno=detail.snoin       '+chr(13)+chr(10)
                               +'                                   and locationindetail.ldsno=detail.snolocin       '+chr(13)+chr(10)
                                          )
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                      on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +'               left join locationout(nolock)   '+chr(13)+chr(10)
                               +'                      on locationout.jobno=detail.jobno '+chr(13)+chr(10)
                               +'   where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'   group by detail.customsno,detail.customsnoin,detail.jobno,detail.locname,detail.locid,detail.lotcode,detail.skuname, '+chr(13)+chr(10)
//whl                               +'            detail.quantitytask,      '+chr(13)+chr(10)
                               +'            detail.manufacturedate,sku.skumodel,sku.skuspec,  '+chr(13)+chr(10)
                               +'            detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'            detail.areauom,sku.customerno,detail.locationbillnoin,detail.cusbillno,detail.corpno,detail.pricein,  '+chr(13)+chr(10)
                               +'            detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,detail.cusbillnoin,               '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),sku.piecepro,detail.mainorder,detail.outzoneno,locationout.transway,'+chr(13)+chr(10)
                               +'            case when (charindex("(",detail.LotCode,1)>0)                                                             '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'                     then                                                                                                               '+chr(13)+chr(10)
                               +'                     substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'               else  "" end  ,sku.weightpro,detail.QualityName                                                                    '+chr(13)+chr(10)
                               );

   end;
   if _StrSysCus='SWZ' then
   begin
      //lzw20090504
      OpenSql(qryTmp, 'select item.customsno,item.customsnoin,item.jobno,sku.skumodel,sku.skuspec,sku.color,  '+chr(13)+chr(10)
                     +'       item.lotcode,item.skuname,item.cusbillnoin,sku.customerno,locationout.Routing,   '+chr(13)+chr(10)
                     +'       skunamebb=item.skuname+" "+isnull(sku.skumodel,"")+" "+isnull(sku.skuspec,"")+" "+isnull(sku.color,""), '+chr(13)+chr(10)
                     +'       locname=case when item.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                     +'                    then substring(item.locname,len("'+strusername+'")+1,len(item.locname)) else item.locname end, '+chr(13)+chr(10)
                     +'       locationout.shipcusname,locationout.carbrand,locationout.remark, '+chr(13)+chr(10)
                     +'       quantitylj=item.casing4,grossweightrw=item.grossweight,casing5rw=item.casing5, '+chr(13)+chr(10)
                     +'       quantityrw=item.quantity,piecerw=item.piece,netweightrw=item.netweight,  '+chr(13)+chr(10)
                     +'       quantityyf=case when isnull(wareordersku.quantity,0)<>0  then wareordersku.quantity  '+chr(13)+chr(10)
                     +'                       when isnull(wareoutitem.quantity,0)<>0 then wareoutitem.quantity else item.quantitytask end  ,'+chr(13)+chr(10)
                     +'       pieceyf=case when isnull(wareordersku.piece,0)<>0  then wareordersku.piece  '+chr(13)+chr(10)
                     +'                       when isnull(wareoutitem.piece,0)<>0 then wareoutitem.piece else item.piecetask end  ,'+chr(13)+chr(10)
                     +'       netweightyf=case when isnull(wareordersku.netweight,0)<>0  then wareordersku.netweight  '+chr(13)+chr(10)
                     +'                       when isnull(wareoutitem.netweight,0)<>0 then wareoutitem.piece else item.netweighttask end  ,'+chr(13)+chr(10)
                     +'       grossweightyf=case when isnull(wareordersku.grossweight,0)<>0  then wareordersku.grossweight  '+chr(13)+chr(10)
                     +'                       when isnull(wareoutitem.grossweight,0)<>0 then wareoutitem.grossweight else item.grossweighttask end  ,'+chr(13)+chr(10)
                     +'       grossweightsj=case when isnull(locationoutdetail.casing5,0)<>0 then locationoutdetail.casing5 else locationoutdetail.grossweight end ,  '+chr(13)+chr(10)
                     +'       casing5sj=locationoutdetail.casing5,piecesj=locationoutdetail.piece,   '+chr(13)+chr(10)
                     +'       item.quantityuom,item.pieceuom,item.weightuom,'+chr(13)+chr(10)
                     +'       locationout.remark,locationout.piece,locationout.grossweight, ' +chr(13)+chr(10)
                     +'       item.locationbillnoin ,item.cusbillno,item.corpno,item.locationBillNo '+chr(13)+chr(10)
                     +'  from locationoutitem item(nolock)  '+chr(13)+chr(10)
                     +'               left join locationoutdetail (nolock)    '+chr(13)+chr(10)
                     +'                          on item.jobno=locationoutdetail.jobno     '+chr(13)+chr(10)
                     +'                         and item.sno=locationoutdetail.sno     '+chr(13)+chr(10)
                     +'               left join locationout (nolock)    '+chr(13)+chr(10)
                     +'                          on item.jobno=locationout.jobno     '+chr(13)+chr(10)
                     +'               left join sku (nolock)    '+chr(13)+chr(10)
                     +'                          on item.skuid=sku.skuid     '+chr(13)+chr(10)
                     +'               left join wareordersku(nolock)   '+chr(13)+chr(10)
                     +'                      on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                     +'                      and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                     +'               left join wareoutitem(nolock)  '+chr(13)+chr(10)
                     +'                      on wareoutitem.mainorder=item.mainorder '+chr(13)+chr(10)
                     +'                      and wareoutitem.costcusid=item.costcusid '+chr(13)+chr(10)
                     +'                      and wareoutitem.skuid=item.skuid '+chr(13)+chr(10)
                     +' where item.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
             );
      lstPara.Add('piecetotal='+qryTmp.FieldByname('piece').AsString);
      lstPara.Add('grossweighttotal='+qryTmp.FieldByname('piece').AsString);
      lstPara.Add('Routing='+qryTmp.FieldByname('Routing').AsString);
      lstPara.Add('Routing='+qryTmp.FieldByname('Routing').AsString);
      lstPara.Add('remark='+qryTmp.FieldByname('remark').AsString);
      lstPara.Add('shipcusname='+qryTmp.FieldByname('shipcusname').AsString);
      lstPara.Add('zysjc='+tmtcarrierdate.Text);
      lstPara.Add('zysjd='+timETSH.Text);
      lstPara.Add('zysb='+edtDestOrder.Text);
      lstpara.Add('kdr='+_loginname);

      Worklinprint('100130','old','省物资出仓单',qryTmp,nil,nil,lstpara);
   end else
   begin
      if _strsyscus='JJHY' then
      begin
         Worklinprint('100133','old','陆地港仓库出库单',dataTmp.qryTmp,nil,nil,lstpara);
      end else
      begin
         Worklinprint('900005','old','出%库联系单',dataTmp.qryTmp,nil,nil,lstpara);
      end;

   end;

end;

procedure TfrmLocationOut.mitItemLIInventoryClick(Sender: TObject);
var strsql,strFilter1:string;
begin
   strFilter1:=' and detail.jobno="'+data.qryLocationoutitem.FieldbyName('JobnoIN').AsString+'"'
              +' and detail.sno='+inttostr(data.qryLocationoutitem.FieldbyName('SNOIN').AsInteger)
              +' and detail.operationtype=1';
   strsql:='select detail.jobno,detail.operationdate,detail.quantity,'
          +'       quantityremain=detail.quantity-detail.quantitydo,'
          +'       quantityremainorder=detail.quantity-detail.quantitydoorder,'
          +'       quantityremaintask=detail.quantity-detail.quantitydotask,'
          +'       locationbillno=detail.locationbillno '
          +'  from locationinitem detail (nolock) '
          +' where detail.jobno="'+data.qryLocationoutitem.FieldbyName('JobnoIN').AsString+'"'
          +'   and detail.sno='+inttostr(data.qryLocationoutitem.FieldbyName('SNOIN').AsInteger)
          ;
   opensql(datatmp.qryTmp,strsql);
   kMessageDlg(GetMessage('frmLocationOut','064')+datatmp.qryTmp.fieldbyname('LocationBillNO').asString+','+chr(13)
              +GetMessage('frmLocationOut','065')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemainOrder').AsFloat)+','+chr(13)
              +GetMessage('frmLocationOut','066')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemainTask').AsFloat)+','+chr(13)
              +GetMessage('frmLocationOut','067')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemain').AsFloat)+'!', mtInformation, [mbOK], 0);
  //'64对应进仓的工作联系单号为' '65'该单指令数量还剩' '66该单任务数量还剩' '67该单库存数量还剩'
end;

procedure TfrmLocationOut.mitDetailLIInventoryClick(Sender: TObject);
var strsql:string;
begin
   strsql:='select detail.jobno,detail.operationdate,detail.quantity,'
          +'       quantityremain=detail.quantity-detail.quantitydo,'
          +'       locationbillno=detail.locationbillno '
          +'  from locationindetail detail (nolock) '
          +' where detail.jobno="'+data.qryLocationOUTDetail.FieldbyName('JobnoIN').AsString+'"'
          +'   and detail.sno='+inttostr(data.qryLocationOUTDetail.FieldbyName('SNOIN').AsInteger)
          +'   and detail.ldsno='+inttostr(data.qryLocationOUTDetail.FieldbyName('LDSNOIN').AsInteger)
          ;
   opensql(datatmp.qryTmp,strsql);
   kMessageDlg(GetMessage('frmLocationOut','064')+datatmp.qryTmp.fieldbyname('LocationBillNO').asString+','+chr(13)
              +GetMessage('frmLocationOut','067')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemain').AsFloat)+'!', mtInformation, [mbOK], 0);
   //'对应进仓的工作联系单号为'  '该单库存数量还剩'
end;

procedure TfrmLocationOut.ShipcusNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutItem.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutItem.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.mitTOConselClick(Sender: TObject);
var
   strjobnoin:string;
begin
   if not (data.qryOut.FieldByName('transordered').AsString='T') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单还未生成配送指令'
      else _strmessage:='该单还未生成配送指令';}
      KMessageDlg(GetMessage('frmLocationOut','068'),mtInformation,[mbyes],0);
      exit;
   end;
   strjobnoin:=data.qryOut.fieldbyname('jobno').AsString;
   {if _Language='CAPTIONC' then _strmessage:='该操作将撤消配送指令，您确定操作吗?'
   else _strmessage:='该操作将撤消配送指令，您确定操作吗?';}
   if (KmessageDlg(GetMessage('frmLocationOut','069'),mtInformation,[mbYes,mbNo],0)<>mryes) then
      Exit;
   _ADOConnection.StartTransaction;
   try
      OpenSql(dataTmp.qryTmp,' ksp_loctotsordercs '+strjobnoin);  //删除transorder各表,upd locationout
      _ADOConnection.Commit;
      KMessageDlg(dataTmp.qryTmp.fieldbyname('mesg').AsString,mtInformation,[mbyes],0);
      btnRefreshClick(mitTOConsel);
      exit;
   except
      if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      {if _Language='CAPTIONC' then _strmessage:='配送指令撤消失败,请与管理员联系!'
      else _strmessage:='配送指令撤消失败,请与管理员联系!' ;}
      KMessageDlg(GetMessage('frmLocationOut','070'),mtInformation,[mbyes],0);
      Exit;
   end;
end;

procedure TfrmLocationout.grdAutoCostBeforeInsert;
begin
   data.qryautocountcostout.FieldByName('sno').AsInteger :=-1;
   data.qryautocountcostout.FieldByName('jobno').asstring:=data.qryout.fieldbyname('jobno').asstring;
   data.qryautocountcostout.fieldByname('rateuomtype').AsString
                                           :=iif(strCostCountUOMType<>'',strCostCountUOMType,'piece');
   data.qryautocountcostout.fieldByname('countway').asString:='散装';
   data.qryautocountcostout.FieldByName('isincome').AsString :='T';
   data.qryautocountcostout.FieldByName('ismainrate').AsString :='F';
end;

procedure TfrmLocationOut.mitCostdelClick(Sender: TObject);
begin
   if data.qryautocountcostout.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdAutoCost.SetFocus;
      data.qryautocountcostout.Delete;
   end;
end;

procedure TfrmLocationOut.mitCostAddClick(Sender: TObject);
begin
   grdAutoCost.setfocus;
   data.qryautocountcostout.append;
   grdAutoCostBeforeInsert;
end;

procedure TfrmLocationOut.grdAutoCostEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryautocountcostout.IsEmpty=True) then
   begin
      mitCostAddClick(Sender);
   end;
end;

procedure TfrmLocationOut.grdAutoCostExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
         if DataLink.DataSet.State in [dsinsert,dsedit] then
         begin
            Datalink.DataSet.Post;
         end;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmLocationOut.grdAutoCostKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
            if (Key = VK_DELETE) and (ssCtrl in Shift) then
            begin
               if uppercase(Name)='GRDAUTOCOST' then
                 mitdelLocINItemClick(sender);
               key:=0;
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.grdCostCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostout.edit;
         data.qryautocountcostout.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostout.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationOut.loadgroupcusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationoutItem.FieldByName('loadgroupcusname').AsString
                                <>grdLocationOutItem.InplaceEditor.GetEditingText then
      begin
         {if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!'; }
         ErrorText:=GetMessage('frmLocationOut','071');
         Accept:=False;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationoutItem.edit;
      data.qryLocationoutItem.FieldByName('loadgroupcusid').AsString:='';
      data.qryLocationoutItem.FieldByName('loadgroupcusname').AsString:='';
   end;
end;

procedure TfrmLocationOut.forkgroupcusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationoutItem.FieldByName('forkgroupcusname').AsString
                                <>grdLocationOutItem.InplaceEditor.GetEditingText then
      begin
         {if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationOut','071');
         Accept:=False;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationoutItem.edit;
      data.qryLocationoutItem.FieldByName('forkgroupcusid').AsString:='';
      data.qryLocationoutItem.FieldByName('forkgroupcusname').AsString:='';
   end;
end;

procedure TfrmLocationOut.liftmachinecusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationoutItem.FieldByName('liftmachinecusname').AsString
                                <>grdLocationOutItem.InplaceEditor.GetEditingText then
      begin
         {if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationOut','071');
         Accept:=False;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationoutItem.edit;
      data.qryLocationoutItem.FieldByName('liftmachinecusid').AsString:='';
      data.qryLocationoutItem.FieldByName('liftmachinecusname').AsString:='';
   end;
end;

procedure TfrmLocationOut.N3Click(Sender: TObject);
var
   strjobnoin:string;
begin
   if not (data.qryOut.FieldByName('wareordered').AsString='T') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该单还未生成进仓指令'
      else _strmessage:='该单还未生成进仓指令';}
      KMessageDlg(GetMessage('frmLocationOut','072'),mtInformation,[mbyes],0);
      exit;
   end;
   strjobnoin:=data.qryOut.fieldbyname('jobno').AsString;
   {if _Language='CAPTIONC' then _strmessage:='该操作将撤消进仓指令，您确定操作吗?'
   else _strmessage:='该操作将撤消进仓指令，您确定操作吗?';}
   if (KmessageDlg(GetMessage('frmLocationOut','073'),mtInformation,[mbYes,mbNo],0)<>mryes) then
      Exit;
   OpenSql(dataTmp.qryTmp,' select jobno,checkname from wareorder(nolock) where jobnoin="'+data.qryOut.fieldbyname('jobno').AsString+'" ');
   if dataTmp.qryTmp.FieldByName('checkname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='对应进仓指令已审核，无法撤销！'
      else _strmessage:='对应进仓指令已审核，无法撤销！';}
      KMessageDlg(GetMessage('frmLocationOut','074'),mtInformation,[mbyes],0);
      Exit;
   end;
   strjobnoin:=dataTmp.qryTmp.FieldByName('jobno').AsString;
   _ADOConnection.StartTransaction;
   try
      ExecSql(dataTmp.qryTmp,' delete wareorder where jobno="'+strjobnoin+'" '
                            +' delete wareorderorisku where jobno="'+strjobnoin+'" '
                            +' delete wareordersku where jobno="'+strjobnoin+'" '
                            +' update locationout set wareordered="F" where jobno="'+data.qryOut.fieldbyname('jobno').AsString+'" '
                               );  //删除wareorderorder各表,upd locationout
      _ADOConnection.Commit;
      btnRefreshClick(mitTOConsel);
      KMessageDlg(_strsucceed,mtInformation,[mbyes],0);
      exit;
   except
      if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      {if _Language='CAPTIONC' then _strmessage:='进仓指令撤消失败,请与管理员联系!'
      else _strmessage:='进仓指令撤消失败,请与管理员联系!' ;}
      KMessageDlg(GetMessage('frmLocationOut','075'),mtInformation,[mbyes],0);
      Exit;
   end;
end;

procedure TfrmLocationOut.grdRateCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostout.edit;
         data.qryautocountcostout.FieldByName('ratecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostout.FieldByName('ratecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationOut.QuantityTaskCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'')  then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('Quantitytask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(QuantityTaskCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('Quantitytask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationOut.AreaTaskCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'')  then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('AreaTask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(AreaTaskCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('AreaTask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationOut.GrossWeightCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'')  then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('GrossWeightTask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(GrossWeightCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('GrossWeightTask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationOut.NetWeightTaskCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdCasing.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdCasing.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocoutItemCasing.edit;
      data.qryLocoutItemCasing.FieldByName('NetWeightTask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocoutItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(NetWeightTaskCasing.FieldName) then
      begin
         data.qryLocoutItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocoutItemCasing.FieldByName('NetWeightTask').AsFloat*
                      data.qryLocoutItemCasing.FieldByName('pricein').AsFloat;

      end;
      Accept:=True;
   end;
end;

procedure TfrmLocationOut.costuomtypecasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   strcostuom:string;
begin
   if DataState in Setdcs then
   begin
      strcostuom:=costuomtypecasing.ItemFields.Strings
                                  [costuomtypecasing.Items.indexof(grdcasing.InplaceEditor.GetEditingText)];
      data.qryLocoutItemCasing.Edit;
      data.qryLocoutItemCasing.FieldByName('costuomtype').AsString:=strcostuom;
      data.qryLocoutItemCasing.FieldByName('skucostin').asfloat:=
                         data.qryLocoutItemCasing.fieldbyname('pricein').asfloat*
                         data.qryLocoutItemCasing.fieldbyname(strcostuom).AsFloat;
   end;
end;

procedure TfrmLocationOut.grdcasingDblClick(Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
begin
   if UpperCase(grdcasing.Columns[grdcasing.GetFocusedAbsoluteIndex(grdcasing.FocusedColumn)].FieldName)='VOLUMETASK'
   then
   begin
      jsPiece   :=data.qryLocOutItemCasing.FieldByName('piecetask').AsFloat;
      jsHeight  :=data.qryLocOutItemCasing.FieldByName('Height').AsFloat;
      jsWidth   :=data.qryLocOutItemCasing.FieldByName('Width').AsFloat;
      jsDepth   :=data.qryLocOutItemCasing.FieldByName('Depth').AsFloat;
      jsVolume  :=data.qryLocOutItemCasing.FieldByName('volumetask').AsFloat;
      jsVolueUOM:=data.qryLocOutItemCasing.FieldByName('VolumeUOM').AsString;
     while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
     (DataState in Setdcs) do
     begin
        data.qryLocOutItemCasing.Edit;
        data.qryLocOutItemCasing.FieldByName('Height').AsFloat    :=jsHeight;
        data.qryLocOutItemCasing.FieldByName('Width').AsFloat     :=jsWidth;
        data.qryLocOutItemCasing.FieldByName('Depth').AsFloat     :=jsDepth;
        data.qryLocOutItemCasing.FieldByName('volumetask').AsFloat    :=jsVolume;
        data.qryLocOutItemCasing.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
        exit;
     end;
   end;
end;

procedure TfrmLocationOut.casing1taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qrylocationoutItem.FieldByName('casing1task').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qrylocationoutItem.fieldbyname('costuomtype').AsString)=UpperCase(casing1taskItem.FieldName) then
      begin

         data.qrylocationoutItem.FieldByName('SkuCostIn').AsFloat:= data.qrylocationoutItem.FieldByName('casing1task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('priceIn').AsFloat;
         data.qrylocationoutItem.FieldByName('SkuCost').AsFloat:= data.qrylocationoutItem.FieldByName('casing1task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.casing2taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qrylocationoutItem.FieldByName('casing2task').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qrylocationoutItem.fieldbyname('costuomtype').AsString)=UpperCase(casing2taskItem.FieldName) then
      begin

         data.qrylocationoutItem.FieldByName('SkuCostIn').AsFloat:= data.qrylocationoutItem.FieldByName('casing2task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('priceIn').AsFloat;
         data.qrylocationoutItem.FieldByName('SkuCost').AsFloat:= data.qrylocationoutItem.FieldByName('casing2task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.casing3taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qrylocationoutItem.FieldByName('casing3task').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qrylocationoutItem.fieldbyname('costuomtype').AsString)=UpperCase(casing3taskItem.FieldName) then
      begin

         data.qrylocationoutItem.FieldByName('SkuCostIn').AsFloat:= data.qrylocationoutItem.FieldByName('casing3task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('priceIn').AsFloat;
         data.qrylocationoutItem.FieldByName('SkuCost').AsFloat:= data.qrylocationoutItem.FieldByName('casing3task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.casing4taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qrylocationoutItem.FieldByName('casing4task').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qrylocationoutItem.fieldbyname('costuomtype').AsString)=UpperCase(casing4taskItem.FieldName) then
      begin

         data.qrylocationoutItem.FieldByName('SkuCostIn').AsFloat:= data.qrylocationoutItem.FieldByName('casing4task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('priceIn').AsFloat;
         data.qrylocationoutItem.FieldByName('SkuCost').AsFloat:= data.qrylocationoutItem.FieldByName('casing4task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationOut.casing5taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qrylocationoutItem.Edit;
      data.qrylocationoutItem.FieldByName('casing5task').AsFloat:=StrToFloat(grdLocationOutItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qrylocationoutItem.fieldbyname('costuomtype').AsString)=UpperCase(casing5taskItem.FieldName) then
      begin

         data.qrylocationoutItem.FieldByName('SkuCostIn').AsFloat:= data.qrylocationoutItem.FieldByName('casing5task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('priceIn').AsFloat;
         data.qrylocationoutItem.FieldByName('SkuCost').AsFloat:= data.qrylocationoutItem.FieldByName('casing5task').AsFloat*
                                                                         data.qrylocationoutItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationout.checknull;
   procedure setvalue(pstrfield:string);
   begin
      if data.qryLocationout.FieldByName(pstrfield).AsString='' then
      begin
         data.qryLocationout.FieldByName(pstrfield).AsString:='F';
      end;
   end;
begin
   setvalue('isbond');
   setvalue('countcontcost');
   setvalue('countrent');
   setvalue('tageach');
   setvalue('contwithloca');
   setvalue('lottracked');
   setvalue('countwith1');
end;

procedure TfrmLocationOut.btnCostRateClick(Sender: TObject);
begin
   WorkWareRateView('OUT',data.qryOut.fieldbyname('jobno').AsString);
end;

procedure TfrmLocationOut.mitAddAutoCostClick(Sender: TObject);
begin
{   if data.qryOut.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationOut','079'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能用该模式新增计费条目！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qrylocationout.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能新增条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   pGetAutoCost(data.qryOut.FieldByName('jobno').AsString,'0','仓储');
   data.qryautocountcostOut.Close;
   data.qryautocountcostOut.Open;
end;

procedure TfrmLocationOut.mitUpdAutoCostClick(Sender: TObject);
begin
{   if data.qryOut.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationOut','076'), mtInformation,[mbOk],0); //'该资料不是您输入的，不能修改！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qrylocationout.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能修改条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   pGetAutoCost(data.qryautocountcostOut.FieldByName('jobno').AsString,data.qryautocountcostOut.FieldByName('sno').AsString,'仓储');
   data.qryautocountcostOut.Close;
   data.qryautocountcostOut.Open;
end;

procedure TfrmLocationOut.mitDelAutoCostClick(Sender: TObject);
begin
{   if data.qryout.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationOut','077'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能删除！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qrylocationout.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能删除条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   if KmessageDlg(_strdel, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
      ExecSql(dataTmp.qryTmp,' delete from autocountcost  '+
                             ' where Jobno="'+data.qryautocountcostout.FieldByName('Jobno').AsString+'"  '+
                             '   and sno="'+data.qryautocountcostout.FieldByName('Sno').AsString+'" ');
      data.qryautocountcostout.Close;
      data.qryautocountcostout.Open;
   end;
end;

procedure TfrmLocationOut.grdAutoCostEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      with grdAutoCost do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COUNTWAY') then
         begin
            if data.qryautocountcostout.FieldByName('ismainrate').asstring='T' then
            begin
               if grdCountway.Items.IndexOf('散装')<>-1 then
               grdCountway.Items.Delete(grdCountway.Items.IndexOf('散装'));
            end else
            begin
               if grdCountway.Items.IndexOf('散装')=-1 then
               grdCountway.Items.Insert(1,'散装');
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationOut.grdIsMainRateCostChange(Sender: TObject);
begin
   data.qryautocountcostout.edit;
   data.qryautocountcostout.FieldByName('ismainrate').asstring:=IIF(data.qryautocountcostout.FieldByName('ismainrate').asstring='T','F','T');
   if data.qryautocountcostout.FieldByName('ismainrate').asstring='F'then
   begin
      if grdCountway.Items.IndexOf('散装')=-1 then
//      Countway.Items.add('散装');
      grdCountway.Items.Insert(1,'散装');
   end else
   begin
      data.qryautocountcostout.FieldByName('countway').asstring:='柜装';
      if grdCountway.Items.IndexOf('散装')<>-1 then
      grdCountway.Items.Delete(grdCountway.Items.IndexOf('散装'));
   end;
end;

procedure TfrmLocationOut.carriageitemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationoutItem.Edit;
      strcostuom:=data.qrylocationoutItem.fieldbyname('costuomtype').AsString;
      data.qryLocationoutItem.FieldByName('carriage').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         data.qryLocationoutItem.FieldByName('carriagetotal').AsFloat:=data.qryLocationoutItem.FieldByName('carriage').AsFloat
      else
         data.qryLocationoutItem.FieldByName('carriagetotal').AsFloat:=
                                     data.qryLocationoutItem.FieldByName(strcostuom+'task').AsFloat*
                                     data.qryLocationoutItem.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmLocationOut.insuranceItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationoutItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationoutItem.Edit;
      strcostuom:=data.qrylocationoutItem.fieldbyname('costuomtype').AsString;
      data.qryLocationoutItem.FieldByName('insurance').AsFloat:=StrToFloat(grdLocationoutItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO'then
         data.qryLocationoutItem.FieldByName('insurancetotal').AsFloat:=data.qryLocationoutItem.FieldByName('insurance').AsFloat
      else
         data.qryLocationoutItem.FieldByName('insurancetotal').AsFloat:=
                                     data.qryLocationoutItem.FieldByName(strcostuom+'task').AsFloat*
                                     data.qryLocationoutItem.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmLocationOut.btnAppendClick(Sender: TObject);
begin
   if data.qryOut.FieldByName('operationname').AsString='' then
   begin
      KMessageDlg(GetMessage('frmLocationOut','000'),mtConfirmation,[mbok],0);
      Exit;
   end;
   btnEditClick(btnAppend);
end;

procedure TfrmLocationOut.mitoutwareClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstpara.Add('Locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstPara.Add('iusername='+data.qrylocationout.fieldbyname('iusername').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('costcusname='+data.qrylocationout.FieldByname('costcusname').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstPara.Add('data='+datetostr(date));
   lstpara.Add('kdr='+_loginname);
   lstpara.Add('carbrand='+data.qrylocationout.FieldByname('carbrand').AsString);
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select detail.jobno,detail.Locationbillno,mainorder=item.mainorderin, '+chr(13)+chr(10)
                         +'       detail.ShippercusName,detail.skuname,'+chr(13)+chr(10)
                         +'       year=substring(Convert(char(8),detail.OperationDate,112),1,4),'+chr(13)+chr(10)
                         +'       month=substring(Convert(char(8),detail.OperationDate,112),5,2),'+chr(13)+chr(10)
                         +'       day=substring(Convert(char(8),detail.OperationDate,112),7,2),'+chr(13)+chr(10)
                         +'       Quantity=item.Quantitytask,                               '+chr(13)+chr(10)
                         +'       grossweight=item.grossweighttask,                             '+chr(13)+chr(10)
                         +'       netweight=item.netweighttask,                                 '+chr(13)+chr(10)
                         +'       lotcode=item.lotcode,                                         '+chr(13)+chr(10)
                         +'       volume=item.volumetask,                                       '+chr(13)+chr(10)
                         +'       QuantityUOM=item.QuantityUOM                                   '+chr(13)+chr(10)
                         +'  from locationoutdetail detail(nolock),locationoutitem item(nolock)  '+chr(13)+chr(10)
                         +' where detail.jobno=item.jobno   '+chr(13)+chr(10)
                         +'   and detail.sno=item.sno      '+chr(13)+chr(10)
                         +'   and detail.JOBNO="'+data.qrylocationout.FieldByname('JOBNO').AsString+'" '+chr(13)+chr(10)
                         );

   Worklinprint('900012','old','出%货%单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.mitstockupClick(Sender: TObject);
begin
   workstockup;
end;

procedure TfrmLocationOut.tallycusiditemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('M','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrylocationoutItem.Edit;
         data.qrylocationoutItem.FieldByName('tallycusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrylocationoutItem.FieldByName('tallycusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.tallycusiditemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qrylocationoutItem.FieldByName('tallycusname').AsString
                                <>grdLocationOutItem.InplaceEditor.GetEditingText then
      begin
        { if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationIN','064');
         Accept:=False;
         exit;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationOutItem.InplaceEditor.GetEditingText='') then
   begin
      data.qrylocationoutItem.edit;
      data.qrylocationoutItem.FieldByName('tallycusid').AsString:='';
      data.qrylocationoutItem.FieldByName('tallycusname').AsString:='';
   end;
end;

procedure TfrmLocationOut.mitfhzxdClick(Sender: TObject);
var
   KF1Book:TKF1book;
   KF1BookSheet:TKF1Book;
   i:Integer;
   qryselect:TKADOQuery;
   procedure F1BookAssign(SorcF1Book,DescF1Book:TKF1Book);
   var
       Scale:smallint;
       Hpage,vpage:integer;
       fittopage:WordBool;
   begin
      DescF1Book.F1Book.PrintTopMargin:=SorcF1Book.F1Book.PrintTopMargin;
      DescF1Book.F1Book.PrintBottomMargin:=SorcF1Book.F1Book.PrintBottomMargin;
      DescF1Book.F1Book.PrintLeftMargin:=SorcF1Book.F1Book.PrintLeftMargin;
      DescF1Book.F1Book.PrintRightMargin:=SorcF1Book.F1Book.PrintRightMargin;
      DescF1Book.F1Book.PrintLeftToRight:=SorcF1Book.F1Book.PrintLeftToRight;
      DescF1Book.F1Book.PrintHCenter:=SorcF1Book.F1Book.PrintHCenter;
      DescF1Book.F1Book.PrintVCenter:=SorcF1Book.F1Book.PrintVCenter;
      DescF1Book.F1Book.PrintGridLines:=SorcF1Book.F1Book.PrintGridLines;
      DescF1Book.F1Book.PrintNoColor:=SorcF1Book.F1Book.PrintNoColor;
      DescF1Book.F1Book.PrintColHeading:=SorcF1Book.F1Book.PrintColHeading;
      DescF1Book.F1Book.PrintRowHeading:=SorcF1Book.F1Book.PrintRowHeading;

      SorcF1Book.F1Book.GetPrintScale(Scale, FitToPage, VPage, HPage);
      DescF1Book.F1Book.SetPrintScale(Scale, FitToPage, VPage, HPage);

      DescF1Book.F1Book.PrintHeader:=SorcF1Book.F1Book.PrintHeader;
      DescF1Book.F1Book.PrintFooter:=SorcF1Book.F1Book.PrintFooter;
   end;
   procedure withF1bookdo(pF1book:TKF1book;pconno:string);
   begin
      with pF1book do
      begin
         OpenSql(dataTmp.qryTmp,' ksp_fhzxd "'+data.qryout.fieldbyname('jobno').AsString+'","'+pconno+'","C"');
         ShowPrintDlg:=False;
         BbHandle:=bbNone;
         qryMain:=dataTmp.qryTmp;
         qryRow:=nil;
         qryCol:=nil;
         _BBSave:=false;
         paras.Values['conno']:=pconno;
         paras.Values['date']:=DateToStr(Now);
         paras.Values['shippercusname']:=data.qryout.fieldbyname('cusname').AsString;
         Bbdm:='900023';
         CreateReport;
      end;
   end;

   procedure InsertSheetsPI(pKF1Book:TKF1Book;intIndex:integer;pstrbbdm,pStrbbmc:String;
                            pconno:string);
   begin
      try
         withF1Bookdo(KF1BookSheet,pconno);
         with KF1BookSheet do
         begin
            //复制整张报表
//            F1book.SetSelection(1,1,24,F1Book.MaxCol);
            F1book.SetSelection(1,1,F1Book.LastRow,F1Book.MaxCol);
            F1Book.EditCopy;
            pKF1Book.F1Book.Sheet:=1;
            F1BookAssign(KF1BookSheet,pKF1Book);
            pKF1Book.F1Book.Row:=pKF1Book.F1Book.LastRow+2;
//            pKF1Book.F1Book.Row:=pKF1Book.F1Book.LastRow+;
            pKF1Book.F1Book.Col:=1;
            pKF1Book.F1Book.EditPaste;
//            pKF1Book.F1Book.AddPageBreak;//不分页打印
//            pKF1Book.F1Book.DeleteRange(1,pKF1Book.F1Book.LastCol+1,pKF1Book.F1Book.LastRow,pKF1Book.F1Book.MaxCol,F1ShiftCols);
//            pKF1Book.F1Book.DeleteRange(pKF1Book.F1Book.LastRow+1,1,pKF1Book.F1Book.MaxRow,pKF1Book.F1Book.MaxCol,F1ShiftRows);
         end;
      finally
         KF1BookSheet.F1Book.ClearClipboard;
      end;
   end;
begin
   qryselect:=TKADOQuery.Create(Application);
   qryselect.Connection:=_ADOConnection;
   strSql:=' ksp_fhzxd @jobno="'+data.qryout.fieldbyname('jobno').AsString+'",'
          +'           @conno="",@type="P" ';

   try
      KF1Book:=TKF1Book.Create;
      KF1BookSheet:=TKF1Book.Create;
      OpenSql(qryselect,strSql);
      i:=0;
      with qryselect do
      while not Eof do
      begin
         if i=0 then
         begin
            withF1bookdo(KF1Book,fieldbyname('conno').AsString);
         inc(i);
         end else
         begin
            KF1BookSheet.Bbdm:='900023';
            KF1BookSheet.LoadfromDb;
            InsertSheetsPI(KF1Book,i,'900023','发货装箱单',fieldbyname('conno').AsString);
         end;
         next;
      end;
      WorkBbShow(KF1Book);
   except
      KF1Book.Destroy;
      KF1BookSheet.Destroy;
   end;
   FreeAndNil(qryselect);
end;


procedure TfrmLocationOut.OPERATIONDATEDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   operationdate:TDateTime;
begin
   if (DataState in Setdcs) and (grdLocationoutDetail.InplaceEditor.GetEditingText<>'')then
   begin
      operationdate:=strtodate(Copy(grdLocationoutDetail.InplaceEditor.GetEditingText,1,10));
      if operationdate<StrToDate(dtdTaskDate.Text) then
      begin
         ErrorText:=GetMessage('frmlocationout','068');
         Accept:=False;
         exit;
      end;
      data.qrylocationoutdetail.Edit;
      data.qrylocationoutdetail.FieldByName('operationdate').AsString:=grdLocationoutDetail.InplaceEditor.GetEditingText;
      if operationdate<StrToDate(dtdOperationDate.Text) then
      begin
         data.qrylocationout.Edit;
         data.qrylocationout.FieldByName('operationdate').AsString:=grdLocationoutDetail.InplaceEditor.GetEditingText;
      end;
   end;
end;

procedure tfrmlocationout.GetCusCnfg;
var
   qryselect:TKADOQuery;
begin
   if DataState=stedit then
   begin
      OpenSql(datatmp.qryTmp,'select RateName,CountComplete '
                            +'  from cost(nolock) '
                            +' where jobno="'+data.qryLocationOut.FieldByName('Jobno').AsString+'"' );
      if trim(datatmp.qryTmp.FieldByName('RateName').AsString)<>'' then
      begin
        {if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
        else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!';}
        kMessageDlg(GetMessage('frmLocationOut','015'), mtWarning, [mbOK], 0);
        exit;
      end;
   end;
   qrySelect:=pGetCuscnfgSelect( edtCostCus.textfield,edtCostCus.text,'仓储');
   if (qrySelect.FieldByName('jobno').AsString<>'NO') and not qryselect.isempty then
   begin
      data.qryLocationOut.FieldByName('skucostclasscd').Asstring:=qrySelect.FieldByName('skucostclasscd').Asstring;
      data.qryLocationOut.fieldbyname('loadtype').AsString:=qrySelect.fieldbyname('loadtype').AsString;
      data.qryLocationOut.FieldByName('Isbond').Asstring:=qrySelect.FieldByName('Isbond').Asstring;
//      if data.qryLocationOut.FieldByName('iUserid').Asstring='' then
//      begin
      data.qryLocationOut.FieldByName('iUserid').Asstring   :=qrySelect.FieldByName('Userid').Asstring;
      data.qryLocationOut.FieldByName('iusername').Asstring :=qrySelect.FieldByName('username').Asstring;
//      end;
//add by cyh 2008.04.18
      data.qryLocationOut.FieldByName('countrentout').Asstring       :=qrySelect.FieldByName('countrentout').Asstring;
      data.qryLocationOut.FieldByName('LOTTRACKED').Asstring        :=qrySelect.FieldByName('LOTTRACKED').Asstring;
      data.qryLocationOut.FieldByName('CONTWITHLOCA').Asstring      :=qrySelect.FieldByName('CONTWITHLOCA').Asstring;
      data.qryLocationOut.FieldByName('COUNTCONTCOST').Asstring     :=qrySelect.FieldByName('COUNTCONTCOST').Asstring;
      data.qryLocationOut.FieldByName('COUNTRENT').Asstring         :=qrySelect.FieldByName('COUNTRENT').Asstring;
      data.qryLocationOut.FieldByName('WareRentCountType').Asstring   :=qrySelect.FieldByName('RentCountType').Asstring;
      data.qryLocationOut.FieldByName('WareRentCountTypeOut').Asstring   :=qrySelect.FieldByName('RentCountTypeOut').Asstring;
      data.qryLocationOut.FieldByName('TagEach').Asstring             :=qrySelect.FieldByName('TagEach').Asstring;
      data.qryLocationOut.FieldByName('LOADTYPE').Asstring            :=qrySelect.FieldByName('LOADTYPE').Asstring;
      data.qryLocationOut.FieldByName('loadcosttype').Asstring        :=qrySelect.FieldByName('loadcosttype').Asstring;
      strCostCountUOMType:=qrySelect.FieldByName('CostCountUOMType').Asstring;
      strRentCountUOMType:=qrySelect.FieldByName('RentCountUOMType').Asstring;
      strRentCountUOMTypeout:=qrySelect.FieldByName('RentCountUOMTypeout').Asstring;
      //lzw 2008.01.09
      data.qryLocationOut.FieldByName('opid').Asstring        :=qrySelect.FieldByName('opid').Asstring;
      data.qryLocationOut.FieldByName('opname').Asstring        :=qrySelect.FieldByName('opname').Asstring;
      copycusID:=iif(qrySelect.FieldByName('cusid').Asstring<>'',
                     qrySelect.FieldByName('cusid').Asstring,
                     data.qryLocationOut.FieldByName('costcusid').Asstring);
      copycusName :=iif(qrySelect.FieldByName('cusname').Asstring<>'',
                        qrySelect.FieldByName('cusname').Asstring,
                        data.qryLocationOut.FieldByName('costcusname').Asstring);
      copyShippercusID   :=iif(qrySelect.FieldByName('shippercusid').Asstring<>'',
                               qrySelect.FieldByName('shippercusid').Asstring,
                               data.qryLocationOut.FieldByName('costcusid').Asstring);
      copyShippercusName :=iif(qrySelect.FieldByName('shippercusname').Asstring<>'',
                               qrySelect.FieldByName('shippercusname').Asstring,
                               data.qryLocationOut.FieldByName('costcusname').Asstring);
      copyloadgroupcusid     :=qrySelect.FieldByName('loadgroupcusid').Asstring;
      copyloadgroupcusname   :=qrySelect.FieldByName('loadgroupcusname').Asstring;
      copyforkgroupcusid     :=qrySelect.FieldByName('forkgroupcusid').Asstring;
      copyforkgroupcusname   :=qrySelect.FieldByName('forkgroupcusname').Asstring;
      copyliftmachinecusid   :=qrySelect.FieldByName('liftmachinecusid').Asstring;
      copyliftmachinecusname :=qrySelect.FieldByName('liftmachinecusname').Asstring;

      // Added by wql 2005-12-6 20:10:10
      copySkuwtv             :=qrySelect.FieldByName('skuwtve').AsFloat;
      data.qryLocationoutItem.DisableControls;
      with data.qryLocationoutItem do
      begin
         First;
         while not Eof do
         begin
            Edit;
            fieldByname('CostCountUOMType').AsString  :=strCostCountUOMType;
            next;
         end;
         First;
      end;
      data.qryLocationoutItem.EnableControls;

      if not data.qryautocountcostout.IsEmpty then
      begin
         {if _Language='CAPTIONC' then
            _strmessage:='该操作将覆盖该笔资料的原有计算条目，您确定吗?'
         else
            _strmessage:='该操作将覆盖该笔资料的原有计算条目，您确定吗?';}
         if KmessageDlg(GetMessage('TW','003'),mtConfirmation,[mbYes,mbNo],0)<>mrYes then
         exit;
      end;
      data.qryautocountcostout.DisableControls;
      data.qryautocountcostout.First;
      while not data.qryautocountcostout.Eof do
      begin
         data.qryautocountcostout.Delete;
      end;
      OpenSql(dataTmp.qryTmp,' select cusid ,cpid,costcd,ismainrate=isnull(ismainrate,"F"),'
                            +'        isincome=isnull(isincome,"F"),ratecus,costcus,costcountuomtype,countway, '
                            +'        cnfgcostcusid=isnull(cnfgcostcusid,""),cnfgcostcusname,cnfgratecusid=isnull(cnfgratecusid,""),cnfgratecusname   '
                            +'   from cuscnfgitem (nolock) '
                            +'  where jobno="'+qrySelect.fieldbyname('jobno').AsString+'"'
                            +'    and cpid="出仓" '
             );
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         data.qryautocountcostout.Append;
         if grdAutoCost.FocusedNode=nil then
            maxAutocountcost:=maxAutocountcost+1;
         data.qryautocountcostout.FieldByName('sno').AsInteger:=maxAutocountcost;
         data.qryautocountcostout.FieldByName('costcd').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcd').AsString;
         data.qryautocountcostout.FieldByName('ismainrate').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ismainrate').AsString;
         data.qryautocountcostout.FieldByName('isincome').AsString
                                       :=dataTmp.qryTmp.fieldbyname('isincome').AsString;
         data.qryautocountcostout.FieldByName('ratecus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ratecus').AsString;
         data.qryautocountcostout.FieldByName('costcus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcus').AsString;
         data.qryautocountcostout.FieldByName('rateuomtype').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcountuomtype').AsString;
         data.qryautocountcostout.FieldByName('countway').AsString
                                       :=dataTmp.qryTmp.fieldbyname('countway').AsString;
         //data.qryautocountcostout.FieldByName('jobno').AsString:=data.qryout.fieldbyname('jobno').asstring;
         data.qryautocountcostout.FieldByName('jobno').AsString:=data.qrylocationout.fieldbyname('jobno').asstring;
//dwq0119  --dwq0601修正
         if dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString<>'' then
         begin
            data.qryautocountcostout.FieldByName('costcusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString;
            data.qryautocountcostout.FieldByName('costcusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusname').AsString;
         end;
         if dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString<>'' then
         begin
            data.qryautocountcostout.FieldByName('ratecusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString;
            data.qryautocountcostout.FieldByName('ratecusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusname').AsString;
         end;
         // Added by wql 2005-12-6 20:11:15
         if data.qryautocountcostout.FieldByName('countway').AsString='轻重货' then
            data.qryautocountcostout.FieldByName('skuwtve').AsFloat:=copySkuwtv;
         data.qryautocountcostout.Post;
         dataTmp.qryTmp.next;
      end;
      data.qryautocountcostout.EnableControls;
   end;
   FreeAndNil(qryselect);
end;

procedure TfrmLocationOut.N8Click(Sender: TObject);
begin
   if data.qryout.fieldbyname('jobno').asstring<>'' then
   begin
      ExecSql(dataTmp.qryTmp,'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'  where id=object_id("tempdb..#lskAutoCost") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskAutoCost '+chr(13)+chr(10)
             +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'  where id=object_id("tempdb..#lskAutoCostGet") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskAutoCostGet '+chr(13)+chr(10)
             +' select * into #lskAutoCost from autocountcost (nolock) where jobno="'+data.qryout.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
             +' select * into #lskAutoCostGet from #lskAutoCost where 1=2  ');
      blnCopyAutoCost:=True;
      kMessageDlg('已复制计费条目！', mtInformation, [mbOK], 0); //nomsg
   end;
end;

procedure TfrmLocationOut.N9Click(Sender: TObject);
var
   i:Integer;
begin
   if not blnCopyAutoCost then
   begin
      kMessageDlg('未复制计费条目,无法粘贴！', mtInformation, [mbOK], 0); //nomsg
      Exit;
   end;
   if KmessageDlg('该操作将把选定资料的计费条目设置为您所复制的计费条目,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdLocationout.SelectedCount-1 Downto 0 do
      begin
         data.qryout.GotoBookmark(Pointer(grdLocationout.SelectedRows[i]));
         ExecSQl(dataTmp.qryTmp,'  insert into #lskAutoCostGet     '+chr(13)+chr(10)
                               +'    (jobno,sno,costcd,isincome,ismainrate,costcusid, '+chr(13)+chr(10)
                               +'    costcusname,ratecusid,ratecusname,ratecus,costcus, '+chr(13)+chr(10)
                               +'    rateuomtype,countway)  '+chr(13)+chr(10)
                               +'  select jobno="'+data.qryout.fieldbyname('jobno').asstring+'", '+chr(13)+chr(10)
                               +'         sno,costcd,isincome,ismainrate,costcusid, '+chr(13)+chr(10)
                               +'         costcusname,ratecusid,ratecusname,ratecus,costcus, '+chr(13)+chr(10)
                               +'         rateuomtype,countway  '+chr(13)+chr(10)
                               +'    from #lskAutoCost  ');
      end;
      _ADOConnection.startTransaction;
      try
         ExecSql(dataTmp.qryTmp,' delete autocountcost where jobno in (select distinct jobno from #lskAutoCostGet) ');
         ExecSql(dataTmp.qryTmp,' insert into autocountcost select * from #lskAutoCostGet    ');
         _ADOConnection.Commit;
         kMessageDlg('粘贴完毕!', mtInformation, [mbOK], 0); //nomsg
      except
         try
            if _ADOConnection.InTransaction then _ADOConnection.RollBack;
         except
            kMessageDlg('粘贴失败!', mtInformation, [mbOK], 0); //nomsg
         end;
      end;
   end;
end;

procedure TfrmLocationOut.grdLocationOutDetailChangeNodeEx(
  Sender: TObject);
begin
   data.qryLocOutSkudetail.Filtered:=false;
   if data.qrylocationoutdetail.fieldbyname('ldsno').AsString<>'' then
      data.qryLocOutSkudetail.filter:='ldsno='+data.qrylocationoutdetail.fieldbyname('ldsno').AsString+' and sno='+data.qryLocationOutDetail.fieldbyname('sno').AsString
   else
      data.qryLocOutSkudetail.filter:='ldsno=-1';
   data.qryLocOutSkudetail.Filtered:=true;
   //lzw20100728
   {if DataState in setdcs then
   begin
      //...处理状态
      if ActiveControl <> grdLocationOutDetail then Exit;
      //...
      if TdxDBGrid(Sender).DataSource.DataSet.State = dsBrowse then
      begin
         TdxDBGrid(Sender).DataSource.DataSet.Edit;
         TdxDBGrid(Sender).ShowEditor;
      end;
   end;}   
end;

procedure TfrmLocationOut.LocNameDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if data.qrylocationoutdetail.FieldByName('locid').AsString<>'' then
   begin
      data.qryLocoutSkuDetail.Active:=True;
   end;
end;

procedure TfrmLocationOut.mitfzckdClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      //OpenSql(dataTmp.qryTmp,'ksp_fzckdout @jobno="'+data.qryout.fieldbyname('jobno').AsString+'" ');
      OpenSql(dataTmp.qryTmp,'ksp_fzckdout @jobno="",@fillter='' jobno in("'+data.qrylocationout.fieldbyname('jobno').AsString+'") '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900036';
         paras.Values['shippercusname']:=data.qrylocationout.fieldbyname('shipcusname').AsString;
         paras.Values['date']:=DateToStr(data.qrylocationout.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
    finally
      KF1Book.Destroy;
    end;
end;

procedure TfrmLocationOut.mitCheckManyClick(Sender: TObject);
var
   i,j,k:Integer;  //i循环变量,j审核记录总数,k不能审核记录数
begin
    if getSysdata('checkid')='T' then
    begin
      if data.qryOut.FieldByName('CreateName').AsString=_Userid then
      begin
         KMessageDlg('自己制的单子不能自己审核！',mtWarning,[mbOk],0);
         Exit;
      end;
    end;
       //lzw20110615
    if _strsyscus='XSWL' then
    begin
       if data.qryOut.FieldByName('taskcheckname').AsString='' then
       begin
          kMessageDlg('该单未复核,不能进行审核', mtWarning, [mbOK], 0);
          Exit;

       end;
    end;

   j:=grdLocationOut.SelectedCount;
   if j=1 then
   begin
      mitCheckOneClick(Sender);
      Exit;
   end;
   k:=0;
   {if _Language='CAPTIONC' then _strmessage:='该操作将审核选中的所有资料，您确定操作吗?'
   else _strmessage:='该操作将审核选中的所有资料，您确定操作吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','040'),mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   for i:=j-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if (data.qryOut.FieldByName('checkname').AsString='') and
         (data.qryout.FieldByName('taskiscomplete').AsString<>'T') then
         Inc(k)
      else if (data.qryOut.FieldByName('checkname').AsString='') and
            (data.qryout.FieldByName('taskiscomplete').AsString='T') then
         execSql(datatmp.qryTmp,'update LocationOut '
                      +'   set checkname="'+_loginname+'",'
                      +'       checkdate=getdate() '
                      +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
   end;
   btnRefreshClick(btnRefresh);
   if k<>0 then
      Kmessagedlg(IntToStr(k)+'/'+inttostr(j)+GetMessage('frmLocationOut','043'),mtInformation,[mbOk],0)
      //'43笔任务未完成不能审核！'
   else
      Kmessagedlg(GetMessage('frmLocationOut','041'),mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.mitCancelManyClick(Sender: TObject);
var
   i,j,k:Integer;     //i循环变量,j记录总数,k不能取消审核记录数
begin
   j:=grdLocationOut.SelectedCount;
   if j=1 then
   begin
      mitCancelOneClick(Sender);
      Exit;
   end;
   k:=0;
   {if _Language='CAPTIONC' then _strmessage:='该操作将选中的所有资料取消审核，确定操作吗?'
   else _strmessage:='该操作将选中的所有资料取消审核，确定操作吗?';}
   if KmessageDlg(GetMessage('frmLocationOut','044'),mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   for i:=j-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if (data.qryOut.FieldByName('costcheckname').AsString<>'')
         or (data.qryOut.FieldByName('countname').AsString<>'')
         or ((_DB_CheckSelf='T') and (_LoginId<>'SYSTEM') and
            (_loginName<>data.qryOut.FieldByName('checkname').AsString)) then
         Inc(k)
      else if data.qryOut.FieldByName('checkname').AsString<>'' then
         execSql(datatmp.qryTmp,'update Locationout '+chr(13)+chr(10)
                     +'   set checkname="",'+chr(13)+chr(10)
                     +'       checkdate=null'+chr(13)+chr(10)
                     +'  from locationout '+chr(13)+chr(10)
                     +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
   end;
   btnRefreshClick(btnRefresh);
   if k<>0 then
      Kmessagedlg(IntToStr(k)+'/'+inttostr(j)+GetMessage('frmLocationOut','046'),mtInformation,[mbOk],0)
      //'46笔资料已财务审核或已计费或是他人审核的数据未取消审核！'
   else
      Kmessagedlg(GetMessage('frmLocationOut','045'),mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.grdCountwayValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  // Added by wql 2005-12-6 20:26:34
  if DataState in Setdcs then
  begin
    if grdAutoCost.InplaceEditor.GetEditingText='轻重货' then
    begin
       data.qryautocountcostout.Edit;
       data.qryautocountcostout.FieldByName('skuwtve').AsFloat:=copySkuwtv;
       data.qryautocountcostout.FieldByName('countway').asstring:=grdAutoCost.InplaceEditor.GetEditingText;
    end;
    Accept:=True;
  end;
end;

procedure TfrmLocationOut.CountSKUPiece(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   strtask:string;
begin
   if not _piececal then Exit;
   strtask:=pistask;
   with pqrySKU do
   begin
{      if (FieldByName('Piece'+strtask).AsFloat<>0) then
      begin
         if (FieldByName('Quantity'+strtask).AsFloat<>0) then
         begin
            if Kmessagedlg('你确定要更改商品数量吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
            begin
              FieldByName('Quantity'+strtask).AsFloat
                    :=FieldByName('Piece'+strtask).AsFloat*FieldByName('PiecePro').AsFloat;
            end;
         end else
         begin
            FieldByName('Quantity'+strtask).AsFloat
                 :=FieldByName('Piece'+strtask).AsFloat*FieldByName('PiecePro').AsFloat;
         end;
         FieldByName('Quantity'+strtask).AsFloat
              :=FieldByName('Piece'+strtask).AsFloat*FieldByName('PiecePro').AsFloat;
      end else}
      if (OldValue<>0) and blnBLJS then
      begin
//         if Kmessagedlg('你确定要更改商品数量吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
//         begin
           FieldByName('Quantity'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                               *FieldByName('Quantity'+strtask).AsFloat
                                               /oldValue;
//         end;
      end;

   //体积
      if (OldValue<>0) and blnBLJS then
         FieldByName('Volume'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                              *FieldByName('Volume'+strtask).AsFloat
                                              /oldValue;
   //面积
     if (OldValue<>0) and blnBLJS then
     FieldByName('Area'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                          *FieldByName('Area'+strtask).AsFloat
                                          /oldValue;
   //净重
     if (OldValue<>0) and blnBLJS then
     FieldByName('NetWeight'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                          *FieldByName('NetWeight'+strtask).AsFloat
                                          /oldValue;
   //毛重
     if (OldValue<>0) and blnBLJS then
     FieldByName('GrossWeight'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                          *FieldByName('GrossWeight'+strtask).AsFloat
                                          /oldValue;
   //外包一
     if (OldValue<>0) and blnBLJS then
     FieldByName('casing1'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                          *FieldByName('casing1'+strtask).AsFloat
                                          /oldValue;
      //计费单位量
      if (OldValue<>0) and blnBLJS then
         FieldByName('costquantity'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                             *FieldByName('costquantity'+strtask).AsFloat
                                             /oldValue;
   end;
end;


procedure TfrmLocationOut.mitGetAutoCountClick(Sender: TObject);
var
   i:Integer;
   strjobnolist:string;
begin
   try
      _ADOConnection.StartTransaction;
      strjobnolist:='';
      strsql:='   if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'      where id=object_id("tempdb..#lskjobno") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskjobno   '+chr(13)+chr(10)
             +'  create table #lskjobno(jobno varchar(20)) '+chr(13)+chr(10);
      if pgcMain.ActivePage=tbsEdit then
      begin
         strSql:=strSql+' insert into #lskjobno(jobno) values("'+data.qryout.fieldbyname('jobno').AsString+'")'
      end else
      begin
         for i:=grdLocationOut.SelectedCount-1 downto 0 do
         begin
            data.qryout.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
            strjobnolist:=strjobnolist+IIF(strjobnolist='','("',',"')+data.qryout.fieldbyname('jobno').asstring+'"';
         end;
         strjobnolist:=strjobnolist+')';
         strSql:=strsql+'insert into #lskjobno '
                       +' select jobno from locationout '
                       +'  where jobno in '+strjobnolist+chr(13)+chr(10);
      end;
      strSql:=strSql+' exec ksp_GetAutoCostbyJobno @table="locationout",@cpid="出仓",@type="warehouse" ';
      OpenSql(dataTmp.qryTmp,strSql);
      droplsk('#lskjobno');
      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      kmessageDlg('操作失败,请与管理员联系!',mtinformation,[mbOK],0);
      Exit;
   end;
   kmessageDLg('操作成功!',mtinformation,[mbok],0);
end;

function TfrmLocationOut.GetLocationbillNo:String;
var
   StrDate:String;
   StrCusInvo:String;
begin
   decodedate(Now,Year,Month,Day);//分解当前日期
   OpenSql(datatmp.qryTmp,' select AutoBillNo=isnull(AutoBillNo,"F"),IsYear=isnull(IsYear,"F"), '
                 +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                 +'        LastNum,ishelpnocc=rtrim(isnull(ishelpnocc,"")) '
                 +'   from organization (nolock)  '
                 +'  where userid="'+_userid+'" ');
   if datatmp.qryTmp.FieldByName('AutoBillNo').AsString='T' then
   begin
      StrCusInvo:='';
      StrCusInvo:=datatmp.qryTmp.FieldByName('ishelpnocc').AsString;
      if datatmp.qryTmp.FieldByName('IsYear').AsString='T' then
         StrCusInvo:=StrCusInvo+IntToStr(Year);
      if datatmp.qryTmp.FieldByName('IsMonth').AsString='T' then
         StrCusInvo:=StrCusInvo+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month));
      if datatmp.qryTmp.FieldByName('IsDay').AsString='T' then
         StrCusInvo:=StrCusInvo+iif(day<10,'0'+IntToStr(day),IntToStr(day));
      opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(docno1,'+IntToStr(length(StrCusInvo)+1)+','+datatmp.qryTmp.FieldByName('LastNum').AsString+')),0)+1 '
                     +'  from genjobno (nolock) '
                     +' where docno1 like "%'+StrCusInvo+'%"  '
                     );
      Result:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,datatmp.qryTmp.FieldByName('LastNum').AsInteger,'0',psLeft);
   end else
   begin
       opensql(datatmp.qryTmp,
               'select dhcx=max(convert(int,substring(docno1,7,8))) '
              +'  from genjobno '
              +' where substring(docno1,1,2)="CC"  '
              +'       and substring(jobno,5,2)="LO"  '
              +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
//       data.qryLocationin.FieldByName('LocationBillNO').Asstring:='JC'+copy(datetostr(GetServerDate),1,4)
//                                                               +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
      Result:='CC'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   end;
end;

procedure TfrmLocationOut.conscusnameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOutItem.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOutItem.FieldByName('conscusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOut.mitTaskCheckClick(Sender: TObject);
var
  i,faltCount,j,faltcomplete:integer;
  strjobnoupd,strmsg:string;
begin
   j:=grdLocationOut.SelectedCount;
{
   if j=1 then
   begin
      mitCheckOneClick(Sender);
      Exit;
   end;
}
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strmsg:='';
   faltCount:=0;
   faltcomplete:=0;
   strjobnoupd:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if (data.qryOut.FieldByName('taskcheckname').AsString<>'') then
      inc(faltCount)               //已经审核
      else
      if (data.qryOut.FieldByName('checkname').AsString<>'') then
      Inc(faltcomplete)            //已经部门审核
      else
      begin
         if strjobnoupd='' then strjobnoupd:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
         else strjobnoupd:=strjobnoupd+',"'+data.qryOut.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnoupd<>'' then
      execSql(datatmp.qryTmp,'update Locationout '
                   +'   set taskcheckname="'+_loginname+'",'
                   +'       taskcheckdate=getdate() '
                   +' where jobno in ('+strjobnoupd+')');
   btnRefreshClick(btnRefresh);
   //笔资料已经复核的数据未审核!
   if faltCount<>0 then strmsg:=IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmlocationout','082');
   //笔资料已经部门审核的数据未核!
   if faltcomplete<>0 then strmsg:=strmsg+chr(13)+IntToStr(faltcomplete)+'/'+IntToStr(j)+GetMessage('frmlocationout','083');
   if strmsg<>'' then
      KMessageDlg(strmsg,mtInformation,[mbOK],0)
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.mitConcelTaskClick(Sender: TObject);
var
  i,faltCount,j,checked:integer;
  strjobnoupd,strmsg:string;
begin
   {if data.qrylocationout.FieldByName('loacccheckname').AsString<>'' then
   begin
      KMessageDlg('财务已确认,不能取消复核!',mtWarning,[mbOK],0);
      Exit;
   end;}
   j:=grdLocationOut.SelectedCount;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then Exit;
   faltCount:=0;
   checked:=0;
   strjobnoupd:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if (data.qryOut.FieldByName('countname').AsString='')     //未财务计费
         and (data.qryOut.FieldByName('costcheckname').AsString='') then
      begin
         if data.qryOut.FieldByName('checkname').AsString<>'' then inc(faltCount) //已审核
         else if (_DB_CheckSelf='T') and (_LoginId<>'SYSTEM')                    //复核人不同
            and (_loginName<>data.qryOut.FieldByName('taskcheckname').AsString) then
            inc(faltCount)
         else
         begin
            if strjobnoupd='' then strjobnoupd:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
            else strjobnoupd:=strjobnoupd+',"'+data.qryOut.fieldbyname('jobno').AsString+'"';
         end;
      end else
         inc(faltCount);
   end;
   if (strjobnoupd<>'') then
      execSql(datatmp.qryTmp,'update Locationout '+chr(13)+chr(10)
                           +'   set taskcheckname="",'+chr(13)+chr(10)
                           +'       taskcheckdate=null'+chr(13)+chr(10)
                           +' where jobno in ('+strjobnoupd+')');
   btnRefreshClick(btnRefresh);
   if faltCount<>0 then
      Kmessagedlg(IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmlocationout','084'), mtInformation,[mbOk],0)
      //'笔资料已审核或已财务审核或已计费或是他人复核的数据未取消审核！'
   else
      KMessageDlg(_strsucceed,mtWarning,[mbOK],0) ;
end;

procedure TfrmLocationOut.mniItemTask_Order_OClick(Sender: TObject);
var strJobno:string;
begin
   with data.qrylocationoutItem do
   begin
      if Sender=mniItemTask_Order_O then
      begin
          if FieldByName('jobnoorder').AsString='' then exit;
             strJobno:=FieldByName('jobnoorder').AsString;
             WorkWareOrderDxALL(stBrowse,strJobno,nil,nil);
      end;
   end;
end;

procedure TfrmLocationOut.mitUpdateMainClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  _operationtype:=data.qrylocationout.fieldbyname('operationtype').AsInteger;
  if (_LoginID<>'SYSTEM') then
  begin
    KmessageDlg(GetMessage('qrylocationout','039'),mtInformation,[mbOK],0);//'你无权修改业务资料!'
    exit;
  end;
  if (data.qrylocationout.FieldByName('OPERATIONNAME').AsString='') then
  begin
    KmessageDlg(GetMessage('qrylocationout','040'),mtInformation,[mbOK],0);//'还未实际发生库存，无需用这种修改方式!'
    exit;
  end;
  if (data.qrylocationout.FieldByName('checkname').AsString<>'') or
     (data.qrylocationout.FieldByName('CountName').AsString<>'') then
  begin
    if Kmessagedlg(GetMessage('qrylocationout','041'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该笔业务数据已经审核，确认要修改业务资料吗？'
    begin
      if WorkUpDateMain(data.qrylocationout.FieldByName('Jobno').AsString,True) then
         btnRefreshClick(self);
    end;
  end;
end;

procedure TfrmLocationOut.mitsalescountClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将计提选中的所有资料的销售费用，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryout.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if data.qryout.FieldByName('disaccord').AsString<>'T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryout.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if (strjobnocount<>'') and (_salescostcd<>'') then
   begin
      droplsk('#CostItem');
      ExecSql(datatmp.qryTmp,'CREATE TABLE #costitem   /*费用－费用明细*/  '+chr(13)+chr(10)
                            +'     (      '+chr(13)+chr(10)
                            +'       jobno                          VARCHAR          (20)      NOT NULL ,/*工作号*/      '+chr(13)+chr(10)
                            +'       sno                            SMALLINT                   NOT NULL ,/*序号*/      '+chr(13)+chr(10)
                            +'       snosku                         SMALLINT                       NULL ,/*对应业务表商品信息序号（主费用取－11，手工录入为－10）,*/      '+chr(13)+chr(10)
                            +'       costcd                         VARCHAR          (8)           NULL ,/*费用代码*/      '+chr(13)+chr(10)
                            +'       costin                         NUMERIC          (16,4)        NULL ,/*收入*/      '+chr(13)+chr(10)
                            +'       costout                        NUMERIC          (16,4)        NULL ,/*支出*/      '+chr(13)+chr(10)
                            +'       currcd                         VARCHAR          (8)           NULL ,/*币种代码*/      '+chr(13)+chr(10)
                            +'       costcusid                      VARCHAR          (20)          NULL ,/*关系人代码*/      '+chr(13)+chr(10)
                            +'       costcusname                    VARCHAR          (40)          NULL ,/*关系人名称*/      '+chr(13)+chr(10)
                            +'       costdate                       DATETIME                       NULL ,/*收或付款时间*/      '+chr(13)+chr(10)
                            +'       userid                         VARCHAR          (20)          NULL ,/*组织代码*/      '+chr(13)+chr(10)
                            +'       username                       VARCHAR          (20)          NULL ,/*组织名称*/      '+chr(13)+chr(10)
                            +'       skuid                          VARCHAR          (40)          NULL ,/*商品代码*/      '+chr(13)+chr(10)
                            +'       skuname                        VARCHAR          (250)         NULL ,/*商品名称*/      '+chr(13)+chr(10)
                            +'       lister                         VARCHAR          (10)          NULL ,/*计费人*/      '+chr(13)+chr(10)
                            +'       costrate                       NUMERIC          (9,2)         NULL ,/*单价（如对于超仓仓租，特指超仓单价）*/      '+chr(13)+chr(10)
                            +'       isincome                       VARCHAR          (1)           NULL ,/*收入/支出标志*/      '+chr(13)+chr(10)
                            +'       iuserid                        VARCHAR          (20)      NOT NULL ,/*指定任务执行组织*/      '+chr(13)+chr(10)
                            +'       iusername                      VARCHAR          (20)          NULL ,/*执行组织名称*/      '+chr(13)+chr(10)
                            +'       buskind                        VARCHAR          (30)          NULL ,/*业务类型(仓储进出仓、配送等)*/      '+chr(13)+chr(10)
                            +'       keyindate                      DATETIME                       NULL ,/*录入时间*/      '+chr(13)+chr(10)
                            +'       countuom                       VARCHAR          (8)           NULL ,/*计费单位（仅对于散装指单位，需显示类别）*/      '+chr(13)+chr(10)
                            +'       jobnoin                        VARCHAR          (20)          NULL  /*对应进仓工作号*/      '+chr(13)+chr(10)
                            +'      )      '+chr(13)+chr(10)
             );
      ExecSql(datatmp.qryTmp,' insert into #costitem   '+chr(13)+chr(10)
                            +' select jobno,sno=0,snosku=item.sno,    '+chr(13)+chr(10)
                            +'        costcd="'+_salescostcd+'",          '+chr(13)+chr(10)
                            +'        costin=skucost,      '+chr(13)+chr(10)
                            +'        costout=0,     '+chr(13)+chr(10)
                            +'        currcd,            '+chr(13)+chr(10)
                            +'        costcusid,costcusname,     '+chr(13)+chr(10)
                            +'        costdate=convert(varchar(10),operationdate,102),     '+chr(13)+chr(10)
                            +'        userid,username,skuid,skuname,     '+chr(13)+chr(10)
                            +'        lister="'+_loginname+'" ,     '+chr(13)+chr(10)
                            +'        costrate=price,     '+chr(13)+chr(10)
                            +'        isincome="T",     '+chr(13)+chr(10)
                            +'        iuserid,iusername,     '+chr(13)+chr(10)
                            +'        buskind="销售出仓",     '+chr(13)+chr(10)
                            +'        keyindate=getdate(),     '+chr(13)+chr(10)
                            +'        countuom=costuomtype,     '+chr(13)+chr(10)
                            +'        jobnoin=null      '+chr(13)+chr(10)
                            +'   from locationinitem item    '+chr(13)+chr(10)
                            +'  where item.jobno in ('+strjobnocount+')  '+chr(13)+chr(10)
                            +'declare @maxSNO smallint,                         '+chr(13)+chr(10)
                            +'        @jobno varchar(20)                        '+chr(13)+chr(10)
                            +'declare cost_cursor CURSOR FOR                    '+chr(13)+chr(10)
                            +' select Jobno,maxSNO=max(sno)                     '+chr(13)+chr(10)
                            +'   from CostItem (nolock)                         '+chr(13)+chr(10)
                            +'  where exists(select 1                           '+chr(13)+chr(10)
                            +'                 from #CostItem cost              '+chr(13)+chr(10)
                            +'                where CostItem.Jobno=cost.Jobno   '+chr(13)+chr(10)
                            +'                    )                             '+chr(13)+chr(10)
                            +'  group by Jobno                                  '+chr(13)+chr(10)
                            +' union                                            '+chr(13)+chr(10)
                            +' select Jobno,maxSNO=0                            '+chr(13)+chr(10)
                            +'   from #CostItem                                 '+chr(13)+chr(10)
                            +'  where not exists(select 1                       '+chr(13)+chr(10)
                            +'                 from CostItem cost(nolock)       '+chr(13)+chr(10)
                            +'                where #CostItem.Jobno=cost.Jobno  '+chr(13)+chr(10)
                            +'                  )                               '+chr(13)+chr(10)
                            +'  group by Jobno                                  '+chr(13)+chr(10)
                            +'  order by 1                                      '+chr(13)+chr(10)
                            +'  OPEN cost_cursor                                '+chr(13)+chr(10)
                            +'  FETCH next FROM cost_cursor INTO @Jobno,@maxSNO '+chr(13)+chr(10)
                            +'  WHILE (@@fetch_status <> -1)                    '+chr(13)+chr(10)
                            +'  BEGIN                                           '+chr(13)+chr(10)
                            +'    IF (@@fetch_status <> -2)                     '+chr(13)+chr(10)
                            +'    BEGIN                                         '+chr(13)+chr(10)
                            +'      select @maxSNO=@maxSNO+1                    '+chr(13)+chr(10)
                            +'      update #CostItem set SNO=@maxSNO,@maxSNO=@maxSNO+1 '+chr(13)+chr(10)
                            +'       where #CostItem.Jobno=@Jobno               '+chr(13)+chr(10)
                            +'      FETCH next FROM cost_cursor INTO @Jobno,@maxSNO   '+chr(13)+chr(10)
                            +'    END                                           '+chr(13)+chr(10)
                            +'  END                                             '+chr(13)+chr(10)
                            +'  DEALLOCATE cost_cursor                          '+chr(13)+chr(10)
                            +' insert into costitem                             '+chr(13)+chr(10)
                            +' ( jobno, sno, snosku, costcd,                    '+chr(13)+chr(10)
                            +'   costin, costout, currcd, costcusid,            '+chr(13)+chr(10)
                            +'   costcusname,costdate,                          '+chr(13)+chr(10)
                            +'   userid, username, skuid, skuname,              '+chr(13)+chr(10)
                            +'   lister,                                        '+chr(13)+chr(10)
                            +'   costrate,  isincome,                           '+chr(13)+chr(10)
                            +'   iuserid, iusername, buskind, keyindate,        '+chr(13)+chr(10)
                            +'   countuom, jobnoin)                             '+chr(13)+chr(10)
                            +' select * from #lsCostitem                       '+chr(13)+chr(10)
                            +'   drop table #lsCostitem                         '+chr(13)+chr(10)
             );

      execSql(datatmp.qryTmp,'update LocationIN '
                   +'   set disaccord="T"'
                   +' where jobno in ('+strjobnocount+')');
   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('销售费用计提成功',mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.btnHSClick(Sender: TObject);
var
   strint:string;
begin
   if (_paper='T') and (DataState in Setdcs) then
   begin
      if KinputQuery('张数换算令数','请输入张数：',strInt) then
      begin
         try
            KMessageDlg('令数为: '+FloatToStr(KRound(strToFLoat(strInt)/500,3)),mtInformation,[mbyes],0);
         except
         end;
      end;
   end;
end;

procedure TfrmLocationOut.mitgetskucostClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将重新获取商品的销售价格及总价，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryout.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if data.qryout.FieldByName('disaccord').AsString<>'T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryout.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryout.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnocount<>'' then
   begin
      ExecSql(datatmp.qryTmp,'update locationinitem '+chr(13)+chr(10)
                            +'   set price=(select top 1 skuprice.price '+chr(13)+chr(10)
                            +'                from skuprice '+chr(13)+chr(10)
                            +'               where skuprice.skuid=locationinitem.skuid '+chr(13)+chr(10)
                            +'                 and "'+data.qryout.fieldbyname('costcusid').AsString+'" like rtrim(isnull(skuprice.CusID,""))+"%" '+chr(13)+chr(10)
                            +'                 and isnull(skuprice.price,0)<>0     '+chr(13)+chr(10)
                            +'                 and convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryout.fieldbyname('taskdate').asdatetime)+'" '+chr(13)+chr(10)
                            +'               order by skuprice.cusid desc ,effivedate desc ), '+chr(13)+chr(10)
                            +'       skucost=(select top 1 skucost=case when skuprice.uomtype="quantity" then isnull(locationinitem.quantity,0)*skuprice.price '+chr(13)+chr(10)
                            +'                                          when skuprice.uomtype="price" then isnull(locationinitem.price,0)*skuprice.price'+chr(13)+chr(10)
                            +'                                          when skuprice.uomtype="grossweight" then isnull(locationinitem.grossweight,0)*skuprice.price '+chr(13)+chr(10)
                            +'                                          when skuprice.uomtype="netweight" then isnull(locationinitem.netweight,0)*skuprice.price'+chr(13)+chr(10)
                            +'                                          when skuprice.uomtype="volume" then isnull(locationinitem.volume,0)*skuprice.price '+chr(13)+chr(10)
                            +'                                          else 0 end    '+chr(13)+chr(10)
                            +'                  from skuprice '+chr(13)+chr(10)
                            +'                 where skuprice.skuid=locationinitem.skuid '+chr(13)+chr(10)
                            +'                   and "'+data.qryout.fieldbyname('costcusid').AsString+'" like rtrim(isnull(skuprice.CusID,""))+"%" '+chr(13)+chr(10)
                            +'                   and isnull(skuprice.price,0)<>0     '+chr(13)+chr(10)
                            +'                   and convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryout.fieldbyname('taskdate').asdatetime)+'" '+chr(13)+chr(10)
                            +'                 order by skuprice.cusid desc ,effivedate desc ) '+chr(13)+chr(10)
                            +' where jobno in ('+strjobnocount+')     '+chr(13)+chr(10)
                            +' '+chr(13)+chr(10)
             );

   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('获取商品的销售价格及总价成功!!',mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.mitcancelsalesClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将计提选中的所有资料的采购费用，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryout.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if data.qryout.FieldByName('disaccord').AsString='T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryout.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryout.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnocount<>'' then
   begin
      OpenSql(dataTmp.qryTmp,' select 1 from costitem '
                            +'  where costcd="'+_salescostcd+'" '
                            +'    and jobno in ('+strjobnocount+') '
                            +'    and (isnull(departchk,"")<>""   '
                            +'     or isnull(iocost,0)<>0 '
                            +'     or isnull(ioinvo,0)<>0 '
                            +'     or isnull(iocharge,0)<>0 '
                            +'     or isnull(jobnoywh,"")<>"") ');
      if dataTmp.qryTmp.RecordCount>0 then
      begin
         Kmessagedlg('存在已进行财务操作的费用，放弃失败！',mtInformation,[mbOk],0);
         Exit;
      end;
      ExecSql(datatmp.qryTmp,' delete costitem   '+chr(13)+chr(10)
                            +'  where costcd="'+_salescostcd+'" '
                            +'    and jobno in ('+strjobnocount+') '
             );

      execSql(datatmp.qryTmp,'update Locationout '
                   +'   set disaccord="F"'
                   +' where jobno in ('+strjobnocount+')');
   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('放弃采购费用成功',mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.mitxshwccdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   OpenSql(dataTmp.qryTmp,'select locationout.costcusname,OperationDate=convert(char(10),locationout.OperationDate,102),OrderID=wareorder.OrderID, '+chr(13)+chr(10)
                         +'       locationout.carbrand,locationout.LocationBillNO,item.mainorder,'+chr(13)+chr(10)
                         +'       item.skuname,item.lotcode,wareorder.drivecardno,'+chr(13)+chr(10)
                         +'       skumodel=item.skumodel+case when item.skuspec<>"" then "/"+item.skuspec  else "" end , '+chr(13)+chr(10)
                         +'       item.locname,item.quantitytask,wareorder.createname,'+chr(13)+chr(10)
                         +'       quantityuom=item.pieceuom,item.volumetask,'+chr(13)+chr(10)
                         //lzw20110624
                         +'       TASKDATE=convert(char(10),locationout.TASKDATE,102), '+chr(13)+chr(10)
                         +'       grossweight=case when item.weightuom="吨" then item.grossweighttask*1000 else item.grossweighttask end, '+chr(13)+chr(10)
                         +'       item.remark,orderdate=convert(char(10),wareorder.orderdate,102),locationout.username'+chr(13)+chr(10)
                         +'  from locationout(nolock)                                             '+chr(13)+chr(10)
                         +'       left join locationoutitem item(nolock)                          '+chr(13)+chr(10)
                         +'                 left join wareorder(nolock)                          '+chr(13)+chr(10)
                         +'                        on item.jobnoorder=wareorder.jobno    '+chr(13)+chr(10)
                         +'              on locationout.jobno=item.jobno                   '+chr(13)+chr(10)
                         +' where locationout.jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   lstpara.Add('Locationbillno='+dataTmp.qryTmp.FieldByname('Locationbillno').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstpara.Add('drivecardno='+dataTmp.qryTmp.FieldByname('drivecardno').AsString);
   lstpara.Add('username='+dataTmp.qryTmp.FieldByname('username').AsString);
   lstpara.Add('carbrand='+dataTmp.qryTmp.FieldByname('carbrand').AsString);
   lstpara.Add('orderid='+dataTmp.qryTmp.FieldByname('orderid').AsString);
   lstpara.Add('mainorder='+dataTmp.qryTmp.FieldByname('mainorder').AsString);
   lstpara.Add('operationdate='+dataTmp.qryTmp.FieldByname('operationdate').AsString);
   lstpara.Add('createname='+dataTmp.qryTmp.FieldByname('createname').AsString);
   lstpara.Add('orderdate='+dataTmp.qryTmp.FieldByname('orderdate').AsString);
   lstpara.Add('taskdate='+dataTmp.qryTmp.FieldByname('taskdate').AsString);
   //lzw20110613
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('kdr='+_loginname);
   Worklinprint('100085','old','夏商市场部出仓单',dataTmp.qryTmp,nil,nil,lstpara);
 end;

procedure TfrmLocationOut.mitdelcountClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('该操作将删除选定资料的计费条目,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdLocationout.SelectedCount-1 Downto 0 do
      begin
         data.qryout.GotoBookmark(Pointer(grdLocationout.SelectedRows[i]));
         ExecSql(dataTmp.qryTmp,' delete autocountcost where jobno="'+data.qryOut.FieldByname('jobno').AsString+'" ');
      end;
      Kmessagedlg('操作成功！！！',mtInformation,[mbOk],0);
   end;
end;

procedure TfrmLocationOut.mitforkworkClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data.qryout.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="F"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryout.FieldByname('jobno').AsString,'LO','F')
   else
      Workforkwork(data.qryout.FieldByname('jobno').AsString,'-1','F');
end;

procedure TfrmLocationOut.mitcusbillnoClick(Sender: TObject);
var
   strNo:string;
begin
   if data.qryLocationout.FieldByName('jobno').AsString='' then
   begin
      Kmessagedlg('未选定记录！', mtInformation,[mbOk],0);
      Exit;
   end;        
   if KinputQuery('修改单号','新的单号：',strNo) then
   begin
      strNo:=Trim(strNo);
      if (data.qryLocationout.FieldByName('cusbillno').AsString=strNo) or
         (strNo='') then
         Exit;
      _ADOConnection.StartTransaction;
      try
         ExecSql(dataTmp.qryTmp,' update locationout   '
                       +'    set cusbillno="'+strNo+'"  '
                       +'  where jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
                );
         ExecSql(dataTmp.qryTmp,' update locationoutitem   '
                       +'    set cusbillno="'+strNo+'"  '
                       +'  where jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
                );
         ExecSql(dataTmp.qryTmp,' update locationoutdetail   '
                       +'    set cusbillno="'+strNo+'"  '                                                   
                       +'  where jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
                );

         if KmessageDlg('需要同步配送业务表中对应的单号资料吗？',mtConfirmation,[mbYes,mbNo],0)=mryes then
         begin
            KMessageWait('正在同步商品名称...,请稍候！',mtInformation,btnClose.Handle,0);
            ExecSql(dataTmp.qryTmp,'exec ksp_Altercusbillno '
                          +'     @jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'", '
                          +'     @cusbillno="'+strNo+'"  '
                   );
         end;
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.Rollback;
         Raise;
         Kmessagedlg(_strdefeated, mtInformation,[mbOk],0);
      end;
      data.qryLocationout.Close;
      data.qryLocationout.Open;
      Kmessagedlg('单号修改成功！', mtInformation,[mbOk],0);
   end;
end;

procedure TfrmLocationOut.mitblnoClick(Sender: TObject);
var
   strNo:string;
begin
   if data.qryLocationout.FieldByName('jobno').AsString='' then
   begin
      Kmessagedlg('未选定记录！', mtInformation,[mbOk],0);
      Exit;
   end;
   if KinputQuery('修改单号','新的单号：',strNo) then
   begin
      strNo:=Trim(strNo);
      if (data.qryLocationout.FieldByName('blno').AsString=strNo) or
         (strNo='') then
         Exit;
      _ADOConnection.StartTransaction;
      try
         ExecSql(dataTmp.qryTmp,' update locationout   '
                       +'    set blno="'+strNo+'"  '
                       +'  where jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
                );
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.Rollback;
         Raise;
         Kmessagedlg(_strdefeated, mtInformation,[mbOk],0);
      end;
      data.qryLocationout.Close;
      data.qryLocationout.Open;
      Kmessagedlg('单号修改成功！', mtInformation,[mbOk],0);
   end;
end;

procedure TfrmLocationOut.mitforkworkunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="F"'
          );
   if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
   begin
      if dataTmp.qryTmp.RecordCount=0 then
      begin
         KMessageDlg('该票业务还未进行叉车司机工作量的分摊,不能删除！',mtWarning,[mbOK],0);
         Exit;
      end;
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
      if KmessageDlg('是否取消叉车司机工作量',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="F"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="F" '+chr(13)+chr(10)
                               );
         if dataTmp.qryTmp1.RecordCount=0 then
         begin
            KMessageDlg('该票业务工作量的分摊删除完成！',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   end else
   begin
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的叉车司机工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
         ExecSql(dataTmp.qryTmp,'delete from forkworkload '
                               +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="F"'
                               );
   end;
end;
procedure TfrmLocationOut.mitDocBookPicClick(Sender: TObject);
begin
   pWorkFormDll('BASECODE',PChar('DOCBOOKPIC'+data.qryOut.FieldByName('jobno').AsString),'STBROWSE');
end;

procedure TfrmLocationOut.btnInClick(Sender: TObject);
var
   strjobnoin,strlocationbillno:string;
begin
   if pgcMain.ActivePage<>tbsEdit then  pgcMain.ActivePage:=tbsEdit;
   OpenSql(qryTmp,'select 1 from locationin(nolock)'
                 +' where jobnoine="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
           );
   if qryTmp.RecordCount>0 then
   begin
      Kmessagedlg('已做转帐,不能重复转账！', mtInformation,[mbOk],0);
      Exit;
   end;
   if (data.qryLocationout.FieldByName('loadcosttype').AsString<>'转帐') and (_paper='T') then
   begin
      Kmessagedlg('操作类型不是转帐的不能进行该操作', mtInformation,[mbOk],0);
      Exit;
   end;
   if cmbConsignAccountID.TextField='' then
   begin
      Kmessagedlg('请重新挑选收货人', mtInformation,[mbOk],0);
      Exit;
   end;
   if KmessageDlg('该操作将完成该笔出仓重新进仓，请确认？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      _ADOConnection.StartTransaction;
      try
         strjobnoin:=genJobno('LI','');
         if _paper='T' then
         begin

            OpenSql(dataTmp.qryTmp,'select custype=codelib.codechar1 '
                            +'  from customer(nolock) left join codelib(nolock)  '
                            +'                       on customer.custype=codelib.codename     '
                            +' where customer.cusid="'+cmbConsignAccountID.TextField+'" '
                            +'   and codelib.codeclass="09" ');
            if Length(dataTmp.qryTmp.FieldByName('custype').AsString)>1 then
            begin
               OpenSql(dataTmp.qryTmp1,'select maxno=isnull(max(substring(docno1,6,6)),0)+1'
                                     +'  from genjobno(nolock) '
                                     +' where docno1 like "'+copy(DateToStr(Date),3,2)+'%"'
                                     +'   and substring(docno1,3,2)="'+dataTmp.qryTmp.FieldByName('custype').AsString+'" '
                                     +'   and substring(docno1,4,1)<>"U" '
                                     +'   and len(docno1)=11'
                      );
            end else
            begin
               OpenSql(dataTmp.qryTmp1,'select maxno=isnull(max(substring(docno1,5,6)),0)+1'
                                     +'  from genjobno(nolock) '
                                     +' where docno1 like "'+copy(DateToStr(Date),3,2)+'%"'
                                     +'   and substring(docno1,3,1)="'+dataTmp.qryTmp.FieldByName('custype').AsString+'" '
                                     +'   and substring(docno1,4,1)<>"U" '
                                     +'   and len(docno1)=10'
                      );
            end;
            strlocationbillno:=copy(DateToStr(Date),3,2)+dataTmp.qryTmp.FieldByName('custype').AsString+'-'+pad(dataTmp.qryTmp1.fieldbyname('maxno').asstring,6, '0', psLeft)

         end else
         begin
            strlocationbillno:=GetLocationbillNoin;
         end;
         ExecSql(dataTmp.qryTmp,' exec ksp_locouttolocin '
                               +'      @jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'", '
                               +'      @jobnoin="'+strjobnoin+'",  '
                               +'      @costcusid="'+cmbConsignAccountID.TextField+'",  '
                               +'      @costcusname="'+cmbConsignAccountID.Text+'",  '

                              //lzw20120628加一个仓单号的参数，用来生成进仓的仓单号
                               +'      @locationbillno="'+strlocationbillno+'" '
                );

         _ADOConnection.Commit;
         ExecSql(dataTmp.qryTmp1,'update locationout set Routing="转入"+"'+cmbConsignAccountID.Text+'" '
                                +' where jobno="'+data.qryLocationout.FieldByName('jobno').AsString+'" '
                                );
         Kmessagedlg(_strsucceed, mtInformation,[mbOk],0);
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.Rollback;
         Raise;
         Kmessagedlg(_strdefeated, mtInformation,[mbOk],0);
      end;
   end;
end;

procedure TfrmLocationOut.mitinoutqueryClick(Sender: TObject);
begin
   WorkInoutquery(data.qryOut.fieldbyname('jobno').AsString,'O');
end;

procedure TfrmLocationOut.mitcountczClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将计提选中的所有资料的仓租，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      OpenSql(dataTmp.qryTmp,'select 1 from costitem '
                            +' where costcd="CZ" '
                            +'   and isnull(getid,"F")="F" '
                            +'   and jobno="'+data.qryOut.FieldByName('jobno').AsString+'"');
      OpenSql(dataTmp.qryTmp1,'select 1 from warecostrate '
                             +' where costcd="CZ" '
                             +'   and jobno="'+data.qryOut.FieldByName('jobno').AsString+'"');
      if (dataTmp.qryTmp.RecordCount=0) and (dataTmp.qryTmp1.RecordCount<>0) then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryOut.fieldbyname('jobno').AsString+'"';
         execSql(datatmp.qryTmp,'update LocationOut '
                      +'   set checkname="'+_loginname+'",'
                      +'       checkdate=getdate() '
                      +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
      end;
   end;
   if strjobnocount<>'' then
      WorkCZoutCount(strjobnocount);
   btnRefreshClick(btnRefresh);
end;

procedure TfrmLocationOut.mitcancelcountczClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将放弃选中的所有资料的运费，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      OpenSql(dataTmp.qryTmp,'select 1 from costitem '
                            +' where costcd="CZ" '
                            +'   and isnull(getid,"F")="F" '
                            +'   and jobno="'+data.qryOut.FieldByName('jobno').AsString+'"');
      if dataTmp.qryTmp.RecordCount<>0 then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryOut.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnocount<>'' then
   begin
      OpenSql(dataTmp.qryTmp,' select 1 from costitem '
                            +'  where costcd="YF" '
                            +'    and jobnoplan in ('+strjobnocount+') '
                            +'    and (isnull(departchk,"")<>""   '
                            +'     or isnull(iocost,0)<>0 '
                            +'     or isnull(ioinvo,0)<>0 '
                            +'     or isnull(iocharge,0)<>0 '
                            +'     or isnull(jobnoywh,"")<>"") ');
      if dataTmp.qryTmp.RecordCount>0 then
      begin
         Kmessagedlg('存在已进行财务操作的费用，放弃失败！',mtInformation,[mbOk],0);
         Exit;
      end;
      ExecSql(datatmp.qryTmp,' delete costitem   '+chr(13)+chr(10)
                            +'  where costcd="CZ" '
                            +'   and isnull(getid,"F")="F" '
                            +'    and jobno in ('+strjobnocount+') '
             );

      execSql(datatmp.qryTmp,'update LocationOut '
                   +'   set checkname="",'
                   +'       checkdate=null '
                   +' where jobno in ('+strjobnocount+') ');
   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('放弃运费成功',mtInformation,[mbOk],0);
end;

procedure TfrmLocationOut.mitliooutmainorderClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate,strusername:string;
   strjobnocount:string;
   i:integer;
   //_SkuHB,_taskordetail:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   strjobnocount:='';
   for i:=grdLocationOut.SelectedCount-1 Downto 0 do
   begin
      data.qryOut.GotoBookmark(Pointer(grdLocationOut.SelectedRows[i]));
      if strjobnocount='' then
         strjobnocount:='"'+data.qryOut.fieldbyname('jobno').AsString+'"'
      else
         strjobnocount:=strjobnocount+',"'+data.qryOut.fieldbyname('jobno').AsString+'"';
   end;
   lstPara:=TStringList.Create;
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   strusername:=data.qrylocationout.FieldByname('username').AsString;
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('isbond='+data.qrylocationout.FieldByname('isbond').AsString);
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('Routing='+data.qrylocationout.FieldByname('Routing').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('PORTL='+data.qrylocationout.FieldByname('PORTL').AsString);
   lstpara.Add('PORTD='+data.qrylocationout.FieldByname('PORTD').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('condes='+data.qrylocationout.FieldByname('condes').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('cusname='+data.qrylocationout.FieldByname('cusname').Asstring);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstPara.Add('CARBRAND='+data.qryLocationOut.FieldByname('CARBRAND').AsString);
   lstPara.Add('CARRIERNO='+data.qryLocationOut.FieldByname('CARRIERNO').AsString);
   lstpara.Add('carriercusname='+data.qryLocationOut.FieldByname('carriercusname').Asstring);
   lstpara.Add('carrierdate='+data.qrylocationout.FieldByname('carrierdate').AsString);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('iusername='+data.qrylocationout.FieldByname('iusername').AsString);
   lstpara.Add('createdate='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('createname='+data.qrylocationout.FieldByname('createname').AsString);
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstPara.Add('loadcosttype='+data.qryLocationOut.FieldByname('loadcosttype').AsString);
   //lzw20120228
   lstPara.Add('shippercusname='+data.qrylocationout.fieldByname('shippercusname').AsString);
   lstPara.Add('loacccheckname='+data.qrylocationout.fieldByname('loacccheckname').AsString);
   lstPara.Add('taskcheckname='+data.qrylocationout.fieldbyname('taskcheckname').AsString);
   //******* wzh.05.08.30  begin ********//
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));
   lstpara.Add('costcusname='+data.qrylocationout.FieldByname('costcusname').Asstring);
   lstpara.Add('shipcusname='+data.qrylocationout.FieldByname('shipcusname').Asstring);
   lstpara.Add('trans='+data.qrylocationout.FieldByname('TRANS').Asstring);
   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstpara.Add('oyear='+inttostr(stryear));
   lstpara.Add('omonth='+inttostr(strmonth));
   lstpara.Add('oday='+inttostr(strday));

   lstPara.Add('operationdate='+strdate);
   lstpara.Add('stockup='+iif(data.qrylocationout.FieldByname('TRANS').Asstring='T','请提前备货！！',''));

   if data.qryLocationOut.FieldByname('loadcosttype').AsString='送货' then
   begin
      lstPara.Add('loadtype1='+'''√''');
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype1='+'');
   end
   else if data.qryLocationOut.FieldByname('loadcosttype').AsString='自提' then
   begin
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype2='+'''√''');
      lstPara.Add('loadtype3='+'');
   end
   else
   begin
      lstPara.Add('loadtype1='+'');
      lstPara.Add('loadtype2='+'');
      lstPara.Add('loadtype3='+'''√');
   end;
   lstPara.Add('jobno='+data.qryLocationOut.FieldByname('jobno').AsString);

   //900052作业出入库联系单中用到
   lstpara.Add('title='+'产成品出库运输作业单');
   lstPara.Add('date='+DateToStr(Now));
   lstPara.Add('date='+DatetimeToStr(Now));
   //重复及不规范命名:一个月后更新无问题删除    lqs
   lstpara.Add('ck='+data.qrylocationout.FieldByname('iusername').AsString);
   lstpara.Add('zdrq='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('qysj='+data.qrylocationout.FieldByname('carrierdate').AsString);
   lstpara.Add('ddbh='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('zydh='+data.qrylocationout.FieldByname('LocationBillNO').AsString);
   lstPara.Add('cg='+data.qryLocationOut.FieldByname('opname').AsString);
   lstPara.Add('kp='+data.qryLocationOut.FieldByname('CreateName').AsString);
   lstPara.Add('carno='+data.qryLocationOut.FieldByname('CARBRAND').AsString);
   lstpara.Add('driver='+data.qryLocationOut.FieldByname('carriercusname').Asstring);
//   lstPara.Add('shipcusname='+data.qrylocationout.fieldByname('shippercusid').AsString);
   lstPara.Add('loginname='+_Loginname);
   //
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);

   //收货单位电话,地址
   OpenSql(dataTmp.qryTmp,'select cuscname,address,linkman,tel  '
                         +'  from customer (nolock)      '
                         +' where cusid="'+data.qrylocationout.FieldByname('shipcusid').AsString+'" ');
   lstPara.Add('shipaddress='+dataTmp.qryTmp.fieldByname('address').AsString);
   lstPara.Add('linkman='+dataTmp.qryTmp.fieldByname('linkman').AsString);
   lstPara.Add('tel='+dataTmp.qryTmp.fieldbyname('tel').AsString);
   //取上级部门
   OpenSql(dataTmp.qryTmp,'select pusername from organization  (nolock) where userid="'+data.qrylocationout.FieldByname('iuserid').Asstring+'"');
   lstPara.Add('pusername='+dataTmp.qryTmp.fieldbyname('pusername').AsString);

   OpenSql(dataTmp.qryTmp,'select tjhj=sum(isnull(volume,0)),slhj=sum(isnull(quantity,0)) '
                         +'  from locationoutitem (nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('tjhj='+dataTmp.qryTmp.FieldByname('tjhj').AsString);
   lstPara.Add('slhj='+dataTmp.qryTmp.FieldByname('slhj').AsString);

   OpenSql(dataTmp.qryTmp,'select rwtjhj=sum(isnull(volumetask,0)),rwslhj=sum(isnull(quantitytask,0)) '
                         +'  from locationoutitem (nolock) '
                         +' where jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('rwtjhj='+dataTmp.qryTmp.FieldByname('rwtjhj').AsString);
   lstPara.Add('rwslhj='+dataTmp.qryTmp.FieldByname('rwslhj').AsString);

   OpenSql(dataTmp.qryTmp,'select managecusname '
                         +'  from secondout (nolock) '
                         +' where customsno="'+data.qrylocationout.FieldByname('customsno').AsString+'" '
                         );
   lstPara.Add('managecusname='+dataTmp.qryTmp.FieldByname('managecusname').AsString);

   GenInformations(lstPara);

   if _SkuHB='F' then
   begin
      if _LOPrintTask='F'then
         OpenSql(dataTmp.qryTmp,'select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.ManufactureDate,detail.cusbillnoin,                   '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,             '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))*500),'+chr(13)+chr(10)
                               +'       piece=detail.piece,skuclass="'+cmbSKUClass.Text+'",      '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end,            '+chr(13)+chr(10)
                               +'       netweight=detail.netweight,                              '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweight,                          '+chr(13)+chr(10)
                               +'       volume=detail.volume,detail.QualityName,                        '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       area=detail.area,  '+chr(13)+chr(10)
                               // Added by wql 2006.2.22 9:56:30
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillnoin ,detail.cusbillno,detail.corpno,'+chr(13)+chr(10)
//add by cyh 06.04.08
                               +'       detail.locationBillNo,detail.piece,detail.netweight,detail.grossweight,detail.Volume,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'    model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end                                                                                                                  '+chr(13)+chr(10)
                               +'  from locationoutdetail detail(nolock)  '+chr(13)+chr(10)
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno in ('+strjobnocount+') '
                               +iif(_paper='T','order by detail.sno ','')
                               )
      else
         OpenSql(dataTmp.qryTmp,'select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.ManufactureDate, detail.cusbillnoin,                     '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,               '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantitytask=detail.quantitytask,                           '+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),   '+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))*500),'+chr(13)+chr(10)
                               +'       detail.quantitytask,detail.manufacturedate,                 '+chr(13)+chr(10)
                               +'       piece=detail.piecetask,skuclass="'+cmbSKUClass.Text+'",     '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end,            '+chr(13)+chr(10)
                               +'       netweight=detail.netweighttask,                             '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweighttask,                         '+chr(13)+chr(10)
                               +'       volume=detail.volumetask,QualityName,                       '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       area=detail.areatask,detail.mainorder , '+chr(13)+chr(10)
                               // Added by wql 2006.2.22 9:56:30
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillnoin ,detail.cusbillno,detail.corpno,'+chr(13)+chr(10)
//add by cyh 06.04.08
                               +'       detail.locationBillNo,detail.piecetask,detail.netweighttask,detail.grossweighttask,detail.Volumetask,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'    model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,                                                                                                                  '+chr(13)+chr(10)
                               +'       detail.outzoneno'+chr(13)+chr(10)
                               +'  from locationoutitem detail(nolock)    '+chr(13)+chr(10)
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno in ('+strjobnocount+') '
                               +iif(_paper='T','order by detail.sno ','')
                               );
   end else
   begin
      if _LOPrintTask='F' then
         OpenSql(dataTmp.qryTmp,'  select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.ManufactureDate,detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'         detail.lotcode,detail.skuname,            '+chr(13)+chr(10)
                               +'         locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                               +'         quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'         quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                               +'         m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                               +'         skuclass="'+cmbSKUClass.Text+'",QualityName="",     '+chr(13)+chr(10)
                               +'         detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'         detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'         detail.locationbillnoin,detail.cusbillno,detail.corpno, quantitypiece=sku.piecepro,'+chr(13)+chr(10)
//add by cyh 06.04.08
                               +'       detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,  '+chr(13)+chr(10)
//                               +'        detail.piece,detail.netweight,detail.grossweight,detail.Volume, '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'    model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end                                                                                                                  '+chr(13)+chr(10)
                               +'    from locationoutdetail detail (nolock) '+chr(13)+chr(10)
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno in ('+strjobnocount+') '
                               +'   group by detail.customsno,detail.customsnoin,detail.jobno,detail.locname,detail.lotcode,detail.skuname,sku.skumodel,sku.skuspec,detail.cusbillnoin,  '
                               +'            detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'            detail.areauom,sku.customerno,detail.locationbillnoin,detail.cusbillno,detail.corpno,sku.piecepro, '+chr(13)+chr(10)
                               +'            detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,detail.ManufactureDate,  '+chr(13)+chr(10)
//whl                               +'            detail.piecetask,detail.netweighttask,detail.grossweighttask,detail.Volumetask,  '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),'+chr(13)+chr(10)
                               +'            case when (charindex("(",detail.LotCode,1)>0)                                                             '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'                     then                                                                                                               '+chr(13)+chr(10)
                               +'                     substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'               else  "" end '+chr(13)+chr(10)
                                )
      else
         OpenSql(dataTmp.qryTmp,'  select detail.customsno,detail.customsnoin,detail.jobno,sku.skumodel,sku.skuspec,detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'         detail.lotcode,detail.skuname,          '+chr(13)+chr(10)
                               +'         locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                      then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'         detail.manufacturedate,'+chr(13)+chr(10)       //wzh.05.08.30
//whl                               +'         detail.quantitytask, '+chr(13)+chr(10)
                               +'         quantity=sum(isnull(detail.quantitytask,0)),piece=sum(isnull(detail.piecetask,0)),'+chr(13)+chr(10)
                               +'         quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'         quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'         netweight=sum(isnull(detail.netweighttask,0)),grossweight=sum(isnull(detail.grossweighttask,0)),'+chr(13)+chr(10)
                               +'         m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'         volume=sum(isnull(detail.volumetask,0)),area=sum(isnull(detail.areatask,0)),  '+chr(13)+chr(10)
                               +'         skuclass="'+cmbSKUClass.Text+'",QualityName="",     '+chr(13)+chr(10)
                               +'         detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'         detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'         detail.locationbillnoin ,detail.cusbillno,detail.corpno,mainorder=detail.mainorderin,'+chr(13)+chr(10)
//add by cyh 06.04.08
                               +'         detail.locationBillNo,piecetask=sum(isnull(detail.piecetask,0)),netweighttask=sum(isnull(detail.netweighttask,0)),grossweighttask=sum(isnull(detail.grossweighttask,0)),  '+chr(13)+chr(10)
                               +'         Volumetask=sum(isnull(detail.Volumetask,0)),detail.ShippercusName,detail.ShipcusName,detail.shippercusname ,             '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'    model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,                                                                                                                  '+chr(13)+chr(10)
                               +'         detail.outzoneno'+chr(13)+chr(10)
                               +'    from locationoutitem detail(nolock)   '+chr(13)+chr(10)
                               +'               left join sku (nolock)    '+chr(13)+chr(10)
                               +'                          on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno in ('+strjobnocount+') '
                               +'   group by detail.customsno,detail.customsnoin,detail.jobno,detail.locname,detail.lotcode,detail.skuname, '+chr(13)+chr(10)
//whl                               +'            detail.quantitytask,      '+chr(13)+chr(10)
                               +'            detail.manufacturedate,sku.skumodel,sku.skuspec, detail.cusbillnoin,  '+chr(13)+chr(10)
                               +'            detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'            detail.areauom,sku.customerno,detail.locationbillnoin,detail.cusbillno,detail.corpno,detail.mainorderin,  '+chr(13)+chr(10)
                               +'            detail.locationBillNo,detail.ShippercusName,detail.ShipcusName,               '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),'+chr(13)+chr(10)
                               +'            case when (charindex("(",detail.LotCode,1)>0)                                                             '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'                      and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'                     then                                                                                                               '+chr(13)+chr(10)
                               +'                     substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'               else  "" end,detail.outzoneno                                                                                                                  '+chr(13)+chr(10)
                               );

   end;
   Worklinprint('900005','old','出%库联系单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.mitpickinglistClick(Sender: TObject);
var
   lstPara:Tstringlist;
begin

   OpenSql(dataTmp.qryTmp, ' select recordcount=count(1) from warefifo where jobnoout="'+data.qryLocationOut.FieldByName('jobno').AsString+'"');
   if dataTmp.qryTmp.FieldByName('recordcount').AsInteger>1 then
   begin
      KMessageDlg('该提货单已经打印过，请在《重打出库清单》的地方打印！',mtWarning,[mbOK],0);
      Exit;
   end;
   lstPara:=TStringList.Create;

   lstPara.Add('mainorder='+data.qrylocationout.FieldByName('mainorder').AsString);
   lstPara.Add('zdr='+_loginname);
   lstPara.Add('BarCodemainorder='+data.qryLocationOut.FieldByName('mainorder').AsString);
   OpenSql(dataTmp.qryTmp,' Select printdate=getdate() ');
   lstPara.Add('printdate='+dataTmp.qryTmp.FieldByName('printdate').AsString);
   OpenSql(dataTmp.qryTmp,' Exec ksp_stockupPL '' and locationoutitem.jobno="'+data.qryLocationOut.FieldByName('jobno').AsString+'" ''');
   Worklinprint('900010','old','出库提货单',dataTmp.qryTmp,nil,nil,lstpara);
   dataTmp.qryTmp.First;
   WorkFillRmBb('100002',True,nil,dataTmp.qryTmp,lstPara,False);

{   if Kmessagedlg('是否要把已打印的托盘标识为出库？',mtWarning,[mbYes,mbNo],0)=mryes then
   begin
      ExecSql(dataTmp.qryTmp, ' update locinskudetail set jobnoout=##warefifo.jobnoout,quantityprint=isnull(quantityprint,0)+##warefifo.quantityremain '
                             +'   from ##warefifo '
                             +'  where locinskudetail.jobno=##warefifo.jobno '
                             +'    and locinskudetail.sno=##warefifo.sno '
                             +'    and locinskudetail.ldsno=##warefifo.ldsno '
                             +'    and locinskudetail.detailsno=##warefifo.detailsno '
                             +'   drop table ##warefifo ');
   end else
   begin
      ExecSql(dataTmp.qryTmp, '   drop table ##warefifo ');
   end;}
end;

procedure TfrmLocationOut.mitpickinglistrpClick(Sender: TObject);
var
   lstPara:Tstringlist;
begin
   lstPara:=TStringList.Create;

   lstPara.Add('mainorder='+data.qrylocationout.FieldByName('mainorder').AsString);
   lstPara.Add('zdr='+_loginname);
   lstPara.Add('BarCodemainorder='+data.qryLocationOut.FieldByName('mainorder').AsString);
   OpenSql(dataTmp.qryTmp,' Select printdate=getdate() ');
   lstPara.Add('printdate='+dataTmp.qryTmp.FieldByName('printdate').AsString);
   OpenSql(dataTmp.qryTmp,' select * from warefifo where jobnoout="'+data.qryLocationOut.FieldByName('jobno').AsString+'"');
   
   Worklinprint('900010','old','出库提货单',dataTmp.qryTmp,nil,nil,lstpara);
   dataTmp.qryTmp.First;
   WorkFillRmBb('100002',True,nil,dataTmp.qryTmp,lstPara,False);
end;

procedure TfrmLocationOut.mitpickinglistzdyClick(Sender: TObject);
var
   lstPara:Tstringlist;
begin

   OpenSql(dataTmp.qryTmp, ' select recordcount=count(1) from warefifo where jobnoout="'+data.qryLocationOut.FieldByName('jobno').AsString+'"');
   if dataTmp.qryTmp.FieldByName('recordcount').AsInteger>1 then
   begin
      KMessageDlg('该提货单已经打印过，请在《重打出库清单》的地方打印！',mtWarning,[mbOK],0);
      Exit;
   end;
   lstPara:=TStringList.Create;

   lstPara.Add('mainorder='+data.qrylocationout.FieldByName('mainorder').AsString);
   lstPara.Add('zdr='+_loginname);
   lstPara.Add('BarCodemainorder='+data.qryLocationOut.FieldByName('mainorder').AsString);
   OpenSql(dataTmp.qryTmp,' Select printdate=getdate() ');
   lstPara.Add('printdate='+dataTmp.qryTmp.FieldByName('printdate').AsString);
   OpenSql(dataTmp.qryTmp,' Exec ksp_stockupPLzdy '' and locationoutitem.jobno="'+data.qryLocationOut.FieldByName('jobno').AsString+'" ''');
   Worklinprint('900010','old','出库提货单',dataTmp.qryTmp,nil,nil,lstpara);
   dataTmp.qryTmp.First;
   WorkFillRmBb('100002',True,nil,dataTmp.qryTmp,lstPara,False);
end;
procedure TfrmLocationOut.mitoploadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="T"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryOut.FieldByname('jobno').AsString,'LO','T')
   else
      Workforkwork(data.qryOut.FieldByname('jobno').AsString,'-1','T');
end;
procedure TfrmLocationOut.mitopunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                         +'  and isnull(forktype,"F")="T"'
                         );
   if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
   begin
      if dataTmp.qryTmp.RecordCount=0 then
      begin
         KMessageDlg('该票业务还未进行库管工作量的分摊,不能删除！',mtWarning,[mbOK],0);
         Exit;
      end;
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的库管工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
      if KmessageDlg('是否取消库管工作量',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="T"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="T" '+chr(13)+chr(10)
                               );
         if dataTmp.qryTmp1.RecordCount=0 then
         begin
            KMessageDlg('该票业务库管工作量的分摊删除完成！',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   end else
   begin
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的库管工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '
                               +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '
                               +'   and isnull(forktype,"F")="T"'
                               );
   end;
end;


procedure TfrmLocationOut.mitcustomsClick(Sender: TObject);
begin
   pWorkFormDll('BASECODE',PChar('CUSTOMERPIC'+data.qryOut.FieldByName('costcusid').AsString),'STBROWSE');
end;

//  lzw 20080421
procedure TfrmLocationOut.mitoutsendClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstPara.Add('data='+datetostr(date));
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select detail.jobno,detail.skuname,item.skuspec,item.skumodel,  '+chr(13)+chr(10)
                         +'       year=substring(Convert(char(8),detail.OperationDate,112),1,4),'+chr(13)+chr(10)
                         +'       month=substring(Convert(char(8),detail.OperationDate,112),5,2),'+chr(13)+chr(10)
                         +'       day=substring(Convert(char(8),detail.OperationDate,112),7,2),'+chr(13)+chr(10)
                         +'       Quantity=item.Quantitytask, item.remark,detail.locname,item.locationbillno,   '+chr(13)+chr(10)
                         +'       QuantityUOM=item.QuantityUOM,jccusbillno=item.cusbillnoin,   '+chr(13)+chr(10)
                         +'       Quantityddtotal=(select quantity from wareordersku(nolock)     '+chr(13)+chr(10)
                         +'                         where wareordersku.jobno=item.jobnoorder) , '+chr(13)+chr(10)
                         +'       Quantitysy=(select sy=(isnull(quantity,0)-isnull(quantitytask,0)) from wareorderorisku (nolock)  '+chr(13)+chr(10)
                         +'                         where wareorderorisku.jobno=item.jobnoorder)  '+chr(13)+chr(10)
                         +'  from locationoutdetail detail(nolock) ,locationoutitem item(nolock)  '+chr(13)+chr(10)
                         +' where detail.jobno=item.jobno   '+chr(13)+chr(10)
                         +'   and detail.sno=item.sno      '+chr(13)+chr(10)
                         +'   and detail.JOBNO="'+data.qrylocationout.FieldByname('JOBNO').AsString+'" '+chr(13)+chr(10)
                         );
   lstPara.Add('locationbillno='+dataTmp.qryTmp.FieldByName('locationbillno').AsString);
   Worklinprint('900300','old','%出库发货单%',dataTmp.qryTmp,nil,nil,lstpara);

end;

function TfrmLocationOut.skuoutcontrol:boolean;
begin
   Result:=False;
   if (_StrSysCus='SWZ') and (data.qrylocationout.FieldByName('loacccheckname').AsString='') then
   begin
      //dwq 2009.03.06
      {opensql(dataTmp.qryTmp,'select 1                              '
                            +'  from locationinitem initem (nolock) '
                            +' where isnull(initem.costcusid,"")="'+data.qrylocationout.fieldbyname('costcusid').AsString+'" '
                            +'   and isnull(quantity,0)-isnull(quantitydotask,0)<>0                                 '
             );
      if dataTmp.qryTmp.RecordCount=0 then
      begin
         KmessageDlg('货物将全部出完,请确认余款全部收回才能完成出货!',mtInformation,[mbok],0);
         Exit;
      end;
      //lzw20090428  暂时把控制先取消
      OpenSql(dataTmp.qryTmp,'select skucost=convert(numeric(16,4),sum(case sku.legaluom when "quantity" then (isnull(initem.quantity,0)-isnull(initem.quantitydotask,0))*sku.pricein  '+chr(13)+chr(10)
                            +'                                      when "piece" then (isnull(initem.piece,0)-isnull(initem.piecedotask,0))*sku.pricein                                '+chr(13)+chr(10)
                            +'                                      when "volume" then (isnull(initem.volume,0)-isnull(initem.volumedotask,0))*sku.pricein                             '+chr(13)+chr(10)
                            +'                                      when "grossweight" then (isnull(initem.grossweight,0)-isnull(initem.grossweightdotask,0))*sku.pricein              '+chr(13)+chr(10)
                            +'                                      when "netweight" then (isnull(initem.netweight,0)-isnull(initem.netweightdotask,0))*sku.pricein                    '+chr(13)+chr(10)
                            +'                                      end))'+chr(13)+chr(10)
                            +'  from locationinitem initem (nolock)                  '+chr(13)+chr(10)
                            +'       left join sku (nolock)                          '+chr(13)+chr(10)
                            +'              on initem.skuid=sku.skuid                '+chr(13)+chr(10)
                            +' where isnull(initem.costcusid,"")="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"   '+chr(13)+chr(10)
             );
      OpenSql(dataTmp.qryTmp1,'select wfk=sum(isnull(costin,0))-sum(isnull(iocost,0))                                    '+chr(13)+chr(10)
                             +'  from costitem  (nolock)                                                                 '+chr(13)+chr(10)
                             +' where isnull(costcusid,"")="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"   '+chr(13)+chr(10)
             );
      if dataTmp.qryTmp.FieldByName('skucost').AsInteger<=2*dataTmp.qryTmp1.FieldByName('wfk').AsInteger then
      begin
         KmessageDlg('货物剩余货值小于2倍的未付款，请确认是否先收回余款后再出货!',mtInformation,[mbok],0);
         Exit;
      end;}
      //lzw2010114
      {opensql(dataTmp.qryTmp1,'select weightremain=sum(isnull(netweight,0))-sum(isnull(netweightdo,0)),item.costcusid,item.costcusname   '+chr(13)+chr(10)
                             +'  from locationinitem item(nolock) ,customer(nolock)                     '+chr(13)+chr(10)
                             +' where item.costcusid=customer.cusid       '+chr(13)+chr(10)
                             +'   and isnull(item.costcusid,"")="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"   '+chr(13)+chr(10)
                             +'   and isnull(customer.credit,0)<>0        '+chr(13)+chr(10)
                             +'having customer.credit>sum(isnull(netweight,0))-sum(isnull(netweightdo,0)) '+chr(13)+chr(10)
                             +' group by item.costcusid,item.costcusname   '+chr(13)+chr(10)
             );
      if dataTmp.qryTmp1.RecordCount>0 then
      begin
         KmessageDlg('库存小于该!',mtInformation,[mbok],0);
         Exit;
      end;}
      Result:=True;
   end else
      Result:=True;
end;
procedure TfrmLocationOut.mitcostforkworkClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data. qryOut.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="Z"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryOut.FieldByname('jobno').AsString,'LO','Z')
   else
      Workforkwork(data.qryOut.FieldByname('jobno').AsString,'-1','Z');
end;

procedure TfrmLocationOut.mitcanclecostClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="Z"'
          );
   if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
   begin
      if dataTmp.qryTmp.RecordCount=0 then
      begin
         KMessageDlg('该票业务还未进行装卸工人工作量的分摊,不能删除！',mtWarning,[mbOK],0);
         Exit;
      end;
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的装卸工人工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
      if KmessageDlg('是否取消装卸工人工作量',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Z"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Z" '+chr(13)+chr(10)
                               );
         if dataTmp.qryTmp1.RecordCount=0 then
         begin
            KMessageDlg('该票业务装卸工人工作量的分摊删除完成！',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   end else
   begin
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的装卸工人工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
         ExecSql(dataTmp.qryTmp,'delete from forkworkload '
                               +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="Z"'
                               );
   end;
end;

procedure TfrmLocationOut.btnapproveClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if _strsyscus='SWZ' THEN
   begin
      OpenSql(dataTmp.qryTmp1,'select taskcheckname,taskcheckdate from Locationout (nolock)'+chr(13)+chr(10)
                          +' where jobno="'+data.qrylocationOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                        );
      if dataTmp.qryTmp1.FieldByname('taskcheckname').AsString<>'' then
      begin
        KMessageDlg('该票业务已审批！',mtWarning,[mbOK],0);
        Exit;
      end;
      if _StrSysCus='SWZ' then
      begin
         execSql(datatmp.qryTmp,'update Locationout '
                      +'   set taskcheckname="'+_loginname+'",'
                      +'       taskcheckdate="'+datetostr(getserverdate)+'" '
                      +' where jobno="'+data.qrylocationOut.FieldByName('jobno').AsString+'"');
         btnRefreshClick(btnRefresh);
         OpenSql(dataTmp.qryTmp1,'select taskcheckname,taskcheckdate from Locationout (nolock)'+chr(13)+chr(10)
                                +' where jobno="'+data.qrylocationOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                           );
         if dataTmp.qryTmp1.FieldByname('taskcheckname').AsString<>'' then
         begin
            KMessageDlg('审批完成！',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   end;
   if _strsyscus='XT' then
   begin
      if data.qrylocationOut.FieldByName('operationname').AsString<>'' then
      begin
         kMessageDlg('该笔出仓单已经出货不能在扫描,请确认！', mtWarning, [mbOK], 0);
         Exit;
      end else
      begin
         Workoutdetailzx(data.qrylocationOut.fieldbyname('jobno').AsString);
      end;
   end;
end;

procedure TfrmLocationOut.mitchecklookClick(Sender: TObject);
begin
   workforkworkload(data.qryOut.FieldByname('locationbillno').AsString);
end;

procedure TfrmLocationOut.N14Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="Q"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryOut.FieldByname('jobno').AsString,'LO','Q')
   else
      Workforkwork(data.qryOut.FieldByname('jobno').AsString,'-1','Q');
end;

procedure TfrmLocationOut.N15Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '
                         +'  and isnull(forktype,"F")="Q"'
                         );
   if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
   begin
      if dataTmp.qryTmp.RecordCount=0 then
      begin
         KMessageDlg('该票业务还未进行其他工作量的分摊,不能删除！',mtWarning,[mbOK],0);
         Exit;
      end;
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的其他工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
      if KmessageDlg('是否取消其他工作量',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Q"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Q" '+chr(13)+chr(10)
                               );
         if dataTmp.qryTmp1.RecordCount=0 then
         begin
            KMessageDlg('该票业务其他工作量的分摊删除完成！',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   end else
   begin
      if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
         KMessageDlg('该票业务不是您分摊的其他工作量,不能删除！请联系系统管理员！',mtWarning,[mbOK],0)
      else
         ExecSql(dataTmp.qryTmp,'delete from forkworkload   '
                               +' where jobnoin="'+data.qryOut.FieldByName('jobno').AsString+'"  '
                               +'   and isnull(forktype,"F")="Q"'
                               );
                               
   end;
end;

procedure TfrmLocationOut.ItemDetailEdit1Click(Sender: TObject);
begin
   WorkOperation(stBrowse,data.qryOut.FieldByName('Jobno').AsString,
                          data.qryOut.FieldByName('UserID').AsString);
end;

procedure TfrmLocationOut.mitworkitemClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   OpenSql(dataTmp.qryTmp,'Select grossweight=sum(isnull(grossweight,0)),grossweightuom=Detail.weightuom,'+chr(13)+chr(10)
                         +'       skunamebb=Detail.skuname+isnull(sku.skumodel,"")+isnull(sku.skuspec,""), '+chr(13)+chr(10)
                         +'       netweight=sum(isnull(netweight,0)),'+chr(13)+chr(10)
                         +'       piece=sum(isnull(piece,0)),Detail.pieceuom,'+chr(13)+chr(10)
                         +'       quantity=sum(isnull(quantity,0)),'+chr(13)+chr(10)
                         +'       volume=sum(isnull(volume,0)) '+chr(13)+chr(10)
                         +'  from locationoutitem Detail(nolock) '+chr(13)+chr(10)
                         +'       left join sku                    '+chr(13)+chr(10)
                         +'              on Detail.skuid=sku.skuid  '+chr(13)+chr(10)
                         +' Where Detail.Jobno="'+data.qryOut.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         +' GROUP by Detail.skuname,sku.skumodel,sku.skuspec,Detail.weightuom,Detail.pieceuom '+chr(13)+chr(10)
                         );
   OpenSql(dataTmp.qryTmp1,'Select cuscname from customer(nolock),locationout(nolock)  '+chr(13)+chr(10)
                         +' Where customer.cusid=locationout.costcusid '+chr(13)+chr(10)
                         +'   and locationout.Jobno="'+data.qryOut.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         );
   lstPara.Add('cuscname='+dataTmp.qryTmp1.fieldbyname('cuscname').AsString);
   lstpara.Add('kdr='+_loginname);

   Worklinprint('100132','old','作业通知单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationOut.MenuItem2Click(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;

   lstPara:=TStringList.Create;
   if getSysdata('hxtext')='T' then
   begin
      //lzw20100126
      OpenSql(qryTmp,'select  *  from customer where cusid="'+data.qrylocationout.FieldByName('costcusid').AsString+'"');
      if qryTmp.FieldByName('istmp').AsString='T' then
      begin
         OpenSql(dataTmp.qrymain,'select locationout.jobno,locationout.cusbillno,locationout.locationbillno,locationout.remark, '+chr(13)+chr(10)
                                +'       taskdate=convert(char(10),locationout.taskdate,102),locationout.createname,'+chr(13)+chr(10)
                                +'       operationdate=convert(char(10),locationout.operationdate,102),locationout.Routing,   '+chr(13)+chr(10)
                                +'       cuscname=(select cuscname from customer(nolock) where locationout.costcusid=customer.cusid ), '+chr(13)+chr(10)
                                +'       locationout.carbrand    '+chr(13)+chr(10)
                                +'  from locationout (nolock)  '+chr(13)+chr(10)
                                +' where locationout.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '
                   );
         OpenSql(dataTmp.qrybb, 'select item.skuname,item.skuspec,item.skumodel,item.locname,  '+chr(13)+chr(10)
                               +'       item.piece,item.pieceuom,netweight=item.quantity,weightuom=item.quantityuom,'+chr(13)+chr(10)
                               +'       item.volume,item.volumeuom,   '+chr(13)+chr(10)
                               +'       item.area,item.areauom,item.locationbillnoin   '+chr(13)+chr(10)
                               +'  from locationoutitem item(nolock)  '+chr(13)+chr(10)
                               +' where item.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '
                   );
      end else
      begin
         OpenSql(dataTmp.qrymain,'select locationout.jobno,locationout.cusbillno,locationout.locationbillno,locationout.remark, '+chr(13)+chr(10)
                                +'       taskdate=convert(char(10),locationout.taskdate,102),locationout.createname,'+chr(13)+chr(10)
                                +'       operationdate=convert(char(10),locationout.operationdate,102),locationout.Routing,   '+chr(13)+chr(10)
                                +'       cuscname=(select cuscname from customer(nolock) where locationout.costcusid=customer.cusid ), '+chr(13)+chr(10)
                                +'       locationout.carbrand    '+chr(13)+chr(10)
                                +'  from locationout (nolock)  '+chr(13)+chr(10)
                                +' where locationout.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '
                   );
         OpenSql(dataTmp.qrybb, 'select item.skuname,item.skuspec,item.skumodel,item.locname,  '+chr(13)+chr(10)
                               +'       item.piece,item.pieceuom,item.grossweight,item.weightuom,   '+chr(13)+chr(10)
                               +'       item.volume,item.volumeuom,item.netweight,   '+chr(13)+chr(10)
                               +'       item.area,item.areauom,item.locationbillnoin   '+chr(13)+chr(10)
                               +'  from locationoutitem item(nolock)  '+chr(13)+chr(10)
                               +' where item.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '
                   );
      end;  
      WorkFillRmBb('900102',False,dataTmp.qrymain,dataTmp.qryBb,lstPara,True);
   end;

end;

procedure TfrmLocationOut.CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   strtask:string;
begin
   if not _weightcal then Exit;
   strtask:=pistask;
   with pqrySKU do
   begin
      if (strtask<>'ITEM') then
      begin
         //数量
         if (OldValue<>0) and blnBLJS then
           FieldByName('quantity'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                    *FieldByName('quantity'+strtask).AsFloat
                                                    /oldValue;
         //件数
         if (OldValue<>0) and blnBLJS then
           FieldByName('piece'+strtask).AsFloat:=FieldByName('NetWeight'+strtask).AsFloat
                                                *FieldByName('piece'+strtask).AsFloat
                                                /oldValue;
         //体积
         if (OldValue<>0) and blnBLJS then
               FieldByName('Volume'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                    *FieldByName('Volume'+strtask).AsFloat
                                                    /oldValue;
         //面积
         if (OldValue<>0) and blnBLJS then
           FieldByName('Area'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('Area'+strtask).AsFloat
                                                /oldValue;
         //毛重
         if (OldValue<>0) and blnBLJS then
           FieldByName('GrossWeight'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('GrossWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmLocationOut.CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   strtask:string;
begin
   if not _weightcal then Exit;
   strtask:=pistask;
   with pqrySKU do
   begin
      if (strtask<>'ITEM') then
      begin
         //数量
         if (OldValue<>0) and blnBLJS then
           FieldByName('quantity'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                    *FieldByName('quantity'+strtask).AsFloat
                                                    /oldValue;
         //件数
         if (OldValue<>0) and blnBLJS then
           FieldByName('piece'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('piece'+strtask).AsFloat
                                                /oldValue;

         //体积
         if (OldValue<>0) and blnBLJS then
               FieldByName('Volume'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                    *FieldByName('Volume'+strtask).AsFloat
                                                    /oldValue;
         //面积
         if (OldValue<>0) and blnBLJS then
           FieldByName('Area'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('Area'+strtask).AsFloat
                                                /oldValue;
         //毛重
         if (OldValue<>0) and blnBLJS then
           FieldByName('netWeight'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('netWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmLocationOut.GrossWeightDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _StrSysCus='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qrylocationoutdetail.FieldByName('GrossWeight').AsFloat;
         data.qrylocationoutdetail.Edit;
         data.qrylocationoutdetail.FieldByName('GrossWeight').AsFloat:=StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qrylocationoutdetail,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmLocationOut.NetWeightDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _StrSysCus='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qrylocationoutdetail.FieldByName('NetWeight').AsFloat;
         data.qrylocationoutdetail.Edit;
         data.qrylocationoutdetail.FieldByName('NetWeight').AsFloat:=StrToFloat(IIF(grdLocationOutDetail.InplaceEditor.GetEditingText='',0,grdLocationOutDetail.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qrylocationoutdetail,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmLocationOut.edtcusbillnoSearchExitCheck(Sender: TObject;
OldValue: Variant; var Failed: Boolean);
begin
   if DataState<>stbrowse then
       Exit;
    _qrymacroout:='';
    _qrymacroout:=' (isnull(inout.cusbillno,"") like "%'+edtcusbillnoSearch.Text+'%" or isnull(inout.locationbillno,"") like "%'+edtcusbillnoSearch.Text+'%") ';
    data.qryOut.MacroByName('where').AsString:=''''+_qrymacroout+'''';
    data.qryOut.Close;
    data.qryOut.Open;
end;

procedure TfrmLocationOut.pmCheckPopup(Sender: TObject);
begin
   if _StrSysCus='SHRL' then
   begin
      mitgetskucost.Visible:=False;
      mitsalescount.Visible:=False;
      mitcancelsales.Visible:=False;
      mitforkwork.Visible :=False;
      mitopload.Visible  :=False;
      mitopunload.Visible :=False;
      mitforkworkunload.Visible :=False;
      N14.Visible    :=False;
      N15.Visible  :=False;
      mitchecklook.Visible :=False;
   end;
end;
procedure TfrmLocationOut.mitOutsZClick(Sender: TObject);
var
   lstPara:TStringList;
   strsql:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstpara.Add('zdrq='+datetostr(GetServerDate));

   strsql:=' exec ksp_OutReady @jobno="'+data.qryOut.fieldbyname('jobno').AsString+'" '
                  ;
   dataTmp.qryTmp.Close;
   dataTmp.qryTmp.SQL.Clear;
   dataTmp.qryTmp.SQL.Add(strsql);
   dataTmp.qryTmp.Open;

   lstpara.Add('zdr='+_loginname);
   lstpara.Add('zdrq='+datetostr(GetServerDate));
   lstpara.Add('cusbillno='+dataTmp.qryTmp.FieldByname('cusbillno').AsString);
   lstpara.Add('operationdateout='+dataTmp.qryTmp.FieldByname('operationdateout').AsString);

   Worklinprint('900333','old','出货准备表',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.quantityshortitemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   //威扬
   if (_StrSysCus='SZWY') AND (data.qryLocationOutItem.FieldByName('quantityshort').AsInteger<>0) then
      data.qryLocationOutItem.FieldByName('casing5task').AsFloat:=Trunc(data.qryLocationOutItem.FieldByName('quantitytask').AsFloat/data.qryLocationOutItem.FieldByName('quantityshort').AsFloat);
end;

procedure TfrmLocationOut.ppmPrintPopup(Sender: TObject);
begin
   mitOutsZ.Visible:=_StrSysCus<>'SHRL';
end;
procedure TfrmLocationOut.timOperationDateDblClick(Sender: TObject);
begin
   if (DataState in Setdcs) and (_StrSysCus='SHRL') and (dtdOperationDate.Enabled=True) then
   begin
      if KmessageDlg('是否批量修改出货日期',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
         Exit;
         
      data.qryLocationOutItem.DisableControls;
      data.qryLocationOutDetail.DisableControls;
      data.qryLocationOutItem.First;
      while not data.qryLocationOutItem.Eof do
      begin
         data.qryLocationOutItem.Edit;
         data.qryLocationOutItem.FieldByName('operationdate').AsDateTime:=data.qryLocationOut.FieldByName('operationdate').AsDateTime;

         data.qryLocationOutDetail.Filtered:=False;
         if data.qryLocationOutItem.fieldbyname('SNO').AsString<>'' then
            data.qryLocationOutDetail.filter:='SNO='+data.qryLocationOutItem.fieldbyname('SNO').AsString
         else
            data.qryLocationOutDetail.filter:='SNO=-1';
         data.qryLocationOutDetail.Filtered:=True;

         data.qryLocationOutDetail.First;
         while not data.qryLocationOutDetail.Eof do
         begin
            data.qryLocationOutDetail.Edit;
            data.qryLocationOutDetail.FieldByName('operationdate').AsDateTime:=data.qryLocationOut.FieldByName('operationdate').AsDateTime;
            data.qryLocationOutDetail.Post;
            data.qryLocationOutDetail.Next;
         end;
         data.qryLocationOutItem.Post;
         data.qryLocationOutItem.Next;
      end;
      data.qryLocationOutItem.EnableControls;
      data.qryLocationOutDetail.EnableControls;
   end;
end;

procedure TfrmLocationOut.mitoutRFClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
   WorkRFintxt('OUT');
end;

procedure TfrmLocationOut.mitlocoutskuitemClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
   begin
      pgcMain.ActivePage:=tbsEdit ;
      pgcLocationINOUT.ActivePage:=tbsSKU;
   end;
   if (data.qrylocationout.FieldByName('OPERATIONNAME').AsString<>'') then
   begin
      kMessageDlg('该笔出仓已实际出货，请先取消出货!', mtWarning, [mbOK], 0);
      Exit;
   end;

   worklocoutitemsku(data.qrylocationout.FieldByName('jobno').AsString);
   btnRefresh.click;
end;

procedure TfrmLocationOut.mitoutinselectClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsBrowse then
   begin
      pgcMain.ActivePage:=tbsBrowse ;
   end;
   workoutinselect(data.qryOut.FieldByName('jobno').AsString);
end;

procedure TfrmLocationOut.mitckddhaClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));
   
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('createdate='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('createname='+data.qrylocationout.FieldByname('createname').AsString);

   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
      //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   //lzw20100907
   OpenSql(qryTmp,'select organization.* from organization (nolock)  '
                 +' where userid=substring("'+data.qrylocationout.FieldByname('userid').Asstring+'",1,3) '
                         );
   lstPara.Add('comcname='+qryTmp.fieldbyname('comcname').AsString);
   OpenSql(dataTmp.qryTmp,'      if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                         +'   where id=object_id("tempdb..#lskckd") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'    drop table #lskckd'+chr(13)+chr(10)
                         +'  select detail.jobno,sku.skumodel,sku.skuspec, '+chr(13)+chr(10)
                         +'         detail.lotcode,detail.skuname,            '+chr(13)+chr(10)
                         +'         locname=(select top 1 locname from location(nolock) where classid=substring((select classid from location where location.locid=detail.locid),1,12)) , '+chr(13)+chr(10)
                         +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                         +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                         +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                         +'         detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'         detail.locationBillNo  '+chr(13)+chr(10)
                         +'    into #lskckd                '+chr(13)+chr(10)
                         +'    from locationoutdetail detail (nolock) '+chr(13)+chr(10)
                         +'         left join sku (nolock)    '+chr(13)+chr(10)
                         +'                on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                         +'   where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         +'   group by detail.jobno,sku.skumodel,sku.skuspec,detail.lotcode,detail.skuname,  '+chr(13)+chr(10)
                         +'          detail.quantityuom,detail.pieceuom, detail.locid, '+chr(13)+chr(10)
                         +'          detail.weightuom,detail.locationbillno  '+chr(13)+chr(10)
                         +'  select skumodel,skuspec,lotcode,skuname,locname,  '+chr(13)+chr(10)
                         +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                         +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                         +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                         +'         detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'         detail.locationBillNo  '+chr(13)+chr(10)
                         +'    from #lskckd detail         '+chr(13)+chr(10)
                         +'   group by  skumodel,skuspec,detail.lotcode,detail.skuname,  '+chr(13)+chr(10)
                         +'          detail.quantityuom,detail.pieceuom, detail.locname, '+chr(13)+chr(10)
                         +'          detail.weightuom,detail.locationbillno  '+chr(13)+chr(10)
                         +'   order by detail.skuname,detail.locname  '+chr(13)+chr(10)
                                );
   //lzw20101026
   opensql(datatmp.qryTmp1,'select loc=quality from location(nolock)                                   '
                 +' where classid in (select substring(classid,1,12) from location(nolock)    '
                 +'           where locid in (select top 1 locid from locationoutdetail(nolock)'
                 +'                  where jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"))'
           );
   lstpara.Add('loc='+dataTmp.qryTmp1.FieldByname('loc').AsString);
   if (copy(_userid,0,3)='001') or (copy(_userid,0,3)='004' ) then
      Worklinprint('100005','old','出%库联系单',dataTmp.qryTmp,nil,nil,lstpara)
   else
      Worklinprint('900005','old','出%库联系单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.miticeClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));

   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('createdate='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('createname='+data.qrylocationout.FieldByname('createname').AsString);

   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
      //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   //lzw20100907
   OpenSql(qryTmp,'select organization.* from organization (nolock)  '
                 +' where userid=substring("'+data.qrylocationout.FieldByname('userid').Asstring+'",1,3) '
                         );
   lstPara.Add('comcname='+qryTmp.fieldbyname('comcname').AsString);
   OpenSql(dataTmp.qryTmp,'  select item.jobno,sku.skumodel,sku.skuspec,item.skuname,  '+chr(13)+chr(10)
                         +'         quantity=sum(isnull(item.quantity,0)),piece=sum(isnull(item.piece,0)),'+chr(13)+chr(10)
                         +'         item.quantityuom,item.pieceuom,'+chr(13)+chr(10)
                         +'         item.locationBillNo,item.price,skucost=sum(isnull(item.skucost,0)) '+chr(13)+chr(10)
                         +'    from locationoutitem item (nolock) '+chr(13)+chr(10)
                         +'         left join sku (nolock)    '+chr(13)+chr(10)
                         +'                on item.skuid=sku.skuid     '+chr(13)+chr(10)
                         +'   where item.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         +'   group by item.jobno,sku.skumodel,sku.skuspec,item.skuname,  '+chr(13)+chr(10)
                         +'         item.quantityuom,item.pieceuom,'+chr(13)+chr(10)
                         +'         item.locationBillNo,item.price '+chr(13)+chr(10)
                         +'   order by item.skuname  '+chr(13)+chr(10)
                  );

   lstPara.Add('skucost='+Num2BCMoney(dataTmp.qryTmp.FieldByName('skucost').AsFloat));

   Worklinprint('100103','old','%销售单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationOut.mitadjustClick(Sender: TObject);
begin
   execSql(dataTmp.qryTmp,'ksp_RFkcekun @jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '
                 );
end;

procedure TfrmLocationOut.mitcustomsccClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));
   
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('conno='+data.qrylocationout.FieldByname('conno').AsString);

   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstpara.Add('zbr='+_loginname);


   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
      //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   //lzw20100907
   OpenSql(qryTmp,'select organization.* from organization (nolock)  '
                 +' where userid=substring("'+data.qrylocationout.FieldByname('userid').Asstring+'",1,3) '
                         );
   lstPara.Add('comcname='+qryTmp.fieldbyname('comcname').AsString);
   OpenSql(dataTmp.qryTmp,'select detail.jobno,modelspec=isnull(sku.skuspec,"")+" "+isnull(sku.skumodel,""),sku.customERno,'+chr(13)+chr(10)
                         +'       detail.lotcode,detail.skuname, '+chr(13)+chr(10)
                         +'       quantity=cast (isnull(detail.quantity,0) as varchar)+""+detail.quantityuom,piece=isnull(detail.piece,0),'+chr(13)+chr(10)
                         +'       netweight=isnull(detail.netweight,0),grossweight=isnull(detail.grossweight,0),'+chr(13)+chr(10)
                         +'       price=isnull(detail.price,0),skucost=isnull(detail.skucost,0),  '+chr(13)+chr(10)
                         +'       detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'       detail.locationbillno,detail.currcd  '+chr(13)+chr(10)
                         +'  from locationoutdetail detail (nolock) '+chr(13)+chr(10)
                         +'       left join sku (nolock)    '+chr(13)+chr(10)
                         +'              on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                         +' where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                                );

   Worklinprint('100602','old','%审批单%',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationOut.MenuItem4Click(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday,stryeartask,strmonthtask,strdaytask:Word;
   strdate,strusername,strcache:string;
   strcustaskoract:string; //按客户的配置要求，可以自己选择打印任务还是实际
   //_SkuHB,_taskordetail:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara:=TStringList.Create;
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('username='+data.qrylocationout.FieldByname('username').AsString);
   strusername:=data.qrylocationout.FieldByname('username').AsString;
   lstpara.Add('taskdate='+copy(data.qrylocationout.FieldByname('taskdate').AsString,1,10));
   lstpara.Add('tasktime='+data.qrylocationout.FieldByname('taskdate').AsString);
   lstpara.Add('thetime='+copy(data.qrylocationout.FieldByname('taskdate').AsString,12,5));
   lstpara.Add('isbond='+data.qrylocationout.FieldByname('isbond').AsString);
   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('Locationbillno').AsString);
   lstpara.Add('Routing='+data.qrylocationout.FieldByname('Routing').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('PORTL='+data.qrylocationout.FieldByname('PORTL').AsString);
   lstpara.Add('PORTD='+data.qrylocationout.FieldByname('PORTD').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('Remark='+data.qrylocationout.FieldByname('Remark').AsString);
   lstpara.Add('condes='+data.qrylocationout.FieldByname('condes').AsString);
   lstpara.Add('opname='+data.qrylocationout.FieldByname('opname').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('cusname='+data.qrylocationout.FieldByname('cusname').Asstring);
   lstpara.Add('OPERATIONNAME='+data.qrylocationout.FieldByname('OPERATIONNAME').Asstring);
   lstPara.Add('CARBRAND='+data.qryLocationOut.FieldByname('CARBRAND').AsString);
   lstPara.Add('CARRIERNO='+data.qryLocationOut.FieldByname('CARRIERNO').AsString);
   lstpara.Add('carriercusname='+data.qryLocationOut.FieldByname('carriercusname').Asstring);
   lstpara.Add('carrierdate='+data.qrylocationout.FieldByname('carrierdate').AsString);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('iusername='+data.qrylocationout.FieldByname('iusername').AsString);
   lstpara.Add('createdate='+data.qrylocationout.FieldByname('createdate').AsString);
   lstpara.Add('checkname='+data.qrylocationout.FieldByname('checkname').AsString);
   lstpara.Add('createname='+data.qrylocationout.FieldByname('createname').AsString);
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstPara.Add('loadcosttype='+data.qryLocationOut.FieldByname('loadcosttype').AsString);
   //lzw20120229
   lstPara.Add('shippercusname='+data.qrylocationout.fieldByname('shippercusname').AsString);
   lstPara.Add('loacccheckname='+data.qrylocationout.fieldByname('loacccheckname').AsString);
   lstPara.Add('taskcheckname='+data.qrylocationout.fieldbyname('taskcheckname').AsString);
   //******* wzh.05.08.30  begin ********//
   lstpara.Add('quantity='+floattostr(data.qrylocationout.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qrylocationout.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qrylocationout.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qrylocationout.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qrylocationout.FieldByname('netweight').AsFloat));
   lstpara.Add('costcusname='+data.qrylocationout.FieldByname('costcusname').Asstring);
   lstpara.Add('shipcusname='+data.qrylocationout.FieldByname('shipcusname').Asstring);
   lstpara.Add('trans='+data.qrylocationout.FieldByname('TRANS').Asstring);
   DecodeDate(data.qrylocationout.FieldByname('OperationDate').AsDateTime,strYear,strMonth,strDay);
   //lzw20090731
   DecodeDate(data.qrylocationout.FieldByname('TASKDATE').AsDateTime,strYeartask,strMonthtask,strDaytask);

   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   lstpara.Add('oyear='+inttostr(stryear));
   lstpara.Add('omonth='+inttostr(strmonth));
   lstpara.Add('oday='+inttostr(strday));
   lstpara.Add('oyeartask='+inttostr(stryeartask));
   lstpara.Add('omonthtask='+inttostr(strmonthtask));
   lstpara.Add('odaytask='+inttostr(strdaytask));

   lstPara.Add('operationdate='+strdate);
   lstPara.Add('operationdate1='+copy(data.qrylocationout.FieldByname('OperationDate').AsString,1,10));

   lstPara.Add('loginname='+_Loginname);
   //
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qrylocationout.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);

   GenInformations(lstPara);
   OpenSql(dataTmp.qryTmp,'      if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                         +'   where id=object_id("tempdb..#lskvackd") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'    drop table #lskvackd'+chr(13)+chr(10)
                         +'  select detail.jobno,sku.skumodel,sku.skuspec, '+chr(13)+chr(10)
                         +'         detail.lotcode,detail.skuname, detail.costcusname,    '+chr(13)+chr(10)
                         +'         locname=(select top 1 locname from location(nolock) where classid=substring((select classid from location where location.locid=detail.locid),1,12)) , '+chr(13)+chr(10)
                         +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                         +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                         +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                         +'         detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'         detail.locationBillNo  '+chr(13)+chr(10)
                         +'    into #lskvackd                '+chr(13)+chr(10)
                         +'    from locationoutdetail detail (nolock) '+chr(13)+chr(10)
                         +'         left join sku (nolock)    '+chr(13)+chr(10)
                         +'                on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                         +'   where detail.jobno="'+data.qryout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         +'   group by detail.jobno,sku.skumodel,sku.skuspec,detail.lotcode,detail.skuname,  '+chr(13)+chr(10)
                         +'          detail.quantityuom,detail.pieceuom, detail.locid, '+chr(13)+chr(10)
                         +'          detail.weightuom,detail.locationbillno, detail.costcusname  '+chr(13)+chr(10)
                         +'  select skumodel,skuspec,lotcode,skuname,locname,  '+chr(13)+chr(10)
                         +'         quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                         +'         netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                         +'         volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                         +'         detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'         detail.locationBillNo,detail.costcusname  '+chr(13)+chr(10)
                         +'    from #lskvackd detail         '+chr(13)+chr(10)
                         +'   group by  skumodel,skuspec,detail.lotcode,detail.skuname,  '+chr(13)+chr(10)
                         +'          detail.quantityuom,detail.pieceuom, detail.locname, '+chr(13)+chr(10)
                         +'          detail.weightuom,detail.locationbillno,detail.costcusname  '+chr(13)+chr(10)
                         +'   order by detail.skuname,detail.locname  '+chr(13)+chr(10)
                                );
   lstpara.Add('quantity='+(dataTmp.qryTmp.FieldByname('quantity').AsString));
   lstpara.Add('piece='+(dataTmp.qryTmp.FieldByname('piece').AsString));
   lstpara.Add('volume='+(dataTmp.qryTmp.FieldByname('volume').AsString));
   lstpara.Add('grossweight='+(dataTmp.qryTmp.FieldByname('grossweight').AsString));
   lstpara.Add('netweight='+(dataTmp.qryTmp.FieldByname('netweight').AsString));

   //lzw20101026
   opensql(datatmp.qryTmp1,'select loc=quality from location(nolock)                                   '
                 +' where classid in (select substring(classid,1,12) from location(nolock)    '
                 +'           where locid in (select top 1 locid from locationoutdetail(nolock)'
                 +'                  where jobno="'+data.qryout.FieldByName('jobno').AsString+'"))'
           );
   lstpara.Add('loc='+dataTmp.qryTmp1.FieldByname('loc').AsString);
   Worklinprint('900005','old','出%库联系单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationOut.mitfzckmxdClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnorz,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationout.SelectedCount;
   strjobnorz:='';
   for i:=grdLocationout.SelectedCount-1 Downto 0 do
   begin
      data.qryout.GotoBookmark(Pointer(grdLocationout.SelectedRows[i]));
      begin
         if strjobnorz='' then strjobnorz:='"'+data.qryout.fieldbyname('jobno').AsString+'"'
         else strjobnorz:=strjobnorz+',"'+data.qryout.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnorz='' then
   begin
      KMessageDlg('未选中要打印的出仓单',mtWarning,[mbOK],0);
      Exit;
   end;

   try

      OpenSql(dataTmp.qryTmp,'ksp_fzckdout @jobno="",@fillter='' jobno in('+strjobnorz+') '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900036';
         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationOut.N4Click(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;

   lstpara.Add('locationbillno='+data.qrylocationout.FieldByname('locationbillno').AsString);
   lstpara.Add('remark='+data.qrylocationout.FieldByname('remark').AsString);
   lstpara.Add('costcusname='+data.qrylocationout.FieldByname('costcusname').AsString);
   lstpara.Add('carbrand='+data.qrylocationout.FieldByname('carbrand').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('carriercusname='+data.qrylocationout.FieldByname('carriercusname').AsString);
   OpenSql(dataTmp.qryTmp,'select top 1 operationtime=convert(varchar(10),locationout.operationdate,108), '
                         +'       operationdate=convert(varchar(10),locationout.operationdate,102)  '
                         +'  from locationout (nolock) '
                         +' where locationout.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   lstPara.Add('operationtime='+dataTmp.qryTmp.FieldByname('operationtime').AsString);
   lstpara.Add('operationdate='+dataTmp.qryTmp.FieldByname('operationdate').AsString);
   OpenSql(dataTmp.qryTmp,'select top 1 locationbillnoin=locationoutitem.locationbillnoin '
                         +'  from locationoutitem (nolock) '
                         +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   lstPara.Add('locationbillnoin='+dataTmp.qryTmp.FieldByname('locationbillnoin').AsString);
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select item.jobno,item.skuname,item.lotcode,item.skuspec,remarkitem=item.remark,             '+chr(13)+chr(10)
                         +'       item.piece,item.grossweight,item.volume,item.locname,item.locationbillnoin            '+chr(13)+chr(10)
                         +'  from locationoutitem item(nolock)                                                          '+chr(13)+chr(10)
                         +' where item.jobno="'+data.qrylocationout.FieldByname('jobno').AsString+'"                    '+chr(13)+chr(10)
                         );

   Worklinprint('900123','old','货物出仓单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.mitjgckdClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);

   DecodeDate(data.qrylocationout.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
    //出库编码
   OpenSql(dataTmp.qryTmp,' select convert(varchar(10),operationdate,112)+   '+chr(13)+chr(10)
                         +'        (select right(''0000''+convert(varchar,count(distinct(a.jobno))),4)     '+chr(13)+chr(10)
                         +'           from locationout a                                             '+chr(13)+chr(10)
                         +'          where a.operationdate<=locationout.operationdate                                 '+chr(13)+chr(10)
                         +'            and year(a.operationdate)=year(locationout.operationdate)        '+chr(13)+chr(10)
                         +'            and month(a.operationdate)=month(locationout.operationdate)       '+chr(13)+chr(10)
                         +'         )  as outno                           '+chr(13)+chr(10)
                         +'   from locationout (nolock)               '+chr(13)+chr(10)
                         +'  where locationout.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"    '+chr(13)+chr(10)
                         );
   lstPara.Add('outno='+dataTmp.qryTmp.FieldByname('outno').AsString);
   lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('conno='+data.qrylocationout.FieldByname('conno').AsString);
   lstpara.Add('carbrand='+data.qrylocationout.FieldByname('carbrand').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   OpenSql(dataTmp.qryTmp,'select sum(locationoutdetail.quantity) as quantityall,                                                     '+chr(13)+chr(10)
                         +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutdetail.quantity,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0         '+chr(13)+chr(10)
                         +'                    else ceiling(isnull(locationoutdetail.quantity,0)/cast(sku.piecepro as numeric(16,0))) end )                            '+chr(13)+chr(10)
                         +'  from locationoutdetail(nolock)                                                                                                     '+chr(13)+chr(10)
                         +'       left join sku(nolock)                                                                                                         '+chr(13)+chr(10)
                         +'              on sku.skuid=locationoutdetail.skuid                                                                                     '+chr(13)+chr(10)
                         +' where locationoutdetail.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"                                               '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   lstPara.Add('pieceall='+dataTmp.qryTmp.FieldByname('pieceall').AsString);
   GenInformations(lstPara);

   OpenSql(qryTmp,'select locationoutdetail.mainorderin,locationoutdetail.cusname,locationoutdetail.shippercusname,locationoutdetail.skuname,                                      '+chr(13)+chr(10)                 +'        sku.skuspec,sku.pieceuom,sku.quantityuom,sku.customno,locationoutdetail.manufacturedate,          '+chr(13)+chr(10)                 +'        piece=case when sku.piecepro is null then ""                                                       '+chr(13)+chr(10)                 +'              else (case when isnull(cast(FLOOR(isnull(locationoutdetail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                 +'              else cast(FLOOR(isnull(locationoutdetail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                           '+chr(13)+chr(10)
                 +'              +case when  isnull((cast(isnull(locationoutdetail.quantity,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(locationoutdetail.quantity,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                        '+chr(13)+chr(10)                 +'        piece2=case when sku.piecepro is null then 0                                                                               '+chr(13)+chr(10)                 +'                 else ceiling(isnull(locationoutdetail.quantity,0)/cast(sku.piecepro as numeric(16,0)))  end,          '+chr(13)+chr(10)                 +'       locationoutdetail.skumodel,sku.customerno,locationoutdetail.quantity,locationoutdetail.locname,locationoutdetail.volume,locationoutdetail.remark                                '+chr(13)+chr(10)                 +'  from locationoutdetail (nolock)                                                          '+chr(13)+chr(10)
                 +'                  left join sku(nolock)                                                  '+chr(13)+chr(10)                 +'                         on locationoutdetail.skuid=sku.skuid                              '+chr(13)+chr(10)                 +' where locationoutdetail.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"     '+chr(13)+chr(10)                  );

   Worklinprint('101019','old','嘉功出库清单',qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOut.mitjgckplanClick(Sender: TObject);
var
   lstPara:TStringList;
   strfilter:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
    lstpara.Add('customsno='+data.qrylocationout.FieldByname('customsno').AsString);
   lstpara.Add('blno='+data.qrylocationout.FieldByname('blno').AsString);
   lstpara.Add('conno='+data.qrylocationout.FieldByname('conno').AsString);
   lstpara.Add('carbrand='+data.qrylocationout.FieldByname('carbrand').AsString);
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   {OpenSql(dataTmp.qryTmp,'select sum(locationoutitem.quantitytask) as quantityall                                                     '+chr(13)+chr(10)
                         +'  from locationoutitem  (nolock)                                                       '+chr(13)+chr(10)
                         +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp1,'select pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0         '+chr(13)+chr(10)
                          +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end )                            '+chr(13)+chr(10)
                          +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                                '+chr(13)+chr(10)
                          +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                          +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"        '+chr(13)+chr(10)
                          );
   lstPara.Add('pieceall='+dataTmp.qryTmp1.FieldByname('pieceall').AsString);}

   OpenSql(dataTmp.qryTmp1,'if exists(select * from tempdb..sysobjects                                 '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                          +'     drop table #lsk2                                                      '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                               '+chr(13)+chr(10)
                          +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0        '+chr(13)+chr(10)
                          +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end                         '+chr(13)+chr(10)
                          +'  into #lsk2                                                                                                                                  '+chr(13)+chr(10)
                          +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                          +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                          +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
                          +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select sum (quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
                         );
   lstPara.Add('pieceall='+dataTmp.qryTmp1.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp1.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                         +'       syquantityall=isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                                      '+chr(13)+chr(10)
                         +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)        '+chr(13)+chr(10)
                         +'                       where locationoutitem.mainorder=wareorderorisku.mainorder )                              '+chr(13)+chr(10)
                         +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                         +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByName('mainorder').AsString+'"                 '+chr(13)+chr(10)
                         +'group by wareorderorisku.mainorder                                                                             '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall2='+dataTmp.qryTmp.FieldByname('quantityall2').AsString);
   lstPara.Add('syquantityall='+dataTmp.qryTmp.FieldByname('syquantityall').AsString);
   GenInformations(lstPara);

   strfilter:='';
   if KmessageDlg('是否打印全部备货清单？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
   begin
      strfilter:=' and isnull(locationoutitem.NotFullSign,"F")<>"T" ';
   end;

   OpenSql(dataTmp.qryTmp,' select top 1 jobnoorder            '+chr(13)+chr(10)                         +'   from locationoutitem  (nolock)                                                       '+chr(13)+chr(10)
                         +'  where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)
                         +'    and isnull(locationoutitem.jobnoorder,"")<>""                                       '+chr(13)+chr(10)
                         );

   OpenSql(qryTmp,  ' if exists (select * from tempdb..sysobjects  '+chr(13)+chr(10)                     +'             where id = object_id("tempdb..#lskbhqd") and sysstat & 0xf = 3)  '+chr(13)+chr(10)
                     +'      drop table #lskbhqd  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' select xh=IDENTITY(int,1,1) ,  '+chr(13)+chr(10)
                     +'        wareorderorisku.jobno,wareorderorisku.sno,  '+chr(13)+chr(10)
                     +'        quantityori=wareorderorisku.quantity,b.customno,b.skumodel,b.skuspec,  '+chr(13)+chr(10)
                     +'        wareordersku.cusname,wareorderorisku.shippercusname,  '+chr(13)+chr(10)
                     +'        wareorderorisku.skuname,wareorderorisku.remark,  '+chr(13)+chr(10)
                     +'        b.piecepro,b.pieceuom,wareordersku.manufacturedate,  '+chr(13)+chr(10)
                     +'        syquantity=isnull(wareorderorisku.quantity,0)-  '+chr(13)+chr(10)
                     +'                    isnull((select sum(isnull(quantity,0))  '+chr(13)+chr(10)
                     +'                       from wareordersku  '+chr(13)+chr(10)
                     +'                      where wareorderorisku.jobno=wareordersku.jobno  '+chr(13)+chr(10)
                     +'                        and wareorderorisku.sno=wareordersku.oriskusno ),0),  '+chr(13)+chr(10)
                     +'        lotcode=isnull(wareordersku.lotcode,""),    '+chr(13)+chr(10)
                     +'        wareordersku.quantity,  '+chr(13)+chr(10)
                     +'        customerno=case when isnull(wareordersku.locname,"")="" then a.customerno else b.customerno end ,  '+chr(13)+chr(10)
                     +'        piece=case when b.piecepro is null then ""  '+chr(13)+chr(10)
                     +'              else (case when isnull(cast(FLOOR(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""  '+chr(13)+chr(10)
                     +'              else cast(FLOOR(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) as varchar(10))+a.pieceuom end  '+chr(13)+chr(10)
                     +'              +case when  isnull((cast(isnull(wareordersku.quantity,0) as int)%cast(isnull(b.piecepro,0) as int)),0)=0 then  ""  '+chr(13)+chr(10)
                     +'              else cast(cast(isnull(wareordersku.quantity,0) as int)%cast(b.piecepro as int) as varchar(10))+a.quantityuom end ) end ,     '+chr(13)+chr(10)
                     +'        piece2=case when b.piecepro is null then 0                                                                               '+chr(13)+chr(10)
                     +'                 else ceiling(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) end,          '+chr(13)+chr(10)
                     +'        locname=case when isnull(wareordersku.locname,"")="" then "无料"  else wareordersku.locname end , '+chr(13)+chr(10)
                     +'        sign=case when(locationoutitem.NotFullSign="T") then "已备货" else "未备货" end   '+chr(13)+chr(10)
                     +'   into #lskbhqd                           '+chr(13)+chr(10)
                     +'   from wareorderorisku (nolock)           '+chr(13)+chr(10)
                     +'        left join sku  a(nolock)                                                                  '+chr(13)+chr(10)
                     +'               on wareorderorisku.skuid=a.skuid                                                   '+chr(13)+chr(10)
                     +'        left join wareordersku(nolock)                                                            '+chr(13)+chr(10)
                     +'                  left join locationoutitem(nolock)                                               '+chr(13)+chr(10)
                     +'                         on locationoutitem.jobnoorder=wareordersku.jobno                         '+chr(13)+chr(10)
                     +'                        and locationoutitem.snoorder=wareordersku.sno                             '+chr(13)+chr(10)
                     +'                  left join sku  b(nolock)                                                        '+chr(13)+chr(10)
                     +'                         on wareordersku.skuid=b.skuid                                            '+chr(13)+chr(10)
                     +'               on wareorderorisku.jobno=wareordersku.jobno                                        '+chr(13)+chr(10)
                     +'              and wareorderorisku.sno=wareordersku.oriskusno                                      '+chr(13)+chr(10)
                     +'  where wareorderorisku.mainorder="'+data.qrylocationout.FieldByName('mainorder').AsString+'"     '+chr(13)+chr(10)
                     +strfilter
                     +'  order by wareorderorisku.mainorder,wareorderorisku.sno,wareorderorisku.jobno                    '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare @jobno varchar(20),  '+chr(13)+chr(10)
                     +'         @sno int,  '+chr(13)+chr(10)
                     +'         @xh  int  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare @jobnoold varchar(20),  '+chr(13)+chr(10)
                     +'         @snoold int  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'  select @jobnoold="",@sno=-1  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare bhqd_Cursor cursor For  '+chr(13)+chr(10)
                     +'  select jobno,sno,xh  '+chr(13)+chr(10)
                     +'    from #lskbhqd  '+chr(13)+chr(10)
                     +'   order by jobno,sno  '+chr(13)+chr(10)
                     +'    Open bhqd_Cursor  '+chr(13)+chr(10)
                     +' Fetch next from bhqd_Cursor into @jobno,@sno,@xh  '+chr(13)+chr(10)
                     +' while @@Fetch_Status=0  '+chr(13)+chr(10)
                     +' begin  '+chr(13)+chr(10)
                     +'    if @jobnoold=@jobno and @snoold=@sno  '+chr(13)+chr(10)
                     +'    begin  '+chr(13)+chr(10)
                     +'       update #lskbhqd  '+chr(13)+chr(10)
                     +'          set shippercusname="",syquantity=null,customerno="",quantityori=null,remark=""  '+chr(13)+chr(10)
                     +'        where xh=@xh  '+chr(13)+chr(10)
                     +'    end  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'    select @jobnoold=@jobno,@snoold=@sno  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'    Fetch next from bhqd_Cursor into @jobno,@sno,@xh  '+chr(13)+chr(10)
                     +' end  '+chr(13)+chr(10)
                     +' close bhqd_Cursor  '+chr(13)+chr(10)
                     +' DEALLOCATE bhqd_Cursor  '+chr(13)+chr(10)
                     +' select * from #lskbhqd  '+chr(13)+chr(10)
                     +'   drop table #lskbhqd  '+chr(13)+chr(10)
                      );
   Worklinprint('101020','old','嘉功出仓备货清单',qryTmp,nil,nil,lstpara);

   EXECSQL(dataTmp.qryTmp,'update locationout set printed="已打印"                                          '+chr(13)+chr(10)
                         +'where locationout.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                        );
   frmLocationOut.btnRefreshClick(nil);
end;



procedure TfrmLocationOut.mitBHClick(Sender: TObject);
var
  i:integer;
begin
   for i:=grdLocationOutItem.SelectedCount-1 Downto 0 do
   begin
      data.qryLocationOutitem.GotoBookmark(Pointer(grdLocationOutItem.SelectedRows[i]));
      execSql(datatmp.qryTmp,'update LocationOutItem  '
                            +'   set NotFullSign="T"  '
                            +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
                            +'    and sno="'+data.qryLocationOutitem.fieldbyname('sno').AsString+'"'
              );
   end;
   execSql(datatmp.qryTmp,'update LocationOut  '
                         +'   set bhstate="1" '
                         +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
//                         +'    and exists (select 1 from LocationOutItem where LocationOutItem.jobno=LocationOut.jobno and isnull(LocationOutItem.NotFullSign,"F")="F"  ) '
           );
   execSql(datatmp.qryTmp,'update LocationOut  '
                         +'   set bhstate="2" ,stockup="F" '    //lihl 2012.03.19
                         +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
                         +'    and not exists (select 1 from LocationOutItem where LocationOutItem.jobno=LocationOut.jobno and isnull(LocationOutItem.NotFullSign,"F")="F"  ) '
           );

   btnRefreshClick(btnRefresh);
end;

procedure TfrmLocationOut.mitQXBHClick(Sender: TObject);
var
  i:integer;
begin
   data.qryLocationOutItem.DisableControls;
   for i:=grdLocationOutItem.SelectedCount-1 Downto 0 do
   begin
      data.qryLocationOutitem.GotoBookmark(Pointer(grdLocationOutItem.SelectedRows[i]));
      execSql(datatmp.qryTmp,'update LocationOutItem  '
                            +'   set NotFullSign="F"  '
                            +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
                            +'    and sno="'+data.qryLocationOutitem.fieldbyname('sno').AsString+'"'
              );
   end;
   data.qryLocationOutItem.enableControls;
   execSql(datatmp.qryTmp,'update LocationOut  '
                         +'   set bhstate="0"  '
                         +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
//                         +'    and not exists (select 1 from LocationOutItem  '
//                         +' where LocationOutItem.jobno=LocationOut.jobno       '
//                         +'   and isnull(LocationOutItem.NotFullSign,"F")="T"  ) '
           );
   execSql(datatmp.qryTmp,'update LocationOut  '
                         +'   set bhstate="1", stockup="T" '
                         +'  where jobno="'+data.qryLocationOutitem.fieldbyname('jobno').AsString+'"'
                         +'    and exists (select 1 from LocationOutItem where LocationOutItem.jobno=LocationOut.jobno and isnull(LocationOutItem.NotFullSign,"F")="T"  ) '
           );
   btnRefreshClick(btnRefresh);
end;

procedure TfrmLocationOut.qhqdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;

   opensql(datatmp.qrytmp,'select wareorderorisku.sno ,wareorderorisku.shippercusname,wareorderorisku.cusname,  '+chr(13)+chr(10)
                         +'       wareorderorisku.skuname,  locationoutitem.mainorder,                  '+chr(13)+chr(10)
                         +'       wareorderorisku.jobno,sku.customerno,quantityplan=isnull(wareorderorisku.quantity,0),  '+chr(13)+chr(10)
                         +'       quantity=isnull(sum(locationoutitem.quantitytask),0)                       '+chr(13)+chr(10)
                         +'  from wareorderorisku(nolock)                                                        '+chr(13)+chr(10)
                         +'       left join sku(nolock)                                                          '+chr(13)+chr(10)
                         +'              on sku.skuid=wareorderorisku.skuid                                      '+chr(13)+chr(10)
                         +'       left join locationoutitem(nolock)                                              '+chr(13)+chr(10)
                         +'              on locationoutitem.jobnoorder=wareorderorisku.jobno                     '+chr(13)+chr(10)
                         +'             and locationoutitem.snoori=wareorderorisku.sno                            '+chr(13)+chr(10)
                         +' where wareorderorisku.jobno="'+data.qryLocationOutitem.fieldbyname('jobnoorder').AsString+'" '+chr(13)+chr(10)
                         +' group by wareorderorisku.shippercusname,wareorderorisku.cusname, wareorderorisku.skuname,    '+chr(13)+chr(10)
                         +'          wareorderorisku.jobno,sku.customerno,wareorderorisku.quantity,wareorderorisku.sno,  '+chr(13)+chr(10)
                         +'           locationoutitem.mainorder                                                          '+chr(13)+chr(10)
                         +' having (isnull(wareorderorisku.quantity,0))<>sum(isnull(locationoutitem.quantitytask,0))     '+chr(13)+chr(10) );
   lstpara.Add('mainorder='+data.qryLocationout.fieldbyname('mainorder').AsString);
   lstpara.Add('routing='+data.qryLocationOut.fieldbyname('routing').AsString);
   lstpara.Add('zdr='+_loginname);
   lstPara.Add('zdrq='+datetostr(GetServerDate));
   Worklinprint('100404','old','指令缺货记录',dataTmp.qryTmp,nil,nil,lstpara);  //lhl
end;

procedure TfrmLocationOut.mitoutidClick(Sender: TObject);
begin
   if (data.qryout.FieldByName('outid').AsString='T') or
      (data.qryout.FieldByName('operationdate').AsString<>'') then
   begin
      KMessageDlg('该笔商品已准备出货或已出货',mtInformation,[mbOk],0);
      Exit;
   end else
   begin
      execSql(datatmp.qryTmp,'update LocationOut '+chr(13)+chr(10)
                            +'   set outid="T"   '+chr(13)+chr(10)
                            +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
      btnRefreshClick(sender);
   end;
end;

procedure TfrmLocationOut.plantableClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;

   OpenSql(dataTmp.qryTmp,'select taskdateall=convert(varchar(10),min(taskdate),102)+"~"+convert(varchar(10),max(taskdate),102)  '+chr(13)+chr(10)
                         +'  from locationout(nolock)                       '+chr(13)+chr(10)
                         +' where month(taskdate)=month(getdate())          '+chr(13)+chr(10)
                         +'   and year(taskdate)=year(getdate())            '+chr(13)+chr(10)
                         );
   lstPara.Add('taskdateall='+dataTmp.qryTmp.FieldByname('taskdateall').AsString);

   GenInformations(lstPara);

   opensql(datatmp.qrytmp,' select mainorder=isnull(mainorder,""),routing=isnull(routing,""),corpno=isnull(corpno,""),    '+chr(13)+chr(10)
                         +'        destorder=isnull(destorder,""),cusbillno=isnull(cusbillno,""),                         '+chr(13)+chr(10)
	                 +'        finishdate=isnull(convert(varchar(10),conloaddate,102),""),                            '+chr(13)+chr(10)
	                 +' 	     bhstate=case when isnull(bhstate,"0")="0" then "未备货" when isnull(bhstate,"0")="1" then "备货中" else "已备货" end ,    '+chr(13)+chr(10)
		         +'        quantityall=(select isnull(sum(isnull(locationoutitem.quantitytask,0)),0)              '+chr(13)+chr(10)
			 +'                     from locationoutitem(nolock)                                              '+chr(13)+chr(10)
                         +'                      where locationoutitem.jobno=locationout.jobno ),                         '+chr(13)+chr(10)
		         +'        bhquantity=(select isnull(sum(isnull(locationoutitem.quantitytask,0)),0)               '+chr(13)+chr(10)
			 +'                    from locationoutitem(nolock)                                               '+chr(13)+chr(10)
                         +'                   where locationoutitem.jobno=locationout.jobno                               '+chr(13)+chr(10)
			 +'                     and locationoutitem.notfullsign="T"),                                     '+chr(13)+chr(10)
	                 +'        notbhquantity=(select isnull(sum(isnull(locationoutitem.quantitytask,0)),0)            '+chr(13)+chr(10)
                         +'                       from locationoutitem(nolock)                                            '+chr(13)+chr(10)
			 +'                      where locationoutitem.jobno=locationout.jobno                            '+chr(13)+chr(10)
			 +'                        and locationoutitem.notfullsign<>"T"),                                 '+chr(13)+chr(10)
		         +'        operationdate=isnull(convert(varchar(10),operationdate,102),"")                        '+chr(13)+chr(10)
                         +'   from locationout(nolock)                  '+chr(13)+chr(10)
                         +'  where year(taskdate)=year(getdate())       '+chr(13)+chr(10)
                         +'    and month(taskdate)=month(getdate())     '+chr(13)+chr(10)
                         +'    and userid like "'+_Userid+'%"           '+chr(13)+chr(10)
                         +'  order by taskdate                          '+chr(13)+chr(10)
                         );

   Worklinprint('101022','old','计划分析表',dataTmp.qryTmp,nil,nil,lstpara);  //lhl
end;

procedure TfrmLocationOut.bbczqdClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
    workoutprint(data.qrylocationout.fieldbyname('jobno').AsString);
end;

procedure TfrmLocationOut.mitcancleoutClick(Sender: TObject);
begin
   if (data.qryout.FieldByName('outid').AsString<>'T') or
      (data.qryout.FieldByName('operationdate').AsString<>'') then
   begin
      KMessageDlg('该笔商品未准备出货或已出货',mtInformation,[mbOk],0);
      Exit;
   end else
   begin
      execSql(datatmp.qryTmp,'update LocationOut '+chr(13)+chr(10)
                            +'   set outid="F"   '+chr(13)+chr(10)
                            +' where jobno="'+data.qryout.fieldbyname('jobno').AsString+'"');
      btnRefreshClick(sender);
   end;
end;

procedure TfrmLocationOut.bhqdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TstringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   opensql(dataTmp.qryTmp,'if exists(select * from tempdb..sysobjects      '+chr(13)+chr(10)
           +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)  '+chr(13)+chr(10)
           +'     drop table #lsk2  '+chr(13)+chr(10)
           +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),   '+chr(13)+chr(10)
           +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0   '+chr(13)+chr(10)
           +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end  '+chr(13)+chr(10)
           +'  into #lsk2                        '+chr(13)+chr(10)
           +'  from locationoutitem(nolock)      '+chr(13)+chr(10)
           +'       left join sku(nolock)        '+chr(13)+chr(10)
           +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
           +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
           +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
           +' select sum(quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
            );
   lstPara.Add('pieceall='+dataTmp.qryTmp.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   OpenSql(dataTmp.qryTmp1,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)),       '+chr(13)+chr(10)
                          +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-        '+chr(13)+chr(10)
                          +'           (select isnull(sum(isnull(locationoutitem.quantitytask,0)),0) from locationoutitem(nolock)      '+chr(13)+chr(10)
                          +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)      '+chr(13)+chr(10)
                          +'  from wareorderorisku(nolock)  '+chr(13)+chr(10)
                          +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByname('mainorder').AsString+'"  '+chr(13)+chr(10)
                          +' group by wareorderorisku.mainorder       '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall2='+dataTmp.qryTmp1.FieldByname('quantityall2').AsString);
   lstPara.Add('syquantityall='+dataTmp.qryTmp1.FieldByname('syquantityall').AsString);
   GenInformations(lstPara);
   OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                 +'       piece=case when sku.piecepro is null then ""          '+chr(13)+chr(10)                 +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/       '+chr(13)+chr(10)
                 +'                    cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""        '+chr(13)+chr(10)
                 +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/                         '+chr(13)+chr(10)
                 +'                   cast(sku.piecepro as numeric(16,0))) as varchar(10))+locationoutitem.pieceuom end       '+chr(13)+chr(10)
                 +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%                     '+chr(13)+chr(10)
                 +'                    cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                                     '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+locationoutitem.quantityuom end ) end , '+chr(13)+chr(10)
                 +'       piece2=case when sku.piecepro is null then 0                                                                    '+chr(13)+chr(10)                 +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,       '+chr(13)+chr(10)                 +'       sku.quantityuom,sku.pieceuom,sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,""),     '+chr(13)+chr(10)                 +'       detail.manufacturedate,sign=case when locationoutitem.quantitytask=detail.quantity-detail.quantitydo then ""  else "分拣" end          '+chr(13)+chr(10)
                 +'  from locationoutitem(nolock)                                                         '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                                           '+chr(13)+chr(10)                 +'              on sku.skuid=locationoutitem.skuid                                       '+chr(13)+chr(10)                 +'       left join locationindetail detail(nolock)                                       '+chr(13)+chr(10)                 +'              on locationoutitem.jobnoin = detail.jobno                                '+chr(13)+chr(10)                 +'             and  locationoutitem.snoin = detail.sno                                   '+chr(13)+chr(10)                 +'             and locationoutitem.snolocin = detail.ldsno                               '+chr(13)+chr(10)                 +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)                 +' order by locationoutitem.locname                                                      '+chr(13)+chr(10)
                 );

   Worklinprint('101003','old','嘉功备货清单',qryTmp,nil,nil,lstpara);  //lhl   20120508
end;

procedure TfrmLocationOut.djkbhqdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TstringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
    OpenSql(dataTmp.qryTmp,'if exists(select * from tempdb..sysobjects                                 '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                          +'     drop table #lsk2                                                      '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                               '+chr(13)+chr(10)
                          +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0        '+chr(13)+chr(10)
                          +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end                         '+chr(13)+chr(10)
                          +'  into #lsk2                                                                                                                                  '+chr(13)+chr(10)
                          +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                          +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                          +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
                          +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select sum (quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
                         );
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   lstPara.Add('pieceall='+dataTmp.qryTmp.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp1,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                          +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                               '+chr(13)+chr(10)
                          +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)        '+chr(13)+chr(10)
                          +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                        '+chr(13)+chr(10)
                          +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                          +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByname('mainorder').AsString+'"                 '+chr(13)+chr(10)
                          +' group by wareorderorisku.mainorder                                                                          '+chr(13)+chr(10)
                           );
   lstPara.Add('quantityall2='+dataTmp.qryTmp1.FieldByname('quantityall2').AsString);
   lstPara.Add('syquantityall='+dataTmp.qryTmp1.FieldByname('syquantityall').AsString);
   GenInformations(lstPara);
   OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                 +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                 +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                 +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                           '+chr(13)+chr(10)
                 +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                        '+chr(13)+chr(10)                 +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                 +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,                                             '+chr(13)+chr(10)                 +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                 +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                 +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                 +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"                  '+chr(13)+chr(10)                 +' group by locationoutitem.sno,locationoutitem.lotcode,locationoutitem.cusname,                        '+chr(13)+chr(10)
                 +'       locationoutitem.locname,locationoutitem.skuname,sku.piecepro,sku.customerno,                   '+chr(13)+chr(10)
                 +'       locationoutitem.quantitytask,locationoutitem.remark,sku.quantityuom,sku.pieceuom               '+chr(13)+chr(10)
                 +'having locname like "%-1" or locname like "%-2" or locname like "%-6" or locname like "%-7"           '+chr(13)+chr(10)
                 +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                  );
   Worklinprint('101008','old','低架库备货清单',qryTmp,nil,nil,lstpara);  //lhl   20120508
end;

procedure TfrmLocationOut.gjkbhqdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TstringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
    OpenSql(dataTmp.qryTmp,'if exists(select * from tempdb..sysobjects                                 '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                          +'     drop table #lsk2                                                      '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                               '+chr(13)+chr(10)
                          +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0        '+chr(13)+chr(10)
                          +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end                         '+chr(13)+chr(10)
                          +'  into #lsk2                                                                                                                                  '+chr(13)+chr(10)
                          +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                          +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                          +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
                          +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select sum (quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
                         );
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   lstPara.Add('pieceall='+dataTmp.qryTmp.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp1,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                          +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                               '+chr(13)+chr(10)
                          +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)        '+chr(13)+chr(10)
                          +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                        '+chr(13)+chr(10)
                          +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                          +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByname('mainorder').AsString+'"                 '+chr(13)+chr(10)
                          +' group by wareorderorisku.mainorder                                                                          '+chr(13)+chr(10)
                           );
   lstPara.Add('quantityall2='+dataTmp.qryTmp1.FieldByname('quantityall2').AsString);
   lstPara.Add('syquantityall='+dataTmp.qryTmp1.FieldByname('syquantityall').AsString);
   GenInformations(lstPara);
   OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                 +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                 +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                 +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom  end                           '+chr(13)+chr(10)
                 +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                        '+chr(13)+chr(10)                 +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                 +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,                                             '+chr(13)+chr(10)                 +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                 +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                 +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                 +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"                  '+chr(13)+chr(10)                 +' group by locationoutitem.sno,locationoutitem.lotcode,locationoutitem.cusname,                        '+chr(13)+chr(10)
                 +'       locationoutitem.locname,locationoutitem.skuname,sku.piecepro,sku.customerno,                   '+chr(13)+chr(10)
                 +'       locationoutitem.quantitytask,locationoutitem.remark ,sku.quantityuom,sku.pieceuom              '+chr(13)+chr(10)
                 +'having locname like "%-3" or locname like "%-4" or locname like "%-5" or locname like "%-8" or locname like "%-9" or locname like "%-10"           '+chr(13)+chr(10)
                 +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                  );
   Worklinprint('101009','old','高架库备货清单',qryTmp,nil,nil,lstpara);  //lhl   20120508
end;

procedure TfrmLocationOut.wbhqdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TstringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   OpenSql(dataTmp.qryTmp,'if exists(select * from tempdb..sysobjects                                 '+chr(13)+chr(10)
                         +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                         +'     drop table #lsk2                                                      '+chr(13)+chr(10)
                         +''+chr(13)+chr(10)
                         +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                               '+chr(13)+chr(10)
                         +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0        '+chr(13)+chr(10)
                         +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end                         '+chr(13)+chr(10)
                         +'  into #lsk2                                                                                                                                  '+chr(13)+chr(10)
                         +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                         +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                         +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                         +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
                         +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
                         +''+chr(13)+chr(10)
                         +'select sum (quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
                         );
   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   lstPara.Add('pieceall='+dataTmp.qryTmp.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp1,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                          +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                               '+chr(13)+chr(10)
                          +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)        '+chr(13)+chr(10)
                          +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                        '+chr(13)+chr(10)
                          +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                          +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByname('mainorder').AsString+'"                 '+chr(13)+chr(10)
                          +' group by wareorderorisku.mainorder                                                                          '+chr(13)+chr(10)
                           );
   lstPara.Add('quantityall2='+dataTmp.qryTmp1.FieldByname('quantityall2').AsString);
   lstPara.Add('syquantityall='+dataTmp.qryTmp1.FieldByname('syquantityall').AsString);
   GenInformations(lstPara);
   OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                 +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                 +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                 +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                           '+chr(13)+chr(10)
                 +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                        '+chr(13)+chr(10)                 +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                 +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)))  end,                                              '+chr(13)+chr(10)                 +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                 +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                 +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                 +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"                  '+chr(13)+chr(10)                 +'   and isnull(locationoutitem.NotFullSign,"F")<>"T"                                                   '+chr(13)+chr(10)
                 +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                );
   Worklinprint('101010','old','未备货清单',qryTmp,nil,nil,lstpara);  //lhl   20120508

end;

procedure TfrmLocationOut.checkoutClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara.Add('costcusname='+data.qrylocationout.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationout.FieldByname('mainorder').AsString);
   lstpara.Add('cusbillno='+data.qrylocationout.FieldByname('cusbillno').AsString);
   lstpara.Add('destorder='+data.qrylocationout.FieldByname('destorder').AsString);
   lstpara.Add('corpno='+data.qrylocationout.FieldByname('corpno').AsString);
   lstpara.Add('routing='+data.qrylocationout.FieldByname('routing').AsString);
   lstpara.Add('uploaddate='+data.qrylocationout.FieldByname('conloaddate').AsString);
   lstpara.Add('originorder='+data.qrylocationout.FieldByname('originorder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));

   OpenSql(dataTmp.qryTmp1,'if exists(select * from tempdb..sysobjects                                 '+chr(13)+chr(10)
                          +'    where id=object_id("tempdb..#lsk2") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                          +'     drop table #lsk2                                                      '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                               '+chr(13)+chr(10)
                          +'       pieceall=case when isnull(ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))),0)=0 then  0        '+chr(13)+chr(10)
                          +'                    else ceiling(sum(isnull(locationoutitem.quantitytask,0))/cast(sku.piecepro as numeric(16,0))) end                         '+chr(13)+chr(10)
                          +'  into #lsk2                                                                                                                                  '+chr(13)+chr(10)
                          +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                          +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                          +' where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"       '+chr(13)+chr(10)
                          +'group by locationoutitem.skuname,sku.piecepro,locationoutitem.jobno                        '+chr(13)+chr(10)
                          +''+chr(13)+chr(10)
                          +'select sum (quantityall) as quantityall,sum(pieceall) as pieceall from #lsk2               '+chr(13)+chr(10)
                         );
   lstPara.Add('pieceall='+dataTmp.qryTmp1.FieldByname('pieceall').AsString);
   lstPara.Add('quantityall='+dataTmp.qryTmp1.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp,'select quantityall2=sum(isnull(wareorderorisku.quantity,0))                                                  '+chr(13)+chr(10)
                         +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                         +' where wareorderorisku.mainorder="'+data.qrylocationout.FieldByName('mainorder').AsString+'"                 '+chr(13)+chr(10)
                         +'group by wareorderorisku.mainorder '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall2='+dataTmp.qryTmp.FieldByname('quantityall2').AsString);

   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,' select top 1 jobnoorder            '+chr(13)+chr(10)                         +'   from locationoutitem  (nolock)                                                       '+chr(13)+chr(10)
                         +'  where locationoutitem.jobno="'+data.qrylocationout.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)
                         +'    and isnull(locationoutitem.jobnoorder,"")<>""                                       '+chr(13)+chr(10)
                         );
   OpenSql(qryTmp,  ' if exists (select * from tempdb..sysobjects  '+chr(13)+chr(10)                     +'             where id = object_id("tempdb..#lskbhqd") and sysstat & 0xf = 3)  '+chr(13)+chr(10)
                     +'      drop table #lskbhqd  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' select xh=IDENTITY(int,1,1) ,  '+chr(13)+chr(10)
                     +'        wareorderorisku.jobno,wareorderorisku.sno,  '+chr(13)+chr(10)
                     +'        quantityori=wareorderorisku.quantity,b.customno,b.skumodel,b.skuspec,   '+chr(13)+chr(10)
                     +'        wareordersku.cusname,wareorderorisku.shippercusname,  '+chr(13)+chr(10)
                     +'        wareorderorisku.skuname,wareorderorisku.remark,  '+chr(13)+chr(10)
                     +'        b.piecepro,b.pieceuom, '+chr(13)+chr(10)
                     +'        syquantity=isnull(wareorderorisku.quantity,0)-  '+chr(13)+chr(10)
                     +'                    isnull((select sum(isnull(quantity,0))  '+chr(13)+chr(10)
                     +'                       from wareordersku  '+chr(13)+chr(10)
                     +'                      where wareorderorisku.jobno=wareordersku.jobno  '+chr(13)+chr(10)
                     +'                        and wareorderorisku.sno=wareordersku.oriskusno ),0),  '+chr(13)+chr(10)
                     +'        lotcode=isnull(wareordersku.lotcode,""),    '+chr(13)+chr(10)
                     +'        wareordersku.quantity,wareordersku.manufacturedate,  '+chr(13)+chr(10)
                     +'        customerno=case when isnull(wareordersku.locname,"")="" then a.customerno else b.customerno end ,  '+chr(13)+chr(10)
                     +'        piece=case when b.piecepro is null then ""  '+chr(13)+chr(10)
                     +'              else (case when isnull(cast(FLOOR(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""  '+chr(13)+chr(10)
                     +'              else cast(FLOOR(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) as varchar(10))+a.pieceuom end  '+chr(13)+chr(10)
                     +'              +case when  isnull((cast(isnull(wareordersku.quantity,0) as int)%cast(isnull(b.piecepro,0) as int)),0)=0 then  ""  '+chr(13)+chr(10)
                     +'              else cast(cast(isnull(wareordersku.quantity,0) as int)%cast(b.piecepro as int) as varchar(10))+a.quantityuom end ) end ,     '+chr(13)+chr(10)
                     +'        piece2=case when b.piecepro is null then 0                                                                               '+chr(13)+chr(10)
                     +'                 else ceiling(isnull(wareordersku.quantity,0)/cast(b.piecepro as numeric(16,0))) end,          '+chr(13)+chr(10)
                     +'        locname=case when isnull(wareordersku.locname,"")="" then "无料"  else wareordersku.locname end , '+chr(13)+chr(10)
                     +'        sign=case when(locationoutitem.NotFullSign="T") then "已备货" else "未备货" end   '+chr(13)+chr(10)
                     +'   into #lskbhqd                           '+chr(13)+chr(10)
                     +'   from wareorderorisku (nolock)           '+chr(13)+chr(10)
                     +'        left join sku  a(nolock)                                                                  '+chr(13)+chr(10)
                     +'               on wareorderorisku.skuid=a.skuid                                                   '+chr(13)+chr(10)
                     +'        left join wareordersku(nolock)                                                            '+chr(13)+chr(10)
                     +'                  left join locationoutitem(nolock)                                               '+chr(13)+chr(10)
                     +'                         on locationoutitem.jobnoorder=wareordersku.jobno                         '+chr(13)+chr(10)
                     +'                        and locationoutitem.snoorder=wareordersku.sno                             '+chr(13)+chr(10)
                     +'                  left join sku  b(nolock)                                                        '+chr(13)+chr(10)
                     +'                         on wareordersku.skuid=b.skuid                                            '+chr(13)+chr(10)
                     +'               on wareorderorisku.jobno=wareordersku.jobno                                        '+chr(13)+chr(10)
                     +'              and wareorderorisku.sno=wareordersku.oriskusno                                      '+chr(13)+chr(10)
                     +'  where wareorderorisku.mainorder="'+data.qrylocationout.FieldByName('mainorder').AsString+'"     '+chr(13)+chr(10)
                     +'    and  isnull(wareordersku.locname,"")<>""                                                      '+chr(13)+chr(10)
                     +'  order by wareorderorisku.mainorder,wareorderorisku.sno,wareorderorisku.jobno                    '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare @jobno varchar(20),  '+chr(13)+chr(10)
                     +'         @sno int,  '+chr(13)+chr(10)
                     +'         @xh  int  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare @jobnoold varchar(20),  '+chr(13)+chr(10)
                     +'         @snoold int  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'  select @jobnoold="",@sno=-1  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +' declare bhqd_Cursor cursor For  '+chr(13)+chr(10)
                     +'  select jobno,sno,xh  '+chr(13)+chr(10)
                     +'    from #lskbhqd  '+chr(13)+chr(10)
                     +'   order by jobno,sno  '+chr(13)+chr(10)
                     +'    Open bhqd_Cursor  '+chr(13)+chr(10)
                     +' Fetch next from bhqd_Cursor into @jobno,@sno,@xh  '+chr(13)+chr(10)
                     +' while @@Fetch_Status=0  '+chr(13)+chr(10)
                     +' begin  '+chr(13)+chr(10)
                     +'    if @jobnoold=@jobno and @snoold=@sno  '+chr(13)+chr(10)
                     +'    begin  '+chr(13)+chr(10)
                     +'       update #lskbhqd  '+chr(13)+chr(10)
                     +'          set shippercusname="",syquantity=null,customerno="",quantityori=null,remark=""  '+chr(13)+chr(10)
                     +'        where xh=@xh  '+chr(13)+chr(10)
                     +'    end  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'    select @jobnoold=@jobno,@snoold=@sno  '+chr(13)+chr(10)
                     +'  '+chr(13)+chr(10)
                     +'    Fetch next from bhqd_Cursor into @jobno,@sno,@xh  '+chr(13)+chr(10)
                     +' end  '+chr(13)+chr(10)
                     +' close bhqd_Cursor  '+chr(13)+chr(10)
                     +' DEALLOCATE bhqd_Cursor  '+chr(13)+chr(10)
                     +' select * from #lskbhqd  '+chr(13)+chr(10)
                     +'   drop table #lskbhqd  '+chr(13)+chr(10)
                      );
   Worklinprint('101024','old','嘉功仓库货物出仓核对清单',qryTmp,nil,nil,lstpara);
   //lihl 20120523
end;
function TfrmLocationOut.GetLocationbillNoin:String;
var
   StrDate:String;
   StrCusInvo:String;
begin
   decodedate(Now,Year,Month,Day);//分解当前日期
   OpenSql(datatmp.qryTmp,' select AutoBillNo=isnull(AutoBillNo,"F"),IsYear=isnull(IsYear,"F"), '
                 +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                 +'        LastNum,ishelpnojc=rtrim(isnull(ishelpnojc,"")) '
                 +'   from organization (nolock)  '
                 +'  where userid="'+_userid+'" ');
   if datatmp.qryTmp.FieldByName('AutoBillNo').AsString='T' then
   begin
      StrCusInvo:='';
      StrCusInvo:=datatmp.qryTmp.FieldByName('ishelpnojc').AsString;
      if datatmp.qryTmp.FieldByName('IsYear').AsString='T' then
         StrCusInvo:=StrCusInvo+IntToStr(Year);
      if datatmp.qryTmp.FieldByName('IsMonth').AsString='T' then
         StrCusInvo:=StrCusInvo+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month));
      if datatmp.qryTmp.FieldByName('IsDay').AsString='T' then
         StrCusInvo:=StrCusInvo+iif(day<10,'0'+IntToStr(day),IntToStr(day));
      opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(docno1,'+IntToStr(length(StrCusInvo)+1)+','+datatmp.qryTmp.FieldByName('LastNum').AsString+')),0)+1 '
                     +'  from genjobno (nolock) '
                     +' where docno1 like "%'+StrCusInvo+'%"  '
                     );
      Result:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,datatmp.qryTmp.FieldByName('LastNum').AsInteger,'0',psLeft);
   end else
   begin
       opensql(datatmp.qryTmp,
               'select dhcx=max(convert(int,substring(docno1,7,8))) '
              +'  from genjobno '
              +' where substring(docno1,1,2)="JC"  '
              +'       and substring(jobno,5,2)="LI"  '
              +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
//       data.qryLocationin.FieldByName('LocationBillNO').Asstring:='JC'+copy(datetostr(GetServerDate),1,4)
//                                                               +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
      Result:='JC'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   end;
end;
end.


