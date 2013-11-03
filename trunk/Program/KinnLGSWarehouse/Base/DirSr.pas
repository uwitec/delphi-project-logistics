unit DirSr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, KBitBtn;

type
  TfrmDirSr = class(TForm)
    DriveComboBox1: TDriveComboBox;
    edtDirectory: TDirectoryListBox;
    btnOpen: TKBitBtn;
    btnCancel: TKBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDirSr: TfrmDirSr;

function workDirSr: string;

implementation

{$R *.dfm}

uses
  libProc,Main;

function workDirSr: string;
begin
   frmDirSr:=TfrmDirSr.create(Application);
   with frmDirSr do
   begin
     if ShowModal = mrOk then
       Result := edtDirectory.Directory
     else
       Result := '';         
     Free;
   end;
end;

procedure TfrmDirSr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then ReturnNext(Self);
end;

procedure TfrmDirSr.FormCreate(Sender: TObject);
begin
  setFormStyle(self);
end;

end.
