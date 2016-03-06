program Roulette_P;

uses
  Forms,
  Roulette_U in 'Roulette_U.pas' {frmMain},
  RouletteGame_U in 'RouletteGame_U.pas' {frmGame},
  DMod_U in 'DMod_U.pas' {Dmod: TDataModule},
  Admin_U in 'Admin_U.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TDmod, Dmod);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
