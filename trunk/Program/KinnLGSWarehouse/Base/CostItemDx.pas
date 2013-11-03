unit CostItemDx;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Variants,
  StdCtrls, Forms,ComCtrls,ExtCtrls,Dialogs,DBCtrls,DB,
  DBTables,libproc,GMSLabel,Menus,dxExEdtr, dxEdLib,
  dxGrClms, RXSplit,KDataSetProvider, dxDBTLCl, KGroupBox, dxTL, dxDBCtrl,
  dxDBGrid, dxPageControl, DbButtons, KBitBtn, KinPickEdit, dxDBELib,
  dxCntner, dxEditor, KSText, DBKINCGrids, SLV;

type
  TfrmCostItemDx = class(TForm)
    ppmCostIn: TPopupMenu;
    mitInDel: TMenuItem;
    ToolPanel: TPanel;
    btnClose: TKBitBtn;
    btnCancel: TKBitBtn;
    btnSave: TKBitBtn;
    btnEdit: TKBitBtn;
    btnRefresh: TKBitBtn;
    mitInAdd: TMenuItem;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnPrint: TKBitBtn;
    ppmCostOut: TPopupMenu;
    mitOutAdd: TMenuItem;
    mitOutDel: TMenuItem;
    tbsBrowse: TdxTabSheet;
    tbsEdit: TdxTabSheet;
    GMSStickyLabel11: TGMSStickyLabel;
    GMSStickyLabel12: TGMSStickyLabel;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    btnBrowMx: TKBitBtn;
    btnBrowGl: TKBitBtn;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    grdCost: TdxDBGrid;
    Jobno: TdxDBGridColumn;
    blno: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    checkname: TdxDBGridColumn;
    costcheckname: TdxDBGridColumn;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    costcusname: TdxDBGridColumn;
    iusername: TdxDBGridColumn;
    RxSplitter1: TRxSplitter;
    grpCostIn: TKGroupBox;
    grdCostItemInDx: TdxDBGrid;
    costin: TdxDBGridCurrencyColumn;
    costcusnamein: TdxDBGridButtonColumn;
    skunamein: TdxDBGridButtonColumn;
    costdatein: TdxDBGridDateColumn;
    ListerIN: TdxDBGridColumn;
    IOCostin: TdxDBGridCurrencyColumn;
    costcheckin: TdxDBGridColumn;
    PZHIN: TdxDBGridColumn;
    REMARKIN: TdxDBGridBlobColumn;
    grpCostOut: TKGroupBox;
    grdCostItemOutDx: TdxDBGrid;
    costout: TdxDBGridCurrencyColumn;
    costcusnameout: TdxDBGridButtonColumn;
    skuNameOut: TdxDBGridButtonColumn;
    CostDATEOut: TdxDBGridDateColumn;
    ListerOut: TdxDBGridColumn;
    IOCostOut: TdxDBGridCurrencyColumn;
    costcheckOut: TdxDBGridColumn;
    PZHOut: TdxDBGridColumn;
    REMARKOut: TdxDBGridBlobColumn;
    ppmMain: TPopupMenu;
    mitGetTravel: TMenuItem;
    INVONOIN: TdxDBGridColumn;
    currcdin: TdxDBGridKinPickColumn;
    currcdout: TdxDBGridKinPickColumn;
    costcdin: TdxDBGridKinPickColumn;
    costcdout: TdxDBGridKinPickColumn;
    KGroupBox4: TKGroupBox;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel31: TGMSStickyLabel;
    GMSStickyLabel65: TGMSStickyLabel;
    GMSStickyLabel66: TGMSStickyLabel;
    GMSStickyLabel67: TGMSStickyLabel;
    edtCreateName: TdxDBEdit;
    dtdCreatedate: TdxDBDateEdit;
    edtcheckname: TdxDBEdit;
    edtjobno: TdxDBEdit;
    dtdcheckdate: TdxDBDateEdit;
    pgcCost: TdxPageControl;
    iochargein: TdxDBGridColumn;
    iochargeout: TdxDBGridColumn;
    ioinvoin: TdxDBGridColumn;
    departchkin: TdxDBGridColumn;
    departchkout: TdxDBGridColumn;
    ioinvoout: TdxDBGridColumn;
    invonoout: TdxDBGridColumn;
    chgratein: TdxDBGridColumn;
    chgrateout: TdxDBGridColumn;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    conno: TdxDBGridColumn;
    corpno: TdxDBGridColumn;
    btnCheckDepart: TKBitBtn;
    ppmCheckDepart: TPopupMenu;
    mitDepartChk: TMenuItem;
    mitCancelDptChk: TMenuItem;
    conloaddate: TdxDBGridColumn;
    YFed: TdxDBGridColumn;
    FYed: TdxDBGridColumn;
    dlgOpenFile: TOpenDialog;
    ppmAttachment: TPopupMenu;
    mitAddAtt: TMenuItem;
    mitDeleteAtt: TMenuItem;
    mitOpenAtt: TMenuItem;
    Panel1: TPanel;
    lbltime: TLabel;
    GroupBox2: TKGroupBox;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    gmsOperationDate: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    GMSStickyLabel6: TGMSStickyLabel;
    gmsConDescription: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    GMSStickyLabel20: TGMSStickyLabel;
    grdprofit: TdxDBGrid;
    currcd: TdxDBGridColumn;
    insum: TdxDBGridColumn;
    outsum: TdxDBGridColumn;
    profit: TdxDBGridColumn;
    edtConno: TdxDBEdit;
    dtdconloaddate: TdxDBDateEdit;
    timconloaddate: TdxDBTimeEdit;
    edtEtsh: TdxDBDateEdit;
    dtdgetcondate: TdxDBDateEdit;
    dtdcarrierdate: TdxDBDateEdit;
    timCarrierdate: TdxDBTimeEdit;
    timgetcondate: TdxDBTimeEdit;
    timEtsh: TdxDBTimeEdit;
    edtcusbillno: TdxDBEdit;
    edtCorpNO: TdxDBEdit;
    edtConDescription: TdxDBBlobEdit;
    edtremark: TdxDBBlobEdit;
    cmbCarrierAccountID: TdxDBButtonEdit;
    edtBlno: TdxDBEdit;
    edtcostcusname: TdxDBButtonEdit;
    edtlocationbillno: TdxDBEdit;
    memskuname: TdxDBBlobEdit;
    edtUsername: TdxDBButtonEdit;
    KGroupBox5: TKGroupBox;
    lvAttachment: TKinListView;
    N1: TMenuItem;
    procedure btnSaveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mitInDelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCostEditEditUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure mitInAddClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure mitduninClick(Sender: TObject);
    procedure btnAppliMoneyClick(Sender: TObject);
    procedure mitOutAddClick(Sender: TObject);
    procedure mitOutDelClick(Sender: TObject);
    procedure btnCalCommisionClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure grdCostDblClick(Sender: TObject);
    procedure pgcCostChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnGenPzClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure mitFilterActiveClick(Sender: TObject);
    procedure grdCostCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure grdCostItemInDxEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdCostItemInDxEnter(Sender: TObject);
    procedure grdCostItemInDxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure costcusnameinButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitDunOutClick(Sender: TObject);
    procedure edtcostcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtcostcusnameExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtUsernameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtUsernameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtcostcusnameExit(Sender: TObject);
    procedure edtstartareaExit(Sender: TObject);
    procedure grdCostItemInDxExit(Sender: TObject);
    procedure grdCostItemOutDxEnter(Sender: TObject);
    procedure costcusnameoutButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnSprateClick(Sender: TObject);
    procedure costcusnameinValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure costcusnameoutValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mitCopyClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure mitDepartChkClick(Sender: TObject);
    procedure mitCancelDptChkClick(Sender: TObject);
    procedure skunameinButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure skuNameOutButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mitGetTravelClick(Sender: TObject);
    procedure grdCostItemOutDxChangeNodeEx(Sender: TObject);
    procedure grdCostItemInDxChangeNodeEx(Sender: TObject);
    procedure cmbCarrierAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbCarrierAccountIDExit(Sender: TObject);
    procedure cmbCarrierAccountIDExitCheck(Sender: TObject;
      OldValue: Variant; var Failed: Boolean);
    procedure edtFC_PORTLCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtShipperCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtShipperCusExit(Sender: TObject);
    procedure edtCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtCusExit(Sender: TObject);
    procedure mitAddAttClick(Sender: TObject);
    procedure mitDeleteAttClick(Sender: TObject);
    procedure mitOpenAttClick(Sender: TObject);
    procedure grdCostChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure N1Click(Sender: TObject);
  private
    { private declarations }
    
    FindItem: TFindItem;               //����
    strJobno,strMenuName:string;//��ס����sql
    blnSelect:Boolean;
    ScrollAfterEdit:Boolean;
    StrDefFilterSql:string; //�Զ����������
    DataState:TDataState;
    setPermission:TSetInt;
    arrCost:Variant;
    arrCostItemIn:Variant;
    arrCostItemOut:Variant;
    blnCopy:Boolean;
    blnOther:Boolean;
    maxDocBook:Integer; //�޸�ʱ���õ�
    Bookmark: TBookmark;         //��ǩ
    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    function  Gather:boolean;
    function FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
    //�ӱ�򿪹ر�
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    //�ӱ�����Դ�Ͽ�������
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure grdCostItemOutbeforeinsert;
    procedure grdCostItemInbeforeinsert;
    procedure ScatterToLV;
  public
    { public declarations }

    CopyWho,CopyWhoName,CopyCurrCd,CopyDate:String;
    maxNo:Integer;
  end;

procedure WorkCostItemDx(pJobno:String='');

var
  frmCostItemDx,frmCostOther: TfrmCostItemDx;

implementation

uses datas,kindlg,main,libuserPub,libUser,
     GetUserRight, datasTmp,GetDllPub,DocBook,ActPrint;


{$R *.DFM}

procedure WorkCostItemDx(pJobno:String='');
{ģ��������}
var
  year,month,day:word;
  month_start,month_end:TDate;
  Filtersql:string;
begin
   if frmCostItemDx<>nil then
   with frmCostItemDx do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      strJobno:=pJobno;
      if (DataState in setdcs) and (pJobno<>'') then
      begin
        Kmessagedlg(GetMessage('֧��̨�����ڱ༭״̬�����ܶ�λ��','007'), mtInformation,[mbOk],0);
        Exit;
      end;
      if strJobno<>'' then
      begin
         if not data.qryCost.Locate('jobno',strJobno,[]) then
         begin
            KMessageDlg(GetMessage('frmCostItemDx','008'), mtInformation, [mbOk], 0);
            //IIF(_Language='CAPTIONC','û�иñʷ��õ�ҵ����Ϣ��','*****')
            btnCloseClick(frmCostItemDx);
         end;
      end;
      Show;
      Exit;
   end;
   frmCostItemDx:=TfrmCostItemDx.Create(Application);
   with frmCostItemDx do
   begin
      strMenuName:='mitWareCostitem';
      FilterSql:='';
      FindItem:= TFindItem.Create;
      ScrollAfterEdit:=True;
      //��ʼ���ұ�      CURRCD
      InitdbPick(currcdin,'codelib','codename','codename',' codeclass="00" ');
      currcdout.Items.Assign(currcdin.Items);
      currcdout.ItemFields.Assign(currcdin.ItemFields);

      //���ô���
      InitdbPick(costcdin,'costcode','costcd','costname',' 1=1 ');
      costcdout.Items.Assign(costcdin.Items);
      costcdout.ItemFields.Assign(costcdin.ItemFields);

      //�Ʒ���Ʒ��
//      InitdbPick(cmbskucostclasscd,'skucostclass','skucostclasscd','skucostclassname',' 1=1 ');

      strjobno:=pjobno;

      data.InitCostItemDx(strjobno);

      //�������������
      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;
      if trim(strJobno)='' then
      begin
         FilterSql:=' (convert(datetime,convert(char(8),conloaddate,112)) >="'+datetostr(Month_Start)+'") '
                   +'  and (convert(datetime,convert(char(8),conloaddate,112)) <="'+datetostr(Month_End)+'")';
//                   +'  and (isnull(costcheckname,"") ="") ';
         with FindItem do
         begin
            Field.Add('6');
            operator.Add('3');
            value.Add(datetostr(Month_Start));
           Exp.Add('װ������        ���ڵ���      '+datetostr(Month_Start));
            Field.Add('6');
            operator.Add('4');
            value.Add(datetostr(Month_End));
            Exp.Add('װ������        С�ڵ���      '+datetostr(Month_End));
         end;
      end else FilterSql:='';

      //��������Ĭ�Ϲ�������
      StrDefFilterSql:=GetdefFilter('̨��֧��');
      if (StrDefFilterSql<>'') and (trim(strJobno)='') then
      FilterSql:= StrDefFilterSql;

      data.qryCost.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

      data.qryCost.open;

      if strJobno<>'' then
      begin
	 if not data.qryCost.Locate('jobno',strJobno,[]) then
	 begin
	    KMessageDlg(GetMessage('frmCostItemDx','009'), mtInformation, [mbOk], 0);//IIF(_Language='CAPTIONC','û�иñʷ��õ�ҵ����Ϣ��','*****')
	    btnCloseClick(frmCostItemDx);
	 end;
         pgcCost.ActivePage:=tbsEdit;
      end;
      if _loginId<>'SYSTEM' then
         SetButtonEnabled(ToolPanel,strMenuName,trim(_UserOrgid));//���ð�ť����Ч��
      WorkCall(stBrowse);
      {��ʾFORM}
      Show;
   end;
end;

procedure TfrmCostItemDx.WorkCall(CallMode:TDataState);
{ģ��������
   CallMode:����״̬
       stBrowse:����鿴
       stInsert:����
       stEdit:�༭�޸�
}
begin
   DataState:=CallMode;
   with self do
     begin
       case DataState of
          stBrowse:
            begin
               DisableEdit;
               ActiveControl:=btnFind;
            end;
          stEdit:
            begin
               data.qryCost.Edit;
               data.qryCostEdit.Edit;
               //ȡ��������costitem
               OpenSql(datatmp.qryTmp,' Select max(sno) xh '+
                                      '   from costitem (nolock) '+
                                      '  where costitem.Jobno="'+data.qryCostEdit.FieldByName('Jobno').AsString+'"');
               maxNo:=datatmp.qryTmp.FieldByName('xh').AsInteger;
               datatmp.qryTmp.Close;
              //���޸ĵ�״̬�£���qryDocBookѭ��
               data.qryCostDocBook.DisableControls;
               Bookmark:= data.qryCostDocBook.GetBookmark;
               maxDocBook:=0;
               data.qryCostDocBook.First;
               while not data.qryCostDocBook.Eof do
               begin
                 if data.qryCostDocBook.FieldByName('SNO').AsInteger>maxDocBook
                    then maxDocBook:=data.qryCostDocBook.FieldByName('SNO').AsInteger;
                 data.qryCostDocBook.Next;
               end;
               data.qryCostDocBook.GotoBookmark(Bookmark);
               data.qryCostDocBook.FreeBookmark(Bookmark);
               bookMark:=nil;
               data.qryCostDocBook.EnableControls;
               EnableEdit;
            end;
       end;
     end;
end;

function TfrmCostItemDx.Gather:boolean;
{����ֵ�������ݿ�ǰ,��ֵ�������}
begin
   Result:=False;
   if data.qryCostEdit.FieldByName('costcusid').AsString='' then
   begin
      KMessageDlg(GetMessage('frmCostItemDx','010'),mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qryCostEdit.FieldByName('iuserid').AsString='' then
   begin
      KMessageDlg(GetMessage('frmCostItemDx','011'),mtWarning,[mbOK],0);
      Exit;
   end;
   data.qryCost.Edit;
   data.qryCost.FieldByName('locationbillno').AsString:=data.qryCostEdit.FieldByName('locationbillno').AsString;
   data.qryCost.FieldByName('costcusid').AsString:=data.qryCostEdit.FieldByName('costcusid').AsString;
   data.qryCost.FieldByName('costcusname').AsString:=data.qryCostEdit.FieldByName('costcusname').AsString;
   data.qryCost.FieldByName('blno').AsString:=data.qryCostEdit.FieldByName('blno').AsString;
   data.qryCost.FieldByName('skuname').AsString:=data.qryCostEdit.FieldByName('skuname').AsString;
   data.qryCost.FieldByName('corpno').AsString:=data.qryCostEdit.FieldByName('corpno').AsString;
   ReSult:=True;
end;

procedure TfrmCostItemDx.EnableEdit;
{�޸�����״̬����ENABLE�Ķ���}
var
  setDisable:TsetInt;
begin
   setDisable:=[];
   LibComControl(Self,[1..6,20]+setDisable,[10..11]-setDisable);

   grdCostItemINDx.OptionsBehavior:=grdCostItemINDx.OptionsBehavior+[edgoEditing];
   grdCostItemINDx.OptionsDB:=grdCostItemINDx.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdCostItemINDx.ShowGroupPanel:=False;
   grdCostItemINDx.ClearGroupColumns;
   grdCostItemINDx.Filter.Active:=False;

   grdCostItemOutDx.OptionsBehavior:=grdCostItemOutDx.OptionsBehavior+[edgoEditing];
   grdCostItemOutDx.OptionsDB:=grdCostItemOutDx.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdCostItemOutDx.ShowGroupPanel:=False;
   grdCostItemOutDx.ClearGroupColumns;
   grdCostItemOutDx.Filter.Active:=False;
end;

procedure TfrmCostItemDx.DisableEdit;
{�鿴����״̬����DISABLE�Ķ���}
var
   setDisable:TsetInt;
begin
   setDisable:=setPermission;
   if data.qryCost.FieldByName('Jobno').AsString='' then
      setDisable:=setDisable+[2,4,5,6];
   libComControl(self,[10..11]+setDisable,[1..6]-setDisable);

   grdCostItemINDx.OptionsBehavior:=grdCostItemINDx.OptionsBehavior-[edgoEditing];
   grdCostItemINDx.OptionsDB:=grdCostItemINDx.OptionsDB-[edgoCanAppend,edgoCanInsert];

   grdCostItemOutDx.OptionsBehavior:=grdCostItemOutDx.OptionsBehavior-[edgoEditing];
   grdCostItemOutDx.OptionsDB:=grdCostItemOutDx.OptionsDB-[edgoCanAppend,edgoCanInsert];
end;

procedure TfrmCostItemDx.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then
   begin
      while True do
      begin
	 _ADOConnection.StartTransaction;
	 try
	    data.qryCostEdit.Post;
	    data.qryCostEdit.ApplyUpdates;
	    data.qryCostitemIn.ApplyUpdates;
	    data.qryCostItemOut.ApplyUpdates;
	    data.qryCost.ApplyUpdates;
            data.qryCostDocBook.ApplyUpdates;
	    _ADOConnection.Commit;
	    Break;
	 except
	    if _ADOConnection.InTransaction then _ADOConnection.Rollback;
	 end;
      end;
      data.qryCostEdit.CommitUpdates;
      data.qryCostitemIn.CommitUpdates;
      data.qryCostItemOut.CommitUpdates;
      data.qryCost.CommitUpdates;
      data.qryCostDocBook.commitUpdates;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
      SetMasterDetailState(True);
   end;
end;

procedure TfrmCostItemDx.btnCancelClick(Sender: TObject);
begin
   if Kmessagedlg(_strCancel,mtWarning,[mbYes,mbNo],0)=mrNo then
      exit;
   if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+data.qryCostEdit.FieldByName('jobno').AsString+'" ');
   data.qryCost.CancelUpdates;
   data.qryCostEdit.CancelUpdates;
   data.qryCostitemIn.Cancelupdates;
   data.qryCostItemOut.Cancelupdates;
   data.qryCostDocBook.CancelUpdates;
   ScatterToLV;
   WorkCall(stBrowse);
   SetMasterDetailState(True);
end;

procedure TfrmCostItemDx.btnEditClick(Sender: TObject);
begin
   if data.qryCost.FieldByName('costcheckname').AsString<>'' then
   begin
      KMessageDlg(GetMessage('frmCostItemDx','013'),mtInformation,[mbOk],0);
      //IIF(_Language='CAPTIONC','�ñʷ����Ѿ�������ˣ�����ֱ���޸ģ�','')
      Exit;
   end;
   if pgcCost.ActivePage<>tbsEdit then
      pgcCost.ActivePage:=tbsEdit;
   SetDetailActive(False,True);
   SetMasterDetailState(False);
   WorkCall(stEdit);
end;

procedure TfrmCostItemDx.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCostItemDx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DataState in setdcs then Action := caNone else Action := caFree;
end;

procedure TfrmCostItemDx.btnRefreshClick(Sender: TObject);
var
   Jobno:string;
begin
   Jobno:=data.qryCost.FieldByName('Jobno').AsString;
   data.qryCost.DisableControls;
   data.qryCost.Close;
   data.qryCost.Open;
   if not data.qryCost.Locate('Jobno',Jobno,[loCaseInsensitive]) then
      data.qryCost.First;
   WorkCall(stBrowse);
   data.qryCost.EnableControls;
end;

procedure TfrmCostItemDx.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);
   if DataState = stBrowse then
   begin
      case Key of
      VK_F3:
        if pgcCost.ActivePage=tbsEdit then
           pgcCost.ActivePage:=tbsBrowse
        else
           pgcCost.ActivePage:=tbsEdit;
        Ord('T'):KeyDownControl(Key,btnFirst);
        Ord('P'):KeyDownControl(Key,btnPrior);
        Ord('N'):KeyDownControl(Key,btnNext);
        Ord('B'):KeyDownControl(Key,btnLast);
        Ord('E'):KeyDownControl(Key,btnEdit);
        Ord('U'):KeyDownControl(Key,btnRefresh);
        Ord('F'):KeyDownControl(Key,btnFind);
        Ord('R'):KeyDownControl(Key,btnRefind);
        Ord('L'):KeyDownControl(Key,btnFilter);
        Ord('O'):KeyDownControl(Key,btnPrint);
        Vk_Escape:KeyDownControl(Key,btnClose);
      end;
   end else
   begin
      case Key of
        Vk_Escape:
           btnCancel.SetFocus;
        Vk_End,Ord('W'):
           if ssCtrl in Shift then btnSave.SetFocus;
      end;
   end;
end;

procedure TfrmCostItemDx.mitInDelClick(Sender: TObject);
begin
   if data.qryCostItemIN.FieldByName('sno').AsInteger=0 then exit;

//   if data.qryCostitemIn.FieldByName('snosku').AsInteger<>-10 then
   if data.qryCostitemIn.FieldByName('notauto').AsString<>'T' then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','014'),mtConfirmation,[mbYes],0);
      //'��ʷ���Ϊ�����Զ�����,�����ֹ�ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('IOCOST').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','015'),mtConfirmation,[mbYes],0);
      //'����Ѿ�����,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('IOCHARGE').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','016'),mtConfirmation,[mbYes],0);
      //'����Ѿ�����,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('IOINVO').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','017'),mtConfirmation,[mbYes],0);
      //'����Ѿ�����Ʊ,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('DEPARTCHK').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','018'),mtConfirmation,[mbYes],0);
      //'����Ѿ��������,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('COSTCHECKNAME').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','019'),mtConfirmation,[mbYes],0);
      //'����Ѿ��������,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemIn.FieldByName('VOUCHERNO').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','020'),mtConfirmation,[mbYes],0);
      //'����Ѿ�����ƾ֤,����ɾ��!'
      exit;
   end;
   if (Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
      grdCostItemINDx.setfocus;
      data.qryCostItemIN.delete;
   end;
end;

procedure TfrmCostItemDx.FormDestroy(Sender: TObject);
begin
   data.qryCostItemin.Close;
   data.qryCostItemout.Close;
   data.qryProfit.Close;
   data.qryCostEdit.Close;
   data.qryCost.Close;
   data.qryCostDocBook.Close;
   if blnOther then
      frmCostOther:=nil
   else
      frmCostItemDx:=nil;
end;

procedure TfrmCostItemDx.FormCreate(Sender: TObject);
var
  FLargeImages,
  FSmallImages: Integer;
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetDxDbGrid(grdCost);
   SetDxDbGrid(grdCostItemInDx);
   SetDxDbGrid(grdCostItemOutDx);
   SetDxDbGrid(grdprofit);
   Height:=514;
   width:=752;
   //����GROUPBOX�ķ��
   SetGroupBox(GroupBox2);
   SetGroupBox(KGroupBox5);
   //Ӧ�տ���
   SetGroupBox(grpCostIn);
   //Ӧ������
   SetGroupBox(grpCostOut);
   //����������Ϣ
//   SetGroupBox(GroupBox1);
   pgcCost.ActivePage:=tbsBrowse;
   //lvAttachmentͼ���ʼ��
   FLargeImages := GetFileLargeImages;
   FSmallImages := GetFileSmallImages;
   //��ʼ������ͼ���б�
   InitFileImageList(lvAttachment,FSmallImages,FLargeImages);
end;

procedure TfrmCostItemDx.qryCostEditEditUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
//����
end;

procedure TfrmCostItemDx.mitInAddClick(Sender: TObject);
begin
   grdCostItemInDx.setfocus;
   data.qryCostItemIn.append;
   grdCostItemInbeforeinsert;
end;

procedure TfrmCostItemDx.btnFindClick(Sender: TObject);
var
   para:TFindPara;
begin
   Para:=TfindPara.Create;

   para.Tables.Add('locationout');

{0}   para.Field.Add('blno');
{1}   Para.Field.Add('conno');
{2}   para.Field.Add('locationbillno');
{3}   Para.Field.Add('costcusid');
{4}   para.Field.Add('skuname');
{5}   Para.Field.Add('jobno');
{6}   Para.Field.Add('Convert(char(10),conloaddate,102)');
{7}   Para.Field.Add('costcheckname');

   Para.Exp.Add('');

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�ᵥ��','********'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','���','********'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�ֵ���','********'));
{3}   Para.Toptic.Add(IIF(_Language='CAPTIONC','���ù�ϵ��','********'));
{4}   Para.Toptic.Add(IIF(_Language='CAPTIONC','��Ʒ����','********'));
{5}   Para.Toptic.Add(IIF(_Language='CAPTIONC','������','********'));
{6}   Para.Toptic.Add(IIF(_Language='CAPTIONC','װ������','********'));
{7}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�������','********'));

{0}   para.Ftype.Add('C');
{1}   Para.Ftype.Add('C');
{2}   para.Ftype.Add('C');
{3}   para.Ftype.Add('C');
{4}   Para.Ftype.Add('C');
{5}   Para.Ftype.Add('C');
{6}   Para.Ftype.Add('D');
{7}   Para.Ftype.Add('C');

   Para.RField.Add('jobno');

   Para.Filter:=' and '+data.qryCost.MacroByName('Where').AsString;

   Para.OnGetValue:=FindGetValue;

   Dofind(data.qryCost,dataTmp.qryFind,Para,TFindItem(nil));
end;

function TfrmCostItemDx.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result:=True;
   case pField of
      2:
      begin
         qrySelect:=pGetCustomerSelect('A','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            PItems[0]:=qrySelect.FieldByName('Cusname').asstring;
            PItemFields[0]:=qrySelect.FieldByName('Cusid').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
      else Result:=False;
   end;
end;

procedure TfrmCostItemDx.btnRefindClick(Sender: TObject);
begin
   DoRefind(data.qryCost,dataTmp.qryFind);
end;

procedure TfrmCostItemDx.btnFilterClick(Sender: TObject);
var
   Para:TFindPara;
   StrTmp:String;
begin
   Para:=TFindPara.Create;

   para.Tables.Add('locationout');
   
{0}   para.Field.Add('blno');
{1}   Para.Field.Add('conno');
{2}   para.Field.Add('locationbillno');
{3}   Para.Field.Add('costcusid');
{4}   para.Field.Add('skuname');
{5}   Para.Field.Add('jobno');
{6}   Para.Field.Add('Convert(char(10),conloaddate,102)');
{7}   Para.Field.Add('costcheckname');

   Para.Exp.Add('');

{0}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�ᵥ��','********'));
{1}   Para.Toptic.Add(IIF(_Language='CAPTIONC','���','********'));
{2}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�ֵ���','********'));
{3}   Para.Toptic.Add(IIF(_Language='CAPTIONC','���ù�ϵ��','********'));
{4}   Para.Toptic.Add(IIF(_Language='CAPTIONC','��Ʒ����','********'));
{5}   Para.Toptic.Add(IIF(_Language='CAPTIONC','������','********'));
{6}   Para.Toptic.Add(IIF(_Language='CAPTIONC','װ������','********'));
{7}   Para.Toptic.Add(IIF(_Language='CAPTIONC','�������','********'));

{0}   para.Ftype.Add('C');
{1}   Para.Ftype.Add('C');
{2}   para.Ftype.Add('C');
{3}   para.Ftype.Add('C');
{4}   Para.Ftype.Add('C');
{5}   Para.Ftype.Add('C');
{6}   Para.Ftype.Add('D');
{7}   Para.Ftype.Add('C');

   Para.OnGetValue:=FindGetValue;
   StrTmp:=DoFilter(Para, FindItem);
   if strTmp<>'null' then
   begin
      data.qryCost.DisableControls;
      data.qryCost.Close;
      if strTmp<>'' then
        data.qryCost.MacroByName('Where').AsString:=strTmp
      else
        data.qryCost.MacroByName('Where').AsString:=' 1=1 ';
      data.qryCost.Open;
      data.qryCost.EnableControls;
   end;
   WorkCall(stBrowse);
end;

procedure TfrmCostItemDx.mitduninClick(Sender: TObject);
begin
   if data.qryCostitemin.FieldByName('JObno1').AsString<>'' then
//   workBillCX(qryCostitemIn.FieldByName('JObno1').AsString);
end;

procedure TfrmCostItemDx.btnAppliMoneyClick(Sender: TObject);
begin
//   WorkBatchAppliMoney('','','');
end;

procedure TfrmCostItemDx.mitOutAddClick(Sender: TObject);
begin
   grdCostItemOutDx.setfocus;
   data.qryCostItemOut.append;
   grdCostItemOutbeforeinsert;
end;

procedure TfrmCostItemDx.mitOutDelClick(Sender: TObject);
begin
//   data.qryCostitemOut.post;
   if data.qryCostitemOut.FieldByName('sno').AsInteger=0 then exit;

//   if data.qryCostitemOut.FieldByName('snosku').AsInteger<>-10 then
   if data.qryCostitemout.FieldByName('notauto').AsString<>'T' then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','014'),mtConfirmation,[mbYes],0);//'��ʷ���Ϊ�����Զ�����,�����ֹ�ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('IOCOST').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','015'),mtConfirmation,[mbYes],0);//'����Ѿ�����,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('IOCHARGE').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','016'),mtConfirmation,[mbYes],0);//'����Ѿ�����,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('IOINVO').AsFloat<>0) then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','017'),mtConfirmation,[mbYes],0);//'����Ѿ�����Ʊ,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('DEPARTCHK').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','018'),mtConfirmation,[mbYes],0);//'����Ѿ��������,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('COSTCHECKNAME').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','019'),mtConfirmation,[mbYes],0);//'����Ѿ��������,����ɾ��!'
      exit;
   end else
   if (data.qryCostitemOut.FieldByName('VOUCHERNO').AsString<>'') then
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','020'),mtConfirmation,[mbYes],0);   //'����Ѿ�����ƾ֤,����ɾ��!'
      exit;
   end;
   if (Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
      grdCostitemOutDx.setfocus;
      data.qryCostitemOut.delete;
   end;
end;

procedure TfrmCostItemDx.btnCalCommisionClick(Sender: TObject);
begin
//   workCalcComm;//�Զ�����Ӷ��
end;

procedure TfrmCostItemDx.btnBrowMxClick(Sender: TObject);
begin
   pgcCost.ActivePage:=tbsEdit;
   btnBrowMx.Visible:=False;
   btnBrowGl.Visible:=True;
end;

procedure TfrmCostItemDx.btnBrowGlClick(Sender: TObject);
begin
   pgcCost.ActivePage:=tbsBrowse;
   btnBrowMx.Visible:=True;
   btnBrowGl.Visible:=False;
end;

procedure TfrmCostItemDx.grdCostDblClick(Sender: TObject);
begin
   pgcCost.ActivePage:=tbsEdit;
end;

procedure TfrmCostItemDx.pgcCostChange(Sender: TObject);
begin
   if pgcCost.ActivePage = tbsEdit then
   begin
      btnBrowmx.Visible := false;
      btnBrowGl.Visible := true;
      SetDetailActive(True,True);
      ScatterToLV;
   end else
   begin
      btnBrowgl.Visible := false;
      btnBrowmx.Visible := true;
      SetDetailActive(False,False);
   end;
end;

procedure TfrmCostItemDx.btnAddClick(Sender: TObject);
begin
   if pgcCost.ActivePage<>tbsEdit then
      pgcCost.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmCostItemDx.btnDeleteClick(Sender: TObject);
begin
   if data.qryCost.FieldByName('buskind').AsString<>'���Ƿ���' then
   begin
      if _Language='CAPTIONC' then
         _strmessage:=GetMessage('frmCostItemDx','023')//'�ñʷ��ò����ֹ�¼�룬����ɾ����'
      else _strmessage:='******';
      KMessageDlg(_strmessage,mtWarning,[mbOK],0);
      Exit;
   end;
   if data.qryCost.FieldByName('costcheckname').AsString<>'' then
   begin
     { if _Language='CAPTIONC' then
         _strmessage:='�ñʷ����Ѿ���ˣ�����ɾ����'
      else _strmessage:='******'; }
      KMessageDlg(GetMessage('frmCostItemDx','019'),mtWarning,[mbOK],0);
      Exit;
   end;
   if KmessageDlg(_strdel,mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      SetDetailActive(false,true);
      SetMasterDetailState(False);
      _ADOConnection.StartTransaction;
      try
         ExecSql(dataTmp.qryTmp,' delete from costitem '
                               +' where jobno="'+data.qryCost.FieldByName('jobno').AsString+'" ');
         ExecSql(dataTmp.qryTmp,' delete from cost '
                               +' where jobno="'+data.qryCost.FieldByName('jobno').AsString+'" ');
         TdxDBGridNode(grdCost.FocusedNode).Delete;
         data.qryCost.Applyupdates;
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.RollBack;
      end;
      data.qryCost.CommitUpdates;
      SetMasterDetailState(True);
      WorkCall(stBrowse);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
   end;
end;

procedure TfrmCostItemDx.SetMasterDetailState(blnConnect:Boolean);
{�����ӱ��MasterDetail��ϵ���ӻ��ж�}
begin
   if blnConnect then
   begin
      data.qryCostEdit.datasource:=data.dtsCost;
      data.qryCostItemIn.datasource:=data.dtsCost;
      data.qryCostItemOut.datasource:=data.dtsCost;
      data.qryProfit.DataSource:=data.dtsCost;
      data.qryCostDocBook.datasource:=data.dtsCost;
   end else
   begin
      data.qryCostEdit.DataSource:=nil;
      data.qryCostItemIn.DataSource:=nil;
      data.qryCostItemOut.DataSource:=nil;
      data.qryProfit.DataSource:=nil;
      data.qryCostDocBook.datasource:=nil;
   end;
end;

procedure TfrmCostItemDx.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{���ôӿ�query��active
 blnPage�Ƿ���Ҫҳ�����
 blnOpen�Ƿ�open
}
begin
   //��ֹ�����ֱ���޸�����ɵĴӿ�״̬�仯
   if not ScrollAfterEdit and blnOpen then
   begin
      if data.qryCostEdit.Active then
      begin
         data.qryCostEdit.Close;
         data.qryCostEdit.Open;
      end;
      if data.qryCostItemIn.Active then
      begin
         data.qryCostItemIn.Close;
         data.qryCostItemIn.Open;
      end;
      if data.qryCostItemOut.Active then
      begin
         data.qryCostItemOut.Close;
         data.qryCostItemOut.Open;
      end;
      if data.qryProfit.Active then
      begin
         data.qryProfit.Close;
         data.qryProfit.Open;
      end;
      if data.qryCostDocBook.Active then
      begin
        data.qryCostDocBook.Close;
        data.qryCostDocBook.Open;
      end;
      ScrollAfterEdit:=True;
   end;
   //�ӱ�ȫ����ֵ��blnopen
   if not blnPage then
   begin
      data.qryCostEdit.Active         :=blnOpen;
      data.qryCostItemIn.Active       :=blnOpen;
      data.qryCostItemOut.Active :=blnOpen;
      data.qryProfit.Active     :=blnOpen;
      data.qryCostDocBook.Active :=blnOpen;
   end else
   //�ĸ�ҳ��򿪸��ĸ�ҳ�渳ֵ��blnopen
   begin
      data.qryCostEdit.Active:=blnOpen;
      data.qryCostItemIn.Active := blnOpen;
      data.qryCostItemOut.Active := blnOpen;
      data.qryProfit.Active := blnOpen;
      data.qryCostDocBook.Active :=blnOpen;
   end;
end;

procedure TfrmCostItemDx.btnGenPzClick(Sender: TObject);
begin
   if not data.qryCostEdit.Active then data.qryCostEdit.Open;
   case _fmsver of
      0:begin//����
//           if qryCostEdit.FieldByName('ct_accountchk').asString='' then
//           begin
//              KmessageDlg('�˱��ʵ�����δ������˲�������ƾ֤!',mtInformation,[mbOK],0);
//              exit;
//           end else workGenCostPz(qryExport.FieldByName('blno').asString);
        end;
      1:begin//����7.X
//           if workGenOtherPz(edtJobno.Text,edtBlno.Text,cmbEx_Carricd.TextField,edtEx_carno.Text) then
//              btnRefreshClick(Self);
        end;
      2:begin//����U8
           if data.qryCostEdit.FieldByName('costcheckname').asString='' then
           begin
              KmessageDlg(GetMessage('frmCostItemDx','024'),mtInformation,[mbOK],0);//'�˱��ʵ�����δ������˲�������ƾ֤!'
              exit;
           end
           //else workGenCostPz(qryCostEdit.FieldByName('jobno').asString,qryCostEdit.FieldByName('DataBaseId').asString);
        end;
      3:begin//��� k3
           if data.qryCostEdit.FieldByName('costcheckname').asString='' then
           begin
              KmessageDlg(GetMessage('frmCostItemDx','025'),mtInformation,[mbOK],0);//'�˱�Ӧ�շ���δ������˲�������ƾ֤!'
              exit;
           end
           // else workGenCostPz(qryCostEdit.FieldByName('jobno').asString,qryCostEdit.FieldByName('DataBaseId').asString);
        end;
   end;
end;

procedure TfrmCostItemDx.btnPrintClick(Sender: TObject);
begin
   btnPrint.PopUp;
end;

procedure TfrmCostItemDx.mitFilterActiveClick(Sender: TObject);
begin
   grdCost.Filter.Active:=mitFilterActive.Checked;
end;

procedure TfrmCostItemDx.grdCostCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
   if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;

   if trim(ANode.Values[CHECKNAME.Index])='' then
   begin
      AColor := clGradientActiveCaption;
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

procedure TfrmCostItemDx.grdCostItemInDxEditing(Sender: TObject;
   Node: TdxTreeListNode; var Allow: Boolean);
begin
   if (DataState in Setdcs) then
   begin
      with TdxDBGrid(Sender) do
      begin
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='LISTER') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='IOCOST') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='IOCHARGE') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='IOINVO') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='INVONO') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCHECKNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='DEPARTCHK') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='VOUCHERNO') then
         begin
            Allow:=False
         end else
         if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCD') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTCUSNAME') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='CURRCD') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTDATE') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTIN') or
            (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='COSTOUT') then
         begin
            if UpperCase(Name)='GRDCOSTITEMINDX' then
               {wql.05.11.17
               if (data.qryCostitemIn.FieldByName('snosku').AsInteger<>-10)
                  and (data.qryCostitemIn.FieldByName('snosku').AsInteger<>0) then
                  Allow:=False
               else} if (data.qryCostitemIn.FieldByName('IOCOST').AsFloat<>0) or
                  (data.qryCostitemIn.FieldByName('IOCHARGE').AsFloat<>0) or
                  (data.qryCostitemIn.FieldByName('IOINVO').AsFloat<>0) or
                  (data.qryCostitemIn.FieldByName('COSTCHECKNAME').AsString<>'') or
                  (data.qryCostitemIn.FieldByName('DEPARTCHK').AsString<>'') or
                  (data.qryCostitemIn.FieldByName('VOUCHERNO').AsString<>'') then
                  Allow:=False
               else if data.qryCostitemIn.FieldByName('Lister').AsString<>_Loginname then
                  Allow:=False
               else
                  Allow:=True
            else
               {wql.05.11.17
               if (data.qryCostitemOut.FieldByName('snosku').AsInteger<>-10)
                  and (data.qryCostitemOut.FieldByName('snosku').AsInteger<>0) then
                  Allow:=False
               else} if (data.qryCostitemOut.FieldByName('IOCOST').AsFloat<>0) or
                  (data.qryCostitemOut.FieldByName('IOCHARGE').AsFloat<>0) or
                  (data.qryCostitemOut.FieldByName('IOINVO').AsFloat<>0) or
                  (data.qryCostitemOut.FieldByName('COSTCHECKNAME').AsString<>'') or
                  (data.qryCostitemOut.FieldByName('DEPARTCHK').AsString<>'') or
                  (data.qryCostitemOut.FieldByName('VOUCHERNO').AsString<>'') then
                  Allow:=False
               else if data.qryCostitemOut.FieldByName('lister').AsString<>_Loginname then
                  Allow:=False
               else
                  Allow:=True
         end else
         begin
            Allow:=True;
         end;
      end;
   end;
end;

procedure TfrmCostItemDx.grdCostItemInDxEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryCostItemIN.fieldbyname('sno').AsInteger=0) then
   begin
      mitInAddClick(Sender);
   end;
end;

procedure TfrmCostItemDx.grdCostItemInDxKeyDown(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
   with TdxDBGrid(Sender) do
   begin
      if DataState in Setdcs then
      begin
         if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is (TdxDBGridKinPickColumn))
         or (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is (TdxDBGridDateColumn))
         or (State<>tsEditing) then
               
         begin
            {if (Key = VK_RETURN) and (ssCtrl in Shift)
              and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridButtonColumn) then
            begin
               ShowEditor;
               TdxDBGridButtonColumn(Columns[GetFocusedAbsoluteIndex(FocusedColumn)]).OnButtonClick(Sender,GetFocusedAbsoluteIndex(FocusedColumn));
               Key:=0;
            end else
            if (Key = VK_DOWN) and (ssAlt in Shift)
               and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridKinPickColumn) then
            begin
               ShowEditor;
               TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
               key:=0;
            end;}
            if (Key = VK_RETURN)and (ssCtrl in Shift) then
            begin
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridButtonColumn) then
               begin
                  ShowEditor;
                  TdxDBGridButtonColumn(Columns[GetFocusedAbsoluteIndex(FocusedColumn)]).OnButtonClick(Sender,GetFocusedAbsoluteIndex(FocusedColumn));
                  Key:=0;
               end else
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridKinPickColumn) then
               begin
                  ShowEditor;
                  TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
                  key:=0;
               end else
               if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] is TdxDBGridDateColumn) then
               begin
                  ShowEditor;
//                  TdxDateEdit(InplaceEditor);
                  TdxInplaceDateEdit(InplaceEditor).DroppedDown:=True;
//                  TdxInplaceDropDownEdit(InplaceEditor).DroppedDown:=True;
                  key:=0;
               end;
            end;
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
            if uppercase(Name)='GRDCOSTITEMOUTDX' then
               mitOutDelClick(sender)
            else if uppercase(Name)='GRDCOSTITEMINDX' then
               mitINDelClick(sender);
            key:=0;
         end;
      end;
   end;
end;


procedure TfrmCostItemDx.costcusnameinButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostitemIn.Edit;
         data.qryCostitemIn.Fieldbyname('costcusid').asstring  :=qrySelect.FieldByName('cusid').AsString;
         data.qryCostitemIn.Fieldbyname('costcusname').asstring:=qrySelect.FieldByName('cusname').AsString;
      end;
   end;
end;

procedure TfrmCostItemDx.grdCostItemOutDxEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (data.qryCostitemOut.fieldbyname('SNO').AsInteger=0) then
   begin
      mitOutAddClick(Sender);
   end;
end;

procedure TfrmCostItemDx.mitDunOutClick(Sender: TObject);
begin
   if data.qryCostitemOut.FieldByName('JObno1').AsString<>'' then
//   workBillCX(qryCostitemOut.FieldByName('JObno1').AsString);
end;

procedure TfrmCostItemDx.edtcostcusnameButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('Cusid').AsString<>'NO' then
      begin
         edtcostcusname.TextField:=qrySelect.FieldByName('Cusid').asstring;
         edtcostcusname.Text     :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.edtcostcusnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if edtcostcusname.Text='' then
      begin
         data.qrycostedit.Edit;
         data.qrycostedit.FieldByName('costcusid').AsString:='';
         data.qrycostedit.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',edtcostcusname.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qrycostedit.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qrycostedit.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCostItemDx.edtUsernameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetOrganizationSelect(_Userid,'U','F');
      if qrySelect.FieldByName('userid').AsString<>'NO' then
      begin
         data.qryCostEdit.FieldByName('iuserid').AsString  :=qrySelect.FieldByName('userid').asstring;
         data.qryCostEdit.FieldByName('iusername').AsString  :=qrySelect.FieldByName('username').asstring;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.edtUsernameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
begin
   if DataState in Setdcs then
   begin
      if edtUsername.Text='' then
      begin
         data.qryCostEdit.Edit;
         data.qryCostEdit.FieldByName('iuserid').AsString:='';
         data.qryCostEdit.FieldByName('iusername').AsString:='';
      end;
   end;
end;

procedure TfrmCostItemDx.edtcostcusnameExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmCostItemDx.edtstartareaExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmCostItemDx.grdCostItemInDxExit(Sender: TObject);
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

procedure TfrmCostItemDx.costcusnameoutButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('A','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostitemOut.Edit;
         data.qryCostitemOut.Fieldbyname('costcusid').asstring  :=qrySelect.FieldByName('cusid').AsString;
         data.qryCostitemOut.Fieldbyname('costcusname').asstring:=qrySelect.FieldByName('cusname').AsString;
      end;
   end;
end;

procedure TfrmCostItemDx.btnSprateClick(Sender: TObject);
begin
   OpenSql(dataTmp.qryTmp,' select carriagetotal,skuid,skuname,jobno,sno,costcusid,costcusname,currcd '
                         +'   from locationoutitem item (nolock) '
                         +'  where jobno="'+data.qryCost.FieldByName('jobno').AsString+'" '
                         +'    and isnull(carriagetotal,0)>0 '
           );
   dataTmp.qryTmp.First;
   while not dataTmp.qryTmp.Eof do
   begin
      if data.qrycostitemin.Locate('snosku',datatmp.qryTmp.fieldbyname('sno').AsString,[loCaseInsensitive]) then
      begin
         datatmp.qryTmp.Next;
         continue;
      end;
      data.qryCostitemIn.Append;
      data.qryCostitemIn.FieldByName('jobno').AsString:=data.qryCostEdit.FieldByName('jobno').AsString;
      data.qryCostitemIn.FieldByName('snosku').AsString:=dataTmp.qryTmp.FieldByName('sno').AsString;
      data.qryCostitemIn.FieldByName('skuid').AsString:=dataTmp.qryTmp.FieldByName('skuid').AsString;
      data.qryCostitemIn.FieldByName('skuname').AsString:=dataTmp.qryTmp.FieldByName('skuname').AsString;
      data.qryCostitemIn.FieldByName('costin').AsString:=dataTmp.qryTmp.FieldByName('carriagetotal').AsString;
      data.qryCostitemIn.FieldByName('userid').AsString:=_Userid;
      data.qryCostitemIn.FieldByName('username').AsString:=_Username;
      data.qryCostitemIn.FieldByName('costcusid').AsString:=dataTmp.qryTmp.FieldByName('costcusid').AsString;
      data.qryCostitemIn.FieldByName('costcusname').AsString:=dataTmp.qryTmp.FieldByName('costcusname').AsString;
      data.qryCostitemIn.FieldByName('currcd').AsString:=dataTmp.qryTmp.FieldByName('currcd').AsString;
//      maxNo:=maxNo+1;
//      data.qryCostitemIn.FieldByName('sno').AsInteger:=maxNo;
      data.qryCostitemIn.FieldByName('costdate').AsString:=data.qryCostEdit.FieldByName('costdate').AsString;
      data.qryCostitemIn.FieldByName('costcd').AsString:='YF';
      data.qryCostitemIn.FieldByName('Lister').AsString:=_LoginName;
      try
        data.qryCostitemIn.Post;
      except
        break;
      end;
      dataTmp.qryTmp.Next;
   end;
end;

procedure TfrmCostItemDx.MenuItem1Click(Sender: TObject);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetSkuSelect('','','T');
      if qrySelect.RecordCount<>0 then
      begin
         data.qryCostitemIn.Edit;
         data.qryCostitemIn.fieldbyname('SKUID').asstring:=qrySelect.FieldByName('skuid').AsString;
         data.qryCostitemIn.fieldbyname('SKUName').asstring:=qrySelect.FieldByName('skuname').AsString;
         data.qryCostitemIn.fieldbyname('snosku').Asinteger:=-10 ;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.costcusnameinValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if grdCostItemInDx.InplaceEditor.GetEditingText='' then
      begin
         data.qryCostitemIn.Edit;
         data.qryCostitemIn.Fieldbyname('costcusid').asstring:='';
         data.qryCostitemIn.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',grdCostItemInDx.InplaceEditor.GetEditingText);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryCostitemIn.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryCostitemIn.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCostItemDx.costcusnameoutValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if grdCostItemOutDx.InplaceEditor.GetEditingText='' then
      begin
         data.qryCostitemOut.Edit;
         data.qryCostitemOut.Fieldbyname('costcusid').asstring:='';
         data.qryCostitemOut.FieldByName('costcusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('A',grdCostItemOutDx.InplaceEditor.GetEditingText);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryCostitemOut.FieldByName('costcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryCostitemOut.FieldByName('costcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCostItemDx.mitCopyClick(Sender: TObject);
begin
  if pgcCost.ActivePage<>tbsEdit then pgcCost.ActivePage:=tbsEdit;
//  pcWareOrderChange(self);
  SetDetailActive(False,True);

  arrCost:=ScatterToArray(data.qryCostEdit,true,0);
  arrCostItemIn :=ScatterToArray(data.qryCostitemIn,false,0);
  arrCostItemOut:=ScatterToArray(data.qryCostitemOut,false,0);

  blnCopy:=True;

  WorkCall(stInsert);
  SetMasterDetailState(False);
end;

procedure TfrmCostItemDx.MenuItem3Click(Sender: TObject);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetSkuSelect('','','T');
      if qrySelect.RecordCount<>0 then
      begin
         data.qryCostitemOut.Edit;
         data.qryCostitemOut.fieldbyname('SKUID').asstring:=qrySelect.FieldByName('skuid').AsString;
         data.qryCostitemOut.fieldbyname('SKUName').asstring:=qrySelect.FieldByName('skuname').AsString;
         data.qryCostItemOut.fieldbyname('snosku').Asinteger:=-10 ;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.MenuItem2Click(Sender: TObject);
begin
{var
  TItemSKUSelect:TMultItemSKUSelect;
  i:integer;
begin
   if DataState in Setdcs then
   begin
      TItemSKUSelect:=  WorkItemSKUSelect(data.qryCostEdit.FieldByName('jobno').asstring,data.qryCostEdit.FieldByName('buskind').asstring);
      for i:=0 to 100 do
      begin
         if TItemSKUSelect[i].OkFlag then
         begin
            if i=0 then
            begin
              data.qryCostItemin.edit;
            end else
            begin
//              data.qryCarSKU.append;
//              grdCARSKUBeforeInsert;
            end;
            data.qryCostItemin.fieldbyname('SKUID').asstring               :=TItemSKUSelect[i].SKUID            ;
            data.qryCostItemin.fieldbyname('SKUName').asstring             :=TItemSKUSelect[i].SKUName          ;
//            data.qryCostItemin.Fieldbyname('jobno').asstring               :=TItemSKUSelect[i].jobno          ;
            data.qryCostItemin.fieldbyname('snosku').Asinteger             :=TItemSKUSelect[i].sno        ;
            try
               data.qryCostItemin.Post;
            except
               Break;
            end;
         end;
      end;
   end;  }
end;

procedure TfrmCostItemDx.MenuItem4Click(Sender: TObject);
begin
{
  TItemSKUSelect:TMultItemSKUSelect;
  i:integer;
begin
   if DataState in Setdcs then
   begin
      TItemSKUSelect:=  WorkItemSKUSelect(data.qryCostEdit.FieldByName('jobno').asstring,data.qryCostEdit.FieldByName('buskind').asstring);
      for i:=0 to 100 do
      begin
         if TItemSKUSelect[i].OkFlag then
         begin
            if i=0 then
            begin
              data.qryCostItemOut.edit;
            end else
            begin
//              data.qryCarSKU.append;
//              grdCARSKUBeforeInsert;
            end;
            data.qryCostItemOut.fieldbyname('SKUID').asstring               :=TItemSKUSelect[i].SKUID            ;
            data.qryCostItemOut.fieldbyname('SKUName').asstring             :=TItemSKUSelect[i].SKUName          ;
//            data.qryCostItemOut.Fieldbyname('jobno').asstring               :=TItemSKUSelect[i].jobno          ;
            data.qryCostItemOut.fieldbyname('snosku').Asinteger             :=TItemSKUSelect[i].sno        ;
            try
               data.qryCostItemOut.Post;
            except
               Break;
            end;
         end;
      end;
   end; }
end;

procedure TfrmCostItemDx.mitDepartChkClick(Sender: TObject);
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(datatmp.qryTmp,'update costitem '
                +'   set departchk="'+_loginname+'",'
                +'       dptchkdate="'+datetostr(GetServerDate)+'"'
                +' where jobno="'+data.qrycost.FieldByName('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmCostItemDx.mitCancelDptChkClick(Sender: TObject);
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   execSql(datatmp.qryTmp,'update costitem '
                +'   set departchk="",'
                +'       dptchkdate=""'
                +' where jobno="'+data.qrycost.FieldByName('jobno').AsString+'"');
   btnRefreshClick(Self);
   Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
end;

procedure TfrmCostItemDx.skunameinButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   MenuItem1Click(Self);
end;

procedure TfrmCostItemDx.skuNameOutButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   MenuItem3Click(Self);
end;

procedure TfrmCostItemDx.mitGetTravelClick(Sender: TObject);
var
   I,K:Integer;
   strJobno:string;
begin
   if KmessageDlg(_strBeforeOperation,mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   k:=0;
   strJobno:='';
   for i:=grdCost.SelectedCount-1 Downto 0 do
   begin
      Application.ProcessMessages;
      data.qryCost.GotoBookmark(Pointer(grdCost.SelectedRows[i]));
      if data.qryCost.FieldByName('checkname').AsString='' then
         Inc(k)
      else
         strJobno:=strJobno+'"'+data.qryCost.fieldbyname('jobno').asstring+'",'
   end;
   strJobno:=Copy(strjobno,1,Length(strjobno)-1);
   if strJobno<>'' then
   begin
      try
        _ADOConnection.StartTransaction;
        ExecSql(dataTmp.qryTmp,' select maxxh=max(sno),jobno                                                    '+chr(13)+chr(10)
                              +'   into #lsmaxsno                                                               '+chr(13)+chr(10)
                              +'   from costitem (nolock)                                                       '+chr(13)+chr(10)
                              +' where jobno in ('+strJobno+')                                                   '+chr(13)+chr(10)
                              +' group by jobno                                                                 '+chr(13)+chr(10)
                              +'insert into costitem                                                            '+chr(13)+chr(10)
                              +'     (jobno,sno,snosku,skuid,skuname,costin,userid,username,                    '+chr(13)+chr(10)
                              +'      costcusid,costcusname,currcd,costdate,costcd,lister)                      '+chr(13)+chr(10)
                              +'select jobno=item.jobno,sno=item.sno+isnull(maxsno.maxxh,0),snosku=item.sno,              '+chr(13)+chr(10)
                              +'       skuid=item.skuid,skuname=item.skuname,costin=item.carriagetotal,        '+chr(13)+chr(10)
                              +'       userid="'+_userid+'",username="'+_username+'",                           '+chr(13)+chr(10)
                              +'       costcusid=item.costcusid,costcusname=item.costcusname,currcd=item.carriagecurrcd,'+chr(13)+chr(10)
                              +'       costdate=item.operationdate,costcd="YF",lister="'+_LoginName+'"          '+chr(13)+chr(10)
                              +' from  locationoutitem item (nolock)                                            '+chr(13)+chr(10)
                              +'                       left join  #lsmaxsno maxsno                              '+chr(13)+chr(10)
                              +'                              on  maxsno.jobno=item.jobno                       '+chr(13)+chr(10)
                              +'where item.jobno in ('+strJobno+')                                               '+chr(13)+chr(10)
                              +'  and isnull(carriagetotal,0)>0                                             '+chr(13)+chr(10)
                              +'  and not exists(select 1                                                        '+chr(13)+chr(10)
                              +'                  from costitem (nolock)                                        '+chr(13)+chr(10)
                              +'                 where jobno=item.jobno                                         '+chr(13)+chr(10)
                              +'                   and snosku=item.sno)                                         '+chr(13)+chr(10)
                              +'drop table #lsmaxsno                                                            '+chr(13)+chr(10)
                              );
        _ADOConnection.Commit;
      except
        try
          if _ADOConnection.InTransaction then _ADOConnection.rollback;
        except
        end;
        raise;
        Exit;
      end;
      if k>0 then
         Kmessagedlg(_strsucceed+'����'+inttostr(k)+GetMessage('frmCostItemDx','030'),mtInformation,[mbOk],0)  //'��δҵ�����,δ�����˷�!'
      else
         Kmessagedlg(_strsucceed,mtInformation,[mbOk],0);
   end else
   begin
      Kmessagedlg(GetMessage('frmCostItemDx','029'),mtWarning,[mbOk],0);//�������ҵ������
      Exit;
   end;
end;

procedure TfrmCostItemDx.grdCostItemOutbeforeinsert;
begin
   data.qryCostitemout.fieldbyname('SNO').Asinteger:=-1;
   data.qryCostitemout.fieldbyname('currcd').asstring:=_currcd;
   data.qryCostitemout.fieldbyname('notauto').asstring:='T';
   data.qryCostitemout.fieldbyname('userid').asstring:=_userid;
   data.qryCostitemout.fieldbyname('iuserid').asstring:=_userid;
   data.qryCostitemout.fieldbyname('Lister').asstring:=_Loginname;
end;

procedure TfrmCostItemDx.grdCostItemInbeforeinsert;
begin
   data.qryCostitemIn.fieldbyname('SNO').Asinteger:=-1;
   data.qryCostitemIn.fieldbyname('currcd').asstring:=_currcd;
   data.qryCostitemIn.fieldbyname('notauto').asstring:='T';
   data.qryCostitemIn.fieldbyname('userid').asstring:=_userid;
   data.qryCostitemIn.fieldbyname('iuserid').asstring:=_userid;
   data.qryCostitemIn.fieldbyname('Lister').asstring:=_Loginname;
end;

procedure TfrmCostItemDx.grdCostItemOutDxChangeNodeEx(Sender: TObject);
begin
   if grdCostItemOutDx.Datalink.DataSet.State = dsInsert then
   begin
      grdCostItemOutBeforeInsert;
   end;
end;

procedure TfrmCostItemDx.grdCostItemInDxChangeNodeEx(Sender: TObject);
begin
   if grdCostItemInDx.Datalink.DataSet.State = dsInsert then
   begin
      grdCostItemInBeforeInsert;
   end;
end;

procedure TfrmCostItemDx.cmbCarrierAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('D','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCostEdit.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.cmbCarrierAccountIDExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmCostItemDx.cmbCarrierAccountIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      if cmbCarrierAccountID.Text='' then
      begin
         data.qryCostEdit.Edit;
         data.qryCostEdit.FieldByName('carriercusid').AsString:='';
         data.qryCostEdit.FieldByName('carriercusname').AsString:='';
      end else
      if not blnSelect then
      begin
         qrySelect:=pGetCustomerSelect('D',cmbCarrierAccountID.Text);
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            data.qryCostEdit.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
            data.qryCostEdit.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCostItemDx.edtFC_PORTLCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetPortSelect('F','');
      if qrySelect.FieldByName('Portcd').AsString<>'NO' then
      begin
         data.qryCostEdit.FieldByName('portl').AsString  :=qrySelect.FieldByName(IIF(_Language='CAPTIONC','portcname','portename')).asstring;
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.edtShipperCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('F','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostEdit.FieldByName('shippercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCostEdit.FieldByName('shippercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.edtShipperCusExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmCostItemDx.edtCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   if DataState in Setdcs then
   begin
      qrySelect:=pGetCustomerSelect('G','');
      if qrySelect.FieldByName('cusid').AsString<>'NO' then
      begin
         data.qryCostEdit.FieldByName('cusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
         data.qryCostEdit.FieldByName('cusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
         blnSelect:=True;
         ReturnNext(Self);
      end;
      FreeAndNil(qrySelect);
   end;
end;

procedure TfrmCostItemDx.edtCusExit(Sender: TObject);
begin
   blnSelect:=False;
end;

procedure TfrmCostItemDx.mitAddAttClick(Sender: TObject);
begin
  with AddFileItem(lvAttachment) do
  if FileName <> '' then
  begin
    data.qryCostDocBook.Append;
    data.qryCostDocBook.FieldByName('createname').AsString :=_Loginname;//�ļ���
    data.qryCostDocBook.FieldByName('DocType').AsString := '����ĵ�';//�ĵ����
    data.qryCostDocBook.FieldByName('DOCID').AsString := data.qryCostEdit.fieldbyname('Jobno').AsString;
    data.qryCostDocBook.FieldByName('FilesName').AsString := FileName;//�ļ���
    TBlobField(data.qryCostDocBook.FieldByName('FilesContent')).LoadFromStream(FileContent);//�ļ�����
    data.qryCostDocBook.Post;
    //
    FreeAndNil(FileContent);
  end;
end;

procedure TfrmCostItemDx.mitDeleteAttClick(Sender: TObject);
var
  blnNeedReload: Boolean;
begin
  if lvAttachment.ItemIndex = -1 then
  begin
    KMessageDlg(GetMessage('frmContWithLoca','025'),mtWarning,[mbOk],0);//'û��ѡ�񸽼�,����ɾ��'
    exit;
  end;
  if data.qryCostDocBook.FieldByName('createname').AsString<>_Loginname then
  begin
    KMessageDlg(GetMessage('frmContWithLoca','030'),mtWarning,[mbOk],0);//'���ļ���������ӵģ�����ɾ����'
    exit;
  end;
  if KMessageDlg(GetMessage('frmContWithLoca','026'),mtConfirmation,[mbYes,mbNO],0)=mrYes then//'ȷ��ɾ����ѡ�񸽼�?'
  begin
    if data.qryCostDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]) then
    begin
      if lvAttachment.Items.Count -1 > lvAttachment.ItemIndex then
        blnNeedReload := True;
      data.qryCostDocBook.Edit;
      data.qryCostDocBook.Delete;
      lvAttachment.Items[lvAttachment.ItemIndex].Focused := True;
      lvAttachment.Items[lvAttachment.ItemIndex].Delete;
      if blnNeedReload then  ScatterToLV;
      if lvAttachment.Items.Count > 0 then lvAttachment.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmCostItemDx.mitOpenAttClick(Sender: TObject);
begin
  if not (DataState in setDcs) then
  if lvAttachment.ItemIndex <>-1 then
  begin
    data.qryCostDocBook.Locate('SNO',lvAttachment.ItemIndex+1,[]);
    OpenItemFile(data.qryCostDocBook.FieldByName('filesname').AsString,TBlobField(data.qryCostDocBook.FieldByName('FilesContent')));
  end;
end;

procedure TfrmCostItemDx.ScatterToLV;
var
  strFileName: string;
  ListItem: TListItem;
begin
//  if _blnUseHtDocBook then//�ĵ�����
  if data.qryCostDocBook.Active then
  begin
    if data.qryCostDocBook.FieldByName('DOCID').AsString <> '' then
    begin
//      lvAttachment.Visible := True;
//      spdAttachment.Down := True;
    end else
    begin
//      lvAttachment.Visible := False;
//      spdAttachment.Down := False;
    end;
    //
    data.qryCostDocBook.First;
    lvAttachment.Items.Clear;
    while not data.qryCostDocBook.Eof do
    begin
      if data.qryCostDocBook.FieldByName('FilesName').AsString <> '' then
      begin
        strFileName := data.qryCostDocBook.FieldByName('FilesName').AsString;
        ListItem := lvAttachment.Items.Add;
        ListItem.Caption := strFileName;
        SetFileImageIndex(ListItem,lvAttachment.ViewStyle=vsIcon);
      end;
      data.qryCostDocBook.Next;
    end;
  end;
end;

procedure TfrmCostItemDx.grdCostChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  ScatterToLV;
end;

procedure TfrmCostItemDx.N1Click(Sender: TObject);
begin
   workActPrint('','900002',data.qryCost.fieldbyname('jobno').AsString,data.qryCost.fieldbyname('corpno').AsString);
end;

end.



