unit CostUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls,Db,DBTables,GMSLabel,KBitBtn,inifiles,
  dxCntner,dxExEdtr, dxEdLib, dxEditor, KinPickEdit, KGroupBox,
  dxPageControl,KDataSetProvider;

type
  TfrmCostUpdate = class(TForm)
    btnCancel: TKBitBtn;
    btnOk: TKBitBtn;
    GMSStickyLabel8: TGMSStickyLabel;
    edtCostCus: TdxButtonEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    DelphiIni:TIniFile;
  public
    { Public declarations }
  end;

var
  frmCostUpdate: TfrmCostUpdate;

procedure WorkCostUpdate;

implementation

{$R *.DFM}

uses main,libproc,LibUserpub,kindlg, datasTmp,GetDllPub;

procedure WorkCostUpdate;
begin
   if frmCostUpdate <> nil then
   with frmCostUpdate do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;

   end;

   frmCostUpdate:=TfrmCostUpdate.Create(Application);
   with frmCostUpdate do
   begin

   end;
//   frmCostUpdate.ShowModal;
   frmCostUpdate.Show;
//   frmCostUpdate.Free;
end;

procedure TfrmCostUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmCostUpdate.FormDestroy(Sender: TObject);
begin
   frmCostUpdate:=nil;
end;

procedure TfrmCostUpdate.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCostUpdate.FormCreate(Sender: TObject);
begin
   SetFormStyle(Self);
end;

procedure TfrmCostUpdate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         ReturnNext(Self);
      Vk_Escape:
      begin
         Key:=0;
         btnCancelClick(nil);
      end;
   end;
end;

procedure TfrmCostUpdate.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCostCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCostCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCostUpdate.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure TfrmCostUpdate.btnOkClick(Sender: TObject);
begin
   if (dtdReceDateF.Date=0) then
   begin
      kMessageDlg('请选择开始日期！', mtInformation, [mbOK], 0); //nomsg
      Exit;
   end;
   if (dtdReceDateT.Date=0) then
   begin
      kMessageDlg('请选择结束日期！', mtInformation, [mbOK], 0); //nomsg
      Exit;
   end;

   ExecSql(datatmp.qryTmp,'   update costitem set snosku=(select top 1 sno  '+chr(13)+chr(10)
                         +'                                from locationinitem (nolock)    '+chr(13)+chr(10)
                         +'                               where locationinitem.jobno=costitem.jobno   '+chr(13)+chr(10)
                         +'                               ),           '+chr(13)+chr(10)
                         +'                       skuid=(select top 1 skuid  '+chr(13)+chr(10)
                         +'                                from locationinitem (nolock)    '+chr(13)+chr(10)
                         +'                               where locationinitem.jobno=costitem.jobno   '+chr(13)+chr(10)
                         +'                               )           '+chr(13)+chr(10)
                         +'    where jobno like "KINNLI%"           '+chr(13)+chr(10)
                         +'      and (snosku=-10 or snosku=-11)           '+chr(13)+chr(10)
//                         +'      and notauto="T"                  '+chr(13)+chr(10)
                         +'      and userid like "'+_userid+'%"                 '+chr(13)+chr(10)
                         +'      and costcusid like "'+edtCostCus.TextField+'%"                 '+chr(13)+chr(10)
                         +'      and convert(char(10),costdate,102)>="'+dtdReceDateF.Text+'"       '+chr(13)+chr(10)
                         +'      and convert(char(10),costdate,102)<="'+dtdReceDateT.Text+'"       '+chr(13)+chr(10)
                         +'             '+chr(13)+chr(10)
                         +'   update costitem set snosku=(select top 1 sno  '+chr(13)+chr(10)
                         +'                                from locationoutitem (nolock)    '+chr(13)+chr(10)
                         +'                               where locationoutitem.jobno=costitem.jobno   '+chr(13)+chr(10)
                         +'                               ),            '+chr(13)+chr(10)
                         +'                       skuid=(select top 1 skuid  '+chr(13)+chr(10)
                         +'                                from locationoutitem (nolock)    '+chr(13)+chr(10)
                         +'                               where locationoutitem.jobno=costitem.jobno   '+chr(13)+chr(10)
                         +'                               )           '+chr(13)+chr(10)
                         +'    where jobno like "KINNLO%"           '+chr(13)+chr(10)
                         +'      and (snosku=-10 or snosku=-11)           '+chr(13)+chr(10)
//                         +'      and notauto="T"                  '+chr(13)+chr(10)
                         +'      and userid like "'+_userid+'%"                 '+chr(13)+chr(10)
                         +'      and costcusid like "'+edtCostCus.TextField+'%"                 '+chr(13)+chr(10)
                         +'      and convert(char(10),costdate,102)>="'+dtdReceDateF.Text+'"       '+chr(13)+chr(10)
                         +'      and convert(char(10),costdate,102)<="'+dtdReceDateT.Text+'"       '+chr(13)+chr(10)
                         +'     ');
   kMessageDlg(_strsucceed, mtInformation, [mbOK], 0); //nomsg
end;

end.
