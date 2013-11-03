unit Syslocfind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, KBitBtn, DbButtons, DBKINCGrids, StdCtrls, KGroupBox,
  GMSLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables, dxExEdtr,
  dxEdLib, dxDBELib, dxEditor, KinPickEdit,libproc,
  KDataSetProvider, DBClient, Menus, dxDBTLCl, dxGrClms;

type
  TfrmSyslocfind = class(TForm)
    KGroupBox1: TKGroupBox;
    KGroupBox2: TKGroupBox;
    ppmadd: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    qryTmp: TKADOQuery;
    KBitBtn1: TKBitBtn;
    KBitBtn2: TKBitBtn;
    qrysyslocfind: TKADOQuery;
    dtssyslocfind: TDataSource;
    grdSyslocfind: TdxDBGrid;
    locname: TdxDBGridColumn;
    edtprint: TKBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdSyslocfindExit(Sender: TObject);
    procedure KBitBtn1Click(Sender: TObject);
    procedure KBitBtn2Click(Sender: TObject);
    procedure grdSyslocfindEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure edtprintClick(Sender: TObject);
  private
    { Private declarations }
    strsql,strsql1,strfilter,strfilter1:string;
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
  public
    { Public declarations }
  end;
procedure workSyslocfind;
var
  frmSyslocfind: TfrmSyslocfind;

implementation

{$R *.dfm}
uses datas,kindlg,main,libUserpub,libuser,GetDllPub, datasTmp,dxGridOut;
var
  DataState:TDataState;
  setDisable:TsetInt;
  setPermission:TsetInt;
procedure workSyslocfind;
{模块调用入口}
begin
   if frmSyslocfind <> nil then
   with FrmSyslocfind do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TFrmSyslocfind, FrmSyslocfind);
   with frmSyslocfind do
   begin
      //
   end;
   frmSyslocfind.Show;
end;

procedure TfrmSyslocfind.btnCloseClick(Sender: TObject);
begin
    FrmSyslocfind.close;
end;

procedure TfrmSyslocfind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (DataState in setdcs) and not _AllowClose then
      Action:=caNone
   else
      Action:=caFree;
end;

procedure TfrmSyslocfind.FormCreate(Sender: TObject);
begin
   Height:=474;
   Width :=678;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdSyslocfind);
   qrysyslocfind.Connection:=_adoconnection;
   qryTmp.connection:=_adoconnection;
end;

procedure TfrmSyslocfind.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   frmSyslocfind:=nil;
end;

procedure TfrmSyslocfind.grdSyslocfindExit(Sender: TObject);
begin
   with TdxDBGrid(Sender) do
   try
      if Datalink.DataSet.State in  [dsInsert,dsEdit] then
      begin
         Datalink.DataSet.Post;
      end;
   except
      SetFocus;
      raise;
   end;
end;

procedure TfrmSyslocfind.KBitBtn1Click(Sender: TObject);
begin
   strsql:='select locname,locid                                          '+chr(13)+chr(10)
          +'  from location                                               '+chr(13)+chr(10)
          +' where not exists(select 1 from locationindetail                                   '+chr(13)+chr(10)
          +'                       where location.locid=locationindetail.locid                              '+chr(13)+chr(10)
          +'                         and isnull(locationindetail.quantity,0)-isnull(locationindetail.quantitydo,0)<>0)           '+chr(13)+chr(10)
          +'   and isnull(isdetail,"F")<>"F"                                                                '+chr(13)+chr(10)
          +strfilter
          ;
   qrysyslocfind.Close;
   qrysyslocfind.sql.Clear;
   qrysyslocfind.SQL.Add(strsql);
   qrysyslocfind.Open;
end;

procedure TfrmSyslocfind.KBitBtn2Click(Sender: TObject);
begin
   frmSyslocfind.Close;
end;

procedure TfrmSyslocfind.grdSyslocfindEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=True;
end;

procedure TfrmSyslocfind.edtprintClick(Sender: TObject);
var
  lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdSyslocfind,lstPara,'空库位表');
end;

end.
