unit UDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    Cmd: TFDCommand;
    ConMySql: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conexao;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.Conexao;
begin
  ConMysql.Connected        := False;
  ConMysql.LoginPrompt      := False;
  ConMysql.ConnectionString := 'DriverID=MySQL;'+
                               'Server=localhost;'+
                               'Port=3390;'+
                               'Database=bancopedido;'+
                               'User_name=quantum;'+
                               'Password=quantum28042004';

  ConMysql.Connected        := True;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Conexao();
end;

end.
