unit locationusing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, KGroupBox,
  DB, DBTables, DBClient, KDataSetProvider, DbButtons, ExtCtrls, dxExEdtr,
  dxEdLib, dxEditor, GMSLabel, KinPickEdit, Menus;

type
  Tfrmlocationusing = class(TForm)
    KGroupBox2: TKGroupBox;
    qryTmp: TKADOQuery;
    KGroupBox1: TKGroupBox;
    locname: TdxDBGridColumn;
    qrylocationusing: TKADOQuery;
    dtslocationusing: TDataSource;
    usingarea: TdxDBGridColumn;
    area: TdxDBGridColumn;
    grdlocationusing: TdxDBGrid;
    ppmprint: TPopupMenu;
    N1: TMenuItem;
    GMSStickyLabel3: TGMSStickyLabel;
    cmblocID: TdxButtonEdit;
    radBBtype: TKRadioGroup;
    usrate: TdxDBGridColumn;
    btnRefresh: TKBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure InitValues;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmblocIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmblocIDExit(Sender: TObject);
  private
    { Private declarations }
    strAccountID:string;
  public
    { Public declarations }
  end;

procedure Worklocationusing;

var
  frmlocationusing: Tfrmlocationusing;

implementation

{$R *.dfm}

uses  libproc,libUser,libuserPub,Datas,kindlg, main,GetUserRight,GetDllPub,dxGridOut;

procedure Worklocationusing;
var
  strSql,strTask:string;
  i:integer;
  lstList:TStringList;
begin
   if frmlocationusing<>nil then
   with frmlocationusing do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrmlocationusing, frmlocationusing);
   frmlocationusing.Show;
end;

procedure Tfrmlocationusing.FormCreate(Sender: TObject);
begin
   Height:=433;
   Width:=601;
   SetFormStyle(Self);
   SetDxDbGrid(grdlocationusing);
   SetGroupbox(KGroupBox1);
   qrylocationusing.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure Tfrmlocationusing.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key=Vk_Return then ReturnNext(Self);
//  case Key of
//    Vk_Escape:KeyDownControl(Key,btnClose);
//  end;
end;

procedure Tfrmlocationusing.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  frmlocationusing:=nil;
end;

procedure Tfrmlocationusing.btnCloseClick(Sender: TObject);
begin
   frmlocationusing.Close;
end;

procedure Tfrmlocationusing.btnOkClick(Sender: TObject);
var
   i:integer;
begin
   frmlocationusing.Close;
end;

procedure Tfrmlocationusing.InitValues;
begin
  //
end;

procedure Tfrmlocationusing.btnRefreshClick(Sender: TObject);
var
  strSql,strfilterSql:string;
  i:integer;
  lstList:TStringList;
begin
    i:=(radBBtype.ItemIndex+1)*3;
    strsql:=' ksp_locationusing @locid="'+cmblocID.TextField+'",   '
           +'                   @classid='+inttostr(i)+'    ';
    qrylocationusing.Close;
    qrylocationusing.Sql.Clear;
    qrylocationusing.Sql.Add(strsql);
    qrylocationusing.Open;
end;

procedure Tfrmlocationusing.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure Tfrmlocationusing.cmblocIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','');
   if qrySelect.FieldByName('LocID').AsString<>'NO' then
   begin
      cmblocID.TextField  :=qrySelect.FieldByName('ClassId').asstring;
      cmblocID.Text       :=qrySelect.FieldByName('LocName').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure Tfrmlocationusing.cmblocIDExit(Sender: TObject);
begin
  if cmblocID.Text='' then cmblocID.TextField:='';
end;

end.

