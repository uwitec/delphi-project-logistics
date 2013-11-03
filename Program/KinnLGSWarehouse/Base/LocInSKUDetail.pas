unit LocInSKUDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, KinPickEdit, dxDBELib, dxCntner, dxEditor,
  DBKINCGrids, KSText, ComCtrls, frstatus, StdCtrls, KGroupBox, Menus,
  DBTables, DB,libuser,libproc, KBitBtn, KUpdateSql, GMSLabel, ExtCtrls,
  KDataSetProvider, DBClient, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  Buttons,ADODB;

type
  TfrmLocInSKUDetail = class(TForm)
    ppmSKUDetail: TPopupMenu;
    mitSkuAdd: TMenuItem;
    mitSkuDel: TMenuItem;
    dtslocinskudetail: TDataSource;
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
    color: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    ckbTotal: TdxCheckEdit;
    quantityremain: TdxDBGridCurrencyColumn;
    AqryMtf: TADOQuery;
    conMtf: TADOConnection;
    OpenDialog1: TOpenDialog;
    ckbPiece: TdxCheckEdit;
    qtyperct: TdxDBGridColumn;
    allct: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    piece: TdxDBGridCurrencyColumn;
    volume: TdxDBGridCurrencyColumn;
    KGroupBox12: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel13: TGMSStickyLabel;
    GMSStickyLabel30: TGMSStickyLabel;
    edtConnoScan: TdxEdit;
    edtQuantityP: TdxCalcEdit;
    edtNetWeightP: TdxCalcEdit;
    edtCustomerNo: TdxButtonEdit;
    btnInput: TKBitBtn;
    edtPath: TdxButtonEdit;
    cmbTemple: TKinDbPickEdit;
    grossweight: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
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
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btnInputClick(Sender: TObject);
    procedure edtdepthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtwidthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtheightValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure pieceValidate(Sender: TObject; var ErrorText: String;
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
    qrylocinskudetail,qrylocationindetail:TKADOQuery;//传入qry操作
    strjobno:string;
    intsno,intldsno:Integer;
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
    strSysCus:string; //项目型客户个性化配置
    procedure CreateParams(var Params: TCreateParams);override;
  end;

procedure workLocInSKUDetail(Callmode:TdataState;pstrjobno,pcustomerno:string;pintsno,pintldsno,pmaxdetailsno:integer;
                            pqrylocinskudetail,pqryLocationINDetail:TKADOQuery);

var
  frmLocInSKUDetail: TfrmLocInSKUDetail;

implementation

{$R *.dfm}

uses main,datas,Kindlg,libuserPub,GetDllPub,SetGrid,
     SkuRef;

var
   DataState:TDataState;
   strsql:string;
   strjobnoin:string; //对应进仓工作号
   qryuom:TKADOQuery;

procedure workLocInSKUDetail(Callmode:TdataState;pstrjobno,pcustomerno:string;pintsno,pintldsno,pmaxdetailsno:integer;
                            pqrylocinskudetail,pqryLocationINDetail:TKADOQuery);
//pqryuom:获取商品信息中的单位信息.
begin
   if frmLocInSKUDetail <> nil then
   with frmLocInSKUDetail do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     ShowModal;
     Exit;
   end;
   frmLocInSKUDetail:=TfrmLocInSKUDetail.Create(Application);
   with frmLocInSKUDetail do
   begin
      //模板初始化
      InitdbPick(cmbTemple,'formatin','fsid','fsName','1=1');
      strSysCus:=getSysdata('cusname');
      if strSysCus='SWZ' then
      begin
         KGroupBox12.Visible:=True;
         edtConnoScan.Enabled:=False;
         edtCustomerNo.Enabled:=False;
         edtQuantityP.Enabled:=False;
         edtNetWeightP.Enabled:=False;
         frmLocInSKUDetail.Caption:='码单管理';
         UnKnowQ.Visible:=False;
         conno.Visible:=true;
         lotcode.Visible:=False;
         skubrand.Visible:=False;
         edtqualityname.Visible:=false;
         volume.Visible:=false;
         sizeuom.Visible:=false;
         conno.Visible:=False;
         qtyperct.Visible:=false;
         allct.Visible:=False;
         sealno.Visible:=False;
         Panel2.Visible:=True;
         ckbPiece.Visible:=False;
         ckbTotal.Visible:=False;
         GMSStickyLabel3.Caption:='商品产地';
         edtSKUSerialNO.Caption:='标签号';
         edtSKUName.Caption:='商品名称';
         skuspec.Caption:='商品规格';
         color.Caption:='商品颜色';
         edtdepth.Caption:='层';
         edtwidth.Caption:='行';
         edtheight.Caption:='列';
      end;
      //lzw20100611
      if getSysdata('qdtext')='T' then
      begin
         conno.Caption:='集装箱号';
      end;
      qrylocinskudetail:=pqrylocinskudetail;
      qryLocationINDetail:=pqryLocationINDetail;
      strjobno:=pstrjobno;
      intsno:=pintsno;
      intldsno:=pintldsno;
      _maxgridno:=pmaxdetailsno;
      strSkuid:=qryLocationINDetail.fieldbyname('skuid').AsString;
      strSkuName:=qryLocationINDetail.fieldbyname('skuname').AsString;
      strlocid:=qryLocationINDetail.fieldbyname('locid').AsString;
      strlocname:=qryLocationINDetail.fieldbyname('locname').AsString;
      strcustomerno:=pcustomerno;
      edtCustomerNo.Text:=strcustomerno;
      InitdbPick(cmbquantityUom,'uom','uomname','uomname',' uomtype like "%件数%" ');
      InitdbPick(sizeuom,'uom','uomname','uomname',' uomtype like "%尺寸%" ');
      dtslocinskudetail.DataSet:=qrylocinskudetail;
      workCall(CallMode);
      showmodal;
      Free;
   end;
end;

procedure TfrmLocInSKUDetail.CreateParams(var Params: TCreateParams);
begin
  self.Formstyle := fsNormal;
  self.Visible := False;
  self.Position := poScreenCenter;
  inherited CreateParams(Params);
end;

procedure TfrmLocInSKUDetail.WorkCall(CallMode:TDataState);
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
          qrylocinskudetail.Edit;
{
          //在修改的状态下，对qrylocinskudetail循环
          qrylocinskudetail.DisableControls;
          maxdetailsno:=0;
          qrylocinskudetail.First;
          while not qrylocinskudetail.Eof do
          begin
             if qrylocinskudetail.FieldByName('detailsno').AsInteger>maxdetailsno
             then maxdetailsno:=qrylocinskudetail.FieldByName('detailsno').AsInteger;
             qrylocinskudetail.Next;
          end;
          qrylocinskudetail.EnableControls;
}
          EnableEdit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qrylocinskudetail.Append;
          maxdetailsno:=0;
          EnableEdit;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmLocInSKUDetail.EnableEdit;
begin
   LibComControl(Self,[1..5],[50]+[10..20]);
   qrylocinskudetail.Edit;
   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior+[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=False;
   grdSKUDetail.ClearGroupColumns;
end;

procedure TfrmLocInSKUDetail.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
   libComControl(self,[10..11],[1..5]);

   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior-[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=True;
end;

procedure TfrmLocInSKUDetail.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetDxDbGrid(grdSKUDetail);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox12);
   qryTmp.Connection:=_ADOConnection;
   qrytmp1.Connection:=_ADOConnection;
end;

procedure TfrmLocInSKUDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not (DataState in setdcs) then
      Action := caFree
end;

procedure TfrmLocInSKUDetail.FormDestroy(Sender: TObject);
begin
   frmLocInSKUDetail:=nil;
end;

procedure TfrmLocInSKUDetail.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLocInSKUDetail.grdSKUDetailChangeNodeEx(Sender: TObject);
begin
   if grdSKUDetail.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUDetailBeforeInsert;
   end;
end;

procedure TfrmLocInSKUDetail.grdSKUDetailEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmLocInSKUDetail.grdSKUDetailEnter(Sender: TObject);
begin
   if getSysdata('cusname')<>'SWZ' then
   begin
      if (DataState in setdcs) and (qrylocinskudetail.fieldbyname('ldsno').AsInteger=0) then
      begin
         mitSKUAddClick(Sender);
      end;
   end;
end;

procedure TfrmLocInSKUDetail.grdSKUDetailExit(Sender: TObject);
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

procedure TfrmLocInSKUDetail.grdSKUDetailKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLocInSKUDetail.grdSKUDetailBeforeInsert;
begin
   qrylocinskudetail.FieldByName('ldsno').AsInteger:=intldsno;
   qrylocinskudetail.FieldByName('sno').AsInteger:=intsno;
   qrylocinskudetail.FieldByName('jobno').AsString:=strjobno;
   qrylocinskudetail.FieldByName('qualityname').AsString:='正品';
   qrylocinskudetail.FieldByName('skuid').AsString:=strskuid;
   qrylocinskudetail.FieldByName('skuname').AsString:=strskuname;
   qrylocinskudetail.FieldByName('tracktype').AsString:='TO';
end;

procedure TfrmLocInSKUDetail.mitSkuAddClick(Sender: TObject);
begin
   grdSKUdetail.SetFocus;
   qrylocinskudetail.Append;
   grdSKUDetailBeforeInsert;
end;

procedure TfrmLocInSKUDetail.mitSkuDelClick(Sender: TObject);
var
i:Integer;
begin
   if qrylocinskudetail.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg('该操作将删除该笔商品明细，您确定吗?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    for i:=grdSKUDetail.SelectedCount-1 Downto 0 do
       begin
          grdSKUdetail.SetFocus;
          qrylocinskudetail.Delete;
       end;

    end;
end;

procedure TfrmLocInSKUDetail.btnOkClick(Sender: TObject);
begin
   frmLocInSKUDetail.close;
end;

procedure TfrmLocInSKUDetail.KBitBtn5Click(Sender: TObject);
begin
   WorkCall(stBrowse);
   close;
end;

procedure TfrmLocInSKUDetail.btnSaveCloseClick(Sender: TObject);
var
  Sltconno:TStringList;
  intpiece:Integer;
  intgrossweight,intnetweight:Extended;
begin
   if ckbTotal.Checked then
   begin
      qrylocationindetail.Edit;
      qrylocationindetail.FieldByName('quantity').AsFloat:=strtofloat(edtQUANTITY.SummaryFooterText);
   end;
   if ckbPiece.Checked then
   begin
      Sltconno:=TStringList.Create;
      intpiece:=0;
      intgrossweight:=0;
      intnetweight:=0;
      qrylocinskudetail.First;
      while not qrylocinskudetail.Eof do
      begin
         if  Sltconno.IndexOf(qrylocinskudetail.fieldbyname('conno').AsString)=-1 then
         begin
            Sltconno.Add(qrylocinskudetail.fieldbyname('conno').AsString);
            intpiece:=intpiece+1;
         end;
         if getSysdata('cusname')='SWZ' then
         begin
            intgrossweight:=intgrossweight+qrylocinskudetail.FieldByName('grossweight').AsFloat;
            intnetweight:=intnetweight+qrylocinskudetail.FieldByName('netweight').AsFloat;
         end;
         qrylocinskudetail.Next;
      end;
      qrylocationindetail.Edit;
      qrylocationindetail.FieldByName('piece').AsInteger :=intpiece;
      if getSysdata('cusname')='SWZ' then
      begin
         qrylocationindetail.FieldByName('piece').AsFloat:=strtofloat(edtQUANTITY.SummaryFooterText);
         qrylocationindetail.FieldByName('grossweight').AsFloat:=intgrossweight;
         qrylocationindetail.FieldByName('netweight').AsFloat:=intnetweight;
      end;
   end;
   frmLocInSKUDetail.Close;
end;

procedure TfrmLocInSKUDetail.edtSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pt:TPoint;
   rect:TRect;
begin
   mitSKU.Click;
end;

procedure TfrmLocInSKUDetail.edtqualitynameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
        qrylocinskudetail.edit;
        qrylocinskudetail.FieldByName('QualityName').AsString:=
           pGetqualitySelect(qrylocinskudetail.FieldByName('QualityName').AsString);
   end;
end;

procedure TfrmLocInSKUDetail.mitSkuClick(Sender: TObject);
var
   i:integer;
   qryselect:TKADOQuery;
begin
//非出仓数据从商品挑选
   begin
      qryselect:=PGetSKUSelect('','','T');
      qryselect.First;
      i:=0;
      while not qryselect.Eof do
      begin
         with qryselect do
         begin
            if i=0 then
            begin
               qrylocinskudetail.Edit;
            end else
               qrylocinskudetail.Append;
            Inc(i);
            qrylocinskudetail.Fieldbyname('quantity').AsInteger  :=1;
            qrylocinskudetail.FieldByName('SkuId').AsString  :=fieldbyname('skuid').AsString;
            qrylocinskudetail.FieldByName('SkuName').AsString  :=fieldbyname('skuname').AsString;
            qrylocinskudetail.FieldByName('QuantityUOM').AsString:=fieldbyname('QuantityUOM').AsString;
            qrylocinskudetail.FieldByName('sizeuom').AsString    :=fieldbyname('sizeuom').AsString;
//            qrylocinskudetail.Fieldbyname('quantity_volume_prop').AsFloat  :=fieldbyname('volumepro').AsFloat;
//            qrylocinskudetail.Fieldbyname('Quantity_Area_Prop').AsFloat  :=fieldbyname('areapro').AsFloat;
//            qrylocinskudetail.Fieldbyname('quantity_netweight_prop').AsFloat  :=fieldbyname('weightpro').AsFloat;
//            qrylocinskudetail.Fieldbyname('quantity_grossweight_prop').AsFloat  :=fieldbyname('weightpro').AsFloat;
            try
               qrylocinskudetail.Post;
            except
               break;
            end;
            Next;
         end;
      end;
      FreeAndNil(qryselect);
   end;
end;

function TfrmLocInSKUDetail.GetScale(pstrUomVolume,pstrUomSize:String):Extended;
begin
   OpenSql(qryTmp,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomVolume+'" ');
   OpenSql(qryTmp1,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomSize+'" ');
   Result:=qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('Pro').AsFloat
   /qryTmp.FieldByname('pro').AsFloat;
end;

procedure TfrmLocInSKUDetail.mitplasteClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      mitSkuAddClick(self);
   end;
end;

procedure TfrmLocInSKUDetail.mitColumnsetClick(Sender: TObject);
begin
   WorkSetGrid(grdSKUDetail,frmLocInSKUDetail.Name);
end;

procedure TfrmLocInSKUDetail.edtCustomerNoExit(Sender: TObject);
var
  acontrol: TWinControl;
begin
{
   if (edtCustomerNo.Text<>'') and not blnskucheck then
   begin
      qrylocinskudetail.Append;
      qrylocinskudetail.FieldByName('Jobno').AsString         :=strjobno;
      qrylocinskudetail.FieldByName('SNO').AsInteger          :=intsno;
      qrylocinskudetail.fieldbyname('LDSNO').Asinteger        :=intldsno;
      SkuInsert(strskuid,strskuname);
     begin
     end;
     edtCustomerNo.SetFocus;
     edtCustomerNo.Text:='';
   end;
}
end;

procedure TfrmLocInSKUDetail.edtCustomerNoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:Integer;
   mulSkuRef:Tmulskuref;
begin
//必需先录入商品编号
   if edtCustomerNo.Text='' then
   begin
      kMessageDlg('必需先录入商品编号', mtWarning, [mbOK], 0);
      exit;
   end;
//   if edtConnoScan.Text='' then   //箱号不能为空
//   begin
//      kMessageDlg(GetMessage('frmLocInSKUDetail','002'), mtWarning, [mbOK], 0);
//      exit;
//   end;
   if edtCustomerNo.Text<>strcustomerno then    //商品不同时,提示是否增加
   begin
      if kMessageDlg('商品编码已经改变,是否增加商品?', mtConfirmation, [mbYes,mbno], 0)<>mryes then
      exit;
   end;
   if CustomerNoCheck(edtCustomerNo.Text) then
   begin
//      blnskucheck:=True;
      mulSkuRef:=workSkuRef(stEdit,strpskuid,nil);
      qrylocinskudetail.DisableControls;
      for i:=Low(mulSkuRef) to High(mulSkuRef) do
      with mulSkuRef[i] do
      begin
         if OKflag then
         begin
            qrylocinskudetail.Append;
            grdSKUDetailBeforeInsert;
            qrylocinskudetail.FieldByName('skuid').AsString:=strpskuid;
            qrylocinskudetail.FieldByName('skuname').AsString:=strpskuname;
            qrylocinskudetail.FieldByName('conno').AsString:=edtConnoScan.Text;
//            qrylocinskudetail.FieldByName('locid').AsString:=strlocid;
//            qrylocinskudetail.FieldByName('locname').AsString:=strlocname;
            qrylocinskudetail.FieldByName('color').AsString:=color;
            qrylocinskudetail.FieldByName('skuspec').AsString:=skuspec;
            qrylocinskudetail.FieldByName('quantity').AsFloat:=quantity;
            qrylocinskudetail.FieldByName('SerialNO').AsString      :=edtCustomerNo.Text;
            SkuInsert(strpskuid,strpskuname);
            qrylocinskudetail.Post;
         end;
      end;
      qrylocinskudetail.EnableControls;
   end else
   begin//无此商品编码的商品
      kMessageDlg('无此商品编码的商品', mtWarning, [mbOK], 0);
      exit;
   end;
end;

function TfrmLocInSKUDetail.CustomerNoCheck(pCustomerNo:string):Boolean;
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

procedure TfrmLocInSKUDetail.SkuInsert(pskuid,pskuname:string);
begin
   OpenSql(qryTmp1,' Select top 1 piecepro,volumepro,weightpro,areapro,'+chr(13)+chr(10)
                 +'        quantityuom,pieceuom,volumeuom,areauom,weightuom,sizeuom '+chr(13)+chr(10)
                 +'   from sku(nolock) '+chr(13)+chr(10)
                 +'  where sku.skuid="'+pSkuid+'"'
                 +'    and sku.skuname="'+pSkuName+'"');
//   qrylocinskudetail.FieldByName('SKUID').AsString         :=pSkuid;
//   qrylocinskudetail.FieldByName('SKUName').AsString       :=pSkuName;
//   qrylocinskudetail.FieldByName('conno').AsString       :=edtConnoScan.Text;
   qrylocinskudetail.FieldByName('QuantityUOM').AsString:=qryTmp1.fieldbyname('QuantityUOM').AsString;
   qrylocinskudetail.FieldByName('sizeuom').AsString    :=qryTmp1.fieldbyname('sizeuom').AsString;
//        qrylocinskudetail.Fieldbyname('quantity_volume_prop').AsFloat     :=qryTmp.fieldbyname('volumepro').AsFloat;
//        qrylocinskudetail.Fieldbyname('Quantity_Area_Prop').AsFloat       :=qryTmp.fieldbyname('areapro').AsFloat;
//        qrylocinskudetail.Fieldbyname('quantity_netweight_prop').AsFloat  :=qryTmp.fieldbyname('weightpro').AsFloat;
//        qrylocinskudetail.Fieldbyname('quantity_grossweight_prop').AsFloat:=qryTmp.fieldbyname('weightpro').AsFloat;

end;

procedure TfrmLocInSKUDetail.edtQUANTITYValidate(Sender: TObject;
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
     qrylocinskudetail.edit;
     qrylocinskudetail.FieldByName('quantity').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
   end;
end;

procedure TfrmLocInSKUDetail.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmLocInSKUDetail.btnInputClick(Sender: TObject);
var
   strname,strfilter:string;
   i:integer;
begin
   if edtPath.Text='' then
   begin
      Kmessagedlg('请先选需要读入的文件路径！', mtInformation,[mbOk],0);
      edtPath.setFocus;
      exit;
   end;

   //处理文档
   if pos('.XLS',UpperCase(Trim(ExtractFileName(edtPath.Text))))>0 then
   begin
      strName:=edtPath.Text;
      conMtf.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+strName+';Extended Properties=Excel 8.0';
      if conMtf.Connected then conMtf.Open;
      try
         if getSysdata('cusname')='SWZ' then
         begin
           //strSql:='ksp_GetSkudetailOutdetailfromExcel';
           strSql:=' Select * '+
                   '   from [进仓码单$] ';
         end else
         begin
           strSql:=' Select * '+
                   '   from [通知单$] ';
         end;
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         conMtf.Close;
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         Exit;
      end;
   end;
   strsql:='';
   ExecSql(qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskinexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskinexcel '+chr(10)+chr(13)
                         +'create table #lskinexcel( '+chr(10)+chr(13)
                         +'     conno    varchar(20),'+chr(10)+chr(13)
                         +'     serialno varchar(50), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     colorid  varchar(50), '+chr(10)+chr(13)
                         +'     specid   varchar(50), '+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     piece numeric(16,4), '+chr(10)+chr(13)
                         +'     grossweight  varchar(10), '+chr(10)+chr(13)
                         +'     netweight numeric(16,4), '+chr(10)+chr(13)
                         +'     skuname  varchar(50), '+chr(10)+chr(13)
                         +'     depth    varchar(10), '+chr(10)+chr(13)
                         +'     width    varchar(10), '+chr(10)+chr(13)
                         +'     height   varchar(10), '+chr(10)+chr(13)
                         +'     remark   varchar(300) '+chr(10)+chr(13)
                         +')'
          );
   try
      //lzw20090513
      if getSysdata('cusname')<>'SWZ' then
      begin
        if (AqryMtf.Fields[0].FieldName='箱号') and
           (AqryMtf.Fields[1].FieldName='商品代码') and
           (AqryMtf.Fields[3].FieldName='单位') and
           (AqryMtf.Fields[4].FieldName='颜色代码') and
           (AqryMtf.Fields[5].FieldName='尺码名称') and
           (AqryMtf.Fields[6].FieldName='数量') then
        begin
           AqryMtf.First;
           while not AqryMtf.Eof do
           begin  //EXCEL格式判断
              if (strcustomerno=AqryMtf.Fields[1].AsString) and
                 (pos(','+AqryMtf.Fields[0].AsString+',',','+edtConnoScan.Text+',')>0)
              then
              begin
                 strsql:=strsql+' insert into #lskinexcel(conno,serialno,quantityuom,colorid,specid,quantity)'
                            +'   values("'+AqryMtf.Fields[0].AsString+'",'
                            +'          "'+AqryMtf.Fields[1].AsString+'",'
                            +'          "'+AqryMtf.Fields[3].AsString+'",'
                            +'          "'+AqryMtf.Fields[4].AsString+'",'
                            +'          "'+AqryMtf.Fields[5].AsString+'",'
                            +'           '+AqryMtf.Fields[6].AsString+') ';
              end;
              AqryMtf.Next;
           end;
        end;
      end else
      begin
         if (AqryMtf.Fields[0].FieldName='标签号') and
           (AqryMtf.Fields[1].FieldName='商品名称') and
           (AqryMtf.Fields[2].FieldName='商品规格') and
           (AqryMtf.Fields[3].FieldName='商品颜色') and
           (AqryMtf.Fields[4].FieldName='数量') and
           (AqryMtf.Fields[5].FieldName='备注') and
           (AqryMtf.Fields[6].FieldName='长') and
           (AqryMtf.Fields[7].FieldName='高') and
           (AqryMtf.Fields[8].FieldName='宽') and
           (AqryMtf.Fields[9].FieldName='件数')and
           (AqryMtf.Fields[10].FieldName='毛重') and
           (AqryMtf.Fields[11].FieldName='净重') then
        begin
           AqryMtf.First;
           while not AqryMtf.Eof do
           begin  //EXCEL格式判断
              strsql:=strsql+' insert into #lskinexcel(serialno,skuname,specid,colorid,quantity,remark,depth,height,width,piece,grossweight,netweight)'
                            +'   values("'+AqryMtf.Fields[0].AsString+'",'
                            +'          "'+AqryMtf.Fields[1].AsString+'",'
                            +'          "'+AqryMtf.Fields[2].AsString+'",'
                            +'          "'+AqryMtf.Fields[3].AsString+'",'
                            +'          "'+AqryMtf.Fields[4].AsString+'",'
                            +'          "'+AqryMtf.Fields[5].AsString+'",'
                            +'          "'+AqryMtf.Fields[6].AsString+'",'
                            +'          "'+AqryMtf.Fields[7].AsString+'",'
                            +'          "'+AqryMtf.Fields[8].AsString+'",'
                            +'          "'+AqryMtf.Fields[9].AsString+'",'
                            +'          "'+AqryMtf.Fields[10].AsString+'",'
                            +'          "'+AqryMtf.Fields[11].AsString+'") ';
              AqryMtf.Next;
           end;
        end;
      end;  
   except
      KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
      conMtf.Close;
      Exit;
   end;

   if strsql<>'' then
   begin
      try
         qrylocinskudetail.DisableControls;
         ExecSql(qryTmp,strsql);
         if getSysdata('cusname')='SWZ' then
         begin
           opensql(qryTmp,'ksp_GetInSkudetailFromExcelswz');
           while not qryTmp.Eof do
           begin
              qrylocinskudetail.Append;
              qrylocinskudetail.FieldByName('ldsno').AsInteger:=intldsno;
              qrylocinskudetail.FieldByName('sno').AsInteger:=intsno;
              qrylocinskudetail.FieldByName('jobno').AsString:=strjobno;
              //grdSKUDetailBeforeInsert;
              qrylocinskudetail.FieldByName('skuid').AsString:=qryTmp.fieldbyname('skuid').AsString;
              qrylocinskudetail.FieldByName('skuname').AsString:=qryTmp.fieldbyname('skuname').AsString;
              qrylocinskudetail.FieldByName('serialno').AsString:=qryTmp.fieldbyname('serialno').AsString;
              qrylocinskudetail.FieldByName('color').AsString:=qryTmp.fieldbyname('color').AsString;
              qrylocinskudetail.FieldByName('skuspec').AsString:=qryTmp.fieldbyname('skuspec').AsString;
              qrylocinskudetail.FieldByName('quantity').AsFloat:=qryTmp.fieldbyname('quantity').AsFloat;
              qrylocinskudetail.FieldByName('remark').AsString:=qryTmp.fieldbyname('remark').AsString;
              qrylocinskudetail.FieldByName('depth').AsString:=qryTmp.fieldbyname('depth').AsString;
              qrylocinskudetail.FieldByName('width').AsString:=qryTmp.fieldbyname('width').AsString;
              qrylocinskudetail.FieldByName('height').AsString:=qryTmp.fieldbyname('height').AsString;
              qrylocinskudetail.FieldByName('piece').AsFloat:=qryTmp.fieldbyname('piece').AsFloat;
              qrylocinskudetail.FieldByName('grossweight').AsString:=qryTmp.fieldbyname('grossweight').AsString;
              qrylocinskudetail.FieldByName('netweight').AsFloat:=qryTmp.fieldbyname('netweight').AsFloat;
              SkuInsert(qrylocinskudetail.FieldByName('skuid').AsString,qrylocinskudetail.FieldByName('skuname').AsString);
              qrylocinskudetail.Post;
              qryTmp.Next;
           end;
           qrylocinskudetail.EnableControls;
         end else
         begin
           opensql(qryTmp,'ksp_GetInSkudetailFromExcel');
           while not qryTmp.Eof do
           begin
              qrylocinskudetail.Append;
              grdSKUDetailBeforeInsert;
              qrylocinskudetail.FieldByName('skuid').AsString:=qryTmp.fieldbyname('skuid').AsString;
              qrylocinskudetail.FieldByName('skuname').AsString:=qryTmp.fieldbyname('skuname').AsString;
              qrylocinskudetail.FieldByName('conno').AsString:=qryTmp.fieldbyname('conno').AsString;
  //            qrylocinskudetail.FieldByName('locid').AsString:=strlocid;
  //            qrylocinskudetail.FieldByName('locname').AsString:=strlocname;
              qrylocinskudetail.FieldByName('color').AsString:=qryTmp.fieldbyname('color').AsString;
              qrylocinskudetail.FieldByName('skuspec').AsString:=qryTmp.fieldbyname('skuspec').AsString;
              qrylocinskudetail.FieldByName('quantity').AsFloat:=qryTmp.fieldbyname('quantity').AsFloat;
              qrylocinskudetail.FieldByName('piece').AsFloat:=qryTmp.fieldbyname('piece').AsFloat;
              qrylocinskudetail.FieldByName('grossweight').AsFloat:=qryTmp.fieldbyname('grossweight').AsFloat;
              qrylocinskudetail.FieldByName('netweight').AsFloat:=qryTmp.fieldbyname('netweight').AsFloat;
              SkuInsert(qrylocinskudetail.FieldByName('skuid').AsString,qrylocinskudetail.FieldByName('skuname').AsString);
              qrylocinskudetail.Post;
              qryTmp.Next;
           end;
           qrylocinskudetail.EnableControls;
         end;  

      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;
//
   if edtConnoScan.text<>'' then
      strfilter:=' and conno in ("'+edtConnoScan.Text+'")';
   if getSysdata('cusname')<>'SWZ' then
   begin
      if edtCustomerNo.Text<>'' then
      strfilter:=strfilter+' and serialno="'+edtCustomerNo.Text+'"';
   end;


   qrylocinskudetail.DisableControls;
   try
      FileTOGrid(qrylocinskudetail,grdSKUDetail,edtPath.Text,cmbTemple.TextField);
   except
      qrylocinskudetail.EnableControls;
      exit;
   end;


   OpenSql(qryTmp,'select * from #lskformatin where 1=1'+strfilter);
   while not qrytmp.Eof do
   begin
      qrylocinskudetail.Append;
      grdSKUDetailBeforeInsert;
      i:=0;
      while i<qryTmp.FieldCount do
      begin
//         PrevValue:=qryTmp.Fields[i].Value;
//         strsql:=qryTmp.Fields[i].FieldName;
         qrylocinskudetail.FieldByName(qryTmp.Fields[i].FieldName).Value:=qryTmp.Fields[i].Value;
         inc(i);
      end;
      qrylocinskudetail.Post;
      qryTmp.Next;
   end;
   qrylocinskudetail.EnableControls;
end;

procedure TfrmLocInSKUDetail.edtdepthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
     if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     qrylocinskudetail.Edit;
     qrylocinskudetail.FieldByName('depth').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
     qrylocinskudetail.FieldByName('volume').AsFloat:=
           qrylocinskudetail.FieldByName('piece').AsFloat*qrylocinskudetail.FieldByName('depth').AsFloat
           *qrylocinskudetail.FieldByName('width').AsFloat*qrylocinskudetail.FieldByName('height').AsFloat;
     Accept:=True;
   end;
end;

procedure TfrmLocInSKUDetail.edtwidthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
     if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     qrylocinskudetail.Edit;
     qrylocinskudetail.FieldByName('width').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
     qrylocinskudetail.FieldByName('volume').AsFloat:=
           qrylocinskudetail.FieldByName('piece').AsFloat*qrylocinskudetail.FieldByName('depth').AsFloat
           *qrylocinskudetail.FieldByName('width').AsFloat*qrylocinskudetail.FieldByName('height').AsFloat;
     Accept:=True;
   end;
end;

procedure TfrmLocInSKUDetail.edtheightValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
     if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     qrylocinskudetail.Edit;
     qrylocinskudetail.FieldByName('height').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
     qrylocinskudetail.FieldByName('volume').AsFloat:=
           qrylocinskudetail.FieldByName('piece').AsFloat*qrylocinskudetail.FieldByName('depth').AsFloat
           *qrylocinskudetail.FieldByName('width').AsFloat*qrylocinskudetail.FieldByName('height').AsFloat;
     Accept:=True;
   end;
end;

procedure TfrmLocInSKUDetail.pieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
     if StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
     begin
        ErrorText:=_strnumberzero;
        Accept:=False;
        exit;
     end;
     qrylocinskudetail.Edit;
     qrylocinskudetail.FieldByName('piece').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
     qrylocinskudetail.FieldByName('volume').AsFloat:=
           qrylocinskudetail.FieldByName('piece').AsFloat*qrylocinskudetail.FieldByName('depth').AsFloat
           *qrylocinskudetail.FieldByName('width').AsFloat*qrylocinskudetail.FieldByName('height').AsFloat;
     Accept:=True;
   end;
end;

end.

