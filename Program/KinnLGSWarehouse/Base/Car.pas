unit Car;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, DragBar, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, dxExEdtr, dxEdLib, KinPickEdit, dxEditor, StdCtrls, GMSLabel,
  KGroupBox, DbButtons, KBitBtn, ExtCtrls,libproc,libbb, DBClient,
  KDataSetProvider, dxPageControl, dxDBTLCl, dxGrClms;

type
  TfrmCar = class(TForm)
    grpBox: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    edtconveno: TdxEdit;
    btnRefresh: TKBitBtn;
    qrycarin: TKADOQuery;
    dsdtscarin: TDataSource;
    qryTmp: TKADOQuery;
    qrycarstop: TKADOQuery;
    dsdtscarstop: TDataSource;
    qrycarout: TKADOQuery;
    dsdtscarout: TDataSource;
    GMSStickyLabel14: TGMSStickyLabel;
    dtddateF: TdxDateEdit;
    GMSStickyLabel18: TGMSStickyLabel;
    dtdDateT: TdxDateEdit;
    qrytemp: TKADOQuery;
    edtdrivername: TdxEdit;
    btnprint: TKBitBtn;
    pgcloccon: TdxPageControl;
    pgcxs: TdxTabSheet;
    KGroupBox4: TKGroupBox;
    spl1: TSplitter;
    spl2: TSplitter;
    spl3: TSplitter;
    spl4: TSplitter;
    KGroupBox1: TKGroupBox;
    grdcarin: TdxDBGrid;
    dxCarBrand: TdxDBGridColumn;
    dxdrivername2: TdxDBGridColumn;
    conveName: TdxDBGridColumn;
    KBitBtn1: TKBitBtn;
    btnCopy: TKBitBtn;
    KGroupBox2: TKGroupBox;
    KBitBtn5: TKBitBtn;
    grdcarstop: TdxDBGrid;
    conveno: TdxDBGridColumn;
    dxDriverName: TdxDBGridColumn;
    incomedate: TdxDBGridTimeColumn;
    KGroupBox5: TKGroupBox;
    KBitBtn6: TKBitBtn;
    grdcarout: TdxDBGrid;
    dxconveno: TdxDBGridColumn;
    dxDriverName1: TdxDBGridColumn;
    loadcomdate: TdxDBGridTimeColumn;
    KGroupBox3: TKGroupBox;
    btnReturn: TKBitBtn;
    btnSelect: TKBitBtn;
    KGroupBox6: TKGroupBox;
    Splitter1: TSplitter;
    KBitBtn3: TKBitBtn;
    KBitBtn4: TKBitBtn;
    KBitBtn7: TKBitBtn;
    KBitBtn8: TKBitBtn;
    pgccx: TdxTabSheet;
    KGroupBox7: TKGroupBox;
    KBitBtn2: TKBitBtn;
    grdcx: TdxDBGrid;
    cxconveno: TdxDBGridColumn;
    cxDriverName: TdxDBGridColumn;
    cxincomedate: TdxDBGridTimeColumn;
    qrycx: TKADOQuery;
    dtscx: TDataSource;
    cxloadcomdate: TdxDBGridColumn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure KBitBtn4Click(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure KBitBtn8Click(Sender: TObject);
    procedure KBitBtn1Click(Sender: TObject);
    procedure KBitBtn5Click(Sender: TObject);
    procedure KBitBtn6Click(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure WorkCar;

var
  frmCar: TfrmCar;

implementation

{$R *.DFM}

uses main,Datas, KinDlg,libuser ,datasTmp,libuserPub ,GetDllPub,dxGridOut,
  linprint,addcar,CarUpdatetime;

procedure WorkCar;
begin
   if frmCar <> nil then
   with frmCar do
   begin
     if WindowState=wsMinimized then
        WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frmCar:=TfrmCar.Create(application);
   with frmCar do
   begin
      btnRefresh.Click;
      {激活FORM}
      Show;
      SetFormPosition(frmCar,true);
      Exit;
   end;

end;

procedure TfrmCar.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then ReturnNext(Self);
end;

procedure TfrmCar.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(grpBox);
   SetGroupbox(KGroupBox4);
   SetGroupbox(KGroupBox1);
   SetGroupbox(KGroupBox3);
   SetGroupbox(KGroupBox2);
   SetGroupbox(KGroupBox5);
   SetGroupbox(KGroupBox6);
   SetGroupbox(KGroupBox7);
   SetDxDbGrid(grdcx);
   SetDxDbGrid(grdcarin);
   SetDxDbGrid(grdcarstop);
   SetDxDbGrid(grdcarout);
   qrycx.Connection:=_ADOConnection;
   qrycarin.Connection:=_ADOConnection;
   qrycarstop.Connection:=_ADOConnection;
   qrycarout.Connection:=_ADOConnection;
   qrytmp.Connection:=_ADOConnection;
end;



procedure TfrmCar.btnRefreshClick(Sender: TObject);
var
   strSql,strFilter:string;
begin
   if edtconveno.Text<>'' then             //车牌号
      strFilter:=strFilter+'   and isnull(outcon.conveno,"")like "%'+edtconveno.Text+'%"'+chr(13)+chr(10);
   if edtdrivername.Text<>'' then         //司机
      strFilter:=strFilter+'   and isnull(outcon.drivername,"")like "%'+edtdrivername.Text+'%"'+chr(13)+chr(10);
   if dtdDateF.Date<>0 then  //开始日期
   begin
      OpenSql(qryTmp,' select  dtdDateF=convert(int,convert(datetime, "'+dtdDateF.Text+'" ))');
      strFilter:=strFilter+'   and outcon.arrivedate>='+ FloatToStr(StrToFloat(qryTmp.FieldByname('dtdDateF').Asstring))+' ';
   end;
   if dtdDateT.Date<>0 then  //结束日期
   begin
      OpenSql(qryTmp,' select  dtdDateT=convert(int,convert(datetime, "'+dtdDateT.Text+'" ))');
      strFilter:=strFilter+'   and outcon.arrivedate<='+ FloatToStr(StrToFloat(qryTmp.FieldByname('dtdDateT').Asstring))+' ';
   end;

   OpenSql(qrycx,'select conveno,DriverName,incomedate,loadcomdate,'+chr(13)+chr(10)
                +'       keyid=jobno+convert(varchar,sno) '+chr(13)+chr(10)
                +'  from locationinoutcon outcon(nolock) '+chr(13)+chr(10)
                +' where 1=1 and                         '+chr(13)+chr(10)
                +IIF(_Useridcan<>'',
                 '    outcon.userid in '+_Useridcan+' ' ,
                 '    outcon.userid like rtrim("'+_UserID+'")+"%"  ')  // Useid组织
                +strFilter
          );

   strSql:= 'Select convecd,conveName,convetype,drivername,             '+chr(13)+chr(10)
           +'       conveno,statenow,areanow,reflash,cusname,          '+chr(13)+chr(10)
           +'       canloadvolume,canloadweight,cusid,userid,username  '+chr(13)+chr(10)
           +'  from Conveyance(nolock)                                 '+chr(13)+chr(10)
           +' where 1=1  and                                           '+chr(13)+chr(10)
           +IIF(_Useridcan<>'',
            '    Conveyance.userid in '+_Useridcan+' ' ,
            '    Conveyance.userid like rtrim("'+_UserID+'")+"%"  ')  // Useid组织
           +'and isnull(statenow,"")="可用"                ' +chr(13)+chr(10)
      //     +'and isnull(areanow,"") like "%海丰宝仓库%"                ' +chr(13)+chr(10)
           ;
   OpenSql(qryCarin,strSql);

   strSql:= 'Select outcon.jobno,outcon.conveno,outcon.drivername,outcon.sno,outcon.arrivedate, '+chr(13)+chr(10)
           +'       outcon.loadcomdate,outcon.incomedate,                    '+chr(13)+chr(10)
           +'       YS=case when jobno like "%KINNZK%" then "T" else "F" end , '+chr(13)+chr(10)
           +'       keyid=jobno+convert(varchar,sno) '+chr(13)+chr(10)
           +'  from locationinoutcon outcon(nolock)  '+chr(13)+chr(10)
           +' where 1=1  and                         '+chr(13)+chr(10)
           +IIF(_Useridcan<>'',
            '    outcon.userid in '+_Useridcan+' ' ,
            '    outcon.userid like rtrim("'+_UserID+'")+"%"  ')  // Useid组织
           +'and isnull(arrivedate,"")<>"" and isnull(incomedate,"")<>"" and isnull(loadcomdate,"")="" ' +chr(13)+chr(10)
           +strFilter;
   OpenSql(qryCarstop,strSql);

   strSql:= 'Select outcon.jobno,outcon.conveno,outcon.drivername,outcon.sno,outcon.arrivedate,              '     +chr(13)+chr(10)
             +'     outcon.loadcomdate,outcon.incomedate,                    '     +chr(13)+chr(10)
             +'     YS=case when jobno like "%KINNZK%" then "T" else "F" end , '
             +'     keyid=jobno+convert(varchar,sno)'
             +' from locationinoutcon outcon(nolock)                                                      '+chr(13)+chr(10)
             +'where 1=1  and                                                               '+chr(13)+chr(10)
             +IIF(_Useridcan<>'',
              '    outcon.userid in '+_Useridcan+' ' ,
              '    outcon.userid like rtrim("'+_UserID+'")+"%"  ')  // Useid组织
             +'and isnull(arrivedate,"")<>"" and isnull(loadcomdate,"")<>"" and isnull(incomedate,"")<>"" ' +chr(13)+chr(10)
             +strFilter;
   OpenSql(qryCarout,strSql);

end;

procedure TfrmCar.FormDestroy(Sender: TObject);
begin
   Lampchange(lsMenu);
   Application.onShowhint := nil;
   frmCar:=nil;
end;

procedure TfrmCar.btnSelectClick(Sender: TObject);
var
   strjobno:string;
begin
   if grdCarin.SelectedCount<>0 then
   begin
      //lzw20100617
      if Kmessagedlg('是否要进行该车辆的入库操作？',mtWarning,[mbYes,mbNo],0)=mrNo then exit;
      strjobno:=genJobno('Zk',_DatabaseId);
      OpenSql(qryTmp,'insert into locationinoutcon                                    '+chr(13)+chr(10)
                    +' (    jobno,userid,username,sno,                                '+chr(13)+chr(10)
                    +'      conveno,xszh,                                             '+chr(13)+chr(10)
                    +'      drivername,driveridcar,iscon,                             '+chr(13)+chr(10)
                    +'      arrivedate                                                '+chr(13)+chr(10)
                    +'  )                                                             '+chr(13)+chr(10)
                    +'values                                                          '+chr(13)+chr(10)
                    +'       ("'+strjobno+'","'+_Userid+'", "'+_UserName+'", "1",     '+chr(13)+chr(10)
                    +'       "'+qrycarin.fieldbyname('conveno').AsString+'"," ",      '+chr(13)+chr(10)
                    +'       "'+qrycarin.fieldbyname('drivername').AsString+'"," ","F",'+chr(13)+chr(10)
                    +'       "'+DateToStr(GetServerDate)+' "                     '+chr(13)+chr(10)
                    +'       )                                                        '+chr(13)+chr(10)
                    +'select jobno,userid,username,sno, drivername, conveno           '+chr(13)+chr(10)
                    +'  from locationinoutcon                                         '+chr(13)+chr(10)
                    +' where jobno="'+strjobno+'"                                     '+chr(13)+chr(10)
              );

      WorkCarUpdatetime(qryTmp.fieldbyname('jobno').AsString,qryTmp.fieldbyname('sno').AsString , 'ID');

      qrycarin.Close;
      qrycarin.open;
      qrycarstop.Close;
      qrycarstop.open;
    end else
      Kmessagedlg('请选中相应的计划信息！',mtInformation,[mbok],0) ;

end;

procedure TfrmCar.KBitBtn4Click(Sender: TObject);
begin
   if grdCarStop.SelectedCount<>0 then
   begin
      WorkCarUpdatetime(qryCarStop.fieldbyname('jobno').AsString ,qryCarStop.fieldbyname('sno').AsString ,'OD');
      qrycarout.Close;
      qrycarout.open;
      qrycarstop.Close;
      qrycarstop.open;
    end else
      Kmessagedlg('请选中相应的计划信息！',mtInformation,[mbok],0) ;

end;

procedure TfrmCar.btnReturnClick(Sender: TObject);
begin
   if grdcarstop.SelectedCount<>0 then
   begin
      if Kmessagedlg('是否要进行该操作？',mtWarning,[mbYes,mbNo],0)=mrNo then exit;
      ExecSql(dataTmp.qryTmp,'update locationinoutcon                                           '+chr(13)+chr(10)
                            +'   set incomedate=""                                             '+chr(13)+chr(10)
                            +' where 1=1                                                       '+chr(13)+chr(10)
                            +'   and jobno="'+qryCarStop.fieldbyname('jobno').AsString +'"   '+chr(13)+chr(10)
                            +'   and sno="'+qryCarStop.fieldbyname('sno').AsString +'"   '+chr(13)+chr(10)
             );
      qrycarin.Close;
      qrycarin.open;
      qrycarstop.Close;
      qrycarstop.open;
    end else
      Kmessagedlg('请选中相应的计划信息！',mtInformation,[mbok],0) ;

end;

procedure TfrmCar.KBitBtn8Click(Sender: TObject);
begin
   if grdCarout.SelectedCount<>0 then
   begin
      if Kmessagedlg('是否要进行该操作？',mtWarning,[mbYes,mbNo],0)=mrNo then exit;
      ExecSql(dataTmp.qryTmp,'update locationinoutcon                                           '+chr(13)+chr(10)
                            +'   set loadcomdate=""                                                '+chr(13)+chr(10)
                            +' where 1=1                                                       '+chr(13)+chr(10)
                            +'   and jobno="'+qryCarOut.fieldbyname('jobno').AsString +'"   '+chr(13)+chr(10)
                            +'   and sno="'+qryCarOut.fieldbyname('sno').AsString +'"   '+chr(13)+chr(10)
             );
      qrycarout.Close;
      qrycarout.open;
      qrycarstop.Close;
      qrycarstop.open;
    end else
      Kmessagedlg('请选中相应的计划信息！',mtInformation,[mbok],0) ;
end;

procedure TfrmCar.KBitBtn1Click(Sender: TObject);
begin
    qrycarin.Close;
    qrycarin.open;
end;

procedure TfrmCar.KBitBtn5Click(Sender: TObject);
begin
    qrycarstop.Close;
    qrycarstop.open;
end;

procedure TfrmCar.KBitBtn6Click(Sender: TObject);
begin
    qrycarout.Close;
    qrycarout.open;
end;

procedure TfrmCar.btnCopyClick(Sender: TObject);
begin
   WorkAddCar
end;

procedure TfrmCar.btnprintClick(Sender: TObject);
var
   lstPara: TStringList;
begin
   lstPara := TStringList.Create;
   lstpara.Add('STDate=统计日期:'+dtddateF.Text+' 到 '+dtddateT.Text);
   lstpara.Add('SDate='+dtddateF.Text);
   lstpara.Add('eDate='+dtddateT.Text);
   GenInformations(lstPara);

   WorkdxGridOut(grdcx,lstPara,'车辆进出记录');
end;

end.
