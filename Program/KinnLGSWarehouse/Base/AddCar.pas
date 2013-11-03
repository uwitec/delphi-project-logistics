unit Addcar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser, GMSLabel, KinPickEdit, DBClient, KDataSetProvider,
  dxDBELib, dxDBTLCl, dxGrClms, dxDBGrid, dxTL, dxDBCtrl, KGroupBox, Menus;


type
  TfrmAddcar = class(TForm)
    KGroupBox2: TKGroupBox;
    gsmDate: TGMSStickyLabel;
    dtdarrivedate: TdxDateEdit;
    qryCar: TKADOQuery;
    dsCar: TDataSource;
    qryTmp: TKADOQuery;
    edtconveno: TdxEdit;
    edtdrivername: TdxEdit;
    gsmblno: TGMSStickyLabel;
    gsmCarrierNo: TGMSStickyLabel;
    memoRemark: TdxMemo;
    btnOk: TKBitBtn;
    btnCancel: TKBitBtn;
    edtxszh: TdxEdit;
    gsmBoxNo: TGMSStickyLabel;
    edtdrivertel: TdxEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtdriveridcar: TdxEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    edtlocationbillno: TdxEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtweightin: TdxEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtweightout: TdxEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    dtdloadcomdate: TdxDateEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    timarrivedate: TdxTimeEdit;
    timloadcomdate: TdxTimeEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure grdConEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdConExit(Sender: TObject);
    procedure mitAddClick(Sender: TObject);
    procedure mitDelClick(Sender: TObject);
    procedure edtShipperNameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtdrivernameExit(Sender: TObject);
    procedure dtdConDateEnter(Sender: TObject);
    procedure edtForwardExit(Sender: TObject);
    procedure edtShipperNameExit(Sender: TObject);
    procedure edtShipperNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    blnCus:Boolean;
    maxsno:Integer;
  public
    { Public declarations }
  end;

procedure WorkAddCar;

var
  frmAddcar: TfrmAddcar;
  strcaption:string;
  pstr:string;
implementation

{$R *.dfm}

uses kindlg,datas,libproc,main,libuserPub,GetDllPub;

procedure WorkAddCar;
begin
   frmAddCar:=TfrmAddCar.Create(Application);
   with frmAddCar do
   begin
      dtdarrivedate.Date:=Date;
      Show;
   end;
//  frmAddCar.Free;
end;

procedure TfrmAddcar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if KmessageDlg('确定关闭该窗口吗？',mtConfirmation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   Action:=CaFree;
end;

procedure TfrmAddcar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
      VK_ESCAPE:
         btnCancel.Click;
   end;
end;

procedure TfrmAddcar.FormDestroy(Sender: TObject);
begin
   frmAddCar:=nil;
end;

procedure TfrmAddcar.btnOkClick(Sender: TObject);
var
   I:Integer;
   strjobno,strjobnoCar,strcones:string;
begin
   strcones:='';
   if edtconveno.Text='' then
   begin
      edtconveno.SetFocus;
      kMessageDlg('车牌号不能为空！',mtWarning,[mbOK],0);
      exit;
   end;
   //lzw20090515
   strjobnoCar:=genJobno('Zk',_DatabaseId);
   ExecSql(qryTmp,'insert into locationinoutcon                                    '+chr(13)+chr(10)
                 +' (    jobno,userid,username,conno,sealno,contype,             '+chr(13)+chr(10)
                 +'      consptype,conquantity,remark,sno,liftconcusid,             '+chr(13)+chr(10)
                 +'      liftconcusname,loadgroupcusid,loadgroupcusname,             '+chr(13)+chr(10)
                 +'      forkgroupcusid,forkgroupcusname,liftmachinecusid,              '+chr(13)+chr(10)
                 +'      liftmachinecusname,conveno,convetype,xszh,drivername,              '+chr(13)+chr(10)
                 +'      driveridcar,iscon,blno,operationtype,drivecardno,              '+chr(13)+chr(10)
                 +'      tallycusid,tallycusname,drivertel,ischeck,cuscheck,              '+chr(13)+chr(10)
                 +'      arrivedate,loadcomdate,shipname,locationbillno,weightin,        '+chr(13)+chr(10)
                 +'      weightout,loadcomdate                                     '+chr(13)+chr(10)
                 +'  )                                                      '+chr(13)+chr(10)
                 +'values                                                   '+chr(13)+chr(10)
                 +'       ("'+strjobnoCar+'",                                       '+chr(13)+chr(10)
                 +'       "'+_Userid+'", "'+_UserName+'",                                        '+chr(13)+chr(10)
                 +'       " "," "," "," ","0","'+memoRemark.Text+'","1",                                 '+chr(13)+chr(10)
                 +'       " "," "," "," ",                                 '+chr(13)+chr(10)
                 +'       " "," "," "," ",                                 '+chr(13)+chr(10)
                 +'       "'+edtconveno.Text+'"," ","'+edtxszh.Text+'",                                 '+chr(13)+chr(10)
                 +'       "'+edtdrivername.Text+'","'+edtdriveridcar.Text+'",                                '+chr(13)+chr(10)
                 +'       "F"," "," "," ",                                 '+chr(13)+chr(10)
                 +'       " "," ","'+edtdrivertel.Text+'", " "," ",                                 '+chr(13)+chr(10)
                 +'       "'+DateToStr(dtdarrivedate.Date)+' ",null," ","'+edtlocationbillno.text+'", '+chr(13)+chr(10)
                 //lzw20101215
                 +'       "'+edtweightin.text+' ", "'+edtweightout.text+' ","'+DateToStr(dtdloadcomdate.Date)+'"  '+chr(13)+chr(10)

                 +'       )                                  '+chr(13)+chr(10)
           );

   if TKBitBtn(Sender)=btnOk then
      frmAddCar.close
   else
   begin
      qryCar.Close;
      qryCar.Open;
      edtconveno.Clear;
      edtconveno.SetFocus;
   end;
end;

procedure TfrmAddcar.FormCreate(Sender: TObject);
begin
   qryTmp.Connection:=_ADOConnection;
   qryCar.Connection:=_ADOConnection;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   Self.Caption:=strcaption;
end;

procedure TfrmAddcar.btnCancelClick(Sender: TObject);
begin
   frmAddCar.Close;
end;

procedure TfrmAddcar.grdConEditing(Sender: TObject; Node: TdxTreeListNode;
  var Allow: Boolean);
begin
   Allow:=True;
end;

procedure TfrmAddcar.grdConExit(Sender: TObject);
begin
   if qryCar.state in [dsInsert,dsEdit] then
      qryCar.Post;
end;

procedure TfrmAddcar.mitAddClick(Sender: TObject);
begin
   qryCar.Append;
   maxsno:=maxsno+1;
   qryCar.FieldByName('sno').AsInteger:=maxsno;
end;

procedure TfrmAddcar.mitDelClick(Sender: TObject);
begin
   if qryCar.RecordCount=0 then
      Exit;
   qryCar.Delete;
end;

procedure TfrmAddcar.edtShipperNameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qryselect:TKADOQuery;
begin
{   //不控制ID，只保存名称
   //lzw 20080215
   if edtShipperName.Text=''  then
   begin
      edtShipperName.TextField:='';
   end else
   if not blnCus then
   begin
      qrySelect:=pGetCustomerSelect('E',edtShipperName.Text);
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         edtShipperName.TextField:=qrySelect.FieldByName('Cusid').asstring;
         edtShipperName.Text     :=qrySelect.FieldByName('Cusname').asstring;
         //ReturnNext(Self);
      end else failed:=true;
      FreeAndNil(qrySelect);
   end;
   {if not blnCus then
   begin
      OpenSql(qryTmp,'select top 1 cusid,cusname     '+chr(13)+chr(10)
                    +'  from customer (nolock)       '+chr(13)+chr(10)
                    +' where attribute like "%E%"    '+chr(13)+chr(10)
                    +'   and isnull(taboo,"F")<>"T"  '+chr(13)+chr(10)
                    +'   and cushelpno like "'+edtShipperName.Text+'%" '+chr(13)+chr(10)
                    +' order by cushelpno asc        '+chr(13)+chr(10)
             );
      if qryTmp.FieldByName('Cusid').AsString<>'' then
      begin
         edtShipperName.Text     :=qryTmp.FieldByName('Cusname').asstring;
         edtShipperName.TextField:=qryTmp.FieldByName('CusId').asstring;
      end;
   end;
   blnCus:=False;  }
end;

procedure TfrmAddcar.edtdrivernameExit(Sender: TObject);
begin
{   if edtblno.Text='' then
      Exit;
   OpenSql(qryTmp,'select 1 from depotinout                  '+chr(13)+chr(10)
                 +' where depottype="'+pstr+'"  '+chr(13)+chr(10)
                 +'   and isnull(blno,"")="'+edtblno.Text+'" '+chr(13)+chr(10)
          );
   if qryTmp.RecordCount<>0 then
   begin
    //  if (KmessageDlg('已存在相同提单号，是否确认？',mtInformation,[mbOk,mbCancel],1,mbCancel)<>mrOk) then
      if (KmessageDlg(GetMessage('frmAddCar','004'),mtInformation,[mbOk,mbCancel],1,mbCancel)<>mrOk) then
      begin
         edtblno.SetFocus;
         Exit;
      end;
   end;
//   if edtBoxNo.Text='' then
//      edtBoxNo.Text:=edtblno.Text; |}
end;

procedure TfrmAddcar.dtdConDateEnter(Sender: TObject);
begin
   if dtdarrivedate.Date=0 then
   begin
      dtdarrivedate.Date:=Date;
   end;
end;

procedure TfrmAddcar.edtForwardExit(Sender: TObject);
begin
   blnCus:=False;
end;

procedure TfrmAddcar.edtShipperNameExit(Sender: TObject);
begin
   blnCus:=False;
   
end;

procedure TfrmAddcar.edtShipperNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

end.
