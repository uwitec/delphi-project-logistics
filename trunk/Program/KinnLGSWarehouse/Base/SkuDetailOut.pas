unit SkuDetailOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient, ADODB,shellapi ;

type
  TfrmSkuDetailOut = class(TForm)
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
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdSkuDetailOut: TdxDBGrid;
    TaskDate: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdTaskDate: TdxDBDateEdit;
    edtiUsername: TdxDBButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    pmskudetailoutloc: TPopupMenu;
    mitAddLocNew: TMenuItem;
    mitDelLocNew: TMenuItem;
    N2: TMenuItem;
    mitDetail_IN: TMenuItem;
    mitDetail_IN_F: TMenuItem;
    mitRLDetail: TMenuItem;
    timTASKDATE: TdxDBTimeEdit;
    pmSkuDetailOutDetail: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    edtcostcusid: TdxDBButtonEdit;
    GMSStickyLabel20: TGMSStickyLabel;
    btnPaste: TKBitBtn;
    KGroupBox2: TKGroupBox;
    RxSplitter1: TRxSplitter;
    KGroupBox3: TKGroupBox;
    KSText4: TKSText;
    grdSkuDetailLoc: TdxDBGrid;
    LDSNONew: TdxDBGridColumn;
    LocNameNew: TdxDBGridButtonColumn;
    LotCodeNew: TdxDBGridColumn;
    QualityNameNew: TdxDBGridButtonColumn;
    SerialNONew: TdxDBGridColumn;
    QuantityNew: TdxDBGridCurrencyColumn;
    QuantityUOMNew: TdxDBGridPickColumn;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCreateName: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    dtdcreatedate: TdxDBDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtcheckname: TdxDBEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    edtjobno: TdxDBEdit;
    cmbskucostclasscd: TKinDbPickEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    mitlocskudetail: TMenuItem;
    IUserName: TdxDBGridColumn;
    CreateName: TdxDBGridColumn;
    CostCusName: TdxDBGridColumn;
    CusBillNo: TdxDBGridColumn;
    jysl: TdxDBGridColumn;
    ShipperCusName: TdxDBGridColumn;
    ShipCusName: TdxDBGridColumn;
    grdSKUDetail: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
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
    remark: TdxDBGridBlobColumn;
    edtSKUSerialNO: TdxDBGridColumn;
    Conno: TdxDBGridColumn;
    ConnoNew: TdxDBGridColumn;
    jobnoout: TdxDBGridColumn;
    GMSStickyLabel12: TGMSStickyLabel;
    edtCustomerNo: TdxButtonEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    shipercusnamegrid: TdxDBGridButtonColumn;
    pnl1: TPanel;
    edtAccountBillNO: TdxDBEdit;
    GMSStickyLabel9: TGMSStickyLabel;
    edtLocationBillNO: TdxDBEdit;
    gmsLocationBillNO: TGMSStickyLabel;
    GMSStickyLabel33: TGMSStickyLabel;
    edtshippercusname: TdxDBButtonEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    ppmcheck: TPopupMenu;
    edtCusname: TdxDBButtonEdit;
    jobno: TdxDBGridColumn;
    Panel1: TPanel;
    btnInput: TKBitBtn;
    edtPath: TdxButtonEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    btnSkuIn: TKBitBtn;
    OpenDialog1: TOpenDialog;
    conMtf: TADOConnection;
    AqryMtf: TADOQuery;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText1: TKSText;
    KSText2: TKSText;
    ppmPrint: TPopupMenu;
    mitBHD: TMenuItem;
    cmblocID: TdxButtonEdit;
    btninputnew: TKBitBtn;
    edtshipcusname: TdxDBButtonEdit;
    btncheckdetail: TKBitBtn;
    ischeckname: TdxDBGridColumn;
    ItemDetailEdit1: TKBitBtn;
    mitoutplan: TMenuItem;
    mitcheck: TMenuItem;
    btnqzcheck: TKBitBtn;
    edtcheckdate: TdxDBEdit;
    checkname: TdxDBGridColumn;
    operationname: TdxDBGridColumn;
    memremark: TdxDBMemo;
    GMSStickyLabel14: TGMSStickyLabel;
    ydsl: TdxDBGridColumn;
    btninputbs: TKBitBtn;
    printname: TdxDBGridColumn;
    printdate: TdxDBGridColumn;
    printnum: TdxDBGridColumn;
    timoperationdate: TdxDBTimeEdit;
    dtdoperationdate: TdxDBDateEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    operationdate: TdxDBGridColumn;
    btnhxek: TKBitBtn;
    mitcheckcy: TMenuItem;
    ischeckdate: TdxDBGridColumn;
    price: TdxDBGridColumn;
    btnzcinput: TKBitBtn;
    btnskubrand: TKBitBtn;
    lastquantity: TdxDBGridColumn;
    mitphcyd: TMenuItem;
    btncancelcheck: TKBitBtn;
    ppmcancel: TPopupMenu;
    mituncheck: TMenuItem;
    mitcancelcheck: TMenuItem;
    mitunloc: TMenuItem;
    mitcancelcon: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
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
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure mitAddLocNewClick(Sender: TObject);
    procedure mitDelLocNewClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure grdSkuDetailOutChangeNodeEx(Sender: TObject);
    procedure LocNameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure loadgroupcusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure forkgroupcusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure liftmachinecusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityNewValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure QuantityOldValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnPasteClick(Sender: TObject);
    procedure edtiUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtiUsernameExit(Sender: TObject);
    procedure edtiUsernameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtcostcusidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtcostcusidExit(Sender: TObject);
    procedure edtcostcusidExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure grdSkuDetailOutDblClick(Sender: TObject);
    procedure mitlocskudetailClick(Sender: TObject);
    procedure edtshipcusname1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtshipcusname1Exit(Sender: TObject);
    procedure edtshipcusname1ExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtCustomerNoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure shipercusnamegridButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure shipercusnamegridValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtshippercusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtshippercusnameExit(Sender: TObject);
    procedure edtshippercusnameExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure grdSKUDetailChangeNodeEx(Sender: TObject);
    procedure grdSKUDetailEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdSKUDetailEnter(Sender: TObject);
    procedure grdSKUDetailExit(Sender: TObject);
    procedure grdSkuDetailLocEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdSkuDetailLocExit(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure edtCusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusnameExit(Sender: TObject);
    procedure edtCusnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure grdSkuDetailOutCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btnSkuInClick(Sender: TObject);
    procedure mitBHDClick(Sender: TObject);
    procedure cmblocIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmblocIDExit(Sender: TObject);
    procedure btninputnewClick(Sender: TObject);
    procedure edtshipcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtshipcusnameExit(Sender: TObject);
    procedure edtshipcusnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btncheckdetailClick(Sender: TObject);
    procedure ItemDetailEdit1Click(Sender: TObject);
    procedure mitoutplanClick(Sender: TObject);
    procedure mitcheckClick(Sender: TObject);
    procedure mituncheckClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure mitcancelcheck1Click(Sender: TObject);
    procedure btninputbsClick(Sender: TObject);
    procedure mitunloc1Click(Sender: TObject);
    procedure btnhxekClick(Sender: TObject);
    procedure mitcheckcyClick(Sender: TObject);
    procedure btnzcinputClick(Sender: TObject);
    procedure btnskubrandClick(Sender: TObject);
    procedure mitphcydClick(Sender: TObject);
    procedure mitcancelconClick(Sender: TObject);
  private
    { Private declarations }
    //变量定义
    strPHJobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    strJobno:string;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    strsql,FilterSql: string;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    arrml,arrMoveLoc,arrMoveLocOld,arrMoveLocNew:Variant;//用于数据复制
    sltselect:TStringList;// 库存挑选过滤
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    m_blnPost: Boolean;//在Post状态
    strDel_New:string;//目标仓位删除,记录删除序号
    strpskuid,strpskuname,strpcustomerno:string;//传入skuref参数
    blnisgetloc:Boolean;//是否获取仓位信息
    strPhLocMsg:string;//取仓位是否不足;
    qrymain,qrydetail:TKADOQuery;
    year,month,day:word;
    //过程定义
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    function FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
    procedure InitValues;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    procedure pgcRelocationChange(Sender: TObject);
    procedure grdskudetailbeforeInsert;
    procedure grdSkuDetailLocbeforeInsert;
    procedure CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended);
    function  CustomerNoCheck(pCustomerNo:string):Boolean;
    function  KspGetSkudetailoutLoc( pstrJobno:string;pIsdel:string='F'):string;//自动获取仓位
    function  KspSkuDetailToOut( pstrJobno:string):string;
    function  MasterInfoCheck:Boolean;
    function GetLocationBillNO:String;
    //费率控制过程
  public
    { Public declarations }
    maxskudetailsno,maxskudetaillocsno:Integer;
    strDel_detail:string;//记录商品明细删除,datas中.
    blnSavePost:Boolean;//apply是否出错
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkSkuDetailOut(CallMode:TDataState;pJobno,pItemOrDetail:string;
                           pqrymain:TKADOQuery=nil;pqrydetail:TKADOQuery=nil);

var
  frmSkuDetailOut: TfrmSkuDetailOut;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,GetDllPub,
     datasTmp,SkuRef,LocSkuDetailSelect,libBb,ReportBHD,outdetailcash,Operation;

var strpJobno:string;

procedure WorkSkuDetailOut(CallMode:TDataState;pJobno,pItemOrDetail:string;
                           pqrymain:TKADOQuery=nil;pqrydetail:TKADOQuery=nil);
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pDataBaseID:定位DataBaseID
  pItemOrDetail  :进出标志 I 任务 D 实际
}
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   strpJobno:=pJobno;
   if frmSkuDetailOut <> nil then
   with frmSkuDetailOut do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmSkuDetailOut:=TfrmSkuDetailOut.Create(application);

   with frmSkuDetailOut do
   begin
   {初始化所有数据集}
      //初始化变量
      blnCopy        :=False;             //系统默认不复制新增
      FindItem       :=TFindItem.Create;
      sltselect      :=TStringList.Create;
      mode           :=CallMode;
      strJobno       :=pJobno;
      qrymain        :=pqrymain;
      qrydetail      :=pqrydetail;
      blnSavePost:=False;
      ScrollAfterEdit:=True;
      //计费商品类
      InitdbPick(cmbskucostclasscd,'SKUCostClass','SKUCostClassCD','SKUCostClassName','1=1');
      //lzw20111223
      if (_strsyscus='XT') and (getsysdata('cususer')='HZQPL') then
      BEGIN
         btnInput.Enabled:=FALSE;
         btnskubrand.VISible:=true;

      end;
      //初始化
      data.IninSkuDetailOut(strjobno);
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
        FilterSql:=' (convert(datetime,convert(char(8),taskdate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),taskdate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('0');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('配货日期          大于等于      '+datetostr(Month_Start));
           Field.Add('0');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('配货日期          小于等于      '+datetostr(Month_End));
        end;
      end else FilterSql:='';

      data.qrySDO.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

  // 界面显示过程
      SetControlState(stBrowse,true);
      if mode=stinsert then
      begin
         Show;
         data.qrySDO.open;
         btnAdd.Click;
      end else
      begin
        // if _Loginid<>'SYSTEM' then
         SetButtonEnabled(ToolPanel,'mitSkuOutDetail',trim(_userorgid));//设置按钮的有效性
         SetControlState(stBrowse,true);
         data.qrySDO.open;
         if strJobno<>'' then
         data.qrySDO.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
         WorkCall(stBrowse);
      end;

      {激活FORM}
      {if strJobno<>'' then
      begin
         ShowModal;
         Free;
      end else
      }
      Show;
   end;
end;

procedure TfrmSkuDetailOut.WorkCall(CallMode:TDataState);
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
           EnableEdit;
           data.qrySDO.Edit;
           data.qryskudetailout.Edit;
           blnisgetloc:=false;
           blnSavePost:=false;
           strDel_New:='';
//           data.qrySDO.FieldByName('transfername').AsString  :=_Loginname;  //当做修改人
//           data.qrySDO.FieldByName('transferdate').AsDateTime:=GetServerDate;
           maxskudetailsno:=0;
           openSql(dataTmp.qryTmp,' select sno=max(sno) from skudetailoutdetail(nolock)  where jobno="'+data.qrySDO.FieldByName('Jobno').AsString+'"');
           maxskudetailsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
           maxskudetaillocsno:=0;
           openSql(dataTmp.qryTmp,' select sno=max(sno) from skudetailoutloc(nolock)   where jobno="'+data.qrySDO.FieldByName('Jobno').AsString+'"');
           maxskudetaillocsno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;

           LampChange(lsEdit);
        end;
      stInsert:
        begin
           maxskudetailsno:=0;
           maxskudetaillocsno:=0;
           blnisgetloc:=false;
           blnSavePost:=false;
           strDel_New:='';
           data.qrySDO.Append;
           data.qrySkuDetailOut.Append;
           InitValues;
           EnableEdit;
           data.qrySkuDetailOut.FieldByName('createname').AsString:=_Loginname;
           data.qrySkuDetailOut.FieldByName('createdate').AsDateTime:=GetServerDate;
           data.qrySDO.fieldbyname('jobno').asstring:=data.qrySkuDetailOut.FieldByName('jobno').AsString;
        end;
    end;
  end;
end;

procedure TfrmSkuDetailOut.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
  SetControlState(DataState,False);

  grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior+[edgoEditing];
  grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdSKUDetail.ShowGroupPanel:=False;
  grdSKUDetail.ClearGroupColumns;

  grdSkuDetailLoc.OptionsBehavior:=grdSkuDetailLoc.OptionsBehavior+[edgoEditing];
  grdSkuDetailLoc.OptionsDB:=grdSkuDetailLoc.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdSkuDetailLoc.ShowGroupPanel:=False;
  grdSkuDetailLoc.ClearGroupColumns;
end;

procedure TfrmSkuDetailOut.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
   setDisable:=[];
   if data.qrySDO.RecordCount=0 then setDisable:=setDisable+[2,4];
   libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
   SetControlState(DataState,False);
   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior-[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=True;

   grdSkuDetailLoc.OptionsBehavior:=grdSkuDetailLoc.OptionsBehavior-[edgoEditing];
   grdSkuDetailLoc.OptionsDB:=grdSkuDetailLoc.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSkuDetailLoc.ShowGroupPanel:=True;
   //清除控制状态
   edtshipcusname.Clear;
   edtCustomerNo.Clear;
   edtPath.Clear;
   cmblocID.Clear;
end;

procedure TfrmSkuDetailOut.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmSkuDetailOut.InitValues;
{初始化时自动生成仓位代码}
begin
   //opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
   //              +'  from genjobno where substring(docno1,1,2)="CC"  '
   //              +'       and substring(jobno,5,2)="LO"  '
   //              +'       and substring(docno1,3,4)="'+copy(datetostr(getserverdate),1,4)+'"' );
   data.qrySkuDetailOut.edit;
   //data.qrySkuDetailOut.FieldByName('LocationBillNO').Asstring:='CC'+copy(datetostr(getserverdate),1,4)
   //                                                        +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   //lzw20111218
   data.qrySkuDetailOut.FieldByName('LocationBillNO').Asstring:=GetLocationbillNo;
   strPHJobno:=genJobno('PH',data.qrySkuDetailOut.FieldByName('LocationBillNO').Asstring);
   data.qrySkuDetailOut.FieldByName('jobno').AsString:=strPHJobno;
//   data.qrySkuDetailOut.FieldByName('locationbillno').AsString:=strLocbillno;
//   data.qrySkuDetailOut.FieldByName('operationtype').AsInteger:=-1;
   data.qrySkuDetailOut.FieldByName('taskdate').AsDateTime:=GetServerDate;
   data.qrySkuDetailOut.FieldByName('userid').AsString:=_userID;
   data.qrySkuDetailOut.FieldByName('username').AsString:=_username;
   data.qrySkuDetailOut.FieldByName('iuserid').AsString:=_userID;
   data.qrySkuDetailOut.FieldByName('iusername').AsString:=_username;
   data.qrySkuDetailOut.FieldByName('skucostclasscd').AsString:='COMMON';
   data.qrySkuDetailOut.FieldByName('createname').AsString:=_loginName;
   data.qrySkuDetailOut.FieldByName('createdate').AsDateTime:=GetServerDate;
   if qrymain<>nil then
   begin
      data.qrySkuDetailOut.FieldByName('iuserid').AsString:=qrymain.fieldbyname('iuserid').AsString;
      data.qrySkuDetailOut.FieldByName('iusername').AsString:=_username;
      data.qrySkuDetailOut.FieldByName('costcusid').AsString:=qrymain.fieldbyname('costcusid').AsString;
      data.qrySkuDetailOut.FieldByName('costcusname').AsString:=qrymain.fieldbyname('costcusname').AsString;
      data.qrySkuDetailOut.FieldByName('cusid').AsString:=qrymain.fieldbyname('cusid').AsString;
      data.qrySkuDetailOut.FieldByName('cusname').AsString:=qrymain.fieldbyname('cusname').AsString;
      data.qrySkuDetailOut.FieldByName('shippercusid').AsString:=qrymain.fieldbyname('shippercusid').AsString;
      data.qrySkuDetailOut.FieldByName('shippercusname').AsString:=qrymain.fieldbyname('shippercusname').AsString;
      data.qrySkuDetailOut.FieldByName('cusbillno').AsString:=qrymain.fieldbyname('cusbillno').AsString;
//      data.qrySkuDetailOut.FieldByName('skucostclasscd').AsString:=qrymain.fieldbyname('').AsString;
   end;
   if qrydetail<>nil then
   begin
      qrydetail.First;
      while not qrydetail.Eof do
      begin
         data.qrySkuDetailOutDetail.Append;
         grdskudetailbeforeInsert;
         data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=qrydetail.fieldbyname('shipcusname').AsString;
         data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=qrydetail.fieldbyname('shipcusid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=qrydetail.fieldbyname('skuid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=qrydetail.fieldbyname('skuname').AsString;
         data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=qrydetail.fieldbyname('serialno').AsString;
         data.qrySkuDetailOutDetail.FieldByName('color').AsString:=qrydetail.fieldbyname('color').AsString;
         data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=qrydetail.fieldbyname('skuspec').AsString;
         data.qrySkuDetailOutDetail.FieldByName('quantity').AsString:=qrydetail.fieldbyname('quantity').AsString;
         data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=qrydetail.fieldbyname('quantityuom').AsString;
         data.qrySkuDetailOutDetail.FieldByName('lotcode').AsString:=qrydetail.fieldbyname('lotcode').AsString;
         data.qrySkuDetailOutDetail.FieldByName('qualityname').AsString:=qrydetail.fieldbyname('qualityname').AsString;
         try
            data.qrySkuDetailOutDetail.Post;
         except
            Break;
         end;
         qrydetail.Next;
      end;
   end;
end;

procedure TfrmSkuDetailOut.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
   if not ScrollAfterEdit and blnOpen then
   begin
     if data.qrySkuDetailOut.Active then
     begin
        data.qrySkuDetailOut.Close;
        data.qrySkuDetailOut.Open;
     end;
     if data.qrySkuDetailOutDetail.Active then
     begin
        data.qrySkuDetailOutDetail.Close;
        data.qrySkuDetailOutDetail.Open;
     end;
     if data.qrySkuDetailOutLoc.Active then
     begin
        data.qrySkuDetailOutLoc.Close;
        data.qrySkuDetailOutLoc.Open;
     end;
     ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      data.qrySkuDetailOut.Active     :=blnOpen;
      data.qrySkuDetailOutDetail.Active  :=blnOpen;
      data.qrySkuDetailOutLoc.Active  :=blnOpen;
   end else
   begin
      data.qrySkuDetailOut.Active     :=blnOpen;
      data.qrySkuDetailOutDetail.Active  :=blnOpen;
      data.qrySkuDetailOutLoc.Active  :=blnOpen;
   end;
end;

procedure TfrmSkuDetailOut.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
//
end;

procedure TfrmSkuDetailOut.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
//
end;

function TfrmSkuDetailOut.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   quantitynewtotal,quantitytotal:Extended;
   locnameoldAll,locnamenewAll,strskuname,struom:string;
   strblno:string;

begin
   strblno:='';
   opensql(dataTmp.qryTmp,'select * from customer(nolock) '
                        +' where cusid="'+edtcostcusid.TextField+'" '
          );
   strblno:=dataTmp.qryTmp.FieldByName('cuscode').AsString;
   result:=False;
   if (DataState in Setdcs) and MasterInfoCheck then
   begin
      locnameoldAll:='';
      locnamenewAll:='';
      strskuname:='';
      struom:='';
      quantitytotal:=0;
      data.qrySkuDetailOutDetail.DisableControls;
      data.qrySkuDetailOutLoc.DisableControls;
      data.qrySkuDetailOutDetail.First;
      while not data.qrySkuDetailOutDetail.Eof do
      begin
         quantitynewtotal:=0;
         data.qrySkuDetailOutDetail.edit;
         data.qrySkuDetailOutDetail.FieldByName('userid').AsString:=data.qrySkuDetailOut.FieldByName('userid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('username').AsString:=data.qrySkuDetailOut.FieldByName('username').AsString;
//         data.qrySkuDetailOutDetail.FieldByName('iuserid').AsString:=data.qrySkuDetailOut.FieldByName('iuserid').AsString;
//         data.qrySkuDetailOutDetail.FieldByName('iuername').AsString:=data.qrySkuDetailOut.FieldByName('iuername').AsString;
         data.qrySkuDetailOutDetail.FieldByName('costcusid').AsString:=data.qrySkuDetailOut.FieldByName('costcusid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('costcusname').AsString:=data.qrySkuDetailOut.FieldByName('costcusname').AsString;
         data.qrySkuDetailOutDetail.FieldByName('shippercusid').AsString:=data.qrySkuDetailOut.FieldByName('shippercusid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('shippercusname').AsString:=data.qrySkuDetailOut.FieldByName('shippercusname').AsString;
         data.qrySkuDetailOutDetail.FieldByName('cusid').AsString:=data.qrySkuDetailOut.FieldByName('cusid').AsString;
         data.qrySkuDetailOutDetail.FieldByName('cusname').AsString:=data.qrySkuDetailOut.FieldByName('cusname').AsString;
         data.qrySkuDetailOutDetail.FieldByName('corpno').AsString:=data.qrySkuDetailOut.FieldByName('corpno').AsString;
         data.qrySkuDetailOutDetail.FieldByName('cusbillno').AsString:=data.qrySkuDetailOut.FieldByName('cusbillno').AsString;
         data.qrySkuDetailOutDetail.FieldByName('locationbillno').AsString:=data.qrySkuDetailOut.FieldByName('locationbillno').AsString;
         quantitytotal:=quantitytotal+data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat;
         data.qrySkuDetailOutDetail.FieldByName('skubrand').AsString:=strblno;
//         data.qrySkuDetailOutDetail.FieldByName('costcusid').AsString:=data.qrySDO.FieldByName('costcusid').AsString;
         if pos(data.qrySkuDetailOutDetail.fieldbyname('skuname').AsString,strskuname)=0 then
         begin
            if strskuname='' then strskuname:=data.qrySkuDetailOutDetail.fieldbyname('skuname').AsString
            else strskuname:=strskuname+','+data.qrySkuDetailOutDetail.fieldbyname('skuname').AsString;
         end;
         if pos(data.qrySkuDetailOutDetail.fieldbyname('quantityuom').AsString,struom)=0 then
         begin
            if struom='' then struom:=data.qrySkuDetailOutDetail.fieldbyname('quantityuom').AsString;
            struom:=struom+','+data.qrySkuDetailOutDetail.fieldbyname('quantityuom').AsString;
         end;

         grdSKUDetailChangeNodeEx(nil);
         data.qrySkuDetailOutLoc.First;
         while not data.qrySkuDetailOutLoc.Eof do
         begin
            data.qrySkuDetailOutLoc.edit;
            data.qrySkuDetailOutLoc.FieldByName('costcusid').AsString:=data.qrySkuDetailOut.FieldByName('costcusid').AsString;
            data.qrySkuDetailOutLoc.FieldByName('costcusname').AsString:=data.qrySkuDetailOut.FieldByName('costcusname').AsString;
            data.qrySkuDetailOutLoc.FieldByName('shippercusid').AsString:=data.qrySkuDetailOut.FieldByName('shippercusid').AsString;
            data.qrySkuDetailOutLoc.FieldByName('shippercusname').AsString:=data.qrySkuDetailOut.FieldByName('shippercusname').AsString;
            data.qrySkuDetailOutLoc.FieldByName('cusid').AsString:=data.qrySkuDetailOut.FieldByName('cusid').AsString;
            data.qrySkuDetailOutLoc.FieldByName('cusname').AsString:=data.qrySkuDetailOut.FieldByName('cusname').AsString;
            data.qrySkuDetailOutLoc.FieldByName('corpno').AsString:=data.qrySkuDetailOut.FieldByName('corpno').AsString;
            data.qrySkuDetailOutLoc.FieldByName('cusbillno').AsString:=data.qrySkuDetailOut.FieldByName('cusbillno').AsString;
            data.qrySkuDetailOutLoc.FieldByName('locationbillno').AsString:=data.qrySkuDetailOut.FieldByName('locationbillno').AsString;
            data.qrySkuDetailOutLoc.FieldByName('userid').AsString:=data.qrySkuDetailOut.FieldByName('userid').AsString;
            data.qrySkuDetailOutLoc.FieldByName('username').AsString:=data.qrySkuDetailOut.FieldByName('username').AsString;
            data.qrySkuDetailOutLoc.FieldByName('iuserid').AsString:=data.qrySkuDetailOut.FieldByName('iuserid').AsString;
            data.qrySkuDetailOutLoc.FieldByName('iusername').AsString:=data.qrySkuDetailOut.FieldByName('iusername').AsString;
            data.qrySkuDetailOutLoc.FieldByName('shipcusid').AsString  :=data.qrySkuDetailOutDetail.FieldByName('shipcusid').asstring;
            data.qrySkuDetailOutLoc.FieldByName('shipcusname').AsString:=data.qrySkuDetailOutDetail.FieldByName('shipcusname').asstring;
            //lzw20111106
            data.qrySkuDetailOutLoc.FieldByName('price').AsString:=data.qrySkuDetailOutDetail.FieldByName('price').asstring;
            data.qrySkuDetailOutLoc.FieldByName('skubrand').AsString:=strblno;
            //quantitytotal:=quantitytotal+data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat;
            quantitynewtotal:=quantitynewtotal+data.qrySkuDetailOutLoc.FieldByName('quantity').AsFloat;
            data.qrySkuDetailOutLoc.Next;
         end;
         if (quantitynewtotal<>data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat)
            and (quantitynewtotal<>0) then
         begin
{
            //KMessageDlg(GetMessage('frmMoveLoc','003'),mtWarning,[mbOK],0);
             KMessageDlg(GetMessage('frmSkuDetailOut','007'),mtWarning,[mbOK],0);
//             kmessagedlg('存在仓位数量的合计不等于商品数量的记!请检查并输入正确信息?',mtWarning,[mbOK],0);
             data.qrySkuDetailOutLoc.EnableControls;
             data.qrySkuDetailOutDetail.EnableControls;
             Exit;
}
         end;
         data.qrySkuDetailOutDetail.Next;
      end;
      data.qrySkuDetailOutLoc.EnableControls;
      data.qrySkuDetailOutDetail.EnableControls;
      data.qrySkuDetailOut.Edit;
      data.qrySkuDetailOut.FieldByName('skuname').AsString:=strskuname;
      data.qrySkuDetailOut.FieldByName('quantityuom').AsString:=struom;
      data.qrySkuDetailOut.FieldByName('quantity').asfloat:=quantitytotal;

      data.qrySDO.Edit;
      data.qrySDO.FieldByName('jobno').AsString         :=data.qrySkuDetailOut.FieldByName('jobno').AsString;
      data.qrySDO.FieldByName('taskdate').AsDateTime    :=data.qrySkuDetailOut.FieldByName('taskdate').AsDateTime;
      data.qrySDO.FieldByName('locationbillno').AsString:=data.qrySkuDetailOut.FieldByName('locationbillno').AsString;
      data.qrySDO.FieldByName('userid').AsString:=data.qrySkuDetailOut.FieldByName('userid').AsString;
      data.qrySDO.FieldByName('username').AsString:=data.qrySkuDetailOut.FieldByName('username').AsString;
      data.qrySDO.FieldByName('iuserid').AsString:=data.qrySkuDetailOut.FieldByName('iuserid').AsString;
      data.qrySDO.FieldByName('iusername').AsString:=data.qrySkuDetailOut.FieldByName('iusername').AsString;
      data.qrySDO.FieldByName('createname').AsString:=data.qrySkuDetailOut.FieldByName('createname').AsString;
      data.qrySDO.FieldByName('createdate').AsDateTime:=data.qrySkuDetailOut.FieldByName('createdate').AsDateTime;
      data.qrySDO.FieldByName('operationdate').AsDateTime:=data.qrySkuDetailOut.FieldByName('operationdate').AsDateTime;
      data.qrySDO.FieldByName('skuname').AsString:=data.qrySkuDetailOut.FieldByName('skuname').AsString;
      data.qrySDO.FieldByName('shippercusname').AsString:=data.qrySkuDetailOut.FieldByName('shippercusname').AsString;
      data.qrySDO.FieldByName('shippercusid').AsString:=data.qrySkuDetailOut.FieldByName('shippercusid').AsString;
      data.qrySDO.FieldByName('costcusid').AsString:=data.qrySkuDetailOut.FieldByName('costcusid').AsString;
      data.qrySDO.FieldByName('costcusname').AsString:=data.qrySkuDetailOut.FieldByName('costcusname').AsString;
      data.qrySDO.FieldByName('cusid').AsString:=data.qrySkuDetailOut.FieldByName('cusid').AsString;
      data.qrySDO.FieldByName('cusname').AsString:=data.qrySkuDetailOut.FieldByName('cusname').AsString;
      data.qrySDO.FieldByName('corpno').AsString:=data.qrySkuDetailOut.FieldByName('corpno').AsString;
      data.qrySDO.FieldByName('cusbillno').AsString:=data.qrySkuDetailOut.FieldByName('cusbillno').AsString;
      data.qrySDO.FieldByName('locationbillno').AsString:=data.qrySkuDetailOut.FieldByName('locationbillno').AsString;
      data.qrySDO.FieldByName('quantity').AsFloat:=data.qrySkuDetailOut.FieldByName('quantity').AsFloat;
      data.qrySDO.FieldByName('jobnoout').AsString:=data.qrySkuDetailOut.FieldByName('jobnoout').AsString;
      Result:=True;
   end;
end;

procedure TfrmSkuDetailOut.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmSkuDetailOut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmSkuDetailOut.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetGroupbox(KGroupBox3);
  SetGroupbox(KGroupBox7);
  SetDxDbGrid(grdSKUDetail);
  SetDxDbGrid(grdSkuDetailLoc);
  SetDxDbGrid(grdSkuDetailOut);
  pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmSkuDetailOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then
   begin
      if ActiveControl<>edtCustomerNo then ReturnNext(Self)
      else edtCustomerNoButtonClick(nil,0);
   end;
   if Key=Vk_F4 then
   begin
 //    pgcMoveLoc.ActivePage := tbsLocInfo;
     if DataState in Setdcs then ActiveControl:=edtiUsername;
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

procedure TfrmSkuDetailOut.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   data.qrySkuDetailOutDetail.Close;
   data.qrySkuDetailOutLoc.Close;
   data.qrySkuDetailOut.Close;
   data.qrySDO.Close;
   sltselect.Destroy;
   frmSkuDetailOut:=nil;
end;

procedure TfrmSkuDetailOut.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmSkuDetailOut.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmSkuDetailOut.btnRefreshClick(Sender: TObject);
var
   strjobnoref: string;
begin
   strjobnoref:=data.qrySDO.FieldByName('jobno').AsString;
   data.qrySDO.DisableControls;
   data.qrySDO.Close;
   data.qrySDO.Open;
   if not data.qrySDO.Locate('Jobno',
                       VarArrayOf([strjobnoref]),
                       [loCaseInsensitive, loPartialKey]) then
   begin
     data.qrySDO.Last;
   end;
   data.qrySDO.EnableControls;
   grdSkuDetailOutChangeNodeEx(nil);
   SetDetailActive(False,False);
   SetDetailActive(True,True);
   WorkCall(stBrowse);
end;

procedure TfrmSkuDetailOut.btnEditClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;

   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if (datatmp.qryTmp.FieldByName('isout').AsString='T')  then
   begin
      KMessageDlg('该配货单已出货,不能修改!',mtWarning,[mbOK],0);
      Exit;
   end;
   {if (data.qrySkuDetailOut.FieldByName('checkid').AsString='T') and (getsysdata('cususer')<>'HXEK')then
   begin
      KMessageDlg('该配货单已校验,不能修改!',mtWarning,[mbOK],0);
      Exit;
   end;
   }
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   WorkCall(stEdit);
end;

procedure TfrmSkuDetailOut.btnAddClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   Workcall(stInsert);
end;

procedure TfrmSkuDetailOut.btnDeleteClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage := tbsEdit;
   if KmessageDlg('确认删除此配货单吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;

   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if datatmp.qryTmp.FieldByName('isout').AsString='T' then
   begin
      KMessageDlg('该配货单已出货,不能删除!',mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qrySkuDetailOut.FieldByName('checkid').AsString='T' then
   begin
      KMessageDlg('该配货单已校验,不能删除!',mtWarning,[mbOK],0);
      Exit;
   end;
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      _ADOConnection.StartTransaction;
      try
         ExecSql(dataTmp.qryTmp, 'delete from skudetailout where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '
                                +'delete from skudetailoutdetail where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '
                                +'delete from skudetailoutloc where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '
                                +'delete from ck_lskoutcheckdetail where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '
                                +'delete from ck_SkuDetailOutLoc where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '

                                //lzw20101116
                                +'delete from locationinoutconsku where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '
                                +'delete from locationinoutcon where jobno="' +
                                       data.qrySDO.FieldByName('jobno').AsString + '" '

               );
         data.qrySDO.delete;
         data.qrySDO.ApplyUpdates;

         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then _ADOConnection.RollBack;
         raise;
         Exit;
      end;
      data.qrySDO.CommitUpdates ;
      WorkCall(stBrowse);
   end;
   SetDetailActive(False,False);
   SetDetailActive(True,True);
end;

procedure TfrmSkuDetailOut.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   pgcRelocationChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('skudetailout ');

{0}   para.field.add('convert(datetime,convert(char(10),taskdate,102))');
{1}   para.field.add('shipcusID');
{2}   para.field.add('cusbillno');
{3}   para.field.add('detail.serialno');
{4}   para.field.add('convert(datetime,convert(char(10),ischeckdate,102))');

   Para.Exp.add('');

{0}   Para.Toptic.Add('配货日期');
{1}   Para.Toptic.add('收 货 人');
{2}   Para.Toptic.add('客户单号');
{3}   Para.Toptic.add('商品编码');
{4}   Para.Toptic.add('校验日期');

{0}   Para.Ftype.add('D');
{1}   para.Ftype.add('E');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('C');
{4}   Para.Ftype.add('D');

   Para.RField.add('jobno');

   if filterSql <> '' then
      Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(data.qrySDO, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmSkuDetailOut.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qrySDO, dataTmp.qryFind);
end;

procedure TfrmSkuDetailOut.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then
      pgcMain.ActivePage := tbsBrowse;
   pgcRelocationChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('skudetailout ');

{0}   para.field.add('convert(datetime,convert(char(10),taskdate,102))');
{1}   para.field.add('shipcusID');
{2}   para.field.add('cusbillno');
{3}   para.field.add('detail.serialno');
{4}   para.field.add('convert(datetime,convert(char(10),ischeckdate,102))');

   Para.Exp.add('');

{0}   Para.Toptic.Add('配货日期');
{1}   Para.Toptic.add('收 货 人');
{2}   Para.Toptic.add('客户单号');
{3}   Para.Toptic.add('商品编码');
{4}   Para.Toptic.add('校验日期');

{0}   Para.Ftype.add('D');
{1}   para.Ftype.add('E');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('C');
{4}   Para.Ftype.add('D');

   Para.RField.add('jobno');

   if filterSql<>'' then
      Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   Para.OnGetSql:=FindGetSql;
   strTmp := DoFilter(Para, FindItem);
   if strTmp <> 'null' then
   begin
      data.qrySDO.Close;
      data.qrySDO.DisableControls;
      if strTmp<>'' then
         data.qrySDO.MacroByName('Where').AsString:=strTmp
      else
         data.qrySDO.MacroByName('Where').AsString:='1=1';
      data.qrySDO.Open;
      data.qrySDO.EnableControls;
   end;
   workcall(stbrowse);
end;
//lzw20110518
function TfrmSkuDetailOut.FindGetSql(pField: Integer; pOp:integer; pValue: String): String;
begin
   Result := '';
   case pField of
   //商品编码
      3:  Result:=''
                 +'   exists(select 1 from skudetailoutdetail detail (nolock)'
                 +'                  where skudetailout.Jobno=detail.Jobno'
                 +'                    and detail.serialno like "%'+pValue+'%" ) '
          else if pValue = '' then Result:=' 1=1';
   end;
   frmSkuDetailOut.Refresh;
end;

procedure TfrmSkuDetailOut.btnSaveClick(Sender: TObject);
var
   strCreateID,strJobno,strlocationbillno:string;
   blnSuc:Boolean;
begin
   blnSuc:=true;
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         while True do
         begin
            try
//               data.qrySDO.DisableControls;
               _ADOConnection.Starttransaction;
               arrMoveLoc:=ScatterToArray(data.qrySkuDetailOut,true,0);
               data.qrySkuDetailOut.ApplyUpdates;
               Break;
            except
               _ADOConnection.Rollback; //先结束事务
               if Libproc.Error.HandleException(Exception(ExceptObject),data.udsSkuDetailOut.InsertSql.text)=Re_KeyRepeat then
               begin
                  blnSuc:=False;
                  WorkSaveGet( data.qrySkuDetailOut.FieldByName('Jobno').AsString +GetMessage('frmMoveLoc','006'));//'工作号' '已经被使用。程序正在查找其他可用代码...';
                  Application.processmessages;
                  if not frmSave.stopflag then
                  begin
                     {opensql(datatmp.qryTmp,
                             'select dhcx=max(convert(int,substring(docno1,7,8))) '
                            +'  from genjobno '
                            +' where substring(docno1,1,2)="CC"  '
                            +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );

                     strlocationbillno:='CC'+copy(datetostr(GetServerDate),1,4)
                                       +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
                     }
                     strlocationbillno:=GetLocationbillNo;
                     strCreateID:=genJobno('PH',strlocationbillno);
//wql_05/05/18 增加仓单号                     strCreateID := genJobno('ML');
                     if strCreateID = '' then
                     begin
                        KmessageDlg(GetMessage('frmSkuDetailOut','008'), mtInformation, [mbOk], 0);//'没有可用的代码或网络忙，请稍侯重试或联系系统管理员.'
                        frmSave.stopflag := True;
                        Break;
                     end else
                     begin
                        data.qrySkuDetailOut.Edit;
                        data.qrySkuDetailOut.FieldByName('Jobno').AsString := strCreateID;
                        data.qrySkuDetailOut.FieldByName('locationbillno').AsString := strlocationbillno;
                        data.qrySDO.Edit;
                        data.qrySDO.FieldByName('Jobno').AsString := strCreateID;
                        data.qrySDO.FieldByName('locationbillno').AsString := strlocationbillno;
                     end;
                  end else Break;
               end else
               begin
                  raise;
                  //data.qrySDO.EnableControls;
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
            //data.qrySkuDetailOutLoc复制
            data.qrySkuDetailOutDetail.DisableControls;
            with data.qrySkuDetailOutDetail do
            begin
               First;
               while not Eof do
               begin
                  Edit;
                  FieldByName('Jobno').AsString:=strCreateID;
                  FieldByName('locationbillno').AsString:=strlocationbillno;
                  next;
               end;
               First;
            end;
            data.qrySkuDetailOutDetail.EnableControls;
            //data.qrySkuDetailOutDetail复制
            data.qrySkuDetailOutLoc.DisableControls;
            data.qrySkuDetailOutLoc.Filtered:=False;
            with data.qrySkuDetailOutLoc do
            begin
               First;
               while not Eof do
               begin
                  Edit;
                  FieldByName('Jobno').AsString:=strCreateID;
                  FieldByName('locationbillno').AsString:=strlocationbillno;
                  next;
               end;
               First;
            end;
            data.qrySkuDetailOutLoc.Filtered:=true;
            data.qrySkuDetailOutLoc.EnableControls;
         end;
         if strDel_New<>'' then
         begin
//            if not blnSavePost then
//               strDel_New:=copy(strDel_New,4,length(strDel_New)- 3);
            strsql:=' delete from skudetailoutloc '
                   +'  where jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'"'
                   +'    and '+'('+strDel_New+')';
            execsql(datatmp.qryTmp,strsql);
         end;

         data.qrySkuDetailOutLoc.DisableControls;
         data.qrySkuDetailOutDetail.DisableControls;
         arrMoveLocOld:=ScatterToArray(data.qrySkuDetailOutDetail,False,0);
         data.qrySkuDetailOutDetail.applyupdates;
         data.qrySkuDetailOutLoc.Filtered:=False;
         arrMoveLocNew:=ScatterToArray(data.qrySkuDetailOutLoc,False,0);
         data.qrySkuDetailOutLoc.applyupdates;

{         //判断库存是否满足
         opensql(dataTmp.qryTmp,'exec ksp_movelocoldcheck "'
                    +data.qrySDO.FieldByName('Jobno').AsString+'"');
         if dataTmp.qryTmp.FieldByName('ermsg').AsString<>'' then
         begin
            try
              if _ADOConnection.InTransaction then _ADOConnection.rollback;
            except
            end;
            raise Exception.Create(dataTmp.qryTmp.FieldByName('ermsg').AsString);
         end;
         //商品明细库存判断
         if data.qrymovlocskudetail.Active then
            kspLocationOutskudetail(data.qrySDO.fieldbyname('jobno').AsString,'','F','F');
}
         //是否是获取仓位信息
         if blnisgetloc then
         begin
            strPhLocMsg:=KspGetSkudetailoutLoc(data.qrySDO.fieldbyname('jobno').AsString);
         end;
         m_blnPost := True;
         data.qrySDO.ApplyUpdates;
         m_blnPost := False;
         _ADOConnection.Commit;
      except
         blnSavePost:=True;
         m_blnPost := True;
         blnisgetloc:=false;
         strJobno     :=data.qrySDO.FieldByName('Jobno').AsString;

//         data.qrySDO.CancelUpdates;
//         data.qrySkuDetailOut.CancelUpdates;
//         data.qrySkuDetailOutDetail.CancelUpdates;
//         data.qrySkuDetailOutLoc.CancelUpdates;
         //qrymovlocskudetail.CancelUpdates;
//         data.qrySDO.Delete;
         data.qrySkuDetailOut.Delete;
//         data.qrySDO.DisableControls;
//         GatherFromArray(data.qrySDO,arrML,false);
//         data.qrySDO.Locate('Jobno',
//                           VarArrayOf([strJobno]),
//                           [loCaseInsensitive, loPartialKey]);
//         data.qrySDO.Edit;

         GatherFromArray(data.qrySkuDetailOut,arrMoveLoc,false);
//         data.qrySDO.EnableControls;

         //data.qrySkuDetailOutDetail复制
         data.qrySkuDetailOutDetail.First;
         while not data.qrySkuDetailOutDetail.Eof do
         begin
            data.qrySkuDetailOutDetail.Delete;
         end;

{
         data.qrySkuDetailOutDetail.First;
         while not data.qrySkuDetailOutDetail.Eof do
         begin
            data.qrySkuDetailOutDetail.Edit;
            data.qrySkuDetailOutDetail.FieldByName('Jobno').Asstring:=data.qrySDO.FieldByName('Jobno').AsString;
            data.qrySkuDetailOutDetail.next;
         end;
         data.qrySkuDetailOutDetail.First;
}
        //data.qrySkuDetailOutLoc复制
         data.qrySkuDetailOutLoc.First;
         while not data.qrySkuDetailOutLoc.Eof do
         begin
            data.qrySkuDetailOutLoc.Delete;
         end;

         GatherFromArray(data.qrySkuDetailOutDetail,arrMoveLocOld,true);
         GatherFromArray(data.qrySkuDetailOutLoc,arrMoveLocNew,true);
{
         data.qrySkuDetailOutLoc.First;
         while not data.qrySkuDetailOutLoc.Eof do
         begin
            data.qrySkuDetailOutLoc.Edit;
            data.qrySkuDetailOutLoc.FieldByName('Jobno').Asstring:=data.qrySDO.FieldByName('Jobno').AsString;
            data.qrySkuDetailOutLoc.next;
         end;
         data.qrySkuDetailOutLoc.First;
}
         data.qrySkuDetailOutDetail.Post;
         data.qrySkuDetailOutDetail.EnableControls;
         data.qrySkuDetailOutLoc.Filtered:=True;
         data.qrySkuDetailOutLoc.EnableControls;
         blnSavePost:=False;
         m_blnPost := False;
         try
            if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         exit;
      end;
      data.qrySDO.CommitUpdates;
      data.qrySkuDetailOut.CommitUpdates;
      data.qrySkuDetailOutDetail.CommitUpdates;
      data.qrySkuDetailOutLoc.CommitUpdates;

      data.qrySkuDetailOutLoc.Filtered:=True;
      data.qrySkuDetailOutDetail.EnableControls;
      data.qrySkuDetailOutLoc.EnableControls;
      //data.qrySDO.EnableControls;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
   end;
end;

procedure TfrmSkuDetailOut.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel, mtWarning, [mbYes, mbNo], 0) = mrNo then
      Exit;
   if DataState=stinsert then
      ExecSql(dataTmp.qryTmp, 'delete from genjobno where jobno="' +
         data.qrysdo.FieldByName('jobno').AsString + '" ');
   data.qrySkuDetailOut.CancelUpdates;
   data.qrySkuDetailOutDetail.CancelUpdates;
   data.qrySkuDetailOutLoc.CancelUpdates;
   data.qrySDO.CancelUpdates;
   WorkCall(stBrowse);
end;

function TfrmSkuDetailOut.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result:=True;
   case pField of
      1:
       begin
          qrySelect:=pGetCustomerSelect('E','');
          if qrySelect.FieldByName('cusid').AsString<>'NO' then
          begin
             PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
             PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
          end;
          freeandnil(qrySelect);
       end;
   else
      Result:=False;
   end;
end;

procedure TfrmSkuDetailOut.mitAddLocOldClick(Sender: TObject);
begin
   grdSKUDetail.SetFocus;
   data.qrySkuDetailOutDetail.Append;
   grdskudetailbeforeInsert;
end;

procedure TfrmSkuDetailOut.mitDelLocOldClick(Sender: TObject);
begin
   if data.qrySkuDetailOutDetail.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdSKUDetail.setfocus;
      if strDel_New='' then
         strDel_New:=' (SNO='+data.qrySkuDetailOutDetail.fieldbyname('SNO').Asstring+')'
      else
         strDel_New:=strDel_New+' or (SNO='+data.qrySkuDetailOutDetail.fieldbyname('SNO').Asstring+')';
//      if blnSavePost strDel_New:=copy(strDel_New,4,length(strDel_New)- 3);
{
      if sltselect.IndexOf(data.qrySkuDetailOutDetail.fieldbyname('jobno').AsString+
                            data.qrySkuDetailOutDetail.fieldbyname('sno').AsString+
                            data.qrySkuDetailOutDetail.fieldbyname('ldsno').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(data.qrySkuDetailOutDetail.fieldbyname('jobno').AsString+
                          data.qrySkuDetailOutDetail.fieldbyname('sno').AsString+
                          data.qrySkuDetailOutDetail.fieldbyname('ldsno').AsString));
}
      data.qrySkuDetailOutDetail.delete;
   end;
end;

procedure TfrmSkuDetailOut.mitAddLocNewClick(Sender: TObject);
begin
   if data.qrySkuDetailOutDetail.IsEmpty then
   begin
//      if _Language='CAPTIONC' then _strmessage:='请先输入源仓位信息'
//      else _strmessage:='********';
      KMessageDlg('请先输入商品信息!',mtWarning,[mbyes],0);
      exit;
   end;
   grdSkuDetailLoc.SetFocus;
   data.qrySkuDetailOutLoc.Append;
   grdSkuDetailLocbeforeInsert;
end;

procedure TfrmSkuDetailOut.mitDelLocNewClick(Sender: TObject);
begin
   if data.qrySkuDetailOutLoc.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdSkuDetailLoc.setfocus;
      data.qrySkuDetailOutLoc.delete;
   end;
end;

procedure TfrmSkuDetailOut.pgcMainChange(Sender: TObject);
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

procedure TfrmSkuDetailOut.grdSkuDetailOutChangeNodeEx(Sender: TObject);
begin

  if (data.qrySkuDetailOut.ParamByName('Jobno').AsString<>data.qrySDO.FieldByName('Jobno').AsString)
    or (data.qrySkuDetailOut.ParamByName('Jobno').AsString='') then
  begin
    data.qrySkuDetailOut.ParamByName('Jobno').AsString:=data.qrySDO.FieldByName('Jobno').AsString;
    data.qrySkuDetailOutDetail.ParamByName('Jobno').AsString:=data.qrySDO.FieldByName('Jobno').AsString;
    data.qrySkuDetailOutLoc.ParamByName('Jobno').AsString:=data.qrySDO.FieldByName('Jobno').AsString;
    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcMain.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmSkuDetailOut.LocNameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:integer;
   strfilter:string;
   mulSelect:TMultLocSkuDetailSelect;
begin
   if DataState in Setdcs then
   begin
      strfilter:=' and detail.skuid="'+data.qrySkuDetailOutDetail.fieldbyname('skuid').AsString+'"';
      if data.qrySkuDetailOutDetail.fieldbyname('color').AsString<>'' then
         strfilter:=strfilter+' and detail.color="'+data.qrySkuDetailOutDetail.fieldbyname('color').AsString+'"';
      if data.qrySkuDetailOutDetail.fieldbyname('skuspec').AsString<>'' then
         strfilter:=strfilter+' and detail.skuspec="'+data.qrySkuDetailOutDetail.fieldbyname('skuspec').AsString+'"';
      if data.qrySkuDetailOutDetail.fieldbyname('serialno').AsString<>'' then
         strfilter:=strfilter+' and detail.serialno="'+data.qrySkuDetailOutDetail.fieldbyname('serialno').AsString+'"';
      if data.qrySkuDetailOutDetail.fieldbyname('lotcode').AsString<>'' then
         strfilter:=strfilter+' and detail.lotcode="'+data.qrySkuDetailOutDetail.fieldbyname('lotcode').AsString+'"';
      {if data.qrySkuDetailOutDetail.FieldByName('costcusid').AsString<>'' then
         strfilter:=strfilter+' and detail.costcusid="'+data.qrySkuDetailOut.fieldbyname('costcusid').AsString+'"';
      if data.qrySkuDetailOutDetail.FieldByName('shippercusid').AsString<>'' then
         strfilter:=strfilter+' and detail.shippercusid="'+data.qrySkuDetailOut.fieldbyname('shippercusid').AsString+'"';
      if data.qrySkuDetailOutDetail.FieldByName('cusid').AsString<>'' then
         strfilter:=strfilter+' and detail.cusid="'+data.qrySkuDetailOut.fieldbyname('cusid').AsString+'"';
       }
      mulSelect:=WorkLocSkuDetailSelect('',0,0,strfilter);
      for i:=Low(mulSelect) to High(mulSelect) do
      begin
         if mulSelect[i].okflag then
         with data.qrySkuDetailOutLoc do
         begin
            Append;
            grdSkuDetailLocbeforeinsert;
            FieldByName('locid').AsString:=mulselect[i].LocID;
            FieldByName('locname').AsString:=mulselect[i].Locname;
            FieldByName('jobnoin').AsString:=mulselect[i].JOBNO;
            FieldByName('snoin').AsInteger :=mulselect[i].SNO;
            FieldByName('ldsnoin').AsInteger:=mulselect[i].LDSNO;
            FieldByName('detailsnoin').AsInteger:=mulselect[i].DetailSNO;
            FieldByName('skuid').AsString:=mulselect[i].SKUID;
            FieldByName('skuname').AsString:=mulselect[i].SKUName;
            FieldByName('quantity').AsFloat:=mulselect[i].Quantity;
            FieldByName('quantityuom').AsString:=mulselect[i].QuantityUOM;
            FieldByName('color').AsString:=mulselect[i].color;
            FieldByName('skuspec').AsString:=mulselect[i].skuspec;
            FieldByName('lotcode').AsString:=mulselect[i].LotCode;
            FieldByName('qualityname').AsString:=mulselect[i].QualityName;
            FieldByName('serialno').AsString:=mulselect[i].SerialNO;
            FieldByName('conno').AsString:=mulselect[i].conno;
            FieldByName('manufacturedate').AsDateTime:=mulselect[i].manufacturedate;
            FieldByName('sizeuom').AsString:=mulselect[i].SizeUOM;
            FieldByName('Height').AsFloat:=mulselect[i].Height;
            FieldByName('Width').AsFloat:=mulselect[i].Width;
            FieldByName('Depth').AsFloat:=mulselect[i].Depth;
            post;
         end;
      end;
   end;
end;

procedure TfrmSkuDetailOut.btnBrowGlClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmSkuDetailOut.btnBrowMxClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsedit;
end;

procedure TfrmSkuDetailOut.loadgroupcusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOutLoc.edit;
         data.qrySkuDetailOutLoc.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOutLoc.FieldByName('loadgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSkuDetailOut.forkgroupcusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOutLoc.edit;
         data.qrySkuDetailOutLoc.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOutLoc.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSkuDetailOut.liftmachinecusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOutLoc.edit;
         data.qrySkuDetailOutLoc.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOutLoc.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSkuDetailOut.QualityNameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
      data.qrySkuDetailOutLoc.edit;
      data.qrySkuDetailOutLoc.FieldByName('QualityName').AsString
                    :=pGetqualitySelect(data.qrySkuDetailOutLoc.FieldByName('QualityName').AsString);
  end;
end;

procedure TfrmSkuDetailOut.QuantityNewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdSkuDetailLoc.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
//      QuantityOldValue:=data.qrySkuDetailOutLoc.FieldByName('Quantity').AsFloat;
      data.qrySkuDetailOutLoc.Edit;
      data.qrySkuDetailOutLoc.FieldByName('Quantity').AsFloat:=StrToFloat(grdSkuDetailLoc.InplaceEditor.GetEditingText);
//      CountSKUQuantity(data.qrySkuDetailOutLoc,QuantityOldValue);
   end;
end;

procedure TfrmSkuDetailOut.CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended);
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   quantityfield,piecefield,volumefield,netweightfield,grossweightfield,areafield,
   casing1field,casing2field,casing3field,casing4field,casing5field:string;
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
  end;
end;


procedure TfrmSkuDetailOut.QuantityOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   QuantityOldValue:Extended;  
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
      QuantityOldValue:=data.qrySkuDetailOutDetail.FieldByName('Quantity').AsFloat;
      data.qrySkuDetailOutDetail.Edit;
      data.qrySkuDetailOutDetail.FieldByName('Quantity').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
      CountSKUQuantity(data.qrySkuDetailOutDetail,QuantityOldValue);
   end;
end;

procedure TfrmSkuDetailOut.btnPasteClick(Sender: TObject);
var
   strerror:string;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   //lzw20101124
   //扫描数量和装箱数量比对
   if _strsyscus='XT' then
   begin
      if data.qrySkuDetailOut.FieldByName('operationdate').AsString='' then
      begin
         KMessageDlg('出仓日期不能为空!',mtWarning,[mbOK],0);
         Exit;
      end;

      {OpenSql(datatmp.qryTmp,'select ccsl=sum(isnull(loc.quantity,0)), '+chr(13)+chr(10)
                   +'       bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                   +'       ddsl=isnull(detail.quantity,0)         '+chr(13)+chr(10)
                   +'  from skudetailoutdetail detail(nolock)                             '+chr(13)+chr(10)
                   +'       left join skudetailoutloc loc(nolock)                          '+chr(13)+chr(10)
                   +'              on loc.jobno=detail.jobno               '+chr(13)+chr(10)
                   +'             and loc.sno=detail.sno                   '+chr(13)+chr(10)
                   +' where detail.jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"    '+chr(13)+chr(10)
                   +'   and loc.jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"    '+chr(13)+chr(10)
                   +' group by isnull(detail.quantity,0),rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                   +'having sum(isnull(loc.quantity,0))<>isnull(detail.quantity,0)'
           );

      if (datatmp.qryTmp.recordcount>0) then
      begin
         KMessageDlg('"'+datatmp.qryTmp.fieldbyname('bs').AsString+'"出仓数量与扫描信息不一致!',mtWarning,[mbOK],0);
         Exit;
      end; }

      if data.qrySkuDetailOut.FieldByName('checkid').AsString<>'T' then
      begin
         KMessageDlg('该配货单未校验不能出仓!',mtWarning,[mbOK],0);
         Exit;
      end;
   end;

   {opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobnoout="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"');
   if datatmp.qryTmp.RecordCount<>0 then
   begin
      KMessageDlg('已经生成出仓!',mtWarning,[mbOK],0);
      exit;
   end;}
   if data.qrySkuDetailOut.FieldByName('jobnoout').AsString<>'' then
   begin
      KMessageDlg('已经生成出仓!',mtWarning,[mbOK],0);
      exit;
   end;
   //lzw20110827
   {if data.qrySkuDetailOut.FieldByName('checkname').AsString='' then
   begin
      KMessageDlg('该配货单未审核不能出仓!',mtWarning,[mbOK],0);
      Exit;
   end; }
   if KMessageDlg('你确定要生成出仓吗!',mtConfirmation,[mbYes,mbno],0)<>mryes then exit;
   _ADOConnection.Starttransaction;
   try
      //执行确认动作，修改进仓具体仓位的信息
      if _strsyscus='XT' then
      begin
         execsql(dataTmp.qryTmp,'update skudetailout  '
                            +'   set operationname="'+_loginname+'"  '
                            +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"'
                            +'update skudetailoutloc '
                            +'   set operationname="'+_loginname+'",'
                            +'       operationdate="'+dtdoperationdate.text+'" '
                            +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"'
             );
      end else
      begin
         execsql(dataTmp.qryTmp,'update skudetailout  '
                            +'   set operationname="'+_loginname+'",'
                            +'       operationdate=getdate() '
                            +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"'
                            +'update skudetailoutloc '
                            +'   set operationname="'+_loginname+'",'
                            +'       operationdate=getdate() '
                            +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'"'
             );
      end;

      strerror:=KspSkuDetailToOut(data.qrySkuDetailOut.fieldbyname('jobno').AsString);
      _ADOConnection.Commit
   except
      try
        if _ADOConnection.InTransaction then _ADOConnection.rollback;
      except
      end;
      KMessageDlg('出仓失败:'+chr(13)+strerror,mtWarning,[mbOK],0);
      Exit;
   end;
   KMessageDlg('出仓成功!',mtWarning,[mbOK],0);
   btnRefreshClick(nil);
end;

procedure TfrmSkuDetailOut.edtiUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qrySkuDetailOut.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qrySkuDetailOut.FieldByName('iusername').AsString:=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmSkuDetailOut.edtiUsernameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtiUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtiUsername.Text='' then
      begin
         data.qrySkuDetailOut.Edit;
         data.qrySkuDetailOut.FieldByName('iuserid').AsString:='';
         data.qrySkuDetailOut.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtiUsername.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qrySkuDetailOut.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmSkuDetailOut.grdskudetailbeforeInsert;
begin
//   data.qrySkuDetailOutDetail.Edit;
   data.qrySkuDetailOutDetail.fieldbyname('SNO').Asinteger:=-1;
   data.qrySkuDetailOutDetail.fieldByname('jobno').AsString:=data.qrySDO.fieldbyname('jobno').AsString;
   data.qrySkuDetailOutDetail.FieldByName('qualityname').AsString:='正品';
//   data.qrySkuDetailOutDetail.fieldbyname('userid').asstring:=data.qrySDO.fieldbyname('userid').asstring;
//   data.qrySkuDetailOutDetail.fieldbyname('username').asstring:=data.qrySDO.fieldbyname('username').asstring;
//   data.qrySkuDetailOutDetail.fieldbyname('iuserid').asstring:=data.qrySDO.fieldbyname('iuserid').asstring;
//   data.qrySkuDetailOutDetail.fieldbyname('iusername').asstring:=data.qrySDO.fieldbyname('iusername').asstring;
end;

procedure TfrmSkuDetailOut.grdSkuDetailLocBeforeInsert;
begin
   data.qrySkuDetailOutLoc.fieldbyname('ldSNO').Asinteger:=-1;
   data.qrySkuDetailOutLoc.fieldbyname('SNO').Asinteger:=data.qrySkuDetailOutDetail.fieldbyname('SNO').Asinteger;
   data.qrySkuDetailOutLoc.fieldByname('jobno').AsString:=data.qrySkuDetailOut.fieldbyname('jobno').AsString;
   data.qrySkuDetailOutLoc.fieldByname('lotcode').AsString:=data.qrySkuDetailOutDetail.fieldbyname('lotcode').AsString;
end;

procedure TfrmSkuDetailOut.edtcostcusidButtonClick(Sender: TObject;
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
            data.qrySkuDetailOut.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            data.qrySkuDetailOut.FieldByName('Cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('Cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;

            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmSkuDetailOut.edtcostcusidExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtcostcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcostcusid.Text='' then
      begin
         data.qrySkuDetailOut.Edit;
         data.qrySkuDetailOut.FieldByName('costcusid').AsString  :='';
         data.qrySkuDetailOut.FieldByName('costcusname').AsString:='';
         data.qrySkuDetailOut.FieldByName('Cusid').AsString  :='';
         data.qrySkuDetailOut.FieldByName('Cusname').AsString  :='';

      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtcostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('costcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
            data.qrySkuDetailOut.FieldByName('Cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('Cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmSkuDetailOut.grdSkuDetailOutDblClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmSkuDetailOut.mitlocskudetailClick(Sender: TObject);
begin
{
   if data.qrySkuDetailOutLoc.FieldByName('locid').AsString='' then
   begin
      KMessageDlg('仓位不可为空!',mtWarning,[mbOK],0);
      exit;
   end;
   if data.qrymovlocskudetail.Active<>True then
   begin
      data.qrymovlocskudetail.Open;
      //qrylocoutskudetail
      _maxgridnomov:=0;
      data.qrymovlocskudetail.First;
      while not data.qrymovlocskudetail.Eof do
      begin
        if data.qrymovlocskudetail.FieldByName('detailsno').AsInteger>_maxgridnomov
        then _maxgridnomov:=data.qrymovlocskudetail.FieldByName('detailsno').AsInteger;
        data.qrymovlocskudetail.Next;
      end;
   end;

   grdMoveLocNewChangeNodeEx(nil);
   WorkLocOutSKUDetail(DataState ,data.qrySkuDetailOut.FieldByName('jobno').AsString,
                      '',
                      data.qrySkuDetailOutLoc.FieldByName('SNO').AsInteger,
                      data.qrySkuDetailOutLoc.FieldByName('ldsno').AsInteger,
                      _maxgridnomov,
                      data.qrymovlocskudetail,data.qrySkuDetailOutLoc);
}
end;

procedure TfrmSkuDetailOut.edtshipcusname1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         edtshipcusname.TextField  :=qrySelect.FieldByName('Cusid').asstring;
         edtshipcusname.Text       :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSkuDetailOut.edtshipcusname1Exit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtshipcusname1ExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs) then //如果配置可以直接输入则不用校验
   begin
      if edtshipcusname.Text='' then
      begin
         edtshipcusname.TextField:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('G',edtshipcusname.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            edtshipcusname.TextField  :=qrySelect.FieldByName('Cusid').asstring;
            edtshipcusname.Text       :=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

function TfrmSkuDetailOut.CustomerNoCheck(pCustomerNo:string):Boolean;
var
  customerNo:string;
begin
   customerNo:=pCustomerNo;
   //商品未改变
   if strpcustomerno=customerNo then
   begin
      Result:=true;
      exit;
   end;
   strsql:='select top 1 * '
          +'  from sku '
          +' where sku.customerno="'+customerNO+'"';
   OpenSql(dataTmp.qryTmp,strsql);
   if dataTmp.qryTmp.IsEmpty then Result:=False
   else
   begin
      strpskuid:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
      strpskuname:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
      strpcustomerno:=pCustomerNo;
      Result:=true;
   end;
end;

procedure TfrmSkuDetailOut.edtCustomerNoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:Integer;
   qryselect:TKADOQuery;
   mulSkuRef:Tmulskuref;
begin
   if edtCustomerNo.Text='' then
   begin
      qryselect:=PGetSKUSelect('','','T');
      qryselect.First;
      if not qryselect.Eof then
      begin
         edtCustomerNo.Text:=qryselect.FieldByName('customerno').AsString
      end;
      FreeAndNil(qryselect);
   end else
   begin
      if CustomerNoCheck(edtCustomerNo.Text) then
      begin
   //      blnskucheck:=True;
         mulSkuRef:=workSkuRef(stEdit,strpskuid,data.qrySkuDetailOut);
         data.qrySkuDetailOutDetail.DisableControls;
         for i:=Low(mulSkuRef) to High(mulSkuRef) do
         with mulSkuRef[i] do
         begin
            if OKflag then
            begin
               data.qrySkuDetailOutDetail.Append;
               grdSKUDetailBeforeInsert;
               data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=edtshipcusname.TextField;
               data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=edtshipcusname.Text;
               data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=strpskuid;
               data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=strpskuname;
   //            data.qrySkuDetailOutDetail.FieldByName('conno').AsString:=edtConnoScan.Text;
   //            qrylocinskudetail.FieldByName('locid').AsString:=strlocid;
   //            qrylocinskudetail.FieldByName('locname').AsString:=strlocname;
               data.qrySkuDetailOutDetail.FieldByName('color').AsString:=color;
               data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=skuspec;
               data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=quantity;
               OpenSql(dataTmp.qryTmp,' Select top 1 piecepro,volumepro,weightpro,areapro,'+chr(13)+chr(10)
                             +'        quantityuom,pieceuom,volumeuom,areauom,weightuom,sizeuom '+chr(13)+chr(10)
                             +'   from sku(nolock) '+chr(13)+chr(10)
                             +'  where sku.skuid="'+strpskuid+'"'
                             +'    and sku.skuname="'+strpskuname+'"');
               data.qrySkuDetailOutDetail.FieldByName('SerialNO').AsString      :=edtCustomerNo.Text;
               data.qrySkuDetailOutDetail.FieldByName('QuantityUOM').AsString:=dataTmp.qryTmp.fieldbyname('QuantityUOM').AsString;
               data.qrySkuDetailOutDetail.FieldByName('sizeuom').AsString    :=dataTmp.qryTmp.fieldbyname('sizeuom').AsString;

               data.qrySkuDetailOutDetail.Post;
            end;
         end;
         data.qrySkuDetailOutDetail.EnableControls;
      end else
      begin//无此商品编码的商品
         kMessageDlg(GetMessage('frmSkuDetailOut','003'), mtWarning, [mbOK], 0);
         exit;
      end;
   end;
end;

procedure TfrmSkuDetailOut.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:integer;
   qryselect:TKADOQuery;
begin
//非出仓数据从商品挑选
   begin
      qryselect:=PGetSKUSelect('','','T');
      qryselect.First;
      i:=0;
      while not qryselect.Eof do
      begin
         if i=0 then
         begin
            data.qryskudetailoutdetail.Edit;
         end else
            data.qryskudetailoutdetail.Append;
         Inc(i);
         data.qryskudetailoutdetail.Fieldbyname('quantity').AsInteger  :=1;
         data.qryskudetailoutdetail.FieldByName('SkuId').AsString  :=qryselect.fieldbyname('skuid').AsString;
         data.qryskudetailoutdetail.FieldByName('SkuName').AsString  :=qryselect.fieldbyname('skuname').AsString;
         data.qryskudetailoutdetail.FieldByName('QuantityUOM').AsString:=qryselect.fieldbyname('QuantityUOM').AsString;
         data.qryskudetailoutdetail.FieldByName('sizeuom').AsString    :=qryselect.fieldbyname('sizeuom').AsString;
         data.qryskudetailoutdetail.fieldbyname('serialno').asstring   :=qryselect.FieldByName('customerno').AsString;
         try
            data.qryskudetailoutdetail.Post;
         except
            break;
         end;
         qryselect.Next;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmSkuDetailOut.shipercusnamegridButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qryselect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qryselect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOutDetail.Edit;
         data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
//         blnSelect:=True;
//         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmSkuDetailOut.shipercusnamegridValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText='') then
   begin
      data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:='';
      data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:='';
   end;
end;

procedure TfrmSkuDetailOut.edtshippercusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOut.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOut.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;


procedure TfrmSkuDetailOut.edtshippercusnameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtshippercusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtshippercusname.Text='' then
      begin
         data.qrySkuDetailOut.Edit;
         data.qrySkuDetailOut.FieldByName('shippercusid').AsString  :='';
         data.qrySkuDetailOut.FieldByName('shippercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('E',edtcostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('shippercusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmSkuDetailOut.grdSKUDetailChangeNodeEx(Sender: TObject);
begin
   data.qrySkuDetailOutLoc.Filtered:=false;
   if data.qrySkuDetailOutDetail.fieldbyname('SNO').AsString<>'' then
      data.qrySkuDetailOutLoc.filter:='SNO='+data.qrySkuDetailOutDetail.fieldbyname('SNO').AsString
   else
      data.qrySkuDetailOutLoc.filter:='SNO=-1';
   data.qrySkuDetailOutLoc.Filtered:=true;
end;

procedure TfrmSkuDetailOut.grdSKUDetailEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmSkuDetailOut.grdSKUDetailEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qrySkuDetailOutDetail.IsEmpty) then
   begin
      mitAddLocOldClick(Sender);
   end;
end;

procedure TfrmSkuDetailOut.grdSKUDetailExit(Sender: TObject);
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

procedure TfrmSkuDetailOut.grdSkuDetailLocEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmSkuDetailOut.grdSkuDetailLocExit(Sender: TObject);
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

procedure TfrmSkuDetailOut.btnInputClick(Sender: TObject);
begin
   if data.qrySkuDetailOutDetail.IsEmpty then
   begin
      KMessageDlg('请先输入商品信息!',mtWarning,[mbok],0);
      exit;
   end;
   if DataState in Setdcs then
   begin
      blnisgetloc:=true;
//      data.qrySkuDetailOutLoc.CancelUpdates;
      strsql:='   if exists(select * from tempdb..sysobjects '
             +'      where id=object_id("tempdb..#lskouttxt") and sysstat & 0xf=3) '
             +'   drop table #lskouttxt '
             +' create table #lskouttxt( '
             +'    serialno varchar(50), '
             +'    skuname  varchar(50), '
             +'    color    varchar(50), '
             +'    skuspec  varchar(20), '
             +'    quantity numeric(16,4)) ';
      ExecSql(dataTmp.qryTmp,strsql);
      btnSave.Click;
      data.qrySkuDetailOutLoc.DisableControls;
      data.qrySkuDetailOutLoc.Close;
      data.qrySkuDetailOutLoc.Open;
      grdSKUDetailChangeNodeEx(nil);
      data.qrySkuDetailOutLoc.EnableControls;
      if strPhLocMsg<>'' then
      begin
         QueryExportTxt('#lskouttxt').SaveToFile(GetExedir+'\'+'缺货记录'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'('+data.qrySkuDetailOut.fieldbyname('cusbillno').AsString+')'+'.txt');
         KMessageDlg('存在缺货,已经记录在'+GetExedir+'\'+'缺货记录'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'('+data.qrySkuDetailOut.fieldbyname('cusbillno').AsString+')'+'.txt',
                     mtInformation,[mbOK],0);
      end;
      execsql(datatmp.qryTmp,'update skudetailoutloc set skubrand=customer.cuscode '
                    +'  from customer(nolock) '
                    +' where skudetailoutloc.costcusid=customer.cusid '
                    +'   and skudetailoutloc.jobno="'+data.qrySkuDetailOut.FieldByName('jobno').AsString+'" '
             );
   end;
end;

function TfrmSkuDetailOut.KspGetSkudetailoutLoc( pstrJobno:string;pIsdel:string='F'):string;
var
  strErmsg:string;
  //lzw20101208
  strblno:string;
begin
  strErmsg:='';
  strblno:='';
  opensql(dataTmp.qryTmp,'select * from customer(nolock) '
                        +' where cusid="'+edtcostcusid.TextField+'" '
                        +'   and isnull(parentid,"")="" '
          );
  strblno:=dataTmp.qryTmp.FieldByName('cuscode').AsString;
  try
    //lzw20101208
    //execsql(dataTmp.qryTmp,'exec ksp_GetSkudetailoutLoc "'+pstrJobno+'","'+cmblocID.TextField+'","'+_phType+'" ');
    execsql(dataTmp.qryTmp,'exec ksp_GetSkudetailoutLoc "'+pstrJobno+'","'+cmblocID.TextField+'","'+strblno+'" ,"'+_phType+'"');

  except
    raise;
    exit;
  end;
  try
     OpenSql(dataTmp.qryTmp,'select * from #lskouttxt');
    if not dataTmp.qryTmp.IsEmpty then
    begin
{
      dataTmp.qryTmp.First;
      while (not dataTmp.qryTmp.Eof) do
      begin
        strErmsg:=strErmsg+dataTmp.qryTmp.FieldByName('errormes').AsString+chr(13)+chr(10);
        dataTmp.qryTmp.next;
      end;
    end else
    begin
      strErmsg:='';
}
    strErmsg:='存在配货不足!';
    end;
  finally

  end;
  Result:=strErmsg;
  if (Result<>'') and (_phType='T') then
  begin
    try
      if _ADOConnection.InTransaction then _ADOConnection.rollback;
    except
    end;
    raise Exception.Create(strErmsg);
  end;
end;

procedure TfrmSkuDetailOut.edtCusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('B','');
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmSkuDetailOut.edtCusnameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtCusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcostcusid.Text='' then
      begin
         data.qrySkuDetailOut.Edit;
         data.qrySkuDetailOut.FieldByName('cusid').AsString  :='';
         data.qrySkuDetailOut.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtcostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('cusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

function TfrmSkuDetailOut.KspSkuDetailToOut( pstrJobno:string):string;
var
  strErmsg:string;
begin
  strErmsg:='';
  try
    opensql(dataTmp.qryTmp,'exec ksp_SkuDetailToOut "'+pstrJobno+'",""');
  except
    raise;
    exit;
  end;
  try
    if dataTmp.qryTmp.RecordCount<>0 then
    begin
      dataTmp.qryTmp.First;
      while (not dataTmp.qryTmp.Eof) do
      begin
        strErmsg:=strErmsg+dataTmp.qryTmp.FieldByName('errormsg').AsString+chr(13)+chr(10);
        dataTmp.qryTmp.next;
      end;
    end else
    begin
      strErmsg:='';
    end;
  finally

  end;
  Result:=strErmsg;
  if Result<>'' then
  begin
    try
      if _ADOConnection.InTransaction then _ADOConnection.rollback;
    except
    end;
    raise Exception.Create(strErmsg);
  end;
end;


procedure TfrmSkuDetailOut.grdSkuDetailOutCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if trim(ANode.Values[jobnoout.Index])<>'' then
   begin
      AColor := clSkyBlue;
   end;

   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;

end;

procedure TfrmSkuDetailOut.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmSkuDetailOut.btnSkuInClick(Sender: TObject);
var
   strName,strcustomerno:string;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
//         strSql:='ksp_GetSkudetailOutdetailfromExcel';
         strSql:=' Select * '+
                 '   from [通知单$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';
   if _strsyscus='XT' then
   begin
      ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskexcel '+chr(10)+chr(13)
                         +'create table #lskexcel( '+chr(10)+chr(13)
                         +'     customerno varchar(50), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     colorid  varchar(50), '+chr(10)+chr(13)
                         +'     specid   varchar(50), '+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     customername varchar(100), '+chr(10)+chr(13)
                         +'     skucolorid  varchar(50) '+chr(10)+chr(13)
                         +')'
          );
      try
         if ((AqryMtf.FieldCount=7) and (AqryMtf.Fields[5].FieldName='客户名称')) or
            ((AqryMtf.Fields[0].FieldName='商品编码') and
            (AqryMtf.Fields[1].FieldName='单位') and
            (AqryMtf.Fields[2].FieldName='颜色') and
            (AqryMtf.Fields[3].FieldName='尺码') and
            (AqryMtf.Fields[4].FieldName='数量') and
            (AqryMtf.Fields[6].FieldName='颜色代码')
            ) then
         begin
            AqryMtf.First;
            while not AqryMtf.Eof do
            begin  //EXCEL格式判断
               strsql:=strsql+' insert into #lskexcel(customerno,quantityuom,colorid,specid,quantity,customername,skucolorid)'+chr(10)+chr(13)
                             +'   values("'+AqryMtf.Fields[0].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[1].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[2].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[3].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[4].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[5].AsString+'", '+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[6].AsString+'"  '+chr(10)+chr(13)

                             +')'
                             ;
               AqryMtf.Next;
            end;
         end;

      except
         KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end else
   begin
      ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskexcel '+chr(10)+chr(13)
                         +'create table #lskexcel( '+chr(10)+chr(13)
                         +'     serialno varchar(50), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     colorid  varchar(50), '+chr(10)+chr(13)
                         +'     specid   varchar(50), '+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     customercode varchar(50), '+chr(10)+chr(13)
                         +'     customername varchar(100) '
                         +')'
          );
      try
         if ((AqryMtf.FieldCount=8) and (AqryMtf.Fields[7].FieldName='客户代码')
                                    and (AqryMtf.Fields[8].FieldName='客户名称')) or
            ((AqryMtf.Fields[0].FieldName='商品代码') and
            (AqryMtf.Fields[2].FieldName='单位') and
            (AqryMtf.Fields[3].FieldName='颜色代码') and
            (AqryMtf.Fields[4].FieldName='尺码名称') and
            (AqryMtf.Fields[5].FieldName='数量')) then
         begin
            AqryMtf.First;
            while not AqryMtf.Eof do
            begin  //EXCEL格式判断
               strsql:=strsql+' insert into #lskexcel(serialno,quantityuom,colorid,specid,quantity,customercode,customername)'
                             +'   values("'+AqryMtf.Fields[0].AsString+'",'
                             +'          "'+AqryMtf.Fields[2].AsString+'",'
                             +'          "'+AqryMtf.Fields[3].AsString+'",'
                             +'          "'+AqryMtf.Fields[4].AsString+'",'
                             +'           '+AqryMtf.Fields[5].AsString;
               if AqryMtf.FieldCount=8 then
                  strsql:=strsql+',"'+AqryMtf.Fields[6].AsString+'","'+AqryMtf.Fields[7].AsString+'") '
               else strsql:=strsql+',"","")';
               AqryMtf.Next;
            end;
         end;
      except
         KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);

         opensql(dataTmp.qryTmp,'ksp_GetSkudetailFromExcel');
         while not dataTmp.qryTmp.Eof do
         begin
            data.qrySkuDetailOutDetail.Append;
            grdskudetailbeforeInsert;
            data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
            data.qrySkuDetailOutDetail.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
            //商品编码
            data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
            data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=dataTmp.qryTmp.fieldbyname('quantity').AsFloat;
            data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
            data.qrySkuDetailOutDetail.Post;
            dataTmp.qryTmp.Next;
         end;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;
end;

function TfrmSkuDetailOut.MasterInfoCheck:Boolean;
begin
   Result:=false;
   if dtdTaskDate.Date=0 then
   begin
      {if _Language='CAPTIONC' then _strmessage:='操作日期不能为空，必须填写'
      else _strmessage:='**************';}
      KMessageDlg(GetMessage('frmSkuDetailOut','001'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end else
   if data.qrySkuDetailOut.FieldByName('iuserid').AsString='' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='执行部门不能为空，必须填写'
      else _strmessage:='**************'; }
      KMessageDlg(GetMessage('frmSkuDetailOut','002'),mtWarning,[mbOK],0);
      ActiveControl:=edtiUsername;
      Exit;
   end;
   if data.qrySkuDetailOut.FieldByName('costcusid').AsString='' then
   begin
      KMessageDlg(GetMessage('frmSkuDetailOut','004'),mtWarning,[mbOK],0);
//      KMessageDlg('费用关系人不能为空!',mtWarning,[mbOK],0);
      ActiveControl:=edtcostcusid;
      Exit;
   end;
   if data.qrySkuDetailOut.FieldByName('shippercusid').AsString='' then
   begin
//      KMessageDlg('货主不能为空!',mtWarning,[mbOK],0);
      KMessageDlg(GetMessage('frmSkuDetailOut','005'),mtWarning,[mbOK],0);
      ActiveControl:=edtshipcusname;
      Exit;
   end;
   if data.qrySkuDetailOut.FieldByName('skucostclasscd').AsString='' then
   begin
//      KMessageDlg('商品类不能为空!',mtWarning,[mbOK],0);
      KMessageDlg(GetMessage('frmSkuDetailOut','006'),mtWarning,[mbOK],0);
      ActiveControl:=cmbskucostclasscd;
      Exit;
   end;
   //lzw20120519
   begin
      opensql(datatmp.qryTmp,'select num=count(cusbillno)'
                            +'  from skudetailout (nolock) '
                            +' where cusbillno="'+data.qrySkuDetailOut.FieldByName('cusbillno').Asstring+'"'
                            +'   and jobno<>"'+data.qrySkuDetailOut.FieldByName('jobno').Asstring+'"'
                            );
      if (datatmp.qryTmp.fieldbyName('num').asinteger<>0)  then
      begin
         if KmessageDlg('存在相同的客户单号,是否要保存?',mtConfirmation,[mbYes,mbNo],0)=mrNO then
            exit;
      end;
   end;
   result:=true;
end;

procedure TfrmSkuDetailOut.mitBHDClick(Sender: TObject);
begin
   WorkReportBHD('900032','old','',data.qrySDO.fieldbyname('jobno').asstring);
   execsql(datatmp.qryTmp,'update skudetailout set '
                 +'       printname="'+_loginname+'",printdate="'+datetostr(getserverdate)+'",   '
                 +'       printnum=isnull(printnum,0)+1                                          '
                 +' where jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'"                  '
          );
end;

procedure TfrmSkuDetailOut.cmblocIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      cmblocID.TextField  :=qrySelect.FieldByName('classid').asstring;
      cmblocID.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmSkuDetailOut.cmblocIDExit(Sender: TObject);
begin
   if cmblocID.Text='' then cmblocID.TextField:='';
end;

procedure TfrmSkuDetailOut.btninputnewClick(Sender: TObject);
var
   strName:string;
   i:integer;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
         strSql:=' Select * '+
                 '   from [SHEET0$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';

   ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                      +'           where id=object_id("tempdb..#lskexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                      +'    drop table #lskexcel '+chr(10)+chr(13)
                      +'create table #lskexcel( '+chr(10)+chr(13)
                      +'     customerno varchar(50), '+chr(10)+chr(13)
                      +'     quantityuom varchar(8), '+chr(10)+chr(13)
                      +'     colorid  varchar(50), '+chr(10)+chr(13)
                      +'     specid   varchar(50), '+chr(10)+chr(13)
                      +'     quantity numeric(16,4), '+chr(10)+chr(13)
                      +'     customername varchar(100) '+chr(10)+chr(13)
                      +')'
       );
   try
      begin
         i:=0;
         AqryMtf.First;
         //lzw20101110
         while not AqryMtf.Eof do
         begin  //EXCEL格式判断
            if i=0 then
            begin
               data.qrySkuDetailOut.Edit;
               data.qrySkuDetailOut.FieldByName('remark').AsString:=AqryMtf.Fields[0].AsString;
            end;
            i:=i+1;

            if (i>7) and (AqryMtf.Fields[7].AsString<>'合计')and (AqryMtf.Fields[8].asfloat<>0) then
            begin
               strsql:=strsql+' insert into #lskexcel(customerno,quantityuom,colorid,specid,quantity,customername)'
                          +'   values("'+AqryMtf.Fields[1].AsString+'",'
                          +'          "'+AqryMtf.Fields[3].AsString+'",'
                          +'          "'+AqryMtf.Fields[5].AsString+'",'
                          +'          "'+AqryMtf.Fields[7].AsString+'",'
                          +'          "'+AqryMtf.Fields[8].AsString+'",'
                          +'          "'+edtshipcusname.Text+'" '
                          +')'
                          ;
            end;

            AqryMtf.Next;
         end;
      end;
   except
      KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
      conMtf.Close;
      Exit;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);
         opensql(dataTmp.qryTmp,'ksp_GetSkudetailFromExcel');
         while not dataTmp.qryTmp.Eof do
         begin
            data.qrySkuDetailOutDetail.Append;
            grdskudetailbeforeInsert;
            data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
            data.qrySkuDetailOutDetail.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
            //商品编码
            data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
            data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=dataTmp.qryTmp.fieldbyname('quantity').AsFloat;
            data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
            data.qrySkuDetailOutDetail.Post;
            dataTmp.qryTmp.Next;
         end;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;

end;

procedure TfrmSkuDetailOut.edtshipcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('E','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         data.qrySkuDetailOut.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySkuDetailOut.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmSkuDetailOut.edtshipcusnameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSkuDetailOut.edtshipcusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtshippercusname.Text='' then
      begin
         data.qrySkuDetailOut.Edit;
         data.qrySkuDetailOut.FieldByName('shipcusid').AsString  :='';
         data.qrySkuDetailOut.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('E',edtcostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrySkuDetailOut.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySkuDetailOut.FieldByName('shipcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;

end;

procedure TfrmSkuDetailOut.btncheckdetailClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   opensql(datatmp.qryTmp2,'select * from SkuDetailOut(nolock)               '+chr(13)+chr(10)
                 +' where jobno="'+data.qrySkuDetailOut.FieldByName('jobno').AsString+'"'+chr(13)+chr(10)
          );
   if datatmp.qryTmp2.FieldByName('checkid').AsString='T' then
   begin
      KMessageDlg('该单号已校验！',mtWarning,[mbOK],0);
      exit;
   end;
   opensql(datatmp.qryTmp2,'select 1 from SkuDetailOutloc(nolock)               '+chr(13)+chr(10)
                 +' where jobno="'+data.qrySkuDetailOut.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
          );
   if  datatmp.qryTmp2.IsEmpty then
   begin
      KMessageDlg('该单号未拣货,不能校验！',mtWarning,[mbOK],0);
      exit;
   end else
   begin
      workoutdetailcash(data.qrySkuDetailOut.FieldByName('jobno').AsString);
      frmskudetailout.btnRefresh.OnClick(Sender);
      {
      _ADOConnection.Starttransaction;
      try
         ExecSql(datatmp.qryTmp1,' update SkuDetailOut                                   '+chr(13)+chr(10)
                                +'    set checkid="T",ischeckname="'+_loginname+'",ischeckdate=getdate()     '+chr(13)+chr(10)
                                +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"   '+chr(13)+chr(10)
                       );
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.Rollback;
         raise;
         exit;
      end;
      }
   end;

end;

procedure TfrmSkuDetailOut.ItemDetailEdit1Click(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   WorkOperation(stBrowse,data.qrySkuDetailOut.FieldByName('Jobno').AsString,
                          data.qrySkuDetailOut.FieldByName('UserID').AsString);
end;

procedure TfrmSkuDetailOut.mitoutplanClick(Sender: TObject);
var
   KF1Book:TKF1book;
   lstPara:TStringList;
begin
   try
      if pgcMain.ActivePage<>tbsEdit  then pgcMain.ActivePage:=tbsEdit;
      //lzw20110302
      if Pos('七匹狼',edtcostcusid.Text)>0 then
         OpenSql(datatmp.qryTmp2,'ksp_phplan @jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'" ')
      else if Pos('鸿星尔克',edtcostcusid.Text)>0 then
         OpenSql(datatmp.qryTmp2,'ksp_hxekphplan @jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'" ')
      else if Pos('鳄莱特',edtcostcusid.Text)>0 then
         OpenSql(datatmp.qryTmp2,'ksp_eltphplan @jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'" ')   ;

      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         lstPara:=TStringList.Create;
         OpenSql(datatmp.qryTmp,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                               +'       SkuDetailOut.cusbillno,SkuDetailOut.ischeckname,  '+chr(13)+chr(10)
                               +'       SkuDetailOut.remark,SkuDetailOut.LocationBillNO   '+chr(13)+chr(10)
                               +'  from SkuDetailOut(nolock)       '+chr(13)+chr(10)
                               +'       left join customer(nolock) '+chr(13)+chr(10)
                               +'              on customer.cusid=SkuDetailOut.shipcusid   '+chr(13)+chr(10)
                               +' where jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'" '+chr(13)+chr(10)
                   );
         //lzw20110302
         if Pos('七匹狼',edtcostcusid.Text)>0 then
            Bbdm:='100123'
         else if Pos('鸿星尔克',edtcostcusid.Text)>0 then
            Bbdm:='100024'
         else if Pos('鳄莱特',edtcostcusid.Text)>0 then
            Bbdm:='100043';

         //lzw20101112
         paras.Values['shipcusname']:=datatmp.qryTmp.FieldByname('shipcusname').AsString;
         paras.Values['address']:=datatmp.qryTmp.FieldByname('address').AsString;
         paras.Values['mobiletel']:=datatmp.qryTmp.FieldByname('mobiletel').AsString;
         paras.Values['cusbillno']:=datatmp.qryTmp.FieldByname('cusbillno').AsString;
         paras.Values['jyy']:=datatmp.qryTmp.FieldByname('ischeckname').AsString;
         paras.Values['remark']:=datatmp.qryTmp.FieldByname('remark').AsString;
         //lzw20110722
         paras.Values['LocationBillNO']:=datatmp.qryTmp.FieldByname('LocationBillNO').AsString;

         OpenSql(datatmp.qryTmp1,'select xs=count(conno)                '+chr(13)+chr(10)
                      +'   from locationinoutcon(nolock)       '+chr(13)+chr(10)
                      +'  where jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'" '+chr(13)+chr(10)
                );
         paras.Values['xs']:=datatmp.qryTmp1.FieldByname('xs').AsString;
         paras.Values['zdr']:=_loginname;

         paras.Values['username']:=_Username;
         paras.Values['date']:=DateToStr(Now);
         paras.Values['sj']:=TimeToStr(now);
         qryMain:=datatmp.qryTmp2;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
      execsql(datatmp.qryTmp,'update skudetailout set '
                 +'       printname="'+_loginname+'",printdate="'+datetostr(getserverdate)+'",   '
                 +'       printnum=isnull(printnum,0)+1                                          '
                 +' where jobno="'+data.qrySDO.fieldbyname('jobno').asstring+'"                  '
          );
end;

procedure TfrmSkuDetailOut.mitcheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   if KmessageDlg('确认强制校验吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' update SkuDetailOut                                   '+chr(13)+chr(10)
                    +'    set checkid="T",ischeckname="'+_loginname+'",ischeckdate=getdate()                 '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"   '+chr(13)+chr(10)
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

procedure TfrmSkuDetailOut.mituncheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if datatmp.qryTmp.FieldByName('isout').AsString='T' then
   begin
      KMessageDlg('该配货单已出货,不能取消校验!',mtWarning,[mbOK],0);
      Exit;
   end;
   if KmessageDlg('确认取消校验吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' update SkuDetailOut                                   '+chr(13)+chr(10)
                    +'    set checkid="F"                                    '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)

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

procedure TfrmSkuDetailOut.btnCheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   //lzw20110826
   if data.qrySkuDetailOut.FieldByName('jobnoout').AsString='' then
   begin
      KMessageDlg('未生成出仓!不用审核',mtWarning,[mbOK],0);
      exit;
   end;

   if KmessageDlg('确认审核吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' update SkuDetailOut                                   '+chr(13)+chr(10)
                             +'    set checkname="'+_loginname+'",checkdate="'+datetostr(getserverdate)+'"  '+chr(13)+chr(10)
                             +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"   '+chr(13)+chr(10)
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

procedure TfrmSkuDetailOut.mitcancelcheck1Click(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if datatmp.qryTmp.FieldByName('isout').AsString='T' then
   begin
      KMessageDlg('该配货单已出货,不能取消!',mtWarning,[mbOK],0);
      Exit;
   end;
   if KmessageDlg('确认取消扫描吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,'DELETE ck_lskoutcheckdetail                            '+chr(13)+chr(10)
                             +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'" '+chr(13)+chr(10)
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

procedure TfrmSkuDetailOut.btninputbsClick(Sender: TObject);
var
   strName:string;
   i:integer;
   //lzw20110306
   Sheet   :   OleVariant;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      //lzw20110306
      //WorkSheet[1].Columns[10].NumberFormatlocal := '@'
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
         if Pos('批发销货通知单',strName)>0 then
            strSql:=' Select * '+
                '   from [批发销货通知单$] '
         else if Pos('渠道调拨通知单',strName)>0 then
            strSql:=' Select * '+
                '   from [渠道调拨通知单$] '
         else if Pos('商店配货通知单',strName)>0 then
            strSql:=' Select * '+
                '   from [商店配货通知单$] '       ;
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';

   ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                      +'           where id=object_id("tempdb..#lskexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                      +'    drop table #lskexcel '+chr(10)+chr(13)
                      +'create table #lskexcel( '+chr(10)+chr(13)
                      +'     customerno varchar(50), '+chr(10)+chr(13)
                      +'     quantityuom varchar(8), '+chr(10)+chr(13)
                      +'     colorid  varchar(50), '+chr(10)+chr(13)
                      +'     specid   varchar(50), '+chr(10)+chr(13)
                      +'     quantity numeric(16,4), '+chr(10)+chr(13)
                      //lzw20111106
                      //+'     price numeric(16,4), '+chr(10)+chr(13)
                      +'     customername varchar(100) '+chr(10)+chr(13)
                      +')'
       );
   try
      begin
         i:=0;
         AqryMtf.First;
         //lzw20101110
         while not AqryMtf.Eof do
         begin  //EXCEL格式判断
            if i=0 then
            begin
               data.qrySkuDetailOut.Edit;
               data.qrySkuDetailOut.FieldByName('remark').AsString:=AqryMtf.Fields[0].AsString;
            end;
            i:=i+1;

            if (i>21) and (AqryMtf.Fields[0].AsString<>'合计') then
            begin
               strsql:=strsql+' insert into #lskexcel(customerno,quantityuom,colorid,specid,quantity,'
                             //+'                        price,     '
                             +'               customername)'
                          +'   values("'+AqryMtf.Fields[0].AsString+'",'
                          +'          "'+AqryMtf.Fields[2].AsString+'",'
                          +'          "'+AqryMtf.Fields[6].AsString+'",'
                          +'          "'+AqryMtf.Fields[8].AsString+'",'
                          +'          "'+AqryMtf.Fields[9].AsString+'",'
                          //lzw20111106
                          //+'          "'+AqryMtf.Fields[12].AsString+'",'
                          +'          "'+edtshipcusname.Text+'" '

                          +')'
                          ;
            end;

            AqryMtf.Next;
         end;
      end;
   except
      KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
      conMtf.Close;
      Exit;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);
         opensql(dataTmp.qryTmp,'ksp_GetSkudetailFromExcel');
         while not dataTmp.qryTmp.Eof do
         begin
            data.qrySkuDetailOutDetail.Append;
            grdskudetailbeforeInsert;
            data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
            data.qrySkuDetailOutDetail.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
            //商品编码
            data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
            data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=dataTmp.qryTmp.fieldbyname('quantity').AsFloat;
            data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
            //lzw20111106
            //data.qrySkuDetailOutDetail.FieldByName('price').AsString:=dataTmp.qryTmp.fieldbyname('price').AsString;
            data.qrySkuDetailOutDetail.Post;
            dataTmp.qryTmp.Next;
         end;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;

end;

procedure TfrmSkuDetailOut.mitunloc1Click(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if datatmp.qryTmp.FieldByName('isout').AsString='T' then
   begin
      KMessageDlg('该配货单已出货,不能修改!',mtWarning,[mbOK],0);
      Exit;
   end;
   if KmessageDlg('确认取消配货吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' DELETE SkuDetailOutLoc                            '+chr(13)+chr(10)
                             +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
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

procedure TfrmSkuDetailOut.btnhxekClick(Sender: TObject);
var
   strName:string;
   strcolorid,strspecid,strcustomerno,strskucustomerno :string;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
//         strSql:='ksp_GetSkudetailOutdetailfromExcel';
         strSql:=' Select * '+
                 '   from [sheet1$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';
   if _strsyscus='XT' then
   begin
      ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskexcel '+chr(10)+chr(13)
                         +'create table #lskexcel( '+chr(10)+chr(13)
                         +'     customerno varchar(50), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     colorid  varchar(50), '+chr(10)+chr(13)
                         +'     specid   varchar(50), '+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     customername varchar(100) '+chr(10)+chr(13)
                         +')'
          );
      try
         if ((AqryMtf.Fields[0].FieldName='商品') and (AqryMtf.Fields[0].FieldName<>'') ) then
         begin
            AqryMtf.First;
            while ((not AqryMtf.Eof) ) do
            begin  //EXCEL格式判断
               if (AqryMtf.Fields[0].AsString<>'') then
               begin
                  //导入加入比对
                  {strskucustomerno:=copy(AqryMtf.Fields[0].AsString,1,6);

                  openSql(dataTmp.qryTmp2,'select sku.customerno,skucolor.colorname,skuspec.specname        '+chr(13)+chr(10)
                                         +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                                         +' where rtrim(sku.customerno)+rtrim(skuspec.barcode)="'+AqryMtf.Fields[0].AsString+'" '+chr(13)+chr(10)
                                         +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                                         +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                                         +'   and sku.customerno like "'+strskucustomerno+'%"  '+chr(13)+chr(10)
                                         +'   and sku.cusname="鸿星尔克"          '+chr(13)+chr(10)

                         );
                  }
                  strspecid:=copy(AqryMtf.Fields[0].AsString,length(AqryMtf.Fields[0].AsString)-1,2);
                  //lzw20110813
                  strcustomerno:=copy(AqryMtf.Fields[0].AsString,1,8)+'-'+copy(AqryMtf.Fields[0].AsString,9,2);
                  opensql(dataTmp.qryTmp2,'select colorname from skucolor(nolock) '
                                         +' where skuid in (select skuid from sku(nolock)    '
                                         +'                  where customerno="'+strcustomerno+'") '
                               );
                  strcolorid:=dataTmp.qryTmp2.fieldbyname('colorname').AsString;
                  //lzw20110817
                  //strspecid:=dataTmp.qryTmp2.fieldbyname('specname').AsString;
                  //strcolorid:=dataTmp.qryTmp2.fieldbyname('colorname').AsString;
                  //strcustomerno:=dataTmp.qryTmp2.fieldbyname('customerno').AsString;

                  strsql:=strsql+' insert into #lskexcel(customerno,quantityuom,colorid,specid,quantity,customername)'
                                +'   values("'+strcustomerno+'",'
                                +'          "件",'
                                +'          "'+strcolorid+'",'
                                +'          "'+strspecid+'",'
                                +'          '+AqryMtf.Fields[2].AsString+','
                                +'          "" '
                                +')'
                                ;
               end;
               AqryMtf.Next;
            end;
         end;
      except
         KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);
         opensql(dataTmp.qryTmp,'ksp_GetSkudetailFromExcel');
         while not dataTmp.qryTmp.Eof do
         begin
            data.qrySkuDetailOutDetail.Append;
            grdskudetailbeforeInsert;
            data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
            data.qrySkuDetailOutDetail.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
            //商品编码
            data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
            data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=dataTmp.qryTmp.fieldbyname('quantity').AsFloat;
            data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
            data.qrySkuDetailOutDetail.Post;
            dataTmp.qryTmp.Next;
         end;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;

end;

procedure TfrmSkuDetailOut.mitcheckcyClick(Sender: TObject);
var
   KF1Book:TKF1book;
   lstPara:TStringList;
begin
   KF1Book:=TKF1book.Create;
   with KF1Book do
   begin
      lstPara:=TStringList.Create;
      opensql(datatmp.qryTmp1,'select quantity=sum(isnull(ck_detail.quantity,0)),serialno=rtrim(ck_detail.serialno), '+chr(13)+chr(10)
                     +'       color=rtrim(ck_detail.color),skuspec=rtrim(ck_detail.skuspec), '+chr(13)+chr(10)
                     +'       skuname=ck_detail.skuname,quantitysl=isnull(lskdetail.quantity,0)         '+chr(13)+chr(10)
                     +'  from ck_SkuDetailOutDetail ck_detail(nolock)          '+chr(13)+chr(10)
                     +'       left join (select detail.jobno,quantity=sum(isnull(detail.quantity,0)),detail.skuname, '+chr(13)+chr(10)
                     +'                         bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                     +'                    from SkuDetailOutDetail detail(nolock)                                       '+chr(13)+chr(10)
                     +'                   group by detail.jobno,detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) )  '+chr(13)+chr(10)
                     +'                      as lskdetail                                            '+chr(13)+chr(10)
                     +'              on lskdetail.jobno=ck_detail.jobno                      '+chr(13)+chr(10)
                     +'             and lskdetail.bs=rtrim(ck_detail.serialno)+rtrim(ck_detail.color)+rtrim(ck_detail.skuspec) '+chr(13)+chr(10)
                     +' where ck_detail.jobno="'+data.qrysdo.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
                     +' group by ck_detail.skuname,rtrim(ck_detail.serialno),rtrim(ck_detail.color),rtrim(ck_detail.skuspec),lskdetail.quantity '+chr(13)+chr(10)
                     +'having sum(isnull(ck_detail.quantity,0))<>isnull(lskdetail.quantity,0) '+chr(13)+chr(10)
                     +' order by rtrim(ck_detail.serialno),rtrim(ck_detail.color),rtrim(ck_detail.skuspec)   '+chr(13)+chr(10)
              );

      //lzw20101112
      paras.Values['shipcusname']:=data.qrySDO.fieldbyname('shipcusname').asstring;
      paras.Values['cusbillno']:=data.qrySDO.fieldbyname('cusbillno').asstring;
      paras.Values['date']:=DateToStr(Now);
      paras.Values['sj']:=TimeToStr(now);

      Bbdm:='100304';
      qryMain:=datatmp.qryTmp1;
      CreateReport;
   end;

end;

procedure TfrmSkuDetailOut.btnzcinputClick(Sender: TObject);
var
   strName,strcustomerno:string;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
         strSql:=' Select * '+
                 '   from [通知单$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';
   if _strsyscus='XT' then
   begin
      ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskzcexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskzcexcel '+chr(10)+chr(13)
                         +'create table #lskzcexcel( '+chr(10)+chr(13)
                         +'     customerno varchar(50), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     colorid  varchar(50), '+chr(10)+chr(13)
                         +'     specid   varchar(50), '+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     customername varchar(100) '+chr(10)+chr(13)
                         +')'
          );
      try
         if ((AqryMtf.FieldCount=6) and (AqryMtf.Fields[5].FieldName='客户名称')) or
            ((AqryMtf.Fields[0].FieldName='商品编码') and
            (AqryMtf.Fields[1].FieldName='单位') and
            (AqryMtf.Fields[2].FieldName='颜色') and
            (AqryMtf.Fields[3].FieldName='尺码') and
            (AqryMtf.Fields[4].FieldName='数量')) then
         begin
            AqryMtf.First;
            while not AqryMtf.Eof do
            begin  //EXCEL格式判断
               strsql:=strsql+' insert into #lskzcexcel(customerno,quantityuom,colorid,specid,quantity,customername)'+chr(10)+chr(13)
                             +'   values("'+AqryMtf.Fields[0].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[1].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[2].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[3].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[4].AsString+'",'+chr(10)+chr(13)
                             +'          "'+AqryMtf.Fields[5].AsString+'" '+chr(10)+chr(13)
                             +')'
                             ;
               AqryMtf.Next;
            end;
         end;

      except
         KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);

         //lzw20111126
         opensql(dataTmp.qryTmp2,'select customerno,drsl=sum(isnull(#lskzcexcel.quantity,0)),  '+chr(10)+chr(13)
                                +'       kc=sum(isnull(locinskudetail.quantityremain,0))-sum(isnull(skudetailoutdetail.quantity,0)) '+chr(10)+chr(13)
                                +'  from #lskzcexcel '+chr(10)+chr(13)
                                +'  left join locinskudetail(nolock)  '+chr(10)+chr(13)
                                +'         on ltrim(rtrim(isnull(#lskzcexcel.customerno,"")))=ltrim(rtrim(isnull(locinskudetail.serialno,""))) '+chr(10)+chr(13)
                                +'        and ltrim(rtrim(isnull(#lskzcexcel.colorid,"")))=ltrim(rtrim(isnull(locinskudetail.color,""))) '+chr(10)+chr(13)
                                +'        and ltrim(rtrim(isnull(#lskzcexcel.specid,"")))=ltrim(rtrim(isnull(locinskudetail.skuspec,""))) '+chr(10)+chr(13)
                                +'        and locinskudetail.skubrand in (select cuscode from customer(nolock) where cusid="'+edtshipcusname.TextField+'") '+chr(10)+chr(13)
                                +'  left join skudetailoutdetail(nolock) '+chr(10)+chr(13)
                                +'         on ltrim(rtrim(isnull(#lskzcexcel.customerno,"")))=ltrim(rtrim(isnull(skudetailoutdetail.serialno,""))) '+chr(10)+chr(13)
                                +'        and ltrim(rtrim(isnull(#lskzcexcel.colorid,"")))=ltrim(rtrim(isnull(skudetailoutdetail.color,""))) '+chr(10)+chr(13)
                                +'        and ltrim(rtrim(isnull(#lskzcexcel.specid,"")))=ltrim(rtrim(isnull(skudetailoutdetail.skuspec,""))) '+chr(10)+chr(13)
                                +'        and locinskudetail.skubrand in (select cuscode from customer(nolock) where cusid="'+edtshipcusname.TextField+'") '+chr(10)+chr(13)
                                +' where 1=1        '+chr(10)+chr(13)
                                +' group by customerno     '+chr(10)+chr(13)
                                +'having sum(isnull(#lskzcexcel.quantity,0))<>sum(isnull(locinskudetail.quantityremain,0))-sum(isnull(skudetailoutdetail.quantity,0)) '+chr(10)+chr(13)
                );
         if dataTmp.qryTmp2.RecordCount>0 then
         begin
            ExecSql(datatmp.qrytmp1,'if exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                             +'      where id=object_id("tempdb..#lskchecktxtck") and sysstat & 0xf=3) '+chr(10)+chr(13)
                             +'   drop table #lskchecktxtck '+chr(10)+chr(13)
                             +' create table #lskchecktxtck( '+chr(10)+chr(13)
                             +'    customerno       varchar(100), '+chr(10)+chr(13)
                             +'    drsl        varchar(100), '+chr(10)+chr(13)
                             +'    kc           varchar(100)  ) '+chr(10)+chr(13)
                             +'insert into #lskchecktxtck               '+chr(10)+chr(13)
                             +'select skucards="款号" ,drsl="订单数量",kc="库存数量"  '+chr(10)+chr(13)
                       );
            dataTmp.qryTmp2.First;
            while not dataTmp.qryTmp2.Eof do
            begin

               OpenSql(datatmp.qrytmp1, 'insert into #lskchecktxtck                                             '
                                   +'select customerno="'+dataTmp.qryTmp2.FieldByName('customerno').asstring+'",   '
                                   +'       drsl="'+dataTmp.qryTmp2.FieldByName('drsl').asstring+'",    '
                                   +'       kc="'+dataTmp.qryTmp2.FieldByName('kc').asstring+'"    '
                                   +'select * from  #lskchecktxtck          '

                           );
               dataTmp.qryTmp2.next;
            end;
            if datatmp.qrytmp1.recordcount>0 then
            begin
               //调用声音文件
               //frmdysounds.btnsoundsClick(self);
               if GetExedir+'\'+'出库导入记录'+strjobno+'.csv'='' then
               begin
                  QueryExportTxt('#lskchecktxtck').SaveToFile(GetExedir+'\'+'出库导入记录'+strjobno+'.csv');
               end else
               begin
                  DeleteFile(GetExedir+'\'+'出库导入记录'+strjobno+'.csv') ;
                  QueryExportTxt('#lskchecktxtck').SaveToFile(GetExedir+'\'+'出库导入记录'+strjobno+'.csv');
               end;
               ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'出库导入记录'+strjobno+'.csv'),'','',SW_SHOW);
               conMtf.Close;
               Exit;
            end;
            conMtf.Close;
            Exit;
         end;
         opensql(dataTmp.qryTmp,'ksp_GetSkudetailFromExcelzc');
         while not dataTmp.qryTmp.Eof do
         begin
            data.qrySkuDetailOutDetail.Append;
            grdskudetailbeforeInsert;
            data.qrySkuDetailOutDetail.FieldByName('shipcusid').AsString:=dataTmp.qryTmp.fieldbyname('shipcusid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('shipcusname').AsString:=dataTmp.qryTmp.fieldbyname('shipcusname').AsString;
            data.qrySkuDetailOutDetail.FieldByName('color').AsString:=dataTmp.qryTmp.fieldbyname('color').AsString;
            //商品编码
            data.qrySkuDetailOutDetail.FieldByName('serialno').AsString:=dataTmp.qryTmp.fieldbyname('serialno').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuspec').AsString:=dataTmp.qryTmp.fieldbyname('skuspec').AsString;
            data.qrySkuDetailOutDetail.FieldByName('quantity').AsFloat:=dataTmp.qryTmp.fieldbyname('quantity').AsFloat;
            data.qrySkuDetailOutDetail.FieldByName('quantityuom').AsString:=dataTmp.qryTmp.fieldbyname('quantityuom').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuid').AsString:=dataTmp.qryTmp.fieldbyname('skuid').AsString;
            data.qrySkuDetailOutDetail.FieldByName('skuname').AsString:=dataTmp.qryTmp.fieldbyname('skuname').AsString;
            data.qrySkuDetailOutDetail.Post;
            dataTmp.qryTmp.Next;
         end;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;
   btnzcinput.enabled:=false;
end;

procedure TfrmSkuDetailOut.btnskubrandClick(Sender: TObject);
var
   strmsg,strblno:string;

begin
   strblno:='';
   opensql(dataTmp.qryTmp,'select * from customer(nolock) '
                        +' where cusid="'+edtcostcusid.TextField+'" '
          );
   strblno:=dataTmp.qryTmp.FieldByName('cuscode').AsString;
   data.qrySkuDetailOutDetail.edit;
   data.qrySkuDetailOutDetail.FieldByName('skubrand').AsString:=strblno;
   if data.qrySkuDetailOutDetail.IsEmpty then
   begin
      KMessageDlg('请先输入商品信息!',mtWarning,[mbok],0);
      exit;
   end;
   if DataState in Setdcs then
   begin
      strmsg:='';
//      data.qrySkuDetailOutLoc.CancelUpdates;
      strsql:='   if exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
             +'      where id=object_id("tempdb..#lskoutqytxt") and sysstat & 0xf=3) '+chr(10)+chr(13)
             +'   drop table #lskoutqytxt '+chr(10)+chr(13)
             +' create table #lskoutqytxt( '+chr(10)+chr(13)
             +'    serialno varchar(20), '+chr(10)+chr(13)
             +'    skuname  varchar(50), '+chr(10)+chr(13)
             +'    color    varchar(20), '+chr(10)+chr(13)
             +'    skuspec  varchar(20), '+chr(10)+chr(13)
             +'    skubrand  varchar(20), '+chr(10)+chr(13)
             +'    jc       varchar(20), '+chr(10)+chr(13)
             +'    cc       varchar(20), '+chr(10)+chr(13)
             +'    dd       varchar(20))   '+chr(10)+chr(13)
             +'insert into #lskoutqytxt               '+chr(10)+chr(13)
             +'select serialno="款号" ,skuname="商品", color="颜色",skuspec="尺码",skubrand="区域",jc="进仓数量",cc="出仓数量",dd="订单数量"  '+chr(10)+chr(13) ;
      execSql(dataTmp.qryTmp,strsql);
      //lzw20111218
      try
        //execsql(dataTmp.qryTmp,'exec ksp_GetSkudetailoutLoc "'+pstrJobno+'","'+cmblocID.TextField+'","'+strblno+'" ,"'+_phType+'"');
         opensql(datatmp.qrytmp,'    if exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                               +' where id=object_id("tempdb..#lskindetail") and sysstat & 0xf=3) '+chr(10)+chr(13)
                               +'  drop table #lskindetail '+chr(10)+chr(13)
                               +'    if exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                               +' where id=object_id("tempdb..#lskoutdetail") and sysstat & 0xf=3) '+chr(10)+chr(13)
                               +'  drop table #lskoutdetail '+chr(10)+chr(13)
                               +'select quantity=isnull(sum(isnull(quantity,0)),0),skuid,serialno,color,skuspec,skuname,skubrand   '+chr(10)+chr(13)
                               +'  into #lskindetail                              '+chr(10)+chr(13)
                               +'  from locinskudetail(nolock)                           '+chr(10)+chr(13)
                               +' where 1=1                                              '+chr(10)+chr(13)
                               +'   and isnull(locinskudetail.skubrand,"")<>""                                       '+chr(10)+chr(13)
                               +' group by skuid,serialno,color,skuspec,skuname,skubrand   '+chr(10)+chr(13)
                               +'select quantity=isnull(sum(isnull(quantity,0)),0),skuid,serialno,color,skuspec,skuname,skubrand   '+chr(10)+chr(13)
                               +'  into #lskoutdetail                              '+chr(10)+chr(13)
                               +'  from skudetailoutloc(nolock)                           '+chr(10)+chr(13)
                               +' where 1=1                                              '+chr(10)+chr(13)
                               +' group by skuid,serialno,color,skuspec,skuname,skubrand   '+chr(10)+chr(13)
                               +'insert into #lskoutqytxt    '+chr(10)+chr(13)
                               +'select detail.serialno,detail.skuname,detail.color,detail.skuspec,skubrand="'+strblno+'" ,  '+chr(10)+chr(13)
                               +'       jc=isnull(sum(#lskindetail.quantity),0),cc=isnull(sum(#lskoutdetail.quantity),0),dd=sum(detail.quantity)  '+chr(10)+chr(13)
                               +'  from skudetailoutdetail detail(nolock) '+chr(10)+chr(13)

                               +'       left join #lskoutdetail(nolock)                                 '+chr(10)+chr(13)
                               +'              on isnull(detail.skubrand,"")=isnull(#lskoutdetail.skubrand,"")   '+chr(10)+chr(13)
                               +'             and isnull(detail.skuid,"")=isnull(#lskoutdetail.skuid,"")     '+chr(10)+chr(13)
                               +'             and isnull(detail.serialno,"")=isnull(#lskoutdetail.serialno,"")     '+chr(10)+chr(13)
                               +'             and isnull(detail.color,"")=isnull(#lskoutdetail.color,"")     '+chr(10)+chr(13)
                               +'             and isnull(detail.skuspec,"")=isnull(#lskoutdetail.skuspec,"")     '+chr(10)+chr(13)

                               +'       left join #lskindetail(nolock)                                      '+chr(10)+chr(13)
                               +'              on isnull(#lskindetail.skuid,"")=isnull(detail.skuid,"")     '+chr(10)+chr(13)
                               +'             and isnull(#lskindetail.skubrand,"")=isnull(detail.skubrand,"")     '+chr(10)+chr(13)
                               +'             and isnull(#lskindetail.serialno,"")=isnull(detail.serialno,"")     '+chr(10)+chr(13)
                               +'             and isnull(#lskindetail.color,"")=isnull(detail.color,"")     '+chr(10)+chr(13)
                               +'             and isnull(#lskindetail.skuspec,"")=isnull(detail.skuspec,"")     '+chr(10)+chr(13)

                               +' where detail.jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"      '+chr(10)+chr(13)
                               +' group by  detail.serialno,detail.skuname,detail.color,detail.skuspec   '+chr(10)+chr(13)
                               +'having isnull(sum(#lskindetail.quantity),0)-isnull(sum(#lskoutdetail.quantity),0)<sum(detail.quantity) '+chr(10)+chr(13)
                               +'update skudetailoutdetail set lastquantity=cast(jc as numeric(16,2) )-cast(cc as numeric(16,2) )         '+chr(10)+chr(13)
                               +'  from #lskoutqytxt                                      '+chr(10)+chr(13)
                               +' where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"      '+chr(10)+chr(13)
                               +'   and isnull(#lskoutqytxt.serialno,"")=isnull(skudetailoutdetail.serialno,"")       '+chr(10)+chr(13)
                               +'   and isnull(#lskoutqytxt.color,"")=isnull(skudetailoutdetail.color,"")             '+chr(10)+chr(13)
                               +'   and isnull(#lskoutqytxt.skuspec,"")=isnull(skudetailoutdetail.skuspec,"")         '+chr(10)+chr(13)
                               +'select * from  #lskoutqytxt    '+chr(10)+chr(13)
                 );
           if dataTmp.qryTmp.recordcount>1 then
           begin
              strmsg:='存在区域库存不足!';
           end;
      except
        raise;
        exit;
      end;

      if strmsg<>'' then
      begin
         DeleteFile(GetExedir+'\'+'区域缺货记录'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'.csv') ;
         QueryExportTxt('#lskoutqytxt').SaveToFile(GetExedir+'\'+'区域缺货记录'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'.csv');
         KMessageDlg('存在区域缺货,已经记录在'+GetExedir+'\'+'区域缺货记录'+data.qrySkuDetailOut.fieldbyname('jobno').AsString+'.csv',
                     mtInformation,[mbOK],0);
      end;
      btnInput.Enabled:=true;
   end;
end;
function TfrmSkuDetailOut.GetLocationbillNo:String;
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
procedure TfrmSkuDetailOut.mitphcydClick(Sender: TObject);
var
   KF1Book:TKF1book;
   lstPara:TStringList;
begin
   KF1Book:=TKF1book.Create;
   with KF1Book do
   begin
      lstPara:=TStringList.Create;
      opensql(datatmp.qryTmp1,'select quantity=sum(isnull(ck_detail.quantity,0)),serialno=rtrim(ck_detail.serialno), '+chr(13)+chr(10)
                     +'       color=rtrim(ck_detail.color),skuspec=rtrim(ck_detail.skuspec), '+chr(13)+chr(10)
                     +'       skuname=ck_detail.skuname,quantitysl=isnull(lskdetail.quantity,0)         '+chr(13)+chr(10)
                     +'  from SkuDetailOutDetail ck_detail(nolock)          '+chr(13)+chr(10)
                     +'       left join (select detail.jobno,quantity=sum(isnull(detail.quantity,0)),detail.skuname, '+chr(13)+chr(10)
                     +'                         bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                     +'                    from SkuDetailOutloc detail(nolock)                                       '+chr(13)+chr(10)
                     +'                   where detail.jobno="'+data.qrysdo.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
                     +'                   group by detail.jobno,detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) )  '+chr(13)+chr(10)
                     +'                      as lskdetail                                            '+chr(13)+chr(10)
                     +'              on lskdetail.jobno=ck_detail.jobno                      '+chr(13)+chr(10)
                     +'             and lskdetail.bs=rtrim(ck_detail.serialno)+rtrim(ck_detail.color)+rtrim(ck_detail.skuspec) '+chr(13)+chr(10)
                     +' where ck_detail.jobno="'+data.qrysdo.fieldbyname('jobno').asstring+'"  '+chr(13)+chr(10)
                     +' group by ck_detail.skuname,rtrim(ck_detail.serialno),rtrim(ck_detail.color),rtrim(ck_detail.skuspec),lskdetail.quantity '+chr(13)+chr(10)
                     +'having sum(isnull(ck_detail.quantity,0))<>isnull(lskdetail.quantity,0) '+chr(13)+chr(10)
                     +' order by rtrim(ck_detail.serialno),rtrim(ck_detail.color),rtrim(ck_detail.skuspec)   '+chr(13)+chr(10)
              );

      //lzw20101112
      paras.Values['shipcusname']:=data.qrySDO.fieldbyname('shipcusname').asstring;
      paras.Values['cusbillno']:=data.qrySDO.fieldbyname('cusbillno').asstring;
      paras.Values['date']:=DateToStr(Now);
      paras.Values['sj']:=TimeToStr(now);

      Bbdm:='100304';
      qryMain:=datatmp.qryTmp1;
      CreateReport;
   end;

end;

procedure TfrmSkuDetailOut.mitcancelconClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsedit then pgcMain.ActivePage:=tbsedit;
   opensql(datatmp.qryTmp,'select isout="T" from locationout '
                         +' where jobno="'+data.qrySDO.fieldbyname('jobnoout').AsString+'"');
   if datatmp.qryTmp.FieldByName('isout').AsString='T' then
   begin
      KMessageDlg('该配货单已出货,不能取消装箱!',mtWarning,[mbOK],0);
      Exit;
   end;
   if KmessageDlg('确认取消装箱吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then  exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(datatmp.qryTmp1,' update SkuDetailOut                                   '+chr(13)+chr(10)
                    +'    set checkid="F"                                    '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    +' DELETE locationinoutcon                               '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    +' DELETE locationinoutconsku                            '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
                    +' DELETE ck_lskoutcheckdetail                            '+chr(13)+chr(10)
                    +'  where jobno="'+data.qrySkuDetailOut.fieldbyname('jobno').asstring+'"               '+chr(13)+chr(10)
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
