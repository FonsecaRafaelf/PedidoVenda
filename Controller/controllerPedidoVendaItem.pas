﻿unit controllerPedidoVendaItem;

interface

uses
  modelPedidoItem, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client, System.SysUtils;

Type TControllerPedidoVendaItem = class(TModelPedidoVendaItem)
  private
    vConexao : TFDConnection;

  public
    procedure InserirItemPedido;



    constructor Create(AConn : TFDConnection);
end;

implementation

uses
  UFuncoesBanco;

{ TControllerPedidoVendaItem }


constructor TControllerPedidoVendaItem.Create(AConn: TFDConnection);
begin
  vConexao := AConn;
end;


procedure TControllerPedidoVendaItem.InserirItemPedido;
var QryExec : TFDQuery;
begin
  try
    QryExec := CriarQuery(vConexao);

    QryExec.SQL.Add('INSERT INTO pedido_venda_itens');
    QryExec.SQL.Add('(nrpedido,codigoproduto,quantidade,valorunitario,valortotal)');
    QryExec.SQL.Add('VALUES');
    QryExec.SQL.Add('(:nrpedido,:codigoproduto,:quantidade,:valorunitario,:valortotal)');
    QryExec.ParamByName('nrpedido').AsCurrency      := NrPedido;
    QryExec.ParamByName('codigoproduto').AsInteger  := codigoproduto;
    QryExec.ParamByName('quantidade').AsCurrency    := Quantidade;
    QryExec.ParamByName('valorunitario').AsCurrency := ValorUnitario;
    QryExec.ParamByName('valortotal').AsCurrency    := ValorTotal;
    QryExec.ExecSQL;

    FreeAndNil(QryExec);
  except on e: exception do
    raise exception.Create('Erro ao Cadastrar PedidoVendaItens... ' + e.Message);
  end;
end;

end.
