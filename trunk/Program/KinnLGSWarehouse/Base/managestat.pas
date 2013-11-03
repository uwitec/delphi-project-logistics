unit ManageStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls,KDataSetProvider;

type
  TfrmManageStat = class(TForm)
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
    procedure cmbShipperCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipperCusExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

procedure WorkManageStat;

var
   frmManageStat: TfrmManageStat;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub,GetDllPub;

procedure WorkManageStat;
begin
   if frmManageStat <> nil then
   with frmManageStat do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmManageStatt:=TfrmManageStat.Create(Application);
   with frmManageStat do
   begin
     dtdReceDateT.Date:=Date;
     dtdReceDateF.Date:=Date-30;
     showmodal;
   end;
end;

procedure TfrmManageStat.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   strSql,strFilter:string;
   blnprint:boolean;
   XUOM,X20UOM,X40UOM,X40HQUOM,BZXUOM:integer;
begin

   XUOM:=0;
   X20UOM:=0;
   X40UOM:=0;
   X40HQUOM:=0;
   BZXUOM:=0;
   //打印
   if TKBitBtn(Sender)=btnPrint then
      blnprint:=true
   else
      blnprint:=False;
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;

   lstPara:=TStringList.create;

   strsql:=' ksp_ManageStat @datafrom="'+dtdFrom.Text+'",'
       +'                   @datato="'+dtdTo.Text+'" ';

   dataTmp.qryTmp.close;
   dataTmp.qryTmp.sql.Clear;
   OpenSql(dataTmp.qryTmp,strsql);

   dataTmp.qryTmp.First;
   while not dataTmp.qryTmp.Eof do
   begin
   if dataTmp.qryTmp.FieldByName('CONTYPE').AsString='20' then
      begin
        X20UOM:=X20UOM+1;
        BZXUOM:=BZXUOM+1;
      end
      else
      begin
        if dataTmp.qryTmp.FieldByName('CONSPTYPE').AsString='HQ' then
        begin
           X40HQUOM:=X40HQUOM+1;
           BZXUOM:=BZXUOM+2;
        end else
        begin
           X40UOM:=X40UOM+1;
           BZXUOM:=BZXUOM+2;
        end;
      end;
      XUOM:=XUOM+1;
      dataTmp.qryTmp.Next;
   end;
   dataTmp.qryTmp.First;

   GenInformations(lstPara);
   lstPara.Add('tbr='+_LoginName);
   lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
   lstPara.Add('dateT='+dtdReceDateT.Text);
   lstPara.Add('RemarkTotal=''卸柜 '+inttostr(XUOM)+'个：20’'+inttostr(X20UOM)+'个，40’'+inttostr(X40UOM)+'个，40’HQ'+inttostr(X40HQUOM)+'个；'+chr(13)+chr(10)
                            +'折标准箱： '+inttostr(BZXUOM)+'个');


   WorkFillbb('900016',lstPara,not blnPrint,True,1,dataTmp.qryTmp)

end;

procedure TfrmManageStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmManageStat.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmManageStat.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure TfrmManageStat.FormDestroy(Sender: TObject);
begin
   frmManageStat:=nil;
end;

procedure TfrmManageStat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
