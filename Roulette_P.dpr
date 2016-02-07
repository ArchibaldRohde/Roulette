program Roulette_P;

uses
  Forms,
  Roulette_U in 'Roulette_U.pas' {frmMain},
  RouletteGame_U in 'RouletteGame_U.pas' {frmGame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGame, frmGame);
  Application.Run;
end.
