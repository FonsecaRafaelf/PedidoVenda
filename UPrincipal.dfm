object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 451
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 232
    Top = 184
    object Cadastro1: TMenuItem
      Caption = 'Venda'
      object Cliente1: TMenuItem
        Caption = 'Pedido de vendas'
        OnClick = Cliente1Click
      end
    end
  end
end
