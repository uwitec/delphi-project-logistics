unit stockup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls,KDataSetProvider;

type
  Tfrmstockup = class(TForm)
    lblPrint: TLabelEffect;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    edtCostCus: TdxButtonEdit;
    edtcusid: TdxButtonEdit;
    cmbShipperCus: TdxButtonEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    chkgdgs: TdxCheckEdit;
    ckbsealno: TdxCheckEdit;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcusidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbShipperCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtcusidExit(Sender: TObject);
    procedure cmbShipperCusExit(Sender: TObject);
    procedure edtCostCusExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

procedure Workstockup;

var
   frmstockup: Tfrmstockup;

implementation
{$R *.dfm}

uses kindlg, datasTmp,GetDllPub,libuserPub;

procedure Workstockup;
begin
   if frmstockup <> nil then
   with frmstockup do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmstockup:=Tfrmstockup.Create(Application);
   with frmstockup do
   begin
     dtdReceDateT.Date:=Date;
     dtdReceDateF.Date:=Date-30;
     showmodal;
   end;
end;

procedure Tfrmstockup.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   strSql,strFilter:string;
   blnprint:boolean;
begin
   //打印
   if TKBitBtn(Sender)=btnPrint then
      blnprint:=true
   else
      blnprint:=False;
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara:=TstringList.Create;
   if edtcusid.Text<>'' then//寄仓单位
      strFilter:=strFilter+' and cusid="'+trim(edtcusid.TextField)+'" ';
   if cmbShipperCus.Text<>'' then//货主
      strFilter:=strFilter+'   and shippercusid="'+trim(cmbShipperCus.TextField)+'" '+chr(13);
   if edtCostCus.Text<>'' then//费用关系人
      strFilter:=strFilter+'   and costcusid="'+trim(edtCostCus.TextField)+'" '+chr(13);
   // 装柜日期
   if dtdReceDateF.Date<>0 then
      strFilter:=strFilter+ ' and convert(char(10),locationoutitem.taskdate,102)>="'+dtdReceDateF.Text+'"';
   if dtdReceDateT.Date<>0 then
      strFilter:=strFilter+ ' and convert(char(10),locationoutitem.taskdate,102)<="'+dtdReceDateT.Text+'"';

   if (chkgdgs.Checked) and (not ckbsealno.Checked)  then
   begin
      strsql:=' ksp_fhzxd @jobno="",@snocasing=0,@filter='''+strfilter+'''';
      lstPara.Add('date='+dtdReceDateF.Text+'至'+dtdReceDateT.Text);
      lstPara.Add('username='+_username);
      lstPara.Add('conno=无');
   end else
   if (not chkgdgs.Checked) and (not ckbsealno.Checked)  then
   begin
      strsql:=' ksp_stockup @filter='''+strfilter+'''';
      lstPara.Add('dateFrom='+dtdReceDateF.Text);                      //统计日期
      lstPara.Add('dateTo='+dtdReceDateT.Text);
   end else
   if (not chkgdgs.Checked) and (ckbsealno.Checked)  then
   begin
      strsql:=' ksp_stockupPL @filter='''+strfilter+'''';
      lstPara.Add('date='+dtdReceDateF.Text+'至'+dtdReceDateT.Text);
      lstPara.Add('ZDR='+_username);
      lstPara.Add('ZDRQ='+DATETOSTR(GETSERVERDATE));
      lstPara.Add('username='+_username);
   end;

   dataTmp.qryTmp.close;
   dataTmp.qryTmp.sql.Clear;
   OpenSql(dataTmp.qryTmp,strsql);
   if (chkgdgs.Checked) and (not ckbsealno.Checked) then
      WorkFillbb('900023',lstPara,not blnPrint,True,1,dataTmp.qryTmp)
   else
   if (not chkgdgs.Checked) and (not ckbsealno.Checked) then
      WorkFillbb('900015',lstPara,not blnPrint,True,1,dataTmp.qryTmp)
   else
   if (not chkgdgs.Checked) and (ckbsealno.Checked) then
      WorkFillbb('900170',lstPara,not blnPrint,True,1,dataTmp.qryTmp)
end;

procedure Tfrmstockup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmstockup.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmstockup.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure Tfrmstockup.FormDestroy(Sender: TObject);
begin
   frmstockup:=nil;
end;

procedure Tfrmstockup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure Tfrmstockup.edtcusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCusid.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCusid.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);

end;

procedure Tfrmstockup.cmbShipperCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      cmbShipperCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      cmbShipperCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);

end;

procedure Tfrmstockup.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCostCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCostCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure Tfrmstockup.edtcusidExit(Sender: TObject);
begin
   if edtCusid.Text='' then edtCusid.TextField:='';
end;

procedure Tfrmstockup.cmbShipperCusExit(Sender: TObject);
begin
   if cmbShipperCus.Text='' then cmbShipperCus.TextField:='';
end;

procedure Tfrmstockup.edtCostCusExit(Sender: TObject);
begin
   if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

end.
