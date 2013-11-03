unit CongealYY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser,KDataSetProvider, KGroupBox, GMSLabel, dxDBELib;

type
  TCongealYY=Record
    LocationID   :string;
    LocationName :string;
    IsTray       :Boolean;//托盘与仓位对应,自动上架
    IsBingo      :Boolean;//推荐是否成功
    ROperationDate:TDateTime;
    OkFlag :Boolean;
    remark:string;
  end;

type
  TfrmCongealYY = class(TForm)
    KGroupBox1: TKGroupBox;
    memremark: TdxMemo;
    btnCancel: TKBitBtn;
    btnOk: TKBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    strjobno,strsno,strldsno:string;
    strskulist:string;
    theresult:TCongealYY;
    blnSelect:Boolean;

  public
    { Public declarations }
  end;

function WorkCongealYY(pjobno:string;psno:string;pldsno:string):TCongealYY;
//pskulist:任务商品信息列表
var
  frmCongealYY: TfrmCongealYY;

implementation

{$R *.dfm}

uses kindlg,libproc,GetDllPub,libuserPub,datasSelect,SelLoc,datasTmp;


function WorkCongealYY(pjobno:string;psno:string;pldsno:string):TCongealYY;
begin
   frmCongealYY:=TfrmCongealYY.Create(Application);
   with frmCongealYY do
   begin

     theresult.remark:='';
     strjobno:=pjobno;
     strsno:=psno;
     strldsno:=pldsno;
     frmCongealYY.show;
   end;
end;

procedure TfrmCongealYY.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmCongealYY.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TfrmCongealYY.FormDestroy(Sender: TObject);
begin
   frmCongealYY:=nil;
end;

procedure TfrmCongealYY.btnOkClick(Sender: TObject);
begin
   if memremark.text<>'' then
      Theresult.remark:=memremark.Text;
end;

procedure TfrmCongealYY.FormCreate(Sender: TObject);
begin
  Height:=163;
  Width:=247;
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
end;

procedure TfrmCongealYY.btnCancelClick(Sender: TObject);
begin
   theresult.OkFlag:=False;
   Close;
end;

end.
