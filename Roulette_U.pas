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
    procedure btnGoClick(Sender: TObject);
  private
 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DMod_U;

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
    frmGame.arrName[j] := Dmod.tblData['Student'];
    frmGame.arrImage[j] := Dmod.tblData['Image'];
    dmod.tbldata.next;
    inc(j);
  end;


  frmMain.Hide;
  frmGame.Show;
end;

end.
