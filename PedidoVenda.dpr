program PedidoVenda;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDm in 'DAO\UDm.pas' {DataModule1: TDataModule},
  ViewPedidoVenda in 'View\ViewPedidoVenda.pas' {FrmPedidoVenda},
  ModelCliente in 'Model\ModelCliente.pas',
  controllerCliente in 'Controller\controllerCliente.pas',
  UFuncoesBanco in 'DAO\UFuncoesBanco.pas',
  modelProduto in 'Model\modelProduto.pas',
  controllerProduto in 'Controller\controllerProduto.pas',
  modelPedidoItem in 'Model\modelPedidoItem.pas',
  controllerPedidoVenda in 'Controller\controllerPedidoVenda.pas',
  modelPedidoVenda in 'Model\modelPedidoVenda.pas',
  controllerPedidoVendaItem in 'Controller\controllerPedidoVendaItem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmPedidoVenda, FrmPedidoVenda);
  Application.Run;
end.
