object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 371
  Width = 495
  object Cmd: TFDCommand
    Connection = ConMySql
    Left = 68
    Top = 6
  end
  object ConMySql: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    Left = 40
    Top = 70
  end
end
