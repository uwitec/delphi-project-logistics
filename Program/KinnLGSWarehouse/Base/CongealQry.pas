unit CongealQry;

interface

uses
  Windows, Messages, SysUtils, Classes,Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DB,DBTables, GMSLabel,Menus, KBitBtn,dxCntner,dxEditor,
  dxEdLib, dxDBELib, dxExEdtr, KinPickEdit, KGroupBox,dxTL, dxDBCtrl, dxDBGrid,
  dxPageControl, dxDBTLCl, dxGrClms, KUpdateSql, DBClient, KDataSetProvider,
  CheckLst;

type
  TfrmCongealQry = class(TForm)
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
    costcusname: TdxDBGridColumn;
    GMSStickyLabel14: TGMSStickyLabel;
    cmbKCType: TKinPickEdit;
    edtpltid: TdxEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    pltid: TdxDBGridColumn;
    procedure btnOkClick(Sender: TObject);
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
    procedure edtLotCodeExit(Sender: TObject);
    procedure cmbKCTypeChange(Sender: TObject);
  private
    flag:string;   //T为冻结,F为取消冻结
    { Private declarations }
  public
    { Public declarations }
  end;

procedure WorkCongealQry;

var
  frmCongealQry: TfrmCongealQry;

implementation

{$R *.DFM}

uses Datas,libproc,libUser,kindlg,CostItemDx, main,libUserpub,GetDllPub,datasTmp;

procedure WorkCongealQry;
begin
   if frmCongealQry<>nil then
   with frmCongealQry do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmCongealQry:=TfrmCongealQry.Create(Application);
   with frmCongealQry do
   begin
      Show;
   end;
end;

procedure TfrmCongealQry.btnOkClick(Sender: TObject);
begin
//   btnRefreshClick(self);
end;

procedure TfrmCongealQry.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCongealQry.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCongealQry.btnRefreshClick(Sender: TObject);
begin
   if cmbKCType.Text='' then
   begin
      Kmessagedlg('冻结类型不能为空！',mtInformation,[mbOk],0);
      exit;
   end;
   InitCongeal;
end;

procedure TfrmCongealQry.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(KGroupBox1);
   SetDxDbGrid(grdCongeal);
   qryCongeal.Connection:=_ADOConnection;
end;

procedure TfrmCongealQry.FormDestroy(Sender: TObject);
begin
   frmCongealQry:=nil;
end;

procedure TfrmCongealQry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmCongealQry.InitCongeal;
var
   strsql,strfillter:string;
begin
   if cmbKCType.Text='任务库存' then
      strfillter:=' and isnull(locationinitem.disaccord,"F")="T" '
   else if cmbKCType.Text='实际库存' then
      strfillter:=' and isnull(locationindetail.disaccord,"F")="T" '
   else
      strfillter:=' and isnull(locinskudetail.disaccord,"F")="T" ';
      
   strfillter:=strfillter+IIF(edtCus.Text<>'',         ' and locationinitem.cusid="'+edtCus.TextField+'" ',' ')
                         +IIF(cmbShipperCus.Text<>'',  ' and locationinitem.shippercusid="'+cmbShipperCus.TextField+'" ',' ')
                         +IIF(edtCostCus.Text<>'',     ' and locationinitem.costcusid="'+edtCostCus.TextField+'" ',' ')
                         +IIF(edtIUser.Text<>'',       ' and locationinitem.iuserid="'+edtIUser.TextField+'" ',' ')
                         +IIF(edtLotCode.Text<>'',     ' and locationinitem.lotcode="'+edtLotCode.Text+'" ',' ')
                         +IIF(cmbSKUName.Text<>'',     ' and locationinitem.skuid="'+cmbSKUName.TextField+'" ',' ')
                         +IIF(cmblocID.Text<>'',       ' and locationinitem.locid="'+cmblocID.TextField+'" ',' ');
   if ckbDate.Checked then
   begin
      if dtdReceDateF.Date>0 then //开始时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),locationinitem.operationdate,102))>="'+dtdReceDateF.Text+'" ';
      if dtdReceDateT.Date>0 then   //结束时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),locationinitem.operationdate,102))<="'+dtdReceDateT.Text+'" ';
   end;

   if Trim(memlocationbillno.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.locationbillno="'+memlocationbillno.Text+'"';
   if Trim(memcusbillno.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.cusbillno="'+memcusbillno.Text+'"';
   if Trim(memmainorder.Text)<>'' then
      strfillter:=strfillter+' and locationinitem.mainorder="'+memmainorder.Text+'"';

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
             +'       pltid="" '
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
             +'       pltid="" '
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
      strsql:='select operationdate=convert(char(10),locationinitem.operationdate,102),  '+chr(13)+chr(10)
             +'       locationinitem.cusname,locationinitem.shippercusname,locationinitem.skuname,locationinitem.costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(locinskudetail.quantity,0)-isnull(locinskudetail.quantityremain,0),   '+chr(13)+chr(10)
             +'       piece=0,          '+chr(13)+chr(10)
             +'       area=0,           '+chr(13)+chr(10)
             +'       volume=0,         '+chr(13)+chr(10)
             +'       netweight=0,      '+chr(13)+chr(10)
             +'       keyid=locinskudetail.jobno+rtrim(convert(char(10),locinskudetail.sno))+rtrim(convert(char(10),locinskudetail.ldsno))+rtrim(convert(char(10),locinskudetail.detailsno)), '+chr(13)+chr(10)
             +'       locationinitem.qualityname,locinskudetail.locname,locinskudetail.quantityuom,   '+chr(13)+chr(10)
             +'       pieceuom="",areauom="",volumeuom="",weightuom="",                                 '+chr(13)+chr(10)
             +'       locationinitem.mainorder,locationinitem.cusbillno,       '+chr(13)+chr(10)
             +'       locationinitem.locationbillno,locationinitem.lotcode,locationinitem.iusername,    '+chr(13)+chr(10)
             +'       locinskudetail.jobno,locinskudetail.sno,locinskudetail.ldsno,locinskudetail.detailsno, '+chr(13)+chr(10)
             +'       pltid=sealno '+chr(13)+chr(10)//托盘号
             +'  from locationinitem (nolock),locinskudetail (nolock)   '+chr(13)+chr(10)
             +' where 1=1   '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
              ' and (locationinitem.userid in '+_Useridcan+' or locationinitem.iuserid in '+_Useridcan+') ',
              ' and (locationinitem.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
             +'    or locationinitem.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
             +' and locationinitem.jobno=locinskudetail.jobno '+chr(13)+chr(10)
             +' and locationinitem.sno=locinskudetail.sno '+chr(13)+chr(10)
             + strfillter;

   qryCongeal.Close;
   qryCongeal.Sql.Clear;
   qryCongeal.Sql.Add(strsql);
   qryCongeal.Open;
end;


procedure TfrmCongealQry.edtCusButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.edtCusExit(Sender: TObject);
begin
  if Trim(edtCus.Text)='' then edtCus.TextField:='';
end;

procedure TfrmCongealQry.cmbShipperCusButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.cmbShipperCusExit(Sender: TObject);
begin
  if Trim(cmbShipperCus.Text)='' then cmbShipperCus.TextField:='';
end;

procedure TfrmCongealQry.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure TfrmCongealQry.edtCostCusButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.edtIUserButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.edtIUserExit(Sender: TObject);
begin
   if Trim(edtIUser.Text)='' then edtIUser.TextField:='';
end;

procedure TfrmCongealQry.cmblocIDButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.cmblocIDExit(Sender: TObject);
begin
   if Trim(cmblocID.Text)='' then cmblocID.TextField:='';
end;

procedure TfrmCongealQry.cmbSKUNameButtonClick(Sender: TObject;
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

procedure TfrmCongealQry.cmbSKUNameExit(Sender: TObject);
begin
   if Trim(cmbSKUName.Text)='' then cmbSKUName.TextField:='';
end;

procedure TfrmCongealQry.edtLotCodeExit(Sender: TObject);
begin
   if Trim(edtLotCode.Text)='' then edtLotCode.Text:='';
end;

procedure TfrmCongealQry.cmbKCTypeChange(Sender: TObject);
begin
   btnRefreshClick(Self);
end;

end.
