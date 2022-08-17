# Host: localhost:3390  (Version 5.5.11)
# Date: 2022-08-17 17:30:35
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
# Data for table "clientes"
#

INSERT INTO `clientes` VALUES (1,'RAFAEL FONSECA','PALMAS','TO'),(2,'TESTE','PALMAS','TO'),(3,'FULANDO','GOIANIA','GO'),(4,'CICLANO','GOIANIA','GO'),(5,'MARIA','PORTO NACIONAL','TO'),(6,'JOÃO','SÃO PAULO','SP'),(7,'JOSÉ','SÃO PAULO','SP'),(8,'PEDRO','GUARAÍ','TO'),(9,'TESTE 1','GUARAÍ','TO'),(10,'TESTE 2','PALMAS','TO'),(11,'TESTE 3','PALMAS','TO'),(12,'TESTE4','PALMAS','TO'),(13,'TESTE 5','PALMAS','TO'),(14,'TESTE 6','PALMAS','TO'),(15,'TESTE7','PALMAS','TO'),(16,'TESTE 8','PALMAS','TO'),(17,'TESTE 9','PALMAS','TO'),(18,'TESTE 10','PALMAS','TO'),(19,'TESTE 11','PALMAS','TO'),(20,'TESTE 12','PALMAS','TO');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pedido_venda"
#


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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "pedido_venda_itens"
#


#
# Structure for table "produtos"
#

CREATE TABLE `produtos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL COMMENT 'descrição do produto',
  `PrecoVenda` decimal(16,2) DEFAULT '0.00' COMMENT 'preço venda do produto',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "produtos"
#

INSERT INTO `produtos` VALUES (1,'ARROZ',20.00),(2,'FEIJÃO',10.00),(3,'OLEO',8.99),(4,'BOLACHA',5.45),(5,'COCA COLA LATA',3.00),(6,'CHOCOLATE',4.99),(7,'CARNE',41.00),(8,'MACARRÃO CRISTAL',3.00),(9,'PRODUTO 5',7.00),(10,'PRODUTO 6',7.50),(11,'PRODUTO 7',8.00),(12,'PRODUTO 8',9.00),(13,'PRODUTO 9',10.00),(14,'PRODUTO 10',11.00),(15,'PRODUTO 11',12.00),(16,'PRODUTO 12',13.00),(17,'PRODUTO 13',14.00),(18,'PRODUTO 14',15.00),(19,'PRODUTO 15',16.00),(20,'PRODUTO 16',17.00);
