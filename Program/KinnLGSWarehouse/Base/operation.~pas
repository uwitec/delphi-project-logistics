unit Operation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, DbButtons, ExtCtrls, KSText, dxExEdtr, dxEdLib,
  dxDBELib, DBKINCGrids, DBCtrls, ComCtrls, frstatus, KinPickEdit, KDataSetProvider,
  dxCntner, dxEditor, StdCtrls, GMSLabel, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, Menus, DB, DBTables, libProc ,libUser, KinQuery,
  KUpdateSql, dxDBTLCl, dxGrClms ,libuserPub, ADODB;

type
  TfrmOperation = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    btnEdit: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btnPrint: TKBitBtn;
    ppmCON: TPopupMenu;
    mitAddCON: TMenuItem;
    mitDelCON: TMenuItem;
    ppmCONSKU: TPopupMenu;
    mitAddCONSKU: TMenuItem;
    mitDelCONSKU: TMenuItem;
    btnRefresh: TKBitBtn;
    pgcCarandCon: TdxPageControl;
    tbsCar: TdxTabSheet;
    KGroupBox6: TKGroupBox;
    KSText74: TKSText;
    KSText76: TKSText;
    grdCAR: TdxDBGrid;
    CarSNO: TdxDBGridColumn;
    CarBrand: TdxDBGridColumn;
    CarCX: TdxDBGridColumn;
    CarDriverName: TdxDBGridColumn;
    CarDriveridcar: TdxDBGridColumn;
    Carxszh: TdxDBGridColumn;
    CarBLNO: TdxDBGridColumn;
    CarCONNO: TdxDBGridColumn;
    CarSealNO: TdxDBGridColumn;
    carRemark: TdxDBGridColumn;
    KGroupBox1: TKGroupBox;
    KSText1: TKSText;
    KSText2: TKSText;
    grdCARSKU: TdxDBGrid;
    SNOCar: TdxDBGridColumn;
    CusNameCar: TdxDBGridButtonColumn;
    ShippercusNameCar: TdxDBGridButtonColumn;
    SKUNameCar: TdxDBGridButtonColumn;
    LotCodeCar: TdxDBGridColumn;
    QualityNameCar: TdxDBGridColumn;
    QuantityCar: TdxDBGridCurrencyColumn;
    QuantityUOMcar: TdxDBGridPickColumn;
    PieceCar: TdxDBGridCurrencyColumn;
    PieceUOMCar: TdxDBGridPickColumn;
    VolumeCar: TdxDBGridCurrencyColumn;
    VolumeUOMCar: TdxDBGridPickColumn;
    AreaCar: TdxDBGridCurrencyColumn;
    AreaUOMCar: TdxDBGridPickColumn;
    GrossWeightCar: TdxDBGridCurrencyColumn;
    NetWeightCar: TdxDBGridCurrencyColumn;
    WeightUOMCar: TdxDBGridPickColumn;
    Casing1Car: TdxDBGridCurrencyColumn;
    UOM1Car: TdxDBGridPickColumn;
    Casing2Car: TdxDBGridCurrencyColumn;
    UOM2Car: TdxDBGridPickColumn;
    Casing3Car: TdxDBGridCurrencyColumn;
    UOM3Car: TdxDBGridPickColumn;
    Casing4Car: TdxDBGridCurrencyColumn;
    UOM4Car: TdxDBGridPickColumn;
    Casing5Car: TdxDBGridCurrencyColumn;
    UOM5Car: TdxDBGridPickColumn;
    tbsCon: TdxTabSheet;
    KGroupBox7: TKGroupBox;
    kstLocationINOUTContainer: TKSText;
    grdCON: TdxDBGrid;
    ConSno: TdxDBGridColumn;
    ConType: TdxDBGridPickColumn;
    ConSPType: TdxDBGridPickColumn;
    ConQuantity: TdxDBGridCurrencyColumn;
    ConNO: TdxDBGridColumn;
    ConSealNO: TdxDBGridColumn;
    ConBLNO: TdxDBGridColumn;
    conLoadGroupCusName: TdxDBGridButtonColumn;
    ConForkGroupCusName: TdxDBGridButtonColumn;
    ConLiftMachineCusName: TdxDBGridButtonColumn;
    ConRemark: TdxDBGridMemoColumn;
    KGroupBox4: TKGroupBox;
    KSText56: TKSText;
    KSText57: TKSText;
    grdCONSKU: TdxDBGrid;
    SnoCon: TdxDBGridCurrencyColumn;
    CusNameCon: TdxDBGridButtonColumn;
    ShipperCusNameCon: TdxDBGridButtonColumn;
    SKUNameCon: TdxDBGridButtonColumn;
    LotCodeCon: TdxDBGridColumn;
    QualityNameCon: TdxDBGridButtonColumn;
    ManufactureDateCon: TdxDBGridDateColumn;
    QuantityUOMCon: TdxDBGridPickColumn;
    PieceCon: TdxDBGridCurrencyColumn;
    PieceUOMCon: TdxDBGridPickColumn;
    VolumeCon: TdxDBGridCurrencyColumn;
    VolumeUOMCon: TdxDBGridPickColumn;
    AreaCon: TdxDBGridCurrencyColumn;
    AreaUOMCon: TdxDBGridPickColumn;
    GrossWeightCon: TdxDBGridCurrencyColumn;
    NetWeightCon: TdxDBGridCurrencyColumn;
    WeightUOMCon: TdxDBGridPickColumn;
    Casing1Con: TdxDBGridCurrencyColumn;
    UOM1Con: TdxDBGridPickColumn;
    Casing2Con: TdxDBGridCurrencyColumn;
    UOM2Con: TdxDBGridPickColumn;
    Casing3Con: TdxDBGridCurrencyColumn;
    UOM3Con: TdxDBGridPickColumn;
    Casing4Con: TdxDBGridCurrencyColumn;
    UOM4Con: TdxDBGridPickColumn;
    Casing5Con: TdxDBGridCurrencyColumn;
    UOM5Con: TdxDBGridPickColumn;
    remarkcon: TdxDBGridBlobColumn;
    ppmCar: TPopupMenu;
    mitAddCar: TMenuItem;
    mitDelCar: TMenuItem;
    ppmCarSKU: TPopupMenu;
    mitAddCarSKU: TMenuItem;
    mitDelCarSKU: TMenuItem;
    costuomtypeCon: TdxDBGridKinPickColumn;
    contallycusname: TdxDBGridButtonColumn;
    cardrivertel: TdxDBGridColumn;
    conischeck: TdxDBGridCheckColumn;
    cuscheck: TdxDBGridCheckColumn;
    carshipname: TdxDBGridColumn;
    cararrivedate: TdxDBGridDateColumn;
    brokenmarkcar: TdxDBGridColumn;
    conshipname: TdxDBGridColumn;
    conarrivedate: TdxDBGridDateColumn;
    conloadcomdate: TdxDBGridDateColumn;
    brokenmarkcon: TdxDBGridColumn;
    quantityslcon: TdxDBGridCurrencyColumn;
    quantityshortcon: TdxDBGridCurrencyColumn;
    quantityslcar: TdxDBGridCurrencyColumn;
    quantityshortcar: TdxDBGridCurrencyColumn;
    mitConPrint: TMenuItem;
    mitCarprint: TMenuItem;
    mitConskuprint: TMenuItem;
    mitCarskuprint: TMenuItem;
    skumodel: TdxDBGridColumn;
    skuspec: TdxDBGridColumn;
    SerialNO: TdxDBGridColumn;
    carincomedate: TdxDBGridColumn;
    xh: TdxDBGridColumn;
    tagno: TdxDBGridColumn;
    color: TdxDBGridColumn;
    conskuspec: TdxDBGridColumn;
    conserialno: TdxDBGridColumn;
    mitprintcon: TMenuItem;
    QuantityCon: TdxDBGridColumn;
    consum: TdxDBGridColumn;
    ys: TdxDBGridColumn;
    mitweightin: TdxDBGridColumn;
    mitweightout: TdxDBGridColumn;
    edtconveno: TdxEdit;
    carloadcomdate: TdxDBGridTimeColumn;
    zhzl: TdxDBGridColumn;
    locname: TdxDBGridButtonColumn;
    edtPath: TdxButtonEdit;
    GMSStickyLabel13: TGMSStickyLabel;
    btnInPut: TKBitBtn;
    btnoper: TKBitBtn;
    AqryMtf: TADOQuery;
    conMtf: TADOConnection;
    OpenDialog1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure mitAddCONClick(Sender: TObject);
    procedure mitDelCONClick(Sender: TObject);
    procedure mitAddCONSKUClick(Sender: TObject);
    procedure mitDelCONSKUClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure grdCONChangeNodeEx(Sender: TObject);
    procedure grdCONSKUChangeNodeEx(Sender: TObject);
    procedure grdCONEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdCONSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdCONEnter(Sender: TObject);
    procedure grdCONSKUEnter(Sender: TObject);
    procedure grdCONKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCONSKUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SKUNameConButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityConValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitAddCarClick(Sender: TObject);
    procedure mitDelCarClick(Sender: TObject);
    procedure mitAddCarSKUClick(Sender: TObject);
    procedure mitDelCarSKUClick(Sender: TObject);
    procedure grdCARChangeNodeEx(Sender: TObject);
    procedure grdCARSKUChangeNodeEx(Sender: TObject);
    procedure grdCAREditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdCARSKUEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdCAREnter(Sender: TObject);
    procedure grdCARSKUEnter(Sender: TObject);
    procedure grdCARExit(Sender: TObject);
    procedure grdCARKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdCARSKUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SKUNameCarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdCONExit(Sender: TObject);
    procedure grdCONSKUExit(Sender: TObject);
    procedure grdCARSKUExit(Sender: TObject);
    procedure conLoadGroupCusNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ConForkGroupCusNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ConLiftMachineCusNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure contallycusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityCarValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure PieceConValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure PieceCarValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitConPrintClick(Sender: TObject);
    procedure mitCarprintClick(Sender: TObject);
    procedure mitConskuprintClick(Sender: TObject);
    procedure mitCarskuprintClick(Sender: TObject);
    procedure NetWeightConValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure GrossWeightConValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure NetWeightCarValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure GrossWeightCarValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitprintconClick(Sender: TObject);
    procedure CusNameConButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ShipperCusNameConButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtconvenoExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure carloadcomdateValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure btnoperClick(Sender: TObject);
    procedure locnameButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btnInPutClick(Sender: TObject);
  private
    { Private declarations }
    //变量定义
    blnWare,blnBLJS:Boolean;
    DataState:TDataState;
    Bookmark: TBookmark;         //书签
    strINOUT,strDel_CON,strDel_Car: string;
    strTotal,ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    strLoadGroupName,strForkGroupName,strLiftMachineName :string;//吊箱,装卸信息
    strLoadGroupID,strForkGroupID,strLiftMachineID:string;
    strConNO,strcarno:string;
    ExConquantity,QuantityDetailOldValue:Extended;
    //lzw  20081111
    //strsql:string;
    //过程定义
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure grdCONBeforeInsert;
    procedure grdCONSKUBeforeInsert;
    procedure grdCARBeforeInsert;
    procedure grdCARSKUBeforeInsert;
    function Caclcon:string;
    function Gather:Boolean;
    procedure CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
    procedure CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');

  public
    { Public declarations }
    maxCON,maxCONSKU,maxCar,maxCarSku:Integer; //修改时候用的
    strJobno,strUserID:string;
  end;

procedure WorkOperation(CallMode:TDataState;pJobno,PUserID:string);

var
  frmOperation: TfrmOperation;

implementation

{$R *.dfm}

uses Main, kindlg, datas, find ,GetUserRight,datasTmp,ContainerSKUSelect,GetDllPub,dxGridOut,libbb;

procedure WorkOperation(CallMode:TDataState;pJobno,pUserID:string);
begin
   if frmOperation<> nil then
   with frmOperation do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmOperation:=TfrmOperation.Create(application);
   with frmOperation do
   begin
   {初始化所有数据集}
      //初始话变量
      strUserID      :=PUserID;
      strJobno       :=pJobno;
      strTotal       :=False;
      ScrollAfterEdit:=True;

      //件数单位
      PieceUOMCon.items.clear;
      QuantityUOMCon.items.clear;
      UOM1Con.Items.Clear;
      UOM2Con.Items.Clear;
      UOM3Con.Items.Clear;
      UOM4Con.Items.Clear;
      UOM5Con.Items.Clear;
      PieceUOMCar.items.clear;
      QuantityUOMCar.items.clear;
      UOM1Car.Items.Clear;
      UOM2Car.Items.Clear;
      UOM3Car.Items.Clear;
      UOM4Car.Items.Clear;
      UOM5Car.Items.Clear;
      InitdbPick(QuantityUOMCon,'uom','uomname','uomname',' uomtype like "%件数%" ');
      PieceUOMCon.Items    :=QuantityUOMCon.Items;
      UOM1Con.Items:=QuantityUOMCon.Items;
      UOM2Con.Items:=QuantityUOMCon.Items;
      UOM3Con.Items:=QuantityUOMCon.Items;
      UOM4Con.Items:=QuantityUOMCon.Items;
      UOM5Con.Items:=QuantityUOMCon.Items;
      PieceUOMCar.Items    :=QuantityUOMCon.Items;
      UOM1Car.Items:=QuantityUOMCon.Items;
      UOM2Car.Items:=QuantityUOMCon.Items;
      UOM3Car.Items:=QuantityUOMCon.Items;
      UOM4Car.Items:=QuantityUOMCon.Items;
      UOM5Car.Items:=QuantityUOMCon.Items;

      //体积单位
      InitdbPick(VolumeUOMCon,'uom','uomname','uomname',' uomtype like "%体积%" ');
      VolumeUOMCar.Items.Clear;
      VolumeUOMCar.items:=VolumeUOMCon.Items;
      //重量单位
      InitdbPick(WeightUOMCon,'uom','uomname','uomname',' uomtype like "%重量%" ');
      WeightUOMCar.Items.Clear;
      WeightUOMCar.Items:=WeightUOMCon.Items;
      //面积单位
      InitdbPick(AreaUOMCon,'uom','uomname','uomname',' uomtype like "%面积%" ');
      AreaUOMCar.Items.Clear;
      AreaUOMCar.Items:=AreaUOMCon.Items;

      InitdbPick(ConSPType,'codelib','codecd','codecd',' codeclass="01" ');

      if _strsyscus='HQWL' then
      begin
         ConBLNO.Caption:='车号';
         CarBLNO.Caption:='车号';
         cardrivertel.Caption:='出发地';
         CarCONNO.Caption:='目的地';
      end;
      if _strsyscus='JJHY' then
      begin
         ConBLNO.Caption:='车号';
         CarBLNO.Caption:='车号';
         cardrivertel.Caption:='出发地';
         CarCONNO.Caption:='目的地';
      end;
      if _strsyscus='SZWY' then
      begin
         tbsCon.TabVisible:=False;
         CarCX.Visible:=False;
         CarBLNO.Visible:=False;
         cardrivertel.Visible:=False;
         cararrivedate.Caption:='开始时间';
         carloadcomdate.Caption:='结束时间';
         CarSealNO.Caption:='封箱号';
         Carxszh.Caption:='数量';  //原驾驶证号
         carshipname.Visible:=False;
      end;
      //lzw20101116
      if _strsyscus='XT' then
      begin
         tbscar.TabVisible:=False;
         frmOperation.caption:='箱货信息';
         KGroupBox7.caption:='装箱资料';
         KGroupBox4.caption:='箱货关系表';
         conserialno.Visible:=true;
         consum.Visible:=true;
         conskuspec.Visible:=true;
         ConSealNO.Visible:=False;
         conarrivedate.Visible:=False;
         ConBLNO.Visible:=False;
         conLoadGroupCusName.Visible:=False;
         ConForkGroupCusName.Visible:=False;
         ConLiftMachineCusName.Visible:=False;
         contallycusname.Visible:=False;
         conischeck.Visible:=False;
         cuscheck.Visible:=False;
         conloadcomdate.Visible:=False;
         conshipname.Visible:=False;
         LotCodeCon.Visible:=False;
         ManufactureDateCon.Visible:=False;
         PieceCon.Visible:=False;
         PieceUOMCon.Visible:=False;
         VolumeCon.Visible:=False;
         VolumeuomCon.Visible:=False;
         AreaCon.Visible:=False;
         AreauomCon.Visible:=False;
         GrossWeightCon.Visible:=False;
         netWeightCon.Visible:=False;
         WeightUOMCon.Visible:=False;
         costuomtypeCon.Visible:=False;
         quantityslcon.Visible:=False;
         brokenmarkcon.Visible:=False;
         quantityshortcon.Visible:=False;
         remarkcon.Visible:=False;
         xh.Visible:=False;
         tagno.Visible:=False;
         color.Visible:=true;
         ys.Visible:=true;
         mitprintcon.visible:=true;
         locname.visible:=true;
         consum.visible:=true;
         if pos('LI',strjobno)>0 then
         begin
            GMSStickyLabel13.visible:=true;
            edtPath.visible:=true;
            btnInPut.visible:=true;
            btnoper.visible:=true;
         end;
      end;
      //lzw20101116
      if _strsyscus='DHA' then
      begin
         edtconveno.Visible:=true;
         carloadcomdate.Caption:='出卡口时间';
         cararrivedate.Caption:='进卡口时间';
         mitweightin.Visible:=true;
         mitweightout.Visible:=true;
         tbsCon.TabVisible:=False;
         skuspec.Caption:='规格';
         zhzl.Visible:=true;
         edtconveno.Visible:=true;
      end;

      strcarno:='';
      data.InitOperation(strJobno);

  // 界面显示过程
//      SetButtonEnabled(Toolpanel,'mitTransOrder',trim(_userid)+trim(_LoginId)); //设置按钮权限

      WorkCall(stBrowse);
      {激活FORM}
      ShowModal;
      SetFormPosition(frmoperation,true);
      Free;
   end;
end;

procedure TfrmOperation.WorkCall(CallMode:TDataState);
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
          EnableEdit;
          //对qryLocationINOUTContainer循环，为maxLocationINOUTContainer赋值
          data.qryCON.DisableControls;
          Bookmark:= data.qryCON.GetBookmark;
          maxCON:=0;
          data.qryCON.First;
          while not data.qryCON.Eof do
          begin
            if data.qryCON.FieldByName('SNO').AsInteger>maxCON
            then maxCON:=data.qryCON.FieldByName('SNO').AsInteger;
            data.qryCON.Next;
          end;
          data.qryCON.GotoBookmark(Bookmark);
          data.qryCON.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCON.EnableControls;
//          self.grdLocationINOUTContainerAfterScroll(data.qryCON);
          //在修改的状态下，对qryLocationINOUTCONSKU循环
          data.qryCONSKU.DisableControls;
          Bookmark:= data.qryCONSKU.GetBookmark;
          maxCONSKU:=0;
          data.qryCONSKU.Filtered:=False;
          data.qryCONSKU.First;
          while not data.qryCONSKU.Eof do
          begin
            if data.qryCONSKU.FieldByName('SNO').AsInteger>maxCONSKU
            then maxCONSKU:=data.qryCONSKU.FieldByName('SNO').AsInteger;
            data.qryCONSKU.Next;
          end;
          data.qryCONSKU.Filtered:=True;
          data.qryCONSKU.GotoBookmark(Bookmark);
          data.qryCONSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCONSKU.EnableControls;
          //对qryLocationINOUTCar循环，为maxCar赋值
          data.qryCar.DisableControls;
          Bookmark:= data.qryCar.GetBookmark;
          maxCar:=0;
          data.qryCar.First;
          while not data.qryCar.Eof do
          begin
            if data.qryCar.FieldByName('SNO').AsInteger>maxCar
            then maxCar:=data.qryCar.FieldByName('SNO').AsInteger;
            data.qryCar.Next;
          end;
          data.qryCar.GotoBookmark(Bookmark);
          data.qryCar.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCar.EnableControls;
//          self.grdLocationINOUTCarAfterScroll(data.qryCar);
          //在修改的状态下，对data.qryCarSKU循环
          data.qryCarSKU.DisableControls;
          Bookmark:= data.qryCarSKU.GetBookmark;
          maxCarSKU:=0;
          data.qryCarSKU.Filtered:=False;
          data.qryCarSKU.First;
          while not data.qryCarSKU.Eof do
          begin
            if data.qryCarSKU.FieldByName('SNO').AsInteger>maxCarSKU
            then maxCarSKU:=data.qryCarSKU.FieldByName('SNO').AsInteger;
            data.qryCarSKU.Next;
          end;
          data.qryCarSKU.Filtered:=True;
          data.qryCarSKU.GotoBookmark(Bookmark);
          data.qryCarSKU.FreeBookmark(Bookmark);
          bookMark:=nil;
          data.qryCarSKU.EnableControls;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          EnableEdit;
          //记录档案创建信息
          LampChange(lsEdit);
        end;
  end;
  end;
end;

procedure TfrmOperation.EnableEdit;
var
  setDisable:TsetInt;
begin
  setDisable:=[];
  LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);

  grdCar.OptionsBehavior:=grdCar.OptionsBehavior+[edgoEditing];
  grdCar.OptionsDB:=grdCar.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdCar.ShowGroupPanel:=False;
  grdCar.ClearGroupColumns;
  grdCar.Filter.Active:=False;

  grdCON.OptionsBehavior:=grdCON.OptionsBehavior+[edgoEditing];
  grdCON.OptionsDB:=grdCON.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdCON.ShowGroupPanel:=False;
  grdCON.ClearGroupColumns;
  grdCON.Filter.Active:=False;

  grdCONSKU.OptionsBehavior:=grdCONSKU.OptionsBehavior+[edgoEditing];
  grdCONSKU.OptionsDB:=grdCONSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdCONSKU.ShowGroupPanel:=False;
  grdCONSKU.ClearGroupColumns;
  grdCONSKU.Filter.Active:=False;

  grdCarSKU.OptionsBehavior:=grdCarSKU.OptionsBehavior+[edgoEditing];
  grdCarSKU.OptionsDB:=grdCarSKU.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdCarSKU.ShowGroupPanel:=False;
  grdCarSKU.ClearGroupColumns;
  grdCarSKU.Filter.Active:=False;
end;

procedure TfrmOperation.DisableEdit;
{查看数据状态，需DISABLE的动作}
var
  setDisable:TsetInt;
begin
  setDisable:=[];
//  if qryOperation.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..11]+setDisable,[1..5]-setDisable);

  grdCar.OptionsBehavior:=grdCar.OptionsBehavior-[edgoEditing];
  grdCar.OptionsDB:=grdCar.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdCar.ShowGroupPanel:=True;
  grdCON.OptionsBehavior:=grdCON.OptionsBehavior-[edgoEditing];
  grdCON.OptionsDB:=grdCON.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdCON.ShowGroupPanel:=True;

  grdCONSKU.OptionsBehavior:=grdCONSKU.OptionsBehavior-[edgoEditing];
  grdCONSKU.OptionsDB:=grdCONSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdCONSKU.ShowGroupPanel:=True;
  grdCONSKU.ShowSummaryFooter:=False;

  grdCarSKU.OptionsBehavior:=grdCarSKU.OptionsBehavior-[edgoEditing];
  grdCarSKU.OptionsDB:=grdCarSKU.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdCarSKU.ShowGroupPanel:=True;
  grdCarSKU.ShowSummaryFooter:=False;
end;

procedure TfrmOperation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmOperation.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox7);
  SetGroupbox(KGroupBox4);
  SetGroupbox(KGroupBox6);
  SetGroupbox(KGroupBox1);

  SetDxDbGrid(grdCar);
  SetDxDbGrid(grdCarSKU);
  SetDxDbGrid(grdCON);
  SetDxDbGrid(grdCONSKU);
  pgcCarandCon.ActivePage:=tbsCon;
end;

procedure TfrmOperation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  if DataState = stBrowse then
  begin
    case Key of
      Vk_Escape:KeyDownControl(Key,btnClose);
    end;
  end else
  begin
    case Key of
      Vk_Escape:
       self.btnCancel.SetFocus;
      Vk_End,Ord('W'):
       if ssCtrl in Shift then self.btnSave.SetFocus;
    end;
  end;
end;

procedure TfrmOperation.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  frmOperation:=nil
end;

procedure TfrmOperation.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmOperation.btnEditClick(Sender: TObject);
begin
//  if pgcCarandCon.ActivePage<>tbsCar then pgcCarandCon.ActivePage:=tbsCar;
  if pgcCarandCon.ActivePage<>tbsCon then pgcCarandCon.ActivePage:=tbsCon;
  SetDetailActive(False,True);
  WorkCall(stEdit);
end;

procedure TfrmOperation.btnAddClick(Sender: TObject);
begin
  if pgcCarandCon.ActivePage<>tbsCar then pgcCarandCon.ActivePage:=tbsCar;
  ScrollAfterEdit:=True;
  SetDetailActive(False,True);
  Workcall(stInsert);
end;

procedure TfrmOperation.btnSaveClick(Sender: TObject);
var
  StrCon,strTable:String;  //strTable,不同的form不同的表
begin
   StrCon:=Caclcon;
   if (DataState in setDcs) and Gather  then //新增或编辑存盘
   begin
      try
         blnWare:=True;
         while True do
         begin
            try
               _ADOConnection.Starttransaction;
               data.qryCON.ApplyUpdates;
               data.qryCONSKU.Filtered:=False;
               data.qryCONSKU.ApplyUpdates;
               data.qryCar.ApplyUpdates;
               data.qryCarSKU.Filtered:=False;
               data.qryCarSKU.ApplyUpdates;
               if _strsyscus<>'XT' then
               begin
                  if Copy(strJobno,5,2)='LI' then  strTable:='locationin'
                  else if Copy(strJobno,5,2)='LO' then strTable:='locationout'
                  else if (Copy(strJobno,5,2)='WO')or(Copy(strJobno,5,1)='O') then strTable:='wareorder'
                  else if Copy(strJobno,5,2)='QT' then strTable:='locationother';
                  ExecSQL(dataTmp.qryTmp,'update '+strTable
                                        +'  set ConDes="'+StrCon+'",'
                                        +'      conno="'+strConNO+'",'
                                        +'      carbrand="'+strcarno+'",'
                                        +'      CONQuantity='+FloatToStr(ExConquantity)
                                        +' where jobno="'+strJobno+'"  ');
               end;

               Break;
            except
              _ADOConnection.Rollback; //先结束事务
              raise;
              exit;
            end;
         end;
         _ADOConnection.Commit;
      except
        _ADOConnection.rollback;
        raise;
        Exit;
      end;

      data.qryCON.commitUpdates;
      data.qryCONSKU.commitUpdates;
      data.qryCar.commitUpdates;
      data.qryCarSKU.commitUpdates;

      data.qryCONSKU.Filtered:=True;
      data.qryCarSKU.Filtered:=True;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
      ExecSql(dataTmp.qryTmp,'  if exists(select * from tempdb..sysobjects      '
                            +'             where id=object_id("tempdb..#lskcarsku") and sysstat & 0xf=3) '
                            +'    drop table #lskcarsku             '
                            +'select jobnoin,snoin,quantitysl=sum(isnull(quantitysl,0)),quantityshort=sum(isnull(quantityshort,0))     '
                            +'  into #lskcarsku '
                            +'  from locationinoutconsku carsku '
                            +' where carsku.jobno="'+strJobno+'" '
                            +' group by jobnoin,snoin '
                            +'update locationinitem '
                            +'   set quantitysl=#lskcarsku.quantitysl,quantityshort=#lskcarsku.quantityshort  '
                            +'  from #lskcarsku '
                            +' where #lskcarsku.jobnoin=locationinitem.jobno '
                            +'   and #lskcarsku.snoin=locationinitem.sno '
                            +'  if exists(select * from tempdb..sysobjects      '
                            +'             where id=object_id("tempdb..#lskcarskudetail") and sysstat & 0xf=3) '
                            +'    drop table #lskcarskudetail             '
                            +'select jobnoin,snoin,ldsnoin,quantitysl=sum(isnull(quantitysl,0)),quantityshort=sum(isnull(quantityshort,0))     '
                            +'  into #lskcarskudetail '
                            +'  from locationinoutconsku carsku '
                            +' where carsku.jobno="'+strJobno+'" '
                            +' group by jobnoin,snoin,ldsnoin '
                            +'update locationindetail '
                            +'   set quantitysl=#lskcarskudetail.quantitysl,quantityshort=#lskcarskudetail.quantityshort  '
                            +'  from #lskcarskudetail '
                            +' where #lskcarskudetail.jobnoin=locationindetail.jobno '
                            +'   and #lskcarskudetail.snoin=locationindetail.sno '
                            +'   and #lskcarskudetail.ldsnoin=locationindetail.ldsno');
      if _strsyscus='XT' then
      begin
         ExecSql(dataTmp.qryTmp,' update locationinoutconsku set            '
                               +'        locid=locationinoutcon.locid,locname=locationinoutcon.locname '
                               +'   from locationinoutcon(nolock) '
                               +'  where locationinoutcon.jobno=locationinoutconsku.jobno  '
                               +'    and locationinoutcon.sno=locationinoutconsku.sno       '
                               +'    and locationinoutcon.jobno="'+strjobno+'" '
                );
      end;

   end;
   if (_strsyscus<>'XT') and (_strsyscus<>'JJHY') then frmOperation.Close;
end;

procedure TfrmOperation.btnCancelClick(Sender: TObject);
begin
  if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then exit;

  data.qryCON.CancelUpdates;
  data.qryCONSKU.CancelUpdates;
  data.qryCar.CancelUpdates;
  data.qryCarSKU.CancelUpdates;

  WorkCall(stBrowse);
end;

procedure TfrmOperation.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open
}
begin
//
end;

procedure TfrmOperation.mitAddCONClick(Sender: TObject);
begin
  grdCON.setfocus;
  data.qryCON.append;
  grdCONBeforeInsert;
end;

procedure TfrmOperation.mitDelCONClick(Sender: TObject);
begin
  if data.qryCON.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    {strsql:='select     1   from  locationinoutcon (nolock)'
           +' where  jobno = "'+strJobno+'"                 '
           +'   and  not exists (select 1 from locationinoutconsku  '
           +'                     where   locationinoutconsku.jobno=locationinoutcon.jobno)'
           ;
    dataTmp.qryTmp.Close;
    dataTmp.qryTmp.Sql.Clear;
    dataTmp.qryTmp.Sql.Add(strsql);
    dataTmp.qryTmp.filtered:=true;
    dataTmp.qryTmp.Open; }
    ExecSql(dataTmp.qryTmp,' delete from locationinoutconsku '
                          +'  where jobno="'+strJobno+'"  '
                          +'    and sno="'+data.qryCON.fieldbyname('SNO').Asstring+'" '
                          );
    strDel_CON:=strDel_CON+' or SNO='+data.qryCON.fieldbyname('SNO').Asstring;
    data.qryCON.delete;
  end;
end;

procedure TfrmOperation.mitAddCONSKUClick(Sender: TObject);
begin
   if data.qryCON.IsEmpty then
   begin
     { if _Language='CAPTIONC' then _strmessage:='请先添加集装箱信息'
      else _strmessage:='请先添加集装箱信息';}
      KMessageDlg(GetMessage('frmOperation','001'),mtWarning,[mbOK],0);
      grdCon.SetFocus;
      Exit;
   end;
   grdCONSKU.setfocus;
   data.qryCONSKU.append;
   grdCONSKUBeforeInsert;
end;

procedure TfrmOperation.mitDelCONSKUClick(Sender: TObject);
begin
  if data.qryCONSKU.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    data.qryCONSKU.delete;
  end;
end;

procedure TfrmOperation.btnRefreshClick(Sender: TObject);
begin
    data.qryCar.Close;
    data.qryCarSKU.Close;
    data.qryCON.Close;
    data.qryCONSKU.Close;

    data.qryCar.open;
    data.qryCarSKU.open;
    data.qryCON.open;
    data.qryCONSKU.open;
end;

procedure TfrmOperation.grdCARBeforeInsert;
begin
  data.qryCar.FieldByName('SNO').AsInteger:=-1;
  data.qryCar.fieldbyname('UserID').Asstring:=strUserID;
  data.qryCar.fieldByname('jobno').AsString:=strJobno;
  data.qryCar.fieldbyname('IsCON').AsString:='F';
end;

procedure TfrmOperation.grdCONBeforeInsert;
begin
  data.qryCON.FieldByName('SNO').AsInteger:=-1;
  data.qryCON.fieldbyname('UserID').Asstring:=strUserID;
  data.qryCON.fieldByname('jobno').AsString:=strJobno;
  data.qryCON.fieldbyname('IsCON').AsString:='T';
  data.qryCON.FieldByName('loadgroupcusname').Asstring     :=strLoadGroupName;
  data.qryCON.FieldByName('loadgroupcusid').Asstring         :=strLoadGroupID;
  data.qryCON.FieldByName('forkgroupcusname').Asstring     :=strForkGroupName;
  data.qryCON.FieldByName('forkgroupcusid').Asstring         :=strForkGroupID;
  data.qryCON.FieldByName('liftmachinecusname').Asstring   :=strLiftMachineName;
  data.qryCON.FieldByName('liftmachinecusid').Asstring       :=strLiftMachineID;

end;

procedure TfrmOperation.grdCARSKUBeforeInsert;
begin
  data.qryCarSKU.fieldbyname('SNO').Asinteger:=data.qryCar.fieldbyname('SNO').Asinteger;
  data.qrycarsku.FieldByName('ldsno').AsInteger:=-1;
  data.qryCarSKU.fieldbyname('UserID').Asstring:=strUserID;
  data.qryCarSKU.fieldByname('jobno').AsString:=strJobno;
  data.qryCarSKU.fieldByname('iscon').AsString:='F';
  data.qryCarSKU.fieldbyname('QualityName').Asstring:='正品';
end;

procedure TfrmOperation.grdCONSKUBeforeInsert;
begin
  data.qryCONSKU.fieldbyname('SNO').Asinteger:=data.qryCON.fieldbyname('SNO').Asinteger;
  data.qryCONSKU.FieldByName('ldsno').AsInteger:=-1;
  data.qryCONSKU.fieldbyname('UserID').Asstring:=strUserID;
  data.qryCONSKU.fieldByname('jobno').AsString:=strJobno;
  data.qryCONSKU.fieldByname('iscon').AsString:='T';
  data.qryCONSKU.fieldbyname('QualityName').Asstring:='正品';
end;

procedure TfrmOperation.grdCONChangeNodeEx(Sender: TObject);
begin
  if grdCON.Datalink.DataSet.State = dsInsert then
  begin
    grdCONBeforeInsert;
  end;
  if data.qryCon.FieldByName('sno').AsString<>'' then
     data.qryConSku.Filter:='sno='+data.qryCON.fieldbyname('sno').AsString
  else
     data.qryConSku.Filter:='sno=-1';
end;

procedure TfrmOperation.grdCONSKUChangeNodeEx(Sender: TObject);
begin
  if grdCONSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdCONSKUBeforeInsert;
  end;
end;

procedure TfrmOperation.grdCONEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=True;
  end;
end;

procedure TfrmOperation.grdCONSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    with grdCONSKU do
    begin
       if ((UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SERIALNO')
                  )
       then Allow:=False
       else Allow:=True;
    end;
  end;
end;

procedure TfrmOperation.grdCONEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (data.qryCON.IsEmpty) then
  begin
    mitAddCONClick(Sender);
  end;
end;

procedure TfrmOperation.grdCONSKUEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryCONSKU.IsEmpty) and (not data.qrycon.isempty) then
   begin
      mitAddCONSKUClick(Sender);
   end;
end;

procedure TfrmOperation.grdCONKeyDown(Sender: TObject; var Key: Word;
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
        end;
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        mitDelCONclick(sender);
        key:=0;
      end;
    end;
  end;
end;

procedure TfrmOperation.grdCONSKUKeyDown(Sender: TObject; var Key: Word;
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
        end;
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        mitDelCONSKUclick(sender);
        key:=0;
      end;
    end;
  end;
end;


procedure TfrmOperation.QuantityConValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _weightcal then Exit;
   if DataState in Setdcs then
   begin
      if StrToFloat(grdCONSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
      if data.qryCONSKU.FieldByName('CostUOMType').AsString='quantity' then
      begin
         data.qryCONSKU.Edit;
         data.qryCONSKU.FieldByName('SKUCost').AsFloat:=StrToFloat(grdCONSKU.InplaceEditor.GetEditingText)
                                                            *data.qryCONSKU.FieldByName('price').AsFloat;
      end;
     with  grdCONSKU.InplaceEditor do
     begin
       data.qryCONSKU.Edit;
   //    qryWareOrderOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryCONSKU.FieldByName('SKUID').AsString<>''))  then
          begin
            //件数
            if strtofloat(GetEditingText)<>0 then
               data.qryCONSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                        *data.qryCONSKU.FieldByName('Piece').AsFloat
                                                        /data.qryCONSKU.FieldByName('Quantity').AsFloat);
            //体积
            if strtofloat(GetEditingText)<>0 then
               data.qryCONSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCONSKU.FieldByName('Volume').AsFloat
                                                        /data.qryCONSKU.FieldByName('Quantity').AsFloat;
            //面积
            if strtofloat(GetEditingText)<>0 then
               data.qryCONSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCONSKU.FieldByName('Area').AsFloat
                                                        /data.qryCONSKU.FieldByName('Quantity').AsFloat;
            //净重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCONSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCONSKU.FieldByName('NetWeight').AsFloat
                                                        /data.qryCONSKU.FieldByName('Quantity').AsFloat;
            //毛重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCONSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCONSKU.FieldByName('GrossWeight').AsFloat
                                                        /data.qryCONSKU.FieldByName('Quantity').AsFloat;
          end;
        data.qryCONSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
     end;
         Accept:=True;
   end;
end;

function TfrmOperation.Caclcon:string;
var
   i:Integer;
   intConnum: extended;
   strConcnt,strContype:string;
   sltCon:TStringList;
   sltConQ:TStringList;
begin
   sltCon:=TStringList.Create;
   sltConQ:=TStringList.Create;
   data.qryCON.DisableControls;
   Bookmark:= data.qryCON.GetBookmark;
   data.qryCON.First;
   sltCon.Clear;
   while not data.qryCON.Eof do
   begin
      sltCon.Add(data.qryCON.FieldByName('CONTYPE').AsString+data.qryCON.FieldByName('CONSPTYPE').AsString);
      sltConQ.Add(floattostr(data.qryCON.FieldByName('CONQuantity').asfloat));
      data.qryCON.Next;
   end;
   data.qryCON.GotoBookmark(Bookmark);
   data.qryCON.FreeBookmark(Bookmark);
   data.qryCON.EnableControls;
   bookmark:=nil;
//   sltCon.Sort;//对其排序
   strConcnt:='';
   if sltcon.Count>0 then
   begin
      strContype:=sltcon.Strings[0];
      intConnum:=strtofloat(sltconQ.Strings[0]);
      for i:= 1 to sltcon.count-1 do
          if strContype=sltcon.Strings[i] then
             intConnum:=intConnum+strtofloat(sltconQ.Strings[I])
          else
          begin
             strConcnt:=strConcnt+floatTostr(intConnum)+'X'+trim(strContype)+' ';
             strContype:=sltcon.Strings[i];
             intConnum:=strtofloat(sltconQ.Strings[I]);
          end;
      if (strConcnt<>'') or (sltCon.Count>=2) then
         strConcnt:=strConcnt+floatTostr(intConnum)+'X'+trim(strContype)+' ';
      if sltcon.count=1 then
      begin
         strConcnt:=floatTostr(intConnum)+'X'+trim(sltcon.Strings[0])+' ';
      end;
      sltCon.Free;
      end;
   Caclcon:=strConcnt;
end;

procedure TfrmOperation.mitAddCarClick(Sender: TObject);
begin
  grdCar.setfocus;
  data.qryCar.append;
  grdCarBeforeInsert;
end;

procedure TfrmOperation.mitDelCarClick(Sender: TObject);
begin
  if data.qryCar.FieldByName('SNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    strDel_Car:=strDel_Car+' or SNO='+data.qryCar.fieldbyname('SNO').Asstring;
    data.qryCar.delete;
  end;
end;

procedure TfrmOperation.mitAddCarSKUClick(Sender: TObject);
begin
   if data.qrycar.IsEmpty then
   begin
//      if _Language='CAPTIONC' then _strmessage:='请先添加车辆信息'
//      else _strmessage:='请先添加车辆信息';
      KMessageDlg(GetMessage('frmOperation','002'),mtWarning,[mbOK],0);
      grdCAR.SetFocus;
      Exit;
   end;
   grdCarSKU.setfocus;
   data.qryCarSKU.append;
   grdCarSKUBeforeInsert;
end;

procedure TfrmOperation.mitDelCarSKUClick(Sender: TObject);
begin
  if data.qryCarSKU.FieldByName('LDSNO').AsInteger<>0 then
  if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    data.qryCarSKU.delete;
  end;
end;

procedure TfrmOperation.grdCARChangeNodeEx(Sender: TObject);
begin
  if grdCAR.Datalink.DataSet.State = dsInsert then
  begin
    grdCARBeforeInsert;
  end;
  if data.qrycar.FieldByName('sno').AsString<>'' then
    data.qrycarsku.Filter:='sno='+data.qrycar.fieldbyname('sno').AsString
  else
    data.qrycarsku.Filter:='sno=-1';
end;

procedure TfrmOperation.grdCARSKUChangeNodeEx(Sender: TObject);
begin
  if grdCARSKU.Datalink.DataSet.State = dsInsert then
  begin
    grdCARSKUBeforeInsert;
  end;
end;

procedure TfrmOperation.grdCAREditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=True;
  end;
end;

procedure TfrmOperation.grdCARSKUEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
  if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=True;
  end;
end;

procedure TfrmOperation.grdCAREnter(Sender: TObject);
begin
  if (DataState in setdcs) and (data.qryCar.IsEmpty) then
  begin
    mitAddCarClick(Sender);
  end;
end;

procedure TfrmOperation.grdCARSKUEnter(Sender: TObject);
begin
  if (DataState in setdcs) and (data.qryCarSKU.IsEmpty) and (not data.qrycar.isempty) then
  begin
    mitAddCarSKUClick(Sender);
  end;
end;

procedure TfrmOperation.grdCARExit(Sender: TObject);
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

procedure TfrmOperation.grdCARKeyDown(Sender: TObject; var Key: Word;
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
        end;
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        mitDelCarclick(sender);
        key:=0;
      end;
    end;
  end;
end;

procedure TfrmOperation.grdCARSKUKeyDown(Sender: TObject; var Key: Word;
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
        end;
      end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
      begin
        mitDelCarSKUclick(sender);
        key:=0;
      end;
    end;
  end;
end;

procedure TfrmOperation.SKUNameCarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  TContainerSKUSelect:TMultContainerSKUSelect;
  i:integer;
begin
   if DataState in Setdcs then
   begin
      TContainerSKUSelect:=  WorkContainerSKUSelect( strJobno,strINOUT);
      for i:=0 to 100 do
      begin
         if TContainerSKUSelect[i].OkFlag then
         begin
            data.qryCarSKU.append;
            grdCARSKUBeforeInsert;
            data.qryCarSKU.fieldbyname('SKUID').asstring               :=TContainerSKUSelect[i].SKUID            ;
            data.qryCarSKU.fieldbyname('SKUName').asstring             :=TContainerSKUSelect[i].SKUName          ;
            data.qryCarSKU.Fieldbyname('LotCode').asstring             :=TContainerSKUSelect[i].LotCode          ;
            data.qryCarSKU.fieldbyname('Quantity').AsFloat             :=TContainerSKUSelect[i].Quantity        ;
            data.qryCarSKU.fieldbyname('QualityName').asstring         :=TContainerSKUSelect[i].QualityName      ;
            data.qryCarSKU.fieldbyname('QuantityUOM').asstring         :=TContainerSKUSelect[i].QuantityUOM      ;
            data.qryCarSKU.fieldbyname('PieceUOM').asstring            :=TContainerSKUSelect[i].PieceUOM         ;
            data.qryCarSKU.fieldbyname('WeightUOM').asstring           :=TContainerSKUSelect[i].WeightUOM        ;
            data.qryCarSKU.fieldbyname('VolumeUOM').asstring           :=TContainerSKUSelect[i].VolumeUOM        ;
            data.qryCarSKU.Fieldbyname('AreaUOM').asstring             :=TContainerSKUSelect[i].AreaUOM          ;
            data.qryCarSKU.fieldbyname('Piece').AsFloat                :=TContainerSKUSelect[i].Piece          ;
            data.qryCarSKU.fieldbyname('NetWeight').asFloat            :=TContainerSKUSelect[i].NetWeight      ;
            data.qryCarSKU.Fieldbyname('GrossWeight').asFloat          :=TContainerSKUSelect[i].GrossWeight    ;
            data.qryCarSKU.fieldbyname('Volume').asFloat               :=TContainerSKUSelect[i].Volume         ;
            data.qryCarSKU.Fieldbyname('Area').asFloat                 :=TContainerSKUSelect[i].Area           ;
            data.qryCarSKU.fieldbyname('cusID').asstring           :=TContainerSKUSelect[i].cusid        ;
            data.qryCarSKU.fieldbyname('cusName').asstring         :=TContainerSKUSelect[i].cusname      ;
            data.qryCarSKU.Fieldbyname('ShippercusID').asstring    :=TContainerSKUSelect[i].Shippercusid ;
            data.qryCarSKU.Fieldbyname('ShippercusName').asstring  :=TContainerSKUSelect[i].ShippercusName  ;
    //             data.qryCarSKU.fieldByname('IsCON').AsString            :='F';

            data.qryCarSKU.fieldbyname('JOBNOIN').asstring      :=TContainerSKUSelect[i].Jobno;
            data.qryCarSKU.Fieldbyname('SNOIN').asInteger       :=TContainerSKUSelect[i].SNO;
            data.qryCarSKU.fieldbyname('SizeUOM').asstring       :=TContainerSKUSelect[i].SizeUOM;
            data.qryCarSKU.fieldbyname('Height').asFloat         :=TContainerSKUSelect[i].Height ;
            data.qryCarSKU.Fieldbyname('Width').asFloat          :=TContainerSKUSelect[i].Width  ;
            data.qryCarSKU.fieldbyname('Depth').asFloat          :=TContainerSKUSelect[i].Depth  ;
            //lzw20100601
            data.qryCarSKU.fieldbyname('ManufactureDate').asstring          :=TContainerSKUSelect[i].ManufactureDate  ;
            //dwq20060124
            data.qryCarSKU.Fieldbyname('costquantityuom').asstring             :=TContainerSKUSelect[i].costquantityuom  ;
            data.qryCarSKU.fieldbyname('costquantity').AsFloat                :=TContainerSKUSelect[i].costquantity      ;

            data.qryCarSKU.Fieldbyname('skumodel').asstring           :=TContainerSKUSelect[i].skumodel          ;
            data.qryCarSKU.fieldbyname('skuspec').asstring            :=TContainerSKUSelect[i].skuspec          ;
            data.qryCarSKU.fieldbyname('taskdate').asstring           :=TContainerSKUSelect[i].operationdate   ;
            data.qryCarSKU.fieldbyname('locname').asstring            :=TContainerSKUSelect[i].locname          ;
            try
               data.qrycarsku.Post;
            except
               Break;
            end;
         end;
      end;
   end;
end;

procedure TfrmOperation.SKUNameConButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  TContainerSKUSelect:TMultContainerSKUSelect;
  i:integer;
  qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   if _strsyscus='XT' then
   begin
      qrySelect:=PGetSKUSelect('','','D');
      data.qryCONSKU.append;
      grdCONSKUBeforeInsert;
      data.qryCONSKU.fieldbyname('SKUID').asstring     :=qryselect.fieldbyname('SKUID').asstring            ;
      data.qryCONSKU.fieldbyname('SKUName').asstring   :=qryselect.fieldbyname('SKUName').asstring          ;
      data.qryCONSKU.fieldbyname('serialno').asstring  :=qryselect.fieldbyname('customerno').asstring          ;
      data.qryCONSKU.fieldbyname('userid').asstring    :=_userid;
      data.qryCONSKU.fieldbyname('iscon').asstring     :='T';
      //lzw20110822
      try
         data.qryCONSKU.post;
      except
         //Break;
      end;
   end else
   begin
      TContainerSKUSelect:=  WorkContainerSKUSelect( strjobno,strINOUT);
      for i:=0 to 100 do
      begin
         if TContainerSKUSelect[i].OkFlag then
         begin
            data.qryCONSKU.append;
            grdCONSKUBeforeInsert;
            data.qryCONSKU.fieldbyname('SKUID').asstring               :=TContainerSKUSelect[i].SKUID            ;
            data.qryCONSKU.fieldbyname('SKUName').asstring             :=TContainerSKUSelect[i].SKUName          ;
            data.qryCONSKU.Fieldbyname('LotCode').asstring             :=TContainerSKUSelect[i].LotCode          ;
            data.qryCONSKU.fieldbyname('Quantity').AsFloat             :=TContainerSKUSelect[i].Quantity         ;
            data.qryCONSKU.fieldbyname('QualityName').asstring         :=TContainerSKUSelect[i].QualityName      ;
            data.qryCONSKU.fieldbyname('QuantityUOM').asstring         :=TContainerSKUSelect[i].QuantityUOM      ;
            data.qryCONSKU.fieldbyname('PieceUOM').asstring            :=TContainerSKUSelect[i].PieceUOM         ;
            data.qryCONSKU.fieldbyname('WeightUOM').asstring           :=TContainerSKUSelect[i].WeightUOM        ;
            data.qryCONSKU.fieldbyname('VolumeUOM').asstring           :=TContainerSKUSelect[i].VolumeUOM        ;
            data.qryCONSKU.Fieldbyname('AreaUOM').asstring             :=TContainerSKUSelect[i].AreaUOM          ;
            data.qryCONSKU.fieldbyname('Piece').AsFloat                :=TContainerSKUSelect[i].Piece          ;
            data.qryCONSKU.fieldbyname('NetWeight').asFloat            :=TContainerSKUSelect[i].NetWeight      ;
            data.qryCONSKU.Fieldbyname('GrossWeight').asFloat          :=TContainerSKUSelect[i].GrossWeight    ;
            data.qryCONSKU.fieldbyname('Volume').asFloat               :=TContainerSKUSelect[i].Volume         ;
            data.qryCONSKU.Fieldbyname('Area').asFloat                 :=TContainerSKUSelect[i].Area           ;
            data.qryCONSKU.fieldbyname('cusID').asstring           :=TContainerSKUSelect[i].cusid        ;
            data.qryCONSKU.fieldbyname('cusName').asstring         :=TContainerSKUSelect[i].cusname      ;
            data.qryCONSKU.Fieldbyname('ShippercusID').asstring    :=TContainerSKUSelect[i].Shippercusid ;
            data.qryCONSKU.Fieldbyname('ShippercusName').asstring  :=TContainerSKUSelect[i].ShippercusName  ;
 //             data.qryCONSKU.fieldByname('IsCON').AsString            :='T';


            data.qryCONSKU.fieldbyname('JOBNOIN').asstring      :=TContainerSKUSelect[i].Jobno;
            data.qryCONSKU.Fieldbyname('SNOIN').asInteger       :=TContainerSKUSelect[i].SNO;
            data.qryCONSKU.Fieldbyname('ldsnoin').asInteger       :=TContainerSKUSelect[i].ldsno;

            data.qryCONSKU.fieldbyname('SizeUOM').asstring       :=TContainerSKUSelect[i].SizeUOM;
            data.qryCONSKU.fieldbyname('Height').asFloat         :=TContainerSKUSelect[i].Height ;
            data.qryCONSKU.Fieldbyname('Width').asFloat          :=TContainerSKUSelect[i].Width  ;
            data.qryCONSKU.fieldbyname('Depth').asFloat          :=TContainerSKUSelect[i].Depth  ;
            data.qryCONSKU.fieldbyname('ManufactureDate').AsString:=TContainerSKUSelect[i].ManufactureDate  ;
            data.qryCONSKU.fieldbyname('remark').AsString:=TContainerSKUSelect[i].remark  ;
            //dwq20060124
            data.qryCONSKU.Fieldbyname('costquantityuom').asstring             :=TContainerSKUSelect[i].costquantityuom          ;
            data.qryCONSKU.fieldbyname('costquantity').AsFloat                :=TContainerSKUSelect[i].costquantity          ;
            try
               data.qryCONSKU.post;
            except
               Break;
            end;
         end;
      end;
   end;
end;

procedure TfrmOperation.grdCONExit(Sender: TObject);
begin
   with Tdxdbgrid(Sender) do
   begin
      try
         if DataLink.dataset.state in [dsinsert,dsEdit] then
            data.qryCon.Post;
      except
         SetFocus;
      raise;
      end;
   end;
end;

procedure TfrmOperation.grdCONSKUExit(Sender: TObject);
begin
   with Tdxdbgrid(Sender) do
   begin
      try
         if DataLink.dataset.state in [dsinsert,dsEdit] then
         begin
            data.qryConSku.Post;
         end;   
      except
         SetFocus;
      raise;
      end;
   end;
end;

procedure TfrmOperation.grdCARSKUExit(Sender: TObject);
begin
   with Tdxdbgrid(Sender) do
   begin
      try
         if DataLink.dataset.state in [dsinsert,dsEdit] then
            data.qryCarSku.Post;
      except
         SetFocus;
      raise;
      end;
   end;
end;

procedure TfrmOperation.conLoadGroupCusNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCON.edit;
         data.qryCON.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCON.FieldByName('loadgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmOperation.ConForkGroupCusNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCON.edit;
         data.qryCON.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCON.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmOperation.ConLiftMachineCusNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCON.edit;
         data.qryCON.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCON.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

function TfrmOperation.gather:boolean;
var
   strReConno:string;
begin
   Result:=False;
   strConNO:='';
   strReConno:='';
   ExConquantity:=0;
   data.qryCON.DisableControls;
   Bookmark:= data.qryCON.GetBookmark;
   data.qryCON.First;
   while not data.qryCON.Eof do
   begin
      
      if (strReConno<>'')  and (strConNO=data.qrycon.FieldByName('conno').AsString) then
      begin
         if _Language='CAPTIONC' then
            _strmessage:='该笔柜号重复,请重新输入!'
         else
            _strmessage:='***************************************';
         KMessageDlg(GetMessage('frmOperation','003'),mtWarning,[mbyes],0);
         exit;
      end;
      strReConno:=data.qrycon.FieldByName('conno').AsString;
      if getSysdata('qdtext')='T' then
      begin
         if strConNO='' then
            strConNO:=data.qrycon.FieldByName('conno').AsString+'/'+data.qrycon.FieldByName('sealno').AsString
         else strConNO:=strConNO+iif(data.qrycon.FieldByName('conno').AsString='','',
                                     ';'+data.qrycon.FieldByName('conno').AsString+'/'+data.qrycon.FieldByName('sealno').AsString);
      end else
      begin
         if strConNO='' then
            strConNO:=data.qrycon.FieldByName('conno').AsString
         else strConNO:=strConNO+iif(data.qrycon.FieldByName('conno').AsString='','',
                                     '/'+data.qrycon.FieldByName('conno').AsString);
      end;
      ExConquantity:=ExConquantity+data.qryCON.fieldbyname('conquantity').AsFloat;
      data.qryCON.Next;
   end;
   data.qryCON.GotoBookmark(Bookmark);
   data.qryCON.FreeBookmark(Bookmark);
   data.qryCON.EnableControls;

   data.qrycar.DisableControls;
   data.qrycar.First;
   while not data.qrycar.Eof do
   begin
      if (strcarno<>'')  and (strcarno=data.qrycar.FieldByName('conveno').AsString) then
      strcarno:=data.qrycar.FieldByName('conveno').AsString;
      if strcarno='' then
         strcarno:=data.qrycar.FieldByName('conveno').AsString
      else strcarno:=strcarno+iif(data.qrycar.FieldByName('conveno').AsString='','',
                                     '/'+data.qrycar.FieldByName('conveno').AsString);
      data.qrycar.Next;
   end;
   data.qrycar.EnableControls;

   bookmark:=nil;
   result:=True;
end;


procedure TfrmOperation.contallycusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('M','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCON.edit;
         data.qryCON.FieldByName('tallycusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCON.FieldByName('tallycusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
//         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmOperation.QuantityCarValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if _piececal then Exit;
   if _weightcal then Exit;
   if DataState in Setdcs then
   begin
      if StrToFloat(grdCARSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
     with  grdCARSKU.InplaceEditor do
     begin
       data.qryCarSKU.Edit;
   //    qryWareOrderOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryCarSKU.FieldByName('SKUID').AsString<>''))  then
          begin
            //件数
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Piece').AsFloat:=Round(strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Piece').AsFloat
                                                        /data.qryCarSKU.FieldByName('Quantity').AsFloat);
            //体积
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Volume').AsFloat
                                                        /data.qryCarSKU.FieldByName('Quantity').AsFloat;
            //面积
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Area').AsFloat
                                                        /data.qryCarSKU.FieldByName('Quantity').AsFloat;
            //净重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('NetWeight').AsFloat
                                                        /data.qryCarSKU.FieldByName('Quantity').AsFloat;
            //毛重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('GrossWeight').AsFloat
                                                        /data.qryCarSKU.FieldByName('Quantity').AsFloat;
          end;
        data.qryCarSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
     end;
         Accept:=True;
   end;
end;


procedure TfrmOperation.PieceConValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if not _piececal then Exit;
   if DataState in Setdcs then
   begin
      if StrToFloat(grdCONSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='件数不能小于零!';
         Accept:=False;
         exit;
      end;
      with  grdCONSKU.InplaceEditor do
      begin
        data.qryCONSKU.Edit;
    //    qryWareOrderOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
        if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryCONSKU.FieldByName('SKUID').AsString<>''))  then
           begin
             //件数
             if strtofloat(GetEditingText)<>0 then
                data.qryCONSKU.FieldByName('quantity').AsFloat:=Round(strtofloat(GetEditingText)
                                                         *data.qryCONSKU.FieldByName('Quantity').AsFloat
                                                         /data.qryCONSKU.FieldByName('piece').AsFloat);
             //体积
             if strtofloat(GetEditingText)<>0 then
                data.qryCONSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                         *data.qryCONSKU.FieldByName('Volume').AsFloat
                                                         /data.qryCONSKU.FieldByName('piece').AsFloat;
             //面积
             if strtofloat(GetEditingText)<>0 then
                data.qryCONSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                         *data.qryCONSKU.FieldByName('Area').AsFloat
                                                         /data.qryCONSKU.FieldByName('piece').AsFloat;
             //净重量
             if strtofloat(GetEditingText)<>0 then
                data.qryCONSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                         *data.qryCONSKU.FieldByName('NetWeight').AsFloat
                                                         /data.qryCONSKU.FieldByName('piece').AsFloat;
             //毛重量
             if strtofloat(GetEditingText)<>0 then
                data.qryCONSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                         *data.qryCONSKU.FieldByName('GrossWeight').AsFloat
                                                         /data.qryCONSKU.FieldByName('piece').AsFloat;
           end;
         data.qryCONSKU.FieldByName('piece').AsFloat:=strtofloat(GetEditingText);
      end;
         Accept:=True;
   end;
end;

procedure TfrmOperation.PieceCarValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
//   if not _piececal then Exit;
   if _weightcal then Exit;
   if DataState in Setdcs then
   begin
      if StrToFloat(grdCARSKU.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='件数不能小于零!';
         Accept:=False;
         exit;
      end;
     with  grdCARSKU.InplaceEditor do
     begin
       data.qryCarSKU.Edit;
   //    qryWareOrderOriSKU.FieldByName('Quantity').AsFloat:=strtofloat(GetEditingText);
       if ((DataState in setDcs) and (strtofloat(GetEditingText)<>0) and (data.qryCarSKU.FieldByName('SKUID').AsString<>''))  then
          begin
            //件数
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Quantity').AsFloat:=Round(strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Quantity').AsFloat
                                                        /data.qryCarSKU.FieldByName('Piece').AsFloat);
            //体积
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Volume').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Volume').AsFloat
                                                        /data.qryCarSKU.FieldByName('Piece').AsFloat;
            //面积
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('Area').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('Area').AsFloat
                                                        /data.qryCarSKU.FieldByName('Piece').AsFloat;
            //净重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('NetWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('NetWeight').AsFloat
                                                        /data.qryCarSKU.FieldByName('Piece').AsFloat;
            //毛重量
            if strtofloat(GetEditingText)<>0 then
               data.qryCarSKU.FieldByName('GrossWeight').AsFloat:=strtofloat(GetEditingText)
                                                        *data.qryCarSKU.FieldByName('GrossWeight').AsFloat
                                                        /data.qryCarSKU.FieldByName('Piece').AsFloat;
          end;
        data.qryCarSKU.FieldByName('Piece').AsFloat:=strtofloat(GetEditingText);
     end;
         Accept:=True;
   end;
end;

procedure TfrmOperation.mitConPrintClick(Sender: TObject);
var
   lstpara : TStringList;
begin
   lstpara:=TStringList.Create;
   WorkdxGridOut(grdCON,lstPara,'集装箱资料');
end;

procedure TfrmOperation.mitCarprintClick(Sender: TObject);
var
   lstpara : TStringList;
begin
   lstpara:=TStringList.Create;
   WorkdxGridOut(grdCAR,lstPara,'车辆资料');
end;

procedure TfrmOperation.mitConskuprintClick(Sender: TObject);
var
   lstpara : TStringList;
begin
   lstpara:=TStringList.Create;
   WorkdxGridOut(grdCONSKU,lstPara,'箱货关系');
end;

procedure TfrmOperation.mitCarskuprintClick(Sender: TObject);
var
   lstpara : TStringList;
begin
   lstpara:=TStringList.Create;
   WorkdxGridOut(grdCARSKU,lstPara,'车货关系');
end;

procedure TfrmOperation.NetWeightConValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if getSysdata('cusname')='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdCONSKU.InplaceEditor.GetEditingText='',0,grdCONSKU.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qryConSku.FieldByName('Netweight').AsFloat;
         data.qryConSku.Edit;
         data.qryConSku.FieldByName('Netweight').AsFloat:=StrToFloat(IIF(grdCONSKU.InplaceEditor.GetEditingText='',0,grdCONSKU.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qryConSku,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;


procedure TfrmOperation.CountSKUweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   strtask:string;
begin
   if not _weightcal then Exit;
   strtask:=pistask;
   with pqrySKU do
   begin
      if (strtask<>'ITEM') then
      begin
         //数量
         if (OldValue<>0) and blnBLJS then
           FieldByName('quantity'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                    *FieldByName('quantity'+strtask).AsFloat
                                                    /oldValue;
         //件数
         if (OldValue<>0) and blnBLJS then
           FieldByName('piece'+strtask).AsFloat:=FieldByName('NetWeight'+strtask).AsFloat
                                                *FieldByName('piece'+strtask).AsFloat
                                                /oldValue;

         //体积
         if (OldValue<>0) and blnBLJS then
               FieldByName('Volume'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                    *FieldByName('Volume'+strtask).AsFloat
                                                    /oldValue;
         //面积
         if (OldValue<>0) and blnBLJS then
           FieldByName('Area'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('Area'+strtask).AsFloat
                                                /oldValue;
         //毛重
         if (OldValue<>0) and blnBLJS then
           FieldByName('GrossWeight'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('GrossWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('netweight'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmOperation.CountSKUgrossweight(var pqrySKU:TkadoQuery;OldValue:extended;pistask:string='');
{ 按照比例计算商品的各种单位数量
  pqrySKU:需要计算的数据集
}
var
   strtask:string;
begin
   if not _weightcal then Exit;
   strtask:=pistask;
   with pqrySKU do
   begin
      if (strtask<>'ITEM') then
      begin
         //数量
         if (OldValue<>0) and blnBLJS then
           FieldByName('quantity'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                    *FieldByName('quantity'+strtask).AsFloat
                                                    /oldValue;
         //件数
         if (OldValue<>0) and blnBLJS then
           FieldByName('piece'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('piece'+strtask).AsFloat
                                                /oldValue;

         //体积
         if (OldValue<>0) and blnBLJS then
               FieldByName('Volume'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                    *FieldByName('Volume'+strtask).AsFloat
                                                    /oldValue;
         //面积
         if (OldValue<>0) and blnBLJS then
           FieldByName('Area'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('Area'+strtask).AsFloat
                                                /oldValue;
         //净重
         if (OldValue<>0) and blnBLJS then
           FieldByName('NetWeight'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('NetWeight'+strtask).AsFloat
                                                /oldValue;
         //计费单位量
         if (OldValue<>0) and blnBLJS then
           FieldByName('costquantity'+strtask).AsFloat:=FieldByName('grossweight'+strtask).AsFloat
                                                *FieldByName('costquantity'+strtask).AsFloat
                                                /oldValue;
      end;
   end;
end;

procedure TfrmOperation.GrossWeightConValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if getSysdata('cusname')='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdCONSKU.InplaceEditor.GetEditingText='',0,grdCONSKU.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qryConSku.FieldByName('Grossweight').AsFloat;
         data.qryConSku.Edit;
         data.qryConSku.FieldByName('Grossweight').AsFloat:=StrToFloat(IIF(grdCONSKU.InplaceEditor.GetEditingText='',0,grdCONSKU.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUgrossweight(data.qryConSku,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmOperation.NetWeightCarValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if getSysdata('cusname')='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdCARSKU.InplaceEditor.GetEditingText='',0,grdCARSKU.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qrycarsku.FieldByName('Netweight').AsFloat;
         data.qrycarsku.Edit;
         data.qrycarsku.FieldByName('Netweight').AsFloat:=StrToFloat(IIF(grdCARSKU.InplaceEditor.GetEditingText='',0,grdCARSKU.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUweight(data.qrycarsku,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmOperation.GrossWeightCarValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if getSysdata('cusname')='HQWL' then
   begin
      if DataState in Setdcs then
      begin
         if StrToFloat(IIF(grdCARSKU.InplaceEditor.GetEditingText='',0,grdCARSKU.InplaceEditor.GetEditingText))<0 then
         begin
            ErrorText:=_strnumberzero;
            Accept:=False;
            exit;
         end;
         QuantityDetailOldValue:=data.qrycarsku.FieldByName('grossweight').AsFloat;
         data.qrycarsku.Edit;
         data.qrycarsku.FieldByName('grossweight').AsFloat:=StrToFloat(IIF(grdCARSKU.InplaceEditor.GetEditingText='',0,grdCARSKU.InplaceEditor.GetEditingText));
         blnBLJS:=True;
         CountSKUgrossweight(data.qrycarsku,QuantityDetailOldValue,'');
         blnBLJS:=False;
      end;
   end;
end;

procedure TfrmOperation.mitprintconClick(Sender: TObject);
var
  KF1Book:TKF1book;
  strsno:integer;
  strjobno:string;
begin
   strsno:=data.qryCon.fieldbyname('sno').asinteger;
   strjobno:=data.qryCon.fieldbyname('jobno').AsString;
   try
      opensql(dataTmp.qrytmp1,' select top 1 * from locationinoutconsku(nolock) '
                             +'  where jobno="'+strjobno+'"'
                             +'    and sno="'+data.qryCon.fieldbyname('sno').AsString+'"'
                             );
      //lzw20110302
      if Pos('七匹狼',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
         OpenSql(dataTmp.qryTmp,'ksp_conckzxd @jobno="'+strjobno+'",@consno="'+inttostr(strsno)+'" ')
      else if Pos('鸿星尔克',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
         OpenSql(dataTmp.qryTmp,'ksp_hxekconckzxd @jobno="'+strjobno+'",@consno="'+inttostr(strsno)+'" ')
      else if Pos('鳄莱特',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
         OpenSql(dataTmp.qryTmp,'ksp_eltconckzxd @jobno="'+strjobno+'",@consno="'+inttostr(strsno)+'" ');

      //lzw20110722
      if Pos('PH',strjobno)>0 then
      OpenSql(datatmp.qryTmp1,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                             +'       SkuDetailOut.cusbillno,SkuDetailOut.cusname,SkuDetailOut.locationbillno    '+chr(13)+chr(10)
                             +'  from SkuDetailOut(nolock)       '+chr(13)+chr(10)
                             +'       left join customer(nolock) '+chr(13)+chr(10)
                             +'              on customer.cusid=SkuDetailOut.shipcusid   '+chr(13)+chr(10)
                             +' where jobno="'+strjobno+'" '+chr(13)+chr(10)
                      );
      if Pos('LI',strjobno)>0 then
      OpenSql(datatmp.qryTmp1,'select shipcusname,customer.address,customer.mobiletel,  '+chr(13)+chr(10)
                             +'       locationin.cusbillno,locationin.cusname,locationin.locationbillno    '+chr(13)+chr(10)
                             +'  from locationin(nolock)       '+chr(13)+chr(10)
                             +'       left join customer(nolock) '+chr(13)+chr(10)
                             +'              on customer.cusid=locationin.shipcusid   '+chr(13)+chr(10)
                             +' where jobno="'+strjobno+'" '+chr(13)+chr(10)
                      );

      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         if Pos('七匹狼',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
            Bbdm:='100122'
         else if Pos('鸿星尔克',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
            Bbdm:='100022'
         else if Pos('鳄莱特',dataTmp.qrytmp1.fieldbyname('CusName').AsString)>0 then
            Bbdm:='100042';

         paras.Values['shipcusname']:=dataTmp.qrytmp1.fieldbyname('shipcusname').AsString;
         paras.Values['cusbillno']:=dataTmp.qrytmp1.fieldbyname('cusbillno').AsString;
         //lzw20110723
         paras.Values['locationbillno']:=dataTmp.qrytmp1.fieldbyname('locationbillno').AsString;
         paras.Values['address']:=datatmp.qryTmp1.FieldByname('address').AsString;
         paras.Values['mobiletel']:=datatmp.qryTmp1.FieldByname('mobiletel').AsString;
         paras.Values['conno']:=data.qryCon.fieldbyname('conno').AsString;
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;

end;

procedure TfrmOperation.CusNameConButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
 var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      DATA.qryCONSku.Edit;
      data.qryCONSku.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
      data.qryCONSku.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
   end;
end;

procedure TfrmOperation.ShipperCusNameConButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      DATA.qryCONSku.Edit;
      data.qryCONSku.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
      data.qryCONSku.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
   end;

end;

procedure TfrmOperation.edtconvenoExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
  maxsno:Integer;
begin
  if DataState<>stbrowse then
      Exit;
  if edtconveno.text='' then Exit;
  opensql(dataTmp.qryTmp,'select 1 from  locationinoutcon(nolock)      '
                        +' where conveno="'+edtconveno.Text+'" '
                        +'   and jobno like "%ZK%"  '
                        );
  If datatmp.qrytmp.recordcount=0 then
  begin
     KMessageDlg('不存在该车牌号的车',mtWarning,[mbOK],0);
     edtconveno.SetFocus;
     Exit;
  end else
  begin
     opensql(datatmp.qrytmp,'select maxsno=max(sno)+1 from locationinoutcon(nolock) '
                           +' where Jobno="'+strjobno+'" '+chr(13)+chr(10)
                        ) ;
     maxsno:=dataTmp.qryTmp.FieldByName('maxsno').AsInteger;

     opensql(data.qrycar,'update locationinoutcon set      '
                        +'       jobno="'+strjobno+'",sno='+inttostr(maxsno)+'      '
                        +' where conveno="'+edtconveno.Text+'" '
                        +'   and jobno like "%ZK%"  '
                        +'select locationinoutcon.* '+chr(13)+chr(10)
                        +'  from locationinoutcon  '+chr(13)+chr(10)
                        +' where Jobno="'+strjobno+'" '+chr(13)+chr(10)
                        +'   and isnull(iscon,"F")="F" '+chr(13)+chr(10)
                        );
  end;

end;

procedure TfrmOperation.carloadcomdateValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
if DataState=stbrowse then
    Exit;
   begin
      data.qrycar.Edit;
      data.qrycar.FieldByName('loadcomdate').AsDateTime:=GetServerDate;
   end;
end;

procedure TfrmOperation.btnoperClick(Sender: TObject);

begin
   _ADOConnection.Starttransaction;
   try
      opensql(datatmp.qryTmp2,'select CHECKNAME=isnull(CHECKNAME,""),blno=isnull(blno,"") from locationin(nolock) '
                             +' where jobno="'+strjobno+'"  '
             );
      if datatmp.qryTmp2.FieldByName('CHECKNAME').asstring<>'' then
      begin
         KMessageDlg('该进仓已审核,不能上架',mtWarning,[mbOK],0);
         exit;
      end;
      if (Kmessagedlg('是否货物进行上架？',mtInformation,[mbYes,mbNo],0)=mrYes) then
      begin
         //locinskudetail导入
         ExecSql(datatmp.qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'        where id=object_id("tempdb..#lskdetailmx") and sysstat & 0xf=3)               '+chr(13)+chr(10)
                       +'   drop table #lskdetailmx                                                            '+chr(13)+chr(10)
                       +'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'  where id=object_id("tempdb..#lskconsku") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                       +'   drop table #lskconsku                                                          '+chr(13)+chr(10)
                       +' select quantity=sum(quantity),jobno,locid,                                             '+chr(13)+chr(10)
                       +'        locname,skuspec,color,skuid,skuname,quantityuom,locationinoutconsku.serialno   '+chr(13)+chr(10)
                       +'   into #lskconsku                                                                      '+chr(13)+chr(10)
                       +'   from locationinoutconsku(nolock)                                                     '+chr(13)+chr(10)
                       +'  where jobno="'+strjobno+'"                                                     '+chr(13)+chr(10)
                       +'  group by jobno,locid,locname,skuspec,color,skuid,skuname,locationinoutconsku.serialno,quantityuom  '+chr(13)+chr(10)
                       //lzw20111020
                       +' delete locinskudetail where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                       +' select jobno=item.jobno,item.sno,ldsno=0,detailsno=0,   '+chr(13)+chr(10)
                       +'        locationinoutconsku.skuid,locationinoutconsku.skuname,locationinoutconsku.serialno,  '+chr(13)+chr(10)
                       +'        quantity=sum(locationinoutconsku.quantity),locationinoutconsku.quantityuom,'+chr(13)+chr(10)
                       +'        qualityname="正品",item.userid,item.username,'+chr(13)+chr(10)
                       +'        locationinoutconsku.color,locationinoutconsku.skuspec,             '+chr(13)+chr(10)
                       +'        locationinoutconsku.locid, locationinoutconsku.locname,            '+chr(13)+chr(10)
                       +'        item.costcusid,item.costcusname,           '+chr(13)+chr(10)
                       +'        item.cusid,item.cusname,                    '+chr(13)+chr(10)
                       +'        item.shippercusid,item.shippercusname,      '+chr(13)+chr(10)
                       +'        item.iuserid,item.iusername,                '+chr(13)+chr(10)
                       +'        item.operationdate,tracktype="TO",skubrand="'+datatmp.qryTmp2.FieldByName('blno').asstring+'"                       '+chr(13)+chr(10)
                       +'   into #lskdetailmx                                                       '+chr(13)+chr(10)
                       +'   from locationinitem item(nolock),#lskconsku locationinoutconsku (nolock)             '+chr(13)+chr(10)
                       +'  where item.jobno=locationinoutconsku.jobno                      '+chr(13)+chr(10)
                       +'    and item.skuid=locationinoutconsku.skuid                       '+chr(13)+chr(10)
                       //+'    and locationindetail.locid=locationinoutconsku.locid                     '+chr(13)+chr(10)
                       //+'    and locationindetail.quantity=locationinoutconsku.quantity              '+chr(13)+chr(10)
                       +'    and locationinoutconsku.jobno="'+strjobno+'"                               '+chr(13)+chr(10)
                       +'  group by item.jobno,item.sno,'+chr(13)+chr(10)
                       +'        locationinoutconsku.skuid,locationinoutconsku.skuname,locationinoutconsku.serialno,'+chr(13)+chr(10)
                       +'        locationinoutconsku.quantityuom,item.userid,item.username,'+chr(13)+chr(10)
                       +'        locationinoutconsku.color,locationinoutconsku.skuspec,        '+chr(13)+chr(10)
                       +'        locationinoutconsku.locid, locationinoutconsku.locname,       '+chr(13)+chr(10)
                       +'        item.costcusid,item.costcusname,      '+chr(13)+chr(10)
                       +'        item.cusid,item.cusname,              '+chr(13)+chr(10)
                       +'        item.shippercusid,item.shippercusname,'+chr(13)+chr(10)
                       +'        item.iuserid,item.iusername,         '+chr(13)+chr(10)
                       +'        item.operationdate                               '+chr(13)+chr(10)

                       +'declare @detailsno int                                              '+chr(13)+chr(10)
                       +' select @detailsno=0                                                 '+chr(13)+chr(10)
                       +' update #lskdetailmx set detailsno=@detailsno,@detailsno=@detailsno+1 '+chr(13)+chr(10)
                       +' insert into locinskudetail                                          '+chr(13)+chr(10)
                       +'    (jobno,sno,ldsno,detailsno,skuid,                               '+chr(13)+chr(10)
                       +'     skuname,serialno,quantity,quantityremain,quantityuom,           '+chr(13)+chr(10)
                       +'     qualityname,color,skuspec,locid,locname,                       '+chr(13)+chr(10)
                       +'    costcusid,costcusname,cusid,cusname,shippercusid,shippercusname, '+chr(13)+chr(10)
                       +'     userid,username,operationdate,iuserid,iusername,tracktype,skubrand)    '+chr(13)+chr(10)
                       +' select jobno,sno,ldsno,detailsno,skuid,                           '+chr(13)+chr(10)
                       +'        skuname,serialno,quantity,quantity,quantityuom,             '+chr(13)+chr(10)
                       +'        qualityname,color,skuspec,locid,locname,                      '+chr(13)+chr(10)
                       +'        costcusid,costcusname,cusid,cusname,shippercusid,shippercusname, '+chr(13)+chr(10)
                       +'        userid,username,operationdate,iuserid,iusername,tracktype,skubrand   '+chr(13)+chr(10)
                       +'    from #lskdetailmx (nolock)                                      '+chr(13)+chr(10)
                       );
         ExecSql(datatmp.qryTmp,'     if exists(select * from tempdb..sysobjects                                          '+chr(13)+chr(10)
                       +'        where id=object_id("tempdb..#lskdetail") and sysstat & 0xf=3)                  '+chr(13)+chr(10)
                       +'   drop table #lskdetail                                                               '+chr(13)+chr(10)
                       +' delete locationindetail where jobno="'+strjobno+'"                              '+chr(13)+chr(10)
                       +' select item.jobno,item.sno,ldsno=0,                                '+chr(13)+chr(10)
                       +'        detail.skuid,detail.skuname,                         '+chr(13)+chr(10)
                       +'        detail.quantityuom,quantity=sum(detail.quantity),     '+chr(13)+chr(10)
                       +'        taskdate=item.taskdate,detail.cusid,                           '+chr(13)+chr(10)
                       +'        qualityname="正品",userid=detail.userid,username=detail.username, '+chr(13)+chr(10)
                       +'        detail.cusname,detail.shippercusid,detail.shippercusname, '+chr(13)+chr(10)
                       +'        detail.iuserid,detail.iusername,detail.locname,detail.locid, '+chr(13)+chr(10)
                       +'        item.operationtype,detail.operationdate,item.warerentcounttype, '+chr(13)+chr(10)
                       +'        item.countrent,item.locationbillno,                          '+chr(13)+chr(10)
                       +'        detail.costcusid,detail.costcusname,item.cusbillno      '+chr(13)+chr(10)
                       +'   into #lskdetail                                                                       '+chr(13)+chr(10)
                       +'   from locationinitem item(nolock),locinskudetail detail(nolock)                     '+chr(13)+chr(10)
                       +'  where item.jobno=detail.jobno                                   '+chr(13)+chr(10)
                       +'    and item.sno=detail.sno                                    '+chr(13)+chr(10)
                       +'    and item.skuid=detail.skuid                                    '+chr(13)+chr(10)
                       +'    and detail.jobno="'+strjobno+'"                                 '+chr(13)+chr(10)
                       +'  group by item.jobno,item.sno,                                       '+chr(13)+chr(10)
                       +'        detail.skuid,detail.skuname,                            '+chr(13)+chr(10)
                       +'        detail.quantityuom,                                                  '+chr(13)+chr(10)
                       +'        item.taskdate,detail.cusid,detail.userid,detail.username, '+chr(13)+chr(10)
                       +'        detail.cusname,detail.shippercusid,detail.shippercusname, '+chr(13)+chr(10)
                       +'        detail.iuserid,detail.iusername,detail.locname,detail.locid,'+chr(13)+chr(10)
                       +'        item.operationtype,detail.operationdate,item.warerentcounttype,'+chr(13)+chr(10)
                       +'        item.countrent,item.locationbillno,                           '+chr(13)+chr(10)
                       +'        detail.costcusid,detail.costcusname,item.cusbillno      '+chr(13)+chr(10)

                       +' declare @ldsno int                                                                       '+chr(13)+chr(10)
                       +'  select @ldsno=0                                                                         '+chr(13)+chr(10)
                       +'  update #lskdetail set ldsno=@ldsno,@ldsno=@ldsno+1                                      '+chr(13)+chr(10)

                       +' insert into locationindetail                                                             '+chr(13)+chr(10)
                       +'        (jobno,jobnoinf,sno,snoinf,ldsnoinf,ldsno,ldsnoin,skuid,skuname,                  '+chr(13)+chr(10)
                       +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                  '+chr(13)+chr(10)
                       +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,              '+chr(13)+chr(10)
                       +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,           '+chr(13)+chr(10)
                       +'        costcusid,costcusname,cusbillno)                                                       '+chr(13)+chr(10)
                       +' select jobno,jobnoinf=jobno,sno,snoinf=sno,ldsnoinf=ldsno,ldsno=ldsno,ldsnoin=ldsno,skuid,skuname,'+chr(13)+chr(10)
                       +'        qualityname,userid,username,quantityuom,quantity,taskdate,cusid,                  '+chr(13)+chr(10)
                       +'        cusname,shippercusid,shippercusname,iuserid,iusername,locname,locid,              '+chr(13)+chr(10)
                       +'        operationtype,operationdate,warerentcounttype,countrent,locationbillno,           '+chr(13)+chr(10)
                       +'        costcusid,costcusname,cusbillno                                                   '+chr(13)+chr(10)
                       +'   from #lskdetail (nolock)                                                               '+chr(13)+chr(10)
                       //lzw20111020
                       +' update locinskudetail set ldsno=detail.ldsno        '+chr(13)+chr(10)
                       +'   from locationindetail detail(nolock)               '+chr(13)+chr(10)
                       +'  where locinskudetail.jobno=detail.jobno            '+chr(13)+chr(10)
                       +'    and locinskudetail.sno=detail.sno                '+chr(13)+chr(10)
                       +'    and locinskudetail.locid=detail.locid            '+chr(13)+chr(10)
                       +'    and locinskudetail.skuid=detail.skuid            '+chr(13)+chr(10)
                       +'    and locinskudetail.jobno="'+strjobno+'"          '+chr(13)+chr(10)

                       );

      end;
      _ADOConnection.Commit;
   except
      if _ADOConnection.InTransaction then
         _ADOConnection.Rollback;
      raise;
      exit;
   end;
end;

procedure TfrmOperation.locnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery; 
begin
   qrySelect:=pGetLocationSelect('T','','','');
   if qrySelect.FieldByName('locid').AsString<>'NO' then
   begin
      data.qrycon.edit;
      data.qrycon.FieldByName('locid').AsString  :=qrySelect.FieldByName('locid').asstring;
      data.qrycon.FieldByName('locname').AsString  :=qrySelect.FieldByName('locname').asstring;
   end;
   FreeAndNil(qrySelect);

end;

procedure TfrmOperation.btnInPutClick(Sender: TObject);
var
   strName,strlocname,strsql:string;
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
                 '   from [sheet1$] ';
         AqryMtf.Close;
         AqryMtf.SQL.Clear;
         AqryMtf.SQL.Add(strSql);
         AqryMtf.Open;
      except
         KmessageDlg('您所选定的文件无效！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   strsql:='';
   if _strsyscus='XT' then
   begin
      ExecSql(dataTmp.qryTmp,'if  exists(select * from tempdb..sysobjects '+chr(10)+chr(13)
                         +'           where id=object_id("tempdb..#lskconexcel") and sysstat & 0xf=3) '+chr(10)+chr(13)
                         +'    drop table #lskconexcel '+chr(10)+chr(13)
                         +'create table #lskconexcel( '+chr(10)+chr(13)
                         +'     jobno varchar(50), '+chr(10)+chr(13)
                         +'     conno varchar(50), '+chr(10)+chr(13)
                         +'     locid varchar(50), '+chr(10)+chr(13)
                         +'     locname varchar(100) '+chr(10)+chr(13)
                         +')'
          );
      try
         if (AqryMtf.Fields[0].FieldName='箱号') and
            (AqryMtf.Fields[1].FieldName='仓位') then
         begin
            AqryMtf.First;
            while not AqryMtf.Eof do
            begin  //EXCEL格式判断
               strsql:=strsql+' insert into #lskconexcel(jobno,conno,locname)'
                             +'   values("'+strjobno+'",'
                             +'          "'+AqryMtf.Fields[0].AsString+'",'
                             +'          "'+AqryMtf.Fields[1].AsString+'" '
                             +')'
                             ;
               AqryMtf.Next;
            end;
         end;
      except
         KmessageDlg('Excel文件格式不符合要求！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;

   if strsql<>'' then
   begin
      try
         ExecSql(dataTmp.qryTmp,strsql);

         OpenSql(dataTmp.qryTmp1,' select distinct #lskconexcel.locname '+chr(13)+chr(10)
                 +'   from #lskconexcel       '+chr(13)+chr(10)
                 +'  where not exists(select 1  from  location (nolock)  '+chr(13)+chr(10)
                 +'                    where location.locname=#lskconexcel.locname  '+chr(13)+chr(10)
                 +'                      and location.isdetail="T" ) '+chr(13)+chr(10)
                 );
         dataTmp.qryTmp1.First;
         strlocname:='';
         while not dataTmp.qryTmp1.Eof do
         begin
            strlocname:=strlocname+'/'+Trim(dataTmp.qryTmp1.FieldByName('locname').Asstring);
            dataTmp.qryTmp1.Next;
         end;
         if Trim(strlocname)<>'' then
         begin
            KMessageDlg('系统不存在以下库位："'+strlocname+'",请重新确认！',mtInformation,[mbOk],0);
            Exit;
         end else
         begin
            ExecSql(dataTmp.qryTmp,'update #lskconexcel set '
                                  +'       locid=location.locid '
                                  +'  from location(nolock)      '
                                  +'update locationinoutcon set                                  '
                                  +'       locid=#lskconexcel.locid,locname=#lskconexcel.locname '
                                  +'  from #lskconexcel                                          '
                                  +' where #lskconexcel.jobno=locationinoutcon.jobno             '
                                  +'   and #lskconexcel.conno=locationinoutcon.conno             '
                                  +'update locationinoutconsku set                                  '
                                  +'       locid=locationinoutcon.locid,locname=locationinoutcon.locname '
                                  +'  from locationinoutcon                                          '
                                  +' where locationinoutconsku.jobno=locationinoutcon.jobno             '
                                  +'   and locationinoutconsku.sno=locationinoutcon.sno             '

                 );

         end;

      except
         KmessageDlg('Excel文件导入出现异常！' , mtWarning,[mbOk],0);
         conMtf.Close;
         Exit;
      end;
   end;
   conMtf.Close;

end;

end.

