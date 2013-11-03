unit inputlocinitemsku;  //为了外运福清专门开发的，其他的不适用

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DB, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
   libproc, libuser, GMSLabel, Menus, DBClient, DragBar, dxTL, dxDBGrid,
   dxCntner, dxDBCtrl, dxEditor, dxExEdtr, dxEdLib, KBitBtn,
   KGroupBox, KUpdateSql, ComCtrls, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, ADODB, KDataSetProvider, dxDBTLCl,
   dxGrClms, KinPickEdit, dxDBELib;

type
  Tfrminputlocinitemsku = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    btnClose: TKBitBtn;
    DragBar1: TDragBar;
    Panel5: TPanel;
    btnInPutOrder: TKBitBtn;
    btnOK: TKBitBtn;
    GMSStickyLabel2: TGMSStickyLabel;
    edtPath: TdxButtonEdit;
    OpenDialog1: TOpenDialog;
    KGroupBox2: TKGroupBox;
    SaveDialog1: TSaveDialog;
    qryOrder: TKADOQuery;
    dtsOrder: TDataSource;
    qrySku: TKADOQuery;
    dtsSku: TDataSource;
    grdSku: TdxDBGrid;
    lsno: TdxDBGridColumn;
    skuname: TdxDBGridButtonColumn;
    lotcode: TdxDBGridButtonColumn;
    quantity: TdxDBGridCurrencyColumn;
    piece: TdxDBGridCurrencyColumn;
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    cmbTemple: TKinPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    skumodel: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    qryTmp2: TKADOQuery;
    casing1: TdxDBGridCurrencyColumn;
    qualityname: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    qryTmpItem: TKADOQuery;
    qryTmpDetail: TKADOQuery;
    dtdReceDateF: TdxDateEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    timReceDateF: TdxTimeEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
       Shift: TShiftState);
    procedure btnInPutOrderClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure mitDelOrderClick(Sender: TObject);
  Private
    { Private declarations }
    strSql,strInOut: string;
    strlocinjobno:string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
    strcusid,strcusname:string;
  Public
    { Public declarations }
  end;

procedure workinputlocinitemsku(pstrjobno:string);
var
   frminputlocinitemsku: Tfrminputlocinitemsku;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp;
var
   AverageSpeed: Double = 0;

procedure workinputlocinitemsku(pstrjobno:string);
begin
   if (frminputlocinitemsku <> nil) and frminputlocinitemsku.HandleAllocated then
   with frminputlocinitemsku do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrminputlocinitemsku, frminputlocinitemsku);
   with frminputlocinitemsku do
   begin
      dtdReceDateF.Date:=Date;
      timReceDateF.Time:=Time;
      cmbTemple.Items.Clear;
      cmbTemple.ItemFields.Clear;
      OpenSql(qryTmp1,' select * from  formatin (nolock)  ');
      qryTmp1.First;
      while not qryTmp1.Eof do
      begin
         cmbTemple.Items.Add(qryTmp1.FieldByName('fsname').AsString);
         cmbTemple.ItemFields.Add(qryTmp1.FieldByName('fsid').AsString);
         qryTmp1.Next;
      end;
      cmbTemple.ItemIndex:=0;
      qryTmp1.Close;
      strlocinjobno:=pstrjobno;
   end;
   frminputlocinitemsku.Show;
end;

procedure Tfrminputlocinitemsku.btnCloseClick(Sender: TObject);
begin
   frminputlocinitemsku.close;
end;

procedure Tfrminputlocinitemsku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrminputlocinitemsku.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdSku);
   qryTmp.Connection:=_ADOConnection;
   qryOrder.Connection:=_ADOConnection;
   qrySku.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
   qryTmp2.Connection:=_ADOConnection;
   qryTmpItem.Connection:=_ADOConnection;
   qryTmpDetail.Connection:=_ADOConnection;
end;

procedure Tfrminputlocinitemsku.FormDestroy(Sender: TObject);
begin
   frminputlocinitemsku:=nil;
end;

procedure Tfrminputlocinitemsku.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure Tfrminputlocinitemsku.btnInPutOrderClick(Sender: TObject);
var
   lstcubage:TStringList;
   strsql:string;
begin
   //清除旧数据
   droplsk('#lskformatin');
   try
      FileTOGrid(qrySku,grdSku,edtPath.Text,cmbTemple.TextField);
   except
      exit;
   end;
//判断品质
   ExecSql(qryTmp,' update #lskformatin set qualityname="正品" where isnull(qualityname,"")="" ');
//判断仓位
   OpenSql(qryTmp,'select qualityname from #lskformatin  '+chr(13)+chr(10)
                 +' where not exists (select 1 from codelib (nolock)     '+chr(13)+chr(10)
                 +'                           where codelib.codeclass="04"  '+chr(13)+chr(10)
                 +'                             and codelib.codename=#lskformatin.qualityname  )');
   if qryTmp.RecordCount<>0 then
   begin
      kMessageDlg('品质：'+qryTmp.Fieldbyname('qualityname').AsString+'在系统中不存在，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end;

//判断品名是否正确
   OpenSql(qryTmp,'select skuname from #lskformatin  '+chr(13)+chr(10)
                 +' where not exists (select 1 from locationinitem (nolock)     '+chr(13)+chr(10)
                 +'                           where locationinitem.jobno="'+strlocinjobno+'" '+chr(13)+chr(10)
                 +'                             and locationinitem.skuname=#lskformatin.skuname  )');
   if qryTmp.RecordCount<>0 then
   begin
      kMessageDlg('料号：'+qryTmp.Fieldbyname('skuname').AsString+'不正确，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end;

//判断品名是否有缺少
   OpenSql(qryTmp,'select skuname from locationinitem (nolock)  '+chr(13)+chr(10)
                 +' where locationinitem.jobno="'+strlocinjobno+'"  '+chr(13)+chr(10)
                 +'   and not exists (select 1 from #lskformatin (nolock)     '+chr(13)+chr(10)
                 +'                    where locationinitem.skuname=#lskformatin.skuname  )');
   if qryTmp.RecordCount<>0 then
   begin
      kMessageDlg('料号：'+qryTmp.Fieldbyname('skuname').AsString+'在Excel中未输入，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end;

//判断仓位
   OpenSql(qryTmp,'select locname from #lskformatin  '+chr(13)+chr(10)
                 +' where not exists (select 1 from location (nolock)     '+chr(13)+chr(10)
                 +'                           where location.locname=#lskformatin.locname  )');
   if qryTmp.RecordCount<>0 then
   begin
      kMessageDlg('仓位：'+qryTmp.Fieldbyname('locname').AsString+'不正确，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end;
//判断发票号
   OpenSql(qryTmp,'select lotcode from #lskformatin  '+chr(13)+chr(10)
                 +' where not exists (select 1 from locationinitem (nolock)     '+chr(13)+chr(10)
                 +'                           where locationinitem.lotcode=#lskformatin.lotcode  )');
   if qryTmp.RecordCount<>0 then
   begin
      kMessageDlg('发票号：'+qryTmp.Fieldbyname('lotcode').AsString+'不正确，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end;

   OpenSql(qryTmp,' select cusid,cusname from formatin where fsid="'+cmbTemple.TextField+'" ');
   strcusid:=qryTmp.fieldbyname('cusid').AsString;
   strcusname:=qryTmp.fieldbyname('cusname').AsString;

   droplsk('#inputlocinitemsku ');
   ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                 +' where id=object_id("tempdb..#inputlocinitemsku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                 +'  drop table #inputlocinitemsku                                         '+chr(13)+chr(10)
                 +'select sno,jobno,ldsno,taskdate, '+chr(13)+chr(10)
                 +'       userid,username,iuserid,iusername,   '+chr(13)+chr(10)
                 +'       cusbillno,locationbillno,WareRentcountType,     '+chr(13)+chr(10)
                 +'       pieceuom,quantityuom, '+chr(13)+chr(10)
                 +'       piece,quantity,casing1, '+chr(13)+chr(10)
                 +'       skuid,skuname,qualityname, '+chr(13)+chr(10)
                 +'       locid,locname,lotcode,skumodel,skuspec    '+chr(13)+chr(10)
                 +'  into #inputlocinitemsku '+chr(13)+chr(10)
                 +'  from locationindetail (nolock)'+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );

   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;

   OpenSql(qryTmp2,'select cusbillno,locationbillno,WareRentcountType,taskdate,     '+chr(13)+chr(10)
                  +'       iuserid=locationin.iuserid,iusername=locationin.iusername,userid,username '+chr(13)+chr(10)
                  +'  from locationin (nolock)'+chr(13)+chr(10)
                  +' where locationin.jobno="'+strlocinjobno+'"  '+chr(13)+chr(10)
                   );

  execsql(qryTmp,'insert #inputlocinitemsku  '+chr(13)+chr(10)
                +'            (                '+chr(13)+chr(10)
                +'       sno,ldsno,taskdate,'+chr(13)+chr(10)
                +'       jobno,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid        '+chr(13)+chr(10)
                +'             )               '+chr(13)+chr(10)
                +'select sno=0,ldsno=1, '+chr(13)+chr(10)
                +'       taskdate="'+qryTmp2.fieldbyname('taskdate').AsString+'",'+chr(13)+chr(10)
                +'       jobno="'+strlocinjobno+'", '+chr(13)+chr(10)
                +'       userid="'+qryTmp2.fieldbyname('userid').AsString+'",'+chr(13)+chr(10)
                +'       username="'+qryTmp2.fieldbyname('username').AsString+'",   '+chr(13)+chr(10)
                +'       iuserid="'+qryTmp2.fieldbyname('iuserid').AsString+'",   '+chr(13)+chr(10)
                +'       iusername="'+qryTmp2.fieldbyname('iusername').AsString+'",   '+chr(13)+chr(10)
                +'       cusbillno="'+qryTmp2.fieldbyname('cusbillno').AsString+'",  '+chr(13)+chr(10)
                +'       locationbillno="'+qryTmp2.fieldbyname('locationbillno').AsString+'",  '+chr(13)+chr(10)
                +'       WareRentcountType="'+qryTmp2.fieldbyname('WareRentcountType').AsString+'",  '+chr(13)+chr(10)
                +'       pieceuom=isnull(locationinitem.pieceuom,""),  '+chr(13)+chr(10)
                +'       locationinitem.quantityuom,  '+chr(13)+chr(10)
                +'       #lskformatin.piece,#lskformatin.quantity,#lskformatin.casing1,   '+chr(13)+chr(10)
                +'       skuid=locationinitem.skuid,#lskformatin.skuname,   '+chr(13)+chr(10)
                +'       qualityname=#lskformatin.qualityname,    '+chr(13)+chr(10)
                +'       #lskformatin.lotcode,locationinitem.skumodel,locationinitem.skuspec,   '+chr(13)+chr(10)
                +'       locname=#lskformatin.locname,locid=location.locid        '+chr(13)+chr(10)
                +' from  #lskformatin    (nolock)                                             '+chr(13)+chr(10)
                +'              left join locationinitem (nolock)                        '+chr(13)+chr(10)
                +'                              on locationinitem.jobno="'+strlocinjobno+'" '+chr(13)+chr(10)
                +'                             and locationinitem.skuname=#lskformatin.skuname  '+chr(13)+chr(10)
                +'                             and isnull(locationinitem.lotcode,"")=isnull(#lskformatin.lotcode,"")  '+chr(13)+chr(10)
                +'              left join location(nolock)                                         '+chr(13)+chr(10)
                +'                     on location.locname=#lskformatin.locname              '+chr(13)+chr(10)
                +'declare @i int                                                '+chr(13)+chr(10)
                +' select @i=1                                                 '+chr(13)+chr(10)
                +' update #inputlocinitemsku                                    '+chr(13)+chr(10)
                +'    set ldsno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                );
   strSql:='select *                              '+chr(13)+chr(10)
          +'  from #inputlocinitemsku   (nolock)  '+chr(13)+chr(10)
          +' where 1=1                            '+chr(13)+chr(10);
   qrySku.close;
   qrySku.SQL.Clear;
   qrySku.SQL.Add(strSql);
   qrySku.Open;
   btnOK.Enabled:=True;
end;

procedure Tfrminputlocinitemsku.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno:string;
  strlocname:string;
begin
   if dtdReceDateF.Date=0 then
   begin
      kMessageDlg('请选择开始日期！', mtInformation, [mbOK], 0); //nomsg
      Exit;
   end;

   if (Kmessagedlg('是否确定导入进仓商品数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
//处理临时表

   droplsk('#inputitem');

   ExecSql(qryTmp,'  select    '+chr(13)+chr(10)
                +'       sno,taskdate, '+chr(13)+chr(10)
                +'       jobno,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid        '+chr(13)+chr(10)
                +'  into #inputitem '+chr(13)+chr(10)
                +'  from locationinitem (nolock)    '+chr(13)+chr(10)
                +' where 1=2           '+chr(13)+chr(10)
                 );

      ExecSql(qryTmp,'  insert into #inputitem   '+chr(13)+chr(10)
                +'      ( sno,taskdate,'+chr(13)+chr(10)
                +'       jobno,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec )   '+chr(13)+chr(10)
                +'  select  sno,taskdate,'+chr(13)+chr(10)
                +'       jobno,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece=sum(isnull(piece,0)),quantity=sum(isnull(quantity,0)),casing1=sum(isnull(casing1,0)),   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec  '+chr(13)+chr(10)
                +'  from #inputlocinitemsku     '+chr(13)+chr(10)
                +' group by                   '+chr(13)+chr(10)
                +'       sno,taskdate, '+chr(13)+chr(10)
                +'       jobno,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec  '+chr(13)+chr(10)
                +'declare @i int                       '+chr(13)+chr(10)
                +' select @i=1                         '+chr(13)+chr(10)
                +' update #inputitem                  '+chr(13)+chr(10)
                +'    set sno=@i,@i=@i+1             '+chr(13)+chr(10)
                +' update #inputlocinitemsku set sno=#inputitem.sno              '+chr(13)+chr(10)
                +'   from #inputitem                    '+chr(13)+chr(10)
                +'  where #inputlocinitemsku.skuid=#inputitem.skuid   '+chr(13)+chr(10)
                +'    and #inputlocinitemsku.lotcode=#inputitem.lotcode   '+chr(13)+chr(10)
                +'    and #inputlocinitemsku.qualityname=#inputitem.qualityname   '+chr(13)+chr(10)
                  );
   OpenSql(qryTmpItem,' select * from #inputitem ');
   OpenSql(qryTmpDetail,' select * from #inputlocinitemsku ');
   qrytmpitem.first;
   while not qryTmpItem.Eof do
   begin
      strlocname:='';
      qrytmpdetail.first;
      while not qryTmpDetail.eof do
      begin
         if qryTmpDetail.FieldByName('sno').AsInteger=qryTmpItem.FieldByName('sno').AsInteger then
            strlocname:=strlocname+qryTmpDetail.FieldByName('locname').AsString+',';
         qryTmpDetail.Next;
      end;                        
      strlocname:=Copy(strlocname,1,Length(strlocname)-1);
      ExecSql(qryTmp,' update #inputitem set locname="'+strlocname+'" where sno='+qryTmpItem.FieldByName('sno').Asstring+' ');
      qryTmpItem.Next;
   end;

   _ADOConnection.Starttransaction;
   try
      ExecSql(qryOrder,' delete  locationinitem where jobno="'+strlocinjobno+'"  '+chr(13)+chr(10)
                +'   insert into locationindetail    '+chr(13)+chr(10)
                +'       (sno,ldsno,operationtype,jobnoinf,snoinf,ldsnoinf,'+chr(13)+chr(10)
                +'       jobno,taskdate,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid,        '+chr(13)+chr(10)
                +'       operationdate,costcusid,costcusname,cusid,cusname,shippercusid,shippercusname)  '+chr(13)+chr(10)
                +' select         '+chr(13)+chr(10)
                +'       sno,ldsno,1,jobno,sno,ldsno,'+chr(13)+chr(10)
                +'       jobno,taskdate,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid,        '+chr(13)+chr(10)
                +'       operationdate="'+dtdReceDateF.text+' '+TimeToStr(timReceDateF.Time)+'",  '+chr(13)+chr(10)
                +'       "'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'"   '+chr(13)+chr(10)
                +'  from  #inputlocinitemsku           '+chr(13)+chr(10)

                +'      insert into locationinitem                                          '+chr(13)+chr(10)
                +'       (sno,operationtype,quantitytask,jobnoinf,snoinf,ldsnoinf,'+chr(13)+chr(10)
                +'       jobno,operationname,taskdate,'+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid,        '+chr(13)+chr(10)
                +'       operationdate,costcusid,costcusname,cusid,cusname,shippercusid,shippercusname)  '+chr(13)+chr(10)
                +' select         '+chr(13)+chr(10)
                +'       sno,1,quantity,jobno,sno,-11,'+chr(13)+chr(10)
                +'       jobno,"'+_loginname+'",taskdate, '+chr(13)+chr(10)
                +'       userid,'+chr(13)+chr(10)
                +'       username,   '+chr(13)+chr(10)
                +'       iuserid,   '+chr(13)+chr(10)
                +'       iusername,   '+chr(13)+chr(10)
                +'       cusbillno,  '+chr(13)+chr(10)
                +'       locationbillno,  '+chr(13)+chr(10)
                +'       WareRentcountType,  '+chr(13)+chr(10)
                +'       pieceuom,  '+chr(13)+chr(10)
                +'       quantityuom,  '+chr(13)+chr(10)
                +'       piece,quantity,casing1,   '+chr(13)+chr(10)
                +'       skuid,skuname,   '+chr(13)+chr(10)
                +'       qualityname,    '+chr(13)+chr(10)
                +'       lotcode,skumodel,skuspec,   '+chr(13)+chr(10)
                +'       locname,locid,        '+chr(13)+chr(10)
                +'       operationdate="'+dtdReceDateF.text+' '+TimeToStr(timReceDateF.Time)+'",  '+chr(13)+chr(10)
                +'       "'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'","'+strcusid+'","'+strcusname+'"   '+chr(13)+chr(10)
                +'  from #inputitem   '+chr(13)+chr(10)
                +'  update locationin set operationdate="'+dtdReceDateF.text+' '+TimeToStr(timReceDateF.Time)+'", '+chr(13)+chr(10)
                +'                        carrierdate="'+dtdReceDateF.text+' '+TimeToStr(timReceDateF.Time)+'",  '+chr(13)+chr(10)
                +'                        OPERATIONNAME="'+_loginname+'" '+chr(13)+chr(10)
                +'  where jobno="'+strlocinjobno+'"     '+chr(13)+chr(10)
                      );
      KMessageDlg('导入上架信息完成，请刷新数据！',mtInformation,[mbOK],0);
      droplsk('#inputlocinitemsku');
      droplsk('#inputitem');
      droplsk('#lskformatin');
      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   frminputlocinitemsku.Close;
   qrysku.Close;
end;

procedure Tfrminputlocinitemsku.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure Tfrminputlocinitemsku.mitDelOrderClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('你确定删除该数据?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
   for i:=grdsku.SelectedCount-1 Downto 0 do
   begin
      _ADOConnection .Starttransaction;
      try
        ExecSql(qryTmp,'delete from #inputlocinitemsku '
                      +'  where jobno="'+qrysku.FieldByName('jobno').AsString+'" ');
        TdxDBGridNode(grdsku.FocusedNode).Delete;
        qrySku.ApplyUpdates;
        _ADOConnection.Commit;
      except
        if _ADOConnection.InTransaction then
           _ADOConnection.Rollback;
        raise;
        Exit;
      end;
      qrySku.CommitUpdates;
   end;
end;

end.

