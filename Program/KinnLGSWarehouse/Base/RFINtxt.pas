unit RFintxt;

interface

uses
  Windows, Messages,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls,DBTables,Db,DBCtrls,libproc,GMSLabel,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  KBitBtn, KGroupBox,SLV, ComCtrls,KSText, frstatus, ADODB, dxfProgressBar,
  DBClient, KDataSetProvider, dxPageControl, dxDBTLCl, dxGrClms, dxDBGrid,
  dxTL, dxDBCtrl, Menus, KinPickEdit ;


type
  TfrmRFintxt = class(TForm)
    qryTmp: TKADOQuery;
    qryInputCost: TKADOQuery;
    OpenDialog1: TOpenDialog;
    conMtf: TADOConnection;
    AqryMtf: TADOQuery;
    qryLocationINOUTDetail: TKADOQuery;
    dtsInputCost: TDataSource;
    udsInputCost: TKadoUpdateSql;
    udsLocationINOUTDetail: TKadoUpdateSql;
    qryTmp1: TKADOQuery;
    dtsLocationINOUTDetail: TDataSource;
    qryBarCode: TKADOQuery;
    dtsBarCode: TDataSource;
    qryBarCodeCheck: TKADOQuery;
    dtsBarCodeCheck: TDataSource;
    grpFilter: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtPath: TdxButtonEdit;
    pgbClear: TdxfProgressBar;
    btnInputCost: TKBitBtn;
    grdBarCode: TdxDBGrid;
    operationtype: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    customsno: TdxDBGridColumn;
    lotcode: TdxDBGridColumn;
    conno: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    btnCheck: TKBitBtn;
    btnOK: TKBitBtn;
    btnCancel: TKBitBtn;
    grossweight: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    ldsno: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    xh: TdxDBGridColumn;
    btnAppend: TKBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGetCostClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure grdBarCodeChangeNodeEx(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure grdLocationINOUTEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAppendClick(Sender: TObject);
  private
    { Private declarations }

    strtype:string;
    strPath,TxtName :String;
    StrName,oldfilename:String;
    maxsno:integer;
    Deleted,Checked:Boolean;
    procedure grdLocationINOUTDetaildxBeforeInsert;
    procedure CheckIn;//进仓条码的校验
    procedure CheckOut;//出仓条码的校验
    procedure OKIn; //进仓数据导入
    procedure OKOut; //出仓数据导入

  public
    { Public declarations }
  end;

procedure WorkRFintxt(pstrtype:string);

var
  frmRFintxt: TfrmRFintxt;

implementation

{$R *.DFM}
uses datas,kindlg,libUser,libbb,ShellAPI,ZoomTxt,libuserPub, datasTmp,LocationIN,LocationOut,ConType;

procedure WorkRFintxt(pstrtype:string);
begin
   {防止程序被重复执行}
   Application.CreateForm(TfrmRFintxt,frmRFintxt);
   with frmRFintxt do
   begin
      strtype:=pstrtype;
      Deleted:=false;
      Checked:=false;
      ShowModal;
      Free;
   end;
end;

procedure TfrmRFintxt.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmRFintxt.FormDestroy(Sender: TObject);
begin
   frmRFintxt:=nil;
end;

procedure TfrmRFintxt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then
      ReturnNext(Self);
   case Key of
      Vk_Escape:
         if btnCancel.Enabled then
            btnCancelClick(Self);
   end;
end;

procedure TfrmRFintxt.btnGetCostClick(Sender: TObject);
var
   lstList,sltFpTmp:TStringList;
   F: TextFile;
   S,StrList,Strsql: string;
   I,J,K:Integer;
   intsno:integer;
   //进出仓标志；进仓单号；报关单号；批次；集装箱号；净重；毛重；进仓日期；库位；箱号
   stroperationtype,strlocationbillno,strcustomsno,strlotcode,strlennum:string;
   strconno,strnetweight,strgrossweight,stroperationdate,strlocname,strcustomsnoin,
   strjobnoin,strsnoin,strldsnoin,strdetailsnoin,strxh:string;
   Str_1,Str_2,Str_3,Str_4,Str_5:string;
begin
   if edtPath.Text = '' then
   begin
      KMessageDlg('请输入数据源路径和文件！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      exit;
   end else
   if compareText(ExtractFileExt(edtPath.Text),'.txt') <> 0 then
   begin
      KMessageDlg('文件必须为文本文件类型！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      Exit;
   end;
   btnInputCost.Enabled:=False;
   btnCancel.Enabled:=False;

   try
   //把文本文件内容读取到list中。
     lstList:=TstringList.Create;
     sltFpTmp:=Tstringlist.create;
     //读文件用的
     AssignFile(F,edtPath.Text);
     Reset(F);
     while not Eof(F) do
     begin
        Readln(F,S);
        lstList.Add(S);
     end;
     CloseFile(F);

     //lzw20100507
     if lstList.count=0 then
     begin
        KMessageDlg('文件内容为空,请确认导入的文件！',mtWarning,[mbOk],0);
        edtPath.SetFocus;
        exit;
     end;
   //**************开始解析文本内容***********//
     //创建临时表
     qryTmp.Close;
     qryTmp.sql.clear;
     strsql:='  if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
            +'     where id=object_id("tempdb..#lskOutItem") and sysstat & 0xf=3) '+chr(13)+chr(10)
            +'   drop table #lskOutItem '+chr(13)+chr(10)
            +' create table #lskOutItem '+chr(13)+chr(10)
            +' ( '+chr(13)+chr(10)
            +'   jobno varchar(20)  null,  '+chr(13)+chr(10)
            +'   sno smallint  null,  '+chr(13)+chr(10)
            +'   ldsno int null,  '+chr(13)+chr(10)
            +'   operationtype char(10) null,  '+chr(13)+chr(10)
            +'   locationbillno varchar(50) null, '+chr(13)+chr(10)
            +'   customsno varchar(50) null, '+chr(13)+chr(10)
            +'   lotcode varchar(50) null, '+chr(13)+chr(10)
            +'   conno varchar(50) null, '+chr(13)+chr(10)
            +'   quantity numeric(16,4) null , '+chr(13)+chr(10)
            +'   piece numeric(16,4) null , '+chr(13)+chr(10)
            +'   netweight numeric(16,4) null , '+chr(13)+chr(10)
            +'   grossweight numeric(16,4) null , '+chr(13)+chr(10)
            +'   operationdate varchar(50) null , '+chr(13)+chr(10)
            +'   locname varchar(50) null , '+chr(13)+chr(10)
            //lzw20100820
            +'   jobnoin varchar(20)  null,  '+chr(13)+chr(10)
            +'   snoin smallint  null,  '+chr(13)+chr(10)
            +'   ldsnoin int null,  '+chr(13)+chr(10)
            +'   xh varchar(50) null  '+chr(13)+chr(10)
            +'  )'+chr(13)+chr(10);
     qryTmp.sql.add(strsql);
     qryTmp.ExecSql;

     i:=0;
     while i < lstList.Count  do
     begin
        Application.ProcessMessages;
        pgbClear.Stepit;
        //inc(i);
        StrList:= trim(Lstlist.Strings[i]);

        if StrList='' then break;
        breakStr(StrList,';',false,false,false,sltFpTmp);
        if strtype='IN' then
        begin
           //业务类型
           stroperationtype:=sltFptmp.strings[0];
           //locationbillno仓单号
           strlocationbillno:= sltFptmp.strings[1];
           //customsno报关单号(当前模版为空)
           strcustomsno:=sltFptmp.strings[2];
           //lotcode批次
           strlotcode:=sltFptmp.strings[3];
           //conno柜号
           strconno:=sltFptmp.strings[4];
           //netweight净重
           strnetweight:=sltFptmp.strings[5];
           //grossweight毛重
           strgrossweight:=sltFptmp.strings[6];
           //customsno进仓日期
           Stroperationdate:=sltFptmp.strings[7];
           //locname库位
           strlocname:=sltFptmp.strings[8];
           strjobnoin:='';
           strsnoin:='';
           strldsnoin:='';
           //xh箱号
           strxh:=sltFptmp.strings[9];
        end else
        if strtype='OUT' then
        begin
           //业务类型
           stroperationtype:=sltFptmp.strings[0];
           //locationbillno仓单号
           strlocationbillno:= sltFptmp.strings[1];
           //customsno报关单号(当前模版为空)
           strcustomsno:=sltFptmp.strings[2];
           //conno柜号
           strconno:=sltFptmp.strings[3];
           //customsno出仓日期
           Stroperationdate:=sltFptmp.strings[4];
           //xh箱号
           strxh:=sltFptmp.strings[5];
           opensql(qryTmp,'select * from locinskudetail(nolock) '
                         +' where locinskudetail.sealno="'+strxh+'"            '
                         +'   and isnull(locinskudetail.quantityremain,0)> 0   '
                  );
           if qryTmp.RecordCount>0 then
           begin
              strnetweight:=FloatToStr(qryTmp.fieldbyname('netweight').asfloat);
              strgrossweight:=FloatToStr(qryTmp.fieldbyname('grossweight').asfloat);
              strlocname:=qryTmp.fieldbyname('locname').AsString;
              //lotcode批次
              strlotcode:=qryTmp.fieldbyname('lotcode').AsString;
              //lzw20100820对应进的报关单号
              strjobnoin:=qryTmp.fieldbyname('jobno').AsString;
              strsnoin:=qryTmp.fieldbyname('sno').AsString;
              strldsnoin:=qryTmp.fieldbyname('ldsno').AsString;

           end else
           begin
              KMessagedlg('不存在箱号为"'+strxh+'"的任务信息',mtInformation,[mbOk],0);
              frmrfintxt.close;
              exit;
           end;
        end;

        //取出后塞入临时表
        ExecSql(qrytmp,' insert into #lskOutItem '+char(13)+chr(10)
                     +'  (  jobno,sno,ldsno,operationtype, locationbillno,customsno, '+char(13)+chr(10)
                     +'  lotcode,conno,quantity,piece,netweight, grossweight,operationdate,locname, '+char(13)+chr(10)
                     +'  jobnoin,snoin,ldsnoin,xh)   '+char(13)+chr(10)
                     +'  values                                             '+char(13)+chr(10)
                     +'  (                                                  '+char(13)+chr(10)
                     +'  "" ,                                               '+char(13)+chr(10)
                     +'  0,                                                 '+char(13)+chr(10)
                     +'  '+inttostr(i+1)+',                                 '+char(13)+chr(10)
                     +'  "'+Stroperationtype+'",                            '+char(13)+chr(10)
                     +'  "'+Strlocationbillno+'",                           '+char(13)+chr(10)
                     +'  "'+Strcustomsno+'",                                '+char(13)+chr(10)
                     +'  "'+Strlotcode+'",                                  '+char(13)+chr(10)
                     +'  "'+Strconno+'",                                    '+char(13)+chr(10)
                     +'  1,                                                 '+char(13)+chr(10)
                     +'  1,                                                 '+char(13)+chr(10)
                     +'  "'+Strnetweight+'",                                '+char(13)+chr(10)
                     +'  "'+Strgrossweight+'",                              '+char(13)+chr(10)
                     +'  "'+Stroperationdate+'",                            '+char(13)+chr(10)
                     +'  "'+Strlocname+'",                                  '+char(13)+chr(10)
                     //lzw20100820
                     +'  "'+Strjobnoin+'",                                  '+char(13)+chr(10)
                     +'  "'+Strsnoin+'",                                    '+char(13)+chr(10)
                     +'  "'+Strldsnoin+'",                                  '+char(13)+chr(10)

                     +'  "'+Strxh+'"                                        '+char(13)+chr(10)
                     //+'  SUBSTRING(REVERSE(SUBSTRING(REVERSE("'+Strxh+'"),1,6)),1,4)  '+char(13)+chr(10)
                     +'  )                                                  '+char(13)+chr(10)
                );
        //处理时间格式
        ExecSql(qryTmp1,' update  #lskOutItem                                    '+char(13)+chr(10)
                       +'    set  operationdate=replace(convert(char(10),convert(datetime,operationdate),102),"-",".")   '+char(13)+chr(10)
                );

        StrList:='';
        i:=i+1;
        pgbClear.StepBy(1);
        continue;
     end;


     pgbClear.Visible:=False;

     opensql(qryBarCode,' select type=case when operationtype="1" then "进仓" else "出仓" end,* '
                       +'   from #lskOutItem ');

     btnAppend.Enabled:=True;
     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     KMessagedlg('数据预览完成',mtInformation,[mbOk],0);
     btnCheck.Enabled:=True;
     btnAppend.SetFocus;
     //lzw20100513
     oldfilename:= edtPath.Text;
     edtPath.Text := '';
     edtPath.SetFocus;

   except
     Application.ProcessMessages;
     KShowmessage('文件无法被正确读取！');
     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     Exit;
   end;
   btnInputCost.Enabled:=False;
end;


procedure TfrmRFintxt.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(grpFilter);
   SetDxDbGrid(grdBarCode);
   qryBarCode.Connection:=_ADOConnection;
   qryBarCodeCheck.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;

   qryInputCost.Connection:=_ADOConnection;
   qryLocationINOUTDetail.Connection:=_ADOConnection;
end;

procedure TfrmRFintxt.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
Var
   IntLenth:integer;
begin
   if OpenDialog1.Execute then
   begin
      strPath:=ExtractFileDir(OpenDialog1.FileName);
      TxtName:=ExtractFileName(OpenDialog1.FileName);
      edtPath.Text:=OpenDialog1.FileName;
      IntLenth:=length(TxtName);
      StrName:=copy(TxtName,1,(intlenth-4));
   end;
end;

procedure TfrmRFintxt.grdLocationINOUTDetaildxBeforeInsert;
begin
  qryInputCost.fieldbyname('SNO').Asinteger:=-1;
end;

procedure TfrmRFintxt.grdBarCodeChangeNodeEx(
  Sender: TObject);
begin
  if grdbarcode.Datalink.DataSet.State = dsInsert then
  begin
    grdLocationINOUTDetaildxBeforeInsert;
  end;
end;

procedure TfrmRFintxt.btnCheckClick(Sender: TObject);
var
   strsql,strlocname,strxh:string;
   OkFlag:Boolean;
begin
   //判断仓位资料
   OpenSql(qryTmp,' select distinct #lskOutItem.locname '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'  where not exists(select 1  from  location (nolock)  '+chr(13)+chr(10)
                 +'                    where location.locname=#lskOutItem.locname  '+chr(13)+chr(10)
                 +'                      and location.isdetail="T" ) '+chr(13)+chr(10)
                 );
   qryTmp.First;
   strlocname:='';
   while not qryTmp.Eof do
   begin
      strlocname:=strlocname+'/'+Trim(qryTmp.FieldByName('locname').Asstring);
      qryTmp.Next;
   end;
   if Trim(strlocname)<>'' then
   begin
      KMessageDlg('系统不存在以下库位："'+strlocname+'",请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      Exit;
   end;
   //判断箱号
   OpenSql(qryTmp,'select num=count(xh),xh      '+chr(13)+chr(10)
                 +'  from #lskOutItem           '+chr(13)+chr(10)
                 +' group by xh having count(xh) >1 '
                 );
   strxh:='';
   qryTmp.First;
   while not qryTmp.Eof do
   begin
      strxh:=strxh+''+Trim(qryTmp.FieldByName('xh').Asstring);
      qryTmp.Next;
   end;
   if Trim(strxh)<>'' then
   begin
      KMessageDlg('导入的条码存在箱号为"'+strxh+'"重复的数据,请重新导入！',mtInformation,[mbOk],0);
      edtPath.text:='';
      edtPath.SetFocus;
      Exit;
   end;

   if strtype='IN' then
   begin
      CheckIn;
   end else
   if strtype='OUT' then
   begin
      CheckOut;
   end;
end;

procedure TfrmRFintxt.grdLocationINOUTEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=false;
end;

procedure TfrmRFintxt.btnOKClick(Sender: TObject);
var
   strSqlQ,strSqlA:string;
   FailFlag:boolean;
begin
   if Kmessagedlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mryes then exit;

   if strtype='IN' then
   begin
      OKIn;
      frmRFintxt.Close;
      frmLocationIN.btnRefreshClick(frmLocationIN.btnRefresh);
   end else
   if strtype='OUT' then
   begin
      OKOut;
      frmRFintxt.Close;
      frmLocationout.btnRefreshClick(frmLocationout.btnRefresh);
   end;;
   btnOK.Enabled:=False;
end;

procedure TfrmRFintxt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

//进仓条码的校验
procedure TfrmRFintxt.CheckIn;
var
   strlocname,strlocationbillno,strcustomsno,strlotcode,strxh: string;
begin
//判断仓单号
   OpenSql(qryTmp,' select distinct #lskOutItem.locationbillno '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'  where not exists(select 1 from locationinitem (nolock)  '+chr(13)+chr(10)
                 +'                    where locationinitem.locationbillno=#lskOutItem.locationbillno)  '+chr(13)+chr(10)
                  );
   qryTmp.First;
   strlocationbillno:='';
   while not qryTmp.Eof do
   begin
      strlocationbillno:=strlocationbillno+'/'+Trim(qryTmp.FieldByName('locationbillno').Asstring);
      qryTmp.Next;
   end;
   if Trim(strlocationbillno)<>'' then
   begin
      KMessageDlg('仓单号"'+strlocationbillno+'"与任务信息不符,请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      Exit;
   end;
   //判断报关单号 
   OpenSql(qryTmp,' select distinct #lskOutItem.customsno  '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'  where not exists(select 1 from locationinitem (nolock)  '+chr(13)+chr(10)
                 +'                    where locationinitem.customsno=#lskOutItem.customsno)  '+chr(13)+chr(10)
                 );
   qryTmp.First;
   strcustomsno:='';
   while not qryTmp.Eof do
   begin
      strcustomsno:=strcustomsno+'/'+Trim(qryTmp.FieldByName('customsno').Asstring);
      qryTmp.Next;
   end;  
   if Trim(strcustomsno)<>'' then
   begin
      KMessageDlg('报关单号"'+strcustomsno+'"与任务信息不符,请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      exit;
   end;
//判断箱号
   OpenSql(qryTmp,'select locinskudetail.sealno,#lskOutItem.xh      '+chr(13)+chr(10)
                 +'  from #lskOutItem,locinskudetail (nolock)  '+chr(13)+chr(10)
                 +' where isnull(locinskudetail.sealno,"")=isnull(#lskOutItem.xh,"")  '+chr(13)+chr(10)
                 );
   strxh:='';
   qryTmp.First;
   while not qryTmp.Eof do
   begin
      strxh:=strxh+'/'+Trim(qryTmp.FieldByName('xh').Asstring);
      qryTmp.Next;
   end;
   if Trim(strxh)<>'' then
   begin
      KMessageDlg('系统中已经存在"'+strxh+'"的数据,请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      Exit;
   end;

//塞入jobno，sno
   execsql(qryTmp,'update #lskOutItem set  '+chr(13)+chr(10)
                 +'       jobno=locationinitem.jobno,sno=locationinitem.sno  '+chr(13)+chr(10)
                 +'  from locationinitem (nolock)                             '+chr(13)+chr(10)
                 +' where locationinitem.locationbillno=#lskOutItem.locationbillno '+chr(13)+chr(10)
                 +'   and isnull(locationinitem.customsno,"")=#lskOutItem.customsno          '+chr(13)+chr(10)
//                 +'   and isnull(locationinitem.lotcode,"")=#lskOutItem.lotcode              '+chr(13)+chr(10)
          );

//进行数量合计，用于后面生成detail
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskinitemSum") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskinitemSum '+chr(13)+chr(10)
                 +' select locationbillno,lotcode,customsno,netweight=sum(isnull(netweight,0)),  '+chr(13)+chr(10)
                 +'        quantity=sum(isnull(quantity,0)),piece=sum(isnull(piece,0)),   '+chr(13)+chr(10)
                 +'        jobno,sno,grossweight=sum(isnull(grossweight,0))   '+chr(13)+chr(10)
                 +'   into #lskinitemSum   '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +'  where 1=1  '+chr(13)+chr(10)
                 +'  group by locationbillno,lotcode,customsno,jobno,sno '+chr(13)+chr(10)
           );
//进行数量合计，用于与任务信息对比
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskindetailSum") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskindetailSum '+chr(13)+chr(10)
                 +' select locationbillno,lotcode,customsno,locname=#lskoutitem.locname,locid=location.locid,'+chr(13)+chr(10)
                 +'        quantity=sum(isnull(quantity,0)),  '+chr(13)+chr(10)
                 +'        piece=sum(isnull(piece,0)),  '+chr(13)+chr(10)
                 +'        netweight=sum(isnull(netweight,0)),  '+chr(13)+chr(10)
                 +'        jobno,sno,grossweight=sum(isnull(grossweight,0))   '+chr(13)+chr(10)
                 +'   into #lskindetailSum   '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +'        left join location(nolock)'+chr(13)+chr(10)
                 +'               on location.locname=isnull(#lskoutitem.locname,"") '+chr(13)+chr(10)
                 +'  group by locationbillno,lotcode,customsno,jobno,sno,#lskoutitem.locname,location.locid '+chr(13)+chr(10)
           );

//判断条码信息与任务信息中的数量是否一致
   OpenSql(qryTmp,' select #lskinitemSum.netweight,#lskinitemSum.grossweight,  '+chr(13)+chr(10)
                 +'        locationinitem.netweighttask,locationinitem.grossweighttask, '+chr(13)+chr(10)
                 +'        #lskinitemSum.locationbillno,#lskinitemSum.lotcode,#lskinitemSum.customsno, '+chr(13)+chr(10)
                 +'        remark=case when (isnull(#lskinitemSum.netweight,0)<>isnull(locationinitem.netweighttask,0)) then "导入的净重" '+chr(13)+chr(10)
                 +'                    when (isnull(#lskinitemSum.grossweight,0)<>isnull(locationinitem.grossweighttask,0)) then "导入的毛重"  end '+chr(13)+chr(10)
                 +'   from #lskinitemSum,locationinitem (nolock) '+chr(13)+chr(10)
                 +'  where #lskinitemSum.locationbillno=locationinitem.locationbillno  '+chr(13)+chr(10)
                 +'    and #lskinitemSum.customsno=locationinitem.customsno  '+chr(13)+chr(10)
                 +'    and (isnull(#lskinitemSum.quantity,0)<>isnull(locationinitem.quantitytask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskinitemSum.piece,0)<>isnull(locationinitem.piecetask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskinitemSum.netweight,0)<>isnull(locationinitem.netweighttask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskinitemSum.grossweight,0)<>isnull(locationinitem.grossweighttask,0))  '+chr(13)+chr(10)
           );
//更新校验信息
   if qryTmp.RecordCount>0 then
   begin
      KMessageDlg('"'+qryTmp.fieldbyname('remark').asstring+'"与对应任务信息不一致！',mtWarning,[mbOk],0);
      Exit;
   end;

   KMessageDlg('校验完毕,请导入！',mtInformation,[mbOk],0);
   //显示校验结果
   OpenSql(qryBarCodeCheck,' select * from #lskOutItem ');

   btnCheck.Enabled:=False;
   btnOK.Enabled:=true;
   btnOK.SetFocus;
end;

procedure TfrmRFintxt.CheckOut;
var
   strlocname,strlocationbillno,strcustomsno,strlotcode,stroutxh: string;
   maxsno:Integer;
begin
//判断仓单号
   OpenSql(qryTmp,' select distinct #lskOutItem.locationbillno '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'  where not exists(select 1 from locationoutitem (nolock)  '+chr(13)+chr(10)
                 +'                    where locationoutitem.locationbillno=#lskOutItem.locationbillno)  '+chr(13)+chr(10)
                  );
   qryTmp.First;
   strlocationbillno:='';
   while not qryTmp.Eof do
   begin
      strlocationbillno:=strlocationbillno+'/'+Trim(qryTmp.FieldByName('locationbillno').Asstring);
      qryTmp.Next;
   end;
   if Trim(strlocationbillno)<>'' then
   begin
      KMessageDlg('仓单号"'+strlocationbillno+'"与任务信息不符,请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      Exit;
   end;
   //判断报关单号
   OpenSql(qryTmp,' select distinct #lskOutItem.customsno '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'  where not exists(select 1 from locationoutitem (nolock)  '+chr(13)+chr(10)
                 +'                    where locationoutitem.customsno=#lskOutItem.customsno)  '+chr(13)+chr(10)
                  );
   qryTmp.First;
   strcustomsno:='';
   while not qryTmp.Eof do
   begin
      strcustomsno:=strcustomsno+' '+Trim(qryTmp.FieldByName('customsno').Asstring);
      qryTmp.Next;
   end;
   if Trim(strcustomsno)<>'' then
   begin
      KMessageDlg('报关单号"'+strlocationbillno+'"与任务信息不符,请重新导入！',mtInformation,[mbOk],0);
      frmRFintxt.Close;
      Exit;
   end;
   //塞入jobno，sno
   execsql(qryTmp,'update #lskOutItem set  '+chr(13)+chr(10)
                 +'       jobno=locationoutitem.jobno,sno=locationoutitem.sno  '+chr(13)+chr(10)
                 +'  from locationoutitem (nolock)                             '+chr(13)+chr(10)
                 +' where locationoutitem.locationbillno=#lskOutItem.locationbillno '+chr(13)+chr(10)
                 +'   and isnull(locationoutitem.customsno,"")=#lskOutItem.customsno          '+chr(13)+chr(10)
          );
   //lzw20100818ekun特殊处理根据进仓的Customsno作为唯一判断
   opensql(dataTmp.qryTmp,'if exists(select * from tempdb..sysobjects                                '+ chr(13)+chr(10)
                         +'           where id=object_id("tempdb..#lskcustomsno") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #lskcustomsno                                                '+chr(13)+chr(10)
                         +'if exists(select * from tempdb..sysobjects                                '+ chr(13)+chr(10)
                         +'           where id=object_id("tempdb..#lsklocoutitem") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #lsklocoutitem                                               '+chr(13)+chr(10)
                         +'select jobnoin=locinskudetail.jobno,snoin=locinskudetail.sno,jobno=locationout.jobno,  '+chr(13)+chr(10)
                         +'       ldsnoin=locinskudetail.ldsno,detailsnoin=locinskudetail.detailsno  '+chr(13)+chr(10)
                         +'  into #lskcustomsno                                                      '+chr(13)+chr(10)
                         +'  from #lskOutItem,locinskudetail(nolock),locationout(nolock)             '+chr(13)+chr(10)
                         +' where locinskudetail.sealno=#lskOutItem.xh                               '+chr(13)+chr(10)
                         +'   and #lskOutItem.locationbillno=locationout.locationbillno              '+chr(13)+chr(10)
                         +'select jobno=inout.jobno,sno=0,jobnoin=#lskcustomsno.jobnoin,snoin=#lskcustomsno.snoin,'+chr(13)+chr(10)
                         +'       jobnoinf=#lskcustomsno.jobnoin,snoinf=#lskcustomsno.snoin,ldsnoinf=#lskcustomsno.ldsnoin,'+chr(13)+chr(10)
                         +'       skuid=indetail.skuid,skuname=indetail.skuname,skuspec=initem.skuspec,'+chr(13)+chr(10)
                         +'       skumodel=initem.skumodel,userid=inout.userid,username=inout.username,'+chr(13)+chr(10)
                         +'       iuserid=inout.iuserid,iusername=inout.iusername,                    '+chr(13)+chr(10)
                         +'       costcusid=inout.costcusid,costcusname=inout.costcusname,            '+chr(13)+chr(10)
                         +'       cusid=inout.cusid,cusname=inout.cusname,initem.qualityname,         '+chr(13)+chr(10)
                         +'       shippercusid=inout.shippercusid,shippercusname=inout.shippercusname, '+chr(13)+chr(10)
                         +'       warerentcounttype=inout.warerentcounttype,countrent=inout.countrent, '+chr(13)+chr(10)
                         +'       countcontcost=inout.countcontcost,isbond=inout.isbond,             '+chr(13)+chr(10)
                         +'       customsno=inout.customsno,mainorder=inout.mainorder,              '+chr(13)+chr(10)
                         +'       locationbillno=inout.locationbillno,cusbillno=inout.cusbillno,     '+chr(13)+chr(10)
                         +'       taskdate=inout.taskdate,operationdate=inout.operationdate,         '+chr(13)+chr(10)
                         +'       customsnoin=initem.customsno,mainorderin=initem.mainorder,         '+chr(13)+chr(10)
                         +'       locationbillnoin=initem.locationbillno,cusbillnoin=initem.cusbillno,'+chr(13)+chr(10)
                         +'       quantitytask=sum(isnull(indetail.quantity,0)),quantityuom=initem.quantityuom, '+chr(13)+chr(10)
                         +'       piecetask=sum(isnull(indetail.piece,0)),pieceuom=initem.pieceuom,   '+chr(13)+chr(10)
                         +'       grossweighttask=sum(isnull(indetail.grossweight,0)),weightuom=initem.weightuom, '+chr(13)+chr(10)
                         +'       netweighttask=sum(isnull(indetail.netweight,0)),operationtype="-1",    '+chr(13)+chr(10)
                         +'       manufacturedate=initem.manufacturedate                             '+chr(13)+chr(10)
                         +'  into #lsklocoutitem                                                     '+chr(13)+chr(10)
                         +'  from #lskcustomsno,locationout inout(nolock),                           '+chr(13)+chr(10)
                         +'       locinskudetail indetail(nolock),locationinitem initem(nolock)      '+chr(13)+chr(10)
                         +' where indetail.jobno=#lskcustomsno.jobnoin                               '+chr(13)+chr(10)
                         +'   and indetail.sno=#lskcustomsno.snoin                                   '+chr(13)+chr(10)
                         +'   and indetail.ldsno=#lskcustomsno.ldsnoin                               '+chr(13)+chr(10)
                         +'   and indetail.detailsno=#lskcustomsno.detailsnoin                       '+chr(13)+chr(10)
                         +'   and initem.jobno=indetail.jobno                                        '+chr(13)+chr(10)
                         +'   and initem.sno=indetail.sno                                            '+chr(13)+chr(10)
                         +'   and inout.jobno=#lskcustomsno.jobno                                    '+chr(13)+chr(10)
                         +' group by inout.jobno,#lskcustomsno.jobnoin,#lskcustomsno.snoin,          '+chr(13)+chr(10)
                         +'       #lskcustomsno.jobnoin,#lskcustomsno.snoin,#lskcustomsno.ldsnoin,   '+chr(13)+chr(10)
                         +'       indetail.skuid,indetail.skuname,initem.skuspec,                    '+chr(13)+chr(10)
                         +'       initem.skumodel,inout.userid,inout.username,                       '+chr(13)+chr(10)
                         +'       inout.iuserid,inout.iusername,                                     '+chr(13)+chr(10)
                         +'       inout.costcusid,inout.costcusname,                                 '+chr(13)+chr(10)
                         +'       inout.cusid,inout.cusname,initem.qualityname,                      '+chr(13)+chr(10)
                         +'       inout.shippercusid,inout.shippercusname,                           '+chr(13)+chr(10)
                         +'       inout.warerentcounttype,inout.countrent,                           '+chr(13)+chr(10)
                         +'       inout.countcontcost,inout.isbond,                                  '+chr(13)+chr(10)
                         +'       inout.customsno,inout.mainorder,                                   '+chr(13)+chr(10)
                         +'       inout.locationbillno,inout.cusbillno,                              '+chr(13)+chr(10)
                         +'       inout.taskdate,inout.operationdate,                                '+chr(13)+chr(10)
                         +'       initem.customsno,initem.mainorder,                                 '+chr(13)+chr(10)
                         +'       initem.locationbillno,initem.cusbillno,                            '+chr(13)+chr(10)
                         +'       initem.quantityuom,                                                '+chr(13)+chr(10)
                         +'       initem.pieceuom,                                                   '+chr(13)+chr(10)
                         +'       initem.weightuom,                                                  '+chr(13)+chr(10)
                         +'       initem.manufacturedate                                             '+chr(13)+chr(10)
                         //处理 ldsno自动增长
                         +'  declare @int int                                                        '+chr(13)+chr(10)
                         +'   select @int=0                                                          '+chr(13)+chr(10)
                         +'   update #lsklocoutitem set sno=@int,@int=@int+1                         '+chr(13)+chr(10)
                         +'select distinct jobnoin,snoin,jobno from  #lskcustomsno                   '+chr(13)+chr(10)
           );
   //lzw20100823处理指令
   opensql(dataTmp.qryTmp2,'if exists(select * from tempdb..sysobjects                                 '+ chr(13)+chr(10)
                         +'           where id=object_id("tempdb..#lskwareorder") and sysstat & 0xf=3)'+chr(13)+chr(10)
                         +'  drop table #lskwareorder                                                 '+chr(13)+chr(10)
                         +'select jobno=inout.jobno,sno=item.sno,jobnoin=item.jobnoin,snoin=item.snoin,'+chr(13)+chr(10)
                         +'       jobnoinf=item.jobnoin,snoinf=item.snoin,ldsnoinf=item.ldsnoinf,      '+chr(13)+chr(10)
                         +'       skuid=item.skuid,skuname=item.skuname,                              '+chr(13)+chr(10)
                         +'       userid=inout.userid,username=inout.username,                        '+chr(13)+chr(10)
                         +'       iuserid=inout.iuserid,iusername=inout.iusername,                    '+chr(13)+chr(10)
                         +'       costcusid=inout.costcusid,costcusname=inout.costcusname,            '+chr(13)+chr(10)
                         +'       cusid=inout.cusid,cusname=inout.cusname,item.qualityname,           '+chr(13)+chr(10)
                         +'       shippercusid=inout.shippercusid,shippercusname=inout.shippercusname,'+chr(13)+chr(10)
                         +'       warerentcounttype=inout.warerentcounttype,countrent=inout.countrent,'+chr(13)+chr(10)
                         +'       countcontcost=inout.countcontcost,isbond=inout.isbond,              '+chr(13)+chr(10)
                         +'       customsno=inout.customsno,mainorder=inout.mainorder,                '+chr(13)+chr(10)
                         +'       locationbillno=item.locationbillnoin,cusbillno=inout.cusbillno,     '+chr(13)+chr(10)
                         +'       orderdate=inout.orderdate,                                          '+chr(13)+chr(10)
                         +'       customsnoin=item.customsnoin,mainorderin=item.mainorderin,          '+chr(13)+chr(10)
                         +'       cusbillnoin=item.cusbillnoin,                                       '+chr(13)+chr(10)
                         +'       quantity=item.quantitytask,quantityuom=item.quantityuom,          '+chr(13)+chr(10)
                         +'       piece=item.piecetask,pieceuom=item.pieceuom,                      '+chr(13)+chr(10)
                         +'       grossweight=item.grossweighttask,weightuom=item.weightuom,        '+chr(13)+chr(10)
                         +'       netweight=item.netweighttask,operationtype="-1"                     '+chr(13)+chr(10)
                         +'  into #lskwareorder                                                       '+chr(13)+chr(10)
                         +'  from #lsklocoutitem item(nolock),wareorder inout(nolock)                 '+chr(13)+chr(10)
                         +' where item.customsno=inout.customsno                                           '+chr(13)+chr(10)
                         +'select * from #lskwareorder                                                '+chr(13)+chr(10)
                         );

   if dataTmp.qryTmp.RecordCount>0 then
   begin
      //真实的塞入数据
      _ADOConnection.Starttransaction;
      try
         //删除指令20100823
         execsql(dataTmp.qryTmp1,'delete wareordersku                                                        '+chr(13)+chr(10)
                                +' where jobnoin in (select distinct jobnoin from #lskwareorder)             '+chr(13)+chr(10)
                                +'   and (not exists (select 1  from locationoutitem item                    '+chr(13)+chr(10)
                                +'                             where item.jobnoorder=wareordersku.jobno      '+chr(13)+chr(10)
                                +'                               and item.snoorder=wareordersku.sno ))       '+chr(13)+chr(10)
                                +'   and isnull(quantitytask,0)=0                                            '+chr(13)+chr(10)
                                +'   and isnull(quantityact,0)=0                                             '+chr(13)+chr(10)
                );
         //维护sno
         maxsno:=0;
         opensql(qryTmp1,'select maxsno=max(sno) from  wareordersku (nolock)                                 '+chr(13)+chr(10)
                       +'  where jobnoin in (select distinct jobnoin from #lskwareorder)                      '+chr(13)+chr(10)
                );

         //lzw20110128
         maxsno:=qryTmp1.FieldByname('maxsno').asinteger+100;
         execsql(qryTmp,'declare @maxsno smallint                                                            '+chr(13)+chr(10)
                       +' select @maxsno="'+inttostr(maxsno)+'"                                              '+chr(13)+chr(10)
                       +' update #lskwareorder set @maxsno=@maxsno+1,sno=@maxsno                             '+chr(13)+chr(10)
                );
         //删除任务
         execsql(dataTmp.qryTmp1,'delete locationoutitem                                                     '+chr(13)+chr(10)
                                +' where locationbillno in (select distinct locationbillno from #lskOutItem) '+chr(13)+chr(10)
                );
         //维护删除后的库存
         OpenSql(qryTmp,'exec ksp_RFWHLocationOutitem ');

         if dataTmp.qryTmp2.RecordCount>1 then
         begin
         //然后塞wareordersku
            ExecSql(qryTmp,'insert into wareordersku                    '+chr(13)+chr(10)
                          +'       (jobno, sno, jobnoin,snoin,          '+chr(13)+chr(10)
                          +'       jobnoinf,snoinf,ldsnoinf,            '+chr(13)+chr(10)
                          +'       skuid, skuname,                      '+chr(13)+chr(10)
                          +'       userid, username,  '+chr(13)+chr(10)
                          +'       costcusid,costcusname,               '+chr(13)+chr(10)
                          +'       cusid,cusname,qualityname,           '+chr(13)+chr(10)
                          +'       shippercusid,shippercusname,         '+chr(13)+chr(10)
                          +'       warerentcounttype,countrent,         '+chr(13)+chr(10)
                          +'       countcontcost,isbond,                '+chr(13)+chr(10)
                          +'       customsno,mainorder,                 '+chr(13)+chr(10)
                          +'       locationbillno,cusbillno,orderdate,  '+chr(13)+chr(10)
                          +'       customsnoin,mainorderin,cusbillnoin, '+chr(13)+chr(10)
                          +'       quantity,quantityuom,                '+chr(13)+chr(10)
                          +'       piece,pieceuom,                      '+chr(13)+chr(10)
                          +'       grossweight,weightuom,               '+chr(13)+chr(10)
                          +'       netweight,operationtype)             '+chr(13)+chr(10)
                          +'select jobno, sno, jobnoin,snoin,           '+chr(13)+chr(10)
                          +'       jobnoinf,snoinf,ldsnoinf,            '+chr(13)+chr(10)
                          +'       skuid, skuname,                      '+chr(13)+chr(10)
                          +'       userid, username,  '+chr(13)+chr(10)
                          +'       costcusid,costcusname,               '+chr(13)+chr(10)
                          +'       costcusid,costcusname,qualityname,   '+chr(13)+chr(10)
                          +'       costcusid,costcusname,               '+chr(13)+chr(10)
                          +'       warerentcounttype,countrent,         '+chr(13)+chr(10)
                          +'       countcontcost,isbond,                '+chr(13)+chr(10)
                          +'       customsno,mainorder,                 '+chr(13)+chr(10)
                          +'       locationbillno,cusbillno,orderdate,  '+chr(13)+chr(10)
                          +'       customsnoin,mainorderin,cusbillnoin, '+chr(13)+chr(10)
                          +'       quantity,quantityuom,                '+chr(13)+chr(10)
                          +'       piece,pieceuom,                      '+chr(13)+chr(10)
                          +'       grossweight,weightuom,               '+chr(13)+chr(10)
                          +'       netweight,operationtype              '+chr(13)+chr(10)
                          +' from  #lskwareorder                        '+chr(13)+chr(10)
                          +'' );
         end;
         //然后塞locationoutitem
         ExecSql(qryTmp,'insert into locationoutitem               '+chr(13)+chr(10)
                       +'     (jobno, sno, jobnoin,snoin,          '+chr(13)+chr(10)
                       +'      jobnoinf,snoinf,ldsnoinf,           '+chr(13)+chr(10)
                       +'      skuid, skuname, skuspec, skumodel,  '+chr(13)+chr(10)
                       +'      userid, username,iuserid,iusername, '+chr(13)+chr(10)
                       +'      costcusid,costcusname,              '+chr(13)+chr(10)
                       +'      cusid,cusname,qualityname,          '+chr(13)+chr(10)
                       +'      shippercusid,shippercusname,        '+chr(13)+chr(10)
                       +'      warerentcounttype,countrent,        '+chr(13)+chr(10)
                       +'      countcontcost,isbond,               '+chr(13)+chr(10)
                       +'      customsno,mainorder,                '+chr(13)+chr(10)
                       +'      locationbillno,cusbillno,           '+chr(13)+chr(10)
                       +'      taskdate,operationdate,             '+chr(13)+chr(10)
                       +'      customsnoin,mainorderin,            '+chr(13)+chr(10)
                       +'      locationbillnoin,cusbillnoin,       '+chr(13)+chr(10)
                       +'      quantitytask,quantityuom,           '+chr(13)+chr(10)
                       +'      piecetask,pieceuom,                 '+chr(13)+chr(10)
                       +'      grossweighttask,weightuom,          '+chr(13)+chr(10)
                       +'      netweighttask,operationtype,manufacturedate  '+chr(13)+chr(10)
                       +'   )                                      '+chr(13)+chr(10)
                       +'select jobno, sno, jobnoin,snoin,         '+chr(13)+chr(10)
                       +'      jobnoinf,snoinf,ldsnoinf,           '+chr(13)+chr(10)
                       +'      skuid, skuname, skuspec, skumodel,  '+chr(13)+chr(10)
                       +'      userid, username,iuserid,iusername, '+chr(13)+chr(10)
                       +'      costcusid,costcusname,          '+chr(13)+chr(10)
                       +'      costcusid,costcusname,qualityname,'+chr(13)+chr(10)
                       +'      costcusid,costcusname,          '+chr(13)+chr(10)
                       +'      warerentcounttype,countrent,    '+chr(13)+chr(10)
                       +'      countcontcost,isbond,           '+chr(13)+chr(10)
                       +'      customsno,mainorder,            '+chr(13)+chr(10)
                       +'      locationbillno,cusbillno,       '+chr(13)+chr(10)
                       +'      taskdate,operationdate,         '+chr(13)+chr(10)
                       +'      customsnoin,mainorderin,        '+chr(13)+chr(10)
                       +'      locationbillnoin,cusbillnoin,   '+chr(13)+chr(10)
                       +'      quantitytask,quantityuom,       '+chr(13)+chr(10)
                       +'      piecetask,pieceuom,             '+chr(13)+chr(10)
                       +'      grossweighttask,weightuom,      '+chr(13)+chr(10)
                       +'      netweighttask,operationtype,manufacturedate     '+chr(13)+chr(10)
                       +' from #lsklocoutitem                  '+chr(13)+chr(10)
                       +' ');
         _ADOConnection.Commit;
      except
         try
           _ADOConnection.rollback;
         except
         end;
         raise;

         Exit;
      end;
   end;
    //塞入jobno，sno
   execsql(qryTmp,'update #lskOutItem set  '+chr(13)+chr(10)
                 +'       jobno=locationoutitem.jobno,sno=locationoutitem.sno  '+chr(13)+chr(10)
                 +'  from locationoutitem (nolock)                             '+chr(13)+chr(10)
                 +' where locationoutitem.jobnoin=#lskOutItem.jobnoin          '+chr(13)+chr(10)
                 +'   and isnull(locationoutitem.snoin,"")=#lskOutItem.snoin   '+chr(13)+chr(10)
                 +'   and locationoutitem.jobno in (select jobno from #lskOutItem )  '+chr(13)+chr(10)
          );
   //塞入jobnoorder，snoorder
   execsql(qryTmp,'update locationoutitem set  '+chr(13)+chr(10)
                 +'       jobnoorder=wareordersku.jobno,snoorder=wareordersku.sno  '+chr(13)+chr(10)
                 +'  from wareordersku (nolock)                             '+chr(13)+chr(10)
                 +' where locationoutitem.jobnoin=wareordersku.jobnoin          '+chr(13)+chr(10)
                 +'   and locationoutitem.snoin=wareordersku.snoin   '+chr(13)+chr(10)
                 +'   and locationoutitem.jobno in (select jobno from #lskOutItem )  '+chr(13)+chr(10)
          );
   //判断箱号对应
   {OpenSql(qryTmp,' select distinct xh=#lskOutItem.xh, '+chr(13)+chr(10)
                 +'        itemjobnoin=locationoutitem.jobnoin  '+chr(13)+chr(10)
                 +'   from #lskOutItem       '+chr(13)+chr(10)
                 +'        left join locationoutitem (nolock)  '+chr(13)+chr(10)
                 +'               on locationoutitem.jobno=#lskOutItem.jobno  '+chr(13)+chr(10)
                 +'        left join locinskudetail (nolock)  '+chr(13)+chr(10)
                 +'               on locinskudetail.sealno=#lskOutItem.xh  '+chr(13)+chr(10)
                 +'  where locinskudetail.jobno<>locationoutitem.jobnoin '+chr(13)+chr(10)
                 );
   if qryTmp.RecordCount>0 then
   begin
      qryTmp.First;
      stroutxh:='';
      while not qryTmp.Eof do
      begin
         stroutxh:=stroutxh+'/'+Trim(qryTmp.FieldByName('xh').Asstring);
         qryTmp.Next;
      end;
      if stroutxh<>'' then
      begin
         KMessageDlg('箱号"'+stroutxh+'"的任务和明细的信息不一致,请重新导入！',mtInformation,[mbOk],0);
         Exit;
      end;
      frmRFintxt.Close;
      Exit;
   end; }

///进行数量合计，用于后面生成detail
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskoutitemSum") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutitemSum '+chr(13)+chr(10)
                 +' select locationbillno,lotcode,customsno,netweight=sum(isnull(netweight,0)),  '+chr(13)+chr(10)
                 +'        quantity=sum(isnull(quantity,0)),piece=sum(isnull(piece,0)),   '+chr(13)+chr(10)
                 +'        jobno,sno,jobnoin,snoin,grossweight=sum(isnull(grossweight,0))   '+chr(13)+chr(10)
                 +'   into #lskoutitemSum   '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +'  where 1=1  '+chr(13)+chr(10)
                 +'  group by locationbillno,lotcode,customsno,jobno,sno,jobnoin,snoin '+chr(13)+chr(10)
           );
//进行数量合计，用于与任务信息对比
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskoutdetailSum") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutdetailSum '+chr(13)+chr(10)
                 +' select locationbillno,lotcode,customsno,locid=space(50),  '+chr(13)+chr(10)
                 //#lskoutitem.locname,
                 +'        locname=space(50),'+chr(13)+chr(10)
                 +'        quantity=sum(isnull(quantity,0)),  '+chr(13)+chr(10)
                 +'        piece=sum(isnull(piece,0)),  '+chr(13)+chr(10)
                 +'        netweight=sum(isnull(netweight,0)),  '+chr(13)+chr(10)
                 +'        jobno,sno,jobnoin,snoin,grossweight=sum(isnull(grossweight,0))   '+chr(13)+chr(10)
                 +'   into #lskoutdetailSum   '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +'  group by locationbillno,lotcode,customsno,jobno,sno,jobnoin,snoin '+chr(13)+chr(10)
           );
      //lzw20110328 处理仓位信息
   ExecSql(qryTmp,'  update #lskoutdetailSum set                              '+chr(13)+chr(10)
                 +'         locname=isnull(#lskoutitem.locname,"")                       '+chr(13)+chr(10)
                 +'    from #lskoutitem                                       '+chr(13)+chr(10)
                 +'   where #lskoutitem.jobnoin=#lskoutdetailSum.jobnoin      '+chr(13)+chr(10)
                 +'     and #lskoutitem.snoin=#lskoutdetailSum.snoin          '+chr(13)+chr(10)
                 +'  update #lskoutdetailSum set                              '+chr(13)+chr(10)
                 +'         locid=isnull(location.locid,"")                             '+chr(13)+chr(10)
                 +'    from location(nolock)                                 '+chr(13)+chr(10)
                 +'   where location.locname=#lskoutdetailSum.locname         '+chr(13)+chr(10)
                    );
//判断条码信息与任务信息中的数量是否一致
   OpenSql(qryTmp,' select #lskoutitemSum.netweight,#lskoutitemSum.grossweight,  '+chr(13)+chr(10)
                 +'        locationoutitem.netweighttask,locationoutitem.grossweighttask, '+chr(13)+chr(10)
                 +'        #lskoutitemSum.locationbillno,#lskoutitemSum.lotcode,#lskoutitemSum.customsno, '+chr(13)+chr(10)
                 +'        remark=case when (isnull(#lskoutitemSum.netweight,0)<>isnull(locationoutitem.netweighttask,0)) then "导入的净重" '+chr(13)+chr(10)
                 +'                    when (isnull(#lskoutitemSum.grossweight,0)<>isnull(locationoutitem.grossweighttask,0)) then "导入的毛重"  end '+chr(13)+chr(10)
                 +'   from #lskoutitemSum,locationoutitem (nolock) '+chr(13)+chr(10)
                 +'  where #lskoutitemSum.locationbillno=locationoutitem.locationbillno  '+chr(13)+chr(10)
                 +'    and #lskoutitemSum.customsno=locationoutitem.customsno  '+chr(13)+chr(10)
                 +'    and (isnull(#lskoutitemSum.quantity,0)<>isnull(locationoutitem.quantitytask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskoutitemSum.piece,0)<>isnull(locationoutitem.piecetask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskoutitemSum.netweight,0)<>isnull(locationoutitem.netweighttask,0)  '+chr(13)+chr(10)
                 +'     or isnull(#lskoutitemSum.grossweight,0)<>isnull(locationoutitem.grossweighttask,0))  '+chr(13)+chr(10)
           );
//更新校验信息
   KMessageDlg('校验完毕,请导入！',mtInformation,[mbOk],0);
   //显示校验结果
   OpenSql(qryBarCodeCheck,' select * from #lskOutItem ');

   btnCheck.Enabled:=False;
   btnOK.Enabled:=true;
   btnOK.SetFocus;
end;


procedure TfrmRFintxt.OKIn;
begin
   //生成进仓实际临时表
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)
                 +'            where id=object_id("tempdb..#lskskudetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskskudetail '+chr(13)+chr(10)
                 +' select jobno=item.jobno,sno=item.sno,ldsno=0,jobnoinf=item.jobnoinf,snoinf=item.snoinf,  '+chr(13)+chr(10)
                 +'        ldsnoinf=0,operationtype=1, '+chr(13)+chr(10)
                 //lzw20110328
                 +'        locid=#lskindetailSum.locid,locname=#lskindetailSum.locname  , '+chr(13)+chr(10)
                 +'        skuid=item.skuid,skuname=item.skuname,                                              '+chr(13)+chr(10)
                 +'        lotcode=case when isnull(#lskindetailSum.lotcode,"")="" then item.skumodel else #lskindetailSum.lotcode end ,'+chr(13)+chr(10)
                 +'        qualityname=item.qualityname, '+chr(13)+chr(10)
                 +'        userid=item.userid, username=item.username, quantityuom=item.quantityuom, pieceuom=item.pieceuom, '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volumeuom, areauom=item.areauom, '+chr(13)+chr(10)

                 +'        quantity=(#lskindetailSum.quantity),     '+chr(13)+chr(10)
                 +'        piece=(#lskindetailSum.piece),     '+chr(13)+chr(10)
                 +'        netweight=(#lskindetailSum.netweight),     '+chr(13)+chr(10)
                 +'        grossweight=(#lskindetailSum.grossweight),   '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(#lskindetailSum.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(#lskindetailSum.quantity/item.quantitytask),     '+chr(13)+chr(10)

                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid,  '+chr(13)+chr(10)
                 +'        shippercusname=item.shippercusname, lottracked=item.lottracked,  '+chr(13)+chr(10)
                 +'        price=item.price, currcd=item.currcd, skucost=item.skucost, sealno=null,  '+chr(13)+chr(10)
                 +'        operationdate=(select top 1 operationdate from #lskoutitem where #lskoutitem.jobno=#lskindetailSum.jobno)  , '+chr(13)+chr(10)
                 +'        taskdate=item.taskdate, costuomtype=item.costuomtype, contwithloca=item.contwithloca, isbond=item.isbond, '+chr(13)+chr(10)
                 +'        countrent=item.countrent, countcontcost=item.countcontcost, warerentcounttype=item.warerentcounttype, '+chr(13)+chr(10)
                 +'        jobnoorder=item.jobnoorder,  snoorder=item.snoorder, '+chr(13)+chr(10)
                 +'        iuserid=item.iuserid, iusername=item.iusername, locationbillno=item.locationbillno,  '+chr(13)+chr(10)
                 +'        customsno=item.customsno, sizeuom=item.sizeuom, height=item.height, width=item.width,   '+chr(13)+chr(10)
                 +'        depth=item.depth, costcusid=item.costcusid, costcusname=item.costcusname, snotask=item.sno, '+chr(13)+chr(10)
                 +'        costcusidout=item.costcusidout,costcusnameout=item.costcusnameout,          '+chr(13)+chr(10)
                 +'        countrentout=item.countrentout, warerentcounttypeout=item.warerentcounttypeout,   '+chr(13)+chr(10)
                 +'        pricein=item.pricein, skucostin=item.skucostin,     '+chr(13)+chr(10)
                 +'        jobnoori=item.jobnoori, snoori=item.snoori, cusbillno=item.cusbillno, mainorder=item.mainorder,  '+chr(13)+chr(10)
                 +'        shipcusid=item.shipcusid, shipcusname=item.shipcusname                                       '+chr(13)+chr(10)
                 +'   into #lskskudetail                       '+chr(13)+chr(10)
                 +'   from #lskindetailSum,locationinitem item (nolock)      '+chr(13)+chr(10)
                 +'  where #lskindetailSum.jobno=item.jobno     '+chr(13)+chr(10)
                 +'  ');
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskskudetail set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//生成进仓商品明细临时表
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lsklocindetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lsklocindetail '+chr(13)+chr(10)
                 +' select jobno=item.jobno, sno=item.sno, ldsno=0, detailsno=0,      '+chr(13)+chr(10)
                 +'        skuid=item.skuid, skuname=item.skuname, serialno=sku.customerno, conno=#lskoutitem.conno, '+chr(13)+chr(10)
                 +'        quantity=#lskoutitem.quantity, quantityremain=#lskoutitem.quantity, quantityuom=item.quantityuom, '+chr(13)+chr(10)
                 +'        sizeuom=item.sizeuom, height=item.height, width=item.width, depth=item.depth,  '+chr(13)+chr(10)
                 +'        remark=space(20),        '+chr(13)+chr(10)
                 +'        lotcode=case when isnull(#lskoutitem.lotcode,"")="" then item.skumodel else #lskoutitem.lotcode end ,'+chr(13)+chr(10)
                 +'        qualityname=item.qualityname,   '+chr(13)+chr(10)
                 +'        locid=space(20), locname=#lskoutitem.locname, operationdate=#lskoutitem.operationdate, '+chr(13)+chr(10)
                 +'        iuserid=item.iuserid, iusername=item.iusername, userid=item.userid, username=item.username, '+chr(13)+chr(10)
                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid, shippercusname=item.shippercusname,     '+chr(13)+chr(10)
                 +'        costcusid=item.costcusid, costcusname=item.costcusname, pieceuom=item.pieceuom,   '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volumeuom, areauom=item.areauom,       '+chr(13)+chr(10)

                 +'        piece=(#lskoutitem.piece),     '+chr(13)+chr(10)
                 +'        netweight=(#lskoutitem.netweight),     '+chr(13)+chr(10)
                 +'        grossweight=(#lskoutitem.grossweight),   '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(#lskoutitem.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(#lskoutitem.quantity/item.quantitytask),     '+chr(13)+chr(10)

                 +'        tracktype="TO", sealno=#lskoutitem.xh                  '+chr(13)+chr(10)
                 +'   into #lsklocindetail                       '+chr(13)+chr(10)
                 +'   from #lskoutitem,locationinitem item(nolock)  '+chr(13)+chr(10)
                 +'                    left join sku                 '+chr(13)+chr(10)
                 +'                           on sku.skuid=item.skuid '+chr(13)+chr(10)
                 +'  where #lskoutitem.jobno=item.jobno       '+chr(13)+chr(10)
                 +'    and #lskoutitem.sno=item.sno         '+chr(13)+chr(10)
                 );
//处理Ldsno
   ExecSql(qryTmp,'  update #lsklocindetail set ldsno=#lskskudetail.ldsno        '+chr(13)+chr(10)
                 +'    from #lskskudetail                                        '+chr(13)+chr(10)
                 +'   where #lsklocindetail.locname=#lskskudetail.locname        '+chr(13)+chr(10)
                 +'     and #lsklocindetail.jobno=#lskskudetail.jobno            '+chr(13)+chr(10)
                 +'     and #lsklocindetail.sno=#lskskudetail.sno                '+chr(13)+chr(10)
                 );

//处理 detailsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lsklocindetail set detailsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//集装箱信息
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskcon") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskcon '+chr(13)+chr(10)
                 +' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskloccon") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskloccon '+chr(13)+chr(10)
                 +' select distinct conno,jobno '+chr(13)+chr(10)
                 +'   into #lskcon                       '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +' select jobno,conno,sno=0,userid="'+_userid+'",conquantity=count(1),  '+chr(13)+chr(10)
                 +'        username="'+_username+'",operationtype=1,iscon="T",  '+chr(13)+chr(10)
                 +'        contype="40",consptype="HC"                          '+chr(13)+chr(10)
                 +'   into #lskloccon                                           '+chr(13)+chr(10)
                 +'   from #lskcon                                              '+chr(13)+chr(10)
                 +'  group by jobno,conno                                       '+chr(13)+chr(10)
                 );
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskloccon set sno=@int,@int=@int+1       '+chr(13)+chr(10)
                 );           
//集装箱货物信息
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskconsku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskconsku '+chr(13)+chr(10)
                 +' select #lsklocindetail.jobno,#lsklocindetail.skuid,#lsklocindetail.lotcode, '+chr(13)+chr(10)
                 +'        userid="'+_userid+'",username="'+_username+'",              '+chr(13)+chr(10)
                 +'        #lsklocindetail.quantityuom,#lsklocindetail.pieceuom,#lsklocindetail.weightuom,#lsklocindetail.volumeuom,#lsklocindetail.areauom, '+chr(13)+chr(10)
                 +'        #lsklocindetail.quantity,#lsklocindetail.piece,#lsklocindetail.netweight,#lsklocindetail.grossweight,#lsklocindetail.volume,#lsklocindetail.area, '+chr(13)+chr(10)
                 +'        #lsklocindetail.cusid,#lsklocindetail.cusname,#lsklocindetail.shippercusid,#lsklocindetail.shippercusname,#lsklocindetail.skuname,  '+chr(13)+chr(10)
                 +'        sno=#lskloccon.sno,#lsklocindetail.ldsno,jobnoinf=space(20),snoinf=space(10),taskdate=null,sizeuom, iscon="T",cusbillno=space(50),'+chr(13)+chr(10)
                 +'        tagno=#lsklocindetail.sealno, '+chr(13)+chr(10)
                 +'        manufacturedate=(convert(char(4),year(#lsklocindetail.operationdate),102))+".01"+".01"   '+chr(13)+chr(10)
                 +'   into #lskconsku                                           '+chr(13)+chr(10)
                 +'   from #lsklocindetail                                      '+chr(13)+chr(10)
                 +'        left join #lskloccon         '+chr(13)+chr(10)
                 +'               on #lskloccon.jobno=#lsklocindetail.jobno                  '+chr(13)+chr(10)
                 +'              and #lskloccon.conno=#lsklocindetail.conno              '+chr(13)+chr(10)

                 );
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskconsku set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
                 );
//真实的塞入数据
   _ADOConnection.Starttransaction;
   try
//塞locinskudetail
      ExecSql(qryTmp,' insert into locinskudetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      skuid, skuname, sealno, conno,        '+chr(13)+chr(10)
                    +'      quantity, quantityremain, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,           '+chr(13)+chr(10)
                    +'      tracktype, serialno,manufacturedate         '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      skuid, skuname, sealno, conno,'+chr(13)+chr(10)
                    +'      quantity, quantityremain, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,           '+chr(13)+chr(10)
                    +'      tracktype, serialno,manufacturedate=(convert(char(4),year(operationdate),102))+".01"+".01" '+chr(13)+chr(10)
                    +' from #lsklocindetail         '+chr(13)+chr(10)
                    +' ');
//塞locationindetail
      ExecSql(qryTmp,' insert into locationindetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'      ldsnoinf, locid, locname, operationtype,     '+chr(13)+chr(10)
                    +'      skuid, skuname, lotcode, qualityname,          '+chr(13)+chr(10)
                    +'      userid, username, quantityuom, pieceuom,       '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, quantity,       '+chr(13)+chr(10)
                    +'      piece, netweight, grossweight, volume,         '+chr(13)+chr(10)
                    +'      area, cusid, cusname, shippercusid,              '+chr(13)+chr(10)
                    +'      shippercusname, lottracked, price, currcd,         '+chr(13)+chr(10)
                    +'      skucost, operationdate, transferdate,       '+chr(13)+chr(10)
                    +'      taskdate, costuomtype, contwithloca, isbond,             '+chr(13)+chr(10)
                    +'      countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'      snoorder, iuserid, iusername, locationbillno,               '+chr(13)+chr(10)
                    +'      customsno, sizeuom, height, width,                     '+chr(13)+chr(10)
                    +'      depth, costcusid, costcusname, snotask, costcusidout,      '+chr(13)+chr(10)
                    +'      costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'      skucostin,jobnoori, snoori, cusbillno, mainorder,         '+chr(13)+chr(10)
                    +'      shipcusid, shipcusname,manufacturedate      '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno,  jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'      ldsnoinf, locid, locname, operationtype,     '+chr(13)+chr(10)
                    +'      skuid, skuname, lotcode, qualityname,          '+chr(13)+chr(10)
                    +'      userid, username, quantityuom, pieceuom,       '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, quantity,       '+chr(13)+chr(10)
                    +'      piece, netweight, grossweight, volume,         '+chr(13)+chr(10)
                    +'      area, cusid, cusname, shippercusid,              '+chr(13)+chr(10)
                    +'      shippercusname, lottracked, price, currcd,         '+chr(13)+chr(10)
                    +'      skucost,  operationdate, operationdate,       '+chr(13)+chr(10)
                    +'      taskdate, costuomtype, contwithloca, isbond,             '+chr(13)+chr(10)
                    +'      countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'      snoorder, iuserid, iusername, locationbillno,               '+chr(13)+chr(10)
                    +'      customsno, sizeuom, height, width,                     '+chr(13)+chr(10)
                    +'      depth, costcusid, costcusname, snotask, costcusidout,      '+chr(13)+chr(10)
                    +'      costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'      skucostin,jobnoori, snoori, cusbillno, mainorder,         '+chr(13)+chr(10)
                    +'      shipcusid, shipcusname,manufacturedate=(convert(char(4),year(operationdate),102))+".01"+".01" '+chr(13)+chr(10)
                    +' from #lskskudetail         '+chr(13)+chr(10)
                    +' ');
//更新locationinitem
      ExecSql(qryTmp,'  update locationinitem  '+chr(13)+chr(10)
                    +'     set quantity=quantitytask,    '+chr(13)+chr(10)
                    +'         piece=piecetask,    '+chr(13)+chr(10)
                    +'         area=areatask,    '+chr(13)+chr(10)
                    +'         volume=volumetask,    '+chr(13)+chr(10)
                    +'         netweight=netweighttask,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttask,    '+chr(13)+chr(10)
                    +'         transferdate=(select top 1 operationdate from #lskskudetail where locationinitem.jobno=#lskskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskskudetail where locationinitem.jobno=#lskskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationinitem.jobno in (select distinct jobno from #lskskudetail) '+chr(13)+chr(10)
              );
//更新locationin
      ExecSql(qryTmp,'  update locationin  '+chr(13)+chr(10)
                    +'     set transferdate=(select top 1 operationdate from #lskskudetail where locationin.jobno=#lskskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskskudetail where locationin.jobno=#lskskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         quantity=quantitytasked,    '+chr(13)+chr(10)
                    +'         piece=piecetasked,    '+chr(13)+chr(10)
                    +'         area=areatasked,    '+chr(13)+chr(10)
                    +'         volume=volumetasked,    '+chr(13)+chr(10)
                    +'         netweight=netweighttasked,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttasked,    '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationin.jobno in (select distinct jobno from #lskskudetail) '+chr(13)+chr(10)
              );
//LZW20100612 塞箱表
      ExecSql(qryTmp,' delete locationinoutcon '+chr(13)+chr(10)
                    +'  where jobno in (select jobno from #lskloccon) '+chr(13)+chr(10)

              );
      execsql(qryTmp1,' insert into locationinoutcon '+chr(13)+chr(10)
                    +'   (  jobno,conno,sno,userid,conquantity,  '+chr(13)+chr(10)
                    +'      username,operationtype,iscon,  '+chr(13)+chr(10)
                    +'      contype,consptype              '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno,conno,sno,userid,conquantity,  '+chr(13)+chr(10)
                    +'      username,operationtype,iscon,  '+chr(13)+chr(10)
                    +'      contype,consptype              '+chr(13)+chr(10)
                    +' from #lskloccon         '+chr(13)+chr(10)
                    +' ');
//箱货
      ExecSql(qryTmp,' delete locationinoutconsku '+chr(13)+chr(10)
                    +'  where jobno in (select jobno from #lskconsku) '+chr(13)+chr(10)

              );
      execsql(qryTmp1,' insert into locationinoutconsku '+chr(13)+chr(10)
                    +'   ( jobno,skuid,lotcode, '+chr(13)+chr(10)
                    +'        userid,username,              '+chr(13)+chr(10)
                    +'        quantityuom,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
                    +'        quantity,piece,netweight,grossweight,volume,area, '+chr(13)+chr(10)
                    +'        cusid,cusname,shippercusid,shippercusname,skuname,  '+chr(13)+chr(10)
                    +'        sno,ldsno,jobnoin,snoin,taskdate,sizeuom, iscon,cusbillno,'+chr(13)+chr(10)
                    +'        tagno,manufacturedate,qualityname                                 '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +' select jobno,skuid,lotcode, '+chr(13)+chr(10)
                    +'        userid,username,              '+chr(13)+chr(10)
                    +'        quantityuom,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
                    +'        quantity,piece,netweight,grossweight,volume,area, '+chr(13)+chr(10)
                    +'        cusid,cusname,shippercusid,shippercusname,skuname,  '+chr(13)+chr(10)
                    +'        sno,ldsno,jobnoinf,snoinf,taskdate,sizeuom, iscon,cusbillno,'+chr(13)+chr(10)
                    +'        tagno,(convert(char(10),manufacturedate,102)),qualityname="COMMON"   '+chr(13)+chr(10)
                    +'  from  #lskconsku                                        '+chr(13)+chr(10)
                    +' ');
//更新对应指令信息
      //Execsql(qryTmp,'exec ksp_BarCodeLocationInItem ');
      _ADOConnection.Commit;
      kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);
      //lzw20100612更新集装箱表
      OpenSql(qryTmp,'select distinct jobno from  locationinoutcon (nolock) '
                    +' where locationinoutcon.jobno in (select distinct jobno from #lskloccon) '
             );
      qryTmp.First;
      while not qryTmp.Eof do
      begin
         workConType(qryTmp.fieldbyname('jobno').asstring);
         qryTmp.Next;
      end;
   except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);

      execsql(qryTmp,'drop table  #lsklocindetail      '
                    +'drop table  #lskskudetail       '
                    +'drop table  #lskindetailSum    '
                    +'drop table  #lskinitemSum    '
                    +'drop table  #lskcon   '
                    +'drop table  #lskloccon   '
                    +'drop table  #lskoutitem    ');
      Exit;
   end;
end;

procedure TfrmRFintxt.OKOut;
begin
//生成出仓实际临时表
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)
                 +'            where id=object_id("tempdb..#lskoutskudetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutskudetail '+chr(13)+chr(10)
                 +' select jobno=item.jobno,sno=item.sno,ldsno=0,jobnoinf=item.jobnoinf,snoinf=item.snoinf,  '+chr(13)+chr(10)
                 //LDSNOIN
                 +'        jobnoin=item.jobnoinf,snoin=item.snoinf,ldsnoin=item.ldsnoinf,  '+chr(13)+chr(10)
                 +'        ldsnoinf=item.ldsnoinf,locid=#lskoutdetailSum.locid,locname=#lskoutdetailSum.locname,operationtype=-1, '+chr(13)+chr(10)
                 +'        skuid=item.skuid,skuname=item.skuname, '+chr(13)+chr(10)
                 +'        lotcode=case when isnull(#lskoutdetailSum.lotcode,"")="" then item.skumodel else #lskoutdetailSum.lotcode end ,'+chr(13)+chr(10)
                 +'        qualityname=item.qualityname, '+chr(13)+chr(10)
                 +'        userid=item.userid, username=item.username, quantityuom=item.quantityuom, pieceuom=item.pieceuom, '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volumeuom, areauom=item.areauom, '+chr(13)+chr(10)

                 +'        quantity=(#lskoutdetailSum.quantity),     '+chr(13)+chr(10)
                 +'        piece=(#lskoutdetailSum.piece),     '+chr(13)+chr(10)
                 +'        netweight=(#lskoutdetailSum.netweight),     '+chr(13)+chr(10)
                 +'        grossweight=(#lskoutdetailSum.grossweight),   '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(#lskoutdetailSum.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(#lskoutdetailSum.quantity/item.quantitytask),     '+chr(13)+chr(10)

                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid,  '+chr(13)+chr(10)
                 +'        shippercusname=item.shippercusname, lottracked=item.lottracked,  '+chr(13)+chr(10)
                 +'        price=item.price, currcd=item.currcd, skucost=item.skucost, sealno=null,  '+chr(13)+chr(10)
                 +'        operationdate=(select top 1 operationdate from #lskoutitem where #lskoutitem.jobno=#lskoutdetailSum.jobno) , '+chr(13)+chr(10)
                 +'        taskdate=item.taskdate, costuomtype=item.costuomtype, contwithloca=item.contwithloca, isbond=item.isbond, '+chr(13)+chr(10)
                 +'        countrent=item.countrent, countcontcost=item.countcontcost, warerentcounttype=item.warerentcounttype, '+chr(13)+chr(10)
                 +'        jobnoorder=item.jobnoorder,  snoorder=item.snoorder, '+chr(13)+chr(10)
                 +'        iuserid=item.iuserid, iusername=item.iusername, locationbillno=item.locationbillno,  '+chr(13)+chr(10)
                 +'        customsno=item.customsno, sizeuom=item.sizeuom, height=item.height, width=item.width,   '+chr(13)+chr(10)
                 +'        depth=item.depth, costcusid=item.costcusid, costcusname=item.costcusname, snotask=item.sno, '+chr(13)+chr(10)
                 +'        costcusidout=item.costcusidout,costcusnameout=item.costcusnameout,          '+chr(13)+chr(10)
                 +'        countrentout=item.countrentout, warerentcounttypeout=item.warerentcounttypeout,   '+chr(13)+chr(10)
                 +'        pricein=item.pricein, skucostin=item.skucostin,     '+chr(13)+chr(10)
                 +'        jobnoori=item.jobnoori, snoori=item.snoori, cusbillno=item.cusbillno, mainorder=item.mainorder,  '+chr(13)+chr(10)
                 +'        shipcusid=item.shipcusid, shipcusname=item.shipcusname                                       '+chr(13)+chr(10)
                 +'   into #lskoutskudetail                       '+chr(13)+chr(10)
                 +'   from #lskoutdetailSum,locationoutitem item (nolock)      '+chr(13)+chr(10)
                 +'  where #lskoutdetailSum.jobno=item.jobno     '+chr(13)+chr(10)
                 //lzw20100819
                 +'    and #lskoutdetailSum.sno=item.sno     '+chr(13)+chr(10)
                 +'  ');
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskoutskudetail set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//生成进仓商品明细临时表
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lsklocoutdetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lsklocoutdetail '+chr(13)+chr(10)
                 +' select jobno=item.jobno, sno=item.sno, ldsno=0, detailsno=0,      '+chr(13)+chr(10)
                 +'        jobnoin=indetail.jobno,snoin=indetail.sno,ldsnoin=indetail.ldsno,detailsnoin=indetail.detailsno,'+chr(13)+chr(10)
                 +'        skuid=item.skuid, skuname=item.skuname, sealno=#lskoutitem.xh, conno=#lskoutitem.conno, '+chr(13)+chr(10)
                 +'        quantity=#lskoutitem.quantity,  quantityuom=item.quantityuom, '+chr(13)+chr(10)
                 +'        sizeuom=item.sizeuom, height=item.height, width=item.width, depth=item.depth,  '+chr(13)+chr(10)
                 +'        remark=space(20),item.ManufactureDate,                        '+chr(13)+chr(10)
                 +'        lotcode=case when isnull(#lskoutitem.lotcode,"")="" then item.skumodel else #lskoutitem.lotcode end ,'+chr(13)+chr(10)
                 +'        qualityname=item.qualityname,   '+chr(13)+chr(10)
                 +'        locid=space(20), locname=#lskoutitem.locname, operationdate=#lskoutitem.operationdate, '+chr(13)+chr(10)
                 +'        iuserid=item.iuserid, iusername=item.iusername, userid=item.userid, username=item.username, '+chr(13)+chr(10)
                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid, shippercusname=item.shippercusname,     '+chr(13)+chr(10)
                 +'        costcusid=item.costcusid, costcusname=item.costcusname, pieceuom=item.pieceuom,   '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volumeuom, areauom=item.areauom,       '+chr(13)+chr(10)

                 +'        piece=(#lskoutitem.piece),     '+chr(13)+chr(10)
                 +'        netweight=(#lskoutitem.netweight),     '+chr(13)+chr(10)
                 +'        grossweight=(#lskoutitem.grossweight),   '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(#lskoutitem.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(#lskoutitem.quantity/item.quantitytask) '+chr(13)+chr(10)
                 +'   into #lsklocoutdetail                       '+chr(13)+chr(10)
                 +'   from #lskoutitem                            '+chr(13)+chr(10)
                 +'        left join locinskudetail indetail (nolock)  '+chr(13)+chr(10)
                 +'               on indetail.sealno=#lskoutitem.xh  '+chr(13)+chr(10)
                 +'        ,locationoutitem item(nolock)  '+chr(13)+chr(10)
                 +'  where #lskoutitem.jobno=item.jobno       '+chr(13)+chr(10)
                 +'    and #lskoutitem.sno=item.sno         '+chr(13)+chr(10)
                 );
//处理Ldsno
   ExecSql(qryTmp,'  update #lsklocoutdetail set ldsno=#lskoutskudetail.ldsno        '+chr(13)+chr(10)
                 +'    from #lskoutskudetail                                        '+chr(13)+chr(10)
                 +'   where #lsklocoutdetail.locname=#lskoutskudetail.locname        '+chr(13)+chr(10)
                 +'     and #lsklocoutdetail.jobno=#lskoutskudetail.jobno            '+chr(13)+chr(10)
                 +'     and #lsklocoutdetail.sno=#lskoutskudetail.sno                '+chr(13)+chr(10)
                 );
//集装箱信息
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskoutcon") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutcon '+chr(13)+chr(10)
                 +' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskoutloccon") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutloccon '+chr(13)+chr(10)
                 +' select distinct conno,jobno '+chr(13)+chr(10)
                 +'   into #lskoutcon                       '+chr(13)+chr(10)
                 +'   from #lskoutitem '+chr(13)+chr(10)
                 +' select jobno,conno,sno=0,userid="'+_userid+'",conquantity=count(1),  '+chr(13)+chr(10)
                 +'        username="'+_username+'",operationtype=-1,iscon="T",  '+chr(13)+chr(10)
                 +'        contype="40",consptype="HC"                          '+chr(13)+chr(10)
                 +'   into #lskoutloccon                                           '+chr(13)+chr(10)
                 +'   from #lskoutcon                                              '+chr(13)+chr(10)
                 +'  group by jobno,conno                                          '+chr(13)+chr(10)
                 );
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskoutloccon set sno=@int,@int=@int+1       '+chr(13)+chr(10)
                 );
//集装箱货物信息
   ExecSql(qryTmp,' if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
                 +'            where id=object_id("tempdb..#lskoutconsku") and sysstat & 0xf=3) '+chr(13)+chr(10)
                 +'   drop table #lskoutconsku '+chr(13)+chr(10)
                 +' select distinct #lsklocoutdetail.jobno,#lsklocoutdetail.skuid,#lsklocoutdetail.lotcode, '+chr(13)+chr(10)
                 +'        userid="'+_userid+'",username="'+_username+'",              '+chr(13)+chr(10)
                 +'        #lsklocoutdetail.quantityuom,#lsklocoutdetail.pieceuom,#lsklocoutdetail.weightuom,#lsklocoutdetail.volumeuom,#lsklocoutdetail.areauom, '+chr(13)+chr(10)
                 +'        #lsklocoutdetail.quantity,#lsklocoutdetail.piece,#lsklocoutdetail.netweight,#lsklocoutdetail.grossweight,#lsklocoutdetail.volume,#lsklocoutdetail.area, '+chr(13)+chr(10)
                 +'        #lsklocoutdetail.cusid,#lsklocoutdetail.cusname,#lsklocoutdetail.shippercusid,#lsklocoutdetail.shippercusname,#lsklocoutdetail.skuname,  '+chr(13)+chr(10)
                 +'        sno=#lskoutloccon.sno,#lsklocoutdetail.ldsno,#lsklocoutdetail.jobnoin,#lsklocoutdetail.snoin,taskdate=null,sizeuom, iscon="T",cusbillno=null,'+chr(13)+chr(10)
                 +'        tagno=#lsklocoutdetail.sealno,  '+chr(13)+chr(10)
                 //+'        manufacturedate=(convert(char(4),year(#lsklocoutdetail.operationdate),102))+".01"+".01"  '+chr(13)+chr(10)
                 +'        #lsklocoutdetail.manufacturedate   '+chr(13)+chr(10)
                 +'   into #lskoutconsku                                           '+chr(13)+chr(10)
                 +'   from #lskoutloccon,#lsklocoutdetail         '+chr(13)+chr(10)
                 +'  where #lskoutloccon.jobno=#lsklocoutdetail.jobno                  '+chr(13)+chr(10)
                 +'    and #lskoutloccon.conno=#lsklocoutdetail.conno              '+chr(13)+chr(10)

                 );
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lskoutconsku set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
                 );
//更新locationoutdetail
   {ExecSql(qryTmp,'  update #lskoutskudetail  '+chr(13)+chr(10)
                 +'     set jobnoin=#lsklocoutdetail.jobnoin,    '+chr(13)+chr(10)
                 +'         snoin=#lsklocoutdetail.snoin,    '+chr(13)+chr(10)
                 +'         ldsnoin=#lsklocoutdetail.ldsnoin    '+chr(13)+chr(10)
                 +'    from #lsklocoutdetail                      '+chr(13)+chr(10)
                 +'   where #lskoutskudetail.jobno=#lsklocoutdetail.jobno '+chr(13)+chr(10)
                 +'     and #lskoutskudetail.sno=#lsklocoutdetail.sno          '+chr(13)+chr(10)
                 +'     and #lskoutskudetail.ldsno=#lsklocoutdetail.ldsno       '+chr(13)+chr(10)
           );
   }
//处理 detailsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=0       '+chr(13)+chr(10)
                 +'   update #lsklocoutdetail set detailsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//真实的塞入数据
   _ADOConnection.Starttransaction;
   try
//塞locoutskudetail
      ExecSql(qryTmp,' insert into locoutskudetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      jobnoin, snoin, ldsnoin, detailsnoin,        '+chr(13)+chr(10)
                    +'      skuid, skuname, sealno, conno,        '+chr(13)+chr(10)
                    +'      quantity, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,manufacturedate   '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      jobnoin, snoin , ldsnoin, detailsnoin,        '+chr(13)+chr(10)
                    +'      skuid, skuname, sealno, conno, '+chr(13)+chr(10)
                    +'      quantity, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,           '+chr(13)+chr(10)
                    //+'      manufacturedate=(convert(char(4),year(operationdate),102))+".01"+".01" '+chr(13)+chr(10)
                    +'      #lsklocoutdetail.manufacturedate '+chr(13)+chr(10)
                    +' from #lsklocoutdetail         '+chr(13)+chr(10)
                    +' ');
      opensql(datatmp.qrytmp2,'select num=count(1) from #lskoutskudetail');

    KMessageDlg('"'+datatmp.qrytmp2.FieldByName('num').asstring+'"！',mtWarning,[mbOk],0);
//塞locationoutdetail
      ExecSql(qryTmp,' insert into locationoutdetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'      jobnoin, snoin, ldsnoin,            '+chr(13)+chr(10)
                    +'      ldsnoinf, locid, locname, operationtype,     '+chr(13)+chr(10)
                    +'      skuid, skuname, lotcode, qualityname,          '+chr(13)+chr(10)
                    +'      userid, username, quantityuom, pieceuom,       '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, quantity,       '+chr(13)+chr(10)
                    +'      piece, netweight, grossweight, volume,         '+chr(13)+chr(10)
                    +'      area, cusid, cusname, shippercusid,              '+chr(13)+chr(10)
                    +'      shippercusname, lottracked, price, currcd,         '+chr(13)+chr(10)
                    +'      skucost, operationdate, transferdate,       '+chr(13)+chr(10)
                    +'      taskdate, costuomtype, contwithloca, isbond,             '+chr(13)+chr(10)
                    +'      countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'      snoorder, iuserid, iusername, locationbillno,               '+chr(13)+chr(10)
                    +'      customsno, sizeuom, height, width,                     '+chr(13)+chr(10)
                    +'      depth, costcusid, costcusname, snotask, costcusidout,      '+chr(13)+chr(10)
                    +'      costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'      skucostin,jobnoori, snoori, cusbillno, mainorder,         '+chr(13)+chr(10)
                    +'      shipcusid, shipcusname      '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno,  jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'      jobnoin, snoin, ldsnoin,            '+chr(13)+chr(10)
                    +'      ldsnoinf, locid, locname, operationtype,     '+chr(13)+chr(10)
                    +'      skuid, skuname, lotcode, qualityname,          '+chr(13)+chr(10)
                    +'      userid, username, quantityuom, pieceuom,       '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, quantity,       '+chr(13)+chr(10)
                    +'      piece, netweight, grossweight, volume,         '+chr(13)+chr(10)
                    +'      area, cusid, cusname, shippercusid,              '+chr(13)+chr(10)
                    +'      shippercusname, lottracked, price, currcd,         '+chr(13)+chr(10)
                    +'      skucost, operationdate, operationdate,       '+chr(13)+chr(10)
                    +'      taskdate, costuomtype, contwithloca, isbond,             '+chr(13)+chr(10)
                    +'      countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'      snoorder, iuserid, iusername, locationbillno,               '+chr(13)+chr(10)
                    +'      customsno, sizeuom, height, width,                     '+chr(13)+chr(10)
                    +'      depth, costcusid, costcusname, snotask, costcusidout,      '+chr(13)+chr(10)
                    +'      costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'      skucostin,jobnoori, snoori, cusbillno, mainorder,         '+chr(13)+chr(10)
                    +'      shipcusid, shipcusname      '+chr(13)+chr(10)
                    +' from #lskoutskudetail         '+chr(13)+chr(10)
                    +' ');
//更新locationinitem
      ExecSql(qryTmp,'  update locationoutitem  '+chr(13)+chr(10)
                    +'     set quantity=quantitytask,    '+chr(13)+chr(10)
                    +'         piece=piecetask,    '+chr(13)+chr(10)
                    +'         area=areatask,    '+chr(13)+chr(10)
                    +'         volume=volumetask,    '+chr(13)+chr(10)
                    +'         netweight=netweighttask,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttask,    '+chr(13)+chr(10)
                    +'         transferdate=(select top 1 operationdate from #lskoutskudetail where locationoutitem.jobno=#lskoutskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskoutskudetail where locationoutitem.jobno=#lskoutskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationoutitem.jobno in (select distinct jobno from #lskoutskudetail) '+chr(13)+chr(10)
              );
//更新locationout
      ExecSql(qryTmp,'  update locationout  '+chr(13)+chr(10)
                    +'     set transferdate=(select top 1 operationdate from #lskoutskudetail where locationout.jobno=#lskoutskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskoutskudetail where locationout.jobno=#lskoutskudetail.jobno ),   '+chr(13)+chr(10)
                    +'         quantity=quantitytasked,    '+chr(13)+chr(10)
                    +'         piece=piecetasked,    '+chr(13)+chr(10)
                    +'         area=areatasked,    '+chr(13)+chr(10)
                    +'         volume=volumetasked,    '+chr(13)+chr(10)
                    +'         netweight=netweighttasked,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttasked,    '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationout.jobno in (select distinct jobno from #lskoutskudetail) '+chr(13)+chr(10)
                    );
//更新locationout
      ExecSql(qryTmp,'  update locationoutdetail  '+chr(13)+chr(10)
                    +'     set manufacturedate=item.manufacturedate '+chr(13)+chr(10)
                    +'    from locationoutitem item (nolock)        '+chr(13)+chr(10)
                    +'   where locationoutdetail.jobno=item.jobno         '+chr(13)+chr(10)
                    +'     and locationoutdetail.sno=item.sno             '+chr(13)+chr(10)
                    +'     and locationoutdetail.jobno in (select distinct jobno from #lskoutskudetail) '+chr(13)+chr(10)
                    );
      //LZW20100612 塞箱表
      ExecSql(qryTmp,' delete locationinoutcon '+chr(13)+chr(10)
                    +'  where jobno in (select jobno from #lskoutloccon) '+chr(13)+chr(10)

              );
      //LZW20100612 塞箱表
      execsql(qryTmp1,' insert into locationinoutcon '+chr(13)+chr(10)
                    +'   (  jobno,conno,sno,userid,conquantity,  '+chr(13)+chr(10)
                    +'      username,operationtype,iscon,  '+chr(13)+chr(10)
                    +'      contype,consptype              '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno,conno,sno,userid,conquantity,  '+chr(13)+chr(10)
                    +'      username,operationtype,iscon,  '+chr(13)+chr(10)
                    +'      contype,consptype              '+chr(13)+chr(10)
                    +' from #lskoutloccon         '+chr(13)+chr(10)
                    +' ');

//箱货
      ExecSql(qryTmp,' delete locationinoutconsku '+chr(13)+chr(10)
                    +'  where jobno in (select jobno from #lskoutconsku) '+chr(13)+chr(10)

              );
      execsql(qryTmp1,' insert into locationinoutconsku '+chr(13)+chr(10)
                    +'   ( jobno,skuid,lotcode, '+chr(13)+chr(10)
                    +'        userid,username,              '+chr(13)+chr(10)
                    +'        quantityuom,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
                    +'        quantity,piece,netweight,grossweight,volume,area, '+chr(13)+chr(10)
                    +'        cusid,cusname,shippercusid,shippercusname,skuname,  '+chr(13)+chr(10)
                    +'        sno,ldsno,jobnoin,snoin,taskdate,sizeuom, iscon,cusbillno,'+chr(13)+chr(10)
                    +'        tagno,manufacturedate,qualityname                                 '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +' select jobno,skuid,lotcode, '+chr(13)+chr(10)
                    +'        userid,username,              '+chr(13)+chr(10)
                    +'        quantityuom,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
                    +'        quantity,piece,netweight,grossweight,volume,area, '+chr(13)+chr(10)
                    +'        cusid,cusname,shippercusid,shippercusname,skuname,  '+chr(13)+chr(10)
                    +'        sno,ldsno,jobnoin,snoin,taskdate,sizeuom, iscon,cusbillno,'+chr(13)+chr(10)
                    +'        tagno,(convert(char(10),manufacturedate,102)),qualityname="COMMON"   '+chr(13)+chr(10)
                    +'  from  #lskoutconsku                                        '+chr(13)+chr(10)
                    +' ');
      //更新对应进仓信息

      BarCode_kspLocationOutDetail;
      BarCode_kspLocOutskuDetail;
      BarCode_kspLocationOutItem;
      _ADOConnection.Commit;
      kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);
      //lzw20100612更新集装箱表
      OpenSql(qryTmp,'select distinct jobno from  locationinoutcon (nolock) '
                    +' where locationinoutcon.jobno in (select distinct jobno from #lskoutloccon) '
             );
      qryTmp.First;
      while not qryTmp.Eof do
      begin
         workConType(qryTmp.fieldbyname('jobno').asstring);
         qryTmp.Next;
      end;
   except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);
      execsql(qryTmp,'drop table  #lsklocoutdetail       '
                    +'drop table  #lskoutskudetail       '
                    +'drop table  #lskoutdetailSum   '
                    +'drop table  #lskoutcon   '
                    +'drop table  #lskoutloccon   '
                    +'drop table  #lskconsku   '
                    +'drop table  #lskoutlocconsku   '
                    //lzw20100818
                    +'drop table  #lskcustomsno   '
                    +'drop table  #lsklocoutitem   '
                    +'drop table  #lskwareorder     '
                    +'drop table  #lskoutitemSum    '
                    +'drop table  #lskoutitem    ');
      Exit;
   end;
end;

procedure TfrmRFintxt.btnAppendClick(Sender: TObject);
var
   lstList,sltFpTmp:TStringList;
   F: TextFile;
   S,StrList,Strsql: string;
   I,J,K:Integer;
   intsno,maxldsno:integer;
   //进出仓标志；进仓单号；报关单号；批次；集装箱号；净重；毛重；进仓日期；库位；箱号
   stroperationtype,strlocationbillno,strcustomsno,strlotcode,strlennum:string;
   strconno,strnetweight,strgrossweight,stroperationdate,strlocname,strxh:string;
   Str_1,Str_2,Str_3,Str_4,Str_5:string;
begin
   if qryBarCode.RecordCount=0 then
   begin
      KMessageDlg('没有商品信息，不用追加！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      exit;
   end;

   if edtPath.Text = '' then
   begin
      KMessageDlg('请输入数据源路径和文件！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      exit;
   end else
   if compareText(ExtractFileExt(edtPath.Text),'.txt') <> 0 then
   begin
      KMessageDlg('文件必须为文本文件类型！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      Exit;
   end;
   if edtPath.Text=oldfilename then
   begin
      KMessageDlg('不允许重复导相同的名称的文件',mtWarning,[mbOk],0);
      edtPath.Text:= '';
      edtPath.SetFocus;
      Exit;
   end;  
   btnInputCost.Enabled:=False;
   btnCancel.Enabled:=False;

   try
   //把文本文件内容读取到list中。
     lstList:=TstringList.Create;
     sltFpTmp:=Tstringlist.create;
     //读文件用的
     AssignFile(F,edtPath.Text);
     Reset(F);
     while not Eof(F) do
     begin
        Readln(F,S);
        lstList.Add(S);
     end;
     CloseFile(F);

     //lzw20100507
     if lstList.count=0 then
     begin
        KMessageDlg('文件内容为空,请确认导入的文件！',mtWarning,[mbOk],0);
        edtPath.SetFocus;
        exit;
     end;
     //**************开始解析文本内容***********//

     i:=0;
     while i < lstList.Count  do
     begin
        Application.ProcessMessages;
        pgbClear.Stepit;
        //inc(i);
        StrList:= trim(Lstlist.Strings[i]);

        if StrList='' then break;
        breakStr(StrList,';',false,false,false,sltFpTmp);
        if strtype='IN' then
        begin
           //业务类型
           stroperationtype:=sltFptmp.strings[0];
           //locationbillno仓单号
           strlocationbillno:= sltFptmp.strings[1];
           //customsno报关单号(当前模版为空)
           strcustomsno:=sltFptmp.strings[2];
           //lotcode批次
           strlotcode:=sltFptmp.strings[3];
           //conno柜号
           strconno:=sltFptmp.strings[4];
           //netweight净重
           strnetweight:=sltFptmp.strings[5];
           //grossweight毛重
           strgrossweight:=sltFptmp.strings[6];
           //customsno进仓日期
           Stroperationdate:=sltFptmp.strings[7];
           //locname库位
           strlocname:=sltFptmp.strings[8];
           //xh箱号
           strxh:=sltFptmp.strings[9];
        end else
        if strtype='OUT' then
        begin
           //业务类型
           stroperationtype:=sltFptmp.strings[0];
           //locationbillno仓单号
           strlocationbillno:= sltFptmp.strings[1];
           //customsno报关单号(当前模版为空)
           strcustomsno:=sltFptmp.strings[2];
           //conno柜号
           strconno:=sltFptmp.strings[3];
           //customsno出仓日期
           Stroperationdate:=sltFptmp.strings[4];
           //xh箱号
           strxh:=sltFptmp.strings[5];
           opensql(qryTmp,'select * from locinskudetail(nolock) '
                         +' where sealno="'+strxh+'"            '
                         +'   and isnull(quantityremain,0)> 0   '
                  );
           if qryTmp.RecordCount>0 then
           begin
              strnetweight:=FloatToStr(qryTmp.fieldbyname('netweight').asfloat);
              strgrossweight:=FloatToStr(qryTmp.fieldbyname('grossweight').asfloat);
              strlocname:=qryTmp.fieldbyname('locname').AsString;
              //lotcode批次
              strlotcode:=qryTmp.fieldbyname('lotcode').AsString;
           end else
           begin
              KMessagedlg('不存在箱号为"'+strxh+'"的任务信息',mtInformation,[mbOk],0);
              frmrfintxt.close;
              exit;
           end;
        end;

        OpenSql(qryTmp,'select maxldsno=max(ldsno) from #lskOutItem');

        //取出后塞入临时表
        ExecSql(qrytmp,' insert into #lskOutItem '+char(13)+chr(10)
                     +'  (  ldsno,operationtype, locationbillno,customsno,lotcode,conno,  '+char(13)+chr(10)
                     +'  quantity,piece,netweight, grossweight,operationdate,locname,xh)   '+char(13)+chr(10)
                     +'  values                                             '+char(13)+chr(10)
                     +'  (                                                  '+char(13)+chr(10)
                     +'  "'+inttostr(qryTmp.FieldByName('maxldsno').asinteger+1)+'",    '+char(13)+chr(10)
                     +'  "'+Stroperationtype+'",                           '+char(13)+chr(10)
                     +'  "'+Strlocationbillno+'",                           '+char(13)+chr(10)
                     +'  "'+Strcustomsno+'",                                '+char(13)+chr(10)
                     +'  "'+Strlotcode+'",                                  '+char(13)+chr(10)
                     +'  "'+Strconno+'",                                    '+char(13)+chr(10)
                     +'  1,                                                 '+char(13)+chr(10)
                     +'  1,                                                 '+char(13)+chr(10)
                     +'  "'+Strnetweight+'",                                '+char(13)+chr(10)
                     +'  "'+Strgrossweight+'",                              '+char(13)+chr(10)
                     +'  "'+Stroperationdate+'",                            '+char(13)+chr(10)
                     +'  "'+Strlocname+'",                                  '+char(13)+chr(10)
                     +'  "'+Strxh+'"                                        '+char(13)+chr(10)
                     +'  )                                                  '+char(13)+chr(10)
                );
        //处理时间格式
        ExecSql(qryTmp1,' update  #lskOutItem                                    '+char(13)+chr(10)
                       +'    set  operationdate= replace(convert(char(10),convert(datetime,operationdate),102),"-",".")   '+char(13)+chr(10)
                );
        StrList:='';
        i:=i+1;
        pgbClear.StepBy(1);
        continue;
     end;


     pgbClear.Visible:=False;

     opensql(qryBarCode,' select type=case when operationtype="1" then "进仓" else "出仓" end,* '
                       +'   from #lskOutItem ');

     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     KMessagedlg('数据追加完成',mtInformation,[mbOk],0);
     btnCheck.Enabled:=True;
     btnCheck.SetFocus;
     //lzw20100513
     oldfilename:= edtPath.Text;
     edtPath.Text:= '';
     edtPath.SetFocus;
     
   except
     Application.ProcessMessages;
     KShowmessage('文件无法被正确读取！');
     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     Exit;
   end;
end;

end.


