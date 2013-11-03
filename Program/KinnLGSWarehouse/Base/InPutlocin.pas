unit InPutlocin;

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
  TfrmInPutlocin = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    DragBar1: TDragBar;
    Panel5: TPanel;
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
    quantity: TdxDBGridCurrencyColumn;
    quantityuom: TdxDBGridPickColumn;
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    customerno: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    edtCusname: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    AqryMtf: TADOQuery;
    conMtf: TADOConnection;
    cmblocID: TdxButtonEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    operationdate: TdxDBGridColumn;
    colorid: TdxDBGridColumn;
    skucolor: TdxDBGridColumn;
    specid: TdxDBGridColumn;
    Panel2: TPanel;
    btnClose: TKBitBtn;
    btnOK: TKBitBtn;
    btnInPutOrder: TKBitBtn;
    btninput: TKBitBtn;
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
    procedure cmblocIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btninputClick(Sender: TObject);
  Private
    { Private declarations }
    strSql,strInOut,strjobno,strlocationbillno,strcusbillno,
    strtaskdate,strlocid: string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
  Public
    { Public declarations }
  end;

procedure workInPutlocin(pjobno:string;plocationbillno:string;pstrInOut:string);
var
   frmInPutlocin: TfrmInPutlocin;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp,LocationIN;
var
   AverageSpeed: Double = 0;

procedure workInPutlocin(pjobno:string;plocationbillno:string;pstrInOut:string);
begin
   if (frmInPutlocin <> nil) and frmInPutlocin.HandleAllocated then
   with frmInPutlocin do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmInPutlocin, frmInPutlocin);
   with frmInPutlocin do
   begin
      strjobno:='';
      strlocationbillno:='';

      OpenSql(qryTmp,'select jobno,locationbillno,cusbillno,taskdate,costcusid,costcusname '+chr(13)+chr(10)
                    +'  from locationin where jobno="'+pjobno+'"');
      edtCusname.Text         :=qryTmp.fieldbyname('costcusname').AsString;
      edtCusname.TextField    :=qryTmp.fieldbyname('costcusid').AsString;
      strtaskdate             :=qryTmp.fieldbyname('taskdate').AsString;
      strcusbillno            :=qryTmp.fieldbyname('cusbillno').AsString;
      strjobno                :=qryTmp.fieldbyname('jobno').AsString;
      strlocationbillno       :=qryTmp.fieldbyname('locationbillno').AsString;

      if pstrInOut='I' then Caption:='进仓导入' else Caption:='出仓导入';
         strInOut:=pstrInout;
   end;
   frmInPutlocin.Show;
end;

procedure TfrmInPutlocin.btnCloseClick(Sender: TObject);
begin
   frmInPutlocin.close;
end;

procedure TfrmInPutlocin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmInPutlocin.FormCreate(Sender: TObject);
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

procedure TfrmInPutlocin.FormDestroy(Sender: TObject);
begin
   frmInPutlocin:=nil;
end;

procedure TfrmInPutlocin.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure TfrmInPutlocin.btnInPutOrderClick(Sender: TObject);
var
   strName:string;
   strmaxno:string;
   i,j:Integer;
   sltTable:TStringList;
   strthecode,strthename:string;
   strskuname,strcolorid,strspecid,strlocname:string;
begin
   strName:= OpenDialog1.filename;
   if pos('.XLS',UpperCase(Trim(ExtractFileName(strName))))>0 then
   begin
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then
         conMtf.open;
      try
         strSql:=' Select *'+
                 '   from [SHEET0$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
//处理临时表
      ExecSql(qryTmp,' if exists (select * from tempdb..sysobjects'+chr(13)+chr(10)
                    +'            where id = object_id("tempdb..#inputitem") and sysstat & 0xf = 3)'+chr(13)+chr(10)
                    +'  drop table #inputitem ');
      Execsql(qryTmp,'   CREATE TABLE #inputitem   /*进仓－商品表*/ '+chr(13)+chr(10)
                    +'     ( '+chr(13)+chr(10)
                    +'           jobno                         VARCHAR               (20)          NOT NULL,                     /*工作号*/                             '+chr(13)+chr(10)
                    +'           sno                           SMALLINT                            NOT NULL,                     /*序号*/                               '+chr(13)+chr(10)
                    +'           skuid                         VARCHAR               (40)          NOT NULL,                     /*产品代码*/                           '+chr(13)+chr(10)
                    +'           skuname                       VARCHAR               (250)             NULL,                     /*商品名称*/                           '+chr(13)+chr(10)
                    +'           qualityname                   VARCHAR               (100)         NOT NULL,                     /*品质*/                               '+chr(13)+chr(10)
                    +'           userid                        VARCHAR               (20)          NOT NULL,                     /*组织代码*/                           '+chr(13)+chr(10)
                    +'           username                      VARCHAR               (30)              NULL,                     /*组织名称*/                           '+chr(13)+chr(10)
                    +'           quantityuom                   VARCHAR               (10)              NULL,                     /*数量单位*/                           '+chr(13)+chr(10)
                    +'           quantity                      NUMERIC               (16,4)            NULL,                     /*数量*/                               '+chr(13)+chr(10)
                    +'           taskdate                      DATETIME                                NULL,                     /*要求日期*/                           '+chr(13)+chr(10)
                    +'           cusid                         VARCHAR               (20)          NOT NULL,                     /*寄仓单位*/                           '+chr(13)+chr(10)
                    +'           cusname                       VARCHAR               (30)              NULL,                     /*寄仓单位名称*/                       '+chr(13)+chr(10)
                    +'           shippercusid                  VARCHAR               (20)          NOT NULL,                     /*货主*/                               '+chr(13)+chr(10)
                    +'           shippercusname                VARCHAR               (30)              NULL,                     /*货主名称*/                           '+chr(13)+chr(10)
                    +'           iuserid                       VARCHAR               (20)          NOT NULL,                     /*执行组织*/                           '+chr(13)+chr(10)
                    +'           iusername                     VARCHAR               (30)              NULL,                     /*执行组织名称*/                       '+chr(13)+chr(10)
                    +'           locid                         VARCHAR               (30)              NULL,                     /*仓位代码*/                      '+chr(13)+chr(10)
                    +'           locname                       VARCHAR               (30)              NULL,                     /*仓位*/                               '+chr(13)+chr(10)
                    +'           operationtype                 SMALLINT                                NULL,                     /*进出仓标志＋－1*/                    '+chr(13)+chr(10)
                    +'           operationdate                 DATETIME                                NULL,                     /*上架/拣货录入日期*/                  '+chr(13)+chr(10)
                    +'           warerentcounttype             VARCHAR               (8)           NOT NULL,                     /*仓租计算方式（默认为Regular）*/        '+chr(13)+chr(10)
                    +'           countrent                     CHAR                  (1)               NULL,                     /*是否计算仓租*/                       '+chr(13)+chr(10)
                    +'           locationbillno                VARCHAR               (30)              NULL,                     /*仓单号*/                             '+chr(13)+chr(10)
                    +'           operationname                 VARCHAR               (20)              NULL,                     /*上架/拣货录入人*/                    '+chr(13)+chr(10)
                    +'           costcusid                     VARCHAR               (20)              NULL,                     /*费用关系人*/                         '+chr(13)+chr(10)
                    +'           costcusname                   VARCHAR               (30)              NULL,                     /*费用关系人名称*/                     '+chr(13)+chr(10)
                    +'           quantitytask                  NUMERIC               (16,4)            NULL,                     /*任务数量*/                           '+chr(13)+chr(10)
                    +'           cusbillno                     VARCHAR               (30)              NULL,                     /*客户仓单号*/                         '+chr(13)+chr(10)
                    +'           customerno                    VARCHAR               (40)              NULL,                     /*商品编码*/                       '+chr(13)+chr(10)
                    +'           colorid                       VARCHAR               (40)              NULL,                     /*颜色编码*/                       '+chr(13)+chr(10)
                    +'           skucolor                      VARCHAR               (40)              NULL,                     /*颜色名称*/                       '+chr(13)+chr(10)
                    +'           specid                        VARCHAR               (40)              NULL,                     /*尺寸编码*/                       '+chr(13)+chr(10)
                    +'           skuspec                       VARCHAR               (40)              NULL,                      /*尺寸名称*/                       '+chr(13)+chr(10)
                    +'           remark                       VARCHAR               (100)              NULL                      /*尺寸名称*/                       '+chr(13)+chr(10)

                    +'      ) '
                    );

      Application.ProcessMessages;
      I:=1;
      j:=0;
      AqryMtf.DisableControls;
      AqryMtf.First;
      try
         while not AqryMtf.Eof do
         begin
            j:=j+1;
            if (j>7) and (AqryMtf.Fields[7].AsString<>'合计')and (AqryMtf.Fields[8].asfloat<>0) then

            //if AqryMtf.Fields[1].AsString<>'' then
            ExecSql(qryTmp,' Insert Into #inputitem  ( '+chr(13)+chr(10)
                           +'       jobno                ,                   '+chr(13)+chr(10)
                           +'       sno                  ,                   '+chr(13)+chr(10)
                           +'       skuid                ,                   '+chr(13)+chr(10)
                           +'       skuname              ,                   '+chr(13)+chr(10)
                           +'       qualityname          ,                   '+chr(13)+chr(10)
                           +'       userid               ,                   '+chr(13)+chr(10)
                           +'       username             ,                   '+chr(13)+chr(10)
                           +'       quantityuom          ,                   '+chr(13)+chr(10)
                           +'       quantity             ,                   '+chr(13)+chr(10)
                           +'       taskdate             ,                   '+chr(13)+chr(10)
                           +'       cusid                ,                   '+chr(13)+chr(10)
                           +'       cusname              ,                   '+chr(13)+chr(10)
                           +'       shippercusid         ,                   '+chr(13)+chr(10)
                           +'       shippercusname       ,                   '+chr(13)+chr(10)
                           +'       iuserid              ,                   '+chr(13)+chr(10)
                           +'       iusername            ,                   '+chr(13)+chr(10)
                           +'       locid                ,                   '+chr(13)+chr(10)
                           +'       locname              ,                   '+chr(13)+chr(10)
                           +'       operationtype        ,                   '+chr(13)+chr(10)
                           +'       operationdate        ,                   '+chr(13)+chr(10)
                           +'       warerentcounttype    ,                   '+chr(13)+chr(10)
                           +'       countrent            ,                   '+chr(13)+chr(10)
                           +'       locationbillno       ,                   '+chr(13)+chr(10)
                           +'       operationname        ,                   '+chr(13)+chr(10)
                           +'       costcusid            ,                   '+chr(13)+chr(10)
                           +'       costcusname          ,                   '+chr(13)+chr(10)
                           +'       quantitytask         ,                   '+chr(13)+chr(10)
                           +'       cusbillno            ,                   '+chr(13)+chr(10)
                           +'       customerno           ,                  '+chr(13)+chr(10)
                           +'       colorid              ,                  '+chr(13)+chr(10)
                           +'       skucolor             ,                  '+chr(13)+chr(10)
                           +'       specid               ,                  '+chr(13)+chr(10)
                           +'       skuspec              ,                   '+chr(13)+chr(10)
                           +'       remark                                 '+chr(13)+chr(10)

                           +'   ) '+chr(13)+chr(10)
                           +'  values (      '+chr(13)+chr(10)
                           +'  "'+strjobno+'",                               '+chr(13)+chr(10)
                           +'  "0",                                          '+chr(13)+chr(10)
                           +'  " space(40)",                                 '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[2].AsString+'",             '+chr(13)+chr(10)
                           +'  "品质",                                       '+chr(13)+chr(10)
                           +'  "'+_userid+'",                                '+chr(13)+chr(10)
                           +'  "'+_username+'",                              '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[7].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[8].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+strtaskdate+'",                            '+chr(13)+chr(10)
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)
                           +'  "'+_userid+'",                                '+chr(13)+chr(10)
                           +'  "'+_username+'",                              '+chr(13)+chr(10)
                           +'  "'+strlocid+'",                               '+chr(13)+chr(10)
                           +iif(cmblocid.Text<>'','"'+cmblocid.Text+'",','"'+AqryMtf.Fields[20].AsString+'",')
                           +'  "1",                                          '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[0].AsString+'",             '+chr(13)+chr(10)
                           +'  "IR",                                         '+chr(13)+chr(10)
                           +'  "T",                                          '+chr(13)+chr(10)
                           +'  "'+strlocationbillno+'",                      '+chr(13)+chr(10)
                           +'  "'+_loginname+'",                             '+chr(13)+chr(10)
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[8].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+strcusbillno+'",                           '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[1].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[3].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[4].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[5].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[6].AsString+'",              '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[19].AsString+'"              '+chr(13)+chr(10)
                           +'    )   '+chr(13)+chr(10)
                           );
            I:=I+1;
            AqryMtf.next;
         end;
         AqryMtf.EnableControls;
      except
         AqryMtf.EnableControls;
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
      ExecSql(qryTmp,' declare @sno int                                       '+chr(13)+chr(10)
                    +'  select @sno=0                                         '+chr(13)+chr(10)
                    +'  update #inputitem set sno=@sno,@sno=@sno+1            '+chr(13)+chr(10)
                    +''
              );
      ExecSql(qryTmp,' update #inputitem                                      '+chr(13)+chr(10)
                    +'    set #inputitem.skuid=sku.skuid,#inputitem.skuname=sku.skuname                      '+chr(13)+chr(10)
                    +'   from sku(nolock)                                   '+chr(13)+chr(10)
                    +'  where isnull(#inputitem.customerno,"")=isnull(sku.customerno,"")  '+chr(13)+chr(10)
              );
      if cmblocid.Text='' then
      ExecSql(qryTmp,' update #inputitem                                      '+chr(13)+chr(10)
                    +'    set #inputitem.locid=location.locid                      '+chr(13)+chr(10)
                    +'   from location(nolock)                                   '+chr(13)+chr(10)
                    +'  where isnull(#inputitem.locname,"")=isnull(location.locname,"")  '+chr(13)+chr(10)
                    +'    and isnull(isdetail,"")="T"    '+chr(13)+chr(10)
              );
      ExecSql(qryTmp,' update #inputitem                                      '+chr(13)+chr(10)
                    +'    set #inputitem.skucolor=skucolor.colorname                      '+chr(13)+chr(10)
                    +'   from skucolor(nolock)                                   '+chr(13)+chr(10)
                    +'  where isnull(#inputitem.colorid,"")=isnull(skucolor.colorid,"")  '+chr(13)+chr(10)
                    +'    and isnull(skucolor.skuid,"")=isnull(#inputitem.skuid,"")    '+chr(13)+chr(10)
              );

     //判断是否存在该仓位
     OpenSql(qryTmp1,'select #inputitem.locname          '+chr(13)+chr(10)
                    +'  from #inputitem                                                                        '+chr(13)+chr(10)
                    +' where not exists (select 1 from location (nolock) where #inputitem.locid=location.locid )      '+chr(13)+chr(10)

            );
      qryTmp1.First;
      while not qryTmp1.Eof do
      begin
         if qryTmp1.FieldByName('locname').AsString<>'' then
         begin
            if strlocname='' then
               strlocname:='仓位:"'+qryTmp1.FieldByName('locname').AsString+'" ;      '+chr(13)+chr(10)
            else
               strlocname:=strlocname
                          +'仓位:"'+qryTmp1.FieldByName('locname').AsString+'" ;      '+chr(13)+chr(10)
         end;
         qryTmp1.Next;

      end;
      if strlocname<>'' then
      begin
         KMessageDlg('"'+strlocname+'"在仓位资料中不存在,请核对！',mtWarning,[mbOK],0);
         conMtf.Close;
         Exit;
      end;

     //判断是否存在该商品
     OpenSql(qryTmp1,'select #inputitem.skuid,#inputitem.skuname,#inputitem.customerno,#inputitem.skucolor,#inputitem.skuspec          '+chr(13)+chr(10)
                    +'  from #inputitem                                                                        '+chr(13)+chr(10)
                    +' where not exists (select 1 from sku (nolock) where #inputitem.skuid=sku.skuid and "'+edtCusname.text+'" like "%"+sku.cusname+"%" )          '+chr(13)+chr(10)
                    +'    or not exists (select 1 from skucolor (nolock) where #inputitem.skuid=skucolor.skuid and #inputitem.skucolor=skucolor.colorname )        '+chr(13)+chr(10)
                    +'    or not exists (select 1 from skuspec (nolock) where #inputitem.skuid=skuspec.skuid  and #inputitem.skuspec=skuspec.specname )            '+chr(13)+chr(10)
            );

      qryTmp1.First;
      while not qryTmp1.Eof do
      begin
         if qryTmp1.FieldByName('skuid').AsString<>'' then
         begin
           
            if strskuname='' then
               strskuname:='商品:"'+qryTmp1.FieldByName('skuname').AsString+'"          '
                          +'商品编码:"'+qryTmp1.FieldByName('customerno').AsString+'"      '
                          +'颜色:"'+qryTmp1.FieldByName('skucolor').AsString+'"      '
                          +'尺寸:"'+qryTmp1.FieldByName('skuspec').AsString+'";      '+chr(13)+chr(10)
            else
               strskuname:=strskuname
                          +'商品:"'+qryTmp1.FieldByName('skuname').AsString+'"          '
                          +'商品编码:"'+qryTmp1.FieldByName('customerno').AsString+'"      '
                          +'颜色:"'+qryTmp1.FieldByName('skucolor').AsString+'"      '
                          +'尺寸:"'+qryTmp1.FieldByName('skuspec').AsString+'";      '+chr(13)+chr(10)
         end;
         qryTmp1.Next;

      end;
      if strskuname<>'' then
      begin
         KMessageDlg('"'+strskuname+'"在商品资料中不存在,请核对！',mtWarning,[mbOK],0);
         conMtf.Close;
         Exit;
      end;
      OpenSql(qryTmp,'select 1 from #inputitem '
                    +' where convert(char(10),operationdate,102)<convert(char(10),"'+strtaskdate+'",102)'
                    );
      if qryTmp.RecordCount>0 then
      begin
         KMessageDlg('上架日期不能早于计划日期,请确认！',mtWarning,[mbOK],0);
         Exit;
      end;
      OpenSql(qrySku,'select * from #inputitem (nolock) order by sno');
      btnOK.Enabled:=True;
   end;
   conMtf.Close;
end;

procedure TfrmInPutlocin.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno,strskuname:string;
begin
   if (Kmessagedlg('是否确定导入进仓数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try
//locationinitem导入
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                                    '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#inputdetail") and sysstat & 0xf=3)                            '+chr(13)+chr(10)
                    +'   drop table #inputdetail                                                                         '+chr(13)+chr(10)
                    +' select jobno,sno=null,skuid,skuname,qualityname,userid,username,quantityuom,                      '+chr(13)+chr(10)
                    +'        quantity=sum(isnull(quantity,0)),taskdate,cusid,cusname,                                   '+chr(13)+chr(10)
                    +'        shippercusid,shippercusname,iuserid,iusername,locname,locid,                               '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'        operationname,costcusid,costcusname,quantitytask=sum(isnull(quantitytask,0)),              '+chr(13)+chr(10)
                    +'        cusbillno,customerno                                                                       '+chr(13)+chr(10)
                    +'   into #inputdetail                                                                               '+chr(13)+chr(10)
                    +'   from #inputitem (nolock)                                                                        '+chr(13)+chr(10)
                    +'  group by jobno,skuid,skuname,qualityname,userid,username,quantityuom,                            '+chr(13)+chr(10)
                    +'	      taskdate,cusid,cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,        '+chr(13)+chr(10)
                    +'	      operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'	      operationname,costcusid,costcusname,cusbillno,customerno                                   '+chr(13)+chr(10)
                    +'declare @sno int                                                                                   '+chr(13)+chr(10)
                    +' select @sno=0                                                                                     '+chr(13)+chr(10)
                    +' update #inputdetail set sno=@sno,@sno=@sno+1                                                      '+chr(13)+chr(10)

                    +' insert into locationinitem                                                                        '+chr(13)+chr(10)
                    +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,skuid,skuname,                                         '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                           '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,                       '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'        operationname,costcusid,costcusname,quantitytask,cusbillno,customerno)                     '+chr(13)+chr(10)
                    +' select jobno,jobno,sno,sno,sno,skuid,skuname,                                                     '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                           '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,                       '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'        operationname,costcusid,costcusname,quantitytask,cusbillno,customerno                      '+chr(13)+chr(10)
                    +'   from #inputdetail (nolock)                                                                      '+chr(13)+chr(10)
                    );

//locationindetail导入
      ExecSql(qryTmp,' insert into locationindetail                                                                      '+chr(13)+chr(10)
                    +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                           '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                           '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,                       '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusbillno)                                                           '+chr(13)+chr(10)
                    +' select jobno,jobno,sno,sno,sno,sno,sno,skuid,skuname,                                             '+chr(13)+chr(10)
                    +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                           '+chr(13)+chr(10)
                    +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,                       '+chr(13)+chr(10)
                    +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,                    '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusbillno                                                            '+chr(13)+chr(10)
                    +'   from #inputdetail (nolock)                                                                      '+chr(13)+chr(10)
                    );
//locinskudetail导入
      ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects                                                    '+chr(13)+chr(10)
                    +'        where id=object_id("tempdb..#inputskudetail") and sysstat & 0xf=3)                         '+chr(13)+chr(10)
                    +'   drop table #inputskudetail                                                                      '+chr(13)+chr(10)
                    +' select #inputitem.jobno,#inputdetail.sno,ldsno=#inputdetail.sno,detailsno=null,                   '+chr(13)+chr(10)
                    +'	      #inputitem.skuid,#inputitem.skuname,serialno=#inputitem.customerno,                        '+chr(13)+chr(10)
                    +'	      #inputitem.quantity,quantityremain=#inputitem.quantity,                                    '+chr(13)+chr(10)
                    +'	      #inputitem.quantityuom,#inputitem.qualityname,color=#inputitem.skucolor,                   '+chr(13)+chr(10)
                    +'        #inputitem.skuspec,#inputitem.locid,#inputitem.locname,                                    '+chr(13)+chr(10)
                    +'        #inputitem.costcusid,#inputitem.costcusname,                                               '+chr(13)+chr(10)
                    +'	      #inputitem.cusid,#inputitem.cusname,                                                       '+chr(13)+chr(10)
                    +'	      #inputitem.shippercusid,#inputitem.shippercusname,                                         '+chr(13)+chr(10)
                    +'	      #inputitem.userid,#inputitem.username,#inputitem.operationdate,                            '+chr(13)+chr(10)
                    +'        #inputitem.iuserid,#inputitem.iusername,tracktype="TO",#inputitem.remark                                     '+chr(13)+chr(10)
                    +'   into #inputskudetail                                                                            '+chr(13)+chr(10)
                    +'   from #inputitem  (nolock)                                                                       '+chr(13)+chr(10)
                    +'        left join #inputdetail (nolock)                                                            '+chr(13)+chr(10)
                    +'               on #inputitem.customerno=#inputdetail.customerno                                    '+chr(13)+chr(10)
                    +'              and #inputitem.locid=#inputdetail.locid                                              '+chr(13)+chr(10)
                    +'declare @sno int                                                                                   '+chr(13)+chr(10)
                    +' select @sno=0                                                                                     '+chr(13)+chr(10)
                    +' update #inputskudetail set detailsno=@sno,@sno=@sno+1                                             '+chr(13)+chr(10)
                    +' insert into locinskudetail                                                                        '+chr(13)+chr(10)
                    +'        (jobno,sno,ldsno,detailsno,skuid,                                                          '+chr(13)+chr(10)
                    +'	      skuname,serialno,quantity,quantityremain,quantityuom,                                      '+chr(13)+chr(10)
                    +'	      qualityname,color,skuspec,locid,locname,                                                   '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,                           '+chr(13)+chr(10)
                    +'	      userid,username,operationdate,iuserid,iusername,tracktype,remark)                                 '+chr(13)+chr(10)
                    +' select jobno,sno,ldsno,detailsno,skuid,                                                           '+chr(13)+chr(10)
                    +'	      skuname,serialno,quantity,quantityremain,quantityuom,                                      '+chr(13)+chr(10)
                    +'	      qualityname,color,skuspec,locid,locname,                                                   '+chr(13)+chr(10)
                    +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname,                           '+chr(13)+chr(10)
                    +'	      userid,username,operationdate,iuserid,iusername,tracktype,remark                           '+chr(13)+chr(10)
                    +'   from #inputskudetail (nolock)                                                                   '+chr(13)+chr(10)
                    );
//更新主表
      ExecSql(qryTmp,' update locationin                                                                                 '+chr(13)+chr(10)
                    +'    set operationdate=(select top 1 operationdate from #inputitem                                  '+chr(13)+chr(10)
                    +'                        where #inputitem.jobno=locationin.jobno),                                  '+chr(13)+chr(10)
                    +'        quantity=(select sum(isnull(quantity,0)) from #inputitem                                   '+chr(13)+chr(10)
                    +'                        where #inputitem.jobno=locationin.jobno),                                  '+chr(13)+chr(10)
                    +'        quantitytasked=(select sum(isnull(quantity,0)) from #inputitem                             '+chr(13)+chr(10)
                    +'                        where #inputitem.jobno=locationin.jobno),                                  '+chr(13)+chr(10)
                    +'        operationname="'+_loginname+'",                                                            '+chr(13)+chr(10)
                    +'        taskisComplete="T",                                                                        '+chr(13)+chr(10)
                    +'        cusid=costcusid,cusname=costcusname,                                                       '+chr(13)+chr(10)
                    +'        shippercusid=costcusid,shippercusname=costcusname                                          '+chr(13)+chr(10)
                    +'  where jobno="'+strjobno+'"                                                                       '+chr(13)+chr(10)
                    +' update locinskudetail                                                                             '+chr(13)+chr(10)
                    +'    set skubrand=locationin.blno                                                                   '+chr(13)+chr(10)
                    +'   from locationin(nolock)                                                                         '+chr(13)+chr(10)
                    +'  where locationin.jobno=locinskudetail.jobno                                                      '+chr(13)+chr(10)
                    +'    and locinskudetail.jobno="'+strjobno+'"                                                        '+chr(13)+chr(10)

                    );

      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
   KMessageDlg('数据导入成功!',mtInformation,[mbOK],0);
   grdSku.DataSource:=nil;
   btnOK.Enabled:=False;
   conMtf.Close;
   frmInPutlocin.Close;
   frmLocationIN.btnRefresh.OnClick(Sender);
end;

procedure TfrmInPutlocin.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmInPutlocin.mitDelOrderClick(Sender: TObject);
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

procedure TfrmInPutlocin.cmblocIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      cmblocID.TextField  :=qrySelect.FieldByName('classid').asstring;
      cmblocID.Text       :=qrySelect.FieldByName('LocName').asstring;
      strlocid            :=qrySelect.fieldbyname('LocID').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmInPutlocin.btninputClick(Sender: TObject);
var
   strName:string;
   strmaxno:string;
   i,j:Integer;
   sltTable:TStringList;
   strthecode,strthename:string;
   strskuname,strcolorid,strspecid:string;
begin
   strName:= OpenDialog1.filename;
   if pos('.XLS',UpperCase(Trim(ExtractFileName(strName))))>0 then
   begin
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then
         conMtf.open;
      try
         strSql:=' Select *'+
                 '   from [商品进货通知单$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
//处理临时表
      ExecSql(qryTmp,' if exists (select * from tempdb..sysobjects'+chr(13)+chr(10)
                    +'            where id = object_id("tempdb..#inputitem") and sysstat & 0xf = 3)'+chr(13)+chr(10)
                    +'  drop table #inputitem ');
      Execsql(qryTmp,'   CREATE TABLE #inputitem   /*进仓－商品表*/ '+chr(13)+chr(10)
                    +'     ( '+chr(13)+chr(10)
                    +'           jobno                         VARCHAR               (20)          NOT NULL,                     /*工作号*/                             '+chr(13)+chr(10)
                    +'           sno                           SMALLINT                            NOT NULL,                     /*序号*/                               '+chr(13)+chr(10)
                    +'           skuid                         VARCHAR               (40)          NOT NULL,                     /*产品代码*/                           '+chr(13)+chr(10)
                    +'           skuname                       VARCHAR               (250)             NULL,                     /*商品名称*/                           '+chr(13)+chr(10)
                    +'           qualityname                   VARCHAR               (100)         NOT NULL,                     /*品质*/                               '+chr(13)+chr(10)
                    +'           userid                        VARCHAR               (20)          NOT NULL,                     /*组织代码*/                           '+chr(13)+chr(10)
                    +'           username                      VARCHAR               (30)              NULL,                     /*组织名称*/                           '+chr(13)+chr(10)
                    +'           quantityuom                   VARCHAR               (10)              NULL,                     /*数量单位*/                           '+chr(13)+chr(10)
                    +'           quantity                      NUMERIC               (16,4)            NULL,                     /*数量*/                               '+chr(13)+chr(10)
                    +'           taskdate                      DATETIME                                NULL,                     /*要求日期*/                           '+chr(13)+chr(10)
                    +'           cusid                         VARCHAR               (20)          NOT NULL,                     /*寄仓单位*/                           '+chr(13)+chr(10)
                    +'           cusname                       VARCHAR               (30)              NULL,                     /*寄仓单位名称*/                       '+chr(13)+chr(10)
                    +'           shippercusid                  VARCHAR               (20)          NOT NULL,                     /*货主*/                               '+chr(13)+chr(10)
                    +'           shippercusname                VARCHAR               (30)              NULL,                     /*货主名称*/                           '+chr(13)+chr(10)
                    +'           iuserid                       VARCHAR               (20)          NOT NULL,                     /*执行组织*/                           '+chr(13)+chr(10)
                    +'           iusername                     VARCHAR               (30)              NULL,                     /*执行组织名称*/                       '+chr(13)+chr(10)
                    +'           locid                         VARCHAR               (30)              NULL,                     /*仓位代码*/                      '+chr(13)+chr(10)
                    +'           locname                       VARCHAR               (30)              NULL,                     /*仓位*/                               '+chr(13)+chr(10)
                    +'           operationtype                 SMALLINT                                NULL,                     /*进出仓标志＋－1*/                    '+chr(13)+chr(10)
                    +'           operationdate                 DATETIME                                NULL,                     /*上架/拣货录入日期*/                  '+chr(13)+chr(10)
                    +'           warerentcounttype             VARCHAR               (8)           NOT NULL,                     /*仓租计算方式（默认为Regular）*/        '+chr(13)+chr(10)
                    +'           countrent                     CHAR                  (1)               NULL,                     /*是否计算仓租*/                       '+chr(13)+chr(10)
                    +'           locationbillno                VARCHAR               (30)              NULL,                     /*仓单号*/                             '+chr(13)+chr(10)
                    +'           operationname                 VARCHAR               (20)              NULL,                     /*上架/拣货录入人*/                    '+chr(13)+chr(10)
                    +'           costcusid                     VARCHAR               (20)              NULL,                     /*费用关系人*/                         '+chr(13)+chr(10)
                    +'           costcusname                   VARCHAR               (30)              NULL,                     /*费用关系人名称*/                     '+chr(13)+chr(10)
                    +'           quantitytask                  NUMERIC               (16,4)            NULL,                     /*任务数量*/                           '+chr(13)+chr(10)
                    +'           cusbillno                     VARCHAR               (30)              NULL,                     /*客户仓单号*/                         '+chr(13)+chr(10)
                    +'           customerno                    VARCHAR               (40)              NULL,                     /*商品编码*/                       '+chr(13)+chr(10)
                    +'           colorid                       VARCHAR               (40)              NULL,                     /*颜色编码*/                       '+chr(13)+chr(10)
                    +'           skucolor                      VARCHAR               (40)              NULL,                     /*颜色名称*/                       '+chr(13)+chr(10)
                    +'           specid                        VARCHAR               (40)              NULL,                     /*尺寸编码*/                       '+chr(13)+chr(10)
                    +'           skuspec                       VARCHAR               (40)              NULL                      /*尺寸名称*/                       '+chr(13)+chr(10)
                    +'      ) '
                    );

      Application.ProcessMessages;
      I:=1;
      j:=0;
      AqryMtf.DisableControls;
      AqryMtf.First;
      try
         while not AqryMtf.Eof do
         begin
            j:=j+1;
            if (j>21) and (AqryMtf.Fields[0].AsString<>'合计') then

            //if AqryMtf.Fields[1].AsString<>'' then
            ExecSql(qryTmp,' Insert Into #inputitem  ( '+chr(13)+chr(10)
                           +'       jobno                ,                   '+chr(13)+chr(10)
                           +'       sno                  ,                   '+chr(13)+chr(10)
                           +'       skuid                ,                   '+chr(13)+chr(10)
                           +'       skuname              ,                   '+chr(13)+chr(10)
                           +'       qualityname          ,                   '+chr(13)+chr(10)
                           +'       userid               ,                   '+chr(13)+chr(10)
                           +'       username             ,                   '+chr(13)+chr(10)
                           +'       quantityuom          ,                   '+chr(13)+chr(10)
                           +'       quantity             ,                   '+chr(13)+chr(10)
                           +'       taskdate             ,                   '+chr(13)+chr(10)
                           +'       cusid                ,                   '+chr(13)+chr(10)
                           +'       cusname              ,                   '+chr(13)+chr(10)
                           +'       shippercusid         ,                   '+chr(13)+chr(10)
                           +'       shippercusname       ,                   '+chr(13)+chr(10)
                           +'       iuserid              ,                   '+chr(13)+chr(10)
                           +'       iusername            ,                   '+chr(13)+chr(10)
                           +'       locid                ,                   '+chr(13)+chr(10)
                           +'       locname              ,                   '+chr(13)+chr(10)
                           +'       operationtype        ,                   '+chr(13)+chr(10)
                           +'       operationdate        ,                   '+chr(13)+chr(10)
                           +'       warerentcounttype    ,                   '+chr(13)+chr(10)
                           +'       countrent            ,                   '+chr(13)+chr(10)
                           +'       locationbillno       ,                   '+chr(13)+chr(10)
                           +'       operationname        ,                   '+chr(13)+chr(10)
                           +'       costcusid            ,                   '+chr(13)+chr(10)
                           +'       costcusname          ,                   '+chr(13)+chr(10)
                           +'       quantitytask         ,                   '+chr(13)+chr(10)
                           +'       cusbillno            ,                   '+chr(13)+chr(10)
                           +'       customerno           ,                  '+chr(13)+chr(10)
                           +'       colorid              ,                  '+chr(13)+chr(10)
                           +'       skucolor             ,                  '+chr(13)+chr(10)
                           +'       specid               ,                  '+chr(13)+chr(10)
                           +'       skuspec                                 '+chr(13)+chr(10)
                           +'   ) '+chr(13)+chr(10)
                           +'  values (      '+chr(13)+chr(10)
                           +'  "'+strjobno+'",                               '+chr(13)+chr(10)  //工作号
                           +'  "0",                                          '+chr(13)+chr(10)  //sno
                           +'  "space(40)",                                 '+chr(13)+chr(10)  //skuid
                           +'  "'+AqryMtf.Fields[1].AsString+'",             '+chr(13)+chr(10)  //skuname
                           +'  "品质",                                       '+chr(13)+chr(10)  //
                           +'  "'+_userid+'",                                '+chr(13)+chr(10)  //userid
                           +'  "'+_username+'",                              '+chr(13)+chr(10)  //username
                           +'  "'+AqryMtf.Fields[2].AsString+'",             '+chr(13)+chr(10)  //数量单位
                           +'  "'+AqryMtf.Fields[9].AsString+'",             '+chr(13)+chr(10)  //数量
                           +'  "'+strtaskdate+'",                            '+chr(13)+chr(10)  //taskdate
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)  //cusid
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)  //cusname
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)  //shippercusid
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)  //shippercusname
                           +'  "'+_userid+'",                                '+chr(13)+chr(10)  //iuserid
                           +'  "'+_username+'",                              '+chr(13)+chr(10)  //iusername
                           +'  "'+strlocid+'",                               '+chr(13)+chr(10)  //locid
                           +'  "'+cmblocid.Text+'",                          '+chr(13)+chr(10)  //locname
                           +'  "1",                                          '+chr(13)+chr(10)  //operationtype
                           +'  "'+strtaskdate+'",                            '+chr(13)+chr(10)  //上架日期operationdate
                           +'  "IR",                                         '+chr(13)+chr(10)  //warerentcounttype
                           +'  "T",                                          '+chr(13)+chr(10)  //countrent
                           +'  "'+strlocationbillno+'",                      '+chr(13)+chr(10)  //locationbillno
                           +'  "'+_loginname+'",                             '+chr(13)+chr(10)  //operationname
                           +'  "'+edtCusname.TextField+'",                   '+chr(13)+chr(10)  //costcusid
                           +'  "'+edtCusname.Text+'",                        '+chr(13)+chr(10)  //costcusname
                           +'  "'+AqryMtf.Fields[9].AsString+'",             '+chr(13)+chr(10)  //quantitytask
                           +'  "'+strcusbillno+'",                           '+chr(13)+chr(10)  //cusbillno
                           +'  "'+AqryMtf.Fields[0].AsString+'",             '+chr(13)+chr(10)  //customerno商编
                           +'  "'+AqryMtf.Fields[5].AsString+'",             '+chr(13)+chr(10)  //colorid
                           +'  "'+AqryMtf.Fields[6].AsString+'",             '+chr(13)+chr(10)  //skucolor
                           +'  "'+AqryMtf.Fields[7].AsString+'",             '+chr(13)+chr(10)  //specid
                           +'  "'+AqryMtf.Fields[8].AsString+'"              '+chr(13)+chr(10)  //skuspec
                           +'    )   '+chr(13)+chr(10)
                           );
            I:=I+1;
            AqryMtf.next;
         end;
         AqryMtf.EnableControls;
      except
         AqryMtf.EnableControls;
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
      ExecSql(qryTmp,' declare @sno int                                       '+chr(13)+chr(10)
                    +'  select @sno=0                                         '+chr(13)+chr(10)
                    +'  update #inputitem set sno=@sno,@sno=@sno+1            '+chr(13)+chr(10)
                    +''
              );
      ExecSql(qryTmp,' update #inputitem                                      '+chr(13)+chr(10)
                    +'    set #inputitem.skuid=sku.skuid                      '+chr(13)+chr(10)
                    +'   from #inputitem                                      '+chr(13)+chr(10)
                    +'        left join sku                                   '+chr(13)+chr(10)
                    +'               on #inputitem.customerno=sku.customerno  '+chr(13)+chr(10)
              );

     //判断是否存在该商品
     OpenSql(qryTmp1,'select #inputitem.skuid,#inputitem.skuname,#inputitem.colorid,#inputitem.specid          '+chr(13)+chr(10)
                    +'  from #inputitem                                                                        '+chr(13)+chr(10)
                    +' where not exists (select 1 from sku (nolock) where #inputitem.skuid=sku.skuid and sku.cusid="'+edtCusname.TextField+'")          '+chr(13)+chr(10)
                    +'    or not exists (select 1 from skucolor (nolock) where #inputitem.skuid=skucolor.skuid and #inputitem.colorid=skucolor.colorid )        '+chr(13)+chr(10)
                    +'    or not exists (select 1 from skuspec (nolock) where #inputitem.skuid=skuspec.skuid  and #inputitem.specid=skuspec.specid )            '+chr(13)+chr(10)
            );
      qryTmp1.First;
      while not qryTmp1.Eof do
      begin
         if qryTmp1.FieldByName('skuid').AsString<>'' then
         begin
            if strskuname='' then
               strskuname:='商品:"'+qryTmp1.FieldByName('skuname').AsString+'"          '
                          +'颜色编码:"'+qryTmp1.FieldByName('colorid').AsString+'"      '
                          +'尺寸编码:"'+qryTmp1.FieldByName('specid').AsString+'";      '+chr(13)+chr(10)
            else
               strskuname:=strskuname
                          +'商品:"'+qryTmp1.FieldByName('skuname').AsString+'"          '
                          +'颜色编码:"'+qryTmp1.FieldByName('colorid').AsString+'"      '
                          +'尺寸编码:"'+qryTmp1.FieldByName('specid').AsString+'";      '+chr(13)+chr(10)
         end;
         qryTmp1.Next;

      end;
      if strskuname<>'' then
      begin
         KMessageDlg('"'+strskuname+'"在商品资料中不存在,请核对！',mtWarning,[mbOK],0);
         Exit;
      end;
      OpenSql(qryTmp,'select 1 from #inputitem '
                    +' where convert(char(10),operationdate,102)<convert(char(10),"'+strtaskdate+'",102)'
                    );
      if qryTmp.RecordCount>0 then
      begin
         KMessageDlg('上架日期不能早于计划日期,请确认！',mtWarning,[mbOK],0);
         Exit;
      end;
      OpenSql(qrySku,'select * from #inputitem (nolock) order by sno');
      btnOK.Enabled:=True;
   end;

end;

end.

