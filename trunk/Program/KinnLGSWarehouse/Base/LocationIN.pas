
unit LocationIN;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, DBTables, KUpdateSql, DB, KinQuery, dxEdLib, RXSplit, KSText,
  dxDBTLCl, dxGrClms, dxExEdtr, dxDBELib, KGroupBox, DBCtrls, ComCtrls,
  frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls, GMSLabel, dxTL,
  dxDBCtrl, dxDBGrid, dxPageControl,  KBitBtn, DbButtons, ExtCtrls,KDataSetProvider,libproc,
  DBClient, Dialogs;

type
    TfrmLocationIN = class(TForm)
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
    grdLocationIN: TdxDBGrid;
    TASKDATE: TdxDBGridColumn;
    LocationBillNO: TdxDBGridColumn;
    SKUNAME: TdxDBGridColumn;
    quantitytasked: TdxDBGridColumn;
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
    ppmSKUTask: TPopupMenu;
    mitSKUSelect: TMenuItem;
    mitOrderSKUSelect: TMenuItem;
    CONDescription: TdxDBGridColumn;
    btnTotal: TKBitBtn;
    ppmTotal: TPopupMenu;
    mitSplit: TMenuItem;
    tbsAutoCost: TdxTabSheet;
    grdAutoCost: TdxDBGrid;
    GMSStickyLabel12: TGMSStickyLabel;
    cmbWareRentcountType: TKinDbPickEdit;
    N2: TMenuItem;
    ppmLocationINItem: TPopupMenu;
    CustomsNO: TdxDBGridColumn;
    ppmPrint: TPopupMenu;
    mitLIOout: TMenuItem;
    mitDetail_OUT: TMenuItem;
    mitItem_OUT: TMenuItem;
    CreateUserName: TdxDBGridColumn;
    N5: TMenuItem;
    mitQuantityRemain: TMenuItem;
    shippercusname: TdxDBGridColumn;
    btnOper: TKBitBtn;
    GMSStickyLabel4: TGMSStickyLabel;
    cmbCountWho: TKinDbPickEdit;
    Piece: TdxDBGridColumn;
    mitSkuDetailItem: TMenuItem;
    OPERATIONNAME: TdxDBGridColumn;
    KGroupBox12: TKGroupBox;
    memremark: TdxDBMemo;
    isbond: TdxDBGridColumn;
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
    CusBillno: TdxDBGridColumn;
    grdLocationINDetail: TdxDBGrid;
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
    mitRelocation: TMenuItem;
    NotFullSignDetail: TdxDBGridCheckColumn;
    N14: TMenuItem;
    TASKDATEsj: TdxDBGridColumn;
    LoadCostType: TdxDBGridColumn;
    mitaccount: TMenuItem;
    btnCost: TKBitBtn;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel49: TGMSStickyLabel;
    gmsBillNO: TGMSStickyLabel;
    GMSStickyLabel50: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    gmsConDescription: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel35: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel27: TGMSStickyLabel;
    cmbConsignAccountID: TdxDBButtonEdit;
    cmbCarrierAccountID: TdxDBButtonEdit;
    edtOPID: TdxDBButtonEdit;
    edtBlNO: TdxDBEdit;
    edtCARRIERNO: TdxDBEdit;
    edtTotalCost: TdxDBCalcEdit;
    edtConQuantityTotal: TdxDBCalcEdit;
    edtOriginOrder: TdxDBEdit;
    edtDestOrder: TdxDBEdit;
    edtMainOrder: TdxDBEdit;
    edtETSH: TdxDBDateEdit;
    timETSH: TdxDBTimeEdit;
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
    rateuomtypeCost: TdxDBGridKinPickColumn;
    uom5Detail: TdxDBGridPickColumn;
    grpinfobar: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    ItemTaskEdit: TKBitBtn;
    ItemDetailEdit: TKBitBtn;
    Bevel6: TBevel;
    LDSNODetail: TdxDBGridColumn;
    quantityremaindetail: TdxDBGridColumn;
    pieceremaindetail: TdxDBGridColumn;
    tbsCasing: TdxTabSheet;
    grdcasing: TdxDBGrid;
    snocasing: TdxDBGridColumn;
    SkuNameCasing: TdxDBGridColumn;
    PriceInCasing: TdxDBGridCurrencyColumn;
    SkuCostInCasing: TdxDBGridCurrencyColumn;
    PieceCasing: TdxDBGridCurrencyColumn;
    QuantityCasing: TdxDBGridCurrencyColumn;
    VolumeCasing: TdxDBGridCurrencyColumn;
    ShipperCusNameCasing: TdxDBGridButtonColumn;
    shipcusnameCasing: TdxDBGridButtonColumn;
    AreaTaskCasing: TdxDBGridCurrencyColumn;
    GrossWeightCasing: TdxDBGridCurrencyColumn;
    NetWeightCasing: TdxDBGridCurrencyColumn;
    QualityNameCasing: TdxDBGridButtonColumn;
    OperationDateCasing: TdxDBGridDateColumn;
    QuantityUomCasing: TdxDBGridPickColumn;
    PieceUomCasing: TdxDBGridPickColumn;
    VolumeUomCasing: TdxDBGridPickColumn;
    WeightUomCasing: TdxDBGridPickColumn;
    AreaUomCasing: TdxDBGridPickColumn;
    RemarkCasing: TdxDBGridBlobColumn;
    CurrcdCasing: TdxDBGridPickColumn;
    KGroupBox4: TKGroupBox;
    btnAddLocItem: TKBitBtn;
    mitItemClear: TKBitBtn;
    btnMerge: TKBitBtn;
    btndelLocINItem: TKBitBtn;
    mitcasing: TKBitBtn;
    KGroupBox5: TKGroupBox;
    btnAddLocationINOUTDetail: TKBitBtn;
    btnDelLocationINOUTDetail: TKBitBtn;
    mitdetailclear: TKBitBtn;
    mitAddLocItem: TMenuItem;
    mitdelLocINItem: TMenuItem;
    mitDelLocationINOUTDetail: TMenuItem;
    btnDelDetail: TKBitBtn;
    mitCheckOne: TMenuItem;
    mitCancelOne: TMenuItem;
    N4: TMenuItem;
    ppmCasing: TPopupMenu;
    delCasing: TMenuItem;
    rdgLoadType: TKDBRadioGroup;
    edtconno: TdxDBBlobEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    edtConDescription: TdxDBBlobEdit;
    dtdcarrierdate: TdxDBDateEdit;
    tmtcarrierdate: TdxDBTimeEdit;
    GMSStickyLabel24: TGMSStickyLabel;
    cmbLoadCostType: TKinDbPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    edtRouting: TdxDBBlobEdit;
    dtdconloaddate: TdxDBDateEdit;
    tmtconloaddate: TdxDBTimeEdit;
    GMSStickyLabel28: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCountName: TdxDBEdit;
    edtCheckName: TdxDBEdit;
    edtOperationName: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    edtCostCHECKNAME: TdxDBEdit;
    GMSStickyLabel29: TGMSStickyLabel;
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
    conditiondescCasing: TdxDBGridColumn;
    lotcodeCasing: TdxDBGridColumn;
    costuomtypecasing: TdxDBGridKinPickColumn;
    ConnoCasing: TdxDBGridColumn;
    mitAddLocationINOUTDetail: TMenuItem;
    mitAddAutoCost: TMenuItem;
    mitUpdAutoCost: TMenuItem;
    mitDelAutoCost: TMenuItem;
    N1: TMenuItem;
    grdCountway: TdxDBGridPickColumn;
    btnCostRate: TKBitBtn;
    edtCustomsNO: TdxDBEdit;
    gmsCustomsNO: TGMSStickyLabel;
    edtcorpno: TdxDBEdit;
    GMSStickyLabel33: TGMSStickyLabel;
    corpno: TdxDBGridColumn;
    mitinware: TMenuItem;
    mitalterskupro: TMenuItem;
    NetWeight: TdxDBGridColumn;
    GrossWeight: TdxDBGridColumn;
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    mitfzrkd: TMenuItem;
    cusname: TdxDBGridColumn;
    pmMain: TPopupMenu;
    mitCheckMany: TMenuItem;
    mitCancelMany: TMenuItem;
    mainorder: TdxDBGridColumn;
    ppmLoc: TPopupMenu;
    mitLocInfoSel: TMenuItem;
    mitAutoLocSel: TMenuItem;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    GMSStickyLabel31: TGMSStickyLabel;
    mitmullocid: TMenuItem;
    mitMullUp: TMenuItem;
    Skuwtve: TdxDBGridCurrencyColumn;
    cmbCususername: TKinDbPickEdit;
    GMSStickyLabel32: TGMSStickyLabel;
    mitFromFiles: TMenuItem;
    costquantityDetail: TdxDBGridCurrencyColumn;
    costquantityuomDetail: TdxDBGridPickColumn;
    costquantity: TdxDBGridColumn;
    costquantityed: TdxDBGridColumn;
    edttaskcheckname: TdxDBEdit;
    GMSStickyLabel34: TGMSStickyLabel;
    mittaskcheck: TMenuItem;
    mitConcelTask: TMenuItem;
    taskcheckname: TdxDBGridColumn;
    N8: TMenuItem;
    mitItemTask_Order: TMenuItem;
    edtcarbrand: TdxDBBlobEdit;
    btnopid: TKBitBtn;
    mitcountsales: TMenuItem;
    btnHS: TKBitBtn;
    edtconno1: TdxDBEdit;
    edtcarbrand1: TdxDBEdit;
    mitgetskucost: TMenuItem;
    mitcancelsales: TMenuItem;
    mitxshwjcd: TMenuItem;
    conno: TdxDBGridColumn;
    Routing: TdxDBGridColumn;
    mitforkworkload: TMenuItem;
    ckbcountrentout: TdxDBCheckEdit;
    mitforkworkunload: TMenuItem;
    mitDocbookPic: TMenuItem;
    dxDBCheckEdit2: TdxDBCheckEdit;
    mitinoutquery: TMenuItem;
    quantitysldetail: TdxDBGridColumn;
    quantityshortdetai: TdxDBGridColumn;
    skumodeldetail: TdxDBGridColumn;
    skuspecdetail: TdxDBGridColumn;
    remarkdetail: TdxDBGridColumn;
    blno: TdxDBGridColumn;
    grdcustomsno: TdxDBGridColumn;
    ppmPrintqd: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem5: TMenuItem;
    ckbistrade: TdxDBCheckEdit;
    GMSStickyLabel37: TGMSStickyLabel;
    edttransway: TdxDBEdit;
    grdshipcusname: TdxDBGridColumn;
    mitprinttallysheet: TMenuItem;
    mitprinttallysheet1: TMenuItem;
    edtbrokenmark: TdxDBBlobEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    ckbisbroken: TdxDBCheckEdit;
    cmbwarerentcounttypeout: TKinDbPickEdit;
    GMSStickyLabel38: TGMSStickyLabel;
    carbrandmain: TdxDBGridColumn;
    checkdate: TdxDBGridColumn;
    mitopload: TMenuItem;
    mitopunload: TMenuItem;
    mitlocinitemsku: TMenuItem;
    mitcustomspic: TMenuItem;
    mitinloc: TMenuItem;
    manudatestringdetail: TdxDBGridPickColumn;
    mitupdate: TMenuItem;
    heightdetail: TdxDBGridCurrencyColumn;
    mitcostforkwork: TMenuItem;
    mitcanclecost: TMenuItem;
    btncheckdetail: TKBitBtn;
    customernodetail: TdxDBGridColumn;
    mitchecklook: TMenuItem;
    qryTmp1: TKADOQuery;
    edtmincostin: TdxDBCalcEdit;
    GMSStickyLabel39: TGMSStickyLabel;
    cmbbusinesstype: TKinDbPickEdit;
    GMSStickyLabel40: TGMSStickyLabel;
    N9: TMenuItem;
    N10: TMenuItem;
    mitdelcount: TMenuItem;
    mitworkitem: TMenuItem;
    GMSStickyLabel41: TGMSStickyLabel;
    edtInspectionNo: TdxDBEdit;
    ppmhxtext: TPopupMenu;
    mitprintitem: TMenuItem;
    mitWYFQ: TMenuItem;
    edtcusbillnoSearch: TdxEdit;

    grdLocationINItem: TdxDBGrid;
    snoItem: TdxDBGridCurrencyColumn;
    NotFullSignItem: TdxDBGridCheckColumn;
    mainorderItem: TdxDBGridColumn;
    CostCusidItem: TdxDBGridButtonColumn;
    ShippercusNameItem: TdxDBGridButtonColumn;
    ShipcusNameItem: TdxDBGridButtonColumn;
    cusNameItem: TdxDBGridButtonColumn;
    locitem: TdxDBGridButtonColumn;
    SKUNameItem: TdxDBGridButtonColumn;
    customernoItem: TdxDBGridColumn;
    skuspecitem: TdxDBGridColumn;
    skumodelitem: TdxDBGridColumn;
    coloritem: TdxDBGridColumn;
    LotCodeItem: TdxDBGridColumn;
    QualityNameItem: TdxDBGridButtonColumn;
    QuantitytaskItem: TdxDBGridCurrencyColumn;
    QuantityItem: TdxDBGridCurrencyColumn;
    ConditionDescItem: TdxDBGridColumn;
    ManufactureDateItem: TdxDBGridDateColumn;
    manudatestringitem: TdxDBGridPickColumn;
    QuantityUOMItem: TdxDBGridPickColumn;
    piecetaskItem: TdxDBGridCurrencyColumn;
    PieceItem: TdxDBGridCurrencyColumn;
    pieceuomItem: TdxDBGridPickColumn;
    VolumetaskItem: TdxDBGridCurrencyColumn;
    VolumeItem: TdxDBGridCurrencyColumn;
    VolumeUOMItem: TdxDBGridPickColumn;
    areataskItem: TdxDBGridCurrencyColumn;
    areaItem: TdxDBGridCurrencyColumn;
    AreaUOMItem: TdxDBGridPickColumn;
    grossweighttaskItem: TdxDBGridCurrencyColumn;
    GrossWeightItem: TdxDBGridCurrencyColumn;
    netweighttaskItem: TdxDBGridCurrencyColumn;
    NetWeightItem: TdxDBGridCurrencyColumn;
    WeightUOMItem: TdxDBGridPickColumn;
    tallycusiditem: TdxDBGridButtonColumn;
    loadgroupcusnameItem: TdxDBGridButtonColumn;
    forkgroupcusnameItem: TdxDBGridButtonColumn;
    liftmachinecusnameItem: TdxDBGridButtonColumn;
    TagTotalItem: TdxDBGridCurrencyColumn;
    TagEachUOMItem: TdxDBGridPickColumn;
    CostUOMTypeItem: TdxDBGridKinPickColumn;
    priceItem: TdxDBGridCurrencyColumn;
    skucostItem: TdxDBGridCurrencyColumn;
    priceinIItem: TdxDBGridCurrencyColumn;
    skucostinItem: TdxDBGridCurrencyColumn;
    currcdItem: TdxDBGridPickColumn;
    casing1taskItem: TdxDBGridCurrencyColumn;
    casing1Item: TdxDBGridCurrencyColumn;
    uom1Item: TdxDBGridPickColumn;
    casing2taskItem: TdxDBGridCurrencyColumn;
    casing2Item: TdxDBGridCurrencyColumn;
    uom2Item: TdxDBGridPickColumn;
    casing3taskItem: TdxDBGridCurrencyColumn;
    casing3Item: TdxDBGridCurrencyColumn;
    uom3Item: TdxDBGridPickColumn;
    casing4taskItem: TdxDBGridCurrencyColumn;
    casing4Item: TdxDBGridCurrencyColumn;
    uom4Item: TdxDBGridPickColumn;
    casing5taskItem: TdxDBGridCurrencyColumn;
    casing5Item: TdxDBGridCurrencyColumn;
    uom5item: TdxDBGridPickColumn;
    rentcountuomtypeItem: TdxDBGridKinPickColumn;
    rentcountuomtypeoutItem: TdxDBGridKinPickColumn;
    quantityremaintask: TdxDBGridColumn;
    pieceremaintask: TdxDBGridColumn;
    quantityremain: TdxDBGridColumn;
    pieceremain: TdxDBGridColumn;
    quantityremainorder: TdxDBGridColumn;
    pieceremainorder: TdxDBGridColumn;
    carriageitem: TdxDBGridCurrencyColumn;
    carriagetotalitem: TdxDBGridCurrencyColumn;
    insuranceItem: TdxDBGridCurrencyColumn;
    insurancetotalItem: TdxDBGridCurrencyColumn;
    remark: TdxDBGridBlobColumn;
    costquantityItem: TdxDBGridCurrencyColumn;
    costquantitytaskItem: TdxDBGridCurrencyColumn;
    costquantityuomItem: TdxDBGridPickColumn;
    conscusnameItem: TdxDBGridButtonColumn;
    carriagecurrcdItem: TdxDBGridPickColumn;
    quantityslitem: TdxDBGridColumn;
    ProPiece: TdxDBGridColumn;
    cusbillnoitem: TdxDBGridColumn;
    quantityshortitem: TdxDBGridCurrencyColumn;
    dxvolumeremain: TdxDBGridColumn;
    dxnetweightremain: TdxDBGridColumn;
    dxgrossweightremain: TdxDBGridColumn;
    N11: TMenuItem;
    GMSStickyLabel51: TGMSStickyLabel;
    KGroupBox6: TKGroupBox;
    GMSStickyLabel44: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    GMSStickyLabel46: TGMSStickyLabel;
    GMSStickyLabel47: TGMSStickyLabel;
    GMSStickyLabel48: TGMSStickyLabel;
    GMSStickyLabel42: TGMSStickyLabel;
    GMSStickyLabel43: TGMSStickyLabel;
    GMSStickyLabel52: TGMSStickyLabel;
    edtconnowyfq: TdxDBEdit;
    edtcarbrandwyfq: TdxDBEdit;
    dtdconloaddatewyfq: TdxDBDateEdit;
    timconloaddatewyfq: TdxDBTimeEdit;
    dtdcarrierdatewyfq: TdxDBDateEdit;
    timcarrierdatewyfq: TdxDBTimeEdit;
    edtblnoxt: TdxDBEdit;
    edtquantity: TdxDBEdit;
    edtvolume: TdxDBEdit;
    edtgrossweight: TdxDBEdit;
    dxDBButtonEdit1: TdxDBButtonEdit;
    GMSStickyLabel53: TGMSStickyLabel;
    dxDBButtonEdit2: TdxDBButtonEdit;
    GMSStickyLabel54: TGMSStickyLabel;
    corpnoitem: TdxDBGridKinPickColumn;
    corpnodetail: TdxDBGridKinPickColumn;
    connoitem: TdxDBGridColumn;
    mitCopySku: TMenuItem;
    mitMulDel: TMenuItem;
    mitlotcode: TMenuItem;
    mitMulLotcode: TMenuItem;
    edtDestOrder1: TdxDBEdit;
    GMSStickyLabel55: TGMSStickyLabel;
    N12: TMenuItem;
    mitRF: TMenuItem;
    LotCodeItemXY: TdxDBGridKinPickColumn;
    ppmdha: TPopupMenu;
    mitrkddha: TMenuItem;
    ppmxt: TPopupMenu;
    mitxtrkd: TMenuItem;
    ppmmt: TPopupMenu;
    MenuItem3: TMenuItem;
    btnInPut: TKBitBtn;
    mitcheckdb: TMenuItem;
    GMSStickyLabel56: TGMSStickyLabel;
    edtpiece: TdxDBEdit;
    btnOperation: TKBitBtn;
    ppmcheck: TPopupMenu;
    mituncheck: TMenuItem;
    skucostclassname: TdxDBGridColumn;
    mitmulrkd: TMenuItem;
    mitcancelcheck: TMenuItem;
    mithxekrkd: TMenuItem;
    mityzdin: TMenuItem;
    mitrkdin: TMenuItem;
    mitbzin: TMenuItem;
    mityzdfzrkd: TMenuItem;
    edtcarbrandds: TKinDbPickEdit;
    miteltrkd: TMenuItem;
    miteltmulrkd: TMenuItem;
    mitcustoms: TMenuItem;
    ppmlhjm: TPopupMenu;
    MenuItem2: TMenuItem;
    GMSStickyLabel57: TGMSStickyLabel;
    KSText5: TKSText;
    area: TdxDBGridColumn;
    areatasked: TdxDBGridColumn;
    N15: TMenuItem;
    ppmjjhy: TPopupMenu;
    mitjjhy: TMenuItem;
    mitjgrkd: TMenuItem;
    mitjgrkplan: TMenuItem;
    mitlocation: TMenuItem;
    qryTmp: TKADOQuery;
    dxsearch: TdxEdit;
    state: TdxDBGridColumn;
    mitinputloc: TMenuItem;
    dlgInput: TOpenDialog;
    serialno: TdxDBGridColumn;
    skunamedetail: TdxDBGridColumn;
    mitcheckinout: TMenuItem;
    mitconsku: TMenuItem;
    btnchecksku: TKBitBtn;
    mitrfin: TMenuItem;
    mitcancelcon: TMenuItem;
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
    procedure grdLocationINDblClick(Sender: TObject);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtIUserButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure ShowHint(var HintStr: string; var CanShow: Boolean;
       var HintInfo: THintInfo);
    procedure mitDelLocationINOUTDetailClick(Sender: TObject);
    procedure mitSKUSelectClick(Sender: TObject);
    procedure mitOrderSKUSelectClick(Sender: TObject);
    procedure ckbContractClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure mitSplitClick(Sender: TObject);
    procedure edtCostCusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure mitDetail_OUTClick(Sender: TObject);
    procedure mitItem_OUTClick(Sender: TObject);
    procedure edtSNOEnter(Sender: TObject);
    procedure edtCost_SNOEnter(Sender: TObject);
    procedure edtCostCusEnter(Sender: TObject);
    procedure mitQuantityRemainClick(Sender: TObject);
    procedure btnOperClick(Sender: TObject);
    procedure grdLocationINCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure mitSkuDetailItemClick(Sender: TObject);
    procedure edtCostCusExit(Sender: TObject);
    procedure mitINCOWorkClick(Sender: TObject);
    procedure mitUpdateMainClick(Sender: TObject);
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
    procedure grdLocationINItemDblClick(Sender: TObject);
    procedure grdLocationINItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdLocationINItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShippercusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure LocItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure loadgroupcusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure forkgroupcusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure liftmachinecusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdLocationINDetailDblClick(Sender: TObject);
    procedure grdLocationINDetailEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdLocationINDetailEnter(Sender: TObject);
    procedure LocNameDetailButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameDetailButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitLIOoutClick(Sender: TObject);
    procedure PieceDetailValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure N14Click(Sender: TObject);
    procedure mitCheckOneClick(Sender: TObject);
    procedure mitCancelOneClick(Sender: TObject);
    procedure mitaccountClick(Sender: TObject);
    procedure btnCostClick(Sender: TObject);
    procedure SKUNameItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure QuantitytaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdLocationINItemExit(Sender: TObject);
    procedure piecetaskItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdLocationINItemEnter(Sender: TObject);
    procedure grdLocationINItemChangeNodeEx(Sender: TObject);
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
    procedure grdLocationINDetailExit(Sender: TObject);
    procedure pgcLocationINOUTChange(Sender: TObject);
    procedure grdLocationINChangeNodeEx(Sender: TObject);
    procedure grdcasingExit(Sender: TObject);
    procedure grdcasingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PriceInCasingValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure PieceCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure shipcusnameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShipperCusNameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameCasingButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdcasingEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure mitAddLocItemClick(Sender: TObject);
    procedure mitdelLocINItemClick(Sender: TObject);
    procedure mitItemClearClick(Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure VolumeCasingValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure QuantityCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitcasingClick(Sender: TObject);
    procedure mitdetailclearClick(Sender: TObject);
    procedure CostCusidItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure priceItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure priceinIItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure CostUOMTypeItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure VolumetaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure areataskItemValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grossweighttaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure netweighttaskItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure delCasingClick(Sender: TObject);
    procedure ShipcusNameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitCostdelClick(Sender: TObject);
    procedure mitCostAddClick(Sender: TObject);
    procedure grdAutoCostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdAutoCostExit(Sender: TObject);
    procedure grdAutoCostEnter(Sender: TObject);
    procedure loadgroupcusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdCostCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure forkgroupcusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure liftmachinecusnameItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdRateCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure GrossWeightCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure NetWeightCasingValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure AreaTaskCasingValidate(Sender: TObject;
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
    procedure mitAddLocationINOUTDetailClick(Sender: TObject);
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
    procedure mitinwareClick(Sender: TObject);
    procedure tallycusiditemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure tallycusiditemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitalterskuproClick(Sender: TObject);
    procedure OPERATIONDATEDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure grdLocationINDetailChangeNodeEx(Sender: TObject);
    procedure GetCusCnfg;
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure LocNameDetailValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitfzrkdClick(Sender: TObject);
    procedure mitCheckManyClick(Sender: TObject);
    procedure mitCancelManyClick(Sender: TObject);
    procedure mitLocInfoSelClick(Sender: TObject);
    procedure mitAutoLocSelClick(Sender: TObject);
    procedure mitmullocidClick(Sender: TObject);
    procedure mitMullUpClick(Sender: TObject);
    procedure grdCountwayValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure customernoItemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitGetAutoCountClick(Sender: TObject);
    procedure conscusnameItemButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mittaskcheckClick(Sender: TObject);
    procedure mitConcelTaskClick(Sender: TObject);
    procedure mitItemTask_OrderClick(Sender: TObject);
    procedure mitcountsalesClick(Sender: TObject);
    procedure btnHSClick(Sender: TObject);
    procedure mitgetskucostClick(Sender: TObject);
    procedure mitcancelsalesClick(Sender: TObject);
    procedure mitxshwjcdClick(Sender: TObject);
    procedure mitforkworkloadClick(Sender: TObject);
    procedure mitforkworkunloadClick(Sender: TObject);
    procedure mitDocbookPicClick(Sender: TObject);
    procedure mitinoutqueryClick(Sender: TObject);
    procedure mitprinttallysheetClick(Sender: TObject);
    procedure mitprinttallysheet1Click(Sender: TObject);
    procedure mitoploadClick(Sender: TObject);
    procedure mitopunloadClick(Sender: TObject);
    procedure mitlocinitemskuClick(Sender: TObject);
    procedure mitcustomspicClick(Sender: TObject);
    procedure mitinlocClick(Sender: TObject);
    procedure mitupdateClick(Sender: TObject);
    procedure mitcostforkworkClick(Sender: TObject);
    procedure mitcanclecostClick(Sender: TObject);
    procedure btncheckdetailClick(Sender: TObject);
    procedure mitchecklookClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure mitdelcountClick(Sender: TObject);
    procedure mitworkitemClick(Sender: TObject);
    procedure mitprintitemClick(Sender: TObject);
    procedure GrossWeightDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure NetWeightDetailValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure btnOperationClick(Sender: TObject);
    procedure edtcusbillnoSearchExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure N11Click(Sender: TObject);
    procedure ppmLocationINItemPopup(Sender: TObject);
    procedure quantityshortitemValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitCopySkuClick(Sender: TObject);
	procedure quantityshortdetaiValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitMulDelClick(Sender: TObject);
    procedure timOperationDateDblClick(Sender: TObject);
    procedure mitlotcodeClick(Sender: TObject);
    procedure mitMulLotcodeClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure mitRFClick(Sender: TObject);
    procedure btnInPutClick(Sender: TObject);
    procedure mitrkddhaClick(Sender: TObject);
    procedure mitcheckdbClick(Sender: TObject);
    procedure mituncheckClick(Sender: TObject);
    procedure mitmulrkdClick(Sender: TObject);
    procedure mitcancelcheckClick(Sender: TObject);
    procedure mithxekrkdClick(Sender: TObject);
    procedure mityzdinClick(Sender: TObject);
    procedure mitrkdinClick(Sender: TObject);
    procedure mitbzinClick(Sender: TObject);
    procedure mityzdfzrkdClick(Sender: TObject);
    procedure miteltrkdClick(Sender: TObject);
    procedure miteltmulrkdClick(Sender: TObject);
    procedure mitcustomsClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure mitjgrkdClick(Sender: TObject);
    procedure mitjgrkplanClick(Sender: TObject);
    procedure mitlocationClick(Sender: TObject);
    procedure dxsearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitinputlocClick(Sender: TObject);
    procedure mitcheckinoutClick(Sender: TObject);
    procedure mitconskuClick(Sender: TObject);
    procedure btncheckskuClick(Sender: TObject);
    procedure mitrfinClick(Sender: TObject);
    procedure mitcancelconClick(Sender: TObject);
//    procedure dxsearchChange(Sender: TObject);
  private
    { Private declarations }
    //私有变量
    FindItem: TFindItem;               //查找
    DataState:TDataState;              //form状态
    mode:TDataState;                   //进入form状态模式
    strSql:string;                     //sql语句
    Bookmark: TBookmark;               //书签
    blnCopy:Boolean;                   //是否复制
    blnSaveError:Boolean;              //是否产生数据保存错误
    strFlow,                           //流程代码
//    strInOut,                          //进出标志
    strJobno:string;                   //定位工作号
    arrInOut,arrLocationINOUT,         //用于数据复制
    arrLocationINItem,arrlocInItemCasing,arrlocationinDetail:Variant;

    strDel_Task:string;                       //任务商品删除时从表控制
    strDel_Detail:string;                     //实际商品删除时locskudetail控制
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    blnSkuOpen:Boolean;           //判断是否曾经翻到过商品信息页面
    blnAutoCost:Boolean;           //判断是否曾经翻到过计费页面
    blnCasingOpen:Boolean;           //判断是否曾经翻到过打包信息页面
    blnqryInChange:Boolean;           //判断是否要执行假主库移动的事件
    blnMainPage:Boolean;           //判断是否要执行主页面翻动事件
    blnItemPage:Boolean;         //判断是否要执行从库页面翻动事件
    blnCostRate:Boolean;         //判断是否有费率的权根
    blnCasing:boolean;           //是否在打包模式

    blnTray:Boolean;             //是否自动推荐仓位
    strTraySkuClassid:string;           //自动推荐仓位时,记录item商品classID组
    qryWareOrderEdit,qryWareOrderSKU:TKADOQuery;  //
    strJobnoOrder:String;
    strGetCd:String;                   //商品输入时防止重复判别
    strOldCostCus:string;             //旧费用关系人,离开事件相关
    stroldCustomsNO:string;       //老的仓单号
    CopyQuality:String;//用于任务商品新增默认
    iOutCostType:integer;              //应付费用属性(在按修改和页面翻动时确定)
                                       //            0   还未确定
                                       //            1   属于整柜
                                       //            2   属于散货
//    delNetWeight,delArea,delVolume,delGrossWeight:Extended;
//    delQuantity,delPiece:Extended;//用于实际商品明细输入多条记入时用
    blnTotaled:Boolean;//是否已经合计过
    blnBLJS:Boolean;//是否按比例计算
    strCostCountUOMType,               //装卸费类计费单位
    strRentCountUOMType,strRentCountUOMTypeOut:string;        //仓租费类计费单位
    strDetailLocationID,strDetailLocationName:string;
    QuantityDetailOldValue,
    QuantityTaskOldValue,
    QuantityOldValue:extended;
    grdLocationOutDetailReadOnly,
    grdLocationINOUTItemReadOnly:Boolean;
    copycusID,copycusName,                   //用于集装箱信息新增默认
    CopyShippercusID,CopyShipperCusName,          //装卸队
    copyloadgroupcusid,copyloadgroupcusname,
    copyforkgroupcusid,copyforkgroupcusname,
    copyliftmachinecusid,copyliftmachinecusname,
    CopyRentCountUOMType,CopyCostCountUOMType:String;
    // Added by wql 2005-12-6 20:10:48
    copySkuwtv:Extended;

//    strShippercusID,strShippercusName,
//    strcusID,strcusName:string;      //任务寄仓单位名称
    blnSelect:Boolean;
    sltCostUomItem:TStringList;
    strcostuom:string;       //费用单位
//用户日志
    strHistMessage:string;
    sltAutoCost:TStringList;//判断计费条条目重复记录
    blnCopyAutoCost:Boolean;
    Present: TDateTime;
    blnop:Boolean;
    strcusid,strcusname,strlocno:string;
    blnIsChange:boolean;

    //二次校验参数
    blnScheck:Boolean;      //是否需要二次校验
    strFirstSkuid:string;  //第一次输入的商品代码
    extFirstNum:Extended; //第一次输入的数量（或是件数、净重）
    blnFirst:Boolean;  //是否是第一次输入
    strUpdate:string;
    strUpdatetype:string;
    Isyearctrl:string;
    strisyearctrl:string;
    sltselect:TStringList;// 库存挑选过滤

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
    function  DeleteOperationInfo:Boolean;
    function  CheckItemDetailInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer):Boolean;
//    function  CheckItemTaskInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer;pBoolean:Boolean=True):Boolean;
    function  CompareTaskItem(pstrType:string):Boolean;
    procedure GetLocationSKU;
    procedure Getmullocid;
    procedure grdLocationINDetailBeforeInsert;
    procedure grdLocationINItemBeforeInsert;
    procedure grdCasingBeforeinsert;
    procedure grdAutoCostBeforeInsert;
    procedure checknull;
    procedure CountSKUPiece(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure SetSkuInfo(qryselect:tkadoquery);
    function GetLocationBillNO:String;
  public
    { Public declarations }
    maxLocationINDetail,maxLocationINItem,maxLocInItemCasing,maxAutocountcost,maxdetailsno:integer;    //
    m_blnPost: Boolean;//在Post状态
    strHistDetailMessage:string; //用户日志
    strSysCus:string; //项目型客户个性化配置
    Year,Month,Day:word;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocationIN(CallMode:TDataState; pstrJobno,pstrFlow:string;
             pqryWareOrderEdit:TKADOQuery;pqryWareOrderSKU:TKADOQuery);

var
  frmLocationIN:TfrmLocationIN;

implementation

{$R *.dfm}
Uses Main,libUser,kindlg,Saveget,datas,datasSelect,datasTmp,GetDllPub,libuserPub,Volume,
     Operation,WareOrderSKUSelect,GetLocation,linprint,libbb,LocationOUTSelect,GetUserRight,
     WareRateView,lioskudetail,LocInSKUDetail,SelLoc,WareOrderDxALL,UpDateMain,CostItemDx,
     locationbillno, forkwork, Inoutquery, libRmbb,printselect,locinitemsku,Updatetime,forkworknew,forkworkload,
     inputlocinitemsku,lotcodeTxt,RFINtxt,InPutlocin,locoutcash,conskuselect;
var
    strpJobno:string;
    strCaption:string;


procedure WorkLocationIN(CallMode:TDataState; pstrJobno,pstrFlow:string;
             pqryWareOrderEdit:TKADOQuery;pqryWareOrderSKU:TKADOQuery);
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pDataBaseID:定位DataBaseID
  pstrFlow   :流程标志 ITEM 任务 DETAIL  实际
}
var
   Filtersql:string;
   StrDefFilterSql:string;
   year,month,day:word;
   month_start,month_end:TDate;
   strMenuItemName:string;
begin
//   _IsManager:='F';
   if pstrFlow='ITEM' then strCaption:='进仓管理--任务'
   else strCaption:='进仓管理--实际';
   if frmLocationIN <> nil then
   with frmLocationIN do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   if pstrflow='ITEM' then strMenuItemName:='mitLocationIntask'
   else strMenuItemName:='mitLocationInAct';
   strpJobno:=pstrJobno;
   frmLocationIN:=TfrmLocationIN.Create(application);
   with frmLocationIN do
   begin
      strSysCus:=getSysdata('cusname');
      sltselect:= TStringList.Create;
      if _general='T' then
      begin
         mitprinttallysheet1.Visible:=False;
         mitinloc.Visible:=False;
         mitinware.Visible:=False;
         mitfzrkd.Visible:=False;
         mitxshwjcd.Visible:=False;
         mitinoutquery.Visible:=False;
      end;
      //lzw20111011
      if _StrSysCus='JJHY' then
      begin
         btnPrint.PopupMenu:=ppmjjhy;
         GMSStickyLabel6.caption:='供应商';
         ShipcusNameItem.caption:='供应商';
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         //lzw20111024
         mitforkworkload.Visible:=True;
         mitforkworkunload.Visible:=True;
         mitopload.Visible:=True;
         mitopunload.Visible:=True;
         mitcostforkwork.Visible:=True;
         mitcanclecost.Visible:=True;
         mitchecklook.Visible:=True;
         N9.Visible:=True;
         N10.Visible:=True;
         mitCancelOne.Visible:=True;
         mitCancelMany.Visible:=True;
      end ;

      //lzw20111011
      if _StrSysCus='JG' then
      begin
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         mitjgrkd.Visible:=True;
         mitjgrkplan.Visible:=True;
         mitinware.Visible:=False;
         mitLIOout.Visible:=False;
         mitfzrkd.Visible:=False;
         mitxshwjcd.Visible:=False;
         mitprinttallysheet1.Visible:=False;
         mitinloc.Visible:=False;
         mitwyfq.Visible:=False;
         mitjgrkd.Visible:=True;
         mitjgrkplan.Visible:=True;
         mitlocation.Visible:=True;
         N9.Visible:=False;
         N10.Visible:=False;
         GMSStickyLabel25.Caption:='包装方式' ;
         GMSStickyLabel35.Caption:='目的地' ;
         GMSStickyLabel23.Caption:='计费吨合计';
         SerialNODetail.Caption:='托盘号' ;
         corpnodetail.Visible:=False;
         mitcheckinout.Visible:=True;
         mitinoutquery.Visible:=False;
         

      end ;

      if _manufacture='T' then
      begin
         GMSStickyLabel14.Caption:='实物签收人' ;
         GMSStickyLabel6.Caption :='供应商';
         GMSStickyLabel28.Caption :='实际入库时间';
         GMSStickyLabel24.Caption :='检验时间';
         GMSStickyLabel25.Caption :='计划员';
         GMSStickyLabel21.Caption :='实物签收时间';
      end ;
//厦门省物资配置
      if _StrSysCus='SWZ' then
      begin
         cusbillnoitem.Caption:='报审号';
         GMSStickyLabel25.Caption:='作业设备';
         GMSStickyLabel28.Caption:='作业时间从';
         GMSStickyLabel24.Caption:='作业时间到';
         //lzw20090310
         GMSStickyLabel33.Caption:='合 同 号';
         corpno.Caption:='合同号';
         GMSStickyLabel23.Caption:='车 皮 号';
         customernoItem.Caption:='商品产地';
         customernodetail.Caption:='商品产地';
         btncheckdetail.Visible:=True;
         //lzw20100603
         mitforkworkload.Visible:=True;
         mitforkworkunload.Visible:=True;
         mitopload.Visible:=True;
         mitopunload.Visible:=True;
         mitcostforkwork.Visible:=True;
         mitcanclecost.Visible:=True;
         mitchecklook.Visible:=True;
         N9.Visible:=True;
         N10.Visible:=True;
         mitCancelOne.Visible:=True;
         mitCancelMany.Visible:=True;

         GMSStickyLabel35.Caption:='身份证号';
         skucostinDetail.Visible:=False;
         skucostinItem.Visible:=False;
         priceinDetail.Visible:=False;
         priceItem.Visible:=False;
         skucostDetail.Caption:='采购总额';
         skucostItem.Caption:='采购总额';
         priceDetail.Caption:='采购单价';
         priceItem.Caption:='采购单价';
         mitworkitem.Visible:=True;
      end;
      IF _StrSysCus='HQWL' then
      begin
         ckbTag.Caption:='是否回空';
      end;
      if getSysdata('xytext')='T'then
      begin
         LotCodeItem.Visible:=False;
         LotCodeItemXY.Visible:=True;
      end;
      // _mullocid:=True;
      if _ConCusInput='T' then SKUNameItem.ButtonOnly:=False;//鸿达配置，商品直接输入

      //二次校验 获取是否需要二次校验
      blnScheck:=getSysdata('scheck')='T';
      blnFirst:=True;
      blncostrate:=btnCostrate.Enabled;
      m_blnPost:=True;
      blnCopy :=False;
      blnCopyAutoCost:=False;
      FindItem:= TFindItem.Create;
      sltCostUomItem:=TstringList.Create;
      blnSaveError:=False;
      mode    :=CallMode;
      strFlow :=pstrFlow;

      strJobno:=pstrJobno;
      FilterSql:='';
      blnTotaled:=False;
      strJobnoOrder:='';
      strTraySkuClassid:='';

      ScrollAfterEdit:=True;
      blnSkuOpen:=False;
      blnAutoCost:=False;
      blnCasingOpen:=false;
      blnqryInChange:=True;
      blnMainPage:=True;
      blnItemPage:=True;
      if strFlow='ITEM' then mitlocinitemsku.Visible :=true else mitlocinitemsku.Visible :=false;

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
         cusbillnoitem.Caption:='定单号';
         ProPiece.Visible:=True;
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
         cusbillnoitem.Caption:='客户单号';
         ProPiece.Visible:=False;
      end;
//苏州威扬
      if _strSysCus='SZWY' then
      begin
         corpnoitem.Caption:='托盘号';
         corpnodetail.Caption:='托盘号';
         corpno.Caption:='托盘号';
         casing5taskItem.Caption:='任务托盘';
         casing5Item.Caption:='托盘';
         casing5Detail.Caption:='托盘';
         quantityshortitem.Caption:='标准数';
         quantityshortdetai.Caption:='标准数';
         GMSStickyLabel22.Caption:='目的地';
         KGroupBox6.Visible:=True;
         KGroupBox2.Visible:=False;
         GMSStickyLabel2.Caption:='指示书番号';
      end;
      //lzw20101004
      if _StrSysCus='XT' then
      begin
         KGroupBox6.Visible:=True;
         KGroupBox2.Visible:=False;
         btnPrint.PopupMenu:=ppmxt;
         btncheckdetail.Visible:=True;
         btncheckdetail.caption:='退审';
         btnchecksku.Visible:=True;
         GMSStickyLabel56.caption:='总箱数';
         mitcheckdb.Visible:=False;
         GMSStickyLabel48.caption:='区域码';
         blno.caption:='区域码';
         skucostclassname.Visible:=True;
         //lzw20101209
         mitmulrkd.Visible:=True;
         mitDocbookPic.Visible:=False;
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitmullocid.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         N3.Visible:=False;
         N6.Visible:=False;
         mitdelcount.Visible:=False;
         mitrkdin.Visible:=True;
         mityzdfzrkd.Visible:=True;
         miteltmulrkd.Visible:=True;
      end;  
      //lzw20100911
      if _StrSysCus='DHA' then
      begin
         priceDetail.Caption:='单价';
         skucostDetail.Caption:='货值';
         casing2Detail.Caption:='码头重量';
         casing2taskItem.Caption:='码头重量';
         casing2Item.Caption:='码头重量';
         casing1taskItem.Caption:='任务托盘数';
         casing1Item.Caption:='托盘数';
         casing1Detail.Caption:='托盘数';
         mitDocbookPic.Visible:=False;
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitSkuDetailItem.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitmullocid.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         N14.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         N3.Visible:=False;
         N6.Visible:=False;
         mitdelcount.Visible:=False;
         btnPrint.PopupMenu:=ppmdha;
         //edtcarbrandds.Visible:=False;
         edtcarbrand1.Visible:=true;
         area.Visible:=true;
         areatasked.Visible:=true;
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
      //lzw20110615
      if _StrSysCus='XSWL' then
      begin
         mitDocbookPic.Visible:=False;
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         btncheckdetail.Visible:=False;
         btnInPut.Visible:=False;
         mitinware.Visible:=False;
         mitfzrkd.Visible:=False;
         mitinoutquery.Visible:=False;
         mitprinttallysheet1.Visible:=False;
         mitinloc.Visible:=False;

         mitprinttallysheet.Visible:=False;
         mitSkuDetailItem.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitmullocid.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         N14.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         //N3.Visible:=False;
         //N6.Visible:=False;
         //mitdelcount.Visible:=False;

      end;
      //lzw20101021
      if _StrSysCus='MT' then
      begin
         mitDocbookPic.Visible:=False;
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitSkuDetailItem.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitmullocid.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         N14.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         N3.Visible:=False;
         N6.Visible:=False;
         mitdelcount.Visible:=False;
         btnPrint.PopupMenu:=ppmmt;
      end;
      //lzw20110629
      if _StrSysCus='LHJM' then
      begin
         mitDocbookPic.Visible:=False;
         mitcustomspic.Visible:=False;
         mitRF.Visible:=False;
         mitprinttallysheet.Visible:=False;
         mitSkuDetailItem.Visible:=False;
         mitINCOWork.Visible:=False;
         mitTotalDetail.Visible:=False;
         mitalterskupro.Visible:=False;
         mitmullocid.Visible:=False;
         mitupdate.Visible:=False;
         N11.Visible:=False;
         mitlotcode.Visible:=False;
         mitCopySku.Visible:=False;
         mitMulLotcode.Visible:=False;
         N12.Visible:=False;
         N14.Visible:=False;
         mitFromFiles.Visible:=False;
         mitUpdateMain.Visible:=False;
         N3.Visible:=False;
         N6.Visible:=False;
         mitdelcount.Visible:=False;
         btnPrint.PopupMenu:=ppmlhjm;
         GMSStickyLabel35.Caption:='身份证号';
      end;
      if getSysdata('cchk')='T' then
         _DB_CheckSelf:='F';

      if getSysdata('qdtext')='T' then
      begin
         btnPrint.PopupMenu:=ppmPrintqd;
         heightdetail.Visible:=True;
      end;
      //lzw20091111
      if getSysdata('hxtext')='T' then
      begin
         btnPrint.PopupMenu:=ppmhxtext;
      end;
//上海日陆配置
      if _StrSysCus='SHRL' then
      begin
         mainorderItem.Caption:='海关进库号';
         mainorder.Caption:='海关进库号';
         GMSStickyLabel18.Caption:='海关进库号';
//         corpnoitem.Caption:='瓶号';
         skumodelitem.Caption:='原产国';
         skumodeldetail.Caption:='原产国';
         ManufactureDateItem.caption:='有效期';
         ManufactureDatedetail.caption:='有效期';
         GMSStickyLabel14.Caption:='仓管';
         connoitem.Caption:='发票编码';
         
         casing1taskItem.Caption:='任务入库托盘数';
         casing1Item.Caption:='入库托盘数';
         casing1Detail.Caption:='入库托盘数';

         casing5taskItem.Caption:='任务库存托盘数增加';
         casing5Item.Caption:='库存托盘数增加';
         casing5Detail.Caption:='库存托盘数增加';
         //lzw20110530
         mitcustoms.Visible:=true;
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
      //币种
      InitdbPick(currcdItem,'codelib','codename','codename','codeclass="00"');
      currcdDetail.items.clear;
      currcdDetail.items:=currcdItem.items;
      CurrcdCasing.Items.Clear;
      CurrcdCasing.Items:=currcdItem.Items;
      carriagecurrcdItem.Items:=currcdItem.Items;
      //仓租算法
      InitdbPick(cmbWareRentcountType,'codelib','codecd','codename','codeclass="18"');
      InitdbPick(cmbwarerentcounttypeout,'codelib','codecd','codename','codeclass="18"');
      //操作类型
      InitdbPick(cmbLoadCostType,'codelib','codename','codename','codeclass="19"');
      //仓租非仓租计算单位
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
      costuomtypeDetail.Items.Clear;
      costuomtypeDetail.ItemFields.Clear;
      costuomtypeDetail.Items.Assign(rateuomtypeCost.Items);
      costuomtypeDetail.ItemFields.Assign(rateuomtypeCost.ItemFields);
      sltCostUomitem.Assign(rateuomtypeCost.Items);
      //计费
      InitdbPick(costquantityuomItem,'UOM','UOMName','UOMName','1=1');
      costquantityuomDetail.Items.Assign(costquantityuomItem.Items);
//      costquantityuomDetail.ItemFields.Assign(rateuomtypeCost.ItemFields);

      //费用项目
      InitdbPick(grdCostCDCost,'costcode','costcd',IIF(_Language='CAPTIONC','costname','costename'),'1=1');
      //船名
      InitdbPick(edtCarrierName,'vessel','vesselcd','vesselname','1=1');

      //费用关系指向人
      InitdbPick(grdCostCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');
      InitdbPick(grdRateCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');

      InitdbPick(cmbbusinesstype,'codelib','codecd','codename','codeclass="63"');

//      设置列头begin
      priceItem.Caption    :=getSysdata('price',2,'1','销售单价');
      skucostItem.Caption  :=getSysdata('skucost',2,'1','销售总额');
      priceinIItem.Caption :=getSysdata('pricein',2,'1','采购单价');
      skucostinItem.Caption:=getSysdata('costin',2,'1','采购总额');
//      设置列头end
      
      //假主库过滤条件
      decodedate(date,year,month,day);
      if _StrSysCus<>'JG' then
      begin
         Month_Start:=encodedate(year,month,1);
         //lzw20111207
         //Month_End  :=IncMonth(Month_Start,1)-1;
         Month_End  :=IncMonth(Month_Start,1);
      end else
      begin
          Month_Start:=encodedate(year,month-1,1);
        Month_End  :=IncMonth(Month_Start,2)-1;
      end;

      blnop:=True;
      if trim(strJobno)='' then
      begin
         begin
            //lzw20111207
            FilterSql:=' (Inout.TaskDate>="'+datetostr(Month_Start)+'") '
                      +'  and (Inout.TaskDate<"'+datetostr(Month_End)+'")';
            //FilterSql:=' (convert(datetime,convert(char(8),Inout.TaskDate,112)) >="'+datetostr(Month_Start)+'") '
            //          +'  and (convert(datetime,convert(char(8),Inout.TaskDate,112)) <="'+datetostr(Month_End)+'")';
            with FindItem do
            begin
               Field.Add('12');
               operator.Add('3');
               value.Add(datetostr(Month_Start));
               Exp.Add('计划日期          大于等于      '+datetostr(Month_Start));
               Field.Add('12');
               operator.Add('2');
               value.Add(datetostr(Month_End));
               Exp.Add('计划日期          小于          '+datetostr(Month_End));
            end;
         end;
      end else
      FilterSql:='';
      if _Loginid<>'SYSTEM' then
      SetButtonEnabled(ToolPanel,strMenuItemName,trim(_userorgid));//设置按钮的有效性
// Modified by cyh 2008.07.09 8:49:16
{      if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then
      begin
         FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'") ' ;
      end else }
     { if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) then
      begin
         FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")'
                                                   +'and (inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'")' ;
         blnop:=False;
      end;   }

       // Modified by lihl 2012.03.01
     if (UpperCase(_Loginid)<>'SYSTEM') and (btnopid.Enabled) then     //登陆者不是系统管理员，而且业务员的权限勾选了
     begin
       FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'") ' ;
     end else
     if (UpperCase(_Loginid)<>'SYSTEM') and (not btnopid.Enabled) then     //登陆者不是系统管理员，而且业务员的权限没有勾选
     begin
       FilterSql:='(convert(varchar(10),inout.createdate,102)>="'+datetostr(Month_Start)+'")'
                                                   +'and (convert(varchar(10),inout.createdate,102)<="'+datetostr(month_end)+'")'
                                                   +'and (inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'")' ;
         blnop:=False;
     end;

  //自行设置默认过滤条件
      StrDefFilterSql:=GetdefFilter(IIF(strFlow='ITEM','进仓任务','进仓实际'));
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      //初始化qry
      _qrymacroin:=iif(FilterSql<>'',FilterSql,' 1=1');
      _qrymacroin:=_qrymacroin+strisyearctrl;
      data.InitLocatinin(strFlow,strJobno);

  //根据是从任务还是实际进的模块控制按钮有效性
      if strFlow='DETAIL' then
      begin
          ItemTaskEdit.enabled:=false; //实际模块不能有任务操作权限
          btnDelete.Visible:=False;//实际模块不能删除任务
      end;

      if mode=stInsert then
      begin
         if not btnAdd.Enabled then
         begin
           { if _Language='CAPTIONC' then _strmessage:='您无权新增任务资料!'
            else _strmessage:='您无权新增任务资料!';}
            KMessageDlg(GetMessage('frmLocationIN','001'),mtWarning,[mbOK],0);
            Close;
            Exit;
         end;
         Show;
         SetControlState(stBrowse,true);
         data.qryIn.open;
         btnAdd.Click;
      end else
      begin
         SetControlState(stBrowse,true);
         data.qryIn.open;
         if strJobno<>''
         then data.qryIn.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
         WorkCall(stBrowse);
      end;
      {激活FORM}

    if strJobno<>'' then
    begin
       Top := Top +100;
       ShowModal;
       Free;
    end else Show;
  end;
end;

procedure TfrmLocationIN.CreateParams(var Params: TCreateParams);
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

procedure TfrmLocationIN.WorkCall(CallMode:TDataState);
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
             grdLocationIN.ClearSelection;
             if data.qryIn.fieldbyname('jobno').AsString<>'' then
                grdLocationIN.FindNodeByKeyValue(data.qryIn.fieldbyname('jobno').AsString).Selected:=true;
          end;
        stEdit:
          begin
             data.qryIn.Edit;
             EnableEdit;
             data.qryLocationin.Edit;
             strJobnoOrder:='';
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
             strDel_Detail:='';
             strCostCountUOMType:='';
             strRentCountUOMType:='';
             strRentCountUOMTypeOut:='';
             //在修改的状态下，对data.qryLocationinDetail循环
             data.qryLocationINDetail.DisableControls;
             Bookmark:= data.qryLocationINDetail.GetBookmark;
             maxLocationINDetail:=0;
             data.qryLocationinDetail.Filtered:=False;
             data.qryLocationinDetail.First;
             while not data.qryLocationinDetail.Eof do
             begin
               if data.qryLocationinDetail.FieldByName('ldsno').AsInteger>maxLocationINDetail
               then maxLocationINDetail:=data.qryLocationinDetail.FieldByName('ldsno').AsInteger;
               data.qryLocationinDetail.Next;
             end;
             data.qryLocationinDetail.Filtered:=True;
             data.qryLocationinDetail.GotoBookmark(Bookmark);
             data.qryLocationinDetail.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryLocationinDetail.EnableControls;

   //为了控制库存 ,创建临时表，用于保存原始状态的工作号
             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldItemIn") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldItemIn'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldItemIn '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoorder        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoorder          smallint     not null  '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );
             data.qryLocationinItem.DisableControls;
             Bookmark:= data.qryLocationinItem.GetBookmark;
             maxLocationINItem:=0;
             data.qryLocationinItem.First;
             while not data.qryLocationinItem.Eof do
             begin
    //为了控制库存 ,原始状态的工作号
                ExecSql(dataTmp.qryTmp,'  insert into #lskOldItemIn '+chr(13)+chr(10)
                                      +'     (jobnoorder,snoorder) '+chr(13)+chr(10)
                                      +'   values (       '+chr(13)+chr(10)
                                      +'"'+data.qryLocationInItem.FieldByName('jobnoorder').AsString +'",  '+chr(13)+chr(10)
                                      +'"'+data.qryLocationInItem.FieldByName('snoorder').AsString +'"  '+chr(13)+chr(10)
                                      +'     ) ');
                if data.qryLocationinItem.FieldByName('SNO').AsInteger>maxLocationINItem
                then maxLocationINItem:=data.qryLocationinItem.FieldByName('SNO').AsInteger;
                //判断是否是散货方式
                if (data.qryLocationinItem.FieldByName('loadgroupcusid').AsString<>'')
                  or (data.qryLocationinItem.FieldByName('forkgroupcusid').AsString<>'')
                  or (data.qryLocationinItem.FieldByName('forkgroupcusname').AsString<>'') then
                    iOutCostType:=2;
                data.qryLocationinItem.Next;
             end;
             data.qryLocationinItem.GotoBookmark(Bookmark);
             data.qryLocationinItem.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryLocationinItem.EnableControls;
             //打包信息
             if _isCasing='T' then
             begin
                data.qryLocInItemCasing.DisableControls;
                Bookmark:= data.qryLocInItemCasing.GetBookmark;
                maxLocInItemCasing:=0;
                data.qryLocInItemCasing.First;
                while not data.qryLocInItemCasing.Eof do
                begin
                   if data.qryLocInItemCasing.FieldByName('SNO').AsInteger>maxLocInItemCasing
                   then maxLocInItemCasing:=data.qryLocInItemCasing.FieldByName('SNO').AsInteger;
                   data.qryLocInItemCasing.Next;
                end;
                data.qryLocInItemCasing.GotoBookmark(Bookmark);
                data.qryLocInItemCasing.FreeBookmark(Bookmark);
                bookMark:=nil;
                data.qryLocInItemCasing.EnableControls;
             end;   

             data.qryautocountcostin.DisableControls;
             Bookmark:= data.qryautocountcostin.GetBookmark;
             maxAutocountcost:=0;
             data.qryautocountcostin.First;
             while not data.qryautocountcostin.Eof do
             begin
                if data.qryautocountcostin.FieldByName('sno').AsInteger>maxAutocountcost
                then maxAutocountcost:=data.qryautocountcostin.FieldByName('sno').AsInteger;
                data.qryautocountcostin.Next;
             end;
             data.qryautocountcostin.GotoBookmark(Bookmark);
             data.qryautocountcostin.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryautocountcostin.EnableControls;
             //qrylocinskudetail
             LampChange(lsEdit);
          end;
        stInsert:
          begin
  //为了控制库存 ,原始状态的工作号
{             ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                   +'    where id=object_id("tempdb..#lskOldItemIn") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                   +'     drop table #lskOldItemIn'+chr(13)+chr(10)
                                   +'   CREATE TABLE #lskOldItemIn '+chr(13)+chr(10)
                                   +'     ( '+chr(13)+chr(10)
                                   +'       jobnoorder        varchar(20)  not null , '+chr(13)+chr(10)
                                   +'       snoorder          smallint     not null  '+chr(13)+chr(10)
                                   +'      ) '+chr(13)+chr(10)
                                    );   }
   //          SetDetailActive(False,False);//whl
             SetMasterDetailState(false);
             data.qryIn.Append;
             SetDetailActive(False,True);//whl
             strJobnoOrder:='';
             //赋初值
             strDel_Task:='';
             strDel_Detail:='';
             maxLocationINDetail:=0;
             maxLocationINItem:=0;
             maxLocInItemCasing:=0;
             maxAutocountcost:=0;
             maxdetailsno:=0;
             _maxgridno:=0;
             copycusID  :='';
             copycusName:='';
             CopyShippercusID  :='';
             CopyShipperCusName:='';
             CopyRentCountUOMType:='';
             CopyCostCountUOMType:='';
             CopyQuality:='';
             // Added by wql 2005-12-6 20:19:56
             copySkuwtv:=0;
             iOutCostType:=0;
             strCostCountUOMType:='';
             strRentCountUOMType:='';
             strRentCountUOMTypeOut:='';
             InitValues;
             EnableEdit;
             //记录档案创建信息
             data.qryLocationin.Edit;
             data.qryLocationin.FieldByName('createname').Asstring:=_LoginName;
             data.qryLocationin.fieldByname('CreateDate').AsDatetime:=GetServerDate;
             data.qryIn.Edit;
             data.qryIn.FieldByName('jobno').AsString:=data.qrylocationIn.fieldbyname('jobno').AsString;
             LampChange(lsEdit);
          end;
      end;
   end;
end;

procedure TfrmLocationIN.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   libComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
   SetControlState(DataState,False);
   stroldCustomsNO:=data.qryLocationIn.fieldbyname('customsno').AsString;

//   grdcasing.OptionsBehavior:=grdcasing.OptionsBehavior+[edgoEditing];
//   grdcasing.OptionsDB:=grdcasing.OptionsDB+[edgoCanAppend,edgoCanInsert];
//   grdcasing.ShowGroupPanel:=False;
//   grdcasing.ClearGroupColumns;
   //lzw20091110
   if getSysdata('hxtext')='T' then
   begin
      ckbTariff.Enabled:=False;
      ckbTag.Enabled:=False;
      ckbContract.Enabled:=False;
      ckbWO_CountWith1.Enabled:=False;
      ckbLocation.Enabled:=False;
      dxDBCheckEdit2.Enabled:=False;
      ckbLotsCode.Enabled:=False;
      ckbistrade.Enabled:=False;
      ckbCountRent.Enabled:=False;
      ckbcountrentout.Enabled:=False;
      cmbWareRentcountType.Enabled:=False;
      cmbwarerentcounttypeout.Enabled:=False;
      cmbbusinesstype.Enabled:=False;
   end;
   grdLocationINItem.OptionsBehavior:=grdLocationINItem.OptionsBehavior+[edgoEditing];
   grdLocationINItem.OptionsDB:=grdLocationINItem.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdLocationINItem.ShowGroupPanel:=False;
   grdLocationINItem.ClearGroupColumns;
   grdLocationINItem.Filter.Active:=False;

   grdLocationINDetail.OptionsBehavior:=grdLocationINDetail.OptionsBehavior+[edgoEditing];
   grdLocationINDetail.OptionsDB:=grdLocationINDetail.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdLocationINDetail.ShowGroupPanel:=False;
   grdLocationINDetail.ClearGroupColumns;
   grdLocationINDetail.Filter.Active:=False;

   grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior+[edgoEditing];
   grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdAutoCost.ShowGroupPanel:=False;
   grdAutoCost.ClearGroupColumns;

   grdLocationINItem.OptionsView:=grdLocationINItem.OptionsView-[edgorowselect] ;
   grdLocationINDetail.OptionsView:=grdLocationINDetail.OptionsView-[edgorowselect];
   mitlotcode.Visible:=False;

   strHistDetailMessage:='';
   strHistMessage  :='';
   InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"');
end;

procedure TfrmLocationIN.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if data.qryIn.fieldbyname('Jobno').asstring='' then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
  if data.qryIn.fieldbyname('Jobno').asstring='' then setDisable:=setDisable-[2,4];
  SetControlState(DataState,False);
//  grdcasing.OptionsBehavior:=grdcasing.OptionsBehavior-[edgoEditing];  控制备注的强出.
//  grdcasing.OptionsDB:=grdcasing.OptionsDB-[edgoCanAppend,edgoCanInsert];
//  grdcasing.ShowGroupPanel:=True;

  grdLocationINItem.OptionsBehavior:=grdLocationINItem.OptionsBehavior-[edgoEditing];
  grdLocationINItem.OptionsDB:=grdLocationINItem.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdLocationINItem.ShowGroupPanel:=True;

  grdLocationINDetail.OptionsBehavior:=grdLocationINDetail.OptionsBehavior-[edgoEditing];
  grdLocationINDetail.OptionsDB:=grdLocationINDetail.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdLocationINDetail.ShowGroupPanel:=True;

   grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior-[edgoEditing];
   grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdAutoCost.ShowGroupPanel:=True;

   grdLocationINItem.OptionsView:=grdLocationINItem.OptionsView+[edgorowselect];
   grdLocationINDetail.OptionsView:=grdLocationINDetail.OptionsView+[edgorowselect];
   if _StrSysCus<>'XT' then
   mitlotcode.Visible:=True;
end;

procedure TfrmLocationIN.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

function TfrmLocationIN.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   QuantityTotalDetail, PieceTotalDetail:Extended;
   VolumeTotalDetail, AreaTotalDetail, NetWeightTotalDetail, GrossWeightTotalDetail:Extended;
   casing1TotalDetail, casing2TotalDetail, casing3TotalDetail, casing4TotalDetail,casing5TotalDetail:Extended;
   costquantityTotalDetail:Extended;   //计费数量
   strLocID,strLocName,strshippercusname,strcusname,strmainorder:string;
   sltAutoCost,sltmainorder:TStringList;//判断计费条条目重复记录
   strNO:string;
   blnTotaltask:Boolean;
   //lzw20111110
   strlocnameHJ,strjgsno,strjgwsjsno:string;
begin
   Result:=False;
   blnTotaltask:=False;
   sltAutoCost:=TStringList.Create;
   sltmainorder:=Tstringlist.Create;
   strmainorder:='';
   if (pos('七匹狼',edtCostCus.text)>0 ) and (edtblnoxt.text='')then
   begin
      KMessageDlg('区域码不能为空',mtWarning,[mbOK],0);
      Exit;
   end;

   if dtdAccountBillNO.Text<>'' then
   begin
      OpenSql(dataTmp.qryTmp,' select num=count(1) from locationin (nolock) '
                    +'  where costcusid="'+data.qryLocationIn.Fieldbyname('costcusid').AsString+'" '
                    +'    and jobno<>"'+data.qryLocationIn.Fieldbyname('jobno').AsString+'"  '
                    +'    and iuserid="'+data.qryLocationIn.Fieldbyname('iuserid').AsString+'" '
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
      else _strmessage:='计划日期不能为空，必须填写'; }
      KMessageDlg(GetMessage('frmLocationIN','002'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end else
   if (dtdTaskDate.Text>dtdOperationDate.Text)
      and (data.qrylocationIn.FieldByName('operationname').AsString<>'') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='计划日期不能迟于上架日期！'
      else _strmessage:='计划日期不能迟于上架日期！'; }
      KMessageDlg(GetMessage('frmLocationIN','068'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end else
   if edtIUser.Text='' then
   begin
      ActiveControl:=edtIUser;
      {if _Language='CAPTIONC' then _strmessage:='执行部门不能为空，必须填写'
      else _strmessage:='执行部门不能为空，必须填写'; }
      KMessageDlg(GetMessage('frmLocationIN','003'),mtWarning,[mbOK],0);
      Exit;
   end else
   if cmbWareRentcountType.Text='' then
   begin
     pgcLocationINOUT.ActivePage:=tbsInfo;
     ActiveControl:=cmbWareRentcountType;
     {if _Language='CAPTIONC'then
        _strmessage:='仓租计算方式不能为空，必须填写'
     else
        _strmessage:='仓租计算方式不能为空，必须填写';}
     KmessageDlg(GetMessage('frmLocationIN','004'),mtWarning,[mbOK],0);
     exit;
   end else
   if (cmbwarerentcounttypeout.Text='') and (ckbcountrentout.Checked) then
   begin
      pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=cmbwarerentcounttypeout;
      KMessageDlg('应付仓租计算方式不能为空！',mtWarning,[mbOK],0);
      Exit;
   end else
   if cmbSKUClass.Text='' then
   begin
      ActiveControl:=cmbSKUClass;
      {if _Language='CAPTIONC' then _strmessage:='商品类不能为空，必须填写！'
      else _strmessage:='商品类不能为空，必须填写！'; }
      KMessageDlg(GetMessage('frmLocationIN','005'),mtWarning,[mbOK],0);
      exit;
   end else
   //lzw20110419
   {if (edtcarbrandds.Text='') and (_strsyscus='DHA') then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=edtcarbrandds;
      KMessageDlg('车牌号不能为空',mtWarning,[mbOK],0);
      Exit;
   end else}
   if edtCostCus.Text='' then
   begin
      ActiveControl:=edtCostCus;
     { if _Language='CAPTIONC' then _strmessage:='费用关系人不能为空，必须填写！'
      else _strmessage:='费用关系人不能为空，必须填写！'; }
      KMessageDlg(GetMessage('frmLocationIN','006'),mtWarning,[mbOK],0);
      Exit;
   end else          //批次控制
   if (_isneedop<>'F') and (edtOPID.Text='') then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=edtOPID;
      KMessageDlg('业务员不能为空！',mtWarning,[mbOK],0);
      Exit;
   end else
   if (cmbLoadCostType.Text='') and (_paper='T') then
   begin
      if pgcLocationINOUT.ActivePage<>tbsInfo then pgcLocationINOUT.ActivePage:=tbsInfo;
      ActiveControl:=cmbLoadCostType;
      {if _Language='CAPTIONC' then _strmessage:='执行部门不能为空，必须填写'
      else _strmessage:='执行部门不能为空，必须填写'; }
      KMessageDlg('操作类型不能为空！！！',mtWarning,[mbOK],0);
      Exit;
   end else
   if (data.qryLocationin.fieldbyname('lottracked').asstring='T')
   and (data.qryLocationINItem.fieldbyname('LotCode').asstring='') then
   begin
      {if _Language='CAPTIONC' then _strmessage:='批次不能为空!'
      else _strmessage:='批次不能为空!';}
      KMessageDlg(GetMessage('frmLocationIN','007'),mtWarning,[mbOK],0);
      if pgcLocationINOUT.activepage<>tbsSKU
      then pgcLocationINOUT.activepage:=tbsSKU;
      grdLocationINItem.setfocus;
      data.qryLocationINItem.enablecontrols;
      exit;
   end;
   //lzw 20090310
   if _strSysCus='SWZ' then
   begin
      OpenSql(datatmp.qryTmp,'select 1 from contract (nolock)    '+chr(13)+chr(10)
                            +' where signcusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                            +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
      if datatmp.qryTmp.RecordCount=0 then
      begin
         kMessageDlg('该客户还未签订合同,请审批!', mtWarning, [mbOK], 0);
      end;
   end;
   //ine
   data.qryLocationin.Edit;
   //lzw20101208
   data.qryLocationin.fieldbyname('Shippercusid').asString:=iif(copyShippercusID<>'',copyShippercusID,data.qryLocationIN.fieldByname('costcusid').AsString);
   data.qryLocationin.fieldbyname('Shippercusname').asString:=iif(CopyShipperCusName<>'',CopyShipperCusName,data.qryLocationIN.fieldByname('costcusname').AsString);;
   data.qryLocationin.fieldbyname('cusid').asString:=iif(copycusID<>'',copycusID,data.qryLocationIN.fieldByname('costcusid').AsString);;
   data.qryLocationin.fieldbyname('cusname').asString:=iif(copycusName<>'',copycusName,data.qryLocationIN.fieldByname('costcusname').AsString);;

   strshippercusname:='';
   strcusname:='';
   data.qryLocationin.Edit;
   data.qryLocationIn.FieldByName('taskiscomplete').AsString:='T';
   data.qryLocationInDetail.Filtered:=false;
   if data.qryLocationInDetail.IsEmpty  then
   begin
      data.qryLocationIn.FieldByName('operationdate').Clear;
      data.qryLocationIn.FieldByName('operationname').Clear;;
      data.qryLocationIn.FieldByName('taskiscomplete').AsString:='F';
   end;
   checknull;
   data.qryLocationInDetail.Filtered:=true;
   data.qryLocationINDetail.DisableControls;
   data.qryLocationINItem.DisableControls;
   data.qryLocInItemCasing.DisableControls;
   if _isCasing='T' then
   begin
      data.qryLocInItemCasing.First;
      while not data.qryLocInItemCasing.Eof do
      begin
         data.qryLocInItemCasing.Edit;
         data.qryLocInItemCasing.fieldbyname('OPERATIONTYPE').asInteger:=1;
         data.qryLocInItemCasing.FieldByName('taskdate').AsDateTime:=data.qryLocationIn.FieldByName('taskdate').AsDateTime;
         data.qryLocInItemCasing.FieldByName('userid').AsString:=data.qryLocationIn.FieldByName('userid').AsString;
         data.qryLocInItemCasing.FieldByName('username').AsString:=data.qryLocationIn.FieldByName('username').AsString;
         data.qryLocInItemCasing.FieldByName('iuserid').AsString:=data.qryLocationIn.FieldByName('iuserid').AsString;
         data.qryLocInItemCasing.FieldByName('iusername').AsString:=data.qryLocationIn.FieldByName('iusername').AsString;
         data.qryLocInItemCasing.FieldByName('jobnoinf').AsString:=data.qryLocInItemCasing.FieldByName('jobno').AsString;
         data.qryLocInItemCasing.FieldByName('snoinf').asinteger:=data.qryLocInItemCasing.FieldByName('sno').asinteger;
         data.qryLocInItemCasing.FieldByName('ldsnoinf').AsInteger:=-11;
         data.qryLocInItemCasing.fieldbyname('costcusid').asstring:=data.qryLocationIN.fieldbyname('costcusid').asstring;
         data.qryLocInItemCasing.fieldbyname('costcusname').asstring:=data.qryLocationIN.fieldbyname('costcusname').asstring;
         data.qryLocInItemCasing.fieldbyname('costcusidout').asstring:=data.qryLocationIN.fieldbyname('costcusidout').asstring;
         data.qryLocInItemCasing.fieldbyname('costcusnameout').asstring:=data.qryLocationIN.fieldbyname('costcusnameout').asstring;
         data.qryLocInItemCasing.fieldbyname('mainorder').asstring:=data.qryLocationIN.fieldbyname('mainorder').asstring;
         data.qryLocInItemCasing.fieldbyname('WareRentCountType').asstring:=data.qryLocationIN.fieldbyname('WareRentCountType').asstring;
         data.qryLocInItemCasing.fieldbyname('WareRentCountTypeout').asstring:=data.qryLocationIN.fieldbyname('WareRentCountTypeout').asstring;
         data.qryLocInItemCasing.fieldbyname('COUNTRENT').asstring:=data.qryLocationIN.fieldbyname('COUNTRENT').asstring;
         data.qryLocInItemCasing.fieldbyname('COUNTCONTCOST').asstring:=data.qryLocationIN.fieldbyname('COUNTCONTCOST').asstring;
         data.qryLocInItemCasing.fieldbyname('LotTracked').asstring:=data.qryLocationIN.fieldbyname('LotTracked').asstring;
         data.qryLocInItemCasing.fieldbyname('TagEach').asstring:=data.qryLocationIN.fieldbyname('TagEach').asstring;
         data.qryLocInItemCasing.fieldbyname('CONTWITHLOCA').asstring:=data.qryLocationIN.fieldbyname('CONTWITHLOCA').asstring;
         data.qryLocInItemCasing.fieldbyname('loadcostone').asstring:=data.qryLocationIN.fieldbyname('loadcostone').asstring;

         data.qryLocInItemCasing.Next;
      end;
   end;
   data.qryLocationINItem.first;
   while not data.qryLocationINItem.eof do
   begin
     //继承主库信息
      data.qryLocationINItem.Edit;
      data.qryLocationINItem.fieldbyname('OPERATIONTYPE').asInteger:=1;
      data.qryLocationINItem.fieldbyname('TaskDate').asDateTime:=data.qryLocationIN.fieldbyname('TaskDate').asDateTime;
      data.qryLocationINItem.fieldbyname('iuserid').asstring:=data.qryLocationIN.fieldbyname('iuserid').asstring;
      data.qryLocationINItem.fieldbyname('iusername').asstring:=data.qryLocationIN.fieldbyname('iusername').asstring;
      //lzw20111125
      if _strsyscus<>'XT' THEN
         data.qryLocationINItem.fieldbyname('customsno').asstring:=data.qryLocationIN.fieldbyname('customsno').asstring;
      data.qryLocationInItem.fieldbyname('LocationBillno').asstring:=data.qryLocationin.fieldbyname('LocationBillno').asstring;
      data.qryLocationINItem.fieldbyname('ldsnoinf').asInteger:=-11;
      data.qryLocationINItem.fieldbyname('jobnoinf').asstring:=data.qryLocationINItem.fieldbyname('Jobno').asstring;
      data.qryLocationINItem.fieldbyname('snoinf').asInteger:=data.qryLocationINItem.fieldbyname('SNO').asInteger;
      data.qryLocationINItem.fieldbyname('ldsnoinf').asInteger:=-11;
      data.qryLocationInItem.FieldByName('istrade').AsString:=data.qryLocationIn.FieldByName('istrade').AsString;
      data.qryLocationINItem.fieldbyname('costcusid').asstring:=data.qryLocationIN.fieldbyname('costcusid').asstring;
      data.qryLocationINItem.fieldbyname('costcusname').asstring:=data.qryLocationIN.fieldbyname('costcusname').asstring;
      data.qryLocationINItem.fieldbyname('WareRentCountType').asstring:=data.qryLocationIN.fieldbyname('WareRentCountType').asstring;
      data.qryLocationINItem.fieldbyname('WareRentCountTypeout').asstring:=data.qryLocationIN.fieldbyname('WareRentCountTypeout').asstring;
      data.qryLocationINItem.fieldbyname('costcusidout').asstring:=data.qryLocationIN.fieldbyname('costcusidout').asstring;
      data.qryLocationINItem.fieldbyname('costcusnameout').asstring:=data.qryLocationIN.fieldbyname('costcusnameout').asstring;
      data.qryLocationinItem.fieldbyname('OperationDate').asstring:=data.qryLocationin.fieldbyname('OperationDate').asstring;
      data.qryLocationinItem.fieldbyname('operationname').asString:=data.qryLocationin.fieldbyname('operationname').asString;
      data.qryLocationinItem.fieldbyname('isbond').asstring:=data.qryLocationin.fieldbyname('isbond').asstring;
      data.qryLocationinItem.fieldbyname('countrent').asstring:=data.qryLocationin.fieldbyname('countrent').asstring;
      data.qryLocationinItem.fieldbyname('countrentout').asstring:=data.qryLocationin.fieldbyname('countrentout').asstring;
      data.qryLocationinItem.fieldbyname('countcontcost').asstring:=data.qryLocationin.fieldbyname('countcontcost').asstring;
      data.qryLocationinItem.fieldbyname('LotTracked').asstring:=data.qryLocationin.fieldbyname('LotTracked').asstring;
      data.qryLocationinItem.fieldbyname('TagEach').asstring:=data.qryLocationin.fieldbyname('TagEach').asstring;
      data.qrylocationinitem.fieldbyname('contwithloca').asstring:=data.qrylocationin.fieldbyname('contwithloca').asstring;
      data.qryLocationinItem.fieldbyname('loadcostone').asstring :=data.qryLocationin.fieldbyname('loadcostone').asstring;

      if _paper<>'T' then
         data.qryLocationinItem.fieldbyname('cusbillno').asstring :=data.qryLocationin.fieldbyname('cusbillno').asstring;
      if _StrSysCus='SHRL' then
      begin
         data.qryLocationinItem.fieldbyname('mainorder').asstring :=data.qryLocationin.fieldbyname('mainorder').asstring;
         data.qryLocationinItem.fieldbyname('NotFullSign').asstring :='F';
      end else
      begin
         if data.qryLocationinItem.fieldbyname('mainorder').asstring='' then
            data.qryLocationinItem.fieldbyname('mainorder').asstring :=data.qryLocationin.fieldbyname('mainorder').asstring
         else
         begin  //处理从表有主订单号主表没有主订单号的情况,下面有一段将strmainorder赋给主表
           //lzw 20080603
           if getSysdata('xytext')='T' then
              data.qryLocationinItem.fieldbyname('mainorder').asstring :=data.qryLocationin.fieldbyname('mainorder').asstring
           else
           begin
              if sltmainorder.IndexOf(data.qryLocationinItem.fieldbyname('mainorder').asstring)=-1 then
              begin
                 sltmainorder.Add(data.qryLocationinItem.fieldbyname('mainorder').asstring);
                 strmainorder:=strmainorder+','+data.qryLocationinItem.fieldbyname('mainorder').asstring;
              end;
           end
         end;
      end;
      //lzw20120628继承主表信息
      data.qryLocationinItem.fieldbyname('shippercusid').asstring :=data.qryLocationin.fieldbyname('shippercusid').asstring;
      data.qryLocationinItem.fieldbyname('shippercusname').asstring :=data.qryLocationin.fieldbyname('shippercusname').asstring;
      data.qryLocationinItem.fieldbyname('cusid').asstring :=data.qryLocationin.fieldbyname('cusid').asstring;
      data.qryLocationinItem.fieldbyname('cusname').asstring :=data.qryLocationin.fieldbyname('cusname').asstring;
      data.qryLocationinItem.fieldbyname('shipcusid').asstring :=data.qryLocationin.fieldbyname('shipcusid').asstring;
      data.qryLocationinItem.fieldbyname('shipcusname').asstring :=data.qryLocationin.fieldbyname('shipcusname').asstring;
      data.qryLocationinItem.fieldbyname('costcusid').asstring :=data.qryLocationin.fieldbyname('costcusid').asstring;
      data.qryLocationinItem.fieldbyname('costcusname').asstring :=data.qryLocationin.fieldbyname('costcusname').asstring;

      if (data.qryLocationin.fieldbyname('TagEach').asstring<>'T') then
      begin
        data.qryLocationinItem.fieldbyname('TagEachUOM').Clear;
        data.qryLocationinItem.fieldbyname('TagTotal').Clear;
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
      costquantityTotalDetail:=0;
      strlocnameHJ:='';

      if (_locid<>'') and (_automatism=true) and (data.qryLocationIN.fieldbyname('operationname').asstring='') then
          btnOperClick(mitOper);
      if ((strFlow='ITEM') and (data.qryLocationIN.fieldbyname('operationname').asstring<>'')
         or (strFlow='DETAIL')) then   //上架商品
      begin
         data.qryLocationInDetail.Filtered:=False;
         if data.qryLocationinItem.fieldbyname('SNO').AsString<>'' then
            data.qryLocationinDetail.filter:='SNO='+data.qryLocationinItem.fieldbyname('SNO').AsString
         else
            data.qryLocationinDetail.filter:='SNO=-1';
         data.qryLocationInDetail.Filtered:=True;
         strLocID:='-1';
         strLocName:='-1';
         data.qryLocationinDetail.first;
         while not data.qryLocationinDetail.eof do
         begin
{            if _Language='CAPTIONC' then _strmessage:='该笔仓位资料上架日期比该单上架日期晚3天，是否保存?'
            else _strmessage:='该笔仓位资料上架日期比该单上架日期晚3天，是否保存?';
            if (data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime>(data.qryLocationin.fieldbyname('OperationDate').asDateTime+_operationdatemiss))
              and (KmessageDlg(GetMessage('frmLocationIN','008'),mtConfirmation,[mbYes,mbNo],0)<>mryes) then
            begin
               if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
               grdLocationINDetail.setfocus;
               data.qryLocationinDetail.enablecontrols;
               data.qryLocationinItem.enablecontrols;
               data.qryLocInItemCasing.EnableControls;
               exit;
            end;}
            data.qryLocationinDetail.Edit;
            data.qryLocationinDetail.fieldbyname('jobno').asstring :=data.qryLocationin.fieldbyname('jobno').asstring;
            data.qryLocationinDetail.fieldbyname('OPERATIONTYPE').asInteger:=1;
            data.qryLocationinDetail.fieldbyname('TaskDate').asDateTime:=data.qryLocationin.fieldbyname('TaskDate').asDateTime;
            data.qryLocationinDetail.fieldbyname('userid').asstring:=data.qryLocationin.fieldbyname('userid').asstring;
            data.qryLocationinDetail.fieldbyname('username').asstring:=data.qryLocationin.fieldbyname('username').asstring;
            data.qryLocationinDetail.fieldbyname('iuserid').asstring:=data.qryLocationin.fieldbyname('iuserid').asstring;
            data.qryLocationinDetail.fieldbyname('iusername').asstring:=data.qryLocationin.fieldbyname('iusername').asstring;
   //in
            //LZW20111125
            if _strsyscus<>'XT' then
            data.qryLocationinDetail.fieldbyname('Customsno').asstring:=data.qryLocationin.fieldbyname('Customsno').asstring;
            data.qryLocationinDetail.fieldbyname('JobnoIN').asstring      :=data.qryLocationinItem.fieldbyname('Jobnoin').asstring;
            data.qryLocationinDetail.fieldbyname('SNOIN').asInteger       :=data.qryLocationinItem.fieldbyname('SNOin').asInteger;
            data.qryLocationinDetail.fieldbyname('LDSNOIN').asInteger    :=data.qryLocationinItem.fieldbyname('ldsnoin').asInteger;
            data.qryLocationinDetail.fieldbyname('JobnoINF').asstring      :=data.qryLocationinDetail.fieldbyname('Jobno').asstring;
            data.qryLocationinDetail.fieldbyname('SNOINF').asInteger       :=data.qryLocationinDetail.fieldbyname('SNO').asInteger;
            data.qryLocationinDetail.fieldbyname('LDSNOINF').asInteger    :=data.qryLocationinDetail.fieldbyname('ldsno').asInteger;
            data.qryLocationinDetail.fieldbyname('LocationBillNO').asstring  :=data.qryLocationin.fieldbyname('LocationBillNO').asstring;
            data.qryLocationinDetail.fieldbyname('isbond').asstring:=data.qryLocationin.fieldbyname('isbond').asstring;
            data.qryLocationinDetail.fieldbyname('COUNTRENT').asstring    :=data.qryLocationin.fieldbyname('COUNTRENT').asstring;
            data.qryLocationinDetail.fieldbyname('COUNTCONTCOST').asstring:=data.qryLocationin.fieldbyname('COUNTCONTCOST').asstring;
            data.qryLocationinDetail.fieldbyname('CONTWITHLOCA').asstring :=data.qryLocationin.fieldbyname('CONTWITHLOCA').asstring;
            data.qryLocationinDetail.fieldbyname('LotTracked').asstring   :=data.qryLocationin.fieldbyname('LotTracked').asstring;
            data.qryLocationinDetail.fieldbyname('TagEach').asstring      :=data.qryLocationin.fieldbyname('TagEach').asstring;
            //lzw20120628
            data.qryLocationinDetail.fieldbyname('costcusid').asstring    :=data.qryLocationinItem.fieldbyname('costcusid').asstring;
            data.qrylocationinDetail.fieldbyname('costcusname').asstring     :=data.qryLocationinItem.fieldbyname('costcusname').asstring;
            data.qrylocationinDetail.fieldbyname('costcusidout').asstring    :=data.qryLocationinItem.fieldbyname('costcusidout').asstring;
            data.qrylocationinDetail.fieldbyname('costcusnameout').asstring  :=data.qryLocationinItem.fieldbyname('costcusnameout').asstring;
            data.qrylocationinDetail.fieldbyname('cusid').asstring           :=data.qryLocationinItem.Fieldbyname('cusid').AsString;
            data.qrylocationinDetail.fieldbyname('cusname').asstring         :=data.qryLocationinItem.Fieldbyname('cusname').AsString;
            data.qrylocationinDetail.fieldbyname('shippercusid').asstring    :=data.qryLocationinItem.Fieldbyname('shippercusid').AsString;
            data.qrylocationinDetail.fieldbyname('shippercusname').asstring  :=data.qryLocationinItem.Fieldbyname('shippercusname').AsString;
            data.qrylocationinDetail.fieldbyname('lottracked').asstring      :=data.qryLocationinItem.Fieldbyname('lottracked').AsString;
            data.qrylocationinDetail.fieldbyname('contwithloca').asstring    :=data.qryLocationinItem.Fieldbyname('contwithloca').AsString;
            data.qrylocationinDetail.fieldbyname('isbond').asstring          :=data.qryLocationinItem.Fieldbyname('isbond').AsString;
            data.qrylocationinDetail.fieldbyname('countrent').asstring       :=data.qryLocationinItem.Fieldbyname('countrent').AsString;
            data.qrylocationinDetail.fieldbyname('countrentout').asstring       :=data.qryLocationinItem.Fieldbyname('countrentout').AsString;
            data.qrylocationinDetail.fieldbyname('countcontcost').asstring   :=data.qryLocationinItem.Fieldbyname('countcontcost').AsString;
            data.qrylocationinDetail.fieldbyname('warerentcounttypeout').asstring  :=data.qrylocationin.fieldbyname('warerentcounttypeout').asstring;
            data.qrylocationinDetail.fieldbyname('warerentcounttype').asstring     :=data.qryLocationinItem.Fieldbyname('warerentcounttype').AsString;
            data.qrylocationinDetail.fieldbyname('jobnoorder').asstring            :=data.qryLocationinItem.Fieldbyname('jobnoorder').AsString;
            data.qrylocationinDetail.fieldbyname('snoorder').asstring              :=data.qryLocationinItem.Fieldbyname('snoorder').AsString;
            data.qrylocationinDetail.fieldbyname('loadgroupcusid').asstring        :=data.qryLocationinItem.Fieldbyname('loadgroupcusid').AsString;
            data.qrylocationinDetail.fieldbyname('loadgroupcusname').asstring      :=data.qryLocationinItem.Fieldbyname('loadgroupcusname').AsString;
            data.qrylocationinDetail.fieldbyname('forkgroupcusid').asstring        :=data.qryLocationinItem.Fieldbyname('forkgroupcusid').AsString;
            data.qrylocationinDetail.fieldbyname('forkgroupcusname').asstring      :=data.qryLocationinItem.Fieldbyname('forkgroupcusname').AsString;
            data.qrylocationinDetail.fieldbyname('liftmachinecusid').asstring      :=data.qryLocationinItem.Fieldbyname('liftmachinecusid').AsString;
            data.qrylocationinDetail.fieldbyname('liftmachinecusname').asstring    :=data.qryLocationinItem.Fieldbyname('liftmachinecusname').AsString;
            //lzw20100701
            if strSysCus='SZWY' then
            data.qrylocationinDetail.fieldbyname('remark').asstring                :=data.qryLocationinItem.Fieldbyname('remark').AsString;

            if (getSysdata('qdtext')='T') or (_strsyscus='XT')then
               data.qrylocationinDetail.fieldbyname('operationdate').asstring    :=data.qryLocationin.Fieldbyname('operationdate').AsString;
            data.qrylocationinDetail.fieldbyname('cusbillno').asstring    :=data.qryLocationinItem.Fieldbyname('cusbillno').AsString;
            data.qrylocationinDetail.fieldbyname('corpno').asstring    :=data.qryLocationinItem.Fieldbyname('corpno').AsString;
             if _StrSysCus='JG' then
              data.qrylocationinDetail.fieldbyname('serialno').asstring    :=data.qryLocationinItem.Fieldbyname('serialno').AsString;
            if _StrSysCus='SHRL' then
            begin
               data.qrylocationinDetail.fieldbyname('mainorder').asstring :=data.qryLocationin.fieldbyname('mainorder').asstring;
               data.qrylocationinDetail.fieldbyname('NotFullSign').asstring :='F';
            end else
            begin
               if data.qrylocationinDetail.fieldbyname('mainorder').asstring='' then
                  data.qrylocationinDetail.fieldbyname('mainorder').asstring    :=data.qryLocationinItem.Fieldbyname('mainorder').AsString;
            end;
            data.qrylocationinDetail.fieldbyname('shipcusid').asstring    :=data.qryLocationinItem.Fieldbyname('shipcusid').AsString;
            data.qrylocationinDetail.fieldbyname('shipcusname').asstring    :=data.qryLocationinItem.Fieldbyname('shipcusname').AsString;
            data.qrylocationinDetail.FieldByName('istrade').AsString:=data.qryLocationIn.FieldByName('istrade').AsString;
            if data.qrylocationinDetail.fieldbyname('LotCode').asstring='' then
               data.qryLocationinDetail.fieldbyname('LotCode').asstring         :=data.qryLocationinItem.fieldbyname('LotCode').asstring;
            //标签控制
            if (data.qryLocationin.fieldbyname('TagEach').asstring<>'T') then
            begin
              data.qryLocationinDetail.fieldbyname('TagEachUOM').asstring:='';
              data.qryLocationinDetail.fieldbyname('TagTotal').asInteger:=0;
              if getSysdata('qdtext')<>'T' then
                 data.qryLocationinDetail.fieldbyname('TagNO').asstring:='';
            end;
   //ine
              //仓位商品数量合计
            QuantityTotalDetail   :=QuantityTotalDetail+data.qryLocationinDetail.fieldbyname('Quantity').AsFloat;
            PieceTotalDetail      :=PieceTotalDetail+data.qryLocationinDetail.fieldbyname('Piece').AsFloat;
            VolumeTotalDetail     :=VolumeTotalDetail+data.qryLocationinDetail.fieldbyname('Volume').asfloat;
            AreaTotalDetail       :=AreaTotalDetail+data.qryLocationinDetail.fieldbyname('Area').asfloat;
            NetWeightTotalDetail  :=NetWeightTotalDetail+data.qryLocationinDetail.fieldbyname('NetWeight').asfloat;
            GrossWeightTotalDetail:=GrossWeightTotalDetail+data.qryLocationinDetail.fieldbyname('GrossWeight').asfloat;

            casing1TotalDetail     :=casing1TotalDetail+data.qryLocationinDetail.fieldbyname('casing1').AsFloat;
            casing2TotalDetail     :=casing2TotalDetail+data.qryLocationinDetail.fieldbyname('casing2').AsFloat;
            casing3TotalDetail     :=casing3TotalDetail+data.qryLocationinDetail.fieldbyname('casing3').asfloat;
            casing4TotalDetail     :=casing4TotalDetail+data.qryLocationinDetail.fieldbyname('casing4').asfloat;
            casing5TotalDetail     :=casing5TotalDetail+data.qryLocationinDetail.fieldbyname('casing5').asfloat;
            costquantityTotalDetail:=costquantityTotalDetail+data.qryLocationinDetail.fieldbyname('costquantity').asfloat;

            if pos(data.qryLocationinDetail.fieldbyname('locname').AsString,strlocnameHJ)=0 then
            strlocnameHJ:=strlocnameHJ+data.qryLocationinDetail.fieldbyname('locname').AsString+',';

              //仓位信息只有一条时,继承仓位信息
            if strLocID='-1' then
            begin
              strLocID:=data.qryLocationinDetail.fieldbyname('locid').asString;
              strLocName:=data.qryLocationinDetail.fieldbyname('LocName').asString;
            end else
            begin
              strLocID:='';
              strLocName:='';
            end;
            if data.qryLocInSkuDetail.active then
            begin
               grdLocationINDetailChangeNodeEx(nil);
               data.qryLocInSkuDetail.First;
               while not data.qryLocInSkuDetail.Eof do
               begin
                  data.qryLocInSkuDetail.Edit;
                  if data.qryLocInSkuDetail.FieldByName('ldsno').AsString='-1' then  //任务中录入
                  begin
                     data.qryLocInSkuDetail.fieldbyname('locid').asstring:=data.qryLocationInItem.fieldbyname('locid').AsString;
                     data.qryLocInSkuDetail.fieldbyname('locname').asstring:=data.qryLocationInItem.fieldbyname('locname').AsString;
                  end else
                  begin
                     data.qryLocInSkuDetail.fieldbyname('locid').asstring:=data.qryLocationInDetail.fieldbyname('locid').AsString;
                     data.qryLocInSkuDetail.fieldbyname('locname').asstring:=data.qryLocationInDetail.fieldbyname('locname').AsString;
                  end;
                  //lzw20111223
                  if _strsyscus='XT' then
                     data.qryLocInSkuDetail.fieldbyname('skubrand').asstring:=data.qryLocationIn.fieldbyname('blno').AsString;
                  data.qryLocInSkuDetail.Next;
               end;
            end;
            data.qryLocationinDetail.Next;
         end;
         if _paper='T' then
         begin
            if data.qryLocationInItem.fieldbyname('locid').asString='' then
            begin
               data.qryLocationInItem.fieldbyname('locid').asString:=IIF(strLocID='-1','',strLocID);
               data.qryLocationInItem.fieldbyname('locname').asString:=IIF(strLocName='-1','',strLocName);
            end else
            begin
               if strLocID<>'' then
               begin
                  data.qryLocationInItem.fieldbyname('locid').asString:=strLocID;
                  data.qryLocationInItem.fieldbyname('locname').asString:=strLocName;
               end;
            end;  
         end else
         begin
            if data.qryLocationInItem.fieldbyname('locid').asString='' then
            begin
               data.qryLocationInItem.fieldbyname('locid').asString:=IIF(strLocID='-1','',strLocID);
               data.qryLocationInItem.fieldbyname('locname').asString:=IIF(strLocName='-1','',strLocName);
            end;
         end;
         if data.qryLocationInDetail.IsEmpty then
         begin
            data.qryLocationIn.FieldByName('taskiscomplete').AsString:='F';
         end else if (data.qryLocationInItem.fieldbyname('locid').asString='') and (getSysdata('sinotran')='F') then
         begin
          {  if _Language='CAPTIONC' then _strmessage:='仓位不能为空!'
            else _strmessage:='仓位不能为空'; }
            KmessageDlg(GetMessage('frmLocationIN','009'),mtWarning,[mbOK],0);
            if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
            grdLocationINItem.setfocus;
            data.qryLocationinDetail.enablecontrols;
            data.qryLocationinItem.enablecontrols;
            data.qryLocInItemCasing.EnableControls;
            exit;
         end;
           //know自动合计,不需要判断  data.qryLocationinDetail与data.qryLocationinItem的数量一致性
//         data.qryLocationinItem.fieldbyName('locid').asstring       :=strLocID;
//         data.qryLocationinItem.fieldbyName('locname').asstring     :=strLocName;
      end;
      //任务商品明细过滤
      if (data.qryLocInSkuDetail.active) then
      begin
         data.qryLocInSkuDetail.Filter:='sno='+data.qryLocationInItem.fieldbyname('sno').AsString;
         data.qryLocInSkuDetail.First;
         while not data.qryLocInSkuDetail.Eof do
         begin
            data.qryLocInSkuDetail.Edit;
            data.qryLocInSkuDetail.fieldbyname('jobno').asstring:=data.qryLocationIn.fieldbyname('jobno').AsString;
            data.qryLocInSkuDetail.fieldbyname('quantityremain').AsFloat:=data.qryLocInSkuDetail.fieldbyname('quantity').AsFloat;
//                  data.qryLocInSkuDetail.fieldbyname('lotcode').asstring:=data.qryLocationInItem.fieldbyname('lotcode').AsString;
            data.qryLocInSkuDetail.FieldByName('costcusid').AsString:=data.qryLocationInItem.fieldbyname('costcusid').AsString;
            data.qryLocInSkuDetail.FieldByName('costcusname').AsString:=data.qryLocationInItem.fieldbyname('costcusname').AsString;
            data.qryLocInSkuDetail.FieldByName('shippercusid').AsString:=data.qryLocationInItem.fieldbyname('shippercusid').AsString;
            data.qryLocInSkuDetail.FieldByName('shippercusname').AsString:=data.qryLocationInItem.fieldbyname('shippercusname').AsString;
            data.qryLocInSkuDetail.FieldByName('cusid').AsString:=data.qryLocationInItem.fieldbyname('cusid').AsString;
            data.qryLocInSkuDetail.FieldByName('cusname').AsString:=data.qryLocationInItem.fieldbyname('cusname').AsString;
            data.qryLocInSkuDetail.FieldByName('userid').AsString:=data.qryLocationIn.fieldbyname('userid').AsString;
            data.qryLocInSkuDetail.FieldByName('username').AsString:=data.qryLocationIn.fieldbyname('username').AsString;
            data.qryLocInSkuDetail.FieldByName('iuserid').AsString:=data.qryLocationIn.fieldbyname('iuserid').AsString;
            data.qryLocInSkuDetail.FieldByName('iusername').AsString:=data.qryLocationIn.fieldbyname('iusername').AsString;
            data.qryLocInSkuDetail.FieldByName('operationdate').AsDateTime:=data.qryLocationInItem.fieldbyname('operationdate').AsDateTime;
            data.qryLocInSkuDetail.Next;
         end;
      end;
      data.qryLocationinItem.edit;
      data.qryLocationinItem.fieldbyName('Quantity').AsFloat     :=QuantityTotalDetail;
      data.qryLocationinItem.fieldbyName('Piece').AsFloat        :=PieceTotalDetail;
      data.qryLocationinItem.fieldbyName('Volume').AsFloat       :=VolumeTotalDetail;
      data.qryLocationinItem.fieldbyName('NetWeight').AsFloat    :=NetWeightTotalDetail;
      data.qryLocationinItem.fieldbyName('GrossWeight').AsFloat  :=GrossWeightTotalDetail;
      data.qryLocationinItem.fieldbyName('area').AsFloat         :=AreaTotalDetail;
      if (getSysdata('qdtext')='T') and (data.qryLocationIn.FieldByName('operationname').AsString<>'') then
      begin
         data.qryLocationinItem.fieldbyName('Quantitytask').AsFloat     :=QuantityTotalDetail;
         data.qryLocationinItem.fieldbyName('Piecetask').AsFloat        :=PieceTotalDetail;
         data.qryLocationinItem.fieldbyName('Volumetask').AsFloat       :=VolumeTotalDetail;
         data.qryLocationinItem.fieldbyName('NetWeighttask').AsFloat    :=NetWeightTotalDetail;
         data.qryLocationinItem.fieldbyName('GrossWeighttask').AsFloat  :=GrossWeightTotalDetail;
         data.qryLocationinItem.fieldbyName('areatask').AsFloat         :=AreaTotalDetail;
      end;

      data.qryLocationinItem.fieldbyName('casing1').AsFloat      :=casing1TotalDetail;
      data.qryLocationinItem.fieldbyName('casing2').AsFloat      :=casing2TotalDetail;
      data.qryLocationinItem.fieldbyName('casing3').AsFloat      :=casing3TotalDetail;
      data.qryLocationinItem.fieldbyName('casing4').AsFloat      :=casing4TotalDetail;
      data.qryLocationinItem.fieldbyName('casing5').AsFloat      :=casing5TotalDetail;
      data.qryLocationinItem.fieldbyName('costquantity').AsFloat :=costquantityTotalDetail;//计费数量
      data.qrylocationinItem.fieldbyname('quantitysl').asfloat   :=QuantityTotalDetail-
                                                            data.qrylocationinItem.fieldbyname('quantitytask').asfloat;
      if (data.qryLocationinItem.fieldbyName('Quantity').AsFloat
                   <>data.qryLocationinItem.fieldbyName('Quantitytask').AsFloat) and
           (_isinfromdetail='T') and ((strFlow='ITEM') or (_strsyscus='JG'))
      then
      begin
         if _strsyscus='JG' then
         begin
            if data.qryLocationinItem.fieldbyName('Quantity').AsFloat=0 then
              strjgwsjsno:=strjgwsjsno+':'+data.qryLocationinItem.fieldbyName('sno').asstring
            else
              strjgsno:=strjgsno+':'+data.qryLocationinItem.fieldbyName('sno').asstring;

         end else
         begin
            if (not blnTotaltask) and (QuantityTotalDetail<>0)
            and (KMessageDlg('任务数量与实际数量不同,是否更正?',mtConfirmation,[mbyes,mbno],0)=mrYes) then
            begin
               blnTotaltask:=true;
            end;
            if blnTotaltask and (QuantityTotalDetail<>0) then
               data.qryLocationinItem.fieldbyName('Quantitytask').AsFloat     :=QuantityTotalDetail;
         end;

      end;
      if pos(data.qryLocationInItem.fieldbyname('shippercusname').AsString,strshippercusname)=0 then
         strshippercusname:=strshippercusname+data.qryLocationInItem.fieldbyname('shippercusname').AsString+' ';
      if pos(data.qryLocationInItem.fieldbyname('cusname').AsString,strcusname)=0 then
         strcusname:=strcusname+data.qryLocationInItem.fieldbyname('cusname').AsString+' ';

      if strSysCus='WYFQ' then
      begin
         strlocnameHJ:=Copy(strlocnameHJ,1,Length(strlocnameHJ)-1);
         data.qryLocationInItem.fieldbyname('locname').AsString:=strlocnameHJ;
      end;

      data.qryLocationINItem.Next;
   end;
   //lzw20111110
   if _strsyscus='JG' then
   begin
      if strjgsno <>'' then
      begin
         KMessageDlg('序号为"'+strjgsno+'"的任务和实际数量不一致',mtWarning,[mbOK],0);
      end;
      if strjgwsjsno <>'' then
      begin
         KMessageDlg('序号为"'+strjgwsjsno+'"未上架',mtWarning,[mbOK],0);
      end;
   end;
   data.qryLocationINItem.First;
   data.qryLocationINItem.EnableControls;
   data.qryLocationinDetail.EnableControls;
   data.qryLocInItemCasing.EnableControls;

   opensql(datatmp.qryTmp,'select LBNOnum=count(1)'
                 +'  from LocationIn(nolock) '
                 +' where LocationBillNO="'+data.qryLocationin.FieldByName('LocationBillNO').Asstring+'"'
                 +'   and jobno<>"'+data.qryLocationin.FieldByName('jobno').Asstring+'"'
                 );
   if datatmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0 then
   begin
      KMessageDlg('该仓单号已存在，不允许保存！',mtWarning,[mbOK],0);
      exit;
   end;
    //判断LocationBillNO是否有重复
{    if stroldLocationBillNO<>data.qryLocationin.FieldByName('LocationBillNO').Asstring then
    begin
    end;}
    //判断CustomsNO是否有重复
//in

  sltAutoCost.clear;
  strNo:='';
  data.qryAutoCountcostin.DisableControls;
  data.qryautocountcostin.First;
  while not data.qryAutoCountcostin.Eof do
  begin
     if sltAutoCost.IndexOf(data.qryAutoCountcostin.fieldbyname('costcd').asstring
                     +data.qryAutoCountcostin.fieldbyname('isincome').asstring
                     +data.qryAutoCountcostin.fieldbyname('ismainrate').asstring
                     +data.qryAutoCountcostin.fieldbyname('costcusid').asstring
                     +data.qryAutoCountcostin.fieldbyname('costcusname').asstring
                     +data.qryAutoCountcostin.fieldbyname('ratecusid').asstring
                     +data.qryAutoCountcostin.fieldbyname('ratecusname').asstring
                     +data.qryAutoCountcostin.fieldbyname('ratecus').asstring
                     +data.qryAutoCountcostin.fieldbyname('costcus').asstring
                     +data.qryAutoCountcostin.fieldbyname('rateuomtype').asstring
                     +data.qryautocountcostin.FieldByName('countway').AsString)<>-1 then
     strNo:=strNO+data.qryAutoCountcostin.fieldbyname('sno').asstring+','
     else
        sltAutoCost.Add(data.qryAutoCountcostin.fieldbyname('costcd').asstring
                        +data.qryAutoCountcostin.fieldbyname('isincome').asstring
                        +data.qryAutoCountcostin.fieldbyname('ismainrate').asstring
                        +data.qryAutoCountcostin.fieldbyname('costcusid').asstring
                        +data.qryAutoCountcostin.fieldbyname('costcusname').asstring
                        +data.qryAutoCountcostin.fieldbyname('ratecusid').asstring
                        +data.qryAutoCountcostin.fieldbyname('ratecusname').asstring
                        +data.qryAutoCountcostin.fieldbyname('ratecus').asstring
                        +data.qryAutoCountcostin.fieldbyname('costcus').asstring
                        +data.qryAutoCountcostin.fieldbyname('rateuomtype').asstring
                        +data.qryautocountcostin.FieldByName('countway').AsString
                        );
    data.qryAutoCountcostin.Next;
  end;
  data.qryAutoCountcostin.First;
  data.qryAutoCountcostin.EnableControls;
  if strNO<>'' then
  begin
     if KmessageDlg('NO.'+strNO+GetMessage('TW','001'),mtConfirmation,[mbYes,mbNo],0)<>mryes then//'是重复计费条目，是否保存?'
     Exit;
  end;

   if (stroldCustomsNO<>data.qryLocationIn.FieldByName('Customsno').AsString) and (stroldCustomsNO<>'') then
   begin
      opensql(datatmp.qryTmp,'select LBNOnum=count(1)'
                            +'  from LocationIn (nolock) '
                            +' where CustomsNO="'+data.qryLocationin.FieldByName('CustomsNO').Asstring+'"');
      if (datatmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0)  then
      begin
        { if _Language='CAPTIONC' then _strmessage:='存在相同的报关单号,是否要保存?'
         else _strmessage:='存在相同的报关单号,是否要保存?'; }
         if KmessageDlg(GetMessage('frmLocationIN','010'),mtConfirmation,[mbYes,mbNo],0)=mrNO then
            exit;
      end;
   end;

   if (strmainorder<>'')and(data.qryLocationin.fieldbyname('mainorder').asString='') then
   //lzw 20080603
   begin
      if getSysdata('xytext')<>'T' then
      data.qryLocationin.fieldbyname('mainorder').asString:=strmainorder;
   end;
   btnTotal.Click;

   data.qryin.edit;
   data.qryin.fieldbyname('SKUName').asstring          :=data.qrylocationin.fieldbyname('SKUName').asstring;
   data.qryin.fieldbyname('cusbillno').asstring        :=data.qryLocationIn.FieldByName('cusbillno').AsString;
   data.qryin.fieldbyname('taskiscomplete').asstring   :=data.qryLocationIn.FieldByName('taskiscomplete').AsString;
   data.qryin.fieldbyname('Jobno').asstring            :=data.qryLocationin.fieldbyname('Jobno').asstring;
   data.qryin.fieldbyname('UserID').asstring           :=data.qryLocationin.fieldbyname('UserID').asstring;
   data.qryin.fieldbyname('iuserid').asstring          :=data.qryLocationin.fieldbyname('iuserid').asstring;
   data.qryin.fieldbyname('iUserName').asstring        :=data.qryLocationin.fieldbyname('iUserName').asstring;
   data.qryin.fieldbyname('TaskDate').asDatetime       :=data.qryLocationin.fieldbyname('TaskDate').asDateTime;
   data.qryin.fieldbyname('CARRIERDATE').asDatetime    :=data.qryLocationin.fieldbyname('CARRIERDATE').asDateTime;
   data.qryin.fieldbyname('OPERATIONDATE').asDatetime  :=data.qryLocationin.fieldbyname('OPERATIONDATE').asDateTime;        ;
   data.qryin.fieldbyname('CreateName').asstring       :=data.qryLocationin.fieldbyname('CreateName').asstring;
   data.qryin.fieldbyname('operationname').asstring    :=data.qryLocationin.fieldbyname('operationname').asstring;
   data.qryin.fieldbyname('LocationBillNO').asstring   :=data.qryLocationin.fieldbyname('LocationBillNO').asstring;
   data.qryin.fieldbyname('corpno').asstring           :=data.qryLocationin.fieldbyname('corpno').asstring;
   data.qryin.fieldbyname('MainOrder').asstring        :=data.qryLocationin.fieldbyname('MainOrder').asstring;
   data.qryin.fieldbyname('checkname').asstring        :=data.qryLocationin.fieldbyname('checkname').asstring;
   data.qryin.fieldbyname('CountName').asstring        :=data.qryLocationin.fieldbyname('CountName').asstring;
   data.qryin.fieldbyname('QuantityTasked').asstring   :=data.qryLocationin.fieldbyname('QuantityTasked').asstring;
   data.qryin.fieldbyname('costcusid').asstring        :=data.qryLocationin.fieldbyname('costcusid').asstring;
   data.qryin.fieldbyname('costcusname').asstring      :=data.qryLocationin.fieldbyname('costcusname').asstring;
   data.qryin.fieldbyname('Shippercusid').asString     :=data.qryLocationin.fieldbyname('Shippercusid').asString;
   data.qryin.fieldbyname('cusname').asString          :=data.qryLocationin.fieldbyname('cusname').asString;
   data.qryin.fieldbyname('LoadTypeName').asstring     :=iif(rdgLoadType.ItemIndex=0,'散货','整柜');
   data.qryin.fieldbyname('condes').asstring           :=data.qryLocationin.fieldbyname('condes').asstring;
   data.qryin.fieldbyname('CustomsNO').asstring        :=data.qryLocationin.fieldbyname('CustomsNO').asstring;
   data.qryin.fieldbyname('Piece').AsFloat             :=data.qryLocationin.fieldbyname('Piece').AsFloat;
   data.qryin.fieldbyname('loadcosttype').AsString     :=data.qryLocationin.fieldbyname('loadcosttype').AsString;
   data.qryin.fieldbyname('PieceTasked').asFloat       :=data.qryLocationin.fieldbyname('PieceTasked').asFloat;
   data.qryin.fieldbyname('VolumeTasked').asFloat      :=data.qryLocationin.fieldbyname('VolumeTasked').asFloat;
   data.qryin.fieldbyname('quantity').asFloat          :=data.qryLocationin.fieldbyname('quantity').asFloat;
   data.qryin.fieldbyname('grossweight').asFloat       :=data.qryLocationin.fieldbyname('grossweight').asFloat;
   data.qryin.fieldbyname('netweight').asFloat         :=data.qryLocationin.fieldbyname('netweight').asFloat;
   data.qryin.fieldbyname('Volume').asFloat            :=data.qryLocationin.fieldbyname('Volume').asFloat;
   data.qryin.FieldByName('TASKDATErq').AsString       :=datetostr(data.qryLocationin.FieldByName('TASKDATE').Asdatetime);
   data.qryin.FieldByName('TASKDATEsj').AsString       :=timetostr(data.qryLocationin.FieldByName('TASKDATE').Asdatetime);
   data.qryin.FieldByName('blno').AsString             :=data.qryLocationin.FieldByName('blno').AsString;
   Result:=True;
end;

procedure TfrmLocationIN.InitValues;
{新增时赋初始值}
var
  strCreateID:string;
  qryselect:TKADOQuery;
begin
   //赋业务联系单号
{   opensql(datatmp.qryTmp,
           'select dhcx=max(convert(int,substring(docno1,7,8))) '
          +'  from genjobno '
          +' where substring(docno1,1,2)="JC"  '
          +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   data.qryLocationin.Edit;
   data.qryLocationin.FieldByName('OperationType').AsInteger:=1;
   data.qryLocationin.FieldByName('LocationBillNO').Asstring:='JC'+copy(datetostr(GetServerDate),1,4)
                                                           +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
}
   data.qryLocationin.Edit;
   data.qryLocationin.FieldByName('OperationType').AsInteger:=1;
   if _isbondout=True then
   begin
      data.qryLocationIn.FieldByName('isbondout').AsBoolean:=True;
   end;
   //lzw20091202
   if getSysdata('hxtext')='T' then
   begin
      cmbLoadCostType.Text:='';
   end;
   if _paper='T' then
   begin
      data.qryLocationin.FieldByName('costcusid').Asstring:=strcusid;
      data.qryLocationin.FieldByName('costcusname').Asstring:=strcusname;
      data.qryLocationin.FieldByName('locationbillno').Asstring:=strlocno;
   end else
      data.qryLocationin.FieldByName('LocationBillNO').Asstring:=GetLocationBillNO;
   strCreateID:=genJobno('LI',data.qryLocationin.FieldByName('LocationBillNO').Asstring);

   if strSysCus='SZWY' then
   begin
      data.qryLocationin.FieldByName('shipcusname').Asstring:='广州威洋';
      data.qryLocationin.FieldByName('shipcusid').Asstring:='00000000000000000015';
   end;
   present:=GetServerDate;
   if blnCopy then
   begin
      blnCopy:=False;
      //data.qryLocationin复制
      GatherFromArray(data.qryLocationin,arrLocationINOUT,false);
      data.qryLocationin.FieldByName('Jobno').Asstring:=strCreateID;
      data.qryLocationin.FieldByName('UserID').Asstring:=_UserID;
      data.qryLocationin.FieldByName('Username').Asstring:=_Username;
      data.qryLocationin.FieldByName('operationname').Clear;
      data.qryLocationin.FieldByName('OPERATIONDate').Clear;
      data.qryLocationin.FieldByName('checkname').Clear;
      data.qryLocationin.FieldByName('CheckDate').Clear;
      data.qryLocationin.FieldByName('CountUserName').Clear;
      data.qryLocationin.FieldByName('CountDate').Clear;
      data.qryLocationin.FieldByName('ACTCHKUserName').Clear;
      data.qryLocationin.FieldByName('ACTCHKDate').Clear;
      //data.qryLocationinItemTask复制
      data.qryLocationinItem.DisableControls;
      GatherFromArray(data.qryLocationinItem,arrLocationINItem,true);
      with data.qryLocationINItem do
      begin
         First;
         while not Eof do
         begin
            Edit;
            FieldByName('Jobno').Asstring:=strCreateID;
            FieldByName('UserID').Asstring:=_UserID;
            if FieldByName('SNO').AsInteger>maxLocationINItem
            then maxLocationINItem:=FieldByName('SNO').AsInteger;
            next;
         end;
         First;
      end;
      data.qryLocationINItem.EnableControls;
   end else
   begin
      if qryWareOrderEdit<>nil then //由指令单导入信息
      begin
         //data.qryLocationin
         strJobnoOrder:=qryWareOrderEdit.FieldByName('Jobno').AsString;
         data.qryLocationin.Edit;
         data.qryLocationin.FieldByName('JOBNO').AsString            :=strCreateID;
         data.qryLocationin.FieldByName('jobnoori').AsString         :=qryWareOrderEdit.FieldByName('jobnoori').AsString;
         data.qryLocationin.FieldByName('jobnoine').AsString         :=qryWareOrderEdit.FieldByName('jobnoin').AsString;
         data.qryLocationin.FieldByName('ordercreatename').AsString  :=qryWareOrderEdit.FieldByName('createname').AsString;
         data.qryLocationin.FieldByName('TASKDATE').AsDateTime       :=present;
         data.qryLocationin.FieldByName('LoadType').AsString         :=qryWareOrderEdit.FieldByName('LoadType').AsString;
         data.qryLocationin.FieldByName('Carriercusid').AsString     :=qryWareOrderEdit.FieldByName('Carriercusid').AsString;
         data.qryLocationin.FieldByName('shipcusid').AsString        :=qryWareOrderEdit.FieldByName('shipcusid').AsString;
         data.qryLocationin.FieldByName('CarriercusName').AsString   :=qryWareOrderEdit.FieldByName('CarriercusName').AsString;
         data.qryLocationin.FieldByName('shipcusname').AsString      :=qryWareOrderEdit.FieldByName('shipcusname').AsString;
         data.qryLocationin.FieldByName('Carbrand').AsString         :=qryWareOrderEdit.FieldByName('Carbrand').AsString;
         data.qryLocationin.FieldByName('carrierno').AsString        :=qryWareOrderEdit.FieldByName('carrierno').AsString;
         data.qryLocationin.FieldByName('costcusname').AsString      :=qryWareOrderEdit.FieldByName('costcusname').AsString;
         data.qryLocationin.FieldByName('costcusid').AsString        :=qryWareOrderEdit.FieldByName('costcusid').AsString;
         data.qryLocationin.FieldByName('costcusnameout').AsString   :=qryWareOrderEdit.FieldByName('costcusnameout').AsString;
         data.qryLocationin.FieldByName('costcusidout').AsString     :=qryWareOrderEdit.FieldByName('costcusidout').AsString;
         data.qryLocationin.FieldByName('MainOrder').AsString        :=qryWareOrderEdit.FieldByName('MainOrder').AsString;
         data.qryLocationin.FieldByName('cusbillno').AsString        :=qryWareOrderEdit.FieldByName('cusbillno').AsString;
         data.qryLocationin.FieldByName('corpno').AsString           :=qryWareOrderEdit.FieldByName('corpno').AsString;
         if qryWareOrderEdit.FieldByName('CarrierDate').AsDateTime<>0 then
           data.qryLocationin.FieldByName('CarrierDate').AsDateTime  :=qryWareOrderEdit.FieldByName('CarrierDate').AsDateTime
         else
           data.qryLocationin.FieldByName('CarrierDate').Clear;
         data.qryLocationin.FieldByName('BLNO').AsString             :=qryWareOrderEdit.FieldByName('BLNO').AsString;
         data.qryLocationin.FieldByName('CONNO').AsString            :=qryWareOrderEdit.FieldByName('CONNO').AsString;
         data.qryLocationin.FieldByName('SealNO').AsString           :=qryWareOrderEdit.FieldByName('SealNO').AsString;
         data.qryLocationin.FieldByName('CONType').AsString          :=qryWareOrderEdit.FieldByName('CONType').AsString;
         data.qryLocationin.FieldByName('CONSPType').AsString        :=qryWareOrderEdit.FieldByName('CONSPType').AsString;
         data.qryLocationin.FieldByName('Routing').AsString          :=qryWareOrderEdit.FieldByName('Routing').AsString;
         data.qryLocationin.FieldByName('SKUName').AsString          :=qryWareOrderEdit.FieldByName('SKUName').AsString;
         data.qryLocationin.FieldByName('PieceUOM').AsString         :=qryWareOrderEdit.FieldByName('PieceUOM').AsString;
         data.qryLocationin.FieldByName('WeightUOM').AsString        :=qryWareOrderEdit.FieldByName('WeightUOM').AsString;
         data.qryLocationin.FieldByName('VolumeUOM').AsString        :=qryWareOrderEdit.FieldByName('VolumeUOM').AsString;
         data.qryLocationin.FieldByName('AreaUOM').AsString          :=qryWareOrderEdit.FieldByName('AreaUOM').AsString;
         data.qryLocationin.FieldByName('OPID').AsString             :=qryWareOrderEdit.FieldByName('costOPID').AsString;
         data.qryLocationin.FieldByName('OPName').AsString           :=qryWareOrderEdit.FieldByName('costOPName').AsString;
         data.qryLocationin.FieldByName('Remark').AsString           :=qryWareOrderEdit.FieldByName('Remark').AsString;
         data.qryLocationin.FieldByName('SKUCOSTCLASSCD').AsString   :=qryWareOrderEdit.FieldByName('SKUCOSTCLASSCD').AsString;
         data.qryLocationin.FieldByName('QuantityUOM').AsString      :=qryWareOrderEdit.FieldByName('QuantityUOM').AsString;
         data.qryLocationin.FieldByName('skucost').AsFloat           :=qryWareOrderEdit.FieldByName('skucost').AsFloat;
         data.qryLocationin.FieldByName('InspectionNo').AsString        :=qryWareOrderEdit.FieldByName('InspectionNo').AsString;
         //lzw20090907
         data.qryLocationin.FieldByName('CustomsNO').AsString        :=qryWareOrderEdit.FieldByName('CustomsNO').AsString;
         data.qryLocationin.FieldByName('countwith1').Asstring:='F';
         data.qryLocationin.FieldByName('WareRentCountType').Asstring:=qryWareOrderEdit.FieldByName('WareRentCountType').AsString;
         data.qryLocationin.FieldByName('WareRentCountTypeout').Asstring:=qryWareOrderEdit.FieldByName('WareRentCountTypeout').AsString;
         data.qryLocationin.FieldByName('contwithloca').AsString     :=qryWareOrderEdit.FieldByName('contwithloca').AsString;
         data.qryLocationin.FieldByName('LotTracked').AsString       :=qryWareOrderEdit.FieldByName('LotTracked').AsString;
         data.qryLocationin.FieldByName('IsBond').AsString           :=qryWareOrderEdit.FieldByName('IsBond').AsString;
         data.qryLocationin.FieldByName('countrent').AsString        :=qryWareOrderEdit.FieldByName('countrent').AsString;
         data.qryLocationin.FieldByName('countcontcost').AsString    :=qryWareOrderEdit.FieldByName('countcontcost').AsString;
         data.qryLocationin.fieldbyname('loadcosttype').asstring     :=qryWareOrderEdit.FieldByName('loadcosttype').AsString;

         data.qryLocationin.fieldbyname('OriginOrder').asstring     :=qryWareOrderEdit.FieldByName('OriginOrder').AsString;
         data.qryLocationin.fieldbyname('DestOrder').asstring       :=qryWareOrderEdit.FieldByName('DestOrder').AsString;
         data.qryLocationin.fieldbyname('CarrierName').asstring     :=qryWareOrderEdit.FieldByName('CarrierName').AsString;
         data.qryLocationin.fieldbyname('cususername').asstring     :=qryWareOrderEdit.FieldByName('cususername').AsString;
         data.qryLocationin.fieldbyname('costquantitytasked').AsFloat    :=qryWareOrderEdit.FieldByName('costquantity').AsFloat;
         data.qryLocationin.fieldbyname('costquantityuom').asstring :=qryWareOrderEdit.FieldByName('costquantityuom').AsString;
         if  _wareuserid='T' then
         begin
            data.qryLocationin.FieldByName('UserID').Asstring:=qryWareOrderEdit.FieldByName('userid').AsString;
            data.qryLocationin.FieldByName('Username').Asstring:=qryWareOrderEdit.FieldByName('username').AsString;
            data.qryLocationin.FieldByName('iUserID').Asstring:=qryWareOrderEdit.FieldByName('iuserid').AsString;
            data.qryLocationin.FieldByName('iUsername').Asstring:=qryWareOrderEdit.FieldByName('iusername').AsString;
         end;
         //lzw20090512
         if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
         begin
            opensql(datatmp.qryTmp,'select  mincostin from  customer(nolock ) '
                           +' where cusid="'+qryWareOrderEdit.FieldByName('costcusid').AsString+'"  '
                   );
            data.qryLocationin.FieldByName('mincostin').Asstring:=datatmp.qryTmp.FieldByName('mincostin').AsString;
         end;
         //lzw20090429
         if (strSysCus='SWZ') or (getsysdata('hxtext')='T')  or (getsysdata('xytext')='T')then
         begin
            //lzw20090504
            GetCusCnfg;
            OpenSql(datatmp.qryTmp,'select * from contract (nolock)    '+chr(13)+chr(10)
                                  +' where signcusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                                  +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                                  +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                              );
            if datatmp.qryTmp.RecordCount<>0 then
            begin
              data.qryLocationIn.FieldByName('corpno').AsString  :=datatmp.qryTmp.FieldByName('contractno').asstring;
            end;
         end else
         begin
            qrySelect:=pGetCuscnfgSelect( data.qryLocationin.FieldByName('costcusid').AsString,
                                          data.qryLocationin.FieldByName('costcusname').AsString,'仓储');

            if (qrySelect.FieldByName('jobno').AsString<>'NO') and (not qryselect.isempty) then
            begin
              data.qryLocationin.FieldByName('TagEach').Asstring           :=qrySelect.FieldByName('TagEach').Asstring;
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
         end;
         //lzw20111019在保存的时候已经写了
         OpenSql(dataTmp.qryTmp,'select 1 from locationinoutcon '
                               +' where jobno="'+qryWareOrderEdit.FieldByName('jobno').AsString+'" '
                               +'   and iscon="T" ');
         if (dataTmp.qryTmp.RecordCount<>0) and (getSysdata('qdtext')='T')then
         begin
            if KmessageDlg('是否将货柜信息传入到进仓任务？',mtConfirmation,[mbYes,mbNo],0)=mryes then
            ExecSql(dataTmp.qryTmp,'insert into locationinoutcon    '
                                  +'      (jobno, userid, username, conno, '
                                  +'       sealno, contype, consptype, conquantity, '
                                  +'       remark, sno, liftconcusid, liftconcusname,  '
                                  +'       loadgroupcusid, loadgroupcusname, forkgroupcusid, forkgroupcusname,'
                                  +'       liftmachinecusid, liftmachinecusname, conveno, convetype,  '
                                  +'       xszh, drivername, driveridcar, iscon, '
                                  +'       blno, operationtype, drivecardno,ischeck, '
                                  +'       cuscheck,  arrivedate, loadcomdate, shipname)  '
                                  +'select jobno="'+strCreateID+'",userid, username, conno, '
                                  +'       sealno, contype, consptype, conquantity, '
                                  +'       remark, sno, liftconcusid, liftconcusname,  '
                                  +'       loadgroupcusid, loadgroupcusname, forkgroupcusid, forkgroupcusname,'
                                  +'       liftmachinecusid, liftmachinecusname, conveno, convetype,  '
                                  +'       xszh, drivername, driveridcar, iscon, '
                                  +'       blno, operationtype, drivecardno,ischeck, '
                                  +'       cuscheck,  arrivedate, loadcomdate, shipname '
                                  +'  from locationinoutcon(nolock)  '
                                  +' where jobno="'+qryWareOrderEdit.FieldByName('jobno').AsString+'" ');
         end;
         qryWareOrderEdit:=nil;
         //data.qryLocationinItemTask
         if  pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   //任务增加
         mitAddLocItemClick(self);
         qryWareOrderSKU.First;
         while not qryWareOrderSKU.Eof do
         begin
            //lzw20110704
            if (qryWareOrderSku.FieldByName('quantity').AsFloat-qryWareOrderSku.FieldByName('quantitytask').AsFloat>0)
               and (qrywareordersku.fieldbyname('piece').asfloat-qrywareordersku.fieldbyname('piecetask').asfloat>=0)
               and (qrywareordersku.fieldbyname('netweight').asfloat-qrywareordersku.fieldbyname('netweighttask').asfloat>=0)
               and (qrywareordersku.fieldbyname('grossweight').asfloat-qrywareordersku.fieldbyname('grossweighttask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('volume').asfloat-qrywareordersku.fieldbyname('volumetask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('area').asfloat-qrywareordersku.fieldbyname('areatask').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing1').asfloat-qrywareordersku.fieldbyname('casing1task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing2').asfloat-qrywareordersku.fieldbyname('casing2task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing3').asfloat-qrywareordersku.fieldbyname('casing3task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing4').asfloat-qrywareordersku.fieldbyname('casing4task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('casing5').asfloat-qrywareordersku.fieldbyname('casing5task').asfloat>=0)
               //and (qrywareordersku.fieldbyname('costquantity').AsFloat-qrywareordersku.fieldbyname('costquantitytask').AsFloat>=0)
//                or (_DB_Order<>'T')
            then
            begin
               if qryWareOrderSKU.BOF then
               begin
                  data.qryLocationin.Edit;
               end;
               data.qryLocationinItem.Append;
               data.qrylocationinitem.fieldbyname('jobnoorder').asstring      :=qrywareordersku.fieldbyname('jobno').asstring;
               data.qrylocationinitem.fieldbyname('snoorder').asinteger       :=qrywareordersku.fieldbyname('sno').asinteger;
               data.qrylocationinitem.fieldbyname('skuid').asstring           :=qrywareordersku.fieldbyname('skuid').asstring;
               data.qrylocationinitem.fieldbyname('lotcode').asstring         :=qrywareordersku.fieldbyname('lotcode').asstring;
               data.qrylocationinitem.fieldbyname('quantitytask').asfloat     :=qrywareordersku.fieldbyname('quantity').asfloat-qrywareordersku.fieldbyname('quantitytask').asfloat;
               data.qrylocationinitem.fieldbyname('sequencenum').asstring     :=qrywareordersku.fieldbyname('sequencenum').asstring;
               data.qrylocationinitem.fieldbyname('qualityname').asstring     :=qrywareordersku.fieldbyname('qualityname').asstring;
               data.qrylocationinitem.fieldbyname('skuname').asstring         :=qrywareordersku.fieldbyname('skuname').asstring;
               data.qrylocationinitem.fieldbyname('operationtype').asstring   :=qrywareordersku.fieldbyname('operationtype').asstring;
               data.qrylocationinitem.fieldbyname('pieceuom').asstring        :=qrywareordersku.fieldbyname('pieceuom').asstring;
               data.qrylocationinitem.fieldbyname('weightuom').asstring       :=qrywareordersku.fieldbyname('weightuom').asstring;
               data.qrylocationinitem.fieldbyname('volumeuom').asstring       :=qrywareordersku.fieldbyname('volumeuom').asstring;
               data.qrylocationinitem.fieldbyname('areauom').asstring         :=qrywareordersku.fieldbyname('areauom').asstring;
               data.qrylocationinitem.fieldbyname('piecetask').asfloat        :=qrywareordersku.fieldbyname('piece').asfloat-qrywareordersku.fieldbyname('piecetask').asfloat;
               data.qrylocationinitem.fieldbyname('netweighttask').asfloat    :=qrywareordersku.fieldbyname('netweight').asfloat-qrywareordersku.fieldbyname('netweighttask').asfloat;
               data.qrylocationinitem.fieldbyname('grossweighttask').asfloat  :=qrywareordersku.fieldbyname('grossweight').asfloat-qrywareordersku.fieldbyname('grossweighttask').asfloat;
               data.qrylocationinitem.fieldbyname('volumetask').asfloat       :=qrywareordersku.fieldbyname('volume').asfloat-qrywareordersku.fieldbyname('volumetask').asfloat;
               data.qrylocationinitem.fieldbyname('areatask').asfloat         :=qrywareordersku.fieldbyname('area').asfloat-qrywareordersku.fieldbyname('areatask').asfloat;
               data.qrylocationinitem.fieldbyname('cusid').asstring           :=qrywareordersku.fieldbyname('cusid').asstring;
               data.qrylocationinitem.fieldbyname('cusname').asstring         :=qrywareordersku.fieldbyname('cusname').asstring;
               data.qrylocationinitem.fieldbyname('shippercusid').asstring    :=qrywareordersku.fieldbyname('shippercusid').asstring;
               data.qrylocationinitem.fieldbyname('shippercusname').asstring  :=qrywareordersku.fieldbyname('shippercusname').asstring;
               data.qrylocationinitem.fieldbyname('shipcusid').asstring       :=qrywareordersku.fieldbyname('shipcusid').asstring;
               data.qrylocationinitem.fieldbyname('shipcusname').asstring     :=qrywareordersku.fieldbyname('shipcusname').asstring;
               data.qrylocationinitem.fieldbyname('conscusid').asstring        :=qrywareordersku.fieldbyname('conscusid').asstring;
               data.qrylocationinitem.fieldbyname('conscusname').asstring      :=qrywareordersku.fieldbyname('conscusname').asstring;

               data.qrylocationinitem.fieldbyname('costcusid').asstring       :=qrywareordersku.fieldbyname('costcusid').asstring;
               data.qrylocationinitem.fieldbyname('costcusname').asstring     :=qrywareordersku.fieldbyname('costcusname').asstring;
               data.qrylocationinitem.fieldbyname('snoorder').asstring        :=qrywareordersku.fieldbyname('sno').asstring;
               data.qrylocationinitem.fieldbyname('price').asfloat            :=qrywareordersku.fieldbyname('price').asfloat;
               data.qrylocationinitem.fieldbyname('currcd').asstring          :=qrywareordersku.fieldbyname('currcd').asstring;
               data.qrylocationinitem.fieldbyname('skucost').asfloat          :=qrywareordersku.fieldbyname('skucost').asfloat;
               data.qrylocationinitem.fieldbyname('pricein').asfloat          :=qrywareordersku.fieldbyname('pricein').asfloat;
               data.qrylocationinitem.fieldbyname('skucostin').asfloat        :=qrywareordersku.fieldbyname('skucostin').asfloat;
               data.qrylocationinitem.fieldbyname('costuomtype').asstring     :=qrywareordersku.fieldbyname('costuomtype').asstring;
               data.qrylocationinitem.fieldbyname('locname').asstring         :=qrywareordersku.fieldbyname('locname').asstring;
               data.qrylocationinitem.fieldbyname('locid').asstring           :=qrywareordersku.fieldbyname('locid').asstring;
               data.qrylocationinitem.fieldbyname('quantityuom').asstring     :=qrywareordersku.fieldbyname('quantityuom').asstring            ;
               data.qrylocationinitem.fieldbyname('piecepro').asfloat         :=qrywareordersku.fieldbyname('piecepro').asfloat  ;
               data.qrylocationinitem.fieldbyname('volumepro').asfloat        :=qrywareordersku.fieldbyname('volumepro').asfloat ;
               data.qrylocationinitem.fieldbyname('areapro').asfloat          :=qrywareordersku.fieldbyname('areapro').asfloat   ;
               data.qrylocationinitem.fieldbyname('netweightpro').asfloat     :=qrywareordersku.fieldbyname('netweightpro').asfloat ;
               data.qrylocationinitem.fieldbyname('grossweightpro').asfloat   :=qrywareordersku.fieldbyname('grossweightpro').asfloat ;
               data.qrylocationinitem.fieldbyname('manufacturedate').asdatetime:=qrywareordersku.fieldbyname('manufacturedate').asdatetime ;
               if data.qrylocationinitem.fieldbyname('manufacturedate').asdatetime=0 then data.qrylocationinitem.fieldbyname('manufacturedate').clear;

               data.qrylocationinitem.fieldbyname('uom1').asstring            :=qrywareordersku.fieldbyname('uom1').asstring;
               data.qrylocationinitem.fieldbyname('uom2').asstring            :=qrywareordersku.fieldbyname('uom2').asstring;
               data.qrylocationinitem.fieldbyname('uom3').asstring            :=qrywareordersku.fieldbyname('uom3').asstring;
               data.qrylocationinitem.fieldbyname('uom4').asstring            :=qrywareordersku.fieldbyname('uom4').asstring;
               data.qrylocationinitem.fieldbyname('uom5').asstring            :=qrywareordersku.fieldbyname('uom5').asstring;
               data.qrylocationinitem.fieldbyname('casing1task').asfloat      :=qrywareordersku.fieldbyname('casing1').asfloat-qrywareordersku.fieldbyname('casing1task').asfloat;
               data.qrylocationinitem.fieldbyname('casing2task').asfloat      :=qrywareordersku.fieldbyname('casing2').asfloat-qrywareordersku.fieldbyname('casing2task').asfloat;
               data.qrylocationinitem.fieldbyname('casing3task').asfloat      :=qrywareordersku.fieldbyname('casing3').asfloat-qrywareordersku.fieldbyname('casing3task').asfloat;
               data.qrylocationinitem.fieldbyname('casing4task').asfloat      :=qrywareordersku.fieldbyname('casing4').asfloat-qrywareordersku.fieldbyname('casing4task').asfloat;
               data.qrylocationinitem.fieldbyname('casing5task').asfloat      :=qrywareordersku.fieldbyname('casing5').asfloat-qrywareordersku.fieldbyname('casing5task').asfloat;
               data.qrylocationinitem.fieldbyname('pro1').asfloat             :=qrywareordersku.fieldbyname('pro1').asfloat ;
               data.qrylocationinitem.fieldbyname('pro2').asfloat             :=qrywareordersku.fieldbyname('pro2').asfloat ;
               data.qrylocationinitem.fieldbyname('pro3').asfloat             :=qrywareordersku.fieldbyname('pro3').asfloat ;
               data.qrylocationinitem.fieldbyname('pro4').asfloat             :=qrywareordersku.fieldbyname('pro4').asfloat ;
               data.qrylocationinitem.fieldbyname('pro5').asfloat             :=qrywareordersku.fieldbyname('pro5').asfloat ;

//               data.qrylocationinitem.fieldbyname('jobnoin').asstring         :=qrywareordersku.fieldbyname('jobnoin').asstring ;
//               data.qrylocationinitem.fieldbyname('snoin').asinteger          :=qrywareordersku.fieldbyname('snoin').asinteger;
//               data.qrylocationinitem.fieldbyname('ldsnoin').asinteger        :=qrywareordersku.fieldbyname('ldsnoin').asinteger;
//               data.qrylocationinitem.fieldbyname('jobnoinf').asstring        :=qrywareordersku.fieldbyname('jobnoinf').asstring ;
//               data.qrylocationinitem.fieldbyname('snoinf').asinteger         :=qrywareordersku.fieldbyname('snoinf').asinteger;
//               data.qrylocationinitem.fieldbyname('ldsnoinf').asinteger       :=qrywareordersku.fieldbyname('ldsnoinf').asinteger;
               data.qrylocationinitem.fieldbyname('jobnoori').asstring        :=qrywareordersku.fieldbyname('jobnoori').asstring ;
               data.qrylocationinitem.fieldbyname('snoori').asinteger         :=qrywareordersku.fieldbyname('snoori').asinteger;

               data.qrylocationinitem.fieldbyname('customsno').asstring       :=qrywareordersku.fieldbyname('customsno').asstring ;
               data.qrylocationinitem.fieldbyname('locationbillno').asstring  :=qrywareordersku.fieldbyname('locationbillno').asstring ;
               data.qrylocationinitem.fieldbyname('lottracked').asstring      :=qrywareordersku.fieldbyname('lottracked').asstring ;
               data.qrylocationinitem.fieldbyname('tageach').asstring         :=qrywareordersku.fieldbyname('tageach').asstring ;
               data.qrylocationinitem.fieldbyname('tageachuom').asstring      :=qrywareordersku.fieldbyname('tageachuom').asstring ;
               data.qrylocationinitem.fieldbyname('warerentcounttype').asstring:=qrywareordersku.fieldbyname('warerentcounttype').asstring ;
               data.qrylocationinitem.fieldbyname('isbond').asstring           :=qrywareordersku.fieldbyname('isbond').asstring ;
               data.qrylocationinitem.fieldbyname('countrent').asstring        :=qrywareordersku.fieldbyname('countrent').asstring ;
               data.qrylocationinitem.fieldbyname('countcontcost').asstring    :=qrywareordersku.fieldbyname('countcontcost').asstring ;
               data.qrylocationinitem.fieldbyname('loadcostone').asstring      :=qrywareordersku.fieldbyname('loadcostone').asstring ;

               data.qrylocationinitem.fieldbyname('customerno').asstring      :=qrywareordersku.fieldbyname('SKU_CustomerID').asstring ;
               if qrywareordersku.fieldbyname('skustandard').asstring<>'' then
                  data.qrylocationinitem.fieldbyname('skuspec').asstring         :=qrywareordersku.fieldbyname('skustandard').asstring
               else
                  data.qrylocationinitem.fieldbyname('skuspec').asstring         :=qrywareordersku.fieldbyname('skuspec').asstring ;
               data.qrylocationinitem.fieldbyname('skumodel').asstring        :=qrywareordersku.fieldbyname('skumodel').asstring ;
               data.qrylocationinitem.fieldbyname('color').asstring           :=qrywareordersku.fieldbyname('color').asstring ;

               data.qrylocationinitem.fieldbyname('sno').asinteger             :=-1;
               data.qrylocationinitem.fieldbyname('snocasing').asinteger       :=-1;
               data.qrylocationinitem.fieldbyname('jobno').asstring            :=strcreateid;
               data.qrylocationinitem.fieldbyname('userid').asstring           :=_userid;
               data.qrylocationinitem.fieldbyname('costcusid').asstring        :=qrywareordersku.fieldbyname('costcusid').asstring;
               data.qrylocationinitem.fieldbyname('skucostclasscd').asstring   :=qrywareordersku.fieldbyname('skucostclasscd').asstring;
               data.qrylocationinitem.fieldbyname('notfullsign').asstring      :=qrywareordersku.fieldbyname('notfullsign').asstring;
               data.qrylocationinitem.fieldbyname('loadgroupcusid').asstring    :=copyloadgroupcusid;
               data.qrylocationinitem.fieldbyname('loadgroupcusname').asstring  :=copyloadgroupcusname;
               data.qrylocationinitem.fieldbyname('forkgroupcusid').asstring    :=copyforkgroupcusid;
               data.qrylocationinitem.fieldbyname('forkgroupcusname').asstring  :=copyforkgroupcusname;
               data.qrylocationinitem.fieldbyname('liftmachinecusid').asstring  :=copyliftmachinecusid;
               data.qrylocationinitem.fieldbyname('liftmachinecusname').asstring:=copyliftmachinecusname;

               data.qrylocationinitem.fieldbyname('RentCountUOMType').asstring   :=strRentCountUOMType;
               data.qrylocationinitem.fieldbyname('RentCountUOMTypeout').asstring:=strRentCountUOMTypeOut;
               data.qrylocationinitem.fieldbyname('CostCountUOMType').asstring   :=strCostCountUOMType;
               data.qrylocationinitem.fieldbyname('mainorder').asstring      :=qrywareordersku.fieldbyname('mainorder').asstring;
               data.qrylocationinitem.fieldbyname('corpno').asstring         :=qrywareordersku.fieldbyname('corpno').asstring;
               data.qrylocationinitem.fieldbyname('carriage').AsFloat        :=qrywareordersku.fieldbyname('carriage').AsFloat;
               data.qrylocationinitem.fieldbyname('carriagetotal').AsFloat   :=qrywareordersku.fieldbyname('carriagetotal').AsFloat;
               data.qrylocationinitem.fieldbyname('insurance').AsFloat       :=qrywareordersku.fieldbyname('insurance').AsFloat;
               data.qrylocationinitem.fieldbyname('insurancetotal').AsFloat  :=qrywareordersku.fieldbyname('insurancetotal').AsFloat;
               data.qrylocationinitem.fieldbyname('costquantitytask').AsFloat:=qrywareordersku.fieldbyname('costquantity').AsFloat-qrywareordersku.fieldbyname('costquantitytask').AsFloat;
               data.qrylocationinitem.fieldbyname('costquantityuom').AsString:=qrywareordersku.fieldbyname('costquantityuom').AsString;
               data.qrylocationinitem.fieldbyname('carriagecurrcd').asstring :=qrywareordersku.fieldbyname('carriagecurrcd').asstring;
    //           data.qryLocationinItem.Fieldbyname('WO_IsLast').asString           :='F';
               try
                  data.qryLocationinItem.Post;
               except
                  break;
               end;
            end;
            qryWareOrderSKU.next;
         end;
   //      data.qryLocationinItemTask.EnableControls;
         if pgcLocationINOUT.ActivePage<>tbsSKU then
           pgcLocationINOUT.ActivePage:=tbsSKU;
         self.ActiveControl:=grdLocationINItem;
      end else
      begin
         //data.qryLocationin
         data.qryLocationin.Edit;
         data.qryLocationin.fieldbyname('loadtype').asstring         :=_ACC_loadtype;
         data.qryLocationin.fieldbyname('contwithloca').asstring     :=_ACC_contwithloca;
         data.qryLocationin.fieldbyname('lottracked').asstring       :=_ACC_lottracked;
         data.qryLocationin.fieldbyname('isbond').asstring           :=_ACC_isbond;
         data.qryLocationin.fieldbyname('countrent').asstring        :=_ACC_countrent;
         data.qryLocationin.fieldbyname('countcontcost').asstring    :=_ACC_countcontcost;
         data.qryLocationin.fieldbyname('tageach').asstring          :=_ACC_tageach;
         data.qryLocationin.fieldbyname('skucostclasscd').asstring   :=_ACC_skucostclasscd;
         data.qryLocationin.fieldbyname('warerentcounttype').asstring:=_ACC_warerentcounttype;
         data.qryLocationin.fieldbyname('warerentcounttypeout').asstring:=_ACC_warerentcounttypeout;
         data.qryLocationin.fieldbyname('iuserid').asstring          :=_ACC_iuserid;
         data.qryLocationin.fieldbyname('iusername').asstring        :=_ACC_iusername;
         data.qryLocationin.fieldbyname('loadtype').asstring         :=_ACC_loadtype;
         strCostCountUOMType   :=_ACC_CostCountUOMType;
         strRentCountUOMType   :=_ACC_RentCountUOMType;
         strRentCountUOMTypeOut:=_ACC_RentCountUOMTypeOut;
         data.qryLocationin.FieldByName('TASKDATE').AsDateTime       :=present;
         if strSysCus='WYFQ' then
         data.qryLocationin.FieldByName('conloaddate').AsDateTime       :=present;

         data.qryLocationin.FieldByName('UserID').Asstring:=_UserID;
         data.qryLocationin.FieldByName('Username').Asstring:=_Username;
         data.qryLocationin.FieldByName('iUserID').Asstring:=_UserID;
         data.qryLocationin.FieldByName('iUsername').Asstring:=_Username;
      end;
      data.qryLocationin.FieldByName('Jobno').Asstring:=strCreateID;
      //从指令下达任务时 组织延续指令的组织
      if _wareuserid<>'T' then
      begin
         data.qryLocationin.FieldByName('UserID').Asstring:=_UserID;
         data.qryLocationin.FieldByName('Username').Asstring:=_Username;
         data.qryLocationin.FieldByName('iUserID').Asstring:=_UserID;
         data.qryLocationin.FieldByName('iUsername').Asstring:=_Username;
      end;
      data.qryLocationin.FieldByName('CountWith1').Asstring:='F';
      if strSysCus='WYFQ' then
      begin
         edtCostCus.SetFocus;
         data.qryLocationin.FieldByName('costcusid').Asstring:='00000000000000000001';
         data.qryLocationin.FieldByName('costcusname').Asstring:='冠捷';
         blnSelect:=True;
      end;
   end;
end;

function TfrmLocationIN.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmLocationIN.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
//   if blnOpen then
//   begin
   if blnPage then
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         if (data.qryLocationin.DataSource=nil) and (data.qryLocationin.Active) then
            data.qryLocationin.Close;
         data.qryLocationin.DataSource:=data.dtsIN;
         data.qryLocationin.Active:=true;
         if pgcLocationINOUT.ActivePage=tbsSKU then
         begin
            if (data.qryLocationinItem.DataSource=nil) and (data.qryLocationinItem.Active) then
               data.qryLocationinItem.Close;
            data.qryLocationinItem.DataSource:=data.dtsIN;
            data.qryLocationinItem.Active:=true;
            if (data.qryLocationinDetail.DataSource=nil) and (data.qryLocationinDetail.Active) then
               data.qryLocationinDetail.Close;
            data.qryLocationinDetail.DataSource:=data.dtsIN;
            data.qryLocationinDetail.Active:=true;
            //skudetail
{            if (data.qryLocInSkuDetail.DataSource=nil) and (data.qryLocInSkuDetail.Active) then
               data.qryLocInSkuDetail.Close;
            data.qryLocInSkuDetail.DataSource:=data.dtsIN;
//            data.qryLocInSkuDetail.Active:=true;     //右键点开时再打开}
         end;
         if pgcLocationINOUT.ActivePage=tbsCasing then
         begin
            if _iscasing='T' then //打包业务是否存在
            begin
               if (data.qryLocInItemCasing.DataSource=nil) and (data.qryLocInItemCasing.Active) then
                  data.qryLocInItemCasing.Close;
               data.qryLocInItemCasing.DataSource:=data.dtsIN;
               data.qryLocInItemCasing.Active:=true;
            end;
         end;
         if pgcLocationINOUT.ActivePage=tbsAutoCost then
         begin
            if (data.qryautocountcostin.DataSource=nil) and (data.qryautocountcostin.Active) then
               data.qryautocountcostin.Close;
            data.qryautocountcostin.DataSource:=data.dtsIN;
            data.qryautocountcostin.Active:=true;
         end;
      end;
   end else
   begin
      if (data.qryLocationin.DataSource=nil) and (data.qryLocationin.Active) then
         data.qryLocationin.Close;
      data.qryLocationin.DataSource:=data.dtsIN;
      data.qryLocationin.Active:=true;
      if (data.qryLocationinItem.DataSource=nil) and (data.qryLocationinItem.Active) then
         data.qryLocationinItem.Close;
      data.qryLocationinItem.DataSource:=data.dtsIN;
      data.qryLocationinItem.Active:=true;
      if (data.qryLocationinDetail.DataSource=nil) and (data.qryLocationinDetail.Active) then
         data.qryLocationinDetail.Close;
      data.qryLocationinDetail.DataSource:=data.dtsIN;
      data.qryLocationinDetail.Active:=true;
      //skudetail
{      if (data.qryLocInSkuDetail.DataSource=nil) and (data.qryLocInSkuDetail.Active) then
         data.qryLocInSkuDetail.Close;
      data.qryLocInSkuDetail.DataSource:=data.dtsIN;}
//      data.qryLocInSkuDetail.Active:=true;

      if tbsCasing.TabVisible then
      begin
         if (data.qryLocInItemCasing.DataSource=nil) and (data.qryLocInItemCasing.Active) then
            data.qryLocInItemCasing.Close;
         data.qryLocInItemCasing.DataSource:=data.dtsIN;
         data.qryLocInItemCasing.Active:=true;
      end;
      if (data.qryautocountcostin.DataSource=nil) and (data.qryautocountcostin.Active) then
         data.qryautocountcostin.Close;
      data.qryautocountcostin.DataSource:=data.dtsIN;
      data.qryautocountcostin.Active:=true;

   end;
{   end else
   begin
      data.qryLocationin.DataSource       :=nil;
      data.qryLocationinItem.DataSource   :=nil;
      data.qryLocationinDetail.DataSource :=nil;
      data.qryLocInItemCasing.DataSource :=nil;
   end;}
end;

procedure TfrmLocationIN.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
   btnOper.Visible:=ItemDetailEdit.Enabled;
   mitEdit.Visible:=btnOper.Visible;
   dtdOperationDate.Enabled:=false;
   timOperationDate.Enabled:=false;
   if DataState=stInsert then btnTotal.Visible:=False else btnTotal.Visible:=True;
   if _isCasing<>'T' then
   begin
      tbsCasing.TabVisible:=False;
      mitcasing.Visible:=False;
   end;   
   if strSysCus<>'WYFQ' then
   tbsautoCost.TabVisible:=blnCostRate;
   if strFlow='ITEM' then
   begin
      grdLocationOutDetailReadOnly  :=true;
      btnAddLocationINOUTDetail.Enabled:=False;
      mitAddLocationINOUTDetail.Enabled:=False;
      mitDelLocationINOUTDetail.enabled:=False;
      btnDelLocationINOUTDetail.Enabled:=false;
      mitRelocation.Visible:=false;
   end else
   if strFlow='DETAIL' then
   begin
      dtdTaskDate.ReadOnly:=True;
      timTaskDate.ReadOnly:=True;
      edtIUser.ReadOnly   :=True;
      btnAdd.Visible      :=false;
      grdLocationOutDetailReadOnly  :=False;  //lqs 09.27    //实际直接控制detail
      grdLocationINOUTItemReadOnly:=true;
      mitAddLocItem.Visible:=False;
      mitdelLocINItem.Visible:=false;
      btnAddLocItem.Enabled:=false;
      mitTotalDetail.Visible:=false;
      btndelLocINItem.Enabled:=false;
      mitItemClear.Enabled:=False;
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
         if (data.qrylocationIn.FieldByName('operationname').AsString<>'') then
         begin  //已拣货的任务数据不能修改
            edtIUser.ReadOnly:=True;
         end else
            edtIUser.ReadOnly:=False;
         dtdTaskDate.setfocus;
      end;
   end;
end;

procedure TfrmLocationIN.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmLocationIN.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmLocationIN.btnRefreshClick(Sender: TObject);
var
  strJobno:string;
  qryTmp:TKADOQuery;
  arrData:Variant;
begin
   strJobno     :=data.qryIN.FieldByName('Jobno').AsString;
   if Sender = btnRefresh then
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetMasterDetailState(false);
         blnqryInChange:=False;
      end;
      data.qryIn.Close;

      data.qryIn.Open;
      data.qryIn.DisableControls;
      if not data.qryIn.Locate('Jobno',
                          VarArrayOf([strJobno]),
                          [loCaseInsensitive, loPartialKey]) then
      begin
         data.qryIn.Last;
         grdLocationINChangeNodeEx(nil);
      end;
      data.qryIn.EnableControls;
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetDetailActive(False,True);
         blnqryInChange:=True;
      end;
      WorkCall(stBrowse);
   end else
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetMasterDetailState(false);
 //        SetDetailActive(False,false);
         blnqryInChange:=False;
      end;
      qryTmp:=TKADOQuery.Create(Application);
      qryTmp.Connection :=_ADOConnection;
      qryTmp.Sql.Text:=data.qryIn.Sql.Text;
      qryTmp.SQL.Text:='ksp_GetLocationinMasterbyjobno @jobno="'+strjobno+'",'
                      +'                         @userid="'+_userid+'",'
                      +'                         @useridcan='''+_Useridcan+''','
                      +'                         @strfilter="1=1"';
      qryTmp.Open;
      arrData:=ScatterToArray(qryTmp,True,0);
      GatherFromArray(data.qryIn,arrData,false);
      data.qryIn.ApplyUpdates;
      qryTmp.Free;
      if pgcMain.ActivePage=tbsEdit then
      begin
         SetDetailActive(False,True);
         blnqryInChange:=True;
      end;
      WorkCall(stBrowse);
   end;
end;

procedure TfrmLocationIN.btnEditClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsBrowse then pgcMain.ActivePage:=tbsBrowse;
   btnRefreshClick(btnEdit);

   if not CheckModifyMode('E',True) then Exit;

   blnMainPage:=False;
   blnqryInChange:=False;
   blnItemPage:=False;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);

// Added by cyh 2009.03.04 16:24:00
   if (strSysCus='SWZ') and (data.qryLocationInDetail.RecordCount=0) then
   begin
      OpenSql(datatmp.qryTmp,'select 1 from contract (nolock)    '+chr(13)+chr(10)
                            +' where signcusid="'+data.qryLocationin.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
//                            +'   and isnull(Signed,"F")="T" '
                            +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
      if datatmp.qryTmp.RecordCount=0 then
      begin
         kMessageDlg('该客户合同还未签订,不能执行上架操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   
   if (ItemDetailEdit.Enabled) and (data.qryin.FieldByName('createname').AsString='')
     and (data.qryLocationinItem.FieldByName('Jobno').AsString='') then
   begin
     { if _Language='CAPTIONC' then _strmessage:='任务商品资料不完整,不能执行该操作!'
      else _strmessage:='任务商品资料不完整,不能执行该操作!'; }
      kMessageDlg(GetMessage('frmLocationIN','011'), mtWarning, [mbOK], 0);
      exit;
   end;

   if (strFlow='DETAIL')and (Sender=btnEdit) then
   begin
      data.qryLocationin.Edit;
      data.qryLocationin.FieldByName('OperationName').AsString:=_LoginName;
// Modified by cyh 2008.06.18 15:33:53      data.qryLocationin.FieldByName('OperationDate').AsDateTime  :=GetServerDate;
   end;

   SetMasterDetailState(false);
   WorkCall(stEdit);
    if (Sender=mitEdit) and (ItemDetailEdit.Enabled) then btnOperClick(mitOper);
    if _isoriinfo='T' then
    begin
       ExecSql(datatmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                             +'     where id=object_id("tempdb..#lskorderItemin") and sysstat & 0xf=3) '+chr(13)+chr(10)
                             +'   drop table #lskorderItemin '+chr(13)+chr(10)
                             +'   CREATE TABLE #lskorderItemin '+chr(13)+chr(10)
                             +'     ('+chr(13)+chr(10)
                             +'           jobnoop        varchar(20)  not null ,'+chr(13)+chr(10)
                             +'           snoop          smallint     not null , '+chr(13)+chr(10)
                             +'           jobnoori        varchar(20) null ,'+chr(13)+chr(10)
                             +'     )');
        ExecSql(datatmp.qryTmp,'  ksp_OriInfoLocationin '+data.qryin.fieldbyname('jobno').AsString+',"P"');
    end;
end;

procedure TfrmLocationIN.btnAddClick(Sender: TObject);
begin
   ScrollAfterEdit:=True;
   blnqryInChange:=False;
   blnItemPage:=False;
   blnMainPage:=False;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if _paper='T' then
   begin
      with WorkLocationbillno('1') do
      if OkFlag then
      begin
         strcusid:=strcostcusid;
         strcusname:=strcostcusname;
         strlocno:=strlocationbillno;
      end else
      begin
         blnqryInChange:=true;
         blnItemPage:=true;
         blnMainPage:=true;
         Exit;
      end;
   end;
   WorkCall(stInsert);
   if _paper='T' then
   begin
      GetCusCnfg;
      if data.qrylocationin.FieldByName('iuserid').AsString='' then
      begin
         data.qrylocationin.FieldByName('iuserid').AsString:=_Userid;
         data.qrylocationin.FieldByName('iusername').AsString:=_Username;
      end;
   end;
   SetMasterDetailState(false);
end;

procedure TfrmLocationIN.btnDeleteClick(Sender: TObject);
var
   strojobno:string;
begin
   if pgcMain.ActivePage<>tbsBrowse then pgcMain.ActivePage:=tbsBrowse;
   btnRefreshClick(btnEdit);

   if not CheckModifyMode('D',IIF(Sender=btnDelete,True,False)) then exit;//判断是否能修改删除

   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   if Sender=btnDelete then
      _strmessage:=_strdel
   else
      _strmessage:=GetMessage('frmLocationIN','012');//         _strmessage:='该操作将取消该笔实际上架，您确定吗?';
   if KmessageDlg(_strmessage,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
//为了控制库存 ,创建临时表，用于保存原始状态的工作号
      strojobno:=data.qryIn.fieldbyname('jobno').AsString;
      SetMasterDetailState(false);
      droplsk('#lskOldItemIn');
      ExecSql(dataTmp.qryTmp,'  select jobnoorder,snoorder into #lskOldItemIn from locationInItem(nolock)  '+chr(13)+chr(10)
                            +'   where jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                             );
      if _isoriinfo='T' then
      begin
         ExecSql(datatmp.qryTmp,'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                               +'     where id=object_id("tempdb..#lskorderItemin") and sysstat & 0xf=3) '+chr(13)+chr(10)
                               +'   drop table #lskorderItemin '+chr(13)+chr(10)
                               +'   CREATE TABLE #lskorderItemin '+chr(13)+chr(10)
                               +'     ('+chr(13)+chr(10)
                               +'           jobnoop        varchar(20)  not null ,'+chr(13)+chr(10)
                               +'           snoop          smallint     not null , '+chr(13)+chr(10)
                               +'           jobnoori        varchar(20) null ,'+chr(13)+chr(10)
                               +'     )');
          ExecSql(datatmp.qryTmp,'  ksp_OriInfoLocationin '+strojobno+',"P"');
      end;
      _ADOConnection.startTransaction;
      try
         if Sender=btnDelete then
         begin
            //处理日志
            if _isuserhist='T' then
            begin
               strHistMessage:='  仓单号-'+data.qryLocationIn.FieldByName('locationbillno').Asstring
                              +'  客户单号-'+data.qryLocationIn.FieldByName('cusbillno').Asstring
                              +'  费用关系人-'+data.qryLocationIn.FieldByName('costcusname').Asstring;
               if strHistMessage<>'' then
                 execsql(dataTmp.qryTmp,'insert into UserHist '
                               +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                               +' values ("'+_LoginName+'",getdate(),"'
                               +data.qryLocationIn.FieldByName('jobno').Asstring+'","'
                               +strHistMessage+'","进仓任务","删除")');
            end;
            ExecSql(dataTmp.qryTmp,' delete from locationinitem '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationin '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationinoutcon '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationinoutconsku '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from lioskudetail '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +'    and operationtype=1 '
                                  +' delete from locinskudetail '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from locationinitemcasing '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from autocountcost '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from genjobno '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from costitem '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                                  +' delete from warecostrate '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                    );
            //lzw20090630
            if (_strSysCus='SWZ') or (_strSysCus='JJHY')  then
            ExecSql(dataTmp.qryTmp,' delete from forkworkload '
                                  +'  where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                    );
            data.qryIn.Delete;
            data.qryIn.ApplyUpdates;
         end else
         begin
            //处理日志
            if _isuserhist='T' then
            begin
               strHistMessage:='  仓单号-'+data.qryLocationIn.FieldByName('locationbillno').Asstring
                              +'  客户单号-'+data.qryLocationIn.FieldByName('cusbillno').Asstring
                              +'  费用关系人-'+data.qryLocationIn.FieldByName('costcusname').Asstring;
               if strHistMessage<>'' then
                 execsql(dataTmp.qryTmp,'insert into UserHist '
                               +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                               +' values ("'+_LoginName+'",getdate(),"'
                               +data.qryLocationIn.FieldByName('jobno').Asstring+'","'
                               +strHistMessage+'","进仓任务","取消上架")');
            end;
            ExecSql(datatmp.qryTmp,'delete from  LocationinDetail'
                          +'         where Jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                          +'        delete from  LocinskuDetail'
                          +'         where Jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
                          +'           and isnull(tracktype,"TO")="TO" '
                          +'        update locinskudetail set ldsno=-1'
                          +' where Jobno="'+data.qryIn.FieldByName('Jobno').AsString+'" ');
            ExecSql(datatmp.qryTmp,'update LocationinItem '
                           +'       set quantity=0,piece=0,volume=0,netweight=0,grossweight=0,area=0,'
                           +'           casing1=0,casing2=0,casing3=0,casing4=0,casing5=0,costquantity=0,'
//cyh0317RL                           +'           locid=null,locname=null, '
                           +'           OperationDate=null,operationname="" '
                           +' where Jobno="'+data.qryin.FieldByName('Jobno').AsString+'" ');
//            ExecSql(datatmp.qryTmp,'update  locinskudetail set ldsno=-1'
//                          +' where Jobno="'+data.qryIn.FieldByName('Jobno').AsString+'" ');
            data.qrylocationin.Edit;
            data.qrylocationin.FieldByName('operationname').AsString:='';
            data.qrylocationin.FieldByName('OperationDate').Clear;
            data.qryin.Edit;
            data.qryin.FieldByName('operationname').AsString:='';
            data.qryin.FieldByName('OperationDate').Clear;
            data.qrylocationin.Applyupdates;
            data.qryin.Applyupdates;
         end;
//更新仓储指令中的Wareordersku
         Execsql(dataTmp.qryTmp,'exec ksp_LocationInItem "'+data.qryin.FieldByName('Jobno').AsString+'"');
         droplsk('#lskOldItemIn');
//是否返回指令执行信息
         if _isoriinfo='T' then
         ExecSql(datatmp.qryTmp,'  ksp_OriInfoLocationin '+strojobno+',"E"');
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
      data.qryin.CommitUpdates;
      SetDetailActive(False,True);
      WorkCall(stBrowse);
   end;
end;

procedure TfrmLocationIN.btncopyClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;
   arrLocationINOUT:=ScatterToArray(data.qryLocationin,True,0);
   arrLocationINItem:=ScatterToArray(data.qryLocationinItem,False,0);
   blnCopy:=True;
   WorkCall(stInsert);
end;

procedure TfrmLocationIN.btnFindClick(Sender: TObject);
var
   Para:TFindPara;
begin
   if pgcMain.ActivePage<>tbsBrowse then  pgcMain.ActivePage:=tbsBrowse;
   Para:=TFindPara.Create;

   Para.Tables.Add('locationin inout');

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
{16}  Para.Toptic.Add('上架日期');
{16}  Para.Ftype.Add('D');

{17}  Para.Field.Add('inout.createname');
{17}  Para.Toptic.Add('创 建 人');
{17}  Para.Ftype.Add('C');

{18}  Para.Field.Add('inout.operationname');
{18}  Para.Toptic.Add('上 架 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.checkname');
{19}  Para.Toptic.Add('审 核 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.jobno');
{20}  Para.Toptic.Add('工作单号');
{20}  Para.Ftype.Add('C');

   Para.RField.Add('INOUT.jobno');
   _qrymacroin:=_qrymacroin+strisyearctrl;
   Para.Filter:=' '
               +' and '+_qrymacroin
               +IIF(_Useridcan<>'',
               'and (userid in '+_Useridcan+'or iuserid in'+_Useridcan+' )',
               'and (userid like "'+_Userid+'%" or iuserid like "'+_Userid+'%")')
               +iif(trim(strJobno)='','',' and inout.jobno="'+strJobno+'" ');

   Para.OnGetValue:=FindGetValue;
   Dofind(data.qryIn,dataTmp.qryFind,Para,FindItem);
end;

procedure TfrmLocationIN.btnRefindClick(Sender: TObject);
begin
  DoRefind(data.qryIn,datatmp.qryfind);
end;

procedure TfrmLocationIN.btnFilterClick(Sender: TObject);
var
  Para:TFindPara;
  StrTmp:String;
begin
   if pgcMain.ActivePage<>tbsBrowse then  pgcMain.ActivePage:=tbsBrowse;
   pgcMainChange(self);
   Para:=TFindPara.Create;

   Para.Tables.Add('locationin inout');

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
      if strSysCus<>'WYFQ' then
{3}   Para.Toptic.Add('客户单号')
      else
{3}   Para.Toptic.Add('调拨单号');
{3}   Para.Ftype.Add('C');

{4}   Para.Field.Add('inout.customsno');
{4}   Para.Toptic.Add('报关单号');
{4}   Para.Ftype.Add('C');

{5}  Para.Field.Add('inout.blno');
      if strSysCus<>'WYFQ' then
{5}  Para.Toptic.Add('提 单 号')
     else
{5}  Para.Toptic.Add('封 签 号');
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
{16}  Para.Toptic.Add('上架日期');
{16}  Para.Ftype.Add('D');

{17}  Para.Field.Add('inout.createname');
{17}  Para.Toptic.Add('创 建 人');
{17}  Para.Ftype.Add('C');

{18}  Para.Field.Add('inout.operationname');
{18}  Para.Toptic.Add('上 架 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.checkname');
{19}  Para.Toptic.Add('审 核 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.jobno');
{20}  Para.Toptic.Add('工作单号');
{20}  Para.Ftype.Add('C');

{21}  Para.Field.Add('inout.conno');
{21}  Para.Toptic.Add('柜    号');
{21}  Para.Ftype.Add('C');

{22}  Para.Field.Add('inout.Routing');
{22}  Para.Toptic.Add('路线描述');
{22}  Para.Ftype.Add('C');

{23}  Para.Field.Add('inout.carbrand');
{23}  Para.Toptic.Add('车 牌 号');
{23}  Para.Ftype.Add('C');

   Para.Exp.Add('');

   Para.OnGetValue:=FindGetValue;
   Para.OnGetSql := FindGetSql;

   StrTmp:=DoFilter(Para, FindItem);

   if strTmp<>'null' then
   begin
      data.qryIn.Close;
      data.qryIn.DisableControls;
      if (_Loginid<>'SYSTEM') and (not blnop) then
      begin
          _qrymacroin:=IIF(strTmp<>'',StrTmp,'1=1')+'and inout.opname="'+_loginname+'" or inout.createname="'+_loginname+'"'
      end else
      _qrymacroin:=IIF(strTmp<>'',StrTmp,'1=1');
      _qrymacroin:=_qrymacroin+strisyearctrl;

{      data.qryIn.sql.Text:='ksp_GetLocationinMasterbyjobno @jobno="",'
                          +'                         @userid="'+_userid+'",'
                          +'                         @useridcan="'+_Useridcan+'",'
                          +'                         @strfilter='''+_qrymacroin+'''';}
      data.qryin.MacroByName('where').AsString:=''''+_qrymacroin+'''';          //by whl

      data.qryIn.Open;
      data.qryIn.EnableControls;
   end;
   WorkCall(stBrowse);
end;

procedure TfrmLocationIN.btnSaveClick(Sender: TObject);
var
  strCreateID,strJobno:string;
  blnSuc:Boolean;
begin
   blnSuc:=true;
   if blncasing then
   mitcasingClick(self);
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         while True do
         begin
           try
             //处理日志
             if _isuserhist='T' then
             begin
                if DataState=stInsert then
                begin
                  strHistMessage:='  费用关系人-'+data.qryLocationIn.FieldByName('CostCusName').AsString
                                 +'  仓单号-'+data.qryLocationIn.FieldByName('LocationBillNO').AsString
                                 +'  执行组织-'+data.qryLocationIn.FieldByName('IuserName').AsString
                                 +'  商品类-'+data.qryLocationIn.FieldByName('skucostclasscd').AsString
                                 +'  客户单号-'+data.qryLocationIn.FieldByName('cusbillno').AsString
                                 +'  报关单号-'+data.qryLocationIn.FieldByName('customsno').AsString
                                 +'  仓租方式-'+data.qryLocationIn.FieldByName('warerentcounttype').AsString
                                 +'  计算仓租-'+data.qryLocationIn.FieldByName('countrent').AsString;
                end else
                begin
                   if VarToStr(data.qryLocationIn.FieldByName('LocationBillNO').OldValue)<>data.qryLocationIn.FieldByName('LocationBillNO').AsString then
                      strHistMessage:='  仓单号-'+VarToStr(data.qryLocationIn.FieldByName('LocationBillNO').OldValue)+' →'+data.qryLocationIn.FieldByName('LocationBillNO').AsString
                   else
                      strHistMessage:=strHistMessage
                                  +'  仓单号-'+data.qryLocationIn.FieldByName('LocationBillNO').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('CostCusName').OldValue)<>data.qryLocationIn.FieldByName('CostCusName').AsString then
                      strHistMessage:=strHistMessage
                                  +'  费用关系人-'+VarToStr(data.qryLocationIn.FieldByName('CostCusName').OldValue)+' →'+data.qryLocationIn.FieldByName('CostCusName').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('IuserName').OldValue)<>data.qryLocationIn.FieldByName('IuserName').AsString then
                      strHistMessage:=strHistMessage
                                  +'  执行组织-'+VarToStr(data.qryLocationIn.FieldByName('IuserName').OldValue)+' →'+data.qryLocationIn.FieldByName('IuserName').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('skucostclasscd').OldValue)<>data.qryLocationIn.FieldByName('skucostclasscd').AsString then
                      strHistMessage:=strHistMessage
                                  +'  商品类-'+VarToStr(data.qryLocationIn.FieldByName('skucostclasscd').OldValue)+' →'+data.qryLocationIn.FieldByName('skucostclasscd').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('cusbillno').OldValue)<>data.qryLocationIn.FieldByName('cusbillno').AsString then
                      strHistMessage:=strHistMessage
                                  +'  客户单号-'+VarToStr(data.qryLocationIn.FieldByName('cusbillno').OldValue)+' →'+data.qryLocationIn.FieldByName('cusbillno').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('customsno').OldValue)<>data.qryLocationIn.FieldByName('customsno').AsString then
                      strHistMessage:=strHistMessage
                                  +'  报关单号-'+VarToStr(data.qryLocationIn.FieldByName('customsno').OldValue)+' →'+data.qryLocationIn.FieldByName('customsno').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('warerentcounttype').OldValue)<>data.qryLocationIn.FieldByName('warerentcounttype').AsString then
                      strHistMessage:=strHistMessage
                                  +'  仓租方式-'+VarToStr(data.qryLocationIn.FieldByName('warerentcounttype').OldValue)+' →'+data.qryLocationIn.FieldByName('warerentcounttype').AsString;
                   if VarToStr(data.qryLocationIn.FieldByName('countrent').OldValue)<>data.qryLocationIn.FieldByName('countrent').AsString then
                      strHistMessage:=strHistMessage
                                  +'  计算仓租-'+VarToStr(data.qryLocationIn.FieldByName('countrent').OldValue)+' →'+data.qryLocationIn.FieldByName('countrent').AsString;
                end;
             end;
             _ADOConnection.Starttransaction;
             arrLocationINOUT:=ScatterToArray(data.qryLocationin,true,0);
             data.qryLocationin.ApplyUpdates;
             Break;
           except
             _ADOConnection.Rollback; //先结束事务
             if Error.HandleException(Exception(ExceptObject),data.udsLocationin.InsertSql.text)=Re_KeyRepeat then
             begin
               blnSuc:=False;
               WorkSaveGet(data.qryLocationin.FieldByName('Jobno').AsString + GetMessage('frmLocationIN','013'));//'工作号''已经被使用。程序正在查找其他可用代码...'
               Application.processmessages;
               if not frmSave.stopflag then
               begin
                 strCreateID := genJobno('LI');
                 if strCreateID = '' then
                 begin
                   KmessageDlg(GetMessage('frmLocationIN','014'), mtInformation, [mbOk], 0);//'没有可用的代码或网络忙，请稍侯重试或联系系统管理员.'
                   frmSave.stopflag := True;
                   Break;
                 end else
                 begin
                   data.qryLocationin.Edit;
                   data.qryLocationin.FieldByName('Jobno').AsString := strCreateID;
                   //赋业务联系单号
                   opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(LocationBillNO,7,8))) '
                                 +'  from LocationIn where substring(LocationBillNO,1,2)="JC" '
                                 +'  and substring(LocationBillNO,3,4)="'+copy(datetostr(date),1,4)+'"' );
                   data.qryLocationin.FieldByName('LocationBillNO').Asstring:='JC'+copy(datetostr(date),1,4)
                                                                           +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
                   data.qryin.Edit;
                   data.qryin.FieldByName('Jobno').AsString := strCreateID;
                   data.qryin.FieldByName('LocationBillNO').AsString := data.qryLocationin.FieldByName('LocationBillNO').Asstring;
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
           data.qryin.edit;
           data.qryin.fieldbyname('Jobno').asstring:=strCreateID;
           //data.qryLocationinDetail复制
           data.qryLocationinDetail.DisableControls;
           data.qryLocationinDetail.Filtered:=False;
           with data.qryLocationinDetail do
           begin
              First;
              while not Eof do
              begin
                 Edit;
                 FieldByName('Jobno').AsString:=strCreateID;
                 //in
                 FieldByName('JobnoINF').AsString:=strCreateID;
                 FieldByName('LocationBillNO').AsString := data.qryLocationin.FieldByName('LocationBillNO').Asstring;
                 //ine
                 next;
              end;
              First;
           end;
           data.qryLocationinDetail.Filtered:=True;
           data.qryLocationinDetail.EnableControls;
           //data.qryLocationinItem复制
           data.qryLocationinItem.DisableControls;
           with data.qryLocationinItem do
           begin
              First;
              while not Eof do
              begin
                 Edit;
                 FieldByName('Jobno').AsString:=strCreateID;
                 //in
                 FieldByName('JobnoINF').AsString:=strCreateID;
                 FieldByName('LocationBillNO').AsString := data.qryLocationin.FieldByName('LocationBillNO').Asstring;
                  //ine
                 next;
              end;
              First;
           end;
           data.qryLocationinItem.EnableControls;

           if _isCasing='T' then
           begin
              data.qryLocInItemCasing.DisableControls;
              with data.qryLocInItemCasing do
              begin
                 First;
                 while not Eof do
                 begin
                    Edit;
                    FieldByName('Jobno').AsString:=strCreateID;
                    FieldByName('JobnoINF').AsString:=strCreateID;
                    next;
                 end;
                 First;
              end;
              data.qryLocInItemCasing.EnableControls;
           end;
           data.qryautocountcostin.DisableControls;
           with data.qryautocountcostin do
           begin
              First;
              while not Eof do
              begin
                Edit;
                FieldByName('Jobno').AsString:=strCreateID;
                next;
              end;
              First;
           end;
           data.qryautocountcostin.EnableControls;

         end;
         m_blnPost := True;
   //      m_blnPost := False;
         data.qryLocInItemCasing.DisableControls;
         data.qryLocationinItem.DisableControls;
         data.qryLocationinDetail.DisableControls;
         arrInOut:=ScatterToArray(data.qryin,true,0);
         arrLocationINOUT:=ScatterToArray(data.qryLocationin,true,0);
         arrLocationinItem:=ScatterToArray(data.qrylocationinItem,False,0);
         arrlocinItemCasing:=ScatterToArray(data.qryLocinItemCasing,False,0);
//         data.qryin.ApplyUpdates;
         if _isCasing='T' then
         data.qryLocInItemCasing.ApplyUpdates;
         data.qryLocationinItem.applyupdates;
         data.qryLocationinDetail.Filtered:=False;
         arrlocationinDetail:=ScatterToArray(data.qrylocationindetail,False,0);
         data.qryLocationinDetail.applyupdates;
         data.qryautocountcostin.applyupdates;
         if data.qryLocInSkuDetail.active then
            data.qryLocInSkuDetail.ApplyUpdates;
         //删除商品明细
         if strDel_Task<>'' then
         begin
            strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
            strsql:={' delete from LIOSKUDetail '
                   +'  where jobno="'+data.qryin.fieldbyname('Jobno').asstring+'"'
                   +'    and OperationType=1 '
                   +'    and '+'('+strDel_Task+') '
                   +}' delete from LocInSKUDetail '
                   +'  where jobno="'+data.qryin.fieldbyname('Jobno').asstring+'"'
                   +'    and '+'('+strDel_Task+') ';
            if copy(strDel_Task,length(strDel_Task),1)<>'=' then
               execsql(datatmp.qryTmp,strsql);
            strDel_Task:='';
         end;
         if strDel_Detail<>'' then
         begin
            strDel_Detail:=copy(strDel_Detail,4,length(strDel_Detail)- 3);
            strsql:=' delete from LocInSKUDetail '
                   +'  where jobno="'+data.qryin.fieldbyname('Jobno').asstring+'"'
                   +'    and '+'('+strDel_Detail+') ';
            if copy(strDel_Detail,length(strDel_Detail),1)<>'=' then
               execsql(datatmp.qryTmp,strsql);
            strDel_Detail:='';
         end;
   //更新仓储指令中的Wareordersku
         Execsql(dataTmp.qryTmp,'exec ksp_LocationInItem "'+data.qryin.FieldByName('Jobno').AsString+'"');

// Added by wql 2005-12-1 9:53:33  仓储指令中的箱子信息直接保存到进仓信息中Begin
         if (_conwaretoitem='T') and (strJobnoOrder<>'')and (getSysdata('qdtext')<>'T')  then
         begin
            ExecSql(dataTmp.qryTmp,'insert into locationinoutcon '
                                  +'        (jobno,userid,username,conno,sealno,contype,consptype,conquantity,'+chr(13)+chr(10)
                                  +'        remark,sno,liftconcusid,liftconcusname,loadgroupcusid,loadgroupcusname,'+chr(13)+chr(10)
                                  +'        forkgroupcusid,forkgroupcusname,liftmachinecusid,liftmachinecusname,conveno,'+chr(13)+chr(10)
                                  +'        convetype,xszh,drivername,driveridcar,iscon,blno,operationtype,drivecardno,'+chr(13)+chr(10)
                                  +'        tallycusid,tallycusname,drivertel)'+chr(13)+chr(10)
                                  +' select jobno="'+data.qryIn.fieldbyname('jobno').AsString+'",'+chr(13)+chr(10)
                                  +'        userid="'+_userid+'",'
                                  +'        username="'+_username+'",'
                                  +'        conno,sealno,contype,consptype,conquantity,'+chr(13)+chr(10)
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
                                  +' select jobno="'+data.qryIn.fieldbyname('jobno').AsString+'",'+chr(13)+chr(10)
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

         if strSysCus<>'WYFQ' then
         ExecSql(dataTmp.qryTmp,'update locationinitem '
                        +'          set locationinitem.locname="'+data.qryLocationInDetail.fieldbyname('locname').AsString+'",'
                        +'              locationinitem.locid="'+data.qryLocationInDetail.fieldbyname('locid').AsString+'"'
                        +'         from locationindetail,locationinitem (nolock)'
                        +'        where locationinitem.jobno="'+data.qryLocationIn.fieldbyname('jobno').asstring+'" '
                        +'          and locationinitem.jobno=locationindetail.jobno'
                        +'          and locationinitem.sno=locationindetail.sno  '
                        +'          and locationinitem.locid<>locationindetail.locid '
                        );

// Added by wql 2005-12-1 9:53:33  仓储指令中的箱子信息直接保存到进仓信息中End
         data.qryLocationinItem.First;
         while not data.qryLocationinItem.eof do
         begin
            if (_isindate='T') then
            begin
               ExecSql(dataTmp.qryTmp,'update lorder '
                              +'   set indate="'+data.qryLocationinItem.fieldbyname('operationdate').AsString+'"'
                              +' where mainorder="'+data.qryLocationinItem.fieldbyname('mainorder').AsString+'"'
                              +'   and isnull(mainorder,"")<>""');
            end;
            data.qryLocationinItem.Next;
         end;

         if _isskudetail='T' then      //默认从对应进仓生成出仓商品明细
            ExecSql(dataTmp.qryTmp,'exec ksp_inskudetail @jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '+chr(13)+chr(10));

         if _isoriinfo='T' then
         ExecSql(dataTmp.qryTmp,'ksp_OriInfoLocationin '
                               +data.qryin.FieldByName('Jobno').AsString
                               +','+IIF(DataState=stInsert,'"I"','"E"')
                );
   //处理日志
         if _isuserhist='T' then
         begin
            strHistMessage:=strHistMessage+strHistDetailMessage;
            if strHistMessage<>'' then
              execsql(dataTmp.qryTmp,'insert into UserHist '
                            +' (UserName,UserDATE,JOBNO, Remark,TypeName,modifytype)'
                            +' values ("'+_LoginName+'",getdate(),"'
                            +data.qryLocationIn.FieldByName('jobno').AsString+'","'
                            +strHistMessage+'","进仓任务","'+iif(DataState=stEdit,'修改','新增')+'")');
         end;

         if _paper='T' then
         ExecSql(dataTmp.qryTmp,' update genjobno set docno1="'+data.qryLocationIn.FieldByName('locationbillno').AsString+'" '
                               +'  where jobno="'+data.qryLocationIn.FieldByName('Jobno').AsString+'" '
                );
         //lzw20110419
         if _strsyscus='DHA' then
         ExecSql(dataTmp.qryTmp,' update locationinoutcon set            '
                               +'        locationbillno="'+data.qryLocationIn.FieldByName('locationbillno').AsString+'" '
                               +'  where conveno="'+data.qryLocationIn.FieldByName('carbrand').AsString+'" '
                               +'    and isnull(locationbillno,"")="" '
                );
   {      if frmLIOSKUDetail<>nil then
         begin
            frmLIOSKUDetail.isupdate:=True;
            frmLIOSKUDetail.Destroy;
         end;}
         data.qryin.ApplyUpdates;
         _ADOConnection.Commit;
      except
         if datastate=stInsert then
         begin
            data.qryLocationin.Edit;
            data.qryLocationin.FieldByName('operationname').AsString:='';
            data.qryLocationin.FieldByName('OperationDate').Clear;

            data.qryin.Edit;
            data.qryin.FieldByName('operationname').AsString:='';
    //        arrlocInItemCasing:=ScatterToArray(data.qryLocInItemCasing,False,0);
    //        arrLocationINItem:=ScatterToArray(data.qrylocationoutItem,False,0);
    //        data.qryLocInItemCasing.CancelUpdates;
    //        data.qryLocationinItem.CancelUpdates;
    //        data.qryLocationinDetail.CancelUpdates;
         end;
         data.qryLocationinDetail.Filtered:=True;
         data.qryLocInItemCasing.EnableControls;
         data.qryLocationinItem.EnableControls;
         data.qryLocationinDetail.EnableControls;

         blnSaveError:=true;
//         arrInOut:=ScatterToArray(data.qryin,true,0);

         strJobno     :=data.qryin.FieldByName('Jobno').AsString;
   //      data.qryin.CancelUpdates;
   //      data.qryLocationin.CancelUpdates;
   //      if datastate=stInsert then
   //      begin
//         data.qryIn.Delete;
         data.qryLocationIn.Delete;
//         data.qryin.Append;
//         data.qryLocationin.Append;
   //      end else
   //      begin
   //        data.qryin.Locate('Jobno',
   //                          VarArrayOf([strJobno]),
   //                          [loCaseInsensitive, loPartialKey]);
   //        data.qryin.Edit;
   //      end;
         data.qryin.DisableControls;
         m_blnPost := False;
//         GatherFromArray(data.qryin,arrInOut,false);
         GatherFromArray(data.qryLocationin,arrLocationINOUT,True);
         data.qryin.EnableControls;
   //data.qryLocInItemCasing复制
   //      if datastate=stInsert then
   //      begin
         if _isCasing='T' then
         begin
            data.qryLocInItemCasing.DisableControls;
            data.qryLocInItemCasing.First;
            while not data.qryLocInItemCasing.Eof do
            begin
               data.qryLocInItemCasing.Delete;
            end;
            data.qryLocInItemCasing.EnableControls;
         //gather一定要在disablecontrols执行
            data.qryLocInItemCasing.DisableControls;
            GatherFromArray(data.qryLocInItemCasing,arrlocInItemCasing,true);
            data.qryLocInItemCasing.EnableControls;
         end; 
   //      end;
   //      if datastate=stInsert then
   //      begin
   {
         data.qryLocInItemCasing.DisableControls;
         with data.qryLocInItemCasing do
         begin
           First;
           while not Eof do
           begin
             Edit;
             FieldByName('Jobno').Asstring:=data.qryin.FieldByName('Jobno').AsString;
             next;
           end;
           First;
         end;
         data.qryLocInItemCasing.EnableControls;
   }
   //      end;
         //data.qryLocationinItemTask复制
         data.qryLocationINItem.DisableControls;
         data.qryLocationINItem.First;
         while not data.qryLocationINItem.Eof do
         begin
            data.qryLocationINItem.Delete;
         end;
         data.qryLocationINItem.EnableControls;

         data.qrylocationindetail.Filtered:=false;
         data.qryLocationInDetail.DisableControls;
         data.qryLocationInDetail.First;
         while not data.qryLocationInDetail.Eof do
         data.qryLocationInDetail.Delete;
         data.qryLocationInDetail.EnableControls;
   //      GatherFromArray(data.qryLocationINItem,arrLocationINItem,true);
         data.qryLocationINItem.DisableControls;
         GatherFromArray(data.qrylocationindetail,arrLocationindetail,true);
         GatherFromArray(data.qryLocationinItem,arrLocationinItem,true);
         data.qryLocationinItem.Post;
         data.qrylocationindetail.Filtered:=True;
         grdLocationinItemChangeNodeEx(nil);
         data.qryLocationINItem.EnableControls;
   {
         with data.qryLocationINItem do
         begin
           First;
           while not Eof do
           begin
             Edit;
             FieldByName('Jobno').Asstring:=data.qryin.FieldByName('Jobno').AsString;
             next;
           end;
           First;
         end;
         data.qryLocationINItem.EnableControls;
   }
         m_blnPost := True;
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         exit;
      end;
      droplsk('#lskOldItemIn');

      data.qryin.CommitUpdates;
      data.qryLocationinItem.CommitUpdates;
      data.qryLocationin.CommitUpdates;
      data.qryautocountcostin.CommitUpdates;
      if data.qryLocInSkuDetail.active then
      begin
         data.qryLocationinDetail.CommitUpdates;
         data.qryLocationinDetail.Filtered:=True;
      end;

      data.qryLocationinItem.EnableControls;
      data.qryLocationinDetail.EnableControls;
      data.qryLocInItemCasing.enablecontrols;
      dataSelect.qryLoc.Close;  //自动推荐qry关闭
      SetDetailActive(False,True);
      ScrollAfterEdit:=False;
      blnqryInChange:=True;
      blnItemPage:=True;
      blnMainPage:=True;
      if _updatelocid='T' then
      ExecSql(dataTmp.qryTmp,'update fircusrecordsku '
                            +'   set locid="'+data.qryLocationinItem.fieldbyname('locid').AsString+'",'
                            +'       locname="'+data.qryLocationinItem.fieldbyname('locname').AsString+'",'
                            +'  from wareordersku,locationinitem '
                            +' where locationinitem.jobno="'+data.qryIn.fieldbyname('jobno').AsString+'"'
                            +'   and locationinitem.jobnoorder=wareordersku.jobno '
                            +'   and locationinitem.snoorder=wareordersku.sno '
                            +'   and wareordersku.jobnoin=fircusrecordsku.jobno '
                            +'   and wareordersku.snoin=fircusrecordsku.sno ');
      //lzw20101202
      if _StrSysCus='MT' then
      begin
         ExecSql(dataTmp.qryTmp,' update locationinitem set costquantityuom=weightuom,      '
                               +'        costquantitytask=case when (ROUND(netweighttask,-3)=0) then 1000 else ROUND(netweighttask,-3) end, '
                               +'        costquantity=case when (ROUND(netweight,-3)=0) then 1000 else ROUND(netweight,-3) end '
                               +'  where jobno="'+data.qryLocationIn.FieldByName('Jobno').AsString+'" '
             );
      end;
      //lzw20120312
      if (_StrSysCus='XT') and (data.qryLocationIn.FieldByName('blno').AsString<>'' ) then
      begin
         ExecSql(dataTmp.qryTmp,' update locinskudetail set    '
                               +'        skubrand=locationin.blno      '
                               +'   from locationin (nolock)  '
                               +'  where locinskudetail.jobno="'+data.qryLocationIn.FieldByName('Jobno').AsString+'" '
                               +'    and locationin.jobno="'+data.qryLocationIn.FieldByName('Jobno').AsString+'" '
                               +'    and locationin.jobno=locinskudetail.jobno '
             );
      end;
      WorkCall(stBrowse);
   end;

end;

procedure TfrmLocationIN.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)<>mryes then exit;
//为了控制库存 ,删除临时表
   droplsk('#lskOldItemIn');
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qryIn.FieldByName('jobno').AsString+'" ');
   data.qryautocountcostin.CancelUpdates;
   if data.qryLocInSkuDetail.active then
   data.qryLocInSkuDetail.CancelUpdates;
   if _isCasing='T' then
      data.qryLocInItemCasing.CancelUpdates;
   data.qryLocationinDetail.CancelUpdates;
   data.qryLocationinItem.CancelUpdates;
   data.qryLocationin.CancelUpdates;
   data.qryin.CancelUpdates;
//   grdLocationOutDetailReadOnly:=True;
   if DataState=stInsert then
   pgcMain.ActivePage:=tbsBrowse;
//   SetDetailActive(False,True);
   if blncasing then
   mitcasingClick(self);
   blnqryInChange:=True;
   blnMainPage:=True;
   blnItemPage:=True;
   WorkCall(stBrowse);
   if frmLIOSKUDetail<>nil then
   begin
      frmLIOSKUDetail.isupdate:=False;
      frmLIOSKUDetail.Destroy;
   end;
end;

procedure TfrmLocationIN.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLocationIN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmLocationIN.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox3);
   SetGroupbox(KGroupBox7);
   SetGroupbox(KGroupBox9);
//   SetGroupbox(KGroupBox8);
   SetGroupbox(KGroupBox12);
   SetGroupbox(grpinfobar);
   grdLocationINItem.LoadFromIniFile('D:/KinnGrid.ini');
   grdLocationINDetail.LoadFromIniFile('D:/KinnGrid.ini');
   SetDxDbGrid(grdLocationIN);
   SetDxDbGrid(grdLocationINItem);
   SetDxDbGrid(grdLocationINDetail);
   SetDxDbGrid(grdCasing);
   SetDxDbGrid(grdAutoCost);
   height:=500;
   width:=789;
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
   pgcMain.ActivePage:=tbsBrowse;
   pgcLocationINOUT.ActivePage:=tbsInfo;
end;

procedure TfrmLocationIN.FormDestroy(Sender: TObject);
begin
   sltselect.Destroy;
   grdLocationINItem.SaveToIniFile('D:/KinnGrid.ini');
   grdLocationinDetail.SaveToIniFile('D:/KinnGrid.ini');
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   sltCostUomitem.Destroy;
   data.qryLocationIn.Close;
   data.qryLocationInItem.Close;
   data.qryLocationInDetail.Close;
   data.qryLocInItemCasing.Close;
   data.qryautocountcostin.Close;
   data.qryIn.Close;
   frmLocationIN:=nil;
   qryTmp1.Connection:=_ADOConnection;
end;

procedure TfrmLocationIN.FormKeyDown(Sender: TObject; var Key: Word;
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
      if DataState in Setdcs then ActiveControl:=grdLocationINItem;
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
            grdLocationIN.SetFocus;
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
  //      Ord('C'):KeyDownControl(Key,btnCopy);

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

procedure TfrmLocationIN.pgcMainChange(Sender: TObject);
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

procedure TfrmLocationIN.mitFilterActiveClick(Sender: TObject);
begin
  grdLocationIN.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmLocationIN.grdLocationINDblClick(Sender: TObject);
begin
  pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmLocationIN.edtCostCusButtonClick(Sender: TObject;
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
            data.qryLocationIn.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            //lzw20090512
            if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
            begin
               data.qryLocationIn.FieldByName('mincostin').AsString  :=qrySelect.FieldByName('mincostin').asstring;
            end;  
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end else
      begin
         GetCusCnfg;
      end;
      //lzw20090319
      if strSysCus='SWZ' then
      begin
         OpenSql(datatmp.qryTmp,'select * from contract (nolock)    '+chr(13)+chr(10)
                               +' where signcusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                               +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                               +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
         if datatmp.qryTmp.RecordCount<>0 then
         begin
            data.qryLocationIn.FieldByName('corpno').AsString  :=datatmp.qryTmp.FieldByName('contractno').asstring;
         end;
      end;
   end;
end;

procedure TfrmLocationIN.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin

  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qryLocationIn.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qryLocationIn.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmLocationIN.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryLocationIn.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         data.qryLocationIn.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.Showhint(var HintStr: string; var CanShow: Boolean;
   var HintInfo: THintInfo);
begin
  if HintInfo.HintControl =edtCreateName  then
  begin
    Hintstr := data.qryLocationin.FieldByName('CREATEDate').AsString;
    HintInfo.HintColor := clHighlightText;
  end else
  if HintInfo.HintControl =edtOperationName  then
  begin
    Hintstr := data.qryLocationin.FieldByName('OPERATIONDate').AsString;
    HintInfo.HintColor := clHighlightText;
  end else
  if HintInfo.HintControl =edtCheckName  then
  begin
    Hintstr := data.qryLocationin.FieldByName('CHECKDate').AsString;
    HintInfo.HintColor := clHighlightText;
  end else
  if HintInfo.HintControl =edtCountName  then
  begin
    Hintstr := data.qryLocationin.FieldByName('CountDate').AsString;
    HintInfo.HintColor := clHighlightText;
  end;

 { if HintInfo.HintControl = grdLocationINItem then
  begin
    Hintstr := '1件数='+data.qryLocationinItem.FieldByName('PiecePro').AsString+' 数量'+chr(13)+chr(10)
             + '1件数='+data.qryLocationinItem.FieldByName('AreaPro').AsString+' 面积'+chr(13)+chr(10)
             + '1件数='+data.qryLocationinItem.FieldByName('VolumePro').AsString+' 体积'+chr(13)+chr(10)
             + '1件数='+data.qryLocationinItem.FieldByName('NetWeightPro').AsString+' 重量'+chr(13)+chr(10)
             + '商品编码：'+data.qryLocationinItem.FieldByName('customerno').AsString+chr(13)+chr(10)
             + '商品型号：'+data.qryLocationinItem.FieldByName('skumodel').AsString+chr(13)+chr(10)
             + '商品规格：'+data.qryLocationinItem.FieldByName('skuspec').AsString+chr(13)+chr(10)
             + '商品颜色：'+data.qryLocationinItem.FieldByName('color').AsString+chr(13)+chr(10)
//             + '海关编码：'+data.qryLocationinItem.FieldByName('customno').AsString+chr(13)+chr(10)
//             + '商品描述：'+data.qryLocationinItem.FieldByName('skudes').AsString
              ;
    HintInfo.HintColor := clHighlightText;
  end; }
end;

function TfrmLocationIN.CheckModifyMode(pstrCallMode:string;pstrIsdel:boolean):Boolean;
{检查是否可修改或删除、生成（到货、上架、直接上架、拣货、出货、直接出货）
  pstrCallMode：修改 E dit
                删除 D elete
                新增 A dd
                生成 G enerate
  pstrIsdel : 删除事件时判断是删除还是取消上架
  _canmodifyother:是否可以修改删除别人的数据
}
begin
   Result:=False;
   if pstrCallMode='D' then
   begin
      if pstrIsdel then //删除
      begin
         if (data.qryIn.FieldByName('OPERATIONNAME').AsString<>'') then
         begin
           { if _Language='CAPTIONC' then _strmessage:='该笔进仓已产生上架，请先删除上架!'
            else _strmessage:='该笔进仓已产生上架，请先删除上架!'; }
            kMessageDlg(GetMessage('frmLocationIN','016'), mtWarning, [mbOK], 0);
            Exit;
         end else
         if (data.qryIn.FieldByName('taskcheckname').AsString<>'') and (_strsyscus<>'XSWL') then
         begin
            //任务复核
            kMessageDlg(GetMessage('frmLocationIN','082'), mtWarning, [mbOK], 0);
            Exit;
         end;
      end else
      begin   //取消上架
         if (data.qryIn.FieldByName('OPERATIONNAME').AsString='') then
         begin
           { if _Language='CAPTIONC' then _strmessage:='该笔进仓还未上架，无法取消上架!'
            else _strmessage:='该笔进仓还未上架，无法取消上架!'; }
            kMessageDlg(GetMessage('frmLocationIN','017'), mtWarning, [mbOK], 0);
            Exit;
         end;
      end;
   end;

   if strFlow='DETAIL' then
   begin
      if (data.qryin.FieldByName('operationname').AsString<>'') and
         (data.qryin.FieldByName('operationname').AsString<>_LoginName) and
         (_canmodifyother<>'T')  then
      begin
         {if _Language='CAPTIONC' then _strmessage:='该直接上架不是您输入的，不能修改、删除!'
         else _strmessage:='该直接上架不是您输入的，不能修改、删除!';}
         kMessageDlg(GetMessage('frmLocationIN','018'), mtWarning, [mbOK], 0);
         exit;
      end;
   end else
   begin
      if pstrCallMode='D' then
      begin
         if pstrIsdel then //删除
         begin
            if (data.qryin.FieldByName('createname').AsString<>_LoginName) and (_canmodifyother<>'T') then
            begin  //只能修改自己新增的
               {if _Language='CAPTIONC' then _strmessage:='该进仓任务不是你录入的，不能修改,删除!'
               else _strmessage:='该进仓任务不是你录入的，不能修改,删除!'; }
               kMessageDlg(GetMessage('frmLocationIN','019'), mtWarning, [mbOK], 0);
               exit;
            end;
         end else
         begin
            if (data.qryin.FieldByName('operationname').AsString<>'') and
               (data.qryin.FieldByName('operationname').AsString<>_LoginName) and
               (_canmodifyother<>'T') then
            begin  //只能修改自己新增的
              { if _Language='CAPTIONC' then _strmessage:='该直接上架不是您输入的，不能修改、删除!'
               else _strmessage:='该直接上架不是您输入的，不能修改、删除!'; }
               kMessageDlg(GetMessage('frmLocationIN','018'), mtWarning, [mbOK], 0);
               exit;
            end else
         end;
      end else
      begin
         if (data.qryin.FieldByName('createname').AsString<>_LoginName) and
            (_canmodifyother<>'T')  then
         begin  //只能修改自己新增的
            {if _Language='CAPTIONC' then _strmessage:='该进仓任务不是你录入的，不能修改,删除!'
            else _strmessage:='该进仓任务不是你录入的，不能修改,删除!';}
            kMessageDlg(GetMessage('frmLocationIN','019'), mtWarning, [mbOK], 0);
            exit;
         end;
      end;
   end;

   if (data.qryin.FieldByName('CheckName').AsString<>'') then
   begin  //已审核的任务数据不能修改
     { if _Language='CAPTIONC' then _strmessage:='该笔已审核，不能修改、删除!'
      else _strmessage:='该笔已审核，不能修改、删除!'; }
      kMessageDlg(GetMessage('frmLocationIN','021'), mtWarning, [mbOK], 0);
      exit;
   end;
   //任务审核
   if (data.qryin.FieldByName('taskCheckName').AsString<>'') and (_strsyscus='XSWL')
      and (UpperCase(strFlow)='ITEM')  then
   begin  //已审核的任务数据不能修改
     { if _Language='CAPTIONC' then _strmessage:='该笔已复核，不能修改、删除!'
      else _strmessage:='该笔已审核，不能修改、删除!'; }
      kMessageDlg(GetMessage('frmLocationIN','083'), mtWarning, [mbOK], 0);
      exit;
   end;

   OpenSql(dataTmp.qryTmp,'select costcheckname,ratename from cost(nolock) '
                         +' where jobno="'+data.qryIn.fieldbyname('jobno').AsString+'"');
   if (dataTmp.qryTmp.FieldByName('costcheckname').AsString<>'') then
   begin//判断是否财务审核
      {if _Language='CAPTIONC' then _strmessage:='该笔已财务审核，不能修改、删除!'
      else _strmessage:='该笔已财务审核，不能修改、删除!'; }
      datatmp.qrytmp.close;
      kMessageDlg(GetMessage('frmLocationIN','020'), mtWarning, [mbOK], 0);
      exit;
   end else
   if trim(datatmp.qryTmp.FieldByName('RateName').AsString)<>'' then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
      else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'; }
      datatmp.qrytmp.close;
      kMessageDlg(GetMessage('frmLocationIN','015'), mtWarning, [mbOK], 0);
      exit;
   end;
   datatmp.qrytmp.close;

   OpenSql(datatmp.qryTmp,'select num=count(1) '
                         +'  from costitem(nolock) '
                         +' where jobno="'+data.qryin.FieldByName('Jobno').AsString+'" '
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

   OpenSql(datatmp.qryTmp,'select count=count(1) from locationinitem (nolock) '
                         +' where jobno="'+data.qryIn.fieldbyname('jobno').AsString+'" '
                         +'   and isnull(quantitydoorder,0)<>0 ' );
   if dataTmp.qryTmp.FieldByName('count').AsInteger<>0 then
   begin
      {if _Language='CAPTIONC' then _strmessage:='该进仓已经产生出货，不能修改、删除!'
      else _strmessage:='该进仓已经产生出货，不能修改、删除!';}
      kMessageDlg(GetMessage('frmLocationIN','022'), mtWarning, [mbOK], 0);
      exit;
   end;
   Result:=True;
end;

procedure TfrmLocationIN.mitDelLocationINOUTDetailClick(
  Sender: TObject);
begin
   if (data.qryLocationInItem.IsEmpty) or (grdLocationOutDetailReadOnly) then exit;
   if data.qryLocationIndetail.FieldByName('quantitydo').AsFloat<>0 then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该笔已经产生出仓,不能删除!'
      else _strmessage:='该笔已经产生出仓,不能删除!'; }
      Kmessagedlg(GetMessage('frmLocationIN','022'),mtWarning,[mbyes], 0);
      exit;
   end;
   if data.qryLocationINDetail.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdLocationINDetail.setfocus;
      strDel_Detail:=strDel_Detail+' or (SNO='+data.qryLocationInItem.fieldbyname('SNO').Asstring
                  +' and ldsno='+data.qryLocationinDetail.fieldbyname('ldSNO').Asstring+')';
      data.qryLocationinDetail.delete;
   end;
end;

procedure TfrmLocationIN.mitSKUSelectClick(Sender: TObject);
var
  i:integer;
  qrySelect:TKADOQuery;
//  TSKUSelect:TMultSKUSelection;
//  mulSKUSelect:TMultLocationSKUSelect;
begin
   if data.qryLocationin.fieldbyname('costcusid').asstring='' then
   begin
      ActiveControl:=edtCostCus;
      {if _Language='CAPTIONC' then _strmessage:='费用关系人不能为空，必须填写！'
      else _strmessage:='费用关系人不能为空，必须填写！';}
      KMessageDlg(GetMessage('frmLocationIN','023'),mtWarning,[mbOK],0);
      Exit;
   end;
   qrySelect:=PGetSKUSelect('',data.qryLocationINItem.fieldByname('Shippercusid').AsString,'D');
   qrySelect.First;

   //二次校验  开始
   if (blnScheck) and (_IsManager<>'T') and (qrySelect.RecordCount<>0) then
   begin
      if blnFirst then
      begin
         strFirstSkuid:=qrySelect.FieldByName('skuid').AsString;
         blnFirst:=False;
         kMessageDlg('为确保信息的正确性，请再次挑选商品！', mtInformation, [mbOK], 0);
         Exit;
      end else
      begin
         blnFirst:=True;
         if strFirstSkuid<>qrySelect.FieldByName('skuid').AsString then
         begin
            kMessageDlg('挑选的商品不一致，请重新挑选！', mtInformation, [mbOK], 0);
            exit;
         end;
      end;
   end;
   //二次校验 过程结束

   i:=0;
   while not qryselect.Eof do
   begin
     begin
        if i=0 then
        begin
           inc(i);
           data.qryLocationinItem.edit;
           data.qryLocationin.Edit;
           if qryselect.fieldbyname('SKUName_set').AsString<>'' then
           begin
              data.qryLocationin.fieldbyname('SKUNAME').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
              data.qryLocationin.fieldbyname('Quantitytasked').AsFloat  :=qryselect.fieldbyname('Quantity_set').AsFloat;
              data.qryLocationin.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
              data.qryLocationin.fieldbyname('Piecetasked').AsFloat     :=qryselect.fieldbyname('Quantity_set').AsFloat;
              data.qryLocationin.fieldbyname('PieceUOM').asstring       :=qryselect.fieldbyname('PieceUOM').asstring;
           end;
           data.qryLocationIn.FieldByName('skucostclasscd').AsString :=qryselect.fieldbyname('skucostclasscd').asstring;
        end else
        begin
           try
              data.qryLocationINItem.Post;
           except
              break;
           end;
           data.qryLocationINItem.append;
           grdLocationINItemBeforeInsert;
        end;
        strGetCd := qryselect.fieldbyname('SKUName').asstring;
        if qryselect.Fieldbyname('LotCode').asstring<>'' then
           data.qryLocationINItem.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
        SetSkuInfo(qrySelect);
        if (strSysCus='WYFQ') and  (data.qryLocationIn.FieldByName('shipcusname').AsString='') then
        begin
            OpenSql(dataTmp.qryTmp,' select alternateskuname from sku(nolock) where skuid="'+qryselect.Fieldbyname('skuid').asstring+'" ');
            data.qryLocationIn.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.Fieldbyname('alternateskuname').asstring;
        end;
        if strSysCus='SZWY' then
        begin
            OpenSql(dataTmp.qryTmp,' select alternateskuname from sku(nolock) where skuid="'+qryselect.Fieldbyname('skuid').asstring+'" ');
            data.qryLocationINItem.FieldByName('quantityshort').AsString:=dataTmp.qryTmp.Fieldbyname('alternateskuname').asstring;
        end;

{     以前根据某个客户的需要而做的，现在没用了
        OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,currcd,price,pricein '
                              +'  from skuprice (nolock) '
                              +' where convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryLocationIn.fieldbyname('taskdate').asdatetime)+'"'
                              +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                              +'   and uomtype="'+data.qryLocationInItem.fieldbyname('CostUOMType').AsString+'"'
//                              +'   and userid like "'+_userid+'%"'
                              +'   and "'+_userid+'" like userid+"%"'
                              +'   order by userid desc'
               );
        if dataTmp.qryTmp.RecordCount<>0 then
        begin
           data.qryLocationInItem.FieldByName('carriage').AsFloat :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
           data.qryLocationInItem.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
           data.qryLocationINItem.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
           data.qryLocationINItem.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp.Fieldbyname('pricein').asFloat;
           data.qryLocationINItem.Fieldbyname('price').asFloat    :=dataTmp.qryTmp.Fieldbyname('price').asFloat;
           //dwq20060322
           data.qryLocationINItem.Fieldbyname('skucostin').asFloat  :=dataTmp.qryTmp.Fieldbyname('pricein').asFloat;
           data.qryLocationINItem.Fieldbyname('skucost').asFloat    :=dataTmp.qryTmp.Fieldbyname('price').asFloat;
        end;
        }
        if pos('"'+qryselect.fieldbyname('skuid').AsString+'"',strTraySkuClassid)=0 then
           strTraySkuClassid:=strTraySkuClassid+'"'+qryselect.fieldbyname('skuid').AsString+'",';
     end;
     qryselect.Next;
   end;
end;

procedure TfrmLocationIN.CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended;pstrtype:string='DETAIL');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   quantityfield,piecefield,volumefield,netweightfield,grossweightfield,areafield,
   casing1field,casing2field,casing3field,casing4field,casing5field,costquantityfield:string;
begin
   if _piececal then exit;
   if _weightcal then Exit;
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
      if (pstrtype<>'ITEM') and (getSysdata('qdtext')='T') then
      begin
        FieldByName('Piece').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('quantity').AsFloat
                                             /oldValue;
        FieldByName('Volume').AsFloat:=FieldByName('quantity').AsFloat
                                             *FieldByName('Volume').AsFloat
                                             /oldValue;
        FieldByName('Area').AsFloat:=FieldByName('quantity').AsFloat
                                             *FieldByName('Area').AsFloat
                                             /oldValue;
        FieldByName('NetWeight').AsFloat:=FieldByName('quantity').AsFloat
                                             *FieldByName('NetWeight').AsFloat
                                             /oldValue;
        FieldByName('GrossWeight').AsFloat:=FieldByName('quantity').AsFloat
                                             *FieldByName('GrossWeight').AsFloat
                                             /oldValue;
        FieldByName('costquantity').AsFloat:=FieldByName('quantity').AsFloat
                                             *FieldByName('costquantity').AsFloat
                                             /oldValue;
      end else
      begin
        //件数
         if (FieldByName('PiecePro').AsInteger<>0) then
            FieldByName(piecefield).AsFloat:=(FieldByName(quantityfield).AsFloat/FieldByName('PiecePro').AsFloat);
         //体积
         if ((FieldByName(piecefield).AsFloat*FieldByName('VolumePro').AsFloat)<>0) then
            FieldByName(volumefield).AsFloat:=FieldByName(piecefield).AsFloat*FieldByName('VolumePro').AsFloat;
         //面积
         if ((FieldByName(quantityfield).AsFloat*FieldByName('AreaPro').AsFloat)<>0) then
            FieldByName(areafield).AsFloat:=FieldByName(piecefield).AsFloat*FieldByName('AreaPro').AsFloat;
         //净重
         if ((FieldByName(quantityfield).AsFloat*FieldByName('NetWeightPro').AsFloat)<>0) then
            FieldByName(netweightfield).AsFloat:=FieldByName(piecefield).AsFloat*FieldByName('NetWeightPro').AsFloat;
         //毛重
         if ((FieldByName(quantityfield).AsFloat*FieldByName('GrossWeightPro').AsFloat)<>0) then
           FieldByName(grossweightfield).AsFloat:=FieldByName(piecefield).AsFloat*FieldByName('GrossWeightPro').AsFloat;
         //外包装一
         if (FieldByName('Pro1').AsInteger<>0) then
            FieldByName(casing1field).AsFloat:=(FieldByName(piecefield).AsFloat/FieldByName('Pro1').AsFloat);
         //外包装二
         if (FieldByName('Pro2').AsInteger<>0) then
            FieldByName(casing2field).AsFloat:=(FieldByName(piecefield).AsFloat/FieldByName('Pro2').AsFloat);
         //外包装三
         if (FieldByName('Pro3').AsInteger<>0) then
            FieldByName(casing3field).AsFloat:=(FieldByName(piecefield).AsFloat/FieldByName('Pro3').AsFloat);
         //外包装四
         if (FieldByName('Pro4').AsInteger<>0) then
            FieldByName(casing4field).AsFloat:=(FieldByName(piecefield).AsFloat/FieldByName('Pro4').AsFloat);
        //外包装五
         if (FieldByName('Pro5').AsInteger<>0) then
            FieldByName(casing5field).AsFloat:=(FieldByName(piecefield).AsFloat/FieldByName('Pro5').AsFloat) ;
         //计费单位量
         if (OldValue<>0) then
        {wql    FieldByName(costquantityfield).AsFloat:=(FieldByName(quantityfield).AsFloat
                                             *FieldByName(costquantityfield).AsFloat
                                             /oldValue);}
            FieldByName(costquantityfield).AsFloat:=(FieldByName(costquantityfield).AsFloat
                                             *FieldByName(quantityfield).AsFloat
                                             /oldValue);
      end;
   end;
end;

procedure TfrmLocationIN.mitOrderSKUSelectClick(Sender: TObject);
var
  i:integer;
  TWareOrderSKUSelect:TMultWareOrderSKUSelect;
begin
   if _isnocusfilter='T' then       //wql.05.09.26
      TWareOrderSKUSelect:=  WorkWareOrderSKUSelect('IN','','','','', sltselect,False)
   else
      TWareOrderSKUSelect:=  WorkWareOrderSKUSelect('IN',data.qryLocationInItem.fieldbyname('cusid').asstring,
                                                    data.qryLocationInItem.fieldbyname('cusname').asstring,
                                                    data.qryLocationInItem.fieldbyname('shippercusid').asstring,
                                                    data.qryLocationInItem.fieldbyname('shippercusname').asstring,
                                                    sltselect,False,
                                                    data.qrylocationin.fieldbyname('istrade').AsString);

   for i:=0 to 300 do
   begin
     if TWareOrderSKUSelect[i].OkFlag then
     begin
       if i=0 then
       begin
         data.qryLocationINItem.edit;
         data.qryLocationin.Edit;
         data.qryLocationin.fieldbyname('LotTracked').asstring       :=TWareOrderSKUSelect[i].LotTracked;
         data.qryLocationin.fieldbyname('TagEach').asstring          :=TWareOrderSKUSelect[i].TagEach;
         data.qryLocationin.fieldbyname('WareRentCountType').asstring:=TWareOrderSKUSelect[i].WareRentCountType;
         data.qryLocationin.fieldbyname('isbond').asstring           :=TWareOrderSKUSelect[i].isbond;
         data.qryLocationin.fieldbyname('COUNTRENT').asstring        :=TWareOrderSKUSelect[i].COUNTRENT;
         data.qryLocationin.fieldbyname('COUNTCONTCOST').asstring    :=TWareOrderSKUSelect[i].COUNTCONTCOST;
         data.qryLocationin.fieldbyname('SKUCOSTCLASSCD').asstring   :=TWareOrderSKUSelect[i].SKUCOSTCLASSCD;
         data.qryLocationin.fieldbyname('CountWho').asstring         :=TWareOrderSKUSelect[i].CountWho;
         data.qryLocationin.fieldbyname('loadcosttype').asstring     :=TWareOrderSKUSelect[i].loadcosttype;
         if data.qryLocationin.fieldbyname('costcusid').asstring='' then
           begin
             data.qryLocationin.fieldbyname('costcusid').asstring  :=TWareOrderSKUSelect[i].costcusid;
             data.qryLocationin.fieldbyname('costcusname').asstring:=TWareOrderSKUSelect[i].costcusname;
           end;
 //          ckbTariffClick(self);
         if (data.qryLocationin.fieldbyname('CustomsNO').asstring='') then
         begin
           data.qryLocationin.fieldbyname('CustomsNO').asstring:=TWareOrderSKUSelect[i].CustomsNO
         end;
         if (data.qryLocationin.fieldbyname('cusbillno').asstring='') then
         begin
            data.qryLocationin.fieldbyname('cusbillno').asstring:=TWareOrderSKUSelect[i].cusbillno
         end;
       end else
       begin
         try
           data.qryLocationINItem.Post;
         except
           break;
         end;
         data.qryLocationINItem.append;
         grdLocationINItemBeforeInsert;
         data.qryLocationINItem.fieldbyname('sno').Asinteger:=-1;
         data.qryLocationINItem.fieldByname('jobno').AsString:=data.qryLocationin.fieldbyname('jobno').AsString;
         data.qryLocationINItem.fieldByname('userid').AsString:=data.qryLocationin.fieldbyname('userid').AsString;
       end;
       data.qryLocationINItem.fieldbyname('JOBNOorder').asstring          :=TWareOrderSKUSelect[i].JOBNO            ;
       data.qryLocationINItem.fieldbyname('SKUID').asstring               :=TWareOrderSKUSelect[i].SKUID            ;
       data.qryLocationINItem.fieldbyname('SKUName').asstring             :=TWareOrderSKUSelect[i].SKUName            ;
 //        strGetCd := TWareOrderSKUSelect[i].SKUName;
       data.qryLocationINItem.fieldbyname('SNOorder').asInteger             :=TWareOrderSKUSelect[i].SNO              ;
       data.qryLocationINItem.Fieldbyname('LotCode').asstring             :=TWareOrderSKUSelect[i].LotCode          ;
       data.qryLocationINItem.fieldbyname('Quantitytask').AsFloat             :=TWareOrderSKUSelect[i].syQuantity         ;
       if TWareOrderSKUSelect[i].QualityName<>'' then
       data.qryLocationINItem.fieldbyname('QualityName').asstring         :=TWareOrderSKUSelect[i].QualityName
       else
       data.qryLocationINItem.fieldbyname('QualityName').asstring         :='正品';
       data.qryLocationINItem.fieldbyname('QuantityUOM').asstring         :=TWareOrderSKUSelect[i].QuantityUOM         ;//wql.05.10.14
       data.qryLocationINItem.fieldbyname('PieceUOM').asstring            :=TWareOrderSKUSelect[i].PieceUOM         ;
       data.qryLocationINItem.fieldbyname('WeightUOM').asstring           :=TWareOrderSKUSelect[i].WeightUOM        ;
       data.qryLocationINItem.fieldbyname('VolumeUOM').asstring           :=TWareOrderSKUSelect[i].VolumeUOM        ;
       data.qryLocationINItem.Fieldbyname('AreaUOM').asstring             :=TWareOrderSKUSelect[i].AreaUOM          ;
       data.qryLocationINItem.fieldbyname('Piecetask').AsFloat                :=TWareOrderSKUSelect[i].syPiece            ;
       data.qryLocationINItem.fieldbyname('NetWeighttask').asFloat            :=TWareOrderSKUSelect[i].syNetWeight        ;
       data.qryLocationINItem.Fieldbyname('GrossWeighttask').asFloat          :=TWareOrderSKUSelect[i].syGrossWeight      ;
       data.qryLocationINItem.fieldbyname('Volumetask').asFloat               :=TWareOrderSKUSelect[i].syVolume           ;
       data.qryLocationINItem.Fieldbyname('Areatask').asFloat                 :=TWareOrderSKUSelect[i].syArea             ;
       data.qryLocationINItem.fieldbyname('cusid').asstring           :=TWareOrderSKUSelect[i].cusid        ;
       data.qryLocationINItem.fieldbyname('cusname').asstring         :=TWareOrderSKUSelect[i].cusname      ;
       data.qryLocationINItem.Fieldbyname('shippercusid').asstring    :=TWareOrderSKUSelect[i].shippercusid ;
       data.qryLocationINItem.Fieldbyname('shippercusname').asstring  :=TWareOrderSKUSelect[i].shippercusname ;
       data.qryLocationINItem.Fieldbyname('shipcusid').asstring    :=TWareOrderSKUSelect[i].shipcusid ;
       data.qryLocationINItem.Fieldbyname('shipcusname').asstring  :=TWareOrderSKUSelect[i].shipcusname ;
       data.qryLocationINItem.Fieldbyname('conscusid').asstring    :=TWareOrderSKUSelect[i].conscusid ;
       data.qryLocationINItem.Fieldbyname('conscusname').asstring  :=TWareOrderSKUSelect[i].conscusname ;
       data.qryLocationINItem.Fieldbyname('costcusid').asstring    :=TWareOrderSKUSelect[i].costcusid ;
       data.qryLocationINItem.Fieldbyname('costcusname').asstring  :=TWareOrderSKUSelect[i].costcusname ;
       data.qryLocationINItem.fieldbyname('locid').asString          :=TWareOrderSKUSelect[i].locid       ;
       data.qryLocationINItem.fieldbyname('locname').asString        :=TWareOrderSKUSelect[i].locname     ;
       data.qryLocationINItem.Fieldbyname('PiecePro').asFloat      :=0;
       data.qryLocationINItem.Fieldbyname('VolumePro').asFloat     :=0;
       data.qryLocationINItem.fieldbyname('NetWeightPro').asFloat  :=0;
       data.qryLocationINItem.fieldbyname('GrossWeightPro').asFloat:=0;
       data.qryLocationINItem.fieldbyname('AreaPro').asFloat       :=0;

       data.qryLocationINItem.Fieldbyname('UOM1').asstring        :=TWareOrderSKUSelect[i].UOM1;
       data.qryLocationINItem.Fieldbyname('UOM2').asstring        :=TWareOrderSKUSelect[i].UOM2;
       data.qryLocationINItem.Fieldbyname('UOM3').asstring        :=TWareOrderSKUSelect[i].UOM3;
       data.qryLocationINItem.Fieldbyname('UOM4').asstring        :=TWareOrderSKUSelect[i].UOM4;
       data.qryLocationINItem.Fieldbyname('UOM5').asstring        :=TWareOrderSKUSelect[i].UOM5;
       data.qryLocationINItem.Fieldbyname('Pro1').asFloat   :=0;
       data.qryLocationINItem.Fieldbyname('Pro2').asFloat   :=0;
       data.qryLocationINItem.Fieldbyname('Pro3').asFloat   :=0;
       data.qryLocationINItem.Fieldbyname('Pro4').asFloat   :=0;
       data.qryLocationINItem.Fieldbyname('Pro5').asFloat   :=0;
       data.qryLocationINItem.Fieldbyname('Casing1task').asFloat            :=TWareOrderSKUSelect[i].syCasing1;
       data.qryLocationINItem.Fieldbyname('Casing2task').asFloat            :=TWareOrderSKUSelect[i].syCasing2;
       data.qryLocationINItem.Fieldbyname('Casing3task').asFloat            :=TWareOrderSKUSelect[i].syCasing3;
       data.qryLocationINItem.Fieldbyname('Casing4task').asFloat            :=TWareOrderSKUSelect[i].syCasing4;
       data.qryLocationINItem.Fieldbyname('Casing5task').asFloat            :=TWareOrderSKUSelect[i].syCasing5;

       data.qryLocationINItem.Fieldbyname('price').asFloat                :=TWareOrderSKUSelect[i].price;
       data.qryLocationINItem.Fieldbyname('currcd').asstring              :=TWareOrderSKUSelect[i].currcd;
       data.qryLocationINItem.Fieldbyname('carriagecurrcd').asstring      :=TWareOrderSKUSelect[i].carriagecurrcd;
       data.qryLocationINItem.fieldbyname('skucost').asFloat              :=TWareOrderSKUSelect[i].skucost;
       data.qryLocationINItem.Fieldbyname('priceIn').asFloat              :=TWareOrderSKUSelect[i].priceIn;
       data.qryLocationINItem.fieldbyname('skucostIn').asFloat            :=TWareOrderSKUSelect[i].skucostIn;
       data.qryLocationINItem.fieldbyname('CostUOMType').asString         :=TWareOrderSKUSelect[i].CostUOMType;
 //dwq20070613
 //        data.qryLocationINItem.fieldbyname('JOBNOIN').asstring             :=TWareOrderSKUSelect[i].JobnoIN;
 //        data.qryLocationINItem.Fieldbyname('SNOIN').asInteger              :=TWareOrderSKUSelect[i].SNOIN;
       data.qryLocationINItem.fieldbyname('jobnoorder').asstring          :=TWareOrderSKUSelect[i].jobno;
       data.qryLocationINItem.Fieldbyname('SNOorder').asInteger           :=TWareOrderSKUSelect[i].SNO;
       data.qryLocationINItem.fieldbyname('jobnoori').asstring            :=TWareOrderSKUSelect[i].jobnoori;
       data.qryLocationINItem.Fieldbyname('snoori').asInteger             :=TWareOrderSKUSelect[i].SNOori;
       data.qryLocationINItem.Fieldbyname('LDSNOIN').asInteger            :=TWareOrderSKUSelect[i].LDSNOIN;
       data.qryLocationINItem.fieldbyname('JOBNOINF').asstring            :=TWareOrderSKUSelect[i].JobnoINF;
       data.qryLocationINItem.Fieldbyname('SNOINF').asInteger             :=TWareOrderSKUSelect[i].SNOINF;
       data.qryLocationINItem.Fieldbyname('LDSNOINF').asInteger           :=TWareOrderSKUSelect[i].LDsNOINF;
       data.qryLocationINItem.Fieldbyname('CustomsNO').asString           :=TWareOrderSKUSelect[i].CustomsNO;
       data.qryLocationINItem.fieldbyname('LocationBillNO').asstring      :=TWareOrderSKUSelect[i].LocationBillNO;
       data.qryLocationINItem.fieldbyname('LotTracked').asstring          :=TWareOrderSKUSelect[i].LotTracked;
       data.qryLocationINItem.fieldbyname('TagEach').asstring             :=TWareOrderSKUSelect[i].TagEach;
       data.qryLocationINItem.fieldbyname('TagEachUOM').asstring          :=TWareOrderSKUSelect[i].TagEachUOM;
       data.qryLocationINItem.fieldbyname('WareRentCountType').asstring   :=TWareOrderSKUSelect[i].WareRentCountType;
       data.qryLocationINItem.fieldbyname('isbond').asstring              :=TWareOrderSKUSelect[i].isbond;
       data.qryLocationINItem.fieldbyname('COUNTRENT').asstring           :=TWareOrderSKUSelect[i].COUNTRENT;
       data.qryLocationINItem.fieldbyname('COUNTCONTCOST').asstring       :=TWareOrderSKUSelect[i].COUNTCONTCOST;
       data.qryLocationINItem.Fieldbyname('LOADCOSTONE').asString         :=TWareOrderSKUSelect[i].LOADCOSTONE;
       data.qryLocationINItem.fieldbyname('SKUCOSTCLASSCD').asstring      :=TWareOrderSKUSelect[i].SKUCOSTCLASSCD;
       data.qryLocationINItem.Fieldbyname('RentCountUOMType').asString    :=TWareOrderSKUSelect[i].RentCountUOMType;
       //应付非仓储且和应收单位一样.
       data.qryLocationINItem.Fieldbyname('RentCountUOMTypeout').asString :=TWareOrderSKUSelect[i].RentCountUOMType;
       data.qryLocationINItem.Fieldbyname('CostCountUOMType').asString    :=TWareOrderSKUSelect[i].CostCountUOMType;
       data.qryLocationINItem.fieldbyname('corpno').asstring        :=TWareOrderSKUSelect[i].corpno;
       data.qryLocationINItem.fieldbyname('carriage').AsFloat       :=TWareOrderSKUSelect[i].carriage;
       data.qryLocationINItem.Fieldbyname('carriagetotal').AsFloat  :=TWareOrderSKUSelect[i].carriagetotal;
       data.qryLocationINItem.fieldbyname('insurance').AsFloat      :=TWareOrderSKUSelect[i].insurance;
       data.qryLocationINItem.Fieldbyname('insurancetotal').AsFloat :=TWareOrderSKUSelect[i].insurancetotal;

       data.qryLocationINItem.fieldbyname('skumodel').asstring      :=TWareOrderSKUSelect[i].skumodel;
       data.qryLocationINItem.fieldbyname('skuspec').asstring       :=TWareOrderSKUSelect[i].skuspec;
       data.qryLocationINItem.fieldbyname('color').asstring         :=TWareOrderSKUSelect[i].color;
       data.qryLocationINItem.fieldbyname('customerno').asstring    :=TWareOrderSKUSelect[i].customerno;
       data.qryLocationINItem.fieldbyname('mainorder').asstring     :=TWareOrderSKUSelect[i].mainorder;
       data.qryLocationINItem.fieldbyname('remark').asstring        :=TWareOrderSKUSelect[i].remark;
       data.qryLocationINItem.Fieldbyname('costquantitytask').asFloat:=TWareOrderSKUSelect[i].sycostquantity;
       data.qryLocationINItem.Fieldbyname('costquantityuom').AsString:=TWareOrderSKUSelect[i].costquantityuom;
     end;
   end;
end;

procedure TfrmLocationIN.UpdateTransferInfo(strSender: string);
{将data.qryLocationinItem中的相关信息更新到data.qryLocationinDetail中
}
begin
  if DataState in Setdcs then
  begin
    data.qryLocationinDetail.DisableControls;
    Bookmark:= data.qryLocationinDetail.GetBookmark;
    data.qryLocationinDetail.First;
    while not data.qryLocationinDetail.Eof do
    begin
      data.qryLocationinDetail.Edit;
      if uppercase(strSender)='TAGTOTAL' then
        data.qryLocationinDetail.Fieldbyname('TagTotal').asInteger:=data.qryLocationinItem.Fieldbyname('TagTotal').asInteger;
//in
      if uppercase(strSender)='TAGUOM'         then data.qryLocationinDetail.Fieldbyname('TagEachUOM').asstring :=data.qryLocationinItem.Fieldbyname('TagEachUOM').asstring       ;
      if uppercase(strSender)='CUSID'        then data.qryLocationinDetail.fieldByname('cusid').AsString        :=data.qryLocationinItem.fieldByname('cusid').AsString        ;
      if uppercase(strSender)='SHIPPERACCOUNT' then data.qryLocationinDetail.fieldByname('ShippercusID').AsString :=data.qryLocationinItem.fieldbyname('ShippercusID').AsString;

      if uppercase(strSender)='PIECEUOM'       then data.qryLocationinDetail.Fieldbyname('PieceUOM').asstring   :=data.qryLocationinItem.Fieldbyname('PieceUOM').asstring   ;
      if uppercase(strSender)='VOLUMEUOM'      then data.qryLocationinDetail.Fieldbyname('VolumeUOM').asstring  :=data.qryLocationinItem.Fieldbyname('VolumeUOM').asstring  ;
      if uppercase(strSender)='AREAUOM'        then data.qryLocationinDetail.Fieldbyname('AreaUOM').asstring    :=data.qryLocationinItem.Fieldbyname('AreaUOM').asstring    ;
      if uppercase(strSender)='WEIGHTUOM'      then data.qryLocationinDetail.Fieldbyname('WeightUOM').asstring  :=data.qryLocationinItem.Fieldbyname('WeightUOM').asstring  ;

      if uppercase(strSender)='CASINGONEUOM'   then data.qryLocationinDetail.Fieldbyname('UOM1').asstring  :=data.qryLocationinItem.Fieldbyname('UOM1').asstring  ;
      if uppercase(strSender)='CASINGTWOUOM'   then data.qryLocationinDetail.Fieldbyname('UOM2').asstring  :=data.qryLocationinItem.Fieldbyname('UOM2').asstring  ;
      if uppercase(strSender)='CASINGTHRUOM'   then data.qryLocationinDetail.Fieldbyname('UOM3').asstring  :=data.qryLocationinItem.Fieldbyname('UOM3').asstring  ;
      if uppercase(strSender)='CASINGFOUUOM'   then data.qryLocationinDetail.Fieldbyname('UOM4').asstring  :=data.qryLocationinItem.Fieldbyname('UOM4').asstring  ;
      if uppercase(strSender)='CASINGFIVUOM'   then data.qryLocationinDetail.Fieldbyname('UOM5').asstring  :=data.qryLocationinItem.Fieldbyname('UOM5').asstring  ;
//ine
      data.qryLocationinDetail.Next;
    end;
    data.qryLocationinDetail.GotoBookmark(Bookmark);
    data.qryLocationinDetail.FreeBookmark(Bookmark);
    bookMark:=nil;
    data.qryLocationinDetail.EnableControls;
  end;
end;

function TfrmLocationIN.DeleteOperationInfo:Boolean;
{若data.qryLocationinItem中相关数据修改,影响data.qryLocationinDetail中的数据,
 故应先删除!
 返回值为是否成功
}
begin
  Result:=True;
end;

function TfrmLocationIN.CheckItemDetailInfo(pstrFieldENGName,pstrFieldCHNName:string;pValueDetail:Variant;pType:integer):Boolean;
{校验data.qryLocationinItem、data.qryLocationin与data.qryLocationinDetail的数据,是否一致
   pstrFieldENGName:字段英文名
   pstrFieldCHNName:字段中文名
   pValueDetail:该字段当前值
   pType       :当取值为-1时表示字段类型为字符型,且与data.qryLocationinItem比较
                当取值为-2时表示字段类型为字符型,且与data.qryLocationin比较
                当取值为1时表示字段类型为数字型,且与data.qryLocationinItem比较
}
begin
  result:=True;
  if pType=-1 then
  begin
    if data.qryLocationinDetail.fieldbyname(pstrFieldENGName).AsString<>data.qryLocationinItem.fieldbyname(pstrFieldENGName).AsString then
    begin
      kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+data.qryLocationinDetail.fieldbyname(pstrFieldENGName).AsString
                 +','+GetMessage('frmLocationIN','025')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0); //'该条仓位信息中的24''与商品-实际中的25''不一致!26'
      result:=False;
    end;
  end else
  if pType=-2 then
  begin
    if iif(data.qryLocationinDetail.fieldbyname(pstrFieldENGName).AsString='','F',data.qryLocationinDetail.fieldbyname(pstrFieldENGName).AsString)<>data.qryLocationin.fieldbyname(pstrFieldENGName).AsString then
    begin
      kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+data.qryLocationinDetail.fieldbyname(pstrFieldENGName).AsString
                 +','+GetMessage('frmLocationIN','027')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);  //'该条仓位信息中的''与基本信息中的27''不一致!'
      result:=False;
    end;
  end else
  if pType=2 then
  begin
    if KRound(pValueDetail,4)<>KRound(data.qryLocationinItem.fieldbyname(pstrFieldENGName).AsFloat,4) then
    begin
      kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+FloatTOStr(pValueDetail)
                 +','+GetMessage('frmLocationIN','025')+pstrFieldCHNName+GetMessage('frmLocationIN','026'), mtWarning, [mbOK], 0);//'该条仓位信息中的'//'不一致!'
      result:=False;
    end;
  end else
  if pType=1 then
  begin
    if KRound(pValueDetail,4)>KRound(data.qryLocationinItem.fieldbyname(pstrFieldENGName).AsFloat,4) then
    begin
      kMessageDlg(GetMessage('frmLocationIN','024')+pstrFieldCHNName+iif(_Language='CAPTIONC','为','is')+FloatTOStr(pValueDetail)
                 +','+GetMessage('frmLocationIN','028')+pstrFieldCHNName+'!', mtWarning, [mbOK], 0);//'该条仓位信息中的''大于商品-实际中的28'
      result:=False;
    end;
  end;
end;

procedure TfrmLocationIN.ckbContractClick(Sender: TObject);
begin
  if (DataState in Setdcs) and ckbContract.Checked then
  begin
    data.qryLocationin.Edit;
    data.qryLocationin.FieldByName('COUNTLOADCOST').Asstring:='F';
    data.qryLocationin.FieldByName('COUNTRENT').Asstring:='F';
  end;
end;

procedure TfrmLocationIN.btnTotalClick(Sender: TObject);
var
  QuantityTotal, PieceTotal:Extended;
  VolumeTotal, AreaTotal, NetWeightTotal, GrossWeightTotal:Extended;
  QuantityTotalTask, PieceTotalTask:Extended;
  VolumeTotalTask, AreaTotalTask, NetWeightTotalTask, GrossWeightTotalTask:Extended;
  CostTotal,CostTotalIn:Extended;
  strSKUNameTotal:string;
  costquantitytotal,costquantitytasktotal:Extended;
begin
  if DataState in Setdcs then
  begin
    data.qryLocationin.Edit;
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
//    blnQuantityLike:=True;
//    blnPieceLike   :=True;
//    blnVolumeLike  :=True;
//    blnWeightLike  :=True;
//    blnAreaLike    :=True;
    data.qryLocationInItem.DisableControls;
    Bookmark:= data.qryLocationInItem.GetBookmark;
    data.qryLocationInItem.First;
    while not data.qryLocationInItem.Eof do
    begin
       QuantityTotalTask:=QuantityTotalTask
                          +data.qryLocationInItem.fieldbyname('quantitytask').AsFloat;
       PieceTotalTask:=PieceTotalTask+data.qryLocationInItem.fieldbyname('piecetask').AsFloat;
       QuantityTotal :=QuantityTotal
                          +data.qryLocationInItem.fieldbyname('quantity').AsFloat;
       PieceTotal:=PieceTotal+data.qryLocationInItem.fieldbyname('piece').AsFloat;
//全部合计
       NetWeightTotalTask:=NetWeightTotalTask+data.qryLocationINItem.fieldbyname('NetWeighttask').asfloat;
       NetWeightTotal:=NetWeightTotal+data.qryLocationINItem.fieldbyname('NetWeight').asfloat;
       GrossWeightTotalTask:=GrossWeightTotalTask+data.qryLocationINItem.fieldbyname('GrossWeighttask').asfloat;
       GrossWeightTotal:=GrossWeightTotal+data.qryLocationINItem.fieldbyname('GrossWeight').asfloat;
       VolumeTotalTask:=VolumeTotalTask+data.qryLocationINItem.fieldbyname('Volumetask').asfloat;
       VolumeTotal:=VolumeTotal+data.qryLocationINItem.fieldbyname('Volume').asfloat;
       AreaTotalTask:=AreaTotalTask+data.qryLocationINItem.fieldbyname('Areatask').asfloat;
       AreaTotal:=AreaTotal+data.qryLocationINItem.fieldbyname('Area').asfloat;
       CostTotal           :=CostTotal+data.qryLocationINItem.fieldbyname('SKUCost').asfloat;
       CostTotalIn         :=CostTotalIn+data.qryLocationINItem.fieldbyname('SKUCostIn').asfloat;
       //计费数量
       costquantitytotal    :=costquantitytotal+data.qryLocationINItem.fieldbyname('costquantitytask').asfloat;
       costquantitytasktotal:=costquantitytasktotal+data.qryLocationINItem.fieldbyname('costquantity').asfloat;

       if Pos(data.qryLocationINItem.fieldbyname('SKUName').AsString,strSKUNameTotal)=0 then
          strSKUNameTotal:=strSKUNameTotal+data.qryLocationINItem.fieldbyname('SKUName').AsString+' ';

//
{

       if blnQuantityLike and ((trim(strQuantityUOM)='')
          or (strQuantityUOM=data.qryLocationINItem.fieldbyname('QuantityUOM').AsString)) then
       begin
          strQuantityUOM   :=data.qryLocationINItem.fieldbyname('QuantityUOM').AsString;
       end else blnQuantityLike:=False;

       if blnPieceLike and ((trim(strQuantityUOM)='')
          or (strPieceUOM=data.qryLocationINItem.fieldbyname('PieceUOM').AsString)) then
       begin
          strPieceUOM   :=data.qryLocationINItem.fieldbyname('PieceUOM').AsString;
       end else blnPieceLike:=False;

       if blnVolumeLike and ((trim(strQuantityUOM)='')
           or (strVolumeUOM=data.qryLocationINItem.fieldbyname('VolumeUOM').AsString)) then
       begin
           VolumeTotalTask:=VolumeTotalTask+data.qryLocationINItem.fieldbyname('Volumetask').asfloat;
           VolumeTotal:=VolumeTotal+data.qryLocationINItem.fieldbyname('Volume').asfloat;
           strVolumeUOM   :=data.qryLocationINItem.fieldbyname('VolumeUOM').AsString;
       end else blnVolumeLike:=False;

       if blnWeightLike and ((trim(strQuantityUOM)='')
          or (strWeightUOM=data.qryLocationINItem.fieldbyname('WeightUOM').AsString)) then
       begin
          NetWeightTotalTask:=NetWeightTotalTask+data.qryLocationINItem.fieldbyname('NetWeighttask').asfloat;
          NetWeightTotal:=NetWeightTotal+data.qryLocationINItem.fieldbyname('NetWeight').asfloat;
          GrossWeightTotalTask:=GrossWeightTotalTask+data.qryLocationINItem.fieldbyname('GrossWeighttask').asfloat;
          GrossWeightTotal:=GrossWeightTotal+data.qryLocationINItem.fieldbyname('GrossWeight').asfloat;
          strWeightUOM   :=data.qryLocationINItem.fieldbyname('WeightUOM').AsString;
       end else blnWeightLike:=False;

       if blnAreaLike and ((trim(strQuantityUOM)='')
          or (strAreaUOM=data.qryLocationINItem.fieldbyname('AreaUOM').AsString)) then
       begin
          AreaTotalTask:=AreaTotalTask+data.qryLocationINItem.fieldbyname('Areatask').asfloat;
          AreaTotal:=AreaTotal+data.qryLocationINItem.fieldbyname('Area').asfloat;
          strAreaUOM   :=data.qryLocationINItem.fieldbyname('AreaUOM').AsString;
       end else blnAreaLike:=False;

       CostTotal           :=CostTotal+data.qryLocationINItem.fieldbyname('SKUCost').asfloat;
       CostTotalIn         :=CostTotalIn+data.qryLocationINItem.fieldbyname('SKUCostIn').asfloat;
}
       data.qryLocationInItem.Next;

    end;

    data.qryLocationInItem.GotoBookmark(Bookmark);
    data.qryLocationInItem.FreeBookmark(Bookmark);
    bookMark:=nil;
    data.qryLocationInItem.EnableControls;
//全部合计
    data.qryLocationIn.fieldbyname('NetWeightTasked').asFloat:=NetWeightTotalTask;
    data.qryLocationIn.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
    data.qryLocationIn.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
    data.qryLocationIn.fieldbyname('GrossWeightTasked').asFloat:=GrossWeightTotalTask;
    data.qryLocationIn.fieldbyname('Quantitytasked').AsFloat:=QuantityTotalTask;
    data.qryLocationIn.fieldbyname('Quantity').AsFloat:=QuantityTotal;
    data.qryLocationIn.fieldbyname('PieceTasked').AsFloat:=PieceTotalTask;
    data.qryLocationIn.fieldbyname('Piece').AsFloat:=PieceTotal;
    data.qryLocationIn.fieldbyname('Volume').asfloat:=VolumeTotal;
    data.qryLocationIn.fieldbyname('VolumeTasked').asfloat:=VolumeTotalTask;
    data.qryLocationIn.fieldbyname('Area').asfloat:=AreaTotal;
    data.qryLocationIn.fieldbyname('AreaTasked').asfloat:=AreaTotalTask;
    data.qryLocationIn.fieldbyname('SKUCost').asFloat:=CostTotal;
    data.qryLocationIn.fieldbyname('costquantity').asFloat:=costquantitytotal;
    data.qryLocationIn.fieldbyname('costquantitytasked').asFloat:=costquantitytasktotal;

//         if Pos(data.qryLocationINItem.fieldbyname('SKUName').AsString,strSKUNameTotal)=0 then
    data.qryLocationIn.fieldbyname('SKUname').AsString  :=strSKUNameTotal;

{
    if ((trim(data.qryLocationIn.fieldbyname('SKUNAME').asString)='') or
      (_TotalExistsUpdate='T')) and (strSKUNameTotal<>'') then
      data.qryLocationIn.fieldbyname('SKUNAME').asString:=deleteJVHZ(strSKUNameTotal,50);
    if (data.qryLocationIn.fieldbyname('Quantitytasked').AsFloat=0) or
      (_TotalExistsUpdate='T') then
    begin
       data.qryLocationIn.fieldbyname('Quantitytasked').AsFloat:=QuantityTotalTask;
       data.qryLocationIn.fieldbyname('Quantity').AsFloat:=QuantityTotal;
    end;

    if (data.qryLocationIn.fieldbyname('PieceTasked').AsFloat=0) or
       (_TotalExistsUpdate='T') then
    begin
        data.qryLocationIn.fieldbyname('PieceTasked').AsFloat:=PieceTotalTask;
        data.qryLocationIn.fieldbyname('Piece').AsFloat:=PieceTotal;
    end;
    if blnQuantityLike then
    begin
      data.qryLocationIn.fieldbyname('QuantityUOM').asString:=strQuantityUOM;
    end else
    begin
      data.qryLocationIn.fieldbyname('QuantityUOM').asString:='';
    end;
    if (blnPieceLike) then
    begin
        data.qryLocationIn.fieldbyname('PieceUOM').asString:=strPieceUOM;
    end else
    begin
      data.qryLocationIn.fieldbyname('PieceUOM').asString:='';
    end;
    if (blnVolumeLike) then
    begin
        data.qryLocationIn.fieldbyname('Volume').asfloat:=VolumeTotal;
        data.qryLocationIn.fieldbyname('VolumeTasked').asfloat:=VolumeTotalTask;
        data.qryLocationIn.fieldbyname('VolumeUOM').asString:=strVolumeUOM;
    end else
    begin
      data.qryLocationIn.fieldbyname('Volume').asfloat:=0;
      data.qryLocationIn.fieldbyname('VolumeTasked').asfloat:=0;
      data.qryLocationIn.fieldbyname('VolumeUOM').asString:='';
    end;
    if (blnAreaLike)  then
    begin
        data.qryLocationIn.fieldbyname('Area').asfloat:=AreaTotal;
        data.qryLocationIn.fieldbyname('AreaTasked').asfloat:=AreaTotalTask;
        data.qryLocationIn.fieldbyname('AreaUOM').asString:=strAreaUOM;
    end else
    begin
      data.qryLocationIn.fieldbyname('AreaTasked').asfloat:=0;
      data.qryLocationIn.fieldbyname('Area').asfloat:=0;
      data.qryLocationIn.fieldbyname('AreaUOM').asString:='';
    end;
    if (blnWeightLike)   then
    begin
        data.qryLocationIn.fieldbyname('NetWeightTasked').asFloat:=NetWeightTotalTask;
        data.qryLocationIn.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
        data.qryLocationIn.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
        data.qryLocationIn.fieldbyname('GrossWeightTasked').asFloat:=GrossWeightTotalTask;
        data.qryLocationIn.fieldbyname('WeightUOM').asString:=strWeightUOM;
    end else
    begin
      data.qryLocationIn.fieldbyname('NetWeight').asFloat:=0;
      data.qryLocationIn.fieldbyname('GrossWeight').asFloat:=0;
      data.qryLocationIn.fieldbyname('NetWeightTasked').asFloat:=0;
      data.qryLocationIn.fieldbyname('GrossWeightTasked').asFloat:=0;
      data.qryLocationIn.fieldbyname('WeightUOM').asString:='';
    end;
    data.qryLocationIn.fieldbyname('SKUCost').asFloat:=CostTotal;
//out    data.qryLocationIn.fieldbyname('SKUCostIn').asFloat:=CostTotalin;
}
    blnTotaled:=True;
  end;
end;

procedure TfrmLocationIN.mitSplitClick(Sender: TObject);
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
    if ItemTaskEdit.Enabled then
    begin
      if (data.qryLocationin.FieldByName('VolumeTasked').AsFloat=0) and
         (data.qryLocationin.FieldByName('AreaTasked').AsFloat=0) and
         (data.qryLocationin.FieldByName('GrossWeightTasked').AsFloat=0) and
         (data.qryLocationin.FieldByName('NetWeightTasked').AsFloat=0) then exit;

      extVolume:=data.qryLocationin.FieldByName('VolumeTasked').AsFloat;
      extArea:=data.qryLocationin.FieldByName('AreaTasked').AsFloat;
      extGrossWeight:=data.qryLocationin.FieldByName('GrossWeightTasked').AsFloat;
      extNetWeight:=data.qryLocationin.FieldByName('NetWeightTasked').AsFloat;
      //取得数量合计
      data.qryLocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.eof do
      begin
        QuantityTotal   :=QuantityTotal+data.qryLocationinItem.fieldbyname('Quantitytask').AsFloat;
        data.qryLocationinItem.Next;
      end;
      LastSNO:=data.qryLocationinItem.fieldbyname('SNO').AsInteger;
      data.qryLocationinItem.First;
      data.qryLocationinItem.EnableControls;
      //数量拆分
      data.qryLocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.eof do
      begin
        data.qryLocationinItem.Edit;
        if extVolume<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('Volumetask').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantitytask').asFloat*extVolume/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('Volumetask').asfloat:=extVolume-VolumeTotal;
        if extArea<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('Areatask').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantitytask').asFloat*extArea/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('Areatask').asfloat:=extArea-AreaTotal;
        if extNetWeight<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('NetWeighttask').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantitytask').asFloat*extNetWeight/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('NetWeighttask').asfloat:=extNetWeight-NetWeightTotal;
        if extGrossWeight<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('GrossWeighttask').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantitytask').asFloat*extGrossWeight/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('GrossWeighttask').asfloat:=extGrossWeight-GrossWeightTotal;

        VolumeTotal     :=VolumeTotal+data.qryLocationinItem.fieldbyname('Volumetask').asfloat;
        AreaTotal       :=AreaTotal+data.qryLocationinItem.fieldbyname('Areatask').asfloat;
        NetWeightTotal  :=NetWeightTotal+data.qryLocationinItem.fieldbyname('NetWeighttask').asfloat;
        GrossWeightTotal:=GrossWeightTotal+data.qryLocationinItem.fieldbyname('GrossWeighttask').asfloat;

        data.qryLocationinItem.Next;
      end;
      data.qryLocationinItem.First;
      data.qryLocationinItem.EnableControls;
    end;
    if ItemDetailEdit.Enabled and not grdLocationINOUTItemReadOnly then  //实际商品
    begin
      if (data.qryLocationin.FieldByName('Volume').AsFloat=0) and
         (data.qryLocationin.FieldByName('Area').AsFloat=0) and
         (data.qryLocationin.FieldByName('GrossWeight').AsFloat=0) and
         (data.qryLocationin.FieldByName('NetWeight').AsFloat=0) then exit;

      extVolume:=data.qryLocationin.FieldByName('Volume').AsFloat;
      extArea:=data.qryLocationin.FieldByName('Area').AsFloat;
      extGrossWeight:=data.qryLocationin.FieldByName('GrossWeight').AsFloat;
      extNetWeight:=data.qryLocationin.FieldByName('NetWeight').AsFloat;
      //取得数量合计
      data.qryLocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.eof do
      begin
        QuantityTotal   :=QuantityTotal+data.qryLocationinItem.fieldbyname('Quantity').AsFloat;
        data.qryLocationinItem.Next;
      end;
      LastSNO:=data.qryLocationinItem.fieldbyname('SNO').AsInteger;
      data.qryLocationinItem.First;
      data.qryLocationinItem.EnableControls;
      //数量拆分
      data.qryLocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.eof do
      begin
        data.qryLocationinItem.Edit;
        if extVolume<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('Volume').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('Volume').asfloat:=extVolume-VolumeTotal;
        if extArea<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('Area').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantity').asFloat*extArea/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('Area').asfloat:=extArea-AreaTotal;
        if extNetWeight<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('NetWeight').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantity').asFloat*extNetWeight/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('NetWeight').asfloat:=extNetWeight-NetWeightTotal;
        if extGrossWeight<>0 then
          if data.qryLocationinItem.fieldbyname('SNO').asfloat<>LastSNO then
            data.qryLocationinItem.fieldbyname('GrossWeight').asfloat:=kround(data.qryLocationinItem.fieldbyname('Quantity').asFloat*extVolume/QuantityTotal,4)
          else
            data.qryLocationinItem.fieldbyname('GrossWeight').asfloat:=extGrossWeight-GrossWeightTotal;

        VolumeTotal     :=VolumeTotal+data.qryLocationinItem.fieldbyname('Volume').asfloat;
        AreaTotal       :=AreaTotal+data.qryLocationinItem.fieldbyname('Area').asfloat;
        NetWeightTotal  :=NetWeightTotal+data.qryLocationinItem.fieldbyname('NetWeight').asfloat;
        GrossWeightTotal:=GrossWeightTotal+data.qryLocationinItem.fieldbyname('GrossWeight').asfloat;

        data.qryLocationinItem.Next;
      end;
      data.qryLocationinItem.First;
      data.qryLocationinItem.EnableControls;
    end;
  end;
end;

procedure TfrmLocationIN.edtCostCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostCus.Text='' then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('costcusid').AsString:='';
         data.qryLocationIn.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtCostCus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            //lzw20090512
            if (_strSysCus='SWZ') or (_strSysCus='SHRL') then
            begin
               data.qryLocationIn.FieldByName('mincostin').AsString  :=qrySelect.FieldByName('mincostin').asstring;
            end;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
      if edtCostCus.Text<>'' then
         InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+edtCostCus.TextField+'"');
   end;
end;

procedure TfrmLocationIN.mitDetail_OUTClick(Sender: TObject);
begin
  workLocationOUTSelect(
                        data.qryLocationINDetail.FieldByName('Jobno').AsString,strFlow,
                        True,
                        data.qryLocationINDetail.FieldByName('SNO').AsInteger,
                        data.qryLocationINDetail.FieldByName('ldsno').AsInteger);

end;

procedure TfrmLocationIN.mitItem_OUTClick(Sender: TObject);
begin
  workLocationOUTSelect(
                        data.qryLocationinItem.FieldByName('Jobno').AsString,strFlow,
                        False,
                        data.qryLocationinItem.FieldByName('SNO').AsInteger,
                        0);
end;

procedure TfrmLocationIN.edtSNOEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmLocationIN.edtCost_SNOEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmLocationIN.edtCostCusEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
     TdxDBButtonEdit(sender).DirectInput:=True;
     strOldCostCus:=edtCostCus.Text;
  end;
end;

function TfrmLocationIN.CompareTaskItem(pstrType:string):Boolean;
//比较任务与实际，返回值表示是否一致
//pstrType:  操作类型  LA比较实际的数量不得大于任务数量
//                     VA将实际数量赋予任务数量
//                     EQ比较实际数量与任务数量是否一致
begin
  Result:=False;
  data.qryLocationinItem.DisableControls;
  data.qryLocationinItem.first;
  while not data.qryLocationinItem.eof do
  begin
    if pstrType='LA' then
    begin
      if data.qryLocationinItem.FieldByName('Quantity').AsFloat>data.qryLocationinItem.FieldByName('Quantitytask').AsFloat then
      begin
//        kMessageDlg('商品实际数量不得大于任务数量!', mtWarning, [mbOK], 0);
        if pgcLocationINOUT.activepage<>tbsSKU
        then pgcLocationINOUT.activepage:=tbsSKU;
        grdLocationINItem.setfocus;
        data.qryLocationinItem.EnableControls;
        exit;
      end;
    end else
    if pstrType='VA' then
    begin
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.fieldbyname('Quantitytask').AsFloat :=data.qryLocationinItem.fieldbyname('Quantity').AsFloat ;
      data.qryLocationinItem.fieldbyname('Piecetask').AsFloat    :=data.qryLocationinItem.fieldbyname('Piece').AsFloat    ;
      data.qryLocationinItem.fieldbyname('Volumetask').asfloat     :=data.qryLocationinItem.fieldbyname('Volume').asfloat     ;
      data.qryLocationinItem.fieldbyname('Areatask').asfloat       :=data.qryLocationinItem.fieldbyname('Area').asfloat       ;
      data.qryLocationinItem.fieldbyname('NetWeighttask').asfloat  :=data.qryLocationinItem.fieldbyname('NetWeight').asfloat  ;
      data.qryLocationinItem.fieldbyname('GrossWeighttask').asfloat:=data.qryLocationinItem.fieldbyname('GrossWeight').asfloat;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('QuantitySL').AsFloat:=0;
    end else
    if pstrType='EQ' then
    begin
      if data.qryLocationinItem.FieldByName('Quantity').AsFloat<>data.qryLocationinItem.FieldByName('Quantitytask').AsFloat then
      begin
//        kMessageDlg('商品实际数量不等于任务数量!', mtWarning, [mbOK], 0);
        if pgcLocationINOUT.activepage<>tbsSKU
        then pgcLocationINOUT.activepage:=tbsSKU;
        grdLocationINItem.setfocus;
        data.qryLocationinItem.EnableControls;
        exit;
      end;
    end;
    data.qryLocationinItem.Next;
  end;
  data.qryLocationinItem.First;
  data.qryLocationinItem.EnableControls;
  Result:=True;
end;


procedure TfrmLocationIN.mitQuantityRemainClick(Sender: TObject);
begin
   opensql(datatmp.qrytmp,'select itemin.quantity,itemin.piece,'
                 +'       quantityremainorder=itemin.quantity-isnull(itemin.quantitydoorder,0), '
                 +'       quantityremaintask=itemin.quantity-isnull(itemin.quantitydotask,0),'
                 +'       quantityremain=itemin.quantity-isnull(itemin.quantitydo,0), '
                 +'       pieceremain=isnull(itemin.piece,0)-(isnull(itemin.piecedo,0)) '
                 +'  from locationinitem itemin (nolock) '
                 +' where itemin.jobno="'+data.qrylocationinitem.fieldbyname('jobno').asstring+'"'
                 +'   and itemin.sno='+inttostr(data.qrylocationinitem.fieldbyname('sno').asinteger)
                 );
   kMessageDlg(GetMessage('frmLocationIN','029')+FloatToStr(datatmp.qryTmp.fieldbyname('Quantity').AsFloat)+';'+GetMessage('frmLocationIN','030')+FloatToStr(datatmp.qryTmp.fieldbyname('Piece').AsFloat)+chr(13)
              +GetMessage('frmLocationIN','031')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemainOrder').AsFloat)+','+chr(13)
              +GetMessage('frmLocationIN','032')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemainTask').AsFloat)+','+chr(13)
              +GetMessage('frmLocationIN','033')+FloatToStr(datatmp.qryTmp.fieldbyname('QuantityRemain').AsFloat)+','+chr(13)
              +GetMessage('frmLocationIN','034')+FloatToStr(datatmp.qryTmp.fieldbyname('PieceRemain').AsFloat), mtInformation, [mbOK], 0);
   //'29该商品的到货数量为''30到货件数为''31     指令剩余数量为' '32任务剩余数量为''33库存剩余数量为''34库存剩余件数为'
end;

procedure TfrmLocationIN.btnOperClick(Sender: TObject);
var
  GetLocation:TGetLocation;
  blnAuto:Boolean;
begin
// Added by cyh 2009.03.04 16:24:00
   if (strSysCus='SWZ') and (data.qryLocationInDetail.RecordCount=0) then
   begin
      OpenSql(datatmp.qryTmp,'select 1 from contract (nolock)    '+chr(13)+chr(10)
                            +' where signcusid="'+data.qryLocationin.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
//                            +'   and isnull(Signed,"F")="T" '
                            +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
      if datatmp.qryTmp.RecordCount=0 then
      begin
         kMessageDlg('该客户合同还未签订,不能执行上架操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   //lzw20110615
   if _strsyscus='XSWL' then
   begin
      if data.qryLocationIn.FieldByName('taskcheckname').asstring='' then
      begin
         kMessageDlg('该笔未复核,不能执行上架操作!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;


   if (data.qryLocationin.FieldByName('OperationName').AsString='')
     and (data.qryLocationinItem.FieldByName('Jobno').AsString='') then
   begin
     { if _Language='CAPTIONC' then _strmessage:='任务商品资料不完整,不能执行该操作!'
      else _strmessage:='任务商品资料不完整,不能执行该操作!'; }
      kMessageDlg(GetMessage('frmLocationIN','035'), mtWarning, [mbOK], 0);
      exit;
   end;

   if (data.qryLocationin.FieldByName('OperationName').AsString<>'SYSTEM') and (_canmodifyother<>'T') then
   begin
      if (data.qryLocationin.FieldByName('OperationName').AsString<>_LoginName) and
         (data.qrylocationin.fieldbyname('OperationName').AsString<>'') then
      begin
         {if _Language='CAPTIONC' then _strmessage:='上架资料不是由您录入的,不能执行该操作!'
         else _strmessage:='上架资料不是由您录入的,不能执行该操作!'; }
         kMessageDlg(GetMessage('frmLocationIN','036'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   Present:=GetServerDate;
   if (Sender=mitOper) and (_mullocid=False) then
   begin
     if Copy(strTraySkuClassid,Length(strTraySkuClassid),1)=',' then
        strTraySkuClassid:=Copy(strTraySkuClassid,0,Length(strTraySkuClassid)-1);

     if  not _automatism  then
     begin
        //lzw2011
        GetLocation:=workGetLocation('',strTraySkuClassid);
        strDetailLocationID:=GetLocation.LocationID;
        strDetailLocationName:=GetLocation.LocationName;
        Present:=iif(GetLocation.ROperationDate=0,Present,GetLocation.ROperationDate);
        blnAuto:=GetLocation.IsTray;   //是否推荐仓位方式
        blnTray:=GetLocation.IsBingo;  //推荐是否成功
        if not GetLocation.OkFlag then exit;
     end else
     begin
     //   GetLocation:=workGetLocation('',strTraySkuClassid);
        strDetailLocationID:=_locid;
        strDetailLocationName:=_locname;
        Present:=data.qryLocationIn.fieldbyname('TaskDate').AsDateTime;
        blnAuto:=false;   //是否推荐仓位方式
        blnTray:=false;  //推荐是否成功
     end;
   end;
//add by whl 05.04.01
   grdLocationOutDetailReadOnly  :=False;
   mitAddLocationINOUTDetail.enabled:=True;
   btnAddLocationINOUTDetail.enabled:=True;
   mitDelLocationINOUTDetail.enabled:=True;
   btnDelLocationINOUTDetail.Enabled:=True;

   if pgcLocationINOUT.ActivePage<>tbsSKU then pgcLocationINOUT.ActivePage:=tbsSKU;

   if (Sender=mitOper) and (not blnAuto) and (_mullocid=False) then     //非托盘上架
   begin
      data.qrylocationindetail.DisableControls;
      data.qrylocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.Eof do
      begin
         grdLocationINItemChangeNodeEx(nil);
         if data.qryLocationInDetail.IsEmpty then
         begin
            GetLocationSKU;
         end;
         if _StrSysCus<>'SHRL' then
         begin
            data.qryLocationInItem.Edit;
            data.qryLocationInItem.FieldByName('locid').AsString:=strDetailLocationID;
            data.qryLocationInItem.FieldByName('locname').AsString:=strDetailLocationName;
         end;
         data.qrylocationinitem.next;
      end;
      data.qrylocationinItem.EnableControls;
      data.qrylocationindetail.EnableControls;
   end;

   if (Sender=mitOper) and (not blnAuto) and (_mullocid=True) then     //成批获取仓位上架
   begin
      data.qrylocationindetail.DisableControls;
      data.qrylocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.Eof do
      begin
         grdLocationINItemChangeNodeEx(nil);
         if data.qryLocationInDetail.IsEmpty then
         begin
            Getmullocid;
         end;
         data.qrylocationinitem.next;
      end;
      data.qrylocationinItem.EnableControls;
      data.qrylocationindetail.EnableControls;
   end;

   if (Sender=mitOper) and (blnAuto) then     //非托盘上架
   begin
      data.qrylocationinItem.DisableControls;
      data.qryLocationinItem.first;
      while not data.qryLocationinItem.Eof do
      begin
         data.qryLocationInItem.Edit;
         data.qryLocationInItem.FieldByName('locid').AsString:=strDetailLocationID;
         data.qryLocationInItem.FieldByName('locname').AsString:=strDetailLocationName;
         data.qrylocationinitem.next;
      end;
      data.qrylocationinItem.EnableControls;
   end;

   //直接上架/直接出货
   if (data.qryLocationin.FieldByName('OperationName').AsString='') then
   begin
      if data.qryLocationinItem.fieldbyname('SKUID').asstring<>'' then
      begin
         data.qryLocationin.Edit;
         data.qryLocationin.FieldByName('OperationName').AsString:=_LoginName;
         data.qryLocationin.FieldByName('OperationDate').AsDateTime  :=Present;
      end;
   end;
   if dtdOperationDate.Date=0 then
      data.qryLocationin.FieldByName('OperationDate').AsDateTime:=Present;
   if strSysCus='WYFQ' then   
      data.qryLocationin.FieldByName('carrierdate').AsDateTime:=Present;
   grdLocationOutDetailReadOnly:=False;
//  mitAddLocationINOUTDetail.Enabled:=True;
//  mitDelLocationINOUTDetail.Enabled:=True;
   dtdOperationDate.Enabled:=True;
   timOperationDate.Enabled:=True;
end;

procedure TfrmLocationIN.grdLocationINCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;
   {if ANode.Values[taskisComplete.Index]='T' then
      AColor :=$00E7E1E8  }

   if (ANode.Values[PieceTasked.Index]<>null) and  (_strsyscus='LHJM')and
           ((ANode.Values[Piece.Index]<>null) and (ANode.Values[Piece.Index]<>0)) and
           (ANode.Values[PieceTasked.Index]<>ANode.Values[Piece.Index])
            then
     AFont.Color :=CLRED;
   //lzw20110616
   if (trim(ANode.Values[OPERATIONNAME.Index])='') and (_strsyscus<>'XSWL') then
   begin
      AColor := clInfoBk;
   end else //防止旧数据影响.旧数据已审但任务无审
   if (trim(ANode.Values[taskcheckname.Index])='') and (trim(ANode.Values[checkname.Index])='') then
   begin
      AColor := clSilver;
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
end;

procedure TfrmLocationIN.mitSkuDetailItemClick(Sender: TObject);
begin
   if (data.qryLocationinItem.FieldByName('SKUID').AsString='') then
   begin
     kMessageDlg(GetMessage('frmLocationIN','037'), mtInformation, [mbOK], 0);//'请先挑选概要商品!!!'
     exit;
   end;

   if data.qryLocInSkuDetail.Active<>True then
   begin
      data.qryLocInSkuDetail.ParamByName('jobno').AsString:=data.qryLocationIn.fieldByName('jobno').AsString;
      data.qryLocInSkuDetail.Open;
   end;

   if DataState=stedit then
   begin
      _maxgridno:=0;
      data.qrylocinskudetail.First;
      while not data.qrylocinskudetail.Eof do
      begin
         if data.qrylocinskudetail.FieldByName('detailsno').AsInteger>_maxgridno
         then _maxgridno:=data.qrylocinskudetail.FieldByName('detailsno').AsInteger;
         data.qrylocinskudetail.Next;
      end;
   end;

   //防止未离开马上编辑商品明细，sno未来得及改变导致sno=-1
   if data.qryLocationinItem.FieldByName('sno').AsInteger<0 then
      data.qryLocationinItem.Post;

   data.qryLocInSkuDetail.Filtered:=false;
   if data.qryLocationInItem.fieldbyname('sno').AsString<>'' then
      data.qryLocInSkuDetail.filter:='sno='+data.qryLocationInItem.fieldbyname('sno').AsString
   else
      data.qryLocInSkuDetail.filter:='sno=-1';
   data.qryLocInSkuDetail.Filtered:=true;

   with workLIOSKUDetail(datastate,
                  data.qryLocationinItem.FieldByName('jobno').AsString,data.qryLocationinItem.FieldByName('sno').AsInteger,
                  data.qryLocationinItem.FieldByName('skuid').AsString,data.qryLocationinItem.FieldByName('skuname').AsString,'lioskudetail',
                 1,'F',data.qryLocationinItem.FieldByName('jobnoin').AsString,data.qryLocationinItem.FieldByName('jobnoorder').AsString,
                 data.qryLocationinItem.FieldByName('snoin').asinteger,data.qryLocationinItem.FieldByName('snoorder').asinteger,
                 data.qrylocationinitem
                ) do
   begin
      if DataState in Setdcs then
      if OKflag=True then
      begin
         data.qryLocationinItem.edit;
         data.qryLocationinItem.FieldByName('quantitytask').AsFloat:=quantity;
         data.qryLocationinItem.FieldByName('piecetask').AsFloat:=piece;
         data.qryLocationinItem.FieldByName('areatask').AsFloat:=area;
         data.qryLocationinItem.FieldByName('volumetask').AsFloat:=volume;
         data.qryLocationinItem.FieldByName('grossweighttask').AsFloat:=grossweight;
         data.qryLocationinItem.FieldByName('netweighttask').AsFloat:=netweight;
         if  data.qryLocationinItem.FieldByName('costuomtype').AsString<>'' then
         begin
            if UpperCase(data.qryLocationinItem.FieldByName('costuomtype').AsString)='SNO' then
            begin
               data.qryLocationinItem.FieldByName('carriagetotal').AsFloat :=data.qryLocationinItem.FieldByName('carriage').AsFloat;
               data.qryLocationinItem.FieldByName('insurancetotal').AsFloat :=data.qryLocationinItem.FieldByName('insurance').AsFloat;
               data.qryLocationinItem.FieldByName('skucost').AsFloat :=data.qryLocationinItem.FieldByName('price').AsFloat;
            end else
            begin
               data.qryLocationinItem.FieldByName('carriagetotal').AsFloat :=
                     data.qryLocationinItem.FieldByName(data.qryLocationinItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                     data.qryLocationinItem.FieldByName('carriage').AsFloat;
               data.qryLocationinItem.FieldByName('insurancetotal').AsFloat :=
                     data.qryLocationinItem.FieldByName(data.qryLocationinItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                     data.qryLocationinItem.FieldByName('insurance').AsFloat;
               data.qryLocationinItem.FieldByName('skucost').AsFloat :=
                     data.qryLocationinItem.FieldByName(data.qryLocationinItem.FieldByName('costuomtype').AsString+'task').AsFloat*
                     data.qryLocationinItem.FieldByName('price').AsFloat;
            end;
         end;
      end;
   end;
//   btnRefresh.Click;
end;

procedure TfrmLocationIN.edtCostCusExit(Sender: TObject);
begin
   blnSelect:=False;
   if (DataState in Setdcs) and (strOldCostCus<>edtCostCus.Text) then
   begin
      GetCusCnfg;
   end;
end;

procedure TfrmLocationIN.mitINCOWorkClick(Sender: TObject);
var
  strAccount_LoadGroup,strAccount_LoadGroupName,
  strAccount_ForkGroup,strAccount_ForkGroupName,
  strAccount_LiftMachine,strAccount_LiftMachineName:String;
begin
  if KmessageDlg(GetMessage('frmLocationIN','038'),//'是否用本笔记录的装卸队，叉车，吊机替换其他记录？'
                  mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      strAccount_LoadGroup      :=data.qryLocationinItem.fieldbyname('loadgroupcusid').AsString;
      strAccount_LoadGroupName  :=data.qryLocationinItem.fieldbyname('loadgroupcusname').AsString;
      strAccount_ForkGroup      :=data.qryLocationinItem.fieldbyname('forkgroupcusid').AsString;
      strAccount_ForkGroupName  :=data.qryLocationinItem.fieldbyname('forkgroupcusname').AsString;
      strAccount_LiftMachine    :=data.qryLocationinItem.fieldbyname('liftmachinecusid').AsString;
      strAccount_LiftMachineName:=data.qryLocationinItem.fieldbyname('liftmachinecusname').AsString;
      data.qryLocationinItem.First;
      while not data.qryLocationinItem.Eof do
      begin
        data.qryLocationinItem.Edit;
        data.qryLocationinItem.fieldbyname('loadgroupcusid').AsString:=strAccount_LoadGroup;
        data.qryLocationinItem.fieldbyname('loadgroupcusname').AsString:=strAccount_LoadGroupName;
        data.qryLocationinItem.fieldbyname('forkgroupcusid').AsString:=strAccount_ForkGroup;
        data.qryLocationinItem.fieldbyname('forkgroupcusname').AsString:=strAccount_ForkGroupName;
        data.qryLocationinItem.fieldbyname('liftmachinecusid').AsString:=strAccount_LiftMachine;
        data.qryLocationinItem.fieldbyname('liftmachinecusname').AsString:=strAccount_LiftMachineName;
        data.qryLocationinItem.Next;
      end;
    end;
end;

function TfrmLocationIN.FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
begin
{
   Result := '';
   case pField of
    //寄仓单位
      18:
          if pValue <> ''
            then Result:=''
                        +'  exists ( select 1 from locationinitem Task(nolock)    '
                        +'            where Task.jobno=INOUT.jobno               '
                        +'              and Task.shippercusid="'+pValue+'" ) '
          else if pValue = '' then Result:=' 1=1';
   end;
}
end;

procedure TfrmLocationIN.GetLocationSKU;
//var
//  acontrol: TWinControl;
begin
   data.qryLocationinDetail.Append;
   if grdLocationINDetail.FocusedNode=nil then
   begin
      maxLocationINDetail:=maxLocationINDetail+1;
      data.qryLocationinDetail.Fieldbyname('ldSNO').asInteger:=maxLocationINDetail;
   end;
//       data.qryLocationinDetail.Fieldbyname('JOBNOorder').asString :=data.qryLocationinItem.Fieldbyname('JOBNOorder').asString;
   data.qryLocationinDetail.Fieldbyname('SNOorder').asInteger :=data.qryLocationinItem.Fieldbyname('SNOorder').asInteger;
   data.qryLocationinDetail.Fieldbyname('TagTotal').asInteger        :=data.qryLocationinItem.Fieldbyname('TagTotal').asInteger;

   if (_StrSysCus='SHRL') and (data.qryLocationInItem.Fieldbyname('locid').asstring<>'') then
   begin
      data.qryLocationinDetail.Fieldbyname('locid').asstring:=data.qryLocationInItem.Fieldbyname('locid').asstring;
      data.qryLocationinDetail.Fieldbyname('locname').asstring:=data.qryLocationInItem.Fieldbyname('locname').asstring;
   end else
   begin
      data.qryLocationinDetail.Fieldbyname('locid').asstring:=strDetailLocationID;
      data.qryLocationinDetail.Fieldbyname('locname').asstring:=strDetailLocationname;
   end;

   data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=present;
//       data.qryLocationinDetail.fieldByname('userid').AsString:=data.qryLocationinItem.fieldbyname('userid').AsString;
   data.qryLocationinDetail.fieldbyname('ldsno').Asinteger:=maxLocationINDetail;
   data.qryLocationinDetail.fieldByname('jobno').AsString:=data.qryLocationin.fieldbyname('jobno').AsString;
   data.qryLocationinDetail.FieldByName('SNO').AsInteger:=data.qryLocationinItem.fieldbyname('SNO').AsInteger;
   data.qryLocationinDetail.fieldbyname('OPERATIONTYPE').Asinteger:=1;
   data.qryLocationinDetail.Fieldbyname('PiecePro').asFloat      :=data.qryLocationinItem.Fieldbyname('PiecePro').asFloat;
   data.qryLocationinDetail.Fieldbyname('VolumePro').asFloat     :=data.qryLocationinItem.Fieldbyname('VolumePro').asFloat;
   data.qryLocationinDetail.fieldbyname('NetWeightPro').asFloat  :=data.qryLocationinItem.Fieldbyname('NetWeightPro').asFloat;
   data.qryLocationinDetail.fieldbyname('GrossWeightPro').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeightPro').asFloat;
   data.qryLocationinDetail.fieldbyname('AreaPro').asFloat       :=data.qryLocationinItem.Fieldbyname('AreaPro').asFloat;

   data.qryLocationinDetail.Fieldbyname('Quantity').AsFloat   :=data.qryLocationinItem.Fieldbyname('Quantitytask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Piece').AsFloat      :=data.qryLocationinItem.Fieldbyname('Piecetask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Volume').asFloat     :=data.qryLocationinItem.Fieldbyname('Volumetask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Area').asFloat       :=data.qryLocationinItem.Fieldbyname('Areatask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('NetWeight').asFloat  :=data.qryLocationinItem.Fieldbyname('NetWeighttask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('GrossWeight').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeighttask').AsFloat;

   if data.qryLocationinItem.fieldbyname('ManufactureDate').asDateTime=0 then
      data.qryLocationinDetail.fieldbyname('ManufactureDate').Clear
   else
      data.qryLocationinDetail.fieldbyname('ManufactureDate').asDateTime:=data.qryLocationinItem.fieldbyname('ManufactureDate').asDateTime ;
   //lzw 20081205
   data.qryLocationinDetail.Fieldbyname('manudatestring').asstring        :=data.qryLocationinItem.FieldByName('manudatestring').asstring;

   data.qryLocationinDetail.Fieldbyname('UOM1').asstring        :=data.qryLocationinItem.FieldByName('UOM1').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM2').asstring        :=data.qryLocationinItem.FieldByName('UOM2').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM3').asstring        :=data.qryLocationinItem.FieldByName('UOM3').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM4').asstring        :=data.qryLocationinItem.FieldByName('UOM4').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM5').asstring        :=data.qryLocationinItem.FieldByName('UOM5').asstring;
   data.qryLocationinDetail.Fieldbyname('pro1').asFloat   :=data.qryLocationinItem.Fieldbyname('pro1').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro2').asFloat   :=data.qryLocationinItem.Fieldbyname('pro2').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro3').asFloat   :=data.qryLocationinItem.Fieldbyname('pro3').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro4').asFloat   :=data.qryLocationinItem.Fieldbyname('pro4').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro5').asFloat   :=data.qryLocationinItem.Fieldbyname('pro5').asFloat;
   data.qryLocationinDetail.Fieldbyname('Casing1').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing1task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing2').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing2task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing3').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing3task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing4').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing4task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing5').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing5task').AsFloat;

   data.qryLocationinDetail.fieldbyname('SKUID').asstring               :=data.qryLocationinItem.FieldByName('SKUID').asstring;
   data.qryLocationinDetail.fieldbyname('SKUname').asstring               :=data.qryLocationinItem.FieldByName('SKUname').asstring;
//   lzw 20090319
//   if (strSysCus='SWZ') or (strSysCus='SHRL') then
//   begin
//      data.qryLocationinDetail.fieldbyname('skuspec').asstring               :=data.qryLocationinItem.FieldByName('skuspec').asstring;
//      data.qryLocationinDetail.fieldbyname('skumodel').asstring               :=data.qryLocationinItem.FieldByName('skumodel').asstring;
//      data.qryLocationinDetail.fieldbyname('customerno').asstring               :=data.qryLocationinItem.FieldByName('customerno').asstring;
//   end;
//   if strSysCus='WYFQ' then
//   begin
//      data.qryLocationinDetail.fieldbyname('skuspec').asstring               :=data.qryLocationinItem.FieldByName('skuspec').asstring;
//      data.qryLocationinDetail.fieldbyname('skumodel').asstring               :=data.qryLocationinItem.FieldByName('skumodel').asstring;
//   end;
//
   //cyh
   data.qryLocationinDetail.fieldbyname('skuspec').asstring               :=data.qryLocationinItem.FieldByName('skuspec').asstring;
   data.qryLocationinDetail.fieldbyname('skumodel').asstring               :=data.qryLocationinItem.FieldByName('skumodel').asstring;
   data.qryLocationinDetail.fieldbyname('customerno').asstring               :=data.qryLocationinItem.FieldByName('customerno').asstring;


   data.qryLocationinDetail.Fieldbyname('corpno').asstring              :=data.qryLocationinItem.FieldByName('corpno').asstring;
   data.qryLocationinDetail.Fieldbyname('LotCode').asstring             :=data.qryLocationinItem.FieldByName('LotCode').asstring;
   data.qryLocationinDetail.fieldbyname('QualityName').asstring         :=data.qryLocationinItem.FieldByName('QualityName').asstring;
   data.qryLocationinDetail.fieldbyname('Quantityuom').asstring         :=data.qryLocationinItem.FieldByName('Quantityuom').asstring;
   data.qryLocationinDetail.fieldbyname('PieceUOM').asstring            :=data.qryLocationinItem.FieldByName('PieceUOM').asstring;
   data.qryLocationinDetail.fieldbyname('WeightUOM').asstring           :=data.qryLocationinItem.FieldByName('WeightUOM').asstring;
   data.qryLocationinDetail.fieldbyname('VolumeUOM').asstring           :=data.qryLocationinItem.FieldByName('VolumeUOM').asstring;
   data.qryLocationinDetail.Fieldbyname('AreaUOM').asstring             :=data.qryLocationinItem.FieldByName('AreaUOM').asstring;
   data.qryLocationinDetail.fieldbyname('cusid').asstring           :=data.qryLocationinItem.FieldByName('cusid').asstring;
   data.qryLocationinDetail.Fieldbyname('Shippercusid').asstring    :=data.qryLocationinItem.FieldByName('Shippercusid').asstring;
   data.qryLocationinDetail.fieldbyname('LotTracked').asstring       :=data.qryLocationinItem.FieldByName('LotTracked').asstring;
   data.qryLocationinDetail.fieldbyname('price').asFloat             :=data.qryLocationinItem.FieldByName('price').AsFloat;
   data.qryLocationinDetail.fieldbyname('currcd').asString           :=data.qryLocationinItem.FieldByName('currcd').asstring;
   data.qryLocationinDetail.fieldbyname('SKUCost').asFloat        :=data.qryLocationinItem.FieldByName('SKUCost').AsFloat;
   data.qryLocationinDetail.fieldbyname('pricein').asFloat             :=data.qryLocationinItem.FieldByName('pricein').AsFloat;
   data.qryLocationinDetail.fieldbyname('SKUCostIn').asFloat        :=data.qryLocationinItem.FieldByName('SKUCostIn').AsFloat;
   data.qryLocationinDetail.fieldbyname('TagEach').asstring          :=data.qryLocationinItem.FieldByName('TagEach').asstring;
   data.qryLocationinDetail.fieldbyname('TagEachUOM').asstring          :=data.qryLocationinItem.FieldByName('TagEachUOM').asstring;
   data.qryLocationinDetail.fieldbyname('TagTotal').asFloat             :=data.qryLocationinItem.FieldByName('TagTotal').AsFloat;
   if getSysdata('qdtext')<>'T' then
      data.qryLocationinDetail.fieldbyname('TagNO').asString               :='';                                  
   if _StrSysCus='JG' then
       data.qryLocationinDetail.fieldbyname('SerialNO').asString            :=data.qryLocationinItem.FieldByName('serialno').asstring
   else data.qryLocationinDetail.fieldbyname('SerialNO').asString            :=data.qryLocationinItem.FieldByName('customerno').asstring;
   data.qryLocationinDetail.fieldbyname('LDSNOINF').asInteger        :=data.qryLocationinDetail.FieldByName('LdSno').asInteger;
   data.qryLocationinDetail.fieldbyname('JobnoINF').asstring          :=data.qryLocationinItem.FieldByName('JobnoINF').asstring;
   data.qryLocationinDetail.fieldbyname('SNOINF').asInteger           :=data.qryLocationinItem.FieldByName('SNOINF').AsInteger;
   data.qryLocationinDetail.fieldbyname('isbond').asstring:=data.qryLocationinItem.FieldByName('isbond').asstring;
//       data.qryLocationinDetail.fieldbyname('COUNTRENT').asstring        :=data.qryLocationinItem.FieldByName('COUNTRENT').asstring;
//       data.qryLocationinDetail.fieldbyname('COUNTCONTCOST').asstring    :=data.qryLocationinItem.FieldByName('COUNTCONTCOST').asstring;
//       data.qryLocationinDetail.fieldbyname('WareRentCountType').asstring   :=data.qryLocationinItem.FieldByName('WareRentCountType').asstring;
   data.qryLocationinDetail.Fieldbyname('CustomsNO').asString           :=data.qryLocationinItem.FieldByName('CustomsNO').asstring;
   data.qryLocationinDetail.fieldbyname('LocationBillNO').asstring      :=data.qryLocationinItem.FieldByName('LocationBillNO').asstring;
   data.qryLocationinDetail.fieldbyname('costcusid').asstring :=data.qryLocationinItem.FieldByName('costcusid').asstring;
   data.qryLocationinDetail.fieldbyname('NotFullSign').asstring         :=data.qryLocationinItem.FieldByName('NotFullSign').asstring;
   data.qryLocationinDetail.fieldbyname('costuomtype').asstring         :=data.qryLocationinItem.FieldByName('costuomtype').asstring;
   data.qryLocationinDetail.fieldbyname('costquantity').asstring        :=data.qryLocationinItem.FieldByName('costquantitytask').asstring;
   data.qryLocationinDetail.fieldbyname('costquantityuom').asstring     :=data.qryLocationinItem.FieldByName('costquantityuom').asstring;
   //威扬
   data.qryLocationinDetail.fieldbyname('quantityshort').AsFloat        :=data.qryLocationinItem.FieldByName('quantityshort').AsFloat;
   data.qryLocationinDetail.fieldbyname('remark').AsString              :=data.qryLocationinItem.FieldByName('remark').AsString;
   try
     data.qryLocationinDetail.Post;
   except
     exit;
   end;
//ine
end;

procedure TfrmLocationIN.mitUpdateMainClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  _operationtype:=data.qryLocationIn.fieldbyname('operationtype').AsInteger;
  if (_LoginID<>'SYSTEM') then
  begin
    KmessageDlg(GetMessage('frmLocationIN','039'),mtInformation,[mbOK],0);//'你无权修改业务资料!'
    exit;
  end;
  if (data.qryLocationIn.FieldByName('OPERATIONNAME').AsString='') then
  begin
    KmessageDlg(GetMessage('frmLocationIN','040'),mtInformation,[mbOK],0);//'还未实际发生库存，无需用这种修改方式!'
    exit;
  end;
  if (data.qryLocationIn.FieldByName('checkname').AsString<>'') or
     (data.qryLocationIn.FieldByName('CountName').AsString<>'') then
  begin
    if Kmessagedlg(GetMessage('frmLocationIN','041'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该笔业务数据已经审核，确认要修改业务资料吗？'
    begin
      if WorkUpDateMain(data.qryLocationIn.FieldByName('Jobno').AsString,True) then
         btnRefreshClick(self);
    end;
  end;
end;

procedure TfrmLocationIN.mitTotalDetailClick(Sender: TObject);
var
   fltQuantity,fltPiece,fltVolume,fltArea,fltGrossWeight,fltNetWeight:Extended;
begin
  { if _Language='CAPTIONC' then _strmessage:='是否用本记录的具体仓位信息中的合并资料，替换本记录的资料？'
   else _strmessage:='是否用本记录的具体仓位信息中的合并资料，替换本记录的资料？';}
   if KmessageDlg(GetMessage('frmLocationIN','042'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      fltQuantity:=0;
      fltPiece:=0;
      fltVolume:=0;
      fltArea:=0;
      fltGrossWeight:=0;
      fltNetWeight:=0;
      data.qryLocationinDetail.First;
      while not data.qryLocationinDetail.Eof do
      begin
         fltQuantity:=fltQuantity+data.qryLocationinDetail.fieldbyname('Quantity').AsFloat;
         fltPiece:=fltPiece+data.qryLocationinDetail.fieldbyname('Piece').AsFloat;
         fltVolume:=fltVolume+data.qryLocationinDetail.fieldbyname('Volume').AsFloat;
         fltArea:=fltArea+data.qryLocationinDetail.fieldbyname('Area').AsFloat;
         fltGrossWeight:=fltGrossWeight+data.qryLocationinDetail.fieldbyname('GrossWeight').AsFloat;
         fltNetWeight:=fltNetWeight+data.qryLocationinDetail.fieldbyname('NetWeight').AsFloat;
         data.qryLocationinDetail.Next;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.fieldbyname('Quantity').AsFloat:=fltQuantity;
      data.qryLocationinItem.fieldbyname('Piece').AsFloat:=fltPiece;
      data.qryLocationinItem.fieldbyname('Volume').AsFloat:=fltVolume;
      data.qryLocationinItem.fieldbyname('Area').AsFloat:=fltArea;
      data.qryLocationinItem.fieldbyname('GrossWeight').AsFloat:=fltGrossWeight;
      data.qryLocationinItem.fieldbyname('NetWeight').AsFloat:=fltNetWeight;
      data.qryLocationinDetail.First;
   end;
end;

procedure TfrmLocationIN.edtFC_PORTDCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationIn.FieldByName('portd').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.edtFC_TRANSCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationIn.FieldByName('TRANS').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.edtFC_PORTLCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationIn.FieldByName('portl').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.dtdAccountBillNOExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (DataState in Setdcs) and (_DB_CHK_AccountBillno='T') then
   begin
      OpenSql(datatmp.qryTmp,'select num=count(1) from locationin(nolock) '
                    +' where cusbillno="'+trim(dtdAccountBillNO.Text)+'" ');
      if datatmp.qryTmp.FieldByName('num').AsInteger<>0 then
      begin
        dtdAccountBillNO.SetFocus;
        {if _Language='CAPTIONC' then _strmessage:='客户单号不能相同!'
        else _strmessage:='客户单号不能相同!'; }
        if strSysCus<>'WYFQ' then
        begin
        KmessageDlg(GetMessage('frmLocationIN','043'),mtInformation,[mbOK],0);
        exit;
        end else
        begin
          KmessageDlg('该调拨单号已存在，请确认！',mtInformation,[mbOK],0);
          exit;
        end;
      end;
   end;
end;

procedure TfrmLocationIN.edtCustomsNOExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
  if (DataState in Setdcs) and (_DB_CHK_CustomsNO='T') then
  begin
    OpenSql(datatmp.qryTmp,'select num=count(1) from locationinout(nolock) '
                  +' where CustomsNO="'+trim(edtCustomsNO.Text)+'" ');
    if datatmp.qryTmp.FieldByName('num').AsInteger<>0 then
    begin
      edtCustomsNO.SetFocus;
      {if _Language='CAPTIONC' then _strmessage:='报关单号不能相同!'
      else _strmessage:='报关单号不能相同!'; }
      KmessageDlg(GetMessage('frmLocationIN','044'),mtInformation,[mbOK],0);
      exit;
    end;
  end;
end;

procedure TfrmLocationIN.mitOperationClick(Sender: TObject);
begin
   pgcMain.ActivePage :=tbsEdit;
   pgcLocationINOUT.ActivePage:=tbsSKU;
   WorkOperation(stBrowse,data.qryin.FieldByName('Jobno').AsString,
                          data.qryin.FieldByName('UserID').AsString);
end;

procedure TfrmLocationIN.grdLocationINItemDblClick(
  Sender: TObject);
var
  jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
  jsSizeUOM,jsVolueUOM:string;
//  piecefieldname,volfieldname,GWfieldname:string;
begin
  if UpperCase(grdLocationINItem.Columns[grdLocationINItem.GetFocusedAbsoluteIndex(grdLocationINItem.FocusedColumn)].FieldName)='VOLUMETASK'
  then
  begin
    jsPiece   :=data.qryLocationinItem.FieldByName('piecetask').AsFloat;
    jsHeight  :=data.qryLocationinItem.FieldByName('Height').AsFloat;
    jsWidth   :=data.qryLocationinItem.FieldByName('Width').AsFloat;
    jsDepth   :=data.qryLocationinItem.FieldByName('Depth').AsFloat;
    jsVolume  :=data.qryLocationinItem.FieldByName('volumetask').AsFloat;
    jsSizeUOM :=data.qryLocationinItem.FieldByName('SizeUOM').AsString;
    jsVolueUOM:=data.qryLocationinItem.FieldByName('VolumeUOM').AsString;
    while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
    (DataState in Setdcs) and (not grdLocationINOUTItemReadOnly) do
    begin
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('Height').AsFloat    :=jsHeight;
      data.qryLocationinItem.FieldByName('Width').AsFloat     :=jsWidth;
      data.qryLocationinItem.FieldByName('Depth').AsFloat     :=jsDepth;
      data.qryLocationinItem.FieldByName('volumetask').AsFloat    :=jsVolume;
      data.qryLocationinItem.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
      data.qryLocationinItem.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
      exit;
    end;
  end;
end;

procedure TfrmLocationIN.grdLocationINItemEditing(
  Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   if not (DataState in Setdcs) then Allow:=False
   else
   begin
      if (_paper<>'F') and (getSysdata('control')='T') then
      begin
         with grdLocationINItem do
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
         end ;
      end;
      //lzw20120308
      if (getSysdata('xytext')='T') and (data.qryIn.FieldByName('taskcheckname').AsString<>'')and(data.qryLocationINitem.IsEmpty<>true) then
      begin
         allow:=false;
      end;
      if (data.qryLocationINDetail.IsEmpty=true) and (strflow='ITEM') then
      begin
         if grdLocationINOUTItemReadOnly then   //是否是上架人与修改人相当.
         allow:=false;
      end else
      begin
         with grdLocationINItem do
         begin
            if not ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOADGROUPCUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='FORKGROUPCUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LIFTMACHINECUSNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOCNAME') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTUOMTYPE') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='RENTCOUNTUOMTYPE') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='RENTCOUNTUOMTYPEOUT') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='NOTFULLSIGN') or
               (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='REMARK')
               ) then
            Allow:=False;
         end;
      end;
   end;
End;

procedure TfrmLocationIN.grdLocationINItemKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  with TdxDBGrid(Sender) do
  begin
    if (Key = VK_Space) and
      ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUME') or
       (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='GROSSWEIGHT')) then
    begin
      grdLocationINItemDblClick(Sender);
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
           if uppercase(Name)='GRDLOCATIONINITEM' then
              mitdelLocINItemClick(sender)
           else if uppercase(Name)='GRDLOCATIONINDETAIL' then
              mitDelLocationINOUTDetailClick(sender);
           key:=0;
        end;
        if (Key = VK_Insert) and (ssCtrl in Shift) then
        begin
           if uppercase(Name)='GRDLOCATIONINITEM' then
              mitAddLocItemClick(sender);
           key:=0;
        end;
      end;
    end;
  end;
end;

procedure TfrmLocationIN.cusNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin //in out 不同
   if (DataState in Setdcs) and (data.qryLocationInItem.FieldByName('quantitydoorder').AsFloat=0) then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;
         data.qrylocationinitem.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrylocationinitem.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         copycusID   :=data.qrylocationinitem.FieldByName('cusid').AsString;
         copycusName :=data.qrylocationinitem.FieldByName('cusName').AsString;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.ShippercusNameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (data.qryLocationInItem.FieldByName('quantitydoorder').AsFloat=0) then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;
         data.qrylocationinitem.FieldByName('Shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrylocationinitem.FieldByName('ShippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         CopyShippercusID   :=data.qrylocationinitem.FieldByName('Shippercusid').AsString;
         CopyShipperCusName :=data.qrylocationinitem.FieldByName('ShippercusName').AsString
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.QualityNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
       data.qryLocationinItem.edit;
       data.qryLocationinItem.FieldByName('QualityName').AsString
                     :=pGetqualitySelect('');
   end;
end;

procedure TfrmLocationIN.LocItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
   qrySelect:=pGetLocationSelect('','','',data.qrylocationindetail.fieldbyname('qualityname').asstring);
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         data.qrylocationinItem.edit;
         data.qrylocationinItem.FieldByName('LocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         data.qrylocationinItem.FieldByName('LocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.loadgroupcusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;
         data.qryLocationinItem.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationinItem.FieldByName('loadgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.forkgroupcusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;      
         data.qryLocationinItem.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationinItem.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.liftmachinecusnameItemButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;
         data.qryLocationinItem.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationinItem.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.grdLocationINDetailDblClick(
  Sender: TObject);
var
  jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
  jsSizeUOM,jsVolueUOM:string;
begin
   if UpperCase(grdLocationINDetail.Columns[grdLocationINDetail.GetFocusedAbsoluteIndex(grdLocationINDetail.FocusedColumn)].FieldName)='VOLUME' then
   begin
      jsPiece   :=data.qryLocationinDetail.FieldByName('Piece').AsFloat;
      jsHeight  :=data.qryLocationinDetail.FieldByName('Height').AsFloat;
      jsWidth   :=data.qryLocationinDetail.FieldByName('Width').AsFloat;
      jsDepth   :=data.qryLocationinDetail.FieldByName('Depth').AsFloat;
      jsVolume  :=data.qryLocationinDetail.FieldByName('Volume').AsFloat;
      jsSizeUOM :=data.qryLocationinDetail.FieldByName('SizeUOM').AsString;
      jsVolueUOM:=data.qryLocationinDetail.FieldByName('VolumeUOM').AsString;
      while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
      (DataState in Setdcs) and (not grdLocationOutDetailReadOnly) do
      begin
         data.qryLocationinDetail.Edit;
         data.qryLocationinDetail.FieldByName('Height').AsFloat    :=jsHeight;
         data.qryLocationinDetail.FieldByName('Width').AsFloat     :=jsWidth;
         data.qryLocationinDetail.FieldByName('Depth').AsFloat     :=jsDepth;
         data.qryLocationinDetail.FieldByName('Volume').AsFloat    :=jsVolume;
         data.qryLocationinDetail.FieldByName('SizeUOM').AsString  :=jsSizeUOM;
         data.qryLocationinDetail.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
         exit;
      end;
   end;
end;

procedure TfrmLocationIN.grdLocationINDetailEditing(
  Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=False;
   if (DataState in Setdcs) and not grdLocationOutDetailReadOnly then
   begin
      with grdLocationINDetail do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITYUOM') or

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

procedure TfrmLocationIN.grdLocationINDetailEnter(
  Sender: TObject);
begin
   if (DataState in setdcs) and not grdLocationOutDetailReadOnly then
   begin
      if data.qryLocationInDetail.IsEmpty=True and data.qryLocationinitem.IsEmpty<>true then
      begin
         mitAddLocationINOUTDetailClick(Sender);
      end;
   end;
end;

procedure TfrmLocationIN.LocNameDetailButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
//  i:integer;
  pt:TPoint;
  rect:TRect;
begin
   if DataState in Setdcs then
   begin
      if data.qryLocationinItem.fieldbyname('SKUID').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的商品！'
         else _strmessage:='请先填写商品信息中的商品！'; }
         kMessageDlg(GetMessage('frmLocationIN','045'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationinItem.fieldbyname('cusid').asstring='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的寄仓单位！'
         else _strmessage:='请先填写商品信息中的寄仓单位！'; }
         kMessageDlg(GetMessage('frmLocationIN','046'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationinItem.fieldbyname('Shippercusid').asstring='' then
      begin
        { if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的货主！'
         else _strmessage:='请先填写商品信息中的货主！'; }
         kMessageDlg(GetMessage('frmLocationIN','047'), mtWarning, [mbOK], 0);
         exit;
      end else
      if data.qryLocationinItem.fieldbyname('QualityName').asstring='' then
      begin
        { if _Language='CAPTIONC' then _strmessage:='请先填写商品信息中的品质！'
         else _strmessage:='请先填写商品信息中的品质！';  }
         kMessageDlg(GetMessage('frmLocationIN','048'), mtWarning, [mbOK], 0);
         exit;
      end;
    //in
//      blnTray:=true;
      if blnTray then
      begin
         rect:=grdLocationINDetail.CellRect(grdLocationINDetail.FocusedNode,LocNameDetail.Index);
         pt:=ClientToScreen(Point(rect.Left+grdLocationINDetail.left+tbsSKU.left+tbsEdit.left,
             rect.Bottom +grdLocationINDetail.Top +Panel1.Height +KGroupBox1.Height+ToolPanel.Height
             +RxSplitter1.height+3));
         ppmLoc.Popup(pt.x,pt.y);
      end else mitLocInfoSel.Click;
   end;
end;

procedure TfrmLocationIN.QualityNameDetailButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
      data.qryLocationindetail.edit;
      data.qryLocationindetail.FieldByName('QualityName').AsString
                    :=pGetqualitySelect('');
   end;
end;

procedure TfrmLocationIN.QuantityDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityDetailOldValue:=data.qryLocationinDetail.FieldByName('Quantity').AsFloat;
      data.qryLocationinDetail.Edit;
      data.qryLocationinDetail.FieldByName('Quantity').AsFloat:=StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText));
      blnBLJS:=True;
      CountSKUQuantity(data.qryLocationinDetail,QuantityDetailOldValue);

      //威扬
      if data.qryLocationinDetail.FieldByName('quantityshort').AsInteger<>0 then
         data.qryLocationinDetail.FieldByName('casing5').AsFloat:=Trunc(data.qryLocationinDetail.FieldByName('quantity').AsFloat/data.qryLocationinDetail.FieldByName('quantityshort').AsFloat)
      else
         data.qryLocationinDetail.FieldByName('casing5').AsFloat:=0;

      blnBLJS:=False;
   end;
end;

procedure TfrmLocationIN.grdLocationINDetailBeforeInsert;
begin
   data.qryLocationinDetail.fieldbyname('ldsno').Asinteger:=-1;
   data.qryLocationinDetail.fieldByname('jobno').AsString:=data.qryLocationin.fieldbyname('jobno').AsString;
   data.qryLocationinDetail.FieldByName('SNO').AsInteger:=data.qryLocationinItem.fieldbyname('SNO').AsInteger;
   //继承data.qryLocationinItem,不会更改
   if (getSysdata('qdtext')='T') or (strSysCus='WYFQ') OR (strSysCus='XT') then
      data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=data.qryLocationin.fieldbyname('OperationDate').asDateTime
   else if _StrSysCus='SHRL' then
   begin
      data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=data.qryLocationin.fieldbyname('OperationDate').asDateTime;
      data.qryLocationinDetail.Fieldbyname('locid').asString :=data.qryLocationinItem.Fieldbyname('locid').asString;
      data.qryLocationinDetail.Fieldbyname('locname').asString :=data.qryLocationinItem.Fieldbyname('locname').asString;
   end else
      data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=GetServerDate;
   data.qryLocationinDetail.Fieldbyname('SKUID').asString :=data.qryLocationinItem.Fieldbyname('SKUID').asString;
   data.qryLocationinDetail.Fieldbyname('SKUName').asString :=data.qryLocationinItem.Fieldbyname('SKUName').asString;
   //lzw20090319   whl20100118
//   if (strSysCus='SWZ') or (strSysCus='SHRL') then
//   begin
//      data.qryLocationinDetail.fieldbyname('skuspec').asstring:=data.qryLocationinItem.FieldByName('skuspec').asstring;
//      data.qryLocationinDetail.fieldbyname('skumodel').asstring:=data.qryLocationinItem.FieldByName('skumodel').asstring;
//      data.qryLocationinDetail.fieldbyname('customerno').asstring:=data.qryLocationinItem.FieldByName('customerno').asstring;
//   end;

   //cyh20100316
   data.qryLocationinDetail.fieldbyname('skuspec').asstring:=data.qryLocationinItem.FieldByName('skuspec').asstring;
   data.qryLocationinDetail.fieldbyname('skumodel').asstring:=data.qryLocationinItem.FieldByName('skumodel').asstring;
   data.qryLocationinDetail.fieldbyname('customerno').asstring:=data.qryLocationinItem.FieldByName('customerno').asstring;

   data.qryLocationinDetail.Fieldbyname('QuantityUOM').asstring      :=data.qryLocationinItem.Fieldbyname('QuantityUOM').asstring;
   data.qryLocationinDetail.Fieldbyname('PiecePro').asFloat :=data.qryLocationinItem.Fieldbyname('PiecePro').asFloat ;
   data.qryLocationinDetail.Fieldbyname('VolumePro').asFloat:=data.qryLocationinItem.Fieldbyname('VolumePro').asFloat;
   data.qryLocationinDetail.Fieldbyname('AreaPro').asFloat  :=data.qryLocationinItem.Fieldbyname('AreaPro').asFloat  ;
   data.qryLocationinDetail.Fieldbyname('NetWeightPro').asFloat:=data.qryLocationinItem.Fieldbyname('NetWeightPro').asFloat;
   data.qryLocationinDetail.Fieldbyname('GrossWeightPro').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeightPro').asFloat;

   data.qryLocationinDetail.Fieldbyname('pro1').asFloat   :=data.qryLocationinItem.Fieldbyname('pro1').asFloat   ;
   data.qryLocationinDetail.Fieldbyname('pro2').asFloat   :=data.qryLocationinItem.Fieldbyname('pro2').asFloat   ;
   data.qryLocationinDetail.Fieldbyname('pro3').asFloat   :=data.qryLocationinItem.Fieldbyname('pro3').asFloat   ;
   data.qryLocationinDetail.Fieldbyname('pro4').asFloat   :=data.qryLocationinItem.Fieldbyname('pro4').asFloat   ;
   data.qryLocationinDetail.Fieldbyname('pro5').asFloat   :=data.qryLocationinItem.Fieldbyname('pro5').asFloat   ;

   data.qryLocationinDetail.Fieldbyname('jobnoorder').asString :=data.qryLocationinItem.Fieldbyname('jobnoorder').asString;
   data.qryLocationinDetail.Fieldbyname('snoorder').asInteger :=data.qryLocationinItem.Fieldbyname('snoorder').asInteger;

   data.qryLocationinDetail.Fieldbyname('currcd').asstring :=data.qryLocationinItem.Fieldbyname('currcd').asstring;
   data.qryLocationinDetail.Fieldbyname('CostUOMType').asstring  :=data.qryLocationinItem.Fieldbyname('CostUOMType').asstring;
   data.qryLocationinDetail.Fieldbyname('pricein').asFloat          :=data.qryLocationinItem.Fieldbyname('pricein').asFloat         ;
   data.qryLocationinDetail.Fieldbyname('price').asFloat          :=data.qryLocationinItem.Fieldbyname('price').asFloat         ;
 //  data.qryLocationinDetail.Fieldbyname('SKUCost').asFloat     :=0;
 //  data.qryLocationinDetail.Fieldbyname('SKUCostin').asFloat     :=0;
   //继承data.qryLocationinItem,可能会更改
   data.qryLocationinDetail.Fieldbyname('TagTotal').asInteger        :=data.qryLocationinItem.Fieldbyname('TagTotal').asInteger;
//      data.qryLocationinDetail.Fieldbyname('locid').asstring:=data.qryLocationinItem.Fieldbyname('locid').asstring;
//      data.qryLocationinDetail.Fieldbyname('locname').asstring:=data.qryLocationinItem.Fieldbyname('locname').asstring;

   data.qryLocationinDetail.fieldbyname('ManufactureDate').asDateTime   :=data.qryLocationinItem.fieldbyname('ManufactureDate').asDateTime ;
   if data.qryLocationinDetail.fieldbyname('ManufactureDate').asDateTime=0 then
      data.qryLocationinDetail.fieldbyname('ManufactureDate').Clear;
   //lzw 20081205
   data.qryLocationinDetail.fieldbyname('manudatestring').AsString   :=data.qryLocationinItem.fieldbyname('manudatestring').AsString ;
 //in
 //   data.qryLocationinDetail.Fieldbyname('TagNO').asstring      :='';
   if (getSysdata('qdtext')<>'T') or (_strsyscus<>'JG')then
      data.qryLocationinDetail.Fieldbyname('SerialNO').asstring   :=data.qryLocationinItem.Fieldbyname('customerno').asstring;
   if  _strsyscus='JG'then
    data.qryLocationinDetail.Fieldbyname('SerialNO').asstring   :=data.qryLocationinItem.Fieldbyname('SerialNO').asstring;

   data.qryLocationinDetail.Fieldbyname('TagEachUOM').asstring       :=data.qryLocationinItem.Fieldbyname('TagEachUOM').asstring       ;
   data.qryLocationinDetail.Fieldbyname('LotCode').asString          :=data.qryLocationinItem.Fieldbyname('LotCode').asString          ;
   data.qryLocationinDetail.Fieldbyname('QualityName').asString      :=data.qryLocationinItem.Fieldbyname('QualityName').asString      ;
   data.qryLocationinDetail.Fieldbyname('PieceUOM').asstring   :=data.qryLocationinItem.Fieldbyname('PieceUOM').asstring   ;
   data.qryLocationinDetail.Fieldbyname('VolumeUOM').asstring  :=data.qryLocationinItem.Fieldbyname('VolumeUOM').asstring  ;
   data.qryLocationinDetail.Fieldbyname('AreaUOM').asstring    :=data.qryLocationinItem.Fieldbyname('AreaUOM').asstring    ;
   data.qryLocationinDetail.Fieldbyname('WeightUOM').asstring  :=data.qryLocationinItem.Fieldbyname('WeightUOM').asstring  ;
   data.qryLocationinDetail.Fieldbyname('QuantityUOM').asstring:=data.qryLocationinItem.Fieldbyname('QuantityUOM').asstring;

   data.qryLocationinDetail.Fieldbyname('Quantity').AsFloat   :=data.qryLocationinItem.Fieldbyname('Quantitytask').AsFloat-QuantityDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Piece').AsFloat      :=data.qryLocationinItem.Fieldbyname('Piecetask').AsFloat-PieceDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Volume').asFloat     :=data.qryLocationinItem.Fieldbyname('Volumetask').AsFloat-VolumeDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Area').asFloat       :=data.qryLocationinItem.Fieldbyname('Areatask').AsFloat-areaDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('NetWeight').asFloat  :=data.qryLocationinItem.Fieldbyname('NetWeighttask').AsFloat-NetWeightDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('GrossWeight').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeighttask').AsFloat-GrossWeightDetail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('UOM1').asstring        :=data.qryLocationinItem.FieldByName('UOM1').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM2').asstring        :=data.qryLocationinItem.FieldByName('UOM2').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM3').asstring        :=data.qryLocationinItem.FieldByName('UOM5').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM4').asstring        :=data.qryLocationinItem.FieldByName('UOM4').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM5').asstring        :=data.qryLocationinItem.FieldByName('UOM5').asstring;
   data.qryLocationinDetail.Fieldbyname('Casing1').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing1task').AsFloat-casing1detail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Casing2').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing2task').AsFloat-casing2detail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Casing3').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing3task').AsFloat-casing3detail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Casing4').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing4task').AsFloat-casing4detail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('Casing5').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing5task').AsFloat-casing5detail.SummaryFooterValue;
   data.qryLocationinDetail.Fieldbyname('quantityshort').asFloat      :=data.qryLocationinItem.Fieldbyname('quantityshort').AsFloat;
   data.qryLocationinDetail.Fieldbyname('remark').AsString             :=data.qryLocationinItem.Fieldbyname('remark').AsString;

   data.qryLocationinDetail.fieldbyname('NotFullSign').Asstring:='F';
   data.qryLocationinDetail.Fieldbyname('costquantityuom').asstring :=data.qryLocationinItem.Fieldbyname('costquantityuom').asstring;
   data.qryLocationinDetail.Fieldbyname('costquantity').asFloat     :=data.qryLocationinItem.Fieldbyname('costquantitytask').AsFloat;
//ine
end;

procedure TfrmLocationIN.mitLIOoutClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday,stryeartask,strmonthtask,strdaytask:Word;
   strdate,strusername:string;
   //_skuhb,_taskordetail:string;
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
   //lzw 20090310
   if strSysCus='SWZ' then
   begin
      OpenSql(datatmp.qryTmp,'select 1 from contract (nolock)    '+chr(13)+chr(10)
                            +' where signcusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"  '+chr(13)+chr(10)
                            +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                            );
      if datatmp.qryTmp.RecordCount=0 then
      begin
         kMessageDlg('该客户还未签订合同,不能打印进仓单!', mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   lstPara:=TStringList.Create;

   lstpara.Add('CreateName='+data.qrylocationin.FieldByname('CreateName').AsString);//dwq
   lstpara.Add('username='+data.qrylocationin.FieldByname('username').AsString);
   strusername:=data.qrylocationin.FieldByname('username').AsString;
   lstpara.Add('taskdate='+copy(data.qrylocationin.FieldByname('taskdate').asstring,1,10));
   lstpara.Add('tasktime='+data.qrylocationin.FieldByname('taskdate').asstring);
   lstpara.Add('isbond='+data.qrylocationin.FieldByname('isbond').AsString);
   lstpara.Add('Locationbillno='+data.qrylocationin.FieldByname('Locationbillno').AsString);
   lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationin.FieldByname('cusbillno').AsString);
   lstpara.Add('Remark='+data.qrylocationin.FieldByname('Remark').AsString);
   lstpara.Add('condes='+data.qrylocationin.FieldByname('condes').AsString);
   lstpara.Add('opname='+data.qrylocationin.FieldByname('opname').AsString);
   lstpara.Add('checkname='+data.qrylocationin.FieldByname('checkname').AsString);
   lstpara.Add('taskcheckname='+data.qrylocationin.FieldByname('taskcheckname').AsString);
   lstpara.Add('carrierdate='+data.qrylocationin.FieldByname('carrierdate').asstring);
   lstpara.Add('CarrierName='+data.qrylocationin.FieldByname('CarrierName').asstring);
   lstpara.Add('iusername='+data.qrylocationin.FieldByname('iusername').AsString);
   lstpara.Add('createdate='+data.qrylocationin.FieldByname('createdate').asstring);
   lstpara.Add('carriercusname='+data.qryLocationIn.FieldByname('carriercusname').Asstring);
   lstPara.Add('CARBRAND='+data.qryLocationIn.FieldByname('CARBRAND').AsString);
   lstPara.Add('CARRIERNO='+data.qryLocationIn.FieldByname('CARRIERNO').AsString);
   lstPara.Add('conno='+data.qryLocationIn.FieldByname('conno').AsString); //航次且当司机证件号
   lstPara.Add('loadcosttype='+data.qryLocationIn.FieldByname('loadcosttype').AsString);
   lstpara.Add('zbr='+_loginname);
   //******* wzh.05.08.30  begin ********//
   lstpara.Add('quantity='+floattostr(data.qryin.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qryin.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qryin.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qryin.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qryin.FieldByname('netweight').AsFloat));
   lstpara.Add('shippercusname='+data.qryin.FieldByname('shippercusid').Asstring);
   lstpara.Add('cusname='+data.qryin.FieldByname('cusname').Asstring);
   lstPara.Add('date='+DateToStr(Now));
   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);
   lstPara.Add('costcusid='+data.qryLocationIN.fieldByname('costcusid').AsString);
   lstPara.Add('shipcusname='+data.qryLocationIN.fieldByname('shipcusname').AsString);
   lstPara.Add('customsno='+data.qryLocationIN.fieldByname('customsno').AsString);
   //质检状态
   lstpara.Add('isbroken='+iif(data.qrylocationin.FieldByname('isbroken').AsString='T','','合格'));
   lstPara.Add('brokenmark='+data.qryLocationIN.fieldByname('brokenmark').AsString);
   if _paper='T' then
      if data.qryLocationIN.fieldByname('Routing').AsString<>'' then
         lstPara.Add('Routing='+data.qryLocationIN.fieldByname('Routing').AsString)
      else
         lstPara.Add('Routing='+data.qryLocationIN.fieldByname('shipcusname').AsString+' '+data.qryLocationIN.fieldByname('loadcosttype').AsString)
   else
      lstPara.Add('Routing='+data.qryLocationIN.fieldByname('Routing').AsString);

   DecodeDate(data.qryLocationIn.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);
   //lzw20090731
   DecodeDate(data.qryLocationIn.FieldByname('TASKDATE').AsDateTime,strYeartask,strMonthtask,strDaytask);

   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   lstpara.Add('oyear='+inttostr(stryear));
   lstpara.Add('omonth='+inttostr(strmonth));
   lstpara.Add('oday='+inttostr(strday));
   lstpara.Add('oyeartask='+inttostr(stryeartask));
   lstpara.Add('omonthtask='+inttostr(strmonthtask));
   lstpara.Add('odaytask='+inttostr(strdaytask));

   //******* wzh.05.08.30  end ********//
   //900052作业出入库联系单中用到
   lstpara.Add('title='+'产成品入库运输作业单');
//重复及不规范命名:一个月后更新无问题删除    lqs
   lstPara.Add('carno='+data.qryLocationIn.FieldByname('CARBRAND').AsString);
   lstpara.Add('driver='+data.qryLocationIn.FieldByname('carriercusname').Asstring);
   lstPara.Add('cg='+data.qryLocationIn.FieldByname('opname').AsString);
   lstPara.Add('kp='+data.qryLocationIn.FieldByname('CreateName').AsString);
   lstpara.Add('OriginOrder='+data.qrylocationin.FieldByname('shipcusname').AsString); //取发货人
   lstpara.Add('ddbh='+data.qrylocationin.FieldByname('cusbillno').AsString);
   lstpara.Add('zydh='+data.qrylocationin.FieldByname('LocationBillNO').AsString);
   lstpara.Add('qysj='+data.qrylocationin.FieldByname('carrierdate').AsString);
   lstpara.Add('ck='+data.qrylocationin.FieldByname('iusername').AsString);
   lstpara.Add('zdrq='+data.qrylocationin.FieldByname('createdate').AsString);
   lstPara.Add('loginname='+_Loginname);
   lstPara.Add('shipcusname='+data.qryLocationIN.fieldByname('shippercusid').AsString);
   lstPara.Add('carbrand='+data.qryLocationIN.fieldByname('carbrand').AsString);
//
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno  '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   //助记符
   lstPara.Add('cushelpno='+datatmp.qryTmp.fieldbyname('cushelpno').AsString);

   //收货单位
   OpenSql(dataTmp.qryTmp,'select address,linkman,tel      '
                         +'  from customer(nolock)      '
                         +' where cusid="'+data.qryLocationIN.FieldByname('shipcusid').AsString+'" ');
   lstPara.Add('shipaddress='+dataTmp.qryTmp.fieldByname('address').AsString);
   lstPara.Add('linkman='+dataTmp.qryTmp.fieldByname('linkman').AsString);
   lstPara.Add('tel='+dataTmp.qryTmp.fieldByname('tel').AsString);

   //取上级部门
   OpenSql(dataTmp.qryTmp,'select pusername from organization (nolock)  '
                         +' where userid="'+data.qrylocationin.FieldByname('iuserid').Asstring+'"'
                         );
   lstPara.Add('pusername='+dataTmp.qryTmp.fieldbyname('pusername').AsString);

   OpenSql(dataTmp.qryTmp,'select tjhj=sum(isnull(volume,0)),slhj=sum(isnull(quantity,0)),mzhj=sum(isnull(grossweight,0)) '
                         +'  from locationinitem (nolock) '
                         +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('tjhj='+dataTmp.qryTmp.FieldByname('tjhj').AsString);
   lstPara.Add('slhj='+dataTmp.qryTmp.FieldByname('slhj').AsString);
   lstPara.Add('mzhj='+dataTmp.qryTmp.FieldByname('mzhj').AsString);

   OpenSql(dataTmp.qryTmp,'select rwtjhj=sum(isnull(volumetask,0)),rwslhj=sum(isnull(quantitytask,0)) '
                         +'  from locationinitem (nolock) '
                         +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('rwtjhj='+dataTmp.qryTmp.FieldByname('rwtjhj').AsString);
   lstPara.Add('rwslhj='+dataTmp.qryTmp.FieldByname('rwslhj').AsString);

   OpenSql(dataTmp.qryTmp,'select top 1 locationinoutcon.* '
                         +'  from locationinoutcon (nolock) '
                         +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '
                         +'   and isnull(iscon,"F")="F" '
                         );
   lstPara.Add('drivername='+dataTmp.qryTmp.FieldByname('drivername').AsString);
   lstPara.Add('driveridcar='+dataTmp.qryTmp.FieldByname('driveridcar').AsString);
   lstPara.Add('conveno='+dataTmp.qryTmp.FieldByname('conveno').AsString);
   lstPara.Add('drivertel='+dataTmp.qryTmp.FieldByname('drivertel').AsString);
   lstPara.Add('CONNO1='+dataTmp.qryTmp.FieldByname('CONNO').AsString);
   //lzw20100824
   if strSysCus='JJXY' then //晋江象屿
   begin
      OpenSql(dataTmp.qryTmp,'select top 1 locationinitem.weightuom '
                            +'  from locationinitem (nolock) '
                            +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '

                            );
      lstPara.Add('weightuom='+dataTmp.qryTmp.FieldByname('weightuom').AsString);
   end;
   GenInformations(lstPara);

   if _SkuHB='F' then  //_SkuHB  进出仓打印商品合并
   begin
      if _LIPrintTask='F'then
         OpenSql(dataTmp.qryTmp,'select detail.jobno,locin.OriginOrder,sku.skumodel,sku.skuspec,detail.ManufactureDate, '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,            '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))),'+chr(13)+chr(10)
                               +'       piece=detail.piece,skuclass="'+cmbSKUClass.Text+'",      '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end,            '+chr(13)+chr(10)
                               +'       netweight=detail.netweight,                              '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweight,                          '+chr(13)+chr(10)
                               +'       volume=detail.volume,QualityName,                        '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       area=detail.area,shipcusname=detail.shipcusname,                    '+chr(13)+chr(10)
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillno,detail.corpno,price=isnull(detail.pricein,0), '+chr(13)+chr(10)
//add by cyh  06.04.08
                               +'       detail.TASKDATE,detail.cusbillno,detail.ShippercusName,detail.piece,detail.grossweight,detail.netweight,detail.conno,   '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'       model=case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end ,sku.weightpro,             '+chr(13)+chr(10)
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'  from locationindetail detail(nolock)  '+chr(13)+chr(10)
                               +'           left join locationin locin (nolock) '+chr(13)+chr(10)
                               +'                     on locin.jobno=detail.jobno '+chr(13)+chr(10)
                               +'           left join sku (nolock)    '+chr(13)+chr(10)
                               +'                     on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +iif(_paper='T','order by detail.sno ','')
                                       )
      else
         OpenSql(dataTmp.qryTmp,'select detail.jobno,locin.OriginOrder,sku.skumodel,sku.skuspec,detail.ManufactureDate, '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname,            '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantitytask=convert(varchar,convert(float,detail.quantitytask)),'+chr(13)+chr(10)
                               +'       quantity=convert(varchar,convert(float,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantityint=convert(varchar,convert(int,detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=convert(varchar,(detail.quantity-convert(int,detail.quantity))),'+chr(13)+chr(10)
                               +'       piece=detail.piecetask,skuclass="'+cmbSKUClass.Text+'",  '+chr(13)+chr(10)
                               +'       quantitypiece=case when isnull(detail.piece,0)<>0 then detail.quantity/detail.piece else 0 end,            '+chr(13)+chr(10)
                               +'       netweight=detail.netweighttask,                          '+chr(13)+chr(10)
                               +'       netweightint=detail.netweight,                           '+chr(13)+chr(10)
                               +'       grossweight=detail.grossweighttask,                      '+chr(13)+chr(10)
                               +'       detail.casing1task,sku.AlternateSKUName,                 '+chr(13)+chr(10)
                               +'       volume=detail.volumetask,QualityName,                    '+chr(13)+chr(10)
                               +'       area=detail.areatask,shipcusname=detail.shipcusname,     '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,detail.volume))'+'+"/"+'+'convert(varchar,convert(float,detail.grossweight)),'+chr(13)+chr(10)
                               +'       locname=detail.locname, '+chr(13)+chr(10)   //wzh.05.08.30
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,detail.remark,sku.customerno,  '+chr(13)+chr(10)
                               +'       detail.locationbillno,detail.corpno,price=isnull(detail.pricein,0), '+chr(13)+chr(10)
//add by cyh  06.04.08
                               +'       detail.TASKDATE,detail.cusbillno,detail.ShippercusName,detail.piecetask,detail.grossweighttask,detail.netweighttask,detail.conno,    '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'       model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end,sku.weightpro,legaluom=null ,sku.pricein ,             '+chr(13)+chr(10)
                               +'       skucost=convert(numeric(16,4), case sku.legaluom when "quantity" then isnull(detail.quantitytask,0)*sku.pricein  '+chr(13)+chr(10)
                               +'                                      when "piece" then isnull(detail.piecetask,0)*sku.pricein                             '+chr(13)+chr(10)
                               +'                                      when "volume" then isnull(detail.volumetask,0)*sku.pricein                           '+chr(13)+chr(10)
                               +'                                      when "grossweight" then isnull(detail.grossweighttask,0)*sku.pricein                 '+chr(13)+chr(10)
                               +'                                      when "netweight" then isnull(detail.netweighttask,0)*sku.pricein                     '+chr(13)+chr(10)
                               +'                                      end), '
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'  from locationinitem detail(nolock)    '+chr(13)+chr(10)
                               +'           left join locationin locin (nolock) '+chr(13)+chr(10)
                               +'                     on locin.jobno=detail.jobno '+chr(13)+chr(10)
                               +'           left join sku (nolock)    '+chr(13)+chr(10)
                               +'                     on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +iif(_paper='T','order by detail.sno ','')
                                       );
   end else
   begin
      if _LIPrintTask='F' then  //_LIPrintTask 打印实际数据
         OpenSql(dataTmp.qryTmp,'select detail.jobno,locin.OriginOrder,sku.skumodel,sku.skuspec, detail.ManufactureDate,'+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname, '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
                               +'       quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                               +'       quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'       netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                               +'       netweightint=sum(isnull(detail.netweight,0)),              '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'       volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                               +'       skuclass="'+cmbSKUClass.Text+'",QualityName="",     '+chr(13)+chr(10)
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,'+chr(13)+chr(10)
                               +'       detail.areauom,remark="",sku.customerno, shipcusname=detail.shipcusname, '+chr(13)+chr(10)
                               +'       detail.locationbillno,detail.corpno,quantitypiece=sku.piecepro,price=isnull(detail.pricein,0), '+chr(13)+chr(10)
//add by cyh  06.04.08
                               +'       detail.TASKDATE,detail.cusbillno,detail.ShippercusName,detail.conno ,       '+chr(13)+chr(10)
//                               +'       detail.piece,detail.grossweight,detail.netweight,   '+chr(13)+chr(10)
                                +'      lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'       model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end ,sku.weightpro,                                                                                            '+chr(13)+chr(10)
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +'  from locationindetail detail (nolock) '+chr(13)+chr(10)
                               +'         left join locationin locin (nolock) '+chr(13)+chr(10)
                               +'                   on locin.jobno=detail.jobno '+chr(13)+chr(10)
                               +'         left join sku (nolock)    '+chr(13)+chr(10)
                               +'                   on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +' where detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +' group by detail.jobno,detail.locname,detail.locid,detail.lotcode,detail.skuname,locin.OriginOrder,sku.skumodel,sku.skuspec, detail.ManufactureDate,  '
                               +'          detail.quantityuom,detail.pieceuom,sku.piecepro,'+chr(13)+chr(10)
                               +'          detail.volumeuom,detail.weightuom,detail.areauom ,sku.customerno,detail.locationbillno,detail.corpno,detail.TASKDATE,'+chr(13)+chr(10)
                               +'          detail.cusbillno,detail.ShippercusName,detail.conno,detail.pricein, '+chr(13)+chr(10)
//whl                               +'          detail.piecetask,detail.grossweighttask,detail.netweighttask ,    '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),                     '+chr(13)+chr(10)
                               +'            case when (charindex("(",detail.LotCode,1)>0)                                                                      '+chr(13)+chr(10)
                               +'                  and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'                  and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'                 then                                                                                                               '+chr(13)+chr(10)
                               +'            substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'            else  "" end ,detail.shipcusname,sku.weightpro            '+chr(13)+chr(10)
                                )
      else
         OpenSql(dataTmp.qryTmp,'select detail.jobno,locin.OriginOrder,sku.skumodel,sku.skuspec, '+chr(13)+chr(10)
                               +'       detail.lotcode,detail.skuname, '+chr(13)+chr(10)
                               +'       locname=case when detail.locname like "'+strusername+'"+"%" '+chr(13)+chr(10)
                               +'                    then substring(detail.locname,len("'+strusername+'")+1,len(detail.locname)) else detail.locname end, '+chr(13)+chr(10)
//whl                               +'       detail.quantitytask,'+chr(13)+chr(10)           //wzh.05.08.30
                               +'       quantity=sum(isnull(detail.quantitytask,0)),piece=sum(isnull(detail.piecetask,0)), '+chr(13)+chr(10)
                               +'       quantitytask=sum(isnull(detail.quantitytask,0)),casing1task=sum(isnull(detail.casing1task,0)),'+chr(13)+chr(10)
                               +'       quantityint=convert(int,sum(detail.quantity)),'+chr(13)+chr(10)
                               +'       quantitypaper=(sum(detail.quantity)-convert(int,sum(detail.quantity)))*500,'+chr(13)+chr(10)
                               +'       netweight=sum(isnull(detail.netweighttask,0)),grossweight=sum(isnull(detail.grossweighttask,0)),'+chr(13)+chr(10)
                               +'       netweightint=sum(isnull(detail.netweight,0)), '+chr(13)+chr(10)
                               +'       m3pt=convert(varchar,convert(float,sum(isnull(detail.volume,0))))'+'+"/"+'+'convert(varchar,convert(float,sum(isnull(detail.grossweight,0)))),'+chr(13)+chr(10)
                               +'       volume=sum(isnull(detail.volumetask,0)),area=sum(isnull(detail.areatask,0)),  '+chr(13)+chr(10)
                               +'       skuclass="'+cmbSKUClass.Text+'",QualityName="",     '+chr(13)+chr(10)
                               +'       detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.weightuom,detail.areauom,detail.remark,sku.customerno,  '+chr(13)+chr(10)
                               +'       shipcusname=detail.shipcusname,detail.locationbillno ,detail.corpno,'+chr(13)+chr(10)
//add by cyh   06.04.08
                               +'       detail.TASKDATE,detail.cusbillno,detail.ShippercusName,detail.conno,price=isnull(detail.pricein,0),    '+chr(13)+chr(10)
//whl                               +'       detail.piecetask,detail.grossweighttask,detail.netweighttask,        '+chr(13)+chr(10)
                               +'       lotcode1=case when (charindex("(",detail.LotCode,1)>0)                                                                             '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)                                                                                  '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                                 '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1))                             '+chr(13)+chr(10)
                               +'                else detail.lotcode end,          '+chr(13)+chr(10)
                               +'       model= case when (charindex("(",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)>0)       '+chr(13)+chr(10)
                               +'                 and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)     '+chr(13)+chr(10)
                               +'                then substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'                else  sku.skuspec end  ,sku.weightpro ,                                                                                                               '+chr(13)+chr(10)
                               +'       classid1=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,3)),           '+chr(13)+chr(10)
                               +'       classid2=(select locname from location  where classid=substring((select classid from location where locid=detail.locid),1,6))            '+chr(13)+chr(10)
                               +' from  locationinitem detail(nolock)   '+chr(13)+chr(10)
                               +'         left join locationin locin (nolock) '+chr(13)+chr(10)
                               +'                   on locin.jobno=detail.jobno '+chr(13)+chr(10)
                               +'         left join sku (nolock)    '+chr(13)+chr(10)
                               +'                   on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                               +'where  detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                               +'group  by detail.jobno,detail.locname,detail.locid,detail.lotcode,detail.skuname , '+chr(13)+chr(10)
                               +'         locin.OriginOrder,sku.skumodel,sku.skuspec, '+chr(13)+chr(10)       //wzh.05.08.30
                               +'         detail.quantityuom,detail.pieceuom,   '+chr(13)+chr(10)
                               +'         detail.volumeuom,detail.weightuom,detail.areauom,detail.remark,sku.customerno,detail.locationbillno,detail.corpno,detail.TASKDATE , '+chr(13)+chr(10)
                               +'         detail.shipcusname,detail.cusbillno,detail.ShippercusName,detail.conno,detail.pricein, '+chr(13)+chr(10)
//whl                          +'         detail.quantitytask,detail.piecetask,detail.grossweighttask,detail.netweighttask,   '+chr(13)+chr(10)
                               +'         substring (detail.LotCode,charindex("",detail.LotCode,1),charindex("(",detail.LotCode,1)),'+chr(13)+chr(10)
                               +'         case when (charindex("(",detail.LotCode,1)>0)                                                             '+chr(13)+chr(10)
                               +'               and (charindex(")",detail.LotCode,1)>0)                                                                          '+chr(13)+chr(10)
                               +'               and (charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1>0)                                        '+chr(13)+chr(10)
                               +'         then                                                                                                               '+chr(13)+chr(10)
                               +'               substring (detail.LotCode,charindex("(",detail.LotCode,1)+1,charindex(")",detail.LotCode,1)-charindex("(",detail.LotCode,1)-1) '+chr(13)+chr(10)
                               +'               else  "" end ,sku.weightpro                                                                                                                 '+chr(13)+chr(10)
                               );
   end;
                        
   if strSysCus='SWZ' then
   begin
     //lzw20090504
      OpenSql(dataTmp.qryTmp, 'select item.customsno,item.jobno,sku.skumodel,sku.skuspec,sku.color,  '+chr(13)+chr(10)
                     +'       item.lotcode,item.skuname,sku.customerno,locationin.Routing,   '+chr(13)+chr(10)
                     +'       skunamebb=item.skuname+" "+isnull(sku.skumodel,"")+" "+isnull(sku.skuspec,"")+" "+isnull(sku.color,""), '+chr(13)+chr(10)
                     +'       locname=item.locname,locationin.shipcusname,locationin.carbrand, '+chr(13)+chr(10)
                     +'       quantitylj=item.casing4,locationin.piece,locationin.grossweight,  '+chr(13)+chr(10)
                     +'       quantityrw=item.quantity,quantityyf=wareordersku.quantity,'+chr(13)+chr(10)
                     +'       piecerw=item.piece,pieceyf=wareordersku.piece,skuclass="'+cmbSKUClass.Text+'",  '+chr(13)+chr(10)
                     +'       netweightrw=item.netweight,netweightyf=wareordersku.netweight,    '+chr(13)+chr(10)
                     +'       grossweightrw=item.grossweight,grossweightyf=wareordersku.grossweight,  '+chr(13)+chr(10)
                     +'       casing5rw=item.casing5,casing5yf=wareordersku.casing5,   '+chr(13)+chr(10)

                     +'       grossweightsj=locationindetail.grossweight,piecesj=locationindetail.piece,  '+chr(13)+chr(10)
                     +'       casing5sj=locationindetail.casing5,   '+chr(13)+chr(10)
                     +'       item.quantityuom,item.pieceuom,item.weightuom,'+chr(13)+chr(10)
                     +'       locationin.remark, '+chr(13)+chr(10)
                     +'       item.cusbillno,item.corpno,item.locationBillNo'+chr(13)+chr(10)
                     +'  from locationinitem item(nolock)  '+chr(13)+chr(10)
                     +'               left join locationindetail (nolock)    '+chr(13)+chr(10)
                     +'                          on item.jobno=locationindetail.jobno     '+chr(13)+chr(10)
                     +'                         and item.sno=locationindetail.sno     '+chr(13)+chr(10)
                     +'               left join locationin (nolock)    '+chr(13)+chr(10)
                     +'                          on item.jobno=locationin.jobno     '+chr(13)+chr(10)
                     +'               left join sku (nolock)    '+chr(13)+chr(10)
                     +'                          on item.skuid=sku.skuid     '+chr(13)+chr(10)
                     +'               left join wareordersku(nolock)   '+chr(13)+chr(10)
                     +'                      on wareordersku.jobno=item.jobnoorder '+chr(13)+chr(10)
                     +'                     and wareordersku.sno=item.snoorder '+chr(13)+chr(10)
                     +' where item.jobno="'+data.qryLocationIn.FieldByName('jobno').AsString+'" '
             );
      lstPara.Add('piecetotal='+dataTmp.qryTmp.FieldByname('piece').AsString);
      lstPara.Add('grossweighttotal='+dataTmp.qryTmp.FieldByname('piece').AsString);
      lstPara.Add('zysjc='+tmtconloaddate.Text);
      lstPara.Add('zysjd='+tmtcarrierdate.Text);
      lstPara.Add('zysb='+edtDestOrder.Text);
      lstpara.Add('kdr='+_loginname);

      Worklinprint('100129','old','省物资进仓单',dataTmp.qryTmp,nil,nil,lstpara);
   end else
   begin
      if _strsyscus='JJHY' then
      begin
         Worklinprint('100131','old','陆地港仓库入库单',dataTmp.qryTmp,nil,nil,lstpara);
      end else
      if _strsyscus='LHJM' then
      begin
         Worklinprint('900119','old','货物进仓单',dataTmp.qryTmp,nil,nil,lstpara);
      end else
      begin
         Worklinprint('900003','old','入%库联系单',dataTmp.qryTmp,nil,nil,lstpara);
      end;
   end;
end;

procedure TfrmLocationIN.PieceDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      QuantityDetailOldValue:=data.qryLocationinDetail.FieldByName('Piece').AsFloat;
      data.qryLocationinDetail.Edit;
      data.qryLocationinDetail.FieldByName('Piece').AsFloat:=StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText));
      blnBLJS:=True;
      CountSKUPiece(data.qryLocationinDetail,QuantityDetailOldValue);
      blnBLJS:=False;
   end;
end;

procedure TfrmLocationIN.N14Click(Sender: TObject);
begin
   if data.qryLocationInDetail.FieldByName('locid').AsString='' then
   begin
      KMessageDlg('仓位不可为空!',mtWarning,[mbOK],0);
      exit;
   end;

   if data.qryLocInSkuDetail.Active<>True then
   begin
      data.qryLocInSkuDetail.ParamByName('jobno').AsString:=data.qryLocationIn.fieldByName('jobno').AsString;
      data.qryLocInSkuDetail.Open;
   end;
   if DataState=stedit then
   begin
      _maxgridno:=0;
      data.qrylocinskudetail.First;
      while not data.qrylocinskudetail.Eof do
      begin
         if data.qrylocinskudetail.FieldByName('detailsno').AsInteger>_maxgridno
         then _maxgridno:=data.qrylocinskudetail.FieldByName('detailsno').AsInteger;
         data.qrylocinskudetail.Next;
      end;
   end;
   grdLocationINDetailChangeNodeEx(nil);
   WorkLocInSKUDetail(IIF(grdLocationOutDetailReadOnly,stBrowse,DataState) ,
                      data.qryIn.FieldByName('jobno').AsString,
                      data.qryLocationInItem.fieldbyname('customerno').AsString,
                      data.qryLocationinDetail.FieldByName('SNO').AsInteger,
                      data.qryLocationinDetail.FieldByName('ldsno').AsInteger,
                      _maxgridno,
                      data.qryLocInSkuDetail,data.qryLocationInDetail);

end;

procedure TfrmLocationIN.mitCheckOneClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select num=count(1) from locationinitem (nolock) where jobno="'+data.qryIn.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.FieldByName('num').AsInteger=0) then
   begin
      KmessageDlg(GetMessage('frmLocationIN','069'),mtWarning,[mbOK],0);
      //IIF(_Language='CAPTIONC','该任务无货物信息，不能审核！','************')
      Exit;
   end;
   if (data.qryin.FieldByName('operationname').AsString='') then
      KmessageDlg(GetMessage('frmLocationIN','076'),mtWarning,[mbOK],0);
   if (data.qryin.FieldByName('checkname').AsString<>'') then
      KmessageDlg(GetMessage('frmLocationIN','070'),mtWarning,[mbOK],0);
   if (data.qryin.FieldByName('taskiscomplete').AsString<>'T') then
      KmessageDlg(GetMessage('frmLocationIN','077'),mtWarning,[mbOK],0);
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(datatmp.qryTmp,'update LocationIN '
                +'   set checkname="'+_loginname+'",'
                +'       CHECKDATE="'+datetostr(GetServerDate)+'"'
                +' where jobno="'+data.qryIn.FieldByName('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitCancelOneClick(Sender: TObject);
begin
   if data.qryIn.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg(GetMessage('frmLocationIN','071'),mtWarning,[mbOK],0);
      exit;
   end;
   if data.qryin.FieldByName('countname').AsString<>'' then
   begin
      KmessageDlg(GetMessage('frmLocationIN','073'),mtWarning,[mbOK],0);
      exit;
   end;
   if (_DB_CheckSelf='T') and (_LoginId<>'SYSTEM') and (_loginName<>data.qryin.FieldByName('checkname').AsString) then
   begin
      KmessageDlg(GetMessage('frmLocationIN','074'),mtWarning,[mbOK],0);
      exit;
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   ExecSql(dataTmp.qryTmp,' update LocationIN '+
                      '    set checkname="",'+
                      '        checkdate=null'+
                      '  where jobno="'+data.qryIn.FieldByName('jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitaccountClick(Sender: TObject);
var
//   GetAccount:TGetAccount;
   StrAccountId:String;
   StrAccountName:String;
   StrDataName:String;
begin
   if data.qryLocationinItem.RecordCount<>0 then
   begin
//      GetAccount:=workGetAccount('');
//      StrAccountId:=GetAccount.AccountID;
//      StrAccountName:=GetAccount.AccountName;
//      StrDataName:=GetAccount.DataName;
      if StrAccountId<>'' then
      begin
         data.qryLocationinItem.DisableControls;
         data.qryLocationinItem.First;
         while not data.qryLocationinItem.Eof do
         begin
            data.qryLocationinItem.Edit;
            data.qryLocationinItem.FieldByName(trim(StrDataName)).AsString:=StrAccountId;
            data.qryLocationinItem.FieldByName(trim(StrDataName)+'Name').AsString:=StrAccountName;
            data.qryLocationinItem.Next;
         end;
         iOutCostType:=2;
         data.qryLocationinItem.EnableControls;
      end;
   end;
end;

procedure TfrmLocationIN.btnCostClick(Sender: TObject);
begin
   pWorkFormDll('FINANCE',PChar('COSTITEM'+data.qryin.FieldByName('Jobno').AsString));
end;

procedure TfrmLocationIN.grdLocationINItemBeforeInsert;
begin
   data.qryLocationINItem.fieldbyname('SNO').Asinteger:=-1;
   data.qryLocationINItem.fieldbyname('SNOCasing').Asinteger:=-1;
   data.qryLocationINItem.fieldByname('jobno').AsString:=data.qryLocationIN.fieldbyname('jobno').AsString;
   data.qryLocationINItem.fieldbyname('userid').asstring:=data.qryLocationIN.fieldbyname('userid').asstring;
   data.qryLocationINItem.fieldbyname('username').asstring:=data.qryLocationIN.fieldbyname('username').asstring;
   data.qryLocationINItem.fieldByname('RentCountUOMType').AsString
                                 :=iif(strRentCountUOMType<>'',strRentCountUOMType,'piece');
   data.qryLocationINItem.fieldByname('RentCountUOMTypeOut').AsString
                                 :=iif(strRentCountUOMTypeOut<>'',strRentCountUOMType,'piece');
   data.qryLocationINItem.fieldByname('CostCountUOMType').AsString
                                 :=iif(strCostCountUOMType<>'',strCostCountUOMType,'piece');
   data.qryLocationINItem.fieldByname('CostUOMType').AsString       :='piece';
   strcostuom:='piece';
   data.qryLocationINItem.fieldbyname('QualityName').Asstring:=iif(CopyQuality<>'',CopyQuality,'正品');
   data.qryLocationINItem.fieldbyname('NotFullSign').Asstring:='F';
   data.qryLocationINItem.fieldByname('cusid').AsString    :=
                     IIF(copycusID='',data.qryLocationIN.fieldByname('costcusid').AsString,copycusID);
   data.qryLocationINItem.fieldByname('cusname').AsString  :=
                     IIF(copycusName='',data.qryLocationIN.fieldByname('costcusname').AsString,copycusName);
   data.qryLocationINItem.fieldByname('shippercusid').AsString    :=
                     IIF(CopyShippercusID='',data.qryLocationIN.fieldByname('costcusid').AsString,CopyShippercusID);
   data.qryLocationINItem.fieldByname('shippercusname').AsString  :=
                     IIF(CopyShipperCusName='',data.qryLocationIN.fieldByname('costcusname').AsString,CopyShipperCusName);
   data.qryLocationINItem.fieldByname('costcusid').AsString    :=data.qryLocationIN.fieldByname('costcusid').AsString;
   data.qryLocationINItem.fieldByname('costcusname').AsString  :=data.qryLocationIN.fieldByname('costcusname').AsString;
   data.qryLocationINItem.fieldByname('manudatestring').AsString  :='日';
   //wzh  原先的吊机人,装卸人,叉车组写错了
   data.qrylocationinitem.fieldbyname('loadgroupcusid').asstring    :=copyloadgroupcusid;
   data.qrylocationinitem.fieldbyname('loadgroupcusname').asstring  :=copyloadgroupcusname;
   data.qrylocationinitem.fieldbyname('forkgroupcusid').asstring    :=copyforkgroupcusid;
   data.qrylocationinitem.fieldbyname('forkgroupcusname').asstring  :=copyforkgroupcusname;
   data.qrylocationinitem.fieldbyname('liftmachinecusid').asstring  :=copyliftmachinecusid;
   data.qrylocationinitem.fieldbyname('liftmachinecusname').asstring:=copyliftmachinecusname;
   data.qrylocationinitem.fieldbyname('currcd').asstring:=_currcd;

   if strSysCus='JJXY' then //晋江象屿配置，解决货权变更需要记录最初进仓时间
      data.qrylocationinitem.fieldbyname('ManufactureDate').asdatetime:=data.qryLocationIN.fieldByname('TASKDATE').asdatetime;
end;

procedure TfrmLocationIN.SKUNameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  i:integer;
  qrySelect:TKADOQuery;
  Quantity:extended;
//  TSKUSelect:TMultSKUSelection;
//  mulSKUSelect:TMultLocationSKUSelect;
begin
{  if blnSelect then
  begin
     blnSelect:=False;
  end else
  begin
     blnSelect:=False;}
  if _ConCusInput<>'T' then Exit;

  with grdLocationINItem.InplaceEditor do
//in
    if (GetEditingText<>'') and
       (GetEditingText<>data.qryLocationinItem.Fieldbyname('SKUName').asstring) and
       (data.qryLocationinItem.FieldByName('jobnoorder').AsString='') then
   begin
    qrySelect:=PGetSKUSelect('',data.qryLocationINItem.fieldByname('Shippercusid').AsString,'D','F',GetEditingText);
    qrySelect.First;
    i:=0;
        data.qryLocationinItem.edit;
        if qryselect.fieldbyname('SKUName_set').AsString<>'' then
        begin
           data.qryLocationin.Edit;
           data.qryLocationin.fieldbyname('SKUNAME').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
           data.qryLocationin.fieldbyname('Quantitytasked').AsFloat  :=qryselect.fieldbyname('Quantity_set').AsFloat;
           data.qryLocationin.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
           data.qryLocationin.fieldbyname('Piecetasked').AsFloat     :=qryselect.fieldbyname('Quantity_set').AsFloat;
           data.qryLocationin.fieldbyname('PieceUOM').asstring       :=qryselect.fieldbyname('PieceUOM').asstring;
        end;
        data.qryLocationINItem.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
        data.qryLocationINItem.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
        strGetCd := qryselect.fieldbyname('SKUName').asstring;
        if qryselect.Fieldbyname('LotCode').asstring<>'' then
          data.qryLocationINItem.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
        Quantity:=qryselect.fieldbyname('Quantity').AsFloat;
        if Quantity=0 then Quantity:=1;
        if Quantity<>0 then
        begin
           data.qryLocationINItem.fieldbyname('Quantitytask').AsFloat    :=Quantity;
           if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
             data.qryLocationINItem.fieldbyname('Piecetask').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
           data.qryLocationINItem.fieldbyname('NetWeighttask').asFloat   :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationINItem.Fieldbyname('GrossWeighttask').asFloat :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationINItem.fieldbyname('Volumetask').asFloat      :=Quantity*qryselect.fieldbyname('VolumePro').AsFloat;
           data.qryLocationINItem.Fieldbyname('Areatask').asFloat        :=Quantity*qryselect.fieldbyname('AreaPro').AsFloat;

           if qryselect.Fieldbyname('Pro1').asFloat<>0 then
             data.qryLocationINItem.Fieldbyname('Casing1task').asFloat:=Quantity/qryselect.Fieldbyname('Pro1').asFloat;
           if qryselect.Fieldbyname('Pro2').asFloat<>0 then
             data.qryLocationINItem.Fieldbyname('Casing2task').asFloat:=Quantity/qryselect.Fieldbyname('Pro2').asFloat;
           if qryselect.Fieldbyname('Pro3').asFloat<>0 then
             data.qryLocationINItem.Fieldbyname('Casing3task').asFloat:=Quantity/qryselect.Fieldbyname('Pro3').asFloat;
           if qryselect.Fieldbyname('Pro4').asFloat<>0 then
             data.qryLocationINItem.Fieldbyname('Casing4task').asFloat:=Quantity/qryselect.Fieldbyname('Pro4').asFloat;
           if qryselect.Fieldbyname('Pro5').asFloat<>0 then
             data.qryLocationINItem.Fieldbyname('Casing5task').asFloat:=Quantity/qryselect.Fieldbyname('Pro5').asFloat;
        end;
        if qryselect.fieldbyname('QualityName').asstring<>'' then
           data.qryLocationINItem.fieldbyname('QualityName').asstring:=qryselect.fieldbyname('QualityName').asstring
        else
          data.qryLocationINItem.Fieldbyname('QualityName').asstring :=iif(CopyQuality<>'',CopyQuality,'正品');

        data.qryLocationINItem.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
        data.qryLocationINItem.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
        data.qryLocationINItem.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
        data.qryLocationINItem.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
        data.qryLocationINItem.Fieldbyname('AreaUOM').asstring     :=qryselect.Fieldbyname('AreaUOM').asstring          ;
        data.qryLocationINItem.fieldByname('shipcusid').AsString:=data.qryLocationin.fieldbyname('shipcusid').AsString;
        data.qryLocationINItem.fieldByname('shipcusname').AsString:=data.qryLocationin.fieldbyname('shipcusname').AsString;
        data.qryLocationINItem.Fieldbyname('PiecePro').AsFloat :=qryselect.Fieldbyname('PiecePro').AsFloat;
        data.qryLocationINItem.Fieldbyname('VolumePro').asFloat:=qryselect.Fieldbyname('VolumePro').asFloat;
        data.qryLocationINItem.Fieldbyname('AreaPro').asFloat  :=qryselect.Fieldbyname('AreaPro').asFloat;
        data.qryLocationINItem.Fieldbyname('netWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
           data.qryLocationINItem.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
        else
           data.qryLocationINItem.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        data.qryLocationINItem.fieldbyname('TagEachUOM').Asstring     :=qryselect.fieldbyname('TagEachUOM').Asstring;
//        data.qryLocationINItem.fieldbyname('tageachuompro').AsFloat   :=qryselect.fieldbyname('tageachuompro').AsFloat;
        data.qryLocationINItem.Fieldbyname('UOM1').asstring        :=qryselect.Fieldbyname('UOM1').asstring;
        data.qryLocationINItem.Fieldbyname('UOM2').asstring        :=qryselect.Fieldbyname('UOM2').asstring;
        data.qryLocationINItem.Fieldbyname('UOM3').asstring        :=qryselect.Fieldbyname('UOM3').asstring;
        data.qryLocationINItem.Fieldbyname('UOM4').asstring        :=qryselect.Fieldbyname('UOM4').asstring;
        data.qryLocationINItem.Fieldbyname('UOM5').asstring        :=qryselect.Fieldbyname('UOM5').asstring;
        data.qryLocationINItem.Fieldbyname('Pro1').asFloat   :=qryselect.Fieldbyname('Pro1').asFloat;
        data.qryLocationINItem.Fieldbyname('Pro2').asFloat   :=qryselect.Fieldbyname('Pro2').asFloat;
        data.qryLocationINItem.Fieldbyname('Pro3').asFloat   :=qryselect.Fieldbyname('Pro3').asFloat;
        data.qryLocationINItem.Fieldbyname('Pro4').asFloat   :=qryselect.Fieldbyname('Pro4').asFloat;
        data.qryLocationINItem.Fieldbyname('Pro5').asFloat   :=qryselect.Fieldbyname('Pro5').asFloat;

        data.qryLocationINItem.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
        data.qryLocationINItem.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
        data.qryLocationINItem.Fieldbyname('customerno').Asstring:=qryselect.fieldbyname('customerno').Asstring;
        data.qryLocationINItem.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;

        if (strSysCus='WYFQ') and  (data.qryLocationIn.FieldByName('shipcusname').AsString='') then
        begin
            OpenSql(dataTmp.qryTmp,' select alternateskuname from sku(nolock) where skuid="'+qryselect.Fieldbyname('skuid').asstring+'" ');
            data.qryLocationIn.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.Fieldbyname('alternateskuname').asstring;
        end;
   end;
end;

procedure TfrmLocationIN.QuantitytaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  if DataState in Setdcs then
  begin
    if StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText))<0 then
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
          extFirstNum:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
          grdLocationINItem.InplaceEditor.SetEditingText('0');
          blnFirst:=False;
          ErrorText:='为确保信息的正确性，请你再次输入！';
          Accept:=False;
          Exit;
       end else
       begin
          blnFirst:=True;
          if extFirstNum<>StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText)) then
          begin
             grdLocationINItem.InplaceEditor.SetEditingText('0');
             ErrorText:='两次输入数值不符，请重新输入！';
             Accept:=False;
             exit;
          end;
       end;
    end;
    //二次校验 过程结束
    //lzw20120628HFB取3位小数
    if _paper='T' then
    begin
       QuantityTaskOldValue:=KRound(data.qryLocationinItem.FieldByName('QuantityTask').AsFloat,3);
       strcostuom:=IIF(data.qryLocationinItem.FieldByName('CostUOMType').AsString='',
                       'piece',
                       data.qryLocationinItem.FieldByName('CostUOMType').AsString);
       data.qryLocationinItem.Edit;
       data.qryLocationinItem.FieldByName('QuantityTask').AsFloat:=KRound(StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText)),3);
       CountSKUQuantity(data.qryLocationinItem,QuantityTaskOldValue,'ITEM');
    end else
    begin
       QuantityTaskOldValue:=data.qryLocationinItem.FieldByName('QuantityTask').AsFloat;
       strcostuom:=IIF(data.qryLocationinItem.FieldByName('CostUOMType').AsString='',
                       'piece',
                       data.qryLocationinItem.FieldByName('CostUOMType').AsString);
       data.qryLocationinItem.Edit;
       data.qryLocationinItem.FieldByName('QuantityTask').AsFloat:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
       CountSKUQuantity(data.qryLocationinItem,QuantityTaskOldValue,'ITEM');
    end;


    //威扬
    if strSysCus='SZWY' then
    begin
       if data.qryLocationInItem.FieldByName('quantityshort').AsInteger<>0 then
          data.qryLocationInItem.FieldByName('casing5task').AsFloat:=Trunc(data.qryLocationInItem.FieldByName('quantitytask').AsFloat/data.qryLocationInItem.FieldByName('quantityshort').AsFloat)
       else
          data.qryLocationInItem.FieldByName('casing5task').AsFloat:=0;
    end;
    //lzw20101202
    if _StrSysCus='MT' then
    begin
       data.qryLocationInItem.FieldByName('costquantitytask').AsFloat:=round(data.qryLocationInItem.FieldByName('netweighttask').AsFloat);
    end;

    if UpperCase(strcostuom)='SNO' then
    begin
       data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('Price').AsFloat;
       data.qryLocationinItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationinItem.FieldByName('pricein').AsFloat;
       data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('carriage').AsFloat;
       data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('insurance').AsFloat;
    end else
    begin
       data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('Price').AsFloat;
       data.qryLocationinItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('pricein').AsFloat;
       data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('carriage').AsFloat;
       data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('insurance').AsFloat;
    end;
    Accept:=True;
  end;
end;


procedure TfrmLocationIN.grdLocationINItemExit(Sender: TObject);
begin
  With TDxDbgrid(sender) do
  begin
    try
      if DataLink.DataSet.State in [dsinsert,dsedit] then
      begin
        data.qryLocationinItem.Post;
      end;
    except
      Setfocus;
    raise;
    end;
  end;
end;

procedure TfrmLocationIN.piecetaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  if DataState in Setdcs then
  begin
    if StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText))<0 then
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
          extFirstNum:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
          grdLocationINItem.InplaceEditor.SetEditingText('0');
          blnFirst:=False;
          ErrorText:='为确保信息的正确性，请你再次输入！';
          Accept:=False;
          Exit;
       end else
       begin
          blnFirst:=True;
          if extFirstNum<>StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText)) then
          begin
             grdLocationINItem.InplaceEditor.SetEditingText('0');
             ErrorText:='两次输入数值不符，请重新输入！';
             Accept:=False;
             exit;
          end;
       end;
    end;
    //二次校验 过程结束
    QuantityTaskOldValue:=data.qryLocationinItem.FieldByName('Piecetask').AsFloat;
    data.qryLocationinItem.Edit;
    data.qryLocationinItem.FieldByName('Piecetask').AsFloat:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
    blnBLJS:=True;
    CountSKUPiece(data.qryLocationinItem,QuantityTaskOldValue,'task');
    blnBLJS:=False;
    //lzw20101202
    if _StrSysCus='MT' then
    begin
       data.qryLocationInItem.FieldByName('costquantitytask').AsFloat:=round(data.qryLocationInItem.FieldByName('netweighttask').AsFloat);
    end;

    if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString+'task')=UpperCase(piecetaskItem.FieldName) then
    begin
       data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('Piecetask').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('price').AsFloat;
       data.qryLocationinItem.FieldByName('SkuCostin').AsFloat:= data.qryLocationinItem.FieldByName('Piecetask').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('Pricein').AsFloat;
       data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('Piecetask').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('carriage').AsFloat;
       data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('Piecetask').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('insurance').AsFloat;

    end;
    Accept:=True;
  end;
end;

procedure TfrmLocationIN.grdLocationINItemEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryLocationInItem.IsEmpty=True) then
   begin
      mitAddLocItemClick(Sender);
   end;
end;

procedure TfrmLocationIN.grdLocationINItemChangeNodeEx(Sender: TObject);
begin
   data.qryLocationInDetail.Filtered:=false;
   if data.qryLocationInItem.fieldbyname('SNO').AsString<>'' then
      data.qryLocationInDetail.filter:='SNO='+data.qryLocationInItem.fieldbyname('SNO').AsString
   else
      data.qryLocationInDetail.filter:='SNO=-1';
   data.qryLocationInDetail.Filtered:=true;
   {if DataState in setdcs then
   begin
      //...处理状态
      if ActiveControl <> grdLocationINItem then Exit;
      //...
      if TdxDBGrid(Sender).DataSource.DataSet.State = dsBrowse then
      begin
         TdxDBGrid(Sender).DataSource.DataSet.Edit;
         TdxDBGrid(Sender).ShowEditor;
      end;
   end;}
end;

procedure TfrmLocationIN.cmbConsignAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if _StrSysCus<>'SHRL' then
      begin
         qrySelect:=pGetCustomerSelect('F','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
      end else
      begin
         qrySelect:=pGetCusChildSelect(data.qryLocationIn.FieldByname('costcusid').AsString,'');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            data.qryLocationIn.FieldByName('Routing').AsString  :=qrySelect.FieldByName('address').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.cmbConsignAccountIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationIN.cmbConsignAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (_ConCusInput='F') then //如果配置可以直接输入则不用校验
   begin
      if cmbConsignAccountID.Text='' then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('shipcusid').AsString:='';
         data.qryLocationIn.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',cmbConsignAccountID.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;  
end;

procedure TfrmLocationIN.cmbCarrierAccountIDButtonClick(Sender: TObject;
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
            data.qryLocationIn.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Driverid').asstring;
            data.qryLocationIn.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Drivername').asstring;
            data.qryLocationIn.FieldByName('carbrand').AsString  :=qrySelect.FieldByName('DriveCardNO').asstring;
            data.qryLocationIn.FieldByName('remark').AsString  :=qrySelect.FieldByName('Drivername').asstring+qrySelect.FieldByName('DriveCardNO').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end else
      begin
         qrySelect:=pGetCustomerSelect('D','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationIn.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationIN.cmbCarrierAccountIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationIN.cmbCarrierAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (_ConCusInput='F') then
   begin
      if cmbConsignAccountID.Text='' then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('carriercusid').AsString:='';
         data.qryLocationIn.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         if getSysdata('hxtext')='T' then
         begin
            qrySelect:=pGetDriverSelect('',cmbConsignAccountID.Text);
            if qrySelect.FieldByName('Driverid').AsString<>'NO' then
            begin
               data.qryLocationIn.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Driverid').asstring;
               data.qryLocationIn.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Drivername').asstring;
            end else failed:=true;
            FreeAndNil(qrySelect);
         end else
         begin
            qrySelect:=pGetCustomerSelect('D',cmbConsignAccountID.Text);
            if qrySelect.FieldByName('cusid').AsString<>'NO' then
            begin
               data.qryLocationIn.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
               data.qryLocationIn.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            end else failed:=true;
            FreeAndNil(qrySelect);
         end;
      end;
   end;
end;

procedure TfrmLocationIN.edtOPIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationIN.edtOPIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOPID.Text='' then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('opid').AsString:='';
         data.qryLocationIn.FieldByName('opname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(edtOPID.Text);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
            data.qryLocationIn.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationIN.edtIUserExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmLocationIN.edtIUserExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtIUser.Text='' then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('iuserid').AsString:='';
         data.qryLocationIn.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtIUser.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qryLocationIn.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qryLocationIn.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationIN.SKUNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  pt:TPoint;
  rect:TRect;
begin
  if DataState in Setdcs then
  begin
    if (data.qryLocationInItem.FieldByName('jobnoorder').AsString='') then
    begin
      rect:=grdLocationINItem.CellRect(grdLocationINItem.FocusedNode,SKUNameItem.Index);
      pt:=ClientToScreen(Point(rect.Left+grdLocationINItem.left+tbsSKU.left+tbsEdit.left,
          rect.Bottom +grdLocationINItem.Top +tbsSKU.Top +tbsEdit.Top +pgcLocationINOUT.Top
         +pgcMain.Top));
      ppmSKUTask.Popup(pt.x,pt.y);
    end else mitOrderSKUSelect.Click;
  end;
end;

procedure TfrmLocationIN.grdLocationINDetailExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
        if DataLink.DataSet.State in [dsinsert,dsedit] then
        begin
          data.qryLocationInDetail.Post;
        end;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmLocationIN.pgcLocationINOUTChange(Sender: TObject);
begin
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
   if (not blnAutoCost) and (pgcLocationINOUT.ActivePage=tbsAutoCost) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnAutoCost:=True;
   end;
end;

procedure TfrmLocationIN.grdLocationINChangeNodeEx(Sender: TObject);
begin
   ScrollAfterEdit:=True;
   blnSkuOpen:=False;
   blnAutoCost:=false;
   blnCasingOpen:=false;
//控制商品细目
   data.qryLocInSkuDetail.Close;

   if (pgcMain.ActivePage=tbsEdit) and (blnqryInChange) then
      SetDetailActive(True,True);
end;

procedure Tfrmlocationin.grdCasingBeforeinsert;
begin
   data.qryLocInItemCasing.Edit;
   data.qryLocInItemCasing.FieldByName('jobno').AsString:=data.qryLocationIn.FieldByName('jobno').asString;
   data.qryLocInItemCasing.FieldByName('sno').AsInteger:=-1;
   data.qryLocInItemCasing.FieldByName('costcountuomtype').AsString:='Volumetask';
   data.qryLocInItemCasing.FieldByName('currcd').AsString:=_currcd;
end;

procedure TfrmLocationIN.grdcasingExit(Sender: TObject);
begin
  With TDxDbgrid(sender) do
  begin
    try
      if DataLink.DataSet.State in [dsinsert,dsedit] then
      begin
        data.qryLocInItemCasing.Post;
      end;
    except
      Setfocus;
    raise;
    end;
  end;
end;

procedure TfrmLocationIN.grdcasingKeyDown(Sender: TObject; var Key: Word;
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
            if (Key = VK_DELETE) and (ssCtrl in Shift) then
            begin
               if uppercase(Name)='GRDCASING' then
                 mitdelLocINItemClick(sender);
               key:=0;
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationIN.PriceInCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   struomtype:string;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdCasing.InplaceEditor.GetEditingText='',0,grdCasing.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      struomtype:=data.qryLocInItemCasing.FieldByName('costuomtype').AsString;
      data.qryLocInItemCasing.Edit;
      data.qryLocInItemCasing.FieldByName('pricein').AsFloat:=StrToFloat(IIF(grdCasing.InplaceEditor.GetEditingText='',0,grdCasing.InplaceEditor.GetEditingText));
      data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:= data.qryLocInItemCasing.FieldByName('volumetask').AsFloat*
                                                                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
      Accept:=True;
   end;
end;

procedure TfrmLocationIN.PieceCasingValidate(Sender: TObject;
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
      data.qryLocInItemCasing.edit;      
      data.qryLocInItemCasing.FieldByName('Piecetask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(PieceCasing.FieldName) then
      begin
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('Piecetask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationIN.shipcusnameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (data.qryLocInItemCasing.FieldByName('quantitydoorder').AsFloat=0) then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocInItemCasing.Edit;
         data.qryLocInItemCasing.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocInItemCasing.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.ShipperCusNameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) and (data.qryLocInItemCasing.FieldByName('quantitydoorder').AsFloat=0) then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocInItemCasing.Edit;
         data.qryLocInItemCasing.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocInItemCasing.FieldByName('shippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         data.qryLocInItemCasing.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocInItemCasing.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         data.qryLocInItemCasing.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocInItemCasing.FieldByName('costcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.QualityNameCasingButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
      data.qryLocInItemCasing.edit;
      data.qryLocInItemCasing.FieldByName('QualityName').AsString
                    :=pGetqualitySelect('');
  end;
end;

procedure TfrmLocationIN.grdcasingEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if DataState in Setdcs then allow:=True;
end;

procedure TfrmLocationIN.mitAddLocItemClick(Sender: TObject);
begin
   if data.qryLocationin.FieldByName('operationname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该单已经产生上架,无法在本单增加任务!'
      else
         _strmessage:='该单已经产生上架,无法在本单增加任务!'; }
      KMessageDlg(GetMessage('frmLocationIN','056'),mtWarning,[mbyes],0);
      exit;
   end;
   grdLocationINItem.setfocus;
   data.qryLocationINItem.append;
   grdLocationINItemBeforeInsert;
end;

procedure TfrmLocationIN.mitdelLocINItemClick(Sender: TObject);
begin
   if data.qryLocationInItem.FieldByName('quantitydotask').AsFloat<>0 then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该笔已经产生出仓,不能删除!'
      else _strmessage:='该笔已经产生出仓,不能删除!'; }
      Kmessagedlg(GetMessage('frmLocationIN','022'),mtWarning,[mbyes], 0);
      exit;
   end;
   if not data.qryLocationInDetail.IsEmpty then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该笔已经产生上架,请先删除上架!'
      else _strmessage:='该笔已经产生上架,请先删除上架!'; }
      Kmessagedlg(GetMessage('frmLocationIN','016'),mtWarning,[mbyes], 0);
      exit;
   end;
   if data.qryLocationInItem.FieldByName('sno').AsInteger<>0 then

   if Sender<>mitMulDel then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;

   strDel_Task:=strDel_Task+' or SNO='+data.qryLocationInItem.fieldbyname('SNO').Asstring;
   if Pos('"'+data.qryLocationInItem.fieldbyname('skuid').AsString+'"',strTraySkuClassid)<>0 then
      Delete(strTraySkuClassid,
             Pos('"'+data.qryLocationInItem.fieldbyname('skuid').AsString+'"',strTraySkuClassid),
             Length(data.qryLocationInItem.fieldbyname('skuid').AsString)+3  //去后逗号
            );
   grdLocationINItem.setfocus;
   data.qryLocationInItem.delete;
end;

procedure TfrmLocationIN.mitItemClearClick(Sender: TObject);
begin
   if data.qrylocationIn.FieldByName('operationname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='已经有记录产生上架,无法清除!'
      else _strmessage:='已经有记录产生上架,无法清除!'; }
      KMessageDlg(GetMessage('frmLocationIN','057'),mtWarning,[mbyes],0);
      Exit;
   end;
   data.qryLocationInItem.DisableControls;
   data.qryLocationInItem.First;
   while not data.qryLocationInItem.Eof do
   begin
      data.qryLocationInItem.Delete;
   end;
   data.qryLocationInItem.EnableControls;
end;

procedure TfrmLocationIN.btnMergeClick(Sender: TObject);
var
   i,intsnocasing,casingcount:Integer;
   strshippid,strshippname,strqualityname,strjobnocasing,strskuname,
   strquantityuom,strpieceuom,strvolumeuom,strweightuom,strareauom:string;
   strshipcusid,strshipcusname:string;
   exquantity,exvolume,exarea,exnetweight,exgrossweight:Extended;
   blnhasCasing:Boolean;
   dtOperationdate:TDateTime;
begin
   if grdLocationINItem.SelectedCount=0 then
   begin
      {if _Language='CAPTIONC' then _strmessage:='请选定商品信息!'
      else _strmessage:='请选定商品信息!';        }
      KMessageDlg(GetMessage('frmLocationIN','058'),mtWarning,[mbyes],0);
      Exit;
   end;
   strshippname:='';
   exquantity:=0;
   exarea:=0;
   exvolume:=0;
   exnetweight:=0;
   exgrossweight:=0;
   casingcount:=0;
   intsnocasing:=0;
   strqualityname:='';
   blnhasCasing:=false;
   strjobnocasing:=data.qryIn.fieldbyname('jobno').AsString;
   for  i:=0  to grdLocationINItem.SelectedCount-1 do
   begin
      data.qryLocationInItem.GotoBookmark(Pointer(grdLocationINItem.selectedrows[i]));
      if (strshippname<>'') and  (strshippname<>data.qryLocationInItem.FieldByName('shippercusname').AsString) then
      begin
        { if _Language='CAPTIONC' then _strmessage:='只能打包同收货主的商品信息!'
         else _strmessage:='只能打包同收货主的商品信息'; }
         KMessageDlg(GetMessage('frmLocationIN','059'),mtWarning,[mbyes],0);
         exit;
      end;
      if i=0 then
      begin
         strskuname:=data.qryLocationInItem.FieldByName('skuname').AsString;
         strshippid:=data.qryLocationInItem.FieldByName('shippercusid').AsString;
         strshippname:=data.qryLocationInItem.FieldByName('shippercusname').AsString;
         strshipcusid:=data.qryLocationInItem.FieldByName('shipcusid').AsString;
         strshipcusname:=data.qryLocationInItem.FieldByName('shipcusname').AsString;
         dtOperationdate:=data.qryLocationInItem.FieldByName('operationdate').AsDateTime;
         strquantityuom:=data.qryLocationInItem.fieldbyname('quantityuom').asstring;
         strpieceuom:=data.qryLocationInItem.fieldbyname('pieceuom').AsString;
         strvolumeuom:=data.qryLocationInItem.fieldbyname('volumeuom').AsString;
         strweightuom:=data.qryLocationInItem.fieldbyname('weightuom').AsString;
         strareauom:=data.qryLocationInItem.fieldbyname('areauom').AsString;
      end;
      exquantity:=exquantity+data.qryLocationInItem.fieldbyname('quantitytask').AsFloat;
      exarea:=exarea+data.qryLocationInItem.fieldbyname('areatask').AsFloat;
      exvolume:=exvolume+data.qryLocationInItem.fieldbyname('volumetask').AsFloat;
      exnetweight:=exnetweight+data.qryLocationInItem.fieldbyname('netweighttask').AsFloat;
      exgrossweight:=exgrossweight+data.qryLocationInItem.fieldbyname('grossweighttask').AsFloat;
      if (strqualityname<>data.qrylocationinItem.fieldbyname('qualityname').AsString) then
      strqualityname:=strqualityname+data.qrylocationinItem.fieldbyname('qualityname').AsString;
      if (data.qryLocationInItem.FieldByName('snocasing').AsInteger<>-1) then
      begin
         blnhascasing:=true;
         if (intsnocasing<>data.qryLocationInItem.FieldByName('snocasing').AsInteger) and (intsnocasing<>0)
            then inc(casingcount);
         intsnocasing:=data.qryLocationInItem.FieldByName('snocasing').AsInteger;
      end;
      if (casingcount>1) then
      begin
         {if _Language='CAPTIONC' then _strmessage:='不同的已打包的商品数量大于1,无法覆盖,请先删打包信息中的商品'
         else _strmessage:='不同的已打包的商品数量大于1,无法覆盖,请先删打包信息中的商品'; }
         if KMessageDlg(GetMessage('frmLocationIN','060'),mtConfirmation,[mbyes,mbno],0)<>mryes then
         exit;
      end;
   end;
   if blnhasCasing=True then
   begin
      {if _Language='CAPTIONC' then _strmessage:='存在已经打包的商品,覆盖此条打包信息吗?'
      else _strmessage:='存在已经打包的商品,覆盖此条打包信息吗?'; }
      if KMessageDlg(GetMessage('frmLocationIN','061'),mtConfirmation,[mbyes,mbno],0)<>mryes then
      exit;
      data.qryLocationInItem.DisableControls;
      data.qryLocationInItem.First;
      while not data.qryLocationInItem.Eof do
      begin
         if data.qryLocationInItem.FieldByName('snocasing').AsInteger=intsnocasing then
         begin
            data.qryLocationInItem.Edit;
            data.qryLocationInItem.FieldByName('snocasing').AsInteger:=-1;
         end;
         data.qryLocationInItem.Next;
      end;
      data.qryLocationInItem.EnableControls;
   end;
   if data.qryLocInItemCasing.Active<>True then data.qryLocInItemCasing.Open;
   data.qryLocInItemCasing.DisableControls;
   if blnhasCasing=False then
   begin
      data.qryLocInItemCasing.Append;
      if grdcasing.FocusedNode=nil then
         maxLocInItemCasing:=maxLocInItemCasing+1;
      grdCasingBeforeinsert;
      data.qryLocInItemCasing.FieldByName('sno').AsInteger:=maxLocInItemCasing;      
   end else
   begin
    if data.qryLocInItemCasing.Locate('Jobno;sno',
                        VarArrayOf([strjobnocasing,intsnocasing]),
                        [loCaseInsensitive, loPartialKey]) then
      data.qryLocInItemCasing.Edit;
   end;
   data.qryLocInItemCasing.FieldByName('shippercusid').AsString  :=strshippid;
   data.qryLocInItemCasing.FieldByName('shippercusname').AsString:=strshippname;
   data.qryLocInItemCasing.FieldByName('shipcusid').AsString  :=strshipcusid;
   data.qryLocInItemCasing.FieldByName('shipcusname').AsString:=strshipcusname;
   data.qryLocInItemCasing.FieldByName('skuid').AsString:=strskuname;
   data.qryLocInItemCasing.FieldByName('cusname').AsString:=strshippname;
   data.qryLocInItemCasing.FieldByName('cusid').AsString  :=strshippid;
   data.qryLocInItemCasing.FieldByName('costcusname').AsString:=strshippname;
   data.qryLocInItemCasing.FieldByName('costcusid').AsString  :=strshippid;
   data.qryLocInItemCasing.FieldByName('piecetask').AsFloat:=1;
   data.qryLocInItemCasing.FieldByName('pieceuom').AsString  :=strpieceuom;
   data.qryLocInItemCasing.FieldByName('quantityuom').AsString  :=strquantityuom;
   data.qryLocInItemCasing.FieldByName('volumeuom').AsString  :=strvolumeuom;
   data.qryLocInItemCasing.FieldByName('weightuom').AsString  :=strweightuom;
   data.qryLocInItemCasing.FieldByName('areauom').AsString  :=strareauom;
   data.qryLocInItemCasing.FieldByName('quantitytask').AsFloat:=exquantity;
   data.qryLocInItemCasing.FieldByName('volumetask').AsFloat:=exvolume;
   data.qryLocInItemCasing.FieldByName('skucostin').AsFloat:=exvolume*data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
   data.qryLocInItemCasing.FieldByName('areatask').AsFloat:=exarea;
   data.qryLocInItemCasing.FieldByName('netweighttask').AsFloat:=exnetweight;
   data.qryLocInItemCasing.FieldByName('grossweighttask').AsFloat:=exgrossweight;
   data.qryLocInItemCasing.FieldByName('operationdate').AsDateTime:=
       iif(dtOperationdate<>0,dtOperationdate,GetServerDate);
   data.qryLocInItemCasing.FieldByName('qualityname').AsString:=strqualityname;
   data.qryLocInItemCasing.FieldByName('costuomtype').AsString:='volumetask';
   data.qryLocInItemCasing.Post;
   intsnocasing:=data.qryLocInItemCasing.fieldbyname('sno').AsInteger;
   data.qryLocInItemCasing.EnableControls;
   for  i:=0  to grdLocationINItem.SelectedCount-1 do
   begin
      data.qryLocationInItem.GotoBookmark(Pointer(grdLocationINItem.selectedrows[i]));
      data.qryLocationInItem.edit;
      data.qryLocationInItem.FieldByName('snocasing').AsInteger:=intsnocasing;
   end;
end;

procedure TfrmLocationIN.VolumeCasingValidate(Sender: TObject;
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
      data.qryLocInItemCasing.Edit;
      data.qryLocInItemCasing.FieldByName('volumetask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(VolumeCasing.FieldName) then
      begin
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('volumetask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
      end;
   end;
end;

procedure TfrmLocationIN.QuantityCasingValidate(Sender: TObject;
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
      data.qryLocInItemCasing.edit;
      data.qryLocInItemCasing.FieldByName('Quantitytask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(QuantityCasing.FieldName) then
      begin
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('Quantitytask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;

      end;
   end;
end;

procedure TfrmLocationIN.mitcasingClick(Sender: TObject);
begin
   if not blncasing then
   begin
      grdLocationINItem.OptionsBehavior:=grdLocationINItem.OptionsBehavior+[edgomultiselect];
      btnMerge.Visible:=True;
      blncasing:=true;
      {if _Language='CAPTIONC' then _strmessage:='退出打包'
      else _strmessage:='退出打包';}
      mitcasing.Caption:=GetMessage('frmLocationIN','062');
   end else
   begin
      grdLocationINItem.OptionsBehavior:=grdLocationINItem.OptionsBehavior-[edgomultiselect];
      btnMerge.Visible:=false;
      blncasing:=false;
      {if _Language='CAPTIONC' then _strmessage:='进入打包'
      else _strmessage:='进入打包'; }
      mitcasing.Caption:=GetMessage('frmLocationIN','063');
   end;
end;

procedure TfrmLocationIN.mitdetailclearClick(Sender: TObject);
begin
   if grdLocationOutDetailReadOnly then Exit;
   data.qryLocationInDetail.DisableControls;
   data.qryLocationInDetail.First;
   while not data.qryLocationInDetail.Eof do
   data.qryLocationInDetail.Delete;
   data.qryLocationInDetail.EnableControls;
end;

procedure TfrmLocationIN.CostCusidItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryLocationInItem.edit;
         data.qryLocationInItem.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationInitem.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         blnSelect:=True;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationIN.priceItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationinItem.Edit;
      strcostuom:=data.qryLocationinItem.fieldbyname('costuomtype').AsString;
      data.qryLocationinItem.FieldByName('price').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:=data.qryLocationinItem.FieldByName('price').AsFloat
      else
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                data.qryLocationinItem.FieldByName('price').AsFloat;
   end;
end;

procedure TfrmLocationIN.priceinIItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationinItem.Edit;
      strcostuom:=data.qryLocationinItem.fieldbyname('costuomtype').AsString;      
      data.qryLocationinItem.FieldByName('priceIn').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:=data.qryLocationinItem.FieldByName('priceIn').AsFloat
      else
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:=
                                     data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                     data.qryLocationinItem.FieldByName('priceIn').AsFloat;
    end;
end;

procedure TfrmLocationIN.CostUOMTypeItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      strcostuom:=CostUOMTypeItem.ItemFields.Strings[sltCostUomItem.indexof(grdLocationINItem.InplaceEditor.GetEditingText)];
      data.qryLocationinItem.Edit;
      OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,pricein,price,Currcd '
                            +'  from skuprice (nolock) '
                            +' where convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryLocationIn.fieldbyname('taskdate').asdatetime)+'"'
                            +'   and skuid="'+data.qryLocationInItem.fieldbyname('skuid').AsString+'"'
                            +'   and uomtype="'+strcostuom+'"'
                            +'   and userid like "'+_Userid+'%"'
             );
      data.qryLocationINItem.Fieldbyname('costuomtype').asstring  :=strcostuom;
      data.qryLocationINItem.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
      data.qryLocationInItem.FieldByName('pricein').AsFloat:=dataTmp.qryTmp.fieldbyname('pricein').AsFloat;
      data.qryLocationInItem.FieldByName('price').AsFloat:=dataTmp.qryTmp.fieldbyname('price').AsFloat;
      data.qryLocationInItem.FieldByName('carriage').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
      data.qryLocationInItem.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      if UpperCase(strcostuom)='SNO' then
      begin
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationInItem.FieldByName('carriagetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
         data.qryLocationInItem.FieldByName('insurancetotal').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end else
      begin
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                                                       data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationInItem.FieldByName('carriagetotal').AsFloat:=data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                           dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
         data.qryLocationInItem.FieldByName('insurancetotal').AsFloat:=data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                           dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
      end;
   end;
end;

procedure TfrmLocationIN.VolumetaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('Volumetask').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString+'task')=UpperCase(VolumetaskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('carriage').AsFloat;
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('Volumetask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('insurance').AsFloat;

      end
   end;
end;

procedure TfrmLocationIN.areataskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationInItem.FieldByName('areatask').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString+'task')=UpperCase(areataskItem.FieldName) then
      begin
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('carriage').AsFloat;
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('areatask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('insurance').AsFloat;

      end
   end;
end;

procedure TfrmLocationIN.grossweighttaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;

      if _StrSysCus='HQWL' then
      begin
         QuantityTaskOldValue:=data.qryLocationinItem.FieldByName('grossweighttask').AsFloat;
         data.qryLocationinItem.Edit;
         data.qryLocationinItem.FieldByName('grossweighttask').AsFloat:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUgrossweight(data.qryLocationinItem,QuantityTaskOldValue,'task');
         blnBLJS:=False;
      end else
      begin
         data.qryLocationinItem.Edit;
         data.qryLocationInItem.FieldByName('grossweighttask').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      end;
      
      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString+'task')=UpperCase(grossweighttaskItem.FieldName) then
      begin
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('carriage').AsFloat;
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('grossweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('insurance').AsFloat;

      end
   end;
end;

procedure TfrmLocationIN.netweighttaskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
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
            extFirstNum:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
            grdLocationINItem.InplaceEditor.SetEditingText('0');
            blnFirst:=False;
            ErrorText:='为确保信息的正确性，请你再次输入！';
            Accept:=False;
            Exit;
         end else
         begin
            blnFirst:=True;
            if extFirstNum<>StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText)) then
            begin
               grdLocationINItem.InplaceEditor.SetEditingText('0');
               ErrorText:='两次输入数值不符，请重新输入！';
               Accept:=False;
               exit;
            end;
         end;
      end;
       //二次校验 过程结束
      if _StrSysCus='HQWL' then
      begin
         QuantityTaskOldValue:=data.qryLocationinItem.FieldByName('netweighttask').AsFloat;
         data.qryLocationinItem.Edit;
         data.qryLocationinItem.FieldByName('netweighttask').AsFloat:=StrToFloat(IIF(grdLocationINItem.InplaceEditor.GetEditingText='',0,grdLocationINItem.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qryLocationinItem,QuantityTaskOldValue,'task');
         blnBLJS:=False;
      end else
      begin
         data.qryLocationinItem.Edit;
         data.qryLocationInItem.FieldByName('netweighttask').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      end;
      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString+'task')=UpperCase(netweighttaskItem.FieldName) then
      begin
         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
         data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:= data.qryLocationinItem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('carriage').AsFloat;
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:= data.qryLocationinItem.FieldByName('netweighttask').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('insurance').AsFloat;
      end
   end;
end;

//=================断开数据源＝＝＝＝＝＝＝＝＝＝＝＝＝//
procedure TfrmLocationin.SetMasterDetailState(blnConnect:Boolean);
begin
   data.qryLocationin.DataSource       :=nil;
   data.qryLocationinItem.DataSource   :=nil;
   data.qryLocationinDetail.DataSource :=nil;
   data.qryLocinItemCasing.DataSource  :=nil;
   data.qryautocountcostin.DataSource  :=nil;
   data.qryLocInSkuDetail.DataSource   :=nil;
end;

procedure TfrmLocationIN.delCasingClick(Sender: TObject);
var
   intsno :Integer;
begin
   if data.qryLocInItemCasing.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      intsno:=data.qryLocInItemCasing.FieldByName('sno').AsInteger;
      data.qryLocationInItem.DisableControls;
      data.qryLocationInItem.First;
      while not data.qryLocationInItem.Eof do
      begin
         if data.qryLocationInItem.FieldByName('snocasing').AsInteger=intsno then
         begin
            data.qryLocationInItem.Edit;
            data.qryLocationInItem.FieldByName('snocasing').AsInteger:=-1;
         end;
         data.qryLocationInItem.Next;
      end;
      data.qryLocationInItem.EnableControls;
      data.qryLocInItemCasing.delete;
   end;
end;

procedure TfrmLocationIN.ShipcusNameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationInItem.Edit;
         data.qryLocationInItem.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationInItem.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.grdAutoCostBeforeInsert;
begin
   data.qryautocountcostin.FieldByName('sno').AsInteger:=-1;
   data.qryautocountcostin.FieldByName('jobno').asstring:=data.qryin.fieldbyname('jobno').asstring;
   data.qryautocountcostin.fieldByname('rateuomtype').AsString  :=iif(strCostCountUOMType<>'',strCostCountUOMType,'piece');
   data.qryautocountcostin.fieldByname('countway').asString:='散装';
   data.qryautocountcostin.FieldByName('isincome').AsString:='T';
   data.qryautocountcostin.FieldByName('ismainrate').AsString:='F';
end;

procedure TfrmLocationIN.mitCostdelClick(Sender: TObject);
begin
   if data.qryautocountcostin.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdAutoCost.SetFocus;
      data.qryautocountcostin.Delete;
   end;
end;

procedure TfrmLocationIN.mitCostAddClick(Sender: TObject);
begin
   grdAutoCost.setfocus;
   data.qryautocountcostin.append;
   grdAutoCostBeforeInsert;
end;

procedure TfrmLocationIN.grdAutoCostKeyDown(Sender: TObject; var Key: Word;
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
            if (Key = VK_DELETE) and (ssCtrl in Shift) then
            begin
               if uppercase(Name)='GRDAUTOCOST' then
                 mitCostdelClick(sender);
               key:=0;
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationIN.grdAutoCostExit(Sender: TObject);
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

procedure TfrmLocationIN.grdAutoCostEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryautocountcostin.IsEmpty=True) then
   begin
      mitCostAddClick(Sender);
   end;
end;

procedure TfrmLocationIN.loadgroupcusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationInItem.FieldByName('loadgroupcusname').AsString
                                <>grdLocationINItem.InplaceEditor.GetEditingText then
      begin
        { if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationIN','064');
         Accept:=False;
         exit;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationInItem.edit;
      data.qryLocationInItem.FieldByName('loadgroupcusid').AsString:='';
      data.qryLocationInItem.FieldByName('loadgroupcusname').AsString:='';
   end;
end;

procedure TfrmLocationIN.grdCostCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostin.edit;
         data.qryautocountcostin.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostin.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationIN.forkgroupcusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationInItem.FieldByName('forkgroupcusname').AsString
                                <>grdLocationINItem.InplaceEditor.GetEditingText then
      begin
        { if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';   }
         ErrorText:=GetMessage('frmLocationIN','064');
         Accept:=False;
         exit;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationInItem.edit;
      data.qryLocationInItem.FieldByName('forkgroupcusid').AsString:='';
      data.qryLocationInItem.FieldByName('forkgroupcusname').AsString:='';
   end;
end;

procedure TfrmLocationIN.liftmachinecusnameItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationInItem.FieldByName('liftmachinecusname').AsString
                                <>grdLocationINItem.InplaceEditor.GetEditingText then
      begin
         {if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationIN','064');
         Accept:=False;
         exit;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationInItem.edit;
      data.qryLocationInItem.FieldByName('liftmachinecusid').AsString:='';
      data.qryLocationInItem.FieldByName('liftmachinecusname').AsString:='';
   end;
end;

procedure TfrmLocationIN.grdRateCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostin.edit;
         data.qryautocountcostin.FieldByName('ratecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostin.FieldByName('ratecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationIN.GrossWeightCasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(IIF(grdCasing.InplaceEditor.GetEditingText='',0,grdCasing.InplaceEditor.GetEditingText))<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(GrossWeightCasing.FieldName) then
      begin
         data.qryLocInItemCasing.Edit;
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('GrossWeighttask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
      end;
   end;
end;

procedure TfrmLocationIN.NetWeightCasingValidate(Sender: TObject;
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
      data.qryLocInItemCasing.Edit;
      data.qryLocInItemCasing.FieldByName('NetWeighttask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(NetWeightCasing.FieldName) then
      begin
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('NetWeighttask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
      end;
   end;
end;

procedure TfrmLocationIN.AreaTaskCasingValidate(Sender: TObject;
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
      data.qryLocInItemCasing.Edit;
      data.qryLocInItemCasing.FieldByName('AreaTask').AsFloat:=StrToFloat(grdCasing.InplaceEditor.GetEditingText);
      if UpperCase(data.qryLocInItemCasing.fieldbyname('costuomtype').AsString)=UpperCase(AreaTaskCasing.FieldName) then
      begin
         data.qryLocInItemCasing.FieldByName('SkuCostin').AsFloat:=
                      data.qryLocInItemCasing.FieldByName('AreaTask').AsFloat*
                      data.qryLocInItemCasing.FieldByName('pricein').AsFloat;
      end;
   end;
end;

procedure TfrmLocationIN.costuomtypecasingValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   strcostuom:string;
begin
   if DataState in Setdcs then
   begin
      strcostuom:=costuomtypecasing.ItemFields.Strings
                                  [costuomtypecasing.Items.indexof(grdcasing.InplaceEditor.GetEditingText)];
      data.qryLocInItemCasing.Edit;
      data.qryLocInItemCasing.FieldByName('costuomtype').AsString:=strcostuom;
      data.qryLocInItemCasing.FieldByName('skucostin').asfloat:=
                         data.qryLocInItemCasing.fieldbyname('pricein').asfloat*
                         data.qryLocInItemCasing.fieldbyname(strcostuom).AsFloat;
   end;
end;

procedure TfrmLocationIN.grdcasingDblClick(Sender: TObject);
var
   jsPiece,jsVolume,jsHeight,jsWidth,jsDepth:extended;
   jsSizeUOM,jsVolueUOM:string;
begin
   if UpperCase(grdcasing.Columns[grdcasing.GetFocusedAbsoluteIndex(grdcasing.FocusedColumn)].FieldName)='VOLUMETASK'
   then
   begin
      jsPiece   :=data.qryLocInItemCasing.FieldByName('piecetask').AsFloat;
      jsHeight  :=data.qryLocInItemCasing.FieldByName('Height').AsFloat;
      jsWidth   :=data.qryLocInItemCasing.FieldByName('Width').AsFloat;
      jsDepth   :=data.qryLocInItemCasing.FieldByName('Depth').AsFloat;
      jsVolume  :=data.qryLocInItemCasing.FieldByName('volumetask').AsFloat;
      jsVolueUOM:=data.qryLocInItemCasing.FieldByName('VolumeUOM').AsString;
      while WorkVolume(jsPiece,jsHeight,jsWidth,jsDepth,jsVolume,jsSizeUOM,jsVolueUOM,iif(DataState=stBrowse,'True','False')) and
      (DataState in Setdcs) do
      begin
         data.qryLocInItemCasing.Edit;
         data.qryLocInItemCasing.FieldByName('Height').AsFloat    :=jsHeight;
         data.qryLocInItemCasing.FieldByName('Width').AsFloat     :=jsWidth;
         data.qryLocInItemCasing.FieldByName('Depth').AsFloat     :=jsDepth;
         data.qryLocInItemCasing.FieldByName('volumetask').AsFloat    :=jsVolume;
         data.qryLocInItemCasing.FieldByName('VolumeUOM').AsString:=jsVolueUOM;
         exit;
      end;
   end;
end;

procedure TfrmLocationIN.casing1taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('casing1task').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString)=UpperCase(casing1taskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('casing1task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('casing1task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationIN.casing2taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('casing2task').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString)=UpperCase(casing2taskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('casing2task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('casing2task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationIN.casing3taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('casing3task').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString)=UpperCase(casing3taskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('casing3task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('casing3task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationIN.casing4taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('casing4task').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString)=UpperCase(casing4taskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('casing4task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('casing4task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationIN.casing5taskItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      data.qryLocationinItem.Edit;
      data.qryLocationinItem.FieldByName('casing5task').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);

      if UpperCase(data.qryLocationInItem.fieldbyname('costuomtype').AsString)=UpperCase(casing5taskItem.FieldName) then
      begin

         data.qryLocationinItem.FieldByName('SkuCostIn').AsFloat:= data.qryLocationinItem.FieldByName('casing5task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('priceIn').AsFloat;
         data.qryLocationinItem.FieldByName('SkuCost').AsFloat:= data.qryLocationinItem.FieldByName('casing5task').AsFloat*
                                                                         data.qryLocationinItem.FieldByName('price').AsFloat;
      end
   end;
end;

procedure TfrmLocationIN.mitAddLocationINOUTDetailClick(Sender: TObject);
begin
   if (data.qryLocationInItem.IsEmpty) or (grdLocationOutDetailReadOnly) then exit;
   grdLocationINDetail.setfocus;
   data.qryLocationinDetail.append;
   grdLocationINDetailBeforeInsert;
end;

procedure TfrmLocationIN.checknull;
   procedure setvalue(pstrfield:string);
   begin
      if data.qryLocationIn.FieldByName(pstrfield).AsString='' then
      begin
         data.qryLocationIn.FieldByName(pstrfield).AsString:='F';
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

procedure TfrmLocationIN.btnCostRateClick(Sender: TObject);
begin
   WorkWareRateView('IN',data.qryIn.fieldbyname('jobno').AsString);
end;

procedure TfrmLocationIN.mitAddAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','067'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能用该模式新增计费条目！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qryLocationIn.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能新增条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   pGetAutoCost(data.qryIn.FieldByName('jobno').AsString,'0','仓储');
   data.qryautocountcostin.Close;
   data.qryautocountcostin.Open;
end;

procedure TfrmLocationIN.mitUpdAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','065'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能修改！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qryLocationIn.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能修改条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   pGetAutoCost(data.qryautocountcostin.FieldByName('jobno').AsString,data.qryautocountcostin.FieldByName('sno').AsString,'仓储');
   data.qryautocountcostin.Close;
   data.qryautocountcostin.Open;
end;

procedure TfrmLocationIN.mitDelAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','066'), mtInformation,[mbOk],0); //'该资料不是您输入的，不能删除！'
     exit;
   end;}
   if _StrSysCus='DHA' then
   begin
      if data.qryLocationIn.FieldByName('checkname').AsString<>'' then
      begin
         KMessageDlg('该单已经审核，不能删除条目！',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   if KmessageDlg(_strdel, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
      ExecSql(dataTmp.qryTmp,' delete from autocountcost  '+
                             ' where Jobno="'+data.qryautocountcostin.FieldByName('Jobno').AsString+'"  '+
                             '   and sno="'+data.qryautocountcostin.FieldByName('Sno').AsString+'" ');
      data.qryautocountcostin.close;
      data.qryautocountcostin.Open;
   end;
end;

procedure TfrmLocationIN.grdAutoCostEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      with grdAutoCost do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COUNTWAY') then
         begin
            if data.qryautocountcostin.FieldByName('ismainrate').asstring='T' then
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

procedure TfrmLocationIN.grdIsMainRateCostChange(Sender: TObject);
begin
   data.qryautocountcostin.edit;
   data.qryautocountcostin.FieldByName('ismainrate').asstring:=IIF(data.qryautocountcostin.FieldByName('ismainrate').asstring='T','F','T');
   if data.qryautocountcostin.FieldByName('ismainrate').asstring='F'then
   begin
      if grdCountway.Items.IndexOf('散装')=-1 then
//      Countway.Items.add('散装');
      grdCountway.Items.Insert(1,'散装');
   end else
   begin
      data.qryautocountcostin.FieldByName('countway').asstring:='柜装';
      if grdCountway.Items.IndexOf('散装')<>-1 then
      grdCountway.Items.Delete(grdCountway.Items.IndexOf('散装'));
   end;
end;

procedure TfrmLocationIN.carriageitemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationinItem.Edit;
      strcostuom:=data.qryLocationinItem.fieldbyname('costuomtype').AsString;
      data.qryLocationinItem.FieldByName('carriage').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
        data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:=data.qryLocationinItem.FieldByName('carriage').AsFloat
      else
        data.qryLocationinItem.FieldByName('carriagetotal').AsFloat:=
                                    data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                    data.qryLocationinItem.FieldByName('carriage').AsFloat;
    end;
end;

procedure TfrmLocationIN.insuranceItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      data.qryLocationinItem.Edit;
      strcostuom:=data.qryLocationinItem.fieldbyname('costuomtype').AsString;
      data.qryLocationinItem.FieldByName('insurance').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
      if UpperCase(strcostuom)='SNO' then
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:=data.qryLocationinItem.FieldByName('insurance').AsFloat
      else
         data.qryLocationinItem.FieldByName('insurancetotal').AsFloat:=
                                     data.qryLocationinItem.FieldByName(strcostuom+'task').AsFloat*
                                     data.qryLocationinItem.FieldByName('insurance').AsFloat;
    end;
end;

procedure TfrmLocationIN.mitinwareClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstpara.Add('Locationbillno='+data.qrylocationin.FieldByname('Locationbillno').AsString);
   lstpara.Add('Remark='+data.qryLocationIn.FieldByname('Remark').AsString);
//   lstpara.Add('loadgroupcusname='+data.qryLocationIn.FieldByname('loadgroupcusname').AsString);
   lstpara.Add('opname='+data.qryLocationIn.FieldByname('opname').AsString);
   lstpara.Add('kdr='+_loginname);
   GenInformations(lstPara);


   OpenSql(dataTmp.qryTmp,'select detail.jobno,detail.Locationbillno, '+chr(13)+chr(10)
                         +'       detail.ShippercusName,detail.skuname,'+chr(13)+chr(10)
                         +'       quantity=detail.quantity,'+chr(13)+chr(10)
                         +'       year=substring(Convert(char(8),detail.OperationDate,112),1,4),'+chr(13)+chr(10)
                         +'       month=substring(Convert(char(8),detail.OperationDate,112),5,2),'+chr(13)+chr(10)
                         +'       day=substring(Convert(char(8),detail.OperationDate,112),7,2),'+chr(13)+chr(10)
                         +'       Quantitytask=item.Quantitytask,'+chr(13)+chr(10)
                         +'       grossweight=detail.grossweight, '+chr(13)+chr(10)
                         +'       volume=detail.volume,  '+chr(13)+chr(10)
                         +'       QuantityUOM=detail.QuantityUOM  '+chr(13)+chr(10)
                         +'  from locationindetail detail(nolock),locationinitem item(nolock)  '+chr(13)+chr(10)
                         +' where detail.Locationbillno=item.Locationbillno   '+chr(13)+chr(10)
                         +'   and detail.Locationbillno="'+data.qryLocationIn.FieldByname('Locationbillno').AsString+'" '+chr(13)+chr(10)
                         );
   Worklinprint('900011','old','进货单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationIN.tallycusiditemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('M','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationinItem.Edit;
         data.qryLocationinItem.FieldByName('tallycusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationinItem.FieldByName('tallycusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.tallycusiditemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      if data.qryLocationInItem.FieldByName('tallycusname').AsString
                                <>grdLocationINItem.InplaceEditor.GetEditingText then
      begin
        { if _Language='CAPTIONC' then _strmessage:='无效的输入值!'
         else _strmessage:='无效的输入值!';}
         ErrorText:=GetMessage('frmLocationIN','064');
         Accept:=False;
         exit;
      end;
   end else
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText='') then
   begin
      data.qryLocationInItem.edit;
      data.qryLocationInItem.FieldByName('tallycusid').AsString:='';
      data.qryLocationInItem.FieldByName('tallycusname').AsString:='';
   end;
end;

procedure TfrmLocationIN.CountSKUPiece(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
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
{
      if (FieldByName('Piece'+strtask).AsFloat<>0) then
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
      end else
      if (OldValue<>0) and blnBLJS then
      begin
//         if Kmessagedlg('你确定要更改商品数量吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
//         begin
           FieldByName('Quantity'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                               *FieldByName('Quantity'+strtask).AsFloat
                                               /oldValue;
//         end;
      end;
}
      if (strtask<>'ITEM') and (getSysdata('qdtext')='T') then
      begin
        FieldByName('quantity').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('quantity').AsFloat
                                             /oldValue;
        FieldByName('Volume').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('Volume').AsFloat
                                             /oldValue;
        FieldByName('Area').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('Area').AsFloat
                                             /oldValue;
        FieldByName('NetWeight').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('NetWeight').AsFloat
                                             /oldValue;
        FieldByName('GrossWeight').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('GrossWeight').AsFloat
                                             /oldValue;
        FieldByName('costquantity').AsFloat:=FieldByName('Piece').AsFloat
                                             *FieldByName('costquantity').AsFloat
                                             /oldValue;
      end else
      begin
         if (FieldByName('Piece'+strtask).AsFloat*FieldByName('piecepro').AsFloat)<>0 then
            FieldByName('Quantity'+strtask).AsFloat
                 :=FieldByName('Piece'+strtask).AsFloat*FieldByName('PiecePro').AsFloat
         else
            if (OldValue<>0) and blnBLJS then
               FieldByName('quantity'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                    *FieldByName('quantity'+strtask).AsFloat
                                                    /oldValue;

         //体积
         if (FieldByName('Piece'+strtask).AsFloat*FieldByName('VolumePro').AsFloat)<>0 then
             FieldByName('Volume'+strtask).AsFloat
                :=FieldByName('Piece'+strtask).AsFloat*FieldByName('VolumePro').AsFloat
         else
            if (OldValue<>0) and blnBLJS then
               FieldByName('Volume'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                    *FieldByName('Volume'+strtask).AsFloat
                                                    /oldValue;
         //面积
         if (FieldByName('Piece'+strtask).AsFloat*FieldByName('AreaPro').AsFloat)<>0 then
            FieldByName('Area'+strtask).AsFloat
                    :=FieldByName('Piece'+strtask).AsFloat*FieldByName('AreaPro').AsFloat
         else
           if (OldValue<>0) and blnBLJS then
           FieldByName('Area'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                *FieldByName('Area'+strtask).AsFloat
                                                /oldValue;
         //净重
         if (FieldByName('Piece'+strtask).AsFloat*FieldByName('NetWeightPro').AsFloat)<>0 then
            FieldByName('NetWeight'+strtask).AsFloat
                  :=FieldByName('Piece'+strtask).AsFloat*FieldByName('NetWeightPro').AsFloat
         else
           if (OldValue<>0) and blnBLJS then
           FieldByName('NetWeight'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                *FieldByName('NetWeight'+strtask).AsFloat
                                                /oldValue;
         //毛重
         if (FieldByName('Piece'+strtask).AsFloat*FieldByName('GrossWeightPro').AsFloat)<>0 then
            FieldByName('GrossWeight'+strtask).AsFloat
                  :=FieldByName('Piece'+strtask).AsFloat*FieldByName('GrossWeightPro').AsFloat
         else
           if (OldValue<>0) and blnBLJS then
           FieldByName('GrossWeight'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                *FieldByName('GrossWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('Piece'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmLocationIN.mitalterskuproClick(Sender: TObject);
var
   expiecepro:Extended;
   exvolumepro:Extended;
   exweightpro:Extended;
   exareapro:Extended;
begin
   if (DataState in Setdcs) and (data.qryLocationInItem.FieldByName('skuid').AsString<>'') then
   begin
      if Kmessagedlg('你确定要更改商品比例关系吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
         expiecepro:=KRound(data.qryLocationInItem.fieldbyname('quantitytask').AsFloat
                       /data.qryLocationInItem.fieldbyname('piecetask').AsFloat,4);
         exvolumepro:=KRound(data.qryLocationInItem.fieldbyname('volumetask').AsFloat
                       /data.qryLocationInItem.fieldbyname('piecetask').AsFloat,4);
         exweightpro:=KRound(data.qryLocationInItem.fieldbyname('netweighttask').AsFloat
                       /data.qryLocationInItem.fieldbyname('piecetask').AsFloat,4);
         exareapro:=KRound(data.qryLocationInItem.fieldbyname('areatask').AsFloat
                       /data.qryLocationInItem.fieldbyname('piecetask').AsFloat,4);
         ExecSql(dataTmp.qryTmp,'update sku '
                               +'   set piecepro='+floattostr(expiecepro)+','
                               +'       volumepro='+floattostr(exvolumepro)+','
                               +'       weightpro='+floattostr(exweightpro)+','
                               +'       areapro='+floattostr(exareapro)
                               +'where sku.skuid="'+data.qryLocationInItem.fieldbyname('skuid').AsString+'"'
                );
         data.qryLocationInItem.Edit;
         data.qryLocationInitem.FieldByName('piecepro').AsFloat:=expiecepro;
         data.qryLocationInitem.FieldByName('volumepro').AsFloat:=exvolumepro;
         data.qryLocationInitem.FieldByName('netweightpro').AsFloat:=exweightpro;
         data.qryLocationInitem.FieldByName('grossweightpro').AsFloat:=exweightpro;
         data.qryLocationInitem.FieldByName('areapro').AsFloat:=exareapro;
      end;
   end;
end;

procedure TfrmLocationIN.OPERATIONDATEDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   operationdate:TDateTime;
begin
   if (DataState in Setdcs) and (grdLocationINDetail.InplaceEditor.GetEditingText<>'')then
   begin
      operationdate:=strtodate(Copy(grdLocationINDetail.InplaceEditor.GetEditingText,1,10));
      if operationdate<StrToDate(dtdTaskDate.Text) then
      begin
         ErrorText:=GetMessage('frmlocationin','068');
         Accept:=False;
         exit;
      end;
      data.qryLocationInDetail.Edit;
      data.qryLocationInDetail.FieldByName('operationdate').AsString:=grdLocationINDetail.InplaceEditor.GetEditingText;
      if operationdate<StrToDate(dtdOperationDate.Text) then
      begin
         data.qryLocationIn.Edit;
         data.qryLocationIn.FieldByName('operationdate').AsString:=grdLocationINDetail.InplaceEditor.GetEditingText;
      end;
   end;
end;

procedure TfrmLocationIN.grdLocationINDetailChangeNodeEx(Sender: TObject);
begin
   data.qryLocInSkuDetail.Filtered:=false;
   if data.qryLocationInDetail.fieldbyname('ldsno').AsString<>'' then
      data.qryLocInSkuDetail.filter:='ldsno='+data.qryLocationInDetail.fieldbyname('ldsno').AsString+' and sno='+data.qryLocationInDetail.fieldbyname('sno').AsString
   else
      data.qryLocInSkuDetail.filter:='ldsno=-1';
   data.qryLocInSkuDetail.Filtered:=true;
   //lzw20100728
   {if DataState in setdcs then
   begin
      //...处理状态
      if ActiveControl <> grdLocationINDetail then Exit;
      //...
      if TdxDBGrid(Sender).DataSource.DataSet.State = dsBrowse then
      begin
         TdxDBGrid(Sender).DataSource.DataSet.Edit;
         TdxDBGrid(Sender).ShowEditor;
      end;
   end;}
end;

procedure TfrmLocationIN.GetCusCnfg;
var
   qryselect:TKADOQuery;
begin
   if DataState=stedit then
   begin
      OpenSql(datatmp.qryTmp,'select RateName,CountComplete '
                    +'  from cost(nolock) '
                    +' where jobno="'+data.qryLocationin.FieldByName('Jobno').AsString+'"' );
      if trim(datatmp.qryTmp.FieldByName('RateName').AsString)<>'' then
      begin
        { if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
         else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'; }
         kMessageDlg(GetMessage('frmLocationIN','015'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   qrySelect:=pGetCuscnfgSelect( edtCostCus.textfield,edtCostCus.text,'仓储');
   if (qrySelect.FieldByName('jobno').AsString<>'NO') and not qryselect.isempty then
   begin

      data.qryLocationin.FieldByName('skucostclasscd').Asstring:=qrySelect.FieldByName('skucostclasscd').Asstring;
      data.qryLocationin.fieldbyname('loadtype').AsString:=qrySelect.fieldbyname('loadtype').AsString;
      data.qryLocationin.FieldByName('Isbond').Asstring:=qrySelect.FieldByName('Isbond').Asstring;

      data.qryLocationin.FieldByName('iUserid').Asstring   :=qrySelect.FieldByName('Userid').Asstring;
      data.qryLocationin.FieldByName('iusername').Asstring :=qrySelect.FieldByName('username').Asstring;

      data.qryLocationin.FieldByName('LOTTRACKED').Asstring        :=qrySelect.FieldByName('LOTTRACKED').Asstring;
      data.qryLocationin.FieldByName('CONTWITHLOCA').Asstring      :=qrySelect.FieldByName('CONTWITHLOCA').Asstring;
      data.qryLocationin.FieldByName('COUNTCONTCOST').Asstring     :=qrySelect.FieldByName('COUNTCONTCOST').Asstring;
      data.qryLocationin.FieldByName('COUNTRENT').Asstring         :=qrySelect.FieldByName('COUNTRENT').Asstring;
      data.qryLocationin.FieldByName('countrentout').Asstring       :=qrySelect.FieldByName('countrentout').Asstring;
      data.qryLocationin.FieldByName('WareRentCountType').Asstring   :=qrySelect.FieldByName('RentCountType').Asstring;
      data.qryLocationin.FieldByName('WareRentCountTypeOut').Asstring   :=qrySelect.FieldByName('RentCountTypeOut').Asstring;
      data.qryLocationin.FieldByName('TagEach').Asstring             :=qrySelect.FieldByName('TagEach').Asstring;
      data.qryLocationin.FieldByName('LOADTYPE').Asstring            :=qrySelect.FieldByName('LOADTYPE').Asstring;
      data.qryLocationin.FieldByName('loadcosttype').Asstring        :=qrySelect.FieldByName('loadcosttype').Asstring;
      //lzw 2008.01.09
      data.qryLocationin.FieldByName('opid').Asstring        :=qrySelect.FieldByName('opid').Asstring;
      data.qryLocationin.FieldByName('opname').Asstring        :=qrySelect.FieldByName('opname').Asstring;
      strCostCountUOMType:=qrySelect.FieldByName('CostCountUOMType').Asstring;
      strRentCountUOMType:=qrySelect.FieldByName('RentCountUOMType').Asstring;
      strRentCountUOMTypeOut:=qrySelect.FieldByName('RentCountUOMTypeout').Asstring;
      //lzw20101208
      copycusID:=iif(qrySelect.FieldByName('cusid').Asstring<>'',
                     qrySelect.FieldByName('cusid').Asstring,
                     data.qryLocationin.FieldByName('costcusid').Asstring);
      copycusName :=iif(qrySelect.FieldByName('cusname').Asstring<>'',
                        qrySelect.FieldByName('cusname').Asstring,
                        data.qryLocationin.FieldByName('costcusname').Asstring);
      copyShippercusID   :=iif(qrySelect.FieldByName('shippercusid').Asstring<>'',
                               qrySelect.FieldByName('shippercusid').Asstring,
                               data.qryLocationin.FieldByName('costcusid').Asstring);
      copyShippercusName :=iif(qrySelect.FieldByName('shippercusname').Asstring<>'',
                               qrySelect.FieldByName('shippercusname').Asstring,
                               data.qryLocationin.FieldByName('costcusname').Asstring);
      copyloadgroupcusid     :=qrySelect.FieldByName('loadgroupcusid').Asstring;
      copyloadgroupcusname   :=qrySelect.FieldByName('loadgroupcusname').Asstring;
      copyforkgroupcusid     :=qrySelect.FieldByName('forkgroupcusid').Asstring;
      copyforkgroupcusname   :=qrySelect.FieldByName('forkgroupcusname').Asstring;
      copyliftmachinecusid   :=qrySelect.FieldByName('liftmachinecusid').Asstring;
      copyliftmachinecusname :=qrySelect.FieldByName('liftmachinecusname').Asstring;
      // Added by wql 2005-12-6 20:10:10
      copySkuwtv             :=qrySelect.FieldByName('skuwtve').AsFloat;
      data.qryLocationINItem.DisableControls;
      with data.qryLocationINItem do
      begin
         First;
         while not Eof do
         begin
            Edit;
            fieldByname('RentCountUOMType').AsString  :=strRentCountUOMType;
            fieldByname('RentCountUOMTypeOut').AsString  :=strRentCountUOMTypeOut;
            fieldByname('CostCountUOMType').AsString  :=strCostCountUOMType;
            next;
         end;
         First;
      end;
      data.qryLocationINItem.EnableControls;
      if not data.qryautocountcostin.IsEmpty then
      begin
        { if _Language='CAPTIONC' then
            _strmessage:='该操作将覆盖该笔资料的原有计算条目，您确定吗?'
         else
            _strmessage:='该操作将覆盖该笔资料的原有计算条目，您确定吗?'; }
         if KmessageDlg(GetMessage('TW','003'),mtConfirmation,[mbYes,mbNo],0)<>mrYes then
         begin
            FreeAndNil(qrySelect);
            exit;
         end;
      end;
      data.qryautocountcostin.DisableControls;
      data.qryautocountcostin.First;
      while not data.qryautocountcostin.Eof do
      begin
         data.qryautocountcostin.Delete;
      end;
      OpenSql(dataTmp.qryTmp,' select cusid ,cpid,costcd,ismainrate=isnull(ismainrate,"F"), '
                            +'        isincome=isnull(isincome,"F"),ratecus,costcus,countway,costcountuomtype, '
                            +'        cnfgcostcusid,cnfgcostcusname,cnfgratecusid,cnfgratecusname   '
                            +'   from cuscnfgitem(nolock) '
                            +'  where jobno="'+qrySelect.fieldbyname('jobno').AsString+'"'
                            +'    and cpid="进仓" '
             );
//              dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         data.qryautocountcostin.Append;
         if grdAutoCost.FocusedNode=nil then
            maxAutocountcost:=maxAutocountcost+1;
         data.qryautocountcostin.FieldByName('sno').AsInteger:=maxAutocountcost;
         data.qryautocountcostin.FieldByName('costcd').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcd').AsString;
         data.qryautocountcostin.FieldByName('ismainrate').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ismainrate').AsString;
         data.qryautocountcostin.FieldByName('isincome').AsString
                                       :=dataTmp.qryTmp.fieldbyname('isincome').AsString;
         data.qryautocountcostin.FieldByName('ratecus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ratecus').AsString;
         data.qryautocountcostin.FieldByName('rateuomtype').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcountuomtype').AsString;
         data.qryautocountcostin.FieldByName('costcus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcus').AsString;
         data.qryautocountcostin.FieldByName('countway').AsString
                                       :=dataTmp.qryTmp.fieldbyname('countway').AsString;
         //data.qryautocountcostin.FieldByName('jobno').AsString:=data.qryin.fieldbyname('jobno').asstring;
         data.qryautocountcostin.FieldByName('jobno').AsString:=data.qryLocationIn.fieldbyname('jobno').asstring;
//dwq0119  --dwq0601修正
         if dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString<>'' then
         begin
            data.qryautocountcostin.FieldByName('costcusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString;
            data.qryautocountcostin.FieldByName('costcusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusname').AsString;
         end;
         if dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString<>'' then
         begin
            data.qryautocountcostin.FieldByName('ratecusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString;
            data.qryautocountcostin.FieldByName('ratecusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusname').AsString;
         end;
         // Added by wql 2005-12-6 20:11:15
         if data.qryautocountcostin.FieldByName('countway').AsString='轻重货' then
            data.qryautocountcostin.FieldByName('skuwtve').AsFloat:=copySkuwtv;

         data.qryautocountcostin.Post;
         dataTmp.qryTmp.next;
      end;
      data.qryautocountcostin.EnableControls;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocationIN.N3Click(Sender: TObject);
begin
   if data.qryin.fieldbyname('jobno').asstring<>'' then
   begin
      ExecSql(dataTmp.qryTmp,'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'  where id=object_id("tempdb..#lskAutoCost") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskAutoCost '+chr(13)+chr(10)
             +'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'  where id=object_id("tempdb..#lskAutoCostGet") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskAutoCostGet '+chr(13)+chr(10)
             +' select * into #lskAutoCost from autocountcost (nolock) where jobno="'+data.qryin.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
             +' select * into #lskAutoCostGet from #lskAutoCost where 1=2  ');
      blnCopyAutoCost:=True;
      kMessageDlg('已复制计费条目！', mtInformation, [mbOK], 0); //nomsg
   end;
end;

procedure TfrmLocationIN.N6Click(Sender: TObject);
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
      for i:=grdLocationIN.SelectedCount-1 Downto 0 do
      begin
         data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
         ExecSQl(dataTmp.qryTmp,'  insert into #lskAutoCostGet     '+chr(13)+chr(10)
                               +'    (jobno,sno,costcd,isincome,ismainrate,costcusid, '+chr(13)+chr(10)
                               +'    costcusname,ratecusid,ratecusname,ratecus,costcus, '+chr(13)+chr(10)
                               +'    rateuomtype,countway)  '+chr(13)+chr(10)
                               +'  select jobno="'+data.qryIn.fieldbyname('jobno').asstring+'", '+chr(13)+chr(10)
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

procedure TfrmLocationIN.LocNameDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if data.qryLocationInDetail.FieldByName('locid').AsString<>'' then
   begin
      data.qryLocInSkuDetail.Active:=True;
   end;
end;

procedure TfrmLocationIN.mitfzrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      //OpenSql(dataTmp.qryTmp,'ksp_fzrkd @jobno="'+data.qrylocationin.fieldbyname('jobno').AsString+'" ');
      OpenSql(dataTmp.qryTmp,'ksp_fzrkd @jobno="",@fillter='' jobno in("'+data.qrylocationin.fieldbyname('jobno').AsString+'") '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900035';
         paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //lzw20110722
         paras.Values['locationbillno']:=data.qrylocationin.fieldbyname('locationbillno').AsString;

         paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
end;

procedure TfrmLocationIN.mitCheckManyClick(Sender: TObject);
var
  i,faltCount,j,faltcomplete:integer;
  strjobnoupd,strmsg:string;
begin
   j:=grdLocationIN.SelectedCount;
{
   if j=1 then
   begin
      mitCheckOneClick(Sender);
      Exit;
   end;
}
      //lzw20110615
   if _strsyscus='XSWL' then
   begin
      if data.qryin.FieldByName('taskcheckname').AsString='' then
      begin
         kMessageDlg('该单未复核,不能进行审核', mtWarning, [mbOK], 0);
         Exit;

      end;
   end;
   if KmessageDlg('该操作将审核选中的所有资料，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strmsg:='';
   faltCount:=0;
   faltcomplete:=0;
   strjobnoupd:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if data.qryin.FieldByName('checkname').AsString<>'' then Inc(faltCount)  //已审核
      else if (data.qryin.FieldByName('operationname').AsString='') then inc(faltCount) //未上架
      else if (data.qryin.FieldByName('taskiscomplete').AsString<>'T') then Inc(faltcomplete)  //任务未完成
      else
      begin
         if strjobnoupd='' then strjobnoupd:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnoupd:=strjobnoupd+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnoupd<>'' then
      execSql(datatmp.qryTmp,'update LocationIN '
                   +'   set checkname="'+_loginname+'",'
                   +'       CHECKDATE=getdate() '
                   +' where jobno in ('+strjobnoupd+')');
   btnRefreshClick(btnRefresh);
   if faltCount<>0 then strmsg:=IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmLocationIN','051');
   if faltcomplete<>0 then strmsg:=strmsg+chr(13)+IntToStr(faltcomplete)+'/'+IntToStr(j)+GetMessage('frmLocationIN','052');
   if strmsg<>'' then
      KMessageDlg(strmsg,mtInformation,[mbOK],0)
      //IIF(_Language='CAPTIONC',''笔资料无拣货或已经审核的数据未审核！','笔任务未完成不能审核！')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitCancelManyClick(Sender: TObject);
var
  i,faltCount,j,notcheck:integer;
  strjobnoupd,strmsg:string;
begin
   j:=grdLocationIN.SelectedCount;
{
   if j=1 then
   begin
      mitCancelOneClick(Sender);
      exit;
   end;
}
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strmsg:='';
   notcheck:=0;
   faltCount:=0;
   strjobnoupd:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if (data.qryin.FieldByName('countname').AsString='') and (data.qryin.FieldByName('costcheckname').AsString='') then
      begin
         if data.qryin.FieldByName('checkname').AsString='' then Inc(notcheck)
         else if (_DB_CheckSelf='T') and (_LoginId<>'SYSTEM')
                 and (_loginName<>data.qryin.FieldByName('checkname').AsString) then
            inc(faltCount)
         else
         begin
            if strjobnoupd='' then strjobnoupd:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
            else strjobnoupd:=strjobnoupd+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
         end;
      end else
         inc(faltCount);
   end;
   if (strjobnoupd<>'') then
      execSql(datatmp.qryTmp,'update LocationIN '+chr(13)+chr(10)
                           +'   set LocationIN.checkname="",'+chr(13)+chr(10)
                           +'       LocationIN.checkdate=null'+chr(13)+chr(10)
                           +' where locationin.jobno in ('+strjobnoupd+')'+chr(13)+chr(10)
                           +'   and isnull(locationin.costcheckname,"")="" ');
   btnRefreshClick(btnRefresh);
   if notcheck<>0 then strmsg:=IntToStr(notcheck)+'/'+IntToStr(j)+GetMessage('frmLocationIN','081');
   if faltCount<>0 then strmsg:=strmsg+chr(13)+IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmLocationIN','074');
   if strmsg<>'' then
      Kmessagedlg(strmsg, mtInformation,[mbOk],0)
      //'笔资料已财务审核或已计费或是他人审核的数据未取消审核！'
   else
      KMessageDlg(GetMessage('frmLocationIN','054'),mtWarning,[mbOK],0) ;
end;

procedure TfrmLocationIN.mitLocInfoSelClick(Sender: TObject);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('T','','',data.qrylocationindetail.fieldbyname('qualityname').asstring);
   if qrySelect.FieldByName('locid').AsString<>'NO' then
   begin
      data.qrylocationInDetail.edit;
      data.qrylocationInDetail.FieldByName('locid').AsString  :=qrySelect.FieldByName('locid').asstring;
      data.qrylocationInDetail.FieldByName('locname').AsString  :=qrySelect.FieldByName('locname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocationIN.mitAutoLocSelClick(Sender: TObject);
begin
   with WorkSelLoc(stBrowse) do
   begin
      data.qryLocationInDetail.Edit;
      data.qrylocationInDetail.FieldByName('locid').AsString  :=locid;
      data.qrylocationInDetail.FieldByName('locname').AsString  :=locname;
   end;
end;

procedure TfrmLocationIN.Getmullocid;
//var
//  acontrol: TWinControl;
begin
   data.qryLocationinDetail.Append;
   if grdLocationINDetail.FocusedNode=nil then
   begin
      maxLocationINDetail:=maxLocationINDetail+1;
      data.qryLocationinDetail.Fieldbyname('ldSNO').asInteger:=maxLocationINDetail;
   end;
//       data.qryLocationinDetail.Fieldbyname('JOBNOorder').asString :=data.qryLocationinItem.Fieldbyname('JOBNOorder').asString;
   data.qryLocationinDetail.Fieldbyname('SNOorder').asInteger :=data.qryLocationinItem.Fieldbyname('SNOorder').asInteger;
   data.qryLocationinDetail.Fieldbyname('TagTotal').asInteger        :=data.qryLocationinItem.Fieldbyname('TagTotal').asInteger;
   data.qryLocationinDetail.Fieldbyname('locid').asstring:=data.qryLocationinItem.Fieldbyname('locid').AsString;
   data.qryLocationinDetail.Fieldbyname('locname').asstring:=data.qryLocationinItem.Fieldbyname('locname').AsString;
   if strSysCus<>'WYFQ' then
      data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=GetServerDate
   else
      data.qryLocationinDetail.fieldbyname('OperationDate').asDateTime:=data.qryLocationin.fieldbyname('OperationDate').asDateTime;
//       data.qryLocationinDetail.fieldByname('userid').AsString:=data.qryLocationinItem.fieldbyname('userid').AsString;
   data.qryLocationinDetail.fieldbyname('ldsno').Asinteger:=maxLocationINDetail;
   data.qryLocationinDetail.fieldByname('jobno').AsString:=data.qryLocationin.fieldbyname('jobno').AsString;
   data.qryLocationinDetail.FieldByName('SNO').AsInteger:=data.qryLocationinItem.fieldbyname('SNO').AsInteger;
   data.qryLocationinDetail.fieldbyname('OPERATIONTYPE').Asinteger:=1;
   data.qryLocationinDetail.Fieldbyname('PiecePro').asFloat      :=data.qryLocationinItem.Fieldbyname('PiecePro').asFloat;
   data.qryLocationinDetail.Fieldbyname('VolumePro').asFloat     :=data.qryLocationinItem.Fieldbyname('VolumePro').asFloat;
   data.qryLocationinDetail.fieldbyname('NetWeightPro').asFloat  :=data.qryLocationinItem.Fieldbyname('NetWeightPro').asFloat;
   data.qryLocationinDetail.fieldbyname('GrossWeightPro').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeightPro').asFloat;
   data.qryLocationinDetail.fieldbyname('AreaPro').asFloat       :=data.qryLocationinItem.Fieldbyname('AreaPro').asFloat;

   data.qryLocationinDetail.Fieldbyname('Quantity').AsFloat   :=data.qryLocationinItem.Fieldbyname('Quantitytask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Piece').AsFloat      :=data.qryLocationinItem.Fieldbyname('Piecetask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Volume').asFloat     :=data.qryLocationinItem.Fieldbyname('Volumetask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Area').asFloat       :=data.qryLocationinItem.Fieldbyname('Areatask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('NetWeight').asFloat  :=data.qryLocationinItem.Fieldbyname('NetWeighttask').AsFloat;
   data.qryLocationinDetail.Fieldbyname('GrossWeight').asFloat:=data.qryLocationinItem.Fieldbyname('GrossWeighttask').AsFloat;
//dwq
//whl  原来不知道为什么注释掉了
   if (_StrSysCus='SHRL') or (_StrSysCus='SWZ') then
   begin
      data.qryLocationinDetail.fieldbyname('ManufactureDate').asDateTime:=data.qryLocationinItem.fieldbyname('ManufactureDate').asDateTime ;
      data.qryLocationinDetail.fieldbyname('skuspec').asstring:=data.qryLocationinItem.FieldByName('skuspec').asstring;
      data.qryLocationinDetail.fieldbyname('skumodel').asstring:=data.qryLocationinItem.FieldByName('skumodel').asstring;
      data.qryLocationinDetail.fieldbyname('customerno').asstring:=data.qryLocationinItem.FieldByName('customerno').asstring;
   end;
 //  if data.qryLocationinDetail.fieldbyname('ManufactureDate').asDateTime=0 then  data.qryLocationinDetail.fieldbyname('ManufactureDate').Clear;

   data.qryLocationinDetail.Fieldbyname('UOM1').asstring        :=data.qryLocationinItem.FieldByName('UOM1').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM2').asstring        :=data.qryLocationinItem.FieldByName('UOM2').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM3').asstring        :=data.qryLocationinItem.FieldByName('UOM3').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM4').asstring        :=data.qryLocationinItem.FieldByName('UOM4').asstring;
   data.qryLocationinDetail.Fieldbyname('UOM5').asstring        :=data.qryLocationinItem.FieldByName('UOM5').asstring;
   data.qryLocationinDetail.Fieldbyname('pro1').asFloat   :=data.qryLocationinItem.Fieldbyname('pro1').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro2').asFloat   :=data.qryLocationinItem.Fieldbyname('pro2').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro3').asFloat   :=data.qryLocationinItem.Fieldbyname('pro3').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro4').asFloat   :=data.qryLocationinItem.Fieldbyname('pro4').asFloat;
   data.qryLocationinDetail.Fieldbyname('pro5').asFloat   :=data.qryLocationinItem.Fieldbyname('pro5').asFloat;
   data.qryLocationinDetail.Fieldbyname('Casing1').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing1task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing2').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing2task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing3').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing3task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing4').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing4task').AsFloat;
   data.qryLocationinDetail.Fieldbyname('Casing5').asFloat            :=data.qryLocationinItem.Fieldbyname('Casing5task').AsFloat;

   data.qryLocationinDetail.fieldbyname('SKUID').asstring               :=data.qryLocationinItem.FieldByName('SKUID').asstring;
   data.qryLocationinDetail.fieldbyname('SKUname').asstring               :=data.qryLocationinItem.FieldByName('SKUname').asstring;
   data.qryLocationinDetail.Fieldbyname('LotCode').asstring             :=data.qryLocationinItem.FieldByName('LotCode').asstring;
   data.qryLocationinDetail.fieldbyname('QualityName').asstring         :=data.qryLocationinItem.FieldByName('QualityName').asstring;
   data.qryLocationinDetail.fieldbyname('Quantityuom').asstring         :=data.qryLocationinItem.FieldByName('Quantityuom').asstring;
   data.qryLocationinDetail.fieldbyname('PieceUOM').asstring            :=data.qryLocationinItem.FieldByName('PieceUOM').asstring;
   data.qryLocationinDetail.fieldbyname('WeightUOM').asstring           :=data.qryLocationinItem.FieldByName('WeightUOM').asstring;
   data.qryLocationinDetail.fieldbyname('VolumeUOM').asstring           :=data.qryLocationinItem.FieldByName('VolumeUOM').asstring;
   data.qryLocationinDetail.Fieldbyname('AreaUOM').asstring             :=data.qryLocationinItem.FieldByName('AreaUOM').asstring;
   data.qryLocationinDetail.fieldbyname('cusid').asstring           :=data.qryLocationinItem.FieldByName('cusid').asstring;
   data.qryLocationinDetail.Fieldbyname('Shippercusid').asstring    :=data.qryLocationinItem.FieldByName('Shippercusid').asstring;
   data.qryLocationinDetail.fieldbyname('LotTracked').asstring       :=data.qryLocationinItem.FieldByName('LotTracked').asstring;
   data.qryLocationinDetail.fieldbyname('price').asFloat             :=data.qryLocationinItem.FieldByName('price').AsFloat;
   data.qryLocationinDetail.fieldbyname('currcd').asString           :=data.qryLocationinItem.FieldByName('currcd').asstring;
   data.qryLocationinDetail.fieldbyname('SKUCost').asFloat        :=data.qryLocationinItem.FieldByName('SKUCost').AsFloat;
   data.qryLocationinDetail.fieldbyname('pricein').asFloat             :=data.qryLocationinItem.FieldByName('pricein').AsFloat;
   data.qryLocationinDetail.fieldbyname('SKUCostIn').asFloat        :=data.qryLocationinItem.FieldByName('SKUCostIn').AsFloat;
   data.qryLocationinDetail.fieldbyname('TagEach').asstring          :=data.qryLocationinItem.FieldByName('TagEach').asstring;
   data.qryLocationinDetail.fieldbyname('TagEachUOM').asstring          :=data.qryLocationinItem.FieldByName('TagEachUOM').asstring;
   data.qryLocationinDetail.fieldbyname('TagTotal').asFloat             :=data.qryLocationinItem.FieldByName('TagTotal').AsFloat;
   if getSysdata('qdtext')<>'T' then
      data.qryLocationinDetail.fieldbyname('TagNO').asString               :='';
   data.qryLocationinDetail.fieldbyname('SerialNO').asString            :=data.qryLocationinItem.FieldByName('customerno').asstring;;
   data.qryLocationinDetail.fieldbyname('LDSNOINF').asInteger        :=data.qryLocationinDetail.FieldByName('LdSno').asInteger;
   data.qryLocationinDetail.fieldbyname('JobnoINF').asstring          :=data.qryLocationinItem.FieldByName('JobnoINF').asstring;
   data.qryLocationinDetail.fieldbyname('SNOINF').asInteger           :=data.qryLocationinItem.FieldByName('SNOINF').AsInteger;
   data.qryLocationinDetail.fieldbyname('isbond').asstring:=data.qryLocationinItem.FieldByName('isbond').asstring;
//       data.qryLocationinDetail.fieldbyname('COUNTRENT').asstring        :=data.qryLocationinItem.FieldByName('COUNTRENT').asstring;
//       data.qryLocationinDetail.fieldbyname('COUNTCONTCOST').asstring    :=data.qryLocationinItem.FieldByName('COUNTCONTCOST').asstring;
//       data.qryLocationinDetail.fieldbyname('WareRentCountType').asstring   :=data.qryLocationinItem.FieldByName('WareRentCountType').asstring;
   data.qryLocationinDetail.Fieldbyname('CustomsNO').asString           :=data.qryLocationinItem.FieldByName('CustomsNO').asstring;
   data.qryLocationinDetail.fieldbyname('LocationBillNO').asstring      :=data.qryLocationinItem.FieldByName('LocationBillNO').asstring;
   data.qryLocationinDetail.fieldbyname('costcusid').asstring :=data.qryLocationinItem.FieldByName('costcusid').asstring;
   data.qryLocationinDetail.fieldbyname('NotFullSign').asstring         :=data.qryLocationinItem.FieldByName('NotFullSign').asstring;
   data.qryLocationinDetail.fieldbyname('costuomtype').asstring         :=data.qryLocationinItem.FieldByName('costuomtype').asstring;
   data.qryLocationinDetail.fieldbyname('remark').asstring              :=data.qryLocationinItem.FieldByName('remark').asstring;
   try
     data.qryLocationinDetail.Post;
   except
     exit;
   end;
//ine
end;


procedure TfrmLocationIN.mitmullocidClick(Sender: TObject);
var
   i:integer;
//   GetLocation:TGetLocation;
begin
   with WorkGetLocation('','',True) do
   if OkFlag then
   begin
      data.qryLocationInItem.DisableControls;
      data.qryLocationInDetail.DisableControls;
      data.qryLocationInItem.First;
      while not data.qryLocationInItem.Eof do
      begin
         if (locationid<>'') and (LocationName<>'') and (data.qryLocationInItem.FieldByName('NotFullSign').AsString='T') then
         begin
            data.qryLocationInItem.Edit;
            data.qryLocationInItem.FieldByName('locid').AsString:=LocationID;
            data.qryLocationInItem.FieldByName('locname').AsString:=LocationName;
            data.qryLocationInItem.FieldByName('NotFullSign').AsString:='F';

            data.qryLocationInDetail.Filtered:=False;
            if data.qryLocationinItem.fieldbyname('SNO').AsString<>'' then
               data.qryLocationinDetail.filter:='SNO='+data.qryLocationinItem.fieldbyname('SNO').AsString
            else
               data.qryLocationinDetail.filter:='SNO=-1';
            data.qryLocationInDetail.Filtered:=True;

            data.qryLocationInDetail.First;
            while not data.qryLocationInDetail.Eof do
            begin
               data.qryLocationInDetail.Edit;
               data.qryLocationInDetail.FieldByName('locid').AsString:=LocationID;
               data.qryLocationInDetail.FieldByName('locname').AsString:=LocationName;
               data.qryLocationInDetail.Post;
               data.qryLocationInDetail.Next;
            end;
            data.qryLocationInItem.Post;
         end;
         data.qryLocationInItem.Next;
      end;
      data.qryLocationInItem.EnableControls;
      data.qryLocationInDetail.EnableControls;
   end;
end;

procedure TfrmLocationIN.mitMullUpClick(Sender: TObject);
begin
   btnOperClick(mitOper); 
end;

procedure TfrmLocationIN.grdCountwayValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  // Added by wql 2005-12-6 20:26:34
  if DataState in Setdcs then
  begin
    if grdAutoCost.InplaceEditor.GetEditingText='轻重货' then
    begin
       data.qryautocountcostin.Edit;
       data.qryautocountcostin.FieldByName('skuwtve').AsFloat:=copySkuwtv;
       data.qryautocountcostin.FieldByName('countway').asstring:=grdAutoCost.InplaceEditor.GetEditingText;
    end;
    Accept:=True;
  end;
end;

procedure TfrmLocationIN.customernoItemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   strno:string;
begin
   if (DataState in Setdcs) and (grdLocationINItem.InplaceEditor.GetEditingText<>'') then
   begin
      strno:=grdLocationINItem.InplaceEditor.GetEditingText;
      strSql:='select top 1 *,quantity=0,qualityname=""'
             +'  from sku '
             +' where customerno="'+strno+'"'
             +'   and isnull(isdetail,"T")="T"'
             +'   and isnull(includecpt,"F")="F"';
      OpenSql(dataTmp.qryTmp,strSql);
      if (dataTmp.qryTmp.RecordCount=1) then
      begin
         data.qryLocationInItem.Edit;
         SetSkuInfo(dataTmp.qryTmp);
      end else
      begin
         ErrorText:='无此编号的商品!';
         Accept:=False;
         exit;
      end;
   end;
end;

procedure TfrmLocationIN.SetSkuInfo(qryselect:tkadoquery);
var
   Quantity:extended;
   strsql:string;
begin
   //lzw20100708
   if getSysdata('xytext')='T' then
   begin
      //批次
      strsql:=Copy(qryselect.fieldbyname('skuid').asstring,31,10);
      InitdbPick(LotCodeItemXY,'skuspec','specname','specname','skuid like "%'+strsql+'" ');
   end;
   data.qryLocationINItem.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
   data.qryLocationINItem.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
   if data.qryLocationInItem.FieldByName('quantitytask').AsFloat=0 then
      Quantity:=qryselect.fieldbyname('Quantity').AsFloat
   else Quantity:=data.qryLocationInItem.FieldByName('quantitytask').AsFloat;
   if Quantity=0 then Quantity:=1;
   if Quantity<>0 then
   begin
     data.qryLocationINItem.fieldbyname('Quantitytask').AsFloat    :=Quantity;
     if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
       data.qryLocationINItem.fieldbyname('Piecetask').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
     data.qryLocationINItem.fieldbyname('NetWeighttask').asFloat   :=data.qryLocationINItem.fieldbyname('Piecetask').AsFloat*qryselect.fieldbyname('WeightPro').AsFloat;
     if _paper<>'T' then
        data.qryLocationINItem.Fieldbyname('GrossWeighttask').asFloat :=data.qryLocationINItem.fieldbyname('Piecetask').AsFloat*qryselect.fieldbyname('grossWeightPro').AsFloat;
     data.qryLocationINItem.fieldbyname('Volumetask').asFloat      :=data.qryLocationINItem.fieldbyname('Piecetask').AsFloat*qryselect.fieldbyname('VolumePro').AsFloat;
     data.qryLocationINItem.Fieldbyname('Areatask').asFloat        :=data.qryLocationINItem.fieldbyname('Piecetask').AsFloat*qryselect.fieldbyname('AreaPro').AsFloat;

     if qryselect.Fieldbyname('Pro1').asFloat<>0 then
       data.qryLocationINItem.Fieldbyname('Casing1task').asFloat:=Quantity/qryselect.Fieldbyname('Pro1').asFloat;
     if qryselect.Fieldbyname('Pro2').asFloat<>0 then
       data.qryLocationINItem.Fieldbyname('Casing2task').asFloat:=Quantity/qryselect.Fieldbyname('Pro2').asFloat;
     if qryselect.Fieldbyname('Pro3').asFloat<>0 then
       data.qryLocationINItem.Fieldbyname('Casing3task').asFloat:=Quantity/qryselect.Fieldbyname('Pro3').asFloat;
     if qryselect.Fieldbyname('Pro4').asFloat<>0 then
       data.qryLocationINItem.Fieldbyname('Casing4task').asFloat:=Quantity/qryselect.Fieldbyname('Pro4').asFloat;
     if qryselect.Fieldbyname('Pro5').asFloat<>0 then
       data.qryLocationINItem.Fieldbyname('Casing5task').asFloat:=Quantity/qryselect.Fieldbyname('Pro5').asFloat;
   end;
   if qryselect.fieldbyname('QualityName').asstring<>'' then
      data.qryLocationINItem.fieldbyname('QualityName').asstring:=qryselect.fieldbyname('QualityName').asstring
   else
      data.qryLocationINItem.Fieldbyname('QualityName').asstring :=iif(CopyQuality<>'',CopyQuality,'正品');

   data.qryLocationINItem.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
   data.qryLocationINItem.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
   data.qryLocationINItem.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
   data.qryLocationINItem.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
   data.qryLocationINItem.Fieldbyname('AreaUOM').asstring     :=qryselect.Fieldbyname('AreaUOM').asstring          ;
   //lzw20090525
   if strSysCus<>'HAITOU' then
   begin
      data.qryLocationINItem.fieldByname('shipcusid').AsString:=data.qryLocationin.fieldbyname('shipcusid').AsString;
      data.qryLocationINItem.fieldByname('shipcusname').AsString:=data.qryLocationin.fieldbyname('shipcusname').AsString;
   end;
   data.qryLocationINItem.Fieldbyname('PiecePro').AsFloat :=qryselect.Fieldbyname('PiecePro').AsFloat;
   data.qryLocationINItem.Fieldbyname('ProPiece').AsFloat :=qryselect.Fieldbyname('PiecePro').AsFloat;
   data.qryLocationINItem.Fieldbyname('VolumePro').asFloat:=qryselect.Fieldbyname('VolumePro').asFloat;
   data.qryLocationINItem.Fieldbyname('AreaPro').asFloat  :=qryselect.Fieldbyname('AreaPro').asFloat;
   data.qryLocationINItem.Fieldbyname('netWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
   if _paper<>'T' then
      data.qryLocationINItem.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('GrossWeightPro').asFloat;
   data.qryLocationINItem.fieldbyname('TagEachUOM').Asstring     :=qryselect.fieldbyname('TagEachUOM').Asstring;
   data.qryLocationINItem.Fieldbyname('UOM1').asstring        :=qryselect.Fieldbyname('UOM1').asstring;
   data.qryLocationINItem.Fieldbyname('UOM2').asstring        :=qryselect.Fieldbyname('UOM2').asstring;
   data.qryLocationINItem.Fieldbyname('UOM3').asstring        :=qryselect.Fieldbyname('UOM3').asstring;
   data.qryLocationINItem.Fieldbyname('UOM4').asstring        :=qryselect.Fieldbyname('UOM4').asstring;
   data.qryLocationINItem.Fieldbyname('UOM5').asstring        :=qryselect.Fieldbyname('UOM5').asstring;
   data.qryLocationINItem.Fieldbyname('Pro1').asFloat   :=qryselect.Fieldbyname('Pro1').asFloat;
   data.qryLocationINItem.Fieldbyname('Pro2').asFloat   :=qryselect.Fieldbyname('Pro2').asFloat;
   data.qryLocationINItem.Fieldbyname('Pro3').asFloat   :=qryselect.Fieldbyname('Pro3').asFloat;
   data.qryLocationINItem.Fieldbyname('Pro4').asFloat   :=qryselect.Fieldbyname('Pro4').asFloat;
   data.qryLocationINItem.Fieldbyname('Pro5').asFloat   :=qryselect.Fieldbyname('Pro5').asFloat;
   //lzw20111011
   data.qryLocationINItem.Fieldbyname('price').asFloat   :=qryselect.Fieldbyname('price').asFloat;
   data.qryLocationINItem.Fieldbyname('pricein').asFloat   :=qryselect.Fieldbyname('pricein').asFloat;

   data.qryLocationINItem.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
   data.qryLocationINItem.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
   data.qryLocationINItem.Fieldbyname('customerno').Asstring:=qryselect.fieldbyname('customerno').Asstring;
   data.qryLocationINItem.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;
end;

procedure TfrmLocationIN.mitGetAutoCountClick(Sender: TObject);
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
         strSql:=strSql+' insert into #lskjobno(jobno) values("'+data.qryIn.fieldbyname('jobno').AsString+'")'
      end else
      begin
         for i:=grdLocationIN.SelectedCount-1 downto 0 do
         begin
            data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
            strjobnolist:=strjobnolist+IIF(strjobnolist='','("',',"')+data.qryin.fieldbyname('jobno').asstring+'"';
         end;
         strjobnolist:=strjobnolist+')';
         strSql:=strsql+'insert into #lskjobno '
                       +' select jobno from locationin '
                       +'  where jobno in '+strjobnolist+chr(13)+chr(10);
      end;
      strSql:=strSql+' exec ksp_GetAutoCostbyJobno @table="locationin",@cpid="进仓",@type="warehouse" ';
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

function TfrmLocationIN.GetLocationbillNo:String;
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

procedure TfrmLocationIN.mitoploadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="T"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryIn.FieldByname('jobno').AsString,'LI','T')
   else
      Workforkwork(data.qryIn.FieldByname('jobno').AsString,'1','T');

end;

procedure TfrmLocationIN.conscusnameItemButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationInItem.Edit;
         data.qryLocationInItem.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationInItem.FieldByName('conscusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationIN.mittaskcheckClick(Sender: TObject);
var
  i,faltCount,j,faltcomplete:integer;
  strjobnoupd,strmsg:string;
begin
   j:=grdLocationIN.SelectedCount;
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
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if (data.qryin.FieldByName('taskcheckname').AsString<>'') then
      inc(faltCount)               //已经审核
      else
      if (data.qryin.FieldByName('checkname').AsString<>'') then
      Inc(faltcomplete)            //已经部门审核
      else
      begin
         if strjobnoupd='' then strjobnoupd:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnoupd:=strjobnoupd+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnoupd<>'' then
      execSql(datatmp.qryTmp,'update LocationIN '
                   +'   set taskcheckname="'+_loginname+'",'
                   +'       taskcheckdate=getdate() '
                   +' where jobno in ('+strjobnoupd+')');
   btnRefreshClick(btnRefresh);
   //笔资料已经复核的数据未审核!
   if faltCount<>0 then strmsg:=IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmLocationIN','078');
   //笔资料已经部门审核的数据未核!
   if faltcomplete<>0 then strmsg:=strmsg+chr(13)+IntToStr(faltcomplete)+'/'+IntToStr(j)+GetMessage('frmLocationIN','079');
   if strmsg<>'' then
      KMessageDlg(strmsg,mtInformation,[mbOK],0)
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitConcelTaskClick(Sender: TObject);
var
  i,faltCount,j,checked:integer;
  strjobnoupd,strmsg:string;
begin
   j:=grdLocationIN.SelectedCount;
{
   if j=1 then
   begin
      mitCancelOneClick(Sender);
      exit;
   end;
}
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   faltCount:=0;
   checked:=0;
   strjobnoupd:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if (data.qryin.FieldByName('countname').AsString='')     //未财务计费
         and (data.qryin.FieldByName('costcheckname').AsString='') then
      begin
         if data.qryin.FieldByName('checkname').AsString<>'' then inc(faltCount) //已审核
         else if (_DB_CheckSelf='T') and (_LoginId<>'SYSTEM')                    //复核人不同
            and (_loginName<>data.qryin.FieldByName('taskcheckname').AsString) then
            inc(faltCount)
         else
         begin
            if strjobnoupd='' then strjobnoupd:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
            else strjobnoupd:=strjobnoupd+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
         end;
      end else
         inc(faltCount);
   end;
   if (strjobnoupd<>'') then
      execSql(datatmp.qryTmp,'update LocationIN '+chr(13)+chr(10)
                           +'   set LocationIN.taskcheckname="",'+chr(13)+chr(10)
                           +'       LocationIN.taskcheckdate=null'+chr(13)+chr(10)
                           +' where locationin.jobno in ('+strjobnoupd+')'+chr(13)+chr(10)
                           +'   and isnull(locationin.costcheckname,"")="" ');
   btnRefreshClick(btnRefresh);
   if faltCount<>0 then
      Kmessagedlg(IntToStr(faltCount)+'/'+IntToStr(j)+GetMessage('frmLocationIN','080'), mtInformation,[mbOk],0)
      //'笔资料已审核或已财务审核或已计费或是他人复核的数据未取消审核！'
   else
      KMessageDlg(_strsucceed,mtWarning,[mbOK],0) ;
end;

procedure TfrmLocationIN.mitItemTask_OrderClick(Sender: TObject);
var
   strJobno:string;
begin
   with data.qryLocationInItem do
   begin
      if Sender=mitItemTask_Order then
      begin
          if FieldByName('jobnoorder').AsString='' then exit;
             strJobno:=FieldByName('jobnoorder').AsString;
             WorkWareOrderDxALL(stBrowse,strJobno,nil,nil);
      end;
   end;
end;

procedure TfrmLocationIN.mitcountsalesClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将计提选中的所有资料的采购费用，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if data.qryin.FieldByName('disaccord').AsString<>'T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
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
                            +'        costin=0,      '+chr(13)+chr(10)
                            +'        costout=skucostin,     '+chr(13)+chr(10)
                            +'        currcd,            '+chr(13)+chr(10)
                            +'        costcusid,costcusname,     '+chr(13)+chr(10)
                            +'        costdate=convert(varchar(10),operationdate,102),     '+chr(13)+chr(10)
                            +'        userid,username,skuid,skuname,     '+chr(13)+chr(10)
                            +'        lister="'+_loginname+'" ,     '+chr(13)+chr(10)
                            +'        costrate=pricein,     '+chr(13)+chr(10)
                            +'        isincome="F",     '+chr(13)+chr(10)
                            +'        iuserid,iusername,     '+chr(13)+chr(10)
                            +'        buskind="采购进仓",     '+chr(13)+chr(10)
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
                            +' select * from #Costitem                       '+chr(13)+chr(10)
                            +'   drop table #Costitem                         '+chr(13)+chr(10)
             );

      execSql(datatmp.qryTmp,'update LocationIN '
                   +'   set disaccord="T"'
                   +' where jobno in ('+strjobnocount+')');
   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('采购费用计提成功',mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.btnHSClick(Sender: TObject);
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

procedure TfrmLocationIN.mitgetskucostClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将重新获取商品的采购价格及总价，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if data.qryin.FieldByName('disaccord').AsString<>'T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnocount<>'' then
   begin
      ExecSql(datatmp.qryTmp,'update locationinitem '+chr(13)+chr(10)
                            +'   set pricein=(select top 1 skuprice.pricein '+chr(13)+chr(10)
                            +'                  from skuprice '+chr(13)+chr(10)
                            +'                 where skuprice.skuid=locationinitem.skuid '+chr(13)+chr(10)
                            +'                   and "'+data.qryIn.fieldbyname('costcusid').AsString+'" like rtrim(isnull(skuprice.CusID,""))+"%" '+chr(13)+chr(10)
                            +'                   and isnull(skuprice.pricein,0)<>0     '+chr(13)+chr(10)
                            +'                   and convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryIn.fieldbyname('taskdate').asdatetime)+'" '+chr(13)+chr(10)
                            +'                 order by skuprice.cusid desc ,effivedate desc ), '+chr(13)+chr(10)
                            +'       skucostin=(select top 1 skucostin=case when skuprice.uomtype="quantity" then isnull(locationinitem.quantity,0)*skuprice.pricein '+chr(13)+chr(10)
                            +'                                              when skuprice.uomtype="price" then isnull(locationinitem.price,0)*skuprice.pricein'+chr(13)+chr(10)
                            +'                                              when skuprice.uomtype="grossweight" then isnull(locationinitem.grossweight,0)*skuprice.pricein'+chr(13)+chr(10)
                            +'                                              when skuprice.uomtype="netweight" then isnull(locationinitem.netweight,0)*skuprice.pricein'+chr(13)+chr(10)
                            +'                                              when skuprice.uomtype="volume" then isnull(locationinitem.volume,0)*skuprice.pricein'+chr(13)+chr(10)
                            +'                                              else 0 end    '+chr(13)+chr(10)
                            +'                    from skuprice '+chr(13)+chr(10)
                            +'                   where skuprice.skuid=locationinitem.skuid '+chr(13)+chr(10)
                            +'                     and isnull(skuprice.pricein,0)<>0     '+chr(13)+chr(10)
                            +'                     and "'+data.qryIn.fieldbyname('costcusid').AsString+'" like rtrim(isnull(skuprice.CusID,""))+"%" '+chr(13)+chr(10)
                            +'                     and convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryIn.fieldbyname('taskdate').asdatetime)+'" '+chr(13)+chr(10)
                            +'                   order by skuprice.cusid desc ,effivedate desc ) '+chr(13)+chr(10)
                            +' where jobno in ('+strjobnocount+')     '+chr(13)+chr(10)
                            +' '+chr(13)+chr(10)
             );

   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('获取商品的采购价格及总价成功!!',mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitcancelsalesClick(Sender: TObject);
var
  i:integer;
  strjobnocount:string;
begin
   if KmessageDlg('该操作将计提选中的所有资料的采购费用，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strjobnocount:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      if data.qryin.FieldByName('disaccord').AsString='T' then
      begin
         if strjobnocount='' then strjobnocount:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnocount:=strjobnocount+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnocount<>'' then
   begin
      OpenSql(dataTmp.qryTmp,' select 1 from costitem(nolock) '
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

      execSql(datatmp.qryTmp,'update LocationIN '
                   +'   set disaccord="F"'
                   +' where jobno in ('+strjobnocount+')');
   end;
   btnRefreshClick(btnRefresh);

   Kmessagedlg('放弃采购费用成功',mtInformation,[mbOk],0);
end;

procedure TfrmLocationIN.mitxshwjcdClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   OpenSql(dataTmp.qryTmp,'select locationin.costcusname,OperationDate=convert(char(10),locationin.OperationDate,102),OrderID=wareorder.OrderID, '+chr(13)+chr(10)
                         +'       locationin.carbrand,locationin.LocationBillNO,item.mainorder,item.skuname,item.lotcode,'+chr(13)+chr(10)
                         +'       skumodel=item.skumodel+case when item.skuspec<>"" then "/"+item.skuspec  else "" end , '+chr(13)+chr(10)
                         +'       item.locname,item.quantitytask,wareorder.createname,'+chr(13)+chr(10)
                         +'       grossweight=case when item.weightuom="吨" then item.grossweighttask*1000 else item.grossweighttask end, '+chr(13)+chr(10)
                         +'       quantityuom=item.pieceuom,item.volumetask,'+chr(13)+chr(10)
                         //lzw20110624
                         +'       TASKDATE=convert(char(10),locationin.TASKDATE,102), '+chr(13)+chr(10)
                         +'       item.remark,orderdate=convert(char(10),wareorder.orderdate,102),locationin.username'+chr(13)+chr(10)
                         +'  from locationin(nolock)                                             '+chr(13)+chr(10)
                         +'       left join locationinitem item(nolock)                          '+chr(13)+chr(10)
                         +'                 left join wareorder(nolock)                          '+chr(13)+chr(10)
                         +'                        on item.jobnoorder=wareorder.jobno    '+chr(13)+chr(10)
                         +'              on locationin.jobno=item.jobno                   '+chr(13)+chr(10)
                         +' where locationin.jobno="'+data.qryLocationIn.FieldByname('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   lstpara.Add('Locationbillno='+dataTmp.qryTmp.FieldByname('Locationbillno').AsString);
   lstpara.Add('costcusname='+dataTmp.qryTmp.FieldByname('costcusname').AsString);
   lstpara.Add('username='+dataTmp.qryTmp.FieldByname('username').AsString);
   lstpara.Add('carbrand='+dataTmp.qryTmp.FieldByname('carbrand').AsString);
   lstpara.Add('orderid='+dataTmp.qryTmp.FieldByname('orderid').AsString);
   lstpara.Add('mainorder='+dataTmp.qryTmp.FieldByname('mainorder').AsString);
   lstpara.Add('operationdate='+dataTmp.qryTmp.FieldByname('operationdate').AsString);
   lstpara.Add('taskdate='+dataTmp.qryTmp.FieldByname('taskdate').AsString);
   lstpara.Add('createname='+dataTmp.qryTmp.FieldByname('createname').AsString);
   lstpara.Add('orderdate='+dataTmp.qryTmp.FieldByname('orderdate').AsString);
   //lzw20110613
   lstpara.Add('cusbillno='+data.qrylocationin.FieldByname('cusbillno').AsString);

   lstpara.Add('kdr='+_loginname);
   Worklinprint('100084','old','夏商市场部进仓单',dataTmp.qryTmp,nil,nil,lstpara);
 end;

procedure TfrmLocationIN.mitforkworkloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="F"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryIn.FieldByname('jobno').AsString,'LI','F')
   else
      Workforkwork(data.qryIn.FieldByname('jobno').AsString,'1','F');
end;

procedure TfrmLocationIN.mitforkworkunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
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
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="F"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="F"'
                               );
   end;
end;

procedure TfrmLocationIN.mitDocbookPicClick(Sender: TObject);
begin
   pWorkFormDll('BASECODE',PChar('DOCBOOKPIC'+data.qryIn.FieldByName('jobno').AsString),'STBROWSE');
end;

procedure TfrmLocationIN.mitinoutqueryClick(Sender: TObject);
begin
   WorkInoutquery(data.qryIn.fieldbyname('jobno').AsString,'I');
end;

procedure TfrmLocationIN.mitprinttallysheetClick(Sender: TObject);
var
   lstPara:Tstringlist;
begin
   lstPara:=TStringList.Create;
   lstPara.Add('BarCodemainorder='+data.qryLocationIn.FieldByName('mainorder').AsString);
   lstPara.Add('carno='+data.qryLocationIn.FieldByName('carbrand').AsString);
   OpenSql(dataTmp.qryTmp,' Select customerno,skuName,printdate=getdate() from sku '
                 +'  where skuid="'+data.qryLocationinItem.FieldByName('skuid').AsString+'"');
   lstPara.Add('BarCodesku='+dataTmp.qryTmp.FieldByName('customerno').AsString);
   lstPara.Add('skuName='+dataTmp.qryTmp.FieldByName('skuName').AsString);
   lstPara.Add('quantity='+data.qryLocationinItem.FieldByName('Quantitytask').AsString);
   lstPara.Add('printdate='+dataTmp.qryTmp.FieldByName('printdate').AsString);
   OpenSql(dataTmp.qryTmp,' Select sno=1 ');
   WorkFillRmBb('100001',True,dataTmp.qryTmp,dataTmp.qryTmp,lstPara,False);
end;

//lzw 07.12.14
procedure TfrmLocationIN.mitprinttallysheet1Click(Sender: TObject);
begin
   workprintselect;
end;

procedure TfrmLocationIN.mitopunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
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
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="T"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
                               +'   and isnull(forktype,"F")="T"'
                               );
   end;
end;

procedure TfrmLocationIN.mitlocinitemskuClick(Sender: TObject);
begin
   if strSysCus<>'WYFQ' then
      btnRefreshClick(btnEdit);
   if (data.qryIn.FieldByName('OPERATIONNAME').AsString<>'') then
   begin
      kMessageDlg('该笔进仓已产生上架，请先删除上架!', mtWarning, [mbOK], 0);
      Exit;
   end;
   if strSysCus<>'WYFQ' then
   if pgcMain.ActivePage<>tbsEdit then
   begin
      pgcMain.ActivePage:=tbsEdit ;
      pgcLocationINOUT.ActivePage:=tbsSKU;
   end;   
   if strSysCus<>'WYFQ' then
   begin
      if data.qryLocationinitem.RecordCount<>0 then
      begin
         if KmessageDlg('该进仓任务已存在商品资料，是否继续导入？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
         worklocinitemsku(data.qryIn.FieldByName('jobno').AsString);

      end else
         worklocinitemsku(data.qryIn.FieldByName('jobno').AsString);
      btnRefresh.click;
   end else
      workinputlocinitemsku(data.qryIn.FieldByName('jobno').AsString);
end;

procedure TfrmLocationIN.mitcustomspicClick(Sender: TObject);
begin
   pWorkFormDll('BASECODE',PChar('CUSTOMERPIC'+data.qryIn.FieldByName('costcusid').AsString),'STBROWSE');
end;

procedure TfrmLocationIN.mitinlocClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstPara.Add('data='+datetostr(date));
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select detail.jobno,detail.skuname,item.skuspec,item.skumodel,'+chr(13)+chr(10)
                         +'       quantity=detail.quantity,item.remark,'+chr(13)+chr(10)
                         +'       year=substring(Convert(char(8),detail.OperationDate,112),1,4),'+chr(13)+chr(10)
                         +'       month=substring(Convert(char(8),detail.OperationDate,112),5,2),'+chr(13)+chr(10)
                         +'       day=substring(Convert(char(8),detail.OperationDate,112),7,2),'+chr(13)+chr(10)
                         +'       QuantityUOM=detail.QuantityUOM  '+chr(13)+chr(10)
                         +'  from locationindetail detail(nolock),locationinitem item(nolock)  '+chr(13)+chr(10)
                         +' where detail.jobno=item.jobno   '+chr(13)+chr(10)
                         +'   and detail.sno=item.sno      '+chr(13)+chr(10)
                         +'   and detail.JOBNO="'+data.qryLocationIn.FieldByname('JOBNO').AsString+'" '+chr(13)+chr(10)
                         );
   Worklinprint('100120','old','%入库进货单%',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationIN.mitupdateClick(Sender: TObject);
var
   strdatetime:string;
   strtype:string;
begin
{   if KinputQuery('生产日期调整','生产日期',strNo) then
   begin
      strNo:=Trim(strNo);
   end;     }

   Workupdatetime(strdatetime,strtype);
   strUpdate:=strdatetime;
   strUpdatetype:=strtype;

   ExecSql(dataTmp.qryTmp,'update locationinitem set ManufactureDate="'+strdatetime+'" ,                   '+chr(13)+chr(10)
                         +'                          manudatestring="'+strtype+'"                      '+chr(13)+chr(10)
                         +' where jobno="'+data.qryLocationIn.FieldByname('jobno').AsString+'"         '+chr(13)+chr(10)
                         +'   and sno="'+data.qryLocationInItem.FieldByname('sno').AsString+'"         '+chr(13)+chr(10)
                         );
   ExecSql(dataTmp.qryTmp,'update locationindetail set ManufactureDate="'+strdatetime+'" ,                 '+chr(13)+chr(10)
                         +'                          manudatestring="'+strtype+'"                      '+chr(13)+chr(10)
                         +' where jobno="'+data.qryLocationIn.FieldByname('jobno').AsString+'"         '+chr(13)+chr(10)
                         +'   and sno="'+data.qryLocationInItem.FieldByname('sno').AsString+'"         '+chr(13)+chr(10)
                         );
   ExecSql(dataTmp.qryTmp,'update locationoutitem set ManufactureDate="'+strdatetime+'" ,                  '+chr(13)+chr(10)
                         +'                          manudatestring="'+strtype+'"                      '+chr(13)+chr(10)
                         +' where jobnoin="'+data.qryLocationIn.FieldByname('jobno').AsString+'"       '+chr(13)+chr(10)
                         +'   and snoin="'+data.qryLocationInItem.FieldByname('sno').AsString+'"       '+chr(13)+chr(10)
                         );
   ExecSql(dataTmp.qryTmp,'update locationoutdetail set ManufactureDate="'+strdatetime+'"              '+chr(13)+chr(10)
                         +' where jobnoin="'+data.qryLocationIn.FieldByname('jobno').AsString+'"       '+chr(13)+chr(10)
                         +'   and snoin="'+data.qryLocationInItem.FieldByname('sno').AsString+'"       '+chr(13)+chr(10)
                         );
   //lzw20100629
   if getSysdata('qdtext')='T' then
   begin
      ExecSql(dataTmp.qryTmp,'update locationinoutconsku set ManufactureDate="'+strdatetime+'"         '+chr(13)+chr(10)
                         +' where jobno="'+data.qryLocationIn.FieldByname('jobno').AsString+'"         '+chr(13)+chr(10)
                         );
      ExecSql(dataTmp.qryTmp,'update locinskudetail set ManufactureDate="'+strdatetime+'"              '+chr(13)+chr(10)
                            +' where jobno="'+data.qryLocationIn.FieldByname('jobno').AsString+'"      '+chr(13)+chr(10)
                            );
      ExecSql(dataTmp.qryTmp,'update locoutskudetail set ManufactureDate="'+strdatetime+'"             '+chr(13)+chr(10)
                            +' where jobnoin="'+data.qryLocationIn.FieldByname('jobno').AsString+'"    '+chr(13)+chr(10)
                            );
   end;

   btnRefreshClick(Sender);
end;

procedure TfrmLocationIN.mitcostforkworkClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="Z"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryIn.FieldByname('jobno').AsString,'LI','Z')
   else
      Workforkwork(data.qryIn.FieldByname('jobno').AsString,'1','Z');
end;

procedure TfrmLocationIN.mitcanclecostClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
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
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Z"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="Z"'
                               );
   end;

end;

procedure TfrmLocationIN.btncheckdetailClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if _strsyscus='SWZ' THEN
   begin
      OpenSql(dataTmp.qryTmp1,'select taskcheckname,taskcheckdate from LocationIN (nolock)'+chr(13)+chr(10)
                          +' where jobno="'+data.qrylocationin.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                        );
      if dataTmp.qryTmp1.FieldByname('taskcheckname').AsString<>'' then
      begin
        KMessageDlg('该票业务已审批！',mtWarning,[mbOK],0);
        Exit;
      end;
      if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      begin
         execSql(datatmp.qryTmp,'update LocationIN '
                      +'   set taskcheckname="'+_loginname+'",'
                      +'       taskcheckdate="'+datetostr(getserverdate)+'" '
                      +' where jobno="'+data.qrylocationin.FieldByName('jobno').AsString+'"');
         btnRefreshClick(btnRefresh);
         OpenSql(dataTmp.qryTmp1,'select taskcheckname,taskcheckdate from LocationIN (nolock)'+chr(13)+chr(10)
                             +' where jobno="'+data.qrylocationin.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                           );
         if dataTmp.qryTmp1.FieldByname('taskcheckname').AsString<>'' then
         begin
           KMessageDlg('审批完成！',mtWarning,[mbOK],0);
           Exit;
         end;
      end;
   end ;


end;

procedure TfrmLocationIN.mitchecklookClick(Sender: TObject);
begin
   workforkworkload(data.qryIn.FieldByname('locationbillno').AsString);
end;

procedure TfrmLocationIN.N9Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="Q"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if (_strSysCus='SWZ') or (_strSysCus='JJHY') then
      Workforkworknew(data.qryIn.FieldByname('jobno').AsString,'LI','Q')
   else
      Workforkwork(data.qryIn.FieldByname('jobno').AsString,'1','Q');
end;

procedure TfrmLocationIN.N10Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '
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
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Q"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryIn.FieldByName('jobno').AsString+'"  '
                               +'   and isnull(forktype,"F")="Q"'
                               );
   end;
end;

procedure TfrmLocationIN.mitdelcountClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('该操作将删除选定资料的计费条目,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdLocationin.SelectedCount-1 Downto 0 do
      begin
         data.qryin.GotoBookmark(Pointer(grdLocationin.SelectedRows[i]));
         ExecSql(dataTmp.qryTmp,' delete autocountcost where jobno="'+data.qryin.FieldByname('jobno').AsString+'" ');
      end;
      Kmessagedlg('操作成功！！！',mtInformation,[mbOk],0);
   end;
end;

procedure TfrmLocationIN.mitworkitemClick(Sender: TObject);
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
                         +'  from locationinitem Detail(nolock) '+chr(13)+chr(10)
                         +'       left join sku                    '+chr(13)+chr(10)
                         +'              on Detail.skuid=sku.skuid  '+chr(13)+chr(10)
                         +' Where Detail.Jobno="'+data.qryin.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         +' GROUP by Detail.skuname,sku.skumodel,sku.skuspec,Detail.weightuom,Detail.pieceuom '+chr(13)+chr(10)
                         );
   OpenSql(dataTmp.qryTmp1,'Select cuscname from customer(nolock),locationin(nolock)  '+chr(13)+chr(10)
                         +' Where customer.cusid=locationin.costcusid '+chr(13)+chr(10)
                         +'   and locationin.Jobno="'+data.qryin.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         );
   lstPara.Add('cuscname='+dataTmp.qryTmp1.fieldbyname('cuscname').AsString);
   lstpara.Add('kdr='+_loginname);

   Worklinprint('100132','old','作业通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationIN.mitprintitemClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
      
   lstPara:=TStringList.Create;
   if getSysdata('hxtext')='T' then
   begin
      OpenSql(dataTmp.qrymain,'select locationin.jobno,locationin.cusbillno,locationin.locationbillno,locationin.remark, '+chr(13)+chr(10)
                             +'       taskdate=convert(char(10),locationin.taskdate,102),locationin.createname,'+chr(13)+chr(10)
                             +'       operationdate=convert(char(10),locationin.operationdate,102),locationin.Routing,   '+chr(13)+chr(10)
                             +'       cuscname=(select cuscname from customer(nolock) where locationin.costcusid=customer.cusid ) '+chr(13)+chr(10)
                             +'  from locationin (nolock)  '+chr(13)+chr(10)
                             +' where locationin.jobno="'+data.qryLocationIn.FieldByName('jobno').AsString+'" '
                );
      OpenSql(dataTmp.qrybb, 'select item.skuname,item.skuspec,item.skumodel,item.locname,  '+chr(13)+chr(10)
                            +'       item.piece,item.pieceuom,item.grossweight,item.weightuom,   '+chr(13)+chr(10)
                            +'       item.volume,item.volumeuom,item.netweight,   '+chr(13)+chr(10)
                            +'       item.area,item.areauom   '+chr(13)+chr(10)
                            +'  from locationinitem item(nolock)  '+chr(13)+chr(10)
                            +' where item.jobno="'+data.qryLocationIn.FieldByName('jobno').AsString+'" '
                );
      WorkFillRmBb('900101',False,dataTmp.qrymain,dataTmp.qryBb,lstPara,True);
   end;
end;

procedure TfrmLocationIN.CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
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

procedure TfrmLocationIN.CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
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
         //净重
         if (OldValue<>0) and blnBLJS then
           FieldByName('NetWeight'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('NetWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmLocationIN.GrossWeightDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _StrSysCus='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qryLocationinDetail.FieldByName('grossweight').AsFloat;
         data.qryLocationinDetail.Edit;
         data.qryLocationinDetail.FieldByName('grossweight').AsFloat:=StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qryLocationinDetail,QuantityDetailOldValue,'');
         blnBLJS:=False;

      end;
   end;
end;

procedure TfrmLocationIN.NetWeightDetailValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _StrSysCus='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qryLocationinDetail.FieldByName('Netweight').AsFloat;
         data.qryLocationinDetail.Edit;
         data.qryLocationinDetail.FieldByName('Netweight').AsFloat:=StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qryLocationinDetail,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmLocationIN.btnOperationClick(Sender: TObject);
begin
   pgcMain.ActivePage :=tbsEdit;
   pgcLocationINOUT.ActivePage:=tbsSKU;
   WorkOperation(stBrowse,data.qryin.FieldByName('Jobno').AsString,
                          data.qryin.FieldByName('UserID').AsString);
end;
procedure TfrmLocationIN.edtcusbillnoSearchExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if DataState<>stbrowse then
      Exit;
   _qrymacroin:='';
   _qrymacroin:=' (isnull(inout.cusbillno,"") like "%'+edtcusbillnoSearch.Text+'%" or isnull(inout.locationbillno,"") like "%'+edtcusbillnoSearch.Text+'%") ';
   data.qryin.MacroByName('where').AsString:=''''+_qrymacroin+'''';
   data.qryIn.Close;
   data.qryIn.Open;
end;

procedure TfrmLocationIN.N11Click(Sender: TObject);
var
   strqualitity:string;
begin
   strqualitity:='';
   if KinputQuery('输入要修改的品质','品质：',strqualitity) then
   begin
      if strqualitity<>'' then
      begin
         OpenSql(qryTmp1,'  select num=count(1) from codelib (nolock)     '+chr(13)+chr(10)
                       +'   where codelib.codeclass="04"  '+chr(13)+chr(10)
                       +'     and codelib.codename="'+strqualitity+'"   ');
         if qryTmp1.FieldByName('num').AsInteger=0 then
         begin
            kMessageDlg('品质输入不正确，请重新输入！', mtWarning, [mbOK], 0);
            Exit;
         end else
         begin
            ExecSql(qrytmp1,' update locationinitem     '
                   +'    set qualityname="'+strqualitity+'"  '
                   +'  where jobno="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                   +'    and sno='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                   +' update locationindetail    '
                   +'    set qualityname="'+strqualitity+'"  '
                   +'  where jobno="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                   +'    and sno='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                   +' update locationoutitem     '
                   +'    set qualityname="'+strqualitity+'"  '
                   +'  where jobnoin="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                   +'    and snoin='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                   +'    and isnull(isvalueadd,"F")<>"T" '
                   +' update locationoutdetail    '
                   +'    set qualityname="'+strqualitity+'"  '
                   +'  where jobnoin="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                   +'    and snoin='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                   +'    and isnull(isvalueadd,"F")<>"T" '
                   +'');
         end;
      end;
   end;
end;

procedure TfrmLocationIN.ppmLocationINItemPopup(Sender: TObject);
begin
   if strSysCus='SHRL' then
   begin
      mitCopySku.Visible:=true;
      mitmullocid.Visible:=True;
      mitMulDel.Visible:=True;
      mitprinttallysheet.Visible:=False;
      mitINCOWork.Visible:=False;
      mitTotalDetail .Visible:=False;
      mitalterskupro.Visible:=False;
      mitupdate.Visible:=False;
      N11.Visible:=False;
      mitMulLotcode.Visible:=true;
      N12.Visible:=true;
      if (data.qryLocationINDetail.IsEmpty=true) and (not grdLocationINOUTItemReadOnly) then
      begin
         mitMulLotcode.Enabled:=true;
      end else
         mitMulLotcode.Enabled:=false;
   end else
   begin
      mitCopySku.Visible:=false;
      mitmullocid.Visible:=False;
      mitMulDel.Visible:=False;
      mitMulLotcode.Visible:=false;
      N12.Visible:=false;
   end;
end;

procedure TfrmLocationIN.quantityshortitemValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
    if strSysCus='SZWY' then
    begin
       data.qryLocationinItem.FieldByName('quantityshort').AsFloat:=StrToFloat(grdLocationINItem.InplaceEditor.GetEditingText);
       if data.qryLocationInItem.FieldByName('quantityshort').AsInteger<>0 then
          data.qryLocationInItem.FieldByName('casing5task').AsFloat:=Trunc(data.qryLocationInItem.FieldByName('quantitytask').AsFloat/data.qryLocationInItem.FieldByName('quantityshort').AsFloat)
       else
          data.qryLocationInItem.FieldByName('casing5task').AsFloat:=0;
    end;
end;

procedure TfrmLocationIN.mitCopySkuClick(Sender: TObject);
var
   strqualitity:string;
   intNum:Integer;

   strSKUID:string;
   strSKUName:string;
   strLotCode:string;
   strQualityName:string;
   strQuantityUOM:string;
   strPieceUOM:string;
   strWeightUOM:string;
   strVolumeUOM:string;
   strAreaUOM:string;
   strshipcusid:string;
   strshipcusname:string;
   strTagEachUOM:string;
   strUOM1:string;
   strUOM2:string;
   strUOM3:string;
   strUOM4:string;
   strUOM5:string;
   strskuspec:string;
   strcolor:string;
   strcustomerno:string;
   strskumodel:string;
   strManufactureDate:string;
   strlocid:string;
   strlocname:string;

   extQuantitytask:Extended;
   extPiecetask:Extended;
   extNetWeighttask:Extended;
   extGrossWeighttask:Extended;
   extVolumetask:Extended;
   extAreatask:Extended;
   extCasing1task:Extended;
   extCasing2task:Extended;
   extCasing3task:Extended;
   extCasing4task:Extended;
   extCasing5task:Extended;
   extPiecePro:Extended;
   extVolumePro:Extended;
   extAreaPro:Extended;
   extnetWeightPro:Extended;
   extGrossWeightPro:Extended;
   extPro1:Extended;
   extPro2:Extended;
   extPro3:Extended;
   extPro4:Extended;
   extPro5:Extended;
begin
   if data.qryLocationin.FieldByName('operationname').AsString<>'' then
   begin
      {if _Language='CAPTIONC' then
         _strmessage:='该单已经产生上架,无法在本单增加任务!'
      else
         _strmessage:='该单已经产生上架,无法在本单增加任务!'; }
      KMessageDlg(GetMessage('frmLocationIN','056'),mtWarning,[mbyes],0);
      exit;
   end;

   strqualitity:='';
   if KinputQuery('输入要复制的次数','次数：',strqualitity) then
   begin
      try
         intNum:=StrToInt(strqualitity);
      except
         kMessageDlg('请输入数值！', mtWarning, [mbOK], 0);
         exit;
      end;
      if intNum>=1 then
      begin
         strSKUID:=data.qrylocationinitem.fieldbyname('SKUID').AsString;
         strSKUName:=data.qrylocationinitem.fieldbyname('SKUName').asstring;
         strLotCode:=data.qrylocationinitem.fieldbyname('LotCode').asstring;
         strQualityName:=data.qrylocationinitem.fieldbyname('QualityName').asstring;
         strQuantityUOM:=data.qrylocationinitem.fieldbyname('QuantityUOM').asstring;
         strPieceUOM:=data.qrylocationinitem.fieldbyname('PieceUOM').asstring;
         strWeightUOM:=data.qrylocationinitem.fieldbyname('WeightUOM').asstring;
         strVolumeUOM:=data.qrylocationinitem.fieldbyname('VolumeUOM').asstring;
         strAreaUOM:=data.qrylocationinitem.fieldbyname('AreaUOM').AsString;
         strshipcusid:=data.qrylocationinitem.fieldbyname('shipcusid').asstring;
         strshipcusname:=data.qrylocationinitem.fieldbyname('shipcusname').asstring;
         strTagEachUOM:=data.qrylocationinitem.fieldbyname('TagEachUOM').asstring;
         strUOM1:=data.qrylocationinitem.fieldbyname('UOM1').asstring;
         strUOM2:=data.qrylocationinitem.fieldbyname('UOM2').asstring;
         strUOM3:=data.qrylocationinitem.fieldbyname('UOM3').asstring;
         strUOM4:=data.qrylocationinitem.fieldbyname('UOM4').asstring;
         strUOM5:=data.qrylocationinitem.fieldbyname('UOM5').asstring;
         strskuspec:=data.qrylocationinitem.fieldbyname('skuspec').asstring;
         strcolor:=data.qrylocationinitem.fieldbyname('color').asstring;
         strcustomerno:=data.qrylocationinitem.fieldbyname('customerno').asstring;
         strskumodel:=data.qrylocationinitem.fieldbyname('skumodel').asstring;
         strManufactureDate:=data.qrylocationinitem.fieldbyname('ManufactureDate').asstring;

         strlocid  :=data.qrylocationinitem.fieldbyname('locid').asstring;
         strlocname:=data.qrylocationinitem.fieldbyname('locname').asstring;

         extQuantitytask:=data.qrylocationinitem.fieldbyname('quantitytask').AsFloat;
         extPiecetask:=data.qrylocationinitem.fieldbyname('Piecetask').AsFloat;
         extNetWeighttask:=data.qrylocationinitem.fieldbyname('NetWeighttask').AsFloat;
         extGrossWeighttask:=data.qrylocationinitem.fieldbyname('GrossWeighttask').AsFloat;
         extVolumetask:=data.qrylocationinitem.fieldbyname('Volumetask').AsFloat;
         extAreatask:=data.qrylocationinitem.fieldbyname('Areatask').AsFloat;
         extCasing1task:=data.qrylocationinitem.fieldbyname('Casing1task').AsFloat;
         extCasing2task:=data.qrylocationinitem.fieldbyname('Casing2task').AsFloat;
         extCasing3task:=data.qrylocationinitem.fieldbyname('Casing3task').AsFloat;
         extCasing4task:=data.qrylocationinitem.fieldbyname('Casing4task').AsFloat;
         extCasing5task:=data.qrylocationinitem.fieldbyname('Casing5task').AsFloat;
         extPiecePro:=data.qrylocationinitem.fieldbyname('PiecePro').AsFloat;
         extVolumePro:=data.qrylocationinitem.fieldbyname('VolumePro').AsFloat;
         extAreaPro:=data.qrylocationinitem.fieldbyname('AreaPro').AsFloat;
         extnetWeightPro:=data.qrylocationinitem.fieldbyname('netWeightPro').AsFloat;
         extGrossWeightPro:=data.qrylocationinitem.fieldbyname('GrossWeightPro').AsFloat;
         extPro1:=data.qrylocationinitem.fieldbyname('Pro1').AsFloat;
         extPro2:=data.qrylocationinitem.fieldbyname('Pro2').AsFloat;
         extPro3:=data.qrylocationinitem.fieldbyname('Pro3').AsFloat;
         extPro4:=data.qrylocationinitem.fieldbyname('Pro4').AsFloat;
         extPro5:=data.qrylocationinitem.fieldbyname('Pro5').AsFloat;

         data.qryLocationINItem.DisableControls;
         data.qryLocationINItem.Edit;
         while intNum>0 do
         begin
            try
               data.qryLocationINItem.Post;
            except
               data.qryLocationINItem.EnableControls;
               break;
            end;
            data.qryLocationINItem.append;
            grdLocationINItemBeforeInsert;

            data.qrylocationinitem.fieldbyname('SKUID').AsString:=strSKUID;
            data.qrylocationinitem.fieldbyname('SKUName').asstring:=strSKUName;
            data.qrylocationinitem.fieldbyname('LotCode').asstring:=strLotCode;
            data.qrylocationinitem.fieldbyname('QualityName').asstring:=strQualityName;
            data.qrylocationinitem.fieldbyname('QuantityUOM').asstring:=strQuantityUOM;
            data.qrylocationinitem.fieldbyname('PieceUOM').asstring:=strPieceUOM;
            data.qrylocationinitem.fieldbyname('WeightUOM').asstring:=strWeightUOM;
            data.qrylocationinitem.fieldbyname('VolumeUOM').asstring:=strVolumeUOM;
            data.qrylocationinitem.fieldbyname('AreaUOM').AsString:=strAreaUOM;
            data.qrylocationinitem.fieldbyname('shipcusid').asstring:=strshipcusid;
            data.qrylocationinitem.fieldbyname('shipcusname').asstring:=strshipcusname;
            data.qrylocationinitem.fieldbyname('TagEachUOM').asstring:=strTagEachUOM;
            data.qrylocationinitem.fieldbyname('UOM1').asstring:=strUOM1;
            data.qrylocationinitem.fieldbyname('UOM2').asstring:=strUOM2;
            data.qrylocationinitem.fieldbyname('UOM3').asstring:=strUOM3;
            data.qrylocationinitem.fieldbyname('UOM4').asstring:=strUOM4;
            data.qrylocationinitem.fieldbyname('UOM5').asstring:=strUOM5;
            data.qrylocationinitem.fieldbyname('skuspec').asstring:=strskuspec;
            data.qrylocationinitem.fieldbyname('color').asstring:=strcolor;
            data.qrylocationinitem.fieldbyname('customerno').asstring:=strcustomerno;
            data.qrylocationinitem.fieldbyname('skumodel').asstring:=strskumodel;
            data.qrylocationinitem.fieldbyname('ManufactureDate').asstring:=strManufactureDate;

            data.qrylocationinitem.fieldbyname('locid').asstring:=strlocid;
            data.qrylocationinitem.fieldbyname('locname').asstring:=strlocname;

            data.qrylocationinitem.fieldbyname('quantitytask').AsFloat:=extQuantitytask;
            data.qrylocationinitem.fieldbyname('Piecetask').AsFloat:=extPiecetask;
            data.qrylocationinitem.fieldbyname('NetWeighttask').AsFloat:=extNetWeighttask;
            data.qrylocationinitem.fieldbyname('GrossWeighttask').AsFloat:=extGrossWeighttask;
            data.qrylocationinitem.fieldbyname('Volumetask').AsFloat:=extVolumetask;
            data.qrylocationinitem.fieldbyname('Areatask').AsFloat:=extAreatask;
            data.qrylocationinitem.fieldbyname('Casing1task').AsFloat:=extCasing1task;
            data.qrylocationinitem.fieldbyname('Casing2task').AsFloat:=extCasing2task;
            data.qrylocationinitem.fieldbyname('Casing3task').AsFloat:=extCasing3task;
            data.qrylocationinitem.fieldbyname('Casing4task').AsFloat:=extCasing4task;
            data.qrylocationinitem.fieldbyname('Casing5task').AsFloat:=extCasing5task;
            data.qrylocationinitem.fieldbyname('PiecePro').AsFloat:=extPiecePro;
            data.qrylocationinitem.fieldbyname('VolumePro').AsFloat:=extVolumePro;
            data.qrylocationinitem.fieldbyname('AreaPro').AsFloat:=extAreaPro;
            data.qrylocationinitem.fieldbyname('netWeightPro').AsFloat:=extnetWeightPro;
            data.qrylocationinitem.fieldbyname('GrossWeightPro').AsFloat:=extGrossWeightPro;
            data.qrylocationinitem.fieldbyname('Pro1').AsFloat:=extPro1;
            data.qrylocationinitem.fieldbyname('Pro2').AsFloat:=extPro2;
            data.qrylocationinitem.fieldbyname('Pro3').AsFloat:=extPro3;
            data.qrylocationinitem.fieldbyname('Pro4').AsFloat:=extPro4;
            data.qrylocationinitem.fieldbyname('Pro5').AsFloat:=extPro5;

            intNum:=intNum-1;
         end;
         data.qryLocationINItem.EnableControls;
      end;
   end;
end;

procedure TfrmLocationIN.quantityshortdetaiValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   //威扬
   data.qryLocationinDetail.FieldByName('quantityshort').AsFloat:=StrToFloat(IIF(grdLocationINDetail.InplaceEditor.GetEditingText='',0,grdLocationINDetail.InplaceEditor.GetEditingText));
   if data.qryLocationinDetail.FieldByName('quantityshort').AsInteger<>0 then
      data.qryLocationinDetail.FieldByName('casing5').AsFloat:=Trunc(data.qryLocationinDetail.FieldByName('quantity').AsFloat/data.qryLocationinDetail.FieldByName('quantityshort').AsFloat)
   else
      data.qryLocationinDetail.FieldByName('casing5').AsFloat:=0;
end;


procedure TfrmLocationIN.mitMulDelClick(Sender: TObject);
begin
   if data.qryLocationInItem.FieldByName('quantitydotask').AsFloat<>0 then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该笔已经产生出仓,不能删除!'
      else _strmessage:='该笔已经产生出仓,不能删除!'; }
      Kmessagedlg(GetMessage('frmLocationIN','022'),mtWarning,[mbyes], 0);
      exit;
   end;
   if not data.qryLocationInDetail.IsEmpty then
   begin
     { if _Language='CAPTIONC' then _strmessage:='该笔已经产生上架,请先删除上架!'
      else _strmessage:='该笔已经产生上架,请先删除上架!'; }
      Kmessagedlg(GetMessage('frmLocationIN','016'),mtWarning,[mbyes], 0);
      exit;
   end;

   data.qryLocationInItem.First;
   while not data.qryLocationInItem.Eof do
   begin
      if (data.qryLocationInItem.FieldByName('NotFullSign').AsString='T') then
         mitdelLocINItemClick(mitMulDel)
      else
         data.qryLocationInItem.Next;
   end;
end;

procedure TfrmLocationIN.timOperationDateDblClick(Sender: TObject);
begin
   if (DataState in Setdcs) and (_StrSysCus='SHRL') and (dtdOperationDate.Enabled=True) then
   begin
      if KmessageDlg('是否批量修改上架日期',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
         Exit;
         
      data.qryLocationInItem.DisableControls;
      data.qryLocationInDetail.DisableControls;
      data.qryLocationInItem.First;
      while not data.qryLocationInItem.Eof do
      begin
         data.qryLocationInItem.Edit;
         data.qryLocationInItem.FieldByName('operationdate').AsDateTime:=data.qryLocationIn.FieldByName('operationdate').AsDateTime;

         data.qryLocationInDetail.Filtered:=False;
         if data.qryLocationinItem.fieldbyname('SNO').AsString<>'' then
            data.qryLocationinDetail.filter:='SNO='+data.qryLocationinItem.fieldbyname('SNO').AsString
         else
            data.qryLocationinDetail.filter:='SNO=-1';
         data.qryLocationInDetail.Filtered:=True;

         data.qryLocationInDetail.First;
         while not data.qryLocationInDetail.Eof do
         begin
            data.qryLocationInDetail.Edit;
            data.qryLocationInDetail.FieldByName('operationdate').AsDateTime:=data.qryLocationIn.FieldByName('operationdate').AsDateTime;
            data.qryLocationInDetail.Post;
            data.qryLocationInDetail.Next;
         end;
         data.qryLocationInItem.Post;
         data.qryLocationInItem.Next;
      end;
      data.qryLocationInItem.EnableControls;
      data.qryLocationInDetail.EnableControls;
   end;
end;

procedure TfrmLocationIN.mitlotcodeClick(Sender: TObject);
var
   strlotcode:string;
begin
   strlotcode:='';
   OpenSql(qryTmp1,'  select quantitydo,quantitydotask,quantitydoorder from locationinitem (nolock)     '+chr(13)+chr(10)
                 +'    where jobno="'+data.qryLocationInItem.fieldbyname('jobno').AsString+'"  '+chr(13)+chr(10)
                 +'      and sno="'+data.qryLocationInItem.fieldbyname('sno').AsString+'"  ');
   if (qryTmp1.FieldByName('quantitydo').AsInteger<>0) or
      (qryTmp1.FieldByName('quantitydotask').AsInteger<>0) or
      (qryTmp1.FieldByName('quantitydoorder').AsInteger<>0)
      then
   begin
      kMessageDlg('该笔任务商品已经产生出仓不能调整批次！', mtWarning, [mbOK], 0);
      Exit;
   end;

   if KinputQuery('调整批次','新的批次：',strlotcode) then
   begin
      if strlotcode<>'' then
      begin
         ExecSql(qrytmp1,' update locationinitem     '
                        +'    set lotcode="'+strlotcode+'"  '
                        +'  where jobno="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                        +'    and sno='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                        +' update locationindetail    '
                        +'    set lotcode="'+strlotcode+'"  '
                        +'  where jobno="'+data.qryLocationInItem.FieldByname('jobno').AsString+'" '
                        +'    and sno='+data.qryLocationInItem.FieldByname('sno').AsString+' '
                );
      end else
       Exit;
   end else
      Exit;
   btnRefreshClick(Sender);
end;

procedure TfrmLocationIN.mitMulLotcodeClick(Sender: TObject);
var
   sltMullotcode:TStringList;
   i:integer;
begin
   sltMullotcode:=WorklotcodeTxt ('',false);
   if sltMullotcode<>nil then
   begin
      for i:=0 to sltMullotcode.Count-1 do
      begin
         data.qryLocationInItem.Edit;
         data.qryLocationInItem.Fieldbyname('lotcode').asstring:=sltMullotcode.Strings[i];
         data.qryLocationInItem.post;
         data.qryLocationInItem.Next;
      end;
   end;
end;

procedure TfrmLocationIN.N12Click(Sender: TObject);
begin
   if  data.qryLocationInItem.Fieldbyname('skuid').asstring<>'' then
   begin
      OpenSql(datatmp.qryTmp,' select skucostclassname   '
                            +'   from sku (nolock),skucostclass (nolock)      '
                            +'  where sku.skucostclasscd=skucostclass.skucostclasscd '
                            +'    and sku.skuid="'+data.qryLocationInItem.Fieldbyname('skuid').asstring+'"  '
                          );
      pWorkFormDll('BASECODE',Pchar('SKUSTORERULE'+datatmp.qryTmp.fieldbyname('skucostclassname').asstring)); 
   end;
end;

procedure TfrmLocationIN.mitRFClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
   WorkRFintxt('IN');
end;

procedure TfrmLocationIN.btnInPutClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if data.qrylocationin.FieldByName('operationname').AsString<>'' then
   begin
      kMessageDlg('该笔进仓单已经上架不能导入,请确认！', mtWarning, [mbOK], 0);
      Exit;
   end else
   begin
      workInPutlocin(data.qrylocationin.fieldbyname('jobno').AsString,
                     data.qrylocationin.fieldbyname('locationbillno').AsString,'I'
                     );
   end;
end;

procedure TfrmLocationIN.mitrkddhaClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstpara.Add('quantity='+floattostr(data.qryin.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qryin.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qryin.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qryin.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qryin.FieldByname('netweight').AsFloat));
   
   lstpara.Add('CreateName='+data.qrylocationin.FieldByname('CreateName').AsString);//dwq
   lstpara.Add('username='+data.qrylocationin.FieldByname('username').AsString);
   lstpara.Add('Locationbillno='+data.qrylocationin.FieldByname('Locationbillno').AsString);
   lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstpara.Add('cusbillno='+data.qrylocationin.FieldByname('cusbillno').AsString);
   lstpara.Add('Remark='+data.qrylocationin.FieldByname('Remark').AsString);
   lstpara.Add('opname='+data.qrylocationin.FieldByname('opname').AsString);
   lstpara.Add('checkname='+data.qrylocationin.FieldByname('checkname').AsString);
   lstpara.Add('taskcheckname='+data.qrylocationin.FieldByname('taskcheckname').AsString);
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('cusname='+data.qryin.FieldByname('cusname').Asstring);
   lstPara.Add('date='+DateToStr(Now));
   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);
   lstPara.Add('customsno='+data.qryLocationIN.fieldByname('customsno').AsString);
   DecodeDate(data.qryLocationIn.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno  '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);

   OpenSql(qryTmp1,'select organization.* from organization (nolock)  '
                  +' where userid=substring("'+data.qrylocationin.FieldByname('userid').Asstring+'",1,3) '
                         );
   lstPara.Add('comcname='+qryTmp1.fieldbyname('comcname').AsString);
   lstPara.Add('operationname='+data.qryLocationIN.fieldByname('operationname').AsString);

   OpenSql(dataTmp.qryTmp,'select top 1 locationinitem.weightuom '
                         +'  from locationinitem (nolock) '
                         +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('weightuom='+dataTmp.qryTmp.FieldByname('weightuom').AsString);

   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select detail.jobno,sku.skumodel,sku.skuspec,'+chr(13)+chr(10)
                         +'       detail.lotcode,detail.skuname, '+chr(13)+chr(10)
                         +'       detail.locname , '+chr(13)+chr(10)
                         +'       quantity=sum(isnull(detail.quantity,0)),piece=sum(isnull(detail.piece,0)),'+chr(13)+chr(10)
                         +'       netweight=sum(isnull(detail.netweight,0)),grossweight=sum(isnull(detail.grossweight,0)),'+chr(13)+chr(10)
                         +'       volume=sum(isnull(detail.volume,0)),area=sum(isnull(detail.area,0)),  '+chr(13)+chr(10)
                         +'       detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'       detail.locationbillno '+chr(13)+chr(10)
                         +'  from locationindetail detail (nolock) '+chr(13)+chr(10)
                         +'       left join sku (nolock)    '+chr(13)+chr(10)
                         +'              on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                         +' where detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         +' group by detail.jobno,sku.skumodel,sku.skuspec,detail.lotcode,detail.skuname,  '+chr(13)+chr(10)
                         +'          detail.quantityuom,detail.pieceuom,  detail.locname, '+chr(13)+chr(10)
                         +'          detail.weightuom,detail.locationbillno  '+chr(13)+chr(10)
                         +' order by detail.skuname, detail.locname '+chr(13)+chr(10)
                         );
   //lzw20101026
   opensql(datatmp.qryTmp1,'select loc=quality from location(nolock)                                   '
                          +' where classid in (select substring(classid,1,12) from location(nolock)    '
                          +'           where locid in (select top 1 locid from locationindetail(nolock)'
                          +'                  where jobno="'+data.qryLocationIn.FieldByName('jobno').AsString+'"))'
          );
   lstpara.Add('loc='+dataTmp.qryTmp1.FieldByname('loc').AsString);
   if (copy(_userid,0,3)='001') or (copy(_userid,0,3)='004' ) then
      Worklinprint('100003','old','入%库联系单',dataTmp.qryTmp,nil,nil,lstpara)
   else
      Worklinprint('900003','old','入%库联系单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationIN.mitcheckdbClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      OpenSql(dataTmp.qryTmp,'ksp_fzrkdbd @jobno="'+data.qryin.fieldbyname('jobno').AsString+'"');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900035';
         //lzw20110722
         paras.Values['locationbillno']:=data.qrylocationin.fieldbyname('locationbillno').AsString;
         paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
   
end;

procedure TfrmLocationIN.mituncheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if KmessageDlg('确认取消校验吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' update locationin                                   '+chr(13)+chr(10)
                    +'    set checkname="",checkdate=""                                    '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrylocationin.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    );

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   btnRefreshclick(self);
end;

procedure TfrmLocationIN.mitmulrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnorz,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationIN.SelectedCount;
   strjobnorz:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      begin
         if strjobnorz='' then strjobnorz:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnorz:=strjobnorz+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnorz='' then
   begin
      KMessageDlg('未选中要打印的进仓单',mtWarning,[mbOK],0);
      Exit;
   end;

   try

      OpenSql(dataTmp.qryTmp,'ksp_fzrkd @jobno="",@fillter='' jobno in('+strjobnorz+') '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900035';
         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
end;

procedure TfrmLocationIN.mitcancelcheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if KmessageDlg('确认取消扫描吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' DELETE ck_lskcheckdetail                            '+chr(13)+chr(10)
                             +'  where jobno="'+data.qrylocationin.fieldbyname('jobno').asstring+'"   '+chr(13)+chr(10)
                    );

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   btnRefreshclick(self);
end;

procedure TfrmLocationIN.mithxekrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      //OpenSql(dataTmp.qryTmp,'ksp_fzrkd @jobno="'+data.qrylocationin.fieldbyname('jobno').AsString+'" ');
      OpenSql(dataTmp.qryTmp,'ksp_hxekfzrkd @jobno="",@fillter='' jobno in("'+data.qrylocationin.fieldbyname('jobno').AsString+'") '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100035';
         //lzw20110722
         paras.Values['locationbillno']:=data.qrylocationin.fieldbyname('locationbillno').AsString;
         paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.mityzdinClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      OpenSql(dataTmp.qryTmp,'ksp_yzdfzrkd @jobno="",@fillter='' jobno in("'+data.qrylocationin.fieldbyname('jobno').AsString+'") '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100037';
         //lzw20110722
         paras.Values['locationbillno']:=data.qrylocationin.fieldbyname('locationbillno').AsString;
         paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
end;

procedure TfrmLocationIN.mitrkdinClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnorkdin,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationIN.SelectedCount;
   strjobnorkdin:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      begin
         if strjobnorkdin='' then strjobnorkdin:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnorkdin:=strjobnorkdin+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnorkdin='' then
   begin
      KMessageDlg('未选中要打印的进仓单',mtWarning,[mbOK],0);
      Exit;
   end;

   try
      OpenSql(dataTmp.qryTmp,'ksp_yzdfzrkd @jobno="",@fillter='' jobno in('+strjobnorkdin+') '' ');
      OpenSql(dataTmp.qryTmp1,'select top 1 locid=case when isnull(locationin.skucostclasscd,"")="XZ" then "100007"   '
                             +'                        when isnull(locationin.skucostclasscd,"")="FZ" then "100006"   '
                             +'                        else "" end ,'
                             +'             locname=case when isnull(locationin.skucostclasscd,"")="XZ" then "兴泰-鞋仓"   '
                             +'                        when isnull(locationin.skucostclasscd,"")="FZ" then "兴泰-服装仓"   '
                             +'                        else "" end ,operationdate=replace(".","-",locationin.operationdate) '
                             +'  from locationin(nolock)           '
                             +' where jobno in('+strjobnorkdin+')  '
                             +' order by operationdate desc '
               );
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100037';
         paras.Values['locid']:=dataTmp.qryTmp1.fieldbyname('locid').AsString;
         paras.Values['locname']:=dataTmp.qryTmp1.fieldbyname('locname').AsString;
         paras.Values['operationdate']:=dataTmp.qryTmp1.fieldbyname('operationdate').AsString;

         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.mitbzinClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnobzin,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationIN.SelectedCount;
   strjobnobzin:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      begin
         if strjobnobzin='' then strjobnobzin:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnobzin:=strjobnobzin+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnobzin='' then
   begin
      KMessageDlg('未选中要打印的进仓单',mtWarning,[mbOK],0);
      Exit;
   end;

   try
      //OpenSql(dataTmp.qryTmp,'ksp_yzdfzrkd @jobno="",@fillter='' jobno in('+strjobnobzin+') '' ');
      OpenSql(dataTmp.qryTmp,'select customerno=detail.serialno,detail.skuname,detail.quantityuom,color=detail.color, '
                            +'       colorid=skucolor.colorid,detail.skuspec,skuspec.specid,detail.quantity             '
                            +'  from locinskudetail detail(nolock)                                                    '
                            +'       left join skucolor(nolock)                                                       '
                            +'         on skucolor.skuid=detail.skuid                                                 '
                            +'        and skucolor.colorname=detail.color                                             '
                            +'       left join skuspec(nolock)                                                        '
                            +'         on skuspec.skuid=detail.skuid                                                  '
                            +'        and skuspec.specname=detail.skuspec                                             '
                            +' where jobno in('+strjobnobzin+')                                                       '
                            +' order by customerno    ' 
             );
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100038';
         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.mityzdfzrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnobzin,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationIN.SelectedCount;
   strjobnobzin:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      begin
         if strjobnobzin='' then strjobnobzin:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnobzin:=strjobnobzin+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnobzin='' then
   begin
      KMessageDlg('未选中要打印的进仓单',mtWarning,[mbOK],0);
      Exit;
   end;
   try
      OpenSql(dataTmp.qryTmp,'ksp_yzdfzrkd @jobno="",@fillter='' jobno in('+strjobnobzin+') '' ');

      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100039';
         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.miteltrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      OpenSql(dataTmp.qryTmp,'ksp_eltfzrkd @jobno="",@fillter='' jobno in("'+data.qrylocationin.fieldbyname('jobno').AsString+'") '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100040';
         //lzw20110722
         paras.Values['locationbillno']:=data.qrylocationin.fieldbyname('locationbillno').AsString;
         paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.miteltmulrkdClick(Sender: TObject);
var
  KF1Book:TKF1book;
  i,j:integer;
  strjobnorz,strmsg:string;
begin
   if pgcmain.ActivePage<>tbsBrowse then pgcmain.ActivePage:=tbsBrowse;
   j:=grdLocationIN.SelectedCount;
   strjobnorz:='';
   for i:=grdLocationIN.SelectedCount-1 Downto 0 do
   begin
      data.qryin.GotoBookmark(Pointer(grdLocationIN.SelectedRows[i]));
      begin
         if strjobnorz='' then strjobnorz:='"'+data.qryIn.fieldbyname('jobno').AsString+'"'
         else strjobnorz:=strjobnorz+',"'+data.qryIn.fieldbyname('jobno').AsString+'"';
      end;
   end;
   if strjobnorz='' then
   begin
      KMessageDlg('未选中要打印的进仓单',mtWarning,[mbOK],0);
      Exit;
   end;

   try

      OpenSql(dataTmp.qryTmp,'ksp_eltfzrkd @jobno="",@fillter='' jobno in('+strjobnorz+') '' ');
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='100040';
         //paras.Values['shippercusname']:=data.qrylocationin.fieldbyname('shipcusname').AsString;
         //paras.Values['date']:=DateToStr(data.qrylocationin.fieldbyname('operationdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmLocationIN.mitcustomsClick(Sender: TObject);
var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstpara.Add('quantity='+floattostr(data.qryin.FieldByname('quantity').Asfloat));
   lstpara.Add('piece='+floattostr(data.qryin.FieldByname('piece').Asfloat));
   lstpara.Add('volume='+floattostr(data.qryin.FieldByname('volume').AsFloat));
   lstpara.Add('grossweight='+floattostr(data.qryin.FieldByname('grossweight').AsFloat));
   lstpara.Add('netweight='+floattostr(data.qryin.FieldByname('netweight').AsFloat));
   
   lstpara.Add('CreateName='+data.qrylocationin.FieldByname('CreateName').AsString);//dwq
   lstpara.Add('username='+data.qrylocationin.FieldByname('username').AsString);
   lstpara.Add('Locationbillno='+data.qrylocationin.FieldByname('Locationbillno').AsString);
   lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstpara.Add('conno='+data.qrylocationin.FieldByname('conno').AsString);
   lstpara.Add('Remark='+data.qrylocationin.FieldByname('Remark').AsString);

   lstpara.Add('zbr='+_loginname);
   lstpara.Add('cusname='+data.qryin.FieldByname('cusname').Asstring);
   lstPara.Add('date='+DateToStr(Now));
   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);
   lstPara.Add('customsno='+data.qryLocationIN.fieldByname('customsno').AsString);
   DecodeDate(data.qryLocationIn.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);
   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   //客户编码
   OpenSql(datatmp.qryTmp,'select cuscode,cuscname,cushelpno  '
                         +'  from customer(nolock) '
                         +' where cusid="'+data.qryLocationIn.fieldbyname('costcusid').AsString+'"');
   lstPara.Add('cuscode='+datatmp.qryTmp.fieldbyname('cuscode').AsString);
   lstPara.Add('cuscname='+datatmp.qryTmp.fieldbyname('cuscname').AsString);
   
   OpenSql(qryTmp1,'select organization.* from organization (nolock)  '
                  +' where userid=substring("'+data.qrylocationin.FieldByname('userid').Asstring+'",1,3) '
                         );
   lstPara.Add('comcname='+qryTmp1.fieldbyname('comcname').AsString);
   lstPara.Add('operationname='+data.qryLocationIN.fieldByname('operationname').AsString);

   OpenSql(dataTmp.qryTmp,'select top 1 locationinitem.weightuom '
                         +'  from locationinitem (nolock) '
                         +' where jobno="'+data.qrylocationin.FieldByname('jobno').AsString+'" '
                         );
   lstPara.Add('weightuom='+dataTmp.qryTmp.FieldByname('weightuom').AsString);

   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select detail.jobno,modelspec=isnull(sku.skuspec,"")+" "+isnull(sku.skumodel,""),sku.customERno,'+chr(13)+chr(10)
                         +'       detail.lotcode,detail.skuname, '+chr(13)+chr(10)
                         +'       quantity=cast (isnull(detail.quantity,0) as varchar)+""+detail.quantityuom,piece=isnull(detail.piece,0),'+chr(13)+chr(10)
                         +'       netweight=isnull(detail.netweight,0),grossweight=isnull(detail.grossweight,0),'+chr(13)+chr(10)
                         +'       price=isnull(detail.price,0),skucost=isnull(detail.skucost,0),  '+chr(13)+chr(10)
                         +'       detail.quantityuom,detail.pieceuom,detail.weightuom,'+chr(13)+chr(10)
                         +'       detail.locationbillno,detail.currcd  '+chr(13)+chr(10)
                         +'  from locationindetail detail (nolock) '+chr(13)+chr(10)
                         +'       left join sku (nolock)    '+chr(13)+chr(10)
                         +'              on detail.skuid=sku.skuid     '+chr(13)+chr(10)
                         +' where detail.jobno="'+data.qryIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   //lzw20101026

   Worklinprint('100601','old','进库海关审批清单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationIN.N15Click(Sender: TObject);

var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstpara.Add('locationbillno='+data.qrylocationin.FieldByname('locationbillno').AsString);   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);
   DecodeDate(data.qryLocationIn.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstPara.Add('carbrand='+data.qryLocationIN.fieldByname('carbrand').AsString);
   lstpara.Add('conno='+data.qrylocationin.FieldByname('conno').AsString);
   lstpara.Add('remark='+data.qrylocationin.FieldByname('remark').AsString);
   OpenSql(dataTmp.qryTmp,'select top 1 operationtime=convert(varchar(10),locationin.operationdate,108) '+chr(13)+chr(10)
                         +'  from locationin (nolock) '+chr(13)+chr(10)
                         +' where locationin.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         );
   lstPara.Add('operationtime='+dataTmp.qryTmp.FieldByname('operationtime').AsString);
   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select skuname , lotcode, skuspec,remarkitem=remark,  '+chr(13)+chr(10)                         +'       piece ,grossweight,volume,locname              '+chr(13)+chr(10)                         +'  from locationInItem(nolock)                         '+chr(13)+chr(10)
                         +' where locationInItem.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)                         );

   Worklinprint('900119','old','货物进仓单',dataTmp.qryTmp,nil,nil,lstpara);

end;

procedure TfrmLocationIN.mitjgrkdClick(Sender: TObject);

var
   lstPara:TStringList;
   stryear,strmonth,strday:Word;
   strdate:string;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);

   DecodeDate(data.qryLocationIn.FieldByname('operationdate').AsDateTime,strYear,strMonth,strDay);   strdate:=inttostr(stryear)+' 年 '+inttostr(strmonth)+' 月 '+inttostr(strday)+' 日 ';
   lstPara.Add('operationdate='+strdate);
   lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstpara.Add('cusname='+data.qrylocationin.FieldByname('cusname').AsString);
   lstpara.Add('shippercusname='+data.qrylocationin.FieldByname('shippercusname').AsString);
   lstpara.Add('conno='+data.qrylocationin.FieldByname('conno').AsString);
   lstpara.Add('OriginOrder='+data.qrylocationin.FieldByname('OriginOrder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
    OpenSql(dataTmp.qryTmp,'select sum(isnull(quantity,0)) as quantityall                                         '+chr(13)+chr(10)
                         +'  from locationIndetail  (nolock)                                                      '+chr(13)+chr(10)
                         +' where locationIndetail.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"   '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
   OpenSql(dataTmp.qryTmp1,'select pieceall=sum(case when isnull(ceiling(isnull(locationindetail.quantity,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0         '+chr(13)+chr(10)
                          +'                    else ceiling(isnull(locationindetail.quantity,0)/cast(sku.piecepro as numeric(16,0))) end )                            '+chr(13)+chr(10)
                          +'  from locationindetail(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                                '+chr(13)+chr(10)
                          +'              on sku.skuid=locationindetail.skuid                                           '+chr(13)+chr(10)
                          +' where locationindetail.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"        '+chr(13)+chr(10)
                          );
   lstPara.Add('pieceall='+dataTmp.qryTmp1.FieldByname('pieceall').AsString);
   GenInformations(lstPara);

   OpenSql(qryTmp,'select detail.skuname,sku.skumodel,sku.skuspec,sku.piecepro,sku.pieceuom,                             '+chr(13)+chr(10)                 +'       detail.quantity,quantityuom,detail.serialno, sku.customerno,sku.customsno,                     '+chr(13)+chr(10)                 +'       piece=case when sku.piecepro is null then ""                                                   '+chr(13)+chr(10)
                 +'                else (case when isnull(cast(FLOOR(isnull(detail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then ""      '+chr(13)+chr(10)
                 +'                     else cast(FLOOR(isnull(detail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end               '+chr(13)+chr(10)
                 +'                     +case when  isnull((cast(isnull(detail.quantity,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                 '+chr(13)+chr(10)
                 +'                      else cast(cast(isnull(detail.quantity,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end   ,     '+chr(13)+chr(10)
                 +'       piece2=case when sku.piecepro is null then 0                                                                                                '+chr(13)+chr(10)                 +'                else ceiling(isnull(detail.quantity,0)/cast(sku.piecepro as numeric(16,0)))   end,                                                 '+chr(13)+chr(10)
                 +'       detail.locname,detail.volume,detail.remark, detail.manufacturedate                    '+chr(13)+chr(10)
                 +'  from locationIndetail detail  (nolock)                                                     '+chr(13)+chr(10)
                 +'  left join sku (nolock)                                                                     '+chr(13)+chr(10)
                 +'         on detail.skuid=sku.skuid                                                           '+chr(13)+chr(10)
                 +' where detail.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"                   '+chr(13)+chr(10)                 );

   Worklinprint('101001','old','嘉功入库清单',qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationIN.mitjgrkplanClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;

   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara.Add('costcusname='+data.qryLocationIN.fieldByname('costcusname').AsString);
   lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('blno='+data.qrylocationin.FieldByname('blno').AsString);
   lstpara.Add('cusname='+data.qrylocationin.FieldByname('cusname').AsString);
   lstpara.Add('conno='+data.qrylocationin.FieldByname('conno').AsString);
   lstpara.Add('OriginOrder='+data.qrylocationin.FieldByname('OriginOrder').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));

   OpenSql(dataTmp.qryTmp,'select sum(isnull(quantitytask,0)) as quantityall                                         '+chr(13)+chr(10)
                         +'  from locationInItem(nolock)                                                             '+chr(13)+chr(10)
                         +' where locationInItem.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"        '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);

   OpenSql(dataTmp.qryTmp1,'select pieceall=sum(case when isnull(ceiling(isnull(locationInItem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0         '+chr(13)+chr(10)
                          +'                    else ceiling(isnull(locationInItem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end )                            '+chr(13)+chr(10)
                          +'  from locationInItem(nolock)                                                             '+chr(13)+chr(10)
                          +'       left join sku(nolock)                                                              '+chr(13)+chr(10)
                          +'              on sku.skuid=locationInItem.skuid                                           '+chr(13)+chr(10)
                          +' where locationInItem.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"        '+chr(13)+chr(10)
                          );
   lstPara.Add('pieceall='+dataTmp.qryTmp1.FieldByname('pieceall').AsString);
     GenInformations(lstPara);
   OpenSql(qryTmp,'select item.skuname,sku.skumodel,sku.customerno,remark=isnull(item.remark,""),                           '+chr(13)+chr(10)                 +'       sku.skuspec,sku.pieceuom,sku.quantityuom,sku.customsno,item.manufacturedate,                      '+chr(13)+chr(10)                 +'       quantitytask=cast(item.quantitytask as int), sku.piecepro,item.serialno,                          '+chr(13)+chr(10)                 +'       piecetask=case when sku.piecepro is null then ""                                                  '+chr(13)+chr(10)
                 +'                else (case when isnull(cast(FLOOR(isnull(item.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then ""      '+chr(13)+chr(10)
                 +'                     else cast(FLOOR(isnull(item.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end               '+chr(13)+chr(10)
                 +'                     +case when  isnull((cast(isnull(item.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                 '+chr(13)+chr(10)
                 +'                      else cast(cast(isnull(item.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end         '+chr(13)+chr(10)
                 +'       piecetask2=case when sku.piecepro is null then 0                                                                                              '+chr(13)+chr(10)
                 +'                else ceiling(isnull(item.quantitytask,0)/cast(sku.piecepro as numeric(16,0)))   end,                                                   '+chr(13)+chr(10)
                 +'  from locationInItem item(nolock)                                                     '+chr(13)+chr(10)
                 +'        left join sku(nolock)                                                          '+chr(13)+chr(10)
                 +'               on sku.skuid=item.skuid                                                 '+chr(13)+chr(10)
                 +' where item.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"               '+chr(13)+chr(10)                );

   Worklinprint('101018','old','嘉功预入库货物清单',qryTmp,nil,nil,lstPara);
end;

procedure TfrmLocationIN.mitlocationClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstPara.Add('zbrq='+datetostr(getserverdate));
   lstpara.Add('zbr='+_loginname);

   GenInformations(lstPara);

   OpenSql(dataTmp.qryTmp,'select locname,location.*        '+chr(13)+chr(10)                         +'  from location  (nolock)                    '+chr(13)+chr(10)
                         +' where not exists (select 1 from locationindetail detail(nolock)  '+chr(13)+chr(10)                         +'                    where detail.locid=location.locid)            '+chr(13)+chr(10)                         +'    or exists (select 1 from locationindetail detail(nolock)      '+chr(13)+chr(10)                         +'                where detail.locid=location.locid                 '+chr(13)+chr(10)                         +'                  and isnull(detail.quantity,0)-isnull(quantitydo,0)=0  )   '+chr(13)+chr(10)                         +'   and isnull(location.isdetail,"")="T"                  '+chr(13)+chr(10)                         );

   Worklinprint('100403','old','空仓位信息表',dataTmp.qryTmp,nil,nil,lstpara);

end;
//by lhl
procedure TfrmLocationIN.dxsearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key=Vk_Return) then
    begin
       if dxsearch.text<>''
       then data.qryLocationInItem.locate('Jobno;skuname',VarArrayOf([data.qryIn.fieldbyname('jobno').AsString,dxsearch.text]),
                               [loCaseInsensitive, loPartialKey])
       else KMessageDlg('找不到该商品！',mtWarning,[mbOK],0);
    end;
end;

procedure TfrmLocationIN.mitinputlocClick(Sender: TObject);
var
   strName:string;
   i,j:Integer;
   sltTable:TStringList;
   strthecode,strthename:string;
begin
   dlgInput.filename:='';
   if dlgInput.Execute then
   begin
      strName:= dlgInput.filename;
      if pos('.XLS',UpperCase(Trim(ExtractFileName(strName))))>0 then
      begin
         data.conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
         if data.conMtf.Connected then
            data.conMtf.open;
         try
            strSql:=' Select *  from [sheet1$]';
            data.AqryMtf.Close;
            data.AqryMtf.SQL.Clear;
            data.AqryMtf.SQL.Add(strSql);
            data.AqryMtf.Open;
         except
            KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
            data.conMtf.Close;
            Exit;
         end;
//处理临时表
         ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects                    '+chr(13)+chr(10)
                       +' where id=object_id("tempdb..#locindetail") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                       +'  drop table #locindetail                                         '+chr(13)+chr(10)
                       +'select ldsno ,sno,skuname,quantity,locname                        '+chr(13)+chr(10)
                       +'  into #locindetail                                               '+chr(13)+chr(10)
                       +'  from locationindetail (nolock)                                  '+chr(13)+chr(10)
                       +' where 1=2                                                        '+chr(13)+chr(10)
                );
         Application.ProcessMessages;
         I:=1;
         data.AqryMtf.DisableControls;
         data.AqryMtf.First;
         try
            while not data.AqryMtf.Eof do
            begin
               if data.AqryMtf.Fields[1].AsString<>'' then
               ExecSql(qryTmp,' Insert Into #locindetail  '+chr(13)+chr(10)
                             +' values (                  '+chr(13)+chr(10)
                             +'       "'+data.AqryMtf.Fields[0].AsString+'",             '+chr(13)+chr(10)
                             +'       "'+data.AqryMtf.Fields[1].AsString+'",             '+chr(13)+chr(10)
                             +'       "'+data.AqryMtf.Fields[2].AsString+'",             '+chr(13)+chr(10)
                             +'       "'+data.AqryMtf.Fields[3].AsString+'",             '+chr(13)+chr(10)
                             +'       "'+data.AqryMtf.Fields[4].AsString+'"               '+chr(13)+chr(10)
                             +'     )     '+chr(13)+chr(10)
                             );
               I:=I+1;
               data.AqryMtf.next;
            end;
            data.AqryMtf.EnableControls;
        except
            data.AqryMtf.EnableControls;
            KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
            data.conMtf.Close;
            Exit;
         end;
//开始导入
         _ADOConnection.StartTransaction;
         try
            ExecSql(qrytmp,' insert into locationindetail  ( '
                          +'        jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                            '+chr(13)+chr(10)
                          +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                           '+chr(13)+chr(10)
                          +'        cusname,shippercusid,shippercusname,iuserid,iusername,locid,locname,                       '+chr(13)+chr(10)
                          +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                          +'        costcusid,costcusname,cusbillno                                                           '+chr(13)+chr(10)
                          +'          ) '+chr(13)+chr(10)
                          +'select item.jobno,item.jobno,item.sno,item.sno,item.sno,#locindetail.ldsno,     '+chr(13)+chr(10)
                          +'       item.sno,item.skuid,item.skuname,                                        '+chr(13)+chr(10)
                          +'       item.qualityname,item.userid,item.username,item.quantityuom,             '+chr(13)+chr(10)
                          +'       #locindetail.quantity,item.taskdate,item.cusid,                          '+chr(13)+chr(10)
                          +'       item.cusname,item.shippercusid,item.shippercusname,                      '+chr(13)+chr(10)
                          +'       item.iuserid,item.iusername,location.locid,#locindetail.locname,         '+chr(13)+chr(10)
                          +'       item.operationtype,"'+datetostr(getserverdate)+'",item.warerentcounttype,'+chr(13)+chr(10)
                          +'       item.countrent,item.locationbillno,                                      '+chr(13)+chr(10)
                          +'       item.costcusid,item.costcusname,item.cusbillno                           '+chr(13)+chr(10)
                          +'  from #locindetail    (nolock)                                                 '+chr(13)+chr(10)
                          +'       left join locationinitem item (nolock)                                   '+chr(13)+chr(10)
                          +'              on item.sno=#locindetail.sno                                      '+chr(13)+chr(10)
                          +'       left join location (nolock)                                              '+chr(13)+chr(10)
                          +'              on #locindetail.locname=location.locname                          '+chr(13)+chr(10)
                          +' where 1=1                                                                      '+chr(13)+chr(10)
                          +'   and item.jobno="'+data.qryin.fieldbyname('jobno').asstring+'"                '+chr(13)+chr(10)
                        //  +'declare @sno int                                          '+chr(13)+chr(10)
                        //  +'select @sno=1                                            '+chr(13)+chr(10)
                         // +'update #lskformatin                                      '+chr(13)+chr(10)
                         // +'   set ldsno=@sno,@sno=@sno+1                            '+chr(13)+chr(10)
                                    );
            //_ADOConnection.commit;
         except
            _ADOConnection.Rollback;
            //KMessageDlg('导入失败！',mtWarning,[mbOk],0);
            KMessageDlg(_strdefeated, mtWarning,[mbOk],0);
            ExecSql(qryTmp,' if exists (select * from tempdb..sysobjects'+chr(13)+chr(10)
                          +'            where id = object_id("tempdb..#locindetail") and sysstat & 0xf = 3)'+chr(13)+chr(10)
                          +'  drop table #locindetail ');
            data.conMtf.Close;
            Exit;
         end;

         execsql(qrytmp,'update locationin                                            '+chr(13)+chr(10)
                        +'  set operationdate="'+datetostr(getserverdate)+'",         '+chr(13)+chr(10)
                        +'      operationname="'+_loginname+'"                        '+chr(13)+chr(10)
                        +'where jobno="'+data.qryin.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
                         );
         execsql(qrytmp,'update locationindetail                                                                        '+chr(13)+chr(10)
                        +'  set piece=(case when isnull(piecepro,0)<>0 then isnull(quantity,0)/piecepro else 0 end)     '+chr(13)+chr(10)
                        +' from locationindetail                                                '+chr(13)+chr(10)
                        +'      left join sku                                                   '+chr(13)+chr(10)
                        +'             on locationindetail.skuid=sku.skuid                      '+chr(13)+chr(10)
                        +'where jobno="'+data.qryin.fieldbyname('jobno').asstring+'"            '+chr(13)+chr(10)
                         );
         execsql(qrytmp,'update locationinitem                                               '+chr(13)+chr(10)
                        +'  set quantity=(select sum(isnull(locationindetail.quantity,0))    '+chr(13)+chr(10)
                        +'                  from locationindetail                            '+chr(13)+chr(10)
                        +'                 where locationinitem.jobno=locationindetail.jobno '+chr(13)+chr(10)
                        +'                   and locationinitem.sno=locationindetail.sno ),  '+chr(13)+chr(10)
                        +'      piece=(select sum(isnull(locationindetail.piece,0))          '+chr(13)+chr(10)
                        +'                  from locationindetail                            '+chr(13)+chr(10)
                        +'                 where locationinitem.jobno=locationindetail.jobno '+chr(13)+chr(10)
                        +'                   and locationinitem.sno=locationindetail.sno )   '+chr(13)+chr(10)
                        +'where jobno="'+data.qryin.fieldbyname('jobno').asstring+'"         '+chr(13)+chr(10)
                         );
         ExecSql(qryTmp,' if exists (select * from tempdb..sysobjects                                           '+chr(13)+chr(10)
                       +'            where id = object_id("tempdb..#locindetail") and sysstat & 0xf = 3)        '+chr(13)+chr(10)
                       +'  drop table #locindetail                                                              '+chr(13)+chr(10)
                       );
         data.conMtf.Close;

         btnRefresh.Click;
         KMessageDlg('上架成功。',mtInformation,[mbOK],0);
        // KMessageDlg(_strsucceed, mtWarning,[mbOk],0);
      end;
   end;
end;

procedure TfrmLocationIN.mitcheckinoutClick(Sender: TObject);
var
    lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
    lstpara.Add('mainorder='+data.qrylocationin.FieldByname('mainorder').AsString);
   lstpara.Add('cusname='+data.qrylocationin.FieldByname('cusname').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
   GenInformations(lstPara);
   OpenSql(qryTmp,' if exists (select * from tempdb..sysobjects  '+chr(13)+chr(10)                 +'             where id = object_id("tempdb..#lskjymx") and sysstat & 0xf = 3)  '+chr(13)+chr(10)
                 +'      drop table #lskjymx  '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)                 +'select xh=IDENTITY(int,1,1),detail.jobno,detail.sno,detail.ldsno,detail.cusname,detail.lotcode,detail.skuname,sku.customerno,detail.quantity,sku.piecepro,   '+chr(13)+chr(10)                 +'       piece=case when sku.piecepro is null then ""                                                                                                      '+chr(13)+chr(10)
                 +'               else (case when isnull(cast(FLOOR(isnull(detail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""            '+chr(13)+chr(10)
                 +'                      else cast(FLOOR(isnull(detail.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                            '+chr(13)+chr(10)
                 +'            +case when  isnull((cast(isnull(detail.quantity,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                                '+chr(13)+chr(10)
                 +'              else cast(cast(isnull(detail.quantity,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                                 '+chr(13)+chr(10)
	         +'        locout.mainorder,outitem.quantitytask,                                                                                                           '+chr(13)+chr(10)
                 +'        pieceout=case when sku.piecepro is null then ""                                                                                                  '+chr(13)+chr(10)
                 +'                  else (case when isnull(cast(FLOOR(isnull(outitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                 +'                       else cast(FLOOR(isnull(outitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                      '+chr(13)+chr(10)
                 +'                +case when  isnull((cast(isnull(outitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                       '+chr(13)+chr(10)
                 +'                     else cast(cast(isnull(outitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end ,                     '+chr(13)+chr(10)
                 +'        pieceout2=case when sku.piecepro is null then 0                                                                                                  '+chr(13)+chr(10)
                 +'                else ceiling(isnull(outitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)))   end,                                                  '+chr(13)+chr(10)
                 +'        sypiece=case when sku.piecepro is null then 0                                                                                                    '+chr(13)+chr(10)
		 +'               else  ceiling((isnull(detail.quantity,0)-                                                                                                 '+chr(13)+chr(10)
                 +'                     isnull((select sum(isnull(quantitytask,0))                                                                                           '+chr(13)+chr(10)
                 +'                               from locationoutitem                                                                                                      '+chr(13)+chr(10)
                 +'                              where locationoutitem.jobnoin=detail.jobno                                                                                 '+chr(13)+chr(10)
                 +'                                and locationoutitem.snoin=detail.sno                                                                                     '+chr(13)+chr(10)
		 +'                                and locationoutitem.snolocin=detail.ldsno ),0))/cast(sku.piecepro as numeric(16,0)))   end,                               '+chr(13)+chr(10)
                 +'       syquantity=isnull(detail.quantity,0)-                                                                                                                 '+chr(13)+chr(10)
                 +'                     isnull((select sum(isnull(quantitytask,0))                                                                                           '+chr(13)+chr(10)
                 +'                               from locationoutitem                                                                                                      '+chr(13)+chr(10)
                 +'                              where locationoutitem.jobnoin=detail.jobno                                                                                 '+chr(13)+chr(10)
                 +'                                and locationoutitem.snoin=detail.sno                                                                                     '+chr(13)+chr(10)
		 +'                                and locationoutitem.snolocin=detail.ldsno ),0),                                                                    '+chr(13)+chr(10)
	         +'       locout.routing,detail.locname,detail.serialno                                                                                                     '+chr(13)+chr(10)
                 +'  into #lskjymx                                                                                                                                         '+chr(13)+chr(10)
                 +'  from locationindetail detail(nolock)                                                                                                                   '+chr(13)+chr(10)
                 +'       left join locationoutitem outitem(nolock)                                                                                                         '+chr(13)+chr(10)
	         +'                 left join locationout locout(nolock)                                                                                                    '+chr(13)+chr(10)
                 +'                        on outitem.jobno=locout.jobno                                                                                                    '+chr(13)+chr(10)
	         +'             on outitem.jobnoin=detail.jobno                                                                                                             '+chr(13)+chr(10)
	         +'            and outitem.snoin=detail.sno                                                                                                                 '+chr(13)+chr(10)
	         +'            and outitem.snolocin=detail.ldsno                                                                                                            '+chr(13)+chr(10)
                 +'       left join sku                                                                                                                                     '+chr(13)+chr(10)
	         +'               on sku.skuid=detail.skuid                                                                                                                 '+chr(13)+chr(10)
                 +' where detail.jobno="'+data.qrylocationIn.FieldByName('jobno').AsString+'"                                                                               '+chr(13)+chr(10)
                 +' order by detail.skuname                                                                                                                                 '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +' declare @jobno varchar(20),  '+chr(13)+chr(10)
                 +'         @sno int,  '+chr(13)+chr(10)
                 +'         @xh  int , '+chr(13)+chr(10)
                 +'         @ldsno int '+chr(13)+chr(10)
                 +'    '+chr(13)+chr(10)
                 +' declare @jobnoold varchar(20),  '+chr(13)+chr(10)
                 +'         @snoold int,  '+chr(13)+chr(10)
                 +'         @ldsnoold int '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +'  select @jobnoold="",@snoold=-1,@ldsno=-1  '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +' declare jymx_Cursor cursor For  '+chr(13)+chr(10)
                 +'  select jobno,sno,ldsno,xh  '+chr(13)+chr(10)
                 +'    from #lskjymx  '+chr(13)+chr(10)
                 +'   order by jobno,sno,ldsno '+chr(13)+chr(10)
                 +'    Open jymx_Cursor  '+chr(13)+chr(10)
                 +' Fetch next from jymx_Cursor into @jobno,@sno,@ldsno,@xh  '+chr(13)+chr(10)
                 +' while @@Fetch_Status=0  '+chr(13)+chr(10)
                 +' begin  '+chr(13)+chr(10)
                 +'    if @jobnoold=@jobno and @snoold=@sno and  @ldsnoold=@ldsno '+chr(13)+chr(10)
                 +'    begin  '+chr(13)+chr(10)
                 +'       update #lskjymx  '+chr(13)+chr(10)
                 +'          set syquantity=null,sypiece=null,quantity=null,piecepro=null,piece=null '+chr(13)+chr(10)
                 +'        where xh=@xh  '+chr(13)+chr(10)
                 +'    end  '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +'    select @jobnoold=@jobno,@snoold=@sno, @ldsnoold=@ldsno  '+chr(13)+chr(10)
                 +'  '+chr(13)+chr(10)
                 +'    Fetch next from jymx_Cursor into @jobno,@sno,@ldsno,@xh  '+chr(13)+chr(10)
                 +' end  '+chr(13)+chr(10)
                 +' close jymx_Cursor  '+chr(13)+chr(10)
                 +' DEALLOCATE jymx_Cursor  '+chr(13)+chr(10)
                 +' select * from #lskjymx  '+chr(13)+chr(10)
                 +'   drop table #lskjymx  '+chr(13)+chr(10)
                );
   Worklinprint('101023','old','进仓校验明细表',qryTmp,nil,nil,lstPara);
end;

procedure TfrmLocationIN.mitconskuClick(Sender: TObject);
begin
   workconskuselect;
end;
procedure TfrmLocationIN.btncheckskuClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if _strsyscus='XT' then
   begin
      if data.qrylocationin.FieldByname('checkname').AsString<>'' then
      begin
        KMessageDlg('校验已审核！',mtWarning,[mbOK],0);
        Exit;
      end else
        worklocoutcash(data.qrylocationin.FieldByName('jobno').AsString);
        //frmLocationIN.btnRefresh.OnClick(Sender);
   end;   
end;

procedure TfrmLocationIN.mitrfinClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if pgcLocationINOUT.activepage<>tbsSKU then pgcLocationINOUT.activepage:=tbsSKU;
   //WorkRFmultxt('IN');
end;

procedure TfrmLocationIN.mitcancelconClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if KmessageDlg('确认取消装箱吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' DELETE locationinoutcon                               '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrylocationin.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    +' DELETE locationinoutconsku                            '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrylocationin.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    );

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   btnRefreshclick(self);
end;

end.
