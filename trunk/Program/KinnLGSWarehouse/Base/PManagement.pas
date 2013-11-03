unit PManagement;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls,ExtCtrls, GMSLabel,DBTables,Db, Libproc, ComCtrls,KSText,DBKINCGrids,
  Menus,DbButtons,KBitBtn, dxCntner, dxExEdtr, dxEdLib, dxDBELib, dxEditor,
  KinPickEdit,KGroupBox,KinQuery, frstatus, dxPageControl, dxTL, dxDBCtrl,
  dxDBGrid, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient;

type
  TfrmPManagement = class(TForm)
    ToolPanel: TPanel;
    qryFind: TKADOQuery;
    qryTmp: TKADOQuery;
    ppmadd: TPopupMenu;
    mitDelEdeac: TMenuItem;
    mitAdd: TMenuItem;
    ppmPrint: TPopupMenu;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel1: TBevel;
    Bevel6: TBevel;
    btncopy: TKBitBtn;
    btnRefresh: TKBitBtn;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btnFind: TKBitBtn;
    btnRefind: TKBitBtn;
    btnFilter: TKBitBtn;
    btnFirst: TDBBitBtnK;
    btnPrior: TDBBitBtnK;
    btnNext: TDBBitBtnK;
    btnLast: TDBBitBtnK;
    pgcPManagement: TdxPageControl;
    tbsEdit: TdxTabSheet;
    tbsBrowse: TdxTabSheet;
    btnBrowGl: TKBitBtn;
    btnBrowMx: TKBitBtn;
    grdPManagementitem: TdxDBGrid;
    detailsno: TdxDBGridColumn;
    grpinfobar: TKGroupBox;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel17: TGMSStickyLabel;
    GMSStickyLabel29: TGMSStickyLabel;
    GMSStickyLabel34: TGMSStickyLabel;
    edtJOBNO: TdxDBEdit;
    edtCheckName: TdxDBEdit;
    edtCreateName: TdxDBEdit;
    edtprintname: TdxDBEdit;
    edtmodifyname: TdxDBEdit;
    KGroupBox1: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    edtskuclassname: TdxDBEdit;
    edtskuname: TdxDBButtonEdit;
    edtcustomerno: TdxDBEdit;
    edtskuPackage: TdxDBEdit;
    KGroupBox12: TKGroupBox;
    edtRemark: TdxDBMemo;
    KGroupBox6: TKGroupBox;
    GMSStickyLabel53: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    GMSStickyLabel46: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    edtRecipient: TdxDBEdit;
    edtQuotedate: TdxDBDateEdit;
    edtQuoteno: TdxDBEdit;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    Bevel3: TBevel;
    Bevel5: TBevel;
    qryPManagement: TKADOQuery;
    dtsPManagement: TDataSource;
    udsPManagement: TKadoUpdateSql;
    qryPManagementitem: TKADOQuery;
    dtsPManagementitem: TDataSource;
    udsPManagementitem: TKadoUpdateSql;
    qryPManagement0: TKADOQuery;
    dtsPManagement0: TDataSource;
    sno: TdxDBGridColumn;
    grdPManagement: TdxDBGrid;
    cusname: TdxDBGridColumn;
    Recipient: TdxDBGridColumn;
    Quotedate: TdxDBGridColumn;
    Quoteno: TdxDBGridColumn;
    customerno: TdxDBGridColumn;
    skuclassname: TdxDBGridColumn;
    skuPackage: TdxDBGridColumn;
    ppmcheck: TPopupMenu;
    mitcheck: TMenuItem;
    mitcacel: TMenuItem;
    N1: TMenuItem;
    Costclasscd: TdxDBGridMemoColumn;
    PriceRemark: TdxDBGridMemoColumn;
    skuname: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    edtcusname: TdxDBButtonEdit;
    mitaddmb: TMenuItem;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel11: TGMSStickyLabel;
    edtdetailsno: TdxDBEdit;
    edtPriceRemark: TdxDBMemo;
    GMSStickyLabel12: TGMSStickyLabel;
    cmdCostclasscd: TKinDbPickEdit;
    GMSStickyLabel8: TGMSStickyLabel;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnRefindClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCopyClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure mitDelEdeacClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mitAddClick(Sender: TObject);
    procedure pgcPManagementChange(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure grdPManagementDblClick(Sender: TObject);
    procedure grdPManagementItemEditing(Sender: TObject;
      Node: TdxTreeListNode; var Allow: Boolean);
    procedure grdPManagementItemEnter(Sender: TObject);
    procedure grdPManagementItemExit(Sender: TObject);
    procedure grdPManagementItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PManagementStartZXButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure PManagementEndZXButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtPManagementStartButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtPManagementEndButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grdPManagementitemChangeNodeEx(Sender: TObject);
    procedure qryPManagementitemBeforePost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure mitcheckClick(Sender: TObject);
    procedure mitcacelClick(Sender: TObject);
    procedure mitaddmbClick(Sender: TObject);
    procedure edtcusnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtskunameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    Year,Month,Day:word;
    StrCheck:Boolean;
    strSql:String;
    oldPManagementId:String;
    ScrollAfterEdit:Boolean;
    blnCopy:Boolean;
    arrPManagement,arrPManagementitem:Variant;
    blnTzbz:boolean;
    FindItem: TFindItem;               //����
    strDate:string;
    SaveExit: Boolean;

    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    procedure InitValues;
    procedure grdPManagementItemBeforeInsert;
    procedure SetMasterDetailState(blnConnect:Boolean);
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    function getJobno: string;
    function FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
  public
    { Public declarations }
    oldPManagementEnd:String;
    DataState:TDataState;
    oldPManagement:string;
    sltPManagement:TStringList;
    sltSno:TStringList;
    maxSno,maxSnoFs:smallint;
    m_blnPost: Boolean;//��Post״̬

    procedure CreateParams(var Params: TCreateParams);override;
  end;
procedure WorkPManagement(callMode:TdataState=stBrowse;pstrJobno:string='';pstrDataBaseID:string='';pstrConno:string='');

var
  frmPManagement: TfrmPManagement;

implementation

{$R *.DFM}

uses datas,kindlg,main,libuser,GetUserRight,libuserPub,
  saveget,GetDllPub,datasTmp,linprint,PSelect;

var
  strJobno:string;

procedure WorkPManagement(callMode:TdataState=stBrowse;pstrJobno:string='';pstrDataBaseID:string='';pstrConno:string='');
begin
   strJobno:=pstrJobno;
   {��ֹ�����ظ�ִ��}
   if frmPManagement<>nil then
   with frmPManagement do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmPManagement,frmPManagement);
   with frmPManagement do
   begin
      StrCheck       :=True;
      strDate:=IntToStr(Year)+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month))
                    +iif(Day<10,'0'+IntToStr(Day),IntToStr(Day));
      sltPManagement:=TStringList.Create;
      sltSno:=TStringList.Create;
      m_blnPost:=True;
      FindItem:= TFindItem.Create;
      ScrollAfterEdit:=True;

      InitdbPick(cmdCostclasscd,'costcode','costname','costname','1=1');
     
      strSql:=' Select * '+
              '   from PManagement (NOLOCK)'+
              '  Where %where ';
      qryPManagement0.Close;
      qryPManagement0.Sql.Clear;
      qryPManagement0.Sql.Add(strSql);
      qryPManagement0.MacroByName('Where').AsString:=' 1=1';
      qryPManagement0.Open;
      
      //Route ��
      strSql:='Select *'+
              '  from PManagement (NOLOCK)'+
              ' Where jobno=:jobno ';
      qryPManagement.Close;
      qryPManagement.Sql.Clear;
      qryPManagement.Sql.Add(strSql);
      qryPManagement.Open;
      //RouteZX ��
      strSql:='Select PManagementitem.* '+
              '  From PManagementitem (NOLOCK)'+
              ' Where PManagementitem.jobno=:jobno '
              ;
      qryPManagementitem.Close;
      qryPManagementitem.Sql.Clear;
      qryPManagementitem.Sql.Add(strSql);
      qryPManagementitem.Open;
      WorkCall(stBrowse);
      Show;
   end;
end;

procedure TfrmPManagement.CreateParams(var Params: TCreateParams);
begin
  if strJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmPManagement.WorkCall(CallMode:TDataState);
{ģ��������
   CallMode:����״̬
       stBrowse:����鿴
       stInsert:����
       stEdit:�༭�޸�
}
begin
   DataState:=CallMode;
   with frmPManagement do
   begin
      case DataState of
       stBrowse:
         begin
            DisableEdit;
            DisableBrowse;
            //����������־
            blnCopy:=False;
            ActiveControl:=btnFind;
            LampChange(lsBrowse);

         end;
       stEdit:
         begin
            blnTzbz:=False;
            EnableEdit;
            qryPManagement0.Edit;
            qryPManagement.Edit;

            sltPManagement.clear;
            sltSno.Clear;
            maxSno:=0;
            qryPManagementitem.DisableControls;
            qryPManagementitem.First;
            While not qryPManagementitem.Eof do
            begin
               if qryPManagementitem.FieldByName('SNO').AsInteger>maxSno then
                  maxSno:=qryPManagementitem.FieldByName('SNO').AsInteger;
               qryPManagementitem.Next;
            end;
            qryPManagementitem.EnableControls;
            LampChange(lsEdit);
         end;
       stInsert:
         begin
            blnTzbz:=False;
            qryPManagement0.Append;
            if not blnCopy then
               qryPManagement.Append;
            maxsno:=0;
            InitValues;
            oldPManagement:='';
            sltPManagement.clear;
            sltSno.clear;
            EnableEdit;
            LampChange(lsEdit);
         end;
      end;
   end;
end;

//���ᵥ�ţ������ŵ���Ϣ�����ж�
function TfrmPManagement.Gather:Boolean;
begin
   Result:=False;
   qryPManagement0.FieldByName('JOBNO').Asstring:= qryPManagement.FieldByName('JOBNO').Asstring;
   qryPManagement0.FieldByName('cusname').Asstring:= qryPManagement.FieldByName('cusname').Asstring;
   qryPManagement0.FieldByName('skuname').Asstring:= qryPManagement.FieldByName('skuname').Asstring;
   qryPManagement0.FieldByName('Recipient').Asstring:= qryPManagement.FieldByName('Recipient').Asstring;
   qryPManagement0.FieldByName('Quotedate').Asstring:= qryPManagement.FieldByName('Quotedate').Asstring;
   qryPManagement0.FieldByName('Quoteno').Asstring:= qryPManagement.FieldByName('Quoteno').Asstring;
   qryPManagement0.FieldByName('customerno').Asstring:= qryPManagement.FieldByName('customerno').Asstring;
   qryPManagement0.FieldByName('skuclassname').Asstring:= qryPManagement.FieldByName('skuclassname').Asstring;
   qryPManagement0.FieldByName('skuPackage').Asstring:= qryPManagement.FieldByName('skuPackage').Asstring;
   qryPManagement0.FieldByName('remark').Asstring:= qryPManagement.FieldByName('remark').Asstring;
   result:=True;
end;

procedure TfrmPManagement.EnableEdit;
{�޸�����״̬����ENABLE�Ķ���}
var
   setDisable:TsetInt;
begin
   //���������޸�
   setDisable:=[];
   LibComControl(Self,[1..5]+setDisable,[50]+[10..14]+[20]-setDisable);

   grdPManagementitem.OptionsBehavior:=grdPManagementitem.OptionsBehavior+[edgoEditing];
   grdPManagementitem.OptionsDB:=grdPManagementitem.OptionsDB+[edgoCanAppend,edgoCanInsert];
   grdPManagementitem.ShowGroupPanel:=False;
   grdPManagementitem.ClearGroupColumns;

   edtQuotedate.SetFocus;
end;

procedure TfrmPManagement.DisableEdit;
{�޸�����״̬����ENABLE�Ķ���}
var
  setDisable:TSetInt;
begin
//���ƽ�ֹ�޸�
   setDisable:=[];
   if qryPManagement0.RecordCount=0 then
      setDisable:=setDisable+[2,4,5];
   libComControl(self,[10..14]+setDisable,[1..5]-setDisable);

   grdPManagementitem.OptionsBehavior:=grdPManagementitem.OptionsBehavior-[edgoEditing];
   grdPManagementitem.OptionsDB:=grdPManagementitem.OptionsDB-[edgoCanAppend,edgoCanInsert];
   grdPManagementitem.ShowGroupPanel:=True;
end;

procedure TfrmPManagement.DisableBrowse;
{�鿴����״̬����¼�ƶ�ʱ����ENABLE��DISABLE�Ķ���}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   libComControl(self,setDisable,[]);
end;

procedure TfrmPManagement.btnAddClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then
      pgcPManagement.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmPManagement.InitValues;
begin
   if blnCopy then //��������
   begin
      qryPManagement.DisableControls;
      GatherFromArray(qryPManagement,arrPManagement,False);
      qryPManagement.FieldByName('CreateName').AsString:=_loginName;
      qryPManagement.FieldByName('CreateDate').AsDatetime:=GetServerDate;
      qryPManagement.EnableControls;
      qryPManagement.FieldByName('Quoteno').Asstring:=getJobno;
      qryPManagement.FieldByName('JOBNO').Asstring:=GenJobno('BJ');
      //PManagementZX
      qryPManagementitem.DisableControls;
      GatherFromArray(qryPManagementitem,arrPManagementitem,True);
      qryPManagementitem.First;
      while not qryPManagementitem.Eof do
      begin
         qryPManagementitem.Edit;
         if qryPManagementitem.FieldByName('SNO').AsInteger>maxSno then
            maxSno:=qryPManagementitem.FieldByName('SNO').AsInteger;
         qryPManagementitem.FieldByName('Quoteno').AsString:=qryPManagement.FieldByName('Quoteno').AsString;
         
         qryPManagementitem.Next;
      end;
      qryPManagementitem.First;
      qryPManagementitem.EnableControls;

   end else //����
   begin
      qryPManagement.Edit;
      qryPManagement.FieldByName('JOBNO').Asstring:= GenJobno('BJ');
      qryPManagement.FieldByName('CreateName').AsString:=_loginName;
      qryPManagement.FieldByName('CreateDate').AsDatetime:=GetServerDate;
      qryPManagement.FieldByName('Quoteno').Asstring:= getJobno;
      qryPManagement.FieldByName('Quotedate').AsDatetime:=GetServerDate;
   end;
end;
function TfrmPManagement.getJobno: string;
var
   StrDate:String;
   StrCusInvo:String;
begin
   decodedate(Now,Year,Month,Day);//�ֽ⵱ǰ����
   opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,5))) '
          +'                 from genjobno (NOLOCK)                            '
          +'                where substring(docno1,1,2)="BJ"                   '
          +'                  and substring(jobno,5,2)="BJ"                    '
          +'                  and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   Result:='BJ'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),5,'0',psLeft);
end;

procedure TfrmPManagement.btnRefreshClick(Sender: TObject);
var
  strConvecd:string;
begin
   strConvecd:=qryPManagement0.FieldByName('jobno').AsString;
   qryPManagement0.Close;
   qryPManagement0.Open;
   qryPManagement0.DisableControls;
   try
      qryPManagement0.locate('jobno',VarArrayOf([strConvecd]),[loCaseInsensitive, loPartialKey]);
   except
      qryPManagement0.Last;
   end;
   qryPManagement0.EnableControls;
end;

procedure TfrmPManagement.btnEditClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then
      pgcPManagement.ActivePage:=tbsEdit;
   if (qryPManagement.FieldByName('checkname').AsString<>'') then
   begin
      kMessageDlg('�ñ��۵��Ѿ���˲����޸ģ�', mtWarning, [mbOK], 0);
      Exit;
   end;
   SetDetailActive(False,True);
   SetMasterDetailState(False);
   WorkCall(stEdit);
end;

procedure TfrmPManagement.btnDeleteClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then
      pgcPManagement.ActivePage:=tbsEdit;
   if (qryPManagement.FieldByName('checkname').AsString<>'') then
   begin
      kMessageDlg('�ñ��۵��Ѿ���˲���ɾ����', mtWarning, [mbOK], 0);
      Exit;
   end else
   if KmessageDlg('�ò�����ɾ���ñʱ��۵����������ݣ���ȷ��Ҫɾ����?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      SetDetailActive(false,true);
      SetMasterDetailState(False);

      _ADOConnection.StartTranSaction;
      try
         ExecSql(qryTmp,'Delete from PManagement '+'Where JOBNO="'+qryPManagement0.FieldByName('JOBNO').AsString+'" ');
         ExecSql(qryTmp,'Delete from PManagementItem '+'Where JOBNO="'+qryPManagement0.FieldByName('JOBNO').AsString+'" ');
         ExecSql(qryTmp,'Delete from genjobno '+'Where JOBNO="'+qryPManagement0.FieldByName('JOBNO').AsString+'" ');
         TdxDBGridNode(grdPManagement.FocusedNode).Delete;
         qryPManagement0.Applyupdates;
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.RollBack;
      end;
      qryPManagement0.CommitUpdates;
      SetMasterDetailState(True);
      WorkCall(stBrowse);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
   end;
end;


procedure TfrmPManagement.btnFindClick(Sender: TObject);
var
  Para:TFindPara;
begin
  Para:=TFindPara.Create;

  para.Tables.Add('PManagement');

{0}  para.Field.Add('PManagement.Quoteno');
{1}  para.Field.Add('PManagement.Quotedate');
{2}  para.Field.Add('PManagement.cusname');
{3}  para.Field.Add('PManagement.Recipient');
{4} para.Field.Add('PManagement.skuname');
{5}  para.Field.Add('PManagement.customerno');
{6}  para.Field.Add('PManagement.skuclassname');
{7}  para.Field.Add('PManagement.skuPackage');

  Para.Exp.Add('');

{0}  Para.Toptic.Add('���۵���');
{1}  Para.Toptic.Add('����ʱ��');
{2}  Para.Toptic.Add('��    ��');
{3}  Para.Toptic.Add('�� ϵ ��');
{4}  Para.Toptic.Add('Ʒ    ��');
{5}  Para.Toptic.Add('���Ϲ����');
{6}  Para.Toptic.Add('��    ��');
{7}  Para.Toptic.Add('��    װ');

{0}  Para.Ftype.Add('C');
{1}  Para.Ftype.Add('D');
{2}  Para.Ftype.Add('C');
{3}  Para.Ftype.Add('C');
{4}  Para.Ftype.Add('C');
{5}  Para.Ftype.Add('C');
{6}  Para.Ftype.Add('C');
{7}  Para.Ftype.Add('C');

  Para.RField.Add('PManagement.JOBNO');

  Para.OnGetValue:=FindGetValue;

  Dofind(qryPManagement0, qryFind, Para, TFindItem(nil));
end;

procedure TfrmPManagement.btnRefindClick(Sender: TObject);
begin
  DoReFind(qryPManagement0,qryFind);
end;

procedure TfrmPManagement.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then
   begin
     _ADOConnection.StartTransaction;
     try
        qryPManagement.Post;
        qryPManagement0.ApplyUpdates;
        qryPManagement.ApplyUpdates;
        ExecSql(dataTmp.qryTmp,' update genjobno set docno1="'+qryPManagement.FieldByName('Quoteno').AsString+'" '
                              +'  where jobno="'+qryPManagement.FieldByName('Jobno').AsString+'" '
               );

        qryPManagementitem.DisableControls;
        qryPManagementitem.first;
        while not qryPManagementitem.eof do
        begin
           qryPManagementitem.Edit;
           qryPManagementitem.fieldbyname('JOBNO').asstring:=qryPManagement.fieldbyname('JOBNO').asstring;
           qryPManagementitem.Post;
           qryPManagementitem.next;
        end;
        qryPManagementitem.first;
        qryPManagementitem.EnableControls;
        qryPManagementitem.ApplyUpdates;

        _ADOConnection.Commit;
     except
       if _ADOConnection.InTransaction then
          _ADOConnection.Rollback;
       Raise;
       Exit;
     end;
     qryPManagement0.CommitUpdates;
     qryPManagement.CommitUpdates;
     qryPManagement.CommitUpdates;
     ScrollAfterEdit:=False;
     SetMasterDetailState(True);     
     WorkCall(stBrowse);
     btnRefreshClick(sender);
   end;
end;

procedure TfrmPManagement.btnCancelClick(Sender: TObject);
begin
  if(Kmessagedlg(_strCancel,mtConfirmation,[mbyes,mbNo],0))=mrYes then
   begin
      qryPManagementitem.CancelUpdates;
      qryPManagement.CancelUpdates;
      qryPManagement0.CancelUpdates;

      grdPManagementItem.ResetFullRefresh;
      grdPManagement.ResetFullRefresh;
      WorkCall(stBrowse);
      SetMasterDetailState(True);
   end;
end;

procedure TfrmPManagement.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPManagement.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DataState in setdcs then
      Action := caNone
   else
      Action := caFree;
end;

procedure TfrmPManagement.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=Vk_Return) and not (ActiveControl is TdxDBGrid) then ReturnNext(Self);

  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pgcPManagement.ActivePage=tbsEdit then
        begin
          pgcPManagement.ActivePage:=tbsBrowse;
        end else
        begin
          pgcPManagement.ActivePage:=tbsEdit;
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

procedure TfrmPManagement.btnCopyClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then
      pgcPManagement.ActivePage:=tbsEdit;
   arrPManagement:=ScatterToArray(qryPManagement,True,0);
   arrPManagementitem:=ScatterToArray(qryPManagementitem,False,0);
   blnCopy:=True;
   qryPManagementitem.DataSource:=nil;
   qryPManagement.DataSource:=nil;
   WorkCall(stInsert);
end;

procedure TfrmPManagement.btnFilterClick(Sender: TObject);
var
  Para:TFindPara;
  StrTmp:String;
begin
  Para:=TFindPara.Create;

  para.Tables.Add('PManagement');

{0}  para.Field.Add('PManagement.Quoteno');
{1}  para.Field.Add('PManagement.Quotedate');
{2}  para.Field.Add('PManagement.cusname');
{3}  para.Field.Add('PManagement.Recipient');
{4} para.Field.Add('PManagement.skuname');
{5}  para.Field.Add('PManagement.customerno');
{6}  para.Field.Add('PManagement.skuclassname');
{7}  para.Field.Add('PManagement.skuPackage');

  Para.Exp.Add('');

{0}  Para.Toptic.Add('���۵���');
{1}  Para.Toptic.Add('����ʱ��');
{2}  Para.Toptic.Add('��    ��');
{3}  Para.Toptic.Add('�� ϵ ��');
{4}  Para.Toptic.Add('Ʒ    ��');
{5}  Para.Toptic.Add('���Ϲ����');
{6}  Para.Toptic.Add('��    ��');
{7}  Para.Toptic.Add('��    װ');

{0}  Para.Ftype.Add('C');
{1}  Para.Ftype.Add('D');
{2}  Para.Ftype.Add('C');
{3}  Para.Ftype.Add('C');
{4}  Para.Ftype.Add('C');
{5}  Para.Ftype.Add('C');
{6}  Para.Ftype.Add('C');
{7}  Para.Ftype.Add('C');

  Para.RField.Add('PManagement.JOBNO');
 
  Para.OnGetValue:=FindGetValue;

  StrTmp:=DoFilter(Para, FindItem);
  if strTmp<>'null' then
  begin
    qryPManagement0.DisableControls;
    qryPManagement0.Close;
    if strTmp<>'' then
      qryPManagement0.MacroByName('Where').AsString:=strTmp
    else
      qryPManagement0.MacroByName('Where').AsString:=' 1=1 ';
    qryPManagement0.Open;
    qryPManagement0.EnableControls;
  end;
  WorkCall(stBrowse);
end;
function TfrmPManagement.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
  qrySelect:TKADOQuery;
begin
  Result:=True;
  case pField of
   2:
      begin
//
      end;
    3:
    begin
//
    end;
    4:
    begin
//
    end;
    else
      Result:=False;
  end;
end;

procedure TfrmPManagement.mitDelEdeacClick(Sender: TObject);
begin
    if qryPManagementitem.FieldByName('SNO').AsInteger<>0 then
    if Kmessagedlg('ɾ���ñ�����,ȷ����', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      grdPManagementItem.SetFocus;
      qryPManagementitem.Delete;
    end;
end;

procedure TfrmPManagement.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(KGroupBox6);
   SetGroupBox(KGroupBox1);
   SetGroupBox(KGroupBox12);
   SetDxDbGrid(grdPManagementItem);
   SetDxDbGrid(grdPManagement);
   pgcPManagement.ActivePage:=tbsBrowse;
   qryTmp.Connection    :=_ADOConnection;
   qryFind.Connection   :=_ADOConnection;
   qryPManagement0.Connection    :=_ADOConnection;
   qryPManagement.Connection   :=_ADOConnection;
   qryPManagementitem.Connection    :=_ADOConnection;
end;

procedure TfrmPManagement.FormDestroy(Sender: TObject);
begin
   LampChange(lsmenu);
   sltPManagement.free;
   sltSno.free;
   frmPManagement:=nil;
end;

procedure TfrmPManagement.mitAddClick(Sender: TObject);
begin
  grdPManagementItem.SetFocus;
  grdPManagementItemBeforeInsert;
  edtdetailsno.SetFocus;
end;

procedure TfrmPManagement.pgcPManagementChange(Sender: TObject);
begin
  if pgcPManagement.ActivePage=tbsEdit then
  begin
    btnBrowMx.Visible:=False;
    btnBrowGl.Visible:=True;
    SetDetailActive(True,True);
  end else
  begin
    btnBrowGl.Visible:=False;
    btnBrowMx.Visible:=True;
    SetDetailActive(False,False);
  end;
end;

procedure TfrmPManagement.btnBrowGlClick(Sender: TObject);
begin
  pgcPManagement.ActivePage:=tbsBrowse;
end;

procedure TfrmPManagement.btnBrowMxClick(Sender: TObject);
begin
  pgcPManagement.ActivePage:=tbsEdit;
end;

procedure TfrmPManagement.grdPManagementDblClick(Sender: TObject);
begin
   pgcPManagement.ActivePage:=tbsEdit;
end;

procedure TfrmPManagement.grdPManagementItemBeforeInsert;
begin
   qryPManagementitem.Append;
   qryPManagementitem.fieldbyname('SNO').Asinteger:=-1;
   qryPManagementitem.fieldByname('jobno').AsString:=qryPManagement.fieldbyname('jobno').AsString;
end;

procedure TfrmPManagement.grdPManagementItemEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   if not (DataState in Setdcs) then Allow:=False else
  begin
    Allow:=false;
  end;
end;

procedure TfrmPManagement.grdPManagementItemEnter(Sender: TObject);
begin
   if (DataState in setdcs) and (qryPManagementitem.fieldbyname('SNO').AsInteger=0) then
  begin
    mitAddClick(Sender);
  end;
end;

procedure TfrmPManagement.grdPManagementItemExit(Sender: TObject);
begin
   with grdPManagementItem do
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

procedure TfrmPManagement.grdPManagementItemKeyDown(Sender: TObject;
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
         end;
      if (Key = VK_DELETE) and (ssCtrl in Shift) then
          begin
            if Name='grdPManagementitem' then
               mitDelEdeacclick(sender);
            key:=0;
          end;
    end;
  end;
end;

procedure TfrmPManagement.PManagementStartZXButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    qrySelect:=pGetAreaSelect;
    if qrySelect.FieldByName('areaid').AsString<>'NO' then
    begin
      qryPManagementitem.Edit;
      qryPManagementitem.FieldByName('PManagementStart').AsString:=qrySelect.FieldByName('areaname').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmPManagement.PManagementEndZXButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    qrySelect:=pGetAreaSelect;
    if qrySelect.FieldByName('areaid').AsString<>'NO' then
    begin
      qryPManagementitem.Edit;
      qryPManagementitem.FieldByName('PManagementEnd').AsString:=qrySelect.FieldByName('areaname').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmPManagement.edtPManagementStartButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    qrySelect:=pGetAreaSelect;
    if qrySelect.FieldByName('areaid').AsString<>'NO' then
    begin
      qryPManagement.Edit;
      qryPManagement.FieldByName('PManagementStart').AsString:=qrySelect.FieldByName('areaname').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmPManagement.edtPManagementEndButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  qrySelect:TKADOQuery;
begin
  if DataState in Setdcs then
  begin
    qrySelect:=pGetAreaSelect;
    if qrySelect.FieldByName('areaid').AsString<>'NO' then
    begin
      qryPManagement.Edit;
      qryPManagement.FieldByName('PManagementEnd').AsString:=qrySelect.FieldByName('areaname').asstring;
      ReturnNext(Self);
    end;
    FreeAndNil(qrySelect);
  end;
end;

procedure TfrmPManagement.grdPManagementitemChangeNodeEx(Sender: TObject);
begin
//
end;

procedure TfrmPManagement.qryPManagementitemBeforePost(DataSet: TDataSet);
begin
   maxSno:=maxSno+1;
   qryPManagementitem.FieldByName('SNO').asinteger:=maxSno;
   qryPManagementitem.fieldByname('jobno').AsString:=qryPManagement.fieldbyname('jobno').AsString;
end;

procedure TfrmPManagement.N1Click(Sender: TObject);
var
   lstPara:TStringList;
begin
   if qryPManagement.FieldByName('checkname').AsString='' then
   begin
      KMessageDlg('�ñ��۵�δ���,���ܴ�ӡ��',mtWarning,[mbOK],0);
      Exit;
   end;
   if pgcPManagement.ActivePage<>tbsEdit then pgcPManagement.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   lstpara.Add('Quoteno='+qryPManagement.FieldByname('Quoteno').AsString);
   lstpara.Add('Quotedate='+qryPManagement.FieldByname('Quotedate').AsString);
   lstpara.Add('cusname='+qryPManagement.FieldByname('cusname').AsString);
   lstpara.Add('Recipient='+qryPManagement.FieldByname('Recipient').AsString);
   lstpara.Add('skuname='+qryPManagement.FieldByname('skuname').AsString);
   lstpara.Add('customerno='+qryPManagement.FieldByname('customerno').AsString);
   lstpara.Add('skuclassname='+qryPManagement.FieldByname('skuclassname').AsString);
   lstpara.Add('skuPackage='+qryPManagement.FieldByname('skuPackage').AsString);
   lstpara.Add('remark='+qryPManagement.FieldByname('remark').AsString);
   lstpara.Add('kdr='+_loginname);
   GenInformations(lstPara);
   OpenSql(dataTmp.qryTmp,'select detailsno,costclasscd,priceremark      '
                         +'  from PManagementitem (nolock)               '
                         +' where jobno="'+qryPManagement.FieldByname('jobno').AsString+'" '
                         +'   and isnull(Costclasscd,"")<>"" '
                         );
   ExecSql(qryTmp,'update PManagement '
                 +'   set Printname="'+_loginname+'" ,'
                 +'       Printdate="'+datetostr(getserverdate)+'" '
                 );
   Worklinprint('900344','old','���۵�',dataTmp.qryTmp,nil,nil,lstpara);
end;

procedure TfrmPManagement.mitcheckClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then pgcPManagement.ActivePage:=tbsEdit;
   if qryPManagement.FieldByName('checkname').AsString<>'' then
   begin
      KMessageDlg('�ñ��۵��Ѿ���ˣ�',mtWarning,[mbOK],0);
      Exit;
   end else
   begin
      execsql(datatmp.qryTmp,'update PManagement '
                            +'   set checkname="'+_loginname+'",'
                            +'       CHECKDATE="'+datetostr(getserverdate)+'" '
                            +' where jobno="'+qryPManagement.FieldByname('jobno').AsString+'"');
      KMessageDlg('���۵���˳ɹ���',mtInformation,[mbOK],0);
   end;
   btnRefreshClick(Sender);   
end;

procedure TfrmPManagement.mitcacelClick(Sender: TObject);
begin
   if pgcPManagement.ActivePage<>tbsEdit then pgcPManagement.ActivePage:=tbsEdit;
   if qryPManagement.FieldByName('checkname').AsString='' then
   begin
      KMessageDlg('�ñ��۵�δ���,����ȡ����ˣ�',mtWarning,[mbOK],0);
      Exit;
   end else
   begin
      execsql(datatmp.qryTmp,'update PManagement '
                            +'   set checkname="",'
                            +'       CHECKDATE=null '
                            +' where jobno="'+qryPManagement.FieldByname('jobno').AsString+'"');
      KMessageDlg('���۵�ȡ����˳ɹ���',mtInformation,[mbOK],0);
   end;
   btnRefreshClick(Sender);   
end;

procedure TfrmPManagement.mitaddmbClick(Sender: TObject);
var
   mulpSelect:TPSelect;
   strjobno:string;
begin
   strjobno:='';
   mulpSelect:=WorkPSelect;
   strjobno:=mulpSelect.jobnoin;
   OpenSql(qryTmp,'select detailsno,Costclasscd,PriceRemark  '
                 +'  from PManagementitem(nolock)            '
                 +' where jobno="'+strjobno+'"               '
                 );
   qryTmp.First;
   while not qryTmp.Eof do
   begin
      qryPManagementitem.Append;
      qryPManagementitem.FieldByName('detailsno').AsString   :=qryTmp.FieldByName('detailsno').AsString ;
      qryPManagementitem.FieldByName('Costclasscd').AsString :=qryTmp.FieldByName('Costclasscd').AsString ;
      qryPManagementitem.FieldByName('PriceRemark').AsString :=qryTmp.FieldByName('PriceRemark').AsString ;
      qryPManagementitem.Post;
      qryTmp.Next;
   end;
end;

procedure TfrmPManagement.SetMasterDetailState(blnConnect:Boolean);
begin
   if blnConnect then
   begin
      qryPManagement.DataSource       :=dtsPManagement0;
      qryPManagementitem.DataSource   :=dtsPManagement0;
   end else
   begin
      qryPManagement.DataSource       :=nil;
      qryPManagementitem.DataSource   :=nil;
   end;
end;

procedure TfrmPManagement.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{���ôӿ�query��active
 blnPage�Ƿ���Ҫҳ�����
 blnOpen�Ƿ�open(�����ó�FalseʱblnReOpenһ��ҪΪFalse)
 blnReOpen�Ƿ���Ҫ����Open
}
begin
   //��ֹ�����ֱ���޸�����ɵĴӿ�״̬�仯
   if not ScrollAfterEdit and blnOpen then
   begin
      if qryPManagement.Active then
      begin
         qryPManagement.Close;
         qryPManagement.Open;
      end;
      if qryPManagementitem.Active then
      begin
         qryPManagementitem.Close;
         qryPManagementitem.Open;
      end;
      ScrollAfterEdit:=True;
   end;
   //�ӱ�ȫ����ֵ��blnopen
   if not blnPage then
   begin
      qryPManagement.Active         :=blnOpen;
      qryPManagementitem.Active       :=blnOpen;
   end else
   begin
      qryPManagement.Active         :=blnOpen;
      qryPManagementitem.Active       :=blnOpen;
   end;
end;

procedure TfrmPManagement.edtcusnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      qryPManagement.FieldByName('Cusname').AsString :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmPManagement.edtskunameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetSkuSelect('','','A');
   if qrySelect.FieldByName('skuid').AsString<>'' then
   begin
      qryPManagement.FieldByName('skuname').AsString :=qrySelect.FieldByName('skuname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

end.
