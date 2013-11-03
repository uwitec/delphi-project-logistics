unit LIOSKUDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, KinPickEdit, dxDBELib, dxCntner, dxEditor,
  DBKINCGrids, KSText, ComCtrls, frstatus, StdCtrls, KGroupBox, Menus,
  DBTables, DB,libuser,libproc, KBitBtn, KUpdateSql, GMSLabel, ExtCtrls,
  KDataSetProvider, DBClient, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  Buttons, ADODB;

type
  TSKUdetail = record
     quantity:Extended;
     piece:Extended;
     volume:Extended;
     area:Extended;
     grossweight:Extended;
     netweight:Extended;
     OKflag:Boolean;
  end;
  TfrmLIOSKUDetail = class(TForm)
    ppmSKUDetail: TPopupMenu;
    mitSkuAdd: TMenuItem;
    mitSkuDel: TMenuItem;
    dtsskudetail: TDataSource;
    grdSKUDetail: TdxDBGrid;
    edtSKUSNO: TdxDBGridColumn;
    edtSKUSerialNO: TdxDBGridColumn;
    edtQUANTITY: TdxDBGridCurrencyColumn;
    edtPiece: TdxDBGridCurrencyColumn;
    edtSKUSKUName: TdxDBGridButtonColumn;
    edtVolume: TdxDBGridCurrencyColumn;
    edtArea: TdxDBGridCurrencyColumn;
    edtGrossWeight: TdxDBGridCurrencyColumn;
    edtNetWeight: TdxDBGridCurrencyColumn;
    KGroupBox1: TKGroupBox;
    skubrand: TdxDBGridColumn;
    edtdepth: TdxDBGridColumn;
    edtwidth: TdxDBGridColumn;
    edtheight: TdxDBGridColumn;
    UnKnowQ: TdxDBGridCheckColumn;
    btnSave: TKBitBtn;
    btnSaveClose: TKBitBtn;
    KBitBtn5: TKBitBtn;
    btnEdit: TKBitBtn;
    edtqualityname: TdxDBGridButtonColumn;
    cmbQUANTITYUOM: TdxDBGridKinPickColumn;
    cmbPieceUOM: TdxDBGridKinPickColumn;
    cmbVolumeUOM: TdxDBGridKinPickColumn;
    cmbAreaUOM: TdxDBGridKinPickColumn;
    cmbWeightUOM: TdxDBGridKinPickColumn;
    sizeuom: TdxDBGridKinPickColumn;
    ppmSkuSelect: TPopupMenu;
    mitSku: TMenuItem;
    mitOrder: TMenuItem;
    qryTmp: TKADOQuery;
    qrytmp1: TKADOQuery;
    lotcode: TdxDBGridColumn;
    quantity_piece_prop: TdxDBGridCurrencyColumn;
    conno: TdxDBGridColumn;
    remark: TdxDBGridBlobColumn;
    mitcopy: TMenuItem;
    mitplaste: TMenuItem;
    mitColumnset: TMenuItem;
    Panel2: TPanel;
    KGroupBox12: TKGroupBox;
    edtLotCodeScan: TdxEdit;
    edtSerialNOScan: TdxEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    btnInput: TKBitBtn;
    edtQuantityP: TdxCalcEdit;
    edtNetWeightP: TdxCalcEdit;
    edtcolor: TdxDBGridColumn;
    edtskuspec: TdxDBGridColumn;
    ckbTotal: TdxCheckEdit;
    Panel1: TPanel;
    KGroupBox2: TKGroupBox;
    KBitBtn1: TKBitBtn;
    edtPath: TdxButtonEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    AqryMtf: TADOQuery;
    conMtf: TADOConnection;
    OpenDialog1: TOpenDialog;
    mitskudetail: TMenuItem;
    manufacturedate: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    xh: TdxDBGridColumn;
    skumodel: TdxDBGridColumn;
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
    procedure qryskudetailBeforePost(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure KBitBtn5Click(Sender: TObject);
    procedure btnSaveCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure edtSKUSKUNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtqualitynameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitSkuClick(Sender: TObject);
    procedure mitOrderClick(Sender: TObject);
    procedure edtdepthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtwidthValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtheightValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtPieceValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure cmbVolumeUOMValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure sizeuomValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure quantity_piece_propValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure mitcopyClick(Sender: TObject);
    procedure mitplasteClick(Sender: TObject);
    procedure mitColumnsetClick(Sender: TObject);
    procedure edtSerialNOScanExit(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure KBitBtn1Click(Sender: TObject);
    procedure mitskudetailClick(Sender: TObject);
  private
    { Private declarations }
    maxsno:Integer;
    copyskuid:string;
    copyskuname:string;
    copyskubrand:string;
    copyqualityname:string;
    Copyquantityuom:string;
    copypieceuom:string;
    copyvolumeuom:string;
    copyweightuom:string;
    //lzw20120112
    copyskuspec,copyskumodel:string;
    copylotcode,copymanufacturedate:string;
    copypiecepro,copyquantitypro,copyweightpro:extended;
    copyareauom:string;
    copysizeuom:string;
    copydepth:Extended;
    copywidth:Extended;
    copyheight:Extended;
    copyquantity:Extended;
    copypiece:Extended;
    copyarea:Extended;
    copynetweight:Extended;
    copygrossweight:Extended;
    copyvolume:Extended;
    iscopy:Boolean;//是否复制
    strupdtablename:string;
    theresult : TSkudetail;
    qrylocskudetail,qrylocationitem:TKADOQuery;//传入qry操作

    procedure EnableEdit;
    procedure DisableEdit;
    procedure WorkCall(CallMode:TDataState);
    procedure grdSKUDetailBeforeInsert;
    function GetScale(pstrUomVolume,pstrUomSize:String):Extended;
  public
    { Public declarations }
    isupdate:Boolean;
    procedure CreateParams(var Params: TCreateParams);override;
  end;

function workLIOSKUDetail(Callmode:TdataState;pstrjobno:string;pintldsno:integer;
                        pskuid,pskuname:string;pstrtablename:string;
                        pintOpType:Integer;pstrIsold:string;
                        pstrjobnin,pstrjobnoorder:string;pintsnoin,pintsnoorder:Integer;pqrylocationinitem:TKADOQuery=nil):TSKUdetail;

var
  frmLIOSKUDetail: TfrmLIOSKUDetail;

implementation

{$R *.dfm}

uses main,datas,Kindlg,libuserPub,SKUDetailSelect,GetDllPub,SetGrid;

var
   DataState:TDataState;
   strsql:string;
   strjobno:string;
   intldsno:Integer;
   strtablename:string;
   intOpType:Integer;
   strIsOld:string;
   strSkuid:string;
   strSkuName:string;
   strjobnoin:string; //对应进仓工作号
   Intsnoin:Integer;//对应进仓序号
   strjobnoorder:string; //对应指令工作号
   Intsnoorder:Integer; //对应指令序号
   qrylocationinitem:TKADOQuery;

function workLIOSKUDetail(Callmode:TdataState;pstrjobno:string;pintldsno:integer;
                        pskuid,pskuname:string;pstrtablename:string;
                        pintOpType:Integer;pstrIsold:string;
                        pstrjobnin,pstrjobnoorder:string;pintsnoin,pintsnoorder:Integer;pqrylocationinitem:TKADOQuery=nil):TSKUdetail;
//pqryuom:获取商品信息中的单位信息.
begin
   strtablename:=pstrtablename;
   strjobno:=pstrjobno;
   intldsno:=pintldsno;
   intOpType:=pintOpType;
   strIsold:=pstrIsold;
   strskuid:=pskuid;
   strskuname:=pskuname;
   strjobnoin:=pstrjobnin;
   Intsnoin:=pintsnoin;
   strjobnoorder:=pstrjobnoorder;
   Intsnoorder:=pintsnoorder;
   qrylocationinitem:=pqrylocationinitem;
   if frmLIOSKUDetail <> nil then
   with frmLIOSKUDetail do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     ShowModal;
     workLIOSKUDetail:=theresult;
     Exit;
   end;
   frmLIOSKUDetail:=TfrmLIOSKUDetail.Create(Application);
   with frmLIOSKUDetail do
   begin
      copyskuid:='';
      copyskuname:='';

      if  intOpType=1 then
         Panel1.Visible:=True
      else if intOpType=-1 then
         Panel1.Visible:=False;
         
      InitdbPick(cmbVolumeUom,'uom','uomname','uomname',' uomtype like "%体积%" ');
      InitdbPick(cmbAreaUom,'uom','uomname','uomname',' uomtype like "%面积%" ');
      InitdbPick(cmbweightUom,'uom','uomname','uomname',' uomtype like "%重量%" ');
      InitdbPick(cmbpieceUom,'uom','uomname','uomname',' uomtype like "%件数%" ');
      InitdbPick(cmbquantityUom,'uom','uomname','uomname',' uomtype like "%件数%" ');
      InitdbPick(sizeuom,'uom','uomname','uomname',' uomtype like "%尺寸%" ');
//      qryskudetail.Open;
      if  intOpType=1 then
      qrylocskudetail:=data.qryLocInSkuDetail
      else if intOpType=-1 then
      qrylocskudetail:=data.qryLocOutSkuDetail
      else
      qrylocskudetail:=data.qryWareorderSkuDetail;

      if _manufacture='T' then
      begin
         skubrand.Caption :='工位';
         edtcolor.Caption :='工程号';
      end ;
      if getSysdata('qdtext')='T' then
      begin
         conno.Caption:='集装箱号';
      end;  
      dtsskudetail.DataSet:=qrylocskudetail;
      workCall(CallMode);
      showmodal;
      worklioSKUDetail:=theresult;
      Free;
   end;
end;

procedure TfrmLIOSKUDetail.CreateParams(var Params: TCreateParams);
begin
  self.Formstyle := fsNormal;
  self.Visible := False;
  self.Position := poScreenCenter;
  inherited CreateParams(Params);
end;

procedure TfrmLIOSKUDetail.WorkCall(CallMode:TDataState);
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
          qrylocskudetail.Edit;
          //在修改的状态下，对qrySKUDetail循环
{          qrylocskudetail.DisableControls;
          maxSno:=0;
          qrylocskudetail.First;
          while not qrylocskudetail.Eof do
          begin
             if qrylocskudetail.FieldByName('ldsno').AsInteger>maxSno
             then maxSno:=qrylocskudetail.FieldByName('ldsno').AsInteger;
             qrylocskudetail.Next;
          end;
          qrylocskudetail.EnableControls;
 }
          EnableEdit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
//          qrylocskudetail.append;
          EnableEdit;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

procedure TfrmLIOSKUDetail.EnableEdit;
begin
   LibComControl(Self,[1..5],[50]+[10..20]);
   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior+[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=False;
   grdSKUDetail.ClearGroupColumns;
end;

procedure TfrmLIOSKUDetail.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
   libComControl(self,[10..11],[1..5]);

   grdSKUDetail.OptionsBehavior:=grdSKUDetail.OptionsBehavior-[edgoEditing];
   grdSKUDetail.OptionsDB:=grdSKUDetail.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdSKUDetail.ShowGroupPanel:=True;
end;

procedure TfrmLIOSKUDetail.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetDxDbGrid(grdSKUDetail);

   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox12);
//   qrylocskudetail.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
   qrytmp1.Connection:=_ADOConnection;
 {  if intOpType=-1 then
   begin
      mitcopy.Visible:=false;
      mitplaste.Visible:=false;
   end;
   if DataState=stbrowse then
   begin
      if intOpType=1 then
         strsql:=' ksp_GetLocInSkuDetailByJobno @jobno="'+strjobno+'" '
      else strsql:=' ksp_GetLocoutSkuDetailByJobno @jobno="'+strjobno+'" ' ;

//      strsql:=' ksp_skudetail @jobno="'+strjobno+'",@tablename="'+strtablename+'",@strfilter="sno='+IntToStr(intldsno)+'"';
      qryskudetail.SQL.Clear;
      qryskudetail.SQL.Add(strsql);
      qryskudetail.Filtered:=true;
      qryskudetail.Filter:='sno='+inttostr(intldsno) ;
   end else
   begin
      strsql:=' ksp_skudetail @jobno="'+strjobno+'",@tablename="'+strtablename+'",@strfilter=""';
      qryskudetail.SQL.Clear;
      qryskudetail.SQL.Add(strsql);
   end;  }
end;

procedure TfrmLIOSKUDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not (DataState in setdcs) then
      Action := caFree
   else
   begin
      copyskuid:='';
      copyskuname:='';
      copyskubrand:='';
      copyqualityname:='';
      Copyquantityuom:='';
      copypieceuom:='';
      copyvolumeuom:='';
      copyweightuom:='';
      copyareauom:='';
      copyskuspec:='';
      copyskumodel:='';
      copylotcode:='';
      copymanufacturedate:='';
      copysizeuom:='';
      copydepth:=0;
      copywidth:=0;
      copyheight:=0;
      copypiecepro:=0;
      copyquantitypro:=0;
      copyweightpro:=0;

   end;
end;

procedure TfrmLIOSKUDetail.FormDestroy(Sender: TObject);
var
   arrskudetail:Variant;
begin
{   Lampchange(lsMenu);
   _skudetailupdsucc:=True;
   if (DataState in Setdcs) and isupdate then
   begin
      if qryskudetail.UpdateStatus in [usModified, usInserted, usDeleted] then
      begin
         try
            qryskudetail.Filtered:=false;
//            arrskudetail:=ScatterToArray(qryskudetail,False,0);
            qryskudetail.ApplyUpdates;
            qryskudetail.CommitUpdates;
//             if (_isskudetail='T') and (intOpType=-1) then
//             ExecSql(qryTmp,'ksp_outskudetail @jobno="'+strjobno+'"');
         except
             if _adoconnection.InTransaction then
                _adoconnection.Rollback;
             _skudetailupdsucc:=false;
//             qryskudetail.DisableControls;
//             qryskudetail.First;
//             while not qryskudetail.Eof do
//             begin
//                qryskudetail.Delete;
//             end;
//             qryskudetail.EnableControls;
//             GatherFromArray(qryskudetail,arrskudetail,true);
//             frmLIOSKUDetail.Visible:=False;
//             Exit;
         end;
      end;
   end;   }
   frmLIOSKUDetail:=nil;   
end;

procedure TfrmLIOSKUDetail.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLIOSKUDetail.grdSKUDetailChangeNodeEx(Sender: TObject);
begin
   if grdSKUDetail.Datalink.DataSet.State = dsInsert then
   begin
      grdSKUDetailBeforeInsert;
   end;
end;

procedure TfrmLIOSKUDetail.grdSKUDetailEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
   begin
      Allow:=True;
   end;
end;

procedure TfrmLIOSKUDetail.grdSKUDetailEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (qrylocskudetail.IsEmpty) then
   begin
      mitSKUAddClick(Sender);
   end;
end;

procedure TfrmLIOSKUDetail.grdSKUDetailExit(Sender: TObject);
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

procedure TfrmLIOSKUDetail.grdSKUDetailKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLIOSKUDetail.grdSKUDetailBeforeInsert;
begin
   qrylocskudetail.FieldByName('ldsno').AsInteger:=-1;
   qrylocskudetail.FieldByName('sno').AsInteger:=intldsno;
   qrylocskudetail.FieldByName('detailsno').AsInteger:=-1;
//   qrylocskudetail.FieldByName('isold').AsString:=strIsOld;
   qrylocskudetail.FieldByName('jobno').AsString:=strjobno;
//   qrylocskudetail.FieldByName('operationtype').AsInteger:=intOpType;
   if  intOpType<>-1 then
   begin
      if intOpType=1 then
         qrylocskudetail.FieldByName('tracktype').AsString:='RG';
      qrylocskudetail.FieldByName('skuid').AsString:=iif(copyskuid='',strSkuid,copyskuid);
      qrylocskudetail.FieldByName('skuname').AsString:=iif(copyskuname='',strSkuname,copyskuname);
      qrylocskudetail.FieldByName('skubrand').AsString:=copyskubrand;
      qrylocskudetail.FieldByName('quantityuom').AsString:=
                     iif(Copyquantityuom='',qrylocationinitem.FieldByName('quantityuom').AsString,Copyquantityuom);
      qrylocskudetail.FieldByName('pieceuom').AsString:=
                     iif(copypieceuom='',qrylocationinitem.FieldByName('pieceuom').AsString,copypieceuom);
      qrylocskudetail.FieldByName('volumeuom').AsString:=
                     iif(copyvolumeuom='',qrylocationinitem.FieldByName('volumeuom').AsString,copyvolumeuom);
      qrylocskudetail.FieldByName('weightuom').AsString:=
                     iif(copyweightuom='',qrylocationinitem.FieldByName('weightuom').AsString,copyweightuom);
      qrylocskudetail.FieldByName('areauom').AsString:=
                     iif(copyareauom='',qrylocationinitem.FieldByName('areauom').AsString,copyareauom);
      qrylocskudetail.FieldByName('sizeuom').AsString:=
                     iif(copysizeuom='',qrylocationinitem.FieldByName('sizeuom').AsString,copysizeuom);
      //lzw20120112
      qrylocskudetail.FieldByName('skuspec').AsString:=
                     iif(copyskuspec='',qrylocationinitem.FieldByName('skuspec').AsString,copyskuspec);
      qrylocskudetail.FieldByName('skumodel').AsString:=
                     iif(copyskumodel='',qrylocationinitem.FieldByName('skumodel').AsString,copyskumodel);
      qrylocskudetail.FieldByName('lotcode').AsString:=
                     iif(copylotcode='',qrylocationinitem.FieldByName('lotcode').AsString,copylotcode);
      qrylocskudetail.FieldByName('manufacturedate').AsString:=
                     iif(copymanufacturedate='',qrylocationinitem.FieldByName('manufacturedate').AsString,copymanufacturedate);
      qrylocskudetail.FieldByName('Quantity_Piece_Prop').AsFloat:=
                     iif(copypiecepro=0,qrylocationinitem.FieldByName('piecepro').AsString,copypiecepro);
      qrylocskudetail.FieldByName('Quantity_NetWeight_Prop').AsFloat:=
                     iif(copyweightpro=0,qrylocationinitem.FieldByName('netweightpro').AsString,copyweightpro);


      qrylocskudetail.FieldByName('quantity').AsFloat:=1;
      qrylocskudetail.FieldByName('piece').AsFloat:=1;
      if iscopy then
      begin
         qrylocskudetail.FieldByName('depth').AsFloat:=copydepth;
         qrylocskudetail.FieldByName('height').AsFloat:=copyheight;
         qrylocskudetail.FieldByName('width').AsFloat:=copywidth;
         qrylocskudetail.FieldByName('Quantity_Piece_Prop').AsFloat:=copypiecepro;
         qrylocskudetail.FieldByName('Quantity_NetWeight_Prop').AsFloat:=copyweightpro;

         qrylocskudetail.fieldbyname('quantity').AsFloat:=copyquantity;
         qrylocskudetail.fieldbyname('piece').AsFloat:=copypiece;
         qrylocskudetail.fieldbyname('area').AsFloat:=copyarea;
         qrylocskudetail.fieldbyname('netweight').AsFloat:=copynetweight;
         qrylocskudetail.fieldbyname('grossweight').AsFloat:=copygrossweight;
         qrylocskudetail.fieldbyname('volume').AsFloat:=copyvolume;
      end;
   end;
end;

procedure TfrmLIOSKUDetail.mitSkuAddClick(Sender: TObject);
begin
   grdSKUdetail.SetFocus;
   qrylocskudetail.Append;
   grdSKUDetailBeforeInsert;
end;

procedure TfrmLIOSKUDetail.mitSkuDelClick(Sender: TObject);
begin
   if qrylocskudetail.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       grdSKUdetail.SetFocus;
       qrylocskudetail.Delete;
    end;
end;

procedure TfrmLIOSKUDetail.qryskudetailBeforePost(DataSet: TDataSet);
begin
{   with grdSKUDetail do
   begin
      if (Datalink.DataSet.State in  [dsInsert,dsEdit]) then
      begin
         if   ValueIsInvalid(FocusedNode.Values[edtSKUSKUName.Index],edtSKUSKUName.field) then
         begin
           exit;
         end else
         if (qryskudetail.fieldbyname('quantity').asinteger=0)
           and ((FocusedNode.Values[edtQuantity.Index]=null)
           or (FocusedNode.Values[edtQuantity.Index]=0)) then
         begin        //VarIsNull
            MessageBeep(0);
            if IsWindowVisible(Handle) then Windows.SetFocus(Handle);
            raise EdxEditInvalidInput.Create(GetMessage('frmSKUDetail','001'));  //'数量不可为0!'
            exit;
         end;
         if Datalink.DataSet.State = dsInsert then
         begin
            maxsno:=maxsno+1;
            qryskudetail.FieldByName('ldsno').asinteger:=maxSno;
            qryskudetail.fieldByname('jobno').AsString:=strjobno;
            qryskudetail.FieldByName('sno').AsInteger:=intldsno;
            qryskudetail.FieldByName('isold').AsString:=strIsOld;
         end;
      end;
   end;
   if (DataState in Setdcs) and not iscopy then
   begin
      copyskuid:=qryskudetail.fieldbyname('skuid').AsString;
      copyskuname:=qryskudetail.fieldbyname('skuname').AsString;
      copyqualityname:=qryskudetail.fieldbyname('qualityname').AsString;
      copyskubrand:=qryskudetail.fieldbyname('skubrand').AsString;
      Copyquantityuom:=qryskudetail.fieldbyname('quantityuom').AsString;
      copypieceuom:=qryskudetail.fieldbyname('pieceuom').AsString;
      copyweightuom:=qryskudetail.fieldbyname('weightuom').AsString;
      copyareauom:=qryskudetail.fieldbyname('areauom').AsString;
      copyvolumeuom:=qryskudetail.fieldbyname('volumeuom').AsString;
      copysizeuom:=qryskudetail.fieldbyname('sizeuom').AsString;
   end;}
end;

procedure TfrmLIOSKUDetail.btnOkClick(Sender: TObject);
begin
   frmLIOSKUDetail.close;
end;

procedure TfrmLIOSKUDetail.KBitBtn5Click(Sender: TObject);
begin
   WorkCall(stBrowse);
   close;
end;

procedure TfrmLIOSKUDetail.btnSaveCloseClick(Sender: TObject);
begin
   if (DataState in Setdcs) then
   begin
      if ckbTotal.Checked then
      begin
         theresult.quantity:=StrToFloat(edtQUANTITY.SummaryFootertext);
         theresult.piece:=StrToFloat(edtPiece.SummaryFootertext);
         theresult.area :=StrToFloat(edtArea.SummaryFooterText);
         theresult.volume :=StrToFloat(edtVolume.SummaryFooterText);
         theresult.grossweight :=StrToFloat(edtGrossWeight.SummaryFooterText);
         theresult.netweight :=StrToFloat(edtNetWeight.SummaryFooterText);
         theresult.Okflag:=true;
      end else
      theresult.Okflag:=false;
   end;
   frmLIOSKUDetail.Close;
end;

procedure TfrmLIOSKUDetail.btnEditClick(Sender: TObject);
begin
   WorkCall(stEdit);
end;

procedure TfrmLIOSKUDetail.edtSKUSKUNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pt:TPoint;
   rect:TRect;
begin
   if DataState in Setdcs then
   begin
      if (strjobnoorder<>'') then
      begin
         rect:=grdSKUDetail.CellRect(grdSKUDetail.FocusedNode,edtSKUSKUName.Index);
         pt:=ClientToScreen(Point(rect.Left+grdSKUDetail.left,
             rect.Bottom +grdSKUDetail.Top));
         ppmSkuSelect.Popup(pt.x,pt.y);
      end else
         mitSKU.Click;
   end;
end;

procedure TfrmLIOSKUDetail.edtqualitynameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if DataState in setDcs then
   begin
        qrylocskudetail.edit;
        qrylocskudetail.FieldByName('QualityName').AsString:=
           pGetqualitySelect(qrylocskudetail.FieldByName('QualityName').AsString);
   end;
end;

procedure TfrmLIOSKUDetail.mitSkuClick(Sender: TObject);
var
   i:integer;
   TSKUDetailSelect:TMultSkuDetailSelect;
   qryselect:TKADOQuery;
begin
 //出仓数据从对应进仓挑选
   if (intOpType=-1) then   //and (UpperCase(strtablename)='LIOSKUDETAIL')
   begin
      TSKUDetailSelect:=WorkSKUDetailSelect(strjobnoin,intsnoin,strtablename,-1);
      for i:=0 to 100 do
      begin
        if TSKUDetailSelect[i].OkFlag then
        begin
          if i=0 then
          begin
            qrylocskudetail.edit;
          end else
          begin
            qrylocskudetail.append;
          end;
          qrylocskudetail.fieldbyname('SKUID').asstring                   :=TSKUDetailSelect[i].SKUID            ;
          qrylocskudetail.fieldbyname('SKUName').asstring                 :=TSKUDetailSelect[i].SKUName          ;
          qrylocskudetail.fieldbyname('SKUbrand').asstring                :=TSKUDetailSelect[i].SKUbrand        ;
          qrylocskudetail.fieldbyname('qualityname').asstring             :=TSKUDetailSelect[i].qualityname  ;
          qrylocskudetail.fieldbyname('Quantity').asFloat                 :=TSKUDetailSelect[i].syQuantity       ;
          qrylocskudetail.fieldbyname('QuantityUOM').asstring             :=TSKUDetailSelect[i].QuantityUOM      ;
          qrylocskudetail.fieldbyname('PieceUOM').asstring                :=TSKUDetailSelect[i].PieceUOM         ;
          qrylocskudetail.fieldbyname('WeightUOM').asstring               :=TSKUDetailSelect[i].WeightUOM        ;
          qrylocskudetail.fieldbyname('VolumeUOM').asstring               :=TSKUDetailSelect[i].VolumeUOM        ;
          qrylocskudetail.Fieldbyname('AreaUOM').asstring                 :=TSKUDetailSelect[i].AreaUOM          ;
          qrylocskudetail.Fieldbyname('sizeuom').asstring                 :=TSKUDetailSelect[i].SizeUOM          ;
          qrylocskudetail.fieldbyname('Piece').asFloat                    :=TSKUDetailSelect[i].syPiece          ;
          qrylocskudetail.fieldbyname('NetWeight').asFloat                :=TSKUDetailSelect[i].syNetWeight      ;
          qrylocskudetail.Fieldbyname('GrossWeight').asFloat              :=TSKUDetailSelect[i].syGrossWeight    ;
          qrylocskudetail.fieldbyname('Volume').asFloat                   :=TSKUDetailSelect[i].syVolume         ;
          qrylocskudetail.Fieldbyname('Area').asFloat                     :=TSKUDetailSelect[i].syArea           ;

          if  (TSKUDetailSelect[i].syPiece<>0) and (TSKUDetailSelect[i].syQuantity<>0) then
          qrylocskudetail.Fieldbyname('Quantity_Piece_Prop').asFloat      :=1/TSKUDetailSelect[i].syPiece/TSKUDetailSelect[i].syQuantity;

          if  (TSKUDetailSelect[i].syVolume<>0) and (TSKUDetailSelect[i].syQuantity<>0) then
          qrylocskudetail.Fieldbyname('Quantity_Volume_Prop').asFloat     :=TSKUDetailSelect[i].syVolume/TSKUDetailSelect[i].syQuantity;

          if  (TSKUDetailSelect[i].syNetWeight<>0) and (TSKUDetailSelect[i].syQuantity<>0) then
          qrylocskudetail.fieldbyname('Quantity_NetWeight_Prop').asFloat  :=TSKUDetailSelect[i].syNetWeight/TSKUDetailSelect[i].syQuantity;

          if  (TSKUDetailSelect[i].syGrossWeight<>0) and (TSKUDetailSelect[i].syQuantity<>0) then
          qrylocskudetail.fieldbyname('Quantity_GrossWeight_Prop').asFloat:=TSKUDetailSelect[i].syGrossWeight/TSKUDetailSelect[i].syQuantity;

          if  (TSKUDetailSelect[i].syArea<>0) and (TSKUDetailSelect[i].syQuantity<>0) then
          qrylocskudetail.fieldbyname('Quantity_Area_Prop').asFloat       :=TSKUDetailSelect[i].syArea/TSKUDetailSelect[i].syQuantity;

          qrylocskudetail.fieldbyname('JOBNOIN').asstring                 :=TSKUDetailSelect[i].Jobno;
          qrylocskudetail.Fieldbyname('SNOIN').asInteger                  :=TSKUDetailSelect[i].SNO;
          qrylocskudetail.Fieldbyname('LDSNOIN').asInteger                :=TSKUDetailSelect[i].LDSNO;
          qrylocskudetail.Fieldbyname('DetailSNOIN').asInteger          :=TSKUDetailSelect[i].DetailSNO;
          qrylocskudetail.fieldbyname('LotCode').asstring                 :=TSKUDetailSelect[i].LotCode;
          qrylocskudetail.fieldbyname('SerialNO').asstring                :=TSKUDetailSelect[i].SerialNO;
          qrylocskudetail.Fieldbyname('depth').asFloat                    :=TSKUDetailSelect[i].depth;
          qrylocskudetail.Fieldbyname('width').asFloat                    :=TSKUDetailSelect[i].width;
          qrylocskudetail.Fieldbyname('height').asFloat                   :=TSKUDetailSelect[i].height;
          try
             qrylocskudetail.Post;
          except
             break;
          end;
        end else break;
      end;
   end else
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
               qrylocskudetail.Edit;
            end else
               qrylocskudetail.Append;
            Inc(i);
            qrylocskudetail.Fieldbyname('quantity').AsInteger  :=1;
            if fieldbyname('PiecePro').AsFloat<>0 then
            qrylocskudetail.Fieldbyname('piece').AsFloat  :=
                qrylocskudetail.Fieldbyname('quantity').AsInteger/fieldbyname('PiecePro').AsFloat
            else
            qrylocskudetail.Fieldbyname('piece').AsFloat:=1;
            qrylocskudetail.Fieldbyname('volume').AsFloat :=
                fieldbyname('VolumePro').AsFloat*qrylocskudetail.Fieldbyname('piece').AsFloat;
            qrylocskudetail.Fieldbyname('area').AsFloat  :=
                fieldbyname('AreaPro').asfloat*qrylocskudetail.Fieldbyname('piece').AsFloat;
            qrylocskudetail.Fieldbyname('netweight').AsFloat  :=
                fieldbyname('WeightPro').AsFloat*qrylocskudetail.Fieldbyname('piece').AsFloat;
            qrylocskudetail.Fieldbyname('grossweight').AsFloat  :=
                fieldbyname('WeightPro').AsFloat*qrylocskudetail.Fieldbyname('piece').AsFloat;
            qrylocskudetail.FieldByName('SkuId').AsString  :=fieldbyname('skuid').AsString;
            qrylocskudetail.FieldByName('SkuName').AsString  :=fieldbyname('skuname').AsString;
            qrylocskudetail.FieldByName('QuantityUOM').AsString:=fieldbyname('QuantityUOM').AsString;
            qrylocskudetail.FieldByName('pieceuom').AsString   :=IIF(fieldbyname('PieceUOM').AsString='',
                                                                  copypieceuom,fieldbyname('PieceUOM').AsString);
            qrylocskudetail.FieldByName('volumeuom').AsString  :=IIF(fieldbyname('VolumeUOM').AsString='',
                                                                 copyvolumeuom,fieldbyname('VolumeUOM').AsString);
            qrylocskudetail.FieldByName('areauom').AsString    :=IIF(fieldbyname('AreaUOM').AsString='',
                                                                 copyareauom,fieldbyname('AreaUOM').AsString);
            qrylocskudetail.FieldByName('weightuom').AsString  :=IIF(fieldbyname('WeightUOM').AsString='',
                                                                  copyweightuom,fieldbyname('WeightUOM').AsString);
            qrylocskudetail.FieldByName('sizeuom').AsString  :=IIF(fieldbyname('sizeuom').AsString='',
                                                                 copysizeuom,fieldbyname('sizeuom').AsString);
            qrylocskudetail.Fieldbyname('quantity_piece_prop').AsFloat  :=fieldbyname('PiecePro').AsFloat;
            qrylocskudetail.Fieldbyname('quantity_volume_prop').AsFloat  :=fieldbyname('volumepro').AsFloat;
            qrylocskudetail.Fieldbyname('Quantity_Area_Prop').AsFloat  :=fieldbyname('areapro').AsFloat;
            qrylocskudetail.Fieldbyname('quantity_netweight_prop').AsFloat  :=fieldbyname('weightpro').AsFloat;
            qrylocskudetail.Fieldbyname('quantity_grossweight_prop').AsFloat  :=fieldbyname('weightpro').AsFloat;
            try
               qrylocskudetail.Post;
            except
               break;
            end;
            Next;
         end;
      end;
      FreeAndNil(qryselect);
   end;
end;

procedure TfrmLIOSKUDetail.mitOrderClick(Sender: TObject);
var
   TSKUDetailSelect:TMultSkuDetailSelect;
   I:Integer;
begin
   TSKUDetailSelect:=WorkSKUDetailSelect(strjobnoorder,intsnoorder,strtablename,intOpType);
   for i:=0 to 100 do
   begin
     if TSKUDetailSelect[i].OkFlag then
     begin
       if i=0 then
       begin
         qrylocskudetail.edit;
       end else
       begin
         qrylocskudetail.append;
       end;
       qrylocskudetail.fieldbyname('SKUID').asstring               :=TSKUDetailSelect[i].SKUID            ;
       qrylocskudetail.fieldbyname('SKUName').asstring             :=TSKUDetailSelect[i].SKUName          ;
       qrylocskudetail.fieldbyname('Quantity').asFloat             :=TSKUDetailSelect[i].syQuantity       ;
       qrylocskudetail.fieldbyname('QuantityUOM').asstring         :=TSKUDetailSelect[i].QuantityUOM      ;
       qrylocskudetail.fieldbyname('PieceUOM').asstring            :=TSKUDetailSelect[i].PieceUOM         ;
       qrylocskudetail.fieldbyname('WeightUOM').asstring           :=TSKUDetailSelect[i].WeightUOM        ;
       qrylocskudetail.fieldbyname('VolumeUOM').asstring           :=TSKUDetailSelect[i].VolumeUOM        ;
       qrylocskudetail.Fieldbyname('AreaUOM').asstring             :=TSKUDetailSelect[i].AreaUOM          ;
       qrylocskudetail.fieldbyname('Piece').asFloat                :=TSKUDetailSelect[i].syPiece          ;
       qrylocskudetail.fieldbyname('NetWeight').asFloat            :=TSKUDetailSelect[i].syNetWeight      ;
       qrylocskudetail.Fieldbyname('GrossWeight').asFloat          :=TSKUDetailSelect[i].syGrossWeight    ;
       qrylocskudetail.fieldbyname('Volume').asFloat               :=TSKUDetailSelect[i].syVolume         ;
       qrylocskudetail.Fieldbyname('Area').asFloat                 :=TSKUDetailSelect[i].syArea           ;
       qrylocskudetail.Fieldbyname('Quantity_Piece_Prop').asFloat      :=1/TSKUDetailSelect[i].syPiece/TSKUDetailSelect[i].syQuantity;
       qrylocskudetail.Fieldbyname('Quantity_Volume_Prop').asFloat     :=TSKUDetailSelect[i].syVolume/TSKUDetailSelect[i].syQuantity;
       qrylocskudetail.fieldbyname('Quantity_NetWeight_Prop').asFloat  :=TSKUDetailSelect[i].syNetWeight/TSKUDetailSelect[i].syQuantity;
       qrylocskudetail.fieldbyname('Quantity_GrossWeight_Prop').asFloat:=TSKUDetailSelect[i].syGrossWeight/TSKUDetailSelect[i].syQuantity;
       qrylocskudetail.fieldbyname('Quantity_Area_Prop').asFloat       :=TSKUDetailSelect[i].syArea/TSKUDetailSelect[i].syQuantity;
       qrylocskudetail.fieldbyname('JOBNOIN').asstring            :=TSKUDetailSelect[i].Jobno;
       qrylocskudetail.Fieldbyname('SNOIN').asInteger             :=TSKUDetailSelect[i].SNO;
       qrylocskudetail.Fieldbyname('LDSNOIN').asInteger           :=TSKUDetailSelect[i].LDSNO;
       qrylocskudetail.Fieldbyname('DetailSNOIN').asInteger     :=TSKUDetailSelect[i].DetailSNO;
       qrylocskudetail.fieldbyname('LotCode').asstring            :=TSKUDetailSelect[i].LotCode;
       qrylocskudetail.fieldbyname('SerialNO').asstring           :=TSKUDetailSelect[i].SerialNO;

       try
          qrylocskudetail.Post;
       except
          break;
       end;
     end else Exit;
   end;
end;

procedure TfrmLIOSKUDetail.edtdepthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
      with grdSKUDetail.InplaceEditor do
      begin
         if strtofloat(GetEditingText)<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         if (StrtoFloat(GetEditingText)<>0) and (qrylocskudetail.FieldByName('piece').AsFloat<>0)
            and (qrylocskudetail.FieldByName('height').AsFloat<>0)
            and (qrylocskudetail.FieldByName('width').AsFloat<>0) then
         begin
            qrylocskudetail.Edit;
            qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('piece').AsFloat*
                                                            qrylocskudetail.FieldByName('height').AsFloat*
                                                            qrylocskudetail.FieldByName('width').AsFloat*
                                                            StrToFloat(GetEditingText);
         end;
         qrylocskudetail.FieldByName('depth').AsFloat:=StrToFloat(GetEditingText);
      end;
      if (qrylocskudetail.FieldByName('volumeuom').AsString<>'') and (qrylocskudetail.FieldByName('sizeuom').AsString<>'') then
      begin
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('volume').AsFloat*
                   GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,qrylocskudetail.FieldByName('SizeUom').AsString);

      end;
      Accept:=True;
   end;
end;

function TfrmLIOSKUDetail.GetScale(pstrUomVolume,pstrUomSize:String):Extended;
begin
   OpenSql(qryTmp,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomVolume+'" ');
   OpenSql(qryTmp1,' select pro=isnull(uompro,1) from uom(nolock) where uomname="'+pStrUomSize+'" ');
   Result:=qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('pro').AsFloat*qryTmp1.FieldByname('Pro').AsFloat
   /qryTmp.FieldByname('pro').AsFloat;
end;

procedure TfrmLIOSKUDetail.edtwidthValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
      with grdSKUDetail.InplaceEditor do
      begin
         if strtofloat(GetEditingText)<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         if (StrtoFloat(GetEditingText)<>0) and (qrylocskudetail.FieldByName('piece').AsFloat<>0)
            and (qrylocskudetail.FieldByName('height').AsFloat<>0)
            and (qrylocskudetail.FieldByName('depth').AsFloat<>0) then
         begin
            qrylocskudetail.Edit;
            qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('piece').AsFloat*
                                                            qrylocskudetail.FieldByName('height').AsFloat*
                                                            qrylocskudetail.FieldByName('depth').AsFloat*
                                                            StrToFloat(GetEditingText);
         end;
         qrylocskudetail.FieldByName('width').AsFloat:=StrToFloat(GetEditingText);
      end;
      if (qrylocskudetail.FieldByName('volumeuom').AsString<>'') and (qrylocskudetail.FieldByName('sizeuom').AsString<>'') then
      begin
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('volume').AsFloat*
                   GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,qrylocskudetail.FieldByName('SizeUom').AsString);

      end;
      Accept:=True;
   end;
end;

procedure TfrmLIOSKUDetail.edtheightValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
      with grdSKUDetail.InplaceEditor do
      begin
         if strtofloat(GetEditingText)<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         if (StrtoFloat(GetEditingText)<>0) and (qrylocskudetail.FieldByName('piece').AsFloat<>0)
            and (qrylocskudetail.FieldByName('width').AsFloat<>0)
            and (qrylocskudetail.FieldByName('depth').AsFloat<>0) then
         begin
            qrylocskudetail.Edit;
            qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('piece').AsFloat*
                                                            qrylocskudetail.FieldByName('width').AsFloat*
                                                            qrylocskudetail.FieldByName('depth').AsFloat*
                                                            StrToFloat(GetEditingText);
         end;
         qrylocskudetail.FieldByName('height').AsFloat:=StrToFloat(GetEditingText);
      end;
      if (qrylocskudetail.FieldByName('volumeuom').AsString<>'') and (qrylocskudetail.FieldByName('sizeuom').AsString<>'') then
      begin
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('volume').AsFloat*
                   GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,qrylocskudetail.FieldByName('SizeUom').AsString);

      end;
      Accept:=True;
   end;
end;

procedure TfrmLIOSKUDetail.edtPieceValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   expiece:Extended;
begin
   if (DataState in Setdcs) and (grdSKUDetail.InplaceEditor.GetEditingText<>'') then
   begin
      if strtofloat(grdSKUDetail.InplaceEditor.GetEditingText)<0 then
      begin
         if _Language='CAPTIONC' then
            ErrorText:='件数不能小于零!'
         else
            ErrorText:='***************';
         Accept:=False;
         exit;
      end;
      qrylocskudetail.Edit;
      expiece:=qrylocskudetail.fieldbyname('piece').AsFloat;
      qrylocskudetail.FieldByName('piece').AsFloat:=strtofloat(grdSKUDetail.InplaceEditor.GetEditingText);
      //体积与件数挂钩
      {wql.05.10.27 if qrylocskudetail.FieldByName('volume').AsFloat<>0 then
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.fieldbyname('piece').AsFloat/expiece
                                                           *qrylocskudetail.fieldbyname('volume').AsFloat
      else }
      if _paper<>'T' then
       qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('piece').AsFloat*
                                                       qrylocskudetail.FieldByName('width').AsFloat*
                                                       qrylocskudetail.FieldByName('depth').AsFloat*
                                                       qrylocskudetail.FieldByName('height').AsFloat*
                                                       GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,
                                                                qrylocskudetail.FieldByName('SizeUom').AsString);

      if qrylocskudetail.FieldByName('quantity_piece_prop').AsFloat<>0 then
      begin
         qrylocskudetail.FieldByName('quantity').AsFloat :=qrylocskudetail.FieldByName('piece').AsFloat*qrylocskudetail.FieldByName('quantity_piece_prop').AsFloat;
         //qrylocskudetail.FieldByName('netweight').AsFloat :=qrylocskudetail.FieldByName('quantity').AsFloat*qrylocskudetail.FieldByName('Quantity_NetWeight_Prop').AsFloat;
      end;


   end;
end;

procedure TfrmLIOSKUDetail.cmbVolumeUOMValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   stroldvolumeuom:string;
begin
   if (DataState in Setdcs) then
   begin
      stroldvolumeuom:=qrylocskudetail.FieldByName('volumeuom').AsString;
      qrylocskudetail.FieldByName('volumeuom').AsString:=grdSKUDetail.InplaceEditor.GetEditingText;
      if (qrylocskudetail.FieldByName('volumeuom').AsString<>'') and (qrylocskudetail.FieldByName('sizeuom').AsString<>'') then
      begin
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('volume').AsFloat*
                                                            GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,qrylocskudetail.FieldByName('SizeUom').AsString)
                                                            /GetScale(IIF(stroldvolumeuom='',qrylocskudetail.FieldByName('SizeUom').AsString,stroldvolumeuom),qrylocskudetail.FieldByName('SizeUom').AsString);
      end;
   end;
end;

procedure TfrmLIOSKUDetail.sizeuomValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
  stroldsizeuom:string;
begin
   if (DataState in Setdcs) then
   begin
      stroldsizeuom:=qrylocskudetail.FieldByName('sizeuom').AsString;
      qrylocskudetail.FieldByName('sizeuom').AsString:=grdSKUDetail.InplaceEditor.GetEditingText;
      if (qrylocskudetail.FieldByName('volumeuom').AsString<>'') and (qrylocskudetail.FieldByName('sizeuom').AsString<>'') then
      begin
         qrylocskudetail.FieldByName('volume').AsFloat:=qrylocskudetail.FieldByName('volume').AsFloat*
                                                            GetScale(qrylocskudetail.FieldByName('volumeuom').AsString,qrylocskudetail.FieldByName('SizeUom').AsString)
                                                            /GetScale(IIF(stroldsizeuom='',qrylocskudetail.FieldByName('SizeUom').AsString,stroldsizeuom),qrylocskudetail.FieldByName('SizeUom').AsString);
      end;
   end;
end;

procedure TfrmLIOSKUDetail.quantity_piece_propValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      if (qrylocskudetail.FieldByName('UnKnowQ').AsString='T') and (StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText)<>0)then
      begin
         if _Language='CAPTIONC' then
            ErrorText:='数量无关！输入值应为零!'
         else
            ErrorText:='***************';
         Accept:=False;
         exit;
      end;
      qrylocskudetail.FieldByName('quantity_piece_prop').AsFloat:=StrToFloat(grdSKUDetail.InplaceEditor.GetEditingText);
      if qrylocskudetail.FieldByName('quantity_piece_prop').AsFloat<>0 then
      qrylocskudetail.FieldByName('quantity').AsFloat:=
                     qrylocskudetail.fieldbyname('piece').AsFloat*qrylocskudetail.FieldByName('quantity_piece_prop').AsFloat;
   end;
end;

procedure TfrmLIOSKUDetail.FormActivate(Sender: TObject);
begin
   if DataState=stbrowse then
   begin
      KGroupBox1.Visible:=false;
      frmLIOSKUDetail.height:=frmLIOSKUDetail.height-KGroupBox1.height;
   end else
   begin
//      qrylocskudetail.Filtered:=false;
      KGroupBox1.Visible:=true;
   end;
//   qrylocskudetail.Filtered:=True;
//   qrylocskudetail.Filter:=' sno='+IntToStr(intldsno)
end;

procedure TfrmLIOSKUDetail.mitcopyClick(Sender: TObject);
begin
   copyskuid      :=qrylocskudetail.fieldbyname('skuid').AsString;
   copyskuname    :=qrylocskudetail.fieldbyname('skuname').AsString;
   //lzw20120112
   copyskumodel    :=qrylocskudetail.fieldbyname('skumodel').AsString;
   copyskuspec    :=qrylocskudetail.fieldbyname('skuspec').AsString;
   copylotcode    :=qrylocskudetail.fieldbyname('lotcode').AsString;
   copymanufacturedate    :=qrylocskudetail.fieldbyname('manufacturedate').AsString;

   copyqualityname:=qrylocskudetail.fieldbyname('qualityname').AsString;
   copyskubrand   :=qrylocskudetail.fieldbyname('skubrand').AsString;
   Copyquantityuom:=qrylocskudetail.fieldbyname('quantityuom').AsString;
   copypieceuom   :=qrylocskudetail.fieldbyname('pieceuom').AsString;
   copyweightuom  :=qrylocskudetail.fieldbyname('weightuom').AsString;
   copyareauom    :=qrylocskudetail.fieldbyname('areauom').AsString;
   copyvolumeuom  :=qrylocskudetail.fieldbyname('volumeuom').AsString;
   copysizeuom    :=qrylocskudetail.fieldbyname('sizeuom').AsString;
   copydepth      :=qrylocskudetail.fieldbyname('depth').AsFloat;
   copyheight     :=qrylocskudetail.fieldbyname('height').AsFloat;
   copywidth      :=qrylocskudetail.fieldbyname('width').AsFloat;
   copyweightpro     :=qrylocskudetail.fieldbyname('Quantity_NetWeight_Prop').AsFloat;
   copypiecepro      :=qrylocskudetail.fieldbyname('Quantity_Piece_Prop').AsFloat;

   copyquantity   :=qrylocskudetail.fieldbyname('quantity').AsFloat;
   copypiece      :=qrylocskudetail.fieldbyname('piece').AsFloat;
   copyarea       :=qrylocskudetail.fieldbyname('area').AsFloat;
   copynetweight  :=qrylocskudetail.fieldbyname('netweight').AsFloat;
   copygrossweight:=qrylocskudetail.fieldbyname('grossweight').AsFloat;
   copyvolume     :=qrylocskudetail.fieldbyname('volume').AsFloat;
   iscopy         :=true;
   mitplaste.Enabled:=True;
end;

procedure TfrmLIOSKUDetail.mitplasteClick(Sender: TObject);
begin
   if (DataState in Setdcs) and (copyskuid<>'') then
   begin
      mitSkuAddClick(self);
   end;
end;

procedure TfrmLIOSKUDetail.mitColumnsetClick(Sender: TObject);
begin
   WorkSetGrid(grdSKUDetail,frmLIOSKUDetail.Name);
end;

procedure TfrmLIOSKUDetail.edtSerialNOScanExit(Sender: TObject);
var
  acontrol: TWinControl;
begin
  if edtSerialNOScan.Text<>'' then
  begin
    if intOpType=-1 then
    begin
      OpenSql(qryTmp,' Select detail.skuid,detail.skuname, '+chr(13)+chr(10)
                    +'        quantity=isnull(detail.quantity,0)-sum(isnull(cc.quantity,0)), '+chr(13)+chr(10)
                    +'        Piece=isnull(detail.piece,0)-sum(isnull(cc.piece,0)), '+chr(13)+chr(10)
                    +'        volume=isnull(detail.volume,0)-sum(isnull(cc.volume,0)), '+chr(13)+chr(10)
                    +'        area=isnull(detail.area,0)-sum(isnull(cc.area,0)), '+chr(13)+chr(10)
                    +'        netweight=isnull(detail.netWeight,0)-sum(isnull(cc.NetWeight,0)), '+chr(13)+chr(10)
                    +'        grossWeight=isnull(detail.grossWeight,0)-sum(isnull(cc.grossWeight,0)), '+chr(13)+chr(10)
                    +'        detail.quantityuom,detail.pieceuom,Detail.volumeuom,detail.areauom,detail.weightuom,detail.jobno, '+chr(13)+chr(10)
                    +'        detail.sno,detail.detailldsno,detail.ldsno '+chr(13)+chr(10)
                    +'   from lioskudetail detail '+chr(13)+chr(10)
                    +'        left join lioskudetail cc '+chr(13)+chr(10)
                    +'               on cc.jobnoin=detail.jobno '+chr(13)+chr(10)
                    +'              and cc.snoin=detail.sno '+chr(13)+chr(10)
                    +'              and cc.ldsnoin=detail.ldsno '+chr(13)+chr(10)
                    +'  where detail.conno="'+trim(edtLotCodeScan.Text)+'"'
                    +'    and detail.SerialNO="'+trim(edtSerialNOScan.Text)+'"'
                    +'    and detail.Jobno="'+strjobnoin+'" '
                    +'    and detail.sno='+IntToStr(Intsnoin)+''
                    +'    and detail.operationtype=1 '+chr(13)+chr(10)
                    +'  group by  detail.quantity,detail.piece,detail.volume, '+chr(13)+chr(10)
                    +'        detail.area,detail.netweight,detail.grossweight,'+chr(13)+chr(10)
                    +'        detail.skuid,detail.skuname,detail.quantityuom,detail.pieceuom,detail.volumeuom,detail.areauom, '+chr(13)+chr(10)
                    +'        detail.weightuom,detail.jobno,detail.sno,detail.detailldsno,detail.ldsno ');
      qryTmp.First;
      if qryTmp.FieldByName('Jobno').AsString='' then
      begin
        KMessageDlg('没有找到对应的进仓商品细目！',mtInformation,[mbOK],0);
        Exit;
      end;
    end else
    if intOpType=1 then
    begin
       OpenSql(qryTmp,' Select piecepro,volumepro,weightpro,areapro,'+chr(13)+chr(10)
                     +'        skumodel,skuspec, '+chr(13)+chr(10)
                     +'        quantityuom,pieceuom,volumeuom,areauom,weightuom,sizeuom '+chr(13)+chr(10)
                     +'   from sku(nolock) '+chr(13)+chr(10)
                     +'  where sku.skuid="'+strSkuid+'"'
                     +'    and sku.skuname="'+strSkuName+'"');
       qryTmp.First;
    end;
    qrylocskudetail.Append;
    qrylocskudetail.FieldByName('Jobno').AsString         :=strjobno;
    qrylocskudetail.FieldByName('SNO').AsInteger          :=intldsno;
    qrylocskudetail.FieldByName('OperationType').AsInteger:=intOpType;
    qrylocskudetail.fieldbyname('LDSNO').Asinteger       :=-1;

    if intOpType=-1 then
    begin
      qrylocskudetail.FieldByName('SerialNO').AsString      :=edtSerialNOScan.Text;
      qrylocskudetail.FieldByName('SKUID').AsString         :=qryTmp.FieldByName('SKUID').AsString;
      qrylocskudetail.FieldByName('SKUName').AsString       :=qryTmp.FieldByName('SKUName').AsString;
      qrylocskudetail.FieldByName('conno').AsString       :=edtLotCodeScan.Text;
      qrylocskudetail.FieldByName('Quantity').AsFloat       :=qryTmp.fieldbyname('Quantity').AsFloat;;
      qrylocskudetail.FieldByName('Piece').AsFloat          :=qryTmp.fieldbyname('Piece').AsFloat;
      qrylocskudetail.FieldByName('Volume').AsFloat         :=qryTmp.fieldbyname('Volume').AsFloat;
      qrylocskudetail.FieldByName('Area').AsFloat           :=qryTmp.fieldbyname('Area').AsFloat;
      qrylocskudetail.FieldByName('NetWeight').AsFloat      :=qryTmp.fieldbyname('NetWeight').AsFloat;
      qrylocskudetail.FieldByName('GrossWeight').AsFloat    :=qryTmp.fieldbyname('GrossWeight').AsFloat;
      qrylocskudetail.FieldByName('QuantityUOM').AsString   :=qryTmp.FieldByName('QuantityUOM').AsString;
      qrylocskudetail.FieldByName('PieceUOM').AsString      :=qryTmp.FieldByName('PieceUOM').AsString;
      qrylocskudetail.FieldByName('VolumeUOM').AsString     :=qryTmp.FieldByName('VolumeUOM').AsString;
      qrylocskudetail.FieldByName('AreaUOM').AsString       :=qryTmp.FieldByName('AreaUOM').AsString;
      qrylocskudetail.FieldByName('WeightUOM').AsString     :=qryTmp.FieldByName('WeightUOM').AsString;
      qrylocskudetail.FieldByName('JobnoIN').AsString       :=qryTmp.FieldByName('Jobno').AsString;
      qrylocskudetail.FieldByName('SNOIN').AsInteger        :=qryTmp.FieldByName('SNO').AsInteger;
      qrylocskudetail.FieldByName('DetailSNOIN').AsInteger:=qryTmp.FieldByName('DetailLDSNO').AsInteger;
      qrylocskudetail.FieldByName('LDSNOIN').AsInteger      :=qryTmp.FieldByName('LDSNO').AsInteger;
    end else
    begin
      qrylocskudetail.FieldByName('SerialNO').AsString      :=edtSerialNOScan.Text;
      qrylocskudetail.FieldByName('SKUID').AsString         :=strskuid;
      qrylocskudetail.FieldByName('SKUName').AsString       :=strskuname;
      qrylocskudetail.FieldByName('conno').AsString       :=edtLotCodeScan.Text;
      qrylocskudetail.FieldByName('Quantity').AsFloat       :=IIF(edtQuantityP.Value<>0,edtQuantityP.Value,1);
      if qryTmp.fieldbyname('piecepro').AsFloat<>0 then
         qrylocskudetail.FieldByName('Piece').AsFloat       :=qrylocskudetail.FieldByName('Quantity').AsFloat/qryTmp.fieldbyname('piecepro').AsFloat;
      if qryTmp.fieldbyname('piecepro').AsFloat<>0 then
         qrylocskudetail.FieldByName('Volume').AsFloat      :=qrylocskudetail.FieldByName('Quantity').AsFloat*qryTmp.fieldbyname('volumepro').AsFloat/qryTmp.fieldbyname('piecepro').AsFloat;
      if qryTmp.fieldbyname('piecepro').AsFloat<>0 then
         qrylocskudetail.FieldByName('Area').AsFloat        :=qrylocskudetail.FieldByName('Quantity').AsFloat*qryTmp.fieldbyname('areapro').AsFloat/qryTmp.fieldbyname('piecepro').AsFloat;
      if qryTmp.fieldbyname('piecepro').AsFloat<>0 then
         qrylocskudetail.FieldByName('NetWeight').AsFloat   :=iif(edtNetWeightP.Value<>0,edtNetWeightP.Value,
                                                            qrylocskudetail.FieldByName('Quantity').AsFloat*qryTmp.fieldbyname('weightpro').AsFloat/qryTmp.fieldbyname('piecepro').AsFloat);
      if qryTmp.fieldbyname('piecepro').AsFloat<>0 then
         qrylocskudetail.FieldByName('GrossWeight').AsFloat :=qrylocskudetail.FieldByName('Quantity').AsFloat*qryTmp.fieldbyname('weightpro').AsFloat/qryTmp.fieldbyname('piecepro').AsFloat;

      qrylocskudetail.FieldByName('QuantityUOM').AsString:=qryTmp.fieldbyname('QuantityUOM').AsString;
      qrylocskudetail.FieldByName('pieceuom').AsString   :=IIF(qryTmp.fieldbyname('PieceUOM').AsString='',
                                                            copypieceuom,qryTmp.fieldbyname('PieceUOM').AsString);
      qrylocskudetail.FieldByName('volumeuom').AsString  :=IIF(qryTmp.fieldbyname('VolumeUOM').AsString='',
                                                           copyvolumeuom,qryTmp.fieldbyname('VolumeUOM').AsString);
      qrylocskudetail.FieldByName('areauom').AsString    :=IIF(qryTmp.fieldbyname('AreaUOM').AsString='',
                                                           copyareauom,qryTmp.fieldbyname('AreaUOM').AsString);
      qrylocskudetail.FieldByName('weightuom').AsString  :=IIF(qryTmp.fieldbyname('WeightUOM').AsString='',
                                                            copyweightuom,qryTmp.fieldbyname('WeightUOM').AsString);
      qrylocskudetail.FieldByName('sizeuom').AsString    :=IIF(qryTmp.fieldbyname('sizeuom').AsString='',
                                                           copysizeuom,qryTmp.fieldbyname('sizeuom').AsString);
      qrylocskudetail.Fieldbyname('quantity_piece_prop').AsFloat      :=qryTmp.fieldbyname('PiecePro').AsFloat;
      qrylocskudetail.Fieldbyname('quantity_volume_prop').AsFloat     :=qryTmp.fieldbyname('volumepro').AsFloat;
      qrylocskudetail.Fieldbyname('Quantity_Area_Prop').AsFloat       :=qryTmp.fieldbyname('areapro').AsFloat;
      qrylocskudetail.Fieldbyname('quantity_netweight_prop').AsFloat  :=qryTmp.fieldbyname('weightpro').AsFloat;
      qrylocskudetail.Fieldbyname('quantity_grossweight_prop').AsFloat:=qryTmp.fieldbyname('weightpro').AsFloat;
      qrylocskudetail.Fieldbyname('skuspec').AsString:=qryTmp.fieldbyname('skuspec').AsString;
      qrylocskudetail.Fieldbyname('skumodel').AsString:=qryTmp.fieldbyname('skumodel').AsString;

    end;
    //qrylocskudetailBeforePost(qrylocskudetail);

    edtSerialNOScan.Text:='';
    edtSerialNOScan.SetFocus;
  end;
end;

procedure TfrmLIOSKUDetail.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

procedure TfrmLIOSKUDetail.KBitBtn1Click(Sender: TObject);
var
   strname:string;
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
//         strSql:='ksp_GetSkudetailOutdetailfromExcel';
         strSql:=' Select * '+
                 '   from [石头号导入$] ';
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
                         +'     lotcode varchar(100),'+chr(10)+chr(13)
                         +'     quantity numeric(16,4), '+chr(10)+chr(13)
                         +'     quantityuom varchar(8), '+chr(10)+chr(13)
                         +'     piece  numeric(16,4), '+chr(10)+chr(13)
                         +'     pieceuom   varchar(8), '+chr(10)+chr(13)
                         +'     volume numeric(16,4), '+chr(10)+chr(13)
                         +'     volumeuom varchar(8),'+chr(10)+chr(13)
                         +'     grossweight numeric(16,4), '+chr(10)+chr(13)
                         +'     netweight varchar(8), '+chr(10)+chr(13)
                         +'     weightuom  varchar(8) '+chr(10)+chr(13)
                         +')'
          );
   try
      if (AqryMtf.Fields[0].FieldName='批次') and
         (AqryMtf.Fields[1].FieldName='数量') and
         (AqryMtf.Fields[2].FieldName='数量单位') and
         (AqryMtf.Fields[3].FieldName='件数') and
         (AqryMtf.Fields[4].FieldName='件数单位') and
         (AqryMtf.Fields[5].FieldName='体积') and
         (AqryMtf.Fields[6].FieldName='体积单位') and
         (AqryMtf.Fields[7].FieldName='毛重') and
         (AqryMtf.Fields[8].FieldName='净重') and
         (AqryMtf.Fields[9].FieldName='重量单位') then
      begin
         AqryMtf.First;
         while not AqryMtf.Eof do
         begin  //EXCEL格式判断
            strsql:=strsql+' insert into #lskinexcel(lotcode,quantity,quantityuom,piece,pieceuom,volume,volumeuom,grossweight,netweight,weightuom)'
                       +'   values("'+AqryMtf.Fields[0].AsString+'",'
                       +'          "'+AqryMtf.Fields[1].AsString+'",'
                       +'          "'+AqryMtf.Fields[2].AsString+'",'
                       +'          "'+AqryMtf.Fields[3].AsString+'",'
                       +'          "'+AqryMtf.Fields[4].AsString+'",'
                       +'          "'+AqryMtf.Fields[5].AsString+'",'
                       +'          "'+AqryMtf.Fields[6].AsString+'",'
                       +'          "'+AqryMtf.Fields[7].AsString+'",'
                       +'          "'+AqryMtf.Fields[8].AsString+'",'
                       +'          "'+AqryMtf.Fields[9].AsString+'") ';
            AqryMtf.Next;
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
         qrylocskudetail.DisableControls;
         ExecSql(qryTmp,strsql);
         opensql(qryTmp,'if not exists(select * from tempdb..sysobjects          '+
                        '               where id=object_id("tempdb..#lskinexcel") and sysstat & 0xf=3)   '+
                        'return  '+
                        'select * from #lskinexcel '+
                        '  drop table #lskinexcel ');
         while not qryTmp.Eof do
         begin
            qrylocskudetail.Append;
            grdSKUDetailBeforeInsert;
            qrylocskudetail.FieldByName('lotcode').AsString:=qryTmp.fieldbyname('lotcode').AsString;
            qrylocskudetail.FieldByName('quantity').AsFloat:=qryTmp.fieldbyname('quantity').AsFloat;
            qrylocskudetail.FieldByName('quantityuom').AsString:=qryTmp.fieldbyname('quantityuom').AsString;
            qrylocskudetail.FieldByName('piece').AsFloat:=qryTmp.fieldbyname('piece').AsFloat;
            qrylocskudetail.FieldByName('pieceuom').AsString:=qryTmp.fieldbyname('pieceuom').AsString;
            qrylocskudetail.FieldByName('volume').AsFloat:=qryTmp.fieldbyname('volume').AsFloat;
            qrylocskudetail.FieldByName('volumeuom').AsString:=qryTmp.fieldbyname('volumeuom').AsString;
            qrylocskudetail.FieldByName('grossweight').AsFloat:=qryTmp.fieldbyname('grossweight').AsFloat;
            qrylocskudetail.FieldByName('netweight').AsFloat:=qryTmp.fieldbyname('netweight').AsFloat;
            qrylocskudetail.FieldByName('weightuom').AsFloat:=qryTmp.fieldbyname('volume').AsFloat;
            qrylocskudetail.Post;
            qryTmp.Next;
         end;
         qrylocskudetail.EnableControls;
      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;
end;

// lzw 2008.01.11
procedure TfrmLIOSKUDetail.mitskudetailClick(Sender: TObject);
var
   i:integer;
 //  TLocSkuDetailSelect:TMultLocSkuDetailSelectnew;
   qryselect:TKADOQuery;
begin
  { TLocSkuDetailSelect:=WorkLocSkuDetailSelectnew(strjobnoin,Intsnoin,
                                                  qrylocskudetail.fieldbyname('LDSNO').Asinteger,'');
   for i:=0 to 100 do
      begin
        if TLocSkuDetailSelect[i].OkFlag then
        begin
          if i=0 then
          begin
            qrylocskudetail.edit;
          end else
          begin
            qrylocskudetail.append;
          end;
          qrylocskudetail.fieldbyname('SKUID').asstring                   :=TLocSkuDetailSelect[i].SKUID            ;
          qrylocskudetail.fieldbyname('SKUName').asstring                 :=TLocSkuDetailSelect[i].SKUName          ;
          qrylocskudetail.fieldbyname('SKUbrand').asstring                :=TLocSkuDetailSelect[i].SKUbrand        ;
          qrylocskudetail.fieldbyname('qualityname').asstring             :=TLocSkuDetailSelect[i].qualityname      ;
          qrylocskudetail.fieldbyname('Quantity').asFloat                 :=TLocSkuDetailSelect[i].Quantity       ;
          qrylocskudetail.fieldbyname('QuantityUOM').asstring             :=TLocSkuDetailSelect[i].QuantityUOM      ;
          //qrylocskudetail.fieldbyname('PieceUOM').asstring                :=TLocSkuDetailSelect[i].PieceUOM         ;
          //qrylocskudetail.fieldbyname('WeightUOM').asstring               :=TLocSkuDetailSelect[i].WeightUOM        ;
          //qrylocskudetail.fieldbyname('VolumeUOM').asstring               :=TLocSkuDetailSelect[i].VolumeUOM        ;
          //qrylocskudetail.Fieldbyname('AreaUOM').asstring                 :=TLocSkuDetailSelect[i].AreaUOM          ;
          qrylocskudetail.Fieldbyname('sizeuom').asstring                 :=TLocSkuDetailSelect[i].SizeUOM          ;
          //qrylocskudetail.fieldbyname('Piece').asFloat                    :=TLocSkuDetailSelect[i].syPiece          ;
          //qrylocskudetail.fieldbyname('NetWeight').asFloat                :=TLocSkuDetailSelect[i].syNetWeight      ;
          //qrylocskudetail.Fieldbyname('GrossWeight').asFloat              :=TLocSkuDetailSelect[i].syGrossWeight    ;
          //qrylocskudetail.fieldbyname('Volume').asFloat                   :=TLocSkuDetailSelect[i].syVolume         ;
          //qrylocskudetail.Fieldbyname('Area').asFloat                     :=TLocSkuDetailSelect[i].syArea           ;

          //if  (TLocSkuDetailSelect[i].syPiece<>0) and (TLocSkuDetailSelect[i].syQuantity<>0) then
          //qrylocskudetail.Fieldbyname('Quantity_Piece_Prop').asFloat      :=1/TLocSkuDetailSelect[i].syPiece/TLocSkuDetailSelect[i].syQuantity;

          //if  (TLocSkuDetailSelect[i].syVolume<>0) and (TLocSkuDetailSelect[i].syQuantity<>0) then
          //qrylocskudetail.Fieldbyname('Quantity_Volume_Prop').asFloat     :=TLocSkuDetailSelect[i].syVolume/TLocSkuDetailSelect[i].syQuantity;

          //if  (TLocSkuDetailSelect[i].syNetWeight<>0) and (TLocSkuDetailSelect[i].syQuantity<>0) then
          //qrylocskudetail.fieldbyname('Quantity_NetWeight_Prop').asFloat  :=TLocSkuDetailSelect[i].syNetWeight/TLocSkuDetailSelect[i].syQuantity;

          //if  (TLocSkuDetailSelect[i].syGrossWeight<>0) and (TLocSkuDetailSelect[i].syQuantity<>0) then
          //qrylocskudetail.fieldbyname('Quantity_GrossWeight_Prop').asFloat:=TLocSkuDetailSelect[i].syGrossWeight/TLocSkuDetailSelect[i].syQuantity;

          //if  (TLocSkuDetailSelect[i].syArea<>0) and (TLocSkuDetailSelect[i].syQuantity<>0) then
          //qrylocskudetail.fieldbyname('Quantity_Area_Prop').asFloat       :=TLocSkuDetailSelect[i].syArea/TLocSkuDetailSelect[i].syQuantity;

          qrylocskudetail.fieldbyname('JOBNOIN').asstring                 :=TLocSkuDetailSelect[i].Jobno;
          qrylocskudetail.Fieldbyname('SNOIN').asInteger                  :=TLocSkuDetailSelect[i].SNO;
          qrylocskudetail.Fieldbyname('LDSNOIN').asInteger                :=TLocSkuDetailSelect[i].LDSNO;
          qrylocskudetail.Fieldbyname('DetailSNOIN').asInteger            :=TLocSkuDetailSelect[i].DetailSNO;
          qrylocskudetail.fieldbyname('LotCode').asstring                 :=TLocSkuDetailSelect[i].LotCode;
          qrylocskudetail.fieldbyname('SerialNO').asstring                :=TLocSkuDetailSelect[i].SerialNO;
          qrylocskudetail.Fieldbyname('depth').asFloat                    :=TLocSkuDetailSelect[i].depth;
          qrylocskudetail.Fieldbyname('width').asFloat                    :=TLocSkuDetailSelect[i].width;
          qrylocskudetail.Fieldbyname('height').asFloat                   :=TLocSkuDetailSelect[i].height;
          try
             qrylocskudetail.Post;
          except
             break;
          end;
        end else break;
      end;  }
end;

end.
