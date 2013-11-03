unit InPutCQ;

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
  TfrmInPutCQ = class(TForm)
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
    qryTmp: TKADOQuery;
    qryTmp1: TKADOQuery;
    ppmorder: TPopupMenu;
    mitDelOrder: TMenuItem;
    AqryMtf: TADOQuery;
    conMtf: TADOConnection;
    btnInPutOrder: TKBitBtn;
    btnOK: TKBitBtn;
    btnClose: TKBitBtn;
    lxr: TdxDBGridColumn;
    dh: TdxDBGridColumn;
    carrino: TdxDBGridColumn;
    YDH: TdxDBGridColumn;
    conno: TdxDBGridColumn;
    fh: TdxDBGridColumn;
    spec: TdxDBGridColumn;
    grdshr: TdxDBGridColumn;
    md: TdxDBGridColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
       Shift: TShiftState);
    procedure btnInPutOrderClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
  Private
    { Private declarations }
    strSql,strInOut,strjobno,strlocationbillno,strcusbillno,
    strtaskdate,strlocid: string;
    BytesToTransfer: LongWord;
    strStartarea : string ;
  Public
    { Public declarations }
  end;

procedure workInPutCQ;
var
   frmInPutCQ: TfrmInPutCQ;

implementation

{$R *.DFM}

uses inifiles,libbb,datas,kindlg, main,libuserPub,GetDllPub,datasTmp,LocationIN;
var
   AverageSpeed: Double = 0;

procedure workInPutCQ;
begin
   if (frmInPutCQ <> nil) and frmInPutCQ.HandleAllocated then
   with frmInPutCQ do
   begin
      if WindowState = wsMinimized then WindowState := wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmInPutCQ, frmInPutCQ);
   with frmInPutCQ do
   begin
      strjobno:='';
      strlocationbillno:='';
   end;
   frmInPutCQ.Show;
end;

procedure TfrmInPutCQ.btnCloseClick(Sender: TObject);
begin
   frmInPutCQ.close;
end;

procedure TfrmInPutCQ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmInPutCQ.FormCreate(Sender: TObject);
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

procedure TfrmInPutCQ.FormDestroy(Sender: TObject);
begin
   frmInPutCQ:=nil;
end;

procedure TfrmInPutCQ.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key = Vk_Return) then
      ReturnNext(self);
end;

procedure TfrmInPutCQ.btnInPutOrderClick(Sender: TObject);
var
   strName:string;
   strmaxno:string;
   i,j:Integer;
   sltTable:TStringList;
   strthecode,strthename:string;
   strlxr,strdh,strspecid:string;
begin
   strName:= OpenDialog1.filename;
   if pos('.XLS',UpperCase(Trim(ExtractFileName(strName))))>0 then
   begin
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then
         conMtf.open;
      try
         strSql:=' Select *'+
                 '   from [sheet1$] ';
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
                    +'            where id = object_id("tempdb..#cqgzb") and sysstat & 0xf = 3)'+chr(13)+chr(10)
                    +'  drop table #cqgzb ');
      Execsql(qryTmp,'   CREATE TABLE #cqgzb   /*船期跟踪表*/ '+chr(13)+chr(10)
                    +'     ( '+chr(13)+chr(10)
                    +'           sno                   SMALLINT                          NULL,              /*序号*/                   '+chr(13)+chr(10)
                    +'           carrino               VARCHAR               (20)        NULL,              /*船名航次*/               '+chr(13)+chr(10)
                    +'           ydh                   VARCHAR               (50)        NULL,              /*运单号*/                 '+chr(13)+chr(10)
                    +'           conno                 VARCHAR               (50)        NULL,              /*柜号*/                   '+chr(13)+chr(10)
                    +'           fh                    VARCHAR               (50)        NULL,              /*封号*/                   '+chr(13)+chr(10)
                    +'           spec                  VARCHAR               (50)        NULL,              /*尺寸*/                   '+chr(13)+chr(10)
                    +'           shr                   VARCHAR               (50)        NULL,              /*收货人*/                 '+chr(13)+chr(10)
                    +'           md                    VARCHAR               (100)       NULL,              /*门点*/                   '+chr(13)+chr(10)
                    +'           lxr                   VARCHAR               (50)        NULL,              /*联系人*/                 '+chr(13)+chr(10)
                    +'           dh                    VARCHAR               (50)        NULL,              /*电话*/                   '+chr(13)+chr(10)
                    +'           userid                VARCHAR               (50)        NULL,              /*组织代码*/               '+chr(13)+chr(10)
                    +'           username              VARCHAR               (50)        NULL,              /*组织名称*/               '+chr(13)+chr(10)
                    +'           createname            VARCHAR               (50)        NULL,              /*创建人*/                 '+chr(13)+chr(10)
                    +'           createdate            DATETIME                          NULL               /*创建日期*/               '+chr(13)+chr(10)
                    +'      ) '
                    );

      Application.ProcessMessages;
      I:=1;
      AqryMtf.DisableControls;
      AqryMtf.First;
      try
         while not AqryMtf.Eof do
         begin

            if AqryMtf.Fields[1].AsString<>'' then
            ExecSql(qryTmp,' Insert Into #cqgzb  ( '+chr(13)+chr(10)
                           +'       sno        ,                   '+chr(13)+chr(10)
                           +'       carrino    ,                   '+chr(13)+chr(10)
                           +'       ydh        ,                   '+chr(13)+chr(10)
                           +'       conno      ,                   '+chr(13)+chr(10)
                           +'       fh         ,                   '+chr(13)+chr(10)
                           +'       spec       ,                   '+chr(13)+chr(10)
                           +'       shr        ,                   '+chr(13)+chr(10)
                           +'       md         ,                   '+chr(13)+chr(10)
                           +'       lxr        ,                   '+chr(13)+chr(10)
                           +'       dh         ,                   '+chr(13)+chr(10)
                           +'       userid     ,                   '+chr(13)+chr(10)
                           +'       username   ,                   '+chr(13)+chr(10)
                           +'       createname ,                   '+chr(13)+chr(10)
                           +'       createdate                     '+chr(13)+chr(10)
                           +'   ) '+chr(13)+chr(10)
                           +'  values (      '+chr(13)+chr(10)
                           +'  "0",                                          '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[1].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[2].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[3].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[4].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[5].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[6].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[7].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[8].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+AqryMtf.Fields[9].AsString+'",             '+chr(13)+chr(10)
                           +'  "'+_userid+'"                   ,             '+chr(13)+chr(10)
                           +'  "'+_username+'"                 ,             '+chr(13)+chr(10)
                           +'  "'+_loginname+'"                ,             '+chr(13)+chr(10)
                           +'  "'+datetostr(getserverdate)+'"                '+chr(13)+chr(10)
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
      ExecSql(qryTmp,' declare @sno int                                  '+chr(13)+chr(10)
                    +'  select @sno=0                                    '+chr(13)+chr(10)
                    +'  update #cqgzb set sno=@sno,@sno=@sno+1           '+chr(13)+chr(10)
                    +''
              );

      OpenSql(qrySku,'select * from #cqgzb (nolock) order by sno');
      btnOK.Enabled:=True;
   end;
end;

procedure TfrmInPutCQ.btnOKClick(Sender: TObject);
var
  strorderid,strDate,strWOJobno,strskuname:string;
begin
   OpenSql(qryTmp,'select * from #cqgzb (nolock)                  '+chr(13)+chr(10)
                 +' where exists (select 1 from cqgzb             '+chr(13)+chr(10)
                 +'                where cqgzb.ydh=#cqgzb.ydh     '+chr(13)+chr(10)
                 +'                  and cqgzb.conno=#cqgzb.conno)'+chr(13)+chr(10)
                 );
   if qryTmp.RecordCount>0 then
   begin
      KmessageDlg('存在已经导入的信息,请确认！' , mtWarning,[mbOk],0);
      Exit;
   end else
   if (Kmessagedlg('是否确定导入数据？',mtInformation,[mbYes,mbNo],0)<>mrYes) then
      Exit;
   _ADOConnection.Starttransaction;
   try
      ExecSql(qryTmp,' insert into cqgzb                                                               '+chr(13)+chr(10)
                    +'        (sno,userid,username,createname,carrino,ydh,conno,                       '+chr(13)+chr(10)
                    +'  		fh,spec,shr,md,lxr,dh,createdate )                                       '+chr(13)+chr(10)
                    +' select sno,userid,username,createname,carrino,ydh,conno,                        '+chr(13)+chr(10)
                    +'        fh,spec,shr,md,lxr,dh,createdate                                         '+chr(13)+chr(10)
                    +'   from #cqgzb (nolock)                                                          '+chr(13)+chr(10)
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
   frmInPutCQ.Close;
end;

procedure TfrmInPutCQ.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

end.

