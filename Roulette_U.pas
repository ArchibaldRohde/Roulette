unit Roulette_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, RouletteGame_U;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    edtNum: TEdit;
    Label2: TLabel;
    btnGo: TBitBtn;
    Button1: TButton;
    procedure btnGoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DMod_U, Admin_U;

{$R *.dfm}

procedure TfrmMain.btnGoClick(Sender: TObject);
var
j : integer;
begin
j := 1;
Dmod.tblData.First;
  frmGame.num := strtoint(edtNum.text);
  SetLength(frmGame.arrName, frmGame.num + 1);
  SetLength(frmGame.arrImage, frmGame.num + 1);
  while not Dmod.tblData.Eof do
  begin
    if j > frmGame.num then
    begin
        SetLength(frmGame.arrName, j+1);
        SetLength(frmGame.arrImage, j+1);
    end;

    frmGame.arrName[j] := Dmod.tblData['Student'];
    frmGame.arrImage[j] := Dmod.tblData['Image'];
    dmod.tbldata.next;
    inc(j);
  end;


  frmMain.Hide;
  frmGame.Show;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  frmMain.Hide;
  frmAdmin.show;
end;

end.
