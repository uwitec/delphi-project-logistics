unit LocOutcash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmLocOutcash = class(TForm)
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
    btnzx: TKBitBtn;
    btnprint: TKBitBtn;
    conno: TdxDBGridColumn;
    ppmgrdsku: TPopupMenu;
    middel: TMenuItem;
    ckbcheck: TdxCheckEdit;
    cmblocID: TdxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure qryskudetailcashAfterPost(DataSet: TDataSet);
    procedure grdcashskuEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure btncancellClick(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure btncashClick(Sender: TObject);
    procedure edtcustomernoExit(Sender: TObject);
    procedure edtcustomernoExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnzxClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure middelClick(Sender: TObject);
    procedure quantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure cmblocIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmblocIDExit(Sender: TObject);
  private
    { Private declarations }
    //变量定义
    strMLjobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    //lzw20120528
    strmrlocname,strmrlocid:string;
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
    strconno:string;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkLocOutcash(pstrjobno:string);

var
  frmLocOutcash: TfrmLocOutcash;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect,locationin,dysounds,libbb,ShellAPI;

var strClassID,strZsql,strMxpjbz:string;

procedure WorkLocOutcash(pstrjobno:string);
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
   if frmLocOutcash <> nil then
   with frmLocOutcash do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmLocOutcash:=TfrmLocOutcash.Create(application);

   with frmLocOutcash do
   begin
      strjobno:=pstrjobno;
      //lzw20110222
      OpenSql(qryTmp,'select costcusid,costcusname from locationin(nolock) where jobno="'+strjobno+'"');
      strcusid:=qrytmp.FieldByName('costcusid').asstring;
      strcusname:=qrytmp.FieldByName('costcusname').asstring;
      //lzw20120528
      OpenSql(qryTmp,'select locid,locname from location(nolock)  '
                    +' where locisdisrepair="T"');
      strmrlocid:=qrytmp.FieldByName('locid').asstring;
      strmrlocname:=qrytmp.FieldByName('locname').asstring;
      cmblocid.text:=strmrlocname;
      cmblocid.textfield:=strmrlocid;
      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      {初始化所有数据集}
      ExecSql(dataTmp.qryTmp,'    if exists(select * from tempdb..sysobjects'+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lskcheckdetail") and sysstat & 0xf=3)'+chr(13)+chr(10)
                            +'  drop table #lskcheckdetail'+chr(13)+chr(10)
                            +'create table #lskcheckdetail'+chr(13)+chr(10)
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
      opensql(qrytmp,'select b=sum(isnull(quantity,0)) from ck_lskcheckdetail (nolock)'
                     +' where jobno="'+strjobno+'" ' );
      if qrytmp1.FieldByName('a').AsInteger<qrytmp.FieldByName('b').AsInteger  then
      begin
         execsql(datatmp.qryTmp,'insert into #lskcheckdetail         '+chr(13)+chr(10)
                               +'select  * from ck_lskcheckdetail      '+chr(13)+chr(10)
                               +' where jobno="'+strjobno+'"             '+chr(13)+chr(10)
              );
      end else
      begin
         execsql(datatmp.qryTmp,'insert into #lskcheckdetail         '+chr(13)+chr(10)
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
                              +'  from #lskcheckdetail                                '+chr(13)+chr(10)
                              +' group by jobno,                                      '+chr(13)+chr(10)
                              +'       skuid,skuname,                                 '+chr(13)+chr(10)
                              +'       customerno,color,                              '+chr(13)+chr(10)
                              +'       skuspec,quantityuom,conno,bs                   '+chr(13)+chr(10)
                              +' order by conno,customerno,color,skuspec              '+chr(13)+chr(10)
             );

      ShowModal;
      frmlocoutcash.visible:=true;
      edtcustomerno.SetFocus;
      btncash.Enabled:=true;
      SetFormPosition(frmlocoutcash,true);
      Free;

   end;
end;

procedure TfrmLocOutcash.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior+[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=False;
  grdcashsku.ClearGroupColumns;
end;

procedure TfrmLocOutcash.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdcashsku.OptionsBehavior:=grdcashsku.OptionsBehavior-[edgoEditing];
  grdcashsku.OptionsDB:=grdcashsku.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdcashsku.ShowGroupPanel:=True;
end;

procedure TfrmLocOutcash.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmLocOutcash.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure TfrmLocOutcash.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end; }
    Action := caFree;
    lampchange(lsmenu);
    ExecSql(qryTmp,'drop table #lskcheckdetail ');
end;

procedure TfrmLocOutcash.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdcashsku);
  qryskudetailcash.connection:=_adoconnection;
  qryTmp.connection:=_adoconnection;
  qryTmp1.connection:=_adoconnection;

end;

procedure TfrmLocOutcash.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
end;

procedure TfrmLocOutcash.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryskudetailcash.Close;
  frmLocOutcash:=nil;
end;

procedure TfrmLocOutcash.pgcRelocationChange(Sender: TObject);
begin
   //
end;

procedure TfrmLocOutcash.GetSql;
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

procedure TfrmLocOutcash.qryskudetailcashAfterPost(DataSet: TDataSet);
begin
  if qryskudetailcash.fieldbyname('SKUID').asstring='' then
  begin
    qryskudetailcash.Delete;
  end;
end;

procedure TfrmLocOutcash.grdcashskuEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
var
   s:string;
begin
   allow:=True;
   with grdcashsku do
   begin
      if ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY')) then
      begin
         {opensql(qrytmp,'select skuname from sku(nolock)                                        '
                 //+' where classid=(select classid=substring(classid,1,8) from sku(nolock) '
                 //+'                 where sku.customerno="'+qryskudetailcash.FieldByName('customerno').asstring+'" )'
                 +'where  sku.customerno="'+qryskudetailcash.FieldByName('customerno').asstring+'" )'
                 //lzw20110222
                 +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)

            );
            }
         s:=stringreplace(qryskudetailcash.FieldByName('conno').asstring,' ','',[rfreplaceall]);
         //If (pos('配件',qrytmp.FieldByname('skuname').AsString)>0 )or(pos('服装',qrytmp.FieldByname('skuname').AsString)>0)
         //    and (stringreplace(qryskudetailcash.FieldByName('conno').asstring,' ','',[rfreplaceall])='')  then
         If (stringreplace(qryskudetailcash.FieldByName('conno').asstring,' ','',[rfreplaceall])='')  then
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

procedure TfrmLocOutcash.btncancellClick(Sender: TObject);
begin
   frmLocOutcash.Close;
end;

procedure TfrmLocOutcash.mitAddLocOldClick(Sender: TObject);
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

procedure TfrmLocOutcash.mitDelLocOldClick(Sender: TObject);
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

procedure TfrmLocOutcash.btncashClick(Sender: TObject);
var
   strcys,strskubrand:string;
   F:TextFile;
begin
   if cmblocid.Text='' then
   begin
      if (Kmessagedlg('仓位不能为空,是否继续？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      begin
         cmblocid.setfocus;
         exit;
      end else
      begin
         //扫描数量和装箱数量比对
          OpenSql(datatmp.qryTmp,'select conskusl=sum(case when isnull(#lskcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end), '+chr(13)+chr(10)
                         +'       bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec), '+chr(13)+chr(10)
                         +'       smsl=sum(isnull(#lskcheckdetail.quantity,0))         '+chr(13)+chr(10)
                         +'  from #lskcheckdetail(nolock)                             '+chr(13)+chr(10)
                         +'       left join locationinoutconsku consku(nolock)                                  '+chr(13)+chr(10)
                         +'              on #lskcheckdetail.jobno=consku.jobno               '+chr(13)+chr(10)
                         +'             and #lskcheckdetail.bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                         +' where #lskcheckdetail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                         +'   and consku.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                         +' group by rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                         +'having sum(case when isnull(#lskcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end)<>sum(isnull(#lskcheckdetail.quantity,0))'
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

         _ADOConnection.Starttransaction;
         try
            //存入数据
            opensql(qrytmp,' select * from locationin(nolock) where jobno="'+strjobno+'"');
            strskubrand:=qrytmp.FieldByName('blno').asstring;
            //扫描数量和订单数量比对
            opensql(qryTmp1,'select quantity=isnull(detail.quantity,0),bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                           +'       quantityls=sum(isnull(#lskcheckdetail.quantity,0)),skuname=detail.skuname         '+chr(13)+chr(10)
                           +'  from locinskudetail detail(nolock)                             '+chr(13)+chr(10)
                           +'       left join #lskcheckdetail                                  '+chr(13)+chr(10)
                           +'              on #lskcheckdetail.jobno=detail.jobno               '+chr(13)+chr(10)
                           +'             and #lskcheckdetail.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                           +' where detail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                           +' group by isnull(detail.quantity,0),detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                           +'having (isnull(detail.quantity,0))<>sum(isnull(#lskcheckdetail.quantity,0)) '+chr(13)+chr(10)
                    );
            if qrytmp1.recordcount>0 then
            begin
               ExecSql(datatmp.qrytmp2,'if exists(select * from tempdb..sysobjects '
                                      +'      where id=object_id("tempdb..#lskchecktxt") and sysstat & 0xf=3) '
                                      +'   drop table #lskchecktxt '
                                      +' create table #lskchecktxt( '
                                      +'    bs       varchar(200), '
                                      +'    skuname  varchar(100), '
                                      +'    ddsl     varchar(100), '
                                      +'    smsl     varchar(100),  '
                                      +'    shortsl  varchar(100)  )  '
                                      +'insert into #lskchecktxt                '
                                      +'select bs=" 商品标识",skuname="    品名",ddsl="        订单数量",smsl="扫描数量",shortsl="差异数"  '
                      );
               qrytmp1.First;
               while not qrytmp1.Eof do
               begin
                  Strcys:=IntToStr(strtoint(qrytmp1.FieldByName('quantity').asstring)-strtoint(qrytmp1.FieldByName('quantityls').asstring));

                  OpenSql(datatmp.qrytmp2, 'insert into #lskchecktxt                                             '
                                  +'select bs="'+qrytmp1.FieldByName('bs').asstring+'",                          '
                                  +'       skuname=" '+qrytmp1.FieldByName('skuname').asstring+'",                  '
                                  +'       ddsl="    '+qrytmp1.FieldByName('quantity').asstring+'",                  '
                                  +'       smsl="    '+qrytmp1.FieldByName('quantityls').asstring+'",                '
                                  +'       shortsl="  '+strcys+'"                                                  '
                                  +'select * from  #lskchecktxt                                                  '

                          );
                  qrytmp1.next;
               end;
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
            end;
            if (Kmessagedlg('是否将扫描数据导入？',mtInformation,[mbYes,mbNo],0)=mrYes) then
            begin
               ExecSql(dataTmp.qryTmp,' delete locationinitem                                                        '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          +' delete locationindetail                                                                 '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          +' delete locinskudetail                                                                   '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          );

               ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                             +'        where id=object_id("tempdb..#inputdetail") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                             +'   drop table #inputdetail                                                               '+chr(13)+chr(10)
                             +' select jobno,sno=0,skuid,skuname,qualityname="正品",                                    '+chr(13)+chr(10)
                             +'        userid="'+_userid+'",username="'+_username+'",quantityuom,                       '+chr(13)+chr(10)
                             +'        quantity=sum(isnull(quantity,0)),                                                '+chr(13)+chr(10)
                             +'        taskdate="'+qryTmp.FieldByName('taskdate').AsString+'",                          '+chr(13)+chr(10)
                             +'        cusid="'+qryTmp.FieldByName('costcusid').AsString+'",                            '+chr(13)+chr(10)
                             +'        cusname="'+qryTmp.FieldByName('costcusname').AsString+'",                        '+chr(13)+chr(10)
                             +'        shippercusid="'+qryTmp.FieldByName('costcusid').AsString+'",                     '+chr(13)+chr(10)
                             +'        shippercusname="'+qryTmp.FieldByName('costcusname').AsString+'",                 '+chr(13)+chr(10)
                             +'        iuserid="'+qryTmp.FieldByName('iuserid').AsString+'",                            '+chr(13)+chr(10)
                             +'        iusername="'+qryTmp.FieldByName('iusername').AsString+'",                        '+chr(13)+chr(10)
                             +'        locname=case when "'+cmblocid.text+'"="" then space(20) else "'+cmblocid.text+'" end, '+chr(13)+chr(10)
                             +'        locid=case when "'+cmblocid.text+'"="" then space(20) else "'+cmblocid.textfield+'" end, '+chr(13)+chr(10)
                             +'        operationtype=1,                                                                 '+chr(13)+chr(10)
                             +'        operationdate="'+datetostr(GetServerDate())+'",                '+chr(13)+chr(10)
                             +'        warerentcounttype="IR",countrent="T",                                            '+chr(13)+chr(10)
                             +'        locationbillno="'+qryTmp.FieldByName('locationbillno').AsString+'",              '+chr(13)+chr(10)
                             +'        operationname="'+_Loginname+'",                                                  '+chr(13)+chr(10)
                             +'        costcusid="'+qryTmp.FieldByName('costcusid').AsString+'",                        '+chr(13)+chr(10)
                             +'        costcusname="'+qryTmp.FieldByName('costcusname').AsString+'",                    '+chr(13)+chr(10)
                             +'        cusbillno="'+qryTmp.FieldByName('cusbillno').AsString+'",                        '+chr(13)+chr(10)
                             +'        customerno                                                                       '+chr(13)+chr(10)
                             +'   into #inputdetail                                                                     '+chr(13)+chr(10)
                             +'   from #lskcheckdetail (nolock)                                                         '+chr(13)+chr(10)
                             +'  group by jobno,skuid,skuname,quantityuom,customerno                                    '+chr(13)+chr(10)
                             +'declare @sno int                                                                         '+chr(13)+chr(10)
                             +' select @sno=0                                                                           '+chr(13)+chr(10)
                             +' update #inputdetail set sno=@sno,@sno=@sno+1                                            '+chr(13)+chr(10)
                             +' insert into locationinitem                                                              '+chr(13)+chr(10)
                             +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,skuid,skuname,                               '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        operationname,costcusid,costcusname,quantitytask,cusbillno,customerno)  '+chr(13)+chr(10)
                             +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,skuid,skuname,                  '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        operationname,costcusid,costcusname,quantitytask=quantity,cusbillno,customerno       '+chr(13)+chr(10)
                             +'   from #inputdetail (nolock)                                                            '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             );

         //locationindetail导入
               ExecSql(qryTmp,' insert into locationindetail                                                            '+chr(13)+chr(10)
                             +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                 '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusbillno)                                                 '+chr(13)+chr(10)
                             +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,ldsno=sno,ldsnoin=sno,skuid,skuname,'+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusbillno                                                  '+chr(13)+chr(10)
                             +'   from #inputdetail (nolock)                                                            '+chr(13)+chr(10)
                             );
         //locinskudetail导入
               ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                             +'        where id=object_id("tempdb..#inputskudetail") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                             +'   drop table #inputskudetail                                                            '+chr(13)+chr(10)
                             +' select #inputdetail.jobno,#inputdetail.sno,ldsno=#inputdetail.sno,detailsno=null,         '+chr(13)+chr(10)
                             +'	 #inputdetail.skuid,#inputdetail.skuname,serialno=#inputdetail.customerno,    '+chr(13)+chr(10)
                             +'	 quantity=sum(#lskcheckdetail.quantity),quantityremain=sum(#lskcheckdetail.quantity),'+chr(13)+chr(10)
                             +'	 #inputdetail.quantityuom,#inputdetail.qualityname,color=#lskcheckdetail.color,         '+chr(13)+chr(10)
                             +'        #lskcheckdetail.skuspec,#inputdetail.locid,#inputdetail.locname,              '+chr(13)+chr(10)
                             +'        #inputdetail.costcusid,#inputdetail.costcusname,                           '+chr(13)+chr(10)
                             +'	 #inputdetail.cusid,#inputdetail.cusname,                                   '+chr(13)+chr(10)
                             +'	 #inputdetail.shippercusid,#inputdetail.shippercusname,                   '+chr(13)+chr(10)
                             +'	 #inputdetail.userid,#inputdetail.username,#inputdetail.operationdate,    '+chr(13)+chr(10)
                             +'        #inputdetail.iuserid,#inputdetail.iusername,tracktype="TO"                '+chr(13)+chr(10)
                             +'   into #inputskudetail                                                        '+chr(13)+chr(10)
                             +'   from #lskcheckdetail  (nolock)                                               '+chr(13)+chr(10)
                             +'        left join #inputdetail (nolock)                                       '+chr(13)+chr(10)
                             +'               on #lskcheckdetail.customerno=#inputdetail.customerno           '+chr(13)+chr(10)
                             //+'              and #lskcheckdetail.color=#inputdetail.skucolor              '+chr(13)+chr(10)
                             //+'              and #lskcheckdetail.skuspec=#inputdetail.skuspec             '+chr(13)+chr(10)
                             +'  group by #inputdetail.jobno,#inputdetail.sno,        '+chr(13)+chr(10)
                             +'	 #inputdetail.skuid,#inputdetail.skuname,#inputdetail.customerno,    '+chr(13)+chr(10)
                             +'	 #inputdetail.quantityuom,#inputdetail.qualityname,#lskcheckdetail.color,         '+chr(13)+chr(10)
                             +'        #lskcheckdetail.skuspec,#inputdetail.locid,#inputdetail.locname,              '+chr(13)+chr(10)
                             +'        #inputdetail.costcusid,#inputdetail.costcusname,                           '+chr(13)+chr(10)
                             +'	 #inputdetail.cusid,#inputdetail.cusname,                                   '+chr(13)+chr(10)
                             +'	 #inputdetail.shippercusid,#inputdetail.shippercusname,                   '+chr(13)+chr(10)
                             +'	 #inputdetail.userid,#inputdetail.username,#inputdetail.operationdate,    '+chr(13)+chr(10)
                             +'        #inputdetail.iuserid,#inputdetail.iusername                '+chr(13)+chr(10)

                             +'declare @sno int                                                             '+chr(13)+chr(10)
                             +' select @sno=0                                                                '+chr(13)+chr(10)
                             +' update #inputskudetail set detailsno=@sno,@sno=@sno+1                         '+chr(13)+chr(10)
                             +' insert into locinskudetail                                                   '+chr(13)+chr(10)
                             +'        (jobno,sno,ldsno,detailsno,skuid,                                     '+chr(13)+chr(10)
                             +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                             +'	      qualityname,color,skuspec,locid,locname,                          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,       '+chr(13)+chr(10)
                             +'	      userid,username,operationdate,iuserid,iusername,tracktype)        '+chr(13)+chr(10)
                             +' select jobno,sno,ldsno,detailsno,skuid,                                      '+chr(13)+chr(10)
                             +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                             +'	      qualityname,color,skuspec,locid,locname,                         '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,      '+chr(13)+chr(10)
                             +'	      userid,username,operationdate,iuserid,iusername,tracktype         '+chr(13)+chr(10)
                             +'   from #inputskudetail (nolock)                                               '+chr(13)+chr(10)
                             );
         //更新主表
               ExecSql(qryTmp,' update locationin                                                                       '+chr(13)+chr(10)
                             +'    set operationdate=(select top 1 operationdate from #inputdetail                        '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        quantity=(select sum(isnull(quantity,0)) from #inputdetail                         '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        quantitytasked=(select sum(isnull(quantity,0)) from #inputdetail                   '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        operationname="'+_loginname+'",                                                  '+chr(13)+chr(10)
                             +'        taskisComplete="T",                                                              '+chr(13)+chr(10)
                             +'        cusid=costcusid,cusname=costcusname,                                             '+chr(13)+chr(10)
                             +'        shippercusid=costcusid,shippercusname=costcusname                                '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             +' update locinskudetail set                                                               '+chr(13)+chr(10)
                             +'        skubrand="'+strskubrand+'"                                                       '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             );
            end else
            begin
               ExecSql(qryTmp,' delete ck_lskcheckdetail  where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                             +' insert into ck_lskcheckdetail                                                     '+chr(13)+chr(10)
                             +' select *  from #lskcheckdetail(nolock)                                            '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                             );

            end;
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
         frmlocoutcash.Close;
         frmLocationIN.btnRefresh.OnClick(Sender);
      end;
   end else
   begin
      begin
         //扫描数量和装箱数量比对
          OpenSql(datatmp.qryTmp,'select conskusl=sum(case when isnull(#lskcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end), '+chr(13)+chr(10)
                         +'       bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec), '+chr(13)+chr(10)
                         +'       smsl=sum(isnull(#lskcheckdetail.quantity,0))         '+chr(13)+chr(10)
                         +'  from #lskcheckdetail(nolock)                             '+chr(13)+chr(10)
                         +'       left join locationinoutconsku consku(nolock)                                  '+chr(13)+chr(10)
                         +'              on #lskcheckdetail.jobno=consku.jobno               '+chr(13)+chr(10)
                         +'             and #lskcheckdetail.bs=rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                         +' where #lskcheckdetail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                         +'   and consku.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                         +' group by rtrim(consku.serialno)+rtrim(consku.color)+rtrim(consku.skuspec) '+chr(13)+chr(10)
                         +'having sum(case when isnull(#lskcheckdetail.conno,"")<>"" then isnull(consku.quantity,0) else 0 end)<>sum(isnull(#lskcheckdetail.quantity,0))'
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

         _ADOConnection.Starttransaction;
         try
            //存入数据
            opensql(qrytmp,' select * from locationin(nolock) where jobno="'+strjobno+'"');
            strskubrand:=qrytmp.FieldByName('blno').asstring;
            //扫描数量和订单数量比对
            opensql(qryTmp1,'select quantity=isnull(detail.quantity,0),bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec), '+chr(13)+chr(10)
                           +'       quantityls=sum(isnull(#lskcheckdetail.quantity,0)),skuname=detail.skuname         '+chr(13)+chr(10)
                           +'  from locinskudetail detail(nolock)                             '+chr(13)+chr(10)
                           +'       left join #lskcheckdetail                                  '+chr(13)+chr(10)
                           +'              on #lskcheckdetail.jobno=detail.jobno               '+chr(13)+chr(10)
                           +'             and #lskcheckdetail.bs=rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                           +' where detail.jobno="'+strjobno+'"                                   '+chr(13)+chr(10)
                           +' group by isnull(detail.quantity,0),detail.skuname,rtrim(detail.serialno)+rtrim(detail.color)+rtrim(detail.skuspec) '+chr(13)+chr(10)
                           +'having (isnull(detail.quantity,0))<>sum(isnull(#lskcheckdetail.quantity,0)) '+chr(13)+chr(10)
                    );
            if qrytmp1.recordcount>0 then
            begin
               ExecSql(datatmp.qrytmp2,'if exists(select * from tempdb..sysobjects '
                                      +'      where id=object_id("tempdb..#lskchecktxt") and sysstat & 0xf=3) '
                                      +'   drop table #lskchecktxt '
                                      +' create table #lskchecktxt( '
                                      +'    bs       varchar(200), '
                                      +'    skuname  varchar(100), '
                                      +'    ddsl     varchar(100), '
                                      +'    smsl     varchar(100),  '
                                      +'    shortsl  varchar(100)  )  '
                                      +'insert into #lskchecktxt                '
                                      +'select bs=" 商品标识",skuname="    品名",ddsl="        订单数量",smsl="扫描数量",shortsl="差异数"  '
                      );
               qrytmp1.First;
               while not qrytmp1.Eof do
               begin
                  Strcys:=IntToStr(strtoint(qrytmp1.FieldByName('quantity').asstring)-strtoint(qrytmp1.FieldByName('quantityls').asstring));

                  OpenSql(datatmp.qrytmp2, 'insert into #lskchecktxt                                             '
                                  +'select bs="'+qrytmp1.FieldByName('bs').asstring+'",                          '
                                  +'       skuname=" '+qrytmp1.FieldByName('skuname').asstring+'",                  '
                                  +'       ddsl="    '+qrytmp1.FieldByName('quantity').asstring+'",                  '
                                  +'       smsl="    '+qrytmp1.FieldByName('quantityls').asstring+'",                '
                                  +'       shortsl="  '+strcys+'"                                                  '
                                  +'select * from  #lskchecktxt                                                  '

                          );
                  qrytmp1.next;
               end;
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
            end;
            if (Kmessagedlg('是否将扫描数据导入？',mtInformation,[mbYes,mbNo],0)=mrYes) then
            begin
               ExecSql(dataTmp.qryTmp,' delete locationinitem                                                        '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          +' delete locationindetail                                                                 '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          +' delete locinskudetail                                                                   '+chr(13)+chr(10)
                          +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                          );

               ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                             +'        where id=object_id("tempdb..#inputdetail") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                             +'   drop table #inputdetail                                                               '+chr(13)+chr(10)
                             +' select jobno,sno=0,skuid,skuname,qualityname="正品",                                    '+chr(13)+chr(10)
                             +'        userid="'+_userid+'",username="'+_username+'",quantityuom,                       '+chr(13)+chr(10)
                             +'        quantity=sum(isnull(quantity,0)),                                                '+chr(13)+chr(10)
                             +'        taskdate="'+qryTmp.FieldByName('taskdate').AsString+'",                          '+chr(13)+chr(10)
                             +'        cusid="'+qryTmp.FieldByName('costcusid').AsString+'",                            '+chr(13)+chr(10)
                             +'        cusname="'+qryTmp.FieldByName('costcusname').AsString+'",                        '+chr(13)+chr(10)
                             +'        shippercusid="'+qryTmp.FieldByName('costcusid').AsString+'",                     '+chr(13)+chr(10)
                             +'        shippercusname="'+qryTmp.FieldByName('costcusname').AsString+'",                 '+chr(13)+chr(10)
                             +'        iuserid="'+qryTmp.FieldByName('iuserid').AsString+'",                            '+chr(13)+chr(10)
                             +'        iusername="'+qryTmp.FieldByName('iusername').AsString+'",                        '+chr(13)+chr(10)
                             +'        locname=case when "'+cmblocid.text+'"="" then space(20) else "'+cmblocid.text+'" end, '+chr(13)+chr(10)
                             +'        locid=case when "'+cmblocid.text+'"="" then space(20) else "'+cmblocid.textfield+'" end, '+chr(13)+chr(10)
                             +'        operationtype=1,                                                                 '+chr(13)+chr(10)
                             +'        operationdate="'+datetostr(GetServerDate())+'",                '+chr(13)+chr(10)
                             +'        warerentcounttype="IR",countrent="T",                                            '+chr(13)+chr(10)
                             +'        locationbillno="'+qryTmp.FieldByName('locationbillno').AsString+'",              '+chr(13)+chr(10)
                             +'        operationname="'+_Loginname+'",                                                  '+chr(13)+chr(10)
                             +'        costcusid="'+qryTmp.FieldByName('costcusid').AsString+'",                        '+chr(13)+chr(10)
                             +'        costcusname="'+qryTmp.FieldByName('costcusname').AsString+'",                    '+chr(13)+chr(10)
                             +'        cusbillno="'+qryTmp.FieldByName('cusbillno').AsString+'",                        '+chr(13)+chr(10)
                             +'        customerno                                                                       '+chr(13)+chr(10)
                             +'   into #inputdetail                                                                     '+chr(13)+chr(10)
                             +'   from #lskcheckdetail (nolock)                                                         '+chr(13)+chr(10)
                             +'  group by jobno,skuid,skuname,quantityuom,customerno                                    '+chr(13)+chr(10)
                             +'declare @sno int                                                                         '+chr(13)+chr(10)
                             +' select @sno=0                                                                           '+chr(13)+chr(10)
                             +' update #inputdetail set sno=@sno,@sno=@sno+1                                            '+chr(13)+chr(10)
                             +' insert into locationinitem                                                              '+chr(13)+chr(10)
                             +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,skuid,skuname,                               '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        operationname,costcusid,costcusname,quantitytask,cusbillno,customerno)  '+chr(13)+chr(10)
                             +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,skuid,skuname,                  '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        operationname,costcusid,costcusname,quantitytask=quantity,cusbillno,customerno       '+chr(13)+chr(10)
                             +'   from #inputdetail (nolock)                                                            '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             );

         //locationindetail导入
               ExecSql(qryTmp,' insert into locationindetail                                                            '+chr(13)+chr(10)
                             +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                 '+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusbillno)                                                 '+chr(13)+chr(10)
                             +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=sno,ldsno=sno,ldsnoin=sno,skuid,skuname,'+chr(13)+chr(10)
                             +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                 '+chr(13)+chr(10)
                             +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,             '+chr(13)+chr(10)
                             +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusbillno                                                  '+chr(13)+chr(10)
                             +'   from #inputdetail (nolock)                                                            '+chr(13)+chr(10)
                             );
         //locinskudetail导入
               ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                             +'        where id=object_id("tempdb..#inputskudetail") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                             +'   drop table #inputskudetail                                                            '+chr(13)+chr(10)
                             +' select #inputdetail.jobno,#inputdetail.sno,ldsno=#inputdetail.sno,detailsno=null,         '+chr(13)+chr(10)
                             +'	 #inputdetail.skuid,#inputdetail.skuname,serialno=#inputdetail.customerno,    '+chr(13)+chr(10)
                             +'	 quantity=sum(#lskcheckdetail.quantity),quantityremain=sum(#lskcheckdetail.quantity),'+chr(13)+chr(10)
                             +'	 #inputdetail.quantityuom,#inputdetail.qualityname,color=#lskcheckdetail.color,         '+chr(13)+chr(10)
                             +'        #lskcheckdetail.skuspec,#inputdetail.locid,#inputdetail.locname,              '+chr(13)+chr(10)
                             +'        #inputdetail.costcusid,#inputdetail.costcusname,                           '+chr(13)+chr(10)
                             +'	 #inputdetail.cusid,#inputdetail.cusname,                                   '+chr(13)+chr(10)
                             +'	 #inputdetail.shippercusid,#inputdetail.shippercusname,                   '+chr(13)+chr(10)
                             +'	 #inputdetail.userid,#inputdetail.username,#inputdetail.operationdate,    '+chr(13)+chr(10)
                             +'        #inputdetail.iuserid,#inputdetail.iusername,tracktype="TO"                '+chr(13)+chr(10)
                             +'   into #inputskudetail                                                        '+chr(13)+chr(10)
                             +'   from #lskcheckdetail  (nolock)                                               '+chr(13)+chr(10)
                             +'        left join #inputdetail (nolock)                                       '+chr(13)+chr(10)
                             +'               on #lskcheckdetail.customerno=#inputdetail.customerno           '+chr(13)+chr(10)
                             //+'              and #lskcheckdetail.color=#inputdetail.skucolor              '+chr(13)+chr(10)
                             //+'              and #lskcheckdetail.skuspec=#inputdetail.skuspec             '+chr(13)+chr(10)
                             +'  group by #inputdetail.jobno,#inputdetail.sno,        '+chr(13)+chr(10)
                             +'	 #inputdetail.skuid,#inputdetail.skuname,#inputdetail.customerno,    '+chr(13)+chr(10)
                             +'	 #inputdetail.quantityuom,#inputdetail.qualityname,#lskcheckdetail.color,         '+chr(13)+chr(10)
                             +'        #lskcheckdetail.skuspec,#inputdetail.locid,#inputdetail.locname,              '+chr(13)+chr(10)
                             +'        #inputdetail.costcusid,#inputdetail.costcusname,                           '+chr(13)+chr(10)
                             +'	 #inputdetail.cusid,#inputdetail.cusname,                                   '+chr(13)+chr(10)
                             +'	 #inputdetail.shippercusid,#inputdetail.shippercusname,                   '+chr(13)+chr(10)
                             +'	 #inputdetail.userid,#inputdetail.username,#inputdetail.operationdate,    '+chr(13)+chr(10)
                             +'        #inputdetail.iuserid,#inputdetail.iusername                '+chr(13)+chr(10)

                             +'declare @sno int                                                             '+chr(13)+chr(10)
                             +' select @sno=0                                                                '+chr(13)+chr(10)
                             +' update #inputskudetail set detailsno=@sno,@sno=@sno+1                         '+chr(13)+chr(10)
                             +' insert into locinskudetail                                                   '+chr(13)+chr(10)
                             +'        (jobno,sno,ldsno,detailsno,skuid,                                     '+chr(13)+chr(10)
                             +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                             +'	      qualityname,color,skuspec,locid,locname,                          '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,       '+chr(13)+chr(10)
                             +'	      userid,username,operationdate,iuserid,iusername,tracktype)        '+chr(13)+chr(10)
                             +' select jobno,sno,ldsno,detailsno,skuid,                                      '+chr(13)+chr(10)
                             +'	      skuname,serialno,quantity,quantityremain,quantityuom,            '+chr(13)+chr(10)
                             +'	      qualityname,color,skuspec,locid,locname,                         '+chr(13)+chr(10)
                             +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,      '+chr(13)+chr(10)
                             +'	      userid,username,operationdate,iuserid,iusername,tracktype         '+chr(13)+chr(10)
                             +'   from #inputskudetail (nolock)                                               '+chr(13)+chr(10)
                             );
         //更新主表
               ExecSql(qryTmp,' update locationin                                                                       '+chr(13)+chr(10)
                             +'    set operationdate=(select top 1 operationdate from #inputdetail                        '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        quantity=(select sum(isnull(quantity,0)) from #inputdetail                         '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        quantitytasked=(select sum(isnull(quantity,0)) from #inputdetail                   '+chr(13)+chr(10)
                             +'                        where #inputdetail.jobno=locationin.jobno),                        '+chr(13)+chr(10)
                             +'        operationname="'+_loginname+'",                                                  '+chr(13)+chr(10)
                             +'        taskisComplete="T",                                                              '+chr(13)+chr(10)
                             +'        cusid=costcusid,cusname=costcusname,                                             '+chr(13)+chr(10)
                             +'        shippercusid=costcusid,shippercusname=costcusname                                '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             +' update locinskudetail set                                                               '+chr(13)+chr(10)
                             +'        skubrand="'+strskubrand+'"                                                       '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                             '+chr(13)+chr(10)
                             );
            end else
            begin
               ExecSql(qryTmp,' delete ck_lskcheckdetail  where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                             +' insert into ck_lskcheckdetail                                                     '+chr(13)+chr(10)
                             +' select *  from #lskcheckdetail(nolock)                                            '+chr(13)+chr(10)
                             +'  where jobno="'+strjobno+'"                                                          '+chr(13)+chr(10)
                             );

            end;
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
         frmlocoutcash.Close;
         frmLocationIN.btnRefresh.OnClick(Sender);
      end;
   end;
end;

procedure TfrmLocOutcash.edtcustomernoExit(Sender: TObject);
var
   maxsno:integer;
   strcustomserno,strcustomno:string;
begin
   if edtcustomerno.text='' then  exit;

   opensql(datatmp.qryTmp,'select maxsno=isnull(max(sno),0)+1 from #lskcheckdetail '
                         +' where jobno="'+strjobno+'" '
          );
   maxsno:=datatmp.qryTmp.FieldByName('maxsno').asinteger;
   //lzw20101201
   opensql(datatmp.qryTmp,' select cd=len(replace("'+edtcustomerno.Text+'"," ","")),customerno=replace("'+edtcustomerno.Text+'"," ","") '
          );
   strcustomserno:=datatmp.qryTmp.FieldByName('customerno').AsString;
   if (datatmp.qryTmp.FieldByName('cd').asinteger=14) and (Pos('七匹狼',strcusname)>0)  then
   begin
      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                   +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom,       '+chr(13)+chr(10)
                   +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                   +' where rtrim(sku.customerno)=substring("'+strcustomserno+'",1,6)  '+chr(13)+chr(10)
                   +'   and rtrim(skucolor.colorid)=substring("'+strcustomserno+'",7,5)  '+chr(13)+chr(10)
                   +'   and rtrim(skuspec.specname)=substring("'+strcustomserno+'",12,3) '+chr(13)+chr(10)
                   +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                   +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                   //lzw20110222
                   +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                   //lzw20101126 20110211
                   +iif(ckbcheck.Checked,'and sku.skuid in (select skuid from locationinitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") ','')
                   );
   end else
   if (Pos('鸿星尔克',strcusname)>0)  then
   begin
      if (Pos('*',strcustomserno)>0)  then
          ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                   +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom,       '+chr(13)+chr(10)
                   +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                   +' where rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                   +'   and sku.customerno=substring("'+strcustomserno+'",1,CHARINDEX("*","'+strcustomserno+'")-1)'+chr(13)+chr(10)
                   +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                   +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                   +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)

                   +iif(ckbcheck.Checked,'and sku.skuid in (select skuid from locationinitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") ','')
                   )
      else
         ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                   +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom,       '+chr(13)+chr(10)
                   +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                   +' where skuspec.barcode="'+strcustomserno+'"'+chr(13)+chr(10)
                   +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                   +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                   +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)

                   +iif(ckbcheck.Checked,'and sku.skuid in (select skuid from locationinitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") ','')
                   );
   end else
   if (Pos('鳄莱特',strcusname)>0)   then
   begin

      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                   +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom,       '+chr(13)+chr(10)
                   +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                   +' where (rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                   +'        or rtrim(sku.customno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'") '+chr(13)+chr(10)
                   +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                   +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                   //lzw20110222
                   +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                   //lzw20101126 20110211
                   +iif(ckbcheck.Checked,'and sku.skuid in (select skuid from locationinitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") ','')
                  );
   end else
   begin
      ExecSql(qrytmp1,'    if exists(select * from tempdb..sysobjects                         '+chr(13)+chr(10)
                   +' where id=object_id("tempdb..#lskcheckdetailmx") and sysstat & 0xf=3) '+chr(13)+chr(10)
                   +'  drop table #lskcheckdetailmx                                        '+chr(13)+chr(10)
                   +'select jobno="'+strjobno+'", sno='+inttostr(maxsno)+',ldsno=0,        '+chr(13)+chr(10)
                   +'       skuid=sku.skuid,skuname=sku.skuname,                           '+chr(13)+chr(10)
                   +'       customerno=sku.customerno,color=skucolor.colorname,            '+chr(13)+chr(10)
                   +'       skuspec=skuspec.specname,quantity=1,conno=space(10),quantityuom,       '+chr(13)+chr(10)
                   +'       bs=rtrim(sku.customerno)+rtrim(skucolor.colorname)+rtrim(skuspec.specname)   '+chr(13)+chr(10)
                   +'  into #lskcheckdetailmx                                              '+chr(13)+chr(10)
                   +'  from sku(nolock),skucolor(nolock),skuspec(nolock)                   '+chr(13)+chr(10)
                   +' where rtrim(sku.customerno)+rtrim(skucolor.colorid)+rtrim(skuspec.barcode)="'+strcustomserno+'" '+chr(13)+chr(10)
                   +'   and sku.skuid=skucolor.skuid                                       '+chr(13)+chr(10)
                   +'   and sku.skuid=skuspec.skuid                                        '+chr(13)+chr(10)
                   //lzw20110222
                   +'   and "'+strcusname+'" like "%"+sku.cusname+"%"            '+chr(13)+chr(10)
                   //lzw20101126 20110211
                   +iif(ckbcheck.Checked,'and sku.skuid in (select skuid from locationinitem item(nolock) where item.skuid=sku.skuid and item.jobno="'+strjobno+'") ','')
                  );
   end;

   opensql(qrytmp,'select #lskcheckdetailmx.* from #lskcheckdetailmx(nolock)               '+chr(13)+chr(10)
                 +' where jobno="'+strjobno+'"                                             '+chr(13)+chr(10)
          );
   if qrytmp.RecordCount=0 then
   begin
      //调用声音文件
      frmdysounds.btnsoundsClick(self);
      begin
         KMessageDlg('商品"'+qryTmp.FieldByName('bs').AsString+'"在订单、商品表不存在,不能导入',mtInformation,[mbOK],0);
         ExecSql(datatmp.qrytmp2,'delete #lskcheckdetailmx            '+chr(13)+chr(10)
                                +' where jobno="'+strjobno+'"        '+chr(13)+chr(10)
                                +'   and sno='+inttostr(maxsno)+'    '+chr(13)+chr(10)
                  );
      end
   end else
   begin

      openSql(qryskudetailcash,'insert into #lskcheckdetail          '+chr(13)+chr(10)
          +'select jobno, sno=0,ldsno=0,                          '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,                              '+chr(13)+chr(10)
          +'       skuspec,quantity,quantityuom,conno,bs          '+chr(13)+chr(10)
          +'  from #lskcheckdetailmx                              '+chr(13)+chr(10)
          +' where jobno="'+strjobno+'"                           '+chr(13)+chr(10)
          +'select jobno, sno=0,ldsno=0,                          '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,                              '+chr(13)+chr(10)
          +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
          +'  from #lskcheckdetail                                '+chr(13)+chr(10)
          //lzw20101201
          +' where #lskcheckdetail.conno=""                       '+chr(13)+chr(10)
          +' group by jobno,                                      '+chr(13)+chr(10)
          +'       skuid,skuname,                                 '+chr(13)+chr(10)
          +'       customerno,color,                              '+chr(13)+chr(10)
          +'       skuspec,quantityuom,conno,bs                   '+chr(13)+chr(10)
         );
   end;
   edtcustomerno.clear;
   edtcustomerno.setfocus;
   btnzx.Enabled:=True;
end;

procedure TfrmLocOutcash.edtcustomernoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if edtcustomerno.text='' then exit;
end;

procedure TfrmLocOutcash.btnzxClick(Sender: TObject);
begin
   if (Kmessagedlg('是否确定装箱？',mtInformation,[mbYes,mbNo],0)<>mrYes) then exit;
   opensql(datatmp.qryTmp,'select maxsno=isnull(max(isnull(substring(conno,6,4),0)),0)+1 from #lskcheckdetail '
                         +' where jobno="'+strjobno+'" '
          );
   opensql(datatmp.qryTmp1,'select maxsno=isnull(max(isnull(substring(conno,6,4),0)),0)+1 from locationinoutcon(nolock) '
                         +'  where jobno="'+strjobno+'" '
          );
   if datatmp.qryTmp1.FieldByName('maxsno').asinteger>datatmp.qryTmp.FieldByName('maxsno').asinteger then
      strconno:='LSCON'+pad(IntToStr(datatmp.qryTmp1.FieldByName('maxsno').asinteger),4,'0',psLeft)
   else
      strconno:='LSCON'+pad(IntToStr(datatmp.qryTmp.FieldByName('maxsno').asinteger),4,'0',psLeft);
   openSql(qryskudetailcash,'update #lskcheckdetail        '+chr(13)+chr(10)
             +'   set conno="'+strconno+'"                    '+chr(13)+chr(10)
             +' where jobno="'+strjobno+'"                    '+chr(13)+chr(10)
             +'   and isnull(conno,"")=""                     '+chr(13)+chr(10)
             +'select jobno, sno=0,ldsno=0,                           '+chr(13)+chr(10)
             +'       skuid,skuname,                                  '+chr(13)+chr(10)
             +'       customerno,color,                               '+chr(13)+chr(10)
             +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
             +'  from #lskcheckdetail                                '+chr(13)+chr(10)
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
             +'  from #lskcheckdetail                                '+chr(13)+chr(10)
             +' group by conno                                        '+chr(13)+chr(10)
             +' order by conno,customerno                                    '+chr(13)+chr(10)
            );

   //打印开始
   opensql(qrytmp1,' select * from locationin(nolock) where jobno="'+strjobno+'"');
   _ADOConnection.Starttransaction;
   try
      //lzw20101115
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#lskzxcon") and sysstat & 0xf=3)                     '+chr(13)+chr(10)
                    +'   drop table #lskzxcon                                                                  '+chr(13)+chr(10)
                    +' select distinct jobno,userid="'+_userid+'",username="'+_username+'",                    '+chr(13)+chr(10)
                    +'        conquantity=1,conno=conno,sno=0,iscon="T",operationtype=1                       '+chr(13)+chr(10)
                    +'   into #lskzxcon                                                                        '+chr(13)+chr(10)
                    +'   from #lskcheckdetail (nolock)                                                      '+chr(13)+chr(10)
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
                    +'        cusid="'+qrytmp1.FieldByName('costcusid').asstring+'",                               '+chr(13)+chr(10)
                    +'        cusname="'+qrytmp1.FieldByName('costcusname').asstring+'",                           '+chr(13)+chr(10)
                    +'        shippercusid="'+qrytmp1.FieldByName('costcusid').asstring+'",                 '+chr(13)+chr(10)
                    +'        shippercusname="'+qrytmp1.FieldByName('costcusname').asstring+'",             '+chr(13)+chr(10)
                    +'        sno=0,customerno,ldsno=0,iscon="T",conno=conno,skuspec,color,operationtype=1    '+chr(13)+chr(10)
                    +'   into #lskzxconsku                                                                     '+chr(13)+chr(10)
                    +'   from #lskcheckdetail (nolock)                                                      '+chr(13)+chr(10)
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
   //打印结束
   //edtcustomerno.Enabled:=False;
   btnzx.Enabled:=False;
   btnprint.Enabled:=True;
   edtcustomerno.SetFocus;
end;

procedure TfrmLocOutcash.btnprintClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      //lzw20101202
      {opensql(qrytmp1,'select 1 from locationinoutcon(nolock) '
                     +' where jobno="'+strjobno+'" '
                     +'   and conno="'+strconno+'" '
                     );
      if qrytmp1.recordcount>0 then
      begin
         KMessageDlg('此装箱单已打印！',mtWarning,[mbOK],0);

      end else}
      begin
         {//更新主表
         opensql(qrytmp1,' select * from locationin(nolock) where jobno="'+strjobno+'"');
         _ADOConnection.Starttransaction;
         try
            //lzw20101115
            ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                          +'        where id=object_id("tempdb..#lskzxcon") and sysstat & 0xf=3)                     '+chr(13)+chr(10)
                          +'   drop table #lskzxcon                                                                  '+chr(13)+chr(10)
                          +' select distinct jobno,userid="'+_userid+'",username="'+_username+'",                    '+chr(13)+chr(10)
                          +'        conquantity=1,conno=conno,sno=0,iscon="T",operationtype=1                       '+chr(13)+chr(10)
                          +'   into #lskzxcon                                                                        '+chr(13)+chr(10)
                          +'   from #lskcheckdetail (nolock)                                                      '+chr(13)+chr(10)
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
                          +'        cusid="'+qrytmp1.FieldByName('costcusid').asstring+'",                               '+chr(13)+chr(10)
                          +'        cusname="'+qrytmp1.FieldByName('costcusname').asstring+'",                           '+chr(13)+chr(10)
                          +'        shippercusid="'+qrytmp1.FieldByName('costcusid').asstring+'",                 '+chr(13)+chr(10)
                          +'        shippercusname="'+qrytmp1.FieldByName('costcusname').asstring+'",             '+chr(13)+chr(10)
                          +'        sno=0,customerno,ldsno=0,iscon="T",conno=conno,skuspec,color,operationtype=1    '+chr(13)+chr(10)
                          +'   into #lskzxconsku                                                                     '+chr(13)+chr(10)
                          +'   from #lskcheckdetail (nolock)                                                      '+chr(13)+chr(10)
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
         end;}
         //OpenSql(dataTmp.qryTmp,'ksp_rkzxd @conno="'+strconno+'" ') ;
         if Pos('七匹狼',strcusname)>0 then
         begin
            OpenSql(dataTmp.qryTmp,'ksp_rkzxd    @jobno="'+strjobno+'",@conno="'+strconno+'" ');
         end else
         if Pos('鸿星尔克',strcusname)>0 then
         begin
            OpenSql(dataTmp.qryTmp,'ksp_hxekrkzxd @jobno="'+strjobno+'",@conno="'+strconno+'" ');
         end else
         if Pos('鳄莱特',strcusname)>0 then
         begin
            OpenSql(dataTmp.qryTmp,'ksp_eltrkzxd @jobno="'+strjobno+'",@conno="'+strconno+'" ');
         end;
         OpenSql(datatmp.qryTmp1,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                                +'       locationin.cusbillno,locationin.locationbillno   '+chr(13)+chr(10)
                                +'  from locationin(nolock)       '+chr(13)+chr(10)
                                +'       left join customer(nolock) '+chr(13)+chr(10)
                                +'              on customer.cusid=locationin.shipcusid   '+chr(13)+chr(10)
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
            paras.Values['locationbillno']:=dataTmp.qrytmp1.fieldbyname('locationbillno').AsString;

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

procedure TfrmLocOutcash.middelClick(Sender: TObject);
begin
   opensql(qryskudetailcash,' delete #lskcheckdetail  '
                           +'  where jobno="'+strjobno+'"  '
                           +'    and bs="'+qryskudetailcash.FieldByName('bs').asstring+'" '
                           //lzw20101201
                           +'    and conno="'+qryskudetailcash.FieldByName('conno').asstring+'" '
                           +'select jobno, sno=0,ldsno=0,                           '+chr(13)+chr(10)
                           +'       skuid,skuname,                                  '+chr(13)+chr(10)
                           +'       customerno,color,                               '+chr(13)+chr(10)
                           +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
                           +'  from #lskcheckdetail                                '+chr(13)+chr(10)
                           //lzw20101201
                           +' where conno="'+qryskudetailcash.FieldByName('conno').asstring+'" '
                           +' group by jobno,                                      '+chr(13)+chr(10)
                           +'       skuid,skuname,                                 '+chr(13)+chr(10)
                           +'       customerno,color,                              '+chr(13)+chr(10)
                           +'       skuspec,quantityuom,conno,bs                         '+chr(13)+chr(10)
                           +' order by  conno                                         '+chr(13)+chr(10)
                           );
end;

procedure TfrmLocOutcash.quantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   ExecSql(qryTmp,'update #lskcheckdetail set  '+chr(13)+chr(10)
                 +'       quantity="'+(grdcashsku.InplaceEditor.GetEditingText)+'"      '+chr(13)+chr(10)
                 +' where #lskcheckdetail.jobno="'+strjobno+'"                                 '+chr(13)+chr(10)
                 +'   and #lskcheckdetail.bs="'+qryskudetailcash.FieldByName('bs').asstring+'" '+chr(13)+chr(10)
                 +'   and #lskcheckdetail.conno=""   '+chr(13)+chr(10)
          );
  { openSql(qryskudetailcash,'select jobno, sno=0,ldsno=0,         '+chr(13)+chr(10)
           +'       skuid,skuname,                                 '+chr(13)+chr(10)
           +'       customerno,color,                              '+chr(13)+chr(10)
           +'       skuspec,quantity=sum(quantity),quantityuom,conno,bs '+chr(13)+chr(10)
           +'  from #lskcheckdetail                                '+chr(13)+chr(10)
           +' where #lskcheckdetail.jobno="'+strjobno+'"                                 '+chr(13)+chr(10)
           +'   and #lskcheckdetail.conno=""   '+chr(13)+chr(10)
           +' group by jobno,                                      '+chr(13)+chr(10)
           +'       skuid,skuname,                                 '+chr(13)+chr(10)
           +'       customerno,color,                              '+chr(13)+chr(10)
           +'       skuspec,quantityuom,conno,bs                   '+chr(13)+chr(10)
         );
         }
end;

procedure TfrmLocOutcash.cmblocIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      cmblocID.TextField  :=qrySelect.FieldByName('locid').asstring;
      cmblocID.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);

end;

procedure TfrmLocOutcash.cmblocIDExit(Sender: TObject);
begin
  if cmblocID.Text='' then cmblocID.TextField:='';
end;

end.
