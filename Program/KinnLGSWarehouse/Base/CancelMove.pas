unit CancelMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmCancelMove = class(TForm)
    ToolPanel: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    btnEdit: TKBitBtn;
    btnAdd: TKBitBtn;
    btnDelete: TKBitBtn;
    btnSave: TKBitBtn;
    btnCancel: TKBitBtn;
    btnClose: TKBitBtn;
    btncopy: TKBitBtn;
    btnCheck: TKBitBtn;
    btnPrint: TKBitBtn;
    pgcMain: TdxPageControl;
    tbsEdit: TdxTabSheet;
    ppmFilter: TPopupMenu;
    mitFilterActive: TMenuItem;
    popMoveLocOld: TPopupMenu;
    mitAddLocOld: TMenuItem;
    mitDelLocOld: TMenuItem;
    N1: TMenuItem;
    btnPaste: TKBitBtn;
    KGroupBox2: TKGroupBox;
    RxSplitter1: TRxSplitter;
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
    udsMoveLocOld: TKadoUpdateSql;
    dtsMoveLocOld: TDataSource;
    qryMoveLocOld: TKADOQuery;
    udsMoveloc: TKadoUpdateSql;
    dtsMoveLoc: TDataSource;
    qryMoveLoc: TKADOQuery;
    dtsML: TDataSource;
    qryML: TKADOQuery;
    grdMoveLocOld: TdxDBGrid;
    qryselect: TKADOQuery;
    salver: TdxDBGridColumn;
    KGroupBox5: TKGroupBox;
    lblfind: TGMSStickyLabel;
    cmbchoice: TKinPickEdit;
    edtmainorder: TdxEdit;
    edtskuname: TdxButtonEdit;
    edtlocname: TdxButtonEdit;
    btnQuery: TKBitBtn;
    cmbShipAccID: TdxButtonEdit;
    cmbstockno: TdxEdit;
    quantitynew: TdxDBGridCurrencyColumn;
    btnOK: TKBitBtn;
    jobnoin: TdxDBGridColumn;
    snoin: TdxDBGridColumn;
    ldsnoin: TdxDBGridColumn;
    detailsnoin: TdxDBGridColumn;
    skuid: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    serialno: TdxDBGridColumn;
    quantity: TdxDBGridColumn;
    sealno: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    sno: TdxDBGridColumn;
    locname: TdxDBGridColumn;
    newlocname: TdxDBGridButtonColumn;
    btncancell: TKBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure PieceOldValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure newlocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure qryMoveLocOldAfterPost(DataSet: TDataSet);
    procedure grdMoveLocOldEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure grdMoveLocOldEnter(Sender: TObject);
    procedure grdMoveLocOldExit(Sender: TObject);
    procedure grdMoveLocOldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NewlocidButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbShipAccIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipAccIDExit(Sender: TObject);
    procedure cmbShipAccIDExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtlocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtlocnameExit(Sender: TObject);
    procedure edtlocnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure edtskunameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtskunameExit(Sender: TObject);
    procedure edtskunameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure btnQueryClick(Sender: TObject);
    procedure cmbchoiceExit(Sender: TObject);
    procedure cmbchoiceChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncancellClick(Sender: TObject);
    procedure newlocnameValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
  private
    { Private declarations }
    //变量定义
    strMLjobno:string;                 //重新取得工作号
    blnCopy,blnSelect:Boolean;
    strJobno:string;
    DataState:TDataState;
    mode:TDataState;             //进入form状态模式
    strsql,FilterSql,strFilter: string;
    FindItem: TFindItem;          //是否需要查找
    setDisable:TsetInt;
    arrml,arrMoveLoc,arrMoveLocOld,arrMoveLocNew:Variant;//用于数据复制
    ScrollAfterEdit:Boolean;           //判断主库记录是否移动
    m_blnPost: Boolean;//在Post状态
    strDel_New:string;//目标仓位删除,记录删除序号
    strGetCd:String;
    exPiecepro:Extended;

    //过程定义
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
    procedure pgcRelocationChange(Sender: TObject);
    procedure GetSql;
    //费率控制过程
  public
    { Public declarations }
    maxMLOldSno,maxMLNewSno:Integer;
    blnSavePost:Boolean;
    strDel_detail:string;//记录商品明细删除,datas中.
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure WorkCancelMove;

var
  frmCancelMove: TfrmCancelMove;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect;

var strpJobno,strClassID,strZsql,strMxpjbz:string;

procedure WorkCancelMove;
{入口函数
  CallMode   :进入form状态模式
  pstrJobno  :定位Jobno
  pDataBaseID:定位DataBaseID
  pItemOrDetail  :进出标志 I 任务 D 实际
}
var
  year,month,day:word;
  month_start,month_end:TDate;
begin
   if frmCancelMove <> nil then
   with frmCancelMove do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmCancelMove:=TfrmCancelMove.Create(application);

   with frmCancelMove do
   begin
     btnOK.Enabled:=false;
   {初始化所有数据集}
      //初始化变量
    {  ToolPanel.Visible:=False;
      blnCopy        :=False;             //系统默认不复制新增
      FindItem       :=TFindItem.Create;
      sltselect      :=TStringList.Create;
      mode           :=CallMode;
      strJobno       :=pJobno;
      blnSavePost:=False;
      ScrollAfterEdit:=True;
      exPiecepro:=0;

      //初始化
      strsql  :=' select jobno,taskdate,locationbillno,operationtype,havemov ,'+chr(13)+chr(10)
               +'        userid,username,iuserid,iusername,locnameold,locnamenew,'+chr(13)+chr(10)
               +'        createname,createdate,operationname,operationdate,skuname,'+chr(13)+chr(10)
               +'        quantity,piece,costcusname,checkname,countname,transfername,transferdate,confirmed'+chr(13)+chr(10)
               +'  from moveloc(nolock) '+chr(13)+chr(10)
               +'  where 1=1 '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
                 ' and (moveloc.userid in '+_Useridcan+' or moveloc.iuserid in '+_Useridcan+') ',
                 ' and (moveloc.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
                +'    or moveloc.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)
               +'    and (%where) '+chr(13)+chr(10)
               +iif(strjobno<>'','and jobno="'+strjobno+'"','');
      qryML.Close;
      qryML.SQL.Clear;
      qryML.SQL.Add(strsql);

      strsql :=' select loc.* '+chr(13)+chr(10)
              +'    from moveloc loc '+chr(13)+chr(10)
              +'   where jobno=:jobno ';
      qryMoveLoc.Close;
      qryMoveLoc.SQL.Clear;
      qryMoveLoc.SQL.Add(strsql);     

      strsql :=' select old.*,sku.skumodel,sku.skuspec,sku.piecepro '+chr(13)+chr(10)
              +'    from movelocold old,sku '+chr(13)+chr(10)
              +'   where 1=1  '
              +'     and sku.skuid=old.skuid '
              +'     and jobno=:jobno ';
      qryMoveLocOld.Close;
      qryMoveLocOld.SQL.Clear;
      qryMoveLocOld.SQL.Add(strsql);

   //假主库过滤条件
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
        FilterSql:=' (convert(datetime,convert(char(8),MoveLoc.operationdate,112)) >="'+datetostr(Month_Start)+'") '
                  +'  and (convert(datetime,convert(char(8),MoveLoc.operationdate,112)) <="'+datetostr(Month_End)+'")';
        with FindItem do
        begin
           Field.Add('1');
           operator.Add('3');
           value.Add(datetostr(Month_Start));
           Exp.Add('计划日期          大于等于      '+datetostr(Month_Start));
           Field.Add('1');
           operator.Add('4');
           value.Add(datetostr(Month_End));
           Exp.Add('计划日期          小于等于      '+datetostr(Month_End));
        end;
      end else FilterSql:='';

//      qryML.MacroByName('Where').AsString:=iif(FilterSql<>'',FilterSql,' 1=1');

  // 界面显示过程
      qryML.open;
      if strJobno<>'' then
      qryML.locate('Jobno',VarArrayOf([strJobno]),[loCaseInsensitive, loPartialKey]);
      if UpperCase(_Loginid)<>'SYSTEM' then
         SetButtonEnabled(ToolPanel,'mitMoveLocation',trim(_userorgid));//设置按钮的有效性
      WorkCall(stBrowse);
      }
      {激活FORM}
      {if strJobno<>'' then
      begin
         ShowModal;
         Free;
      end else Show; }
      Show;
   end;
end;

procedure TfrmCancelMove.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior+[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=False;
  grdMoveLocOld.ClearGroupColumns;
end;

procedure TfrmCancelMove.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  if qryMl.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior-[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=True;
end;

procedure TfrmCancelMove.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmCancelMove.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{设置从库query的active
 blnPage是否需要页面控制
 blnOpen是否open(若设置成False时blnReOpen一定要为False)
 blnReOpen是否需要重新Open
}
begin
   if not ScrollAfterEdit and blnOpen then
   begin
     if qryMoveLoc.Active then
     begin
        qryMoveLoc.Close;
        qryMoveLoc.Open;
     end;
     if qryMoveLocOld.Active then
     begin
        qryMoveLocOld.Close;
        qryMoveLocOld.Open;
     end;
     ScrollAfterEdit:=True;
   end;

   if not blnPage then
   begin
      qryMoveLoc.Active     :=blnOpen;
      qryMoveLocOld.Active  :=blnOpen;
   end else
   begin
      qryMoveLoc.Active     :=blnOpen;
      qryMoveLocOld.Active  :=blnOpen;
   end;
end;

procedure TfrmCancelMove.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmCancelMove.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {if (DataState in setdcs) and not _AllowClose then Action := caNone else
  begin
    Action := caFree;
    lampchange(lsmenu);
  end; }
    Action := caFree;
    lampchange(lsmenu);
end;

procedure TfrmCancelMove.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox2);
  SetDxDbGrid(grdMoveLocOld);
  qryml.Connection:=_adoconnection;
  qrymoveloc.Connection:=_adoconnection;
  qrymovelocold.connection:=_adoconnection;
  qryselect.connection:=_adoconnection;
end;

procedure TfrmCancelMove.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
  if Key=Vk_F4 then
  begin
//    pgcMoveLoc.ActivePage := tbsLocInfo;

  end;
  if DataState = stBrowse then
  begin
    case Key of
      VK_F3:
        if pgcMain.ActivePage=tbsEdit then
        begin
//          pgcMain.ActivePage:=tbsBrowse;
        end else
        begin
          pgcMain.ActivePage:=tbsEdit;
        end;


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

procedure TfrmCancelMove.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryMoveLocOld.Close;
  qryMoveLoc.Close;
  qryML.Close;
  frmCancelMove:=nil;  
end;

procedure TfrmCancelMove.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmCancelMove.PieceOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   pieceOldValue:Extended;
begin
end;

procedure TfrmCancelMove.newlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         qrymovelocold.edit;
         qrymovelocold.FieldByName('NewLocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         qrymovelocold.FieldByName('NewLocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
end;

procedure TfrmCancelMove.GetSql;
var
   I:integer;
   strFilterConno:String;
begin
   strFilter:='';
   strFilterconno:='';
   if edtskuname.Text<>'' then strFilter:=strFilter+' and movelocold.skuid="'+edtskuname.Textfield+'" ';
   if edtlocname.Text<>'' then
   begin
      if cmbchoice.itemindex=2 then
         strFilter:=strFilter+' and movelocold.locid like "'+edtlocname.Textfield+'%" '
      else
         strFilter:=strFilter+' and movelocold.newlocid like "'+edtlocname.Textfield+'%" ';
   end;
   if edtmainorder.Text<>'' then strFilter:=strFilter+'  and movelocold.mainorder="'+edtmainorder.Text+'")';

   if cmbstockno.Text<>'' then
      if cmbchoice.itemindex=5 then
         strFilter:=strFilter+' and movelocold.sealno="'+cmbstockno.Text+'" '
      else
         strFilter:=strFilter+' and movelocold.salver="'+cmbstockno.Text+'" '
end;

procedure TfrmCancelMove.qryMoveLocOldAfterPost(DataSet: TDataSet);
begin
  if qryMoveLocOld.fieldbyname('SKUID').asstring='' then
  begin
    qryMoveLocOld.Delete;
  end;
end;

procedure TfrmCancelMove.grdMoveLocOldEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=false;
     { with grdMoveLocOld do
      begin
        if (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='SNO') or
           (UpperCase(Columns[GetFocusedAbsoluteIndex(FocusedColumn)].FieldName)='QuantityOld') or
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
      end;}
end;

procedure TfrmCancelMove.grdMoveLocOldEnter(Sender: TObject);
begin
//   if (DataState in setdcs) and (qryMoveLocOld.IsEmpty=True) then
   {if  (qryMoveLocOld.IsEmpty=True) then
   begin
      mitAddLocOldClick(Sender);
   end;
   }
end;

procedure TfrmCancelMove.grdMoveLocOldExit(Sender: TObject);
begin
   {with TdxDBGrid(Sender) do
   try
      if Datalink.DataSet.State in  [dsInsert,dsEdit] then
      begin
         Datalink.DataSet.Post;
      end;
   except
      SetFocus;
      raise;
   end;
   }
end;

procedure TfrmCancelMove.grdMoveLocOldKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  with TdxDBGrid(Sender) do
  begin
//    if DataState in Setdcs then
//    begin
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
//    end;
  end;
end;

procedure TfrmCancelMove.NewlocidButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
//   if (DataState in Setdcs) then
//   begin
   qrySelect:=pGetLocationSelect('','','','');
      if qrySelect.FieldByName('LocID').AsString<>'NO' then
      begin
         qryMoveLocOld.edit;
         qryMoveLocOld.FieldByName('NewLocID').AsString  :=qrySelect.FieldByName('LocID').asstring;
         qryMoveLocOld.FieldByName('NewLocName').AsString  :=qrySelect.FieldByName('LocName').asstring;
      end;
      FreeAndNil(qrySelect);
//   end;
end;

procedure TfrmCancelMove.cmbShipAccIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      cmbShipAccID.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      cmbShipAccID.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCancelMove.cmbShipAccIDExit(Sender: TObject);
begin
   if cmbShipAccID.Text='' then cmbShipAccID.TextField:='';
end;

procedure TfrmCancelMove.cmbShipAccIDExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if cmbShipAccID.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 cusid,cusname from customer where cusname like "%"+"'+trim(cmbShipAccID.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         cmbShipAccID.Text:=datatmp.qryTmp.fieldbyname('cusname').asstring;
         cmbShipAccID.Textfield:=datatmp.qryTmp.fieldbyname('cusid').asstring;
      end else
      begin
         qrySelect:=pGetCustomerSelect('E','');
         if qrySelect.FieldByName('cusid').AsString<>'NO' then
         begin
            cmbShipAccID.TextField  :=qrySelect.FieldByName('cusid').asstring;
            cmbShipAccID.Text       :=qrySelect.FieldByName('cusname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCancelMove.edtlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOquery;
begin
    qrySelect:=pGetLocationSelect('','','');
    if qrySelect.FieldByName('locid').AsString<>'NO' then
    begin
//       cmbLocationID.TextField  :=qrySelect.FieldByName('classid').asstring;
       edtlocname.TextField  :=qrySelect.FieldByName('locid').asstring;
       edtlocname.Text  :=qrySelect.FieldByName('locname').asstring;
    end;
    FreeAndNil(qrySelect);
end;

procedure TfrmCancelMove.edtlocnameExit(Sender: TObject);
begin
  if edtlocname.Text='' then edtlocname.TextField:='';
end;

procedure TfrmCancelMove.edtlocnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtlocname.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+trim(edtlocname.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         edtlocname.Text:=datatmp.qryTmp.fieldbyname('locname').asstring;
         edtlocname.Textfield:=datatmp.qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            edtlocname.TextField  :=qrySelect.FieldByName('locid').asstring;
            edtlocname.Text       :=qrySelect.FieldByName('locname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCancelMove.edtskunameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=PGetSKUSelect('','','A');
   if qrySelect.IsEmpty<>true then
   begin
      qrySelect.First;
      edtskuname.TextField:=qrySelect.fieldbyname('classid').asString;
      edtskuname.Text     :=qrySelect.fieldbyname('SKUName').asString;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCancelMove.edtskunameExit(Sender: TObject);
begin
   if edtskuname.Text=''  then
   begin
      edtskuname.TextField:='';
   end;
end;

procedure TfrmCancelMove.edtskunameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtskuname.Text<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 classid,skuid,skuname from sku where skuname like "%"+"'+trim(edtskuname.Text)+'"+"%"') ;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         edtskuname.Text:=datatmp.qryTmp.fieldbyname('skuname').asstring;
         edtskuname.Textfield:=datatmp.qryTmp.fieldbyname('skuid').asstring;
      end else
      begin
         qrySelect:=PGetSKUSelect('','','A');
         if qrySelect.FieldByName('classid').AsString<>'NO' then
         begin
            edtskuname.TextField  :=qrySelect.FieldByName('skuid').asstring;
            edtskuname.Text       :=qrySelect.FieldByName('skuname').asstring;
         end else failed:=true;
         FreeAndNil(qrySelect);
      end;
   end;
end;

procedure TfrmCancelMove.btnQueryClick(Sender: TObject);
begin
   GetSql;
   strzsql:=' select jobno,sno,jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno,shippercusid,  '+chr(13)+chr(10)
           +'        quantity,locid,locname,newlocid,newlocname,quantitynew,                           '+chr(13)+chr(10)
           +'        salver,currcd,price,operationtype,iuserid,iusername,userid,username               '+chr(13)+chr(10)
           +'   from movelocold(nolock)         '
           +' where isnull(confirmed,"F")="T"   '
           +strFilter
           ;
   qryMoveLocOld.Close;
   qryMoveLocOld.SQL.Clear;
   qryMoveLocOld.SQL.Add(strZsql);
  // qryMoveLocOld.DisableControls;
   qryMoveLocOld.Open;
   btnOK.Enabled:=true;


end;

procedure TfrmCancelMove.cmbchoiceExit(Sender: TObject);
begin
   if cmbchoice.Text='品    名' then
   begin
      edtskuname.Visible:=true;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='主订单号' then
   begin
      edtskuname.Visible:=false;
      edtmainorder.Visible:=true;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='源 仓 位' then
   begin
      edtskuname.Visible:=false;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=True;
      cmbstockno.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='新 仓 位' then
   begin
      edtskuname.Visible:=false;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=True;
      cmbstockno.Visible:=False;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='货    主' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=False;
      cmbShipAccID.Visible:=true;
   end else
   if cmbchoice.Text='源托盘号' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=true;
      cmbShipAccID.Visible:=False;
   end else
   if cmbchoice.Text='新托盘号' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=true;
      cmbShipAccID.Visible:=False;
   end;
end;

procedure TfrmCancelMove.cmbchoiceChange(Sender: TObject);
begin
   edtskuname.Text:='';
   edtskuname.TextField:='';
   edtmainorder.Text:='';
   edtlocname.Text :='';
   edtlocname.TextField:='';
   cmbstockno.Text:='';
   cmbShipAccID.Text:='';
   cmbShipAccID.TextField:='';
end;

procedure TfrmCancelMove.btnOKClick(Sender: TObject);
var
  strlocbillno:string;
begin

   try
      while True do
      begin
         try
            _ADOConnection.Starttransaction;
            ExecSql(dataTmp.qryTmp,'create table #movlocold ( '+chr(13)+chr(10)
                                  +'       jobnomov      varchar(20) null,'+chr(13)+chr(10)
                                  +'       snomov        smallint null,'+chr(13)+chr(10)
                                  +'       jobnoin       varchar(20) null,'+chr(13)+chr(10)
                                  +'       snoin         smallint null,'+chr(13)+chr(10)
                                  +'       ldsnoin       smallint      null,'+chr(13)+chr(10)
                                  +'       detailsnoin   smallint  null,'+chr(13)+chr(10)
                                  +'       quantity      numeric(16,4) null,'+chr(13)+chr(10)
                                  +'       locid         varchar(20) null,'+chr(13)+chr(10)
                                  +'       locname       varchar(20) null,'+chr(13)+chr(10)
                                  +'       newlocid      varchar(20) null,'+chr(13)+chr(10)
                                  +'       newlocname    varchar(20) null,'+chr(13)+chr(10)
                                  +'       quantitynew   numeric(16,4) null,'+chr(13)+chr(10)
                                  +'       salver        varchar(20) null,'+chr(13)+chr(10)
                                  +'       sealno        varchar(20) null)'+chr(13)+chr(10)
                   );
            qryMoveLocOld.First;
            while not qryMoveLocOld.Eof do
            begin
                ExecSql(dataTmp.qryTmp,'insert into #movlocold(jobnomov,snomov,jobnoin,snoin,ldsnoin,detailsnoin,         '+chr(13)+chr(10)
                                      +'                      quantity,locid,locname,newlocid,newlocname,quantitynew,                                                '+chr(13)+chr(10)
                                      +'                      salver,sealno)  '
                                      +' values( '
                                      +'        "'+qryMoveLocOld.FieldByName('jobnoin').asstring+'",'
                                      +'        '+qryMoveLocOld.FieldByName('sno').asstring+','
                                      +'        "'+qryMoveLocOld.FieldByName('jobnoin').asstring+'",'
                                      +'        '+qryMoveLocOld.FieldByName('snoin').asstring+','
                                      +'        '+qryMoveLocOld.FieldByName('ldsnoin').asstring+','
                                      +'        '+qryMoveLocOld.FieldByName('detailsnoin').asstring+','
                                      +'        '+floattostr(qryMoveLocOld.FieldByName('quantity').asfloat)+','
                                      +'        "'+qryMoveLocOld.FieldByName('locid').asstring+'",'
                                      +'        "'+qryMoveLocOld.FieldByName('locname').asstring+'",'
                                      +'        "'+qryMoveLocOld.FieldByName('newlocid').asstring+'",'
                                      +'        "'+qryMoveLocOld.FieldByName('newlocname').asstring+'",'
                                      +'        '+floattostr(qryMoveLocOld.FieldByName('quantitynew').asfloat)+','
                                      +'        "'+qryMoveLocOld.FieldByName('salver').asstring+'",'
                                      +'        "'+qryMoveLocOld.FieldByName('sealno').asstring+'"'
                                      +')');
               qryMoveLocOld.Next;
            end;
            ExecSql(dataTmp.qryTmp,'ksp_cancelMoveloc  ');
            ExecSql(dataTmp.qryTmp,' update moveloc '+chr(13)+chr(10)
                                  +'    set confirmed="F" '+chr(13)+chr(10)
                                  +'  from #movelocold'+chr(13)+chr(10)
                                  +' where #movelocold.jobnomov=moveloc.jobno'+chr(13)+chr(10)
                                  +' update movelocold '+chr(13)+chr(10)
                                  +'    set confirmed="F" '+chr(13)+chr(10)
                                  +'  from #movelocold'+chr(13)+chr(10)
                                  +' where #movelocold.jobnomov=moveloc.jobno'+chr(13)+chr(10)
                                  +'   and #movelocold.snomov=moveloc.jobno'+chr(13)+chr(10)
                                  );
             droplsk('#movelocold');                     
            _ADOConnection.Commit;

            KMessageDlg('移仓操作完成!',mtInformation,[mbOK],0);
            frmCancelMove.btnQueryClick(Sender);
            Exit;

            Break;
         except
            _ADOConnection.Rollback; //先结束事务
            begin
               raise;
               exit;
            end;
         end;
      end;
   except
      while not qryMoveLocOld.Eof do
      begin
         qryMoveLocOld.Delete;
      end;
   end;
   qryMoveLocOld.DisableControls;
   arrMoveLocOld:=ScatterToArray(qryMoveLocOld,False,0);
   qryMoveLocOld.applyupdates;

   droplsk('#skudetail');
   qryMoveLocOld.CommitUpdates;
   qryMoveLocOld.EnableControls;
   ScrollAfterEdit:=False;
  // WorkCall(stInsert);
end;

procedure TfrmCancelMove.btncancellClick(Sender: TObject);
begin
   frmCancelMove.Close;
end;

procedure TfrmCancelMove.newlocnameValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if grdMoveLocOld.InplaceEditor.GetEditingText<>'' then
   begin
      opensql(datatmp.qryTmp,'select top 1 locid,locname from location where locname like "%"+"'+trim(grdMoveLocOld.InplaceEditor.GetEditingText)+'"+"%"') ;
      qryMoveLocOld.Edit;
      if datatmp.qryTmp.RecordCount>0 then
      begin
         qryMoveLocOld.FieldByName('newlocname').AsString:=datatmp.qryTmp.fieldbyname('locname').asstring;
         qryMoveLocOld.FieldByName('newlocid').AsString:=datatmp.qryTmp.fieldbyname('locid').asstring;
      end else
      begin
         qrySelect:=pGetLocationSelect('T','','');
         if qrySelect.FieldByName('locid').AsString<>'NO' then
         begin
            qryMoveLocOld.FieldByName('newlocid').AsString  :=qrySelect.FieldByName('locid').asstring;
            qryMoveLocOld.FieldByName('newlocname').AsString  :=qrySelect.FieldByName('locname').asstring;
         end else Accept:=False;
         FreeAndNil(qrySelect);
      end;
   end;
end;

end.
