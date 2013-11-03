unit Locinselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, KBitBtn, DbButtons, DBKINCGrids, StdCtrls, KGroupBox,
  GMSLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables, dxExEdtr,
  dxEdLib, dxDBELib, dxEditor, KinPickEdit,libproc,
  KDataSetProvider, DBClient, Menus, dxDBTLCl, dxGrClms;

type
  TfrmLocinselect = class(TForm)
    KGroupBox1: TKGroupBox;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    ppmadd: TPopupMenu;
    mitDelLocOld: TMenuItem;
    edtmainorder: TdxEdit;
    qtyperct: TdxDBGridColumn;
    locname: TdxDBGridButtonColumn;
    qryTmp: TKADOQuery;
    qrylocinskudetail: TKADOQuery;
    dtslocinskudetail: TDataSource;
    KBitBtn1: TKBitBtn;
    KBitBtn2: TKBitBtn;
    KGroupBox3: TKGroupBox;
    grdlocoutskudetail: TdxDBGrid;
    grdqtyperct: TdxDBGridColumn;
    grdallct: TdxDBGridColumn;
    qrylocoutskudetail: TKADOQuery;
    dtslocoutskudetail: TDataSource;
    KADOQuery2: TKADOQuery;
    grdlocinskudetail: TdxDBGrid;
    grdlocname: TdxDBGridColumn;
    grdjobno: TdxDBGridColumn;
    piece: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    grdquantity: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    skuname1: TdxDBGridColumn;
    disid: TdxDBGridColumn;
    quantitycp: TdxDBGridColumn;
    keyid: TdxDBGridColumn;
    quantitysy: TdxDBGridColumn;
    btnprint: TKBitBtn;
    lbldisid: TGMSStickyLabel;
    cmbdisid: TKinPickEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdLocinselectEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdLocinselectExit(Sender: TObject);
    procedure grdLocinselectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KBitBtn1Click(Sender: TObject);
    procedure KBitBtn2Click(Sender: TObject);
    procedure grdlocinskudetailCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure btnprintClick(Sender: TObject);
    procedure cmbdisidExit(Sender: TObject);
    procedure cmbdisidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmainorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
procedure workLocinselect;
var
  frmLocinselect: TfrmLocinselect;

implementation

{$R *.dfm}
uses datas,kindlg,main,libUserpub,libuser,GetDllPub, datasTmp,linprint;
var
  DataState:TDataState;
  setDisable:TsetInt;
  setPermission:TsetInt;
procedure workLocinselect;
{模块调用入口}
begin
   if frmLocinselect <> nil then
   with FrmLocinselect do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TFrmLocinselect, FrmLocinselect);
   with frmLocinselect do
   begin
      edtmainorder.SetFocus;
//初始化数据
{      ScrollAfterEdit:=True;
      setPermission:=[];
       strsql:=' select jobno,mainorder,customerno,qtyperct,    '+chr(13)+chr(10)
              +'        pltid,allct,locname,opdate,             '+chr(13)+chr(10)
              +'        opname,completeid                       '+chr(13)+chr(10)
              +'   from Locinselect(nolock)                        '+chr(13)+chr(10)
              +'  where 1=2                                     '+chr(13)+chr(10)
               ;
       qryLocinselect.Close;
       qryLocinselect.SQL.Clear;
       qryLocinselect.SQL.Add(strsql);
       qryLocinselect.open;  }
   end;
   FrmLocinselect.workcall(stBrowse);
   frmLocinselect.Show;
end;

procedure TfrmLocinselect.WorkCall(CallMode:TDataState);
begin
{  DataState:=CallMode;
  with frmLocinselect do
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

procedure TfrmLocinselect.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmLocinselect.InitValues;
{初始化时自动生成仓位代码}
begin
//
end;

procedure TfrmLocinselect.btnCloseClick(Sender: TObject);
begin
    FrmLocinselect.close;
end;

procedure TfrmLocinselect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (DataState in setdcs) and not _AllowClose then
      Action:=caNone
   else
      Action:=caFree;
end;

procedure TfrmLocinselect.FormCreate(Sender: TObject);
begin
   Height:=474;
   Width :=678;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox2);
   SetDxDbGrid(grdlocinskudetail);
   SetDxDbGrid(grdlocoutskudetail);
   qryLocinskudetail.Connection:=_adoconnection;
   qryLocoutskudetail.Connection:=_adoconnection;
   qryTmp.connection:=_adoconnection;
end;

procedure TfrmLocinselect.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   frmLocinselect:=nil;
end;

procedure TfrmLocinselect.grdLocinselectEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
{   Allow:=true;
   if not (DataState in Setdcs) then
      Allow:=False
   else if (DataState in Setdcs) then
   begin
      with grdLocinselect do
      begin
          if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='jobno') then
          begin
             Allow:=False;
          end else
             Allow:=True;
      end;
   end;}
end;

procedure TfrmLocinselect.grdLocinselectExit(Sender: TObject);
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

procedure TfrmLocinselect.grdLocinselectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  with TdxDBGrid(Sender) do
  begin
    if DataState in Setdcs then
    begin
      if State<>tsEditing then
      begin
        if (Key = VK_RETURN) and (ssCtrl in Shift)
          and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridButtonColumn) then
        begin
          ShowEditor;
          TdxDBGridButtonColumn(Columns[GetFocusedAbsoluteIndex(FocusedColumn)]).OnButtonClick(Sender,GetFocusedAbsoluteIndex(FocusedColumn));
          Key:=0;
        end else
        if (Key = VK_DOWN) and (ssAlt in Shift)
          and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridPickColumn) then
        begin
          ShowEditor;
          TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
          key:=0;
        end;
        if (Key = VK_Insert) and (ssCtrl in Shift) then
        begin
           if uppercase(Name)='GRDLocinselect' then
              mitAddLocOldClick(sender);
           key:=0;
        end;
      end;
    end;
  end;}
end;

procedure TfrmLocinselect.KBitBtn1Click(Sender: TObject);
begin
   strfilter:='';
   if edtmainorder.Text<>'' then
   begin
      strfilter:=strfilter+' and item.mainorder like "%'+edtmainorder.Text+'%"' ;
   end else
   begin
      KMessageDlg('请输入出仓单号！',mtWarning,[mbOK],0);
      ActiveControl:=edtmainorder;
      Exit;
   end;
   strsql:='select warefifo.jobno,warefifo.sno,warefifo.ldsno,warefifo.detailsno,warefifo.quantity,warefifo.skuname,  '
          +'       warefifo.qtyperct,warefifo.piece,  '
          +'       warefifo.locname ,warefifo.sealno, '
          //完成数
          +'       quantitycp=sum(isnull(locoutskudetail.quantity,0)), '
          +'       quantitysy=warefifo.quantity-sum(isnull(locoutskudetail.quantity,0)), '
          +'       keyid=warefifo.Jobno+rtrim(convert(varchar(4),warefifo.sno))+rtrim(convert(varchar(4),warefifo.ldsno))+rtrim(convert(varchar(4),warefifo.detailsno)) '
          +'  from warefifo left join locoutskudetail '
          +'                       on warefifo.jobnoout=locoutskudetail.jobno '
          +'                      and warefifo.snoout=locoutskudetail.sno '
          +'                      and warefifo.jobno=locoutskudetail.jobnoin '
          +'                      and warefifo.sno=locoutskudetail.snoin '
          +'                      and warefifo.ldsno=locoutskudetail.ldsnoin '
          +'                      and warefifo.detailsno=locoutskudetail.detailsnoin '
          +' where mainorderout like "%'+edtmainorder.Text+'%"'
          +' group by warefifo.jobno,warefifo.sno,warefifo.ldsno,warefifo.detailsno,warefifo.quantity,warefifo.skuname,  '
          +'       warefifo.qtyperct,warefifo.piece,  '
          +'       warefifo.locname ,warefifo.sealno, '
          +'       warefifo.Jobno+rtrim(convert(varchar(4),warefifo.sno))+rtrim(convert(varchar(4),warefifo.ldsno))+rtrim(convert(varchar(4),warefifo.detailsno)) ';
   qrylocinskudetail.Close;
   qrylocinskudetail.sql.Clear;
   qrylocinskudetail.SQL.Add(strsql);
   qrylocinskudetail.Open;

   strsql1:='select outdetail.skuname,outdetail.jobno,outdetail.qtyperct,outdetail.allct,outdetail.locname,outdetail.quantity,pldid=indetail.sealno,   '
           +'       outdetail.disid,outdetail.sno,outdetail.detailsnoin,outdetail.ldsnoin ,'//发货ID
           +'       keyid=outdetail.Jobno+convert(varchar(4),outdetail.sno)+convert(varchar(4),outdetail.ldsno)+convert(varchar(4),outdetail.detailsno) '
           +'  from locationout item(nolock), '
           +'       locoutskudetail outdetail(nolock), '
           +'       locinskudetail indetail (nolock) '
           +' where item.jobno=outdetail.jobno   '
           +'   and outdetail.jobnoin=indetail.jobno '
           +'   and outdetail.snoin=indetail.sno '
           +'   and outdetail.ldsnoin=indetail.ldsno '
           +'   and outdetail.detailsnoin=indetail.detailsno '
           +strfilter;
   qrylocoutskudetail.Close;
   qrylocoutskudetail.sql.Clear;
   qrylocoutskudetail.SQL.Add(strsql1);
   qrylocoutskudetail.Open;

end;

procedure TfrmLocinselect.KBitBtn2Click(Sender: TObject);
begin
   frmlocinselect.Close;
end;

procedure TfrmLocinselect.grdlocinskudetailCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[keyid.Index]=null) or (ANode.HasChildren) then exit;

   if trim(ANode.Values[quantitysy.Index])='0' then
   begin
      AColor := clInfoBk;
   end else
   if trim(ANode.Values[quantitysy.Index])<trim(ANode.Values[quantity.Index]) then
   begin
      AColor := clSkyBlue;
   end else
   begin
      AColor := $00C1DBC1;
   end;

   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;
end;

procedure TfrmLocinselect.btnprintClick(Sender: TObject);
begin
   if not qrylocoutskudetail.Active then
   begin
      KmessageDlg('请先按刷新数据按钮!',mtInformation,[mbOK],0);//'请先按刷新数据按钮!'
      exit;
   end else
   begin
      lbldisid.Visible:=True;
      cmbdisid.Visible:=True;
      KBitBtn1.Visible:=False;
      KBitBtn2.Visible:=False;

      cmbdisid.SetFocus;

      cmbdisid.Items.Clear;
      cmbdisid.ItemFields.Clear;
      cmbdisid.Items.Add('全部');
      cmbdisid.ItemFields.Add('all');
      OpenSql(qryTmp,'select distinct outdetail.disid '
              +'  from locationout item(nolock), '
              +'       locoutskudetail outdetail(nolock), '
              +'       locinskudetail indetail (nolock) '
              +' where item.jobno=outdetail.jobno   '
              +'   and outdetail.jobnoin=indetail.jobno '
              +'   and outdetail.snoin=indetail.sno '
              +'   and outdetail.ldsnoin=indetail.ldsno '
              +'   and outdetail.detailsnoin=indetail.detailsno '
              +strfilter);
       qryTmp.First;
       while not qryTmp.Eof do
       begin
          cmbdisid.Items.Add(qryTmp.FieldByName('disid').AsString);
          qryTmp.Next;
       end;
       qryTmp.Close;
       cmbdisid.ItemIndex:=0;
   end;
end;

procedure TfrmLocinselect.cmbdisidExit(Sender: TObject);
var
  lstPara: TStringList;
  strfiler1,strsql2:string;
begin
   lbldisid.Visible:=True;
   cmbdisid.Visible:=True;
   strfiler1:='';
   if (cmbdisid.Text<>'') and (cmbdisid.Text<>'全部') then
      strfiler1:=strfiler1+' and outdetail.disid="'+cmbdisid.Text+'"' ;

   lstPara := TStringList.Create;
   lstPara.Add('mainorder='+edtmainorder.Text);
   lstPara.Add('zdr='+_loginname);
   lstPara.Add('zdrq='+datetostr(getserverdate));


   strsql2:='select outdetail.skuname,outdetail.jobno,outdetail.qtyperct,outdetail.allct,outdetail.locname,outdetail.quantity,pldid=indetail.sealno,   '
           +'       outdetail.disid, '//发货ID
           +'       keyid=outdetail.Jobno+convert(varchar(4),outdetail.sno)+convert(varchar(4),outdetail.ldsno)+convert(varchar(4),outdetail.detailsno) '
           +'  from locationout item(nolock), '
           +'       locoutskudetail outdetail(nolock), '
           +'       locinskudetail indetail (nolock) '
           +' where item.jobno=outdetail.jobno   '
           +'   and outdetail.jobnoin=indetail.jobno '
           +'   and outdetail.snoin=indetail.sno '
           +'   and outdetail.ldsnoin=indetail.ldsno '
           +'   and outdetail.detailsnoin=indetail.detailsno '
           +strfilter+strfiler1;
   datatmp.qryTmp.Close;
   datatmp.qryTmp.SQL.Clear;
   datatmp.qryTmp.SQL.Add(strsql2);
   datatmp.qryTmp.Open;

   Worklinprint('900014','old','',dataTmp.qryTmp,nil,nil,lstpara);
   lbldisid.Visible:=false;
   cmbdisid.Visible:=false;
   KBitBtn1.Visible:=true;
   KBitBtn2.Visible:=true;

end;

procedure TfrmLocinselect.cmbdisidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinselect.edtmainorderKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinselect.mitDelLocOldClick(Sender: TObject);
begin
  try
    opensql(qryTmp,'exec ksp_locoutadd "'+qrylocoutskudetail.fieldbyname('jobno').AsString+'",    '
                                       +'  "'+qrylocoutskudetail.fieldbyname('sno').AsString+'", '
                                       +'  "'+qrylocoutskudetail.fieldbyname('ldsno').AsString+'",  '
                                       +'  "'+qrylocoutskudetail.fieldbyname('detailsnoin').AsString+'",'
                                       +'  "D"'
                                       );
  except
    qryTmp.Free;
    raise;
    exit;
  end;
end;

end.
