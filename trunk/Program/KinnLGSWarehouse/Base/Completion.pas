unit Completion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  TfrmCompletion = class(TForm)
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    qryTmp: TKADOQuery;
    lblPrint: TLabelEffect;
    qrytmp1: TKADOQuery;
    GMSStickyLabel1: TGMSStickyLabel;
    radBBtype: TKRadioGroup;
    dtdFSFrom: TdxDateEdit;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

procedure WorkCompletion;

var
   frmCompletion: TfrmCompletion;

implementation
{$R *.dfm}

uses kindlg,libuserPub,GetDllPub;

procedure WorkCompletion;
var
   i:Integer;
   strsql: string;
begin
   if frmCompletion <> nil then
   with frmCompletion do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   Application.CreateForm(TfrmCompletion, frmCompletion);
   with frmCompletion do
   begin
     ShowModal;
   end;

end;

procedure TfrmCompletion.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   blnprint:boolean;
   strfilter,strsql,strdate :string;
begin
   //打印
   if TKBitBtn(Sender)=btnPreview then
      blnprint:=true
   else
      blnprint:=False;


   if dtdFSFrom.Date=0 then
   begin
      KMessageDlg('统计时间不能为空!',mtInformation,[mbOK],0);
      dtdFSFrom.SetFocus;
      exit;
   end;

   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara:=TstringList.Create;
   GenInformations(lstPara);

//   if cmbyear.Text<>'' then
//   begin
//      strdate:=cmbyear.Text;
//   end else
//   begin
//     //
//   end;
//
//   if cmbmonth.Text<>'' then
//   begin
//      strdate:=strdate+cmbyear.Text;
//   end else
//   begin
//     //
//   end;

   strsql:=' exec ksp_Completion @date="'+dtdFSFrom.Text+'", '
          +'                     @grouptype="''"  '
          ;
   qryTmp.Close;
   qryTmp.SQL.Clear;
   qryTmp.SQL.Add(strsql);
   qryTmp.Open;

   lstpara.Add('yearF='+copy(dtdFSFrom.Text,1,4));
   lstpara.Add('monthF='+copy(dtdFSFrom.Text,6,2));

   lstPara.Add('zbrq='+DateToStr(Date));
   lstPara.Add('zbr='+_loginname);
   WorkFillbb('900119',lstPara,blnPrint,True,1,qryTmp);
end;

procedure TfrmCompletion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmCompletion.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmCompletion.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmCompletion.FormDestroy(Sender: TObject);
begin
   frmCompletion:=nil;
end;

procedure TfrmCompletion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
