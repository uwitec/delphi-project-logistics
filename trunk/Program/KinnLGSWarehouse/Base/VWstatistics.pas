unit VWstatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls,KDataSetProvider;

type
  TfrmVWstatistics = class(TForm)
    lblPrint: TLabelEffect;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    GMSStickyLabel3: TGMSStickyLabel;
    edtIUser: TdxButtonEdit;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIUserButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtIUserExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    strSysCus:string; //项目型客户个性化配置

  end;

procedure WorkVWstatistics;

var
   frmVWstatistics: TfrmVWstatistics;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub,GetDllPub;

procedure WorkVWstatistics;
begin
   if frmVWstatistics <> nil then
   with frmVWstatistics do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmVWstatistics:=TfrmVWstatistics.Create(Application);
   with frmVWstatistics do
   begin
      dtdReceDateT.Date:=Date;
      if _StrSysCus='SZWY' then
      begin
         frmVWstatistics.Caption:='出入库管控表';
         lblPrint.Caption:='出入库管控表';
         dtdReceDateF.Date:=Date;
         edtIUser.Text:=_USERNAME;
         edtIUser.TextField:=_Userid;
      end else
      begin
         dtdReceDateF.Date:=Date-30;
      end;
      showmodal;
   end;
end;

procedure TfrmVWstatistics.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   blnprint:boolean;
   strsql:string;
begin
   if (dtdReceDateF.Date=0) or (dtdReceDateT.Date=0) then
   begin
      kMessageDlg('请输入开始日期和截至日期！', mtInformation, [mbOK], 0);
      Exit;
   end;
   lstPara:=TStringList.create;
   GenInformations(lstPara);
   lstPara.Add('ZBR='+_LoginName);
   lstPara.Add('ZBRQ='+DateTimeToStr(GetServerDate));
   lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
   lstPara.Add('dateT='+dtdReceDateT.Text);

   if _StrSysCus='SZWY' then
   begin
      strsql:=' ksp_Control @datafrom="'+dtdReceDateF.Text+'",'
             +'             @userid="'+trim(edtIUser.TextField)+'",'
             +'             @datato="'+dtdReceDateT.Text+'" ';
      OpenSql(dataTmp.qryTmp,strsql);
      WorkFillbb('900335',lstPara,not blnPrint,True,1,dataTmp.qryTmp)
   end else
   begin
      strsql:=' ksp_VWstatistics @datafrom="'+dtdReceDateF.Text+'",'
             +'                  @userid="'+trim(edtIUser.TextField)+'",'
             +'                  @datato="'+dtdReceDateT.Text+'" ';
      OpenSql(dataTmp.qryTmp,strsql);
      WorkFillbb('900018',lstPara,not blnPrint,True,1,dataTmp.qryTmp)
   end;
end;

procedure TfrmVWstatistics.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmVWstatistics.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmVWstatistics.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure TfrmVWstatistics.FormDestroy(Sender: TObject);
begin
   frmVWstatistics:=nil;
end;

procedure TfrmVWstatistics.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrmVWstatistics.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','F');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtIUser.TextField  :=qrySelect.FieldByName('userid').asstring;
      edtIUser.Text       :=qrySelect.FieldByName('username').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmVWstatistics.edtIUserExit(Sender: TObject);
begin
   if edtIUser.Text='' then edtIUser.TextField:='';
end;

end.
