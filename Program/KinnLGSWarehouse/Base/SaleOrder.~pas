unit SaleOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, StdCtrls, CheckLst, KGroupBox,
  KSText, DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner,dxMasterView,
  dxEditor, GMSLabel, dxTL, dxDBGrid, dxPageControl, DbButtons,KDataSetProvider,
  KBitBtn, ExtCtrls, KinPageControl, libUser, Menus, DBTables, DB ,libProc,
  KinQuery, DBKINCGrids, dxDBCtrl, dxDBTLCl, dxGrClms, KUpdateSql, RXSplit,
  DBClient, ADODB ;

type
  TfrmSaleOrder = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel6: TBevel;
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
    pgcTransOrder: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdSaleOrder: TdxDBGrid;
    tbsEdit: TdxTabSheet;
    GMSStickyLabel42: TGMSStickyLabel;
    Bevel1: TBevel;
    btnDelete: TKBitBtn;
    btnAdd: TKBitBtn;
    Bevel3: TBevel;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    Bevel4: TBevel;
    btnPrint: TKBitBtn;
    KGroupBox2: TKGroupBox;
    lblOrderID: TGMSStickyLabel;
    edtRemark: TdxDBEdit;
    GMSStickyLabel9: TGMSStickyLabel;
    edtOrderDate: TdxDBDateEdit;
    edtOrderDateTime: TdxDBTimeEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    btnCopy: TKBitBtn;
    orderno: TdxDBGridColumn;
    cusname: TdxDBGridColumn;
    orderdate: TdxDBGridColumn;
    salername: TdxDBGridColumn;
    orderstate: TdxDBGridColumn;
    boxcomplete: TdxDBGridColumn;
    ppmTransOrderSku: TPopupMenu;
    mitAddSku: TMenuItem;
    mitDelSku: TMenuItem;
    GMSStickyLabel48: TGMSStickyLabel;
    edtOrderNo: TdxDBEdit;
    btnOrder: TKBitBtn;
    Bevel5: TBevel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel20: TGMSStickyLabel;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    btnCheck: TKBitBtn;
    btnEdit: TKBitBtn;
    deliverydate: TdxDBGridColumn;
    GMSStickyLabel59: TGMSStickyLabel;
    edtSalerName: TdxDBButtonEdit;
    edtCusId: TdxDBButtonEdit;
    N10: TMenuItem;
    fireprooftype: TdxDBGridColumn;
    paneltype: TdxDBGridColumn;
    boxarea: TdxDBGridColumn;
    fanarea: TdxDBGridColumn;
    fanquantity: TdxDBGridColumn;
    ppmCheck: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    btnTotal: TKBitBtn;
    qryOther: TKADOQuery;
    qrySource: TKADOQuery;
    qryOrdercnfg: TKADOQuery;
    ppmPrint: TPopupMenu;
    mitAgreement: TMenuItem;
    projectname: TdxDBGridColumn;
    mitSkuDetail: TMenuItem;
    KGroupBox5: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel70: TGMSStickyLabel;
    KSText1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    ppmEdit: TPopupMenu;
    mitOperation: TMenuItem;
    boxquantity: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    grdSku: TdxDBGrid;
    edtSno: TdxDBGridColumn;
    edtSKUName: TdxDBGridButtonColumn;
    edtCodeno: TdxDBGridColumn;
    edtGradeType: TdxDBGridColumn;
    edtDownBox: TdxDBGridColumn;
    edtXh: TdxDBGridColumn;
    edtQuantity: TdxDBGridCurrencyColumn;
    cmbQuantityUom: TdxDBGridPickColumn;
    edtArea: TdxDBGridCurrencyColumn;
    cmbAreaUOM: TdxDBGridPickColumn;
    edtDownQuantity: TdxDBGridCurrencyColumn;
    edtHeight: TdxDBGridCurrencyColumn;
    edtWidth: TdxDBGridCurrencyColumn;
    edtRemarkSku: TdxDBGridColumn;
    GMSStickyLabel1: TGMSStickyLabel;
    edtDeliveryDate: TdxDBDateEdit;
    edtProjectName: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    cmdFireproofType: TKinDbPickEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    cmdPaneltype: TKinDbPickEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtFanQuantity: TdxDBEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    edtFanArea: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtBoxQuantity: TdxDBEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    edtBoxArea: TdxDBEdit;
    edtLockHole: TdxDBGridColumn;
    edtGlassHole: TdxDBGridColumn;
    edtDoorOpenType: TdxDBGridPickColumn;
    edtLightWindow: TdxDBGridColumn;
    checkname: TdxDBGridColumn;
    edtBoxOpenType: TdxDBGridPickColumn;
    GMSStickyLabel11: TGMSStickyLabel;
    edtOrderState: TdxDBEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    edtBoxComplete: TdxDBEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    edtFanComplete: TdxDBEdit;
    fancomplete: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    edtPath: TdxButtonEdit;
    GMSStickyLabel14: TGMSStickyLabel;
    conSkuData: TADOConnection;
    qrySkuData: TKADOQuery;
    OpenDialog1: TOpenDialog;
    btnInput: TKBitBtn;
    qryTmp: TKADOQuery;
    ppmOrderTask: TPopupMenu;
    mitPrdLocationin: TMenuItem;
    mitSaleLocatioinout: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure grdSaleOrderDblClick(Sender: TObject);
    procedure pgcTransOrderChange(Sender: TObject);
    procedure pgcInfoChange(Sender: TObject);
    procedure mitAddSkuClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edtCusIdButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusIdExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtSkuNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdSKUChangeNodeEx(Sender: TObject);
    procedure grdSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdSKUEnter(Sender: TObject);
    procedure mitDelSkuClick(Sender: TObject);
    procedure grdSkuExit(Sender: TObject);
    procedure edtQuantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtAreaValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdSaleOrderChangeNodeEx(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edtWidthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnRefindClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdSaleOrderCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure edtSalerNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtOrderDateTimeExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtOrderDateExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure N10Click(Sender: TObject);
    procedure edtCusIdExit(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure grdLorderopinfoEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdSkuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitOperationClick(Sender: TObject);
    procedure edtDownQuantityValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtHeightValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btnInputClick(Sender: TObject);
    procedure mitPrdLocationinClick(Sender: TObject);
    procedure mitSaleLocatioinoutClick(Sender: TObject);
  private
    { Private declarations }

    ScrollAfterEdit,blnCopy:Boolean;
    Bookmark: TBookmark;         //书签
    FindItem: TFindItem;          //是否需要查找
    strGetCd:String;
    FilterSql: string;
    arrSaleOrder0,arrSaleOrder,arrSaleOrderSku: Variant;
    sltGridname: TStringList;
    sltGridVisible: TStringList;
    StrJobno:String;
    IsEdit:boolean;
    blnSelect:Boolean;
    IntUnDown:Integer;

    StrPlUserId:String;
    StrPlUserName:String;
    StrPdictatetype:String;
    StrPSArea:String;
    StrPEArea:String;
    StrHistOrderNo,
    StrHistAccountName,
    strHistMessage:string;
    sltUomTypecd,sltUomTypeName:TStringList;
    strjobnogrid:string;
    strDel_Task:string;                       //任务商品删除时从表控制
    strsql:string;
    m_blnPost: Boolean;//在Post状态
    strdictatetype:string;
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure InitValues;
    function  Gather:boolean;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure SetMasterDetailState(blnConnect:Boolean);
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure grdSKUBeforeInsert;
    procedure TimeSelect;
  public
    { Public declarations }

    DataState:TDataState;//进入form状态模式
    strHistDetailMessage:string;
    maxSno:Integer;
    blnTotal:boolean;
    Year,Month,Day:word;
    procedure CreateParams(var Params: TCreateParams); override;

  end;

procedure WorkSaleOrder(CallMode:TDataState;pstrJobno:string);

var
  frmSaleOrder:TfrmSaleOrder;//发货指令

implementation

{$R *.dfm}
Uses kindlg, Saveget,datas,datasTmp,datasSelect,linprint,libBb,
     find , main ,GetUserRight,GetDllPub, GridSelect,libuserpub,
     Operation,InPutOrder;
procedure WorkSaleOrder(CallMode:TDataState;pstrJobno:string);
{入口函数
  CallMode   :进入form状态模式
}
var
   StrDefFilterSql:string;
   year,month,day:word;
   month_start,month_end:TDate;
begin
   if frmSaleOrder <> nil then
   with frmSaleOrder do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmSaleOrder:=TfrmSaleOrder.Create(Application);
   with frmSaleOrder do
   begin
   {初始化所有数据集}
      ScrollAfterEdit:=True;
      blnCopy      :=False;             //系统默认不复制新增
      FindItem     :=TFindItem.Create;
      sltGridname:=TStringList.Create;
      sltGridVisible:=TStringList.Create;
      IsEdit       :=false;
      StrJobno:=pStrJObno;
      blnTotal:=false;
      //lbl
      //Application.OnShowHint := ShowHint;

      InitdbPick(cmbQuantityUom,'uom','uomname','uomname',' uomtype like "%件数%" ');
      InitdbPick(cmbAreaUom,'uom','uomname','uomname',' uomtype like "%面积%" ');
      //初始化订单代码
      //防火类型
      InitdbPick(cmdFireproofType,'codelib','codename','codename','codeclass="90"');
      //面板类型
      InitdbPick(cmdPaneltype,'codelib','codename','codename','codeclass="91"');


      sltUomTypecd:=TStringList.Create;
      sltUomTypeName:=TStringList.Create;
      OpenSql(dataTmp.qryTmp,' select codecd,codename from codelib (nolock) '
                            +'  where codeclass="05"   ');
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         sltUomTypecd.Add(dataTmp.qryTmp.FieldByName('codecd').AsString);
         sltUomTypeName.Add(dataTmp.qryTmp.FieldByName('codename').AsString);
         dataTmp.qryTmp.Next;
      end;
      dataTmp.qryTmp.Close;

      blnSelect:=False;

      //假主库过滤条件
      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;
      if trim(strJobno)='' then
      begin
        FilterSql:=' (convert(datetime,convert(char(8),saleorder.orderdate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),saleorder.orderdate,112)) <="'+datetostr(Month_End)+'")';
      end else filtersql:='  jobno="'+strjobno+'"  ';

  //自行设置默认过滤条件
      StrDefFilterSql:=GetdefFilter('订单中心');
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      data.InitSaleOrder(FilterSql);     //初始化各个Query
      grdSaleOrderChangeNodeEx(nil);

      if uppercase(_LoginId)<>'SYSTEM' then
         SetButtonEnabled(Toolpanel,'mitSalerOrder',trim(_UserOrgid)); //设置按钮权限
      WorkCall(stBrowse);
      Show;
   end;
end;

procedure TfrmSaleOrder.WorkCall(CallMode:TDataState);
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
//             LampChange(lsBrowse);
          end;
        stEdit:
          begin
             strDel_Task:='';
             data.qrySaleOrder.Edit;
             data.qrySaleorderEdit.Edit;
             data.qrySaleorderEdit.FieldByName('modifyname').AsString:=_LoginName;
             openSql(dataTmp.qryTmp,' select nowTime=getDate() ');
             data.qrySaleorderEdit.FieldByName('modifydate').AsDatetime:=dataTmp.qryTmp.FieldByName('nowTime').AsDateTime;
             //在修改的状态下，对qryTransOrderSku循环
             data.qrySaleOrderSku.DisableControls;
             Bookmark:= data.qrySaleOrderSku.GetBookmark;
             maxSno:=0;
             data.qrySaleOrderSku.First;
             while not data.qrySaleOrderSku.Eof do
             begin
                if data.qrySaleOrderSku.FieldByName('sno').AsInteger>maxSno
                then maxSno:=data.qrySaleOrderSku.FieldByName('sno').AsInteger;
                data.qrySaleOrderSku.Next;
             end;
             data.qrySaleOrderSku.GotoBookmark(Bookmark);
             data.qrySaleOrderSku.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qrySaleOrderSku.EnableControls;

             EnableEdit;
//             LampChange(lsEdit);
          end;
        stInsert:
          begin
             strDel_Task:='';
             data.qrySaleOrder.Append;
             if not blnCopy then
                data.qrySaleorderEdit.Append;
             maxSno:=0;
             EnableEdit;
             InitValues;
             data.qrySaleorderEdit.Edit;
             data.qrySaleorderEdit.FieldByName('createname').Asstring:=_LoginName;
             data.qrySaleorderEdit.fieldByname('CreateDate').AsDatetime:=GetServerDate;
             //data.qrySaleorderEdit.FieldByName('checkname').Asstring:='';
             //data.qrySaleorderEdit.fieldByname('Checkdate').AsString:='';
             //data.qrySaleorderEdit.fieldByname('Checkdate').Clear;
             data.qrySaleorderEdit.FieldByName('modifyname').Asstring:='';
             data.qrySaleorderEdit.fieldByname('modifydate').AsString:='';
             data.qrySaleorderEdit.fieldByname('modifydate').Clear;
//             LampChange(lsEdit);
          end;
      end;
   end;
end;

procedure TfrmSaleOrder.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
   edtOrderDate.SetFocus;
   btnTotal.Visible:=True;

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior+[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=False;
   grdSKU.ClearGroupColumns;

   StrHistOrderNo:=data.qrySaleorderEdit.FieldByName('orderno').AsString;
   StrHistAccountName:=data.qrySaleorderEdit.FieldByName('cusname').AsString;
   strHistDetailMessage:='';
   strHistMessage:='';
   blnTotal:=False;
end;

procedure TfrmSaleOrder.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   if data.qrySaleOrder.FieldByName('Jobno').AsString='' then
      setDisable:=setDisable+[2,4];
   libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
   btnTotal.Visible:=False;

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior-[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=True;
end;

procedure TfrmSaleOrder.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox5);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox3);
   SetDxDbGrid(grdSaleOrder);
   SetDxDbGrid(grdSKu);
   pgcTransOrder.ActivePage:=tbsBrowse;
   qrySource.Connection:=_ADOConnection;
   qryOther.Connection:=_ADOConnection;
   qryOrdercnfg.Connection:=_ADOConnection;
   qrytmp.Connection:=_ADOConnection;
end;

procedure TfrmSaleOrder.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
   if DataState = stBrowse then
   begin
      case Key of
        VK_F3:
          if pgcTransOrder.ActivePage=tbsEdit then
          begin
             pgcTransOrder.ActivePage:=tbsBrowse;
          end else
          begin
             pgcTransOrder.ActivePage:=tbsEdit;
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

procedure TfrmSaleOrder.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   if DataState in setdcs then
      Action := caNone
   else
      Action := caFree;
end;

procedure TfrmSaleOrder.FormDestroy(Sender: TObject);
begin
//   Lampchange(lsMenu);
   Application.onShowhint := nil;
   sltGridname.Free;
   sltGridVisible.Free;
   data.qrySaleOrderSku.Close;
   data.qrySaleorderEdit.Close;
   data.qrySaleOrder.Close;
   sltUomTypecd.Free;
   sltUomTypeName.Free;
   frmSaleOrder:=nil;
   //商品细目form释放
end;

procedure TfrmSaleOrder.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmSaleOrder.btnAddClick(Sender: TObject);
begin
   if pgcTransOrder.ActivePage<>tbsEdit then pgcTransOrder.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
end;

procedure TfrmSaleOrder.InitValues;
{初始化时自动生成仓位代码}
var
   strJobno:string;
begin
   strJobno:=GenJobno('OC');
   //生成工作号
   data.qrySaleOrder.FieldByName('Jobno').AsString:=strJobno;
   if blnCopy then
   begin
      blnCopy:=False;

      GatherFromArray(data.qrySaleorderEdit,arrSaleOrder,False);
      data.qrySaleorderEdit.FieldByName('jobno').AsString:=data.qrySaleOrder.FieldByName('jobno').AsString;
      data.qrySaleorderEdit.FieldByName('orderno').AsString:='';
      data.qrySaleorderEdit.FieldByName('userid').AsString:=_UserId;
      data.qrySaleorderEdit.FieldByName('username').AsString:=_Username;
      data.qrySaleorderEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qrySaleorderEdit.FieldByName('orderstate').AsString:='未确定';
      data.qrySaleorderEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qrySaleorderEdit.FieldByName('fancomplete').AsString:='未生产';

      GatherFromArray(data.qrySaleOrderSku,arrSaleOrderSku,True);
      //qrySaleOrderSku更新关键字
      data.qrySaleOrderSku.First;
      while not data.qrySaleOrderSku.Eof do
      begin
         data.qrySaleOrderSku.Edit;
         data.qrySaleOrderSku.FieldByName('jobno').Asstring:=data.qrySaleorderEdit.FieldByName('jobno').AsString;
         if data.qrySaleOrderSku.FieldByName('sno').AsInteger>maxSno then
            maxSno:=data.qrySaleOrderSku.FieldByName('sno').AsInteger;
         data.qrySaleOrderSku.next;
      end;
      data.qrySaleOrderSku.First;
   end else
   begin
      data.qrySaleorderEdit.Edit;
      data.qrySaleorderEdit.FieldByName('jobno').AsString:=data.qrySaleOrder.FieldByName('jobno').AsString;
      data.qrySaleorderEdit.FieldByName('userid').AsString:=_UserId;
      data.qrySaleorderEdit.FieldByName('username').AsString:=_UserName;
      data.qrySaleorderEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qrySaleorderEdit.FieldByName('orderstate').AsString:='';
      data.qrySaleorderEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qrySaleorderEdit.FieldByName('fancomplete').AsString:='未生产';
   end;
end;

procedure TfrmSaleOrder.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         While True do
         begin
           try
             _ADOConnection.Starttransaction;
             if (DataState=stInsert) and (_isuserhist='T') then
                strHistMessage:='  订单号-'+data.qrySaleorderEdit.FieldByName('orderno').AsString
                               +'  订货单位-'+data.qrySaleorderEdit.FieldByName('cusname').AsString
             else if (DataState=stEdit) and (_isuserhist='T') then
             begin
                if VarToStr(data.qrySaleorderEdit.FieldByName('orderno').OldValue)<>data.qrySaleorderEdit.FieldByName('orderno').AsString then
                  strHistMessage:=strHistMessage
                               +'  订单号-'+VarToStr(data.qrySaleorderEdit.FieldByName('orderno').OldValue)+' →'+data.qrySaleorderEdit.FieldByName('orderno').AsString;

                if VarToStr(data.qrySaleorderEdit.FieldByName('cusname').OldValue)<>data.qrySaleorderEdit.FieldByName('cusname').AsString then
                  strHistMessage:=strHistMessage
                               +'  订货单位-'+VarToStr(data.qrySaleorderEdit.FieldByName('cusname').OldValue)+' →'+data.qrySaleorderEdit.FieldByName('cusname').AsString;
             end;
             data.qrySaleorderEdit.ApplyUpdates;
             data.qrySaleOrder.Edit;
             data.qrySaleOrder.FieldByName('jobno').AsString  :=data.qrySaleorderEdit.FieldByName('Jobno').AsString;
             data.qrySaleOrder.FieldByName('orderno').AsString:=data.qrySaleorderEdit.FieldByName('orderno').AsString;
             data.qrySaleOrder.FieldByName('cusid').AsString :=data.qrySaleorderEdit.FieldByName('cusid').AsString;
             data.qrySaleOrder.FieldByName('cusname').AsString :=data.qrySaleorderEdit.FieldByName('cusname').AsString;
             data.qrySaleOrder.FieldByName('userid').AsString  :=data.qrySaleorderEdit.FieldByName('userid').AsString;
             //
             m_blnPost:=true;
             data.qrySaleOrder.ApplyUpdates;
             m_blnPost:=False;
             Break;
           except
              _ADOConnection.Rollback; //先结束事务
              raise;
              exit;
           end;
         end;
         data.qrySaleOrderSku.DisableControls;
         data.qrySaleOrderSku.first;
         while not data.qrySaleOrderSku.eof do
         begin
            data.qrySaleOrderSku.Edit;
            data.qrySaleOrderSku.fieldbyname('jobno').asstring:=data.qrySaleorderEdit.fieldbyname('jobno').asstring;
            data.qrySaleOrderSku.Post;
            data.qrySaleOrderSku.next;
         end;
         data.qrySaleOrderSku.first;
         data.qrySaleOrderSku.EnableControls;
         data.qrySaleOrderSku.applyupdates;

         strHistMessage:=strHistMessage+strHistDetailMessage;
         //删除商品明细
         if strDel_Task<>'' then
         begin
            strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
            strsql:=' delete from saleOrdersku '
                   +'  where jobno="'+data.qrySaleOrder.fieldbyname('Jobno').asstring+'"'
                   +'    and '+'('+strDel_Task+') ';
            execsql(datatmp.qryTmp,strsql);
            strDel_Task:='';
         end;
         if (strHistMessage<>'') and (_isuserhist='T') then
           execsql(dataTmp.qryTmp,'insert into UserHist '
                         +' (username,userdate,jobno,  remark,typename,modifytype)'
                         +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                         +data.qrySaleorderEdit.FieldByName('jobno').Asstring+'","'
                         +strHistMessage+'","订单中心","'+iif(DataState=stEdit,'修改','新增')+'")');
         //lbl
         {if frmSKUDetail<>nil then
         begin
            frmSKUDetail.isupdate:=True;
            frmSKUDetail.Destroy;
         end;}
         if not _skudetailupdsucc then
         begin
            try
            except
            end;
            raise Exception.Create('商品明细更新出错!');
         end;
         _ADOConnection.Commit;
      except
         arrSaleOrder0:=ScatterToArray(data.qrySaleOrder,true,0);
         arrSaleOrder:=ScatterToArray(data.qrySaleorderEdit,true,0);
         m_blnPost:=true;
         data.qrySaleOrder.CancelUpdates;
         data.qrySaleorderEdit.CancelUpdates;
         if datastate=stInsert then
         begin
            data.qrySaleOrder.Append;
            data.qrySaleorderEdit.Append;
         end else
         begin
            data.qrySaleOrder.Locate('jobno',
                              VarArrayOf([data.qrySaleOrder.FieldByName('jobno').AsString]),
                              [loCaseInsensitive, loPartialKey]);
            data.qrySaleOrder.Edit;
         end;
         data.qrySaleOrder.DisableControls;
         GatherFromArray(data.qrySaleOrder,arrSaleOrder0,false);
         GatherFromArray(data.qrySaleorderEdit,arrSaleOrder,false);
         data.qrySaleOrder.EnableControls;
         m_blnPost := False;         
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         Exit;
      end;

      data.qrySaleOrder.CommitUpdates;
      data.qrySaleorderEdit.CommitUpdates;
      data.qrySaleOrderSku.CommitUpdates;

      ScrollAfterEdit:=False;
      IsEdit:=false;
      WorkCall(stBrowse);
   end;
end;

function TfrmSaleOrder.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   StrSkuName:String;
begin
   Result:=False;

   if edtOrderNo.Text<>'' then
   begin
      opensql(dataTmp.qryTmp,'select con=count(*) from saleorder(nolock) where orderno="'+Trim(edtOrderNo.Text)+'"');
      if ((not IsEdit) and (dataTmp.qryTmp.FieldByName('con').AsInteger>0))or(IsEdit and (dataTmp.qryTmp.FieldByName('con').AsInteger>1))  then
      begin                                                                //IsEdit为true即修改的情况下
         edtOrderNo.setFocus;
         KmessageDlg('订单号重复,请修改！',mtinformation,[mbOK],0);
         Exit;
      end;
   end;
   if (data.qrySaleorderEdit.FieldByName('cusid').AsString='') then
   begin
      KmessageDlg('订货单位不能为空！',mtinformation,[mbOK],0);
      edtCusID.SetFocus;
      exit;
   end;
   if edtOrderDate.Date=0 then
   begin
      KmessageDlg('订货日期不能为空！',mtinformation,[mbOK],0);
      edtOrderDate.SetFocus;
      exit;
   end;

   if data.qrySaleOrderSku.RecordCount=0 then
   begin
      if KmessageDlg('没有货物信息，您确定要保存吗?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
         exit;
   end;
   //qrySaleOrderSku更新配送指令单号,为主库商品信息赋值
   data.qrySaleorderEdit.FieldByName('boxarea').AsFloat:=0;
   data.qrySaleorderEdit.FieldByName('boxquantity').AsFloat:=0;
   data.qrySaleorderEdit.FieldByName('fanarea').AsFloat:=0;
   data.qrySaleorderEdit.FieldByName('fanquantity').AsFloat:=0;

   StrSkuName:='';

   data.qrySaleOrderSku.DisableControls;
   data.qrySaleOrderSku.First;
   data.qrySaleorderEdit.FieldByName('quantityuom').Asstring:=data.qrySaleOrderSku.FieldByName('quantityuom').AsString;
   data.qrySaleorderEdit.FieldByName('areauom').Asstring    :=data.qrySaleOrderSku.FieldByName('areauom').AsString;
   while not data.qrySaleOrderSku.Eof do
   begin
      if Pos('门框',data.qrySaleOrderSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qrySaleorderEdit.Edit;
         data.qrySaleorderEdit.FieldByName('boxquantity').AsFloat:=data.qrySaleorderEdit.FieldByName('boxquantity').AsFloat+data.qrySaleOrderSku.FieldByName('Quantity').AsFloat;
         data.qrySaleorderEdit.FieldByName('boxarea').AsFloat:=data.qrySaleorderEdit.FieldByName('boxarea').AsFloat+data.qrySaleOrderSku.FieldByName('Area').AsFloat;
      end;
      if Pos('门扇',data.qrySaleOrderSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qrySaleorderEdit.Edit;
         data.qrySaleorderEdit.FieldByName('fanquantity').AsFloat:=data.qrySaleorderEdit.FieldByName('fanquantity').AsFloat+data.qrySaleOrderSku.FieldByName('Quantity').AsFloat;
         data.qrySaleorderEdit.FieldByName('fanarea').AsFloat:=data.qrySaleorderEdit.FieldByName('fanarea').AsFloat+data.qrySaleOrderSku.FieldByName('Area').AsFloat;
      end;
      if Pos(data.qrySaleOrderSku.fieldbyname('skuname').AsString,strSKUName)=0 then
         strSKUName:=strSKUName+data.qrySaleOrderSku.fieldbyname('skuname').AsString+' ';
      data.qrySaleOrderSku.next;
   end;
   data.qrySaleOrderSku.First;
   data.qrySaleOrderSku.EnableControls;
   //lbl
   //if data.qrySaleorderEdit.FieldByName('insure').AsFloat=0 then
   //   btnTotalClick(self);

   Result:=True;
end;

procedure TfrmSaleOrder.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" ');  
   data.qrySaleOrderSku.CancelUpdates;
   data.qrySaleorderEdit.CancelUpdates;
   data.qrySaleOrder.CancelUpdates;

   IsEdit:=false;
   grdSku.ResetFullRefresh;

   WorkCall(stBrowse);
   //lbl
   {if frmSKUDetail<>nil then
   begin
      frmSKUDetail.isupdate:=false;
      frmSKUDetail.Destroy;
   end;}
end;

procedure TfrmSaleOrder.btnCopyClick(Sender: TObject);
begin
   if pgcTransOrder.ActivePage<>tbsEdit then
      pgcTransOrder.ActivePage:=tbsEdit;
   SetDetailActive(False,True);

   arrSaleOrder       :=ScatterToArray(data.qrySaleorderEdit,True,0);
   arrSaleOrderSku :=ScatterToArray(data.qrySaleOrderSku,false,0);

   ScrollAfterEdit:=True;
   blnCopy:=True;
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmSaleOrder.btnEditClick(Sender: TObject);
begin
   if data.qrySaleOrder.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能修改！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   dataTmp.qryTmp.Close;
   if pgcTransOrder.ActivePage<>tbsEdit then pgcTransOrder.ActivePage:=tbsEdit;
   IsEdit:=true;
   SetDetailActive(False,True);
   WorkCall(stEdit);
end;

procedure TfrmSaleOrder.btnDeleteClick(Sender: TObject);
begin
   if data.qrySaleOrder.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能删除！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      if pgcTransOrder.ActivePage<>tbsEdit then pgcTransOrder.ActivePage:=tbsEdit;
      SetDetailActive(false,true);
      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
        //处理日志
        if _isoriinfo='T' then
        begin
           strHistMessage:='  订单号-'+data.qrySaleorderEdit.FieldByName('orderno').AsString
                          +'  订货单位-'+data.qrySaleorderEdit.FieldByName('cusname').AsString;
           if strHistMessage<>'' then
             execsql(dataTmp.qryTmp,'insert into UserHist '
                           +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                           +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                           +data.qrySaleorderEdit.FieldByName('jobno').Asstring+'","'
                           +strHistMessage+'","订单中心","删除")');
        end;
        ExecSql(dataTmp.qryTmp,'delete from saleordersku '
                      +' where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,'delete from saleorder '
                      +' where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,' delete genjobno '
                              +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" ');
        data.qrySaleOrder.Applyupdates;
        TdxDBGridNode(grdSaleOrder.FocusedNode).Delete;
        _ADOConnection.Commit;
      except
        try
          if _ADOConnection.InTransaction then _ADOConnection.RollBack;
        except
        end;
        raise;
        exit;
      end;
      data.qrySaleOrder.CommitUpdates;
      SetMasterDetailState(True);

      WorkCall(stBrowse);
   end;
   SetDetailActive(False,False);
   SetDetailActive(True,True);
end;

procedure TfrmSaleOrder.btnRefreshClick(Sender: TObject);
var
   strJB:string;
begin
   strJB:=data.qrySaleOrder.FieldByName('jobno').AsString;
   if Sender=btnRefresh then
   begin
      data.qrySaleOrder.Close;
      data.qrySaleOrder.DisableControls;
      data.qrySaleOrder.Open;
      try
        data.qrySaleOrder.Locate('jobno',strJB,[loCaseInsensitive, loPartialKey]);
      except
        data.qrySaleOrder.Last;
      end;
      data.qrySaleOrder.EnableControls;
      grdSaleOrderChangeNodeEx(nil);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
      WorkCall(stBrowse);
   end else
   begin
      RefreshCurrentData(data.qrySaleOrder,'saleorder.jobno="'+strJB+'" ');
      grdSaleOrderChangeNodeEx(nil);
      WorkCall(stBrowse);
   end;
end;

procedure TfrmSaleOrder.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcTransOrder.ActivePage <> tbsBrowse then pgcTransOrder.ActivePage := tbsBrowse;
   pgcTransOrderChange(self);
   Para := TfindPara.Create;

   para.tables.add(' saleorder ');

{0}   para.field.add('saleorder.orderno');
{1}   para.field.add('saleorder.cusid');
{2}   para.field.add('convert(datetime,convert(char(10),saleorder.createdate,102))');
{3}   para.field.add('convert(datetime,convert(char(10),saleorder.orderdate,102))');
{4}   para.field.add('saleorder.orderstate');
{5}   para.field.add('saleorder.boxcomplete');
{6}   para.field.add('saleorder.fancomplete');

   Para.Exp.add('');

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.add(IIF(_Language='CAPTIONC','创建日期','*****'));
{3}   Para.Toptic.add(IIF(_Language='CAPTIONC','订货日期','*****'));
{4}   Para.Toptic.add(IIF(_Language='CAPTIONC','销售状态','*****'));
{5}   Para.Toptic.add(IIF(_Language='CAPTIONC','门板状态','*****'));
{5}   Para.Toptic.add(IIF(_Language='CAPTIONC','门扇状态','*****'));

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('E');
{2}   para.Ftype.add('D');
{3}   para.Ftype.add('D');
{4}   para.Ftype.add('C');
{5}   para.Ftype.add('C');
{6}   para.Ftype.add('C');

   Para.RField.add('saleorder.jobno');

   Para.OnGetValue:=FindGetValue;

   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     data.qrySaleOrder.DisableControls;
     data.qrySaleOrder.Close;
     if strTmp<>'' then
       data.qrySaleOrder.MacroByName('where').AsString:=strTmp
     else
       data.qrySaleOrder.MacroByName('where').AsString:='1=1';
     data.qrySaleOrder.Open;
     data.qrySaleOrder.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmSaleOrder.btnFindClick(Sender: TObject);
var
   para:TFindPara;
begin
   if pgcTransOrder.ActivePage <> tbsBrowse then pgcTransOrder.ActivePage := tbsBrowse;
   pgcTransOrderChange(self);
   Para := TfindPara.Create;

   para.tables.add(' saleorder ');

{0}   para.field.add('saleorder.orderno');
{1}   para.field.add('saleorder.cusname');
{2}   para.field.add('convert(datetime,convert(char(10),saleorder.orderdate,102))');

   Para.Exp.add('');
   Para.Filter:='   and saleorder.userid like rtrim("'+_userid+'")+"%" '; // UserId组织

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.add(IIF(_Language='CAPTIONC','订货日期','*****'));

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('E');
{2}   para.Ftype.add('D');

   Para.RField.add('saleorder.jobno');
   Para.OnGetValue:=FindGetValue;

   Dofind(data.qrySaleOrder, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmSaleOrder.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qrySaleOrder,dataTmp.qryFind);
end;

function TfrmSaleOrder.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
   1:
     begin
        qrySelect:=pGetCustomerSelect('C','');
        if qrySelect.FieldByName('cusid').AsString<>'NO' then
        begin
           PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
           PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
        end;
        FreeAndNil(qrySelect);
     end;
    else
      Result:=False;
  end;
end;

procedure TfrmSaleOrder.btnBrowMxClick(Sender: TObject);
begin
   pgcTransOrder.ActivePage := tbsEdit;
end;

procedure TfrmSaleOrder.btnBrowGlClick(Sender: TObject);
begin
   pgcTransOrder.ActivePage := tbsBrowse;
end;

procedure TfrmSaleOrder.grdSaleOrderDblClick(Sender: TObject);
begin
   if pgcTransOrder.ActivePage<>tbsEdit then
      pgcTransOrder.ActivePage:=tbsEdit;
end;

procedure TfrmSaleOrder.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
   //防止保存后直接修改所造成的从库状态变化
   if not ScrollAfterEdit and blnOpen then
   begin
      if data.qrySaleOrderSku.Active then
      begin
         data.qrySaleOrderSku.Close;
         data.qrySaleOrderSku.Open;
      end;
      ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      data.qrySaleorderEdit.Active       :=blnOpen;
      data.qrySaleOrderSku.Active :=blnOpen;
   end else
   begin
      data.qrySaleorderEdit.Active:=blnOpen;
      data.qrySaleOrderSku.Active := blnOpen;
   end;
end;

procedure TfrmSaleOrder.SetMasterDetailState(blnConnect:Boolean);
  //{将主从表的MasterDetail关系连接或切断}
begin
end;

procedure TfrmSaleOrder.pgcTransOrderChange(Sender: TObject);
begin
   if pgcTransOrder.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      SetDetailActive(True,True);
   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
//      SetDetailActive(False,False);
   end;
end;

procedure TfrmSaleOrder.pgcInfoChange(Sender: TObject);
begin
   if data.qrySaleOrder.Active then SetDetailActive(true,true);
end;

procedure TfrmSaleOrder.mitAddSkuClick(Sender: TObject);
begin
   grdSKU.SetFocus;
   data.qrySaleOrderSku.Append;
   grdSKUBeforeInsert;
end;

procedure TfrmSaleOrder.edtCusIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('C','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySaleorderEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySaleorderEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSaleOrder.edtCusIdExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCusId.Text='' then
      begin
         data.qrySaleorderEdit.Edit;
         data.qrySaleorderEdit.FieldByName('cusid').AsString:='';
         data.qrySaleorderEdit.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('C',edtCusId.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qrySaleorderEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySaleorderEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
      FreeAndNil(qrySelect);
      end;
   end;
//  TimeSelect;
end;

procedure TfrmSaleOrder.edtSkuNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
   blnFirst:boolean;
begin
   if data.qrySaleorderEdit.FieldByName('cusid').AsString='' then
   begin
      KMessageDlg('请先选择订货单位',mtinformation,[mbok],0);//'请先选择托运单位'
      edtCusId.SetFocus;
      Exit;
   end;
   qrySelect:=pGetSkuSelect('','','T');
   qrySelect.First;
   blnFirst:=True;
   while not qrySelect.Eof do
   begin
      if blnFirst then
      begin
         data.qrySaleOrderSku.Edit;
         blnFirst:=False;
      end else
         data.qrySaleOrderSku.Append;
      data.qrySaleOrderSku.Fieldbyname('quantity').AsInteger  :=1;
      data.qrySaleOrderSku.Fieldbyname('area').AsFloat  :=qrySelect.FieldByName('areapro').AsFloat*data.qrySaleOrderSku.Fieldbyname('quantity').AsFloat;

      data.qrySaleOrderSku.FieldByName('SkuId').AsString  :=qrySelect.FieldByName('skuId').AsString;
      data.qrySaleOrderSku.FieldByName('SkuName').AsString  :=qrySelect.FieldByName('skuname').AsString;
      data.qrySaleOrderSku.FieldByName('QuantityUOM').AsString:=qrySelect.FieldByName('QuantityUOM').AsString;;
      data.qrySaleOrderSku.FieldByName('areauom').AsString    :=qrySelect.FieldByName('areauom').AsString;;

      try
         data.qrySaleOrderSku.Post;
      except
         break;
      end;
      qrySelect.Next;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmSaleOrder.grdSKUBeforeInsert;
begin
   grdSKU.FocusedColumn:=0;
   data.qrySaleOrderSku.Fieldbyname('sno').AsFloat  :=-1;

   data.qrySaleOrderSku.fieldByname('jobno').AsString:=data.qrySaleorderEdit.fieldbyname('jobno').AsString;
end;

procedure TfrmSaleOrder.grdSKUChangeNodeEx(Sender: TObject);
begin
   if grdSKU.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUBeforeInsert;
   end;
end;

procedure TfrmSaleOrder.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmSaleOrder.grdSKUEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qrySaleOrderSku.fieldbyname('sno').AsInteger=0) then
   begin
      mitAddSKUClick(Sender);
   end;
end;

procedure TfrmSaleOrder.mitDelSkuClick(Sender: TObject);
begin
   if data.qrySaleOrderSku.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       strDel_Task:=strDel_Task+' or SNO='+data.qrySaleOrderSku.fieldbyname('SNO').Asstring;
       grdSKU.SetFocus;
       data.qrySaleOrderSku.Delete;
    end;
end;

procedure TfrmSaleOrder.grdSkuExit(Sender: TObject);
begin
   with grdSku do
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

procedure TfrmSaleOrder.edtQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSku.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)<0 then
      begin
         {if _Language='CAPTIONC' then
            ErrorText:='数量不能小于零!'
         else  }
            ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
      data.qrySaleOrderSku.Edit;
      data.qrySaleOrderSku.FieldByName('quantity').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);

      Accept:=True;
   end;
end;

procedure TfrmSaleOrder.edtAreaValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSku.InplaceEditor.GetEditingText<>'') then
   begin
      if strtofloat(grdSku.InplaceEditor.GetEditingText)<0 then
      begin
         {if _Language='CAPTIONC' then
            ErrorText:='面积不能小于零!'
         else     }
            ErrorText:='面积不能小于零!';
         Accept:=False;
         exit;
      end;
      data.qrySaleOrderSku.Edit;
      data.qrySaleOrderSku.FieldByName('area').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);
      Accept:=True;
   end;
end;

procedure TfrmSaleOrder.grdSaleOrderChangeNodeEx(Sender: TObject);
begin
  if (data.qrySaleorderEdit.ParamByName('Jobno').AsString<>data.qrySaleOrder.FieldByName('Jobno').AsString)
    or (data.qrySaleorderEdit.ParamByName('Jobno').AsString='') then
  begin
    data.qrySaleorderEdit.ParamByName('Jobno').AsString:=data.qrySaleOrder.FieldByName('Jobno').AsString;
    data.qrySaleOrderSku.ParamByName('Jobno').AsString:=data.qrySaleOrder.FieldByName('Jobno').AsString;
    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcTransOrder.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmSaleOrder.edtWidthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleOrderSku.FieldByName('width').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleOrder.mitFilterActiveClick(Sender: TObject);
begin
   grdSaleOrder.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmSaleOrder.grdSaleOrderCustomDrawCell(Sender: TObject;
   ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
   AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
   var AText: String; var AColor: TColor; AFont: TFont;
   var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[checkname.Index]<>'') then
      AColor:= $00C1DBC1
   else
      AColor:=clInfoBk;
   if ASelected or AFocused then
   begin
      AColor := clHighlight;
      AFont.Color:=clWhite;
   end;
end;

procedure TfrmSaleOrder.edtSalerNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if data.qrySaleorderEdit.fieldbyname('cusid').asstring='' then
      begin
         ActiveControl:=edtCusID;
         KmessageDlg('请先选择订货单位!',mtWarning,[mbOK],0);
         Exit;
      end;
      qrySelect:=pGetOperatorSelect(data.qrySaleorderEdit.fieldbyname('cusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qrySaleorderEdit.Edit;
         data.qrySaleorderEdit.Fieldbyname('salername').asstring:=qrySelect.FieldByName('opname').AsString;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSaleOrder.edtOrderDateTimeExitCheck(Sender: TObject;
   OldValue: Variant; var Failed: Boolean);
begin
   TimeSelect;
end;

procedure TfrmSaleOrder.edtOrderDateExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if DataState in Setdcs then
   TimeSelect;
end;

procedure TfrmSaleOrder.TimeSelect;
begin
{   IntColltime:=0;
   IntCelivTime:=0;
   IntReTime:=0;
   begin
      strsql:='exec ksp_getThreeTime @AccountID ="'+data.qrySaleorderEdit.FieldByName('cusid').AsString+'",'+chr(13)+chr(10)
           +'                       @OrderType ="'+data.qrySaleorderEdit.FieldByName('ordertype').AsString+'",'+chr(13)+chr(10)
           +'                       @StartZoneCD ="'+data.qrySaleorderEdit.FieldByName('CollectionZoneCD').AsString+'",'+chr(13)+chr(10)
           +'                       @EndZoneCD  ="'+data.qrySaleorderEdit.FieldByName('DestinationZoneCD').AsString+'"'+chr(13)+chr(10);

      opensql(dataTmp.qryTmp,strsql);
      if dataTmp.qryTmp.RecordCount=1 then
      begin
         IntColltime:=dataTmp.qryTmp.fieldbyname('CollTime').asinteger;
         IntCelivTime:=dataTmp.qryTmp.fieldbyname('Delive').asinteger;
         IntReTime:=dataTmp.qryTmp.fieldbyname('ReTime').asinteger;
      end;
      data.qrySaleorderEdit.FieldByName('pickdate').AsDateTime :=data.qrySaleorderEdit.fieldbyname('orderdate').AsDateTime +IntColltime /24;
      data.qrySaleorderEdit.FieldByName('delidate').AsDateTime :=data.qrySaleorderEdit.fieldbyname('orderdate').AsDateTime +IntCelivTime /24;
      data.qrySaleorderEdit.FieldByName('reredate').AsDateTime :=data.qrySaleorderEdit.fieldbyname('orderdate').AsDateTime +IntReTime /24;
   end;}
end;

procedure TfrmSaleOrder.N10Click(Sender: TObject);
begin
   data.qrySaleOrderSku.First;
   while not data.qrySaleOrderSku.Eof do
   begin
      data.qrySaleOrderSku.Delete;
   end;   
end;

procedure TfrmSaleOrder.CreateParams(var Params: TCreateParams);
begin
   if FileExists(getExeDir+'\'+'KinnGrid.ini')  then
      grdSaleOrder.IniFileName:=getExeDir+'\'+'KinnGrid.ini';
   inherited CreateParams(Params);
end;

procedure TfrmSaleOrder.edtCusIdExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSaleOrder.MenuItem3Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from saleordersku(nolock) where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg('没有商品信息不能审核！',mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qrySaleOrder.FieldByName('checkname').AsString<>'' then
   begin
      KmessageDlg('该订单已经审核过了，不能再审核！',mtWarning,[mbOK],0);
      Exit
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update saleorder '
                         +'   set checkname="'+_loginname+'",'
                         +'       checkdate="'+datetostr(now)+'",'
                         +'       orderstate="确定" '
                         +' where jobno="'+data.qrySaleOrder.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmSaleOrder.MenuItem6Click(Sender: TObject);
begin
   if data.qrySaleOrder.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg('该笔还未审核，不能取消审核！',mtWarning,[mbOK],0);
      exit;
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update saleorder '
                         +'   set checkname="",'
                         +'       checkdate=null, '
                         +'       orderstate="取消" '
                         +' where jobno="'+data.qrySaleOrder.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmSaleOrder.btnTotalClick(Sender: TObject);
var
  CarriageTotal,InsureTotal,PieceTotal,QuantityTotal,VolumeTotal,AreaTotal,GrossweightTotal,NetweightTotal: Extended;
  StrSkuName:string;
begin
   if DataState in Setdcs then
   begin
       InsureTotal     :=0;
       CarriageTotal   :=0;
       QuantityTotal   :=0;
       PieceTotal      :=0;
       NetWeightTotal  :=0;
       GrossWeightTotal:=0;
       VolumeTotal     :=0;
       AreaTotal       :=0;
       StrSkuName      :='';
       Bookmark:= data.qrySaleOrderSku.GetBookmark;
       data.qrySaleOrderSku.DisableControls;
       data.qrySaleOrderSku.First;
       while not data.qrySaleOrderSku.Eof do
       begin
          QuantityTotal   :=QuantityTotal+data.qrySaleOrderSku.fieldbyname('quantity').AsFloat;
    //全部合计
          AreaTotal       :=AreaTotal+data.qrySaleOrderSku.fieldbyname('Area').asfloat;
          if Pos(data.qrySaleOrderSku.fieldbyname('skuname').AsString,strSKUName)=0 then
             strSKUName:=strSKUName+data.qrySaleOrderSku.fieldbyname('skuname').AsString+' ';
          data.qrySaleOrderSku.Next;
       end;
       data.qrySaleOrderSku.GotoBookmark(Bookmark);
       data.qrySaleOrderSku.FreeBookmark(Bookmark);
       data.qrySaleOrderSku.EnableControls;
       data.qrySaleorderEdit.Fieldbyname('Quantity').AsFloat:=QuantityTotal;
       data.qrySaleorderEdit.Fieldbyname('Area').asfloat:=AreaTotal;
   end;
   bookMark:=nil;
   blnTotal:=true;
end;

procedure TfrmSaleOrder.grdLorderopinfoEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   allow:=False;
end;

procedure TfrmSaleOrder.grdSkuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   with TdxDBGrid(Sender) do
   begin
      if DataState in Setdcs then
      begin
         if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is (TdxDBGridKinPickColumn))
         or (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is (TdxDBGridDateColumn))
         or (State<>tsEditing) then
         begin
            if (Key = VK_RETURN)and (ssCtrl in Shift) then
            begin
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridButtonColumn) then
               begin
                  ShowEditor;
                  TdxDBGridButtonColumn(Columns[GetFocusedAbsoluteIndex(FocusedColumn)]).OnButtonClick(Sender,GetFocusedAbsoluteIndex(FocusedColumn));
                  Key:=0;
               end else
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridKinPickColumn) then
               begin
                  ShowEditor;
                  TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
                  key:=0;
               end else
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridDateColumn) then
               begin
                  ShowEditor;
//                  TdxDateEdit(InplaceEditor);
                  TdxInplaceDateEdit(InplaceEditor).DroppedDown:=True;
//                  TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
                  key:=0;
               end;
            end;
         end else
         begin
            if (Key = VK_Left) and (ssShift in Shift) then
            begin
               TdxDBGrid(Sender).HideEditor;
               key:=0;
            end;
         end;
         if (Key = VK_DELETE) and (ssCtrl in Shift) then
         begin
            if uppercase(Name)='GRDSKU' then
               mitDelSkuClick(sender);
            key:=0;
         end;
      end;
   end;
end;

procedure TfrmSaleOrder.mitOperationClick(Sender: TObject);
begin
   pgcTransOrder.ActivePage :=tbsEdit;
   WorkOperation(stBrowse,data.qrySaleOrder.FieldByName('Jobno').AsString,
                          data.qrySaleOrder.FieldByName('UserID').AsString); 
end;

procedure TfrmSaleOrder.edtDownQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleOrderSku.FieldByName('downquantity').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleOrder.edtHeightValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleOrderSku.FieldByName('height').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleOrder.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmSaleOrder.btnInputClick(Sender: TObject);
var
   strname:string;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conSkuData.ConnectionString := 'Provider=MICROSOFT.JET.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 4.0 ';
      if conSkuData.Connected then
         conSkuData.open;
      //导入门框商品资料
      try
         strSql:=' Select * '+
                 '   from [sheet1$] ';
         qrySkuData.Close;
         qrySkuData.SQL.Clear;
         qrySkuData.SQL.Add(strSql);
         qrySkuData.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         Exit;
      end;
      Application.ProcessMessages;
      qrySkuData.First;
      //data.qrySaleOrderSku.DisableControls;
      while not qrySkuData.Eof do
      begin
         data.qrySaleOrderSku.Append;
         //qrySaleOrderSku.Fieldbyname('sno').AsString:='';
         data.qrySaleOrderSku.Fieldbyname('xh').AsString       :=qrySkuData.Fields[0].AsString;
         data.qrySaleOrderSku.Fieldbyname('codeno').AsString       :=qrySkuData.Fields[1].AsString;
         //取商品名称对应的商品档案
         openSql(qryTmp,' select skuid,skuname,pieceuom,quantityuom,areauom from sku '+
                        ' where skuname="'+qrySkuData.Fields[2].AsString+'" ');
         data.qrySaleOrderSku.Fieldbyname('skuid').AsString       :=qryTmp.FieldByName('skuid').AsString;
         data.qrySaleOrderSku.Fieldbyname('skuname').AsString       :=qrySkuData.Fields[2].AsString;
         data.qrySaleOrderSku.Fieldbyname('downquantity').AsString       :=qrySkuData.Fields[3].AsString;
         data.qrySaleOrderSku.Fieldbyname('height').AsString       :=qrySkuData.Fields[4].AsString;
         data.qrySaleOrderSku.Fieldbyname('width').AsString       :=qrySkuData.Fields[5].AsString;
         data.qrySaleOrderSku.Fieldbyname('quantity').AsString       :=qrySkuData.Fields[6].AsString;
         data.qrySaleOrderSku.Fieldbyname('quantityuom').AsString       :=qryTmp.FieldByName('quantityuom').AsString;
         data.qrySaleOrderSku.Fieldbyname('gradetype').AsString       :=qrySkuData.Fields[7].AsString;
         data.qrySaleOrderSku.Fieldbyname('area').AsString       :=qrySkuData.Fields[8].AsString;
         data.qrySaleOrderSku.Fieldbyname('areauom').AsString       :=qryTmp.FieldByName('areauom').AsString;
         data.qrySaleOrderSku.Fieldbyname('downbox').AsString       :=qrySkuData.Fields[9].AsString;
         data.qrySaleOrderSku.Fieldbyname('lightwindow').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('boxopentype').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('lockhole').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('glasshole').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('dooropentype').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('remark').AsString       :=qrySkuData.Fields[10].AsString;
         qrySkuData.next;
      end;
      //data.qrySaleOrderSku.EnableControls;

      //导入门扇商品资料
      try
         strSql:=' Select * '+
                 '   from [sheet2$] ';
         qrySkuData.Close;
         qrySkuData.SQL.Clear;
         qrySkuData.SQL.Add(strSql);
         qrySkuData.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         Exit;
      end;
      Application.ProcessMessages;
      qrySkuData.First;
      //data.qrySaleOrderSku.DisableControls;
      while not qrySkuData.Eof do
      begin
         data.qrySaleOrderSku.Append;
         //qrySaleOrderSku.Fieldbyname('sno').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('xh').AsString       :=qrySkuData.Fields[0].AsString;
         data.qrySaleOrderSku.Fieldbyname('codeno').AsString       :=qrySkuData.Fields[1].AsString;
         //取商品名称对应的商品档案
         openSql(qryTmp,' select skuid,skuname,pieceuom,quantityuom,areauom from sku '+
                        ' where skuname="'+qrySkuData.Fields[2].AsString+'" ');
         data.qrySaleOrderSku.Fieldbyname('skuid').AsString       :=qryTmp.FieldByName('skuid').AsString;
         data.qrySaleOrderSku.Fieldbyname('skuname').AsString       :=qrySkuData.Fields[2].AsString;
         //data.qrySaleOrderSku.Fieldbyname('downquantity').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('height').AsString       :=qrySkuData.Fields[3].AsString;
         data.qrySaleOrderSku.Fieldbyname('width').AsString       :=qrySkuData.Fields[4].AsString;
         data.qrySaleOrderSku.Fieldbyname('quantity').AsString       :=qrySkuData.Fields[5].AsString;
         data.qrySaleOrderSku.Fieldbyname('quantityuom').AsString       :=qryTmp.FieldByName('quantityuom').AsString;
         data.qrySaleOrderSku.Fieldbyname('gradetype').AsString       :=qrySkuData.Fields[6].AsString;
         data.qrySaleOrderSku.Fieldbyname('area').AsString       :=qrySkuData.Fields[7].AsString;
         data.qrySaleOrderSku.Fieldbyname('areauom').AsString       :=qryTmp.FieldByName('areauom').AsString;
         data.qrySaleOrderSku.Fieldbyname('downbox').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('lightwindow').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('boxopentype').AsString       :=qrySkuData.Fields[8].AsString;
         data.qrySaleOrderSku.Fieldbyname('lockhole').AsString       :=qrySkuData.Fields[9].AsString;
         data.qrySaleOrderSku.Fieldbyname('glasshole').AsString       :=qrySkuData.Fields[10].AsString;
         data.qrySaleOrderSku.Fieldbyname('dooropentype').AsString       :='';
         data.qrySaleOrderSku.Fieldbyname('remark').AsString       :=qrySkuData.Fields[11].AsString;
         qrySkuData.next;
      end;
      //data.qrySaleOrderSku.EnableControls;

      conSkuData.Close;
      edtPath.Text:='';
   end else
   begin
      Kmessagedlg('您选择的文件不正确,请重新选择', mtInformation,[mbOk],0);
      edtPath.Text:='';
      edtPath.SetFocus;
   end;
end;

procedure TfrmSaleOrder.mitPrdLocationinClick(Sender: TObject);
var
   strJobno:String;
begin
   if not data.qrySaleOrderEdit.Active then data.qrySaleOrderEdit.open;
   if not data.qrySaleOrderSku.Active then data.qrySaleOrderSku.open;

   if data.qrySaleOrderEdit.FieldByName('CheckName').AsString='' then
   begin
      KMessageDlg('该订单未审核，不能下达指令！',mtInformation,[mbOK],0);
      exit;
   end;

   strJobno:=genJobno('PL');

   _ADOConnection.StartTransaction;
   try
      //导出订单主表信息
      ExecSql(dataTmp.qryTmp,' insert into prdlocationin '+chr(13)+chr(10)
                            +'  (jobno,fromjobno,locationinno,operationname,operationdate,orderno, '+chr(13)+chr(10)
                            +'   cusid,cusname,salername,orderdate,deliverydate,projectname,fireprooftype, '+chr(13)+chr(10)
                            +'   paneltype,quantity,quantityuom,piece,pieceuom,area,areauom,boxarea, '+chr(13)+chr(10)
                            +'   boxquantity,boxinquantity,fanarea,fanquantity,faninquantity,ordertype, '+chr(13)+chr(10)
                            +'   boxcomplete,fancomplete,remark,userorgid,userorgname,userid,username, '+chr(13)+chr(10)
                            +'   createname,createdate,modifyname,modifydate,checkname,checkdate) '+chr(13)+chr(10)
                            +'  select '+chr(13)+chr(10)
                            +'   jobno="'+strJobno+'", '+chr(13)+chr(10)
                            +'   fromjobno=jobno,  '+chr(13)+chr(10)
                            +'   locationinno="'+strJobno+'",  '+chr(13)+chr(10)
                            +'   operationname="'+_Username+'",  '+chr(13)+chr(10)
                            +'   operationdate=getdate(),  '+chr(13)+chr(10)
                            +'   orderno,cusid,cusname,salername,orderdate,deliverydate,projectname,fireprooftype, '+chr(13)+chr(10)
                            +'   paneltype,quantity,quantityuom,piece,pieceuom,area,areauom,boxarea, '+chr(13)+chr(10)
                            +'   boxquantity,boxinquantity,fanarea,fanquantity,faninquantity,ordertype, '+chr(13)+chr(10)
                            +'   boxcomplete,fancomplete,remark,userorgid,userorgname,userid,username, '+chr(13)+chr(10)
                            +'   createname="'+_Username+'", '+chr(13)+chr(10)
                            +'   createdate=getdate(), '+chr(13)+chr(10)
                            +'   modifyname,modifydate,checkname=null,checkdate=null '+chr(13)+chr(10)
                            +'   from saleorder (nolock) '+chr(13)+chr(10)
                            +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                            );

      //导出货物明细信息
      ExecSql(dataTmp.qryTmp,' insert into prdlocationinsku '+chr(13)+chr(10)
                            +'  (jobno,sno,fromjobno,fromskusno,xh,codeno,skuid,skuname,width,height,quantity, '+chr(13)+chr(10)
                            +'   inquantity,quantityuom,piece,pieceuom,area,areauom,gradetype,downbox,lightwindow, '+chr(13)+chr(10)
                            +'   downquantity,boxopentype,lockhole,glasshole,dooropentype,remark) '+chr(13)+chr(10)
                            +'  select '+chr(13)+chr(10)
                            +'   jobno="'+strJobno+'", '+chr(13)+chr(10)
                            +'   sno, '+chr(13)+chr(10)
                            +'   fromjobno=jobno, '+chr(13)+chr(10)
                            +'   fromskusno=sno, '+chr(13)+chr(10)
                            +'   xh,codeno,skuid,skuname,width,height,quantity, '+chr(13)+chr(10)
                            +'   inquantity,quantityuom,piece,pieceuom,area,areauom,gradetype,downbox,lightwindow, '+chr(13)+chr(10)
                            +'   downquantity,boxopentype,lockhole,glasshole,dooropentype,remark '+chr(13)+chr(10)
                            +'   from saleordersku (nolock) '+chr(13)+chr(10)
                            +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                            );

      _ADOConnection.Commit;
   except
      try
         if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      except
      end;
      raise;
      Exit;
   end;
   btnRefreshClick(Self);
   Kmessagedlg('生成生产入库成功!', mtInformation,[mbOk],0);
end;

procedure TfrmSaleOrder.mitSaleLocatioinoutClick(Sender: TObject);
var
   strJobno:String;
begin
   if not data.qrySaleOrderEdit.Active then data.qrySaleOrderEdit.open;
   if not data.qrySaleOrderSku.Active then data.qrySaleOrderSku.open;

   if data.qrySaleOrderEdit.FieldByName('CheckName').AsString='' then
   begin
      KMessageDlg('该订单未审核，不能下达指令！',mtInformation,[mbOK],0);
      exit;
   end;

   strJobno:=genJobno('SL');

   _ADOConnection.StartTransaction;
   try
      //导出订单主表信息
      ExecSql(dataTmp.qryTmp,' insert into salelocationout '+chr(13)+chr(10)
                            +'  (jobno,fromjobno,locationoutno,operationname,operationdate,orderno, '+chr(13)+chr(10)
                            +'   cusid,cusname,salername,orderdate,deliverydate,projectname,fireprooftype, '+chr(13)+chr(10)
                            +'   paneltype,quantity,quantityuom,piece,pieceuom,area,areauom,boxarea, '+chr(13)+chr(10)
                            +'   boxquantity,boxoutquantity,fanarea,fanquantity,fanoutquantity,ordertype, '+chr(13)+chr(10)
                            +'   boxcomplete,fancomplete,remark,userorgid,userorgname,userid,username, '+chr(13)+chr(10)
                            +'   createname,createdate,modifyname,modifydate,checkname,checkdate) '+chr(13)+chr(10)
                            +'  select '+chr(13)+chr(10)
                            +'   jobno="'+strJobno+'", '+chr(13)+chr(10)
                            +'   fromjobno=jobno,  '+chr(13)+chr(10)
                            +'   locationoutno="'+strJobno+'",  '+chr(13)+chr(10)
                            +'   operationname="'+_Username+'",  '+chr(13)+chr(10)
                            +'   operationdate=getdate(),  '+chr(13)+chr(10)
                            +'   orderno,cusid,cusname,salername,orderdate,deliverydate,projectname,fireprooftype, '+chr(13)+chr(10)
                            +'   paneltype,quantity,quantityuom,piece,pieceuom,area,areauom,boxarea, '+chr(13)+chr(10)
                            +'   boxquantity,boxoutquantity,fanarea,fanquantity,fanoutquantity,ordertype, '+chr(13)+chr(10)
                            +'   boxcomplete,fancomplete,remark,userorgid,userorgname,userid,username, '+chr(13)+chr(10)
                            +'   createname="'+_Username+'", '+chr(13)+chr(10)
                            +'   createdate=getdate(), '+chr(13)+chr(10)
                            +'   modifyname,modifydate,checkname=null,checkdate=null '+chr(13)+chr(10)
                            +'   from saleorder (nolock) '+chr(13)+chr(10)
                            +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                            );

      //导出货物明细信息
      ExecSql(dataTmp.qryTmp,' insert into salelocationoutsku '+chr(13)+chr(10)
                            +'  (jobno,sno,fromjobno,fromskusno,xh,codeno,skuid,skuname,width,height,quantity, '+chr(13)+chr(10)
                            +'   outquantity,quantityuom,piece,pieceuom,area,areauom,gradetype,downbox,lightwindow, '+chr(13)+chr(10)
                            +'   downquantity,boxopentype,lockhole,glasshole,dooropentype,remark) '+chr(13)+chr(10)
                            +'  select '+chr(13)+chr(10)
                            +'   jobno="'+strJobno+'", '+chr(13)+chr(10)
                            +'   sno, '+chr(13)+chr(10)
                            +'   fromjobno=jobno, '+chr(13)+chr(10)
                            +'   fromskusno=sno, '+chr(13)+chr(10)
                            +'   xh,codeno,skuid,skuname,width,height,quantity, '+chr(13)+chr(10)
                            +'   outquantity,quantityuom,piece,pieceuom,area,areauom,gradetype,downbox,lightwindow, '+chr(13)+chr(10)
                            +'   downquantity,boxopentype,lockhole,glasshole,dooropentype,remark '+chr(13)+chr(10)
                            +'   from saleordersku (nolock) '+chr(13)+chr(10)
                            +'  where jobno="'+data.qrySaleOrder.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                            );

      _ADOConnection.Commit;
   except
      try
         if _ADOConnection.InTransaction then _ADOConnection.RollBack;
      except
      end;
      raise;
      Exit;
   end;
   btnRefreshClick(Self);
   Kmessagedlg('生成销售出库成功!', mtInformation,[mbOk],0);
end;

end.


