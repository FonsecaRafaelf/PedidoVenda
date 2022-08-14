unit ModelCliente;


interface

type TModelCliente = class
  private
    FNomeCliente: string;
    FUF: string;
    FCodigo: Integer;
    FCidade: string;
    procedure SetCidade(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetNomeCliente(const Value: string);
    procedure SetUF(const Value: string);

  public
    property Codigo          : Integer read FCodigo          write SetCodigo;
    property NomeCliente : string  read FNomeCliente write SetNomeCliente;
    property Cidade      : string  read FCidade      write SetCidade;
    property UF          : string  read FUF          write SetUF;
    function Executar : Boolean;
end;
implementation

{ TModelCliente }

function TModelCliente.Executar: Boolean;
begin

end;

procedure TModelCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TModelCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TModelCliente.SetNomeCliente(const Value: string);
begin
  FNomeCliente := Value;
end;

procedure TModelCliente.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
