unit locoutitemsku;

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
  Tfrmlocoutitemsku = class(TForm)
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
    shippercusname: TdxDBGridButtonColumn;
    skuname: TdxDBGridButtonColumn;
    lotcode: TdxDBGridButtonColumn;
    quantity: TdxDBGridCurrencyColumn;
    quantityuom: TdxDBGridPickColumn;
    piece: TdxDBGridCurrencyColumn;
    pieceuom: TdxDBGridPickColumn;
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
    cusname: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    skumodel: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    qryTmp2: TKADOQuery;
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

procedure worklocoutitemsku(pstrjobno:string);
var
   frmlocoutitemsku: Tfrmlocoutitemsku;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp;
var
   AverageSpeed: Double = 0;

procedure worklocoutitemsku(pstrjobno:string);
begin
   if (frmlocoutitemsku <> nil) and frmlocoutitemsku.HandleAllocated then
   with frmlocoutitemsku do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrmlocoutitemsku, frmlocoutitemsku);
   with frmlocoutitemsku do
   begin
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
   frmlocoutitemsku.Show;
end;

procedure Tfrmlocoutitemsku.btnCloseClick(Sender: TObject);
begin
   frmlocoutitemsku.close;
end;

procedure Tfrmlocoutitemsku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrmlocoutitemsku.FormCreate(Sender: TObject);
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

procedure Tfrmlocoutitemsku.FormDestroy(Sender: TObject);
begin
   frmlocoutitemsku:=nil;
end;

procedure Tfrmlocoutitemsku.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure Tfrmlocoutitemsku.btnInPutOrderClick(Sender: TObject);
var
   lstcubage:TStringList;
   strsql,strZsql,strskuname,strskunameitem,strshippercusname,strcusname:string;
begin
   ExecSql(qryTmp2,  '    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                    +' where id=object_id("tempdb..#outskuitem") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                    +'  drop table #outskuitem                                         '+chr(13)+chr(10)
            );
   ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                 +' where id=object_id("tempdb..#locoutitemSku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                 +'  drop table #locoutitemSku                                         '+chr(13)+chr(10)
                 +'select sno,jobno,userid,username,iuserid,iusername,   '+chr(13)+chr(10)
                 +'       pieceuom,weightuom,volumeuom,areauom,quantityuom, '+chr(13)+chr(10)
                 +'       piece,grossweight,netweight,volume,area,quantity, '+chr(13)+chr(10)
                 +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                 +'       cusbillno,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                 +'       price,skucost,lotcode,skumodel,skuspec,customerno    '+chr(13)+chr(10)
                 +'  into #locoutitemSku '+chr(13)+chr(10)
                 +'  from locationoutitem (nolock)'+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );
   ExecSql(qryTmp,'select sno,jobno,jobnoin,snoin,ldsnoinf,userid,username,iuserid,iusername,   '+chr(13)+chr(10)
                 +'       pieceuom,weightuom,volumeuom,areauom,quantityuom, '+chr(13)+chr(10)
                 +'       piece,grossweight,netweight,volume,area,quantity, '+chr(13)+chr(10)
                 +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                 +'       cusbillno,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                 +'       price,skucost,lotcode,skumodel,skuspec,customerno    '+chr(13)+chr(10)
                 +'  into #outskuitem '+chr(13)+chr(10)
                 +'  from locationoutitem (nolock)'+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );
   opensql(qrysku,'select *  from #outskuitem ');
   {strSql:='select sno,jobno,userid, '+chr(13)+chr(10)
          +'       username,iuserid,iusername,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
          +'       quantityuom,piece,grossweight,netweight,volume,area,quantity,    '+chr(13)+chr(10)
          +'       skuid,skuname,qualityname,shippercusid,shippercusname,mainorder, '+chr(13)+chr(10)
          +'       cusbillno,cusid,cusname,costcusid,costcusname,remark,            '+chr(13)+chr(10)
          +'       price,skucost,lotcode,skumodel,skuspec                           '+chr(13)+chr(10)
          +'  from #locoutitemSku   (nolock)                                        '+chr(13)+chr(10)
          +' where 1=1                                                              '+chr(13)+chr(10)
          ;
   qrySku.close;
   qrySku.SQL.Clear;
   qrySku.SQL.Add(strSql);
   qrySku.Open; }
   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;
   //清除旧数据
   ExecSql(qryTmp,'delete from #locoutitemSku ');
   ExecSql(qryTmp,'delete from #outskuitem ');
   try
     FileTOGrid(qrySku,grdSku,edtPath.Text,cmbTemple.TextField);
   except
      exit;
   end;

   OpenSql(qryTmp2,'select costcusid=locationout.costcusid,costcusname=locationout.costcusname,'+chr(13)+chr(10)
                  +'       shippercusname=locationout.costcusname,  '+chr(13)+chr(10)
                  +'       cusid=locationout.costcusid,cusname=locationout.costcusname,'+chr(13)+chr(10)
                  +'       cusbillno=locationout.cusbillno,mainorder=locationout.mainorder,  '+chr(13)+chr(10)
                  +'       iuserid=locationout.iuserid, iusername=locationout.iusername,userid,username '+chr(13)+chr(10)
                  +'  from locationout (nolock)'+chr(13)+chr(10)
                  +' where locationout.jobno="'+strlocoutjobno+'"  '+chr(13)+chr(10)
                   );

   if _StrSysCus='DHA' then
   begin
      //lzw20100919
      OpenSql(dataTmp.qryTmp2,'select skuname,skuspec,skumodel from  #lskformatin                              '+chr(13)+chr(10)
                             +' where not exists(select 1 from sku(nolock)                                     '+chr(13)+chr(10)
                             +'                   where sku.skuname=#lskformatin.skuname                       '+chr(13)+chr(10)
                             +'                     and isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                             +'                     and isnull(sku.skumodel,"")=isnull(#lskformatin.skumodel,"") '+chr(13)+chr(10)
                             +'                     and isnull(isdetail,"F")="T" )                              '+chr(13)+chr(10)
                 );
      strskuname:='';
      datatmp.qryTmp2.First;
      while not datatmp.qryTmp2.Eof do
      begin
         strskuname:=strskuname+'/'+dataTmp.qryTmp2.fieldbyname('skuname').AsString+' '+dataTmp.qryTmp2.fieldbyname('skuspec').AsString+' '+dataTmp.qryTmp2.fieldbyname('skumodel').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strskuname<>'' then
      begin
         Kmessagedlg('"'+strskuname+'"不存在,不允许导入！', mtInformation,[mbOk],0);
         Exit;
      end;

      OpenSql(dataTmp.qryTmp1,'    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#sumitemsku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #sumitemsku                                         '+chr(13)+chr(10)
                             +'select skuid,skuname,skumodel,skuspec,                           '+chr(13)+chr(10)
                             +'       syquantity=sum(isnull(item.quantity,0)-isnull(item.quantitydo,0))'+chr(13)+chr(10)
                             +'  into #sumitemsku                                               '+chr(13)+chr(10)
                             +'  from locationinitem item(nolock)                               '+chr(13)+chr(10)
                             +' group by skuid,skuname,skumodel,skuspec                         '+chr(13)+chr(10)
                             +'select skuname,skuspec,skumodel from  #lskformatin               '+chr(13)+chr(10)
                             +' where not exists(select 1 from #sumitemsku(nolock)              '+chr(13)+chr(10)
                             +'                   where #lskformatin.skuname=#sumitemsku.skuname       '+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.skuspec,"")=isnull(#sumitemsku.skuspec,"")  '+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.skumodel,"")=isnull(#sumitemsku.skumodel,"")'+chr(13)+chr(10)
                             +'                     and isnull(#sumitemsku.syquantity,0))>=#lskformatin.quantity )      '+chr(13)+chr(10)
                 );
      strskunameitem:='';
      datatmp.qryTmp1.First;
      while not datatmp.qryTmp1.Eof do
      begin
         strskunameitem:=strskunameitem+'/'+dataTmp.qryTmp1.fieldbyname('skuname').AsString+' '+dataTmp.qryTmp1.fieldbyname('skuspec').AsString+' '+dataTmp.qryTmp1.fieldbyname('skumodel').AsString;
         datatmp.qryTmp1.Next;
      end;
      if strskunameitem<>'' then
      begin
         Kmessagedlg('"'+strskunameitem+'"库存不足,不允许导入！', mtInformation,[mbOk],0);
         exit;
      end;
      execsql(qryTmp,'insert #locoutitemSku  '+chr(13)+chr(10)
                 +'select sno=0,'
                 +'       jobno="'+strlocoutjobno+'",'
                 +'       userid="'+qryTmp2.fieldbyname('userid').AsString+'",'+chr(13)+chr(10)
                 +'       username="'+qryTmp2.fieldbyname('username').AsString+'",   '+chr(13)+chr(10)
                 +'       iuserid="'+qryTmp2.fieldbyname('iuserid').AsString+'",   '+chr(13)+chr(10)
                 +'       iusername="'+qryTmp2.fieldbyname('iusername').AsString+'",   '+chr(13)+chr(10)
                 +'       pieceuom=isnull(sku.pieceuom,""),weightuom="",volumeuom="",areauom="",'+chr(13)+chr(10)
                 +'       sku.quantityuom,#lskformatin.piece,grossweight=0,                '+chr(13)+chr(10)
                 +'       netweight=0,volume=0,area=0,#lskformatin.quantity,               '+chr(13)+chr(10)
                 +'       skuid=sku.skuid,classid=sku.classid,#lskformatin.skuname,qualityname="正品",'+chr(13)+chr(10)
                 +'       shippercusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",    '+chr(13)+chr(10)
                 +'       shippercusname="'+qryTmp2.fieldbyname('costcusname').AsString+'",'+chr(13)+chr(10)
                 +'       mainorder="'+qryTmp2.fieldbyname('mainorder').AsString+'",       '+chr(13)+chr(10)
                 +'       cusbillno="'+qryTmp2.fieldbyname('cusbillno').AsString+'",       '+chr(13)+chr(10)
                 +'       cusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",           '+chr(13)+chr(10)
                 +'       cusname="'+qryTmp2.fieldbyname('costcusname').AsString+'",       '+chr(13)+chr(10)
                 +'       costcusid="'+qryTmp2.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                 +'       costcusname="'+qryTmp2.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                 +'       remark="",#lskformatin.price,#lskformatin.skucost,               '+chr(13)+chr(10)
                 +'       lotcode="" ,#lskformatin.skumodel,#lskformatin.skuspec,customerno="" '+chr(13)+chr(10)
                 +' from  #lskformatin    (nolock)                                       '+chr(13)+chr(10)
                 +'       left join sku(nolock)                                            '+chr(13)+chr(10)
                 +'              on sku.skuname=#lskformatin.skuname                       '+chr(13)+chr(10)
                 +'             and isnull(sku.skuspec,"")=isnull(#lskformatin.skuspec,"") '+chr(13)+chr(10)
                 +'             and isnull(sku.skumodel,"")=isnull(#lskformatin.skumodel,"") '+chr(13)+chr(10)
                 +' where 1=1                                               '+chr(13)+chr(10)
                 +'declare @i smallint                                      '+chr(13)+chr(10)
                 +' if exists(select 1 from locationoutitem(nolock) where jobno="'+strlocoutjobno+'")'+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +'    select @i=max(isnull(sno,0))+1 from locationoutitem(nolock) where jobno="'+strlocoutjobno+'"'+chr(13)+chr(10)
                 +' end else                                                '+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +' select @i=1                                             '+chr(13)+chr(10)
                 +' end                                                     '+chr(13)+chr(10)
                 +' update #locoutitemSku                                    '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 );

      OpenSql(qryTmp,'select * from #locoutitemSku');

      qryTmp.First;
      while not qryTmp.Eof do
      begin
         strZsql:=' ksp_fifoitem "'+'item.operationdate asc,item.quantity asc'+'",   '
                 +'              "'+qryTmp.fieldbyname('classid').AsString+'",         ' //商品名称
                 +'              '+qryTmp.fieldbyname('quantity').AsString+', '//数量
                 +'              "" '                    //数量
                 ;
         qryTmp1.SQL.Clear;
         qryTmp1.SQL.Add(strZsql);
         qryTmp1.Open;

         qryTmp1.First;
         while not qryTmp1.Eof do
         begin
            execsql(qrytmp2,'insert #outskuitem  '+chr(13)+chr(10)
                           +'select sno=0,                                          '+chr(13)+chr(10)
                           +'       jobno="'+strlocoutjobno+'",                     '+chr(13)+chr(10)
                           +'       jobnoin="'+qryTmp1.fieldbyname('jobno').AsString+'",           '+chr(13)+chr(10)
                           +'       snoin="'+qryTmp1.fieldbyname('sno').AsString+'",                '+chr(13)+chr(10)
                           +'       ldsnoinf=0,                                                        '+chr(13)+chr(10)
                           +'       userid="'+qryTmp.fieldbyname('userid').AsString+'",              '+chr(13)+chr(10)
                           +'       username="'+qryTmp.fieldbyname('username').AsString+'",          '+chr(13)+chr(10)
                           +'       iuserid="'+qryTmp.fieldbyname('iuserid').AsString+'",            '+chr(13)+chr(10)
                           +'       iusername="'+qryTmp.fieldbyname('iusername').AsString+'",        '+chr(13)+chr(10)
                           +'       pieceuom="'+qryTmp.fieldbyname('pieceuom').AsString+'",          '+chr(13)+chr(10)
                           +'       weightuom="",volumeuom="",areauom="",                            '+chr(13)+chr(10)
                           +'       quantityuom="'+qryTmp.fieldbyname('quantityuom').AsString+'",    '+chr(13)+chr(10)
                           +'       piece="'+qryTmp1.fieldbyname('sypiece').AsString+'",            '+chr(13)+chr(10)
                           +'       grossweight=0,                                                   '+chr(13)+chr(10)
                           +'       netweight=0,volume=0,area=0,                                     '+chr(13)+chr(10)
                           +'       quantity="'+qryTmp1.fieldbyname('syquantity').AsString+'",      '+chr(13)+chr(10)
                           +'       skuid="'+qryTmp.fieldbyname('skuid').AsString+'",                '+chr(13)+chr(10)
                           +'       classid="'+qryTmp.fieldbyname('classid').AsString+'",                '+chr(13)+chr(10)
                           +'       skuname="'+qryTmp.fieldbyname('skuname').AsString+'",            '+chr(13)+chr(10)
                           +'       qualityname="正品",                                              '+chr(13)+chr(10)
                           +'       shippercusid="'+qryTmp.fieldbyname('costcusid').AsString+'",    '+chr(13)+chr(10)
                           +'       shippercusname="'+qryTmp.fieldbyname('costcusname').AsString+'",'+chr(13)+chr(10)
                           +'       mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'",       '+chr(13)+chr(10)
                           +'       cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'",       '+chr(13)+chr(10)
                           +'       cusid="'+qryTmp.fieldbyname('costcusid').AsString+'",           '+chr(13)+chr(10)
                           +'       cusname="'+qryTmp.fieldbyname('costcusname').AsString+'",       '+chr(13)+chr(10)
                           +'       costcusid="'+qryTmp.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                           +'       costcusname="'+qryTmp.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                           +'       remark="",                                                      '+chr(13)+chr(10)
                           +'       price="'+qryTmp.fieldbyname('price').AsString+'",               '+chr(13)+chr(10)
                           +'       skucost="'+qryTmp.fieldbyname('skucost').AsString+'",           '+chr(13)+chr(10)
                           +'       lotcode="" ,                                                    '+chr(13)+chr(10)
                           +'       skumodel="'+qryTmp.fieldbyname('skumodel').AsString+'",         '+chr(13)+chr(10)
                           +'       skuspec="'+qryTmp.fieldbyname('skuspec').AsString+'",customerno=""   '+chr(13)+chr(10)
                  );
             qryTmp1.Next;

         end;
         qryTmp1.SQL.Clear;
         qryTmp1.Close;
         qryTmp.Next;
      end;
   end;
   //lzw20111101
   if _StrSysCus='JG' then
   begin

      OpenSql(dataTmp.qryTmp2,'select skuname,skuspec,skumodel,customerno from  #lskformatin           '+chr(13)+chr(10)
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
         strskuname:=strskuname+'/'+dataTmp.qryTmp2.fieldbyname('skuname').AsString+' '+dataTmp.qryTmp2.fieldbyname('skuspec').AsString+' '+dataTmp.qryTmp2.fieldbyname('skumodel').AsString;
         datatmp.qryTmp2.Next;
      end;
      if strskuname<>'' then
      begin
         Kmessagedlg('"'+strskuname+'"不存在,不允许导入！', mtInformation,[mbOk],0);
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
      OpenSql(dataTmp.qryTmp2,'select cusname from  #lskformatin                              '+chr(13)+chr(10)
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

      OpenSql(dataTmp.qryTmp1,'    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#sumitemsku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #sumitemsku                                         '+chr(13)+chr(10)
                             +'select item.skuid,item.skuname,item.skumodel,item.skuspec,item.lotcode,item.customerno, '+chr(13)+chr(10)
                             +'       item.shippercusname,item.cusname,  '+chr(13)+chr(10)
                             +'       syquantity=sum(isnull(item.quantity,0)-isnull(item.quantitydo,0))'+chr(13)+chr(10)
                             +'  into #sumitemsku                                               '+chr(13)+chr(10)
                             +'  from locationinitem item(nolock),#lskformatin                  '+chr(13)+chr(10)
                             +' where #lskformatin.skuname=item.skuname       '+chr(13)+chr(10)
                             +'   and isnull(#lskformatin.skuspec,"")=isnull(item.skuspec,"")  '+chr(13)+chr(10)
                             +'   and isnull(#lskformatin.skumodel,"")=isnull(item.skumodel,"")'+chr(13)+chr(10)
                             +'   and isnull(#lskformatin.customerno,"")=isnull(item.customerno,"")'+chr(13)+chr(10)
                             //+'   and isnull(#lskformatin.lotcode,"")=isnull(item.lotcode,"")'+chr(13)+chr(10)
                             +'   and isnull(#lskformatin.shippercusname,"")=isnull(item.shippercusname,"")'+chr(13)+chr(10)
                             +'   and isnull(#lskformatin.cusname,"")=isnull(item.cusname,"")'+chr(13)+chr(10)

                             +'   and isnull(item.quantity,0)-isnull(quantitydo,0)>0          '+chr(13)+chr(10)
                             +' group by item.skuid,item.skuname,item.skumodel,item.skuspec,item.lotcode,  '+chr(13)+chr(10)
                             +'       item.shippercusname,item.cusname, item.customerno  '+chr(13)+chr(10)

                             +'select skuname,skuspec,skumodel from  #lskformatin               '+chr(13)+chr(10)
                             +' where not exists(select 1 from #sumitemsku(nolock)              '+chr(13)+chr(10)
                             +'                   where #lskformatin.skuname=#sumitemsku.skuname       '+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.skuspec,"")=isnull(#sumitemsku.skuspec,"")  '+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.skumodel,"")=isnull(#sumitemsku.skumodel,"")'+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.customerno,"")=isnull(#sumitemsku.customerno,"")'+chr(13)+chr(10)
                             //+'                     and isnull(#lskformatin.lotcode,"")=isnull(#sumitemsku.lotcode,"")'+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.shippercusname,"")=isnull(#sumitemsku.shippercusname,"")'+chr(13)+chr(10)
                             +'                     and isnull(#lskformatin.cusname,"")=isnull(#sumitemsku.cusname,"")'+chr(13)+chr(10)
                             +'                     and isnull(#sumitemsku.syquantity,0)>=#lskformatin.quantity )      '+chr(13)+chr(10)
                 );
      strskunameitem:='';
      datatmp.qryTmp1.First;
      while not datatmp.qryTmp1.Eof do
      begin
         strskunameitem:=strskunameitem+'/'+dataTmp.qryTmp1.fieldbyname('skuname').AsString+' '+dataTmp.qryTmp1.fieldbyname('skuspec').AsString+' '+dataTmp.qryTmp1.fieldbyname('skumodel').AsString;
         datatmp.qryTmp1.Next;
      end;
      if strskunameitem<>'' then
      begin
         Kmessagedlg('"'+strskunameitem+'"库存不足,不允许导入！', mtInformation,[mbOk],0);
         exit;
      end;
      execsql(qryTmp,'insert #locoutitemSku  '+chr(13)+chr(10)
                 +'select sno=0,'
                 +'       jobno="'+strlocoutjobno+'",'
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
                 +'       cusid=cus.cusid,           '+chr(13)+chr(10)
                 +'       cusname=#lskformatin.cusname,       '+chr(13)+chr(10)
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
                 +' if exists(select 1 from locationoutitem(nolock) where jobno="'+strlocoutjobno+'")'+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +'    select @i=max(isnull(sno,0))+1 from locationoutitem(nolock) where jobno="'+strlocoutjobno+'"'+chr(13)+chr(10)
                 +' end else                                                '+chr(13)+chr(10)
                 +' begin                                                   '+chr(13)+chr(10)
                 +' select @i=1                                             '+chr(13)+chr(10)
                 +' end                                                     '+chr(13)+chr(10)
                 +' update #locoutitemSku                                    '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 );

      OpenSql(qryTmp,'select * from #locoutitemSku');

      qryTmp.First;
      while not qryTmp.Eof do
      begin
         strZsql:=' ksp_fifoitem "'+'item.operationdate asc,item.quantity asc'+'",   ' //排序
                 +'              "'+qryTmp.fieldbyname('classid').AsString+'",         ' //商品名称
                 +'              '+qryTmp.fieldbyname('quantity').AsString+', '//数量
                 +'              "and item.shippercusid='+qryTmp.fieldbyname('shippercusid').AsString+' '
                 +'               and item.cusid='+qryTmp.fieldbyname('cusid').AsString+' " '//批次等过滤条件
                 ;
         qryTmp1.SQL.Clear;
         qryTmp1.SQL.Add(strZsql);
         qryTmp1.Open;

         qryTmp1.First;
         while not qryTmp1.Eof do
         begin
            execsql(qrytmp2,'insert #outskuitem  '+chr(13)+chr(10)
                           +'select sno=0,                                          '+chr(13)+chr(10)
                           +'       jobno="'+strlocoutjobno+'",                     '+chr(13)+chr(10)
                           +'       jobnoin="'+qryTmp1.fieldbyname('jobno').AsString+'",           '+chr(13)+chr(10)
                           +'       snoin="'+qryTmp1.fieldbyname('sno').AsString+'",                '+chr(13)+chr(10)
                           +'       ldsnoinf=0,                                                        '+chr(13)+chr(10)
                           +'       userid="'+qryTmp.fieldbyname('userid').AsString+'",              '+chr(13)+chr(10)
                           +'       username="'+qryTmp.fieldbyname('username').AsString+'",          '+chr(13)+chr(10)
                           +'       iuserid="'+qryTmp.fieldbyname('iuserid').AsString+'",            '+chr(13)+chr(10)
                           +'       iusername="'+qryTmp.fieldbyname('iusername').AsString+'",        '+chr(13)+chr(10)
                           +'       pieceuom="'+qryTmp.fieldbyname('pieceuom').AsString+'",          '+chr(13)+chr(10)
                           +'       weightuom="'+qryTmp.fieldbyname('weightuom').AsString+'",volumeuom="",areauom="", '+chr(13)+chr(10)
                           +'       quantityuom="'+qryTmp.fieldbyname('quantityuom').AsString+'",    '+chr(13)+chr(10)
                           +'       piece="'+qryTmp1.fieldbyname('sypiece').AsString+'",            '+chr(13)+chr(10)
                           +'       grossweight="'+qryTmp1.fieldbyname('sygrossweight').AsString+'",    '+chr(13)+chr(10)
                           +'       netweight="'+qryTmp1.fieldbyname('synetweight').AsString+'",volume=0,area=0, '+chr(13)+chr(10)
                           +'       quantity="'+qryTmp1.fieldbyname('syquantity').AsString+'",      '+chr(13)+chr(10)
                           +'       skuid="'+qryTmp.fieldbyname('skuid').AsString+'",                '+chr(13)+chr(10)
                           +'       classid="'+qryTmp.fieldbyname('classid').AsString+'",                '+chr(13)+chr(10)
                           +'       skuname="'+qryTmp.fieldbyname('skuname').AsString+'",            '+chr(13)+chr(10)
                           +'       qualityname="正品",                                              '+chr(13)+chr(10)
                           +'       shippercusid="'+qryTmp.fieldbyname('shippercusid').AsString+'",    '+chr(13)+chr(10)
                           +'       shippercusname="'+qryTmp.fieldbyname('shippercusname').AsString+'",'+chr(13)+chr(10)
                           +'       mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'",       '+chr(13)+chr(10)
                           +'       cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'",       '+chr(13)+chr(10)
                           +'       cusid="'+qryTmp.fieldbyname('cusid').AsString+'",           '+chr(13)+chr(10)
                           +'       cusname="'+qryTmp.fieldbyname('cusname').AsString+'",       '+chr(13)+chr(10)
                           +'       costcusid="'+qryTmp.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                           +'       costcusname="'+qryTmp.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                           +'       remark="",                                                      '+chr(13)+chr(10)
                           +'       price="'+qryTmp.fieldbyname('price').AsString+'",               '+chr(13)+chr(10)
                           +'       skucost="'+qryTmp.fieldbyname('skucost').AsString+'",           '+chr(13)+chr(10)
                           +'       lotcode="'+qryTmp.fieldbyname('lotcode').AsString+'" ,          '+chr(13)+chr(10)
                           +'       skumodel="'+qryTmp.fieldbyname('skumodel').AsString+'",         '+chr(13)+chr(10)
                           +'       skuspec="'+qryTmp.fieldbyname('skuspec').AsString+'" ,           '+chr(13)+chr(10)
                           +'       customerno="'+qryTmp.fieldbyname('customerno').AsString+'"            '+chr(13)+chr(10)

                  );
             qryTmp1.Next;

         end;
         qryTmp1.SQL.Clear;
         qryTmp1.Close;
         qryTmp.Next;
      end;
   end;

   opensql(qrysku,'declare @i smallint                                      '+chr(13)+chr(10)
                 +' select @i=0                                             '+chr(13)+chr(10)
                 +' update #outskuitem                                      '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 +'  select *  from #outskuitem ');
   qrySku.Close;
   qrySku.Open;
   btnOK.Enabled:=True;
end;

procedure Tfrmlocoutitemsku.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno:string;
begin
  //赋业务联系单号
   opensql(dataTmp.qryTmp,'select datenow=getDate() ');
   strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
   if (Kmessagedlg('是否确定导入出仓商品数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try


      ExecSql(qryOrder,'insert into locationoutitem                                          '+chr(13)+chr(10)
                      +'       (jobno,sno,jobnoin,snoin,jobnoinf,snoinf,ldsnoinf,warerentcounttype,'+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype,userid,username,           '+chr(13)+chr(10)
                      +'        pieceuom,weightuom,                                          '+chr(13)+chr(10)
                      +'        volumeuom,areauom,quantityuom,piecetask,grossweighttask,             '+chr(13)+chr(10)
                      +'        netweighttask,volumetask,areatask,quantitytask,skuid,skuname,                '+chr(13)+chr(10)
                      +'        qualityname,shippercusid,shippercusname,              '+chr(13)+chr(10)
                      +'        cusid,cusname,costcusid,costcusname,skucost,price,                '+chr(13)+chr(10)
                      +'        lotcode,skumodel,skuspec,iuserid,iusername  )  '+chr(13)+chr(10)
                      +' select jobno=#outskuitem.jobno,sno=#outskuitem.sno,'+chr(13)+chr(10)
                      +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,  '+chr(13)+chr(10)
                      +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,-1,"IR", '+chr(13)+chr(10)
                      +'        mainorder,cusbillno,operationtype=-1,              '+chr(13)+chr(10)
                      +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                      +'        volumeuom,areauom,quantityuom,piece,grossweight,             '+chr(13)+chr(10)
                      +'        netweight,volume,area,quantity,skuid,skuname,                '+chr(13)+chr(10)
                      +'        "正品",shippercusid,               '+chr(13)+chr(10)
                      +'        shippercusname,              '+chr(13)+chr(10)
                      +'        cusid,cusname,     '+chr(13)+chr(10)
                      +'        costcusid,costcusname, skucost,price, '+chr(13)+chr(10)
                      +'        lotcode ,skumodel,skuspec,     '+chr(13)+chr(10)
                      +'        iuserid,iusername   '+chr(13)+chr(10)
                      +'  from  #outskuitem                                                          '+chr(13)+chr(10)
                      +'  where isnull(skuid,"")<>""'
                      );
      KMessageDlg('导入任务商品资料完成!',mtInformation,[mbOK],0);
      droplsk('#locinitemSku');
      droplsk('#lskformatin');

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   frmlocoutitemsku.Close;
   qrysku.Close;
end;

procedure Tfrmlocoutitemsku.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure Tfrmlocoutitemsku.mitDelOrderClick(Sender: TObject);
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

