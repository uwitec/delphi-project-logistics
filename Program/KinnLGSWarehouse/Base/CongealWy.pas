unit CongealwY;

interface

uses
  Windows, Messages, SysUtils, Classes,Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DB,DBTables, GMSLabel,Menus, KBitBtn,dxCntner,dxEditor,
  dxEdLib, dxDBELib, dxExEdtr, KinPickEdit, KGroupBox,dxTL, dxDBCtrl, dxDBGrid,
  dxPageControl, dxDBTLCl, dxGrClms, KUpdateSql, DBClient, KDataSetProvider,
  CheckLst;

type
  TfrmCongealWy = class(TForm)
    ppmCongeal: TPopupMenu;
    mitDisCongeal: TMenuItem;
    grdCongeal: TdxDBGrid;
    operationdate: TdxDBGridColumn;
    cusname: TdxDBGridColumn;
    shippercusname: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    qualityname: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    quantityuom: TdxDBGridColumn;
    Piece: TdxDBGridColumn;
    pieceuom: TdxDBGridColumn;
    Area: TdxDBGridColumn;
    areauom: TdxDBGridColumn;
    Volume: TdxDBGridColumn;
    volumeuom: TdxDBGridColumn;
    NetWeight: TdxDBGridColumn;
    weightuom: TdxDBGridColumn;
    mainorder: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    lotcode: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtCus: TdxButtonEdit;
    cmbSKUName: TdxButtonEdit;
    cmblocID: TdxButtonEdit;
    cmbShipperCus: TdxButtonEdit;
    edtLotCode: TdxEdit;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    ckbDate: TdxCheckEdit;
    edtCostCus: TdxButtonEdit;
    edtIUser: TdxButtonEdit;
    btnRefresh: TKBitBtn;
    KBitBtn3: TKBitBtn;
    qryCongeal: TKADOQuery;
    dtsCongeal: TDataSource;
    iusername: TdxDBGridColumn;
    pgcBlnoAndConno: TdxPageControl;
    tbslocationbillno: TdxTabSheet;
    memlocationbillno: TdxMemo;
    tbscusbillno: TdxTabSheet;
    memcusbillno: TdxMemo;
    tbsmainorder: TdxTabSheet;
    memmainorder: TdxMemo;
    udsCongeal: TKadoUpdateSql;
    costcusname: TdxDBGridColumn;
    GMSStickyLabel14: TGMSStickyLabel;
    cmbKCType: TKinPickEdit;
    edtpltid: TdxEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    pltid: TdxDBGridColumn;
    rdgtype: TKRadioGroup;
    KGroupBox2: TKGroupBox;
    grdprint: TdxDBGrid;
    jobno: TdxDBGridColumn;
    edtremark: TdxDBGridColumn;
    ldsno: TdxDBGridColumn;
    snoin: TdxDBGridColumn;
    jobnoin: TdxDBGridColumn;
    qrydisaccord: TKADOQuery;
    dtsdisaccord: TDataSource;
    udsdisaccord: TKadoUpdateSql;
    qryTmp: TKADOQuery;
    ppmdisaccord: TPopupMenu;
    mitadd: TMenuItem;
    mitdelete: TMenuItem;
    KBitBtn1: TKBitBtn;
    detailsno: TdxDBGridColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InitCongeal;
    procedure edtCusButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtCusExit(Sender: TObject);
    procedure cmbShipperCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipperCusExit(Sender: TObject);
    procedure edtCostCusExit(Sender: TObject);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtIUserButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtIUserExit(Sender: TObject);
    procedure cmblocIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmblocIDExit(Sender: TObject);
    procedure cmbSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbSKUNameExit(Sender: TObject);
    procedure mitDisCongealClick(Sender: TObject);
    procedure edtLotCodeExit(Sender: TObject);
    procedure cmbKCTypeChange(Sender: TObject);
    procedure cmblocIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure cmbSKUNameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure rdgtypeClick(Sender: TObject);
    procedure mitaddClick(Sender: TObject);
    procedure mitdeleteClick(Sender: TObject);
    procedure grdprintEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdprintEnter(Sender: TObject);
    procedure KBitBtn1Click(Sender: TObject);
    procedure grdprintExit(Sender: TObject);
    procedure qrydisaccordBeforePost(DataSet: TDataSet);
    procedure grdCongealChangeNodeEx(Sender: TObject);
    procedure grdprintKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrydisaccordAfterPost(DataSet: TDataSet);
  private
    flag:string;   //T为冻结,F为取消冻结
    intjobno:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure WorkCongealWy(pflag:string);

var
  frmCongealWy: TfrmCongealWy;

implementation

{$R *.DFM}

uses Datas,libproc,libUser,kindlg,CostItemDx, main,libUserpub,GetDllPub,datasTmp;

procedure WorkCongealWy(pflag:string);
begin
   if frmCongealwY<>nil then
   with frmCongealwY do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmCongealwY:=TfrmCongealwY.Create(Application);
   with frmCongealwY do
   begin
      flag:=pflag;
      cmbKCType.Text:='明细库存';
      if flag='T' then
      begin
         frmCongealwY.Caption:='冻结货物';
         mitDisCongeal.Visible:=False;
      end
      else
      begin
         frmCongealwY.Caption:='取消冻结';
      end;
      Show;
   end;
end;

procedure TfrmCongealwY.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         ReturnNext(Self);
      Vk_Escape:
      begin
         Key:=0;
         btnCancelClick(nil);
      end;
   end;
end;

procedure TfrmCongealwY.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCongealwY.btnRefreshClick(Sender: TObject);
begin
   if _sinotrans=True then
   begin
      cmbKCType.ReadOnly:=True;
   end;
   if cmbKCType.Text='任务库存' then
   begin
      edtpltid.Visible:=False;
      GMSStickyLabel1.Visible:=False;
   end else
   if cmbKCType.Text='实际库存' then
   begin
      edtpltid.Visible:=False;
      GMSStickyLabel1.Visible:=False;
   end else
   if cmbKCType.Text='明细库存' then
   begin
      edtpltid.Visible:=True;
      GMSStickyLabel1.Visible:=True;
   end else
   if cmbKCType.Text='' then
   begin
      Kmessagedlg('冻结类型不能为空！',mtInformation,[mbOk],0);
      exit;
   end;
   InitCongeal;
end;

procedure TfrmCongealwY.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(KGroupBox1);
   SetGroupBox(KGroupBox2);
   SetDxDbGrid(grdCongeal);
   SetDxDbGrid(grdprint);
   qryCongeal.Connection:=_ADOConnection;
   qrydisaccord.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmCongealwY.FormDestroy(Sender: TObject);
begin
   frmCongealwY:=nil;
end;

procedure TfrmCongealwY.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmCongealwY.InitCongeal;
var
   strsql,strsql1,strfillter:string;
begin
   //过滤条件
   if rdgtype.ItemIndex=1 then
   begin
      if cmbKCType.Text='任务库存' then
         strfillter:=strfillter+' and isnull(locationinitem.disaccord,"F")="T" '
      else if cmbKCType.Text='实际库存' then
         strfillter:=strfillter+' and isnull(locationindetail.disaccord,"F")="T" '
      else if cmbKCType.Text='明细库存' then
         strfillter:=strfillter+' and isnull(locinskudetail.disaccord,"F")="T" ';
      mitDisCongeal.Visible:=True;
   end else
   if rdgtype.ItemIndex=2 then
   begin
      if cmbKCType.Text='任务库存' then
         strfillter:=strfillter+' and isnull(locationinitem.disaccord,"F")="F" '
      else if cmbKCType.Text='实际库存' then
         strfillter:=strfillter+' and isnull(locationindetail.disaccord,"F")="F" '
      else if cmbKCType.Text='明细库存' then
         strfillter:=strfillter+' and isnull(locinskudetail.disaccord,"F")="F" ';
      mitDisCongeal.Visible:=False;
   end else
   begin
      strfillter:='';
      mitDisCongeal.Visible:=False;
   end;

   if flag='T' then
   begin
      if cmbKCType.Text='任务库存' then
      begin
         strfillter:=' and isnull(locationinitem.quantity,0)-isnull(locationinitem.quantitydotask,0)>0 ';
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and exists (select 1 from locationindetail,locationinitem where locationindetail.jobno=locationinitem.jobno'
                                  +' and locationindetail.sno=locationinitem.sno and locationindetail.locid="'+cmblocID.TextField+'" )'
         end;
      end
      else if cmbKCType.Text='实际库存' then
      begin
         strfillter:=' and isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0)>0 ';
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and locationindetail.locid="'+cmblocID.TextField+'" '
         end;
      end
      else if cmbKCType.Text='明细库存' then
      begin
         strfillter:=strfillter+' and isnull(locinskudetail.quantityremain,0)>0 '+chr(13)+chr(10)
                    +' and locinskudetail.sealno like "%'+edtpltid.Text+'%" ' ;
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and locinskudetail.locid="'+cmblocID.TextField+'" '
         end;
      end
   end else
   begin
      if cmbKCType.Text='任务库存' then
      begin
//         strfillter:=' and isnull(locationinitem.disaccord,"F")="T" ';
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and exists (select 1 from locationindetail,locationinitem where locationindetail.jobno=locationinitem.jobno'
                                  +' and locationindetail.sno=locationinitem.sno and locationindetail.locid="'+cmblocID.TextField+'" )'
         end
      end else
      if cmbKCType.Text='实际库存' then
      begin
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and locationindetail.locid="'+cmblocID.TextField+'" '
         end;
      end else
      if cmbKCType.Text='明细库存' then
      begin
         strfillter:=strfillter+' and locinskudetail.sealno like "%'+edtpltid.Text+'%" ' ;
         if cmblocID.Text<>'' then
         begin
            strfillter:=strfillter+' and locinskudetail.locid like "%'+cmblocID.TextField+'%" ';
         end;
      end;
   end;
   strfillter:=strfillter+IIF(edtCus.Text<>'',         ' and locationinitem.cusid="'+edtCus.TextField+'" ',' ')
                         +IIF(cmbShipperCus.Text<>'',  ' and locationinitem.shippercusid="'+cmbShipperCus.TextField+'" ',' ')
                         +IIF(edtCostCus.Text<>'',     ' and locationinitem.costcusid="'+edtCostCus.TextField+'" ',' ')
                         +IIF(edtIUser.Text<>'',       ' and locationinitem.iuserid="'+edtIUser.TextField+'" ',' ')
                         +IIF(edtLotCode.Text<>'',     ' and locationinitem.lotcode="'+edtLotCode.Text+'" ',' ')
                         +IIF(cmbSKUName.Text<>'',     ' and locationinitem.skuid="'+cmbSKUName.TextField+'" ',' ');
   if ckbDate.Checked then
   begin
      if dtdReceDateF.Date>0 then //开始时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),locationinitem.operationdate,102))>="'+dtdReceDateF.Text+'" ';
      if dtdReceDateT.Date>0 then   //结束时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),locationinitem.operationdate,102))<="'+dtdReceDateT.Text+'" ';
   end;

   if Trim(memlocationbillno.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.locationbillno="'+Trim(memlocationbillno.Text)+'"';
   if Trim(memcusbillno.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.cusbillno="'+Trim(memcusbillno.Text)+'"';
   if Trim(memmainorder.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.mainorder="'+Trim(memmainorder.Text)+'"';


   if cmbKCType.Text='任务库存' then
      strsql:='select operationdate=convert(char(10),operationdate,102),  '+chr(13)+chr(10)
             +'       cusname,shippercusname,skuname,skuid,costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(quantity,0)-isnull(quantitydo,0),   '+chr(13)+chr(10)
             +'       piece=isnull(piece,0)-isnull(piecedo,0),            '+chr(13)+chr(10)
             +'       area=isnull(area,0)-isnull(areado,0),               '+chr(13)+chr(10)
             +'       volume=isnull(volume,0)-isnull(volumedo,0),         '+chr(13)+chr(10)
             +'       netweight=isnull(netweight,0)-isnull(netweightdo,0),'+chr(13)+chr(10)
             +'       keyid=jobno+convert(char(10),sno),                  '+chr(13)+chr(10)
             +'       qualityname,locname,quantityuom,pieceuom,areauom,   '+chr(13)+chr(10)
             +'       volumeuom,weightuom,mainorder,cusbillno,  '+chr(13)+chr(10)
             +'       locationbillno,jobno,lotcode,sno,iusername,      '+chr(13)+chr(10)
             +'       pltid="",remark '
             +'  from locationinitem (nolock)                             '+chr(13)+chr(10)
             +' where 1=1                                                 '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
              ' and (locationinitem.userid in '+_Useridcan+' or locationinitem.iuserid in '+_Useridcan+') ',
              ' and (locationinitem.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or locationinitem.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
             + strfillter
   else if cmbKCType.Text='实际库存' then
      strsql:='select operationdate=convert(char(10),locationinitem.operationdate,102),  '+chr(13)+chr(10)
             +'       locationinitem.cusname,locationinitem.shippercusname,locationinitem.skuname,locationinitem.costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0),   '+chr(13)+chr(10)
             +'       piece=isnull(locationindetail.piece,0)-isnull(locationindetail.piecedo,0),            '+chr(13)+chr(10)
             +'       area=isnull(locationindetail.area,0)-isnull(locationindetail.areado,0),               '+chr(13)+chr(10)
             +'       volume=isnull(locationindetail.volume,0)-isnull(locationindetail.volumedo,0),         '+chr(13)+chr(10)
             +'       netweight=isnull(locationindetail.netweight,0)-isnull(locationindetail.netweightdo,0),'+chr(13)+chr(10)
             +'       keyid=locationindetail.jobno+rtrim(convert(char(10),locationindetail.sno))+rtrim(convert(char(10),locationindetail.ldsno)),              '+chr(13)+chr(10)
             +'       locationindetail.qualityname,locationindetail.locname,locationindetail.quantityuom,   '+chr(13)+chr(10)
             +'       locationindetail.pieceuom,locationindetail.areauom,locationindetail.volumeuom,locationindetail.weightuom,   '+chr(13)+chr(10)
             +'       locationinitem.mainorder,locationinitem.cusbillno,     '+chr(13)+chr(10)
             +'       locationinitem.locationbillno,locationinitem.lotcode,locationinitem.iusername,  '+chr(13)+chr(10)
             +'       locationindetail.jobno,locationindetail.sno,locationindetail.ldsno, '+chr(13)+chr(10)
             +'       pltid="",locationindetail.remark '
             +'  from locationinitem (nolock),locationindetail (nolock)   '+chr(13)+chr(10)
             +' where 1=1                                                 '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
              ' and (locationinitem.userid in '+_Useridcan+' or locationinitem.iuserid in '+_Useridcan+') ',
              ' and (locationinitem.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or locationinitem.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
             +' and locationinitem.jobno=locationindetail.jobno '+chr(13)+chr(10)
             +' and locationinitem.sno=locationindetail.sno '+chr(13)+chr(10)
             + strfillter
   else
      strsql:=' if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
             +'     where id=object_id("tempdb..#lskcongeal") and sysstat & 0xf=3) '+chr(13)+chr(10)
             +'   drop table #lskcongeal '+chr(13)+chr(10)
             +'select operationdate=convert(char(10),locationinitem.operationdate,102),  '+chr(13)+chr(10)
             +'       locationinitem.cusname,locationinitem.shippercusname,locationinitem.skuname,locationinitem.costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(locinskudetail.quantityremain,0),   '+chr(13)+chr(10)
             +'       piece=convert(numeric(16,4),0),          '+chr(13)+chr(10)
             +'       area=convert(numeric(16,4),0),           '+chr(13)+chr(10)
             +'       volume=convert(numeric(16,4),0),         '+chr(13)+chr(10)
             +'       netweight=convert(numeric(16,4),0),      '+chr(13)+chr(10)
             +'       keyid=locinskudetail.jobno+rtrim(convert(char(10),locinskudetail.sno))+rtrim(convert(char(10),locinskudetail.ldsno))+rtrim(convert(char(10),locinskudetail.detailsno)), '+chr(13)+chr(10)
             +'       locationinitem.qualityname,locinskudetail.locname,locinskudetail.quantityuom,   '+chr(13)+chr(10)
             +'       pieceuom=null,areauom=null,volumeuom=null,weightuom=null,                                 '+chr(13)+chr(10)
             +'       locationinitem.mainorder,locationinitem.cusbillno,       '+chr(13)+chr(10)
             +'       locationinitem.locationbillno,locationinitem.lotcode,locationinitem.iusername,    '+chr(13)+chr(10)
             +'       locinskudetail.jobno,locinskudetail.sno,locinskudetail.ldsno,locinskudetail.detailsno, '+chr(13)+chr(10)
             +'       pltid=sealno,locinskudetail.remark '+chr(13)+chr(10)//托盘号
             +'  into #lskcongeal     '+chr(13)+chr(10)
             +'  from locationinitem (nolock),locinskudetail (nolock)   '+chr(13)+chr(10)
             +' where 1=1   '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
              ' and (locationinitem.userid in '+_Useridcan+' or locationinitem.iuserid in '+_Useridcan+') ',
              ' and (locationinitem.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or locationinitem.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
             +' and locationinitem.jobno=locinskudetail.jobno '+chr(13)+chr(10)
             +' and locationinitem.sno=locinskudetail.sno '+chr(13)+chr(10)
             + strfillter +chr(13)+chr(10)
             +'  select * from #lskcongeal     '+chr(13)+chr(10)    ;

   qryCongeal.Close;
   qryCongeal.Sql.Clear;
   qryCongeal.Sql.Add(strsql);

   strsql1:='select disaccord.* '
           +'  from disaccord (nolock),#lskcongeal '
           +' where #lskcongeal.jobno= disaccord.jobnoin '
           +'   and #lskcongeal.sno= disaccord.snoin '
           +'   and #lskcongeal.ldsno= disaccord.ldsno '
           +'   and #lskcongeal.detailsno= disaccord.detailsno '
           ;
   qrydisaccord.Close;
   qrydisaccord.Sql.Clear;
   qrydisaccord.Sql.Add(strsql1);
   OpenSql(dataTmp.qryTmp,'select no=max(jobno) from disaccord ');
   intjobno:=dataTmp.qryTmp.fieldbyname('no').asinteger+1;


   qryCongeal.Open;
   qrydisaccord.Open;
end;


procedure TfrmCongealwY.edtCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      edtCus.Text     :=qrySelect.FieldByName('cusname').asstring;
      edtCus.TextField:=qrySelect.FieldByName('cusid').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.edtCusExit(Sender: TObject);
begin
  if Trim(edtCus.Text)='' then edtCus.TextField:='';
end;

procedure TfrmCongealwY.cmbShipperCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      cmbShipperCus.TextField  :=qrySelect.FieldByName('cusid').asstring;
      cmbShipperCus.Text       :=qrySelect.FieldByName('cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.cmbShipperCusExit(Sender: TObject);
begin
  if Trim(cmbShipperCus.Text)='' then cmbShipperCus.TextField:='';
end;

procedure TfrmCongealwY.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure TfrmCongealwY.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      edtCostCus.TextField  :=qrySelect.FieldByName('cusid').asstring;
      edtCostCus.Text       :=qrySelect.FieldByName('cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','F');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtIUser.TextField  :=qrySelect.FieldByName('userid').asstring;
      edtIUser.Text       :=qrySelect.FieldByName('username').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.edtIUserExit(Sender: TObject);
begin
   if Trim(edtIUser.Text)='' then edtIUser.TextField:='';
end;

procedure TfrmCongealwY.cmblocIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('locid').AsString<>'NO' then
   begin
      cmblocID.TextField  :=qrySelect.FieldByName('locid').asstring;
      cmblocID.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.cmblocIDExit(Sender: TObject);
begin
   if Trim(cmblocID.Text)='' then cmblocID.TextField:='';
end;

procedure TfrmCongealwY.cmbSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetSkuSelect('','','A');
   if qrySelect.FieldByName('skuid').AsString<>'' then
   begin
      cmbSKUName.Text:=qrySelect.FieldByName('skuname').AsString;
      cmbSKUName.TextField:=qrySelect.FieldByName('classid').AsString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCongealwY.cmbSKUNameExit(Sender: TObject);
begin
   if Trim(cmbSKUName.Text)='' then cmbSKUName.TextField:='';
end;

//取消冻结
procedure TfrmCongealwY.mitDisCongealClick(Sender: TObject);
var
  i,j:integer;
begin
   j:=grdCongeal.SelectedCount;
   if j=0 then Exit;
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   for i:=j-1 Downto 0 do
   begin
      qryCongeal.GotoBookmark(Pointer(grdCongeal.SelectedRows[i]));
      if cmbKCType.Text='任务库存' then
         execSql(datatmp.qryTmp,'update locationinitem '
                               +'   set disaccord="F" ,'
                               +'       remark="" '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString)
      else if cmbKCType.Text='实际库存' then
         execSql(datatmp.qryTmp,'update locationindetail '
                               +'   set disaccord="F", '
                               +'       remark="" '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString
                               +'   and ldsno='+qryCongeal.FieldByName('ldsno').AsString)
      else
         execSql(datatmp.qryTmp,'update locinskudetail '
                               +'   set disaccord="F", '
                               +'       remark="" '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString
                               +'   and ldsno='+qryCongeal.FieldByName('ldsno').AsString
                               +'   and detailsno='+qryCongeal.FieldByName('detailsno').AsString
                               +'delete disaccord '
                               +' where jobnoin="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and snoin='+qryCongeal.FieldByName('sno').AsString
                               +'   and ldsno='+qryCongeal.FieldByName('ldsno').AsString
                               +'   and detailsno='+qryCongeal.FieldByName('detailsno').AsString
                               );
   end;
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

//冻结货物
procedure TfrmCongealwY.edtLotCodeExit(Sender: TObject);
begin
   if Trim(edtLotCode.Text)='' then edtLotCode.Text:='';
end;

procedure TfrmCongealwY.cmbKCTypeChange(Sender: TObject);
begin
   btnRefreshClick(Self);
end;

procedure TfrmCongealwY.cmblocIDExitCheck(Sender: TObject; OldValue: Variant;
  var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if cmblocID.Text<>'' then
   begin
      opensql(dataTmp.qryTmp,'select top 1 locid,locname from location(nolock) where locname like "%"+"'+cmblocID.Text+'"+"%"') ;
      if dataTmp.qryTmp.RecordCount>0 then
      begin
         cmblocID.Text:=dataTmp.qryTmp.fieldbyname('locname').asstring;
         cmblocID.Textfield:=dataTmp.qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            cmblocID.TextField  :=qrySelect.FieldByName('locid').asstring;
            cmblocID.Text       :=qrySelect.FieldByName('locname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCongealwY.cmbSKUNameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if cmbSKUName.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 skuid,classid,skuname from sku where skuname like "%"+"'+trim(cmbSKUName.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         cmbSKUName.Text:=datatmp.qryTmp.fieldbyname('skuname').asstring;
         cmbSKUName.Textfield:=datatmp.qryTmp.fieldbyname('skuid').asstring;
      end else
      begin
         qrySelect:=PGetSKUSelect('','','A');
         if qrySelect.FieldByName('classid').AsString<>'NO' then
         begin
            cmbSKUName.TextField  :=qrySelect.FieldByName('skuid').asstring;
            cmbSKUName.Text       :=qrySelect.FieldByName('skuname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCongealwY.rdgtypeClick(Sender: TObject);
begin
   btnRefreshClick(Sender);
end;

procedure TfrmCongealwY.mitaddClick(Sender: TObject);
begin
   grdprint.SetFocus;
   qrydisaccord.Append;
end;

procedure TfrmCongealwY.mitdeleteClick(Sender: TObject);
begin
   if qrydisaccord.FieldByName('jobno').AsInteger<>0 then
   if Kmessagedlg('您确定删除该冻结原因吗?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdprint.SetFocus;
      qrydisaccord.Delete;
   end;
end;

procedure TfrmCongealwY.grdprintEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=True;
end;

procedure TfrmCongealwY.grdprintEnter(Sender: TObject);
begin
   if (qrydisaccord.fieldbyname('jobno').AsInteger=0) then
   begin
      mitaddClick(Sender);
   end;
end;

procedure TfrmCongealwY.KBitBtn1Click(Sender: TObject);
var
  i,j:integer;
  strsql:string;
begin
   _ADOConnection.StartTransaction;
   try
     qrydisaccord.Filtered:=False;
     qrydisaccord.Edit;
     qrydisaccord.Post;
     qrydisaccord.ApplyUpdates;

{     if cmbKCType.Text='任务库存' then
        execSql(datatmp.qryTmp,'update locationinitem '
                              +'   set disaccord="T" '
                              +'  where jobno="'+qryCongeal.FieldByName('jobno').AsString+'"'
                              +'    and sno="'+qryCongeal.FieldByName('sno').AsString+'" ' )
     else if cmbKCType.Text='实际库存' then
        execSql(datatmp.qryTmp,'update locationindetail '
                              +'   set disaccord="T" '
                              +'  where jobno="'+qryCongeal.FieldByName('jobno').AsString+'"'
                              +'    and sno="'+qryCongeal.FieldByName('sno').AsString+'" '
                              +'    and ldsno="'+qryCongeal.FieldByName('ldsno').asstring+'" '  )
     else   }
     qrydisaccord.First;
     while not qrydisaccord.Eof do
     begin
        execSql(datatmp.qryTmp,'update locinskudetail '
                              +'   set disaccord="T" '
                              +' where jobno="'+qrydisaccord.FieldByName('jobnoin').AsString+'"'
                              +'   and sno="'+qrydisaccord.FieldByName('snoin').AsString+'" '
                              +'   and ldsno="'+qrydisaccord.FieldByName('ldsno').asstring+'" '
                              +'   and detailsno="'+qrydisaccord.FieldByName('detailsno').asstring+'" '
                              );
        qrydisaccord.Next;
     end;

    OpenSql(qryTmp,'select num=count(1) from disaccord (nolock) '
                  +' where jobnoin="'+qryCongeal.FieldByName('jobno').AsString+'"'
                  +'   and snoin="'+qryCongeal.FieldByName('sno').AsString+'" '
                  +'   and ldsno="'+qryCongeal.FieldByName('ldsno').asstring+'" '
                  +'   and detailsno="'+qryCongeal.FieldByName('detailsno').asstring+'" '
                  );
    if qryTmp.FieldByName('num').AsFloat<1 then
    begin
       execSql(datatmp.qryTmp,'update locinskudetail '
                             +'   set disaccord="F" '
                             +'  where jobno="'+qryCongeal.FieldByName('jobno').AsString+'"'
                             +'    and sno="'+qryCongeal.FieldByName('sno').AsString+'" '
                             +'    and ldsno="'+qryCongeal.FieldByName('ldsno').asstring+'" '
                             +'    and detailsno="'+qryCongeal.FieldByName('detailsno').asstring+'" '
                             );
    end;      

    _ADOConnection.Commit;
   except
     if _ADOConnection.InTransaction then
        _ADOConnection.Rollback;
     Raise;
     Exit;
   end;
   qrydisaccord.CommitUpdates;
   btnRefreshClick(Sender);
   qrydisaccord.Filtered:=true;

end;

procedure TfrmCongealwY.grdprintExit(Sender: TObject);
begin
   With TDxDbgrid(sender) do
   begin
      try
         qrydisaccord.Edit;
         Datalink.DataSet.Post;
      except
         Setfocus;
      raise;
      end;
   end;
end;

procedure TfrmCongealwY.qrydisaccordBeforePost(DataSet: TDataSet);
begin
    qrydisaccord.edit;
    if qrydisaccord.fieldbyname('jobnoin').AsString='' then
    begin
       qrydisaccord.fieldbyname('jobnoin').AsString:=qryCongeal.fieldbyname('jobno').AsString;
       qrydisaccord.fieldbyname('snoin').AsString:=qryCongeal.fieldbyname('sno').AsString;
       qrydisaccord.fieldbyname('ldsno').AsString:=qryCongeal.fieldbyname('ldsno').AsString;
       qrydisaccord.fieldbyname('detailsno').AsString:=qryCongeal.fieldbyname('detailsno').AsString;
    end;   
end;

procedure TfrmCongealwY.grdCongealChangeNodeEx(Sender: TObject);
begin
   qrydisaccord.Filtered:=false;
   qrydisaccord.filter:='jobnoin='''+qryCongeal.fieldbyname('jobno').AsString+''''
                       +' and snoin='+qryCongeal.fieldbyname('SNO').AsString
                       +' and ldsno='+qryCongeal.fieldbyname('ldsno').AsString
                       +' and detailsno='+qryCongeal.fieldbyname('detailsno').AsString;
   qrydisaccord.Filtered:=true;
end;

procedure TfrmCongealwY.grdprintKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
end;

procedure TfrmCongealWy.qrydisaccordAfterPost(DataSet: TDataSet);
begin
  if qrydisaccord.fieldbyname('remark').asstring='' then
  begin
    qrydisaccord.Delete;
  end;
end;

end.
