unit OperateFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DbButtons, KBitBtn, ExtCtrls, StdCtrls, KGroupBox, dxCntner,libuserPub,
  dxTL, dxDBCtrl, dxDBGrid, DragBar, DB, DBTables, dxExEdtr, dxEdLib,libBb,
  dxDBELib, dxEditor, KinPickEdit, GMSLabel,libproc,libuser, Menus,KDataSetProvider,
  DBClient, dxPageControl, dxDBTLCl, dxGrClms;

type
  TfrmOperateFind = class(TForm)
    KGroupBox1: TKGroupBox;
    KGroupBox2: TKGroupBox;
    DragBar1: TDragBar;
    edtlocnameold: TdxButtonEdit;
    grdcost: TdxDBGrid;
    ToolPanel: TPanel;
    Bevel2: TBevel;
    btnClose: TKBitBtn;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    btnPrint: TKBitBtn;
    edtlocnamenew: TdxButtonEdit;
    qryTmp: TKADOQuery;
    cmblocnameold: TdxEdit;
    cmbopname: TKinPickEdit;
    dtdopdateF: TdxDateEdit;
    qryOperateFind: TKADOQuery;
    dtsOperateFind: TDataSource;
    KBitBtn1: TKBitBtn;
    cmbchoice: TKinPickEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    dtdopdateT: TdxDateEdit;
    locnameold: TdxDBGridColumn;
    locnamenew: TdxDBGridColumn;
    opdate: TdxDBGridColumn;
    opname: TdxDBGridColumn;
    username: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cmbchoiceExit(Sender: TObject);
    procedure edtlocnameoldButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtlocnameoldExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtlocnamenewExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtlocnamenewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    strYear,strMonth,strDay:Word;
    strSql :string;
    procedure GetSql(Sender: TObject);
  public
    { Public declarations }
  end;

procedure workOperateFind;

var
  frmOperateFind: TfrmOperateFind;

implementation

{$R *.dfm}

uses main,KinDlg,find,GetDllPub,dxGridOut;

var
   DataState:TDataState;
   FindItem: TFindItem;

procedure workOperateFind;
var
  year,month,day:word;
begin
  if frmOperateFind <> nil then
  with frmOperateFind do
  begin
    if WindowState=wsMinimized then
       WindowState:=wsNormal;
    Show;
    Exit;
  end;
  Application.CreateForm(TFrmOperateFind, frmOperateFind);
  with frmOperateFind do
  begin
    cmbopname.Items.Clear;
    cmbopname.ItemFields.Clear;
    opensql(qrytmp,'select loginid,loginname from users (nolock)');
    qrytmp.First;
    while not qrytmp.Eof do
    begin
       cmbopname.Items.Add(qrytmp.fieldbyname('loginname').asstring);
       cmbopname.ItemFields.Add(qrytmp.fieldbyname('loginid').asstring);
       qrytmp.Next;
    end;
    qryTmp.Close;

    DecodeDate(Date,year,month,day);
  end;
  frmOperateFind.Show;
end;

procedure TfrmOperateFind.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmOperateFind.FormCreate(Sender: TObject);
begin
   Height:=469;
   Width :=639;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdcost);
   qryOperateFind.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmOperateFind.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   frmOperateFind:=nil;
end;

procedure TfrmOperateFind.btnCloseClick(Sender: TObject);
begin
   frmOperateFind.Close;
end;

procedure TfrmOperateFind.GetSql(Sender: TObject);
var
   strfind :integer;
   strFilter : string;
begin
   strFilter:='';

   if dtdopdateF.Date<>0 then
      strFilter:=strFilter+' and convert(char,opdate,102)>="'+dtdopdateF.Text+'"  '+chr(13)+chr(10);
   if dtdopdateT.Date<>0 then
      strFilter:=strFilter+' and convert(char,opdate,102)<="'+dtdopdateT.Text+'"  '+chr(13)+chr(10);
   if cmblocnameold.Text<>'' then
      strFilter:=strFilter+' and isnull(loctype,"F")<>"T" and locnameold like "%'+cmblocnameold.Text+'%"  '+chr(13)+chr(10);
   if edtlocnameold.textfield<>'' then
      strFilter:=strFilter+' and isnull(loctype,"F")<>"F" and locnameold like "%'+edtlocnameold.Text+'%" '+chr(13)+chr(10);
   if edtlocnamenew.Text<>'' then
      strFilter:=strFilter+' and locnamenew like "%'+edtlocnamenew.Text+'%" '+chr(13)+chr(10);
   if cmbopname.Text<>'' then
      strFilter:=strFilter+' and opname like "%'+cmbopname.Text+'%" '+chr(13)+chr(10);

   strSql:='select locnameold=case when exists(select 1 from location where locid=locnameold)'+chr(13)+chr(10)
          +'                       then (select locname from location where locid=locnameold) '+chr(13)+chr(10)
          +'                       else locnameold end,  '+chr(13)+chr(10)
          +'       locnamenew=case when exists(select 1 from location where locid=locnamenew) '+chr(13)+chr(10)
          +'                       then (select locname from location where locid=locnamenew) '+chr(13)+chr(10)
          +'                       else locnamenew end,                             '+chr(13)+chr(10)
          +'       opname,opdate,username,        '+chr(13)+chr(10)
          +'       keyid=convert(varchar,jobno)+locnameold+locnamenew   '+chr(13)+chr(10)
          +'  from locmoveop (nolock)                                   '+chr(13)+chr(10)
          +' where 1=1                                                  '+chr(13)+chr(10)
          +strFilter
          ;
end;

procedure TfrmOperateFind.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  case Key of
{    Ord('T'):KeyDownControl(Key,btnFirst);
    Ord('P'):KeyDownControl(Key,btnPrior);
    Ord('N'):KeyDownControl(Key,btnNext);
    Ord('B'):KeyDownControl(Key,btnLast);
    Ord('U'):KeyDownControl(Key,btnRefresh);

    Ord('F'):KeyDownControl(Key,btnFind);
    Ord('R'):KeyDownControl(Key,btnRefind);}

    Vk_Escape:KeyDownControl(Key,btnClose);
  end;
end;

procedure TfrmOperateFind.btnPrintClick(Sender: TObject);
var
  lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdcost,lstPara,'移仓操作查询');
end;

procedure TfrmOperateFind.btnRefreshClick(Sender: TObject);
begin
   GetSql(Sender);
   qryOperateFind.Close;
   qryOperateFind.Sql.Clear;
   qryOperateFind.Sql.Add(strSql);
   qryOperateFind.Open;
end;

procedure TfrmOperateFind.cmbchoiceExit(Sender: TObject);
begin
   if cmbchoice.Text='源仓位' then
   begin
      edtlocnameold.Visible:=true;
      cmblocnameold.Visible:=false;
      edtlocnamenew.Visible:=false;
      cmbopname.Visible:=false;
      dtdopdateF.Visible:=false;
      dtdopdateT.Visible:=false;
   end else
   if cmbchoice.Text='托盘号' then
   begin
      edtlocnameold.Visible:=false;
      cmblocnameold.Visible:=true;
      edtlocnamenew.Visible:=false;
      cmbopname.Visible:=false;
      dtdopdateF.Visible:=false;
      dtdopdateT.Visible:=false;
   end else
   if cmbchoice.Text='新仓位' then
   begin
      edtlocnameold.Visible:=false;
      cmblocnameold.Visible:=false;
      edtlocnamenew.Visible:=true;
      cmbopname.Visible:=false;
      dtdopdateF.Visible:=false;
      dtdopdateT.Visible:=false;
   end else
   if cmbchoice.Text='操作员' then
   begin
      edtlocnameold.Visible:=false;
      cmblocnameold.Visible:=false;
      edtlocnamenew.Visible:=false;
      cmbopname.Visible:=true;
      dtdopdateF.Visible:=false;
      dtdopdateT.Visible:=false;
   end else
   if cmbchoice.Text='操作日期' then
   begin
      edtlocnameold.Visible:=false;
      cmblocnameold.Visible:=false;
      edtlocnamenew.Visible:=false;
      cmbopname.Visible:=false;
      dtdopdateF.Visible:=true;
      dtdopdateT.Visible:=true;
   end;
end;

procedure TfrmOperateFind.edtlocnameoldButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      edtlocnameold.TextField  :=qrySelect.FieldByName('classid').asstring;
      edtlocnameold.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmOperateFind.edtlocnameoldExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtlocnameold.Text<>'' then
   begin
      opensql(qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+edtlocnameold.Text+'"+"%"') ;
      if qryTmp.RecordCount>0 then
      begin
         edtlocnameold.Text:=qryTmp.fieldbyname('locname').asstring;
         edtlocnameold.Textfield:=qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            edtlocnameold.TextField  :=qrySelect.FieldByName('locid').asstring;
            edtlocnameold.Text       :=qrySelect.FieldByName('locname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmOperateFind.edtlocnamenewExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtlocnamenew.Text<>'' then
   begin
      opensql(qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+edtlocnamenew.Text+'"+"%"') ;
      if qryTmp.RecordCount>0 then
      begin
         edtlocnamenew.Text:=qryTmp.fieldbyname('locname').asstring;
         edtlocnamenew.Textfield:=qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            edtlocnamenew.TextField  :=qrySelect.FieldByName('locid').asstring;
            edtlocnamenew.Text       :=qrySelect.FieldByName('locname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmOperateFind.edtlocnamenewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      edtlocnamenew.TextField  :=qrySelect.FieldByName('classid').asstring;
      edtlocnamenew.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);
end;

end.

