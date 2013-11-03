unit bayonet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls,ExtCtrls, GMSLabel,DBTables,Db, Libproc, ComCtrls,KSText,DBKINCGrids,
  Menus,DbButtons,KBitBtn, dxCntner, dxExEdtr, dxEdLib, dxDBELib, dxEditor,
  KinPickEdit,KGroupBox,KinQuery, frstatus, dxPageControl, dxTL, dxDBCtrl,
  dxDBGrid, KUpdateSql, dxDBTLCl, dxGrClms, KDataSetProvider, DBClient;

type
  TfrmBayonet = class(TForm)
    ToolPanel: TPanel;
    qryFind: TKADOQuery;
    qryTmp: TKADOQuery;
    ppmPrint: TPopupMenu;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel1: TBevel;
    Bevel6: TBevel;
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
    pgcBayonet: TdxPageControl;
    tbsBrowse: TdxTabSheet;
    btnBrowGl: TKBitBtn;
    btnBrowMx: TKBitBtn;
    btnPrint: TKBitBtn;
    Bevel3: TBevel;
    Bevel5: TBevel;
    qryCar: TKADOQuery;
    dtscar: TDataSource;
    udsCar: TKadoUpdateSql;
    qrycar0: TKADOQuery;
    dtscar0: TDataSource;
    grdbayonet: TdxDBGrid;
    conveno: TdxDBGridColumn;
    drivername: TdxDBGridColumn;
    arrivedate: TdxDBGridColumn;
    loadcomdate: TdxDBGridColumn;
    weightout: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    mitbayonet: TMenuItem;
    weightin: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    tbsEdit: TdxTabSheet;
    KGroupBox1: TKGroupBox;
    KGroupBox12: TKGroupBox;
    edtRemark: TdxDBMemo;
    KGroupBox6: TKGroupBox;
    GMSStickyLabel53: TGMSStickyLabel;
    GMSStickyLabel45: TGMSStickyLabel;
    GMSStickyLabel5: TGMSStickyLabel;
    edtdrivername: TdxDBEdit;
    edtdriveridcar: TdxDBEdit;
    edtconveno: TdxDBEdit;
    edtxszh: TdxDBEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    dtdarrivedate: TdxDBDateEdit;
    GMSStickyLabel46: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    edtweightin: TdxDBCalcEdit;
    timarrivedate: TdxDBTimeEdit;
    edtzhzl: TdxDBCalcEdit;
    timloadcomdate: TdxDBTimeEdit;
    dtdloadcomdate: TdxDBDateEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtweightout: TdxDBCalcEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    btnCheck: TKBitBtn;
    edtlocationbillno: TdxDBButtonEdit;
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
    procedure btnCopyClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pgcBayonetChange(Sender: TObject);
    procedure btnBrowGlClick(Sender: TObject);
    procedure btnBrowMxClick(Sender: TObject);
    procedure grdbayonetDblClick(Sender: TObject);

    procedure mitbayonetClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure edtlocationbillnoButtonClick(Sender: TObject;
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
    FindItem: TFindItem;               //查找
    strDate:string;
    SaveExit: Boolean;

    procedure WorkCall(CallMode:TDataState);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    procedure InitValues;
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
    m_blnPost: Boolean;//在Post状态
    procedure CreateParams(var Params: TCreateParams);override;
  end;

procedure WorkBayonet(callMode:TdataState=stBrowse;pstrJobno:string='');
var
  frmBayonet: TfrmBayonet;

implementation

{$R *.DFM}

uses datas,kindlg,main,libuser,GetUserRight,libuserPub,
  saveget,GetDllPub,datasTmp,linprint,BillnoSelect;
var
  strJobno:string;
procedure WorkBayonet(callMode:TdataState=stBrowse;pstrJobno:string='');
var
   month_start,month_end:TDate;
   year,month,day:word;
   Filtersql:string;
begin
   strJobno:=pstrJobno;
   {防止程序被重复执行}
   if frmBayonet<>nil then
   with frmBayonet do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmBayonet,frmBayonet);
   with frmBayonet do
   begin
      StrCheck       :=True;
      strDate:=IntToStr(Year)+iif(Month<10,'0'+IntToStr(Month),IntToStr(Month))
                    +iif(Day<10,'0'+IntToStr(Day),IntToStr(Day));
      sltPManagement:=TStringList.Create;
      sltSno:=TStringList.Create;
      m_blnPost:=True;
      FindItem:= TFindItem.Create;
      ScrollAfterEdit:=True;
      if _strsyscus='JJHY' then
      begin
         GMSStickyLabel1.caption:='货主';
         GMSStickyLabel5.caption:='品名';
      end;
      //lzw20110407
      decodedate(date,year,month,day);
      Month_Start:=encodedate(year,month,1);
      Month_End  :=IncMonth(Month_Start,1)-1;
      FilterSql:='';
      FilterSql:=' ((convert(datetime,convert(char(8),locationinoutcon.arrivedate,112)) >="'+datetostr(Month_Start)+'") '
                +'  and (convert(datetime,convert(char(8),locationinoutcon.arrivedate,112)) <="'+datetostr(Month_End)+'"))'
                +' or ((convert(datetime,convert(char(8),locationinoutcon.loadcomdate,112)) >="'+datetostr(Month_Start)+'") '
                +'  and (convert(datetime,convert(char(8),locationinoutcon.loadcomdate,112)) <="'+datetostr(Month_End)+'"))'

                ;
      with FindItem do
      begin
         Field.Add('2');
         operator.Add('3');
         value.Add(datetostr(Month_Start));
         Exp.Add('进卡口日期          大于等于      '+datetostr(Month_Start));
         Field.Add('2');
         operator.Add('4');
         value.Add(datetostr(Month_End));
         Exp.Add('进卡口日期          小于等于      '+datetostr(Month_End));
         Field.Add('3');
         operator.Add('3');
         value.Add(datetostr(Month_Start));
         Exp.Add('出卡口日期          大于等于      '+datetostr(Month_Start));
         Field.Add('3');
         operator.Add('4');
         value.Add(datetostr(Month_End));
         Exp.Add('出卡口日期          小于等于      '+datetostr(Month_End));
      end;

      strsql :=' select locationinoutcon.*,keyid=locationinoutcon.jobno++convert(varchar(4),locationinoutcon.sno)   '+chr(13)+chr(10)
              +'   from locationinoutcon(nolock)  '+chr(13)+chr(10)
              +'  where %where '+chr(13)+chr(10)
              +'    and isnull(iscon,"F")="F" ';

      qrycar0.Close;
      qrycar0.Sql.Clear;
      qrycar0.Sql.Add(strSql);
      qrycar0.MacroByName('Where').AsString:=''+FilterSql+'';
      qrycar0.Open;
      
      //Route 库
      strsql :=' select locationinoutcon.*    '+chr(13)+chr(10)
              +'   from locationinoutcon(nolock)  '+chr(13)+chr(10)
              +'  where jobno=:jobno '+chr(13)+chr(10)
              +'    and sno=:sno   '+chr(13)+chr(10)
              ;
      qrycar.Close;
      qrycar.Sql.Clear;
      qrycar.Sql.Add(strSql);
      qrycar.Open;

      WorkCall(stBrowse);
      Show;
   end;
end;

procedure TfrmBayonet.CreateParams(var Params: TCreateParams);
begin
  if strJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmBayonet.WorkCall(CallMode:TDataState);
{模块调用入口
   CallMode:调用状态
       stBrowse:浏览查看
       stInsert:新增
       stEdit:编辑修改
}
begin
   DataState:=CallMode;
   with frmBayonet do
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
            blnTzbz:=False;
            EnableEdit;
            qrycar0.Edit;
            qrycar.Edit;

            sltPManagement.clear;
            sltSno.Clear;
            maxSno:=0;
            
            LampChange(lsEdit);
         end;
       stInsert:
         begin
            blnTzbz:=False;
            qrycar0.Append;
            if not blnCopy then
               qrycar.Append;
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

//对提单号，工作号等信息进行判断
function TfrmBayonet.Gather:Boolean;
begin
   Result:=False;
   qrycar0.FieldByName('JOBNO').Asstring:= qrycar.FieldByName('JOBNO').Asstring;
   qrycar0.FieldByName('conveno').Asstring:= qrycar.FieldByName('conveno').Asstring;
   qrycar0.FieldByName('weightin').Asstring:= qrycar.FieldByName('weightin').Asstring;
   qrycar0.FieldByName('weightout').Asstring:= qrycar.FieldByName('weightout').Asstring;
   qrycar0.FieldByName('arrivedate').Asstring:= qrycar.FieldByName('arrivedate').Asstring;
   qrycar0.FieldByName('loadcomdate').Asstring:= qrycar.FieldByName('loadcomdate').Asstring;
   qrycar0.FieldByName('locationbillno').Asstring:= qrycar.FieldByName('locationbillno').Asstring;
   qrycar0.FieldByName('remark').Asstring:= qrycar.FieldByName('remark').Asstring;
   if edtconveno.text='' then
   begin
      Kmessagedlg('车牌号不能为空！', mtInformation,[mbOk],0);
      edtconveno.SetFocus;
      Exit;
   end;
   if edtdrivername.text='' then
   begin
      Kmessagedlg('司机姓名不能为空！', mtInformation,[mbOk],0);
      edtdrivername.SetFocus;
      Exit;
   end;

   result:=True;

end;

procedure TfrmBayonet.EnableEdit;
{修改数据状态，需ENABLE的动作}
var
   setDisable:TsetInt;
begin
   //控制允许修改
   setDisable:=[];
   LibComControl(Self,[1..5]+setDisable,[50]+[10..14]+[20]-setDisable);

end;

procedure TfrmBayonet.DisableEdit;
{修改数据状态，需ENABLE的动作}
var
  setDisable:TSetInt;
begin
//控制禁止修改
   setDisable:=[];
   if qrycar0.RecordCount=0 then
      setDisable:=setDisable+[2,4,5];
   libComControl(self,[10..14]+setDisable,[1..5]-setDisable);
end;

procedure TfrmBayonet.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
var
   setDisable:TsetInt;
begin
   setDisable:=[];
   libComControl(self,setDisable,[]);
end;

procedure TfrmBayonet.btnAddClick(Sender: TObject);
begin
   if pgcbayonet.ActivePage<>tbsEdit then
      pgcbayonet.ActivePage:=tbsEdit;
   ScrollAfterEdit:=True;
   SetDetailActive(False,True);
   WorkCall(stInsert);
   SetMasterDetailState(False);
end;

procedure TfrmBayonet.InitValues;
begin
   if blnCopy then //复制新增
   begin
      //
   end else //新增
   begin
      qrycar.Edit;
      qrycar.FieldByName('JOBNO').Asstring:= GenJobno('ZK');
      qrycar.FieldByName('arrivedate').AsDatetime:=GetServerDate;
      qrycar.FieldByName('iscon').Asstring:='F';
      qrycar.FieldByName('sno').AsInteger:=1;
      qrycar.FieldByName('userid').Asstring:=_userid;
      qrycar.FieldByName('username').Asstring:=_username;

   end;
end;
function TfrmBayonet.getJobno: string;
var
   StrDate:String;
   StrCusInvo:String;
begin
   decodedate(Now,Year,Month,Day);//分解当前日期
   opensql(datatmp.qryTmp,'select dhcx=max(convert(int,substring(docno1,7,5))) '
          +'                 from genjobno (NOLOCK)                            '
          +'                where substring(docno1,1,2)="ZK"                   '
          +'                  and substring(jobno,5,2)="ZK"                    '
          +'                  and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   Result:='ZK'+copy(datetostr(GetServerDate),1,4)+pad(inttostr(datatmp.qryTmp.fieldbyName('dhcx').Asinteger+1),5,'0',psLeft);
end;

procedure TfrmBayonet.btnRefreshClick(Sender: TObject);
var
  strConvecd:string;
begin
   strConvecd:=qrycar0.FieldByName('jobno').AsString;
   qrycar0.Close;
   qrycar0.Open;
   qrycar0.DisableControls;
   try
      qrycar0.locate('jobno',VarArrayOf([strConvecd]),[loCaseInsensitive, loPartialKey]);
   except
      qrycar0.Last;
   end;
   qrycar0.EnableControls;
end;

procedure TfrmBayonet.btnEditClick(Sender: TObject);
begin
   if pgcBayonet.ActivePage<>tbsEdit then
      pgcBayonet.ActivePage:=tbsEdit;
   if pos('L',qrycar.FieldByName('JOBNO').AsString)>0 then
   begin
      Kmessagedlg('该车辆已完成过磅,不能修改！', mtInformation,[mbOk],0);
      Exit;
   end;
   SetDetailActive(False,True);
   SetMasterDetailState(False);
   WorkCall(stEdit);
end;

procedure TfrmBayonet.btnDeleteClick(Sender: TObject);
begin
   if pgcbayonet.ActivePage<>tbsEdit then
      pgcbayonet.ActivePage:=tbsEdit;

   if KmessageDlg('该操作将删除该车辆信息，您确定要删除吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      SetDetailActive(false,true);
      SetMasterDetailState(False);

      _ADOConnection.StartTranSaction;
      try
         ExecSql(qryTmp,'Delete from locationinoutcon '
                       +' Where JOBNO="'+qrycar.FieldByName('JOBNO').AsString+'" '
                       +'   and sNO="'+qrycar.FieldByName('sNO').AsString+'" '
                       +'Delete from locationinoutconsku '
                       +' Where JOBNO="'+qrycar.FieldByName('JOBNO').AsString+'" '
                       +'   and sNO="'+qrycar.FieldByName('sNO').AsString+'" '
                        );
         ExecSql(qryTmp,'Delete from genjobno '+'Where JOBNO="'+qrycar.FieldByName('JOBNO').AsString+'" ');
         TdxDBGridNode(grdbayonet.FocusedNode).Delete;
         qrycar0.Applyupdates;
         _ADOConnection.Commit;
      except
         if _ADOConnection.InTransaction then
            _ADOConnection.RollBack;
      end;
      qrycar0.CommitUpdates;
      SetMasterDetailState(True);
      WorkCall(stBrowse);
      SetDetailActive(False,False);
      SetDetailActive(True,True);
   end;
end;


procedure TfrmBayonet.btnFindClick(Sender: TObject);
var
  Para:TFindPara;
begin
  Para:=TFindPara.Create;

  para.Tables.Add('locationinoutcon');

{0}  para.Field.Add('locationinoutcon.locationbillno');
{1}  para.Field.Add('locationinoutcon.conveno');
{2}  para.Field.Add('locationinoutcon.arrivedate');
{3}  para.Field.Add('locationinoutcon.loadcomdate');
  Para.Exp.Add('');

{0}  Para.Toptic.Add('仓单号');
{1}  Para.Toptic.Add('车牌号');
{2}  Para.Toptic.Add('进卡口时间');
{3}  Para.Toptic.Add('出卡口时间');

{0}  Para.Ftype.Add('C');
{1}  Para.Ftype.Add('C');
{2}  Para.Ftype.Add('D');
{3}  Para.Ftype.Add('D');

  Para.RField.Add('locationinoutcon.JOBNO');

  Para.OnGetValue:=FindGetValue;

  Dofind(qrycar0, qryFind, Para, TFindItem(nil));
end;

procedure TfrmBayonet.btnRefindClick(Sender: TObject);
begin
  DoReFind(qrycar0,qryFind);
end;

procedure TfrmBayonet.btnSaveClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then
   begin
     _ADOConnection.StartTransaction;
     try
        qrycar.Post;
        qrycar0.ApplyUpdates;
        qrycar.ApplyUpdates;
        ExecSql(dataTmp.qryTmp,' update genjobno set docno1="'+qrycar.FieldByName('conveno').AsString+'" '
                              +'  where jobno="'+qrycar.FieldByName('Jobno').AsString+'" '
               );

        _ADOConnection.Commit;
     except
       if _ADOConnection.InTransaction then
          _ADOConnection.Rollback;
       Raise;
       Exit;
     end;
     qrycar0.CommitUpdates;
     qrycar.CommitUpdates;
     ScrollAfterEdit:=False;
     SetMasterDetailState(True);     
     WorkCall(stBrowse);
     btnRefreshClick(sender);
   end;
end;

procedure TfrmBayonet.btnCancelClick(Sender: TObject);
begin
   if(Kmessagedlg(_strCancel,mtConfirmation,[mbyes,mbNo],0))=mrYes then
   begin
      if DataState=stInsert then
      ExecSql(dataTmp.qryTmp,' delete from genjobno '
                            +'  where jobno="'+qrycar.FieldByName('jobno').AsString+'" ');

      qrycar.CancelUpdates;
      qrycar0.CancelUpdates;

      WorkCall(stBrowse);
      SetMasterDetailState(True);
      btnRefreshClick(self);
   end;
end;

procedure TfrmBayonet.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmBayonet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DataState in setdcs then
      Action := caNone
   else
      Action := caFree;
end;

procedure TfrmBayonet.btnCopyClick(Sender: TObject);
begin
   if pgcbayonet.ActivePage<>tbsEdit then
      pgcbayonet.ActivePage:=tbsEdit;
   arrPManagement:=ScatterToArray(qrycar,True,0);
   blnCopy:=True;
   qrycar.DataSource:=nil;
   WorkCall(stInsert);
end;

procedure TfrmBayonet.btnFilterClick(Sender: TObject);
var
  Para:TFindPara;
  StrTmp:String;
begin
  Para:=TFindPara.Create;

  para.Tables.Add('locationinoutcon');

{0}  para.Field.Add('locationinoutcon.locationbillno');
{1}  para.Field.Add('locationinoutcon.conveno');
{2}  para.Field.Add('locationinoutcon.arrivedate');
{3}  para.Field.Add('locationinoutcon.loadcomdate');

  Para.Exp.Add('');

{0}  Para.Toptic.Add('仓单号');
{1}  Para.Toptic.Add('车牌号');
{2}  Para.Toptic.Add('进卡口时间');
{3}  Para.Toptic.Add('出卡口时间');


{0}  Para.Ftype.Add('C');
{1}  Para.Ftype.Add('C');
{2}  Para.Ftype.Add('D');
{3}  Para.Ftype.Add('D');

  Para.RField.Add('locationinoutcon.JOBNO');
 
  Para.OnGetValue:=FindGetValue;

  StrTmp:=DoFilter(Para, FindItem);
  if strTmp<>'null' then
  begin
    qrycar0.DisableControls;
    qrycar0.Close;
    if strTmp<>'' then
      qrycar0.MacroByName('Where').AsString:=strTmp
    else
      qrycar0.MacroByName('Where').AsString:=' 1=1 ';
    qrycar0.Open;
    qrycar0.EnableControls;
  end;
  WorkCall(stBrowse);
end;
function TfrmBayonet.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
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

procedure TfrmBayonet.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(KGroupBox6);
   SetGroupBox(KGroupBox1);
   SetGroupBox(KGroupBox12);
   SetDxDbGrid(grdbayonet);
   pgcbayonet.ActivePage:=tbsBrowse;
   qryTmp.Connection    :=_ADOConnection;
   qryFind.Connection   :=_ADOConnection;
   qrycar0.Connection    :=_ADOConnection;
   qrycar.Connection   :=_ADOConnection;
end;

procedure TfrmBayonet.FormDestroy(Sender: TObject);
begin
   LampChange(lsmenu);
   sltPManagement.free;
   sltSno.free;
   frmBayonet:=nil;
end;

procedure TfrmBayonet.pgcBayonetChange(Sender: TObject);
begin
  if pgcbayonet.ActivePage=tbsEdit then
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

procedure TfrmBayonet.btnBrowGlClick(Sender: TObject);
begin
  pgcbayonet.ActivePage:=tbsBrowse;
end;

procedure TfrmBayonet.btnBrowMxClick(Sender: TObject);
begin
  pgcbayonet.ActivePage:=tbsEdit;
end;

procedure TfrmBayonet.grdbayonetDblClick(Sender: TObject);
begin
   pgcbayonet.ActivePage:=tbsEdit;
end;

procedure TfrmBayonet.mitbayonetClick(Sender: TObject);
var
   lstPara:TStringList;
   weight:string;
begin
   if pgcbayonet.ActivePage<>tbsEdit then
      pgcbayonet.ActivePage:=tbsEdit;
   lstPara:=TStringList.Create;
   GenInformations(lstPara);
   //出货通知单
   //if qrycar0.FieldByName('locationbillno').AsString='出仓指令' then
   begin

      lstpara.Add('locationbillno='+qrycar.FieldByname('locationbillno').AsString);

      lstpara.Add('arrivedate='+qrycar.fieldbyname('arrivedate').asstring);
      lstpara.Add('loadcomdate='+qrycar.FieldByname('loadcomdate').AsString);

      lstPara.Add('conveno='+qrycar.fieldbyname('conveno').AsString);
      lstPara.Add('xszh='+qrycar.fieldbyname('xszh').AsString);//货主
      lstPara.Add('driveridcar='+qrycar.fieldbyname('driveridcar').AsString);//品名
      lstpara.Add('remark='+qrycar.FieldByname('remark').AsString);//批次

      lstpara.Add('weightin='+qrycar.FieldByname('weightout').AsString);
      lstpara.Add('weightout='+qrycar.FieldByname('weightin').AsString);
      weight:=FloatToStr(abs(qrycar.FieldByname('weightout').asfloat-qrycar.FieldByname('weightin').asfloat));

      lstpara.Add('weight='+weight);
      lstPara.Add('date='+datetostr(date));
      lstPara.Add('zdr='+_loginname);

      Worklinprint('100132','old','过磅单',qrycar,nil,nil,lstpara);
   end;
end;

procedure TfrmBayonet.SetMasterDetailState(blnConnect:Boolean);
begin
   if blnConnect then
   begin
      qrycar.DataSource       :=dtscar0;
   end else
   begin
      qrycar.DataSource       :=nil;
   end;
end;

procedure TfrmBayonet.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
  if blnPage then
  begin
    qrycar.Close;
    qrycar.Open;
  end else
  begin
    qrycar.Active    :=blnOpen;
  end;
end;

procedure TfrmBayonet.btnCheckClick(Sender: TObject);
begin
    if pgcbayonet.ActivePage<>tbsEdit then
   pgcbayonet.ActivePage:=tbsEdit;

   if edtlocationbillno.Text='' then Exit;

   if Pos('JC',edtlocationbillno.Text)>0 then
   begin
      OpenSql(datatmp.qryTmp,'select jobno from locationin(nolock) where locationbillno="'+edtlocationbillno.Text+'"');

      If datatmp.qryTmp.recordcount=0 then
      begin
         KMessageDlg('不存在该仓单号的车',mtWarning,[mbOK],0);
         edtlocationbillno.SetFocus;
         Exit;
      end else
      begin
         opensql(qrytmp,'select maxsno=max(sno)+1 from locationinoutcon(nolock) '
                       +' where Jobno="'+datatmp.qryTmp.FieldByName('Jobno').AsString+'" '+chr(13)+chr(10)
                            ) ;
         maxsno:=qryTmp.FieldByName('maxsno').AsInteger;

         ExecSql(qrytmp,'update locationinoutcon set      '
                       +'       jobno="'+datatmp.qryTmp.FieldByName('Jobno').AsString+'",sno='+inttostr(maxsno)+'  '
                       +' where jobno="'+qrycar.FieldByName('Jobno').AsString+'" '
                       +'   and jobno like "%ZK%"  '+chr(13)+chr(10)
                       +'   and isnull(iscon,"F")="F" '+chr(13)+chr(10)
                            );
         KMessageDlg('完成车辆更新',mtWarning,[mbOK],0);
      end;
   end else
   if Pos('CC',edtlocationbillno.Text)>0 then
   begin
      OpenSql(datatmp.qryTmp,'select jobno from locationout(nolock) where locationbillno="'+edtlocationbillno.Text+'"');

      If datatmp.qryTmp.recordcount=0 then
      begin
         KMessageDlg('不存在该仓单号的车',mtWarning,[mbOK],0);
         edtlocationbillno.SetFocus;
         Exit;
      end else
      begin
         opensql(qrytmp,'select maxsno=max(sno)+1 from locationinoutcon(nolock) '
                       +' where Jobno="'+datatmp.qryTmp.FieldByName('Jobno').AsString+'" '+chr(13)+chr(10)
                            ) ;
         maxsno:=qryTmp.FieldByName('maxsno').AsInteger;

         ExecSql(qrytmp,'update locationinoutcon set      '
                       +'       jobno="'+datatmp.qryTmp.FieldByName('Jobno').AsString+'",sno='+inttostr(maxsno)+'      '
                       +' where jobno="'+qrycar.FieldByName('Jobno').AsString+'" '
                       +'   and jobno like "%ZK%"  '+chr(13)+chr(10)
                       +'   and isnull(iscon,"F")="F" '+chr(13)+chr(10)
                            );
         KMessageDlg('完成车辆更新',mtWarning,[mbOK],0);                   
      end;
   end else
   begin
      KMessageDlg('不存在该仓单号的车',mtWarning,[mbOK],0);
      Exit;
   end; 
end;

procedure TfrmBayonet.edtlocationbillnoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   mulpSelect:TBillnoSelect;
begin
   mulpSelect:=Workbillnoselect;
   qrycar.edit;
   qrycar.FieldByName('locationbillno').AsString   :=mulpSelect.locationbillno ;
end;

end.
