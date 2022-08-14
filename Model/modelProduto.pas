unit modelProduto;

interface

type TModelProduto = class
  private
    FValorVenda: Currency;
    FDescricao: string;
    FCodigo: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetValorVenda(const Value: Currency);

  public
    property Codigo         : Integer  read FCodigo         write SetCodigo;
    property Descricao  : string   read FDescricao  write SetDescricao;
    property PrecoVenda : Currency read FValorVenda write SetValorVenda;

end;

implementation

{ TModelProduto }

procedure TModelProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TModelProduto.SetValorVenda(const Value: Currency);
begin
  FValorVenda := Value;
end;
end.
