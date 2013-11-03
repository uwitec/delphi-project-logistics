unit PrdLocationIn;

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
  TfrmPrdLocationIn = class(TForm)
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
    pgcPrdLocationIn: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdPrdLocationIn: TdxDBGrid;
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
    boxinquantity: TdxDBGridColumn;
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
    edtFanInQuantity: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtBoxInQuantity: TdxDBEdit;
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
    edtLocationinno: TdxDBEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    edtOperationdate: TdxDBDateEdit;
    edtOperationdateTime: TdxDBTimeEdit;
    locationinno: TdxDBGridColumn;
    operationname: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    edtOperationname: TdxDBButtonEdit;
    edtInQuantity: TdxDBGridCurrencyColumn;
    ppmBoxComplete: TPopupMenu;
    mitQuLiao: TMenuItem;
    mitKaiQuan: TMenuItem;
    mitRuku: TMenuItem;
    btnFanComplete: TKBitBtn;
    ppmFanComplete: TPopupMenu;
    mitGuJia: TMenuItem;
    mitMenxin: TMenuItem;
    mitMianban: TMenuItem;
    mitJumu: TMenuItem;
    mitPeihui: TMenuItem;
    mitFanRuku: TMenuItem;
    btnBoxComplete: TKBitBtn;
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
    procedure grdPrdLocationInDblClick(Sender: TObject);
    procedure pgcPrdLocationInChange(Sender: TObject);
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
    procedure grdPrdLocationInChangeNodeEx(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edtWidthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnRefindClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdPrdLocationInCustomDrawCell(Sender: TObject;
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
    procedure edtInQuantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitQuLiaoClick(Sender: TObject);
    procedure mitGuJiaClick(Sender: TObject);
  private
    { Private declarations }

    ScrollAfterEdit,blnCopy:Boolean;
    Bookmark: TBookmark;         //书签
    FindItem: TFindItem;          //是否需要查找
    strGetCd:String;
    FilterSql: string;
    arrPrdLocationIn0,arrPrdLocationIn,arrPrdLocationInSku: Variant;
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

procedure WorkPrdLocationIn(CallMode:TDataState;pstrJobno:string);

var
  frmPrdLocationIn:TfrmPrdLocationIn;//发货指令

implementation

{$R *.dfm}
Uses kindlg, Saveget,datas,datasTmp,datasSelect,linprint,libBb,
     find , main ,GetUserRight,GetDllPub, GridSelect,libuserpub,
     Operation,InPutOrder;
procedure WorkPrdLocationIn(CallMode:TDataState;pstrJobno:string);
{入口函数
  CallMode   :进入form状态模式
}
var
   StrDefFilterSql:string;
   year,month,day:word;
   month_start,month_end:TDate;
begin
   if frmPrdLocationIn <> nil then
   with frmPrdLocationIn do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmPrdLocationIn:=TfrmPrdLocationIn.Create(Application);
   with frmPrdLocationIn do
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
        FilterSql:=' (convert(datetime,convert(char(8),prdlocationin.operationdate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),prdlocationin.operationdate,112)) <="'+datetostr(Month_End)+'")';
      end else filtersql:='  jobno="'+strjobno+'"  ';

      //自行设置默认过滤条件
      StrDefFilterSql:=GetdefFilter('生产入库');
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      data.InitPrdLocationIn(FilterSql);     //初始化各个Query
      grdPrdLocationInChangeNodeEx(nil);

      if uppercase(_LoginId)<>'SYSTEM' then
         SetButtonEnabled(Toolpanel,'mitPrdLocationin',trim(_UserOrgid)); //设置按钮权限
      WorkCall(stBrowse);
      Show;
   end;
end;

procedure TfrmPrdLocationIn.WorkCall(CallMode:TDataState);
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
             data.qryPrdLocationIn.Edit;
             data.qryPrdLocationInEdit.Edit;
             data.qryPrdLocationInEdit.FieldByName('modifyname').AsString:=_LoginName;
             openSql(dataTmp.qryTmp,' select nowTime=getDate() ');
             data.qryPrdLocationInEdit.FieldByName('modifydate').AsDatetime:=dataTmp.qryTmp.FieldByName('nowTime').AsDateTime;
             //在修改的状态下，对qryTransOrderSku循环
             data.qryPrdLocationInSku.DisableControls;
             Bookmark:= data.qryPrdLocationInSku.GetBookmark;
             maxSno:=0;
             data.qryPrdLocationInSku.First;
             while not data.qryPrdLocationInSku.Eof do
             begin
                if data.qryPrdLocationInSku.FieldByName('sno').AsInteger>maxSno
                then maxSno:=data.qryPrdLocationInSku.FieldByName('sno').AsInteger;
                data.qryPrdLocationInSku.Next;
             end;
             data.qryPrdLocationInSku.GotoBookmark(Bookmark);
             data.qryPrdLocationInSku.FreeBookmark(Bookmark);
             bookMark:=nil;
             data.qryPrdLocationInSku.EnableControls;

             EnableEdit;
//             LampChange(lsEdit);
          end;
        stInsert:
          begin
             strDel_Task:='';
             data.qryPrdLocationIn.Append;
             if not blnCopy then
                data.qryPrdLocationInEdit.Append;
             maxSno:=0;
             EnableEdit;
             InitValues;
             data.qryPrdLocationInEdit.Edit;
             data.qryPrdLocationInEdit.FieldByName('createname').Asstring:=_LoginName;
             data.qryPrdLocationInEdit.fieldByname('CreateDate').AsDatetime:=GetServerDate;
             //data.qryPrdLocationInEdit.FieldByName('checkname').Asstring:='';
             //data.qryPrdLocationInEdit.fieldByname('Checkdate').AsString:='';
             //data.qryPrdLocationInEdit.fieldByname('Checkdate').Clear;
             data.qryPrdLocationInEdit.FieldByName('modifyname').Asstring:='';
             data.qryPrdLocationInEdit.fieldByname('modifydate').AsString:='';
             data.qryPrdLocationInEdit.fieldByname('modifydate').Clear;
//             LampChange(lsEdit);
          end;
      end;
   end;
end;

procedure TfrmPrdLocationIn.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
   edtLocationinno.SetFocus;

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior+[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=False;
   grdSKU.ClearGroupColumns;

   StrHistOrderNo:=data.qryPrdLocationInEdit.FieldByName('orderno').AsString;
   StrHistAccountName:=data.qryPrdLocationInEdit.FieldByName('cusname').AsString;
   strHistDetailMessage:='';
   strHistMessage:='';
   blnTotal:=False;
end;

procedure TfrmPrdLocationIn.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   if data.qryPrdLocationIn.FieldByName('Jobno').AsString='' then
      setDisable:=setDisable+[2,4];
   libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

   grdSKU.OptionsBehavior:=grdSKU.OptionsBehavior-[edgoEditing];
   grdSKU.OptionsDB:=grdSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKU.ShowGroupPanel:=True;
end;

procedure TfrmPrdLocationIn.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox5);
   SetGroupbox(KGroupBox1);
   SetDxDbGrid(grdPrdLocationIn);
   SetDxDbGrid(grdSKu);
   pgcPrdLocationIn.ActivePage:=tbsBrowse;
   qrySource.Connection:=_ADOConnection;
   qryOther.Connection:=_ADOConnection;
   qryOrdercnfg.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmPrdLocationIn.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
   if DataState = stBrowse then
   begin
      case Key of
        VK_F3:
          if pgcPrdLocationIn.ActivePage=tbsEdit then
          begin
             pgcPrdLocationIn.ActivePage:=tbsBrowse;
          end else
          begin
             pgcPrdLocationIn.ActivePage:=tbsEdit;
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

procedure TfrmPrdLocationIn.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   if DataState in setdcs then
      Action := caNone
   else
      Action := caFree;
end;

procedure TfrmPrdLocationIn.FormDestroy(Sender: TObject);
begin
//   Lampchange(lsMenu);
   Application.onShowhint := nil;
   sltGridname.Free;
   sltGridVisible.Free;
   data.qryPrdLocationInSku.Close;
   data.qryPrdLocationInEdit.Close;
   data.qryPrdLocationIn.Close;
   sltUomTypecd.Free;
   sltUomTypeName.Free;
   frmPrdLocationIn:=nil;
   //商品细目form释放
end;

procedure TfrmPrdLocationIn.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmPrdLocationIn.btnAddClick(Sender: TObject);
begin
   if pgcPrdLocationIn.ActivePage<>tbsEdit then pgcPrdLocationIn.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
end;

procedure TfrmPrdLocationIn.InitValues;
{初始化时自动生成仓位代码}
var
   strJobno:string;
begin
   strJobno:=GenJobno('PL');
   //生成工作号
   data.qryPrdLocationIn.FieldByName('Jobno').AsString:=strJobno;
   if blnCopy then
   begin
      blnCopy:=False;

      GatherFromArray(data.qryPrdLocationInEdit,arrPrdLocationIn,False);
      data.qryPrdLocationInEdit.FieldByName('jobno').AsString:=data.qryPrdLocationIn.FieldByName('jobno').AsString;
      data.qryPrdLocationInEdit.FieldByName('orderno').AsString:='';
      data.qryPrdLocationInEdit.FieldByName('userid').AsString:=_UserId;
      data.qryPrdLocationInEdit.FieldByName('username').AsString:=_Username;
      data.qryPrdLocationInEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qryPrdLocationInEdit.FieldByName('orderstate').AsString:='未确定';
      data.qryPrdLocationInEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qryPrdLocationInEdit.FieldByName('fancomplete').AsString:='未生产';

      GatherFromArray(data.qryPrdLocationInSku,arrPrdLocationInSku,True);
      //qryPrdLocationInSku更新关键字
      data.qryPrdLocationInSku.First;
      while not data.qryPrdLocationInSku.Eof do
      begin
         data.qryPrdLocationInSku.Edit;
         data.qryPrdLocationInSku.FieldByName('jobno').Asstring:=data.qryPrdLocationInEdit.FieldByName('jobno').AsString;
         if data.qryPrdLocationInSku.FieldByName('sno').AsInteger>maxSno then
            maxSno:=data.qryPrdLocationInSku.FieldByName('sno').AsInteger;
         data.qryPrdLocationInSku.next;
      end;
      data.qryPrdLocationInSku.First;
   end else
   begin
      data.qryPrdLocationInEdit.Edit;
      data.qryPrdLocationInEdit.FieldByName('jobno').AsString:=data.qryPrdLocationIn.FieldByName('jobno').AsString;
      data.qryPrdLocationInEdit.FieldByName('userid').AsString:=_UserId;
      data.qryPrdLocationInEdit.FieldByName('username').AsString:=_UserName;
      data.qryPrdLocationInEdit.FieldByName('orderdate').AsDateTime:=GetServerDate;
      data.qryPrdLocationInEdit.FieldByName('boxcomplete').AsString:='未生产';
      data.qryPrdLocationInEdit.FieldByName('fancomplete').AsString:='未生产';
   end;
end;

procedure TfrmPrdLocationIn.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         While True do
         begin
           try
             _ADOConnection.Starttransaction;
             if (DataState=stInsert) and (_isuserhist='T') then
                strHistMessage:='  订单号-'+data.qryPrdLocationInEdit.FieldByName('orderno').AsString
                               +'  订货单位-'+data.qryPrdLocationInEdit.FieldByName('cusname').AsString
             else if (DataState=stEdit) and (_isuserhist='T') then
             begin
                if VarToStr(data.qryPrdLocationInEdit.FieldByName('orderno').OldValue)<>data.qryPrdLocationInEdit.FieldByName('orderno').AsString then
                  strHistMessage:=strHistMessage
                               +'  订单号-'+VarToStr(data.qryPrdLocationInEdit.FieldByName('orderno').OldValue)+' →'+data.qryPrdLocationInEdit.FieldByName('orderno').AsString;

                if VarToStr(data.qryPrdLocationInEdit.FieldByName('cusname').OldValue)<>data.qryPrdLocationInEdit.FieldByName('cusname').AsString then
                  strHistMessage:=strHistMessage
                               +'  订货单位-'+VarToStr(data.qryPrdLocationInEdit.FieldByName('cusname').OldValue)+' →'+data.qryPrdLocationInEdit.FieldByName('cusname').AsString;
             end;
             data.qryPrdLocationInEdit.ApplyUpdates;
             data.qryPrdLocationIn.Edit;
             data.qryPrdLocationIn.FieldByName('jobno').AsString  :=data.qryPrdLocationInEdit.FieldByName('Jobno').AsString;
             data.qryPrdLocationIn.FieldByName('locationinno').AsString  :=data.qryPrdLocationInEdit.FieldByName('locationinno').AsString;
             data.qryPrdLocationIn.FieldByName('operationname').AsString  :=data.qryPrdLocationInEdit.FieldByName('operationname').AsString;
             data.qryPrdLocationIn.FieldByName('operationdate').AsString  :=data.qryPrdLocationInEdit.FieldByName('operationdate').AsString;
             data.qryPrdLocationIn.FieldByName('orderno').AsString:=data.qryPrdLocationInEdit.FieldByName('orderno').AsString;
             data.qryPrdLocationIn.FieldByName('cusid').AsString :=data.qryPrdLocationInEdit.FieldByName('cusid').AsString;
             data.qryPrdLocationIn.FieldByName('cusname').AsString :=data.qryPrdLocationInEdit.FieldByName('cusname').AsString;
             data.qryPrdLocationIn.FieldByName('userid').AsString  :=data.qryPrdLocationInEdit.FieldByName('userid').AsString;
             //
             m_blnPost:=true;
             data.qryPrdLocationIn.ApplyUpdates;
             m_blnPost:=False;
             Break;
           except
              _ADOConnection.Rollback; //先结束事务
              raise;
              exit;
           end;
         end;
         data.qryPrdLocationInSku.DisableControls;
         data.qryPrdLocationInSku.First;
         while not data.qryPrdLocationInSku.eof do
         begin
            data.qryPrdLocationInSku.Edit;
            data.qryPrdLocationInSku.fieldbyname('jobno').asstring:=data.qryPrdLocationInEdit.Fieldbyname('jobno').AsString;
            data.qryPrdLocationInSku.Post;
            data.qryPrdLocationInSku.next;
         end;
         data.qryPrdLocationInSku.First;
         data.qryPrdLocationInSku.EnableControls;
         data.qryPrdLocationInSku.applyupdates;

         strHistMessage:=strHistMessage+strHistDetailMessage;
         //删除商品明细
         if strDel_Task<>'' then
         begin
            strDel_Task:=copy(strDel_Task,4,length(strDel_Task)- 3);
            strsql:=' delete from PrdLocationInsku '
                   +'  where jobno="'+data.qryPrdLocationIn.fieldbyname('Jobno').asstring+'"'
                   +'    and '+'('+strDel_Task+') ';
            execsql(datatmp.qryTmp,strsql);
            strDel_Task:='';
         end;
         if (strHistMessage<>'') and (_isuserhist='T') then
           execsql(dataTmp.qryTmp,'insert into UserHist '
                         +' (username,userdate,jobno,  remark,typename,modifytype)'
                         +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                         +data.qryPrdLocationInEdit.FieldByName('jobno').Asstring+'","'
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
         arrPrdLocationIn0:=ScatterToArray(data.qryPrdLocationIn,true,0);
         arrPrdLocationIn:=ScatterToArray(data.qryPrdLocationInEdit,true,0);
         m_blnPost:=true;
         data.qryPrdLocationIn.CancelUpdates;
         data.qryPrdLocationInEdit.CancelUpdates;
         if datastate=stInsert then
         begin
            data.qryPrdLocationIn.Append;
            data.qryPrdLocationInEdit.Append;
         end else
         begin
            data.qryPrdLocationIn.Locate('jobno',
                              VarArrayOf([data.qryPrdLocationIn.FieldByName('jobno').AsString]),
                              [loCaseInsensitive, loPartialKey]);
            data.qryPrdLocationIn.Edit;
         end;
         data.qryPrdLocationIn.DisableControls;
         GatherFromArray(data.qryPrdLocationIn,arrPrdLocationIn0,false);
         GatherFromArray(data.qryPrdLocationInEdit,arrPrdLocationIn,false);
         data.qryPrdLocationIn.EnableControls;
         m_blnPost := False;         
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         Exit;
      end;

      data.qryPrdLocationIn.CommitUpdates;
      data.qryPrdLocationInEdit.CommitUpdates;
      data.qryPrdLocationInSku.CommitUpdates;

      ScrollAfterEdit:=False;
      IsEdit:=false;
      WorkCall(stBrowse);
   end;
end;

function TfrmPrdLocationIn.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   StrSkuName:String;
begin
   Result:=False;

   if edtOrderNo.Text<>'' then
   begin
      opensql(dataTmp.qryTmp,'select con=count(*) from PrdLocationIn(nolock) where locationinno="'+Trim(edtLocationinno.Text)+'"');
      if ((not IsEdit) and (dataTmp.qryTmp.FieldByName('con').AsInteger>0))or(IsEdit and (dataTmp.qryTmp.FieldByName('con').AsInteger>1))  then
      begin                                                                //IsEdit为true即修改的情况下
         edtLocationinno.setFocus;
         KmessageDlg('入库单号重复,请修改！',mtinformation,[mbOK],0);
         Exit;
      end;
   end;
   if (data.qryPrdLocationInEdit.FieldByName('operationname').AsString='') then
   begin
      KmessageDlg('入库经办人不能为空！',mtinformation,[mbOK],0);
      edtCusID.SetFocus;
      exit;
   end;
   if edtOperationdate.Date=0 then
   begin
      KmessageDlg('入库日期不能为空！',mtinformation,[mbOK],0);
      edtOperationdate.SetFocus;
      exit;
   end;

   if data.qryPrdLocationInSku.RecordCount=0 then
   begin
      if KmessageDlg('没有货物信息，您确定要保存吗?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
         exit;
   end;
   //qryPrdLocationInSku更新配送指令单号,为主库商品信息赋值
   data.qryPrdLocationInEdit.FieldByName('boxinquantity').AsFloat:=0;
   data.qryPrdLocationInEdit.FieldByName('faninquantity').AsFloat:=0;

   StrSkuName:='';

   data.qryPrdLocationInSku.DisableControls;
   data.qryPrdLocationInSku.First;
   while not data.qryPrdLocationInSku.Eof do
   begin
      if Pos('门框',data.qryPrdLocationInSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qryPrdLocationInEdit.Edit;
         data.qryPrdLocationInEdit.FieldByName('boxinquantity').AsFloat:=data.qryPrdLocationInEdit.FieldByName('boxinquantity').AsFloat+data.qryPrdLocationInSku.FieldByName('inquantity').AsFloat;
      end;
      if Pos('门扇',data.qryPrdLocationInSku.fieldbyname('skuname').AsString)<>0 then
      begin
         data.qryPrdLocationInEdit.Edit;
         data.qryPrdLocationInEdit.FieldByName('faninquantity').AsFloat:=data.qryPrdLocationInEdit.FieldByName('faninquantity').AsFloat+data.qryPrdLocationInSku.FieldByName('inquantity').AsFloat;
      end;
      if Pos(data.qryPrdLocationInSku.Fieldbyname('skuname').AsString,strSKUName)=0 then
         strSkuname:=strSkuname+data.qryPrdLocationInSku.fieldbyname('skuname').AsString+' ';
      data.qryPrdLocationInSku.next;
   end;
   data.qryPrdLocationInSku.First;
   data.qryPrdLocationInSku.EnableControls;
   //lbl
   //if data.qryPrdLocationInEdit.FieldByName('insure').AsFloat=0 then
   //   btnTotalClick(self);

   Result:=True;
end;

procedure TfrmPrdLocationIn.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qryPrdLocationIn.FieldByName('jobno').AsString+'" ');  
   data.qryPrdLocationInSku.CancelUpdates;
   data.qryPrdLocationInEdit.CancelUpdates;
   data.qryPrdLocationIn.CancelUpdates;

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

procedure TfrmPrdLocationIn.btnCopyClick(Sender: TObject);
begin
   if pgcPrdLocationIn.ActivePage<>tbsEdit then
      pgcPrdLocationIn.ActivePage:=tbsEdit;
   SetDetailActive(False,True);

   arrPrdLocationIn       :=ScatterToArray(data.qryPrdLocationInEdit,True,0);
   arrPrdLocationInSku :=ScatterToArray(data.qryPrdLocationInSku,false,0);

   ScrollAfterEdit:=True;
   blnCopy:=True;
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmPrdLocationIn.btnEditClick(Sender: TObject);
begin
   if data.qryPrdLocationIn.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能修改！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   dataTmp.qryTmp.Close;
   if pgcPrdLocationIn.ActivePage<>tbsEdit then pgcPrdLocationIn.ActivePage:=tbsEdit;
   IsEdit:=true;
   SetDetailActive(False,True);
   WorkCall(stEdit);
end;

procedure TfrmPrdLocationIn.btnDeleteClick(Sender: TObject);
begin
   if data.qryPrdLocationIn.FieldByName('checkname').AsString<>'' then
   begin
      Kmessagedlg('该资料已审核，不能删除！请先取消审核！', mtInformation,[mbOk],0);
      exit;
   end;
   if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      if pgcPrdLocationIn.ActivePage<>tbsEdit then pgcPrdLocationIn.ActivePage:=tbsEdit;
      SetDetailActive(false,true);
      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
        //处理日志
        if _isoriinfo='T' then
        begin
           strHistMessage:='  订单号-'+data.qryPrdLocationInEdit.FieldByName('orderno').AsString
                          +'  订货单位-'+data.qryPrdLocationInEdit.FieldByName('cusname').AsString;
           if strHistMessage<>'' then
             execsql(dataTmp.qryTmp,'insert into UserHist '
                           +' (UserName,UserDATE,JOBNO,Remark,TypeName,modifytype)'
                           +' values ("'+_LoginName+'","'+DateTimeToStr(GetServerDate)+'","'
                           +data.qryPrdLocationInEdit.FieldByName('jobno').Asstring+'","'
                           +strHistMessage+'","订单中心","删除")');
        end;
        ExecSql(dataTmp.qryTmp,'delete from prdlocationinsku '
                      +' where jobno="'+data.qryPrdLocationIn.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,'delete from PrdLocationIn '
                      +' where jobno="'+data.qryPrdLocationIn.FieldByName('jobno').AsString+'" ');
        ExecSql(dataTmp.qryTmp,' delete genjobno '
                              +'  where jobno="'+data.qryPrdLocationIn.FieldByName('jobno').AsString+'" ');
        data.qryPrdLocationIn.Applyupdates;
        TdxDBGridNode(grdPrdLocationIn.FocusedNode).Delete;
        _ADOConnection.Commit;
      except
        try
          if _ADOConnection.InTransaction then _ADOConnection.RollBack;
        except
        end;
        raise;
        exit;
      end;
      data.qryPrdLocationIn.CommitUpdates;
      SetMasterDetailState(True);

      WorkCall(stBrowse);
   end;
   SetDetailActive(False,False);
   SetDetailActive(True,True);
end;

procedure TfrmPrdLocationIn.btnRefreshClick(Sender: TObject);
var
   strJB:string;
begin
   strJB:=data.qryPrdLocationIn.FieldByName('jobno').AsString;
   if Sender=btnRefresh then
   begin
      data.qryPrdLocationIn.Close;
      data.qryPrdLocationIn.DisableControls;
      data.qryPrdLocationIn.Open;
      try
        data.qryPrdLocationIn.Locate('jobno',strJB,[loCaseInsensitive, loPartialKey]);
      except
        data.qryPrdLocationIn.Last;
      end;
      data.qryPrdLocationIn.EnableControls;
      grdPrdLocationInChangeNodeEx(nil);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
      WorkCall(stBrowse);
   end else
   begin
      RefreshCurrentData(data.qryPrdLocationIn,'prdlocationin.jobno="'+strJB+'" ');
      grdPrdLocationInChangeNodeEx(nil);
      WorkCall(stBrowse);
   end;
end;

procedure TfrmPrdLocationIn.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcPrdLocationIn.ActivePage <> tbsBrowse then pgcPrdLocationIn.ActivePage := tbsBrowse;
   pgcPrdLocationInChange(self);
   Para := TfindPara.Create;

   para.tables.add(' PrdLocationIn ');

{0}   para.field.add('PrdLocationIn.orderno');
{1}   para.field.add('PrdLocationIn.cusid');
{2}   para.field.add('PrdLocationIn.locationinno');
{3}   para.field.add('convert(datetime,convert(char(10),PrdLocationIn.createdate,102))');
{4}   para.field.add('convert(datetime,convert(char(10),PrdLocationIn.operationdate,102))');
{5}   para.field.add('saleorder.boxcomplete');
{6}   para.field.add('saleorder.fancomplete');

   Para.Exp.add('');

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','入库单号','*****'));
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

   Para.RField.add('prdlocationin.jobno');

   Para.OnGetValue:=FindGetValue;

   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     data.qryPrdLocationIn.DisableControls;
     data.qryPrdLocationIn.Close;
     if strTmp<>'' then
       data.qryPrdLocationIn.MacroByName('where').AsString:=strTmp
     else
       data.qryPrdLocationIn.MacroByName('where').AsString:='1=1';
     data.qryPrdLocationIn.Open;
     data.qryPrdLocationIn.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmPrdLocationIn.btnFindClick(Sender: TObject);
var
   para:TFindPara;
begin
   if pgcPrdLocationIn.ActivePage <> tbsBrowse then pgcPrdLocationIn.ActivePage := tbsBrowse;
   pgcPrdLocationInChange(self);
   Para := TfindPara.Create;

   para.tables.add(' PrdLocationIn ');

{0}   para.field.add('PrdLocationIn.orderno');
{1}   para.field.add('PrdLocationIn.cusname');
{2}   para.field.add('PrdLocationIn.locationinno');
{3}   para.field.add('convert(datetime,convert(char(10),PrdLocationIn.operationdate,102))');

   Para.Exp.add('');
   Para.Filter:='   and PrdLocationIn.userid like rtrim("'+_userid+'")+"%" '; // UserId组织

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订单号','*****'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','订货单位','*****'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','入库单号','*****'));
{3}   Para.Toptic.add(IIF(_Language='CAPTIONC','订货日期','*****'));

{0}   para.Ftype.add('C');
{1}   Para.Ftype.add('E');
{2}   para.Ftype.add('C');
{3}   para.Ftype.add('D');

   Para.RField.add('prdlocationin.jobno');
   Para.OnGetValue:=FindGetValue;

   Dofind(data.qryPrdLocationIn, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmPrdLocationIn.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryPrdLocationIn,dataTmp.qryFind);
end;

function TfrmPrdLocationIn.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmPrdLocationIn.btnBrowMxClick(Sender: TObject);
begin
   pgcPrdLocationIn.ActivePage := tbsEdit;
end;

procedure TfrmPrdLocationIn.btnBrowGlClick(Sender: TObject);
begin
   pgcPrdLocationIn.ActivePage := tbsBrowse;
end;

procedure TfrmPrdLocationIn.grdPrdLocationInDblClick(Sender: TObject);
begin
   if pgcPrdLocationIn.ActivePage<>tbsEdit then
      pgcPrdLocationIn.ActivePage:=tbsEdit;
end;

procedure TfrmPrdLocationIn.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
   //防止保存后直接修改所造成的从库状态变化
   if not ScrollAfterEdit and blnOpen then
   begin
      if data.qryPrdLocationInSku.Active then
      begin
         data.qryPrdLocationInSku.Close;
         data.qryPrdLocationInSku.Open;
      end;
      ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      data.qryPrdLocationInEdit.Active       :=blnOpen;
      data.qryPrdLocationInSku.Active :=blnOpen;
   end else
   begin
      data.qryPrdLocationInEdit.Active:=blnOpen;
      data.qryPrdLocationInSku.Active := blnOpen;
   end;
end;

procedure TfrmPrdLocationIn.SetMasterDetailState(blnConnect:Boolean);
  //{将主从表的MasterDetail关系连接或切断}
begin
end;

procedure TfrmPrdLocationIn.pgcPrdLocationInChange(Sender: TObject);
begin
   if pgcPrdLocationIn.ActivePage=tbsEdit then
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

procedure TfrmPrdLocationIn.pgcInfoChange(Sender: TObject);
begin
   if data.qryPrdLocationIn.Active then SetDetailActive(true,true);
end;

procedure TfrmPrdLocationIn.mitAddSkuClick(Sender: TObject);
begin
   grdSKU.SetFocus;
   data.qryPrdLocationInSku.Append;
   grdSKUBeforeInsert;
end;

procedure TfrmPrdLocationIn.edtCusIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('C','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryPrdLocationInEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryPrdLocationInEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmPrdLocationIn.edtCusIdExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtCusId.Text='' then
      begin
         data.qryPrdLocationInEdit.Edit;
         data.qryPrdLocationInEdit.FieldByName('cusid').AsString:='';
         data.qryPrdLocationInEdit.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('C',edtCusId.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryPrdLocationInEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryPrdLocationInEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
      FreeAndNil(qrySelect);
      end;
   end;
//  TimeSelect;
end;

procedure TfrmPrdLocationIn.edtSkuNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
   blnFirst:boolean;
begin
   if data.qryPrdLocationInEdit.FieldByName('cusid').AsString='' then
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
         data.qryPrdLocationInSku.Edit;
         blnFirst:=False;
      end else
         data.qryPrdLocationInSku.Append;
      data.qryPrdLocationInSku.Fieldbyname('quantity').AsInteger  :=1;
      data.qryPrdLocationInSku.Fieldbyname('area').AsFloat  :=qrySelect.FieldByName('areapro').AsFloat*data.qryPrdLocationInSku.Fieldbyname('quantity').AsFloat;

      data.qryPrdLocationInSku.FieldByName('SkuId').AsString  :=qrySelect.FieldByName('skuId').AsString;
      data.qryPrdLocationInSku.FieldByName('SkuName').AsString  :=qrySelect.FieldByName('skuname').AsString;
      data.qryPrdLocationInSku.FieldByName('QuantityUOM').AsString:=qrySelect.FieldByName('QuantityUOM').AsString;;
      data.qryPrdLocationInSku.FieldByName('areauom').AsString    :=qrySelect.FieldByName('areauom').AsString;;

      try
         data.qryPrdLocationInSku.Post;
      except
         break;
      end;
      qrySelect.Next;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmPrdLocationIn.grdSKUBeforeInsert;
begin
   grdSKU.FocusedColumn:=0;
   data.qryPrdLocationInSku.Fieldbyname('sno').AsFloat  :=-1;

   data.qryPrdLocationInSku.fieldByname('jobno').AsString:=data.qryPrdLocationInEdit.fieldbyname('jobno').AsString;
end;

procedure TfrmPrdLocationIn.grdSKUChangeNodeEx(Sender: TObject);
begin
   if grdSKU.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUBeforeInsert;
   end;
end;

procedure TfrmPrdLocationIn.grdSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmPrdLocationIn.grdSKUEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryPrdLocationInSku.fieldbyname('sno').AsInteger=0) then
   begin
      mitAddSKUClick(Sender);
   end;
end;

procedure TfrmPrdLocationIn.mitDelSkuClick(Sender: TObject);
begin
   if data.qryPrdLocationInSku.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       strDel_Task:=strDel_Task+' or SNO='+data.qryPrdLocationInSku.fieldbyname('SNO').Asstring;
       grdSKU.SetFocus;
       data.qryPrdLocationInSku.Delete;
    end;
end;

procedure TfrmPrdLocationIn.grdSkuExit(Sender: TObject);
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

procedure TfrmPrdLocationIn.edtQuantityValidate(Sender: TObject;
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
      data.qryPrdLocationInSku.Edit;
      data.qryPrdLocationInSku.FieldByName('quantity').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);

      Accept:=True;
   end;
end;

procedure TfrmPrdLocationIn.edtAreaValidate(Sender: TObject;
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
      data.qryPrdLocationInSku.Edit;
      data.qryPrdLocationInSku.FieldByName('area').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);
      Accept:=True;
   end;
end;

procedure TfrmPrdLocationIn.grdPrdLocationInChangeNodeEx(Sender: TObject);
begin
  if (data.qryPrdLocationInEdit.ParamByName('Jobno').AsString<>data.qryPrdLocationIn.FieldByName('Jobno').AsString)
    or (data.qryPrdLocationInEdit.ParamByName('Jobno').AsString='') then
  begin
    data.qryPrdLocationInEdit.ParamByName('Jobno').AsString:=data.qryPrdLocationIn.FieldByName('Jobno').AsString;
    data.qryPrdLocationInSku.ParamByName('Jobno').AsString:=data.qryPrdLocationIn.FieldByName('Jobno').AsString;
    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcPrdLocationIn.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmPrdLocationIn.edtWidthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qryPrdLocationInSku.FieldByName('width').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmPrdLocationIn.mitFilterActiveClick(Sender: TObject);
begin
   grdPrdLocationIn.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmPrdLocationIn.grdPrdLocationInCustomDrawCell(Sender: TObject;
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

procedure TfrmPrdLocationIn.edtSalerNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if data.qryPrdLocationInEdit.fieldbyname('cusid').asstring='' then
      begin
         ActiveControl:=edtCusID;
         KmessageDlg('请先选择订货单位!',mtWarning,[mbOK],0);
         Exit;
      end;
      qrySelect:=pGetOperatorSelect(data.qryPrdLocationInEdit.fieldbyname('cusid').asstring);
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryPrdLocationInEdit.Edit;
         data.qryPrdLocationInEdit.Fieldbyname('salername').asstring:=qrySelect.FieldByName('opname').AsString;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmPrdLocationIn.edtOrderDateTimeExitCheck(Sender: TObject;
   OldValue: Variant; var Failed: Boolean);
begin
   TimeSelect;
end;

procedure TfrmPrdLocationIn.edtOrderDateExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if DataState in Setdcs then
   TimeSelect;
end;

procedure TfrmPrdLocationIn.TimeSelect;
begin
{   IntColltime:=0;
   IntCelivTime:=0;
   IntReTime:=0;
   begin
      strsql:='exec ksp_getThreeTime @AccountID ="'+data.qryPrdLocationInEdit.FieldByName('cusid').AsString+'",'+chr(13)+chr(10)
           +'                       @OrderType ="'+data.qryPrdLocationInEdit.FieldByName('ordertype').AsString+'",'+chr(13)+chr(10)
           +'                       @StartZoneCD ="'+data.qryPrdLocationInEdit.FieldByName('CollectionZoneCD').AsString+'",'+chr(13)+chr(10)
           +'                       @EndZoneCD  ="'+data.qryPrdLocationInEdit.FieldByName('DestinationZoneCD').AsString+'"'+chr(13)+chr(10);

      opensql(dataTmp.qryTmp,strsql);
      if dataTmp.qryTmp.RecordCount=1 then
      begin
         IntColltime:=dataTmp.qryTmp.fieldbyname('CollTime').asinteger;
         IntCelivTime:=dataTmp.qryTmp.fieldbyname('Delive').asinteger;
         IntReTime:=dataTmp.qryTmp.fieldbyname('ReTime').asinteger;
      end;
      data.qryPrdLocationInEdit.FieldByName('pickdate').AsDateTime :=data.qryPrdLocationInEdit.fieldbyname('orderdate').AsDateTime +IntColltime /24;
      data.qryPrdLocationInEdit.FieldByName('delidate').AsDateTime :=data.qryPrdLocationInEdit.fieldbyname('orderdate').AsDateTime +IntCelivTime /24;
      data.qryPrdLocationInEdit.FieldByName('reredate').AsDateTime :=data.qryPrdLocationInEdit.fieldbyname('orderdate').AsDateTime +IntReTime /24;
   end;}
end;

procedure TfrmPrdLocationIn.N10Click(Sender: TObject);
begin
   data.qryPrdLocationInSku.First;
   while not data.qryPrdLocationInSku.Eof do
   begin
      data.qryPrdLocationInSku.Delete;
   end;   
end;

procedure TfrmPrdLocationIn.CreateParams(var Params: TCreateParams);
begin
   if FileExists(getExeDir+'\'+'KinnGrid.ini')  then
      grdPrdLocationIn.IniFileName:=getExeDir+'\'+'KinnGrid.ini';
   inherited CreateParams(Params);
end;

procedure TfrmPrdLocationIn.edtCusIdExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmPrdLocationIn.MenuItem3Click(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from PrdLocationInsku(nolock) where jobno="'+data.qryPrdLocationIn.FieldByName('jobno').AsString+'" ');
   if (dataTmp.qryTmp.RecordCount=0) then
   begin
      KmessageDlg('没有商品信息不能审核！',mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qryPrdLocationIn.FieldByName('checkname').AsString<>'' then
   begin
      KmessageDlg('该订单已经审核过了，不能再审核！',mtWarning,[mbOK],0);
      Exit
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update PrdLocationIn '
                         +'   set checkname="'+_loginname+'",'
                         +'       checkdate="'+datetostr(now)+'" '
                         +' where jobno="'+data.qryPrdLocationIn.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmPrdLocationIn.MenuItem6Click(Sender: TObject);
begin
   if data.qryPrdLocationIn.Fieldbyname('checkname').asstring='' then
   begin
      KmessageDlg('该笔还未审核，不能取消审核！',mtWarning,[mbOK],0);
      exit;
   end;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(dataTmp.qryTmp,'update PrdLocationIn '
                         +'   set checkname="",'
                         +'       checkdate=null '
                         +' where jobno="'+data.qryPrdLocationIn.FieldByName('Jobno').AsString+'"');
   btnRefreshClick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmPrdLocationIn.grdLorderopinfoEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   allow:=False;
end;

procedure TfrmPrdLocationIn.grdSkuKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPrdLocationIn.mitOperationClick(Sender: TObject);
begin
   pgcPrdLocationIn.ActivePage :=tbsEdit;
   WorkOperation(stBrowse,data.qryPrdLocationIn.FieldByName('Jobno').AsString,
                          data.qryPrdLocationIn.FieldByName('UserID').AsString); 
end;

procedure TfrmPrdLocationIn.edtDownQuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qryPrdLocationInSku.FieldByName('downquantity').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmPrdLocationIn.edtHeightValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   with grdSku.InplaceEditor do
   begin
      data.qryPrdLocationInSku.FieldByName('height').AsFloat:=StrToFloat(GetEditingText);
   end;
   Accept:=True;
end;

procedure TfrmPrdLocationIn.edtOperationnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryPrdLocationInEdit.Edit;
         data.qryPrdLocationInEdit.Fieldbyname('Operationname').asstring:=qrySelect.FieldByName('opname').AsString;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmPrdLocationIn.edtInQuantityValidate(Sender: TObject;
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
      //入库数量必须小于订单数量
      if StrToFloat(grdSku.InplaceEditor.GetEditingText)>data.qryPrdLocationInSku.FieldByName('quantity').AsFloat then
      begin
         ErrorText:='入库数量不能大于订单数量!';
         Accept:=False;
         exit;
      end;
      data.qryPrdLocationInSku.Edit;
      data.qryPrdLocationInSku.FieldByName('inquantity').AsFloat:=strtofloat(grdSku.InplaceEditor.GetEditingText);

      Accept:=True;
   end;
end;

procedure TfrmPrdLocationIn.mitQuLiaoClick(Sender: TObject);
var
   strBoxState:string;
begin
   if not data.qryPrdLocationin.active then data.qryPrdLocationin.Open;
   if TMenuItem(Sender)=mitQuLiao then
      strBoxState:='取料完成';
   if TMenuItem(Sender)=mitKaiQuan then
      strBoxState:='开榫完成';
   if TMenuItem(Sender)=mitRuku then
      strBoxState:='入库';

   try
      //更新门框状态
      execsql(dataTmp.qryTmp,' update saleorder '+
                             '    set '+
                             '    boxcomplete="'+strBoxState+'" '+
                             ' where jobno="'+data.qryPrdLocationin.FieldByName('fromjobno').AsString+'" ');
      //更新门框状态
      execsql(dataTmp.qryTmp,' update prdlocationin '+
                             '    set '+
                             '    boxcomplete="'+strBoxState+'" '+
                             ' where jobno="'+data.qryPrdLocationin.FieldByName('jobno').AsString+'" ');

      btnRefreshClick(Self);
      Kmessagedlg('门框状态更新成功!', mtInformation,[mbOk],0);
   except
   end;
end;

procedure TfrmPrdLocationIn.mitGuJiaClick(Sender: TObject);
var
   strFanState:string;
begin
   if not data.qryPrdLocationin.active then data.qryPrdLocationin.Open;
   if TMenuItem(Sender)=mitGuJia then
      strFanState:='骨架完成';
   if TMenuItem(Sender)=mitMenxin then
      strFanState:='门芯完成';
   if TMenuItem(Sender)=mitMianban then
      strFanState:='面板完成';
   if TMenuItem(Sender)=mitJumu then
      strFanState:='锯门完成';
   if TMenuItem(Sender)=mitPeihui then
      strFanState:='坯灰完成';
   if TMenuItem(Sender)=mitFanRuku then
      strFanState:='入库';

   try
      //更新门扇状态
      execsql(dataTmp.qryTmp,' update saleorder '+
                             '    set '+
                             '    fancomplete="'+strFanState+'" '+
                             ' where jobno="'+data.qryPrdLocationin.FieldByName('fromjobno').AsString+'" ');
      //更新门扇状态
      execsql(dataTmp.qryTmp,' update prdlocationin '+
                             '    set '+
                             '    fancomplete="'+strFanState+'" '+
                             ' where jobno="'+data.qryPrdLocationin.FieldByName('jobno').AsString+'" ');

      btnRefreshClick(Self);
      Kmessagedlg('门扇状态更新成功!', mtInformation,[mbOk],0);
   except
   end;

end;

end.


