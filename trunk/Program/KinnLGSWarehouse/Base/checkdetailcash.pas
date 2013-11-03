unit checkdetailcash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  Tfrmcheckdetailcash = class(TForm)
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    KGroupBox2: TKGroupBox;
    RxSplitter1: TRxSplitter;
    dtsskudetailcash: TDataSource;
    qryskudetailcash: TKADOQuery;
    grdcashsku: TdxDBGrid;
    qryTmp: TKADOQuery;
    skuname: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    quantityuom: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    GMSStickyLabel5: TGMSStickyLabel;
    edtcustomerno: TdxEdit;
    qrytmp1: TKADOQuery;
    btncash: TKBitBtn;
    ppmgrdsku: TPopupMenu;
    middel: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure qryskudetailcashAfterPost(DataSet: TDataSet);
    procedure btncancellClick(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure btncashClick(Sender: TObject);
    procedure edtcustomernoExit(Sender: TObject);
    procedure edtcustomernoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure quantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdcashskuEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
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
    strconno:string;
    //过程定义
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure pgcRelocationChange(Sender: TObject);
    procedure GetSql;
    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//记录商品明细删除,datas中.
    strjobno,strcusid,strcusname:string;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure Workcheckdetailcash(pstrjobno:string);

var
  frmcheckdetailcash: Tfrmcheckdetailcash;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect,skudetailout,
     libbb,dysounds,ShellAPI,linprint;

var strClassID,strZsql,strMxpjbz:string;

procedure Workcheckdetailcash(pstrjobno:string);
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
   if frmcheckdetailcash <> nil then
   with frmcheckdetailcash do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmcheckdetailcash:=Tfrmcheckdetailcash.Create(application);

   with frmcheckdetailcash do
   begin
      strconno:='';
      strjobno:=pstrjobno;
      //lzw20110222
      OpenSql(qryTmp,'select shippercusid,shippercusname from checksku(nolock) where jobno="'+strjobno+'"');
      strcusid:=qrytmp.FieldByName('shippercusid').asstring;
      strcusname:=qrytmp.FieldByName('shippercusname').asstring;
      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      {初始化所有数据集}
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskcheckcheckdetail") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskcheckcheckdetail'+chr(13)+chr(10)
                            +'create table #lskcheckcheckdetail'+chr(13)+chr(10)
                            +'            (jobno                 varchar(20) null,'+chr(13)+chr(10)
                            +'             sno                   bigint null,'+chr(13)+chr(10)
                            +'             ldsno                 bigint null,'+chr(13)+chr(10)
                            +'             skuid                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuname               varchar(50) null,'+chr(13)+chr(10)
                            +'             customerno            varchar(50) null,'+chr(13)+chr(10)
                            +'             color                 varchar(40) null,'+chr(13)+chr(10)
                            +'             skuspec               varchar(50) null,'+chr(13)+chr(10)
                            +'             quantity              numeric(16,4) null,'+chr(13)+chr(10)
                            +'             quantityuom           varchar(40) null,'+chr(13)+chr(10)
                            +'             bs                    varchar(200) null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)
                            );

      execsql(datatmp.qryTmp,'insert into #lskcheckcheckdetail         '+chr(13)+chr(10)
                            +'select item.jobno,sno=0,ldsno=0,item.skuid,item.skuname,   '+chr(13)+chr(10)
                            +'       customerno=item.customerno,item.color,item.skuspec,item.quantity,'+chr(13)+chr(10)
                            +'       item.quantityuom,bs=item.customerno+item.color+item.skuspec  '+chr(13)+chr(10)
                            +'  from ck_checkskuitem item(nolock)  '+chr(13)+chr(10)
                            +' where item.jobno="'+strjobno+'"          '+chr(13)+chr(10)
                               
              );

      opensql(qryskudetailcash,'select jobno, sno=0,ldsno=0,                          '+chr(13)+chr(10)
                              +'       skuid,skuname,                                 '+chr(13)+chr(10)
                              +'       customerno,color,                              '+chr(13)+chr(10)
                              +'       skuspec,quantity=sum(quantity),quantityuom,bs '+chr(13)+chr(10)
                              +'  from #lskcheckcheckdetail                                '+chr(13)+chr(10)
                              +' group by jobno,                                      '+chr(13)+chr(10)
                              +'       skuid,skuname,                                 '+chr(13)+chr(10)
                              +'       customerno,color,                              '+chr(13)+chr(10)
                              +'       skuspec,quantityuom,bs                   '+chr(13)+chr(10)
                              +' order by customerno,color,skuspec '
             );
      ShowModal;
      frmcheckdetailcash.visible:=true;
      btncash.Enabled:=true;
      edtcustomerno.SetFocus;
      SetFormPosition(frmcheckdetailcash,true);
      Free;
   end;
end;

procedure Tfrmcheckdetailcash.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior+[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=False;
  grdcashsku.ClearGroupColumns;
end;

procedure Tfrmcheckdetailcash.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior-[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=True;
end;

procedure Tfrmcheckdetailcash.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure Tfrmcheckdetailcash.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure Tfrmcheckdetailcash.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
    ExecSql(qryTmp,'drop table #lskcheckcheckdetail '
            );
end;

procedure Tfrmcheckdetailcash.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdcashsku);
  qryskudetailcash.connection:=_adoconnection;
  qryTmp.connection:=_adoconnection;
  qryTmp1.connection:=_adoconnection;

end;

procedure Tfrmcheckdetailcash.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
end;

procedure Tfrmcheckdetailcash.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryskudetailcash.Close;
  frmcheckdetailcash:=nil;
end;

procedure Tfrmcheckdetailcash.pgcRelocationChange(Sender: TObject);
begin
   //
end;

procedure Tfrmcheckdetailcash.GetSql;
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

procedure Tfrmcheckdetailcash.qryskudetailcashAfterPost(DataSet: TDataSet);
begin
  if qryskudetailcash.fieldbyname('SKUID').asstring='' then
  begin
    qryskudetailcash.Delete;
  end;
end;

procedure Tfrmcheckdetailcash.btncancellClick(Sender: TObject);
begin
   frmcheckdetailcash.Close;
end;

procedure Tfrmcheckdetailcash.mitAddLocOldClick(Sender: TObject);
begin
   qryskudetailcash.DisableControls;
   //lzw20090609
   qryskudetailcash.First;
   while not qryskudetailcash.eof do
   begin
      qryskudetailcash.Edit;
      qryskudetailcash.FieldByName('checked').asstring:='T';
      qryskudetailcash.Next;
   end;
   qryskudetailcash.First;
   qryskudetailcash.EnableControls;
end;

procedure Tfrmcheckdetailcash.mitDelLocOldClick(Sender: TObject);
begin
   qryskudetailcash.DisableControls;
   //lzw20090609
   qryskudetailcash.First;
    while not qryskudetailcash.eof do
    begin
       qryskudetailcash.Edit;
       qryskudetailcash.FieldByName('checked').asstring:='F';
       qryskudetailcash.Next;
    end;
   qryskudetailcash.First;
   qryskudetailcash.EnableControls;
end;

procedure Tfrmcheckdetailcash.btncashClick(Sender: TObject);
var
   strcys:string;
   KF1Book:TKF1book;
   lstPara:TStringList;
   F:TextFile;
begin
   _ADOConnection.Starttransaction;
   try
      opensql(qryTmp1,'select quantity=sum(isnull(detail.quantity,0)),bs=rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                     +'       skuname=detail.skuname,quantityls=isnull(#lsksumcheck.quantity,0)         '+chr(13)+chr(10)
                     +'  from checkskuitem detail(nolock)                                         '+chr(13)+chr(10)
                     +'       left join (select quantity=sum(isnull(quantity,0)),bs,skuname             '+chr(13)+chr(10)
                     +'                    from #lskcheckcheckdetail                                      '+chr(13)+chr(10)
                     +'                   group by skuname,bs)                                          '+chr(13)+chr(10)
                     +'                      as #lsksumcheck                                            '+chr(13)+chr(10)
                     +'              on #lsksumcheck.bs=rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                     +' where detail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                     +' group by detail.skuname,rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec),#lsksumcheck.quantity '+chr(13)+chr(10)
                     +'having sum(isnull(detail.quantity,0))<>isnull(#lsksumcheck.quantity,0) '+chr(13)+chr(10)
                     +' order by rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec)   '+chr(13)+chr(10)
              );
      if qrytmp1.recordcount>0 then
      begin
         ExecSql(datatmp.qrytmp2,'if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'      where id=object_id("tempdb..#lskcheckchecktxt") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'   drop table #lskcheckchecktxt '+chr(13)+chr(10)
                                +' create table #lskcheckchecktxt( '+chr(13)+chr(10)
                                +'    bs       varchar(200), '+chr(13)+chr(10)
                                +'    skuname  varchar(100), '+chr(13)+chr(10)
                                +'    ddsl varchar(100), '+chr(13)+chr(10)
                                +'    smsl varchar(100),  '+chr(13)+chr(10)
                                +'    shortsl varchar(100)  )  '+chr(13)+chr(10)
                                +'insert into #lskcheckchecktxt                '+chr(13)+chr(10)
                                +'select bs=" 商品标识     ",skuname="    品名",ddsl="      盘点数量",smsl="扫描数量",shortsl="差异数"  '
                );
         qrytmp1.First;
         while not qrytmp1.Eof do
         begin
            lstPara:=TStringList.Create;
            Strcys:=IntToStr(strtoint(qrytmp1.FieldByName('quantity').asstring)-strtoint(qrytmp1.FieldByName('quantityls').asstring));
            //lzw20110506空格用来对齐列
            execSql(datatmp.qrytmp2, 'insert into #lskcheckchecktxt                                     '+chr(13)+chr(10)
                            +'select bs="'+qrytmp1.FieldByName('bs').asstring+'",                 '+chr(13)+chr(10)
                            +'       skuname="   '+qrytmp1.FieldByName('skuname').asstring+'",      '+chr(13)+chr(10)
                            +'       ddsl="   '+qrytmp1.FieldByName('quantity').asstring+'",           '+chr(13)+chr(10)
                            +'       smsl="        '+qrytmp1.FieldByName('quantityls').asstring+'",    '+chr(13)+chr(10)
                            +'       shortsl="      '+strcys+'"                                         '+chr(13)+chr(10)                                              

                    );
            qrytmp1.next;
         end;
         OpenSql(datatmp.qrytmp2, 'select * from  #lskcheckchecktxt    order by  bs         '  );

         if datatmp.qrytmp2.recordcount>0 then
         begin
            //调用声音文件
            frmdysounds.btnsoundsClick(self);
            if GetExedir+'\'+'盘点记录'+strjobno+'.txt'='' then
            begin
               QueryExportTxt('#lskcheckchecktxt').SaveToFile(GetExedir+'\'+'盘点记录'+strjobno+'.txt');
            end else
            begin
               DeleteFile(GetExedir+'\'+'盘点记录'+strjobno+'.txt') ;
               QueryExportTxt('#lskcheckchecktxt').SaveToFile(GetExedir+'\'+'盘点记录'+strjobno+'.txt');
            end;
            ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'盘点记录'+strjobno+'.txt'),'','',SW_SHOW);
         end;

         ExecSql(qryTmp,'  if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'  where id=object_id("tempdb..#inputchecksku") and sysstat & 0xf=3)                         '+chr(13)+chr(10)
                       +'   drop table #inputchecksku                                                                '+chr(13)+chr(10)
                       +' select jobno,sno=0,                                                                     '+chr(13)+chr(10)
                       +'        skuid,skuname,quantityuom,                                                       '+chr(13)+chr(10)
                       +'        quantity=sum(quantity),customerno,qualityname="正品",color,skuspec,              '+chr(13)+chr(10)
                       +'        shippercusid="'+strcusid+'",                 '+chr(13)+chr(10)
                       +'        shippercusname="'+strcusname+'",             '+chr(13)+chr(10)
                       +'        locname=space(30),locid=space(30)                                               '+chr(13)+chr(10)

                       +'   into #inputchecksku                                                                      '+chr(13)+chr(10)
                       +'   from #lskcheckcheckdetail (nolock)                                                      '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                       +'  group by jobno,skuid,skuname,quantityuom,                                              '+chr(13)+chr(10)
                       +'	      customerno,color,skuspec                                                         '+chr(13)+chr(10)
                       +'declare @sno int                                                                         '+chr(13)+chr(10)
                       +' select @sno=0                                                                           '+chr(13)+chr(10)
                       +' update #inputchecksku set sno=@sno,@sno=@sno+1                                         '+chr(13)+chr(10)
                       +' insert into ck_checkskuitem                                                      '+chr(13)+chr(10)
                       +'        (jobno,sno,skuid,skuname,quantityuom,                            '+chr(13)+chr(10)
                       +'        quantity,customerno,qualityname,color,skuspec,                                     '+chr(13)+chr(10)
                       +'        shippercusid,shippercusname)                                                        '+chr(13)+chr(10)
                       +' select jobno,sno,skuid,skuname,quantityuom,                             '+chr(13)+chr(10)
                       +'        quantity,customerno,qualityname,color,skuspec,                                   '+chr(13)+chr(10)
                       +'        shippercusid,shippercusname                                                    '+chr(13)+chr(10)
                       +'   from #inputchecksku (nolock)                                                             '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                       +' update checksku set                                                      '+chr(13)+chr(10)
                       +'        checked="T",ischeckname="'+_loginname+'"                             '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                  '+chr(13)+chr(10)
                     );
      end else
      begin
         ExecSql(qryTmp,' insert into ck_checkskuitem                                                            '+chr(13)+chr(10)
                       +'        (jobno,sno,skuid,skuname,quantityuom,                            '+chr(13)+chr(10)
                       +'        quantity,customerno,qualityname,color,skuspec,                                     '+chr(13)+chr(10)
                       +'        shippercusid,shippercusname)                                                        '+chr(13)+chr(10)
                       +' select jobno,sno,skuid,skuname,quantityuom,                             '+chr(13)+chr(10)
                       +'        quantity,customerno,qualityname,color,skuspec,                                   '+chr(13)+chr(10)
                       +'        shippercusid,shippercusname                                                      '+chr(13)+chr(10)
                       +'   from checkskuitem (nolock)                                                             '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                       +' update checksku set                                                      '+chr(13)+chr(10)
                       +'        checked="T",ischeckname="'+_loginname+'"                             '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                  '+chr(13)+chr(10)
                     );
                       
      end;

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   KMessageDlg('完成盘点校验!',mtInformation,[mbOK],0);
   grdcashsku.DataSource:=nil;
   btncash.Enabled:=False;
   frmcheckdetailcash.Close;
end;

procedure Tfrmcheckdetailcash.edtcustomernoExit(Sender: TObject);
var
   maxsno:integer;
   strcustomserno:string;
begin
   if edtcustomerno.text='' then
   begin
      exit;
   end else
   begin
      opensql(datatmp.qryTmp,'select maxsno=isnull(max(sno),0)+1 from #lskcheckcheckdetail '
                         +' where jobno="'+strjobno+'" '
          );
      maxsno:=datatmp.qryTmp.FieldByName('maxsno').asinteger;
      //lzw20101201
      opensql(datatmp.qryTmp,' select customerno=replace("'+edtcustomerno.Text+'"," ","") '
             );
      strcustomserno:=datatmp.qryTmp.FieldByName('customerno').AsString;

      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                      +' where id=object_id("tempdb..#checklskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                      +'  drop table #checklskcheckdetailmx                                        '+chr(13)+chr(10)
                      +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                      +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                      +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                      +'       skuspec=skuspec.specname,quantity=1,quantityuom, '+chr(13)+chr(10)
                      +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                      +'  into #checklskcheckdetailmx                                              '+chr(13)+chr(10)
                      +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                      +' where rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                      +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                      +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                      //lzw20110222
                      +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                      +'   and sku.skuid in (select skuid from checkskuitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                     );
      opensql(qrytmp,'select #checklskcheckdetailmx.* from #checklskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                    +' where exists(select 1 from checkskuitem detail(nolock)                 '+chr(13)+chr(10)
                    +'                   where #checklskcheckdetailmx.jobno=detail.jobno              '+chr(13)+chr(10)
                    +'                     and #checklskcheckdetailmx.bs=rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec)) '+chr(13)+chr(10)
             );
      if qrytmp.RecordCount=0 then
      begin
         //调用声音文件
         frmdysounds.btnsoundsClick(self);
         KMessageDlg('商品"'+qryTmp.FieldByName('bs').AsString+'"在该盘点单不存在！',mtWarning,[mbOK],0);
         ExecSql(datatmp.qrytmp2,'delete #checklskcheckdetailmx            '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'"            '+chr(13)+chr(10)
                                +'   and sno='+inttostr(maxsno)+'        '+chr(13)+chr(10)
                  );
      end else
      begin

         begin
            openSql(qryskudetailcash,'insert into #lskcheckcheckdetail        '+chr(13)+chr(10)
                +'select jobno, sno=0,ldsno=0,                              '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantity,quantityuom,bs              '+chr(13)+chr(10)
                +'  from #checklskcheckdetailmx                               '+chr(13)+chr(10)
                +' where jobno="'+strjobno+'"                               '+chr(13)+chr(10)
                +'select jobno, sno=0,ldsno=0,                              '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantity=sum(quantity),quantityuom,bs '+chr(13)+chr(10)
                +'  from #lskcheckcheckdetail                                 '+chr(13)+chr(10)
                +' group by jobno,                                          '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantityuom,bs                       '+chr(13)+chr(10)
               );
            //lzw20111007
            edtcustomerno.setfocus;
            edtcustomerno.clear;
         end;

      end;


   end;
end;

procedure Tfrmcheckdetailcash.edtcustomernoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtcustomerno.text='' then exit;
end;

procedure Tfrmcheckdetailcash.quantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  a:string;
begin
   opensql(qrytmp,'select skuname from sku(nolock)                                        '
                 +' where classid=(select classid=substring(classid,1,8) from sku(nolock) '
                 +'                 where sku.customerno="'+qryskudetailcash.FieldByName('customerno').asstring+'" )'
            );
   If qrytmp.FieldByname('skuname').AsString='配件' then
   begin
     ExecSql(qryTmp,'update #lskcheckcheckdetail set '
                 +'       quantity="'+(grdcashsku.InplaceEditor.GetEditingText)+'"     '
                 +' where #lskcheckcheckdetail.jobno="'+strjobno+'"                                      '+chr(13)+chr(10)
                 +'   and #lskcheckcheckdetail.bs="'+qryskudetailcash.FieldByName('bs').asstring+'"          '+chr(13)+chr(10)
          );

     opensql(qrytmp1,'select quantity=sum(isnull(detail.quantity,0)),mx.bs,mxsl=sum(isnull(mx.quantity,0)) '+chr(13)+chr(10)
                  +'  from checkskuitem detail(nolock)                       '+chr(13)+chr(10)
                  +'       left join #lskcheckcheckdetail mx(nolock)                '+chr(13)+chr(10)
                  +'              on detail.jobno=mx.jobno                                  '+chr(13)+chr(10)
                  +'             and mx.bs=rtrim(detail.customerno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                  +' where detail.jobno="'+strjobno+'"                                            '+chr(13)+chr(10)
                  +'   and mx.bs="'+qryskudetailcash.FieldByName('bs').asstring+'"          '+chr(13)+chr(10)
                  +' group by mx.bs                                                               '+chr(13)+chr(10)
                );
      if (qryTmp1.FieldByName('quantity').asinteger)<(qrytmp1.FieldByName('mxsl').asinteger) then
      begin
         //调用声音文件
         frmdysounds.btnsounds1Click(self);
         KMessageDlg('商品"'+qryTmp1.FieldByName('bs').AsString+'"超过盘点单数量！',mtWarning,[mbOK],0);
         grdcashsku.InplaceEditor.SetFocus;
      end

   end else
   begin
      //
   end;
end;

procedure Tfrmcheckdetailcash.grdcashskuEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   allow:=True;
   with grdcashsku do
   begin
      if ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY')) then
      begin
         opensql(qrytmp,'select skuname from sku(nolock)                                        '
                 +' where classid=(select classid=substring(classid,1,8) from sku(nolock) '
                 +'                 where sku.customerno="'+qryskudetailcash.FieldByName('customerno').asstring+'" )'
                 //lzw20110222
                 +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
            );
         //If (qrytmp.FieldByname('skuname').AsString='配件')or(qrytmp.FieldByname('skuname').AsString='服装')
         If (pos('配件',qrytmp.FieldByname('skuname').AsString)>0 )or(pos('服装',qrytmp.FieldByname('skuname').AsString)>0)
               then
         begin
            allow:=True;
         end else
         begin
            allow:=False;
         end;

      end else  
      Allow:=False;
   end;
end;

end.
