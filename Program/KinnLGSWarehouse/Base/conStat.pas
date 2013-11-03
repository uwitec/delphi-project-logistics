unit conStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls;

type
  TfrmconStat = class(TForm)
    lblPrint: TLabelEffect;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;

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

procedure WorkconStat;

var
   frmconStat: TfrmconStat;

implementation
{$R *.dfm}

uses kindlg, datasTmp;

procedure WorkconStat;
begin
   if frmconStat <> nil then
   with frmconStat do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmconStat:=TfrmconStat.Create(Application);
   with frmconStat do
   begin
     dtdReceDateT.Date:=Date;
     dtdReceDateF.Date:=Date-30;
     showmodal;
   end;
end;

procedure TfrmconStat.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   strSql,strFilter:string;
   blnprint:boolean;
begin
   //打印
   if TKBitBtn(Sender)=btnPrint then
      blnprint:=true
   else
      blnprint:=False;
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara:=TstringList.Create;
   // 装柜日期
   if dtdReceDateF.Date<>0 then
      strFilter:=strFilter+ ' and convert(char(10),locationout.conloaddate,102)>="'+dtdReceDateF.Text+'"';
   if dtdReceDateT.Date<>0 then
      strFilter:=strFilter+ ' and convert(char(10),locationout.conloaddate,102)<="'+dtdReceDateT.Text+'"';

   strsql:=' ksp_constat @filter='''+strfilter+'''';

   dataTmp.qryTmp.close;
   dataTmp.qryTmp.sql.Clear;
   OpenSql(dataTmp.qryTmp,strsql);

   lstPara.Add('dateFrom='+dtdReceDateF.Text);                      //统计日期
   lstPara.Add('dateTo='+dtdReceDateT.Text);


   WorkFillbb('900013',lstPara,not blnPrint,True,1,dataTmp.qryTmp)

end;

procedure TfrmconStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmconStat.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmconStat.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure TfrmconStat.FormDestroy(Sender: TObject);
begin
   frmconStat:=nil;
end;

procedure TfrmconStat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
