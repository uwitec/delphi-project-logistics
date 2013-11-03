unit BuilDing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  SLV, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient ,DateUtils;

type
  TfrmBuilDing = class(TForm)
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
    SignDate: TdxDBGridColumn;
    CreateUserName: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    grdBuilDing: TdxDBGrid;
    ppmContWithLocaItem: TPopupMenu;
    mitAddItem: TMenuItem;
    mitDeleteItem: TMenuItem;
    bd_property: TdxDBGridColumn;
    bd_housecusname: TdxDBGridColumn;
    UserName: TdxDBGridColumn;
    dlgOpenFile: TOpenDialog;
    ppmAttachment: TPopupMenu;
    mitAddAtt: TMenuItem;
    mitDeleteAtt: TMenuItem;
    mitOpenAtt: TMenuItem;
    grpinfobar: TKGroupBox;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCreateName: TdxDBEdit;
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
    edtcolor1: TKSText;
    KSText3: TKSText;
    mitcontadd: TMenuItem;
    bd_floor: TdxDBGridColumn;
    bd_located: TdxDBGridColumn;
    ppmCount: TPopupMenu;
    mitMultCount: TMenuItem;
    idleid: TdxDBGridColumn;
    N3: TMenuItem;
    opname: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel20: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    edtUsername: TdxDBButtonEdit;
    ckbidleid: TdxDBCheckEdit;
    GMSStickyLabel27: TGMSStickyLabel;
    edtbd_property: TdxDBEdit;
    edtbd_parcelarea: TdxDBCalcEdit;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel30: TGMSStickyLabel;
    GMSStickyLabel32: TGMSStickyLabel;
    edtbd_located: TdxDBEdit;
    GMSStickyLabel33: TGMSStickyLabel;
    edtbd_housetype: TdxDBEdit;
    GMSStickyLabel34: TGMSStickyLabel;
    edtbd_buildyear: TdxDBEdit;
    GMSStickyLabel35: TGMSStickyLabel;
    edtbd_assessmentarea: TdxDBCalcEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    edtbd_landarea: TdxDBCalcEdit;
    GMSStickyLabel37: TGMSStickyLabel;
    edtbd_constructionarea: TdxDBCalcEdit;
    GMSStickyLabel38: TGMSStickyLabel;
    GMSStickyLabel43: TGMSStickyLabel;
    qryTmp: TKADOQuery;
    GMSStickyLabel1: TGMSStickyLabel;
    edtidleday: TdxDBEdit;
    memRemark: TdxDBMemo;
    GMSStickyLabel4: TGMSStickyLabel;
    udsBuilding: TKadoUpdateSql;
    dtsBuilding: TDataSource;
    qryBuilding: TKADOQuery;
    dtsBuilding0: TDataSource;
    qryBuilding0: TKADOQuery;
    edthouseno: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    edtbd_floor: TdxDBEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    edtbd_area: TdxDBCalcEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtmodifydate: TdxDBDateEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    edtmodifyname: TdxDBEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtbd_landtype: TdxDBEdit;
    edbd_housecusname: TdxDBEdit;
    edtopname: TdxDBEdit;
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
    procedure pgcMainChange(Sender: TObject);
    procedure grdBuilDingCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

    procedure edtUsernameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);

  private
    { Private declarations }
    //变量定义
    FindItem: TFindItem;               //查找
    strBLjobno:string;                 //重新取得工作号
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

public
    { Public declarations }
    maxCostItem,maxsno:Integer;
    DataState:TDataState;
    oldContWithHouseItem:string;
    sltContWithHouseItem:TStringList;
  end;

procedure WorkBuilDing(CallMode:TDataState;pstrJobno:string);

var
  frmBuilDing: TfrmBuilDing;
  blnDelete:boolean;
  year,month,day:word;
  month_start,month_end,strdate:TDate;
implementation

{$R *.dfm}

uses Main,kindlg,Saveget,datas,find,ContCost,
     GetUserRight, datasTmp,libuserPub,DocBook,GetDllPub,buildingselect;


procedure WorkBuilDing(CallMode:TDataState;pstrJobno:string);
begin
   if frmBuilDing <> nil then
   with frmBuilDing do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmBuilDing:=TfrmBuilDing.Create(application);
   with frmBuilDing do
   begin
   {初始化所有数据集}
      //初始话变量
      blnCopy        :=False;             //系统默认不复制新增
      FindItem       :=TFindItem.Create;
      blnSaveError   :=False;
      mode           :=CallMode;

      strJobno:=pstrJobno;

      sltContWithHouseItem:=TStringList.Create;

      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;

       //房产信息假主
      strSql:='select jobno,bd_located,bd_landtype,bd_housing,bd_parcelarea,                      '+chr(13)+chr(10)
             +'       bd_assessmentarea,bd_landarea,bd_constructionarea,bd_property,bd_housecusid,'+chr(13)+chr(10)
             +'       bd_housecusname,bd_housetype,bd_buildyear,                                  '+chr(13)+chr(10)
             +'       idleid=case when idleid="T" then "√" else "" end,idleday,                  '+chr(13)+chr(10)
             +'       houseno,bd_floor,bd_area,CreateName,Createdate,                             '+chr(13)+chr(10)
             +'       modifyname,modifydate,opid,opname,userid,username,iuserid,iusername,remark  '+chr(13)+chr(10)
             +'  from Building (nolock)                                                           '+chr(13)+chr(10)
             +' where 1=1                                                                         '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
                ' and (  Building.userid in '+_Useridcan+' or Building.iuserid in '+_Useridcan+')' ,
                ' and (  Building.userid like rtrim("'+_UserID+'")+"%"  '  // Useid组织
               +'    or isnull(Building.iUserid,0) like rtrim("'+_UserID+'")+"%" )')
             +iif(pstrjobno<>'','  and jobno="'+pstrjobno+'"','')                                      +chr(13)+chr(10)
             +'  and %where ';
      qryBuilding0.Close;
      qryBuilding0.SQL.clear;
      qryBuilding0.SQL.Add(strSql);
      //房产信息主表
      strSql:='select jobno,bd_located,bd_landtype,bd_housing,bd_parcelarea,                      '+chr(13)+chr(10)
             +'       bd_assessmentarea,bd_landarea,bd_constructionarea,bd_property,bd_housecusid,'+chr(13)+chr(10)
             +'       bd_housecusname,bd_housetype,bd_buildyear,idleid,idleday,                   '+chr(13)+chr(10)
             +'       houseno,bd_floor,bd_area,CreateName,Createdate,                             '+chr(13)+chr(10)
             +'       modifyname,modifydate,opid,opname,userid,username,iuserid,iusername,remark  '+chr(13)+chr(10)
             +'  from Building (nolock)                                                           '+chr(13)+chr(10)
             +' where Jobno=:Jobno ';
      qryBuilding.Close;
      qryBuilding.SQL.clear;
      qryBuilding.SQL.Add(strSql);
      if trim(strJobno)='' then
      begin
         FilterSql:=''
      end else
         FilterSql:='';

      qryBuilding0.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');
      if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitBuilding',trim(_userorgid));//设置按钮的有效性
    // 界面显示过程
     if mode=stInsert then
     begin
       SetControlState(stInsert,true);
       qryBuilding.open;
       btnCopy.Click;
     end else
     begin
       if _Loginid<>'SYSTEM' then
       SetButtonEnabled(ToolPanel,'mitBuilding',trim(_userorgid));//设置按钮的有效性
       SetControlState(stBrowse,true);
       qryBuilding0.Open;
       WorkCall(stBrowse);
     end;
     {激活FORM}
     Show;
   end;
end;

procedure TfrmBuilDing.WorkCall(CallMode:TDataState);
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
          qryBuilding0.Edit;
          EnableEdit;
          //记录修改档案

          qryBuilding.Edit;
          qryBuilding.FieldByName('modifyname').Asstring:=_LoginName;
          qryBuilding.fieldByname('modifydate').AsDatetime:=date;

          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qryBuilding0.Append;
          sltContWithHouseItem.Clear;
          oldContWithHouseItem:='';
          InitValues;
          EnableEdit;
          //记录档案创建信息
          qryBuilding.Edit;
          qryBuilding.FieldByName('CreateName').Asstring:=_LoginName;
          qryBuilding.fieldByname('CreateDate').AsDatetime:=date;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmBuilDing.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
  SetControlState(DataState,False);
end;

procedure TfrmBuilDing.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  if qryBuilding0.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
  strcontractno:='';
  SetControlState(DataState,False);
end;

procedure TfrmBuilDing.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmBuilDing.InitValues;
{初始化时自动生成仓位代码}
begin
  strBLJobno:=genJobno('BL');
  qryBuilding.Edit;
  if blnCopy then
  begin
    blnCopy:=False;
    //qryCostEdit复制

    qryBuilding.FieldByName('JOBNO').Asstring:=strBLJobno;
    qryBuilding.fieldByname('UserID').AsString:=_UserID;
    qryBuilding.fieldByname('username').AsString:=_username;

    qryBuilding.DisableControls;
  end else
  begin
    //qryBuilding
    qryBuilding.FieldByName('JOBNO').Asstring:=strBLJobno;
    qryBuilding.FieldByName('UserID').Asstring:=_UserID;
    qryBuilding.FieldByName('username').Asstring:=_username;
  end;
end;

procedure TfrmBuilDing.SetMasterDetailState(blnConnect:Boolean);
{将主从表的MasterDetail关系连接或切断}
begin
  if blnConnect then
  begin
    qryBuilding.DataSource    :=dtsBuilding0;
  end else
  begin
    qryBuilding.DataSource    :=nil;
  end;
end;

procedure TfrmBuilDing.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{设置界面元素的visible,enable属性
 CallMode：form的状态
 blnCreate：是否是创建时期
}
begin
end;

function TfrmBuilDing.Gather:boolean;
{变量值更新数据库前,对值处理过程}
var
   strLocname:string;
   exchgRent:Extended;
begin
  Result:=False;
  if edthouseno.Text='' then
  begin
     Kmessagedlg('房屋编号不可为空！', mtInformation,[mbOk],0);//'产权证号不可为空！'
     edthouseno.setFocus;
     exit;
  end;
  if edtbd_property.Text='' then
  begin
     Kmessagedlg('产权证号不可为空！', mtInformation,[mbOk],0);//'产权证号不可为空！'
     edtbd_property.setFocus;
     exit;
  end;
  //
  qryBuilding0.edit;
  qryBuilding0.fieldbyname('houseno').asstring          :=qryBuilding.FieldByName('houseno').AsString;
  qryBuilding0.fieldbyname('Jobno').asstring            :=qryBuilding.fieldbyname('Jobno').asstring;
  qryBuilding0.fieldbyname('bd_property').asstring      :=qryBuilding.fieldbyname('bd_property').asstring;
  qryBuilding0.fieldbyname('bd_housecusname').asstring  :=qryBuilding.fieldbyname('bd_housecusname').asstring;
  qryBuilding0.fieldbyname('username').asstring         :=qryBuilding.fieldbyname('username').asstring;
  qryBuilding0.fieldbyname('createname').asstring     :=qryBuilding.fieldbyname('createname').asstring;
  qryBuilding0.fieldbyname('bd_floor').asstring       :=qryBuilding.fieldbyname('bd_floor').asstring;
  qryBuilding0.fieldbyname('bd_located').asstring     :=qryBuilding.fieldbyname('bd_located').asstring;
  qryBuilding0.fieldbyname('idleid').asstring         :=qryBuilding.fieldbyname('idleid').asstring;
  Result:=True;
end;


procedure TfrmBuilDing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmBuilDing.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox7);
  pgcMain.ActivePage:=tbsBrowse;
  qryTmp.Connection:=_ADOConnection;
  qryBuilding.Connection:=_ADOConnection;
  qryBuilding0.Connection:=_ADOConnection;

end;

procedure TfrmBuilDing.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmBuilDing.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  qryBuilding.Close;
  frmBuilDing:=nil
end;

procedure TfrmBuilDing.btnBrowGlClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsBrowse;
  btnBrowgl.Visible := false;
  btnBrowmx.Visible := true;
end;

procedure TfrmBuilDing.btnBrowMxClick(Sender: TObject);
begin
  pgcMain.ActivePage := tbsEdit;
  btnBrowmx.Visible := false;
  btnBrowGl.Visible := true;
end;

procedure TfrmBuilDing.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBuilDing.btnRefreshClick(Sender: TObject);
var
  strXmh:string;
begin
  strXmh:=qryBuilding0.fieldbyname('jobno').asstring;
  qryBuilding0.DisableControls;
  qryBuilding0.Close;
  qryBuilding0.Open;
  try
    qryBuilding0.locate('jobno',VarArrayOf([strXmh]),[loCaseInsensitive, loPartialKey]);
  except
    qryBuilding0.Last;
  end;
  qryBuilding0.EnableControls;
end;

procedure TfrmBuilDing.btnEditClick(Sender: TObject);
begin
  if qryBuilding0.FieldByName('CreateName').asstring<>_LoginName then
  begin
    kMessageDlg('该房产信息不是您输入的，不能修改！',mtWarning,[mbOK],0);//'该房产信息不是您输入的，不能修改！'
    exit;
  end;

  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;

  memRemark.ReadOnly:=false;
  SetDetailActive(False,True);
  SetMasterDetailState(False);
  WorkCall(stEdit);
end;

procedure TfrmBuilDing.btnAddClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  blnAddCost:=False;
  memRemark.ReadOnly:=false;

  if pgcMain.ActivePage=tbsEdit then
    SetDetailActive(False,True);
  Workcall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmBuilDing.btnDeleteClick(Sender: TObject);
begin
  if qryBuilding0.FieldByName('CreateName').asstring<>_LoginName then
  begin
    kMessageDlg('该房产信息不是您输入的，不能删除！',mtWarning,[mbOK],0);//'该房产信息不是您输入的，不能删除！'
    exit;
  end;

  if pgcMain.ActivePage<>tbsEdit then
    pgcMain.ActivePage:=tbsEdit;
  if KmessageDlg(_strDel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    SetMasterDetailState(False);
    _ADOConnection.startTransaction;
    try
      ExecSql(dataTmp.qryTmp,'delete from  Building'
                     +' where jobno="'+qryBuilding0.FieldByName('jobno').AsString+'" ');
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                             +'  where jobno="'+qryBuilding0.FieldByName('jobno').AsString+'" ');
      qryBuilding0.Delete;
      qryBuilding0.Applyupdates;
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
    qryBuilding0.CommitUpdates;
    SetMasterDetailState(True);
    if pgcMain.ActivePage=tbsEdit then
      SetDetailActive(True,True);
    btnRefresh.Click;
    workcall(stbrowse);
  end;
end;

procedure TfrmBuilDing.btncopyClick(Sender: TObject);
begin
  if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
  SetDetailActive(False,True);

  arrContWithLoca:=ScatterToArray(qryBuilding,true,0);
  blnCopy:=True;

  WorkCall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmBuilDing.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add(' Building  Building ');

{0}   para.field.add('Building.houseno');
{1}   para.field.add('Building.property');
{2}   para.field.add('Building.housecusname');
{3}   para.Field.add('Building.opname');

      Para.Exp.add('');
{0}   Para.Toptic.Add('房屋编号');
{1}   Para.Toptic.Add('产权证号');
{2}   Para.Toptic.Add('权 属 人');
{3}   Para.Toptic.Add('负 责 人');

{0}   para.Ftype.add('C');
{1}   para.Ftype.add('C');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('C');

   Para.RField.add('Building.jobno');

   if filterSql <> ''
      then Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(qryBuilding, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmBuilDing.btnRefindClick(Sender: TObject);
begin
   DoRefind(qryBuilding,dataTmp.qryFind);
end;

procedure TfrmBuilDing.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   Para := TfindPara.Create;

   para.Tables.Add(' Building  Building ');

{0}   para.field.add('Building.houseno');
{1}   para.field.add('Building.property');
{2}   para.field.add('Building.housecusname');
{3}   para.Field.add('Building.opname');

      Para.Exp.add('');
{0}   Para.Toptic.Add('房屋编号');
{1}   Para.Toptic.Add('产权证号');
{2}   Para.Toptic.Add('权 属 人');
{3}   Para.Toptic.Add('负 责 人');

{0}   para.Ftype.add('C');
{1}   para.Ftype.add('C');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('C');

   Para.RField.add('Building.jobno');
   if filterSql<>'' then
        Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);

   if strTmp <> 'null' then
   begin
     qryBuilding0.DisableControls;
     qryBuilding0.Close;

     if strTmp<>'' then
       qryBuilding0.MacroByName('Where').AsString:=strTmp
     else
       qryBuilding0.MacroByName('Where').AsString:='1=1';
     qryBuilding0.Open;
     qryBuilding0.EnableControls;
   end;
   workcall(stbrowse);

end;

procedure TfrmBuilDing.btnSaveClick(Sender: TObject);
begin
  if (DataState in setDcs) and Gather then //新增或编辑存盘
  begin
    try
      blnWare:=True;
      while True do
      begin
        try
          _ADOConnection.Starttransaction;
          qryBuilding.Post;
          qryBuilding0.ApplyUpdates;
          qryBuilding.ApplyUpdates;
          Break;
        except
          if Error.HandleException(Exception(ExceptObject),
             udsBuilding.modifysql.text + chr(13) +
             udsBuilding.DeleteSql.text + chr(13) +
             udsBuilding.InsertSql.text + chr(13)) = Re_KeyRepeat then
          begin
             blnWare:=False;
             _ADOConnection.Rollback; //先结束事务
             WorkSaveGet( qryBuilding.FieldByName('Jobno').AsString + GetMessage('frmBuilDing','014'));//'已经被使用。程序正在查找其他可用客户编号...'
             Application.processmessages;
             if not frmSave.stopflag then
             begin
               strBLJobno := genJobno('BL',_DataBaseID);
               if strBLJobno = '' then
               begin
                 KmessageDlg(GetMessage('frmBuilDing','015'), mtInformation, [mbOk], 0);//'没有可用的工作编号或网络忙，请稍侯重试或联系系统管理员.'
                 frmSave.stopflag := True;
                 Break;
               end else
               begin
                 qryBuilding.Edit;
                 qryBuilding.FieldByName('Jobno').AsString := strBLJobno;
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
            lblError.caption := '找到可用客户编号' + strBLJobno + '，该客户编号改为' + strBLJobno + '。';
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
    qryBuilding0.CommitUpdates;
    qryBuilding.commitUpdates;

    SetMasterDetailState(True);
    WorkCall(stBrowse);

  end;
end;

procedure TfrmBuilDing.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  if DataState=stInsert then
     ExecSql(dataTmp.qryTmp,' delete from genjobno '
                           +'  where jobno="'+qryBuilding.FieldByName('jobno').AsString+'" ');

  qryBuilding.CancelUpdates;
  qryBuilding0.CancelUpdates;

  SetMasterDetailState(True);
  WorkCall(stBrowse);
  btnRefreshclick(self);
end;

procedure TfrmBuilDing.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
  if blnPage then
  begin
    qryBuilding.Close;
    qryBuilding.Open;
  end else
  begin
    qryBuilding.Active    :=blnOpen;
  end;
end;

function TfrmBuilDing.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmBuilDing.pgcMainChange(Sender: TObject);
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

procedure TfrmBuilDing.grdBuilDingCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Year, Month, Day, YearLast, MonthLast, DayLast: Word;
begin
   if trim(ANode.Values[idleid.Index])='√' then
   begin
      AColor := $00C1DBC1;
   end;
   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;
end;

procedure TfrmBuilDing.edtUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtUsername.Text='' then
      begin
         qryBuilding.Edit;
         qryBuilding.FieldByName('iuserid').AsString:='';
         qryBuilding.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtUsername.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            qryBuilding.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            qryBuilding.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmBuilDing.edtUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        qryBuilding.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        qryBuilding.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;

end;

end.

