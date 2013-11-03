unit outdetailzx;

interface

uses
  Windows, Messages,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls,DBTables,Db,DBCtrls,libproc,GMSLabel,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  KBitBtn, KGroupBox,SLV, ComCtrls,KSText, frstatus, ADODB, dxfProgressBar,
  DBClient, KDataSetProvider, dxPageControl, dxDBTLCl, dxGrClms, dxDBGrid,
  dxTL, dxDBCtrl, Menus, KinPickEdit ;


type
  Tfrmoutdetailzx = class(TForm)
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    qryBarCode: TKADOQuery;
    dtsBarCode: TDataSource;
    qryBarCodeCheck: TKADOQuery;
    dtsBarCodeCheck: TDataSource;
    grpFilter: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    grdBarCode: TdxDBGrid;
    conno: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    btnOK: TKBitBtn;
    btnCancel: TKBitBtn;
    quantity: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    detailsno: TdxDBGridColumn;
    color: TdxDBGridColumn;
    edtconno: TdxEdit;
    serilalno: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtconnoExit(Sender: TObject);
    procedure edtconnoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
  private
    { Private declarations }
    strjobno,strcusid,strcusname:string;
    maxsno:integer;
    procedure OKOut; //出仓数据导入

  public
    { Public declarations }
  end;

procedure Workoutdetailzx(pstrjobno:string);

var
  frmoutdetailzx: Tfrmoutdetailzx;

implementation

{$R *.DFM}
uses datas,kindlg,libUser,libbb,ShellAPI,ZoomTxt,libuserPub, datasTmp,LocationIN,LocationOut,ConType,dysounds;

procedure Workoutdetailzx(pstrjobno:string);
begin
   {防止程序被重复执行}
   Application.CreateForm(Tfrmoutdetailzx,frmoutdetailzx);
   with frmoutdetailzx do
   begin
      strjobno:=pstrjobno;
      //lzw20110222
      OpenSql(qryTmp,'select costcusid,costcusname from locationout(nolock) where jobno="'+strjobno+'"');
      strcusid:=qrytmp.FieldByName('costcusid').asstring;
      strcusname:=qrytmp.FieldByName('costcusname').asstring;
      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      {初始化所有数据集}
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskcheckdetailoutzx") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskcheckdetailoutzx'+chr(13)+chr(10)
                            +'create table #lskcheckdetailoutzx'+chr(13)+chr(10)
                            +'            (jobno                 varchar(20) null,'+chr(13)+chr(10)
                            +'             sno                   int null,'+chr(13)+chr(10)
                            +'             ldsno                 int null,'+chr(13)+chr(10)
                            +'             detailsno             int null,'+chr(13)+chr(10)
                            +'             skuid                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuname               varchar(50) null,'+chr(13)+chr(10)
                            +'             customerno            varchar(50) null,'+chr(13)+chr(10)
                            +'             color                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuspec               varchar(50) null,'+chr(13)+chr(10)
                            +'             quantity              numeric(16,4) null,'+chr(13)+chr(10)
                            +'             quantityuom           varchar(40) null,'+chr(13)+chr(10)
                            +'             conno                 varchar(40) null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)
                            );
      begin
         opensql(qryBarCode,'insert into #lskcheckdetailoutzx         '+chr(13)+chr(10)
                           +'select consku.jobno,sno=0,ldsno=0,detailsno=0,consku.skuid,consku.skuname,   '+chr(13)+chr(10)
                           +'       customerno=consku.serialno,consku.color,consku.skuspec,consku.quantity,'+chr(13)+chr(10)
                           +'       consku.quantityuom,con.conno  '+chr(13)+chr(10)
                           +'  from locationinoutconsku consku(nolock),locationinoutcon con(nolock)  '+chr(13)+chr(10)
                           +' where consku.jobno=con.jobno                                           '+chr(13)+chr(10)
                           +'   and consku.sno=con.sno                                               '+chr(13)+chr(10)
                           +'   and consku.jobno="'+strjobno+'"                                      '+chr(13)+chr(10)
                           +'   and con.jobno="'+strjobno+'"                                          '+chr(13)+chr(10)
                           +' select * from  #lskcheckdetailoutzx       '+chr(13)+chr(10)

              );
      end;

      ShowModal;
      frmoutdetailzx.visible:=true;
      edtconno.SetFocus;
      btnOK.Enabled:=true;
      SetFormPosition(frmoutdetailzx,true);
      Free;
   end;
end;

procedure Tfrmoutdetailzx.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrmoutdetailzx.FormDestroy(Sender: TObject);
begin
   frmoutdetailzx:=nil;
end;

procedure Tfrmoutdetailzx.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmoutdetailzx.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(grpFilter);
   SetDxDbGrid(grdBarCode);
   qryBarCode.Connection:=_ADOConnection;
   qryBarCodeCheck.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;

end;

procedure Tfrmoutdetailzx.btnOKClick(Sender: TObject);
var
   strSqlQ,strSqlA:string;
   FailFlag:boolean;
begin
   if Kmessagedlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mryes then exit;

   OKOut;
   frmoutdetailzx.Close;
   frmLocationout.btnRefreshClick(frmLocationout.btnRefresh);
   btnOK.Enabled:=False;
end;

procedure Tfrmoutdetailzx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmoutdetailzx.OKOut;
begin
   //然后塞locationoutitem
   opensql(qrytmp1,'select * from locationout(nolock)                                                   '+chr(13)+chr(10)
                           +' where jobno="'+strjobno+'"                                                 '+chr(13)+chr(10)
                   );
   ExecSql(qryTmp,'  if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                 +'  where id=object_id("tempdb..#inputcheckzx") and sysstat & 0xf=3)                         '+chr(13)+chr(10)
                 +'   drop table #inputcheckzx                                                                '+chr(13)+chr(10)
                 +' select jobno,sno=0,                                                                     '+chr(13)+chr(10)
                 +'        userid="'+qrytmp1.FieldByName('userid').asstring+'",                             '+chr(13)+chr(10)
                 +'        username="'+qrytmp1.FieldByName('username').asstring+'",                         '+chr(13)+chr(10)
                 +'        skuid,skuname,quantityuom,                                                       '+chr(13)+chr(10)
                 +'        quantity=sum(quantity),customerno,qualityname="正品",color,skuspec,              '+chr(13)+chr(10)
                 +'        cusid="'+qrytmp1.FieldByName('cusid').asstring+'",                               '+chr(13)+chr(10)
                 +'        cusname="'+qrytmp1.FieldByName('cusname').asstring+'",                           '+chr(13)+chr(10)
                 +'        shippercusid="'+qrytmp1.FieldByName('shippercusid').asstring+'",                 '+chr(13)+chr(10)
                 +'        shippercusname="'+qrytmp1.FieldByName('shippercusname').asstring+'",             '+chr(13)+chr(10)
                 +'        shipcusid=space(50),                       '+chr(13)+chr(10)
                 +'        shipcusname=space(50),                   '+chr(13)+chr(10)
                 +'        locname=space(30),locid=space(30),                                               '+chr(13)+chr(10)
                 +'        cusbillno=space(30),     '+chr(13)+chr(10)
                 +'        locationbillno=space(30)              '+chr(13)+chr(10)
                 +'   into #inputcheckzx                                                                      '+chr(13)+chr(10)
                 +'   from #lskcheckdetailoutzx (nolock)                                                      '+chr(13)+chr(10)
                 +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                 +'  group by jobno,skuid,skuname,quantityuom,                                              '+chr(13)+chr(10)
                 +'	      customerno,color,skuspec                                                         '+chr(13)+chr(10)
                 +'declare @sno int                                                                         '+chr(13)+chr(10)
                 +' select @sno=0                                                                           '+chr(13)+chr(10)
                 +' update #inputcheckzx set sno=@sno,@sno=@sno+1                                             '+chr(13)+chr(10)
//                 +' insert into SkuDetailOutDetail                                                          '+chr(13)+chr(10)
//                 +'        (jobno,sno,userid,username,skuid,skuname,quantityuom,                            '+chr(13)+chr(10)
//                 +'        quantity,serialno,qualityname,color,skuspec,                                     '+chr(13)+chr(10)
//                 +'        cusid,cusname,shippercusid,shippercusname,shipcusid,shipcusname,                 '+chr(13)+chr(10)
//                 +'        cusbillno,locationbillno)                                                        '+chr(13)+chr(10)
//                 +' select jobno,sno,userid,username,skuid,skuname,quantityuom,                             '+chr(13)+chr(10)
//                 +'        quantity,customerno,qualityname,color,skuspec,                                   '+chr(13)+chr(10)
//                 +'        cusid,cusname,shippercusid,shippercusname,shipcusid,shipcusname,                 '+chr(13)+chr(10)
//                 +'        cusbillno,locationbillno                                                         '+chr(13)+chr(10)
//                 +'   from #inputcheckzx (nolock)                                                             '+chr(13)+chr(10)
//                 +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
//
//                 +' update SkuDetailOut set                                                      '+chr(13)+chr(10)
//                 +'        checkid="T",ischeckname="'+_loginname+'",ischeckdate=getdate(),        '+chr(13)+chr(10)
//                 +'        quantity=isnull((select sum(isnull(quantity,0))                       '+chr(13)+chr(10)
//                 +'                           from #lskoutcheckdetail                            '+chr(13)+chr(10)
//                 +'                          where #lskoutcheckdetail.jobno="'+strjobno+'"),0)   '+chr(13)+chr(10)
//                 +'  where jobno="'+strjobno+'"                                                  '+chr(13)+chr(10)
//                 +' update SkuDetailOutdetail                                                    '+chr(13)+chr(10)
//                 +'    set cusbillno=SkuDetailOut.cusbillno,locationbillno=SkuDetailOut.locationbillno '+chr(13)+chr(10)
//                 +'   from SkuDetailOut(nolock)                                                  '+chr(13)+chr(10)
//                 +'  where SkuDetailOut.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
//                 +'    and SkuDetailOut.jobno=SkuDetailOutDetail.jobno                              '+chr(13)+chr(10)
                     );

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
                 +'select #lskcheckdetailoutzx.jobno, #lskcheckdetailoutzx .sno, locinskudetail.jobno,locinskudetail.sno,         '+chr(13)+chr(10)
                 +'      locinskudetail.jobno,locinskudetail.sno,locinskudetail.ldsno,           '+chr(13)+chr(10)
                 +'      locinskudetail.skuid, locinskudetail.skuname, locinskudetail.skuspec, locinskudetail.skumodel,  '+chr(13)+chr(10)
                 +'      userid="'+qrytmp1.FieldByName('userid').asstring+'",   '+chr(13)+chr(10)
                 +'      username="'+qrytmp1.FieldByName('username').asstring+'",  '+chr(13)+chr(10)
                 +'      iuserid="'+qrytmp1.FieldByName('userid').asstring+'",   '+chr(13)+chr(10)
                 +'      iusername="'+qrytmp1.FieldByName('userid').asstring+'", '+chr(13)+chr(10)
                 +'      costcusid="'+qrytmp1.FieldByName('username').asstring+'",   '+chr(13)+chr(10)
                 +'      costcusname="'+qrytmp1.FieldByName('costcusname').asstring+'",          '+chr(13)+chr(10)
                 +'      costcusid="'+qrytmp1.FieldByName('costcusid').asstring+'",       '+chr(13)+chr(10)
                 +'      costcusname="'+qrytmp1.FieldByName('costcusname').asstring+'",    '+chr(13)+chr(10)
                 +'      locinskudetail.qualityname,'+chr(13)+chr(10)
                 +'      costcusid="'+qrytmp1.FieldByName('costcusid').asstring+'",    '+chr(13)+chr(10)
                 +'      costcusname="'+qrytmp1.FieldByName('costcusname').asstring+'",    '+chr(13)+chr(10)
                 +'      warerentcounttype="'+qrytmp1.FieldByName('warerentcounttype').asstring+'",    '+chr(13)+chr(10)
                 +'      countrent="'+qrytmp1.FieldByName('countrent').asstring+'",    '+chr(13)+chr(10)
                 +'      countcontcost="'+qrytmp1.FieldByName('countcontcost').asstring+'",    '+chr(13)+chr(10)
                 +'      isbond="'+qrytmp1.FieldByName('isbond').asstring+'",    '+chr(13)+chr(10)
                 +'      customsno="'+qrytmp1.FieldByName('customsno').asstring+'",    '+chr(13)+chr(10)
                 +'      mainorder="'+qrytmp1.FieldByName('mainorder').asstring+'",    '+chr(13)+chr(10)
                 +'      locationbillno="'+qrytmp1.FieldByName('locationbillno').asstring+'",    '+chr(13)+chr(10)
                 +'      cusbillno="'+qrytmp1.FieldByName('cusbillno').asstring+'",    '+chr(13)+chr(10)
                 +'      taskdate="'+qrytmp1.FieldByName('taskdate').asstring+'",    '+chr(13)+chr(10)
                 +'      operationdate=getdate(),         '+chr(13)+chr(10)
                 +'      customsnoin=space(50),mainorderin=space(50),        '+chr(13)+chr(10)
                 +'      locationbillnoin=space(50),cusbillnoin=space(50),   '+chr(13)+chr(10)
                 +'      #lskcheckdetailoutzx .quantity,locinskudetail.quantityuom,       '+chr(13)+chr(10)
                 +'      piecetask=0,locinskudetail.pieceuom,             '+chr(13)+chr(10)
                 +'      grossweighttask=0,locinskudetail.weightuom,      '+chr(13)+chr(10)
                 +'      netweighttask=0,operationtype=-1,locinskudetail.manufacturedate     '+chr(13)+chr(10)
                 +' from #lskcheckdetailoutzx                  '+chr(13)+chr(10)
                 +'      left join locinskudetail(nolock)    '+chr(13)+chr(10)
                 +'             on locinskudetail.conno=#lskcheckdetailoutzx.conno  '+chr(13)+chr(10)
                 +'            and locinskudetail.serialno=#lskcheckdetailoutzx.customerno  '+chr(13)+chr(10)
                 +'            and locinskudetail.color=#lskcheckdetailoutzx.color  '+chr(13)+chr(10)
                 +'            and locinskudetail.skuspec=#lskcheckdetailoutzx.skuspec  '+chr(13)+chr(10)

                 +' ');
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
                 +'        shipcusid=space(50), shipcusname=space(50)                                       '+chr(13)+chr(10)
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

procedure Tfrmoutdetailzx.edtconnoExit(Sender: TObject);
var
   maxsno:integer;
   strconno:string;
begin
   if edtconno.text='' then  exit;

   opensql(datatmp.qryTmp,'select maxsno=isnull(max(sno),0)+1 from #lskcheckdetailoutzx '
                         +' where jobno="'+strjobno+'" '
          );
   maxsno:=datatmp.qryTmp.FieldByName('maxsno').asinteger;
   //lzw20101201
   opensql(datatmp.qryTmp,' select conno=replace("'+edtconno.Text+'"," ","") '
          );
   strconno:=datatmp.qryTmp.FieldByName('conno').AsString;
   if (Pos('七匹狼',strcusname)>0)  then
   begin
      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmxoutzx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmxoutzx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno,ldsno,detailsno,        '+chr(13)+chr(10)
                   +'       skuid=indetail.skuid,skuname=indetail.skuname,              '+chr(13)+chr(10)
                   +'       customerno=indetail.serialno,color=indetail.color,            '+chr(13)+chr(10)
                   +'       skuspec=indetail.skuspec,quantity,conno=indetail.conno,quantityuom  '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmxoutzx                                              '+chr(13)+chr(10)
                   +'  from locinskudetail indetail(nolock)                   '+chr(13)+chr(10)
                   +' where 1=1                                '+chr(13)+chr(10)
                   +'   and replace(conno," ","")="'+strconno+'"            '+chr(13)+chr(10)
                   );
   end;

   opensql(qrytmp,'select * from #lskcheckdetailmxoutzx(nolock)               '+chr(13)+chr(10)
                 +' where jobno="'+strjobno+'"                                             '+chr(13)+chr(10)
          );
   if qrytmp.RecordCount=0 then
   begin
      //调用声音文件
      frmdysounds.btnsoundsClick(self);
      begin
         KMessageDlg('该箱号"'+strconno+'"在系统中不存在,不能扫描',mtInformation,[mbOK],0);
         ExecSql(datatmp.qrytmp2,'delete #lskcheckdetailmxoutzx            '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'"        '+chr(13)+chr(10)
                                +'   and conno="'+strconno+'"    '+chr(13)+chr(10)
                  );
      end
   end else
   begin
      openSql(qryBarCode,'insert into #lskcheckdetailoutzx        '+chr(13)+chr(10)
          +'select jobno, sno,ldsno,detailsno,                    '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,                              '+chr(13)+chr(10)
          +'       skuspec,quantity,quantityuom,conno             '+chr(13)+chr(10)
          +'  from #lskcheckdetailmxoutzx                         '+chr(13)+chr(10)
          +' where jobno="'+strjobno+'"                           '+chr(13)+chr(10)
          +'select jobno, sno,ldsno, detailsno,                   '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,                              '+chr(13)+chr(10)
          +'       skuspec,quantity,quantityuom,conno             '+chr(13)+chr(10)
          +'  from #lskcheckdetailoutzx                           '+chr(13)+chr(10)

         );
   end;
   edtconno.clear;
   edtconno.setfocus;
   btnOK.Enabled:=True;

end;

procedure Tfrmoutdetailzx.edtconnoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtconno.text='' then exit;
end;

end.


