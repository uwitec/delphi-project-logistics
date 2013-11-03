unit Dxhf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, KGroupBox,
  DB, DBTables, DBClient, KDataSetProvider, DbButtons, ExtCtrls, dxExEdtr,
  dxEdLib, dxEditor, GMSLabel, KinPickEdit, Menus, ADODB, ComCtrls, ToolWin;

type
  TfrmDxhf = class(TForm)
    ppmedit: TPopupMenu;
    N1: TMenuItem;
    mitdy: TMenuItem;
    qryDxhf: TKADOQuery;
    dtsDxhf: TDataSource;
    dbsLogis1: TKADODatabase;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    edttel: TdxEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    qrytmp: TKADOQuery;
    KGroupBox5: TKGroupBox;
    Panel2: TPanel;
    KGroupBox3: TKGroupBox;
    lbltel: TGMSStickyLabel;
    edtremarks: TdxMemo;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    ckbPhoneNumberType: TKinPickEdit;
    ckbSendLevel: TKinPickEdit;
    ckbmodel: TKinPickEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    Btnreply: TKBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnreplyClick(Sender: TObject);
    procedure edttelKeyPress(Sender: TObject; var Key: Char);
    procedure ckbmodelChange(Sender: TObject);
  private
    { Private declarations }
    strAccountID:string;
    strsql,sqlfilter,strsno: string;
  public
    { Public declarations }
  end;

procedure WorkDxhf(Psno:string);

var
  frmDxhf: TfrmDxhf;

implementation

{$R *.dfm}

uses  libproc,libUser,libuserPub,Datas,kindlg, main,GetUserRight,GetDllPub,
      dxGridOut,linprint,libBb,bbShow ,ss,datasTmp,dxptcs;

procedure WorkDxhf(Psno:string);
var
  strSql,strTask:string;
  i:integer;
  lstList:TStringList;
begin
   if frmDxhf<>nil then
   with frmDxhf do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      dbsLogis1.Connected;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmDxhf, frmDxhf);
   with frmDxhf do
   begin
      strsno:='';
      strsno:=Psno;
      ckbSendLevel.ItemIndex:=0;
      //初始化短信模版
      ckbmodel.Items.Clear;
      ckbmodel.itemfields.clear;
      OpenSql(dataTmp.qryTmp,'Select Modelcd,Modelname from SmsModel (nolock)');
      while (not dataTmp.qryTmp.Eof) do
      begin
         ckbmodel.items.add(dataTmp.qryTmp.Fieldbyname('Modelname').asstring);
         ckbmodel.itemfields.add(dataTmp.qryTmp.Fieldbyname('Modelcd').asstring);
         dataTmp.qryTmp.Next;
      end;
      dataTmp.qryTmp.Close;

      OpenSql(qrytmp,' select smsindex,smstime,sendnumber,receiver,smscontent,cusname                  '+chr(13)+chr(10)
                    +'   from RecvSms            '+chr(13)+chr(10)
                    +'  where sno="'+strsno+'"   '+chr(13)+chr(10)
                    );
      edttel.Text:=qrytmp.fieldbyname('sendnumber').AsString;
   end;
   frmDxhf.ShowModal;
end;

procedure TfrmDxhf.FormCreate(Sender: TObject);
begin
   Width:=522;
   Height:=464;
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox3);
   SetGroupbox(KGroupBox5);      
   qrytmp.Connection:=_ADOConnection;
   qryDxhf.Connection:=frmDxptcs.dbsLogis1;
end;

procedure TfrmDxhf.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  frmDxhf:=nil;
end;

procedure TfrmDxhf.btnCloseClick(Sender: TObject);
begin
   frmDxhf.Close;
end;

procedure TfrmDxhf.btnOkClick(Sender: TObject);
var
   i:integer;
begin
   frmDxhf.Close;
end;

procedure TfrmDxhf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmDxhf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrmDxhf.BtnreplyClick(Sender: TObject);
var
   strsql   :string;
begin
   //插入到ACCESS 发送信息表   SendingSmsTable
  if trim(edttel.Text)='' then
  begin
     kMessageDlg('手机号码不能为空，请确认！', mtWarning, [mbOK], 0);
     edttel.SetFocus;
     Exit
  end;
  if trim(ckbPhoneNumberType.Text)='' then
  begin
     kMessageDlg('回复信息不能为空，请确认！', mtWarning, [mbOK], 0);
     ckbPhoneNumberType.SetFocus;
     Exit;
  end;
  if trim(ckbSendLevel.Text)='' then
  begin
     kMessageDlg('优先级不能为空，请确认！', mtWarning, [mbOK], 0);
     ckbSendLevel.SetFocus;
     Exit;
  end;
  if trim(edtremarks.Text)='' then
  begin
     kMessageDlg('回复信息不能为空，请确认！', mtWarning, [mbOK], 0);
     edtremarks.SetFocus;
     Exit;
  end;
  ExecSql(qryDxhf,'insert into SendingSmsTable  '+chr(13)+chr(10)
                  +'       (SmsUser,PhoneNumber,SmsContent,UserDefineNo,NewFlag,  '+chr(13)+chr(10)
                  +'        SendLevel,SmsTime,PhoneNumberType,PutType)        '+chr(13)+chr(10)
                  +'values (                                                  '+chr(13)+chr(10)
                  +'        "'+_loginid+'"   , '+chr(13)+chr(10)
                  +'        "'+edttel.Text+'"    , '+chr(13)+chr(10)
                  +'        "'+trim(edtremarks.Text)+'" , '+chr(13)+chr(10)
                  +'        "0"   , '+chr(13)+chr(10)
                  +'        "1"   , '+chr(13)+chr(10)
                  +'        "'+ckbSendLevel.TextField+'"  ,'+chr(13)+chr(10)
                  +'        "'+datetostr(GetServerDate)+'"  ,'+chr(13)+chr(10)
                  +'        "'+ckbPhoneNumberType.TextField+'"  ,'+chr(13)+chr(10)
                  +'        "待发"  )'+chr(13)+chr(10)
                  );
  
   ExecSql(qryTmp,'update RecvSms                 '+chr(13)+chr(10)
                 +'    set isreply="T"            '+chr(13)+chr(10)
                 +'  where sno="'+strsno+'"    ');
   frmDxhf.Close;
end;

procedure TfrmDxhf.edttelKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9']) then
   begin
      key:=#0;
      exit;
   end
end;

procedure TfrmDxhf.ckbmodelChange(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select * from SmsModel where Modelcd="'+ckbmodel.TextField+'"');
   edtremarks.Text:=dataTmp.qryTmp.fieldbyname('MScontent').AsString;
end;

end.

