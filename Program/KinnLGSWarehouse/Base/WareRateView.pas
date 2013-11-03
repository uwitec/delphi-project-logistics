unit WareRateView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmWareRateView = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    btnClose: TKBitBtn;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdWareCostView: TdxDBGrid;
    TASKDATE: TdxDBGridColumn;
    LocationBillNO: TdxDBGridColumn;
    CostCusName: TdxDBGridColumn;
    SKUNAME: TdxDBGridColumn;
    QUANTITY: TdxDBGridColumn;
    iUserName: TdxDBGridColumn;
    Location: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    PIECE: TdxDBGridColumn;
    ppmRateCon: TPopupMenu;
    mitConAdd: TMenuItem;
    pgcwarerateview: TdxPageControl;
    tbsInfo: TdxTabSheet;
    tbsSku: TdxTabSheet;
    KGroupBox2: TKGroupBox;
    grdSKu: TdxDBGrid;
    SnoSku: TdxDBGridCurrencyColumn;
    NotFullSignSku: TdxDBGridCheckColumn;
    LocNameSku: TdxDBGridButtonColumn;
    cusNameSku: TdxDBGridButtonColumn;
    costcusidSku: TdxDBGridButtonColumn;
    ShippercusNameSku: TdxDBGridButtonColumn;
    SKUNameSku: TdxDBGridButtonColumn;
    LotCodeSku: TdxDBGridColumn;
    QualityNameSku: TdxDBGridButtonColumn;
    QuantitySku: TdxDBGridCurrencyColumn;
    QuantityUOMSku: TdxDBGridPickColumn;
    PieceSku: TdxDBGridCurrencyColumn;
    pieceuomSku: TdxDBGridPickColumn;
    VolumeSku: TdxDBGridCurrencyColumn;
    VolumeUOMSku: TdxDBGridPickColumn;
    areaSku: TdxDBGridCurrencyColumn;
    AreaUOMSku: TdxDBGridPickColumn;
    GrossWeightSku: TdxDBGridCurrencyColumn;
    NetWeightSku: TdxDBGridCurrencyColumn;
    WeightUOMSku: TdxDBGridPickColumn;
    loadgroupcusnameSku: TdxDBGridButtonColumn;
    forkgroupcusnameSku: TdxDBGridButtonColumn;
    liftmachinecusnameSku: TdxDBGridButtonColumn;
    TagTotalSku: TdxDBGridCurrencyColumn;
    TagEachUOMSku: TdxDBGridPickColumn;
    casing1Sku: TdxDBGridCurrencyColumn;
    uom1Sku: TdxDBGridPickColumn;
    casing2Sku: TdxDBGridCurrencyColumn;
    uom2Sku: TdxDBGridPickColumn;
    casing3Sku: TdxDBGridCurrencyColumn;
    uom3sku: TdxDBGridPickColumn;
    casing4sku: TdxDBGridCurrencyColumn;
    uom4Sku: TdxDBGridPickColumn;
    casing5Sku: TdxDBGridCurrencyColumn;
    uom5Sku: TdxDBGridPickColumn;
    RxSplitter1: TRxSplitter;
    KGroupBox3: TKGroupBox;
    KSText4: TKSText;
    grdWareCostRateSKu: TdxDBGrid;
    UserNameSKU: TdxDBGridButtonColumn;
    CountWaySku: TdxDBGridPickColumn;
    SectionLengthSku: TdxDBGridCurrencyColumn;
    SectionUnitSku: TdxDBGridPickColumn;
    CusNameRateSku: TdxDBGridButtonColumn;
    RateValueSku: TdxDBGridCurrencyColumn;
    CurrcdSku: TdxDBGridPickColumn;
    IsIncomeSku: TdxDBGridCheckColumn;
    RatequantitySku: TdxDBGridCurrencyColumn;
    RateUomTypeSku: TdxDBGridKinPickColumn;
    CountUomSKu: TdxDBGridPickColumn;
    GroupBox1: TKGroupBox;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    gmsLocationBillNO: TGMSStickyLabel;
    gmsCustomsNO: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel30: TGMSStickyLabel;
    cmbSKUClass: TKinDbPickEdit;
    rdgLoadType: TKDBRadioGroup;
    ckbTariff: TdxDBCheckEdit;
    ckbContract: TdxDBCheckEdit;
    ckbCountRent: TdxDBCheckEdit;
    ckbWO_CountWith1: TdxDBCheckEdit;
    cmbWareRentCountWay: TKinDbPickEdit;
    dtdAccountBillNO: TdxDBEdit;
    edtLocationBillNO: TdxDBEdit;
    edtCustomsNO: TdxDBEdit;
    edtMainOrder: TdxDBEdit;
    edtCostCus: TdxDBEdit;
    edtJOBNO: TdxDBEdit;
    cmbLoadCostType: TKinDbPickEdit;
    GroupBox3: TKGroupBox;
    grdContainer: TdxDBGrid;
    CONTYPE: TdxDBGridColumn;
    CONSPTYPE: TdxDBGridColumn;
    CONQuantity: TdxDBGridColumn;
    CONNO: TdxDBGridColumn;
    SEALNO: TdxDBGridColumn;
    LoadGroupCusName: TdxDBGridColumn;
    ForkGroupCusName: TdxDBGridColumn;
    LiftMachineCusName: TdxDBGridColumn;
    Remark: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    grdWareCostRateCon: TdxDBGrid;
    UserNameWare: TdxDBGridButtonColumn;
    CountWayCon: TdxDBGridPickColumn;
    SectionLengthCon: TdxDBGridCurrencyColumn;
    SectionUnitCon: TdxDBGridPickColumn;
    CusNameCon: TdxDBGridButtonColumn;
    RateValueCon: TdxDBGridCurrencyColumn;
    CurrcdCon: TdxDBGridPickColumn;
    IsIncomeCon: TdxDBGridCheckColumn;
    ConTypeCon: TdxDBGridPickColumn;
    ConSPTypeCon: TdxDBGridPickColumn;
    QuantityCon: TdxDBGridCurrencyColumn;
    RxSplitter2: TRxSplitter;
    qrymain: TKADOQuery;
    dtsmain: TDataSource;
    qryContainer: TKADOQuery;
    dtsContainer: TDataSource;
    qryWareCostRateCon: TKADOQuery;
    dtsWareCostRateCon: TDataSource;
    qrysku: TKADOQuery;
    dtssku: TDataSource;
    qryWareCostRateSKu: TKADOQuery;
    dtsWareCostRateSKu: TDataSource;
    LoadTypename: TdxDBGridColumn;
    tbsSkuBefore: TdxTabSheet;
    KGroupBox4: TKGroupBox;
    grdskubefore: TdxDBGrid;
    SnoSkuBefore: TdxDBGridCurrencyColumn;
    NotFullSignSkuBefore: TdxDBGridCheckColumn;
    LocNameSkuBefore: TdxDBGridButtonColumn;
    cusNameSkuBefore: TdxDBGridButtonColumn;
    costcusidSkuBefore: TdxDBGridButtonColumn;
    ShippercusNameSkuBefore: TdxDBGridButtonColumn;
    SKUNameSkuBefore: TdxDBGridButtonColumn;
    LotCodeSkuBeofore: TdxDBGridColumn;
    QualityNameSkuBefore: TdxDBGridButtonColumn;
    QuantitySkuBefore: TdxDBGridCurrencyColumn;
    QuantityUOMSkuBefore: TdxDBGridPickColumn;
    PieceSkuBefore: TdxDBGridCurrencyColumn;
    pieceuomSkuBefore: TdxDBGridPickColumn;
    VolumeSkuBefore: TdxDBGridCurrencyColumn;
    VolumeUOMSkuBefore: TdxDBGridPickColumn;
    areaSkuBefore: TdxDBGridCurrencyColumn;
    AreaUOMSkuBefore: TdxDBGridPickColumn;
    GrossWeightSkuBefore: TdxDBGridCurrencyColumn;
    NetWeightSkuBefore: TdxDBGridCurrencyColumn;
    WeightUOMSkuBefore: TdxDBGridPickColumn;
    loadgroupcusnameSkuBefore: TdxDBGridButtonColumn;
    forkgroupcusnameSkuBefore: TdxDBGridButtonColumn;
    liftmachinecusnameSkuBefore: TdxDBGridButtonColumn;
    TagTotalSkubefore: TdxDBGridCurrencyColumn;
    TagEachUOMSkuBefore: TdxDBGridPickColumn;
    casing1SkuBeofre: TdxDBGridCurrencyColumn;
    uom1SkuBefore: TdxDBGridPickColumn;
    casing2SkuBeofre: TdxDBGridCurrencyColumn;
    uom2SkuBefore: TdxDBGridPickColumn;
    casing3SkuBeofre: TdxDBGridCurrencyColumn;
    uom3SkuBefore: TdxDBGridPickColumn;
    casing4SkuBeofre: TdxDBGridCurrencyColumn;
    uom4SkuBefore: TdxDBGridPickColumn;
    casing5SkuBeofre: TdxDBGridCurrencyColumn;
    uom5SkuBefore: TdxDBGridPickColumn;
    KGroupBox5: TKGroupBox;
    KSText1: TKSText;
    grdWareCostRateSKuBefore: TdxDBGrid;
    UserNameSKUBefore: TdxDBGridButtonColumn;
    CountWaySkuBefore: TdxDBGridPickColumn;
    SectionLengthSkuBefore: TdxDBGridCurrencyColumn;
    SectionUnitSkuBefore: TdxDBGridPickColumn;
    CusNameRateSkuBefore: TdxDBGridButtonColumn;
    RateValueSkuBefore: TdxDBGridCurrencyColumn;
    CurrcdSkuBefore: TdxDBGridPickColumn;
    IsIncomeSkubefore: TdxDBGridCheckColumn;
    RateUomTypeSkuBefore: TdxDBGridKinPickColumn;
    CountUomSKuBefore: TdxDBGridPickColumn;
    RatequantitySkuBefore: TdxDBGridCurrencyColumn;
    RxSplitter3: TRxSplitter;
    qryWareCostRateSKubefore: TKADOQuery;
    qryskubefore: TKADOQuery;
    dtsWareCostRateSKubefore: TDataSource;
    dtsskubefore: TDataSource;
    CountCostcdSkuBefore: TdxDBGridColumn;
    CountCostcdSku: TdxDBGridColumn;
    CountCostcdCon: TdxDBGridColumn;
    btnEdit: TKBitBtn;
    Bevel3: TBevel;
    btnCancel: TKBitBtn;
    btnSave: TKBitBtn;
    Bevel4: TBevel;
    LoadCostTypeSkuBefore: TdxDBGridPickColumn;
    LoadCostTypeSku: TdxDBGridPickColumn;
    LoadCostTypeCon: TdxDBGridPickColumn;
    contlim: TdxDBGridColumn;
    contlimbefore: TdxDBGridColumn;
    udsWareCostRateCon: TKadoUpdateSql;
    udsWareCostRateSKu: TKadoUpdateSql;
    udsWareCostRateSKubefore: TKadoUpdateSql;
    mitConDel: TMenuItem;
    ppmRateBef: TPopupMenu;
    mitBFadd: TMenuItem;
    mitBFdel: TMenuItem;
    ppmRate: TPopupMenu;
    mitadd: TMenuItem;
    mitdel: TMenuItem;
    CostcdCon: TdxDBGridKinPickColumn;
    CostcdSku: TdxDBGridKinPickColumn;
    CostcdSkuBefore: TdxDBGridKinPickColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure grdSKuChangeNodeEx(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure grdWareCostViewChangeNodeEx(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure grdWareCostViewDblClick(Sender: TObject);
    procedure pgcwarerateviewChange(Sender: TObject);
    procedure grdskubeforeChangeNodeEx(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdWareCostRateConEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdWareCostRateSKuBeforeEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdWareCostRateSKuEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure mitConAddClick(Sender: TObject);
    procedure grdWareCostRateConEnter(Sender: TObject);
    procedure CostcdConValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure UserNameWareButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CusNameConButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitConDelClick(Sender: TObject);
    procedure grdWareCostRateSKuBeforeEnter(Sender: TObject);
    procedure grdWareCostRateSKuEnter(Sender: TObject);
    procedure mitBFaddClick(Sender: TObject);
    procedure mitaddClick(Sender: TObject);
    procedure mitBFdelClick(Sender: TObject);
    procedure mitdelClick(Sender: TObject);
    procedure UserNameSKUButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CusNameRateSkuButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure UserNameSKUBeforeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CusNameRateSkuBeforeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure RateUomTypeSkuValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure RateUomTypeSkuBeforeValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure qryWareCostRateConBeforePost(DataSet: TDataSet);
    procedure RateValueSkuBeforeValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure RateValueSkuValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdWareCostRateSKuExit(Sender: TObject);
    procedure grdWareCostRateSKuBeforeExit(Sender: TObject);
    procedure grdWareCostRateConExit(Sender: TObject);
    procedure qryWareCostRateSKubeforeBeforePost(DataSet: TDataSet);
    procedure qryWareCostRateSKuBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    //变量定义
    strJobno:string;
    FilterSql: string;
    DataState:TDataState;
    Bookmark: TBookmark;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    blnqryInChange:Boolean;           //判断是否要执行假主库移动的事件
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    blnItemPage:Boolean;         //判断是否要执行从库页面翻动事件
    blnSku:Boolean;           //判断是否曾经翻到过商品信息页面
    blnskubefore:Boolean;      //判断是否曾经翻到过商品变更前信息页面
    blninfo:Boolean;           //判断是否曾经翻到过主率费信息页面
    blnMainPage:Boolean;           //判断是否要执行主页面翻动事件
    strtype,strsql:string;    //work参数 strtype调用类型
    strtable:string;   //主表表名
    //过程定义
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    function  FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure pgcRelocationChange(Sender: TObject);
    procedure MasterTableInit(pstrtable:string);  //初始化主表
    procedure GetCus(Query:TKADOQuery);    //取得关系人
    procedure GetPart(Query:TKADOQuery);  //取得部门
    function  CheckModifyMode:Boolean;   //判断是否可进行编辑
    function  CheckCZCount:Boolean;      //判断仓租是否计算
    function GetUom(Query:TKADOQuery;uomtype:string):string;  //取单位类型时自动取商品信息中的相关单位
    function PostCheck(TdxGrid:TdxDBGrid):Boolean;           //query post前校验
    procedure GridExitPost(sender:Tobject);    //DBgrid退出发post
    //费率控制过程
  public
    { Public declarations }
    maxContainer,maxWareCostRateCon,maxsku,
    maxWareCostRatesku,maxskubefore,maxWareCostRateskubefore:Integer; //修改时候用的
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkWareRateView(ptype,pJobno:string);

var
  frmWareRateViewIn,frmWareRateViewOut,frmwWareRateViewVA: TfrmWareRateView;

implementation

{$R *.dfm}

Uses Main, kindlg, GetUserRight,libuserPub,GetDllPub,datasTmp;

var
   strpjobno,strtype,strcaption:string;  //调用类型

procedure WorkWareRateView(ptype,pJobno:string);
{入口函数
  pstrJobno  :定位Jobno
  ptype      :查看费率业务类型. IN:进仓费率,OUT:出仓费率 ,VA库内加工
}
var
//   year,month,day:word;
//   month_start,month_end:TDate;
   Filtersql:string;
   StrDefFilterSql:string;
   function IIFForm(pstrtype:string;blnCreate:Boolean;var v1,v2,v3:TfrmWareRateView):TfrmWareRateView;
      function CreateForm(var form:TfrmWareRateView):Boolean;
      begin
         result:=True;
         if form <> nil then
         with form do
         begin
            if WindowState=wsMinimized then
               WindowState:=wsNormal;
            Show;
            result:=False;
            Exit;
         end;
         form:=TfrmWareRateView.Create(application);
      end;
   begin
      result:=nil;
      if pstrtype='IN' then
      begin
         strcaption:='进仓费率';
         if not blnCreate or CreateForm(v1) then  result:=v1
      end else
      if pstrtype='OUT' then
      begin
         strcaption:='出仓费率';
         if not blnCreate or CreateForm(v2) then result:=v2
      end else
      if pstrtype='VA' then
      begin
         strcaption:='库内加工费率';
         if not blnCreate or CreateForm(v3) then result:=v3
      end;
   end;
begin
   strpjobno:=pjobno;
   strtype:=ptype;
   if IIFForm(ptype,True,frmWareRateViewIn,frmWareRateViewOut,frmwWareRateViewVA)=nil then exit;
   with IIFForm(ptype,false,frmWareRateViewIn,frmWareRateViewOut,frmwWareRateViewVA) do
   begin
   {初始化所有数据集}
      //初始化变量
     //装卸方式
      InitdbPick(cmbLoadcosttype,'codelib','codename','codename','codeclass="19"');
      RateUomTypeSkuBefore.Items.Clear;
      RateUomTypeSkuBefore.ItemFields.Clear;
      RateUomTypeSkuBefore.Items.Assign(RateUomTypeSku.Items);
      RateUomTypeSkuBefore.ItemFields.Assign(RateUomTypeSku.ItemFields);
      //费用名称
      InitdbPick(CostcdCon,'costcode','costcd','costname','1=1');
      CostcdSku.Items.Clear;
      CostcdSku.itemFields.clear;
      CostcdSkuBefore.Items.Clear;
      CostcdSkuBefore.ItemFields.Clear;
      CostcdSku.Items.Assign(CostcdCon.Items);
      CostcdSku.ItemFields.Assign(CostcdCon.ItemFields);
      CostcdSkuBefore.Items.Assign(CostcdCon.Items);
      CostcdSkuBefore.ItemFields.Assign(CostcdSkuBefore.ItemFields);
      //币别
      InitdbPick(CurrcdCon,'codelib','codename','codename',' codeclass="00" ');
      CurrcdSku.Items.Clear;
      CurrcdSkuBefore.Items.Clear;
      CurrcdSku.Items.Assign(CurrcdCon.Items);
      CurrcdSkuBefore.Items.Assign(CurrcdCon.Items);

      //操作类型
      InitdbPick(LoadCostTypeCon,'codelib','codename','codename',' codeclass="19" ');
      LoadCostTypeSku.items.Clear;
      LoadCostTypeSkuBefore.Items.Clear;
      LoadCostTypeSku.Items.Assign(LoadCostTypeCon.Items);
      LoadCostTypeSkuBefore.Items.Assign(LoadCostTypeCon.Items);
      //箱型
      InitdbPick(ConSPTypeCon,'codelib','codecd','codename',' codeclass="01" ');

      //单位类型
      InitdbPick(RateUomTypeSku,'codelib','codecd','codename',' codeclass="05" ');
      RateUomTypeSkuBefore.Items.Clear;
      RateUomTypeSkuBefore.ItemFields.Clear;
      RateUomTypeSkuBefore.Items.Assign(RateUomTypeSku.Items);
      RateUomTypeSkuBefore.ItemFields.Assign(RateUomTypeSku.ItemFields);
      //单位
      InitdbPick(CountUomSKuBefore,'UOM','UOMName','UOMName','1=1');
      CountUomSKu.Items.Clear;
      CountUomSKu.Items.Assign(CountUomSKuBefore.Items);

      FindItem       :=TFindItem.Create;
      strJobno       :=pJobno;
      strtype        :=ptype;
      blnqryInChange :=True;
      ScrollAfterEdit:=True;
      blnSku         :=False;
      blnskubefore   :=false;
      blninfo        :=false;
      blnmainpage    :=true;
      blnItemPage:=True;
      if UpperCase(strtype)<>'VA' then tbsSkuBefore.TabVisible:=false;
     //仓租方式
      InitdbPick(cmbWareRentCountWay,'codelib','codecd','codename','codeclass="18"');
      if UpperCase(strtype)='IN' then
      begin
          MasterTableInit('locationin');
          strsql:=' ksp_GetLocationinitemByJobno @jobno=:Jobno ';
          qrysku.Close;
          qrysku.SQL.Clear;
          qrysku.SQL.Add(strsql);
      end else
      if UpperCase(strtype)='OUT' then
      begin
          MasterTableInit('locationout');

          strsql:=' ksp_GetLocationoutitemByJobno @jobno=:Jobno ';
          qrysku.Close;
          qrysku.SQL.Clear;
          qrysku.SQL.Add(strsql);

      end else
      if UpperCase(strtype)='VA' then
      begin
         MasterTableInit('Valueadd');
         strsql:=' ksp_GetLocationoutitemByJobno @jobno=:Jobno ';
         qryskuBefore.Close;
         qryskuBefore.SQL.Clear;
         qryskuBefore.SQL.Add(strsql);

         strsql:=' ksp_GetWareCostrateByjobnosno @jobno=:jobno,@sno=0,'
                +'     @isold="T",@lang="'+IIF(_Language='CAPTIONC','C','E')+'"';  //sno为零表示以从库sno,'T'为变更前费率
         qryWareCostRateSKubefore.Close;
         qryWareCostRateSKubefore.sql.Clear;
         qryWareCostRateSKubefore.sql.Add(strsql);

         strsql:=' ksp_GetLocationinitemByJobno @jobno=:Jobno ';
         qrysku.Close;
         qrysku.SQL.Clear;
         qrysku.SQL.Add(strsql);

         tbsSku.Caption:='商品变更后费率';
      end;
      strsql:=' ksp_GetContainerByjobno @jobno=:jobno ';
      qryContainer.Close;
      qryContainer.SQL.Clear;
      qryContainer.SQL.Add(strsql);

      strsql:=' ksp_GetWareCostrateByjobnosno @jobno=:jobno,@sno=-11 ,'
             +'     @lang="'+IIF(_Language='CAPTIONC','C','E')+'"';  //sno为零表示以从库sno,'T'为变更前费率;
      qryWareCostRateCon.Close;
      qryWareCostRateCon.SQL.Clear;
      qryWareCostRateCon.SQL.Add(strsql);

      strsql:=' ksp_GetWareCostrateByjobnosno @jobno=:jobno,@sno=0, '
             +'     @lang="'+IIF(_Language='CAPTIONC','C','E')+'"';  //sno为零表示以从库sno,'T'为变更前费率;
      qryWareCostRateSKu.Close;
      qryWareCostRateSKu.SQL.Clear;
      qryWareCostRateSKu.SQL.Add(strsql);
{
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
        FilterSql:=' (convert(datetime,convert(char(8),Inout.operationdate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),Inout.operationdate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('1');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('计划日期          大于等于      '+datetostr(Month_Start));
           Field.Add('1');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('计划日期          小于等于      '+datetostr(Month_End));
        end;
      end else FilterSql:='';
}
      StrDefFilterSql:=GetdefFilter(IIF(strtype='IN','进仓任务','进仓实际'));
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      qrymain.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

  // 界面显示过程
      qrymain.open;
      if strJobno<>'' then
      qrymain.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
      WorkCall(stBrowse);
      {激活FORM}
      if strJobno<>'' then
      begin
         ShowModal;
         Free;
      end else
        Show;
   end;
end;

procedure TfrmWareRateView.WorkCall(CallMode:TDataState);
{模块调用入口
   CallMode:调用状态
       stBrowse:浏览查看
       stInsert:新增
       stEdit:编辑修改
}
begin
   DataState:=CallMode;
   case DataState of
   stBrowse:
      begin
         DisableEdit;
         ActiveControl:=btnFind;
         LampChange(lsBrowse);
      end;
   stEdit:
      begin
      //在修改的状态下，对qryContainer循环
         qryContainer.DisableControls;
         Bookmark:=qryContainer.GetBookmark;
         maxContainer:=0;
         qryContainer.Filtered:=False;
         qryContainer.First;
         while not qryContainer.Eof do
         begin
            if qryContainer.FieldByName('SNO').AsInteger>maxContainer
            then maxContainer:=qryContainer.FieldByName('SNO').AsInteger;
            qryContainer.Next;
         end;
         qryContainer.Filtered:=True;
         qryContainer.GotoBookmark(Bookmark);
         qryContainer.FreeBookmark(Bookmark);
         bookMark:=nil;
         qryContainer.EnableControls;

      //在修改的状态下，对qryWareCostRateCon循环
         qryWareCostRateCon.DisableControls;
         Bookmark:=qryWareCostRateCon.GetBookmark;
         maxWareCostRateCon:=0;
         qryWareCostRateCon.Filtered:=False;
         qryWareCostRateCon.First;
         while not qryWareCostRateCon.Eof do
         begin
            if qryWareCostRateCon.FieldByName('ratesno').AsInteger>maxWareCostRateCon
            then maxWareCostRateCon:=qryWareCostRateCon.FieldByName('ratesno').AsInteger;
            qryWareCostRateCon.Next;
         end;
         qryWareCostRateCon.Filtered:=True;
         qryWareCostRateCon.GotoBookmark(Bookmark);
         qryWareCostRateCon.FreeBookmark(Bookmark);
         bookMark:=nil;
         qryWareCostRateCon.EnableControls;

         //在修改的状态下，对qrysku循环
         qrysku.DisableControls;
         Bookmark:=qrysku.GetBookmark;
         maxsku:=0;
         qrysku.Filtered:=False;
         qrysku.First;
         while not qrysku.Eof do
         begin
            if qrysku.FieldByName('SNO').AsInteger>maxsku
            then maxsku:=qrysku.FieldByName('SNO').AsInteger;
            qrysku.Next;
         end;
         qrysku.Filtered:=True;
         qrysku.GotoBookmark(Bookmark);
         qrysku.FreeBookmark(Bookmark);
         bookMark:=nil;
         qrysku.EnableControls;

      //在修改的状态下，对qryWareCostRatesku循环
         qryWareCostRateSKu.DisableControls;
         Bookmark:=qryWareCostRateSKu.GetBookmark;
         maxWareCostRatesku:=0;
         qryWareCostRateSKu.Filtered:=False;
         qryWareCostRateSKu.First;
         while not qryWareCostRateSKu.Eof do
         begin
            if qryWareCostRateSKu.FieldByName('ratesno').AsInteger>maxWareCostRatesku
            then maxWareCostRatesku:=qryWareCostRateSKu.FieldByName('ratesno').AsInteger;
            qryWareCostRateSKu.Next;
         end;
         qryWareCostRateSKu.Filtered:=True;
         qryWareCostRateSKu.GotoBookmark(Bookmark);
         qryWareCostRateSKu.FreeBookmark(Bookmark);
         bookMark:=nil;
         qryWareCostRateSKu.EnableControls;

         //在修改的状态下，对qryskubefore循环
         if UpperCase(strtype)='VA' then
         begin
            qryskubefore.DisableControls;
            Bookmark:=qryskubefore.GetBookmark;
            maxskubefore:=0;
            qryskubefore.Filtered:=False;
            qryskubefore.First;
            while not qryskubefore.Eof do
            begin
               if qryskubefore.FieldByName('SNO').AsInteger>maxskubefore
               then maxskubefore:=qryskubefore.FieldByName('SNO').AsInteger;
               qryskubefore.Next;
            end;
            qryskubefore.Filtered:=True;
            qryskubefore.GotoBookmark(Bookmark);
            qryskubefore.FreeBookmark(Bookmark);
            bookMark:=nil;
            qryskubefore.EnableControls;

         //在修改的状态下，对qryWareCostRateskubefore循环
            qryWareCostRateSKubefore.DisableControls;
            Bookmark:=qryWareCostRateSKubefore.GetBookmark;
            maxWareCostRateskubefore:=0;
            qryWareCostRateSKubefore.Filtered:=False;
            qryWareCostRateSKubefore.First;
            while not qryWareCostRateSKubefore.Eof do
            begin
               if qryWareCostRateSKubefore.FieldByName('ratesno').AsInteger>maxWareCostRateskubefore
               then maxWareCostRateskubefore:=qryWareCostRateSKubefore.FieldByName('ratesno').AsInteger;
               qryWareCostRateSKubefore.Next;
            end;
            qryWareCostRateSKubefore.Filtered:=True;
            qryWareCostRateSKubefore.GotoBookmark(Bookmark);
            qryWareCostRateSKubefore.FreeBookmark(Bookmark);
            bookMark:=nil;
            qryWareCostRateSKubefore.EnableControls;
         end;
         EnableEdit;
         LampChange(lsEdit);
      end;
   stInsert:
      begin
//         data.qryDun.Append;
//         olddn_no :='';
//         InitValues;
         EnableEdit;
         LampChange(lsEdit);
      end;
   end;
end;

procedure TfrmWareRateView.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
  setDisable:TSetInt;
begin
   setDisable:=[];
   LibComControl(Self,[1..5,10,20]+setDisable,[11]-setDisable);
end;

procedure TfrmWareRateView.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
   setDisable:TSetInt;
begin
   setDisable:=[];
   libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
end;

procedure TfrmWareRateView.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
   if blnPage then
   begin
      if pgcMain.ActivePage=tbsEdit then
      begin
         if pgcwarerateview.ActivePage=tbsInfo then
         begin
            if (qryContainer.DataSource=nil) and (qryContainer.Active) then
               qryContainer.Close;
            qryContainer.DataSource:=dtsmain;
            qryContainer.Active:=true;
            if (qryWareCostRateCon.DataSource=nil) and (qryWareCostRateCon.Active) then
               qryWareCostRateCon.Close;
            qryWareCostRateCon.DataSource:=dtsmain;
            qryWareCostRateCon.Active:=true;
         end;

         if pgcwarerateview.ActivePage=tbsSKU then
         begin
            if (qrysku.DataSource=nil) and (qrysku.Active) then
               qrysku.Close;
            qrysku.DataSource:=dtsmain;
            qrysku.Active:=true;
            if (qryWareCostRateSKu.DataSource=nil) and (qryWareCostRateSKu.Active) then
               qryWareCostRateSKu.Close;
            qryWareCostRateSKu.DataSource:=dtsmain;
            qryWareCostRateSKu.Active:=true;
         end;
         if pgcwarerateview.ActivePage=tbsSkuBefore then
         begin
            if (qryskuBefore.DataSource=nil) and (qryskuBefore.Active) then
               qryskuBefore.Close;
            qryskuBefore.DataSource:=dtsmain;
            qryskuBefore.Active:=true;
            if (qryWareCostRateSKubefore.DataSource=nil) and (qryWareCostRateSKubefore.Active) then
               qryWareCostRateSKubefore.Close;
            qryWareCostRateSKubefore.DataSource:=dtsmain;
            qryWareCostRateSKubefore.Active:=true;
         end;
      end;
   end else
   begin
      if (qryContainer.DataSource=nil) and (qryContainer.Active) then
         qryContainer.Close;
      qryContainer.DataSource:=dtsmain;
      qryContainer.Active:=true;
      if (qryWareCostRateCon.DataSource=nil) and (qryWareCostRateCon.Active) then
         qryWareCostRateCon.Close;
      qryWareCostRateCon.DataSource:=dtsmain;
      qryWareCostRateCon.Active:=true;
      if (qrysku.DataSource=nil) and (qrysku.Active) then
         qrysku.Close;
      qrysku.DataSource:=dtsmain;
      qrysku.Active:=true;
      if (qryWareCostRateSKu.DataSource=nil) and (qryWareCostRateSKu.Active) then
         qryWareCostRateSKu.Close;
      qryWareCostRateSKu.DataSource:=dtsmain;
      qryWareCostRateSKu.Active:=true;
      if tbsSkuBefore.TabVisible then
      begin
         if (qryskuBefore.DataSource=nil) and (qryskuBefore.Active) then
            qryskuBefore.Close;
         qryskuBefore.DataSource:=dtsmain;
         qryskuBefore.Active:=true;
         if (qryWareCostRateSKubefore.DataSource=nil) and (qryWareCostRateSKubefore.Active) then
            qryWareCostRateSKubefore.Close;
         qryWareCostRateSKubefore.DataSource:=dtsmain;
         qryWareCostRateSKubefore.Active:=true;
      end;
   end;
end;

procedure TfrmWareRateView.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
   qryContainer.DataSource       :=nil;
   qryWareCostRateCon.DataSource :=nil;
   qrysku.DataSource             :=nil;
   qryWareCostRateSKu.DataSource :=nil;
   qryskuBefore.DataSource       :=nil;
   qryWareCostRateSKubefore.DataSource:=nil;
end;

procedure TfrmWareRateView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmWareRateView.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox3);
   SetDxDbGrid(grdContainer);
   SetDxDbGrid(grdWareCostRateCon);
   SetDxDbGrid(grdSKu);
   SetDxDbGrid(grdWareCostRateSKu);
   SetDxDbGrid(grdSKubefore);
   SetDxDbGrid(grdWareCostRateSKubefore);
   SetDxDbGrid(grdWareCostView);
   pgcMain.ActivePage:=tbsBrowse;
   qrymain.Connection:=_ADOConnection;
   qryContainer.Connection:=_ADOConnection;
   qryWareCostRateCon.Connection:=_ADOConnection;
   qrysku.Connection:=_ADOConnection;
   qryWareCostRateSKu.Connection:=_ADOConnection;
   qryskuBefore.Connection:=_ADOConnection;
   qryWareCostRateSKubefore.Connection:=_ADOConnection;

end;

procedure TfrmWareRateView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
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

     Ord('F'):KeyDownControl(Key,btnFind);
     Ord('R'):KeyDownControl(Key,btnRefind);
     Ord('L'):KeyDownControl(Key,btnFilter);
 //      Ord('O'):KeyDownControl(Key,btnPrint);

     Vk_Escape:KeyDownControl(Key,btnClose);
   end;
end;

procedure TfrmWareRateView.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   if UpperCase(strtype)='IN' then frmWareRateViewIn:=nil
   else if UpperCase(strtype)='OUT' then frmWareRateViewOut:=nil
   else frmwWareRateViewVA:=nil;
end;

procedure TfrmWareRateView.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmWareRateView.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmWareRateView.btnRefreshClick(Sender: TObject);
var
   strjobno: string;
begin
   strjobno:=qrymain.fieldbyname('jobno').asstring;
   if pgcMain.ActivePage=tbsEdit then
   begin
      SetMasterDetailState(false);
      blnqryInChange:=False;
   end;
   qrymain.Close;

   qrymain.Open;
   qrymain.DisableControls;
   if not qrymain.Locate('Jobno',
                       VarArrayOf([strJobno]),
                       [loCaseInsensitive, loPartialKey]) then
   begin
      qrymain.Last;
      grdWareCostViewChangeNodeEx(nil);
   end;
   qrymain.EnableControls;
   if pgcMain.ActivePage=tbsEdit then
   begin
      SetDetailActive(False,True);
      blnqryInChange:=True;
   end;
end;

procedure TfrmWareRateView.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   Para:=TFindPara.Create;

   Para.Tables.Add('locationin inout');

{0}   Para.Field.Add('inout.mainorder');
{0}   Para.Toptic.Add('主订单号');
{0}   Para.Ftype.Add('C');

{1}   Para.Field.Add('inout.costcusid');
{1}   Para.Toptic.Add('费用关系人');
{1}   Para.Ftype.Add('E');

{2}   Para.Field.Add('inout.iuserid');
{2}   Para.Toptic.Add('执行部门');
{2}   Para.Ftype.Add('E');

{3}   Para.Field.Add('inout.skucostclasscd');
{3}   Para.Toptic.Add('商 品 类');
{3}   Para.Ftype.Add('B');

{4}   Para.Field.Add('inout.cusbillno');
{4}   Para.Toptic.Add('客户单号');
{4}   Para.Ftype.Add('C');

{5}   Para.Field.Add('inout.customsno');
{5}   Para.Toptic.Add('报关单号');
{5}   Para.Ftype.Add('C');

{6}   Para.Field.Add('inout.loadtype');
{6}   Para.Toptic.Add('是否整柜');
{6}   Para.Ftype.Add('B');

{7}   Para.Field.Add('inout.isbond');
{7}   Para.Toptic.Add('是否保税');
{7}   Para.Ftype.Add('B');

{8}   Para.Field.Add('inout.opid');
{8}   Para.Toptic.Add('业务员');
{8}   Para.Ftype.Add('E');

{9}   Para.Field.Add('inout.skuname');
{9}   Para.Toptic.Add('商品名称');
{9}   Para.Ftype.Add('C');

{10}  Para.Field.Add('inout.cusbillno');
{10}   Para.Toptic.Add('客户单号');
{10}   Para.Ftype.Add('C');

{11}  Para.Field.Add('convert(datetime,convert(char(10),inout.taskdate,102))');
{11}   Para.Toptic.Add('计划日期');
{11}   Para.Ftype.Add('D');

{12}  Para.Field.Add('inout.blno');
{12}   Para.Toptic.Add('提 单 号');
{12}   Para.Ftype.Add('C');

{13}  Para.Field.Add('inout.locationbillno');
{13}   Para.Toptic.Add('仓 单 号');
{13}   Para.Ftype.Add('C');

{14}  Para.Field.Add('inout.countcontcost');
{14}  Para.Toptic.Add('包干标志');
{14}  Para.Ftype.Add('B');

{15}  Para.Field.Add('inout.contwithloca');
{15}  Para.Toptic.Add('包仓标志');
{15}  Para.Ftype.Add('B');

{16}  Para.Field.Add('inout.warerentcounttype');
{16}  Para.Toptic.Add('仓租计算方式');
{16}  Para.Ftype.Add('B');

{17}  Para.Field.Add('convert(datetime,convert(char(10),inout.operationdate,102))');
{17}  Para.Toptic.Add('出货日期');
{17}  Para.Ftype.Add('D');

{18}  Para.Field.Add('inout.createname');
{18}  Para.Toptic.Add('创 建 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.operationname');
{19}  Para.Toptic.Add('出 货 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.checkname');
{20}  Para.Toptic.Add('审 核 人');
{20}  Para.Ftype.Add('C');

{21}  Para.Field.Add('inout.jobno');
{21}  Para.Toptic.Add('工作单号');
{21}  Para.Ftype.Add('C');

  Para.RField.Add('INOUT.jobno');
  Para.Filter:=' '
              +' and '+qrymain.MacroByName('Where').AsString
              +iif(trim(strJobno)='','',' and inout.jobno="'+strJobno+'" ');

  Para.OnGetValue:=FindGetValue;
  Dofind(qrymain,dataTmp.qryFind,Para,FindItem);
end;

procedure TfrmWareRateView.btnRefindClick(Sender: TObject);
begin
   DoRefind(qrymain, dataTmp.qryFind);
end;

procedure TfrmWareRateView.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   Para:=TFindPara.Create;
   Para.Tables.Add(strtable+' inout');

{0}   Para.Field.Add('inout.mainorder');
{0}   Para.Toptic.Add('主订单号');
{0}   Para.Ftype.Add('C');

{1}   Para.Field.Add('inout.costcusid');
{1}   Para.Toptic.Add('费用关系人');
{1}   Para.Ftype.Add('E');

{2}   Para.Field.Add('inout.iuserid');
{2}   Para.Toptic.Add('执行部门');
{2}   Para.Ftype.Add('E');

{3}   Para.Field.Add('inout.skucostclasscd');
{3}   Para.Toptic.Add('商 品 类');
{3}   Para.Ftype.Add('B');

{4}   Para.Field.Add('inout.cusbillno');
{4}   Para.Toptic.Add('客户单号');
{4}   Para.Ftype.Add('C');

{5}   Para.Field.Add('inout.customsno');
{5}   Para.Toptic.Add('报关单号');
{5}   Para.Ftype.Add('C');

{6}   Para.Field.Add('inout.loadtype');
{6}   Para.Toptic.Add('是否整柜');
{6}   Para.Ftype.Add('B');

{7}   Para.Field.Add('inout.isbond');
{7}   Para.Toptic.Add('是否保税');
{7}   Para.Ftype.Add('B');

{8}   Para.Field.Add('inout.opid');
{8}   Para.Toptic.Add('业务员');
{8}   Para.Ftype.Add('E');

{9}   Para.Field.Add('inout.skuname');
{9}   Para.Toptic.Add('商品名称');
{9}   Para.Ftype.Add('C');

{10}  Para.Field.Add('inout.cusbillno');
{10}   Para.Toptic.Add('客户单号');
{10}   Para.Ftype.Add('C');

{11}  Para.Field.Add('convert(datetime,convert(char(10),inout.taskdate,102))');
{11}   Para.Toptic.Add('计划日期');
{11}   Para.Ftype.Add('D');

{12}  Para.Field.Add('inout.blno');
{12}   Para.Toptic.Add('提 单 号');
{12}   Para.Ftype.Add('C');

{13}  Para.Field.Add('inout.locationbillno');
{13}   Para.Toptic.Add('仓 单 号');
{13}   Para.Ftype.Add('C');

{14}  Para.Field.Add('inout.countcontcost');
{14}  Para.Toptic.Add('包干标志');
{14}  Para.Ftype.Add('B');

{15}  Para.Field.Add('inout.contwithloca');
{15}  Para.Toptic.Add('包仓标志');
{15}  Para.Ftype.Add('B');

{16}  Para.Field.Add('inout.warerentcounttype');
{16}  Para.Toptic.Add('仓租计算方式');
{16}  Para.Ftype.Add('B');

{17}  Para.Field.Add('convert(datetime,convert(char(10),inout.operationdate,102))');
{17}  Para.Toptic.Add('出货日期');
{17}  Para.Ftype.Add('D');

{18}  Para.Field.Add('inout.createname');
{18}  Para.Toptic.Add('创 建 人');
{18}  Para.Ftype.Add('C');

{19}  Para.Field.Add('inout.operationname');
{19}  Para.Toptic.Add('出 货 人');
{19}  Para.Ftype.Add('C');

{20}  Para.Field.Add('inout.checkname');
{20}  Para.Toptic.Add('审 核 人');
{20}  Para.Ftype.Add('C');

{21}  Para.Field.Add('inout.jobno');
{21}  Para.Toptic.Add('工作单号');
{21}  Para.Ftype.Add('C');

  Para.Exp.Add('');

   Para.OnGetValue:=FindGetValue;
   Para.OnGetSql := FindGetSql;

   StrTmp:=DoFilter(Para, FindItem);

   if strTmp<>'null' then
   begin
      qrymain.Close;
      qrymain.DisableControls;
      if strTmp<>'' then
         qrymain.MacroByName('Where').AsString:=strTmp
      else
         qrymain.MacroByName('Where').AsString:=' 1=1 ';
      qrymain.Open;
      qrymain.EnableControls;
   end;
end;

procedure TfrmWareRateView.btnPrintClick(Sender: TObject);
begin
//
end;

function TfrmWareRateView.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
    1:
     begin
        qrySelect:=pGetCustomerSelect('A','');
        if qrySelect.FieldByName('cusid').AsString<>'NO' then
        begin
           PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
           PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
        end;
        freeandnil(qrySelect);
     end;
    2:
      begin
         qrySelect:=pGetOrganizationSelect('','','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            PItems[0]      :=qrySelect.FieldByName('username').asstring;
            PItemFields[0] :=qrySelect.FieldByName('userid').asstring;
         end;
         freeandnil(qrySelect);
      end;
    3:
      begin
        pItems.Assign(cmbSKUClass.Items);
        pItemFields.Assign(cmbSKUClass.ItemFields);
      end;
    6:
      begin
        pItems.Assign(rdgLoadType.Values);
        pItemFields.Assign(rdgLoadType.Values);
      end;
    7:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('保税');
         pItemFields.Add('F');
         pItems.Add('非保税');
      end;
    8:
      begin
         qrySelect:=pGetOperatorSelect('');
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            PItems[0] :=qrySelect.FieldByName('opname').asstring; 
            PItemFields[0]:=qrySelect.FieldByName('opid').asstring;
         end;
         qrySelect:=nil;
      end;
    14:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('包干');
         pItemFields.Add('F');
         pItems.Add('非包干');
      end;
    15:
      begin
         pItemFields.Clear;
         pItems.Clear;
         pItemFields.Add('T');
         pItems.Add('包仓');
         pItemFields.Add('F');
         pItems.Add('非包仓');
      end;
    16:
      begin
         pItems.Assign(cmbWareRentCountWay.Items);
         pItemFields.Assign(cmbWareRentCountWay.ItemFields);
      end;
    else
      Result:=False;
  end;
end;

procedure TfrmWareRateView.grdSKuChangeNodeEx(Sender: TObject);
begin
   qryWareCostRateSKu.Filtered:=false;
   if qrysku.fieldbyname('SNO').AsString<>'' then
      qryWareCostRateSKu.filter:='SNO='+qrysku.fieldbyname('SNO').AsString
   else
      qryWareCostRateSKu.filter:='SNO=-1';
   qryWareCostRateSKu.Filtered:=true;
end;

procedure TfrmWareRateView.pgcMainChange(Sender: TObject);
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
   end;
end;

procedure TfrmWareRateView.grdWareCostViewChangeNodeEx(Sender: TObject);
begin
   ScrollAfterEdit:=True;
   blnSku:=False;
   blnsku:=False;
   blninfo:=false;
   if (pgcMain.ActivePage=tbsEdit) and (blnqryInChange) then
      SetDetailActive(True,True);
end;

procedure TfrmWareRateView.btnBrowGlClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmWareRateView.btnBrowMxClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsedit;
end;

procedure TfrmWareRateView.grdWareCostViewDblClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmWareRateView.pgcwarerateviewChange(Sender: TObject);
begin
   if (not blninfo) and (pgcwarerateview.ActivePage=tbsInfo) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blninfo:=True;
   end else
   if (not blnsku) and (pgcwarerateview.ActivePage=tbsSku) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnsku:=True;
   end;
   if (not blnskubefore) and (pgcwarerateview.ActivePage=tbsSkuBefore) and (blnItemPage) then
   begin
      SetDetailActive(True,True);
      blnskubefore:=True;
   end;
end;

function TfrmWareRateView.FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
begin
   {
   }
end;

procedure TfrmWareRateView.CreateParams(var Params: TCreateParams);
begin
  if strpjobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  self.Caption:=strCaption;
  inherited CreateParams(Params);
end;

procedure TfrmWareRateView.MasterTableInit(pstrtable:string);
begin
   strtable:=pstrtable;
   strsql:='select Inout.Jobno,Inout.Userid,Inout.Username,Inout.blno,Inout.isbond, '+chr(13)+chr(10)
          +'       Inout.iuserid,Inout.iusername,Inout.TaskDate,Inout.LocationBillNO, '+chr(13)+chr(10)
          +'       Inout.OPERATIONDATE,INOUT.CustomsNO,LOADTYPE=isnull(loadtype,"F"), '+chr(13)+chr(10)
          +'       Inout.CreateName,Inout.operationname, '+chr(13)+chr(10)
          +'       Inout.checkname,Inout.CountName,SKUName, '+chr(13)+chr(10)
          +'       Inout.skucostclasscd, '+chr(13)+chr(10)
          +'       Inout.costcusid,Inout.costcusname, '+chr(13)+chr(10)
          +'       TASKDATErq=convert(char,Inout.TaskDate,102),'+chr(13)+chr(10)
          +'       TASKDATEsj=convert(char,Inout.TaskDate,108),'+chr(13)+chr(10)
          +'       Bsbz=case when isnull(ISBond,"F")="F" then "非" else "是" end, '+chr(13)+chr(10)
          +'       LoadTypeName=case when isnull(LOADTYPE,"F")="T" '+chr(13)+chr(10)
          +'                         then "整柜" else "散货" end, '+chr(13)+chr(10)
          +'       Inout.condes,Inout.cusbillno,inout.costcheckname, '+chr(13)+chr(10)
          +'       Inout.Quantity,Inout.Piece,Inout.Volume, '+chr(13)+chr(10)
          +'       Inout.NetWeight,Inout.GrossWeight,Inout.Area,inout.loadcosttype, '+chr(13)+chr(10)
          +'       Inout.mainorder,inout.WareRentCountType,CountWith1,COUNTRENT,COUNTCONTCOST '+chr(13)+chr(10)
          +'  from '+strtable+'  Inout(nolock)'+chr(13)+chr(10)
          +' where '+chr(13)+chr(10)
          +IIF(_Useridcan<>'',
              ' (  userid in '+_Useridcan+' or iuserid in '+_Useridcan+') ',
              ' (  userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or Inout.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
          +'   and (%Where) '+chr(13)+chr(10)
          //是否有定位查询信息
          +iif(trim(strJobno)='','',' and Inout.jobno="'+strJobno+'" ');
   qrymain.Close;
   qrymain.SQL.Clear;
   qrymain.SQL.Add(strsql);
end;

procedure TfrmWareRateView.grdskubeforeChangeNodeEx(Sender: TObject);
begin
   qryWareCostRateSKubefore.Filtered:=false;
   if qryskubefore.fieldbyname('SNO').AsString<>'' then
      qryWareCostRateSKubefore.filter:='SNO='+qryskubefore.fieldbyname('SNO').AsString
   else
      qryWareCostRateSKubefore.filter:='SNO=-1';
   qryWareCostRateSKubefore.Filtered:=true;
end;

procedure TfrmWareRateView.btnEditClick(Sender: TObject);
begin
   if not CheckModifyMode then Exit;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   SetMasterDetailState(false);
   WorkCall(stEdit);
end;

procedure TfrmWareRateView.btnSaveClick(Sender: TObject);
begin
   if (DataState in setDcs)   then //新增或编辑存盘
   begin
      try
         while True do
         begin
            try
               _ADOConnection.Starttransaction;
               qryContainer.ApplyUpdates;
               qryWareCostRateCon.Filtered:=False;
               qryWareCostRateCon.ApplyUpdates;
               qrysku.ApplyUpdates;
               qryWareCostRatesku.Filtered:=False;
               qryWareCostRateSKU.ApplyUpdates;
               if UpperCase(strtype)='VA' then
               begin
                  qryskubefore.ApplyUpdates;
                  qryWareCostRateskubefore.Filtered:=False;
                  qryWareCostRateskubefore.ApplyUpdates;
               end;
               Break;
            except
              _ADOConnection.Rollback; //先结束事务
              raise;
              exit;
            end;
         end;
         _ADOConnection.Commit;
      except
        _ADOConnection.rollback;
        raise;
        Exit;
      end;
      qryContainer.CommitUpdates;
      qryWareCostRateCon.CommitUpdates;
      qrysku.CommitUpdates;
      qryWareCostRateSKU.CommitUpdates;
      qryWareCostRateCon.Filtered:=True;
      qryWareCostRatesku.Filtered:=True;
      if UpperCase(strtype)='VA' then
      begin
         qryskubefore.CommitUpdates;
         qryWareCostRateskubefore.CommitUpdates;
         qryWareCostRateskubefore.Filtered:=True;
      end;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
   end;
end;

procedure TfrmWareRateView.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

   qryContainer.CancelUpdates;
   qryWareCostRateCon.CancelUpdates;
   qrysku.CancelUpdates;
   qryWareCostRateSKU.CancelUpdates;
   if UpperCase(strtype)='VA' then
   begin
   qryskubefore.CancelUpdates;
   qryWareCostRateskubefore.CancelUpdates;
   end;
   WorkCall(stBrowse);
end;

procedure TfrmWareRateView.grdWareCostRateConEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmWareRateView.grdWareCostRateSKuBeforeEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmWareRateView.grdWareCostRateSKuEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmWareRateView.mitConAddClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      qryWareCostRateCon.Append;
   end;
end;

procedure TfrmWareRateView.grdWareCostRateConEnter(Sender: TObject);
begin
   if (DataState in Setdcs) and (qryContainer.IsEmpty) then
   begin
      mitConAdd.Enabled:=False;
      mitConDel.Enabled:=False;
   end else if DataState in Setdcs then
   begin
      mitConAdd.Enabled:=True;
      mitConDel.Enabled:=True;
   end;
end;

procedure TfrmWareRateView.CostcdConValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and
      (CostcdCon.ItemFields.strings[CostcdCon.Items.IndexOf(grdWareCostRateCon.InplaceEditor.GetEditingText)]='CZ') then
   begin
      ErrorText:=GetMessage('frmWareRateView','001');
      Accept:=false;
      Exit;
   end;
   qryWareCostRateCon.edit;
   qryWareCostRateCon.FieldByName('costcd').AsString:=
              CostcdCon.ItemFields.strings[CostcdCon.Items.IndexOf(grdWareCostRateCon.InplaceEditor.GetEditingText)];
end;

procedure TfrmWareRateView.UserNameWareButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetPart(qryWareCostRateCon);
end;

procedure TfrmWareRateView.CusNameConButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetCus(qryWareCostRateCon);
end;

procedure TfrmWareRateView.GetCus(Query:TKADOQuery);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         Query.Edit;
         Query.Fieldbyname('cusid').asstring  :=qrySelect.FieldByName('cusid').AsString;
         Query.Fieldbyname('cusname').asstring:=qrySelect.FieldByName('cusname').AsString;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareRateView.GetPart(Query:TKADOQuery);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOrganizationSelect(_Userid,'U','F');
      if qrySelect.FieldByName('userid').AsString<>'NO' then
      begin
         Query.Edit;
         Query.FieldByName('Userid').AsString  :=qrySelect.FieldByName('userid').asstring;
         Query.FieldByName('UserName').AsString  :=qrySelect.FieldByName('username').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmWareRateView.mitConDelClick(Sender: TObject);
begin
   if (datastate in setdcs) and (not qryWareCostRateCon.IsEmpty) then
   begin
      qryWareCostRateCon.Delete;
   end;
end;

function TfrmWareRateView.CheckModifyMode:Boolean;
begin
   result:=False;
   OpenSql(datatmp.qrytmp,'select costcheckname,notautocalc '
                         +'  from cost(nolock) '
                         +' where jobno="'+qrymain.fieldbyname('jobno').asstring+'"');
   if dataTmp.qryTmp.fieldbyname('costcheckname').asstring<>'' then
   begin
      kMessageDlg(GetMessage('frmWareRateView','002'), mtWarning, [mbOK], 0);
      exit;
   end{ else if dataTmp.qryTmp.FieldByName('notautocalc').AsString<>'T' then
   begin
      kMessageDlg(GetMessage('frmWareRateView','003'), mtWarning, [mbOK], 0);
      exit;
   end};
   result:=true;
end;

function TfrmWareRateView.CheckCZCount:Boolean;
begin
   result:=False;
   if (pgcwarerateview.ActivePage=tbsSku) and (qrySKu.FieldByName('iscount').AsString='T') then
   begin
      kMessageDlg(GetMessage('frmWareRateView','004'), mtWarning, [mbOK], 0);
      exit;
   end else
   if pgcwarerateview.ActivePage=tbsSkuBefore then
   begin
      opensql(datatmp.qrytmp,'select iscount from locationinitem where jobno="'
                             +qrysku.fieldbyname('jobnoin').AsString+'"');
      if dataTmp.qryTmp.FieldByName('iscount').AsString='T' then
      begin
         kMessageDlg(GetMessage('frmWareRateView','004'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
   Result:=True;
end;

procedure TfrmWareRateView.grdWareCostRateSKuBeforeEnter(Sender: TObject);
begin
   if (DataState in Setdcs) and ((qryskubefore.IsEmpty) or not CheckCZCount) then
   begin
      mitBFadd.Enabled:=False;
      mitBFdel.Enabled:=False;
   end else if DataState in Setdcs then
   begin
      mitBFadd.Enabled:=True;
      mitBFdel.Enabled:=True;
   end;
end;

procedure TfrmWareRateView.grdWareCostRateSKuEnter(Sender: TObject);
begin
  if (DataState in Setdcs) and ((qrysku.IsEmpty) or (not CheckCZCount)) then
   begin
      mitadd.Enabled:=False;
      mitdel.Enabled:=False;
   end else if DataState in Setdcs then
   begin
      mitadd.Enabled:=True;
      mitdel.Enabled:=True;
   end;
end;

procedure TfrmWareRateView.mitBFaddClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      qryWareCostRateSKubefore.Append;
   end;
end;

procedure TfrmWareRateView.mitaddClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      qryWareCostRateSKu.Append;
   end;
end;

procedure TfrmWareRateView.mitBFdelClick(Sender: TObject);
begin
   if (datastate in setdcs) and (not qryWareCostRateSKubefore.IsEmpty) then
   begin
      qryWareCostRateSKubefore.Delete;
   end;
end;

procedure TfrmWareRateView.mitdelClick(Sender: TObject);
begin
   if (datastate in setdcs) and (not qryWareCostRateSKu.IsEmpty) then
   begin
      qryWareCostRateSKu.Delete;
   end;
end;

procedure TfrmWareRateView.UserNameSKUButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetPart(qryWareCostRateSKu);
end;

procedure TfrmWareRateView.CusNameRateSkuButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetCus(qryWareCostRateSKu);
end;

procedure TfrmWareRateView.UserNameSKUBeforeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetPart(qryWareCostRateSKubefore);
end;

procedure TfrmWareRateView.CusNameRateSkuBeforeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   GetCus(qryWareCostRateSKubefore);
end;

procedure TfrmWareRateView.RateUomTypeSkuValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   rateuomtype:string;
begin
   if (DataState in Setdcs) and (grdWareCostRateSKu.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareCostRateSKu.Edit;
      rateuomtype:=RateUomTypeSku.ItemFields.Strings[RateUomTypeSku.Items.indexof(grdWareCostRateSKu.InplaceEditor.GetEditingText)];
      if qrysku.fieldbyname(rateuomtype).asfloat=0 then
      begin
         errortext:=GetMessage('frmWareRateView','005');
         Accept:=false;
         Exit;
      end;
      qrywarecostratesku.FieldByName('quantity').AsFloat:=qrysku.fieldbyname(rateuomtype).AsFloat;
      qrywarecostratesku.FieldByName('rateuomtype').AsString:=rateuomtype;
      qryWareCostRateSKu.FieldByName('countuom').AsString:=
         GetUom(qrysku,rateuomtype);
   end;
end;

function TfrmWareRateView.GetUom(Query:TKADOQuery;uomtype:string):string;
begin
   if (uomtype='quantity') or (uomtype='area') or (uomtype='volume')
      or (uomtype='piece') then
   begin
      Result:=Query.fieldbyname(uomtype+'uom').AsString;
   end else if (uomtype='netweight') or (uomtype='grossweight') then
   begin
      result:=Query.fieldbyname('weightuom').AsString;
   end else Result:='';
end;

procedure TfrmWareRateView.RateUomTypeSkuBeforeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   rateuomtype:string;
begin
   if (DataState in setdcs) and (grdWareCostRateSKuBefore.InplaceEditor.GetEditingText<>'') then
   begin
      qryWareCostRateSKubefore.Edit;
      rateuomtype:=RateUomTypeSkuBefore.ItemFields.Strings[RateUomTypeSkuBefore.Items.indexof(grdWareCostRateSKuBefore.InplaceEditor.GetEditingText)];
      if qryskubefore.fieldbyname(rateuomtype).asfloat=0 then
      begin
         ErrorText:=GetMessage('frmWareRateView','005');
         Accept:=false;
         Exit;
      end;
      qryWareCostRateSKubefore.FieldByName('rateuomtype').AsString:=rateuomtype;
      qryWareCostRateSKubefore.FieldByName('countuom').AsString:=
         GetUom(qryskubefore,rateuomtype);
      qryWareCostRateSKubefore.FieldByName('quantity').AsFloat:=qryskubefore.fieldbyname(rateuomtype).AsFloat;

   end;
end;

procedure TfrmWareRateView.qryWareCostRateConBeforePost(DataSet: TDataSet);
begin
   if not PostCheck(grdWareCostRateCon) then Exit;
   if grdWareCostRateCon.DataLink.DataSet.State=dsinsert then
   begin
      maxWareCostRateCon:=maxWareCostRateCon+1;
      qryWareCostRateCon.FieldByName('ratesno').AsInteger:=maxWareCostRateCon;
      qryWareCostRateCon.FieldByName('sno').AsInteger:=-11;
      qryWareCostRateCon.FieldByName('jobno').AsString:=qrymain.fieldbyname('jobno').AsString;
   end;
end;

function TfrmWareRateView.PostCheck(TdxGrid:TdxDBGrid):Boolean;
begin
   result:=False;
   with TdxGrid do
   begin
      if DataLink.DataSet.State in [dsinsert,dsedit] then
      begin
         if ValueIsInvalid(FocusedNode.Values[UserNameSKUBefore.Index],UserNameSKUBefore.Field) then
         begin
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create('核算部门不可为空!');
         end else if ValueIsInvalid(FocusedNode.Values[CostcdSkuBefore.Index],CostcdSkuBefore.Field) then
         begin
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create('费用名称不可为空!');
         end else if ValueIsInvalid(FocusedNode.Values[CountWaySkuBefore.Index],CountWaySkuBefore.Field) then
         begin
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create('计费方式不可为空!');
         end else if ValueIsInvalid(FocusedNode.Values[CusNameRateSkuBefore.Index],CusNameRateSkuBefore.Field) then
         begin
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create('关系人不可为空!');
         end else if ValueIsInvalid(FocusedNode.Values[RateUomTypeSkuBefore.Index],RateUomTypeSkuBefore.Field) then
         begin
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create('单位类型不可为空!');
         end;
      end;
   end;
   result:=True;
end;
procedure TfrmWareRateView.RateValueSkuBeforeValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   i:Extended;
begin
   if (DataState in Setdcs) and (grdWareCostRateSKuBefore.InplaceEditor.GetEditingText<>'') then
   begin
      i:=StrToFloat(grdWareCostRateSKuBefore.InplaceEditor.GetEditingText);
      if i<=0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      qryWareCostRateSKubefore.FieldByName('ratevalue').AsFloat:=i;
   end;
end;

procedure TfrmWareRateView.RateValueSkuValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   i:Extended;
begin
   if (DataState in Setdcs) and (grdWareCostRateSKu.InplaceEditor.GetEditingText<>'') then
   begin
      i:=StrToFloat(grdWareCostRateSKu.InplaceEditor.GetEditingText);
      if i<=0 then
      begin
         ErrorText:=_strnumberzero;
         Accept:=False;
         exit;
      end;
      qryWareCostRateSKu.FieldByName('ratevalue').AsFloat:=i;
   end;
end;

procedure TfrmWareRateView.GridExitPost(sender:Tobject);
begin
   With TDxDbgrid(sender) do
   begin
      try
        if DataLink.DataSet.State in [dsinsert,dsedit] then
        begin
          DataLink.DataSet.Post;
        end;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmWareRateView.grdWareCostRateSKuExit(Sender: TObject);
begin
   GridExitPost(grdwarecostratesku);
end;

procedure TfrmWareRateView.grdWareCostRateSKuBeforeExit(Sender: TObject);
begin
   GridExitPost(grdWareCostRateSKuBefore);
end;

procedure TfrmWareRateView.grdWareCostRateConExit(Sender: TObject);
begin
   GridExitPost(grdWareCostRateCon);
end;

procedure TfrmWareRateView.qryWareCostRateSKubeforeBeforePost(
  DataSet: TDataSet);
begin
   if not PostCheck(grdWareCostRateSKuBefore) then Exit;
   if grdWareCostRateSKuBefore.DataLink.DataSet.State=dsinsert then
   begin
      maxWareCostRateskubefore:=maxWareCostRateskubefore;
      qryWareCostRateSKubefore.FieldByName('ratesno').AsInteger:=maxWareCostRateskubefore;
      qryWareCostRateSKubefore.FieldByName('sno').AsInteger:=qryskubefore.fieldbyname('sno').AsInteger;
      qryWareCostRateSKubefore.FieldByName('jobno').AsString:=qrymain.fieldbyname('jobno').AsString;
   end;
end;

procedure TfrmWareRateView.qryWareCostRateSKuBeforePost(DataSet: TDataSet);
begin
   if not PostCheck(grdWareCostRateSKu) then Exit;
   if grdWareCostRateSKu.DataLink.DataSet.State=dsinsert then
   begin
      maxWareCostRatesku:=maxWareCostRatesku+1;
      qryWareCostRateSKu.FieldByName('ratesno').AsInteger:=maxWareCostRatesku;
      qryWareCostRateSKu.FieldByName('sno').AsInteger:=qrysku.fieldbyname('sno').AsInteger;
      qryWareCostRateSku.FieldByName('jobno').AsString:=qrymain.fieldbyname('jobno').AsString;
   end;
end;

end.
