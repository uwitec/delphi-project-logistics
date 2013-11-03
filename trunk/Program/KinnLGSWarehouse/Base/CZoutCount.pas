unit CZoutCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, DB,
  DBTables,libUser, GMSLabel, KinPickEdit,KDataSetProvider, KGroupBox,
  DBClient;

type
  TfrmCZoutCount = class(TForm)
    btnOk: TKBitBtn;
    btnCancel: TKBitBtn;
    qryTmp: TKADOQuery;
    KGroupBox6: TKGroupBox;
    GMSStickyLabel38: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    edtpricein: TdxCurrencyEdit;
    dtdReceDateF: TdxDateEdit;
    GMSStickyLabel10: TGMSStickyLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    strjobno:string;
    strtype:string;
    blnSelect:Boolean;
  public
    { Public declarations }
  end;

procedure WorkCZoutCount(pstringjobno:string);

var
  frmCZoutCount: TfrmCZoutCount;

implementation

{$R *.dfm}

uses kindlg,datas,libproc,main, datasTmp,libuserPub, GetDllPub;


procedure WorkCZoutCount(pstringjobno:string);
begin
   frmCZoutCount:=TfrmCZoutCount.Create(Application);
   with frmCZoutCount do
   begin
     strjobno:=pstringjobno;
     showmodal;
     Free;
   end;
//  frmWareOrderType.Free;
end;


procedure TfrmCZoutCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrmCZoutCount.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
   end;
end;

procedure TfrmCZoutCount.FormDestroy(Sender: TObject);
begin
   frmCZoutCount:=nil;
end;

procedure TfrmCZoutCount.FormCreate(Sender: TObject);
begin
  SetFormPosition(Self,True);
  SetFormStyle(Self);
  SetGroupbox(KGroupBox6);
  qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmCZoutCount.btnCancelClick(Sender: TObject);
begin
   frmCZoutCount.Close;
end;

procedure TfrmCZoutCount.btnOkClick(Sender: TObject);
begin
   if strjobno<>'' then
   begin
      droplsk('#CostItem');
      ExecSql(qryTmp,'CREATE TABLE #costitem   /*费用－费用明细*/  '+chr(13)+chr(10)
                    +'     (      '+chr(13)+chr(10)
                    +'       jobno                          VARCHAR          (20)      NOT NULL ,/*工作号*/      '+chr(13)+chr(10)
                    +'       sno                            SMALLINT                   NOT NULL ,/*序号*/      '+chr(13)+chr(10)
                    +'       snosku                         SMALLINT                       NULL ,/*对应业务表商品信息序号（主费用取－11，手工录入为－10）,*/      '+chr(13)+chr(10)
                    +'       costcd                         VARCHAR          (8)           NULL ,/*费用代码*/      '+chr(13)+chr(10)
                    +'       costin                         NUMERIC          (16,2)        NULL ,/*收入*/      '+chr(13)+chr(10)
                    +'       costout                        NUMERIC          (16,2)        NULL ,/*支出*/      '+chr(13)+chr(10)
                    +'       currcd                         VARCHAR          (8)           NULL ,/*币种代码*/      '+chr(13)+chr(10)
                    +'       costcusid                      VARCHAR          (20)          NULL ,/*关系人代码*/      '+chr(13)+chr(10)
                    +'       costcusname                    VARCHAR          (40)          NULL ,/*关系人名称*/      '+chr(13)+chr(10)
                    +'       remark                         VARCHAR          (250)         NULL ,/*摘要*/      '+chr(13)+chr(10)
                    +'       costdate                       DATETIME                       NULL ,/*收或付款时间*/      '+chr(13)+chr(10)
                    +'       userid                         VARCHAR          (20)          NULL ,/*组织代码*/      '+chr(13)+chr(10)
                    +'       username                       VARCHAR          (20)          NULL ,/*组织名称*/      '+chr(13)+chr(10)
                    +'       skuid                          VARCHAR          (40)          NULL ,/*商品代码*/      '+chr(13)+chr(10)
                    +'       skuname                        VARCHAR          (250)         NULL ,/*商品名称*/      '+chr(13)+chr(10)
                    +'       lister                         VARCHAR          (10)          NULL ,/*计费人*/      '+chr(13)+chr(10)
                    +'       sdate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                    +'       edate                          DATETIME                       NULL ,  '+chr(13)+chr(10)
                    +'       quantity                       NUMERIC          (16,4)        NULL ,/*数量（如对于超仓仓租，特指超仓面积）*/      '+chr(13)+chr(10)
                    +'       costrate                       NUMERIC          (9,2)         NULL ,/*单价（如对于超仓仓租，特指超仓单价）*/      '+chr(13)+chr(10)
                    +'       sectionq                       SMALLINT                       NULL ,  '+chr(13)+chr(10)
                    +'       countday                       NUMERIC          (16,4)        NULL ,  '+chr(13)+chr(10)
                    +'       isincome                       VARCHAR          (1)           NULL ,/*收入/支出标志*/      '+chr(13)+chr(10)
                    +'       buskind                        VARCHAR          (30)          NULL ,/*业务类型(仓储进出仓、配送等)*/      '+chr(13)+chr(10)
                    +'       countuom                       VARCHAR          (8)           NULL ,/*计费单位（仅对于散装指单位，需显示类别）*/      '+chr(13)+chr(10)
                    +'       countway                       CHAR             (10)          NULL ,/*计费方式（Container柜装Bulk散装Proportion比例）*/      '+chr(13)+chr(10)
                    +'       rateuomtype                    VARCHAR          (20)          NULL /*计费单位类别*/      '+chr(13)+chr(10)
                    +'      )      '+chr(13)+chr(10)
             );

      ExecSql(qryTmp,'insert into #costitem '
                    +'select detail.jobno,sno=0,detail.sno,                                                                                      '+chr(13)+chr(10)
                    +'       costcd="CZ",                                                                                                        '+chr(13)+chr(10)
                    +'       costin=(case when rate.rateuomtype="quantity" then detail.quantity                                                  '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="piece" then detail.piece                                                       '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="netweight" then detail.netweight                                               '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="grossweight" then detail.grossweight                                           '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="volume" then detail.volume                                                     '+chr(13)+chr(10)
                    +'                     else 0 end)*rate.ratevalue                                                                            '+chr(13)+chr(10)
                    +'               *(datediff(day,convert(varchar,indetail.operationdate,102),convert(varchar,detail.operationdate,102))+1),   '+chr(13)+chr(10)
                    +'       costout=0,                                                                                                          '+chr(13)+chr(10)
                    +'       currcd=rate.currcd,                                                                                                 '+chr(13)+chr(10)
                    +'       costcusid=detail.costcusid,                                                                                         '+chr(13)+chr(10)
                    +'       costcusname=detail.costcusname,                                                                                     '+chr(13)+chr(10)
                    +'       remark=convert(varchar,(case when rate.rateuomtype="quantity" then detail.quantity                                  '+chr(13)+chr(10)
                    +'                                    when rate.rateuomtype="piece" then detail.piece                                        '+chr(13)+chr(10)
                    +'                                    when rate.rateuomtype="netweight" then detail.netweight                                '+chr(13)+chr(10)
                    +'                                    when rate.rateuomtype="grossweight" then detail.grossweight                            '+chr(13)+chr(10)
                    +'                                    when rate.rateuomtype="volume" then detail.volume                                      '+chr(13)+chr(10)
                    +'                                    else 0 end))+rate.countuom+"*"+convert(varchar,rate.ratevalue)+"*"                     '+chr(13)+chr(10)
                    +'              +convert(varchar,datediff(day,convert(varchar,indetail.operationdate,102),convert(varchar,detail.operationdate,102))+1),  '+chr(13)+chr(10)
                    +iif(dtdReceDateF.Date=0,'costdate=convert(varchar,detail.operationdate,102),','costdate="'+dtdReceDateF.Text+'",')
                    +'       userid=detail.userid,                                                                                               '+chr(13)+chr(10)
                    +'       username=detail.username,                                                                                           '+chr(13)+chr(10)
                    +'       skuid=detail.skuid,                                                                                                 '+chr(13)+chr(10)
                    +'       skuname=detail.skuname,                                                                                             '+chr(13)+chr(10)
                    +'       lister="'+_loginname+'",                                                                                                          '+chr(13)+chr(10)
                    +'       sdate=convert(varchar,indetail.operationdate,102),                                                                  '+chr(13)+chr(10)
                    +'       edate=convert(varchar,detail.operationdate,102),                                                                    '+chr(13)+chr(10)
                    +'       quantity=case when rate.rateuomtype="quantity" then detail.quantity                                                 '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="piece" then detail.piece                                                       '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="netweight" then detail.netweight                                               '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="grossweight" then detail.grossweight                                           '+chr(13)+chr(10)
                    +'                     when rate.rateuomtype="volume" then detail.volume                                                     '+chr(13)+chr(10)
                    +'                     else 0 end,                                                                                           '+chr(13)+chr(10)
                    +'       costrate=rate.ratevalue,                                                                                            '+chr(13)+chr(10)
                    +'       sectionq=datediff(day,convert(varchar,indetail.operationdate,102),convert(varchar,detail.operationdate,102))+1,       '+chr(13)+chr(10)
                    +'       countday=datediff(day,convert(varchar,indetail.operationdate,102),convert(varchar,detail.operationdate,102))+1,      '+chr(13)+chr(10)
                    +'       isincome="T",                                                                                                       '+chr(13)+chr(10)
                    +'       buskind="出仓",                                                                                                     '+chr(13)+chr(10)
                    +'       countuom=rate.countuom,                                                                                             '+chr(13)+chr(10)
                    +'       countway="散装",                                                                                                    '+chr(13)+chr(10)
                    +'       rateuomtype=rate.rateuomtype                                                                                        '+chr(13)+chr(10)
                    +'  from locationoutitem detail,locationinitem indetail,warecostrate rate                                                    '+chr(13)+chr(10)
                    +' where detail.jobno in ('+strjobno+')                                                                                 '+chr(13)+chr(10)
                    +'   and detail.jobnoin=indetail.jobno                                                                                       '+chr(13)+chr(10)
                    +'   and detail.snoin=indetail.sno                                                                                           '+chr(13)+chr(10)
                    +'   and rate.jobno=detail.jobno                                                                                             '+chr(13)+chr(10)
                    +'   and rate.sno=detail.sno                                                                                                 '+chr(13)+chr(10)
                    +'   and rate.costcd="CZ"                                                                                                    '+chr(13)+chr(10)
                    +'');
      ExecSql(qryTmp,'declare @maxSNO smallint,                         '+chr(13)+chr(10)
                    +'        @jobno varchar(20)                        '+chr(13)+chr(10)
                    +'declare cost_cursor CURSOR FOR                    '+chr(13)+chr(10)
                    +' select Jobno,maxSNO=max(sno)                     '+chr(13)+chr(10)
                    +'   from CostItem (nolock)                         '+chr(13)+chr(10)
                    +'  where exists(select 1                           '+chr(13)+chr(10)
                    +'                 from #CostItem cost              '+chr(13)+chr(10)
                    +'                where CostItem.Jobno=cost.Jobno   '+chr(13)+chr(10)
                    +'                    )                             '+chr(13)+chr(10)
                    +'  group by Jobno                                  '+chr(13)+chr(10)
                    +' union                                            '+chr(13)+chr(10)
                    +' select Jobno,maxSNO=0                            '+chr(13)+chr(10)
                    +'   from #CostItem                                 '+chr(13)+chr(10)
                    +'  where not exists(select 1                       '+chr(13)+chr(10)
                    +'                 from CostItem cost(nolock)       '+chr(13)+chr(10)
                    +'                where #CostItem.Jobno=cost.Jobno  '+chr(13)+chr(10)
                    +'                  )                               '+chr(13)+chr(10)
                    +'  group by Jobno                                  '+chr(13)+chr(10)
                    +'  order by 1                                      '+chr(13)+chr(10)
                    +'  OPEN cost_cursor                                '+chr(13)+chr(10)
                    +'  FETCH next FROM cost_cursor INTO @Jobno,@maxSNO '+chr(13)+chr(10)
                    +'  WHILE (@@fetch_status <> -1)                    '+chr(13)+chr(10)
                    +'  BEGIN                                           '+chr(13)+chr(10)
                    +'    IF (@@fetch_status <> -2)                     '+chr(13)+chr(10)
                    +'    BEGIN                                         '+chr(13)+chr(10)
                    +'      select @maxSNO=@maxSNO+1                    '+chr(13)+chr(10)
                    +'      update #CostItem set SNO=@maxSNO,@maxSNO=@maxSNO+1 '+chr(13)+chr(10)
                    +'       where #CostItem.Jobno=@Jobno               '+chr(13)+chr(10)
                    +'      FETCH next FROM cost_cursor INTO @Jobno,@maxSNO   '+chr(13)+chr(10)
                    +'    END                                           '+chr(13)+chr(10)
                    +'  END                                             '+chr(13)+chr(10)
                    +'  DEALLOCATE cost_cursor                          '+chr(13)+chr(10)
                    +' insert into costitem                             '+chr(13)+chr(10)
                    +' ( jobno, sno, snosku, costcd,                    '+chr(13)+chr(10)
                    +'   costin, costout, currcd, costcusid,            '+chr(13)+chr(10)
                    +'   costcusname,remark,costdate,                          '+chr(13)+chr(10)
                    +'   userid, username, skuid, skuname,              '+chr(13)+chr(10)
                    +'   lister,sdate,edate,quantity,                   '+chr(13)+chr(10)
                    +'   costrate,sectionq,countday,isincome,          '+chr(13)+chr(10)
                    +'   buskind,                                       '+chr(13)+chr(10)
                    +'   countuom,countway,rateuomtype)                             '+chr(13)+chr(10)
                    +' select jobno, sno, snosku, costcd,                    '+chr(13)+chr(10)
                    +iif(edtpricein.Text<>'','   costin=case when costin<'+edtpricein.Text+' then '+edtpricein.Text+' else costin end, ','costin,')
                    +'   costout, currcd, costcusid,            '+chr(13)+chr(10)
                    +'   costcusname,remark,costdate,                          '+chr(13)+chr(10)
                    +'   userid, username, skuid, skuname,              '+chr(13)+chr(10)
                    +'   lister,sdate,edate,quantity,                   '+chr(13)+chr(10)
                    +'   costrate,sectionq,countday,isincome,          '+chr(13)+chr(10)
                    +'   buskind,                                       '+chr(13)+chr(10)
                    +'   countuom,countway,rateuomtype from #Costitem                       '+chr(13)+chr(10)
                    +'   '+chr(13)+chr(10)
             );
      droplsk('#CostItem');

{      execSql(datatmp.qryTmp,'update trans '
                   +'   set iscount="T"'
                   +' where jobno in ('+strjobno+')');  }
   end;
   Kmessagedlg('仓租计提成功',mtInformation,[mbOk],0);
   frmCZoutCount.Close;
end;

end.
