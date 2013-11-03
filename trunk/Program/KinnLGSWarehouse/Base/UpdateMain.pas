unit UpdateMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn,
  KinPickEdit, DB, DBTables, dxDBELib, DBKINCGrids, KSText, ComCtrls,
  frstatus, KGroupBox, GMSLabel, DbButtons, ExtCtrls, DBClient,
  KDataSetProvider,LIBPROC;

type
  TfrmUpdateMain = class(TForm)
    btnOk: TKBitBtn;
    qryTmp: TKADOQuery;
    btnCancel: TKBitBtn;
    qryMain: TKADOQuery;
    dtsMain: TDataSource;
    edtLocationBillNO: TdxDBEdit;
    gmsLocationBillNO: TGMSStickyLabel;
    GMSStickyLabel9: TGMSStickyLabel;
    edtCostAccount: TdxDBButtonEdit;
    KGroupBox2: TKGroupBox;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    GMSStickyLabel14: TGMSStickyLabel;
    GMSStickyLabel49: TGMSStickyLabel;
    gmsBillNO: TGMSStickyLabel;
    GMSStickyLabel50: TGMSStickyLabel;
    GMSStickyLabel15: TGMSStickyLabel;
    GMSStickyLabel16: TGMSStickyLabel;
    gmsConDescription: TGMSStickyLabel;
    GMSStickyLabel23: TGMSStickyLabel;
    GMSStickyLabel25: TGMSStickyLabel;
    GMSStickyLabel18: TGMSStickyLabel;
    GMSStickyLabel19: TGMSStickyLabel;
    GMSStickyLabel35: TGMSStickyLabel;
    GMSStickyLabel21: TGMSStickyLabel;
    GMSStickyLabel22: TGMSStickyLabel;
    GMSStickyLabel26: TGMSStickyLabel;
    GMSStickyLabel27: TGMSStickyLabel;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel24: TGMSStickyLabel;
    GMSStickyLabel28: TGMSStickyLabel;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel32: TGMSStickyLabel;
    cmbConsignAccountID: TdxDBButtonEdit;
    cmbCarrierAccountID: TdxDBButtonEdit;
    edtOPID: TdxDBButtonEdit;
    edtBlNO: TdxDBEdit;
    edtCARRIERNO: TdxDBEdit;
    edtTotalCost: TdxDBCalcEdit;
    edtConQuantityTotal: TdxDBCalcEdit;
    edtOriginOrder: TdxDBEdit;
    edtDestOrder: TdxDBEdit;
    edtMainOrder: TdxDBEdit;
    edtCarbrand: TdxDBEdit;
    edtETSH: TdxDBDateEdit;
    timETSH: TdxDBTimeEdit;
    edtFC_PORTDCD: TdxDBButtonEdit;
    edtFC_TRANSCD: TdxDBButtonEdit;
    edtFC_PORTLCD: TdxDBButtonEdit;
    edtCarrierName: TKinDbPickEdit;
    edtconno: TdxDBBlobEdit;
    edtConDescription: TdxDBBlobEdit;
    dtdcarrierdate: TdxDBDateEdit;
    tmtcarrierdate: TdxDBTimeEdit;
    edtRouting: TdxDBBlobEdit;
    dtdconloaddate: TdxDBDateEdit;
    tmtconloaddate: TdxDBTimeEdit;
    customsno1: TdxDBEdit;
    cmbCususername: TKinDbPickEdit;
    cmbLoadcosttype: TKinDbPickEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    GMSStickyLabel3: TGMSStickyLabel;
    edtremark: TdxDBBlobEdit;
    ckbisbroken: TdxDBCheckEdit;
    GMSStickyLabel36: TGMSStickyLabel;
    edtbrokenmark: TdxDBBlobEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSKUNameEnter(Sender: TObject);
    procedure qryMainUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure btnCloseClick(Sender: TObject);
    procedure cmbQuantityUOMTaskEnter(Sender: TObject);
    procedure edtOPIDButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cmbConsignAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbCarrierAccountIDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_PORTLCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_TRANSCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtFC_PORTDCDButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    DataState:TDataState;              //form状态
    strJobno,strDataBaseID:string;
    blnType:boolean;
    theResult:boolean;
    blnSelect:Boolean;
  public
    { Public declarations }
  end;

function WorkUpdateMain(pJobno:string;pType:boolean):boolean;

var
  frmUpdateMain: TfrmUpdateMain;

implementation

{$R *.dfm}

uses Datas,libUser,kindlg,main, Saveget,GetDllPub,libuserPub;

var
   strsql,strTable:string;

function WorkUpdateMain(pJobno:string;pType:boolean):boolean;
begin
   frmUpdateMain:=TfrmUpdateMain.Create(Application);
   with frmUpdateMain do
   begin
     theResult:=False;
     strJobno:=pJobno;
     blnType:=pType;
     if Pos('VA',strJobno)<>0 then
     begin
       strTable:='ValueAdd';
       dtdCARRIERDATE.DataSource:=nil;
       tmtcarrierdate.DataSource:=nil;
       dtdCARRIERDATE.DataField:='';
     end;
     //初始化
     InitdbPick(cmbCususername,'cususer','cususername','cususername','1=1');
      //船名
     InitdbPick(edtCarrierName,'vessel','vesselcd','vesselname','1=1');
     //装卸方式
     InitdbPick(cmbLoadcosttype,'codelib','codename','codename','codeclass="19"');
     if _operationtype=1 then
     begin
        strTable:='Locationin';
     end else
     begin
        strTable:='Locationout';
     end;
     //数据记录
     strsql:='select MainTable.*                   '+chr(13)+chr(10)
            +'  from '+strTable+'  MainTable(nolock)                 '+chr(13)+chr(10)
            +' where MainTable.JOBNO="'+strJobno+'" '+chr(13)+chr(10)
            ;
     qryMain.Close;
     qryMain.Sql.Clear;
     qryMain.Sql.Add(strsql);
     qryMain.Open;

     ShowModal;
     WorkUpdateMain:=theResult;
     Free;
   end;
end;

procedure TfrmUpdateMain.FormCreate(Sender: TObject);
begin
  Height:=455;
  Width :=722;
  SetFormPosition(self,True);
  SetFormStyle(Self);
   //设置GROUPBOX的风格
  SetGroupBox(KGroupBox2);
  qryTmp.Connection:=_ADOConnection;
  qryMain.Connection:=_ADOConnection;
end;

procedure TfrmUpdateMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         ReturnNext(Self);
      Vk_Escape:
      begin
         Key:=0;
         theResult:=False;
         frmUpdateMain.Close;
      end;
   end;
end;

procedure TfrmUpdateMain.btnOkClick(Sender: TObject);
begin
  try
    _ADOConnection.Starttransaction;
    //发数据更新命令
    if strTable='Locationout' then
    begin
      strSql:='update Locationout  set '+chr(13)+chr(10)
             +'       MainOrder="'+qryMain.fieldbyname('MainOrder').AsString+'", '+chr(13)+chr(10)
             +'       OriginOrder= "'+qrymain.fieldbyname('OriginOrder').AsString+'", '+chr(13)+chr(10)
             +'       DestOrder= "'+qrymain.fieldbyname('DestOrder').AsString+'", '+chr(13)+chr(10)
             +'       shipcusname= "'+qrymain.fieldbyname('shipcusname').AsString+'", '+chr(13)+chr(10)
             +'       carriercusname= "'+qrymain.fieldbyname('carriercusname').AsString+'", '+chr(13)+chr(10)
             +'       opname= "'+qrymain.fieldbyname('opname').AsString+'", '+chr(13)+chr(10)
             +'       cususername= "'+qrymain.fieldbyname('cususername').AsString+'", '+chr(13)+chr(10)
             +'       CarrierName= "'+qrymain.fieldbyname('CarrierName').AsString+'", '+chr(13)+chr(10)
             +'       CARRIERNO= "'+qrymain.fieldbyname('CARRIERNO').AsString+'", '+chr(13)+chr(10)
             +'       PORTL= "'+qrymain.fieldbyname('PORTL').AsString+'", '+chr(13)+chr(10)
             +'       TRANS= "'+qrymain.fieldbyname('TRANS').AsString+'", '+chr(13)+chr(10)
             +'       PORTD= "'+qrymain.fieldbyname('PORTD').AsString+'", '+chr(13)+chr(10)
             +'       conno= "'+qrymain.fieldbyname('conno').AsString+'", '+chr(13)+chr(10)
             +'       ConDes= "'+qrymain.fieldbyname('ConDes').AsString+'", '+chr(13)+chr(10)
             +'       CONQuantity= "'+floattostr(qrymain.fieldbyname('CONQuantity').asfloat)+'", '+chr(13)+chr(10)
             +'       carbrand= "'+qrymain.fieldbyname('carbrand').AsString+'", '+chr(13)+chr(10)
             +'       Routing= "'+qrymain.fieldbyname('Routing').AsString+'", '+chr(13)+chr(10)
             +'       loadcosttype= "'+qrymain.fieldbyname('loadcosttype').AsString+'", '+chr(13)+chr(10)
             +'       skucost= "'+qrymain.fieldbyname('skucost').AsString+'", '+chr(13)+chr(10)
             +'       BLNO= "'+qrymain.fieldbyname('BLNO').AsString+'", '+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('ETSH').AsDateTime=0,'      ETSH=null, ','       ETSH="'+qryMain.fieldbyname('ETSH').AsString+'", ')+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('conloaddate').AsDateTime=0,'      conloaddate=null, ', '       conloaddate="'+qryMain.fieldbyname('conloaddate').AsString+'", ')+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('CARRIERDATE').AsDateTime=0,'      CARRIERDATE=null, ', '       CARRIERDATE="'+qryMain.fieldbyname('CARRIERDATE').AsString+'", ')+chr(13)+chr(10)
             +'       customsno= "'+qrymain.fieldbyname('customsno').AsString+'" '+chr(13)+chr(10)
             +' where Locationout.JOBNO="'+strJobno+'" '+chr(13)+chr(10)
             ;
      execSql(qryTmp,strSql);
    end else
    if strTable='Locationin' then
    begin
      strSql:='update Locationin  set '+chr(13)+chr(10)
             +'       MainOrder="'+qryMain.fieldbyname('MainOrder').AsString+'", '+chr(13)+chr(10)
             +'       OriginOrder= "'+qrymain.fieldbyname('OriginOrder').AsString+'", '+chr(13)+chr(10)
             +'       DestOrder= "'+qrymain.fieldbyname('DestOrder').AsString+'", '+chr(13)+chr(10)
             +'       shipcusname= "'+qrymain.fieldbyname('shipcusname').AsString+'", '+chr(13)+chr(10)
             +'       carriercusname= "'+qrymain.fieldbyname('carriercusname').AsString+'", '+chr(13)+chr(10)
             +'       opname= "'+qrymain.fieldbyname('opname').AsString+'", '+chr(13)+chr(10)
             +'       cususername= "'+qrymain.fieldbyname('cususername').AsString+'", '+chr(13)+chr(10)
             +'       CarrierName= "'+qrymain.fieldbyname('CarrierName').AsString+'", '+chr(13)+chr(10)
             +'       CARRIERNO= "'+qrymain.fieldbyname('CARRIERNO').AsString+'", '+chr(13)+chr(10)
             +'       PORTL= "'+qrymain.fieldbyname('PORTL').AsString+'", '+chr(13)+chr(10)
             +'       TRANS= "'+qrymain.fieldbyname('TRANS').AsString+'", '+chr(13)+chr(10)
             +'       PORTD= "'+qrymain.fieldbyname('PORTD').AsString+'", '+chr(13)+chr(10)
             +'       conno= "'+qrymain.fieldbyname('conno').AsString+'", '+chr(13)+chr(10)
             +'       ConDes= "'+qrymain.fieldbyname('ConDes').AsString+'", '+chr(13)+chr(10)
             +'       CONQuantity= "'+floattostr(qrymain.fieldbyname('CONQuantity').asfloat)+'", '+chr(13)+chr(10)
             +'       carbrand= "'+qrymain.fieldbyname('carbrand').AsString+'", '+chr(13)+chr(10)
             +'       Routing= "'+qrymain.fieldbyname('Routing').AsString+'", '+chr(13)+chr(10)
             +'       loadcosttype= "'+qrymain.fieldbyname('loadcosttype').AsString+'", '+chr(13)+chr(10)
             +'       skucost= "'+qrymain.fieldbyname('skucost').AsString+'", '+chr(13)+chr(10)
             +'       BLNO= "'+qrymain.fieldbyname('BLNO').AsString+'", '+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('ETSH').AsDateTime=0,'      ETSH=null, ','       ETSH="'+qryMain.fieldbyname('ETSH').AsString+'", ')+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('conloaddate').AsDateTime=0,'      conloaddate=null, ', '       conloaddate="'+qryMain.fieldbyname('conloaddate').AsString+'", ')+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('CARRIERDATE').AsDateTime=0,'      CARRIERDATE=null, ', '       CARRIERDATE="'+qryMain.fieldbyname('CARRIERDATE').AsString+'", ')+chr(13)+chr(10)
             +'       customsno= "'+qrymain.fieldbyname('customsno').AsString+'", '+chr(13)+chr(10)
             +'       remark="'+qrymain.fieldbyname('remark').AsString+'",     '+chr(13)+chr(10)
             +'       isbroken= "'+qrymain.fieldbyname('isbroken').AsString+'", '+chr(13)+chr(10)
             +'       brokenmark= "'+qrymain.fieldbyname('brokenmark').AsString+'" '+chr(13)+chr(10)             
             +' where Locationin.JOBNO="'+strJobno+'" '+chr(13)+chr(10)
             ;
      execSql(qryTmp,strSql);
    end else
    begin
      strSql:='update valueadd  set '+chr(13)+chr(10)
             +'       MainOrder="'+qryMain.fieldbyname('MainOrder').AsString+'", '+chr(13)+chr(10)
             +'       OriginOrder= "'+qrymain.fieldbyname('OriginOrder').AsString+'", '+chr(13)+chr(10)
             +'       DestOrder= "'+qrymain.fieldbyname('DestOrder').AsString+'", '+chr(13)+chr(10)
             +'       opname= "'+qrymain.fieldbyname('opname').AsString+'", '+chr(13)+chr(10)
             +'       cususername= "'+qrymain.fieldbyname('cususername').AsString+'", '+chr(13)+chr(10)
             +'       CarrierName= "'+qrymain.fieldbyname('CarrierName').AsString+'", '+chr(13)+chr(10)
             +'       CARRIERNO= "'+qrymain.fieldbyname('CARRIERNO').AsString+'", '+chr(13)+chr(10)
             +'       PORTL= "'+qrymain.fieldbyname('PORTL').AsString+'", '+chr(13)+chr(10)
             +'       TRANS= "'+qrymain.fieldbyname('TRANS').AsString+'", '+chr(13)+chr(10)
             +'       PORTD= "'+qrymain.fieldbyname('PORTD').AsString+'", '+chr(13)+chr(10)
             +'       ConDes= "'+qrymain.fieldbyname('ConDes').AsString+'", '+chr(13)+chr(10)
             +'       CONQuantity= "'+floattostr(qrymain.fieldbyname('CONQuantity').asfloat)+'", '+chr(13)+chr(10)
             +'       carbrand= "'+qrymain.fieldbyname('carbrand').AsString+'", '+chr(13)+chr(10)
             +'       loadcosttype= "'+qrymain.fieldbyname('loadcosttype').AsString+'", '+chr(13)+chr(10)
             +'       BLNO= "'+qrymain.fieldbyname('BLNO').AsString+'", '+chr(13)+chr(10)
             +iif(qryMain.fieldbyname('ETSH').AsDateTime=0,'      ETSH=null, ','       ETSH="'+qryMain.fieldbyname('ETSH').AsString+'", ')+chr(13)+chr(10)
             +'       customsno= "'+qrymain.fieldbyname('customsno').AsString+'" '+chr(13)+chr(10)
             +' where valueadd.JOBNO="'+strJobno+'" '+chr(13)+chr(10)
             ;
      execSql(qryTmp,strSql);
    end;
    _ADOConnection.Commit;
  except
     _ADOConnection.Rollback; //先结束事务
     raise;
     Exit;
  end;

  theResult:=True;
  frmUpdateMain.Close;
end;

procedure TfrmUpdateMain.btnCancelClick(Sender: TObject);
begin
  frmUpdateMain.Close;
end;

procedure TfrmUpdateMain.FormDestroy(Sender: TObject);
begin
  frmUpdateMain:=nil;
end;

procedure TfrmUpdateMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure TfrmUpdateMain.edtSKUNameEnter(Sender: TObject);
begin
    TdxDBEdit(sender).ReadOnly:=True;
end;

procedure TfrmUpdateMain.qryMainUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction:=uaApplied;
end;

procedure TfrmUpdateMain.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmUpdateMain.cmbQuantityUOMTaskEnter(Sender: TObject);
begin
  TKinDBPickEdit(sender).ReadOnly:=True;
end;

procedure TfrmUpdateMain.edtOPIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetOperatorSelect('');
   if qrySelect.FieldByName('opid').AsString<>'NO' then
   begin
      qryMain.Edit;
      qrymain.FieldByName('opid').AsString  :=qrySelect.FieldByName('opid').asstring;
      qryMain.FieldByName('opname').AsString  :=qrySelect.FieldByName('opname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmUpdateMain.cmbConsignAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('F','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      qryMain.FieldByName('shipcusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
      qryMain.FieldByName('shipcusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmUpdateMain.cmbCarrierAccountIDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('D','');
   if qrySelect.FieldByName('cusid').AsString<>'NO' then
   begin
      qryMain.FieldByName('carriercusid').AsString  :=qrySelect.FieldByName('Cusid').asstring;
      qryMain.FieldByName('carriercusname').AsString  :=qrySelect.FieldByName('Cusname').asstring;
      blnSelect:=True;
      ReturnNext(Self);
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmUpdateMain.edtFC_PORTLCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetPortSelect('','F');
   if qrySelect.FieldByName('Portcd').AsString<>'NO' then
   begin
     qryMain.FieldByName('portl').AsString  :=qrySelect.FieldByName('portcname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmUpdateMain.edtFC_TRANSCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetPortSelect('','F');
   if qrySelect.FieldByName('Portcd').AsString<>'NO' then
   begin
      qryMain.FieldByName('TRANS').AsString  :=qrySelect.FieldByName('portcname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrmUpdateMain.edtFC_PORTDCDButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetPortSelect('','F');
   if qrySelect.FieldByName('Portcd').AsString<>'NO' then
   begin
     qryMain.FieldByName('portd').AsString  :=qrySelect.FieldByName('portcname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

end.
