unit MoveLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,LibBb,
  KUpdateSql,dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider,DBClient ;

type
  TfrmMoveLoc = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnRefresh: TKBitBtn;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btncopy: TKBitBtn;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    grdMoveloc: TdxDBGrid;
    TASKDATE: TdxDBGridColumn;
    LocationBillNO: TdxDBGridColumn;
    CostAccountName: TdxDBGridColumn;
    SKUNAME: TdxDBGridColumn;
    QUANTITY: TdxDBGridColumn;
    iUserName: TdxDBGridColumn;
    Location_To: TdxDBGridColumn;
    Location_From: TdxDBGridColumn;
    CHECKUSERNAME: TdxDBGridColumn;
    CountUserName: TdxDBGridColumn;
    JOBNO: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel3: TGMSStickyLabel;
    dtdTaskDate: TdxDBDateEdit;
    edtiUsername: TdxDBButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    PIECE: TdxDBGridColumn;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    popMoveLocNew: TPopupMenu;
    mitAddLocNew: TMenuItem;
    mitDelLocNew: TMenuItem;
    OPERATIONUSERNAME: TdxDBGridColumn;
    N2: TMenuItem;
    mitDetail_IN: TMenuItem;
    mitDetail_IN_F: TMenuItem;
    mitRLDetail: TMenuItem;
    ACTCHKUserName: TdxDBGridColumn;
    timTASKDATE: TdxDBTimeEdit;
    popMoveLocOld: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    N1: TMenuItem;
    mitItem_IN: TMenuItem;
    mitItem_IN_F: TMenuItem;
    mitRLItem: TMenuItem;
    edtcostcusid: TdxDBButtonEdit;
    GMSStickyLabel20: TGMSStickyLabel;
    btnPaste: TKBitBtn;
    KGroupBox2: TKGroupBox;
    grdMoveLocOld: TdxDBGrid;
    SnoOld: TdxDBGridCurrencyColumn;
    NotFullSignOld: TdxDBGridCheckColumn;
    LocNameOld: TdxDBGridButtonColumn;
    cusNameOld: TdxDBGridButtonColumn;
    costcusidOld: TdxDBGridButtonColumn;
    ShippercusNameOld: TdxDBGridButtonColumn;
    SKUNameOld: TdxDBGridButtonColumn;
    LotCodeOld: TdxDBGridColumn;
    QualityNameOld: TdxDBGridButtonColumn;
    QuantityOld: TdxDBGridCurrencyColumn;
    QuantityUOMOld: TdxDBGridPickColumn;
    PieceOld: TdxDBGridCurrencyColumn;
    pieceuomOld: TdxDBGridPickColumn;
    VolumeOld: TdxDBGridCurrencyColumn;
    VolumeUOMOld: TdxDBGridPickColumn;
    areaOld: TdxDBGridCurrencyColumn;
    AreaUOMOld: TdxDBGridPickColumn;
    GrossWeightOld: TdxDBGridCurrencyColumn;
    NetWeightOld: TdxDBGridCurrencyColumn;
    WeightUOMOld: TdxDBGridPickColumn;
    loadgroupcusnameOld: TdxDBGridButtonColumn;
    forkgroupcusnameOld: TdxDBGridButtonColumn;
    liftmachinecusnameOld: TdxDBGridButtonColumn;
    TagTotalOld: TdxDBGridCurrencyColumn;
    TagEachUOMOld: TdxDBGridPickColumn;
    casing1Old: TdxDBGridCurrencyColumn;
    uom1Old: TdxDBGridPickColumn;
    casing2Old: TdxDBGridCurrencyColumn;
    uom2Old: TdxDBGridPickColumn;
    casing3Old: TdxDBGridCurrencyColumn;
    uom3Old: TdxDBGridPickColumn;
    casing4Old: TdxDBGridCurrencyColumn;
    uom4Old: TdxDBGridPickColumn;
    casing5Old: TdxDBGridCurrencyColumn;
    uom5Old: TdxDBGridPickColumn;
    RxSplitter1: TRxSplitter;
    KGroupBox3: TKGroupBox;
    KSText4: TKSText;
    grdMoveLocNew: TdxDBGrid;
    LDSNONew: TdxDBGridColumn;
    NotFullSignNew: TdxDBGridCheckColumn;
    LocNameNew: TdxDBGridButtonColumn;
    OPERATIONDATENew: TdxDBGridDateColumn;
    LotCodeNew: TdxDBGridColumn;
    loadgroupcusnameNew: TdxDBGridButtonColumn;
    forkgroupcusnameNew: TdxDBGridButtonColumn;
    liftmachinecusnameNew: TdxDBGridButtonColumn;
    QualityNameNew: TdxDBGridButtonColumn;
    TagNONew: TdxDBGridColumn;
    SerialNONew: TdxDBGridColumn;
    QuantityNew: TdxDBGridCurrencyColumn;
    QuantityUOMNew: TdxDBGridPickColumn;
    PieceNew: TdxDBGridCurrencyColumn;
    pieceuomNew: TdxDBGridPickColumn;
    VolumeNew: TdxDBGridCurrencyColumn;
    VolumeUOMNew: TdxDBGridPickColumn;
    areaNew: TdxDBGridCurrencyColumn;
    AreaUOMNew: TdxDBGridPickColumn;
    GrossWeightNew: TdxDBGridCurrencyColumn;
    NetWeightNew: TdxDBGridCurrencyColumn;
    WeightUOMNew: TdxDBGridPickColumn;
    casing1New: TdxDBGridCurrencyColumn;
    uom1New: TdxDBGridPickColumn;
    casing2New: TdxDBGridCurrencyColumn;
    uom2New: TdxDBGridPickColumn;
    casing3New: TdxDBGridCurrencyColumn;
    uom3New: TdxDBGridPickColumn;
    casing4New: TdxDBGridCurrencyColumn;
    uom4New: TdxDBGridPickColumn;
    casing5New: TdxDBGridCurrencyColumn;
    uom5New: TdxDBGridPickColumn;
    tageachuomNew: TdxDBGridPickColumn;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCreateName: TdxDBEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    dtdcreatedate: TdxDBDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtcheckname: TdxDBEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    dtdcheckdate: TdxDBDateEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    edtjobno: TdxDBEdit;
    cmbskucostclasscd: TKinDbPickEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    mitlocskudetail: TMenuItem;
    serialnoold: TdxDBGridColumn;
    btnOper: TKBitBtn;
    KGroupBox7: TKGroupBox;
    GMSStickyLabel72: TGMSStickyLabel;
    GMSStickyLabel74: TGMSStickyLabel;
    GMSStickyLabel75: TGMSStickyLabel;
    GMSStickyLabel76: TGMSStickyLabel;
    KSText1: TKSText;
    KSText2: TKSText;
    KSText3: TKSText;
    skumodelold: TdxDBGridColumn;
    skuspecold: TdxDBGridColumn;
    pieceproold: TdxDBGridColumn;
    skumodelnew: TdxDBGridColumn;
    skuspecnew: TdxDBGridColumn;
    ppmcheck: TPopupMenu;
    mitcheck: TMenuItem;
    mitcancel: TMenuItem;
    KSText5: TKSText;
    GMSStickyLabel8: TGMSStickyLabel;
    confirmed: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    grdcusbillno: TdxDBGridColumn;
    ppmMain: TPopupMenu;
    mitcostforkwork: TMenuItem;
    mitcanclecost: TMenuItem;
    mitlookforkwork: TMenuItem;
    quantityshortnew: TdxDBGridCurrencyColumn;
    quantityshortold: TdxDBGridCurrencyColumn;
    corpno: TdxDBGridKinPickColumn;
    grdcorpno: TdxDBGridKinPickColumn;
    remark: TdxDBGridColumn;
    remarknew: TdxDBGridColumn;
    netweight: TdxDBGridColumn;
    mittaskcheck: TMenuItem;
    mituntaskcheck: TMenuItem;
    taskcheckname: TdxDBGridColumn;
    taskcheckdate: TdxDBGridColumn;
    KSText6: TKSText;
    GMSStickyLabel9: TGMSStickyLabel;
    memRemark: TdxDBMemo;
    GMSStickyLabel11: TGMSStickyLabel;
    ppmprint: TPopupMenu;
    mitprint: TMenuItem;
    grdremark: TdxDBGridColumn;
    edtlocationbillno: TdxDBEdit;
    GMSStickyLabel12: TGMSStickyLabel;
    skunamenew: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure grdMoveLocOldChangeNodeEx(Sender: TObject);
    procedure grdMoveLocOldEnter(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure grdMoveLocOldExit(Sender: TObject);
    procedure grdMoveLocNewEnter(Sender: TObject);
    procedure mitAddLocNewClick(Sender: TObject);
    procedure grdMoveLocOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitDelLocNewClick(Sender: TObject);
    procedure LocNameOldButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure pgcMainChange(Sender: TObject);
    procedure grdMovelocChangeNodeEx(Sender: TObject);
    procedure LocNameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure loadgroupcusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure forkgroupcusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure liftmachinecusnameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QualityNameNewButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure QuantityNewValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure QuantityOldValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnPasteClick(Sender: TObject);
    procedure edtiUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtiUsernameExit(Sender: TObject);
    procedure edtiUsernameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure grdMoveLocOldEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdMoveLocNewEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure edtcostcusidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtcostcusidExit(Sender: TObject);
    procedure edtcostcusidExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure grdMovelocDblClick(Sender: TObject);
    procedure mitlocskudetailClick(Sender: TObject);
    procedure grdMoveLocNewChangeNodeEx(Sender: TObject);
    procedure LocNameNewValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btnOperClick(Sender: TObject);
    procedure grdMovelocCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure PieceOldValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure PieceNewValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure mitcheckClick(Sender: TObject);
    procedure mitcancelClick(Sender: TObject);
    procedure mitcostforkworkClick(Sender: TObject);
    procedure mitcanclecostClick(Sender: TObject);
    procedure mitlookforkworkClick(Sender: TObject);
    procedure quantityshortnewValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mittaskcheckClick(Sender: TObject);
    procedure mituntaskcheckClick(Sender: TObject);
    procedure mitprintClick(Sender: TObject);
  private
    { Private declarations }
    //��������
    strMLjobno:string;                 //����ȡ�ù�����
    blnCopy,blnSelect:Boolean;
    strJobno:string;
    DataState:TDataState;
    mode:TDataState;             //����form״̬ģʽ
    strsql,FilterSql: string;
    FindItem: TFindItem;          //�Ƿ���Ҫ����
    setDisable:TsetInt;
    arrml,arrMoveLoc,arrMoveLocOld,arrMoveLocNew:Variant;//�������ݸ���
    sltselect:TStringList;// �����ѡ����
    ScrollAfterEdit:Boolean;           //�ж������¼�Ƿ��ƶ�
    m_blnPost: Boolean;//��Post״̬
    strDel_New:string;//Ŀ���λɾ��,��¼ɾ�����
    //���̶���
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
    procedure InitValues;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetControlState(CallMode:TDataState;blnCreate:Boolean);
    procedure pgcRelocationChange(Sender: TObject);
    procedure grdMoveLocOldbeforeInsert;
    procedure grdMoveLocNewbeforeInsert;
    procedure CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended);
    procedure CountSKUPiece(var pqrySKU:TKADOQuery;OldValue:extended);
    //���ʿ��ƹ���
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//��¼��Ʒ��ϸɾ��,datas��.
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkMoveLoc(CallMode:TDataState;pJobno,pItemOrDetail:string);

var
  frmMoveLoc: TfrmMoveLoc;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,find, GetUserRight,Gridselect,datasTmp,GetDllPub,
     LocationSKUSelect,LocOutSKUDetail,GetLocation,forkworknew,forkworkload,
     libuserPub,linprint,libRmBb;

var strpJobno:string;

procedure WorkMoveLoc(CallMode:TDataState;pJobno,pItemOrDetail:string);
{��ں���
  CallMode   :����form״̬ģʽ
  pstrJobno  :��λJobno
  pDataBaseID:��λDataBaseID
  pItemOrDetail  :������־ I ���� D ʵ��
}
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   strpJobno:=pJobno;
   if frmMoveLoc <> nil then
   with frmMoveLoc do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmMoveLoc:=TfrmMoveLoc.Create(application);

   with frmMoveLoc do
   begin
   {��ʼ���������ݼ�}
      //��ʼ������
      blnCopy        :=False;             //ϵͳĬ�ϲ���������
      FindItem       :=TFindItem.Create;
      sltselect      :=TStringList.Create;
      mode           :=CallMode;
      strJobno       :=pJobno;
      blnSavePost:=False;
      ScrollAfterEdit:=True;

      if getSysdata('cusname')='SZWY' then
      begin
         corpno.Caption:='���̺�';
         grdcorpno.Caption:='���̺�';
         casing5Old.Caption:='������';
         casing5New.Caption:='������';
      end;
      if _strsyscus='XT' then
      begin

         serialnoold.Caption:='��Ʒ����';
         SerialNONew.Caption:='��Ʒ����';

      end;
      if _strsyscus='JG' then
      begin
         btnPrint.PopupMenu:=ppmprint;
      end;
      //�Ʒ���Ʒ��
      InitdbPick(cmbskucostclasscd,'SKUCostClass','SKUCostClassCD','SKUCostClassName','1=1');
      //��ʼ��
      data.InitMoveloc(strjobno);
      //�������������
      if _Filter_CurMonth<>'F' then
      begin
        decodedate(date,year,month,day);
        Month_Start:=encodedate(year,month,1);
        Month_End  :=IncMonth(Month_Start,1)-1;
      end else
      begin
        Month_Start:=date-_Filter_LessDate;
        Month_End  :=date+_Filter_MoreDate;
      end;
      if trim(strJobno)='' then
      begin
        FilterSql:=' (convert(datetime,convert(char(8),moveloc.operationdate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),moveloc.operationdate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('1');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('�ƻ�����          ���ڵ���      '+datetostr(Month_Start));
           Field.Add('1');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('�ƻ�����          С�ڵ���      '+datetostr(Month_End));
        end;
      end else FilterSql:='';

      data.qryML.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

  // ������ʾ����
      SetControlState(stBrowse,true);
      data.qryML.open;
      if strJobno<>'' then
      data.qryML.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
      if UpperCase(_Loginid)<>'SYSTEM' then
         SetButtonEnabled(ToolPanel,'mitMoveLocation',trim(_userorgid));//���ð�ť����Ч��
      WorkCall(stBrowse);

      {����FORM}
      if strJobno<>'' then
      begin
         ShowModal;
         Free;
      end else Show;
   end;
end;

procedure TfrmMoveLoc.WorkCall(CallMode:TDataState);
{ģ��������
   CallMode:����״̬
       stBrowse:����鿴
       stInsert:����
       stEdit:�༭�޸�}
begin
  DataState:=CallMode;
  with self do
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
           data.qryML.Edit;
           data.qryML.FieldByName('transfername').AsString  :=_Loginname;  //�����޸���
           data.qryML.FieldByName('transferdate').AsDateTime:=GetServerDate;
           maxMLOldSno:=0;
           openSql(dataTmp.qryTmp,' select sno=max(sno) from movelocold  where jobno="'+data.qryML.FieldByName('Jobno').AsString+'"');
           maxMLOldSno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;
           maxMLNewSno:=0;
           openSql(dataTmp.qryTmp,' select sno=max(sno) from movelocnew  where jobno="'+data.qryML.FieldByName('Jobno').AsString+'"');
           maxMLNewSno:=dataTmp.qryTmp.FieldByName('sno').AsInteger;

           LampChange(lsEdit);
        end;
      stInsert:
        begin
           maxMLOldSno:=0;
           maxMLNewSno:=0;
           _maxgridnomov:=0;
           data.qryML.Append;
           InitValues;
           EnableEdit;
           data.qryMoveLoc.FieldByName('createname').AsString:=_Loginname;
           data.qryMoveLoc.FieldByName('createdate').AsDateTime:=GetServerDate;
           data.qryml.fieldbyname('jobno').asstring:=data.qryMoveLoc.FieldByName('jobno').AsString;
        end;
    end;
  end;
end;

procedure TfrmMoveLoc.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);
  SetControlState(DataState,False);
  btnOper.Visible:=true;

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior+[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=False;
  grdMoveLocOld.ClearGroupColumns;

  grdMoveLocNew.OptionsBehavior:=grdMoveLocNew.OptionsBehavior+[edgoEditing];
  grdMoveLocNew.OptionsDB:=grdMoveLocNew.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocNew.ShowGroupPanel:=False;
  grdMoveLocNew.ClearGroupColumns;
end;

procedure TfrmMoveLoc.DisableEdit;
{�鿴����״̬����DISABLE�Ķ���}
begin
  setDisable:=[];
  if data.qryMl.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);
  SetControlState(DataState,False);
  btnOper.Visible:=False;

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior-[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=True;

  grdMoveLocNew.OptionsBehavior:=grdMoveLocNew.OptionsBehavior-[edgoEditing];
  grdMoveLocNew.OptionsDB:=grdMoveLocNew.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocNew.ShowGroupPanel:=True;
end;

procedure TfrmMoveLoc.DisableBrowse;
{�鿴����״̬����¼�ƶ�ʱ����ENABLE��DISABLE�Ķ���}
begin
//
end;

procedure TfrmMoveLoc.InitValues;
{��ʼ��ʱ�Զ����ɲ�λ����}
var
  strlocbillno:string;
begin
   opensql(datatmp.qryTmp,
           'select dhcx=max(convert(int,substring(docno1,7,8))) '
          +'  from genjobno '
          +' where substring(docno1,1,2)="ML"  '
          +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   strLocbillno:='ML'+copy(datetostr(GetServerDate),1,4)
                     +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   strMLJobno:=genJobno('ML',strLocbillno);
   data.qryMoveloc.edit;
   data.qryMoveLoc.FieldByName('jobno').AsString:=strMLjobno;
   data.qryMoveLoc.FieldByName('locationbillno').AsString:=strLocbillno;
   data.qryMoveLoc.FieldByName('operationtype').AsInteger:=-1;
   data.qryMoveLoc.FieldByName('operationdate').AsDateTime:=GetServerDate;
   data.qryMoveLoc.FieldByName('userid').AsString:=_userID;
   data.qryMoveLoc.FieldByName('username').AsString:=_username;
   data.qryMoveLoc.FieldByName('skucostclasscd').AsString:='';
   data.qryMoveLoc.FieldByName('createname').AsString:=_loginName;
   data.qryMoveLoc.FieldByName('createdate').AsDateTime:=GetServerDate;
   if _StrSysCus='SZWY' then
   begin
      data.qryMoveLoc.FieldByName('iusername').AsString:=_Username;
      data.qryMoveLoc.FieldByName('iuserid').AsString:=_Userid;
      data.qryMoveLoc.FieldByName('costcusname').AsString:='����ס��';
      data.qryMoveLoc.FieldByName('costcusid').AsString:='00000000000000000007';
      data.qryMoveLoc.FieldByName('skucostclasscd').AsString:='COMMON';
   end;
end;

procedure TfrmMoveLoc.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{���ôӿ�query��active
 blnPage�Ƿ���Ҫҳ�����
 blnOpen�Ƿ�open(�����ó�FalseʱblnReOpenһ��ҪΪFalse)
 blnReOpen�Ƿ���Ҫ����Open
}
begin
   if not ScrollAfterEdit and blnOpen then
   begin
     if data.qryMoveLoc.Active then
     begin
        data.qryMoveLoc.Close;
        data.qryMoveLoc.Open;
     end;
     if data.qryMoveLocOld.Active then
     begin
        data.qryMoveLocOld.Close;
        data.qryMoveLocOld.Open;
     end;
     if data.qryMoveLocNew.Active then
     begin
        data.qryMoveLocNew.Close;
        data.qryMoveLocNew.Open;
     end;
     if data.qrymovlocskudetail.Active then
     begin
        data.qrymovlocskudetail.Close;
//        data.qryMoveLocNew.Open;
     end;
     ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      data.qryMoveLoc.Active     :=blnOpen;
      data.qryMoveLocOld.Active  :=blnOpen;
      data.qryMoveLocNew.Active  :=blnOpen;
      data.qrymovlocskudetail.Close;
   end else
   begin
      data.qryMoveLoc.Active     :=blnOpen;
      data.qryMoveLocOld.Active  :=blnOpen;
      data.qryMoveLocNew.Active  :=blnOpen;
      data.qrymovlocskudetail.Close;
   end;
end;

procedure TfrmMoveLoc.SetMasterDetailState(blnConnect:Boolean);
{�����ӱ��MasterDetail��ϵ���ӻ��ж�}
begin
//
end;

procedure TfrmMoveLoc.SetControlState(CallMode:TDataState;blnCreate:Boolean);
{���ý���Ԫ�ص�visible,enable����
 CallMode��form��״̬
 blnCreate���Ƿ��Ǵ���ʱ��
}
begin
//
end;

function TfrmMoveLoc.Gather:boolean;
{����ֵ�������ݿ�ǰ,��ֵ�������}
var
   quantitynewtotal,piecenewtotal,quantitytotal,piecetotal,netweighttotal,
   volumenewtotal,areanewtotal,netweightnewtotal,grossnetweightnewtotal,
   casing1newtotal,casing2newtotal,casing3newtotal,casing4newtotal,casing5newtotal:Extended;
   locnameoldAll,locnamenewAll,strskuname,strsno:string;
   isQryEmtpy:Boolean;
begin
   result:=False;
   if DataState in Setdcs then
   begin
      if dtdTaskDate.Date=0 then
      begin
         {if _Language='CAPTIONC' then _strmessage:='�������ڲ���Ϊ�գ�������д'
         else _strmessage:='**************';}
         KMessageDlg(GetMessage('frmMoveLoc','001'),mtWarning,[mbOK],0);
         ActiveControl:=dtdTaskDate;
         Exit;
      end else
      if data.qryMoveLoc.FieldByName('iuserid').AsString='' then
      begin
         {if _Language='CAPTIONC' then _strmessage:='ִ�в��Ų���Ϊ�գ�������д'
         else _strmessage:='**************'; }
         KMessageDlg(GetMessage('frmMoveLoc','002'),mtWarning,[mbOK],0);
         ActiveControl:=edtiUsername;
         Exit;
      end else
      if (data.qryMoveLocNew.FieldByName('locname').AsString='') and (_paper<>'T') then
      begin
         KMessageDlg('Ŀ���λ����Ϊ��,��ѡ��!',mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
         exit;
      end else
      if data.qryMoveLocNew.FieldByName('quantity').AsString='0' then
      begin
         KMessageDlg('��������Ϊ��!',mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
         exit;
      end;

      locnameoldAll:='';
      locnamenewAll:='';
      strskuname:='';
      //lzw20100926
      quantitytotal:=0;
      piecetotal:=0;
      netweighttotal:=0;
      strsno:='';

      data.qryMoveLocNew.DisableControls;
      isQryEmtpy:=false;
      data.qryMoveLocNew.Filtered:=False;
      if data.qryMoveLocNew.IsEmpty then isQryEmtpy:=true;
      data.qryMoveLocNew.Filtered:=true;
      data.qryMoveLocOld.DisableControls;
      data.qryMoveLocOld.First;
      while not data.qryMoveLocOld.Eof do
      begin
         data.qrymovelocold.edit;
         if pos(data.qryMoveLocOld.fieldbyname('locname').AsString,locnameoldAll)=0 then
         begin
            locnameoldAll:=locnameoldAll+' '+data.qryMoveLocOld.fieldbyname('locname').AsString;
         end;
         if pos(data.qryMoveLocOld.fieldbyname('skuname').AsString,strskuname)=0 then
            strskuname:=strskuname+' '+data.qryMoveLocOld.fieldbyname('skuname').AsString;
         if data.qryMoveLocOld.fieldbyname('SNO').AsString<>'' then
            data.qryMoveLocNew.filter:='SNO='+data.qryMoveLocOld.fieldbyname('SNO').AsString
         else
            data.qryMoveLocNew.filter:='SNO=-1';
         quantitynewtotal:=0;
         piecenewtotal:=0;
         volumenewtotal:=0;
         netweightnewtotal:=0;
         grossnetweightnewtotal:=0;
         areanewtotal:=0;
         casing1newtotal:=0;
         casing2newtotal:=0;
         casing3newtotal:=0;
         casing4newtotal:=0;
         casing5newtotal:=0;
         data.qryMoveLocNew.First;
         while not data.qryMoveLocNew.Eof do
         begin
            //lzw20110829
            if pos(data.qryMoveLocNew.fieldbyname('locname').AsString,locnameNewAll)=0 then
            begin
               locnamenewAll:=locnamenewAll+' '+data.qryMoveLocNew.fieldbyname('locname').AsString;
            end;
            quantitynewtotal:=quantitynewtotal+data.qryMoveLocNew.FieldByName('quantity').AsFloat;
            piecenewtotal:=piecenewtotal+data.qryMoveLocNew.FieldByName('piece').AsFloat;
            volumenewtotal:=volumenewtotal+data.qryMoveLocNew.FieldByName('volume').AsFloat;
            netweightnewtotal:=netweightnewtotal+data.qryMoveLocNew.FieldByName('netweight').AsFloat;
            grossnetweightnewtotal:=grossnetweightnewtotal+data.qryMoveLocNew.FieldByName('grossweight').AsFloat;
            areanewtotal:=areanewtotal+data.qryMoveLocNew.FieldByName('area').AsFloat;
            casing1newtotal:=casing1newtotal+data.qryMoveLocNew.FieldByName('casing1').AsFloat;
            casing2newtotal:=casing2newtotal+data.qryMoveLocNew.FieldByName('casing2').AsFloat;
            casing3newtotal:=casing3newtotal+data.qryMoveLocNew.FieldByName('casing3').AsFloat;
            casing4newtotal:=casing4newtotal+data.qryMoveLocNew.FieldByName('casing4').AsFloat;
            casing5newtotal:=casing5newtotal+data.qryMoveLocNew.FieldByName('casing5').AsFloat;
            if data.qrymovlocskudetail.Active then
            begin
               grdMoveLocNewChangeNodeEx(nil);
               data.qrymovlocskudetail.First;
               while not data.qrymovlocskudetail.Eof do
               begin
                  data.qrymovlocskudetail.edit;
                  data.qrymovlocskudetail.FieldByName('locid').AsString:=data.qryMoveLocNew.fieldbyname('locid').AsString;
                  data.qrymovlocskudetail.FieldByName('locname').AsString:=data.qryMoveLocNew.fieldbyname('locname').AsString;
                  data.qrymovlocskudetail.FieldByName('costcusid').AsString:=data.qryMoveLocNew.fieldbyname('costcusid').AsString;
                  data.qrymovlocskudetail.FieldByName('costcusname').AsString:=data.qryMoveLocNew.fieldbyname('costcusname').AsString;
                  data.qrymovlocskudetail.FieldByName('userid').AsString:=data.qryMoveLocNew.fieldbyname('userid').AsString;
                  data.qrymovlocskudetail.FieldByName('username').AsString:=data.qryMoveLocNew.fieldbyname('username').AsString;
                  data.qrymovlocskudetail.FieldByName('shippercusid').AsString:=data.qryMoveLocNew.fieldbyname('shippercusid').AsString;
                  data.qrymovlocskudetail.FieldByName('shippercusname').AsString:=data.qryMoveLocNew.fieldbyname('shippercusname').AsString;
                  data.qrymovlocskudetail.FieldByName('cusid').AsString:=data.qryMoveLocNew.fieldbyname('cusid').AsString;
                  data.qrymovlocskudetail.FieldByName('cusname').AsString:=data.qryMoveLocNew.fieldbyname('cusname').AsString;
                  data.qrymovlocskudetail.FieldByName('iuserid').AsString:=data.qryMoveLocNew.fieldbyname('iuserid').AsString;
                  data.qrymovlocskudetail.FieldByName('iusername').AsString:=data.qryMoveLocNew.fieldbyname('iusername').AsString;
                  data.qrymovlocskudetail.FieldByName('operationdate').AsDateTime
                                                               :=data.qryMoveLocNew.fieldbyname('operationdate').AsDateTime;
                  data.qrymovlocskudetail.Next
               end;
            end;
            data.qryMoveLocNew.Next;
         end;
         //lzw20110829����piece�Ʋ�����
         if ((KRound(quantitynewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('quantity').AsFloat,4)) or
            ((KRound(piecenewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('piece').AsFloat,4)) and (_StrSysCus<>'JG')  and (_StrSysCus<>'XT')) or
            (KRound(volumenewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('volume').AsFloat,4)) or
            (KRound(netweightnewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('netweight').AsFloat,4)) or
            (KRound(grossnetweightnewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('grossweight').AsFloat,4)) or
            (KRound(areanewtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('area').AsFloat,4)) or
            (KRound(casing1newtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('casing1').AsFloat,4)) or
            (KRound(casing2newtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('casing2').AsFloat,4)) or
            (KRound(casing3newtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('casing3').AsFloat,4)) or
            (KRound(casing4newtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('casing4').AsFloat,4)) or
            (KRound(casing5newtotal,4)<>KRound(data.qryMoveLocOld.FieldByName('casing5').AsFloat,4))
            and(_StrSysCus<>'SZWY'))
            and(not data.qryMoveLocNew.IsEmpty) then
         begin
            if not isQryEmtpy then
            begin
//               KMessageDlg('����Ŀ�Ĳ�λ�ĺϼƲ�����Դ��λ�ļ�¼,�Ƿ�ϼƵ�Դ��λ?',mtWarning,[mbOK],0);
//               data.qryMoveLocNew.EnableControls;
//               data.qryMoveLocOld.EnableControls;
               if strsno='' then
                  strsno:=data.qryMoveLocOld.FieldByName('sno').AsString
               else
                  strsno:=strsno+'��'+data.qryMoveLocOld.FieldByName('sno').AsString;
//               Exit;
            end;
         end;
         //lzw20100926
//         quantitytotal:=quantitytotal+quantitynewtotal;
//         piecetotal:=piecetotal+piecenewtotal;
//         netweighttotal:=netweighttotal+netweightnewtotal;
         data.qryMoveLocOld.Next;
      end;
      if strsno<>'' then
      begin
         KMessageDlg('��ţ�'+strsno+'��Ŀ�Ĳ�λ������Դ��λ������һ��!',mtWarning,[mbOK],0) ;
         Exit;
      end;
      data.qryMoveLocNew.EnableControls;
      data.qryMoveLocOld.EnableControls;
      data.qryMoveLoc.Edit;
      data.qryMoveLoc.FieldByName('locnameold').AsString:=locnameoldAll;
      data.qryMoveLoc.FieldByName('locnamenew').AsString:=locnamenewAll;
      data.qryMoveLoc.FieldByName('skuname').AsString:=strskuname;
      data.qryMoveLoc.FieldByName('quantity').asfloat:=quantitytotal;
      data.qryMoveLoc.FieldByName('piece').asfloat:=piecetotal;
      //lzw20110212
      data.qryMoveLoc.FieldByName('netweight').asfloat:=netweighttotal;

      data.qryML.Edit;

      data.qryML.FieldByName('jobno').AsString         :=data.qryMoveLoc.FieldByName('jobno').AsString;
      data.qryML.FieldByName('taskdate').AsDateTime    :=data.qryMoveLoc.FieldByName('taskdate').AsDateTime;
      data.qryML.FieldByName('locationbillno').AsString:=data.qryMoveLoc.FieldByName('locationbillno').AsString;
      data.qryML.FieldByName('operationtype').AsString:=data.qryMoveLoc.FieldByName('operationtype').AsString;
      data.qryML.FieldByName('havemov').AsString:=data.qryMoveLoc.FieldByName('havemov').AsString;
      data.qryML.FieldByName('userid').AsString:=data.qryMoveLoc.FieldByName('userid').AsString;
      data.qryML.FieldByName('username').AsString:=data.qryMoveLoc.FieldByName('username').AsString;
      data.qryML.FieldByName('iuserid').AsString:=data.qryMoveLoc.FieldByName('iuserid').AsString;
      data.qryML.FieldByName('iusername').AsString:=data.qryMoveLoc.FieldByName('iusername').AsString;
      data.qryML.FieldByName('locnameold').AsString:=data.qryMoveLoc.FieldByName('locnameold').AsString;
      data.qryML.FieldByName('locnamenew').AsString:=data.qryMoveLoc.FieldByName('locnamenew').AsString;
      data.qryML.FieldByName('createname').AsString:=data.qryMoveLoc.FieldByName('createname').AsString;
      data.qryML.FieldByName('createdate').AsDateTime:=data.qryMoveLoc.FieldByName('createdate').AsDateTime;
      data.qryML.FieldByName('operationdate').AsDateTime:=data.qryMoveLoc.FieldByName('operationdate').AsDateTime;
      data.qryML.FieldByName('skuname').AsString:=data.qryMoveLoc.FieldByName('skuname').AsString;
      data.qryML.FieldByName('quantity').AsFloat:=data.qryMoveLoc.FieldByName('quantity').AsFloat;
      data.qryML.FieldByName('piece').AsFloat:=data.qryMoveLoc.FieldByName('piece').AsFloat;
      data.qryML.FieldByName('costcusname').AsString:=data.qryMoveLoc.FieldByName('costcusname').AsString;
      data.qryML.FieldByName('checkname').AsString:=data.qryMoveLoc.FieldByName('checkname').AsString;
      data.qryML.FieldByName('countname').AsString:=data.qryMoveLoc.FieldByName('countname').AsString;
      data.qryML.FieldByName('transfername').AsString:=data.qryMoveLoc.FieldByName('transfername').AsString;
      data.qryML.FieldByName('transferdate').AsDateTime:=data.qryMoveLoc.FieldByName('transferdate').AsDateTime;
   end;
   Result:=True;
end;

procedure TfrmMoveLoc.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmMoveLoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end;
end;

procedure TfrmMoveLoc.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
  SetGroupbox(KGroupBox3);
  setGroupbox(KGroupBox7);
  SetDxDbGrid(grdMoveLocOld);
  SetDxDbGrid(grdMoveLocNew);
  SetDxDbGrid(grdMoveloc);
  pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmMoveLoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
//    pgcMoveLoc.ActivePage := tbsLocInfo;
    if DataState in Setdcs then ActiveControl:=edtiUsername;
  end;
  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pgcMain.ActivePage=tbsEdit then
        begin
          pgcMain.ActivePage:=tbsBrowse;
        end else
        begin
          pgcMain.ActivePage:=tbsEdit;
        end;
      Ord('T'):KeyDownControl(Key,btnFirst);
      Ord('P'):KeyDownControl(Key,btnPrior);
      Ord('N'):KeyDownControl(Key,btnNext);
      Ord('B'):KeyDownControl(Key,btnLast);
      Ord('U'):KeyDownControl(Key,btnRefresh);

      Ord('E'):KeyDownControl(Key,btnEdit);
      Ord('A'):KeyDownControl(Key,btnAdd);
      Ord('D'):KeyDownControl(Key,btnDelete);
      Ord('C'):KeyDownControl(Key,btnCopy);

      Ord('F'):KeyDownControl(Key,btnFind);
      Ord('R'):KeyDownControl(Key,btnRefind);
      Ord('L'):KeyDownControl(Key,btnFilter);
//      Ord('O'):KeyDownControl(Key,btnPrint);

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

procedure TfrmMoveLoc.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  data.qryMoveLocOld.Close;
  data.qryMoveLocNew.Close;
  data.qryMoveLoc.Close;
  data.qryML.Close;
  sltselect.Destroy;  
  frmMoveLoc:=nil;  
end;

procedure TfrmMoveLoc.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmMoveLoc.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmMoveLoc.btnRefreshClick(Sender: TObject);
var
   strjobnoref: string;
begin
   strjobnoref:=data.qryML.FieldByName('jobno').AsString;
   data.qryML.DisableControls;
   data.qryML.Close;
   data.qryML.Open;
   if not data.qryML.Locate('Jobno',
                       VarArrayOf([strjobnoref]),
                       [loCaseInsensitive, loPartialKey]) then
   begin
     data.qryML.Last;
   end;
   data.qryML.EnableControls;
   grdMovelocChangeNodeEx(nil);
   SetDetailActive(False,False);
   SetDetailActive(True,True);
   WorkCall(stBrowse);
end;

procedure TfrmMoveLoc.btnEditClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   if data.qryMoveLoc.FieldByName('confirmed').AsString='T' then
   begin
      {if _Language='CAPTIONC' then _strmessage:='���Ʋ��Ѿ�����ȷ�ϲ����޸ģ�'
      else _strmessage:='**************';}
      KMessageDlg(GetMessage('frmMoveLoc','004'),mtWarning,[mbOK],0);
      ActiveControl:=dtdTaskDate;
      Exit;
   end;
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   WorkCall(stEdit);
end;

procedure TfrmMoveLoc.btnAddClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   Workcall(stInsert);
end;

procedure TfrmMoveLoc.btnDeleteClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage := tbsEdit;
   if data.qryMoveLoc.FieldByName('confirmed').AsString='T'  then
   begin
     { if _Language='CAPTIONC' then _strmessage:='���Ʋ��Ѿ�����ȷ�ϲ����޸ģ�'
      else _strmessage:='**************';  }
      KMessageDlg(GetMessage('frmMoveLoc','005'),mtWarning,[mbOK],0);
      //ActiveControl:=dtdTaskDate;
      Exit;
   end;
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      _ADOConnection.StartTransaction;
      try
         ExecSql(dataTmp.qryTmp, 'delete from moveloc where jobno="' +
                                       data.qryML.FieldByName('jobno').AsString + '" '
                                +'delete from movelocold where jobno="' +
                                       data.qryML.FieldByName('jobno').AsString + '" '
                                +'delete from movelocNew where jobno="' +
                                       data.qryML.FieldByName('jobno').AsString + '" '
                                +'delete from movlocskudetail where jobno="' +
                                       data.qryML.FieldByName('jobno').AsString + '" '
               );
         data.qryml.delete;
         data.qryML.ApplyUpdates;

         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then _ADOConnection.RollBack;
         raise;
         Exit;
      end;
      data.qryML.CommitUpdates ;
      WorkCall(stBrowse);
   end;
   SetDetailActive(False,False);
   SetDetailActive(True,True);
end;

procedure TfrmMoveLoc.btnFindClick(Sender: TObject);
var
   para: TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then pgcMain.ActivePage := tbsBrowse;
   pgcRelocationChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('moveloc moveloc ');

{0}   para.field.add('convert(datetime,convert(char(10),moveloc.createdate,102))');
{1}   para.field.add('moveloc.SKUCOSTCLASSCD');
{2}   para.field.add('moveloc.checkname');
{3}   para.field.add('convert(datetime,convert(char(10),moveloc.CheckDate,102))');

   Para.Exp.add('');

{0}   Para.Toptic.Add('��������');
{1}   Para.Toptic.add('��Ʒ�Ʒ���');
{2}   Para.Toptic.add('�� �� ��');
{3}   Para.Toptic.add('��������');

{0}   Para.Ftype.add('D');
{1}   para.Ftype.add('B');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('D');

   Para.RField.add('moveloc.jobno');

   if filterSql <> '' then
      Para.Filter := ' and ' + filterSql
   else Para.Filter := filterSql;

   Para.OnGetValue := FindGetValue;

   Dofind(data.qryML, dataTmp.qryFind, Para, TFindItem(nil));
end;

procedure TfrmMoveLoc.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryML, dataTmp.qryFind);
end;

procedure TfrmMoveLoc.btnFilterClick(Sender: TObject);
var
   strTmp:string;
   para:TFindPara;
begin
   if pgcMain.ActivePage <> tbsBrowse then
      pgcMain.ActivePage := tbsBrowse;
   pgcRelocationChange(self);
   Para := TfindPara.Create;

   para.Tables.Add('moveloc moveloc ');

{0}   para.field.add('convert(datetime,convert(char(10),moveloc.createdate,102))');
{1}   para.field.add('moveloc.SKUCOSTCLASSCD');
{2}   para.field.add('moveloc.checkname');
{3}   para.field.add('convert(datetime,convert(char(10),moveloc.CheckDate,102))');
{4}   para.field.add('moveloc.costcusid');
{5}   para.field.add('moveloc.iuserid');
{6}   para.field.add('convert(datetime,convert(char(10),moveloc.operationdate,102))');
{7}   para.field.add('moveloc.locationbillno');

   Para.Exp.add('');

{0}   Para.Toptic.Add('��������');
{1}   Para.Toptic.add('��Ʒ�Ʒ���');
{2}   Para.Toptic.add('�� �� ��');
{3}   Para.Toptic.add('�������');
{4}   Para.Toptic.add('���ù�ϵ��');
{5}   Para.Toptic.add('ִ�в���');
{6}   Para.Toptic.add('�Ʋ�����');
{7}   Para.Toptic.add('�Ʋֵ���');

{0}   Para.Ftype.add('D');
{1}   para.Ftype.add('B');
{2}   Para.Ftype.add('C');
{3}   Para.Ftype.add('D');
{4}   Para.Ftype.add('E');
{5}   Para.Ftype.add('E');
{6}   Para.Ftype.add('D');
{7}   Para.Ftype.add('C');

   Para.RField.add('moveloc.jobno');

   if filterSql<>'' then
      Para.Filter:=' and '+filterSql
   else Para.Filter:=filterSql;

   Para.OnGetValue:=FindGetValue;
   strTmp := DoFilter(Para, FindItem);
   if strTmp <> 'null' then
   begin
      data.qryML.Close;
      data.qryML.DisableControls;
      if strTmp<>'' then
         data.qryML.MacroByName('Where').AsString:=strTmp
      else
         data.qryML.MacroByName('Where').AsString:='1=1';
      data.qryML.Open;
      data.qryML.EnableControls;
   end;
   workcall(stbrowse);
end;

procedure TfrmMoveLoc.btnSaveClick(Sender: TObject);
var
   strCreateID,strJobno,strlocationbillno:string;
   blnSuc:Boolean;
begin
   blnSuc:=true;
   if (DataState in Setdcs) and Gather then  //������༭����
   begin
      try
         while True do
         begin
            try
//               data.qryml.DisableControls;
               _ADOConnection.Starttransaction;
               arrMoveLoc:=ScatterToArray(data.qryMoveLoc,true,0);
               data.qryMoveLoc.ApplyUpdates;
               Break;
            except
               _ADOConnection.Rollback; //�Ƚ�������
               if Error.HandleException(Exception(ExceptObject),data.udsMoveloc.InsertSql.text)=Re_KeyRepeat then
               begin
                  blnSuc:=False;
                  WorkSaveGet( data.qryMoveLoc.FieldByName('Jobno').AsString +GetMessage('frmMoveLoc','006'));//'������' '�Ѿ���ʹ�á��������ڲ����������ô���...';
                  Application.processmessages;
                  if not frmSave.stopflag then
                  begin
                     opensql(datatmp.qryTmp,
                             'select dhcx=max(convert(int,substring(docno1,7,8))) '
                            +'  from genjobno '
                            +' where substring(docno1,1,2)="ML"  '
                            +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
                     strlocationbillno:='ML'+copy(datetostr(GetServerDate),1,4)
                                       +pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
                     strCreateID:=genJobno('ML',strlocationbillno);
//wql_05/05/18 ���Ӳֵ���                     strCreateID := genJobno('ML');
                     if strCreateID = '' then
                     begin
                        KmessageDlg(GetMessage('frmMoveLoc','007'), mtInformation, [mbOk], 0);//'û�п��õĴ��������æ�����Ժ����Ի���ϵϵͳ����Ա.'
                        frmSave.stopflag := True;
                        Break;
                     end else
                     begin
                        data.qryMoveLoc.Edit;
                        data.qryMoveLoc.FieldByName('Jobno').AsString := strCreateID;
                        data.qryMoveLoc.FieldByName('locationbillno').AsString := strlocationbillno;
                        data.qryML.Edit;
                        data.qryML.FieldByName('Jobno').AsString := strCreateID;
                        data.qryML.FieldByName('locationbillno').AsString := strlocationbillno;
                     end;
                  end else Break;
               end else
               begin
                  raise;
                  //data.qryML.EnableControls;
                  exit;
               end;
            end;
         end;
         if frmSave <> nil then
         begin
            if frmSave.stopflag then
            begin
               frmSave.Free;
               Exit;
            end else
            begin
               with frmSave do
               begin
                  lblError.caption := '�ҵ����ô���' + strCreateID + '���ô����Ϊ' + strCreateID + '��';
                  btnCancel.visible := false;
                  btnOk.visible := true;
                  free;
               end;
            end;
         end;
         if not blnSuc then
         begin
            //data.qryMoveLocNew����
            data.qryMoveLocNew.DisableControls;
            data.qryMoveLocNew.Filtered:=False;
            with data.qryMoveLocNew do
            begin
               First;
               while not Eof do
               begin
                  Edit;
                  FieldByName('Jobno').AsString:=strCreateID;
                  FieldByName('locationbillno').AsString:=strlocationbillno;
                  next;
               end;
               First;
            end;
            data.qryMoveLocNew.Filtered:=True;
            data.qryMoveLocNew.EnableControls;
            //data.qryMoveLocOld����
            data.qryMoveLocOld.DisableControls;
            with data.qryMoveLocOld do
            begin
               First;
               while not Eof do
               begin
                  Edit;
                  FieldByName('Jobno').AsString:=strCreateID;
                  FieldByName('locationbillno').AsString:=strlocationbillno;
                  next;
               end;
               First;
            end;
            data.qryMoveLocOld.EnableControls;
         end;
         data.qryMoveLocOld.DisableControls;
         data.qryMoveLocNew.DisableControls;
         arrMoveLocOld:=ScatterToArray(data.qryMoveLocOld,False,0);
         data.qryMoveLocOld.applyupdates;
         data.qryMoveLocNew.Filtered:=False;
         arrMoveLocNew:=ScatterToArray(data.qryMoveLocNew,False,0);
         data.qryMoveLocNew.applyupdates;
         //��Ʒ��ϸ
         if data.qrymovlocskudetail.Active then
         begin
            data.qrymovlocskudetail.Filtered:=False;
            data.qrymovlocskudetail.ApplyUpdates;
         end;
         if strDel_New<>'' then
         begin
            strDel_New:=copy(strDel_New,4,length(strDel_New)- 3);
            strsql:=' delete from movlocskudetail '
                   +'  where jobno="'+data.qryml.fieldbyname('jobno').asstring+'"'
                   +'    and '+'('+strDel_New+')';
            execsql(datatmp.qryTmp,strsql);
            strDel_New:='';
         end;
         //�жϿ���Ƿ�����
         opensql(dataTmp.qryTmp,'exec ksp_movelocoldcheck "'
                    +data.qryML.FieldByName('Jobno').AsString+'"');
         if dataTmp.qryTmp.FieldByName('ermsg').AsString<>'' then
         begin
            try
              if _ADOConnection.InTransaction then _ADOConnection.rollback;
            except
            end;
            raise Exception.Create(dataTmp.qryTmp.FieldByName('ermsg').AsString);
         end;
         //��Ʒ��ϸ����ж�
         if data.qrymovlocskudetail.Active then
            kspCheck('ksp_movskudetailcheck @jobno="'+data.qryML.FieldByName('Jobno').AsString+'"');
         m_blnPost := True;
         data.qryML.ApplyUpdates;
         m_blnPost := False;
         _ADOConnection.Commit;
      except
         blnSavePost:=True;
         m_blnPost := True;
//         arrML:=ScatterToArray(data.qryML,true,0);

         strJobno     :=data.qryML.FieldByName('Jobno').AsString;

//         data.qryML.CancelUpdates;
//         data.qryMoveLoc.CancelUpdates;
//         data.qryMoveLocOld.CancelUpdates;
//         data.qryMoveLocNew.CancelUpdates;
         //qrymovlocskudetail.CancelUpdates;
         data.qryMoveLoc.Delete;

//         data.qryML.DisableControls;
//         GatherFromArray(data.qryML,arrML,false);
         GatherFromArray(data.qryMoveLoc,arrMoveLoc,false);
//         data.qryML.EnableControls;

         //data.qryMoveLocOld����
         data.qryMoveLocOld.First;
         while not data.qryMoveLocOld.Eof do
         begin
            data.qryMoveLocOld.Delete;
         end;

         GatherFromArray(data.qryMoveLocOld,arrMoveLocOld,true);
{
         data.qryMoveLocOld.First;
         while not data.qryMoveLocOld.Eof do
         begin
            data.qryMoveLocOld.Edit;
            data.qryMoveLocOld.FieldByName('Jobno').Asstring:=data.qryML.FieldByName('Jobno').AsString;
            data.qryMoveLocOld.next;
         end;
         data.qryMoveLocOld.First;
}
        //data.qryMoveLocNEW����
         data.qryMoveLocNEW.First;
         while not data.qryMoveLocNEW.Eof do
         begin
            data.qryMoveLocNEW.Delete;
         end;
         GatherFromArray(data.qryMoveLocNEW,arrMoveLocNew,true);
{
         data.qryMoveLocNEW.First;
         while not data.qryMoveLocNEW.Eof do
         begin
            data.qryMoveLocNEW.Edit;
            data.qryMoveLocNEW.FieldByName('Jobno').Asstring:=data.qryML.FieldByName('Jobno').AsString;
            data.qryMoveLocNEW.next;
         end;
         data.qryMoveLocNEW.First;
}
         data.qryMoveLocOld.post;
         data.qryMoveLocOld.EnableControls;
         data.qryMoveLocNew.Filtered:=True;
         data.qryMoveLocNew.EnableControls;
         blnSavePost:=False;
         m_blnPost := False;
         try
            if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         exit;
      end;
      data.qryML.CommitUpdates;
      data.qryMoveLoc.CommitUpdates;
      data.qryMoveLocOld.CommitUpdates;
      data.qryMoveLocnew.CommitUpdates;
      //lzw20120305
      execsql(datatmp.qrytmp,'    if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
                            +' where id=object_id("tempdb..#lsktotal") and sysstat & 0xf=3) '+chr(13)+chr(10)
                            +'  drop table #lsktotal '+chr(13)+chr(10)
                            +'select QUANTITY=sum(isnull(movelocnew.quantity,0)),'+chr(13)+chr(10)
                            +'       piece=sum(isnull(movelocnew.piece,0)),'+chr(13)+chr(10)
                            +'       netweight=sum(isnull(movelocnew.netweight,0)),'+chr(13)+chr(10)
                            +'       grossweight=sum(isnull(movelocnew.grossweight,0)),'+chr(13)+chr(10)
                            +'       volume=sum(isnull(movelocnew.volume,0)),'+chr(13)+chr(10)
                            +'       area=sum(isnull(movelocnew.area,0)),jobno '+chr(13)+chr(10)
                            +'  into #lsktotal         '+chr(13)+chr(10)
                            +'  from movelocnew(nolock)        '+chr(13)+chr(10)
                            +' where jobno="'+data.qryML.FieldByName('Jobno').AsString+'"    '+chr(13)+chr(10)
                            +' group by jobno      '+chr(13)+chr(10)
                            +'update moveloc set '
                            +'       QUANTITY=(isnull(#lsktotal.quantity,0)),'+chr(13)+chr(10)
                            +'       piece=(isnull(#lsktotal.piece,0)),'+chr(13)+chr(10)
                            +'       netweight=(isnull(#lsktotal.netweight,0)),'+chr(13)+chr(10)
                            +'       grossweight=(isnull(#lsktotal.grossweight,0)),'+chr(13)+chr(10)
                            +'       volume=(isnull(#lsktotal.volume,0)),'+chr(13)+chr(10)
                            +'       area=(isnull(#lsktotal.area,0)) '+chr(13)+chr(10)
                            +'  from #lsktotal    '+chr(13)+chr(10)
                            +' where moveloc.jobno=#lsktotal.jobno   '+chr(13)+chr(10)
                            +'   and moveloc.jobno="'+data.qryML.FieldByName('Jobno').AsString+'"    '+chr(13)+chr(10)
             );
      data.qryLocationinDetail.Filtered:=True;
      if data.qrymovlocskudetail.Active then
      begin
         data.qrymovlocskudetail.CommitUpdates;
         data.qrymovlocskudetail.Filtered:=true;
      end;
      data.qryMoveLocOld.EnableControls;
      data.qryMoveLocnew.EnableControls;
      //data.qryML.EnableControls;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
   end;
end;

procedure TfrmMoveLoc.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel, mtWarning, [mbYes, mbNo], 0) = mrNo then
      Exit;
   if DataState=stinsert then
      ExecSql(dataTmp.qryTmp, 'delete from genjobno where jobno="' +
         data.qryML.FieldByName('jobno').AsString + '" ');
   data.qryML.CancelUpdates;
   data.qryMoveLoc.CancelUpdates;
   data.qryMoveLocOld.CancelUpdates;
   data.qryMoveLocnew.CancelUpdates;
   if data.qrymovlocskudetail.Active then
   begin
      data.qrymovlocskudetail.CancelUpdates;
   end;
   WorkCall(stBrowse);
end;

procedure TfrmMoveLoc.btnPrintClick(Sender: TObject);
var
  KF1Book:TKF1book;
begin
   if pgcmain.ActivePage<>tbsedit then pgcmain.ActivePage:=tbsedit;
   try
      OpenSql(dataTmp.qryTmp,'select skuname=movelocold.skuname,oldlocname=movelocold.locname,oldquantity=movelocold.quantity,      '
                            +'       oldnetweight=movelocold.netweight,                                  '
                            +'       newlocname=movelocnew.locname,newquantity=sum(movelocnew.quantity), '
                            +'       newnetweight=sum(movelocnew.netweight)                              '
                            +'  from movelocold(nolock),movelocnew(nolock)                               '
                            +' where movelocold.jobno=movelocnew.jobno                                   '
                            +'   and movelocold.sno=movelocnew.sno                                       '
                            +'   and movelocold.jobno="'+data.qryMoveLocOld.fieldbyname('jobno').AsString+'"     '
                            +' group by movelocold.skuname,movelocold.locname,movelocold.quantity,movelocold.netweight,movelocnew.locname '
              );
      KF1Book:=TKF1book.Create;
      with KF1Book do
      begin
         Bbdm:='900135';
         paras.Values['costcusname']:=data.qryMoveLoc.fieldbyname('costcusname').AsString;
         paras.Values['date']:=DateToStr(data.qryMoveLoc.fieldbyname('taskdate').AsDateTime);
         qryMain:=dataTmp.qryTmp;
         CreateReport;
      end;
   finally
      KF1Book.Destroy;
   end;
end;

function TfrmMoveLoc.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result:=True;
   case pField of
      1:
       begin
          pItems.Clear;
          pItems.Assign(cmbskucostclasscd.Items);
          pItemFields.Clear;
          pItemFields.Assign(cmbskucostclasscd.ItemFields);
       end;
      2:
       begin
{          qrySelect:=pGetCustomerSelect('A','');
          if qrySelect.FieldByName('cusid').AsString<>'NO' then
          begin
             PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
             PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
          end;
          freeandnil(qrySelect);  }
       end;
      4:
       begin
          qrySelect:=pGetCustomerSelect('A','');
          if qrySelect.FieldByName('cusid').AsString<>'NO' then
          begin
             PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
             PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
          end;
          freeandnil(qrySelect);
       end;
      5:
       begin
         qrySelect:=pGetOrganizationSelect('','','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            PItems[0]      :=qrySelect.FieldByName('username').asstring;
            PItemFields[0] :=qrySelect.FieldByName('userid').asstring;
         end;
         freeandnil(qrySelect);
       end;
   else
      Result:=False;
   end;
end;

procedure TfrmMoveLoc.grdMoveLocOldChangeNodeEx(Sender: TObject);
begin
   data.qryMoveLocNew.Filtered:=false;
   if data.qryMoveLocOld.fieldbyname('SNO').AsString<>'' then
      data.qryMoveLocNew.filter:='SNO='+data.qryMoveLocOld.fieldbyname('SNO').AsString
   else
      data.qryMoveLocNew.filter:='SNO=-1';
   data.qryMoveLocNew.Filtered:=true;
end;

procedure TfrmMoveLoc.grdMoveLocOldEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryMoveLocOld.IsEmpty=True) then
   begin
      mitAddLocOldClick(Sender);
   end;
end;

procedure TfrmMoveLoc.mitAddLocOldClick(Sender: TObject);
begin
   grdMoveLocOld.SetFocus;
   data.qryMoveLocOld.Append;
   grdMoveLocOldbeforeInsert;
end;

procedure TfrmMoveLoc.mitDelLocOldClick(Sender: TObject);
begin
   if data.qryMoveLocOld.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdMoveLocOld.setfocus;
      data.qryMoveLocNew.DisableControls;
      data.qryMoveLocNew.First;
      while not data.qryMoveLocNew.Eof do
      begin
         data.qryMoveLocNew.Delete;
      end;
      data.qryMoveLocNew.EnableControls;
      if sltselect.IndexOf(data.qryMoveLocOld.fieldbyname('jobnoin').AsString+
                            data.qryMoveLocOld.fieldbyname('snoin').AsString+
                            data.qryMoveLocOld.fieldbyname('ldsnoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(data.qryMoveLocOld.fieldbyname('jobnoin').AsString+
                          data.qryMoveLocOld.fieldbyname('snoin').AsString+
                          data.qryMoveLocOld.fieldbyname('ldsnoin').AsString));

      data.qryMoveLocOld.delete;
   end;
end;

procedure TfrmMoveLoc.grdMoveLocOldExit(Sender: TObject);
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
{
   if TdxDBGrid(Sender)=grdMoveLocNew then
   begin
      if QuantityNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('quantity').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ�����ϼƲ�����Դ��λ�����������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','008'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if pieceNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('piece').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ�����ϼƲ�����Դ��λ�ļ��������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','009'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if areaNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('area').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ����ϼƲ�����Դ��λ����������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','010'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if VolumeNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('volume').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ����ϼƲ�����Դ��λ����������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','011'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if GrossWeightNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('GrossWeight').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λë�غϼƲ�����Դ��λ��ë�أ����鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','012'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if NetWeightNew.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('NetWeight').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ���غϼƲ�����Դ��λ�ľ��أ����鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','013'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if casing1New.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('casing1').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ���һ�ϼƲ�����Դ��λ�����һ���������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','014'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if casing2New.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('casing2').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ������ϼƲ�����Դ��λ����������������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','015'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if casing3New.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('casing3').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ������ϼƲ�����Դ��λ����������������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','016'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if casing4New.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('casing4').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ����ĺϼƲ�����Դ��λ����������������鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','017'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end else
      if casing5New.SummaryFooterValue<>data.qryMoveLocOld.FieldByName('casing5').AsFloat then
      begin
         if _Language='CAPTIONC' then _strmessage:='����Ŀ�Ĳ�λ�����ϼƲ�����Դ��λ������壬���鲢������ȷ��Ϣ��'
         else _strmessage:='**************';
         KMessageDlg(GetMessage('frmMoveLoc','018'),mtWarning,[mbOK],0);
         grdMoveLocNew.SetFocus;
      end;
   end;
}
end;

procedure TfrmMoveLoc.grdMoveLocNewEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryMoveLocNew.IsEmpty=True)
      and (not data.qryMoveLocOld.IsEmpty) then
   begin
      mitAddLocNewClick(Sender);
   end;
end;

procedure TfrmMoveLoc.mitAddLocNewClick(Sender: TObject);
begin
   if data.qryMoveLocOld.IsEmpty then
   begin
      if _Language='CAPTIONC' then _strmessage:='��������Դ��λ��Ϣ'
      else _strmessage:='********';
      KMessageDlg(GetMessage('frmMoveLoc','019'),mtWarning,[mbyes],0);
      exit;
   end;
   grdMoveLocnew.SetFocus;
   data.qryMoveLocNew.Append;
   grdMoveLocNewbeforeInsert;
end;

procedure TfrmMoveLoc.grdMoveLocOldKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
        if (Key = VK_DELETE) and (ssCtrl in Shift) then
        begin
          if uppercase(Name)='GRDMOVELOCOLD' then
             mitDelLocOldClick(sender)
          else if uppercase(Name)='GRDMOVELOCNEW' then
             mitDelLocNewClick(sender);
          key:=0;
        end;
      end;
    end;
  end;
end;

procedure TfrmMoveLoc.mitDelLocNewClick(Sender: TObject);
begin
   if data.qryMoveLocNew.FieldByName('ldsno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdmovelocnew.setfocus;
      strDel_New:=strDel_New+' or (SNO='+data.qryMoveLocNew.fieldbyname('SNO').Asstring
                                      +' and ldsno='+data.qryMoveLocNew.fieldbyname('ldSNO').Asstring+')';
      data.qryMoveLocNew.delete;
   end;
end;

procedure TfrmMoveLoc.LocNameOldButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i:Integer;
   mulSKUSelect:TMultLocationSKUSelect;
begin
   //lzw20110614
   if not data.qryMoveLocNew.IsEmpty then
   begin
      Kmessagedlg('�ñ��Ѿ������Ʋ���ϸ,����ɾ���Ʋ���ϸ',mtWarning,[mbyes], 0);
      exit;
   end;

   mulSKUSelect:=WorkLocationSKUSelect('',0,'��Ʒ��λ����','DETAIL',sltselect,
                                        false,'','','','','',''
                                        true,'','YC');
   for i:=0 to 500 do
   begin
      //lzw20120523
      if _strsyscus<>'XT' then
      begin
         if mulSKUSelect[i].locid='' then break;
      end;
      if mulSKUSelect[i].OkFlag then
      begin
         if i=0
         then data.qryMoveLocOld.edit
         else
         begin
            try
              data.qryMoveLocOld.Post;
            except
              break;
            end;
            data.qryMoveLocOld.append;
            data.qryMoveLocOld.fieldByname('jobno').AsString:=data.qryMoveLoc.fieldbyname('jobno').AsString;
            data.qryMoveLocOld.fieldByname('operationtype').AsInteger:=1;
         end;
         data.qryMoveLocOld.Fieldbyname('jobnoorder').asString       :=mulSKUSelect[i].jobnoorder;
         data.qryMoveLocOld.Fieldbyname('snoorder').asInteger        :=mulSKUSelect[i].snoorder;
         data.qryMoveLocOld.Fieldbyname('TagTotal').AsFloat          :=mulSKUSelect[i].TagTotal;
         data.qryMoveLocOld.fieldbyname('OperationDate').asDateTime  :=mulSKUSelect[i].OperationDate;
         data.qryMoveLocOld.fieldbyname('transferdate').asDateTime   :=mulSKUSelect[i].transferdate;
         data.qryMoveLocOld.fieldbyname('taskdate').asDateTime       :=mulSKUSelect[i].taskdate;
         data.qryMoveLocOld.fieldbyname('ManufactureDate').asDateTime:=mulSKUSelect[i].ManufactureDate;
         if data.qryMoveLocOld.fieldbyname('ManufactureDate').asDateTime=0 then  data.qryMoveLocOld.fieldbyname('ManufactureDate').Clear;

         data.qryMoveLocOld.Fieldbyname('UOM1').asstring                :=mulSKUSelect[i].UOM1;
         data.qryMoveLocOld.Fieldbyname('UOM2').asstring                :=mulSKUSelect[i].UOM2;
         data.qryMoveLocOld.Fieldbyname('UOM3').asstring                :=mulSKUSelect[i].UOM5;
         data.qryMoveLocOld.Fieldbyname('UOM4').asstring                :=mulSKUSelect[i].UOM4;
         data.qryMoveLocOld.Fieldbyname('UOM5').asstring                :=mulSKUSelect[i].UOM5;
         data.qryMoveLocOld.Fieldbyname('Casing1').asFloat              :=mulSKUSelect[i].syCasing1;
         data.qryMoveLocOld.Fieldbyname('Casing2').asFloat              :=mulSKUSelect[i].syCasing2;
         data.qryMoveLocOld.Fieldbyname('Casing3').asFloat              :=mulSKUSelect[i].syCasing3;
         data.qryMoveLocOld.Fieldbyname('Casing4').asFloat              :=mulSKUSelect[i].syCasing4;
         data.qryMoveLocOld.Fieldbyname('Casing5').asFloat              :=mulSKUSelect[i].syCasing5;
         data.qryMoveLocOld.fieldbyname('SKUID').asstring               :=mulSKUSelect[i].SKUID;
         data.qryMoveLocOld.fieldbyname('SKUName').asstring             :=mulSKUSelect[i].SKUname;
         data.qryMoveLocOld.Fieldbyname('LotCode').asstring             :=mulSKUSelect[i].LotCode;
         data.qryMoveLocOld.fieldbyname('Quantity').AsFloat             :=mulSKUSelect[i].syquantity;
         data.qryMoveLocOld.fieldbyname('Piece').AsFloat                :=mulSKUSelect[i].syPiece;
         data.qryMoveLocOld.fieldbyname('NetWeight').asFloat            :=mulSKUSelect[i].syNetWeight;
         data.qryMoveLocOld.Fieldbyname('GrossWeight').asFloat          :=mulSKUSelect[i].syGrossWeight;
         data.qryMoveLocOld.fieldbyname('Volume').asFloat               :=mulSKUSelect[i].syVolume;
         data.qryMoveLocOld.Fieldbyname('Area').asFloat                 :=mulSKUSelect[i].syArea;
         data.qryMoveLocOld.fieldbyname('quantityUOM').asstring         :=mulSKUSelect[i].QuantityUOM;
         data.qryMoveLocOld.fieldbyname('PieceUOM').asstring            :=mulSKUSelect[i].PieceUOM;
         data.qryMoveLocOld.fieldbyname('WeightUOM').asstring           :=mulSKUSelect[i].WeightUOM;
         data.qryMoveLocOld.fieldbyname('VolumeUOM').asstring           :=mulSKUSelect[i].VolumeUOM;
         data.qryMoveLocOld.Fieldbyname('AreaUOM').asstring             :=mulSKUSelect[i].AreaUOM;
         data.qryMoveLocOld.Fieldbyname('sizeuom').asstring             :=mulSKUSelect[i].sizeuom;
         data.qryMoveLocOld.fieldbyname('height').AsFloat               :=mulSKUSelect[i].height;
         data.qryMoveLocOld.fieldbyname('width').AsFloat                :=mulSKUSelect[i].width;
         data.qryMoveLocOld.fieldbyname('depth').AsFloat                :=mulSKUSelect[i].depth;
         data.qryMoveLocOld.fieldbyname('QualityName').asstring         :=mulSKUSelect[i].QualityName;
         data.qryMoveLocOld.fieldbyname('cusid').asstring               :=mulSKUSelect[i].cusid;
         data.qryMoveLocOld.fieldbyname('cusname').asstring             :=mulSKUSelect[i].cusname;
         data.qryMoveLocOld.Fieldbyname('Shippercusid').asstring        :=mulSKUSelect[i].Shippercusid;
         data.qryMoveLocOld.Fieldbyname('Shippercusname').asstring      :=mulSKUSelect[i].Shippercusname;
         data.qryMoveLocOld.fieldbyname('LotTracked').asstring          :=mulSKUSelect[i].LotTracked;
         data.qryMoveLocOld.fieldbyname('Currcd').asString              :=mulSKUSelect[i].Currcd;
         data.qryMoveLocOld.fieldbyname('price').asFloat                :=mulSKUSelect[i].price;
         data.qryMoveLocOld.fieldbyname('SKUCost').asFloat              :=mulSKUSelect[i].SKUCost;
         data.qryMoveLocOld.fieldbyname('pricein').asFloat              :=mulSKUSelect[i].pricein;
         data.qryMoveLocOld.fieldbyname('SKUCostin').asFloat            :=mulSKUSelect[i].SKUCostin;
         data.qryMoveLocOld.fieldbyname('TagEach').asstring             :=mulSKUSelect[i].TagEach;
         data.qryMoveLocOld.fieldbyname('TagEachUOM').asstring          :=mulSKUSelect[i].TagEachUOM;
         data.qryMoveLocOld.fieldbyname('TagTotal').asFloat             :=mulSKUSelect[i].TagTotal;
         data.qryMoveLocOld.fieldbyname('TagNO').asString               :=mulSKUSelect[i].TagNO;
         data.qryMoveLocOld.fieldbyname('locid').asString               :=mulSKUSelect[i].locid;
         data.qryMoveLocOld.fieldbyname('locname').asString             :=mulSKUSelect[i].locname;
         data.qryMoveLocOld.fieldbyname('SerialNO').asString            :=mulSKUSelect[i].SerialNO;
         data.qryMoveLocOld.fieldbyname('LDSNOIN').asInteger            :=mulSKUSelect[i].LDSNO;
         data.qryMoveLocOld.fieldbyname('JobnoIN').asstring             :=mulSKUSelect[i].Jobno;
         data.qryMoveLocOld.fieldbyname('SNOIN').asInteger              :=mulSKUSelect[i].SNO;
//      data.qryMoveLocOld.fieldbyname('ldSNOIN').asInteger            :=mulSKUSelect[i].ldSNO;
         data.qryMoveLocOld.fieldbyname('LDSNOINF').asInteger           :=mulSKUSelect[i].LDSNOINF;
         data.qryMoveLocOld.fieldbyname('JobnoINF').asstring            :=mulSKUSelect[i].JobnoINF;
         data.qryMoveLocOld.fieldbyname('SNOINF').asInteger             :=mulSKUSelect[i].SNOINF;
         data.qryMoveLocOld.fieldbyname('CONTWITHLOCA').asstring        :=mulSKUSelect[i].CONTWITHLOCA;
         data.qryMoveLocOld.fieldbyname('isbond').asstring              :=mulSKUSelect[i].isbond;
         data.qryMoveLocOld.fieldbyname('COUNTRENT').asstring           :=mulSKUSelect[i].COUNTRENT;
         data.qryMoveLocOld.fieldbyname('COUNTCONTCOST').asstring       :=mulSKUSelect[i].COUNTCONTCOST ;
         data.qryMoveLocOld.fieldbyname('WareRentCountType').asstring   :=mulSKUSelect[i].WareRentCountType;
         data.qryMoveLocOld.Fieldbyname('customsno').asString         :=mulSKUSelect[i].CustomsNO;
         data.qryMoveLocOld.fieldbyname('cusbillno').asstring         :=mulSKUSelect[i].cusbillno;
         data.qryMoveLocOld.fieldbyname('mainorder').asstring         :=mulSKUSelect[i].mainorder;
         data.qryMoveLocOld.fieldbyname('jobnoori').asstring            :=mulSKUSelect[i].jobnoori;
         data.qryMoveLocOld.fieldbyname('snoori').asInteger             :=mulSKUSelect[i].snoori;
         data.qryMoveLocOld.fieldbyname('locationbillno').asstring    :=mulSKUSelect[i].locationbillno;
         data.qryMoveLocOld.fieldbyname('costcusid').asstring           :=mulSKUSelect[i].costcusid  ;
         data.qryMoveLocOld.fieldbyname('costcusname').asstring         :=mulSKUSelect[i].costcusname  ;
         data.qryMoveLocOld.fieldbyname('NotFullSign').asstring         :=mulSKUSelect[i].NotFullSign  ;
         data.qryMoveLocOld.fieldbyname('loadgroupcusid').asstring      :=mulSKUSelect[i].loadgroupcusid;
         data.qryMoveLocOld.fieldbyname('loadgroupcusname').asstring    :=mulSKUSelect[i].loadgroupcusname;
         data.qryMoveLocOld.fieldbyname('forkgroupcusid').asstring      :=mulSKUSelect[i].forkgroupcusid;
         data.qryMoveLocOld.fieldbyname('forkgroupcusname').asstring    :=mulSKUSelect[i].forkgroupcusname;
         data.qryMoveLocOld.fieldbyname('liftmachinecusid').asstring    :=mulSKUSelect[i].liftmachinecusid;
         data.qryMoveLocOld.fieldbyname('liftmachinecusname').asstring  :=mulSKUSelect[i].liftmachinecusname;
         data.qryMoveLocOld.fieldbyname('costuomtype').asstring         :=mulSKUSelect[i].costuomtype;
         data.qryMoveLocOld.fieldbyname('jobnoorder').asstring          :=mulSKUSelect[i].jobnoorder;
         data.qryMoveLocOld.fieldbyname('snoorder').AsInteger           :=mulSKUSelect[i].snoorder;
         data.qryMoveLocOld.fieldbyname('snotask').AsInteger            :=mulSKUSelect[i].snotask;
         data.qryMoveLocOld.fieldbyname('jobnotag').asstring            :=mulSKUSelect[i].jobnotag;
         data.qryMoveLocOld.fieldbyname('costcusidout').asstring        :=mulSKUSelect[i].costcusidout;
         data.qryMoveLocOld.fieldbyname('costcusnameout').asstring      :=mulSKUSelect[i].costcusnameout;
         data.qryMoveLocOld.fieldbyname('countrentout').asstring        :=mulSKUSelect[i].countrentout;
         data.qryMoveLocOld.fieldbyname('warerentcounttypeout').asstring:=mulSKUSelect[i].warerentcounttypeout;
         data.qryMoveLocOld.fieldbyname('skucost').asFloat              :=mulSKUSelect[i].skucost;
         data.qryMoveLocOld.fieldbyname('skuspec').asstring             :=mulSKUSelect[i].skuspec;
         data.qryMoveLocOld.fieldbyname('skumodel').asstring            :=mulSKUSelect[i].skumodel;
         data.qryMoveLocOld.fieldbyname('piecepro').asFloat             :=mulSKUSelect[i].piecepro;
         data.qryMoveLocOld.FieldByName('corpno').AsString              :=mulSKUSelect[i].corpno;
         data.qryMoveLocOld.FieldByName('quantityshort').AsFloat        :=mulSKUSelect[i].quantityshort;
         data.qryMoveLocOld.FieldByName('remark').AsString              :=mulSKUSelect[i].remark;

         if sltselect.IndexOf(mulSKUSelect[i].JOBNO+inttostr(mulSKUSelect[i].sno)+inttostr(mulSKUSelect[i].LDSNO))=-1 then
         sltselect.Add(mulSKUSelect[i].JOBNO+
                       inttostr(mulSKUSelect[i].sno)+
                       iif(inttostr(mulSKUSelect[i].LDSNO)='0','',inttostr(mulSKUSelect[i].LDSNO)));
      end;
   end;
end;

procedure TfrmMoveLoc.pgcMainChange(Sender: TObject);
begin
   if pgcMain.ActivePage=tbsEdit then
   begin
      btnBrowMx.Visible:=False;
      btnBrowGl.Visible:=True;
      btnFirst.SkipGroup:=True;
      btnPrior.SkipGroup:=True;
      btnNext.SkipGroup:=True;
      btnLast.SkipGroup:=True;
      SetDetailActive(True,True);

   end else
   begin
      btnBrowGl.Visible:=False;
      btnBrowMx.Visible:=True;
      btnFirst.SkipGroup:=False;
      btnPrior.SkipGroup:=False;
      btnNext.SkipGroup:=False;
      btnLast.SkipGroup:=False;
   end;
end;

procedure TfrmMoveLoc.grdMovelocChangeNodeEx(Sender: TObject);
begin
  if (data.qryMoveLoc.ParamByName('Jobno').AsString<>data.qryML.FieldByName('Jobno').AsString)
    or (data.qryMoveLoc.ParamByName('Jobno').AsString='') then
  begin
    data.qryMoveLoc.ParamByName('Jobno').AsString:=data.qryML.FieldByName('Jobno').AsString;
    data.qryMoveLocOld.ParamByName('Jobno').AsString:=data.qryML.FieldByName('Jobno').AsString;
    data.qryMoveLocNew.ParamByName('Jobno').AsString:=data.qryML.FieldByName('Jobno').AsString;
    data.qrymovlocskudetail.ParamByName('jobno').AsString:=data.qryML.FieldByName('Jobno').AsString;
    if not m_blnPost then
    begin
      SetDetailActive(False,False);
      if (DataState = stInsert) then SetDetailActive(False,True)
      else if pgcMain.ActivePage=tbsEdit then SetDetailActive(True,True);
    end;
  end;
end;

procedure TfrmMoveLoc.LocNameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:Tkadoquery;
   k:integer;
begin
    qrySelect:=pGetLocationSelect('T','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
       data.qrymovelocnew.edit;
       data.qrymovelocnew.FieldByName('locid').AsString  :=qrySelect.FieldByName('locid').asstring;
       data.qrymovelocnew.FieldByName('locname').AsString  :=qrySelect.FieldByName('locname').asstring;
    end;
    //lzw20120505
    {if not data.qrymovlocskudetail.Active then
    begin
      data.qrymovlocskudetail.Open;
    end;
    k:=0;
      opensql(datatmp.qryTmp2,'select jobno,sno,ldsno,detailsno,color,skuspec,serialno,      '
                             +'       conno,unknowq,manufacturedate,sizeuom,quantityremain    '
                             +'  from locinskudetail(nolock)'
                             +' where jobno="'+data.qryMoveLocOld.fieldbyname('jobnoin').AsString+'" '
                             +'   and sno='+data.qryMoveLocOld.fieldbyname('snoin').AsString+' '
                             +'   and ldsno='+data.qryMoveLocOld.fieldbyname('ldsnoin').AsString+' '
                             +'   and quantityremain>0 '
              );

      //lzw20120505
      while not datatmp.qryTmp2.Eof do
      begin
         data.qrymovlocskudetail.Append;
         data.qrymovlocskudetail.FieldByName('jobno').AsString:=data.qryMoveLocNew.fieldByname('jobno').AsString;
         data.qrymovlocskudetail.FieldByName('sno').AsInteger:=data.qryMoveLocNew.fieldByname('sno').AsInteger;
         data.qrymovlocskudetail.FieldByName('ldsno').AsInteger:=data.qryMoveLocNew.fieldByname('ldsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('detailsno').AsInteger:=k+1;

         data.qrymovlocskudetail.FieldByName('jobnoin').AsString:=datatmp.qryTmp2.fieldByname('jobno').AsString;
         data.qrymovlocskudetail.FieldByName('snoin').AsInteger :=datatmp.qryTmp2.fieldByname('sno').AsInteger;
         data.qrymovlocskudetail.FieldByName('ldsnoin').AsInteger:=datatmp.qryTmp2.fieldByname('ldsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('detailsnoin').AsInteger:=datatmp.qryTmp2.fieldByname('detailsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('skuid').AsString:=data.qryMoveLocNew.fieldByname('skuid').AsString;
         data.qrymovlocskudetail.FieldByName('skuname').AsString:=data.qryMoveLocNew.fieldByname('skuname').AsString;
         data.qrymovlocskudetail.FieldByName('quantity').AsFloat:=datatmp.qryTmp2.fieldByname('quantityremain').AsFloat;
         data.qrymovlocskudetail.FieldByName('quantityuom').AsString:=data.qryMoveLocNew.fieldByname('quantityuom').AsString;
         data.qrymovlocskudetail.FieldByName('color').AsString:=datatmp.qryTmp2.fieldByname('color').AsString;
         data.qrymovlocskudetail.FieldByName('skuspec').AsString:=datatmp.qryTmp2.fieldByname('skuspec').AsString;
         data.qrymovlocskudetail.FieldByName('lotcode').AsString:=data.qryMoveLocNew.fieldByname('lotcode').AsString;
         data.qrymovlocskudetail.FieldByName('qualityname').AsString:=data.qryMoveLocNew.fieldByname('qualityname').AsString;
         data.qrymovlocskudetail.FieldByName('serialno').AsString:=datatmp.qryTmp2.fieldByname('serialno').AsString;
         data.qrymovlocskudetail.FieldByName('conno').AsString:=datatmp.qryTmp2.fieldByname('conno').AsString;
         data.qrymovlocskudetail.FieldByName('unknowq').AsString:=datatmp.qryTmp2.fieldByname('unknowq').AsString;
         data.qrymovlocskudetail.FieldByName('manufacturedate').AsDateTime:=datatmp.qryTmp2.fieldByname('manufacturedate').AsDateTime;
         data.qrymovlocskudetail.FieldByName('sizeuom').AsString:=datatmp.qryTmp2.fieldByname('sizeuom').AsString;
         data.qrymovlocskudetail.FieldByName('Height').AsFloat:=data.qryMoveLocNew.fieldByname('Height').AsFloat;
         data.qrymovlocskudetail.FieldByName('Width').AsFloat:=data.qryMoveLocNew.fieldByname('Width').AsFloat;
         data.qrymovlocskudetail.FieldByName('Depth').AsFloat:=data.qryMoveLocNew.fieldByname('Depth').AsFloat;
         data.qrymovlocskudetail.FieldByName('costcusid').AsString:=data.qryMoveLocNew.fieldByname('costcusid').AsString;
         data.qrymovlocskudetail.FieldByName('costcusname').AsString:=data.qryMoveLocNew.fieldByname('costcusname').AsString;
         data.qrymovlocskudetail.FieldByName('userid').AsString:=data.qryMoveLocNew.fieldByname('userid').AsString;
         data.qrymovlocskudetail.FieldByName('username').AsString:=data.qryMoveLocNew.fieldByname('username').AsString;
         data.qrymovlocskudetail.FieldByName('shippercusid').AsString:=data.qryMoveLocNew.fieldByname('shippercusid').AsString;
         data.qrymovlocskudetail.FieldByName('shippercusname').AsString:=data.qryMoveLocNew.fieldByname('shippercusname').AsString;
         data.qrymovlocskudetail.FieldByName('cusid').AsString:=data.qryMoveLocNew.fieldByname('cusid').AsString;
         data.qrymovlocskudetail.FieldByName('cusname').AsString:=data.qryMoveLocNew.fieldByname('cusname').AsString;
         data.qrymovlocskudetail.FieldByName('iuserid').AsString:=data.qryMoveLocNew.fieldByname('iuserid').AsString;
         data.qrymovlocskudetail.FieldByName('iusername').AsString:=data.qryMoveLocNew.fieldByname('iusername').AsString;
         data.qrymovlocskudetail.Post;
         datatmp.qryTmp2.next;
      end; }
    FreeAndNil(qrySelect);
end;

procedure TfrmMoveLoc.btnBrowGlClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsBrowse;
end;

procedure TfrmMoveLoc.btnBrowMxClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsedit;
end;

procedure TfrmMoveLoc.loadgroupcusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('I','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryMoveLocNew.edit;
         data.qryMoveLocNew.FieldByName('loadgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryMoveLocNew.FieldByName('loadgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmMoveLoc.forkgroupcusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('J','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryMoveLocNew.edit;
         data.qryMoveLocNew.FieldByName('forkgroupcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryMoveLocNew.FieldByName('forkgroupcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmMoveLoc.liftmachinecusnameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('K','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryMoveLocNew.edit;
         data.qryMoveLocNew.FieldByName('liftmachinecusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryMoveLocNew.FieldByName('liftmachinecusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmMoveLoc.QualityNameNewButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if DataState in setDcs then
  begin
      data.qryMoveLocNew.edit;
      data.qryMoveLocNew.FieldByName('QualityName').AsString
                    :=pGetqualitySelect(data.qryMoveLocNew.FieldByName('QualityName').AsString);
  end;
end;

procedure TfrmMoveLoc.QuantityNewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   QuantityOldValue:Extended;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdMoveLocNew.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='��������С����!';
         Accept:=False;
         exit;
      end;
      QuantityOldValue:=data.qrymovelocnew.FieldByName('Quantity').AsFloat;
      data.qrymovelocnew.Edit;
      data.qrymovelocnew.FieldByName('Quantity').AsFloat:=StrToFloat(grdMoveLocNew.InplaceEditor.GetEditingText);
      //����

     if (_StrSysCus='SZWY') and (data.qrymovelocnew.FieldByName('quantityshort').AsInteger<>0) then
        data.qrymovelocnew.FieldByName('casing5').AsFloat:=Trunc(data.qrymovelocnew.FieldByName('Quantity').AsFloat/data.qrymovelocnew.FieldByName('quantityshort').AsFloat);

      CountSKUQuantity(data.qrymovelocnew,QuantityOldValue);
   end;
end;

procedure Tfrmmoveloc.CountSKUQuantity(var pqrySKU:TKADOQuery;OldValue:extended);
{ ���ձ���������Ʒ�ĸ��ֵ�λ����
  pqrySKU:��Ҫ��������ݼ�
}
var
   quantityfield,piecefield,volumefield,netweightfield,grossweightfield,areafield,
   casing1field,casing2field,casing3field,casing4field,casing5field:string;
begin
   if _piececal then Exit;
   quantityfield:='quantity';
   piecefield:='piece';
   volumefield:='volume';
   netweightfield:='netweight';
   grossweightfield:='grossweight';
   areafield   :='area';
   casing1field:='casing1';
   casing2field:='casing2';
   casing3field:='casing3';
   casing4field:='casing4';
   casing5field:='casing5';
  with pqrySKU do
  begin
     //����
     if ((OldValue<>0)) then
     FieldByName(piecefield).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(piecefield).AsFloat
                                          /oldValue);
    //���
     if (OldValue<>0) then
     FieldByName(volumefield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(volumefield).AsFloat
                                          /oldValue;
    //���
     if (OldValue<>0) then
     FieldByName(areafield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(areafield).AsFloat
                                          /oldValue;
    //����
     if (OldValue<>0) then
     FieldByName(netweightfield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(netweightfield).AsFloat
                                          /oldValue;
    //ë��
     if (OldValue<>0)  then
     FieldByName(grossweightfield).AsFloat:=FieldByName(quantityfield).AsFloat
                                          *FieldByName(grossweightfield).AsFloat
                                          /oldValue;
    //���װһ
     if (OldValue<>0) then
     FieldByName(casing1field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing1field).AsFloat
                                          /oldValue);
    //���װ��
     if (OldValue<>0) then
     FieldByName(casing2field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing2field).AsFloat
                                          /oldValue);
    //���װ��
     if (OldValue<>0) then
     FieldByName(casing3field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing3field).AsFloat
                                          /oldValue);
   //���װ��
     if (OldValue<>0) then
     FieldByName(casing4field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing4field).AsFloat
                                          /oldValue);
   //���װ��
     if (OldValue<>0) then
     FieldByName(casing5field).AsFloat:=(FieldByName(quantityfield).AsFloat
                                          *FieldByName(casing5field).AsFloat
                                          /oldValue);
  end;
end;

procedure Tfrmmoveloc.CountSKUPiece(var pqrySKU:TKADOQuery;OldValue:extended);
{ ���ձ���������Ʒ�ĸ��ֵ�λ����
  pqrySKU:��Ҫ��������ݼ�
}
var
   quantityfield,piecefield,volumefield,netweightfield,grossweightfield,areafield,
   casing1field,casing2field,casing3field,casing4field,casing5field:string;
begin
   if not _piececal then Exit;
   quantityfield:='quantity';
   piecefield:='piece';
   volumefield:='volume';
   netweightfield:='netweight';
   grossweightfield:='grossweight';
   areafield   :='area';
   casing1field:='casing1';
   casing2field:='casing2';
   casing3field:='casing3';
   casing4field:='casing4';
   casing5field:='casing5';
  with pqrySKU do
  begin
     //������
     if ((OldValue<>0)) then
     FieldByName(quantityfield).AsFloat:=FieldByName(piecefield).AsFloat
                                         *FieldByName(quantityfield).AsFloat
                                         /oldValue;
    //���
     if (OldValue<>0) then
     FieldByName(volumefield).AsFloat:=FieldByName(piecefield).AsFloat
                                          *FieldByName(volumefield).AsFloat
                                          /oldValue;
    //���
     if (OldValue<>0) then
     FieldByName(areafield).AsFloat:=FieldByName(piecefield).AsFloat
                                          *FieldByName(areafield).AsFloat
                                          /oldValue;
    //����
     if (OldValue<>0) then
     FieldByName(netweightfield).AsFloat:=FieldByName(piecefield).AsFloat
                                          *FieldByName(netweightfield).AsFloat
                                          /oldValue;
    //ë��
     if (OldValue<>0)  then
     FieldByName(grossweightfield).AsFloat:=FieldByName(piecefield).AsFloat
                                          *FieldByName(grossweightfield).AsFloat
                                          /oldValue;
    //���װһ
     if (OldValue<>0) then
     FieldByName(casing1field).AsFloat:=(FieldByName(piecefield).AsFloat
                                          *FieldByName(casing1field).AsFloat
                                          /oldValue);
    //���װ��
     if (OldValue<>0) then
     FieldByName(casing2field).AsFloat:=(FieldByName(piecefield).AsFloat
                                          *FieldByName(casing2field).AsFloat
                                          /oldValue);
    //���װ��
     if (OldValue<>0) then
     FieldByName(casing3field).AsFloat:=(FieldByName(piecefield).AsFloat
                                          *FieldByName(casing3field).AsFloat
                                          /oldValue);
   //���װ��
     if (OldValue<>0) then
     FieldByName(casing4field).AsFloat:=(FieldByName(piecefield).AsFloat
                                          *FieldByName(casing4field).AsFloat
                                          /oldValue);
   //���װ��
     if (OldValue<>0) then
     FieldByName(casing5field).AsFloat:=(FieldByName(piecefield).AsFloat
                                          *FieldByName(casing5field).AsFloat
                                          /oldValue);
  end;
end;

procedure TfrmMoveLoc.QuantityOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   QuantityOldValue:Extended;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='��������С����!';
         Accept:=False;
         exit;
      end;
      QuantityOldValue:=data.qrymovelocold.FieldByName('Quantity').AsFloat;
      data.qrymovelocold.Edit;
      data.qrymovelocold.FieldByName('Quantity').AsFloat:=StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText);

      if _StrSysCus='SZWY' then
      begin
         if data.qrymovelocold.FieldByName('quantityshort').AsInteger<>0 then
            data.qrymovelocold.FieldByName('casing5').AsFloat:=Trunc(data.qrymovelocold.FieldByName('quantity').AsFloat/data.qrymovelocold.FieldByName('quantityshort').AsFloat)
         else
            data.qrymovelocold.FieldByName('casing5').AsFloat:=0;
      end;
      CountSKUQuantity(data.qrymovelocold,QuantityOldValue);
   end;
end;

procedure TfrmMoveLoc.btnPasteClick(Sender: TObject);
begin
   //lzw20101221
   opensql(datatmp.qryTmp,'select confirmed,CHECKNAME from moveloc(nolock) '
                         +' where jobno="'+data.qryML.fieldbyname('jobno').AsString+'"');
   if datatmp.qryTmp.FieldByName('confirmed').AsString='T' then
   begin
      KMessageDlg('���Ʋ��Ѿ����!',mtWarning,[mbOK],0);
      exit;
   end;
   if datatmp.qryTmp.FieldByName('CHECKNAME').AsString='' then
   begin
      KMessageDlg('���Ʋ�δ��ˣ�����ȷ��!',mtWarning,[mbOK],0);
      exit;
   end;
//whl 2007.08.10
   opensql(datatmp.qryTmp,'select num=count(1) from movelocold (nolock) '
                         +' where jobno="'+data.qryML.fieldbyname('jobno').AsString+'" '
                         +'   and not exists (select 1 from movelocnew (nolock)    '
                         +'                    where movelocnew.jobno=movelocold.jobno '
                         +'                      and movelocnew.sno=movelocold.sno ) '   
                         );
   if datatmp.qryTmp.FieldByName('num').asinteger>0 then
   begin
      KMessageDlg('����û���Ʋֺ��²�λ�ļ�¼�����ʵ���ٵ��ȷ�ϣ�',mtWarning,[mbOK],0);
      exit;
   end;

   _ADOConnection.Starttransaction;
   try
      //ִ��ȷ�϶������޸Ľ��־����λ����Ϣ
      opensql(dataTmp.qryTmp,'exec ksp_Movelocconfirm "'
                 +data.qryML.FieldByName('Jobno').AsString+'"');
      if dataTmp.qryTmp.FieldByName('ermsg').AsString<>'' then
      begin
         try
           if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise Exception.Create(dataTmp.qryTmp.FieldByName('ermsg').AsString);
      end;
      _ADOConnection.Commit
   except
      try
        if _ADOConnection.InTransaction then _ADOConnection.rollback;
      except
      end;
      KMessageDlg('ȷ��ʧ��:'+dataTmp.qryTmp.FieldByName('ermsg').AsString,mtWarning,[mbok],0);
      Exit;
   end;
   //lzw20120209
{ if _strsyscus='JG' then
   begin
      execsql(datatmp.qryTmp,'update locationoutitem set '
                            +'       snolocin=(select top 1 ldsno      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=locationoutitem.jobnoin   '
                            +'                    and locationindetail.sno=locationoutitem.snoin   ) , '
                            +'       locid=(select top 1 locid      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=locationoutitem.jobnoin   '
                            +'                    and locationindetail.sno=locationoutitem.snoin   ) , '
                            +'       locname=(select top 1 locname      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=locationoutitem.jobnoin   '
                            +'                    and locationindetail.sno=locationoutitem.snoin   ) '
                            +'  from movelocold(nolock)     '
                            +' where movelocold.jobno="'+data.qryML.FieldByName('Jobno').AsString+'"  '
                            +'   and movelocold.jobnoin=locationoutitem.jobnoin             '
                            +'   and movelocold.snoin=locationoutitem.snoin             '
                            +'update wareordersku set '
                            +'       snolocin=(select top 1 ldsno      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=wareordersku.jobnoin   '
                            +'                    and locationindetail.sno=wareordersku.snoin   ) , '
                            +'       locid=(select top 1 locid      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=wareordersku.jobnoin   '
                            +'                    and locationindetail.sno=wareordersku.snoin   ) , '
                            +'       locname=(select top 1 locname      '
                            +'                   from locationindetail(nolock)                        '
                            +'                  where locationindetail.jobno=wareordersku.jobnoin   '
                            +'                    and locationindetail.sno=wareordersku.snoin   ) '
                            +'  from movelocold(nolock) ,locationoutitem(nolock)      '
                            +' where movelocold.jobno="'+data.qryML.FieldByName('Jobno').AsString+'"  '
                            +'   and movelocold.jobnoin=wareordersku.jobnoin             '
                            +'   and movelocold.snoin=wareordersku.snoin             '
                            +'   and wareordersku.jobno=locationoutitem.jobnoorder  '
                            +'   and wareordersku.sno=locationoutitem.snoorder       '
                            +'   and isnull(locationoutitem.notfullsign,"")<>"T"     '
                             );
   end;     }
   if _Language='CAPTIONC' then _strmessage:='ȷ�ϳɹ�'
   else _strmessage:='**************';
   KMessageDlg(GetMessage('frmMoveLoc','021'),mtWarning,[mbOK],0);
end;

procedure TfrmMoveLoc.edtiUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
     qrySelect:=pGetOrganizationSelect('','','');
     if qrySelect.FieldByName('userid').AsString<>'NO' then
     begin
        data.qryMoveLoc.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
        data.qryMoveLoc.FieldByName('iusername').AsString:=qrySelect.FieldByName('username').asstring;
        blnSelect:=True;
        ReturnNext(Self);
     end;
     FreeAndNil(qrySelect);
  end;
end;

procedure TfrmMoveLoc.edtiUsernameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmMoveLoc.edtiUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtiUsername.Text='' then
      begin
         data.qryMoveLoc.Edit;
         data.qryMoveLoc.FieldByName('iuserid').AsString:='';
         data.qryMoveLoc.FieldByName('iusername').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetOrganizationSelect(edtiUsername.TextField,'','');
         if qrySelect.FieldByName('userid').AsString<>'NO' then
         begin
            data.qryMoveLoc.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
            data.qryMoveLoc.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmMoveLoc.grdMoveLocOldBeforeInsert;
begin
   data.qryMoveLocOld.Edit;
   data.qryMoveLocOld.fieldbyname('SNO').Asinteger:=-1;
   data.qryMoveLocOld.fieldbyname('OPERATIONTYPE').asInteger:=1;
   data.qryMoveLocOld.fieldByname('jobno').AsString:=data.qryMoveLoc.fieldbyname('jobno').AsString;
   data.qryMoveLocOld.fieldbyname('userid').asstring:=data.qryMoveLoc.fieldbyname('userid').asstring;
   data.qryMoveLocOld.fieldbyname('username').asstring:=data.qryMoveLoc.fieldbyname('username').asstring;
   data.qryMoveLocOld.fieldbyname('iuserid').asstring:=data.qryMoveLoc.fieldbyname('iuserid').asstring;
   data.qryMoveLocOld.fieldbyname('iusername').asstring:=data.qryMoveLoc.fieldbyname('iusername').asstring;
end;

procedure TfrmMoveLoc.grdMoveLocNewBeforeInsert;
begin
   data.qryMoveLocnew.Edit;
   data.qryMoveLocNew.fieldbyname('ldSNO').Asinteger:=-1;
   data.qryMoveLocNew.fieldbyname('SNO').Asinteger:=data.qryMoveLocOld.fieldbyname('SNO').Asinteger;
   data.qryMoveLocNew.fieldbyname('OPERATIONTYPE').asInteger:=1;
   data.qryMoveLocNew.fieldByname('jobno').AsString:=data.qryMoveLoc.fieldbyname('jobno').AsString;
   data.qryMoveLocNew.fieldbyname('userid').asstring:=data.qryMoveLoc.fieldbyname('userid').asstring;
   data.qryMoveLocNew.fieldbyname('username').asstring:=data.qryMoveLoc.fieldbyname('username').asstring;
   data.qryMoveLocNew.fieldbyname('iuserid').asstring:=data.qryMoveLoc.fieldbyname('iuserid').asstring;
   data.qryMoveLocNew.fieldbyname('iusername').asstring:=data.qryMoveLoc.fieldbyname('iusername').asstring;
   data.qryMoveLocNew.fieldByname('jobnoinf').AsString :=data.qryMoveLocOld.fieldbyname('jobnoinf').AsString;
   data.qryMoveLocNew.fieldByname('snoinf').AsInteger  :=data.qryMoveLocOld.fieldbyname('snoinf').AsInteger;
   data.qryMoveLocNew.fieldByname('ldsnoinf').AsInteger:=data.qryMoveLocOld.fieldbyname('ldsnoinf').AsInteger;
   data.qryMoveLocNew.fieldByname('jobnoin').AsString:=data.qryMoveLocOld.fieldbyname('jobnoin').AsString;
   data.qryMoveLocNew.fieldByname('snoin').AsString  :=data.qryMoveLocOld.fieldbyname('snoin').AsString;
   data.qryMoveLocNew.fieldByname('ldsnoin').AsString:=data.qryMoveLocOld.fieldbyname('ldsnoin').AsString;
   data.qryMoveLocNew.fieldByname('operationtype').AsInteger:=1;
   data.qryMoveLocNew.fieldByname('skuid').AsString  :=data.qryMoveLocOld.fieldbyname('skuid').AsString;
   data.qryMoveLocNew.fieldByname('skuname').AsString:=data.qryMoveLocOld.fieldbyname('skuname').AsString;
   data.qryMoveLocNew.fieldByname('lotcode').AsString:=data.qryMoveLocOld.fieldbyname('lotcode').AsString;
   data.qryMoveLocNew.fieldByname('qualityname').AsString:=data.qryMoveLocOld.fieldbyname('qualityname').AsString;
   data.qryMoveLocNew.fieldByname('userid').AsString:=data.qryMoveLocOld.fieldbyname('userid').AsString;
   data.qryMoveLocNew.fieldByname('username').AsString:=data.qryMoveLocOld.fieldbyname('username').AsString;
   data.qryMoveLocNew.fieldByname('QuantityUom').AsString:=data.qryMoveLocOld.fieldbyname('QuantityUom').AsString;
   data.qryMoveLocNew.fieldByname('pieceuom').AsString:=data.qryMoveLocOld.fieldbyname('pieceuom').AsString;
   data.qryMoveLocNew.fieldByname('weightuom').AsString:=data.qryMoveLocOld.fieldbyname('weightuom').AsString;
   data.qryMoveLocNew.fieldByname('volumeuom').AsString:=data.qryMoveLocOld.fieldbyname('volumeuom').AsString;
   data.qryMoveLocNew.fieldByname('areauom').AsString:=data.qryMoveLocOld.fieldbyname('areauom').AsString;
   data.qryMoveLocNew.fieldByname('cusid').AsString:=data.qryMoveLocOld.fieldbyname('cusid').AsString;
   data.qryMoveLocNew.fieldByname('cusname').AsString:=data.qryMoveLocOld.fieldbyname('cusname').AsString;
   data.qryMoveLocNew.fieldByname('shippercusid').AsString:=data.qryMoveLocOld.fieldbyname('shippercusid').AsString;
   data.qryMoveLocNew.fieldByname('shippercusname').AsString:=data.qryMoveLocOld.fieldbyname('shippercusname').AsString;
   data.qryMoveLocNew.fieldByname('lottracked').AsString:=data.qryMoveLocOld.fieldbyname('lottracked').AsString;
   data.qryMoveLocNew.fieldByname('price').AsString:=data.qryMoveLocOld.fieldbyname('price').AsString;
   data.qryMoveLocNew.fieldByname('currcd').AsString:=data.qryMoveLocOld.fieldbyname('currcd').AsString;
   data.qryMoveLocNew.fieldByname('tageach').AsString:=data.qryMoveLocOld.fieldbyname('tageach').AsString;
   data.qryMoveLocNew.fieldByname('tageachuom').AsString:=data.qryMoveLocOld.fieldbyname('tageachuom').AsString;
   data.qryMoveLocNew.fieldByname('transferdate').AsDateTime:=data.qryMoveLocOld.fieldbyname('transferdate').AsDateTime;
   data.qryMoveLocNew.fieldByname('taskdate').AsDateTime:=data.qryMoveLocOld.fieldbyname('taskdate').AsDateTime;
   data.qryMoveLocNew.fieldByname('costuomtype').AsString:=data.qryMoveLocOld.fieldbyname('costuomtype').AsString;
   data.qryMoveLocNew.fieldByname('contwithloca').AsString:=data.qryMoveLocOld.fieldbyname('contwithloca').AsString;
   data.qryMoveLocNew.fieldByname('isbond').AsString:=data.qryMoveLocOld.fieldbyname('isbond').AsString;
   data.qryMoveLocNew.fieldByname('countrent').AsString:=data.qryMoveLocOld.fieldbyname('countrent').AsString;
   data.qryMoveLocNew.fieldByname('warerentcounttype').AsString:=data.qryMoveLocOld.fieldbyname('warerentcounttype').AsString;
   data.qryMoveLocNew.fieldByname('jobnoorder').AsString:=data.qryMoveLocOld.fieldbyname('jobnoorder').AsString;
   data.qryMoveLocNew.fieldByname('snoorder').AsString:=data.qryMoveLocOld.fieldbyname('snoorder').AsString;
   data.qryMoveLocNew.fieldByname('iuserid').AsString:=data.qryMoveLocOld.fieldbyname('iuserid').AsString;
   data.qryMoveLocNew.fieldByname('iusername').AsString:=data.qryMoveLocOld.fieldbyname('iusername').AsString;
   data.qryMoveLocNew.fieldByname('locationbillno').AsString:=data.qryMoveLocOld.fieldbyname('locationbillno').AsString;
   data.qryMoveLocNew.fieldByname('customsno').AsString:=data.qryMoveLocOld.fieldbyname('customsno').AsString;
   data.qryMoveLocNew.fieldByname('sizeuom').AsString:=data.qryMoveLocOld.fieldbyname('sizeuom').AsString;
   data.qryMoveLocNew.fieldByname('costcusid').AsString:=data.qryMoveLocOld.fieldbyname('costcusid').AsString;
   data.qryMoveLocNew.fieldByname('costcusname').AsString:=data.qryMoveLocOld.fieldbyname('costcusname').AsString;
   data.qryMoveLocNew.fieldByname('uom1').AsString:=data.qryMoveLocOld.fieldbyname('uom1').AsString;
   data.qryMoveLocNew.fieldByname('uom2').AsString:=data.qryMoveLocOld.fieldbyname('uom2').AsString;
   data.qryMoveLocNew.fieldByname('uom3').AsString:=data.qryMoveLocOld.fieldbyname('uom3').AsString;
   data.qryMoveLocNew.fieldByname('uom4').AsString:=data.qryMoveLocOld.fieldbyname('uom4').AsString;
   data.qryMoveLocNew.fieldByname('uom5').AsString:=data.qryMoveLocOld.fieldbyname('uom5').AsString;
   data.qryMoveLocNew.fieldByname('manufacturedate').AsDateTime:=data.qryMoveLocOld.fieldbyname('manufacturedate').AsDateTime;
   data.qryMoveLocNew.fieldByname('jobnotag').AsString:=data.qryMoveLocOld.fieldbyname('jobnotag').AsString;
   data.qryMoveLocNew.fieldByname('notfullsign').AsString:=data.qryMoveLocOld.fieldbyname('notfullsign').AsString;
   data.qryMoveLocNew.fieldByname('costcusidout').AsString:=data.qryMoveLocOld.fieldbyname('costcusidout').AsString;
   data.qryMoveLocNew.fieldByname('costcusnameout').AsString:=data.qryMoveLocOld.fieldbyname('costcusnameout').AsString;
   data.qryMoveLocNew.fieldByname('countrentout').AsString:=data.qryMoveLocOld.fieldbyname('countrentout').AsString;
   data.qryMoveLocNew.fieldByname('warerentcounttypeout').AsString:=data.qryMoveLocOld.fieldbyname('warerentcounttypeout').AsString;
   data.qryMoveLocNew.fieldByname('pricein').AsFloat:=data.qryMoveLocOld.fieldbyname('pricein').AsFloat;
   data.qryMoveLocNew.fieldByname('jobnoori').AsString:=data.qryMoveLocOld.fieldbyname('jobnoori').AsString;
   data.qryMoveLocNew.fieldByname('snoori').AsInteger:=data.qryMoveLocOld.fieldbyname('snoori').AsInteger;
   data.qryMoveLocNew.fieldByname('cusbillno').AsString:=data.qryMoveLocOld.fieldbyname('cusbillno').AsString;
   data.qryMoveLocNew.fieldByname('mainorder').AsString:=data.qryMoveLocOld.fieldbyname('mainorder').AsString;
//wql_05/5/18   data.qryMoveLocNew.fieldByname('locationbillnoin').AsString:=data.qryMoveLocOld.fieldbyname('locationbillnoin').AsString;
//wql_05/5/18   data.qryMoveLocNew.fieldByname('customsnoin').AsString:=data.qryMoveLocOld.fieldbyname('customsnoin').AsString;
//wql_05/5/18   data.qryMoveLocNew.fieldByname('cusbillnoin').AsString:=data.qryMoveLocOld.fieldbyname('cusbillnoin').AsString;
//wql_05/5/18   data.qryMoveLocNew.fieldByname('mainorderin').AsString:=data.qryMoveLocOld.fieldbyname('mainorderin').AsString;
   data.qryMoveLocNew.fieldByname('quantity').AsFloat:=data.qryMoveLocOld.fieldbyname('quantity').AsFloat-quantitynew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('piece').AsFloat:=data.qryMoveLocOld.fieldbyname('piece').AsFloat-piecenew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('netweight').AsFloat:=data.qryMoveLocOld.fieldbyname('netweight').AsFloat-netweightnew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('grossweight').AsFloat:=data.qryMoveLocOld.fieldbyname('grossweight').AsFloat-grossweightnew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('area').AsFloat:=data.qryMoveLocOld.fieldbyname('area').AsFloat-areanew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('volume').AsFloat:=data.qryMoveLocOld.fieldbyname('volume').AsFloat-volumenew.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('skucost').AsFloat:=data.qryMoveLocOld.fieldbyname('skucost').AsFloat;
   data.qryMoveLocNew.fieldByname('tagtotal').AsFloat:=data.qryMoveLocOld.fieldbyname('tagtotal').AsFloat;
   //lzw20110127
   if _StrSysCus='DHA' then
      data.qryMoveLocNew.fieldByname('operationdate').AsDateTime:=dtdTaskDate.Date
   else
      data.qryMoveLocNew.fieldByname('operationdate').AsDateTime:=getserverdate;
   data.qryMoveLocNew.fieldByname('height').AsFloat:=data.qryMoveLocOld.fieldbyname('height').AsFloat;
   data.qryMoveLocNew.fieldByname('width').AsFloat:=data.qryMoveLocOld.fieldbyname('width').AsFloat;
   data.qryMoveLocNew.fieldByname('depth').AsFloat:=data.qryMoveLocOld.fieldbyname('depth').AsFloat;
   data.qryMoveLocNew.fieldByname('casing1').AsFloat:=data.qryMoveLocOld.fieldbyname('casing1').AsFloat-casing1new.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('casing2').AsFloat:=data.qryMoveLocOld.fieldbyname('casing2').AsFloat-casing2new.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('casing3').AsFloat:=data.qryMoveLocOld.fieldbyname('casing3').AsFloat-casing3new.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('casing4').AsFloat:=data.qryMoveLocOld.fieldbyname('casing4').AsFloat-casing4new.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('casing5').AsFloat:=data.qryMoveLocOld.fieldbyname('casing5').AsFloat-casing5new.SummaryFooterValue;
   data.qryMoveLocNew.fieldByname('loadgroupcusid').AsString:=data.qryMoveLocOld.fieldbyname('loadgroupcusid').AsString;
   data.qryMoveLocNew.fieldByname('loadgroupcusname').AsString:=data.qryMoveLocOld.fieldbyname('loadgroupcusname').AsString;
   data.qryMoveLocNew.fieldByname('forkgroupcusid').AsString:=data.qryMoveLocOld.fieldbyname('forkgroupcusid').AsString;
   data.qryMoveLocNew.fieldByname('forkgroupcusname').AsString:=data.qryMoveLocOld.fieldbyname('forkgroupcusname').AsString;
   data.qryMoveLocNew.fieldByname('liftmachinecusid').AsString:=data.qryMoveLocOld.fieldbyname('liftmachinecusid').AsString;
   data.qryMoveLocNew.fieldByname('liftmachinecusname').AsString:=data.qryMoveLocOld.fieldbyname('liftmachinecusname').AsString;
   data.qryMoveLocNew.fieldByname('serialno').AsString:=data.qryMoveLocOld.fieldbyname('serialno').AsString;
   data.qryMoveLocNew.fieldByname('skucostin').AsFloat:=data.qryMoveLocOld.fieldbyname('skucostin').AsFloat;
   data.qryMoveLocNew.FieldByName('TagNO').AsString:=data.qryMoveLocOld.fieldbyname('TagNO').AsString;
   data.qryMoveLocNew.fieldByname('skuspec').AsString:=data.qryMoveLocOld.fieldbyname('skuspec').AsString;
   data.qryMoveLocNew.fieldByname('piecepro').AsFloat:=data.qryMoveLocOld.fieldbyname('piecepro').AsFloat;
   data.qryMoveLocNew.FieldByName('skumodel').AsString:=data.qryMoveLocOld.fieldbyname('skumodel').AsString;
   data.qryMoveLocNew.FieldByName('corpno').AsString:=data.qryMoveLocOld.fieldbyname('corpno').AsString;
   data.qryMoveLocNew.FieldByName('quantityshort').AsFloat:=data.qryMoveLocOld.fieldbyname('quantityshort').AsFloat;
end;

procedure TfrmMoveLoc.grdMoveLocOldEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   if not (DataState in Setdcs) then
      Allow:=False
   else if (DataState in Setdcs) then
   begin
      with grdMoveLocOld do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='NOTFULLSIGN') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOTCODE') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUALITYNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITYUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECEUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUMEUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='AREAUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='WEIGHTUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOADGROUPCUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='FORKGROUPCUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LIFTMACHINECUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='TAGEACHUOM') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM1') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM2') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM3') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM4') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM5') then
         begin
           Allow:=False
         end else
           Allow:=True;
        //���ᱦ�Ʋ����������λ�Լ���Ϊ׼��������������;��������Ϊ׼������������� cyh
         if _paper='T' then
         begin
            if (_piececal) then
            begin
              if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY') then
              begin
                 Allow:=False
              end else
                 Allow:=True;
            end else
            begin
              if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECE') then
              begin
                 Allow:=False
              end else
                 Allow:=True;
            end;
         end;
      end;
   end;
end;

procedure TfrmMoveLoc.grdMoveLocNewEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
   if not (DataState in Setdcs) then
      Allow:=False
   else if (DataState in Setdcs) then
   begin
      if (data.qryMoveLocNew.IsEmpty=true)then
      begin
         allow:=false;
      end else
      with grdMoveLocNew do
      begin
        if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='NOTFULLSIGN') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CUSNAME') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCUSNAME') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SHIPPERCUSNAME') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SKUNAME') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LOTCODE') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUALITYNAME') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITYUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECEUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOLUMEUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='AREAUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='WEIGHTUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='TAGEACHUOM') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM1') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM2') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM3') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM4') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='UOM5') then
        begin
          Allow:=False
        end else
          Allow:=True;

        //���ᱦ�Ʋ����������λ�Լ���Ϊ׼��������������;��������Ϊ׼������������� cyh
         if _paper='T' then
         begin
            if (_piececal) then
            begin
              if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QUANTITY') then
              begin
                 Allow:=False
              end else
                 Allow:=True;
            end else
            begin
              if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='PIECE') then
              begin
                 Allow:=False
              end else
                 Allow:=True;
            end;
         end;
      end;
   end;
end;

procedure TfrmMoveLoc.edtcostcusidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if AbsoluteIndex=0 then
      begin
         qrySelect:=pGetCustomerSelect('A','');
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryMoveLoc.FieldByName('costCusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryMoveLoc.FieldByName('costCusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
            blnSelect:=True;
            ReturnNext(Self);
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmMoveLoc.edtcostcusidExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmMoveLoc.edtcostcusidExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
Var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcostcusid.Text='' then
      begin
         data.qryMoveLoc.Edit;
         data.qryMoveLoc.FieldByName('costcusid').AsString  :='';
         data.qryMoveLoc.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtcostcusid.Text);
         if qrySelect.FieldByName('Cusid').AsString<>'NO' then
         begin
            data.qryMoveLoc.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryMoveLoc.FieldByName('costcusname').AsString:=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmMoveLoc.grdMovelocDblClick(Sender: TObject);
begin
   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmMoveLoc.mitlocskudetailClick(Sender: TObject);
begin
   if data.qryMoveLocNew.FieldByName('locid').AsString='' then
   begin
      KMessageDlg('��λ����Ϊ��!',mtWarning,[mbOK],0);
      exit;
   end;
   if data.qrymovlocskudetail.Active<>True then
   begin
      data.qrymovlocskudetail.ParamByName('jobno').AsString:=data.qryMoveLoc.fieldByName('jobno').AsString;
      data.qrymovlocskudetail.Open;
   end;
   if DataState=stedit then
   begin
      //qrylocoutskudetail
      _maxgridnomov:=0;
      data.qrymovlocskudetail.First;
      while not data.qrymovlocskudetail.Eof do
      begin
        if data.qrymovlocskudetail.FieldByName('detailsno').AsInteger>_maxgridnomov
        then _maxgridnomov:=data.qrymovlocskudetail.FieldByName('detailsno').AsInteger;
        data.qrymovlocskudetail.Next;
      end;
   end;

   grdMoveLocNewChangeNodeEx(nil);
   WorkLocOutSKUDetail(DataState ,data.qryMoveLoc.FieldByName('jobno').AsString,
                      '',
                      data.qryMoveLocNew.FieldByName('SNO').AsInteger,
                      data.qryMoveLocNew.FieldByName('ldsno').AsInteger,
                      _maxgridnomov,
                      data.qrymovlocskudetail,data.qryMoveLocNew);
end;

procedure TfrmMoveLoc.grdMoveLocNewChangeNodeEx(Sender: TObject);
begin
   data.qrymovlocskudetail.Filtered:=false;
   if data.qryMoveLocNew.fieldbyname('ldsno').AsString<>'' then
      data.qrymovlocskudetail.filter:='ldsno='+data.qryMoveLocNew.fieldbyname('ldsno').AsString
   else
      data.qrymovlocskudetail.filter:='ldsno=-1';
   data.qrymovlocskudetail.Filtered:=true;
end;

procedure TfrmMoveLoc.LocNameNewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if data.qryMoveLocNew.FieldByName('locid').AsString<>'' then
      data.qrymovlocskudetail.Active:=True;
end;

procedure TfrmMoveLoc.btnOperClick(Sender: TObject);
var
  GetLocation:TGetLocation;
  strTraySkuClassid,strDetailLocationID,strDetailLocationName:string;
  i:integer;
begin
   data.qryMoveLocOld.DisableControls;
   data.qryMoveLocOld.First;
   while not data.qryMoveLocOld.Eof do
   begin
     if pos('"'+data.qryMoveLocOld.fieldbyname('skuid').AsString+'"',strTraySkuClassid)=0 then
        strTraySkuClassid:=strTraySkuClassid+'"'+data.qryMoveLocOld.fieldbyname('skuid').AsString+'",';
     data.qryMoveLocOld.Next;
   end;
   data.qryMoveLocOld.EnableControls;

   if Copy(strTraySkuClassid,Length(strTraySkuClassid),1)=',' then
   strTraySkuClassid:=Copy(strTraySkuClassid,0,Length(strTraySkuClassid)-1);

   GetLocation:=workGetLocation('',strTraySkuClassid);
   strDetailLocationID:=GetLocation.LocationID;
   strDetailLocationName:=GetLocation.LocationName;
   if  data.qryMoveLocNew.RecordCount<>0 then
   begin
     if KmessageDlg(GetMessage('frmmoveloc','022'),mtConfirmation,[mbYes,mbNo],0)=mrYes then//'�ò�����ɾ��Ŀ���λ��Ϣ���ݣ���ȷ��Ҫɾ����?'
     begin
       data.qryMoveLocNew.DisableControls;
       data.qryMoveLocNew.Filtered:=False;
       data.qryMoveLocNew.First;
       while not data.qryMoveLocNew.Eof do
       begin
         data.qryMoveLocNew.Delete;
       end;
       data.qryMoveLocNew.Filtered:=True;
       data.qryMoveLocNew.EnableControls;
//       maxValueAddNewDetail:=0;
     end;
   end;
   if not data.qrymovlocskudetail.Active then
   begin
      data.qrymovlocskudetail.Open;
   end;
   i:=0;
   data.qryMoveLocOld.First;
   while not data.qryMoveLocOld.Eof do
   begin
      data.qryMoveLocNew.Append;
      data.qryMoveLocNew.fieldbyname('ldSNO').Asinteger            :=-1;
      data.qryMoveLocNew.fieldbyname('SNO').Asinteger              :=data.qryMoveLocOld.fieldbyname('SNO').Asinteger;
      data.qryMoveLocNew.fieldByname('jobno').AsString             :=data.qryMoveLoc.fieldbyname('jobno').AsString;
      data.qryMoveLocNew.fieldbyname('userid').asstring            :=data.qryMoveLoc.fieldbyname('userid').asstring;
      data.qryMoveLocNew.fieldbyname('username').asstring          :=data.qryMoveLoc.fieldbyname('username').asstring;
      data.qryMoveLocNew.fieldbyname('iuserid').asstring           :=data.qryMoveLoc.fieldbyname('iuserid').asstring;
      data.qryMoveLocNew.fieldbyname('iusername').asstring         :=data.qryMoveLoc.fieldbyname('iusername').asstring;
      data.qryMoveLocNew.fieldByname('jobnoinf').AsString          :=data.qryMoveLocOld.fieldbyname('jobnoinf').AsString;
      data.qryMoveLocNew.fieldByname('snoinf').AsInteger           :=data.qryMoveLocOld.fieldbyname('snoinf').AsInteger;
      data.qryMoveLocNew.fieldByname('ldsnoinf').AsInteger         :=data.qryMoveLocOld.fieldbyname('ldsnoinf').AsInteger;
      data.qryMoveLocNew.fieldByname('jobnoin').AsString           :=data.qryMoveLocOld.fieldbyname('jobnoin').AsString;
      data.qryMoveLocNew.fieldByname('snoin').AsString             :=data.qryMoveLocOld.fieldbyname('snoin').AsString;
      data.qryMoveLocNew.fieldByname('ldsnoin').AsString           :=data.qryMoveLocOld.fieldbyname('ldsnoin').AsString;
      data.qryMoveLocNew.fieldByname('operationtype').AsInteger    :=1;
      data.qryMoveLocNew.fieldByname('skuid').AsString             :=data.qryMoveLocOld.fieldbyname('skuid').AsString;
      data.qryMoveLocNew.fieldByname('skuname').AsString           :=data.qryMoveLocOld.fieldbyname('skuname').AsString;
      data.qryMoveLocNew.fieldByname('lotcode').AsString           :=data.qryMoveLocOld.fieldbyname('lotcode').AsString;
      data.qryMoveLocNew.fieldByname('qualityname').AsString       :=data.qryMoveLocOld.fieldbyname('qualityname').AsString;
      data.qryMoveLocNew.fieldByname('userid').AsString            :=data.qryMoveLocOld.fieldbyname('userid').AsString;
      data.qryMoveLocNew.fieldByname('username').AsString          :=data.qryMoveLocOld.fieldbyname('username').AsString;
      data.qryMoveLocNew.fieldByname('QuantityUom').AsString       :=data.qryMoveLocOld.fieldbyname('QuantityUom').AsString;
      data.qryMoveLocNew.fieldByname('pieceuom').AsString          :=data.qryMoveLocOld.fieldbyname('pieceuom').AsString;
      data.qryMoveLocNew.fieldByname('weightuom').AsString         :=data.qryMoveLocOld.fieldbyname('weightuom').AsString;
      data.qryMoveLocNew.fieldByname('volumeuom').AsString         :=data.qryMoveLocOld.fieldbyname('volumeuom').AsString;
      data.qryMoveLocNew.fieldByname('areauom').AsString           :=data.qryMoveLocOld.fieldbyname('areauom').AsString;
      data.qryMoveLocNew.fieldByname('cusid').AsString             :=data.qryMoveLocOld.fieldbyname('cusid').AsString;
      data.qryMoveLocNew.fieldByname('cusname').AsString           :=data.qryMoveLocOld.fieldbyname('cusname').AsString;
      data.qryMoveLocNew.fieldByname('shippercusid').AsString      :=data.qryMoveLocOld.fieldbyname('shippercusid').AsString;
      data.qryMoveLocNew.fieldByname('shippercusname').AsString    :=data.qryMoveLocOld.fieldbyname('shippercusname').AsString;
      data.qryMoveLocNew.fieldByname('lottracked').AsString        :=data.qryMoveLocOld.fieldbyname('lottracked').AsString;
      data.qryMoveLocNew.fieldByname('price').AsString             :=data.qryMoveLocOld.fieldbyname('price').AsString;
      data.qryMoveLocNew.fieldByname('currcd').AsString            :=data.qryMoveLocOld.fieldbyname('currcd').AsString;
      data.qryMoveLocNew.fieldByname('tageach').AsString           :=data.qryMoveLocOld.fieldbyname('tageach').AsString;
      data.qryMoveLocNew.fieldByname('tageachuom').AsString        :=data.qryMoveLocOld.fieldbyname('tageachuom').AsString;
      data.qryMoveLocNew.fieldByname('transferdate').AsDateTime    :=data.qryMoveLocOld.fieldbyname('transferdate').AsDateTime;
      data.qryMoveLocNew.fieldByname('taskdate').AsDateTime        :=data.qryMoveLocOld.fieldbyname('taskdate').AsDateTime;
      data.qryMoveLocNew.fieldByname('costuomtype').AsString       :=data.qryMoveLocOld.fieldbyname('costuomtype').AsString;
      data.qryMoveLocNew.fieldByname('contwithloca').AsString      :=data.qryMoveLocOld.fieldbyname('contwithloca').AsString;
      data.qryMoveLocNew.fieldByname('isbond').AsString            :=data.qryMoveLocOld.fieldbyname('isbond').AsString;
      data.qryMoveLocNew.fieldByname('countrent').AsString         :=data.qryMoveLocOld.fieldbyname('countrent').AsString;
      data.qryMoveLocNew.fieldByname('warerentcounttype').AsString :=data.qryMoveLocOld.fieldbyname('warerentcounttype').AsString;
      data.qryMoveLocNew.fieldByname('jobnoorder').AsString        :=data.qryMoveLocOld.fieldbyname('jobnoorder').AsString;
      data.qryMoveLocNew.fieldByname('snoorder').AsString          :=data.qryMoveLocOld.fieldbyname('snoorder').AsString;
      data.qryMoveLocNew.fieldByname('iuserid').AsString           :=data.qryMoveLocOld.fieldbyname('iuserid').AsString;
      data.qryMoveLocNew.fieldByname('iusername').AsString         :=data.qryMoveLocOld.fieldbyname('iusername').AsString;
      data.qryMoveLocNew.fieldByname('locationbillno').AsString    :=data.qryMoveLocOld.fieldbyname('locationbillno').AsString;
      data.qryMoveLocNew.fieldByname('customsno').AsString         :=data.qryMoveLocOld.fieldbyname('customsno').AsString;
      data.qryMoveLocNew.fieldByname('sizeuom').AsString           :=data.qryMoveLocOld.fieldbyname('sizeuom').AsString;
      data.qryMoveLocNew.fieldByname('costcusid').AsString         :=data.qryMoveLocOld.fieldbyname('costcusid').AsString;
      data.qryMoveLocNew.fieldByname('costcusname').AsString       :=data.qryMoveLocOld.fieldbyname('costcusname').AsString;
      data.qryMoveLocNew.fieldByname('uom1').AsString              :=data.qryMoveLocOld.fieldbyname('uom1').AsString;
      data.qryMoveLocNew.fieldByname('uom2').AsString              :=data.qryMoveLocOld.fieldbyname('uom2').AsString;
      data.qryMoveLocNew.fieldByname('uom3').AsString              :=data.qryMoveLocOld.fieldbyname('uom3').AsString;
      data.qryMoveLocNew.fieldByname('uom4').AsString              :=data.qryMoveLocOld.fieldbyname('uom4').AsString;
      data.qryMoveLocNew.fieldByname('uom5').AsString              :=data.qryMoveLocOld.fieldbyname('uom5').AsString;
      data.qryMoveLocNew.fieldByname('manufacturedate').AsDateTime:=data.qryMoveLocOld.fieldbyname('manufacturedate').AsDateTime;
      data.qryMoveLocNew.fieldByname('jobnotag').AsString          :=data.qryMoveLocOld.fieldbyname('jobnotag').AsString;
      data.qryMoveLocNew.fieldByname('notfullsign').AsString       :=data.qryMoveLocOld.fieldbyname('notfullsign').AsString;
      data.qryMoveLocNew.fieldByname('costcusidout').AsString      :=data.qryMoveLocOld.fieldbyname('costcusidout').AsString;
      data.qryMoveLocNew.fieldByname('costcusnameout').AsString    :=data.qryMoveLocOld.fieldbyname('costcusnameout').AsString;
      data.qryMoveLocNew.fieldByname('countrentout').AsString      :=data.qryMoveLocOld.fieldbyname('countrentout').AsString;
      data.qryMoveLocNew.fieldByname('warerentcounttypeout').AsString:=data.qryMoveLocOld.fieldbyname('warerentcounttypeout').AsString;
      data.qryMoveLocNew.fieldByname('pricein').AsFloat            :=data.qryMoveLocOld.fieldbyname('pricein').AsFloat;
      data.qryMoveLocNew.fieldByname('jobnoori').AsString          :=data.qryMoveLocOld.fieldbyname('jobnoori').AsString;
      data.qryMoveLocNew.fieldByname('snoori').AsInteger           :=data.qryMoveLocOld.fieldbyname('snoori').AsInteger;
      data.qryMoveLocNew.fieldByname('cusbillno').AsString         :=data.qryMoveLocOld.fieldbyname('cusbillno').AsString;
      data.qryMoveLocNew.fieldByname('mainorder').AsString         :=data.qryMoveLocOld.fieldbyname('mainorder').AsString;
      data.qryMoveLocNew.fieldByname('quantity').AsFloat           :=data.qryMoveLocOld.fieldbyname('quantity').AsFloat;
      data.qryMoveLocNew.fieldByname('piece').AsFloat              :=data.qryMoveLocOld.fieldbyname('piece').AsFloat;
      data.qryMoveLocNew.fieldByname('netweight').AsFloat          :=data.qryMoveLocOld.fieldbyname('netweight').AsFloat;
      data.qryMoveLocNew.fieldByname('grossweight').AsFloat        :=data.qryMoveLocOld.fieldbyname('grossweight').AsFloat;
      data.qryMoveLocNew.fieldByname('area').AsFloat               :=data.qryMoveLocOld.fieldbyname('area').AsFloat;
      data.qryMoveLocNew.fieldByname('volume').AsFloat             :=data.qryMoveLocOld.fieldbyname('volume').AsFloat;
      data.qryMoveLocNew.fieldByname('skucost').AsFloat            :=data.qryMoveLocOld.fieldbyname('skucost').AsFloat;
      data.qryMoveLocNew.fieldByname('tagtotal').AsFloat           :=data.qryMoveLocOld.fieldbyname('tagtotal').AsFloat;
      //lzw20110127
      if _StrSysCus='DHA' then
         data.qryMoveLocNew.fieldByname('operationdate').AsDateTime:=dtdTaskDate.Date
      else
         data.qryMoveLocNew.fieldByname('operationdate').AsDateTime:=getserverdate;
      data.qryMoveLocNew.fieldByname('height').AsFloat             :=data.qryMoveLocOld.fieldbyname('height').AsFloat;
      data.qryMoveLocNew.fieldByname('width').AsFloat              :=data.qryMoveLocOld.fieldbyname('width').AsFloat;
      data.qryMoveLocNew.fieldByname('depth').AsFloat              :=data.qryMoveLocOld.fieldbyname('depth').AsFloat;
      data.qryMoveLocNew.fieldByname('casing1').AsFloat            :=data.qryMoveLocOld.fieldbyname('casing1').AsFloat;
      data.qryMoveLocNew.fieldByname('casing2').AsFloat            :=data.qryMoveLocOld.fieldbyname('casing2').AsFloat;
      data.qryMoveLocNew.fieldByname('casing3').AsFloat            :=data.qryMoveLocOld.fieldbyname('casing3').AsFloat;
      data.qryMoveLocNew.fieldByname('casing4').AsFloat            :=data.qryMoveLocOld.fieldbyname('casing4').AsFloat;
      data.qryMoveLocNew.fieldByname('casing5').AsFloat            :=data.qryMoveLocOld.fieldbyname('casing5').AsFloat;
      data.qryMoveLocNew.fieldByname('loadgroupcusid').AsString    :=data.qryMoveLocOld.fieldbyname('loadgroupcusid').AsString;
      data.qryMoveLocNew.fieldByname('loadgroupcusname').AsString  :=data.qryMoveLocOld.fieldbyname('loadgroupcusname').AsString;
      data.qryMoveLocNew.fieldByname('forkgroupcusid').AsString    :=data.qryMoveLocOld.fieldbyname('forkgroupcusid').AsString;
      data.qryMoveLocNew.fieldByname('forkgroupcusname').AsString  :=data.qryMoveLocOld.fieldbyname('forkgroupcusname').AsString;
      data.qryMoveLocNew.fieldByname('liftmachinecusid').AsString  :=data.qryMoveLocOld.fieldbyname('liftmachinecusid').AsString;
      data.qryMoveLocNew.fieldByname('liftmachinecusname').AsString:=data.qryMoveLocOld.fieldbyname('liftmachinecusname').AsString;
      data.qryMoveLocNew.fieldByname('serialno').AsString          :=data.qryMoveLocOld.fieldbyname('serialno').AsString;
      data.qryMoveLocNew.fieldByname('skucostin').AsFloat          :=data.qryMoveLocOld.fieldbyname('skucostin').AsFloat;
      data.qryMoveLocNew.FieldByName('TagNO').AsString             :=data.qryMoveLocOld.fieldbyname('TagNO').AsString;
      data.qryMoveLocNew.FieldByName('locid').AsString             :=strDetailLocationID;
      data.qryMoveLocNew.FieldByName('locname').AsString           :=strDetailLocationName;
      data.qryMoveLocNew.FieldByName('corpno').AsString             :=data.qryMoveLocOld.fieldbyname('corpno').AsString;
      data.qryMoveLocNew.FieldByName('quantityshort').AsFloat             :=data.qryMoveLocOld.fieldbyname('quantityshort').AsFloat;      
      data.qryMoveLocNew.FieldByName('remark').AsString             :=data.qryMoveLocOld.fieldbyname('remark').AsString;

      data.qryMoveLocNew.Post;
      //lzw20120505
      opensql(datatmp.qryTmp2,'select jobno,sno,ldsno,detailsno,color,skuspec,serialno,      '
                             +'       conno,unknowq,manufacturedate,sizeuom,quantityremain    '
                             +'  from locinskudetail(nolock)'
                             +' where jobno="'+data.qryMoveLocOld.fieldbyname('jobnoin').AsString+'" '
                             +'   and sno='+data.qryMoveLocOld.fieldbyname('snoin').AsString+' '
                             +'   and ldsno='+data.qryMoveLocOld.fieldbyname('ldsnoin').AsString+' '
                              +'   and quantityremain>0 '
              );

      //lzw20120505
      while not datatmp.qryTmp2.Eof do
      begin
         data.qrymovlocskudetail.Append;
         data.qrymovlocskudetail.FieldByName('jobno').AsString:=data.qryMoveLocNew.fieldByname('jobno').AsString;
         data.qrymovlocskudetail.FieldByName('sno').AsInteger:=data.qryMoveLocNew.fieldByname('sno').AsInteger;
         data.qrymovlocskudetail.FieldByName('ldsno').AsInteger:=data.qryMoveLocNew.fieldByname('ldsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('detailsno').AsInteger:=i+1;

         data.qrymovlocskudetail.FieldByName('jobnoin').AsString:=datatmp.qryTmp2.fieldByname('jobno').AsString;
         data.qrymovlocskudetail.FieldByName('snoin').AsInteger :=datatmp.qryTmp2.fieldByname('sno').AsInteger;
         data.qrymovlocskudetail.FieldByName('ldsnoin').AsInteger:=datatmp.qryTmp2.fieldByname('ldsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('detailsnoin').AsInteger:=datatmp.qryTmp2.fieldByname('detailsno').AsInteger;
         data.qrymovlocskudetail.FieldByName('skuid').AsString:=data.qryMoveLocNew.fieldByname('skuid').AsString;
         data.qrymovlocskudetail.FieldByName('skuname').AsString:=data.qryMoveLocNew.fieldByname('skuname').AsString;
         data.qrymovlocskudetail.FieldByName('quantity').AsFloat:=datatmp.qryTmp2.fieldByname('quantityremain').AsFloat;
         data.qrymovlocskudetail.FieldByName('quantityuom').AsString:=data.qryMoveLocNew.fieldByname('quantityuom').AsString;
         data.qrymovlocskudetail.FieldByName('color').AsString:=datatmp.qryTmp2.fieldByname('color').AsString;
         data.qrymovlocskudetail.FieldByName('skuspec').AsString:=datatmp.qryTmp2.fieldByname('skuspec').AsString;
         data.qrymovlocskudetail.FieldByName('lotcode').AsString:=data.qryMoveLocNew.fieldByname('lotcode').AsString;
         data.qrymovlocskudetail.FieldByName('qualityname').AsString:=data.qryMoveLocNew.fieldByname('qualityname').AsString;
         data.qrymovlocskudetail.FieldByName('serialno').AsString:=datatmp.qryTmp2.fieldByname('serialno').AsString;
         data.qrymovlocskudetail.FieldByName('conno').AsString:=datatmp.qryTmp2.fieldByname('conno').AsString;
         data.qrymovlocskudetail.FieldByName('unknowq').AsString:=datatmp.qryTmp2.fieldByname('unknowq').AsString;
         data.qrymovlocskudetail.FieldByName('manufacturedate').AsDateTime:=datatmp.qryTmp2.fieldByname('manufacturedate').AsDateTime;
         data.qrymovlocskudetail.FieldByName('sizeuom').AsString:=datatmp.qryTmp2.fieldByname('sizeuom').AsString;
         data.qrymovlocskudetail.FieldByName('Height').AsFloat:=data.qryMoveLocNew.fieldByname('Height').AsFloat;
         data.qrymovlocskudetail.FieldByName('Width').AsFloat:=data.qryMoveLocNew.fieldByname('Width').AsFloat;
         data.qrymovlocskudetail.FieldByName('Depth').AsFloat:=data.qryMoveLocNew.fieldByname('Depth').AsFloat;
         data.qrymovlocskudetail.FieldByName('costcusid').AsString:=data.qryMoveLocNew.fieldByname('costcusid').AsString;
         data.qrymovlocskudetail.FieldByName('costcusname').AsString:=data.qryMoveLocNew.fieldByname('costcusname').AsString;
         data.qrymovlocskudetail.FieldByName('userid').AsString:=data.qryMoveLocNew.fieldByname('userid').AsString;
         data.qrymovlocskudetail.FieldByName('username').AsString:=data.qryMoveLocNew.fieldByname('username').AsString;
         data.qrymovlocskudetail.FieldByName('shippercusid').AsString:=data.qryMoveLocNew.fieldByname('shippercusid').AsString;
         data.qrymovlocskudetail.FieldByName('shippercusname').AsString:=data.qryMoveLocNew.fieldByname('shippercusname').AsString;
         data.qrymovlocskudetail.FieldByName('cusid').AsString:=data.qryMoveLocNew.fieldByname('cusid').AsString;
         data.qrymovlocskudetail.FieldByName('cusname').AsString:=data.qryMoveLocNew.fieldByname('cusname').AsString;
         data.qrymovlocskudetail.FieldByName('iuserid').AsString:=data.qryMoveLocNew.fieldByname('iuserid').AsString;
         data.qrymovlocskudetail.FieldByName('iusername').AsString:=data.qryMoveLocNew.fieldByname('iusername').AsString;
         data.qrymovlocskudetail.Post;
         datatmp.qryTmp2.next;
      end;
      data.qryMoveLocOld.next;
   end;
end;

procedure TfrmMoveLoc.grdMovelocCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;

{   if (IsNull(data.qryML.FieldByName('checkname').AsString,'')='') and (IsNull(data.qryML.FieldByName('confirmed').AsString,'F')<>'T') then
   begin
      AColor := clInfoBk;
   end ;}
   if (trim(ANode.Values[CHECKUSERNAME.Index])='') and (trim(ANode.Values[confirmed.Index])='T') then
   begin
      AColor := $00C1DBC1;
   end ;

   if (trim(ANode.Values[CHECKUSERNAME.Index])<>'') and (trim(ANode.Values[confirmed.Index])<>'T')then
   begin
      AColor := $00E7E1E8;
   end ;
   if (trim(ANode.Values[CHECKUSERNAME.Index])<>'') and (trim(ANode.Values[confirmed.Index])='T') then
   begin
      AColor := clSkyBlue;
   end ;
   //lzw20110427
   if (trim(ANode.Values[taskcheckname.Index])<>'')  then
   begin
      AFont.Color := clred;
   end ;
   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;
end;

procedure TfrmMoveLoc.PieceOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   pieceOldValue:Extended;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='��������С����!';
         Accept:=False;
         exit;
      end;
      pieceOldValue:=data.qrymovelocold.FieldByName('piece').AsFloat;
      data.qrymovelocold.Edit;
      data.qrymovelocold.FieldByName('piece').AsFloat:=StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText);
      CountSKUPiece(data.qrymovelocold,pieceOldValue);
   end;
end;

procedure TfrmMoveLoc.PieceNewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   pieceOldValue:Extended;
begin
   if DataState in Setdcs then
   begin
      if StrToFloat(grdMoveLocNew.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='��������С����!';
         Accept:=False;
         exit;
      end;
      pieceOldValue:=data.qrymovelocnew.FieldByName('piece').AsFloat;
      data.qrymovelocnew.Edit;
      data.qrymovelocnew.FieldByName('piece').AsFloat:=StrToFloat(grdMoveLocNew.InplaceEditor.GetEditingText);
      CountSKUPiece(data.qrymovelocnew,pieceOldValue);
   end;
end;

procedure TfrmMoveLoc.mitcheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
   if data.qryML.FieldByName('checkname').AsString<>'' then
   begin
      KMessageDlg('�ñ��Ʋ������Ѿ����,�����ٴ����',mtInformation,[mbOK],0);//
      Exit;
   end else
   begin
      if KMessageDlg('�ò��������ѡ�е��Ʋ�����,��ȷ��������?',mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update moveloc '+
                             '    set checkname="'+_Loginname+'",'+
                             '        checkdate="'+datetostr(GetServerDate)+'"'+
                             '  where jobno="'+data.qryML.fieldbyname('jobno').AsString +'"');
      btnRefreshClick(btnRefresh);
   end;
end;

procedure TfrmMoveLoc.mitcancelClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
   if data.qryML.FieldByName('checkname').AsString='' then
   begin
      KMessageDlg('�ñ��Ʋ����ϻ�δ���,����ȡ�����',mtInformation,[mbOK],0);//
      Exit;
   end else
   begin
      if KMessageDlg('�ò�����ȡ���ñ��Ʋ����ϵ����,��ȷ��������?',mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update moveloc '+
                             '    set checkname="",'+
                             '        checkdate=NULL'+
                             '  where jobno="'+data.qryML.fieldbyname('jobno').AsString +'"');
      btnRefreshClick(btnRefresh);
   end;
end;

procedure TfrmMoveLoc.mitcostforkworkClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select 1 from forkworkload (nolock)  '+chr(13)+chr(10)
                         +'where jobnoin="'+data.qryML.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         //+'  and isnull(forktype,"F")="T" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp.RecordCount<>0 then
      KMessageDlg('��Ʊҵ���ѷ�̯����',mtWarning,[mbOK],0)
   else
      Workforkworknew(data.qryML.FieldByname('jobno').AsString,'ML','');
end;

procedure TfrmMoveLoc.mitcanclecostClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,'select distinct createname from forkworkload (nolock)'+chr(13)+chr(10)
                         +'where jobnoin="'+data.qryML.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                         //+'  and isnull(forktype,"F")="T" '+chr(13)+chr(10)
                         );
   if dataTmp.qryTmp.RecordCount=0 then
   begin
      KMessageDlg('��Ʊҵ��δ���й������ķ�̯,����ɾ����',mtWarning,[mbOK],0);
      Exit;
   end;
   if (dataTmp.qryTmp.FieldByname('createname').AsString<>_Loginname) and (_Loginname<>'SYSTEM') then
      KMessageDlg('��Ʊҵ��������̯�Ĺ�����,����ɾ��������ϵϵͳ����Ա��',mtWarning,[mbOK],0)
   else
   begin
      ExecSql(dataTmp.qryTmp,'delete from forkworkload   '+chr(13)+chr(10)
                            +'where jobnoin="'+data.qryML.FieldByName('jobno').AsString+'"  '+chr(13)+chr(10)
                            //+'  and isnull(forktype,"F")="T"  '+chr(13)+chr(10)
                            );
      OpenSql(dataTmp.qryTmp1,'select 1 from forkworkload (nolock)'+chr(13)+chr(10)
                            +'where jobnoin="'+data.qryML.FieldByName('jobno').AsString+'" '+chr(13)+chr(10)
                            //+'  and isnull(forktype,"F")="T" '+chr(13)+chr(10)
                            );
      if dataTmp.qryTmp1.RecordCount=0 then
      begin
         KMessageDlg('��Ʊҵ�������ķ�̯ɾ����ɣ�',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
end;

procedure TfrmMoveLoc.mitlookforkworkClick(Sender: TObject);
begin
   workforkworkload(data.qryML.FieldByname('locationbillno').AsString);
end;

procedure TfrmMoveLoc.quantityshortnewValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
    if _StrSysCus='SZWY' then
    begin
       data.qrymovelocnew.FieldByName('quantityshort').AsFloat:=StrToFloat(grdMoveLocNew.InplaceEditor.GetEditingText);
       if data.qrymovelocnew.FieldByName('quantityshort').AsInteger<>0 then
          data.qrymovelocnew.FieldByName('casing5').AsFloat:=Trunc(data.qrymovelocnew.FieldByName('quantity').AsFloat/data.qrymovelocnew.FieldByName('quantityshort').AsFloat)
       else
          data.qrymovelocnew.FieldByName('casing5').AsFloat:=0;
    end;
end;

procedure TfrmMoveLoc.mittaskcheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
   //lzw20110526
   opensql(datatmp.qryTmp,'select confirmed,CHECKNAME from moveloc(nolock) '
                         +' where jobno="'+data.qryML.fieldbyname('jobno').AsString+'"');
   if datatmp.qryTmp.FieldByName('confirmed').AsString<>'T' then
   begin
      KMessageDlg('���Ʋ�δȷ�ϣ����ܸ���!',mtWarning,[mbOK],0);
      exit;
   end;
   if data.qryML.FieldByName('taskcheckname').AsString<>'' then
   begin
      KMessageDlg('�ñ��Ʋ������Ѿ�����,�����ٴθ���',mtInformation,[mbOK],0);//
      Exit;
   end else
   begin
      if KMessageDlg('�ò���������ѡ�е��Ʋ�����,��ȷ��������?',mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update moveloc '+
                             '    set taskcheckname="'+_Loginname+'",'+
                             '        taskcheckdate="'+datetostr(GetServerDate)+'"'+
                             '  where jobno="'+data.qryML.fieldbyname('jobno').AsString +'"');
      btnRefreshClick(btnRefresh);
   end;
end;

procedure TfrmMoveLoc.mituntaskcheckClick(Sender: TObject);
begin
   if pgcMain.ActivePage<>tbsEdit then
      pgcMain.ActivePage:=tbsEdit;
   if data.qryML.FieldByName('taskcheckname').AsString='' then
   begin
      KMessageDlg('�ñ��Ʋ����ϻ�δ����,����ȡ������',mtInformation,[mbOK],0);//
      Exit;
   end else
   begin
      if KMessageDlg('�ò�����ȡ���ñ��Ʋ����ϵĸ���,��ȷ��������?',mtInformation,[mbYes,mbNo],0)<>mrYes then
         Exit;
      ExecSql(dataTmp.qryTmp,' update moveloc '+
                             '    set taskcheckname="",'+
                             '        taskcheckdate=NULL'+
                             '  where jobno="'+data.qryML.fieldbyname('jobno').AsString +'"');
      btnRefreshClick(btnRefresh);
   end;
end;

procedure TfrmMoveLoc.mitprintClick(Sender: TObject);
var
   lstPara:TStringList;
begin
    lstPara:=TStringList.Create;
    if pgcMain.ActivePage<>tbsEdit then pgcMain.ActivePage:=tbsEdit;
    lstpara.Add('costcusname='+edtcostcusid.text);
    lstpara.Add('remark='+memRemark.Text);
    OpenSql(dataTmp.qryTmp,'select sum(movelocnew.quantity) as quantityall                                                     '+chr(13)+chr(10)
                         +'  from movelocnew  (nolock)                                                       '+chr(13)+chr(10)
                         +' where movelocnew.jobno="'+data.qryML.fieldbyname('jobno').AsString+'"   '+chr(13)+chr(10)
                         );
   lstPara.Add('quantityall='+dataTmp.qryTmp.FieldByname('quantityall').AsString);
    GenInformations(lstPara);
    OpenSql(dataTmp.qryTmp, 'select movelocold.sno ,movelocold.cusname,movelocold.shippercusname,'+chr(13)+chr(10)
                           +'       movelocold.mainorder,movelocold.skuname,sku.customerno,  '+chr(13)+chr(10)
                           +'       locnameold=movelocold.locname,movelocnew.quantity,locname=movelocnew.locname   '+chr(13)+chr(10)
                           +'  from movelocold  '+chr(13)+chr(10)
                           +'           left join movelocnew  '+chr(13)+chr(10)
                           +'                  on movelocold.jobno=movelocnew.jobno    '+chr(13)+chr(10)
                           +'                 and movelocold.sno=movelocnew.sno   '+chr(13)+chr(10)
                           +'           left join sku                             '+chr(13)+chr(10)
                           +'                  on sku.skuid=movelocold.skuid      '+chr(13)+chr(10)
                           +'where movelocold.jobno="'+data.qryML.fieldbyname('jobno').AsString+'"      '+chr(13)+chr(10)
                           +'order by movelocold.jobno,movelocold.sno    '+chr(13)+chr(10)
                           );
Worklinprint('101021','old','�Ʋ��嵥',dataTmp.qryTmp,nil,nil,lstPara);

end;

end.
