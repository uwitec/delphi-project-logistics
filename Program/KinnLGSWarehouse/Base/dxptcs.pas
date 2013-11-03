unit Dxptcs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, KGroupBox,
  DB, DBTables, DBClient, KDataSetProvider, DbButtons, ExtCtrls, dxExEdtr,
  dxEdLib, dxEditor, GMSLabel, KinPickEdit, Menus, ADODB, ComCtrls, ToolWin,
  KSText;

type
  TfrmDxptcs = class(TForm)
    qryTmp: TKADOQuery;
    ppmedit: TPopupMenu;
    mitdel: TMenuItem;
    mitprint: TMenuItem;
    qryDxptcs: TKADOQuery;
    dtsDxptcs: TDataSource;
    dbsLogis1: TKADODatabase;
    Pmain: TPanel;
    btnprint: TKBitBtn;
    btnReceiving: TKBitBtn;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    edttel: TdxEdit;
    Btnreply: TKBitBtn;
    btnDel: TKBitBtn;
    Btninvalid: TKBitBtn;
    dtdDateF: TdxDateEdit;
    dtdDateT: TdxDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtSmsContent: TdxEdit;
    qrytmp1: TKADOQuery;
    qrytmp2: TKADOQuery;
    KGroupBox4: TKGroupBox;
    Panel1: TPanel;
    KGroupBox2: TKGroupBox;
    grdDxptcs: TdxDBGrid;
    SmsIndex: TdxDBGridColumn;
    SendNumber: TdxDBGridColumn;
    SmsTime: TdxDBGridColumn;
    SmsContent: TdxDBGridColumn;
    Isdel: TdxDBGridColumn;
    Isinvalid: TdxDBGridColumn;
    Isprint: TdxDBGridColumn;
    Isreply: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    KGroupBox3: TKGroupBox;
    edtremarks: TdxMemo;
    btnall: TKBitBtn;
    btnyhf: TKBitBtn;
    btnyzf: TKBitBtn;
    btnydy: TKBitBtn;
    btnysc: TKBitBtn;
    edtdai: TKBitBtn;
    GMSStickyLabel72: TGMSStickyLabel;
    edtcolor1: TKSText;
    GMSStickyLabel73: TGMSStickyLabel;
    KSText3: TKSText;
    GMSStickyLabel31: TGMSStickyLabel;
    KSText1: TKSText;
    GMSStickyLabel74: TGMSStickyLabel;
    grdcusname: TdxDBGridColumn;
    btnadd: TKBitBtn;
    qrytmp3: TKADOQuery;
    isadd: TdxDBGridColumn;
    qrytmp4: TKADOQuery;
    btnsc: TKBitBtn;
    btnwsc: TKBitBtn;
    bthzh: TKBitBtn;
    edtshipcusname: TdxEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    edtskumodel: TdxEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtskuspec: TdxEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtlotcode: TdxEdit;
    edtmu: TdxEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    edtremark: TdxEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    edtquantity: TdxCalcEdit;
    edtpiece: TdxCalcEdit;
    btnwareorder: TKBitBtn;
    btnwzh: TKBitBtn;
    btnyzh: TKBitBtn;
    edtskuname: TdxButtonEdit;
    btnsjx: TKBitBtn;
    mitcancel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnReceivingClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitdelClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure grdDxptcsClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure BtninvalidClick(Sender: TObject);
    procedure BtnreplyClick(Sender: TObject);
    procedure Getsql(Pfilter:string);
    procedure edttelChange(Sender: TObject);
    procedure edtSmsContentChange(Sender: TObject);
    procedure dtdDateFChange(Sender: TObject);
    procedure dtdDateTChange(Sender: TObject);
    procedure btnallClick(Sender: TObject);
    procedure btnyhfClick(Sender: TObject);
    procedure btnyzfClick(Sender: TObject);
    procedure btnyscClick(Sender: TObject);
    procedure btnydyClick(Sender: TObject);
    procedure edtdaiClick(Sender: TObject);
    procedure mitprintClick(Sender: TObject);
    procedure grdDxptcsCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure edttelKeyPress(Sender: TObject; var Key: Char);
    procedure mitaddClick(Sender: TObject);
    procedure btnscClick(Sender: TObject);
    procedure btnwscClick(Sender: TObject);
    procedure bthzhClick(Sender: TObject);
    procedure btnwareorderClick(Sender: TObject);
    procedure edtSmsContentExit(Sender: TObject);
    procedure cs1Click(Sender: TObject);
    procedure btnwzhClick(Sender: TObject);
    procedure btnyzhClick(Sender: TObject);
    procedure edtskunameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtskunameExit(Sender: TObject);
    procedure edtquantityValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtpieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtskunameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnsjxClick(Sender: TObject);
    procedure mitcancelClick(Sender: TObject);
  private
    { Private declarations }
    strAccountID:string;
    strsql,sqlfilter,strpiecepro: string;
  public
    { Public declarations }
  end;

procedure WorkDxptcs;

var
  frmDxptcs: TfrmDxptcs;

implementation

{$R *.dfm}

uses  libproc,libUser,libuserPub,Datas,kindlg, main,GetUserRight,GetDllPub,
      dxGridOut,linprint,libBb,bbShow,ss,Dxhf,datastmp;

procedure WorkDxptcs;
var
  strSql,strTask:string;
  i:integer;
  lstList:TStringList;
begin
   if frmDxptcs<>nil then
   with frmDxptcs do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      dbsLogis1.Connected;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmDxptcs, frmDxptcs);
   with frmDxptcs do
   begin
      dtdDateF.date:=date-1;
      dtdDateT.date:=date;

      opensql(qrytmp2,'select Dxserver from KSYSCNFG (nolock) ');
      dbsLogis1.ConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;Password=%s;User ID=%s;Data Source=%s;Mode=ReadWrite|Share Deny None;Persist Security Info=True',['','ADMIN',qrytmp2.fieldbyname('Dxserver').asstring]);
      strsql:=' select *           '+chr(13)+chr(10)
             +'   from RecvSms(nolock)     '+chr(13)+chr(10)
             +'  where isnull(isdel,"F")<>"T" '+chr(13)+chr(10)
             +'    and isnull(isinvalid,"F")<>"T" '+chr(13)+chr(10)
             +'    and isnull(isreply,"F")<>"T" '+chr(13)+chr(10)
             +'    and convert(char(10),smstime,102)>="'+dtdDateF.text+'" '+chr(13)+chr(10)
             +'    and convert(char(10),smstime,102)<="'+dtdDateT.text+'" '+chr(13)+chr(10)
             +'  order by smsindex desc  '+chr(13)+chr(10)

             ;
      qryDxptcs.Close;
      qryDxptcs.Sql.Clear;
      qryDxptcs.Sql.Add(strsql);
      qryDxptcs.Open;
   end;
   frmDxptcs.Show;
end;

procedure TfrmDxptcs.FormCreate(Sender: TObject);
begin
   Width:=903;
   Height:=565;
   SetFormPosition(Self,True);
   SetFormStyle(Self);

   SetDxDbGrid(grdDxptcs);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox3);
   SetGroupbox(KGroupBox4);

//   SetGroupbox(KGroupBox5);
   qryDxptcs.Connection:=_ADOConnection;
   qrytmp2.Connection:=_ADOConnection;
   //qrytmp.Connection:=_ADOConnection;
   qrytmp4.Connection:=_ADOConnection;
   qrytmp3.Connection:=_ADOConnection;
end;

procedure TfrmDxptcs.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  qryTmp.Close;
  qrytmp1.Close;
  qrytmp2.Close;
  qrytmp3.Close;
  qrytmp4.Close;

  qryDxptcs.Close;
  frmDxptcs:=nil;
end;

procedure TfrmDxptcs.btnReceivingClick(Sender: TObject);
var
  strSql,strfilterSql:string;
  i:integer;
  lstList:TStringList;
begin
   strsql:=' select *                               '+chr(13)+chr(10)
//          +'   from RecvSmsTable                    '+chr(13)+chr(10)
          +'   from SmsRecordTable                    '+chr(13)+chr(10)
          +'  where iif(IsNull(isRecvSms),"F",IsNull(isRecvSms)) ="F"               '+chr(13)+chr(10)
          ;
   qryTmp.Close;
   qryTmp.Sql.Clear;
   qryTmp.Sql.Add(strsql);
   qryTmp.Open;
   qryTmp.Active;

   qryTmp.First;
   while not qryTmp.Eof do
   begin
      ExecSql(qryDxptcs,'insert into RecvSms  '+chr(13)+chr(10)
                       +'       (smsindex,smstime,sendnumber,receiver,smscontent,  '+chr(13)+chr(10)
                       +'        isdel,isinvalid,isprint,isreply,status,cusname)        '+chr(13)+chr(10)
                       +'values (                                                  '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('smsindex').AsString+'"   , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('smstime').AsString+'"    , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('phonenumber').AsString+'" , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('Smsoperator').AsString+'"   , '+chr(13)+chr(10)
//                       +'        "'+qryTmp.FieldByName('smscontent').AsString+'" , '+chr(13)+chr(10)
                       +'        "'+StringReplace(StringReplace(qryTmp.FieldByName('smscontent').AsString,'"','”',[rfReplaceAll]),'''','’',[rfReplaceAll])+'"   , '+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('status').AsString+'"  ,'+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('name').AsString+'")       '+chr(13)+chr(10)
                    );
      ExecSql(qryTmp1,'update SmsRecordTable             '+chr(13)+chr(10)
                    +'   set isrecvsms="T"               '+chr(13)+chr(10)
                    +' where smsindex='+(qryTmp.FieldByName('smsindex').AsString)+'');

      qryTmp.next;
   end;


//   strsql:=' select * from RecvSms     '+chr(13)+chr(10);
   strsql:=' select *           '+chr(13)+chr(10)
          +'   from RecvSms(nolock)     '+chr(13)+chr(10)
          +'  where isnull(isdel,"F")<>"T" '+chr(13)+chr(10)
          +'    and isnull(isinvalid,"F")<>"T" '+chr(13)+chr(10)
          +'    and isnull(isreply,"F")<>"T" '+chr(13)+chr(10)
          +'    and convert(char(10),smstime,102)>="'+dtdDateF.text+'" '+chr(13)+chr(10)
          +'    and convert(char(10),smstime,102)<="'+dtdDateT.text+'" '+chr(13)+chr(10)
          +'  order by smsindex desc  '+chr(13)+chr(10)
          ;

   qryDxptcs.Close;
   qryDxptcs.Sql.Clear;
   qryDxptcs.Sql.Add(strsql);
   qryDxptcs.Open;

   btnprint.Enabled:=True;
end;

procedure TfrmDxptcs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmDxptcs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrmDxptcs.mitdelClick(Sender: TObject);
var
   i :Integer;
begin
   if KmessageDlg('该操作将把选定短信状态设置为删除,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdDxptcs.SelectedCount-1 Downto 0 do
      begin
         qryDxptcs.GotoBookmark(Pointer(grdDxptcs.SelectedRows[i]));
         ExecSQl(qryTmp2,' update RecvSms              '+chr(13)+chr(10)
                        +'    set isdel="T"            '+chr(13)+chr(10)
                        +'  where sno="'+qryDxptcs.fieldbyname('sno').AsString+'"'
         );
      end;
   end;
   Getsql('');
end;

procedure TfrmDxptcs.btnprintClick(Sender: TObject);
var
   lstPara:TStringList;
   i:Integer;
begin
   lstPara:=TStringList.Create;

   OpenSql(qryTmp2,'select *                                                     '+chr(13)+chr(10)
                 +'  from RecvSms(nolock)                                               '+chr(13)+chr(10)
                 +' where sno="'+qryDxptcs.fieldbyname('sno').AsString+'"   '+chr(13)+chr(10)
                 );
   lstpara.Add('SendNumber='+qryTmp2.fieldbyname('SendNumber').AsString);
   lstpara.Add('SmsTime='+qryTmp2.fieldbyname('SmsTime').AsString);
   lstpara.Add('SmsContent='+qryTmp2.fieldbyname('SmsContent').AsString);
   lstpara.Add('cusname='+qryTmp2.fieldbyname('cusname').AsString);   
   lstpara.Add('zdr='+_loginname);
   lstpara.Add('zdrq='+datetostr(GetServerDate));
   Worklinprint('100179','old','短信打印',qryTmp2,nil,nil,lstpara);

   ExecSQl(qryTmp2,' update RecvSms              '+chr(13)+chr(10)
                  +'    set isprint="T"            '+chr(13)+chr(10)
                  +'  where sno="'+qryDxptcs.fieldbyname('sno').AsString+'"'
   );
//   Getsql(' and isnull(isdel,"F")<>"T" and isnull(Isinvalid,"F")<>"T" and isnull(Isreply,"F")<>"T"');
end;

procedure TfrmDxptcs.grdDxptcsClick(Sender: TObject);
begin
   edtremarks.Text:=qryDxptcs.fieldbyname('SendNumber').AsString   +chr(13)+chr(10)
                   +' '+chr(13)+chr(10)
                   +'    '+qryDxptcs.fieldbyname('SmsContent').AsString;
end;

procedure TfrmDxptcs.btnDelClick(Sender: TObject);
var
   i :Integer;
begin
   if KmessageDlg('该操作将把选定短信状态设置为删除,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdDxptcs.SelectedCount-1 Downto 0 do
      begin
         qryDxptcs.GotoBookmark(Pointer(grdDxptcs.SelectedRows[i]));
         ExecSQl(qryTmp2,' update RecvSms              '+chr(13)+chr(10)
                        +'    set isdel="T"            '+chr(13)+chr(10)
                        +'  where sno="'+qryDxptcs.fieldbyname('sno').AsString+'"'
         );
      end;
   end;
//   Getsql(' and isnull(isdel,"F")<>"T" and isnull(Isinvalid,"F")<>"T" and isnull(Isreply,"F")<>"T"');
end;

procedure TfrmDxptcs.BtninvalidClick(Sender: TObject);
var
   i :Integer;
begin
   if KmessageDlg('该操作将把选定短信状态设置为作废,确定进行吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then //nomsg
   begin
      for i:=grdDxptcs.SelectedCount-1 Downto 0 do
      begin
         qryDxptcs.GotoBookmark(Pointer(grdDxptcs.SelectedRows[i]));
         ExecSQl(qryTmp2,' update RecvSms              '+chr(13)+chr(10)
                        +'    set Isinvalid="T"        '+chr(13)+chr(10)
                        +'  where sno="'+qryDxptcs.fieldbyname('sno').AsString+'"'
         );
      end;
   end;
//   Getsql(' and isnull(isdel,"F")<>"T" and isnull(Isinvalid,"F")<>"T" and isnull(Isreply,"F")<>"T"');
end;

procedure TfrmDxptcs.BtnreplyClick(Sender: TObject);
begin
   if (qryDxptcs.FieldByName('isdel').AsString='T') then
   begin
      kMessageDlg('该条短信已删除不能执行该操作，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end else
   if (qryDxptcs.FieldByName('Isinvalid').AsString='T') then
   begin
      kMessageDlg('该条短信已作废不能执行该操作，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end else
   if (qryDxptcs.FieldByName('Isreply').AsString='T') then
   begin
      kMessageDlg('该条短信已回复不能执行该操作，请确认！', mtWarning, [mbOK], 0);
      Exit;
   end else
   begin
      WorkDxhf(qryDxptcs.fieldbyname('sno').AsString);
   end;
   Getsql(' and isnull(isdel,"F")<>"T" and isnull(Isinvalid,"F")<>"T" and isnull(Isreply,"F")<>"T"');
end;

procedure TfrmDxptcs.Getsql(Pfilter:string);
var
   strsql1,strtype:string;
begin
   sqlfilter:='';
   strsql1:='';
   strtype:='';

   if dtdDateF.Date<>0 then
   begin
      sqlfilter:=sqlfilter+' and convert(char(10),SmsTime,102)>="'+dtdDateF.Text+'"';
   end;
   if dtdDateT.Date<>0 then
   begin
      sqlfilter:=sqlfilter+' and convert(char(10),SmsTime,102)<="'+dtdDateT.Text+'"';
   end;
   if edttel.Text<>'' then
   begin
      sqlfilter:=sqlfilter+' and isnull(SendNumber,"") like "%'+trim(edttel.Text)+'%"';
   end;
   if edtSmsContent.Text<>'' then
   begin
      sqlfilter:=sqlfilter+' and isnull(SmsContent,"") like "%'+trim(edtSmsContent.Text)+'%"';
   end;

   if Pfilter<>'' then
      sqlfilter:=sqlfilter+Pfilter;

   strsql1:=' select *                               '+chr(13)+chr(10)
           +'   from RecvSms (nolock)                '+chr(13)+chr(10)
           +'  where 1=1                             '+chr(13)+chr(10)
           +sqlfilter
           +'  order by smsindex desc  '+chr(13)+chr(10)
           ;
   qryDxptcs.Close;
   qryDxptcs.Sql.Clear;
   qryDxptcs.Sql.Add(strsql1);
   qryDxptcs.Open;
end;

procedure TfrmDxptcs.edttelChange(Sender: TObject);
begin
   Getsql('');
end;

procedure TfrmDxptcs.edtSmsContentChange(Sender: TObject);
begin
  // Getsql(' and SmsContent like "%'+edtSmsContent.Text+'%"   ');
end;

procedure TfrmDxptcs.dtdDateFChange(Sender: TObject);
begin
   Getsql('');
end;

procedure TfrmDxptcs.dtdDateTChange(Sender: TObject);
begin
   Getsql('');
end;

procedure TfrmDxptcs.btnallClick(Sender: TObject);
begin
   Getsql('');
//   GMSStickyLabel6.Caption:='共：'+inttostr(grdDxptcs.Count);
end;

procedure TfrmDxptcs.btnyhfClick(Sender: TObject);
begin
   Getsql(' and isnull(Isreply,"F")="T" ');
end;

procedure TfrmDxptcs.btnyzfClick(Sender: TObject);
begin
   Getsql(' and isnull(Isinvalid,"F")="T" ');
end;

procedure TfrmDxptcs.btnyscClick(Sender: TObject);
begin
   Getsql(' and isnull(isdel,"F")="T" ');
end;

procedure TfrmDxptcs.btnydyClick(Sender: TObject);
begin
   Getsql(' and isnull(Isprint,"F")="T" ');
end;

procedure TfrmDxptcs.edtdaiClick(Sender: TObject);
begin
   Getsql(' and isnull(isdel,"F")<>"T" and isnull(Isinvalid,"F")<>"T" and isnull(Isreply,"F")<>"T"');
end;

procedure TfrmDxptcs.mitprintClick(Sender: TObject);
begin
   btnprint.OnClick(Sender);
end;

procedure TfrmDxptcs.grdDxptcsCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if trim(ANode.Values[Isprint.Index])='T' then
   begin
      AColor := clSkyBlue;
   end;
//   if trim(ANode.Values[Isreply.Index])='T' then
//   begin
//      AColor := $00C1DBC1;
//   end;
   if trim(ANode.Values[Isinvalid.Index])='T' then
   begin
      AColor := clOlive;
   end;
   if trim(ANode.Values[Isdel.Index])='T' then
   begin
      AColor := clAppWorkSpace;
   end;
end;

procedure TfrmDxptcs.edttelKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9']) then
   begin
      key:=#0;
      exit;
   end
end;

procedure TfrmDxptcs.mitaddClick(Sender: TObject);
var
  i,faltCount,j,faltcomplete:integer;
  strjobnoupd,strmsg:string;
  lstList,sltFpTmp:TStringList;
  F: TextFile;
  S,StrList,Strsql: string;
  strname,strremark,strtaskdate,strlocationbillno,strcreateid:string;
  strskunameitem,strmsgsku,strZsql,strcusname:string;
begin
   j:=grdDxptcs.SelectedCount;
   lstList:=TstringList.Create;
   sltFpTmp:=Tstringlist.create;

   if KmessageDlg('该操作将生成出库任务,您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strmsg:='';
   faltCount:=0;
   faltcomplete:=0;
   strjobnoupd:='';
   for i:=grdDxptcs.SelectedCount-1 Downto 0 do
   begin
      qryDxptcs.GotoBookmark(Pointer(grdDxptcs.SelectedRows[i]));
      if qryDxptcs.FieldByName('isadd').AsString='T' then Inc(faltCount)  //已生成
      else begin
         if strjobnoupd='' then strjobnoupd:='"'+qryDxptcs.fieldbyname('sno').AsString+'"'
         else strjobnoupd:=strjobnoupd+',"'+qryDxptcs.fieldbyname('sno').AsString+'"';
      end;
   end;
   if strjobnoupd<>'' then
   begin
      opensql(datatmp.qryTmp,'select cusname=substring(cusname,1,CHARINDEX("-",cusname)-1),smstime ,  '
                            +'       receiver, smscontent=replace(smscontent,"，",",")     '
                            +'  from RecvSms(nolock)  '
                            +' where sno in  ('+strjobnoupd+')'
            );

      execsql(datatmp.qryTmp1,'if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#locoutitemSku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #locoutitemSku                                         '+chr(13)+chr(10)
                             +'select sno,jobno,userid,username,iuserid,iusername,   '+chr(13)+chr(10)
                             +'       pieceuom,weightuom,quantityuom, '+chr(13)+chr(10)
                             +'       piece,netweight,quantity, '+chr(13)+chr(10)
                             +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                             +'       shipcusname,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                             +'       ManufactureDate,lotcode,skumodel,skuspec,taskdate    '+chr(13)+chr(10)
                             +'  into #locoutitemSku '+chr(13)+chr(10)
                             +'  from locationoutitem (nolock)'+chr(13)+chr(10)
                             +' where 1=2               '+chr(13)+chr(10)
                             +'    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#outskuitem") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #outskuitem  '+chr(13)+chr(10)
                             +'select sno,jobno,jobnoin,snoin,ldsnoinf,userid,username,iuserid,iusername,   '+chr(13)+chr(10)
                             +'       pieceuom,weightuom,quantityuom, '+chr(13)+chr(10)
                             +'       piece,netweight,quantity, '+chr(13)+chr(10)
                             +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                             +'       shipcusname,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                             +'       ManufactureDate,lotcode,skumodel,skuspec,taskdate    '+chr(13)+chr(10)
                             +'  into #outskuitem '+chr(13)+chr(10)
                             +'  from locationoutitem (nolock)'+chr(13)+chr(10)
                             +' where 1=2               '+chr(13)+chr(10)
                );


      if datatmp.qryTmp.recordcount>0 then
      begin
         datatmp.qryTmp.First;
         while not datatmp.qryTmp.Eof do
         begin
            strcusname:=datatmp.qryTmp.fieldbyname('cusname').AsString;
            strname:=datatmp.qryTmp.fieldbyname('receiver').AsString;
            strtaskdate:=datatmp.qryTmp.fieldbyname('smstime').AsString;
            strremark:=datatmp.qryTmp.fieldbyname('smscontent').AsString;

            breakStr(strremark,',',false,false,false,sltFpTmp);
            try

               execsql(datatmp.qryTmp1,'insert into #locoutitemSku '+chr(13)+chr(10)
                                   +'select sno=0, '+chr(13)+chr(10)
                                   +'       jobno=0, '+chr(13)+chr(10)
                                   +'       userid="'+_userid+'", '+chr(13)+chr(10)
                                   +'       username="'+_username+'", '+chr(13)+chr(10)
                                   +'       iuserid="'+_userid+'", '+chr(13)+chr(10)
                                   +'       iusername="'+_username+'", '+chr(13)+chr(10)
                                   +'       pieceuom=null, '+chr(13)+chr(10)
                                   +'       weightuom=null, '+chr(13)+chr(10)
                                   +'       quantityuom=null, '+chr(13)+chr(10)
                                   +'       piece="'+sltFptmp.strings[7]+'", '+chr(13)+chr(10)
                                   +'       netweight=0, '+chr(13)+chr(10)
                                   +'       quantity="'+sltFptmp.strings[6]+'" , '+chr(13)+chr(10)
                                   +'       skuid=1, '+chr(13)+chr(10)
                                   +'       classid=null, '+chr(13)+chr(10)
                                   +'       skuname="'+sltFptmp.strings[1]+'" , '+chr(13)+chr(10)
                                   +'       qualityname="正品", '+chr(13)+chr(10)
                                   +'       shippercusid=1, '+chr(13)+chr(10)
                                   +'       shippercusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       mainorder=null, '+chr(13)+chr(10)
                                   +'       shipcusname="'+sltFptmp.strings[0]+'", '+chr(13)+chr(10)
                                   +'       cusid=1, '+chr(13)+chr(10)
                                   +'       cusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       costcusid=1, '+chr(13)+chr(10)
                                   +'       costcusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       remark="'+sltFptmp.strings[8]+'" , '+chr(13)+chr(10)
                                   +'       ManufactureDate="'+sltFptmp.strings[5]+'", '+chr(13)+chr(10)
                                   +'       lotcode="'+sltFptmp.strings[4]+'", '+chr(13)+chr(10)
                                   +'       skumodel="'+sltFptmp.strings[2]+'" , '+chr(13)+chr(10)
                                   +'       skuspec="'+sltFptmp.strings[3]+'" , '+chr(13)+chr(10)

                                   +'       taskdate="'+strtaskdate+'"  '+chr(13)+chr(10)
                );
            except
               Kmessagedlg('格式错误,不允许导入！', mtInformation,[mbOk],0);
               exit;
            end;
            datatmp.qryTmp.Next;
         end;
         OpenSql(dataTmp.qryTmp1,'    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#sumitemsku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #sumitemsku                                         '+chr(13)+chr(10)
                             +'select skuid,skuname,skumodel,skuspec,                           '+chr(13)+chr(10)
                             +'       syquantity=sum(isnull(item.quantity,0)-isnull(item.quantitydo,0))'+chr(13)+chr(10)
                             +'  into #sumitemsku                                               '+chr(13)+chr(10)
                             +'  from locationinitem item(nolock)                               '+chr(13)+chr(10)
                             +' where item.quantity>isnull(item.quantitydo,0)                   '+chr(13)+chr(10)

                             +' group by skuid,skuname,skumodel,skuspec                         '+chr(13)+chr(10)
                             +'select skuname,skuspec,skumodel from  #locoutitemSku               '+chr(13)+chr(10)
                             +' where not exists(select 1 from #sumitemsku(nolock)              '+chr(13)+chr(10)
                             +'                   where #locoutitemSku.skuname=#sumitemsku.skuname       '+chr(13)+chr(10)
                             +'                     and isnull(#locoutitemSku.skuspec,"")=isnull(#sumitemsku.skuspec,"")  '+chr(13)+chr(10)
                             +'                     and isnull(#locoutitemSku.skumodel,"")=isnull(#sumitemsku.skumodel,"")'+chr(13)+chr(10)

                             +'                     and isnull(#sumitemsku.syquantity,0)>=#locoutitemSku.quantity )      '+chr(13)+chr(10)
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

         openSql(datatmp.qryTmp2,'update #locoutitemSku set           '+chr(13)+chr(10)
                                +'       skuid=isnull(sku.skuid,""),costcusid=isnull(customer.cusid,""),classid=isnull(sku.classid,""),  '+chr(13)+chr(10)
                                +'       cusid=isnull(customer.cusid,""),shippercusid=isnull(customer.cusid,"") '+chr(13)+chr(10)
                                +'  from #locoutitemSku '+chr(13)+chr(10)
                                +'        left join customer(nolock) '+chr(13)+chr(10)
                                +'               on customer.cusname=#locoutitemSku.costcusname  '+chr(13)+chr(10)
                                +'              and customer.cusname=#locoutitemSku.costcusname  '+chr(13)+chr(10)
                                +'              and isnull(customer.taboo,"F")="F"  '+chr(13)+chr(10)
                                +'        left join sku(nolock)                  '+chr(13)+chr(10)
                                +'               on sku.skuname=#locoutitemSku.skuname  '+chr(13)+chr(10)
                                +'              and sku.skumodel=#locoutitemSku.skumodel '+chr(13)+chr(10)
                                +'              and sku.skuspec=#locoutitemSku.skuspec   '+chr(13)+chr(10)

                                +' select #locoutitemSku.shipcusname,#locoutitemSku.taskdate,#locoutitemSku.skuid,#locoutitemSku.costcusid,'+chr(13)+chr(10)
                                +'        remark=case when isnull(#locoutitemSku.cusid,"")="" then "客户不存在"   '+chr(13)+chr(10)
                                +'                    when isnull(#locoutitemSku.skuid,"")="" then "商品不存在"  else "" end  '+chr(13)+chr(10)
                                +'   from #locoutitemSku  '+chr(13)+chr(10)
                                //+'        left join locationinitem(nolock)  '+chr(13)+chr(10)
                                //+' having sum(isnull(item.quantity,0)-isnull(item.quantitydo,0))'+chr(13)+chr(10)

                  );
         datatmp.qryTmp2.first;
         while not datatmp.qryTmp2.eof do
         begin
            strmsgsku:=strmsgsku+datatmp.qryTmp2.fieldbyname('remark').AsString;
            datatmp.qryTmp2.next;
         end;
         if strmsgsku<>'' then
         begin
            kMessageDlg('"'+strmsgsku+'",不能生成出库信息', mtInformation, [mbOK], 0);
            exit;
         end else
         begin
            _ADOConnection.Starttransaction;
            try

               opensql(datatmp.qryTmp3,'select distinct shipcusname,customer.cusid,#locoutitemSku.remark,  '+chr(13)+chr(10)
                                      +'       costcusname,custype=codelib.codechar1      '+chr(13)+chr(10)
                                      +'  from #locoutitemSku '+chr(13)+chr(10)
                                      +'       left join customer(nolock)      '+chr(13)+chr(10)
                                      +'            left join codelib (nolock) '+chr(13)+chr(10)
                                      +'                   on customer.custype=codelib.codename    '+chr(13)+chr(10)
                                      +'                  and codelib.codeclass="09"          '+chr(13)+chr(10)
                                      +'              on customer.cusid=#locoutitemSku.costcusid '+chr(13)+chr(10)
                        );
               datatmp.qryTmp3.first;
               while not datatmp.qryTmp3.eof do
               begin
                  if Length(datatmp.qryTmp3.fieldbyname('custype').AsString)>1 then
                  begin
                     OpenSql(dataTmp.qryTmp,'select maxno=isnull(max(substring(docno1,6,6)),0)+1'
                                           +'  from genjobno(nolock) '
                                           +' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
                                           +'   and substring(docno1,3,2)="'+datatmp.qryTmp3.fieldbyname('custype').AsString+'" '
                                           +'   and substring(docno1,4,1)<>"U" '
                                           +'   and len(docno1)=11'
                            );
                  end else
                  begin
                     OpenSql(dataTmp.qryTmp,'select maxno=isnull(max(substring(docno1,5,6)),0)+1'
                                           +'  from genjobno(nolock) '
                                           +' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
                                           +'   and substring(docno1,3,1)="'+datatmp.qryTmp3.fieldbyname('custype').AsString+'" '
                                           +'   and substring(docno1,4,1)<>"U" '
                                           +'   and len(docno1)=10'
                            );
                  end;

                  strlocationbillno:=copy(DateToStr(Date),3,2)+datatmp.qryTmp3.fieldbyname('custype').AsString+'-'+pad(dataTmp.qryTmp.fieldbyname('maxno').asstring,6, '0', psLeft);
                  strCreateID:=genJobno('LO',strlocationbillno);
                  //临时表
                  OpenSql(qrytmp3,'select * from #locoutitemSku  '
                                +' where shipcusname="'+datatmp.qryTmp3.fieldbyname('shipcusname').AsString+'"'
                                );

                  qrytmp3.First;
                  while not qrytmp3.Eof do
                  begin
                     strZsql:=' ksp_fifoitem "'+'item.operationdate asc,item.quantity asc'+'",   '
                             +'              "'+qrytmp3.fieldbyname('classid').AsString+'",         ' //商品名称
                             +'              '+qrytmp3.fieldbyname('quantity').AsString+', '//数量
                             +'              "and costcusid='+qrytmp3.fieldbyname('costcusid').AsString+' " ' //过滤条件
                             ;
                     qryTmp4.SQL.Clear;
                     qryTmp4.SQL.Add(strZsql);
                     qryTmp4.Open;

                     qryTmp4.First;
                     while not qryTmp4.Eof do
                     begin
                        execsql(qrytmp2,'insert into #outskuitem  '+chr(13)+chr(10)
                                       +'select sno=0,                                          '+chr(13)+chr(10)
                                       +'       jobno="'+strCreateID+'",                     '+chr(13)+chr(10)
                                       +'       jobnoin="'+qryTmp4.fieldbyname('jobno').AsString+'",           '+chr(13)+chr(10)
                                       +'       snoin="'+qryTmp4.fieldbyname('sno').AsString+'",                '+chr(13)+chr(10)
                                       +'       ldsnoinf=0,                                                        '+chr(13)+chr(10)
                                       +'       userid="'+qrytmp3.fieldbyname('userid').AsString+'",              '+chr(13)+chr(10)
                                       +'       username="'+qrytmp3.fieldbyname('username').AsString+'",          '+chr(13)+chr(10)
                                       +'       iuserid="'+qrytmp3.fieldbyname('iuserid').AsString+'",            '+chr(13)+chr(10)
                                       +'       iusername="'+qrytmp3.fieldbyname('iusername').AsString+'",        '+chr(13)+chr(10)
                                       +'       pieceuom="'+qryTmp4.fieldbyname('pieceuom').AsString+'",          '+chr(13)+chr(10)
                                       +'       weightuom="'+qryTmp4.fieldbyname('weightuom').AsString+'",        '+chr(13)+chr(10)
                                       +'       quantityuom="'+qryTmp4.fieldbyname('quantityuom').AsString+'",    '+chr(13)+chr(10)
                                       +'       piece="'+qryTmp4.fieldbyname('sypiece').AsString+'",            '+chr(13)+chr(10)
                                       +'       netweight="'+qryTmp4.fieldbyname('synetweight').AsString+'",            '+chr(13)+chr(10)
                                       +'       quantity="'+qryTmp4.fieldbyname('syquantity').AsString+'",      '+chr(13)+chr(10)
                                       +'       skuid="'+qrytmp3.fieldbyname('skuid').AsString+'",                '+chr(13)+chr(10)
                                       +'       classid="'+qrytmp3.fieldbyname('classid').AsString+'",                '+chr(13)+chr(10)
                                       +'       skuname="'+qrytmp3.fieldbyname('skuname').AsString+'",            '+chr(13)+chr(10)
                                       +'       qualityname="正品",                                              '+chr(13)+chr(10)
                                       +'       shippercusid="'+qryTmp4.fieldbyname('shippercusid').AsString+'",    '+chr(13)+chr(10)
                                       +'       shippercusname="'+qryTmp4.fieldbyname('shippercusname').AsString+'",'+chr(13)+chr(10)
                                       +'       mainorder="'+qrytmp3.fieldbyname('mainorder').AsString+'",       '+chr(13)+chr(10)
                                       +'       shipcusname="'+qrytmp3.fieldbyname('shipcusname').AsString+'",       '+chr(13)+chr(10)
                                       +'       cusid="'+qryTmp4.fieldbyname('cusid').AsString+'",           '+chr(13)+chr(10)
                                       +'       cusname="'+qryTmp4.fieldbyname('cusname').AsString+'",       '+chr(13)+chr(10)
                                       +'       costcusid="'+qrytmp3.fieldbyname('costcusid').AsString+'",       '+chr(13)+chr(10)
                                       +'       costcusname="'+qrytmp3.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                                       +'       remark="'+qrytmp3.fieldbyname('remark').AsString+'",           '+chr(13)+chr(10)
                                       +'       ManufactureDate="'+qryTmp4.fieldbyname('ManufactureDate').AsString+'" ,     '+chr(13)+chr(10)
                                       +'       lotcode="'+qrytmp3.fieldbyname('lotcode').AsString+'" ,     '+chr(13)+chr(10)
                                       +'       skumodel="'+qryTmp4.fieldbyname('skumodel').AsString+'",         '+chr(13)+chr(10)
                                       +'       skuspec="'+qryTmp4.fieldbyname('skuspec').AsString+'",  '+chr(13)+chr(10)
                                       +'       taskdate="'+qrytmp3.fieldbyname('taskdate').AsString+'"   '+chr(13)+chr(10)
                                       +'declare @i smallint                                      '+chr(13)+chr(10)
                                       +' select @i=0                                             '+chr(13)+chr(10)
                                       +' update #outskuitem                                      '+chr(13)+chr(10)
                                       +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)
                                                );
                         qryTmp4.Next;

                     end;
                     qryTmp4.SQL.Clear;
                     qryTmp4.Close;
                     qrytmp3.Next;
                  end;


                  ExecSql(qryTmp4,' insert into locationout                                                        '+chr(13)+chr(10)
                                +'       ( jobno,operationtype,userid,username,iuserid,iusername,                 '+chr(13)+chr(10)
                                +'        createname,createdate,costcusid,costcusname,                            '+chr(13)+chr(10)
                                +'        cusid,cusname,shippercusid,shippercusname,                              '+chr(13)+chr(10)
                                +'        warerentcounttype,taskdate,locationbillno,shipcusname,                    '+chr(13)+chr(10)
                                +'        LotTracked,isbond,COUNTRENT,SKUCOSTCLASSCD,mainorder,remark                    '+chr(13)+chr(10)
                                +'        )                                                                       '+chr(13)+chr(10)
                                +' select "'+strCreateID+'","-1","'+_userid+'","'+_username+'",       '+chr(13)+chr(10)
                                +'        "'+_userid+'","'+_username+'",                           '+chr(13)+chr(10)
                                +'        "'+strname+'","'+datetostr(GetServerDate)+'",                        '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'", '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'",  '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'",  '+chr(13)+chr(10)
                                +'        "IR", "'+strtaskdate+'","'+strlocationbillno+'",                    '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('shipcusname').AsString+'",              '+chr(13)+chr(10)
                                +'        "F", "F", "T", "COMMON",null, "'+datatmp.qryTmp3.fieldbyname('remark').AsString+'"                         '+chr(13)+chr(10)
                                +' ');
            //插入locationoutdetail

                  ExecSql(qryTmp4,'declare @i smallint                                      '+chr(13)+chr(10)
                                +' select @i=0                                             '+chr(13)+chr(10)
                                +' update #outskuitem                                      '+chr(13)+chr(10)
                                +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)

                                +'insert into locationoutitem                                          '+chr(13)+chr(10)
                                +'       (jobno,sno,jobnoin,snoin,jobnoinf,snoinf,ldsnoinf,warerentcounttype,'+chr(13)+chr(10)
                                +'        mainorder,shipcusname,operationtype,userid,username,           '+chr(13)+chr(10)
                                +'        pieceuom,weightuom,quantityuom,piecetask,             '+chr(13)+chr(10)
                                +'        netweighttask,quantitytask,skuid,skuname,                '+chr(13)+chr(10)
                                +'        qualityname,shippercusid,shippercusname,              '+chr(13)+chr(10)
                                +'        cusid,cusname,costcusid,costcusname, ManufactureDate,               '+chr(13)+chr(10)
                                +'        lotcode,skumodel,skuspec,iuserid,iusername  )  '+chr(13)+chr(10)
                                +' select jobno=#outskuitem.jobno,sno=#outskuitem.sno,'+chr(13)+chr(10)
                                +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,  '+chr(13)+chr(10)
                                +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,-1,"IR", '+chr(13)+chr(10)
                                +'        mainorder,shipcusname,operationtype=-1,              '+chr(13)+chr(10)
                                +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                                +'        quantityuom,piece,             '+chr(13)+chr(10)
                                +'        netweight,quantity,skuid,skuname,                '+chr(13)+chr(10)
                                +'        "正品",shippercusid,               '+chr(13)+chr(10)
                                +'        shippercusname,              '+chr(13)+chr(10)
                                +'        cusid,cusname,     '+chr(13)+chr(10)
                                +'        costcusid,costcusname,ManufactureDate , '+chr(13)+chr(10)
                                +'        lotcode ,skumodel,skuspec,     '+chr(13)+chr(10)
                                +'        iuserid,iusername   '+chr(13)+chr(10)
                                +'  from  #outskuitem                    '+chr(13)+chr(10)
                                +'  where isnull(skuid,"")<>""'
                      );
                  datatmp.qryTmp3.next;
               end;


               _ADOConnection.Commit;
               kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);

            except
               try
                 _ADOConnection.rollback;
               except
               end;
               raise;
               kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);

               execsql(qryTmp4,'drop table  #sumitemsku    '
                             +'drop table  #locoutitemSku    '

                             +'drop table  #lskoutitem    ');
               Exit;
            end;
         end;

      end;
      execSql(datatmp.qryTmp,'update RecvSms  '
                   +'   set isadd="T" '
                   +' where SNO in ('+strjobnoupd+')');
   end;


   if faltCount<>0 then strmsg:=IntToStr(faltCount)+'/'+IntToStr(j)+'已生成出库信息';
   if strmsg<>'' then
      KMessageDlg(strmsg,mtInformation,[mbOK],0)
      //IIF(_Language='CAPTIONC',''笔资料无拣货或已经审核的数据未审核！','笔任务未完成不能审核！')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);

end;

procedure TfrmDxptcs.btnscClick(Sender: TObject);
begin
   Getsql(' and isnull(isadd,"F")="T" ');
end;

procedure TfrmDxptcs.btnwscClick(Sender: TObject);
begin
   Getsql(' and isnull(isadd,"F")="F" ');
end;

procedure TfrmDxptcs.bthzhClick(Sender: TObject);
var
   strremark:string;
begin
    //opensql(datatmp.qryTmp,);
    if edtskuname.text='' then
    begin
       KMessageDlg('商品名称不能为空',mtWarning,[mbOK],0);
       ActiveControl:=edtskuname;
       Exit;
    end else
    if edtskumodel.text='' then
    begin
       KMessageDlg('克重不能为空',mtWarning,[mbOK],0);
       ActiveControl:=edtskumodel;
       Exit;
    end else
    if edtskuspec.text='' then
    begin
       KMessageDlg('商品规格不能为空',mtWarning,[mbOK],0);
       ActiveControl:=edtskuspec;
       Exit;
    end else
    if edtquantity.text='' then
    begin
       KMessageDlg('数量不能为空',mtWarning,[mbOK],0);
       ActiveControl:=edtquantity;
       Exit;
    end else
    if edtpiece.text='' then
    begin
       KMessageDlg('件数不能为空',mtWarning,[mbOK],0);
       ActiveControl:=edtpiece;
       Exit;
    end;
    if qryDxptcs.fieldbyname('isadd').AsString='T' then
    begin
       KMessageDlg('已下指令,不能重复下达',mtWarning,[mbOK],0);
       Exit;
    end;
    strremark:=strremark+edtshipcusname.text+','+edtskuname.text+','+edtskumodel.text+','+edtskuspec.text+
                   ','+edtlotcode.text+','+edtmu.text+','+edtquantity.text+','+edtpiece.text+
                   ','+edtremark.text+',' ;
    execSql(datatmp.qryTmp,'update RecvSms  '
                   +'   set SmsContent="'+strremark+'",iscomplete="T" '
                   +' where SNO ="'+qryDxptcs.fieldbyname('sno').AsString+'"'

                   );
    {openSql(qryDxptcs,'select * from  RecvSms(nolock)  '
                   +'  where isnull(isdel,"F")<>"T" '+chr(13)+chr(10)
             +'    and isnull(isinvalid,"F")<>"T" '+chr(13)+chr(10)
             +'    and isnull(isreply,"F")<>"T" '+chr(13)+chr(10)
             +'    and convert(char(10),smstime,102)>="'+dtdDateF.text+'" '+chr(13)+chr(10)
             +'    and convert(char(10),smstime,102)<="'+dtdDateT.text+'" '+chr(13)+chr(10)
             +'  order by smsindex desc  '+chr(13)+chr(10)
                   ); }
    KMessageDlg('转换完成',mtWarning,[mbOK],0);
    //edtremarks.Text:=edtremarkzh.text;
end;

procedure TfrmDxptcs.btnwareorderClick(Sender: TObject);
var
  i,faltCount,j,faltcomplete:integer;
  strjobnoupd,strmsg:string;
  lstList,sltFpTmp:TStringList;
  F: TextFile;
  S,StrList,Strsql,strDate,strorderid: string;
  strname,strremark,strtaskdate,strlocationbillno,strcreateid:string;
  strskunameitem,strmsgsku,strZsql,strcusname:string;
begin
   j:=grdDxptcs.SelectedCount;
   lstList:=TstringList.Create;
   sltFpTmp:=Tstringlist.create;

   if KmessageDlg('该操作将生成出仓指令,您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   strmsg:='';
   faltCount:=0;
   faltcomplete:=0;
   strjobnoupd:='';
   for i:=grdDxptcs.SelectedCount-1 Downto 0 do
   begin
      qryDxptcs.GotoBookmark(Pointer(grdDxptcs.SelectedRows[i]));
      if qryDxptcs.FieldByName('isadd').AsString='T' then Inc(faltCount)  //已生成
      else begin
         if strjobnoupd='' then strjobnoupd:='"'+qryDxptcs.fieldbyname('sno').AsString+'"'
         else strjobnoupd:=strjobnoupd+',"'+qryDxptcs.fieldbyname('sno').AsString+'"';
      end;
   end;
   if strjobnoupd<>'' then
   begin
      opensql(datatmp.qryTmp,'select cusname=substring(cusname,1,CHARINDEX("-",cusname)-1),smstime ,  '
                            +'       receiver, smscontent=replace(smscontent,"，",",")     '
                            +'  from RecvSms(nolock)  '
                            +' where sno in  ('+strjobnoupd+')'
            );

      execsql(datatmp.qryTmp1,'if exists(select * from tempdb..sysobjects            '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#wareorderitemSku") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #wareorderitemSku                                         '+chr(13)+chr(10)
                             +'select sno,jobno,userid,username,   '+chr(13)+chr(10)
                             +'       pieceuom,weightuom,quantityuom, '+chr(13)+chr(10)
                             +'       piece,netweight,quantity, '+chr(13)+chr(10)
                             +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                             +'       shipcusname,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                             +'       ManufactureDate,lotcode,skumodel=space(50),skuspec=space(50)    '+chr(13)+chr(10)
                             +'  into #wareorderitemSku '+chr(13)+chr(10)
                             +'  from wareorderorisku (nolock)'+chr(13)+chr(10)
                             +' where 1=2               '+chr(13)+chr(10)
                             +'    if exists(select * from tempdb..sysobjects                   '+chr(13)+chr(10)
                             +' where id=object_id("tempdb..#wareoutskuitem") and sysstat & 0xf=3)  '+chr(13)+chr(10)
                             +'  drop table #wareoutskuitem  '+chr(13)+chr(10)
                             +'select sno,jobno,jobnoin,snoin,ldsnoinf,userid,username,   '+chr(13)+chr(10)
                             +'       pieceuom,weightuom,quantityuom, '+chr(13)+chr(10)
                             +'       piece,netweight,quantity, '+chr(13)+chr(10)
                             +'       skuid,classid=space(40),skuname,qualityname,shippercusid,shippercusname,mainorder,'+chr(13)+chr(10)
                             +'       shipcusname,cusid,cusname,costcusid,costcusname,remark, '+chr(13)+chr(10)
                             +'       ManufactureDate,lotcode,skumodel=space(50),skuspec=space(50)    '+chr(13)+chr(10)
                             +'  into #wareoutskuitem '+chr(13)+chr(10)
                             +'  from wareorderorisku (nolock)'+chr(13)+chr(10)
                             +' where 1=2               '+chr(13)+chr(10)
                );


      if datatmp.qryTmp.recordcount>0 then
      begin
         datatmp.qryTmp.First;
         while not datatmp.qryTmp.Eof do
         begin
            strcusname:=datatmp.qryTmp.fieldbyname('cusname').AsString;
            strname:=datatmp.qryTmp.fieldbyname('receiver').AsString;
            strtaskdate:=datatmp.qryTmp.fieldbyname('smstime').AsString;
            strremark:=datatmp.qryTmp.fieldbyname('smscontent').AsString;

            breakStr(strremark,',',false,false,false,sltFpTmp);
            try

               execsql(datatmp.qryTmp1,'insert into #wareorderitemSku '+chr(13)+chr(10)
                                   +'select sno=0, '+chr(13)+chr(10)
                                   +'       jobno=0, '+chr(13)+chr(10)
                                   +'       userid="'+_userid+'", '+chr(13)+chr(10)
                                   +'       username="'+_username+'", '+chr(13)+chr(10)

                                   +'       pieceuom=null, '+chr(13)+chr(10)
                                   +'       weightuom=null, '+chr(13)+chr(10)
                                   +'       quantityuom=null, '+chr(13)+chr(10)
                                   +'       piece="'+sltFptmp.strings[7]+'", '+chr(13)+chr(10)
                                   +'       netweight=0, '+chr(13)+chr(10)
                                   +'       quantity="'+sltFptmp.strings[6]+'" , '+chr(13)+chr(10)
                                   +'       skuid=1, '+chr(13)+chr(10)
                                   +'       classid=null, '+chr(13)+chr(10)
                                   +'       skuname="'+sltFptmp.strings[1]+'" , '+chr(13)+chr(10)
                                   +'       qualityname="正品", '+chr(13)+chr(10)
                                   +'       shippercusid=1, '+chr(13)+chr(10)
                                   +'       shippercusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       mainorder=null, '+chr(13)+chr(10)
                                   +'       shipcusname="'+sltFptmp.strings[0]+'", '+chr(13)+chr(10)
                                   +'       cusid="1", '+chr(13)+chr(10)
                                   +'       cusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       costcusid="1", '+chr(13)+chr(10)
                                   +'       costcusname="'+datatmp.qryTmp.fieldbyname('cusname').AsString+'", '+chr(13)+chr(10)
                                   +'       remark="'+sltFptmp.strings[8]+'" , '+chr(13)+chr(10)
                                   +'       ManufactureDate="'+sltFptmp.strings[5]+'", '+chr(13)+chr(10)
                                   +'       lotcode="'+sltFptmp.strings[4]+'", '+chr(13)+chr(10)
                                   +'       skumodel="'+sltFptmp.strings[2]+'" , '+chr(13)+chr(10)
                                   +'       skuspec="'+sltFptmp.strings[3]+'" '+chr(13)+chr(10)
                );
            except
               Kmessagedlg('格式错误,不允许导入！', mtInformation,[mbOk],0);
               exit;
            end;
            datatmp.qryTmp.Next;
         end;

         opensql(datatmp.qryTmp3,'select 1      '+chr(13)+chr(10)
                                +'  from #wareorderitemSku '+chr(13)+chr(10)
                                +' where not exists(select 1 from  customer(nolock)      '+chr(13)+chr(10)
                                +'               where customer.cusname=#wareorderitemSku.costcusname) '+chr(13)+chr(10)
                        );
         //
         if not dataTmp.qryTmp3.IsEmpty then
         begin
            kMessageDlg('客户不存在', mtInformation, [mbOK], 0);
            exit;
         end else
         begin
            _ADOConnection.Starttransaction;
            try

               opensql(datatmp.qryTmp3,'select distinct shipcusname,cusid=isnull(customer.cusid,""),#wareorderitemSku.remark,  '+chr(13)+chr(10)
                                      +'       costcusname   '+chr(13)+chr(10)
                                      +'  from #wareorderitemSku '+chr(13)+chr(10)
                                      +'       left join customer(nolock)      '+chr(13)+chr(10)
                                      +'              on customer.cusname=#wareorderitemSku.costcusname '+chr(13)+chr(10)

                        );

               datatmp.qryTmp3.first;
               while not datatmp.qryTmp3.eof do
               begin

                  //strlocationbillno:=copy(DateToStr(Date),3,2)+datatmp.qryTmp3.fieldbyname('custype').AsString+'-'+pad(dataTmp.qryTmp.fieldbyname('maxno').asstring,6, '0', psLeft);
                  opensql(dataTmp.qryTmp,'select datenow=getDate() ');
                  strDate:=copy(dataTmp.qryTmp.FieldByName('datenow').AsString,1,4);
                  opensql(dataTmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,8))) '
                                        +'  from genjobno where substring(Jobno,5,2)="WO"' );
                  strorderid:='OJ'+strDate+pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft);//+iif(_DB_BillNO='','','('+_DB_BillNO+')');

                  strCreateID:=genJobno('WO',strorderid);
                  //临时表
                  OpenSql(qrytmp3,'select * from #wareorderitemSku  '
                                +' where shipcusname="'+datatmp.qryTmp3.fieldbyname('shipcusname').AsString+'"'
                                );

                  qrytmp3.First;
                  while not qrytmp3.Eof do
                  begin
                     execsql(qrytmp2,'insert into #wareoutskuitem  '+chr(13)+chr(10)
                                       +'select sno=0,                                          '+chr(13)+chr(10)
                                       +'       jobno="'+strCreateID+'",                     '+chr(13)+chr(10)
                                       +'       jobnoin="1",           '+chr(13)+chr(10)
                                       +'       snoin=1,                '+chr(13)+chr(10)
                                       +'       ldsnoinf=0,                                                        '+chr(13)+chr(10)
                                       +'       userid="'+qrytmp3.fieldbyname('userid').AsString+'",              '+chr(13)+chr(10)
                                       +'       username="'+qrytmp3.fieldbyname('username').AsString+'",          '+chr(13)+chr(10)
                                       +'       pieceuom="",          '+chr(13)+chr(10)
                                       +'       weightuom="",        '+chr(13)+chr(10)
                                       +'       quantityuom="",    '+chr(13)+chr(10)
                                       +'       piece="'+qrytmp3.fieldbyname('piece').AsString+'",            '+chr(13)+chr(10)
                                       +'       netweight=0,            '+chr(13)+chr(10)
                                       +'       quantity="'+qrytmp3.fieldbyname('quantity').AsString+'",      '+chr(13)+chr(10)
                                       +'       skuid="1",                '+chr(13)+chr(10)
                                       +'       classid="1",                '+chr(13)+chr(10)
                                       +'       skuname="'+qrytmp3.fieldbyname('skuname').AsString+'",            '+chr(13)+chr(10)
                                       +'       qualityname="正品",                                              '+chr(13)+chr(10)
                                       +'       shippercusid="'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'",    '+chr(13)+chr(10)
                                       +'       shippercusname="'+qrytmp3.fieldbyname('costcusname').AsString+'",'+chr(13)+chr(10)
                                       +'       mainorder="",       '+chr(13)+chr(10)
                                       +'       shipcusname="'+datatmp.qryTmp3.fieldbyname('shipcusname').AsString+'",       '+chr(13)+chr(10)
                                       +'       cusid="'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'",           '+chr(13)+chr(10)
                                       +'       cusname="'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'",       '+chr(13)+chr(10)
                                       +'       costcusid="'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'",       '+chr(13)+chr(10)
                                       +'       costcusname="'+qrytmp3.fieldbyname('costcusname').AsString+'" ,  '+chr(13)+chr(10)
                                       +'       remark="'+qrytmp3.fieldbyname('remark').AsString+'",           '+chr(13)+chr(10)
                                       +'       ManufactureDate="'+qryTmp3.fieldbyname('ManufactureDate').AsString+'" ,     '+chr(13)+chr(10)
                                       +'       lotcode="'+qrytmp3.fieldbyname('lotcode').AsString+'" ,     '+chr(13)+chr(10)
                                       +'       skumodel="'+qryTmp3.fieldbyname('skumodel').AsString+'",         '+chr(13)+chr(10)
                                       +'       skuspec="'+qryTmp3.fieldbyname('skuspec').AsString+'"  '+chr(13)+chr(10)
                                       +'declare @i smallint                                      '+chr(13)+chr(10)
                                       +' select @i=0                                             '+chr(13)+chr(10)
                                       +' update #wareoutskuitem                                      '+chr(13)+chr(10)
                                       +'    set sno=@i,@i=@i+1,skuid=case when isnull(sku.skuid,"")="" then #wareoutskuitem.skuname else sku.skuid end  '+chr(13)+chr(10)
                                       +'   from sku(nolock)                                     '+chr(13)+chr(10)
                                      +'   where sku.skuname=#wareoutskuitem.skuname '+chr(13)+chr(10)
                                      +'     and sku.skumodel=#wareoutskuitem.skumodel '+chr(13)+chr(10)
                                      +'     and sku.skuspec=#wareoutskuitem.skuspec '+chr(13)+chr(10)
                                                );
                     qrytmp3.Next;
                  end;


                  ExecSql(qryTmp4,' insert into wareorder                                                        '+chr(13)+chr(10)
                                +'       ( jobno,operationtype,userid,username,                 '+chr(13)+chr(10)
                                +'        createname,createdate,costcusid,costcusname,                            '+chr(13)+chr(10)
                                +'        cusid,cusname,shippercusid,shippercusname,                              '+chr(13)+chr(10)
                                +'        warerentcounttype,orderdate,orderid,shipcusname,                    '+chr(13)+chr(10)
                                +'        LotTracked,isbond,COUNTRENT,SKUCOSTCLASSCD,    '+chr(13)+chr(10)
                                +'        mainorder,remark,DictateType                  '+chr(13)+chr(10)
                                +'        )                                                                       '+chr(13)+chr(10)
                                +' select "'+strCreateID+'","-1","'+_userid+'","'+_username+'",       '+chr(13)+chr(10)
                                +'        "'+strname+'","'+datetostr(GetServerDate)+'",                        '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'", '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'",  '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('cusid').AsString+'","'+datatmp.qryTmp3.fieldbyname('costcusname').AsString+'",  '+chr(13)+chr(10)
                                +'        "IR", "'+strtaskdate+'","'+strorderid+'",                    '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('shipcusname').AsString+'",              '+chr(13)+chr(10)
                                +'        "F", "F", "T", "COMMON",null,                            '+chr(13)+chr(10)
                                +'        "'+datatmp.qryTmp3.fieldbyname('remark').AsString+'","出仓指令"   '+chr(13)+chr(10)     
                                +' ');
            //插入locationoutdetail

                  ExecSql(qryTmp4,'declare @i smallint                                      '+chr(13)+chr(10)
                                +' select @i=0                                             '+chr(13)+chr(10)
                                +' update #wareoutskuitem                                      '+chr(13)+chr(10)
                                +'    set sno=@i,@i=@i+1                                   '+chr(13)+chr(10)

                                +'insert into wareorderorisku                                          '+chr(13)+chr(10)
                                +'       (jobno,sno,jobnoin,snoin,jobnoinf,snoinf,ldsnoinf,warerentcounttype,'+chr(13)+chr(10)
                                +'        mainorder,shipcusname,operationtype,userid,username,           '+chr(13)+chr(10)
                                +'        pieceuom,weightuom,quantityuom,piece,             '+chr(13)+chr(10)
                                +'        netweight,quantity,skuid,skuname,                '+chr(13)+chr(10)
                                +'        qualityname,shippercusid,shippercusname,              '+chr(13)+chr(10)
                                +'        cusid,cusname,costcusid,costcusname, ManufactureDate,               '+chr(13)+chr(10)
                                +'        lotcode  )  '+chr(13)+chr(10)
                                +' select jobno=#outskuitem.jobno,sno=#outskuitem.sno,'+chr(13)+chr(10)
                                +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,  '+chr(13)+chr(10)
                                +'        jobnoin=#outskuitem.jobnoin,snoin=#outskuitem.snoin,-1,"IR", '+chr(13)+chr(10)
                                +'        mainorder,shipcusname,operationtype=-1,              '+chr(13)+chr(10)
                                +'        userid,username,pieceuom,weightuom,                          '+chr(13)+chr(10)
                                +'        quantityuom,piece,             '+chr(13)+chr(10)
                                +'        netweight,quantity,skuid,skuname,                '+chr(13)+chr(10)
                                +'        "正品",shippercusid,               '+chr(13)+chr(10)
                                +'        shippercusname,              '+chr(13)+chr(10)
                                +'        cusid,cusname,     '+chr(13)+chr(10)
                                +'        costcusid,costcusname,ManufactureDate , '+chr(13)+chr(10)
                                +'        lotcode  '+chr(13)+chr(10)
                                +'  from  #wareoutskuitem #outskuitem                    '+chr(13)+chr(10)
                                +'  where isnull(skuid,"")<>""'
                      );
                  datatmp.qryTmp3.next;
               end;


               _ADOConnection.Commit;
               kMessageDlg(_strsucceed, mtInformation, [mbOK], 0);

            except
               try
                 _ADOConnection.rollback;
               except
               end;
               raise;
               kMessageDlg(_strdefeated, mtInformation, [mbOK], 0);

               Exit;
            end;
         end;

      end;
      execSql(datatmp.qryTmp,'update RecvSms  '
                   +'   set isadd="T" '
                   +' where SNO in ('+strjobnoupd+')');
   end;


   if faltCount<>0 then strmsg:=IntToStr(faltCount)+'/'+IntToStr(j)+'已生成出仓指令信息';
   if strmsg<>'' then
      KMessageDlg(strmsg,mtInformation,[mbOK],0)
      //IIF(_Language='CAPTIONC',''笔资料无拣货或已经审核的数据未审核！','笔任务未完成不能审核！')
   else
      Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);

end;

procedure TfrmDxptcs.edtSmsContentExit(Sender: TObject);
begin
  Getsql(' and SmsContent like "%'+edtSmsContent.Text+'%"   ');
end;

procedure TfrmDxptcs.cs1Click(Sender: TObject);
begin
   ExecSql(qryDxptcs,'insert into RecvSms  '+chr(13)+chr(10)
                       +'       (smsindex,smstime,sendnumber,receiver,smscontent,  '+chr(13)+chr(10)
                       +'        isdel,isinvalid,isprint,isreply,cusname)        '+chr(13)+chr(10)
                       +'values (                                                  '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('smsindex').AsString+'"   , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('smstime').AsString+'"    , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('phonenumber').AsString+'" , '+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('Smsoperator').AsString+'"   , '+chr(13)+chr(10)
//                       +'        "'+qryTmp.FieldByName('smscontent').AsString+'" , '+chr(13)+chr(10)
                       +'        "'+StringReplace(StringReplace(qryTmp.FieldByName('smscontent').AsString,'"','”',[rfReplaceAll]),'''','’',[rfReplaceAll])+'"   , '+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "F"  ,'+chr(13)+chr(10)
                       +'        "'+qryTmp.FieldByName('name').AsString+'")       '+chr(13)+chr(10)
                    );
      ExecSql(qryTmp1,'update SmsRecordTable             '+chr(13)+chr(10)
                    +'   set isrecvsms="T"               '+chr(13)+chr(10)
                    +' where smsindex='+(qryTmp.FieldByName('smsindex').AsString)+'');
end;

procedure TfrmDxptcs.btnwzhClick(Sender: TObject);
begin
   Getsql(' and isnull(iscomplete,"F")="F" ');
end;

procedure TfrmDxptcs.btnyzhClick(Sender: TObject);
begin
   Getsql(' and isnull(iscomplete,"F")="T" ');
end;

procedure TfrmDxptcs.edtskunameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetSkuSelect('','','A');
   if qrySelect.FieldByName('skuid').AsString<>'' then
   begin
      edtskuname.Text:=qrySelect.FieldByName('skuname').AsString;
      edtskuname.TextField:=qrySelect.FieldByName('classid').AsString;
      edtskumodel.Text:=qrySelect.FieldByName('skumodel').AsString;
      edtskuspec.Text:=qrySelect.FieldByName('skuspec').AsString;
      strpiecepro:=qrySelect.FieldByName('piecepro').AsString;
   end;
   FreeAndNil(qrySelect);

end;

procedure TfrmDxptcs.edtskunameExit(Sender: TObject);
begin
  if edtskuname.Text='' then edtskuname.TextField:='';
end;

procedure TfrmDxptcs.edtquantityValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (strpiecepro='' ) then exit
   else edtpiece.Text:=floattostr(strtofloat(edtquantity.text)/strtofloat(strpiecepro));
end;

procedure TfrmDxptcs.edtpieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (strpiecepro='' ) then exit
   else edtquantity.Text:=floattostr(strtofloat(edtpiece.text)*strtofloat(strpiecepro));
end;

procedure TfrmDxptcs.edtskunameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
{   if edtskuname.Text='' then
   begin
      edtskuname.TextField:='';
      strpiecepro:='';
   end else
   if edtskuname.TextField='' then
   begin
      qrySelect:=pGetSkuSelect('','','D','F',edtskuname.Text);
      if qrySelect.FieldByName('skuid').AsString<>'NO' then
      begin
         edtskuname.Text:=qrySelect.FieldByName('skuname').AsString;
         edtskuname.TextField:=qrySelect.FieldByName('classid').AsString;
         edtskumodel.Text:=qrySelect.FieldByName('skumodel').AsString;
         edtskuspec.Text:=qrySelect.FieldByName('skuspec').AsString;
         strpiecepro:=qrySelect.FieldByName('piecepro').AsString;
      end else
      begin
         edtskuname.Text:='';
         edtskuname.TextField:='';
         edtskumodel.Text:='';
         edtskuspec.Text:='';
         strpiecepro:='';
      end;
      FreeAndNil(qrySelect);
   end;   }

end;

procedure TfrmDxptcs.btnsjxClick(Sender: TObject);
begin
   Getsql(' and isnull(status,"")="接收" ');
end;

procedure TfrmDxptcs.mitcancelClick(Sender: TObject);
begin
   execSql(datatmp.qryTmp,'update RecvSms  '
                   +'   set isadd="" '
                   +' where SNO="'+qryDxptcs.fieldbyname('sno').AsString+'"  '
                   );
end;

end.

