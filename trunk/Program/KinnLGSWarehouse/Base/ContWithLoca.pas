unit ContWithLoca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  SLV, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient ,DateUtils;

type
  TfrmContWithLoca = class(TForm)
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
    CL_BreakDate: TdxDBGridColumn;
    CreateUserName: TdxDBGridColumn;
    CHECKUSERNAME: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdSignDate: TdxDBDateEdit;
    CL_EffectDate: TdxDBGridColumn;
    CL_EndDate: TdxDBGridColumn;
    memRemark: TdxDBMemo;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCusID: TdxDBButtonEdit;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    grdCONTWITHLOCA: TdxDBGrid;
    KGroupBox2: TKGroupBox;
    KSText4: TKSText;
    KGroupBox3: TKGroupBox;
    ppmContWithLocaItem: TPopupMenu;
    mitAddItem: TMenuItem;
    mitDeleteItem: TMenuItem;
    GMSStickyLabel2: TGMSStickyLabel;
    edtContractNO: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    dtdEffectDate: TdxDBDateEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    edtSignWhere: TdxDBEdit;
    LastCountDate: TdxDBGridColumn;
    ContractNO: TdxDBGridColumn;
    AccountName: TdxDBGridColumn;
    CountUserName: TdxDBGridColumn;
    ACTCHKUserName: TdxDBGridColumn;
    btnCount: TKBitBtn;
    btnBreak: TKBitBtn;
    edtUsername: TdxDBButtonEdit;
    GMSStickyLabel20: TGMSStickyLabel;
    UserName: TdxDBGridColumn;
    dlgOpenFile: TOpenDialog;
    ppmAttachment: TPopupMenu;
    mitAddAtt: TMenuItem;
    mitDeleteAtt: TMenuItem;
    mitOpenAtt: TMenuItem;
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
    edtConCusId: TdxDBButtonEdit;
    GMSStickyLabel14: TGMSStickyLabel;
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
    GMSStickyLabel11: TGMSStickyLabel;
    ppmprint: TPopupMenu;
    MenuItem1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    conway: TdxDBGridColumn;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel31: TGMSStickyLabel;
    edtcolor1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    KSText5: TKSText;
    dtdBreakDate: TdxDBDateEdit;
    grdContWithLocaItem: TdxDBGrid;
    grmLocName: TdxDBGridButtonColumn;
    grmptlocnam: TdxDBGridButtonColumn;
    grmareaactual: TdxDBGridCurrencyColumn;
    grmareacapa: TdxDBGridCurrencyColumn;
    GMSStickyLabel23: TGMSStickyLabel;
    mitcontadd: TMenuItem;
    edtEndDate: TdxDBDateEdit;
    ckbCountRent: TdxDBCheckEdit;
    memendreason: TdxDBMemo;
    Locname: TdxDBGridColumn;
    GMSStickyLabel24: TGMSStickyLabel;
    KSText1: TKSText;
    grmBegindate: TdxDBGridDateColumn;
    grmFinishdate: TdxDBGridDateColumn;
    deposit: TdxDBGridColumn;
    ppmCount: TPopupMenu;
    mitMultCount: TMenuItem;
    payway: TdxDBGridColumn;
    edtPayway: TKinDbPickEdit;
    iocost: TdxDBGridColumn;
    N3: TMenuItem;
    edtOPID: TdxDBButtonEdit;
    GMSStickyLabel26: TGMSStickyLabel;
    opname: TdxDBGridColumn;
    ckbcountout: TdxDBCheckEdit;
    KGroupBox4: TKGroupBox;
    edtRent: TdxDBCalcEdit;
    cmbCostCurrency: TKinDbPickEdit;
    edtPrice: TdxDBCalcEdit;
    cmbAreaUOM: TKinDbPickEdit;
    edtAreaTotal: TdxDBCalcEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    edtdeposit: TdxDBCalcEdit;
    GMSStickyLabel25: TGMSStickyLabel;
    edtSkuclass: TdxDBEdit;
    GMSStickyLabel22: TGMSStickyLabel;
    KGroupBox5: TKGroupBox;
    lvAttachment: TKinListView;
    edtconway: TdxDBEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    dtdLastCountDate: TdxDBDateEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    edtaddress: TdxDBEdit;
    edtfax: TdxDBEdit;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    edttel: TdxDBEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    areatotal: TdxDBGridColumn;
    rent: TdxDBGridColumn;
    linkman: TdxDBGridColumn;
    tel: TdxDBGridColumn;
    address: TdxDBGridColumn;
    edtlinkman: TdxDBEdit;
    GMSStickyLabel32: TGMSStickyLabel;
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
    procedure qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure grdCONTWITHLOCACustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure qryCONTWITHLOCAAfterScroll(DataSet: TDataSet);
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
    procedure ckbCountRentChange(Sender: TObject);

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
    k:Integer;//计算计费几次
    maxCostItem,maxsno:Integer;
    DataState:TDataState;
    oldContWithLocaItem:string;
    sltContWithLocaItem:TStringList;
  end;

procedure WorkContWithLoca(CallMode:TDataState;pstrJobno:string);

var
  frmContWithLoca: TfrmContWithLoca;
  blnDelete:boolean;
  year,month,day:word;
  month_start,month_end:TDate;
implementation

{$R *.dfm}

uses Main,kindlg,Saveget,datas,find,ContCost,
     GetUserRight, datasTmp,libuserPub,DocBook,GetDllPub;


procedure WorkContWithLoca(CallMode:TDataState;pstrJobno:string);
begin
   if frmContWithLoca <> nil then
   with frmContWithLoca do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmContWithLoca:=TfrmContWithLoca.Create(application);
   with frmContWithLoca do
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

     sltContWithLocaItem:=TStringList.Create;
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
     //lzw20110929
     if _strsyscus='XSWL' then
     begin
        ckbCountRent.caption:='周转合同';
        GMSStickyLabel1.caption:='相关客户';
        frmContWithLoca.caption:='合同管理';

     end;

     decodedate(date,year,month,day);
     Month_Start:=encodedate(year,month,1);
     Month_End  :=IncMonth(Month_Start,1)-1;
     //lzw20110929
     if _strsyscus='XSWL'  THEN
     BEGIN
        if (strJobno='count')or (strJobno='htdq') then
           data.InitContWithLoca('')
        else
           data.InitContWithLoca(pstrJobno);

        if (trim(strJobno)='') or (strJobno='count')or (strJobno='htdq') then
        begin
           FilterSql:=' isnull(contwithloca.breakdate,"")="" ';
           with FindItem do
           begin
              Field.Add('7');
              operator.Add('0');
              value.Add(datetostr(Month_Start));
              Exp.Add('合同终止          等于           是');
           end;
           if (strJobno='count') then
              FilterSql:=FilterSql+' and 1=1    '+chr(13)+chr(10)
                                  //+' and exists(select top 1 * from costitem(nolock)      '+chr(13)+chr(10)
                                  //+'                 where costitem.jobno=contwithloca.jobno  '+chr(13)+chr(10)
                                  //+'                   and (getdate()-costitem.edate)>0      '+chr(13)+chr(10)
                                  //+'                 order by costdate desc     ) '+chr(13)+chr(10)
                                  +' and ((getdate()-contwithloca.lastcountdate)>0 or isnull(contwithloca.lastcountdate,"")="")  '+chr(13)+chr(10)
                                  +' and isnull(contwithloca.istemp,"")<>"T" ';

           if (strJobno='htdq') then
              FilterSql:=FilterSql+' and isnull(contwithloca.breakdate,"")=""               '+chr(13)+chr(10)
                                  +' and (getdate()-contwithloca.enddate)>=-30              '+chr(13)+chr(10) ;
        end else
           FilterSql:='';
     end else
     begin
        data.InitContWithLoca(pstrJobno);
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
     end;

     data.qryContWithLoca0.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

    // 界面显示过程
     if mode=stInsert then
     begin
       SetControlState(stInsert,true);
       data.qryContWithLoca.open;
       btnCopy.Click;
     end else
     begin
       if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitContWithLoca',trim(_userorgid));//设置按钮的有效性
       SetControlState(stBrowse,true);
       data.qryContWithLoca0.Open;
       WorkCall(stBrowse);
     end;
     SNO.Sorted:= csUp;
     {激活FORM}
     Show;
   end;
end;

procedure TfrmContWithLoca.WorkCall(CallMode:TDataState);
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
          data.qryContWithLoca0.Edit;
          EnableEdit;
          //记录修改档案
          data.qryContWithLoca.Edit;
          //在修改的状态下，对qryContWithLocaItem循环，为sltContWithLocaItem赋值
          sltContWithLocaItem.Clear;
          data.qryContWithLocaItem.DisableControls;
          Bookmark:= data.qryContWithLocaItem.GetBookmark;
          data.qryContWithLocaItem.First;
          while not data.qryContWithLocaItem.Eof do
          begin
             sltContWithLocaItem.Add(data.qryContWithLocaItem.FieldByName('Locname').AsString);
             data.qryContWithLocaItem.Next;
          end;
          data.qryContWithLocaItem.GotoBookmark(Bookmark);
          data.qryContWithLocaItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryContWithLocaItem.EnableControls;
          data.qryContWithLocaItemAfterScroll(data.qryContWithLocaItem);
         //在修改的状态下，对qryCostItem循环
          data.qryCostItem.DisableControls;
          Bookmark:= data.qryCostItem.GetBookmark;
          maxCostItem:=0;
          data.qryCostItem.First;
          while not data.qryCostItem.Eof do
          begin
            if data.qryCostItem.FieldByName('sno').AsInteger>maxCostItem
               then maxCostItem:=data.qryCostItem.FieldByName('sno').AsInteger;
            data.qryCostItem.Next;
          end;
          data.qryCostItem.GotoBookmark(Bookmark);
          data.qryCostItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCostItem.EnableControls;
          self.grdCostItemAfterScroll(data.qryCostItem);
         //在修改的状态下，对qryDocBook循环
          data.qryDocBook.DisableControls;
          Bookmark:= data.qryDocBook.GetBookmark;
          maxDocBook:=0;
          data.qryDocBook.First;
          while not data.qryDocBook.Eof do
          begin
            if data.qryDocBook.FieldByName('SNO').AsInteger>maxDocBook
               then maxDocBook:=data.qryDocBook.FieldByName('SNO').AsInteger;
            data.qryDocBook.Next;
          end;
          data.qryDocBook.GotoBookmark(Bookmark);
          data.qryDocBook.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryDocBook.EnableControls;
         //在修改的状态下，对qryccontwithlocaitem循环
          data.qryContWithLocaItem.DisableControls;
          Bookmark:= data.qryContWithLocaItem.GetBookmark;
          maxsno:=0;
          data.qryContWithLocaItem.First;
          while not data.qryContWithLocaItem.Eof do
          begin
            if data.qryContWithLocaItem.FieldByName('SNO').AsInteger>maxsno
               then maxsno:=data.qryContWithLocaItem.FieldByName('SNO').AsInteger;
            data.qryContWithLocaItem.Next;
          end;
          data.qryContWithLocaItem.GotoBookmark(Bookmark);
          data.qryContWithLocaItem.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryContWithLocaItem.EnableControls;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          data.qryContWithLoca0.Append;
          sltContWithLocaItem.Clear;
          oldContWithLocaItem:='';
          InitValues;
          EnableEdit;
          //记录档案创建信息
          data.qryContWithLoca.Edit;
          data.qryContWithLoca.FieldByName('CreateName').Asstring:=_LoginName;
          data.qryContWithLoca.fieldByname('CreateDate').AsDatetime:=date;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmContWithLoca.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
  SetControlState(DataState,False);
  if data.qryContWithLoca.FieldbyName('checkname').AsString='' then
    ActiveControl:=dtdSignDate
  else
    ActiveControl:=grdCostItem;
end;

procedure TfrmContWithLoca.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if data.qryContWithLoca0.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
  dtdBreakDate.ReadOnly:=True;
  memendreason.ReadOnly:=True;
  edtEndDate.ReadOnly:=True;
  memRemark.ReadOnly:=True;
  strcontractno:='';
  SetControlState(DataState,False);
end;

procedure TfrmContWithLoca.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmContWithLoca.InitValues;
{初始化时自动生成仓位代码}
begin
  strCTJobno:=genJobno('CL');
  data.qryContWithLoca.Edit;
  if blnCopy then
  begin
    blnCopy:=False;
    //qryCostEdit复制
    GatherFromArray(data.qryContWithLoca,arrContWithLoca,false);
    data.qryContWithLoca.FieldByName('JOBNO').Asstring:=strCTJobno;
    data.qryContWithLoca.fieldByname('UserID').AsString:=_UserID;
    data.qryContWithLoca.fieldByname('username').AsString:=_username;

    data.qryContWithLoca.FieldByName('Checkname').Asstring:='';
    data.qryContWithLoca.FieldByName('CheckDate').Clear;
    data.qryContWithLoca.FieldByName('CountName').Asstring:='';
    data.qryContWithLoca.FieldByName('CountDate').Clear;
//    data.qryContWithLoca.FieldByName('ACTCHKName').Asstring:='';
//    data.qryContWithLoca.FieldByName('ACTCHKDate').Clear;
    data.qryContWithLoca.FieldByName('breakdate').Clear;
    data.qryContWithLoca.FieldByName('LastCountDate').Clear;
    //qryContWithLocaItem复制
    data.qryContWithLocaItem.DisableControls;
    GatherFromArray(data.qryContWithLocaItem,arrContWithLocaITEM,true);
    with data.qryContWithLocaItem do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('jobno').AsString:=strCTJobno;
        FieldByName('UserID').Asstring:=_UserID;
        FieldByName('Username').Asstring:=_Username;

        sltContWithLocaItem.Add(FieldByName('locname').AsString);
        next;
      end;
      First;
    end;
    data.qryContWithLocaItem.EnableControls;
    data.qryContWithLocaItemAfterScroll(data.qryContWithLocaItem);
  end else
  begin
    //data.qryContWithLoca
    data.qryContWithLoca.FieldByName('JOBNO').Asstring:=strCTJOBNO;
    data.qryContWithLoca.FieldByName('UserID').Asstring:=_UserID;
    data.qryContWithLoca.FieldByName('username').Asstring:=_username;
    data.qryContWithLoca.FieldByName('costcurrcd').Asstring:=_currcd;
    data.qryContWithLoca.FieldByName('AreaUOM').Asstring:='平方米';
    data.qryContWithLoca.FieldByName('istemp').Asstring:='T';
    ckbCountRent.Checked:=true;

  end;
end;

procedure TfrmContWithLoca.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
  if blnConnect then
  begin
    data.qryContWithLoca.DataSource    :=data.dtsContWithLoca0;
    data.qryCostItem.datasource        :=data.dtsContWithLoca0;
    data.qryContWithLocaItem.datasource:=data.dtsContWithLoca0;
    data.qryDocBook.datasource         :=data.dtsContWithLoca0;
  end else
  begin
    data.qryContWithLoca.DataSource    :=nil;
    data.qryCostItem.DataSource        :=nil;
    data.qryContWithLocaItem.datasource:=nil;
    data.qryDocBook.datasource         :=nil;
  end;
end;

procedure TfrmContWithLoca.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
  if CallMode in SetDcs then
  begin
    //dtdBreakDate.ReadOnly:=True;
    if data.qryContWithLoca.FieldByName('CheckName').AsString<>'' then
    begin
      KGroupBox1.Enabled:=False;
      dtdBreakDate.ReadOnly:=True;
      memendreason.ReadOnly:=True;
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

function TfrmContWithLoca.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   strLocname:string;
begin
  Result:=False;
  if dtdSignDate.date=0 then
  begin
     Kmessagedlg(GetMessage('frmContWithLoca','001'), mtInformation,[mbOk],0);//'签订日期不可为空！'
     dtdSignDate.setFocus;
     exit;
  end else
  //lzw20111013
  if edtPayway.text='' then
  begin
     Kmessagedlg('结算方式不可为空！', mtInformation,[mbOk],0);//'结算不可为空！'
     edtPayway.setFocus;
     exit;
  end else
  if edtContractNO.text='' then
  begin
     Kmessagedlg('合同编号不可为空！', mtInformation,[mbOk],0);//'合同编号不可为空！'
     edtContractNO.setFocus;
     exit;
  end else
  if edtCusID.Text='' then
  begin
     Kmessagedlg(GetMessage('frmContWithLoca','002'), mtInformation,[mbOk],0);//'包仓客户不可为空！'
     edtCusID.setFocus;
     exit;
  end else
  if (edtAreaTotal.Value=0) and (not ckbCountRent.checked)then
  begin
     Kmessagedlg(GetMessage('frmContWithLoca','003'),mtInformation,[mbOk],0);//'包仓面积不可为空！'
     edtAreaTotal.setFocus;
     exit;
  end else
  if (cmbAreaUOM.Text='') and (not ckbCountRent.checked)  then
  begin
     Kmessagedlg(GetMessage('frmContWithLoca','004'), mtInformation,[mbOk],0);//'面积单位不可为空！'
     cmbAreaUOM.setFocus;
     exit;
  end else
  if (edtPrice.Value=0) and (not ckbCountRent.checked) then
  begin
     Kmessagedlg(GetMessage('frmContWithLoca','005'),mtInformation,[mbOk],0);//'单价不可为空！'
     edtPrice.setFocus;
     exit;
  end else
  if (edtRent.Value=0) and (not ckbCountRent.checked) then
  begin
     kMessageDlg(GetMessage('frmContWithLoca','006'),mtInformation,[mbOk],0);//'月租金不可为空！'
     edtRent.setFocus;
     exit;
  end else
  if dtdEffectDate.Date=0 then
  begin
     kMessageDlg(GetMessage('frmContWithLoca','007'),mtInformation,[mbOk],0);//'合同生效日期不可为空！'
     dtdEffectDate.SetFocus;
     exit;
  end else
  if edtEndDate.Date=0 then
  begin
     kMessageDlg(GetMessage('frmContWithLoca','008'),mtInformation,[mbOk],0);//'合同终止日期不可为空！'
     edtEndDate.setfocus;
     exit;
  end else
  if (dtdEffectDate.date>edtEndDate.date) then
  begin
     kMessageDlg(GetMessage('frmContWithLoca','009'),mtInformation,[mbOk],0);//'终止日期不能比生效日期早！'
     edtEndDate.setfocus;
     exit;
  end else
  begin
     if data.qryCostItem.FieldByName('Jobno').asstring='' then
     begin
       data.qryContWithLoca.Edit;
       data.qryContWithLoca.FieldByName('CountName').asstring:='';
       data.qryContWithLoca.FieldByName('CountDate').Clear;
       data.qryContWithLoca.FieldByName('LastCountDate').Clear;
     end else
     begin
       data.qryCostItem.Last;
       while not data.qryCostItem.Bof do
       begin
          if data.qryCostItem.FieldByName('Costcd').AsString='CZ' then
             Break
          else
             data.qryCostItem.Prior;
       end;
       data.qryContWithLoca.Edit;
       data.qryContWithLoca.FieldByName('LastCountDate').AsDatetime:=
          data.qryCostItem.FieldByName('edate').AsDatetime;
     end;
//     if  data.qryContWithLoca.FieldByName('checkname').asstring='' then
//     begin
        strLocname:='';
        data.qryContWithLocaItem.DisableControls;
        data.qryContWithLocaItem.First;
        while not data.qryContWithLocaItem.Eof do
        begin
           if data.qryContWithLocaItem.fieldbyname('finishdate').asstring='' then
           begin
              if Pos(data.qryContWithLocaItem.fieldbyname('LocName').asstring,strLocname)=0 then
                 strLocname:=strLocname+data.qryContWithLocaItem.fieldbyname('LocName').asstring+',';
           end;
           data.qryContWithLocaItem.Next;
        end;
        data.qryContWithLocaItem.EnableControls;
        data.qryContWithLocaItem.First;
        data.qryContWithLoca.Edit;
        data.qryContWithLoca.FieldByName('locname').AsString:=Copy(strLocname,1,Length(strLocname)-1);
//     end;

     data.qryContWithLoca0.Edit;
     data.qryContWithLoca0.FieldByName('Jobno').AsString:=data.qryContWithLoca.FieldByName('Jobno').AsString;
     data.qryContWithLoca0.FieldByName('SignDate').AsString:=data.qryContWithLoca.FieldByName('SignDate').AsString;
     data.qryContWithLoca0.FieldByName('ContractNO').AsString:=data.qryContWithLoca.FieldByName('ContractNO').AsString;
     data.qryContWithLoca0.FieldByName('cusname').AsString:=data.qryContWithLoca.FieldByName('cusname').AsString;
     data.qryContWithLoca0.FieldByName('effectdate').AsString:=data.qryContWithLoca.FieldByName('effectdate').AsString;
     data.qryContWithLoca0.FieldByName('enddate').AsString:=data.qryContWithLoca.FieldByName('enddate').AsString;
     data.qryContWithLoca0.FieldByName('iusername').AsString:=data.qryContWithLoca.FieldByName('iusername').AsString;
     data.qryContWithLoca0.FieldByName('LastCountDate').AsString:=data.qryContWithLoca.FieldByName('LastCountDate').AsString;
     data.qryContWithLoca0.FieldByName('breakdate').AsString:=data.qryContWithLoca.FieldByName('breakdate').AsString;
     data.qryContWithLoca0.FieldByName('createname').AsString:=data.qryContWithLoca.FieldByName('createname').AsString;
     data.qryContWithLoca0.FieldByName('checkname').AsString:=data.qryContWithLoca.FieldByName('checkname').AsString;
     data.qryContWithLoca0.FieldByName('countname').AsString:=data.qryContWithLoca.FieldByName('countname').AsString;
     data.qryContWithLoca0.FieldByName('costcheckname').AsString:=data.qryContWithLoca.FieldByName('costcheckname').AsString;
     data.qryContWithLoca0.FieldByName('locname').AsString:=strLocname;
     Result:=True;
  end;
end;


procedure TfrmContWithLoca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmContWithLoca.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetGroupbox(KGroupBox3);
  SetGroupbox(KGroupBox4);
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

procedure TfrmContWithLoca.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmContWithLoca.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  sltContWithLocaItem.Free;
  Application.onShowhint := nil;
  data.qryContWithLoca.Close;
  data.qryContWithLocaItem.Close;
  data.qryCostItem.Close;
  data.qryDocBook.Close;
  frmContWithLoca:=nil
end;

procedure TfrmContWithLoca.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
end;

procedure TfrmContWithLoca.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
end;

procedure TfrmContWithLoca.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmContWithLoca.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=data.qryContWithLoca0.fieldbyname('jobno').asstring;
  data.qryContWithLoca0.DisableControls;
  data.qryContWithLoca0.Close;
  data.qryContWithLoca0.Open;
  try
    data.qryContWithLoca0.locate('jobno',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    data.qryContWithLoca0.Last;
  end;
  data.qryContWithLoca0.EnableControls;
end;

procedure TfrmContWithLoca.btnEditClick(Sender: TObject);
begin
  if (data.qryContWithLoca0.FieldByName('CreateName').asstring<>_LoginName)  and (_loginid<>'SYSTEM') then
  begin
    kMessageDlg(GetMessage('frmContWithLoca','010'),mtWarning,[mbOK],0);//'该包仓合同不是您输入的，不能修改！'
    exit;
  end;
  if data.qryContWithLoca0.FieldByName('CHECKNAME').asstring<>'' then
  begin
    kMessageDlg(GetMessage('frmContWithLoca','011'),mtWarning,[mbOK],0);//'该包仓合同已经审核，不能修改！'
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
  strcontractno:='';
  strcontractno:=data.qryContWithLoca0.FieldByName('ContractNO').asstring;
  SetDetailActive(False,True);
  SetMasterDetailState(False);
  WorkCall(stEdit);
end;

procedure TfrmContWithLoca.btnAddClick(Sender: TObject);
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

  if pgcMain.ActivePage=tbsEdit then
    SetDetailActive(False,True);
  Workcall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmContWithLoca.btnDeleteClick(Sender: TObject);
begin
  if (data.qryContWithLoca0.FieldByName('CreateName').asstring<>_LoginName) and (_loginid<>'SYSTEM') then
  begin
    kMessageDlg(GetMessage('frmContWithLoca','012'),mtWarning,[mbOK],0);//'该包仓合同不是您输入的，不能删除！'
    exit;
  end;
  if data.qryContWithLoca0.FieldByName('CheckName').asstring<>'' then
  begin
    kMessageDlg(GetMessage('frmContWithLoca','013'),mtWarning,[mbOK],0);//'该包仓合同已审核，不能删除！'
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
                     +' where jobno="'+data.qryContWithLoca0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,'delete from  contwithlocaitem'
                     +' where jobno="'+data.qryContWithLoca0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,'delete from  CostItem '
                     +' where jobno="'+data.qryContWithLoca0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                             +'  where jobno="'+data.qryContWithLoca0.FieldByName('jobno').AsString+'" ');
      data.qryContWithLoca0.Delete;
      data.qryContWithLoca0.Applyupdates;
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
    data.qryContWithLoca0.CommitUpdates;
    SetMasterDetailState(True);
    if pgcMain.ActivePage=tbsEdit then
      SetDetailActive(True,True);
    btnRefresh.Click;
    workcall(stbrowse);
  end;
end;

procedure TfrmContWithLoca.btncopyClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  SetDetailActive(False,True);

  arrContWithLoca:=ScatterToArray(data.qryContWithLoca,true,0);
  arrContWithLocaItem:=ScatterToArray(data.qryContWithLocaItem,false,0);
  blnCopy:=True;
  edtEndDate.ReadOnly:=false;
  memRemark.ReadOnly:=False;
  WorkCall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmContWithLoca.btnFindClick(Sender: TObject);
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

procedure TfrmContWithLoca.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryContWithLoca,dataTmp.qryFind);
end;

procedure TfrmContWithLoca.btnFilterClick(Sender: TObject);
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

      Para.Exp.add('');
{0}   Para.Toptic.Add('包仓客户');
{1}   Para.Toptic.Add('合同编号');
{2}   Para.Toptic.Add('签订日期');
{3}   Para.Toptic.Add('月 租 金');
{4}   Para.Toptic.add('工 作 号');

{0}   para.Ftype.add('E');
{1}   para.Ftype.add('C');
{2}   Para.Ftype.add('D');
{3}   Para.Ftype.add('N');
{4}   para.Ftype.add('C');

   Para.RField.add('ContWithLoca.jobno');
   if filterSql<>'' then
        Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     data.qryContWithLoca0.DisableControls;
     data.qryContWithLoca0.Close;

     if strTmp<>'' then
       data.qryContWithLoca0.MacroByName('Where').AsString:=strTmp
     else
       data.qryContWithLoca0.MacroByName('Where').AsString:='1=1';
     data.qryContWithLoca0.Open;
     data.qryContWithLoca0.EnableControls;
   end;
   workcall(stbrowse);

end;

procedure TfrmContWithLoca.btnSaveClick(Sender: TObject);
begin
  if (DataState in setDcs) and Gather then //新增或编辑存盘
  begin
    try
      blnWare:=True;
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          data.qryContWithLoca.Post;
          data.qryContWithLoca0.ApplyUpdates;
          data.qryContWithLoca.ApplyUpdates;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             data.udsContWithLoca.modifysql.text + chr(13) +
             data.udsContWithLoca.DeleteSql.text + chr(13) +
             data.udsContWithLoca.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             blnWare:=False;
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( data.qryContWithLoca.FieldByName('Jobno').AsString + GetMessage('frmContWithLoca','014'));//'已经被使用。程序正在查找其他可用客户编号...'
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               strCTjobno := genJobno('CL',_DataBaseID);
               if strCTjobno = '' then
               begin
                 KmessageDlg(GetMessage('frmContWithLoca','015'), mtInformation, [mbOk], 0);//'没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 data.qryContWithLoca.Edit;
                 data.qryContWithLoca.FieldByName('Jobno').AsString := strCTJobno;
                 data.qryContWithLoca.FieldByName('KeyID').AsString := data.qryContWithLoca.FieldByName('Jobno').AsString;
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
      //lzw20110413
      //_StrSysCus:='XSWL';
      if (_StrSysCus='XSWL') then
      begin
         if (DataState=stinsert ) then
         begin
            execsql(dataTmp.qryTmp,' insert into showwarnorder       '+ #13#10 +
                                   '        (jobno,jobnoin,mainorder,blno,accjobno,buskind,iuserid,iusername,       '+ #13#10 +
                                   '        customsno,cusname,sendname,senddate,userorgid,userorgname,   '+ #13#10 +
                                   '        showed,receid,effectdate,enddate ) '+ #13#10 +
                                   ' select jobno,jobno,ContractNO,ContractNO,ContractNO,"包仓",userid,username,  '+ #13#10 +
                                   '        ContractNO,cusname,createname,createdate,"'+_userorgid+'","'+_userorgname+'", '+ #13#10 +
                                   '        "F","F" ,effectdate,enddate '+ #13#10 +
                                   '   from contwithloca(nolock) '+#13#10+
                                   '  where jobno="'+data.qryContWithLoca.FieldByName('jobno').AsString+'"'
                   );
         end;
         if  (DataState=stedit ) then
         begin
            execsql(dataTmp.qryTmp,' update showwarnorder   set   '+ #13#10 +
                                   '        effectdate=contwithloca.effectdate,enddate=contwithloca.enddate  '+#13#10+
                                   '   from contwithloca(nolock)                       '+#13#10+
                                   '  where showwarnorder.jobno=contwithloca.jobno     '+#13#10+
                                   '    and contwithloca.jobno="'+data.qryContWithLoca.FieldByName('jobno').AsString+'"'
                   );
         end;
      end;
      if not blnWare then
      begin
        //移仓明细
        data.qryCostItem.DisableControls;
        data.qryCostItem.first;
        while not data.qryCostItem.eof do
        begin
           data.qryCostItem.Edit;
           data.qryCostItem.fieldbyname('JOBNO').asstring:=data.qryContWithLoca.fieldbyname('JOBNO').asstring;
           data.qryCostItem.Post;
           data.qryCostItem.next;
        end;
        data.qryCostItem.first;
        data.qryCostItem.EnableControls;

        //包仓
        data.qryContWithLocaItem.DisableControls;
        data.qryContWithLocaItem.first;
        while not data.qryContWithLocaItem.eof do
        begin
           data.qryContWithLocaItem.Edit;
           data.qryContWithLocaItem.fieldbyname('JOBNO').asstring:=data.qryContWithLoca.fieldbyname('JOBNO').asstring;
           data.qryContWithLocaItem.Post;
           data.qryContWithLocaItem.next;
        end;
        data.qryContWithLocaItem.first;
        data.qryContWithLocaItem.EnableControls;

        //相关文档
        data.qryDocBook.DisableControls;
        data.qryDocBook.first;
        while not data.qryDocBook.eof do
        begin
           data.qryDocBook.Edit;
           data.qryDocBook.fieldbyname('JOBNO').asstring:=data.qryContWithLoca.fieldbyname('JOBNO').asstring;
           data.qryDocBook.Post;
           data.qryDocBook.next;
        end;
        data.qryDocBook.first;
        data.qryDocBook.EnableControls;

      end;

      data.qryCostItem.applyupdates;
      data.qryContWithLocaItem.applyupdates;
      data.qryDocBook.ApplyUpdates;

      _ADOConnection.Commit;
    except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      Exit;
    end;
    data.qryContWithLoca0.CommitUpdates;
    data.qryContWithLoca.commitUpdates;
    data.qryCostItem.commitUpdates;
    data.qryContWithLocaItem.commitUpdates;
    data.qryDocBook.commitUpdates;

    SetMasterDetailState(True);
    WorkCall(stBrowse);
  end;
end;

procedure TfrmContWithLoca.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  if DataState=stInsert then
     ExecSql(dataTmp.qryTmp,' delete from genjobno '
                           +'  where jobno="'+data.qryContWithLoca.FieldByName('jobno').AsString+'" ');
  data.qryCostItem.CancelUpdates;
  data.qryContWithLocaItem.CancelUpdates;
  data.qryContWithLoca.CancelUpdates;
  data.qryContWithLoca0.CancelUpdates;
  data.qryDocBook.CancelUpdates;
  ScatterToLV;

  SetMasterDetailState(True);
  WorkCall(stBrowse);
  btnRefreshclick(self);
end;

procedure TfrmContWithLoca.btnCheckClick(Sender: TObject);
begin
   btnCheck.PopUp;
end;

procedure TfrmContWithLoca.btnPrintClick(Sender: TObject);
begin
 { WorkContWithLocaOut(data.qryContWithLoca.Fieldbyname('AccountID').asstring,
                      data.qryContWithLoca.Fieldbyname('AccountName').asstring,
                      data.qryContWithLoca.Fieldbyname('ContractNO').asstring);}
end;

procedure TfrmContWithLoca.mitFilterActiveClick(Sender: TObject);
begin
  grdContWithLoca.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmContWithLoca.grdCostItemAfterScroll(DataSet: TDataSet);
begin
{  if DataState in Setdcs then
  begin
    if (data.qryCostItem.FieldByName('SNO').AsInteger<>-10) and
       (data.qryCostItem.FieldByName('SNO').AsInteger<>0) then
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
  if (data.qryCostItem.fieldByname('CostCD').asString<>'')  then
    result:=true;
end; }

procedure TfrmContWithLoca.grdCostItemDblClick(Sender: TObject);
begin
 { if data.qryCostItem.fieldbyname('cti_in').Asfloat > 0 then
    if data.qryCostItem.fieldbyname('jobno1').AsString <> '' then  
//      workAppliInvo(nil, data.qryCostItem.fieldbyname('jobno1').AsString)
    else
      KMessageDlg('该笔未开发票！', mtInformation, [mbOk], 0)
  else if data.qryCostItem.fieldbyname('jobno1').AsString <> '' then
//    workAppliMoney(nil, data.qryCostItem.fieldbyname('jobno1').AsString)
  else KMessageDlg('该笔未请款！', mtInformation, [mbOk], 0);}
end;

procedure TfrmContWithLoca.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if blnPage then
  begin
    data.qryContWithLoca.Close;
    data.qryContWithLoca.Open;
    data.qryContWithLocaItem.Close;
    data.qryContWithLocaItem.Open;
    data.qryCostItem.Close;
    data.qryCostItem.Open;
    data.qryDocBook.Close;
    data.qryDocBook.Open;
  end else
  begin
    data.qryContWithLoca.Active    :=blnOpen;
    data.qryCostItem.Active        :=blnOpen;
    data.qryContWithLocaItem.Active:=blnOpen;
    data.qryDocBook.Active         :=blnOpen;
  end;
end;

function TfrmContWithLoca.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmContWithLoca.edtCusIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if data.qryContWithLoca.FieldByName('iusername').AsString<>'' then
   begin
      if (DataState in Setdcs)  then
      begin
         qrySelect:=pGetCustomerSelect('B','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryContWithLoca.edit;
            data.qryContWithLoca.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryContWithLoca.FieldByName('cusName').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         freeandnil(qrySelect);
         //lzw20090402
         if getSysdata('cusname')='SWZ' then
         begin
            OpenSql(datatmp.qryTmp,'select * from contract (nolock)    '+chr(13)+chr(10)
                                  +' where signcusid="'+data.qryContWithLoca.fieldbyname('cusid').AsString+'"  '+chr(13)+chr(10)
                                  +'   and convert(char(10),isnull(ContractStaDate,0),102)<=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                                  +'   and convert(char(10),isnull(ContractEndDate,0),102)>=convert(char(10),"'+datetostr(getserverdate)+'",102)'
                               );
            if datatmp.qryTmp.RecordCount<>0 then
            begin
               data.qryContWithLoca.FieldByName('ContractNO').AsString  :=datatmp.qryTmp.FieldByName('contractno').asstring;
               data.qryContWithLoca.FieldByName('effectdate').AsString  :=datatmp.qryTmp.FieldByName('ContractStaDate').asstring;
               data.qryContWithLoca.FieldByName('enddate').AsString  :=datatmp.qryTmp.FieldByName('ContractEndDate').asstring;
            end;
         end;
      end;
   end else
   begin
      KMessageDlg('请先选择执行组织！',mtWarning,[mbOK],0);
      ActiveControl:=edtUsername;
      Exit;
   end;
end;

procedure TfrmContWithLoca.edtCti_whoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostItem.edit;
         data.qryCostItem.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCostItem.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmContWithLoca.pgcMainChange(Sender: TObject);
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

procedure TfrmContWithLoca.qryCONTWITHLOCAUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
//
end;

procedure TfrmContWithLoca.grdCONTWITHLOCACustomDrawCell(Sender: TObject;
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
  if ANode.Values[LastCountDate.Index]<>null then
  begin
    DecodeDate(ANode.Values[CL_EndDate.Index],Year, Month, Day);
    DecodeDate(ANode.Values[LastCountDate.Index],YearLast, MonthLast, DayLast);
    if (Year=YearLast) and (Month=MonthLast) then AFont.Color:= clBlue;
  end;
  if (ANode.Values[CL_EndDate.Index]<=Now) then  AFont.Color:=clFuchsia;

  if (ANode.Values[CL_BreakDate.Index]<>null)  then
  begin
    AFont.Color:= clRed;
  end;

  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;
end;

procedure TfrmContWithLoca.qryCONTWITHLOCAAfterScroll(DataSet: TDataSet);
begin
  if (DataState = stBrowse) and (pgcMain.ActivePage=tbsBrowse) then
  begin
    data.qryCostItem.Close;
    data.qryContWithLocaItem.Close;
  end;
end;

procedure TfrmContWithLoca.mitAddItemClick(Sender: TObject);
begin
   grdContWithLocaITEM.SetFocus;
   data.qryContWithLocaItem.Append;
end;

procedure TfrmContWithLoca.mitDeleteItemClick(Sender: TObject);
begin
   if data.qryContWithLocaItem.FieldByName('sno').AsInteger<>0 then
    if Kmessagedlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       if sltContWithLocaItem.IndexOf(data.qryContWithLocaItem.FieldByName('locname').asstring)<>-1 then
          sltContWithLocaItem.Delete(sltContWithLocaItem.IndexOf(data.qryContWithLocaItem.FieldByName('locname').asstring));
       grdContWithLocaITEM.setfocus;
       data.qryContWithLocaItem.Delete;
    end;
end;

procedure TfrmContWithLoca.btnCountClick(Sender: TObject);
var
   i,m:Integer;
   blnCanCount:Boolean;
begin
   if _strsyscus='XSWL' then
   begin
      if edtEndDate.Date=0 then
      begin
         kMessageDlg('合同结束日期为空不能自动计费,请手工计费！',mtInformation,[mbOk],0);//'合同终止日期不可为空！'
         exit;
      end;
      if edtAreaTotal.text='' then
      begin
         kMessageDlg('包仓面积不能为空！',mtInformation,[mbOk],0);
         exit;
      end;
      if edtPrice.text='' then
      begin
         kMessageDlg('包仓单价不能为空！',mtInformation,[mbOk],0);
         exit;
      end;
      if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      _pgbClear.Visible:=True;
      _pgbClear.Position:=0;
      k:=0;
      _pgbClear.Max:=grdCONTWITHLOCA.SelectedCount;
      _labPro.Caption:='共'+inttostr(grdCONTWITHLOCA.SelectedCount)+'笔';
      for i:=grdCONTWITHLOCA.SelectedCount-1 Downto 0 do
      begin
         data.qryContWithLoca0.GotoBookmark(Pointer(grdCONTWITHLOCA.SelectedRows[i]));
         if data.qryContWithLoca0.FieldByName('checkname').AsString<>'' then
         begin
            blnCanCount:=False;
            if data.qryContWithLoca0.FieldByName('payway').AsString='月' then
            begin
               //lzw20110228if Date-data.qryContWithHouse0.fieldbyname('LastCountDate').AsDateTime+1>31 then
               if data.qryContWithLoca0.fieldbyname('enddate').AsDateTime-data.qryContWithLoca0.fieldbyname('LastCountDate').AsDateTime+1>31 then
                  blnCanCount:=True;
            end else
            begin
               //if Date-data.qryContWithHouse0.fieldbyname('LastCountDate').AsDateTime+1>92 then
               if data.qryContWithLoca0.fieldbyname('enddate').AsDateTime-data.qryContWithLoca0.fieldbyname('LastCountDate').AsDateTime+1>92 then
                  blnCanCount:=True;
            end;
            if blnCanCount then
            begin
               CountCost;
               //lzw20110105
               if edtPayway.Text<>'一次性' then
               begin
                  //取得计算次数
                  begin
                     m:=Trunc((MonthsBetween(edtEndDate.Date,dtdEffectDate.Date)+1)/(StrToInt(edtPayway.TextField)));
                  end;
                  for m:=0 to m-1 do
                  begin
                     k:=k+1;
                     mitAddCOSTITEMClick(mitAddCOSTITEM);
                  end;
               end else
               begin
                  data.qryCostItem.append;
                  data.qryCostItem.fieldbyname('Jobno').asstring :=data.qryContWithLoca.fieldbyname('Jobno').asstring;
                  data.qryCostItem.fieldbyname('userid').asstring:=data.qryContWithLoca.fieldbyname('userid').asstring;
                  data.qryCostItem.fieldbyname('snosku').AsInteger:=-10;

                  data.qryCostItem.fieldbyname('sno').Asinteger:=-1;
                  data.qryCostItem.fieldbyname('costcusid').AsString:=iif(data.ContWithLoca_CopyWho='',frmContWithloca.edtCusID.TextField,data.ContWithLoca_CopyWho);
                  data.qryCostItem.fieldbyname('costcusname').AsString:=iif(data.ContWithLoca_CopyWhoname='',frmContWithloca.edtCusID.Text,data.ContWithLoca_CopyWhoname);

                  if blnIsCZ then
                  begin
                     data.qryCostItem.FieldByName('notauto').AsString:='F';

                     data.qryCostItem.fieldbyname('costcd').AsString:='CZ';

                     if edtPayway.Text='一次性' then
                     begin
                        data.qryCostItem.fieldbyname('costin').AsFloat:=data.qryContWithloca.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithloca.fieldbyname('enddate').AsFloat,data.qryContWithloca.fieldbyname('effectdate').AsFloat));
                        data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(data.qryContWithloca.fieldbyname('enddate').AsDateTime);
                        if data.ContWithLoca_CopyDate='' then
                        begin
                           data.qryCostItem.fieldbyname('costdate').AsString:=frmContWithloca.dtdEffectDate.Text

                        end;
                        data.qryCostItem.fieldbyname('sdate').AsString:=data.qryCostItem.fieldbyname('costdate').AsString
                     end;
                  end;
               end;

               btnSave.SetFocus;
               btnSave.Click;
            end;
         end else
         begin
            KMessageDlg('未经审核,不能计费', mtInformation, [mbOk], 0);
            exit;
         end;
         _pgbClear.StepBy(1);
      end;
      _pgbClear.Visible:=False;
      _labPro.Caption:='运行进度';
   end else
   begin
      if data.qryContWithloca0.FieldByName('CHECKNAME').asstring='' then
      begin
         kMessageDlg(GetMessage('frmContWithHouse','022'),mtWarning,[mbOK],0);//'该包仓合同未经审核，不能计费！'
         exit;
      end;
      CountCost;
   end;
end;

procedure TfrmContWithLoca.btnBreakClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  if data.qryContWithLoca.FieldByName('breakdate').AsDateTime=0 then
  begin
    if KmessageDlg(GetMessage('frmContWithLoca','023'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将终止本包仓合同的执行,您确定要终止吗?'
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
      memendreason.ReadOnly:=false;
//      dtdBreakDate.ReadOnly:=False;
      dtdBreakDate.Setfocus;
    end;
  end else
  begin
    if KmessageDlg(GetMessage('frmContWithLoca','024'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'该操作将取消终止本包仓合同,您确定要取消吗?'
    begin
      SetMasterDetailState(False);
      _ADOConnection.startTransaction;
      try
         data.qryContWithLoca.Edit;
         data.qryContWithLoca.FieldByName('breakdate').Clear;
         data.qryContWithLoca.FieldByName('endreason').clear;
         data.qryContWithLoca.Applyupdates;
         _ADOConnection.Commit;
      except
         _ADOConnection.RollBack;
         SetMasterDetailState(True);
         raise;
         exit;
      end;
      data.qryContWithLoca.CommitUpdates;

      SetMasterDetailState(True);
      workcall(stbrowse);
    end;
  end;
end;

procedure TfrmContWithLoca.edtAreaTotalExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
  if DataState in Setdcs then
  begin
    data.qryContWithLoca.Edit;
    data.qryContWithLoca.FieldByName('Rent').AsFloat:=edtAreaTotal.Value*edtPrice.Value;
  end;
end;

procedure TfrmContWithLoca.edtCTI_ReasonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('T','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryCostItem.edit;
      data.qryCostItem.FieldByName('reason').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithLoca.edtUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qryContWithLoca.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qryContWithLoca.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmContWithLoca.mitAddAttClick(Sender: TObject);
begin
  with AddFileItem(lvAttachment) do
  if FileName <> '' then
  begin
    data.qryDocBook.Append;
    data.qryDocBook.FieldByName('DocType').AsString := '相关文档';//文档类别
    data.qryDocBook.FieldByName('DOCID').AsString := data.qryContWithLoca.fieldbyname('Jobno').AsString;
    data.qryDocBook.FieldByName('FilesName').AsString := FileName;//文件名
    TBlobField(data.qryDocBook.FieldByName('FilesContent')).LoadFromStream(FileContent);//文件内容
    data.qryDocBook.Post;
    //
    FreeAndNil(FileContent);
  end;
end;

procedure TfrmContWithLoca.mitDeleteAttClick(Sender: TObject);
var
  blnNeedReload: Boolean;
begin
  if lvAttachment.ItemIndex = -1 then
  begin
    KMessageDlg(GetMessage('frmContWithLoca','025'),mtWarning,[mbOk],0);//'没有选择附件,不能删除'
    exit;
  end;
  if KMessageDlg(GetMessage('frmContWithLoca','026'),mtConfirmation,[mbYes,mbNO],0)=mrYes then//'确认删除所选择附件?'
  begin
    if data.qryDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]) then
    begin
      if lvAttachment.Items.Count -1 > lvAttachment.ItemIndex then
        blnNeedReload := True;
      data.qryDocBook.Edit;
      data.qryDocBook.Delete;
      lvAttachment.Items[lvAttachment.ItemIndex].Focused := True;
      lvAttachment.Items[lvAttachment.ItemIndex].Delete;
      if blnNeedReload then  ScatterToLV;
      if lvAttachment.Items.Count > 0 then lvAttachment.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmContWithLoca.mitOpenAttClick(Sender: TObject);
begin
  if not (DataState in setDcs) then
  if lvAttachment.ItemIndex <>-1 then
  begin
    data.qryDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]);
    OpenItemFile(data.qryDocBook.FieldByName('filesname').AsString,TBlobField(data.qryDocBook.FieldByName('FilesContent')));
  end;
end;

procedure TfrmContWithLoca.ScatterToLV;
var
  strFileName: string;
  ListItem: TListItem;
begin
//  if _blnUseHtDocBook then//文档管理
  if data.qryDocBook.Active then
  begin
    if data.qryDocBook.FieldByName('DOCID').AsString <> '' then
    begin
//      lvAttachment.Visible := True;
//      spdAttachment.Down := True;
    end else
    begin
//      lvAttachment.Visible := False;
//      spdAttachment.Down := False;
    end;
    //
    data.qryDocBook.First;
    lvAttachment.Items.Clear;
    while not data.qryDocBook.Eof do
    begin
      if data.qryDocBook.FieldByName('FilesName').AsString <> '' then
      begin
        strFileName := data.qryDocBook.FieldByName('FilesName').AsString;
        ListItem := lvAttachment.Items.Add;
        ListItem.Caption := strFileName;
        SetFileImageIndex(ListItem,lvAttachment.ViewStyle=vsIcon);
      end;
      data.qryDocBook.Next;
    end;
  end;
end;

procedure TfrmContWithLoca.grdCONTWITHLOCAChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
  ScatterToLV;
end;

{procedure TfrmCONTWITHLOCA.edtCTI_PriceExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (data.qryCostItem.FieldByName('CTI_Price').AsFloat<>0) and (data.qryCostItem.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      data.qryCostItem.Edit;
      data.qryCostItem.FieldByName('cti_in').AsFloat:=data.qryCostItem.FieldByName('CTI_Price').AsFloat*data.qryCostItem.FieldByName('CTI_Quantity').AsFloat;
   end;
end; }

{procedure TfrmCONTWITHLOCA.edtCTI_QuantityExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if (data.qryCostItem.FieldByName('CTI_Price').AsFloat<>0) and (data.qryCostItem.FieldByName('CTI_Quantity').AsFloat<>0) then
   begin
      data.qryCostItem.Edit;
      data.qryCostItem.FieldByName('cti_in').AsFloat:=data.qryCostItem.FieldByName('CTI_Price').AsFloat*data.qryCostItem.FieldByName('CTI_Quantity').AsFloat;
   end;
end;}

procedure TfrmContWithLoca.grdCostItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) or (data.qryContWithLoca.FieldByName('CheckName').AsString='') then
      Allow:=False
   else
   begin
      if (data.qryCostitem.FieldByName('IOCOST').AsFloat<>0) or
      (data.qryCostitem.FieldByName('IOCHARGE').AsFloat<>0) or
      (data.qryCostitem.FieldByName('IOINVO').AsFloat<>0) or
      (data.qryCostitem.FieldByName('COSTCHECKNAME').AsString<>'') or
      (data.qryCostitem.FieldByName('DEPARTCHK').AsString<>'') or
      (data.qryCostitem.FieldByName('VOUCHERNO').AsString<>'') then
         Allow:=False
      else
         Allow:=True;
   end;
end;


procedure TfrmContWithLoca.dtdCTI_EDateValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  if (DataState in Setdcs) and (grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index]<>0) and (grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index]<>0)
    and (grdCostItem.FocusedNode.Values[edtCTI_CountDay.Index]=0) then
    grdCostItem.FocusedNode.Values[edtCTI_CountDay.Index]:=grdCostItem.FocusedNode.Values[dtdCTI_EDate.Index]-grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index];
end;

procedure TfrmContWithLoca.edtCTI_QuantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (data.qryCostItem.FieldByName('costrate').AsFloat<>0) and (data.qryCostItem.FieldByName('Quantity').AsFloat<>0) then
   begin
      data.qryCostItem.Edit;
      //lzw20100226
      if ckbcountout.Checked then
         data.qryCostItem.FieldByName('costout').AsFloat:=data.qryCostItem.FieldByName('costrate').AsFloat*data.qryCostItem.FieldByName('Quantity').AsFloat
      else
         data.qryCostItem.FieldByName('costin').AsFloat:=data.qryCostItem.FieldByName('costrate').AsFloat*data.qryCostItem.FieldByName('Quantity').AsFloat;
   end;
end;

procedure TfrmContWithLoca.edtCTI_PriceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (data.qryCostItem.FieldByName('costrate').AsFloat<>0) and (data.qryCostItem.FieldByName('Quantity').AsFloat<>0) then
   begin
      data.qryCostItem.Edit;
      //lzw20100226
      if ckbcountout.Checked then
        data.qryCostItem.FieldByName('costout').AsFloat:=data.qryCostItem.FieldByName('costrate').AsFloat*data.qryCostItem.FieldByName('Quantity').AsFloat
      else
        data.qryCostItem.FieldByName('costin').AsFloat:=data.qryCostItem.FieldByName('costrate').AsFloat*data.qryCostItem.FieldByName('Quantity').AsFloat;
   end;
end;

procedure TfrmContWithLoca.grdCostItemKeyDown(Sender: TObject;
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

procedure TfrmContWithLoca.grdCostItemEnter(Sender: TObject);
begin
{  if (DataState in setdcs) and (data.qryCostItem.fieldbyname('SNO').AsInteger=0)and(blnAddCost) then
  begin
    {if (data.qryCostItem.RecordCount=0) and (data.qryContWithLoca.fieldbyname('effectdate').asstring='')then
    begin
      KMessageDlg('请先填写包仓起始日期！',mtWarning,[mbOK],0);
      dtdEffectDate.SetFocus;
      Exit;
    end;
    mitAddCOSTITEMClick(Sender);
  end;  }
end;

procedure TfrmContWithLoca.grdCostItemExit(Sender: TObject);
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

procedure TfrmContWithLoca.grdCostItemChangeNodeEx(Sender: TObject);
begin
{  if grdCostItem.Datalink.DataSet.State = dsInsert then
  begin
     grdCostItemBeforeInsert(blnIsCZ);
  end;}
end;

procedure TfrmContWithLoca.edtConCusIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin 
   if (DataState in Setdcs)  then
   begin
      qrySelect:=pGetCustomerSelect('B','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then  
      begin
         data.qryContWithLoca.edit;
         data.qryContWithLoca.FieldByName('concusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryContWithLoca.FieldByName('concusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      freeandnil(qrySelect);
   end;
end;

procedure TfrmContWithLoca.edtCusIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcusid.Text='' then
      begin
         data.qryContWithLoca.Edit;
         data.qryContWithLoca.FieldByName('cusid').AsString:='';
         data.qryContWithLoca.FieldByName('cusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryContWithLoca.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryContWithLoca.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
      
      decodedate(Now,Year,Month,Day);//分解当前日期
      OpenSql(dataTmp.qryTmp,'select iscontract=isnull(iscontract,"F"),IsYear=isnull(IsYear,"F"), '
                            +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                            +'        ishelpnoct=rtrim(isnull(ishelpnoct,"")) '
                            +'   from organization (nolock)  '
                            +'  where userid="'+data.qryContWithLoca.FieldByName('iuserid').AsString+'" ');
      if (datatmp.qryTmp.FieldByName('iscontract').AsString='T') and (edtContractNO.text='') then
      begin
         StrCusInvo:='';
         strdate:='';
         StrCusInvo:=datatmp.qryTmp.FieldByName('ishelpnoct').AsString;
         if datatmp.qryTmp.FieldByName('IsYear').AsString='T' then
            strdate:=strdate+copy(IntToStr(Year),3,2);
         //lzw20110614
         if _strsyscus<>'XSWL' then
         begin
            if datatmp.qryTmp.FieldByName('IsMonth').AsString='T' then
            strdate:=strdate+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month));
            if datatmp.qryTmp.FieldByName('IsDay').AsString='T' then
            strdate:=strdate+iif(day<10,'0'+IntToStr(day),IntToStr(day));
         end;

         if strdate<>'' then  StrCusInvo:=StrCusInvo+'（'+strdate+'）';

         opensql(datatmp.qryTmp,'select ContractNO '
                               +'  from contwithloca (nolock) '
                               +' where ContractNO like "'+StrCusInvo+'%"  '
                               +'   and cusid="'+data.qryContWithLoca.FieldByName('cusid').AsString+'"'
                               );
         if  datatmp.qryTmp.FieldByName('ContractNO').AsString<>'' then
         begin
            opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(ContractNO,len("'+StrCusInvo+'")+5,1)),0)+1 '
                                   +'  from contwithloca (nolock) '
                                   +' where ContractNO like "'+StrCusInvo+'%"  '
                                   +'   and cusid="'+data.qryContWithLoca.FieldByName('cusid').AsString+'"'
                                   );

            data.qryContWithLoca.FieldByName('ContractNO').AsString:=StrCusInvo+Copy(datatmp.qryTmp.FieldByName('ContractNO').AsString,
                                                                          Length(StrCusInvo)+1,3)+'-'+datatmp.qryTmp1.Fieldbyname('maxno').asstring+'';
         end else
         begin
            opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(ContractNO,len("'+StrCusInvo+'")+1,3)),0)+1 '
                                   +'  from contwithloca (nolock) '
                                   +' where ContractNO like "%'+StrCusInvo+'%"  '
                                   );
            if (strcontractno<>'')and(Copy(strcontractno,1,Length(strcontractno)-3)=StrCusInvo) then
               data.qryContWithLoca.FieldByName('ContractNO').AsString:=strcontractno
            else
               data.qryContWithLoca.FieldByName('ContractNO').AsString:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,3,'0',psLeft);
         end;

      end;

   end;
end;

procedure TfrmContWithLoca.edtConCusIdExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcusid.Text='' then
      begin
         data.qryContWithLoca.Edit;
         data.qryContWithLoca.FieldByName('concusid').AsString:='';
         data.qryContWithLoca.FieldByName('concusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('B',edtcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryContWithLoca.FieldByName('concusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryContWithLoca.FieldByName('concusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else Failed:=True;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmContWithLoca.edtCusIDExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmContWithLoca.edtConCusIdExit(Sender: TObject);
begin
   blnselect:=False;
end;

procedure TfrmContWithLoca.edtUsernameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmContWithLoca.edtUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtUsername.Text='' then
      begin
         data.qryContWithLoca.Edit;
         data.qryContWithLoca.FieldByName('iuserid').AsString:='';
         data.qryContWithLoca.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtUsername.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qryContWithLoca.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qryContWithLoca.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
//      if data.qryContWithLoca.FieldByName('ContractNO').AsString='' then
//      begin
         decodedate(Now,Year,Month,Day);//分解当前日期
         OpenSql(dataTmp.qryTmp,'select iscontract=isnull(iscontract,"F"),IsYear=isnull(IsYear,"F"), '
                               +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                               +'        ishelpnoct=rtrim(isnull(ishelpnoct,"")) '
                               +'   from organization (nolock)  '
                               +'  where userid="'+data.qryContWithLoca.FieldByName('iuserid').AsString+'" ');
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
                                  +'   and cusid="'+data.qryContWithLoca.FieldByName('cusid').AsString+'"'
                                  );
            if  datatmp.qryTmp.FieldByName('ContractNO').AsString<>'' then
            begin
               opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString("'+datatmp.qryTmp.FieldByName('ContractNO').AsString+'",'
                                      +'                              len("'+StrCusInvo+'")+4,1)),0)+1 '
                                      );

               data.qryContWithLoca.FieldByName('ContractNO').AsString:=StrCusInvo+Copy(datatmp.qryTmp.FieldByName('ContractNO').AsString,
                                                                             Length(StrCusInvo)+1,3)+'-'+datatmp.qryTmp1.Fieldbyname('maxno').asstring+'';
            end else
            begin
               opensql(datatmp.qryTmp1,'select MaxNo=isnull(Max(subString(ContractNO,len("'+StrCusInvo+'")+1,3)),0)+1 '
                                      +'  from contwithloca (nolock) '
                                      +' where ContractNO like "%'+StrCusInvo+'%"  '
                                      );
               if (strcontractno<>'')and(Copy(strcontractno,1,Length(strcontractno)-3)=StrCusInvo) then
                  data.qryContWithLoca.FieldByName('ContractNO').AsString:=strcontractno
               else
                  data.qryContWithLoca.FieldByName('ContractNO').AsString:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,3,'0',psLeft);
            end;

         end else
             data.qryContWithLoca.FieldByName('ContractNO').AsString:='';
//      end;
   end;
end;

procedure TfrmContWithLoca.mitCheckClick(Sender: TObject);
var
   i,j:integer;
begin
   if KmessageDlg(GetMessage('frmContWithLoca','027'),mtInformation,[mbYes,mbNo],0)<>mryes then//'该操作将审核选中的所有资料，您确定操作吗?'
      Exit;
   j:=grdCONTWITHLOCA.SelectedCount;
{   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;                            }
   if j<0 then
   begin
      if data.qryContWithLoca0.FieldByName('checkname').asstring='' then
          ExecSql(dataTmp.qryTmp,' update contwithloca '
                                +'    set checkname="'+_Loginname+'",'
                                +'        checkdate="'+DateTimeToStr(GetServerDate)+'"'
                                +'  where jobno="'+data.qryContWithLoca0.fieldbyname('jobno').asstring+'"');
   end else
   begin
      for i:=grdCONTWITHLOCA.SelectedCount-1 downto 0 do
      begin
         data.qryContWithLoca0.GotoBookmark(Pointer(grdCONTWITHLOCA.Selectedrows[i]));
         if data.qryContWithLoca0.FieldByName('checkname').asstring='' then
             ExecSql(dataTmp.qryTmp,' update contwithloca '
                                   +'    set checkname="'+_Loginname+'",'
                                   +'        checkdate="'+DateTimeToStr(GetServerDate)+'"'
                                   +'  where jobno="'+data.qryContWithLoca0.fieldbyname('jobno').asstring+'"');
   //      _pgbClear.StepBy(1);
      end;
   end;
//   _pgbClear.Visible:=False; //为了控制进度条
//   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshclick(self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0)
end;

procedure TfrmContWithLoca.mitUnCheckClick(Sender: TObject);
var
   i,j,intfalt:integer;
begin
   intfalt:=0;
   if KmessageDlg(GetMessage('frmContWithLoca','028'),mtInformation,[mbYes,mbNo],0)<>mryes then//'该操作将对选中的资料取消审核，您确定操作吗?'
      Exit;
   j:=grdCONTWITHLOCA.SelectedCount;
{   _pgbClear.Visible:=True;//为了控制进度条
   _pgbClear.Position:=0; //为了控制进度条
   _pgbClear.Max:=j;  //为了控制进度条
   _labPro.Caption:='共'+inttostr(j)+'笔'; //为了控制进度条
   Application.ProcessMessages;    }
   for i:=grdCONTWITHLOCA.SelectedCount-1 downto 0 do
   begin
      data.qryContWithLoca0.GotoBookmark(Pointer(grdCONTWITHLOCA.Selectedrows[i]));
      if data.qryContWithLoca0.FieldByName('checkname').asstring<>'' then
      begin
         if data.qryContWithLoca0.FieldByName('costcheckname').asstring<>'' then
           Inc(intfalt)
         else
            ExecSql(dataTmp.qryTmp,' update contwithloca '
                                  +'    set checkname="",'
                                  +'        checkdate=null'
                                  +'  where jobno="'+data.qryContWithLoca0.fieldbyname('jobno').asstring+'"');
      end;
//      _pgbClear.StepBy(1);
   end;
//   _pgbClear.Visible:=False; //为了控制进度条
//   _labPro.Caption:='运行进度'; //为了控制进度条
   btnRefreshclick(self);
   if intfalt>0 then
      Kmessagedlg(_strsucceed+IntToStr(intfalt)+'/'+inttostr(j)+GetMessage('frmContWithLoca','029'),mtInformation,[mbOk],0)//'记录已经财务审核，无法取消审核'
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0)
end;

procedure TfrmContWithLoca.mitAddCOSTITEMClick(Sender: TObject);
begin
  if (data.qryContWithLoca.FieldByName('breakdate').AsString<>'') and
     (data.qryContWithLoca.FieldByName('LastCountDate').AsString>=data.qryContWithLoca.FieldByName('breakdate').AsString) then
  begin
    Exit; 
  end else
  begin
     grdCOSTITEM.setfocus;
     blnIsCZ:=True;
     if Sender=mitAddCOSTITEM then
     begin
        data.qryCostItem.Last;
        while (not data.qryCostItem.Bof) do
        begin
           if data.qryCostItem.FieldByName('CostCd').AsString='CZ' then
           Break
           else
           data.qryCostItem.Prior;
        end;
     end;

     data.qryCostItem.append;
     grdCostItemBeforeInsert(blnIsCZ);
  end;
end;

procedure TfrmContWithLoca.mitDelCOSTITEMClick(Sender: TObject);
begin
    if data.qryCostItem.FieldByName('CostCheckName').AsString<>'' then
    begin
      KMessageDlg(GetMessage('frmContWithLoca','018'), mtInformation, [mbOk], 0);//'该笔费用已审核,不能直接删除！'
      exit;
    end;
   //lzw 20090106
   {if data.qryCostItem.FieldByName('notauto').AsString<>'T' then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','014'),mtConfirmation,[mbYes],0);//'这笔费用为电脑自动计算,不能手工删除!'
      exit;
   end else}
   if (data.qryCostItem.FieldByName('IOCOST').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','015'),mtConfirmation,[mbYes],0);//'这笔已经核销,不能删除!'
      exit;
   end else
   if (data.qryCostItem.FieldByName('IOCHARGE').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','016'),mtConfirmation,[mbYes],0);  //'这笔已经报销,不能删除!'
      exit;
   end else
   if (data.qryCostItem.FieldByName('IOINVO').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','017'),mtConfirmation,[mbYes],0);//'这笔已经开发票,不能删除!'
      exit;
   end else
   if (data.qryCostItem.FieldByName('DEPARTCHK').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','018'),mtConfirmation,[mbYes],0);//'这笔已经部门审核,不能删除!'
      exit;
   end else
   if (data.qryCostItem.FieldByName('COSTCHECKNAME').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','019'),mtConfirmation,[mbYes],0);//'这笔已经财务审核,不能删除!'
      exit;
   end else
   if (data.qryCostItem.FieldByName('VOUCHERNO').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','020'),mtConfirmation,[mbYes],0); //'这笔已经生成凭证,不能删除!'
      exit;
   end;

    if Kmessagedlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       grdCOSTITEM.setfocus;
       data.qryCostItem.Delete;
    end;
end;

procedure TfrmContWithLoca.MenuItem1Click(Sender: TObject);
begin
   WorkContCost(data.qryContWithLoca0.FieldByName('jobno').AsString,
                data.qryContWithLoca0.FieldByName('ContractNO').AsString,
                data.qryContWithLoca0.FieldByName('cusname').AsString
                );
end;

procedure TfrmContWithLoca.grdCostItemBeforeInsert(pblnIsCZ:Boolean);
begin
   data.qryCostItem.fieldbyname('Jobno').asstring :=data.qryContWithLoca.fieldbyname('Jobno').asstring;
   data.qryCostItem.fieldbyname('userid').asstring:=data.qryContWithLoca.fieldbyname('userid').asstring;
   data.qryCostItem.fieldbyname('snosku').AsInteger:=-10;

   data.qryCostItem.fieldbyname('sno').Asinteger:=-1;
   //data.qryCostItem.fieldbyname('paywaycd').Asinteger:=0;
   data.qryCostItem.fieldbyname('costcusid').AsString:=iif(data.ContWithLoca_CopyWho='',frmContWithLoca.edtCusID.TextField,data.ContWithLoca_CopyWho);
   data.qryCostItem.fieldbyname('costcusname').AsString:=iif(data.ContWithLoca_CopyWhoname='',frmContWithLoca.edtCusID.Text,data.ContWithLoca_CopyWhoname);

   if blnIsCZ then
   begin
      data.qryCostItem.FieldByName('notauto').AsString:='F';
      if data.ContWithLoca_CopyDate='' then
         data.qryCostItem.fieldbyname('costdate').AsString:=frmContWithLoca.dtdEffectDate.Text
      else
      begin
         if Trim(edtPayway.Text)='' then
            data.qryCostItem.FieldByName('costdate').AsString:=DateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate))-1)
         else
            data.qryCostItem.fieldbyname('costdate').AsString:=dateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate),StrToInt(edtPayway.textfield)))
      end;
      data.qryCostItem.fieldbyname('costcd').AsString:='CZ';

      data.qryCostItem.fieldbyname('sdate').AsString:=data.qryCostItem.fieldbyname('costdate').AsString;
      if edtPayway.Text='' then
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItem.fieldbyname('costout').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat
         else
           data.qryCostItem.fieldbyname('costin').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat;
         data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,1)-1);
      end else
      if edtPayway.Text='一次性' then
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItem.fieldbyname('costout').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithLoca.fieldbyname('enddate').AsFloat,data.qryContWithLoca.fieldbyname('effectdate').AsFloat))
         else
           data.qryCostItem.fieldbyname('costin').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithLoca.fieldbyname('enddate').AsFloat,data.qryContWithLoca.fieldbyname('effectdate').AsFloat));
         data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryContWithLoca.fieldbyname('effectdate').AsDateTime)-1)
      end else
      begin
         //lzw20100226
         if ckbcountout.Checked then
           data.qryCostItem.fieldbyname('costout').AsFloat:=frmContWithLoca.edtRent.Value*(StrToFloat(edtPayway.TextField))
         else
           data.qryCostItem.fieldbyname('costin').AsFloat:=frmContWithLoca.edtRent.Value*(StrToFloat(edtPayway.TextField));
         data.qryCostItem.fieldbyname('costrate').AsFloat:=frmContWithLoca.edtPrice.Value;
         data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,StrToInt(edtPayway.TextField))-1);
         data.qryCostItem.fieldbyname('countday').asFloat:=data.qryCostItem.fieldbyname('edate').AsDateTime-data.qryCostItem.fieldbyname('sdate').AsDateTime+1;
      end;
//      data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index],1)-1);
//      data.qryCostItem.fieldbyname('countday').asFloat:=grdCostItem.FocusedNode.Values[dtdCTI_EDate.Index]-grdCostItem.FocusedNode.Values[dtdCTI_SDate.Index];
//      data.qryCostItem.fieldbyname('sdate').AsString:=data.qryCostItem.fieldbyname('costdate').AsString;
//      if Trim(edtPayway.Text)='月' then
//      data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,1)-1)
//      else
//      data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,StrToInt(edtPayway.TextField))-1);
//cyh06.24
   end else
   begin
      data.qryCostItem.fieldbyname('costdate').AsDateTime:=date;
      data.qryCostItem.FieldByName('notauto').AsString:='T';
      cmbCostcd.ReadOnly:=False;
   end;

   data.qryCostItem.fieldbyname('currCd').AsString:=IIF(_currcd='','RMB',_currcd);
   //lzw20100226
   if ckbcountout.Checked then
      data.qryCostItem.fieldbyname('costin').AsFloat:=0
   else
      data.qryCostItem.fieldbyname('costout').AsFloat:=0;
end;

procedure TfrmContWithLoca.N1Click(Sender: TObject);
begin
  if (data.qryContWithLoca.FieldByName('breakdate').AsString<>'') and
     (data.qryContWithLoca.FieldByName('LastCountDate').AsString>=data.qryContWithLoca.FieldByName('breakdate').AsString) then
  begin
    Exit; 
  end else
  begin
     grdCOSTITEM.setfocus;
     blnIsCZ:=False;
   //notauto
     data.qryCostItem.append;
     grdCostItemBeforeInsert(False);
   end;
end;

procedure TfrmContWithLoca.grdContWithLocaItemAfterInsert;
begin
  data.qryContWithLocaItem.fieldbyname('Jobno').asstring :=data.qryContWithLoca.fieldbyname('Jobno').asstring;
  data.qryContWithLocaItem.fieldbyname('userid').asstring:=data.qryContWithLoca.fieldbyname('userid').asstring;
  data.qryContWithLocaItem.fieldbyname('username').asstring:=data.qryContWithLoca.fieldbyname('username').asstring;
  data.qryContWithLocaItem.fieldbyname('iuserid').asstring:=data.qryContWithLoca.fieldbyname('iuserid').asstring;
  data.qryContWithLocaItem.fieldbyname('iusername').asstring:=data.qryContWithLoca.fieldbyname('iusername').asstring;
  data.qryContWithLocaItem.fieldbyname('begindate').asstring:=data.qryContWithLoca.fieldbyname('effectdate').asstring;
  data.qryContWithLocaItem.fieldbyname('sno').AsInteger:=-1;
end;

procedure TfrmContWithLoca.grdContWithLocaItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      if grdContWithLocaItemReadOnly then allow:=false
      else  Allow:=True;
   end;
end;

procedure TfrmContWithLoca.grdContWithLocaItemEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryContWithLocaItem.fieldbyname('sno').AsInteger=0) then
   begin
      mitAddItemClick(Sender);
   end;
end;

procedure TfrmContWithLoca.grdContWithLocaItemExit(Sender: TObject);
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

procedure TfrmContWithLoca.grdContWithLocaItemChangeNodeEx(
  Sender: TObject);
begin
  if grdContWithLocaItem.Datalink.DataSet.State = dsInsert then
  begin
     grdContWithLocaItemAfterInsert;
  end;
end;

procedure TfrmContWithLoca.grmLocNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryContWithLocaItem.edit;
      data.qryContWithLocaItem.FieldByName('locid').AsString:=qrySelect.FieldByName('locid').asstring;
      data.qryContWithLocaItem.FieldByName('locname').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithLoca.grmptlocnamButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in setDcs then
  begin
      qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
      data.qryContWithLocaItem.edit;
      data.qryContWithLocaItem.FieldByName('ptlocid').AsString:=qrySelect.FieldByName('locid').asstring;
      data.qryContWithLocaItem.FieldByName('ptlocname').AsString:=qrySelect.FieldByName('locname').asstring;
    end;
  end;
end;

procedure TfrmContWithLoca.mitcontaddClick(Sender: TObject);
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
//     memendreason.ReadOnly:=false;
//      dtdBreakDate.ReadOnly:=False;
    edtEndDate.Setfocus;
end;

procedure TfrmContWithLoca.CountCost;
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   SetMasterDetailState(False);

{   if data.qryCostItem.RecordCount=0 then
     begin
       grdCOSTITEM.setfocus;
       data.qryCostItem.append;
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
   if data.qryContWithLoca.FieldByName('CountName').asstring='' then
   begin
     data.qryContWithLoca.FieldByName('CountName').asstring:=_LoginName;
     data.qryContWithLoca.FieldByName('CountDate').asDateTime:=Date;
   end;
   btnCancel.SetFocus;
end;

procedure TfrmContWithLoca.mitMultCountClick(Sender: TObject);
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
      data.qryContWithLoca0.GotoBookmark(Pointer(grdCONTWITHLOCA.SelectedRows[i]));
      if data.qryContWithLoca0.FieldByName('Checkname').AsString<>'' then
      begin
         blnCanCount:=False;
         if data.qryContWithLoca0.FieldByName('payway').AsString='月' then
         begin
            if Date-data.qryContWithLoca0.fieldbyname('LastCountDate').AsDateTime+1>31 then
               blnCanCount:=True;
         end else
         begin
            if Date-data.qryContWithLoca0.fieldbyname('LastCountDate').AsDateTime+1>92 then
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

procedure TfrmContWithLoca.N3Click(Sender: TObject);
var
  i:Integer;
  j:Integer;
begin
  j:= StrToInt(edtPayway.TextField);
  grdCOSTITEM.setfocus;
  for i:= 1 to j do
  begin
     data.qryCostItem.append;
     data.qryCostItem.fieldbyname('Jobno').asstring :=data.qryContWithLoca.fieldbyname('Jobno').asstring;
     data.qryCostItem.fieldbyname('userid').asstring:=data.qryContWithLoca.fieldbyname('userid').asstring;
     data.qryCostItem.fieldbyname('snosku').AsInteger:=-10;
     data.qryCostItem.fieldbyname('sno').Asinteger:=-1;
     data.qryCostItem.fieldbyname('costcusid').AsString:=iif(data.ContWithLoca_CopyWho='',frmContWithLoca.edtCusID.TextField,data.ContWithLoca_CopyWho);
     data.qryCostItem.fieldbyname('costcusname').AsString:=iif(data.ContWithLoca_CopyWhoname='',frmContWithLoca.edtCusID.Text,data.ContWithLoca_CopyWhoname);
     if data.ContWithLoca_CopyDate='' then
        data.qryCostItem.fieldbyname('costdate').AsString:=frmContWithLoca.dtdEffectDate.Text
     else
     begin
        if Trim(edtPayway.Text)='' then
           data.qryCostItem.FieldByName('costdate').AsString:=DateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate))-1)
        else
           data.qryCostItem.fieldbyname('costdate').AsString:=dateToStr(IncMonth(strToDate(data.ContWithLoca_CopyDate),1))
     end;
     data.qryCostItem.fieldbyname('costcd').AsString:='CZ';
     data.qryCostItem.fieldbyname('sdate').AsString:=data.qryCostItem.fieldbyname('costdate').AsString;
     if edtPayway.Text='' then
     begin
        //lzw20100226
        if ckbcountout.Checked then
           data.qryCostItem.fieldbyname('costout').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat
        else
           data.qryCostItem.fieldbyname('costin').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat;

        data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,1)-1);
     end else
     if edtPayway.Text='一次性' then
     begin
        //lzw20100226
        if ckbcountout.Checked then
          data.qryCostItem.fieldbyname('costout').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithLoca.fieldbyname('enddate').AsFloat,data.qryContWithLoca.fieldbyname('effectdate').AsFloat))
        else
          data.qryCostItem.fieldbyname('costin').AsFloat:=data.qryContWithLoca.fieldbyname('rent').AsFloat*round(MonthSpan(data.qryContWithLoca.fieldbyname('enddate').AsFloat,data.qryContWithLoca.fieldbyname('effectdate').AsFloat));
        data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryContWithLoca.fieldbyname('effectdate').AsDateTime)-1)
     end else
     begin
        //lzw20100226
        if ckbcountout.Checked then
          data.qryCostItem.fieldbyname('costout').AsFloat:=frmContWithLoca.edtRent.Value
        else
          data.qryCostItem.fieldbyname('costin').AsFloat:=frmContWithLoca.edtRent.Value;
        data.qryCostItem.fieldbyname('costrate').AsFloat:=frmContWithLoca.edtPrice.Value;
        data.qryCostItem.fieldbyname('edate').AsString:=dateToStr(IncMonth(data.qryCostItem.fieldbyname('sdate').AsDateTime,1));
        data.qryCostItem.fieldbyname('countday').asFloat:=data.qryCostItem.fieldbyname('edate').AsDateTime-data.qryCostItem.fieldbyname('sdate').AsDateTime;
     end;
 //cyh06.24
       data.qryCostItem.fieldbyname('currCd').AsString:=IIF(_currcd='','RMB',_currcd);
       //lzw20100226
       if ckbcountout.Checked then
          data.qryCostItem.fieldbyname('costin').AsFloat:=0
       else
          data.qryCostItem.fieldbyname('costout').AsFloat:=0;
     {try
       data.qryLocationOutItem.Post;
     except
       break;
     end;}
  end;
end;

procedure TfrmContWithLoca.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOperatorSelect('');
      if qrySelect.FieldByName('opid').AsString<>'NO' then
      begin
         data.qryContWithLoca.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
         data.qryContWithLoca.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;

end;

procedure TfrmContWithLoca.edtOPIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmContWithLoca.edtOPIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtOPID.Text='' then
      begin
         data.qryContWithLoca.Edit;
         data.qryContWithLoca.FieldByName('opid').AsString:='';
         data.qryContWithLoca.FieldByName('opname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOperatorSelect(edtOPID.Text);
         if qrySelect.FieldByName('opid').AsString<>'NO' then
         begin
            data.qryContWithLoca.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
            data.qryContWithLoca.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;

end;

procedure TfrmContWithLoca.ckbCountRentChange(Sender: TObject);
begin
   if _strsyscus='XSWL' then
   begin
      if ckbCountRent.Checked then
         KGroupBox4.visible:=false
      else
         KGroupBox4.visible:=true;
   end;
end;

end.

