unit LotCodeTxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,GMSLabel,dxCntner, dxEditor, dxExEdtr,dxEdLib, KBitBtn,
  KGroupBox,LibProc;

type
  TfrmLotCodeTxt = class(TForm)
    GroupBox1: TKGroupBox;
    memTxt: TdxMemo;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtSize: TdxSpinEdit;
    btnOk: TKBitBtn;
    btnCancel: TKBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSizeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sltTxt:TStringList;
    blnOk:Boolean;
  public
    { Public declarations }
  end;

var
  frmLotCodeTxt: TfrmLotCodeTxt;

function WorkLotCodeTxt(strTxt:string;blnReadOnly:boolean):TStringList;

implementation

{$R *.DFM}

function WorkLotCodeTxt(strTxt:string;blnReadOnly:boolean):TStringList;
var
   i:integer;
begin
   frmLotCodeTxt:=TfrmLotCodeTxt.Create(Application);
   with frmLotCodeTxt do
   begin
      memTxt.Text:=strTxt;
      memTxt.ReadOnly:=blnReadOnly;
      btnOk.Enabled:=not blnReadOnly;
      ShowModal;
      if (blnOk) and (memTxt.Text<>'') then
      begin
         sltTxt:=TstringList.Create;
         for I:=0 to memTxt.Lines.Count-1 do
         begin
            if Trim(memTxt.Lines.Strings[I])<>'' then
               sltTxt.Add(Trim(memTxt.Lines.Strings[I]));
         end;
         WorkLotCodeTxt:=sltTxt;
      end else
         WorkLotCodeTxt:=nil;
      Free;
   end;
end;

procedure TfrmLotCodeTxt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmLotCodeTxt.FormDestroy(Sender: TObject);
begin
   frmLotCodeTxt:=nil;
end;

procedure TfrmLotCodeTxt.btnOkClick(Sender: TObject);
begin
   blnOk:=True;
   Close;
end;

procedure TfrmLotCodeTxt.btnCancelClick(Sender: TObject);
begin
   blnOk:=False;
   Close;
end;

procedure TfrmLotCodeTxt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=Vk_Escape then
      btnCancelClick(Self);
end;

procedure TfrmLotCodeTxt.edtSizeChange(Sender: TObject);
begin
   memTxt.Font.Size:=edtSize.IntValue;
end;

procedure TfrmLotCodeTxt.FormCreate(Sender: TObject);
begin
  SetFormStyle(Self);
  SetGroupBox(GroupBox1);
end;

end.
