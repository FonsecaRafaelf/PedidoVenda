unit modelPedidoItem;

interface

type TModelPedidoVendaItem = class
  private
    FNrPedido: Integer;
    Fcodigoproduto: Integer;
    FValorUnitario: Currency;
    FID: Integer;
    FValorTotal: Currency;
    FQuantidade: Currency;
    procedure Setcodigoproduto(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetNrPedido(const Value: Integer);
    procedure SetQuantidade(const Value: Currency);
    procedure SetValorTotal(const Value: Currency);
    procedure SetValorUnitario(const Value: Currency);

  public
    property ID            : Integer   read FID            write SetID;
    property NrPedido      : Integer   read FNrPedido      write SetNrPedido;
    property codigoproduto : Integer   read Fcodigoproduto     write Setcodigoproduto;
    property Quantidade    : Currency  read FQuantidade    write SetQuantidade;
    property ValorUnitario : Currency  read FValorUnitario write SetValorUnitario;
    property ValorTotal    : Currency  read FValorTotal    write SetValorTotal;

end;

implementation


{ TModelPedidoVendaItem }

procedure TModelPedidoVendaItem.Setcodigoproduto(const Value: Integer);
begin
  Fcodigoproduto := Value;
end;

procedure TModelPedidoVendaItem.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TModelPedidoVendaItem.SetNrPedido(const Value: Integer);
begin
  FNrPedido := Value;
end;

procedure TModelPedidoVendaItem.SetQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

procedure TModelPedidoVendaItem.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TModelPedidoVendaItem.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
end;

end.
