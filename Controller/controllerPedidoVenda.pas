﻿unit controllerPedidoVenda;

interface

uses
   FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, controllerCliente,modelPedidoVenda,modelCliente;

Type TControllerPedidoVenda = class(TModelPedidoVenda)
  private
    vConexao : TFDConnection;
  public
    Cliente : TModelPedidoVenda;
     procedure CadastrarPedido;
     procedure DeletarPedido;
     procedure ConsultaPedido;

    constructor Create(AConn : TFDConnection);
end;


implementation

uses
  UFuncoesBanco;




{ TControllerPedidoVenda }

procedure TControllerPedidoVenda.CadastrarPedido;
var QryExec : TFDQuery;
begin
  try
    QryExec := CriarQuery(vConexao);
    try
      QryExec.SQL.Add('INSERT INTO pedido_venda');
      QryExec.SQL.Add('(codigocliente, valortotal, datapedido)');
      QryExec.SQL.Add('VALUES');
      QryExec.SQL.Add('(:codigocliente, :valortotal, :datapedido)');

      QryExec.ParamByName('codigocliente').AsInteger  := CodigoCliente;
      QryExec.ParamByName('valortotal').AsCurrency    := ValorTotal;
      QryExec.ParamByName('datapedido').AsDateTime    := Now;

      QryExec.ExecSQL;

      ID := vConexao.ExecSQLScalar('SELECT LAST_INSERT_ID()');
    finally
      FreeAndNil(QryExec);
    end;

  except on e: exception do
    raise exception.Create('Erro ao Cadastrar PedidoVenda... ' + e.Message);
  end;
end;

procedure TControllerPedidoVenda.ConsultaPedido;
var LQryCons : TFDQuery;
begin

  if id = 0 then
    exit;

  try
    LQryCons := CriarQuery(vConexao);
    Try
      var LSql : string;
      LSql  := 'SELECT p.numeropedido,'+
                       'p.codigocliente,'+
                       'p.valortotal,'+
                       'p.datapedido '+
               ' FROM pedido_venda as p'+
                        ' Where p.numeropedido ='+inttostr(id);
      if ConsultaMySql(LQryCons,LSql) then
      begin
        id            := LQryCons.FieldByName('numeropedido').AsInteger;
        CodigoCliente := LQryCons.FieldByName('codigocliente').AsInteger;
        ValorTotal    := LQryCons.FieldByName('valortotal').AsCurrency;
      end;

    Finally
      FreeAndNil(LQryCons);
    End;

  except on e: exception do
    raise exception.Create('Erro ao Carregar Cliente... ' + e.Message);
  end;
end;

constructor TControllerPedidoVenda.Create(AConn: TFDConnection);
begin
  vConexao := AConn;
end;

procedure TControllerPedidoVenda.DeletarPedido;
var QryExec : TFDQuery;
begin
  if ID = 0 then
    exit;

  try
    QryExec := CriarQuery(vConexao);

    QryExec.SQL.Add('DELETE FROM pedido_venda WHERE numeropedido=:numeropedido');
    QryExec.ParamByName('numeropedido').AsInteger := ID;

    QryExec.ExecSQL;

    FreeAndNil(QryExec);
  except on e: exception do
    raise exception.Create('Erro ao Deletar PedidoVenda... ' + e.Message);
  end;
end;

end.
