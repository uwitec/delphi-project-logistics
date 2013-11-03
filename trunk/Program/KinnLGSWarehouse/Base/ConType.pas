unit ConType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls, DBClient, KDataSetProvider;

type
  TfrmConType = class(TForm)
    btnOK: TKBitBtn;
    btnCancel: TKBitBtn;
    qryTmp: TKADOQuery;
    gsmConType: TGMSStickyLabel;
    cmbcontype: TKinPickEdit;
    cmbconsptype: TKinPickEdit;
    dtddatetime: TdxDateEdit;
    GMSStickyLabel11: TGMSStickyLabel;

    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    strjobno:string;
  public
    { Public declarations }

  end;

procedure workConType(pstrjobno:string);

var
   frmConType: TfrmConType;

implementation
{$R *.dfm}

uses kindlg, GetDllPub, libuserPub, datas;

procedure WorkConType(pstrjobno:string);
begin
   if frmConType <> nil then
   with frmConType do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmConType:=TfrmConType.Create(Application);
   with frmConType do
   begin
      strjobno:=pstrjobno;
      InitdbPick(cmbconsptype,'codelib','codename','codename','codeclass="01"');
      cmbcontype.Text:='40';
      cmbconsptype.Text:='HC';
      ShowModal;
      Free;
   end;
end;

procedure TfrmConType.btnOKClick(Sender: TObject);
begin
    if KmessageDlg('确认要更改箱型和规格吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
       ExecSql(qryTmp,'update locationinoutcon '
                     +'   set contype="'+cmbConType.text+'",consptype="'+cmbConspType.text+'" '
                     +' where jobno="'+strjobno+'"    '
              );
       if (dtddatetime.Date<>0) and (Pos('LI',strjobno)>0) then
       begin
          if KmessageDlg('确认要更改生产日期吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             ExecSql(qryTmp,'update locationinitem '
                        +'   set manufacturedate="'+dtddatetime.Text+'"  '
                        +' where jobno="'+strjobno+'"    '
                        +'update locationindetail '
                        +'   set manufacturedate="'+dtddatetime.Text+'"  '
                        +' where jobno="'+strjobno+'"    '
                        +'update locinskudetail '
                        +'   set manufacturedate="'+dtddatetime.Text+'"  '
                        +' where jobno="'+strjobno+'"    '
                        +'update locationinoutconsku '
                        +'   set manufacturedate="'+dtddatetime.Text+'"  '
                        +' where jobno="'+strjobno+'"    '
                 );
          end;
       end;
    end;
    frmConType.Close;
end;

procedure TfrmConType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmConType.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmConType.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmConType.FormDestroy(Sender: TObject);
begin
   frmConType:=nil;
end;

procedure TfrmConType.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

end.
