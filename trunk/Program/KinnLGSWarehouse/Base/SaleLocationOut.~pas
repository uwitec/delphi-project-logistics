unit SaleLocationOut;

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
  TfrmSaleLocationOut = class(TForm)
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
    pgcSaleLocationOut: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdSaleLocationOut: TdxDBGrid;
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
    boxcomplete: TdxDBGridColumn;
    ppmTransOrderSku: TPopupMenu;
    mitAddSku: TMenuItem;
    mitDelSku: TMenuItem;
    GMSStickyLabel48: TGMSStickyLabel;
    edtOrderNo: TdxDBEdit;
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
    fanquantity: TdxDBGridColumn;
    ppmCheck: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
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
    KSText1: TKSText;
    KSText2: TKSText;
    ppmEdit: TPopupMenu;
    mitOperation: TMenuItem;
    boxoutquantity: TdxDBGridColumn;
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
    edtFanOutQuantity: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtBoxOutQuantity: TdxDBEdit;
    edtLockHole: TdxDBGridColumn;
    edtGlassHole: TdxDBGridColumn;
    edtDoorOpenType: TdxDBGridPickColumn;
    edtLightWindow: TdxDBGridColumn;
    checkname: TdxDBGridColumn;
    edtBoxOpenType: TdxDBGridPickColumn;
    GMSStickyLabel12: TGMSStickyLabel;
    edtBoxComplete: TdxDBEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    edtFanComplete: TdxDBEdit;
    fancomplete: TdxDBGridColumn;
    qryTmp: TKADOQuery;
    GMSStickyLabel14: TGMSStickyLabel;
    edtLocationoutno: TdxDBEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    edtOperationdate: TdxDBDateEdit;
    edtOperationdateTime: TdxDBTimeEdit;
    locationoutno: TdxDBGridColumn;
    operationname: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    edtOperationname: TdxDBButtonEdit;
    edtOutQuantity: TdxDBGridCurrencyColumn;
    btnFanComplete: TKBitBtn;
    ppmFanComplete: TPopupMenu;
    mitBufen: TMenuItem;
    mitQbck: TMenuItem;
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
    procedure grdSaleLocationOutDblClick(Sender: TObject);
    procedure pgcSaleLocationOutChange(Sender: TObject);
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
    procedure grdSaleLocationOutChangeNodeEx(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edtWidthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnRefindClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdSaleLocationOutCustomDrawCell(Sender: TObject;
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
    procedure grdLorderopinfoEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdSkuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitOperationClick(Sender: TObject);
    procedure edtDownQuantityValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtHeightValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtOperationnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtOutQuantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitBufenClick(Sender: TObject);
  private
    { Private declarations }

    ScrollAfterEdit,blnCopy:Boolean;
    Bookmark: TBookmark;         //书签
    FindItem: TFindItem;          //是否需要查找
    strGetCd:String;
    FilterSql: string;
    arrSaleLocationOut0,arrSaleLocationOut,arrSaleLocationOutSku: Variant;
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

procedure WorkSaleLocationOut(CallMode:TDataState;pstrJobno:string);

var
  frmSaleLocationOut:TfrmSaleLocationOut;//发货指令

implementation

{$R *.dfm}
Uses kindlg, Saveget,datas,datasTmp,datasSelect,linprint,libBb,
     find , main ,GetUserRight,GetDllPub, GridSelect,libuserpub,
     Operation,InPutOrder;
procedure WorkSaleLocationOut(CallMode:TDataState;pstrJobno:string);
{入口函数
  CallMode   :进入form状态模式
}
var
   StrDefFilterSql:string;
   year,month,day:word;
   month_start,month_end:TDate;
begin
   if frmSaleLocationOut <> nil then
   with frmSaleLocationOut do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmSaleLocationOut:=TfrmSaleLocationOut.Create(Application);
   with frmSaleLocationOut do
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
        FilterSql:=' (convert(datetime,convert(char(8),SaleLocationOut.operationdate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),SaleLocationOut.operationdate,112)) <="'+datetostr(Month_End)+'")';
      end else filtersql:='  jobno="'+strjobno+'"  ';

      //自行设置默认过滤条件
      StrDefFilterSql:=GetdefFilter('销售出库');
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      data.InitSaleLocationOut(FilterSql);     //初始化各个Query
      grdSaleLocationOutChangeNodeEx(nil);

      if uppercase(_LoginId)<>'SYSTEM' then
         SetButtonEnabled(Toolpanel,'mitSaleLocationOut',trim(_UserOrgid)); //设置按钮权限
      WorkCall(stBrowse);
      Show;
   end;
end;

procedure TfrmSaleLocationOut.WorkCall(CallMode:TDataState);
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
             data.qrySaleLocationOut.Edit;
             data.qrySaleLocationOutEdit.Edit;
             data.qrySaleLocationOutEdit.FieldByName('modifyname').AsString:=_LoginName;
             openSql(dataTmp.qryTmp,' select nowTime=getDate() ');
             data.qrySaleLocationOutEdit.FieldByName('modifydate').AsDatetime:=dataTmp.qryTmp.FieldByName('nowTime').AsDateTime;
             //在修改的状态下，对qryTransOrderSku循环
             data.qrySaleLocationOutSku.DisableControls;
             Bookmark:= data.qrySaleLocationOutSku.GetBookmark;
             maxSno:=0;
             data.qrySaleLocationOutSku.First;
             while not data.qrySaleLocationOutSku.Eof do
             begin
                if data.qrySaleLocationOutSku.FieldByName('sno').AsInteger>maxSno
                then maxSno:=data.qrySaleLocationOutSku.FieldByName('sno').AsInteger;
                data.qrySaleLocationOutSku.Next;
             end;
             data.qrySaleLocationOutSku.GotoBookmark(Bookmark);
             data.qrySaleLocationOutSku.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qrySaleLocationOutSku.EnableControls;

             EnableEdit;
//             LampChange(lsEdit);
          end;
        stInsert:
          begin
             strDel_Task:='';
             data.qrySaleLocationOut.Append;
             if not blnCopy then
                data.qrySaleLocationOutEdit.Append;
             maxSno:=0;
             EnableEdit;
             InitValues;
             data.qrySaleLocationOutEdit.Edit;
             data.qrySaleLocationOutEdit.FieldByName('createname').Asstring:=_LoginName;
             data.qrySaleLocationOutEdit.fieldByname('CreateDate').AsDatetime:=GetServerDate;
             //data.qrySaleLocationOutEdit.FieldByName('checkname').Asstring:='';
             //data.qrySaleLocationOutEdit.fieldByname('Checkdate').AsString:='';
             //data.qrySaleLocationOutEdit.fieldByname('Checkdate').Clear;
             data.qrySaleLocationOutEdit.FieldByName('modifyname').Asstring:='';
             data.qrySaleLocationOutEdit.fieldByname('modifydate').AsString:='';
             data.qrySaleLocationOutEdit.fieldByname('modifydate').Clear;
//             LampChange(lsEdit);
          end;
      end;
   end;
end;

procedure TfrmSaleLocationOut.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
   edtLocationoutno.SetFocus;

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior+[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=False;
   grdSKU.ClearGroupColumns;

   StrHistOrderNo:=data.qrySaleLocationOutEdit.FieldByName('orderno').AsString;
   StrHistAccountName:=data.qrySaleLocationOutEdit.FieldByName('cusname').AsString;
   strHistDetailMessage:='';
   strHistMessage:='';
   blnTotal:=False;
end;

procedure TfrmSaleLocationOut.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   if data.qrySaleLocationOut.FieldByName('Jobno').AsString='' then
      setDisable:=setDisable+[2,4];
   libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior-[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=True;
end;

procedure TfrmSaleLocationOut.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox5);
   SetGroupbox(KGroupBox1);
   SetDxDbGrid(grdSaleLocationOut);
   SetDxDbGrid(grdSKu);
   pgcSaleLocationOut.ActivePage:=tbsBrowse;
   qrySource.Connection:=_ADOConnection;
   qryOther.Connection:=_ADOConnection;
   qryOrdercnfg.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmSaleLocationOut.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
   if DataState = stBrowse then
   begin
      case Key of
        VK_F3:
          if pgcSaleLocationOut.ActivePage=tbsEdit then
          begin
             pgcSaleLocationOut.ActivePage:=tbsBrowse;
          end else
          begin
             pgcSaleLocationOut.ActivePage:=tbsEdit;
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

procedure TfrmSaleLocationOut.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   if DataState in setdcs then
      Action := caNone
   else
      Action := caFree;
end;

procedure TfrmSaleLocationOut.FormDestroy(Sender: TObject);
begin
//   Lampchange(lsMenu);
   Application.onShowhint := nil;
   sltGridname.Free;
   sltGridVisible.Free;
   data.qrySaleLocationOutSku.Close;
   data.qrySaleLocationOutEdit.Close;
   data.qrySaleLocationOut.Close;
   sltUomTypecd.Free;
   sltUomTypeName.Free;
   frmSaleLocationOut:=nil;
   //商品细目form释放
end;

procedure TfrmSaleLocationOut.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmSaleLocationOut.btnAddClick(Sender: TObject);
begin
   if pgcSaleLocationOut.ActivePage<>tbsEdit then pgcSaleLocationOut.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
end;

procedure TfrmSaleLocationOut.InitValues;
{初始化时自动生成仓位代码}
var
   strJobno:string;
begin
   strJobno:=GenJobno('PL');
   //生成工作号
   data.qrySaleLocationOut.FieldByName('Jobno').AsString:=strJobno;
   if blnCopy then
   begin
      blnCopy:=False;

      GatherFromArray(data.qrySaleLocationOutEdit,arrSaleLocationOut,False);
      data.qrySaleLocationOutEdit.FieldByName('jobno').AsString:=data.qrySaleLocationOut.FieldByName('jobno').AsString;
      data.qrySaleLocationOutEdit.FieldByName('orderno').AsString:='';
      data.qrySaleLocationOutEdit.FieldByName('userid').AsString:=_UserId;
      data.qrySaleLocationOutEdit.FieldByName('username').AsString:=_Username;
      data.qrySaleLocationOutEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qrySaleLocationOutEdit.FieldByName('orderstate').AsString:='未确定';
      data.qrySaleLocationOutEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qrySaleLocationOutEdit.FieldByName('fancomplete').AsString:='未生产';

      GatherFromArray(data.qrySaleLocationOutSku,arrSaleLocationOutSku,True);
      //qrySaleLocationOutSku更新关键字
      data.qrySaleLocationOutSku.First;
      while not data.qrySaleLocationOutSku.Eof do
      begin
         data.qrySaleLocationOutSku.Edit;
         data.qrySaleLocationOutSku.FieldByName('jobno').Asstring:=data.qrySaleLocationOutEdit.FieldByName('jobno').AsString;
         if data.qrySaleLocationOutSku.FieldByName('sno').AsInteger>maxSno then
            maxSno:=data.qrySaleLocationOutSku.FieldByName('sno').AsInteger;
         data.qrySaleLocationOutSku.next;
      end;
      data.qrySaleLocationOutSku.First;
   end else
   begin
      data.qrySaleLocationOutEdit.Edit;
      data.qrySaleLocationOutEdit.FieldByName('jobno').AsString:=data.qrySaleLocationOut.FieldByName('jobno').AsString;
      data.qrySaleLocationOutEdit.FieldByName('userid').AsString:=_UserId;
      data.qrySaleLocationOutEdit.FieldByName('username').AsString:=_UserName;
      data.qrySaleLocationOutEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qrySaleLocationOutEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qrySaleLocationOutEdit.FieldByName('fancomplete').AsString:='未生产';
   end;
end;

procedure TfrmSaleLocationOut.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         While True do
         begin
           try
             _ADOConnection.Starttransaction;
             if (DataState=stInsert) and (_isuserhist='T') then
                strHistMessage:='  订单号-'+data.qrySaleLocationOutEdit.FieldByName('orderno').AsString
                               +'  订货单位-'+data.qrySaleLocationOutEdit.FieldByName('cusname').AsString
             else if (DataState=stEdit) and (_isuserhist='T') then
             begin
                if VarToStr(data.qrySaleLocationOutEdit.FieldByName('orderno').OldValue)<>data.qrySaleLocationOutEdit.FieldByName('orderno').AsString then
                  strHistMessage:=strHistMessage
                               +'  订单号-'+VarToStr(data.qrySaleLocationOutEdit.FieldByName('orderno').OldValue)+' →'+data.qrySaleLocationOutEdit.FieldByName('orderno').AsString;

                if VarToStr(data.qrySaleLocationOutEdit.FieldByName('cusname').OldValue)<>data.qrySaleLocationOutEdit.FieldByName('cusname').AsString then
                  strHistMessage:=strHistMessage
                               +'  订货单位-'+VarToStr(data.qrySaleLocationOutEdit.FieldByName('cusname').OldValue)+' →'+data.qrySaleLocationOutEdit.FieldByName('cusname').AsString;
             end;
             data.qrySaleLocationOutEdit.ApplyUpdates;
             data.qrySaleLocationOut.Edit;
             data.qrySaleLocationOut.FieldByName('jobno').AsString  :=data.qrySaleLocationOutEdit.FieldByName('Jobno').AsString;
             data.qrySaleLocationOut.FieldByName('locationoutno').AsString  :=data.qrySaleLocationOutEdit.FieldByName('locationoutno').AsString;
             data.qrySaleLocationOut.FieldByName('operationname').AsString  :=data.qrySaleLocationOutEdit.FieldByName('operationname').AsString;
             data.qrySaleLocationOut.FieldByName('operationdate').AsString  :=data.qrySaleLocationOutEdit.FieldByName('operationdate').AsString;
             data.qrySaleLocationOut.FieldByName('orderno').AsString:=data.qrySaleLocationOutEdit.FieldByName('orderno').AsString;
             data.qrySaleLocationOut.FieldByName('cusid').AsString :=data.qrySaleLocationOutEdit.FieldByName('cusid').AsString;
             data.qrySaleLocationOut.FieldByName('cusname').AsString :=data.qrySaleLocationOutEdit.FieldByName('cusname').AsString;
             data.qrySaleLocationOut.FieldByName('userid').AsString  :=data.qrySaleLocationOutEdit.FieldByName('userid').AsString;
             //
             m_blnPost:=true;
             data.qrySaleLocationOut.ApplyUpdates;
             m_blnPost:=False;
             Break;
           except
              _ADOConnection.Rollback; //先结束事务
              raise;
              exit;
           end;
         end;
         data.qrySaleLocationOutSku.DisableControls;
         data.qrySaleLocationOutSku.First;
         while not data.qrySaleLocationOutSku.eof do
         begin
            data.qrySaleLocationOutSku.Edit;
            data.qrySaleLocationOutSku.fieldbyname('jobno').asstring:=data.qrySaleLocationOutEdit.Fieldbyname('jobno').AsString;
            data.qrySaleLocationOutSku.Post;
            data.qrySaleLocationOutSku.next;
         end;
         data.qrySaleLocationOutSku.First;
         data.qrySaleLocationOutSku.EnableControls;
         data.qrySaleLocationOutSku.applyupdates;

         strHistMessage:=strHistMessage+strHistDetailMessage;
         //删除商品明细
         if strDel_Task<>'' then
         begin
            strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
            strsql:=' delete from SaleLocationOutsku '
                   +'  where jobno="'+data.qrySaleLocationOut.fieldbyname('Jobno').asstring+'"'
                   +'    and '+'('+strDel_Task+') ';
            execsql(datatmp.qryTmp,strsql);
            strDel_Task:='';
         end;
         if (strHistMessage<>'') and (_isuserhist='T') then
           execsql(dataTmp.qryTmp,'insert into UserHist '
                         +' (username,userdate,jobno,  remark,typename,modifytype)'
                         +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                         +data.qrySaleLocationOutEdit.FieldByName('jobno').Asstring+'","'
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
         arrSaleLocationOut0:=ScatterToArray(data.qrySaleLocationOut,true,0);
         arrSaleLocationOut:=ScatterToArray(data.qrySaleLocationOutEdit,true,0);
         m_blnPost:=true;
         data.qrySaleLocationOut.CancelUpdates;
         data.qrySaleLocationOutEdit.CancelUpdates;
         if datastate=stInsert then
         begin
            data.qrySaleLocationOut.Append;
            data.qrySaleLocationOutEdit.Append;
         end else
         begin
            data.qrySaleLocationOut.Locate('jobno',
                              VarArrayOf([data.qrySaleLocationOut.FieldByName('jobno').AsString]),
                              [loCaseInsensitive, loPartialKey]);
            data.qrySaleLocationOut.Edit;
         end;
         data.qrySaleLocationOut.DisableControls;
         GatherFromArray(data.qrySaleLocationOut,arrSaleLocationOut0,false);
         GatherFromArray(data.qrySaleLocationOutEdit,arrSaleLocationOut,false);
         data.qrySaleLocationOut.EnableControls;
         m_blnPost := False;         
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         Exit;
      end;

      data.qrySaleLocationOut.CommitUpdates;
      data.qrySaleLocationOutEdit.CommitUpdates;
      data.qrySaleLocationOutSku.CommitUpdates;

      ScrollAfterEdit:=False;
      IsEdit:=false;
      WorkCall(stBrowse);
   end;
end;

function TfrmSaleLocationOut.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   StrSkuName:String;
begin
   Result:=False;

   if edtOrderNo.Text<>'' then
   begin
      opensql(dataTmp.qryTmp,'select con=count(*) from SaleLocationOut(nolock) where locationoutno="'+Trim(edtLocationoutno.Text)+'"');
      if ((not IsEdit) and (dataTmp.qryTmp.FieldByName('con').AsInteger>0))or(IsEdit and (dataTmp.qryTmp.FieldByName('con').AsInteger>1))  then
      begin                                                                //IsEdit为true即修改的情况下
         edtLocationoutno.setFocus;
         KmessageDlg('出库单号重复,请修改！',mtinformation,[mbOK],0);
         Exit;
      end;
   end;
   if (data.qrySaleLocationOutEdit.FieldByName('operationname').AsString='') then
   begin
      KmessageDlg('出库经办人不能为空！',mtinformation,[mbOK],0);
      edtCusID.SetFocus;
      exit;
   end;
   if edtOperationdate.Date=0 then
   begin
      KmessageDlg('出库日期不能为空！',mtinformation,[mbOK],0);
      edtOperationdate.SetFocus;
      exit;
   end;

   if data.qrySaleLocationOutSku.RecordCount=0 then
   begin
      if KmessageDlg('没有货物信息，您确定要保存吗?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
         exit;
   end;
   //qrySaleLocationOutSku更新配送指令单号,为主库商品信息赋值
   data.qrySaleLocationOutEdit.FieldByName('boxoutquantity').AsFloat:=0;
   data.qrySaleLocationOutEdit.FieldByName('fanoutquantity').AsFloat:=0;

   StrSkuName:='';

   data.qrySaleLocationOutSku.DisableControls;
   data.qrySaleLocationOutSku.First;
   while not data.qrySaleLocationOutSku.Eof do
   begin
      if Pos('门框',data.qrySaleLocationOutSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qrySaleLocationOutEdit.Edit;
         data.qrySaleLocationOutEdit.FieldByName('boxoutquantity').AsFloat:=data.qrySaleLocationOutEdit.FieldByName('boxoutquantity').AsFloat+data.qrySaleLocationOutSku.FieldByName('outquantity').AsFloat;
      end;
      if Pos('门扇',data.qrySaleLocationOutSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qrySaleLocationOutEdit.Edit;
         data.qrySaleLocationOutEdit.FieldByName('fanoutquantity').AsFloat:=data.qrySaleLocationOutEdit.FieldByName('fanoutquantity').AsFloat+data.qrySaleLocationOutSku.FieldByName('outquantity').AsFloat;
      end;
      if Pos(data.qrySaleLocationOutSku.Fieldbyname('skuname').AsString,strSKUName)=0 then
         strSkuname:=strSkuname+data.qrySaleLocationOutSku.fieldbyname('skuname').AsString+' ';
      data.qrySaleLocationOutSku.next;
   end;
   data.qrySaleLocationOutSku.First;
   data.qrySaleLocationOutSku.EnableControls;
   //lbl
   //if data.qrySaleLocationOutEdit.FieldByName('insure').AsFloat=0 then
   //   btnTotalClick(self);

   Result:=True;
end;

procedure TfrmSaleLocationOut.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qrySaleLocationOut.FieldByName('jobno').AsString+'" ');  
   data.qrySaleLocationOutSku.CancelUpdates;
   data.qrySaleLocationOutEdit.CancelUpdates;
   data.qrySaleLocationOut.CancelUpdates;

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

procedure TfrmSaleLocationOut.btnCopyClick(Sender: TObject);
begin
   if pgcSaleLocationOut.ActivePage<>tbsEdit then
      pgcSaleLocationOut.ActivePage:=tbsEdit;
   SetDetailActive(False,True);

   arrSaleLocationOut       :=ScatterToArray(data.qrySaleLocationOutEdit,True,0);
   arrSaleLocationOutSku :=ScatterToArray(data.qrySaleLocationOutSku,false,0);

   ScrollAfterEdit:=True;
   blnCopy:=True;
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmSaleLocationOut.btnEditClick(Sender: TObject);
begin
   if data.qrySaleLocationOut.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能修改！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   dataTmp.qryTmp.Close;
   if pgcSaleLocationOut.ActivePage<>tbsEdit then pgcSaleLocationOut.ActivePage:=tbsEdit;
   IsEdit:=true;
   SetDetailActive(False,True);
   WorkCall(stEdit);
end;

procedure TfrmSaleLocationOut.btnDeleteClick(Sender: TObject);
begin
   if data.qrySaleLocationOut.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能删除！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      if pgcSaleLocationOut.ActivePage<>tbsEdit then pgcSaleLocationOut.ActivePage:=tbsEdit;
      SetDetailActive(false,true);
      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
        //处理日志
        if _isoriinfo='T' then
        begin
           strHistMessage:='  订单号-'+data.qrySaleLocationOutEdit.FieldByName('orderno').AsString
                          +'  订货单位-'+data.qrySaleLocationOutEdit.FieldByName('cusname').AsString;
           if strHistMessage<>'' then
             execsql(dataTmp.qryTmp,'insert into UserHist '
                           +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                           +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                           +data.qrySaleLocationOutEdit.FieldByName('jobno').Asstring+'","'
                           +strHistMessage+'","订单中心","删除")');
        end;
        ExecSql(dataTmp.qryTmp,'delete from SaleLocationOutsku '
                      +' where jobno="'+data.qrySaleLocationOut.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,'delete from SaleLocationOut '
                      +' where jobno="'+data.qrySaleLocationOut.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,' delete genjobno '
                              +'  where jobno="'+data.qrySaleLocationOut.FieldByName('jobno').AsString+'" ');
        data.qrySaleLocationOut.Applyupdates;
        TdxDBGridNode(grdSaleLocationOut.FocusedNode).Delete;
        _ADOConnection.Commit;
      except
        try
          if _ADOConnection.InTransaction then _ADOConnection.RollBack;
        except
        end;
        raise;
        exit;
      end;
      data.qrySaleLocationOut.CommitUpdates;
      SetMasterDetailState(True);

      WorkCall(stBrowse);
   end;
   SetDetailActive(False,False);
   SetDetailActive(True,True);
end;

procedure TfrmSaleLocationOut.btnRefreshClick(Sender: TObject);
var
   strJB:string;
begin
   strJB:=data.qrySaleLocationOut.FieldByName('jobno').AsString;
   if Sender=btnRefresh then
   begin
      data.qrySaleLocationOut.Close;
      data.qrySaleLocationOut.DisableControls;
      data.qrySaleLocationOut.Open;
      try
        data.qrySaleLocationOut.Locate('jobno',strJB,[loCaseInsensitive, loPartialKey]);
      except
        data.qrySaleLocationOut.Last;
      end;
      data.qrySaleLocationOut.EnableControls;
      grdSaleLocationOutChangeNodeEx(nil);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
      WorkCall(stBrowse);
   end else
   begin
      RefreshCurrentData(data.qrySaleLocationOut,'SaleLocationOut.jobno="'+strJB+'" ');
      grdSaleLocationOutChangeNodeEx(nil);
      WorkCall(stBrowse);
   end;
end;

procedure TfrmSaleLocationOut.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcSaleLocationOut.ActivePage <> tbsBrowse then pgcSaleLocationOut.ActivePage := tbsBrowse;
   pgcSaleLocationOutChange(self);
   Para := TfindPara.Create;

   para.tables.add(' SaleLocationOut ');

{0}   para.field.add('SaleLocationOut.orderno');
{1}   para.field.add('SaleLocationOut.cusid');
{2}   para.field.add('SaleLocationOut.locationoutno');
{3}   para.field.add('convert(datetime,convert(char(10),SaleLocationOut.createdate,102))');
{4}   para.field.add('convert(datetime,convert(char(10),SaleLocationOut.operationdate,102))');
{5}   para.field.add('saleorder.boxcomplete');
{6}   para.field.add('saleorder.fancomplete');

   Para.Exp.add('');

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','出库单号','*****'));
{3}   Para.Toptic.add(IIF(_Language='CAPTIONC','创建日期','*****'));
{4}   Para.Toptic.add(IIF(_Language='CAPTIONC','订货日期','*****'));
{5}   Para.Toptic.add(IIF(_Language='CAPTIONC','门板状态','*****'));
{6}   Para.Toptic.add(IIF(_Language='CAPTIONC','门扇状态','*****'));

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('E');
{2}   para.Ftype.add('C');
{3}   para.Ftype.add('D');
{4}   para.Ftype.add('D');
{5}   para.Ftype.add('C');
{6}   para.Ftype.add('C');

   Para.RField.add('SaleLocationOut.jobno');

   Para.OnGetValue:=FindGetValue;

   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     data.qrySaleLocationOut.DisableControls;
     data.qrySaleLocationOut.Close;
     if strTmp<>'' then
       data.qrySaleLocationOut.MacroByName('where').AsString:=strTmp
     else
       data.qrySaleLocationOut.MacroByName('where').AsString:='1=1';
     data.qrySaleLocationOut.Open;
     data.qrySaleLocationOut.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmSaleLocationOut.btnFindClick(Sender: TObject);
var
   para:TFindPara;
begin
   if pgcSaleLocationOut.ActivePage <> tbsBrowse then pgcSaleLocationOut.ActivePage := tbsBrowse;
   pgcSaleLocationOutChange(self);
   Para := TfindPara.Create;

   para.tables.add(' SaleLocationOut ');

{0}   para.field.add('SaleLocationOut.orderno');
{1}   para.field.add('SaleLocationOut.cusname');
{2}   para.field.add('SaleLocationOut.locationoutno');
{3}   para.field.add('convert(datetime,convert(char(10),SaleLocationOut.operationdate,102))');

   Para.Exp.add('');
   Para.Filter:='   and SaleLocationOut.userid like rtrim("'+_userid+'")+"%" '; // UserId组织

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','出库单号','*****'));
{3}   Para.Toptic.add(IIF(_Language='CAPTIONC','订货日期','*****'));

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('E');
{2}   para.Ftype.add('C');
{3}   para.Ftype.add('D');

   Para.RField.add('SaleLocationOut.jobno');
   Para.OnGetValue:=FindGetValue;

   Dofind(data.qrySaleLocationOut, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmSaleLocationOut.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qrySaleLocationOut,dataTmp.qryFind);
end;

function TfrmSaleLocationOut.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmSaleLocationOut.btnBrowMxClick(Sender: TObject);
begin
   pgcSaleLocationOut.ActivePage := tbsEdit;
end;

procedure TfrmSaleLocationOut.btnBrowGlClick(Sender: TObject);
begin
   pgcSaleLocationOut.ActivePage := tbsBrowse;
end;

procedure TfrmSaleLocationOut.grdSaleLocationOutDblClick(Sender: TObject);
begin
   if pgcSaleLocationOut.ActivePage<>tbsEdit then
      pgcSaleLocationOut.ActivePage:=tbsEdit;
end;

procedure TfrmSaleLocationOut.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
   //防止保存后直接修改所造成的从库状态变化
   if not ScrollAfterEdit and blnOpen then
   begin
      if data.qrySaleLocationOutSku.Active then
      begin
         data.qrySaleLocationOutSku.Close;
         data.qrySaleLocationOutSku.Open;
      end;
      ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      data.qrySaleLocationOutEdit.Active       :=blnOpen;
      data.qrySaleLocationOutSku.Active :=blnOpen;
   end else
   begin
      data.qrySaleLocationOutEdit.Active:=blnOpen;
      data.qrySaleLocationOutSku.Active := blnOpen;
   end;
end;

procedure TfrmSaleLocationOut.SetMasterDetailState(blnConnect:Boolean);
  //{将主从表的MasterDetail关系连接或切断}
begin
end;

procedure TfrmSaleLocationOut.pgcSaleLocationOutChange(Sender: TObject);
begin
   if pgcSaleLocationOut.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      SetDetailActive(True,True);
   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
   end;
end;

procedure TfrmSaleLocationOut.pgcInfoChange(Sender: TObject);
begin
   if data.qrySaleLocationOut.Active then SetDetailActive(true,true);
end;

procedure TfrmSaleLocationOut.mitAddSkuClick(Sender: TObject);
begin
   grdSKU.SetFocus;
   data.qrySaleLocationOutSku.Append;
   grdSKUBeforeInsert;
end;

procedure TfrmSaleLocationOut.edtCusIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('C','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qrySaleLocationOutEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qrySaleLocationOutEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSaleLocationOut.edtCusIdExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCusId.Text='' then
      begin
         data.qrySaleLocationOutEdit.Edit;
         data.qrySaleLocationOutEdit.FieldByName('cusid').AsString:='';
         data.qrySaleLocationOutEdit.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('C',edtCusId.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qrySaleLocationOutEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrySaleLocationOutEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
      FreeAndNil(qrySelect);
      end;
   end;
//  TimeSelect;
end;

procedure TfrmSaleLocationOut.edtSkuNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
   blnFirst:boolean;
begin
   if data.qrySaleLocationOutEdit.FieldByName('cusid').AsString='' then
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
         data.qrySaleLocationOutSku.Edit;
         blnFirst:=False;
      end else
         data.qrySaleLocationOutSku.Append;
      data.qrySaleLocationOutSku.Fieldbyname('quantity').AsInteger  :=1;
      data.qrySaleLocationOutSku.Fieldbyname('area').AsFloat  :=qrySelect.FieldByName('areapro').AsFloat*data.qrySaleLocationOutSku.Fieldbyname('quantity').AsFloat;

      data.qrySaleLocationOutSku.FieldByName('SkuId').AsString  :=qrySelect.FieldByName('skuId').AsString;
      data.qrySaleLocationOutSku.FieldByName('SkuName').AsString  :=qrySelect.FieldByName('skuname').AsString;
      data.qrySaleLocationOutSku.FieldByName('QuantityUOM').AsString:=qrySelect.FieldByName('QuantityUOM').AsString;;
      data.qrySaleLocationOutSku.FieldByName('areauom').AsString    :=qrySelect.FieldByName('areauom').AsString;;

      try
         data.qrySaleLocationOutSku.Post;
      except
         break;
      end;
      qrySelect.Next;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmSaleLocationOut.grdSKUBeforeInsert;
begin
   grdSKU.FocusedColumn:=0;
   data.qrySaleLocationOutSku.Fieldbyname('sno').AsFloat  :=-1;

   data.qrySaleLocationOutSku.fieldByname('jobno').AsString:=data.qrySaleLocationOutEdit.fieldbyname('jobno').AsString;
end;

procedure TfrmSaleLocationOut.grdSKUChangeNodeEx(Sender: TObject);
begin
   if grdSKU.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUBeforeInsert;
   end;
end;

procedure TfrmSaleLocationOut.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmSaleLocationOut.grdSKUEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qrySaleLocationOutSku.fieldbyname('sno').AsInteger=0) then
   begin
      mitAddSKUClick(Sender);
   end;
end;

procedure TfrmSaleLocationOut.mitDelSkuClick(Sender: TObject);
begin
   if data.qrySaleLocationOutSku.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       strDel_Task:=strDel_Task+' or SNO='+data.qrySaleLocationOutSku.fieldbyname('SNO').Asstring;
       grdSKU.SetFocus;
       data.qrySaleLocationOutSku.Delete;
    end;
end;

procedure TfrmSaleLocationOut.grdSkuExit(Sender: TObject);
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

procedure TfrmSaleLocationOut.edtQuantityValidate(Sender: TObject;
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
      data.qrySaleLocationOutSku.Edit;
      data.qrySaleLocationOutSku.FieldByName('quantity').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);

      Accept:=True;
   end;
end;

procedure TfrmSaleLocationOut.edtAreaValidate(Sender: TObject;
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
      data.qrySaleLocationOutSku.Edit;
      data.qrySaleLocationOutSku.FieldByName('area').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);
      Accept:=True;
   end;
end;

procedure TfrmSaleLocationOut.grdSaleLocationOutChangeNodeEx(Sender: TObject);
begin
  if (data.qrySaleLocationOutEdit.ParamByName('Jobno').AsString<>data.qrySaleLocationOut.FieldByName('Jobno').AsString)
    or (data.qrySaleLocationOutEdit.ParamByName('Jobno').AsString='') then
  begin
    data.qrySaleLocationOutEdit.ParamByName('Jobno').AsString:=data.qrySaleLocationOut.FieldByName('Jobno').AsString;
    data.qrySaleLocationOutSku.ParamByName('Jobno').AsString:=data.qrySaleLocationOut.FieldByName('Jobno').AsString;
    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcSaleLocationOut.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmSaleLocationOut.edtWidthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleLocationOutSku.FieldByName('width').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleLocationOut.mitFilterActiveClick(Sender: TObject);
begin
   grdSaleLocationOut.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmSaleLocationOut.grdSaleLocationOutCustomDrawCell(Sender: TObject;
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

procedure TfrmSaleLocationOut.edtSalerNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if data.qrySaleLocationOutEdit.fieldbyname('cusid').asstring='' then
      begin
         ActiveControl:=edtCusID;
         KmessageDlg('请先选择订货单位!',mtWarning,[mbOK],0);
         Exit;
      end;
      qrySelect:=pGetOperatorSelect(data.qrySaleLocationOutEdit.fieldbyname('cusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qrySaleLocationOutEdit.Edit;
         data.qrySaleLocationOutEdit.Fieldbyname('salername').asstring:=qrySelect.FieldByName('opname').AsString;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSaleLocationOut.edtOrderDateTimeExitCheck(Sender: TObject;
   OldValue: Variant; var Failed: Boolean);
begin
   TimeSelect;
end;

procedure TfrmSaleLocationOut.edtOrderDateExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if DataState in Setdcs then
   TimeSelect;
end;

procedure TfrmSaleLocationOut.TimeSelect;
begin
{   IntColltime:=0;
   IntCelivTime:=0;
   IntReTime:=0;
   begin
      strsql:='exec ksp_getThreeTime @AccountID ="'+data.qrySaleLocationOutEdit.FieldByName('cusid').AsString+'",'+chr(13)+chr(10)
           +'                       @OrderType ="'+data.qrySaleLocationOutEdit.FieldByName('ordertype').AsString+'",'+chr(13)+chr(10)
           +'                       @StartZoneCD ="'+data.qrySaleLocationOutEdit.FieldByName('CollectionZoneCD').AsString+'",'+chr(13)+chr(10)
           +'                       @EndZoneCD  ="'+data.qrySaleLocationOutEdit.FieldByName('DestinationZoneCD').AsString+'"'+chr(13)+chr(10);

      opensql(dataTmp.qryTmp,strsql);
      if dataTmp.qryTmp.RecordCount=1 then
      begin
         IntColltime:=dataTmp.qryTmp.fieldbyname('CollTime').asinteger;
         IntCelivTime:=dataTmp.qryTmp.fieldbyname('Delive').asinteger;
         IntReTime:=dataTmp.qryTmp.fieldbyname('ReTime').asinteger;
      end;
      data.qrySaleLocationOutEdit.FieldByName('pickdate').AsDateTime :=data.qrySaleLocationOutEdit.fieldbyname('orderdate').AsDateTime +IntColltime /24;
      data.qrySaleLocationOutEdit.FieldByName('delidate').AsDateTime :=data.qrySaleLocationOutEdit.fieldbyname('orderdate').AsDateTime +IntCelivTime /24;
      data.qrySaleLocationOutEdit.FieldByName('reredate').AsDateTime :=data.qrySaleLocationOutEdit.fieldbyname('orderdate').AsDateTime +IntReTime /24;
   end;}
end;

procedure TfrmSaleLocationOut.N10Click(Sender: TObject);
begin
   data.qrySaleLocationOutSku.First;
   while not data.qrySaleLocationOutSku.Eof do
   begin
      data.qrySaleLocationOutSku.Delete;
   end;   
end;

procedure TfrmSaleLocationOut.CreateParams(var Params: TCreateParams);
begin
   if FileExists(getExeDir+'\'+'KinnGrid.ini')  then
      grdSaleLocationOut.IniFileName:=getExeDir+'\'+'KinnGrid.ini';
   inherited CreateParams(Params);
end;

procedure TfrmSaleLocationOut.edtCusIdExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmSaleLocationOut.MenuItem3Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from SaleLocationOutsku(nolock) where jobno="'+data.qrySaleLocationOut.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg('没有商品信息不能审核！',mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qrySaleLocationOut.FieldByName('checkname').AsString<>'' then
   begin
      KmessageDlg('该订单已经审核过了，不能再审核！',mtWarning,[mbOK],0);
      Exit
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update SaleLocationOut '
                         +'   set checkname="'+_loginname+'",'
                         +'       checkdate="'+datetostr(now)+'" '
                         +' where jobno="'+data.qrySaleLocationOut.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmSaleLocationOut.MenuItem6Click(Sender: TObject);
begin
   if data.qrySaleLocationOut.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg('该笔还未审核，不能取消审核！',mtWarning,[mbOK],0);
      exit;
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update SaleLocationOut '
                         +'   set checkname="",'
                         +'       checkdate=null '
                         +' where jobno="'+data.qrySaleLocationOut.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmSaleLocationOut.grdLorderopinfoEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   allow:=False;
end;

procedure TfrmSaleLocationOut.grdSkuKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSaleLocationOut.mitOperationClick(Sender: TObject);
begin
   pgcSaleLocationOut.ActivePage :=tbsEdit;
   WorkOperation(stBrowse,data.qrySaleLocationOut.FieldByName('Jobno').AsString,
                          data.qrySaleLocationOut.FieldByName('UserID').AsString); 
end;

procedure TfrmSaleLocationOut.edtDownQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleLocationOutSku.FieldByName('downquantity').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleLocationOut.edtHeightValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qrySaleLocationOutSku.FieldByName('height').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmSaleLocationOut.edtOperationnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qrySaleLocationOutEdit.Edit;
         data.qrySaleLocationOutEdit.Fieldbyname('Operationname').asstring:=qrySelect.FieldByName('opname').AsString;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmSaleLocationOut.edtOutQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSku.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
      //出库数量必须小于订单数量
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)>data.qrySaleLocationOutSku.FieldByName('quantity').AsFloat then
      begin
         ErrorText:='出库数量不能大于订单数量!';
         Accept:=False;
         exit;
      end;
      data.qrySaleLocationOutSku.Edit;
      data.qrySaleLocationOutSku.FieldByName('outquantity').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);

      Accept:=True;
   end;
end;

procedure TfrmSaleLocationOut.mitBufenClick(Sender: TObject);
var
   strOrderState:string;
begin
   if not data.qrySaleLocationOut.active then data.qrySaleLocationOut.Open;
   if TMenuItem(Sender)=mitBufen then
      strOrderState:='部分出库';
   if TMenuItem(Sender)=mitQbck then
      strOrderState:='全部出库';

   try
      //更新门扇状态
      execsql(dataTmp.qryTmp,' update saleorder '+
                             '    set '+
                             '    orderstate="'+strOrderState+'" '+
                             ' where jobno="'+data.qrySaleLocationOut.FieldByName('fromjobno').AsString+'" ');

      btnRefreshClick(Self);
      Kmessagedlg('出库状态更新成功!', mtInformation,[mbOk],0);
   except
   end;

end;

end.


