unit outinselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, KBitBtn, DbButtons, DBKINCGrids, StdCtrls, KGroupBox,
  GMSLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables, dxExEdtr,
  dxEdLib, dxDBELib, dxEditor, KinPickEdit,libproc,
  KDataSetProvider, DBClient, Menus, dxDBTLCl, dxGrClms;

type
  Tfrmoutinselect = class(TForm)
    KGroupBox1: TKGroupBox;
    KGroupBox2: TKGroupBox;
    ppmoutin: TPopupMenu;
    mitDelLocOld: TMenuItem;
    skuspec: TdxDBGridColumn;
    qryTmp: TKADOQuery;
    qryoutin: TKADOQuery;
    dtsoutin: TDataSource;
    btnselect: TKBitBtn;
    grdoutinselect: TdxDBGrid;
    piece: TdxDBGridColumn;
    grossweight: TdxDBGridColumn;
    skumodel: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    keyid: TdxDBGridColumn;
    inoutdays: TdxDBGridColumn;
    btnprint: TKBitBtn;
    edtCostCus: TdxButtonEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    dtdReceDateT: TdxDateEdit;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    locationbillno: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    operationdatein: TdxDBGridColumn;
    bz: TdxDBGridColumn;
    costin: TdxDBGridColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdLocinselectExit(Sender: TObject);
    procedure btnselectClick(Sender: TObject);
    procedure KBitBtn2Click(Sender: TObject);
    procedure grdoutinselectCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure btnprintClick(Sender: TObject);
    procedure cmbdisidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmainorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCostCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCostCusExit(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
  private
    { Private declarations }
    strsql,strsql1,strfilter,strfilter1:string;
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    procedure workcall(Callmode:Tdatastate);
    procedure DisableBrowse;
    procedure InitValues;
  public
    { Public declarations }
  end;
procedure workoutinselect(pstrjobno:string);
var
  frmoutinselect: Tfrmoutinselect;

implementation

{$R *.dfm}
uses datas,kindlg,main,libUserpub,libuser,GetDllPub, datasTmp,linprint;
var
  DataState:TDataState;
  setDisable:TsetInt;
  setPermission:TsetInt;
  strpJobno:string;
procedure workoutinselect(pstrjobno:string);
{模块调用入口}
begin
   if frmoutinselect <> nil then
   with frmoutinselect do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(Tfrmoutinselect, frmoutinselect);
   strpJobno:=pstrJobno;
   with frmoutinselect do
   begin
//初始化数据
      if strpJobno<>'' then
      begin
         strsql:='select item.jobno,item.sno,item.locationbillno,         '+chr(13)+chr(10)
                +'       item.skuname,item.skumodel,item.skuspec,         '+chr(13)+chr(10)
                +'       item.piece,item.grossweight, item.operationdate, '+chr(13)+chr(10)
                +'       operationdatein=initem.operationdate ,           '+chr(13)+chr(10)
                +'       inoutdays=datediff(day,initem.operationdate,item.operationdate),'+chr(13)+chr(10)
                +'       bz=case when costitem.costcd="ZXF"  then "√" else "" end, '+chr(13)+chr(10)
                +'       costin=isnull(costitem.costin,0),                  '+chr(13)+chr(10)
                //完成数
                +'       keyid=item.Jobno+rtrim(convert(varchar(4),item.sno)) '+chr(13)+chr(10)
                +'  from locationoutitem item (nolock)                    '+chr(13)+chr(10)
                +'       left join locationinitem initem(nolock)          '+chr(13)+chr(10)
                +'              on initem.jobno=item.jobnoin              '+chr(13)+chr(10)
                +'             and initem.sno=item.snoin                  '+chr(13)+chr(10)
                +'       left join costitem(nolock)                       '+chr(13)+chr(10)
                +'              on costitem.jobno=item.jobno              '+chr(13)+chr(10)
                +'             and costitem.skuid=item.skuid              '+chr(13)+chr(10)
                +'             and costitem.costcd="ZXF"                  '+chr(13)+chr(10)
                +' where 1=1                                              '+chr(13)+chr(10)
                +'   and item.jobno="'+strpJobno+'"                       '+chr(13)+chr(10)
                 ;
         qryoutin.Close;
         qryoutin.SQL.Clear;
         qryoutin.SQL.Add(strsql);
         qryoutin.open;  
      end;
   end;
   frmoutinselect.workcall(stBrowse);
   frmoutinselect.Show;
end;

procedure Tfrmoutinselect.WorkCall(CallMode:TDataState);
begin
{  DataState:=CallMode;
  with frmoutinselect do
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
          qryLocinselect.Edit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qryLocinselect.Append;
          EnableEdit;
          InitValues;
          edtmainorder.SetFocus;
          LampChange(lsEdit);
        end;
    end;
  end; }
end;

procedure Tfrmoutinselect.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure Tfrmoutinselect.InitValues;
{初始化时自动生成仓位代码}
begin
//
end;

procedure Tfrmoutinselect.btnCloseClick(Sender: TObject);
begin
    frmoutinselect.close;
end;

procedure Tfrmoutinselect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (DataState in setdcs) and not _AllowClose then
      Action:=caNone
   else
      Action:=caFree;
end;

procedure Tfrmoutinselect.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);

   SetDxDbGrid(grdoutinselect);
   qryoutin.Connection:=_adoconnection;
   qryTmp.connection:=_adoconnection;
end;

procedure Tfrmoutinselect.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   frmoutinselect:=nil;
end;

procedure Tfrmoutinselect.grdLocinselectExit(Sender: TObject);
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

procedure Tfrmoutinselect.btnselectClick(Sender: TObject);
begin
   strfilter:='';
   if edtCostCus.TextField<>'' then
   begin
      strfilter:=strfilter+'and item.costcusid="'+edtCostCus.TextField+'" ';
   end;  

   if (dtdReceDateF.Date=0)  then
   begin
      kMessageDlg('开始日期不能为空！', mtInformation, [mbOK], 0);
      dtdReceDateF.SetFocus;
      Exit;
   end;
   if (dtdReceDateT.Date=0)  then
   begin
      kMessageDlg('结束日期不能为空！', mtInformation, [mbOK], 0);
      dtdReceDateT.SetFocus;
      Exit;
   end;

   strsql:='select item.jobno,item.sno,item.locationbillno,         '+chr(13)+chr(10)
          +'       item.skuname,item.skumodel,item.skuspec,         '+chr(13)+chr(10)
          +'       item.piece,item.grossweight, item.operationdate, '+chr(13)+chr(10)
          +'       operationdatein=initem.operationdate ,           '+chr(13)+chr(10)
          +'       inoutdays=datediff(day,initem.operationdate,item.operationdate),'+chr(13)+chr(10)
          +'       bz=case when costitem.costcd="ZXF"  then "√" else "" end, '+chr(13)+chr(10)
          +'       costin=isnull(costitem.costin,0),                  '+chr(13)+chr(10)
          //完成数
          +'       keyid=item.Jobno+rtrim(convert(varchar(4),item.sno)) '+chr(13)+chr(10)
          +'  from locationoutitem item (nolock)                    '+chr(13)+chr(10)
          +'       left join locationinitem initem(nolock)          '+chr(13)+chr(10)
          +'              on initem.jobno=item.jobnoin              '+chr(13)+chr(10)
          +'             and initem.sno=item.snoin                  '+chr(13)+chr(10)
          +'       left join costitem(nolock)                       '+chr(13)+chr(10)
          +'              on costitem.jobno=item.jobno              '+chr(13)+chr(10)
          +'             and costitem.skuid=item.skuid              '+chr(13)+chr(10)
          +'             and costitem.costcd="ZXF"                  '+chr(13)+chr(10)
          +' where 1=1                                              '+chr(13)+chr(10)
          +'   and item.jobno not like "%kinnva%"                   '+chr(13)+chr(10)
          +'   and item.operationdate>="'+dtdReceDateF.Text+'"      '+chr(13)+chr(10)
          +'   and item.operationdate<="'+dtdReceDateT.Text+'"      '+chr(13)+chr(10)
          +strfilter  ;

   qryoutin.Close;
   qryoutin.sql.Clear;
   qryoutin.SQL.Add(strsql);
   qryoutin.Open;

end;

procedure Tfrmoutinselect.KBitBtn2Click(Sender: TObject);
begin
   frmoutinselect.Close;
end;

procedure Tfrmoutinselect.grdoutinselectCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[keyid.Index]=null) or (ANode.HasChildren) then exit;
   if (ANode.Values[bz.Index]='√') then
   begin
      AColor := $00C1DBC1;
   end;
   if (ANode.Values[bz.Index]='√') and (ANode.Values[inoutdays.Index]>7) then
   begin
      AColor := clRed;
   end;

   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;
end;

procedure Tfrmoutinselect.btnprintClick(Sender: TObject);
begin
   //
end;

procedure Tfrmoutinselect.cmbdisidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure Tfrmoutinselect.edtmainorderKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure Tfrmoutinselect.edtCostCusButtonClick(Sender: TObject;
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

procedure Tfrmoutinselect.edtCostCusExit(Sender: TObject);
begin
  if edtCostCus.Text='' then edtCostCus.TextField:='';
end;

procedure Tfrmoutinselect.mitDelLocOldClick(Sender: TObject);
begin
   pWorkFormDll('FINANCE',PChar('COSTITEM'+qryoutin.FieldByName('Jobno').AsString));
end;

end.
