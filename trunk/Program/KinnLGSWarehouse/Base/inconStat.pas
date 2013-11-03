unit inconStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, KBitBtn, StdCtrls,
  GMSLabel,libproc,libuser,libbb, DB, DBTables, LblEffct, KGroupBox,
  KinPickEdit, ExtCtrls,KDataSetProvider;

type
  TfrminconStat = class(TForm)
    lblPrint: TLabelEffect;
    GMSStickyLabel8: TGMSStickyLabel;
    GMSStickyLabel10: TGMSStickyLabel;
    dtdReceDateF: TdxDateEdit;
    dtdReceDateT: TdxDateEdit;
    btnPreview: TKBitBtn;
    btnCancel: TKBitBtn;
    btnPrint: TKBitBtn;
    cmbShipperCus: TdxButtonEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    edtIUser: TdxButtonEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    ckbskuinfo: TdxCheckEdit;

    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbShipperCusButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cmbShipperCusExit(Sender: TObject);
    procedure edtIUserButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edtIUserExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

procedure WorkinconStat;

var
   frminconStat: TfrminconStat;

implementation
{$R *.dfm}

uses kindlg, datasTmp,libuserPub,GetDllPub;

procedure WorkinconStat;
begin
   if frminconStat <> nil then
   with frminconStat do
   begin
     if WindowState=wsMinimized then WindowState:=wsNormal;
     Show;
     Exit;
   end;
   frminconStat:=TfrminconStat.Create(Application);
   with frminconStat do
   begin
     dtdReceDateT.Date:=Date;
     dtdReceDateF.Date:=Date-30;
     showmodal;
   end;
end;

procedure TfrminconStat.btnPreviewClick(Sender: TObject);
var
   lstPara:TStringList;
   strSql,strFilter:string;
   blnprint:boolean;
   ZUOM,Z20UOM,Z40UOM,Z40HQUOM,
   XUOM,X20UOM,X40UOM,X40HQUOM,BZXUOM:integer;
begin

   ZUOM:=0;
   XUOM:=0;
   Z20UOM:=0;
   Z40UOM:=0;
   Z40HQUOM:=0;
   X20UOM:=0;
   X40UOM:=0;
   X40HQUOM:=0;
   BZXUOM:=0;
   //打印
   if TKBitBtn(Sender)=btnPrint then
      blnprint:=true
   else
      blnprint:=False;
   KMessageWait('资料正在统计中...,请稍候!',mtInformation,btnCancel.Handle,0);
   Application.ProcessMessages;

   lstPara:=TStringList.create;

   if not ckbskuinfo.Checked then
   begin
      strsql:=' ksp_inconstat  @shippercusid="'+trim(cmbShipperCus.TextField)+'" ,'
             +'                @userid="'+trim(edtIUser.TextField)+'",'
             +'                @datef="'+dtdReceDateF.Text+'",'
             +'                @dateT="'+dtdReceDateT.Text+'" ';

      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      OpenSql(dataTmp.qryTmp,strsql);

      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
        if dataTmp.qryTmp.FieldByName('ZXBZ').AsString='装' then
        begin
          if dataTmp.qryTmp.FieldByName('CONTYPE').AsString='20' then
          begin
            Z20UOM:=Z20UOM+1;
            BZXUOM:=BZXUOM+1;
          end
          else
          begin
            if dataTmp.qryTmp.FieldByName('CONSPTYPE').AsString='HQ' then
            begin
               Z40HQUOM:=Z40HQUOM+1;
               BZXUOM:=BZXUOM+2;
            end else
            begin
               Z40UOM:=Z40UOM+1;
               BZXUOM:=BZXUOM+2;
            end;
          end;
          ZUOM:=ZUOM+1;
        end
        else begin
          if dataTmp.qryTmp.FieldByName('CONTYPE').AsString='20' then
          begin
            X20UOM:=X20UOM+1;
            BZXUOM:=BZXUOM+1;
          end
          else
          begin
            if dataTmp.qryTmp.FieldByName('CONSPTYPE').AsString='HQ' then
            begin
               X40HQUOM:=X40HQUOM+1;
               BZXUOM:=BZXUOM+2;
            end else
            begin
               X40UOM:=X40UOM+1;
               BZXUOM:=BZXUOM+2;
            end;
          end;
          XUOM:=XUOM+1;
        end;
        dataTmp.qryTmp.Next;
      end;
      dataTmp.qryTmp.First;

      GenInformations(lstPara);
      lstPara.Add('ZBR='+_LoginName);
      lstPara.Add('ZBRQ='+DateTimeToStr(GetServerDate));
      lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
      lstPara.Add('dateT='+dtdReceDateT.Text);
      lstPara.Add('RemarkTotal='+'装柜'+inttostr(ZUOM)+'个：20’'+inttostr(Z20UOM)+'个，40’'+inttostr(Z40UOM)+'个，40’HQ'+inttostr(Z40HQUOM)+'个；'+chr(13)+chr(10)
                                +'卸柜'+inttostr(XUOM)+'个：20’'+inttostr(X20UOM)+'个，40’'+inttostr(X40UOM)+'个，40’HQ'+inttostr(X40HQUOM)+'个；'+chr(13)+chr(10)
                                +'折标准箱： '+inttostr(BZXUOM)+'个');
      WorkFillbb('900016',lstPara,not blnPrint,True,1,dataTmp.qryTmp);
   end else
   begin
      strsql:=' ksp_inconstatsku @shippercusid="'+trim(cmbShipperCus.TextField)+'" ,'
             +'                  @userid="'+trim(edtIUser.TextField)+'",'
             +'                  @datef="'+dtdReceDateF.Text+'",'
             +'                  @dateT="'+dtdReceDateT.Text+'" ';

      dataTmp.qryTmp.close;
      dataTmp.qryTmp.sql.Clear;
      OpenSql(dataTmp.qryTmp,strsql);
      GenInformations(lstPara);
      lstPara.Add('ZBR='+_LoginName);
      lstPara.Add('ZBRQ='+DateTimeToStr(GetServerDate));
      lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
      lstPara.Add('dateT='+dtdReceDateT.Text);
      dataTmp.qryTmp.First;
      while not dataTmp.qryTmp.Eof do
      begin
        if dataTmp.qryTmp.FieldByName('ZXBZ').AsString='装' then
        begin
          if dataTmp.qryTmp.FieldByName('CONTYPE').AsString='20' then
          begin
            Z20UOM:=Z20UOM+1;
            BZXUOM:=BZXUOM+1;
          end
          else
          begin
            if dataTmp.qryTmp.FieldByName('CONSPTYPE').AsString='HQ' then
            begin
               Z40HQUOM:=Z40HQUOM+1;
               BZXUOM:=BZXUOM+2;
            end else
            begin
               Z40UOM:=Z40UOM+1;
               BZXUOM:=BZXUOM+2;
            end;
          end;
          ZUOM:=ZUOM+1;
        end
        else begin
          if dataTmp.qryTmp.FieldByName('CONTYPE').AsString='20' then
          begin
            X20UOM:=X20UOM+1;
            BZXUOM:=BZXUOM+1;
          end
          else
          begin
            if dataTmp.qryTmp.FieldByName('CONSPTYPE').AsString='HQ' then
            begin
               X40HQUOM:=X40HQUOM+1;
               BZXUOM:=BZXUOM+2;
            end else
            begin
               X40UOM:=X40UOM+1;
               BZXUOM:=BZXUOM+2;
            end;
          end;
          XUOM:=XUOM+1;
        end;
        dataTmp.qryTmp.Next;
      end;
      dataTmp.qryTmp.First;

      GenInformations(lstPara);
      lstPara.Add('ZBR='+_LoginName);
      lstPara.Add('ZBRQ='+DateTimeToStr(GetServerDate));
      lstPara.Add('dateF='+dtdReceDateF.Text);                      //统计日期
      lstPara.Add('dateT='+dtdReceDateT.Text);
      lstPara.Add('RemarkTotal='+'装柜'+inttostr(ZUOM)+'个：20’'+inttostr(Z20UOM)+'个，40’'+inttostr(Z40UOM)+'个，40’HQ'+inttostr(Z40HQUOM)+'个；'+chr(13)+chr(10)
                                +'卸柜'+inttostr(XUOM)+'个：20’'+inttostr(X20UOM)+'个，40’'+inttostr(X40UOM)+'个，40’HQ'+inttostr(X40HQUOM)+'个；'+chr(13)+chr(10)
                                +'折标准箱： '+inttostr(BZXUOM)+'个');
      WorkFillbb('900049',lstPara,not blnPrint,True,1,dataTmp.qryTmp);
   end;

end;

procedure TfrminconStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=CaFree;
end;

procedure TfrminconStat.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrminconStat.FormCreate(Sender: TObject);
begin
   SetFormPosition(Self,True);
   SetFormStyle(Self);
end;

procedure TfrminconStat.FormDestroy(Sender: TObject);
begin
   frminconStat:=nil;
end;

procedure TfrminconStat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrminconStat.cmbShipperCusButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetCustomerSelect('E','');
   if qrySelect.FieldByName('Cusid').AsString<>'NO' then
   begin
      cmbShipperCus.TextField  :=qrySelect.FieldByName('Cusid').asstring;
      cmbShipperCus.Text       :=qrySelect.FieldByName('Cusname').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrminconStat.cmbShipperCusExit(Sender: TObject);
begin
   if cmbShipperCus.Text='' then cmbShipperCus.TextField:='';
end;

procedure TfrminconStat.edtIUserButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qryselect:TKADOQuery;
begin
   qrySelect:=pGetOrganizationSelect('','','F');
   if qrySelect.FieldByName('userid').AsString<>'NO' then
   begin
      edtIUser.TextField  :=qrySelect.FieldByName('userid').asstring;
      edtIUser.Text       :=qrySelect.FieldByName('username').asstring;
   end;
   FreeAndNil(qrySelect);
end;

procedure TfrminconStat.edtIUserExit(Sender: TObject);
begin
   if edtIUser.Text='' then edtIUser.TextField:='';
end;

end.
