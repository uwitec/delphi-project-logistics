unit GridSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, DBTables,
  Db,StdCtrls,Forms, Dialogs,libproc,libUser,ExtCtrls, GMSLabel,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  KinPickEdit, KBitBtn, KGroupBox, dxDBELib, CheckLst;

type
  TGridSelect=Record
    sltGrid:TStringList;
    OkFlag:Boolean;
  end;

type
  TfrmGridSelect = class(TForm)
    btnOk: TKBitBtn;
    btnCancel: TKBitBtn;
    btnCancleAll: TKBitBtn;
    btnSelectAll: TKBitBtn;
    KGroupBox2: TKGroupBox;
    cklCusclass: TCheckListBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnCancleAllClick(Sender: TObject);
  private
    { Private declarations }
    theresult:TGridSelect;
    StrCheck :Boolean;
    sltGridname:TStringList;
    sltGridVisible:TStringList;

    procedure Scatter;
  public
    { Public declarations }
  end;

function workGridSelect(psltname:TStringList;psltvisible:TStringList):TGridSelect;

var
  frmGridSelect: TfrmGridSelect;

implementation

{$R *.DFM}

uses datas,main;

function workGridSelect(psltname:TStringList;psltvisible:TStringList):TGridSelect;
var
   I:Integer;
begin
   frmGridSelect:=TfrmGridSelect.Create(Application);
   with frmGridSelect do
   begin
      StrCheck:=True;
      Top:=170;
      Left:=235;
      //客户类别
      sltGridname:=psltname;
      sltGridVisible:=psltvisible;
      cklCusclass.Items.Clear;
      for I:=0 to (psltname.Count-1) do
      begin
         cklCusclass.Items.Add(psltname.Strings[I]);
      end;
      Scatter;
      ShowModal;
      WorkGridSelect:=TheResult;
      Free;
   end;
end;

procedure TfrmGridSelect.btnOkClick(Sender: TObject);
var
   i:integer;
begin
   with theresult do
   begin
      sltGrid:=TStringList.Create;
      for i:=0 to cklCusclass.Items.count-1 do
      begin
         if cklcusClass.Checked[i] then
            sltGrid.Add('T')
         else sltGrid.Add('F');
      end;
      OkFlag  :=true;
   end;
   Close;
end;

procedure TfrmGridSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=cafree;
end;

procedure TfrmGridSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    Vk_Return:
//      if (ACtiveControl = grdGridSelect) or (ACtiveControl = edtAccountId) then
//         btnOkClick(Self)
//     else
      Sendmessage(Self.Handle,WM_NEXTDLGCTL,0,0);
    Vk_Escape:
      btnCancelClick(Self);
   end;
end;

procedure TfrmGridSelect.btnCancelClick(Sender: TObject);
begin
   theresult.OkFlag  :=False;
   Close;
end;

procedure TfrmGridSelect.FormKeyPress(Sender: TObject; var Key: Char);
begin
{   if not edtAccountId.Focused and not(Key=#13) then
   begin
      edtAccountId.SetFocus;
      edtAccountId.Text:=Key;
      edtAccountId.SelStart:=1;
   end;}
end;

procedure TfrmGridSelect.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,False);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
//   SetDxDbGrid(grdDriverselect);
end;

procedure TfrmGridSelect.Scatter;
var
  i:integer;
begin
   //读取非数据感应控件的值，并显示之。
   for i:=0 to cklCusclass.Items.count-1 do
   begin
      if sltGridVisible.Strings[I]='T' then
         cklcusClass.Checked[i]:=True
      else cklcusClass.Checked[i]:=False;
   end;
end;

procedure TfrmGridSelect.btnSelectAllClick(Sender: TObject);
var
   I:integer;
begin
   for i:=0 to cklCusclass.Items.count-1 do
       cklcusClass.Checked[i]:=True;
end;

procedure TfrmGridSelect.btnCancleAllClick(Sender: TObject);
var
   I:integer;
begin
   for i:=0 to cklCusclass.Items.count-1 do
       cklcusClass.Checked[i]:=False;
end;

end.
