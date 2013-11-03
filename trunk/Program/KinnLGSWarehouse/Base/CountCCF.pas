unit CountCCF;

interface

uses
  Windows, Messages,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxGrClms, Menus, KDataSetProvider, DB, DBClient, dxDBGrid, dxTL,
  dxDBCtrl, dxDBTLCl, dxCntner, dxExEdtr, dxEdLib, KinPickEdit,
  dxPageControl, dxEditor, KGroupBox, KBitBtn, StdCtrls, GMSLabel, CheckLst ;

type
  TfrmCountCCF = class(TForm)
    qryTmp: TKADOQuery;
    btnOnhire: TKBitBtn;
    GroupBox6: TKGroupBox;
    qrycost: TKADOQuery;
    dtscost: TDataSource;
    btnRefresh: TKBitBtn;
    btnCost: TKBitBtn;
    GMSStickyLabel1: TGMSStickyLabel;
    edtCostAccountName: TdxButtonEdit;
    udsCostItem: TKadoUpdateSql;
    dtsCostItem: TDataSource;
    qryCostItem: TKADOQuery;
    btnCheck: TKBitBtn;
    qryCon: TKADOQuery;
    qryCostRate: TKADOQuery;
    ckbCost: TdxCheckEdit;
    dxPageControl1: TdxPageControl;
    blnolb: TdxTabSheet;
    memlocationbillno: TdxMemo;
    dxTabSheet1: TdxTabSheet;
    memcusbillno: TdxMemo;
    pgcitem: TdxPageControl;
    tbscost: TdxTabSheet;
    grdcost: TdxDBGrid;
    costcusname: TdxDBGridColumn;
    skuname: TdxDBGridColumn;
    operationdate: TdxDBGridColumn;
    remark: TdxDBGridColumn;
    tbscostitem: TdxTabSheet;
    renttypename: TdxDBGridColumn;
    username: TdxDBGridColumn;
    iusername: TdxDBGridColumn;
    locationbillno: TdxDBGridColumn;
    cusbillno: TdxDBGridColumn;
    customsno: TdxDBGridColumn;
    isbond: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    Ppmcost: TPopupMenu;
    mitLock: TMenuItem;
    N1: TMenuItem;
    mitCheck: TMenuItem;
    checked: TdxDBGridCheckColumn;
    qrySku: TKADOQuery;
    qryAutoCost: TKADOQuery;
    tbscostrate: TdxTabSheet;
    qryWareCostRate: TKADOQuery;
    dtsWareCostRate: TDataSource;
    grdWarecostRate: TdxDBGrid;
    UserNameSKU: TdxDBGridColumn;
    COSTNameSKU: TdxDBGridColumn;
    CR_CountWayNameSKU: TdxDBGridColumn;
    CR_SectionLengthSKU: TdxDBGridColumn;
    CR_SectionUnitSKU: TdxDBGridColumn;
    CR_CountCostNameSKU: TdxDBGridColumn;
    CTI_WHONameSKU: TdxDBGridColumn;
    CR_ValueSKU: TdxDBGridColumn;
    COSTCURRCDSKU: TdxDBGridColumn;
    CT_IsIncomeSKU: TdxDBGridColumn;
    RateUOMTypeNameSKU: TdxDBGridColumn;
    CR_CountUOMSKU: TdxDBGridColumn;
    CTI_QuantitySKU: TdxDBGridColumn;
    CR_ContIsDaySKU: TdxDBGridColumn;
    CR_ContSectLenSKU: TdxDBGridColumn;
    CR_ContSectValueSKU: TdxDBGridColumn;
    CR_ContSectLen2SKU: TdxDBGridColumn;
    CR_ContSectValue2SKU: TdxDBGridColumn;
    CR_ContSectLen3SKU: TdxDBGridColumn;
    CR_ContSectValue3SKU: TdxDBGridColumn;
    CR_ContSectLen4SKU: TdxDBGridColumn;
    CR_ContSectValue4SKU: TdxDBGridColumn;
    CR_ContSectLen5SKU: TdxDBGridColumn;
    CR_ContSectValue5SKU: TdxDBGridColumn;
    LoadCostTypeSku: TdxDBGridColumn;
    btnclose: TKBitBtn;
    tbsRemark: TdxTabSheet;
    memRemark: TMemo;
    dtdCountDate: TdxDateEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    btnPrint: TKBitBtn;
    qryTmp1: TKADOQuery;
    qryTmp2: TKADOQuery;
    ckbCountIsEmpty: TdxCheckEdit;
    edtCusName: TdxButtonEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    edtShipperName: TdxButtonEdit;
    edtuserid: TdxButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    ckbWareRate: TdxCheckEdit;
    ckbCheck: TdxCheckEdit;
    renttypenameout: TdxDBGridColumn;
    cusname1: TdxDBGridColumn;
    shippercusname1: TdxDBGridColumn;
    grdCostItem: TdxDBGrid;
    AccountName: TdxDBGridColumn;
    ShipperAccountName: TdxDBGridColumn;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    CostName: TdxDBGridColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    INOUT: TdxDBGridColumn;
    CTI_WHOName: TdxDBGridColumn;
    WR_Name: TdxDBGridColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    CR_Value: TdxDBGridColumn;
    ACTCHKUserName: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    tbsSql: TdxTabSheet;
    edtsql: TMemo;
    snosku: TdxDBGridColumn;
    cmbcostcd: TKinPickEdit;
    GMSStickyLabel25: TGMSStickyLabel;
    edtProfitFr: TdxCurrencyEdit;
    GMSStickyLabel7: TGMSStickyLabel;
    cmbCZSF: TKinPickEdit;
    GMSStickyLabel11: TGMSStickyLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCostAccountNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btnRefreshClick(Sender: TObject);
    procedure mitLockClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure mitCheckClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure btnCostClick(Sender: TObject);
    procedure edtCusNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtShipperNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtuseridButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dtdCountDateChange(Sender: TObject);
    procedure ckbCostChange(Sender: TObject);
    procedure edtuseridExit(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure checkedValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure edtProfitFrEnter(Sender: TObject);
  private
    { Private declarations }
//    Old
    StrCPID:string;
    maxCostItemSno:Integer;
    maxRateSno:Integer;

    blnCheckFalse:Boolean;// 记录校验动作是否失败

    procedure GetFilter;
    procedure BeforeCount;
    procedure CheckCheck; //检查资料是否审核
    procedure CheckWareRate;     //检查是否存在对应费率
    procedure GetTransSQL;//获取后台跟踪语句

  public
    { Public declarations }
  end;

procedure WorkCountCCF(pblnCount:Boolean);

var
  frmCountCCF: TfrmCountCCF;

implementation

{$R *.DFM}
uses datas,kindlg,libUser,LibBb,main, libproc,libuserPub,GetDllPub,dxGridOut;

var
   strSql:string;
   blnCount:Boolean;
   strFilterCost:string;

procedure WorkCountCCF(pblnCount:Boolean);
var
   I:Integer;
begin
   LampChange(lsBrowse);
   {防止程序被重复执行}
{   if frmCountCCF<>nil then
   with frmCountCCF do
   begin
      if WindowState=wsMinimized then WindowState:=wsNormal;
      ShowModal;
      Exit;
   end;}
{   if (frmMain.MDIChildCount>0) then
   begin
     KMessagedlg('请关闭已打开的界面，然后再执行此操作！',mtWarning,[mbOk],0);
     exit;
   end;}
   Application.CreateForm(TfrmCountCCF,frmCountCCF);
   with frmCountCCF do
   begin
      blnCount:=pblnCount;
      if pgcitem.ActivePage<>tbscost then pgcitem.ActivePage:=tbscost;
      if not blnCount then
      begin
         frmCountCCF.Caption:='放弃仓租计提';
         btnRefresh.Visible:=False;
         btnCheck.Caption:='刷新';
         btnCheck.Hint:='查看要放弃计提的仓租';
         btnCost.Caption:='确定';
         btnCost.Hint:='进行放弃仓租';
         tbscost.TabVisible:=False;
         ckbCost.Caption:='放弃应付仓租';
       end else
      begin
         btnCheck.Enabled:=False;
      end;

      if _paper='T' then
      begin
         cmbcostcd.Visible:=True;
         edtProfitFr.Visible:=True;
         cmbcostcd.TextField:='BXF';
         cmbcostcd.Text:='保险费';
         GMSStickyLabel25.Visible:=True;
         GMSStickyLabel7.Visible:=True;
      end else
      begin
         cmbcostcd.Visible:=False;
         edtProfitFr.Visible:=False;
         GMSStickyLabel25.Visible:=False;
         GMSStickyLabel7.Visible:=False;
      end;  

      btnCost.Enabled:=False;
      tbsRemark.TabVisible:=False;
      dtdCountDate.Date:=Date;
      tbsSql.TabVisible:=False;

      //仓租算法
      cmbCZSF.Items.Clear;
      cmbCZSF.ItemFields.Clear;
      OpenSql(qryTmp, 'select code=codeCd,name=codename '
                     +'  from codelib (nolock) '
                     +' where codeclass="18" '
                     +'   and codecd in ("ZY","BY") '
                     +' order by codecd');
      while not qryTmp.Eof do
      begin
         cmbCZSF.Items.Add(qryTmp.FieldByname('name').AsString);
         cmbCZSF.ItemFields.Add(qryTmp.FieldByname('code').AsString);
         qryTmp.Next;
      end;
      qryTmp.Close;
      cmbCZSF.ItemIndex:=0;

{      cklCountType.items.clear;
      while (not qryTmp.Eof) do
      begin
        cklCountType.items.add(copy(pad(qryTmp.Fieldbyname('Name').asstring,12,' ',psRight),1,12)
                              +qryTmp.Fieldbyname('code').asstring);
        qryTmp.Next;
      end;
      qryTmp.Close;
      for I:=0 to cklCountType.Count-1 do
      begin
         cklCountType.Checked[i]:=True;
      end;}
   end;
   frmCountCCF.Show;
end;

procedure TfrmCountCCF.GetTransSQL;
begin
   edtsql.text:='  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#lskInItem") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #lskInItem '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#CostItemCheck") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #CostItemCheck '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#CostItem") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #CostItem '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#TempLTO") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #TempLTO '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#lskDetailQC") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #lskDetailQC '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#WareInventoryDetail") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #WareInventoryDetail '+chr(13)+chr(10)
               +'  if exists(select * from tempdb..sysobjects '+chr(13)+chr(10)
               +'    where id=object_id("tempdb..#lskLocationInItem") and sysstat & 0xf=3) '+chr(13)+chr(10)
               +'     drop table #lskLocationInItem '+chr(13)+chr(10)
end;

procedure TfrmCountCCF.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCountCCF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCountCCF.FormDestroy(Sender: TObject);
begin
   LampChange(lsMenu);
   Self:=nil;
end;

procedure TfrmCountCCF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then
      ReturnNext(self);
   if Key=Vk_Escape then KeyDownControl(Key,btnClose);
end;

procedure TfrmCountCCF.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupBox(GroupBox6);
   SetDxDbGrid(grdCost);
   SetDxDbGrid(grdcostItem);
   SetDxDbGrid(grdWarecostRate);
   qrycost.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
   qryTmp2.Connection:=_ADOConnection;
   qrysku.Connection:=_ADOConnection;
   qryautocost.Connection:=_ADOConnection;
   qryWareCostRate.Connection:=_ADOConnection;
   qryCostItem.Connection:=_ADOConnection;
   qryCostRate.Connection:=_ADOConnection;
   qryCon.Connection:=_ADOConnection;
end;

procedure TfrmCountCCF.FormActivate(Sender: TObject);
begin
//   WindowState:=wsMaximized;
end;

procedure TfrmCountCCF.btnRefreshClick(Sender: TObject);
var
   i:Integer;
   blnSelect:Boolean;
begin
   blnSelect:=False;
{   for i:=0 to cklCountType.Items.count-1 do
   begin
      if cklCountType.Checked[i] then
      begin
         blnSelect:=True;
      end;
   end;
   if not blnSelect then
   begin
      KMessageDlg('请选择算法',mtInformation,[mbOK],0);
      Exit;
   end;
}
   GetTransSQL; //获取跟踪SQL
   if pgcitem.ActivePage<>tbscost then pgcitem.ActivePage:=tbscost;
   GetFilter;                        droplsk('#lskInItem');
   strSql:=' select initem.jobno,initem.sno,                                                  '+chr(13)+chr(10)
          +'        locationbillno,initem.warerentcounttype,                                  '+chr(13)+chr(10)
          +'        skuname,operationdate=convert(varchar(10),operationdate,102),             '+chr(13)+chr(10)
          +'        cusid,costcusid,shippercusid,                                             '+chr(13)+chr(10)
          +'        cusname,costcusname,shippercusname,                                       '+chr(13)+chr(10)
          +'        username,iusername,cusbillno,                                             '+chr(13)+chr(10)
          +'        customsno,initem.remark,                                                  '+chr(13)+chr(10)
          +'        isbond=isnull(isbond,""),                                                 '+chr(13)+chr(10)
          +'        renttypename=codelib.codename,                                            '+chr(13)+chr(10)
          +'        renttypenameout=codelibout.codename,                                      '+chr(13)+chr(10)
          +'        initem.countrent,                                               '+chr(13)+chr(10)
          +'        checked="F",keyid=jobno+convert(char,sno)                                 '+chr(13)+chr(10)
          +'   into #lskInItem                                                                '+chr(13)+chr(10)
          +'   from locationinitem initem (nolock)                                            '+chr(13)+chr(10)
          +'                         left join codelib (nolock)                               '+chr(13)+chr(10)
          +'                                on codelib.codeclass="18"                         '+chr(13)+chr(10)
          +'                               and codelib.codecd=initem.warerentcounttype        '+chr(13)+chr(10)
          +'                         left join codelib codelibout(nolock)                     '+chr(13)+chr(10)
          +'                                on codelibout.codeclass="18"                      '+chr(13)+chr(10)
          +'                               and codelibout.codecd=initem.warerentcounttypeout  '+chr(13)+chr(10)
          +'  where 1=1                                                                       '+chr(13)+chr(10)
          +strFilterCost
          +' select * from #lskInItem ';
   OpenSql(qrycost,strSql);
   edtSql.Text:=edtSql.Text+strSql+chr(13)+chr(10);   //获取跟踪SQL
   btnCheck.Enabled:=True;
   btnCost.Enabled:=False;
end;

//获取过滤条件
procedure TfrmCountCCF.GetFilter;
var
   strFilterls:string;
   I:Integer;  
begin
   strFilterCost:='';
//===================系统内置过滤条件======================/
   if blnCount then
   begin
{只过滤出需要进行计提的资料}
      if not ckbCost.Checked then
         strFilterCost:=strFilterCost+' and isnull(initem.countrent,"F")="T" '+chr(13)+chr(10)
      else
         strFilterCost:=strFilterCost+' and isnull(initem.countrentout,"F")="T" '+chr(13)+chr(10);
{只过滤出还未计提完毕的资料}
      if not ckbCost.Checked then
         strFilterCost:=strFilterCost+' and isnull(initem.countover,"F")="F" '+chr(13)+chr(10)
      else
         strFilterCost:=strFilterCost+' and isnull(initem.countoverout,"F")="F" '+chr(13)+chr(10);
   end else
   begin
      if not ckbCost.Checked then
         strFilterCost:=strFilterCost+' and isnull(initem.iscount,"F")="T" '+chr(13)+chr(10)
      else
         strFilterCost:=strFilterCost+' and isnull(initem.iscountout,"F")="T" '+chr(13)+chr(10);
   end;      

//===================用户设置过滤条件======================/
{关系人}
   if edtCostAccountName.TextField<>'' then
      strFilterCost:=strFilterCost+' and initem.costcusid="'+edtCostAccountName.TextField+'" '+chr(13)+chr(10);
{寄仓单位}
   if edtCusName.TextField<>'' then
      strFilterCost:=strFilterCost+' and initem.cusid="'+edtCusName.TextField+'" '+chr(13)+chr(10);
{货主}
   if edtShipperName.TextField<>'' then
      strFilterCost:=strFilterCost+' and initem.Shippercusid="'+edtShipperName.TextField+'" '+chr(13)+chr(10);
{部门}
   if edtuserid.TextField<>'' then
      strFilterCost:=strFilterCost+' and initem.iuserid like "'+edtuserid.TextField+'%" '+chr(13)+chr(10);
{日期}
   if (dtdCountDate.Date<>0) and blnCount then
      strFilterCost:=strFilterCost+' and convert(varchar,initem.operationdate,102)<="'+dtdCountDate.Text+'"'+chr(13)+chr(10);
//组织控制
      strFilterCost:=strFilterCost+' and '+IIF(_Useridcan<>'',
               ' (  initem.userid in '+_Useridcan+' or initem.iuserid in '+_Useridcan+') ',
               ' (  initem.userid like rtrim("'+_UserID+'")+"%"  '+chr(13)+chr(10)  // Useid组织
              +'    or initem.iUserid like rtrim("'+_UserID+'")+"%" )')+chr(13)+chr(10) ;

{各种单号}
   //进仓单号列表
   strFilterls:='';
   if Trim(memlocationbillno.Text)<>'' then
   Begin
      for I:=0 to memlocationbillno.Lines.Count-1 do
      begin
         if Trim(memlocationbillno.Lines.Strings[I])<>'' then
            strFilterls:=strFilterls+' or initem.LocationBillNO like "%'+Trim(memlocationbillno.Lines.Strings[I])+'%"'
      end;
      if strFilterls<>'' then
         strFilterCost:=strFilterCost+' and (1=2 '+strFilterls+')';
   end;
   //客户仓单号列表
   strFilterls:='';
   if Trim(memcusbillno.Text)<>'' then
   Begin
      for I:=0 to memcusbillno.Lines.Count-1 do
      begin
         if Trim(memcusbillno.Lines.Strings[I])<>'' then
            strFilterls:=strFilterls+' or initem.cusBillNO like "%'+Trim(memcusbillno.Lines.Strings[I])+'%"'
      end;
      if strFilterls<>'' then
         strFilterCost:=strFilterCost+' and (1=2 '+strFilterls+')';
   end;
{仓租算法}
//   strFilterls:='';
   strFilterCost:=strFilterCost+' and initem.WareRentCountType="'+cmbczsf.TextField+'" ';
{   for i:=0 to cklCountType.Items.count-1 do
   begin
     if cklCountType.Checked[i] then
     begin
       strFilterls:=strFilterls+',"'
         +trim(copy(cklCountType.Items[i],13,length(cklCountType.Items[i])-12))+'"';
     end;
   end;
   if strFilterls<>'' then
   begin
     strFilterls:=copy(strFilterls,2,length(strFilterls)-1);
     if not ckbCost.Checked then
        strFilterCost:=strFilterCost+' and initem.WareRentCountType in ('+strFilterls+') '
     else
        strFilterCost:=strFilterCost+' and initem.WareRentCountTypeOut in ('+strFilterls+') ';
   end;   }
end;

procedure TfrmCountCCF.mitLockClick(Sender: TObject);
var
   I:Integer;
begin
   _pgbClear.Visible:=True;
   _pgbClear.Position:=0;
   _pgbClear.Max:=grdCost.SelectedCount;
   _labPro.Caption:='共'+inttostr(grdCost.SelectedCount)+'笔';
   Application.ProcessMessages;
   qryCost.DisableControls;
   for i:=grdCost.SelectedCount-1 Downto 0 do
   begin
      qryCost.GotoBookmark(Pointer(grdCost.SelectedRows[i]));
      strSql:='update #lskInItem set checked="T"  '
             +' where jobno="'+qryCost.fieldByName('jobno').AsString+'"   '
             +'   and sno="'+qryCost.fieldByName('sno').AsString+'"  ';
      ExecSql(qryTmp,strSql);
      edtSql.Text:=edtSql.Text+strSql+chr(13)+chr(10);   //获取跟踪SQL

      _pgbClear.StepBy(1);
   end;
      openSql(qryCost,'  select * from #lskInItem ');
   qryCost.EnableControls;
   _pgbClear.Visible:=False;
   _labPro.Caption:=GetMessage('frmCheckCost','011');//'运行进度';
end;

procedure TfrmCountCCF.N1Click(Sender: TObject);
begin
   strSql:='update #lskInItem set checked="T"  select * from #lskInItem ';
   OpenSql(qryCost,strSql);
   edtSql.Text:=edtSql.Text+strSql+chr(13)+chr(10);   //获取跟踪SQL
end;

procedure TfrmCountCCF.mitCheckClick(Sender: TObject);
var
   I:Integer;
begin
   _pgbClear.Visible:=True;
   _pgbClear.Position:=0;
   _pgbClear.Max:=grdCost.SelectedCount;
   _labPro.Caption:='共'+inttostr(grdCost.SelectedCount)+'笔';
   Application.ProcessMessages;                               
   qryCost.DisableControls;
   for i:=grdCost.SelectedCount-1 Downto 0 do
   begin
      qryCost.GotoBookmark(Pointer(grdCost.SelectedRows[i]));
      ExecSql(qryTmp,'update #lskInItem set checked="F"   '
                    +' where jobno="'+qryCost.fieldByName('jobno').AsString+'"   '
                    +'   and sno="'+qryCost.fieldByName('sno').AsString+'"  ');
      _pgbClear.StepBy(1);
   end;
      openSql(qryCost,'  select * from #lskInItem ');
   qryCost.EnableControls;
   _pgbClear.Visible:=False;
   _labPro.Caption:=GetMessage('frmCheckCost','011');//'运行进度';
end;

procedure TfrmCountCCF.btnCheckClick(Sender: TObject);
var
   i:Integer;
begin
   if dtdCountDate.Date=0 then
   begin
      dtdCountDate.SetFocus;
      Kmessagedlg('截止日期不能为空！',mtInformation,[mbOk],0);
      Exit;
   end;
   if blnCount then //计提仓租
   begin
      memRemark.Text:='';
   //判断是否有选定记录
      OpenSql(qryTmp,' select num=count(1) from #lskInItem where checked="T" ');
      if qryTmp.FieldByName('num').AsInteger=0 then
      begin
         Kmessagedlg(GetMessage('frmCountCost','001'),mtInformation,[mbOk],0);//'您未选定任何记录！'
         Exit;
      end;
   //生成备用临时表
      KMessageWait('正在执行资料准备工作...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      BeforeCount;
   //===============计费盘点前对数据的一些检查====================/
      blnCheckFalse:=False;
   {检查资料是否已审核}
{      KMessageWait('正在执行资料审核工作...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      if ckbCheck.Checked then
      begin
         CheckCheck;
         if blnCheckFalse then Exit;
      end;  }
   {检查资料是否存在对应费率}
      KMessageWait('正在检查相应费率获取情况...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      if ckbWareRate.Checked then
      begin
         CheckWareRate;
         if blnCheckFalse then Exit;
      end;
   //开始盘点
      KMessageWait('正在进行仓租盘点...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      strSql:=' exec ksp_CostItemCheck_CCF  '
             +iif(not ckbCost.Checked, '   @CT_IsIncomeCR="T", ', '   @CT_IsIncomeCR="F", ')
             +'                 @CountDate="'+dtdCountDate.Text+'" ';
//             +'                 @CountIsEmpty="'+iif(ckbCountIsEmpty.checked,'T','F')+'",'
//             +'                 @parOLocationBillNO ="" ';
      OpenSql(qrycostitem,strSql);
      edtSql.Text:=edtSql.Text+strSql+chr(13)+chr(10);   //获取跟踪SQL

{
   //显示盘点结果
      KMessageWait('资料统计中...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      strsql:=' select check1.snosku,Check1.JobnoINF,Check1.SNOINF,'+chr(13)+chr(10)
             +'        Check1.JobnoIN,Check1.SNOIN,'+chr(13)+chr(10)
             +'        Check1.Jobno,Check1.SNO,'+chr(13)+chr(10)
             +'        Check1.SectionSDate,'+chr(13)+chr(10)
             +'        Check1.CheckDate,'+chr(13)+chr(10)
             +'        Check1.ratevalue,Check1.Quantity,'+chr(13)+chr(10)
             +'        SectionType=Case SectionType '+chr(13)+chr(10)
             +'                    when 1 then "非延续区段"'+chr(13)+chr(10)
             +'                    when 0 then  "非延续区段清仓"'+chr(13)+chr(10)
             +'                    when -1 then "延续区段"'+chr(13)+chr(10)
             +'                    when -2 then "延续区段清仓"'+chr(13)+chr(10)
             +'                    when -3 then "过渡区段"'+chr(13)+chr(10)
             +'                    when -4 then "过渡区段完成"'+chr(13)+chr(10)
             +'                    when -5 then "包干区段"'+chr(13)+chr(10)
             +'                    when -6 then "包干区段完成"'+chr(13)+chr(10)
             +'                    else "" end,'+chr(13)+chr(10)
             +'        UOMTypeName=(case check1.RateUOMType '+chr(13)+chr(10)
             +'                    when "Quantity" then "数量"'+chr(13)+chr(10)
             +'                    when "Piece" then "件数"'+chr(13)+chr(10)
             +'                    when "Netweight" then "净重"'+chr(13)+chr(10)
             +'                    when "Grossweight" then "毛重"'+chr(13)+chr(10)
             +'                    when "Volume" then "体积"'+chr(13)+chr(10)
             +'                    when "Area" then "面积"'+chr(13)+chr(10)
             +'                    else "" end)+"("+rtrim(check1.CountUOM)+")",'+chr(13)+chr(10)
             +'        costcusname=Check1.costcusname,'+chr(13)+chr(10)
             +'        cusname=detail.cusname,'+chr(13)+chr(10)
             +'        ShippercusName=detail.ShippercusName,'+chr(13)+chr(10)
             +'        Check1.SKUName,'+chr(13)+chr(10)
             +'        Detail.CustomsNO,'+chr(13)+chr(10)
             +'        Detail.LocationBillNO,'+chr(13)+chr(10)
             +'        Inout=isnull(cost.costin,0)-isnull(cost.costout,0),'+chr(13)+chr(10)
             +'        CostName=case when Cost.costcd="CZBGF" '+chr(13)+chr(10)
             +'                       and Check1.WareRentCountType in ("IR","OR") '+chr(13)+chr(10)
             +'                      then "散货包干费" else "仓租" end,'+chr(13)+chr(10)
             +'        key1=check1.jobno+convert(char(4),check1.snosku)+convert(char(10),check1.sectionsdate,102),'+chr(13)+chr(10)
             +'        wrname=codelib.codename,'+chr(13)+chr(10)
             +'        Check1.SectionSNO,'+chr(13)+chr(10)
             +'        Check1.ContSectSNO,Check1.ContSectItemSNO,'+chr(13)+chr(10)
             +'        CostCheckName="",WO=(Check1.Quantity-Check1.Inventory),username=detail.iusername '+chr(13)+chr(10)
             +'   from #CostItemCheck Check1'+chr(13)+chr(10)
             +'        left join codelib (nolock)'+chr(13)+chr(10)
             +'               on codelib.codeclass="18" '+chr(13)+chr(10)
             +'              and Check1.WareRentCountType=codelib.codecd '+chr(13)+chr(10)
             +'        left join #CostItemTmp Cost '+chr(13)+chr(10)
             +'               on Check1.Jobno=Cost.Jobno '+chr(13)+chr(10)
             +'              and Check1.SNO=Cost.SNO '+chr(13)+chr(10)
             +'              and Check1.snosku=Cost.snosku '+chr(13)+chr(10)
             +'              and Check1.SectionSDate=Cost.costdate ,'+chr(13)+chr(10)
             +'        #lskDetailQC Detail (nolock)'+chr(13)+chr(10)
             +'  where Check1.Jobno=Detail.Jobno'+chr(13)+chr(10)
             +'    and Check1.SNOSku=Detail.SNO'+chr(13)+chr(10)
             +'    and Detail.OperationType=1'+chr(13)+chr(10)
             +'  order by 1,2,3,4,5,6,7';
      opensql(qrycostitem,strsql);
      edtSql.Text:=edtSql.Text+strSql+chr(13)+chr(10);   //获取跟踪SQL    }

      pgcitem.ActivePage:=tbscostitem;
      btnCost.Enabled:=True;
      btnCost.SetFocus;
      if _Loginid='SYSTEM' then tbsSql.TabVisible:=True;
   end else
//放弃计提仓租
   begin
      KMessageWait('资料统计中...,请稍候!',mtInformation,btnClose.Handle,0);
      Application.ProcessMessages;
      droplsk('#InOutItem');
      GetFilter;
      strSql:=' select jobno,sno,CustomsNO,LocationBillNO,cusname,Shippercusname,skuname  '+chr(13)+chr(10)
             +'   into #InOutItem '+chr(13)+chr(10)
             +'   from locationinitem initem (nolock) '+chr(13)+chr(10)
             +'  where 1=1  '+chr(13)+chr(10)
             +strFilterCost;
      ExecSql(qryTmp,strSql); 
      droplsk('#lsquitk');
      strSql:=' select Check1.JobnoINF,Check1.SNOINF,'+chr(13)+chr(10)
             +'        Check1.JobnoIN,Check1.SNOIN,'+chr(13)+chr(10)
             +'        Check1.Jobno,Check1.SNOSku,'+chr(13)+chr(10)
             +'        Check1.SectionSDate,'+chr(13)+chr(10)
             +'        Check1.CheckDate,'+chr(13)+chr(10)
             +'        Check1.rateValue,Check1.Quantity,'+chr(13)+chr(10)
             +'        check1.RateUOMType, Check1.CountUOM,'+chr(13)+chr(10)
             +'        Check1.costcusname,'+chr(13)+chr(10)
             +'        Detail.CustomsNO,'+chr(13)+chr(10)
             +'        Detail.LocationBillNO,'+chr(13)+chr(10)
             +'        CostName=case when (Check1.SectionType=-5 '+chr(13)+chr(10)
             +'                        or Check1.SectionType=-6) '+chr(13)+chr(10)
             +'                       and Check1.WareRentCountType in ("IR","OR") '+chr(13)+chr(10)
             +'                      then "散货包干费" else "仓租" end,'+chr(13)+chr(10)
             +'        key1=check1.jobno+convert(char(4),check1.sno)+convert(char(10),check1.sectionsdate,102),'+chr(13)+chr(10)
             +'        Check1.SectionSNO,'+chr(13)+chr(10)
             +'        Check1.ContSectSNO,Check1.ContSectItemSNO,'+chr(13)+chr(10)
             +'        WO=(Check1.Quantity-Check1.Inventory),'+chr(13)+chr(10)
             +'        Detail.cusname,Detail.Shippercusname,Detail.SKUname,'+chr(13)+chr(10)
             +'        Check1.WareRentCountType,Check1.SNO,Check1.Sectiontype,username=Check1.username'+chr(13)+chr(10)
             +'   into #lsquitk'+chr(13)+chr(10)
             +'   from CostItemCheck Check1(nolock),#InOutItem Detail(nolock) '+chr(13)+chr(10)
             +'  where Check1.Jobno=Detail.Jobno'+chr(13)+chr(10)
             +'    and Check1.SNOSku=Detail.SNO'+chr(13)+chr(10)
             +'    and Check1.SectionSDate>"'+dtdCountDate.Text+'"'+chr(13)+chr(10)
             +iif(not ckbCost.Checked,' and isnull(Check1.ISINCOME,"T")="T" ',' and isnull(Check1.ISINCOME,"T")="F" ');
      ExecSql(qryTmp,strSql);

      strsql:=' select Check1.JobnoINF,Check1.SNOINF,'+chr(13)+chr(10)
             +'        Check1.JobnoIN,Check1.SNOIN,'+chr(13)+chr(10)
             +'        Check1.Jobno,Check1.SNOSku,'+chr(13)+chr(10)
             +'        Check1.SectionSDate,'+chr(13)+chr(10)
             +'        Check1.CheckDate,'+chr(13)+chr(10)
             +'        Check1.rateValue,Check1.Quantity,'+chr(13)+chr(10)
             +'        SectionType=Case SectionType '+chr(13)+chr(10)
             +'                    when 1 then "非延续区段"'+chr(13)+chr(10)
             +'                    when 0 then  "非延续区段清仓"'+chr(13)+chr(10)
             +'                    when -1 then "延续区段"'+chr(13)+chr(10)
             +'                    when -2 then "延续区段清仓"'+chr(13)+chr(10)
             +'                    when -3 then "过渡区段"'+chr(13)+chr(10)
             +'                    when -4 then "过渡区段完成"'+chr(13)+chr(10)
             +'                    when -5 then "包干区段"'+chr(13)+chr(10)
             +'                    when -6 then "包干区段完成"'+chr(13)+chr(10)
             +'                    else "" end,'+chr(13)+chr(10)
             +'        UOMTypeName=(case check1.RateUOMType '+chr(13)+chr(10)
             +'                    when "Quantity" then "数量"'+chr(13)+chr(10)
             +'                    when "Piece" then "件数"'+chr(13)+chr(10)
             +'                    when "Netweight" then "净重"'+chr(13)+chr(10)
             +'                    when "Grossweight" then "毛重"'+chr(13)+chr(10)
             +'                    when "Volume" then "体积"'+chr(13)+chr(10)
             +'                    when "Area" then "面积"'+chr(13)+chr(10)
//             +'                    when "T" then "标签"'
             +'                    else "" end)+"("+rtrim(Check1.CountUOM)+")",'+chr(13)+chr(10)
             +'        costcusname=Check1.costcusname,'+chr(13)+chr(10)
             +'        cusname=Check1.cusname,'+chr(13)+chr(10)
             +'        ShippercusName=Check1.ShippercusName,'+chr(13)+chr(10)
             +'        Check1.SKUName,'+chr(13)+chr(10)
             +'        Check1.CustomsNO,'+chr(13)+chr(10)
             +'        Check1.LocationBillNO,'+chr(13)+chr(10)
             +'        Inout=isnull(cost.costin,0)-isnull(cost.costout,0),'+chr(13)+chr(10)
             +'        Check1.CostName,'+chr(13)+chr(10)
             +'        Check1.key1,wrname=codelib.codename,'+chr(13)+chr(10)
             +'        Check1.SectionSNO,'+chr(13)+chr(10)
             +'        Check1.ContSectSNO,Check1.ContSectItemSNO,'+chr(13)+chr(10)
             +'        Cost.CostCheckName,Check1.WO,Check1.username,  '+chr(13)+chr(10)
             +'        IOCOST=isnull(Cost.IOCOST,0),   '+chr(13)+chr(10)
             +'        IOINVO=isnull(Cost.IOINVO,0),   '+chr(13)+chr(10)
             +'        IOCHARGE=isnull(Cost.IOCHARGE,0),   '+chr(13)+chr(10)
             +'        Cost.DEPARTCHK,   '+chr(13)+chr(10)
             +'        Cost.VOUCHERNO   '+chr(13)+chr(10)
             +'   from #lsquitk Check1(nolock)'+chr(13)+chr(10)
             +'        left join codelib (nolock)'+chr(13)+chr(10)
             +'               on codelib.codeclass="18" '+chr(13)+chr(10)
             +'              and Check1.WareRentCountType=codelib.codecd '+chr(13)+chr(10)
             +'        left join CostItem Cost(nolock)'+chr(13)+chr(10)
             +'               on Check1.Jobno=Cost.Jobno'+chr(13)+chr(10)
             +'              and Check1.SNOSku=Cost.SNOSku'+chr(13)+chr(10)
             +'              and Check1.sno=Cost.sno'+chr(13)+chr(10)
             +'              and Check1.SectionSDate=Cost.costDate'+chr(13)+chr(10)
             +'  order by 1,2,3,4,5,6,7'+chr(13)+chr(10)
             +' drop table #lsquitk';
      OpenSql(qryCostItem,strSql);
      btnCost.Enabled:=True;
      btnCost.SetFocus;
   end;
end;

procedure TfrmCountCCF.CheckCheck; //检查资料是否审核
var
   strthesql:string;
   strremark:string;
begin
   strthesql:='  select distinct locationbillno  '+chr(13)+chr(10)
             +'    from #lskDetailQC detail '+chr(13)+chr(10)
             +'   where 1=1        '+chr(13)+chr(10)
             +'     and exists (select 1 from cost(nolock) '+chr(13)+chr(10)
             +'                  where detail.jobno=cost.jobno '+chr(13)+chr(10)
             +'                    and isnull(cost.checkname,"")="" '+chr(13)+chr(10)
             +'                    and convert(varchar,cost.costdate,102)<="'+dtdCountDate.Text+'"'
             +'                ) ';
   opensql(qryTmp,strthesql);
   if qryTmp.RecordCount<>0 then
   begin
      strremark:='';
      strremark:='还有以下资料未审核:'+chr(13)+chr(10);
      qryTmp.DisableControls;
      qryTmp.First;
      while not qryTmp.Eof do
      begin
         strremark:=strremark+qryTmp.fieldbyname('locationbillno').AsString+chr(13)+chr(10);
         qryTmp.Next;
      end;
      qryTmp.EnableControls;
      memRemark.Text:= strremark;
      blnCheckFalse:=True;
      tbsRemark.TabVisible:=True;
      pgcitem.ActivePage:=tbsRemark;
      btnRefresh.SetFocus;
   end; 
end;

procedure TfrmCountCCF.CheckWareRate;     //检查是否存在对应费率
var
   strthesql:string;
begin
   strthesql:=' declare @ermsg varchar(8000) '+chr(13)+chr(10)
             +'  select @ermsg="" '+chr(13)+chr(10)
             +'  select @ermsg=@ermsg+char(13)+char(10)'+chr(13)+chr(10)
             +'               +rtrim(initem.Jobno)+" "+rtrim(isnull(initem.locationbillno,"")) '+chr(13)+chr(10)
             +'               +" "+convert(char(20),isnull(initem.cusname,""))+" "+rtrim(isnull(initem.skuname,"")) '+chr(13)+chr(10)
             +'    from #lskLocationInItem item,#lskInitem initem '+chr(13)+chr(10)
             +'   where item.jobno=initem.jobno        '+chr(13)+chr(10)
             +'     and item.sno=initem.sno            '+chr(13)+chr(10)
             +'     and not exists (select 1 from warecostrate (nolock)  '+chr(13)+chr(10)
             +'                    where warecostrate.jobno=item.jobno '+chr(13)+chr(10)
             +'                      and warecostrate.sno=item.sno '+chr(13)+chr(10)
             +'                      and warecostrate.costcd="CZ" '+chr(13)+chr(10)
             +'                      and isnull(warecostrate.isincome,"T")='+iif(not ckbCost.Checked,'"T"','"F"')+chr(13)+chr(10)
             +'                  ) '+chr(13)+chr(10)
             +'   if @ermsg<>""'+chr(13)+chr(10)
             +'   begin'+chr(13)+chr(10)
             +'     select ermsg="还有以下资料未获取费率:"+char(13)+char(10)+@ermsg'+chr(13)+chr(10)
             +'     return'+chr(13)+chr(10)
             +'  end else select ermsg="" ';
   opensql(qryTmp,strthesql);
   if qryTmp.fieldbyname('ermsg').AsString<>'' then
   begin
      blnCheckFalse:=True;
      memRemark.Text:=qryTmp.fieldbyname('ermsg').AsString;
      tbsRemark.TabVisible:=True;
      pgcitem.ActivePage:=tbsRemark;
      btnRefresh.SetFocus;
//      kMessageDlg(qryTmp.fieldbyname('ermsg').AsString, mtWarning, [mbOK], 0);
   end;
end;

//计费盘点前的准备过程，生成临时表
procedure TfrmCountCCF.BeforeCount;
begin
//准备临时空表
   droplsk('#CostItemCheck');//记录最终盘点记录
   droplsk('#CostItem');//记录最终费用记录
   droplsk('#CostItemTmp');//记录最终费用记录
   droplsk('#TempLTO');//记录需要计提的资料范围
   droplsk('#WareInventoryDetail');//记录计提时的库存依据
   ExecSql(qryTmp,' CREATE TABLE #CostItemCheck (  '+chr(13)+chr(10)
                +'     costcd                         VARCHAR          (8)        NULL ,  '+chr(13)+chr(10)
                +'     sectionlength                  SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     ratevalue                      NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     countuom                       VARCHAR          (10)       NULL ,  '+chr(13)+chr(10)
                +'     countway                       CHAR             (1)        NULL ,  '+chr(13)+chr(10)
                +'     countcostcd                    VARCHAR          (8)        NULL ,  '+chr(13)+chr(10)
                +'     sectionunit                    VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     costcurrcd                     VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     jobno                          VARCHAR          (20)       NULL ,  '+chr(13)+chr(10)
                +'     snosku                         SMALLINT                    NULL ,  '+chr(13)+chr(10)
                +'     isincome                       CHAR             (1)        NULL ,  '+chr(13)+chr(10)
                +'     rateuomtype                    VARCHAR          (15)          NULL ,  '+chr(13)+chr(10)
                +'     costcusid                      VARCHAR          (20)       NULL ,  '+chr(13)+chr(10)
                +'     costcusname                      VARCHAR          (30)       NULL ,  '+chr(13)+chr(10)
                +'     quantity                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     contype                        VARCHAR          (8)        NULL ,  '+chr(13)+chr(10)
                +'     consptype                      VARCHAR          (8)        NULL ,  '+chr(13)+chr(10)
                +'     checkdate                      DATETIME                    NULL ,  '+chr(13)+chr(10)
                +'     sectionsdate                   DATETIME                    NULL ,  '+chr(13)+chr(10)
                +'     sectionedate                   DATETIME                    NULL ,  '+chr(13)+chr(10)
                +'     sno                            SMALLINT                    NULL ,  '+chr(13)+chr(10)
                +'     sectiontype                    NUMERIC          (16,4)      NULL ,  '+chr(13)+chr(10)
                +'     isempty                        CHAR             (1)           NULL ,  '+chr(13)+chr(10)
                +'     isdefault                      CHAR             (1)           NULL ,  '+chr(13)+chr(10)
                +'     warerentcounttype              VARCHAR          (8)        NULL ,  '+chr(13)+chr(10)
                +'     jobnoin                        VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     snoin                          SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     jobnoinf                       VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     snoinf                         SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     inventory                      NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     liquantity                     NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     sectionsno                     INT                            NULL ,  '+chr(13)+chr(10)
                +'     contsectsno                    INT                            NULL ,  '+chr(13)+chr(10)
                +'     skuid                          VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     skuname                          VARCHAR          (50)          NULL ,  '+chr(13)+chr(10)
                +'     userid                         VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     username                       VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     contsectitemsno                INT                            NULL  '+chr(13)+chr(10)
                +'  )  '+chr(13)+chr(10)
                +' CREATE TABLE #COSTITEM  '+chr(13)+chr(10)
                +'   (  '+chr(13)+chr(10)
                +'     jobno                          VARCHAR          (20)       NULL ,  '+chr(13)+chr(10)
                +'     sno                            SMALLINT                    NULL ,  '+chr(13)+chr(10)
                +'     snosku                         SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     costcd                         VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     costin                         NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     costout                        NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     currcd                         VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     costcusid                      VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     costcusname                    VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     chgrate                        NUMERIC          (16,4)         NULL ,  '+chr(13)+chr(10)
                +'     costdate                       DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     remark                         VARCHAR          (250)         NULL ,  '+chr(13)+chr(10)
                +'     userid                         VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     username                       VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     skuid                          VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     skuname                        VARCHAR          (250)         NULL ,  '+chr(13)+chr(10)
                +'     lister                         VARCHAR          (10)          NULL ,  '+chr(13)+chr(10)
                +'     sdate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     edate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     reason                         VARCHAR          (100)         NULL ,  '+chr(13)+chr(10)
                +'     quantity                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     costrate                       NUMERIC          (16,4)         NULL ,  '+chr(13)+chr(10)
                +'     sectionq                       SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     countday                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     loadcosttype                   VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     isincome                       VARCHAR          (1)           NULL ,  '+chr(13)+chr(10)
                +'     iuserid                        VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     iusername                      VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     buskind                        VARCHAR          (30)          NULL ,  '+chr(13)+chr(10)
                +'     keyindate                      DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     countuom                       VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     countway                       CHAR             (10)          NULL ,  '+chr(13)+chr(10)
                +'     rateuomtype                    VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     contype                        VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     consptype                      VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     jobnoin                        VARCHAR          (20)          NULL  '+chr(13)+chr(10)
                +'    )  '+chr(13)+chr(10)
                +' CREATE TABLE #COSTITEMTmp  '+chr(13)+chr(10)
                +'   (  '+chr(13)+chr(10)
                +'     jobno                          VARCHAR          (20)       NULL ,  '+chr(13)+chr(10)
                +'     sno                            SMALLINT                    NULL ,  '+chr(13)+chr(10)
                +'     snosku                         SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     costcd                         VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     costin                         NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     costout                        NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     currcd                         VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     costcusid                      VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     costcusname                    VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     chgrate                        NUMERIC          (16,4)         NULL ,  '+chr(13)+chr(10)
                +'     costdate                       DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     remark                         VARCHAR          (250)         NULL ,  '+chr(13)+chr(10)
                +'     userid                         VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     username                       VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     skuid                          VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     skuname                        VARCHAR          (250)         NULL ,  '+chr(13)+chr(10)
                +'     lister                         VARCHAR          (10)          NULL ,  '+chr(13)+chr(10)
                +'     sdate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     edate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     reason                         VARCHAR          (100)         NULL ,  '+chr(13)+chr(10)
                +'     quantity                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     costrate                       NUMERIC          (16,4)         NULL ,  '+chr(13)+chr(10)
                +'     sectionq                       SMALLINT                       NULL ,  '+chr(13)+chr(10)
                +'     countday                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                +'     loadcosttype                   VARCHAR          (40)          NULL ,  '+chr(13)+chr(10)
                +'     isincome                       VARCHAR          (1)           NULL ,  '+chr(13)+chr(10)
                +'     iuserid                        VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     iusername                      VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     buskind                        VARCHAR          (30)          NULL ,  '+chr(13)+chr(10)
                +'     keyindate                      DATETIME                       NULL ,  '+chr(13)+chr(10)
                +'     countuom                       VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     countway                       CHAR             (10)          NULL ,  '+chr(13)+chr(10)
                +'     rateuomtype                    VARCHAR          (20)          NULL ,  '+chr(13)+chr(10)
                +'     contype                        VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     consptype                      VARCHAR          (8)           NULL ,  '+chr(13)+chr(10)
                +'     jobnoin                        VARCHAR          (20)          NULL  '+chr(13)+chr(10)
                +'    )  '+chr(13)+chr(10)
                +' CREATE TABLE #WareInventoryDetail  '+chr(13)+chr(10)
                +'   (  '+chr(13)+chr(10)
                +'  JOBNO char (20)  NULL ,  '+chr(13)+chr(10)
                +'  SNO smallint    NULL ,  '+chr(13)+chr(10)
                +'  UserID char (20)  NULL ,  '+chr(13)+chr(10)
                +'  SKUID varchar (40)  NULL ,  '+chr(13)+chr(10)
                +'  SKUName varchar (50)  NULL ,  '+chr(13)+chr(10)
                +'  Quantity numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  Piece numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  Volume numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  Area numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  NetWeight numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  GrossWeight numeric(16, 4) NULL ,  '+chr(13)+chr(10)
                +'  CusID char (20) NOT NULL ,  '+chr(13)+chr(10)
                +'  CostCusID char (20) NOT NULL ,  '+chr(13)+chr(10)
                +'  ShipperCusID char (20) NOT NULL ,  '+chr(13)+chr(10)
                +'  OPERATIONTYPE smallint NOT NULL ,  '+chr(13)+chr(10)
                +'  operationdate datetime NULL ,  '+chr(13)+chr(10)
                +'  WareRentCountType char (8)  NULL ,  '+chr(13)+chr(10)
                +'  WareRentCountTypeOut char (8)  NULL ,  '+chr(13)+chr(10)
                +'  COUNTRENT char (1) NULL ,  '+chr(13)+chr(10)
                +'  COUNTRENTOut char (1) NULL ,   '+chr(13)+chr(10)
                +'  IsCount char (1) NULL ,  '+chr(13)+chr(10)
                +'  IsCountOut char (1) NULL ,    '+chr(13)+chr(10)
                +'  JobnoIN char (20) NULL ,  '+chr(13)+chr(10)
                +'  SNOIN smallint NULL ,  '+chr(13)+chr(10)
                +'  JobnoINF char (20)  NULL ,  '+chr(13)+chr(10)
                +'  SNOINF smallint    NULL  '+chr(13)+chr(10)
                +'    )  '+chr(13)+chr(10)
                +' create table #TempLTO  '+chr(13)+chr(10)
                +' (  '+chr(13)+chr(10)
                +'     operationdate                        datetime                       null,  '+chr(13)+chr(10)
                +'     Jobno                          char             (20)          null,  '+chr(13)+chr(10)
                +'     SNO                            smallint                       null,  '+chr(13)+chr(10)
                +'     JobnoIN                       char             (20)          null,  '+chr(13)+chr(10)
                +'     SNOIN                         smallint                       null,  '+chr(13)+chr(10)
                +'     JobnoINF                     char             (20)          null,  '+chr(13)+chr(10)
                +'     SNOINF                       smallint                       null,  '+chr(13)+chr(10)
                +'     CountSNO                       int                            null,  '+chr(13)+chr(10)
                +'     SectionSNO                     int                            null,  '+chr(13)+chr(10)
                +'     ContSectSNO                    int                            null,  '+chr(13)+chr(10)
                +'     ContSectItemSNO                int                            null,  '+chr(13)+chr(10)
                +'     WareRentCountType              VARCHAR          (8)           NULL,  '+chr(13)+chr(10)
                +'     UserID                         VARCHAR          (20)          NULL,  '+chr(13)+chr(10)
                +'     SKUName                          VARCHAR          (50)          NULL,  '+chr(13)+chr(10)
                +'     SKUID                          VARCHAR          (40)          NULL  '+chr(13)+chr(10)
                +'  )  ');
   edtSql.Text:=edtSql.Text+qryTmp.SQL.Text+chr(13)+chr(10);   //获取跟踪SQL
   droplsk('#lskLocationInItem');//记录选中记录的范围
   ExecSql(qryTmp,' select jobno,sno into #lskLocationInItem from #lskInItem where checked="T" ');
   edtSql.Text:=edtSql.Text+qryTmp.SQL.Text+chr(13)+chr(10);   //获取跟踪SQL
{   droplsk('#lskDetailQC');//记录对应选中范围资料的所有库存
   ExecSql(qryTmp,' select locationinitem.jobno,locationinitem.sno,userid,skuid,skuname, '+chr(13)+chr(10)
                 +'        quantity,piece,volume,area,netweight,grossweight, '+chr(13)+chr(10)
                 +'        cusid,costcusid,shippercusid,cusname,costcusname,shippercusname, '+chr(13)+chr(10)
                 +'        operationtype=1,operationdate, '+chr(13)+chr(10)
                 +'        warerentcounttype,warerentcounttypeout, '+chr(13)+chr(10)
                 +'        countrent,countrentout,iscount,iscountout, '+chr(13)+chr(10)
                 +'        locationbillno,customsno, '+chr(13)+chr(10)
                 +'        jobnoin,snoin,jobnoinf,snoinf,iusername '+chr(13)+chr(10)
                 +'   into #lskdetailqc '+chr(13)+chr(10)
                 +'   from locationinitem (nolock),#lsklocationinitem  '+chr(13)+chr(10)
                 +'  where locationinitem.jobno=#lsklocationinitem.jobno '+chr(13)+chr(10)
                 +'    and locationinitem.sno=#lsklocationinitem.sno '+chr(13)+chr(10)
                 +'  union all  '+chr(13)+chr(10)
                 +' select locationoutitem.jobno,locationoutitem.sno,userid,skuid,skuname, '+chr(13)+chr(10)
                 +'        quantity,piece,volume,area,netweight,grossweight, '+chr(13)+chr(10)
                 +'        cusid,costcusid,shippercusid,cusname,costcusname,shippercusname, '+chr(13)+chr(10)
                 +'        operationtype=-1,operationdate, '+chr(13)+chr(10)
                 +'        warerentcounttype,warerentcounttypeout, '+chr(13)+chr(10)
                 +'        countrent,countrentout,iscount,iscountout, '+chr(13)+chr(10)
                 +'        locationbillno,customsno, '+chr(13)+chr(10)
                 +'        jobnoin,snoin,jobnoinf,snoinf,iusername '+chr(13)+chr(10)
                 +'   from locationoutitem (nolock),#lsklocationinitem  '+chr(13)+chr(10)
                 +'  where locationoutitem.jobnoin=#lsklocationinitem.jobno '+chr(13)+chr(10)
                 +'    and locationoutitem.snoin=#lsklocationinitem.sno '+chr(13)+chr(10)
                 +'    and convert(char(10),locationoutitem.operationdate,102)<="'+dtdCountDate.Text+'" '+chr(13)+chr(10) //whl
                 );
   edtSql.Text:=edtSql.Text+qryTmp.SQL.Text+chr(13)+chr(10); }  //获取跟踪SQL
end;

procedure TfrmCountCCF.btncloseClick(Sender: TObject);
begin
   close;
end;

procedure TfrmCountCCF.btnCostClick(Sender: TObject);
var
   i:integer;
begin
   if (qryCostItem.FieldByName('Jobno').asString='') then
   begin
     kmessagedlg('无可'+iif(not blnCount,'放弃的','')+'计提费用!', mtInformation,[mbOk],0);
     exit;
   end;
   { else
   if (blnTest or (qryTest.FieldByName('Jobno').asString<>'')) and not blnQuit then
   begin
     kmessagedlg('计费数据中包含测算内容,无法计提费用!', mtInformation,[mbOk],0);
     exit;
   end;}
   //在费用放弃计提中,不允许有财务已复核、业务已复核、已催款或开发票、已实收付、已生成凭证的记录
   if not blnCount then
   begin
      with qryCostItem do
      begin
         DisableControls;
         First;
         while not Eof do
         begin
            if FieldByName('costcheckname').AsString<>'' then
            begin
              kmessagedlg('计费数据中包含财务复核过的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;
            if FieldByName('VOUCHERNO').AsString<>'' then
            begin
              kmessagedlg('计费数据中包含已生成凭证的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;
            if FieldByName('DEPARTCHK').AsString<>'' then
            begin
              kmessagedlg('计费数据中包含部门复核过的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;

            if FieldByName('IOCOST').AsInteger<>0 then
            begin
              kmessagedlg('计费数据中包含已实收付的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;
            if FieldByName('IOINVO').AsInteger<>0 then
            begin
              kmessagedlg('计费数据中包含已开发票的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;
            if FieldByName('IOCHARGE').AsInteger<>0 then
            begin
              kmessagedlg('计费数据中包含已催款的内容,无法放弃费用计提!', mtInformation,[mbOk],0);
              EnableControls;
              exit;
            end;

            Next;
         end;
         First;
         EnableControls;
      end;
   end;
   if (KmessageDlg(iif(not blnCount,'放弃','')+'计提后，'+dtdCountDate.text+'以前的数据将不允许更改，确定吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes)
      then
   begin
      _ADOConnection.StartTransaction;
      try
         strsql:='';
         if blnCount then
         begin
            strsql:=' exec ksp_CostItemCheck_CZ_JT'
                   +'      @costcd="'+cmbcostcd.TextField+'", '
                   +'      @costrate='+edtProfitFr.Text+',  '
                   +iif(edtProfitFr.value<>0,'@inserttype="T"','@inserttype="F"');
            execsql(qryTmp,strsql);
            strsql:=' exec ksp_CostItemCheck_CZ_JT_End '
                   +iif(not ckbCost.Checked, '   @CT_IsIncomeCR="T", ', '   @CT_IsIncomeCR="F", ')
                   +'                     @CountDate="'+dtdCountDate.text+'",'
                   +'                     @CountUserName="'+_LoginName+'"';
            execsql(qryTmp,strsql);
         end else
         begin
            strsql:=' exec ksp_CostItemCheck_CZ_FQ '
                   +iif(not ckbCost.Checked, '   @CT_IsIncomeCR="T", ', '   @CT_IsIncomeCR="F", ')
                   +'                     @CountDate="'+dtdCountDate.text+'" ';
            execsql(qryTmp,strsql);
            strsql:=' exec ksp_CostItemCheck_CZ_FQ_End '
                   +iif(not ckbCost.Checked, '   @CT_IsIncomeCR="T", ', '   @CT_IsIncomeCR="F", ')
                   +'                     @CountDate="'+dtdCountDate.text+'" ';
            execsql(qryTmp,strsql);
         end;
         _ADOConnection.Commit;
      except
         try
           _ADOConnection.Rollback;
         except
         end;
         kMessageDlg(Exception(ExceptObject).Message, mtWarning, [mbOK], 0);
         Raise;
         Exit;
      end;
      kmessagedlg('仓租费用'+iif(not blnCount,'放弃','')+'计提完毕!', mtInformation,[mbOk],0);
      btnCost.Enabled:=false;
      qryAutoCost.Close;
      qrySku.Close;
      qryCon.Close;
      qryCostRate.Close;
      qryCostItem.Close;
      qryWareCostRate.Close;
      qrycost.Close;
      edtsql.Clear;
   end;
end;

procedure TfrmCountCCF.edtCostAccountNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('A','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      TdxButtonEdit(Sender).TextField :=qrySelect.FieldByName('Cusid').asstring;
      TdxButtonEdit(Sender).Text      :=qrySelect.FieldByName('Cusname').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCountCCF.edtCusNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('B','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      TdxButtonEdit(Sender).TextField :=qrySelect.FieldByName('Cusid').asstring;
      TdxButtonEdit(Sender).Text:=qrySelect.FieldByName('Cusname').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCountCCF.edtShipperNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      TdxButtonEdit(Sender).TextField :=qrySelect.FieldByName('Cusid').asstring;
      TdxButtonEdit(Sender).Text:=qrySelect.FieldByName('Cusname').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCountCCF.edtuseridButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect(_Userid,'U','F');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtuserid.TextField :=qrySelect.FieldByName('userid').asstring;
      edtuserid.Text      :=qrySelect.FieldByName('username').asstring;
//      TdxButtonEdit(Sender).TextField :=qrySelect.FieldByName('userid').asstring;
//      TdxButtonEdit(Sender).Text      :=qrySelect.FieldByName('username').asstring;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmCountCCF.dtdCountDateChange(Sender: TObject);
begin
   if btnCost.Enabled then btnCost.Enabled:=false;
end;

procedure TfrmCountCCF.ckbCostChange(Sender: TObject);
begin
   if btnCost.Enabled then btnCost.Enabled:=false;
end;

procedure TfrmCountCCF.edtuseridExit(Sender: TObject);
begin
  if  edtuserid.Text='' then edtuserid.TextField:='';
end;

procedure TfrmCountCCF.btnPrintClick(Sender: TObject);
var
   lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   WorkdxGridOut(grdCostItem,lstPara,'报表输出')
end;

procedure TfrmCountCCF.checkedValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
   if qrycost.FieldByName('checked').asstring='F' then
   begin
      strSql:='update #lskInItem set checked="T"  '
             +' where jobno="'+qryCost.fieldByName('jobno').AsString+'"   '
             +'   and sno="'+qryCost.fieldByName('sno').AsString+'"  ';
      ExecSql(qryTmp,strSql);
   end else
   begin
      strSql:='update #lskInItem set checked="F"  '
             +' where jobno="'+qryCost.fieldByName('jobno').AsString+'"   '
             +'   and sno="'+qryCost.fieldByName('sno').AsString+'"  ';
      ExecSql(qryTmp,strSql);
   end;
end;

procedure TfrmCountCCF.edtProfitFrEnter(Sender: TObject);
begin
   if cmbcostcd.Text='' then
      edtProfitFr.Enabled:=False
   else
      edtProfitFr.Enabled:=True;
end;

end.







