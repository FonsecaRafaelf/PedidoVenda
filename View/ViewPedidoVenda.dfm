object FrmPedidoVenda: TFrmPedidoVenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pedido de venda'
  ClientHeight = 517
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object BtnSair: TButton
    Left = 654
    Top = 472
    Width = 81
    Height = 37
    Caption = 'Sair'
    TabOrder = 1
    OnClick = BtnSairClick
  end
  object GbCliente: TGroupBox
    Left = 8
    Top = 72
    Width = 727
    Height = 79
    Caption = 'Cliente'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 78
      Height = 14
      Caption = 'C'#243'digo Cliente'
    end
    object Label2: TLabel
      Left = 108
      Top = 24
      Width = 32
      Height = 14
      Caption = 'Nome'
    end
    object EdtCodigoCliente: TEdit
      Left = 16
      Top = 42
      Width = 89
      Height = 22
      TabOrder = 0
      OnExit = EdtCodigoClienteExit
      OnKeyPress = EdtCodigoClienteKeyPress
    end
    object EdtNomeCliente: TEdit
      Left = 108
      Top = 42
      Width = 614
      Height = 22
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
  end
  object GbProdutos: TGroupBox
    Left = 8
    Top = 154
    Width = 727
    Height = 312
    Caption = 'Produto(s)'
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 19
      Width = 85
      Height = 14
      Caption = 'C'#243'digo Produto'
    end
    object Label5: TLabel
      Left = 108
      Top = 19
      Width = 51
      Height = 14
      Caption = 'Descri'#231#227'o'
    end
    object Label6: TLabel
      Left = 387
      Top = 19
      Width = 63
      Height = 14
      Caption = 'Quantidade'
    end
    object Label7: TLabel
      Left = 477
      Top = 19
      Width = 70
      Height = 14
      Caption = 'Pre'#231'o Venda'
    end
    object Label8: TLabel
      Left = 568
      Top = 19
      Width = 63
      Height = 14
      Caption = 'Pre'#231'o Total'
    end
    object Label9: TLabel
      Left = 512
      Top = 287
      Width = 70
      Height = 14
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbltotal: TLabel
      Left = 632
      Top = 287
      Width = 28
      Height = 14
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCodigoProduto: TEdit
      Left = 16
      Top = 37
      Width = 89
      Height = 22
      TabOrder = 0
      OnKeyPress = EdtCodigoProdutoKeyPress
    end
    object EdtDescricaoProduto: TEdit
      Left = 108
      Top = 37
      Width = 277
      Height = 22
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
    object EdtQuantidade: TEdit
      Left = 387
      Top = 37
      Width = 89
      Height = 22
      TabOrder = 2
      OnExit = EdtQuantidadeExit
      OnKeyPress = EdtQuantidadeKeyPress
    end
    object EdtPrecoVenda: TEdit
      Left = 477
      Top = 37
      Width = 89
      Height = 22
      TabOrder = 3
      OnExit = EdtPrecoVendaExit
      OnKeyPress = EdtPrecoVendaKeyPress
    end
    object edtValorTotal: TEdit
      Left = 568
      Top = 37
      Width = 89
      Height = 22
      TabStop = False
      Enabled = False
      TabOrder = 4
      OnExit = edtValorTotalExit
      OnKeyPress = edtValorTotalKeyPress
    end
    object BtnItem: TButton
      Left = 658
      Top = 37
      Width = 64
      Height = 22
      Caption = 'Inserir'
      TabOrder = 5
      OnClick = BtnItemClick
    end
    object DBGrid1: TDBGrid
      Left = 18
      Top = 65
      Width = 704
      Height = 216
      DataSource = DSPedido
      PopupMenu = PopupMenu1
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'DIGO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precovenda'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Unit'#225'rio'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precototal'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total'
          Width = 100
          Visible = True
        end>
    end
  end
  object BtnGravar: TButton
    Left = 8
    Top = 8
    Width = 96
    Height = 51
    Caption = 'Gravar'
    TabOrder = 3
    TabStop = False
    OnClick = BtnGravarClick
  end
  object BtnLimpar: TButton
    Left = 314
    Top = 8
    Width = 96
    Height = 51
    Caption = 'Limpar'
    TabOrder = 4
    TabStop = False
    OnClick = BtnLimparClick
  end
  object BtnConsultar: TButton
    Left = 110
    Top = 8
    Width = 96
    Height = 51
    Caption = 'Consultar'
    TabOrder = 5
    TabStop = False
    OnClick = BtnConsultarClick
  end
  object BtnCancelar: TButton
    Left = 212
    Top = 8
    Width = 96
    Height = 51
    Caption = 'Cancelar'
    TabOrder = 6
    TabStop = False
    OnClick = BtnCancelarClick
  end
  object DSPedido: TDataSource
    DataSet = MemDataPedido
    Left = 232
    Top = 290
  end
  object MemDataPedidoOld: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 352
    Top = 274
    object MemDataPedidoOldcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object MemDataPedidoOlddescricao: TStringField
      FieldName = 'descricao'
    end
    object MemDataPedidoOldprecovenda: TCurrencyField
      FieldName = 'precovenda'
    end
    object MemDataPedidoOldprecototal: TCurrencyField
      FieldName = 'precototal'
    end
    object MemDataPedidoOldquantidade: TCurrencyField
      FieldName = 'quantidade'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 266
    object AlterarItem1: TMenuItem
      Caption = 'Alterar Item'
      ShortCut = 112
      OnClick = AlterarItem1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      ShortCut = 46
      OnClick = ExcluirItem1Click
    end
  end
  object MemDataPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 330
    object MemDataPedidocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object MemDataPedidodescricao: TStringField
      FieldName = 'descricao'
    end
    object MemDataPedidoprecototal: TFMTBCDField
      FieldName = 'precototal'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Size = 3
    end
    object MemDataPedidoprecovenda: TFMTBCDField
      FieldName = 'precovenda'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Size = 3
    end
    object MemDataPedidoquantidade: TFMTBCDField
      FieldName = 'quantidade'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Size = 3
    end
  end
end
