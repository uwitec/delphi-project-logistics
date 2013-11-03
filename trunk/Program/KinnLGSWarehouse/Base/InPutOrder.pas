unit InPutOrder;

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
  TfrmInPutOrder = class(TForm)
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
    qualityname: TdxDBGridButtonColumn;
    quantity: TdxDBGridCurrencyColumn;
    quantityuom: TdxDBGridPickColumn;
    piece: TdxDBGridCurrencyColumn;
    pieceuom: TdxDBGridPickColumn;
    area: TdxDBGridCurrencyColumn;
    areauom: TdxDBGridPickColumn;
    volume: TdxDBGridCurrencyColumn;
    volumeuom: TdxDBGridPickColumn;
    grossweight: TdxDBGridCurrencyColumn;
    netweight: TdxDBGridCurrencyColumn;
    weightuom: TdxDBGridPickColumn;
    qryTmp: TKADOQuery;
    GMSStickyLabel80: TGMSStickyLabel;
    edtIuserId: TdxButtonEdit;
    edtCusname: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    cmbTemple: TKinPickEdit;
    GMSStickyLabel30: TGMSStickyLabel;
    mainorder: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    dtdReceDateT: TdxDateEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    cusname: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
       Shift: TShiftState);
    procedure btnInPutOrderClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtIuserIdButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitDelOrderClick(Sender: TObject);
  Private
    { Private declarations }
    strSql,strInOut: string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
  Public
    { Public declarations }
  end;

procedure workInPutOrder(pstrInOut:string);
var
   frmInPutOrder: TfrmInPutOrder;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp;
var
   AverageSpeed: Double = 0;

procedure workInPutOrder(pstrInOut:string);
begin
   if (frmInPutOrder <> nil) and frmInPutOrder.HandleAllocated then
   with frmInPutOrder do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmInPutOrder, frmInPutOrder);
   with frmInPutOrder do
   begin
      edtIuserId.Text:=_Username;
      edtIuserId.TextField:=_Userid;
      dtdReceDateT.Date:=Date;

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


     if pstrInOut='I' then Caption:='导入进仓指令' else Caption:='导入出仓指令';
      strInOut:=pstrInout;
   end;
   frmInPutOrder.Show;
end;

procedure TfrmInPutOrder.btnCloseClick(Sender: TObject);
begin
   frmInPutOrder.close;
end;

procedure TfrmInPutOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmInPutOrder.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdSku);
   qryTmp.Connection:=_ADOConnection;
   qryOrder.Connection:=_ADOConnection;
   qrySku.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
end;

procedure TfrmInPutOrder.FormDestroy(Sender: TObject);
begin
   frmInPutOrder:=nil;
end;

procedure TfrmInPutOrder.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure TfrmInPutOrder.btnInPutOrderClick(Sender: TObject);
var
   strJobno,strInvoNo,strSku,strQuality,strvolumecost:string;
   strOpType,strCusId,strCusName,strCreateDate,strOrderDate:string;
   strgoalarea:string;
   intQuantity:Integer;
   i,j,sno:Integer;
   lstList,lstInfo:TStringList;
   F:TextFile;
   strzzdm:string;
   strusername: string;
   struserid: string;
   S: string;
   strsql:string;
begin
   ExecSql(qryTmp,'    if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                 +' where id=object_id("tempdb..#Sku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                 +'  drop table #Sku                                         '+chr(13)+chr(10)
                 +'select sno,userid, '+chr(13)+chr(10)
                 +'       username,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
                 +'       quantityuom,piece,grossweight,netweight,volume,area,quantity, '+chr(13)+chr(10)
                 +'       skuid,skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                 +'       cusbillno,cusid,cusname,costcusid,costcusname,remark '+chr(13)+chr(10)
                 +'  into #Sku '+chr(13)+chr(10)
                 +'  from wareorderoriSku '+chr(13)+chr(10)
                 +' where 1=2               '+chr(13)+chr(10)
          );

  strSql:='select sno,userid, '+chr(13)+chr(10)
         +'       username,pieceuom,weightuom,volumeuom,areauom, '+chr(13)+chr(10)
         +'       quantityuom,piece,grossweight,netweight,volume,area,quantity, '+chr(13)+chr(10)
         +'       skuid,skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
         +'       cusbillno,cusid,cusname,costcusid,costcusname,remark  '+chr(13)+chr(10)
         +'  from #Sku   (nolock)                                                '+chr(13)+chr(10)
         +' where 1=1                                                            '+chr(13)+chr(10)
         ;
   qrySku.close;
   qrySku.SQL.Clear;
   qrySku.SQL.Add(strSql);
   qrySku.Open;
   if edtCusname.TextField='' then
   begin
      edtCusname.setFocus;
      Kmessagedlg('请先挑选费用关系人！', mtInformation,[mbOk],0);
      exit;
   end; 
   if edtIuserId.TextField='' then
   begin
      edtIuserId.setFocus;
      Kmessagedlg('请先挑选执行部门！', mtInformation,[mbOk],0);
      exit;
   end; 
   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;
   //清除旧数据
   ExecSql(qryTmp,'delete from #sku ');
   {lstList:=TstringList.Create;
   lstInfo:=TstringList.Create;
   //读文件用的
   AssignFile(F,edtPath.Text);
   Reset(F);
   while not Eof(F) do
   begin
      Readln(F,S);
      if Length(S)>10 then
         lstList.Add(S);
   end;
   CloseFile(F);}
   try
     FileTOGrid(qrySku,grdSku,edtPath.Text,cmbTemple.TextField);
  except
//     qrylocinskudetail.EnableControls;
     exit;
  end;

  OpenSql(qryTmp,'select * from #lskformatin where 1=1');
   execsql(qryTmp,'insert into #sku '
                 +'select sno=0,userid="'+_userid+'",'
                 +'       username="'+_username+'",#lskformatin.pieceuom,#lskformatin.weightuom,                         '+chr(13)+chr(10)
                 +'       #lskformatin.volumeuom,#lskformatin.areauom,#lskformatin.quantityuom,#lskformatin.piece,#lskformatin.grossweight,                     '+chr(13)+chr(10)
                 +'       #lskformatin.netweight,#lskformatin.volume,#lskformatin.area,#lskformatin.quantity,                                      '+chr(13)+chr(10)
                 +'       sku.skuid,sku.skuname,                                                   '+chr(13)+chr(10)
                 +'       #lskformatin.qualityname,shippercusid=shippercustomer.cusid,shippercusname=shippercustomer.cusname,'+chr(13)+chr(10)
                 +'       mainorder,cusbillno,customer.cusid,customer.cusname,             '+chr(13)+chr(10)
                 +'       costcusid="'+edtCusname.textfield+'",                                '+chr(13)+chr(10)
                 +'       costcusname="'+edtCusname.text+'",                                   '+chr(13)+chr(10)
                 +'       remark=case when isnull(sku.skuid,"")="" then "无对应商品资料"       '+chr(13)+chr(10)
                 +'                    when isnull(shippercustomer.cusid,"")="" then "无对应货主资料"  '+chr(13)+chr(10)
                 +'                    when isnull(customer.cusid,"")="" then "无对应寄仓单位资料"  '+chr(13)+chr(10)
                 +'                    else "" end   '+chr(13)+chr(10)
                 +' from  #lskformatin    (nolock)                                             '+chr(13)+chr(10)
                 +'              left join sku(nolock)                                         '+chr(13)+chr(10)
                 +'                     on sku.skuname=#lskformatin.skuname              '+chr(13)+chr(10)
                 +'                    and isnull(IsDetail,"F")="T"'
                 +'              left join customer(nolock)                                    '+chr(13)+chr(10)
                 +'                     on customer.cusname=#lskformatin.cusname               '+chr(13)+chr(10)
                 +'              left join customer shippercustomer(nolock)                    '+chr(13)+chr(10)
                 +'                     on shippercustomer.cusname=#lskformatin.shippercusname '+chr(13)+chr(10)
                 +' where 1=1                                               '+chr(13)+chr(10)
                 +'declare @i smallint                                      '+chr(13)+chr(10)
                 +' select @i=1                                             '+chr(13)+chr(10)
                 +' update #sku                                             '+chr(13)+chr(10)
                 +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                 );

   qrySku.Close;
   qrySku.Open;
   btnOK.Enabled:=True;
end;

procedure TfrmInPutOrder.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno:string;
begin
  //赋业务联系单号
   opensql(dataTmp.qryTmp,'select datenow=getDate() ');
   strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
   if (Kmessagedlg('是否确定导入订单数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try
      OpenSql(qryTmp,' select distinct mainorder,cusbillno from #sku  ');
      qryTmp.First;
      while not qryTmp.Eof do
      begin
         opensql(qryTmp1,'select num=count(*) '
                        +'  from wareorder(nolock) '
                        +' where mainorder="'+qryTmp.fieldbyname('mainorder').AsString +'"'
                        +'   and cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString +'"'
                        +'   and operationtype='+iif(strInOut='I','1','-1')
                        );
          if qryTmp1.FieldByName('num').AsInteger>0 then
          begin
             if (Kmessagedlg('主订单号为'+qryTmp.fieldbyname('mainorder').AsString
                            +'客户单号为'+qryTmp.fieldbyname('cusbillno').AsString +'"'
                            +'的'+iif(strInOut='I','进','出')+'仓指令已存在,是否导入？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
                 break
          end else
          begin
             opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                                   +'  from genjobno where substring(Jobno,5,2)="WO"' );
             strorderid:='OJ'+strDate+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');
             strWOJobno:=genJobno('WO',strorderid);
             ExecSql(qryOrder,'insert into wareorder                                                    '+chr(13)+chr(10)
                             +'         (jobno,orderid,mainorder,cusbillno,OrderDate,DictateType,'+chr(13)+chr(10)
                             +'          costcusid,costcusname,iuserid,iusername,skucostclasscd,operationtype,warerentcounttype)        '+chr(13)+chr(10)
                             +' values("'+strWOJobno+'",'+chr(13)+chr(10)
                             +'        "'+strorderid+'",'+chr(13)+chr(10)
                             +'        "'+qryTmp.fieldbyname('mainorder').AsString+'",'+chr(13)+chr(10)
                             +'        "'+qryTmp.fieldbyname('cusbillno').AsString+'",'+chr(13)+chr(10)
                             +'        "'+iif(dtdReceDateT.date=0,date,dtdReceDateT.text)+'",'+chr(13)+chr(10)
                             +'        '+iif(strInOut='I','"进仓指令",','"出仓指令",')
                             +'        "'+edtCusname.TextField+'",'+chr(13)+chr(10)
                             +'        "'+edtCusname.Text+'",'+chr(13)+chr(10)
                             +'        "'+edtIuserId.TextField+'",'+chr(13)+chr(10)
                             +'        "'+edtIuserId.Text+'","COMMON",'+iif(strInOut='I','1','-1')+',"IR")'+chr(13)+chr(10)
                             +'insert into wareorderorisku                                          '+chr(13)+chr(10)
                             +'       (jobno,sno,jobnoinf,snoinf,ldsnoinf,warerentcounttype,orderid,'+chr(13)+chr(10)
                             +'        mainorder,cusbillno,operationtype,userid,username,           '+chr(13)+chr(10)
                             +'        pieceuom,weightuom,                                          '+chr(13)+chr(10)
                             +'        volumeuom,areauom,quantityuom,piece,grossweight,             '+chr(13)+chr(10)
                             +'        netweight,volume,area,quantity,skuid,skuname,                '+chr(13)+chr(10)
                             +'        qualityname,shippercusid,shippercusname,              '+chr(13)+chr(10)
                             +'        cusid,cusname,costcusid,costcusname)     '+chr(13)+chr(10)
                             +' select jobno="'+strWOJobno+'",sno,'+chr(13)+chr(10)
                             +'        jobnoinf="'+strWOJobno+'",sno,sno,"IR", '+chr(13)+chr(10)
                             +'        orderid="'+strorderid+'",'+chr(13)+chr(10)
                             +'        mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'",    '+chr(13)+chr(10)
                             +'        cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'",    '+chr(13)+chr(10)
                             +'        operationtype='+iif(strInOut='I','1,','-1,')                        +chr(13)+chr(10)
                             +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                             +'        volumeuom,areauom,quantityuom,piece,grossweight,             '+chr(13)+chr(10)
                             +'        netweight,volume,area,quantity,skuid,skuname,                '+chr(13)+chr(10)
                             +'        "正品",shippercusid,shippercusname,              '+chr(13)+chr(10)
                             +'        cusid,cusname,costcusid,costcusname      '+chr(13)+chr(10)
                             +'  from #sku                                                          '+chr(13)+chr(10)
                             +' where #sku.mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'" '+chr(13)+chr(10)
                             +'   and #sku.cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'" '+chr(13)+chr(10)

//                             +'   and isnull(#sku.remark,"")<>""                                    '+chr(13)+chr(10)
{                             +iif(strInOut='I','insert into wareordersku                            '+chr(13)+chr(10)
                             +'       (jobno,sno,jobnoinf,snoinf,ldsnoinf,                            '+chr(13)+chr(10)
                             +'        warerentcounttype,orderid,mainorder,cusbillno,operationtype, '+chr(13)+chr(10)
                             +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                             +'        volumeuom,areauom,quantityuom,piece,grossweight,             '+chr(13)+chr(10)
                             +'        netweight,volume,area,quantity,skuid,skuname,                '+chr(13)+chr(10)
                             +'        qualityname,shippercusid,shippercusname,                     '+chr(13)+chr(10)
                             +'        cusid,cusname,costcusid,costcusname)     '+chr(13)+chr(10)
                             +' select jobno="'+strWOJobno+'",sno,'+chr(13)+chr(10)
                             +'        jobnoinf="'+strWOJobno+'",sno,sno,"IR",          '+chr(13)+chr(10)
                             +'        orderid="'+strorderid+'",'+chr(13)+chr(10)
                             +'        mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'",    '+chr(13)+chr(10)
                             +'        cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'",    '+chr(13)+chr(10)
                             +'        operationtype='+iif(strInOut='I','1,','-1,')                        +chr(13)+chr(10)
                             +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                             +'        volumeuom,areauom,quantityuom,piece,grossweight,             '+chr(13)+chr(10)
                             +'        netweight,volume,area,quantity,skuid,skuname,                '+chr(13)+chr(10)
                             +'        qualityname,shippercusid,shippercusname,                     '+chr(13)+chr(10)
                             +'        cusid,cusname,costcusid,costcusname      '+chr(13)+chr(10)
                             +'  from #sku                                                          '+chr(13)+chr(10)
                             +' where #sku.mainorder="'+qryTmp.fieldbyname('mainorder').AsString+'" '+chr(13)+chr(10)
                             +'   and #sku.cusbillno="'+qryTmp.fieldbyname('cusbillno').AsString+'" '+chr(13)+chr(10)
//                             +'   and isnull(#sku.remark,"")<>""                                    '+chr(13)+chr(10)
                             ,'')}
                             );
          end;
         qryTmp.Next;
      end;
      KMessageDlg('导入指令完成!',mtInformation,[mbOK],0);
      droplsk('#sku');
      droplsk('#lskformatin');

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   frmInPutOrder.Close;
   qrysku.Close;
//   qrysku.Open;
end;

procedure TfrmInPutOrder.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmInPutOrder.edtIuserIdButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtIuserId.TextField:=qrySelect.FieldByName('userid').asstring;
      edtIuserId.Text     :=qrySelect.FieldByName('username').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmInPutOrder.edtCusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      edtCusname.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCusname.Text  :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmInPutOrder.mitDelOrderClick(Sender: TObject);
var
   i:Integer;
begin
   if KmessageDlg('你确定删除该数据?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
   for i:=grdsku.SelectedCount-1 Downto 0 do
   begin
      _ADOConnection .Starttransaction;
      try
        ExecSql(qryTmp,'delete from #sku '
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

