unit Cqgzcx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, KBitBtn, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, KGroupBox,
  DB, DBTables, DBClient, KDataSetProvider, DbButtons, ExtCtrls, dxExEdtr,
  dxEdLib, dxEditor, GMSLabel, KinPickEdit, Menus;

type
  TfrmCqgzcx = class(TForm)
    KGroupBox2: TKGroupBox;
    qryTmp: TKADOQuery;
    KGroupBox1: TKGroupBox;
    qryCqgzcx: TKADOQuery;
    dtsCqgzcx: TDataSource;
    grdCqgzcx: TdxDBGrid;
    ppmedit: TPopupMenu;
    N1: TMenuItem;
    btnRefresh: TKBitBtn;
    edtcarrino: TdxEdit;
    GMSStickyLabel4: TGMSStickyLabel;
    edtydh: TdxEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    edtconno: TdxEdit;
    GMSStickyLabel2: TGMSStickyLabel;
    btnprint: TKBitBtn;
    carrino: TdxDBGridColumn;
    YDH: TdxDBGridColumn;
    conno: TdxDBGridColumn;
    fh: TdxDBGridColumn;
    spec: TdxDBGridColumn;
    grdshr: TdxDBGridColumn;
    md: TdxDBGridColumn;
    lxr: TdxDBGridColumn;
    dh: TdxDBGridColumn;
    jobno: TdxDBGridColumn;
    createdate: TdxDBGridColumn;
    mitdy: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure mitdyClick(Sender: TObject);
  private
    { Private declarations }
    strAccountID:string;
    strsql: string;
  public
    { Public declarations }
  end;

procedure WorkCqgzcx;

var
  frmCqgzcx: TfrmCqgzcx;

implementation

{$R *.dfm}

uses  libproc,libUser,libuserPub,Datas,kindlg, main,GetUserRight,GetDllPub,
      dxGridOut,linprint,libBb,bbShow ,ss;

procedure WorkCqgzcx;
var
  strSql,strTask:string;
  i:integer;
  lstList:TStringList;
begin
   if frmCqgzcx<>nil then
   with frmCqgzcx do
   begin
      if WindowState=wsMinimized then
         WindowState:=wsNormal;
      Show;
      Exit;
   end;
   Application.CreateForm(TfrmCqgzcx, frmCqgzcx);
   frmCqgzcx.Show;
end;

procedure TfrmCqgzcx.FormCreate(Sender: TObject);
begin
   Width:=791;
   Height:=515;
   SetFormStyle(Self);
   SetDxDbGrid(grdCqgzcx);
   SetGroupbox(KGroupBox1);
   qryCqgzcx.Connection:=_ADOConnection;
   qryTmp.Connection:=_ADOConnection;
end;

procedure TfrmCqgzcx.FormDestroy(Sender: TObject);
begin
  Lampchange(lsMenu);
  frmCqgzcx:=nil;
end;

procedure TfrmCqgzcx.btnCloseClick(Sender: TObject);
begin
   frmCqgzcx.Close;
end;

procedure TfrmCqgzcx.btnOkClick(Sender: TObject);
var
   i:integer;
begin
   frmCqgzcx.Close;
end;

procedure TfrmCqgzcx.btnRefreshClick(Sender: TObject);
var
  strSql,strfilterSql:string;
  i:integer;
  lstList:TStringList;
begin
    if edtcarrino.Text<>'' then
       strfilterSql:=' and carrino like "%'+edtcarrino.Text+'%"         ';

    if edtydh.Text<>'' then
       strfilterSql:=strfilterSql+' and ydh like "%'+edtydh.Text+'%"    ';

    if edtconno.Text<>'' then
       strfilterSql:=strfilterSql+' and conno like "%'+edtconno.Text+'%" ' ;


    strsql:=' select jobno,carrino,ydh,conno,                 '+chr(13)+chr(10)
           +'  		fh,spec,shr,md,lxr,dh,createdate         '+chr(13)+chr(10)
           +'   from cqgzb (nolock)                           '+chr(13)+chr(10)
           +'  where 1=1                                      '+chr(13)+chr(10)
           +strfilterSql
           ;
    qryCqgzcx.Close;
    qryCqgzcx.Sql.Clear;
    qryCqgzcx.Sql.Add(strsql);
    qryCqgzcx.Open;
    btnprint.Enabled:=True;
end;

procedure TfrmCqgzcx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfrmCqgzcx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=Vk_Return then ReturnNext(Self);
   case Key of
     Vk_Escape:
       Close;
   end;
end;

procedure TfrmCqgzcx.N1Click(Sender: TObject);
var
   i,j:Integer;
begin
   j:=grdCqgzcx.SelectedCount;
   if KmessageDlg('该操作将删除选中的所有资料，您确定操作吗?',mtInformation,[mbYes,mbNo],0)<>mrYes then
      Exit;
   for i:=grdCqgzcx.SelectedCount-1 Downto 0 do
   begin
      qryCqgzcx.GotoBookmark(Pointer(grdCqgzcx.SelectedRows[i]));
      Execsql(qryTmp,' delete cqgzb where jobno="'+qryCqgzcx.fieldbyname('jobno').AsString+'"');
   end;
   qryCqgzcx.close;
   qryCqgzcx.open;
end;

procedure TfrmCqgzcx.btnprintClick(Sender: TObject);
var
   lstPara:TStringList;
   i,j:Integer;
begin
   lstPara:=TStringList.Create;
   j:=grdCqgzcx.SelectedCount;
   OpenSql(qryTmp,'select *                                                     '+chr(13)+chr(10)
                 +'  from cqgzb (nolock)                                        '+chr(13)+chr(10)
                 +' where jobno="'+qryCqgzcx.fieldbyname('jobno').AsString+'"   '+chr(13)+chr(10)
                 );
   lstpara.Add('carrino='+qryTmp.fieldbyname('carrino').AsString);
   lstpara.Add('ydh='+qryTmp.fieldbyname('ydh').AsString);
   lstpara.Add('conno='+qryTmp.fieldbyname('conno').AsString);
   lstpara.Add('spec='+qryTmp.fieldbyname('spec').AsString);
   lstpara.Add('fh='+qryTmp.fieldbyname('fh').AsString);
   lstpara.Add('shr='+qryTmp.fieldbyname('shr').AsString);
   lstpara.Add('md='+qryTmp.fieldbyname('md').AsString);
   lstpara.Add('lxr='+qryTmp.fieldbyname('lxr').AsString);
   lstpara.Add('dh='+qryTmp.fieldbyname('dh').AsString);
   lstpara.Add('zdr='+_loginname);
   lstpara.Add('zdrq='+datetostr(GetServerDate));
   Worklinprint('100178','old','货物运到证明单',qryTmp,nil,nil,lstpara);
end;

procedure TfrmCqgzcx.mitdyClick(Sender: TObject);
var
   KF1Book:TKF1book;
   KF1BookSheet:TKF1Book;
   i,j:Integer;
   qryselect:TKADOQuery;

   procedure F1BookAssign(SorcF1Book,DescF1Book:TKF1Book);
   var
       Scale:smallint;
       Hpage,vpage:integer;
       fittopage:WordBool;
   begin
      DescF1Book.F1Book.PrintTopMargin:=SorcF1Book.F1Book.PrintTopMargin;
      DescF1Book.F1Book.PrintBottomMargin:=SorcF1Book.F1Book.PrintBottomMargin;
      DescF1Book.F1Book.PrintLeftMargin:=SorcF1Book.F1Book.PrintLeftMargin;
      DescF1Book.F1Book.PrintRightMargin:=SorcF1Book.F1Book.PrintRightMargin;
      DescF1Book.F1Book.PrintLeftToRight:=SorcF1Book.F1Book.PrintLeftToRight;
      DescF1Book.F1Book.PrintHCenter:=SorcF1Book.F1Book.PrintHCenter;
      DescF1Book.F1Book.PrintVCenter:=SorcF1Book.F1Book.PrintVCenter;
      DescF1Book.F1Book.PrintGridLines:=SorcF1Book.F1Book.PrintGridLines;
      DescF1Book.F1Book.PrintNoColor:=SorcF1Book.F1Book.PrintNoColor;
      DescF1Book.F1Book.PrintColHeading:=SorcF1Book.F1Book.PrintColHeading;
      DescF1Book.F1Book.PrintRowHeading:=SorcF1Book.F1Book.PrintRowHeading;

      SorcF1Book.F1Book.GetPrintScale(Scale, FitToPage, VPage, HPage);
      DescF1Book.F1Book.SetPrintScale(Scale, FitToPage, VPage, HPage);

      DescF1Book.F1Book.PrintHeader:=SorcF1Book.F1Book.PrintHeader;
      DescF1Book.F1Book.PrintFooter:=SorcF1Book.F1Book.PrintFooter;
   end;

   procedure withF1bookdo(pF1book:TKF1book;pReceno:string);
   begin
      with pF1book do
      begin
         OpenSql(qryTmp,'select * from cqgzb (nolock)'
                       +' where jobno='+pReceno+''
                        );
         ShowPrintDlg:=False;
         BbHandle:=bbNone;
         qryMain:=nil;
         qryRow:=nil;
         qryCol:=nil;
         _BBSave:=false;

         paras.Values['carrino']:=qryTmp.FieldByName('carrino').AsString;
         paras.Values['ydh']:=qryTmp.FieldByName('ydh').AsString;
         paras.Values['conno']:=qryTmp.FieldByName('conno').AsString;
         paras.Values['spec']:=qryTmp.FieldByName('spec').AsString;
         paras.Values['fh']:=qryTmp.FieldByName('fh').AsString;
         paras.Values['shr']:=qryTmp.FieldByName('shr').AsString;
         paras.Values['md']:=qryTmp.FieldByName('md').AsString;
         paras.Values['lxr']:=qryTmp.FieldByName('lxr').AsString;
         paras.Values['dh']:=qryTmp.FieldByName('dh').AsString;
         paras.Values['zdr']:=_loginname;
         paras.Values['zdrq']:=datetostr(GetServerDate);
         Bbdm:='100178';
         CreateReport;
      end;
   end;

   procedure InsertSheetsPI(pKF1Book:TKF1Book;intIndex:integer;pstrbbdm,pStrbbmc:String;
                            pReceno:string);
   begin
      try
         withF1Bookdo(KF1BookSheet,pReceno);
         with KF1BookSheet do
         begin
            F1book.SetSelection(1,1,F1Book.LastRow,F1Book.MaxCol);
            F1Book.EditCopy;
            pKF1Book.F1Book.Sheet:=1;
            F1BookAssign(KF1BookSheet,pKF1Book);
            pKF1Book.F1Book.Row:=pKF1Book.F1Book.LastRow+1;
            pKF1Book.F1Book.Col:=1;
            pKF1Book.F1Book.EditPaste;
         end;
      finally
         KF1BookSheet.F1Book.ClearClipboard;
      end;
   end;
begin
   qryselect:=TKADOQuery.Create(Application);
   //strsql:='select * from cqgzb (nolock)  ';
   try
      KF1Book:=TKF1Book.Create;
      KF1BookSheet:=TKF1Book.Create;
      qryselect.Connection:=_ADOConnection;
      //OpenSql(qryselect,strsql);
      i:=0;
      //with qryselect do
      for j:=grdCqgzcx.SelectedCount-1 Downto 0 do
      //while not Eof do
      begin
         begin
            KF1BookSheet.Bbdm:='100178';
            KF1BookSheet.LoadfromDb;
            qryCqgzcx.GotoBookmark(Pointer(grdCqgzcx.SelectedRows[j]));
            //InsertSheetsPI(KF1Book,i,'100178','货物运到证明单',fieldbyname('jobno').AsString);
            InsertSheetsPI(KF1Book,i,'100178','货物运到证明单',qryCqgzcx.fieldbyname('jobno').AsString);
         end;
         //lzw20120114
         i:=i+1;
         next;
      end;
      WorkBbShow(KF1Book);
   except
      KF1Book.Destroy;
      KF1BookSheet.Destroy;
   end;
   //FreeAndNil(qryCqgzcx);
end;

end.

