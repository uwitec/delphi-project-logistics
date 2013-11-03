unit MoveLocinsku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmMoveLocinsku = class(TForm)
    ToolPanel: TPanel;
    Bevel1: TBevel;
    btnClose: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    popMoveLocOld: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    KGroupBox2: TKGroupBox;
    RxSplitter1: TRxSplitter;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCreateName: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    dtdcreatedate: TdxDBDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtcheckname: TdxDBEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    dtdcheckdate: TdxDBDateEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtjobno: TdxDBEdit;
    udsMoveLocOld: TKadoUpdateSql;
    dtsMoveLocOld: TDataSource;
    qryMoveLocOld: TKADOQuery;
    udsMoveloc: TKadoUpdateSql;
    dtsMoveLoc: TDataSource;
    qryMoveLoc: TKADOQuery;
    dtsML: TDataSource;
    qryML: TKADOQuery;
    grdMoveLocOld: TdxDBGrid;
    qryselect: TKADOQuery;
    KGroupBox5: TKGroupBox;
    lblfind: TGMSStickyLabel;
    cmbchoice: TKinPickEdit;
    edtlocationbillno: TdxEdit;
    edtlocname: TdxButtonEdit;
    btnQuery: TKBitBtn;
    cmbShipAccID: TdxButtonEdit;
    quantitynew: TdxDBGridCurrencyColumn;
    btnOK: TKBitBtn;
    jobnoin: TdxDBGridColumn;
    snoin: TdxDBGridColumn;
    ldsnoin: TdxDBGridColumn;
    detailsnoin: TdxDBGridColumn;
    skuid: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    serialno: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    newlocname: TdxDBGridButtonColumn;
    btncancell: TKBitBtn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    edtcustomerno: TdxEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure grdMovelocDblClick(Sender: TObject);
    procedure PieceOldValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure newlocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure qryMoveLocOldAfterPost(DataSet: TDataSet);
    procedure grdMoveLocOldEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdMoveLocOldEnter(Sender: TObject);
    procedure grdMoveLocOldExit(Sender: TObject);
    procedure grdMoveLocOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NewlocidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
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
    procedure btnQueryClick(Sender: TObject);
    procedure cmbchoiceExit(Sender: TObject);
    procedure cmbchoiceChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncancellClick(Sender: TObject);
    procedure newlocnameValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
  private
    { Private declarations }
    //变量定义
    strMLjobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    strJobno:string;
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
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure pgcRelocationChange(Sender: TObject);
    procedure GetSql;
    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//记录商品明细删除,datas中.
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkMoveLocinsku;

var
  frmMoveLocinsku: TfrmMoveLocinsku;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect;

var strpJobno,strClassID,strZsql,strMxpjbz:string;

procedure WorkMoveLocinsku;
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   if frmMoveLocinsku <> nil then
   with frmMoveLocinsku do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmMoveLocinsku:=TfrmMoveLocinsku.Create(application);

   with frmMoveLocinsku do
   begin
     btnOK.Enabled:=false;
     strsql :=' select old.*,sku.skumodel,sku.skuspec,sku.piecepro '+chr(13)+chr(10)
             +'   from movelocold old(nolock),sku(nolock) '+chr(13)+chr(10)
             +'  where 1=2  ';
     qryMoveLocOld.Close;
     qryMoveLocOld.SQL.Clear;
     qryMoveLocOld.SQL.Add(strsql);
     qryMoveLocOld.Open;

     Show;
   end;
end;

procedure TfrmMoveLocinsku.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior+[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=False;
  grdMoveLocOld.ClearGroupColumns;
end;

procedure TfrmMoveLocinsku.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  if qryMl.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior-[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=True;
end;

procedure TfrmMoveLocinsku.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmMoveLocinsku.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
   if not ScrollAfterEdit and blnOpen then
   begin
     if qryMoveLoc.Active then
     begin
        qryMoveLoc.Close;
        qryMoveLoc.Open;
     end;
     if qryMoveLocOld.Active then
     begin
        qryMoveLocOld.Close;
        qryMoveLocOld.Open;
     end;
     ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      qryMoveLoc.Active     :=blnOpen;
      qryMoveLocOld.Active  :=blnOpen;
   end else
   begin
      qryMoveLoc.Active     :=blnOpen;
      qryMoveLocOld.Active  :=blnOpen;
   end;
end;

procedure TfrmMoveLocinsku.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmMoveLocinsku.FormClose(Sender: TObject;
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

procedure TfrmMoveLocinsku.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdMoveLocOld);
  qryml.Connection:=_adoconnection;
  qrymoveloc.Connection:=_adoconnection;
  qrymovelocold.connection:=_adoconnection;
  qryselect.connection:=_adoconnection;
end;

procedure TfrmMoveLocinsku.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryMoveLocOld.Close;
  qryMoveLoc.Close;
  qryML.Close;
  frmMoveLocinsku:=nil;  
end;

procedure TfrmMoveLocinsku.pgcRelocationChange(Sender: TObject);
begin

end;

function TfrmMoveLocinsku.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result:=True;
   case pField of
      2:
       begin
//
       end;
      4:
       begin
          qrySelect:=pGetCustomerSelect('A','');
          if qrySelect.FieldByName('cusid').AsString<>'NO' then
          begin
             PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
             PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
          end;
          freeandnil(qrySelect);
       end;
      5:
       begin
         qrySelect:=pGetOrganizationSelect('','','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            PItems[0]      :=qrySelect.FieldByName('username').asstring;
            PItemFields[0] :=qrySelect.FieldByName('userid').asstring;
         end;
         freeandnil(qrySelect);
       end;
   else
      Result:=False;
   end;
end;

procedure TfrmMoveLocinsku.mitAddLocOldClick(Sender: TObject);
begin
   grdMoveLocOld.SetFocus;
   qryMoveLocOld.Append;
//   grdMoveLocOldbeforeInsert;
end;

procedure TfrmMoveLocinsku.grdMovelocDblClick(Sender: TObject);
begin
//   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmMoveLocinsku.PieceOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   pieceOldValue:Extended;
begin
 
end;

procedure TfrmMoveLocinsku.newlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         qrymovelocold.edit;
         qrymovelocold.FieldByName('NewLocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         qrymovelocold.FieldByName('NewLocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
end;

procedure TfrmMoveLocinsku.GetSql;
var
   I:integer;
   strFilterConno:String;
begin
   strFilter:='';
   strFilterconno:='';
   if cmbShipAccID.Text<>'' then strFilter:=strFilter+' and locinskudetail.shippercusid="'+cmbShipAccID.TextField+'" ';
   if edtcustomerno.Text<>'' then strFilter:=strFilter+' and locinskudetail.serialno="'+edtcustomerno.Text+'" ';
   if edtlocname.Text<>'' then strFilter:=strFilter+' and locinskudetail.locid like "'+edtlocname.Textfield+'%" ';
   if edtlocationbillno.Text<>'' then strFilter:=strFilter+' and exists (select 1 from locationindetail detail     '
                                                     +'                     where locinskudetail.jobno=detail.jobno      '
                                                     +'                       and detail.locationbillno="'+edtlocationbillno.Text+'")';

end;

procedure TfrmMoveLocinsku.qryMoveLocOldAfterPost(DataSet: TDataSet);
begin
  if qryMoveLocOld.fieldbyname('SKUID').asstring='' then
  begin
    qryMoveLocOld.Delete;
  end;
end;

procedure TfrmMoveLocinsku.grdMoveLocOldEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   with grdMoveLocOld do
   begin
     if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SERIALNO') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUSPEC') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOCNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COLOR')  then
     begin
       Allow:=False
     end else
       Allow:=True;
   end;
end;

procedure TfrmMoveLocinsku.grdMoveLocOldEnter(Sender: TObject);
begin
//   if (DataState in setdcs) and (qryMoveLocOld.IsEmpty=True) then
   if  (qryMoveLocOld.IsEmpty=True) then
   begin
      mitAddLocOldClick(Sender);
   end;
end;

procedure TfrmMoveLocinsku.grdMoveLocOldExit(Sender: TObject);
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

procedure TfrmMoveLocinsku.grdMoveLocOldKeyDown(Sender: TObject;
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

procedure TfrmMoveLocinsku.NewlocidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
//   if (DataState in Setdcs) then
//   begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         qryMoveLocOld.edit;
         qryMoveLocOld.FieldByName('NewLocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         qryMoveLocOld.FieldByName('NewLocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
//   end;
end;

procedure TfrmMoveLocinsku.cmbShipAccIDButtonClick(Sender: TObject;
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

procedure TfrmMoveLocinsku.cmbShipAccIDExit(Sender: TObject);
begin
   if cmbShipAccID.Text='' then cmbShipAccID.TextField:='';
end;

procedure TfrmMoveLocinsku.cmbShipAccIDExitCheck(Sender: TObject;
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

procedure TfrmMoveLocinsku.edtlocnameButtonClick(Sender: TObject;
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

procedure TfrmMoveLocinsku.edtlocnameExit(Sender: TObject);
begin
  if edtlocname.Text='' then edtlocname.TextField:='';
end;

procedure TfrmMoveLocinsku.edtlocnameExitCheck(Sender: TObject;
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

procedure TfrmMoveLocinsku.btnQueryClick(Sender: TObject);
begin
   GetSql;
   strzsql:=' if exists(select * from tempdb..sysobjects where id=object_id("tempdb..#skudetail")                '+chr(13)+chr(10)
           +'   and sysstat & 0xf=3)                                                                             '+chr(13)+chr(10)
           +'  drop table #skudetail                                                                             '+chr(13)+chr(10)
           +'select jobnoin=locinskudetail.jobno,snoin=locinskudetail.sno,ldsnoin=locinskudetail.ldsno,          '+chr(13)+chr(10)
           +'       detailsnoin=detailsno,locinskudetail.skuid,locinskudetail.skuname,serialno,                  '+chr(13)+chr(10)
           +'       locinskudetail.shippercusid,quantity=quantityremain,locinskudetail.locid,                    '+chr(13)+chr(10)
           +'       locinskudetail.sealno,newlocid=convert(varchar(30),""),                                      '+chr(13)+chr(10)
           +'       locinskudetail.locname,newlocname=convert(varchar(20),""),quantitynew=0,skuspec,color,       '+chr(13)+chr(10)
           +'       jobno=space(20),sno=0,locationin.locationbillno                                              '+chr(13)+chr(10)
           +'  into #skudetail                                                                                   '+chr(13)+chr(10)
           +'  from locinskudetail (nolock)                                                                      '+chr(13)+chr(10)
           +'        left join  locationin (nolock)                                                              '+chr(13)+chr(10)
           +'               on  locationin.jobno=locinskudetail.jobno                                            '+chr(13)+chr(10)
           +' where isnull(quantityremain,0)<>0'
           +IIF(_Useridcan<>'',
               ' and (locinskudetail.userid in '+_Useridcan+' or locinskudetail.iuserid in '+_Useridcan+') ',
               ' and (locinskudetail.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
              +'    or locinskudetail.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)

           +strFilter
           +' declare @i smallint '
           +'  select @i=0 '
           +'  update #skudetail set sno=@i,@i=@i+1 '
           +'select jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno, shippercusid,          '+chr(13)+chr(10)
           +'       quantity,locid,locname,sealno,newlocid,newlocname,quantitynew,                   '+chr(13)+chr(10)
           +'       jobno,sno,salver=convert(varchar(20),""),locationbillno,skuspec,color            '+chr(13)+chr(10)
           +'  from #skudetail     '                                                                      ;
   qryMoveLocOld.Close;
   qryMoveLocOld.SQL.Clear;
   qryMoveLocOld.SQL.Add(strZsql);
   qryMoveLocOld.Open;
   btnOK.Enabled:=true;

end;

procedure TfrmMoveLocinsku.cmbchoiceExit(Sender: TObject);
begin
   if cmbchoice.Text='商品编码' then
   begin
      edtcustomerno.Visible:=true;
      edtlocationbillno.Visible:=false;
      edtlocname.Visible:=false;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='仓 单 号' then
   begin
      edtcustomerno.Visible:=false;
      edtlocationbillno.Visible:=true;
      edtlocname.Visible:=false;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='仓    位' then
   begin
      edtcustomerno.Visible:=false;
      edtlocationbillno.Visible:=false;
      edtlocname.Visible:=True;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='货    主' then
   begin
      edtcustomerno.Visible:=False;
      edtlocationbillno.Visible:=false;
      edtlocname.Visible:=false;
      cmbShipAccID.Visible:=true;
   end;
end;

procedure TfrmMoveLocinsku.cmbchoiceChange(Sender: TObject);
begin
   edtcustomerno.Text:='';
   edtlocationbillno.Text:='';
   edtlocname.Text :='';
   edtlocname.TextField:='';
   cmbShipAccID.Text:='';
   cmbShipAccID.TextField:='';
end;

procedure TfrmMoveLocinsku.btnOKClick(Sender: TObject);
var
  strlocbillno:string;
begin
   strMLJobno:='';
   opensql(dataTmp.qryTmp,
           'select dhcx=max(convert(int,substring(docno1,7,8))) '
          +'  from genjobno '
          +' where substring(docno1,1,2)="ML"  '
          +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   strLocbillno:='ML'+copy(datetostr(GetServerDate),1,4)
                     +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   strMLJobno:=genJobno('ML',strLocbillno);

   try
      while True do
      begin
         try
            _ADOConnection.Starttransaction;
            qryMoveLocOld.First;
            while not qryMoveLocOld.Eof do
            begin
               if (qryMoveLocOld.FieldByName('newlocid').asstring<>qryMoveLocOld.FieldByName('locname').asstring)
                  and ( qryMoveLocOld.FieldByName('quantitynew').asfloat<>0) then
                  ExecSql(dataTmp.qryTmp,'insert into movelocold(jobno,sno,jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno,shippercusid,         '+chr(13)+chr(10)
                                        +'                      quantity,locid,locname,newlocid,newlocname,quantitynew,                                                '+chr(13)+chr(10)
                                        +'                      locationbillno,confirmed,currcd,price,operationtype,iuserid,iusername,userid,username)  '
                                        +' values("'+strMLJobno+'",'
                                        +'        '+qryMoveLocOld.FieldByName('sno').asstring+','
                                        +'        "'+qryMoveLocOld.FieldByName('jobnoin').asstring+'",'
                                        +'        '+qryMoveLocOld.FieldByName('snoin').asstring+','
                                        +'        '+qryMoveLocOld.FieldByName('ldsnoin').asstring+','
                                        +'        '+qryMoveLocOld.FieldByName('detailsnoin').asstring+','
                                        +'        "'+qryMoveLocOld.FieldByName('skuid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('skuname').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('serialno').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('shippercusid').asstring+'",'
                                        +'        '+floattostr(qryMoveLocOld.FieldByName('quantity').asfloat)+','
                                        +'        "'+qryMoveLocOld.FieldByName('locid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('locname').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('newlocid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('newlocname').asstring+'",'
                                        +'        '+floattostr(qryMoveLocOld.FieldByName('quantitynew').asfloat)+','
                                        +'        "'+qryMoveLocOld.FieldByName('locationbillno').asstring+'",'
                                        +'        "T","RMB",0,-1,"'+_userid+'","'+_username+'","'+_userid+'","'+_username+'"  '
                                        +')');
               qryMoveLocOld.Next;
            end;
            ExecSql(dataTmp.qryTmp,'ksp_Movelocskudetailfirm  @pjobno="'+strMLJobno+'"');
            ExecSql(dataTmp.qryTmp,' insert into moveloc '
                                  +'   (jobno, createname, createdate, operationname, operationdate ,userid, username,'
                                  +'    iuserid,iusername,operationtype,skucostclasscd,confirmed) '
                                  +'  values '
                                  +'   ("'+strMLJobno+'","'+_loginname+'",getdate(),"'+_loginname+'",getdate(),'
                                  +'     "'+_userid+'","'+_username+'","'+_userid+'","'+_username+'",-1,"COMMON","T" )');
            _ADOConnection.Commit;

            KMessageDlg('移仓操作完成!',mtInformation,[mbOK],0);
            frmMoveLocinsku.btnQueryClick(Sender);
            Exit;

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
   end;
   qryMoveLocOld.DisableControls;
   arrMoveLocOld:=ScatterToArray(qryMoveLocOld,False,0);
   qryMoveLocOld.applyupdates;

   droplsk('#skudetail');
   qryMoveLocOld.CommitUpdates;
   qryMoveLocOld.EnableControls;
   ScrollAfterEdit:=False;
  // WorkCall(stInsert);
end;

procedure TfrmMoveLocinsku.btncancellClick(Sender: TObject);
begin
   frmMoveLocinsku.Close;
end;

procedure TfrmMoveLocinsku.newlocnameValidate(Sender: TObject;
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

end.
