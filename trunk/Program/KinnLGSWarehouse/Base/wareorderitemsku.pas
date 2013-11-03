unit wareorderitemsku;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DB, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
   libproc, libuser, GMSLabel, Menus, DBClient, DragBar, dxTL, dxDBGrid,
   dxCntner, dxDBCtrl, dxEditor, dxExEdtr, dxEdLib, KBitBtn,
   KGroupBox, KUpdateSql, ComCtrls, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, ADODB, KDataSetProvider, dxDBTLCl,
   dxGrClms, KinPickEdit, dxDBELib, dxPageControl;

   
type
  Tfrmwareorderitemsku = class(TForm)
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
    SaveDialog1: TSaveDialog;
    qryOrder: TKADOQuery;
    dtsOrder: TDataSource;
    qrySku: TKADOQuery;
    dtsSku: TDataSource;
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    cmbTemple: TKinPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    qryTmp2: TKADOQuery;
    pgcWareOther: TdxPageControl;
    tbsSku: TdxTabSheet;
    tbsInfo: TdxTabSheet;
    memSkuname: TdxMemo;
    memcustomerno: TdxMemo;
    memskumodel: TdxMemo;
    memskuspec: TdxMemo;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel16: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    grdSku: TdxDBGrid;
    sno: TdxDBGridColumn;
    lotcode: TdxDBGridButtonColumn;
    piece: TdxDBGridCurrencyColumn;
    skumodel: TdxDBGridColumn;
    skuname: TdxDBGridButtonColumn;
    quantity: TdxDBGridCurrencyColumn;
    skuspec: TdxDBGridColumn;
    netweight: TdxDBGridCurrencyColumn;
    grossweight: TdxDBGridCurrencyColumn;
    mainorder: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    shippercusname: TdxDBGridButtonColumn;
    cusname: TdxDBGridColumn;
    quantityuom: TdxDBGridPickColumn;
    pieceuom: TdxDBGridPickColumn;
    weightuom: TdxDBGridPickColumn;
    remark: TdxDBGridColumn;
    price: TdxDBGridColumn;
    skucost: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
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
    strlocoutjobno:string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
  Public
    { Public declarations }
  end;

procedure workwareorderitemsku(pstrjobno:string);
var
   frmwareorderitemsku: Tfrmwareorderitemsku;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp;
var
   AverageSpeed: Double = 0;

procedure workwareorderitemsku(pstrjobno:string);
begin
   if (frmwareorderitemsku <> nil) and frmwareorderitemsku.HandleAllocated then
   with frmwareorderitemsku do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrmwareorderitemsku, frmwareorderitemsku);
   with frmwareorderitemsku do
   begin
      tbsInfo.TabVisible:=false;
      //lzw20100914
      if _StrSysCus='DHA' then
      begin
         cmbTemple.TextField:='11';
         cmbTemple.Text:='出仓任务导入';

         skucost.Visible:=True;
         price.Visible:=True;

         remark.Visible:=False;

         mainorder.Visible:=False;
         cusbillno.Visible:=False;
         cusname.Visible:=False;
         shippercusname.Visible:=False;
         netweight.Visible:=False;
         grossweight.Visible:=False;
         weightuom.Visible:=False;
         lotcode.Visible:=False;
         cmbTemple.Enabled:=False;
      end;
      //lzw20111101
      if _StrSysCus='JG' then
      begin
         cmbTemple.Enabled:=False;
         cmbTemple.TextField:='10';
         cmbTemple.Text:='出仓导入';
      end;
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
      if (_StrSysCus<>'DHA') and (_StrSysCus<>'JG')then
      begin
         cmbTemple.ItemIndex:=0;
      end;


      qryTmp1.Close;
      strlocoutjobno:=pstrjobno;
   end;
   frmwareorderitemsku.Show;
end;

procedure Tfrmwareorderitemsku.btnCloseClick(Sender: TObject);
begin
   frmwareorderitemsku.close;
end;

procedure Tfrmwareorderitemsku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrmwareorderitemsku.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetDxDbGrid(grdSku);
   qryTmp.Connection:=_ADOConnection;
   qryOrder.Connection:=_ADOConnection;
   qrySku.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
   qryTmp2.Connection:=_ADOConnection;
end;

procedure Tfrmwareorderitemsku.FormDestroy(Sender: TObject);
begin
   frmwareorderitemsku:=nil;
end;

procedure Tfrmwareorderitemsku.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure Tfrmwareorderitemsku.btnInPutOrderClick(Sender: TObject);
var
   lstcubage:TStringList;
   strsql,strZsql,strskuname,strskunameitem,strshippercusname,strcusname:string;
   strcustomerno,strskuspec,strskumodel:string;
begin
   ExecSql(qryTmp2,  '    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                    +' where id=object_id("tempdb..#wareorderskuitem") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                    +'  drop table #wareorderskuitem                                         '+chr(13)+chr(10)
            );
   ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                 +' where id=object_id("tempdb..#wareorderitemSku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                 +'  drop table #wareorderitemSku                                         '+chr(13)+chr(10)
                 +'select orisku.sno,orisku.jobno,orisku.jobnoin,orisku.snoin,orisku.ldsnoinf,  '+chr(13)+chr(10)
                 +'       orisku.userid,orisku.username,iuserid=orisku.userid,iusername=orisku.username,   '+chr(13)+chr(10)
                 +'       orisku.pieceuom,orisku.weightuom,orisku.volumeuom,orisku.areauom,orisku.quantityuom, '+chr(13)+chr(10)
                 +'       orisku.piece,orisku.grossweight,orisku.netweight,orisku.volume,orisku.area,orisku.quantity, '+chr(13)+chr(10)
                 +'       orisku.skuid,classid=space(40),orisku.skuname,orisku.qualityname,    '+chr(13)+chr(10)
                 +'       orisku.shippercusid,orisku.shippercusname,orisku.mainorder,'+chr(13)+chr(10)
                 +'       orisku.cusbillno,orisku.cusid,orisku.cusname,orisku.costcusid,orisku.costcusname,orisku.remark, '+chr(13)+chr(10)
                 +'       orisku.price,orisku.skucost,orisku.lotcode,SKU.skumodel,SKU.skuspec,SKU.customerno    '+chr(13)+chr(10)
                 +'  into #wareorderitemSku '+chr(13)+chr(10)
                 +'  from wareorderorisku orisku (nolock)'+chr(13)+chr(10)
                 +'       left join SKU (nolock)  '+chr(13)+chr(10)
                 +'              on sku.skuid=orisku.skuid '+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );
   ExecSql(qryTmp,'select orisku.sno,orisku.jobno,orisku.jobnoin,orisku.snoin,orisku.ldsnoinf,orisku.userid,orisku.username,iuserid=orisku.userid,iusername=orisku.username,   '+chr(13)+chr(10)
                 +'       orisku.pieceuom,orisku.weightuom,orisku.volumeuom,orisku.areauom,orisku.quantityuom, '+chr(13)+chr(10)
                 +'       orisku.piece,orisku.grossweight,orisku.netweight,orisku.volume,orisku.area,orisku.quantity, '+chr(13)+chr(10)
                 +'       orisku.skuid,classid=space(40),orisku.skuname,orisku.qualityname,orisku.shippercusid,orisku.shippercusname,orisku.mainorder,'+chr(13)+chr(10)
                 +'       orisku.cusbillno,orisku.cusid,orisku.cusname,orisku.costcusid,orisku.costcusname,orisku.remark, '+chr(13)+chr(10)
                 +'       orisku.price,orisku.skucost,orisku.lotcode,SKU.skumodel,SKU.skuspec,SKU.customerno    '+chr(13)+chr(10)
                 +'  into #wareorderskuitem '+chr(13)+chr(10)
                 +'  from wareorderorisku orisku (nolock)'+chr(13)+chr(10)
                 +'       left join SKU (nolock)  '+chr(13)+chr(10)
                 +'              on sku.skuid=orisku.skuid '+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );
   opensql(qrysku,'select *  from #wareorderitemSku ');

   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;
   //清除旧数据
   ExecSql(qryTmp,'delete from #wareorderitemSku ');
   ExecSql(qryTmp,'delete from #wareorderskuitem ');
   try
     FileTOGrid(qrySku,grdSku,edtPath.Text,cmbTemple.TextField);
   except
      exit;
   end;

   OpenSql(qryTmp2,'select costcusid=wareorder.costcusid,costcusname=wareorder.costcusname,'+chr(13)+chr(10)
                  +'       shippercusname=wareorder.costcusname,  '+chr(13)+chr(10)
                  +'       cusid=wareorder.costcusid,cusname=wareorder.costcusname,'+chr(13)+chr(10)
                  +'       cusbillno=wareorder.cusbillno,mainorder=wareorder.mainorder,  '+chr(13)+chr(10)
                  +'       iuserid=wareorder.iuserid, iusername=wareorder.username,userid,username '+chr(13)+chr(10)
                  +'  from wareorder (nolock)'+chr(13)+chr(10)
                  +' where wareorder.jobno="'+strlocoutjobno+'"  '+chr(13)+chr(10)
                   );


   //lzw20111101
   if _StrSysCus='JG' then
   begin

      OpenSql(dataTmp.qryTmp2,'select distinct skuname,skuspec,skumodel,customerno from  #lskformatin           '+chr(13)+chr(10)
                             +' where not exists(select 1 from sku(nolock)                             '+chr(13)+chr(10)
                             +'                   where isnull(sku.skuname,"")=isnull(#lskformatin.skuname,"")    '+chr(13)+chr(10)
                             +'                     and isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                             +'                     and isnull(sku.skumodel,"")=isnull(#lskformatin.skumodel,"") '+chr(13)+chr(10)
                             +'                     and isnull(sku.customerno,"")=isnull(#lskformatin.customerno,"") '+chr(13)+chr(10)
                             +'                     and isnull(isdetail,"F")="T" )                              '+chr(13)+chr(10)
                 );
      strskuname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strskuname:=strskuname+dataTmp.qryTmp2.fieldbyname('skuname').AsString+chr(13)+chr(10);
         strcustomerno:=strcustomerno+dataTmp.qryTmp2.fieldbyname('customerno').AsString+chr(13)+chr(10);
         strskumodel:=strskumodel+dataTmp.qryTmp2.fieldbyname('skumodel').AsString+chr(13)+chr(10);
         strskuspec:=strskuspec+dataTmp.qryTmp2.fieldbyname('skuspec').AsString+chr(13)+chr(10);
         datatmp.qryTmp2.Next;
      end;
      if strskuname<>'' then
      begin
         tbsinfo.TabVisible:=true;
         pgcWareOther.ActivePage:=tbsinfo;
         memskuname.text:=strskuname;
         memcustomerno.text:=strcustomerno;
         memskumodel.text:=strskumodel;
         memskuspec.text:=strskuspec;
         Kmessagedlg('存在商品资料库未建档的商品,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
      //货主
      OpenSql(dataTmp.qryTmp2,'select shippercusname from  #lskformatin                              '+chr(13)+chr(10)
                             +' where not exists(select 1 from customer(nolock)                                     '+chr(13)+chr(10)
                             +'                   where isnull(customer.cusname,"")=isnull(#lskformatin.shippercusname,"") )         '+chr(13)+chr(10)
                 );
      strshippercusname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strshippercusname:=strshippercusname+'/'+dataTmp.qryTmp2.fieldbyname('shippercusname').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strshippercusname<>'' then
      begin
         Kmessagedlg('"'+strshippercusname+'"不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
      //寄仓单位
      {OpenSql(dataTmp.qryTmp2,'select cusname from  #lskformatin                              '+chr(13)+chr(10)
                             +' where not exists(select 1 from customer(nolock)                                     '+chr(13)+chr(10)
                             +'                   where isnull(customer.cusname,"")=isnull(#lskformatin.cusname,"") )         '+chr(13)+chr(10)
                 );
      strcusname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strcusname:=strcusname+'/'+dataTmp.qryTmp2.fieldbyname('cusname').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strcusname<>'' then
      begin
         Kmessagedlg('"'+strcusname+'"不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
       //lhl 20120207}
      execsql(qryTmp,'insert #wareorderitemSku  '+chr(13)+chr(10)
                 +'select sno=0,'
                 +'       jobno="'+strlocoutjobno+'",'
                 +'       jobnoin=space(20)  ,'+chr(13)+chr(10)
                 +'       snoin=0       ,'+chr(13)+chr(10)
                 +'       ldsnoin=0      ,'+chr(13)+chr(10)
                 +'       userid="'+qryTmp2.fieldbyname('userid').AsString+'",'+chr(13)+chr(10)
                 +'       username="'+qryTmp2.fieldbyname('username').AsString+'",   '+chr(13)+chr(10)
                 +'       iuserid="'+qryTmp2.fieldbyname('iuserid').AsString+'",   '+chr(13)+chr(10)
                 +'       iusername="'+qryTmp2.fieldbyname('iusername').AsString+'",   '+chr(13)+chr(10)
                 +'       pieceuom=isnull(sku.pieceuom,""),sku.weightuom,volumeuom="",areauom="",'+chr(13)+chr(10)
                 +'       sku.quantityuom,#lskformatin.piece,#lskformatin.grossweight,                '+chr(13)+chr(10)
                 +'       #lskformatin.netweight,volume=0,area=0,#lskformatin.quantity,               '+chr(13)+chr(10)
                 +'       skuid=sku.skuid,classid=sku.classid,#lskformatin.skuname,qualityname="正品",'+chr(13)+chr(10)
                 +'       shippercusid=shipper.cusid,    '+chr(13)+chr(10)
                 +'       shippercusname=#lskformatin.shippercusname,'+chr(13)+chr(10)
                 +'       mainorder="'+qryTmp2.fieldbyname('mainorder').AsString+'",       '+chr(13)+chr(10)
                 +'       cusbillno="'+qryTmp2.fieldbyname('cusbillno').AsString+'",       '+chr(13)+chr(10)
                 +'       cusid=isnull(cus.cusid,""),           '+chr(13)+chr(10)           //lhl20120207
                 +'       cusname=isnull(#lskformatin.cusname,""),       '+chr(13)+chr(10) //20120207
                 +'       costcusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       costcusname="'+qryTmp2.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                 +'       remark="",price=0,skucost=0,               '+chr(13)+chr(10)
                 +'       #lskformatin.lotcode ,#lskformatin.skumodel,#lskformatin.skuspec,#lskformatin.customerno '+chr(13)+chr(10)
                 +' from  #lskformatin    (nolock)                                       '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                            '+chr(13)+chr(10)
                 +'              on sku.skuname=#lskformatin.skuname                       '+chr(13)+chr(10)
                 +'             and isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                 +'             and isnull(sku.skumodel,"")=isnull(#lskformatin.skumodel,"") '+chr(13)+chr(10)
                 +'       left join customer shipper(nolock)                                 '+chr(13)+chr(10)
                 +'              on shipper.cusname=#lskformatin.shippercusname        '+chr(13)+chr(10)
                 +'       left join customer cus(nolock)                                     '+chr(13)+chr(10)
                 +'              on cus.cusname=#lskformatin.cusname                       '+chr(13)+chr(10)

                 +' where 1=1                                               '+chr(13)+chr(10)
                 +'declare @i smallint                                      '+chr(13)+chr(10)
                 +' if exists(select 1 from wareorderorisku(nolock) where jobno="'+strlocoutjobno+'")'+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +'    select @i=max(isnull(sno,0))+1 from wareorderorisku(nolock) where jobno="'+strlocoutjobno+'"'+chr(13)+chr(10)
                 +' end else                                                '+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +' select @i=0                                             '+chr(13)+chr(10)
                 +' end                                                     '+chr(13)+chr(10)
                 +' update #wareorderitemSku                                    '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 //+' update #wareorderitemSku                                    '+chr(13)+chr(10)
                 //+'    set piece=isnull(quantity/isnull(piecepro,1),0)     '+chr(13)+chr(10)
                 //+'   from sku(nolock)                                     '+chr(13)+chr(10)
                 //+'  where sku.skuid=#wareorderitemSku.skuid              '+chr(13)+chr(10)

                 );

      OpenSql(qryTmp,'select * from #wareorderitemSku');
   end;

   qrySku.Close;
   qrySku.Open;
   btnOK.Enabled:=True;
end;

procedure Tfrmwareorderitemsku.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno:string;
begin
  //赋业务联系单号
   opensql(dataTmp.qryTmp,'select datenow=getDate() ');
   strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
   if (Kmessagedlg('是否确定导入出仓指令商品数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(qryOrder,'insert into wareorderorisku                                                      '+chr(13)+chr(10)
                      +'       (jobno,sno,jobnoin,snoin,jobnoinf,snoinf,ldsnoinf,warerentcounttype,      '+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype,userid,username,                       '+chr(13)+chr(10)
                      +'        pieceuom,weightuom, quantityori,                                         '+chr(13)+chr(10)
                      +'        volumeuom,areauom,quantityuom,piece,grossweight,                         '+chr(13)+chr(10)
                      +'        netweight,volume,area,quantity,skuid,skuname,                            '+chr(13)+chr(10)
                      +'        qualityname,shippercusid,shippercusname,                                 '+chr(13)+chr(10)
                      +'        cusid,cusname,costcusid,costcusname,skucost,price,lotcode  )             '+chr(13)+chr(10)
                      +' select jobno=#outskuitem.jobno,sno=#outskuitem.sno,                             '+chr(13)+chr(10)
                      +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,                     '+chr(13)+chr(10)
                      +'        jobnoinf=#outskuitem.jobnoin,snoinf=#outskuitem.snoin,-1,"IR",           '+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype=-1,                                    '+chr(13)+chr(10)
                      +'        userid,username,pieceuom,weightuom,quantityori=#outskuitem.quantity,     '+chr(13)+chr(10)
                      +'        volumeuom,areauom,quantityuom,piece,grossweight,                         '+chr(13)+chr(10)
                      +'        netweight,volume,area,quantity,skuid,skuname,                            '+chr(13)+chr(10)
                      +'        "正品",shippercusid, shippercusname, cusid,cusname,                      '+chr(13)+chr(10)
                      +'        costcusid,costcusname, skucost,price,lotcode                             '+chr(13)+chr(10)
                      +'  from  #wareorderitemSku #outskuitem                                            '+chr(13)+chr(10)
                      +'  where isnull(skuid,"")<>""'
                      );
      KMessageDlg('导入任务商品资料完成!',mtInformation,[mbOK],0);
      droplsk('#wareorderitemSku');
      droplsk('#lskformatin');
      //lihl     20111207
      ExecSql(qryOrder,'update wareorder set quantityori='+floattostr(quantity.SummaryFooterValue)+'   '+chr(13)+chr(10)
                      +'  where wareorder.jobno="'+strlocoutjobno+'"            '+chr(13)+chr(10)
                      );
      _ADOConnection.Commit;


   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   frmwareorderitemsku.Close;
   qrysku.Close;
end;

procedure Tfrmwareorderitemsku.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure Tfrmwareorderitemsku.mitDelOrderClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('你确定删除该数据?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
   for i:=grdsku.SelectedCount-1 Downto 0 do
   begin
      _ADOConnection .Starttransaction;
      try
        ExecSql(qryTmp,'delete from #locinitemSku '
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

