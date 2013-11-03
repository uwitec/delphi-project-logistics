unit DocBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GMSLabel, dxCntner, dxEditor, dxEdLib, dxDBELib,
  ComCtrls, SLV, KGroupBox, DB, Buttons, DBTables, KBitBtn,ShellAPI,CommCtrl,
  FileCtrl, KDataSetProvider, DBClient;

type
  TLVFileInfo=record
                FileName: string;
                FileContent: TMemoryStream;
              end;
  TfrmDocBook = class(TForm)
    KGroupBox1: TKGroupBox;
    edtDOCID: TdxEdit;
    GMSStickyLabel1: TGMSStickyLabel;
    GMSStickyLabel2: TGMSStickyLabel;
    edtDOCTYPE: TdxEdit;
    KGroupBox2: TKGroupBox;
    lvAttachment: TKinListView;
    btnAdd: TKBitBtn;
    dtsDocBook: TDataSource;
    qryDocBook: TKADOQuery;
    udsDocBook: TKadoUpdateSql;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lvAttachmentGetImageIndex(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
    FLargeImages,
    FSmallImages: Integer;
  public
    { Public declarations }
  end;

var
  frmDocBook: TfrmDocBook;

procedure WorkDocBook(const pstrDOCTYPE,pstrDOCID: string);
function GetFileSmallImages: Integer;
function GetFileLargeImages: Integer;
procedure SetFileImageIndex(Item: TListItem;blnLargeIcon: Boolean);
procedure InitFileImageList(lv: TCustomListView;FSmallImages,FLargeImages: integer);
function AddFileItem(lv: TCustomListView): TLVFileInfo;
procedure OpenItemFile(strFileName: string;BlobField: TBlobField);
procedure ClearTempFile;

implementation

{$R *.dfm}

uses
  main,libProc,libUser;

procedure WorkDocBook(const pstrDOCTYPE,pstrDOCID: string);
begin
   frmDocBook:=TfrmDocBook.Create(Application);
   with frmDocBook do
   begin
     InitFileImageList(lvAttachment,FSmallImages,FLargeImages);//初始化图标列表   
     //
     qryDocBook.Connection  := _ADOConnection;
     qryDocBook.SQL.Clear;
     qryDocBook.SQL.Add('select * from DocBook '
                      +' where DOCTYPE = :DOCTYPE '
                      +'  and DOCID = :DOCID ');
     qryDocBook.ParamByName('DOCTYPE').AsString := pstrDOCTYPE;
     qryDocBook.ParamByName('DOCID').AsString := pstrDOCID;
     qryDocBook.Open;
     //
     edtDOCID.Text := pstrDOCID;
     edtDOCTYPE.Text := pstrDOCTYPE; 
     if qryDocBook.FieldByName('DOCID').AsString = '' then
     begin
       qryDocBook.Append;
       qryDocBook.FieldByName('DOCTYPE').AsString := pstrDOCTYPE;
       qryDocBook.FieldByName('DOCID').AsString := pstrDOCID;
       qryDocBook.FieldByName('sno').AsInteger := 1;
     end else
     begin
       qryDocBook.Edit;
     end;
     ShowModal;
     Free;
   end;  
end;

function GetFileSmallImages: integer;
var
  FileInfo: TSHFileInfo;
begin
  Result := SHGetFileInfo('C:\',
    0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
end;

function GetFileLargeImages: Integer;
var
  FileInfo: TSHFileInfo;
begin
  Result := SHGetFileInfo('C:\',
    0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
end;

procedure SetFileImageIndex(Item: TListItem;blnLargeIcon: Boolean);
var
  FileInfo: TSHFileInfo;
  Flags: Integer;  //
begin
  Flags := SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES;
  if blnLargeIcon then
    Flags := Flags or SHGFI_LARGEICON
  else
    Flags := Flags or SHGFI_SMALLICON;
  SHGetFileInfo(PChar(Item.Caption),
           FILE_ATTRIBUTE_NORMAL,
           FileInfo,
           SizeOf(FileInfo),
           Flags);
  Item.ImageIndex := FileInfo.iIcon;
end;

procedure InitFileImageList(lv: TCustomListView;FSmallImages,FLargeImages: integer);
begin
   if FSmallImages <> 0 then
     SendMessage(lv.Handle, LVM_SETIMAGELIST, LVSIL_SMALL, FSmallImages);
   if FLargeImages <> 0 then
     SendMessage(lv.Handle, LVM_SETIMAGELIST, LVSIL_NORMAL, FLargeImages);
end;

function AddFileItem(lv: TCustomListView): TLVFileInfo;
var
  strFileName: string;
  dlgOpenFile: TOpenDialog;
  ListItem: TListItem;
  LVFileInfo: TLVFileInfo;
  I: integer;
  MemoryStream: TMemoryStream;
  Data: Pointer;
  h,l: longint;
  //Text: string[3];
begin
  dlgOpenFile := TOpenDialog.Create(Application);
  dlgOpenFile.Filter := ' 所有文件(*.*)|*.*';
  if dlgOpenFile.Execute then
  begin
    //增加到listview
    strFileName := ExtractFileName(dlgOpenFile.FileName);
    ListItem := TListView(lv).Items.Add;
    ListItem.Caption := strFileName;
    SetFileImageIndex(ListItem,True);
    //存储文件结构
    LVFileInfo.FileName := strFileName;
    LVFileInfo.FileContent := TMemoryStream.Create;
    LVFileInfo.FileContent.LoadFromFile(dlgOpenFile.FileName);
    //创建流变量
    MemoryStream := TMemoryStream.Create;
    //分解，存储文件，返回函数
    LVFileInfo.FileContent.Position := 0;
    for i := 0 to LVFileInfo.FileContent.Size-1 do
    begin
      GetMem(Data,1);
      LVFileInfo.FileContent.Read(Data^,1);
      h := integer(hi(longint(Data^)));
      l := integer(Lo(longint(Data^)));
      h := l div 16;
      l := l mod 16;
      MemoryStream.Write(l,1);
      MemoryStream.Write(h,1);
      FreeMem(Data);
    end;
    {LVFileInfo.FileContent.Position := 0;
    for i := 0 to LVFileInfo.FileContent.Size-1 do
    begin
      GetMem(Data,1);
      LVFileInfo.FileContent.Read(Data^,1);
      SetLength(Text,2);
      BinToHex(Data,@Text[1],1);
      MemoryStream.Write(Text[1],1);
      MemoryStream.Write(Text[2],1);      
      FreeMem(Data);
    end;}
    LVFileInfo.FileContent.LoadFromStream(MemoryStream);
    Result := LVFileInfo;
    //释放流变量
    FreeAndNil(MemoryStream);
  end;
  FreeAndNil(dlgOpenFile);
end;

procedure OpenItemFile(strFileName: string;BlobField: TBlobField);
var
  MemoryStream,MemoryStreamold: TMemoryStream;
  I: integer;
  Data: Pointer;
  h,l: integer;
  byte: longint;
  //Text: string[3];
  //Buffer: Pointer;
begin
  if strFileName <> '' then
  try
    //创建流变量
    MemoryStreamold := TMemoryStream.Create;
    MemoryStream := TMemoryStream.Create;
    //解开文件
    BlobField.SaveToStream(MemoryStreamold);
    MemoryStreamold.Position := 0;
    for I := 0 to MemoryStreamold.Size div 2 -1 do
    begin
      GetMem(Data,2);
      MemoryStreamold.Read(Data^,2);
      h := integer(hi(longint(Data^)));
      l := integer(lo(longint(Data^)));
      byte := h*16+l;
      MemoryStream.Write(byte,1);
      FreeMem(Data);
    end;
    {BlobField.SaveToStream(MemoryStreamold);
    MemoryStreamold.Position := 0;
    for I := 0 to MemoryStreamold.Size div 2 -1 do
    begin
      GetMem(Data,2);
      MemoryStreamold.Read(Data^,2);
      SetLength(Text,2);
      Text[1] := Char(Data^);
      Text[2] := Char(Pointer(longint(Data)+1)^);
      GetMem(Buffer,1);
      HexToBin(@Text[1],Buffer,1);
      MemoryStream.Write(Buffer^,1);
      FreeMem(Data);
    end;}    
    //保存到临时文件
    if not DirectoryExists(getTempDir + 'kinnsoft\') then
      CreateDir(getTempDir + 'kinnsoft\');
    if not DirectoryExists(getTempDir + 'kinnsoft\DOC\') then
      CreateDir(getTempDir + 'kinnsoft\DOC\');
    MemoryStream.SavetoFile(getTempDir + 'kinnsoft\DOC\'+strFileName);
    //释放变量
    FreeAndNil(MemoryStreamold);
    FreeAndNil(MemoryStream);
    //打开文件
    shellexecute(Application.Handle,nil,PChar(getTempDir + 'kinnsoft\DOC\' +strFileName),'',nil,SW_SHOW);
  except
    ShowMessage('无法打开文件!');
  end;
end;

procedure ClearTempFile;
var
  FileListBox: TFileListBox;
  I: integer;
  strFileName: string;
begin
  if DirectoryExists(getTempDir + 'kinnsoft\DOC\') then
  begin
    FileListBox := TFileListBox.Create(Application);
    FileListBox.Parent := frmMain;
    FileListBox.Mask := getTempDir + 'kinnsoft\DOC\*.*';
    for I := FileListBox.Count -1 downto 0 do
    begin
      strFileName := getTempDir + 'kinnsoft\DOC\'+FileListBox.Items[I]; 
      if FileExists(strFileName) then
        DeleteFile(strFileName);
    end;
    RemoveDir(getTempDir + 'kinnsoft\DOC\');
  end;  
end;
////////////////////
procedure TfrmDocBook.FormCreate(Sender: TObject);
var
  FileInfo: TSHFileInfo;
begin
  FSmallImages := SHGetFileInfo('C:\', { Do not localize }
    0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  FLargeImages := SHGetFileInfo('C:\', { Do not localize }
    0, FileInfo, SizeOf(FileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  //
  SetFormstyle(self);
  SetGroupbox(KGroupBox1);
  SetGroupbox(KGroupBox2);
end;

procedure TfrmDocBook.btnAddClick(Sender: TObject);
var
  strFileName: string;
  MemoryStream: TMemoryStream;
begin
{  if dlgOpenFile.Execute then
  begin
     strFileName := ExtractFileName(dlgOpenFile.FileName);
     MemoryStream := TMemoryStream.Create;
     MemoryStream.LoadFromFile(dlgOpenFile.FileName);
     lvAttachment.AddItem(strFileName,MemoryStream);
     //
     qryDocBook.Edit;
     qryDocBook.FieldByName('FileName').AsString := strFileName;
     TBlobField(qryDocBook.FieldByName('FileContent')).LoadFromFile(dlgOpenFile.FileName);
     qryDocBook.Post;
  end;}
end;

procedure TfrmDocBook.lvAttachmentGetImageIndex(Sender: TObject;
  Item: TListItem);
var
  FileInfo: TSHFileInfo;
  Flags: Integer;
begin
  //
  Flags := SHGFI_SYSICONINDEX;
  //if Open then Flags := Flags or SHGFI_OPENICON;
  if lvAttachment.ViewStyle = vsIcon then
    Flags := Flags or SHGFI_LARGEICON
  else
    Flags := Flags or SHGFI_SMALLICON;
  SHGetFileInfo(PChar(Item.Caption),
           0,
           FileInfo,
           SizeOf(FileInfo),
           Flags);
  Item.ImageIndex := FileInfo.iIcon;
end;

end.
