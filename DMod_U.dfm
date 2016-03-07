object Dmod: TDmod
  OldCreateOrder = False
  Left = 461
  Top = 467
  Height = 492
  Width = 215
  object ConnData: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DBData.mdb;Persist ' +
      'Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 32
  end
  object tblData: TADOTable
    Active = True
    Connection = ConnData
    CursorType = ctStatic
    TableName = 'tblData'
    Left = 88
    Top = 32
  end
end
