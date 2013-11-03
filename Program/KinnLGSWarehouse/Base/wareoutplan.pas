unit WareoutPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  SLV, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient ,DateUtils;

type
  TfrmWareoutplan = class(TForm)
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
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    OrderDate: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    cusbillno: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    grdwareoutplan: TdxDBGrid;
    cardid: TdxDBGridColumn;
    mainorder: TdxDBGridColumn;
    costcusname: TdxDBGridColumn;
    shipcusname: TdxDBGridColumn;
    carbrand: TdxDBGridColumn;
    grpinfobar: TKGroupBox;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    dtdCreatedate: TdxDBDateEdit;
    GMSStickyLabel17: TGMSStickyLabel;
    ppmprint: TPopupMenu;
    MenuItem1: TMenuItem;
    dtdoperationdate: TdxDBDateEdit;
    timoperationdate: TdxDBTimeEdit;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtOrderDate: TdxDBDateEdit;
    timOrderDate: TdxDBTimeEdit;
    edtCostcusid: TdxDBButtonEdit;
    edtMainOrder: TdxDBEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    edtCusbillno: TdxDBEdit;
    KGroupBox5: TKGroupBox;
    memRemark1: TdxDBMemo;
    cmbshipcusid: TdxDBButtonEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    pcInfo: TdxPageControl;
    tbsWareoutplanSKU: TdxTabSheet;
    grdSKU: TdxDBGrid;
    edtSKUSNO: TdxDBGridColumn;
    edtOperationType: TdxDBGridCheckColumn;
    edtCostcusname: TdxDBGridButtonColumn;
    edtCusid: TdxDBGridButtonColumn;
    edtShippercusid: TdxDBGridButtonColumn;
    edtmainordersku: TdxDBGridColumn;
    edtSKUName: TdxDBGridButtonColumn;
    edtcustomerno: TdxDBGridColumn;
    edtSkumodel: TdxDBGridColumn;
    edtSkuspec: TdxDBGridColumn;
    edtColor: TdxDBGridColumn;
    edtquantity: TdxDBGridCurrencyColumn;
    edtQUOM: TdxDBGridKinPickColumn;
    edtPiece: TdxDBGridCurrencyColumn;
    edtPieceUOM: TdxDBGridKinPickColumn;
    edtVolume: TdxDBGridCurrencyColumn;
    edtvolumeUOM: TdxDBGridKinPickColumn;
    edtArea: TdxDBGridCurrencyColumn;
    tbsOrderWithTask: TdxTabSheet;
    edtareauom: TdxDBGridColumn;
    edtgrossweight: TdxDBGridColumn;
    edtnetweight: TdxDBGridColumn;
    edtweightuom: TdxDBGridColumn;
    grdOutItem: TdxDBGrid;
    snoItem: TdxDBGridCurrencyColumn;
    mainorderItem: TdxDBGridColumn;
    mainorderinItem: TdxDBGridColumn;
    customsnoin: TdxDBGridColumn;
    cusNameItem: TdxDBGridButtonColumn;
    costcusidItem: TdxDBGridButtonColumn;
    ShippercusNameItem: TdxDBGridButtonColumn;
    ShipcusNameItem: TdxDBGridButtonColumn;
    SKUNameItem: TdxDBGridButtonColumn;
    customernoItem: TdxDBGridColumn;
    skumodelitem: TdxDBGridColumn;
    skuspecitem: TdxDBGridColumn;
    coloritem: TdxDBGridColumn;
    LotCodeItem: TdxDBGridColumn;
    QualityNameItem: TdxDBGridButtonColumn;
    ConditionDescItem: TdxDBGridColumn;
    ManufactureDateItem: TdxDBGridDateColumn;
    manudatestringitem: TdxDBGridPickColumn;
    QuantitytaskItem: TdxDBGridCurrencyColumn;
    QuantityItem: TdxDBGridCurrencyColumn;
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
    LocItem: TdxDBGridButtonColumn;
    tallycusiditem: TdxDBGridButtonColumn;
    loadgroupcusnameItem: TdxDBGridButtonColumn;
    forkgroupcusnameItem: TdxDBGridButtonColumn;
    liftmachinecusnameItem: TdxDBGridButtonColumn;
    TagTotalItem: TdxDBGridCurrencyColumn;
    TagEachUOMItem: TdxDBGridPickColumn;
    CostUOMTypeItem: TdxDBGridKinPickColumn;
    priceinIItem: TdxDBGridCurrencyColumn;
    skucostinItem: TdxDBGridCurrencyColumn;
    priceItem: TdxDBGridCurrencyColumn;
    skucostItem: TdxDBGridCurrencyColumn;
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
    carriageitem: TdxDBGridCurrencyColumn;
    carriagetotalitem: TdxDBGridCurrencyColumn;
    insuranceItem: TdxDBGridCurrencyColumn;
    insurancetotalItem: TdxDBGridCurrencyColumn;
    RemarkItem: TdxDBGridBlobColumn;
    costquantityItem: TdxDBGridCurrencyColumn;
    costquantityuomItem: TdxDBGridPickColumn;
    costquantitytaskItem: TdxDBGridCurrencyColumn;
    conscusnameItem: TdxDBGridButtonColumn;
    carriagecurrcdItem: TdxDBGridPickColumn;
    sequencenumitem: TdxDBGridCurrencyColumn;
    outzoneno: TdxDBGridColumn;
    corpnoitem: TdxDBGridColumn;
    pieceproitem: TdxDBGridColumn;
    cusbillnoin: TdxDBGridColumn;
    edtcarbrand1: TdxDBEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtcardid: TdxDBBlobEdit;
    GMSStickyLabel35: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    edtModifyName: TdxDBEdit;
    GMSStickyLabel27: TGMSStickyLabel;
    dtdModifyDate: TdxDBDateEdit;
    ppmsku: TPopupMenu;
    mitAddLocItem: TMenuItem;
    mitdelLocINItem: TMenuItem;
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
    procedure btnPrintClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure grdwareoutplanCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure mitDeleteAttClick(Sender: TObject);
    procedure edtCusIDExit(Sender: TObject);
    procedure edtConCusIdExit(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure grdContWithLocaItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure edtOPIDExit(Sender: TObject);
    procedure edtCostcusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostcusidExit(Sender: TObject);
    procedure edtCostcusidExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbshipcusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbshipcusidExit(Sender: TObject);
    procedure cmbshipcusidExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtSKUNameValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitAddLocItemClick(Sender: TObject);
    procedure mitdelLocINItemClick(Sender: TObject);
    procedure grdSKUChangeNodeEx(Sender: TObject);
    procedure grdSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdSKUEnter(Sender: TObject);
    procedure grdSKUExit(Sender: TObject);
    procedure edtCostcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtShippercusidButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtquantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdwareoutplanChangeNodeEx(Sender: TObject);
    procedure edtPieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);

  private
    { Private declarations }
    //变量定义
    FindItem: TFindItem;               //查找
    strWPjobno:string;                 //重新取得工作号
    blnCopy,blnSaveError,blnWare:Boolean;
    mode:TDataState;             //进入form状态模式
    Bookmark: TBookmark;         //书签
    strSql: string;
    FilterSql: string;
    arrContWithLoca,arrContWithLocaItem:Variant;
    maxDocBook:Integer; //修改时候用的
    blnSelect:Boolean;
    blnAddCost:Boolean;//控制费用编辑权限
    strGetCd:String;                   //商品输入时防止重复判别
    blnIsCZ:Boolean;
    grdContWithLocaItemReadOnly:Boolean;
    Year,Month,Day:word;
    strcontractno:string;
    StrCusInvo,strdate:string;
    strJobno:string;                   //定位工作号

    //过程定义
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure SetSkuInfo(qryselect:TKADOQuery);
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    function  Gather:boolean;
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure InitValues;
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    procedure ScatterToLV;

    procedure grdskuBeforeInsert;

    procedure CountCost;
 public
    { Public declarations }
    maxCostItem,maxsno:Integer;
    DataState:TDataState;
    oldContWithLocaItem:string;
    sltContWithLocaItem:TStringList;
  end;

procedure WorkWareoutPlan(CallMode:TDataState;pstrJobno:string);

var
  frmWareoutplan: TfrmWareoutplan;
  blnDelete:boolean;
  year,month,day:word;
  month_start,month_end:TDate;
implementation

{$R *.dfm}

uses Main,kindlg,Saveget,datas,find,ContCost,
     GetUserRight, datasTmp,libuserPub,DocBook,GetDllPub;


procedure WorkWareoutPlan(CallMode:TDataState;pstrJobno:string);
begin
   if frmWareoutPlan <> nil then
   with frmWareoutPlan do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmWareoutPlan:=TfrmWareoutplan.Create(application);
   with frmWareoutPlan do
   begin
   {初始化所有数据集}
     //初始话变量
     blnCopy        :=False;             //系统默认不复制新增
     FindItem       :=TFindItem.Create;
     blnSaveError   :=False;
     blnIsCZ        :=True;
     strcontractno:='';
     strJobno:=pstrJobno;
     sltContWithLocaItem:=TStringList.Create;

     //假主库过滤条件
     decodedate(date,year,month,day);
     Month_Start:=encodedate(year,month,1);
     Month_End  :=IncMonth(Month_Start,1)-1;
     if trim(strJobno)='' then
      begin
         FilterSql:=' (convert(datetime,convert(char(8),OrderDate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),OrderDate,112)) <="'+datetostr(Month_End)+'")';
         with FindItem do
         begin
            Field.Add('12');
            operator.Add('3');
            value.Add(datetostr(Month_Start));
            Exp.Add('订单日期          大于等于      '+datetostr(Month_Start));
            Field.Add('12');
            operator.Add('4');
            value.Add(datetostr(Month_End));
            Exp.Add('订单日期          小于等于      '+datetostr(Month_End));
         end;
      end else
      FilterSql:='';

      data.initwareoutplan(strjobno);
      data.qrywareoutplan0.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');


    // 界面显示过程
     if mode=stInsert then
     begin
       SetControlState(stInsert,true);
       data.qrywareoutplan.open;
       btnCopy.Click;
     end else
     begin
       if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitContWithLoca',trim(_userorgid));//设置按钮的有效性
       SetControlState(stBrowse,true);
       data.qrywareoutplan0.Open;
       grdwareoutplanChangeNodeEx(nil);
       WorkCall(stBrowse);
     end;
     {激活FORM}
     Show;
   end;
end;

procedure TfrmWareoutplan.WorkCall(CallMode:TDataState);
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
          if data.qrywareoutplan0.fieldbyname('jobno').AsString<>'' then
                grdwareoutplan.FindNodeByKeyValue(data.qrywareoutplan0.fieldbyname('jobno').AsString).Selected:=true;
        end;
      stEdit:
        begin
          maxsno:=0;
          data.qrywareoutplan0.Edit;
          EnableEdit;
          //记录修改档案
          data.qrywareoutplan.Edit;
          //在修改的状态下，对qryContWithLocaItem循环，为sltContWithLocaItem赋值
          sltContWithLocaItem.Clear;
          data.qrywareoutitem.DisableControls;
          Bookmark:= data.qrywareoutitem.GetBookmark;
          maxsno:=0;
          data.qrywareoutitem.First;
          while not data.qrywareoutitem.Eof do
          begin
             if data.qrywareoutitem.FieldByName('SNO').AsInteger>maxsno
             then maxsno:=data.qrywareoutitem.FieldByName('SNO').AsInteger;
             data.qrywareoutitem.Next;
          end;
          data.qrywareoutitem.GotoBookmark(Bookmark);
          data.qrywareoutitem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qrywareoutitem.EnableControls;
          //data.qryContWithLocaItemAfterScroll(data.qryContWithLocaItem);
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          data.qrywareoutplan0.Append;
          InitValues;
          EnableEdit;
          maxsno:=0;
          //记录档案创建信息
          data.qrywareoutplan.Edit;
          data.qrywareoutplan.FieldByName('CreateName').Asstring:=_LoginName;
          data.qrywareoutplan.fieldByname('CreateDate').AsDatetime:=date;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmWareoutplan.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
  SetControlState(DataState,False);
end;

procedure TfrmWareoutplan.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if data.qrywareoutplan0.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);

end;

procedure TfrmWareoutplan.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmWareoutplan.InitValues;
{初始化时自动生成仓位代码}
begin
  strWPjobno:=genJobno('WP');
  data.qrywareoutplan.Edit;
  if blnCopy then
  begin
    blnCopy:=False;
    //GatherFromArray(data.qrywareoutplan,arrContWithLoca,false);
    data.qrywareoutplan.FieldByName('JOBNO').Asstring:=strWPjobno;
    data.qrywareoutplan.fieldByname('UserID').AsString:=_UserID;
    data.qrywareoutplan.fieldByname('username').AsString:=_username;
    data.qrywareoutplan.FieldByName('OrderDate').AsDateTime:=GetServerDate;

    data.qrywareoutplan.FieldByName('ModifyName').Asstring:='';
    data.qrywareoutplan.FieldByName('modefydate').Clear;
    //qryContWithLocaItem复制
    data.qrywareoutitem.DisableControls;
    GatherFromArray(data.qrywareoutitem,arrContWithLocaITEM,true);
    with data.qrywareoutitem do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('jobno').AsString:=strWPjobno;
        FieldByName('UserID').Asstring:=_UserID;
        FieldByName('Username').Asstring:=_Username;

        next;
      end;
      First;
    end;
    data.qrywareoutitem.EnableControls;
    //data.qryContWithLocaItemAfterScroll(data.qrywareoutitem);
  end else
  begin
    //data.qryContWithLoca
    data.qrywareoutplan.FieldByName('JOBNO').Asstring:=strWPjobno;
    data.qrywareoutplan.FieldByName('UserID').Asstring:=_UserID;
    data.qrywareoutplan.FieldByName('username').Asstring:=_username;
    data.qrywareoutplan.FieldByName('OrderDate').AsDateTime:=GetServerDate;
  end;
end;

procedure TfrmWareoutplan.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
  if blnConnect then
  begin
    data.qrywareoutplan.DataSource    :=data.dtswareoutplan0;
    data.qrywareoutitem.datasource        :=data.dtswareoutplan0;
    data.qryoutitem.datasource        :=data.dtswareoutplan0;

  end else
  begin
    data.qrywareoutplan.DataSource    :=nil;
    data.qrywareoutitem.DataSource        :=nil;
    data.qryoutitem.DataSource        :=nil;

  end;
end;

procedure TfrmWareoutplan.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  //
end;

function TfrmWareoutplan.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   strLocname:string;
begin
  Result:=False;
  if edtMainOrder.Text='' then
  begin
     Kmessagedlg('主订单号不能为空', mtInformation,[mbOk],0);
     edtMainOrder.SetFocus;
  end;
  if edtMainOrder.Text<>'' then
  begin
     OpenSql(dataTmp.qryTmp,' select num=count(1) from wareoutplan (nolock) '+chr(13)+chr(10)
                           +'  where jobno<>"'+data.qrywareoutplan.Fieldbyname('jobno').AsString+'" '+chr(13)+chr(10)
                           +'    and MainOrder="'+edtMainOrder.Text+'"  '+chr(13)+chr(10)
                           +'    and costcusid="'+data.qrywareoutplan.Fieldbyname('costcusid').AsString+'" '+chr(13)+chr(10)
                   );
     if dataTmp.qryTmp.FieldByName('num').AsInteger<>0 then
     begin
        KmessageDlg('同一家客户不能存在相同的主订单号！',mtConfirmation,[mbOk],0);
        edtMainOrder.SetFocus;
     end;
  end;
  begin
     data.qrywareoutplan0.Edit;
     data.qrywareoutplan0.FieldByName('Jobno').AsString:=data.qrywareoutplan.FieldByName('Jobno').AsString;
     data.qrywareoutplan0.FieldByName('OrderDate').AsString:=data.qrywareoutplan.FieldByName('OrderDate').AsString;
     data.qrywareoutplan0.FieldByName('costcusname').AsString:=data.qrywareoutplan.FieldByName('costcusname').AsString;
     data.qrywareoutplan0.FieldByName('costcusid').AsString:=data.qrywareoutplan.FieldByName('costcusid').AsString;
     data.qrywareoutplan0.FieldByName('shipcusname').AsString:=data.qrywareoutplan.FieldByName('shipcusname').AsString;
     data.qrywareoutplan0.FieldByName('shipcusid').AsString:=data.qrywareoutplan.FieldByName('shipcusid').AsString;
     data.qrywareoutplan0.FieldByName('MainOrder').AsString:=data.qrywareoutplan.FieldByName('MainOrder').AsString;
     data.qrywareoutplan0.FieldByName('cusbillno').AsString:=data.qrywareoutplan.FieldByName('cusbillno').AsString;
     data.qrywareoutplan0.FieldByName('operationdate').AsString:=data.qrywareoutplan.FieldByName('operationdate').AsString;

     data.qrywareoutplan0.FieldByName('carbrand').AsString:=data.qrywareoutplan.FieldByName('carbrand').AsString;
     data.qrywareoutplan0.FieldByName('cardid').AsString:=data.qrywareoutplan.FieldByName('cardid').AsString;
     data.qrywareoutplan0.FieldByName('username').AsString:=data.qrywareoutplan.FieldByName('username').AsString;
     data.qrywareoutplan0.FieldByName('userid').AsString:=data.qrywareoutplan.FieldByName('userid').AsString;

     data.qrywareoutitem.DisableControls;
     data.qrywareoutitem.First;
     while not data.qrywareoutitem.Eof do
     begin
        data.qrywareoutitem.Edit;
        data.qrywareoutitem.FieldByName('userid').AsString:=data.qrywareoutplan.FieldByName('userid').AsString;
        data.qrywareoutitem.FieldByName('username').AsString:=data.qrywareoutplan.FieldByName('username').AsString;
        data.qrywareoutitem.fieldbyname('costcusid').asstring:=data.qrywareoutplan.fieldbyname('costcusid').asstring;
        data.qrywareoutitem.fieldbyname('costcusname').asstring:=data.qrywareoutplan.fieldbyname('costcusname').asstring;
        data.qrywareoutitem.fieldbyname('mainorder').asstring:=data.qrywareoutplan.fieldbyname('mainorder').asstring;

        data.qrywareoutitem.fieldbyname('shippercusid').asstring:=data.qrywareoutplan.fieldbyname('costcusid').asstring;
        data.qrywareoutitem.fieldbyname('shippercusname').asstring:=data.qrywareoutplan.fieldbyname('costcusname').asstring;
        data.qrywareoutitem.fieldbyname('cusid').asstring:=data.qrywareoutplan.fieldbyname('costcusid').asstring;
        data.qrywareoutitem.fieldbyname('cusname').asstring:=data.qrywareoutplan.fieldbyname('costcusname').asstring;

        data.qrywareoutitem.Next;
     end;
     data.qrywareoutitem.First;
     data.qrywareoutitem.EnableControls;
  end;
  Result:=True;
end;


procedure TfrmWareoutplan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmWareoutplan.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox5);
  SetGroupbox(grpinfobar);
end;

procedure TfrmWareoutplan.FormKeyDown(Sender: TObject; var Key: Word;
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
      Ord('C'):KeyDownControl(Key,btnCopy);

      Ord('F'):KeyDownControl(Key,btnFind);
      Ord('R'):KeyDownControl(Key,btnRefind);
      Ord('L'):KeyDownControl(Key,btnFilter);

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

procedure TfrmWareoutplan.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  data.qrywareoutplan0.Close;
  data.qrywareoutplan.Close;
  data.qrywareoutitem.Close;
  data.qryoutitem.Close;
  frmWareoutplan:=nil
end;

procedure TfrmWareoutplan.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
end;

procedure TfrmWareoutplan.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
end;

procedure TfrmWareoutplan.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmWareoutplan.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=data.qrywareoutplan0.fieldbyname('jobno').asstring;
  data.qrywareoutplan0.DisableControls;
  data.qrywareoutplan0.Close;
  data.qrywareoutplan0.Open;
  try
    data.qrywareoutplan0.locate('jobno',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    data.qrywareoutplan0.Last;
  end;
  data.qrywareoutplan0.EnableControls;
end;

procedure TfrmWareoutplan.btnEditClick(Sender: TObject);
begin
  if data.qrywareoutplan0.FieldByName('CreateName').asstring<>_LoginName then
  begin
    //kMessageDlg(GetMessage('frmContWithLoca','010'),mtWarning,[mbOK],0);//'该包仓合同不是您输入的，不能修改！'
    exit;
  end;
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  blnAddCost:=False;

  SetDetailActive(False,True);
  SetMasterDetailState(False);
  WorkCall(stEdit);
end;

procedure TfrmWareoutplan.btnAddClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
     pgcMain.ActivePage:=tbsEdit;
  if pgcMain.ActivePage=tbsEdit then
     SetDetailActive(False,True);   
  Workcall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmWareoutplan.btnDeleteClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  if KmessageDlg(_strDel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    SetMasterDetailState(False);
    _ADOConnection.startTransaction;
    try
      ExecSql(dataTmp.qryTmp,'delete from  wareoutplan '
                     +' where jobno="'+data.qrywareoutplan0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,'delete from  wareoutitem'
                     +' where jobno="'+data.qrywareoutplan0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                             +'  where jobno="'+data.qrywareoutplan0.FieldByName('jobno').AsString+'" ');
      data.qrywareoutplan0.Delete;
      data.qrywareoutplan0.Applyupdates;
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
    data.qrywareoutplan0.CommitUpdates;
    SetMasterDetailState(True);
    if pgcMain.ActivePage=tbsEdit then
      SetDetailActive(True,True);
    btnRefresh.Click;
    workcall(stbrowse);
  end;
end;

procedure TfrmWareoutplan.btncopyClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  SetDetailActive(False,True);

  blnCopy:=True;

  WorkCall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmWareoutplan.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add('ContWithLoca ContWithLoca ');

{0}   para.field.add('ContWithLoca.ContractNO');
{1}   para.field.add('ContWithLoca.SignDate');
{2}   para.Field.add('ContWithLoca.Rent');
{3}   para.Field.add('ContWithLoca.Jobno');

   Para.Exp.add('');

{0}   Para.Toptic.Add('合同编号');
{1}   Para.Toptic.Add('签订日期');
{2}   Para.Toptic.Add('月 租 金');
{3}   Para.Toptic.add('工 作 号');

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('D');
{2}   Para.Ftype.add('N');
{3}   para.Ftype.add('C');

   Para.RField.add('ContWithLoca.jobno');

   if filterSql <> ''
      then Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(data.qryContWithLoca, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmWareoutplan.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryContWithLoca,dataTmp.qryFind);
end;

procedure TfrmWareoutplan.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add(' wareoutplan  wareoutplan ');

{0}   para.field.add('wareoutplan.costcusid');
{1}   para.field.add('wareoutplan.mainorder');
{2}   para.field.add('wareoutplan.shipcusid');


   Para.Exp.add('');

{0}   Para.Toptic.Add('费用关系人');
{1}   Para.Toptic.Add('主订单号');
{2}   Para.Toptic.Add('提 货 人');

{0}   para.Ftype.add('E');
{1}   para.Ftype.add('C');
{2}   Para.Ftype.add('E');


   Para.RField.add('wareoutplan.jobno');

   if filterSql<>'' then
      Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);
   if strTmp <> 'null' then
   begin
     data.qrywareoutplan0.DisableControls;
     data.qrywareoutplan0.Close;
     if strTmp<>'' then
       data.qrywareoutplan0.MacroByName('Where').AsString:=strTmp
     else
       data.qrywareoutplan0.MacroByName('Where').AsString:='1=1';
     data.qrywareoutplan0.Open;
     data.qrywareoutplan0.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmWareoutplan.btnSaveClick(Sender: TObject);
begin
  if (DataState in setDcs) and Gather then //新增或编辑存盘
  begin
    try
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          //data.qrywareoutplan.Post;
          data.qrywareoutplan0.ApplyUpdates;
          data.qrywareoutplan.ApplyUpdates;
          data.qrywareoutitem.ApplyUpdates;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             data.udswareoutplan.modifysql.text + chr(13) +
             data.udswareoutplan.DeleteSql.text + chr(13) +
             data.udswareoutplan.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( data.qrywareoutplan.FieldByName('Jobno').AsString );//'已经被使用。程序正在查找其他可用客户编号...'
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               strWPjobno := genJobno('WP',_DataBaseID);
               if strWPjobno = '' then
               begin
                 KmessageDlg('01', mtInformation, [mbOk], 0);//'没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 data.qrywareoutplan.Edit;
                 data.qrywareoutplan.FieldByName('Jobno').AsString := strwpJobno;
                 data.qrywareoutplan.FieldByName('KeyID').AsString := data.qrywareoutplan.FieldByName('Jobno').AsString;
               end;
             end else Break;
          end else
          begin
            raise;
            exit;
          end;
        end;
      end;
      //商品信息
      if data.qrywareoutitem.RecordCount>0 then
      begin
         data.qrywareoutitem.DisableControls;
         data.qrywareoutitem.first;
         while not data.qrywareoutitem.eof do
         begin
            data.qrywareoutitem.Edit;
            data.qrywareoutitem.fieldbyname('JOBNO').asstring:=data.qrywareoutplan.fieldbyname('JOBNO').asstring;
            data.qrywareoutitem.Post;
            data.qrywareoutitem.next;
         end;
         data.qrywareoutitem.first;
         data.qrywareoutitem.EnableControls;
         data.qrywareoutitem.applyupdates;
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
            lblError.caption := '找到可用客户编号' + strwpjobno + '，该客户编号改为' + strwpjobno + '。';
            btnCancel.visible := false;
            btnOk.visible := true;
            free;
          end;
        end;
      end;

    _ADOConnection.Commit;
    except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    data.qrywareoutplan0.CommitUpdates;
    data.qrywareoutplan.commitUpdates;
    data.qrywareoutitem.commitUpdates;

    SetMasterDetailState(True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmWareoutplan.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  if DataState=stInsert then
     ExecSql(dataTmp.qryTmp,' delete from genjobno '
                           +'  where jobno="'+data.qrywareoutplan.FieldByName('jobno').AsString+'" ');
  data.qrywareoutitem.CancelUpdates;
  data.qrywareoutplan.CancelUpdates;
  data.qrywareoutplan0.CancelUpdates;

  SetMasterDetailState(True);
  WorkCall(stBrowse);
  btnRefreshclick(self);
end;

procedure TfrmWareoutplan.btnPrintClick(Sender: TObject);
begin
 //
end;

procedure TfrmWareoutplan.mitFilterActiveClick(Sender: TObject);
begin
  grdwareoutplan.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmWareoutplan.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if blnPage then
  begin
     if pgcMain.ActivePage=tbsEdit then
     begin
        if (data.qrywareoutplan.DataSource=nil) and (data.qrywareoutplan.Active) then
           data.qrywareoutplan.Close;
        data.qrywareoutplan.DataSource:=data.dtswareoutplan0;
        data.qrywareoutplan.Active:=true;
        if (data.qrywareoutitem.DataSource=nil) and (data.qrywareoutitem.Active) then
           data.qrywareoutitem.Close;
        data.qrywareoutitem.DataSource:=data.dtswareoutplan0;
        data.qrywareoutitem.Active:=true;
        if (data.qryoutitem.DataSource=nil) and (data.qryoutitem.Active) then
           data.qryoutitem.Close;
        data.qryoutitem.DataSource:=data.dtswareoutplan0;
        data.qryoutitem.Active:=true;
     end;
  end else
  begin
    if (data.qrywareoutplan.DataSource=nil) and (data.qrywareoutplan.Active) then
           data.qrywareoutplan.Close;
        data.qrywareoutplan.DataSource:=data.dtswareoutplan0;
        data.qrywareoutplan.Active:=true;
    if (data.qrywareoutitem.DataSource=nil) and (data.qrywareoutitem.Active) then
           data.qrywareoutitem.Close;
        data.qrywareoutitem.DataSource:=data.dtswareoutplan0;
        data.qrywareoutitem.Active:=true;
    if (data.qryoutitem.DataSource=nil) and (data.qryoutitem.Active) then
           data.qryoutitem.Close;
        data.qryoutitem.DataSource:=data.dtswareoutplan0;
        data.qryoutitem.Active:=true;
  end;

end;

function TfrmWareoutplan.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
    0:
     begin
        qrySelect:=pGetCustomerSelect('B','');
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

procedure TfrmWareoutplan.pgcMainChange(Sender: TObject);
begin
   if pgcMain.ActivePage=tbsEdit then
   begin
      SetDetailActive(True,True);
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      btnFirst.SkipGroup:=True;
      btnPrior.SkipGroup:=True;
      btnNext.SkipGroup:=True;
      btnLast.SkipGroup:=True;
   end else
   begin
      SetDetailActive(False,False);
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
      btnFirst.SkipGroup:=False;
      btnPrior.SkipGroup:=False;
      btnNext.SkipGroup:=False;
      btnLast.SkipGroup:=False;
   end;
end;

procedure TfrmWareoutplan.qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
//
end;

procedure TfrmWareoutplan.grdwareoutplanCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Year, Month, Day, YearLast, MonthLast, DayLast: Word;
begin

  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;
end;

procedure TfrmWareoutplan.mitDeleteAttClick(Sender: TObject);
var
  blnNeedReload: Boolean;
begin
  
end;

procedure TfrmWareoutplan.ScatterToLV;
begin
end;

procedure TfrmWareoutplan.edtCusIDExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmWareoutplan.edtConCusIdExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmWareoutplan.edtUsernameExit(Sender: TObject);
begin
   blnSelect:=False;
end;


procedure TfrmWareoutplan.grdContWithLocaItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      if grdContWithLocaItemReadOnly then allow:=false
      else  Allow:=True;
   end;
end;

procedure TfrmWareoutplan.CountCost;
begin

end;

procedure TfrmWareoutplan.edtOPIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmWareoutplan.edtCostcusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrywareoutplan.edit;
         data.qrywareoutplan.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrywareoutplan.FieldByName('costcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;

end;

procedure TfrmWareoutplan.edtCostcusidExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmWareoutplan.edtCostcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCostcusid.Text='' then
      begin
         data.qrywareoutplan.Edit;
         data.qrywareoutplan.FieldByName('costcusid').AsString:='';
         data.qrywareoutplan.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtCostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrywareoutplan.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrywareoutplan.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmWareoutplan.cmbshipcusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrywareoutplan.edit;
         data.qrywareoutplan.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrywareoutplan.FieldByName('shipcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;

end;

procedure TfrmWareoutplan.cmbshipcusidExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmWareoutplan.cmbshipcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbshipcusid.Text='' then
      begin
         data.qrywareoutplan.Edit;
         data.qrywareoutplan.FieldByName('shipcusid').AsString:='';
         data.qrywareoutplan.FieldByName('shipcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtCostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qrywareoutplan.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrywareoutplan.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;

end;

procedure TfrmWareoutplan.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  i:integer;
  qrySelect:TKADOQuery;
begin
   if data.qrywareoutplan.fieldbyname('costcusid').asstring='' then
   begin
      ActiveControl:=edtCostcusid;
      {if _Language='CAPTIONC' then _strmessage:='费用关系人不能为空，必须填写！'
      else _strmessage:='费用关系人不能为空，必须填写！';}
      KMessageDlg(GetMessage('frmLocationIN','023'),mtWarning,[mbOK],0);
      Exit;
   end;
   qrySelect:=pGetSkuSelect('','','D');
   qrySelect.First;

   i:=0;
   while not qryselect.Eof do
   begin
     begin
        if i=0 then
        begin
           inc(i);
           data.qrywareoutitem.edit;
        end else
        begin
           try
              data.qrywareoutitem.Post;
           except
              break;
           end;
           data.qrywareoutitem.append;
           //grdLocationINItemBeforeInsert;
        end;
        strGetCd := qryselect.fieldbyname('SKUName').asstring;
        if qryselect.Fieldbyname('LotCode').asstring<>'' then
           data.qrywareoutitem.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
        SetSkuInfo(qrySelect);
     end;
     qryselect.Next;
   end;

end;

procedure TfrmWareoutplan.edtSKUNameValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  i:integer;
  qrySelect:TKADOQuery;
  Quantity:extended;
begin
   if _ConCusInput<>'T' then Exit;

   with grdSKU.InplaceEditor do
   if (GetEditingText<>'') and
      (GetEditingText<>data.qrywareoutitem.Fieldbyname('SKUName').asstring) then
   begin
      qrySelect:=pGetSkuSelect('','','D');
      qrySelect.First;
      i:=0;
      data.qrywareoutitem.edit;
      data.qrywareoutitem.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
      data.qrywareoutitem.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
      strGetCd := qryselect.fieldbyname('SKUName').asstring;
      if qryselect.Fieldbyname('LotCode').asstring<>'' then
         data.qrywareoutitem.Fieldbyname('LotCode').asstring :=qryselect.Fieldbyname('LotCode').asstring;
      Quantity:=qryselect.fieldbyname('Quantity').AsFloat;
      if Quantity=0 then Quantity:=1;
      if Quantity<>0 then
      begin
         data.qrywareoutitem.fieldbyname('Quantity').AsFloat    :=Quantity;
         if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
            data.qrywareoutitem.fieldbyname('Piece').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
         data.qrywareoutitem.fieldbyname('NetWeight').asFloat   :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
         data.qrywareoutitem.Fieldbyname('GrossWeight').asFloat :=Quantity*qryselect.fieldbyname('WeightPro').AsFloat;
         data.qrywareoutitem.fieldbyname('Volume').asFloat      :=Quantity*qryselect.fieldbyname('VolumePro').AsFloat;
         data.qrywareoutitem.Fieldbyname('Area').asFloat        :=Quantity*qryselect.fieldbyname('AreaPro').AsFloat;

      end;

      data.qrywareoutitem.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
      data.qrywareoutitem.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
      data.qrywareoutitem.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
      data.qrywareoutitem.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
      data.qrywareoutitem.Fieldbyname('AreaUOM').asstring     :=qryselect.Fieldbyname('AreaUOM').asstring          ;
      data.qrywareoutitem.fieldByname('shipcusid').AsString:=data.qrywareoutplan.fieldbyname('shipcusid').AsString;
      data.qrywareoutitem.fieldByname('shipcusname').AsString:=data.qrywareoutplan.fieldbyname('shipcusname').AsString;

      data.qrywareoutitem.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
      data.qrywareoutitem.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
      data.qrywareoutitem.Fieldbyname('customerno').Asstring:=qryselect.fieldbyname('customerno').Asstring;
      data.qrywareoutitem.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;
   end;

end;

procedure Tfrmwareoutplan.SetSkuInfo(qryselect:tkadoquery);
var
   Quantity:extended;
begin
   data.qrywareoutitem.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
   data.qrywareoutitem.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
   if data.qrywareoutitem.FieldByName('quantity').AsFloat=0 then
      Quantity:=qryselect.fieldbyname('Quantity').AsFloat
   else Quantity:=data.qrywareoutitem.FieldByName('quantity').AsFloat;
   if Quantity=0 then Quantity:=1;
   if Quantity<>0 then
   begin
     data.qrywareoutitem.fieldbyname('Quantity').AsFloat    :=Quantity;
     if qryselect.fieldbyname('PiecePro').AsFloat<>0 then
       data.qrywareoutitem.fieldbyname('Piece').AsFloat     :=Quantity/qryselect.fieldbyname('PiecePro').AsFloat;
     data.qrywareoutitem.fieldbyname('NetWeight').asFloat   :=data.qrywareoutitem.fieldbyname('Piece').AsFloat*qryselect.fieldbyname('WeightPro').AsFloat;
     data.qrywareoutitem.fieldbyname('Volume').asFloat      :=data.qrywareoutitem.fieldbyname('Piece').AsFloat*qryselect.fieldbyname('VolumePro').AsFloat;
   end;

   data.qrywareoutitem.fieldbyname('QuantityUOM').asstring :=qryselect.fieldbyname('QuantityUOM').asstring         ;
   data.qrywareoutitem.fieldbyname('PieceUOM').asstring    :=qryselect.fieldbyname('PieceUOM').asstring         ;
   data.qrywareoutitem.fieldbyname('WeightUOM').asstring   :=qryselect.fieldbyname('WeightUOM').asstring        ;
   data.qrywareoutitem.fieldbyname('VolumeUOM').asstring   :=qryselect.fieldbyname('VolumeUOM').asstring        ;
   data.qrywareoutitem.fieldByname('shippercusid').AsString:=data.qrywareoutplan.fieldbyname('costcusid').AsString;
   data.qrywareoutitem.fieldByname('shippercusname').AsString:=data.qrywareoutplan.fieldbyname('costcusname').AsString;
   data.qrywareoutitem.fieldByname('mainorder').AsString:=data.qrywareoutplan.fieldbyname('mainorder').AsString;


   data.qrywareoutitem.Fieldbyname('skuspec').Asstring   :=qryselect.fieldbyname('skuspec').Asstring;
   data.qrywareoutitem.Fieldbyname('color').Asstring     :=qryselect.fieldbyname('color').Asstring;
   data.qrywareoutitem.Fieldbyname('customerno').Asstring:=qryselect.fieldbyname('customerno').Asstring;
   data.qrywareoutitem.Fieldbyname('skumodel').Asstring  :=qryselect.fieldbyname('skumodel').Asstring;
end;


procedure TfrmWareoutplan.mitAddLocItemClick(Sender: TObject);
begin
   grdSKU.setfocus;
   data.qrywareoutitem.append;
   grdskuBeforeInsert;
end;

procedure TfrmWareoutplan.grdskuBeforeInsert;
begin
   grdSKU.FocusedColumn:=0;
   data.qrywareoutitem.fieldbyname('SNO').Asinteger:=-1;
   data.qrywareoutitem.fieldByname('jobno').AsString:=data.qrywareoutplan.fieldbyname('jobno').AsString;
   data.qrywareoutitem.fieldbyname('userid').asstring:=data.qrywareoutplan.fieldbyname('userid').asstring;
   data.qrywareoutitem.fieldbyname('username').asstring:=data.qrywareoutplan.fieldbyname('username').asstring;
   data.qrywareoutitem.fieldByname('mainorder').AsString    :=data.qrywareoutplan.fieldByname('mainorder').AsString;
   data.qrywareoutitem.fieldByname('cusid').AsString    :=data.qrywareoutplan.fieldByname('costcusid').AsString;
   data.qrywareoutitem.fieldByname('cusname').AsString  :=data.qrywareoutplan.fieldByname('costcusname').AsString;
   data.qrywareoutitem.fieldByname('shippercusid').AsString    := data.qrywareoutplan.fieldByname('costcusid').AsString;
   data.qrywareoutitem.fieldByname('shippercusname').AsString  :=data.qrywareoutplan.fieldByname('costcusname').AsString;
   data.qrywareoutitem.fieldByname('costcusid').AsString    :=data.qrywareoutplan.fieldByname('costcusid').AsString;
   data.qrywareoutitem.fieldByname('costcusname').AsString  :=data.qrywareoutplan.fieldByname('costcusname').AsString;

end;

procedure TfrmWareoutplan.mitdelLocINItemClick(Sender: TObject);
begin
   if data.qrywareoutitem.FieldByName('SNO').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     data.qrywareoutitem.Delete;
     grdSKU.SetFocus;
   end;
end;

procedure TfrmWareoutplan.grdSKUChangeNodeEx(Sender: TObject);
begin
  if grdSKU.Datalink.DataSet.State = dsInsert then
  begin
     grdskuBeforeInsert;
  end;
end;

procedure TfrmWareoutplan.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs)  then
    Allow:=False
  else
  begin
    Allow:=True;
  end;
end;

procedure TfrmWareoutplan.grdSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (data.qrywareoutitem.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddLocItemClick(Sender);
  end;
end;

procedure TfrmWareoutplan.grdSKUExit(Sender: TObject);
begin
  with TdxDBGrid(Sender) do
  try
    if Datalink.DataSet.State in  [dsInsert,dsEdit] then
    begin
       data.qrywareoutitem.Post;
    end;
  except
    SetFocus;
    raise;
  end;
end;

procedure TfrmWareoutplan.edtCostcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrywareoutplan.edit;
         data.qrywareoutplan.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrywareoutplan.FieldByName('costcusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;

end;

procedure TfrmWareoutplan.edtCusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrywareoutplan.edit;
         data.qrywareoutplan.FieldByName('Cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrywareoutplan.FieldByName('Cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;

end;

procedure TfrmWareoutplan.edtShippercusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrywareoutplan.edit;
         data.qrywareoutplan.FieldByName('shipperCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrywareoutplan.FieldByName('shipperCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;

end;


procedure TfrmWareoutplan.edtquantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    if StrToFloat(IIF(grdSKU.InplaceEditor.GetEditingText='',0,grdSKU.InplaceEditor.GetEditingText))<0 then
    begin
      ErrorText:=_strnumberzero;
      Accept:=False;
      exit;
    end;

    data.qrywareoutitem.Edit;
    data.qrywareoutitem.FieldByName('Quantity').AsFloat:=StrToFloat(IIF(grdSKU.InplaceEditor.GetEditingText='',0,grdSKU.InplaceEditor.GetEditingText));
    if _piececal then exit;
    with grdSKU.InplaceEditor do
    OpenSql(dataTmp.qryTmp,'select  *  from  sku where skuid="'+data.qrywareoutitem.fieldByname('skuid').AsString+'"');
    begin
       //件数
       if (dataTmp.qryTmp.FieldByName('PiecePro').AsFloat<>0) then
          data.qrywareoutitem.fieldByname('piece').AsFloat :=(data.qrywareoutitem.fieldByname('quantity').AsFloat/dataTmp.qryTmp.FieldByName('PiecePro').AsFloat);
       //体积
       if (dataTmp.qryTmp.FieldByName('volumePro').AsFloat<>0) then
          data.qrywareoutitem.fieldByname('volume').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('volumePro').AsFloat);
       //净重
       if (dataTmp.qryTmp.FieldByName('weightPro').AsFloat<>0) then
          data.qrywareoutitem.fieldByname('netweight').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('weightPro').AsFloat);
       //毛重
       if (dataTmp.qryTmp.FieldByName('weightPro').AsFloat<>0) then
          data.qrywareoutitem.fieldByname('grossweight').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('weightPro').AsFloat);
    end;
    Accept:=True;
   end;
end;

procedure TfrmWareoutplan.grdwareoutplanChangeNodeEx(Sender: TObject);
begin
  if (data.qrywareoutplan.ParamByName('Jobno').AsString<>data.qrywareoutplan0.FieldByName('Jobno').AsString)
    or (data.qrywareoutplan.ParamByName('Jobno').AsString='') then
  begin
    data.qrywareoutplan.ParamByName('Jobno').AsString:=data.qrywareoutplan0.FieldByName('Jobno').AsString;
    data.qrywareoutitem.ParamByName('Jobno').AsString:=data.qrywareoutplan0.FieldByName('Jobno').AsString;
    data.qryoutitem.ParamByName('mainorder').AsString:=data.qrywareoutplan0.FieldByName('mainorder').AsString;
    data.qryoutitem.ParamByName('costcusid').AsString:=data.qrywareoutplan0.FieldByName('costcusid').AsString;
  end;
end;

procedure TfrmWareoutplan.edtPieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    if StrToFloat(IIF(grdSKU.InplaceEditor.GetEditingText='',0,grdSKU.InplaceEditor.GetEditingText))<0 then
    begin
      ErrorText:=_strnumberzero;
      Accept:=False;
      exit;
    end;

    data.qrywareoutitem.Edit;
    data.qrywareoutitem.FieldByName('piece').AsFloat:=StrToFloat(IIF(grdSKU.InplaceEditor.GetEditingText='',0,grdSKU.InplaceEditor.GetEditingText));
    if _piececal then
    begin
       with grdSKU.InplaceEditor do
       OpenSql(dataTmp.qryTmp,'select  *  from  sku where skuid="'+data.qrywareoutitem.fieldByname('skuid').AsString+'"');
       begin
          //件数
          if (dataTmp.qryTmp.FieldByName('PiecePro').AsFloat<>0) then
             data.qrywareoutitem.fieldByname('quantity').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('PiecePro').AsFloat);
          //体积
          if (dataTmp.qryTmp.FieldByName('volumePro').AsFloat<>0) then
             data.qrywareoutitem.fieldByname('volume').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('volumePro').AsFloat);
          //净重
          if (dataTmp.qryTmp.FieldByName('weightPro').AsFloat<>0) then
             data.qrywareoutitem.fieldByname('netweight').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('weightPro').AsFloat);
          //毛重
          if (dataTmp.qryTmp.FieldByName('weightPro').AsFloat<>0) then
             data.qrywareoutitem.fieldByname('grossweight').AsFloat :=(data.qrywareoutitem.fieldByname('piece').AsFloat*dataTmp.qryTmp.FieldByName('weightPro').AsFloat);
       end;
    end;
    Accept:=True;
  end;
end;

end.

