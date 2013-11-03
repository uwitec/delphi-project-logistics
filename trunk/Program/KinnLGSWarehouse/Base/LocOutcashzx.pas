unit LocOutcashzx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmLocOutcashzx = class(TForm)
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    RxSplitter1: TRxSplitter;
    dtsskudetailcashzx: TDataSource;
    qryskudetailcashzx: TKADOQuery;
    qryTmp: TKADOQuery;
    KGroupBox3: TKGroupBox;
    GMSStickyLabel5: TGMSStickyLabel;
    edtcustomerno: TdxEdit;
    qrytmp1: TKADOQuery;
    btncash: TKBitBtn;
    btnzx: TKBitBtn;
    btnprint: TKBitBtn;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtcusbillno: TdxEdit;
    edtorigincusname: TdxEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    edtlotcode: TdxEdit;
    ckbcheck: TdxCheckEdit;
    KGroupBox5: TKGroupBox;
    grdlotcode: TdxDBGrid;
    xzlotcode: TdxDBGridColumn;
    xzsno: TdxDBGridColumn;
    xzquantity: TdxDBGridColumn;
    xznetweight: TdxDBGridColumn;
    xzgrossweight: TdxDBGridColumn;
    qryskuxz: TKADOQuery;
    dtsskuxz: TDataSource;
    qryskudetail: TKADOQuery;
    dtsskudetail: TDataSource;
    KGroupBox6: TKGroupBox;
    KGroupBox2: TKGroupBox;
    grdcashsku: TdxDBGrid;
    lotcode: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    quantitysm: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    cys: TdxDBGridColumn;
    quantityuom: TdxDBGridColumn;
    KGroupBox4: TKGroupBox;
    grdskudetail: TdxDBGrid;
    customernosm: TdxDBGridColumn;
    skunamesm: TdxDBGridColumn;
    colorsm: TdxDBGridColumn;
    skuspecsm: TdxDBGridColumn;
    quantityuomsm: TdxDBGridColumn;
    quantitysm1: TdxDBGridColumn;
    skucardssm: TdxDBGridColumn;
    outzoneno: TdxDBGridColumn;
    colorid: TdxDBGridColumn;
    coloridsm: TdxDBGridColumn;
    ischeck: TdxDBGridColumn;
    outzonenoxz: TdxDBGridColumn;
    snosm1: TdxDBGridCurrencyColumn;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    skucards: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure qryskudetailcashzxAfterPost(DataSet: TDataSet);
    procedure btncancellClick(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure btncashClick(Sender: TObject);
    procedure edtcustomernoExit(Sender: TObject);
    procedure edtcustomernoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnzxClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure edtlotcodeExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtlotcodeExit(Sender: TObject);
    procedure edtcusbillnoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtcusbillnoExit(Sender: TObject);
    procedure grdcashskuCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
  private
    { Private declarations }
    //变量定义
    strMLjobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    strsql,FilterSql,strFilter: string;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    arrml,arrMoveLoc,arrMoveLocOld,arrMoveLocNew:Variant;//用于数据复制
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    m_blnPost: Boolean;//在Post状态
    strDel_New:string;//目标仓位删除,记录删除序号
    strGetCd:String;
    exPiecepro:Extended;
    strjobnoorder:string;

    //过程定义
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure pgcRelocationChange(Sender: TObject);
    procedure GetSql;
    function GetLocationBillNO:String;
    procedure GetConSkuInZX;
    procedure Getqryskudetailcashzx(blnALL:boolean);
    procedure Getqryskuxz(blnALL:boolean);

    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//记录商品明细删除,datas中.
    strjobno,strcusid,strcusname,strlocationbillno,strblno:string;
    strconno,strcustomsno,strshipcusid,strshipcusname,stroutzoneno:string;
    Year,Month,Day:word;
    strthelotcode:string; //箱号信息
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocOutcashzx(pstrjobno:string);

var
  frmLocOutcashzx: TfrmLocOutcashzx;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect,locationin,dysounds,libbb,ShellAPI;

var strClassID,strZsql,strMxpjbz:string;

procedure WorkLocOutcashzx(pstrjobno:string);
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pDataBaseID:定位DataBaseID
  pItemOrDetail  :进出标志 I 任务 D 实际
}
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   if frmLocOutcashzx <> nil then
   with frmLocOutcashzx do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmLocOutcashzx:=TfrmLocOutcashzx.Create(application);

   with frmLocOutcashzx do
   begin
      edtcusbillno.Text:=pstrjobno;
      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      {初始化所有数据集}
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskcheckdetailzx") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskcheckdetailzx'+chr(13)+chr(10)
                            +'create table #lskcheckdetailzx'+chr(13)+chr(10)
                            +'            (jobno                 varchar(20) null,'+chr(13)+chr(10)
                            +'             sno                   int null,'+chr(13)+chr(10)
                            +'             ldsno                 bigint null,'+chr(13)+chr(10)
                            +'             skuid                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuname               varchar(50) null,'+chr(13)+chr(10)
                            +'             customerno            varchar(50) null,'+chr(13)+chr(10)
                            +'             color                 varchar(40) null,'+chr(13)+chr(10)
                            +'             colorid                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuspec               varchar(50) null,'+chr(13)+chr(10)
                            +'             quantity              numeric(16,4) null,'+chr(13)+chr(10)
                            +'             quantityuom           varchar(40) null,'+chr(13)+chr(10)
                            +'             skucards              varchar(100) null, '+chr(13)+chr(10)
                            +'             shipcusid              varchar(40) null, '+chr(13)+chr(10)
                            +'             shipcusname            varchar(100) null, '+chr(13)+chr(10)
                            +'             customsno              varchar(100) null, '+chr(13)+chr(10)
                            +'             outzoneno              varchar(100) null, '+chr(13)+chr(10)
                            +'             cusbillno              varchar(100) null, '+chr(13)+chr(10)
                            +'             lotcode                varchar(100) null, '+chr(13)+chr(10)
                            +'             ischeck                char(1) null, '+chr(13)+chr(10)
                            +'             jobnoorder             varchar(20) null, '+chr(13)+chr(10)
                            +'             snoorder               smallint null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)
                            );

      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskWareorderSku") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskWareorderSku'+chr(13)+chr(10)
                            +'create table #lskWareorderSku'+chr(13)+chr(10)
                            +'            (jobno                 varchar(20) null, '+chr(13)+chr(10)
                            +'             sno                   int null,         '+chr(13)+chr(10)
                            +'             cusbillno             varchar(30) null, '+chr(13)+chr(10)
                            +'             outzoneno             varchar(30) null, '+chr(13)+chr(10)
                            +'             lotcode               varchar(50) null, '+chr(13)+chr(10)
                            +'             skuid                 varchar(40) null, '+chr(13)+chr(10)
                            +'             skuname               varchar(50) null, '+chr(13)+chr(10)
                            +'             quantity              numeric(16,4) null, '+chr(13)+chr(10)
                            +'             netweight              numeric(16,4) null, '+chr(13)+chr(10)
                            +'             grossweight              numeric(16,4) null, '+chr(13)+chr(10)
                            +'             shipcusid             varchar(20) null, '+chr(13)+chr(10)
                            +'             shipcusname             varchar(30) null, '+chr(13)+chr(10)
                            +'             customsno             varchar(30) null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)                      
                            );

      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskSku") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskSku'+chr(13)+chr(10)
                            +'create table #lskSku'+chr(13)+chr(10)
                            +'            (skuid                 varchar(40) null, '+chr(13)+chr(10)
                            +'             skuname               varchar(50) null, '+chr(13)+chr(10)
                            +'             customerno            varchar(50) null, '+chr(13)+chr(10)
                            +'             color                 varchar(40) null, '+chr(13)+chr(10)
                            +'             grade                 varchar(40) null, '+chr(13)+chr(10)
                            +'             skuspec               varchar(50) null, '+chr(13)+chr(10)
                            +'             quantityuom           varchar(10) null, '+chr(13)+chr(10)
                            +'             skucards              varchar(100) null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)
                            );
     { if edtcusbillno.text<>'' then
      begin
         Getqryskudetailcashzx(true);

         Getqryskuxz(true);

         //lzw20111120
         OpenSql(qryTmp,'select top 1 costcusid,costcusname,gc=isnull(customer.cusname,"")+"("+isnull(customer.cushelpno,"")+")"'
                       +'  from wareordersku(nolock)            '
                       +'       left join customer (nolock)                   '
                       +'              on customer.cusid=wareordersku.shipcusid  '
                       +' where cusbillno="'+edtcusbillno.Text+'"'
                       );
         strcusid:=qrytmp.FieldByName('costcusid').asstring;
         strcusname:=qrytmp.FieldByName('costcusname').asstring;
         edtorigincusname.Text:=qrytmp.FieldByName('gc').asstring;
         //strblno:=qrytmp.FieldByName('blno').asstring;
      end;        }

      SetFormPosition(frmLocOutcashzx,true);
      Showmodal;
//      frmLocOutcashzx.visible:=true;
      Free;
   end;
end;

procedure TfrmLocOutcashzx.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior+[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=False;
  grdcashsku.ClearGroupColumns;
end;

procedure TfrmLocOutcashzx.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior-[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=True;
end;

procedure TfrmLocOutcashzx.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmLocOutcashzx.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure TfrmLocOutcashzx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (btncash.Enabled) or (not btnzx.Enabled) then
   begin
      Action := caFree;
   end else
   begin
      Action := caNone;
   end;
end;

procedure TfrmLocOutcashzx.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdcashsku);
  SetGroupbox(KGroupBox4);
  SetDxDbGrid(grdlotcode);
  SetGroupbox(KGroupBox5);
  SetDxDbGrid(grdskudetail);

  qryskudetailcashzx.connection:=_adoconnection;
  qryskuxz.connection:=_adoconnection;
  qryskudetail.connection:=_adoconnection;

  qryTmp.connection:=_adoconnection;
  qryTmp1.connection:=_adoconnection;
end;

procedure TfrmLocOutcashzx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
end;

procedure TfrmLocOutcashzx.FormDestroy(Sender: TObject);
begin
//  Lampchange(lsMenu);
  Application.onShowhint := nil;
//  qryskudetailcashzx.Close;
  frmLocOutcashzx:=nil;  
end;

procedure TfrmLocOutcashzx.pgcRelocationChange(Sender: TObject);
begin
   //
end;

procedure TfrmLocOutcashzx.GetSql;
var
   I:integer;
begin
   strFilter:='';
   if edtcustomerno.Text ='' then
   begin
      KMessageDlg('商品条码不能为空！',mtWarning,[mbOK],0);
      edtcustomerno.SetFocus;
      exit;
   end;

   if (edtcustomerno.Text<>'') then
      strFilter:=strFilter+' and sku.customerno="'+edtcustomerno.Text+'" ' ;
end;

procedure TfrmLocOutcashzx.qryskudetailcashzxAfterPost(DataSet: TDataSet);
begin
  if qryskudetailcashzx.fieldbyname('SKUID').asstring='' then
  begin
    qryskudetailcashzx.Delete;
  end;
end;

procedure TfrmLocOutcashzx.btncancellClick(Sender: TObject);
begin
   frmLocOutcashzx.Close;
end;

procedure TfrmLocOutcashzx.mitAddLocOldClick(Sender: TObject);
begin
   qryskudetailcashzx.DisableControls;
   //lzw20090609
   qryskudetailcashzx.First;
   while not qryskudetailcashzx.eof do
   begin
      qryskudetailcashzx.Edit;
      qryskudetailcashzx.FieldByName('checked').asstring:='T';
      qryskudetailcashzx.Next;
   end;
   qryskudetailcashzx.First;
   qryskudetailcashzx.EnableControls;
end;

procedure TfrmLocOutcashzx.mitDelLocOldClick(Sender: TObject);
begin
   qryskudetailcashzx.DisableControls;
   //lzw20090609
   qryskudetailcashzx.First;
    while not qryskudetailcashzx.eof do
    begin
       qryskudetailcashzx.Edit;
       qryskudetailcashzx.FieldByName('checked').asstring:='F';
       qryskudetailcashzx.Next;
    end;
   qryskudetailcashzx.First;
   qryskudetailcashzx.EnableControls;
end;

procedure TfrmLocOutcashzx.btncashClick(Sender: TObject);
var
   strcys:string;
   F:TextFile;
   StrOldjobno:string;
begin
//   GetConSkuInZX;
   OpenSQL(qryTmp,' select jobno,checkname from locationin (nolock) where cusbillno="'+edtcusbillno.Text+'" ');
   if qrytmp.FieldByName('checkname').AsString<>'' then
   begin
      KMessageDlg('对应进仓信息已审核，不允许重新校验！',mtWarning,[mbOK],0);
      Exit;
   end;
   StrOldjobno:=qrytmp.FieldByName('jobno').AsString;

   opensql(qryTmp,'if exists(select * from tempdb..sysobjects '
                             +'      where id=object_id("tempdb..#lskcheck") and sysstat & 0xf=3) '
                             +'   drop table #lskcheck '
                             +'select wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                             +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                             +'       quantity=wareordersku.quantity,quantityuom=sku.quantityuom,      '+chr(13)+chr(10)
                             +'       quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),                 '+chr(13)+chr(10)
                             +'       cys=isnull(wareordersku.quantity,0)-isnull(sum(isnull(#lskcheckdetailzx.quantity,0)),0), colorid=sku.grade,'+chr(13)+chr(10)
                             +'       ischeck=case when isnull((select top 1 jobno from #lskcheckdetailzx (nolock) '+chr(13)+chr(10)
                             +'                                  where #lskcheckdetailzx.jobnoorder=wareordersku.jobno  '+chr(13)+chr(10)
                             +'                                    and #lskcheckdetailzx.snoorder=wareordersku.sno      '+chr(13)+chr(10)
                             +'                                  ),"")="" then "" else "已扫描" end '+chr(13)+chr(10)
                             +'  into #lskCheck                                               '+chr(13)+chr(10)
                             +'  from #lskwareordersku wareordersku                           '+chr(13)+chr(10)
                             +'       left join #lsksku sku                           '+chr(13)+chr(10)
                             +'              on sku.skuid=wareordersku.skuid          '+chr(13)+chr(10)
                             +'       left join #lskcheckdetailzx(nolock)                          '+chr(13)+chr(10)
                             +'              on #lskcheckdetailzx.jobnoorder=wareordersku.jobno     '+chr(13)+chr(10)
                             +'             and #lskcheckdetailzx.snoorder=wareordersku.sno         '+chr(13)+chr(10)
                             +'             and #lskcheckdetailzx.lotcode=wareordersku.lotcode         '+chr(13)+chr(10)
                             +' where wareordersku.cusbillno="'+edtcusbillno.text+'"         '+chr(13)+chr(10)
                             +' group by wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                             +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                             +'       sku.quantityuom,wareordersku.quantity, wareordersku.quantity, sku.grade '+chr(13)+chr(10)
                             +' union all                                                               '+chr(13)+chr(10)
                             +'      select jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                             +'             lotcode,customerno,skuname,color,skuspec,skuid,                        '+chr(13)+chr(10)
                             +'             quantity=0,quantityuom,                                          '+chr(13)+chr(10)
                             +'             quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),                 '+chr(13)+chr(10)
                             +'             cys=sum(isnull(#lskcheckdetailzx.quantity,0))-0,colorid,'+chr(13)+chr(10)
                             +'             ischeck="已扫描"  '+chr(13)+chr(10)
                             +'        from #lskcheckdetailzx   '+chr(13)+chr(10)
                             +'       where #lskcheckdetailzx.snoorder=9999    '+chr(13)+chr(10)
                             +'         and replace(#lskcheckdetailzx.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                             +' group by jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                             +'          lotcode,customerno,skuname,color,skuspec,skuid,  '+chr(13)+chr(10)
                             +'          quantityuom, colorid                          '+chr(13)+chr(10)
                             +' order by 10,6,8,9 '+chr(13)+chr(10)
                             +'select quantity,skucards=customerno+skuspec+colorid, '+chr(13)+chr(10)
                             +'       quantityls=quantitysm,skuname,lotcode,  '+chr(13)+chr(10)
                             +'       skuspec,customerno,color,cys  '+chr(13)+chr(10)
                             +'  from #lskCheck (nolock)                             '+chr(13)+chr(10)
                             +' where isnull(cys,0)<>0                               '+chr(13)+chr(10)
                      );

   if qryTmp.recordcount>0  then
   begin
      ExecSql(dataTmp.qrytmp2,'if exists(select * from tempdb..sysobjects '
                          +'      where id=object_id("tempdb..#lskchecktxtzxzd") and sysstat & 0xf=3) '
                          +'   drop table #lskchecktxtzxzd      '
                          +' create table #lskchecktxtzxzd (    '
                          +'    skucards       varchar(100),    '
                          +'    lotcode        varchar(100),    '
                          +'    quantity       varchar(100),    '
                          +'    quantityls     varchar(100),    '
                          +'    shortsl        varchar(100)  )  '
                          +'insert into #lskchecktxtzxzd                '
                          +'select skucards=" 商品条码",lotcode="    箱号",ddsl="        订单数量",smsl="   扫描数量",shortsl="剩余数"  '
             );
      qrytmp.First;
      while not qrytmp.Eof do
      begin
//         Strcys:=IntToStr(strtoint(qryTmp.FieldByName('smsl').asstring)-strtoint(qryTmp.FieldByName('ddsl').asstring));

         ExecSql(dataTmp.qrytmp2, 'insert into #lskchecktxtzxzd                                           '
                         +'select skucards="'+qryTmp.FieldByName('skucards').asstring+'",                 '
                         +'       lotcode=" '+qryTmp.FieldByName('lotcode').asstring+'",                  '
                         +'       quantity="    '+qryTmp.FieldByName('quantity').asstring+'",             '
                         +'       quantityls="    '+qryTmp.FieldByName('quantityls').asstring+'",         '
                         +'       shortsl="    '+qryTmp.FieldByName('cys').asstring+'"                   '
                 );
         qrytmp.next;
      end;
      openSql(datatmp.qrytmp2,'select * from  #lskchecktxtzxzd          ');
      if datatmp.qrytmp2.recordcount>0 then
      begin
         //调用声音文件
         frmdysounds.btnsoundsClick(self);
         if GetExedir+'\'+'整箱扫描差异'+strjobno+'.txt'='' then
         begin
            QueryExportTxt('#lskchecktxtzx').SaveToFile(GetExedir+'\'+'整箱扫描差异'+strjobno+'.txt');
         end else
         begin
            DeleteFile(GetExedir+'\'+'整箱扫描差异'+strjobno+'.txt') ;
            QueryExportTxt('#lskchecktxtzx').SaveToFile(GetExedir+'\'+'整箱扫描差异'+strjobno+'.txt');
         end;
         ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'整箱扫描差异'+strjobno+'.txt'),'','',SW_SHOW);
      end;
   end;

   if (Kmessagedlg('是否将扫描数据导入？',mtInformation,[mbYes,mbNo],0)<>mrYes) then exit;

   _ADOConnection.Starttransaction;
   try
      strlocationbillno:=GetLocationbillNo;
      strjobno:=genJobno('LI',strlocationbillno);
      ExecSql(dataTmp.qryTmp,'delete locationin                                              '+chr(13)+chr(10)
                 +'  where jobno="'+StrOldjobno+'"                                                  '+chr(13)+chr(10)
                 +' delete locationinitem                                                        '+chr(13)+chr(10)
                 +'  where jobno="'+StrOldjobno+'"                                                  '+chr(13)+chr(10)
                 +' delete locationindetail                                                      '+chr(13)+chr(10)
                 +'  where jobno="'+StrOldjobno+'"                                                  '+chr(13)+chr(10)
                 +' delete locinskudetail                                                        '+chr(13)+chr(10)
                 +'  where jobno="'+StrOldjobno+'"                                                  '+chr(13)+chr(10)
                 );
      //locationin
      ExecSql(qryTmp,'update locationinoutcon set jobno="'+strjobno+'",cuscheck="T"    '+chr(13)+chr(10)
                    +' where cusbillno="'+edtcusbillno.Text+'"                             '+chr(13)+chr(10)
                    +'update locationinoutconsku set jobno="'+strjobno+'"              '+chr(13)+chr(10)
                    +' where cusbillno="'+edtcusbillno.Text+'"                             '+chr(13)+chr(10)
                    +'update #lskcheckdetailzx set jobno="'+strjobno+'"                '+chr(13)+chr(10)
                    +' where jobno="'+edtcusbillno.Text+'"                             '+chr(13)+chr(10)

                    +'insert into locationin                                                       '+chr(13)+chr(10)
                    +'       (jobno, operationtype,userid, username,iuserid, iusername,            '+chr(13)+chr(10)
                    +'        createname, createdate,taskdate,locationbillno,cusbillno,             '+chr(13)+chr(10)
                    +'       skucostclasscd,taskiscomplete,warerentcounttype,warerentcounttypeout,  '+chr(13)+chr(10)
                    +'       costcusid,costcusname,cusid,cusname,Shippercusid,ShippercusName,       '+chr(13)+chr(10)
                    +'       contwithloca, lottracked, countrent,countrentout, remark,shipcusname) '+chr(13)+chr(10)
                    +'VALUES( "'+strjobno+'",1,"'+_userid+'","'+_username+'","'+_userid+'","'+_username+'",   '+chr(13)+chr(10)
                    +'       "'+_loginname+'","'+datetostr(GetServerDate)+'","'+datetostr(GetServerDate)+'","'+strlocationbillno+'","'+edtcusbillno.Text+'",    '+chr(13)+chr(10)
                    +'       "COMMON","F","IR","",  '+chr(13)+chr(10)
                    +'       "'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'", '+chr(13)+chr(10)
                    +'       "F","F","T","F","","")                '+chr(13)+chr(10)
                       );
      //locationinitem
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#inputdetailzx") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                    +'   drop table #inputdetailzx                                                               '+chr(13)+chr(10)
                    +' select jobno="'+Strjobno+'",sno=0,skuid,skuname,qualityname="正品",                                    '+chr(13)+chr(10)
                    +'        userid="'+_userid+'",username="'+_username+'",quantityuom,                       '+chr(13)+chr(10)
                    +'        quantity=sum(isnull(quantity,0)),                                                '+chr(13)+chr(10)
                    +'        taskdate="'+datetostr(GetServerDate)+'",                          '+chr(13)+chr(10)
                    +'        cusid="'+strcusid+'",                            '+chr(13)+chr(10)
                    +'        cusname="'+strcusname+'",                        '+chr(13)+chr(10)
                    +'        shippercusid="'+strcusid+'",                     '+chr(13)+chr(10)
                    +'        shippercusname="'+strcusname+'",                 '+chr(13)+chr(10)
                    +'        iuserid="'+_userid+'",                            '+chr(13)+chr(10)
                    +'        iusername="'+_username+'",                        '+chr(13)+chr(10)
                    +'        locname=space(30),locid=space(30),                                               '+chr(13)+chr(10)
                    +'        operationtype=1,                                                                 '+chr(13)+chr(10)
                    +'        operationdate="'+datetostr(GetServerDate())+'",                '+chr(13)+chr(10)
                    +'        warerentcounttype="IR",countrent="T",                                            '+chr(13)+chr(10)
                    +'        locationbillno="'+strlocationbillno+'",              '+chr(13)+chr(10)
                    +'        operationname="'+_Loginname+'",                                                  '+chr(13)+chr(10)
                    +'        costcusid="'+strcusid+'",                        '+chr(13)+chr(10)
                    +'        costcusname="'+strcusname+'",                    '+chr(13)+chr(10)
                    +'        cusbillno="'+edtcusbillno.text+'",                        '+chr(13)+chr(10)
                    +'        shipcusid,                                      '+chr(13)+chr(10)
                    +'        shipcusname,                                         '+chr(13)+chr(10)
                    +'        customsno,                                         '+chr(13)+chr(10)
                    +'        customerno=serialno                                 '+chr(13)+chr(10)
                    +'   into #inputdetailzx                                                                     '+chr(13)+chr(10)
//                    +'   from #lskcheckdetailzx (nolock)                                                       '+chr(13)+chr(10)
                    +'   from locationinoutconsku consku (nolock)                                                     '+chr(13)+chr(10)
                    +'  where cusbillno="'+edtcusbillno.Text+'"                                                       '+chr(13)+chr(10)
//                    +'    and ischeck="T"                                                                   '+chr(13)+chr(10)
                    +'  group by jobno,skuid,skuname,quantityuom,shipcusid,shipcusname,customsno,serialno      '+chr(13)+chr(10)
                    +'declare @sno int                                                                         '+chr(13)+chr(10)
                    +' select @sno=0                                                                           '+chr(13)+chr(10)
                    +' update #inputdetailzx set sno=@sno,@sno=@sno+1                                            '+chr(13)+chr(10)
                    +' insert into locationinitem                                                              '+chr(13)+chr(10)
                    +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,skuid,skuname,                               '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                    +'        operationname,costcusid,costcusname,quantitytask,cusbillno,                       '+chr(13)+chr(10)
                    +'        shipcusid,shipcusname,customsno,customerno)  '+chr(13)+chr(10)
                    +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,skuid,skuname,                  '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                    +'        operationname,costcusid,costcusname,quantitytask=quantity,cusbillno,         '+chr(13)+chr(10)
                    +'        shipcusid,shipcusname,customsno,customerno       '+chr(13)+chr(10)
                    +'   from #inputdetailzx (nolock)                                                            '+chr(13)+chr(10)
                    +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                    );

//locationindetail导入
      ExecSql(qryTmp,' insert into locationindetail                                                            '+chr(13)+chr(10)
                    +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                 '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusbillno,shipcusid,shipcusname,customsno)                                                 '+chr(13)+chr(10)
                    +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,ldsno=sno,ldsnoin=sno,skuid,skuname,'+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusbillno,shipcusid,shipcusname,customsno                '+chr(13)+chr(10)
                    +'   from #inputdetailzx (nolock)                                                            '+chr(13)+chr(10)
                    );
//locinskudetail导入
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#inputskudetailzx") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                    +'   drop table #inputskudetailzx                                                            '+chr(13)+chr(10)
                    +' select #inputdetailzx.jobno,#inputdetailzx.sno,ldsno=#inputdetailzx.sno,detailsno=null,         '+chr(13)+chr(10)
                    +'	 #inputdetailzx.skuid,#inputdetailzx.skuname,serialno=#inputdetailzx.customerno,    '+chr(13)+chr(10)
                    +'	 quantity=sum(#lskcheckdetailzx.quantity),quantityremain=sum(#lskcheckdetailzx.quantity),'+chr(13)+chr(10)
                    +'	 #inputdetailzx.quantityuom,#inputdetailzx.qualityname,color=#lskcheckdetailzx.color,         '+chr(13)+chr(10)
                    +'        #lskcheckdetailzx.skuspec,#inputdetailzx.locid,#inputdetailzx.locname,              '+chr(13)+chr(10)
                    +'        #inputdetailzx.costcusid,#inputdetailzx.costcusname,                           '+chr(13)+chr(10)
                    +'	 #inputdetailzx.cusid,#inputdetailzx.cusname,                                   '+chr(13)+chr(10)
                    +'	 #inputdetailzx.shippercusid,#inputdetailzx.shippercusname,                   '+chr(13)+chr(10)
                    +'	 #inputdetailzx.userid,#inputdetailzx.username,#inputdetailzx.operationdate,  '+chr(13)+chr(10)
                    +'        #inputdetailzx.iuserid,#inputdetailzx.iusername,tracktype="TO"          '+chr(13)+chr(10)
                    +'   into #inputskudetailzx                                                       '+chr(13)+chr(10)
//                    +'   from #lskcheckdetailzx  (nolock)                                             '+chr(13)+chr(10)
                    +'   from locationinoutconsku  #lskcheckdetailzx  (nolock)                        '+chr(13)+chr(10)
                    +'        left join #inputdetailzx (nolock)                                       '+chr(13)+chr(10)
                    +'               on #lskcheckdetailzx.skuid=#inputdetailzx.skuid                  '+chr(13)+chr(10)
                    +'  where #lskcheckdetailzx.jobno="'+strjobno+'"                                                    '+chr(13)+chr(10)
//                    +'  where #lskcheckdetailzx.ischeck="T"                                              '+chr(13)+chr(10)
                    +'  group by #inputdetailzx.jobno,#inputdetailzx.sno,              '+chr(13)+chr(10)
                    +'	 #inputdetailzx.skuid,#inputdetailzx.skuname,#inputdetailzx.customerno,    '+chr(13)+chr(10)
                    +'	 #inputdetailzx.quantityuom,#inputdetailzx.qualityname,#lskcheckdetailzx.color,         '+chr(13)+chr(10)
                    +'        #lskcheckdetailzx.skuspec,#inputdetailzx.locid,#inputdetailzx.locname,              '+chr(13)+chr(10)
                    +'        #inputdetailzx.costcusid,#inputdetailzx.costcusname,                           '+chr(13)+chr(10)
                    +'	 #inputdetailzx.cusid,#inputdetailzx.cusname,                                   '+chr(13)+chr(10)
                    +'	 #inputdetailzx.shippercusid,#inputdetailzx.shippercusname,                   '+chr(13)+chr(10)
                    +'	 #inputdetailzx.userid,#inputdetailzx.username,#inputdetailzx.operationdate,    '+chr(13)+chr(10)
                    +'        #inputdetailzx.iuserid,#inputdetailzx.iusername                '+chr(13)+chr(10)

                    +'declare @sno int                                                             '+chr(13)+chr(10)
                    +' select @sno=0                                                                '+chr(13)+chr(10)
                    +' update #inputskudetailzx set detailsno=@sno,@sno=@sno+1                         '+chr(13)+chr(10)
                    +' insert into locinskudetail                                                   '+chr(13)+chr(10)
                    +'        (jobno,sno,ldsno,detailsno,skuid,                                     '+chr(13)+chr(10)
                    +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                    +'	      qualityname,color,skuspec,locid,locname,                          '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,       '+chr(13)+chr(10)
                    +'	      userid,username,operationdate,iuserid,iusername,tracktype)        '+chr(13)+chr(10)
                    +' select jobno,sno,detailsno,detailsno,skuid,                                      '+chr(13)+chr(10)
                    +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                    +'	      qualityname,color,skuspec,locid,locname,                         '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,      '+chr(13)+chr(10)
                    +'	      userid,username,operationdate,iuserid,iusername,tracktype         '+chr(13)+chr(10)
                    +'   from #inputskudetailzx (nolock)                                               '+chr(13)+chr(10)
                    );
//更新主表
      ExecSql(qryTmp,' update locationin                                                                       '+chr(13)+chr(10)
                    +'    set operationdate=(select top 1 operationdate from #inputdetailzx                        '+chr(13)+chr(10)
                    +'                        where #inputdetailzx.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                    +'        quantity=(select sum(isnull(quantity,0)) from #inputdetailzx                         '+chr(13)+chr(10)
                    +'                        where #inputdetailzx.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                    +'        quantitytasked=(select sum(isnull(quantity,0)) from #inputdetailzx                   '+chr(13)+chr(10)
                    +'                        where #inputdetailzx.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                    +'        operationname="'+_loginname+'",                                                  '+chr(13)+chr(10)
                    +'        blno="'+strblno+'",                                                               '+chr(13)+chr(10)
                    +'        taskisComplete="T",                                                              '+chr(13)+chr(10)
                    +'        cusid=costcusid,cusname=costcusname,                                             '+chr(13)+chr(10)
                    +'        shippercusid=costcusid,shippercusname=costcusname                                '+chr(13)+chr(10)
                    +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                    +' update locinskudetail set                                                               '+chr(13)+chr(10)
                    +'        skubrand=locationindetail.customsno                                             '+chr(13)+chr(10)
                    +'   from locationindetail                               '+chr(13)+chr(10)
                    +'  where locationindetail.jobno=locinskudetail.jobno     '+chr(13)+chr(10)
                    +'    and locationindetail.sno=locinskudetail.sno          '+chr(13)+chr(10)
                    +'    and locationindetail.ldsno=locinskudetail.ldsno      '+chr(13)+chr(10)

                    +'    and locationindetail.jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                    );

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   KMessageDlg('完成数据校验!',mtInformation,[mbOK],0);
   grdcashsku.DataSource:=nil;
   btncash.Enabled:=False;
   frmLocOutcashzx.Close;
end;

procedure TfrmLocOutcashzx.edtcustomernoExit(Sender: TObject);
var
   maxsno:integer;
   strcustomserno:string;
   blnNotcheck:boolean;
   strGetSkuid:string;
   //lzw20120711
   strGetskucards:string;
   str_customsno,str_shipcusid,str_shipcusname,str_outzoneno:string;
   blnSkuNotExists:boolean;
   curNode: TdxDbGridNode;
begin
   if edtcustomerno.text='' then  exit;
   if edtcusbillno.Text='' then
   begin
      KMessageDlg('客户单号不能为空！',mtWarning,[mbOK],0);
      edtcustomerno.clear;
      edtcusbillno.setfocus;
      exit;
   end;
   if edtlotcode.Text='' then
   begin
      KMessageDlg('箱号不能为空！',mtWarning,[mbOK],0);
      edtcustomerno.clear;
      edtlotcode.setfocus;
      exit;
   end;
   //whl20111206 高效判断扣数不能为负
   if (ckbcheck.Checked) and (quantitysm1.SummaryFooterValue=0) then
   begin
      frmdysounds.btnsoundsClick(self);
      KMessageDlg('商品"'+edtcustomerno.Text+'"数量小于0,不能再扣数操作',mtInformation,[mbOK],0);

      edtcusbillno.Enabled:=false;
      edtlotcode.Enabled:=false;
      edtcustomerno.clear;
      edtcustomerno.setfocus;
      exit;
   end;

   opensql(datatmp.qryTmp,'select maxsno=isnull(max(sno),0)+1 from #lskcheckdetailzx '
                         +' where jobno="'+edtcusbillno.Text+'" '
                         +'   and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
          );
   maxsno:=datatmp.qryTmp.FieldByName('maxsno').asinteger;

   //lzw20101201
   opensql(datatmp.qryTmp,' select cd=len(replace("'+edtcustomerno.Text+'"," ","")),customerno=replace("'+edtcustomerno.Text+'"," ","") '
          );
   strcustomserno:=datatmp.qryTmp.FieldByName('customerno').AsString;
   if (datatmp.qryTmp.FieldByName('cd').asinteger=14) and (Pos('七匹狼',strcusname)>0)  then
   begin
      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmxzx") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmxzx                                         '+chr(13)+chr(10)
                   +'select jobno="'+edtcusbillno.Text+'", sno='+inttostr(maxsno)+',ldsno=0,  '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,sku.skucards,                 '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=sku.color, colorid=sku.grade,     '+chr(13)+chr(10)
                   +'       skuspec=sku.skuspec,cusbillno="'+edtcusbillno.text+'",            '+chr(13)+chr(10)
                   +iif(ckbcheck.Checked,'quantity=-1,' ,'quantity=1,')
                   +'       quantityuom,lotcode="'+strthelotcode+'",jobnoorder="'+strjobnoorder+'",snoorder=9999          '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmxzx                                               '+chr(13)+chr(10)
                   +'  from sku(nolock)                   '+chr(13)+chr(10)
                   +' where rtrim(sku.skucards)=rtrim("'+strcustomserno+'")  '+chr(13)+chr(10)
                   );
   end else
   begin
      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmxzx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmxzx                                        '+chr(13)+chr(10)
                   +'select jobno="'+edtcusbillno.Text+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,sku.skucards,             '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=sku.color,colorid=sku.grade,        '+chr(13)+chr(10)//whl 20111206 加了 colorid=sku.grade, 
                   +'       skuspec=sku.skuspec,cusbillno="'+edtcusbillno.text+'",   '+chr(13)+chr(10)
                   +iif(ckbcheck.Checked,'quantity=-1,' ,'quantity=1,' )
                   +'       quantityuom,lotcode="'+strthelotcode+'",jobnoorder=createname,snoorder=9999   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmxzx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock)                   '+chr(13)+chr(10)
                   +' where rtrim(sku.skucards)=rtrim("'+strcustomserno+'")  '+chr(13)+chr(10)
                  );
   end;

   opensql(qrytmp,'select #lskcheckdetailmxzx.* from #lskcheckdetailmxzx(nolock)               '+chr(13)+chr(10)
                 +' where jobno="'+edtcusbillno.Text+'"                                    '+chr(13)+chr(10)
          );
   strGetSkuid:=qrytmp.FieldByname('skuid').AsString;
   //lzw20120711
   strGetskucards:=qrytmp.FieldByname('skucards').AsString;
   blnNotcheck:=false;
   if qrytmp.RecordCount=0 then
   begin
      //调用声音文件
      frmdysounds.btnsoundsClick(self);
      begin
         blnNotcheck:=True;
         KMessageDlg('商品"'+edtcustomerno.Text+'"在商品资料不存在,不能导入',mtInformation,[mbOK],0);
         ExecSql(datatmp.qrytmp2,'delete #lskcheckdetailmxzx            '+chr(13)+chr(10)
                                +' where jobno="'+edtcusbillno.Text+'"        '+chr(13)+chr(10)
                                +'   and sno='+inttostr(maxsno)+'    '+chr(13)+chr(10)
                  );
      end;
   end else
   begin
      //lzw判断扣数后的数量
      opensql(qrytmp,'select #lskcheckdetailmxzx.skucards '
                    +'  from #lskcheckdetailmxzx left join #lskcheckdetailzx '
                    +'                                on #lskcheckdetailzx.skuid=#lskcheckdetailmxzx.skuid '
                    +' group by #lskcheckdetailmxzx.skucards,#lskcheckdetailmxzx.quantity '
                    +'having sum(isnull(#lskcheckdetailzx.quantity,0))+isnull(#lskcheckdetailmxzx.quantity,0)<0 '
               );
      if qrytmp.RecordCount>0 then
      begin
         //调用声音文件
         frmdysounds.btnsoundsClick(self);
         begin
            blnNotcheck:=True;
            KMessageDlg('商品"'+qryTmp.FieldByName('skucards').AsString+'"数量小于0,不能再扣数操作',mtInformation,[mbOK],0);
            ExecSql(datatmp.qrytmp2,'delete #lskcheckdetailmxzx            '+chr(13)+chr(10)
                                   +' where jobno="'+edtcusbillno.Text+'"        '+chr(13)+chr(10)
                                   +'   and sno='+inttostr(maxsno)+'    '+chr(13)+chr(10)
                     );
         end
      end;
   end;

   if not blnNotcheck then
   begin
      //whl 20111206 为jobnoorder，snoorder赋值
      OpenSql(qryTmp,' select jobno,sno,skuid          '
                    +'   from wareordersku(nolock)     '
                    +'  where skuid="'+strGetSkuid+'"  '
                    +'    and wareordersku.cusbillno="'+edtcusbillno.text+'"     '+chr(13)+chr(10)
                    +'    and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                    );
      if qryTmp.RecordCount>0 then  //所扫描的商品代码跟指令商品一致
      begin
         ExecSql(datatmp.qryTmp2,  ' update #lskcheckdetailmxzx                                 '+chr(13)+chr(10)
                          +'    set jobnoorder="'+qrytmp.FieldByname('jobno').AsString+'" ,          '+chr(13)+chr(10)
                          +'        snoorder="'+qrytmp.FieldByname('sno').AsString+'"           '+chr(13)+chr(10)
                          +'  where jobno="'+edtcusbillno.Text+'"                           '+chr(13)+chr(10)
                          +'    and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                          );
         str_customsno:= strcustomsno;
         str_shipcusid:= strshipcusid;
         str_shipcusname:=strshipcusname;
         str_outzoneno:=stroutzoneno;
         blnSkuNotExists:=False;
         //lzw20120711定位具体的商品
         qryskudetailcashzx.locate('skucards',strGetskucards,[loCaseInsensitive, loPartialKey]);
         qryskudetailcashzx.Edit;
         if not ckbcheck.Checked then
         begin
            qryskudetailcashzx.FieldByName('quantitysm').AsFloat:=qryskudetailcashzx.FieldByName('quantitysm').AsFloat+1;
            qryskudetailcashzx.FieldByName('cys').AsFloat:=qryskudetailcashzx.FieldByName('cys').AsFloat-1;
         end else
         begin
            qryskudetailcashzx.FieldByName('quantitysm').AsFloat:=qryskudetailcashzx.FieldByName('quantitysm').AsFloat-1;
            qryskudetailcashzx.FieldByName('cys').AsFloat:=qryskudetailcashzx.FieldByName('cys').AsFloat+1;
         end;
      end else //所扫描的商品代码跟指令商品不一致
      begin
         frmdysounds.btnsoundsClick(self);
         ExecSql(qryTmp,'   '+chr(13)+chr(10)
                       +'  insert into #lskSku    '+chr(13)+chr(10)
                       +'   (skuid,skuname,customerno,color,grade,skuspec,quantityuom,skucards )     '+chr(13)+chr(10)
                       +'  select distinct skuid,skuname,customerno,color,colorid,skuspec,quantityuom,skucards   '+chr(13)+chr(10)
                       +'    from #lskcheckdetailmxzx                                        '+chr(13)+chr(10)
                 );
         str_customsno:= '';
         str_shipcusid:= '';
         str_shipcusname:='';
         str_outzoneno:='';
         blnSkuNotExists:=True;

      end; 

      openSql(qryskudetail,'insert into #lskcheckdetailzx          '+chr(13)+chr(10)
          +'select jobno, sno,ldsno=0,                          '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,colorid,                              '+chr(13)+chr(10)
          +'       skuspec,quantity,quantityuom,skucards,                      '+chr(13)+chr(10)
          +'       shipcusid="'+str_shipcusid+'", shipcusname="'+str_shipcusname+'",'+chr(13)+chr(10)
          +'       customsno="'+str_customsno+'", outzoneno="'+str_outzoneno+'",cusbillno,lotcode,"F",jobnoorder,snoorder  '+chr(13)+chr(10)
          +'  from #lskcheckdetailmxzx                              '+chr(13)+chr(10)
          +' where jobno="'+edtcusbillno.Text+'"                           '+chr(13)+chr(10)
          +'   and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
          +'   select  * from #lskcheckdetailzx                        '+chr(13)+chr(10)
          +'    where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
          +'    order by sno            '+chr(13)+chr(10)

         );
 {     openSql(qryskudetailcashzx,'select #lskcheckdetailzx.lotcode,sku.customerno,sku.color,sku.skuspec,'+chr(13)+chr(10)
                                +'       wareordersku.quantity,sku.skucards, sku.skuname,quantityuom=sku.quantityuom,        '+chr(13)+chr(10)
                                +'       quantitysm=sum(#lskcheckdetailzx.quantity),colorid=sku.grade,wareordersku.outzoneno,  '+chr(13)+chr(10)
                                +'       cys=isnull(wareordersku.quantity,0)-sum(isnull(#lskcheckdetailzx.quantity,0)) '+chr(13)+chr(10)
                                +'  from #lskcheckdetailzx(nolock)                          '+chr(13)+chr(10)
                                +'       left join sku(nolock)                          '+chr(13)+chr(10)
                                +'              on sku.skuid=#lskcheckdetailzx.skuid         '+chr(13)+chr(10)
                                +'       left join wareordersku(nolock)                          '+chr(13)+chr(10)
                                +'              on #lskcheckdetailzx.skuid=wareordersku.skuid         '+chr(13)+chr(10)
                                +'             and #lskcheckdetailzx.lotcode=wareordersku.lotcode         '+chr(13)+chr(10)
                                +' where #lskcheckdetailzx.cusbillno like "%'+edtcusbillno.text+'%"         '+chr(13)+chr(10)
                                +'   and #lskcheckdetailzx.lotcode="'+edtlotcode.Text+'"             '+chr(13)+chr(10)
                                +' group by #lskcheckdetailzx.lotcode,sku.customerno,sku.color,sku.skuspec,sku.grade,'+chr(13)+chr(10)
                                +'       sku.skucards,sku.skuname,wareordersku.quantity,sku.quantityuom,wareordersku.outzoneno         '+chr(13)+chr(10)
                                +' order by #lskcheckdetailzx.lotcode,sku.customerno,sku.color,sku.skuspec '
                            ); }
      if blnSkuNotExists then
         Getqryskudetailcashzx(false);

      //..定位
      curNode := grdcashsku.FindNodeByKeyValue(strGetSkuid);
      if curNode<>nil then
      begin
         curNode.Expand(True);
         curNode.Focused := True;
      end;
      //..
      btnzx.Enabled:=True;
   end;
   if ckbcheck.Checked then
      ckbcheck.Checked:=false;

   edtcusbillno.Enabled:=false;
   edtlotcode.Enabled:=false;
   edtcustomerno.clear;
   edtcustomerno.setfocus;
end;

procedure TfrmLocOutcashzx.edtcustomernoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtcustomerno.text='' then exit;
end;

procedure TfrmLocOutcashzx.btnzxClick(Sender: TObject);
var
   Strcys:string;
   maxsnocon:string;
begin
   opensql(qryTmp1,'if exists(select * from tempdb..sysobjects '
                             +'      where id=object_id("tempdb..#lskcheck") and sysstat & 0xf=3) '
                             +'   drop table #lskcheck '
                             +'select wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                             +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                             +'       quantity=wareordersku.quantity,quantityuom=sku.quantityuom,      '+chr(13)+chr(10)
                             +'       quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),                 '+chr(13)+chr(10)
                             +'       cys=isnull(wareordersku.quantity,0)-isnull(sum(isnull(#lskcheckdetailzx.quantity,0)),0), colorid=sku.grade,'+chr(13)+chr(10)
                             +'       ischeck=case when isnull((select top 1 jobno from #lskcheckdetailzx (nolock) '+chr(13)+chr(10)
                             +'                                  where #lskcheckdetailzx.jobnoorder=wareordersku.jobno  '+chr(13)+chr(10)
                             +'                                    and #lskcheckdetailzx.snoorder=wareordersku.sno      '+chr(13)+chr(10)
                             +'                                  ),"")="" then "" else "已扫描" end '+chr(13)+chr(10)
                             +'  into #lskCheck                                               '+chr(13)+chr(10)
                             +'  from #lskwareordersku wareordersku                           '+chr(13)+chr(10)
                             +'       left join #lsksku sku                           '+chr(13)+chr(10)
                             +'              on sku.skuid=wareordersku.skuid          '+chr(13)+chr(10)
                             +'       left join #lskcheckdetailzx(nolock)                          '+chr(13)+chr(10)
                             +'              on #lskcheckdetailzx.jobnoorder=wareordersku.jobno     '+chr(13)+chr(10)
                             +'             and #lskcheckdetailzx.snoorder=wareordersku.sno         '+chr(13)+chr(10)
                             +'             and #lskcheckdetailzx.lotcode=wareordersku.lotcode         '+chr(13)+chr(10)
                             +' where wareordersku.cusbillno="'+edtcusbillno.text+'"         '+chr(13)+chr(10)
                             +'   and replace(wareordersku.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)

                             +' group by wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                             +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                             +'       sku.quantityuom,wareordersku.quantity, wareordersku.quantity, sku.grade '+chr(13)+chr(10)
                             +' union all                                                               '+chr(13)+chr(10)
                             +'      select jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                             +'             lotcode,customerno,skuname,color,skuspec,skuid,                        '+chr(13)+chr(10)
                             +'             quantity=0,quantityuom,                                          '+chr(13)+chr(10)
                             +'             quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),                 '+chr(13)+chr(10)
                             +'             cys=sum(isnull(#lskcheckdetailzx.quantity,0))-0,colorid,'+chr(13)+chr(10)
                             +'             ischeck="已扫描"  '+chr(13)+chr(10)
                             +'        from #lskcheckdetailzx   '+chr(13)+chr(10)
                             +'       where #lskcheckdetailzx.snoorder=9999    '+chr(13)+chr(10)
                             +'         and replace(#lskcheckdetailzx.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                             +' group by jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                             +'          lotcode,customerno,skuname,color,skuspec,skuid,  '+chr(13)+chr(10)
                             +'          quantityuom, colorid                          '+chr(13)+chr(10)
                             +' order by 10,6,8,9 '+chr(13)+chr(10)
                             +'select quantity,skucards=customerno+skuspec+colorid, '+chr(13)+chr(10)
                             +'       quantityls=quantitysm,skuname=skuname,  '+chr(13)+chr(10)
                             +'       skuspec,customerno,color  '+chr(13)+chr(10)
                             +'  from #lskCheck (nolock)                             '+chr(13)+chr(10)
                             +' where isnull(cys,0)<>0                               '+chr(13)+chr(10)
                      );

   if qrytmp1.recordcount>0 then
   begin
      ExecSql(datatmp.qrytmp2,'if exists(select * from tempdb..sysobjects '
                             +'      where id=object_id("tempdb..#lskchecktxtzx") and sysstat & 0xf=3) '
                             +'   drop table #lskchecktxtzx '
                             +' create table #lskchecktxtzx( '
                             +'    skucards       varchar(100), '
                             +'    skuname        varchar(100), '
                             +'    ddsl           varchar(100), '
                             +'    smsl           varchar(100),  '
                             +'    shortsl        varchar(100)  )  '
                             +'insert into #lskchecktxtzx                '
                             +'select skucards=" 商品条码",skuname="    品名",ddsl="        订单数量",smsl="扫描数量",shortsl="剩余数"  '
             );
      qrytmp1.First;
      while not qrytmp1.Eof do
      begin
         Strcys:=IntToStr(strtoint(qrytmp1.FieldByName('quantity').asstring)-strtoint(qrytmp1.FieldByName('quantityls').asstring));

         OpenSql(datatmp.qrytmp2, 'insert into #lskchecktxtzx                                             '
                         +'select skucards="'+qrytmp1.FieldByName('skucards').asstring+'",                          '
                         +'       skuname=" '+qrytmp1.FieldByName('skuname').asstring+'",                  '
                         +'       ddsl="    '+qrytmp1.FieldByName('quantity').asstring+'",                  '
                         +'       smsl="    '+qrytmp1.FieldByName('quantityls').asstring+'",                '
                         +'       shortsl="  '+strcys+'"                                                  '
                         +'select * from  #lskchecktxtzx                                                  '

                 );
         qrytmp1.next;
      end;
      if datatmp.qrytmp2.recordcount>0 then
      begin
         //调用声音文件
         frmdysounds.btnsoundsClick(self);
         if GetExedir+'\'+'扫描记录'+strjobno+'.txt'='' then
         begin
            QueryExportTxt('#lskchecktxtzx').SaveToFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt');
         end else
         begin
            DeleteFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt') ;
            QueryExportTxt('#lskchecktxtzx').SaveToFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt');
         end;
       //客户要求不打开差异文本
       //   ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'扫描记录'+strjobno+'.txt'),'','',SW_SHOW);

      end;
      if (Kmessagedlg('此箱存在差异,是否关箱？',mtInformation,[mbNo,mbyes],1,mbNo)<>mryes) then exit ;
   end;
   execsql(qrytmp1,'update #lskcheckdetailzx set ischeck="T" where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","") ');

   //lzw20101115
{  //whl20111208
   opensql(qrytmp,'select 1 from locationinoutcon '
                 +' where conno="'+edtlotcode.text+'" '
                 +'   and operationtype="1" '
                 +'   and isnull(cuscheck,"")="T" '
          );
   if qrytmp.RecordCount>0 then exit;
    }
   opensql(qrytmp,'select 1 from locationinoutcon '
                 +' where replace(conno," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                 +'   and operationtype="1" '
//                 +'   and isnull(cuscheck,"")="" '
          );
   _ADOConnection.Starttransaction;
   try
      if qrytmp.RecordCount>0 then
      begin
         //lzw20101115
         OpenSql(qrytmp, '  select sno=isnull(max(sno),0)+1 from locationinoutcon where cusbillno="'+edtcusbillno.Text+'" ');
         maxsnocon:=qrytmp.Fieldbyname('sno').AsString;
         ExecSql(qryTmp,'delete locationinoutconsku                   '+chr(13)+chr(10)
{                       +' where jobno in (select jobno from locationinoutcon  '+chr(13)+chr(10)
                       +'                  where conno="'+edtlotcode.Text+'")  '+chr(13)+chr(10)}
                       +' where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                       +'delete locationinoutcon                               '+chr(13)+chr(10)
                       +' where replace(conno," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                       +'   and operationtype=1                                '+chr(13)+chr(10)
                       +' insert into locationinoutcon                                                            '+chr(13)+chr(10)
                       +'        (jobno,userid,username,conquantity,conno,cusbillno,sno,iscon,operationtype,ischeck)                '+chr(13)+chr(10)
                       +' select jobno="'+edtcusbillno.Text+'",userid="'+_userid+'",username="'+_username+'",              '+chr(13)+chr(10)
                       +'        conquantity=1,conno="'+strthelotcode+'",cusbillno="'+edtcusbillno.text+'",                    '+chr(13)+chr(10)
                       +'        sno='+maxsnocon+',iscon="T",operationtype=1,"T"         '+chr(13)+chr(10)
                 );
         ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'        where id=object_id("tempdb..#lskzxconskuzx") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                       +'   drop table #lskzxconskuzx                                                               '+chr(13)+chr(10)
                       +' select jobno,skuid,skuname,quality="正品",userid="'+_userid+'",username="'+_username+'",'+chr(13)+chr(10)
                       +'        quantityuom,quantity,                                                            '+chr(13)+chr(10)
                       +'        cusid="'+strcusid+'",                               '+chr(13)+chr(10)
                       +'        cusname="'+strcusname+'",                           '+chr(13)+chr(10)
                       +'        shippercusid="'+strcusid+'",                 '+chr(13)+chr(10)
                       +'        shippercusname="'+strcusname+'",             '+chr(13)+chr(10)
                       +'        sno='+maxsnocon+',customerno,ldsno=0,iscon="T", '+chr(13)+chr(10)
                       +'        conno="'+strthelotcode+'",skuspec,color,operationtype=1,jobnoorder,snoorder,lotcode,    '+chr(13)+chr(10)
                       +'        shipcusid,shipcusname,customsno,cusbillno                                                    '+chr(13)+chr(10)
                       +'   into #lskzxconskuzx                                                                     '+chr(13)+chr(10)
                       +'   from #lskcheckdetailzx (nolock)                                                      '+chr(13)+chr(10)
                       +'  where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                       +'    and ischeck="T"                                                                   '+chr(13)+chr(10)
                       +'declare @ldsno int                                                                       '+chr(13)+chr(10)
                       +' select @ldsno=0                                                                         '+chr(13)+chr(10)
                       +' update #lskzxconskuzx set ldsno=@ldsno,@ldsno=@ldsno+1                                   '+chr(13)+chr(10)
                       +' insert into locationinoutconsku                                                         '+chr(13)+chr(10)
                       +'        (jobno,skuid,skuname,qualityname,userid,username,                                '+chr(13)+chr(10)
                       +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                       +'        sno,serialno,ldsno,iscon,skuspec,color,jobnoorder,snoorder,lotcode,shipcusid,shipcusname,customsno,cusbillno)     '+chr(13)+chr(10)
                       +' select jobno,skuid,skuname,quality,userid,username,                                     '+chr(13)+chr(10)
                       +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                       +'        sno,customerno,ldsno,iscon,skuspec,color,jobnoorder,snoorder,lotcode,shipcusid,shipcusname,customsno,cusbillno    '+chr(13)+chr(10)
                       +'   from #lskzxconskuzx (nolock)                                                          '+chr(13)+chr(10)
                 );
      end else
      begin
         OpenSql(qrytmp, '  select sno=isnull(max(sno),0)+1 from locationinoutcon where cusbillno="'+edtcusbillno.Text+'" ');
         maxsnocon:=qrytmp.Fieldbyname('sno').AsString;
         ExecSql(qryTmp,' insert into locationinoutcon                                                            '+chr(13)+chr(10)
                       +'        (jobno,userid,username,conquantity,conno,cusbillno,sno,iscon,operationtype,ischeck)                '+chr(13)+chr(10)
                       +' select jobno="'+edtcusbillno.Text+'",userid="'+_userid+'",username="'+_username+'",              '+chr(13)+chr(10)
                       +'        conquantity=1,conno="'+strthelotcode+'",cusbillno="'+edtcusbillno.text+'",                '+chr(13)+chr(10)
                       +'        sno='+maxsnocon+',iscon="T",operationtype=1,"T"         '+chr(13)+chr(10)
                 );
         //lzw20101115
         ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'        where id=object_id("tempdb..#lskzxconskuzx") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                       +'   drop table #lskzxconskuzx                                                               '+chr(13)+chr(10)
                       +' select jobno,skuid,skuname,quality="正品",userid="'+_userid+'",username="'+_username+'",'+chr(13)+chr(10)
                       +'        quantityuom,quantity,                                                            '+chr(13)+chr(10)
                       +'        cusid="'+strcusid+'",                               '+chr(13)+chr(10)
                       +'        cusname="'+strcusname+'",                           '+chr(13)+chr(10)
                       +'        shippercusid="'+strcusid+'",                 '+chr(13)+chr(10)
                       +'        shippercusname="'+strcusname+'",             '+chr(13)+chr(10)
                       +'        sno='+maxsnocon+',customerno,ldsno=0,iscon="T", '+chr(13)+chr(10)
                       +'        conno="'+strthelotcode+'",skuspec,color,operationtype=1,jobnoorder,snoorder,lotcode,    '+chr(13)+chr(10)
                       +'        shipcusid,shipcusname,customsno,cusbillno  '+chr(13)+chr(10)
                       +'   into #lskzxconskuzx                                                                     '+chr(13)+chr(10)
                       +'   from #lskcheckdetailzx (nolock)                                                      '+chr(13)+chr(10)
                       +'  where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                       +'    and ischeck="T"                                                                   '+chr(13)+chr(10)
                       +'declare @ldsno int                                                                       '+chr(13)+chr(10)
                       +' select @ldsno=0                                                                         '+chr(13)+chr(10)
                       +' update #lskzxconskuzx set ldsno=@ldsno,@ldsno=@ldsno+1                                    '+chr(13)+chr(10)
                       +' insert into locationinoutconsku                                                         '+chr(13)+chr(10)
                       +'        (jobno,skuid,skuname,qualityname,userid,username,                                '+chr(13)+chr(10)
                       +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                       +'        sno,serialno,ldsno,iscon,skuspec,color,jobnoorder,snoorder,lotcode,shipcusid,shipcusname,customsno,cusbillno)         '+chr(13)+chr(10)
                       +' select jobno,skuid,skuname,quality,userid,username,                                     '+chr(13)+chr(10)
                       +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                       +'        sno,customerno,ldsno,iscon,skuspec,color,jobnoorder,snoorder,lotcode,shipcusid,shipcusname,customsno,cusbillno        '+chr(13)+chr(10)
                       +'   from #lskzxconskuzx (nolock)                                                            '+chr(13)+chr(10)
                 );

      end;
      _ADOConnection.Commit;
    except
       if _ADOConnection.InTransaction then
          _ADOConnection.Rollback;
       raise;
       exit;
    end;

    Getqryskudetailcashzx(true);
    
    Getqryskuxz(true);

   openSql(qryskudetail,'select snosm=cast (sno as bigint),* from #lskcheckdetailzx                        '+chr(13)+chr(10)
                       +' where 1=2             '+chr(13)+chr(10)
                                      );
   btnzx.Enabled:=False;
   btnprint.Enabled:=True;
   btncash.Enabled:=True;
   edtlotcode.Enabled:=True;
   edtlotcode.Clear;
   edtlotcode.SetFocus;
end;

procedure TfrmLocOutcashzx.btnprintClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      begin
         if Pos('七匹狼',strcusname)>0 then
         begin
            OpenSql(dataTmp.qryTmp,'ksp_rkzxd @jobno="'+strjobno+'",@conno="'+edtlotcode.Text+'" ');
         end else
         begin
            OpenSql(dataTmp.qryTmp,'ksp_hxekrkzxd @jobno="'+strjobno+'",@conno="'+edtlotcode.Text+'" ');
         end;


         OpenSql(datatmp.qryTmp1,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                                +'       locationin.cusbillno                            '+chr(13)+chr(10)
                                +'  from wareorder(nolock)       '+chr(13)+chr(10)
                                +'       left join customer(nolock) '+chr(13)+chr(10)
                                +'              on customer.cusid=wareorder.shipcusid   '+chr(13)+chr(10)
                                +' where cusbillno="'+edtcusbillno.Text+'" '+chr(13)+chr(10)
                      );

         KF1Book:=TKF1book.Create;
         with KF1Book do
         begin
            if Pos('七匹狼',strcusname)>0 then
               Bbdm:='100122'
            else
            if Pos('鸿星尔克',strcusname)>0 then
               Bbdm:='100022';
            paras.Values['jjy']:=_loginname;
            paras.Values['shipcusname']:=dataTmp.qrytmp1.fieldbyname('shipcusname').AsString;
            paras.Values['cusbillno']:=dataTmp.qrytmp1.fieldbyname('cusbillno').AsString;
            paras.Values['date']:=DateToStr(Now);
            paras.Values['address']:=datatmp.qryTmp1.FieldByname('address').AsString;
            paras.Values['mobiletel']:=datatmp.qryTmp1.FieldByname('mobiletel').AsString;
            paras.Values['conno']:=edtlotcode.Text;

            qryMain:=dataTmp.qryTmp;
            CreateReport;
         end;
         KF1Book.Destroy;
      end;
   finally

   end;
   edtcustomerno.Enabled:=True;
   edtcustomerno.SetFocus;
end;

function TfrmLocOutcashzx.GetLocationbillNo:String;
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
procedure TfrmLocOutcashzx.edtlotcodeExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtlotcode.text='' then exit;
end;

procedure TfrmLocOutcashzx.edtlotcodeExit(Sender: TObject);
begin
   if edtlotcode.Text='' then
   begin
       exit;
   end else
   begin
      if edtcusbillno.Text='' then
      begin
         KMessageDlg('客户单号不能为空！',mtWarning,[mbOK],0);
         edtcusbillno.setfocus;
         exit;
      end;
      opensql(qrytmp,' select distinct lotcode from wareordersku(nolock)          '
                    +'  where cusbillno= "'+edtcusbillno.Text+'" '
                    +'    and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                    ) ;
      if qrytmp.RecordCount=0 then
      begin
         KMessageDlg('不存在该箱号的订单信息',mtWarning,[mbOK],0);
         edtlotcode.SetFocus;
         Exit;
      end else
      begin
         strthelotcode:=qrytmp.fieldbyname('lotcode').AsString;
      end;
      opensql(qrytmp,' select 1 from locationinoutcon(nolock)          '
                     +' where replace(conno," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                    +'    and operationtype="1" '
//                    +'    and isnull(cuscheck,"")="" '
                    ) ;
      if qrytmp.RecordCount>0 then
      begin
         if KmessageDlg('该箱号已扫描,您确认要继续扫描吗？',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrYes then
         begin
            opensql(datatmp.qrytmp1,'select quantity=sum(quantity) from locationinoutconsku                   '
                                   +' where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                                   +'   and cusbillno="'+edtcusbillno.Text+'"                   '
                                 {  +' where jobno in (select jobno from locationinoutcon  '
                                   +'                  where conno="'+edtlotcode.Text+'") '
                                   +'   and sno in  (select sno from locationinoutcon  '
                                   +'                  where conno="'+edtlotcode.Text+'") '}
                                   );
            if datatmp.qrytmp1.recordcount>0 then
            begin
               if KmessageDlg('该箱号已扫描"'+datatmp.qrytmp1.FieldByName('quantity').AsString+'",您要清空吗？',mtConfirmation,[mbYes,mbNo],0,mbNo)=mrYes then
               begin
                  execsql(datatmp.qrytmp1,'delete locationinoutconsku                   '
                                         +' where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                                         +'   and cusbillno="'+edtcusbillno.Text+'"                   '
                                         +'delete locationinoutcon                              '
                                         +' where replace(conno," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                                         +'   and cusbillno="'+edtcusbillno.Text+'"                   '
                                         +'   and operationtype=1                                '+chr(13)+chr(10)
                                         +'delete #lskcheckdetailzx                              '
                                         +' where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)

                                   );
               end;

              Getqryskudetailcashzx(false);
              
              Getqryskuxz(false);

               opensql(datatmp.qryTmp2,'select customsno,shipcusid,shipcusname,outzoneno  from wareordersku(nolock)'
                                      +' where wareordersku.cusbillno like "%'+edtcusbillno.text+'%"         '+chr(13)+chr(10)
                                      +'   and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                      );
               strcustomsno:=datatmp.qryTmp2.FieldByName('customsno').AsString ;
               strshipcusid:=datatmp.qryTmp2.FieldByName('shipcusid').AsString ;
               strshipcusname:=datatmp.qryTmp2.FieldByName('shipcusname').AsString ;
               stroutzoneno:=datatmp.qryTmp2.FieldByName('outzoneno').AsString ;

    {           execSql(qrytmp,' delete #lskcheckdetailzx where  lotcode="'+edtlotcode.Text+'"   '+chr(13)+chr(10)
                             +'insert into #lskcheckdetailzx                         '+chr(13)+chr(10)
                             +'select locationinoutconsku.jobno,locationinoutconsku.ldsno,locationinoutconsku.ldsno,         '+chr(13)+chr(10)
                             +'       locationinoutconsku.skuid,locationinoutconsku.skuname,                                 '+chr(13)+chr(10)
                             +'       customerno=locationinoutconsku.serialno,color=locationinoutconsku.color,colorid=sku.grade, '+chr(13)+chr(10)
                             +'       skuspec=locationinoutconsku.skuspec,locationinoutconsku.quantity,locationinoutconsku.quantityuom,skucards=sku.skucards,       '+chr(13)+chr(10)
                             +'       shipcusid="'+strshipcusid+'", shipcusname="'+strshipcusname+'",                                                               '+chr(13)+chr(10)
                             +'       customsno="'+strcustomsno+'",outzoneno="'+stroutzoneno+'",          '+chr(13)+chr(10)
                             +'       cusbillno="'+edtcusbillno.text+'",lotcode="'+edtlotcode.text+'","F" '+chr(13)+chr(10)
                             +'  from locationinoutconsku (nolock) ,locationinoutcon (nolock) , sku (nolock)             '+chr(13)+chr(10)
                             +' where locationinoutconsku.jobno=locationinoutcon.jobno            '+chr(13)+chr(10)
                             +'   and locationinoutconsku.skuid=sku.skuid                         '+chr(13)+chr(10)
                             +'   and locationinoutcon.jobno="'+edtcusbillno.Text+'"              '+chr(13)+chr(10)
                             +'   and locationinoutcon.conno="'+edtlotcode.Text+'"                ');
                             }

               openSql(qryskudetail,'select * from #lskcheckdetailzx                        '+chr(13)+chr(10)
                                   +' where replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
                                   +' order by sno            '+chr(13)+chr(10)
                                  );

              edtcusbillno.Enabled:=false;
              edtlotcode.Enabled:=false;
              btnzx.Enabled:=True;
              edtcustomerno.SetFocus;
              exit;
            end;
         end else
         begin
            edtlotcode.SetFocus;
            Exit;
         end;

      end;
   end;
   opensql(datatmp.qryTmp2,'select customsno,shipcusid,shipcusname,outzoneno  from wareordersku(nolock)'
                          +' where wareordersku.cusbillno like "%'+edtcusbillno.text+'%"         '+chr(13)+chr(10)
                          +'   and replace(lotcode," ","")=replace("'+edtlotcode.text+'"," ","")    '+chr(13)+chr(10)
          );
   strcustomsno:=datatmp.qryTmp2.FieldByName('customsno').AsString ;
   strshipcusid:=datatmp.qryTmp2.FieldByName('shipcusid').AsString ;
   strshipcusname:=datatmp.qryTmp2.FieldByName('shipcusname').AsString ;
   stroutzoneno:=datatmp.qryTmp2.FieldByName('outzoneno').AsString ;


    Getqryskudetailcashzx(false);
    
    Getqryskuxz(false);

    edtcusbillno.Enabled:=false;
    edtlotcode.Enabled:=false;
    edtcustomerno.SetFocus;
end;

procedure TfrmLocOutcashzx.edtcusbillnoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtcusbillno.text='' then exit;
end;

procedure TfrmLocOutcashzx.edtcusbillnoExit(Sender: TObject);
begin
   if edtcusbillno.text<>'' then
   begin
      opensql(qrytmp,' select jobno from wareorder(nolock)          '
                    +'  where cusbillno="'+edtcusbillno.Text+'" '
                    ) ;
      if qrytmp.RecordCount=0 then
      begin
         KMessageDlg('不存在该客户单号的订单信息',mtWarning,[mbOK],0);
         edtcusbillno.SetFocus;
         Exit;
      end else
      begin
         strjobnoorder:=qrytmp.fieldbyname('jobno').AsString;
      end;

      ExecSql(qryTmp,'  delete  #lskWareorderSku  '+chr(13)+chr(10)
                    +'  insert into #lskWareorderSku    '+chr(13)+chr(10)
                    +'   (jobno,sno,cusbillno,outzoneno,lotcode,skuid,skuname,quantity,netweight,grossweight,customsno,shipcusname,shipcusid )     '+chr(13)+chr(10)
                    +'  select jobno,sno,cusbillno,outzoneno,lotcode,skuid,skuname,quantity,netweight,grossweight,customsno,shipcusname,shipcusid   '+chr(13)+chr(10)
                    +'    from wareordersku (nolock)                                          '+chr(13)+chr(10)
                    +'   where wareordersku.cusbillno="'+edtcusbillno.text+'"         '
              );
      ExecSql(qryTmp,'  delete  #lskSku  '+chr(13)+chr(10)
                    +'  insert into #lskSku    '+chr(13)+chr(10)
                    +'   (skuid,skuname,customerno,color,grade,skuspec,quantityuom,skucards )     '+chr(13)+chr(10)
                    +'  select distinct sku.skuid,sku.skuname,sku.customerno,sku.color,sku.grade,sku.skuspec,sku.quantityuom,sku.skucards   '+chr(13)+chr(10)
                    +'    from sku (nolock),#lskWareorderSku                                        '+chr(13)+chr(10)
                    +'   where sku.skuid=#lskWareorderSku.skuid         '
              );

      GetConSkuInZX;

      Getqryskudetailcashzx(true);

      Getqryskuxz(true);
      
      //lzw20111120
      OpenSql(qryTmp,'select top 1  costcusid,costcusname,gc=isnull(customer.cusname,"")+isnull(customer.cushelpno,"")'
                    +'  from wareordersku(nolock)                  '
                    +'       left join customer                    '
                    +'              on customer.cusid=wareordersku.shipcusid  '
                    +' where cusbillno="'+edtcusbillno.Text+'"');
      strcusid:=qrytmp.FieldByName('costcusid').asstring;
      strcusname:=qrytmp.FieldByName('costcusname').asstring;
      edtorigincusname.Text:=qrytmp.FieldByName('gc').asstring;
   end;
   edtlotcode.SetFocus;
end;

//将箱货表塞入装箱临时表
procedure TfrmLocOutcashzx.GetConSkuInZX;
begin
    //whl 20111205
   ExecSql(qryTmp,' delete #lskcheckdetailzx                                '+chr(13)+chr(10)
                 +' insert into #lskcheckdetailzx                         '+chr(13)+chr(10)
                 +'select locationinoutconsku.jobno,locationinoutconsku.ldsno,locationinoutconsku.ldsno,         '+chr(13)+chr(10)
                 +'       locationinoutconsku.skuid,locationinoutconsku.skuname,                                 '+chr(13)+chr(10)
                 +'       customerno=locationinoutconsku.serialno,color=locationinoutconsku.color,colorid=sku.grade, '+chr(13)+chr(10)
                 +'       skuspec=locationinoutconsku.skuspec,locationinoutconsku.quantity,      '+chr(13)+chr(10)
                 +'       locationinoutconsku.quantityuom,skucards=sku.skucards,       '+chr(13)+chr(10)
                 +'       shipcusid=isnull(#lskwareordersku.shipcusid,""), shipcusname=isnull(#lskwareordersku.shipcusname,""),       '+chr(13)+chr(10)
                 +'       customsno=isnull(#lskwareordersku.customsno,""),outzoneno=isnull(#lskwareordersku.outzoneno,""),          '+chr(13)+chr(10)
                 +'       cusbillno="'+edtcusbillno.text+'",lotcode=locationinoutconsku.lotcode,"F",  '+chr(13)+chr(10)
                 +'       locationinoutconsku.jobnoorder,locationinoutconsku.snoorder '+chr(13)+chr(10)
                 +'  from locationinoutconsku (nolock)                                   '+chr(13)+chr(10)
                 +'                      left join #lskwareordersku     '+chr(13)+chr(10)
                 +'                             on #lskwareordersku.jobno=locationinoutconsku.jobnoorder    '+chr(13)+chr(10)
                 +'                            and #lskwareordersku.sno=locationinoutconsku.snoorder    '+chr(13)+chr(10)
                 +'       ,sku (nolock)                  '+chr(13)+chr(10)
                 +' where locationinoutconsku.skuid=sku.skuid                         '+chr(13)+chr(10)
//                 +'   and locationinoutconsku.jobno="'+edtcusbillno.Text+'"           '+chr(13)+chr(10)
                 +'   and locationinoutconsku.cusbillno="'+edtcusbillno.Text+'"           '+chr(13)+chr(10)
                 //+'   and locationinoutcon.conno="'+edtlotcode.Text+'"                '
                 );
end;

//显示订单商品信息
procedure TfrmLocOutcashzx.Getqryskudetailcashzx(blnALL:boolean);
begin
   opensql(qryskudetailcashzx,'select wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                       +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                       +'       quantity=wareordersku.quantity,quantityuom=sku.quantityuom,      '+chr(13)+chr(10)
                       +'       quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),                 '+chr(13)+chr(10)
                       //lzw20120711
                       +'       skucards=sku.skucards,                                              '+chr(13)+chr(10)
                       +'       cys=isnull(wareordersku.quantity,0)-isnull(sum(isnull(#lskcheckdetailzx.quantity,0)),0), colorid=sku.grade,'+chr(13)+chr(10)
                       +'       ischeck=case when isnull((select top 1 jobno from #lskcheckdetailzx (nolock) '+chr(13)+chr(10)
                       +'                                  where #lskcheckdetailzx.jobnoorder=wareordersku.jobno  '+chr(13)+chr(10)
                       +'                                    and #lskcheckdetailzx.snoorder=wareordersku.sno      '+chr(13)+chr(10)
                       +'                                  ),"")="" then "" else "已扫描" end '+chr(13)+chr(10)
                       +'  from #lskwareordersku wareordersku                           '+chr(13)+chr(10)
                       +'       left join #lsksku sku                           '+chr(13)+chr(10)
                       +'              on sku.skuid=wareordersku.skuid          '+chr(13)+chr(10)
                       +'       left join #lskcheckdetailzx(nolock)                          '+chr(13)+chr(10)
                       +'              on #lskcheckdetailzx.jobnoorder=wareordersku.jobno     '+chr(13)+chr(10)
                       +'             and #lskcheckdetailzx.snoorder=wareordersku.sno         '+chr(13)+chr(10)
                       +'             and #lskcheckdetailzx.lotcode=wareordersku.lotcode         '+chr(13)+chr(10)
                       +' where wareordersku.cusbillno="'+edtcusbillno.text+'"         '+chr(13)+chr(10)
                       +iif(blnALL,' ','   and replace(wareordersku.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")         ')+chr(13)+chr(10)
                       +' group by wareordersku.jobno,wareordersku.sno,wareordersku.cusbillno,wareordersku.outzoneno,'+chr(13)+chr(10)
                       +'       wareordersku.lotcode,sku.customerno,sku.skuname,sku.color,sku.skuspec,wareordersku.skuid,'+chr(13)+chr(10)
                       +'       sku.quantityuom,wareordersku.quantity, wareordersku.quantity, sku.grade,sku.skucards '+chr(13)+chr(10)
                       +' union all                                                               '+chr(13)+chr(10)
                       +'      select jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                       +'             lotcode,customerno,skuname,color,skuspec,skuid,                        '+chr(13)+chr(10)
                       +'             quantity=0,quantityuom,                                          '+chr(13)+chr(10)
                       //lzw20120711
                       +'             quantitysm=sum(isnull(#lskcheckdetailzx.quantity,0)),skucards=null,                 '+chr(13)+chr(10)
                       +'             cys=sum(isnull(#lskcheckdetailzx.quantity,0))-0,colorid,'+chr(13)+chr(10)
                       +'             ischeck="已扫描"  '+chr(13)+chr(10)
                       +'        from #lskcheckdetailzx   '+chr(13)+chr(10)
                       +'       where #lskcheckdetailzx.snoorder=9999    '+chr(13)+chr(10)
                       +iif(blnALL,' ','   and replace(#lskcheckdetailzx.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")         ')+chr(13)+chr(10)
                       +'       group by jobno,snoorder,cusbillno,outzoneno,                                    '+chr(13)+chr(10)
                       +'                lotcode,customerno,skuname,color,skuspec,skuid,  '+chr(13)+chr(10)
                       +'                quantityuom, colorid                          '+chr(13)+chr(10)
                       +'      having sum(isnull(#lskcheckdetailzx.quantity,0))<>0                   '+chr(13)+chr(10)
                       +' order by 10,6,8,9 '+chr(13)+chr(10)
           );
end;

//显示箱子情况
procedure TfrmLocOutcashzx.Getqryskuxz(blnALL:boolean);
begin
   opensql(qryskuxz,'select wareordersku.lotcode,quantity=sum(wareordersku.quantity),wareordersku.skuname, '+chr(13)+chr(10)
                      +'       netweight,grossweight,sno=max(substring(outzoneno,2,4))+1-1,outzoneno ,cusbillno   '+chr(13)+chr(10)
                      +'  from #lskwareordersku wareordersku                          '+chr(13)+chr(10)
                      +' where wareordersku.cusbillno="'+edtcusbillno.text+'"         '+chr(13)+chr(10)
                      +iif(blnALL,' ','   and replace(wareordersku.lotcode," ","")=replace("'+edtlotcode.text+'"," ","")        ')+chr(13)+chr(10)
                      +' group by wareordersku.lotcode,wareordersku.skuname,netweight,grossweight,cusbillno ,outzoneno,(substring(outzoneno,1,4)) '+chr(13)+chr(10)
                      +' order by wareordersku.lotcode  '+chr(13)+chr(10)
          );
end;

procedure TfrmLocOutcashzx.grdcashskuCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if ASelected or AFocused then
  begin
    AFont.Color := clHighlightText;
    AColor := clHighlight;
  end;
end;

end.
