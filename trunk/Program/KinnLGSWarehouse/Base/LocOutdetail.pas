unit LocOutDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmLocOutDetail = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btncopy: TKBitBtn;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    popMoveLocOld: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    btnPaste: TKBitBtn;
    KGroupBox2: TKGroupBox;
    RxSplitter1: TRxSplitter;
    dtsMoveLocOld: TDataSource;
    qryMoveLocOld: TKADOQuery;
    grdMoveLocOld: TdxDBGrid;
    qryTmp: TKADOQuery;
    KGroupBox5: TKGroupBox;
    lblfind: TGMSStickyLabel;
    cmbchoice: TKinPickEdit;
    edtmainorder: TdxEdit;
    edtskuname: TdxButtonEdit;
    edtlocname: TdxButtonEdit;
    btnQuery: TKBitBtn;
    cmbShipAccID: TdxButtonEdit;
    cmbstockno: TdxEdit;
    quantitynew: TdxDBGridCurrencyColumn;
    jobnoin: TdxDBGridColumn;
    snoin: TdxDBGridColumn;
    ldsnoin: TdxDBGridColumn;
    detailsnoin: TdxDBGridColumn;
    skuid: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    serialno: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    mainorder: TdxDBGridColumn;
    shippercusname: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    dtdReceDateT: TdxDateEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    edtCusname: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtIuserId: TdxButtonEdit;
    GMSStickyLabel80: TGMSStickyLabel;
    btncancell: TKBitBtn;
    btnOK: TKBitBtn;
    edtMainorderO: TdxEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    checked: TdxDBGridCheckColumn;
    cmbsealno: TdxEdit;
    lblF: TGMSStickyLabel;
    lblT: TGMSStickyLabel;
    piece: TdxDBGridColumn;
    piecenew: TdxDBGridColumn;
    grossweight: TdxDBGridColumn;
    grossweightnew: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
    netweightnew: TdxDBGridColumn;
    volume: TdxDBGridColumn;
    volumenew: TdxDBGridColumn;
    area: TdxDBGridColumn;
    areanew: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    skumodel: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure qryMoveLocOldAfterPost(DataSet: TDataSet);
    procedure grdMoveLocOldEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdMoveLocOldEnter(Sender: TObject);
    procedure grdMoveLocOldExit(Sender: TObject);
    procedure grdMoveLocOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbShipAccIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipAccIDExit(Sender: TObject);
    procedure cmbShipAccIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtlocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtlocnameExit(Sender: TObject);
    procedure edtlocnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtskunameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtskunameExit(Sender: TObject);
    procedure edtskunameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnQueryClick(Sender: TObject);
    procedure cmbchoiceExit(Sender: TObject);
    procedure cmbchoiceChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncancellClick(Sender: TObject);
    procedure newlocnameValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure edtIuserIdButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    //变量定义
    strMLjobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    strsql,FilterSql,strFilter: string;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    arrml,arrMoveLoc,arrMoveLocOld,arrMoveLocNew:Variant;//用于数据复制
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    m_blnPost: Boolean;//在Post状态
    strDel_New:string;//目标仓位删除,记录删除序号
    strGetCd:String;
    exPiecepro:Extended;

    //过程定义
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure pgcRelocationChange(Sender: TObject);
    procedure GetSql;
    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strsyscusname:string;

    strDel_detail:string;//记录商品明细删除,datas中.
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocOutDetail;

var
  frmLocOutDetail: TfrmLocOutDetail;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect;

var strClassID,strZsql,strMxpjbz:string;

procedure WorkLocOutDetail;
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
   if frmLocOutDetail <> nil then
   with frmLocOutDetail do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmLocOutDetail:=TfrmLocOutDetail.Create(application);

   with frmLocOutDetail do
   begin
     btnOK.Enabled:=false;
     edtIuserId.TextField:=_userid;
     edtIuserId.Text:=_username;
     dtdReceDateT.Date:=date;
     strsyscusname:=getSysdata('cusname');
     //lzw20090527
     if strsyscusname='SWZ' then
     begin
        color.Visible:=True;
        skuspec.Visible:=True;
        skumodel.Visible:=True;
     end;  
   {初始化所有数据集}
      Show;
   end;
end;

procedure TfrmLocOutDetail.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior+[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=False;
  grdMoveLocOld.ClearGroupColumns;
end;

procedure TfrmLocOutDetail.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior-[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=True;
end;

procedure TfrmLocOutDetail.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmLocOutDetail.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure TfrmLocOutDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end; }
    Action := caFree;
    lampchange(lsmenu);
end;

procedure TfrmLocOutDetail.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdMoveLocOld);
  qrymovelocold.connection:=_adoconnection;
  qryTmp.connection:=_adoconnection;
end;

procedure TfrmLocOutDetail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
//    pgcMoveLoc.ActivePage := tbsLocInfo;

  end;
  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pgcMain.ActivePage=tbsEdit then
        begin
//          pgcMain.ActivePage:=tbsBrowse;
        end else
        begin
          pgcMain.ActivePage:=tbsEdit;
        end;


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

procedure TfrmLocOutDetail.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryMoveLocOld.Close;
  frmLocOutDetail:=nil;  
end;

procedure TfrmLocOutDetail.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmLocOutDetail.GetSql;
var
   I:integer;
   strFilterConno:String;
begin
   strFilter:='';
   strFilterconno:='';
   if cmbShipAccID.Text<>'' then strFilter:=strFilter+' and indetail.shippercusid="'+cmbShipAccID.TextField+'" ';
   if edtskuname.Text<>'' then strFilter:=strFilter+' and indetail.skuid="'+edtskuname.Textfield+'" ';
   if edtlocname.Text<>'' then strFilter:=strFilter+' and indetail.locid like "'+edtlocname.Textfield+'%" ';
   if edtmainorder.Text<>'' then strFilter:=strFilter+' and exists (select 1 from locationindetail detail     '
                                                     +'                     where indetail.jobno=detail.jobno      '
                                                     +'                       and detail.mainorder="'+edtmainorder.Text+'")';

   if (cmbstockno.Text<>'')  then
      strFilter:=strFilter+' and indetail.sealno>="'+cmbstockno.Text+'" ';
   if (cmbsealno.Text<>'') then
      strFilter:=strFilter+' and indetail.sealno<="'+cmbsealno.Text+'" ' ;
end;

procedure TfrmLocOutDetail.qryMoveLocOldAfterPost(DataSet: TDataSet);
begin
  if qryMoveLocOld.fieldbyname('SKUID').asstring='' then
  begin
    qryMoveLocOld.Delete;
  end;
end;

procedure TfrmLocOutDetail.grdMoveLocOldEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   with grdMoveLocOld do
   begin
     if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='Quantity') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='MAINORDER') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOCNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SEALNO') 
     then
     begin
       Allow:=False
     end else
       Allow:=True;
   end;
end;

procedure TfrmLocOutDetail.grdMoveLocOldEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (qryMoveLocOld.IsEmpty=True) then
   if  (qryMoveLocOld.IsEmpty=True) then
   begin
      mitAddLocOldClick(Sender);
   end;
end;

procedure TfrmLocOutDetail.grdMoveLocOldExit(Sender: TObject);
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

procedure TfrmLocOutDetail.grdMoveLocOldKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  with TdxDBGrid(Sender) do
  begin
//    if DataState in Setdcs then
//    begin
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
//    end;
  end;
end;

procedure TfrmLocOutDetail.cmbShipAccIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      cmbShipAccID.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      cmbShipAccID.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocOutDetail.cmbShipAccIDExit(Sender: TObject);
begin
   if cmbShipAccID.Text='' then cmbShipAccID.TextField:='';
end;

procedure TfrmLocOutDetail.cmbShipAccIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if cmbShipAccID.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 cusid,cusname from customer where cusname like "%"+"'+trim(cmbShipAccID.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         cmbShipAccID.Text:=datatmp.qryTmp.fieldbyname('cusname').asstring;
         cmbShipAccID.Textfield:=datatmp.qryTmp.fieldbyname('cusid').asstring;
      end else
      begin
         qrySelect:=pGetCustomerSelect('E','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            cmbShipAccID.TextField  :=qrySelect.FieldByName('cusid').asstring;
            cmbShipAccID.Text       :=qrySelect.FieldByName('cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocOutDetail.edtlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOquery;
begin
    qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
//       cmbLocationID.TextField  :=qrySelect.FieldByName('classid').asstring;
       edtlocname.TextField  :=qrySelect.FieldByName('locid').asstring;
       edtlocname.Text  :=qrySelect.FieldByName('locname').asstring;
    end;
    FreeAndNil(qrySelect);
end;

procedure TfrmLocOutDetail.edtlocnameExit(Sender: TObject);
begin
  if edtlocname.Text='' then edtlocname.TextField:='';
end;

procedure TfrmLocOutDetail.edtlocnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtlocname.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+trim(edtlocname.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         edtlocname.Text:=datatmp.qryTmp.fieldbyname('locname').asstring;
         edtlocname.Textfield:=datatmp.qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            edtlocname.TextField  :=qrySelect.FieldByName('locid').asstring;
            edtlocname.Text       :=qrySelect.FieldByName('locname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocOutDetail.edtskunameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=PGetSKUSelect('','','A');
   if qrySelect.IsEmpty<>true then
   begin
      qrySelect.First;
      edtskuname.TextField:=qrySelect.fieldbyname('classid').asString;
      edtskuname.Text     :=qrySelect.fieldbyname('SKUName').asString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocOutDetail.edtskunameExit(Sender: TObject);
begin
   if edtskuname.Text=''  then
   begin
      edtskuname.TextField:='';
   end;
end;

procedure TfrmLocOutDetail.edtskunameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtskuname.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 classid,skuid,skuname from sku where skuname like "%"+"'+trim(edtskuname.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         edtskuname.Text:=datatmp.qryTmp.fieldbyname('skuname').asstring;
         edtskuname.Textfield:=datatmp.qryTmp.fieldbyname('skuid').asstring;
      end else
      begin
         qrySelect:=PGetSKUSelect('','','A');
         if qrySelect.FieldByName('classid').AsString<>'NO' then
         begin
            edtskuname.TextField  :=qrySelect.FieldByName('skuid').asstring;
            edtskuname.Text       :=qrySelect.FieldByName('skuname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocOutDetail.btnQueryClick(Sender: TObject);
begin
   GetSql;
   strzsql:=' if exists(select * from tempdb..sysobjects where id=object_id("tempdb..#Outskudetail")               '+chr(13)+chr(10)
           +'   and sysstat & 0xf=3)                                                                             '+chr(13)+chr(10)
           +'  drop table #Outskudetail                                                                            '+chr(13)+chr(10)
           +'select jobnoin=indetail.jobno,snoin=indetail.sno,ldsnoin=indetail.ldsno,detailsnoin=indetail.detailsno,'
           +'       indetail.skuid,indetail.skuname,indetail.serialno,                         '+chr(13)+chr(10)
           +'       quantity=indetail.quantity-sum(isnull(outdetail.quantity,0)),indetail.locid,indetail.locname,indetail.sealno,'
           +'       quantitynew=indetail.quantity-sum(isnull(outdetail.quantity,0)),           '+chr(13)+chr(10)
           +'       piece=indetail.piece-sum(isnull(outdetail.piece,0)),                       '+chr(13)+chr(10)
           +'       piecenew=indetail.piece-sum(isnull(outdetail.piece,0)),                                   '+chr(13)+chr(10)
           +'       grossweight=indetail.grossweight-sum(isnull(outdetail.grossweight,0)),     '+chr(13)+chr(10)
           +'       grossweightnew=indetail.grossweight-sum(isnull(outdetail.grossweight,0)),                       '+chr(13)+chr(10)
           +'       netweight=indetail.netweight-sum(isnull(outdetail.netweight,0)),           '+chr(13)+chr(10)
           +'       netweightnew=indetail.netweight-sum(isnull(outdetail.netweight,0)),                           '+chr(13)+chr(10)
           +'       volume=indetail.volume-sum(isnull(outdetail.volume,0)),                    '+chr(13)+chr(10)
           +'       volumenew=indetail.volume-sum(isnull(outdetail.volume,0)),                                 '+chr(13)+chr(10)
           +'       area=indetail.area-sum(isnull(outdetail.area,0)),                          '+chr(13)+chr(10)
           +'       areanew=indetail.area-sum(isnull(outdetail.area,0)),                                     '+chr(13)+chr(10)
           +'       sno=0,locationin.mainorder,indetail.shippercusid,indetail.shippercusname,   '+chr(13)+chr(10)
           //lzw20090527
           +'       sku.skuspec,sku.skumodel,sku.color                                        '+chr(13)+chr(10)
           +'  into #Outskudetail                                                              '+chr(13)+chr(10)
           +'  from locinskudetail indetail(nolock)                                            '+chr(13)+chr(10)
           +'            left join  locationin (nolock)                                        '+chr(13)+chr(10)
           +'                   on  locationin.jobno=indetail.jobno                            '+chr(13)+chr(10)
           +'            left join locoutskudetail outdetail(nolock)                           '+chr(13)+chr(10)
           +'                   on outdetail.jobnoin=indetail.jobno                             '+chr(13)+chr(10)
           +'                  and outdetail.snoin=indetail.sno                                 '+chr(13)+chr(10)
           +'                  and outdetail.ldsnoin=indetail.ldsno                             '+chr(13)+chr(10)
           +'                  and outdetail.detailsnoin=indetail.detailsno                     '+chr(13)+chr(10)
           //lzw20090527
           +'            left join  sku (nolock)                                        '+chr(13)+chr(10)
           +'                   on  sku.skuid=indetail.skuid                            '+chr(13)+chr(10)
           +' where 1=1                                                                         '+chr(13)+chr(10)
           +'   and isnull(indetail.disaccord,"F")<>"T"                                         '+chr(13)+chr(10)
           +IIF(_Useridcan<>'',
               ' and (indetail.userid in '+_Useridcan+' or indetail.iuserid in '+_Useridcan+') ',
               ' and (indetail.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
              +'    or indetail.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)

           +strFilter
           +'group by indetail.jobno,indetail.sno,indetail.ldsno,indetail.detailsno,            '+chr(13)+chr(10)
           +'         indetail.skuid,indetail.skuname,indetail.serialno,                        '+chr(13)+chr(10)
           +'         indetail.quantity,indetail.locid,indetail.locname,indetail.sealno,        '+chr(13)+chr(10)
           +'         locationin.mainorder,indetail.shippercusid,indetail.shippercusname,     '+chr(13)+chr(10)
           +'         indetail.piece,indetail.grossweight,indetail.netweight,indetail.volume, indetail.area, '+chr(13)+chr(10)
           //lzw20090527
           +'         sku.skuspec,sku.skumodel,sku.color                                        '+chr(13)+chr(10)
           +'  having sum(isnull(outdetail.quantity,0))<indetail.quantity               '+chr(13)+chr(10)
           +' declare @i smallint                                                             '+chr(13)+chr(10)
           +'  select @i=1                                                                    '+chr(13)+chr(10)
           +'  update #Outskudetail set sno=@i,@i=@i+1                                        '+chr(13)+chr(10)
           +'select jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno,                 '+chr(13)+chr(10)
           +'       quantity,locid,locname,sealno,quantitynew,shippercusid,shippercusname,    '+chr(13)+chr(10)
           +'       sno,salver=convert(varchar(20),""),mainorder,checked="F",piece,piecenew,   '+chr(13)+chr(10)
           +'       grossweight,grossweightnew,netweight,netweightnew,volume,volumenew,area,areanew,  '+chr(13)+chr(10)
           //lzw20090527
           +'       skuspec,skumodel,color  '+chr(13)+chr(10)
           +'  from #Outskudetail     '                                                                      ;
   qryMoveLocOld.Close;
   qryMoveLocOld.SQL.Clear;
   qryMoveLocOld.SQL.Add(strZsql);
   qryMoveLocOld.Open;
   btnOK.Enabled:=true;
end;

procedure TfrmLocOutDetail.cmbchoiceExit(Sender: TObject);
begin
   if cmbchoice.Text='品    名' then
   begin
      edtskuname.Visible:=true;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=False;
      cmbsealno.Visible:=False;
      lblF.Visible:=False;
      lblT.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='主订单号' then
   begin
      edtskuname.Visible:=false;
      edtmainorder.Visible:=true;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=False;
      cmbsealno.Visible:=False;
      lblF.Visible:=False;
      lblT.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='仓    位' then
   begin
      edtskuname.Visible:=false;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=True;
      cmbstockno.Visible:=False;
      cmbsealno.Visible:=False;
      lblF.Visible:=False;
      lblT.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='货    主' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=False;
      edtlocname.Visible:=False;
      cmbstockno.Visible:=False;
      cmbsealno.Visible:=False;
      lblF.Visible:=False;
      lblT.Visible:=False;
      cmbShipAccID.Visible:=true;
   end else
   if cmbchoice.Text='托 盘 号' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=true;
      cmbsealno.Visible:=True;
      lblF.Visible:=True;
      lblT.Visible:=True;
      cmbShipAccID.Visible:=False;
   end;
end;

procedure TfrmLocOutDetail.cmbchoiceChange(Sender: TObject);
begin
   edtskuname.Text:='';
   edtskuname.TextField:='';
   edtmainorder.Text:='';
   edtlocname.Text :='';
   edtlocname.TextField:='';
   cmbstockno.Text:='';
   cmbsealno.Text:='';
   cmbShipAccID.Text:='';
   cmbShipAccID.TextField:='';
end;

procedure TfrmLocOutDetail.btnOKClick(Sender: TObject);
var
   strlocbillno,strjobno:string;
   StrCusInvo,strskuname:String;
   quantitytotal :extended;
   Year,Month,Day:word;
   qryselect:TKADOQuery;
   maxsno:Integer;
begin
   if edtIuserId.Text='' then
   begin
      KMessageDlg('执行组织不能为空！',mtWarning,[mbOK],0);
      edtIuserId.SetFocus;
      Exit;
   end;
   if edtCusname.Text='' then
   begin
      KMessageDlg('费用关系人不能为空！',mtWarning,[mbOK],0);
      edtCusname.SetFocus;
      Exit;
   end;
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
      strlocbillno:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,datatmp.qryTmp.FieldByName('LastNum').AsInteger,'0',psLeft);
   end else
   begin
       opensql(datatmp.qryTmp,
               'select dhcx=max(convert(int,substring(docno1,7,8))) '
              +'  from genjobno '
              +' where substring(docno1,1,2)="CC"  '
              +'       and substring(jobno,5,2)="LO"  '
              +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
      strlocbillno:='CC'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   end;

   try
      while True do
      begin
         try
            _ADOConnection.Starttransaction;
            strjobno:=genJobno('LO',strlocbillno);
            ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
             +'where id=object_id("tempdb..#lskskudetail") and sysstat & 0xf=3)'+chr(13)+chr(10)
             +'drop table #lskskudetail'+chr(13)+chr(10)
             +'create table #lskskudetail'+chr(13)+chr(10)
             +'            (jobno                 varchar(20) null,'+chr(13)+chr(10)
             +'             sno                   bigint null,'+chr(13)+chr(10)
             +'             ldsno                 bigint  null,'+chr(13)+chr(10)
             +'             detailsno             bigint  null,'+chr(13)+chr(10)
             +'             jobnoin               varchar(20) null,'+chr(13)+chr(10)
             +'             snoin                 smallint null,'+chr(13)+chr(10)
             +'             ldsnoin               smallint      null,'+chr(13)+chr(10)
             +'             detailsnoin           smallint  null,'+chr(13)+chr(10)
             +'             quantity              numeric(16,4) null,'+chr(13)+chr(10)
             +'             locid                 varchar(40) null,'+chr(13)+chr(10)
             +'             locname               varchar(20) null,'+chr(13)+chr(10)
             +'             skuid                 varchar(40) null,'+chr(13)+chr(10)
             +'             skuname               varchar(50) null,'+chr(13)+chr(10)
             //lzw20090609
             +'             skuspec               varchar(50) null,'+chr(13)+chr(10)
             +'             skumodel              varchar(50) null,'+chr(13)+chr(10)
             +'             color                 varchar(40) null,'+chr(13)+chr(10)

             +'             iuserid               varchar(20) null,'+chr(13)+chr(10)
             +'             iusername             varchar(30) null,'+chr(13)+chr(10)
             +'             userid                varchar(20) null,'+chr(13)+chr(10)
             +'             username              varchar(30) null,'+chr(13)+chr(10)
             +'             quantitynew           numeric(16,4) null,'+chr(13)+chr(10)
             +'             shippercusid          varchar(20) null,'+chr(13)+chr(10)
             +'             shippercusname        varchar(30) null,'+chr(13)+chr(10)
             +'             serialno              varchar(20) null,'+chr(13)+chr(10)
             +'             sealno                varchar(20) null,'+chr(13)+chr(10)
             +'             mainorder             varchar(30) null,'+chr(13)+chr(10)
             +'             taskdate              datetime    null,'+chr(13)+chr(10)
             +'             locationbillno        varchar(30) null,'+chr(13)+chr(10)
             +'             piece                 numeric(16,4) null,'+chr(13)+chr(10)
             +'             piecenew              numeric(16,4) null,'+chr(13)+chr(10)
             +'             grossweight           numeric(16,4) null,'+chr(13)+chr(10)
             +'             grossweightnew        numeric(16,4) null,'+chr(13)+chr(10)
             +'             netweight             numeric(16,4) null,'+chr(13)+chr(10)
             +'             netweightnew          numeric(16,4) null,'+chr(13)+chr(10)
             +'             volume                numeric(16,4) null,'+chr(13)+chr(10)
             +'             volumenew             numeric(16,4) null,'+chr(13)+chr(10)
             +'             area                  numeric(16,4) null,'+chr(13)+chr(10)
             +'             areanew               numeric(16,4) null'+chr(13)+chr(10)
             +'            )');
            qryMoveLocOld.First;
            while not qryMoveLocOld.Eof do
            begin
               if qryMoveLocOld.FieldByName('checked').asstring='T' then
               begin
                  if (qryMoveLocOld.FieldByName('quantity').asfloat>=qryMoveLocOld.FieldByName('quantitynew').asfloat)
                     and ( qryMoveLocOld.FieldByName('quantitynew').asfloat<>0) then
                     ExecSql(dataTmp.qryTmp,' insert into #lskskudetail '+chr(13)+chr(10)
                                           +'   (jobno,skuid,skuname, '+chr(13)+chr(10)
                                           //lzw20090609
                                           +'    skuspec,skumodel,color, '+chr(13)+chr(10)

                                           +'    quantity, '+chr(13)+chr(10)
                                           +'    sno,ldsno,detailsno, '+chr(13)+chr(10)
                                           +'   jobnoin,snoin,ldsnoin,detailsnoin, '+chr(13)+chr(10)
                                           +'   serialno,sealno,mainorder,'+chr(13)+chr(10)
                                           +'   locid,locname,shippercusid,shippercusname,iuserid,iusername,'+chr(13)+chr(10)
                                           +'   userid,username,taskdate,locationbillno, '+chr(13)+chr(10)
                                           +'   piece,grossweight,netweight,volume,area ) '+chr(13)+chr(10)
                                           +' values("'+strjobno+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('skuid').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('skuname').asstring+'",'
                                           //lzw20090609
                                           +'        "'+qryMoveLocOld.FieldByName('skuspec').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('skumodel').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('color').asstring+'",'

                                           +'        '+floattostr(qryMoveLocOld.FieldByName('quantitynew').asfloat)+','
                                           +'        0,'+qryMoveLocOld.FieldByName('sno').asstring+','+qryMoveLocOld.FieldByName('sno').asstring+','
                                           +'        "'+qryMoveLocOld.FieldByName('jobnoin').asstring+'",'
                                           +'        '+qryMoveLocOld.FieldByName('snoin').asstring+','
                                           +'        '+qryMoveLocOld.FieldByName('ldsnoin').asstring+','
                                           +'        '+qryMoveLocOld.FieldByName('detailsnoin').asstring+','
                                           +'        "'+qryMoveLocOld.FieldByName('serialno').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('sealno').asstring+'",'
                                           +'        "'+edtMainorderO.Text+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('locid').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('locname').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('shippercusid').asstring+'",'
                                           +'        "'+qryMoveLocOld.FieldByName('shippercusname').asstring+'",'
                                           +'        "'+_userid+'","'+_username+'","'+_userid+'","'+_username+'",  '
                                           +'        "'+datetimetostr(dtdReceDateT.date)+'","'+strlocbillno+'" ,'
                                           +'        '+floattostr(qryMoveLocOld.FieldByName('piecenew').asfloat)+','
                                           +'        '+floattostr(qryMoveLocOld.FieldByName('grossweightnew').asfloat)+','
                                           +'        '+floattostr(qryMoveLocOld.FieldByName('netweightnew').asfloat)+','
                                           +'        '+floattostr(qryMoveLocOld.FieldByName('volumenew').asfloat)+','
                                           +'        '+floattostr(qryMoveLocOld.FieldByName('areanew').asfloat)+''
                                           +')');
               end;
               qryMoveLocOld.Next;
            end;
            openSql(qryTmp,' select skuname,skuid,quantity=sum(isnull(quantity,0)) from #lskskudetail group by skuname,skuid');
            strskuname:='';
            quantitytotal:=0;
            while not qryTmp.Eof do
            begin
               quantitytotal:=quantitytotal+qryTmp.fieldbyname('quantity').asfloat;
               if pos(qryTmp.fieldbyname('skuname').asstring,strskuname)=0 then
                  strskuname:=strskuname+qryTmp.fieldbyname('skuname').asstring;
               qryTmp.Next;
            end;
            //lzw20091231
            if strsyscusname='SWZ' then
            begin
               opensql(qryTmp,'select mincostin=isnull(mincostin,0)  from  customer where cusid="'+edtCusname.TextField+'"')
            end;
            if qryTmp.RecordCount<>0 then
               ExecSql(dataTmp.qryTmp,' insert into locationout '+chr(13)+chr(10)
                                     +'   (jobno,locationbillno, createname, createdate,userid, username,'+chr(13)+chr(10)
                                     +'    iuserid,iusername,operationtype,skucostclasscd,mainorder,taskdate,'+chr(13)+chr(10)
                                     +'    costcusid,costcusname,skuname,quantity,mincostin) '+chr(13)+chr(10)
                                     +'  values '
                                     +'   ("'+strjobno+'","'+strlocbillno+'","'+_loginname+'",getdate(),'
                                     +'    "'+_userid+'","'+_username+'","'+edtIuserId.TextField+'","'+edtIuserId.Text+'",-1,"COMMON",'
                                     +'    "'+edtMainorderO.Text+'","'+datetimetostr(dtdReceDateT.date)+'",'
                                     +'    "'+edtCusname.textfield+'","'+edtCusname.Text+'","'+strskuname+'", '
                                     +'    '+floattostr(quantitytotal)+', '+floattostr(qryTmp.FieldByName('mincostin').asfloat)+' )'
                                     );
               if strsyscusname='SWZ' then
               begin
                  qrySelect:=pGetCuscnfgSelect( edtCusname.textfield,edtCusname.Text,'仓储');
                  if (qrySelect.FieldByName('jobno').AsString<>'NO') and (not qryselect.isempty) then
                  begin
                     OpenSql(dataTmp.qryTmp,' select cusid ,cpid,costcd,ismainrate=isnull(ismainrate,"F"),'
                                           +'        isincome=isnull(isincome,"F"),ratecus,costcus,costcountuomtype,countway, '
                                           +'        cnfgcostcusid=isnull(cnfgcostcusid,""),cnfgcostcusname,cnfgratecusid=isnull(cnfgratecusid,""),cnfgratecusname   '
                                           +'   from cuscnfgitem (nolock) '
                                           +'  where jobno="'+qrySelect.fieldbyname('jobno').AsString+'"'
                                           +'    and cpid="出仓" '
                             );
                      dataTmp.qryTmp.First;
                      maxsno:=0;
                      while not dataTmp.qryTmp.Eof do
                      begin
                         maxsno:=maxsno+1;
                         ExecSql(dataTmp.qryTmp1,' insert into autocountcost  '+chr(13)+chr(10)
                                            +' (jobno, sno, costcd, isincome,'+chr(13)+chr(10)
                                            +' ismainrate, costcusid, costcusname, ratecusid,'+chr(13)+chr(10)
                                            +' ratecusname, ratecus, costcus, rateuomtype, '+chr(13)+chr(10)
                                            +' countway,skuwtve,skucostclass ) '+chr(13)+chr(10)
                                            +' values '+chr(13)+chr(10)
                                            +' ("'+strjobno+'", '+inttostr(maxsno)+', '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('costcd').AsString+'", '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('isincome').AsString+'", '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('ismainrate').AsString+'", '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('cnfgcostcusid').AsString+'",'+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('cnfgcostcusname').AsString+'",'+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('cnfgratecusid').AsString+'",'+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('cnfgratecusname').AsString+'",'+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('ratecus').AsString+'", '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('costcus').AsString+'", '+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('costcountuomtype').AsString+'",'+chr(13)+chr(10)
                                            +'  "'+dataTmp.qryTmp.fieldbyname('countway').AsString+'", '+chr(13)+chr(10)
                                            +'  0,'+chr(13)+chr(10)
                                            +'  "" '+chr(13)+chr(10)
                                            +'   )'
                                            );
                         dataTmp.qryTmp.next;
                      end;
                  end;
               end;  
            ExecSql(dataTmp.qryTmp,'ksp_locdetailout "'+datetostr(dtdReceDateT.date)+'" ,"'+_loginid+'" ');
            kspLocationOutDetail(strjobno,'T');
            kspLocationOutItem(strjobno,'T');
            kspLocationOutskudetail(strjobno,'','T');

            _ADOConnection.Commit;

            KMessageDlg('下达出仓任务完成!',mtInformation,[mbOK],0);
//            Exit;
            Break;
         except
            _ADOConnection.Rollback; //先结束事务
            begin
               raise;
               exit;
            end;
         end;
      end;
   except
      while not qryMoveLocOld.Eof do
      begin
         qryMoveLocOld.Delete;
      end;
      ExecSql(dataTmp.qryTmp,'delete from genjobno where jobno="'+strjobno+'"');
   end;
   droplsk('#Outskudetail');
   droplsk('#lskskudetail');
   btnQueryClick(Sender);

end;

procedure TfrmLocOutDetail.btncancellClick(Sender: TObject);
begin
   frmLocOutDetail.Close;
end;

procedure TfrmLocOutDetail.newlocnameValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if grdMoveLocOld.InplaceEditor.GetEditingText<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+trim(grdMoveLocOld.InplaceEditor.GetEditingText)+'"+"%"') ;
      qryMoveLocOld.Edit;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         qryMoveLocOld.FieldByName('newlocname').AsString:=datatmp.qryTmp.fieldbyname('locname').asstring;
         qryMoveLocOld.FieldByName('newlocid').AsString:=datatmp.qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            qryMoveLocOld.FieldByName('newlocid').AsString  :=qrySelect.FieldByName('locid').asstring;
            qryMoveLocOld.FieldByName('newlocname').AsString  :=qrySelect.FieldByName('locname').asstring;
         end else Accept:=False;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmLocOutDetail.mitAddLocOldClick(Sender: TObject);
begin
   qryMoveLocOld.DisableControls;
   //lzw20090609
   qryMoveLocOld.First;
   while not qryMoveLocOld.eof do
   begin
      qryMoveLocOld.Edit;
      qryMoveLocOld.FieldByName('checked').asstring:='T';
      qryMoveLocOld.Next;
   end;
   qryMoveLocOld.First;
   qryMoveLocOld.EnableControls;
end;

procedure TfrmLocOutDetail.mitDelLocOldClick(Sender: TObject);
begin
   qryMoveLocOld.DisableControls;
   //lzw20090609
   qryMoveLocOld.First;
    while not qryMoveLocOld.eof do
    begin
       qryMoveLocOld.Edit;
       qryMoveLocOld.FieldByName('checked').asstring:='F';
       qryMoveLocOld.Next;
    end;
   qryMoveLocOld.First;
   qryMoveLocOld.EnableControls;
end;

procedure TfrmLocOutDetail.edtIuserIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtIuserId.TextField:=qrySelect.FieldByName('userid').asstring;
      edtIuserId.Text     :=qrySelect.FieldByName('username').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocOutDetail.edtCusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('C','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      edtCusname.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCusname.Text  :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

end.
