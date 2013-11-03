unit WorkLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  TfrmWorkLog = class(TForm)
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdsdate: TdxDateEdit;
    dtdedate: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    GMSStickyLabel9: TGMSStickyLabel;
    edtcusname: TdxButtonEdit;
    qryTmp: TKADOQuery;
    lblPrint: TLabelEffect;
    cmbCZType: TKinPickEdit;
    GMSStickyLabel14: TGMSStickyLabel;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    blnSelect:Boolean;
    strYear,strMonth,strDay:Word;
  public
    { Public declarations }

  end;

procedure WorkWorkLog;

var
   frmWorkLog: TfrmWorkLog;

implementation
{$R *.dfm}

uses kindlg, GetDllPub, libuserPub,linprint;

procedure WorkWorkLog;
begin
   if frmWorkLog <> nil then
   with frmWorkLog do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmWorkLog:=TfrmWorkLog.Create(Application);
   with frmWorkLog do
   begin
      DecodeDate(Date,strYear,strMonth,strDay);
      dtdsdate.Date:=strtodate(inttostr(strYear)+'.'+inttostr(strMonth)+'.'+'01');
      dtdedate.Date:=Date;

      ShowModal;
      Free;
   end;
end;

procedure TfrmWorkLog.btnPreviewClick(Sender: TObject);
var
   strFilter:string;
   lstPara:TStringList;
   blnprint:boolean;
begin
   //打印
   strfilter:='';

   if cmbCZType.Text='' then
   begin
      KMessageDlg('操作类型不能为空！',mtWarning,[mbOK],0);
      cmbCZType.SetFocus;
      Exit;
   end;
   if edtcusname.Text<>'' then       //客户名称
      strFilter:=strFilter+' and item.costcusname="'+edtcusname.Text+'"';
   if dtdsdate.Date<>0 then   //起始日期
      strFilter:=strFilter+ ' and convert(char(10),item.operationdate,102)>="'+dtdsdate.Text+'"';
   if dtdedate.Date<>0 then   //结束日期
      strFilter:=strFilter+ ' and convert(char(10),item.operationdate,102)<="'+dtdedate.Text+'"';


   if TKBitBtn(Sender)=btnPreview then
      blnprint:=true
   else
      blnprint:=False;
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara:=TstringList.Create;
   GenInformations(lstPara);
   if cmbCZType.Text='进仓操作' then
   begin
      OpenSql(qryTmp,' SELECT item.costcusname,item.LOCATIONBILLNO,item.TASKDATE,item.TASKCHECKNAME,                                    '+chr(13)+chr(10)
                    +'        item.OPERATIONNAME,item.CHECKNAME,item.CREATENAME,                                                       '+chr(13)+chr(10)
                    +'        item.TASKCHECKDATE,   '+chr(13)+chr(10)
                    +'        item.OPERATIONDATE,item.CHECKDATE             '+chr(13)+chr(10)
                    +'   FROM locationin item (nolock)                                                                                              '+chr(13)+chr(10)
                    +'  where 1=1                    '+chr(13)+chr(10)
                    +strfilter
             );
   end else
   begin
      OpenSql(qryTmp,' SELECT item.costcusname,item.LOCATIONBILLNO,item.TASKDATE,item.TASKCHECKNAME,                                    '+chr(13)+chr(10)
                    +'        item.LOACCCHECKNAME,item.OPERATIONNAME,item.CHECKNAME,item.CREATENAME,                                                       '+chr(13)+chr(10)
                    +'        item.TASKCHECKDATE,item.LOACCCHECKDATE,   '+chr(13)+chr(10)
                    +'        item.OPERATIONDATE,item.CHECKDATE             '+chr(13)+chr(10)
                    +'   FROM locationout item (nolock)                                                                                              '+chr(13)+chr(10)
                    +'  where 1=1                    '+chr(13)+chr(10)
                    +strfilter
             );
   end;
   lstPara.Add('zbrq='+DateToStr(Date));
   lstPara.Add('zbr='+_loginname);
   lstPara.Add('dateFrom='+dtdsdate.Text);        //承运时间
   lstPara.Add('dateTo='+dtdedate.Text);
   Worklinprint('100077','old','操作跟踪记录表',qryTmp,nil,nil,lstpara);
end;

procedure TfrmWorkLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmWorkLog.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmWorkLog.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
   cmbCZType.Text:='出仓操作';
end;

procedure TfrmWorkLog.FormDestroy(Sender: TObject);
begin
   frmWorkLog:=nil;
end;

procedure TfrmWorkLog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrmWorkLog.edtcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtcusname.TextField:=qrySelect.FieldByName('Cusid').asstring;
      edtcusname.Text:=qrySelect.FieldByName('Cusname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;


end.
