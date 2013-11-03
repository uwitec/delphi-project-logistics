unit updatetime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser, GMSLabel, KinPickEdit;


type
  Tfrmupdatetime = class(TForm)
    btnOk: TKBitBtn;
    cmbtype: TKinPickEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    KBitBtn1: TKBitBtn;
    dtddatetime: TdxDateEdit;
    GMSStickyLabel1: TGMSStickyLabel;
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
    strdatetime:string;
    blnResult:boolean;
  public
    { Public declarations }
  end;

function Workupdatetime(var Pstrdatetime:string;var PType:string):string;

var
  frmupdatetime: Tfrmupdatetime;

implementation

{$R *.dfm}

uses kindlg,datas,libproc,main, datasTmp,libuserPub;


function Workupdatetime(var Pstrdatetime:string;var PType:string):string;
begin
   frmupdatetime:=Tfrmupdatetime.Create(Application);
   with frmupdatetime do
   begin
     ShowModal;
     Pstrdatetime:=strdatetime;
     PType:=strtype;
//     Result:=blnResult;
     Free;
   end;
//  frmWareOrderType.Free;
end;


procedure Tfrmupdatetime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmupdatetime.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
   end;
end;

procedure Tfrmupdatetime.FormDestroy(Sender: TObject);
begin
   frmupdatetime:=nil;
end;

procedure Tfrmupdatetime.btnOkClick(Sender: TObject);
begin
   if Trim(dtddatetime.Text)='' then
   begin
      KmessageDlg('生产日期不能为空,请输入！',mtInformation,[mbOK],0);//'选择不能为空,请选择！'
      dtddatetime.SetFocus;
      Exit;
   end;
   if Trim(cmbtype.Text)='' then
   begin
      KmessageDlg('生产日期格式不能为空,请选择！',mtInformation,[mbOK],0);//'选择不能为空,请选择！'
      cmbtype.SetFocus;
      Exit;
   end;
   strtype:=cmbtype.TextField;
   strdatetime:=dtddatetime.Text;
   blnResult:=true;
   frmupdatetime.close;
end;

procedure Tfrmupdatetime.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
end;

procedure Tfrmupdatetime.KBitBtn1Click(Sender: TObject);
begin
   frmupdatetime.close;
   strtype:='';
   strdatetime:='';
   blnResult:=false;
end;

end.
