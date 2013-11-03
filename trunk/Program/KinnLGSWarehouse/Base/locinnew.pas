unit Locinnew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, KBitBtn, DbButtons, DBKINCGrids, StdCtrls, KGroupBox,
  GMSLabel, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, DBTables, dxExEdtr,
  dxEdLib, dxDBELib, dxEditor, KinPickEdit,libproc,
  KDataSetProvider, DBClient, Menus, dxDBTLCl, dxGrClms;

type
  TfrmLocinnew = class(TForm)
    KGroupBox2: TKGroupBox;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    udslocinnew: TKadoUpdateSql;
    dtslocinnew: TDataSource;
    qrylocinnew: TKADOQuery;
    edtmainorder: TdxDBEdit;
    edtcustomerno: TdxDBEdit;
    qryTmp: TKADOQuery;
    edtpltid: TdxDBEdit;
    GMSStickyLabel3: TGMSStickyLabel;
    GMSStickyLabel4: TGMSStickyLabel;
    edtqtyperct: TdxDBEdit;
    GMSStickyLabel5: TGMSStickyLabel;
    edtallct: TdxDBEdit;
    GMSStickyLabel6: TGMSStickyLabel;
    GMSStickyLabel7: TGMSStickyLabel;
    edtlocname: TdxDBButtonEdit;
    qrytmp1: TKADOQuery;
    btnOk: TKBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure locnameButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure edtlocnameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edtlocnameExitCheck(Sender: TObject; OldValue: Variant;
      var Failed: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtlocnameExit(Sender: TObject);
    procedure edtcustomernoExit(Sender: TObject);
    procedure edtmainorderExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtpltidExit(Sender: TObject);
    procedure edtallctExit(Sender: TObject);
    procedure edtqtyperctExit(Sender: TObject);
    procedure edtmainorderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcustomernoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtpltidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtqtyperctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtallctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtlocnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    strsql:string;
//    ScrollAfterEdit:Boolean;           //�ж������¼�Ƿ��ƶ�
    stroldmainorder,stroldcustomerno,stroldqtyperct :string;
    procedure workcall(Callmode:Tdatastate);
    procedure EnableEdit;
    procedure DisableEdit;
    procedure DisableBrowse;
    function  Gather:boolean;
    procedure InitValues;
    procedure SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
  public
    { Public declarations }
  end;
procedure workLocinnew;
var
  frmLocinnew: TfrmLocinnew;

implementation

{$R *.dfm}
uses datas,kindlg,main,libUserpub,libuser,GetDllPub;
var
  DataState:TDataState;
  setDisable:TsetInt;
  setPermission:TsetInt;
procedure workLocinnew;
{ģ��������}
begin
   if frmLocinnew <> nil then
   with FrmLocinnew do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TFrmLocinnew, FrmLocinnew);
   with frmLocinnew do
   begin
//��ʼ������
//      ScrollAfterEdit:=True;
      setPermission:=[];
      stroldmainorder:='';
      stroldcustomerno:='';
      stroldqtyperct:='';
      strsql:=' select jobno,mainorder,customerno,qtyperct,    '+chr(13)+chr(10)
             +'        pltid,allct,locname,opdate,       '+chr(13)+chr(10)
             +'        opname,completeid                 '+chr(13)+chr(10)
             +'   from locinnew(nolock)                  '+chr(13)+chr(10)
             +'  where 1=2                               '+chr(13)+chr(10)
              ;
       qrylocinnew.Close;
       qrylocinnew.SQL.Clear;
       qrylocinnew.SQL.Add(strsql);
       qrylocinnew.open;
   end;
   FrmLocinnew.workcall(stinsert);
   frmLocinnew.Show;
end;

procedure TfrmLocinnew.WorkCall(CallMode:TDataState);
begin
  DataState:=CallMode;
  with frmLocinnew do
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
          EnableEdit;
          qryLocinnew.Edit;
          LampChange(lsEdit);
        end;
      stInsert:
        begin
          qryLocinnew.Append;
          EnableEdit;
          InitValues;
          if (qrylocinnew.FieldByName('mainorder').asstring<>'') and (qrylocinnew.FieldByName('customerno').asstring<>'') then
          begin
             edtcustomerno.SetFocus;
          end;
          LampChange(lsEdit);
        end;
    end;
  end;
end;

function  TfrmLocinnew.Gather:boolean;
{����ֵ�������ݿ�ǰ,��ֵ�������}
begin
   Result:=False;
{   if qrylocinnew.fieldbyname('customerno').asstring='' then
   begin
      KMessageDlg('��Ʒ���벻��Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtcustomerno;
      Exit;
   end else
   if qrylocinnew.fieldbyname('pltid').asstring='' then
   begin
      KMessageDlg('���̺Ų���Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtpltid;
      Exit;
   end else
   if qrylocinnew.fieldbyname('qtyperct').asstring='' then
   begin
      KMessageDlg('���������Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtqtyperct;
      Exit;
   end else
   if qrylocinnew.fieldbyname('allct').asstring='' then
   begin
      KMessageDlg('����������Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtallct;
      Exit;
   end else
   if edtlocname.Text='' then
   begin
      KMessageDlg('��λ����Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtlocname;
      Exit;
   end;   }

   qrylocinnew.FieldByName('opname').asstring:=_loginid;
   qrylocinnew.FieldByName('opdate').asstring:=datetimetostr(getserverdate);
   

   Result:=True;
end;

procedure TfrmLocinnew.EnableEdit;
{�޸�����״̬����ENABLE�Ķ���}
begin
{   setDisable:=[];
   LibComControl(Self,[1..5]+setDisable,[50]+[10..20]-setDisable);   }
end;

procedure TfrmLocinnew.DisableEdit;
{�鿴����״̬����DISABLE�Ķ���}
begin
{   setDisable:=[];
   if qryLocinnew.RecordCount=0 then setDisable:=setDisable+[2,4];
   libComControl(self,[10..11]+setDisable,[1..5]-setDisable);
   if qryLocinnew.RecordCount=0 then setDisable:=setDisable-[2,4];  }
end;

procedure TfrmLocinnew.DisableBrowse;
{�鿴����״̬����¼�ƶ�ʱ����ENABLE��DISABLE�Ķ���}
begin
//
end;

procedure TfrmLocinnew.InitValues;
{��ʼ��ʱ�Զ����ɲ�λ����}
begin
   qrylocinnew.FieldByName('mainorder').asstring:=stroldmainorder;
   qrylocinnew.FieldByName('customerno').asstring:=stroldcustomerno;
   if qrylocinnew.FieldByName('customerno').asstring<>'' then
   begin
      opensql(qrytmp,'select piecepro from sku (nolock)   '
                    +' where customerno="'+edtcustomerno.Text+'"            '
                     ) ;
      if qrytmp.fieldbyname('piecepro').AsString<>'' then
      begin
         qrylocinnew.fieldbyname('qtyperct').AsString:=qrytmp.fieldbyname('piecepro').AsString;
      end
   end;
   edtpltid.Text:='';
   edtallct.Text:='';
   edtlocname.Text:='';
   edtlocname.TextField:='';
end;

procedure TfrmLocinnew.FormCreate(Sender: TObject);
begin
   Height:=333;
   Width :=290;
   SetFormPosition(Self,True);
   SetFormStyle(Self);
   SetGroupbox(KGroupBox2);
   qrylocinnew.Connection:=_adoconnection;
   qryTmp.connection:=_adoconnection;
   qryTmp1.connection:=_adoconnection;
end;

procedure TfrmLocinnew.FormDestroy(Sender: TObject);
begin
   qrylocinnew.close;
   frmLocinnew:=nil;
end;

procedure TfrmLocinnew.btnRefreshClick(Sender: TObject);
var
   strLocinnew:string;
begin
   strLocinnew:=qryLocinnew.FieldByName('jobno').AsString;
   qryLocinnew.DisableControls;
   qryLocinnew.Close;
   qryLocinnew.Open;
   try
      qryLocinnew.Locate('jobno', strLocinnew, [loCaseInsensitive, loPartialKey]);
   except
      qryLocinnew.Last;
   end;
   qryLocinnew.EnableControls;
end;

procedure TfrmLocinnew.locnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('T','','');
   if qrySelect.FieldByName('locid').AsString<>'NO' then
   begin
      qrylocinnew.Edit;
      qrylocinnew.FieldByName('locname').asstring    :=qrySelect.FieldByName('locname').asstring;
   end;
   FreeAndNil(qryselect);
end;

procedure TfrmLocinnew.SetDetailActive(blnPage:Boolean; blnOpen:Boolean);
{���ôӿ�query��active
 blnPage�Ƿ���Ҫҳ�����
 blnOpen�Ƿ�open(�����ó�FalseʱblnReOpenһ��ҪΪFalse)
 blnReOpen�Ƿ���Ҫ����Open
}
begin
{   if not ScrollAfterEdit and blnOpen then
   begin
     if qrylocinnew.Active then
     begin
        qrylocinnew.Close;
        qrylocinnew.Open;
     end;
   end;  }
end;

procedure TfrmLocinnew.btnOkClick(Sender: TObject);
begin
   if (DataState in Setdcs) and Gather then
   begin
     _ADOConnection.StartTransaction;
     try
       stroldmainorder:=edtmainorder.text;
       stroldcustomerno:=edtcustomerno.text;
       stroldqtyperct:=edtqtyperct.text;
       qrylocinnew.ApplyUpdates;
       ExecSql(qryTmp, 'exec ksp_locinnew "'+edtmainorder.Text+'","'+_loginid+'"' );
       _ADOConnection.Commit;
     except
       if _ADOConnection.InTransaction then
          _ADOConnection.Rollback;
       Raise;
       Exit;
     end;
     qryLocinnew.CommitUpdates;
//     ScrollAfterEdit:=False;
     WorkCall(STINSERT);
     edtcustomerno.SetFocus;
   end;
end;

procedure TfrmLocinnew.edtlocnameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   qrySelect:TKADOQuery;
begin
   qrySelect:=pGetLocationSelect('T','','');
   if qrySelect.FieldByName('locid').AsString<>'NO' then
   begin
      qrylocinnew.Edit;
//      edtlocname.Textfield :=qrySelect.FieldByName('locid').asstring;
      qrylocinnew.FieldByName('locname').asstring      :=qrySelect.FieldByName('locname').asstring;
   end;
   FreeAndNil(qryselect);
end;

procedure TfrmLocinnew.edtlocnameExitCheck(Sender: TObject;
  OldValue: Variant; var Failed: Boolean);
var
   qrySelect:TKADOQuery;
begin
   if edtlocname.Text<>'' then
   begin
      opensql(qryTmp,'select top 1 locid,locname from location(nolock) where locname like "%"+"'+edtlocname.Text+'"+"%"') ;
      if qryTmp.RecordCount>0 then
      begin
         edtlocname.Text:=qryTmp.fieldbyname('locname').asstring;
         edtlocname.Textfield:=qryTmp.fieldbyname('locid').asstring;
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

procedure TfrmLocinnew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtlocnameExit(Sender: TObject);
begin
   if edtlocname.Text='' then
   begin
      KMessageDlg('��λ����Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtlocname;
      Exit;
   end;
end;

procedure TfrmLocinnew.edtcustomernoExit(Sender: TObject);
begin
   if qrylocinnew.fieldbyname('customerno').asstring='' then
   begin
      KMessageDlg('��Ʒ���벻��Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtcustomerno;
      Exit;
   end else
   if edtcustomerno.Text<>'' then
   begin
      opensql(qrytmp,'select count(1) mm from locationinitem (nolock)   '
                    +' where customerno="'+edtcustomerno.Text+'"            '
                     ) ;
      if qryTmp.FieldByName('mm').AsFloat=0 then
      begin
          KMessageDlg('�˶�����û�и���Ʒ,��ȷ����������!',mtWarning,[mbOK],0);
          ActiveControl:=edtcustomerno;
          Exit;
      end else
      begin
         qrylocinnew.Edit;
         opensql(qrytmp,'select piecepro from sku (nolock)   '
                       +' where customerno="'+edtcustomerno.Text+'"            '
                        ) ;
         if qrytmp.fieldbyname('piecepro').AsString<>'' then
         begin
            qrylocinnew.fieldbyname('qtyperct').AsString:=qrytmp.fieldbyname('piecepro').AsString;
         end else
            qrylocinnew.fieldbyname('qtyperct').AsString:='';
      end;
   end;
end;

procedure TfrmLocinnew.edtmainorderExit(Sender: TObject);
begin
   if qrylocinnew.fieldbyname('mainorder').asstring='' then
   begin
      KMessageDlg('��ֵ��Ų���Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtmainorder;
      Exit;
   end else
   if edtmainorder.Text<>'' then
   begin
      opensql(qrytmp,'select count(1) res from locationin(nolock) where mainorder="'+edtmainorder.Text+'" ') ;
      if qrytmp.fieldbyname('res').AsFloat<1 then
      begin
          KMessageDlg('û�д˶�����,����������!',mtWarning,[mbOK],0);
          ActiveControl:=edtmainorder;
          Exit;
      end;
   end;
end;

procedure TfrmLocinnew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLocinnew.edtpltidExit(Sender: TObject);
begin
   if qrylocinnew.fieldbyname('pltid').asstring='' then
   begin
      KMessageDlg('���̺Ų���Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtpltid;
      Exit;
   end;
   edtallct.SetFocus;
end;

procedure TfrmLocinnew.edtallctExit(Sender: TObject);
begin
   if qrylocinnew.fieldbyname('allct').asstring='' then
   begin
      KMessageDlg('����������Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtallct;
      Exit;
   end else
   if edtallct.Text<>'' then
   begin

      OpenSql(qrytmp1,'select count(1) hj         '
                    +'  from locationinitem item (nolock),locationindetail detail(nolock)                    '
                    +' where item.mainorder="'+edtmainorder.Text+'"   '
                    +'   and item.customerno="'+edtcustomerno.Text+'" '
                    +'   and item.jobno=detail.jobno   '
                    +'   and item.sno=detail.sno      '
                    +' group by item.quantitytask'
                    )  ;
      if qrytmp1.fieldbyname('hj').AsFloat>=1 then
      begin
         OpenSql(qryTmp,'select item.quantitytask,quantity=sum(isnull(detail.quantity,0))                                   '
                       +'  from locationinitem item (nolock),locationindetail detail(nolock)                    '
                       +' where item.mainorder="'+edtmainorder.Text+'"   '
                       +'   and item.customerno="'+edtcustomerno.Text+'" '
                       +'   and item.jobno=detail.jobno   '
                       +'   and item.sno=detail.sno      '
                       +' group by item.quantitytask'
                       )  ;
         if (qryTmp.FieldByName('quantity').AsFloat+strtofloat(edtallct.Text))>(qryTmp.FieldByName('quantitytask').AsFloat) then
         begin
            KMessageDlg('ʵ��������������������ȷ����Ʒ!',mtWarning,[mbOK],0);
            ActiveControl:=edtcustomerno;
            edtlocname.ReadOnly:=True;
            Exit;
         end else
            edtlocname.ReadOnly:=False;
      end else
      begin
         OpenSql(qryTmp,'select piecetask      '
                       +'  from locationinitem item '
                       +' where item.mainorder="'+edtmainorder.Text+'"   '
                       +'   and item.customerno="'+edtcustomerno.Text+'" '
                       );
         if (qryTmp.FieldByName('piecetask').AsFloat)<StrToFloat(edtallct.Text) then
         begin
            KMessageDlg('ʵ��������������������ȷ����Ʒ!',mtWarning,[mbOK],0);
            ActiveControl:=edtcustomerno;
            edtlocname.ReadOnly:=True;
            Exit;
         end else
            edtlocname.ReadOnly:=False;
      end;
   end;
end;

procedure TfrmLocinnew.edtqtyperctExit(Sender: TObject);
begin
   if qrylocinnew.fieldbyname('qtyperct').asstring='' then
   begin
      KMessageDlg('���������Ϊ��',mtWarning,[mbOK],0);
      ActiveControl:=edtqtyperct;
      Exit;
   end
end;

procedure TfrmLocinnew.edtmainorderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtcustomernoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtpltidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtqtyperctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtallctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

procedure TfrmLocinnew.edtlocnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=Vk_Return) then ReturnNext(Self);
end;

end.
