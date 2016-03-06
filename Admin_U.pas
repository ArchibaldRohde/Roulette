unit Admin_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtDlgs, ExtCtrls;

type
  TfrmAdmin = class(TForm)
    btnHome: TBitBtn;
    imgStudent: TImage;
    edtName: TEdit;
    btnAdd: TButton;
    lblName: TLabel;
    lblImagepath: TLabel;
    lblTop: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    LoadFromFile: TButton;
    gAdd: TGroupBox;
    edtPath: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtRem: TEdit;
    btnremove: TButton;
    procedure btnHomeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadFromFileClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnremoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses Roulette_U, DMod_U;

{$R *.dfm}

procedure TfrmAdmin.btnHomeClick(Sender: TObject);
begin
  frmMain.show;
  frmAdmin.Close;
end;

procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Show;
end;

procedure TfrmAdmin.LoadFromFileClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  edtPath.text := OpenPictureDialog1.Filename;
  imgStudent.Picture.LoadFromFile(OpenPictureDialog1.Filename);

end;

procedure TfrmAdmin.btnAddClick(Sender: TObject);
var
error : integer;
begin
  Dmod.tblData.First;
  while NOT Dmod.tblData.EOF do
  begin
    if uppercase(Dmod.tblData['Student']) = Uppercase(edtName.Text) then
    break;
    Dmod.tblData.Next;
  end;
  if NOT Dmod.tblData.Eof then
  begin
  error := MessageDlg('Student exists. Would you like to replace the existing data',mtError,mbYesNoCancel,0);
  //
  case error of
  mrYes : begin Dmod.tblData.Edit;
                Dmod.tblData['Image'] := edtPath.Text;
                Dmod.tblData.Post;
          end;
  mrNo : showMessage('very well then');
  mrCancel : {showMessage('cancel')};
  end;
  exit;
  end;

  //
  Dmod.tblData.Last;
  Dmod.tblData.Insert;
  Dmod.tblData['Student'] := edtName.Text;
  Dmod.tblData['Image'] := edtPath.Text;
  Dmod.tblData.Post;
  MessageDlg('Student added to database',mtWarning,[mbOK],0);

  
end;

procedure TfrmAdmin.btnremoveClick(Sender: TObject);
var
error : integer;
begin
  Dmod.tblData.Locate('Student',edtRem.text,[]);
  error := messagedlg('are you sure you want to remove ' + edtRem.text + '?',mtWarning,mbYesNoCancel,0);
  if error = mrYes then
  begin
    Dmod.tblData.edit;
    Dmod.tblData.Locate('Student',edtRem.text,[]);
    Dmod.tblData.Delete;
    Dmod.tblData.Post;
  end;

end; 
end.
