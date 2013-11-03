unit SetGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, DBTables,
  Db,StdCtrls,Forms, Dialogs,libproc,ExtCtrls, GMSLabel,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  KinPickEdit, KBitBtn, KGroupBox, dxDBELib, CheckLst,Kindlg;

type
  TGridSelect=Record
    sltGrid:TStringList;
    OkFlag:Boolean;
  end;

type
  TfrmSetGrid = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnCancleAllClick(Sender: TObject);
    procedure cklCusclassDblClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    theresult:TGridSelect;
    StrCheck :Boolean;
    blnCaptionCh:Boolean;  //列是否有改变
    sltGridFieldName:TStringList; //列名
    sltCaptionchanged:TStringList; //列是否有改变.
    grdSetGrid:TdxDBGrid;
    frmname:string;

    procedure Scatter;
  public
    { Public declarations }
  end;

procedure workSetGrid(pgrdset:TdxDBGrid;pfrmname:string);

var
  frmSetGrid: TfrmSetGrid;

implementation

{$R *.DFM}

uses datas,main,libuser,libuserpub;

procedure workSetGrid(pgrdset:TdxDBGrid;pfrmname:string);
begin
   frmSetGrid:=TfrmSetGrid.Create(Application);
   with frmSetGrid do
   begin
      StrCheck:=True;
      Top:=170;
      Left:=235;
      grdSetGrid:=pgrdset;
      frmname:= pfrmname;
      //列表初始
      cklCusclass.Items.Clear;
      Caption:=frmname+'-'+grdSetGrid.Name+'设置';
      Scatter;
      ShowModal;
      Free;
   end;
end;

procedure TfrmSetGrid.btnOkClick(Sender: TObject);
var
   i:integer;
   sltCap,sltlblname  :TStringList;
begin
   sltCap:=TStringList.Create;
   sltlblname:=TStringList.Create;
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
//判断是否有改变列名，如果有则进行列名的改变操作
   if blnCaptionCh then
   begin
      for i:=0 to cklCusclass.Items.count-1 do
      begin
        if sltCaptionchanged[i]='T' then
        begin
          sltCap.Add(cklCusclass.Items.Strings[i]);
          sltlblname.Add(sltGridFieldName[i]);
        end;
      end;
      SetCheckListBox(sltCap,sltlblname,frmname);
   end;
   //显示列
   for I :=0 to cklCusclass.Count - 1 do
   begin
      TdxDBGridColumn(cklCusclass.Items.Objects[I]).Visible := cklCusclass.Checked[I];
      TdxDBGridColumn(cklCusclass.Items.Objects[I]).Caption := cklCusclass.Items[I];
   end;

   Close;
end;

procedure TfrmSetGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=cafree;
end;

procedure TfrmSetGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    Vk_Return:
//      if (ACtiveControl = grdSetGrid) or (ACtiveControl = edtAccountId) then
//         btnOkClick(Self)
//     else
      Sendmessage(Self.Handle,WM_NEXTDLGCTL,0,0);
    Vk_Escape:
      btnCancelClick(Self);
   end;
end;

procedure TfrmSetGrid.btnCancelClick(Sender: TObject);
begin
   theresult.OkFlag  :=False;
   blnCaptionCh      :=False;
   Close;
end;

procedure TfrmSetGrid.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,False);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
end;

procedure TfrmSetGrid.Scatter;
var
  i:integer;
begin
   //显示列
   sltGridFieldName :=TStringList.Create;
   sltCaptionchanged:=TStringList.Create;
   for I := 0 to grdSetGrid.ColumnCount -1 do
   begin
//     cklcusClass.Items.Add(grdSetGrid.Columns[I].caption);
//     cklcusClass.Checked[i]:=grdSetGrid.Columns[I].Visible;
     cklcusClass.AddItem(grdSetGrid.Columns[I].Caption, grdSetGrid.Columns[I]);
     cklcusClass.Checked[i]:=grdSetGrid.Columns[I].Visible;
     sltGridFieldName.Add(grdSetGrid.Columns[I].Name);
     sltCaptionchanged.Add('F');
   end;
end;

procedure TfrmSetGrid.btnSelectAllClick(Sender: TObject);
var
   I:integer;
begin
   for i:=0 to cklCusclass.Items.count-1 do
       cklcusClass.Checked[i]:=True;
end;

procedure TfrmSetGrid.btnCancleAllClick(Sender: TObject);
var
   I:integer;
begin
   for i:=0 to cklCusclass.Items.count-1 do
       cklcusClass.Checked[i]:=False;
end;

procedure TfrmSetGrid.cklCusclassDblClick(Sender: TObject);
var
   strColCaption: string;
begin
   if (_Language='CAPTIONE') and (_IsManager='T') then
   begin
      strColCaption:=cklCusclass.items[cklCusclass.ItemIndex];
      if KinputQuery('设置列标题','标题：',strColCaption) and (strColCaption<>cklCusclass.items[cklCusclass.ItemIndex])then
      begin
         cklCusclass.Items[cklCusclass.ItemIndex] := strColCaption;
         sltCaptionchanged[cklCusclass.ItemIndex]:='T';
         blnCaptionch:=true;
      end;
   end;  
end;

procedure TfrmSetGrid.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
   SC_DRAGMOVE:Longint=$F012;
begin
   ReleaseCapture;
   SendMessage(handle,wm_SysCommand,sc_DragMove,0);
end;

end.
