unit Transact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  TfrmTransact = class(TForm)
    OrderDate: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdsdate: TdxDateEdit;
    dtdedate: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    qryTmp: TKADOQuery;
    lblPrint: TLabelEffect;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    blnSelect:Boolean;

  public
    { Public declarations }

  end;

procedure WorkTransact;

var
   frmTransact: TfrmTransact;

implementation
{$R *.dfm}

uses kindlg, GetDllPub, libuserPub, datas;

procedure WorkTransact;
begin
   if frmTransact <> nil then
   with frmTransact do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmTransact:=TfrmTransact.Create(Application);
   with frmTransact do
   begin
      ShowModal;
      Free;
   end;
end;

procedure TfrmTransact.btnPreviewClick(Sender: TObject);
var
   strFilter:string;
   lstPara:TStringList;
   blnprint:boolean;
begin
   //打印
   if TKBitBtn(Sender)=btnPreview then
      blnprint:=true
   else
      blnprint:=False;
   strFilter:='';
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;
   lstPara:=TstringList.Create;
   GenInformations(lstPara);

   lstPara.Add('zbrq='+DateToStr(Date));
   lstPara.Add('zbr='+_loginname);
   lstPara.Add('dateFrom='+dtdsdate.Text);        //调度时间
   lstPara.Add('dateTo='+dtdedate.Text);  
   if dtdsdate.Date<>0 then
   begin
      strFilter:=strFilter+' and convert(char(10),wareorder.OrderDate,102)>="'+dtdsdate.Text+'"';
   end;
   if dtdedate.Date<>0 then
   begin
      strFilter:=strFilter+' and convert(char(10),wareorder.OrderDate,102)<="'+dtdedate.Text+'"';
   end;

   OpenSql(qryTmp,'select wareorder.jobno,wareorder.userid,wareorder.DictateType,wareorder.OrderID,wareorder.mainorder,wareorder.costcusname,  '+chr(13)+chr(10)
                 +'       carno=wareorder.Carbrand+case when wareorder.conno<>"" then "/"+wareorder.conno  else "" end ,                       '+chr(13)+chr(10)
                 +'       wareordersku.skuname,wareordersku.skustandard,wareordersku.quantity,                                                 '+chr(13)+chr(10)
                 +'       quantityuom=wareordersku.pieceuom,orderdate=convert(char(10),wareorder.orderdate,102),                               '+chr(13)+chr(10)
                 +'       grossweight=case when wareordersku.weightuom="吨" then wareordersku.grossweight*1000 else wareordersku.grossweight end ,  '+chr(13)+chr(10)
                 +'       wareordersku.volume,wareordersku.locname                 '+chr(13)+chr(10)
                 +'  from wareorder                                                '+chr(13)+chr(10)
                 +'       left join wareordersku                                   '+chr(13)+chr(10)
                 +'              on wareorder.jobno=wareordersku.jobno             '+chr(13)+chr(10)
                 +' where (not exists (select 1                                     '+chr(13)+chr(10)
                 +'                     from wareordersku                          '+chr(13)+chr(10)
                 +'                    where wareorder.jobno=wareordersku.jobno )  '+chr(13)+chr(10)
                 +'        or exists (select 1                                     '+chr(13)+chr(10)
                 +'                     from wareordersku                          '+chr(13)+chr(10)
                 +'                    where not exists (select quantity,quantitytask,jobno    '+chr(13)+chr(10)
                 +'                                        from wareordersku                            '+chr(13)+chr(10)
                 +'                                       where isnull(quantity,0)<>isnull(quantitytask,0)))  '+chr(13)+chr(10)
                 +'         )                                                      '+chr(13)+chr(10)
                 //                 +'   and wareorder.iuserid like "'+_userid+'%"                                              '+chr(13)+chr(10)
                 +IIF(_Useridcan<>'',
                     ' and (wareorder.userid in '+_Useridcan+' or wareorder.iuserid in '+_Useridcan+') ',
                     ' and (WareOrder.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
                    +'    or WareOrder.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
                 +strFilter
                 +' order by wareorder.DictateType                                                '+chr(13)+chr(10)
                 );

   WorkFillbb('100086',lstPara,blnPrint,True,1,qryTmp);
end;

procedure TfrmTransact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmTransact.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmTransact.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmTransact.FormDestroy(Sender: TObject);
begin
   frmTransact:=nil;
end;

procedure TfrmTransact.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
