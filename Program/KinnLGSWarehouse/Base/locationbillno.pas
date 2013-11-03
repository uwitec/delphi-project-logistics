unit Locationbillno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser, GMSLabel, KinPickEdit,KDataSetProvider;

type
  TLocationbillno=Record
    strcostcusid :string;
    strcostcusname:string;
    strlocationbillno:string;
    OkFlag:Boolean;
  end;

type
  TfrmLocationbillno = class(TForm)
    btnOk: TKBitBtn;
    edtCostCus: TdxButtonEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    edtcustype: TdxEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    btnCancel: TKBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure KBitBtn1Click(Sender: TObject);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusExit(Sender: TObject);
    procedure edtCostCusExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    theresult:TLocationbillno;
    strinout:string;
    blnSelect:Boolean;
  public
    { Public declarations }
  end;

function WorkLocationbillno(pstrinout:string):TLocationbillno;

var
  frmLocationbillno: TfrmLocationbillno;

implementation

{$R *.dfm}

uses kindlg,datas,libproc,main, datasTmp,libuserPub, GetDllPub;


function WorkLocationbillno(pstrinout:string):TLocationbillno;
begin
   frmLocationbillno:=TfrmLocationbillno.Create(Application);
   with frmLocationbillno do
   begin
     strinout:=pstrinout;
     showmodal;
     WorkLocationbillno:=TheResult;
     Free;
   end;
//  frmWareOrderType.Free;
end;


procedure TfrmLocationbillno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmLocationbillno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TfrmLocationbillno.FormDestroy(Sender: TObject);
begin
   frmLocationbillno:=nil;
end;

procedure TfrmLocationbillno.btnOkClick(Sender: TObject);
begin
   if Trim(edtCostCus.Text)='' then
   begin
      KmessageDlg('请选择费用关系人！',mtInformation,[mbOK],0);//'选择不能为空,请选择！'
      edtCostCus.SetFocus;
      Exit;
   end;
   with theresult do
   begin
      strcostcusid:=edtCostCus.TextField;
      strcostcusname:=edtCostCus.Text;
      if strinout='1' then                      
      begin
//         OpenSql(dataTmp.qryTmp,'select isnull(replicate(0,6-len(substring(docno1,5,6)))+substring(docno1,5,6) ,1)    '
//                               +'  from genjobno '
//                               +' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
//                               +'   and substring(docno1,3,1)="'+edtcustype.Text+'" '
//                               +'   and substring(docno1,4,1)<>"U" '
//                               +' order by isnull(replicate(0,6-len(substring(docno1,5,6)))+substring(docno1,5,6) ,1) ');
//
//         strlocationbillno:=copy(DateToStr(Date),3,2)+edtcustype.Text+'-'+pad(getEmpty(dataTmp.qrytmp,1,999999),6, '0', psLeft);

         if Length(edtcustype.Text)>1 then
         begin
            OpenSql(dataTmp.qryTmp,'select maxno=isnull(max(substring(docno1,6,6)),0)+1'
                                  //lzw20111207
                                  +'  from genjobno(nolock) '
                                  //+' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
                                  +' where docno1 like "'+copy(DateToStr(Date),3,2)+'%"'
                                  +'   and substring(docno1,3,2)="'+edtcustype.Text+'" '
                                  +'   and substring(docno1,4,1)<>"U" '
                                  +'   and len(docno1)=11'
                   );
         end else
         begin
            OpenSql(dataTmp.qryTmp,'select maxno=isnull(max(substring(docno1,5,6)),0)+1'
                                  +'  from genjobno(nolock) '
                                  //lzw20111207
                                  //+' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
                                  +' where docno1 like "'+copy(DateToStr(Date),3,2)+'%"'
                                  +'   and substring(docno1,3,1)="'+edtcustype.Text+'" '
                                  +'   and substring(docno1,4,1)<>"U" '
                                  +'   and len(docno1)=10'
                   );
         end;
         strlocationbillno:=copy(DateToStr(Date),3,2)+edtcustype.Text+'-'+pad(dataTmp.qryTmp.fieldbyname('maxno').asstring,6, '0', psLeft)
      end else
      begin
//         OpenSql(dataTmp.qryTmp,'select isnull(replicate(0,6-len(substring(docno1,6,6)))+substring(docno1,6,6),1)    '
//                               +'  from genjobno '
//                               +' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
//                               +'   and substring(docno1,3,1)="'+edtcustype.Text+'"  '
//                               +'   and substring(docno1,4,1)="U" '
//                               +' order by isnull(replicate(0,6-len(substring(docno1,6,6)))+substring(docno1,6,6),1) ' );

         OpenSql(dataTmp.qryTmp,'select maxno=isnull(max(substring(docno1,6,6)),0)+1    '
                               +'  from genjobno(nolock) '
                               //lzw20111207
                               //+' where substring(docno1,1,2)="'+copy(DateToStr(Date),3,2)+'"'
                               +' where docno1 like "'+copy(DateToStr(Date),3,2)+'%"'
                               +'   and substring(docno1,3,1)="'+edtcustype.Text+'"  '
                               +'   and substring(docno1,4,1)="U" '
                               +'   and len(docno1)=11'
//                               +' order by isnull(replicate(0,6-len(substring(docno1,6,6)))+substring(docno1,6,6),1) '
                );

         strlocationbillno:=copy(DateToStr(Date),3,2)+edtcustype.Text+'U-'+pad(dataTmp.qryTmp.fieldbyname('maxno').asstring,6, '0', psLeft);
      end;
      OkFlag:=True;
   end;
   frmLocationbillno.close;
end;

procedure TfrmLocationbillno.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
end;

procedure TfrmLocationbillno.KBitBtn1Click(Sender: TObject);
begin
   frmLocationbillno.close;
end;

procedure TfrmLocationbillno.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCostCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCostCus.Text :=qrySelect.FieldByName('Cusname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmLocationbillno.edtCostCusExit(Sender: TObject);
begin
   blnSelect:=False;
   if edtCostCus.Text<>'' then
   begin
      OpenSql(dataTmp.qryTmp,'select custype=codelib.codechar1 '
                            +'  from customer(nolock) left join codelib(nolock)  '
                            +'                       on customer.custype=codelib.codename     '
                            +' where customer.cusid="'+edtCostCus.TextField+'" '
                            +'   and codelib.codeclass="09" ');
      edtcustype.Text:=dataTmp.qryTmp.FieldByName('custype').AsString;
   end;
end;

procedure TfrmLocationbillno.edtCostCusExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if edtCostCus.Text='' then
   begin
      edtCostCus.TextField:='';
      edtCostCus.Text:='';
   end else
   if not blnSelect then
   begin
      qrySelect:=pGetCustomerSelect('A',edtCostCus.Text);
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         edtCostCus.TextField:=qrySelect.FieldByName('Cusid').asstring;
         edtCostCus.Text :=qrySelect.FieldByName('Cusname').asstring;
      end else failed:=true;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmLocationbillno.btnCancelClick(Sender: TObject);
begin
   with theresult do
   begin
      OkFlag:=False;
      strlocationbillno:='';
   end;
   frmLocationbillno.Close;
end;

end.
