unit ContWithHouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  SLV, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient ,DateUtils;

type
  TfrmContWithHouse = class(TForm)
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
    SignDate: TdxDBGridColumn;
    CreateUserName: TdxDBGridColumn;
    CHECKUSERNAME: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    CL_EffectDate: TdxDBGridColumn;
    CL_EndDate: TdxDBGridColumn;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    grdCONTWITHLOCA: TdxDBGrid;
    KGroupBox2: TKGroupBox;
    KSText4: TKSText;
    ppmContWithLocaItem: TPopupMenu;
    mitAddItem: TMenuItem;
    mitDeleteItem: TMenuItem;
    ContractNO: TdxDBGridColumn;
    cusname: TdxDBGridColumn;
    CountUserName: TdxDBGridColumn;
    ACTCHKUserName: TdxDBGridColumn;
    btnCount: TKBitBtn;
    btnBreak: TKBitBtn;
    UserName: TdxDBGridColumn;
    dlgOpenFile: TOpenDialog;
    ppmAttachment: TPopupMenu;
    mitAddAtt: TMenuItem;
    mitDeleteAtt: TMenuItem;
    mitOpenAtt: TMenuItem;
    KGroupBox5: TKGroupBox;
    lvAttachment: TKinListView;
    grdCostItem: TdxDBGrid;
    dtdCti_Date: TdxDBGridDateColumn;
    edtCti_in: TdxDBGridCurrencyColumn;
    edtCti_out: TdxDBGridCurrencyColumn;
    edtCti_who: TdxDBGridButtonColumn;
    dtdCTI_SDate: TdxDBGridDateColumn;
    dtdCTI_EDate: TdxDBGridDateColumn;
    edtCTI_CountDay: TdxDBGridCurrencyColumn;
    edtCTI_Reason: TdxDBGridButtonColumn;
    edtCTI_Quantity: TdxDBGridCurrencyColumn;
    edtCTI_Price: TdxDBGridCurrencyColumn;
    edtCostRemark: TdxDBGridMemoColumn;
    SNO: TdxDBGridColumn;
    cmbCTI_PAYWAYCD: TdxDBGridKinPickColumn;
    cmbCostcd: TdxDBGridKinPickColumn;
    cmbCti_currcd: TdxDBGridKinPickColumn;
    grpinfobar: TKGroupBox;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCountName: TdxDBEdit;
    edtCheckName: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    edtCostCHECKNAME: TdxDBEdit;
    dtdCreatedate: TdxDBDateEdit;
    GMSStickyLabel17: TGMSStickyLabel;
    ppmCheck: TPopupMenu;
    mitCheck: TMenuItem;
    mitUnCheck: TMenuItem;
    PopupMenu1: TPopupMenu;
    mitAddCOSTITEM: TMenuItem;
    mitDelCOSTITEM: TMenuItem;
    ppmprint: TPopupMenu;
    MenuItem1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel31: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText3: TKSText;
    KSText5: TKSText;
    mitcontadd: TMenuItem;
    GMSStickyLabel24: TGMSStickyLabel;
    KSText1: TKSText;
    deposit: TdxDBGridColumn;
    ppmCount: TPopupMenu;
    mitMultCount: TMenuItem;
    payway: TdxDBGridColumn;
    iocost: TdxDBGridColumn;
    N3: TMenuItem;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    GMSStickyLabel20: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    dtdSignDate: TdxDBDateEdit;
    memRemark: TdxDBMemo;
    edtCusID: TdxDBButtonEdit;
    edtContractNO: TdxDBEdit;
    edtAreaTotal: TdxDBCalcEdit;
    edtPrice: TdxDBCalcEdit;
    edtRent: TdxDBCalcEdit;
    cmbAreaUOM: TKinDbPickEdit;
    cmbCostCurrency: TKinDbPickEdit;
    dtdEffectDate: TdxDBDateEdit;
    edtSignWhere: TdxDBEdit;
    dtdLastCountDate: TdxDBDateEdit;
    edtUsername: TdxDBButtonEdit;
    edtConCusId: TdxDBButtonEdit;
    edtconway: TdxDBEdit;
    edtSkuclass: TdxDBEdit;
    ckbCountRent: TdxDBCheckEdit;
    edtdeposit: TdxDBCalcEdit;
    edtPayway: TKinDbPickEdit;
    edtOPID: TdxDBButtonEdit;
    ckbcountout: TdxDBCheckEdit;
    KGroupBox3: TKGroupBox;
    grdContWithLocaItem: TdxDBGrid;
    grmBegindate: TdxDBGridDateColumn;
    grmFinishdate: TdxDBGridDateColumn;
    grmptlocnam: TdxDBGridButtonColumn;
    grmareaactual: TdxDBGridCurrencyColumn;
    grmprice: TdxDBGridCurrencyColumn;
    edtEndDate: TdxDBDateEdit;
    memskyf: TdxDBMemo;
    grmRent: TdxDBGridColumn;
    bd_located: TdxDBGridColumn;
    houseno: TdxDBGridButtonColumn;
    dxDBButtonEdit1: TdxDBButtonEdit;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    dxDBMemo1: TdxDBMemo;
    GMSStickyLabel32: TGMSStickyLabel;
    dtdbreakdate: TdxDBDateEdit;
    dtdadddate: TdxDBDateEdit;
    adddate: TdxDBGridColumn;
    rent: TdxDBGridColumn;
    price: TdxDBGridColumn;
    bd_located1: TdxDBGridColumn;
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
    procedure btnCheckClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdCostItemAfterScroll(DataSet: TDataSet);
 //   function grdCostItemCheckInsert(DataSet: TDataSet;
  //    var Control: TWinControl): Boolean;
    procedure grdCostItemDblClick(Sender: TObject);
    procedure edtCusIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCti_whoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure pgcMainChange(Sender: TObject);
    procedure grdCONTWITHLOCACustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure qryCONTWITHHouseAfterScroll(DataSet: TDataSet);
    procedure mitAddItemClick(Sender: TObject);
    procedure mitDeleteItemClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
    procedure btnBreakClick(Sender: TObject);
    procedure edtAreaTotalExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtCTI_ReasonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitAddAttClick(Sender: TObject);
    procedure mitDeleteAttClick(Sender: TObject);
    procedure mitOpenAttClick(Sender: TObject);
    procedure grdCONTWITHLOCAChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure grdCostItemEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure dtdCTI_EDateValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtCTI_QuantityValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure edtCTI_PriceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdCostItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCostItemEnter(Sender: TObject);
    procedure grdCostItemExit(Sender: TObject);
    procedure grdCostItemChangeNodeEx(Sender: TObject);
    procedure edtConCusIdButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtConCusIdExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtCusIDExit(Sender: TObject);
    procedure edtConCusIdExit(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure edtUsernameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure mitCheckClick(Sender: TObject);
    procedure mitUnCheckClick(Sender: TObject);
    procedure mitAddCOSTITEMClick(Sender: TObject);
    procedure mitDelCOSTITEMClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure grdContWithLocaItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdContWithLocaItemEnter(Sender: TObject);
    procedure grdContWithLocaItemExit(Sender: TObject);
    procedure grdContWithLocaItemChangeNodeEx(Sender: TObject);
    procedure grmLocNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grmptlocnamButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitcontaddClick(Sender: TObject);
    procedure mitMultCountClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure edtOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtOPIDExit(Sender: TObject);
    procedure edtOPIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure grmareaactualValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grmpriceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure housenoButtonClick(Sender: TObject; AbsoluteIndex: Integer);

  private
    { Private declarations }
    //变量定义
    FindItem: TFindItem;               //查找
    strCTjobno:string;                 //重新取得工作号
    blnCopy,blnSaveError,blnWare:Boolean;
    mode:TDataState;             //进入form状态模式
    Bookmark: TBookmark;         //书签
    strSql: string;
    FilterSql: string;
    arrContWithLoca,arrContWithLocaItem:Variant;
    maxDocBook:Integer; //修改时候用的
    blnSelect:Boolean;
    blnAddCost:Boolean;//控制费用编辑权限
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
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    function  Gather:boolean;
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure InitValues;
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    procedure ScatterToLV;
    procedure grdCostItemBeforeInsert(pblnIsCZ:Boolean);
    procedure grdContWithLocaItemAfterInsert;
    procedure CountCost;
public
    { Public declarations }
    maxCostItem,maxsno:Integer;
    DataState:TDataState;
    oldContWithHouseItem:string;
    sltContWithHouseItem:TStringList;
  end;

procedure WorkContWithhouse(CallMode:TDataState;pstrJobno:string);

var
  frmContWithHouse: TfrmContWithHouse;
  blnDelete:boolean;
  year,month,day:word;
  month_start,month_end:TDate;
implementation

{$R *.dfm}

uses Main,kindlg,Saveget,datas,find,ContCost,
     GetUserRight, datasTmp,libuserPub,DocBook,GetDllPub,buildingselect;


procedure WorkContWithHouse(CallMode:TDataState;pstrJobno:string);
begin
   if frmContWithHouse <> nil then
   with frmContWithHouse do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmContWithHouse:=TfrmContWithHouse.Create(application);
   with frmContWithHouse do
   begin
   {初始化所有数据集}
     //初始话变量
     blnCopy        :=False;             //系统默认不复制新增
     FindItem       :=TFindItem.Create;
     blnSaveError   :=False;
     mode           :=CallMode;
     blnIsCZ        :=True;
     strcontractno:='';
     strJobno:=pstrJobno;

     sltContWithHouseItem:=TStringList.Create;
     //币种
     InitdbPick(cmbCostCurrency,'codelib','codename','codename',' codeclass="00" ');
     cmbCti_currcd.Items.Assign(cmbCostCurrency.items);
     cmbCti_currcd.ItemFields.Assign(cmbCostCurrency.Items);
     //结算方式
     InitdbPick(cmbCTI_PAYWAYCD,'codelib','codename','codename','codeclass="03" ');
     //费用
     InitdbPick(cmbCostcd,'costcode','costcd','costname',' 1=1');

     //面积单位
     InitdbPick(cmbAreaUOM,'uom','uomname','uomname',' uomtype like "%面积%" ');


      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;


      data.InitContWithHouse(pstrJobno);


     if trim(strJobno)='' then
      begin
         FilterSql:=' (convert(datetime,convert(char(8),signdate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),signdate,112)) <="'+datetostr(Month_End)+'")';
         with FindItem do
         begin
            Field.Add('2');
            operator.Add('3');
            value.Add(datetostr(Month_Start));
            Exp.Add('签订日期          大于等于    '+trim(datetostr(Month_Start)));
            Field.Add('2');
            operator.Add('4');
            value.Add(datetostr(Month_End));
            Exp.Add('签订日期          小于等于    '+trim(datetostr(Month_End)));
         end;
      end else
      FilterSql:='';

      data.qryContWithHouse0.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');
      if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitContWithHouse',trim(_userorgid));//设置按钮的有效性
    // 界面显示过程
     if mode=stInsert then
     begin
       SetControlState(stInsert,true);
       data.qryContWithHouse.open;
       btnCopy.Click;
     end else
     begin
       if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitContWithHouse',trim(_userorgid));//设置按钮的有效性
       SetControlState(stBrowse,true);
       data.qryContWithHouse0.Open;
       WorkCall(stBrowse);
     end;
     SNO.Sorted:= csUp;
     {激活FORM}
     Show;
   end;
end;

procedure TfrmContWithHouse.WorkCall(CallMode:TDataState);
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
          data.qryContWithHouse0.Edit;
          EnableEdit;
          //记录修改档案
          data.qryContWithHouse.Edit;
          //在修改的状态下，对qryContWithHouseItem循环，为sltContWithHouseItem赋值
          sltContWithHouseItem.Clear;
          data.qryContWithHouseItem.DisableControls;
          Bookmark:= data.qryContWithHouseItem.GetBookmark;
          data.qryContWithHouseItem.First;
          while not data.qryContWithHouseItem.Eof do
          begin
             sltContWithHouseItem.Add(data.qryContWithHouseItem.FieldByName('Locname').AsString);
             data.qryContWithHouseItem.Next;
          end;
          data.qryContWithHouseItem.GotoBookmark(Bookmark);
          data.qryContWithHouseItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryContWithHouseItem.EnableControls;
          data.qryContWithHouseItemAfterScroll(data.qryContWithHouseItem);
         //在修改的状态下，对qryCostItem循环
          data.qryCostItem.DisableControls;
          Bookmark:= data.qryCostItemH.GetBookmark;
          maxCostItem:=0;
          data.qryCostItemH.First;
          while not data.qryCostItemH.Eof do
          begin
            if data.qryCostItemH.FieldByName('sno').AsInteger>maxCostItem
               then maxCostItem:=data.qryCostItemH.FieldByName('sno').AsInteger;
            data.qryCostItemH.Next;
          end;
          data.qryCostItemH.GotoBookmark(Bookmark);
          data.qryCostItemH.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCostItemH.EnableControls;
          self.grdCostItemAfterScroll(data.qryCostItemH);
         //在修改的状态下，对qryDocBook循环
          data.qryDocBook.DisableControls;
          Bookmark:= data.qryDocBookH.GetBookmark;
          maxDocBook:=0;
          data.qryDocBookH.First;
          while not data.qryDocBookH.Eof do
          begin
            if data.qryDocBookH.FieldByName('SNO').AsInteger>maxDocBook
               then maxDocBook:=data.qryDocBookH.FieldByName('SNO').AsInteger;
            data.qryDocBookH.Next;
          end;
          data.qryDocBookH.GotoBookmark(Bookmark);
          data.qryDocBookH.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryDocBookH.EnableControls;
         //在修改的状态下，对qryccontwithlocaitem循环
          data.qryContWithHouseItem.DisableControls;
          Bookmark:= data.qryContWithHouseItem.GetBookmark;
          maxsno:=0;
          data.qryContWithHouseItem.First;
          while not data.qryContWithHouseItem.Eof do
          begin
            if data.qryContWithHouseItem.FieldByName('SNO').AsInteger>maxsno
               then maxsno:=data.qryContWithHouseItem.FieldByName('SNO').AsInteger;
            data.qryContWithHouseItem.Next;
          end;
          data.qryContWithHouseItem.GotoBookmark(Bookmark);
          data.qryContWithHouseItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryContWithHouseItem.EnableControls;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          data.qryContWithHouse0.Append;
          sltContWithHouseItem.Clear;
          oldContWithHouseItem:='';
          InitValues;
          EnableEdit;
          //记录档案创建信息
          data.qryContWithHouse.Edit;
          data.qryContWithHouse.FieldByName('CreateName').Asstring:=_LoginName;
          data.qryContWithHouse.fieldByname('CreateDate').AsDatetime:=date;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmContWithHouse.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
  SetControlState(DataState,False);
  if data.qryContWithHouse.FieldbyName('checkname').AsString='' then
    ActiveControl:=edtContractNO
  else
    ActiveControl:=grdCostItem;
end;

procedure TfrmContWithHouse.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if data.qryContWithHouse0.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
  dtdBreakDate.ReadOnly:=True;
  edtEndDate.ReadOnly:=True;
  memRemark.ReadOnly:=True;
  memskyf.ReadOnly:=True;
  strcontractno:='';
  SetControlState(DataState,False);
end;

procedure TfrmContWithHouse.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmContWithHouse.InitValues;
{初始化时自动生成仓位代码}
begin
  strCTJobno:=genJobno('CL');
  data.qryContWithHouse.Edit;
  data.qryContWithHouse.FieldByName('TYPEid').Asstring:='物产';
  if blnCopy then
  begin
    blnCopy:=False;
    //qryCostEdit复制
    GatherFromArray(data.qryContWithHouse,arrContWithLoca,false);
    data.qryContWithHouse.FieldByName('JOBNO').Asstring:=strCTJobno;
    data.qryContWithHouse.fieldByname('UserID').AsString:=_UserID;
    data.qryContWithHouse.fieldByname('username').AsString:=_username;

    data.qryContWithHouse.FieldByName('Checkname').Asstring:='';
    data.qryContWithHouse.FieldByName('CheckDate').Clear;
    data.qryContWithHouse.FieldByName('CountName').Asstring:='';
    data.qryContWithHouse.FieldByName('CountDate').Clear;
//    data.qryContWithHouse.FieldByName('ACTCHKName'-).Asstring:='';
//    data.qryContWithHouse.FieldByName('ACTCHKDate').Clear;
    data.qryContWithHouse.FieldByName('breakdate').Clear;
    data.qryContWithHouse.FieldByName('LastCountDate').Clear;
    //qryContWithHouseItem复制
    data.qryContWithHouseItem.DisableControls;
    GatherFromArray(data.qryContWithHouseItem,arrContWithLocaITEM,true);
    with data.qryContWithHouseItem do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('jobno').AsString:=strCTJobno;
        FieldByName('UserID').Asstring:=_UserID;
        FieldByName('Username').Asstring:=_Username;

        sltContWithHouseItem.Add(FieldByName('locname').AsString);
        next;
      end;
      First;
    end;
    data.qryContWithHouseItem.EnableControls;
    data.qryContWithHouseItemAfterScroll(data.qryContWithHouseItem);
  end else
  begin
    //data.qryContWithHouse
    data.qryContWithHouse.FieldByName('JOBNO').Asstring:=strCTJOBNO;
    data.qryContWithHouse.FieldByName('UserID').Asstring:=_UserID;
    data.qryContWithHouse.FieldByName('username').Asstring:=_username;
    data.qryContWithHouse.FieldByName('costcurrcd').Asstring:=_currcd;
    data.qryContWithHouse.FieldByName('AreaUOM').Asstring:='平方米';
  end;
end;

procedure TfrmContWithHouse.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
  if blnConnect then
  begin
    data.qryContWithHouse.DataSource    :=data.dtsContWithHouse0;
    data.qryCostItemH.datasource        :=data.dtsContWithHouse0;
    data.qryContWithHouseItem.datasource:=data.dtsContWithHouse0;
    data.qryDocBookH.datasource         :=data.dtsContWithHouse0;
  end else
  begin
    data.qryContWithHouse.DataSource    :=nil;
    data.qryCostItemH.DataSource        :=nil;
    data.qryContWithHouseItem.datasource:=nil;
    data.qryDocBookH.datasource         :=nil;
  end;
end;

procedure TfrmContWithHouse.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  if CallMode in SetDcs then
  begin
    //dtdBreakDate.ReadOnly:=True;
    if data.qryContWithHouse.FieldByName('CheckName').AsString<>'' then
    begin
      KGroupBox1.Enabled:=False;
      dtdBreakDate.ReadOnly:=True;
      grdContWithLocaItemReadOnly:=True;
      libWinControl(self,grdContWithLocaItem,True);
    end else
    begin
      libWinControl(self,grdCostItem,True);
      grdContWithLocaItemReadOnly:=False;
    end;
  end else
  begin
    //dtdBreakDate.ReadOnly:=True;
  end;
end;

function TfrmContWithHouse.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   strLocname:string;
   exchgRent:Extended;
begin
  Result:=False;
  if dtdSignDate.Date=0 then
  begin
     Kmessagedlg('签订日期不可为空！', mtInformation,[mbOk],0);//'签订日期不可为空！'
     dtdSignDate.setFocus;
     exit;
  end else
  if edtCusID.Text='' then
  begin
     Kmessagedlg('承租客户不可为空！', mtInformation,[mbOk],0);//'承租客户不可为空！'
     edtCusID.setFocus;
     exit;
  end else
  if dtdEffectDate.Date=0 then
  begin
     kMessageDlg('合同生效日期不可为空！',mtInformation,[mbOk],0);//'合同生效日期不可为空！'
     dtdEffectDate.SetFocus;
     exit;
  end else
  if edtEndDate.Date=0 then
  begin
     kMessageDlg('合同终止日期不可为空！',mtInformation,[mbOk],0);//'合同终止日期不可为空！'
     edtEndDate.setfocus;
     exit;
  end else
  if (dtdEffectDate.date>edtEndDate.date) then
  begin
     kMessageDlg('终止日期不能比生效日期早！',mtInformation,[mbOk],0);//'终止日期不能比生效日期早！'
     edtEndDate.setfocus;
     exit;
  end else
  begin
     if data.qryCostItemH.FieldByName('Jobno').asstring='' then
     begin
       data.qryContWithHouse.Edit;
       data.qryContWithHouse.FieldByName('CountName').asstring:='';
       data.qryContWithHouse.FieldByName('CountDate').Clear;
       data.qryContWithHouse.FieldByName('LastCountDate').Clear;
     end else
     begin
       data.qryCostItemH.Last;
       while not data.qryCostItemH.Bof do
       begin
          if data.qryCostItemH.FieldByName('Costcd').AsString='CZ' then
             Break
          else
             data.qryCostItemH.Prior;
       end;
       data.qryContWithHouse.Edit;
       data.qryContWithHouse.FieldByName('LastCountDate').AsDatetime:=
          data.qryCostItemH.FieldByName('edate').AsDatetime;
     end;
//     if  data.qryContWithHouse.FieldByName('checkname').asstring='' then
//     begin
        strLocname:='';
        data.qryContWithHouseItem.DisableControls;
        data.qryContWithHouseItem.First;
        while not data.qryContWithHouseItem.Eof do
        begin
           if data.qryContWithHouseItem.fieldbyname('finishdate').asstring='' then
           begin
              if Pos(data.qryContWithHouseItem.fieldbyname('LocName').asstring,strLocname)=0 then
                 strLocname:=strLocname+data.qryContWithHouseItem.fieldbyname('LocName').asstring+',';
           end;
           data.qryContWithHouseItem.Next;
        end;
        data.qryContWithHouseItem.EnableControls;
        data.qryContWithHouseItem.First;
        data.qryContWithHouse.Edit;
        data.qryContWithHouse.FieldByName('locname').AsString:=Copy(strLocname,1,Length(strLocname)-1);
//     end;
     exchgRent:=0;
     data.qryContwithHouseItem.First;
     while not data.qryContwithHouseItem.Eof do
     begin
        exchgRent:=exchgRent+data.qryContwithHouseItem.fieldbyname('rent').AsFloat;
        data.qryContwithHouseItem.Next;
     end;
     data.qryContWithHouse.FieldByName('rent').AsFloat:=exchgRent;
     data.qryContWithHouse0.Edit;
     data.qryContWithHouse0.FieldByName('Jobno').AsString:=data.qryContWithHouse.FieldByName('Jobno').AsString;
     data.qryContWithHouse0.FieldByName('SignDate').AsString:=data.qryContWithHouse.FieldByName('SignDate').AsString;
     data.qryContWithHouse0.FieldByName('ContractNO').AsString:=data.qryContWithHouse.FieldByName('ContractNO').AsString;
     data.qryContWithHouse0.FieldByName('cusname').AsString:=data.qryContWithHouse.FieldByName('cusname').AsString;
     data.qryContWithHouse0.FieldByName('effectdate').AsString:=data.qryContWithHouse.FieldByName('effectdate').AsString;
     data.qryContWithHouse0.FieldByName('enddate').AsString:=data.qryContWithHouse.FieldByName('enddate').AsString;
     data.qryContWithHouse0.FieldByName('iusername').AsString:=data.qryContWithHouse.FieldByName('iusername').AsString;
     data.qryContWithHouse0.FieldByName('LastCountDate').AsString:=data.qryContWithHouse.FieldByName('LastCountDate').AsString;
     data.qryContWithHouse0.FieldByName('breakdate').AsString:=data.qryContWithHouse.FieldByName('breakdate').AsString;
     data.qryContWithHouse0.FieldByName('createname').AsString:=data.qryContWithHouse.FieldByName('createname').AsString;
     data.qryContWithHouse0.FieldByName('checkname').AsString:=data.qryContWithHouse.FieldByName('checkname').AsString;
     data.qryContWithHouse0.FieldByName('countname').AsString:=data.qryContWithHouse.FieldByName('countname').AsString;
     data.qryContWithHouse0.FieldByName('costcheckname').AsString:=data.qryContWithHouse.FieldByName('costcheckname').AsString;
     data.qryContWithHouse0.FieldByName('locname').AsString:=strLocname;
     Result:=True;
  end;
end;


procedure TfrmContWithHouse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmContWithHouse.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetGroupbox(KGroupBox3);
  SetGroupbox(KGroupBox5);
  SetGroupbox(grpinfobar);
  SetGroupbox(KGroupBox7);
  SetDxDbGrid(grdContWithLoca);
  SetDxDbGrid(grdCostItem);
  SetDxDbGrid(grdContWithLocaItem);
  pgcMain.ActivePage:=tbsBrowse;
  //lvAttachment图表初始化
  FLargeImages := GetFileLargeImages;
  FSmallImages := GetFileSmallImages;
  //初始化附件图标列表
  InitFileImageList(lvAttachment,FSmallImages,FLargeImages);
end;

procedure TfrmContWithHouse.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmContWithHouse.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  sltContWithHouseItem.Free;
  Application.onShowhint := nil;
  data.qryContWithHouse.Close;
  data.qryContWithHouseItem.Close;
  data.qryCostItemH.Close;
  data.qryDocBookH.Close;
  frmContWithHouse:=nil
end;

procedure TfrmContWithHouse.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
end;

procedure TfrmContWithHouse.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
end;

procedure TfrmContWithHouse.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmContWithHouse.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=data.qryContWithHouse0.fieldbyname('jobno').asstring;
  data.qryContWithHouse0.DisableControls;
  data.qryContWithHouse0.Close;
  data.qryContWithHouse0.Open;
  try
    data.qryContWithHouse0.locate('jobno',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    data.qryContWithHouse0.Last;
  end;
  data.qryContWithHouse0.EnableControls;
end;

procedure TfrmContWithHouse.btnEditClick(Sender: TObject);
begin
  if data.qryContWithHouse0.FieldByName('CreateName').asstring<>_LoginName then
  begin
    kMessageDlg(GetMessage('frmContWithHouse','010'),mtWarning,[mbOK],0);//'该包仓合同不是您输入的，不能修改！'
    exit;
  end;
  if data.qryContWithHouse0.FieldByName('CHECKNAME').asstring<>'' then
  begin
    kMessageDlg(GetMessage('frmContWithHouse','011'),mtWarning,[mbOK],0);//'该包仓合同已经审核，不能修改！'
    exit;
  end;
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  blnAddCost:=False;
  mitAddCOSTITEM.Visible:=True;
  mitDelCOSTITEM.visible:=True;
  mitAddItem.Visible:=True;
  mitDeleteItem.Visible:=True;
  N1.Visible:=true;
  N3.Visible:=True;
  edtEndDate.ReadOnly:=False;
  memRemark.ReadOnly:=false;
  memskyf.ReadOnly:=false;
  strcontractno:='';
  strcontractno:=data.qryContWithHouse0.FieldByName('ContractNO').asstring;
  SetDetailActive(False,True);
  SetMasterDetailState(False);
  WorkCall(stEdit);
end;

procedure TfrmContWithHouse.btnAddClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  blnAddCost:=False;
  mitAddCOSTITEM.Visible:=False;
  mitDelCOSTITEM.visible:=False;
  mitAddItem.Visible:=True;
  mitDeleteItem.Visible:=True;
  edtEndDate.ReadOnly:=False;
  memRemark.ReadOnly:=false;
  memskyf.ReadOnly:=false;

  if pgcMain.ActivePage=tbsEdit then
    SetDetailActive(False,True);
  Workcall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmContWithHouse.btnDeleteClick(Sender: TObject);
begin
  if data.qryContWithHouse0.FieldByName('CreateName').asstring<>_LoginName then
  begin
    kMessageDlg(GetMessage('frmContWithHouse','012'),mtWarning,[mbOK],0);//'该包仓合同不是您输入的，不能删除！'
    exit;
  end;
  if data.qryContWithHouse0.FieldByName('CheckName').asstring<>'' then
  begin
    kMessageDlg(GetMessage('frmContWithHouse','013'),mtWarning,[mbOK],0);//'该包仓合同已审核，不能删除！'
    exit;
  end;
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  if KmessageDlg(_strDel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    SetMasterDetailState(False);
    _ADOConnection.startTransaction;
    try
      ExecSql(dataTmp.qryTmp,'delete from  ContWithLoca'
                     +' where jobno="'+data.qryContWithHouse0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,'delete from  contwithlocaitem'
                     +' where jobno="'+data.qryContWithHouse0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,'delete from  CostItem '
                     +' where jobno="'+data.qryContWithHouse0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                             +'  where jobno="'+data.qryContWithHouse0.FieldByName('jobno').AsString+'" ');
      data.qryContWithHouse0.Delete;
      data.qryContWithHouse0.Applyupdates;
      //TdxDBGridNode(grdCONTWITHLOCA.FocusedNode).Delete;
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
    data.qryContWithHouse0.CommitUpdates;
    SetMasterDetailState(True);
    if pgcMain.ActivePage=tbsEdit then
      SetDetailActive(True,True);
    btnRefresh.Click;
    workcall(stbrowse);
  end;
end;

procedure TfrmContWithHouse.btncopyClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  SetDetailActive(False,True);

  arrContWithLoca:=ScatterToArray(data.qryContWithHouse,true,0);
  arrContWithLocaItem:=ScatterToArray(data.qryContWithHouseItem,false,0);
  blnCopy:=True;
  edtEndDate.ReadOnly:=false;
  memRemark.ReadOnly:=False;
  memskyf.ReadOnly:=False;
  WorkCall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmContWithHouse.btnFindClick(Sender: TObject);
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

   Dofind(data.qryContWithHouse, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmContWithHouse.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryContWithHouse,dataTmp.qryFind);
end;

procedure TfrmContWithHouse.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add(' ContWithLoca  ContWithLoca ');

{0}   para.field.add('ContWithLoca.cusid');
{1}   para.field.add('ContWithLoca.ContractNO');
{2}   para.field.add('ContWithLoca.SignDate');
{3}   para.Field.add('ContWithLoca.Rent');
{4}   para.Field.add('ContWithLoca.Jobno');
{5}   para.field.add('ContWithLoca.skyf');
{6}   para.Field.add('ContWithLocaitem.price');

      Para.Exp.add('');
{0}   Para.Toptic.Add('包仓客户');
{1}   Para.Toptic.Add('合同编号');
{2}   Para.Toptic.Add('签订日期');
{3}   Para.Toptic.Add('月 租 金');
{4}   Para.Toptic.add('工 作 号');
{5}   Para.Toptic.add('收款月份');
{6}   Para.Toptic.add('单    价');

{0}   para.Ftype.add('E');
{1}   para.Ftype.add('C');
{2}   Para.Ftype.add('D');
{3}   Para.Ftype.add('N');
{4}   para.Ftype.add('C');
{5}   para.Ftype.add('C');
{6}   Para.Ftype.add('N');

   Para.RField.add('ContWithLoca.jobno');
   if filterSql<>'' then
        Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     data.qryContWithHouse0.DisableControls;
     data.qryContWithHouse0.Close;

     if strTmp<>'' then
       data.qryContWithHouse0.MacroByName('Where').AsString:=strTmp
     else
       data.qryContWithHouse0.MacroByName('Where').AsString:='1=1';
     data.qryContWithHouse0.Open;
     data.qryContWithHouse0.EnableControls;
   end;
   workcall(stbrowse);

end;

procedure TfrmContWithHouse.btnSaveClick(Sender: TObject);
begin
  if (DataState in setDcs) and Gather then //新增或编辑存盘
  begin
    try
      blnWare:=True;
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          data.qryContWithHouse.Post;
          data.qryContWithHouse0.ApplyUpdates;
          data.qryContWithHouse.ApplyUpdates;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             data.udsContWithHouse.modifysql.text + chr(13) +
             data.udsContWithHouse.DeleteSql.text + chr(13) +
             data.udsContWithHouse.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             blnWare:=False;
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( data.qryContWithHouse.FieldByName('Jobno').AsString + GetMessage('frmContWithHouse','014'));//'已经被使用。程序正在查找其他可用客户编号...'
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               strCTjobno := genJobno('CL',_DataBaseID);
               if strCTjobno = '' then
               begin
                 KmessageDlg(GetMessage('frmContWithHouse','015'), mtInformation, [mbOk], 0);//'没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 data.qryContWithHouse.Edit;
                 data.qryContWithHouse.FieldByName('Jobno').AsString := strCTJobno;
                 data.qryContWithHouse.FieldByName('KeyID').AsString := data.qryContWithHouse.FieldByName('Jobno').AsString;
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
        //移仓明细
        data.qryCostItemH.DisableControls;
        data.qryCostItemH.first;
        while not data.qryCostItemH.eof do
        begin
           data.qryCostItemH.Edit;
           data.qryCostItemH.fieldbyname('JOBNO').asstring:=data.qryContWithHouse.fieldbyname('JOBNO').asstring;
           data.qryCostItemH.Post;
           data.qryCostItemH.next;
        end;
        data.qryCostItemH.first;
        data.qryCostItemH.EnableControls;

        //包仓
        data.qryContWithHouseItem.DisableControls;
        data.qryContWithHouseItem.first;
        while not data.qryContWithHouseItem.eof do
        begin
           data.qryContWithHouseItem.Edit;
           data.qryContWithHouseItem.fieldbyname('JOBNO').asstring:=data.qryContWithHouse.fieldbyname('JOBNO').asstring;
           data.qryContWithHouseItem.Post;
           data.qryContWithHouseItem.next;
        end;
        data.qryContWithHouseItem.first;
        data.qryContWithHouseItem.EnableControls;

        //相关文档
        data.qryDocBookH.DisableControls;
        data.qryDocBookH.first;
        while not data.qryDocBookH.eof do
        begin
           data.qryDocBookH.Edit;
           data.qryDocBookH.fieldbyname('JOBNO').asstring:=data.qryContWithHouse.fieldbyname('JOBNO').asstring;
           data.qryDocBookH.Post;
           data.qryDocBookH.next;
        end;
        data.qryDocBookH.first;
        data.qryDocBookH.EnableControls;
      end;
      data.qryCostItemH.applyupdates;
      data.qryContWithHouseItem.applyupdates;
      data.qryDocBookH.ApplyUpdates;

      _ADOConnection.Commit;
    except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    data.qryContWithHouse0.CommitUpdates;
    data.qryContWithHouse.commitUpdates;
    data.qryCostItemH.commitUpdates;
    data.qryContWithHouseItem.commitUpdates;
    data.qryDocBookH.commitUpdates;

    SetMasterDetailState(True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmContWithHouse.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  if DataState=stInsert then
     ExecSql(dataTmp.qryTmp,' delete from genjobno '
                           +'  where jobno="'+data.qryContWithHouse.FieldByName('jobno').AsString+'" ');
  data.qryCostItemH.CancelUpdates;
  data.qryContWithHouseItem.CancelUpdates;
  data.qryContWithHouse.CancelUpdates;
  data.qryContWithHouse0.CancelUpdates;
  data.qryDocBookH.CancelUpdates;
  ScatterToLV;

  SetMasterDetailState(True);
  WorkCall(stBrowse);
  btnRefreshclick(self);
end;

procedure TfrmContWithHouse.btnCheckClick(Sender: TObject);
begin
   btnCheck.PopUp;
end;

procedure TfrmContWithHouse.btnPrintClick(Sender: TObject);
begin
 { WorkContWithLocaOut(data.qryContWithHouse.Fieldbyname('AccountID').asstring,
                      data.qryContWithHouse.Fieldbyname('AccountName').asstring,
                      data.qryContWithHouse.Fieldbyname('ContractNO').asstring);}
end;

procedure TfrmContWithHouse.mitFilterActiveClick(Sender: TObject);
begin
  grdContWithLoca.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmContWithHouse.grdCostItemAfterScroll(DataSet: TDataSet);
begin
{  if DataState in Setdcs then
  begin
    if (data.qryCostItemH.FieldByName('SNO').AsInteger<>-10) and
       (data.qryCostItemH.FieldByName('SNO').AsInteger<>0) then
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




{function TfrmCONTWITHLOCA.grdCostItemCheckInsert(DataSet: TDataSet;
  var Control: TWinControl): Boolean;
begin
  result:=false;
  if (data.qryCostItemH.fieldByname('CostCD').asString<>'')  then
    result:=true;
end; }

procedure TfrmContWithHouse.grdCostItemDblClick(Sender: TObject);
begin
 { if data.qryCostItemH.fieldbyname('cti_in').Asfloat > 0 then
    if data.qryCostItemH.fieldbyname('jobno1').AsString <> '' then  
//      workAppliInvo(nil, data.qryCostItemH.fieldbyname('jobno1').AsString)
    else
      KMessageDlg('该笔未开发票！', mtInformation, [mbOk], 0)
  else if data.qryCostItemH.fieldbyname('jobno1').AsString <> '' then
//    workAppliMoney(nil, data.qryCostItemH.fieldbyname('jobno1').AsString)
  else KMessageDlg('该笔未请款！', mtInformation, [mbOk], 0);}
end;

procedure TfrmContWithHouse.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if blnPage then
  begin
    data.qryContWithHouse.Close;
    data.qryContWithHouse.Open;
    data.qryContWithHouseItem.Close;
    data.qryContWithHouseItem.Open;
    data.qryCostItemH.Close;
    data.qryCostItemH.Open;
    data.qryDocBookH.Close;
    data.qryDocBookH.Open;
  end else
  begin
    data.qryContWithHouse.Active    :=blnOpen;
    data.qryCostItemH.Active        :=blnOpen;
    data.qryContWithHouseItem.Active:=blnOpen;
    data.qryDocBookH.Active         :=blnOpen;
  end;
end;

function TfrmContWithHouse.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmContWithHouse.edtCusIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryContWithHouse.edit;
         data.qryContWithHouse.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryContWithHouse.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);

   end;
end;

procedure TfrmContWithHouse.edtCti_whoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostItemH.edit;
         data.qryCostItemH.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCostItemH.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmContWithHouse.pgcMainChange(Sender: TObject);
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
      ScatterToLV;
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

procedure TfrmContWithHouse.grdCONTWITHLOCACustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Year, Month, Day, YearLast, MonthLast, DayLast: Word;
begin
  if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;
  if trim(ANode.Values[CHECKUSERNAME.Index])<>'' then
  begin
     AColor := $00C1DBC1;
  end;

  if (ANode.Values[CL_EndDate.Index]<=Now) then  AFont.Color:=clFuchsia;

  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;
end;

procedure TfrmContWithHouse.qryContWithHouseAfterScroll(DataSet: TDataSet);
begin
  if (DataState = stBrowse) and (pgcMain.ActivePage=tbsBrowse) then
  begin
    data.qryCostItemH.Close;
    data.qryContWithHouseItem.Close;
  end;
end;

procedure TfrmContWithHouse.mitAddItemClick(Sender: TObject);
begin
   grdContWithLocaITEM.SetFocus;
   data.qryContWithHouseItem.Append;
end;

procedure TfrmContWithHouse.mitDeleteItemClick(Sender: TObject);
begin
   if data.qryContWithHouseItem.FieldByName('sno').AsInteger<>0 then
    if Kmessagedlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       if sltContWithHouseItem.IndexOf(data.qryContWithHouseItem.FieldByName('locname').asstring)<>-1 then
          sltContWithHouseItem.Delete(sltContWithHouseItem.IndexOf(data.qryContWithHouseItem.FieldByName('locname').asstring));
       grdContWithLocaITEM.setfocus;
       data.qryContWithHouseItem.Delete;
    end;
end;

procedure TfrmContWithHouse.btnCountClick(Sender: TObject);
begin
   if data.qryContWithHouse0.FieldByName('CHECKNAME').asstring='' then
   begin
      kMessageDlg(GetMessage('frmContWithHouse','022'),mtWarning,[mbOK],0);//'该包仓合同未经审核，不能计费！'
      exit;
   end;
   CountCost;
end;

procedure TfrmContWithHouse.btnBreakClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  if data.qryContWithHouse.FieldByName('breakdate').AsDateTime=0 then
  begin
    if KmessageDlg(GetMessage('frmContWithHouse','023'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将终止本包仓合同的执行,您确定要终止吗?'
    begin
      SetDetailActive(False,True);
      SetMasterDetailState(False);
      WorkCall(stEdit);

      grdContWithLocaItemReadOnly:=True;
      libWinControl(self,grdContWithLocaItem,True);
     // grdCostItem.Edit:=False;
      libWinControl(self,grdCostItem,True);
      mitAddCOSTITEM.Enabled:=False;
      N1.Enabled:=False;
      N3.Enabled:=False;
      mitDelCOSTITEM.Enabled:=false;
      mitAddItem.Enabled :=false;
      mitDeleteItem.Enabled :=false;

      KGroupBox1.Enabled:=False;
      dtdBreakDate.ReadOnly:=False;
//      dtdBreakDate.ReadOnly:=False;
      dtdBreakDate.Setfocus;
    end;
  end else
  begin
    if KmessageDlg(GetMessage('frmContWithHouse','024'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将取消终止本包仓合同,您确定要取消吗?'
    begin
      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
         data.qryContWithHouse.Edit;
         data.qryContWithHouse.FieldByName('breakdate').Clear;
         data.qryContWithHouse.FieldByName('endreason').clear;
         data.qryContWithHouse.Applyupdates;
         _ADOConnection.Commit;
      except
         _ADOConnection.RollBack;
         SetMasterDetailState(True);
         raise;
         exit;
      end;
      data.qryContWithHouse.CommitUpdates;

      SetMasterDetailState(True);
      workcall(stbrowse);
    end;
  end;
end;

procedure TfrmContWithHouse.edtAreaTotalExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
//  if DataState in Setdcs then
//  begin
//    data.qryContWithHouse.Edit;
//    data.qryContWithHouse.FieldByName('Rent').AsFloat:=edtAreaTotal.Value*edtPrice.Value;
//  end;
end;

procedure TfrmContWithHouse.edtCTI_ReasonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('T','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryCostItemH.edit;
      data.qryCostItemH.FieldByName('reason').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithHouse.edtUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qryContWithHouse.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qryContWithHouse.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmContWithHouse.mitAddAttClick(Sender: TObject);
begin
  with AddFileItem(lvAttachment) do
  if FileName <> '' then
  begin
    data.qryDocBookH.Append;
    data.qryDocBookH.FieldByName('DocType').AsString := '相关文档';//文档类别
    data.qryDocBookH.FieldByName('DOCID').AsString := data.qryContWithHouse.fieldbyname('Jobno').AsString;
    data.qryDocBookH.FieldByName('FilesName').AsString := FileName;//文件名
    TBlobField(data.qryDocBookH.FieldByName('FilesContent')).LoadFromStream(FileContent);//文件内容
    data.qryDocBookH.Post;
    //
    FreeAndNil(FileContent);
  end;
end;

procedure TfrmContWithHouse.mitDeleteAttClick(Sender: TObject);
var
  blnNeedReload: Boolean;
begin
  if lvAttachment.ItemIndex = -1 then
  begin
    KMessageDlg(GetMessage('frmContWithHouse','025'),mtWarning,[mbOk],0);//'没有选择附件,不能删除'
    exit;
  end;
  if KMessageDlg(GetMessage('frmContWithHouse','026'),mtConfirmation,[mbYes,mbNO],0)=mrYes then//'确认删除所选择附件?'
  begin
    if data.qryDocBookH.Locate('SNO',lvAttachment.ItemIndex+1,[]) then
    begin
      if lvAttachment.Items.Count -1 > lvAttachment.ItemIndex then
        blnNeedReload := True;
      data.qryDocBookH.Edit;
      data.qryDocBookH.Delete;
      lvAttachment.Items[lvAttachment.ItemIndex].Focused := True;
      lvAttachment.Items[lvAttachment.ItemIndex].Delete;
      if blnNeedReload then  ScatterToLV;
      if lvAttachment.Items.Count > 0 then lvAttachment.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmContWithHouse.mitOpenAttClick(Sender: TObject);
begin
  if not (DataState in setDcs) then
  if lvAttachment.ItemIndex <>-1 then
  begin
    data.qryDocBookH.Locate('SNO',lvAttachment.ItemIndex+1,[]);
    OpenItemFile(data.qryDocBookH.FieldByName('filesname').AsString,TBlobField(data.qryDocBookH.FieldByName('FilesContent')));
  end;
end;

procedure TfrmContWithHouse.ScatterToLV;
var
  strFileName: string;
  ListItem: TListItem;
begin
//  if _blnUseHtDocBook then//文档管理
  if data.qryDocBookH.Active then
  begin
    if data.qryDocBookH.FieldByName('DOCID').AsString <> '' then
    begin
//      lvAttachment.Visible := True;
//      spdAttachment.Down := True;
    end else
    begin
//      lvAttachment.Visible := False;
//      spdAttachment.Down := False;
    end;
    //
    data.qryDocBookH.First;
    lvAttachment.Items.Clear;
    while not data.qryDocBookH.Eof do
    begin
      if data.qryDocBookH.FieldByName('FilesName').AsString <> '' then
      begin
        strFileName := data.qryDocBookH.FieldByName('FilesName').AsString;
        ListItem := lvAttachment.Items.Add;
        ListItem.Caption := strFileName;
        SetFileImageIndex(ListItem,lvAttachment.ViewStyle=vsIcon);
      end;
      data.qryDocBookH.Next;
    end;
  end;
end;

procedure TfrmContWithHouse.grdCONTWITHLOCAChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  ScatterToLV;
end;

{procedure TfrmCONTWITHLOCA.edtCTI_PriceExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (data.qryCostItemH.FieldByName('CTI_Price').AsFloat<>0) and (data.qryCostItemH.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      data.qryCostItemH.Edit;
      data.qryCostItemH.FieldByName('cti_in').AsFloat:=data.qryCostItemH.FieldByName('CTI_Price').AsFloat*data.qryCostItemH.FieldByName('CTI_Quantity').AsFloat;
   end;
end; }

{procedure TfrmCONTWITHLOCA.edtCTI_QuantityExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (data.qryCostItemH.FieldByName('CTI_Price').AsFloat<>0) and (data.qryCostItemH.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      data.qryCostItemH.Edit;
      data.qryCostItemH.FieldByName('cti_in').AsFloat:=data.qryCostItemH.FieldByName('CTI_Price').AsFloat*data.qryCostItemH.FieldByName('CTI_Quantity').AsFloat;
   end;
end;}

procedure TfrmContWithHouse.grdCostItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) or (data.qryContWithHouse.FieldByName('CheckName').AsString='') then
      Allow:=False
   else
   begin
      if (data.qryCostItemH.FieldByName('IOCOST').AsFloat<>0) or
      (data.qryCostItemH.FieldByName('IOCHARGE').AsFloat<>0) or
      (data.qryCostItemH.FieldByName('IOINVO').AsFloat<>0) or
      (data.qryCostItemH.FieldByName('COSTCHECKNAME').AsString<>'') or
      (data.qryCostItemH.FieldByName('DEPARTCHK').AsString<>'') or
      (data.qryCostItemH.FieldByName('VOUCHERNO').AsString<>'') then
         Allow:=False
      else
         Allow:=True;
   end;
end;


procedure TfrmContWithHouse.dtdCTI_EDateValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  if (DataState in Setdcs) and (grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index]<>0) and (grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index]<>0)
    and (grdCostItem.FocusedNode.Values[edtCTI_CountDay.Index]=0) then
    grdCostItem.FocusedNode.Values[edtCTI_CountDay.Index]:=grdCostItem.FocusedNode.Values[dtdCTI_EDate.Index]-grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index];
end;

procedure TfrmContWithHouse.edtCTI_QuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (data.qryCostItemH.FieldByName('costrate').AsFloat<>0) and (data.qryCostItemH.FieldByName('Quantity').AsFloat<>0) then
   begin
      data.qryCostItemH.Edit;
      //lzw20100226
      if ckbcountout.Checked then
         data.qryCostItemH.FieldByName('costout').AsFloat:=data.qryCostItemH.FieldByName('costrate').AsFloat*data.qryCostItemH.FieldByName('Quantity').AsFloat
      else
         data.qryCostItemH.FieldByName('costin').AsFloat:=data.qryCostItemH.FieldByName('costrate').AsFloat*data.qryCostItemH.FieldByName('Quantity').AsFloat;
   end;
end;

procedure TfrmContWithHouse.edtCTI_PriceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (data.qryCostItemH.FieldByName('costrate').AsFloat<>0) and (data.qryCostItemH.FieldByName('Quantity').AsFloat<>0) then
   begin
      data.qryCostItemH.Edit;
      //lzw20100226
      if ckbcountout.Checked then
        data.qryCostItemH.FieldByName('costout').AsFloat:=data.qryCostItemH.FieldByName('costrate').AsFloat*data.qryCostItemH.FieldByName('Quantity').AsFloat
      else
        data.qryCostItemH.FieldByName('costin').AsFloat:=data.qryCostItemH.FieldByName('costrate').AsFloat*data.qryCostItemH.FieldByName('Quantity').AsFloat;
   end;
end;

procedure TfrmContWithHouse.grdCostItemKeyDown(Sender: TObject;
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
        mitDelCOSTITEMClick(sender);
        key:=0;
      end;
    end;
  end;

end;

procedure TfrmContWithHouse.grdCostItemEnter(Sender: TObject);
begin
{  if (DataState in setdcs) and (data.qryCostItemH.fieldbyname('SNO').AsInteger=0)and(blnAddCost) then
  begin
    {if (data.qryCostItemH.RecordCount=0) and (data.qryContWithHouse.fieldbyname('effectdate').asstring='')then
    begin
      KMessageDlg('请先填写包仓起始日期！',mtWarning,[mbOK],0);
      dtdEffectDate.SetFocus;
      Exit;
    end;
    mitAddCOSTITEMClick(Sender);
  end;  }
end;

procedure TfrmContWithHouse.grdCostItemExit(Sender: TObject);
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

procedure TfrmContWithHouse.grdCostItemChangeNodeEx(Sender: TObject);
begin
{  if grdCostItem.Datalink.DataSet.State = dsInsert then
  begin
     grdCostItemBeforeInsert(blnIsCZ);
  end;}
end;

procedure TfrmContWithHouse.edtConCusIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin 
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then  
      begin
         data.qryContWithHouse.edit;
         data.qryContWithHouse.FieldByName('concusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryContWithHouse.FieldByName('concusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmContWithHouse.edtCusIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcusid.Text='' then
      begin
         data.qryContWithHouse.Edit;
         data.qryContWithHouse.FieldByName('cusid').AsString:='';
         data.qryContWithHouse.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryContWithHouse.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryContWithHouse.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;

   end;
end;

procedure TfrmContWithHouse.edtConCusIdExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcusid.Text='' then
      begin
         data.qryContWithHouse.Edit;
         data.qryContWithHouse.FieldByName('concusid').AsString:='';
         data.qryContWithHouse.FieldByName('concusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryContWithHouse.FieldByName('concusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryContWithHouse.FieldByName('concusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmContWithHouse.edtCusIDExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmContWithHouse.edtConCusIdExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmContWithHouse.edtUsernameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmContWithHouse.edtUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtUsername.Text='' then
      begin
         data.qryContWithHouse.Edit;
         data.qryContWithHouse.FieldByName('iuserid').AsString:='';
         data.qryContWithHouse.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtUsername.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qryContWithHouse.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qryContWithHouse.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
//      if data.qryContWithHouse.FieldByName('ContractNO').AsString='' then
//      begin
         decodedate(Now,Year,Month,Day);//分解当前日期
         OpenSql(dataTmp.qryTmp,'select iscontract=isnull(iscontract,"F"),IsYear=isnull(IsYear,"F"), '
                               +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                               +'        ishelpnoct=rtrim(isnull(ishelpnoct,"")) '
                               +'   from organization (nolock)  '
                               +'  where userid="'+data.qryContWithHouse.FieldByName('iuserid').AsString+'" ');
         if datatmp.qryTmp.FieldByName('iscontract').AsString='T' then
         begin
            StrCusInvo:='';
            strdate:='';
            StrCusInvo:=datatmp.qryTmp.FieldByName('ishelpnoct').AsString;
            if datatmp.qryTmp.FieldByName('IsYear').AsString='T' then
               strdate:=strdate+copy(IntToStr(Year),3,2);
            {if datatmp.qryTmp.FieldByName('IsMonth').AsString='T' then
               strdate:=strdate+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month));
            if datatmp.qryTmp.FieldByName('IsDay').AsString='T' then
               strdate:=strdate+iif(day<10,'0'+IntToStr(day),IntToStr(day)); }
            if strdate<>'' then  StrCusInvo:=StrCusInvo+'（'+strdate+'）';

            opensql(datatmp.qryTmp,'select ContractNO '
                                  +'  from contwithloca (nolock) '
                                  +' where ContractNO like "'+StrCusInvo+'%"  '
                                  +'   and cusid="'+data.qryContWithHouse.FieldByName('cusid').AsString+'"'
                                  );
            if  datatmp.qryTmp.FieldByName('ContractNO').AsString<>'' then
            begin
               opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString("'+datatmp.qryTmp.FieldByName('ContractNO').AsString+'",'
                                      +'                              len("'+StrCusInvo+'")+4,1)),0)+1 '
                                      );

               data.qryContWithHouse.FieldByName('ContractNO').AsString:=StrCusInvo+Copy(datatmp.qryTmp.FieldByName('ContractNO').AsString,
                                                                             Length(StrCusInvo)+1,3)+'-'+datatmp.qryTmp1.Fieldbyname('maxno').asstring+'';
            end else
            begin
               opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(ContractNO,len("'+StrCusInvo+'")+1,3)),0)+1 '
                                      +'  from contwithloca (nolock) '
                                      +' where ContractNO like "%'+StrCusInvo+'%"  '
                                      );
               if (strcontractno<>'')and(Copy(strcontractno,1,Length(strcontractno)-3)=StrCusInvo) then
                  data.qryContWithHouse.FieldByName('ContractNO').AsString:=strcontractno
               else
                  data.qryContWithHouse.FieldByName('ContractNO').AsString:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,3,'0',psLeft);
            end;

         end else
             data.qryContWithHouse.FieldByName('ContractNO').AsString:='';
//      end;
   end;
end;

procedure TfrmContWithHouse.mitCheckClick(Sender: TObject);
var
   i,j:integer;
begin
   if KmessageDlg(GetMessage('frmContWithHouse','027'),mtInformation,[mbYes,mbNo],0)<>mryes then//'该操作将审核选中的所有资料，您确定操作吗?'
      Exit;
   j:=grdCONTWITHLOCA.SelectedCount;
{   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;                            }
   if j<0 then
   begin
      if data.qryContWithHouse0.FieldByName('checkname').asstring='' then
          ExecSql(dataTmp.qryTmp,' update contwithloca '
                                +'    set checkname="'+_Loginname+'",'
                                +'        checkdate="'+DateTimeToStr(GetServerDate)+'"'
                                +'  where jobno="'+data.qryContWithHouse0.fieldbyname('jobno').asstring+'"');
   end else
   begin
      for i:=grdCONTWITHLOCA.SelectedCount-1 downto 0 do
      begin
         data.qryContWithHouse0.GotoBookmark(Pointer(grdCONTWITHLOCA.Selectedrows[i]));
         if data.qryContWithHouse0.FieldByName('checkname').asstring='' then
             ExecSql(dataTmp.qryTmp,' update contwithloca '
                                   +'    set checkname="'+_Loginname+'",'
                                   +'        checkdate="'+DateTimeToStr(GetServerDate)+'"'
                                   +'  where jobno="'+data.qryContWithHouse0.fieldbyname('jobno').asstring+'"');
   //      _pgbClear.StepBy(1);
      end;
   end;
//   _pgbClear.Visible:=False; //为了控制进度条
//   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshclick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0)
end;

procedure TfrmContWithHouse.mitUnCheckClick(Sender: TObject);
var
   i,j,intfalt:integer;
begin
   intfalt:=0;
   if KmessageDlg(GetMessage('frmContWithHouse','028'),mtInformation,[mbYes,mbNo],0)<>mryes then//'该操作将对选中的资料取消审核，您确定操作吗?'
      Exit;
   j:=grdCONTWITHLOCA.SelectedCount;
{   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;    }
   for i:=grdCONTWITHLOCA.SelectedCount-1 downto 0 do
   begin
      data.qryContWithHouse0.GotoBookmark(Pointer(grdCONTWITHLOCA.Selectedrows[i]));
      if data.qryContWithHouse0.FieldByName('checkname').asstring<>'' then
      begin
         if data.qryContWithHouse0.FieldByName('costcheckname').asstring<>'' then
           Inc(intfalt)
         else
            ExecSql(dataTmp.qryTmp,' update contwithloca '
                                  +'    set checkname="",'
                                  +'        checkdate=null'
                                  +'  where jobno="'+data.qryContWithHouse0.fieldbyname('jobno').asstring+'"');
      end;
//      _pgbClear.StepBy(1);
   end;
//   _pgbClear.Visible:=False; //为了控制进度条
//   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshclick(self);
   if intfalt>0 then
      Kmessagedlg(_strsucceed+IntToStr(intfalt)+'/'+inttostr(j)+GetMessage('frmContWithHouse','029'),mtInformation,[mbOk],0)//'记录已经财务审核，无法取消审核'
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0)
end;

procedure TfrmContWithHouse.mitAddCOSTITEMClick(Sender: TObject);
begin
  if (data.qryContWithHouse.FieldByName('breakdate').AsString<>'') and
     (data.qryContWithHouse.FieldByName('LastCountDate').AsString>=data.qryContWithHouse.FieldByName('breakdate').AsString) then
  begin
    Exit; 
  end else
  begin
     grdCOSTITEM.setfocus;
     blnIsCZ:=True;
     if Sender=mitAddCOSTITEM then
     begin
        data.qryCostItemH.Last;
        while (not data.qryCostItemH.Bof) do
        begin
           if data.qryCostItemH.FieldByName('CostCd').AsString='CZ' then
           Break
           else
           data.qryCostItemH.Prior;
        end;
     end;

     data.qryCostItemH.append;
     grdCostItemBeforeInsert(blnIsCZ);
  end;
end;

procedure TfrmContWithHouse.mitDelCOSTITEMClick(Sender: TObject);
begin
    if data.qryCostItemH.FieldByName('CostCheckName').AsString<>'' then
    begin
      KMessageDlg(GetMessage('frmContWithHouse','018'), mtInformation, [mbOk], 0);//'该笔费用已审核,不能直接删除！'
      exit;
    end;
   //lzw 20090106
   {if data.qryCostItemH.FieldByName('notauto').AsString<>'T' then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','014'),mtConfirmation,[mbYes],0);//'这笔费用为电脑自动计算,不能手工删除!'
      exit;
   end else}
   if (data.qryCostItemH.FieldByName('IOCOST').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','015'),mtConfirmation,[mbYes],0);//'这笔已经核销,不能删除!'
      exit;
   end else
   if (data.qryCostItemH.FieldByName('IOCHARGE').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','016'),mtConfirmation,[mbYes],0);  //'这笔已经报销,不能删除!'
      exit;
   end else
   if (data.qryCostItemH.FieldByName('IOINVO').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','017'),mtConfirmation,[mbYes],0);//'这笔已经开发票,不能删除!'
      exit;
   end else
   if (data.qryCostItemH.FieldByName('DEPARTCHK').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','018'),mtConfirmation,[mbYes],0);//'这笔已经部门审核,不能删除!'
      exit;
   end else
   if (data.qryCostItemH.FieldByName('COSTCHECKNAME').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','019'),mtConfirmation,[mbYes],0);//'这笔已经财务审核,不能删除!'
      exit;
   end else
   if (data.qryCostItemH.FieldByName('VOUCHERNO').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','020'),mtConfirmation,[mbYes],0); //'这笔已经生成凭证,不能删除!'
      exit;
   end;

    if Kmessagedlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       grdCOSTITEM.setfocus;
       data.qryCostItemH.Delete;
    end;
end;

procedure TfrmContWithHouse.MenuItem1Click(Sender: TObject);
begin
   WorkContCost(data.qryContWithHouse0.FieldByName('jobno').AsString,
                data.qryContWithHouse0.FieldByName('ContractNO').AsString,
                data.qryContWithHouse0.FieldByName('cusname').AsString
                );
end;

procedure TfrmContWithHouse.grdCostItemBeforeInsert(pblnIsCZ:Boolean);
begin
   data.qryCostItemH.fieldbyname('Jobno').asstring :=data.qryContWithHouse.fieldbyname('Jobno').asstring;
   data.qryCostItemH.fieldbyname('userid').asstring:=data.qryContWithHouse.fieldbyname('userid').asstring;
   data.qryCostItemH.fieldbyname('snosku').AsInteger:=-10;

   data.qryCostItemH.fieldbyname('sno').Asinteger:=-1;
   //data.qryCostItemH.fieldbyname('paywaycd').Asinteger:=0;
   data.qryCostItemH.fieldbyname('costcusid').AsString:=iif(data.ContWithLoca_CopyWho='',frmContWithHouse.edtCusID.TextField,data.ContWithLoca_CopyWho);
   data.qryCostItemH.fieldbyname('costcusname').AsString:=iif(data.ContWithLoca_CopyWhoname='',frmContWithHouse.edtCusID.Text,data.ContWithLoca_CopyWhoname);

   if blnIsCZ then
   begin
      data.qryCostItemH.FieldByName('notauto').AsString:='F';
      if data.ContWithLoca_CopyDate='' then
         data.qryCostItemH.fieldbyname('costdate').AsString:=frmContWithHouse.dtdEffectDate.Text
      else
      begin
         if Trim(edtPayway.Text)='' then
            data.qryCostItemH.FieldByName('costdate').AsString:=DateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate))-1)
         else
            data.qryCostItemH.fieldbyname('costdate').AsString:=dateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate),StrToInt(edtPayway.textfield)))
      end;
      data.qryCostItemH.fieldbyname('costcd').AsString:='CZ';

      data.qryCostItemH.fieldbyname('sdate').AsString:=data.qryCostItemH.fieldbyname('costdate').AsString;
      if edtPayway.Text='' then
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItemH.fieldbyname('costout').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat
         else
           data.qryCostItemH.fieldbyname('costin').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat;
         data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,1)-1);
      end else
      if edtPayway.Text='一次性' then
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItemH.fieldbyname('costout').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithHouse.fieldbyname('enddate').AsFloat,data.qryContWithHouse.fieldbyname('effectdate').AsFloat))
         else
           data.qryCostItemH.fieldbyname('costin').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithHouse.fieldbyname('enddate').AsFloat,data.qryContWithHouse.fieldbyname('effectdate').AsFloat));
         data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryContWithHouse.fieldbyname('effectdate').AsDateTime)-1)
      end else
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItemH.fieldbyname('costout').AsFloat:=frmContWithHouse.edtRent.Value*(StrToFloat(edtPayway.TextField))
         else
           data.qryCostItemH.fieldbyname('costin').AsFloat:=frmContWithHouse.edtRent.Value*(StrToFloat(edtPayway.TextField));
         data.qryCostItemH.fieldbyname('costrate').AsFloat:=frmContWithHouse.edtPrice.Value;
         data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,StrToInt(edtPayway.TextField))-1);
         data.qryCostItemH.fieldbyname('countday').asFloat:=data.qryCostItemH.fieldbyname('edate').AsDateTime-data.qryCostItemH.fieldbyname('sdate').AsDateTime+1;
      end;
//      data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index],1)-1);
//      data.qryCostItemH.fieldbyname('countday').asFloat:=grdCostItem.FocusedNode.Values[dtdCTI_EDate.Index]-grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index];
//      data.qryCostItemH.fieldbyname('sdate').AsString:=data.qryCostItemH.fieldbyname('costdate').AsString;
//      if Trim(edtPayway.Text)='月' then
//      data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,1)-1)
//      else
//      data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,StrToInt(edtPayway.TextField))-1);
//cyh06.24
   end else
   begin
      data.qryCostItemH.fieldbyname('costdate').AsDateTime:=date;
      data.qryCostItemH.FieldByName('notauto').AsString:='T';
      cmbCostcd.ReadOnly:=False;
   end;

   data.qryCostItemH.fieldbyname('currCd').AsString:=IIF(_currcd='','RMB',_currcd);
   //lzw20100226
   if ckbcountout.Checked then
      data.qryCostItemH.fieldbyname('costin').AsFloat:=0
   else
      data.qryCostItemH.fieldbyname('costout').AsFloat:=0;
end;

procedure TfrmContWithHouse.N1Click(Sender: TObject);
begin
  if (data.qryContWithHouse.FieldByName('breakdate').AsString<>'') and
     (data.qryContWithHouse.FieldByName('LastCountDate').AsString>=data.qryContWithHouse.FieldByName('breakdate').AsString) then
  begin
    Exit;
  end else
  begin
     grdCOSTITEm.setfocus;
     blnIsCZ:=False;
   //notauto
     data.qryCostItemH.append;
     grdCostItemBeforeInsert(False);
   end;
end;

procedure TfrmContWithHouse.grdContWithLocaItemAfterInsert;
begin
  data.qryContWithHouseItem.fieldbyname('Jobno').asstring :=data.qryContWithHouse.fieldbyname('Jobno').asstring;
  data.qryContWithHouseItem.fieldbyname('userid').asstring:=data.qryContWithHouse.fieldbyname('userid').asstring;
  data.qryContWithHouseItem.fieldbyname('username').asstring:=data.qryContWithHouse.fieldbyname('username').asstring;
  data.qryContWithHouseItem.fieldbyname('iuserid').asstring:=data.qryContWithHouse.fieldbyname('iuserid').asstring;
  data.qryContWithHouseItem.fieldbyname('iusername').asstring:=data.qryContWithHouse.fieldbyname('iusername').asstring;
  data.qryContWithHouseItem.fieldbyname('begindate').asstring:=data.qryContWithHouse.fieldbyname('effectdate').asstring;
  data.qryContWithHouseItem.fieldbyname('sno').AsInteger:=-1;
end;

procedure TfrmContWithHouse.grdContWithLocaItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      if grdContWithLocaItemReadOnly then allow:=false
      else  Allow:=True;
   end;
end;

procedure TfrmContWithHouse.grdContWithLocaItemEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryContWithHouseItem.fieldbyname('sno').AsInteger=0) then
   begin
      mitAddItemClick(Sender);
   end;
end;

procedure TfrmContWithHouse.grdContWithLocaItemExit(Sender: TObject);
begin
   with grdContWithLocaItem do
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

procedure TfrmContWithHouse.grdContWithLocaItemChangeNodeEx(
  Sender: TObject);
begin
  if grdContWithLocaItem.Datalink.DataSet.State = dsInsert then
  begin
     grdContWithLocaItemAfterInsert;
  end;
end;

procedure TfrmContWithHouse.grmLocNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryContWithHouseItem.edit;
      data.qryContWithHouseItem.FieldByName('locid').AsString:=qrySelect.FieldByName('locid').asstring;
      data.qryContWithHouseItem.FieldByName('locname').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithHouse.grmptlocnamButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryContWithHouseItem.edit;
      data.qryContWithHouseItem.FieldByName('ptlocid').AsString:=qrySelect.FieldByName('locid').asstring;
      data.qryContWithHouseItem.FieldByName('ptlocname').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithHouse.mitcontaddClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;

    SetDetailActive(False,True);
    SetMasterDetailState(False);
    WorkCall(stEdit);

    grdContWithLocaItemReadOnly:=True;
    libWinControl(self,grdContWithLocaItem,True);
   // grdCostItem.Edit:=False;
    libWinControl(self,grdCostItem,True);
    mitAddCOSTITEM.Enabled:=False;
    N1.Enabled:=False;
    N3.Enabled:=False;
    mitDelCOSTITEM.Enabled:=false;
    mitAddItem.Enabled :=false;
    mitDeleteItem.Enabled :=false;

    KGroupBox1.Enabled:=False;
    edtEndDate.ReadOnly:=False;
    memRemark.ReadOnly:=false;
    memskyf.ReadOnly:=false;
//     memendreason.ReadOnly:=false;
//      dtdBreakDate.ReadOnly:=False;
    edtEndDate.Setfocus;
end;

procedure TfrmContWithHouse.CountCost;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   SetMasterDetailState(False);

{   if data.qryCostItemH.RecordCount=0 then
     begin
       grdCOSTITEM.setfocus;
       data.qryCostItemH.append;
     end;}
   blnAddCost:=True;
 //wql.05.09.02  mitAddCOSTITEM.Visible:=False;
 //wql.05.09.02  mitDelCOSTITEM.visible:=False;
   mitAddItem.Visible:=False;
   mitDeleteItem.Visible:=False;
   mitAddCOSTITEM.Visible:=True;
   mitDelCOSTITEM.visible:=True;
   N1.Visible:=True;
   N3.Visible:=True;

   WorkCall(stEdit);
   if data.qryContWithHouse.FieldByName('CountName').asstring='' then
   begin
     data.qryContWithHouse.FieldByName('CountName').asstring:=_LoginName;
     data.qryContWithHouse.FieldByName('CountDate').asDateTime:=Date;
   end;
   btnCancel.SetFocus;
end;

procedure TfrmContWithHouse.mitMultCountClick(Sender: TObject);
var
   i:Integer;
   blnCanCount:Boolean;
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   _pgbClear.Visible:=True;
   _pgbClear.Position:=0;
   _pgbClear.Max:=grdCONTWITHLOCA.SelectedCount;
   _labPro.Caption:='共'+inttostr(grdCONTWITHLOCA.SelectedCount)+'笔';
   for i:=grdCONTWITHLOCA.SelectedCount-1 Downto 0 do
   begin
      data.qryContWithHouse0.GotoBookmark(Pointer(grdCONTWITHLOCA.SelectedRows[i]));
      if data.qryContWithHouse0.FieldByName('Checkname').AsString<>'' then
      begin
         blnCanCount:=False;
         if data.qryContWithHouse0.FieldByName('payway').AsString='月' then
         begin
            if Date-data.qryContWithHouse0.fieldbyname('LastCountDate').AsDateTime+1>31 then
               blnCanCount:=True;
         end else
         begin
            if Date-data.qryContWithHouse0.fieldbyname('LastCountDate').AsDateTime+1>92 then
               blnCanCount:=True;
         end;
         if blnCanCount then
         begin
            CountCost;
            mitAddCOSTITEMClick(mitAddCOSTITEM);
            btnSave.SetFocus;
            btnSave.Click;
         end;
      end;
      _pgbClear.StepBy(1);
   end;
   _pgbClear.Visible:=False;
   _labPro.Caption:='运行进度';
end;

procedure TfrmContWithHouse.N3Click(Sender: TObject);
var
  i:Integer;
  j:Integer;
begin
  j:= StrToInt(edtPayway.TextField);
  grdCOSTITEM.setfocus;
  for i:= 1 to j do
  begin
     data.qryCostItemH.append;
     data.qryCostItemH.fieldbyname('Jobno').asstring :=data.qryContWithHouse.fieldbyname('Jobno').asstring;
     data.qryCostItemH.fieldbyname('userid').asstring:=data.qryContWithHouse.fieldbyname('userid').asstring;
     data.qryCostItemH.fieldbyname('snosku').AsInteger:=-10;
     data.qryCostItemH.fieldbyname('sno').Asinteger:=-1;
     data.qryCostItemH.fieldbyname('costcusid').AsString:=iif(data.ContWithLoca_CopyWho='',frmContWithHouse.edtCusID.TextField,data.ContWithLoca_CopyWho);
     data.qryCostItemH.fieldbyname('costcusname').AsString:=iif(data.ContWithLoca_CopyWhoname='',frmContWithHouse.edtCusID.Text,data.ContWithLoca_CopyWhoname);
     if data.ContWithLoca_CopyDate='' then
        data.qryCostItemH.fieldbyname('costdate').AsString:=frmContWithHouse.dtdEffectDate.Text
     else
     begin
        if Trim(edtPayway.Text)='' then
           data.qryCostItemH.FieldByName('costdate').AsString:=DateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate))-1)
        else
           data.qryCostItemH.fieldbyname('costdate').AsString:=dateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate),1))
     end;
     data.qryCostItemH.fieldbyname('costcd').AsString:='CZ';
     data.qryCostItemH.fieldbyname('sdate').AsString:=data.qryCostItemH.fieldbyname('costdate').AsString;
     if edtPayway.Text='' then
     begin
        //lzw20100226
        if ckbcountout.Checked then
           data.qryCostItemH.fieldbyname('costout').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat
        else
           data.qryCostItemH.fieldbyname('costin').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat;

        data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,1)-1);
     end else
     if edtPayway.Text='一次性' then
     begin
        //lzw20100226
        if ckbcountout.Checked then
          data.qryCostItemH.fieldbyname('costout').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithHouse.fieldbyname('enddate').AsFloat,data.qryContWithHouse.fieldbyname('effectdate').AsFloat))
        else
          data.qryCostItemH.fieldbyname('costin').AsFloat:=data.qryContWithHouse.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithHouse.fieldbyname('enddate').AsFloat,data.qryContWithHouse.fieldbyname('effectdate').AsFloat));
        data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryContWithHouse.fieldbyname('effectdate').AsDateTime)-1)
     end else
     begin
        //lzw20100226
        if ckbcountout.Checked then
          data.qryCostItemH.fieldbyname('costout').AsFloat:=frmContWithHouse.edtRent.Value
        else
          data.qryCostItemH.fieldbyname('costin').AsFloat:=frmContWithHouse.edtRent.Value;
        data.qryCostItemH.fieldbyname('costrate').AsFloat:=frmContWithHouse.edtPrice.Value;
        data.qryCostItemH.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItemH.fieldbyname('sdate').AsDateTime,1));
        data.qryCostItemH.fieldbyname('countday').asFloat:=data.qryCostItemH.fieldbyname('edate').AsDateTime-data.qryCostItemH.fieldbyname('sdate').AsDateTime;
     end;
 //cyh06.24
       data.qryCostItemH.fieldbyname('currCd').AsString:=IIF(_currcd='','RMB',_currcd);
       //lzw20100226
       if ckbcountout.Checked then
          data.qryCostItemH.fieldbyname('costin').AsFloat:=0
       else
          data.qryCostItemH.fieldbyname('costout').AsFloat:=0;
     {try
       data.qryLocationOutItem.Post;
     except
       break;
     end;}
  end;
end;

procedure TfrmContWithHouse.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryContWithHouse.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         data.qryContWithHouse.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmContWithHouse.edtOPIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmContWithHouse.edtOPIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOPID.Text='' then
      begin
         data.qryContWithHouse.Edit;
         data.qryContWithHouse.FieldByName('opid').AsString:='';
         data.qryContWithHouse.FieldByName('opname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(edtOPID.Text);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            data.qryContWithHouse.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
            data.qryContWithHouse.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;

end;

procedure TfrmContWithHouse.grmareaactualValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdContWithLocaItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdContWithLocaItem.InplaceEditor.GetEditingText)<0 then
      begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
      end;
      data.qryContWithHouseItem.Edit;
      data.qryContWithHouseItem.FieldByName('areaactual').AsFloat:=StrToFloat(grdContWithLocaItem.InplaceEditor.GetEditingText);
      data.qryContWithHouseItem.FieldByName('rent').AsFloat:= data.qryContWithHouseItem.FieldByName('areaactual').AsFloat*
                                                         data.qryContWithHouseItem.FieldByName('price').AsFloat;
   end;
end;

procedure TfrmContWithHouse.grmpriceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdContWithLocaItem.InplaceEditor.GetEditingText<>'') then
   begin
      if StrToFloat(grdContWithLocaItem.InplaceEditor.GetEditingText)<0 then
      begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
      end;
      data.qryContWithHouseItem.Edit;
      data.qryContWithHouseItem.FieldByName('price').AsFloat:=StrToFloat(grdContWithLocaItem.InplaceEditor.GetEditingText);
      data.qryContWithHouseItem.FieldByName('rent').AsFloat:= data.qryContWithHouseItem.FieldByName('areaactual').AsFloat*
                                                         data.qryContWithHouseItem.FieldByName('price').AsFloat;
   end;
end;

procedure TfrmContWithHouse.housenoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in Setdcs then
   begin
      with workbuildingselect  do
      if OkFlag then
      begin
        data.qryContWithHouseItem.edit;
        data.qryContWithHouseItem.FieldByName('houseno').AsString:=houseno;
        data.qryContWithHouseItem.FieldByName('bd_located').AsString:=bd_located;
        data.qryContWithHouseItem.FieldByName('ptlocname').AsString:=bd_floor;
        data.qryContWithHouseItem.FieldByName('areaactual').AsString:=bd_area;
      end;
   end;
end;

end.

