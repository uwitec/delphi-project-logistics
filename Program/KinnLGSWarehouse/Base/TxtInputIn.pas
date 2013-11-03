unit TxtInPutIn;

interface

uses
  Windows, Messages,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls,DBTables,Db,DBCtrls,libproc,GMSLabel,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  KBitBtn, KGroupBox,SLV, ComCtrls,KSText, frstatus, ADODB, dxfProgressBar,
  DBClient, KDataSetProvider, dxPageControl, dxDBTLCl, dxGrClms, dxDBGrid,
  dxTL, dxDBCtrl, Menus, KinPickEdit ;


type
  TfrmTxtInPutIn = class(TForm)
    qryTmp: TKADOQuery;
    qryInputCost: TKADOQuery;
    OpenDialog1: TOpenDialog;
    conMtf: TADOConnection;
    AqryMtf: TADOQuery;
    qryLocationINOUTDetail: TKADOQuery;
    btnCancel: TKBitBtn;
    btnCheck: TKBitBtn;
    btnOK: TKBitBtn;
    dtsInputCost: TDataSource;
    udsInputCost: TKadoUpdateSql;
    udsLocationINOUTDetail: TKadoUpdateSql;
    qryTmp1: TKADOQuery;
    dtsLocationINOUTDetail: TDataSource;
    btnPreview: TKBitBtn;
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
    SNO: TdxDBGridColumn;
    thechar_1: TdxDBGridColumn;
    thechar_2: TdxDBGridColumn;
    thechar_3: TdxDBGridColumn;
    thechar_4: TdxDBGridColumn;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    edtcustomerno: TdxEdit;
    edtskuspec: TdxEdit;
    edtpiecepro: TdxEdit;
    dxEdit1: TdxEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    dxEdit2: TdxEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    dxEdit3: TdxEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    dxEdit4: TdxEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    dxEdit5: TdxEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    dxEdit6: TdxEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtCostCus: TdxButtonEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtIUser: TdxButtonEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGetCostClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure grdBarCodeChangeNodeEx(Sender: TObject);
    procedure qryInputCostAfterPost(DataSet: TDataSet);
    procedure qryInputCostBeforePost(DataSet: TDataSet);
    procedure btnCheckClick(Sender: TObject);
    procedure grdLocationINOUTEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusExit(Sender: TObject);
    procedure edtIUserButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtIUserExit(Sender: TObject);
  private
    { Private declarations }

    strtype:string;
    strPath,TxtName :String;
    StrName:String;
    maxsno:integer;
    Deleted,Checked:Boolean;
    procedure CopyTxtDataToSQLServer(sss: TStringList);
    procedure grdLocationINOUTDetaildxBeforeInsert;
    procedure CheckIn;//进仓条码的校验
    procedure CheckOut;//出仓条码的校验
    procedure CheckMOV;//移仓条码的校验
    procedure OKIn; //进仓数据导入
    procedure OKOut; //出仓数据导入
    procedure OKMOV; //进仓数据导入

  public
    { Public declarations }
    Year,Month,Day:word;
    function GetLocationBillNO:String;

  end;

procedure WorkTxtInPutIn(pstrtype:string);

var
  frmTxtInPutIn: TfrmTxtInPutIn;

implementation

{$R *.DFM}
uses datas,kindlg,libUser,libbb,ShellAPI,ZoomTxt,libuserPub, datasTmp,GetDllPub;

procedure WorkTxtInPutIn(pstrtype:string);
begin
   {防止程序被重复执行}
   Application.CreateForm(TfrmTxtInPutIn,frmTxtInPutIn);
   with frmTxtInPutIn do
   begin
      if _StrSysCus='SZWY' then
      begin
         edtCostCus.TextField:='00000000000000000007';
         edtCostCus.Text:='江苏住友';
         edtIUser.TextField:=_Userid;
         edtIUser.Text:=_Username;
      end;
   
      strtype:=pstrtype;
      Deleted:=false;
      Checked:=false;
      ShowModal;
      Free;
   end;
end;

procedure TfrmTxtInPutIn.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmTxtInPutIn.FormDestroy(Sender: TObject);
begin
   frmTxtInPutIn:=nil;
end;

procedure TfrmTxtInPutIn.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTxtInPutIn.btnGetCostClick(Sender: TObject);
var
   lstList:TStringList;
   F: TextFile;
   S,StrList,Strsql: string;
   I,J,K:Integer;
   intsno:integer;
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
   end else
   if edtCostCus.Text='' then
   begin
      KMessageDlg('请先挑选费用关系人！',mtWarning,[mbOK],0);
      edtCostCus.SetFocus;
      Exit;
   end;
   
   btnInputCost.Enabled:=False;
   btnCancel.Enabled:=False;

   try
   //把文本文件内容读取到list中。
     lstList:=TstringList.Create;
     //读文件用的
     AssignFile(F,edtPath.Text);
     Reset(F);
     while not Eof(F) do
     begin
        Readln(F,S);
        lstList.Add(S);
     end;
     CloseFile(F);

  //**************开始解析文本内容***********//
   //入库指示日   第7行
     StrList:=trim(Lstlist.Strings[6]);
     edtskuspec.text:=trim(copy(StrList,length(StrList)-9,10));
   //移动指示书番号   第9行
     StrList:=Lstlist.Strings[8];
     I:=pos('*',StrList);
     delete(StrList,1,I);
     I:=pos('*',StrList);
     edtcustomerno.text:=copy(StrList,1,I-1);
     //最终收货客户 第14行
     StrList:=trim(Lstlist.Strings[13]);
     I:=pos('户:',StrList);
     dxEdit6.Text:=trim(copy(StrList,I+6,length(StrList)-I));
     //市场区分  第17行
     StrList:=trim(Lstlist.Strings[16]);
     I:=pos('分:',StrList);
     edtpiecepro.Text:=trim(copy(StrList,I+5,length(StrList)-I));   //市场区分
     //运输工具吨位  第18行
     StrList:=trim(Lstlist.Strings[17]);
     I:=pos('位:',StrList);
     J:=pos('式:',StrList);
     dxEdit5.Text:=trim(copy(StrList,I+6,J-I-17));   //运输工具吨位
     //发货地点   第16行
     StrList:=trim(Lstlist.Strings[15]);
     I:=pos('发货地点:',StrList);
     dxEdit1.text:=trim(copy(StrList,I+13,length(StrList)-I));       //发货地点
     //运输方式  第18行
     StrList:=trim(Lstlist.Strings[17]);
     I:=pos('式:',StrList);
     dxEdit2.text:=trim(copy(StrList,I+5,length(StrList)-I));       //运输方式
     //最终交货地点    第16行
     StrList:=trim(Lstlist.Strings[15]);
     I:=pos('点:',StrList);
     J:=pos('发货地点:',StrList);
     dxEdit4.Text:=trim(copy(StrList,I+6,J-I-9));
     //最终收货客户    第14行
     StrList:=trim(Lstlist.Strings[13]);
     I:=pos('户:',StrList);
     dxEdit6.Text:=trim(copy(StrList,I+6,length(StrList)-I-1));


//处理商品信息入临时表 从第25行开始
     qryTmp.Close;
     qryTmp.sql.clear;
     strsql:='  if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
            +'     where id=object_id("tempdb..#lskInItem") and sysstat & 0xf=3) '+chr(13)+chr(10)
            +'   drop table #lskInItem '+chr(13)+chr(10)
            +' create table #lskInItem '+chr(13)+chr(10)
            +' ( '+chr(13)+chr(10)
            +'   sno int null,  '+chr(13)+chr(10)
            +'   thechar_1 varchar(20) null, '+chr(13)+chr(10)
            +'   thechar_2 varchar(30) null, '+chr(13)+chr(10)
            +'   thechar_3 varchar(5) null, '+chr(13)+chr(10)
            +'   thechar_4 int null  '+chr(13)+chr(10)
            +'  )'+chr(13)+chr(10);
     qryTmp.sql.add(strsql);
     qryTmp.ExecSql;

     intsno:=1;
     I:=24;
     StrList:='';
     while (pos('发货',StrList)=0) do
     begin
        StrList:=trim(Lstlist.Strings[I]);
//移动指示号
        J:=pos('	',StrList);
        Str_1:=copy(StrList,1,J-1);
{//定单号
        delete(StrList,1,J);   //删除出荷指示号
        StrList:=trim(StrList);
        J:=pos('	',StrList);
        Str_2:=copy(StrList,1,J-1);
//订单行号
        delete(StrList,1,J);   //删除定单号
        StrList:=trim(StrList);
        J:=pos('	',StrList);
        Str_3:=copy(StrList,1,J-1);     }
//库存件代码
        delete(StrList,1,J);   //删除移动指示号
        StrList:=trim(StrList);
        J:=pos('	',StrList);
        Str_2:=copy(StrList,1,J-1);
//库存件规格
        delete(StrList,1,J);   //删除库存件代码
        StrList:=trim(StrList);
        J:=pos('	',StrList);
        Str_3:=copy(StrList,1,J-1);

//移动指示数量
        delete(StrList,1,J);   //删除库存件规格
        StrList:=trim(StrList);
        J:=pos('	',StrList);
        Str_4:=trim(copy(StrList,J,length(StrList)-J+1));     //注意，与前面的不一样，从最后反算

//取出后塞入临时表
        ExecSql(qrytmp,' insert into #lskInItem '+char(13)+chr(10)
                     +'  (  sno, thechar_1,thechar_2,thechar_3,thechar_4 )  '+char(13)+chr(10)
                     +'  values             '+char(13)+chr(10)
                     +'  (                   '+char(13)+chr(10)
                     +'  '+inttostr(intsno)+',        '+char(13)+chr(10)
                     +'  "'+Str_1+'",        '+char(13)+chr(10)
                     +'  "'+Str_2+'",        '+char(13)+chr(10)
                     +'  "'+Str_3+'",        '+char(13)+chr(10)
                     +'  "'+Str_4+'"        '+char(13)+chr(10)
                     +'  )                   '+char(13)+chr(10)
                );

//循环
        intsno:=intsno+1;
        I:=I+2;
        StrList:=trim(Lstlist.Strings[I]);
     end;
     opensql(qryBarCode,' select * from  #lskInItem ');

     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     KMessagedlg('数据预览完成',mtInformation,[mbOk],0);
     btnCheck.Enabled:=True;
     btnCheck.SetFocus;
   except
     Application.ProcessMessages;
     KShowmessage('文件无法被正确读取！');
     btnInputCost.Enabled:=True;
     btnCancel.Enabled:=True;
     Exit;
   end;
   grdBarCode.DataSource:=dtsBarCode;
end;

procedure TfrmTxtInPutIn.CopyTxtDataToSQLServer(sss: TStringList);
var
   strSql,s: string;
   intCount,j,I: integer;
   sltfp:Tstringlist;
   sltfptmp:Tstringlist;
   intAddstart:integer;
begin
   sltFp:=Tstringlist.create;
   sltFpTmp:=Tstringlist.create;

   qryTmp.Close;
   qryTmp.sql.clear;
   strsql:='  if exists(select * from tempdb..sysobjects '+ chr(13)+chr(10)         //指令主库
          +'     where id=object_id("tempdb..#lskBarCode") and sysstat & 0xf=3) '+chr(13)+chr(10)
          +'   drop table #lskBarCode '+chr(13)+chr(10)
          +' create table #lskBarCode '+chr(13)+chr(10)
          +' ( '+chr(13)+chr(10)
          +'   sno bigint, '+chr(13)+chr(10)
          +'   locationbillno varchar(20) null, '+chr(13)+chr(10)
          +'   skuno varchar(30) null, '+chr(13)+chr(10)
          +'   sealno varchar(30) null, '+chr(13)+chr(10)
          +'   quantity int null,  '+chr(13)+chr(10)
          +'   locno varchar(20) null ,  '+chr(13)+chr(10)
          +'   thedate datetime null '+chr(13)+chr(10)
          +'  )'+chr(13)+chr(10);
   qryTmp.sql.add(strsql);
   qryTmp.ExecSql;
   qryTmp1.Close;
   qryTmp1.SQL.Clear;
   qryTmp1.SQL.Add(' insert into #lskBarCode '
                   +' ( sno,locationbillno,skuno,sealno,quantity,locno,thedate   )'
                   +' Values '
                   +' ( :sno,:locationbillno,:skuno,:sealno,:quantity,:locno,:thedate)');
   qryTmp1.Prepare;
   intCount := 0;
   i := -1;
   intAddstart:=0;

   pgbClear.Visible:=True;
   pgbClear.Position:=0;
   pgbClear.Min:=0;
   pgbClear.Max:=sss.count;

   while i < sss.Count-1  do
   begin
      Application.ProcessMessages;
      pgbClear.Stepit;
      inc(i);
      s := trim(sss.Strings[i]);

      if s='' then break;
      breakStr(s,';',false,false,false,sltFpTmp);
      intaddstart:=1;
      qryTmp1.ParamByName('sno').AsInteger      := i+1;
      if (strtype='IN')or(strtype='MOV') then    //进仓条码
      begin
         qryTmp1.ParamByName('locationbillno').AsString   := sltFptmp.strings[0];
         qryTmp1.ParamByName('skuno').AsString   := sltFptmp.strings[1];
         qryTmp1.ParamByName('sealno').AsString   := sltFptmp.strings[2];
         qryTmp1.ParamByName('quantity').AsInteger   := StrToInt(sltFptmp.strings[3]);
         qryTmp1.ParamByName('locno').AsString   := sltFptmp.strings[4];
         qryTmp1.ParamByName('thedate').AsDateTime   := StrToDateTime(sltFptmp.strings[5]);
      end else
      if strtype='OUT' then   //出仓条码
      begin
         qryTmp1.ParamByName('locationbillno').AsString   := sltFptmp.strings[0];
         qryTmp1.ParamByName('skuno').AsString   := sltFptmp.strings[1];
         qryTmp1.ParamByName('sealno').AsString   := sltFptmp.strings[2];
         qryTmp1.ParamByName('quantity').AsInteger   := StrToInt(sltFptmp.strings[3]);
         qryTmp1.ParamByName('locno').AsString   := '';
         qryTmp1.ParamByName('thedate').AsDateTime   := StrToDateTime(sltFptmp.strings[4]);
      end;
      qryTmp1.execsql;
      pgbClear.StepBy(1);
      continue;
   end;
   pgbClear.Visible:=False;
end;

procedure TfrmTxtInPutIn.FormCreate(Sender: TObject);
begin
//   height:=403;
//   width:=769;
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

procedure TfrmTxtInPutIn.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
Var
   IntLenth:integer;
begin
   if OpenDialog1.Execute then
   begin
    //  if uppercase(strInOut)='I' then
   //   begin
         strPath:=ExtractFileDir(OpenDialog1.FileName);
         TxtName:=ExtractFileName(OpenDialog1.FileName);
         edtPath.Text:=OpenDialog1.FileName;
         IntLenth:=length(TxtName);
         StrName:=copy(TxtName,1,(intlenth-4));
   //   end else
    //     edtPath.Text:=ExtractFileDir(OpenDialog1.FileName);
   end;
end;

procedure TfrmTxtInPutIn.grdLocationINOUTDetaildxBeforeInsert;
begin
  qryInputCost.fieldbyname('SNO').Asinteger:=-1;
end;

procedure TfrmTxtInPutIn.grdBarCodeChangeNodeEx(
  Sender: TObject);
begin
  if grdbarcode.Datalink.DataSet.State = dsInsert then
  begin
    grdLocationINOUTDetaildxBeforeInsert;
  end;
end;

procedure TfrmTxtInPutIn.qryInputCostAfterPost(DataSet: TDataSet);
begin
  if  (qryInputCost.fieldbyname('OrderId').asstring='') and (qryInputCost.fieldbyname('PlanId').asstring='') then
  begin
    Maxsno:=Maxsno-1;
    qryInputCost.Delete;
  end;
end;

procedure TfrmTxtInPutIn.qryInputCostBeforePost(DataSet: TDataSet);
begin
   if grdBarCode.Datalink.DataSet.State = dsInsert then
   begin
     Maxsno:=Maxsno+1;
     qryInputCost.FieldByName('SNO').asinteger:=Maxsno;
    // Deleted:=true;
   end;
end;

procedure TfrmTxtInPutIn.btnCheckClick(Sender: TObject);
var
   Sremark,strsql,strPlanID:string;
   OkFlag:Boolean;
begin
   droplsk('#lskBarCodeCheck');
   droplsk('#lskBarCodeLocinOut');
   droplsk('#lskBarCodeCheckSum');
   droplsk('#lskBarCodeCheckSumitem');
   droplsk('#lskBarCodeLocinOutInfo');

   if strtype='IN' then
   begin
      CheckIn;
   end else
   if strtype='OUT' then
   begin
      CheckOut;
   end else
   if strtype='MOV' then
   begin
      CheckMOV;
   end;
end;

procedure TfrmTxtInPutIn.grdLocationINOUTEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=false;
end;

procedure TfrmTxtInPutIn.btnOKClick(Sender: TObject);
var
   strSqlQ,strSqlA:string;
   FailFlag:boolean;
begin
   OpenSql(qryTmp,'  select num=count(1) from #lskBarCodeCheck where isnull(remark,"")<>"" ' );
   if qryTmp.FieldByName('num').AsInteger<>0 then
   begin
      KMessageDlg('存在校验不通过的数据，请核对！',mtInformation,[mbOk],0);
      Exit;
   end;

   if Kmessagedlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mryes then exit;
   droplsk('#lskBCDetail');
   droplsk('#lskBCDetailDetail');

   if strtype='IN' then
   begin
      OKIn;
   end else
   if strtype='OUT' then
   begin
      OKOut;
   end else
   if strtype='MOV' then
   begin
      OKMOV;
   end;

   btnCancel.SetFocus;
   btnOK.Enabled:=False;
end;

procedure TfrmTxtInPutIn.btnPreviewClick(Sender: TObject);
var
   strFile:String;
   sltEdi,sltSave:TStringList;
begin
   if edtPath.Text='' then
   begin
      KMessageDlg('请输入源文件路径！',mtWarning,[mbOk],0);
      edtPath.SetFocus;
      exit;
   end;
   sltEdi:=TStringList.Create;
   sltSave:=TStringList.Create;
   try
      strFile:=trim(edtPath.Text);
      if FileExists(strFile) then
      begin
         sltEdi.LoadFromFile(strFile);
         if Trim(sltEdi.Text)<>'' then
         begin
            sltSave.Clear;
            sltSave.Text:=WorkZoomTxt(Trim(sltEdi.Text),False);
            if (Trim(sltSave.Text)<>'') and (Trim(sltSave.Text)<>Trim(sltEdi.Text)) then
               sltSave.SaveToFile(strFile);
         end;
      end else
          KMessageDlg('文件'+strFile+'不存在！',mtWarning,[mbOk],0);
   finally
      FreeAndNil(sltEdi);
      FreeAndNil(sltSave);
   end;
end;

procedure TfrmTxtInPutIn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

//进仓条码的校验
procedure TfrmTxtInPutIn.CheckIn;
var
   strCreateID,strbillno,strskuid,strskuname,
   strskuspec,strcusid,strcusname,stralternateskuname :string;
begin
//校验是否存在对应商品
   strbillno:='';
   strskuid:='';
   strskuname:='';
   strskuspec:='';
   OpenSql(qryTmp,' select 1 from locationin (nolock)   '+chr(13)+chr(10)
                 +'  where cusbillno="'+edtcustomerno.Text+'"  '+chr(13)+chr(10)
                 );
   if qryTmp.RecordCount>0 then
   begin
      KMessageDlg('该移动指示书番号已导入,请确认！',mtWarning,[mbOK],0);
      Exit;
   end ;
   OpenSql(qryTmp,' select 1  '+chr(13)+chr(10)
                 +'   from #lskInItem item '+chr(13)+chr(10)
                 +'  where 1=1        '+chr(13)+chr(10)
                 +'    and not exists (select 1 from sku   '+chr(13)+chr(10)
                 +'                     where sku.customerno=item.thechar_2   '+chr(13)+chr(10)
                 +'                       and sku.skumodel=item.thechar_3  '+chr(13)+chr(10)
                 +'                       and isnull(IsDetail,"F")<>"F"'
                 +'                    )  '+chr(13)+chr(10)
                 );
   if qryTmp.RecordCount>0 then
   begin
      KMessageDlg('导入文件中存在商品资料中不存在的商品,请确认！',mtWarning,[mbOK],0);
      Exit;
   end else
   begin
      strbillno:=GetLocationBillNO;
      strCreateID:=genJobno('LI',strbillno);

     _ADOConnection.Starttransaction;
      try
         ExecSql(qryTmp,'insert into locationin                                                       '+chr(13)+chr(10)
                         +'       (jobno, operationtype,userid, username,iuserid, iusername,            '+chr(13)+chr(10)
                         +'        createname, createdate,taskdate,locationbillno,cusbillno,             '+chr(13)+chr(10)
                         +'       skucostclasscd,taskiscomplete,warerentcounttype,warerentcounttypeout,  '+chr(13)+chr(10)
                         +'       costcusid,costcusname,cusid,cusname,Shippercusid,ShippercusName,       '+chr(13)+chr(10)
                         +'       contwithloca, lottracked, countrent,countrentout, remark,shipcusname) '+chr(13)+chr(10)
                         +'VALUES( "'+strCreateID+'",1,"'+edtIUser.TextField+'","'+edtIUser.Text+'","'+edtIUser.TextField+'","'+edtIUser.Text+'",   '+chr(13)+chr(10)
                         +'       "'+_loginname+'","'+datetostr(GetServerDate)+'","'+edtskuspec.Text+'","'+strbillno+'","'+edtcustomerno.Text+'",    '+chr(13)+chr(10)
                         +'       "COMMON","F","IR","IR",  '+chr(13)+chr(10)
                         +'       "'+edtCostCus.TextField+'","'+edtCostCus.Text+'","'+edtCostCus.TextField+'","'+edtCostCus.Text+'","'+edtCostCus.TextField+'","'+edtCostCus.Text+'",     '+chr(13)+chr(10)
                         +'       "F","F","T","T","'+dxEdit5.Text+'","'+dxEdit1.Text+'")                '+chr(13)+chr(10)
                          );
         qryBarCode.First;
         while not qryBarCode.Eof do
         begin
            OpenSql(qryTmp1,'select top 1 skuid,skuname,skuspec,alternateskuname from sku (nolock) where customerno="'+qryBarCode.fieldbyname('thechar_2').AsString+'"');
            strskuid:=qryTmp1.fieldbyname('skuid').AsString;
            strskuname:=qryTmp1.fieldbyname('skuname').AsString;
            strskuspec:=qryTmp1.fieldbyname('skuspec').AsString;
            stralternateskuname:=qryTmp1.fieldbyname('alternateskuname').AsString;

            ExecSql(qryTmp,'insert into locationinitem                                                                            '+chr(13)+chr(10)
                            +'         (jobno,operationtype,userid, username,iuserid, iusername,                                  '+chr(13)+chr(10)
                            +'          locationbillno,cusbillno,skuid,skuname,jobnoinf,sno,snoinf,ldsnoinf,qualityname,          '+chr(13)+chr(10)
                            +'          warerentcounttype,warerentcounttypeout,                                                   '+chr(13)+chr(10)
                            +'          costcusid,costcusname,cusid,cusname, shipcusname,Shippercusid,ShippercusName,             '+chr(13)+chr(10)
                            +'          contwithloca, lottracked, countrent,countrentout, remark,                                 '+chr(13)+chr(10)
                            +'          quantitytask,quantityuom,piecetask,pieceuom,                                              '+chr(13)+chr(10)
                            +'          skumodel,conno,skuspec,customerno,quantityshort                                          '+chr(13)+chr(10)
                            +'          )                                                                                         '+chr(13)+chr(10)
                            +'VALUES( "'+strCreateID+'",1,"'+edtIUser.TextField+'","'+edtIUser.Text+'",                           '+chr(13)+chr(10)
                            +'       "'+edtIUser.TextField+'","'+edtIUser.Text+'",                                                '+chr(13)+chr(10)
                            +'       "'+strbillno+'","'+edtcustomerno.Text+'","'+strskuid+'","'+strskuname+'","'+strCreateID+'",  '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('sno').AsString+'",                                                '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('sno').AsString+'","-11","正品",                                   '+chr(13)+chr(10)
                            +'       "IR","IR",                                                                                   '+chr(13)+chr(10)
                            +'       "'+edtCostCus.TextField+'","'+edtCostCus.Text+'","'+edtCostCus.TextField+'",                 '+chr(13)+chr(10)
                            +'       "'+edtCostCus.Text+'","'+dxEdit1.Text+'","'+edtCostCus.TextField+'","'+edtCostCus.Text+'",   '+chr(13)+chr(10)
                            +'       "F","F","T","T",NULL,                                                                        '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('thechar_4').AsString+'" ,"条",                                    '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('thechar_4').AsString+'" ,"条",                                    '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('thechar_3').AsString+'",                                          '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('thechar_1').AsString+'",                                          '+chr(13)+chr(10)
                            +'       "'+strskuspec+'",                                                                            '+chr(13)+chr(10)
                            +'       "'+qryBarCode.fieldbyname('thechar_2').AsString+'",                                          '+chr(13)+chr(10)
                            +'       "'+stralternateskuname+'"                                                                    '+chr(13)+chr(10)
                            +'        )                                                                                           '+chr(13)+chr(10)
                            );
            qryBarCode.Next;
         end;
         _ADOConnection.Commit;
      except
         _ADOConnection.rollback;
         raise;
         Exit;
      end;
   end;
   kMessageDlg('导入成功！', mtInformation, [mbOK], 0);
   edtPath.Text:='';
   edtcustomerno.Text:='';
   edtskuspec.Text:='';
   edtpiecepro.Text:='';
   dxEdit1.Text:='';
   dxEdit2.Text:='';
   dxEdit3.Text:='';
   dxEdit4.Text:='';
   dxEdit5.Text:='';
   dxEdit6.Text:='';
   grdBarCode.DataSource:=nil;

   btnCheck.Enabled:=False;
   btnOK.Enabled:=true;
   btnOK.SetFocus;
end;

procedure TfrmTxtInPutIn.CheckOut;
begin
//校验是否存在对应商品、对应任务信息
   ExecSql(qryTmp,' select barcode.sno,barcode.locationbillno,barcode.skuno,  '+chr(13)+chr(10)
                 +'        barcode.sealno,barcode.quantity,barcode.locno,barcode.thedate,   '+chr(13)+chr(10)
                 +'        skuid=sku.skuid,skuname=sku.skuname,    '+chr(13)+chr(10)
//                 +'        locid=location.locid,locname=location.locname,  '+chr(13)+chr(10)
                 +'        jobno=locationOut.jobno,     '+chr(13)+chr(10)
                 +'        quantityin=indetail.quantity,     '+chr(13)+chr(10)
                 +'        quantityremain=isnull(indetail.quantity,0) '+chr(13)+chr(10)
                 +'                      -isnull((select sum(isnull(quantity,0)) '+chr(13)+chr(10)
                 +'                                 from locoutskudetail outdetail '+chr(13)+chr(10)
                 +'                                where indetail.jobno=outdetail.jobnoin   '+chr(13)+chr(10)
                 +'                                  and indetail.sno=outdetail.snoin    '+chr(13)+chr(10)
                 +'                                  and indetail.ldsno=outdetail.ldsnoin    '+chr(13)+chr(10)
                 +'                                  and indetail.detailsno=outdetail.detailsnoin    '+chr(13)+chr(10)
                 +'                        ),0) ,     '+chr(13)+chr(10)
                 +'        jobnoin=indetail.jobno,     '+chr(13)+chr(10)
                 +'        snoin=indetail.sno,     '+chr(13)+chr(10)
                 +'        ldsnoin=indetail.ldsno,     '+chr(13)+chr(10)
                 +'        detailsnoin=indetail.detailsno,     '+chr(13)+chr(10)
                 +'        remark=case when isnull(sku.skuid,"")="" then "无对应商品资料"       '+chr(13)+chr(10)
//                 +'                    when isnull(location.locid,"")="" then "无对应仓位资料"  '+chr(13)+chr(10)
                 +'                    when isnull(locationOut.jobno,"")="" then "无对应任务信息"  '+chr(13)+chr(10)
                 +'                    when isnull(indetail.jobno,"")="" then "无对应进仓资料"  '+chr(13)+chr(10)
                 +'                    else space(50) end   '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheck     '+chr(13)+chr(10)
                 +'   from #lskBarCode barcode      '+chr(13)+chr(10)
                 +'               left join sku (nolock)  '+chr(13)+chr(10)
                 +'                      on sku.customerno=barcode.skuno  '+chr(13)+chr(10)
                 +'                     and sku.isdetail="T"  '+chr(13)+chr(10)
//                 +'               left join location (nolock)  '+chr(13)+chr(10)
//                 +'                      on location.locbarcode=barcode.locno  '+chr(13)+chr(10)
//                 +'                     and location.isdetail="T"  '+chr(13)+chr(10)
                 +'               left join locationOut (nolock)  '+chr(13)+chr(10)
                 +'                      on locationOut.locationbillno=barcode.locationbillno  '+chr(13)+chr(10)
                 +'                     and isnull(locationOut.operationname,"")=""   '+chr(13)+chr(10)
                 +'               left join locinskudetail indetail (nolock)  '+chr(13)+chr(10)
                 +'                      on indetail.serialno=barcode.skuno  '+chr(13)+chr(10)
                 +'                     and indetail.sealno=barcode.sealno  '+chr(13)+chr(10)
                 );
//校验是否有对应进仓库存
   ExecSql(qryTmp,' update #lskBarCodeCheck set remark="对应进仓库存不足"     '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'    and quantity>quantityremain '+chr(13)+chr(10)
           );
//进行数量合计，用于与任务信息对比
   ExecSql(qryTmp,' select jobno,skuid,skuname,skuno,quantity=sum(isnull(quantity,0)),jobnoin,snoin  '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheckSumItem   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'  group by jobno,skuid,skuname,skuno,jobnoin,snoin '+chr(13)+chr(10)
           );
//进行数量合计，用于后面生成detail
   ExecSql(qryTmp,' select jobno,skuid,skuname,skuno,quantity=sum(isnull(quantity,0)),jobnoin,snoin,ldsnoin  '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheckSum  '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'  group by jobno,skuid,skuname,skuno,jobnoin,snoin,ldsnoin '+chr(13)+chr(10)
           );
//取出相关的任务主表范围
   ExecSql(qryTmp,' select distinct jobno  '+chr(13)+chr(10)
                 +'   into #lskBarCodeLocinOut   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSumItem '+chr(13)+chr(10)
           );
//判断条码信息与任务信息中的数量是否一致
   ExecSql(qryTmp,' select #lskBarCodeLocinOut.jobno  '+chr(13)+chr(10)
                 +'   into #lskBarCodeLocinOutInfo   '+chr(13)+chr(10)
                 +'   from #lskBarCodeLocinOut,locationOutitem (nolock) '+chr(13)+chr(10)
                 +'  where #lskBarCodeLocinOut.jobno=locationOutitem.jobno  '+chr(13)+chr(10)
                 +'    and not exists (select 1 from #lskBarCodeCheckSumItem   '+chr(13)+chr(10)
                 +'                     where #lskBarCodeCheckSumItem.jobno=locationOutitem.jobno   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.skuid=locationOutitem.skuid   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.jobnoin=locationOutitem.jobnoin   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.snoin=locationOutitem.snoin   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.quantity=locationOutitem.quantitytask   '+chr(13)+chr(10)
                 +'                    )  '+chr(13)+chr(10)
           );
   ExecSql(qryTmp,' insert into #lskBarCodeLocinOutInfo (jobno)   '+chr(13)+chr(10)
                 +' select distinct jobno                      '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSumItem (nolock) '+chr(13)+chr(10)
                 +'  where not exists (select 1 from locationOutitem (nolock)   '+chr(13)+chr(10)
                 +'                     where #lskBarCodeCheckSumItem.jobno=locationOutitem.jobno   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.skuid=locationOutitem.skuid   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.jobnoin=locationOutitem.jobnoin   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.snoin=locationOutitem.snoin   '+chr(13)+chr(10)
//                 +'                       and #lskBarCodeCheckSum.quantity=locationOutitem.quantitytask   '+chr(13)+chr(10)
                 +'                    )  '+chr(13)+chr(10)
           );
//更新校验信息
   ExecSql(qryTmp,' update #lskBarCodeCheck set remark="与对应任务信息不一致"  '+chr(13)+chr(10)
                 +'   from #lskBarCodeLocinOutInfo '+chr(13)+chr(10)
                 +'  where #lskBarCodeLocinOutInfo.jobno=#lskBarCodeCheck.jobno  '+chr(13)+chr(10)
          );
end;                                                                                                       

procedure TfrmTxtInPutIn.CheckMOV;
begin
//校验是否存在对应商品、对应任务信息
   ExecSql(qryTmp,' select barcode.sno,barcode.locationbillno,barcode.skuno,  '+chr(13)+chr(10)
                 +'        barcode.sealno,barcode.quantity,barcode.locno,barcode.thedate,   '+chr(13)+chr(10)
                 +'        skuid=sku.skuid,skuname=sku.skuname,    '+chr(13)+chr(10)
                 +'        locid=location.locid,locname=location.locname,  '+chr(13)+chr(10)
                //+'        jobnoin=locationin.jobno,     '+chr(13)+chr(10)
                 +'        quantityin=indetail.quantity,     '+chr(13)+chr(10)
                 +'        quantityremain=isnull(indetail.quantity,0) '+chr(13)+chr(10)
                 +'                      -isnull((select sum(isnull(quantity,0)) '+chr(13)+chr(10)
                 +'                                 from locoutskudetail outdetail '+chr(13)+chr(10)
                 +'                                where indetail.jobno=outdetail.jobnoin   '+chr(13)+chr(10)
                 +'                                  and indetail.sno=outdetail.snoin    '+chr(13)+chr(10)
                 +'                                  and indetail.ldsno=outdetail.ldsnoin    '+chr(13)+chr(10)
                 +'                                  and indetail.detailsno=outdetail.detailsnoin    '+chr(13)+chr(10)
                 +'                        ),0) ,     '+chr(13)+chr(10)
                 +'        jobno=locationin.jobno,     '+chr(13)+chr(10)
                 +'        jobnoin=indetail.jobno,     '+chr(13)+chr(10)
                 +'        snoin=indetail.sno,     '+chr(13)+chr(10)
                 +'        ldsnoin=indetail.ldsno,     '+chr(13)+chr(10)
                 +'        detailsnoin=indetail.detailsno,     '+chr(13)+chr(10)
                 +'        remark=case when isnull(sku.skuid,"")="" then "无对应商品资料"       '+chr(13)+chr(10)
                 +'                    when isnull(location.locid,"")="" then "无对应目的仓位资料"  '+chr(13)+chr(10)
                 +'                    when isnull(locationin.jobno,"")="" then "无对应库存资料"  '+chr(13)+chr(10)
                 +'                    when isnull(indetail.jobno,"")="" then "无对应库存明细资料"  '+chr(13)+chr(10)
                 +'                    when isnull(locationin.jobno,"")<>isnull(indetail.jobno,"") then "明细资料与库存资料不对应"  '+chr(13)+chr(10)
                 +'                    else space(50) end   '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheck     '+chr(13)+chr(10)
                 +'   from #lskBarCode barcode      '+chr(13)+chr(10)
                 +'               left join sku (nolock)  '+chr(13)+chr(10)
                 +'                      on sku.customerno=barcode.skuno  '+chr(13)+chr(10)
                 +'                     and sku.isdetail="T"  '+chr(13)+chr(10)
                 +'               left join location (nolock)  '+chr(13)+chr(10)
                 +'                      on location.locbarcode=barcode.locno  '+chr(13)+chr(10)
                 +'                     and location.isdetail="T"  '+chr(13)+chr(10)
                 +'               left join locationin (nolock)  '+chr(13)+chr(10)
                 +'                      on locationin.locationbillno=barcode.locationbillno  '+chr(13)+chr(10)
                 +'                     and isnull(locationin.operationname,"")<>""   '+chr(13)+chr(10)
                 +'               left join locinskudetail indetail (nolock)  '+chr(13)+chr(10)
                 +'                      on indetail.serialno=barcode.skuno  '+chr(13)+chr(10)
                 +'                     and indetail.sealno=barcode.sealno  '+chr(13)+chr(10)
                 );
//校验是否有对应进仓库存
   ExecSql(qryTmp,' update #lskBarCodeCheck set remark="对应库存不足"     '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'    and quantity>quantityremain '+chr(13)+chr(10)
           );
//进行数量合计，用于与进仓实际信息对比
   ExecSql(qryTmp,' select jobnoin,skuid,skuname,skuno,quantity=sum(isnull(quantity,0)),snoin,ldsnoin  '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheckSumItem   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'  group by jobnoin,skuid,skuname,skuno,snoin,ldsnoin '+chr(13)+chr(10)
           );
//进行数量合计，用于后面生成detail
   ExecSql(qryTmp,' select jobnoin,skuid,skuname,skuno,quantity=sum(isnull(quantity,0)),snoin,ldsnoin,locid,locname  '+chr(13)+chr(10)
                 +'   into #lskBarCodeCheckSum  '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck '+chr(13)+chr(10)
                 +'  where isnull(remark,"")=""  '+chr(13)+chr(10)
                 +'  group by jobnoin,skuid,skuname,skuno,snoin,ldsnoin,locid,locname '+chr(13)+chr(10)
           );
//取出相关的任务主表范围
   ExecSql(qryTmp,' select distinct jobnoin  '+chr(13)+chr(10)
                 +'   into #lskBarCodeLocinOut   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSumItem '+chr(13)+chr(10)
           );
//判断条码信息与任务信息中的数量是否一致
   {ExecSql(qryTmp,' select #lskBarCodeLocinOut.jobno  '+chr(13)+chr(10)
                 +'   into #lskBarCodeLocinOutInfo   '+chr(13)+chr(10)
                 +'   from #lskBarCodeLocinOut,locationOutitem (nolock) '+chr(13)+chr(10)
                 +'  where #lskBarCodeLocinOut.jobno=locationOutitem.jobno  '+chr(13)+chr(10)
                 +'    and not exists (select 1 from #lskBarCodeCheckSumItem   '+chr(13)+chr(10)
                 +'                     where #lskBarCodeCheckSumItem.jobno=locationOutitem.jobno   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.skuid=locationOutitem.skuid   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.jobnoin=locationOutitem.jobnoin   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.snoin=locationOutitem.snoin   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.quantity=locationOutitem.quantitytask   '+chr(13)+chr(10)
                 +'                    )  '+chr(13)+chr(10)
           );}
   ExecSql(qryTmp,//' insert into #lskBarCodeLocinOutInfo (jobno)   '+chr(13)+chr(10)
                 ' select distinct jobnoin                      '+chr(13)+chr(10)
                 +'   into #lskBarCodeLocinOutInfo   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSumItem (nolock) '+chr(13)+chr(10)
                 +'  where not exists (select 1 from locationindetail (nolock)   '+chr(13)+chr(10)
                 +'                     where #lskBarCodeCheckSumItem.jobnoin=locationindetail.jobno   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.skuid=locationindetail.skuid   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.snoin=locationindetail.sno   '+chr(13)+chr(10)
                 +'                       and #lskBarCodeCheckSumItem.ldsnoin=locationindetail.ldsno   '+chr(13)+chr(10)
//                 +'                       and #lskBarCodeCheckSum.quantity=locationOutitem.quantitytask   '+chr(13)+chr(10)
                 +'                    )  '+chr(13)+chr(10)
           );
//更新校验信息
   ExecSql(qryTmp,' update #lskBarCodeCheck set remark="与对应库存信息不一致"  '+chr(13)+chr(10)
                 +'   from #lskBarCodeLocinOutInfo '+chr(13)+chr(10)
                 +'  where #lskBarCodeLocinOutInfo.jobnoin=#lskBarCodeCheck.jobnoin  '+chr(13)+chr(10)
          );
end;

procedure TfrmTxtInPutIn.OKIn;
begin
//生成进仓实际临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno=item.jobno, sno=item.sno, ldsno=0, jobnoinf=item.jobnoinf, snoinf=item.snoinf,          '+chr(13)+chr(10)
                 +'        ldsnoinf=0, locid=barcode.locid, locname=barcode.locname, operationtype=1,   '+chr(13)+chr(10)
                 +'        skuid=barcode.skuid, skuname=barcode.skuname, lotcode=item.lotcode, qualityname=item.qualityname,    '+chr(13)+chr(10)
                 +'        userid=item.userid, username=item.username, quantityuom=item.quantityuom, pieceuom=item.pieceuom,         '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volumeuom, areauom=item.areauom, quantity=barcode.quantity,      '+chr(13)+chr(10)
                 +'        piece=item.piecetask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        netweight=item.netweighttask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        grossweight=item.grossweighttask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid,                '+chr(13)+chr(10)
                 +'        shippercusname=item.shippercusname, lottracked=item.lottracked, price=item.price, currcd=item.currcd,           '+chr(13)+chr(10)
                 +'        skucost=item.skucost*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        serialno=barcode.skuno,  '+chr(13)+chr(10)
                 +'        operationdate=(select top 1 thedate from #lskBarCodeCheck where #lskBarCodeCheck.jobno=barcode.jobno and #lskBarCodeCheck.skuid=barcode.skuid order by thedate) , '+chr(13)+chr(10)
//                 transferdate=getdate(),
                 +'        taskdate=item.taskdate, costuomtype=item.costuomtype, contwithloca=item.contwithloca, isbond=item.isbond,            '+chr(13)+chr(10)
                 +'        countrent=item.countrent, countcontcost=item.countcontcost, warerentcounttype=item.warerentcounttype, jobnoorder=item.jobnoorder,   '+chr(13)+chr(10)
                 +'        snoorder=item.snoorder, iuserid=item.iuserid, iusername=item.iusername, locationbillno=item.locationbillno,               '+chr(13)+chr(10)
                 +'        customsno=item.customsno, sizeuom=item.sizeuom, height=item.height, width=item.width,                            '+chr(13)+chr(10)
                 +'        depth=item.depth, costcusid=item.costcusid, costcusname=item.costcusname, snotask=item.sno, costcusidout=item.costcusidout,         '+chr(13)+chr(10)
                 +'        costcusnameout=item.costcusnameout, countrentout=item.countrentout, warerentcounttypeout=item.warerentcounttypeout, pricein=item.pricein,   '+chr(13)+chr(10)
                 +'        skucostin=item.skucostin*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        jobnoori=item.jobnoori, snoori=item.snoori, cusbillno=item.cusbillno, mainorder=item.mainorder,             '+chr(13)+chr(10)
                 +'        shipcusid=item.shipcusid, shipcusname=item.shipcusname                                       '+chr(13)+chr(10)
                 +'   into #lskBCDetail                       '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSum barcode,locationinitem item (nolock)      '+chr(13)+chr(10)
                 +'  where barcode.jobno=item.jobno     '+chr(13)+chr(10)
                 +'    and barcode.skuid=item.skuid     '+chr(13)+chr(10)
                 +'  ');
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetail set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//生成进仓商品明细临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno=detail.jobno, sno=detail.sno, ldsno=detail.ldsno, detailsno=0,      '+chr(13)+chr(10)
                 +'        skuid=detail.skuid, skuname=detail.skuname, serialno=detail.serialno, conno=space(20),     '+chr(13)+chr(10)
                 +'        quantity=barcode.quantity, quantityremain=barcode.quantity, quantityuom=detail.quantityuom,     '+chr(13)+chr(10)
                 +'        sizeuom=detail.sizeuom, height=detail.height, width=detail.width, depth=detail.depth,            '+chr(13)+chr(10)
                 +'        remark=space(20), lotcode=detail.lotcode,                          '+chr(13)+chr(10)
                 +'        qualityname=detail.qualityname, locid=detail.locid, locname=detail.locname, operationdate=barcode.thedate,    '+chr(13)+chr(10)
                 +'        iuserid=detail.iuserid, iusername=detail.iusername, userid=detail.userid, username=detail.username,           '+chr(13)+chr(10)
                 +'        cusid=detail.cusid, cusname=detail.cusname, shippercusid=detail.shippercusid, shippercusname=detail.shippercusname,     '+chr(13)+chr(10)
                 +'        costcusid=detail.costcusid, costcusname=detail.costcusname, pieceuom=detail.pieceuom,                 '+chr(13)+chr(10)
                 +'        weightuom=detail.weightuom, volumeuom=detail.volumeuom, areauom=detail.areauom,       '+chr(13)+chr(10)
                 +'        piece=0,netweight=0, grossweight=0, volume=0, area=0,          '+chr(13)+chr(10)
                 +'        tracktype="TO", sealno=barcode.sealno                  '+chr(13)+chr(10)
                 +'   into #lskBCDetailDetail                       '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck barcode,#lskBCDetail detail(nolock)      '+chr(13)+chr(10)
                 +'  where barcode.jobno=detail.jobno       '+chr(13)+chr(10)
                 +'    and barcode.skuid=detail.skuid         '+chr(13)+chr(10)
                 +'    and barcode.locid=detail.locid         '+chr(13)+chr(10)
                 );
//处理 detailsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetailDetail set detailsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//真实的塞入数据
   _ADOConnection.Starttransaction;
   try
//塞locinskudetail
      ExecSql(qryTmp,' insert into locinskudetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      skuid, skuname, serialno, conno,        '+chr(13)+chr(10)
                    +'      quantity, quantityremain, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,           '+chr(13)+chr(10)
                    +'      tracktype, sealno         '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      skuid, skuname, serialno, conno,        '+chr(13)+chr(10)
                    +'      quantity, quantityremain, quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,               '+chr(13)+chr(10)
                    +'      remark, lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, pieceuom,              '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, piece,           '+chr(13)+chr(10)
                    +'      netweight, grossweight, volume, area,           '+chr(13)+chr(10)
                    +'      tracktype, sealno         '+chr(13)+chr(10)
                    +' from #lskBCDetailDetail         '+chr(13)+chr(10)
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
                    +'      skucost, serialno, operationdate, transferdate,       '+chr(13)+chr(10)
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
                    +'      ldsnoinf, locid, locname, operationtype,     '+chr(13)+chr(10)
                    +'      skuid, skuname, lotcode, qualityname,          '+chr(13)+chr(10)
                    +'      userid, username, quantityuom, pieceuom,       '+chr(13)+chr(10)
                    +'      weightuom, volumeuom, areauom, quantity,       '+chr(13)+chr(10)
                    +'      piece, netweight, grossweight, volume,         '+chr(13)+chr(10)
                    +'      area, cusid, cusname, shippercusid,              '+chr(13)+chr(10)
                    +'      shippercusname, lottracked, price, currcd,         '+chr(13)+chr(10)
                    +'      skucost, serialno, operationdate, operationdate,       '+chr(13)+chr(10)
                    +'      taskdate, costuomtype, contwithloca, isbond,             '+chr(13)+chr(10)
                    +'      countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'      snoorder, iuserid, iusername, locationbillno,               '+chr(13)+chr(10)
                    +'      customsno, sizeuom, height, width,                     '+chr(13)+chr(10)
                    +'      depth, costcusid, costcusname, snotask, costcusidout,      '+chr(13)+chr(10)
                    +'      costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'      skucostin,jobnoori, snoori, cusbillno, mainorder,         '+chr(13)+chr(10)
                    +'      shipcusid, shipcusname      '+chr(13)+chr(10)
                    +' from #lskBCDetail         '+chr(13)+chr(10)
                    +' ');
//更新locationinitem
      ExecSql(qryTmp,'  update locationinitem  '+chr(13)+chr(10)
                    +'     set quantity=quantitytask,    '+chr(13)+chr(10)
                    +'         piece=piecetask,    '+chr(13)+chr(10)
                    +'         area=areatask,    '+chr(13)+chr(10)
                    +'         volume=volumetask,    '+chr(13)+chr(10)
                    +'         netweight=netweighttask,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttask,    '+chr(13)+chr(10)
                    +'         transferdate=(select top 1 operationdate from #lskBCDetail where locationinitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationinitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationinitem.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              );
//更新locationin
      ExecSql(qryTmp,'  update locationin  '+chr(13)+chr(10)
                    +'     set transferdate=(select top 1 operationdate from #lskBCDetail where locationin.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationin.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationin.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              );
//更新对应指令信息
      Execsql(qryTmp,'exec ksp_BarCodeLocationInItem ');
      _ADOConnection.Commit;
      kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);
   except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);
      execsql(qryTmp,'drop table  #lskInItem             ');
      Exit;
   end;
end;

procedure TfrmTxtInPutIn.OKOut;
begin
//生成出仓实际临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno=barcode.jobno, sno=item.sno, ldsno=0, jobnoin=barcode.jobnoin,    '+chr(13)+chr(10)
                 +'        snoin=barcode.snoin, ldsnoin=barcode.ldsnoin, jobnoinf=indetail.jobnoinf, snoinf=indetail.snoinf,    '+chr(13)+chr(10)
                 +'        ldsnoinf=indetail.ldsnoinf, locid=indetail.locid, locname=indetail.locname, operationtype=-1,    '+chr(13)+chr(10)
                 +'        skuid=indetail.skuid, skuname=indetail.skuname, lotcode=item.lotcode, qualityname=item.qualityname,    '+chr(13)+chr(10)
                 +'        userid=item.userid, username=item.username, quantityuom=item.quantityuom, pieceuom=item.pieceuom,    '+chr(13)+chr(10)
                 +'        weightuom=item.weightuom, volumeuom=item.volume, areauom=item.areauom, quantity=barcode.quantity,    '+chr(13)+chr(10)
                 +'        piece=item.piecetask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        netweight=item.netweighttask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        grossweight=item.grossweighttask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        volume=item.volumetask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        area=item.areatask*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        cusid=item.cusid, cusname=item.cusname, shippercusid=item.shippercusid,            '+chr(13)+chr(10)
                 +'        shippercusname=item.shippercusname, lottracked=item.lottracked, price=item.price, currcd=item.currcd,         '+chr(13)+chr(10)
                 +'        skucost=item.skucost*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        serialno=barcode.skuno,  '+chr(13)+chr(10)
                 +'        operationdate=(select top 1 thedate from #lskBarCodeCheck    '+chr(13)+chr(10)
                 +'                        where #lskBarCodeCheck.jobno=barcode.jobno    '+chr(13)+chr(10)
                 +'                          and #lskBarCodeCheck.jobnoin=barcode.jobnoin     '+chr(13)+chr(10)
                 +'                          and #lskBarCodeCheck.snoin=barcode.snoin     '+chr(13)+chr(10)
                 +'                          and #lskBarCodeCheck.ldsnoin=barcode.ldsnoin     '+chr(13)+chr(10)
                 +'                        order by thedate) , '+chr(13)+chr(10)
                 +'        taskdate=item.taskdate, costuomtype=item.costuomtype, contwithloca=item.contwithloca, isbond=item.isbond,                '+chr(13)+chr(10)
                 +'        countrent=item.countrent, countcontcost=item.countcontcost, warerentcounttype=item.warerentcounttype, jobnoorder=item.jobnoorder,         '+chr(13)+chr(10)
                 +'        snoorder=item.snoorder, iuserid=item.iuserid, iusername=item.iusername, locationbillno=item.locationbillno,             '+chr(13)+chr(10)
                 +'        customsno=item.customsno, sizeuom=item.sizeuom, height=item.height, width=item.width,                     '+chr(13)+chr(10)
                 +'        depth=item.depth, costcusid=item.costcusid, costcusname=item.costcusname, snotask=item.sno, costcusidout=item.costcusidout,        '+chr(13)+chr(10)
                 +'        costcusnameout=item.costcusnameout, countrentout=item.countrentout, warerentcounttypeout=item.warerentcounttypeout, pricein=item.pricein,        '+chr(13)+chr(10)
                 +'        skucostin=item.skucostin*(barcode.quantity/item.quantitytask),     '+chr(13)+chr(10)
                 +'        jobnoori=item.jobnoori, snoori=item.snoori, cusbillno=item.cusbillno,     '+chr(13)+chr(10)
                 +'        mainorder=item.mainorder, locationbillnoin=item.locationbillnoin, customsnoin=item.customsnoin, cusbillnoin=item.cusbillnoin,        '+chr(13)+chr(10)
                 +'        mainorderin=item.mainorderin, shipcusid=item.shipcusid, shipcusname=item.shipcusname, isvalueadd="F"         '+chr(13)+chr(10)
                 +'   into #lskBCDetail   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSum barcode,locationoutitem item (nolock),locationindetail indetail (nolock)   '+chr(13)+chr(10)
                 +'  where barcode.jobno=item.jobno    '+chr(13)+chr(10)
                 +'    and barcode.jobnoin=item.jobnoin    '+chr(13)+chr(10)
                 +'    and barcode.snoin=item.snoin    '+chr(13)+chr(10)
                 +'    and barcode.jobnoin=indetail.jobno    '+chr(13)+chr(10)
                 +'    and barcode.snoin=indetail.sno    '+chr(13)+chr(10)
                 +'    and barcode.ldsnoin=indetail.ldsno    '+chr(13)+chr(10)
           );
//处理 ldsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetail set ldsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );

//生成出仓商品明细临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno=barcode.jobno, sno=detail.sno, ldsno=detail.ldsno, detailsno=0,  '+chr(13)+chr(10)
                 +'        skuid=detail.skuid, skuname=detail.skuname, quantityuom=detail.quantityuom, quantity=barcode.quantity,  '+chr(13)+chr(10)
                 +'        jobnoin=barcode.jobnoin, snoin=barcode.snoin, ldsnoin=barcode.ldsnoin, detailsnoin=barcode.detailsnoin,  '+chr(13)+chr(10)
                 +'        sizeuom=detail.sizeuom, height=detail.height, width=detail.width, depth=detail.depth,           '+chr(13)+chr(10)
                 +'        serialno=detail.serialno,                 '+chr(13)+chr(10)
                 +'        lotcode=detail.lotcode, qualityname=detail.qualityname,                        '+chr(13)+chr(10)
                 +'        locid=detail.locid, locname=detail.locname, operationdate=barcode.thedate, iuserid=detail.iuserid, iusername=detail.iusername,  '+chr(13)+chr(10)
                 +'        userid=detail.userid, username=detail.username, cusid=detail.cusid, cusname=detail.cusname,                     '+chr(13)+chr(10)
                 +'        shippercusid=detail.shippercusid, shippercusname=detail.shippercusname, costcusid=detail.costcusid, costcusname=detail.costcusname,   '+chr(13)+chr(10)
                 +'        pieceuom=detail.pieceuom, weightuom=detail.weightuom, volumeuom=detail.volumeuom,                     '+chr(13)+chr(10)
                 +'        areauom=detail.areauom, piece=0, netweight=0, grossweight=0,            '+chr(13)+chr(10)
                 +'        volume=0, area=0         '+chr(13)+chr(10)
                 +'   into #lskBCDetailDetail                       '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck barcode,#lskBCDetail detail (nolock)     '+chr(13)+chr(10)
                 +'  where barcode.jobno=detail.jobno       '+chr(13)+chr(10)
                 +'    and barcode.jobnoin=detail.jobnoin         '+chr(13)+chr(10)
                 +'    and barcode.snoin=detail.snoin         '+chr(13)+chr(10)
                 +'    and barcode.ldsnoin=detail.ldsnoin         '+chr(13)+chr(10)
                 );
//处理 detailsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetailDetail set detailsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//真实的塞入数据
   _ADOConnection.Starttransaction;
   try
//塞locoutskudetail
      ExecSql(qryTmp,' insert into locoutskudetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'     jobno, sno, ldsno, detailsno,    '+chr(13)+chr(10)
                    +'     skuid, skuname, quantityuom, quantity,   '+chr(13)+chr(10)
                    +'     jobnoin, snoin, ldsnoin, detailsnoin,   '+chr(13)+chr(10)
                    +'     sizeuom, height, width, depth,        '+chr(13)+chr(10)
                    +'     serialno,                      '+chr(13)+chr(10)
                    +'     lotcode, qualityname,            '+chr(13)+chr(10)
                    +'     locid, locname, operationdate, iuserid, iusername,   '+chr(13)+chr(10)
                    +'     userid, username, cusid, cusname,          '+chr(13)+chr(10)
                    +'     shippercusid, shippercusname, costcusid, costcusname,    '+chr(13)+chr(10)
                    +'     pieceuom, weightuom, volumeuom,           '+chr(13)+chr(10)
                    +'     areauom, piece, netweight, grossweight,   '+chr(13)+chr(10)
                    +'     volume, area              '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'     jobno, sno, ldsno, detailsno,    '+chr(13)+chr(10)
                    +'     skuid, skuname, quantityuom, quantity,   '+chr(13)+chr(10)
                    +'     jobnoin, snoin, ldsnoin, detailsnoin,   '+chr(13)+chr(10)
                    +'     sizeuom, height, width, depth,        '+chr(13)+chr(10)
                    +'     serialno,                      '+chr(13)+chr(10)
                    +'     lotcode, qualityname,            '+chr(13)+chr(10)
                    +'     locid, locname, operationdate, iuserid, iusername,   '+chr(13)+chr(10)
                    +'     userid, username, cusid, cusname,          '+chr(13)+chr(10)
                    +'     shippercusid, shippercusname, costcusid, costcusname,    '+chr(13)+chr(10)
                    +'     pieceuom, weightuom, volumeuom,           '+chr(13)+chr(10)
                    +'     areauom, piece, netweight, grossweight,   '+chr(13)+chr(10)
                    +'     volume, area              '+chr(13)+chr(10)
                    +' from #lskBCDetailDetail         '+chr(13)+chr(10)
                    +' ');
//塞locationoutdetail
      ExecSql(qryTmp,' insert into locationoutdetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'     jobno, sno, ldsno, jobnoin,           '+chr(13)+chr(10)
                    +'     snoin, ldsnoin, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'     ldsnoinf, locid, locname, operationtype,       '+chr(13)+chr(10)
                    +'     skuid, skuname, lotcode, qualityname,             '+chr(13)+chr(10)
                    +'     userid, username, quantityuom, pieceuom,           '+chr(13)+chr(10)
                    +'     weightuom, volumeuom, areauom, quantity,            '+chr(13)+chr(10)
                    +'     piece, netweight, grossweight, volume,             '+chr(13)+chr(10)
                    +'     area, cusid, cusname, shippercusid,                '+chr(13)+chr(10)
                    +'     shippercusname, lottracked, price, currcd,          '+chr(13)+chr(10)
                    +'     skucost, serialno, operationdate, transferdate,        '+chr(13)+chr(10)
                    +'     taskdate, costuomtype, contwithloca, isbond,               '+chr(13)+chr(10)
                    +'     countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'     snoorder, iuserid, iusername, locationbillno,                  '+chr(13)+chr(10)
                    +'     customsno, sizeuom, height, width,                             '+chr(13)+chr(10)
                    +'     depth, costcusid, costcusname, snotask, costcusidout,          '+chr(13)+chr(10)
                    +'     costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'     skucostin, jobnoori, snoori, cusbillno,                        '+chr(13)+chr(10)
                    +'     mainorder, locationbillnoin, customsnoin, cusbillnoin,       '+chr(13)+chr(10)
                    +'     mainorderin, shipcusid, shipcusname, isvalueadd            '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'     jobno, sno, ldsno, jobnoin,           '+chr(13)+chr(10)
                    +'     snoin, ldsnoin, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'     ldsnoinf, locid, locname, operationtype,       '+chr(13)+chr(10)
                    +'     skuid, skuname, lotcode, qualityname,             '+chr(13)+chr(10)
                    +'     userid, username, quantityuom, pieceuom,           '+chr(13)+chr(10)
                    +'     weightuom, volumeuom, areauom, quantity,            '+chr(13)+chr(10)
                    +'     piece, netweight, grossweight, volume,             '+chr(13)+chr(10)
                    +'     area, cusid, cusname, shippercusid,                '+chr(13)+chr(10)
                    +'     shippercusname, lottracked, price, currcd,          '+chr(13)+chr(10)
                    +'     skucost, serialno, operationdate, operationdate,        '+chr(13)+chr(10)
                    +'     taskdate, costuomtype, contwithloca, isbond,               '+chr(13)+chr(10)
                    +'     countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'     snoorder, iuserid, iusername, locationbillno,                  '+chr(13)+chr(10)
                    +'     customsno, sizeuom, height, width,                             '+chr(13)+chr(10)
                    +'     depth, costcusid, costcusname, snotask, costcusidout,          '+chr(13)+chr(10)
                    +'     costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'     skucostin, jobnoori, snoori, cusbillno,                        '+chr(13)+chr(10)
                    +'     mainorder, locationbillnoin, customsnoin, cusbillnoin,       '+chr(13)+chr(10)
                    +'     mainorderin, shipcusid, shipcusname, isvalueadd            '+chr(13)+chr(10)
                    +' from #lskBCDetail         '+chr(13)+chr(10)
                    +' ');
//更新locationoutitem
      ExecSql(qryTmp,'  update locationoutitem  '+chr(13)+chr(10)
                    +'     set quantity=quantitytask,    '+chr(13)+chr(10)
                    +'         piece=piecetask,    '+chr(13)+chr(10)
                    +'         area=areatask,    '+chr(13)+chr(10)
                    +'         volume=volumetask,    '+chr(13)+chr(10)
                    +'         netweight=netweighttask,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttask,    '+chr(13)+chr(10)
                    +'         transferdate=(select top 1 operationdate from #lskBCDetail where locationoutitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationoutitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationoutitem.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              );
//更新locationout
      ExecSql(qryTmp,'  update locationout  '+chr(13)+chr(10)
                    +'     set transferdate=(select top 1 operationdate from #lskBCDetail where locationout.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationout.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationout.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              );
//更新对应进仓信息
      BarCode_kspLocationOutDetail;
      BarCode_kspLocationOutItem;
      _ADOConnection.Commit;
      kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);
   except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);
      execsql(qryTmp,'drop table  #lskBarCode             '
                    +'drop table  #lskBarCodeCheck       '
                    +'drop table  #lskBarCodeCheckSumItem'
                    +'drop table  #lskBarCodeCheckSum    '
                    +'drop table  #lskBarCodeLocinOut    '
                    +'drop table  #lskBarCodeLocinOutInfo'
                    +'drop table  #lskBCDetailDetail     '
                    +'drop table  #lskBCDetail');
      Exit;
   end;
end;

procedure TfrmTxtInPutIn.OKMOV;
var
   strLocbillno,strMLJobno:string;
begin
   opensql(qryTmp,
           'select dhcx=max(convert(int,substring(docno1,7,8))) '
          +'  from genjobno '
          +' where substring(docno1,1,2)="ML"  '
          +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   strLocbillno:='ML'+copy(datetostr(GetServerDate),1,4)
                     +pad(inttostr(qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   strMLJobno:=genJobno('ML',strLocbillno);
//生成进仓实际临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno="'+strMLJobno+'", sno=0,ldsno=0,    '+chr(13)+chr(10)
                 +'        jobnoin=barcode.jobnoin,snoin=barcode.snoin, ldsnoin=barcode.ldsnoin,'+chr(13)+chr(10)
                 +'        jobnoinf=indetail.jobnoinf, snoinf=indetail.snoinf, ldsnoinf=indetail.ldsnoinf,'+chr(13)+chr(10)
                 +'        locid=indetail.locid, locname=indetail.locname,        '+chr(13)+chr(10)
                 +'        newlocid=barcode.locid,newlocname=barcode.locname,                             '+chr(13)+chr(10)
                 +'        skuid=indetail.skuid, skuname=indetail.skuname, lotcode=indetail.lotcode, qualityname=indetail.qualityname,    '+chr(13)+chr(10)
                 +'        userid=indetail.userid, username=indetail.username, quantityuom=indetail.quantityuom, pieceuom=indetail.pieceuom,    '+chr(13)+chr(10)
                 +'        weightuom=indetail.weightuom, volumeuom=indetail.volume, areauom=indetail.areauom, '+chr(13)+chr(10)
                 +'        quantity=barcode.quantity,quantityremain=barcode.quantity,    '+chr(13)+chr(10)
                 +'        piece=indetail.piece*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        netweight=indetail.netweight*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        grossweight=indetail.grossweight*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        volume=indetail.volume*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        area=indetail.area*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        cusid=indetail.cusid, cusname=indetail.cusname, shippercusid=indetail.shippercusid,            '+chr(13)+chr(10)
                 +'        shippercusname=indetail.shippercusname, lottracked=indetail.lottracked, price=indetail.price, currcd=indetail.currcd,         '+chr(13)+chr(10)
                 +'        skucost=indetail.skucost*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        serialno=barcode.skuno,  '+chr(13)+chr(10)
                 +'        operationdate=(select top 1 thedate from #lskBarCodeCheck    '+chr(13)+chr(10)
                 +'                        where #lskBarCodeCheck.jobnoin=barcode.jobnoin     '+chr(13)+chr(10)
                 +'                          and #lskBarCodeCheck.snoin=barcode.snoin     '+chr(13)+chr(10)
                 +'                          and #lskBarCodeCheck.ldsnoin=barcode.ldsnoin     '+chr(13)+chr(10)
                 +'                        order by thedate) , '+chr(13)+chr(10)
                 +'        taskdate=indetail.taskdate, costuomtype=indetail.costuomtype, contwithloca=indetail.contwithloca, isbond=indetail.isbond,                '+chr(13)+chr(10)
                 +'        countrent=indetail.countrent, countcontcost=indetail.countcontcost, '
                 +'        warerentcounttype=indetail.warerentcounttype, jobnoorder=indetail.jobnoorder,         '+chr(13)+chr(10)
                 +'        snoorder=indetail.snoorder, iuserid=indetail.iuserid, iusername=indetail.iusername, locationbillno=indetail.locationbillno,             '+chr(13)+chr(10)
                 +'        customsno=indetail.customsno, sizeuom=indetail.sizeuom, height=indetail.height, width=indetail.width,                     '+chr(13)+chr(10)
                 +'        depth=indetail.depth, costcusid=indetail.costcusid, costcusname=indetail.costcusname, costcusidout=indetail.costcusidout,        '+chr(13)+chr(10)
                 +'        costcusnameout=indetail.costcusnameout, countrentout=indetail.countrentout, warerentcounttypeout=indetail.warerentcounttypeout, pricein=indetail.pricein,        '+chr(13)+chr(10)
                 +'        skucostin=indetail.skucostin*(barcode.quantity/indetail.quantity),     '+chr(13)+chr(10)
                 +'        jobnoori=indetail.jobnoori, snoori=indetail.snoori, cusbillno=indetail.cusbillno,mainorder=indetail.mainorder,'+chr(13)+chr(10)
                // +'        --locationbillnoin=item.locationbillnoin, customsnoin=item.customsnoin, cusbillnoin=item.cusbillnoin,mainorderin=item.mainorderin,        '+chr(13)+chr(10)
                 +'        shipcusid=indetail.shipcusid, shipcusname=indetail.shipcusname, isvalueadd="F"         '+chr(13)+chr(10)
                 +'   into #lskBCDetail   '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheckSum barcode,locationindetail indetail (nolock)   '+chr(13)+chr(10)
                 +'  where barcode.jobnoin=indetail.jobno    '+chr(13)+chr(10)
                 +'    and barcode.snoin=indetail.sno    '+chr(13)+chr(10)
                 +'    and barcode.ldsnoin=indetail.ldsno    '+chr(13)+chr(10)
                 +'  ');
//处理 sno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetail set sno=@int,@int=@int+1       '+chr(13)+chr(10)
           );

//生成进仓商品明细临时表
   ExecSql(qryTmp,' select   '+chr(13)+chr(10)
                 +'        jobno=detail.jobno, sno=detail.sno, ldsno=detail.ldsno, detailsno=0,        '+chr(13)+chr(10)
                 +'        skuid=detail.skuid, skuname=detail.skuname, quantityuom=detail.quantityuom, '+chr(13)+chr(10)
                 +'        quantity=barcode.quantity,quantityremain=barcode.quantity,                  '+chr(13)+chr(10)
                 +'        jobnoin=barcode.jobnoin, snoin=barcode.snoin, ldsnoin=barcode.ldsnoin, detailldsnoin=barcode.detailsnoin,  '+chr(13)+chr(10)
                 +'        sizeuom=detail.sizeuom, height=detail.height, width=detail.width, depth=detail.depth,           '+chr(13)+chr(10)
                 +'        serialno=detail.serialno,                 '+chr(13)+chr(10)
                 +'        lotcode=detail.lotcode, qualityname=detail.qualityname,                        '+chr(13)+chr(10)
                 +'        locid=detail.newlocid, locname=detail.newlocname, operationdate=barcode.thedate, iuserid=detail.iuserid, iusername=detail.iusername,  '+chr(13)+chr(10)
                 +'        userid=detail.userid, username=detail.username, cusid=detail.cusid, cusname=detail.cusname,                     '+chr(13)+chr(10)
                 +'        shippercusid=detail.shippercusid, shippercusname=detail.shippercusname, costcusid=detail.costcusid, costcusname=detail.costcusname,   '+chr(13)+chr(10)
                 +'        pieceuom=detail.pieceuom, weightuom=detail.weightuom, volumeuom=detail.volumeuom,                     '+chr(13)+chr(10)
                 +'        areauom=detail.areauom, piece=0, netweight=0, grossweight=0,            '+chr(13)+chr(10)
                 +'        volume=0, area=0,tracktype="TO",sealno=barcode.sealno         '+chr(13)+chr(10)
                 +'   into #lskBCDetailDetail                       '+chr(13)+chr(10)
                 +'   from #lskBarCodeCheck barcode,#lskBCDetail detail (nolock)     '+chr(13)+chr(10)
                 +'  where barcode.jobnoin=detail.jobnoin         '+chr(13)+chr(10)
                 +'    and barcode.snoin=detail.snoin         '+chr(13)+chr(10)
                 +'    and barcode.ldsnoin=detail.ldsnoin         '+chr(13)+chr(10)
                 );
//处理 detailsno自动增长
   ExecSql(qryTmp,'  declare @int int     '+chr(13)+chr(10)
                 +'   select @int=1       '+chr(13)+chr(10)
                 +'   update #lskBCDetailDetail set detailsno=@int,@int=@int+1       '+chr(13)+chr(10)
           );
//真实的塞入数据
   _ADOConnection.Starttransaction;
   try
//塞locinskudetail
      ExecSql(qryTmp,' insert into movlocskudetail '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno, detailsno,        '+chr(13)+chr(10)
                    +'      jobnoin, snoin, ldsnoin, detailldsnoin,detailsnoin,        '+chr(13)+chr(10)
                    +'      skuid, skuname, serialno,         '+chr(13)+chr(10)
                    +'      quantity,quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname,sealno         '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'      jobno, sno, ldsno=0, detailsno,        '+chr(13)+chr(10)
                    +'      jobnoin, snoin, ldsnoin, detailldsnoin,detailldsnoin,        '+chr(13)+chr(10)
                    +'      skuid, skuname, serialno,         '+chr(13)+chr(10)
                    +'      quantity,quantityuom,      '+chr(13)+chr(10)
                    +'      sizeuom, height, width, depth,lotcode,                             '+chr(13)+chr(10)
                    +'      qualityname, locid, locname, operationdate,     '+chr(13)+chr(10)
                    +'      iuserid, iusername, userid, username,            '+chr(13)+chr(10)
                    +'      cusid, cusname, shippercusid, shippercusname,    '+chr(13)+chr(10)
                    +'      costcusid, costcusname, sealno         '+chr(13)+chr(10)
                    +' from #lskBCDetailDetail         '+chr(13)+chr(10)
                    +' ');

//塞locationindetail
       ExecSql(qryTmp,' insert into moveloc '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'      jobno, locationbillno, iuserid,iusername,userid,username,operationdate,createname,createdate,operationtype,skucostclasscd ) '+chr(13)+chr(10)
                    +'  values("'+strMLJobno+'","'+strLocbillno+'","'+_userid+'","'+_username+'","'+chr(13)+chr(10)
                    +_userid+'","'+_username+'","'+datetostr(GetServerDate)+'",'
                    +'   "'+_loginname+'","'+datetostr(GetServerDate)+'",-1,"COMMON")');
     ExecSql(qryTmp,' insert into movelocold '+chr(13)+chr(10)
                    +'   (                                    '+chr(13)+chr(10)
                    +'     jobno, sno,  jobnoin,           '+chr(13)+chr(10)
                    +'     snoin, ldsnoin, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'     ldsnoinf, locid, locname,newlocid,newlocname,        '+chr(13)+chr(10)
                    +'     operationtype,skuid, skuname, lotcode, qualityname,             '+chr(13)+chr(10)
                    +'     userid, username, quantityuom, pieceuom,           '+chr(13)+chr(10)
                    +'     weightuom, volumeuom, areauom, quantity,            '+chr(13)+chr(10)
                    +'     piece, netweight, grossweight, volume,             '+chr(13)+chr(10)
                    +'     area, cusid, cusname, shippercusid,                '+chr(13)+chr(10)
                    +'     shippercusname, lottracked, price, currcd,          '+chr(13)+chr(10)
                    +'     skucost, serialno, operationdate, transferdate,        '+chr(13)+chr(10)
                    +'     taskdate, costuomtype, contwithloca, isbond,               '+chr(13)+chr(10)
                    +'     countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'     snoorder, iuserid, iusername, locationbillno,                  '+chr(13)+chr(10)
                    +'     customsno, sizeuom, height, width,                             '+chr(13)+chr(10)
                    +'     depth, costcusid, costcusname,  costcusidout,          '+chr(13)+chr(10)
                    +'     costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'     skucostin, jobnoori, snoori, cusbillno,mainorder                        '+chr(13)+chr(10)
                    //+'     locationbillnoin, customsnoin, cusbillnoin,mainorderin,       '+chr(13)+chr(10)
                   // +'      shipcusid, shipcusname, isvalueadd            '+chr(13)+chr(10)
                    +'   )     '+chr(13)+chr(10)
                    +'  select                '+chr(13)+chr(10)
                    +'     jobno, sno, jobnoin,           '+chr(13)+chr(10)
                    +'     snoin, ldsnoin, jobnoinf, snoinf,           '+chr(13)+chr(10)
                    +'     ldsnoinf, locid, locname,newlocid,newlocname, operationtype=1,       '+chr(13)+chr(10)
                    +'     skuid, skuname, lotcode, qualityname,             '+chr(13)+chr(10)
                    +'     userid, username, quantityuom, pieceuom,           '+chr(13)+chr(10)
                    +'     weightuom, volumeuom, areauom, quantity,            '+chr(13)+chr(10)
                    +'     piece, netweight, grossweight, volume,             '+chr(13)+chr(10)
                    +'     area, cusid, cusname, shippercusid,                '+chr(13)+chr(10)
                    +'     shippercusname, lottracked, price, currcd,          '+chr(13)+chr(10)
                    +'     skucost, serialno, operationdate, operationdate,        '+chr(13)+chr(10)
                    +'     taskdate, costuomtype, contwithloca, isbond,               '+chr(13)+chr(10)
                    +'     countrent, countcontcost, warerentcounttype, jobnoorder,     '+chr(13)+chr(10)
                    +'     snoorder, iuserid, iusername, locationbillno,                  '+chr(13)+chr(10)
                    +'     customsno, sizeuom, height, width,                             '+chr(13)+chr(10)
                    +'     depth, costcusid, costcusname,  costcusidout,          '+chr(13)+chr(10)
                    +'     costcusnameout, countrentout, warerentcounttypeout, pricein,     '+chr(13)+chr(10)
                    +'     skucostin, jobnoori, snoori, cusbillno,mainorder                        '+chr(13)+chr(10)
                   // +'     locationbillnoin, customsnoin, cusbillnoin,mainorderin,       '+chr(13)+chr(10)
                  //  +'      shipcusid, shipcusname, isvalueadd            '+chr(13)+chr(10)
                    +' from #lskBCDetail         '+chr(13)+chr(10)
                    +' ');
//更新locationinitem
     { ExecSql(qryTmp,'  update locationinitem  '+chr(13)+chr(10)
                    +'     set quantity=quantitytask,    '+chr(13)+chr(10)
                    +'         piece=piecetask,    '+chr(13)+chr(10)
                    +'         area=areatask,    '+chr(13)+chr(10)
                    +'         volume=volumetask,    '+chr(13)+chr(10)
                    +'         netweight=netweighttask,    '+chr(13)+chr(10)
                    +'         grossweight=grossweighttask,    '+chr(13)+chr(10)
                    +'         transferdate=(select top 1 operationdate from #lskBCDetail where locationinitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationinitem.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationinitem.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              );
//更新locationin
      ExecSql(qryTmp,'  update locationin  '+chr(13)+chr(10)
                    +'     set transferdate=(select top 1 operationdate from #lskBCDetail where locationin.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         operationdate=(select top 1 operationdate from #lskBCDetail where locationin.jobno=#lskBCDetail.jobno order by operationdate),   '+chr(13)+chr(10)
                    +'         transfername="'+_loginname+'",    '+chr(13)+chr(10)
                    +'         operationname="'+_loginname+'"    '+chr(13)+chr(10)
                    +'   where locationin.jobno in (select distinct jobno from #lskBarCodeCheckSum) '+chr(13)+chr(10)
              ); }
//更新对应指令信息
      opensql(qryTmp,'exec ksp_MovelocconfirmNew "'
                 +strMLJobno+'"');
      if qryTmp.FieldByName('ermsg').AsString<>'' then
      begin
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise Exception.Create(qryTmp.FieldByName('ermsg').AsString);
      end;
      _ADOConnection.Commit;
      kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);
   except
      try
        _ADOConnection.rollback;
      except
      end;
      raise;
      kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);
      execsql(qryTmp,'drop table  #lskBarCode             '
                    +'drop table  #lskBarCodeCheck       '
                    +'drop table  #lskBarCodeCheckSumItem'
                    +'drop table  #lskBarCodeCheckSum    '
                    +'drop table  #lskBarCodeLocinOut    '
                    +'drop table  #lskBarCodeLocinOutInfo'
                    +'drop table  #lskBCDetailDetail     '
                    +'drop table  #lskBCDetail');
      Exit;
   end;
end;

function TfrmTxtInPutIn.GetLocationbillNo:String;
var
   StrDate:String;
   StrCusInvo:String;
begin
   decodedate(Now,Year,Month,Day);//分解当前日期
   OpenSql(datatmp.qryTmp,' select AutoBillNo=isnull(AutoBillNo,"F"),IsYear=isnull(IsYear,"F"), '
                 +'        IsMonth=isnull(IsMonth,"F"),IsDay=isnull(IsDay,"F"), '
                 +'        LastNum,ishelpnojc=rtrim(isnull(ishelpnojc,"")) '
                 +'   from organization (nolock)  '
                 +'  where userid="'+_userid+'" ');
   if datatmp.qryTmp.FieldByName('AutoBillNo').AsString='T' then
   begin
      StrCusInvo:='';
      StrCusInvo:=datatmp.qryTmp.FieldByName('ishelpnojc').AsString;
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
      Result:=StrCusInvo+Pad(datatmp.qryTmp1.FieldByName('MaxNo').AsString,datatmp.qryTmp.FieldByName('LastNum').AsInteger,'0',psLeft);
   end else
   begin
       opensql(datatmp.qryTmp,
               'select dhcx=max(convert(int,substring(docno1,7,8))) '
              +'  from genjobno '
              +' where substring(docno1,1,2)="JC"  '
              +'       and substring(jobno,5,2)="LI"  '
              +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
//       data.qryLocationin.FieldByName('LocationBillNO').Asstring:='JC'+copy(datetostr(GetServerDate),1,4)
//                                                               +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
      Result:='JC'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   end;
end;

procedure TfrmTxtInPutIn.edtCostCusButtonClick(Sender: TObject;
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

procedure TfrmTxtInPutIn.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure TfrmTxtInPutIn.edtIUserButtonClick(Sender: TObject;
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

procedure TfrmTxtInPutIn.edtIUserExit(Sender: TObject);
begin
  if edtIUser.Text='' then edtIUser.TextField:='';
end;

end.


