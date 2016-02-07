unit RouletteGame_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TfrmGame = class(TForm)
    imgBack: TImage;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    btnSpin: TBitBtn;
    Image1: TImage;
    Image5: TImage;
    tmrAll: TTimer;
    tmrFast: TTimer;
    tmrMed: TTimer;
    tmrSlow: TTimer;
    lblWinner: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSpinClick(Sender: TObject);
    procedure Next;
    procedure Fotos;
    procedure tmrAllTimer(Sender: TObject);
    procedure tmrFastTimer(Sender: TObject);
    procedure tmrMedTimer(Sender: TObject);
    procedure tmrSlowTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
     temp : integer;
    { Private declarations }
  public
  pic1, pic2, pic3, pic4, pic5 : integer;
    { Public declarations }
  end;

var
  frmGame: TfrmGame;

implementation

uses Roulette_U;

{$R *.dfm}

procedure TfrmGame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Show;
end;

procedure TfrmGame.btnSpinClick(Sender: TObject);
begin
lblWinner.Visible := false;
temp := 1;
randomize;
pic3 := (random(strtoint(frmMain.edtNum.Text))+1);
  Next;

tmrAll.Enabled := true;
tmrFast.enabled := true;
end;

procedure TfrmGame.Next;

begin
if pic3 > strtoint(frmMain.edtNum.Text) then
begin
  pic3 := 1;
end;

//

  if (pic3 < (strtoint(frmMain.edtNum.Text)-2)) AND (pic3 > 2) then
  begin
    pic1 := pic3-2;
    pic2 := pic3-1;
    pic4 := pic3+1;
    pic5 := pic3+2;
  end
  else
  begin
      //if van jas
      if pic3 = strtoint(frmMain.edtNum.Text) then
      begin
         pic1 := strtoint(frmMain.edtNum.Text)-2;
         pic2 := strtoint(frmMain.edtNum.Text)-1;
         pic4 := 1;
         pic5 := 2;
      end;
      if pic3 = strtoint(frmMain.edtNum.Text)-1 then
      begin
        pic1 := strtoint(frmMain.edtNum.Text)-3;
        pic2 := strtoint(frmMain.edtNum.Text)-2;
        pic4 := strtoint(frmMain.edtNum.Text);
        pic5 := 1;
      end;
      if pic3 = 1 then
      begin
        pic1 := strtoint(frmMain.edtNum.Text)-1;
        pic2 := strtoint(frmMain.edtNum.Text);
        pic4 := 2;
        pic5 := 3;
      end;
      if pic3 = 2 then
      begin
        pic1 := strtoint(frmMain.edtNum.Text);
        pic2 := 1;
        pic4 := 3;
        pic5 := 4;
      end;

  end;
  Image1.Picture.LoadFromFile(inttostr(pic1) + '.jpg');
  Image2.Picture.LoadFromFile(inttostr(pic2) + '.jpg');
  Image3.Picture.LoadFromFile(inttostr(pic3) + '.jpg');
  Image4.Picture.LoadFromFile(inttostr(pic4) + '.jpg');
  Image5.Picture.LoadFromFile(inttostr(pic5) + '.jpg');
  //
end;

procedure TfrmGame.Fotos;
begin
//
end;

procedure TfrmGame.tmrAllTimer(Sender: TObject);
begin
  inc(temp);
  case temp of
   2 :begin tmrMed.enabled := true;
        tmrFast.enabled := false ;end;
   3 :begin tmrMed.enabled := false;
        tmrSlow.enabled := true;end;
   4 :tmrSlow.enabled := true;

   5 :begin tmrSlow.enabled := false;
      lblWinner.visible := true;end ;

  end;


end;

procedure TfrmGame.tmrFastTimer(Sender: TObject);
begin
 inc(pic3);
 Next;
end;

procedure TfrmGame.tmrMedTimer(Sender: TObject);
begin
inc(pic3);
 Next;
end;

procedure TfrmGame.tmrSlowTimer(Sender: TObject);
begin
 inc(pic3);
 Next;
end;

procedure TfrmGame.FormCreate(Sender: TObject);
begin
  imgBack.width := frmGame.Width;
  imgBack.Height := frmGame.Height;

  btnSpin.Left := trunc((frmGame.Width-89)/2);
  Label1.Left := trunc((frmGame.Width-308)/2);
  lblWinner.Left := trunc((frmGame.width-158)/2);
  Image3.Left := trunc((frmGame.Width-313)/2);
  Image2.Left := Image3.Left-200;
  Image1.Left := Image2.Left-100;
  Image4.Left := Image3.Left+200+156;
  Image5.Left := Image4.Left+50+76;
end;

procedure TfrmGame.FormResize(Sender: TObject);
begin
  imgBack.width := frmGame.Width;
  imgBack.Height := frmGame.Height;
  btnSpin.Left := trunc((frmGame.Width-89)/2);
  Label1.Left := trunc((frmGame.Width-308)/2);
  lblWinner.Left := trunc((frmGame.width-158)/2);
  Image3.Width := trunc((frmGame.Width)/6);
  Image3.Height := trunc((frmGame.Height)/2);
  Image3.Left := trunc((frmGame.Width-Image3.Width)/2);
  //////////////////////////////////////////
  Image2.Width := trunc(frmGame.Width/10);
  Image2.Left := Image3.Left-Image2.Width-20;
  Image2.Height := trunc(Image3.Height/2);
  ///////////////////////////////////////////////
  Image1.Width := trunc(frmGame.Width/20);
  Image1.Left := Image2.Left-Image1.Width-20;
  Image1.Height := trunc(Image2.Height/2);
  //////////////////////////////////////////////////
  Image4.Left := Image3.Left+Image3.Width + 20;
  Image4.Height := trunc(Image3.Height/2);
  Image4.Width := trunc(frmGame.Width/10);
  ////////////////////////////////////////////////
  Image5.Left := trunc(Image4.Left+Image4.width +20);
  Image5.Height := trunc(Image4.Height/2);
end;

end.
