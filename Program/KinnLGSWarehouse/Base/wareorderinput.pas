unit wareorderinput;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DB, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
   libproc, libuser, GMSLabel, Menus, DBClient, DragBar, dxTL, dxDBGrid,
   dxCntner, dxDBCtrl, dxEditor, dxExEdtr, dxEdLib, KBitBtn,
   KGroupBox, KUpdateSql, ComCtrls, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, ADODB, KDataSetProvider, dxDBTLCl,
   dxGrClms, KinPickEdit, dxDBELib,shellapi;

   
type
  Tfrmwareorderinput = class(TForm)
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
    sno: TdxDBGridColumn;
    skuname: TdxDBGridButtonColumn;
    lotcode: TdxDBGridButtonColumn;
    quantity: TdxDBGridCurrencyColumn;
    quantityuom: TdxDBGridPickColumn;
    grossweight: TdxDBGridCurrencyColumn;
    netweight: TdxDBGridCurrencyColumn;
    weightuom: TdxDBGridPickColumn;
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    cmbTemple: TKinPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    mainorder: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    qryTmp2: TKADOQuery;
    price: TdxDBGridColumn;
    skucost: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    color: TdxDBGridColumn;
    skucards: TdxDBGridColumn;
    shipcusname: TdxDBGridColumn;
    outzoneno: TdxDBGridColumn;
    costcusname: TdxDBGridColumn;
    customsno: TdxDBGridColumn;
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
    strlocoutjobno,strorderid,strDate:string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
  Public
    { Public declarations }
  end;

procedure workwareorderinput(pstrjobno:string);
var
   frmwareorderinput: Tfrmwareorderinput;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp;
var
   AverageSpeed: Double = 0;

procedure workwareorderinput(pstrjobno:string);
begin
   if (frmwareorderinput <> nil) and frmwareorderinput.HandleAllocated then
   with frmwareorderinput do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrmwareorderinput, frmwareorderinput);
   with frmwareorderinput do
   begin
    

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
      if _StrSysCus='XT' then
      begin
         cmbTemple.Enabled:=False;
         cmbTemple.TextField:='13';
         cmbTemple.Text:='入库装箱清单模板';
      end;
      qryTmp1.Close;
      strlocoutjobno:=pstrjobno;
   end;
   frmwareorderinput.Show;
end;

procedure Tfrmwareorderinput.btnCloseClick(Sender: TObject);
begin
   frmwareorderinput.close;
end;

procedure Tfrmwareorderinput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrmwareorderinput.FormCreate(Sender: TObject);
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
end;

procedure Tfrmwareorderinput.FormDestroy(Sender: TObject);
begin
   frmwareorderinput:=nil;
end;

procedure Tfrmwareorderinput.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure Tfrmwareorderinput.btnInPutOrderClick(Sender: TObject);
var
   lstcubage:TStringList;
   strsql,strZsql,strskuname,strskunameitem,strshippercusname,strcusname,strshipcusname,strlotcode:string;
begin
   if cmbTemple.text='' then
   begin
      Kmessagedlg('请选择入库清单导入模板！', mtInformation,[mbOk],0);
      exit;
   end;
   ExecSql(qryTmp2,  '    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                    +' where id=object_id("tempdb..#wareorderinput") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                    +'  drop table #wareorderinput                                         '+chr(13)+chr(10)
            );
   ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                 +' where id=object_id("tempdb..#wareorderinput") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                 +'  drop table #wareorderinput                                         '+chr(13)+chr(10)
                 +'select orisku.sno,orisku.jobno, orisku.outzoneno, '+chr(13)+chr(10)
                 +'       orisku.userid,orisku.username,iuserid=orisku.userid,iusername=orisku.username,   '+chr(13)+chr(10)
                 +'       orisku.weightuom,orisku.quantityuom,orderid, '+chr(13)+chr(10)
                 +'       orisku.grossweight,orisku.netweight,orisku.quantity, '+chr(13)+chr(10)
                 +'       orisku.skuid,orisku.skuname,orisku.qualityname, orisku.shipcusid, orisku.shipcusname,  '+chr(13)+chr(10)
                 +'       orisku.shippercusid,orisku.shippercusname,orisku.mainorder,orisku.customsno,'+chr(13)+chr(10)
                 +'       orisku.cusbillno,orisku.cusid,orisku.cusname,orisku.costcusid,orisku.costcusname,orisku.remark, '+chr(13)+chr(10)
                 +'       orisku.price,orisku.skucost,orisku.lotcode,SKU.color,SKU.skucards,SKU.skuspec,SKU.customerno    '+chr(13)+chr(10)
                 +'  into #wareorderinput '+chr(13)+chr(10)
                 +'  from wareordersku orisku (nolock)'+chr(13)+chr(10)
                 +'       left join SKU (nolock)  '+chr(13)+chr(10)
                 +'              on sku.skuid=orisku.skuid '+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );
   opensql(qrysku,'select *  from #wareorderinput ');

   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;
   //清除旧数据
   ExecSql(qryTmp,'delete from #wareorderinput ');
   try
     FileTOGrid(qrySku,grdSku,edtPath.Text,cmbTemple.TextField);
   except
      exit;
   end;
   {
   OpenSql(qryTmp2,'select costcusid=wareorder.costcusid,costcusname=wareorder.costcusname,'+chr(13)+chr(10)
                  +'       shippercusname=wareorder.costcusname,shippercusid=wareorder.shippercusid,  '+chr(13)+chr(10)
                  +'       cusid=wareorder.costcusid,cusname=wareorder.costcusname,'+chr(13)+chr(10)
                  +'       cusbillno=wareorder.cusbillno,mainorder=wareorder.mainorder,  '+chr(13)+chr(10)
                  +'       iuserid=wareorder.iuserid, iusername=wareorder.username,userid,username '+chr(13)+chr(10)
                  +'  from wareorder (nolock)'+chr(13)+chr(10)
                  +' where wareorder.jobno="'+strlocoutjobno+'"  '+chr(13)+chr(10)
                   );
   }
   //lzw20111101
   if _StrSysCus='XT' then
   begin

      //判断为空
      OpenSql(dataTmp.qryTmp2,'if exists(select * from tempdb..sysobjects  '+chr(13)+chr(10)
                             +'      where id=object_id("tempdb..#lskwareorderskutxt") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'   drop table #lskwareorderskutxt  '+chr(13)+chr(10)
                             +' create table #lskwareorderskutxt(  '+chr(13)+chr(10)
                             +'    outzoneno       varchar(50),  '+chr(13)+chr(10)
                             +'    customerno       varchar(50),  '+chr(13)+chr(10)
                             +'    color  varchar(30),  '+chr(13)+chr(10)
                             +'    skuspec  varchar(30),  '+chr(13)+chr(10)
                             +'    quantity  numeric(16,4),  '+chr(13)+chr(10)
                             +'    customsno  varchar(50),  '+chr(13)+chr(10)
                             +'    grossweight numeric(16,4),'+chr(13)+chr(10)
                             +'    netweight numeric(16,4), '+chr(13)+chr(10)
                             +'    lotcode   varchar(50)  , '+chr(13)+chr(10)
                             +'    shipcusname    varchar(50), '+chr(13)+chr(10)
                             +'    cusbillno    varchar(50)  , '+chr(13)+chr(10)
                             +'    costcusname    varchar(50) )    '+chr(13)+chr(10)
                             +'select * '+chr(13)+chr(10)
                             +'  from  #lskformatin      '+chr(13)+chr(10)
                 );
      dataTmp.qryTmp2.First;
      while not dataTmp.qryTmp2.Eof do
      begin
         if (dataTmp.qryTmp2.fieldbyname('outzoneno').AsString='') or  //箱号
            (dataTmp.qryTmp2.fieldbyname('customerno').AsString='') or  //款号
            (dataTmp.qryTmp2.fieldbyname('color').AsString='') or  //颜色
            (dataTmp.qryTmp2.fieldbyname('skuspec').AsString='') or  //尺码
            (dataTmp.qryTmp2.fieldbyname('quantity').AsString='') or  //数量
            (dataTmp.qryTmp2.fieldbyname('customsno').AsString='') or  //区域码
            (dataTmp.qryTmp2.fieldbyname('grossweight').AsString='') or  //毛重
            (dataTmp.qryTmp2.fieldbyname('netweight').AsString='') or  //净重
            (dataTmp.qryTmp2.fieldbyname('lotcode').AsString='') or  //箱条码
            (dataTmp.qryTmp2.fieldbyname('shipcusname').AsString='') or  //工厂
            //(dataTmp.qryTmp2.fieldbyname('cusbillno').AsString='') or  //客户单号
            (dataTmp.qryTmp2.fieldbyname('costcusname').AsString='') then  //客户
         begin
            OpenSql(datatmp.qrytmp1, 'insert into #lskwareorderskutxt            '+chr(13)+chr(10)
                            +'select outzoneno=case when "'+dataTmp.qryTmp2.fieldbyname('outzoneno').AsString+'"="" then "箱号为空" else "'+dataTmp.qryTmp2.fieldbyname('outzoneno').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       customerno=case when "'+dataTmp.qryTmp2.fieldbyname('customerno').AsString+'"="" then "款号为空" else "'+dataTmp.qryTmp2.fieldbyname('customerno').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       color=case when "'+dataTmp.qryTmp2.fieldbyname('color').AsString+'"="" then "颜色为空" else "'+dataTmp.qryTmp2.fieldbyname('color').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       skuspec=case when "'+dataTmp.qryTmp2.fieldbyname('skuspec').AsString+'"="" then "尺码为空" else "'+dataTmp.qryTmp2.fieldbyname('skuspec').AsString+'" end ,    '+chr(13)+chr(10)

                            +'       quantity=case when "'+dataTmp.qryTmp2.fieldbyname('quantity').AsString+'"="" then "数量为空" else "'+dataTmp.qryTmp2.fieldbyname('quantity').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       customsno=case when "'+dataTmp.qryTmp2.fieldbyname('customsno').AsString+'"="" then "区域码为空" else "'+dataTmp.qryTmp2.fieldbyname('customsno').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       grossweight=case when "'+dataTmp.qryTmp2.fieldbyname('grossweight').AsString+'"="" then "毛重为空" else "'+dataTmp.qryTmp2.fieldbyname('grossweight').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       netweight=case when "'+dataTmp.qryTmp2.fieldbyname('netweight').AsString+'"="" then "净重为空" else "'+dataTmp.qryTmp2.fieldbyname('netweight').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       lotcode=case when "'+dataTmp.qryTmp2.fieldbyname('lotcode').AsString+'"="" then "箱条码为空" else "'+dataTmp.qryTmp2.fieldbyname('lotcode').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       shipcusname=case when "'+dataTmp.qryTmp2.fieldbyname('shipcusname').AsString+'"="" then "工厂为空" else "'+dataTmp.qryTmp2.fieldbyname('shipcusname').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       cusbillno=case when "'+dataTmp.qryTmp2.fieldbyname('cusbillno').AsString+'"="" then "客户单号为空" else "'+dataTmp.qryTmp2.fieldbyname('cusbillno').AsString+'" end ,    '+chr(13)+chr(10)
                            +'       costcusname=case when "'+dataTmp.qryTmp2.fieldbyname('costcusname').AsString+'"="" then "客户为空" else "'+dataTmp.qryTmp2.fieldbyname('costcusname').AsString+'" end     '+chr(13)+chr(10)

                            +'select * from  #lskwareorderskutxt                                                  '

                    );

         end;

         dataTmp.qryTmp2.next;
      end;
      OpenSql(datatmp.qrytmp1, 'select * from  #lskwareorderskutxt             '+chr(13)+chr(10)
                   );
      if datatmp.qrytmp1.RecordCount>0 then
      begin
         if GetExedir+'\'+'装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv'='' then
         begin
            QueryExportTxt('#lskwareorderskutxt').SaveToFile(GetExedir+'\'+'装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv');
         end else
         begin
            DeleteFile(GetExedir+'\'+'装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv') ;
            QueryExportTxt('#lskwareorderskutxt').SaveToFile(GetExedir+'\'+'装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv');
         end;
         Kmessagedlg('装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv'+'文件在'+GetExedir, mtInformation,[mbOk],0);
         //ShellExecute(Application.Handle, 'open',pchar(''+GetExedir+'\'+'装箱清单导入异常记录'+copy(Trim(DateTimeToStr(GetServerDate)),1,10)+'.csv'),'','',SW_SHOW);

         exit;
      end;
      //商品
      OpenSql(dataTmp.qryTmp2,'select skuspec,color,customerno,                                                       '+chr(13)+chr(10)
                             +'       skucards=rtrim(isnull(customerno,""))+rtrim(isnull(color,""))+rtrim(isnull(skuspec,""))'+chr(13)+chr(10)
                             +'  from  #lskformatin           '+chr(13)+chr(10)
                             +' where not exists(select 1 from sku(nolock)                             '+chr(13)+chr(10)
                             +'                   where isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                             +'                     and isnull(sku.color,"")=isnull(#lskformatin.color,"") '+chr(13)+chr(10)
                             //+'                     and isnull(sku.skucards,"")=isnull(#lskformatin.skucards,"") '+chr(13)+chr(10)
                             +'                     and isnull(sku.customerno,"")=isnull(#lskformatin.customerno,"") '+chr(13)+chr(10)
                             +'                     and isnull(isdetail,"F")="T" )                              '+chr(13)+chr(10)
                 );
      strskuname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strskuname:=strskuname+'/'+dataTmp.qryTmp2.fieldbyname('skucards').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strskuname<>'' then
      begin
         Kmessagedlg('"'+strskuname+'"在商品资料不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
      //工厂
      OpenSql(dataTmp.qryTmp2,'select #lskformatin.shipcusname  '+chr(13)+chr(10)
                             +'  from #lskformatin           '+chr(13)+chr(10)
                             +' where not exists(select 1 from customer(nolock)                             '+chr(13)+chr(10)
                             +'                   where isnull(customer.cushelpno,"")=isnull(#lskformatin.shipcusname,"") '+chr(13)+chr(10)
                             +'                      )                              '+chr(13)+chr(10)
                 );
      strshipcusname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strshipcusname:=strshipcusname+'/'+dataTmp.qryTmp2.fieldbyname('shipcusname').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strshipcusname<>'' then
      begin
         Kmessagedlg('"'+strshipcusname+'"在工厂资料中不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
      //箱号
      OpenSql(dataTmp.qryTmp2,'select #lskformatin.lotcode  '+chr(13)+chr(10)
                             +'  from #lskformatin           '+chr(13)+chr(10)
                             +' where exists(select 1 from wareordersku(nolock)                             '+chr(13)+chr(10)
                             +'               where isnull(wareordersku.lotcode,"")=isnull(#lskformatin.lotcode,"") '+chr(13)+chr(10)
                             +'                      )                              '+chr(13)+chr(10)
                 );
      strlotcode:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strlotcode:=strlotcode+'/'+dataTmp.qryTmp2.fieldbyname('lotcode').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strlotcode<>'' then
      begin
         Kmessagedlg('"'+strlotcode+'"在入库清单已存在该箱号,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;
      //客户
      OpenSql(dataTmp.qryTmp2,'select #lskformatin.costcusname  '+chr(13)+chr(10)
                             +'  from  #lskformatin           '+chr(13)+chr(10)
                             +' where not exists(select 1 from customer(nolock)                             '+chr(13)+chr(10)
                             +'                   where isnull(customer.cusname,"")=isnull(#lskformatin.costcusname,"") '+chr(13)+chr(10)
                             +'                      )                              '+chr(13)+chr(10)
                 );
      strcusname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strcusname:=strcusname+'/'+dataTmp.qryTmp2.fieldbyname('costcusname').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strcusname<>'' then
      begin
         Kmessagedlg('"'+strcusname+'"在客户资料中不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;

      OpenSql(qryTmp2,'select costcusid=customer.cusid,costcusname=#lskformatin.costcusname,'+chr(13)+chr(10)
               +'       shipcusid=gc.cusid,shipcusname=#lskformatin.shipcusname,*'+chr(13)+chr(10)
               +'  from #lskformatin (nolock)'+chr(13)+chr(10)
               +'       left join customer gc                  '+chr(13)+chr(10)
               +'              on gc.cushelpno=#lskformatin.shipcusname '+chr(13)+chr(10)
               +'       left join customer                   '+chr(13)+chr(10)
               +'              on customer.cusname=#lskformatin.costcusname '+chr(13)+chr(10)
                );
      //取JOBNO
      opensql(dataTmp.qryTmp3,'select distinct cusbillno from #lskformatin'
             );
      dataTmp.qryTmp3.First;
      while not datatmp.qryTmp3.Eof do
      begin
         execsql(qryTmp,'insert #wareorderinput  '+chr(13)+chr(10)
                 +'select sno=0,'+chr(13)+chr(10)
                 +'       jobno="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'",  '+chr(13)+chr(10)
                 +'       outzoneno=#lskformatin.outzoneno ,'+chr(13)+chr(10)
                 +'       userid="'+_userid+'",'+chr(13)+chr(10)
                 +'       username="'+_username+'",   '+chr(13)+chr(10)
                 +'       iuserid="'+_userid+'",   '+chr(13)+chr(10)
                 +'       iusername="'+_username+'",   '+chr(13)+chr(10)
                 +'       sku.weightuom,sku.quantityuom,orderid="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'",  '+chr(13)+chr(10)
                 +'       #lskformatin.grossweight,   '+chr(13)+chr(10)
                 +'       #lskformatin.netweight,#lskformatin.quantity,    '+chr(13)+chr(10)
                 +'       skuid=sku.skuid,sku.skuname,qualityname="正品",'+chr(13)+chr(10)
                 +'       shipcusid="'+qryTmp2.fieldbyname('shipcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       shipcusname="'+qryTmp2.fieldbyname('shipcusname').AsString+'",       '+chr(13)+chr(10)
                 +'       shippercusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       shippercusname="'+qryTmp2.fieldbyname('costcusname').AsString+'",       '+chr(13)+chr(10)
                 +'       mainorder="",        '+chr(13)+chr(10)
                 +'       customsno="'+qryTmp2.fieldbyname('customsno').AsString+'",        '+chr(13)+chr(10)
                 +'       cusbillno="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'",       '+chr(13)+chr(10)
                 +'       cusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       cusname="'+qryTmp2.fieldbyname('costcusname').AsString+'",       '+chr(13)+chr(10)
                 +'       costcusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       costcusname="'+qryTmp2.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                 +'       remark="",price=0,skucost=0,               '+chr(13)+chr(10)
                 +'       #lskformatin.lotcode,#lskformatin.color,sku.skucards,#lskformatin.skuspec,#lskformatin.customerno '+chr(13)+chr(10)
                 +' from  #lskformatin    (nolock)                                       '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                            '+chr(13)+chr(10)
                 +'              on isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                 +'             and isnull(sku.color,"")=isnull(#lskformatin.color,"") '+chr(13)+chr(10)
                 //+'             and isnull(sku.skucards,"")=isnull(#lskformatin.skucards,"") '+chr(13)+chr(10)
                 +'             and isnull(sku.customerno,"")=isnull(#lskformatin.customerno,"") '+chr(13)+chr(10)
                 +'             and isnull(isdetail,"F")="T"    '+chr(13)+chr(10)

                 +' where 1=1                                               '+chr(13)+chr(10)
                 +'   and cusbillno="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'"  '+chr(13)+chr(10)
                 +'declare @i smallint                                      '+chr(13)+chr(10)
                 +' select @i=0                                             '+chr(13)+chr(10)
                 +' update #wareorderinput                                    '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 +'  where cusbillno="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'"  '+chr(13)+chr(10)
                 );
         datatmp.qryTmp3.Next;
      end;

      OpenSql(qryTmp,'select * from #wareorderinput');
   end;

   qrySku.Close;
   qrySku.Open;
   btnInPutOrder.Enabled:=FALSE;
   btnOK.Enabled:=True;
end;

procedure Tfrmwareorderinput.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno:string;
begin
  //赋业务联系单号
   opensql(dataTmp.qryTmp,'select datenow=getDate() ');
   strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
   if (Kmessagedlg('是否确定导入入库装箱清单？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try
     //取JOBNO
      opensql(dataTmp.qryTmp3,'select distinct cusbillno from #wareorderinput '
             );
      dataTmp.qryTmp3.First;
      while not datatmp.qryTmp3.Eof do
      begin
         opensql(dataTmp.qryTmp,'select datenow=getDate() ');
         strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
         opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                               +'  from genjobno where substring(Jobno,5,2)="WO"' );
         strorderid:='OJ'+strDate+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);
         strlocoutjobno:=genJobno('WO',strorderid);

         execsql(qryTmp,'update #wareorderinput  '+chr(13)+chr(10)
                       +'   set jobno="'+strlocoutjobno+'",'+chr(13)+chr(10)
                       +'       orderid="'+strorderid+'"   '+chr(13)+chr(10)
                       +' where cusbillno="'+dataTmp.qryTmp3.fieldbyname('cusbillno').AsString+'"  '+chr(13)+chr(10)
                 );
         datatmp.qryTmp3.Next;
      end;

      ExecSql(qryOrder,' insert into wareorder                                          '+chr(13)+chr(10)
                      +'       (jobno,operationtype,orderid,dictatetype,userid,username,iuserid,iusername,mainorder,'+chr(13)+chr(10)
                      +'        orderdate,warerentcounttype,costcusid,costcusname,isbond,cusbillno,'+chr(13)+chr(10)
                      +'        shipcusname,shipcusid,skucostclasscd,quantity)                                      '+chr(13)+chr(10)
                      +' select distinct #wareorderinput.jobno,1,orderid,"进仓指令",'+chr(13)+chr(10)
                      +'        userid,username,iuserid,iusername,mainorder,convert(char(10),getdate(),102),'+chr(13)+chr(10)
                      +'        "IR",costcusid,costcusname,'+chr(13)+chr(10)
                      +'        "F",cusbillno,costcusname,costcusid,skucostclasscd="COMMON",'+FloatToStr(quantity.SummaryFooterValue)+'  '+chr(13)+chr(10)
                      +'  from  #wareorderinput                        '+chr(13)+chr(10)
                      +' insert into wareordersku                                          '+chr(13)+chr(10)
                      +'       (jobno,sno,warerentcounttype,jobnoinf,snoinf,ldsnoinf,'+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype,userid,username,           '+chr(13)+chr(10)
                      +'        weightuom,quantityuom,grossweight,shipcusid,shipcusname,             '+chr(13)+chr(10)
                      +'        netweight,quantity,skuid,skuname,outzoneno,customsno,                '+chr(13)+chr(10)
                      +'        qualityname,shippercusid,shippercusname,              '+chr(13)+chr(10)
                      +'        cusid,cusname,costcusid,costcusname,skucost,price,lotcode  )  '+chr(13)+chr(10)
                      +' select jobno=#wareorderinput.jobno,sno=#wareorderinput.sno,'+chr(13)+chr(10)
                      +'        "IR",#wareorderinput.jobno,#wareorderinput.sno, -1,'+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype=1,              '+chr(13)+chr(10)
                      +'        userid,username,weightuom,quantityuom,grossweight, shipcusid,shipcusname,  '+chr(13)+chr(10)
                      +'        netweight,quantity,skuid,skuname,outzoneno,customsno,                '+chr(13)+chr(10)
                      +'        "正品",shippercusid, shippercusname, cusid,cusname,     '+chr(13)+chr(10)
                      +'        costcusid,costcusname, skucost,price,lotcode '+chr(13)+chr(10)
                      +'  from  #wareorderinput                        '+chr(13)+chr(10)
                      +'  where isnull(skuid,"")<>""'
                      );
      KMessageDlg('导入任务商品资料完成!',mtInformation,[mbOK],0);
      droplsk('#wareorderinput');
      droplsk('#lskformatin');

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   frmwareorderinput.Close;
   qrysku.Close;
end;

procedure Tfrmwareorderinput.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure Tfrmwareorderinput.mitDelOrderClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('你确定删除该数据?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
   for i:=grdsku.SelectedCount-1 Downto 0 do
   begin
      _ADOConnection .Starttransaction;
      try
        ExecSql(qryTmp,'delete from #wareorderinput '
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

