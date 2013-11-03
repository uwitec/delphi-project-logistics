unit cx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls, LblEffct,Db, GMSLabel,KBitBtn,KDataSetProvider,libuserPub,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, KGroupBox, CheckLst,libproc,
  DBClient, dxDBELib, KinPickEdit,shellapi,vcf1;

type
  Tfrmcx = class(TForm)
    Image1: TImage;
    lblPrint: TLabelEffect;
    qryTmp1: TKADOQuery;
    GroupBox2: TKGroupBox;
    ckbrkqdlist: TdxCheckEdit;
    KGroupBox1: TKGroupBox;
    dtdReceDateF: TdxDateEdit;
    edtCostAccID: TdxButtonEdit;
    edtuserid: TdxButtonEdit;
    dtdReceDateT: TdxDateEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    btnPrint: TKBitBtn;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    ckbckbb: TdxCheckEdit;
    ckbkcbb: TdxCheckEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    edtPath: TdxButtonEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    ckbbscybb: TdxCheckEdit;
    qrytmp: TKADOQuery;
    procedure btnPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCostAccIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostAccIDExit(Sender: TObject);
    procedure edtCostAccIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtuseridButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure saveExcel(pBBDM,pBBMC:string;pLstParas:Tstringlist;pqryMain,pqryRow,pqryCol:TKADOQuery;pstrpath:string);
  private
    { Private declarations }
    blnSelect:Boolean;
    strtype:string;
  public
    { Public declarations }
  end;

var
  frmcx: Tfrmcx;

procedure Workcx;

implementation

{$R *.DFM}

uses libUser,libBb,main,kindlg,datas,GetDllPub, datasTmp, linprint;

procedure Workcx;
var
   strYear,strMonth,strDay:Word;
begin
   if frmcx <> nil then
   with frmcx do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmcx:=Tfrmcx.Create(Application);
   with frmcx do
   begin
       
      DecodeDate(Date,strYear,strMonth,strDay);
      dtdReceDateT.Date:=Date;
      dtdReceDateF.Date:=Date-30;
      ShowModal;
      Free;
   end;
end;

procedure Tfrmcx.btnPrintClick(Sender: TObject);
var
   strSql,strFilter,strfiltercost,strmsg:string;
   lstPara:Tstringlist;
   blnPrint:boolean;
begin
   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要保存的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;

   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;

   lstPara:=TstringList.Create;
   lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
   lstPara.Add('dateT='+dtdReceDateT.Text);

   lstPara.Add('cusname='+edtCostAccID.Text);                      //费用关系人
   lstPara.Add('zbr='+_loginName);
   lstPara.Add('zbrq='+DateTimeToStr(GetServerDate));

   openSql(dataTmp.qryTmp,'select cuscname from customer(nolock)     '
                         +' where cusid="'+edtCostAccID.Textfield+'" '
                         );
   lstPara.Add('cuscname='+dataTmp.qryTmp.FieldByName('cuscname').AsString);

   GenInformations(lstPara);
   
   if edtCostAccID.Text='' then
   begin
      Kmessagedlg('费用关系人不能为空！',mtInformation,[mbOK],0);
      edtCostAccID.SetFocus;
      Exit;
   end;

   if dtdReceDateF.date=0 then
   begin
      Kmessagedlg('统计日期从不能为空！',mtInformation,[mbOK],0);
      dtdReceDateF.SetFocus;
      Exit;
   end;
   if dtdReceDatet.date=0 then
   begin
      Kmessagedlg('统计日期到不能为空！',mtInformation,[mbOK],0);
      dtdReceDatet.SetFocus;
      Exit;
   end;
   //打印入库清单
   if ckbrkqdlist.checked then
   begin
      try

         lstPara.Add('dateF='+dtdReceDateF.Text);
         lstPara.Add('dateT='+dtdReceDateT.Text);
         lstpara.add('printdate='+datetostr(GetServerDate));
         lstPara.Add('costcusname='+edtCostAccID.Text);
         OpenSql(qrytmp1,'select num=count(*),                                  '+chr(13)+chr(10)
                        +'       grossweightsum=sum(isnull(grossweight,0)),     '+chr(13)+chr(10)
                        +'       netweightsum=sum(isnull(netweight,0)),         '+chr(13)+chr(10)
                        +'       skucostsum=sum(isnull(skucost,0))              '+chr(13)+chr(10)
                        +'  from locationInitem item  (nolock)                  '+chr(13)+chr(10)
                        +' where item.costcusid="'+edtCostAccID.Textfield+'"    '+chr(13)+chr(10)
                        );
         lstPara.Add('num='+qrytmp1.FieldByname('num').AsString);
         lstPara.Add('grossweightsum='+qrytmp1.FieldByname('grossweightsum').AsString);
         lstPara.Add('netweightsum='+qrytmp1.FieldByname('netweightsum').AsString);
         lstPara.Add('skucostsum='+qrytmp1.FieldByname('skucostsum').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select customsno=isnull(locin.customsno,""),item.skuname,                                 '+chr(13)+chr(10)
                       +'       guigexinghao=item.skumodel+"-"+item.skuspec,                                       '+chr(13)+chr(10)
                       +'       customerno=isnull(item.customerno,""),shipcusname=isnull(locin.shipcusname,""),    '+chr(13)+chr(10)
                       +'       grossweight=isnull(item.grossweight,0),netweight=isnull(item.netweight,0),         '+chr(13)+chr(10)
                       +'       price=isnull(item.price,0),skucost=isnull(item.skucost,0),                         '+chr(13)+chr(10)
                       +'       remark=isnull(item.remark,"")                                                      '+chr(13)+chr(10)
                       +'  from locationInitem item  (nolock)                                                      '+chr(13)+chr(10)
                       +'       left join locationin locin (nolock)                                                '+chr(13)+chr(10)
                       +'              on locin.jobno=item.jobno                                                   '+chr(13)+chr(10)
                       +' where item.costcusid="'+edtCostAccID.Textfield+'"                                        '+chr(13)+chr(10)
                 );

         saveExcel('100023','环宇入库清单'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'入库报表已生成,';
      except
         strmsg:=strmsg+'入库报表未生成,';
      end;

   end;
   //打印 库存报表
   if ckbkcbb.checked then
   begin
      try
         lstPara:=TstringList.Create;
         lstpara.add('printdate='+datetostr(GetServerDate));
         lstPara.Add('costcusname='+edtCostAccID.Text);
         OpenSql(qrytmp1,'select num=count(*),                                                  '+chr(13)+chr(10)
                        +'       grossweightsum=sum(isnull(grossweight,0)),                     '+chr(13)+chr(10)
                        +'       netweightsum=sum(isnull(netweight,0)),                         '+chr(13)+chr(10)
                        +'       skucostsum=sum(isnull(skucost,0))                              '+chr(13)+chr(10)
                        +'  from locationInitem item  (nolock)                                  '+chr(13)+chr(10)
                        +' where item.costcusid="'+edtCostAccID.Textfield+'"                    '+chr(13)+chr(10)
                        +'   and isnull(item.grossweight,0)-isnull(item.grossweightdo,0)>0      '+chr(13)+chr(10)
                        );
         lstPara.Add('num='+qrytmp1.FieldByname('num').AsString);
         lstPara.Add('grossweightsum='+qrytmp1.FieldByname('grossweightsum').AsString);
         lstPara.Add('netweightsum='+qrytmp1.FieldByname('netweightsum').AsString);
         lstPara.Add('skucostsum='+qrytmp1.FieldByname('skucostsum').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select item.skuname,customerno=isnull(item.customerno,""),                               '+chr(13)+chr(10)
                       +'       guigexinghao=item.skumodel+"-"+item.skuspec,                                      '+chr(13)+chr(10)
                       +'       grossweightall=isnull(item.grossweight,0)-isnull(item.grossweightdo,0),           '+chr(13)+chr(10)
                       +'       netweightall=isnull(item.netweight,0)-isnull(item.netweightdo,0),                 '+chr(13)+chr(10)
                       +'       skucostall=(isnull(item.skucost,0)-sum(isnull(outdetail.skucost,0)))              '+chr(13)+chr(10)
                       +'  from locationInitem item  (nolock)                                                     '+chr(13)+chr(10)
                       +'       left join locationoutdetail outdetail(nolock)                                     '+chr(13)+chr(10)
                       +'              on outdetail.jobnoin=item.jobno                                            '+chr(13)+chr(10)
                       +'             and outdetail.snoin=item.sno                                                '+chr(13)+chr(10)
                       +' where item.costcusid="'+edtCostAccID.Textfield+'"                                       '+chr(13)+chr(10)
                       +' group by item.skuname,item.customerno,item.skumodel,item.skuspec,                       '+chr(13)+chr(10)
		                 +'          item.grossweight,item.grossweightdo,                                           '+chr(13)+chr(10)
		                 +'          item.netweight,item.netweightdo, item.skucost                                  '+chr(13)+chr(10)
                       +'having isnull(item.grossweight,0)-isnull(item.grossweightdo,0)>0                         '+chr(13)+chr(10)
                 );

         saveExcel('100024','环宇库存报表'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'库存报表已生成,';
      except
         strmsg:=strmsg+'库存报表未生成,';
      end;
   end;
   //打印 出库报表
   if ckbckbb.checked then
   begin
      try
         lstPara:=TstringList.Create;
         lstPara.Add('dateF='+dtdReceDateF.Text);
         lstPara.Add('dateT='+dtdReceDateT.Text);
         lstpara.add('printdate='+datetostr(GetServerDate));
         lstPara.Add('costcusname='+edtCostAccID.Text);
         OpenSql(qrytmp1,'select num=count(*),                                  '+chr(13)+chr(10)
                        +'       grossweightsum=sum(isnull(grossweight,0)),     '+chr(13)+chr(10)
                        +'       netweightsum=sum(isnull(netweight,0)),         '+chr(13)+chr(10)
                        +'       skucostsum=sum(isnull(skucost,0))              '+chr(13)+chr(10)
                        +'  from locationoutitem item  (nolock)                 '+chr(13)+chr(10)
                        +' where item.costcusid="'+edtCostAccID.Textfield+'"    '+chr(13)+chr(10)
                        );
         lstPara.Add('num='+qrytmp1.FieldByname('num').AsString);
         lstPara.Add('grossweightsum='+qrytmp1.FieldByname('grossweightsum').AsString);
         lstPara.Add('netweightsum='+qrytmp1.FieldByname('netweightsum').AsString);
         lstPara.Add('skucostsum='+qrytmp1.FieldByname('skucostsum').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select customsno=isnull(locout.customsno,""),item.skuname,                          '+chr(13)+chr(10)
                       +'       operationdate=convert(varchar(10),item.operationdate,102),                   '+chr(13)+chr(10)
                       +'       guigexinghao=item.skumodel+"-"+item.skuspec,                                 '+chr(13)+chr(10)
                       +'       grossweight=isnull(item.grossweight,0), netweight=isnull(item.netweight,0),  '+chr(13)+chr(10)
	                    +'       customerno=isnull(item.customerno,""),remark=isnull(item.remark,""),         '+chr(13)+chr(10)
                       +'       price=isnull(item.price,0),skucost=isnull(item.skucost,0)                    '+chr(13)+chr(10)
                       +'  from locationoutitem item  (nolock)                                               '+chr(13)+chr(10)
                       +'       left join locationout locout (nolock)                                        '+chr(13)+chr(10)
                       +'              on locout.jobno=item.jobno                                            '+chr(13)+chr(10)
                       +' where item.costcusid="'+edtCostAccID.Textfield+'"                                  '+chr(13)+chr(10)
                 );
         saveExcel('100025','环宇出库报表'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'出库报表已生成,';
      except
         strmsg:=strmsg+'出库报表未生成,';
      end;
   end;
     //打印 公用保税仓月报表
   if ckbbscybb.checked then
   begin
      try
         OpenSql(qryTmp,' exec ksp_bscybb @Sdate="'+dtdReceDateF.Text+'",'
                       +'                 @Edate="'+dtdReceDateT.Text+'",'
                       +'                 @costcusid="'+edtCostAccID.Textfield+'",'
                       +'                 @cusid="",'
                       +'                 @skuname="",'
                       +'                 @userid="'+_userid+'"'
                        );
         lstPara:=TstringList.Create;
         lstPara.Add('dateF='+dtdReceDateF.Text);
         lstPara.Add('dateT='+dtdReceDateT.Text);
         lstPara.Add('qc='+qrytmp.FieldByname('qc').AsString);
         lstPara.Add('qm='+qrytmp.FieldByname('qm').AsString);
         lstPara.Add('qccost='+qrytmp.FieldByname('qccost').AsString);
         lstPara.Add('qmcost='+qrytmp.FieldByname('qmcost').AsString);
         lstPara.Add('sjc='+qrytmp.FieldByname('sjc').AsString);
         lstPara.Add('sjccost='+qrytmp.FieldByname('sjccost').AsString);
         lstPara.Add('jwrkw='+qrytmp.FieldByname('jwrkw').AsString);
         lstPara.Add('jwckw='+qrytmp.FieldByname('jwckw').AsString);
         lstPara.Add('glljgw='+qrytmp.FieldByname('glljgw').AsString);
         lstPara.Add('gjljgw='+qrytmp.FieldByname('gjljgw').AsString);
         lstPara.Add('hwmsw='+qrytmp.FieldByname('hwmsw').AsString);
         lstPara.Add('hwzsw='+qrytmp.FieldByname('hwzsw').AsString);
         lstPara.Add('zkrkw='+qrytmp.FieldByname('zkrkw').AsString);
         lstPara.Add('zkckw='+qrytmp.FieldByname('zkckw').AsString);
         lstPara.Add('jwrkcost='+qrytmp.FieldByname('jwrkcost').AsString);
         lstPara.Add('jwckcost='+qrytmp.FieldByname('jwckcost').AsString);
         lstPara.Add('glljgcost='+qrytmp.FieldByname('glljgcost').AsString);
         lstPara.Add('gjljgcost='+qrytmp.FieldByname('gjljgcost').AsString);
         lstPara.Add('hwmscost='+qrytmp.FieldByname('hwmscost').AsString);
         lstPara.Add('hwzscost='+qrytmp.FieldByname('hwzscost').AsString);
         lstPara.Add('zkrkcost='+qrytmp.FieldByname('zkrkcost').AsString);
         lstPara.Add('zkckcost='+qrytmp.FieldByname('zkckcost').AsString);
         GenInformations(lstPara);
         saveExcel('100027','环宇保税仓月报表'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'保税仓月报表报表已生成,';
      except
         strmsg:=strmsg+'保税仓月报表报表未生成,';
      end;
   end;

   KMessageDlg(strmsg,mtWarning,[mbOK],0);


end;

procedure Tfrmcx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmcx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
      Vk_Escape:
      begin
         Key:=0;
         btnCancelClick(nil);
      end;
   end;
end;

procedure Tfrmcx.FormDestroy(Sender: TObject);
begin
   frmcx:=nil;
end;

procedure Tfrmcx.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrmcx.FormCreate(Sender: TObject);
begin
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
end;

procedure Tfrmcx.edtCostAccIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCostAccID.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCostAccID.Text       :=qrySelect.FieldByName('Cusname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   qrySelect:=nil;
end;

procedure Tfrmcx.edtCostAccIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure Tfrmcx.edtCostAccIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtCostAccID.Text='' then
   begin
      edtCostAccID.TextField:='';
      edtCostAccID.Text:='';
   end else
   if not blnSelect then
   begin
      qrySelect:=pGetCustomerSelect('A',edtCostAccID.Text);
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         edtCostAccID.TextField:=qrySelect.FieldByName('Cusid').asstring;
         edtCostAccID.Text  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure Tfrmcx.edtuseridButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','F');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtuserid.TextField  :=qrySelect.FieldByName('userid').asstring;
      edtuserid.Text       :=qrySelect.FieldByName('username').asstring;
      ReturnNext(Self);
   end;
   qrySelect:=nil;

end;

procedure Tfrmcx.saveExcel(pBBDM,pBBMC:string;pLstParas:Tstringlist;pqryMain,pqryRow,pqryCol:TKADOQuery;pstrpath:string);
var
   KF1Book : TKF1book;
   fileName,strCurrdir:string;
begin
   kF1Book := TKF1book.Create;
   try
     with KF1Book do
     begin
        BBdm:=pBBDM;
        OnFieldText:=nil;
        qryMain :=pqryMain;
        qryCol :=pqryCol;
        qryRow :=pqryRow;

        if pLstParas <> nil then paras := pLstParas;
        BbHandle:=bbNone;
        ShowPrintDlg:=False;
        Printcount:=1;

        CreateReport;
        strCurrdir:=pstrpath;
        fileName := strCurrdir +pBBMC;
        KF1Book.F1Book.Write(fileName, F1FileExcel5);

        //ShellExecute(Application.MainForm.Handle,'open',
          //    PChar(fileName),pchar(''),pchar(''),SW_MAXIMIZE)
     end;
   finally
      kF1Book.Destroy;
   end;
end;

procedure Tfrmcx.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

end.


