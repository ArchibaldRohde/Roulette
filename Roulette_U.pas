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
    imgToets: TImage;
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

{$R *.dfm}

procedure TfrmMain.btnGoClick(Sender: TObject);
begin
// verander na toets string
  frmMain.Hide;
  frmGame.Show;
end;

end.
