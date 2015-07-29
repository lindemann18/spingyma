/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : spingyma

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-29 16:01:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sgpruebaslight
-- ----------------------------
DROP TABLE IF EXISTS `sgpruebaslight`;
CREATE TABLE `sgpruebaslight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tipo_prueba` int(11) DEFAULT NULL,
  `desc_prueba` varchar(250) DEFAULT NULL,
  `resultado_numerico` double(11,0) DEFAULT NULL,
  `resultado` varchar(250) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `fh_creacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sgpruebaslight
-- ----------------------------
INSERT INTO `sgpruebaslight` VALUES ('1', '1', '2', '3', 'IMC', '26', 'Sobre Peso', '60', '2015-05-29');
INSERT INTO `sgpruebaslight` VALUES ('2', '1', '2', '3', 'IMC', '25', 'Sobre Peso', '60', '2015-06-29');
