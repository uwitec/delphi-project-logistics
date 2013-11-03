unit LocationOther;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, LIBPROC ,libUser, Menus ,LibBb,
  KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient;

type
  TfrmLocationOther = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel4: TBevel;
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
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    btnTotal: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdWareOther: TdxDBGrid;
    TASKDATE: TdxDBGridColumn;
    LocationBillNO: TdxDBGridColumn;
    costcusname: TdxDBGridColumn;
    SKUNAME: TdxDBGridColumn;
    QUANTITY: TdxDBGridColumn;
    UserName: TdxDBGridColumn;
    checkname: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdTaskDate: TdxDBDateEdit;
    pgcWareOther: TdxPageControl;
    tbsWareOther: TdxTabSheet;
    tbsWareOtherItemTask: TdxTabSheet;
    edtWO_Userid: TdxDBButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    edtLocationBillNO: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    PIECE: TdxDBGridColumn;
    ppmTotal: TPopupMenu;
    mitSplit: TMenuItem;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    OperationDaterq: TdxDBGridColumn;
    createname: TdxDBGridColumn;
    tbsWareOtherItem: TdxTabSheet;
    cmbSKUClass: TKinDbPickEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    ppmSKUTask: TPopupMenu;
    mitSKUSelect: TMenuItem;
    mitOrderSKUSelect: TMenuItem;
    popPrint: TPopupMenu;
    mitWareOtherTask: TMenuItem;
    mitWareOtherItem: TMenuItem;
    btnOper: TKBitBtn;
    edtCusbillno: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtOperationDate: TdxDBDateEdit;
    GMSStickyLabel9: TGMSStickyLabel;
    KGroupBox3: TKGroupBox;
    memRemark1: TdxDBMemo;
    operationname: TdxDBGridColumn;
    timTASKDATE: TdxDBTimeEdit;
    timOperationDate: TdxDBTimeEdit;
    costcheckname: TdxDBGridColumn;
    popWareOrderOriSKU: TPopupMenu;
    mitAddOriSKU: TMenuItem;
    mitDelOriSKU: TMenuItem;
    popWareOrderSKU: TPopupMenu;
    mitAddSKU: TMenuItem;
    mitDelSKU: TMenuItem;
    KGroupBox2: TKGroupBox;
    gmsConsignAccountID: TGMSStickyLabel;
    GMSStickyLabel37: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    GMSStickyLabel49: TGMSStickyLabel;
    GMSStickyLabel50: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel35: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel20: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    cmbConsignAccountID: TdxDBButtonEdit;
    cmbCarrierCus: TdxDBButtonEdit;
    edtOPID: TdxDBButtonEdit;
    edtCARRIERNO: TdxDBEdit;
    edtConquantity: TdxDBCalcEdit;
    edtCondes: TdxDBEdit;
    edtMainOrder: TdxDBEdit;
    edtCarbrand: TdxDBEdit;
    edtETSH: TdxDBDateEdit;
    timETSH: TdxDBTimeEdit;
    edtFC_PORTDCD: TdxDBButtonEdit;
    edtFC_TRANSCD: TdxDBButtonEdit;
    edtFC_PORTLCD: TdxDBButtonEdit;
    edtCarrierName: TKinDbPickEdit;
    edtIsbond: TdxDBCheckEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCustomsNO: TdxDBEdit;
    TASKDATEsj: TdxDBGridColumn;
    OperationDatesj: TdxDBGridColumn;
    edtconno: TdxDBBlobEdit;
    GMSStickyLabel23: TGMSStickyLabel;
    edtTotalCost: TdxDBCalcEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    rdgLoadType: TKDBRadioGroup;
    GMSStickyLabel30: TGMSStickyLabel;
    timConloaddate: TdxDBTimeEdit;
    dtdConloaddate: TdxDBDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    ppmCheck: TPopupMenu;
    mitCheck: TMenuItem;
    mitCheckCancel: TMenuItem;
    grpinfobar: TKGroupBox;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel24: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCheckName: TdxDBEdit;
    edtOperationName: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    edtCostCHECKNAME: TdxDBEdit;
    tbsAutoCost: TdxTabSheet;
    grdAutoCost: TdxDBGrid;
    grdSnoCost: TdxDBGridColumn;
    grdCostCDCost: TdxDBGridKinPickColumn;
    grdIsInComeCost: TdxDBGridCheckColumn;
    grdIsMainRateCost: TdxDBGridCheckColumn;
    rateuomtypeCost: TdxDBGridKinPickColumn;
    grdCostCusCost: TdxDBGridKinPickColumn;
    grdRateCusCost: TdxDBGridKinPickColumn;
    grdCostCusNameCost: TdxDBGridButtonColumn;
    grdRateCusNameCost: TdxDBGridButtonColumn;
    grdCountway: TdxDBGridPickColumn;
    Skuwtve: TdxDBGridCurrencyColumn;
    ppmCost: TPopupMenu;
    mitCostAdd: TMenuItem;
    mitCostdel: TMenuItem;
    N1: TMenuItem;
    mitAddAutoCost: TMenuItem;
    mitUpdAutoCost: TMenuItem;
    mitDelAutoCost: TMenuItem;
    ppmEdit: TPopupMenu;
    mitOperation: TMenuItem;
    costquantitytasked: TdxDBGridColumn;
    grdWareOtherItem: TdxDBGrid;
    edtSkuMainorder: TdxDBGridColumn;
    edtSkuCostcusname: TdxDBGridButtonColumn;
    edtSkuShipperAccountID: TdxDBGridButtonColumn;
    edtSkuShipcusname: TdxDBGridButtonColumn;
    edtSkuAccountID: TdxDBGridButtonColumn;
    edtSkuLocname: TdxDBGridButtonColumn;
    edtSkuSKUName: TdxDBGridButtonColumn;
    edtSkuCustomerno: TdxDBGridColumn;
    edtSkuSkumodel: TdxDBGridColumn;
    edtSkuSkuspec: TdxDBGridColumn;
    edtSkuColor: TdxDBGridColumn;
    edtSkuLotCode: TdxDBGridColumn;
    edtSkuQUANTITY: TdxDBGridCurrencyColumn;
    dtdSkuManufactureDate: TdxDBGridDateColumn;
    cmbSkuQUANTITYUOM: TdxDBGridPickColumn;
    edtSkuPiece: TdxDBGridCurrencyColumn;
    cmbSkuPieceUOM: TdxDBGridPickColumn;
    edtSkuVolume: TdxDBGridCurrencyColumn;
    cmbSkuVolumeUOM: TdxDBGridPickColumn;
    edtSkuArea: TdxDBGridCurrencyColumn;
    cmbSkuAreaUOM: TdxDBGridPickColumn;
    edtSkuGrossWeight: TdxDBGridCurrencyColumn;
    edtSkuNetWeight: TdxDBGridCurrencyColumn;
    cmbSkuWeightUOM: TdxDBGridPickColumn;
    edtSkuTallycusname: TdxDBGridButtonColumn;
    edtSkuLoadGroupName: TdxDBGridButtonColumn;
    edtSkuForkGroupName: TdxDBGridButtonColumn;
    edtSkuLiftMachineName: TdxDBGridButtonColumn;
    edtSkuTagTotalItem: TdxDBGridCurrencyColumn;
    cmbSkuTagEachUOM: TdxDBGridPickColumn;
    edtSkuCasingONE: TdxDBGridCurrencyColumn;
    cmbSkuCasingONEUOM: TdxDBGridPickColumn;
    edtSkuCasingTWO: TdxDBGridCurrencyColumn;
    cmbSkuCasingTWOUOM: TdxDBGridPickColumn;
    edtSkuCasingTHR: TdxDBGridCurrencyColumn;
    cmbSkuCasingTHRUOM: TdxDBGridPickColumn;
    edtSkuCasingFOU: TdxDBGridCurrencyColumn;
    cmbSkuCasingFOUUOM: TdxDBGridPickColumn;
    edtSkuCasingFIV: TdxDBGridCurrencyColumn;
    cmbSkuCasingFIVUOM: TdxDBGridPickColumn;
    edtSkuRemark: TdxDBGridBlobColumn;
    grdSkuCostquantity: TdxDBGridCurrencyColumn;
    grdSkuCostquantityuom: TdxDBGridPickColumn;
    edtSkuConscusname: TdxDBGridButtonColumn;
    edtSkuSNO: TdxDBGridColumn;
    edtSkuQualityName: TdxDBGridColumn;
    edtSkuSequencenum: TdxDBGridColumn;
    edtSkuTaskdate: TdxDBGridDateColumn;
    grdWareOtherItemTask: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
    edtAccountID: TdxDBGridButtonColumn;
    edtShipperAccountID: TdxDBGridButtonColumn;
    edtShipcusname: TdxDBGridButtonColumn;
    edtSKUName: TdxDBGridButtonColumn;
    edtLotCode: TdxDBGridColumn;
    edtQualityName: TdxDBGridColumn;
    edtQUANTITY: TdxDBGridCurrencyColumn;
    cmbQUANTITYUOM: TdxDBGridPickColumn;
    edtPiece: TdxDBGridCurrencyColumn;
    cmbPieceUOM: TdxDBGridPickColumn;
    edtVolume: TdxDBGridCurrencyColumn;
    cmbVolumeUOM: TdxDBGridPickColumn;
    edtArea: TdxDBGridCurrencyColumn;
    edtGrossWeight: TdxDBGridCurrencyColumn;
    cmbAreaUOM: TdxDBGridPickColumn;
    edtNetWeight: TdxDBGridCurrencyColumn;
    cmbWeightUOM: TdxDBGridPickColumn;
    edtCasingONE: TdxDBGridCurrencyColumn;
    cmbCasingONEUOM: TdxDBGridPickColumn;
    edtCasingTWO: TdxDBGridCurrencyColumn;
    cmbCasingTWOUOM: TdxDBGridPickColumn;
    edtCasingTHR: TdxDBGridCurrencyColumn;
    cmbCasingTHRUOM: TdxDBGridPickColumn;
    edtCasingFOU: TdxDBGridCurrencyColumn;
    cmbCasingFOUUOM: TdxDBGridPickColumn;
    edtCasingFIV: TdxDBGridCurrencyColumn;
    cmbCasingFIVUOM: TdxDBGridPickColumn;
    dtdManufactureDate: TdxDBGridDateColumn;
    cmbTagEachUOM: TdxDBGridPickColumn;
    edtLoadGroupName: TdxDBGridButtonColumn;
    edtForkGroupName: TdxDBGridButtonColumn;
    edtLiftMachineName: TdxDBGridButtonColumn;
    grdCostquantity: TdxDBGridCurrencyColumn;
    grdCostquantityuom: TdxDBGridPickColumn;
    edt_Mainorder: TdxDBGridColumn;
    edtCostcusname: TdxDBGridButtonColumn;
    edtLocname: TdxDBGridButtonColumn;
    edtCustomerno: TdxDBGridColumn;
    edtSkumodel: TdxDBGridColumn;
    edtSkuspec: TdxDBGridColumn;
    edtColor: TdxDBGridColumn;
    edtTallycusname: TdxDBGridButtonColumn;
    edtTagTotalItem: TdxDBGridCurrencyColumn;
    edtConscusname: TdxDBGridButtonColumn;
    edtSequencenum: TdxDBGridColumn;
    edtTaskdate: TdxDBGridDateColumn;
    edtRemark: TdxDBGridBlobColumn;
    cmbLoadCostType: TKinDbPickEdit;
    grdVolumeTasked: TdxDBGridColumn;
    grdAreaTasked: TdxDBGridColumn;
    grdNetWeightTasked: TdxDBGridColumn;
    grdGrossWeightTasked: TdxDBGridColumn;
    memRouting: TdxDBBlobEdit;
    cmbCostcus: TdxDBButtonEdit;
    grdBlno: TdxDBGridColumn;
    edtBLNO: TdxDBEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    cmbCususername: TKinDbPickEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    pmMain: TPopupMenu;
    mitforkworkload: TMenuItem;
    mitforkworkunload: TMenuItem;
    mitopload: TMenuItem;
    mitopunload: TMenuItem;
    mitcostforkwork: TMenuItem;
    mitcanclecost: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    mitchecklook: TMenuItem;
    btnCost: TKBitBtn;
    mitworkitem: TMenuItem;
    ppmhxtext: TPopupMenu;
    MenuItem2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btncopyClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure qryLocationOtherUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure edtWO_UseridButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnTotalClick(Sender: TObject);
    procedure edtSKUEnter(Sender: TObject);
    procedure edtSKUTaskExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure CostcusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitAccountChkClick(Sender: TObject);
    procedure mitCancelactChkClick(Sender: TObject);
    procedure qryLocationOtherEditUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure mitSKUSelectClick(Sender: TObject);
    procedure mitOrderSKUSelectClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure mitWareOtherTaskClick(Sender: TObject);
    procedure mitWareOtherItemClick(Sender: TObject);
    procedure mitFgCostRentClick(Sender: TObject);
    procedure edtQualityNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtedtQualityNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnOperClick(Sender: TObject);
    procedure grdWareOtherCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure cmbCostCountUOMTypeEnter(Sender: TObject);
    procedure grdWareOtherChangeNodeEx(Sender: TObject);
    procedure grdWareOtherItemChangeNodeEx(Sender: TObject);
    procedure grdWareOtherItemEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdWareOtherItemTaskEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdWareOtherItemTaskEnter(Sender: TObject);
    procedure grdWareOtherItemTaskKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitAddOriSKUClick(Sender: TObject);
    procedure mitDelOriSKUClick(Sender: TObject);
    procedure mitAddSKUClick(Sender: TObject);
    procedure mitDelSKUClick(Sender: TObject);
    procedure edtSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdWareOtherItemTaskChangeNodeEx(Sender: TObject);
    procedure edtAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtShipperAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUShipperAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUQUANTITYValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtFC_PORTLCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_TRANSCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_PORTDCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbConsignAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbCarrierCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdWareOtherItemTaskExit(Sender: TObject);
    procedure CostcusExit(Sender: TObject);
    procedure CostcusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtWO_UseridExit(Sender: TObject);
    procedure edtWO_UseridExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbConsignAccountIDExit(Sender: TObject);
    procedure cmbConsignAccountIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure cmbCarrierCusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbCarrierCusExit(Sender: TObject);
    procedure edtOPIDExit(Sender: TObject);
    procedure edtOPIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtFC_PORTLCDExit(Sender: TObject);
    procedure edtFC_PORTLCDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtFC_TRANSCDExit(Sender: TObject);
    procedure edtFC_TRANSCDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtFC_PORTDCDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtFC_PORTDCDExit(Sender: TObject);
    procedure edtShipcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSkuShipcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtAccount_LoadGroupNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtAccount_ForkGroupNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtAccount_LiftMachineNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitCheckClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure mitCheckCancelClick(Sender: TObject);
    procedure edtQuantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdAutoCostEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdAutoCostEnter(Sender: TObject);
    procedure grdAutoCostExit(Sender: TObject);
    procedure grdAutoCostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitCostAddClick(Sender: TObject);
    procedure mitCostdelClick(Sender: TObject);
    procedure mitAddAutoCostClick(Sender: TObject);
    procedure mitUpdAutoCostClick(Sender: TObject);
    procedure mitDelAutoCostClick(Sender: TObject);
    procedure grdCountwayValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure CostcusEnter(Sender: TObject);
    procedure grdCostCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdRateCusNameCostButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdIsMainRateCostChange(Sender: TObject);
    procedure mitOperationClick(Sender: TObject);
    procedure pgcWareOtherChange(Sender: TObject);
    procedure edtLoadGroupNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtForkGroupNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtLiftMachineNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtLocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtConscusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtTallycusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSkuConscusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSkuTallycusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSkuLocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSkuCostcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitforkworkloadClick(Sender: TObject);
    procedure mitforkworkunloadClick(Sender: TObject);
    procedure mitoploadClick(Sender: TObject);
    procedure mitopunloadClick(Sender: TObject);
    procedure mitcostforkworkClick(Sender: TObject);
    procedure mitcanclecostClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure mitchecklookClick(Sender: TObject);
    procedure btnCostClick(Sender: TObject);
    procedure mitworkitemClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
    //变量定义
    strFlow:string;            //辨别是任务还是实际（T：任务；I：实际）
    strRLjobno:string;                 //重新取得工作号
    blnCopy,blnSaveError,blnWare:Boolean;
    strJobno,strDataBaseID:string;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    Bookmark: TBookmark;         //书签
    strSql: string;
    FilterSql: string;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    strGetCd:String;                   //商品输入时防止重复判别
    strDel_Task,                       //任务商品删除时从表控制
    strDel_CON,strDel_Car:String;     //集装箱删除时从表控制,车辆删除是从表控制
    arrWareOther,arrWareOtherEdit,arrWareOtherItem,arrWareOtherItemTask:Variant;//用于数据复制
    intConQuantityTotal:integer;       //箱量合计
    sltAccount,sltAccountName,
    sltConType,sltConQuantity:TStringList;//用于计算箱量
    copyConType,copyConSPType,
    CopyLiftCON,CopyLiftCONName:String;//用于集装箱信息新增默认
    CopyCostCountUOMType:String;
    iOutCostType:integer;              //应付费用属性(在按修改和页面翻动时确定)
    strCountWho,strCountWhoName:string;

    blnGetCostRate:Boolean;            //新增时是否已获取费率
    blnRatSucc:Boolean;                //自动获取费率是否成功
    sltCostCD,sltCostName:TStringList; //用于确定费用名称
    stroldLocationBillNO:string;//老的仓单号
    blnISSKU:Boolean;                //是否从商品资料中选择
    sltGridname:TStringList;
    sltGridVisible:TStringList;
    blnselect:Boolean;
// Added by wql 2005-12-16 15:22:21
    copySkuwtv:Extended;
    strOldCostCus:string;             //旧费用关系人,离开事件相关

    //过程定义
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
    procedure CountSKUQuantity(var pqrySKU:TQuery; OldValue:integer);
    procedure grdWareOtherItemBeforeInsert;
    procedure grdWareOtherItemTaskBeforeInsert;
    procedure grdAutoCostBeforeInsert;
    procedure GetCusCnfg;
{crl    //费率控制过程
    function  CalcConQuantity(pblnAccount,pblnCountAccount:Boolean;
                              pstrAccount,pstrAccountName:string;
                              pblnAssistant:Boolean=False):string;
}

  public
    maxWareOtherItem,maxWareOtherItemTask,maxAutocountcost:Integer; //修改时候用的
    m_blnPost: Boolean;//在Post状态
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocationOther(CallMode:TDataState;pJobno,pFlow:string);
var
  frmLocationOther:TfrmLocationOther;


implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,find ,GetUserRight,Gridselect, datasTmp,libuserPub,GetDllPub,
     Operation,forkworknew,forkworkload,forkwork,linprint,libRmBb;

var strpJobno:string;
    strCaption:string;

procedure WorkLocationOther(CallMode:TDataState;pJobno,pFlow:string);
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pDataBaseID:定位DataBaseID
  pFlow  :进出标志 T 任务 I 实际
}
var
  year,month,day:word;
  month_start,month_end:TDate;
  strMenuItemName:string;
begin
//  strpJobno:=pJobno;
  if pFlow='T' then strCaption:='其它操作任务'
  else strCaption:='其它操作实际';
  if frmLocationOther <> nil then
  with frmLocationOther do
  begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
  end;
  if pFlow='T' then strMenuItemName:='mitLocationOtherTask'
  else strMenuItemName:='mitLocationOtherAct';
   strpJobno:=pJobno;
  frmLocationOther:=TfrmLocationOther.create(application);
  with frmLocationOther do
  begin
  {初始化所有数据集}
    //初始话变量
    strFlow        :=pFlow;
    blnCopy        :=False;             //系统默认不复制新增
    FindItem       :=TFindItem.Create;
    sltGridname    :=TstringList.Create;
    sltGridVisible :=TstringList.Create;

    blnSaveError   :=False;
    mode           :=CallMode;
    strJobno       :=pJobno;
    ScrollAfterEdit:=True;
    //lzw20091111
    if getSysdata('hxtext')='T' then
    begin
       btnPrint.PopupMenu:=ppmhxtext;
    end;
    if getSysdata('cusname')='SWZ' then
    begin
       GMSStickyLabel36.Caption:='业务类型';
       InitdbPick(cmbCususername,'codelib','codename','codename','codeclass="47"');
       mitWareOtherTask.Visible:=False;
       mitWareOtherItem.Visible:=False;
       mitworkitem.Visible:=True;
    end else
    begin
//       InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+data.qryLocationOtherEdit.fieldbyname('costcusid').AsString+'"');
    end;
    if pFlow='T' then
      strMenuItemName:='mitLocationOtherTas'
    else
      strMenuItemName:='mitLocationOtherAct';

    //
    sltAccount:=TStringList.Create;
    sltAccountName:=TStringList.Create;
    sltConType:=TStringList.Create;
    sltConQuantity:=TStringList.Create;

     //计费商品类
    InitdbPick(cmbSKUClass,'skucostclass','skucostclasscd','skucostclassname',' 1=1');
    //件数单位
    InitdbPick(cmbPieceUOM,'uom','uomname','uomname',' uomtype like "%件数%"');
    cmbSKUPieceUOM.Items:=cmbPieceUOM.Items;
    cmbQUANTITYUOM.Items:=cmbPieceUOM.Items;
    cmbSKUQUANTITYUOM.Items:=cmbPieceUOM.Items;
    cmbCasingONEUOM.Items:=cmbPieceUOM.Items;
    cmbCasingTWOUOM.items:=cmbPieceUOM.Items;
    cmbCasingTHRUOM.Items:=cmbPieceUOM.Items;
    cmbCasingFOUUOM.Items:=cmbPieceUOM.Items;
    cmbCasingFIVUOM.items:=cmbPieceUOM.Items;
    cmbSKUCasingONEUOM.items:=cmbPieceUOM.Items;
    cmbSKUCasingTWOUOM.items:=cmbPieceUOM.Items;
    cmbSKUCasingTHRUOM.items:=cmbPieceUOM.Items;
    cmbSKUCasingFOUUOM.items:=cmbPieceUOM.Items;
    cmbSKUCasingFIVUOM.items:=cmbPieceUOM.Items;
    cmbTagEachUOM.items:=cmbPieceUOM.Items;
    cmbSKUTagEachUOM.items:=cmbPieceUOM.Items;

    //体积单位
    InitdbPick(cmbVolumeUOM,'uom','uomname','uomname',' uomtype like "%体积%"');
    cmbSKUVolumeUOM.items:=cmbVolumeUOM.Items;

    //重量单位
    InitdbPick(cmbWeightUOM,'uom','uomname','uomname',' uomtype like "%重量%"');
    cmbSKUWeightUOM.items:=cmbWeightUOM.Items;

    //面积单位
    InitdbPick(cmbAreaUOM,'uom','uomname','uomname',' uomtype like "%面积%"');
    cmbSKUAreaUOM.items:=cmbAreaUOM.Items;

    //面积单位
    InitdbPick(grdCostquantityuom,'uom','uomname','uomname','1=1');
    grdSkuCostquantityuom.items:=grdCostquantityuom.Items;

//crl    InitdbPick(edtRentcountuomtype,'codelib','codecd','codename',' codeclass="05"');

    //船名
    InitdbPick(edtCarrierName,'vessel','vesselcd','vesselname','1=1');
    //操作类型
    InitdbPick(cmbLoadCostType,'codelib','codename','codename','codeclass="19"');

     //费用项目
    InitdbPick(grdCostCDCost,'costcode','costcd',IIF(_Language='CAPTIONC','costname','costename'),'1=1');
    //费用关系指向人
    InitdbPick(grdCostCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');
    InitdbPick(grdRateCusCost,'codelib','codename','codecd',' codeclass="29" and "仓储" like "%"+rtrim(isnull(codechar1,""))+"%"');
    //仓租非仓租计算单位
    InitdbPick(rateuomtypeCost,'codelib','codecd','codename','codeclass="05"');

    data.InitLocationOther(strJobno);
    //假主库过滤条件
    if _Filter_CurMonth<>'F' then
    begin
      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;
    end else
    begin
      Month_Start:=date-_Filter_LessDate;
      Month_End  :=date+_Filter_MoreDate;
    end;
    if trim(strJobno)='' then
    begin
      FilterSql:=' (convert(datetime,convert(char(8),locationother.TaskDate,112)) >="'+datetostr(Month_Start)+'") '
                +'  and (convert(datetime,convert(char(8),locationother.TaskDate,112)) <="'+datetostr(Month_End)+'")';
      with FindItem do
      begin
         Field.Add('1');
         operator.Add('3');
         value.Add(datetostr(Month_Start));
         Exp.Add('任务日期          大于等于      '+datetostr(Month_Start));
         Field.Add('1');
         operator.Add('4');
         value.Add(datetostr(Month_End));
         Exp.Add('任务日期          小于等于      '+datetostr(Month_End));
      end;
    end;
    data.qryLocationOther.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');



// 界面显示过程
    if mode=stInsert then
    begin
      SetButtonEnabled(ToolPanel,strMenuItemName,trim(_userorgid));//设置按钮的有效性
      if not btnAdd.Enabled then
      begin
        KMessageDlg(GetMessage('frmLocationOther','001'),mtWarning,[mbOK],0);//'您无权新增任务资料！'
        Close;
        Exit;
      end;
      SetControlState(stBrowse,true);
      data.qryLocationOther.open;
      grdWareOtherChangeNodeEx(nil);
      btnAdd.Click;
    end else
    begin
      SetControlState(stBrowse,true);
      data.qryLocationOther.Open;
      grdWareOtherChangeNodeEx(nil);
      if strJobno<>''
      then data.qryLocationOther.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
      SetButtonEnabled(ToolPanel,strMenuItemName,trim(_userorgid));//设置按钮的有效性
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
procedure TfrmLocationOther.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  self.Caption:= StrCaption;
  inherited CreateParams(Params);
end;

procedure TfrmLocationOther.WorkCall(CallMode:TDataState);
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
        end;
      stEdit:
        begin
          data.qryLocationOther.Edit;
          EnableEdit;
          //记录修改档案
          data.qryLocationOtherEdit.Edit;
          if strFlow<>'T' then
            begin
             data.qryLocationOtherEdit.FieldByName('OPERATIONNAME').Asstring:=_LoginName;
             data.qryLocationOtherEdit.fieldByname('OPERATIONDATE').AsDatetime:=Now;
            end;
          //在修改的状态下，对qryWareOtherItemTask循环

          data.qryLocationOtherTask.DisableControls;
          Bookmark:=data.qryLocationOtherTask.GetBookmark;
          maxWareOtherItemTask:=0;

          data.qryLocationOtherTask.First;
          while not data.qryLocationOtherTask.Eof do
          begin
            if data.qryLocationOtherTask.FieldByName('SNO').AsInteger>maxWareOtherItemTask
               then maxWareOtherItemTask:=data.qryLocationOtherTask.FieldByName('SNO').AsInteger;
            data.qryLocationOtherTask.Next;
          end;
          data.qryLocationOtherTask.Filtered:=True;
          data.qryLocationOtherTask.GotoBookmark(Bookmark);
          data.qryLocationOtherTask.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryLocationOtherTask.EnableControls;
///wql_06.30          data.qryLocationOtherTaskAfterScroll(data.qryLocationOtherTask);
         //在修改的状态下，对qryWareOtherItem循环
          data.qryLocationOtherAct.DisableControls;
          Bookmark:= data.qryLocationOtherAct.GetBookmark;
          maxWareOtherItem:=0;
          data.qryLocationOtherAct.First;
          while not data.qryLocationOtherAct.Eof do
          begin
            if data.qryLocationOtherAct.FieldByName('SNO').AsInteger>maxWareOtherItem
               then maxWareOtherItem:=data.qryLocationOtherAct.FieldByName('SNO').AsInteger;
            data.qryLocationOtherAct.Next;
          end;
          data.qryLocationOtherAct.GotoBookmark(Bookmark);
          data.qryLocationOtherAct.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryLocationOtherAct.EnableControls;
//wql_06.30          self.qryWareOtherItemAfterScroll(data.qryLocationOtherAct);
           maxAutocountcost:=0;
           data.qryautocountcostOther.First;
           while not data.qryautocountcostOther.Eof do
           begin
              if data.qryautocountcostOther.FieldByName('sno').AsInteger>maxAutocountcost
              then maxAutocountcost:=data.qryautocountcostOther.FieldByName('sno').AsInteger;
              data.qryautocountcostOther.Next;
           end;
           data.qryautocountcostOther.GotoBookmark(Bookmark);
           data.qryautocountcostOther.FreeBookmark(Bookmark);
           bookMark:=nil;
           data.qryautocountcostOther.EnableControls;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          data.qryLocationOther.Append;
          if not blncopy then
            begin
              data.qryLocationOtherEdit.Append;
            end;
          maxWareOtherItemTask:=0;
          maxWareOtherItem:=0;
          maxAutocountcost:=0;
          InitValues;
          EnableEdit;
          //记录档案创建信息
          data.qryLocationOtherEdit.Edit;
          data.qryLocationOtherEdit.FieldByName('CreateName').Asstring:=_LoginName;
          data.qryLocationOtherEdit.fieldByname('CreateDate').AsDatetime:=Now;
          LampChange(lsEdit);
        end;
  end;
  end;
end;

procedure TfrmLocationOther.EnableEdit;
begin
  copySkuwtv:=0;
  
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
  SetControlState(DataState,False);
  stroldLocationBillNO:=data.qryLocationOtherEdit.FieldByName('LocationBillNO').Asstring;

  grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior+[edgoEditing];
  grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdAutoCost.ShowGroupPanel:=False;
  grdAutoCost.ClearGroupColumns;

  grdWareOtherItemTask.ShowGroupPanel:=False;
  grdWareOtherItem.ShowGroupPanel:=False;
  //lzw 20090311
  InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+data.qryLocationOtherEdit.fieldbyname('costcusid').AsString+'"');
//  edtLocationBillNO.SetFocus;
end;

procedure TfrmLocationOther.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  if data.qryLocationOther.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
  SetControlState(DataState,False);

  grdAutoCost.OptionsBehavior:=grdAutoCost.OptionsBehavior-[edgoEditing];
  grdAutoCost.OptionsDB:=grdAutoCost.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdAutoCost.ShowGroupPanel:=True;

  grdWareOtherItem.ShowGroupPanel:=True;
  grdWareOtherItemTask.ShowGroupPanel:=True;
end;

procedure TfrmLocationOther.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmLocationOther.InitValues;
{初始化时自动生成仓位代码}
var
  strLocationbillno,strDate:string;
begin
  //赋业务联系单号
  opensql(dataTmp.qryTmp,'select datenow=getDate() ');
  strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
  opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                +'  from genjobno where substring(jobno,5,2)="QT"  and substring(docno1,3,4)="'+copy(datetostr(date),1,4)+'" ' );
  strLocationbillno:='QT'+strDate
                         +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);
  strRLJobno:=genJobno('QT',strLocationbillno);
  //lzw20091202
  if getSysdata('hxtext')='T' then
  begin
     cmbLoadCostType.Text:='';
  end;
  if blnCopy then
  begin
    blnCopy:=False;
    //qryWareOtherEdit复制
    GatherFromArray(data.qryLocationOtherEdit,arrWareOtherEdit,false);
    data.qryLocationOtherEdit.FieldByName('JOBNO').Asstring:=strRLJobno;
    data.qryLocationOtherEdit.fieldByname('UserID').AsString:=_UserID;
    data.qryLocationOtherEdit.fieldByname('username').AsString:=_Username;
    data.qryLocationOtherEdit.fieldByname('iuserid').AsString:=_UserID;
    data.qryLocationOtherEdit.fieldByname('iusername').AsString:=_Username;

    //qryWareOtherItemTask复制
    data.qryLocationOtherTask.DisableControls;
    GatherFromArray(data.qryLocationOtherTask,arrWareOtherItemTask,true);
    with data.qryLocationOtherTask do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('JOBNO').AsString:=strRLJobno;
        FieldByName('UserID').Asstring:=_UserID;
        FieldByName('username').Asstring:=_Username;
        if FieldByName('SNO').AsInteger>maxWareOtherItemTask
        then maxWareOtherItemTask:=FieldByName('SNO').AsInteger;
        next;
      end;
      First;
    end;
    data.qryLocationOtherTask.EnableControls;
    //qryWareOtherItem复制
    data.qryLocationOtherAct.DisableControls;
    GatherFromArray(data.qryLocationOtherAct,arrWareOtherItem,true);
    with data.qryLocationOtherAct do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('JOBNO').AsString:=strRLJobno;
        FieldByName('UserID').Asstring:=_UserID;
        FieldByName('username').Asstring:=_Username;
        if FieldByName('SNO').AsInteger>maxWareOtherItem
        then maxWareOtherItem:=FieldByName('SNO').AsInteger;
        next;
      end;
      First;
    end;
    data.qryLocationOtherAct.EnableControls;
  end else
  begin
    //data.qryLocationOtherEdit
    data.qryLocationOtherEdit.FieldByName('SKUCOSTCLASSCD').Asstring:='COMMON';
    data.qryLocationOtherEdit.FieldByName('TASKDATE').AsDateTime:=Now;
    data.qryLocationOtherEdit.FieldByName('isbond').Asstring:='F';
    data.qryLocationOtherEdit.FieldByName('LoadType').Asstring:='F';

    data.qryLocationOtherEdit.FieldByName('JOBNO').Asstring:=strRLJOBNO;
    data.qryLocationOtherEdit.FieldByName('UserID').Asstring:=_UserID;
    data.qryLocationOtherEdit.FieldByName('username').Asstring:=_Username;
    data.qryLocationOtherEdit.fieldByname('iuserid').AsString:=_UserID;
    data.qryLocationOtherEdit.fieldByname('iusername').AsString:=_Username;

    //data.qryLocationOther
    data.qryLocationOther.fieldbyname('JOBNO').asstring   :=data.qryLocationOtherEdit.fieldbyname('JOBNO').asstring;
  end;
  data.qryLocationOtherEdit.FieldByName('LocationBillNO').Asstring:=strLocationbillno;
end;

procedure TfrmLocationOther.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
{
  if blnConnect then
  begin
    data.qryLocationOtherEdit.datasource :=data.dtsLocationOther;
    data.qryLocationOtherAct.datasource  :=data.dtsLocationOther;
    data.qryLocationOtherTask.datasource :=data.dtsLocationOther;
    data.qryautocountcostOther.DataSource:=data.dtsLocationOther;
  end else
  begin
    data.qryLocationOtherEdit.DataSource :=nil;
    data.qryLocationOtherAct.DataSource  :=nil;
    data.qryLocationOtherTask.datasource :=nil;
    data.qryautocountcostOther.DataSource:=nil;
  end;
}
end;

procedure TfrmLocationOther.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  if blnCreate then
  begin
     if strFlow='T' then
     begin
          self.Caption:='其他操作－任务';
          btnEdit.Caption:='修改';
          tbsWareOther.TabVisible:=True;
          tbsWareOtherItemTask.TabVisible:=true;
          btnAdd.Visible:=true;
          btnCopy.Visible:=true;
          btnCheck.Visible:=true;
     end else
     begin
          self.Caption:='其他操作－实际';
          btnEdit.Caption:='操作';
          tbsWareOther.TabVisible:=False;
          tbsWareOtherItemTask.TabVisible:=False;
          btnAdd.Visible:=False;
          btnCopy.Visible:=False;
          btnCheck.Visible:=False;
 //         btnRedInvo.Visible:=False;
     end;
  end;
  if strFlow='T' then
  begin
    if CallMode in SetDcs then
    begin
       if data.qryLocationOther.FieldByName('OPERATIONNAME').AsString<>'' then
       begin
         libWinControl(self,grdWareOtherItemTask,True);
         libWinControl(self,grdWareOtherItem,True);
       end;
       if CallMode in SetDcs then
       begin
         btnTotal.Visible:=True;
         btnOper.Visible:=True;
       end else
       begin
         btnTotal.Visible:=False;
         btnOper.Visible:=False;
       end;
    end else
    begin
  //  libWinControl(self,grdWareOtherItem,True);
      if CallMode in SetDcs then
      begin
        btnTotal.Visible:=True;
        btnOper.Visible:=False;
      end else
      begin
        btnTotal.Visible:=False;
        btnOper.Visible:=False;
      end;
    end;
  end;
end;

function TfrmLocationOther.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   sltAutoCost:TStringList;//判断计费条条目重复记录
   strNO:string;
begin
  Result:=False;
  sltAutoCost:=TStringList.Create;
  if edtLocationBillNO.Text='' then
  begin
    ActiveControl:=edtLocationBillNO;
    KmessageDlg(GetMessage('frmLocationOther','002'),mtWarning,[mbOK],0);//'仓单号不能为空，必须填写'
    exit;
  end;
  if cmbCostcus.Text='' then
  begin
    ActiveControl:=cmbCostcus;
    KmessageDlg(GetMessage('frmLocationOther','003'),mtWarning,[mbOK],0);//'费用关系人不能为空，必须填写'
    exit;
  end;
  if data.qryLocationOtherEdit.fieldbyname('iUserid').asstring='' then
  begin
    ActiveControl:=edtWO_Userid;
    KmessageDlg(GetMessage('frmLocationOther','004'),mtWarning,[mbOK],0);//'执行部门不能为空，必须填写'
    exit;
  end;

  sltAutoCost.clear;
  strNo:='';
  data.qryautocountcostOther.DisableControls;
  data.qryautocountcostOther.First;
  while not data.qryautocountcostOther.Eof do
  begin
     if sltAutoCost.IndexOf(data.qryautocountcostOther.fieldbyname('isincome').asstring
                     +data.qryautocountcostOther.fieldbyname('costcd').asstring
                     +data.qryautocountcostOther.fieldbyname('ismainrate').asstring
                     +data.qryautocountcostOther.fieldbyname('costcusid').asstring
                     +data.qryautocountcostOther.fieldbyname('costcusname').asstring
                     +data.qryautocountcostOther.fieldbyname('ratecusid').asstring
                     +data.qryautocountcostOther.fieldbyname('ratecusname').asstring
                     +data.qryautocountcostOther.fieldbyname('ratecus').asstring
                     +data.qryautocountcostOther.fieldbyname('costcus').asstring
                     +data.qryautocountcostOther.fieldbyname('rateuomtype').asstring
                     +data.qryautocountcostOther.FieldByName('countway').AsString)<>-1 then
     strNo:=strNO+data.qryautocountcostOther.fieldbyname('sno').asstring+','
     else
        sltAutoCost.Add(data.qryautocountcostOther.fieldbyname('isincome').asstring
                        +data.qryautocountcostOther.fieldbyname('costcd').asstring
                        +data.qryautocountcostOther.fieldbyname('ismainrate').asstring
                        +data.qryautocountcostOther.fieldbyname('costcusid').asstring
                        +data.qryautocountcostOther.fieldbyname('costcusname').asstring
                        +data.qryautocountcostOther.fieldbyname('ratecusid').asstring
                        +data.qryautocountcostOther.fieldbyname('ratecusname').asstring
                        +data.qryautocountcostOther.fieldbyname('ratecus').asstring
                        +data.qryautocountcostOther.fieldbyname('costcus').asstring
                        +data.qryautocountcostOther.fieldbyname('rateuomtype').asstring
                        +data.qryautocountcostOther.FieldByName('countway').AsString
                        );
    data.qryautocountcostOther.Next;
  end;
  data.qryautocountcostOther.First;
  data.qryautocountcostOther.EnableControls;
  if strNO<>'' then
  begin
     if KmessageDlg('NO.'+strNO+GetMessage('TW','001'),mtConfirmation,[mbYes,mbNo],0)<>mryes then//'是重复计费条目，是否保存?'
     Exit;
  end;

    if (strFlow='T') then
    begin
        //其他操作任务
        data.qryLocationOtherTask.DisableControls;
        data.qryLocationOtherTask.First;
        while not data.qryLocationOtherTask.eof do
        begin
          data.qryLocationOtherTask.Edit;
          data.qryLocationOtherTask.fieldbyname('Jobno').asstring :=data.qryLocationOtherEdit.fieldbyname('Jobno').asstring;
          data.qryLocationOtherTask.fieldbyname('userid').asstring:=data.qryLocationOtherEdit.fieldbyname('userid').asstring;
          data.qryLocationOtherTask.fieldbyname('username').asstring:=data.qryLocationOtherEdit.fieldbyname('username').asstring;
          data.qryLocationOtherTask.fieldbyname('iuserid').asstring:=data.qryLocationOtherEdit.fieldbyname('iuserid').asstring;
          data.qryLocationOtherTask.fieldbyname('iusername').asstring:=data.qryLocationOtherEdit.fieldbyname('iusername').asstring;
//wql.05.07.08          data.qryLocationOtherTask.fieldByname('QualityName').AsString:='';
//crl          data.qryLocationOtherTask.fieldbyname('costopid').asstring:=data.qryLocationOtherEdit.fieldbyname('opid').asstring;
//crl          data.qryLocationOtherTask.fieldbyname('costopname').asstring:=data.qryLocationOtherEdit.fieldbyname('opname').asstring;
          data.qryLocationOtherTask.fieldbyname('locationbillno').asstring:=data.qryLocationOtherEdit.fieldbyname('locationbillno').asstring;
          data.qryLocationOtherTask.fieldbyname('cusbillno').asstring:=data.qryLocationOtherEdit.fieldbyname('cusbillno').asstring;
          //lzw20090909 任务的operationdate为什么没有继承？
          data.qryLocationOtherTask.fieldbyname('operationdate').asstring:=data.qryLocationOtherEdit.fieldbyname('operationdate').asstring;
          data.qryLocationOtherTask.fieldbyname('costcusid').asstring:=data.qryLocationOtherEdit.fieldbyname('costcusid').asstring;
          data.qryLocationOtherTask.fieldbyname('costcusname').asstring:=data.qryLocationOtherEdit.fieldbyname('costcusname').asstring;

          data.qryLocationOtherTask.Next;
       end;
       data.qryLocationOtherTask.EnableControls;
//wql_06.30       self.qryWareOtherItemTaskAfterScroll(data.qryLocationOtherTask);
    end else
    begin
       //其他操作实际
       data.qryLocationOtherAct.DisableControls;
       data.qryLocationOtherAct.First;
       while not data.qryLocationOtherAct.eof do
       begin
         //继承主库信息
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.fieldbyname('Jobno').asstring :=data.qryLocationOtherEdit.fieldbyname('Jobno').asstring;
         data.qryLocationOtherAct.fieldbyname('userid').asstring:=data.qryLocationOtherEdit.fieldbyname('userid').asstring;
         data.qryLocationOtherAct.fieldbyname('username').asstring:=data.qryLocationOtherEdit.fieldbyname('username').asstring;
         data.qryLocationOtherAct.fieldbyname('iuserid').asstring:=data.qryLocationOtherEdit.fieldbyname('iuserid').asstring;
         data.qryLocationOtherAct.fieldbyname('iusername').asstring:=data.qryLocationOtherEdit.fieldbyname('iusername').asstring;
         data.qryLocationOtherAct.fieldbyname('locationbillno').asstring:=data.qryLocationOtherEdit.fieldbyname('locationbillno').asstring;
         data.qryLocationOtherAct.fieldbyname('cusbillno').asstring:=data.qryLocationOtherEdit.fieldbyname('cusbillno').asstring;
//wql.05.07.08         data.qryLocationOtherAct.fieldByname('QualityName').AsString:='';
         //lzw20090909 实际的operationdate为什么没有继承？
         data.qryLocationOtherAct.fieldbyname('operationdate').asstring:=data.qryLocationOtherEdit.fieldbyname('operationdate').asstring;
         data.qryLocationOtherAct.fieldbyname('costcusid').asstring:=data.qryLocationOtherEdit.fieldbyname('costcusid').asstring;
         data.qryLocationOtherAct.fieldbyname('costcusname').asstring:=data.qryLocationOtherEdit.fieldbyname('costcusname').asstring;

         data.qryLocationOtherAct.Next;
       end;
       data.qryLocationOtherAct.EnableControls;
//wql_06.30       self.qryWareOtherItemAfterScroll(data.qryLocationOtherAct);
    end;

{crl    //获取集装箱资料信息
    data.qryLocationOtherEdit.Edit;
    data.qryLocationOtherEdit.fieldbyname('condes').asString:=CalcConQuantity(False,False,'ss','ss');
    data.qryLocationOtherEdit.fieldbyname('conquantity').asInteger:=intConQuantityTotal;
}

    //判断LocationBillNO是否有重复
    if stroldLocationBillNO<>data.qryLocationOtherEdit.FieldByName('LocationBillNO').Asstring then
    begin
      opensql(dataTmp.qryTmp,'select LBNOnum=count(*)'
                    +'  from locationother '
                    +' where LocationBillNO="'+data.qryLocationOtherEdit.FieldByName('LocationBillNO').Asstring+'"');
      if dataTmp.qryTmp.fieldbyName('LBNOnum').asinteger<>0 then
         if KmessageDlg(GetMessage('frmLocationOther','005'),mtConfirmation,[mbYes,mbNo],0)=mrNO then//'存在相同的指令单号,是否要保存?'
            exit;
    end;

    //保存时自动取费率
    btnTotal.Click;

    //给假主库信息付值
    data.qryLocationOther.Edit;
    data.qryLocationOther.FieldByName('LocationBillNO').Asstring:= data.qryLocationOtherEdit.FieldByName('LocationBillNO').AsString ;
    data.qryLocationOther.FieldByName('TaskDate').Asstring:= data.qryLocationOtherEdit.FieldByName('TaskDate').AsString ;
    data.qryLocationOther.FieldByName('Quantity').Asstring:= data.qryLocationOtherEdit.FieldByName('Quantity').AsString ;
    data.qryLocationOther.FieldByName('Piece').Asstring:= data.qryLocationOtherEdit.FieldByName('Piece').AsString ;
    data.qryLocationOther.FieldByName('costquantity').Asstring:= data.qryLocationOtherEdit.FieldByName('costquantity').AsString ;
    data.qryLocationOther.FieldByName('CheckName').Asstring:= data.qryLocationOtherEdit.FieldByName('CheckName').AsString ;
    data.qryLocationOther.FieldByName('costcusid').Asstring:= data.qryLocationOtherEdit.Fieldbyname('costcusid').asstring ;
    data.qryLocationOther.FieldByName('costcusname').Asstring:= data.qryLocationOtherEdit.Fieldbyname('costcusname').asstring ;
    data.qryLocationOther.FieldByName('JOBNO').Asstring:= data.qryLocationOtherEdit.Fieldbyname('JOBNO').asstring ;
    data.qryLocationOther.FieldByName('CREATENAME').Asstring:= data.qryLocationOtherEdit.FieldByName('CREATENAME').AsString ;
    data.qryLocationOther.FieldByName('OPERATIONNAME').Asstring:= data.qryLocationOtherEdit.FieldByName('OPERATIONNAME').AsString ;
    data.qryLocationOther.FieldByName('TASKDATErq').AsString:=datetostr(data.qryLocationOtherEdit.FieldByName('TASKDATE').Asdatetime);
    data.qryLocationOther.FieldByName('TASKDATEsj').AsString:=timetostr(data.qryLocationOtherEdit.FieldByName('TASKDATE').Asdatetime);
    data.qryLocationOther.FieldByName('OperationDaterq').AsString:=datetostr(data.qryLocationOtherEdit.FieldByName('OperationDate').Asdatetime);
    data.qryLocationOther.FieldByName('OperationDatesj').AsString:=timetostr(data.qryLocationOtherEdit.FieldByName('OperationDate').Asdatetime);
    data.qryLocationOther.FieldByName('skuname').AsString:=data.qryLocationOtherEdit.FieldByName('skuname').AsString;

    Result:=True;
end;


procedure TfrmLocationOther.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if not ScrollAfterEdit and blnOpen then
  begin
    if data.qryLocationOtherEdit.Active then
    begin
      data.qryLocationOtherEdit.Close;
      data.qryLocationOtherEdit.Open;
    end;
    if data.qryLocationOtherTask.Active then
    begin
      data.qryLocationOtherTask.Close;
      data.qryLocationOtherTask.Open;
    end;
    if data.qryLocationOtherAct.Active then
    begin
      data.qryLocationOtherAct.Close;
      data.qryLocationOtherAct.Open;
    end;
    if data.qryautocountcostOther.Active then
    begin
      data.qryautocountcostOther.Close;
      data.qryautocountcostOther.Open;
    end;
    ScrollAfterEdit:=True;
  end;

  if not blnPage then
  begin
    data.qryLocationOtherEdit.Active :=blnOpen;
    data.qryLocationOtherTask.Active :=blnOpen;
    data.qryLocationOtherAct.Active  :=blnOpen;
    data.qryautocountcostOther.Active  :=blnOpen;
  end else
  begin
    data.qryLocationOtherEdit.Active  :=blnOpen;
    if pgcWareOther.ActivePage=tbsWareOtherItemTask then
     begin
       data.qryLocationOtherTask.Active := blnOpen;
     end;
    if pgcWareOther.ActivePage=tbsWareOtherItem then
     begin
       data.qryLocationOtherAct.Active := blnOpen;
     end;
    if pgcWareOther.ActivePage=tbsAutoCost then
     begin
       data.qryautocountcostOther.Active := blnOpen;
     end;
  end;
end;

procedure TfrmLocationOther.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmLocationOther.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox3);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdWareOther);
  SetDxDbGrid(grdWareOtherItem);
  SetDxDbGrid(grdWareOtherItemTask);
  SetDxDbGrid(grdAutoCost);
  pgcMain.ActivePage:=tbsBrowse;
//  pgcWareOther.ActivePage:=tbsWareOther;
end;

procedure TfrmLocationOther.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key=Vk_Return then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
    pgcWareOther.ActivePage := tbsWareOther;
    if DataState in Setdcs then ActiveControl:=cmbSKUClass;
  end else
  if Key=Vk_F5 then
  begin
    pgcWareOther.ActivePage := tbsWareOtherItemTask;
    if DataState in Setdcs then ActiveControl:=grdWareOtherItemTask;
  end else
  if Key=Vk_F6 then
  begin
    pgcWareOther.ActivePage := tbsWareOtherItem;
    if DataState in Setdcs then ActiveControl:=grdWareOtherItem;
  end;
  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pgcMain.ActivePage=tbsEdit then
        begin
          pgcMain.ActivePage:=tbsBrowse;
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
      Ord('C'):KeyDownControl(Key,btnCopy);

      Ord('F'):KeyDownControl(Key,btnFind);
      Ord('R'):KeyDownControl(Key,btnRefind);
      Ord('L'):KeyDownControl(Key,btnFilter);
//      Ord('O'):KeyDownControl(Key,btnPrint);

      Ord('V'):KeyDownControl(Key,btnCheck);
      Ord('S'):KeyDownControl(Key,btnTotal);
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

procedure TfrmLocationOther.FormDestroy(Sender: TObject);
begin
//  Lampchange(lsMenu);
//  Application.onShowhint := nil;
  frmLocationOther:=nil;
  sltConType.Free;
  sltConQuantity.Free;
  sltAccount.Free;
  sltAccountName.Free;
  sltGridname.Free;
  sltGridVisible.Free;

end;

procedure TfrmLocationOther.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
  pgcMainChange(self);
end;

procedure TfrmLocationOther.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
  pgcMainChange(self);
end;

procedure TfrmLocationOther.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmLocationOther.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
  strDataBaseID:string;
begin
  strXmh:=data.qryLocationOther.fieldbyname('jobno').asstring;
  data.qryLocationOther.Close;
  data.qryLocationOther.DisableControls;
  data.qryLocationOther.Open;
  data.qryLocationOtherEdit.Close;
  data.qryLocationOtherEdit.Open;
  try
    data.qryLocationOther.locate('jobno',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    data.qryLocationOther.Last;
  end;
  data.qryLocationOther.EnableControls;
  grdWareOtherChangeNodeEx(nil);
  WorkCall(stBrowse);
end;

procedure TfrmLocationOther.btnEditClick(Sender: TObject);
begin
  if (data.qryLocationOther.FieldByName('CHECKName').asstring<>'') then
  begin
    kMessageDlg(GetMessage('frmLocationOther','006'),mtWarning,[mbOK],0);//'该其他操作已经审核，不能修改！'
    exit;
  end;
  if strFlow='T' then
    begin
      if data.qryLocationOther.FieldByName('CreateName').asstring<>_LoginName then
      begin
        kMessageDlg(GetMessage('frmLocationOther','007'),mtWarning,[mbOK],0);//'该其他操作任务不是您输入的，不能修改！'
        exit;
      end;
    end
  else
    begin
      if (data.qryLocationOther.FieldByName('OPERATIONNAME').asstring<>'') and (data.qryLocationOther.FieldByName('OPERATIONNAME').asstring<>_LoginName) then
      begin
        kMessageDlg(GetMessage('frmLocationOther','008'),mtWarning,[mbOK],0);//'该其他操作实际不是您输入的，不能修改！'
        exit;
      end;
    end;
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
//  if not ScrollAfterEdit then
     SetDetailActive(False,True);
//  SetMasterDetailState(False);
  WorkCall(stEdit);

  data.qryLocationOtherEdit.Edit;
  if (strFlow='I') and (data.qryLocationOther.FieldByName('OperationName').AsString='') then
  begin
    data.qryLocationOtherEdit.FieldByName('OperationName').AsString:=_LoginName;
    data.qryLocationOtherEdit.FieldByName('OperationDate').AsDateTime  :=Now;

    data.qryLocationOtherEdit.fieldbyname('Quantity').asFloat   :=data.qryLocationOtherEdit.fieldbyname('QuantityTasked').asFloat  ;
    data.qryLocationOtherEdit.fieldbyname('Piece').asFloat      :=data.qryLocationOtherEdit.fieldbyname('PieceTasked').asFloat     ;
    data.qryLocationOtherEdit.fieldbyname('NetWeight').asFloat  :=data.qryLocationOtherEdit.fieldbyname('NetWeightTasked').asFloat   ;
    data.qryLocationOtherEdit.Fieldbyname('GrossWeight').asFloat:=data.qryLocationOtherEdit.Fieldbyname('GrossWeightTasked').asFloat ;
    data.qryLocationOtherEdit.fieldbyname('Volume').asFloat     :=data.qryLocationOtherEdit.fieldbyname('VolumeTasked').asFloat      ;
    data.qryLocationOtherEdit.Fieldbyname('Area').asFloat       :=data.qryLocationOtherEdit.Fieldbyname('AreaTasked').asFloat        ;
    data.qryLocationOtherEdit.Fieldbyname('costquantity').asFloat:=data.qryLocationOtherEdit.Fieldbyname('costquantitytasked').asFloat ;

    data.qryLocationOtherTask.DisableControls;
    data.qryLocationOtherTask.First;
    while not data.qryLocationOtherTask.Eof do
    begin
      data.qryLocationOtherAct.append;
      data.qryLocationOtherAct.fieldByname('jobno').AsString               :=data.qryLocationOtherTask.fieldByname('jobno').AsString               ;
//wql.05.08.07      data.qryLocationOtherAct.fieldByname('jobno_IN').AsString            :=data.qryLocationOtherTask.fieldByname('jobno_IN').AsString         ;
      data.qryLocationOtherAct.fieldByname('userid').AsString              :=data.qryLocationOtherTask.fieldByname('userid').AsString              ;
      data.qryLocationOtherAct.fieldbyname('SKUID').asstring               :=data.qryLocationOtherTask.fieldbyname('SKUID').asstring               ;
      data.qryLocationOtherAct.Fieldbyname('SKUName').asstring             :=data.qryLocationOtherTask.Fieldbyname('SKUName').asstring             ;
      //sno无需自动计算
      data.qryLocationOtherAct.fieldbyname('SNO').asInteger                :=data.qryLocationOtherTask.fieldbyname('SNO').asInteger                ;
//wql.05.08.07      data.qryLocationOtherAct.fieldbyname('SNO_IN').asInteger                :=data.qryLocationOtherTask.fieldbyname('SNO_IN').asInteger             ;
      data.qryLocationOtherAct.Fieldbyname('LotCode').asstring             :=data.qryLocationOtherTask.Fieldbyname('LotCode').asstring             ;
      data.qryLocationOtherAct.fieldbyname('Quantity').asFloat             :=data.qryLocationOtherTask.fieldbyname('Quantity').asFloat           ;
      data.qryLocationOtherAct.fieldbyname('QuantityUOM').asstring         :=data.qryLocationOtherTask.fieldbyname('QuantityUOM').asstring            ;
      data.qryLocationOtherAct.fieldbyname('PieceUOM').asstring            :=data.qryLocationOtherTask.fieldbyname('PieceUOM').asstring            ;
      data.qryLocationOtherAct.fieldbyname('WeightUOM').asstring           :=data.qryLocationOtherTask.fieldbyname('WeightUOM').asstring           ;
      data.qryLocationOtherAct.fieldbyname('VolumeUOM').asstring           :=data.qryLocationOtherTask.fieldbyname('VolumeUOM').asstring           ;
      data.qryLocationOtherAct.Fieldbyname('AreaUOM').asstring             :=data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring             ;
      data.qryLocationOtherAct.Fieldbyname('costquantityuom').asstring     :=data.qryLocationOtherTask.Fieldbyname('costquantityuom').asstring             ;
//      data.qryLocationOtherAct.Fieldbyname('Quantity_Piece_Prop').asFloat  :=data.qryLocationOtherTask.Fieldbyname('Quantity_Piece_Prop').asFloat  ;
//      data.qryLocationOtherAct.Fieldbyname('Quantity_Volume_Prop').asFloat :=data.qryLocationOtherTask.Fieldbyname('Quantity_Volume_Prop').asFloat ;
//      data.qryLocationOtherAct.Fieldbyname('Quantity_Area_Prop').asFloat   :=data.qryLocationOtherTask.Fieldbyname('Quantity_Area_Prop').asFloat   ;
//      data.qryLocationOtherAct.Fieldbyname('Quantity_GrossWeight_Prop').asFloat :=data.qryLocationOtherTask.Fieldbyname('Quantity_GrossWeight_Prop').asFloat ;
//      data.qryLocationOtherAct.Fieldbyname('Quantity_NewWeight_Prop').asFloat :=data.qryLocationOtherTask.Fieldbyname('Quantity_NetWeight_Prop').asFloat ;

      data.qryLocationOtherAct.fieldbyname('Piece').asFloat                :=data.qryLocationOtherTask.fieldbyname('Piece').asFloat              ;
      data.qryLocationOtherAct.fieldbyname('NetWeight').asFloat            :=data.qryLocationOtherTask.fieldbyname('NetWeight').asFloat            ;
      data.qryLocationOtherAct.Fieldbyname('GrossWeight').asFloat          :=data.qryLocationOtherTask.Fieldbyname('GrossWeight').asFloat          ;
      data.qryLocationOtherAct.fieldbyname('Volume').asFloat               :=data.qryLocationOtherTask.fieldbyname('Volume').asFloat               ;
      data.qryLocationOtherAct.Fieldbyname('Area').asFloat                 :=data.qryLocationOtherTask.Fieldbyname('Area').asFloat                 ;
      data.qryLocationOtherAct.Fieldbyname('costquantity').asFloat         :=data.qryLocationOtherTask.Fieldbyname('costquantity').asFloat                 ;

      data.qryLocationOtherAct.fieldbyname('LoadType').asstring            :=data.qryLocationOtherTask.fieldByname('LoadType').AsString;
//wql.05.07.12      data.qryLocationOtherAct.fieldbyname('CostCD').asstring              :=data.qryLocationOtherTask.fieldbyname('CostCD').asstring           ;
      data.qryLocationOtherAct.fieldbyname('cusid').asstring           :=data.qryLocationOtherTask.fieldbyname('cusid').asstring           ;
      data.qryLocationOtherAct.fieldbyname('cusname').asstring         :=data.qryLocationOtherTask.fieldbyname('cusname').asstring         ;
      data.qryLocationOtherAct.fieldbyname('Shippercusid').asstring    :=data.qryLocationOtherTask.fieldbyname('Shippercusid').asstring           ;
      data.qryLocationOtherAct.fieldbyname('Shippercusname').asstring  :=data.qryLocationOtherTask.fieldbyname('Shippercusname').asstring         ;
      data.qryLocationOtherAct.fieldbyname('Shipcusid').asstring    :=data.qryLocationOtherTask.fieldbyname('Shipcusid').asstring           ;
      data.qryLocationOtherAct.fieldbyname('Shipcusname').asstring  :=data.qryLocationOtherTask.fieldbyname('Shipcusname').asstring         ;
      data.qryLocationOtherAct.fieldbyname('LoadType').asstring            :=data.qryLocationOtherTask.fieldbyname('LoadType').asstring         ;

//      if not grdWareOtherItemBeforePost(data.qryLocationOtherAct,aControl) then
//        break;
      data.qryLocationOtherTask.next;
    end;
    data.qryLocationOtherAct.First;
    data.qryLocationOtherTask.First;
    data.qryLocationOtherTask.EnableControls;
//wql_06.30    self.qryWareOtherItemTaskAfterScroll(data.qryLocationOtherTask);
//wql_06.30    self.qryWareOtherItemAfterScroll(data.qryLocationOtherAct);
  end;
end;

procedure TfrmLocationOther.btnAddClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  ScrollAfterEdit:=True;
  SetDetailActive(False,True);
  Workcall(stInsert);
//  SetMasterDetailState(False);
end;

procedure TfrmLocationOther.btnDeleteClick(Sender: TObject);
begin
  if strFlow='T' then
  begin
    if data.qryLocationOther.FieldByName('CreateName').asstring<>_LoginName then
    begin
      kMessageDlg(GetMessage('frmLocationOther','009'),mtWarning,[mbOK],0);//'该其他操作不是您输入的，不能删除！'
      exit;
    end;
    if data.qryLocationOther.FieldByName('OPERATIONNAME').asstring<>'' then
    begin
      kMessageDlg(GetMessage('frmLocationOther','010'),mtWarning,[mbOK],0);//'该其他操作已经实际操作，不能删除！'
      exit;
    end;
  end else
  begin
    if data.qryLocationOther.FieldByName('OPERATIONNAME').asstring<>_LoginName then
    begin
      kMessageDlg(GetMessage('frmLocationOther','011'),mtWarning,[mbOK],0);//'该其他操作不是您输入的，不能删除！'
      exit;
    end;
  end;
  if data.qryLocationOther.FieldByName('CheckName').asstring<>'' then
  begin
    kMessageDlg(GetMessage('frmLocationOther','012'),mtWarning,[mbOK],0);//'该其他操作已审核，不能删除！'
    exit;
  end;
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
//  pcWareOrderChange(self);
  if not data.qryLocationOtherEdit.Active then
  begin
     data.qryLocationOtherEdit.open;
  end;
  if not data.qryLocationOtherTask.Active then
  begin
     data.qryLocationOtherTask.open;
  end;
  if not data.qryLocationOtherAct.Active then
  begin
     data.qryLocationOtherAct.open;
  end;

  if strFlow='T' then
  begin
    if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
//      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
         ExecSql(dataTmp.qryTmp,'delete from locationother  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
         ExecSql(dataTmp.qryTmp,'delete from  locationothertask  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
         ExecSql(dataTmp.qryTmp,'delete from  locationotheract  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
         //lzw20100121
         ExecSql(dataTmp.qryTmp,'delete from  autocountcost  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');

         ExecSql(dataTmp.qryTmp,' delete from genjobno '
                               +'  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
         //lzw20090630
         if getSysdata('cusname')='SWZ' then
         ExecSql(dataTmp.qryTmp,' delete from forkworkload '
                               +'  where jobno="'+data.qryLocationOther.FieldByName('Jobno').AsString+'" '
                 );

         TdxDBGridNode(grdWareOther.FocusedNode).Delete;
         data.qryLocationOther.Applyupdates;
         _ADOConnection.Commit;
      except
         _ADOConnection.RollBack;
//         SetMasterDetailState(True);
         raise;
         exit;
      end;
      data.qryLocationOther.CommitUpdates;

//      SetMasterDetailState(True);
      workcall(stbrowse);
    end;
  end else
  begin
    if KmessageDlg(GetMessage('frmLocationOther','013'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将删除该项目的所有操作实际，您确定要删除吗?'
    begin
//      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
         ExecSql(dataTmp.qryTmp,'delete from  locationotheract  where jobno="'+
                 data.qryLocationOtherAct.FieldByName('jobno').AsString+'" ');

         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('QUANTITY').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('PIECE').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('VOLUME').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('AREA').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('NETWEIGHT').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('GROSSWEIGHT').AsFloat:=0;
         data.qryLocationOtherEdit.FieldByName('OPERATIONNAME').AsString:='';
         data.qryLocationOtherEdit.FieldByName('OperationDate').Clear;

         data.qryLocationOther.Edit;
         data.qryLocationOther.FieldByName('OPERATIONNAME').AsString:='';
         data.qryLocationOther.FieldByName('OperationDate').Clear;

         data.qryLocationOtherEdit.Applyupdates;
         data.qryLocationOther.Applyupdates;
         _ADOConnection.Commit;
      except
         _ADOConnection.RollBack;
//         SetMasterDetailState(True);
         raise;
         exit;
      end;
      data.qryLocationOther.CommitUpdates;

//      SetMasterDetailState(True);
      workcall(stbrowse);
    end;
  end;
end;

procedure TfrmLocationOther.btncopyClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  pgcMainChange(self);
  SetDetailActive(False,True);

  arrWareOtherEdit:=ScatterToArray(data.qryLocationOtherEdit,true,0);
  arrWareOtherItemTask:=ScatterToArray(data.qryLocationOtherTask,false,0);
  arrWareOtherItem:=ScatterToArray(data.qryLocationOtherAct,false,0);


  blnCopy:=True;
  WorkCall(stInsert);
//  SetMasterDetailState(False);
end;

procedure TfrmLocationOther.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   pgcMainChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('locationother ');

{0}   para.field.add('locationother.LocationBillNO');
{1}   para.field.add('convert(datetime,convert(char(10),locationother.TASKDATE,102))');
{2}   para.Field.add('convert(datetime,convert(char(10),locationother.OPERATIONDATE,102))');
{3}   para.field.add('locationother.SKUCOSTCLASSCD');
{4}   para.field.add('locationother.CheckName');
{5}   para.field.add('convert(datetime,convert(char(10),locationother.CheckDate,102))');
{6}   para.field.add('locationother.costcusid');
{7}   para.field.add('locationother.JOBNO');
{8}   para.field.add('locationother.BLNO');
{9}   para.field.add('locationother.cusBillNO');

   Para.Exp.add('');

{0}   Para.Toptic.Add('仓 单 号');
{1}   Para.Toptic.Add('任务日期');
{2}   Para.Toptic.Add('操作日期');
{3}   Para.Toptic.add('商品计费类');
{4}   Para.Toptic.add('复 核 人');
{5}   Para.Toptic.add('复核日期');
{6}   Para.Toptic.add('费用关系人');
{7}   Para.Toptic.add('工作单号');
{8}   Para.Toptic.add('提 单 号');
{9}   Para.Toptic.add('客户单号');

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('D');
{2}   Para.Ftype.add('D');
{3}   para.Ftype.add('B');
{4}   Para.Ftype.add('B');
{5}   Para.Ftype.add('D');
{6}   Para.Ftype.add('E');
{7}   Para.Ftype.add('C');
{8}   Para.Ftype.add('C');
{9}   Para.Ftype.add('C');

   Para.RField.add('WareOther.jobno');

   if filterSql <> ''
      then Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(data.qryLocationOther, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmLocationOther.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryLocationOther,dataTmp.qryFind);
end;

procedure TfrmLocationOther.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   pgcMainChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('locationother ');

{0}   para.field.add('locationother.LocationBillNO');
{1}   para.field.add('convert(datetime,convert(char(10),locationother.TASKDATE,102))');
{2}   para.Field.add('convert(datetime,convert(char(10),locationother.OPERATIONDATE,102))');
{3}   para.field.add('locationother.SKUCOSTCLASSCD');
{4}   para.field.add('locationother.CheckName');
{5}   para.field.add('convert(datetime,convert(char(10),locationother.CheckDate,102))');
{6}   para.field.add('locationother.costcusid');
{7}   para.field.add('locationother.JOBNO');
{8}   para.field.add('locationother.BLNO');
{9}   para.field.add('locationother.cusBillNO');

   Para.Exp.add('');

{0}   Para.Toptic.Add('仓 单 号');
{1}   Para.Toptic.Add('任务日期');
{2}   Para.Toptic.Add('操作日期');
{3}   Para.Toptic.add('商品计费类');
{4}   Para.Toptic.add('复 核 人');
{5}   Para.Toptic.add('复核日期');
{6}   Para.Toptic.add('费用关系人');
{7}   Para.Toptic.add('工作单号');
{8}   Para.Toptic.add('提 单 号');
{9}   Para.Toptic.add('客户单号');

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('D');
{2}   Para.Ftype.add('D');
{3}   para.Ftype.add('B');
{4}   Para.Ftype.add('B');
{5}   Para.Ftype.add('D');
{6}   Para.Ftype.add('E');
{7}   Para.Ftype.add('C');
{8}   Para.Ftype.add('C');
{9}   Para.Ftype.add('C');

   Para.RField.add('WareOther.jobno');

   if filterSql<>'' then
      Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);
   if strTmp <> 'null' then
   begin
     data.qryLocationOther.DisableControls;
     data.qryLocationOther.Close;
     if strTmp<>'' then
       data.qryLocationOther.MacroByName('Where').AsString:=strTmp
     else
       data.qryLocationOther.MacroByName('Where').AsString:='1=1';
     data.qryLocationOther.Open;
     data.qryLocationOther.EnableControls;
   end;
   workcall(stbrowse);
end;

function TfrmLocationOther.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
  qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
    6:
      begin
        qrySelect:=pGetCustomerSelect('A',''); 
        if qrySelect.FieldByName('cusid').asstring<>'NO' then
        begin
          PItems[0]:=qrySelect.FieldByName('cusname').asstring;
          PItemFields[0]:=qrySelect.FieldByName('cusid').asstring;
        end;
      end;
    else
      Result:=False;
  end;
end;

procedure TfrmLocationOther.btnSaveClick(Sender: TObject);
var
  strJobno,strLocationbillno,strdate:string;
  blnSuc:Boolean;
begin
  blnSuc:=True;
  if ((DataState in setDcs) and Gather) then //新增或编辑存盘
  begin
    try
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          data.qryLocationOtherEdit.ApplyUpdates;

          data.qryLocationOther.Edit;
          data.qryLocationOther.fieldByname('JOBNO').asString:=data.qryLocationOtherEdit.fieldByname('Jobno').asString;
          data.qryLocationOther.FieldByName('LocationBillNO').AsString:=data.qryLocationOtherEdit.FieldByName('LocationBillNO').AsString;
          data.qryLocationOther.fieldByname('keyid').asString:=data.qryLocationOtherEdit.FieldByName('jobno').Asstring;

          m_blnPost := True;
          data.qryLocationOther.ApplyUpdates;
          m_blnPost := False;
    //      TQuery(data.qryLocationOther).ApplyUpdates;
          Break;
        except
          _ADOConnection.Rollback; //先结束事务
          if Error.HandleException(Exception(ExceptObject),
             data.udsLocationOtherEdit.modifysql.text + chr(13) +
             data.udsLocationOtherEdit.DeleteSql.text + chr(13) +
             data.udsLocationOtherEdit.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             blnSuc:=False;
             WorkSaveGet( data.qryLocationOtherEdit.FieldByName('Jobno').AsString +GetMessage('frmLocationOther','014'));//'已经被使用。程序正在查找其他可用客户编号...'
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               opensql(dataTmp.qryTmp,'select datenow=getDate() ');
               strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
               opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                             +'  from genjobno where substring(jobno,5,2)="QT"  and substring(docno1,3,4)="'+copy(datetostr(date),1,4)+'" ' );
               strLocationbillno:='QT'+strDate
                                      +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);
               strRLJobno:=genJobno('QT',strLocationbillno);
               if strRLjobno = '' then
               begin
                 KmessageDlg(GetMessage('frmLocationOther','015'), mtInformation, [mbOk], 0);//'没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 data.qryLocationOtherEdit.Edit;
                 data.qryLocationOtherEdit.FieldByName('Jobno').AsString := strRLJobno;
                 //赋业务联系单号
                 data.qryLocationOtherEdit.FieldByName('LocationBillNO').Asstring:=strLocationbillno;
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
            lblError.caption := '找到可用工作号' + strRLjobno + '，该工作号改为' + strRLjobno + '。';
            btnCancel.visible := false;
            btnOk.visible := true;
            free;
          end;
        end;
      end;
      if not blnSuc then
      begin
        //其他操作任务
        data.qryLocationOtherTask.DisableControls;
        data.qryLocationOtherTask.first;
        while not data.qryLocationOtherTask.eof do
        begin
           data.qryLocationOtherTask.Edit;
           data.qryLocationOtherTask.fieldbyname('JOBNO').asstring:=data.qryLocationOtherEdit.fieldbyname('JOBNO').asstring;
           data.qryLocationOtherTask.Post;
           data.qryLocationOtherTask.next;
        end;
        data.qryLocationOtherTask.first;
        data.qryLocationOtherTask.EnableControls;
        //其他操作实际
        data.qryLocationOtherAct.DisableControls;
        data.qryLocationOtherAct.first;
        while not data.qryLocationOtherAct.eof do
        begin
           data.qryLocationOtherAct.Edit;
           data.qryLocationOtherAct.fieldbyname('JOBNO').asstring:=data.qryLocationOtherEdit.fieldbyname('JOBNO').asstring;
           data.qryLocationOtherAct.Post;
           data.qryLocationOtherAct.next;
        end;
        data.qryLocationOtherAct.first;
        data.qryLocationOtherAct.EnableControls;

        data.qryautocountcostOther.DisableControls;
        with data.qryautocountcostOther do
        begin
           First;
           while not Eof do
           begin
             Edit;
             FieldByName('Jobno').AsString:=data.qryLocationOtherEdit.fieldbyname('JOBNO').asstring;
             next;
           end;
           First;
        end;
        data.qryautocountcostOther.EnableControls;

      end;

      data.qryLocationOtherTask.DisableControls;
      data.qryLocationOtherAct.DisableControls;

      data.qryLocationOtherTask.applyupdates;
      data.qryLocationOtherAct.applyupdates;
      data.qryautocountcostOther.applyupdates;

      _ADOConnection.Commit;
    except
      if datastate=stInsert then
      begin
        arrWareOtherItemTask:=ScatterToArray(data.qryLocationOtherTask,false,0);
        arrWareOtherItem:=ScatterToArray(data.qryLocationOtherAct,false,0);

        data.qryLocationOtherTask.CancelUpdates;
        data.qryLocationOtherAct.CancelUpdates;
      end;

      blnSaveError:=true;
      arrWareOther:=ScatterToArray(data.qryLocationOther,true,0);
      arrWareOtherEdit:=ScatterToArray(data.qryLocationOtherEdit,true,0);
      m_blnPost := True;
      strJobno     :=data.qryLocationOther.FieldByName('Jobno').AsString;
      data.qryLocationOther.CancelUpdates;
      data.qryLocationOtherEdit.CancelUpdates;

      if datastate=stInsert then
      begin
        data.qryLocationOther.Append;
        data.qryLocationOtherEdit.Append;
      end else
      begin
        data.qryLocationOther.Locate('Jobno',
                          VarArrayOf([strJobno]),
                          [loCaseInsensitive, loPartialKey]);
        data.qryLocationOther.Edit;
      end;
      data.qryLocationOther.DisableControls;
      GatherFromArray(data.qryLocationOther,arrWareOther,false);
      GatherFromArray(data.qryLocationOtherEdit,arrWareOtherEdit,false);
      data.qryLocationOther.EnableControls;

      if datastate=stInsert then
      begin
        //qryWareOtherItemTask复制
        data.qryLocationOtherTask.DisableControls;
        GatherFromArray(data.qryLocationOtherTask,arrWareOtherItemTask,true);
        with data.qryLocationOtherTask do
        begin
          First;
          while not Eof do
          begin
            Edit;
            FieldByName('JOBNO').AsString:=strRLJobno;
            next;
          end;
          First;
        end;
        data.qryLocationOtherTask.EnableControls;
        //qryWareOtherItem复制
        data.qryLocationOtherAct.DisableControls;
        GatherFromArray(data.qryLocationOtherAct,arrWareOtherItem,true);
        with data.qryLocationOtherAct do
        begin
          First;
          while not Eof do
          begin
            Edit;
            FieldByName('JOBNO').AsString:=strRLJobno;
            next;
          end;
          First;
        end;
        data.qryLocationOtherAct.EnableControls;
      end;

      m_blnPost := False;
      if _ADOConnection.InTransaction then _ADOConnection.rollback;
      raise;
      Exit;
    end;
    data.qryLocationOther.commitUpdates;
    data.qryLocationOtherEdit.commitUpdates;
    data.qryLocationOtherTask.commitUpdates;
    data.qryLocationOtherAct.commitUpdates;
    data.qryautocountcostOther.CommitUpdates;

    data.qryLocationOtherTask.EnableControls;
    data.qryLocationOtherAct.EnableControls;

    ScrollAfterEdit:=False;
//    SetMasterDetailState(True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmLocationOther.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');

  data.qryLocationOtherAct.CancelUpdates;
  data.qryLocationOtherTask.CancelUpdates;
  data.qryLocationOtherEdit.CancelUpdates;
  data.qryLocationOther.CancelUpdates;
  data.qryautocountcostOther.CancelUpdates;

//  SetMasterDetailState(True);
  WorkCall(stBrowse);
  pgcMainChange(self);
  if data.qryLocationOtherEdit.fieldbyname('jobno').asstring=''
  then btnRefreshclick(self);
end;

procedure TfrmLocationOther.mitFilterActiveClick(Sender: TObject);
begin
  grdWareOther.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmLocationOther.qryLocationOtherUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction:=uaApplied;
end;

procedure TfrmLocationOther.edtWO_UseridButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;  
begin
  if DataState in Setdcs then
  begin
     if AbsoluteIndex=0 then
     begin
        qrySelect:=pGetOrganizationSelect('','','');
        if qrySelect.fieldbyname('userid').asstring<>'NO' then
        begin
           data.qryLocationOtherEdit.Edit;
           data.qryLocationOtherEdit.FieldByName('iuserid').asstring:=qrySelect.FieldByName('userid').asstring;
           data.qryLocationOtherEdit.FieldByName('iusername').asstring:=qrySelect.FieldByName('username').asstring;
           blnselect:=True;
           ReturnNext(self);
        end;
        FreeAndNil(qrySelect);
     end;
  end;
end;

procedure TfrmLocationOther.btnTotalClick(Sender: TObject);
var
  QuantityTotal, PieceTotal:Extended;
  VolumeTotal, AreaTotal, NetWeightTotal, GrossWeightTotal,CostquantityTotal:Extended;
  strSKUNameTotal,strQuantityUOM,strPieceUOM,strVolumeUOM,strAreaUOM,strWeightUOM,strCostquantityuom:string;
  blnQuantityLike,blnPieceLike,blnVolumeLike,blnWeightLike,blnAreaLike,blnCostquantityLike:Boolean;
begin
  if DataState in Setdcs then
  begin
    strSKUNameTotal:='';
    QuantityTotal:=0;
    PieceTotal   :=0;
    VolumeTotal  :=0;
    AreaTotal    :=0;
    NetWeightTotal   :=0;
    GrossWeightTotal :=0;

    blnQuantityLike:=True;
    blnPieceLike   :=True;
    blnVolumeLike  :=True;
    blnWeightLike  :=True;
    blnAreaLike    :=True;
    blnCostquantityLike:=True;  //crl

    begin
      if (strFlow='T') then
      begin
        //任务商品
        data.qryLocationOtherTask.DisableControls;
        data.qryLocationOtherTask.first;
        while not data.qryLocationOtherTask.eof do
        begin
          //任务商品数量合计
          strSKUNameTotal:=strSKUNameTotal+data.qryLocationOtherTask.fieldbyname('SKUName').AsString+' ';

          QuantityTotal :=QuantityTotal+data.qryLocationOtherTask.fieldbyname('Quantity').asFloat;    //crl
          if blnQuantityLike and ((trim(strQuantityUOM)='')
            or (strQuantityUOM=data.qryLocationOtherTask.fieldbyname('QuantityUOM').AsString)) then
          begin
            strQuantityUOM:=data.qryLocationOtherTask.fieldbyname('QuantityUOM').AsString;
          end else
          begin
            blnQuantityLike:=False;
//crl            QuantityTotal:=0;
//crl            strQuantityUOM   :='';
          end;

          PieceTotal :=PieceTotal+data.qryLocationOtherTask.fieldbyname('Piece').asFloat;   //crl
          if blnPieceLike and ((trim(strPieceUOM)='')
            or (strPieceUOM=data.qryLocationOtherTask.fieldbyname('PieceUOM').AsString)) then
          begin
            strPieceUOM:=data.qryLocationOtherTask.fieldbyname('PieceUOM').AsString;
          end else
          begin
            blnPieceLike:=False;
//crl            PieceTotal  :=0;
//crl            strPieceUOM:='';
          end;

          VolumeTotal :=VolumeTotal+data.qryLocationOtherTask.fieldbyname('Volume').asfloat;  //crl
          if blnVolumeLike and ((trim(strVolumeUOM)='')
            or (strVolumeUOM=data.qryLocationOtherTask.fieldbyname('VolumeUOM').AsString)) then
          begin
            strVolumeUOM:=data.qryLocationOtherTask.fieldbyname('VolumeUOM').AsString;
          end else
          begin
            blnVolumeLike:=False;
//crl            VolumeTotal :=0;
//crl            strVolumeUOM:='';
          end;

          AreaTotal :=AreaTotal+data.qryLocationOtherTask.fieldbyname('Area').asfloat; //crl
          if blnAreaLike and ((trim(strAreaUOM)='')
            or (strAreaUOM=data.qryLocationOtherTask.fieldbyname('AreaUOM').AsString)) then
          begin
            strAreaUOM:=data.qryLocationOtherTask.fieldbyname('AreaUOM').AsString;
          end else
          begin
            blnAreaLike:=False;
//crl            AreaTotal :=0;
//crl            strAreaUOM:='';
          end;

          NetWeightTotal  :=NetWeightTotal+data.qryLocationOtherTask.fieldbyname('NetWeight').asfloat;     //crl
          GrossWeightTotal:=GrossWeightTotal+data.qryLocationOtherTask.fieldbyname('GrossWeight').asfloat; //crl
          if blnWeightLike and ((trim(strWeightUOM)='')
            or (strWeightUOM=data.qryLocationOtherTask.fieldbyname('WeightUOM').AsString)) then
          begin
            strWeightUOM    :=data.qryLocationOtherTask.fieldbyname('WeightUOM').AsString;
          end else
          begin
            blnWeightLike   :=False;
//crl            NetWeightTotal  :=0;
//crl            GrossWeightTotal:=0;
//crl            strWeightUOM    :='';
          end;

          CostquantityTotal:=GrossWeightTotal+data.qryLocationOtherTask.fieldbyname('costquantity').asfloat;  //crl
          if blnCostquantityLike and ((trim(strCostquantityuom)='')
            or (strCostquantityuom=data.qryLocationOtherTask.fieldbyname('costquantityuom').AsString)) then
          begin
            strCostquantityuom    :=data.qryLocationOtherTask.fieldbyname('costquantityuom').AsString;
          end else
          begin
            blnCostquantityLike   :=False;
//crl            CostquantityTotal:=0;
//crl            strCostquantityuom    :='';
          end;

          data.qryLocationOtherTask.Next;
        end;
        data.qryLocationOtherTask.First;
        data.qryLocationOtherTask.EnableControls;
//wql_06.30        self.qryWareOtherItemTaskAfterScroll(data.qryLocationOtherTask);
      end else
      begin
        //实际商品
        data.qryLocationOtherAct.DisableControls;
        data.qryLocationOtherAct.first;
        while not data.qryLocationOtherAct.eof do
        begin
          //任务商品数量合计
          strSKUNameTotal:=strSKUNameTotal+data.qryLocationOtherAct.fieldbyname('SKUName').AsString+' ';

          QuantityTotal :=QuantityTotal+data.qryLocationOtherAct.fieldbyname('Quantity').asFloat;
          if blnQuantityLike and ((trim(strQuantityUOM)='')
            or (strQuantityUOM=data.qryLocationOtherAct.fieldbyname('QuantityUOM').AsString)) then
          begin
            strQuantityUOM:=data.qryLocationOtherAct.fieldbyname('QuantityUOM').AsString;
          end else
          begin
            blnQuantityLike :=False;
//            QuantityTotal   :=0;
//            strQuantityUOM  :='';
          end;

          PieceTotal :=PieceTotal+data.qryLocationOtherAct.fieldbyname('Piece').asFloat;
          if blnPieceLike and ((trim(strPieceUOM)='')
            or (strPieceUOM=data.qryLocationOtherAct.fieldbyname('PieceUOM').AsString)) then
          begin
            strPieceUOM:=data.qryLocationOtherAct.fieldbyname('PieceUOM').AsString;
          end else
          begin
            blnPieceLike   :=False;
//            PieceTotal     :=0;
//            strPieceUOM    :='';
          end;

          VolumeTotal :=VolumeTotal+data.qryLocationOtherAct.fieldbyname('Volume').asfloat;
          if blnVolumeLike and ((trim(strVolumeUOM)='')
            or (strVolumeUOM=data.qryLocationOtherAct.fieldbyname('VolumeUOM').AsString)) then
          begin
            strVolumeUOM:=data.qryLocationOtherAct.fieldbyname('VolumeUOM').AsString;
          end else
          begin
            blnVolumeLike   :=False;
//            VolumeTotal     :=0;
//            strVolumeUOM    :='';
          end;

          AreaTotal :=AreaTotal+data.qryLocationOtherAct.fieldbyname('Area').asfloat;
          if blnAreaLike and ((trim(strAreaUOM)='')
            or (strAreaUOM=data.qryLocationOtherAct.fieldbyname('AreaUOM').AsString)) then
          begin
            strAreaUOM:=data.qryLocationOtherAct.fieldbyname('AreaUOM').AsString;
          end else
          begin
            blnAreaLike  :=False;
//            AreaTotal    :=0;
//            strAreaUOM   :='';
          end;

          NetWeightTotal  :=NetWeightTotal+data.qryLocationOtherAct.fieldbyname('NetWeight').asfloat;
          GrossWeightTotal:=GrossWeightTotal+data.qryLocationOtherAct.fieldbyname('GrossWeight').asfloat;
          if blnWeightLike and ((trim(strWeightUOM)='')
            or (strWeightUOM=data.qryLocationOtherAct.fieldbyname('WeightUOM').AsString)) then
          begin
            strWeightUOM    :=data.qryLocationOtherAct.fieldbyname('WeightUOM').AsString;
          end else
          begin
            blnWeightLike   :=False;
//            NetWeightTotal  :=0;
//            GrossWeightTotal:=0;
//            strWeightUOM    :='';
          end;

          CostquantityTotal :=CostquantityTotal+data.qryLocationOtherAct.fieldbyname('costquantity').asfloat;
          if blnCostquantityLike and ((trim(strCostquantityuom)='')
            or (strCostquantityuom=data.qryLocationOtherAct.fieldbyname('costquantityuom').AsString)) then
          begin
            strCostquantityuom:=data.qryLocationOtherAct.fieldbyname('costquantityuom').AsString;
          end else
          begin
            blnCostquantityLike  :=False;
    //        CostquantityTotal    :=0;
    //        strCostquantityuom   :='';
          end;

          data.qryLocationOtherAct.Next;
        end;
        data.qryLocationOtherAct.First;
        data.qryLocationOtherAct.EnableControls;
//WQL_06.30        self.qryWareOtherItemAfterScroll(data.qryLocationOtherAct);
      end;
    end;

    data.qryLocationOtherEdit.Edit;
    if (strFlow='T') then
    begin
      data.qryLocationOtherEdit.fieldbyname('SKUNAME').AsString:=strSKUNameTotal;
      data.qryLocationOtherEdit.fieldbyname('QuantityTasked').asFloat:=QuantityTotal;
      data.qryLocationOtherEdit.fieldbyname('PieceTasked').asFloat:=PieceTotal;
      data.qryLocationOtherEdit.fieldbyname('VolumeTasked').asfloat:=VolumeTotal;
      data.qryLocationOtherEdit.fieldbyname('AreaTasked').asfloat:=AreaTotal;
      data.qryLocationOtherEdit.fieldbyname('NetWeightTasked').asFloat:=NetWeightTotal;
      data.qryLocationOtherEdit.fieldbyname('GrossWeightTasked').asFloat:=GrossWeightTotal;
      data.qryLocationOtherEdit.fieldbyname('costquantityTasked').asFloat:=costquantityTotal;

      data.qryLocationOtherEdit.fieldbyname('QuantityUOM').AsString:=strQuantityUOM;
      data.qryLocationOtherEdit.fieldbyname('PieceUOM').AsString:=strPieceUOM;
      data.qryLocationOtherEdit.fieldbyname('VolumeUOM').AsString:=strVolumeUOM;
      data.qryLocationOtherEdit.fieldbyname('AreaUOM').AsString:=strAreaUOM;
      data.qryLocationOtherEdit.fieldbyname('WeightUOM').AsString:=strWeightUOM;
      data.qryLocationOtherEdit.fieldbyname('costquantityuom').AsString:=strCostquantityuom;
    end
    else  begin
      data.qryLocationOtherEdit.fieldbyname('SKUNAME').AsString:=strSKUNameTotal;
      data.qryLocationOtherEdit.fieldbyname('Quantity').asFloat:=QuantityTotal;
      data.qryLocationOtherEdit.fieldbyname('Piece').asFloat:=PieceTotal;
      data.qryLocationOtherEdit.fieldbyname('Volume').asfloat:=VolumeTotal;
      data.qryLocationOtherEdit.fieldbyname('Area').asfloat:=AreaTotal;
      data.qryLocationOtherEdit.fieldbyname('NetWeight').asFloat:=NetWeightTotal;
      data.qryLocationOtherEdit.fieldbyname('GrossWeight').asFloat:=GrossWeightTotal;
      data.qryLocationOtherEdit.fieldbyname('costquantity').asFloat:=costquantityTotal;
      data.qryLocationOtherEdit.fieldbyname('QuantityUOM').AsString:=strQuantityUOM;
      data.qryLocationOtherEdit.fieldbyname('PieceUOM').AsString:=strPieceUOM;
      data.qryLocationOtherEdit.fieldbyname('VolumeUOM').AsString:=strVolumeUOM;
      data.qryLocationOtherEdit.fieldbyname('AreaUOM').AsString:=strAreaUOM;
      data.qryLocationOtherEdit.fieldbyname('WeightUOM').AsString:=strWeightUOM;
      data.qryLocationOtherEdit.fieldbyname('costquantityuom').AsString:=strCostquantityuom;
    end;
  end;
end;

procedure TfrmLocationOther.edtSKUEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    if (strFlow='T')  then
       TdxDBButtonEdit(sender).DirectInput:=True
    else
       TdxDBButtonEdit(sender).DirectInput:=False;
end;

procedure TfrmLocationOther.edtSKUTaskExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
 {WQL_06.30 with TdxDBButtonEdit(sender) do
    if (Text<>'') and (Text<>strGetCd) then
      with workSKUSelect('','','D',False,Text)[0] do
      if okflag then
      begin
        data.qryLocationOtherTask.Edit;
        data.qryLocationOtherTask.Fieldbyname('SKUID').asstring      :=SKUID;
        data.qryLocationOtherTask.Fieldbyname('SKUName').asstring    :=SKUName;
        data.qryLocationOtherTask.Fieldbyname('QuantityUOM').asstring:=QuantityUOM;
        data.qryLocationOtherTask.Fieldbyname('PieceUOM').asstring   :=PieceUOM;
        data.qryLocationOtherTask.Fieldbyname('VolumeUOM').asstring  :=VolumeUOM;
        data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring    :=AreaUOM;
        data.qryLocationOtherTask.Fieldbyname('WeightUOM').asstring  :=WeightUOM;
        data.qryLocationOtherTask.Fieldbyname('SKUCOSTCLASSCD').asstring      :=SKUCOSTCLASSCD;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Piece_Prop').asInteger:=Quantity_Piece_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Volume_Prop').asFloat :=Quantity_Volume_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Area_Prop').asFloat   :=Quantity_Area_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Weight_Prop').asFloat :=Quantity_Weight_Prop;
        strGetCd := SKUName;
      end else Failed:=True; }
end;

procedure TfrmLocationOther.CostcusButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     if AbsoluteIndex=0 then
     begin
        qryselect:=pGetcustomerselect('A','');
        if qrySelect.FieldByName('cusid').asstring<>'NO' then
        begin
           data.qryLocationOtherEdit.edit;
           data.qryLocationOtherEdit.FieldByName('costcusid').AsString:=qrySelect.FieldByName('cusid').asstring;
           data.qryLocationOtherEdit.FieldByName('costcusname').AsString:=qrySelect.FieldByName('cusname').asstring;
           blnselect:=True;
           ReturnNext(self);
        end;
        FreeAndNil(qrySelect);
     end else
     begin
        GetCusCnfg;
     end;
  end;
end;

{crl
function TfrmLocationOther.CalcConQuantity(pblnAccount,pblnCountAccount:Boolean;
                                           pstrAccount,pstrAccountName:string;
                                           pblnAssistant:Boolean=False):string;
}
{ 计算各种集装箱的箱量
  pblnAccount     :是否与客户相关
  pblnCountAccount:是否仅统计客户
  pstrAccount     :有关费用关系人代码字段
  pstrAccountName :有关费用关系人名称字段
  pblnAssistant   :是否辅助费用,仅对于应付装卸费
}
{
var
  i,intConnum:integer;
  strConcnt,strContype:string;
begin
  intConQuantityTotal:=0;
  sltAccount.Clear;
  sltAccountName.Clear;
  sltConType.Clear;
  sltConQuantity.Clear;

  strConcnt:='';
  if not pblnAccount and not pblnCountAccount and (sltConType.Count>0) then
  begin
    strContype:=sltConType.Strings[0];
    intConnum:=strTOint(sltConQuantity.Strings[0]);
    for i:= 1 to sltConType.count-1 do
      if strContype=sltConType.Strings[i] then
        intConnum:=intConnum+strTOint(sltConQuantity.Strings[i])
      else
      begin
        strConcnt:=strConcnt+intTostr(intConnum)+'X'+trim(strContype)+' ';
        strContype:=sltConType.Strings[i];
        intConnum:=strTOint(sltConQuantity.Strings[i]);
      end;
    strConcnt:=strConcnt+intTostr(intConnum)+'X'+trim(strContype)+' ';
  end;
  result:=strConcnt;
end;
}

procedure TfrmLocationOther.mitAccountChkClick(Sender: TObject);
begin
{   if WorkCheckCost(data.qryLocationOther.FieldByName('LocationBillNO').AsString,
                    data.qryLocationOther.FieldByName('DataBaseID').AsString,
                    True) then
      btnRefresh.Click;}
end;

procedure TfrmLocationOther.mitCancelactChkClick(Sender: TObject);
begin
{   if WorkCheckCost(data.qryLocationOther.FieldByName('LocationBillNO').AsString,
                    data.qryLocationOther.FieldByName('DataBaseID').AsString,
                    False) then
      btnRefresh.Click;}
end;

procedure TfrmLocationOther.qryLocationOtherEditUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
//
end;

procedure TfrmLocationOther.mitSKUSelectClick(Sender: TObject);
begin
{wql_06.30  if DataState in Setdcs then
    begin
      with workSKUSelect('','','D')[0] do
      if okflag then
      begin
        data.qryLocationOtherTask.Edit;
        data.qryLocationOtherTask.Fieldbyname('SKUID').asstring      :=SKUID;
        data.qryLocationOtherTask.Fieldbyname('SKUName').asstring    :=SKUName;
        data.qryLocationOtherTask.Fieldbyname('QuantityUOM').asstring:=QuantityUOM;
        data.qryLocationOtherTask.Fieldbyname('PieceUOM').asstring   :=PieceUOM;
        data.qryLocationOtherTask.Fieldbyname('VolumeUOM').asstring  :=VolumeUOM;
        data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring    :=AreaUOM;
        data.qryLocationOtherTask.Fieldbyname('WeightUOM').asstring  :=WeightUOM;
        data.qryLocationOtherTask.Fieldbyname('SKUCOSTCLASSCD').asstring      :=SKUCOSTCLASSCD;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Piece_Prop').asInteger:=Quantity_Piece_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Volume_Prop').asFloat:=Quantity_Volume_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Area_Prop').asFloat  :=Quantity_Area_Prop;
        data.qryLocationOtherTask.Fieldbyname('Quantity_Weight_Prop').asFloat:=Quantity_Weight_Prop;
        strGetCd := SKUName;
      end;
      blnISSKU:=True;
    end; }
end;

procedure TfrmLocationOther.mitOrderSKUSelectClick(Sender: TObject);
var
  i:integer;
//  acontrol: TWinControl;
//  TLocationSKUSelect:TMultLocationSKUSelect;
begin
 {wql_06.30 if DataState in Setdcs then
    begin
      //保税商品出仓必须从指令资料中选择(出于报关流程的控制),
      //对于非保税商品,若指令资料中仍存在非完成的指令数量,也必须从指令资料中选择
      TLocationSKUSelect:=  WorkLocationSKUSelect(' and isnull(Detail.AccountID,"") like "%'+data.qryLocationOtherTask.fieldbyname('AccountID').asstring+'%" ',
                                                  '库存商品选择','TO','TK','Quantity_RemainTask',False);
      for i:=0 to 100 do
      begin
        if TLocationSKUSelect[i].OkFlag then
        begin
          if i=0 then
          begin
            data.qryLocationOtherTask.edit;
            data.qryLocationOtherEdit.Edit;
//            data.qryLocationOtherEdit.fieldbyname('WareRentCountType').asstring    :=TLocationSKUSelect[i].WareRentCountType;
            data.qryLocationOtherEdit.fieldbyname('WO_ISTARIFFPROTECTED').asstring :=TLocationSKUSelect[i].WO_ISTARIFFPROTECTED;
            data.qryLocationOtherEdit.fieldbyname('SKUCOSTCLASSCD').asstring       :=TLocationSKUSelect[i].SKUCOSTCLASSCD;
            data.qryLocationOtherEdit.fieldbyname('CustomsNO').asstring            :=TLocationSKUSelect[i].CustomsNO;
//            data.qryLocationOtherEdit.fieldbyname('AccountBillNO').asstring        :=TLocationSKUSelect[i].AccountBillNO;
//            data.qryLocationOtherEdit.fieldbyname('BLNO').asstring                 :=TLocationSKUSelect[i].BLNO;


            if data.qryLocationOtherEdit.fieldbyname('WO_COUNTCONTACCOUNTID').asstring='' then
            begin
              data.qryLocationOtherEdit.fieldbyname('WO_COUNTCONTACCOUNTID').asstring:=TLocationSKUSelect[i].WO_COUNTCONTACCOUNTID;
              data.qryLocationOtherEdit.fieldbyname('WO_CountContAccountName').asstring:=TLocationSKUSelect[i].WO_COUNTCONTACCOUNTName;
            end;
//            ckbTariffClick(self);
          end else
          begin
            try
               qryWareOtherItemTaskBeforePost(data.qryLocationOtherTask);
            except
               break;
            end;
            data.qryLocationOtherTask.append;
            data.qryLocationOtherTask.fieldbyname('sno').Asinteger:=-1;
            data.qryLocationOtherTask.fieldByname('jobno').AsString:=data.qryLocationOtherEdit.fieldbyname('jobno').AsString;
            data.qryLocationOtherTask.fieldByname('userid').AsString:=data.qryLocationOtherEdit.fieldbyname('userid').AsString;
            data.qryLocationOtherTask.fieldByname('DataBaseID').AsString:=_DataBaseID;
          end;
          data.qryLocationOtherTask.fieldbyname('SKUID').asstring               :=TLocationSKUSelect[i].SKUID            ;
          data.qryLocationOtherTask.Fieldbyname('SKUCOSTCLASSCD').asstring      :=TLocationSKUSelect[i].SKUCOSTCLASSCD;
          data.qryLocationOtherTask.fieldbyname('SKUName').asstring             :=TLocationSKUSelect[i].SKUName          ;
          strGetCd := TLocationSKUSelect[i].SKUName;
//          data.qryLocationOtherTask.Fieldbyname('LotCode').asstring             :=TLocationSKUSelect[i].LotCode          ;
          data.qryLocationOtherTask.fieldbyname('Quantity').AsFloat             :=TLocationSKUSelect[i].QT_Remain        ;
//          data.qryLocationOtherTask.fieldbyname('QualityName').asstring         :=TLocationSKUSelect[i].QualityName      ;
          data.qryLocationOtherTask.fieldbyname('PieceUOM').asstring            :=TLocationSKUSelect[i].PieceUOM         ;
          data.qryLocationOtherTask.fieldbyname('WeightUOM').asstring           :=TLocationSKUSelect[i].WeightUOM        ;
          data.qryLocationOtherTask.fieldbyname('VolumeUOM').asstring           :=TLocationSKUSelect[i].VolumeUOM        ;
          data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring             :=TLocationSKUSelect[i].AreaUOM          ;
          data.qryLocationOtherTask.fieldbyname('Piece').AsFloat                :=TLocationSKUSelect[i].syPiece          ;
          data.qryLocationOtherTask.fieldbyname('NetWeight').asFloat            :=TLocationSKUSelect[i].syNetWeight      ;
          data.qryLocationOtherTask.Fieldbyname('GrossWeight').asFloat          :=TLocationSKUSelect[i].syGrossWeight    ;
          data.qryLocationOtherTask.fieldbyname('Volume').asFloat               :=TLocationSKUSelect[i].syVolume         ;
          data.qryLocationOtherTask.Fieldbyname('Area').asFloat                 :=TLocationSKUSelect[i].syArea           ;
          data.qryLocationOtherTask.fieldbyname('AccountID').asstring           :=TLocationSKUSelect[i].AccountID        ;
          data.qryLocationOtherTask.fieldbyname('AccountName').asstring         :=TLocationSKUSelect[i].AccountName      ;

          data.qryLocationOtherTask.fieldbyname('JOBNO_IN').asstring            :=TLocationSKUSelect[i].Jobno;
          data.qryLocationOtherTask.Fieldbyname('SNO_IN').asInteger             :=TLocationSKUSelect[i].SNO;

        end;
      end;
      blnISSKU:=False;
    end;  }
end;

procedure TfrmLocationOther.pgcMainChange(Sender: TObject);
begin
   if pgcMain.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      btnFirst.SkipGroup:=True;
      btnPrior.SkipGroup:=True;
      btnNext.SkipGroup:=True;
      btnLast.SkipGroup:=True;
      SetDetailActive(True,True);
   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
      btnFirst.SkipGroup:=False;
      btnPrior.SkipGroup:=False;
      btnNext.SkipGroup:=False;
      btnLast.SkipGroup:=False;
   end;
end;

procedure TfrmLocationOther.mitWareOtherTaskClick(Sender: TObject);
var
  KF1Book : TKF1book;
  strRemark,strConno,strWO_LBNOPrinted:string;
  intCou:integer;
begin
  OpenSql(dataTmp.qryTmp,'select printed from locationOther '
                +' where LocationOther.jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
  strWO_LBNOPrinted:=dataTmp.qryTmp.FieldByName('printed').AsString;
  if trim(strWO_LBNOPrinted)<>'' then
  begin
    if trim(strWO_LBNOPrinted)<>_LoginName then
    begin
      kMessageDlg(GetMessage('frmLocationOther','016'), mtWarning, [mbOK], 0);//'该仓单已经打印过，且你无权取消打印过标志！'
      exit;
    end else
    begin
      if Kmessagedlg(GetMessage('frmLocationOther','017'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该仓单已经打印过，要继续打印必须取消仓单打印,确认吗？'
      begin
        execSql(dataTmp.qryTmp,'update locationother  set printedd="" '
                      +' where locationother.jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
        strWO_LBNOPrinted:='';
      end else exit;
    end;
  end;

  if pgcMain.ActivePage<>tbsEdit then
     pgcMain.ActivePage:=tbsEdit;
  if pgcWareOther.activepage<>tbsWareOtherItem then
     pgcWareOther.activepage:=tbsWareOtherItem;

  strRemark:='';
  strCONNO:='';
  intCou:=0;

  data.qryLocationOtherAct.Close;
  data.qryLocationOtherAct.Open;
  data.qryLocationOtherAct.First;
  while  not data.qryLocationOtherAct.Eof do
  begin
    strRemark:=strRemark+StringReplace(data.qryLocationOtherAct.FieldByName('Remark').AsString,'#13#10',' ',[rfReplaceAll]);
    data.qryLocationOtherAct.Next;
  end;

  KF1Book := TKF1book.Create;
//打印
//  if TKBitBtn(Sender)=btnPrint then
//    KF1Book.BbHandle:=bbPrint;
  try
    strSql:='Select detail.*,'//Location.LocationName,'
           +'       Piece_P=case when isnull(Detail.piece,0)<>0 then rtrim(Convert(char,convert(float,detail.piece))) else "" end,'
           +'       Piece_Puom=case when isnull(Detail.piece,0)<>0 then detail.pieceuom else "" end,'
           +'       GWeight_P=case when isnull(Detail.GrossWeight,0)<>0 then rtrim(Convert(char,convert(float,Detail.GrossWeight)))+detail.weightuom else "" end, '
           +'       NWeight_P=case when isnull(Detail.NetWeight,0)<>0 then rtrim(Convert(char,convert(float,Detail.NetWeight)))+detail.weightuom else "" end, '
           +'       Area_P=case when isnull(Detail.Area,0)<>0 then rtrim(Convert(char,convert(float,Detail.Area)))+detail.areauom else "" end, '
           +'       Volume_P=case when isnull(Detail.Volume,0)<>0 then rtrim(Convert(char,convert(float,Detail.Volume)))+detail.volumeuom else "" end, '
           +'       LIBillNO=detail.LocationBillNO, '
//crl           +'       CostName=CostCode.CostName, '
           //         +'       CustomsNO=Detail.CustomsNO,'
//crl           +'       AccountBillNO=detail.AccountBillNO,'
           +'       LICustomsNO=detail.CustomsNO'
           +'  from locationothertask Detail'
           +'       left join SKU'
           +'              on Detail.SKUID=SKU.SKUID'
//crl           +'       left join Costcode  '
//crl           +'              on Detail.CostCD=CostCode.CostCD '
           +' Where Detail.Jobno="'+data.qryLocationOther.fieldbyname('Jobno').AsString+'"'
           +' order by Detail.sno ';
    opensql(dataTmp.qryTmp,strsql);
    with KF1Book do
    begin
      BBdm:='900038';
      paras.Values['UserName']      :=_UserName;
      paras.Values['LocationBillNO']:=data.qryLocationOtherEdit.fieldbyname('LocationBillNO').AsString;
//crl      paras.Values['AccountNO']     :=data.qryLocationOtherEdit.fieldbyname('AccountBillNO').AsString;
      paras.Values['CustomsNO']     :=data.qryLocationOtherEdit.fieldbyname('CustomsNO').AsString;
      paras.Values['BLNO']          :=data.qryLocationOtherEdit.fieldbyname('BLNO').AsString;
//crl      paras.Values['CCAName']       :=data.qryLocationOtherEdit.fieldbyname('cusname').AsString;
      paras.Values['TaskDate']      :=data.qryLocationOtherEdit.fieldbyname('TASKDATE').AsString;

      paras.Values['CONDescription']:=strConno;
      paras.Values['OPERATIONDATE'] :=data.qryLocationOtherEdit.fieldbyname('OPERATIONDATE').AsString;
      paras.Values['Piece']         :=iif(data.qryLocationOtherEdit.fieldbyname('Piece').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Piece').AsFloat));
      paras.Values['NetWeight']     :=iif(data.qryLocationOtherEdit.fieldbyname('NetWeight').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('NetWeight').AsFloat));
      paras.Values['GrossWeight']   :=iif(data.qryLocationOtherEdit.fieldbyname('GrossWeight').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('GrossWeight').AsFloat));
      paras.Values['Area']          :=iif(data.qryLocationOtherEdit.fieldbyname('Area').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Area').AsFloat));
      paras.Values['Volume']        :=iif(data.qryLocationOtherEdit.fieldbyname('Volume').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Volume').AsFloat));

      paras.Values['OPERATIONNAME']:=data.qryLocationOtherEdit.fieldbyname('OPERATIONNAME').AsString;
      paras.Values['CHECKNAME']    :=data.qryLocationOtherEdit.fieldbyname('CHECKNAME').AsString;
      paras.Values['zbr']              :=_LoginName;
      paras.Values['bsbz']             :=iif(data.qryLocationOtherEdit.fieldbyname('isbond').AsString='T','是','非');
      paras.Values['Remark']           :=StringReplace(data.qryLocationOtherEdit.FieldByName('remark').AsString,chr(13)+chr(10),' ',[rfReplaceAll])+strRemark;

      qryMain:=dataTmp.qryTmp;
      CreateReport;
    end;
  finally
    KF1Book.Destroy;
  end;
  if trim(strWO_LBNOPrinted)='' then
  begin
    if Kmessagedlg(GetMessage('frmLocationOther','018'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//('该仓单已经打印过，要禁止仓单打印吗？'
    begin
      execSql(dataTmp.qryTmp,'update locationother  set Printed="'+_LoginName+'" '
                    +' where locationother.jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" ');
    end else exit;
  end;
end;

procedure TfrmLocationOther.mitWareOtherItemClick(Sender: TObject);
var
  KF1Book : TKF1book;
  strRemark,strConno:string;
begin
  if pgcMain.ActivePage<>tbsEdit then
     pgcMain.ActivePage:=tbsEdit;
  if pgcWareOther.activepage<>tbsWareOtherItem then
     pgcWareOther.activepage:=tbsWareOtherItem;

  strRemark:='';
  strCONNO:='';

  KF1Book := TKF1book.Create;
  try
    strSql:='Select Detail.*,'//Location.LocationName,'
           +'       Piece_P=case when isnull(Detail.piece,0)<>0 then rtrim(Convert(char,Detail.piece)) else "" end,'
           +'       Piece_Puom=case when isnull(Detail.piece,0)<>0 then detail.pieceuom else "" end,'
           +'       GWeight_P=case when isnull(Detail.GrossWeight,0)<>0 then rtrim(Convert(char,Detail.GrossWeight))+detail.weightuom else "" end, '
           +'       NWeight_P=case when isnull(Detail.NetWeight,0)<>0 then rtrim(Convert(char,Detail.NetWeight))+detail.weightuom else "" end, '
           +'       Area_P=case when isnull(Detail.Area,0)<>0 then rtrim(Convert(char,Detail.Area))+detail.areauom else "" end, '
           +'       Volume_P=case when isnull(Detail.Volume,0)<>0 then rtrim(Convert(char,Detail.Volume))+detail.volumeuom else "" end, '
           +'       LIBillNO=detail.LocationBillNO, '
//crl           +'       CostName=CostCode.CostName, '
           //         +'       CustomsNO=Detail.CustomsNO,'
           +'       cusBillNO=detail.cusBillNO,'
           +'       LICustomsNO=detail.CustomsNO'
           +'  from LocationOtherAct Detail (nolock) '
//crl           +'       left join Costcode  '
//crl           +'              on Detail.CostCD=CostCode.CostCD '
           +' Where Detail.Jobno="'+data.qryLocationOther.fieldbyname('Jobno').AsString+'"'
           +' order by Detail.sno ';
    opensql(dataTmp.qryTmp,strsql);
    with KF1Book do
    begin
      BBdm:='900038';
      paras.Values['UserName']      :=_UserName;
      paras.Values['LocationBillNO']:=data.qryLocationOtherEdit.fieldbyname('LocationBillNO').AsString;
      paras.Values['AccountNO']     :=data.qryLocationOtherEdit.fieldbyname('cusBillNO').AsString;
      paras.Values['CustomsNO']     :=data.qryLocationOtherEdit.fieldbyname('CustomsNO').AsString;
      paras.Values['BLNO']          :=data.qryLocationOtherEdit.fieldbyname('BLNO').AsString;
      paras.Values['CCAName']       :=data.qryLocationOtherEdit.fieldbyname('costcusname').AsString;

      paras.Values['CONDescription']:=strConno;
      paras.Values['OPERATIONDATE'] :=data.qryLocationOtherEdit.fieldbyname('OPERATIONDATE').AsString;
      paras.Values['Piece']         :=iif(data.qryLocationOtherEdit.fieldbyname('Piece').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Piece').AsFloat));
      paras.Values['NetWeight']     :=iif(data.qryLocationOtherEdit.fieldbyname('NetWeight').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('NetWeight').AsFloat));
      paras.Values['GrossWeight']   :=iif(data.qryLocationOtherEdit.fieldbyname('GrossWeight').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('GrossWeight').AsFloat));
      paras.Values['Area']          :=iif(data.qryLocationOtherEdit.fieldbyname('Area').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Area').AsFloat));
      paras.Values['Volume']        :=iif(data.qryLocationOtherEdit.fieldbyname('Volume').AsFloat=0,'',FloatToStr(data.qryLocationOtherEdit.fieldbyname('Volume').AsFloat));

      paras.Values['OPERATIONUSERNAME']:=data.qryLocationOtherEdit.fieldbyname('OPERATIONNAME').AsString;
      paras.Values['CHECKUSERNAME']    :=data.qryLocationOtherEdit.fieldbyname('CHECKNAME').AsString;
      paras.Values['zbr']              :=_LoginName;
      paras.Values['bsbz']             :=iif(data.qryLocationOtherEdit.fieldbyname('isbond').AsString='T','是','非');
      paras.Values['Remark']           :=data.qryLocationOtherEdit.fieldbyname('remark').AsString+strRemark;

      qryMain:=dataTmp.qryTmp;
      CreateReport;
    end;
  finally
    KF1Book.Destroy;
  end;
end;


procedure TfrmLocationOther.mitFgCostRentClick(Sender: TObject);
var
  strCostUOMType:String;
begin
  if KmessageDlg(GetMessage('frmLocationOther','019'),//'是否用本笔记录的费率方式替换其他记录？'
                  mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      strCostUOMType:='';
      strCostUOMType:=data.qryLocationOtherTask.fieldbyname('CostCountUOMType').AsString;
      data.qryLocationOtherTask.First;
      while not data.qryLocationOtherTask.Eof do
      begin
        data.qryLocationOtherTask.Edit;
        data.qryLocationOtherTask.fieldbyname('CostCountUOMType').AsString:=strCostUOMType;
        data.qryLocationOtherTask.Next;
      end;
    end;
end;

procedure TfrmLocationOther.edtQualityNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_06.30  if DataState in setDcs then
  begin
    with workQualitySelect(data.qryLocationOtherTask.FieldByName('QualityName').AsString) do
    if OkFlag then
    begin
      data.qryLocationOtherTask.edit;
      data.qryLocationOtherTask.FieldByName('QualityName').AsString:=QualityName;
    end;
  end; }
end;

procedure TfrmLocationOther.edtedtQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{wql_06.30  if DataState in setDcs then
  begin
    with workQualitySelect(data.qryLocationOtherAct.FieldByName('QualityName').AsString) do
    if OkFlag then
    begin
      data.qryLocationOtherAct.edit;
      data.qryLocationOtherAct.FieldByName('QualityName').AsString:=QualityName;
    end;
  end;                   }
end;

procedure TfrmLocationOther.btnOperClick(Sender: TObject);
{var
  acontrol: TWinControl;
  Present: TDateTime;}
begin
  if (data.qryLocationOtherEdit.FieldByName('OperationName').AsString='')
    and (data.qryLocationOtherTask.FieldByName('Jobno').AsString='') then
  begin
    kMessageDlg(GetMessage('frmLocationOther','020'), mtWarning, [mbOK], 0);//'任务商品资料不完整,不能执行该操作!'
    exit;
  end;

  if (data.qryLocationOtherEdit.FieldByName('OperationName').AsString<>'')
    and (data.qryLocationOtherAct.FieldByName('Jobno').AsString<>'') then
  begin
    if data.qryLocationOtherEdit.FieldByName('OperationName').AsString<>_LoginName then
    begin
      kMessageDlg(GetMessage('frmLocationOther','021'), mtWarning, [mbOK], 0);//'资料不是由您录入的,不能执行该操作!'
      exit;
    end;

    if KmessageDlg(GetMessage('frmLocationOther','022'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将删除商品实际的所有内容，您确定要删除吗?'
    begin
      data.qryLocationOtherAct.DisableControls;
      data.qryLocationOtherAct.First;
      while not data.qryLocationOtherAct.Eof do
      begin
        data.qryLocationOtherAct.Delete;
      end;
      data.qryLocationOtherAct.EnableControls;

      data.qryLocationOtherEdit.Edit;
      data.qryLocationOtherEdit.FieldByName('OperationName').AsString:='';
      data.qryLocationOtherEdit.FieldByName('OperationDate').Clear;

      data.qryLocationOther.Edit;
      data.qryLocationOther.FieldByName('OperationName').AsString:='';
      data.qryLocationOther.FieldByName('OperationDate').Clear;
    end;
  //lzw2000710
  end else
  begin
     if (pgcWareOther.ActivePage<>tbsWareOtherItem) then
        pgcWareOther.ActivePage:=tbsWareOtherItem;
     //直接操作
     if (data.qryLocationOtherEdit.FieldByName('OperationName').AsString='') then
     begin
       libWinControl(self,grdWareOtherItem,False);

   //    Present:=now;
       data.qryLocationOtherEdit.Edit;
       data.qryLocationOtherEdit.FieldByName('OperationName').AsString    :=_LoginName;
       data.qryLocationOtherEdit.FieldByName('OperationDate').AsDateTime  :=Now;

       data.qryLocationOtherEdit.fieldbyname('Quantity').AsFloat    :=data.qryLocationOtherEdit.fieldbyname('QuantityTasked').AsFloat;
       data.qryLocationOtherEdit.fieldbyname('Piece').AsFloat       :=data.qryLocationOtherEdit.fieldbyname('PieceTasked').AsFloat     ;
       data.qryLocationOtherEdit.fieldbyname('NetWeight').asFloat   :=data.qryLocationOtherEdit.fieldbyname('NetWeightTasked').asFloat   ;
       data.qryLocationOtherEdit.Fieldbyname('GrossWeight').asFloat :=data.qryLocationOtherEdit.Fieldbyname('GrossWeightTasked').asFloat ;
       data.qryLocationOtherEdit.fieldbyname('Volume').asFloat      :=data.qryLocationOtherEdit.fieldbyname('VolumeTasked').asFloat      ;
       data.qryLocationOtherEdit.Fieldbyname('Area').asFloat        :=data.qryLocationOtherEdit.Fieldbyname('AreaTasked').asFloat        ;
       data.qryLocationOtherEdit.Fieldbyname('costquantity').asFloat:=data.qryLocationOtherEdit.Fieldbyname('costquantityTasked').asFloat        ;
       //将任务的数据传递过来
       data.qryLocationOtherTask.DisableControls;
       data.qryLocationOtherTask.First;
       while not data.qryLocationOtherTask.Eof do
       begin
         data.qryLocationOtherAct.append;
         data.qryLocationOtherAct.fieldByname('jobno').AsString            :=data.qryLocationOtherTask.fieldByname('jobno').AsString;
         data.qryLocationOtherAct.fieldByname('userid').AsString           :=data.qryLocationOtherTask.fieldByname('userid').AsString;
         data.qryLocationOtherAct.fieldByname('username').AsString         :=data.qryLocationOtherTask.fieldByname('username').AsString;
         data.qryLocationOtherAct.fieldbyname('shippercusid').asstring     :=data.qryLocationOtherTask.fieldbyname('shippercusid').asstring;
         data.qryLocationOtherAct.fieldbyname('shipcusname').asstring      :=data.qryLocationOtherTask.fieldbyname('shipcusname').asstring;
         data.qryLocationOtherAct.FieldByName('iuserid').AsString          :=data.qryLocationOtherTask.fieldbyname('iuserid').AsString;
         data.qryLocationOtherAct.FieldByName('iusername').AsString        :=data.qryLocationOtherTask.fieldbyname('iusername').AsString;
         data.qryLocationOtherAct.FieldByName('warerentcounttype').AsString:=data.qryLocationOtherTask.fieldbyname('warerentcounttype').AsString;

         data.qryLocationOtherAct.fieldbyname('SNO').asInteger          :=data.qryLocationOtherTask.fieldbyname('SNO').asInteger;
         data.qryLocationOtherAct.fieldbyname('cusname').asstring       :=data.qryLocationOtherTask.fieldbyname('cusname').asstring;
         data.qryLocationOtherAct.fieldbyname('cusid').asstring         :=data.qryLocationOtherTask.fieldbyname('cusid').asstring;
         data.qryLocationOtherAct.fieldByName('mainorder').AsString     :=data.qryLocationOtherTask.Fieldbyname('mainorder').AsString;
         data.qryLocationOtherAct.fieldbyname('shippercusname').asstring:=data.qryLocationOtherTask.fieldbyname('shippercusname').asstring;
         data.qryLocationOtherAct.fieldbyname('conscusname').asstring   :=data.qryLocationOtherTask.fieldbyname('conscusname').asstring;
         data.qryLocationOtherAct.fieldbyname('SKUName').asstring       :=data.qryLocationOtherTask.Fieldbyname('SKUName').asstring;
         data.qryLocationOtherAct.fieldbyname('SKUID').asstring         :=data.qryLocationOtherTask.fieldbyname('SKUID').asstring;
         data.qryLocationOtherAct.fieldbyname('LotCode').asstring       :=data.qryLocationOtherTask.Fieldbyname('LotCode').asstring;
         data.qryLocationOtherAct.fieldbyname('QualityName').asstring         :=data.qryLocationOtherTask.fieldbyname('QualityName').asstring;
         data.qryLocationOtherAct.fieldbyname('costquantity').asFloat         :=data.qryLocationOtherTask.Fieldbyname('costquantity').asFloat;
   //crl      data.qryLocationOtherAct.FieldByName('costquantitytask').AsFloat     :=data.qryLocationOtherTask.fieldbyname('costquantitytask').AsFloat;
         data.qryLocationOtherAct.fieldbyname('costquantityuom').asstring     :=data.qryLocationOtherTask.Fieldbyname('costquantityuom').asstring;
         data.qryLocationOtherAct.fieldbyname('Quantity').asFloat             :=data.qryLocationOtherTask.fieldbyname('Quantity').asFloat;
         data.qryLocationOtherAct.fieldbyname('QuantityUOM').asstring         :=data.qryLocationOtherTask.fieldbyname('QuantityUOM').asstring;
         data.qryLocationOtherAct.fieldbyname('Piece').asFloat                :=data.qryLocationOtherTask.fieldbyname('Piece').asFloat;
         data.qryLocationOtherAct.fieldbyname('PieceUOM').asstring            :=data.qryLocationOtherTask.fieldbyname('PieceUOM').asstring;
         data.qryLocationOtherAct.fieldbyname('Volume').asFloat               :=data.qryLocationOtherTask.fieldbyname('Volume').asFloat;
         data.qryLocationOtherAct.fieldbyname('VolumeUOM').asstring           :=data.qryLocationOtherTask.fieldbyname('VolumeUOM').asstring;
         data.qryLocationOtherAct.fieldbyname('Area').asFloat                 :=data.qryLocationOtherTask.Fieldbyname('Area').asFloat;
         data.qryLocationOtherAct.fieldbyname('AreaUOM').asstring             :=data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring;
         data.qryLocationOtherAct.fieldbyname('GrossWeight').asFloat          :=data.qryLocationOtherTask.Fieldbyname('GrossWeight').asFloat;
         data.qryLocationOtherAct.fieldbyname('NetWeight').asFloat            :=data.qryLocationOtherTask.fieldbyname('NetWeight').asFloat;
         data.qryLocationOtherAct.fieldbyname('WeightUOM').asstring  :=data.qryLocationOtherTask.Fieldbyname('WeightUOM').asstring;
         data.qryLocationOtherAct.fieldByName('casing1').AsFloat     :=data.qryLocationOtherTask.Fieldbyname('casing1').AsFloat;
         data.qryLocationOtherAct.fieldByName('casing2').AsFloat     :=data.qryLocationOtherTask.Fieldbyname('casing2').AsFloat;
         data.qryLocationOtherAct.fieldByName('casing3').AsFloat     :=data.qryLocationOtherTask.Fieldbyname('casing3').AsFloat;
         data.qryLocationOtherAct.fieldByName('casing4').AsFloat     :=data.qryLocationOtherTask.Fieldbyname('casing4').AsFloat;
         data.qryLocationOtherAct.fieldByName('casing5').AsFloat     :=data.qryLocationOtherTask.Fieldbyname('casing5').AsFloat;
         data.qryLocationOtherAct.fieldbyname('uom1').asstring       :=data.qryLocationOtherTask.Fieldbyname('uom1').asstring;
         data.qryLocationOtherAct.fieldbyname('uom2').asstring       :=data.qryLocationOtherTask.Fieldbyname('uom2').asstring;
         data.qryLocationOtherAct.fieldbyname('uom3').asstring       :=data.qryLocationOtherTask.Fieldbyname('uom3').asstring;
         data.qryLocationOtherAct.fieldbyname('uom4').asstring       :=data.qryLocationOtherTask.Fieldbyname('uom4').asstring;
         data.qryLocationOtherAct.fieldbyname('uom5').asstring       :=data.qryLocationOtherTask.Fieldbyname('uom5').asstring;
         data.qryLocationOtherAct.fieldByName('manufacturedate').AsDateTime  :=data.qryLocationOtherTask.Fieldbyname('manufacturedate').AsDateTime;
         data.qryLocationOtherAct.fieldByName('TagEachUOM').AsString         :=data.qryLocationOtherTask.Fieldbyname('TagEachUOM').AsString;
         data.qryLocationOtherAct.fieldByName('loadgroupcusname').AsString   :=data.qryLocationOtherTask.Fieldbyname('loadgroupcusname').AsString;
         data.qryLocationOtherAct.fieldByName('forkgroupcusname').AsString   :=data.qryLocationOtherTask.Fieldbyname('forkgroupcusname').AsString;
         data.qryLocationOtherAct.fieldByName('liftmachinecusname').AsString :=data.qryLocationOtherTask.Fieldbyname('liftmachinecusname').AsString;
         data.qryLocationOtherAct.fieldByName('costcusname').AsString        :=data.qryLocationOtherTask.Fieldbyname('costcusname').AsString;
         data.qryLocationOtherAct.fieldByName('locname').AsString            :=data.qryLocationOtherTask.Fieldbyname('locname').AsString;
         data.qryLocationOtherAct.fieldByName('customerno').AsString         :=data.qryLocationOtherTask.Fieldbyname('customerno').AsString;
         data.qryLocationOtherAct.fieldByName('skumodel').AsString           :=data.qryLocationOtherTask.Fieldbyname('skumodel').AsString;
         data.qryLocationOtherAct.fieldByName('skuspec').AsString            :=data.qryLocationOtherTask.Fieldbyname('skuspec').AsString;
         data.qryLocationOtherAct.fieldByName('color').AsString              :=data.qryLocationOtherTask.Fieldbyname('color').AsString;
         data.qryLocationOtherAct.fieldByName('tallycusname').AsString       :=data.qryLocationOtherTask.Fieldbyname('tallycusname').AsString;
         data.qryLocationOtherAct.FieldByName('tagtotal').AsInteger          :=data.qryLocationOtherTask.fieldbyname('tagtotal').AsInteger;
         data.qryLocationOtherAct.FieldByName('sequencenum').AsInteger       :=data.qryLocationOtherTask.fieldbyname('sequencenum').AsInteger;
         data.qryLocationOtherAct.fieldByName('taskdate').AsDateTime         :=data.qryLocationOtherTask.Fieldbyname('taskdate').AsDateTime;
         data.qryLocationOtherAct.fieldByName('remark').AsString             :=data.qryLocationOtherTask.Fieldbyname('remark').AsString;

         data.qryLocationOtherTask.next;
       end;
       data.qryLocationOtherAct.First;
       data.qryLocationOtherTask.First;
       data.qryLocationOtherTask.EnableControls;
   //wql_06.30    self.qryWareOtherItemTaskAfterScroll(data.qryLocationOtherTask);
   //wql_06.30    self.qryWareOtherItemAfterScroll(data.qryLocationOtherAct);
     end;
   end;
end;

procedure TfrmLocationOther.CountSKUQuantity(var pqrySKU:TQuery;OldValue:integer);
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
begin
  with pqrySKU do
  begin
    //件数
      if (OldValue<>0) then
      FieldByName('Piece').AsFloat:=(FieldByName('Quantity').AsFloat
                                           *FieldByName('Piece').AsFloat
                                           /oldValue);
    //体积
      if (OldValue<>0) then
      FieldByName('Volume').AsFloat:=FieldByName('Quantity').AsFloat
                                           *FieldByName('Volume').AsFloat
                                           /oldValue;
    //面积
      if (OldValue<>0) then
      FieldByName('Area').AsFloat:=FieldByName('Quantity').AsFloat
                                           *FieldByName('Area').AsFloat
                                           /oldValue;
    //净重
      if (OldValue<>0) then
      FieldByName('NetWeight').AsFloat:=FieldByName('Quantity').AsFloat
                                           *FieldByName('NetWeight').AsFloat
                                           /oldValue;
    //毛重
      if (OldValue<>0) then
      FieldByName('GrossWeight').AsFloat:=FieldByName('Quantity').AsFloat
                                           *FieldByName('GrossWeight').AsFloat
                                           /oldValue;
      if (OldValue<>0) then
      FieldByName('costquantity').AsFloat:=FieldByName('Quantity').AsFloat
                                           *FieldByName('costquantity').AsFloat
                                           /oldValue;
  end;
end;


procedure TfrmLocationOther.grdWareOtherCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;
  if trim(ANode.Values[OPERATIONNAME.Index])='' then
  begin
    AColor := clInfoBk;
  end else
  if trim(ANode.Values[CHECKNAME.Index])='' then
  begin
    AColor := clGradientActiveCaption;
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

procedure TfrmLocationOther.cmbCostCountUOMTypeEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
    TKinDbPickEdit(sender).ReadOnly:=False;
end;

procedure TfrmLocationOther.grdWareOtherChangeNodeEx(Sender: TObject);
begin
  if (data.qryLocationOtherEdit.ParamByName('Jobno').AsString<>data.qryLocationOther.FieldByName('Jobno').AsString)
    or (data.qryLocationOtherEdit.ParamByName('Jobno').AsString='') then
  begin
    data.qryLocationOtherEdit.ParamByName('Jobno').AsString:=data.qryLocationOther.FieldByName('Jobno').AsString;
    data.qryLocationOtherAct.ParamByName('Jobno').AsString:=data.qryLocationOther.FieldByName('Jobno').AsString;
    data.qryLocationOtherTask.ParamByName('Jobno').AsString:=data.qryLocationOther.FieldByName('Jobno').AsString;
    data.qryautocountcostOther.ParamByName('Jobno').AsString:=data.qryLocationOther.FieldByName('Jobno').AsString;

    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcMain.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemChangeNodeEx(Sender: TObject);
begin
  if grdWareOtherItem.Datalink.DataSet.State = dsInsert then
  begin
    grdWareOtherItemBeforeInsert;
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=True;
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemTaskEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=True;
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemTaskEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (data.qryLocationOtherTask.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddOriSKUClick(Sender);
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemTaskKeyDown(Sender: TObject; var Key: Word;
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
        if Name='grdWareOtherItemTask' then
          mitAddOriSKUclick(sender)
        else
          mitAddSKUClick(sender);
        key:=0;
      end;
    end;
  end;
end;

procedure TfrmLocationOther.mitAddOriSKUClick(Sender: TObject);
begin
  data.qryLocationOtherTask.Append;
  grdWareOtherItemTask.SetFocus;
  grdWareOtherItemTaskBeforeInsert;
end;

procedure TfrmLocationOther.mitDelOriSKUClick(Sender: TObject);
begin
  if data.qryLocationOtherTask.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    data.qryLocationOtherTask.Delete;
    grdWareOtherItemTask.SetFocus;
  end;
end;

procedure TfrmLocationOther.mitAddSKUClick(Sender: TObject);
begin
  data.qryLocationOtherAct.Append;
  grdWareOtherItem.SetFocus;
  grdWareOtherItemBeforeInsert;
end;

procedure TfrmLocationOther.mitDelSKUClick(Sender: TObject);
begin
  if data.qryLocationOtherAct.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    data.qryLocationOtherAct.Delete;
    grdWareOtherItem.SetFocus;
  end;
end;

procedure TfrmLocationOther.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
  i:integer;
  Quantity:extended;
begin
    if DataState in Setdcs then
    begin
      if data.qryLocationOtherEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=cmbCostcus;
        KMessageDlg(GetMessage('frmLocationOther','026'),mtWarning,[mbOK],0);//'费用关系人不能为空，必须填写！'
        Exit;
      end;

      qrySelect:=pGetSkuSelect('',data.qryLocationOtherTask.fieldbyname('shippercusid').asstring,'A');
      qrySelect.First;
      i:=0;
      while not qrySelect.Eof do
      begin
         if i=0 then
         begin
            Inc(i);
            data.qryLocationOtherTask.Edit;
            data.qryLocationOther.Edit;
            if qryselect.fieldbyname('SKUName_set').AsString<>'' then
            begin
               data.qryLocationOther.fieldbyname('SKUNAME').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
               data.qryLocationOther.fieldbyname('Quantitytasked').AsFloat  :=qryselect.fieldbyname('Quantity_set').AsFloat;
               data.qryLocationOther.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
               data.qryLocationOther.fieldbyname('Piecetasked').AsFloat     :=qryselect.fieldbyname('Quantity_set').AsFloat;
               data.qryLocationOther.fieldbyname('PieceUOM').asstring       :=qryselect.fieldbyname('PieceUOM').asstring;
            end;
            data.qryLocationOther.FieldByName('skucostclasscd').AsString :=qryselect.fieldbyname('skucostclasscd').asstring;
         end else
         begin
           try
              data.qryLocationOtherTask.Post;
           except
              break;
           end;
           data.qryLocationOtherTask.append;
           grdWareOtherItemTaskBeforeInsert;
         end;
        data.qryLocationOtherTask.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
        data.qryLocationOtherTask.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
        strGetCd := qryselect.fieldbyname('SKUName').asstring;
        if qryselect.Fieldbyname('LotCode').asstring<>'' then
          data.qryLocationOtherTask.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
        Quantity:=qryselect.fieldbyname('Quantity').AsFloat;
        if Quantity=0 then Quantity:=1;
        if Quantity<>0 then
        begin
           data.qryLocationOtherTask.fieldbyname('Quantity').AsFloat    :=Quantity;
           if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
             data.qryLocationOtherTask.fieldbyname('Piece').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
           data.qryLocationOtherTask.fieldbyname('NetWeight').asFloat   :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationOtherTask.Fieldbyname('GrossWeight').asFloat :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationOtherTask.fieldbyname('Volume').asFloat      :=Quantity*qryselect.fieldbyname('VolumePro').AsFloat;
           data.qryLocationOtherTask.Fieldbyname('Area').asFloat        :=Quantity*qryselect.fieldbyname('AreaPro').AsFloat;

           if qryselect.Fieldbyname('Pro1').asFloat<>0 then
             data.qryLocationOtherTask.Fieldbyname('Casing1').asFloat:=Quantity/qryselect.Fieldbyname('Pro1').asFloat;
           if qryselect.Fieldbyname('Pro2').asFloat<>0 then
             data.qryLocationOtherTask.Fieldbyname('Casing2').asFloat:=Quantity/qryselect.Fieldbyname('Pro2').asFloat;
           if qryselect.Fieldbyname('Pro3').asFloat<>0 then
             data.qryLocationOtherTask.Fieldbyname('Casing3').asFloat:=Quantity/qryselect.Fieldbyname('Pro3').asFloat;
           if qryselect.Fieldbyname('Pro4').asFloat<>0 then
             data.qryLocationOtherTask.Fieldbyname('Casing4').asFloat:=Quantity/qryselect.Fieldbyname('Pro4').asFloat;
           if qryselect.Fieldbyname('Pro5').asFloat<>0 then
             data.qryLocationOtherTask.Fieldbyname('Casing5').asFloat:=Quantity/qryselect.Fieldbyname('Pro5').asFloat;
        end;
        if qryselect.fieldbyname('QualityName').asstring<>'' then
           data.qryLocationOtherTask.fieldbyname('QualityName').asstring:=qryselect.fieldbyname('QualityName').asstring
        else
          data.qryLocationOtherTask.Fieldbyname('QualityName').asstring :='正品';

        data.qryLocationOtherTask.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
        data.qryLocationOtherTask.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
        data.qryLocationOtherTask.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
        data.qryLocationOtherTask.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
        data.qryLocationOtherTask.Fieldbyname('AreaUOM').asstring     :=qryselect.Fieldbyname('AreaUOM').asstring          ;
        if data.qryLocationOtherTask.fieldByname('shipcusid').AsString='' then
        data.qryLocationOtherTask.fieldByname('shipcusid').AsString:=data.qryLocationOtherEdit.fieldbyname('shippercusid').AsString;
        if data.qryLocationOtherTask.fieldByname('shipcusname').AsString='' then
        data.qryLocationOtherTask.fieldByname('shipcusname').AsString:=data.qryLocationOtherEdit.fieldbyname('shippercusname').AsString;
        data.qryLocationOtherTask.Fieldbyname('PiecePro').AsFloat :=qryselect.Fieldbyname('PiecePro').AsFloat;
        data.qryLocationOtherTask.Fieldbyname('VolumePro').asFloat:=qryselect.Fieldbyname('VolumePro').asFloat;
        data.qryLocationOtherTask.Fieldbyname('AreaPro').asFloat  :=qryselect.Fieldbyname('AreaPro').asFloat;
        data.qryLocationOtherTask.Fieldbyname('netWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
           data.qryLocationOtherTask.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
        else
           data.qryLocationOtherTask.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        data.qryLocationOtherTask.fieldbyname('TagEachUOM').Asstring     :=qryselect.fieldbyname('TagEachUOM').Asstring;
//        data.qryLocationOtherTask.fieldbyname('tageachuompro').AsFloat   :=qryselect.fieldbyname('tageachuompro').AsFloat;
        data.qryLocationOtherTask.Fieldbyname('UOM1').asstring        :=qryselect.Fieldbyname('UOM1').asstring;
        data.qryLocationOtherTask.Fieldbyname('UOM2').asstring        :=qryselect.Fieldbyname('UOM2').asstring;
        data.qryLocationOtherTask.Fieldbyname('UOM3').asstring        :=qryselect.Fieldbyname('UOM3').asstring;
        data.qryLocationOtherTask.Fieldbyname('UOM4').asstring        :=qryselect.Fieldbyname('UOM4').asstring;
        data.qryLocationOtherTask.Fieldbyname('UOM5').asstring        :=qryselect.Fieldbyname('UOM5').asstring;
        data.qryLocationOtherTask.Fieldbyname('Pro1').asFloat   :=qryselect.Fieldbyname('Pro1').asFloat;
        data.qryLocationOtherTask.Fieldbyname('Pro2').asFloat   :=qryselect.Fieldbyname('Pro2').asFloat;
        data.qryLocationOtherTask.Fieldbyname('Pro3').asFloat   :=qryselect.Fieldbyname('Pro3').asFloat;
        data.qryLocationOtherTask.Fieldbyname('Pro4').asFloat   :=qryselect.Fieldbyname('Pro4').asFloat;
        data.qryLocationOtherTask.Fieldbyname('Pro5').asFloat   :=qryselect.Fieldbyname('Pro5').asFloat;
        data.qryLocationOtherTask.Fieldbyname('color').asstring     :=qryselect.Fieldbyname('color').asstring; //crl
        data.qryLocationOtherTask.FieldByName('skuspec').AsString   :=qrySelect.Fieldbyname('skuspec').AsString; //crl
        data.qryLocationOtherTask.FieldByName('skumodel').AsString  :=qrySelect.Fieldbyname('skumodel').AsString; //crl
        data.qryLocationOtherTask.FieldByName('customerno').AsString:=qrySelect.Fieldbyname('customerno').AsString; //crl
        
        OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,currcd,price,pricein '
                              +'  from skuprice '
                              +' where convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryLocationOther.fieldbyname('taskdate').asdatetime)+'"'
                              +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                              +'   and uomtype="'+data.qryLocationOtherTask.fieldbyname('CostUOMType').AsString+'"'
                              +'   and userid like "'+_userid+'%"'
               );
//wql.05.07.12        data.qryLocationOtherTask.FieldByName('carriage').AsFloat :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
//wql.05.07.12        data.qryLocationOtherTask.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
//crl        data.qryLocationOtherTask.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
//crl        data.qryLocationOtherTask.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp.Fieldbyname('pricein').asFloat;
//crl        data.qryLocationOtherTask.Fieldbyname('price').asFloat    :=dataTmp.qryTmp.Fieldbyname('price').asFloat;

        qryselect.Next;
     end;
   end;
end;

procedure TfrmLocationOther.grdWareOtherItemBeforeInsert;
begin
  grdWareOtherItem.FocusedColumn:=0;
  data.qryLocationOtherAct.Fieldbyname('SNO').AsFloat  :=-1;
  data.qryLocationOtherAct.fieldByname('JOBNO').AsString:=data.qryLocationOtherEdit.fieldbyname('JOBNO').AsString;
  data.qryLocationOtherAct.fieldByname('UserID').AsString:=_UserID;
  data.qryLocationOtherAct.fieldByname('username').AsString:=_Username;
  data.qryLocationOtherAct.fieldByname('SKUID').AsString:='';
  data.qryLocationOtherAct.fieldByname('qualityname').AsString:='正品';
  data.qryLocationOtherAct.fieldByname('LOTCODE').AsString:='';
  data.qryLocationOtherAct.FieldByName('warerentcounttype').AsString:=' '; //默认空字符
  data.qryLocationOtherAct.FieldByName('iuserid').AsString:=data.qryLocationOtherEdit.fieldbyname('iuserid').AsString;
  data.qryLocationOtherAct.FieldByName('mainorder').AsString:=data.qryLocationOtherEdit.fieldbyname('mainorder').AsString;

end;

procedure TfrmLocationOther.grdWareOtherItemTaskBeforeInsert;
begin
  grdWareOtherItemTask.FocusedColumn:=0;
  data.qryLocationOtherTask.Fieldbyname('SNO').AsFloat  :=-1;
  data.qryLocationOtherTask.fieldByname('jobno').AsString:=data.qryLocationOtherEdit.fieldbyname('jobno').AsString;
  data.qryLocationOtherTask.fieldByname('Userid').AsString:=data.qryLocationOtherEdit.fieldbyname('Userid').AsString;
  data.qryLocationOtherTask.fieldByname('Username').AsString:=data.qryLocationOtherEdit.fieldbyname('Username').AsString;
  data.qryLocationOtherTask.fieldByname('QualityName').AsString:='正品';
//  data.qryLocationOtherTask.fieldByname('LoadType').AsString:='F';
  data.qryLocationOtherTask.fieldByname('cusid').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusid').AsString;
  data.qryLocationOtherTask.fieldByname('cusname').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusname').AsString;
  data.qryLocationOtherTask.fieldByname('Shipcusid').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusid').AsString;
  data.qryLocationOtherTask.fieldByname('ShipcusName').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusname').AsString;
  if getSysdata('cusname')='SWZ' then
  begin
     data.qryLocationOtherTask.fieldByname('Shipcusid').AsString:='';
     data.qryLocationOtherTask.fieldByname('ShipcusName').AsString:='';
  end;
  //lzw20091228
  data.qryLocationOtherTask.fieldByname('Shippercusid').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusid').AsString;
  data.qryLocationOtherTask.fieldByname('ShippercusName').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusname').AsString;

  data.qryLocationOtherTask.FieldByName('warerentcounttype').AsString:=' '; //默认空字符
  data.qryLocationOtherTask.FieldByName('mainorder').AsString:=data.qryLocationOtherEdit.fieldbyname('mainorder').AsString;
  data.qryLocationOtherTask.FieldByName('costcusname').AsString:=data.qryLocationOtherEdit.fieldbyname('costcusname').AsString;
  data.qryLocationOtherTask.FieldByName('mainorder').AsString:=data.qryLocationOtherEdit.fieldbyname('MainOrder').AsString;
end;

procedure TfrmLocationOther.grdWareOtherItemTaskChangeNodeEx(
  Sender: TObject);
begin
  if grdWareOtherItemTask.Datalink.DataSet.State = dsInsert then
  begin
    grdWareOtherItemTaskBeforeInsert;
  end;
end;

procedure TfrmLocationOther.edtAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationothertask.Edit;
         data.qryLocationothertask.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationothertask.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtShipperAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationothertask.Edit;
         data.qryLocationothertask.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationothertask.FieldByName('shippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSKUAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSKUShipperAccountIDButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('shippercusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSKUSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
  i:integer;
  Quantity:extended;
begin
    if DataState in Setdcs then
    begin
      if data.qryLocationOtherEdit.fieldbyname('costcusid').asstring='' then
      begin
        ActiveControl:=cmbCostcus;
        KMessageDlg(GetMessage('frmLocationOther','026'),mtWarning,[mbOK],0);//'费用关系人不能为空，必须填写！'
        Exit;
      end;

      qrySelect:=pGetSkuSelect('',data.qryLocationOtherAct.fieldbyname('shippercusid').asstring,'A');
      qrySelect.First;
      i:=0;
      while not qrySelect.Eof do
      begin
         if i=0 then
         begin
            Inc(i);
            data.qryLocationOtherAct.Edit;
            data.qryLocationOther.Edit;
            if qryselect.fieldbyname('SKUName_set').AsString<>'' then
            begin
               data.qryLocationOther.fieldbyname('SKUNAME').asstring        :=qryselect.fieldbyname('SKUName_set').asstring;
               data.qryLocationOther.fieldbyname('Quantityt').AsFloat  :=qryselect.fieldbyname('Quantity_set').AsFloat;
               data.qryLocationOther.fieldbyname('QuantityUOM').asstring    :=qryselect.fieldbyname('QuantityUOM_set').asstring;
               data.qryLocationOther.fieldbyname('Piece').AsFloat     :=qryselect.fieldbyname('Quantity_set').AsFloat;
               data.qryLocationOther.fieldbyname('PieceUOM').asstring       :=qryselect.fieldbyname('PieceUOM').asstring;
            end;
            data.qryLocationOther.FieldByName('skucostclasscd').AsString :=qryselect.fieldbyname('skucostclasscd').asstring;
         end else
         begin
           try
              data.qryLocationOtherAct.Post;
           except
              break;
           end;
           data.qryLocationOtherAct.append;
           grdWareOtherItemBeforeInsert;
         end;
        data.qryLocationOtherAct.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
        data.qryLocationOtherAct.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
        strGetCd := qryselect.fieldbyname('SKUName').asstring;
        if qryselect.Fieldbyname('LotCode').asstring<>'' then
          data.qryLocationOtherAct.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
        Quantity:=qryselect.fieldbyname('Quantity').AsFloat;
        if Quantity=0 then Quantity:=1;
        if Quantity<>0 then
        begin
           data.qryLocationOtherAct.fieldbyname('Quantity').AsFloat    :=Quantity;
           if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
             data.qryLocationOtherAct.fieldbyname('Piece').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
           data.qryLocationOtherAct.fieldbyname('NetWeight').asFloat   :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationOtherAct.Fieldbyname('GrossWeight').asFloat :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
           data.qryLocationOtherAct.fieldbyname('Volume').asFloat      :=Quantity*qryselect.fieldbyname('VolumePro').AsFloat;
           data.qryLocationOtherAct.Fieldbyname('Area').asFloat        :=Quantity*qryselect.fieldbyname('AreaPro').AsFloat;

           if qryselect.Fieldbyname('Pro1').asFloat<>0 then
             data.qryLocationOtherAct.Fieldbyname('Casing1').asFloat:=Quantity/qryselect.Fieldbyname('Pro1').asFloat;
           if qryselect.Fieldbyname('Pro2').asFloat<>0 then
             data.qryLocationOtherAct.Fieldbyname('Casing2').asFloat:=Quantity/qryselect.Fieldbyname('Pro2').asFloat;
           if qryselect.Fieldbyname('Pro3').asFloat<>0 then
             data.qryLocationOtherAct.Fieldbyname('Casing3').asFloat:=Quantity/qryselect.Fieldbyname('Pro3').asFloat;
           if qryselect.Fieldbyname('Pro4').asFloat<>0 then
             data.qryLocationOtherAct.Fieldbyname('Casing4').asFloat:=Quantity/qryselect.Fieldbyname('Pro4').asFloat;
           if qryselect.Fieldbyname('Pro5').asFloat<>0 then
             data.qryLocationOtherAct.Fieldbyname('Casing5').asFloat:=Quantity/qryselect.Fieldbyname('Pro5').asFloat;
        end;
        if qryselect.fieldbyname('QualityName').asstring<>'' then
           data.qryLocationOtherAct.fieldbyname('QualityName').asstring:=qryselect.fieldbyname('QualityName').asstring
        else
          data.qryLocationOtherAct.Fieldbyname('QualityName').asstring :='正品';

        data.qryLocationOtherAct.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
        data.qryLocationOtherAct.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
        data.qryLocationOtherAct.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
        data.qryLocationOtherAct.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
        data.qryLocationOtherAct.Fieldbyname('AreaUOM').asstring     :=qryselect.Fieldbyname('AreaUOM').asstring          ;
        if data.qryLocationOtherAct.fieldByname('shipcusid').AsString='' then
        data.qryLocationOtherAct.fieldByname('shipcusid').AsString:=data.qryLocationOtherEdit.fieldbyname('shippercusid').AsString;
        if data.qryLocationOtherAct.fieldByname('shipcusname').AsString='' then 
        data.qryLocationOtherAct.fieldByname('shipcusname').AsString:=data.qryLocationOtherEdit.fieldbyname('shippercusname').AsString;
        data.qryLocationOtherAct.Fieldbyname('PiecePro').AsFloat :=qryselect.Fieldbyname('PiecePro').AsFloat;
        data.qryLocationOtherAct.Fieldbyname('VolumePro').asFloat:=qryselect.Fieldbyname('VolumePro').asFloat;
        data.qryLocationOtherAct.Fieldbyname('AreaPro').asFloat  :=qryselect.Fieldbyname('AreaPro').asFloat;
        data.qryLocationOtherAct.Fieldbyname('netWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        if qryselect.Fieldbyname('grossWeightPro').asFloat<>0 then
           data.qryLocationOtherAct.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('grossWeightPro').asFloat
        else
           data.qryLocationOtherAct.Fieldbyname('GrossWeightPro').asFloat:=qryselect.Fieldbyname('WeightPro').asFloat;
        data.qryLocationOtherAct.fieldbyname('TagEachUOM').Asstring     :=qryselect.fieldbyname('TagEachUOM').Asstring;
//crl        data.qryLocationOtherAct.fieldbyname('tageachuompro').AsFloat   :=qryselect.fieldbyname('tageachuompro').AsFloat;
        data.qryLocationOtherAct.Fieldbyname('UOM1').asstring        :=qryselect.Fieldbyname('UOM1').asstring;
        data.qryLocationOtherAct.Fieldbyname('UOM2').asstring        :=qryselect.Fieldbyname('UOM2').asstring;
        data.qryLocationOtherAct.Fieldbyname('UOM3').asstring        :=qryselect.Fieldbyname('UOM3').asstring;
        data.qryLocationOtherAct.Fieldbyname('UOM4').asstring        :=qryselect.Fieldbyname('UOM4').asstring;
        data.qryLocationOtherAct.Fieldbyname('UOM5').asstring        :=qryselect.Fieldbyname('UOM5').asstring;
        data.qryLocationOtherAct.Fieldbyname('Pro1').asFloat   :=qryselect.Fieldbyname('Pro1').asFloat;
        data.qryLocationOtherAct.Fieldbyname('Pro2').asFloat   :=qryselect.Fieldbyname('Pro2').asFloat;
        data.qryLocationOtherAct.Fieldbyname('Pro3').asFloat   :=qryselect.Fieldbyname('Pro3').asFloat;
        data.qryLocationOtherAct.Fieldbyname('Pro4').asFloat   :=qryselect.Fieldbyname('Pro4').asFloat;
        data.qryLocationOtherAct.Fieldbyname('Pro5').asFloat   :=qryselect.Fieldbyname('Pro5').asFloat;
        OpenSql(dataTmp.qryTmp,'select top 1 carriage,insurance,currcd,price,pricein '
                              +'  from skuprice '
                              +' where convert(varchar(10),effivedate,102)<="'+DateToStr(data.qryLocationOther.fieldbyname('taskdate').asdatetime)+'"'
                              +'   and skuid="'+qrySelect.fieldbyname('skuid').AsString+'"'
                              +'   and uomtype="'+data.qryLocationOtherAct.fieldbyname('CostUOMType').AsString+'"'
                              +'   and userid like "'+_userid+'%"'
               );
//wql.05.07.12        data.qryLocationOtherAct.FieldByName('carriage').AsFloat :=dataTmp.qryTmp.fieldbyname('carriage').AsFloat;
//wql.05.07.12        data.qryLocationOtherAct.FieldByName('insurance').AsFloat:=dataTmp.qryTmp.fieldbyname('insurance').AsFloat;
//crl        data.qryLocationOtherAct.Fieldbyname('Currcd').asstring  :=dataTmp.qryTmp.Fieldbyname('Currcd').asstring;
//crl        data.qryLocationOtherAct.Fieldbyname('pricein').asFloat  :=dataTmp.qryTmp.Fieldbyname('pricein').asFloat;
//crl        data.qryLocationOtherAct.Fieldbyname('price').asFloat    :=dataTmp.qryTmp.Fieldbyname('price').asFloat;

        qryselect.Next;
     end;
   end;
end;

procedure TfrmLocationOther.edtSKUQUANTITYValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  with  grdWareOtherItem.InplaceEditor do
  begin
    data.qryLocationOtherAct.Edit;
    if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryLocationOtherAct.FieldByName('SKUID').AsString<>''))  then
       begin
         //件数
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('Piece').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat);
         //体积
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('Volume').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat;
         //面积
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('Area').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat;
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('NetWeight').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat;
         //毛重量
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('GrossWeight').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat;
         //计费量
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherAct.FieldByName('costquantity').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherAct.FieldByName('costquantity').AsFloat
                                                     /data.qryLocationOtherAct.FieldByName('Quantity').AsFloat;
       end;
    data.qryLocationOtherAct.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
  end;
end;

procedure TfrmLocationOther.edtFC_PORTLCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('portl').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtFC_TRANSCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('TRANS').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtFC_PORTDCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('','F');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('portd').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryLocationOtherEdit.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         data.qryLocationOtherEdit.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.cmbConsignAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     if AbsoluteIndex=0 then
     begin
        qryselect:=pGetcustomerselect('F','');
        if qrySelect.FieldByName('cusid').asstring<>'NO' then
        begin
           data.qryLocationOtherEdit.edit;
           data.qryLocationOtherEdit.FieldByName('shippercusid').AsString:=qrySelect.FieldByName('cusid').asstring;
           data.qryLocationOtherEdit.FieldByName('shippercusname').AsString:=qrySelect.FieldByName('cusname').asstring;
           blnselect:=True;
           ReturnNext(Self);
        end;
        FreeAndNil(qrySelect);
     end;
  end;
end;

procedure TfrmLocationOther.cmbCarrierCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     if AbsoluteIndex=0 then
     begin
        qryselect:=pGetcustomerselect('D','');
        if qrySelect.FieldByName('cusid').asstring<>'NO' then
        begin
           data.qryLocationOtherEdit.edit;
           data.qryLocationOtherEdit.FieldByName('carriercusid').AsString:=qrySelect.FieldByName('cusid').asstring;
           data.qryLocationOtherEdit.FieldByName('carriercusname').AsString:=qrySelect.FieldByName('cusname').asstring;
           blnselect:=True;
           ReturnNext(Self);
        end;
        FreeAndNil(qrySelect);
     end;
  end;
end;

procedure TfrmLocationOther.grdWareOtherItemTaskExit(Sender: TObject);
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

procedure TfrmLocationOther.CostcusExit(Sender: TObject);
begin
   blnselect:=false;
   if (DataState in Setdcs) and (strOldCostCus<>cmbCostcus.Text) then
   begin
      GetCusCnfg;
   end;
end;

procedure TfrmLocationOther.CostcusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
  qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbCostcus.Text='' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('costcusid').AsString:='';
         data.qryLocationOtherEdit.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',cmbCostcus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationOtherEdit.Edit;
            data.qryLocationOtherEdit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOtherEdit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
      if cmbCostcus.Text<>'' then
         InitdbPick(cmbCususername,'cususer','cususername','cususername','cusid="'+cmbCostcus.TextField+'"');
   end;
end;

procedure TfrmLocationOther.edtWO_UseridExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmLocationOther.edtWO_UseridExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
  qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtWO_Userid.Text='' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('iuserid').asstring:='';
         data.qryLocationOtherEdit.FieldByName('iusername').asstring:='';
      end else
      if not blnselect then
      begin
         qrySelect:=pGetOrganizationSelect('','','');
         if qrySelect.fieldbyname('userid').asstring<>'NO' then
         begin
            data.qryLocationOtherEdit.Edit;
            data.qryLocationOtherEdit.FieldByName('iuserid').asstring:=qrySelect.fieldbyname('userid').asstring;
            data.qryLocationOtherEdit.FieldByName('iusername').asstring:=qrySelect.fieldbyname('username').asstring;
         end else failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.cmbConsignAccountIDExit(Sender: TObject);
begin
  blnselect:=false;
end;

procedure TfrmLocationOther.cmbConsignAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
  qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbConsignAccountID.Text='' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('shippercusid').AsString:='';
         data.qryLocationOtherEdit.FieldByName('shippercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('F',cmbConsignAccountID.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationOtherEdit.Edit;
            data.qryLocationOtherEdit.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOtherEdit.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.cmbCarrierCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
  qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbCarrierCus.Text='' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('carriercusid').AsString:='';
         data.qryLocationOtherEdit.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('D',cmbCarrierCus.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryLocationOtherEdit.Edit;
            data.qryLocationOtherEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOtherEdit.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.cmbCarrierCusExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmLocationOther.edtOPIDExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmLocationOther.edtOPIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOPID.Text='' then
      begin
         data.qryLocationOtherEdit.Edit;
         data.qryLocationOtherEdit.FieldByName('opid').AsString:='';
         data.qryLocationOtherEdit.FieldByName('opname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(edtOPID.TextField);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            data.qryLocationOtherEdit.edit;
            data.qryLocationOtherEdit.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
            data.qryLocationOtherEdit.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.edtFC_PORTLCDExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmLocationOther.edtFC_PORTLCDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtFC_PORTLCD.Text='' then
      begin
         data.qryLocationOtherEdit.edit;
         data.qryLocationOtherEdit.FieldByName('portl').AsString  :='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetPortSelect('','F');
         if qrySelect.FieldByName('Portcd').AsString<>'NO' then
         begin
            data.qryLocationOtherEdit.edit;
            data.qryLocationOtherEdit.FieldByName('portl').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.edtFC_TRANSCDExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmLocationOther.edtFC_TRANSCDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtFC_PORTLCD.Text='' then
      begin
         data.qryLocationOtherEdit.edit;
         data.qryLocationOtherEdit.FieldByName('TRANS').AsString  :='';
      end else
      if not blnSelect then
      begin
          qrySelect:=pGetPortSelect('','F');
          if qrySelect.FieldByName('Portcd').AsString<>'NO' then
          begin
             data.qryLocationOtherEdit.edit;
             data.qryLocationOtherEdit.FieldByName('TRANS').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
          end else failed:=true;
          FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.edtFC_PORTDCDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtFC_PORTLCD.Text='' then
      begin
         data.qryLocationOtherEdit.edit;
         data.qryLocationOtherEdit.FieldByName('portd').AsString  :='';
      end else
      if not blnSelect then
      begin
          qrySelect:=pGetPortSelect('','F');
          if qrySelect.FieldByName('Portcd').AsString<>'NO' then
          begin
             data.qryLocationOtherEdit.edit;
             data.qryLocationOtherEdit.FieldByName('portd').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portnamechn','portnameeng')).asstring;
          end else failed:=true;
          FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.edtFC_PORTDCDExit(Sender: TObject);
begin
   blnselect:=false;
end;

procedure TfrmLocationOther.edtShipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationothertask.Edit;
         data.qryLocationothertask.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationothertask.FieldByName('shipcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSkuShipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('shipcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtAccount_LoadGroupNameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('loadgroupcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtAccount_ForkGroupNameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtAccount_LiftMachineNameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.mitCheckClick(Sender: TObject);
var
   I:Integer; //循环控制量
   J:Integer; //记录要审核的总笔数
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   j:=grdWareOther.SelectedCount;
   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;
   for I:=grdWareOther.SelectedCount-1 downto 0 do
   begin
      data.qryLocationOther.GotoBookmark(Pointer(grdWareOther.SelectedRows[I]));
      if data.qryLocationOther.FieldByName('checkname').AsString='' then
         ExecSql(dataTmp.qryTmp,' update locationother '+
                                '    set checkname="'+_Loginname+'",'+
                                '        checkdate="'+DateToStr(now)+'"'+
                                '  where jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'"');
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshClick(btnRefresh);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationOther.btnCheckClick(Sender: TObject);
begin
   btnCheck.PopUp;
end;

procedure TfrmLocationOther.mitCheckCancelClick(Sender: TObject);
var
   I:Integer; //循环控制量
   J:Integer; //记录要审核的总笔数
   intFault:Integer;
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   j:=grdWareOther.SelectedCount;
   intFault:=0;
   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;
   for I:=grdWareOther.SelectedCount-1 downto 0 do
   begin
      data.qryWareOrder.GotoBookmark(Pointer(grdWareOther.SelectedRows[i]));
      if (data.qryLocationOther.FieldByName('costcheckname').AsString<>'') then
      begin
              Inc(intFault);
      end else
      if data.qryWareOrder.FieldByName('checkname').AsString<>'' then
      begin
         ExecSql(dataTmp.qryTmp,' update locationother '+
                            '    set checkname="",'+
                            '        checkdate=null'+
                            '  where jobno="'+data.qryWareOrder.FieldByName('jobno').AsString+'"');
      end;
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False; //为了控制进度条
   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshClick(btnRefresh);
   if intfault>0 then
      Kmessagedlg(_strsucceed+','+inttostr(intfault)+'/'+inttostr(j)+GetMessage('frmLocationOther','027'),mtInformation,[mbOk],0)//iif(_language='CAPTIONC',' 其中'+inttostr(intfault)+'笔已生成任务，无法取消审核！','')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmLocationOther.edtQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdWareOtherItemTask.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:=GetMessage('frmWareOrderDxALL','031');//'数量不能小于零!';
         Accept:=False;
         exit;
      end;
      if data.qryLocationOtherTask.FieldByName('costuomtype').AsString='quantity' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('skucost').AsFloat:=StrToFloat(grdWareOtherItemTask.InplaceEditor.GetEditingText)
                                                            *data.qryLocationOtherTask.FieldByName('price').AsFloat;
         data.qryLocationOtherTask.FieldByName('SkuCostin').AsFloat:= StrToFloat(grdWareOtherItemTask.InplaceEditor.GetEditingText)*
                                                                         data.qryLocationOtherTask.FieldByName('pricein').AsFloat;
         data.qryLocationOtherTask.FieldByName('carriagetotal').AsFloat:= StrToFloat(grdWareOtherItemTask.InplaceEditor.GetEditingText)*
                                                                         data.qryLocationOtherTask.FieldByName('carriage').AsFloat;
         data.qryLocationOtherTask.FieldByName('insurancetotal').AsFloat:= StrToFloat(grdWareOtherItemTask.InplaceEditor.GetEditingText)*
                                                                         data.qryLocationOtherTask.FieldByName('insurance').AsFloat;
      end;
     with  grdWareOtherItemTask.InplaceEditor do
     begin
       data.qryLocationOtherTask.Edit;
   //    data.qryWareOrderOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryLocationOtherTask.FieldByName('SKUID').AsString<>''))  then
          begin
          //件数
          if (strtofloat(GetEditingText)<>0) then
             data.qryLocationOtherTask.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                     *data.qryLocationOtherTask.FieldByName('Piece').AsFloat
                                                     /data.qryLocationOtherTask.FieldByName('Quantity').AsFloat);
         //体积
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherTask.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherTask.FieldByName('Volume').AsFloat
                                                     /data.qryLocationOtherTask.FieldByName('Quantity').AsFloat;
         //面积
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherTask.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherTask.FieldByName('Area').AsFloat
                                                     /data.qryLocationOtherTask.FieldByName('Quantity').AsFloat;
         //净重量
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherTask.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherTask.FieldByName('NetWeight').AsFloat
                                                     /data.qryLocationOtherTask.FieldByName('Quantity').AsFloat;
         //毛重量
         if (strtofloat(GetEditingText)<>0) then
            data.qryLocationOtherTask.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                     *data.qryLocationOtherTask.FieldByName('GrossWeight').AsFloat
                                                     /data.qryLocationOtherTask.FieldByName('Quantity').AsFloat;
//crl 2006 09 07
{            //件数
               data.qryLocationOtherTask.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                        /data.qryLocationOtherTask.FieldByName('piecepro').AsFloat);
            //体积
               data.qryLocationOtherTask.FieldByName('Volume').AsFloat:=(data.qryLocationOtherTask.FieldByName('Piece').AsFloat
                                                            *data.qryLocationOtherTask.FieldByName('VolumePro').AsFloat);
            //面积
               data.qryLocationOtherTask.FieldByName('Area').AsFloat:=(data.qryLocationOtherTask.FieldByName('Piece').AsFloat
                                                          *data.qryLocationOtherTask.FieldByName('AreaPro').AsFloat);
            //净重量
               data.qryLocationOtherTask.FieldByName('NetWeight').AsFloat:=(data.qryLocationOtherTask.FieldByName('Piece').AsFloat
                                                                   *data.qryLocationOtherTask.FieldByName('NetWeightPro').AsFloat);
            //毛重量
               data.qryLocationOtherTask.FieldByName('GrossWeight').AsFloat:=(data.qryLocationOtherTask.FieldByName('Piece').AsFloat
                                                                   *data.qryLocationOtherTask.FieldByName('GrossWeightPro').AsFloat);
 }
          end;
        data.qryLocationOtherTask.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
     end;
         Accept:=True;
   end;
end;

procedure TfrmLocationOther.grdAutoCostEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      with grdAutoCost do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COUNTWAY') then
         begin
            if data.qryautocountcostOther.FieldByName('ismainrate').asstring='T' then
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

procedure TfrmLocationOther.grdAutoCostEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryautocountcostOther.IsEmpty=True) then
   begin
      mitCostAddClick(Sender);
   end;
end;

procedure TfrmLocationOther.grdAutoCostExit(Sender: TObject);
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

procedure TfrmLocationOther.grdAutoCostKeyDown(Sender: TObject;
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
                 mitCostdelClick(sender);
               key:=0;
            end;
         end;
      end;
   end;
end;

procedure TfrmLocationOther.mitCostAddClick(Sender: TObject);
begin
   grdAutoCost.setfocus;
   m_blnPost:=True;//add by crl 2006 09 06
   data.qryautocountcostOther.append;
   grdAutoCostBeforeInsert;
end;

procedure TfrmLocationOther.mitCostdelClick(Sender: TObject);
begin
   if data.qryautocountcostOther.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdAutoCost.SetFocus;
      data.qryautocountcostOther.Delete;
   end;
end;

procedure TfrmLocationOther.mitAddAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','067'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能用该模式新增计费条目！'
     exit;
   end;}
   pGetAutoCost(data.qryLocationOther.FieldByName('jobno').AsString,'0','仓储');
   data.qryautocountcostOther.Close;
   data.qryautocountcostOther.Open;
end;

procedure TfrmLocationOther.mitUpdAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','065'), mtInformation,[mbOk],0);//'该资料不是您输入的，不能修改！'
     exit;
   end;}
   pGetAutoCost(data.qryautocountcostOther.FieldByName('jobno').AsString,data.qryautocountcostOther.FieldByName('sno').AsString,'仓储');
   data.qryautocountcostOther.Close;
   data.qryautocountcostOther.Open;
end;

procedure TfrmLocationOther.mitDelAutoCostClick(Sender: TObject);
begin
{   if data.qryIn.FieldByName('createname').AsString<>_Loginname then
   begin
     Kmessagedlg(GetMessage('frmLocationIN','066'), mtInformation,[mbOk],0); //'该资料不是您输入的，不能删除！'
     exit;
   end;}
   if KmessageDlg(_strdel, mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
      ExecSql(dataTmp.qryTmp,' delete from autocountcost  '+
                             ' where Jobno="'+data.qryautocountcostOther.FieldByName('Jobno').AsString+'"  '+
                             '   and sno="'+data.qryautocountcostOther.FieldByName('Sno').AsString+'" ');
      data.qryautocountcostOther.close;
      data.qryautocountcostOther.Open;
   end;
end;

procedure TfrmLocationOther.grdAutoCostBeforeInsert;
begin
   data.qryautocountcostOther.FieldByName('sno').AsInteger:=-1;
   data.qryautocountcostOther.FieldByName('jobno').asstring:=data.qryLocationOther.fieldbyname('jobno').asstring;
   data.qryautocountcostOther.fieldByname('rateuomtype').AsString  :='piece';
   data.qryautocountcostOther.fieldByname('countway').asString:='散装';
end;

procedure TfrmLocationOther.grdCountwayValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  // Added by wql 2005-12-6 20:26:34
  if DataState in Setdcs then
  begin
    if grdAutoCost.InplaceEditor.GetEditingText='轻重货' then
    begin
       data.qryautocountcostOther.Edit;
       data.qryautocountcostOther.FieldByName('skuwtve').AsFloat:=copySkuwtv;
       data.qryautocountcostOther.FieldByName('countway').asstring:=grdAutoCost.InplaceEditor.GetEditingText;
    end;
    Accept:=True;
  end;
end;

procedure TfrmLocationOther.GetCusCnfg;
var
   qryselect:TKADOQuery;
begin
   if DataState=stedit then
   begin
      OpenSql(datatmp.qryTmp,'select RateName,CountComplete '
                    +'  from cost(nolock) '
                    +' where jobno="'+data.qryLocationOtherEdit.FieldByName('Jobno').AsString+'"' );
      if trim(datatmp.qryTmp.FieldByName('RateName').AsString)<>'' then
      begin
        { if _Language='CAPTIONC' then _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'
         else _strmessage:='该业务资料已参与费用计算，请先执行放弃费用计算操作!'; }
         kMessageDlg(GetMessage('frmLocationIN','015'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   qrySelect:=pGetCuscnfgSelect( cmbCostcus.textfield,cmbCostcus.text,'仓储');
   if (qrySelect.FieldByName('jobno').AsString<>'NO') and not qryselect.isempty then
   begin
      data.qryLocationOtherEdit.FieldByName('skucostclasscd').Asstring:=qrySelect.FieldByName('skucostclasscd').Asstring;
      data.qryLocationOtherEdit.FieldByName('Isbond').Asstring:=qrySelect.FieldByName('Isbond').Asstring;
//      if data.qryLocationOtherEdit.FieldByName('iUserid').Asstring='' then
//      begin
      data.qryLocationOtherEdit.FieldByName('iUserid').Asstring   :=qrySelect.FieldByName('Userid').Asstring;
      data.qryLocationOtherEdit.FieldByName('iusername').Asstring :=qrySelect.FieldByName('username').Asstring;
//      end;
      data.qryLocationOtherEdit.FieldByName('loadcosttype').Asstring:=qrySelect.FieldByName('loadcosttype').Asstring;
      // Added by wql 2005-12-6 20:10:10
      copySkuwtv             :=qrySelect.FieldByName('skuwtve').AsFloat;
      if not data.qryautocountcostOther.IsEmpty then
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
      data.qryautocountcostOther.DisableControls;
      data.qryautocountcostOther.First;
      while not data.qryautocountcostOther.Eof do
      begin
         data.qryautocountcostOther.Delete;
      end;
      OpenSql(dataTmp.qryTmp,' select cusid ,cpid,ismainrate=isnull(ismainrate,"F"),costcd, '   //crl     ,costcd
                            +'        isincome=isnull(isincome,"F"),ratecus,costcus,countway,costcountuomtype, '
                            +'        cnfgcostcusid=isnull(cnfgcostcusid,""),cnfgcostcusname,cnfgratecusid=isnull(cnfgratecusid,""),cnfgratecusname   '
                            +'   from cuscnfgitem(nolock) '
                            +'  where jobno="'+qrySelect.fieldbyname('jobno').AsString+'"'
                            +'    and cpid="其他操作" '
             );
//              dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         data.qryautocountcostOther.Append;
         if grdAutoCost.FocusedNode=nil then
            maxAutocountcost:=maxAutocountcost+1;
         data.qryautocountcostOther.FieldByName('sno').AsInteger:=maxAutocountcost;
//crl         data.qryautocountcostOther.FieldByName('costcd').AsString
//crl                                       :=dataTmp.qryTmp.fieldbyname('costcd').AsString;
//20091120注释了costcd为空，数据就空了
         data.qryautocountcostOther.FieldByName('costcd').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcd').AsString;

         data.qryautocountcostOther.FieldByName('ismainrate').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ismainrate').AsString;
         data.qryautocountcostOther.FieldByName('isincome').AsString
                                       :=dataTmp.qryTmp.fieldbyname('isincome').AsString;
         data.qryautocountcostOther.FieldByName('ratecus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('ratecus').AsString;
         data.qryautocountcostOther.FieldByName('rateuomtype').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcountuomtype').AsString;
         data.qryautocountcostOther.FieldByName('costcus').AsString
                                       :=dataTmp.qryTmp.fieldbyname('costcus').AsString;
         data.qryautocountcostOther.FieldByName('countway').AsString
                                       :=dataTmp.qryTmp.fieldbyname('countway').AsString;
         data.qryautocountcostOther.FieldByName('jobno').AsString:=data.qryLocationOther.fieldbyname('jobno').asstring;

         if dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString<>'' then
         begin
            data.qryautocountcostOther.FieldByName('costcusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString;
            data.qryautocountcostOther.FieldByName('costcusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgcostcusname').AsString;
         end;
         if dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString<>'' then
         begin
            data.qryautocountcostOther.FieldByName('ratecusid').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString;
            data.qryautocountcostOther.FieldByName('ratecusname').AsString
                                          :=dataTmp.qryTmp.fieldbyname('cnfgratecusname').AsString;
         end;
         // Added by wql 2005-12-6 20:11:15
         if data.qryautocountcostOther.FieldByName('countway').AsString='轻重货' then
            data.qryautocountcostOther.FieldByName('skuwtve').AsFloat:=copySkuwtv;

         data.qryautocountcostOther.Post;
         dataTmp.qryTmp.next;
      end;
      data.qryautocountcostOther.EnableControls;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocationOther.CostcusEnter(Sender: TObject);
begin
  if (DataState in Setdcs) then
  begin
     TdxDBButtonEdit(sender).DirectInput:=True;
     strOldCostCus:=cmbCostCus.Text;
  end;
end;

procedure TfrmLocationOther.grdCostCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostOther.edit;
         data.qryautocountcostOther.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostOther.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationOther.grdRateCusNameCostButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qryautocountcostOther.edit;
         data.qryautocountcostOther.FieldByName('ratecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryautocountcostOther.FieldByName('ratecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLocationOther.grdIsMainRateCostChange(Sender: TObject);
begin
   data.qryautocountcostOther.edit;
   data.qryautocountcostOther.FieldByName('ismainrate').asstring:=IIF(data.qryautocountcostOther.FieldByName('ismainrate').asstring='T','F','T');
   if data.qryautocountcostOther.FieldByName('ismainrate').asstring='F'then
   begin
      if grdCountway.Items.IndexOf('散装')=-1 then
//      Countway.Items.add('散装');
      grdCountway.Items.Insert(1,'散装');
   end else
   begin
      data.qryautocountcostOther.FieldByName('countway').asstring:='柜装';
      if grdCountway.Items.IndexOf('散装')<>-1 then
      grdCountway.Items.Delete(grdCountway.Items.IndexOf('散装'));
   end;
end;

procedure TfrmLocationOther.mitOperationClick(Sender: TObject);
begin
   pgcMain.ActivePage :=tbsEdit;
   pgcWareOther.ActivePage:=tbsWareOtherItemTask;
   WorkOperation(stBrowse,data.qryLocationOther.FieldByName('Jobno').AsString,
                          data.qryLocationOther.FieldByName('UserID').AsString);
end;

procedure TfrmLocationOther.pgcWareOtherChange(Sender: TObject);
begin
   if datastate=stbrowse then SetDetailActive(True,True);
end;

procedure TfrmLocationOther.edtLoadGroupNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherTask.FieldByName('loadgroupcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtForkGroupNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherTask.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtLiftMachineNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherTask.FieldByName('liftmachinecusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmLocationOther.edtCostcusnameButtonClick(Sender: TObject;
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
            data.qryLocationOtherTask.Edit;
            data.qryLocationOtherTask.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOtherTask.FieldByName('costcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.edtLocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.edit;
         data.qryLocationOtherTask.FieldByName('LocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         data.qryLocationOtherTask.FieldByName('LocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtConscusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherTask.FieldByName('conscusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtTallycusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('M','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherTask.Edit;
         data.qryLocationOtherTask.FieldByName('tallycusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherTask.FieldByName('tallycusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSkuConscusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('conscusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('conscusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmLocationOther.edtSkuTallycusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('M','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.Edit;
         data.qryLocationOtherAct.FieldByName('tallycusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryLocationOtherAct.FieldByName('tallycusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSkuLocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then
   begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         data.qryLocationOtherAct.edit;
         data.qryLocationOtherAct.FieldByName('LocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         data.qryLocationOtherAct.FieldByName('LocName').AsString:=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationOther.edtSkuCostcusnameButtonClick(Sender: TObject;
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
            data.qryLocationOtherAct.Edit;
            data.qryLocationOtherAct.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryLocationOtherAct.FieldByName('costCusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocationOther.mitforkworkloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="F"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if getSysdata('cusname')='SWZ' then
      Workforkworknew(data.qryLocationOther.FieldByname('jobno').AsString,'QT','F')
   else
      Workforkwork(data.qryLocationOther.FieldByname('jobno').AsString,'QT','F');
end;

procedure TfrmLocationOther.mitforkworkunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="F"'
          );
   if getSysdata('cusname')='SWZ' then
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
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="F"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="F"'
                               );
   end;
end;

procedure TfrmLocationOther.mitoploadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="T"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if getSysdata('cusname')='SWZ' then
      Workforkworknew(data.qryLocationOther.FieldByname('jobno').AsString,'QT','T')
   else
      Workforkwork(data.qryLocationOther.FieldByname('jobno').AsString,'QT','T');
end;

procedure TfrmLocationOther.mitopunloadClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                         +'  and isnull(forktype,"F")="T"'
                         );
   if getSysdata('cusname')='SWZ' then
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
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="T"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '
                               +'   and isnull(forktype,"F")="T"'
                               );
   end;
end;

procedure TfrmLocationOther.mitcostforkworkClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="Z"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if getSysdata('cusname')='SWZ' then
      Workforkworknew(data.qryLocationOther.FieldByname('jobno').AsString,'QT','Z')
   else
      Workforkwork(data.qryLocationOther.FieldByname('jobno').AsString,'QT','Z');
end;

procedure TfrmLocationOther.mitcanclecostClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '
                         +'   and isnull(forktype,"F")="Z"'
          );
   if getSysdata('cusname')='SWZ' then
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
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Z"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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
                               +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                               +'   and isnull(forktype,"F")="Z"'
                               );
   end;
end;

procedure TfrmLocationOther.N9Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                         +'   and isnull(forktype,"F")="Q"'
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('该票业务已分摊！！',mtWarning,[mbOK],0)
   else if getSysdata('cusname')='SWZ' then
      Workforkworknew(data.qryLocationOther.FieldByname('jobno').AsString,'QT','Q')
   else
      Workforkwork(data.qryLocationOther.FieldByname('jobno').AsString,'QT','Q');
end;

procedure TfrmLocationOther.N10Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock) '
                         +' where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                         +'  and isnull(forktype,"F")="Q"'
                         );
   if getSysdata('cusname')='SWZ' then
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
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                               +'  and isnull(forktype,"F")="Q"  '+chr(13)+chr(10)
                               );
         OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                               +'where jobnoin="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
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

procedure TfrmLocationOther.mitchecklookClick(Sender: TObject);
begin
   workforkworkload(data.qryLocationOther.FieldByname('locationbillno').AsString);
end;

procedure TfrmLocationOther.btnCostClick(Sender: TObject);
begin
   pWorkFormDll('FINANCE',PChar('COSTITEM'+data.qryLocationOther.FieldByName('Jobno').AsString));
end;

procedure TfrmLocationOther.mitworkitemClick(Sender: TObject);
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
                         +'  from locationothertask Detail(nolock) '+chr(13)+chr(10)
                         +'       left join sku                    '+chr(13)+chr(10)
                         +'              on Detail.skuid=sku.skuid  '+chr(13)+chr(10)
                         +' Where Detail.Jobno="'+data.qryLocationOther.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         +' GROUP by Detail.skuname,sku.skumodel,sku.skuspec,Detail.weightuom,Detail.pieceuom '+chr(13)+chr(10)
                         );
   OpenSql(dataTmp.qryTmp1,'Select cuscname from customer(nolock),locationother(nolock)  '+chr(13)+chr(10)
                         +' Where customer.cusid=locationother.costcusid '+chr(13)+chr(10)
                         +'   and locationother.Jobno="'+data.qryLocationOther.fieldbyname('Jobno').AsString+'"'+chr(13)+chr(10)
                         );
   lstPara.Add('cuscname='+dataTmp.qryTmp1.fieldbyname('cuscname').AsString);
   lstPara.Add('Remark='+data.qryLocationOther.fieldbyname('Remark').AsString);
   lstPara.Add('taskdate='+data.qryLocationOther.fieldbyname('taskdate').AsString);
   lstPara.Add('locationbillno='+data.qryLocationOther.fieldbyname('locationbillno').AsString);

   lstpara.Add('kdr='+_loginname);

   Worklinprint('100132','old','作业通知单',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmLocationOther.MenuItem2Click(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
      
   lstPara:=TStringList.Create;
   if getSysdata('hxtext')='T' then
   begin
      OpenSql(dataTmp.qrymain,'select locationother.jobno,locationother.cusbillno,locationother.locationbillno,locationother.remark, '+chr(13)+chr(10)
                             +'       taskdate=convert(char(10),locationother.taskdate,102),locationother.createname,'+chr(13)+chr(10)
                             +'       operationdate=convert(char(10),locationother.operationdate,102),locationother.Routing,   '+chr(13)+chr(10)
                             +'       cuscname=(select cuscname from customer(nolock) where locationother.costcusid=customer.cusid ), '+chr(13)+chr(10)
                             +'       locationother.carbrand    '+chr(13)+chr(10)
                             +'  from locationother (nolock)  '+chr(13)+chr(10)
                             +' where locationother.jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                );
      OpenSql(dataTmp.qrybb, 'select item.skuname,item.skuspec,item.skumodel,item.locname,  '+chr(13)+chr(10)
                            +'       item.piece,item.pieceuom,item.grossweight,item.weightuom,   '+chr(13)+chr(10)
                            +'       item.volume,item.volumeuom,item.netweight,   '+chr(13)+chr(10)
                            +'       item.area,item.areauom   '+chr(13)+chr(10)
                            +'  from locationothertask item(nolock)  '+chr(13)+chr(10)
                            +' where item.jobno="'+data.qryLocationOther.FieldByName('jobno').AsString+'" '
                );
      WorkFillRmBb('900103',False,dataTmp.qrymain,dataTmp.qryBb,lstPara,True);
   end;

end;

end.
