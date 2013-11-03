unit forkwork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, dxDBELib,KDataSetProvider,GetDllPub;

type
  Tfrmforkwork = class(TForm)
    edtopname: TdxButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    edtopname1: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtopname2: TdxButtonEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    edtopname3: TdxButtonEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    edtopname4: TdxButtonEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtopname5: TdxButtonEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtopname6: TdxButtonEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtopname7: TdxButtonEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    edtnetweight: TdxEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    edtnetweight1: TdxEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    edtnetweight2: TdxEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    edtnetweight3: TdxEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    edtnetweight4: TdxEdit;
    GMSStickyLabel14: TGMSStickyLabel;
    edtnetweight5: TdxEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    edtnetweight6: TdxEdit;
    GMSStickyLabel16: TGMSStickyLabel;
    edtnetweight7: TdxEdit;
    GMSStickyLabel17: TGMSStickyLabel;
    edtlocationbillno: TdxEdit;
    GMSStickyLabel9: TGMSStickyLabel;
    edtnetweighttotal: TdxEdit;
    GMSStickyLabel18: TGMSStickyLabel;
    btnCancel: TKBitBtn;
    btnOk: TKBitBtn;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtopnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname4Change(Sender: TObject);
    procedure edtopname5ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname6ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtopname7ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    netweight:Extended;
    strtable,strjobno,strlocationbillno,strdate,strcustomsno,strforktype:string;


  public
    { Public declarations }

  end;

procedure Workforkwork(pstrjobno:string;pstrtype:string;pstforktype:string);

var
   frmforkwork: Tfrmforkwork;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub;

procedure Workforkwork(pstrjobno:string;pstrtype:string;pstforktype:string);
begin
   if frmforkwork <> nil then
   with frmforkwork do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmforkwork:=Tfrmforkwork.Create(Application);
   with frmforkwork do
   begin
     if pstforktype='T' then
     begin
        GMSStickyLabel6.Caption:='库 管 员';
        GMSStickyLabel1.Caption:='库 管 员';
        GMSStickyLabel2.Caption:='库 管 员';
        GMSStickyLabel3.Caption:='库 管 员';
        GMSStickyLabel4.Caption:='库 管 员';
        GMSStickyLabel5.Caption:='库 管 员';
        GMSStickyLabel7.Caption:='库 管 员';
        GMSStickyLabel8.Caption:='库 管 员';
     end;
     strforktype:=pstforktype;
     if getSysdata('qdtext')='T' then
        GMSStickyLabel9.Caption:='报关单号';
     if pstrtype='1' then
        strtable:='locationin'
     else
        strtable:='locationout';
     OpenSql(dataTmp.qryTmp,'select inout.jobno,inout.locationbillno,inout.customsno,opdate=convert(varchar(10),inout.operationdate,102),'
                           +'       netweight=sum(isnull(detail.netweight,0)) '
                           +'  from '+strtable+' inout left join '+strtable+'item detail  '
                           +'                                 on inout.jobno=detail.jobno '
                           +' where inout.jobno="'+pstrjobno+'"'
                           +' group by inout.jobno,inout.locationbillno,inout.customsno,convert(varchar(10),inout.operationdate,102) ');
     strjobno:=pstrjobno;
     strlocationbillno:=dataTmp.qryTmp.FieldByName('locationbillno').AsString;
     strcustomsno:=dataTmp.qryTmp.FieldByName('customsno').AsString;
     strdate:=dataTmp.qryTmp.FieldByName('opdate').AsString;
     netweight:=dataTmp.qryTmp.FieldByName('netweight').AsFloat;
     if getSysdata('qdtext')='T' then
        edtlocationbillno.Text:=strcustomsno
     else
        edtlocationbillno.Text:=strlocationbillno;
     edtnetweighttotal.Text:=FloatToStr(netweight);
     showmodal;
   end;
end;

procedure Tfrmforkwork.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmforkwork.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmforkwork.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure Tfrmforkwork.FormDestroy(Sender: TObject);
begin
   frmforkwork:=nil;
end;

procedure Tfrmforkwork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure Tfrmforkwork.edtopnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname1.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname1.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname2ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname2.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname2.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname3.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname3.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname4Change(Sender: TObject);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname4.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname4.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname5ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname5.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname5.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname6ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname6.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname6.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.edtopname7ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopname7.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopname7.Text  :=qrySelect.FieldByName('opname').asstring;
   end;
end;

procedure Tfrmforkwork.btnOkClick(Sender: TObject);
var
   num,maxsno:Integer;
   strnetweight:string;
begin
   num:=0;
   maxsno:=1;
   if getSysdata('qdtext')<>'T' then
   begin
      if edtopname.Text<>'' then
         num:=num+1;
      if edtopname1.Text<>'' then
         num:=num+1;
      if edtopname2.Text<>'' then
         num:=num+1;
      if edtopname3.Text<>'' then
         num:=num+1;
      if edtopname4.Text<>'' then
         num:=num+1;
      if edtopname5.Text<>'' then
         num:=num+1;
      if edtopname6.Text<>'' then
         num:=num+1;
      if edtopname7.Text<>'' then
         num:=num+1;
      strnetweight:=FloatToStr(netweight/num);
      if edtopname.Text<>'' then
         edtnetweight.Text:=strnetweight;
      if edtopname1.Text<>'' then
         edtnetweight1.Text:=strnetweight;
      if edtopname2.Text<>'' then
         edtnetweight2.Text:=strnetweight;
      if edtopname3.Text<>'' then
         edtnetweight3.Text:=strnetweight;
      if edtopname4.Text<>'' then
         edtnetweight4.Text:=strnetweight;
      if edtopname5.Text<>'' then
         edtnetweight5.Text:=strnetweight;
      if edtopname6.Text<>'' then
         edtnetweight6.Text:=strnetweight;
      if edtopname7.Text<>'' then
         edtnetweight7.Text:=strnetweight;
   end;
   if KmessageDlg('确定分摊工作量正确？',mtConfirmation,[mbYes,mbNo],0)=mryes then
   begin
      if edtopname.Text<>'' then                                        
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname.TextField+'","'+edtopname.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname1.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight1.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname1.TextField+'","'+edtopname1.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname2.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight2.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname2.TextField+'","'+edtopname2.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname3.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight3.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname3.TextField+'","'+edtopname3.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname4.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight4.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname4.TextField+'","'+edtopname4.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname5.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight5.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname5.TextField+'","'+edtopname5.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname6.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight6.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname6.TextField+'","'+edtopname6.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
      if edtopname7.Text<>'' then
      begin
         if getSysdata('qdtext')='T' then
            strnetweight:=edtnetweight7.Text;
         ExecSql(dataTmp.qryTmp,'insert into forkworkload '
                               +'       (sno,opid,opname,operationdate,locationbillno,jobnoin,netweight,createname,customsno,forktype) '
                               +'values ('+IntToStr(maxsno)+',"'+edtopname7.TextField+'","'+edtopname7.Text+'",  '
                               +'        "'+strdate+'","'+strlocationbillno+'","'+strjobno+'",'+strnetweight+',"'+_loginname+'","'+strcustomsno+'","'+strforktype+'")');
         maxsno:=maxsno+1;
      end;
   end;
   frmforkwork.Close;
end;

end.
