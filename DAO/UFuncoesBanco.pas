unit UFuncoesBanco;


interface
uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Forms, System.SysUtils, System.StrUtils;


  function CriarQuery(AConn: TFDConnection): TFDQuery;
  function ConsultaMySql(var Qry: TFDQuery; CmdSQL: string): Boolean;

implementation

function CriarQuery(AConn: TFDConnection): TFDQuery;
var LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  LQry.Connection := AConn;
  Result := LQry;
end;

function ConsultaMySql(var Qry: TFDQuery; CmdSQL: string): Boolean;
begin
  Result := False;
  if (Trim(CmdSQL) = '') then
  begin
    Result := False;
    Exit;
  end;
  try
    Qry.ResourceOptions.SilentMode := True;
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(CmdSQL);
    Qry.Open;
    if not Qry.IsEmpty then
      Result := True
    else
      Result := False;
  except
    raise;
    Result := False;
    Exit;
  end;
end;


end.
