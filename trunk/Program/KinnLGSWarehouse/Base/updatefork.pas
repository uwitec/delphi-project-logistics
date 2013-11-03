unit updatefork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  Tfrmupdatefork = class(TForm)
    btnOK: TKBitBtn;
    btnCancel: TKBitBtn;
    qryTmp: TKADOQuery;
    edtopnamezx: TdxButtonEdit;
    GMSStickyLabel58: TGMSStickyLabel;
    GMSStickyLabel73: TGMSStickyLabel;
    edtnetweightzx: TdxEdit;
    GMSStickyLabel92: TGMSStickyLabel;
    edtnetweightzxgzl: TdxEdit;
    GMSStickyLabel83: TGMSStickyLabel;
    edtminquantityzx: TdxEdit;
    GMSStickyLabel193: TGMSStickyLabel;
    edtpricezx1: TdxEdit;

    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtopnamezxButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    strjobno, strsno,state :string;
  public
    { Public declarations }

  end;

procedure Workupdatefork(pstrjobno:string;pstrsno:string;Pstate:string);

var
   frmupdatefork: Tfrmupdatefork;

implementation
{$R *.dfm}

uses kindlg, GetDllPub, libuserPub, datas;

procedure Workupdatefork(pstrjobno:string;pstrsno:string;Pstate:string);
begin
   if frmupdatefork <> nil then
   with frmupdatefork do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmupdatefork:=Tfrmupdatefork.Create(Application);
   with frmupdatefork do
   begin
      strjobno:=pstrjobno;
      strsno:=pstrsno;
      state:=Pstate;
      ShowModal;
      Free;
   end;
end;

procedure Tfrmupdatefork.btnOKClick(Sender: TObject);
var
   strminquantity:Extended;
   strdate:string;
begin
    if edtopnamezx.text='' then
    begin
       KMessageDlg('操作人员不能为空！', mtWarning, [mbOk], 0);
       edtopnamezx.SetFocus;
    end;
    if edtpricezx1.text='' then
    begin
       KMessageDlg('操作人员单价为空！', mtWarning, [mbOk], 0);
       edtpricezx1.SetFocus;
    end;
    if edtminquantityzx.text='' then
       strminquantity:=0
    else
       strminquantity:=StrToFloat(edtminquantityzx.text);
    //lzw
    if state ='E' then
    begin
       if KmessageDlg('确定修改作业量计酬吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
          ExecSql(qryTmp,'update forkworkload '
                        +'   set opname="'+edtopnamezx.text+'",opid="'+edtopnamezx.textfield+'", '
                        +'       netweight="'+edtnetweightzx.text+'",netweightgzl="'+edtnetweightzxgzl.text+'", '
                        +'       minquantity='+floattostr(strminquantity)+',price="'+edtpricezx1.text+'" '
                        +' where jobno="'+strjobno+'"    '
                        +'   and sno="'+strsno+'"      '
                 );
          KMessageDlg('作业量计酬已经修改完成！', mtWarning, [mbOk], 0);
       end;
       frmupdatefork.Close;
    end;
    if state ='I' then
    begin
       strjobno:=genJobno('WB');
       if KmessageDlg('确定新增外部仓库人员作业量计酬吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
          ExecSql(qryTmp,'insert into forkworkload '+chr(13)+chr(10)
                        +'       (sno,opid,opname,'+chr(13)+chr(10)
                        +'        operationdate,locationbillno,jobnoin,jobno, '+chr(13)+chr(10)
                        +'        netweight,netweightgzl,createname,customsno,forktype,'+chr(13)+chr(10)
                        +'        price,minquantity,cusbillno) '+chr(13)+chr(10)
                        +'values (1,"'+edtopnamezx.TextField+'","'+edtopnamezx.Text+'", '+chr(13)+chr(10)
                        +'        getdate()," ","'+strjobno+'","'+strjobno+'",'+chr(13)+chr(10)
                        +'        "'+edtnetweightzx.text+'","'+edtnetweightzxgzl.text+'", '
                        +'        "'+_loginname+'"," ","W" , '
                        +'        "'+edtpricezx1.text+'",'+floattostr(strminquantity)+',"" )'+chr(13)+chr(10)
                        );
          KMessageDlg('作业量计酬新增完成！', mtWarning, [mbOk], 0);
       end;
       frmupdatefork.Close;
    end;
end;

procedure Tfrmupdatefork.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmupdatefork.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmupdatefork.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
end;

procedure Tfrmupdatefork.FormDestroy(Sender: TObject);
begin
   frmupdatefork:=nil;
end;

procedure Tfrmupdatefork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure Tfrmupdatefork.edtopnamezxButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      edtopnamezx.TextField  :=qrySelect.FieldByName('opid').asstring;
      edtopnamezx.Text  :=qrySelect.FieldByName('opname').asstring;
   end;

end;

end.
