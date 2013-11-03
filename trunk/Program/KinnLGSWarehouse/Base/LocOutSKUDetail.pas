unit LocOutSKUDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, KinPickEdit, dxDBELib, dxCntner, dxEditor,
  DBKINCGrids, KSText, ComCtrls, frstatus, StdCtrls, KGroupBox, Menus,
  DBTables, DB,libuser,libproc, KBitBtn, KUpdateSql, GMSLabel, ExtCtrls,
  KDataSetProvider, DBClient, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  Buttons;

type
  TfrmLocOutSKUDetail = class(TForm)
    ppmSKUDetail: TPopupMenu;
    mitSkuAdd: TMenuItem;
    mitSkuDel: TMenuItem;
    dtslocOutskudetail: TDataSource;
    grdSKUDetail: TdxDBGrid;
    edtSNO: TdxDBGridColumn;
    edtSKUSerialNO: TdxDBGridColumn;
    edtQUANTITY: TdxDBGridCurrencyColumn;
    edtSKUName: TdxDBGridButtonColumn;
    KGroupBox1: TKGroupBox;
    skubrand: TdxDBGridColumn;
    edtdepth: TdxDBGridColumn;
    edtwidth: TdxDBGridColumn;
    edtheight: TdxDBGridColumn;
    UnKnowQ: TdxDBGridCheckColumn;
    btnSaveClose: TKBitBtn;
    KBitBtn5: TKBitBtn;
    edtqualityname: TdxDBGridButtonColumn;
    cmbQUANTITYUOM: TdxDBGridKinPickColumn;
    sizeuom: TdxDBGridKinPickColumn;
    ppmSkuSelect: TPopupMenu;
    mitSku: TMenuItem;
    mitOrder: TMenuItem;
    qryTmp: TKADOQuery;
    qrytmp1: TKADOQuery;
    lotcode: TdxDBGridColumn;
    conno: TdxDBGridColumn;
    remark: TdxDBGridBlobColumn;
    mitcopy: TMenuItem;
    mitplaste: TMenuItem;
    mitColumnset: TMenuItem;
    Panel2: TPanel;
    KGroupBox12: TKGroupBox;
    edtConnoScan: TdxEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    edtQuantityP: TdxCalcEdit;
    edtNetWeightP: TdxCalcEdit;
    edtCustomerNo: TdxButtonEdit;
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    btnInput: TKBitBtn;
    ckbTotal: TdxCheckEdit;
    qtyperct: TdxDBGridColumn;
    allct: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    grossweight: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
    piece: TdxDBGridColumn;
    manufacturedate: TdxDBGridColumn;
    xh: TdxDBGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdSKUDetailChangeNodeEx(Sender: TObject);
    procedure grdSKUDetailEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdSKUDetailEnter(Sender: TObject);
    procedure grdSKUDetailExit(Sender: TObject);
    procedure grdSKUDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitSkuAddClick(Sender: TObject);
    procedure mitSkuDelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure KBitBtn5Click(Sender: TObject);
    procedure btnSaveCloseClick(Sender: TObject);
    procedure edtSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtqualitynameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitSkuClick(Sender: TObject);
    procedure mitplasteClick(Sender: TObject);
    procedure mitColumnsetClick(Sender: TObject);
    procedure edtCustomerNoExit(Sender: TObject);
    procedure edtCustomerNoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtQUANTITYValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
  private
    { Private declarations }
    iscopy:Boolean;//是否复制
    strupdtablename:string;
    blnskucheck:Boolean;//商品是否经过检验
    blnSelect:Boolean;  //控件直接输入控制
    strskuid,strskuname,strlocid,strlocname:string;//获取传递的参数
    strpskuid,strpskuname,strpcustomerno:string;//传递skuref参数
    strcustomerno:string;//商品编码
    qryLocOutSKUDetail,qrylocationoutdetail:TKADOQuery;//传入qry操作
    strjobno,strjobnoin:string;
    intsno,intldsno,intsnoin,intldsnoin:Integer;
    procedure EnableEdit;
    procedure DisableEdit;
    procedure WorkCall(CallMode:TDataState);
    procedure grdSKUDetailBeforeInsert;
    function  GetScale(pstrUomVolume,pstrUomSize:String):Extended;
    function  CustomerNoCheck(pCustomerNo:string):Boolean;
    procedure SkuInsert(pskuid,pskuname:string);
  public
    { Public declarations }
    isupdate:Boolean;
    maxdetailsno:Integer;
    procedure CreateParams(var Params: TCreateParams);override;
  end;

procedure workLocOutSKUDetail(Callmode:TdataState;pstrjobno,pcustomerno:string;pintsno,pintldsno,pmaxdetailsno:integer;
                            pqryLocOutSKUDetail,pqryLocationOutDetail:TKADOQuery);

var
  frmLocOutSKUDetail: TfrmLocOutSKUDetail;

implementation

{$R *.dfm}

uses main,datas,Kindlg,libuserPub,LocSkuDetailSelect,GetDllPub,SetGrid,SkuRef;

var
   DataState:TDataState;
   strsql:string;
   strjobnoin:string; //对应进仓工作号
   qryuom:TKADOQuery;

procedure workLocOutSKUDetail(Callmode:TdataState;pstrjobno,pcustomerno:string;pintsno,pintldsno,pmaxdetailsno:integer;
                            pqryLocOutSKUDetail,pqryLocationOutDetail:TKADOQuery);
//pqryuom:获取商品信息中的单位信息.
begin
   if frmLocOutSKUDetail <> nil then
   with frmLocOutSKUDetail do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     ShowModal;
     Exit;
   end;
   frmLocOutSKUDetail:=TfrmLocOutSKUDetail.Create(Application);
   with frmLocOutSKUDetail do
   begin
      qryLocOutSKUDetail:=pqryLocOutSKUDetail;
      qryLocationOutDetail:=pqryLocationOutDetail;
      strjobno:=pstrjobno;
      intsno:=pintsno;
      intldsno:=pintldsno;
      _maxgridno:=pmaxdetailsno;
      strSkuid:=qryLocationOutDetail.fieldbyname('skuid').AsString;
      strSkuName:=qryLocationOutDetail.fieldbyname('skuname').AsString;
      strlocid:=qryLocationOutDetail.fieldbyname('locid').AsString;
      strlocname:=qryLocationOutDetail.fieldbyname('locname').AsString;
      strjobnoin:=qryLocationOutDetail.fieldbyname('jobnoin').AsString;
      intsnoin:=qrylocationoutdetail.fieldbyname('snoin').AsInteger;
      intldsnoin:=qrylocationoutdetail.fieldbyname('ldsnoin').AsInteger;
      strcustomerno:=pcustomerno;
      edtCustomerNo.Text:=strcustomerno;
      InitdbPick(cmbquantityUom,'uom','uomname','uomname',' uomtype like "%件数%" ');
      InitdbPick(sizeuom,'uom','uomname','uomname',' uomtype like "%尺寸%" ');
      //lzw 20090311
      if getSysdata('cusname')='SWZ' then
      begin
         KGroupBox12.Visible:=False;
         frmLocOutSKUDetail.Caption:='码单管理';
         UnKnowQ.Visible:=False;
         conno.Visible:=False;
         lotcode.Visible:=False;
         skubrand.Visible:=False;
         edtqualityname.Visible:=false;
         sizeuom.Visible:=false;
         edtSKUSerialNO.Visible:=False;
         qtyperct.Visible:=false;
         allct.Visible:=False;
         sealno.Visible:=False;
         Panel2.Visible:=False;
         ckbTotal.Visible:=False;
         skuspec.Caption:='规格';
         edtdepth.Caption:='层';
         edtwidth.Caption:='行';
         edtheight.Caption:='列';
      end;
      if getSysdata('qdtext')='T' then
      begin
         conno.Caption:='集装箱号';

      end;
      dtslocOutskudetail.DataSet:=qryLocOutSKUDetail;
      workCall(CallMode);
      showmodal;
      Free;
   end;
end;

procedure TfrmLocOutSKUDetail.CreateParams(var Params: TCreateParams);
begin
  self.Formstyle := fsNormal;
  self.Visible := False;
  self.Position := poScreenCenter;
  inherited CreateParams(Params);
end;

procedure TfrmLocOutSKUDetail.WorkCall(CallMode:TDataState);
{模块调用入口
   CallMode:调用状态
       stBrowse:浏览查看
       stInsert:新增
       stEdit:编辑修改}
begin
  DataState:=CallMode;
  with self do
  begin
    case DataState of
      stBrowse:
        begin
          DisableEdit;
          LampChange(lsBrowse);
        end;
      stEdit:
        begin
          qryLocOutSKUDetail.Edit;
{
          //在修改的状态下，对qryLocOutSKUDetail循环
          qryLocOutSKUDetail.DisableControls;
          maxdetailsno:=0;
          qryLocOutSKUDetail.First;
          while not qryLocOutSKUDetail.Eof do
          begin
             if qryLocOutSKUDetail.FieldByName('detailsno').AsInteger>maxdetailsno
             then maxdetailsno:=qryLocOutSKUDetail.FieldByName('detailsno').AsInteger;
             qryLocOutSKUDetail.Next;
          end;
          qryLocOutSKUDetail.EnableControls;
}
          EnableEdit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qryLocOutSKUDetail.Append;
          maxdetailsno:=0;
          EnableEdit;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmLocOutSKUDetail.EnableEdit;
begin
   LibComControl(Self,[1..5],[50]+[10..20]);
   qryLocOutSKUDetail.Edit;
   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior+[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=True;
   grdSKUDetail.ClearGroupColumns;
end;

procedure TfrmLocOutSKUDetail.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
   libComControl(self,[10..11],[1..5]);

   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior-[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=True;
end;

procedure TfrmLocOutSKUDetail.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetDxDbGrid(grdSKUDetail);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox12);
   qryTmp.Connection:=_ADOConnection;
   qrytmp1.Connection:=_ADOConnection;

end;

procedure TfrmLocOutSKUDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not (DataState in setdcs) then
      Action := caFree
end;

procedure TfrmLocOutSKUDetail.FormDestroy(Sender: TObject);
begin
   frmLocOutSKUDetail:=nil;
end;

procedure TfrmLocOutSKUDetail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  case Key of
    Vk_Escape:
    begin
      workCall(stBrowse);
      Close;
    end;
  end;
end;

procedure TfrmLocOutSKUDetail.grdSKUDetailChangeNodeEx(Sender: TObject);
begin
   if grdSKUDetail.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUDetailBeforeInsert;
   end;
end;

procedure TfrmLocOutSKUDetail.grdSKUDetailEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmLocOutSKUDetail.grdSKUDetailEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (qryLocOutSKUDetail.fieldbyname('ldsno').AsInteger=0) then
   begin
      mitSKUAddClick(Sender);
   end;
end;

procedure TfrmLocOutSKUDetail.grdSKUDetailExit(Sender: TObject);
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

procedure TfrmLocOutSKUDetail.grdSKUDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   with TdxDBGrid(Sender) do
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
            end else
         end else
         begin
            if (Key = VK_Left) and (ssShift in Shift) then
            begin
               TdxDBGrid(Sender).HideEditor;
               key:=0;
            end;
         end;   
         if (Key = VK_DELETE) and (ssCtrl in Shift) then
         begin
            mitSkuDelClick(sender);
            key:=0;
         end;
      end;
   end;
end;

procedure TfrmLocOutSKUDetail.grdSKUDetailBeforeInsert;
begin
   qryLocOutSKUDetail.FieldByName('ldsno').AsInteger:=intldsno;
   qryLocOutSKUDetail.FieldByName('sno').AsInteger:=intsno;
   qryLocOutSKUDetail.FieldByName('jobno').AsString:=strjobno;
//   qryLocOutSKUDetail.FieldByName('skuid').AsString:=strskuid;
//   qryLocOutSKUDetail.FieldByName('skuname').AsString:=strskuname;
end;

procedure TfrmLocOutSKUDetail.mitSkuAddClick(Sender: TObject);
begin
   grdSKUdetail.SetFocus;
   qryLocOutSKUDetail.Append;
   grdSKUDetailBeforeInsert;
end;

procedure TfrmLocOutSKUDetail.mitSkuDelClick(Sender: TObject);
begin
   if qryLocOutSKUDetail.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       grdSKUdetail.SetFocus;
       qryLocOutSKUDetail.Delete;
    end;
end;

procedure TfrmLocOutSKUDetail.btnOkClick(Sender: TObject);
begin
   frmLocOutSKUDetail.close;
end;

procedure TfrmLocOutSKUDetail.KBitBtn5Click(Sender: TObject);
begin
   WorkCall(stBrowse);
   close;
end;

procedure TfrmLocOutSKUDetail.btnSaveCloseClick(Sender: TObject);
var
   intgrossweight,intnetweight:Extended;
   intpiece:Integer;
begin
   if ckbTotal.Checked then
   begin
      qrylocationoutdetail.Edit;
      qrylocationoutdetail.FieldByName('quantity').AsFloat:=strtofloat(edtQUANTITY.SummaryFooterText);
   end;
   if getSysdata('cusname')='SWZ' then
   begin
      intpiece:=0;
      intgrossweight:=0;
      intnetweight:=0;
      qryLocOutSKUDetail.First;
      while not qryLocOutSKUDetail.Eof do
      begin
         intgrossweight:=intgrossweight+qryLocOutSKUDetail.FieldByName('grossweight').AsFloat;
         intnetweight:=intnetweight+qryLocOutSKUDetail.FieldByName('netweight').AsFloat;
         qryLocOutSKUDetail.Next;
      end;
      qryLocOutSKUDetail.Edit;
      qryLocOutSKUDetail.FieldByName('piece').AsInteger :=intpiece;

      qrylocationoutdetail.FieldByName('piece').AsFloat:=strtofloat(edtQUANTITY.SummaryFooterText);
      qrylocationoutdetail.FieldByName('grossweight').AsFloat:=intgrossweight;
      qrylocationoutdetail.FieldByName('netweight').AsFloat:=intnetweight;

   end;  
   frmLocOutSKUDetail.Close;
end;

procedure TfrmLocOutSKUDetail.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pt:TPoint;
   rect:TRect;
begin
   if DataState in Setdcs then
   begin
      mitSkuClick(nil);
   {
      rect:=grdSKUDetail.CellRect(grdSKUDetail.FocusedNode,edtSKUName.Index);
      pt:=ClientToScreen(Point(rect.Left+grdSKUDetail.left,
          rect.Bottom +grdSKUDetail.Top));
      ppmSkuSelect.Popup(pt.x,pt.y);
   }
   end;
end;

procedure TfrmLocOutSKUDetail.edtqualitynameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
        qryLocOutSKUDetail.edit;
        qryLocOutSKUDetail.FieldByName('QualityName').AsString:=
           pGetqualitySelect(qryLocOutSKUDetail.FieldByName('QualityName').AsString);
   end;
end;

procedure TfrmLocOutSKUDetail.mitSkuClick(Sender: TObject);
var
   i:integer;
   qryselect:TKADOQuery;
   mulSelect:TMultLocSkuDetailSelect;
begin
   if DataState in Setdcs then
   begin
      mulSelect:=WorkLocSkuDetailSelect(strjobnoin,intsnoin,intldsnoin);
      for i:=Low(mulSelect) to High(mulSelect) do
      begin
         if mulSelect[i].okflag then
         with qryLocOutSKUDetail do
         begin
            Append;
            FieldByName('jobno').AsString:=strjobno;
            FieldByName('sno').AsInteger:=intsno;
            FieldByName('ldsno').AsInteger:=intldsno;
            FieldByName('jobnoin').AsString:=mulselect[i].JOBNO;
            FieldByName('snoin').AsInteger :=mulselect[i].SNO;
            FieldByName('ldsnoin').AsInteger:=mulselect[i].LDSNO;
            FieldByName('detailsnoin').AsInteger:=mulselect[i].DetailSNO;
            FieldByName('skuid').AsString:=mulselect[i].SKUID;
            FieldByName('skuname').AsString:=mulselect[i].SKUName;
            FieldByName('quantity').AsFloat:=mulselect[i].Quantity;
            FieldByName('quantityuom').AsString:=mulselect[i].QuantityUOM;
            FieldByName('color').AsString:=mulselect[i].color;
            FieldByName('skuspec').AsString:=mulselect[i].skuspec;
            FieldByName('lotcode').AsString:=mulselect[i].LotCode;
            FieldByName('qualityname').AsString:=mulselect[i].QualityName;
            FieldByName('serialno').AsString:=mulselect[i].SerialNO;
            FieldByName('conno').AsString:=mulselect[i].conno;
            FieldByName('unknowq').AsString:=mulselect[i].unknowq;
            FieldByName('manufacturedate').AsDateTime:=mulselect[i].manufacturedate;
            FieldByName('sizeuom').AsString:=mulselect[i].SizeUOM;
            FieldByName('Height').AsFloat:=mulselect[i].Height;
            FieldByName('Width').AsFloat:=mulselect[i].Width;
            FieldByName('Depth').AsFloat:=mulselect[i].Depth;
            FieldByName('costcusid').AsString:=mulselect[i].costcusid;
            FieldByName('costcusname').AsString:=mulselect[i].costcusname;
            FieldByName('userid').AsString:=mulselect[i].userid;
            FieldByName('username').AsString:=mulselect[i].username;
            FieldByName('shippercusid').AsString:=mulselect[i].shippercusid;
            FieldByName('shippercusname').AsString:=mulselect[i].shippercusname;
            FieldByName('cusid').AsString:=mulselect[i].cusid;
            FieldByName('cusname').AsString:=mulselect[i].cusname;
            FieldByName('iuserid').AsString:=mulselect[i].iuserid;
            FieldByName('iusername').AsString:=mulselect[i].iusername;
            //lzw20090710
            if (_strsyscus<>'XT') and (getSysdata('qdtext')<>'T') then
            begin
              // FieldByName('piece').AsFloat:=mulselect[i].piece;
              // FieldByName('grossweight').AsFloat:=mulselect[i].grossweight;
              // FieldByName('netweight').AsFloat:=mulselect[i].netweight;
            end;

            post;
         end;
      end;
   end;
end;

function TfrmLocOutSKUDetail.GetScale(pstrUomVolume,pstrUomSize:String):Extended;
begin
   OpenSql(qryTmp,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomVolume+'" ');
   OpenSql(qryTmp1,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomSize+'" ');
   Result:=qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('Pro').AsFloat
   /qryTmp.FieldByname('pro').AsFloat;
end;

procedure TfrmLocOutSKUDetail.mitplasteClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      mitSkuAddClick(self);
   end;
end;

procedure TfrmLocOutSKUDetail.mitColumnsetClick(Sender: TObject);
begin
   WorkSetGrid(grdSKUDetail,frmLocOutSKUDetail.Name);
end;

procedure TfrmLocOutSKUDetail.edtCustomerNoExit(Sender: TObject);
var
  acontrol: TWinControl;
begin
{
   if (edtCustomerNo.Text<>'') and not blnskucheck then
   begin
      qryLocOutSKUDetail.Append;
      qryLocOutSKUDetail.FieldByName('Jobno').AsString         :=strjobno;
      qryLocOutSKUDetail.FieldByName('SNO').AsInteger          :=intsno;
      qryLocOutSKUDetail.fieldbyname('LDSNO').Asinteger        :=intldsno;
      SkuInsert(strskuid,strskuname);
     begin
     end;
     edtCustomerNo.SetFocus;
     edtCustomerNo.Text:='';
   end;
}
end;

procedure TfrmLocOutSKUDetail.edtCustomerNoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:Integer;
   mulSkuRef:Tmulskuref;
begin
//必需先录入商品编号
   if edtCustomerNo.Text='' then
   begin
      kMessageDlg(GetMessage('frmLocOutSKUDetail','001'), mtWarning, [mbOK], 0);
      exit;
   end;
   if edtConnoScan.Text='' then   //箱号不能为空
   begin
      kMessageDlg(GetMessage('frmLocOutSKUDetail','002'), mtWarning, [mbOK], 0);
      exit;
   end;
   if edtCustomerNo.Text<>strcustomerno then    //商品不同时,提示是否增加
   begin
      if kMessageDlg(GetMessage('frmLocOutSKUDetail','003'), mtConfirmation, [mbYes,mbno], 0)<>mryes then
      exit;
   end;
   if CustomerNoCheck(edtCustomerNo.Text) then
   begin
//      blnskucheck:=True;
      mulSkuRef:=workSkuRef(stEdit,strpskuid,qryLocOutSKUDetail);
      for i:=Low(mulSkuRef) to High(mulSkuRef) do
      with mulSkuRef[i] do
      begin
         if OKflag then
         begin
            qryLocOutSKUDetail.Append;
            grdSKUDetailBeforeInsert;
            qryLocOutSKUDetail.FieldByName('skuid').AsString:=strpskuid;
            qryLocOutSKUDetail.FieldByName('skuname').AsString:=strpskuname;
            qryLocOutSKUDetail.FieldByName('conno').AsString:=edtConnoScan.Text;
//            qryLocOutSKUDetail.FieldByName('locid').AsString:=strlocid;
//            qryLocOutSKUDetail.FieldByName('locname').AsString:=strlocname;
            qryLocOutSKUDetail.FieldByName('color').AsString:=color;
            qryLocOutSKUDetail.FieldByName('skuspec').AsString:=skuspec;
            qryLocOutSKUDetail.FieldByName('quantity').AsFloat:=quantity;
            SkuInsert(strpskuid,strpskuname);
            qryLocOutSKUDetail.Post;
         end;
      end;
   end else
   begin//无此商品编码的商品
      kMessageDlg(GetMessage('frmLocOutSKUDetail','003'), mtWarning, [mbOK], 0);
      exit;
   end;
end;

function TfrmLocOutSKUDetail.CustomerNoCheck(pCustomerNo:string):Boolean;
var
  customerNo:string;
begin
   customerNo:=pCustomerNo;
   //商品未改变
   if strpcustomerno=customerNo then
   begin
      Result:=true;
      exit;
   end;
   strsql:='select top 1 * '
          +'  from sku '
          +' where sku.customerno="'+customerNO+'"';
   OpenSql(qryTmp,strsql);
   if qryTmp.IsEmpty then Result:=False
   else
   begin
      strpskuid:=qryTmp.fieldbyname('skuid').AsString;
      strpskuname:=qryTmp.fieldbyname('skuname').AsString;
      strpcustomerno:=pCustomerNo;
      Result:=true;
   end;
end;

procedure TfrmLocOutSKUDetail.SkuInsert(pskuid,pskuname:string);
begin
   OpenSql(qryTmp,' Select top 1 piecepro,volumepro,weightpro,areapro,'+chr(13)+chr(10)
                 +'        quantityuom,pieceuom,volumeuom,areauom,weightuom,sizeuom '+chr(13)+chr(10)
                 +'   from sku(nolock) '+chr(13)+chr(10)
                 +'  where sku.skuid="'+pSkuid+'"'
                 +'    and sku.skuname="'+pSkuName+'"');
   qryLocOutSKUDetail.FieldByName('SerialNO').AsString      :=edtCustomerNo.Text;
   qryLocOutSKUDetail.FieldByName('SKUID').AsString         :=pSkuid;
   qryLocOutSKUDetail.FieldByName('SKUName').AsString       :=pSkuName;
   qryLocOutSKUDetail.FieldByName('conno').AsString       :=edtConnoScan.Text;
   qryLocOutSKUDetail.FieldByName('QuantityUOM').AsString:=qryTmp.fieldbyname('QuantityUOM').AsString;
   qryLocOutSKUDetail.FieldByName('sizeuom').AsString    :=qryTmp.fieldbyname('sizeuom').AsString;
//        qryLocOutSKUDetail.Fieldbyname('quantity_volume_prop').AsFloat     :=qryTmp.fieldbyname('volumepro').AsFloat;
//        qryLocOutSKUDetail.Fieldbyname('Quantity_Area_Prop').AsFloat       :=qryTmp.fieldbyname('areapro').AsFloat;
//        qryLocOutSKUDetail.Fieldbyname('quantity_netweight_prop').AsFloat  :=qryTmp.fieldbyname('weightpro').AsFloat;
//        qryLocOutSKUDetail.Fieldbyname('quantity_grossweight_prop').AsFloat:=qryTmp.fieldbyname('weightpro').AsFloat;

end;

procedure TfrmLocOutSKUDetail.edtQUANTITYValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if DataState in Setdcs then
   begin
     if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<=0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     qryLocOutSKUDetail.edit;
     qryLocOutSKUDetail.FieldByName('quantity').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
   end;
end;

end.

