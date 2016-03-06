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
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    tmrAll: TTimer;
    Timer3: TTimer;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSpinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Next(image : integer);// Next ontvang die integer van die foto wat verruil moet word en verander dan die foto na 'n random//
    procedure Move;
    procedure Start;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure reset;
    procedure tmrAllTimer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
  k : integer;
    { Private declarations }
  public
  pic1, pic2, pic3, pic4, pic5, num, speed : integer;
  arrName : array of string;
  arrImage : array of string;
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
k := 0;
reset;
start;


end;

procedure TfrmGame.FormCreate(Sender: TObject);
begin
  frmGame.DoubleBuffered := true;
  reset;
end;

procedure TfrmGame.FormResize(Sender: TObject);
begin
  reset;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////NEXT/////////
procedure TfrmGame.Next(image: integer);
begin
randomize;
  case image of
   1 :    begin
          //
          pic1 :=(random(num)+1);
          while (pic1 = pic2) OR (pic5 = pic1) OR (pic1 = pic3) OR (pic1 = pic4) do
           begin
           pic1 :=(random(num)+1);
           end;
           Image1.Picture.LoadFromFile(arrImage[pic1]);
          //
          end;
   2 :    begin
          //
          pic2 :=(random(num)+1);
          while (pic1 = pic2) OR (pic5 = pic2) OR (pic2 = pic3) OR (pic2 = pic4) do
           begin
           pic2 :=(random(num)+1);
           end;
           Image2.Picture.LoadFromFile(arrImage[pic2]);
          //
          end;
   3:     begin
          //
          pic3 :=(random(num)+1);
          while (pic3 = pic2) OR (pic5 = pic3) OR (pic1 = pic3) OR (pic3 = pic4) do
           begin
           pic3 :=(random(num)+1);
           end;
           Image3.Picture.LoadFromFile(arrImage[pic3]);
          //
          end;
   4:     begin
          //
          pic4 :=(random(num)+1);
          while (pic4 = pic2) OR (pic5 = pic4) OR (pic4 = pic3) OR (pic1 = pic4) do
           begin
           pic4 :=(random(num)+1);
           end;
           Image4.Picture.LoadFromFile(arrImage[pic4]);
          //
          end;
   5:     begin
          //
          pic5 :=(random(num)+1);
          while (pic5 = pic2) OR (pic5 = pic1) OR (pic5 = pic3) OR (pic5 = pic4) do
           begin
           pic5 :=(random(num)+1);
           end;
           Image5.Picture.LoadFromFile(arrImage[pic5]);
          //
          end;
 end;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////MOVE//////////////
procedure TfrmGame.Move;
begin
  Image1.Left := Image1.Left-speed;
  Image2.Left := Image2.Left-speed;
  Image3.Left := Image3.Left-speed;
  Image4.Left := Image4.Left-speed;
  Image5.Left := Image5.Left-speed;

  if (Image1.Left < (0-Shape1.Width)) then
  begin
    Image1.Left := Image5.Left+Image5.Width+20;
    Next(1);
  end;
  if (Image2.Left < (0-Shape1.Width)) then
  begin
    Image2.Left := Image1.Left+Image1.Width+20;
    Next(2);
  end;
  if (Image3.Left < (0-Shape1.Width)) then
  begin
   Image3.Left := Image2.Left+Image2.Width+20;
    Next(3);
  end;
  if (Image4.Left < (0-Shape1.Width)) then
  begin
    Image4.Left := Image3.Left+Image3.Width+20;
    Next(4);
  end;
  if (Image5.Left < (0-Shape1.Width)) then
  begin
    Image5.Left := Image4.Left+Image4.Width+20;
    Next(5);
  end;
  inc(k);
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////START
procedure TfrmGame.Start;
begin
//
randomize;
pic1 := random(num)+1;
Image1.Picture.LoadFromFile(arrImage[pic1]);
pic2 :=  random(num)+1;
  while pic1 = pic2 do
  begin
    pic2 :=  (random(num)+1);
  end;
Image2.Picture.LoadFromFile(arrImage[pic2]);
pic3 :=(random(num)+1);
  while (pic3 = pic2) OR (pic3 = pic1) do
  begin
    pic3 :=(random(num)+1);
  end;
Image3.Picture.LoadFromFile(arrImage[pic3]);
pic4 :=(random(num)+1);
  while (pic4 = pic2) OR (pic4 = pic1) OR (pic4 = pic3) do
  begin
    pic4 :=(random(num)+1);
  end;
Image4.Picture.LoadFromFile(arrImage[pic4]);
pic5 :=(random(num)+1);
  while (pic5 = pic2) OR (pic5 = pic1) OR (pic5 = pic3) OR (pic5 = pic4) do
  begin
    pic5 :=(random(num)+1);
  end;
Image5.Picture.LoadFromFile(arrImage[pic5]);

//
k := 1;
tmrAll.Enabled := true;
Timer1.Enabled := true;
end;



procedure TfrmGame.Timer1Timer(Sender: TObject);
begin
speed := 50;
move;

end;


procedure TfrmGame.Timer2Timer(Sender: TObject);
begin
  speed := 5;
  move;
if k>175 then
begin
  Timer2.Enabled := false;
  if (trunc(frmGame.Width/2)- Image1.Left)< 200 then
  begin
  Image1.Width := (Image1.Width*2);
  Image1.Height := (Image1.Height*2);
  Image1.Top := trunc(frmGame.Height/4);
  Image1.Left := trunc(((Shape2.Left + 89)/2)-(Image1.Width/2));
  Image1.BringToFront;
    Label2.Visible := true;
  Label2.Caption := arrName[pic1];
  end
  else
  begin
      if (trunc(frmGame.Width/2)- Image2.Left)< 200 then
  begin
  Image2.Width := (Image2.Width*2);
  Image2.Height := (Image2.Height*2);
  Image2.Top := trunc(frmGame.Height/4);
  Image2.Left := trunc(((Shape2.Left + 89)/2)-(Image2.Width/2));
  Image2.BringToFront;
      Label2.Visible := true;
  Label2.Caption := arrName[pic2];    //
  end
  else
  begin
    if (trunc(frmGame.Width/2)- Image3.Left)< 200 then
  begin
  Image3.Width := (Image3.Width*2);
  Image3.Height := (Image3.Height*2);
  Image3.Top := trunc(frmGame.Height/4);
  Image3.Left := trunc(((Shape2.Left + 89)/2)-(Image3.Width/2));
  Image3.BringToFront;
      Label2.Visible := true;
  Label2.Caption := arrName[pic3];
  end
  else
  begin
      if (trunc(frmGame.Width/2)- Image4.Left)< 200 then
  begin
  Image4.Width := (Image4.Width*2);
  Image4.Height := (Image4.Height*2);
  Image4.Top := trunc(frmGame.Height/4);
  Image4.Left := trunc(((Shape2.Left + 89)/2)-(Image4.Width/2));
  Image4.BringToFront;
      Label2.Visible := true;
  Label2.Caption := arrName[pic4];
  end
  else
  begin
       if (trunc(frmGame.Width/2)- Image5.Left)< 200 then
  begin
  Image5.Width := (Image5.Width*2);
  Image5.Height := (Image5.Height*2);
  Image5.Top := trunc(frmGame.Height/4);
  Image5.Left := trunc(((Shape2.Left + 89)/2)-(Image5.Width/2));
  Image5.BringToFront;
      Label2.Visible := true;
  Label2.Caption := arrName[pic5];
  end
  else
  begin
  ShowMessage('Winner could not be determined, please spin again');
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
  end;

  /////////////
  end;
  end;
  end;
  end;

end;
end;
/////////////////////////////////////////////////////////////////////////////RESET
procedure TfrmGame.reset;
begin

  imgBack.width := frmGame.Width;
  imgBack.Height := frmGame.Height;
  btnSpin.Left := trunc((frmGame.Width-89)/2);
  Label1.Left := trunc((frmGame.Width-308)/2);
  Label2.Left := trunc((frmGame.Width-Label2.Width)/2);
  Label2.Visible := false;
  //Swart blokke//
  Shape1.Width := trunc(((frmGame.Width-100)/5)/2);
  Shape1.Height := trunc(Shape1.Width * 3.5);
  Shape1.Left := 0;
  Shape1.Top := trunc(frmGame.Height/2.5);
  Shape1.BringToFront;

  Shape2.Width := trunc(((frmGame.Width-100)/5)/2);
  Shape2.Height := trunc(Shape2.Width * 3.5);
  Shape2.Left := frmGame.Width - Shape2.Width;
  Shape2.Top := trunc(frmGame.Height/2.5);
  Shape2.BringToFront;


  //Image1//
  Image1.Width := trunc((frmGame.Width-100)/5);
  Image1.Height := trunc(Image1.Width * 1.5);
  Image1.Left := 20;
  Image1.Top := (Shape1.Top + 5);
  //Image2//
    Image2.Width := trunc((frmGame.Width-100)/5);
  Image2.Height := trunc(Image2.Width * 1.5);
  Image2.Left := Image1.Width + 40;
  Image2.Top := (Shape1.Top + 5);
  //Image3//
    Image3.Width := trunc((frmGame.Width-100)/5);
  Image3.Height := trunc(Image3.Width * 1.5);
  Image3.Left := Image1.Width + Image2.Width +60;
  Image3.Top := (Shape1.Top + 5);
  //Image4//
    Image4.Width := trunc((frmGame.Width-100)/5);
  Image4.Height := trunc(Image4.Width * 1.5);
  Image4.Left := Image1.Width + Image2.Width + Image3.Width +80;
  Image4.Top := (Shape1.Top + 5);
  //Image5//
    Image5.Width := trunc((frmGame.Width-100)/5);
  Image5.Height := trunc(Image5.Width * 1.5);
  Image5.Left := Image1.Width + Image2.Width + Image3.Width + Image4.Width +100;
  Image5.Top := (Shape1.Top + 5);

end;

procedure TfrmGame.tmrAllTimer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Timer3.Enabled := true;
  tmrAll.Enabled := false;
end;

procedure TfrmGame.Timer3Timer(Sender: TObject);
begin
  speed := 15;
  move;
  if k > 100 then
  begin
    Timer3.Enabled := false;
    Timer2.Enabled := true;
  end;

end;

end.
