unit DMod_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDmod = class(TDataModule)
    ConnData: TADOConnection;
    tblData: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dmod: TDmod;

implementation

{$R *.dfm}

end.
