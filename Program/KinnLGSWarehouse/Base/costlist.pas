unit costlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, dxDBELib,KDataSetProvider,GetDllPub;

type
  Tfrmcostlist = class(TForm)
    lblPrint: TLabelEffect;
    gsmOperationF: TGMSStickyLabel;
    gsmOperationT: TGMSStickyLabel;
    dtdOperationDateF: TdxDateEdit;
    dtdOperationDateT: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    GMSStickyLabel20: TGMSStickyLabel;
    edtCus: TdxButtonEdit;
    edtskuname: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCusButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtCusExit(Sender: TObject);
    procedure edtskunameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtskunameExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

procedure Workcostlist;

var
   frmcostlist: Tfrmcostlist;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub;

procedure Workcostlist;
begin
   if frmcostlist <> nil then
   with frmcostlist do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmcostlist:=Tfrmcostlist.Create(Application);
   with frmcostlist do
   begin
     dtdOperationDateF.Date:=Date-30;
     dtdOperationDateT.Date:=Date;
     showmodal;
   end;
end;

procedure Tfrmcostlist.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   strSql,strFilter,strfilterSql,strfilerTmp:string;
   blnprint:boolean;
begin
   //打印
   if TKBitBtn(Sender)=btnPrint then
      blnprint:=true
   else
      blnprint:=False;

   if dtdOperationDateF.Date=0 then
   begin
      KMessageDlg('开始日期不能为空!',mtInformation,[mbOK],0);
      dtdOperationDateF.SetFocus;
      exit;
   end else
   if dtdOperationDateT.Date=0 then
   begin
      KMessageDlg('结束日期不能为空!',mtInformation,[mbOK],0);
      dtdOperationDateT.SetFocus;
      exit;
   end else
   if edtCus.Text='' then
   begin
      KMessageDlg('费用关系人不能为空!',mtInformation,[mbOK],0);
      edtCus.SetFocus;
      exit;
   end else
   if edtskuname.Text='' then
   begin
      KMessageDlg('商品名称不能为空!',mtInformation,[mbOK],0);
      edtskuname.SetFocus;
      exit;
   end;



   if edtskuname.Text<>'' then
   begin
      strfilerTmp:='';
      OpenSql(dataTmp.qryTmp,' select skuid from sku (nolock) '
                            +'  where classid  like "'+edtskuname.TextField+'%" ');
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
         strfilerTmp:=strfilerTmp+'"'+dataTmp.qryTmp.FieldByName('skuid').AsString+'",';
         dataTmp.qryTmp.Next;
      end;
      Delete(strfilerTmp,Length(strfilerTmp),1);
      strfilerTmp:=' and skuid in ( '+strfilerTmp+' )  ';
      strfilterSql:=strfilterSql+strfilerTmp;
   end;

   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara := TStringList.Create;

   opensql(dataTmp.qryTmp1,'select skumodel,skuspec from sku    '+chr(13)+chr(10)
                         +' where skuid="'+dataTmp.qryTmp.FieldByName('skuid').AsString+'"'
                         );

   lstpara.Add('skumodel='+dataTmp.qryTmp1.fieldbyname('skumodel').AsString);
   lstpara.Add('skuspec='+dataTmp.qryTmp1.fieldbyname('skuspec').AsString);
   lstpara.Add('costcusname='+edtCus.text);
   lstpara.Add('zbrq='+datetostr(GetServerDate));
   lstpara.Add('zbr='+_loginname);
   lstpara.Add('skuname='+edtskuname.text);

   ExecSql(dataTmp.qryTmp1,' exec ksp_costlist @Stime="'+dtdOperationDateF.Text+'",              '
               +'                              @Etime="'+dtdOperationDateT.Text+'",              '
               +'                              @userid="'+_userid+'",                            '
               +'                              @cusid="'+edtcus.TextField+'",                    '
               +'                              @skuid="'+dataTmp.qryTmp.FieldByName('skuid').AsString+'"                     '
               );

   OpenSql(dataTmp.qryTmp2,'select costtotal=sum(isnull(costinrmb,0)) from ##lsbcosttotal (nolock) ');
   lstpara.Add('costtotal='+Num2BCMoney(dataTmp.qryTmp2.FieldByName('costtotal').AsFloat)+'整');

   WorkFillbb('900332',lstPara,not blnPrint,True,1,dataTmp.qryTmp1)
end;

procedure Tfrmcostlist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmcostlist.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmcostlist.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure Tfrmcostlist.FormDestroy(Sender: TObject);
begin
   frmcostlist:=nil;
end;

procedure Tfrmcostlist.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure Tfrmcostlist.edtCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCus.TextField:=qrySelect.FieldByName('Cusid').asstring;
      edtCus.Text     :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure Tfrmcostlist.edtCusExit(Sender: TObject);
begin
   if edtCus.Text='' then
      edtCus.TextField:='';
end;

procedure Tfrmcostlist.edtskunameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetSkuSelect('','','A');
   if qrySelect.FieldByName('skuid').AsString<>'' then
   begin
      edtskuname.Text:=qrySelect.FieldByName('skuname').AsString;
      edtskuname.TextField:=qrySelect.FieldByName('classid').AsString;
   end;
   FreeAndNil(qrySelect);
end;

procedure Tfrmcostlist.edtskunameExit(Sender: TObject);
begin
  if edtskuname.Text='' then edtskuname.TextField:='';
end;

end.
