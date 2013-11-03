unit Congeal;

interface

uses
  Windows, Messages, SysUtils, Classes,Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,DB,DBTables, GMSLabel,Menus, KBitBtn,dxCntner,dxEditor,
  dxEdLib, dxDBELib, dxExEdtr, KinPickEdit, KGroupBox,dxTL, dxDBCtrl, dxDBGrid,
  dxPageControl, dxDBTLCl, dxGrClms, KUpdateSql, DBClient, KDataSetProvider,
  CheckLst;

type
  TfrmCongeal = class(TForm)
    ppmCongeal: TPopupMenu;
    mitCongeal: TMenuItem;
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
    jobno: TdxDBGridColumn;
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
    undisaccordname: TdxDBGridColumn;
    undisaccorddate: TdxDBGridColumn;
    disaccordname: TdxDBGridColumn;
    disaccorddate: TdxDBGridColumn;
    ckbcheckout: TdxCheckEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mitCongealClick(Sender: TObject);
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
  private
    flag:string;   //T为冻结,F为取消冻结
    { Private declarations }
  public
    { Public declarations }
  end;

procedure WorkCongeal(pflag:string);

var
  frmCongeal: TfrmCongeal;

implementation

{$R *.DFM}

uses Datas,libproc,libUser,kindlg,CostItemDx, main,libUserpub,GetDllPub,datasTmp;

procedure WorkCongeal(pflag:string);
begin
   if frmCongeal<>nil then
   with frmCongeal do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmCongeal:=TfrmCongeal.Create(Application);
   with frmCongeal do
   begin
      flag:=pflag;
      if flag='T' then
      begin
         frmCongeal.Caption:='冻结货物';
         ppmCongeal.Items[1].Visible:=False;
         undisaccordname.Visible:=True;
         undisaccorddate.Visible:=True;
         disaccordname.Visible:=False;
         disaccorddate.Visible:=False;
      end
      else
      begin
         frmCongeal.Caption:='取消冻结';
         ppmCongeal.Items[0].Visible:=False;
         undisaccordname.Visible:=False;
         undisaccorddate.Visible:=False;
         disaccordname.Visible:=True;
         disaccorddate.Visible:=True;
      end;
      Show;
   end;
end;

procedure TfrmCongeal.btnOkClick(Sender: TObject);
begin
//   btnRefreshClick(self);
end;

procedure TfrmCongeal.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCongeal.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCongeal.btnRefreshClick(Sender: TObject);
var
   strkeyid:string;
begin
   InitCongeal;
{   strkeyid:=qryCongeal.FieldByName('keyid').AsString;
   qryCongeal.Close;
   qryCongeal.Open;
   qryCongeal.DisableControls;
   if not qryCongeal.Locate('keyid',VarArrayOf([strkeyid]),[loCaseInsensitive, loPartialKey]) then
      qryCongeal.first;
   qryCongeal.EnableControls;  }
end;

procedure TfrmCongeal.FormCreate(Sender: TObject);
begin
   Height:=482;
   Width:=749;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(KGroupBox1);
   SetDxDbGrid(grdCongeal);
   qryCongeal.Connection:=_ADOConnection;
end;

procedure TfrmCongeal.mitCongealClick(Sender: TObject);
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
      if _OutLoc<>'T' then
         execSql(datatmp.qryTmp,'update locationinitem '
                               //lzw20100708
                               +'   set disaccord="T",disaccordname="'+_loginname+'",disaccorddate=getdate(),  '
                               +'       undisaccordname="",undisaccorddate=space(20)  '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString+' ')
      else
         execSql(datatmp.qryTmp,'update locationindetail '
                               +'   set disaccord="T",disaccordname="'+_loginname+'",disaccorddate=getdate(),  '
                               +'       undisaccordname="",undisaccorddate=space(20)  '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString+' '
                               +'   and ldsno='+qryCongeal.FieldByName('ldsno').AsString+' '
                               );
   end;
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmCongeal.FormDestroy(Sender: TObject);
begin
   frmCongeal:=nil;
end;

procedure TfrmCongeal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmCongeal.InitCongeal;
var
   strsql,strfillter,strfilerTmp:string;
   i:Integer;
begin
   if flag='T' then
      strfillter:=' and isnull(disaccord,"F")="F" '
   else
      strfillter:=' and isnull(disaccord,"F")="T" ';
   strfillter:=strfillter+IIF(edtCus.Text<>'',         ' and cusid="'+edtCus.TextField+'" ',' ')
                         +IIF(cmbShipperCus.Text<>'',  ' and shippercusid="'+cmbShipperCus.TextField+'" ',' ')
                         +IIF(edtCostCus.Text<>'',     ' and costcusid="'+edtCostCus.TextField+'" ',' ')
                         +IIF(edtIUser.Text<>'',       ' and iuserid="'+edtIUser.TextField+'" ',' ')
                         +IIF(edtLotCode.Text<>'',     ' and lotcode="'+edtLotCode.Text+'" ',' ')
                         +IIF(cmbSKUName.Text<>'',     ' and skuid="'+cmbSKUName.TextField+'" ',' ')
                         +IIF(cmblocID.Text<>'',       ' and locid="'+cmblocID.TextField+'" ',' ');
   if ckbDate.Checked then
   begin
      if dtdReceDateF.Date>0 then //开始时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),disaccorddate,102))>="'+dtdReceDateF.Text+'" ';
      if dtdReceDateT.Date>0 then   //结束时间
      strfillter:=strfillter+' and convert(datetime,convert(char(10),disaccorddate,102))<="'+dtdReceDateT.Text+'" ';
   end;
   //lzw20100708
   if Trim(memLocationBillno.Text)<>'' then
   begin
      strfilerTmp:='';
      for I:=0 to memLocationBillno.Lines.Count-1 do
      begin
         if Trim(memLocationBillno.Lines.Strings[I])<>'' then
            strfilerTmp:=strfilerTmp+' or isnull(locationbillno,"") like "%'+Trim(memLocationBillno.Lines.Strings[I])+'%" ';
      end;
      if strfilerTmp<>'' then
      begin
         delete(strfilerTmp,1,3);
         strfillter:=strfillter+' and ('+strfilerTmp+' ) ';
      end;
   end;
   if Trim(memcusbillno.Text)<>'' then
   begin
      strfilerTmp:='';
      for I:=0 to memcusbillno.Lines.Count-1 do
      begin
         if Trim(memcusbillno.Lines.Strings[I])<>'' then
            strfilerTmp:=strfilerTmp+' or isnull(cusbillno,"") like "%'+Trim(memcusbillno.Lines.Strings[I])+'%" ';
      end;
      if strfilerTmp<>'' then
      begin
         delete(strfilerTmp,1,3);
         strfillter:=strfillter+' and ('+strfilerTmp+' ) ';
      end;
   end;
   if Trim(memmainorder.Text)<>'' then
   begin
      strfilerTmp:='';
      for I:=0 to memmainorder.Lines.Count-1 do
      begin
         if Trim(memmainorder.Lines.Strings[I])<>'' then
            strfilerTmp:=strfilerTmp+' or isnull(mainorder,"") like "%'+Trim(memmainorder.Lines.Strings[I])+'%" ';
      end;
      if strfilerTmp<>'' then
      begin
         delete(strfilerTmp,1,3);
         strfillter:=strfillter+' and ('+strfilerTmp+' ) ';
      end;
   end;
   if _OutLoc<>'T' then
      strsql:='select operationdate=convert(char(10),operationdate,102),  '+chr(13)+chr(10)
             +'       cusname,shippercusname,skuname,skuid,costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(quantity,0)-isnull(quantitydo,0),   '+chr(13)+chr(10)
             +'       piece=isnull(piece,0)-isnull(piecedo,0),            '+chr(13)+chr(10)
             +'       area=isnull(area,0)-isnull(areado,0),               '+chr(13)+chr(10)
             +'       volume=isnull(volume,0)-isnull(volumedo,0),         '+chr(13)+chr(10)
             +'       netweight=isnull(netweight,0)-isnull(netweightdo,0),'+chr(13)+chr(10)
             +'       keyid=jobno+convert(char(10),sno),                  '+chr(13)+chr(10)
             +'       qualityname,locname,quantityuom,pieceuom,areauom,   '+chr(13)+chr(10)
             +'       volumeuom,weightuom,mainorder,cusbillno,disaccord,  '+chr(13)+chr(10)
             +'       locationbillno,jobno,lotcode,sno,locid,             '+chr(13)+chr(10)
             +'       cusid,shippercusid,costcusid,iuserid,iusername,     '+chr(13)+chr(10)
             //lzw20100708
             +'       disaccordname,disaccorddate,undisaccordname,undisaccorddate   '+chr(13)+chr(10)
             +'  from locationinitem (nolock)                             '+chr(13)+chr(10)
             +' where 1=1                                                  '+chr(13)+chr(10)
             +iif(ckbcheckout.Checked,' ','and isnull(quantity,0)>isnull(quantitydo,0) ' )
             + strfillter
   else //lzw20110322
      strsql:='select operationdate=convert(char(10),operationdate,102),  '+chr(13)+chr(10)
             +'       cusname,shippercusname,skuname,skuid,costcusname,   '+chr(13)+chr(10)
             +'       quantity=isnull(quantity,0)-isnull(quantitydo,0),   '+chr(13)+chr(10)
             +'       piece=isnull(piece,0)-isnull(piecedo,0),            '+chr(13)+chr(10)
             +'       area=isnull(area,0)-isnull(areado,0),               '+chr(13)+chr(10)
             +'       volume=isnull(volume,0)-isnull(volumedo,0),         '+chr(13)+chr(10)
             +'       netweight=isnull(netweight,0)-isnull(netweightdo,0),'+chr(13)+chr(10)
             +'       keyid=jobno+convert(char(4),sno)+convert(char(4),ldsno),  '+chr(13)+chr(10)
             +'       qualityname,locname,quantityuom,pieceuom,areauom,   '+chr(13)+chr(10)
             +'       volumeuom,weightuom,mainorder,cusbillno,disaccord,  '+chr(13)+chr(10)
             +'       locationbillno,jobno,lotcode,sno,ldsno,locid,       '+chr(13)+chr(10)
             +'       cusid,shippercusid,costcusid,iuserid,iusername,     '+chr(13)+chr(10)
             +'       disaccordname,disaccorddate,undisaccordname,undisaccorddate   '+chr(13)+chr(10)
             +'  from locationindetail (nolock)                             '+chr(13)+chr(10)
             +' where 1=1                                                  '+chr(13)+chr(10)
             +iif(ckbcheckout.Checked,' ','and isnull(quantity,0)>isnull(quantitydo,0) ' )
             + strfillter    ;
   qryCongeal.Close;
   qryCongeal.Sql.Clear;
   qryCongeal.Sql.Add(strsql);
   qryCongeal.Open;
end;


procedure TfrmCongeal.edtCusButtonClick(Sender: TObject;
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

procedure TfrmCongeal.edtCusExit(Sender: TObject);
begin
  if Trim(edtCus.Text)='' then edtCus.TextField:='';
end;

procedure TfrmCongeal.cmbShipperCusButtonClick(Sender: TObject;
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

procedure TfrmCongeal.cmbShipperCusExit(Sender: TObject);
begin
  if Trim(cmbShipperCus.Text)='' then cmbShipperCus.TextField:='';
end;

procedure TfrmCongeal.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure TfrmCongeal.edtCostCusButtonClick(Sender: TObject;
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

procedure TfrmCongeal.edtIUserButtonClick(Sender: TObject;
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

procedure TfrmCongeal.edtIUserExit(Sender: TObject);
begin
   if Trim(edtIUser.Text)='' then edtIUser.TextField:='';
end;

procedure TfrmCongeal.cmblocIDButtonClick(Sender: TObject;
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

procedure TfrmCongeal.cmblocIDExit(Sender: TObject);
begin
   if Trim(cmblocID.Text)='' then cmblocID.TextField:='';
end;

procedure TfrmCongeal.cmbSKUNameButtonClick(Sender: TObject;
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

procedure TfrmCongeal.cmbSKUNameExit(Sender: TObject);
begin
   if Trim(cmbSKUName.Text)='' then cmbSKUName.TextField:='';
end;

procedure TfrmCongeal.mitDisCongealClick(Sender: TObject);
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
      if _OutLoc<>'T' then
         execSql(datatmp.qryTmp,'update locationinitem '
                               //lzw20100708
                               +'   set disaccord="F",disaccordname="",disaccorddate=space(20),  '
                               +'       undisaccordname="'+_loginname+'",undisaccorddate=getdate()  '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString+' ')
      else
         execSql(datatmp.qryTmp,'update locationindetail '
                               //lzw20100708
                               +'   set disaccord="F",disaccordname="",disaccorddate=space(20),  '
                               +'       undisaccordname="'+_loginname+'",undisaccorddate=getdate()  '
                               +' where jobno="'+qryCongeal.FieldByName('jobno').AsString+'" '
                               +'   and sno='+qryCongeal.FieldByName('sno').AsString+' '
                               +'   and ldsno='+qryCongeal.FieldByName('ldsno').AsString+' ');
   end;
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmCongeal.edtLotCodeExit(Sender: TObject);
begin
   if Trim(edtLotCode.Text)='' then edtLotCode.Text:='';
end;

end.
