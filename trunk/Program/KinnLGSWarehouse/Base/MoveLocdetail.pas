unit MoveLocdetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmMoveLocdetail = class(TForm)
    ToolPanel: TPanel;
    Bevel1: TBevel;
    btnClose: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    popMoveLocdetail: TPopupMenu;
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
    grdMovelocskudetail: TdxDBGrid;
    qrylocdetail: TKADOQuery;
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
    keyid: TdxDBGridColumn;
    skubrand: TdxDBGridColumn;
    btncancell: TKBitBtn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    edtcustomerno: TdxEdit;
    dtslocdetail: TDataSource;
    qrytmp: TKADOQuery;
    newskubrand1: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure grdMovelocskudetailEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
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
    procedure quantitynewValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdMovelocskudetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure GetSql;
    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//记录商品明细删除,datas中.
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkMoveLocdetail;

var
  frmMoveLocdetail: TfrmMoveLocdetail;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect;

var strpJobno,strClassID,strZsql,strMxpjbz:string;

procedure WorkMoveLocdetail;
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   if frmMoveLocdetail <> nil then
   with frmMoveLocdetail do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmMoveLocdetail:=TfrmMoveLocdetail.Create(application);

   with frmMoveLocdetail do
   begin
     btnOK.Enabled:=false;
     strsql :=' select locinskudetail.*,sku.skucards,sku.materiel,sku.product '+chr(13)+chr(10)
             +'   from locinskudetail(nolock),sku(nolock) '+chr(13)+chr(10)
             +'  where locinskudetail.skuid=sku.skuid  '+chr(13)+chr(10)
             +'    and 1=2  ';
     qrylocdetail.Close;
     qrylocdetail.SQL.Clear;
     qrylocdetail.SQL.Add(strsql);
     qrylocdetail.Open;

     Show;
   end;
end;

procedure TfrmMoveLocdetail.EnableEdit;
begin

end;

procedure TfrmMoveLocdetail.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin

end;

procedure TfrmMoveLocdetail.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmMoveLocdetail.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin

end;

procedure TfrmMoveLocdetail.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmMoveLocdetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
    lampchange(lsmenu);
end;

procedure TfrmMoveLocdetail.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdMovelocskudetail);
  qrylocdetail.Connection:=_adoconnection;
  qrytmp.Connection:=_adoconnection;
end;

procedure TfrmMoveLocdetail.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qrylocdetail.Close;
  frmMoveLocdetail:=nil;
end;

procedure TfrmMoveLocdetail.GetSql;
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

procedure TfrmMoveLocdetail.grdMovelocskudetailEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   with grdMovelocskudetail do
   begin
     if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SERIALNO') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUSPEC') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUBRAND') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='KEYID') or

        (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COLOR')  then
     begin
       Allow:=False
     end else
       Allow:=True;
   end;
end;

procedure TfrmMoveLocdetail.cmbShipAccIDButtonClick(Sender: TObject;
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

procedure TfrmMoveLocdetail.cmbShipAccIDExit(Sender: TObject);
begin
   if cmbShipAccID.Text='' then cmbShipAccID.TextField:='';
end;

procedure TfrmMoveLocdetail.cmbShipAccIDExitCheck(Sender: TObject;
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

procedure TfrmMoveLocdetail.edtlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOquery;
begin
    qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
       edtlocname.TextField  :=qrySelect.FieldByName('locid').asstring;
       edtlocname.Text  :=qrySelect.FieldByName('locname').asstring;
    end;
    FreeAndNil(qrySelect);
end;

procedure TfrmMoveLocdetail.edtlocnameExit(Sender: TObject);
begin
  if edtlocname.Text='' then edtlocname.TextField:='';
end;

procedure TfrmMoveLocdetail.edtlocnameExitCheck(Sender: TObject;
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

procedure TfrmMoveLocdetail.btnQueryClick(Sender: TObject);
begin
   GetSql;
   strzsql:=' if exists(select * from tempdb..sysobjects where id=object_id("tempdb..#skudetail")                '+chr(13)+chr(10)
           +'   and sysstat & 0xf=3)                                                                             '+chr(13)+chr(10)
           +'  drop table #skudetail                                                                             '+chr(13)+chr(10)
           +'select jobno=locinskudetail.jobno,sno=locinskudetail.sno,ldsno=locinskudetail.ldsno,          '+chr(13)+chr(10)
           +'       detailsno,locinskudetail.skuid,locinskudetail.skuname,locinskudetail.serialno,            '+chr(13)+chr(10)
           +'       quantity=locinskudetail.quantityremain,quantityremain=0, locinskudetail.quantityuom,   '+chr(13)+chr(10)
           +'       qualityname=locinskudetail.qualityname,color=locinskudetail.color,locinskudetail.skuspec, '+chr(13)+chr(10)
           +'       locinskudetail.locid,locinskudetail.locname,newskubrand=locinskudetail.sealno,              '+chr(13)+chr(10)
           +'       costcusid=locinskudetail.costcusid,costcusname=locinskudetail.costcusname,locinskudetail.shippercusid, '+chr(13)+chr(10)
           +'       shippercusname=locinskudetail.shippercusname,userid=locinskudetail.userid,locinskudetail.username, '+chr(13)+chr(10)
           +'       operationdate=locinskudetail.operationdate,iuserid=locinskudetail.iuserid,locinskudetail.iusername, '+chr(13)+chr(10)
           +'       locinskudetail.sealno,locinskudetail.skubrand,quantitynew=0,tracktype, '+chr(13)+chr(10)
           +'       sku.skucards,sku.materiel,sku.product,locationin.locationbillno,keyid=0      '+chr(13)+chr(10)
           +'  into #skudetail                                                                                   '+chr(13)+chr(10)
           +'  from locinskudetail (nolock)                                                                      '+chr(13)+chr(10)
           +'        left join  locationin (nolock)                                                              '+chr(13)+chr(10)
           +'               on  locationin.jobno=locinskudetail.jobno                                            '+chr(13)+chr(10)
           +'        left join  sku (nolock)                                                              '+chr(13)+chr(10)
           +'               on  sku.skuid=locinskudetail.skuid                                            '+chr(13)+chr(10)
           +' where isnull(quantityremain,0)<>0'
           +IIF(_Useridcan<>'',
               ' and (locinskudetail.userid in '+_Useridcan+' or locinskudetail.iuserid in '+_Useridcan+') ',
               ' and (locinskudetail.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
              +'    or locinskudetail.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)

           +strFilter
           +' declare @i smallint '
           +'  select @i=0 '
           +'  update #skudetail set keyid=@i,@i=@i+1 '
           +'select jobno,sno,ldsno,          '+chr(13)+chr(10)
           +'       detailsno,skuid,skuname,serialno,                  '+chr(13)+chr(10)
           +'       quantity,quantityremain, quantityuom,                 '+chr(13)+chr(10)
           +'       qualityname,color,skuspec, '+chr(13)+chr(10)          
           +'       locid,locname,newskubrand,              '+chr(13)+chr(10)
           +'       costcusid,costcusname,shippercusid, '+chr(13)+chr(10)
           +'       shippercusname,userid,username, '+chr(13)+chr(10)
           +'       operationdate,iuserid,iusername, '+chr(13)+chr(10)
           +'       sealno,skubrand,quantitynew,tracktype,              '+chr(13)+chr(10)
           +'       skucards,materiel,product,locationbillno,keyid             '+chr(13)+chr(10)
           +'  from #skudetail     '                                                                      ;
   qrylocdetail.Close;
   qrylocdetail.SQL.Clear;
   qrylocdetail.SQL.Add(strZsql);
   qrylocdetail.Open;
   btnOK.Enabled:=true;

end;

procedure TfrmMoveLocdetail.cmbchoiceExit(Sender: TObject);
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

procedure TfrmMoveLocdetail.cmbchoiceChange(Sender: TObject);
begin
   edtcustomerno.Text:='';
   edtlocationbillno.Text:='';
   edtlocname.Text :='';
   edtlocname.TextField:='';
   cmbShipAccID.Text:='';
   cmbShipAccID.TextField:='';
end;

procedure TfrmMoveLocdetail.btnOKClick(Sender: TObject);
var
  strlocbillno:string;
begin
   try
      while True do
      begin
         try
            _ADOConnection.Starttransaction;
            ExecSql(dataTmp.qryTmp,'     if exists(select * from tempdb..sysobjects      '+chr(13)+chr(10)
                                  +'  where id=object_id("tempdb..#lskmovelocdetail")       '+chr(13)+chr(10)
                                  +'    and sysstat & 0xf=3)                                '+chr(13)+chr(10)
                                  +'   drop table #lskmovelocdetail                        '+chr(13)+chr(10)
                                  +'create table #lskmovelocdetail'+chr(13)+chr(10)
                                  +'            (jobno                 varchar(20) null,'+chr(13)+chr(10)
                                  +'             sno                   bigint null,'+chr(13)+chr(10)
                                  +'             ldsno                 bigint null,'+chr(13)+chr(10)
                                  +'             detailsno             bigint null,'+chr(13)+chr(10)
                                  +'             skuid                 varchar(40) null,'+chr(13)+chr(10)
                                  +'             skuname               varchar(100) null,'+chr(13)+chr(10)
                                  +'             serialno              varchar(50) null,'+chr(13)+chr(10)
                                  +'             quantity              numeric(16,4) null,'+chr(13)+chr(10)
                                  +'             quantityremain        numeric(16,4) null,'+chr(13)+chr(10)
                                  +'             quantityuom           varchar(40) null,'+chr(13)+chr(10)
                                  +'             qualityname           varchar(40) null,'+chr(13)+chr(10)
                                  +'             color                 varchar(40) null,'+chr(13)+chr(10)
                                  +'             skuspec               varchar(50) null,'+chr(13)+chr(10)
                                  +'             locid                 varchar(40) null,'+chr(13)+chr(10)
                                  +'             locname               varchar(100) null,'+chr(13)+chr(10)
                                  +'             costcusid             varchar(30) null,'+chr(13)+chr(10)
                                  +'             costcusname           varchar(100) null,'+chr(13)+chr(10)
                                  +'             cusid                 varchar(30) null,'+chr(13)+chr(10)
                                  +'             cusname               varchar(100) null,'+chr(13)+chr(10)
                                  +'             shippercusid          varchar(30) null,'+chr(13)+chr(10)
                                  +'             shippercusname        varchar(100) null,'+chr(13)+chr(10)
                                  +'             userid                varchar(40) null,'+chr(13)+chr(10)
                                  +'             username              varchar(50) null,'+chr(13)+chr(10)
                                  +'             operationdate         varchar(50) null,'+chr(13)+chr(10)
                                  +'             iuserid                 varchar(40) null,'+chr(13)+chr(10)
                                  +'             iusername               varchar(50) null,'+chr(13)+chr(10)
                                  +'             tracktype           varchar(40) null,'+chr(13)+chr(10)
                                  +'             SKUBRAND           varchar(40) null,'+chr(13)+chr(10)
                                  +'             remark                 varchar(200) null '+chr(13)+chr(10)
                                  +'            )'+chr(13)+chr(10)
                                  );
            qrylocdetail.First;
            while not qrylocdetail.Eof do
            begin
               if (qrylocdetail.FieldByName('newskubrand').asstring<>qrylocdetail.FieldByName('skubrand').asstring)
               and ( qrylocdetail.FieldByName('quantitynew').asfloat<>0)
               and ( qrylocdetail.FieldByName('quantitynew').asfloat<qrylocdetail.FieldByName('quantity').asfloat) then
               ExecSql(dataTmp.qryTmp,' insert into #lskmovelocdetail                            '+chr(13)+chr(10)
                                     +' select jobno="'+qrylocdetail.FieldByName('jobno').asstring+'",'
                                     +'        sno='+qrylocdetail.FieldByName('sno').asstring+','
                                     +'        ldsno='+qrylocdetail.FieldByName('ldsno').asstring+','
                                     +'        detailsno='+qrylocdetail.FieldByName('detailsno').asstring+','
                                     +'        skuid="'+qrylocdetail.FieldByName('skuid').asstring+'",'
                                     +'        skuname="'+qrylocdetail.FieldByName('skuname').asstring+'",'
                                     +'        serialno="'+qrylocdetail.FieldByName('serialno').asstring+'",'
                                     +'        quantity='+floattostr(qrylocdetail.FieldByName('quantitynew').asfloat)+','
                                     +'        quantityremain="'+floattostr(qrylocdetail.FieldByName('quantitynew').asfloat)+'",'
                                     +'        quantityuom="'+qrylocdetail.FieldByName('quantityuom').asstring+'",'
                                     +'        qualityname="'+qrylocdetail.FieldByName('qualityname').asstring+'",'
                                     +'        color="'+qrylocdetail.FieldByName('color').asstring+'",'
                                     +'        skuspec="'+qrylocdetail.FieldByName('skuspec').asstring+'",'
                                     +'        locid="'+qrylocdetail.FieldByName('locid').asstring+'",'
                                     +'        locname="'+qrylocdetail.FieldByName('locname').asstring+'",'
                                     +'        costcusid="'+qrylocdetail.FieldByName('costcusid').asstring+'",'
                                     +'        costcusname="'+qrylocdetail.FieldByName('costcusname').asstring+'",'
                                     +'        cusid="'+qrylocdetail.FieldByName('costcusid').asstring+'",'
                                     +'        cusname="'+qrylocdetail.FieldByName('costcusname').asstring+'",'
                                     +'        shippercusid="'+qrylocdetail.FieldByName('shippercusid').asstring+'",'
                                     +'        shippercusname="'+qrylocdetail.FieldByName('shippercusname').asstring+'",'
                                     +'        userid="'+qrylocdetail.FieldByName('userid').asstring+'",'
                                     +'        username="'+qrylocdetail.FieldByName('username').asstring+'",'
                                     +'        operaiondate="'+qrylocdetail.FieldByName('operationdate').asstring+'",'
                                     +'        iuserid="'+qrylocdetail.FieldByName('iuserid').asstring+'",'
                                     +'        iusername="'+qrylocdetail.FieldByName('iusername').asstring+'",'
                                     +'        tracktype="'+qrylocdetail.FieldByName('tracktype').asstring+'", '
                                     +'        skubrand="'+qrylocdetail.FieldByName('newskubrand').asstring+'", '
                                     +'        remark="'+qrylocdetail.FieldByName('skubrand').asstring+'"+"转"+"'+qrylocdetail.FieldByName('newskubrand').asstring+'" '
                                     //+'   into #lskmovelocdetail '
                                     );
               if (qrylocdetail.FieldByName('newskubrand').asstring<>qrylocdetail.FieldByName('skubrand').asstring)
               and ( qrylocdetail.FieldByName('quantitynew').asfloat<>0)
               and ( qrylocdetail.FieldByName('quantitynew').asfloat=qrylocdetail.FieldByName('quantity').asfloat) then
               ExecSql(dataTmp.qryTmp,' update locinskudetail                                   '+chr(13)+chr(10)
                                     +'    set skubrand="'+qrylocdetail.FieldByName('newskubrand').asstring+'",  '+chr(13)+chr(10)
                                     +'        remark="'+qrylocdetail.FieldByName('skubrand').asstring+'"+"转"+"'+qrylocdetail.FieldByName('newskubrand').asstring+'" '
                                     +'  where jobno="'+qrylocdetail.FieldByName('jobno').asstring+'"'
                                     +'    and   sno='+qrylocdetail.FieldByName('sno').asstring+''
                                     +'    and   ldsno='+qrylocdetail.FieldByName('ldsno').asstring+''
                                     +'    and   detailsno='+qrylocdetail.FieldByName('detailsno').asstring+''

                                     );
               qrylocdetail.Next;
            end;
            ExecSql(qrytmp,' insert into locinskudetail                                                   '+chr(13)+chr(10)
                          +'        (jobno,sno,ldsno,detailsno,skuid, skubrand,                             '+chr(13)+chr(10)
                          +'	    skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                          +'	    qualityname,color,skuspec,locid,locname,                          '+chr(13)+chr(10)
                          +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,       '+chr(13)+chr(10)
                          +'	    userid,username,operationdate,iuserid,iusername,tracktype,remark)        '+chr(13)+chr(10)
                          +' select jobno,sno,ldsno,                                                        '+chr(13)+chr(10)
                          +'        detailsno=(select max(detailsno)+1 from locinskudetail where locinskudetail.jobno=#lskmovelocdetail.jobno), '+chr(13)+chr(10)
                          +'        skuid, skubrand,                                     '+chr(13)+chr(10)
                          +'	    skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                          +'	    qualityname,color,skuspec,locid,locname,                         '+chr(13)+chr(10)
                          +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,      '+chr(13)+chr(10)
                          +'	    userid,username,operationdate,iuserid,iusername,tracktype,remark  '+chr(13)+chr(10)
                          +'   from #lskmovelocdetail (nolock)                                               '+chr(13)+chr(10)
                          +' update locinskudetail set                                                        '+chr(13)+chr(10)
                          +'        quantity=locinskudetail.quantity-#lskmovelocdetail.quantity,               '+chr(13)+chr(10)
                          +'        quantityremain=locinskudetail.quantityremain-#lskmovelocdetail.quantityremain  '+chr(13)+chr(10)
                          +'   from #lskmovelocdetail                                  '+chr(13)+chr(10)
                          +'  where locinskudetail.jobno=#lskmovelocdetail.jobno        '+chr(13)+chr(10)
                          +'    and locinskudetail.sno=#lskmovelocdetail.sno             '+chr(13)+chr(10)
                          +'    and locinskudetail.ldsno=#lskmovelocdetail.ldsno           '+chr(13)+chr(10)
                          +'    and locinskudetail.detailsno=#lskmovelocdetail.detailsno  '+chr(13)+chr(10)
                         );
            _ADOConnection.Commit;

            KMessageDlg('调拨操作完成!',mtInformation,[mbOK],0);
            frmMoveLocdetail.btnQueryClick(Sender);
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
      while not qrylocdetail.Eof do
      begin
         qrylocdetail.Delete;
      end;
   end;
   qrylocdetail.DisableControls;
   arrMoveLocOld:=ScatterToArray(qrylocdetail,False,0);
   qrylocdetail.applyupdates;

   droplsk('#skudetail');
   qrylocdetail.CommitUpdates;
   qrylocdetail.EnableControls;
   ScrollAfterEdit:=False;
end;

procedure TfrmMoveLocdetail.btncancellClick(Sender: TObject);
begin
   frmMoveLocdetail.Close;
end;

procedure TfrmMoveLocdetail.quantitynewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if StrToFloat(grdMovelocskudetail.InplaceEditor.GetEditingText)<0 then
   begin
      ErrorText:=_strnumberzero;
      Accept:=False;
      exit;
   end;
   IF (grdMovelocskudetail.InplaceEditor.GetEditingText='')then
   begin
      KMessageDlg('调拨数量不能为空',mtWarning,[mbOK],0);
      //EdxEditInvalidInput.Create('调拨数量不能为空!');
      //exit;
   end;
   IF (strtofloat(qrylocdetail.FieldByName('quantity').asstring)<strtofloat(grdMovelocskudetail.InplaceEditor.GetEditingText)) then
   begin
      KMessageDlg('调拨数量不能大于库存数量',mtWarning,[mbOK],0);

      //EdxEditInvalidInput.Create('调拨数量不能大于库存数量!');
      //Windows.SetFocus(frmMoveLocdetail.Handle);
      //exit;
   end;
end;

procedure TfrmMoveLocdetail.grdMovelocskudetailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  with TdxDBGrid(Sender) do
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
  end;
end;

end.
