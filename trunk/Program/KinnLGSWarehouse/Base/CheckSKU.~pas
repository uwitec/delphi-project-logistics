unit CheckSKU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  SLV, KUpdateSql, dxDBTLCl, dxGrClms, DBClient, KDataSetProvider,libuserPub,GetDllPub ;

type
  TfrmCheckSKU = class(TForm)
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
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdSignDate: TdxDBDateEdit;
    KStatusBar1: TKStatusBar;
    txtJobno: TDBText;
    txtCreateUserName: TDBText;
    txtCHECKUSERNAME: TDBText;
    GMSStickyLabel4: TGMSStickyLabel;
    KGroupBox2: TKGroupBox;
    KSText4: TKSText;
    GMSStickyLabel2: TGMSStickyLabel;
    edtContractNO: TdxDBEdit;
    edtUsername: TdxDBButtonEdit;
    GMSStickyLabel20: TGMSStickyLabel;
    qryChkSKU: TKADOQuery;
    dtsChkSKU: TDataSource;
    qryTmp: TKADOQuery;
    ppmColumn: TPopupMenu;
    mitcheck: TMenuItem;
    mitcanclecheck: TMenuItem;
    grdCheckSKU: TdxDBGrid;
    dtsCheckSKUItem: TDataSource;
    qryCheckSKUItem: TKADOQuery;
    udsCheckSKUItem: TKadoUpdateSql;
    ppmCheckSKUItem: TPopupMenu;
    mitAddCheckSKUItem: TMenuItem;
    mitDeleteCheckSKUItem: TMenuItem;
    grdCheckSKUItem: TdxDBGrid;
    AccountNameTask: TdxDBGridButtonColumn;
    ShipperAccountNameTask: TdxDBGridButtonColumn;
    SKUNameTask: TdxDBGridButtonColumn;
    LotCodeTask: TdxDBGridColumn;
    QualityNameTask: TdxDBGridButtonColumn;
    QuantityUOMTask: TdxDBGridPickColumn;
    PieceTask: TdxDBGridCurrencyColumn;
    pieceuomTask: TdxDBGridPickColumn;
    VolumeTask: TdxDBGridCurrencyColumn;
    VolumeUOMTask: TdxDBGridPickColumn;
    areaTask: TdxDBGridCurrencyColumn;
    AreaUOMTask: TdxDBGridPickColumn;
    GrossWeightTask: TdxDBGridCurrencyColumn;
    NetWeightTask: TdxDBGridCurrencyColumn;
    WeightUOMTask: TdxDBGridPickColumn;
    Location_AdvanceNameTask: TdxDBGridButtonColumn;
    dtsCheckSKU: TDataSource;
    qryCheckSKU: TKADOQuery;
    udsCheckSKU: TKadoUpdateSql;
    qryFind: TKADOQuery;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    edtQuantityAct: TdxDBGridColumn;
    edtPieceAct: TdxDBGridColumn;
    edtAreaAct: TdxDBGridColumn;
    edtVolumeAct: TdxDBGridColumn;
    edtNetWeightAct: TdxDBGridColumn;
    edtGrossWeightAct: TdxDBGridColumn;
    txtCreateDate: TDBText;
    createdate: TdxDBGridColumn;
    createname: TdxDBGridColumn;
    actdate: TdxDBGridColumn;
    actname: TdxDBGridColumn;
    edtWO_Remark: TdxDBGridColumn;
    iusername: TdxDBGridColumn;
    edtSNO: TdxDBGridColumn;
    cusname: TdxDBGridColumn;
    shippercusname: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    qualityname: TdxDBGridColumn;
    edtCustomsNO: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    edtMainOrder: TdxDBGridColumn;
    begindate: TdxDBGridColumn;
    enddate: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    edtcusid: TdxDBButtonEdit;
    dtdReceDateF: TdxDBDateEdit;
    dtdReceDateT: TdxDBDateEdit;
    edtSKUID: TdxDBButtonEdit;
    CustomsNO: TdxDBEdit;
    MainOrder: TdxDBEdit;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    edtShipperAccount: TdxDBButtonEdit;
    edtQualityName: TdxDBButtonEdit;
    AccountBillNO: TdxDBEdit;
    edtLocationID: TdxDBButtonEdit;
    btnware: TKBitBtn;
    btnModify: TKBitBtn;
    ReMark: TdxDBGridColumn;
    edtremark: TdxDBBlobEdit;
    mitpct: TMenuItem;
    btnchecksku: TKBitBtn;
    QuantityTask: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    dtdSignDatext: TdxDBDateEdit;
    edtContractNOxt: TdxDBEdit;
    edtUsernamext: TdxDBButtonEdit;
    dtdReceDateFxt: TdxDBDateEdit;
    dtdReceDateTxt: TdxDBDateEdit;
    edtSKUIDxt: TdxDBButtonEdit;
    edtShipperAccountxt: TdxDBButtonEdit;
    edtLocationIDxt: TdxDBButtonEdit;
    edtremarkxt: TdxDBBlobEdit;
    cmbSKUCostClass: TKinDbPickEdit;
    GMSStickyLabel25: TGMSStickyLabel;
    cmbSKUCostClass2: TKinDbPickEdit;
    GMSStickyLabel27: TGMSStickyLabel;
    cmbseason: TKinDbPickEdit;
    GMSStickyLabel16: TGMSStickyLabel;
    cmbcxclass: TKinDbPickEdit;
    ppmprint: TPopupMenu;
    checkbb: TMenuItem;
    skumodel: TdxDBGridColumn;
    ManufactureDate: TdxDBGridColumn;
    jcmainorder: TdxDBGridColumn;
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

    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdCostItemAfterScroll(DataSet: TDataSet);
    procedure edtAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure pgcMainChange(Sender: TObject);
    procedure qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
//    procedure cmbCostcdEnter(Sender: TObject);
    procedure edtCTI_ReasonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitAddAttClick(Sender: TObject);
    procedure mitDeleteAttClick(Sender: TObject);
    procedure mitOpenAttClick(Sender: TObject);
    procedure grdCONTWITHLOCAChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure grdCheckSKUCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure grdCheckSKUDblClick(Sender: TObject);
    procedure mitDeleteCheckSKUItemClick(Sender: TObject);
    procedure qryCheckSKUItemAfterScroll(DataSet: TDataSet);
    procedure grdCheckSKUItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdCheckSKUItemExit(Sender: TObject);
    procedure grdCheckSKUItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCheckSKUItemChangeNodeEx(Sender: TObject);
    procedure grdCheckSkuItembeforeinsert;
    procedure AccountNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShipperAccountNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure SKUNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure Location_AdvanceNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameTaskButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitAddCheckSKUItemClick(Sender: TObject);
    procedure qryCheckSKUItemBeforePost(DataSet: TDataSet);
    procedure grdCheckSKUItemEnter(Sender: TObject);
    procedure edtUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure qryCheckSKUItemAfterPost(DataSet: TDataSet);
    procedure grdCheckSKUChangeNodeEx(Sender: TObject);
    procedure qryChkSKUUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure edtShipperAccountButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtQualityNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtcusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);

    procedure edtSKUIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtLocationIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnwareClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure mitpctClick(Sender: TObject);
    procedure btncheckskuClick(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure checkbbClick(Sender: TObject);

  private
    { Private declarations }
    //变量定义
    FindItem: TFindItem;               //查找
    strCTjobno:string;                 //重新取得工作号
    blnCopy,blnSaveError,blnWare:Boolean;
    strJobno,strDataBaseID:string;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    Bookmark: TBookmark;         //书签
    oldContWithLocaItem:string;
    sltContWithLocaItem:TStringList;
    sltCostCD,sltCostName:TstringList;//代码列表
    sltPayCd,sltPayName:TstringList;//结算方式
    sltCurrencyCd,sltCurrencyName:TstringList;
    strSql: string;
    FilterSql: string;
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    copyWho,copyWhoname,copyDate:String;//用于费用新增默认
    arrCheckSku,arrCheckSkuItem:Variant;
    maxCheckSKUItem:Integer; //修改时候用的
    blnModify:Boolean;

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
    procedure ScatterToLV;
  public
    { Public declarations }
  end;

procedure WorkCheckSku(CallMode:TDataState;pJobno,pDataBaseID:string);

var
  frmCheckSKU: TfrmCheckSKU;
  blnDelete:boolean;
implementation

{$R *.dfm}

uses Main,kindlg,Saveget,datas,find,libbb,
     GetUserRight,DocBook,dxGridOut,linprint,datasTmp,checkdetailcash;


procedure WorkCheckSku(CallMode:TDataState;pJobno,pDataBaseID:string);
var
  Filtersql:string;
  year,month,day:word;
  month_start,month_end:TDate;
  strMenuItemName:string;
begin
{crl if (_DB_Register<>'F') and (not _RegSucc) then
  begin
    opensql(qryTmp,'select count(*) recordcount from CONTWITHLOCA');
    if qrytmp.FieldByName('recordcount').AsInteger>100 then
    begin
       Kmessagedlg('对不起,本软件的试用期已到! 请您尽快向' + chr(13) + chr(13) +
                    '厦门新荆艺系统集成有限公司申请注册!', mtInformation, [mbOk], 0);
       exit;
    end;
  end;
  }

  if frmCheckSKU <> nil then
  with frmCheckSKU do
  begin
    if WindowState=wsMinimized then
       WindowState:=wsNormal;
    Show;
    Exit;
  end;
  strMenuItemName:='mitCheckSKU';
  frmCheckSKU:=TfrmCheckSKU.Create(application);
  with frmCheckSKU do
  begin
  {初始化所有数据集}
    //初始话变量
    blnCopy        :=False;             //系统默认不复制新增
    FindItem       :=TFindItem.Create;
    blnSaveError   :=False;
    mode           :=CallMode;
    strJobno       :=pJobno;
    strDataBaseID  :=pDataBaseID;
    ScrollAfterEdit:=True;

    sltContWithLocaItem:=TStringList.Create;
    sltCostCD    :=TStringList.Create;
    sltCostName  :=TStringList.Create;
    sltPayCd     :=TStringList.Create;
    sltPayName   :=TStringList.Create;
    sltCurrencyCd   :=TStringList.Create;
    sltCurrencyName :=TStringList.Create;
    //件数单位
    QuantityUOMTask.Items.Clear;
    PieceUOMTask.Items.Clear;
//    CasingONEUOMTask.Items.Clear;
//    CasingTWOUOMTask.Items.Clear;
//    CasingTHRUOMTask.Items.Clear;
 //   CasingFOUUOMTask.Items.Clear;

    OpenSql(qryTmp, 'Select UOM,UOMName From UOM Where UOMType="件数" order by UOM');
    while (not qryTmp.Eof) do
    begin
      QuantityUOMTask.items.add(qryTmp.Fieldbyname('UOM').asstring);
      qryTmp.Next;
    end;
    qryTmp.Close;

    PieceUOMTask.Items.Assign(QuantityUOMTask.items);
//    CasingONEUOMTask.Items.Assign(QuantityUOMTask.items);
//    CasingTWOUOMTask.Items.Assign(QuantityUOMTask.items);
//    CasingTHRUOMTask.Items.Assign(QuantityUOMTask.items);
//    CasingFOUUOMTask.Items.Assign(QuantityUOMTask.items);
//    TagEachUOMTask.Items.Assign(QuantityUOMTask.items);

        //体积单位
    VolumeUOMTask.Items.Clear;
    OpenSql(qryTmp, 'Select UOM,UOMName From UOM Where UOMType="体积" order by UOM');
    while (not qryTmp.Eof) do
    begin
      VolumeUOMTask.Items.add(qryTmp.Fieldbyname('UOM').asstring);
      qryTmp.Next;
    end;
    qryTmp.Close;
    //重量单位
    WeightUOMTask.Items.Clear;
    OpenSql(qryTmp, 'Select UOM,UOMName From UOM Where UOMType="重量" order by UOM');
    while (not qryTmp.Eof) do
    begin
      WeightUOMTask.Items.add(qryTmp.Fieldbyname('UOM').asstring);
      qryTmp.Next;
    end;
    qryTmp.Close;
    //面积单位
    AreaUOMTask.Items.Clear;
    OpenSql(qryTmp, 'Select UOM,UOMName From UOM Where UOMType="面积" order by UOM');
    while (not qryTmp.Eof) do
    begin
      AreaUOMTask.Items.add(qryTmp.Fieldbyname('UOM').asstring);
      qryTmp.Next;
    end;
    qryTmp.Close;

     if _StrSysCus='JG' then
     begin
        GMSStickyLabel16.Visible:=true;
        cmbcxclass.Visible:=true;
 //        cmbcxclass.Item:='';
     end;


    //lzw20101124
    if _strsyscus='XT' then
    begin
       skuspec.visible:=true;
       color.visible:=true;
       LotCodeTask.visible:=false;
       PieceTask.visible:=false;
       pieceuomTask.visible:=false;
       VolumeTask.visible:=false;
       VolumeUOMTask.visible:=false;
       areaTask.visible:=false;
       AreaUOMTask.visible:=false;
       GrossWeightTask.visible:=false;
       NetWeightTask.visible:=false;
       WeightUOMTask.visible:=false;
       KGroupBox3.visible:=true;
       KGroupBox1.visible:=false;
       btncheck.Caption:='检验';
       //计费商品类
       InitdbPick(cmbSKUCostClass,' SKUCostClass','rtrim(SKUCostClassCD)','rtrim(SKUCostClassName)','1=1');
       cmbSKUCostClass2.items.clear;
       cmbSKUCostClass2.itemfields.clear;
       cmbSKUCostClass2.Items.Add('衣服');
       cmbSKUCostClass2.Itemfields.Add('衣服');
       cmbSKUCostClass2.Items.Add('男鞋');
       cmbSKUCostClass2.Itemfields.Add('男鞋');
       cmbSKUCostClass2.Items.Add('童鞋');
       cmbSKUCostClass2.Itemfields.Add('童鞋');
       cmbSKUCostClass2.Items.Add('男裤');
       cmbSKUCostClass2.Itemfields.Add('男裤');
       cmbSKUCostClass2.Items.Add('童装');
       cmbSKUCostClass2.Itemfields.Add('童装');
       cmbSKUCostClass2.Items.Add('AAA');
       cmbSKUCostClass2.Itemfields.Add('AAA');
       cmbSKUCostClass2.Items.Add('女鞋');
       cmbSKUCostClass2.Itemfields.Add('女鞋');
       cmbSKUCostClass2.Items.Add('女裤');
       cmbSKUCostClass2.Itemfields.Add('女裤');
       cmbSKUCostClass2.Items.Add('男衣');
       cmbSKUCostClass2.Itemfields.Add('男衣');
       cmbSKUCostClass2.Items.Add('女衣');
       cmbSKUCostClass2.Itemfields.Add('女衣');
    end;
    if _strsyscus='JG' then
    begin
        skuspec.visible:=true;
        skuspec.Caption:='商品型号';        //lihl 20120521
    end;
    //假主库
    strSql:='select cksku.jobno,cksku.createdate,cksku.createname,cksku.actdate,cksku.actname,   '+chr(13)+chr(10)
           +'       cksku.iusername,cksku.iuserid,cksku.remark,cksku.cusname,cksku.cusid,    '+chr(13)+chr(10)
           +'       cksku.shippercusname,cksku.shippercusid,cksku.skuname,cksku.skuid,    '+chr(13)+chr(10)
           +'       cksku.customsno,cksku.cusbillno,cksku.mainorder,checked,ischeckname,     '+chr(13)+chr(10)
           +'       cksku.begindate,cksku.enddate,cksku.locname,qualityname=isnull(quality,""), '+chr(13)+chr(10)
           +'       keyid=cksku.jobno,skucostclasscd,skucostclasscd2,season   '+chr(13)+chr(10)
           +'  from checksku cksku(nolock)           '
           //lzw20100715
           +' where 1=1 '
           +'   and %Where ';
    qryCHKSKU.Close;
    qryCHKSKU.Sql.Clear;
    qryCHKSKU.Sql.Add(strSql);
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
      if _istask='T' then
        // FilterSql:='  isnull(Inout.OperationUserName,"")=""    '
      else
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
      end;
    end else FilterSql:='';

//crl   if _LIONODATA='T' then  FilterSql:=' 1=2 ';
//crl    qryCHKSKU.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');
    //主库
    strSql:='select cksku.userid,cksku.actdate,cksku.shippercusname,cksku.shippercusid, '+chr(13)+chr(10)
           +'       cksku.cusid,cksku.cusname,cksku.iuserid,cksku.iusername,qualityname=cksku.quality, '+chr(13)+chr(10)
           +'       cksku.skuname,cksku.skuid,cksku.mainorder, '+chr(13)+chr(10)
           +'       cksku.actname,cksku.cusbillno,cksku.begindate, '+chr(13)+chr(10)
           +'       cksku.enddate,cksku.customsno,cksku.locname,cksku.locid,'+chr(13)+chr(10)
           +'       cksku.remark,cksku.createname,cksku.createdate, '+chr(13)+chr(10)
           +'       cksku.checkname,cksku.jobno,skucostclasscd,skucostclasscd2,season,cxclass  '+chr(13)+chr(10)
           +' from checksku cksku(nolock)  '+chr(13)+chr(10)
           +' where cksku.jobno=:jobno ' ;

    qryCheckSKU.Close;
    qryCheckSKU.Sql.Clear;
    qryCheckSKU.Sql.Add(strSql);

    //明细
    strSql:='select mainorder,jobno,sno,cusname,cusid,shippercusname,shippercusid,skuname,skuid,lotcode,skumodel,skuspec, '+chr(13)+chr(10)
           +'       qualityname,quantity,quantityuom,piece,pieceuom,volume,volumeuom,area,ManufactureDate, '+chr(13)+chr(10)
           +'       areauom,grossweight,netweight,weightuom,locname,locid,quantityact,'+chr(13)+chr(10)
           +'       pieceact,areaact,volumeact,netweightact,grossweightact,remark, '+chr(13)+chr(10)
           +'       jobno_in_f,sno_in_f,ld_sno_in_f,isbond,color,skuspec,customerno '+chr(13)+chr(10)
           +' from checkskuitem(nolock) '+chr(13)+chr(10)
           +' where jobno=:jobno order by sno asc  ';

    qryCheckSKUItem.Close;
    qryCheckSKUItem.Sql.Clear;
    qryCheckSKUItem.Sql.Add(strsql);

    // 界面显示过程
    if mode=stInsert then
    begin
      SetControlState(stInsert,true);
      qryChkSKU.open;

    end else
    begin
      if _loginId<>'SYSTEM' then
      //lzw20120105
      SetButtonEnabled(ToolPanel,strMenuItemName,trim(_userorgid));//设置按钮的有效性
      blnModify:=btnModify.Enabled;
      SetControlState(stBrowse,true);
      qryChkSKU.Open;
      if strJobno<>''
      then qryChkSKU.locate('Jobno;DataBaseID',VarArrayOf([strJobno,strDataBaseID]),[loCaseInsensitive]);
      WorkCall(stBrowse);
    end;
    {激活FORM}
     if strJobno<>'' then
     begin
       Top := Top +100;
       ShowModal;
       Free;
     end else
     Show;
  end;
end;
procedure TfrmCheckSKU.grdCheckSKUItemEnter(Sender: TObject);
begin
  if (datastate in setDcs) and (qrycheckskuitem.fieldbyname('sno').AsInteger=0) then
  begin
    if (qryCheckSKU.FieldByName('checkname').AsString='') or (blnModify) then
//crl    if (qryCheckSKU.FieldByName('checked').AsString<>'T') or (blnModify) then
    mitAddCheckSKUItemClick(Sender);
  end;
end;

procedure TfrmCheckSKU.WorkCall(CallMode:TDataState);
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
          qryChkSKU.Edit;
          qryCheckSKU.Edit;
          EnableEdit;
          //记录修改档案
          qryCheckSKUItem.Edit;
          //在修改的状态下，对qryCheckSKUItem循环，为sltCheckSKUItem赋值

          qryCheckSKUItem.DisableControls;
          Bookmark:= qryCheckSKUItem.GetBookmark;
          maxCheckSKUItem:=0;
          qryCheckSKUItem.First;
          while not qryCheckSKUItem.Eof do
          begin
            if qryCheckSKUItem.FieldByName('sno').AsInteger>maxCheckSKUItem then
            maxCheckSKUItem:=qryCheckSKUItem.FieldByName('sno').AsInteger;
            qryCheckSkuitem.Next;
          end;
          qryCheckSKUItem.GotoBookmark(Bookmark);
          qryCheckSKUItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          qryCheckSKUItem.EnableControls;
          qryCheckSKUItemAfterScroll(qryCheckSKUItem);
         //在修改的状态下，对qryCostItem循环
         // qryCostItem.DisableControls;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qryChkSku.Append;
          qryCheckSKU.Append;
         // sltCheckSKUItem.Clear;
         // oldCheckSKUItem:='';
          cmbcxclass.ItemIndex:=1;
          InitValues;
          EnableEdit;
          //记录档案创建信息
          qryCheckSKU.Edit;
          qryCheckSKU.FieldByName('createname').Asstring:=_LoginName;
          qryCheckSKU.fieldByname('createdate').AsDatetime:=date;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmCheckSKU.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
  SetControlState(DataState,False);
  if qryChksku.FieldbyName('actdate').AsString='' then
  begin
    if _strsyscus='XT' then
       ActiveControl:=dtdSignDatext
    else
       ActiveControl:=dtdSignDate;
  end
  else
  //  ActiveControl:=grdCostItem;
end;

procedure TfrmCheckSKU.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if qryChkSku.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
  SetControlState(DataState,False);
end;

procedure TfrmCheckSKU.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmCheckSKU.InitValues;
{初始化时自动生成仓位代码}
begin
  strCTJobno:=genJobno('CS',_DataBaseID);

  if blnCopy then
  begin
    blnCopy:=False;
    //qryCostEdit复制
    //GatherFromArray(qryCheckSKU,arrCheckSKU,false);
    qryCheckSKU.FieldByName('jobno').Asstring:=strCTJobno;
//crl    qryCheckSKU.fieldByname('DataBaseID').AsString:=_DataBaseID;
    qryCheckSKU.fieldByname('userid').AsString:=_userid;
    qryCheckSKU.FieldByName('checkname').Asstring:='';
    qryCheckSKU.FieldByName('checkdate').Clear;
//crl    qryCheckSKU.FieldByName('CountUserName').Asstring:='';
//crl    qryCheckSKU.FieldByName('CountDate').Clear;
    qryCheckSKU.FieldByName('actname').Asstring:='';
    qryCheckSKU.FieldByName('actdate').Clear;
//crl    qryCheckSKU.FieldByName('CL_BreakDate').Clear;
//crl    qryCheckSKU.FieldByName('LastCountDate').Clear;
    //qryCheckSKUItem复制
    qryCheckSKUItem.DisableControls;
    //GatherFromArray(qryCheckSKUItem,arrCheckSKUITEM,true);
    with qryCheckSKUItem do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('JOBNO').AsString:=strCTJobno;
//crl        fieldByname('DataBaseID').AsString:=_DataBaseID;
        FieldByName('UserID').Asstring:=_UserID;

       // sltCheckSKUItem.Add(qryCheckSKUItem.FieldByName('LocationID').AsString);
        next;
      end;
      First;
    end;
    qryCheckSKUItem.EnableControls;
    qryCheckSKUItemAfterScroll(qryCheckSKUItem);
  end else
  begin
    //qryCheckSKU
    qryCheckSKU.FieldByName('JOBNO').Asstring:=strCTJOBNO;
//crl    qryCheckSKU.fieldByname('DataBaseID').AsString:=_DataBaseID;
    qryCheckSKU.FieldByName('UserID').Asstring:=_UserID;
    cmbcxclass.Focused;
    cmbcxclass.TextField:='1';
    cmbcxclass.Text:='货架区盘点';
    //qryCheckSKU.FieldByName('CostCurrency').Asstring:='RMB';
    //qryCheckSKU.FieldByName('AreaUOM').Asstring:=_AreaUOM;
  end;
end;

procedure TfrmCheckSKU.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
  if blnConnect then
  begin
  //  qryCostItem.datasource:=dtsCheckSKU;
     qryCheckSKUItem.datasource:=dtsChkSKU;
    qryCheckSKU.datasource:=dtsChkSKU;
   // qryDocBook.datasource:=dtsCheckSKU;
  end else
  begin
    //qryCostItem.DataSource:=nil;
    qryCheckSKUItem.datasource:=nil;
    qryCheckSKU.datasource:=nil;
  //  qryDocBook.datasource:=nil;
  end;
end;

procedure TfrmCheckSKU.SetControlState(CallMode:TDataState;blnCreate:Boolean);
//设置界面元素的visible,enable属性
// CallMode：form的状态
// blnCreate：是否是创建时期

begin
{  if CallMode in SetDcs then
  begin
    //dtdBreakDate.ReadOnly:=True;
    if qryCheckSKU.FieldByName('CheckUserName').AsString<>'' then
    begin
      KGroupBox1.Enabled:=False;
    //  KGroupBox4.Enabled:=False;
     // grdCheckSKUItem.ReadOnly:=True;
      libWinControl(self,grdCheckSKUItem,True);
    end else
    begin
     libWinControl(self,grdCheckSKUItem,True);
    end;
  end else
  begin
   // dtdBreakDate.ReadOnly:=True;
  end;}
end;

function TfrmCheckSKU.Gather:boolean;
{变量值更新数据库前,对值处理过程}
begin
  Result:=False;
  if _strsyscus='XT' then
  begin
     if dtdSignDatext.Date=0 then
     begin
        Kmessagedlg('清点日期不可为空！', mtInformation,[mbOk],0);
        dtdSignDatext.setFocus;
        exit;
     end else
       if (qryCheckSKUItem.FieldByName('sno').AsString='') then
     begin
        KMessageDlg('SNO不能为空！',mtInformation,[mbok],0);
        Exit;
     end else
     if  (qrychecksku.FieldByName('iuserid').AsString='') or (qrychecksku.FieldByName('iusername').AsString='') then
     begin
        Kmessagedlg('执行部门不可为空！', mtInformation,[mbOk],0);
        edtUsernamext.setFocus;
        exit;
     end
  end else
  begin
     if dtdSignDate.Date=0 then
     begin
        Kmessagedlg('清点日期不可为空！', mtInformation,[mbOk],0);
        dtdSignDate.setFocus;
        exit;
     end else
       if (qryCheckSKUItem.FieldByName('sno').AsString='') then
     begin
        KMessageDlg('SNO不能为空！',mtInformation,[mbok],0);
        Exit;
     end else
     if  (qrychecksku.FieldByName('iuserid').AsString='') or (qrychecksku.FieldByName('iusername').AsString='') then
     begin
        Kmessagedlg('执行部门不可为空！', mtInformation,[mbOk],0);
        edtUsername.setFocus;
        exit;
     end;
  end;

  qrychecksku.edit;
  qrycheckskuitem.edit;
  qrychecksku.FieldByName('userid').AsString:=_userid;

  qrycheckskuitem.FieldByName('jobno').AsString:=qrychecksku.fieldbyname('jobno').AsString;

  qrycheckskuitem.FieldByName('jobno_in_f').AsString:='';
  qrycheckskuitem.FieldByName('sno_in_f').AsInteger:=-2;
  qrycheckskuitem.FieldByName('ld_sno_in_f').AsInteger:=-2;


  qrychksku.Edit;
  qrychksku.FieldByName('createdate').AsString:=qrychecksku.fieldbyname('createdate').AsString;
  qrychksku.FieldByName('createname').AsString:=qrychecksku.fieldbyname('createname').AsString;
  qrychksku.FieldByName('actname').AsString:=qrychecksku.fieldbyname('actname').AsString;
  qrychksku.FieldByName('actdate').AsString:=qrychecksku.fieldbyname('actdate').AsString;
  qrychksku.FieldByName('iuserid').AsString:=qrychecksku.fieldbyname('iuserid').AsString;
  qrychksku.FieldByName('iusername').AsString:=qrychecksku.fieldbyname('iusername').AsString;
  qrychksku.FieldByName('remark').AsString:=qrychecksku.fieldbyname('remark').AsString;
  qrychksku.FieldByName('cusid').AsString:=qrychecksku.fieldbyname('cusid').AsString;
  qrychksku.FieldByName('cusname').AsString:=qrychecksku.fieldbyname('cusname').AsString;
  qrychksku.FieldByName('shippercusid').AsString:=qrychecksku.fieldbyname('shippercusid').AsString;
  qrychksku.FieldByName('shippercusname').AsString:=qrychecksku.fieldbyname('shippercusname').AsString;
  qrychksku.FieldByName('skuname').AsString:=qrychecksku.fieldbyname('skuname').AsString;
  qrychksku.FieldByName('skuid').AsString:=qrychecksku.fieldbyname('skuid').AsString;
  qrychksku.FieldByName('qualityname').AsString:=qrychecksku.fieldbyname('qualityname').AsString;
  qrychksku.FieldByName('customsno').AsString:=qrychecksku.fieldbyname('customsno').AsString;
  qrychksku.FieldByName('cusbillno').AsString:=qrychecksku.fieldbyname('cusbillno').AsString;
  qrychksku.FieldByName('mainorder').AsString:=qrychecksku.fieldbyname('mainorder').AsString;
  qrychksku.FieldByName('begindate').AsString:=qrychecksku.fieldbyname('begindate').AsString;
  qrychksku.FieldByName('enddate').AsString:=  qrychecksku.fieldbyname('enddate').AsString;
  qrychksku.FieldByName('locname').AsString:=  qrychecksku.fieldbyname('locname').AsString;
  qrychksku.FieldByName('jobno').AsString:=qrychecksku.fieldbyname('jobno').AsString;


  Result:=True;

end;


procedure TfrmCheckSKU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmCheckSKU.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdCheckSKU);
  SetDxDbGrid(grdCheckSKUItem);
//  SetGroupbox(KGroupBox3);
//  SetGroupbox(KGroupBox5);
//  SetDxDbGrid(grdCheckSKU);
//  SetDxDbGrid(grdCostItem);
  pgcMain.ActivePage:=tbsBrowse;
  //lvAttachment图表初始化
  FLargeImages := GetFileLargeImages;
  FSmallImages := GetFileSmallImages;
  //初始化附件图标列表
//  InitFileImageList(lvAttachment,FSmallImages,FLargeImages);
   qryChkSKU.Connection:=_ADOConnection;
   qryCheckSKU.Connection:=_ADOConnection;
   qryCheckSKUItem.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
   qryFind.Connection:=_ADOConnection;
end;

procedure TfrmCheckSKU.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
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

procedure TfrmCheckSKU.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
//  sltCheckSKUItem.Free;
  Application.onShowhint := nil;
  frmCheckSKU:=nil
end;

procedure TfrmCheckSKU.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
end;

procedure TfrmCheckSKU.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
end;

procedure TfrmCheckSKU.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmCheckSKU.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
//crl  strDataBaseID:string;
begin
  strXmh:=qryChkSKU.fieldbyname('keyid').asstring;
//crl  strDataBaseID:=qryChkSKU.fieldbyname('DataBaseID').asstring;
  qryChkSKU.DisableControls;
  qryChkSKU.Close;
  qryChkSKU.Open;
  qryCheckSKUItem.Close;
  qryCheckSKUItem.Open;
  qryCheckSKU.Close;
  qryCheckSKU.Open;
  try
    qryChkSKU.locate('keyid',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    qryChkSKU.Last;
  end;
  qryChkSKU.EnableControls;
end;

procedure TfrmCheckSKU.btnEditClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  SetDetailActive(False,True);
  SetMasterDetailState(False);
  qryCheckSku.Active:=True;
  qryCheckSkuitem.Active:=True;
  WorkCall(stEdit);
end;

procedure TfrmCheckSKU.btnAddClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  qryCheckSku.Active:=True;
  qryCheckSkuitem.Active:=True;
  ScrollAfterEdit:=True;
  SetDetailActive(False,True);
  Workcall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmCheckSKU.btnDeleteClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

  if KmessageDlg('该操作将删除该项目的所有内容，您确定要删除吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    qryCheckSku.Active:=True;
    qryCheckSkuitem.Active:=True;
    SetMasterDetailState(False);
    _ADOConnection.startTransaction;
    try
     ExecSql(qryTmp,'delete from  CheckSKUItem '
                     +' where jobno="'+qryCheckSKU.FieldByName('jobno').AsString+'" ');
//crl       TdxDBGridNode(grdCheckSKU.FocusedNode).Delete;
       qryChecksku.Delete;
       qryCheckSKU.Applyupdates;
       _ADOConnection.Commit;
    except
       try
         _ADOConnection.RollBack;
       except
       end;
       SetMasterDetailState(True);
       raise;
       exit;
    end;
    qryCheckSKU.CommitUpdates;

    SetMasterDetailState(True);
    workcall(stbrowse);
  end;
end;


procedure TfrmCheckSKU.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add('CheckSKU CheckSKU ');

{0}   para.field.add('CheckSKU.ContractNO');
{1}   para.field.add('CheckSKU.SignDate');
{2}   para.Field.add('CheckSKU.CL_Rent');
{3}   para.Field.add('CheckSKU.Jobno');

   Para.Exp.add('');

{0}   Para.Toptic.Add('合同编号');
{1}   Para.Toptic.Add('签订日期');
{2}   Para.Toptic.Add('月 租 金');
{3}   Para.Toptic.add('工 作 号');

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('D');
{2}   Para.Ftype.add('N');
{3}   para.Ftype.add('C');

   Para.RField.add('CheckSKU.jobno');
   Para.RField.add('CheckSKU.DataBaseID');

   if filterSql <> ''
      then Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(qryCheckSKU, qryFind, Para, TFindItem(nil));
end;

procedure TfrmCheckSKU.btnRefindClick(Sender: TObject);
begin
   DoRefind(qryCheckSKU,qryFind);
end;

procedure TfrmCheckSKU.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   Para:=TFindPara.Create;

  Para.Tables.Add('checksku INOUT');

{2}   Para.Field.Add('INOUT.WO_Userid');
{9}   Para.Field.Add('INOUT.SKUName');
{12}  Para.Field.Add('convert(datetime,convert(char(10),INOUT.taskdate,102))');
{18}  Para.Field.Add('INOUT.ShipperAccountID');
{22}  Para.Field.Add('INOUT.CreateUserName');


  Para.Exp.Add('');
{2}   Para.Toptic.Add('执行仓库');
{9}   Para.Toptic.Add('商品名称');
{12}   Para.Toptic.Add('计划日期');
{18}   Para.Toptic.Add('寄仓单位');
{2}   Para.Ftype.Add('E');
{12}   Para.Ftype.Add('D');
{18}   Para.Ftype.Add('E');
{21}   Para.Ftype.Add('E');
  Para.OnGetValue:=FindGetValue;
//  Para.OnGetSql := FindGetSql;

  StrTmp:=DoFilter(Para, FindItem);

  if strTmp<>'null' then
  begin
    qryCHKSKU.Close;
    qryCHKSKU.DisableControls;
    if strTmp<>'' then
      qryCHKSKU.MacroByName('Where').AsString:=strTmp
    else
      qryCHKSKU.MacroByName('Where').AsString:=' 1=1 ';
    qryCHKSKU.Open;
    qryCHKSKU.EnableControls;
  end;
  WorkCall(stBrowse);
end;

procedure TfrmCheckSKU.btnSaveClick(Sender: TObject);
begin
  if ((DataState in setDcs) and Gather) then //新增或编辑存盘
  begin
    try
      blnWare:=True;
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          qryCheckSKU.ApplyUpdates;
          qrychksku.Edit;
          qrychksku.FieldByName('keyid').AsString:=qryCheckSKU.FieldByName('jobno').AsString;
        //  qryChkSKU.ApplyUpdates;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             udsCheckSKU.modifysql.text + chr(13) +
             udsCheckSKU.DeleteSql.text + chr(13) +
             udsCheckSKU.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             blnWare:=False;
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet('工作号' + qryCheckSKU.FieldByName('Jobno').AsString + '已经被使用。程序正在查找其他可用客户编号...');
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               strCTjobno := genJobno('CS',_DataBaseID);
               if strCTjobno = '' then
               begin
                 KmessageDlg('没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.', mtInformation, [mbOk], 0);
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 qryCheckSKU.Edit;
                 qryCheckSKU.FieldByName('Jobno').AsString := strCTJobno;
                 qryCheckSKU.FieldByName('KeyID').AsString :=qryCheckSKU.FieldByName('Jobno').AsString;
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
            lblError.caption := '找到可用客户编号' + strCTjobno + '，该客户编号改为' + strCTjobno + '。';
            btnCancel.visible := false;
            btnOk.visible := true;
            free;
          end;
        end;
      end;
      if not blnWare then
      begin
        //包仓
        qryCheckSKUItem.DisableControls;
        qryCheckSKUItem.first;
        while not qryCheckSKUItem.eof do
        begin
           qryCheckSKUItem.Edit;
           qryCheckSKUItem.fieldbyname('JOBNO').asstring:=qryCheckSKU.fieldbyname('JOBNO').asstring;
           qryCheckSKUItem.Post;
           qryCheckSKUItem.next;
        end;
        qryCheckSKUItem.first;
        qryCheckSKUItem.EnableControls;

        //相关文档
{        qryDocBook.DisableControls;
        qryDocBook.first;
        while not qryDocBook.eof do
        begin
           qryDocBook.Edit;
           qryDocBook.fieldbyname('JOBNO').asstring:=qryCheckSKU.fieldbyname('JOBNO').asstring;
           qryDocBook.Post;
           qryDocBook.next;
        end;
        qryDocBook.first;
        qryDocBook.EnableControls;      }
      end;
      qryCheckSKUItem.applyupdates;
//      qryDocBook.ApplyUpdates;

      _ADOConnection.Commit;
    except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    //qrychksku.commitupdates;
    qryCheckSKU.commitUpdates;
    qryCheckSKUItem.commitUpdates;
//    qryDocBook.commitUpdates;

    ScrollAfterEdit:=False;
    SetMasterDetailState(True);
    WorkCall(stBrowse);
    btnRefreshClick(Sender);
  end;
end;

procedure TfrmCheckSKU.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg('您对资料的修改将全部取消，确认要放弃吗？',mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  qryCheckSKUItem.CancelUpdates;
  qryCheckSKU.CancelUpdates;
  ScatterToLV;

  SetMasterDetailState(True);
  WorkCall(stBrowse);
  if qryCheckSKU.fieldbyname('jobno').asstring=''
  then btnRefreshclick(self);
end;

procedure TfrmCheckSKU.btnCheckClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  if qryChkSKU.FieldByName('Checked').AsString='T' then
  begin
     KmessageDlg('该笔盘点已经完成！',mtConfirmation,[mbOK],0);
  end else
  begin
     if _StrSysCus='XT' then
     begin
        workcheckdetailcash(qryChkSKU.FieldByName('jobno').AsString);
     end else
     begin
        ExecSql(qryTmp,' update Checksku set Checked="T",ischeckname="'+_loginname+'" '
                      +'  where jobno="'+qryChkSKU.FieldByName('Jobno').AsString+'" '
                      );
     end;

     KmessageDlg('操作成功！',mtConfirmation,[mbOK],0);
     btnRefreshclick(self);
  end;
end;

procedure TfrmCheckSKU.mitFilterActiveClick(Sender: TObject);
begin
  grdCheckSKU.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmCheckSKU.grdCostItemAfterScroll(DataSet: TDataSet);
begin
{  if DataState in Setdcs then
  begin
    if (qryCostItem.FieldByName('SNO').AsInteger<>-10) and
       (qryCostItem.FieldByName('SNO').AsInteger<>0) then
    begin
      cmbCostcd.ReadOnly:=True;
      edtCostSKU.ReadOnly:=True;
      dtdCti_Date.ReadOnly:=True;
      edtCti_in.ReadOnly:=True;
      edtCti_out.ReadOnly:=True;
      edtCti_who.ReadOnly:=True;
      cmbCti_currCd.ReadOnly:=True;
      edtCostRemark.ReadOnly:=True;
    end else
    begin
      cmbCostcd.ReadOnly:=False;
      edtCostSKU.ReadOnly:=False;
      dtdCti_Date.ReadOnly:=False;
      edtCti_in.ReadOnly:=False;
      edtCti_out.ReadOnly:=False;
      edtCti_who.ReadOnly:=False;
      cmbCti_currCd.ReadOnly:=False;
      edtCostRemark.ReadOnly:=False;
    end;
  end;  }
end;




{function TfrmCheckSKU.grdCostItemCheckInsert(DataSet: TDataSet;
  var Control: TWinControl): Boolean;
begin
  result:=false;
  if (qryCostItem.fieldByname('CostCD').asString<>'')  then
    result:=true;
end; }

procedure TfrmCheckSKU.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if not ScrollAfterEdit and blnOpen then
  begin
    if qryCheckSkuItem.Active then
    begin
      qryCheckSkuItem.Close;
      qryCheckSkuItem.Open;
    end;
    if qryCheckSku.Active then
    begin
      qryCheckSku.Close;
      qryCheckSku.Open;
    end;
    ScrollAfterEdit:=True;
  end;
  if not blnPage then
  begin
    qryCheckSKUItem.Active :=blnOpen;
    qryCheckSKU.Active :=blnOpen;
  end;
end;

function TfrmCheckSKU.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
begin
//
end;

procedure TfrmCheckSKU.edtAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{crl  if DataState in setDcs then
  begin
    with workaccountselect('B') do
    if OkFlag then
    begin
      qryCheckSKU.edit;
      qryCheckSKU.FieldByName('AccountID').AsString:=accountid;
      qryCheckSKU.FieldByName('AccountName').AsString:=account_shortname;
    end;
  end;
  }
end;

procedure TfrmCheckSKU.pgcMainChange(Sender: TObject);
begin
   if pgcMain.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      btnFirst.SkipGroup:=True;
      btnPrior.SkipGroup:=True;
      btnNext.SkipGroup:=True;
      btnLast.SkipGroup:=True;
      qryCheckSku.Active:=True;
      qryCheckSkuitem.Active:=True;
      SetDetailActive(True,True);
      ScatterToLV;
   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
      btnFirst.SkipGroup:=False;
      btnPrior.SkipGroup:=False;
      btnNext.SkipGroup:=False;
      btnLast.SkipGroup:=False;
      qryCheckSku.Active:=False;
      qryCheckSkuitem.Active:=False;
      SetDetailActive(False,False);
   end;
end;

procedure TfrmCheckSKU.qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
//
end;

{procedure TfrmCONTWITHLOCA.cmbCostcdEnter(Sender: TObject);
begin
  if (DataState in Setdcs) and not grdCostItem.ReadOnly then
  begin
    if Sender is TKinDbPickEdit       then TKinDbPickEdit(Sender).ReadOnly:=iif(qryCostItem.FieldByName('ACTCHKUserName').AsString<>'',True,False)
    else if Sender is TdxDbDateEdit   then TdxDbDateEdit(Sender).ReadOnly:=iif(qryCostItem.FieldByName('ACTCHKUserName').AsString<>'',True,False)
    else if Sender is TdxDbCalcEdit   then TdxDbCalcEdit(Sender).ReadOnly:=iif(qryCostItem.FieldByName('ACTCHKUserName').AsString<>'',True,False)
    else if Sender is TdxDbButtonEdit then TdxDbButtonEdit(Sender).ReadOnly:=iif(qryCostItem.FieldByName('ACTCHKUserName').AsString<>'',True,False)
    else if Sender is TdxDbEdit       then TdxDbEdit(Sender).ReadOnly:=iif(qryCostItem.FieldByName('ACTCHKUserName').AsString<>'',True,False);
  end;
end; }

procedure TfrmCheckSKU.edtCTI_ReasonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
end;

{procedure TfrmCONTWITHLOCA.dtdCTI_EDateExit(Sender: TObject);
begin
  if (DataState in Setdcs) and (dtdCTI_SDate.Date<>0) and (dtdCTI_EDate.Date<>0)
    and (edtCTI_CountDay.Value=0) then
    edtCTI_CountDay.Value:=dtdCTI_EDate.Date-dtdCTI_SDate.Date;
end; }

procedure TfrmCheckSKU.mitAddAttClick(Sender: TObject);
begin
{  with AddFileItem(lvAttachment) do
  if FileName <> '' then
  begin
    qryDocBook.Append;
    qryDocBook.FieldByName('DocType').AsString := '相关文档';//文档类别
//    if _blnAllowChangeHTH then//业务编号
//      qryDocBook.FieldByName('DOCID').AsString := copy(edtHth.Text,1,length(_strCkXmhFixed))+trim(edtDm.Text)
//    else
    qryDocBook.FieldByName('DOCID').AsString := copy(qryCONTWITHLOCA.fieldbyname('Jobno').AsString,1,length(qryCONTWITHLOCA.fieldbyname('Jobno').AsString));
    qryDocBook.FieldByName('FileName').AsString := FileName;//文件名
    TBlobField(qryDocBook.FieldByName('FileContent')).LoadFromStream(FileContent);//文件内容
    qryDocBook.Post;
    //
    FreeAndNil(FileContent);
  end;}
end;

procedure TfrmCheckSKU.mitDeleteAttClick(Sender: TObject);
var
  blnNeedReload: Boolean;
begin
{  if lvAttachment.ItemIndex = -1 then
  begin
    KMessageDlg('没有选择附件,不能删除',mtWarning,[mbOk],0);
    exit;
  end;
  if KMessageDlg('确认删除所选择附件?',mtConfirmation,[mbYes,mbNO],0)=mrYes then
  begin
    if qryDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]) then
    begin
      if lvAttachment.Items.Count -1 > lvAttachment.ItemIndex then
        blnNeedReload := True;
      qryDocBook.Edit;
      qryDocBook.Delete;
      lvAttachment.Items[lvAttachment.ItemIndex].Focused := True;
      lvAttachment.Items[lvAttachment.ItemIndex].Delete;
      if blnNeedReload then  ScatterToLV;
      if lvAttachment.Items.Count > 0 then lvAttachment.ItemIndex := 0;
    end;
  end;}
end;

procedure TfrmCheckSKU.mitOpenAttClick(Sender: TObject);
begin
 { if not (DataState in setDcs) then
  if lvAttachment.ItemIndex <>-1 then
  begin
    qryDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]);
    OpenItemFile(qryDocBook.FieldByName('filename').AsString,TBlobField(qryDocBook.FieldByName('FileContent')));
  end;   }
end;

procedure TfrmCheckSKU.ScatterToLV;
var
  strFileName: string;
  ListItem: TListItem;
begin
//  if _blnUseHtDocBook then//文档管理
{  if qryDocBook.Active then
  begin
    if qryDocBook.FieldByName('DOCID').AsString <> '' then
    begin
//      lvAttachment.Visible := True;
//      spdAttachment.Down := True;
    end else
    begin
//      lvAttachment.Visible := False;
//      spdAttachment.Down := False;
    end;
    //
    qryDocBook.First;
    lvAttachment.Items.Clear;
    while not qryDocBook.Eof do
    begin
      if qryDocBook.FieldByName('FileName').AsString <> '' then
      begin
        strFileName := qryDocBook.FieldByName('FileName').AsString;
        ListItem := lvAttachment.Items.Add;
        ListItem.Caption := strFileName;
        SetFileImageIndex(ListItem,lvAttachment.ViewStyle=vsIcon);
      end;
      qryDocBook.Next;
    end;
  end;   }
end;

procedure TfrmCheckSKU.grdCONTWITHLOCAChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  ScatterToLV;
end;

{procedure TfrmCONTWITHLOCA.edtCTI_PriceExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (qryCostitem.FieldByName('CTI_Price').AsFloat<>0) and (qryCostitem.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      qryCostitem.Edit;
      qryCostitem.FieldByName('cti_in').AsFloat:=qryCostitem.FieldByName('CTI_Price').AsFloat*qryCostitem.FieldByName('CTI_Quantity').AsFloat;
   end;
end; }

{procedure TfrmCONTWITHLOCA.edtCTI_QuantityExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (qryCostitem.FieldByName('CTI_Price').AsFloat<>0) and (qryCostitem.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      qryCostitem.Edit;
      qryCostitem.FieldByName('cti_in').AsFloat:=qryCostitem.FieldByName('CTI_Price').AsFloat*qryCostitem.FieldByName('CTI_Quantity').AsFloat;
   end;
end;}


procedure TfrmCheckSKU.grdCheckSKUCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
//  if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;

//  if ANode.Values[Complete.Index]='Y' then
//    AFont.Color :=clRed
//  else if (ANode.Values[PieceTasked.Index]>ANode.Values[Piece.Index])
//           and ((ANode.Values[Piece.Index]<>null) and (ANode.Values[Piece.Index]<>0)) then
//    AFont.Color :=clFuchsia;
{crl
  if trim(ANode.Values[edtchecked.Index])='√' then
  begin
    AColor := clInfoBk;
  end else
//  if trim(ANode.Values[edtCHECKUSERNAME.Index])='' then
//  begin
//    AColor := clGradientActiveCaption;
//  end else
  begin
    AColor := $00C1DBC1;
  end;
}
  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;

end;

procedure TfrmCheckSKU.grdCheckSKUDblClick(Sender: TObject);
begin
  pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmCheckSKU.mitDeleteCheckSKUItemClick(Sender: TObject);
begin
   if qryCheckSKUItem.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg('删除该笔资料,确认吗？', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     grdCheckSKUItem.setfocus;
     qryCheckSKUItem.delete;
   end;
end;

procedure TfrmCheckSKU.qryCheckSKUItemAfterScroll(DataSet: TDataSet);
begin
//
end;

procedure TfrmCheckSKU.grdCheckSKUItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=false
  else
  begin
    if (qryCheckSKU.FieldByName('checkname').AsString<>'') and (not blnModify) then
//crl    if (qryCheckSKU.FieldByName('checked').AsString='T') and (not blnModify) then
       Allow:=false
    else
       Allow:=true;
  end;
end;

procedure TfrmCheckSKU.grdCheckSKUItemExit(Sender: TObject);
begin
  With TDxDbgrid(sender) do
  begin
    try
      if DataLink.DataSet.State in [dsinsert,dsedit] then
      begin
        qrycheckskuitem.Post;
      end;
    except
      Setfocus;
    raise;
    end;
  end;
end;

procedure TfrmCheckSKU.grdCheckSKUItemKeyDown(Sender: TObject;
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
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        if Name='grdcheckskuitem' then
          mitDeleteCheckSKUItemClick(sender);
        key:=0;
      end;
    end;
  end;

end;

procedure TfrmCheckSKU.grdCheckSKUItemChangeNodeEx(Sender: TObject);
begin
  if grdCheckSkuitem.DataLink.dataset.State=dsInsert then
  begin
    grdCheckSkuItembeforeinsert;
  end;
end;

procedure TfrmCheckSku.grdCheckSkuItembeforeinsert;
begin
  qryCheckskuItem.Edit;
  qryCheckSKUitem.FieldByName('sno').AsInteger:=-1;
end;

procedure TfrmCheckSKU.AccountNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      qryCheckSKUItem.edit;
      qryCheckSKUItem.FieldByName('cusid').AsString:=qrySelect.FieldByName('Cusid').asstring;
      qryCheckSKUItem.FieldByName('cusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.ShipperAccountNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      qryCheckSKUItem.edit;
      qryCheckSKUItem.FieldByName('shippercusid').AsString:=qrySelect.FieldByName('Cusid').asstring;
      qryCheckSKUItem.FieldByName('shippercusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.SKUNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=PGetSKUSelect('',edtShipperAccount.TextField,'A','T',edtSKUID.Text);
   if qrySelect.IsEmpty<>true then
   begin
      qryCheckSKUitem.Edit;
      qryCheckSKuItem.FieldByName('skuid').AsString:=qrySelect.fieldbyname('SKUID').asString;
      qryCheckSKuItem.FieldByName('skuname').AsString:=qrySelect.fieldbyname('SKUName').asString;
      qryCheckSKuItem.FieldByName('quantityuom').AsString:=qrySelect.fieldbyname('QuantityUOM').asString;
      qryCheckSKuItem.FieldByName('pieceuom').AsString:=qrySelect.fieldbyname('PieceUOM').asString;
      qryCheckSKuItem.FieldByName('volumeuom').AsString:=qrySelect.fieldbyname('VolumeUOM').asString;
      qryCheckSKuItem.FieldByName('areauom').AsString:=qrySelect.fieldbyname('AreaUOM').asString;
      qryCheckSKuItem.FieldByName('weightuom').AsString:=qrySelect.fieldbyname('WeightUOM').asString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.Location_AdvanceNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOquery;
begin
    qrySelect:=pGetLocationSelect('','','');
    if qrySelect.IsEmpty<>true then
    begin
        qryCheckSKUitem.Edit;
        qryCheckSKUitem.Fieldbyname('locid').asstring:=qrySelect.FieldByName('locid').asstring;
        qryCheckSKUitem.Fieldbyname('locname').asstring:=qrySelect.FieldByName('locname').asstring;
    end;
    FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.QualityNameTaskButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
     qryCheckSKUItem.FieldByName('qualityname').AsString:=pGetqualitySelect(edtQualityName.Text);
end;

procedure TfrmCheckSKU.mitAddCheckSKUItemClick(Sender: TObject);
begin
  begin
    grdCheckSKUItem.setfocus;
    qryCheckSKUItem.append;
    grdCheckSkuItembeforeinsert;
  end;

end;

procedure TfrmCheckSKU.qryCheckSKUItemBeforePost(DataSet: TDataSet);
begin
  if grdcheckskuitem.Datalink.DataSet.State in  [dsInsert,dsEdit]  then
  begin
    if (grdcheckskuitem.FocusedNode.Values[SKUNameTask.Index]=null) or (grdcheckskuitem.FocusedNode.Values[SKUNameTask.Index]='') then
    begin
      exit;
    end else
    if (grdcheckskuitem.FocusedNode.Values[AccountNameTask.Index]=null) or (grdcheckskuitem.FocusedNode.Values[AccountNameTask.Index]='') then
    begin
      MessageBeep(0);
      if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
      raise EdxEditInvalidInput.Create('寄仓单位不可为空!');
      exit;
    end else
    if (grdcheckskuitem.FocusedNode.Values[ShipperAccountNameTask.Index]=null) or (grdcheckskuitem.FocusedNode.Values[ShipperAccountNameTask.Index]='') then
    begin
      MessageBeep(0);
      if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
      raise EdxEditInvalidInput.Create('货主不可为空!');
      exit;
    end else
    if (grdcheckskuitem.FocusedNode.Values[QualityNameTask.Index]=null) or (grdcheckskuitem.FocusedNode.Values[QualityNameTask.Index]='') then
    begin
      MessageBeep(0);
      if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
      raise EdxEditInvalidInput.Create('品质不可为空!');
      exit;
    end else
    if (qrycheckskuitem.fieldbyname('quantity').asInteger=0)
      and (VarIsNull(grdcheckskuitem.FocusedNode.Values[QuantityTask.Index])
      or (grdcheckskuitem.FocusedNode.Values[QuantityTask.Index]=0)) then
    begin        //VarIsNull
      MessageBeep(0);
      if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
      raise EdxEditInvalidInput.Create('数量不可为0!');
      exit;
    end;
    if grdcheckskuitem.DataLink.DataSet.State = dsInsert then
    begin
    maxcheckskuitem:=maxcheckskuitem+1;
    qrycheckskuitem.FieldByName('sno').AsInteger:=maxcheckskuitem;
    end;
  end;
end;

procedure TfrmCheckSKU.edtUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','F');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        qryCheckSKU.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        qryCheckSKU.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmCheckSKU.qryCheckSKUItemAfterPost(DataSet: TDataSet);
begin
  if qryCheckSkuItem.fieldbyname('skuid').AsString='' then
  begin
  grdCheckSKUITEM.SetFocus;
  qryCheckSKUItem.DELETE;
  end;
end;

procedure TfrmCheckSKU.grdCheckSKUChangeNodeEx(Sender: TObject);
begin
  if (DataState=stBrowse) then
  begin
    SetDetailActive(False,False);
    if pgcmain.ActivePage=tbsEdit then
       SetDetailActive(True,True);
  end;
end;

procedure TfrmCheckSKU.qryChkSKUUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction:=uaApplied;
end;

procedure TfrmCheckSKU.edtShipperAccountButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      qrychecksku.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
      qrychecksku.FieldByName('shippercusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.edtQualityNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   qrychecksku.FieldByName('qualityname').AsString:=pGetqualitySelect(edtQualityName.Text);
end;

procedure TfrmCheckSKU.edtcusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin 
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         qrychecksku.edit;
         qrychecksku.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         qrychecksku.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;
end;


procedure TfrmCheckSKU.edtSKUIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=PGetSKUSelect('',edtShipperAccount.TextField,'A','T',edtSKUID.Text);
   if qrySelect.FieldByName('skuid').AsString<>'NO' then
   begin
      qrySelect.First;
      qrychecksku.FieldByName('skuid').AsString:=qrySelect.fieldbyname('skuid').asString;
      qrychecksku.FieldByName('skuname').AsString:=qrySelect.fieldbyname('SKUName').asString;
   end;
end;

procedure TfrmCheckSKU.edtLocationIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      qrychecksku.FieldByName('locname').AsString:=qrySelect.FieldByName('LocName').asstring;
      qrychecksku.FieldByName('locid').AsString :=qrySelect.FieldByName('classid').AsString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCheckSKU.btnwareClick(Sender: TObject);
var
   KF1Book:TKF1book;
   lstPara:TStringList;
   strfillter,strfill:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   strfillter:='';
   strfill:='';
   if edtShipperAccount.TextField='' then
   begin
      Kmessagedlg('盘点客户不能为空！', mtInformation,[mbOk],0);
      edtShipperAccount.setFocus;
      exit;
   end;
   if edtcusid.TextField='' then
   begin
      Kmessagedlg('客户不能为空！', mtInformation,[mbOk],0);
      edtcusid.setFocus;
      exit;
   end;
   strfill:=' indetail.costcusid="'+edtcusid.TextField+'" ';
   strfillter:=' inout.costcusid="'+edtShipperAccount.TextField+'" ';
   try
      OpenSql(datatmp.qryTmp2,'ksp_fzpdcyb @fill='''+strfill+''', @fillter='''+strfillter+''' '
             );
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         lstPara:=TStringList.Create;
         Bbdm:='100124';
         paras.Values['zdr']:=_loginname;

         paras.Values['username']:=_Username;
         paras.Values['date']:=DateToStr(Now);
         qryMain:=datatmp.qryTmp2;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmCheckSKU.btnPrintClick(Sender: TObject);
var
  lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdCheckSKUItem,lstPara,'库存盘点表');

end;

procedure TfrmCheckSKU.mitpctClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   opensql(qrytmp,'select checkskuitem.quantity,checkskuitem.skuname,'
                 +'       checksku.actdate,sku.customerno '
                 +'  from checkskuitem  (nolock) '
                 +'       left join checksku(nolock)'
                 +'              on checksku.jobno=checkskuitem.jobno'
                 +'       left join sku(nolock) '
                 +'              on checksku.skuid=sku.skuid '
                 +' where checkskuitem.jobno="'+qryCheckSKUitem.fieldbyname('jobno').asstring+'"'
                 +'   and checkskuitem.sno="'+qryCheckSKUitem.fieldbyname('sno').asstring+'"'
                 );
   lstpara.Add('customerno='+qryTmp.FieldByname('customerno').AsString);
   lstpara.Add('quantity='+qryTmp.FieldByname('quantity').AsString);
   lstpara.Add('skuname='+qryTmp.FieldByname('skuname').AsString);
   lstpara.Add('actdate='+qryTmp.FieldByname('actdate').AsString);
   lstpara.Add('kdr='+_loginname);

   Worklinprint('900301','old','盘存条',qryTmp,nil,nil,lstpara);

end;

procedure TfrmCheckSKU.btncheckskuClick(Sender: TObject);
var
  strfilerTmp, strfilterSql,strfiler,strfiler2 :string;
begin
   if (edtLocationID.Text<>'') or (edtLocationIDxt.Text<>'')  then
   begin
      strfilerTmp:='';
      OpenSql(dataTmp.qryTmp,' select locid from location (nolock)  '
                            +' where  classid  like "'+qrychecksku.FieldByName('locid').AsString+'%" ');
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         strfilerTmp:=strfilerTmp+'"'+dataTmp.qryTmp.FieldByName('locid').AsString+'",';
         dataTmp.qryTmp.Next;
      end;
      Delete(strfilerTmp,Length(strfilerTmp),1);
      strfilerTmp:=' and detail.locid in ( '+strfilerTmp+' )  ';
      strfilterSql:=strfilterSql+strfilerTmp;
   end;

   if (edtShipperAccount.Text<>'') or (edtShipperAccountxt.Text<>'') then
   begin
      strfilterSql:=strfilterSql+' and detail.shippercusid="'+qrychecksku.fieldbyname('shippercusid').AsString+'"';
   end;

   if edtQualityName.Text<>'' then
   begin
      strfilterSql:=strfilterSql+' and detail.qualityname="'+qrychecksku.fieldbyname('qualityname').AsString+'"';
   end;

   if edtcusid.Text<>'' then
   begin
      strfilterSql:=strfilterSql+' and detail.cusid="'+qrychecksku.fieldbyname('cusid').AsString+'"';
   end;

   if (edtSKUID.Text<>'') or (edtSKUIDxt.Text<>'') then
   begin
      strfilterSql:=strfilterSql+' and detail.skuid="'+qrychecksku.fieldbyname('skuid').AsString+'"';
   end;

   if cmbSKUCostClass.text<>'' then
   begin
      strfilterSql:=strfilterSql+' and detail.skuid in(select skuid from sku(nolock) where skucostclasscd="'+qrychecksku.fieldbyname('skucostclasscd').AsString+'")';
   end;
   if cmbSKUCostClass2.text<>'' then
   begin
      strfilterSql:=strfilterSql+' and detail.skuid in(select skuid from sku(nolock) where skucostclasscd2="'+qrychecksku.fieldbyname('skucostclasscd2').AsString+'")';
   end;
   if cmbseason.text<>'' then
   begin
      if cmbseason.text='春' then
      begin
         strfilterSql:=strfilterSql+' and substring(detail.serialno,4,1)="1" ';
      end else
      if cmbseason.text='夏' then
      begin
         strfilterSql:=strfilterSql+' and substring(detail.serialno,4,1)="2" ';
      end else
      if cmbseason.text='秋' then
      begin
         strfilterSql:=strfilterSql+' and substring(detail.serialno,4,1)="3" ';
      end else
      if cmbseason.text='冬' then
      begin
         strfilterSql:=strfilterSql+' and substring(detail.serialno,4,1)="4" ';
      end;

   end;
   if _StrSysCus<>'XT' then
   begin
      if AccountBillNO.Text<>'' then
      begin
         strfilterSql:=strfilterSql+' and detail.cusbillno="'+qrychecksku.fieldbyname('cusbillno').AsString+'"';
      end;

      if CustomsNO.Text<>'' then
      begin
         strfilterSql:=strfilterSql+' and detail.customsno="'+qrychecksku.fieldbyname('customsno').AsString+'"';
      end;

      if MainOrder.Text<>'' then
      begin
         strfilterSql:=strfilterSql+' and detail.MainOrder="'+qrychecksku.fieldbyname('MainOrder').AsString+'"';
      end;
   end;

    if cmbcxclass.TextField='0' then
   begin
      strfiler:='quantity=isnull(detail.quantity,0)-isnull(detail.quantitydo,0), piece=isnull(detail.piece,0)-isnull(detail.piecedo,0), '+chr(13)+chr(10)
   end else
   if cmbcxclass.TextField='1' then
   begin
      strfiler:='quantity=detail.quantity-isnull(sum(isnull(locationoutitem.quantitytask,0)),0) ,           '+chr(13)+chr(10)
               +' piece=detail.piece-isnull(sum(isnull(locationoutitem.piecetask,0)),0),     '+chr(10)+chr(13) ;

      strfiler2:=strfiler2+'  group by detail.cusname,detail.cusid,detail.shippercusname, detail.serialno,      '+chr(13)+chr(10)
                          +'           detail.shippercusid,detail.skuname,detail.skuid,detail.lotcode,          '+chr(13)+chr(10)
                          +'           detail.qualityname, detail.quantityuom, detail.pieceuom,                 '+chr(13)+chr(10)
                          +'           detail.quantity ,detail.piece,detail.volume,detail.volumedo,             '+chr(13)+chr(10)
                          +'           detail.volumeuom,detail.area,detail.areado,detail.areauom,               '+chr(13)+chr(10)
                          +'           detail.netweight,detail.netweightdo,detail.weightuom,                    '+chr(13)+chr(10)
                          +'           detail.grossweight,detail.grossweightdo,detail.iuserid,                  '+chr(13)+chr(10)
                          +'           detail.locname,detail.remark,detail.ldsno,detail.userid,detail.ManufactureDate,       '+chr(13)+chr(10)
                          +'           detail.sno,detail.jobno,detail.isbond,detail.skumodel,detail.skuspec,detail.mainorder                  '+chr(13)+chr(10)
                          +'    having detail.quantity-isnull(sum(isnull(locationoutitem.quantitytask,0)),0)>0  '+chr(10)+chr(13);       //增加 skumodel,skuspec, ManufactureDate  lihl20120521
   end else
   if cmbcxclass.TextField='2' then
   begin
      strfiler:='quantity=isnull(sum(isnull(quantitytask,0)),0)-isnull(detail.quantitydo,0),      '+chr(10)+chr(13)
               +' piece= isnull(sum(isnull(piecetask,0)),0)-isnull(detail.piecedo,0) ,           '+chr(10)+chr(13);

      strfiler2:=strfiler2+'  group by detail.cusname,detail.cusid,detail.shippercusname, detail.serialno,   '+chr(13)+chr(10)
                          +'           detail.shippercusid,detail.skuname,detail.skuid,detail.lotcode,       '+chr(13)+chr(10)
                          +'           detail.qualityname, detail.quantityuom, detail.pieceuom,              '+chr(13)+chr(10)
                          +'           detail.quantity ,detail.piece,detail.volume,detail.volumedo,         '+chr(13)+chr(10)
                          +'           detail.volumeuom,detail.area,detail.areado,detail.areauom,            '+chr(13)+chr(10)
                          +'           detail.netweight,detail.netweightdo,detail.weightuom,detail.userid,   '+chr(13)+chr(10)
                          +'           detail.grossweight,detail.grossweightdo,detail.piecedo,               '+chr(13)+chr(10)
                          +'           detail.locname,detail.remark,detail.ldsno,detail.iuserid,detail.mainorder,             '+chr(13)+chr(10)
                          +'           detail.sno,detail.jobno,detail.isbond,detail.quantitydo,detail.skumodel,detail.skuspec,detail.ManufactureDate               '+chr(13)+chr(10)
                          +'    having isnull(sum(isnull(quantitytask,0)),0)-isnull(detail.quantitydo,0)>0   '+chr(10)+chr(13);      //增加 skumodel,skuspec, ManufactureDate  lihl20120521
   end;

   if edtUsername.Text<>'' then
   begin
      strfilterSql:=strfilterSql+' and detail.iuserid like "'+_userid+'%"';
   end;
   qryCheckSKUItem.Close;
   qryCheckSKUItem.Open;
   //lzw20101124
   if _StrSysCus='XT' then
   begin
      OpenSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                          +' where id=object_id("tempdb..#CheckSKUItem") and sysstat & 0xf=3)      '+chr(13)+chr(10)
                          +'  drop table #CheckSKUItem                                             '+chr(13)+chr(10)
                          +'select sno=1,                                                      '+chr(13)+chr(10)
                          +'       detail.cusname,detail.cusid,detail.shippercusname,      '+chr(13)+chr(10)
                          +'       detail.shippercusid,detail.skuname,detail.skuid,detail.serialno,    '+chr(13)+chr(10)
                          +'       color=detail.color,skuspec=detail.skuspec, detail.qualityname,   '+chr(13)+chr(10)
                          +'       quantity=sum(isnull(detail.quantityremain,0)),detail.quantityuom    '+chr(13)+chr(10)
                          //+'       detail.locname,ld_sno_in_f=detail.ldsno,   '+chr(13)+chr(10)
                          //+'       detail.lotcode, sno_in_f=detail.sno,jobno_in_f=detail.jobno    '+chr(13)+chr(10)
                          +'  into #CheckSKUItem                                                       '+chr(13)+chr(10)
                          +'  from locinskudetail detail(nolock)                                     '+chr(13)+chr(10)
                          +' where isnull(detail.quantityremain,0)>0                                '+chr(13)+chr(10)
                          +'   and (detail.userid like "'+_userid+'%" or detail.iuserid like "'+_userid+'" )             '+chr(13)+chr(10)
                          +strfilterSql
                          +'  group by detail.cusname,detail.cusid,detail.shippercusname,      '+chr(13)+chr(10)
                          +'       detail.shippercusid,detail.skuname,detail.skuid, detail.serialno,   '+chr(13)+chr(10)
                          +'       detail.color,detail.skuspec, detail.qualityname,detail.quantityuom    '+chr(13)+chr(10)
                          +'declare @a int select @a=0 '+chr(13)+chr(10)
                          +' update #CheckSKUItem set @a=@a+1 ,sno=@a '+chr(13)+chr(10)
                          +' select * from #CheckSKUItem order by sno  '+chr(13)+chr(10)
                           );

       dataTmp.qryTmp.DisableControls;
       dataTmp.qryTmp.First;
       while not dataTmp.qryTmp.Eof do
       begin
          qryCheckSKUItem.Edit;
          qryCheckSKUItem.Append;
          qryCheckSKUItem.FieldByName('jobno').AsString:=strCTjobno;
          qryCheckSKUItem.FieldByName('sno').AsString:=dataTmp.qryTmp.fieldbyname('sno').AsString;
          qryCheckSKUItem.FieldByName('cusname').AsString:=dataTmp.qryTmp.fieldbyname('cusname').AsString;
          qryCheckSKUItem.FieldByName('cusid').AsString:=dataTmp.qryTmp.fieldbyname('cusid').AsString;
          qryCheckSKUItem.FieldByName('shippercusname').AsString:=dataTmp.qryTmp.fieldbyname('shippercusname').AsString;
          qryCheckSKUItem.FieldByName('shippercusid').AsString:=dataTmp.qryTmp.fieldbyname('shippercusid').AsString;
          qryCheckSKUItem.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
          qryCheckSKUItem.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
          qryCheckSKUItem.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
          qryCheckSKUItem.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
          qryCheckSKUItem.FieldByName('customerno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;

          //qryCheckSKUItem.FieldByName('lotcode').AsString:=dataTmp.qryTmp.fieldbyname('lotcode').AsString;
          qryCheckSKUItem.FieldByName('qualityname').AsString:=dataTmp.qryTmp.fieldbyname('qualityname').AsString;
          qryCheckSKUItem.FieldByName('quantity').AsString:=dataTmp.qryTmp.fieldbyname('quantity').AsString;
          qryCheckSKUItem.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
          //qryCheckSKUItem.FieldByName('locname').AsString:=dataTmp.qryTmp.fieldbyname('locname').AsString;
          //qryCheckSKUItem.FieldByName('ld_sno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('ld_sno_in_f').AsString;
          //qryCheckSKUItem.FieldByName('sno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('sno_in_f').AsString;
          //qryCheckSKUItem.FieldByName('jobno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('jobno_in_f').AsString;
          try
             qryCheckSKUItem.Post;
          except
             Break;
          end;
          dataTmp.qryTmp.Next;
       end;
   end else
   begin
      OpenSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects                                               '+chr(13)+chr(10)
                          +'             where id=object_id("tempdb..#CheckSKUItem") and sysstat & 0xf=3)                '+chr(13)+chr(10)
                          +'  drop table #CheckSKUItem                                                                   '+chr(13)+chr(10)
                          +'select sno=1,detail.mainorder,                                                      '+chr(13)+chr(10)
                          +'       detail.cusname,detail.cusid,detail.shippercusname, detail.serialno,    '+chr(13)+chr(10)
                          +'       detail.shippercusid,detail.skuname,detail.skuid,detail.lotcode,detail.qualityname,    '+chr(13)+chr(10)
                          +'       detail.quantityuom, detail.pieceuom,detail.skumodel,detail.skuspec,detail.ManufactureDate,     '+chr(13)+chr(10)   //增加 skumodel,skuspec, ManufactureDate  lihl20120521
                          +strfiler
                          +'       volume=isnull(detail.volume,0)-isnull(detail.volumedo,0),detail.volumeuom,            '+chr(13)+chr(10)
                          +'       area=isnull(detail.area,0)-isnull(detail.areado,0),detail.areauom,                    '+chr(13)+chr(10)
                          +'       netweight=isnull(detail.netweight,0)-isnull(detail.netweightdo,0),detail.weightuom,   '+chr(13)+chr(10)
                          +'       grossweight=isnull(detail.grossweight,0)-isnull(detail.grossweightdo,0),              '+chr(13)+chr(10)
                          +'       detail.locname,detail.remark,ld_sno_in_f=detail.ldsno,                                '+chr(13)+chr(10)
                          +'       sno_in_f=detail.sno,jobno_in_f=detail.jobno,detail.isbond                             '+chr(13)+chr(10)
                          +'  into #CheckSKUItem                                                                         '+chr(13)+chr(10)
                          +'  from locationindetail detail(nolock)                                                       '+chr(13)+chr(10)
                          +'       left join locationoutitem(nolock)                                          '+chr(13)+chr(10)
                          +'              on locationoutitem.jobnoin=detail.jobno                    '+chr(13)+chr(10)
                          +'             and locationoutitem.snoin=detail.sno                    '+chr(10)+chr(13)
                          +'             and locationoutitem.SNOLocIN=detail.ldsno                  '+chr(10)+chr(13)
                          +'             and locationoutitem.notfullsign="T"                      '+chr(10)+chr(13)
                          +' where isnull(detail.quantity,0)>isnull(detail.quantitydo,0)                                 '+chr(13)+chr(10)
                          +'   and (detail.userid like "'+_userid+'%" or detail.iuserid like "'+_userid+'" )             '+chr(13)+chr(10)
                          +strfilterSql
                          +strfiler2
                          +'declare @a int select @a=0 '+chr(13)+chr(10)
                          +' update #CheckSKUItem set @a=@a+1 ,sno=@a '+chr(13)+chr(10)
                          +' select * from #CheckSKUItem order by sno  '+chr(13)+chr(10)
                           );

       dataTmp.qryTmp.DisableControls;
       dataTmp.qryTmp.First;
       while not dataTmp.qryTmp.Eof do
       begin
          qryCheckSKUItem.Edit;
          qryCheckSKUItem.Append;
          qryCheckSKUItem.FieldByName('jobno').AsString:=strCTjobno;
          qryCheckSKUItem.FieldByName('sno').AsString:=dataTmp.qryTmp.fieldbyname('sno').AsString;
          qryCheckSKUItem.FieldByName('mainorder').AsString:=dataTmp.qryTmp.fieldbyname('mainorder').AsString;
          qryCheckSKUItem.FieldByName('cusname').AsString:=dataTmp.qryTmp.fieldbyname('cusname').AsString;
          qryCheckSKUItem.FieldByName('cusid').AsString:=dataTmp.qryTmp.fieldbyname('cusid').AsString;
          qryCheckSKUItem.FieldByName('shippercusname').AsString:=dataTmp.qryTmp.fieldbyname('shippercusname').AsString;
          qryCheckSKUItem.FieldByName('shippercusid').AsString:=dataTmp.qryTmp.fieldbyname('shippercusid').AsString;
          qryCheckSKUItem.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
          qryCheckSKUItem.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
          qryCheckSKUItem.FieldByName('customerno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
          qryCheckSKUItem.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
          qryCheckSKUItem.FieldByName('skumodel').AsString:=dataTmp.qryTmp.fieldbyname('skumodel').AsString;
          qryCheckSKUItem.FieldByName('ManufactureDate').AsString:=dataTmp.qryTmp.fieldbyname('ManufactureDate').AsString;   //增加 skumodel,skuspec, ManufactureDate  lihl20120521
          qryCheckSKUItem.FieldByName('lotcode').AsString:=dataTmp.qryTmp.fieldbyname('lotcode').AsString;
          qryCheckSKUItem.FieldByName('qualityname').AsString:=dataTmp.qryTmp.fieldbyname('qualityname').AsString;
          qryCheckSKUItem.FieldByName('quantity').AsString:=dataTmp.qryTmp.fieldbyname('quantity').AsString;
          qryCheckSKUItem.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
          qryCheckSKUItem.FieldByName('piece').AsString:=dataTmp.qryTmp.fieldbyname('piece').AsString;
          qryCheckSKUItem.FieldByName('pieceuom').AsString:=dataTmp.qryTmp.fieldbyname('pieceuom').AsString;
          qryCheckSKUItem.FieldByName('volume').AsString:=dataTmp.qryTmp.fieldbyname('volume').AsString;
          qryCheckSKUItem.FieldByName('volumeuom').AsString:=dataTmp.qryTmp.fieldbyname('volumeuom').AsString;
          qryCheckSKUItem.FieldByName('area').AsString:=dataTmp.qryTmp.fieldbyname('area').AsString;
          qryCheckSKUItem.FieldByName('areauom').AsString:=dataTmp.qryTmp.fieldbyname('areauom').AsString;
          qryCheckSKUItem.FieldByName('netweight').AsString:=dataTmp.qryTmp.fieldbyname('netweight').AsString;
          qryCheckSKUItem.FieldByName('weightuom').AsString:=dataTmp.qryTmp.fieldbyname('weightuom').AsString;
          qryCheckSKUItem.FieldByName('grossweight').AsString:=dataTmp.qryTmp.fieldbyname('grossweight').AsString;
          qryCheckSKUItem.FieldByName('locname').AsString:=dataTmp.qryTmp.fieldbyname('locname').AsString;
          qryCheckSKUItem.FieldByName('remark').AsString:=dataTmp.qryTmp.fieldbyname('remark').AsString;
          qryCheckSKUItem.FieldByName('ld_sno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('ld_sno_in_f').AsString;
          qryCheckSKUItem.FieldByName('sno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('sno_in_f').AsString;
          qryCheckSKUItem.FieldByName('jobno_in_f').AsString:=dataTmp.qryTmp.fieldbyname('jobno_in_f').AsString;
          qryCheckSKUItem.FieldByName('isbond').AsString:=dataTmp.qryTmp.fieldbyname('isbond').AsString;
          try
             qryCheckSKUItem.Post;
          except
             Break;
          end;
          dataTmp.qryTmp.Next;
       end;
   end;

   dataTmp.qryTmp.EnableControls
end;

procedure TfrmCheckSKU.edtUsernameExit(Sender: TObject);
begin
  if edtUsername.Text='' then edtUsername.TextField:='';
end;

procedure TfrmCheckSKU.checkbbClick(Sender: TObject);
var
   lstPara:TStringList;
begin
   lstPara:=TStringList.Create;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   lstpara.Add('createname='+qryChkSKU.FieldByname('createname').AsString);
   lstPara.Add('printtime='+DateTimeToStr(Now));
    lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
   lstPara.Add('dateT='+dtdReceDateT.Text);
   GenInformations(lstPara);

   OpenSql(qryTmp,'select item.mainorder,item.shippercusname,item.cusname,item.locname,item.skuname,                  '+chr(13)+chr(10)                 +'       sku.customerno,item.quantity,sku.piecepro,sku.skumodel,sku.skuspec,item.ManufactureDate,    '+chr(13)+chr(10)                 +'       piece1=case when sku.piecepro is null then 0                                                '+chr(13)+chr(10)                 +'              else (case when isnull(FLOOR(isnull(item.quantity,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0                              '+chr(13)+chr(10)
                 +'              else FLOOR(isnull(item.quantity,0)/cast(sku.piecepro as numeric(16,0))) end )end ,                                                  '+chr(13)+chr(10)
                 +'       piece2=case when sku.piecepro is null then 0                                                                                               '+chr(13)+chr(10)
                 +'               else(case when  isnull((cast(isnull(item.quantity,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then 0                      '+chr(13)+chr(10)
                 +'                      else cast(isnull(item.quantity,0) as int)%cast(sku.piecepro as int)  end ) end,                                             '+chr(13)+chr(10)                 +'       piece=case when piecepro is null then ""                                                                                                    '+chr(13)+chr(10)                 +'                else (case when isnull(cast(FLOOR(isnull(item.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""               '+chr(13)+chr(10)
                 +'                             else cast(FLOOR(isnull(item.quantity,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+sku.pieceuom end                         '+chr(13)+chr(10)
                 +'                       +case when  isnull((cast(isnull(item.quantity,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                         '+chr(13)+chr(10)
                 +'                             else cast(cast(isnull(item.quantity,0) as int)%cast(sku.piecepro as int) as varchar(10))+sku.quantityuom end ) end                        '+chr(13)+chr(10)                 +'  from checkskuitem item(nolock)                                                       '+chr(13)+chr(10)                 +'       left join sku(nolock)                                                           '+chr(13)+chr(10)
                 +'              on sku.skuid=item.skuid                                                  '+chr(13)+chr(10)
                 +' where jobno="'+qryChkSKU.FieldByName('Jobno').AsString+'"                             '+chr(13)+chr(10)
                 +' order by locname                                                                      '+chr(13)+chr(10)
                  );
   Worklinprint('101002','old','嘉功盘点报表',qryTmp,nil,nil,lstpara);
     //增加 skumodel,skuspec, ManufactureDate  lihl20120521
end;

end.

