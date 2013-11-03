unit Disrepair;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, KGroupBox,
  DB, DBTables, DBClient, KDataSetProvider, DbButtons, ExtCtrls, dxExEdtr,
  dxEdLib, dxEditor, GMSLabel, KinPickEdit, Menus;

type
  TfrmDisrepair = class(TForm)
    KGroupBox2: TKGroupBox;
    locationbillno: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    shippercusname: TdxDBGridColumn;
    qryTmp: TKADOQuery;
    ToolPanel: TPanel;
    Bevel2: TBevel;
    btnClose: TKBitBtn;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    edtCus: TdxButtonEdit;
    cmbSKUName: TdxButtonEdit;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    edtCostCus: TdxButtonEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    cusname: TdxDBGridColumn;
    costcusname: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    btnPrint: TKBitBtn;
    qryDisrepair: TKADOQuery;
    dtsDisrepair: TDataSource;
    GMSStickyLabel16: TGMSStickyLabel;
    edtcustomerno: TdxEdit;
    cmbskumodel: TKinPickEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    edtskuspec: TdxEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    cmbskuclassname: TKinPickEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    edtpiecepro: TdxEdit;
    cusbillno: TdxDBGridColumn;
    ProPiece: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    skumodel: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    LotCode: TdxDBGridColumn;
    QualityName: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    quantityuom: TdxDBGridColumn;
    piece: TdxDBGridColumn;
    pieceuom: TdxDBGridColumn;
    volume: TdxDBGridColumn;
    volumeuom: TdxDBGridColumn;
    quantitysl: TdxDBGridColumn;
    Remark: TdxDBGridColumn;
    grdDisrepair: TdxDBGrid;
    ppmprint: TPopupMenu;
    N1: TMenuItem;
    ckbquantitysl: TdxCheckEdit;
    netweight: TdxDBGridColumn;
    netweightuom: TdxDBGridColumn;
    brokenmark: TdxDBGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCusButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure InitValues;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    strAccountID:string;
  public
    { Public declarations }
  end;

procedure WorkDisrepair;

var
  frmDisrepair: TfrmDisrepair;

implementation

{$R *.dfm}

uses  libproc,libUser,libuserPub,Datas,kindlg, main,GetUserRight,GetDllPub,dxGridOut;

procedure WorkDisrepair;
var
  strSql,strTask:string;
  i:integer;
  lstList:TStringList;
begin
   if frmDisrepair<>nil then
   with frmDisrepair do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmDisrepair, frmDisrepair);
   with frmDisrepair do
   begin
      InitdbPick(cmbskumodel,'Codelib','codename','codename','CodeClass="55" ');
      InitdbPick(cmbskuclassname,'Codelib','codename','codename','CodeClass="56" ');
   end;
   frmDisrepair.Show;
end;

procedure TfrmDisrepair.FormCreate(Sender: TObject);
begin
   Height:=493;
   Width :=794;
   SetFormStyle(Self);
   SetDxDbGrid(grdDisrepair);
   SetGroupbox(KGroupBox1);
   qryDisrepair.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmDisrepair.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  case Key of
    Vk_Escape:KeyDownControl(Key,btnClose);
  end;
end;

procedure TfrmDisrepair.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  frmDisrepair:=nil;
end;

procedure TfrmDisrepair.btnCloseClick(Sender: TObject);
begin
   frmDisrepair.Close;
end;

procedure TfrmDisrepair.btnOkClick(Sender: TObject);
var
   i:integer;
begin
   frmDisrepair.Close;
end;


procedure TfrmDisrepair.edtCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmDisrepair.cmbSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetSkuSelect('','','A');
   if qrySelect.FieldByName('skuid').AsString<>'' then
   begin
      cmbSKUName.Text:=qrySelect.FieldByName('skuname').AsString;
      cmbSKUName.TextField:=qrySelect.FieldByName('classid').AsString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmDisrepair.edtCostCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      edtCostCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      edtCostCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmDisrepair.InitValues;
begin
  //
end;

procedure TfrmDisrepair.btnRefreshClick(Sender: TObject);
var
  strSql,strfilterSql:string;
  i:integer;
  lstList:TStringList;
begin
   if dtdReceDateF.Date>0 then //开始时间
      strfilterSql:=strfilterSql+' and convert(datetime,convert(char(10),detail.operationdate,102))>="'+dtdReceDateF.Text+'" ';
   if dtdReceDateT.Date>0 then   //结束时间
      strfilterSql:=strfilterSql+' and convert(datetime,convert(char(10),detail.operationdate,102))<="'+dtdReceDateT.Text+'" ';
   if ckbquantitysl.Checked then
      strfilterSql:=strfilterSql+' and isnull(detail.quantitysl,0)<>0 ';

   strfilterSql:=strfilterSql+IIF(edtCus.Text<>'',         ' and detail.cusid="'+edtCus.TextField+'"  ',' ')
                             +IIF(edtCostCus.Text<>'',     ' and detail.costcusid="'+edtCostCus.TextField+'" ',' ')
                             +IIF(edtcustomerno.Text<>'',  ' and #lskskuname.customerno like "%'+edtcustomerno.Text+'%"  ',' ')
                             +IIF(cmbskumodel.Text<>'',    ' and #lskskuname.skumodel="'+cmbskumodel.Text+'" ',' ')
                             +IIF(edtskuspec.Text<>'',     ' and #lskskuname.skuspec="'+edtskuspec.Text+'" ',' ')
                             +IIF(cmbskuclassname.Text<>'',' and #lskskuname.skuclassname="'+cmbskuclassname.Text+'" ',' ')
                             +IIF(edtpiecepro.Text<>'',    ' and #lskskuname.piecepro="'+edtpiecepro.Text+'" ',' '
                             );
   ExecSql(qryTmp,'     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                         +'  where id=object_id("tempdb..#lskskuname") and sysstat & 0xf=3) '+chr(13)+chr(10)
                         +'   drop table #lskskuname  '+chr(13)+chr(10)
                         +' select skuid,customerno,skumodel,skuspec,piecepro,skuclassname '+chr(13)+chr(10)
                         +'   into #lskskuname from sku (nolock)  '+chr(13)+chr(10)
                         +' where classid like "'+cmbSKUName.TextField+'%" '
                         +'  '
                         );
   strsql:='     if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
           +'  where id=object_id("tempdb..#lskware") and sysstat & 0xf=3) '+chr(13)+chr(10)
           +'   drop table #lskware '+chr(13)+chr(10)
           +'select detail.jobno,detail.operationdate,detail.isbond,detail.manufacturedate, '+chr(13)+chr(10)
           +'       detail.qualityname,detail.quantityuom,detail.quantity,detail.piece,detail.pieceuom,detail.weightuom,detail.volume,detail.volumeuom,detail.netweight,'+chr(13)+chr(10)
           +'       detail.costcusname,detail.cusname,detail.shippercusname,detail.skuname,detail.locname,quantitysl=isnull(detail.quantitysl,0), '+chr(13)+chr(10)
           +'       detail.mainorder,detail.cusbillno,detail.locationbillno,detail.customsno,detail.LotCode,detail.remark,locationin.brokenmark, '+chr(13)+chr(10)
//           +'       ProPiece=case when convert(numeric(16,1),isnull(detail.piecetask,0))<>0 then convert(varchar,convert(numeric(16,1),detail.quantitytask/detail.piecetask)) else null end,'
           +'       stockdate=datediff(day,detail.operationdate,convert(datetime,"'+datetostr(date)+'"))+1, '+chr(13)+chr(10)
           +'       goodsDate=datediff(day,detail.ManufactureDate,convert(datetime,"'+datetostr(date)+'"))+1, '+chr(13)+chr(10)
           +'       #lskskuname.customerno,#lskskuname.skuspec,#lskskuname.piecepro,#lskskuname.skuclassname,#lskskuname.skumodel '+chr(13)+chr(10)
           +'  into #lskware   '+chr(13)+chr(10)
           +'  from locationinitem detail  (nolock)   '+chr(13)+chr(10)
           +',#lskskuname (nolock) ,locationin (nolock) '
           +' where 1=1 '+chr(13)+chr(10)
           +' and detail.skuid=#lskskuname.skuid '
           +' and detail.jobno=locationin.jobno'
           +' and isnull(locationin.isbroken,"F")="T" '
           +strfilterSql
           +' select * from #lskware  '
           ;
    qryDisrepair.Close;
    qryDisrepair.SQL.Clear;
    qryDisrepair.SQL.Add(strsql);
    qryDisrepair.Open;
end;

procedure TfrmDisrepair.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmDisrepair.N1Click(Sender: TObject);
var
   lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   lstpara.Add('STDate=统计日期:'+dtdReceDateF.Text+' 到 '+dtdReceDateT.Text);
   WorkdxGridOut(grdDisrepair,lstPara,'破损查询报表');
end;

end.

