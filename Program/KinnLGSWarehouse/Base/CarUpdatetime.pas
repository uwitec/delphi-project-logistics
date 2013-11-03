unit CarUpdatetime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser, GMSLabel, KinPickEdit, dxDBELib;


type
  TfrmCarUpdatetime = class(TForm)
    btnOk: TKBitBtn;
    GMSStickyLabel11: TGMSStickyLabel;
    KBitBtn1: TKBitBtn;
    dtddatetime: TdxDateEdit;
    timdtddatetime: TdxTimeEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    strtype:string;
    strjobno,strsno:string;
    blnResult:boolean;
  public
    { Public declarations }
  end;

function WorkCarUpdatetime(pstrjobno:string;pstrsno:string;PType:string):string;

var
  frmCarUpdatetime: TfrmCarUpdatetime;

implementation

{$R *.dfm}

uses kindlg,datas,libproc,main, datasTmp,libuserPub;


function WorkCarUpdatetime(pstrjobno:string;pstrsno:string;PType:string):string;
begin
   frmCarUpdatetime:=TfrmCarUpdatetime.Create(Application);
   with frmCarUpdatetime do
   begin
     strtype:=PType;
     strjobno:=pstrjobno;
     strsno:=pstrsno;
     if strtype='ID' then
     begin
        frmCarUpdatetime.Caption:='入库时间';
        GMSStickyLabel11.Caption:='入库时间';
     end;
     if strtype='OD' then
     begin
        frmCarUpdatetime.Caption:='离开时间';
        GMSStickyLabel11.Caption:='离开时间';
     end;
     dtddatetime.Date:=GetServerDate;
     timdtddatetime.Time:=GetServerDate;
     ShowModal;
     Free;
   end;
end;


procedure TfrmCarUpdatetime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmCarUpdatetime.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TfrmCarUpdatetime.FormDestroy(Sender: TObject);
begin
   frmCarUpdatetime:=nil;
end;

procedure TfrmCarUpdatetime.btnOkClick(Sender: TObject);
var
   strdate:string;
begin
   if Trim(dtddatetime.Text)='' then
   begin
      KmessageDlg('时间不能为空,请输入！',mtInformation,[mbOK],0);
      dtddatetime.SetFocus;
      Exit;
   end;
   strdate:=dtddatetime.Text+' '+timetostr(timdtddatetime.time);
   if strtype='ID' then
   begin
      if Kmessagedlg('是否要进行该操作？',mtWarning,[mbYes,mbNo],0)=mrNo then
      begin
         ExecSql(dataTmp.qryTmp,'delete locationinoutcon       '+chr(13)+chr(10)
                               +' where jobno="'+strjobno+'"   '+chr(13)+chr(10)
                               +'   and sno="'+strsno+'"   '+chr(13)+chr(10)
                );
         exit;
      end;
      ExecSql(dataTmp.qryTmp,'update locationinoutcon                                           '+chr(13)+chr(10)
                            +'   set incomedate="'+strdate+'"                                 '+chr(13)+chr(10)
                            +' where 1=1                                                       '+chr(13)+chr(10)
                            +'   and jobno="'+strjobno+'"   '+chr(13)+chr(10)
                            +'   and sno="'+strsno+'"   '+chr(13)+chr(10)
             );
   end else
   if strtype='OD' then
   begin
      if Kmessagedlg('是否要进行该操作？',mtWarning,[mbYes,mbNo],0)=mrNo then exit;
      ExecSql(dataTmp.qryTmp,'update locationinoutcon                                           '+chr(13)+chr(10)
                            +'   set loadcomdate="'+strdate+'"                                                '+chr(13)+chr(10)
                            +' where 1=1                                                       '+chr(13)+chr(10)
                            +'   and jobno="'+strjobno+'"   '+chr(13)+chr(10)
                            +'   and sno="'+strsno+'"   '+chr(13)+chr(10)
             );
   end;  

   frmCarUpdatetime.close;
end;

procedure TfrmCarUpdatetime.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
end;

procedure TfrmCarUpdatetime.KBitBtn1Click(Sender: TObject);
begin
   if strtype='ID' then
   begin
      if Kmessagedlg('是否要进行该操作？',mtWarning,[mbYes,mbNo],0)=mrNo then
      begin
         ExecSql(dataTmp.qryTmp,'delete locationinoutcon       '+chr(13)+chr(10)
                               +' where jobno="'+strjobno+'"   '+chr(13)+chr(10)
                               +'   and sno="'+strsno+'"   '+chr(13)+chr(10)
                );
         exit;
      end;
   end;
   frmCarUpdatetime.close;
end;

end.
