﻿unit ViewPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, dxmdaset,ModelCliente,controllerCliente,modelProduto,controllerProduto,
  Vcl.Menus;

type
  TFrmPedidoVenda = class(TForm)
    BtnSair: TButton;
    GbCliente: TGroupBox;
    Label1: TLabel;
    EdtCodigoCliente: TEdit;
    EdtNomeCliente: TEdit;
    Label2: TLabel;
    GbProdutos: TGroupBox;
    Label4: TLabel;
    EdtCodigoProduto: TEdit;
    Label5: TLabel;
    EdtDescricaoProduto: TEdit;
    Label6: TLabel;
    EdtQuantidade: TEdit;
    Label7: TLabel;
    EdtPrecoVenda: TEdit;
    Label8: TLabel;
    edtValorTotal: TEdit;
    BtnItem: TButton;
    DBGrid1: TDBGrid;
    DSPedido: TDataSource;
    MemDataPedido: TdxMemData;
    MemDataPedidocodigo: TIntegerField;
    MemDataPedidodescricao: TStringField;
    MemDataPedidoquantidade: TCurrencyField;
    MemDataPedidoprecovenda: TCurrencyField;
    MemDataPedidoprecototal: TCurrencyField;
    Label9: TLabel;
    lbltotal: TLabel;
    PopupMenu1: TPopupMenu;
    AlterarItem1: TMenuItem;
    N1: TMenuItem;
    ExcluirItem1: TMenuItem;
    BtnGravar: TButton;
    BtnLimpar: TButton;
    BtnConsultar: TButton;
    BtnCancelar: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtPrecoVendaExit(Sender: TObject);
    procedure edtValorTotalExit(Sender: TObject);
    procedure BtnItemClick(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure AlterarItem1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtCodigoClienteExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }

    procedure InicializaComponente;
    procedure LimparItem;
    procedure ConsultarCliente;
    procedure ConsultarProduto;
    procedure CalcularValorTotal;
    procedure InserirItem;
    procedure ValorTotalItens;
    procedure AlterarItem;
    procedure CarregaDadosAlterarItem;
    procedure ValidarDadosObrigatorioItem;
    procedure GravaPedidoVenda;
    function eNumerico(AValor: string): Boolean;

  public
    { Public declarations }
  end;

var
  FrmPedidoVenda: TFrmPedidoVenda;

implementation

uses
   UDm, controllerPedidoVenda, controllerPedidoVendaItem;
{$R *.dfm}

procedure TFrmPedidoVenda.AlterarItem;
begin
  MemDataPedido.Edit;
  MemDataPedido.FieldByName('codigo').AsInteger       := strtoint(Trim(EdtCodigoProduto.Text));
  MemDataPedido.FieldByName('descricao').AsString     := Trim(EdtDescricaoProduto.Text);
  MemDataPedido.FieldByName('quantidade').AsCurrency  := StrToCurr(EdtQuantidade.Text);
  MemDataPedido.FieldByName('precovenda').AsCurrency  := StrToCurr(EdtPrecoVenda.Text);
  MemDataPedido.FieldByName('precototal').AsCurrency  := StrToCurr(edtValorTotal.Text);
  MemDataPedido.Post;
end;

procedure TFrmPedidoVenda.AlterarItem1Click(Sender: TObject);
begin
  CarregaDadosAlterarItem();
end;

procedure TFrmPedidoVenda.BtnCancelarClick(Sender: TObject);
var NrPedido : string;
FControllerPedidoVenda      : TcontrollerPedidoVenda;
begin
  if InputQuery('', 'Digite o Numero do Pedido a Cancelar: ', NrPedido) then
  begin
    if eNumerico(NrPedido) then
    begin
      FControllerPedidoVenda      := TcontrollerPedidoVenda.Create(DataModule1.conmysql);
      try
        FControllerPedidoVenda.ID := StrToInt(NrPedido);
        FControllerPedidoVenda.DeletarPedido;
        ShowMessage('Pedido cancelado com sucesso.');
        InicializaComponente();
      finally
        freeandnil(FControllerPedidoVenda);
      end;
    end
    else
      ShowMessage('Valor Digitado não é Válido!');
  end;
end;

procedure TFrmPedidoVenda.BtnConsultarClick(Sender: TObject);
var NrPedido : string;
FControllerPedidoVenda      : TcontrollerPedidoVenda;
FControlerPedidoVendaItem   : TcontrollerPedidoVendaItem;
begin
  if InputQuery('', 'Digite o Numero do Pedido a consulta: ', NrPedido) then
  begin
    if eNumerico(NrPedido) then
    begin
      FControllerPedidoVenda      := TcontrollerPedidoVenda.Create(DataModule1.conmysql);
      FControlerPedidoVendaItem   := TcontrollerPedidoVendaItem.Create(DataModule1.conmysql);
      try
        FControllerPedidoVenda.ID := StrToInt(NrPedido);
        FControllerPedidoVenda.ConsultaPedido;

        MemDataPedido.LoadFromDataSet(FControlerPedidoVendaItem.RetornarConsulta(NrPedido));


        EdtCodigoCliente.Text := IntToStr(FControllerPedidoVenda.CodigoCliente);
        lbltotal.Caption      := FormatFloat('0.00',FControllerPedidoVenda.ValorTotal);


        EdtCodigoProduto.SetFocus;
      finally
        freeandnil(FControllerPedidoVenda);
        FreeAndNil(FControlerPedidoVendaItem);
      end;
    end
    else
      ShowMessage('Valor Digitado não é Válido!');
  end;
end;

procedure TFrmPedidoVenda.BtnGravarClick(Sender: TObject);
begin
  GravaPedidoVenda();
  ShowMessage('Pedido gravado com sucesso.');
  InicializaComponente();
end;

procedure TFrmPedidoVenda.BtnItemClick(Sender: TObject);
begin
  ValidarDadosObrigatorioItem();

  if BtnItem.Caption = 'Inserir' then
    InserirItem()
  else
    AlterarItem();

  ValorTotalItens();
  LimparItem();
end;

procedure TFrmPedidoVenda.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedidoVenda.BtnLimparClick(Sender: TObject);
begin
  InicializaComponente();
end;

procedure TFrmPedidoVenda.CalcularValorTotal;
begin
  edtValorTotal.Text := FormatFloat('0.00',StrToCurrDef(edtQuantidade.Text,1) * StrToCurrDef(EdtPrecoVenda.Text,0));
end;

procedure TFrmPedidoVenda.CarregaDadosAlterarItem;
begin
  if not MemDataPedido.isEmpty then
  begin
    if Application.MessageBox('Deseja alterar o item ?','Atenção!', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      EdtCodigoProduto.Text     := MemDataPedido.FieldByName('codigo').AsString;
      EdtDescricaoProduto.Text  := MemDataPedido.FieldByName('descricao').AsString;
      edtquantidade.Text        := MemDataPedido.FieldByName('quantidade').AsString;
      EdtPrecoVenda.Text        := MemDataPedido.FieldByName('precovenda').AsString;
      edtValorTotal.Text        := MemDataPedido.FieldByName('precototal').AsString;
      EdtQuantidade.Setfocus;
      BtnItem.Caption           := 'Alterar';
      EdtCodigoProduto.Enabled  := False;
    end;
  end
  else
    ShowMessage('Não existe item para alteração.');
end;

procedure TFrmPedidoVenda.ConsultarCliente;
var FControllerCliente : TcontrollerCliente;
begin
  if Trim(EdtCodigoCliente.Text) = '' then
  begin
    ShowMessage('Informe o código do cliente.');
    EdtCodigoCliente.SetFocus;
    EdtCodigoCliente.SelectAll;
    Exit();
  end;

  FControllerCliente  := TControllerCliente.Create(DataModule1.conmysql);
  try
    FControllerCliente.NomeCliente  := '';
    FControllerCliente.cidade       := '';
    FControllerCliente.Codigo       := StrToInt(Trim(EdtCodigoCliente.Text));
    FControllerCliente.ConsultaCliente();

    if Trim(FControllerCliente.NomeCliente) <> '' then
    begin
      edtnomecliente.text   := FControllerCliente.NomeCliente;
      EdtCodigoProduto.SetFocus;
      Exit();
    end;
    ShowMessage('Cliente não cadastrado.');
    EdtCodigoCliente.setfocus;
    EdtCodigoCliente.SelectAll;
  finally
    freeandnil(FControllerCliente);
  end;
end;

procedure TFrmPedidoVenda.ConsultarProduto;
var FControllerProduto : TControllerProduto;
begin
  if Trim(EdtCodigoProduto.Text) = '' then
  begin
    ShowMessage('Informe o código do prodoto.');
    EdtCodigoProduto.SetFocus;
    EdtCodigoProduto.SelectAll;
    Exit();
  end;

  FControllerProduto  := TcontrollerProduto.Create(DataModule1.conmysql);
  try
    FControllerProduto.Descricao  := '';
    FControllerProduto.PrecoVenda := 0;
    FControllerProduto.Codigo     := StrToInt(Trim(EdtCodigoProduto.Text));
    FControllerProduto.ConsultaProduto();

    if Trim(FControllerProduto.Descricao) <> '' then
    begin
      EdtDescricaoProduto.text  := FControllerProduto.Descricao;
      EdtPrecoVenda.text        := FormatFloat('0.00',FControllerProduto.PrecoVenda);
      EdtQuantidade.SetFocus;
      Exit();
    end;
    ShowMessage('produto não cadastrado.');
    EdtCodigoProduto.setfocus;
    EdtCodigoProduto.SelectAll;
  finally
    freeandnil(FControllerProduto);
  end;
end;

procedure TFrmPedidoVenda.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    CarregaDadosAlterarItem();
end;

procedure TFrmPedidoVenda.EdtCodigoClienteExit(Sender: TObject);
begin
  if Trim(EdtCodigoCliente.Text) <> '' then
  begin
    btnCancelar.Visible   := false;
    BtnConsultar.Visible  := false;
  end;
end;

procedure TFrmPedidoVenda.EdtCodigoClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13,#03,#22]) then
    key := #0;

  if Key=#13 then
    ConsultarCliente();
end;

procedure TFrmPedidoVenda.EdtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13,#03,#22]) then key := #0;

  if key =#13 then
    ConsultarProduto();
end;

procedure TFrmPedidoVenda.edtValorTotalExit(Sender: TObject);
begin
  if Trim(edtValorTotal.text) = '' then
    edtValorTotal.Text := '1';
  edtValorTotal.text := formatfloat('###0.00',strtofloat(edtValorTotal.text));
end;

procedure TFrmPedidoVenda.edtValorTotalKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#13,#03,#22]) then key := #0;
end;

function TFrmPedidoVenda.eNumerico(AValor: string): Boolean;
var Valor: Integer;
begin
  try
    Valor  := StrToInt(AValor);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFrmPedidoVenda.ExcluirItem1Click(Sender: TObject);
begin
  if not MemDataPedido.isEmpty then
  begin
    if Application.MessageBox('Confirma a Exclusão do item ?','Atenção!', MB_YESNO + MB_ICONQUESTION) = IDYES then
      MemDataPedido.Delete;
    ValorTotalItens();
    LimparItem();
  end
  else
    ShowMessage('Não existe item para exclusão.');
end;

procedure TFrmPedidoVenda.EdtPrecoVendaExit(Sender: TObject);
begin
  if Trim(EdtPrecoVenda.text) = '' then
    EdtPrecoVenda.Text := '1';
  EdtPrecoVenda.text := formatfloat('###0.00',strtofloat(EdtPrecoVenda.text));

  CalcularValorTotal();
end;

procedure TFrmPedidoVenda.EdtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#13,#03,#22]) then key := #0;
end;

procedure TFrmPedidoVenda.EdtQuantidadeExit(Sender: TObject);
begin
  if Trim(EdtQuantidade.text) = '' then
    EdtQuantidade.Text := '1';

  EdtQuantidade.text := formatfloat('###0.00',strtofloat(EdtQuantidade.text));
  CalcularValorTotal();
end;

procedure TFrmPedidoVenda.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8,#13,#03,#22]) then key := #0;
end;

procedure TFrmPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TFrmPedidoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then SelectNext(ActiveControl, true, true);
end;

procedure TFrmPedidoVenda.FormShow(Sender: TObject);
begin
  InicializaComponente();
end;

procedure TFrmPedidoVenda.GravaPedidoVenda;
var FControllerPedidoVenda      : TcontrollerPedidoVenda;
    FControllerPedidoVendaItem  : TControllerPedidoVendaItem;
begin
  FControllerPedidoVenda      := TcontrollerPedidoVenda.Create(DataModule1.conmysql);
  FControllerPedidoVendaItem  := TControllerPedidoVendaItem.Create(DataModule1.conmysql);
  try
    FControllerPedidoVenda.CodigoCliente  := strtoint(Trim(EdtCodigoCliente.Text));
    FControllerPedidoVenda.ValorTotal     := StrToFloatDef(lbltotal.Caption,0);
    FControllerPedidoVenda.CadastrarPedido();

    MemDataPedido.First();
    while(not MemDataPedido.Eof) do
    begin
      FControllerPedidoVendaItem.NrPedido       := FControllerPedidoVenda.ID;
      FControllerPedidoVendaItem.codigoproduto  := MemDataPedido.FieldByName('codigo').AsInteger;
      FControllerPedidoVendaItem.Quantidade     := MemDataPedido.FieldByName('quantidade').AsCurrency;
      FControllerPedidoVendaItem.ValorUnitario  := MemDataPedido.FieldByName('precovenda').AsCurrency;
      FControllerPedidoVendaItem.ValorTotal     := MemDataPedido.FieldByName('precototal').AsCurrency;
      FControllerPedidoVendaItem.InserirItemPedido();
      MemDataPedido.Next();
    end;

  finally
    FreeAndNil(FControllerPedidoVenda);
    freeandnil(FControllerPedidoVendaItem);
  end;
end;

procedure TFrmPedidoVenda.InicializaComponente;
begin
  MemDataPedido.Close;
  MemDataPedido.Active  := true;
  lbltotal.Caption      := '0,00';
  btnCancelar.Visible   := True;
  BtnConsultar.Visible  := True;
  EdtCodigoCliente.Clear;
  EdtNomeCliente.Clear;
  LimparItem();
  EdtCodigoCliente.SetFocus;
end;

procedure TFrmPedidoVenda.InserirItem;
begin
  MemDataPedido.Insert;
  MemDataPedido.FieldByName('codigo').AsInteger       := strtoint(Trim(EdtCodigoProduto.Text));
  MemDataPedido.FieldByName('descricao').AsString     := Trim(EdtDescricaoProduto.Text);
  MemDataPedido.FieldByName('quantidade').AsCurrency  := StrToCurr(EdtQuantidade.Text);
  MemDataPedido.FieldByName('precovenda').AsCurrency  := StrToCurr(EdtPrecoVenda.Text);
  MemDataPedido.FieldByName('precototal').AsCurrency  := StrToCurr(edtValorTotal.Text);
  MemDataPedido.Post;
end;

procedure TFrmPedidoVenda.LimparItem;
begin
  EdtCodigoProduto.Enabled  := True;;
  EdtCodigoProduto.clear;
  EdtDescricaoProduto.Clear;
  EdtQuantidade.Text  := '1,00';
  EdtPrecoVenda.Text  := '0,00';
  edtValorTotal.Text  := '0,00';
  BtnItem.Caption     := 'Inserir';
  EdtCodigoProduto.SetFocus;
end;

procedure TFrmPedidoVenda.ValidarDadosObrigatorioItem;
begin
  if Trim(EdtCodigoProduto.Text) = '' then
  begin
    ShowMessage('Obrigatório informar o código do produto.');
    EdtCodigoProduto.SetFocus;
    Abort();
  end;
  if StrToCurr(EdtQuantidade.Text) = 0 then
  begin
    ShowMessage('Quantidade não pode ser zerada.');
    EdtQuantidade.SetFocus;
    abort();
  end;
  if StrToCurr(EdtPrecoVenda.Text) = 0 then
  begin
    ShowMessage('Preço venda não pode ser zerado.');
    EdtPrecoVenda.SetFocus;
    abort();
  end;
end;

procedure TFrmPedidoVenda.ValorTotalItens;
begin
  MemDataPedido.First;
  lbltotal.Caption  := '0,00';
  while(not MemDataPedido.Eof) do
  begin
    lbltotal.Caption  := FormatFloat('0.00',StrToFloatDef(lbltotal.Caption,0)+MemDataPedido.FieldByName('precototal').AsCurrency);
    MemDataPedido.Next();
  end;
end;

end.
