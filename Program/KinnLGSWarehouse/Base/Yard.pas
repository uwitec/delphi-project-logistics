unit Yard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  TfrmYard = class(TForm)
    OrderDate: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    btnOK: TKBitBtn;
    btnCancel: TKBitBtn;
    qryTmp: TKADOQuery;
    GMSStickyLabel1: TGMSStickyLabel;
    edtheigth: TdxEdit;
    edtdepth: TdxEdit;
    edtwidth: TdxEdit;

    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    strjobno, strsno ,strserialno:string;
  public
    { Public declarations }

  end;

procedure WorkYard(pstrjobno:string;pstrsno:string;pstrserialno:string);

var
   frmYard: TfrmYard;

implementation
{$R *.dfm}

uses kindlg, GetDllPub, libuserPub, datas;

procedure WorkYard(pstrjobno:string;pstrsno:string;pstrserialno:string);
begin
   if frmYard <> nil then
   with frmYard do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmYard:=TfrmYard.Create(Application);
   with frmYard do
   begin
      strjobno:=pstrjobno;
      strsno:=pstrsno;
      strserialno:=pstrserialno;
      ShowModal;
      Free;
   end;
end;

procedure TfrmYard.btnOKClick(Sender: TObject);
begin
    if KmessageDlg('确定修改该码单位置吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       ExecSql(qryTmp,'update locinskudetail '
                     +'   set height="'+edtheigth.text+'",depth="'+edtdepth.text+'",width="'+edtwidth.text+'" '
                     +' where jobno="'+strjobno+'"    '
                     +'   and sno="'+strsno+'"      '
                     +'   and serialno="'+strserialno+'"      '
              );
       KMessageDlg('码单已经修改完成！', mtWarning, [mbOk], 0);
    end;
    frmYard.Close;
end;

procedure TfrmYard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmYard.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmYard.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmYard.FormDestroy(Sender: TObject);
begin
   frmYard:=nil;
end;

procedure TfrmYard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
