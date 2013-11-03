unit outdetailcash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  Tfrmoutdetailcash = class(TForm)
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
    conno: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    quantityuom: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    GMSStickyLabel5: TGMSStickyLabel;
    edtcustomerno: TdxEdit;
    qrytmp1: TKADOQuery;
    btncash: TKBitBtn;
    btnzx: TKBitBtn;
    btnprint: TKBitBtn;
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
    procedure btnzxClick(Sender: TObject);
    procedure edtcustomernoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnprintClick(Sender: TObject);
    procedure quantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure grdcashskuEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure middelClick(Sender: TObject);
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

procedure Workoutdetailcash(pstrjobno:string);

var
  frmoutdetailcash: Tfrmoutdetailcash;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect,skudetailout,
     libbb,dysounds,ShellAPI,linprint;

var strClassID,strZsql,strMxpjbz:string;

procedure Workoutdetailcash(pstrjobno:string);
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
   if frmoutdetailcash <> nil then
   with frmoutdetailcash do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmoutdetailcash:=Tfrmoutdetailcash.Create(application);

   with frmoutdetailcash do
   begin
      strconno:='';
      strjobno:=pstrjobno;
      //lzw20110222
      OpenSql(qryTmp,'select costcusid,costcusname from SkuDetailOut(nolock) where jobno="'+strjobno+'"');
      strcusid:=qrytmp.FieldByName('costcusid').asstring;
      strcusname:=qrytmp.FieldByName('costcusname').asstring;
      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      {初始化所有数据集}
      //lzw20111201
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskskudetailoutdetail") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskskudetailoutdetail'+chr(13)+chr(10)
                            +'select * into #lskskudetailoutdetail '+chr(13)+chr(10)
                            +'  from skudetailoutdetail(nolock) where jobno="'+strjobno+'"  '+chr(13)+chr(10)
                            );
      //lzw20111219
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskskudetailoutloc") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskskudetailoutloc'+chr(13)+chr(10)
                            +'select * into #lskskudetailoutloc '+chr(13)+chr(10)
                            +'  from skudetailoutloc(nolock) where jobno="'+strjobno+'"  '+chr(13)+chr(10)
                            );

      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskoutcheckdetail") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskoutcheckdetail'+chr(13)+chr(10)
                            +'create table #lskoutcheckdetail'+chr(13)+chr(10)
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
                            +'             conno                 varchar(40) null,'+chr(13)+chr(10)
                            +'             bs                    varchar(200) null '+chr(13)+chr(10)
                            +'            )'+chr(13)+chr(10)
                            );
      opensql(qrytmp1,'select a=sum(isnull(quantity,0)) from locationinoutconsku consku(nolock)'
                     +' where jobno="'+strjobno+'" ' );
      opensql(qrytmp,'select b=sum(isnull(quantity,0)) from ck_lskoutcheckdetail (nolock)'
                     +' where jobno="'+strjobno+'" ' );
      if qrytmp1.FieldByName('a').AsInteger<qrytmp.FieldByName('b').AsInteger  then
      begin
         execsql(datatmp.qryTmp,'insert into #lskoutcheckdetail         '+chr(13)+chr(10)
                               +'select  * from ck_lskoutcheckdetail      '+chr(13)+chr(10)
                               +' where jobno="'+strjobno+'"             '+chr(13)+chr(10)
              );
      end else
      begin
         execsql(datatmp.qryTmp,'insert into #lskoutcheckdetail         '+chr(13)+chr(10)
                               +'select consku.jobno,sno=0,ldsno=0,consku.skuid,consku.skuname,   '+chr(13)+chr(10)
                               +'       customerno=consku.serialno,consku.color,consku.skuspec,consku.quantity,'+chr(13)+chr(10)
                               +'       consku.quantityuom,con.conno,bs=consku.serialno+consku.color+consku.skuspec  '+chr(13)+chr(10)
                               +'  from locationinoutconsku consku(nolock),locationinoutcon con(nolock)  '+chr(13)+chr(10)
                               +' where consku.jobno=con.jobno                                           '+chr(13)+chr(10)
                               +'   and consku.sno=con.sno                                               '+chr(13)+chr(10)
                               +'   and consku.jobno="'+strjobno+'"                                          '+chr(13)+chr(10)
                               +'   and con.jobno="'+strjobno+'"                                          '+chr(13)+chr(10)

              );
      end;
      opensql(qryskudetailcash,'select jobno, sno=0,ldsno=0,                          '+chr(13)+chr(10)
                              +'       skuid,skuname,                                 '+chr(13)+chr(10)
                              +'       customerno,color,                              '+chr(13)+chr(10)
                              +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
                              +'  from #lskoutcheckdetail                                '+chr(13)+chr(10)
                              +' group by jobno,                                      '+chr(13)+chr(10)
                              +'       skuid,skuname,                                 '+chr(13)+chr(10)
                              +'       customerno,color,                              '+chr(13)+chr(10)
                              +'       skuspec,quantityuom,conno,bs                   '+chr(13)+chr(10)
                              +' order by conno,customerno,color,skuspec '
             );
      ShowModal;
      frmoutdetailcash.visible:=true;
      //btncash.Enabled:=true;
      //edtcustomerno.SetFocus;
      SetFormPosition(frmoutdetailcash,true);
      Free;
   end;
end;

procedure Tfrmoutdetailcash.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior+[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=False;
  grdcashsku.ClearGroupColumns;
end;

procedure Tfrmoutdetailcash.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior-[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=True;
end;

procedure Tfrmoutdetailcash.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure Tfrmoutdetailcash.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure Tfrmoutdetailcash.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
    ExecSql(qryTmp,'drop table #lskoutcheckdetail '
            );
end;

procedure Tfrmoutdetailcash.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdcashsku);
  qryskudetailcash.connection:=_adoconnection;
  qryTmp.connection:=_adoconnection;
  qryTmp1.connection:=_adoconnection;

end;

procedure Tfrmoutdetailcash.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
end;

procedure Tfrmoutdetailcash.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryskudetailcash.Close;
  frmoutdetailcash:=nil;
end;

procedure Tfrmoutdetailcash.pgcRelocationChange(Sender: TObject);
begin
   //
end;

procedure Tfrmoutdetailcash.GetSql;
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

procedure Tfrmoutdetailcash.qryskudetailcashAfterPost(DataSet: TDataSet);
begin
  if qryskudetailcash.fieldbyname('SKUID').asstring='' then
  begin
    qryskudetailcash.Delete;
  end;
end;

procedure Tfrmoutdetailcash.btncancellClick(Sender: TObject);
begin
   frmoutdetailcash.Close;
end;

procedure Tfrmoutdetailcash.mitAddLocOldClick(Sender: TObject);
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

procedure Tfrmoutdetailcash.mitDelLocOldClick(Sender: TObject);
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

procedure Tfrmoutdetailcash.btncashClick(Sender: TObject);
var
   strcys:string;
   KF1Book:TKF1book;
   lstPara:TStringList;
   F:TextFile;
begin
   //扫描数量和装箱数量比对
    OpenSql(datatmp.qryTmp,'select conskusl=sum(case when isnull(#lskoutcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end), '+chr(13)+chr(10)
                   +'       bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec), '+chr(13)+chr(10)
                   +'       smsl=sum(isnull(#lskoutcheckdetail.quantity,0))         '+chr(13)+chr(10)
                   +'  from #lskoutcheckdetail(nolock)                             '+chr(13)+chr(10)
                   +'       left join locationinoutconsku consku(nolock)                '+chr(13)+chr(10)
                   +'              on #lskoutcheckdetail.jobno=consku.jobno               '+chr(13)+chr(10)
                   +'             and #lskoutcheckdetail.bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                   +' where #lskoutcheckdetail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                   +'   and consku.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                   +' group by rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                   +'having sum(case when isnull(#lskoutcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end)<>sum(isnull(#lskoutcheckdetail.quantity,0))'
           );
    if (datatmp.qryTmp.recordcount>0) then
    begin
       //调用声音文件
       frmdysounds.btnsoundsClick(self);
       if (Kmessagedlg('装箱信息与扫描信息不一致,是否继续？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
       begin
          Exit;
       end;

    end;

   //_ADOConnection.Starttransaction;
   //try

      //扫描数量和订单数量比对
      //lzw20110617 订单数量汇总 (20110619)
      {if (Pos('鸿星尔克',strcusname)>0)  then
      opensql(qryTmp1,'select quantity=sum(isnull(detail.quantity,0)),bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                     +'       skuname=detail.skuname,quantityls=isnull(#lsksumcheck.quantity,0)         '+chr(13)+chr(10)
                     //lzw20110729
                     +'  from #lskskudetailoutdetail detail(nolock)                                         '+chr(13)+chr(10)
                     //+'  from #lskskudetailoutloc detail(nolock)                                         '+chr(13)+chr(10)
                     +'       left join (select quantity=sum(isnull(quantity,0)),bs,skuname             '+chr(13)+chr(10)
                     +'                    from #lskoutcheckdetail                                      '+chr(13)+chr(10)
                     +'                   group by skuname,bs)                                          '+chr(13)+chr(10)
                     +'                      as #lsksumcheck                                            '+chr(13)+chr(10)
                     +'              on #lsksumcheck.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                     +' where detail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                     +' group by detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec),#lsksumcheck.quantity '+chr(13)+chr(10)
                     +'having sum(isnull(detail.quantity,0))<>isnull(#lsksumcheck.quantity,0) '+chr(13)+chr(10)
                     +' order by rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)   '+chr(13)+chr(10)
              );
      if (Pos('七匹狼',strcusname)>0)  then
      }
      opensql(qryTmp1,'select quantity=sum(isnull(detail.quantity,0)),bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                     +'       skuname=detail.skuname,quantityls=isnull(#lsksumcheck.quantity,0)         '+chr(13)+chr(10)
                     //lzw20110729
                     //+'  from #lskskudetailoutdetail detail(nolock)                                         '+chr(13)+chr(10)
                     +'  from #lskskudetailoutloc detail(nolock)                                         '+chr(13)+chr(10)
                     +'       left join (select quantity=sum(isnull(quantity,0)),bs,skuname             '+chr(13)+chr(10)
                     +'                    from #lskoutcheckdetail                                      '+chr(13)+chr(10)
                     +'                   group by skuname,bs)                                          '+chr(13)+chr(10)
                     +'                      as #lsksumcheck                                            '+chr(13)+chr(10)
                     +'              on #lsksumcheck.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                     +' where detail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                     +' group by detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec),#lsksumcheck.quantity '+chr(13)+chr(10)
                     +'having sum(isnull(detail.quantity,0))<>isnull(#lsksumcheck.quantity,0) '+chr(13)+chr(10)
                     +' order by rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)   '+chr(13)+chr(10)
              );
      if qrytmp1.recordcount>0 then
      begin
         ExecSql(datatmp.qrytmp2,'if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                                +'      where id=object_id("tempdb..#lskchecktxt") and sysstat & 0xf=3) '+chr(13)+chr(10)
                                +'   drop table #lskchecktxt '+chr(13)+chr(10)
                                +' create table #lskchecktxt( '+chr(13)+chr(10)
                                +'    bs       varchar(200), '+chr(13)+chr(10)
                                +'    skuname  varchar(100), '+chr(13)+chr(10)
                                +'    ddsl varchar(100), '+chr(13)+chr(10)
                                +'    smsl varchar(100),  '+chr(13)+chr(10)
                                +'    shortsl varchar(100)  )  '+chr(13)+chr(10)
                                +'insert into #lskchecktxt                '+chr(13)+chr(10)
                                +'select bs=" 商品标识     ",skuname="    品名",ddsl="      拣货数量",smsl="扫描数量",shortsl="差异数"  '
                );
         qrytmp1.First;
         while not qrytmp1.Eof do
         begin
            lstPara:=TStringList.Create;
            Strcys:=IntToStr(strtoint(qrytmp1.FieldByName('quantity').asstring)-strtoint(qrytmp1.FieldByName('quantityls').asstring));
            //lzw20110506空格用来对齐列
            execSql(datatmp.qrytmp2, 'insert into #lskchecktxt                                     '+chr(13)+chr(10)
                            +'select bs="'+qrytmp1.FieldByName('bs').asstring+'",                 '+chr(13)+chr(10)
                            +'       skuname="   '+qrytmp1.FieldByName('skuname').asstring+'",      '+chr(13)+chr(10)
                            +'       ddsl="   '+qrytmp1.FieldByName('quantity').asstring+'",           '+chr(13)+chr(10)
                            +'       smsl="        '+qrytmp1.FieldByName('quantityls').asstring+'",    '+chr(13)+chr(10)
                            +'       shortsl="      '+strcys+'"                                         '+chr(13)+chr(10)

                    );
            qrytmp1.next;
         end;
         OpenSql(datatmp.qrytmp2, 'select * from  #lskchecktxt    order by  bs  '  );

         if datatmp.qrytmp2.recordcount>0 then
         begin
            //调用声音文件
            frmdysounds.btnsoundsClick(self);
            if GetExedir+'\'+'扫描记录'+strjobno+'.txt'='' then
            begin
               QueryExportTxt('#lskchecktxt').SaveToFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt');
            end else
            begin
               DeleteFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt') ;
               QueryExportTxt('#lskchecktxt').SaveToFile(GetExedir+'\'+'扫描记录'+strjobno+'.txt');
            end;
            ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'扫描记录'+strjobno+'.txt'),'','',SW_SHOW);

         end;

         if (Kmessagedlg('是否将扫描数据导入？',mtInformation,[mbYes,mbNo],0)=mrYes) then
         begin

            //lzw20101117
            ExecSql(qryTmp,' insert into ck_SkuDetailOutDetail                                                    '+chr(13)+chr(10)
                          +' select *  from #lskskudetailoutdetail(nolock)                                        '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          +'    and not exists(select 1 from ck_SkuDetailOutDetail                                '+chr(13)+chr(10)
                          +'                    where ck_SkuDetailOutDetail.jobno=#lskskudetailoutdetail.jobno)   '+chr(13)+chr(10)
                          +' insert into ck_SkuDetailOutLoc                                                       '+chr(13)+chr(10)
                          +' select *  from SkuDetailOutLoc(nolock)                                               '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          +'    and not exists(select 1 from ck_SkuDetailOutLoc                                   '+chr(13)+chr(10)
                          +'                    where ck_SkuDetailOutLoc.jobno=SkuDetailOutLoc.jobno)             '+chr(13)+chr(10)
                          );
            {if (Pos('鸿星尔克',strcusname)>0)  then
            ExecSql(qryTmp,'delete SkuDetailOutDetail                                                            '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          +' delete SkuDetailOutLoc                                                               '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          );
            opensql(qrytmp1,'select * from SkuDetailOut(nolock)                                                   '+chr(13)+chr(10)
                           +' where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                   );

            if (Pos('鸿星尔克',strcusname)>0)  then
            ExecSql(qryTmp,'  if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                          +'  where id=object_id("tempdb..#inputcheck") and sysstat & 0xf=3)                         '+chr(13)+chr(10)
                          +'   drop table #inputcheck                                                                '+chr(13)+chr(10)
                       +' select jobno,sno=0,                                                                     '+chr(13)+chr(10)
                       +'        userid="'+qrytmp1.FieldByName('userid').asstring+'",                             '+chr(13)+chr(10)
                       +'        username="'+qrytmp1.FieldByName('username').asstring+'",                         '+chr(13)+chr(10)
                       +'        skuid,skuname,quantityuom,                                                       '+chr(13)+chr(10)
                       +'        quantity=sum(quantity),customerno,qualityname="正品",color,skuspec,              '+chr(13)+chr(10)
                       +'        cusid="'+qrytmp1.FieldByName('cusid').asstring+'",                               '+chr(13)+chr(10)
                       +'        cusname="'+qrytmp1.FieldByName('cusname').asstring+'",                           '+chr(13)+chr(10)
                       +'        shippercusid="'+qrytmp1.FieldByName('shippercusid').asstring+'",                 '+chr(13)+chr(10)
                       +'        shippercusname="'+qrytmp1.FieldByName('shippercusname').asstring+'",             '+chr(13)+chr(10)
                       +'        shipcusid="'+qrytmp1.FieldByName('shipcusid').asstring+'",                       '+chr(13)+chr(10)
                       +'        shipcusname="'+qrytmp1.FieldByName('shipcusname').asstring+'",                   '+chr(13)+chr(10)
                       +'        locname=space(30),locid=space(30),                                               '+chr(13)+chr(10)
                       +'        cusbillno=space(30),     '+chr(13)+chr(10)
                       +'        locationbillno=space(30)              '+chr(13)+chr(10)
                       +'   into #inputcheck                                                                      '+chr(13)+chr(10)
                       +'   from #lskoutcheckdetail (nolock)                                                      '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                       +'  group by jobno,skuid,skuname,quantityuom,                                              '+chr(13)+chr(10)
                       +'	      customerno,color,skuspec                                                         '+chr(13)+chr(10)
                       +'declare @sno int                                                                         '+chr(13)+chr(10)
                       +' select @sno=0                                                                           '+chr(13)+chr(10)
                       +' update #inputcheck set sno=@sno,@sno=@sno+1                                             '+chr(13)+chr(10)
                       +' insert into SkuDetailOutDetail                                                          '+chr(13)+chr(10)
                       +'        (jobno,sno,userid,username,skuid,skuname,quantityuom,                            '+chr(13)+chr(10)
                       +'        quantity,serialno,qualityname,color,skuspec,                                     '+chr(13)+chr(10)
                       +'        cusid,cusname,shippercusid,shippercusname,shipcusid,shipcusname,                 '+chr(13)+chr(10)
                       +'        cusbillno,locationbillno)                                                        '+chr(13)+chr(10)
                       +' select jobno,sno,userid,username,skuid,skuname,quantityuom,                             '+chr(13)+chr(10)
                       +'        quantity,customerno,qualityname,color,skuspec,                                   '+chr(13)+chr(10)
                       +'        cusid,cusname,shippercusid,shippercusname,shipcusid,shipcusname,                 '+chr(13)+chr(10)
                       +'        cusbillno,locationbillno                                                         '+chr(13)+chr(10)
                       +'   from #inputcheck (nolock)                                                             '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)

                       +' update SkuDetailOut set                                                      '+chr(13)+chr(10)
                       +'        checkid="T",ischeckname="'+_loginname+'",ischeckdate=getdate(),        '+chr(13)+chr(10)
                       +'        quantity=isnull((select sum(isnull(quantity,0))                       '+chr(13)+chr(10)
                       +'                           from #lskoutcheckdetail                            '+chr(13)+chr(10)
                       +'                          where #lskoutcheckdetail.jobno="'+strjobno+'"),0)   '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                  '+chr(13)+chr(10)
                       +' update SkuDetailOutdetail                                                    '+chr(13)+chr(10)
                       +'    set cusbillno=SkuDetailOut.cusbillno,locationbillno=SkuDetailOut.locationbillno '+chr(13)+chr(10)
                       +'   from SkuDetailOut(nolock)                                                  '+chr(13)+chr(10)
                       +'  where SkuDetailOut.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
                       +'    and SkuDetailOut.jobno=SkuDetailOutDetail.jobno                              '+chr(13)+chr(10)
                     );}
            ExecSql(qryTmp,' delete ck_lskoutcheckdetail  where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                          +' insert into ck_lskoutcheckdetail                                                     '+chr(13)+chr(10)
                          +' select *  from #lskoutcheckdetail(nolock)                                            '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          );
            if ( datatmp.qrytmp2.recordcount>0 )  then
            begin
               KMessageDlg('扫描数与拣货数不一致,请先对应!',mtInformation,[mbOK],0);
               frmoutdetailcash.Close;
               exit;
            end;
         end else
         begin
            ExecSql(qryTmp,' delete ck_lskoutcheckdetail  where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                          +' insert into ck_lskoutcheckdetail                                                     '+chr(13)+chr(10)
                          +' select *  from #lskoutcheckdetail(nolock)                                            '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                          );
            //lzw20120227
            if (Pos('七匹狼',strcusname)>0) and ( datatmp.qrytmp2.recordcount>0 )  then
            begin
               KMessageDlg('扫描数与拣货数不一致,请先对应!',mtInformation,[mbOK],0);
               frmoutdetailcash.Close;
               exit;
            end;
         end;

      end else
      begin
         ExecSql(qryTmp, ' update SkuDetailOut set                                                      '+chr(13)+chr(10)
                        +'        checkid="T",ischeckname="'+_loginname+'",ischeckdate=getdate()        '+chr(13)+chr(10)
                        +'  where jobno="'+strjobno+'"                                                  '+chr(13)+chr(10)

                        +' update SkuDetailOutdetail                                                    '+chr(13)+chr(10)
                        +'    set cusbillno=SkuDetailOut.cusbillno,locationbillno=SkuDetailOut.locationbillno '+chr(13)+chr(10)
                        +'   from SkuDetailOut(nolock)                                                  '+chr(13)+chr(10)
                        +'  where SkuDetailOut.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
                        +'    and SkuDetailOutdetail.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
                        +'    and SkuDetailOut.jobno=SkuDetailOutDetail.jobno                              '+chr(13)+chr(10)

                        +' update SkuDetailOutloc                                                    '+chr(13)+chr(10)
                        +'    set cusbillno=SkuDetailOut.cusbillno,locationbillno=SkuDetailOut.locationbillno '+chr(13)+chr(10)
                        +'   from SkuDetailOut(nolock)                                                  '+chr(13)+chr(10)
                        +'  where SkuDetailOut.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
                        +'    and SkuDetailOutloc.jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
                        +'    and SkuDetailOut.jobno=SkuDetailOutloc.jobno                              '+chr(13)+chr(10)

                          );
      end;

   //   _ADOConnection.Commit;
   //except
   //   if _ADOConnection.InTransaction then
   //      _ADOConnection.Rollback;
   //   raise;
   //   exit;
   //end;
   KMessageDlg('完成数据校验!',mtInformation,[mbOK],0);
   grdcashsku.DataSource:=nil;
   btncash.Enabled:=False;
   frmoutdetailcash.Close;
   //frmskudetailout.btnRefresh.OnClick(Sender);
end;

procedure Tfrmoutdetailcash.edtcustomernoExit(Sender: TObject);
var
   maxsno:integer;
   strcustomserno:string;
begin
   if edtcustomerno.text='' then
   begin
      exit;
   end else
   begin
      opensql(datatmp.qryTmp,'select maxsno=isnull(max(sno),0)+1 from #lskoutcheckdetail '
                         +' where jobno="'+strjobno+'" '
          );
      maxsno:=datatmp.qryTmp.FieldByName('maxsno').asinteger;
      //lzw20101201
      opensql(datatmp.qryTmp,' select customerno=replace("'+edtcustomerno.Text+'"," ","") '
             );
      strcustomserno:=datatmp.qryTmp.FieldByName('customerno').AsString;
      if (Pos('鸿星尔克',strcusname)>0)  then
      begin
         if (Pos('*',strcustomserno)>0)  then
            ExecSql(qrytmp1, '    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                         +' where id=object_id("tempdb..#outlskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #outlskcheckdetailmx                                        '+chr(13)+chr(10)
                         +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                         +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                         +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                         +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom, '+chr(13)+chr(10)
                         +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                         +'  into #outlskcheckdetailmx                                              '+chr(13)+chr(10)
                         +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                         +' where rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.specid)="'+strcustomserno+'"'+chr(13)+chr(10)
                         +'   and sku.customerno=substring("'+strcustomserno+'",1,CHARINDEX("*","'+strcustomserno+'")-1) '+chr(13)+chr(10)
                         +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                         +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                         +'   and sku.skuid in (select skuid from #lskskudetailoutdetail item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                      )
         else
            ExecSql(qrytmp1, '    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                         +' where id=object_id("tempdb..#outlskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #outlskcheckdetailmx                                        '+chr(13)+chr(10)
                         +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                         +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                         +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                         +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom, '+chr(13)+chr(10)
                         +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                         +'  into #outlskcheckdetailmx                                              '+chr(13)+chr(10)
                         +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                         +' where skuspec.barcode="'+strcustomserno+'"                        '+chr(13)+chr(10)
                         +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                         +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                         +'   and sku.skuid in (select skuid from #lskskudetailoutdetail item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                      );
      end else
      if (Pos('鳄莱特',strcusname)>0)  then
      begin
         ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                         +' where id=object_id("tempdb..#outlskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #outlskcheckdetailmx                                        '+chr(13)+chr(10)
                         +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                         +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                         +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                         +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom, '+chr(13)+chr(10)
                         +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                         +'  into #outlskcheckdetailmx                                              '+chr(13)+chr(10)
                         +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                         +' where (rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                         +'        or rtrim(sku.customno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'") '+chr(13)+chr(10)
                         +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                         +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                         //lzw20110222
                         +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                         +'   and sku.skuid in (select skuid from #lskskudetailoutloc item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                         //lzw20110729
                         //+'   and sku.skuid in (select skuid from SkuDetailOutloc item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                        );
      end else
      begin
         ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                         +' where id=object_id("tempdb..#outlskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'  drop table #outlskcheckdetailmx                                        '+chr(13)+chr(10)
                         +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                         +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                         +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                         +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom, '+chr(13)+chr(10)
                         +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                         +'  into #outlskcheckdetailmx                                              '+chr(13)+chr(10)
                         +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                         +' where rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                         +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                         +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                         //lzw20110222
                         +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                         +'   and sku.skuid in (select skuid from #lskskudetailoutloc item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                         //lzw20110729
                         //+'   and sku.skuid in (select skuid from SkuDetailOutloc item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") '
                        );
      end;
      if (Pos('鸿星尔克',strcusname)>0)  then
      opensql(qrytmp,'select #outlskcheckdetailmx.* from #outlskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                    +' where exists(select 1 from #lskskudetailoutdetail detail(nolock)                 '+chr(13)+chr(10)
                    //lzw20110729
                    //+' where exists(select 1 from SkuDetailOutloc detail(nolock)                 '+chr(13)+chr(10)
                    +'                   where #outlskcheckdetailmx.jobno=detail.jobno              '+chr(13)+chr(10)
                    +'                     and #outlskcheckdetailmx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                    +'                     and detail.jobno="'+strjobno+'"     ) '+chr(13)+chr(10)
             )
      else if (Pos('七匹狼',strcusname)>0)  then
      opensql(qrytmp,'select #outlskcheckdetailmx.* from #outlskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                    +' where exists(select 1 from #lskskudetailoutloc detail(nolock)                 '+chr(13)+chr(10)
                    //lzw20110729
                    //+' where exists(select 1 from SkuDetailOutloc detail(nolock)                 '+chr(13)+chr(10)
                    +'                   where #outlskcheckdetailmx.jobno=detail.jobno              '+chr(13)+chr(10)
                    +'                     and #outlskcheckdetailmx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                    +'                     and detail.jobno="'+strjobno+'"     ) '+chr(13)+chr(10)
             )
      else if (Pos('鳄莱特',strcusname)>0)  then
      opensql(qrytmp,'select #outlskcheckdetailmx.* from #outlskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                    +' where exists(select 1 from #lskskudetailoutloc detail(nolock)                 '+chr(13)+chr(10)
                    +'                   where #outlskcheckdetailmx.jobno=detail.jobno              '+chr(13)+chr(10)
                    +'                     and #outlskcheckdetailmx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                    +'                     and detail.jobno="'+strjobno+'"     ) '+chr(13)+chr(10)
             )
      else
      opensql(qrytmp,'select #outlskcheckdetailmx.* from #outlskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                    +' where exists(select 1 from #lskskudetailoutloc detail(nolock)                 '+chr(13)+chr(10)
                    //lzw20110729
                    //+' where exists(select 1 from SkuDetailOutloc detail(nolock)                 '+chr(13)+chr(10)
                    +'                   where #outlskcheckdetailmx.jobno=detail.jobno              '+chr(13)+chr(10)
                    +'                     and #outlskcheckdetailmx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec)  '+chr(13)+chr(10)
                    +'                     and detail.jobno="'+strjobno+'"     ) '+chr(13)+chr(10)
             );
      if qrytmp.RecordCount=0 then
      begin
         //调用声音文件
         frmdysounds.btnsoundsClick(self);
         KMessageDlg('商品"'+qryTmp.FieldByName('bs').AsString+'"在该拣货单不存在！',mtWarning,[mbOK],0);
         ExecSql(datatmp.qrytmp2,'delete #outlskcheckdetailmx            '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'"            '+chr(13)+chr(10)
                                +'   and sno='+inttostr(maxsno)+'        '+chr(13)+chr(10)
                  );
      end else
      begin
         opensql(datatmp.qrytmp,'select quantity=sum(#lskoutcheckdetail.quantity),mx.bs '+chr(13)+chr(10)
                       +'  from #lskoutcheckdetail(nolock),#outlskcheckdetailmx mx(nolock) '+chr(13)+chr(10)
                       +' where #lskoutcheckdetail.jobno=mx.jobno                  '+chr(13)+chr(10)
                       +'   and #lskoutcheckdetail.bs=mx.bs                        '+chr(13)+chr(10)
                       +'   and #lskoutcheckdetail.jobno="'+strjobno+'"                        '+chr(13)+chr(10)
                       +' group by mx.bs '+chr(13)+chr(10)
                );

         if (Pos('七匹狼',strcusname)>0)  then
         opensql(datatmp.qrytmp1,'select quantity=sum(isnull(detail.quantity,0)),mx.bs '+chr(13)+chr(10)
                       +'  from #outlskcheckdetailmx mx(nolock),#lskskudetailoutloc detail(nolock) '+chr(13)+chr(10)
                       //lzw20110729
                       //+'  from SkuDetailOutloc detail(nolock),#outlskcheckdetailmx mx(nolock) '+chr(13)+chr(10)
                       +' where detail.jobno="'+strjobno+'"    '+chr(13)+chr(10)
                       +'   and detail.jobno=mx.jobno                              '+chr(13)+chr(10)
                       +'   and mx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)

                       +' group by mx.bs '+chr(13)+chr(10)
                )
         else if (Pos('鸿星尔克',strcusname)>0)  then
         opensql(datatmp.qrytmp1,'select quantity=sum(isnull(detail.quantity,0)),mx.bs '+chr(13)+chr(10)
                       +'  from #outlskcheckdetailmx mx(nolock),#lskskudetailoutdetail detail(nolock) '+chr(13)+chr(10)
                       +' where detail.jobno="'+strjobno+'"    '+chr(13)+chr(10)
                       +'   and detail.jobno=mx.jobno                              '+chr(13)+chr(10)
                       +'   and mx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)

                       +' group by mx.bs '+chr(13)+chr(10)
                )
         else
         opensql(datatmp.qrytmp1,'select quantity=sum(isnull(detail.quantity,0)),mx.bs '+chr(13)+chr(10)
                       +'  from #outlskcheckdetailmx mx(nolock),#lskskudetailoutdetail detail(nolock) '+chr(13)+chr(10)
                       +' where detail.jobno="'+strjobno+'"    '+chr(13)+chr(10)
                       +'   and detail.jobno=mx.jobno                              '+chr(13)+chr(10)
                       +'   and mx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)

                       +' group by mx.bs '+chr(13)+chr(10)
                );
         if (datatmp.qryTmp.FieldByName('quantity').asinteger+1)>datatmp.qrytmp1.FieldByName('quantity').asinteger then
         begin
            //调用声音文件
            frmdysounds.btnsounds1Click(self);
            KMessageDlg('商品"'+qryTmp.FieldByName('bs').AsString+'"超过拣货单数量！',mtWarning,[mbOK],0);
            ExecSql(datatmp.qrytmp2,'delete #outlskcheckdetailmx            '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'"            '+chr(13)+chr(10)
                                +'   and sno='+inttostr(maxsno)+'        '+chr(13)+chr(10)
                  );
         end else
         begin
            openSql(qryskudetailcash,'insert into #lskoutcheckdetail        '+chr(13)+chr(10)
                +'select jobno, sno=0,ldsno=0,                              '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantity,quantityuom,conno,bs              '+chr(13)+chr(10)
                +'  from #outlskcheckdetailmx                               '+chr(13)+chr(10)
                +' where jobno="'+strjobno+'"                               '+chr(13)+chr(10)
                +'select jobno, sno=0,ldsno=0,                              '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
                +'  from #lskoutcheckdetail                                 '+chr(13)+chr(10)
                //lzw20101201
                +' where #lskoutcheckdetail.conno=""                        '+chr(13)+chr(10)
                +' group by jobno,                                          '+chr(13)+chr(10)
                +'       skuid,skuname,                                     '+chr(13)+chr(10)
                +'       customerno,color,                                  '+chr(13)+chr(10)
                +'       skuspec,quantityuom,conno,bs                       '+chr(13)+chr(10)
                +' order by  conno                                          '+chr(13)+chr(10)
               );
            //lzw20111007
            edtcustomerno.setfocus;
            edtcustomerno.clear;
         end;

      end;


   end;
end;

procedure Tfrmoutdetailcash.btnzxClick(Sender: TObject);
begin
   if (Kmessagedlg('是否确定装箱？',mtInformation,[mbYes,mbNo],0)<>mrYes) then exit;
   opensql(datatmp.qryTmp,'select maxsno=isnull(max(isnull(substring(conno,6,4),0)),0)+1 from #lskoutcheckdetail '
                         +' where jobno="'+strjobno+'" '
          );
   opensql(datatmp.qryTmp1,'select maxsno=isnull(max(isnull(substring(conno,6,4),0)),0)+1 from locationinoutcon(nolock) '
                         +'  where jobno="'+strjobno+'" '
          );
   if datatmp.qryTmp1.FieldByName('maxsno').asinteger>datatmp.qryTmp.FieldByName('maxsno').asinteger then
      strconno:='LSCON'+pad(IntToStr(datatmp.qryTmp1.FieldByName('maxsno').asinteger),4,'0',psLeft)
   else
      strconno:='LSCON'+pad(IntToStr(datatmp.qryTmp.FieldByName('maxsno').asinteger),4,'0',psLeft);
   openSql(qryskudetailcash,'update #lskoutcheckdetail        '+chr(13)+chr(10)
             +'   set conno="'+strconno+'"                    '+chr(13)+chr(10)
             +' where jobno="'+strjobno+'"                    '+chr(13)+chr(10)
             +'   and isnull(conno,"")=""                     '+chr(13)+chr(10)
             +'select jobno, sno=0,ldsno=0,                           '+chr(13)+chr(10)
             +'       skuid,skuname,                                  '+chr(13)+chr(10)
             +'       customerno,color,                               '+chr(13)+chr(10)
             +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
             +'  from #lskoutcheckdetail                                '+chr(13)+chr(10)
             +' group by jobno,                                      '+chr(13)+chr(10)
             +'       skuid,skuname,                                 '+chr(13)+chr(10)
             +'       customerno,color,                              '+chr(13)+chr(10)
             +'       skuspec,quantityuom,conno,bs                         '+chr(13)+chr(10)
             //lzw20101117
             +' union all                                              '+chr(13)+chr(10)
             +'select jobno="",sno=0,ldsno=0,                         '+chr(13)+chr(10)
             +'       skuid="",skuname="",                                  '+chr(13)+chr(10)
             +'       customerno="小计",color="",                               '+chr(13)+chr(10)
             +'       skuspec="",quantity=sum(quantity),quantityuom="",conno,bs="" '+chr(13)+chr(10)
             +'  from #lskoutcheckdetail                                '+chr(13)+chr(10)
             +' group by conno                                        '+chr(13)+chr(10)
             +' order by conno,customerno                                    '+chr(13)+chr(10)

            );
   //更新主表
   opensql(qrytmp1,'select 1 from locationinoutcon(nolock) '
                     +' where jobno="'+strjobno+'" '
                     +'   and conno="'+strconno+'" '
                     );
   if qrytmp1.recordcount>0 then
   begin
      KMessageDlg('此装箱单已打印！',mtWarning,[mbOK],0);

   end;
   opensql(qrytmp1,' select * from SkuDetailOut(nolock) where jobno="'+strjobno+'"');
   _ADOConnection.Starttransaction;
   try
      //lzw20101115
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#lskzxcon") and sysstat & 0xf=3)                     '+chr(13)+chr(10)
                    +'   drop table #lskzxcon                                                                  '+chr(13)+chr(10)
                    +' select distinct jobno,userid="'+_userid+'",username="'+_username+'",                    '+chr(13)+chr(10)
                    +'        conquantity=1,conno=conno,sno=0,iscon="T",operationtype=-1                       '+chr(13)+chr(10)
                    +'   into #lskzxcon                                                                        '+chr(13)+chr(10)
                    +'   from #lskoutcheckdetail (nolock)                                                      '+chr(13)+chr(10)
                    +'  where conno="'+strconno+'"                                                             '+chr(13)+chr(10)
                    +'declare @sno int                                                                         '+chr(13)+chr(10)
                    +' select @sno=(select maxsno=isnull((max(isnull(sno,0))),0)                               '+chr(13)+chr(10)
                    +'                from locationinoutcon con(nolock)                                        '+chr(13)+chr(10)
                    +'               where con.jobno="'+strjobno+'" )                                          '+chr(13)+chr(10)
                    +' update #lskzxcon set sno=@sno,@sno=@sno+1                                               '+chr(13)+chr(10)
                    +' insert into locationinoutcon                                                            '+chr(13)+chr(10)
                    +'        (jobno,userid,username,conquantity,conno,sno,iscon,operationtype)                '+chr(13)+chr(10)
                    +' select jobno,userid,username,conquantity,conno,sno,iscon,operationtype                  '+chr(13)+chr(10)
                    +'   from #lskzxcon (nolock)                                                               '+chr(13)+chr(10)
              );
      //lzw20101115
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#lskzxconsku") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                    +'   drop table #lskzxconsku                                                               '+chr(13)+chr(10)
                    +' select jobno,skuid,skuname,quality="正品",userid="'+_userid+'",username="'+_username+'",'+chr(13)+chr(10)
                    +'        quantityuom,quantity,                                                            '+chr(13)+chr(10)
                    +'        cusid="'+qrytmp1.FieldByName('cusid').asstring+'",                               '+chr(13)+chr(10)
                    +'        cusname="'+qrytmp1.FieldByName('cusname').asstring+'",                           '+chr(13)+chr(10)
                    +'        shippercusid="'+qrytmp1.FieldByName('shippercusid').asstring+'",                 '+chr(13)+chr(10)
                    +'        shippercusname="'+qrytmp1.FieldByName('shippercusname').asstring+'",             '+chr(13)+chr(10)
                    +'        sno=0,customerno,ldsno=0,iscon="T",conno=conno,skuspec,color,operationtype=-1    '+chr(13)+chr(10)
                    +'   into #lskzxconsku                                                                     '+chr(13)+chr(10)
                    +'   from #lskoutcheckdetail (nolock)                                                      '+chr(13)+chr(10)
                    +'  where conno="'+strconno+'"                                                             '+chr(13)+chr(10)
                    +' update #lskzxconsku set                                                                 '+chr(13)+chr(10)
                    +'        sno=#lskzxcon.sno                                                                '+chr(13)+chr(10)
                    +'   from #lskzxcon                                                                        '+chr(13)+chr(10)
                    +'  where #lskzxcon.conno=#lskzxconsku.conno                                               '+chr(13)+chr(10)
                    +'    and #lskzxcon.jobno=#lskzxconsku.jobno                                               '+chr(13)+chr(10)
                    +'    and #lskzxcon.jobno="'+strjobno+'"                                                   '+chr(13)+chr(10)
                    +'declare @ldsno int                                                                       '+chr(13)+chr(10)
                    +' select @ldsno=0                                                                         '+chr(13)+chr(10)
                    +' update #lskzxconsku set ldsno=@ldsno,@ldsno=@ldsno+1                                    '+chr(13)+chr(10)
                    +' insert into locationinoutconsku                                                         '+chr(13)+chr(10)
                    +'        (jobno,skuid,skuname,qualityname,userid,username,                                '+chr(13)+chr(10)
                    +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                    +'        sno,serialno,ldsno,iscon,skuspec,color)                                          '+chr(13)+chr(10)
                    +' select jobno,skuid,skuname,quality,userid,username,                                     '+chr(13)+chr(10)
                    +'        quantityuom,quantity,cusid,cusname,shippercusid,shippercusname,                  '+chr(13)+chr(10)
                    +'        sno,customerno,ldsno,iscon,skuspec,color                                         '+chr(13)+chr(10)
                    +'   from #lskzxconsku (nolock)                                                            '+chr(13)+chr(10)
              );
      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;

   edtcustomerno.Enabled:=False;
   btnprint.Enabled:=True;
end;

procedure Tfrmoutdetailcash.edtcustomernoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtcustomerno.text='' then exit;
end;

procedure Tfrmoutdetailcash.btnprintClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try

      begin

         //lzw20110302
         if Pos('七匹狼',strcusname)>0 then
            OpenSql(dataTmp.qryTmp,'ksp_ckzxd @conno="'+strconno+'" ')
         else if Pos('鸿星尔克',strcusname)>0 then
            OpenSql(dataTmp.qryTmp,'ksp_hxekckzxd @conno="'+strconno+'" ')
         else if Pos('鳄莱特',strcusname)>0 then
            OpenSql(dataTmp.qryTmp,'ksp_eltckzxd @conno="'+strconno+'" ');


         OpenSql(datatmp.qryTmp1,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                                +'       SkuDetailOut.cusbillno                            '+chr(13)+chr(10)
                                +'  from SkuDetailOut(nolock)       '+chr(13)+chr(10)
                                +'       left join customer(nolock) '+chr(13)+chr(10)
                                +'              on customer.cusid=SkuDetailOut.shipcusid   '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'" '+chr(13)+chr(10)
                      );

         KF1Book:=TKF1book.Create;
         with KF1Book do
         begin
            if Pos('七匹狼',strcusname)>0 then
               Bbdm:='100122'
            else if Pos('鸿星尔克',strcusname)>0 then
               Bbdm:='100022'
            else if Pos('鳄莱特',strcusname)>0 then
               Bbdm:='100042';
            paras.Values['jjy']:=_loginname;
            paras.Values['shipcusname']:=dataTmp.qrytmp1.fieldbyname('shipcusname').AsString;
            paras.Values['cusbillno']:=dataTmp.qrytmp1.fieldbyname('cusbillno').AsString;
            paras.Values['date']:=DateToStr(Now);
            paras.Values['address']:=datatmp.qryTmp1.FieldByname('address').AsString;
            paras.Values['mobiletel']:=datatmp.qryTmp1.FieldByname('mobiletel').AsString;
            paras.Values['conno']:=strconno;

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

procedure Tfrmoutdetailcash.quantityValidate(Sender: TObject;
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
     ExecSql(qryTmp,'update #lskoutcheckdetail set '
                 +'       quantity="'+(grdcashsku.InplaceEditor.GetEditingText)+'"     '
                 +' where #lskoutcheckdetail.jobno="'+strjobno+'"                                      '+chr(13)+chr(10)
                 +'   and #lskoutcheckdetail.bs="'+qryskudetailcash.FieldByName('bs').asstring+'"          '+chr(13)+chr(10)
                 +'   and #lskoutcheckdetail.conno=""   '+chr(13)+chr(10)
          );

     opensql(qrytmp1,'select quantity=sum(isnull(detail.quantity,0)),mx.bs,mxsl=sum(isnull(mx.quantity,0)) '+chr(13)+chr(10)
                  +'  from #lskskudetailoutdetail detail(nolock)                       '+chr(13)+chr(10)
                  //lzw20110729
                  //+'  from SkuDetailOutloc detail(nolock)                       '+chr(13)+chr(10)
                  +'       left join #lskoutcheckdetail mx(nolock)                '+chr(13)+chr(10)
                  +'              on detail.jobno=mx.jobno                                  '+chr(13)+chr(10)
                  +'             and mx.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                  +' where detail.jobno="'+strjobno+'"                                            '+chr(13)+chr(10)
                  +'   and mx.bs="'+qryskudetailcash.FieldByName('bs').asstring+'"          '+chr(13)+chr(10)
                  +' group by mx.bs                                                               '+chr(13)+chr(10)
                );
      if (qryTmp1.FieldByName('quantity').asinteger)<(qrytmp1.FieldByName('mxsl').asinteger) then
      begin
         //调用声音文件
         frmdysounds.btnsounds1Click(self);
         KMessageDlg('商品"'+qryTmp1.FieldByName('bs').AsString+'"超过拣货单数量！',mtWarning,[mbOK],0);
         grdcashsku.InplaceEditor.SetFocus;
      end

   end else
   begin
      //
   end;
end;

procedure Tfrmoutdetailcash.grdcashskuEditing(Sender: TObject;
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
             and (stringreplace(qryskudetailcash.FieldByName('conno').asstring,' ','',[rfreplaceall])='')  then
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

procedure Tfrmoutdetailcash.middelClick(Sender: TObject);
begin
   opensql(qryskudetailcash,' delete #lskoutcheckdetail  '+chr(13)+chr(10)
                           +'  where jobno="'+strjobno+'"  '+chr(13)+chr(10)
                           +'    and bs="'+qryskudetailcash.FieldByName('bs').asstring+'" '+chr(13)+chr(10)
                           +'    and conno="'+qryskudetailcash.FieldByName('conno').asstring+'" '
                           +'select jobno, sno=0,ldsno=0,                           '+chr(13)+chr(10)
                           +'       skuid,skuname,                                  '+chr(13)+chr(10)
                           +'       customerno,color,                               '+chr(13)+chr(10)
                           +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
                           +'  from #lskoutcheckdetail                                '+chr(13)+chr(10)
                           //lzw20101201
                           +' where conno="'+qryskudetailcash.FieldByName('conno').asstring+'" '
                           +' group by jobno,                                      '+chr(13)+chr(10)
                           +'       skuid,skuname,                                 '+chr(13)+chr(10)
                           +'       customerno,color,                              '+chr(13)+chr(10)
                           +'       skuspec,quantityuom,conno,bs                         '+chr(13)+chr(10)
                           +' order by  conno                                         '+chr(13)+chr(10)
                           );
end;

end.
