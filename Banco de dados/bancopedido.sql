# Host: localhost:3390  (Version 5.5.11)
# Date: 2022-08-15 14:16:41
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "clientes"
#

CREATE TABLE `clientes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL COMMENT 'Nome do cliente',
  `Cidade` varchar(255) DEFAULT NULL COMMENT 'Cidade do cliente',
  `uf` char(2) DEFAULT NULL COMMENT 'UF cidade cliente',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Structure for table "pedido_venda"
#

CREATE TABLE `pedido_venda` (
  `numeropedido` int(11) NOT NULL AUTO_INCREMENT,
  `codigocliente` int(11) NOT NULL,
  `valortotal` float(16,2) DEFAULT '0.00',
  `datapedido` datetime NOT NULL,
  PRIMARY KEY (`numeropedido`) USING BTREE,
  KEY `fk_cliente` (`codigocliente`) USING BTREE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`codigocliente`) REFERENCES `clientes` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "pedido_venda_itens"
#

CREATE TABLE `pedido_venda_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nrpedido` int(11) DEFAULT NULL,
  `codigoproduto` int(11) DEFAULT NULL,
  `quantidade` decimal(16,6) DEFAULT NULL,
  `valorunitario` decimal(16,6) DEFAULT NULL,
  `valortotal` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_pedido_venda` (`nrpedido`) USING BTREE,
  CONSTRAINT `fk_pedido_venda` FOREIGN KEY (`nrpedido`) REFERENCES `pedido_venda` (`numeropedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "produtos"
#

CREATE TABLE `produtos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL COMMENT 'descrição do produto',
  `PrecoVenda` decimal(16,2) DEFAULT '0.00' COMMENT 'preço venda do produto',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
