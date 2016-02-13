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
    Timer3: TTimer;
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
  private
  k : integer;
    { Private declarations }
  public
  pic1, pic2, pic3, pic4, pic5, num : integer;
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
reset;
start;


end;

procedure TfrmGame.FormCreate(Sender: TObject);
begin
  frmGame.DoubleBuffered := true;
{  imgBack.width := frmGame.Width;
  imgBack.Height := frmGame.Height;

  btnSpin.Left := trunc((frmGame.Width-89)/2);
  Label1.Left := trunc((frmGame.Width-308)/2); }
  reset;
end;

procedure TfrmGame.FormResize(Sender: TObject);
begin
 { imgBack.width := frmGame.Width;
  imgBack.Height := frmGame.Height;
  btnSpin.Left := trunc((frmGame.Width-89)/2);
  Label1.Left := trunc((frmGame.Width-308)/2);}
  reset;
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////NEXT/////////
procedure TfrmGame.Next(image: integer);
// Next ontvang die integer van die foto wat verruil moet word en verander dan die foto na 'n random//
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
           Image1.Picture.LoadFromFile(inttostr(pic1)+'.jpg');
          //
          end;
   2 :    begin
          //
          pic2 :=(random(num)+1);
          while (pic1 = pic2) OR (pic5 = pic2) OR (pic2 = pic3) OR (pic2 = pic4) do
           begin
           pic2 :=(random(num)+1);
           end;
           Image2.Picture.LoadFromFile(inttostr(pic2)+'.jpg');
          //
          end;
   3:     begin
          //
          pic3 :=(random(num)+1);
          while (pic3 = pic2) OR (pic5 = pic3) OR (pic1 = pic3) OR (pic3 = pic4) do
           begin
           pic3 :=(random(num)+1);
           end;
           Image3.Picture.LoadFromFile(inttostr(pic3)+'.jpg');
          //
          end;
   4:     begin
          //
          pic4 :=(random(num)+1);
          while (pic4 = pic2) OR (pic5 = pic4) OR (pic4 = pic3) OR (pic1 = pic4) do
           begin
           pic4 :=(random(num)+1);
           end;
           Image4.Picture.LoadFromFile(inttostr(pic4)+'.jpg');
          //
          end;
   5:     begin
          //
          pic5 :=(random(num)+1);
          while (pic5 = pic2) OR (pic5 = pic1) OR (pic5 = pic3) OR (pic5 = pic4) do
           begin
           pic5 :=(random(num)+1);
           end;
           Image5.Picture.LoadFromFile(inttostr(pic5)+'.jpg');
          //
          end;
 end;
end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////MOVE//////////////
procedure TfrmGame.Move;
begin
  Image1.Left := Image1.Left-5;
  Image2.Left := Image2.Left-5;
  Image3.Left := Image3.Left-5;
  Image4.Left := Image4.Left-5;
  Image5.Left := Image5.Left-5;

  if (Image1.Left < (0-Shape1.Width)) then
  begin
    {Image1.Left := frmGame.Width-trunc(Image1.Width/2);}
    Image1.Left := Image5.Left+Image5.Width+20;
    Next(1);
  end;
  if (Image2.Left < (0-Shape1.Width)) then
  begin
    {Image2.Left := frmGame.Width-trunc(Image1.Width/2);}
    Image2.Left := Image1.Left+Image1.Width+20;
    Next(2);
  end;
  if (Image3.Left < (0-Shape1.Width)) then
  begin
   { Image3.Left := frmGame.Width-trunc(Image1.Width/2);}
   Image3.Left := Image2.Left+Image2.Width+20;
    Next(3);
  end;
  if (Image4.Left < (0-Shape1.Width)) then
  begin
    {Image4.Left := frmGame.Width-trunc(Image1.Width/2);}
    Image4.Left := Image3.Left+Image3.Width+20;
    Next(4);
  end;
  if (Image5.Left < (0-Shape1.Width)) then
  begin
    {Image5.Left := frmGame.Width-trunc(Image1.Width/2);}
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
Image1.Picture.LoadFromFile(inttostr(pic1)+'.jpg');
pic2 :=  random(num)+1;
  while pic1 = pic2 do
  begin
    pic2 :=  (random(num)+1);
  end;
Image2.Picture.LoadFromFile(inttostr(pic2)+'.jpg');
pic3 :=(random(num)+1);
  while (pic3 = pic2) OR (pic3 = pic1) do
  begin
    pic3 :=(random(num)+1);
  end;
Image3.Picture.LoadFromFile(inttostr(pic3)+'.jpg');
pic4 :=(random(num)+1);
  while (pic4 = pic2) OR (pic4 = pic1) OR (pic4 = pic3) do
  begin
    pic4 :=(random(num)+1);
  end;
Image4.Picture.LoadFromFile(inttostr(pic4)+'.jpg');
pic5 :=(random(num)+1);
  while (pic5 = pic2) OR (pic5 = pic1) OR (pic5 = pic3) OR (pic5 = pic4) do
  begin
    pic5 :=(random(num)+1);
  end;
Image5.Picture.LoadFromFile(inttostr(pic5)+'.jpg');

//
k := 1;
Timer1.Enabled := true;
end;



procedure TfrmGame.Timer1Timer(Sender: TObject);
begin
move;
if k> 500 then
begin
  Timer1.Enabled := false;
  Timer2.Enabled := true;
  k := 0;
end;


end;


procedure TfrmGame.Timer2Timer(Sender: TObject);
begin
  move;
if k>200 then
begin
  Timer2.Enabled := false;
  if (trunc(frmGame.Width/2)- Image1.Left)< 200 then
  begin
  Image1.Width := (Image1.Width*2);
  Image1.Height := (Image1.Height*2);
  Image1.Top := trunc(frmGame.Height/4);
  Image1.Left := trunc(((Shape2.Left + 89)/2)-(Image1.Width/2));
  Image1.BringToFront;
  end
  else
  begin
      if (trunc(frmGame.Width/2)- Image2.Left)< 200 then
  begin
  Image2.Width := (Image2.Width*2);
  Image2.Height := (Image2.Height*2);
  Image2.Top := trunc(frmGame.Height/4);
  Image2.Left := trunc(((Shape2.Left + 89)/2)-(Image2.Width/2));
  Image2.BringToFront;    //
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

end.
