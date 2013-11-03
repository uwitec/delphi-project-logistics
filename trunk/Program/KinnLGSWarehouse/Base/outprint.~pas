unit outprint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls, LblEffct,Db, GMSLabel,KBitBtn,KDataSetProvider,libuserPub,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, KGroupBox, CheckLst,libproc,
  DBClient, dxDBELib, KinPickEdit,shellapi,vcf1;

type
  Tfrmoutprint = class(TForm)
    Image1: TImage;
    lblPrint: TLabelEffect;
    qryTmp1: TKADOQuery;
    GroupBox2: TKGroupBox;
    bbqd: TdxCheckEdit;
    btnPrint: TKBitBtn;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    gjkbbqd: TdxCheckEdit;
    djkbbqd: TdxCheckEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    edtPath: TdxButtonEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    qhqd: TdxCheckEdit;
    qrytmp: TKADOQuery;
    wbbqd: TdxCheckEdit;
    qrytmp2: TKADOQuery;
    procedure btnprintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure saveExcel(pBBDM,pBBMC:string;pLstParas:Tstringlist;pqryMain,pqryRow,pqryCol:TKADOQuery;pstrpath:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmoutprint: Tfrmoutprint;

procedure Workoutprint(pstrjobno:string);

implementation

{$R *.DFM}

uses libUser,libBb,main,kindlg,datas,GetDllPub, datasTmp, linprint;

var
    strpJobno:string;

procedure Workoutprint(pstrjobno:string);
begin
   if frmoutprint <> nil then
   with frmoutprint do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmoutprint:=Tfrmoutprint.Create(Application);
   strpJobno:=pstrJobno;
   with frmoutprint do
   begin

 {     DecodeDate(Date,strYear,strMonth,strDay);
      dtdReceDateT.Date:=Date;
      dtdReceDateF.Date:=Date-30; }
      ShowModal;
      Free;
   end;
end;

procedure Tfrmoutprint.btnprintClick(Sender: TObject);
var
   strmsg,s:string;
   lstPara:Tstringlist;
   blnPrint:boolean;
begin
   if edtPath.Text='' then
   begin
      edtPath.setFocus;
      Kmessagedlg('请先选需要保存的文件路径！', mtInformation,[mbOk],0);
      exit;
   end;

   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;

   //打印备货清单
   if bbqd.checked then
   begin
      try

         lstPara:=TstringList.Create;
         OpenSql(qryTmp1,'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                            '+chr(13)+chr(10)
                        +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0      '+chr(13)+chr(10)
                        +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end ) ,                       '+chr(13)+chr(10)
                        +'       locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                       '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate                    '+chr(13)+chr(10)
                        +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                        +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                        +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                        +'       left join locationout(nolock)                                                       '+chr(13)+chr(10)
                        +'              on locationout.jobno=locationoutitem.jobno                                   '+chr(13)+chr(10)
                        +' where locationoutitem.jobno="'+strpJobno+'"                                               '+chr(13)+chr(10)
                        +' group by locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                        '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate      '+chr(13)+chr(10)
                        );
         lstPara.Add('costcusname='+qryTmp1.fieldByname('costcusname').AsString);
         lstpara.Add('mainorder='+qryTmp1.FieldByname('mainorder').AsString);
         lstpara.Add('cusbillno='+qryTmp1.FieldByname('cusbillno').AsString);
         lstpara.Add('destorder='+qryTmp1.FieldByname('destorder').AsString);
         lstpara.Add('corpno='+qryTmp1.FieldByname('corpno').AsString);
         lstpara.Add('routing='+qryTmp1.FieldByname('routing').AsString);
         lstpara.Add('uploaddate='+qryTmp1.FieldByname('conloaddate').AsString);
         lstpara.Add('originorder='+qryTmp1.FieldByname('originorder').AsString);
         lstPara.Add('printtime='+DateTimeToStr(Now));
         lstPara.Add('pieceall='+qryTmp1.FieldByname('pieceall').AsString);
         lstPara.Add('quantityall='+qryTmp1.FieldByname('quantityall').AsString);

         OpenSql(qryTmp2,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)),                                               '+chr(13)+chr(10)
                        +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                             '+chr(13)+chr(10)
                        +'           (select isnull(sum(isnull(locationoutitem.quantitytask,0)),0) from locationoutitem(nolock)      '+chr(13)+chr(10)
                        +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                         '+chr(13)+chr(10)
                        +'  from wareorderorisku(nolock)                                                                             '+chr(13)+chr(10)
                        +' where wareorderorisku.mainorder="'+qryTmp1.FieldByName('mainorder').AsString+'"                           '+chr(13)+chr(10)
                        +' group by wareorderorisku.mainorder                                                                     '+chr(13)+chr(10)
                         );
         lstPara.Add('quantityall2='+qryTmp2.FieldByname('quantityall2').AsString);
         lstPara.Add('syquantityall='+qryTmp2.FieldByname('syquantityall').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                       +'       piece=case when sku.piecepro is null then ""                                                                                                          '+chr(13)+chr(10)                       +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/                                                                      '+chr(13)+chr(10)
                       +'                    cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""                                                                       '+chr(13)+chr(10)
                       +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/                                                                                        '+chr(13)+chr(10)
                       +'                   cast(sku.piecepro as numeric(16,0))) as varchar(10))+"箱" end                                                                             '+chr(13)+chr(10)
                       +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%                                                                       '+chr(13)+chr(10)
                       +'                    cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                                                                                       '+chr(13)+chr(10)
                       +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+"个" end ) end ,                       '+chr(13)+chr(10)
                       +'       piece2=case when sku.piecepro is null then 0                                                                                                          '+chr(13)+chr(10)                       +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,                                             '+chr(13)+chr(10)                       +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,""),                                           '+chr(13)+chr(10)                       +'       sign=case when locationoutitem.quantitytask=detail.quantity-detail.quantitydo then ""  else "分拣" end                                                                  '+chr(13)+chr(10)
                       +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                       +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                       +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                       +'       left join locationindetail detail(nolock)                                                      '+chr(13)+chr(10)                       +'              on locationoutitem.jobnoin = detail.jobno                                               '+chr(13)+chr(10)                       +'             and  locationoutitem.snoin = detail.sno                                                  '+chr(13)+chr(10)                       +'             and locationoutitem.snolocin = detail.ldsno                                              '+chr(13)+chr(10)                       +' where locationoutitem.jobno="'+strpJobno+'"                                                          '+chr(13)+chr(10)                       +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                       );

         saveExcel('101003','嘉功备货清单'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         s:=edtpath.text+'嘉功备货清单'+'.xls';
         WinExec(PChar(s),SW_MAXIMIZE);
         strmsg:=strmsg+'备货清单已生成,';
      except
         strmsg:=strmsg+'备货清单未生成,';
      end;

   end;
   //打印 低架库备货清单
   if djkbbqd.checked then
   begin
      try
         lstPara:=TstringList.Create;
         OpenSql(qryTmp1,'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                                                                           '+chr(13)+chr(10)
                        +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0     '+chr(13)+chr(10)
                        +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end ) ,                      '+chr(13)+chr(10)
                        +'       locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                      '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate                   '+chr(13)+chr(10)
                        +'  from locationoutitem(nolock)                                                                                                            '+chr(13)+chr(10)
                        +'       left join sku(nolock)                                                                                                              '+chr(13)+chr(10)
                        +'              on sku.skuid=locationoutitem.skuid                                                                                          '+chr(13)+chr(10)
                        +'       left join locationout(nolock)                                                                                                      '+chr(13)+chr(10)
                        +'              on locationout.jobno=locationoutitem.jobno                                                                                  '+chr(13)+chr(10)
                        +' where locationoutitem.jobno="'+strpJobno+'"                                                                                              '+chr(13)+chr(10)
                        +' group by locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                   '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate               '+chr(13)+chr(10)
                        );
         lstPara.Add('costcusname='+qryTmp1.fieldByname('costcusname').AsString);
         lstpara.Add('mainorder='+qryTmp1.FieldByname('mainorder').AsString);
         lstpara.Add('cusbillno='+qryTmp1.FieldByname('cusbillno').AsString);
         lstpara.Add('destorder='+qryTmp1.FieldByname('destorder').AsString);
         lstpara.Add('corpno='+qryTmp1.FieldByname('corpno').AsString);
         lstpara.Add('routing='+qryTmp1.FieldByname('routing').AsString);
         lstpara.Add('uploaddate='+qryTmp1.FieldByname('conloaddate').AsString);
         lstpara.Add('originorder='+qryTmp1.FieldByname('originorder').AsString);
         lstPara.Add('printtime='+DateTimeToStr(Now));
         lstPara.Add('pieceall='+qryTmp1.FieldByname('pieceall').AsString);
         lstPara.Add('quantityall='+qryTmp1.FieldByname('quantityall').AsString);
         OpenSql(qryTmp2,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                        +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                               '+chr(13)+chr(10)
                        +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)        '+chr(13)+chr(10)
                        +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                                '+chr(13)+chr(10)
                        +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                        +' where wareorderorisku.mainorder="'+qryTmp1.FieldByName('mainorder').AsString+'"                                '+chr(13)+chr(10)
                        +' group by wareorderorisku.mainorder                                                                              '+chr(13)+chr(10)
                         );
         lstPara.Add('quantityall2='+qryTmp2.FieldByname('quantityall2').AsString);
         lstPara.Add('syquantityall='+qryTmp2.FieldByname('syquantityall').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                       +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                       +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                       +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+"箱" end                           '+chr(13)+chr(10)
                       +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                       +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+"个"end ) end ,                        '+chr(13)+chr(10)                       +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                       +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,                                             '+chr(13)+chr(10)                       +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                       +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                       +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                       +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                       +' where locationoutitem.jobno="'+strpJobno+'"                                                          '+chr(13)+chr(10)                       +' group by locationoutitem.sno,locationoutitem.lotcode,locationoutitem.cusname,                        '+chr(13)+chr(10)
                       +'       locationoutitem.locname,locationoutitem.skuname,sku.piecepro,sku.customerno,                   '+chr(13)+chr(10)
                       +'       locationoutitem.quantitytask,locationoutitem.remark                                            '+chr(13)+chr(10)
                       +'having locname like "%-1" or locname like "%-2" or locname like "%-6" or locname like "%-7"           '+chr(13)+chr(10)
                       +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                        );

         saveExcel('101008','低架库备货清单'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'低架库备货清单已生成,';
      except
         strmsg:=strmsg+'低架库备货清单未生成,';
      end;
   end;
   //打印 高架库备货清单
   if gjkbbqd.checked then
   begin
      try
         lstPara:=TstringList.Create;
         OpenSql(qryTmp1,'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                   '+chr(13)+chr(10)
                        +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0      '+chr(13)+chr(10)
                        +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end ) ,                       '+chr(13)+chr(10)
                        +'       locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                       '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate                    '+chr(13)+chr(10)
                        +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                        +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                        +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                        +'       left join locationout(nolock)                                                       '+chr(13)+chr(10)
                        +'              on locationout.jobno=locationoutitem.jobno                                   '+chr(13)+chr(10)
                        +' where locationoutitem.jobno="'+strpJobno+'"                                               '+chr(13)+chr(10)
                        +' group by locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                        '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate      '+chr(13)+chr(10)
                        );
         lstPara.Add('costcusname='+qryTmp1.fieldByname('costcusname').AsString);
         lstpara.Add('mainorder='+qryTmp1.FieldByname('mainorder').AsString);
         lstpara.Add('cusbillno='+qryTmp1.FieldByname('cusbillno').AsString);
         lstpara.Add('destorder='+qryTmp1.FieldByname('destorder').AsString);
         lstpara.Add('corpno='+qryTmp1.FieldByname('corpno').AsString);
         lstpara.Add('routing='+qryTmp1.FieldByname('routing').AsString);
         lstpara.Add('uploaddate='+qryTmp1.FieldByname('conloaddate').AsString);
         lstpara.Add('originorder='+qryTmp1.FieldByname('originorder').AsString);
         lstPara.Add('printtime='+DateTimeToStr(Now));
         lstPara.Add('pieceall='+qryTmp1.FieldByname('pieceall').AsString);
         lstPara.Add('quantityall='+qryTmp1.FieldByname('quantityall').AsString);
         OpenSql(qryTmp2,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                        +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                                      '+chr(13)+chr(10)
                        +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)                  '+chr(13)+chr(10)
                        +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                                      '+chr(13)+chr(10)
                        +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                        +' where wareorderorisku.mainorder="'+qryTmp1.FieldByName('mainorder').AsString+'"                       '+chr(13)+chr(10)
                        +' group by wareorderorisku.mainorder                                                                               '+chr(13)+chr(10)
                         );
         lstPara.Add('quantityall2='+qryTmp2.FieldByname('quantityall2').AsString);
         lstPara.Add('syquantityall='+qryTmp2.FieldByname('syquantityall').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                       +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                       +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                       +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+"箱" end                           '+chr(13)+chr(10)
                       +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                       +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+"个"end ) end ,                        '+chr(13)+chr(10)                       +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                       +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)) )  end,                                             '+chr(13)+chr(10)                       +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                       +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                       +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                       +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                       +' where locationoutitem.jobno="'+strpJobno+'"           '+chr(13)+chr(10)                       +' group by locationoutitem.sno,locationoutitem.lotcode,locationoutitem.cusname,                        '+chr(13)+chr(10)
                       +'       locationoutitem.locname,locationoutitem.skuname,sku.piecepro,sku.customerno,                   '+chr(13)+chr(10)
                       +'       locationoutitem.quantitytask,locationoutitem.remark                                            '+chr(13)+chr(10)
                       +'having locname like "%-3" or locname like "%-4" or locname like "%-5" or locname like "%-8" or locname like "%-9" or locname like "%-10"           '+chr(13)+chr(10)
                       +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                        );
         saveExcel('101009','高架库备货清单'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'高架库备货清单已生成,';
      except
         strmsg:=strmsg+'高架库备货清单未生成,';
      end;
   end;
     //打印 未备货清单
   if wbbqd.checked then
   begin
      try
         lstPara:=TstringList.Create;
        OpenSql(qryTmp1,'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                   '+chr(13)+chr(10)
                        +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0      '+chr(13)+chr(10)
                        +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end ) ,                       '+chr(13)+chr(10)
                        +'       locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                       '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate                   '+chr(13)+chr(10)
                        +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                        +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                        +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                        +'       left join locationout(nolock)                                                       '+chr(13)+chr(10)
                        +'              on locationout.jobno=locationoutitem.jobno                                   '+chr(13)+chr(10)
                        +' where locationoutitem.jobno="'+strpJobno+'"                                               '+chr(13)+chr(10)
                        +' group by locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                        '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate      '+chr(13)+chr(10)
                        );
         lstPara.Add('costcusname='+qryTmp1.fieldByname('costcusname').AsString);
         lstpara.Add('mainorder='+qryTmp1.FieldByname('mainorder').AsString);
         lstpara.Add('cusbillno='+qryTmp1.FieldByname('cusbillno').AsString);
         lstpara.Add('destorder='+qryTmp1.FieldByname('destorder').AsString);
         lstpara.Add('corpno='+qryTmp1.FieldByname('corpno').AsString);
         lstpara.Add('routing='+qryTmp1.FieldByname('routing').AsString);
         lstpara.Add('uploaddate='+qryTmp1.FieldByname('conloaddate').AsString);
         lstpara.Add('originorder='+qryTmp1.FieldByname('originorder').AsString);
         lstPara.Add('printtime='+DateTimeToStr(Now));
         lstPara.Add('pieceall='+qryTmp1.FieldByname('pieceall').AsString);
         lstPara.Add('quantityall='+qryTmp1.FieldByname('quantityall').AsString);
         OpenSql(qryTmp2,'select quantityall2=sum(isnull(wareorderorisku.quantity,0)) ,                                                '+chr(13)+chr(10)
                        +'       syquantityall=isnull(isnull(sum(isnull(wareorderorisku.quantity,0)),0)-                                      '+chr(13)+chr(10)
                        +'                     (select sum(isnull(locationoutitem.quantitytask,0)) from locationoutitem(nolock)                  '+chr(13)+chr(10)
                        +'                       where locationoutitem.mainorder=wareorderorisku.mainorder ),0)                                      '+chr(13)+chr(10)
                        +'  from wareorderorisku(nolock)                                                                               '+chr(13)+chr(10)
                        +' where wareorderorisku.mainorder="'+qryTmp1.FieldByName('mainorder').AsString+'"                       '+chr(13)+chr(10)
                        +' group by wareorderorisku.mainorder                                                                               '+chr(13)+chr(10)
                         );
         lstPara.Add('quantityall2='+qryTmp2.FieldByname('quantityall2').AsString);
         lstPara.Add('syquantityall='+qryTmp2.FieldByname('syquantityall').AsString);
         GenInformations(lstPara);
         OpenSql(qryTmp,'select locationoutitem.sno,lotcode=isnull(locationoutitem.lotcode,""),locationoutitem.cusname,locationoutitem.locname,locationoutitem.skuname,               '+chr(13)+chr(10)
                       +'        piece=case when sku.piecepro is null then ""                                                                                                         '+chr(13)+chr(10)                       +'              else (case when isnull(cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10)),0)=0 then  ""    '+chr(13)+chr(10)
                       +'              else cast(FLOOR(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) as varchar(10))+"箱" end                           '+chr(13)+chr(10)
                       +'              +case when  isnull((cast(isnull(locationoutitem.quantitytask,0) as int)%cast(isnull(sku.piecepro,0) as int)),0)=0 then  ""                     '+chr(13)+chr(10)
                       +'              else cast(cast(isnull(locationoutitem.quantitytask,0) as int)%cast(sku.piecepro as int) as varchar(10))+"个"end ) end ,                        '+chr(13)+chr(10)                       +'        piece2=case when sku.piecepro is null then 0                                                                                                         '+chr(13)+chr(10)                       +'                 else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0)))  end,                                             '+chr(13)+chr(10)                       +'       sku.piecepro,sku.customerno,quantity=locationoutitem.quantitytask,remark=isnull(locationoutitem.remark,"")                                            '+chr(13)+chr(10)                       +'  from locationoutitem(nolock)                                                                        '+chr(13)+chr(10)
                       +'       left join sku(nolock)                                                                          '+chr(13)+chr(10)                       +'              on sku.skuid=locationoutitem.skuid                                                      '+chr(13)+chr(10)                       +' where locationoutitem.jobno="'+strpJobno+'"                  '+chr(13)+chr(10)                       +'   and isnull(locationoutitem.NotFullSign,"F")<>"T"                                                   '+chr(13)+chr(10)
                       +' order by locationoutitem.locname                                                                     '+chr(13)+chr(10)
                        );

         saveExcel('101010','未备货清单'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'未备货清单已生成,';
      except
         strmsg:=strmsg+'未备货清单未生成,';
      end;
   end;
   //打印 缺货清单
   if qhqd.checked then
   begin
      try
         lstPara:=TstringList.Create;
         OpenSql(qryTmp1,'select quantityall=sum(isnull(locationoutitem.quantitytask,0)),                   '+chr(13)+chr(10)
                        +'       pieceall=sum(case when isnull(ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))),0)=0 then  0      '+chr(13)+chr(10)
                        +'                    else ceiling(isnull(locationoutitem.quantitytask,0)/cast(sku.piecepro as numeric(16,0))) end ) ,                       '+chr(13)+chr(10)
                        +'       locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                                       '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate                     '+chr(13)+chr(10)
                        +'  from locationoutitem(nolock)                                                             '+chr(13)+chr(10)
                        +'       left join sku(nolock)                                                               '+chr(13)+chr(10)
                        +'              on sku.skuid=locationoutitem.skuid                                           '+chr(13)+chr(10)
                        +'       left join locationout(nolock)                                                       '+chr(13)+chr(10)
                        +'              on locationout.jobno=locationoutitem.jobno                                   '+chr(13)+chr(10)
                        +' where locationoutitem.jobno="'+strpJobno+'"                                               '+chr(13)+chr(10)
                        +' group by locationout.costcusname,locationout.mainorder,locationout.cusbillno, locationout.originorder,                        '+chr(13)+chr(10)
                        +'       locationout.destorder,locationout.corpno,locationout.routing,locationout.conloaddate      '+chr(13)+chr(10)
                        );
         lstpara.Add('mainorder='+qryTmp1.fieldbyname('mainorder').AsString);
         lstpara.Add('routing='+qryTmp1.fieldbyname('routing').AsString);
         lstpara.Add('zdr='+_loginname);
         lstPara.Add('zdrq='+datetostr(GetServerDate));
         GenInformations(lstPara);
         opensql(qrytmp,'select wareorderorisku.sno ,wareorderorisku.shippercusname,wareorderorisku.cusname,           '+chr(13)+chr(10)
                       +'       wareorderorisku.skuname,  locationoutitem.mainorder,                                   '+chr(13)+chr(10)
                       +'       wareorderorisku.jobno,sku.customerno,quantityplan=isnull(wareorderorisku.quantity,0),  '+chr(13)+chr(10)
                       +'       quantity=isnull(sum(locationoutitem.quantitytask),0)                                   '+chr(13)+chr(10)
                       +'  from wareorderorisku(nolock)                                                                '+chr(13)+chr(10)
                       +'       left join sku(nolock)                                                                  '+chr(13)+chr(10)
                       +'              on sku.skuid=wareorderorisku.skuid                                              '+chr(13)+chr(10)
                       +'       left join locationoutitem(nolock)                                                      '+chr(13)+chr(10)
                       +'              on locationoutitem.jobnoorder=wareorderorisku.jobno                             '+chr(13)+chr(10)
                       +'             and locationoutitem.snoori=wareorderorisku.sno                                   '+chr(13)+chr(10)
                       +' where wareorderorisku.jobno="'+qryTmp1.FieldByName('jobnoorder').AsString+'"  '+chr(13)+chr(10)
                       +' group by wareorderorisku.shippercusname,wareorderorisku.cusname, wareorderorisku.skuname,    '+chr(13)+chr(10)
                       +'          wareorderorisku.jobno,sku.customerno,wareorderorisku.quantity,wareorderorisku.sno,  '+chr(13)+chr(10)
                       +'           locationoutitem.mainorder                                                          '+chr(13)+chr(10)
                       +' having (isnull(wareorderorisku.quantity,0))<>sum(isnull(locationoutitem.quantitytask,0))     '+chr(13)+chr(10)
                       );
         saveExcel('100404','指令缺货记录'+'.xls',lstpara,qryTmp,nil,nil,edtpath.text);
         strmsg:=strmsg+'缺货清单已生成,';
      except
         strmsg:=strmsg+'缺货清单未生成,';
      end;
   end;
   
   KMessageDlg(strmsg,mtWarning,[mbOK],0);


end;

procedure Tfrmoutprint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure Tfrmoutprint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      Vk_Return:
         SendMessage(Self.Handle,WM_NEXTDLGCTL,0,0);
      Vk_Escape:
      begin
         Key:=0;
         btnCancelClick(nil);
      end;
   end;
end;

procedure Tfrmoutprint.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   frmoutprint:=nil;
end;

procedure Tfrmoutprint.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrmoutprint.FormCreate(Sender: TObject);
begin
   SetFormStyle(Self);
   qryTmp.Connection:=_ADOConnection;
   qryTmp1.Connection:=_ADOConnection;
   qryTmp2.Connection:=_ADOConnection;
end;

procedure Tfrmoutprint.saveExcel(pBBDM,pBBMC:string;pLstParas:Tstringlist;pqryMain,pqryRow,pqryCol:TKADOQuery;pstrpath:string);
var
   KF1Book : TKF1book;
   fileName,strCurrdir:string;
begin
   kF1Book := TKF1book.Create;
   try
     with KF1Book do
     begin
        BBdm:=pBBDM;
        OnFieldText:=nil;
        qryMain :=pqryMain;
        qryCol :=pqryCol;
        qryRow :=pqryRow;

        if pLstParas <> nil then paras := pLstParas;
        BbHandle:=bbNone;
        ShowPrintDlg:=False;
        Printcount:=1;

        CreateReport;
        strCurrdir:=pstrpath;
        fileName := strCurrdir +pBBMC;
        KF1Book.F1Book.Write(fileName, F1FileExcel5);

        //ShellExecute(Application.MainForm.Handle,'open',
          //    PChar(fileName),pchar(''),pchar(''),SW_MAXIMIZE)
     end;
   finally
      kF1Book.Destroy;
   end;
end;

procedure Tfrmoutprint.edtPathButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if OpenDialog1.Execute then
      edtPath.Text:=OpenDialog1.FileName;
end;

end.


