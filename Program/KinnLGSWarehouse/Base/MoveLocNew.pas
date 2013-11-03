unit MoveLocNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, DBKINCGrids, KSText, KGroupBox,
  DBCtrls, ComCtrls, frstatus, KinPickEdit, dxCntner, dxEditor, StdCtrls,
  GMSLabel, dxTL, dxDBCtrl, dxDBGrid, dxPageControl, KBitBtn, DbButtons,
  ExtCtrls, DB, KinQuery, DBTables, libProc ,libUser, Menus,
  dxDBTLCl, dxGrClms, RXSplit,KDataSetProvider, DBClient ;

type
  TfrmMoveLocNew = class(TForm)
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
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure mitAddLocOldClick(Sender: TObject);
    procedure mitDelLocOldClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure grdMovelocDblClick(Sender: TObject);
    procedure grdMovelocCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
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
    function  FindGetValue(pField: Integer; pItems, pItemFields: TStrings): Boolean;
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

procedure WorkMoveLocNew(CallMode:TDataState;pJobno:string='';pItemOrDetail:string='');

var
  frmMoveLocNew: TfrmMoveLocNew;

implementation

{$R *.dfm}

Uses Main, kindlg, Saveget, datas,GetUserRight,libuserPub,LocationSKUSelect,GetDllPub,
     datasTmp,LocOutSKUDetail,GetLocation, MoveLoc, datasSelect;

var strpJobno,strClassID,strZsql,strMxpjbz:string;

procedure WorkMoveLocNew(CallMode:TDataState;pJobno:string='';pItemOrDetail:string='');
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
   strpJobno:=pJobno;
   if frmMoveLocNew <> nil then
   with frmMoveLocNew do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   frmMoveLocNew:=TfrmMoveLocNew.Create(application);

   with frmMoveLocNew do
   begin
     btnOK.Enabled:=false;
     strsql :=' select old.*,sku.skumodel,sku.skuspec,sku.piecepro '+chr(13)+chr(10)
             +'    from movelocold old,sku '+chr(13)+chr(10)
             +'   where 1=2  ';
     qryMoveLocOld.Close;
     qryMoveLocOld.SQL.Clear;
     qryMoveLocOld.SQL.Add(strsql);
     qryMoveLocOld.Open;
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

procedure TfrmMoveLocNew.EnableEdit;
begin
  setDisable:=[];
  LibComControl(Self,[1..4]+setDisable,[10..15]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior+[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB+[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=False;
  grdMoveLocOld.ClearGroupColumns;
end;

procedure TfrmMoveLocNew.DisableEdit;
{查看数据状态，需DISABLE的动作}
begin
  setDisable:=[];
  if qryMl.RecordCount=0 then setDisable:=setDisable+[2,4];
  libComControl(self,[10..15]+setDisable,[1..4]-setDisable);

  grdMoveLocOld.OptionsBehavior:=grdMoveLocOld.OptionsBehavior-[edgoEditing];
  grdMoveLocOld.OptionsDB:=grdMoveLocOld.OptionsDB-[edgoCanAppend,edgoCanInsert];
  grdMoveLocOld.ShowGroupPanel:=True;
end;

procedure TfrmMoveLocNew.DisableBrowse;
{查看数据状态，记录移动时，需ENABLE或DISABLE的动作}
begin
//
end;

procedure TfrmMoveLocNew.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
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

procedure TfrmMoveLocNew.CreateParams(var Params: TCreateParams);
begin
  if strpJobno<>'' then
  begin
    self.Formstyle := fsNormal;
    self.Visible := False;
    self.Position := poScreenCenter;
  end;
  inherited CreateParams(Params);
end;

procedure TfrmMoveLocNew.FormClose(Sender: TObject;
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

procedure TfrmMoveLocNew.FormCreate(Sender: TObject);
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

procedure TfrmMoveLocNew.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmMoveLocNew.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  Application.onShowhint := nil;
  qryMoveLocOld.Close;
  qryMoveLoc.Close;
  qryML.Close;
  frmMoveLocNew:=nil;  
end;

procedure TfrmMoveLocNew.pgcRelocationChange(Sender: TObject);
begin
//
end;

procedure TfrmMoveLocNew.btnSaveClick(Sender: TObject);
{var
   strCreateID,strJobno,strlocationbillno:string;
   blnSuc:Boolean; }
begin
{   blnSuc:=true;
   if (DataState in Setdcs) and Gather then  //新增或编辑存盘
   begin
      try
         while True do
         begin
            try
//               qryml.DisableControls;
               _ADOConnection.Starttransaction;
               arrMoveLoc:=ScatterToArray(qryMoveLoc,true,0);
               qryMoveLoc.ApplyUpdates;
               Break;
            except
               _ADOConnection.Rollback; //先结束事务
               begin
                  raise;
                  //qryML.EnableControls;
                  exit;
               end;
            end;
         end;
         end;

         qryMoveLocOld.DisableControls;
         arrMoveLocOld:=ScatterToArray(qryMoveLocOld,False,0);
         qryMoveLocOld.applyupdates;
      except
         blnSavePost:=True;
         m_blnPost := True;

         strJobno     :=qryML.FieldByName('Jobno').AsString;

         qryMoveLoc.Delete;

         GatherFromArray(qryMoveLoc,arrMoveLoc,false);
         qryMoveLocOld.First;
         while not qryMoveLocOld.Eof do
         begin
            qryMoveLocOld.Delete;
         end;

         GatherFromArray(qryMoveLocOld,arrMoveLocOld,true);
         qryMoveLocOld.post;
         qryMoveLocOld.EnableControls;
         blnSavePost:=False;
         m_blnPost := False;
         try
            if _ADOConnection.InTransaction then _ADOConnection.rollback;
         except
         end;
         raise;
         exit;
      end;
      qryML.CommitUpdates;
      qryMoveLoc.CommitUpdates;
      qryMoveLocOld.CommitUpdates;

      qryMoveLocOld.EnableControls;
      //qryML.EnableControls;
      ScrollAfterEdit:=False;
      WorkCall(stBrowse);
   end;  }
end;

procedure TfrmMoveLocNew.btnCancelClick(Sender: TObject);
begin
   {if Kmessagedlg(_strCancel, mtWarning, [mbYes, mbNo], 0) = mrNo then
      Exit;
   if DataState=stinsert then
      ExecSql(dataTmp.qryTmp, 'delete from genjobno where jobno="' +
         qryML.FieldByName('jobno').AsString + '" ');
   edtmainorder.Text:='';
   cmbShipAccID.Text:='';
   cmbShipAccID.TextField:='';
   edtlocname.Text:='';
   edtlocname.TextField:='';
   edtskuname.Text:='';
   edtskuname.TextField:='';
   cmbstockno.Text:='';
   qryMoveLocOld.CancelUpdates;
   qryMoveLoc.CancelUpdates;
   qryML.CancelUpdates; }
   //WorkCall(stBrowse);
end;

function TfrmMoveLocNew.FindGetValue(pField:Integer;pItems,pItemFields:TStrings):Boolean;
var
   qrySelect:TKADOQuery;
begin
   Result:=True;
   case pField of
      2:
       begin
//
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

procedure TfrmMoveLocNew.mitAddLocOldClick(Sender: TObject);
begin
   grdMoveLocOld.SetFocus;
   qryMoveLocOld.Append;
//   grdMoveLocOldbeforeInsert;
end;

procedure TfrmMoveLocNew.mitDelLocOldClick(Sender: TObject);
begin
  { if qryMoveLocOld.FieldByName('sno').AsInteger<>0 then
   if Kmessagedlg(_strdel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      grdMoveLocOld.setfocus;
      if sltselect.IndexOf(qryMoveLocOld.fieldbyname('jobnoin').AsString+
                            qryMoveLocOld.fieldbyname('snoin').AsString+
                            qryMoveLocOld.fieldbyname('ldsnoin').AsString)<>-1 then
         sltselect.Delete(sltselect.IndexOf(qryMoveLocOld.fieldbyname('jobnoin').AsString+
                          qryMoveLocOld.fieldbyname('snoin').AsString+
                          qryMoveLocOld.fieldbyname('ldsnoin').AsString));

      qryMoveLocOld.delete;
   end; }
end;

procedure TfrmMoveLocNew.btnPasteClick(Sender: TObject);
begin
  { opensql(dataTmp.qryTmp,'select confirmed from MoveLoc '
                         +' where jobno="'+qryML.fieldbyname('jobno').AsString+'"');
   if dataTmp.qryTmp.FieldByName('confirmed').AsString='T' then
   begin
      KMessageDlg('该移仓已经完成!',mtWarning,[mbOK],0);
      exit;
   end;
//whl 2007.08.10
   opensql(dataTmp.qryTmp,'select num=count(1) from movelocold (nolock) '
                         +' where jobno="'+qryML.fieldbyname('jobno').AsString+'" '
                         +'   and isnull(newlocid,"")="" '   
                         );
   if dataTmp.qryTmp.FieldByName('num').asinteger>0 then
   begin
      KMessageDlg('存在没有移仓后新仓位的记录，请核实后再点击确认！',mtWarning,[mbOK],0);
      exit;
   end;

   _ADOConnection.Starttransaction;
   try
      //执行确认动作，修改进仓具体仓位的信息
      opensql(dataTmp.qryTmp,'exec ksp_MovelocconfirmNew "'
                 +qryML.FieldByName('Jobno').AsString+'"');
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
      KMessageDlg('确认失败:'+dataTmp.qryTmp.FieldByName('ermsg').AsString,mtWarning,[mbok],0);
      Exit;
   end;
   if _Language='CAPTIONC' then _strmessage:='确认成功'
   else _strmessage:='**************';
   KMessageDlg(GetMessage('frmMoveLocNew','021'),mtWarning,[mbOK],0);    }
end;

procedure TfrmMoveLocNew.grdMovelocDblClick(Sender: TObject);
begin
//   pgcMain.ActivePage:=tbsEdit;
end;

procedure TfrmMoveLocNew.grdMovelocCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
{   if (ANode.Values[Jobno.Index]=null) or (ANode.HasChildren) then exit;
   if trim(ANode.Values[OPERATIONUSERNAME.Index])<>'' then
   begin
      AColor := $00E7E1E8;
   end else
   if trim(ANode.Values[CHECKUSERNAME.Index])='' then
   begin
      AColor := clSkyBlue;
   end else
   begin
      AColor := $00C1DBC1;
   end ;
   if ASelected or AFocused then
   begin
      AFont.Color := clHighlightText;
      AColor := clHighlight;
   end;  }
end;

procedure TfrmMoveLocNew.PieceOldValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var
   pieceOldValue:Extended;
begin
 {  if DataState in Setdcs then
   begin
      if StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText)<0 then
      begin
         ErrorText:='数量不能小于零!';
         Accept:=False;
         exit;
      end;
      pieceOldValue:=qrymovelocold.FieldByName('piece').AsFloat;
      qrymovelocold.Edit;
      qrymovelocold.FieldByName('piece').AsFloat:=StrToFloat(grdMoveLocOld.InplaceEditor.GetEditingText);
      CountSKUPiece(qrymovelocold,pieceOldValue);
   end;    }
end;

procedure TfrmMoveLocNew.newlocnameButtonClick(Sender: TObject;
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

procedure Tfrmmovelocnew.GetSql;
var
   I:integer;
   strFilterConno:String;
begin
   strFilter:='';
   strFilterconno:='';
   if cmbShipAccID.Text<>'' then strFilter:=strFilter+' and locinskudetail.shippercusid="'+cmbShipAccID.TextField+'" ';
   if edtskuname.Text<>'' then strFilter:=strFilter+' and locinskudetail.skuid="'+edtskuname.Textfield+'" ';
   if edtlocname.Text<>'' then strFilter:=strFilter+' and locinskudetail.locid like "'+edtlocname.Textfield+'%" ';
   if edtmainorder.Text<>'' then strFilter:=strFilter+' and exists (select 1 from locationindetail detail     '
                                                     +'                     where locinskudetail.jobno=detail.jobno      '
                                                     +'                       and detail.mainorder="'+edtmainorder.Text+'")';

   if cmbstockno.Text<>'' then strFilter:=strFilter+' and locinskudetail.sealno="'+cmbstockno.Text+'" ';
end;

procedure TfrmMoveLocNew.qryMoveLocOldAfterPost(DataSet: TDataSet);
begin
  if qryMoveLocOld.fieldbyname('SKUID').asstring='' then
  begin
    qryMoveLocOld.Delete;
  end;
end;

procedure TfrmMoveLocNew.grdMoveLocOldEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
begin
   Allow:=true;
      with grdMoveLocOld do
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
      end;
end;

procedure TfrmMoveLocNew.grdMoveLocOldEnter(Sender: TObject);
begin
//   if (DataState in setdcs) and (qryMoveLocOld.IsEmpty=True) then
   if  (qryMoveLocOld.IsEmpty=True) then
   begin
      mitAddLocOldClick(Sender);
   end;
end;

procedure TfrmMoveLocNew.grdMoveLocOldExit(Sender: TObject);
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

procedure TfrmMoveLocNew.grdMoveLocOldKeyDown(Sender: TObject;
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

procedure TfrmMoveLocNew.NewlocidButtonClick(Sender: TObject;
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

procedure TfrmMoveLocNew.cmbShipAccIDButtonClick(Sender: TObject;
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

procedure TfrmMoveLocNew.cmbShipAccIDExit(Sender: TObject);
begin
   if cmbShipAccID.Text='' then cmbShipAccID.TextField:='';
end;

procedure TfrmMoveLocNew.cmbShipAccIDExitCheck(Sender: TObject;
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

procedure TfrmMoveLocNew.edtlocnameButtonClick(Sender: TObject;
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

procedure TfrmMoveLocNew.edtlocnameExit(Sender: TObject);
begin
  if edtlocname.Text='' then edtlocname.TextField:='';
end;

procedure TfrmMoveLocNew.edtlocnameExitCheck(Sender: TObject;
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

procedure TfrmMoveLocNew.edtskunameButtonClick(Sender: TObject;
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

procedure TfrmMoveLocNew.edtskunameExit(Sender: TObject);
begin
   if edtskuname.Text=''  then
   begin
      edtskuname.TextField:='';
   end;
end;

procedure TfrmMoveLocNew.edtskunameExitCheck(Sender: TObject;
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

procedure TfrmMoveLocNew.btnQueryClick(Sender: TObject);
begin
   GetSql;
   strzsql:=' if exists(select * from tempdb..sysobjects where id=object_id("tempdb..#skudetail")               '+chr(13)+chr(10)
           +'   and sysstat & 0xf=3)                                                                             '+chr(13)+chr(10)
           +'  drop table #skudetail                                                                            '+chr(13)+chr(10)
           +'select jobnoin=locinskudetail.jobno,snoin=locinskudetail.sno,ldsnoin=locinskudetail.ldsno,              '+chr(13)+chr(10)
           +'       detailsnoin=detailsno,locinskudetail.skuid,locinskudetail.skuname,serialno,locinskudetail.shippercusid,          '+chr(13)+chr(10)
           +'       quantity=quantityremain,locinskudetail.locid,locinskudetail.locname,locinskudetail.sealno,newlocid=convert(varchar(30),""),      '+chr(13)+chr(10)
           +'       newlocname=convert(varchar(20),""),quantitynew=0, '+chr(13)+chr(10)
           +'       jobno=space(20),sno=0,locationin.mainorder                                                   '+chr(13)+chr(10)
           +'  into #skudetail                                                                                   '+chr(13)+chr(10)
           +'  from locinskudetail (nolock)                                                                      '+chr(13)+chr(10)
           +'        left join  locationin (nolock)                                                                      '+chr(13)+chr(10)
           +'               on  locationin.jobno=locinskudetail.jobno                                                                     '+chr(13)+chr(10)
{           +'        left join  locationindetail (nolock)                                                                      '+chr(13)+chr(10)
           +'               on  locationindetail.jobno=locinskudetail.jono                                                                     '+chr(13)+chr(10)
           +'              and  locationindetail.sno=locinskudetail.sno                                                                     '+chr(13)+chr(10)
           +'              and  locationindetail.ldsno=locinskudetail.ldsno                                                                     '+chr(13)+chr(10)}
           +' where isnull(quantityremain,0)<>0'
           +IIF(_Useridcan<>'',
               ' and (locinskudetail.userid in '+_Useridcan+' or locinskudetail.iuserid in '+_Useridcan+') ',
               ' and (locinskudetail.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
              +'    or locinskudetail.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10)

           +strFilter
           +' declare @i smallint '
           +'  select @i=0 '
           +'  update #skudetail set sno=@i,@i=@i+1 '
           +'select jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno, shippercusid,          '+chr(13)+chr(10)
           +'       quantity,locid,locname,sealno,newlocid,newlocname,quantitynew,                   '+chr(13)+chr(10)
           +'       jobno,sno,salver=convert(varchar(20),""),mainorder                                '+chr(13)+chr(10)
           +'  from #skudetail     '                                                                      ;
   qryMoveLocOld.Close;
   qryMoveLocOld.SQL.Clear;
   qryMoveLocOld.SQL.Add(strZsql);
  // qryMoveLocOld.DisableControls;
   qryMoveLocOld.Open;
   btnOK.Enabled:=true;


end;

procedure TfrmMoveLocNew.cmbchoiceExit(Sender: TObject);
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
   if cmbchoice.Text='仓    位' then
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
   if cmbchoice.Text='托 盘 号' then
   begin
      edtskuname.Visible:=False;
      edtmainorder.Visible:=false;
      edtlocname.Visible:=false;
      cmbstockno.Visible:=true;
      cmbShipAccID.Visible:=False;
   end;
end;

procedure TfrmMoveLocNew.cmbchoiceChange(Sender: TObject);
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

procedure TfrmMoveLocNew.btnOKClick(Sender: TObject);
var
  strlocbillno:string;
begin
   strMLJobno:='';
   opensql(dataTmp.qryTmp,
           'select dhcx=max(convert(int,substring(docno1,7,8))) '
          +'  from genjobno '
          +' where substring(docno1,1,2)="ML"  '
          +'   and substring(docno1,3,4)="'+copy(datetostr(GetServerDate),1,4)+'"' );
   strLocbillno:='ML'+copy(datetostr(GetServerDate),1,4)
                     +pad(inttostr(dataTmp.qryTmp.fieldbyName('dhcx').Asinteger+1),8,'0',psLeft)+iif(_DB_BillNO='','','('+_DB_BillNO+')');
   strMLJobno:=genJobno('ML',strLocbillno);

   try
      while True do
      begin
         try
            _ADOConnection.Starttransaction;
           // arrMoveLoc:=ScatterToArray(qryMoveLoc,true,0);
            qryMoveLocOld.First;
            while not qryMoveLocOld.Eof do
            begin
             //  qryMoveLocOld.Edit;
               //qryMoveLocOld.FieldByName('jobno').asstring:=strMLJobno;
               if (qryMoveLocOld.FieldByName('quantity').AsFloat<>qryMoveLocOld.FieldByName('quantitynew').AsFloat) and
                  (qryMoveLocOld.FieldByName('quantitynew').asfloat<>0) and
                  (qryMoveLocOld.FieldByName('salver').AsString='') then
               begin
                  KMessageDlg('请输入新的托盘号!',mtWarning,[mbOK],0);
                  grdMoveLocOld.SetFocus;
                  Exit;
               end;


               if (qryMoveLocOld.FieldByName('newlocid').asstring<>qryMoveLocOld.FieldByName('locname').asstring)
                  and ( qryMoveLocOld.FieldByName('quantitynew').asfloat<>0) then
                  ExecSql(dataTmp.qryTmp,'insert into movelocold(jobno,sno,jobnoin,snoin,ldsnoin,detailsnoin,skuid,skuname,serialno,shippercusid,         '+chr(13)+chr(10)
                                        +'                      quantity,locid,locname,newlocid,newlocname,quantitynew,                                                '+chr(13)+chr(10)
                                        +'                      salver,sealno,mainorder,confirmed,currcd,price,operationtype,iuserid,iusername,userid,username)  '
                                        +' values("'+strMLJobno+'",'
                                        +'        '+qryMoveLocOld.FieldByName('sno').asstring+','
                                        //+'        "'+qryMoveLocOld.FieldByName('sno').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('jobnoin').asstring+'",'
                                        +'        '+qryMoveLocOld.FieldByName('snoin').asstring+','
                                        +'        '+qryMoveLocOld.FieldByName('ldsnoin').asstring+','
                                        +'        '+qryMoveLocOld.FieldByName('detailsnoin').asstring+','
                                        +'        "'+qryMoveLocOld.FieldByName('skuid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('skuname').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('serialno').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('shippercusid').asstring+'",'
                                        +'        '+floattostr(qryMoveLocOld.FieldByName('quantity').asfloat)+','
                                        +'        "'+qryMoveLocOld.FieldByName('locid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('locname').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('newlocid').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('newlocname').asstring+'",'
                                        +'        '+floattostr(qryMoveLocOld.FieldByName('quantitynew').asfloat)+','
                                        +'        "'+qryMoveLocOld.FieldByName('salver').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('sealno').asstring+'",'
                                        +'        "'+qryMoveLocOld.FieldByName('mainorder').asstring+'",'
                                        +'        "T","RMB",0,-1,"'+_userid+'","'+_username+'","'+_userid+'","'+_username+'"  '
                                        +')');
               qryMoveLocOld.Next;
            end;
            ExecSql(dataTmp.qryTmp,'ksp_Movelocskudetailfirm  @pjobno="'+strMLJobno+'"');
            ExecSql(dataTmp.qryTmp,' insert into moveloc '
                                  +'   (jobno, createname, createdate, operationname, operationdate ,userid, username,'
                                  +'    iuserid,iusername,operationtype,skucostclasscd,confirmed) '
                                  +'  values '
                                  +'   ("'+strMLJobno+'","'+_loginname+'",getdate(),"'+_loginname+'",getdate(),'
                                  +'     "'+_userid+'","'+_username+'","'+_userid+'","'+_username+'",-1,"COMMON","T" )');
            _ADOConnection.Commit;

            KMessageDlg('移仓操作完成!',mtInformation,[mbOK],0);
            frmMoveLocNew.btnQueryClick(Sender);
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

procedure TfrmMoveLocNew.btncancellClick(Sender: TObject);
begin
   frmmovelocnew.Close;
end;

procedure TfrmMoveLocNew.newlocnameValidate(Sender: TObject;
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
