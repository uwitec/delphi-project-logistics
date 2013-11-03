unit SmsModel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, KBitBtn, DbButtons, DBKINCGrids, StdCtrls, KGroupBox,
  GMSLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables, dxExEdtr,
  dxEdLib, dxDBELib, dxEditor, KinPickEdit,libproc,
  KDataSetProvider, DBClient;

type
  TfrmSmsModel = class(TForm)
    Toolpanel: TPanel;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    Bevel2: TBevel;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    Bevel3: TBevel;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    Bevel4: TBevel;
    btnClose: TKBitBtn;
    KGroupBox1: TKGroupBox;
    grdSmsModel: TdxDBGrid;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    edtModelcd: TdxDBEdit;
    edtModelname: TdxDBEdit;
    KGroupBox12: TKGroupBox;
    memremark: TdxDBMemo;
    sno: TdxDBGridColumn;
    Modelname: TdxDBGridColumn;
    MScontent: TdxDBGridColumn;
    udsSmsModel: TKadoUpdateSql;
    dtsSmsModel: TDataSource;
    qrySmsModel: TKADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    strsql:string;
    procedure workcall(Callmode:Tdatastate);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    procedure InitValues;
  public
    { Public declarations }
  end;
procedure workSmsModel;
var
  frmSmsModel: TfrmSmsModel;

implementation

{$R *.dfm}
uses datas,kindlg,main,libUserpub,libuser;
var
  DataState:TDataState;
  setDisable:TsetInt;
  setPermission:TsetInt;
procedure workSmsModel;
{模块调用入口}
begin
   if frmSmsModel <> nil then
   with FrmSmsModel do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TFrmSmsModel, FrmSmsModel);
   with frmSmsModel do
   begin
//初始化数据
      strsql:=' select * from SmsModel (nolock) ';
      qrySmsModel.Close;
      qrySmsModel.Sql.Clear;
      qrySmsModel.Sql.Add(strSql);
      qrySmsModel.Open;
      setPermission:=[];
   end;
   FrmSmsModel.workcall(stBrowse);
   frmSmsModel.Show;
end;

procedure TfrmSmsModel.WorkCall(CallMode:TDataState);
begin
  DataState:=CallMode;
  with frmSmsModel do
  begin
    case DataState of
      stBrowse:
        begin
          DisableEdit;
          DisableBrowse;
          LampChange(lsBrowse);
        end;
      stEdit:
        begin
          EnableEdit;
          qrySmsModel.Edit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qrySmsModel.Append;
          EnableEdit;
          InitValues;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

function  TfrmSmsModel.Gather:boolean;
{变量值更新数据库前,对值处理过程}
begin
   Result:=False;
   if edtModelcd.Text='' then
   begin
     ActiveControl:=edtModelcd;
     KMessagedlg('模版代码不能为空，必须填写！',mtWarning,[MbOk],0);
     exit;
   end;
   if edtModelname.Text='' then
   begin
     ActiveControl:=edtModelname;
     KMessagedlg('模版名称不能为空，必须填写！',mtWarning,[MbOk],0);
     exit;
   end;
   Result:=True;
end;

procedure TfrmSmsModel.EnableEdit;
{修改数据状态，需ENABLE的动作}
begin
   setDisable:=[];
   LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);
   if DataState=stInsert then edtModelcd.SetFocus;
end;

procedure TfrmSmsModel.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
   setDisable:=setPermission;
   if qrySmsModel.RecordCount=0 then setDisable:=setDisable+[2,4];
   libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
   if qrySmsModel.RecordCount=0 then setDisable:=setDisable-[2,4];
end;

procedure TfrmSmsModel.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmSmsModel.InitValues;
{初始化时自动生成仓位代码}
begin
//
end;

procedure TfrmSmsModel.btnCloseClick(Sender: TObject);
begin
   FrmSmsModel.close;
end;

procedure TfrmSmsModel.btnEditClick(Sender: TObject);
begin
   WorkCall(stEdit);
end;

procedure TfrmSmsModel.btnAddClick(Sender: TObject);
begin
   WorkCall(stInsert);
end;

procedure TfrmSmsModel.btnDeleteClick(Sender: TObject);
begin
   if not JudgeCodeIfDetele('sno',
                            qrySmsModel.FieldByName('sno').AsString)
      then exit;
   if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
   _ADOConnection .Starttransaction;
   try
     TdxDBGridNode(grdSmsModel.FocusedNode).Delete;
     qrySmsModel.ApplyUpdates;
     _ADOConnection.Commit;
   except
     if _ADOConnection.InTransaction then
        _ADOConnection.Rollback;
     raise;
     Exit;
   end;
   qrySmsModel.CommitUpdates;
   WorkCall(stBrowse);
end;

procedure TfrmSmsModel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (DataState in setdcs) and not _AllowClose then
      Action:=caNone
   else
      Action:=caFree;
end;

procedure TfrmSmsModel.FormCreate(Sender: TObject);
begin
   Height:=480;
   Width:=618;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdSmsModel);
   qrySmsModel.Connection:=_ADOConnection;
end;

procedure TfrmSmsModel.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   frmSmsModel:=nil;
end;

procedure TfrmSmsModel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   if DataState = stBrowse then
   begin
     case Key of
       Ord('T'):KeyDownControl(Key,btnFirst);
       Ord('P'):KeyDownControl(Key,btnPrior);
       Ord('N'):KeyDownControl(Key,btnNext);
       Ord('B'):KeyDownControl(Key,btnLast);
       Ord('U'):KeyDownControl(Key,btnRefresh);

       Ord('E'):KeyDownControl(Key,btnEdit);
       Ord('A'):KeyDownControl(Key,btnAdd);
       Ord('D'):KeyDownControl(Key,btnDelete);

       Vk_Escape:KeyDownControl(Key,btnClose);
     end;
   end else
   begin
     case Key of
       Vk_Escape:
        frmSmsModel.btnCancel.SetFocus;
       Vk_End,Ord('W'):
        if ssCtrl in Shift then
          frmSmsModel.btnSave.SetFocus;
     end;
   end;
end;

procedure TfrmSmsModel.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then
   begin
     _ADOConnection.StartTransaction;
     try
       qrySmsModel.Post;
       qrySmsModel.ApplyUpdates;
       _ADOConnection.Commit;
     except
       if _ADOConnection.InTransaction then
          _ADOConnection.Rollback;
       Raise;
       Exit;
     end;
     qrySmsModel.CommitUpdates;
     WorkCall(stBrowse);
     grdSmsModel.Refresh;
   end;
end;

procedure TfrmSmsModel.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then
      Exit;
   qrySmsModel.CancelUpdates;
   WorkCall(stBrowse);
end;

procedure TfrmSmsModel.btnRefreshClick(Sender: TObject);
var
   strSmsModel:string;
begin
   strSmsModel:=qrySmsModel.FieldByName('ModelName').AsString;
   qrySmsModel.DisableControls;
   qrySmsModel.Close;
   qrySmsModel.Open;
   try
      qrySmsModel.Locate('ModelName', strSmsModel, [loCaseInsensitive, loPartialKey]);
   except
      qrySmsModel.Last;
   end;
   qrySmsModel.EnableControls;
end;

end.
