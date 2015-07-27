/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : spingyma

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-07-26 23:59:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sgcategoriamaquina`
-- ----------------------------
DROP TABLE IF EXISTS `sgcategoriamaquina`;
CREATE TABLE `sgcategoriamaquina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_categoriamaquina` varchar(250) NOT NULL,
  `desc_categoriamaquina` varchar(500) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  `id_usuarioregistro` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgcategoriamaquina
-- ----------------------------
INSERT INTO `sgcategoriamaquina` VALUES ('1', 'Varios', 'Para máquinas con más de una parte del cuerpo para entrenar', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('2', 'Brazo', 'Máquinas de brazo', '0', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('3', 'Pierna ', 'Cateogría de pierna para las máquinas. ', '0', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('4', 'Spx', 'Ejercicios funcionales y crossfit', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('5', 'Cardio', 'Cardiovascular', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('6', 'Maq. Peso integrado', 'Maq. Peso integrado', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('7', 'Peso Libre', 'Peso Libre', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('13', 'Cochapacha', 'chocobanana', '1', '1');
INSERT INTO `sgcategoriamaquina` VALUES ('14', 'Ninguna', 'Ninguna máquina', '1', '1');

-- ----------------------------
-- Table structure for `sgcategoriasrutina`
-- ----------------------------
DROP TABLE IF EXISTS `sgcategoriasrutina`;
CREATE TABLE `sgcategoriasrutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_categoriarutina` varchar(250) NOT NULL,
  `desc_categoriarutina` varchar(250) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgcategoriasrutina
-- ----------------------------
INSERT INTO `sgcategoriasrutina` VALUES ('1', 'Principiante', 'Rutinas para clientes principiantes', '1');
INSERT INTO `sgcategoriasrutina` VALUES ('2', 'Intermedio', 'Rutinas para los clientes de resistencia física intermedia', '1');
INSERT INTO `sgcategoriasrutina` VALUES ('3', 'Avanzado', 'Rutinas para clientes de resistencia física Avanzada', '1');
INSERT INTO `sgcategoriasrutina` VALUES ('4', 'Todos', 'Rutinas en general para todos los niveles', '1');

-- ----------------------------
-- Table structure for `sgclientes`
-- ----------------------------
DROP TABLE IF EXISTS `sgclientes`;
CREATE TABLE `sgclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_cliente` varchar(250) NOT NULL,
  `id_usuario_registro` int(11) NOT NULL,
  `id_tipocuerpo` int(11) DEFAULT NULL,
  `nb_apellidos` varchar(250) NOT NULL,
  `de_genero` varchar(30) NOT NULL,
  `fh_nacimiento` varchar(10) DEFAULT NULL,
  `de_email` varchar(250) NOT NULL,
  `num_telefono` varchar(15) DEFAULT NULL,
  `num_celular` varchar(15) NOT NULL,
  `id_estado` int(4) NOT NULL,
  `id_municipio` int(4) NOT NULL,
  `id_ciudad` int(4) NOT NULL,
  `de_colonia` varchar(250) NOT NULL,
  `de_domicilio` varchar(250) NOT NULL,
  `num_codigopostal` varchar(5) DEFAULT NULL,
  `sn_activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sgclientes
-- ----------------------------
INSERT INTO `sgclientes` VALUES ('2', 'PEDRO JOSÉ', '1', '1', 'FLORES CABANILLAS', 'MASCULINO', '1988-2-1', 'ashernetz@hotmail.com', '(697) 721-0056', '(667) 247-0430', '25', '1919', '216100', 'CENTRO', '          RAMON F. ITURBE #60', '80900', '1');
INSERT INTO `sgclientes` VALUES ('11', 'KARLA VICTORIA', '1', null, 'FLORES SANTOYO', '', '1988-2-1', 'kflores_975@outlook.com', '', '(667) 127-4981', '25', '1912', '211451', 'FRACCIONAMIENTO COLINAS DEL BOSQUE', '', '80975', '0');
INSERT INTO `sgclientes` VALUES ('12', 'CAMILA', '2', null, 'FLORES', 'FEMENINO', '1988-2-1', 'cflores@cheetahstudio.mx', '(697) 721-0056', '(667) 247-0430', '25', '1912', '211451', 'FRACCIONAMENTO COLINAS DEL BOSQUE', 'DE LA ROSA #5979', '80975', '1');
INSERT INTO `sgclientes` VALUES ('13', 'JESUS MANUEL', '2', null, 'FLORES FLORES', 'MASCULINO', '1988-2-1', 'jmflores@cheetahstudio.mx', '', '(667) 127-4981', '25', '1912', '211451', 'FRACCIONAMIENTO COLINAS DEL BOSQUE', 'RE LAS ROSAS #5979', '80795', '1');
INSERT INTO `sgclientes` VALUES ('14', 'CRISTOBAL', '9', null, 'QUEVEDO PEIRO', 'MASCULINO', '1988-2-1', 'cocloes_1986@hotmail.com', '', '(667) 258-9631', '25', '1919', '216100', 'CENTRO', '', '80900', '1');
INSERT INTO `sgclientes` VALUES ('15', 'JESUS EDUARDO', '9', null, 'FLORES CABANILLAS', 'MASCULINO', '1988-2-1', 'chuyin_lalo@hotmail.com', '', '(697) 104-2992', '25', '1919', '216100', 'CENTRO', '', '80900', '1');
INSERT INTO `sgclientes` VALUES ('16', 'OSCAR JOSÉ', '9', null, 'QUEVEDO PEIRO', 'MASCULINO', '1988-2-1', 'oscar_10@hotmail.com', '', '(697) 854-215_', '25', '1919', '216100', 'CENTRO', '', '80900', '1');
INSERT INTO `sgclientes` VALUES ('17', 'ELBA LIZETH', '1', null, 'FLORES CABANILLAS', 'FEMENINO', '1988-2-1', 'ashernetz@hotmail.com', '(697) 721-0056', '(667) 773-3739', '25', '1919', '216100', 'CENTRO', '', '80900', '1');
INSERT INTO `sgclientes` VALUES ('18', 'MARIA ELENA', '1', null, 'QUEVEDO PEIRO', 'FEMENINO', '1988-2-1', 'polyq_malena@hotmail.com', '(789) 456-9416', '(667) 711-2255', '26', '1954', '225915', 'DF', 'CONOCIDA', '80000', '0');
INSERT INTO `sgclientes` VALUES ('20', 'jesus enrique', '1', null, 'perez', 'MASCULINO', '1988-2-1', 'ashernetz@hotmail.com', '(123) 213-1232', '(313) 132-1321', '0', '0', '0', 'Montebello', ' cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('21', 'rocket mapache espacial', '1', null, 'raccoon', 'MASCULINO', '1988-2-1', 'ashernetz@hotmail.com', '(213) 213-2132', '(213) 213-2132', '0', '0', '0', 'montebello', '  cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('22', 'jesus', '1', null, 'perez', 'MASCULINO', '1988-2-1', 'ashernetz@hotmail.com', '(123) 123-1123', '(123) 123-1231', '0', '0', '0', 'montebello', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('25', 'Jonah', '1', null, 'king', 'MASCULINO', '1991-7-15', 'ashernetz@hotmail.com', '(213) 123-1231', '(123) 112-3123', '0', '0', '0', 'adada', '   cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('27', 'Juan', '2', null, 'cacho', 'MASCULINO', '1988-2-3', 'ashernetz@hotmail.com', '(123) 313-3112', '(131) 313-1312', '0', '0', '0', 'asdadada', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('28', 'cliente1', '1', null, 'cliente1', 'MASCULINO', '1975-1-19', 'alonsobreton@gmail.com', '(667) 712-6474', '(667) 712-6474', '0', '0', '0', 'guadalupe', 'cadfadsfs', '80220', '0');
INSERT INTO `sgclientes` VALUES ('29', 'juan', '1', null, 'de dios', 'MASCULINO', '1980-2-2', 'alonsobreton@hotmail.com', '(667) 712-6373', '(563) 456-4567', '0', '0', '0', '474567465', '4764567', '80222', '1');
INSERT INTO `sgclientes` VALUES ('30', 'Cliente 2', '1', null, 'cliente 2', 'MASCULINO', '1975-1-19', 'alonsobreton@gmail.com', '(667) 712-6373', '(667) 194-9437', '0', '0', '0', 'guadalupe', 'afadsfadsf', '80220', '0');
INSERT INTO `sgclientes` VALUES ('31', 'alonso', '1', null, 'breton', 'MASCULINO', '1975-1-19', 'alonsobreton@me.com', '(667) 194-9437', '(667) 712-6373', '0', '0', '0', 'guadalupe', '     gfsgrsgrsgrsg', '80220', '1');
INSERT INTO `sgclientes` VALUES ('32', 'sergio', '1', null, 'Franco devita', 'MASCULINO', '1988-11-18', 'ashernetz@hotmail.com', '(123) 213-2131', '(123) 213-1231', '0', '0', '0', 'Cañadas', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('33', 'Lagarto', '1', null, 'Juancho', 'MASCULINO', '1988-1-1', 'ashernetz@hotmail.com', '(213) 131-2313', '(132) 123-1231', '0', '0', '0', 'cañadas', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('34', 'Maguila', '1', null, 'Gorila', 'MASCULINO', '1988-1-1', 'ashernetz@hotmail.com', '(212) 131-2312', '(132) 123-1231', '0', '0', '0', 'cañadas', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('35', 'Maguila', '1', null, 'Gorila', 'MASCULINO', '1988-1-1', 'ashernetz@hotmail.com', '(212) 131-2312', '(132) 123-1231', '0', '0', '0', 'cañadas', 'cañadas\ncañadas', '80227', '0');
INSERT INTO `sgclientes` VALUES ('36', 'Omelete', '1', null, 'du fomach', 'MASCULINO', '1991-4-15', 'sergio_ric3@hotmail.com', '(667) 154-8899', '(667) 154-0133', '0', '0', '0', 'Lomas del sol', 'Hortencia cabada', '80016', '0');
INSERT INTO `sgclientes` VALUES ('37', 'SERGIO', '1', null, 'RIVAS', 'MASCULINO', '1991-4-15', 'sergio_ric3@hotmail.com', '(667) 154-0133', '(667) 154-0189', '0', '0', '0', 'LOMAS DEL SOL', '  CALLE HORTENCIA CABADA 993', '80016', '1');
INSERT INTO `sgclientes` VALUES ('38', 'Arlou', '1', '3', 'Perez Parra Castro', 'FEMENINO', '1991-8-29', 'Arlu.ppc@gmail.com', '(654) 645-6464', '(465) 456-4564', '0', '0', '0', 'Ciudad universitaria', 'su casa', '80920', '1');
INSERT INTO `sgclientes` VALUES ('39', 'LUIS FERNANDO', '1', null, 'AGUILAR PEREZ', 'MASCULINO', '1981-4-1', 'takotaka669@hotmail.com', '(667) 177-7156', '(667) 177-7158', '0', '0', '0', '', 'efef', '', '1');
INSERT INTO `sgclientes` VALUES ('40', 'ELISA JUDITH', '1', null, 'ARREDONDO ONTIVEROS', 'FEMENINO', '1974-4-1', 'ontiveros.e@hotmail.com', '(667) 222-0045', '(667) 222-0046', '0', '0', '0', '', '3f', 'd', '1');
INSERT INTO `sgclientes` VALUES ('41', 'VERONICA ', '1', null, 'CALDERON SOTO', 'FEMENINO', '1975-4-1', 'vrnc_soto@hotmail.com', '(667) 996-7126', '(667) 996-7125', '0', '0', '0', '', 'efw', 'f', '1');
INSERT INTO `sgclientes` VALUES ('42', 'RAMON GERARDO', '1', null, 'GONZALES', 'MASCULINO', '1982-4-1', 'ponuramos@hotmail.com', '(667) 102-4675', '(667) 102-4675', '0', '0', '0', '', 'EKJNEWF', 'EKJNW', '1');
INSERT INTO `sgclientes` VALUES ('43', 'KARINA', '1', null, 'CASTILLO URIARTE', 'FEMENINO', '1987-4-1', 'karinahtc@hotmail.com', '(667) 203-5838', '(667) 203-5837', '0', '0', '0', '', 'dkjnqwd', '', '1');
INSERT INTO `sgclientes` VALUES ('44', 'NYDHIA GUADALUPE ', '1', null, 'JAIME RUIZ', 'FEMENINO', '1992-4-1', 'starfire18@hotmail.com', '(667) 330-8449', '(667) 203-5837', '0', '0', '0', '', 'efewf', '', '1');
INSERT INTO `sgclientes` VALUES ('45', 'ALEJANDRA ', '1', null, 'FIGUEROA AISPURO', 'MASCULINO', '1994-4-1', 'alefiigueroa.foto@gmail.com', '(667) 383-8930', '(387) 324-8287', '0', '0', '0', '', 'ejhdwpef', '', '1');
INSERT INTO `sgclientes` VALUES ('46', 'ABIGAIL', '1', null, 'PAYAN IBARRA', 'FEMENINO', '1987-4-1', 'abigail_payan@hotmail.com', '(667) 143-5673', '(667) 153-8492', '0', '0', '0', '', 'eñdjne', '', '1');
INSERT INTO `sgclientes` VALUES ('47', 'ZULEMA', '1', null, 'NUÑEZ MEDINA', 'FEMENINO', '1991-4-1', 'zulema15_nm@gmail.com', '(667) 473-9000', '(667) 473-9001', '0', '0', '0', '', 'eiuhhwfinw', '', '1');
INSERT INTO `sgclientes` VALUES ('48', 'SALVADOR ', '1', null, 'ORRICO BRAVO', 'MASCULINO', '1984-4-1', 'salvaorrico@gmail.com', '(667) 154-0134', '(667) 154-0132', '0', '0', '0', '', 'kwejfwje', '', '1');
INSERT INTO `sgclientes` VALUES ('49', 'JORGE', '1', null, 'CAMACHO MEDINA', 'MASCULINO', '1991-4-1', 'jorgecamachomedina@homtail.com', '(667) 187-0050', '(667) 187-0049', '0', '0', '0', '', 'ejdnqwdqo', '', '1');
INSERT INTO `sgclientes` VALUES ('50', 'DAENA MARTINEZ ', '1', null, 'LOPEZ', 'FEMENINO', '1985-4-1', 'daena_ml@hotmail.com', '(667) 154-0136', '(667) 154-0238', '0', '0', '0', '', 'sdiojfneui', '', '1');
INSERT INTO `sgclientes` VALUES ('51', 'LEONARDO', '1', null, 'ROCHA ZALAZAR', 'MASCULINO', '1993-4-1', 'leonardo.rocha@hotmail.com', '(667) 155-7064', '(667) 155-7066', '0', '0', '0', '', 'dkcjsc', '', '1');
INSERT INTO `sgclientes` VALUES ('52', 'ANA SOFIA', '1', null, 'LEY DIAZ', 'FEMENINO', '1998-4-1', 'anasofia_ley@hotmail.com', '(667) 154-0167', '(667) 154-0134', '0', '0', '0', '', 'efwfe', '', '1');
INSERT INTO `sgclientes` VALUES ('53', 'DANIEL', '1', null, 'PAYAN IBARRA', 'MASCULINO', '1992-4-1', 'chimpa852@hotmail.com', '(667) 154-0135', '(667) 154-0189', '0', '0', '0', '', 'djkne', '', '1');
INSERT INTO `sgclientes` VALUES ('54', 'ARAUJO BOJORQUEZ', '1', null, 'PAMELA', 'FEMENINO', '1990-4-1', 'pamela_araujo@hotmail.com', '(667) 995-9043', '(667) 995-9044', '0', '0', '0', '', ' ffrjfrjif', '', '1');
INSERT INTO `sgclientes` VALUES ('55', 'DIAZ HABERMANN', '1', null, 'ADRIANA', 'FEMENINO', '1970-4-1', 'adridhabermann@hotmail.com', '(667) 154-0134', '(667) 154-0135', '0', '0', '0', '', ' ifjjeif', '', '1');
INSERT INTO `sgclientes` VALUES ('56', 'VEGA LLAUSA', '1', null, 'ALEJANDRA', 'FEMENINO', '1974-4-1', '-', '(667) 715-4013', '(667) 154-0178', '0', '0', '0', '', 'JHBU', '', '1');
INSERT INTO `sgclientes` VALUES ('57', 'GUADALUPE', '1', null, 'FELIX RIOS', 'FEMENINO', '1961-4-1', 'despacholofe@yahoo.com.mx', '(667) 161-0844', '(667) 161-0845', '0', '0', '0', '', 'wfuhfw', '', '1');
INSERT INTO `sgclientes` VALUES ('58', 'MELVA', '1', null, 'ROCHA PEREZ', 'FEMENINO', '1970-4-1', 'pola_gastelum@homtail.com', '(667) 145-8945', '(667) 145-8944', '0', '0', '0', '', 'uoygouyb', '', '1');
INSERT INTO `sgclientes` VALUES ('59', 'CANDY NATALÍ', '1', null, 'ANGULO LIZARRAGA', 'FEMENINO', '1991-4-1', 'nataliangulo20@gmail.com', '(667) 202-3062', '(667) 202-3067', '0', '0', '0', '', 'LUCCHIRU', '', '1');
INSERT INTO `sgclientes` VALUES ('60', 'ALONSO DANIEL', '1', null, 'BRETON MUÑOZ', 'MASCULINO', '1975-4-1', 'alonsobreton@homtail.com', '(667) 143-9483', '(667) 153-6472', '0', '0', '0', '', 'foiheoidjqw', '', '1');
INSERT INTO `sgclientes` VALUES ('61', 'CARLOS DOMINGO ', '1', null, 'ALFARO TIRADO', 'MASCULINO', '1984-10-18', 'carlos.alfaro1018@gmail.com', '(667) 104-5840', '(667) 104-5841', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('62', 'JONATHAN SAIR', '1', null, 'GUTIEREZ PEREZ', 'MASCULINO', '1988-7-11', 'jonathan_gp11@hotmail.com', '(667) 390-2166', '(667) 390-2165', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('63', 'MONICA ', '1', null, 'SIQUEIROS RAMOS', 'FEMENINO', '1974-1-29', 'monica_siqueiros@hotmail.com', '(667) 232-2075', '(667) 232-2076', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('64', 'YAEL ', '1', null, 'VASQUEZ FIERRO', 'FEMENINO', '1990-9-16', 'chaparravazquez1@hotmail.com', '(667) 254-9102', '(667) 254-9103', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('65', 'ROSA NADIA', '1', null, 'LEYVA LOPEZ', 'FEMENINO', '1984-2-6', 'NO', '(667) 187-3708', '(671) 873-708_', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('66', 'HECTOR ', '1', null, 'ELENES CHAIDEZ', 'MASCULINO', '1998-11-14', 'hector19981@hotmail.com', '(655) 846-1484', '(654) 846-3156', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('67', 'RITA GEORGINA', '1', null, 'VALENZUELA CAZARES', 'FEMENINO', '1984-6-20', '-', '(665) 245-5224', '(671) 542-6895', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('68', 'RAQUEL ', '1', null, 'HINOJOSA ROJO', 'FEMENINO', '1979-4-26', 'lekarhr@hotmail.com', '(667) 266-5190', '(667) 266-5191', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('69', 'IRMA YUKIE ', '1', null, 'LOYA LEON', 'FEMENINO', '1991-8-16', 'yukieloya@gmail.com', '(667) 102-0493', '(667) 102-0494', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('70', 'EDGARD', '1', null, 'ROJAS IBARRA', 'MASCULINO', '1976-6-21', 'edgardbond@hotmail.com', '(667) 101-0104', '(667) 101-0105', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('71', 'ENRIQUE ', '1', null, 'CAMACHO PAEZ', 'MASCULINO', '1972-12-20', 'ecamachopaez@hotmail.com', '(667) 751-1968', '(667) 751-1969', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('72', 'WENDY', '1', null, 'PEREZ BERNAL', 'FEMENINO', '1976-8-17', 'wendytoyo@hotmail.com', '(667) 104-8606', '(667) 104-8607', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('73', 'JESSER', '1', null, 'FELIZ MEDINA', 'MASCULINO', '1990-5-19', 'jesserf90@hotmail.com', '(667) 217-0364', '(667) 217-0365', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('74', 'MARIANA', '1', null, 'JUAREZ RAMOS', 'FEMENINO', '1983-5-25', 'mjuarez@impulsainmuebles.com.mx', '(667) 473-7828', '(667) 473-7829', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('75', 'KARELY SARAHÍ', '1', null, 'ESQUIVEL VALENZUELA', 'FEMENINO', '1992-4-22', 'kelly-s23@hotmail.com', '(667) 154-8525', '(667) 473-7829', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('76', 'CLAUDIA ELIZABETH', '1', null, 'PEREZ SERRANO', 'MASCULINO', '1982-4-24', 'ceps2482@hotmail.com', '(667) 161-0443', '(667) 161-0444', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('77', 'CLAUDIA ', '1', null, 'AVIÑA ARIAS', 'FEMENINO', '1989-1-27', 'claudia@emporiosushi.com', '(667) 200-7065', '(662) 007-066_', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('78', 'KARLA MARIA', '1', null, 'URREA PICOS', 'FEMENINO', '1982-10-17', 'karla_urreap@hotmail.com', '(667) 479-1175', '(667) 479-1176', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('79', 'CARLOS JESUS', '1', null, 'QUINTERO ANDRADE', 'MASCULINO', '1981-8-7', 'travisngame@gmail.com', '(667) 786-0401', '(667) 479-1176', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('80', 'KARLA ', '1', null, 'LEON CARRIZOSA', 'FEMENINO', '1977-1-13', 'karla_leon77@hotmail.com', '(667) 220-5254', '(667) 220-5255', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('81', 'EDUARDO ', '1', null, 'OZUNA LEON', 'MASCULINO', '1989-9-24', 'eduardo.d.leon@hotmail.com', '(667) 390-7891', '(667) 390-7891', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('82', 'ROGELIO ALFONSO', '1', null, 'LARA MILAN', 'MASCULINO', '1990-10-29', 'rogelio.lara@sukarne.com', '(667) 303-3014', '(667) 303-3015', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('83', 'LUIS ALBERTO', '1', null, 'AGUIAR DIAZ SANCHEZ', 'MASCULINO', '1980-1-4', '-', '(667) 167-7413', '(667) 167-7414', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('84', 'MYRIAM CYNTHIA ', '1', null, 'PEÑA MEDINA', 'FEMENINO', '1984-12-9', 'myriam.pm@itesm.mx', '(667) 200-3643', '(667) 200-3644', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('85', 'YAHAIRA PAOLA', '1', null, 'ORTIZ CASTRO', 'FEMENINO', '1982-3-27', '-', '(667) 206-2571', '(667) 206-2572', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('86', 'ANDREILEEN', '1', null, 'MEZA', 'FEMENINO', '1985-2-20', 'andreileen@gmail.com', '(667) 303-5170', '(667) 303-5171', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('87', 'SERGIO ', '1', null, 'RIVAS', 'MASCULINO', '1991-4-15', 'breton0@hotmail.com', '(667) 154-0133', '(667) 154-0134', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('88', 'RAMOS HERNANDEZ SUGEY', '1', null, 'REINA MARIA', 'FEMENINO', '1980-9-23', 'reina_ramos14@hotmail.com', '(667) 215-2531', '(667) 215-2532', '0', '0', '0', 'San luis fracc', 'san luis gonsada 4514', '80140', '1');
INSERT INTO `sgclientes` VALUES ('89', 'CLAUDIA', '1', null, 'MENDEZ GUIZARG', 'FEMENINO', '1983-7-17', 'c_mendita@hotmail.com', '(667) 777-7777', '(667) 756-4435', '0', '0', '0', 'CENTRO', 'ANGEL FLORES 515', '80000', '1');
INSERT INTO `sgclientes` VALUES ('90', 'ANAHÍ ', '1', null, 'CHAIDEZ SILVA', 'FEMENINO', '1989-7-1', 'anahichaidez5@gmail.com', '(667) 714-0844', '(667) 329-5130', '0', '0', '0', 'LIBERTAD', 'AV. FELIX PALAVICINE 1628', '80180', '1');
INSERT INTO `sgclientes` VALUES ('91', 'MELISSA ', '1', null, 'VALENZUELA GUEMEZ', 'FEMENINO', '1986-11-10', 'melissa.valenzuela@sukarne.com', '(667) 455-2214', '(667) 207-0783', '0', '0', '0', 'VILAS DEL RIO', 'VILLA CADIZ 2853', '80050', '1');
INSERT INTO `sgclientes` VALUES ('92', 'CHRISTIAN NOÉ ', '1', null, 'LOPEZ PEREZ', 'MASCULINO', '1986-7-21', 'christian.lopez@sukarne.com', '(667) 777-7777', '(667) 139-0279', '0', '0', '0', 'antonio yamaguchi navolato', 'ALFONSO ESTOLANO 1027', '80370', '1');
INSERT INTO `sgclientes` VALUES ('93', 'VICTOR ANDRES', '1', null, 'ROMAN LEIVA', 'MASCULINO', '1987-2-4', 'victor.roman@sukarne.com', '(667) 718-8485', '(667) 270-4697', '0', '0', '0', 'ANTONIO TOLEDO CORRO ', 'MINA LA PURISIMA 2105', '80296', '1');
INSERT INTO `sgclientes` VALUES ('94', 'JESUS MANUEL', '1', null, 'CASTRO CERVANTES', 'MASCULINO', '1977-3-1', 'jesus.castro@sukarne.com', '(667) 777-7777', '(667) 177-0675', '0', '0', '0', 'COLINAS DEL BOSQUE', 'DE LOS CLAVELES 5961', '80194', '1');
INSERT INTO `sgclientes` VALUES ('95', 'XIARELI BEATRIZ', '1', null, 'CEJUDO RUELAS', 'FEMENINO', '1986-7-19', 'xiareli.cejudo@hotmail.com', '(667) 717-1439', '(667) 390-3800', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('96', 'MARIO ROBERTO', '1', null, 'VELARDE RODRIGUEZ', 'MASCULINO', '1989-2-2', 'mvelarde@live.com.mx', '(667) 714-1033', '(667) 175-0126', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('97', 'MARIA FERNANDA ', '1', null, 'OCHO GONZALES', 'MASCULINO', '1963-3-6', 'berali63@hotmail.com', '(667) 257-7650', '(667) 232-4807', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('98', 'MARIA LORENA', '1', null, 'GONZALES HERNANDEZ', 'FEMENINO', '1973-9-8', 'lorego_77@hotmail.com', '(667) 714-2900', '(667) 996-5972', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('99', 'MAYRA ALEJANDRA', '1', null, 'RENAUT VEGA', 'FEMENINO', '1992-3-30', 'mayra.renaut@sukarne.com', '(667) 753-2490', '(667) 306-3981', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('100', 'GERARDO ', '1', null, 'IBARRA LOAIZA', 'MASCULINO', '1987-10-12', 'gerardo.ibarra@sukarne.com', '(677) 777-7777', '(667) 176-2164', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('101', 'AZAEL ', '1', null, 'NORIS EGUINO', 'MASCULINO', '1983-5-20', 'azael.noris@sukarne.com', '(667) 777-7777', '(667) 105-7905', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('102', 'CHRISTIAN GUSTAVO ', '1', null, 'PACHECHO LAGARDA', 'MASCULINO', '1985-7-9', 'christian.pacheco@sukarne.com', '(667) 713-7975', '(667) 252-0742', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('103', 'VILMA YAZMIN', '1', null, 'PAYAN GASTELUM', 'FEMENINO', '1989-11-24', 'vilma.payan@sukarne.com', '(667) 759-2600', '(667) 223-6066', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('104', 'MARIA ESPERANSA', '1', null, 'QUINTERO OVALLES', 'FEMENINO', '1964-8-1', 'maquintero05@gmail.com', '(667) 752-1305', '(667) 996-8945', '0', '0', '0', '-', '-', '--', '1');
INSERT INTO `sgclientes` VALUES ('105', 'MARIA GUADALUPE', '1', null, 'ALVARADO CARRILLO', 'FEMENINO', '1962-10-31', 'mariagpealvaradoc@hotmail.com', '(667) 761-2448', '(667) 121-7416', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('106', 'RITA', '1', null, 'GARCIA ZERDUCHE', 'FEMENINO', '1972-10-23', 'rita.garcia@sukarne.com', '(777) 777-7777', '(667) 165-4067', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('107', 'YURIDIA CRISTABEL ', '1', null, 'ESCOBAR CASTRO', 'FEMENINO', '1988-9-27', 'yuridia.escobar@sukarne.com', '(777) 777-7777', '(667) 209-7027', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('108', 'PEDRO', '1', null, 'RIOS LEON', 'MASCULINO', '1989-2-22', 'pedro.rios@sukarne.com', '(667) 750-6886', '(667) 474-8831', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('109', 'ARELY ', '1', null, 'MEZA QUINTERO', 'FEMENINO', '1985-12-10', 'arely.meza@sukarne.com', '(677) 777-7777', '(667) 102-0762', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('110', 'JORGE EDUARDO', '1', null, 'SANCHEZ CAMACHO', 'MASCULINO', '1981-2-24', 'jorge.sanchez@sukarne.com', '(667) 777-7777', '(667) 153-9284', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('111', 'YORKSHIRE FERNANDO ', '1', null, 'SALAS OSUNA', 'MASCULINO', '1987-7-25', 'yorkshire.salas@sukarne.com', '(667) 724-2435', '(667) 317-3569', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('112', 'XIAREY BEATRIZ ', '1', null, 'CEJUDO RUEDAS', 'FEMENINO', '1986-7-19', 'xiarely.cejudo@sukarne.com', '(667) 717-1439', '(667) 390-3800', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('113', 'MARIO ROBERTO ', '1', null, 'VELARDE RODRIGUEZ ', 'MASCULINO', '1989-2-2', 'mvelarde@live.com.mx', '(667) 714-1033', '(667) 175-0126', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('114', 'CRISTINA ', '1', null, 'CARRASCO ANGULO', 'MASCULINO', '1985-9-1', 'cristina.carrasco.angulo@gmail.com', '(789) 504-4___', '(667) 144-0953', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('115', 'GLORIA MARIA prueba', '1', null, 'PEÑUÑURI LOPEZ', 'FEMENINO', '1983-4-2', 'gpenunurilopez@gmail.com', '(777) 777-7777', '(667) 189-0371', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('116', 'MARIA DE LOS ANGELES', '1', null, 'ROMERO LOPEZ', 'FEMENINO', '1979-8-2', 'angelesromero@hotmail.com', '(777) 777-7777', '(667) 323-8129', '0', '0', '0', '-', '-', '-', '1');
INSERT INTO `sgclientes` VALUES ('119', 'Chumel', '1', '3', 'Torres', 'MASCULINO', '1980-1-1', 'chjumel@pulso.com', '321235645456', '65454556', '0', '0', '0', 'montebello', 'blvd virreyes', '80227', '1');
INSERT INTO `sgclientes` VALUES ('120', 'Misael', '1', '2', 'Ecom', 'MASCULINO', '1980-3-1', 'a@a.com', '1232312', '123213123', '0', '0', '0', 'asdada', 'blvd virreyes', '80227', '0');

-- ----------------------------
-- Table structure for `sgconsejos`
-- ----------------------------
DROP TABLE IF EXISTS `sgconsejos`;
CREATE TABLE `sgconsejos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_prueba` int(11) NOT NULL,
  `Resultado` varchar(50) NOT NULL,
  `consejo` varchar(500) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgconsejos
-- ----------------------------
INSERT INTO `sgconsejos` VALUES ('1', '1', 'Atleta', 'Mantienes un estado excelente, pero recuerda todavía puedes mejorar. Esfuérzate día a día. y seguirás siendo el campeón que eres hoy. Éxito!', '2015-03-27 13:11:58');
INSERT INTO `sgconsejos` VALUES ('2', '1', 'Excelente', 'La persona tiene un nivel de trabajo excelente, es importante mantenerse al margen de su rutina.', '2015-03-26 13:37:04');
INSERT INTO `sgconsejos` VALUES ('3', '2', 'Peso Ideal', 'Ahora tienes un peso ideal, mantén una alimentacion saludable, una dieta rica en proteínas, carbohidratos,  vitaminas y minerales, con ejercicios aerobicos y anaerobicos constantes y mucha dedicación. Sigue así que puedes verte todavía mejor!', '2015-03-26 13:53:47');
INSERT INTO `sgconsejos` VALUES ('4', '1', 'Bueno', 'La persona tiene un nivel de condición física aceptable pero  es recomendable que sus entrenamientos aumenten su intensidad.', '2015-03-26 13:29:22');
INSERT INTO `sgconsejos` VALUES ('5', '1', 'Promedio', 'Se recomienda que la persona tenga una constancia  en sus entrenamientos para aumentar su nivel se condición física.', '2015-03-26 13:34:27');
INSERT INTO `sgconsejos` VALUES ('6', '1', 'Pobre', 'Se recomienda seguir una rutina de entrenamiento cardiovascular constante como usar caminadora, elíptica o escaladora de 40 a 60 min diariamente para aumentar la condición física.', '2015-03-31 21:31:58');
INSERT INTO `sgconsejos` VALUES ('7', '2', 'Bajo de peso', 'Se recomienda mantener una alimentación alta en proteínas, carbohidratos, vitaminas y minerales. Acompañado de ejercicios anaerobicos (pesas)  minimo 3 a 4 veces por semana.', '2015-03-26 13:49:17');
INSERT INTO `sgconsejos` VALUES ('8', '2', 'Sobre Peso', 'Mantener una alimentación totalmente balanceada con porcentajes bajos de grasa, acompañado de ejercicios aerobicos de 3 a 4 veces por semana. 30 minutos minimo. ', '2015-03-26 13:46:09');
INSERT INTO `sgconsejos` VALUES ('9', '2', 'Obesidad', 'Mantenerte en una alimentación baja en grasa y carbohidratos simples acompañado de ejercicios aerobico, mínimo 3 veces por semana, 30 minutos al dia.', '2015-03-26 13:44:03');
INSERT INTO `sgconsejos` VALUES ('10', '4', 'Atleta', 'Consejo Atleta', '2014-08-21 09:51:45');
INSERT INTO `sgconsejos` VALUES ('11', '4', 'Excelente', 'Consejo Excelente', '2014-08-21 09:51:48');
INSERT INTO `sgconsejos` VALUES ('12', '4', 'Bueno', 'Consejo Bueno', '2014-08-21 09:51:51');
INSERT INTO `sgconsejos` VALUES ('13', '4', 'Promedio', 'Consejo Promedio', '2014-08-21 09:51:51');
INSERT INTO `sgconsejos` VALUES ('14', '4', 'Pobre', 'Consejo Pobre', '2014-08-21 09:51:52');
INSERT INTO `sgconsejos` VALUES ('15', '3', 'Bajo de peso', 'Tu peso es muy bajo, debemos tratarlo con una dieta rica en proteínas, carbohidratos , vitaminas y minerales para aumentar tu masa muscular, acompañado de ejercicios de pesas de 3 a 5 veces por semana. ÉXITO!', '2015-03-31 12:15:04');
INSERT INTO `sgconsejos` VALUES ('16', '3', 'Peso Ideal', 'Ahora manejas un peso ideal en tu Imc, eso quiere decir que tienes un peso saludable, pero todavía podemos mejorarlo, con ejercicios de fuerza (pesas) aerobicos de 3 a 5 días por semanas. Aun puedes mejorar!', '2015-03-31 12:15:31');
INSERT INTO `sgconsejos` VALUES ('17', '3', 'Sobre Peso', 'El sobre peso no es un buen estado físico y mucho menos para una persona arriba del 40, le recomendamos tener una alimentación baja el carbohidratos simples, rica en fibra, vitaminas y minerales.', '2015-03-31 12:10:17');
INSERT INTO `sgconsejos` VALUES ('18', '3', 'Obesidad', 'El nivel de Imc que tiene ahora es muy critico, se debe tratar con ejercicio regular y lo mas importante, una alimentación libre de carbohidratos simples.', '2015-03-31 12:08:24');
INSERT INTO `sgconsejos` VALUES ('19', '5', 'Atleta', 'Consejo Atleta', '2014-08-23 15:38:51');
INSERT INTO `sgconsejos` VALUES ('20', '5', 'Excelente', 'Consejo Excelente', '2014-08-23 15:38:54');
INSERT INTO `sgconsejos` VALUES ('21', '5', 'Bueno', 'Consejo Bueno', '2014-08-23 15:38:57');
INSERT INTO `sgconsejos` VALUES ('22', '5', 'Promedio', 'Consejo Promedio', '2014-08-23 15:39:00');
INSERT INTO `sgconsejos` VALUES ('23', '5', 'Pobre', 'Consejo Pobre', '2014-08-23 15:39:03');
INSERT INTO `sgconsejos` VALUES ('24', '6', 'Atleta', 'Utiliza tu fuerza para optimizar mas tu masa muscular para obtener una simetría deseada.', '2015-03-27 16:52:19');
INSERT INTO `sgconsejos` VALUES ('25', '6', 'Excelente', 'Ahora tienes un fuerza excelente, utilízala en tus entrenamientos intensos para llegar a nivel que nunca has llegado.', '2015-03-27 12:09:22');
INSERT INTO `sgconsejos` VALUES ('26', '6', 'Bueno', 'Con  tu nivel de fuerza eres capas de seguir con un entrenamiento mas intenso y llevar tus niveles mas allá de los normales con una buena alimentación ejercicio.', '2015-03-27 11:35:55');
INSERT INTO `sgconsejos` VALUES ('27', '6', 'Promedio', 'Puedes aumentar tu fuerza con una alimentación a base de proteínas  y siendo constante en tus entrenamiento de pesas, sigue así.', '2015-03-27 16:49:19');
INSERT INTO `sgconsejos` VALUES ('28', '6', 'Pobre', 'Es recomendable que la persona tenga un alimentación rica en proteínas y carbohidratos, con un programa de entrenamiento de pesas.', '2015-03-27 16:47:55');
INSERT INTO `sgconsejos` VALUES ('29', '7', 'Atleta', 'No es fácil estar en este nivel de resistencia, lo cual quiere decir que con tu esfuerzo puedes cumplir cualquier meta que te pongas.', '2015-03-27 17:16:59');
INSERT INTO `sgconsejos` VALUES ('30', '7', 'Excelente', 'Tu nivel de resistencia es excelente, te  invito de hacer uso de ello y llevarte al limite.', '2015-03-27 17:15:02');
INSERT INTO `sgconsejos` VALUES ('31', '7', 'Bueno', 'Tienes un nivel de resistencia bueno, pero aquí con nosotros lo haríamos excelente en poco tiempo a base de tu dedicación diaria.', '2015-03-27 17:12:30');
INSERT INTO `sgconsejos` VALUES ('32', '7', 'Promedio', 'Tu nivel de resistencia podemos mejorarla día con día a base de la intensidad de tus rutinas.', '2015-03-27 17:11:02');
INSERT INTO `sgconsejos` VALUES ('33', '7', 'Pobre', 'Atenderte con rutinas base de poco peso y repetitivas para poder ir estimulando tu resistencia. ', '2015-03-27 16:54:50');
INSERT INTO `sgconsejos` VALUES ('34', '8', 'Atleta', 'Mantienes un estado de flexibilidad excelente, pero recuerda todavía puedes mejorar. Esfuérzate día a día. y seguirás siendo el campeón que eres hoy. Éxito!', '2015-03-27 13:13:59');
INSERT INTO `sgconsejos` VALUES ('35', '8', 'Excelente', 'Es importante estirar durante y después de cada ejercicio para asegurar una mejor recuperación de los músculos y mayor flexibilidad.', '2015-03-27 12:44:54');
INSERT INTO `sgconsejos` VALUES ('36', '8', 'Bueno', 'Es importante que se sigan aplicando estiramientos durante los entrenamientos para una mejor recuperación muscular y flexibilidad..', '2015-03-27 12:43:32');
INSERT INTO `sgconsejos` VALUES ('37', '8', 'Promedio', 'Es recomendable estirar durante y después de cada entrenamiento para aumentar la flexibilidad de la persona.', '2015-03-27 12:42:26');
INSERT INTO `sgconsejos` VALUES ('38', '8', 'Pobre', 'Es recomendable estirar durante y después de cada entrenamiento para aumentar la flexibilidad de la persona.', '2015-03-27 12:42:02');

-- ----------------------------
-- Table structure for `sgdias`
-- ----------------------------
DROP TABLE IF EXISTS `sgdias`;
CREATE TABLE `sgdias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_dia` varchar(250) NOT NULL,
  `desc_dia` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgdias
-- ----------------------------
INSERT INTO `sgdias` VALUES ('1', 'Lunes', 'Lunes');
INSERT INTO `sgdias` VALUES ('2', 'Martes', 'Martes');
INSERT INTO `sgdias` VALUES ('3', 'Miércoles', 'Miercoles');
INSERT INTO `sgdias` VALUES ('4', 'Jueves', 'Jueves');
INSERT INTO `sgdias` VALUES ('5', 'Viernes', 'Viernes');
INSERT INTO `sgdias` VALUES ('6', 'Sábado', 'Sabado');
INSERT INTO `sgdias` VALUES ('7', 'Domingo', 'Domingo');

-- ----------------------------
-- Table structure for `sgejercicios`
-- ----------------------------
DROP TABLE IF EXISTS `sgejercicios`;
CREATE TABLE `sgejercicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuariocreacion` int(11) NOT NULL,
  `id_musculo` int(11) DEFAULT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `nb_ejercicio` varchar(250) NOT NULL,
  `desc_ejercicio` varchar(500) NOT NULL,
  `id_tiporutina` int(1) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgejercicios
-- ----------------------------
INSERT INTO `sgejercicios` VALUES ('1', '1', '1', '5', 'Pesas De Bicep', 'Levantamiento de pesa para biceps', '3', '0');
INSERT INTO `sgejercicios` VALUES ('2', '1', '9', '7', 'Día De Descanso', 'Día De Descanso', '1', '1');
INSERT INTO `sgejercicios` VALUES ('3', '1', '2', '6', 'Pesas Para tricep', 'Levantamiento de pesas para tricep', '3', '0');
INSERT INTO `sgejercicios` VALUES ('4', '1', '24', '13', 'Levantamiento de tronco', 'ejercicio abdominal', '12', '1');
INSERT INTO `sgejercicios` VALUES ('5', '1', '1', '7', 'Lagartijas', 'Ejercicio de lagartijas', '3', '0');
INSERT INTO `sgejercicios` VALUES ('7', '1', '2', '3', 'Repeticiones Ponchador ', 'Repeticiones en la máquina  El ponchador .', '3', '0');
INSERT INTO `sgejercicios` VALUES ('8', '1', '10', '7', 'Lagartijas', 'Ejercicio de lagartijas', '6', '0');
INSERT INTO `sgejercicios` VALUES ('10', '1', '24', '23', 'Levantamiento de tronco c/aparato', 'Ejercicio Abdominal', '12', '1');
INSERT INTO `sgejercicios` VALUES ('11', '1', '24', '13', 'Encogimiento Manos Atras', 'Abdomen ', '12', '1');
INSERT INTO `sgejercicios` VALUES ('12', '1', '24', '13', 'Encogimientos manos al frente', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('13', '1', '24', '13', 'Encogimiento de manos con peso', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('14', '1', '5', '7', 'Squat', 'sentadilla', '4', '0');
INSERT INTO `sgejercicios` VALUES ('15', '1', '24', '13', 'Levantamiento de pierna colgado', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('16', '1', '24', '13', 'Levantamiento de piernas lateral', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('17', '1', '1', '7', 'Predicador con Maquina', 'Ejercicio para biceps', '3', '0');
INSERT INTO `sgejercicios` VALUES ('18', '1', '1', '7', 'predicador', 'adcsdcs', '3', '0');
INSERT INTO `sgejercicios` VALUES ('19', '1', '21', '0', 'gggggg', 'gggg', '9', '0');
INSERT INTO `sgejercicios` VALUES ('20', '1', '1', '13', 'ejercicio1', 'adfasd', '3', '0');
INSERT INTO `sgejercicios` VALUES ('21', '1', '24', '13', 'Lev. de tronco (c/aparato)', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('22', '1', '24', '13', 'Levantamiento de pierna con peso', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('23', '1', '24', '13', 'Levantamiento de pierna acostado con piernas dobladas', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('24', '1', '24', '0', 'Levantamiento de piernas colgado lateral', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('25', '1', '24', '0', 'levantamiento de pierna colgado lateral', 'Trabaja abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('26', '1', '24', '13', 'Levantamiento de pierna sentado con polea', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('27', '1', '24', '13', 'Encogimiento c/p inclinado', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('28', '1', '24', '13', 'Encogimiento c/p horizontal', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('29', '1', '24', '0', 'Giros c/ baston', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('30', '1', '24', '13', 'Crunch piernas cruzadas', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('31', '1', '24', '13', 'Crunch dobles', 'Ejercicio abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('32', '1', '24', '13', 'Crunch p/ oblicuos', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('33', '1', '24', '0', 'Giros c/ baston', 'Trabaja abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('34', '1', '24', '0', 'Giros c/ disco', 'Trabaja abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('35', '1', '24', '0', 'P/ inchas ????', 'Trabaja abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('36', '1', '24', '0', 'Giros c/ baston', 'Trabaja abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('37', '1', '24', '0', 'Giros c/ disco', 'Trabaja abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('38', '1', '24', '0', 'Giros con Baston', 'Ejercicios cintura', '12', '0');
INSERT INTO `sgejercicios` VALUES ('39', '1', '24', '0', 'Giros con Baston', 'Ejercicio de abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('40', '1', '24', '68', 'Giros con Baston', 'Ejercicios de  cintura', '12', '0');
INSERT INTO `sgejercicios` VALUES ('41', '1', '1', '0', 'Prueba de nuevo', 'alksdjalkda', '3', '0');
INSERT INTO `sgejercicios` VALUES ('42', '1', '24', '0', 'Plancha', 'Ejercicio de Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('43', '1', '24', '0', 'Ranitas', 'Ejercicio de abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('44', '1', '24', '0', 'Levantamiento de piernas acostado con piernas dobladas', 'Abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('45', '1', '24', '0', 'Levantamiento de piernas acostado (piernas dobladas)', 'Abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('46', '1', '24', '0', 'Levantamiento de piernas acostado (piernas dobladas)', 'Abdomen', '12', '0');
INSERT INTO `sgejercicios` VALUES ('47', '1', '6', '6', 'Sentadilla libre', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('48', '1', '6', '3', 'Sentadilla con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('49', '1', '6', '28', 'Sentadilla hack', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('50', '1', '6', '30', 'Sentadilla en Smith', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('51', '1', '6', '6', 'Sentadilla frontal', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('52', '1', '6', '0', 'Sentadilla zizzy', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('53', '1', '4', '6', 'Sentadilla piernas abiertas', 'Pierna', '7', '1');
INSERT INTO `sgejercicios` VALUES ('54', '1', '6', '27', 'Sentadilla en maquina', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('55', '1', '6', '29', 'Press de pierna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('56', '1', '6', '0', 'Extensiones ', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('57', '1', '6', '0', 'Extensiones a un pie', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('58', '1', '4', '0', 'Desplantes en smith', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('59', '1', '4', '0', 'Desplantes libre', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('60', '1', '4', '0', 'Desplantes con mancuerna', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('61', '1', '4', '0', 'Desplantes en maquina alternado', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('62', '1', '4', '0', 'Desplantes caminando', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('63', '1', '4', '0', 'Desplantes con Step', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('64', '1', '4', '0', 'Desplantes con Step atras del cuerpo', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('65', '1', '4', '0', 'Desplantes al frente', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('66', '1', '4', '0', 'Desplantes con banca', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('67', '1', '4', '0', 'Desplantes lateral', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('68', '1', '6', '29', 'Press de pierna (prensa)', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('69', '1', '6', '29', 'Press de pierna (prensa) a un pie', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('70', '1', '6', '29', 'Press de pierna vertical', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('71', '1', '6', '15', 'Press de pierna (prensa) horizontal', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('72', '1', '6', '29', 'Press de pierna (prensa) inclinado', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('73', '1', '6', '16', 'Extensiones ', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('74', '1', '6', '16', 'Extensiones a un pie', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('75', '1', '6', '3', 'Desplantes en smith ', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('76', '1', '6', '3', 'Desplantes libre', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('77', '1', '6', '3', 'Desplantes con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('78', '1', '6', '27', 'Desplantes en maquina alternado', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('79', '1', '6', '3', 'Desplantes caminando ', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('80', '1', '6', '3', 'Desplantes con Step atras del cuerpo', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('81', '1', '6', '3', 'Desplantes al frente con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('82', '1', '6', '6', 'Desplantes al frente con barra', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('83', '1', '6', '3', 'Desplantes al frente en step', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('84', '1', '6', '3', 'Desplantes en banca con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('85', '1', '6', '6', 'Desplantes en banca con barra', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('86', '1', '6', '3', 'Desplantes en banca con step', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('87', '1', '6', '3', 'Desplantes lateral con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('88', '1', '6', '3', 'Desplantes lateral con barra', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('89', '1', '6', '3', 'Desplantes lateral con step', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('90', '1', '5', '22', 'Curl femoral parado', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('91', '1', '4', '0', 'Curl femoral sentado', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('92', '1', '4', '0', 'Curl femoral acostado', 'Pierna', '7', '0');
INSERT INTO `sgejercicios` VALUES ('93', '1', '5', '0', 'Curl femoral inclinado', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('94', '1', '5', '0', 'Curl femoral sentado', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('95', '1', '5', '42', 'Curl femoral acostado', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('96', '1', '5', '0', 'Curl femoral inclinado', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('97', '1', '5', '13', 'Curl acostado con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('98', '1', '5', '42', 'Curl a un pie', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('99', '1', '5', '0', 'Curl con toalla', 'Pierna', '4', '0');
INSERT INTO `sgejercicios` VALUES ('100', '1', '5', '5', 'Peso muerto con mancuernas', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('101', '1', '5', '5', 'Peso muerto con barra', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('102', '1', '5', '5', 'Peso muerto con step', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('103', '1', '6', '3', 'Multi-hip ', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('104', '1', '4', '0', 'Multi-hip lateral', 'Pierna', '7', '1');
INSERT INTO `sgejercicios` VALUES ('105', '1', '4', '0', 'Levatamiento de pierna con peso inclinado', 'Pierna', '7', '1');
INSERT INTO `sgejercicios` VALUES ('106', '1', '4', '0', 'Levantamiento de piernas con peso sentado', 'Pierna', '7', '1');
INSERT INTO `sgejercicios` VALUES ('107', '1', '4', '0', 'Levantamiento de piernas con peso lateral', 'Pierna', '7', '1');
INSERT INTO `sgejercicios` VALUES ('108', '1', '18', '25', 'Abductor', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('109', '1', '19', '26', 'Adductor', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('110', '1', '4', '14', 'Maquina de gluteo', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('111', '1', '10', '5', 'Press horizontal con mancuerna', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('112', '1', '10', '5', 'Press horizontal con barra', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('113', '1', '10', '30', 'Press horizontal en smith', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('114', '1', '10', '5', 'Press inclinado con mancuern', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('115', '1', '10', '5', 'Press inclinado con barra', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('116', '1', '10', '30', 'Press inclinado con smith ', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('117', '1', '10', '5', 'Press declinado con mancuerna', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('118', '1', '10', '5', 'Press declinado con barra', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('119', '1', '10', '30', 'Press declinado con smith', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('120', '1', '10', '17', 'Press en maquina horizontal', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('121', '1', '10', '17', 'Press en maquina inclinado', 'Pecho ', '6', '1');
INSERT INTO `sgejercicios` VALUES ('122', '1', '10', '17', 'Press en maquina vertical ', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('123', '1', '10', '5', 'Pull over con mancuerna inclinado', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('124', '1', '10', '0', 'Pull over en aparato', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('125', '1', '10', '21', 'Peck-fly', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('126', '1', '10', '1', 'Crossover', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('127', '1', '10', '0', 'Cristos horizontal', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('128', '1', '10', '0', 'Cristos inclinado', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('129', '1', '10', '0', 'Cristo declinado', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('130', '1', '10', '5', 'Cristo horizontal con mancuerna', 'Pecho ', '6', '1');
INSERT INTO `sgejercicios` VALUES ('131', '1', '10', '5', 'Cristo inclinado con mancuerna', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('132', '1', '10', '5', 'Cristos declinado con mancuerna', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('133', '1', '10', '36', 'Cristos horizontal con polea', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('134', '1', '10', '36', 'Cristo inclinado con polea', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('135', '1', '10', '37', 'Cristos declinado con polea', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('136', '1', '10', '37', 'Cruzadas con cable (polea baja)', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('137', '1', '10', '0', 'Fondos en barras con peso', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('138', '1', '10', '0', 'Fondos en barras sin peso', 'Pecho', '6', '0');
INSERT INTO `sgejercicios` VALUES ('139', '1', '10', '19', 'Fondos en barras con peso', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('140', '1', '10', '19', 'Fondos en barras sin peso', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('141', '1', '10', '20', 'Fondos en barras con maquina', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('142', '1', '12', '5', 'Encogimientos con barra', 'Trapecio', '5', '1');
INSERT INTO `sgejercicios` VALUES ('143', '1', '12', '5', 'Encogimientos con mancuerna', 'Trapecio', '5', '1');
INSERT INTO `sgejercicios` VALUES ('144', '1', '12', '30', 'Encogimientos en smith', 'Trapecio', '5', '1');
INSERT INTO `sgejercicios` VALUES ('145', '1', '12', '5', 'Crossover con mancuerna', 'Trapecio', '5', '1');
INSERT INTO `sgejercicios` VALUES ('146', '1', '12', '5', 'Crossover sentado', 'Trapecio', '5', '1');
INSERT INTO `sgejercicios` VALUES ('147', '1', '12', '0', 'Crossover con maquina', 'Trapecio', '5', '0');
INSERT INTO `sgejercicios` VALUES ('148', '1', '3', '5', 'Press con barra', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('149', '1', '3', '5', 'Press con mancuerna', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('150', '1', '3', '30', 'Press en smith', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('151', '1', '3', '36', 'Press con polea', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('152', '1', '3', '5', 'Press alternado', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('153', '1', '3', '15', 'Press en maquina', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('154', '1', '3', '30', 'Press militar en smith', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('155', '1', '3', '3', 'Press militar con barra ', 'Deltoides', '5', '0');
INSERT INTO `sgejercicios` VALUES ('156', '1', '3', '5', 'Press militar con barra', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('157', '1', '3', '5', 'Press arnold de pie ', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('158', '1', '3', '36', 'Press arnold con polea', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('159', '1', '3', '5', 'Levantamiento laterales con mancuerna', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('160', '1', '3', '36', 'Levantamiento laterales con polea', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('161', '1', '3', '0', 'Levantamiento laterales con aparato', 'Deltoides', '5', '0');
INSERT INTO `sgejercicios` VALUES ('162', '1', '3', '0', 'Levantamiento frontal con barra romana', 'Deltoides', '5', '0');
INSERT INTO `sgejercicios` VALUES ('163', '1', '3', '5', 'Levantamiento frontal con mancuerna', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('164', '1', '3', '36', 'Levantamiento frontal con polea', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('165', '1', '3', '36', 'Levantamiento frontal con cuerda', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('166', '1', '3', '5', 'Laterales inclinado en banco con mancuernas', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('167', '1', '3', '36', 'Laterales inclinado en banco con polea', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('168', '1', '3', '21', 'Peck-fly invertido', 'Deltoides', '5', '1');
INSERT INTO `sgejercicios` VALUES ('169', '1', '1', '5', 'Curl con barra', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('170', '1', '1', '36', 'Curl con polea', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('171', '1', '1', '36', 'Curl con cuerda', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('172', '1', '1', '5', 'Curl con barra romana', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('173', '1', '1', '5', 'Curl alternado con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('174', '1', '1', '36', 'Curl simultaneo con cuerda', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('175', '1', '1', '36', 'Curl simultaneo con polea', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('176', '1', '1', '5', 'Curl con mancuerna inclinado ', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('177', '1', '1', '5', 'Curl scott con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('178', '1', '1', '5', 'Curl scott simultaneo con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('179', '1', '1', '5', 'Curl scott con barra', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('180', '1', '1', '45', 'Curl scott simultaneo con aparato', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('181', '1', '1', '45', 'Curl scott en aparato ', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('182', '1', '1', '5', 'Curl concentrado con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('183', '1', '1', '5', 'Curl concentrado con barra', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('184', '1', '1', '36', 'Curl concentrado con polea', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('185', '1', '1', '36', 'Curl concentrado con cuerda', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('186', '1', '1', '36', 'Press frances con polea', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('187', '1', '1', '36', 'Press frances con cuerda invertido', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('188', '1', '1', '5', 'Curl martillo con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('189', '1', '15', '36', 'Extencion de triceps con polea', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('190', '1', '15', '36', 'Extension de triceps con cuerda', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('191', '1', '15', '5', 'Extension de triceps a una mano ', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('192', '1', '15', '5', 'Press frances sentado con barra', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('193', '1', '15', '36', 'Press frances sentado con polea', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('194', '1', '15', '38', 'Press frances sentado con aparato', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('195', '1', '15', '19', 'Fondos en barras', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('196', '1', '15', '20', 'Fondos en maquina', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('197', '1', '15', '13', 'Fondos en bancas', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('198', '1', '15', '5', 'Copa a una mano', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('199', '1', '15', '5', 'Copa a dos manos', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('200', '1', '15', '5', 'Kick backs simultaneo con mancuerna', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('201', '1', '15', '36', 'Kick backs simultaneo con polea', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('202', '1', '15', '36', 'Kick backs simultaneo con cuerda', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('203', '1', '15', '5', 'Press agarre cerrado', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('204', '1', '15', '5', 'Press frances parado', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('205', '1', '15', '5', 'Press frances acostado con mancuerna', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('206', '1', '15', '5', 'Press frances acostado con barra', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('207', '1', '15', '36', 'Press frances acostado con polea', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('208', '1', '15', '0', 'Extensiones de triceps invertido', 'Triceps', '10', '0');
INSERT INTO `sgejercicios` VALUES ('209', '1', '15', '5', 'Extension de triceps invertido', 'Triceps ', '10', '1');
INSERT INTO `sgejercicios` VALUES ('210', '1', '22', '0', 'prueba am', 'prueba am', '9', '0');
INSERT INTO `sgejercicios` VALUES ('211', '1', '12', '0', 'prueba e', 'tricrhg', '5', '0');
INSERT INTO `sgejercicios` VALUES ('212', '1', '15', '36', 'Extension de triceps con maneral D', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('213', '1', '16', '5', 'Curl invertido con mancuerna', 'Antebrazo', '3', '1');
INSERT INTO `sgejercicios` VALUES ('214', '1', '16', '5', 'Curl invertido con barra', 'Antebrazo', '3', '1');
INSERT INTO `sgejercicios` VALUES ('215', '1', '16', '36', 'Curl invertido con polea', 'Antebrazo', '3', '1');
INSERT INTO `sgejercicios` VALUES ('216', '1', '16', '5', 'Curl martillo con mancuerna', 'Antebrazo', '3', '1');
INSERT INTO `sgejercicios` VALUES ('217', '1', '16', '36', 'Curl martillo con cuerda', 'Antebrazo', '3', '1');
INSERT INTO `sgejercicios` VALUES ('218', '1', '11', '0', 'Gemelos parado ', 'Gemelos', '4', '0');
INSERT INTO `sgejercicios` VALUES ('219', '1', '11', '0', 'Gemelos inclinado', 'Gemelos', '4', '0');
INSERT INTO `sgejercicios` VALUES ('220', '1', '11', '5', 'Gemelos parado con mancuerna ', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('221', '1', '11', '32', 'Gemelos parado con aparato', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('222', '1', '11', '5', 'Gemelos inclinado con mancuerna', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('223', '1', '11', '29', 'Gemelos inclinado con aparato', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('224', '1', '11', '5', 'Gemelos a un pie con mancuerna', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('225', '1', '11', '27', 'Gemelos a un pie con aparato', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('226', '1', '11', '32', 'Gemelos sentado', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('227', '1', '11', '28', 'Gemelos en hack ', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('228', '1', '11', '28', 'Gemelos en hack a un pie', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('229', '1', '11', '30', 'Gemelos en smith ', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('230', '1', '11', '0', 'Gemelos en press', 'Gemelos ', '4', '0');
INSERT INTO `sgejercicios` VALUES ('231', '1', '11', '0', 'Gemelos en press a un pie', 'Gemelos', '4', '0');
INSERT INTO `sgejercicios` VALUES ('232', '1', '11', '15', 'Gemelos en press horizontal ', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('233', '1', '11', '29', 'Gemelos en press inclinado ', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('234', '1', '11', '0', 'Gemelos en press vertical', 'Gemelos', '4', '0');
INSERT INTO `sgejercicios` VALUES ('235', '1', '11', '15', 'Gemelos en press horizontal a un pie', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('236', '1', '11', '0', 'Gemelos en press inclinado a un pie', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('237', '1', '11', '0', 'Gemelos en press vertical a un pie', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('238', '1', '11', '28', 'Gemelos en hack a un pie ', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('239', '1', '11', '0', 'Gemelos en hack horizontal ', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('240', '1', '11', '0', 'Gemelos en hack inclinado', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('241', '1', '11', '0', 'Gemelos en hack vertical', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('242', '1', '11', '0', 'Gemelos en burro ', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('243', '1', '11', '0', 'Gemelos en burro a un pie', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('244', '1', '11', '0', 'Elevacion de talon parado', 'Gemelos ', '4', '1');
INSERT INTO `sgejercicios` VALUES ('245', '1', '22', '39', 'Jalon a la nuca', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('246', '1', '22', '39', 'Jalon al frente', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('247', '1', '22', '39', 'Jalon con barra maneral D', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('248', '1', '22', '39', 'Jalon agarre invertido', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('249', '1', '22', '39', 'Jalon con agarre cerrado', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('250', '1', '22', '5', 'Remo con con barra ', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('251', '1', '22', '5', 'Remo con barra agarre invertido', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('252', '1', '22', '5', 'Remo con mancuerna', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('253', '1', '22', '5', 'Remo con mancuernaa un mano', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('254', '1', '22', '41', 'Remo sentado agarre cerrado con polea', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('255', '1', '22', '41', 'Remo sentado agarre abierto con polea', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('256', '1', '22', '1', 'Dominadas con peso', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('257', '1', '22', '1', 'Dominadas sin peso', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('258', '1', '21', '5', 'Peso muerto con mancuerna', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('259', '1', '21', '5', 'Peso muerto con barra', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('260', '1', '21', '5', 'Peso muerto con mancuerna en step', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('261', '1', '21', '5', 'Peso muerto con barra en step', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('262', '1', '21', '13', 'Extensiones con peso', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('263', '1', '21', '13', 'Extensiones con giros', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('264', '1', '21', '13', 'Extensiones laterales sin peso', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('265', '1', '21', '13', 'Extensiones laterales sin peso', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('266', '1', '21', '13', 'Extensiones laterales con peso', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('267', '1', '21', '5', 'Good morning con barra', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('268', '1', '21', '36', 'Levantamientos laterales con polea', 'Espalda baja', '9', '1');
INSERT INTO `sgejercicios` VALUES ('269', '1', '10', '5', 'Cristos inclinado con mancuerna', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('270', '1', '10', '5', 'Cristos horizontal con mancuerna', 'Pecho ', '6', '1');
INSERT INTO `sgejercicios` VALUES ('271', '1', '10', '36', 'Cristos inclinado con polea', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('272', '1', '13', '0', 'Escoge tu clase', 'Cualquier clase ', '2', '1');
INSERT INTO `sgejercicios` VALUES ('273', '1', '10', '0', 'cosa', 'cochapacha', '6', '0');
INSERT INTO `sgejercicios` VALUES ('274', '1', '10', '1', 'cochapacha', 'cochapcha', '6', '0');
INSERT INTO `sgejercicios` VALUES ('275', '1', '24', '13', 'Levantamiento de piernas dobladas ', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('276', '1', '24', '44', 'Hiperextensiones', 'Espalda baja', '12', '1');
INSERT INTO `sgejercicios` VALUES ('277', '1', '22', '41', 'Remo con polea', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('278', '1', '10', '0', 'Lagartijas', 'Pecho', '6', '1');
INSERT INTO `sgejercicios` VALUES ('279', '1', '22', '39', 'Polea con triangulo', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('280', '1', '6', '6', 'Sentadilla pies juntos', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('281', '1', '6', '6', 'Sentadilla pies separados', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('282', '1', '4', '14', 'Extencion de Gluteo', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('283', '1', '26', '10', 'Caminadora', 'adada', '11', '1');
INSERT INTO `sgejercicios` VALUES ('284', '1', '26', '65', 'Eliptica', 'Cardio', '11', '1');
INSERT INTO `sgejercicios` VALUES ('285', '1', '26', '66', 'Escaladora', 'Cardio', '11', '1');
INSERT INTO `sgejercicios` VALUES ('286', '1', '26', '67', 'Bicicleta Estacionaria', 'Cardio', '11', '1');
INSERT INTO `sgejercicios` VALUES ('287', '1', '26', '56', 'Cuerda para brincar', 'Cardio', '11', '1');
INSERT INTO `sgejercicios` VALUES ('288', '1', '26', '64', 'Remo', 'Cardio', '11', '1');
INSERT INTO `sgejercicios` VALUES ('289', '1', '24', '5', 'Laterales c/mancuerna oblicuos', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('290', '1', '26', '0', 'SPX/Crossfit', 'Crossfit', '11', '0');
INSERT INTO `sgejercicios` VALUES ('291', '1', '27', '0', 'SPX/Crossfit', 'Crossfit', '2', '1');
INSERT INTO `sgejercicios` VALUES ('292', '1', '27', '0', 'Yoga', 'Yoga', '2', '1');
INSERT INTO `sgejercicios` VALUES ('293', '1', '27', '8', 'Power Training', 'Power training', '2', '1');
INSERT INTO `sgejercicios` VALUES ('294', '1', '27', '8', 'Tae bo', 'Tae bo', '2', '0');
INSERT INTO `sgejercicios` VALUES ('295', '1', '27', '8', 'Spinning', 'Spinning', '2', '1');
INSERT INTO `sgejercicios` VALUES ('296', '1', '27', '8', 'Pilates', 'Pilates', '2', '1');
INSERT INTO `sgejercicios` VALUES ('297', '1', '27', '8', 'Zumba', 'Zumba', '2', '1');
INSERT INTO `sgejercicios` VALUES ('298', '1', '27', '8', 'Box', 'Box', '2', '1');
INSERT INTO `sgejercicios` VALUES ('299', '1', '27', '8', 'Taeboo', 'Taeboo', '2', '1');
INSERT INTO `sgejercicios` VALUES ('300', '1', '24', '8', 'Extensiones laterales', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('301', '1', '24', '8', 'Extensiones con giros', 'Abodomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('302', '1', '24', '8', 'Levantamiento de piernas sentado', 'Abdomen ', '12', '1');
INSERT INTO `sgejercicios` VALUES ('303', '1', '1', '3', 'Curl con mancuerna', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('304', '1', '24', '8', 'Crunch', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('305', '1', '5', '3', 'Serntadilla zumo con mancuerna', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('306', '1', '5', '6', 'Sentadilla zumo con barra', 'Pierna', '4', '1');
INSERT INTO `sgejercicios` VALUES ('307', '1', '24', '0', 'PLANKS', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('308', '1', '22', '41', 'Remo sentado agarre invertido', 'Espalda', '9', '1');
INSERT INTO `sgejercicios` VALUES ('309', '1', '1', '6', 'Curl parado con  barra z agarre abierto', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('310', '1', '1', '6', 'Curl parado barra z agarre abierto', 'Biceps', '3', '1');
INSERT INTO `sgejercicios` VALUES ('311', '1', '12', '3', 'Kick backs a dos manos', 'Triceps', '5', '1');
INSERT INTO `sgejercicios` VALUES ('312', '1', '15', '3', 'Kick backs a dos manos', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('313', '1', '11', '29', 'Gemelos en prensa', 'Gemelos', '4', '1');
INSERT INTO `sgejercicios` VALUES ('314', '1', '24', '0', 'Tijeras', 'Abdomen', '12', '1');
INSERT INTO `sgejercicios` VALUES ('315', '1', '20', '6', 'Remo al metòn', 'Hombro', '5', '1');
INSERT INTO `sgejercicios` VALUES ('316', '1', '15', '6', 'Copa dos manos con barra z', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('317', '1', '15', '3', 'Copa dos manos con mancuerna', 'Triceps', '10', '1');
INSERT INTO `sgejercicios` VALUES ('324', '1', '0', '0', 'Chocobanana de la muerte', 'Chocobananoso mortal', '8', '0');
INSERT INTO `sgejercicios` VALUES ('325', '1', '1', '64', 'Chocochocho', 'cochapacha de la muerte', '3', '0');
INSERT INTO `sgejercicios` VALUES ('326', '1', '9', '0', 'asdasda', 'adad', '1', '0');

-- ----------------------------
-- Table structure for `sgejerciciosrutina`
-- ----------------------------
DROP TABLE IF EXISTS `sgejerciciosrutina`;
CREATE TABLE `sgejerciciosrutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ejercicio` int(11) NOT NULL,
  `id_usuariocreacion` int(11) NOT NULL,
  `id_dia` int(11) DEFAULT NULL,
  `id_rutina` int(11) DEFAULT NULL,
  `id_categoriarutina` int(11) DEFAULT NULL,
  `id_tiporutinaejercicio` int(11) DEFAULT NULL,
  `id_posicionejercicio` int(11) DEFAULT NULL,
  `nb_ejerciciorutina` varchar(250) DEFAULT NULL,
  `desc_ejerciciorutina` varchar(500) DEFAULT NULL,
  `num_circuitos` varchar(100) DEFAULT NULL,
  `num_repeticiones` varchar(100) DEFAULT NULL,
  `ejercicio_relacion` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3757 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgejerciciosrutina
-- ----------------------------
INSERT INTO `sgejerciciosrutina` VALUES ('1', '1', '1', '1', '50', '1', '3', '1', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2', '3', '1', '1', '50', '1', '3', '2', null, null, '4', '18', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3', '5', '1', '1', '50', '1', '3', '3', null, null, '5', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('4', '7', '1', '1', '50', '1', '3', '4', null, null, '4', '25', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('5', '10', '1', '1', '50', '1', '4', '5', null, null, '4', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('6', '11', '1', '1', '50', '1', '5', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('7', '1', '1', '2', '50', '1', '3', '7', null, null, '4', '7', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('8', '3', '1', '2', '50', '1', '3', '8', null, null, '4', '9', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('9', '5', '1', '2', '50', '1', '3', '9', null, null, '4', '11', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('10', '7', '1', '2', '50', '1', '3', '10', null, null, '4', '5', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('11', '10', '1', '2', '50', '1', '4', '11', null, null, '4', '6', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('12', '11', '1', '2', '50', '1', '5', '12', null, null, '4', '8', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('13', '12', '1', '3', '50', '1', '2', '13', null, null, '4', '4', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('14', '11', '1', '4', '50', '1', '5', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('15', '4', '1', '5', '50', '1', '6', '15', null, null, '3', '18', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('16', '2', '1', '6', '50', '1', '1', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('17', '2', '1', '7', '50', '1', '1', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('18', '1', '1', '1', '52', '3', '3', '1', null, null, '3', '18', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('19', '3', '1', '1', '52', '3', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('20', '5', '1', '1', '52', '3', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('21', '7', '1', '1', '52', '3', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('22', '10', '1', '1', '52', '3', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('23', '11', '1', '1', '52', '3', '5', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('24', '12', '1', '2', '52', '3', '2', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('25', '1', '1', '3', '52', '3', '3', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('26', '3', '1', '3', '52', '3', '3', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('27', '5', '1', '3', '52', '3', '3', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('28', '7', '1', '3', '52', '3', '3', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('29', '10', '1', '3', '52', '3', '4', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('30', '11', '1', '3', '52', '3', '5', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('31', '10', '1', '4', '52', '3', '4', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('32', '4', '1', '5', '52', '3', '6', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('33', '2', '1', '6', '52', '3', '1', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('34', '2', '1', '7', '52', '3', '1', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('219', '1', '1', '1', '56', '2', '3', '1', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('220', '3', '1', '1', '56', '2', '3', '4', null, null, '3', '13', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('221', '5', '1', '1', '56', '2', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('222', '7', '1', '1', '56', '2', '3', '5', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('223', '10', '1', '1', '56', '2', '4', '5', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('224', '11', '1', '1', '56', '2', '5', '6', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('225', '12', '1', '2', '56', '2', '2', '7', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('226', '13', '1', '3', '56', '2', '7', '8', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('227', '1', '1', '4', '56', '2', '3', '12', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('228', '3', '1', '4', '56', '2', '3', '10', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('229', '5', '1', '4', '56', '2', '3', '13', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('230', '7', '1', '4', '56', '2', '3', '14', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('231', '10', '1', '4', '56', '2', '4', '9', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('232', '11', '1', '4', '56', '2', '5', '11', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('233', '12', '1', '5', '56', '2', '2', '15', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('234', '2', '1', '6', '56', '2', '1', '16', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('235', '12', '1', '7', '56', '2', '2', '17', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('254', '10', '9', '2', '57', '1', '4', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('255', '4', '9', '2', '57', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('256', '10', '9', '3', '57', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('257', '11', '9', '4', '57', '1', '5', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('258', '4', '9', '4', '57', '1', '6', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('259', '13', '9', '4', '57', '1', '7', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('260', '12', '9', '5', '57', '1', '2', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('261', '2', '9', '6', '57', '1', '1', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('262', '2', '9', '7', '57', '1', '1', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('263', '1', '1', '1', '60', '2', '3', '1', null, null, '3', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('264', '3', '1', '1', '60', '2', '3', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('265', '5', '1', '1', '60', '2', '3', '4', null, null, '2', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('266', '7', '1', '1', '60', '2', '3', '5', null, null, '2', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('267', '10', '1', '1', '60', '2', '4', '6', null, null, '2', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('268', '11', '1', '1', '60', '2', '5', '3', null, null, '2', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('269', '11', '1', '2', '60', '2', '5', '7', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('270', '10', '1', '3', '60', '2', '4', '9', null, null, '4', '14', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('271', '11', '1', '3', '60', '2', '5', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('272', '4', '1', '3', '60', '2', '6', '10', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('273', '12', '1', '4', '60', '2', '2', '11', null, null, '2', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('274', '13', '1', '5', '60', '2', '7', '12', null, null, '2', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('275', '2', '1', '6', '60', '2', '1', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('276', '2', '1', '7', '60', '2', '1', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('277', '1', '1', '1', '50', '1', '3', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('278', '3', '1', '1', '50', '1', '3', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('279', '5', '1', '1', '50', '1', '3', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('280', '7', '1', '1', '50', '1', '3', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('281', '4', '1', '1', '50', '1', '6', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('282', '13', '1', '1', '50', '1', '7', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('283', '12', '1', '5', '50', '1', '2', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('305', '1', '1', '1', '56', '2', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('306', '3', '1', '1', '56', '2', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('307', '5', '1', '1', '56', '2', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('308', '7', '1', '1', '56', '2', '3', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('309', '11', '1', '1', '56', '2', '5', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('310', '13', '1', '1', '56', '2', '7', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('322', '12', '1', '3', '56', '2', '2', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('323', '2', '1', '1', '0', '3', '1', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('324', '12', '1', '2', '61', '3', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('325', '10', '1', '2', '61', '3', '4', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('326', '12', '1', '3', '61', '3', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('327', '5', '1', '4', '61', '3', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('328', '2', '1', '5', '61', '3', '1', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('329', '2', '1', '6', '61', '3', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('330', '10', '1', '7', '61', '3', '4', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('331', '1', '1', '1', '62', '1', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('332', '3', '1', '1', '62', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('333', '5', '1', '1', '62', '1', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('334', '7', '1', '1', '62', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('335', '15', '1', '2', '62', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('336', '1', '1', '3', '62', '1', '3', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('337', '3', '1', '3', '62', '1', '3', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('338', '5', '1', '3', '62', '1', '3', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('339', '7', '1', '3', '62', '1', '3', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('340', '11', '1', '3', '62', '1', '5', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('341', '4', '1', '3', '62', '1', '6', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('342', '12', '1', '4', '62', '1', '2', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('343', '4', '1', '5', '62', '1', '6', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('344', '13', '1', '5', '62', '1', '7', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('345', '16', '1', '5', '62', '1', '9', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('346', '2', '1', '6', '62', '1', '1', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('347', '2', '1', '7', '62', '1', '1', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('348', '1', '1', '2', '63', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('349', '3', '1', '2', '63', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('350', '5', '1', '2', '63', '1', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('351', '7', '1', '2', '63', '1', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('352', '10', '1', '2', '63', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('353', '11', '1', '2', '63', '1', '5', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('354', '10', '1', '3', '63', '1', '4', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('355', '4', '1', '4', '63', '1', '6', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('356', '13', '1', '4', '63', '1', '7', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('357', '16', '1', '4', '63', '1', '9', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('358', '12', '1', '5', '63', '1', '2', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('359', '2', '1', '6', '63', '1', '1', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('360', '2', '1', '7', '63', '1', '1', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('361', '2', '1', '3', '0', '3', '1', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('362', '2', '1', '5', '0', '3', '1', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('363', '2', '1', '1', '0', '3', '1', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('364', '1', '1', '2', '64', '3', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('365', '10', '1', '2', '64', '3', '4', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('366', '2', '1', '3', '64', '3', '1', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('367', '15', '1', '4', '64', '3', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('368', '2', '1', '5', '64', '3', '1', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('369', '2', '1', '6', '64', '3', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('370', '11', '1', '7', '64', '3', '5', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('371', '12', '1', '1', '0', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('372', '17', '1', '2', '65', '1', '3', '1', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('373', '10', '1', '3', '65', '1', '4', '2', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('374', '11', '1', '3', '65', '1', '5', '3', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('375', '2', '1', '4', '65', '1', '1', '4', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('376', '4', '1', '5', '65', '1', '6', '5', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('377', '2', '1', '6', '65', '1', '1', '6', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('378', '2', '1', '7', '65', '1', '1', '7', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('379', '1', '1', '1', '65', '1', '3', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('380', '17', '1', '1', '65', '1', '3', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('381', '10', '1', '2', '66', '1', '4', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('382', '2', '1', '3', '66', '1', '1', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('383', '4', '1', '4', '66', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('384', '17', '1', '5', '66', '1', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('385', '2', '1', '6', '66', '1', '1', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('386', '2', '1', '7', '66', '1', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('387', '10', '1', '1', '68', '1', '4', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('388', '11', '1', '1', '68', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('389', '17', '1', '1', '69', '1', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('390', '20', '1', '1', '69', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('391', '11', '1', '1', '69', '1', '5', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('392', '16', '1', '1', '69', '1', '9', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('393', '4', '1', '2', '69', '1', '6', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('394', '11', '1', '3', '69', '1', '5', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('395', '15', '1', '4', '69', '1', '2', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('396', '10', '1', '5', '69', '1', '4', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('397', '11', '1', '5', '69', '1', '5', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('398', '4', '1', '5', '69', '1', '6', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('399', '2', '1', '6', '69', '1', '1', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('400', '2', '1', '7', '69', '1', '1', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('401', '4', '1', '1', '70', '1', '12', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('402', '10', '1', '1', '70', '1', '12', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('403', '11', '1', '1', '70', '1', '12', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('404', '111', '1', '2', '70', '1', '6', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('405', '112', '1', '2', '70', '1', '6', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('406', '113', '1', '2', '70', '1', '6', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('407', '114', '1', '2', '70', '1', '6', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('408', '142', '1', '3', '70', '1', '5', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('409', '143', '1', '3', '70', '1', '5', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('410', '144', '1', '3', '70', '1', '5', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('411', '145', '1', '3', '70', '1', '5', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('412', '245', '1', '3', '70', '1', '9', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('413', '246', '1', '3', '70', '1', '9', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('414', '247', '1', '3', '70', '1', '9', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('415', '189', '1', '3', '70', '1', '10', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('416', '190', '1', '3', '70', '1', '10', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('417', '191', '1', '3', '70', '1', '10', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('418', '113', '1', '4', '70', '1', '6', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('419', '115', '1', '4', '70', '1', '6', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('420', '117', '1', '4', '70', '1', '6', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('421', '118', '1', '4', '70', '1', '6', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('422', '119', '1', '4', '70', '1', '6', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('423', '272', '1', '5', '70', '1', '2', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('424', '2', '1', '6', '70', '1', '1', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('425', '2', '1', '7', '70', '1', '1', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('426', '177', '1', '1', '71', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('427', '188', '1', '1', '71', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('428', '181', '1', '1', '71', '1', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('429', '188', '1', '1', '71', '1', '3', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('430', '73', '1', '1', '71', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('431', '95', '1', '1', '71', '1', '4', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('432', '159', '1', '1', '71', '1', '5', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('433', '163', '1', '1', '71', '1', '5', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('434', '120', '1', '1', '71', '1', '6', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('435', '122', '1', '1', '71', '1', '6', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('436', '245', '1', '1', '71', '1', '9', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('437', '246', '1', '1', '71', '1', '9', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('438', '196', '1', '1', '71', '1', '10', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('439', '199', '1', '1', '71', '1', '10', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('440', '4', '1', '1', '71', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('441', '26', '1', '1', '71', '1', '12', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('442', '181', '1', '1', '73', '1', '3', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('443', '216', '1', '1', '73', '1', '3', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('444', '73', '1', '1', '73', '1', '4', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('445', '95', '1', '1', '73', '1', '4', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('446', '226', '1', '1', '73', '1', '4', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('447', '159', '1', '1', '73', '1', '5', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('448', '163', '1', '1', '73', '1', '5', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('449', '120', '1', '1', '73', '1', '6', '1', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('450', '122', '1', '1', '73', '1', '6', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('451', '245', '1', '1', '73', '1', '9', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('452', '246', '1', '1', '73', '1', '9', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('453', '196', '1', '1', '73', '1', '10', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('454', '199', '1', '1', '73', '1', '10', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('455', '4', '1', '1', '73', '1', '12', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('456', '26', '1', '1', '73', '1', '12', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('457', '181', '1', '2', '73', '1', '3', '22', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('458', '216', '1', '2', '73', '1', '3', '23', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('459', '73', '1', '2', '73', '1', '4', '26', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('460', '95', '1', '2', '73', '1', '4', '27', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('461', '226', '1', '2', '73', '1', '4', '28', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('462', '159', '1', '2', '73', '1', '5', '20', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('463', '163', '1', '2', '73', '1', '5', '21', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('464', '120', '1', '2', '73', '1', '6', '18', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('465', '122', '1', '2', '73', '1', '6', '19', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('466', '245', '1', '2', '73', '1', '9', '16', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('467', '246', '1', '2', '73', '1', '9', '17', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('468', '196', '1', '2', '73', '1', '10', '24', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('469', '199', '1', '2', '73', '1', '10', '25', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('470', '4', '1', '2', '73', '1', '12', '29', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('471', '26', '1', '2', '73', '1', '12', '30', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('472', '181', '1', '3', '73', '1', '3', '37', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('473', '216', '1', '3', '73', '1', '3', '38', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('474', '73', '1', '3', '73', '1', '4', '41', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('475', '95', '1', '3', '73', '1', '4', '42', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('476', '226', '1', '3', '73', '1', '4', '43', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('477', '159', '1', '3', '73', '1', '5', '35', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('478', '163', '1', '3', '73', '1', '5', '36', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('479', '120', '1', '3', '73', '1', '6', '33', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('480', '122', '1', '3', '73', '1', '6', '34', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('481', '245', '1', '3', '73', '1', '9', '31', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('482', '246', '1', '3', '73', '1', '9', '32', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('483', '196', '1', '3', '73', '1', '10', '39', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('484', '199', '1', '3', '73', '1', '10', '40', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('485', '4', '1', '3', '73', '1', '12', '44', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('486', '26', '1', '3', '73', '1', '12', '45', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('487', '181', '1', '4', '73', '1', '3', '52', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('488', '216', '1', '4', '73', '1', '3', '53', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('489', '73', '1', '4', '73', '1', '4', '56', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('490', '95', '1', '4', '73', '1', '4', '57', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('491', '226', '1', '4', '73', '1', '4', '58', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('492', '159', '1', '4', '73', '1', '5', '50', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('493', '163', '1', '4', '73', '1', '5', '51', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('494', '120', '1', '4', '73', '1', '6', '48', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('495', '122', '1', '4', '73', '1', '6', '49', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('496', '245', '1', '4', '73', '1', '9', '46', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('497', '246', '1', '4', '73', '1', '9', '47', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('498', '196', '1', '4', '73', '1', '10', '54', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('499', '199', '1', '4', '73', '1', '10', '55', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('500', '4', '1', '4', '73', '1', '12', '59', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('501', '26', '1', '4', '73', '1', '12', '60', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('502', '181', '1', '5', '73', '1', '3', '67', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('503', '216', '1', '5', '73', '1', '3', '68', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('504', '73', '1', '5', '73', '1', '4', '71', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('505', '95', '1', '5', '73', '1', '4', '72', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('506', '226', '1', '5', '73', '1', '4', '73', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('507', '159', '1', '5', '73', '1', '5', '65', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('508', '163', '1', '5', '73', '1', '5', '66', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('509', '120', '1', '5', '73', '1', '6', '63', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('510', '122', '1', '5', '73', '1', '6', '61', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('511', '245', '1', '5', '73', '1', '9', '64', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('512', '246', '1', '5', '73', '1', '9', '62', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('513', '196', '1', '5', '73', '1', '10', '69', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('514', '199', '1', '5', '73', '1', '10', '70', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('515', '4', '1', '5', '73', '1', '12', '74', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('516', '26', '1', '5', '73', '1', '12', '75', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('517', '2', '1', '6', '73', '1', '1', '76', null, null, '3', '15', '-', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('518', '2', '1', '7', '73', '1', '1', '77', null, null, '3', '15', '-', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('519', '169', '1', '1', '74', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('520', '173', '1', '1', '74', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('521', '108', '1', '1', '74', '1', '4', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('522', '109', '1', '1', '74', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('523', '221', '1', '1', '74', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('524', '157', '1', '1', '74', '1', '5', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('525', '159', '1', '1', '74', '1', '5', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('526', '130', '1', '1', '74', '1', '6', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('527', '131', '1', '1', '74', '1', '6', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('528', '246', '1', '1', '74', '1', '9', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('529', '248', '1', '1', '74', '1', '9', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('530', '189', '1', '1', '74', '1', '10', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('531', '191', '1', '1', '74', '1', '10', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('532', '4', '1', '1', '74', '1', '12', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('533', '26', '1', '1', '74', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('534', '272', '1', '2', '74', '1', '2', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('535', '169', '1', '2', '74', '1', '3', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('536', '173', '1', '2', '74', '1', '3', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('537', '108', '1', '2', '74', '1', '4', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('538', '109', '1', '2', '74', '1', '4', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('539', '221', '1', '2', '74', '1', '4', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('540', '157', '1', '2', '74', '1', '5', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('541', '159', '1', '2', '74', '1', '5', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('542', '130', '1', '2', '74', '1', '6', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('543', '131', '1', '2', '74', '1', '6', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('544', '246', '1', '2', '74', '1', '9', '26', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('545', '248', '1', '2', '74', '1', '9', '27', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('546', '189', '1', '2', '74', '1', '10', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('547', '191', '1', '2', '74', '1', '10', '29', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('548', '169', '1', '1', '75', '1', '3', '7', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('549', '173', '1', '1', '75', '1', '3', '6', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('550', '108', '1', '1', '75', '1', '4', '11', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('551', '109', '1', '1', '75', '1', '4', '12', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('552', '157', '1', '1', '75', '1', '5', '5', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('553', '159', '1', '1', '75', '1', '5', '2', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('554', '130', '1', '1', '75', '1', '6', '3', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('555', '131', '1', '1', '75', '1', '6', '4', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('556', '246', '1', '1', '75', '1', '9', '10', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('557', '248', '1', '1', '75', '1', '9', '1', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('558', '189', '1', '1', '75', '1', '10', '9', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('559', '191', '1', '1', '75', '1', '10', '8', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('560', '4', '1', '1', '75', '1', '12', '13', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('561', '26', '1', '1', '75', '1', '12', '14', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('562', '169', '1', '2', '75', '1', '3', '19', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('563', '173', '1', '2', '75', '1', '3', '20', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('564', '108', '1', '2', '75', '1', '4', '25', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('565', '109', '1', '2', '75', '1', '4', '24', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('566', '108', '1', '2', '75', '1', '4', '23', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('567', '109', '1', '2', '75', '1', '4', '26', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('568', '221', '1', '2', '75', '1', '4', '27', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('569', '130', '1', '2', '75', '1', '6', '17', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('570', '131', '1', '2', '75', '1', '6', '18', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('571', '246', '1', '2', '75', '1', '9', '15', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('572', '248', '1', '2', '75', '1', '9', '16', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('573', '189', '1', '2', '75', '1', '10', '22', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('574', '191', '1', '2', '75', '1', '10', '21', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('575', '4', '1', '2', '75', '1', '12', '28', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('576', '26', '1', '2', '75', '1', '12', '29', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('577', '169', '1', '3', '75', '1', '3', '37', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('578', '173', '1', '3', '75', '1', '3', '36', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('579', '108', '1', '3', '75', '1', '4', '40', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('580', '109', '1', '3', '75', '1', '4', '41', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('581', '221', '1', '3', '75', '1', '4', '42', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('582', '157', '1', '3', '75', '1', '5', '34', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('583', '159', '1', '3', '75', '1', '5', '35', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('584', '130', '1', '3', '75', '1', '6', '32', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('585', '131', '1', '3', '75', '1', '6', '33', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('586', '246', '1', '3', '75', '1', '9', '31', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('587', '248', '1', '3', '75', '1', '9', '30', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('588', '189', '1', '3', '75', '1', '10', '39', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('589', '191', '1', '3', '75', '1', '10', '38', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('590', '4', '1', '3', '75', '1', '12', '43', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('591', '26', '1', '3', '75', '1', '12', '44', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('592', '169', '1', '4', '75', '1', '3', '52', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('593', '173', '1', '4', '75', '1', '3', '51', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('594', '108', '1', '4', '75', '1', '4', '55', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('595', '109', '1', '4', '75', '1', '4', '56', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('596', '221', '1', '4', '75', '1', '4', '57', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('597', '157', '1', '4', '75', '1', '5', '49', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('598', '159', '1', '4', '75', '1', '5', '50', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('599', '130', '1', '4', '75', '1', '6', '47', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('600', '131', '1', '4', '75', '1', '6', '48', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('601', '246', '1', '4', '75', '1', '9', '46', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('602', '248', '1', '4', '75', '1', '9', '45', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('603', '189', '1', '4', '75', '1', '10', '54', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('604', '191', '1', '4', '75', '1', '10', '53', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('605', '4', '1', '4', '75', '1', '12', '58', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('606', '26', '1', '4', '75', '1', '12', '59', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('607', '169', '1', '5', '75', '1', '3', '66', null, null, '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('608', '173', '1', '5', '75', '1', '3', '67', null, null, '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('609', '108', '1', '5', '75', '1', '4', '70', null, null, '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('610', '109', '1', '5', '75', '1', '4', '71', null, null, '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('611', '221', '1', '5', '75', '1', '4', '72', null, null, '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('612', '157', '1', '5', '75', '1', '5', '64', null, null, '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('613', '159', '1', '5', '75', '1', '5', '65', null, null, '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('614', '130', '1', '5', '75', '1', '6', '62', null, null, '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('615', '131', '1', '5', '75', '1', '6', '63', null, null, '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('616', '246', '1', '5', '75', '1', '9', '61', null, null, '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('617', '248', '1', '5', '75', '1', '9', '60', null, null, '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('618', '189', '1', '5', '75', '1', '10', '69', null, null, '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('619', '191', '1', '5', '75', '1', '10', '68', null, null, '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('620', '4', '1', '5', '75', '1', '12', '73', null, null, '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('621', '26', '1', '5', '75', '1', '12', '74', null, null, '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('622', '2', '1', '6', '75', '1', '1', '75', null, null, '3', '15', '-', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('623', '2', '1', '7', '75', '1', '1', '76', null, null, '3', '15', '-', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('624', '181', '1', '1', '76', '1', '3', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('625', '47', '1', '1', '76', '1', '4', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('626', '166', '1', '1', '76', '1', '5', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('627', '133', '1', '1', '76', '1', '6', '1', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('628', '248', '1', '1', '76', '1', '9', '2', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('629', '196', '1', '1', '76', '1', '10', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('630', '4', '1', '1', '76', '1', '12', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('631', '181', '1', '2', '76', '1', '3', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('632', '47', '1', '2', '76', '1', '4', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('633', '166', '1', '2', '76', '1', '5', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('634', '133', '1', '2', '76', '1', '6', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('635', '248', '1', '2', '76', '1', '9', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('636', '196', '1', '2', '76', '1', '10', '12', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('637', '181', '1', '3', '76', '1', '3', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('638', '47', '1', '3', '76', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('639', '166', '1', '3', '76', '1', '5', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('640', '133', '1', '3', '76', '1', '6', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('641', '248', '1', '3', '76', '1', '9', '15', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('642', '196', '1', '3', '76', '1', '10', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('643', '181', '1', '4', '76', '1', '3', '23', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('644', '47', '1', '4', '76', '1', '4', '25', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('645', '166', '1', '4', '76', '1', '5', '22', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('646', '133', '1', '4', '76', '1', '6', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('647', '248', '1', '4', '76', '1', '9', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('648', '196', '1', '4', '76', '1', '10', '24', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('649', '181', '1', '5', '76', '1', '3', '29', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('650', '47', '1', '5', '76', '1', '4', '31', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('651', '166', '1', '5', '76', '1', '5', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('652', '133', '1', '5', '76', '1', '6', '26', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('653', '248', '1', '5', '76', '1', '9', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('654', '196', '1', '5', '76', '1', '10', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('655', '181', '1', '6', '76', '1', '3', '32', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('656', '47', '1', '6', '76', '1', '4', '33', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('657', '166', '1', '6', '76', '1', '5', '34', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('658', '133', '1', '6', '76', '1', '6', '35', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('659', '248', '1', '6', '76', '1', '9', '36', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('660', '196', '1', '6', '76', '1', '10', '37', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('661', '2', '1', '7', '76', '1', '1', '38', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('662', '169', '1', '1', '77', '1', '3', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('663', '170', '1', '1', '77', '1', '3', '11', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('664', '169', '1', '1', '77', '1', '3', '10', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('665', '170', '1', '1', '77', '1', '3', '12', null, null, '2', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('666', '47', '1', '1', '77', '1', '4', '1', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('667', '76', '1', '1', '77', '1', '4', '2', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('668', '159', '1', '1', '77', '1', '5', '8', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('669', '163', '1', '1', '77', '1', '5', '9', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('670', '111', '1', '1', '77', '1', '6', '3', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('671', '112', '1', '1', '77', '1', '6', '4', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('672', '245', '1', '1', '77', '1', '9', '7', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('673', '246', '1', '1', '77', '1', '9', '5', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('674', '197', '1', '1', '77', '1', '10', '13', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('675', '198', '1', '1', '77', '1', '10', '14', null, null, '2', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('676', '169', '1', '2', '77', '1', '3', '21', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('677', '170', '1', '2', '77', '1', '3', '22', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('678', '47', '1', '2', '77', '1', '4', '15', null, null, '2', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('679', '76', '1', '2', '77', '1', '4', '16', null, null, '2', '15', 'g2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('680', '159', '1', '2', '77', '1', '5', '19', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('681', '163', '1', '2', '77', '1', '5', '20', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('682', '111', '1', '2', '77', '1', '6', '17', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('683', '112', '1', '2', '77', '1', '6', '18', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('684', '245', '1', '2', '77', '1', '9', '18', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('685', '246', '1', '2', '77', '1', '9', '17', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('686', '197', '1', '2', '77', '1', '10', '23', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('687', '198', '1', '2', '77', '1', '10', '24', null, null, '2', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('688', '169', '1', '3', '77', '1', '3', '33', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('689', '170', '1', '3', '77', '1', '3', '34', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('690', '47', '1', '3', '77', '1', '4', '25', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('691', '76', '1', '3', '77', '1', '4', '26', null, null, '2', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('692', '159', '1', '3', '77', '1', '5', '31', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('693', '163', '1', '3', '77', '1', '5', '32', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('694', '111', '1', '3', '77', '1', '6', '27', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('695', '112', '1', '3', '77', '1', '6', '28', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('696', '245', '1', '3', '77', '1', '9', '30', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('697', '246', '1', '3', '77', '1', '9', '29', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('698', '197', '1', '3', '77', '1', '10', '35', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('699', '198', '1', '3', '77', '1', '10', '36', null, null, '2', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('700', '169', '1', '4', '77', '1', '3', '45', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('701', '170', '1', '4', '77', '1', '3', '46', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('702', '47', '1', '4', '77', '1', '4', '37', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('703', '76', '1', '4', '77', '1', '4', '38', null, null, '2', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('704', '159', '1', '4', '77', '1', '5', '43', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('705', '163', '1', '4', '77', '1', '5', '44', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('706', '111', '1', '4', '77', '1', '6', '39', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('707', '112', '1', '4', '77', '1', '6', '40', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('708', '245', '1', '4', '77', '1', '9', '42', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('709', '246', '1', '4', '77', '1', '9', '41', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('710', '197', '1', '4', '77', '1', '10', '47', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('711', '198', '1', '4', '77', '1', '10', '48', null, null, '2', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('712', '169', '1', '5', '77', '1', '3', '57', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('713', '170', '1', '5', '77', '1', '3', '58', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('714', '47', '1', '5', '77', '1', '4', '49', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('715', '76', '1', '5', '77', '1', '4', '50', null, null, '2', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('716', '159', '1', '5', '77', '1', '5', '55', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('717', '163', '1', '5', '77', '1', '5', '56', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('718', '111', '1', '5', '77', '1', '6', '51', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('719', '112', '1', '5', '77', '1', '6', '52', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('720', '245', '1', '5', '77', '1', '9', '54', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('721', '246', '1', '5', '77', '1', '9', '53', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('722', '197', '1', '5', '77', '1', '10', '59', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('723', '198', '1', '5', '77', '1', '10', '60', null, null, '2', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('724', '169', '1', '6', '77', '1', '3', '69', null, null, '2', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('725', '170', '1', '6', '77', '1', '3', '70', null, null, '2', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('726', '47', '1', '6', '77', '1', '4', '61', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('727', '76', '1', '6', '77', '1', '4', '62', null, null, '2', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('728', '159', '1', '6', '77', '1', '5', '67', null, null, '2', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('729', '163', '1', '6', '77', '1', '5', '68', null, null, '2', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('730', '111', '1', '6', '77', '1', '6', '63', null, null, '2', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('731', '112', '1', '6', '77', '1', '6', '64', null, null, '2', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('732', '245', '1', '6', '77', '1', '9', '66', null, null, '2', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('733', '246', '1', '6', '77', '1', '9', '65', null, null, '2', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('734', '197', '1', '6', '77', '1', '10', '71', null, null, '2', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('735', '198', '1', '6', '77', '1', '10', '72', null, null, '2', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('736', '2', '1', '7', '77', '1', '1', '73', null, null, '2', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('737', '181', '1', '1', '78', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('738', '156', '1', '1', '78', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('739', '120', '1', '1', '78', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('740', '246', '1', '1', '78', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('741', '196', '1', '1', '78', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('742', '181', '1', '1', '79', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('743', '156', '1', '1', '79', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('744', '120', '1', '1', '79', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('745', '246', '1', '1', '79', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('746', '196', '1', '1', '79', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('747', '30', '1', '1', '79', '1', '12', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('748', '43', '1', '1', '79', '1', '12', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('749', '181', '1', '1', '80', '1', '3', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('750', '156', '1', '1', '80', '1', '5', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('751', '120', '1', '1', '80', '1', '6', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('752', '246', '1', '1', '80', '1', '9', '1', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('753', '196', '1', '1', '80', '1', '10', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('754', '30', '1', '1', '80', '1', '12', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('755', '43', '1', '1', '80', '1', '12', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('756', '73', '1', '2', '80', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('757', '95', '1', '2', '80', '1', '4', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('758', '103', '1', '2', '80', '1', '4', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('759', '108', '1', '2', '80', '1', '4', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('760', '109', '1', '2', '80', '1', '4', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('761', '226', '1', '2', '80', '1', '4', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('762', '29', '1', '2', '80', '1', '12', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('763', '179', '1', '3', '80', '1', '3', '18', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('764', '156', '1', '3', '80', '1', '5', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('765', '120', '1', '3', '80', '1', '6', '16', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('766', '246', '1', '3', '80', '1', '9', '15', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('767', '196', '1', '3', '80', '1', '10', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('768', '30', '1', '3', '80', '1', '12', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('769', '43', '1', '3', '80', '1', '12', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('770', '73', '1', '4', '80', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('771', '95', '1', '4', '80', '1', '4', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('772', '103', '1', '4', '80', '1', '4', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('773', '108', '1', '4', '80', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('774', '109', '1', '4', '80', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('775', '226', '1', '4', '80', '1', '4', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('776', '29', '1', '4', '80', '1', '12', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('777', '32', '1', '4', '80', '1', '12', '29', null, null, '4', '30', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('778', '181', '1', '5', '80', '1', '3', '32', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('779', '156', '1', '5', '80', '1', '5', '34', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('780', '120', '1', '5', '80', '1', '6', '31', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('781', '246', '1', '5', '80', '1', '9', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('782', '196', '1', '5', '80', '1', '10', '33', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('783', '30', '1', '5', '80', '1', '12', '35', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('784', '43', '1', '5', '80', '1', '12', '36', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('785', '73', '1', '6', '80', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('786', '95', '1', '6', '80', '1', '4', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('787', '103', '1', '6', '80', '1', '4', '39', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('788', '108', '1', '6', '80', '1', '4', '40', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('789', '109', '1', '6', '80', '1', '4', '41', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('790', '226', '1', '6', '80', '1', '4', '42', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('791', '29', '1', '6', '80', '1', '12', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('792', '32', '1', '6', '80', '1', '12', '44', null, null, '4', '30', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('793', '2', '1', '7', '80', '1', '1', '45', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('794', '188', '1', '1', '81', '1', '3', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('795', '159', '1', '1', '81', '1', '5', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('796', '130', '1', '1', '81', '1', '6', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('797', '252', '1', '1', '81', '1', '9', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('798', '198', '1', '1', '81', '1', '10', '6', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('799', '29', '1', '1', '81', '1', '12', '1', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('800', '43', '1', '1', '81', '1', '12', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('801', '48', '1', '2', '81', '1', '4', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('802', '71', '1', '2', '81', '1', '4', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('803', '73', '1', '2', '81', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('804', '77', '1', '2', '81', '1', '4', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('805', '220', '1', '2', '81', '1', '4', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('806', '29', '1', '2', '81', '1', '12', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('807', '30', '1', '2', '81', '1', '12', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('808', '188', '1', '3', '81', '1', '3', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('809', '159', '1', '3', '81', '1', '5', '16', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('810', '130', '1', '3', '81', '1', '6', '18', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('811', '252', '1', '3', '81', '1', '9', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('812', '198', '1', '3', '81', '1', '10', '20', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('813', '29', '1', '3', '81', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('814', '43', '1', '3', '81', '1', '12', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('815', '48', '1', '4', '81', '1', '4', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('816', '71', '1', '4', '81', '1', '4', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('817', '73', '1', '4', '81', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('818', '77', '1', '4', '81', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('819', '220', '1', '4', '81', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('820', '29', '1', '4', '81', '1', '12', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('821', '30', '1', '4', '81', '1', '12', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('822', '188', '1', '5', '81', '1', '3', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('823', '159', '1', '5', '81', '1', '5', '29', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('824', '130', '1', '5', '81', '1', '6', '31', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('825', '252', '1', '5', '81', '1', '9', '32', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('826', '198', '1', '5', '81', '1', '10', '33', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('827', '30', '1', '5', '81', '1', '12', '34', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('828', '43', '1', '5', '81', '1', '12', '35', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('829', '48', '1', '6', '81', '1', '4', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('830', '71', '1', '6', '81', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('831', '73', '1', '6', '81', '1', '4', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('832', '77', '1', '6', '81', '1', '4', '39', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('833', '220', '1', '6', '81', '1', '4', '40', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('834', '29', '1', '6', '81', '1', '12', '42', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('835', '30', '1', '6', '81', '1', '12', '41', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('836', '2', '1', '7', '81', '1', '1', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('837', '169', '1', '1', '82', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('838', '156', '1', '1', '82', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('839', '112', '1', '1', '82', '1', '6', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('840', '250', '1', '1', '82', '1', '9', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('841', '192', '1', '1', '82', '1', '10', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('842', '23', '1', '1', '82', '1', '12', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('843', '30', '1', '1', '82', '1', '12', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('844', '47', '1', '2', '82', '1', '4', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('845', '68', '1', '2', '82', '1', '4', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('846', '73', '1', '2', '82', '1', '4', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('847', '101', '1', '2', '82', '1', '4', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('848', '233', '1', '2', '82', '1', '4', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('849', '169', '1', '3', '82', '1', '3', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('850', '156', '1', '3', '82', '1', '5', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('851', '112', '1', '3', '82', '1', '6', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('852', '252', '1', '3', '82', '1', '9', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('853', '205', '1', '3', '82', '1', '10', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('854', '23', '1', '3', '82', '1', '12', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('855', '30', '1', '3', '82', '1', '12', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('856', '47', '1', '4', '82', '1', '4', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('857', '68', '1', '4', '82', '1', '4', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('858', '73', '1', '4', '82', '1', '4', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('859', '101', '1', '4', '82', '1', '4', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('860', '233', '1', '4', '82', '1', '4', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('861', '16', '1', '4', '82', '1', '12', '26', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('862', '34', '1', '4', '82', '1', '12', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('863', '169', '1', '5', '82', '1', '3', '27', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('864', '169', '1', '5', '82', '1', '3', '29', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('865', '156', '1', '5', '82', '1', '5', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('866', '112', '1', '5', '82', '1', '6', '30', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('867', '252', '1', '5', '82', '1', '9', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('868', '23', '1', '5', '82', '1', '12', '33', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('869', '30', '1', '5', '82', '1', '12', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('870', '169', '1', '6', '82', '1', '3', '34', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('871', '156', '1', '6', '82', '1', '5', '35', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('872', '112', '1', '6', '82', '1', '6', '36', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('873', '252', '1', '6', '82', '1', '9', '37', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('874', '205', '1', '6', '82', '1', '10', '38', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('875', '47', '1', '6', '82', '1', '4', '39', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('876', '68', '1', '6', '82', '1', '4', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('877', '73', '1', '6', '82', '1', '4', '41', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('878', '101', '1', '6', '82', '1', '4', '42', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('879', '233', '1', '6', '82', '1', '4', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('880', '16', '1', '6', '82', '1', '12', '44', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('881', '34', '1', '6', '82', '1', '12', '45', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('882', '2', '1', '7', '82', '1', '1', '46', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('883', '169', '1', '1', '83', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('884', '156', '1', '1', '83', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('885', '112', '1', '1', '83', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('886', '252', '1', '1', '83', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('887', '205', '1', '1', '83', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('888', '181', '1', '1', '84', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('889', '216', '1', '1', '84', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('890', '73', '1', '1', '84', '1', '4', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('891', '95', '1', '1', '84', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('892', '159', '1', '1', '84', '1', '5', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('893', '163', '1', '1', '84', '1', '5', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('894', '121', '1', '1', '84', '1', '6', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('895', '122', '1', '1', '84', '1', '6', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('896', '245', '1', '1', '84', '1', '9', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('897', '246', '1', '1', '84', '1', '9', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('898', '196', '1', '1', '84', '1', '10', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('899', '199', '1', '1', '84', '1', '10', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('900', '4', '1', '1', '84', '1', '12', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('901', '23', '1', '1', '84', '1', '12', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('902', '169', '1', '2', '84', '1', '3', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('903', '170', '1', '2', '84', '1', '3', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('904', '47', '1', '2', '84', '1', '4', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('905', '48', '1', '2', '84', '1', '4', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('906', '142', '1', '2', '84', '1', '5', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('907', '143', '1', '2', '84', '1', '5', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('908', '111', '1', '2', '84', '1', '6', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('909', '112', '1', '2', '84', '1', '6', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('910', '245', '1', '2', '84', '1', '9', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('911', '246', '1', '2', '84', '1', '9', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('912', '169', '1', '1', '85', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('913', '156', '1', '1', '85', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('914', '112', '1', '1', '85', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('915', '252', '1', '1', '85', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('916', '205', '1', '1', '85', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('917', '169', '1', '1', '86', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('918', '156', '1', '1', '86', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('919', '112', '1', '1', '86', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('920', '250', '1', '1', '86', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('921', '206', '1', '1', '86', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('922', '206', '1', '1', '86', '1', '10', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('923', '169', '1', '1', '87', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('924', '156', '1', '1', '87', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('925', '112', '1', '1', '87', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('926', '250', '1', '1', '87', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('927', '206', '1', '1', '87', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('928', '275', '1', '1', '87', '1', '12', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('929', '30', '1', '1', '87', '1', '12', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('930', '275', '1', '1', '87', '1', '12', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('931', '169', '1', '1', '88', '1', '3', '1', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('932', '156', '1', '1', '88', '1', '5', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('933', '112', '1', '1', '88', '1', '6', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('934', '250', '1', '1', '88', '1', '9', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('935', '206', '1', '1', '88', '1', '10', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('936', '30', '1', '1', '88', '1', '12', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('937', '275', '1', '1', '88', '1', '12', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('938', '47', '1', '2', '88', '1', '4', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('939', '68', '1', '2', '88', '1', '4', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('940', '73', '1', '2', '88', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('941', '101', '1', '2', '88', '1', '4', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('942', '236', '1', '2', '88', '1', '4', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('943', '16', '1', '2', '88', '1', '12', '13', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('944', '34', '1', '2', '88', '1', '12', '14', null, null, '4', '30', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('945', '169', '1', '3', '88', '1', '3', '15', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('946', '156', '1', '3', '88', '1', '5', '16', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('947', '112', '1', '3', '88', '1', '6', '18', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('948', '250', '1', '3', '88', '1', '9', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('949', '206', '1', '3', '88', '1', '10', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('950', '30', '1', '3', '88', '1', '12', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('951', '275', '1', '3', '88', '1', '12', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('952', '47', '1', '4', '88', '1', '4', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('953', '68', '1', '4', '88', '1', '4', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('954', '73', '1', '4', '88', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('955', '101', '1', '4', '88', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('956', '233', '1', '4', '88', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('957', '16', '1', '4', '88', '1', '12', '27', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('958', '34', '1', '4', '88', '1', '12', '28', null, null, '4', '30', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('959', '169', '1', '5', '88', '1', '3', '29', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('960', '156', '1', '5', '88', '1', '5', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('961', '112', '1', '5', '88', '1', '6', '31', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('962', '250', '1', '5', '88', '1', '9', '33', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('963', '206', '1', '5', '88', '1', '10', '32', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('964', '30', '1', '5', '88', '1', '12', '34', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('965', '275', '1', '5', '88', '1', '12', '35', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('966', '47', '1', '6', '88', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('967', '68', '1', '6', '88', '1', '4', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('968', '73', '1', '6', '88', '1', '4', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('969', '101', '1', '6', '88', '1', '4', '39', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('970', '233', '1', '6', '88', '1', '4', '40', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('971', '16', '1', '6', '88', '1', '12', '41', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('972', '34', '1', '6', '88', '1', '12', '42', null, null, '4', '30', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('973', '2', '1', '7', '88', '1', '1', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('974', '181', '1', '1', '89', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('975', '156', '1', '1', '89', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('976', '112', '1', '1', '89', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('977', '252', '1', '1', '89', '1', '9', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('978', '198', '1', '1', '89', '1', '10', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('979', '198', '1', '1', '89', '1', '10', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('980', '179', '1', '1', '89', '1', '3', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('981', '181', '1', '1', '90', '1', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('982', '156', '1', '1', '90', '1', '5', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('983', '112', '1', '1', '90', '1', '6', '1', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('984', '252', '1', '1', '90', '1', '9', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('985', '198', '1', '1', '90', '1', '10', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('986', '43', '1', '1', '90', '1', '12', '6', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('987', '276', '1', '1', '90', '1', '12', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('988', '47', '1', '2', '90', '1', '4', '9', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('989', '73', '1', '2', '90', '1', '4', '8', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('990', '76', '1', '2', '90', '1', '4', '10', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('991', '101', '1', '2', '90', '1', '4', '11', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('992', '221', '1', '2', '90', '1', '4', '12', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('993', '275', '1', '2', '90', '1', '12', '13', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('994', '181', '1', '3', '90', '1', '3', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('995', '156', '1', '3', '90', '1', '5', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('996', '112', '1', '3', '90', '1', '6', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('997', '252', '1', '3', '90', '1', '9', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('998', '198', '1', '3', '90', '1', '10', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('999', '43', '1', '3', '90', '1', '12', '19', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1000', '276', '1', '3', '90', '1', '12', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1001', '47', '1', '4', '90', '1', '4', '22', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1002', '73', '1', '4', '90', '1', '4', '21', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1003', '76', '1', '4', '90', '1', '4', '23', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1004', '101', '1', '4', '90', '1', '4', '24', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1005', '221', '1', '4', '90', '1', '4', '25', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1006', '275', '1', '4', '90', '1', '12', '26', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1007', '181', '1', '5', '90', '1', '3', '30', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1008', '156', '1', '5', '90', '1', '5', '29', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1009', '112', '1', '5', '90', '1', '6', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1010', '250', '1', '5', '90', '1', '9', '28', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1011', '198', '1', '5', '90', '1', '10', '31', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1012', '43', '1', '5', '90', '1', '12', '32', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1013', '276', '1', '5', '90', '1', '12', '33', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1014', '47', '1', '6', '90', '1', '4', '35', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1015', '73', '1', '6', '90', '1', '4', '34', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1016', '76', '1', '6', '90', '1', '4', '36', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1017', '101', '1', '6', '90', '1', '4', '37', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1018', '221', '1', '6', '90', '1', '4', '38', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1019', '275', '1', '6', '90', '1', '12', '39', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1020', '2', '1', '7', '90', '1', '1', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1021', '169', '1', '1', '91', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1022', '143', '1', '1', '91', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1023', '125', '1', '1', '91', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1024', '169', '1', '1', '92', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1025', '143', '1', '1', '92', '1', '5', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1026', '125', '1', '1', '92', '1', '6', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1027', '278', '1', '1', '92', '1', '6', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1028', '169', '1', '1', '93', '1', '3', '2', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1029', '143', '1', '1', '93', '1', '5', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1030', '125', '1', '1', '93', '1', '6', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1031', '278', '1', '1', '93', '1', '6', '1', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1032', '254', '1', '1', '93', '1', '9', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1033', '199', '1', '1', '93', '1', '10', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1034', '30', '1', '1', '93', '1', '12', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1035', '32', '1', '1', '93', '1', '12', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1036', '76', '1', '2', '93', '1', '4', '12', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1037', '103', '1', '2', '93', '1', '4', '11', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1038', '108', '1', '2', '93', '1', '4', '9', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1039', '109', '1', '2', '93', '1', '4', '10', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1040', '232', '1', '2', '93', '1', '4', '13', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1041', '29', '1', '2', '93', '1', '12', '14', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1042', '169', '1', '3', '93', '1', '3', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1043', '143', '1', '3', '93', '1', '5', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1044', '125', '1', '3', '93', '1', '6', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1045', '278', '1', '3', '93', '1', '6', '15', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1046', '254', '1', '3', '93', '1', '9', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1047', '199', '1', '3', '93', '1', '10', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1048', '31', '1', '3', '93', '1', '12', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1049', '32', '1', '3', '93', '1', '12', '22', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1050', '76', '1', '4', '93', '1', '4', '26', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1051', '103', '1', '4', '93', '1', '4', '25', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1052', '108', '1', '4', '93', '1', '4', '23', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1053', '109', '1', '4', '93', '1', '4', '24', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1054', '235', '1', '4', '93', '1', '4', '27', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1055', '29', '1', '4', '93', '1', '12', '28', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1056', '169', '1', '5', '93', '1', '3', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1057', '143', '1', '5', '93', '1', '5', '34', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1058', '125', '1', '5', '93', '1', '6', '32', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1059', '278', '1', '5', '93', '1', '6', '29', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1060', '254', '1', '5', '93', '1', '9', '33', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1061', '199', '1', '5', '93', '1', '10', '31', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1062', '31', '1', '5', '93', '1', '12', '35', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1063', '32', '1', '5', '93', '1', '12', '36', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1064', '76', '1', '6', '93', '1', '4', '40', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1065', '103', '1', '6', '93', '1', '4', '39', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1066', '108', '1', '6', '93', '1', '4', '37', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1067', '109', '1', '6', '93', '1', '4', '38', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1068', '235', '1', '6', '93', '1', '4', '41', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1069', '29', '1', '6', '93', '1', '12', '42', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1070', '2', '1', '7', '93', '1', '1', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1071', '173', '1', '1', '95', '1', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1072', '153', '1', '1', '95', '1', '5', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1073', '141', '1', '1', '95', '1', '6', '1', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1074', '249', '1', '1', '95', '1', '9', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1075', '196', '1', '1', '95', '1', '10', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1076', '30', '1', '1', '95', '1', '12', '7', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1077', '276', '1', '1', '95', '1', '12', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1078', '73', '1', '2', '95', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1079', '221', '1', '2', '95', '1', '4', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1080', '280', '1', '2', '95', '1', '4', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1081', '281', '1', '2', '95', '1', '4', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1082', '282', '1', '2', '95', '1', '4', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1083', '30', '1', '2', '95', '1', '12', '13', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1084', '31', '1', '2', '95', '1', '12', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1085', '173', '1', '3', '95', '1', '3', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1086', '153', '1', '3', '95', '1', '5', '19', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1087', '141', '1', '3', '95', '1', '6', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1088', '249', '1', '3', '95', '1', '9', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1089', '196', '1', '3', '95', '1', '10', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1090', '30', '1', '3', '95', '1', '12', '21', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1091', '276', '1', '3', '95', '1', '12', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1092', '73', '1', '4', '95', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1093', '221', '1', '4', '95', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1094', '280', '1', '4', '95', '1', '4', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1095', '281', '1', '4', '95', '1', '4', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1096', '282', '1', '4', '95', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1097', '30', '1', '4', '95', '1', '12', '27', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1098', '31', '1', '4', '95', '1', '12', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1099', '173', '1', '5', '95', '1', '3', '32', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1100', '153', '1', '5', '95', '1', '5', '33', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1101', '141', '1', '5', '95', '1', '6', '29', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1102', '249', '1', '5', '95', '1', '9', '31', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1103', '196', '1', '5', '95', '1', '10', '30', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1104', '30', '1', '5', '95', '1', '12', '35', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1105', '276', '1', '5', '95', '1', '12', '34', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1106', '73', '1', '6', '95', '1', '4', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1107', '221', '1', '6', '95', '1', '4', '40', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1108', '280', '1', '6', '95', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1109', '281', '1', '6', '95', '1', '4', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1110', '282', '1', '6', '95', '1', '4', '39', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1111', '30', '1', '6', '95', '1', '12', '41', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1112', '31', '1', '6', '95', '1', '12', '42', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1113', '2', '1', '7', '95', '1', '1', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1114', '272', '1', '1', '96', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1115', '170', '1', '2', '96', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1116', '171', '1', '2', '96', '1', '3', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1117', '108', '1', '2', '96', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1118', '109', '1', '2', '96', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1119', '108', '1', '2', '96', '1', '4', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1120', '109', '1', '2', '96', '1', '4', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1121', '224', '1', '2', '96', '1', '4', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1122', '125', '1', '2', '96', '1', '6', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1123', '270', '1', '2', '96', '1', '6', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1124', '246', '1', '2', '96', '1', '9', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1125', '248', '1', '2', '96', '1', '9', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1126', '199', '1', '2', '96', '1', '10', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1127', '206', '1', '2', '96', '1', '10', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1128', '4', '1', '2', '96', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1129', '28', '1', '2', '96', '1', '12', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1130', '272', '1', '3', '96', '1', '2', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1131', '170', '1', '4', '96', '1', '3', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1132', '171', '1', '4', '96', '1', '3', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1133', '108', '1', '4', '96', '1', '4', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1134', '109', '1', '4', '96', '1', '4', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1135', '224', '1', '4', '96', '1', '4', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1136', '272', '1', '1', '97', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1137', '170', '1', '2', '97', '1', '3', '11', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1138', '171', '1', '2', '97', '1', '3', '10', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1139', '108', '1', '2', '97', '1', '4', '2', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1140', '109', '1', '2', '97', '1', '4', '3', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1141', '224', '1', '2', '97', '1', '4', '14', null, null, '4', '12', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1142', '149', '1', '2', '97', '1', '5', '8', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1143', '168', '1', '2', '97', '1', '5', '9', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1144', '125', '1', '2', '97', '1', '6', '5', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1145', '130', '1', '2', '97', '1', '6', '4', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1146', '246', '1', '2', '97', '1', '9', '7', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1147', '248', '1', '2', '97', '1', '9', '6', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1148', '199', '1', '2', '97', '1', '10', '12', null, null, '4', '12', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1149', '206', '1', '2', '97', '1', '10', '13', null, null, '4', '12', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1150', '4', '1', '2', '97', '1', '12', '15', null, null, '4', '20', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1151', '28', '1', '2', '97', '1', '12', '16', null, null, '4', '20', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1152', '272', '1', '3', '97', '1', '2', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1153', '170', '1', '4', '97', '1', '3', '27', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1154', '171', '1', '4', '97', '1', '3', '26', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1155', '108', '1', '4', '97', '1', '4', '18', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1156', '109', '1', '4', '97', '1', '4', '19', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1157', '224', '1', '4', '97', '1', '4', '30', null, null, '4', '12', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1158', '149', '1', '4', '97', '1', '5', '24', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1159', '168', '1', '4', '97', '1', '5', '25', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1160', '125', '1', '4', '97', '1', '6', '21', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1161', '130', '1', '4', '97', '1', '6', '20', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1162', '246', '1', '4', '97', '1', '9', '23', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1163', '248', '1', '4', '97', '1', '9', '22', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1164', '192', '1', '4', '97', '1', '10', '29', null, null, '4', '12', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1165', '199', '1', '4', '97', '1', '10', '28', null, null, '4', '12', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1166', '4', '1', '4', '97', '1', '12', '31', null, null, '4', '20', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1167', '28', '1', '4', '97', '1', '12', '32', null, null, '4', '20', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1168', '272', '1', '5', '97', '1', '2', '33', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1169', '170', '1', '6', '97', '1', '3', '43', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1170', '171', '1', '6', '97', '1', '3', '42', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1171', '108', '1', '6', '97', '1', '4', '34', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1172', '109', '1', '6', '97', '1', '4', '35', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1173', '224', '1', '6', '97', '1', '4', '46', null, null, '4', '12', 'g1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1174', '149', '1', '6', '97', '1', '5', '40', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1175', '168', '1', '6', '97', '1', '5', '41', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1176', '125', '1', '6', '97', '1', '6', '37', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1177', '130', '1', '6', '97', '1', '6', '36', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1178', '246', '1', '6', '97', '1', '9', '39', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1179', '248', '1', '6', '97', '1', '9', '38', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1180', '199', '1', '6', '97', '1', '10', '44', null, null, '4', '12', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1181', '206', '1', '6', '97', '1', '10', '45', null, null, '4', '12', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1182', '4', '1', '6', '97', '1', '12', '47', null, null, '4', '20', 'h1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1183', '28', '1', '6', '97', '1', '12', '48', null, null, '4', '20', 'i1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1184', '2', '1', '7', '97', '1', '1', '49', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1185', '272', '1', '1', '98', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1186', '272', '1', '2', '98', '1', '2', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1187', '272', '1', '3', '98', '1', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1188', '272', '1', '4', '98', '1', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1189', '272', '1', '5', '98', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1190', '2', '1', '6', '98', '1', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1191', '2', '1', '7', '98', '1', '1', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1192', '181', '1', '1', '99', '1', '3', '4', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1193', '76', '1', '1', '99', '1', '4', '6', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1194', '157', '1', '1', '99', '1', '5', '3', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1195', '136', '1', '1', '99', '1', '6', '1', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1196', '249', '1', '1', '99', '1', '9', '2', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1197', '199', '1', '1', '99', '1', '10', '5', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1198', '26', '1', '1', '99', '1', '12', '7', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1199', '182', '1', '2', '99', '1', '3', '11', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1200', '47', '1', '2', '99', '1', '4', '13', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1201', '149', '1', '2', '99', '1', '5', '10', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1202', '125', '1', '2', '99', '1', '6', '8', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1203', '245', '1', '2', '99', '1', '9', '9', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1204', '189', '1', '2', '99', '1', '10', '12', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1205', '4', '1', '2', '99', '1', '12', '14', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1206', '181', '1', '3', '99', '1', '3', '18', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1207', '76', '1', '3', '99', '1', '4', '20', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1208', '221', '1', '3', '99', '1', '4', '21', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1209', '157', '1', '3', '99', '1', '5', '17', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1210', '136', '1', '3', '99', '1', '6', '15', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1211', '249', '1', '3', '99', '1', '9', '16', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1212', '199', '1', '3', '99', '1', '10', '19', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1213', '26', '1', '3', '99', '1', '12', '22', null, null, '3', '12', 'A8', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1214', '182', '1', '4', '99', '1', '3', '26', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1215', '47', '1', '4', '99', '1', '4', '28', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1216', '226', '1', '4', '99', '1', '4', '29', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1217', '149', '1', '4', '99', '1', '5', '25', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1218', '125', '1', '4', '99', '1', '6', '23', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1219', '245', '1', '4', '99', '1', '9', '24', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1220', '190', '1', '4', '99', '1', '10', '27', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1221', '4', '1', '4', '99', '1', '12', '30', null, null, '3', '12', 'A8', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1222', '181', '1', '5', '99', '1', '3', '34', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1223', '76', '1', '5', '99', '1', '4', '36', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1224', '221', '1', '5', '99', '1', '4', '37', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1225', '157', '1', '5', '99', '1', '5', '33', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1226', '136', '1', '5', '99', '1', '6', '31', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1227', '249', '1', '5', '99', '1', '9', '32', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1228', '199', '1', '5', '99', '1', '10', '35', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1229', '26', '1', '5', '99', '1', '12', '38', null, null, '3', '12', 'A8', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1230', '182', '1', '6', '99', '1', '3', '42', null, null, '3', '12', 'A4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1231', '47', '1', '6', '99', '1', '4', '44', null, null, '3', '12', 'A6', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1232', '226', '1', '6', '99', '1', '4', '45', null, null, '3', '12', 'A7', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1233', '149', '1', '6', '99', '1', '5', '41', null, null, '3', '12', 'A3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1234', '125', '1', '6', '99', '1', '6', '39', null, null, '3', '12', 'A1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1235', '245', '1', '6', '99', '1', '9', '40', null, null, '3', '12', 'A2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1236', '190', '1', '6', '99', '1', '10', '43', null, null, '3', '12', 'A5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1237', '4', '1', '6', '99', '1', '12', '46', null, null, '3', '12', 'A8', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1238', '2', '1', '7', '99', '1', '1', '47', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1239', '272', '1', '1', '100', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1240', '272', '1', '2', '100', '1', '2', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1241', '272', '1', '3', '100', '1', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1242', '272', '1', '4', '100', '1', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1243', '272', '1', '5', '100', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1244', '272', '1', '1', '101', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1245', '272', '1', '2', '101', '1', '2', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1246', '272', '1', '3', '101', '1', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1247', '272', '1', '4', '101', '1', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1248', '272', '1', '5', '101', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1249', '2', '1', '6', '101', '1', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1250', '2', '1', '7', '101', '1', '1', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1251', '272', '1', '1', '102', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1252', '272', '1', '2', '102', '1', '2', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1253', '272', '1', '3', '102', '1', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1254', '272', '1', '4', '102', '1', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1255', '272', '1', '5', '102', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1256', '2', '1', '6', '102', '1', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1257', '2', '1', '7', '102', '1', '1', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1258', '272', '1', '1', '103', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1259', '272', '1', '2', '103', '1', '2', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1260', '272', '1', '3', '103', '1', '2', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1261', '272', '1', '4', '103', '1', '2', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1262', '272', '1', '5', '103', '1', '2', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1263', '2', '1', '6', '103', '1', '1', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1264', '2', '1', '7', '103', '1', '1', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1265', '173', '1', '1', '105', '1', '3', '8', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1266', '73', '1', '1', '105', '1', '4', '1', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1267', '74', '1', '1', '105', '1', '4', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1268', '103', '1', '1', '105', '1', '4', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1269', '108', '1', '1', '105', '1', '4', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1270', '221', '1', '1', '105', '1', '4', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1271', '225', '1', '1', '105', '1', '4', '6', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1272', '159', '1', '1', '105', '1', '5', '10', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1273', '111', '1', '1', '105', '1', '6', '9', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1274', '245', '1', '1', '105', '1', '9', '11', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1275', '198', '1', '1', '105', '1', '10', '7', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1276', '4', '1', '1', '105', '1', '12', '12', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1277', '173', '1', '2', '105', '1', '3', '20', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1278', '73', '1', '2', '105', '1', '4', '13', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1279', '74', '1', '2', '105', '1', '4', '14', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1280', '103', '1', '2', '105', '1', '4', '15', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1281', '108', '1', '2', '105', '1', '4', '16', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1282', '221', '1', '2', '105', '1', '4', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1283', '225', '1', '2', '105', '1', '4', '18', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1284', '159', '1', '2', '105', '1', '5', '22', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1285', '111', '1', '2', '105', '1', '6', '21', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1286', '245', '1', '2', '105', '1', '9', '23', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1287', '198', '1', '2', '105', '1', '10', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1288', '4', '1', '2', '105', '1', '12', '24', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1289', '173', '1', '3', '105', '1', '3', '32', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1290', '73', '1', '3', '105', '1', '4', '25', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1291', '74', '1', '3', '105', '1', '4', '26', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1292', '103', '1', '3', '105', '1', '4', '27', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1293', '108', '1', '3', '105', '1', '4', '28', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1294', '221', '1', '3', '105', '1', '4', '29', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1295', '225', '1', '3', '105', '1', '4', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1296', '159', '1', '3', '105', '1', '5', '34', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1297', '111', '1', '3', '105', '1', '6', '33', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1298', '245', '1', '3', '105', '1', '9', '35', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1299', '198', '1', '3', '105', '1', '10', '31', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1300', '4', '1', '3', '105', '1', '12', '36', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1301', '173', '1', '4', '105', '1', '3', '44', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1302', '73', '1', '4', '105', '1', '4', '37', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1303', '74', '1', '4', '105', '1', '4', '38', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1304', '103', '1', '4', '105', '1', '4', '39', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1305', '108', '1', '4', '105', '1', '4', '40', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1306', '221', '1', '4', '105', '1', '4', '41', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1307', '225', '1', '4', '105', '1', '4', '42', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1308', '159', '1', '4', '105', '1', '5', '46', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1309', '111', '1', '4', '105', '1', '6', '45', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1310', '245', '1', '4', '105', '1', '9', '47', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1311', '198', '1', '4', '105', '1', '10', '43', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1312', '4', '1', '4', '105', '1', '12', '48', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1313', '173', '1', '5', '105', '1', '3', '56', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1314', '73', '1', '5', '105', '1', '4', '49', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1315', '74', '1', '5', '105', '1', '4', '50', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1316', '103', '1', '5', '105', '1', '4', '51', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1317', '108', '1', '5', '105', '1', '4', '52', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1318', '221', '1', '5', '105', '1', '4', '53', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1319', '225', '1', '5', '105', '1', '4', '54', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1320', '159', '1', '5', '105', '1', '5', '58', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1321', '111', '1', '5', '105', '1', '6', '57', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1322', '245', '1', '5', '105', '1', '9', '59', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1323', '198', '1', '5', '105', '1', '10', '55', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1324', '4', '1', '5', '105', '1', '12', '60', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1325', '2', '1', '6', '105', '1', '1', '61', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1326', '2', '1', '7', '105', '1', '1', '62', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1327', '73', '1', '1', '108', '1', '4', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1328', '90', '1', '1', '108', '1', '4', '6', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1329', '108', '1', '1', '108', '1', '4', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1330', '109', '1', '1', '108', '1', '4', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1331', '232', '1', '1', '108', '1', '4', '7', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1332', '282', '1', '1', '108', '1', '4', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1333', '288', '1', '1', '108', '1', '11', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1334', '29', '1', '1', '108', '1', '12', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1335', '288', '1', '2', '108', '1', '11', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1336', '4', '1', '2', '108', '1', '12', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1337', '29', '1', '2', '108', '1', '12', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1338', '276', '1', '2', '108', '1', '12', '12', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1339', '289', '1', '2', '108', '1', '12', '10', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1340', '73', '1', '3', '108', '1', '4', '18', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1341', '90', '1', '3', '108', '1', '4', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1342', '108', '1', '3', '108', '1', '4', '15', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1343', '109', '1', '3', '108', '1', '4', '16', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1344', '282', '1', '3', '108', '1', '4', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1345', '29', '1', '3', '108', '1', '12', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1346', '288', '1', '4', '108', '1', '11', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1347', '4', '1', '4', '108', '1', '12', '22', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1348', '29', '1', '4', '108', '1', '12', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1349', '276', '1', '4', '108', '1', '12', '23', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1350', '289', '1', '4', '108', '1', '12', '21', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1351', '73', '1', '5', '108', '1', '4', '29', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1352', '90', '1', '5', '108', '1', '4', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1353', '108', '1', '5', '108', '1', '4', '26', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1354', '109', '1', '5', '108', '1', '4', '27', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1355', '232', '1', '5', '108', '1', '4', '31', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1356', '282', '1', '5', '108', '1', '4', '28', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1357', '288', '1', '5', '108', '1', '11', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1358', '29', '1', '5', '108', '1', '12', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1359', '2', '1', '6', '108', '1', '1', '33', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1360', '2', '1', '7', '108', '1', '1', '34', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1361', '47', '1', '1', '109', '1', '4', '4', null, null, '4', '10', 'a3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1362', '90', '1', '1', '109', '1', '4', '2', null, null, '4', '10', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1363', '95', '1', '1', '109', '1', '4', '3', null, null, '4', '10', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1364', '103', '1', '1', '109', '1', '4', '6', null, null, '4', '10', 'a5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1365', '282', '1', '1', '109', '1', '4', '5', null, null, '4', '10', 'a4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1366', '283', '1', '1', '109', '1', '11', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1367', '292', '1', '2', '109', '1', '2', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1368', '4', '1', '2', '109', '1', '12', '7', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1369', '23', '1', '2', '109', '1', '12', '9', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1370', '300', '1', '2', '109', '1', '12', '11', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1371', '301', '1', '2', '109', '1', '12', '10', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1372', '302', '1', '2', '109', '1', '12', '8', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1373', '47', '1', '3', '109', '1', '4', '16', null, null, '4', '10', 'a3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1374', '90', '1', '3', '109', '1', '4', '14', null, null, '4', '10', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1375', '95', '1', '3', '109', '1', '4', '15', null, null, '4', '10', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1376', '103', '1', '3', '109', '1', '4', '18', null, null, '4', '10', 'a5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1377', '282', '1', '3', '109', '1', '4', '17', null, null, '4', '10', 'a4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1378', '283', '1', '3', '109', '1', '11', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1379', '292', '1', '4', '109', '1', '2', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1380', '4', '1', '4', '109', '1', '12', '19', null, null, '3', '10', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1381', '23', '1', '4', '109', '1', '12', '21', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1382', '300', '1', '4', '109', '1', '12', '23', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1383', '301', '1', '4', '109', '1', '12', '22', null, null, '3', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1384', '302', '1', '4', '109', '1', '12', '20', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1385', '47', '1', '5', '109', '1', '4', '28', null, null, '4', '10', 'a3', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1386', '90', '1', '5', '109', '1', '4', '26', null, null, '4', '10', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1387', '95', '1', '5', '109', '1', '4', '27', null, null, '4', '10', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1388', '103', '1', '5', '109', '1', '4', '30', null, null, '4', '10', 'a5', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1389', '282', '1', '5', '109', '1', '4', '29', null, null, '4', '10', 'a4', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1390', '283', '1', '5', '109', '1', '11', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1391', '2', '1', '6', '109', '1', '1', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1392', '2', '1', '7', '109', '1', '1', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1393', '303', '1', '1', '110', '1', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1394', '73', '1', '1', '110', '1', '4', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1395', '221', '1', '1', '110', '1', '4', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1396', '163', '1', '1', '110', '1', '5', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1397', '125', '1', '1', '110', '1', '6', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1398', '279', '1', '1', '110', '1', '9', '1', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1399', '199', '1', '1', '110', '1', '10', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1400', '283', '1', '1', '110', '1', '11', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1401', '43', '1', '1', '110', '1', '12', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1402', '304', '1', '1', '110', '1', '12', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1403', '303', '1', '2', '110', '1', '3', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1404', '73', '1', '2', '110', '1', '4', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1405', '221', '1', '2', '110', '1', '4', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1406', '163', '1', '2', '110', '1', '5', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1407', '125', '1', '2', '110', '1', '6', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1408', '279', '1', '2', '110', '1', '9', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1409', '199', '1', '2', '110', '1', '10', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1410', '283', '1', '2', '110', '1', '11', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1411', '43', '1', '2', '110', '1', '12', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1412', '304', '1', '2', '110', '1', '12', '19', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1413', '303', '1', '3', '110', '1', '3', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1414', '73', '1', '3', '110', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1415', '163', '1', '3', '110', '1', '5', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1416', '125', '1', '3', '110', '1', '6', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1417', '279', '1', '3', '110', '1', '9', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1418', '199', '1', '3', '110', '1', '10', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1419', '283', '1', '3', '110', '1', '11', '29', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1420', '43', '1', '3', '110', '1', '12', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1421', '304', '1', '3', '110', '1', '12', '28', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1422', '303', '1', '4', '110', '1', '3', '33', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1423', '73', '1', '4', '110', '1', '4', '35', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1424', '221', '1', '4', '110', '1', '4', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1425', '163', '1', '4', '110', '1', '5', '32', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1426', '125', '1', '4', '110', '1', '6', '31', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1427', '279', '1', '4', '110', '1', '9', '30', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1428', '199', '1', '4', '110', '1', '10', '34', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1429', '283', '1', '4', '110', '1', '11', '39', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1430', '43', '1', '4', '110', '1', '12', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1431', '304', '1', '4', '110', '1', '12', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1432', '303', '1', '5', '110', '1', '3', '43', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1433', '73', '1', '5', '110', '1', '4', '45', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1434', '221', '1', '5', '110', '1', '4', '46', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1435', '163', '1', '5', '110', '1', '5', '42', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1436', '125', '1', '5', '110', '1', '6', '41', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1437', '279', '1', '5', '110', '1', '9', '40', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1438', '199', '1', '5', '110', '1', '10', '44', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1439', '283', '1', '5', '110', '1', '11', '49', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1440', '43', '1', '5', '110', '1', '12', '47', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1441', '304', '1', '5', '110', '1', '12', '48', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1442', '303', '1', '6', '110', '1', '3', '53', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1443', '73', '1', '6', '110', '1', '4', '55', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1444', '221', '1', '6', '110', '1', '4', '56', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1445', '163', '1', '6', '110', '1', '5', '52', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1446', '125', '1', '6', '110', '1', '6', '51', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1447', '279', '1', '6', '110', '1', '9', '50', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1448', '199', '1', '6', '110', '1', '10', '54', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1449', '283', '1', '6', '110', '1', '11', '59', null, null, '3', null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1450', '43', '1', '6', '110', '1', '12', '57', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1451', '304', '1', '6', '110', '1', '12', '58', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1452', '2', '1', '7', '110', '1', '1', '60', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1453', '216', '1', '1', '111', '1', '3', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1454', '95', '1', '1', '111', '1', '4', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1455', '221', '1', '1', '111', '1', '4', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1456', '159', '1', '1', '111', '1', '5', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1457', '120', '1', '1', '111', '1', '6', '2', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1458', '252', '1', '1', '111', '1', '9', '1', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1459', '191', '1', '1', '111', '1', '10', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1460', '284', '1', '1', '111', '1', '11', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1461', '43', '1', '1', '111', '1', '12', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1462', '304', '1', '1', '111', '1', '12', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1463', '216', '1', '2', '111', '1', '3', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1464', '95', '1', '2', '111', '1', '4', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1465', '221', '1', '2', '111', '1', '4', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1466', '159', '1', '2', '111', '1', '5', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1467', '120', '1', '2', '111', '1', '6', '12', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1468', '252', '1', '2', '111', '1', '9', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1469', '189', '1', '2', '111', '1', '10', '15', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1470', '284', '1', '2', '111', '1', '11', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1471', '43', '1', '2', '111', '1', '12', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1472', '304', '1', '2', '111', '1', '12', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1473', '216', '1', '3', '111', '1', '3', '24', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1474', '95', '1', '3', '111', '1', '4', '26', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1475', '159', '1', '3', '111', '1', '5', '23', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1476', '120', '1', '3', '111', '1', '6', '22', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1477', '252', '1', '3', '111', '1', '9', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1478', '189', '1', '3', '111', '1', '10', '25', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1479', '284', '1', '3', '111', '1', '11', '29', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1480', '43', '1', '3', '111', '1', '12', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1481', '304', '1', '3', '111', '1', '12', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1482', '216', '1', '4', '111', '1', '3', '33', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1483', '95', '1', '4', '111', '1', '4', '35', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1484', '159', '1', '4', '111', '1', '5', '32', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1485', '120', '1', '4', '111', '1', '6', '31', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1486', '252', '1', '4', '111', '1', '9', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1487', '189', '1', '4', '111', '1', '10', '34', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1488', '284', '1', '4', '111', '1', '11', '38', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1489', '43', '1', '4', '111', '1', '12', '36', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1490', '304', '1', '4', '111', '1', '12', '37', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1491', '216', '1', '5', '111', '1', '3', '42', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1492', '73', '1', '5', '111', '1', '4', '44', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1493', '221', '1', '5', '111', '1', '4', '45', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1494', '159', '1', '5', '111', '1', '5', '41', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1495', '120', '1', '5', '111', '1', '6', '40', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1496', '252', '1', '5', '111', '1', '9', '39', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1497', '189', '1', '5', '111', '1', '10', '43', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1498', '284', '1', '5', '111', '1', '11', '48', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1499', '43', '1', '5', '111', '1', '12', '46', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1500', '304', '1', '5', '111', '1', '12', '47', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1501', '216', '1', '6', '111', '1', '3', '52', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1502', '95', '1', '6', '111', '1', '4', '54', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1503', '221', '1', '6', '111', '1', '4', '55', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1504', '159', '1', '6', '111', '1', '5', '51', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1505', '120', '1', '6', '111', '1', '6', '50', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1506', '252', '1', '6', '111', '1', '9', '49', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1507', '189', '1', '6', '111', '1', '10', '53', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1508', '284', '1', '6', '111', '1', '11', '58', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1509', '43', '1', '6', '111', '1', '12', '56', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1510', '304', '1', '6', '111', '1', '12', '57', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1511', '2', '1', '7', '111', '1', '1', '59', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1512', '291', '1', '1', '112', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1513', '169', '1', '2', '112', '1', '3', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1514', '73', '1', '2', '112', '1', '4', '7', null, null, '3', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1515', '226', '1', '2', '112', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1516', '148', '1', '2', '112', '1', '5', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1517', '130', '1', '2', '112', '1', '6', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1518', '249', '1', '2', '112', '1', '9', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1519', '198', '1', '2', '112', '1', '10', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1520', '43', '1', '2', '112', '1', '12', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1521', '304', '1', '2', '112', '1', '12', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1522', '291', '1', '3', '112', '1', '2', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1523', '169', '1', '4', '112', '1', '3', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1524', '73', '1', '4', '112', '1', '4', '17', null, null, '3', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1525', '226', '1', '4', '112', '1', '4', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1526', '148', '1', '4', '112', '1', '5', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1527', '130', '1', '4', '112', '1', '6', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1528', '245', '1', '4', '112', '1', '9', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1529', '190', '1', '4', '112', '1', '10', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1530', '304', '1', '4', '112', '1', '12', '19', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1531', '291', '1', '5', '112', '1', '2', '20', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1532', '169', '1', '6', '112', '1', '3', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1533', '73', '1', '6', '112', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1534', '226', '1', '6', '112', '1', '4', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1535', '148', '1', '6', '112', '1', '5', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1536', '270', '1', '6', '112', '1', '6', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1537', '245', '1', '6', '112', '1', '9', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1538', '190', '1', '6', '112', '1', '10', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1539', '304', '1', '6', '112', '1', '12', '28', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1540', '2', '1', '7', '112', '1', '1', '29', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1541', '291', '1', '1', '113', '1', '2', '1', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1542', '181', '1', '2', '113', '1', '3', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1543', '73', '1', '2', '113', '1', '4', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1544', '226', '1', '2', '113', '1', '4', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1545', '148', '1', '2', '113', '1', '5', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1546', '141', '1', '2', '113', '1', '6', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1547', '249', '1', '2', '113', '1', '9', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1548', '198', '1', '2', '113', '1', '10', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1549', '283', '1', '2', '113', '1', '11', '2', null, null, null, '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1550', '43', '1', '2', '113', '1', '12', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1551', '304', '1', '2', '113', '1', '12', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1552', '291', '1', '3', '113', '1', '2', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1553', '181', '1', '4', '113', '1', '3', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1554', '73', '1', '4', '113', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1555', '226', '1', '4', '113', '1', '4', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1556', '148', '1', '4', '113', '1', '5', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1557', '141', '1', '4', '113', '1', '6', '15', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1558', '249', '1', '4', '113', '1', '9', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1559', '198', '1', '4', '113', '1', '10', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1560', '283', '1', '4', '113', '1', '11', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1561', '43', '1', '4', '113', '1', '12', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1562', '304', '1', '4', '113', '1', '12', '22', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1563', '291', '1', '5', '113', '1', '2', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1564', '181', '1', '6', '113', '1', '3', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1565', '73', '1', '6', '113', '1', '4', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1566', '226', '1', '6', '113', '1', '4', '31', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1567', '148', '1', '6', '113', '1', '5', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1568', '141', '1', '6', '113', '1', '6', '26', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1569', '249', '1', '6', '113', '1', '9', '25', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1570', '198', '1', '6', '113', '1', '10', '29', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1571', '283', '1', '6', '113', '1', '11', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1572', '43', '1', '6', '113', '1', '12', '32', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1573', '304', '1', '6', '113', '1', '12', '33', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1574', '2', '1', '7', '113', '1', '1', '34', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1575', '291', '1', '1', '114', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1576', '181', '1', '2', '114', '1', '3', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1577', '73', '1', '2', '114', '1', '4', '8', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1578', '103', '1', '2', '114', '1', '4', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1579', '226', '1', '2', '114', '1', '4', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1580', '159', '1', '2', '114', '1', '5', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1581', '125', '1', '2', '114', '1', '6', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1582', '248', '1', '2', '114', '1', '9', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1583', '198', '1', '2', '114', '1', '10', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1584', '29', '1', '2', '114', '1', '12', '2', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1585', '291', '1', '3', '114', '1', '2', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1586', '181', '1', '4', '114', '1', '3', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1587', '73', '1', '4', '114', '1', '4', '18', null, null, '4', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1588', '103', '1', '4', '114', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1589', '226', '1', '4', '114', '1', '4', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1590', '159', '1', '4', '114', '1', '5', '15', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1591', '125', '1', '4', '114', '1', '6', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1592', '248', '1', '4', '114', '1', '9', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1593', '198', '1', '4', '114', '1', '10', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1594', '288', '1', '4', '114', '1', '11', '21', null, null, null, '415', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1595', '29', '1', '4', '114', '1', '12', '12', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1596', '291', '1', '5', '114', '1', '2', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1597', '181', '1', '6', '114', '1', '3', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1598', '73', '1', '6', '114', '1', '4', '29', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1599', '103', '1', '6', '114', '1', '4', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1600', '226', '1', '6', '114', '1', '4', '31', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1601', '159', '1', '6', '114', '1', '5', '26', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1602', '125', '1', '6', '114', '1', '6', '25', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1603', '248', '1', '6', '114', '1', '9', '24', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1604', '198', '1', '6', '114', '1', '10', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1605', '29', '1', '6', '114', '1', '12', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1606', '2', '1', '7', '114', '1', '1', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1607', '297', '1', '1', '115', '1', '2', '1', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1608', '181', '1', '2', '115', '1', '3', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1609', '73', '1', '2', '115', '1', '4', '8', null, null, '4', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1610', '103', '1', '2', '115', '1', '4', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1611', '226', '1', '2', '115', '1', '4', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1612', '159', '1', '2', '115', '1', '5', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1613', '125', '1', '2', '115', '1', '6', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1614', '248', '1', '2', '115', '1', '9', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1615', '198', '1', '2', '115', '1', '10', '7', null, null, '4', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1616', '29', '1', '2', '115', '1', '12', '2', null, null, null, '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1617', '297', '1', '3', '115', '1', '2', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1618', '181', '1', '4', '115', '1', '3', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1619', '73', '1', '4', '115', '1', '4', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1620', '103', '1', '4', '115', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1621', '226', '1', '4', '115', '1', '4', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1622', '159', '1', '4', '115', '1', '5', '15', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1623', '125', '1', '4', '115', '1', '6', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1624', '248', '1', '4', '115', '1', '9', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1625', '198', '1', '4', '115', '1', '10', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1626', '29', '1', '4', '115', '1', '12', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1627', '297', '1', '5', '115', '1', '2', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1628', '181', '1', '6', '115', '1', '3', '26', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1629', '73', '1', '6', '115', '1', '4', '28', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1630', '103', '1', '6', '115', '1', '4', '29', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1631', '226', '1', '6', '115', '1', '4', '30', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1632', '159', '1', '6', '115', '1', '5', '25', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1633', '125', '1', '6', '115', '1', '6', '24', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1634', '248', '1', '6', '115', '1', '9', '23', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1635', '198', '1', '6', '115', '1', '10', '27', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1636', '29', '1', '6', '115', '1', '12', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1637', '2', '1', '7', '115', '1', '1', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1638', '272', '1', '1', '116', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1639', '73', '1', '2', '116', '1', '4', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1640', '95', '1', '2', '116', '1', '4', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1641', '103', '1', '2', '116', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1642', '108', '1', '2', '116', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1643', '109', '1', '2', '116', '1', '4', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1644', '221', '1', '2', '116', '1', '4', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1645', '272', '1', '3', '116', '1', '2', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1646', '108', '1', '4', '116', '1', '4', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1647', '109', '1', '4', '116', '1', '4', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1648', '73', '1', '4', '116', '1', '4', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1649', '95', '1', '4', '116', '1', '4', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1650', '103', '1', '4', '116', '1', '4', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1651', '108', '1', '4', '116', '1', '4', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1652', '109', '1', '4', '116', '1', '4', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1653', '221', '1', '4', '116', '1', '4', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1654', '272', '1', '3', '116', '1', '2', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1655', '272', '1', '1', '117', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1656', '73', '1', '2', '117', '1', '4', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1657', '95', '1', '2', '117', '1', '4', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1658', '103', '1', '2', '117', '1', '4', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1659', '108', '1', '2', '117', '1', '4', '2', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1660', '109', '1', '2', '117', '1', '4', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1661', '221', '1', '2', '117', '1', '4', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1662', '272', '1', '3', '117', '1', '2', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1663', '73', '1', '4', '117', '1', '4', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1664', '95', '1', '4', '117', '1', '4', '12', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1665', '103', '1', '4', '117', '1', '4', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1666', '108', '1', '4', '117', '1', '4', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1667', '109', '1', '4', '117', '1', '4', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1668', '221', '1', '4', '117', '1', '4', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1669', '272', '1', '5', '117', '1', '2', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1670', '73', '1', '6', '117', '1', '4', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1671', '95', '1', '6', '117', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1672', '103', '1', '6', '117', '1', '4', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1673', '108', '1', '6', '117', '1', '4', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1674', '109', '1', '6', '117', '1', '4', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1675', '221', '1', '6', '117', '1', '4', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1676', '2', '1', '7', '117', '1', '1', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1677', '292', '1', '1', '118', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1678', '73', '1', '2', '118', '1', '4', '6', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1679', '95', '1', '2', '118', '1', '4', '5', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1680', '103', '1', '2', '118', '1', '4', '4', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1681', '108', '1', '2', '118', '1', '4', '2', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1682', '109', '1', '2', '118', '1', '4', '3', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1683', '221', '1', '2', '118', '1', '4', '7', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1684', '292', '1', '3', '118', '1', '2', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1685', '73', '1', '4', '118', '1', '4', '13', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1686', '95', '1', '4', '118', '1', '4', '12', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1687', '103', '1', '4', '118', '1', '4', '11', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1688', '108', '1', '4', '118', '1', '4', '9', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1689', '109', '1', '4', '118', '1', '4', '10', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1690', '221', '1', '4', '118', '1', '4', '14', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1691', '292', '1', '5', '118', '1', '2', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1692', '73', '1', '6', '118', '1', '4', '20', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1693', '95', '1', '6', '118', '1', '4', '19', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1694', '103', '1', '6', '118', '1', '4', '18', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1695', '108', '1', '6', '118', '1', '4', '16', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1696', '109', '1', '6', '118', '1', '4', '17', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1697', '221', '1', '6', '118', '1', '4', '21', null, null, '4', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1698', '2', '1', '7', '118', '1', '1', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1699', '272', '1', '1', '119', '1', '2', '1', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1700', '182', '1', '2', '119', '1', '3', '5', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1701', '73', '1', '2', '119', '1', '4', '7', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1702', '221', '1', '2', '119', '1', '4', '8', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1703', '168', '1', '2', '119', '1', '5', '4', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1704', '123', '1', '2', '119', '1', '6', '2', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1705', '308', '1', '2', '119', '1', '9', '3', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1706', '198', '1', '2', '119', '1', '10', '6', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1707', '307', '1', '2', '119', '1', '12', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1708', '272', '1', '3', '119', '1', '2', '10', null, null, null, '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1709', '182', '1', '4', '119', '1', '3', '14', null, null, '4', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1710', '73', '1', '4', '119', '1', '4', '16', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1711', '168', '1', '4', '119', '1', '5', '13', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1712', '123', '1', '4', '119', '1', '6', '11', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1713', '308', '1', '4', '119', '1', '9', '12', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1714', '198', '1', '4', '119', '1', '10', '15', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1715', '307', '1', '4', '119', '1', '12', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1716', '272', '1', '5', '119', '1', '2', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1717', '182', '1', '6', '119', '1', '3', '22', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1718', '73', '1', '6', '119', '1', '4', '24', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1719', '168', '1', '6', '119', '1', '5', '21', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1720', '123', '1', '6', '119', '1', '6', '19', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1721', '308', '1', '6', '119', '1', '9', '20', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1722', '198', '1', '6', '119', '1', '10', '23', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1723', '307', '1', '6', '119', '1', '12', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1724', '2', '1', '7', '119', '1', '1', '26', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1725', '310', '1', '1', '120', '1', '3', '4', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1726', '77', '1', '1', '120', '1', '4', '6', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1727', '229', '1', '1', '120', '1', '4', '7', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1728', '153', '1', '1', '120', '1', '5', '3', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1729', '122', '1', '1', '120', '1', '6', '1', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1730', '248', '1', '1', '120', '1', '9', '2', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1731', '312', '1', '1', '120', '1', '10', '5', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1732', '307', '1', '1', '120', '1', '12', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1733', '310', '1', '2', '120', '1', '3', '12', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1734', '77', '1', '2', '120', '1', '4', '14', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1735', '229', '1', '2', '120', '1', '4', '15', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1736', '153', '1', '2', '120', '1', '5', '11', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1737', '122', '1', '2', '120', '1', '6', '9', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1738', '248', '1', '2', '120', '1', '9', '10', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1739', '312', '1', '2', '120', '1', '10', '13', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1740', '307', '1', '2', '120', '1', '12', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1741', '310', '1', '3', '120', '1', '3', '20', null, null, '4', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1742', '77', '1', '3', '120', '1', '4', '22', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1743', '229', '1', '3', '120', '1', '4', '23', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1744', '153', '1', '3', '120', '1', '5', '19', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1745', '122', '1', '3', '120', '1', '6', '17', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1746', '248', '1', '3', '120', '1', '9', '18', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1747', '312', '1', '3', '120', '1', '10', '21', null, null, '4', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1748', '307', '1', '3', '120', '1', '12', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1749', '310', '1', '4', '120', '1', '3', '28', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1750', '77', '1', '4', '120', '1', '4', '30', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1751', '229', '1', '4', '120', '1', '4', '31', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1752', '153', '1', '4', '120', '1', '5', '27', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1753', '122', '1', '4', '120', '1', '6', '25', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1754', '248', '1', '4', '120', '1', '9', '26', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1755', '312', '1', '4', '120', '1', '10', '29', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1756', '307', '1', '4', '120', '1', '12', '32', null, null, null, '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1757', '310', '1', '5', '120', '1', '3', '36', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1758', '77', '1', '5', '120', '1', '4', '35', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1759', '77', '1', '5', '120', '1', '4', '38', null, null, '4', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1760', '229', '1', '5', '120', '1', '4', '39', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1761', '122', '1', '5', '120', '1', '6', '33', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1762', '248', '1', '5', '120', '1', '9', '34', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1763', '312', '1', '5', '120', '1', '10', '37', null, null, '4', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1764', '307', '1', '5', '120', '1', '12', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1765', '310', '1', '6', '120', '1', '3', '44', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1766', '77', '1', '6', '120', '1', '4', '46', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1767', '229', '1', '6', '120', '1', '4', '47', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1768', '153', '1', '6', '120', '1', '5', '43', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1769', '122', '1', '6', '120', '1', '6', '41', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1770', '248', '1', '6', '120', '1', '9', '42', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1771', '312', '1', '6', '120', '1', '10', '45', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1772', '307', '1', '6', '120', '1', '12', '48', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1773', '2', '1', '7', '120', '1', '1', '49', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1774', '173', '1', '1', '121', '1', '3', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1775', '49', '1', '1', '121', '1', '4', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1776', '313', '1', '1', '121', '1', '4', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1777', '148', '1', '1', '121', '1', '5', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1778', '125', '1', '1', '121', '1', '6', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1779', '252', '1', '1', '121', '1', '9', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1780', '205', '1', '1', '121', '1', '10', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1781', '173', '1', '1', '121', '1', '3', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1782', '49', '1', '1', '121', '1', '4', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1783', '313', '1', '1', '121', '1', '4', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1784', '148', '1', '1', '121', '1', '5', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1785', '125', '1', '1', '121', '1', '6', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1786', '252', '1', '1', '121', '1', '9', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1787', '205', '1', '1', '121', '1', '10', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1788', '23', '1', '1', '121', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1789', '302', '1', '1', '121', '1', '12', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1790', '23', '1', '1', '121', '1', '12', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1791', '302', '1', '1', '121', '1', '12', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1792', '23', '1', '1', '121', '1', '12', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1793', '302', '1', '1', '121', '1', '12', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1794', '23', '1', '1', '121', '1', '12', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1795', '302', '1', '1', '121', '1', '12', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1796', '173', '1', '1', '122', '1', '3', '4', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1797', '49', '1', '1', '122', '1', '4', '6', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1798', '313', '1', '1', '122', '1', '4', '7', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1799', '148', '1', '1', '122', '1', '5', '3', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1800', '125', '1', '1', '122', '1', '6', '1', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1801', '252', '1', '1', '122', '1', '9', '2', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1802', '205', '1', '1', '122', '1', '10', '5', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1803', '23', '1', '1', '122', '1', '12', '8', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1804', '302', '1', '1', '122', '1', '12', '9', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1805', '173', '1', '2', '122', '1', '3', '13', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1806', '49', '1', '2', '122', '1', '4', '15', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1807', '313', '1', '2', '122', '1', '4', '16', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1808', '148', '1', '2', '122', '1', '5', '12', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1809', '125', '1', '2', '122', '1', '6', '10', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1810', '252', '1', '2', '122', '1', '9', '11', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1811', '205', '1', '2', '122', '1', '10', '14', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1812', '23', '1', '2', '122', '1', '12', '17', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1813', '302', '1', '2', '122', '1', '12', '18', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1814', '173', '1', '3', '122', '1', '3', '22', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1815', '50', '1', '3', '122', '1', '4', '24', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1816', '313', '1', '3', '122', '1', '4', '25', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1817', '148', '1', '3', '122', '1', '5', '21', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1818', '125', '1', '3', '122', '1', '6', '19', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1819', '252', '1', '3', '122', '1', '9', '20', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1820', '205', '1', '3', '122', '1', '10', '23', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1821', '23', '1', '3', '122', '1', '12', '26', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1822', '302', '1', '3', '122', '1', '12', '27', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1823', '173', '1', '4', '122', '1', '3', '31', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1824', '49', '1', '4', '122', '1', '4', '33', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1825', '313', '1', '4', '122', '1', '4', '34', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1826', '148', '1', '4', '122', '1', '5', '30', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1827', '125', '1', '4', '122', '1', '6', '28', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1828', '252', '1', '4', '122', '1', '9', '29', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1829', '205', '1', '4', '122', '1', '10', '32', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1830', '23', '1', '4', '122', '1', '12', '35', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1831', '302', '1', '4', '122', '1', '12', '36', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1832', '173', '1', '5', '122', '1', '3', '40', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1833', '49', '1', '5', '122', '1', '4', '42', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1834', '313', '1', '5', '122', '1', '4', '43', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1835', '148', '1', '5', '122', '1', '5', '39', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1836', '125', '1', '5', '122', '1', '6', '37', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1837', '252', '1', '5', '122', '1', '9', '38', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1838', '205', '1', '5', '122', '1', '10', '41', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1839', '23', '1', '5', '122', '1', '12', '44', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1840', '302', '1', '5', '122', '1', '12', '45', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1841', '173', '1', '6', '122', '1', '3', '49', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1842', '49', '1', '6', '122', '1', '4', '51', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1843', '313', '1', '6', '122', '1', '4', '52', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1844', '148', '1', '6', '122', '1', '5', '48', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1845', '125', '1', '6', '122', '1', '6', '46', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1846', '252', '1', '6', '122', '1', '9', '47', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1847', '205', '1', '6', '122', '1', '10', '50', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1848', '23', '1', '6', '122', '1', '12', '53', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1849', '302', '1', '6', '122', '1', '12', '54', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1850', '2', '1', '7', '122', '1', '1', '55', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1851', '272', '1', '1', '123', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1852', '176', '1', '2', '123', '1', '3', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1853', '55', '1', '2', '123', '1', '4', '3', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1854', '55', '1', '2', '123', '1', '4', '4', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1855', '224', '1', '2', '123', '1', '4', '5', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1856', '126', '1', '2', '123', '1', '6', '6', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1857', '245', '1', '2', '123', '1', '9', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1858', '198', '1', '2', '123', '1', '10', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1859', '43', '1', '2', '123', '1', '12', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1860', '314', '1', '2', '123', '1', '12', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1861', '272', '1', '3', '123', '1', '2', '11', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1862', '176', '1', '4', '123', '1', '3', '12', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1863', '55', '1', '4', '123', '1', '4', '13', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1864', '224', '1', '4', '123', '1', '4', '14', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1865', '55', '1', '4', '123', '1', '4', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1866', '224', '1', '4', '123', '1', '4', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1867', '126', '1', '4', '123', '1', '6', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1868', '245', '1', '4', '123', '1', '9', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1869', '198', '1', '4', '123', '1', '10', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1870', '43', '1', '4', '123', '1', '12', '20', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1871', '314', '1', '4', '123', '1', '12', '21', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1872', '272', '1', '5', '123', '1', '2', '22', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1873', '176', '1', '6', '123', '1', '3', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1874', '55', '1', '6', '123', '1', '4', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1875', '224', '1', '6', '123', '1', '4', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1876', '315', '1', '6', '123', '1', '5', '26', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1877', '126', '1', '6', '123', '1', '6', '27', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1878', '245', '1', '6', '123', '1', '9', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1879', '198', '1', '6', '123', '1', '10', '29', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1880', '43', '1', '6', '123', '1', '12', '30', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1881', '314', '1', '6', '123', '1', '12', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1882', '2', '1', '7', '123', '1', '1', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1883', '173', '1', '1', '124', '1', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1884', '71', '1', '1', '124', '1', '4', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1885', '221', '1', '1', '124', '1', '4', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1886', '152', '1', '1', '124', '1', '5', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1887', '130', '1', '1', '124', '1', '6', '1', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1888', '248', '1', '1', '124', '1', '9', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1889', '198', '1', '1', '124', '1', '10', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1890', '29', '1', '1', '124', '1', '12', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1891', '173', '1', '2', '124', '1', '3', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1892', '71', '1', '2', '124', '1', '4', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1893', '221', '1', '2', '124', '1', '4', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1894', '152', '1', '2', '124', '1', '5', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1895', '130', '1', '2', '124', '1', '6', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1896', '248', '1', '2', '124', '1', '9', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1897', '198', '1', '2', '124', '1', '10', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1898', '29', '1', '2', '124', '1', '12', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1899', '173', '1', '3', '124', '1', '3', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1900', '71', '1', '3', '124', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1901', '152', '1', '3', '124', '1', '5', '19', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1902', '130', '1', '3', '124', '1', '6', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1903', '248', '1', '3', '124', '1', '9', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1904', '198', '1', '3', '124', '1', '10', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1905', '29', '1', '3', '124', '1', '12', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1906', '173', '1', '4', '124', '1', '3', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1907', '71', '1', '4', '124', '1', '4', '29', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1908', '152', '1', '4', '124', '1', '5', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1909', '130', '1', '4', '124', '1', '6', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1910', '248', '1', '4', '124', '1', '9', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1911', '199', '1', '4', '124', '1', '10', '28', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1912', '29', '1', '4', '124', '1', '12', '30', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1913', '173', '1', '5', '124', '1', '3', '34', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1914', '71', '1', '5', '124', '1', '4', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1915', '221', '1', '5', '124', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1916', '152', '1', '5', '124', '1', '5', '33', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1917', '130', '1', '5', '124', '1', '6', '31', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1918', '248', '1', '5', '124', '1', '9', '32', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1919', '198', '1', '5', '124', '1', '10', '35', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1920', '29', '1', '5', '124', '1', '12', '38', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1921', '2', '1', '6', '124', '1', '1', '39', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1922', '2', '1', '7', '124', '1', '1', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1923', '216', '1', '1', '125', '1', '3', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1924', '73', '1', '1', '125', '1', '4', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1925', '159', '1', '1', '125', '1', '5', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1926', '112', '1', '1', '125', '1', '6', '1', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1927', '252', '1', '1', '125', '1', '9', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1928', '190', '1', '1', '125', '1', '10', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1929', '29', '1', '1', '125', '1', '12', '7', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1930', '216', '1', '2', '125', '1', '3', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1931', '73', '1', '2', '125', '1', '4', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1932', '313', '1', '2', '125', '1', '4', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1933', '159', '1', '2', '125', '1', '5', '10', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1934', '112', '1', '2', '125', '1', '6', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1935', '252', '1', '2', '125', '1', '9', '9', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1936', '190', '1', '2', '125', '1', '10', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1937', '29', '1', '2', '125', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1938', '216', '1', '3', '125', '1', '3', '19', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1939', '73', '1', '3', '125', '1', '4', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1940', '313', '1', '3', '125', '1', '4', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1941', '159', '1', '3', '125', '1', '5', '18', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1942', '112', '1', '3', '125', '1', '6', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1943', '252', '1', '3', '125', '1', '9', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1944', '190', '1', '3', '125', '1', '10', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1945', '29', '1', '3', '125', '1', '12', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1946', '216', '1', '4', '125', '1', '3', '27', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1947', '73', '1', '4', '125', '1', '4', '29', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1948', '313', '1', '4', '125', '1', '4', '30', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1949', '159', '1', '4', '125', '1', '5', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1950', '112', '1', '4', '125', '1', '6', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1951', '252', '1', '4', '125', '1', '9', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1952', '190', '1', '4', '125', '1', '10', '28', null, null, '3', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1953', '29', '1', '4', '125', '1', '12', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1954', '216', '1', '5', '125', '1', '3', '35', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1955', '73', '1', '5', '125', '1', '4', '37', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1956', '313', '1', '5', '125', '1', '4', '38', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1957', '159', '1', '5', '125', '1', '5', '34', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1958', '112', '1', '5', '125', '1', '6', '32', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1959', '252', '1', '5', '125', '1', '9', '33', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1960', '190', '1', '5', '125', '1', '10', '36', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1961', '29', '1', '5', '125', '1', '12', '39', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1962', '2', '1', '6', '125', '1', '1', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1963', '2', '1', '7', '125', '1', '1', '41', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1964', '181', '1', '1', '126', '1', '3', '5', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1965', '152', '1', '1', '126', '1', '5', '4', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1966', '120', '1', '1', '126', '1', '6', '2', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1967', '248', '1', '1', '126', '1', '9', '3', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1968', '316', '1', '1', '126', '1', '10', '6', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1969', '284', '1', '1', '126', '1', '11', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1970', '4', '1', '1', '126', '1', '12', '8', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1971', '10', '1', '1', '126', '1', '12', '7', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1972', '73', '1', '2', '126', '1', '4', '10', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1973', '77', '1', '2', '126', '1', '4', '11', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1974', '90', '1', '2', '126', '1', '4', '12', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1975', '110', '1', '2', '126', '1', '4', '14', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1976', '305', '1', '2', '126', '1', '4', '13', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1977', '313', '1', '2', '126', '1', '4', '15', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1978', '284', '1', '2', '126', '1', '11', '9', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('1979', '181', '1', '3', '126', '1', '3', '21', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1980', '152', '1', '3', '126', '1', '5', '20', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1981', '120', '1', '3', '126', '1', '6', '20', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1982', '248', '1', '3', '126', '1', '9', '20', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1983', '316', '1', '3', '126', '1', '10', '21', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1984', '284', '1', '3', '126', '1', '11', '19', null, null, null, null, '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1985', '4', '1', '3', '126', '1', '12', '23', null, null, '4', '20', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1986', '10', '1', '3', '126', '1', '12', '22', null, null, '4', '20', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1987', '73', '1', '4', '126', '1', '4', '26', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1988', '77', '1', '4', '126', '1', '4', '27', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1989', '90', '1', '4', '126', '1', '4', '28', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1990', '110', '1', '4', '126', '1', '4', '30', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1991', '305', '1', '4', '126', '1', '4', '29', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1992', '313', '1', '4', '126', '1', '4', '30', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1993', '284', '1', '4', '126', '1', '11', '25', null, null, null, null, '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1994', '181', '1', '5', '126', '1', '3', '35', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1995', '152', '1', '5', '126', '1', '5', '34', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1996', '120', '1', '5', '126', '1', '6', '32', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1997', '248', '1', '5', '126', '1', '9', '33', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1998', '316', '1', '5', '126', '1', '10', '36', null, null, '3', '12', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('1999', '284', '1', '5', '126', '1', '11', '31', null, null, null, null, '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('2000', '4', '1', '5', '126', '1', '12', '38', null, null, '4', '20', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('2001', '10', '1', '5', '126', '1', '12', '37', null, null, '4', '20', '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('2002', '2', '1', '6', '126', '1', '1', '39', null, null, null, null, '', '0');
INSERT INTO `sgejerciciosrutina` VALUES ('2003', '2', '1', '7', '126', '1', '1', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2004', '272', '1', '3', '126', '1', '2', '41', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2005', '181', '1', '4', '126', '1', '3', '20', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2006', '152', '1', '4', '126', '1', '5', '19', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2007', '120', '1', '4', '126', '1', '6', '17', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2008', '248', '1', '4', '126', '1', '9', '18', null, null, '3', '21', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2009', '316', '1', '4', '126', '1', '10', '21', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2010', '284', '1', '4', '126', '1', '11', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2011', '4', '1', '4', '126', '1', '12', '23', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2012', '10', '1', '4', '126', '1', '12', '22', null, null, '4', '20', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2013', '73', '1', '5', '126', '1', '4', '25', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2014', '77', '1', '5', '126', '1', '4', '26', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2015', '90', '1', '5', '126', '1', '4', '27', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2016', '110', '1', '5', '126', '1', '4', '29', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2017', '305', '1', '5', '126', '1', '4', '28', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2018', '313', '1', '5', '126', '1', '4', '30', null, null, '3', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2019', '284', '1', '5', '126', '1', '11', '24', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2020', '2', '1', '6', '126', '1', '1', '31', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2021', '291', '1', '1', '127', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2022', '169', '1', '2', '127', '1', '3', '5', null, null, '3', '5', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2023', '73', '1', '2', '127', '1', '4', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2024', '226', '1', '2', '127', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2025', '149', '1', '2', '127', '1', '5', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2026', '130', '1', '2', '127', '1', '6', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2027', '245', '1', '2', '127', '1', '9', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2028', '190', '1', '2', '127', '1', '10', '6', null, null, '3', '51', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2029', '304', '1', '2', '127', '1', '12', '9', null, null, '4', '25', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2030', '291', '1', '3', '127', '1', '2', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2031', '169', '1', '4', '127', '1', '3', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2032', '73', '1', '4', '127', '1', '4', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2033', '226', '1', '4', '127', '1', '4', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2034', '149', '1', '4', '127', '1', '5', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2035', '130', '1', '4', '127', '1', '6', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2036', '245', '1', '4', '127', '1', '9', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2037', '190', '1', '4', '127', '1', '10', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2038', '304', '1', '4', '127', '1', '12', '18', null, null, '4', '25', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2039', '291', '1', '5', '127', '1', '2', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2040', '169', '1', '6', '127', '1', '3', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2041', '73', '1', '6', '127', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2042', '226', '1', '6', '127', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2043', '149', '1', '6', '127', '1', '5', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2044', '130', '1', '6', '127', '1', '6', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2045', '245', '1', '6', '127', '1', '9', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2046', '190', '1', '6', '127', '1', '10', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2047', '304', '1', '6', '127', '1', '12', '27', null, null, '4', '25', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2048', '2', '1', '7', '127', '1', '1', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2049', '291', '1', '1', '128', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2050', '181', '1', '2', '128', '1', '3', '5', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2051', '50', '1', '2', '128', '1', '4', '7', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2052', '50', '1', '2', '128', '1', '4', '4', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2053', '313', '1', '2', '128', '1', '4', '8', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2054', '141', '1', '2', '128', '1', '6', '2', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2055', '249', '1', '2', '128', '1', '9', '3', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2056', '198', '1', '2', '128', '1', '10', '6', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2057', '307', '1', '2', '128', '1', '12', '9', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2058', '291', '1', '3', '128', '1', '2', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2059', '181', '1', '4', '128', '1', '3', '14', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2060', '50', '1', '4', '128', '1', '4', '16', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2061', '313', '1', '4', '128', '1', '4', '17', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2062', '149', '1', '4', '128', '1', '5', '13', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2063', '141', '1', '4', '128', '1', '6', '11', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2064', '249', '1', '4', '128', '1', '9', '12', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2065', '198', '1', '4', '128', '1', '10', '15', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2066', '307', '1', '4', '128', '1', '12', '18', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2067', '291', '1', '5', '128', '1', '2', '19', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2068', '181', '1', '6', '128', '1', '3', '23', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2069', '50', '1', '6', '128', '1', '4', '25', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2070', '226', '1', '6', '128', '1', '4', '26', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2071', '149', '1', '6', '128', '1', '5', '22', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2072', '141', '1', '6', '128', '1', '6', '20', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2073', '249', '1', '6', '128', '1', '9', '21', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2074', '198', '1', '6', '128', '1', '10', '24', null, null, '3', '15', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2075', '307', '1', '6', '128', '1', '12', '27', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2076', '2', '1', '7', '128', '1', '1', '28', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2077', '272', '1', '1', '129', '1', '2', '1', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2078', '170', '1', '2', '129', '1', '3', '8', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2079', '171', '1', '2', '129', '1', '3', '9', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2080', '108', '1', '2', '129', '1', '4', '12', null, null, '4', '20', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2081', '109', '1', '2', '129', '1', '4', '13', null, null, '4', '20', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2082', '224', '1', '2', '129', '1', '4', '14', null, null, '4', '12', 'g', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2083', '148', '1', '2', '129', '1', '5', '6', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2084', '159', '1', '2', '129', '1', '5', '7', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2085', '111', '1', '2', '129', '1', '6', '2', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2086', '125', '1', '2', '129', '1', '6', '3', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2087', '246', '1', '2', '129', '1', '9', '4', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2088', '248', '1', '2', '129', '1', '9', '5', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2089', '192', '1', '2', '129', '1', '10', '10', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2090', '199', '1', '2', '129', '1', '10', '11', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2091', '11', '1', '2', '129', '1', '12', '15', null, null, '4', '25', 'h', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2092', '272', '1', '3', '129', '1', '2', '16', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2093', '170', '1', '4', '129', '1', '3', '23', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2094', '171', '1', '4', '129', '1', '3', '24', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2095', '108', '1', '4', '129', '1', '4', '27', null, null, '4', '12', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2096', '109', '1', '4', '129', '1', '4', '28', null, null, '4', '12', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2097', '224', '1', '4', '129', '1', '4', '29', null, null, '4', '12', 'g', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2098', '148', '1', '4', '129', '1', '5', '21', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2099', '159', '1', '4', '129', '1', '5', '22', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2100', '111', '1', '4', '129', '1', '6', '17', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2101', '125', '1', '4', '129', '1', '6', '18', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2102', '246', '1', '4', '129', '1', '9', '19', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2103', '248', '1', '4', '129', '1', '9', '20', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2104', '192', '1', '4', '129', '1', '10', '25', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2105', '199', '1', '4', '129', '1', '10', '26', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2106', '272', '1', '5', '129', '1', '2', '30', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2107', '170', '1', '6', '129', '1', '3', '37', null, null, '4', '12', 'd1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2108', '171', '1', '6', '129', '1', '3', '38', null, null, '4', '12', 'd2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2109', '108', '1', '6', '129', '1', '4', '41', null, null, '4', '12', 'f1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2110', '109', '1', '6', '129', '1', '4', '42', null, null, '4', '12', 'f2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2111', '149', '1', '6', '129', '1', '5', '35', null, null, '4', '12', 'c1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2112', '159', '1', '6', '129', '1', '5', '36', null, null, '4', '12', 'c2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2113', '111', '1', '6', '129', '1', '6', '31', null, null, '4', '12', 'a1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2114', '125', '1', '6', '129', '1', '6', '32', null, null, '4', '12', 'a2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2115', '246', '1', '6', '129', '1', '9', '33', null, null, '4', '12', 'b1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2116', '248', '1', '6', '129', '1', '9', '34', null, null, '4', '12', 'b2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2117', '192', '1', '6', '129', '1', '10', '39', null, null, '4', '12', 'e1', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2118', '199', '1', '6', '129', '1', '10', '40', null, null, '4', '12', 'e2', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2119', '2', '1', '7', '129', '1', '1', '43', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2120', '171', '1', '1', '130', '1', '3', '3', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2121', '78', '1', '1', '130', '1', '4', '5', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2122', '86', '1', '1', '130', '1', '4', '6', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2123', '224', '1', '1', '130', '1', '4', '7', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2124', '114', '1', '1', '130', '1', '6', '1', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2125', '257', '1', '1', '130', '1', '9', '2', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2126', '196', '1', '1', '130', '1', '10', '4', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2127', '43', '1', '1', '130', '1', '12', '8', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2128', '171', '1', '2', '130', '1', '3', '12', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2129', '86', '1', '2', '130', '1', '4', '14', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2130', '315', '1', '2', '130', '1', '5', '11', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2131', '131', '1', '2', '130', '1', '6', '9', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2132', '257', '1', '2', '130', '1', '9', '10', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2133', '196', '1', '2', '130', '1', '10', '13', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2134', '43', '1', '2', '130', '1', '12', '15', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2135', '171', '1', '3', '130', '1', '3', '19', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2136', '86', '1', '3', '130', '1', '4', '21', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2137', '224', '1', '3', '130', '1', '4', '22', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2138', '315', '1', '3', '130', '1', '5', '18', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2139', '131', '1', '3', '130', '1', '6', '16', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2140', '257', '1', '3', '130', '1', '9', '17', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2141', '196', '1', '3', '130', '1', '10', '20', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2142', '43', '1', '3', '130', '1', '12', '23', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2143', '171', '1', '4', '130', '1', '3', '27', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2144', '86', '1', '4', '130', '1', '4', '29', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2145', '315', '1', '4', '130', '1', '5', '26', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2146', '131', '1', '4', '130', '1', '6', '24', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2147', '257', '1', '4', '130', '1', '9', '25', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2148', '196', '1', '4', '130', '1', '10', '28', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2149', '43', '1', '4', '130', '1', '12', '30', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2150', '171', '1', '5', '130', '1', '3', '34', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2151', '86', '1', '5', '130', '1', '4', '36', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2152', '224', '1', '5', '130', '1', '4', '37', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2153', '315', '1', '5', '130', '1', '5', '33', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2154', '131', '1', '5', '130', '1', '6', '31', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2155', '257', '1', '5', '130', '1', '9', '32', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2156', '196', '1', '5', '130', '1', '10', '35', null, null, '4', '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2157', '43', '1', '5', '130', '1', '12', '38', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2158', '2', '1', '6', '130', '1', '1', '39', null, null, null, '12', '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('2159', '2', '1', '7', '130', '1', '1', '40', null, null, null, null, '', '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3247', '47', '1', '1', '158', '2', '4', '4', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3248', '48', '1', '1', '158', '2', '4', '1', null, null, '4', '15', null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3249', '49', '1', '1', '158', '2', '4', '5', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3250', '50', '1', '1', '158', '2', '4', '2', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3251', '51', '1', '1', '158', '2', '4', '3', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3252', '52', '1', '1', '158', '2', '4', '6', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3253', '54', '1', '1', '158', '2', '4', '7', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3254', '55', '1', '1', '158', '2', '4', '8', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3255', '68', '1', '1', '158', '2', '4', '9', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3256', '146', '1', '1', '158', '2', '5', '10', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3257', '148', '1', '1', '158', '2', '5', '11', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3258', '149', '1', '1', '158', '2', '5', '12', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3259', '150', '1', '1', '158', '2', '5', '13', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3260', '151', '1', '1', '158', '2', '5', '14', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3261', '152', '1', '1', '158', '2', '5', '15', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3262', '111', '1', '1', '158', '2', '6', '16', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3263', '112', '1', '1', '158', '2', '6', '17', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3264', '113', '1', '1', '158', '2', '6', '22', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3265', '114', '1', '1', '158', '2', '6', '18', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3266', '115', '1', '1', '158', '2', '6', '25', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3267', '116', '1', '1', '158', '2', '6', '23', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3268', '117', '1', '1', '158', '2', '6', '20', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3269', '118', '1', '1', '158', '2', '6', '19', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3270', '119', '1', '1', '158', '2', '6', '24', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3271', '120', '1', '1', '158', '2', '6', '21', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3287', '245', '1', '3', '158', '2', '9', '42', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3288', '246', '1', '3', '158', '2', '9', '43', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3289', '247', '1', '3', '158', '2', '9', '45', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3290', '248', '1', '3', '158', '2', '9', '48', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3291', '249', '1', '3', '158', '2', '9', '47', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3292', '250', '1', '3', '158', '2', '9', '46', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3293', '251', '1', '3', '158', '2', '9', '44', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3294', '189', '1', '3', '158', '2', '10', '49', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3295', '190', '1', '3', '158', '2', '10', '50', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3296', '191', '1', '3', '158', '2', '10', '51', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3297', '192', '1', '3', '158', '2', '10', '52', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3298', '193', '1', '3', '158', '2', '10', '53', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3299', '194', '1', '3', '158', '2', '10', '54', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3300', '195', '1', '3', '158', '2', '10', '55', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3301', '196', '1', '3', '158', '2', '10', '56', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3302', '286', '1', '3', '158', '2', '11', '57', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3304', '47', '1', '5', '158', '2', '4', '68', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3305', '48', '1', '5', '158', '2', '4', '69', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3306', '49', '1', '5', '158', '2', '4', '67', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3307', '50', '1', '5', '158', '2', '4', '70', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3308', '51', '1', '5', '158', '2', '4', '66', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3309', '52', '1', '5', '158', '2', '4', '65', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3310', '54', '1', '5', '158', '2', '4', '71', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3311', '55', '1', '5', '158', '2', '4', '72', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3312', '68', '1', '5', '158', '2', '4', '73', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3313', '69', '1', '5', '158', '2', '4', '74', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3314', '169', '1', '6', '158', '2', '3', '76', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3315', '170', '1', '6', '158', '2', '3', '77', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3316', '171', '1', '6', '158', '2', '3', '81', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3317', '172', '1', '6', '158', '2', '3', '78', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3318', '173', '1', '6', '158', '2', '3', '79', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3319', '174', '1', '6', '158', '2', '3', '80', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3320', '175', '1', '6', '158', '2', '3', '82', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3321', '176', '1', '6', '158', '2', '3', '75', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3322', '177', '1', '6', '158', '2', '3', '83', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3323', '189', '1', '6', '158', '2', '10', '84', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3324', '190', '1', '6', '158', '2', '10', '85', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3325', '191', '1', '6', '158', '2', '10', '86', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3326', '192', '1', '6', '158', '2', '10', '87', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3327', '193', '1', '6', '158', '2', '10', '88', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3328', '288', '1', '6', '158', '2', '11', '89', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3329', '2', '1', '7', '158', '2', '1', '90', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3350', '111', '1', null, '158', '2', '6', '94', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3351', '112', '1', null, '158', '2', '6', '95', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3352', '113', '1', null, '158', '2', '6', '96', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3353', '114', '1', null, '158', '2', '6', '97', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3354', '115', '1', null, '158', '2', '6', '98', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3355', '116', '1', null, '158', '2', '6', '99', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3356', '117', '1', null, '158', '2', '6', '100', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3357', '118', '1', null, '158', '2', '6', '101', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3358', '119', '1', null, '158', '2', '6', '102', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3367', '142', '1', null, '158', '2', '5', '111', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3368', '143', '1', null, '158', '2', '5', '112', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3369', '144', '1', null, '158', '2', '5', '113', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3370', '145', '1', null, '158', '2', '5', '114', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3371', '146', '1', null, '158', '2', '5', '115', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3372', '148', '1', null, '158', '2', '5', '116', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3373', '149', '1', null, '158', '2', '5', '117', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3374', '150', '1', null, '158', '2', '5', '118', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3734', '47', '1', '2', '158', '2', '4', '26', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3735', '48', '1', '2', '158', '2', '4', '27', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3736', '49', '1', '2', '158', '2', '4', '28', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3737', '50', '1', '2', '158', '2', '4', '29', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3738', '51', '1', '2', '158', '2', '4', '30', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3739', '52', '1', '2', '158', '2', '4', '31', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3740', '54', '1', '2', '158', '2', '4', '32', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3741', '55', '1', '2', '158', '2', '4', '33', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3742', '68', '1', '2', '158', '2', '4', '34', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3743', '111', '1', '2', '158', '2', '6', '35', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3744', '112', '1', '2', '158', '2', '6', '36', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3745', '113', '1', '2', '158', '2', '6', '37', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3746', '114', '1', '2', '158', '2', '6', '38', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3747', '115', '1', '2', '158', '2', '6', '39', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3748', '116', '1', '2', '158', '2', '6', '40', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3749', '117', '1', '2', '158', '2', '6', '41', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3750', '293', '1', '4', '158', '2', '2', '58', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3751', '143', '1', '4', '158', '2', '5', '59', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3752', '144', '1', '4', '158', '2', '5', '60', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3753', '145', '1', '4', '158', '2', '5', '61', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3754', '146', '1', '4', '158', '2', '5', '62', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3755', '148', '1', '4', '158', '2', '5', '63', null, null, null, null, null, '1');
INSERT INTO `sgejerciciosrutina` VALUES ('3756', '149', '1', '4', '158', '2', '5', '64', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `sgejerciciosrutinacliente`
-- ----------------------------
DROP TABLE IF EXISTS `sgejerciciosrutinacliente`;
CREATE TABLE `sgejerciciosrutinacliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ejercicio` int(11) NOT NULL,
  `id_usuariocreacion` int(11) NOT NULL,
  `id_dia` int(11) NOT NULL,
  `id_rutina` int(11) NOT NULL,
  `id_categoriarutina` int(11) NOT NULL,
  `id_tiporutinaejercicio` int(11) NOT NULL,
  `id_posicionejercicio` int(11) DEFAULT NULL,
  `nb_ejerciciorutina` varchar(250) NOT NULL,
  `desc_ejerciciorutina` varchar(500) NOT NULL,
  `num_circuitos` int(11) NOT NULL,
  `num_repeticiones` int(11) NOT NULL,
  `ejercicio_relacion` varchar(10) DEFAULT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgejerciciosrutinacliente
-- ----------------------------
INSERT INTO `sgejerciciosrutinacliente` VALUES ('1', '120', '1', '1', '1', '1', '6', '1', '', '', '4', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('2', '246', '1', '1', '1', '1', '9', '2', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('3', '245', '1', '1', '1', '1', '9', '3', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('4', '122', '1', '1', '1', '1', '6', '4', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('5', '163', '1', '1', '1', '1', '5', '5', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('6', '159', '1', '1', '1', '1', '5', '6', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('7', '181', '1', '1', '1', '1', '3', '7', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('8', '216', '1', '1', '1', '1', '3', '8', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('9', '95', '1', '1', '1', '1', '4', '9', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('10', '196', '1', '1', '1', '1', '10', '10', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('11', '73', '1', '1', '1', '1', '4', '11', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('12', '199', '1', '1', '1', '1', '10', '12', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('13', '226', '1', '1', '1', '1', '4', '13', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('14', '4', '1', '1', '1', '1', '12', '14', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('15', '26', '1', '1', '1', '1', '12', '15', '', '', '3', '15', '', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('16', '245', '1', '2', '1', '1', '9', '16', '', '', '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('17', '246', '1', '2', '1', '1', '9', '17', '', '', '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('18', '120', '1', '2', '1', '1', '6', '18', '', '', '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('19', '122', '1', '2', '1', '1', '6', '19', '', '', '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('20', '159', '1', '2', '1', '1', '5', '20', '', '', '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('21', '163', '1', '2', '1', '1', '5', '21', '', '', '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('22', '181', '1', '2', '1', '1', '3', '22', '', '', '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('23', '216', '1', '2', '1', '1', '3', '23', '', '', '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('24', '196', '1', '2', '1', '1', '10', '24', '', '', '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('25', '199', '1', '2', '1', '1', '10', '25', '', '', '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('26', '73', '1', '2', '1', '1', '4', '26', '', '', '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('27', '95', '1', '2', '1', '1', '4', '27', '', '', '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('28', '226', '1', '2', '1', '1', '4', '28', '', '', '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('29', '4', '1', '2', '1', '1', '12', '29', '', '', '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('30', '26', '1', '2', '1', '1', '12', '30', '', '', '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('31', '245', '1', '3', '1', '1', '9', '31', '', '', '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('32', '246', '1', '3', '1', '1', '9', '32', '', '', '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('33', '120', '1', '3', '1', '1', '6', '33', '', '', '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('34', '122', '1', '3', '1', '1', '6', '34', '', '', '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('35', '159', '1', '3', '1', '1', '5', '35', '', '', '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('36', '163', '1', '3', '1', '1', '5', '36', '', '', '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('37', '181', '1', '3', '1', '1', '3', '37', '', '', '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('38', '216', '1', '3', '1', '1', '3', '38', '', '', '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('39', '196', '1', '3', '1', '1', '10', '39', '', '', '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('40', '199', '1', '3', '1', '1', '10', '40', '', '', '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('41', '73', '1', '3', '1', '1', '4', '41', '', '', '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('42', '95', '1', '3', '1', '1', '4', '42', '', '', '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('43', '226', '1', '3', '1', '1', '4', '43', '', '', '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('44', '4', '1', '3', '1', '1', '12', '44', '', '', '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('45', '26', '1', '3', '1', '1', '12', '45', '', '', '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('46', '245', '1', '4', '1', '1', '9', '46', '', '', '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('47', '246', '1', '4', '1', '1', '9', '47', '', '', '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('48', '120', '1', '4', '1', '1', '6', '48', '', '', '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('49', '122', '1', '4', '1', '1', '6', '49', '', '', '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('50', '159', '1', '4', '1', '1', '5', '50', '', '', '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('51', '163', '1', '4', '1', '1', '5', '51', '', '', '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('52', '181', '1', '4', '1', '1', '3', '52', '', '', '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('53', '216', '1', '4', '1', '1', '3', '53', '', '', '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('54', '196', '1', '4', '1', '1', '10', '54', '', '', '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('55', '199', '1', '4', '1', '1', '10', '55', '', '', '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('56', '73', '1', '4', '1', '1', '4', '56', '', '', '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('57', '95', '1', '4', '1', '1', '4', '57', '', '', '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('58', '226', '1', '4', '1', '1', '4', '58', '', '', '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('59', '4', '1', '4', '1', '1', '12', '59', '', '', '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('60', '26', '1', '4', '1', '1', '12', '60', '', '', '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('61', '122', '1', '5', '1', '1', '6', '61', '', '', '3', '15', 'b2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('62', '246', '1', '5', '1', '1', '9', '62', '', '', '3', '15', 'a2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('63', '120', '1', '5', '1', '1', '6', '63', '', '', '3', '15', 'b1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('64', '245', '1', '5', '1', '1', '9', '64', '', '', '3', '15', 'a1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('65', '159', '1', '5', '1', '1', '5', '65', '', '', '3', '15', 'c1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('66', '163', '1', '5', '1', '1', '5', '66', '', '', '3', '15', 'c2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('67', '181', '1', '5', '1', '1', '3', '67', '', '', '3', '15', 'd1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('68', '216', '1', '5', '1', '1', '3', '68', '', '', '3', '15', 'd2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('69', '196', '1', '5', '1', '1', '10', '69', '', '', '3', '15', 'e1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('70', '199', '1', '5', '1', '1', '10', '70', '', '', '3', '15', 'e2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('71', '73', '1', '5', '1', '1', '4', '71', '', '', '3', '15', 'f1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('72', '95', '1', '5', '1', '1', '4', '72', '', '', '3', '15', 'f2', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('73', '226', '1', '5', '1', '1', '4', '73', '', '', '3', '15', 'g1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('74', '4', '1', '5', '1', '1', '12', '74', '', '', '3', '15', 'h1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('75', '26', '1', '5', '1', '1', '12', '75', '', '', '3', '15', 'i1', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('76', '2', '1', '6', '1', '1', '1', '76', '', '', '3', '15', '-', '1');
INSERT INTO `sgejerciciosrutinacliente` VALUES ('77', '2', '1', '7', '1', '1', '1', '77', '', '', '3', '15', '-', '1');

-- ----------------------------
-- Table structure for `sgformulario`
-- ----------------------------
DROP TABLE IF EXISTS `sgformulario`;
CREATE TABLE `sgformulario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `condicion_cardiaca` int(11) NOT NULL,
  `condicion_pecho` int(11) NOT NULL,
  `condicion_pechoreciente` int(11) NOT NULL,
  `condicion_balance` int(11) NOT NULL,
  `lesion_fisica` int(11) NOT NULL,
  `medicamentos_corazon` int(11) NOT NULL,
  `impedimento_entrenamiento` int(11) NOT NULL,
  `lecturas_anormales` int(11) NOT NULL,
  `cirujia_bypass` int(11) NOT NULL,
  `dificultad_respirar` int(11) NOT NULL,
  `enfermedades_renales` int(11) NOT NULL,
  `arritmia` int(11) NOT NULL,
  `colesterol` int(11) NOT NULL,
  `presion_alta` int(11) NOT NULL,
  `cantidad_cigarros` int(11) NOT NULL,
  `molestias_articulaciones` int(11) NOT NULL,
  `molestias_espalda` int(11) NOT NULL,
  `desayuno_diario` varchar(500) NOT NULL,
  `comida_diaria` varchar(500) NOT NULL,
  `cena_diaria` varchar(500) NOT NULL,
  `entrecomida_diaria` varchar(500) NOT NULL,
  `frecuencia_entrecomida` varchar(500) NOT NULL,
  `plan_alimenticio` varchar(500) NOT NULL,
  `intensidad_ejercicio` int(11) NOT NULL,
  `intensidad_ejercicio2` int(11) NOT NULL,
  `intensidad_ejercicio3` int(11) NOT NULL,
  `intensidad_ejercicio4` int(11) NOT NULL,
  `intensidad_ejercicio5` int(11) NOT NULL,
  `programa_ejercicio` int(11) NOT NULL,
  `actividades_deseables` varchar(500) NOT NULL,
  `actividades_indeseables` varchar(500) NOT NULL,
  `deporte_frecuente` varchar(500) NOT NULL,
  `minutos_dia` varchar(500) NOT NULL,
  `dias_semana` varchar(500) NOT NULL,
  `resultado_ejercicio` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgformulario
-- ----------------------------
INSERT INTO `sgformulario` VALUES ('4', '1', '2', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Desayuno  muy rico', 'comida rica', 'cena rica', 'fruta', '2', 'Si, dieta de la manzana.', '2', '2', '3', '0', '0', '1', 'Todas', 'Ninguna', 'Ninguna', '200', '6', 'Ponerme muy guapo.');
INSERT INTO `sgformulario` VALUES ('5', '1', '11', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', 'desayuno', 'comida', 'cena', 'fruta', '2', 'no', '1', '1', '1', '0', '0', '0', 'Todas', 'Ninguna', 'no', '100', '5', 'estar guapo');
INSERT INTO `sgformulario` VALUES ('6', '1', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'desyunoreg', 'comida', 'cena', 'fruta', '2', 'ásdasdas', '3', '3', '0', '0', '0', '0', 'todas', 'ninguna', 'soccer', '120', '6', 'Estar saludable');
INSERT INTO `sgformulario` VALUES ('7', '9', '14', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'desayuno rico', 'comida rica', 'cena rica', 'fruta', '2 veces', 'no', '3', '3', '0', '0', '0', '0', 'todas', 'ninguna', 'gym', '120', '7', 'estar marcado.');
INSERT INTO `sgformulario` VALUES ('8', '1', '28', '0', '1', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', 'huevos', 'nada', 'quesadilla', 'ninguno', 'nunca', 'no', '0', '0', '4', '0', '0', '0', 'ninguna', 'adfa', 'adfadf', '15', '3', 'nada');
INSERT INTO `sgformulario` VALUES ('9', '1', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Desayuno', 'comida', 'cena', 'fruta', '3', 'No', '5', '4', '0', '0', '0', '0', 'Todas', 'Ninguna', 'ninguno', '120', '6', 'guapo');
INSERT INTO `sgformulario` VALUES ('10', '1', '25', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1', '1', '0', '1', '0', '1', '1', 'desayuno', 'comida', 'cena', 'fruta', '2', 'no', '4', '5', '0', '0', '0', '0', 'todas', 'ninguna', 'ninguno', '120', '6', 'estar sano.');
INSERT INTO `sgformulario` VALUES ('11', '1', '29', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'wgtertg', 'eeegge', 'erfvefr', 'egverg', '3', 'no', '0', '3', '0', '0', '0', '1', 'box, correr, yoga', 'pilates y zumba', 'maraton', '60', '4', 'bajar de peso');
INSERT INTO `sgformulario` VALUES ('12', '1', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '1', '1', 'asdfasf', 'asdfasdf', 'adfasdf', 'asdfasdf', 'adfasdf', 'adsfasdf', '4', '4', '2', '0', '0', '1', 'kjhkjhjk', 'kjkjhkjh', 'kjhkjh', '60', '5', 'bajar de peso');
INSERT INTO `sgformulario` VALUES ('13', '1', '31', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '1', '1', 'dfsfdsf', 'dadad', 'daedade', 'dadsa', 'ewfefeef', 'si', '4', '3', '2', '0', '0', '1', 'zumba, step', 'pesas', 'correr', '50', '4', 'bajar de peso');
INSERT INTO `sgformulario` VALUES ('14', '1', '37', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVOS, Y AVENA', 'PECHUGA DE POLLO, ARROZ BLANCO Y AGAUCATE', 'ASALADA DE ATUN ', 'LICUADOS', 'MUY FRECUENTE', 'SI, DIETAS PARA SUBIR DE PESO', '5', '4', '3', '4', '4', '0', 'PESAS', 'NINGUNA', 'NATACION', '60 MIN', '6', 'SUBIR DE PESO');
INSERT INTO `sgformulario` VALUES ('15', '1', '36', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'huevo', 'carnes', 'cereal', 'ninguna', 'no frecuente', 'no', '0', '4', '0', '0', '0', '0', 'crossfit', 'cardio', 'basketball', '45 min', '6', 'volumen');
INSERT INTO `sgformulario` VALUES ('16', '1', '38', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '1', '1', '0', '1', '2', '1', '1', 'Comida', 'Comida', 'Comida', 'Comida', 'Comida', 'Comida', '3', '2', '0', '0', '0', '1', 'Comida', 'Comida', 'Comida', '60', '6', 'Tomar buen cuerpo.');
INSERT INTO `sgformulario` VALUES ('17', '1', '39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'PROTEINA, AVENA', 'CALDOS, BISTEK', 'ATUN, CEREAL', 'NNINGUNO', 'MUY INFRECUENTE', 'SI, PARA BAJAR DE PESO', '0', '0', '3', '0', '0', '0', '-', '-', '-', '-', '-', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('18', '1', '47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVO, NOPALES, MACHACA', 'BISTEK, TORTILLA', 'CEREAL, AVENA, YOHURT', 'NO', 'NO', 'SI, ADELGAZAR', '0', '2', '0', '0', '0', '0', 'CROSSFFIT', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('19', '1', '49', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CLARAS DE HUEVO, JAMON ', 'PECHUGA DE POLLO', 'YOGURT', 'NO', 'NO', 'SI, PARA ADELGAZAR', '0', '3', '0', '0', '0', '0', 'CROSSFIT', '-', '-', '-', '-', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('20', '1', '50', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVO, MACHACA', 'CALDOS, VERDURA, CARNES', 'TACOS, SUSHI POLLO', 'NO', 'NO', 'SI, PARA BAJAR DE PESO', '0', '3', '0', '0', '0', '0', 'POWER TRAINING', '-', '-', '-', '-', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('21', '1', '54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CLARAS DE HUEVO, SANDWICH, FRUTA', 'CALDOS', 'TACOS', 'FRUTA', '1 VEZ AL DIA', 'NO, NUNCA', '0', '3', '0', '0', '0', '0', 'TODAS', 'NINGUNA', 'NO', '-', '-', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('22', '1', '57', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CAFE, YOGURT, HUEVOS, ', 'CARNE ASADA, ENSALA, ARROZ , COCACOLA LIGHT', 'YOGURT CON GRANOLA', 'CAFE CON PAN', '-', 'SI, POR SALUD', '0', '0', '0', '0', '3', '0', 'SPINNING', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('23', '1', '58', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FRUTA, CEREAL ,, YOGURT', 'POLLO, PESCADO', 'CEREAL, AVENA', '-', '-', 'SI, PARA DELGAZAR', '0', '0', '0', '3', '0', '0', '-', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('24', '1', '59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FRUTA', 'POLLO, JAMON, VERDURA', 'EN LA CALLE', 'ALMENDRA, NUECES, PISTACHES', 'AVECES', 'SI, SUBIR DE PESO', '0', '2', '0', '0', '0', '0', '-', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('25', '1', '44', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVOS REVUELTOS', 'CARNE ROJA, VERDURAS', 'HAMBURGUESA', 'COMIDA CHATARRA', '2-3 VECES POR SEMANA', 'NO, NUNCA', '0', '2', '0', '0', '0', '0', '-', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('26', '1', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SANDWICH DE QUESO, CEREAL, AGUACATE, YOGURT', 'CALDOS DE POLLO,  TACOS', 'LIGERO', '-', 'NUNCA', 'SI, PARA BAJAR DE PESO', '0', '0', '0', '3', '0', '0', 'Box', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('27', '1', '43', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'MALTEADA DE PROTEINA, FRUTA (HERBALIFE) + FRUTA', 'PESCADO, ENSALADA DE LENTEJAS', 'POLLO, VERDURA', 'FRUTA', '-', 'NO', '0', '3', '0', '0', '0', '0', 'PESAS', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('28', '1', '42', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'JUGO, SANDWICH, FRUTA', 'CALDOS DE VERDURA', '-', '-', 'FRECUENTE', 'NO', '0', '0', '2', '0', '0', '0', '-', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('29', '1', '41', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CAFE, PAN', 'CALDOS, VERDURAS', 'NO CENA', 'FRUTAS, PAPAS FRITAS', 'NADA FRECUENTE', 'NO', '0', '0', '3', '0', '0', '0', '-', '-', '-', '-', '-', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('30', '1', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ret 3t', 'regqreg', 'rgw', 'th', 'thrw', 'hth', '0', '0', '0', '0', '1', '0', 'fg', 'ubv', 'jhb', 'jhb', 'jhb', 'jhb');
INSERT INTO `sgformulario` VALUES ('31', '1', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', 'Fruta', 'Verdura', 'FREF', 'RGF', 'RF', 'RF', '0', '3', '0', '0', '0', '0', 'N', 'Todas', 'Ninguna', '150', '5', 'musculatura.');
INSERT INTO `sgformulario` VALUES ('32', '1', '87', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'LICUADO DE PROTEINA', 'SANDWICH DE ATUN O POLLO', 'HUEVOS ENTEROS Y QUESO COTTAGE', 'COMIDAS NORMALES ', 'SIEMPRE', 'SI', '0', '4', '0', '0', '0', '0', 'todo', 'nada', '-', 'TODO EL TIEMPO POSIBLE', '6', 'MASA MUSCULAR Y DEFINICION');
INSERT INTO `sgformulario` VALUES ('33', '1', '88', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FRUTA', 'CARNE', 'CANRE', 'CHUCHERIAS', 'SIEMPRE', 'NO', '0', '0', '1', '0', '0', '0', 'CAMINAR, TROTAR', 'no', 'no', ' 1 hora', '5', 'bajar de peso');
INSERT INTO `sgformulario` VALUES ('34', '1', '89', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FRUTA, AVENA, HUEVO', 'POLLO, CARNES', 'CERELA, AVENA', 'FRUTA, JICAMA, PEPINO', 'TODOS LOS DIAS', 'SI, BAJAR DE PESO', '0', '0', '4', '0', '0', '0', 'CAMINAR, CORREO , CARDIO', 'PESAS', 'NATACION', '1 HORA', '5', 'BAJAR D EPESO  (TONIFICAR)');
INSERT INTO `sgformulario` VALUES ('35', '1', '90', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '2 HUEVOS, VERDURA, YOGURT', 'ENSALADA DE POLLO', 'ENSALADA SIN PROTEINAS', 'PROTEINA EN POLVO Y FRUTOS SECOS, VERDURAS', 'REGULARMENTE', 'SI, BAJAR DE PESO', '0', '2', '0', '0', '0', '0', 'YOGA', 'CROSSFIT', 'no', '1 hora', '6', 'TENER MEJOR CONDICION');
INSERT INTO `sgformulario` VALUES ('36', '1', '91', '1', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1', '0', '0', '1', '0', '0', '0', 'NADA', 'DE TODO', 'DE TODO', 'FRUTA', 'TODOS LOS DIAS', 'NO', '0', '2', '0', '0', '0', '0', 'CORRER', 'NINGUNA', 'NO', '1 HORA Y MEDIA', '5', 'QUEMAR GRASA, DEFINIR');
INSERT INTO `sgformulario` VALUES ('37', '1', '93', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SANDWICH, HUEVOS, CARNES', 'CARNES, DE TODO', 'DE TODO ', 'FRUTA O VERDURA', 'FRECUENTE', 'SI BAJAR DE PESO', '0', '4', '0', '0', '0', '0', 'BOX', 'NINGUNA', 'NO', '1 HORA', '5', 'BAJAR PESO Y TALLA');
INSERT INTO `sgformulario` VALUES ('38', '1', '92', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CEREAL , SANDWICH', 'DE TODO, CARNES, ENSALDAS', 'CEREAL ', 'VERDURAS, ALMENDRAS', 'FRECUENTE', 'SI, BAJAR DE PESO', '0', '2', '0', '0', '0', '0', 'DEPORTES EN GENERAL', 'PESAS', 'MUCHAS', 'I HORA', '5', 'BAJAR TALLAS');
INSERT INTO `sgformulario` VALUES ('39', '1', '94', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ' CLARAS, ESPINACAS, JAMON, PAN TOSTADAS, O TOSTADAS HORNEADAS', 'ENSALADA CON PROTEINA', 'PAN INTEGRAL , QUESO COTTAGE, O FRUTA', 'FRUTA O VERDURA', 'FRECUENTE', 'SI ', '0', '0', '4', '0', '0', '1', 'CORRER Y FUTBOL', 'BEISBOL', 'CORRER', '2 HORAS', '5', 'SALUD');
INSERT INTO `sgformulario` VALUES ('40', '1', '95', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-', '-', '-', '-', '-', '-', '0', '3', '0', '0', '0', '1', '-', '-', '-', '-', '-', '-');
INSERT INTO `sgformulario` VALUES ('41', '1', '97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'FRUTA', 'POLLO , CARNES , VERDURAS', 'MACHACA, CERELA, TAMAES', 'GALLETAS, DULCES', 'POCO FRECUENTE', 'NUNCA', '0', '0', '0', '0', '3', '0', 'BOLEY BALL', 'FUTBOL', 'BOLEY BALL', '2 horas', '3 dias a la semana', 'sentirme mejor, salud');
INSERT INTO `sgformulario` VALUES ('42', '1', '98', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'CLARA DE HUEVOS, NOPALES, MAFE SIN AZUCAR', ' CALDOS, Y CARNES', 'CEREAL, YOGURT, CHIA', 'fruta, yogurt', 'POCO FRECUENTE', 'NO ', '0', '0', '0', '3', '0', '1', 'no', 'no', 'no', '1 hora', '5 dias', 'salud, sentirme bien , condicion ');
INSERT INTO `sgformulario` VALUES ('43', '1', '99', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', 'MACHACA,HUEVO ', 'POLLO CON VERDURAS (GUISOS)', 'CEREAL, SANDWICH ', 'VERDURAS, FRUTAS', 'FRECUENTE', 'JAMAS', '0', '1', '0', '0', '0', '0', 'BASKETBALL ', 'CORRER', 'NINGUNA', '1 HORAº', '5', 'ESTAR MAS SANA');
INSERT INTO `sgformulario` VALUES ('44', '1', '99', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', 'MACHACA,HUEVO ', 'POLLO CON VERDURAS (GUISOS)', 'CEREAL, SANDWICH ', 'VERDURAS, FRUTAS', 'FRECUENTE', 'JAMAS', '0', '1', '0', '0', '0', '0', 'BASKETBALL ', 'CORRER', 'NINGUNA', '1 HORAº', '5', 'ESTAR MAS SANA');
INSERT INTO `sgformulario` VALUES ('45', '1', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVO, SANDWICH', 'ENSALADA CON PROTEINA', 'CEREAL', 'ATUN, SANWICH O FRUTA', 'FRECUENTE', 'NO', '0', '4', '0', '0', '0', '0', 'BOX', 'BEISBOL', 'NINGUNO', '1 HORA', '5 DIAS', 'QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('46', '1', '101', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'MACHACA', 'BISTEK. CARNES', 'SANDWICH, ATUN O CEREAL', 'FRUTA Y VERDURA', 'FRECUENTE (TODOS LOS DIAS)', 'SI', '0', '0', '1', '0', '0', '0', 'BICICLETA', 'CORRER', 'NINGUNO ', '1 HORA', '5', 'SALUD');
INSERT INTO `sgformulario` VALUES ('47', '1', '102', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', 'HUEVOS, SALCHICHA, JAMON, CHORIZO', 'CALDOS, POLLO, CARNES ROJAS', 'SANDWICH, CEREAL', 'FRUTAS, FRUTOS SECOS', 'TODOS LOS DIAS ', 'SI', '0', '3', '0', '0', '0', '0', 'DE TODO ', 'NINGUNO', 'CAMINAR, CORRER', '1 HORA', '5', 'LLEGAR A PESO IDEAL');
INSERT INTO `sgformulario` VALUES ('48', '1', '104', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1', 'CAFE, HUEVO CON MACHACA OMELETE, QUESADILLAS, CLARAS', 'PESCADO, ENSALADAS. POLLO EN C ALDOS', 'AVENA , CEREAL, PAN CON CREMA DE CACAHUATE, TOSTADAS, REQUESON, QUESADILLAS', 'YOGURT, O FRUTA, ALMENDRAS', 'TODOS LOS DIAS', 'NO', '0', '0', '0', '3', '0', '1', 'CAMINAR', 'SPINNING, PROBLEMAS EN RODILLAS', 'NINGUNO', '1 HORA', '5', 'BAJAR DE PESO , QUEMAR GRASA');
INSERT INTO `sgformulario` VALUES ('49', '1', '105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ALMENDRAS, HUEVO, ENSALADA DE ATUN', 'CARNES ORIGEN ANIMAL', 'ENSALADA , QUESADILLAS , YOGUERT CON FRUTA', 'FRUTA Y VERDURAS', 'DE VEZ CUANDO', 'SI, BAJAR DE PESO', '0', '0', '0', '0', '3', '1', 'CAMINAR', 'NINGUNA', 'NO', '1 HORA', '5', 'BAJAR DE PESO');
INSERT INTO `sgformulario` VALUES ('50', '1', '106', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'HUEVO, SALCHICHA Y JUEGO VERDE', 'EJOTES, CHULETA, ENSALDA', 'ATUN , PESCAOD O POLLO , HUEVOS', 'PEPINO , JICAMA, NARANJA, JAMON', 'TODOS LOS DIAS', 'SI', '0', '0', '0', '2', '0', '0', 'TODO', 'CAMINADORA, BICICLETA', 'NO', '1 HORA', '5', 'SALUD Y BELLEZA');
INSERT INTO `sgformulario` VALUES ('51', '1', '107', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'AVENA, FRUTA', 'POLLO Y CARNES ROJAS', 'AVENA Y FRUTA , POLLO', 'PEPINO, JICAMA, NARANJA', 'TODOS LOS DIAS', 'SI', '0', '2', '0', '0', '0', '0', 'BICICLETA', 'CAMINADORA', 'NO', '1 HORA', '5', 'SALUD Y BELLEZA');
INSERT INTO `sgformulario` VALUES ('52', '1', '108', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'HUEVO , LECHE', 'ENSALADA CON PROTEINA', 'CEREALCON LECHE', 'FRUTAS', 'TODOS LOS DIAS , LUNES A VIERNES', 'SI', '0', '3', '0', '0', '0', '0', 'FUTBOL', 'NADAR', 'FUTBOL', '1 HORA', '5', 'BAJAR DE PESO Y CONDICION');
INSERT INTO `sgformulario` VALUES ('53', '1', '109', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'JUGO VERDE', 'ENSALADA CON PROTEINA', 'JUGO VERDE', 'FRUTA O VERDURA ', 'TODOS LOS DIAS', 'SI', '0', '2', '0', '0', '0', '0', 'BAILAR', 'CORRER', 'NO', '1 HORA ', '5', 'OBTENER CONDICION FISICA ');
INSERT INTO `sgformulario` VALUES ('54', '1', '110', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', 'HUEVO, PAN , LICUADO DE AVENA ', 'ENSALADA CON PROTEIN (POLLO)', 'ORIGEN ANIMAL O ARROZ', 'FRUTA Y VERDURA', 'TODOS LOS DIAS', 'SI', '0', '0', '1', '0', '0', '0', 'ARTES MARCIALES Y PESAS', 'TAE BOO', 'NO', '1 HORA ', '5 ', 'BAJAR DE PESO (QUEMAR GRASA), REDUCIR TALLAS');
INSERT INTO `sgformulario` VALUES ('55', '1', '111', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SANDWICH, HUEVO , JAMON ', 'ENSALADA CO PROTEINA', 'ENSALADA O CEREAL', 'FRUTAS Y FRUTOS SECOS', 'TODOS LOS DIAS', 'SI', '0', '2', '0', '0', '0', '0', 'CAMINAR ', 'NADAR', 'SOFTBOL', '1 HORA', '5', 'CONDICION Y MEJOR SALUD');
INSERT INTO `sgformulario` VALUES ('62', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', 'EF', 'RF', 'FREF', 'RGF', 'RF', 'RF', '0', '3', '0', '0', '0', '0', 'N', 'N', 'N', '12\'', '5', 'Musculatura.');

-- ----------------------------
-- Table structure for `sggenerosrutina`
-- ----------------------------
DROP TABLE IF EXISTS `sggenerosrutina`;
CREATE TABLE `sggenerosrutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_tiporutina` varchar(40) NOT NULL,
  `desc_tiporutina` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sggenerosrutina
-- ----------------------------
INSERT INTO `sggenerosrutina` VALUES ('1', 'Hombre', 'Tipos de rutina exclusivamente para hombres');
INSERT INTO `sggenerosrutina` VALUES ('2', 'Mujer', 'Tipos de rutina exclusivamente para mujer');
INSERT INTO `sggenerosrutina` VALUES ('3', 'Mixta', 'Tipos de rutina mixta');

-- ----------------------------
-- Table structure for `sgmaquinas`
-- ----------------------------
DROP TABLE IF EXISTS `sgmaquinas`;
CREATE TABLE `sgmaquinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_maquina` varchar(250) NOT NULL,
  `desc_maquina` varchar(500) NOT NULL,
  `num_maquina` int(11) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  `id_categoriamaquina` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgmaquinas
-- ----------------------------
INSERT INTO `sgmaquinas` VALUES ('1', 'La jungla 2', 'Máquina para diferentes actividades y rutinas  en crossfit ', '15', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('3', 'Mancuernas', 'Ejercicios varios', '0', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('4', 'Jungla mortal', 'Jungla mortal', '15', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('5', 'Pesas', 'Repeticiones De Pesas', '37', '1', '1');
INSERT INTO `sgmaquinas` VALUES ('6', 'Barras', 'Ejercicios varios', '0', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('7', 'Ninguna', 'No Necesita Máquina', '0', '1', '9');
INSERT INTO `sgmaquinas` VALUES ('8', 'No  existe', 'No Existe Máquina para el músculo seleccionado', '0', '1', '0');
INSERT INTO `sgmaquinas` VALUES ('9', 'Predicador', 'Peso libre para biceps', '31', '0', '7');
INSERT INTO `sgmaquinas` VALUES ('10', 'Caminadora', 'Equipo para caminar o correr en una banda', '0', '0', '5');
INSERT INTO `sgmaquinas` VALUES ('11', 'Máquina  de prueba', 'máquina para probar', '5', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('12', 'Máquina para probar', 'alksjdalkdla', '30', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('13', 'bancas', 'ejercicios varios', '0', '1', '1');
INSERT INTO `sgmaquinas` VALUES ('14', 'Patada de gluteo', 'Trabaja el gluteo', '1', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('15', 'Press Sentado', 'Trabaja femoral, cuadrisep, pantorrilla', '2', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('16', 'Leg extenciones', ' trabaja cuadrisep, femoral y gluteo', '3', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('17', 'Chest press', 'Trabaja pectoral alto y bajo', '4', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('18', 'Shoulder press', 'Trabaja Hombro frontal , media y posterior', '5', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('19', 'Maq. Fondos barra o paralelas', 'Trabaja  pecho, espalda y triceps', '6', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('20', 'Fondos en Maq. Simetrica', 'Trabaja pecho y triceps', '7', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('21', 'Flyes', 'Trabaja pecho y branquial de pectoral', '8', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('22', 'Leg extencion', 'Trabaja cuadriceps y femoral', '9', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('23', 'Crunch abdominal', 'Trabaja el abdomen', '10', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('24', 'Leg squats', 'Trabaja femorales', '11', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('25', 'Abductor', 'Trabaja abductores', '12', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('26', 'Adductor', 'Trabaja los adductores', '13', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('27', 'Perfect squat (aparato parado)', 'Trabaja pantorrilla y pierna', '14', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('28', 'Hack', 'Trabaja pierna', '16', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('29', 'Press de pierna (Prensa)', 'Trabaja pierna', '16', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('30', 'Smith', 'Trabaja pierna,pantorrilla, pecho, hombro', '17', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('31', 'Rack sentadillas', 'Trabaja pierna, hombro, biceps y espalda', '18', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('32', 'Maquina sentado', 'Trabaja pantorrilla', '19', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('33', 'Dominadas', 'Trabaja espalada', '20', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('34', 'Extencion de triceps', 'Trabaja triceps, pecho, espalda, biceps', '21', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('35', 'Jalón de polea ', 'Trabaja espalda y biceps', '22', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('36', 'Polea de niveles', 'Trabaja pecho, espalda, trieps, biceps, adductor,abductor, abdomen y hombro', '23', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('37', 'Polea en niveles', 'Trabaja pecho, espalda, trieps, biceps, adductor,abductor, abdomen y hombro', '24', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('38', 'Extención de triceps', 'Trabajo triceps, pecho,espalda, biceps', '25', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('39', 'Jalón de polea', 'Trabaja espalda biceps', '26', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('40', 'Jalón polea', 'Trabaja espalda biceps', '27', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('41', 'Remo con polea', 'Trabajo con polea sentado', '28', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('42', 'Curl femoral', 'Trabajo biceps femoral', '29', '1', '6');
INSERT INTO `sgmaquinas` VALUES ('43', 'Hiperextensiones', 'Espalda Baja', '37', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('44', 'Abdominales espalda baja', 'Trabaja espalda baja', '30', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('45', 'Banco scott', 'Trabaja biceps, antebrazo', '31', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('46', 'Banco de tricep ', 'Trabaja tricep', '32', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('47', 'Banca de hombro', 'Trabaja hombro', '33', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('48', 'Banca inclinada', 'Trabaja pecho parte alta y biceps', '34', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('49', 'Banca horizontal', 'Trabaja pecho parte media y triceps', '35', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('50', 'Banca declinada', 'Trabaja pecho parte baja', '36', '1', '7');
INSERT INTO `sgmaquinas` VALUES ('51', 'Rusas', 'Ejercicios varios', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('52', 'Pelotas Medicinales', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('53', 'Pelotas Slam (Hule negro)', 'Ejercicio Funcional ', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('54', 'Sand Bags', 'Ejercicio Funcional', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('55', 'Aros (Anillos)', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('56', 'Cuerda para Brincar', 'Ejercicios Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('57', 'Reja', 'Ejercicio Funcional', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('58', 'Soga', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('59', 'Banco para salto', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('60', 'Llanta', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('61', 'Cadenas', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('62', 'PVC', 'Ejercicios Funcionales', '0', '1', '4');
INSERT INTO `sgmaquinas` VALUES ('63', 'Caminadoras', 'Ejercicio Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('64', 'Remo', 'Ejercicio Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('65', 'Eliptica', 'Ejercicio Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('66', 'Escaladora', 'Ejercicio Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('67', 'Bicicleta Estacionaria', 'Ejercicio Cardiovascular', '0', '1', '5');
INSERT INTO `sgmaquinas` VALUES ('68', 'No Aplica', 'no aplica', '0', '1', '1');
INSERT INTO `sgmaquinas` VALUES ('69', 'Maquinosa', 'aslkdjadal', '20', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('70', 'maquinosa', 'adsa', '2', '0', '1');
INSERT INTO `sgmaquinas` VALUES ('71', 'Maquinosa mundial', 'alkdsjalkdla', '213', '0', '1');

-- ----------------------------
-- Table structure for `sgmusculos`
-- ----------------------------
DROP TABLE IF EXISTS `sgmusculos`;
CREATE TABLE `sgmusculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_creacion` int(11) NOT NULL,
  `id_tiporutina` int(11) NOT NULL,
  `nb_musculo` varchar(250) NOT NULL,
  `desc_musculo` varchar(500) NOT NULL,
  `sn_activo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgmusculos
-- ----------------------------
INSERT INTO `sgmusculos` VALUES ('1', '1', '3', 'Biceps', 'Biceps', '1');
INSERT INTO `sgmusculos` VALUES ('2', '1', '10', 'Tricep', 'Tricep', '0');
INSERT INTO `sgmusculos` VALUES ('3', '1', '5', 'Deltoides', 'Deltoides', '1');
INSERT INTO `sgmusculos` VALUES ('4', '1', '4', 'Gluteos', 'Gluteos', '1');
INSERT INTO `sgmusculos` VALUES ('5', '1', '4', 'Femoral', 'Parte trasera de la pierna', '1');
INSERT INTO `sgmusculos` VALUES ('6', '1', '4', 'Cuadriceps', 'Parte frontal de la pierna superior', '1');
INSERT INTO `sgmusculos` VALUES ('7', '1', '0', 'Deltoide de la muerte ', 'El deltoide de la muerte ', '0');
INSERT INTO `sgmusculos` VALUES ('8', '1', '0', 'Gluteo de la murte', 'Gluteos mortales', '0');
INSERT INTO `sgmusculos` VALUES ('9', '1', '1', 'Ninguno', 'Ninguno', '1');
INSERT INTO `sgmusculos` VALUES ('10', '1', '6', 'Pecho', 'Pecho', '1');
INSERT INTO `sgmusculos` VALUES ('11', '1', '4', 'Pantorrilla', 'Gemelos', '1');
INSERT INTO `sgmusculos` VALUES ('12', '1', '5', 'Trapecio', 'Trapecio', '1');
INSERT INTO `sgmusculos` VALUES ('13', '1', '2', 'Musculos General', 'Esto aplica para cuando usualmente se elige una clase y  no hay algo en específico que ejercitar o se ejercitan muchas cosas al mismo tiempo.', '1');
INSERT INTO `sgmusculos` VALUES ('14', '1', '9', 'Dorsal', 'musculos laterales', '1');
INSERT INTO `sgmusculos` VALUES ('15', '1', '10', 'Triceps', 'Parte de atrás del brazo', '1');
INSERT INTO `sgmusculos` VALUES ('16', '1', '3', 'Ante brazo', 'Ante brazo', '1');
INSERT INTO `sgmusculos` VALUES ('17', '1', '4', 'Gluteo', 'Gluteo', '1');
INSERT INTO `sgmusculos` VALUES ('18', '1', '4', 'abductores', 'abductores', '1');
INSERT INTO `sgmusculos` VALUES ('19', '1', '4', 'aductores', 'aductores', '1');
INSERT INTO `sgmusculos` VALUES ('20', '1', '5', 'Hombro', 'En general', '1');
INSERT INTO `sgmusculos` VALUES ('21', '1', '9', 'Espalda baja', 'Parte baja de la espalda', '1');
INSERT INTO `sgmusculos` VALUES ('22', '1', '9', 'Espalda Superior', 'Parte superior de la espalda', '1');
INSERT INTO `sgmusculos` VALUES ('23', '1', '11', 'Musculos en General', 'Se ejercitan los musculos en general de todo el cuerpo.', '1');
INSERT INTO `sgmusculos` VALUES ('24', '1', '12', 'Abdomen', 'Musculos del abdomen en general', '1');
INSERT INTO `sgmusculos` VALUES ('25', '1', '3', 'Para cancelar', 'Para cancelar.', '0');
INSERT INTO `sgmusculos` VALUES ('26', '1', '11', 'Cuerpo', 'Cardio', '1');
INSERT INTO `sgmusculos` VALUES ('27', '1', '2', 'Clase', 'Clase a escoger', '1');
INSERT INTO `sgmusculos` VALUES ('32', '1', '4', 'cosa', 'cosa', '1');
INSERT INTO `sgmusculos` VALUES ('33', '1', '3', 'Chocobanan', 'Increíble', '0');
INSERT INTO `sgmusculos` VALUES ('34', '1', '3', 'Chocobanana', 'salkjdakldjla', '0');
INSERT INTO `sgmusculos` VALUES ('35', '1', '4', 'Chocofresa', 'cocha pacha', '0');

-- ----------------------------
-- Table structure for `sgrutinas`
-- ----------------------------
DROP TABLE IF EXISTS `sgrutinas`;
CREATE TABLE `sgrutinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuariocreacion` int(11) NOT NULL,
  `id_categoriarutina` int(11) DEFAULT NULL,
  `id_generorutina` int(11) DEFAULT NULL,
  `id_tipocuerpo` int(11) DEFAULT NULL,
  `nb_rutina` varchar(250) CHARACTER SET latin1 NOT NULL,
  `desc_rutina` varchar(500) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  `fh_creacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgrutinas
-- ----------------------------
INSERT INTO `sgrutinas` VALUES ('1', '1', '1', null, null, 'Acondicionamiento', 'Rutina de acondicinamiento principiantes, adapta a las personas a condiciones físicas pesadas.', '0', '');
INSERT INTO `sgrutinas` VALUES ('2', '1', '2', '1', null, 'Acondicionamiento', 'Rutina de acondicinamiento principiantes, adapta a las personas a condiciones físicas pesadas.', '0', '');
INSERT INTO `sgrutinas` VALUES ('3', '2', '1', '2', '1', 'Acondicionamiento chingón', 'Rutina de acondicinamiento principiantes, adapta a las personas a condiciones físicas pesadas.', '1', '');
INSERT INTO `sgrutinas` VALUES ('4', '2', '3', '3', '2', 'Acondicionamiento', 'Rutina de acondicinamiento principiantes, adapta a las personas a condiciones físicas pesadas.', '1', '');
INSERT INTO `sgrutinas` VALUES ('5', '1', '1', null, null, 'Otr aprueba', 'laksdjklajl', '0', '2015-01-17');
INSERT INTO `sgrutinas` VALUES ('50', '1', '1', null, null, 'TronchaToros', 'asdada', '0', '2014-09-16');
INSERT INTO `sgrutinas` VALUES ('51', '1', '1', null, null, 'Choncha', 'asad', '0', '2014-09-16');
INSERT INTO `sgrutinas` VALUES ('52', '1', '3', null, null, 'El destructor', 'rutina muy pesada', '0', '2014-09-17');
INSERT INTO `sgrutinas` VALUES ('54', '1', '1', null, null, 'Prueba', 'aasdad', '0', '2014-09-19');
INSERT INTO `sgrutinas` VALUES ('55', '1', '1', null, null, 'Mejora fisica', 'rutina de mejora fisica', '0', '2014-09-19');
INSERT INTO `sgrutinas` VALUES ('56', '1', '2', null, null, 'TronchaToros', 'Troncha toros intermedia', '0', '2014-09-19');
INSERT INTO `sgrutinas` VALUES ('57', '9', '1', null, null, 'Abominable', 'Rutina Abominable', '1', '2014-10-19');
INSERT INTO `sgrutinas` VALUES ('60', '1', '2', null, null, 'Rutina nueva', 'akdjkldjlajdkadjkal', '0', '2014-11-17');
INSERT INTO `sgrutinas` VALUES ('61', '1', '3', null, null, 'prueba2', 'adfasd', '0', '2015-01-15');
INSERT INTO `sgrutinas` VALUES ('62', '1', '1', null, null, 'Chuvacosa', 'Chuvacosa', '0', '2015-01-17');
INSERT INTO `sgrutinas` VALUES ('64', '1', '3', null, null, 'prueba1', 'adfas', '0', '2015-01-20');
INSERT INTO `sgrutinas` VALUES ('65', '1', '1', null, null, 'htd11', 'Hombre teen delgado Nivel 1', '0', '2015-01-20');
INSERT INTO `sgrutinas` VALUES ('66', '1', '1', null, null, 'HTN11', 'Hombre, Teen, Normal, Nivel 1', '0', '2015-01-20');
INSERT INTO `sgrutinas` VALUES ('67', '1', '1', null, null, 'Rutina eliminadora', 'aspdkaspda', '0', '2015-01-21');
INSERT INTO `sgrutinas` VALUES ('68', '1', '1', null, null, 'Pruebosa', 'askdadaj', '0', '2015-01-27');
INSERT INTO `sgrutinas` VALUES ('69', '1', '1', null, null, 'pruebosienta', 'akdsalkda', '0', '2015-01-27');
INSERT INTO `sgrutinas` VALUES ('70', '1', '1', null, null, 'cochapacha', 'alkdsjlda', '0', '2015-02-09');
INSERT INTO `sgrutinas` VALUES ('71', '1', '1', null, null, 'HMJECN1V1', 'HOMBRE O MUJER JOVEN ECDOMORFO NIVEL 1 VERSION 1', '0', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('72', '1', '1', null, null, 'HMJECN1V2', 'HOMBRE O MUJER JOVEN ECTOMORFO NIVEL 1 VERSIÓN 2', '0', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('73', '1', '1', '3', '1', 'HMJECN1V2', 'HOMBRE O MUJER JOVEN ECTOMORFO NIVEL 1 VERSION 2', '1', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('74', '1', '1', null, null, 'HMJECN1V3', 'HOMBRE O MUJER JOVEN ECTOMORFO NIVEL 1 VERSION 3', '0', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('75', '1', '1', '3', null, 'HMJECN1V3', 'HOMBRE O MUJER JOVEN ECTOMORFO NIVEL 1 VERSION 3', '1', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('76', '1', '1', '3', '2', 'HMTAMEN1V1', 'HOMBRE O MUJER TEEN Y ADULTO MESOMORFO NIVEL 1 VERSION 1', '1', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('77', '1', '1', '3', '3', 'HMJENN1V1', 'HOMBRE O MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('78', '1', '1', null, null, 'HJENN1V1', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VOLUMEN 1', '0', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('79', '1', '1', null, null, 'HJENN1V1', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 1', '0', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('80', '1', '1', '1', '3', 'HJENN1V1', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-02-10');
INSERT INTO `sgrutinas` VALUES ('81', '1', '1', '1', null, 'HJENN1V2', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 2', '1', '2015-02-11');
INSERT INTO `sgrutinas` VALUES ('82', '1', '1', null, null, 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-11');
INSERT INTO `sgrutinas` VALUES ('83', '1', '1', null, null, 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-11');
INSERT INTO `sgrutinas` VALUES ('84', '1', '1', null, null, 'PRUEBA', 'DESCRIPCION TRISERIE', '0', '2015-02-11');
INSERT INTO `sgrutinas` VALUES ('85', '1', '1', null, null, 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-11');
INSERT INTO `sgrutinas` VALUES ('86', '1', '1', null, null, 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('87', '1', '1', null, null, 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('88', '1', '1', '1', '3', 'HJENN1V3', 'HOMBRE JOVEN ENDOMORFO NIVEL 1 VERSION 3', '1', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('89', '1', '1', null, null, 'MJENN1V4', 'MUJER JOVEN ENDOMORFO', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('90', '1', '1', '2', null, 'MJENN1V4', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('91', '1', '1', null, null, 'MJENN1V5', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 5', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('92', '1', '1', null, null, 'MJENN1V5', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 5', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('93', '1', '1', '2', null, 'MJENN1V5', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 2', '1', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('94', '1', '1', null, null, 'MJENN1V6', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 6', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('95', '1', '1', null, null, 'MJENN1V6', 'MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 3', '0', '2015-02-12');
INSERT INTO `sgrutinas` VALUES ('96', '1', '1', null, null, 'HJTMEN1V1', 'HOMBRE JOVEN TEEN MESOMORFO NIVEL 1 VERSION 1', '0', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('97', '1', '1', null, null, 'HJMEN1V1', 'HOMBRE JOVEN MESOMORFO NIVEL 1 VERSION 1', '0', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('98', '1', '1', '3', null, 'HMJAECN1V1', 'HOMBRE MUJER JOVEN ADULTO ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('99', '1', '1', '1', null, 'HJTAENNIV1', 'HOMBRE JOVEN TEEN ADULTO ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('100', '1', '1', null, null, 'HMTJENECN1V1', 'HOMBRE MUJER TEEN JOVEN ENDOMORFO ECTOMORFO NIVEL 1 VERSION 1', '0', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('101', '1', '1', null, null, 'HMTJENECN1V1', 'HOMBRE MUJER TEEN JOVEN ENDOMORFO ECTOMORFO NIVEL 1 VERSION 1', '0', '2015-02-13');
INSERT INTO `sgrutinas` VALUES ('102', '1', '1', null, null, 'liuhoo', 'uyg6tu', '0', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('103', '1', '1', '3', null, 'HMTJENECN1V1', 'HOMBRE MUJER TEEN JOVEN ENDOMORFO ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('104', '1', '1', null, null, 'EFSG', 'RGEGEQRG', '0', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('105', '1', '1', '3', null, 'HMJECN1V1', 'HOMBRE MUJER JOVEN ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('106', '1', '1', null, null, 'fhefew', 'doejdd', '0', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('107', '1', '1', null, null, 'sfdrwf', 'doejdd', '0', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('108', '1', '1', '3', null, 'HMJENN1V3', 'HOMBRE MUJER JOVEN ENDOMORFO NIVEL 1 VERSION 3', '1', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('109', '1', '1', '3', null, 'HMTJAMEENN1V1', 'HOMBRE MUJER TEEN JOVEN ADULTO MESOMORFO ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-02-16');
INSERT INTO `sgrutinas` VALUES ('110', '1', '1', '1', null, 'HTAECN1V1', 'HOMBRE TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-17');
INSERT INTO `sgrutinas` VALUES ('111', '1', '1', '1', null, 'HTAECN1V2', 'HOMBRE TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 2', '1', '2015-02-17');
INSERT INTO `sgrutinas` VALUES ('112', '1', '1', '1', null, 'HTAECN1V3', 'HOMBRE TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-17');
INSERT INTO `sgrutinas` VALUES ('113', '1', '1', '1', null, 'HTAECN1V4', 'HOMBRE TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 4', '1', '2015-02-17');
INSERT INTO `sgrutinas` VALUES ('114', '1', '1', '2', null, 'HTAECN1V5', 'MUJER TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-02-17');
INSERT INTO `sgrutinas` VALUES ('115', '1', '1', '2', null, 'MTAECN1V2', 'MUJER TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 2', '1', '2015-02-18');
INSERT INTO `sgrutinas` VALUES ('116', '1', '1', null, null, 'MTAECN1V3', 'MUJER TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 3', '0', '2015-02-18');
INSERT INTO `sgrutinas` VALUES ('117', '1', '1', '2', null, 'MTAECN1V3', 'MUJER TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 3', '1', '2015-02-18');
INSERT INTO `sgrutinas` VALUES ('118', '1', '1', '2', null, 'MTAECN1V4', 'MUJER TEEN ADULTO ECTOMORFO NIVEL 1 VERSION 4', '1', '2015-02-18');
INSERT INTO `sgrutinas` VALUES ('119', '1', '1', '3', null, 'HMTJECN1V1', 'HOMBRE O MUJER TEEN JOVEN  ECTOMORFO NIVEL 1 VERSION 1', '1', '2015-03-02');
INSERT INTO `sgrutinas` VALUES ('120', '1', '1', '3', null, 'HMTJMN1V1', 'HOMBRE O MUJER TEEN JOVEN MESOMORFO NIVEL 1 VERSION 1', '1', '2015-03-02');
INSERT INTO `sgrutinas` VALUES ('121', '1', '1', null, null, 'HMTJMEN1V2', 'HOMBRE O MUJER TEEN JOVEN MESOMORFO NIVEL 1 VERSION 2', '0', '2015-03-02');
INSERT INTO `sgrutinas` VALUES ('122', '1', '1', '3', null, 'HMTJMEN1V2', 'HOMBRE O MUJER TEEN JOVEN MESOMORFO NIVEL 1 VERSION 2', '1', '2015-03-02');
INSERT INTO `sgrutinas` VALUES ('123', '1', '1', null, null, 'HMTJMEN1V1', 'HOMBRE O MUJER TEEN JOVEN MESOMORFO NIVEL 1 VERSION 1', '0', '2015-03-03');
INSERT INTO `sgrutinas` VALUES ('124', '1', '1', '3', null, 'HMJAECN1V2', 'HOMBRE O MUJER JOVEN ADULTO ECTOMORFO NIVEL 1 VERSION 2', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('125', '1', '1', '3', null, 'HMJAECN1V3', 'HOMBRE O MUJER JOVEN ADULTO ECTOMORFO NIVEL 1 VERSION 3', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('126', '1', '1', '3', null, 'HMJMEN1V1', 'HOMBRE O MUJER JOVEN MESOMORFO NIVEL 1 VERSION 1', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('127', '1', '1', '3', null, 'HMTJENN1V1', 'HOMBRE O MUJER TEEN JOVEN ENDOMORFO NIVEL 1 VERSION 1', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('128', '1', '1', '3', null, 'HMTJENN1V2', 'HOMBRO O MUJER TEEN JOVEN ENDOMORFO NIVEL 1 VERSION 2', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('129', '1', '1', '3', null, 'HMTJENN1V3', 'HOMBRE O MUJER TEEN JOVEN ENDOMORFO NIVEL 1 VERSION 3', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('130', '1', '1', '3', null, 'HMTJAMEN1V1', 'HOMBRE O MUJER TEEN JOVEN ADULTO MESOMORFO NIVEL 1 VERSION 1', '1', '2015-03-04');
INSERT INTO `sgrutinas` VALUES ('156', '1', '3', '2', '1', 'Rutina Pruebosa', 'lkajdslajdas', '1', '2015-07-19');
INSERT INTO `sgrutinas` VALUES ('158', '1', '2', '3', '2', 'Rutina De prueba', 'adsdjakdalk', '1', '2015-07-19');

-- ----------------------------
-- Table structure for `sgrutinasclientes`
-- ----------------------------
DROP TABLE IF EXISTS `sgrutinasclientes`;
CREATE TABLE `sgrutinasclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuariocreacion` int(11) NOT NULL,
  `id_categoriarutina` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipocuerpo` int(11) DEFAULT NULL,
  `nb_rutina` varchar(250) NOT NULL,
  `desc_rutina` varchar(500) NOT NULL,
  `fh_creacion` varchar(150) NOT NULL,
  `sn_activo` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgrutinasclientes
-- ----------------------------
INSERT INTO `sgrutinasclientes` VALUES ('1', '1', '1', '2', '1', 'HMJECN1V2', 'HOMBRE O MUJER JOVEN ECTOMORFO NIVEL 1 VERSION 2', '2015-07-26', '1');

-- ----------------------------
-- Table structure for `sgtipocuerpo`
-- ----------------------------
DROP TABLE IF EXISTS `sgtipocuerpo`;
CREATE TABLE `sgtipocuerpo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_cuerpo` varchar(150) DEFAULT NULL,
  `desc_tipocuerpo` varchar(150) DEFAULT NULL,
  `url_img` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgtipocuerpo
-- ----------------------------
INSERT INTO `sgtipocuerpo` VALUES ('1', 'ECTOMORFO', 'ECTOMORFO', 'css/ectomorfo.jpg');
INSERT INTO `sgtipocuerpo` VALUES ('2', 'MESOMORFO', 'MESOMORFO', 'css/mesomorfo.jpg');
INSERT INTO `sgtipocuerpo` VALUES ('3', 'ENDOMORFO', 'ENDOMORFO', 'css/endomorfo.jpg');

-- ----------------------------
-- Table structure for `sgtipospruebas`
-- ----------------------------
DROP TABLE IF EXISTS `sgtipospruebas`;
CREATE TABLE `sgtipospruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_prueba` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgtipospruebas
-- ----------------------------
INSERT INTO `sgtipospruebas` VALUES ('1', 'Condición Física');
INSERT INTO `sgtipospruebas` VALUES ('2', 'Peso');
INSERT INTO `sgtipospruebas` VALUES ('3', 'Imc');
INSERT INTO `sgtipospruebas` VALUES ('4', 'Imm');
INSERT INTO `sgtipospruebas` VALUES ('5', 'Stamina');
INSERT INTO `sgtipospruebas` VALUES ('6', 'Fuerza');
INSERT INTO `sgtipospruebas` VALUES ('7', 'Resistencia');
INSERT INTO `sgtipospruebas` VALUES ('8', 'Flexibilidad');

-- ----------------------------
-- Table structure for `sgtiposrutina`
-- ----------------------------
DROP TABLE IF EXISTS `sgtiposrutina`;
CREATE TABLE `sgtiposrutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuarioregistro` int(11) NOT NULL,
  `nb_tiporutina` varchar(250) NOT NULL,
  `desc_tiporutina` varchar(500) NOT NULL,
  `sn_activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgtiposrutina
-- ----------------------------
INSERT INTO `sgtiposrutina` VALUES ('1', '1', 'Descanso', 'Día de descanso', '1');
INSERT INTO `sgtiposrutina` VALUES ('2', '1', 'Clase', 'clase de algún tipo de actividad, tal como spinning, tae bo, yoga, etc.', '1');
INSERT INTO `sgtiposrutina` VALUES ('3', '1', 'Biceps', 'Rutinas de brazo parte frontal y antebrazo', '1');
INSERT INTO `sgtiposrutina` VALUES ('4', '1', 'Pierna', 'Rutinas de cuadriceps, femoral, gluteo y pantorilla', '1');
INSERT INTO `sgtiposrutina` VALUES ('5', '1', 'Hombro', 'Rutinas de Hombro, deltoides y trapecio', '1');
INSERT INTO `sgtiposrutina` VALUES ('6', '1', 'Pecho', 'Rutinas de pecho', '1');
INSERT INTO `sgtiposrutina` VALUES ('7', '1', 'gluteo ', 'Tipos de rutina para los gluteos.', '0');
INSERT INTO `sgtiposrutina` VALUES ('8', '1', 'Varios', 'Varios Tipos de rutina en un día', '1');
INSERT INTO `sgtiposrutina` VALUES ('9', '19', 'Espalda', 'Espalda baja y superior', '1');
INSERT INTO `sgtiposrutina` VALUES ('10', '1', 'Triceps', 'Rutina de Brazo parte trasera', '1');
INSERT INTO `sgtiposrutina` VALUES ('11', '1', 'Cardio', 'Ejercicios de genero cardiovascular en diversos equipos como caminadora, bicicleta, escaladora, crosstrainer, etc', '1');
INSERT INTO `sgtiposrutina` VALUES ('12', '1', 'Abdomen', 'Abdomen', '1');
INSERT INTO `sgtiposrutina` VALUES ('13', '1', 'Abdomen', 'Ejercicios abdominales', '0');
INSERT INTO `sgtiposrutina` VALUES ('17', '0', 'super Chocofresa de la muerte', 'Chocobanana', '0');
INSERT INTO `sgtiposrutina` VALUES ('18', '0', 'Chicunguaya', 'laksjdklajslda', '0');
INSERT INTO `sgtiposrutina` VALUES ('19', '0', 'COchapacha', 'alsdjkak', '0');

-- ----------------------------
-- Table structure for `sgusuarios`
-- ----------------------------
DROP TABLE IF EXISTS `sgusuarios`;
CREATE TABLE `sgusuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_usuario` varchar(250) NOT NULL,
  `pw_password` varchar(50) NOT NULL,
  `nb_nombre` varchar(50) NOT NULL,
  `nb_apellidos` varchar(250) NOT NULL,
  `de_genero` varchar(30) NOT NULL,
  `num_edad` int(4) DEFAULT NULL,
  `de_email` varchar(250) NOT NULL,
  `num_telefono` varchar(15) DEFAULT NULL,
  `num_celular` varchar(15) NOT NULL,
  `id_estado` int(4) NOT NULL,
  `id_municipio` int(4) NOT NULL,
  `id_ciudad` int(4) NOT NULL,
  `de_colonia` varchar(250) NOT NULL,
  `de_domicilio` varchar(250) NOT NULL,
  `num_codigoPostal` varchar(5) DEFAULT NULL,
  `Permisos` int(11) NOT NULL,
  `sn_activo` int(11) NOT NULL,
  `num_codigo_postal` int(11) unsigned DEFAULT NULL,
  `_permisos` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sgusuarios
-- ----------------------------
INSERT INTO `sgusuarios` VALUES ('1', 'Chuvaca', 'chuvaca', 'Spin', 'Gym', 'MASCULINO', '26', 'ashernetz@hotmail.com', '(667) 214-7897', '(667) 214-7897', '1', '1', '1', '1', ' 1', '1', '1', '1', null, null);
INSERT INTO `sgusuarios` VALUES ('2', 'Pedro', 'pedro', 'Pedro', 'Flores Cabanillas', 'Masculino', '28', 'pedro@icariasoft.com', '67564564', '65456465', '1', '1', '1', '1', '1', '1', '1', '1', null, null);
INSERT INTO `sgusuarios` VALUES ('9', 'jesus_ibanez', 'Michi Machapita', 'jesus', 'perez', 'MASCULINO', '26', 'ashernetz@hotmail.com', '(667) 214-7830', '(667) 214-7897', '0', '0', '0', 'Montebello', 'cañadas cañadas', '80227', '0', '1', null, null);
INSERT INTO `sgusuarios` VALUES ('14', 'Michi', 'machapita', 'michelle', 'soots medina', 'FEMENINO', '23', 'ashernetz@hotmail.com', '(123) 123-1312', '(123) 123-1231', '0', '0', '0', 'Montebello', 'cañadas\ncañadas', '80227', '0', '0', null, null);
INSERT INTO `sgusuarios` VALUES ('15', 'rocket_raccoon', 'rocket', 'Rocket', 'Raccoon', 'MASCULINO', '25', 'ashernetz@hotmail.com', '(123) 213-2131', '(123) 213-2131', '0', '0', '0', 'montebello', 'cañadas\ncañadas', '80227', '0', '0', '80227', '0');
INSERT INTO `sgusuarios` VALUES ('16', 'Alonso_daniel', 'spingym', 'Alonso fernando', 'Breton', 'MASCULINO', '30', 'ashernetz@hotmail.com', '(123) 123-1231', '(213) 123-1231', '0', '0', '0', 'Colinas del rey', ' cañadas\ncañadas', '80227', '1', '1', '80227', '1');
INSERT INTO `sgusuarios` VALUES ('17', 'alonsobreton', 'Spin0412', 'alonso daniel', 'breton muñoz', 'MASCULINO', '39', 'alonsobreton@hotmail.com', '(667) 712-6373', '(667) 196-0731', '0', '0', '0', 'guadalupe', 'ciudades hermanas 246 pte', '80220', '1', '1', '80220', '1');
INSERT INTO `sgusuarios` VALUES ('18', 'entrenador1', 'entrenador1', 'entrenador1', 'entrenador1', 'MASCULINO', '39', 'alonsobreton@me.com', '', '(667) 196-0731', '0', '0', '0', '', 'lhllkhklahdfd', '80060', '0', '1', null, null);
INSERT INTO `sgusuarios` VALUES ('19', 'spingym', 'spingym', 'Spin Gym', 'Spin Gym', 'MASCULINO', '18', 'spingym@hotmail.com', '(667) 712-6373', '(667) 712-6373', '0', '0', '0', 'guadalupe', ' ciudades hermanas 246 pte', '80220', '1', '1', null, null);
INSERT INTO `sgusuarios` VALUES ('27', 'jesus perez', 'adadasda', 'jesus', 'perez', 'MASCULINO', '0', 'ashernetz@hotmail.com', '01 667 214 7897', '01 667 214 7897', '0', '0', '0', 'asdada', 'cañadas\ncañadas', null, '0', '1', '80227', '0');

-- ----------------------------
-- Table structure for `sg_actividades`
-- ----------------------------
DROP TABLE IF EXISTS `sg_actividades`;
CREATE TABLE `sg_actividades` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) NOT NULL,
  `nb_actividad` varchar(250) NOT NULL,
  `fc_registroActividad` date NOT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `id_instructor` (`id_instructor`),
  CONSTRAINT `sg_actividades_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `sgusuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sg_actividades
-- ----------------------------

-- ----------------------------
-- Table structure for `sg_biotestbitacora`
-- ----------------------------
DROP TABLE IF EXISTS `sg_biotestbitacora`;
CREATE TABLE `sg_biotestbitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_UsuarioCreacion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_Biotest` int(11) NOT NULL,
  `fh_creacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sg_biotestbitacora
-- ----------------------------
INSERT INTO `sg_biotestbitacora` VALUES ('3', '9', '14', '0', '2014-08-19');
INSERT INTO `sg_biotestbitacora` VALUES ('4', '9', '14', '0', '2014-10-19');
INSERT INTO `sg_biotestbitacora` VALUES ('5', '9', '2', '0', '2014-10-19');
INSERT INTO `sg_biotestbitacora` VALUES ('6', '1', '2', '0', '2014-10-19');
INSERT INTO `sg_biotestbitacora` VALUES ('7', '1', '28', '0', '2014-11-06');
INSERT INTO `sg_biotestbitacora` VALUES ('8', '1', '28', '0', '2014-11-06');
INSERT INTO `sg_biotestbitacora` VALUES ('9', '1', '28', '0', '2014-11-06');
INSERT INTO `sg_biotestbitacora` VALUES ('10', '1', '2', '0', '2014-11-22');
INSERT INTO `sg_biotestbitacora` VALUES ('11', '1', '25', '0', '2014-11-29');
INSERT INTO `sg_biotestbitacora` VALUES ('12', '1', '28', '0', '2014-11-29');
INSERT INTO `sg_biotestbitacora` VALUES ('13', '1', '28', '0', '2014-11-29');
INSERT INTO `sg_biotestbitacora` VALUES ('14', '1', '29', '0', '2014-12-02');
INSERT INTO `sg_biotestbitacora` VALUES ('15', '1', '29', '0', '2014-12-02');
INSERT INTO `sg_biotestbitacora` VALUES ('16', '1', '2', '0', '2014-12-26');
INSERT INTO `sg_biotestbitacora` VALUES ('17', '1', '30', '0', '2015-01-15');
INSERT INTO `sg_biotestbitacora` VALUES ('18', '1', '30', '0', '2015-01-15');
INSERT INTO `sg_biotestbitacora` VALUES ('19', '19', '30', '0', '2015-01-15');
INSERT INTO `sg_biotestbitacora` VALUES ('20', '1', '31', '0', '2015-01-16');
INSERT INTO `sg_biotestbitacora` VALUES ('21', '1', '31', '0', '2015-01-19');
INSERT INTO `sg_biotestbitacora` VALUES ('22', '1', '31', '0', '2015-01-19');
INSERT INTO `sg_biotestbitacora` VALUES ('23', '1', '31', '0', '2015-01-19');
INSERT INTO `sg_biotestbitacora` VALUES ('24', '1', '31', '0', '2015-01-19');
INSERT INTO `sg_biotestbitacora` VALUES ('25', '1', '31', '0', '2015-01-21');
INSERT INTO `sg_biotestbitacora` VALUES ('26', '1', '31', '0', '2015-01-23');
INSERT INTO `sg_biotestbitacora` VALUES ('27', '1', '2', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('28', '1', '2', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('29', '1', '17', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('30', '1', '17', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('31', '1', '17', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('32', '1', '17', '0', '2015-02-15');
INSERT INTO `sg_biotestbitacora` VALUES ('33', '1', '37', '0', '2015-03-05');
INSERT INTO `sg_biotestbitacora` VALUES ('34', '1', '37', '0', '2015-03-05');
INSERT INTO `sg_biotestbitacora` VALUES ('35', '1', '31', '0', '2015-03-06');
INSERT INTO `sg_biotestbitacora` VALUES ('36', '1', '2', '0', '2015-03-15');
INSERT INTO `sg_biotestbitacora` VALUES ('37', '1', '31', '0', '2015-03-19');
INSERT INTO `sg_biotestbitacora` VALUES ('38', '1', '37', '0', '2015-03-24');
INSERT INTO `sg_biotestbitacora` VALUES ('39', '1', '31', '0', '2015-03-24');
INSERT INTO `sg_biotestbitacora` VALUES ('40', '1', '36', '0', '2015-03-24');
INSERT INTO `sg_biotestbitacora` VALUES ('41', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('42', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('43', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('44', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('45', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('46', '1', '36', '0', '2015-03-25');
INSERT INTO `sg_biotestbitacora` VALUES ('47', '1', '36', '0', '2015-03-26');
INSERT INTO `sg_biotestbitacora` VALUES ('48', '1', '39', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('49', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('50', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('51', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('52', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('53', '1', '49', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('54', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('55', '1', '50', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('56', '1', '54', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('57', '1', '57', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('58', '1', '54', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('59', '1', '57', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('60', '1', '58', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('61', '1', '47', '0', '2015-04-02');
INSERT INTO `sg_biotestbitacora` VALUES ('62', '1', '57', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('63', '1', '54', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('64', '1', '50', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('65', '1', '49', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('66', '1', '49', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('67', '1', '49', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('68', '1', '47', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('69', '1', '58', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('70', '1', '59', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('71', '1', '59', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('72', '1', '44', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('73', '1', '40', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('74', '1', '43', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('75', '1', '42', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('76', '1', '41', '0', '2015-04-03');
INSERT INTO `sg_biotestbitacora` VALUES ('77', '1', '2', '0', '2015-04-19');
INSERT INTO `sg_biotestbitacora` VALUES ('78', '1', '2', '0', '2015-04-27');
INSERT INTO `sg_biotestbitacora` VALUES ('79', '1', '13', '0', '2015-05-08');
INSERT INTO `sg_biotestbitacora` VALUES ('80', '1', '87', '0', '2015-05-15');
INSERT INTO `sg_biotestbitacora` VALUES ('81', '1', '88', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('82', '1', '89', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('83', '1', '90', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('84', '1', '91', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('85', '1', '92', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('86', '1', '93', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('87', '1', '94', '0', '2015-05-18');
INSERT INTO `sg_biotestbitacora` VALUES ('88', '1', '97', '0', '2015-05-19');
INSERT INTO `sg_biotestbitacora` VALUES ('89', '1', '98', '0', '2015-05-19');
INSERT INTO `sg_biotestbitacora` VALUES ('90', '1', '87', '0', '2015-05-19');
INSERT INTO `sg_biotestbitacora` VALUES ('91', '1', '37', '0', '2015-05-19');
INSERT INTO `sg_biotestbitacora` VALUES ('92', '1', '37', '0', '2015-05-19');
INSERT INTO `sg_biotestbitacora` VALUES ('93', '1', '104', '0', '2015-05-20');
INSERT INTO `sg_biotestbitacora` VALUES ('94', '1', '108', '0', '2015-05-20');
INSERT INTO `sg_biotestbitacora` VALUES ('95', '1', '49', '0', '2015-05-20');
INSERT INTO `sg_biotestbitacora` VALUES ('96', '1', '110', '0', '2015-05-20');

-- ----------------------------
-- Table structure for `sg_pruebas`
-- ----------------------------
DROP TABLE IF EXISTS `sg_pruebas`;
CREATE TABLE `sg_pruebas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `Tipo_Prueba` int(11) NOT NULL,
  `Desc_Prueba` varchar(255) NOT NULL,
  `resultado_numerico` double(11,0) NOT NULL,
  `Resultado` varchar(255) NOT NULL,
  `Porcentaje` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sg_pruebas
-- ----------------------------
INSERT INTO `sg_pruebas` VALUES ('544', '1', '17', '1', 'condición Física', '76', 'Promedio', '40', '2014-10-15 12:16:14');
INSERT INTO `sg_pruebas` VALUES ('545', '1', '17', '2', 'Peso', '65', 'Peso Ideal', '100', '2014-10-15 12:17:11');
INSERT INTO `sg_pruebas` VALUES ('546', '1', '17', '3', 'IMC', '25', 'Sobre Peso', '60', '2014-10-15 12:17:34');
INSERT INTO `sg_pruebas` VALUES ('587', '1', '17', '4', 'IMM - Cintura', '82', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('588', '1', '17', '4', 'IMM - Cadera', '93', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('589', '1', '17', '4', 'IMM - Perimetro_Espalda', '101', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('590', '1', '17', '4', 'IMM - Perimetro_Pecho', '97', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('591', '1', '17', '4', 'IMM - Perimetro_brazo_relajado', '34', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('592', '1', '17', '4', 'IMM - Perimetro_brazo_flexionado', '34', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('593', '1', '17', '4', 'IMM - Perimetro_femoral', '47', 'No Aplica', '0', '2014-10-15 12:40:18');
INSERT INTO `sg_pruebas` VALUES ('594', '1', '17', '4', 'IMM - Perimetro_Pantorrilla', '37', 'No Aplica', '0', '2014-10-15 12:40:19');
INSERT INTO `sg_pruebas` VALUES ('596', '1', '17', '5', 'Stamina', '99', 'Excelente', '80', '2014-10-15 13:40:25');
INSERT INTO `sg_pruebas` VALUES ('598', '1', '17', '6', 'Fuerza', '12', 'Pobre', '40', '2014-10-15 13:42:51');
INSERT INTO `sg_pruebas` VALUES ('600', '1', '17', '7', 'Resistencia', '24', 'Bueno', '80', '2014-10-15 13:46:39');
INSERT INTO `sg_pruebas` VALUES ('603', '9', '14', '1', 'condición Física', '63', 'Bueno', '60', '2014-10-19 15:36:40');
INSERT INTO `sg_pruebas` VALUES ('604', '9', '14', '2', 'Peso', '75', 'Peso Ideal', '100', '2014-10-19 15:39:47');
INSERT INTO `sg_pruebas` VALUES ('605', '9', '14', '3', 'IMC', '26', 'Sobre Peso', '60', '2014-10-19 15:40:29');
INSERT INTO `sg_pruebas` VALUES ('606', '9', '14', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('607', '9', '14', '4', 'IMM - Cadera', '95', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('608', '9', '14', '4', 'IMM - Perimetro_Espalda', '103', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('609', '9', '14', '4', 'IMM - Perimetro_Pecho', '97', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('610', '9', '14', '4', 'IMM - Perimetro_brazo_relajado', '34', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('611', '9', '14', '4', 'IMM - Perimetro_brazo_flexionado', '38', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('612', '9', '14', '4', 'IMM - Perimetro_femoral', '47', 'No Aplica', '0', '2014-10-19 15:41:31');
INSERT INTO `sg_pruebas` VALUES ('613', '9', '14', '4', 'IMM - Perimetro_Pantorrilla', '37', 'No Aplica', '0', '2014-10-19 15:41:32');
INSERT INTO `sg_pruebas` VALUES ('614', '9', '14', '5', 'Stamina', '25', 'Atleta', '100', '2014-10-19 15:41:58');
INSERT INTO `sg_pruebas` VALUES ('615', '9', '14', '6', 'Fuerza', '14', 'Muy Pobre', '20', '2014-10-19 15:42:16');
INSERT INTO `sg_pruebas` VALUES ('616', '9', '14', '7', 'Resistencia', '25', 'Excelente', '100', '2014-10-19 15:43:15');
INSERT INTO `sg_pruebas` VALUES ('617', '9', '14', '8', 'Flexibilidad', '25', 'Pobre', '40', '2014-10-19 15:43:36');
INSERT INTO `sg_pruebas` VALUES ('618', '1', '28', '1', 'condición Física', '60', 'Excelente', '80', '2014-11-06 21:16:23');
INSERT INTO `sg_pruebas` VALUES ('634', '1', '25', '1', 'condición Física', '60', 'Excelente', '80', '2014-11-29 17:47:39');
INSERT INTO `sg_pruebas` VALUES ('635', '1', '25', '2', 'Peso', '95', 'Obesidad', '20', '2014-11-29 17:48:12');
INSERT INTO `sg_pruebas` VALUES ('636', '1', '25', '3', 'IMC', '33', 'Obesidad', '20', '2014-11-29 17:57:24');
INSERT INTO `sg_pruebas` VALUES ('637', '1', '25', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('638', '1', '25', '4', 'IMM - Cadera', '85', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('639', '1', '25', '4', 'IMM - Perimetro_Espalda', '120', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('640', '1', '25', '4', 'IMM - Perimetro_Pecho', '80', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('641', '1', '25', '4', 'IMM - Perimetro_brazo_relajado', '60', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('642', '1', '25', '4', 'IMM - Perimetro_brazo_flexionado', '115', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('643', '1', '25', '4', 'IMM - Perimetro_femoral', '120', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('644', '1', '25', '4', 'IMM - Perimetro_Pantorrilla', '125', 'No Aplica', '0', '2014-11-29 17:57:53');
INSERT INTO `sg_pruebas` VALUES ('645', '1', '25', '5', 'Stamina', '18', 'Atleta', '100', '2014-11-29 17:58:13');
INSERT INTO `sg_pruebas` VALUES ('646', '1', '25', '6', 'Fuerza', '28', 'Pobre', '40', '2014-11-29 17:58:33');
INSERT INTO `sg_pruebas` VALUES ('647', '1', '25', '7', 'Resistencia', '28', 'Excelente', '100', '2014-11-29 17:58:54');
INSERT INTO `sg_pruebas` VALUES ('648', '1', '25', '8', 'Flexibilidad', '18', 'Pobre', '40', '2014-11-29 17:59:25');
INSERT INTO `sg_pruebas` VALUES ('665', '1', '29', '1', 'condición Física', '66', 'Bueno', '60', '2014-12-02 14:59:49');
INSERT INTO `sg_pruebas` VALUES ('666', '1', '29', '2', 'Peso', '80', 'Peso Ideal', '100', '2014-12-02 15:02:45');
INSERT INTO `sg_pruebas` VALUES ('667', '1', '29', '3', 'IMC', '25', 'Peso Ideal', '100', '2014-12-02 15:04:41');
INSERT INTO `sg_pruebas` VALUES ('668', '1', '29', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('669', '1', '29', '4', 'IMM - Cadera', '100', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('670', '1', '29', '4', 'IMM - Perimetro_Espalda', '115', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('671', '1', '29', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('672', '1', '29', '4', 'IMM - Perimetro_brazo_relajado', '34', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('673', '1', '29', '4', 'IMM - Perimetro_brazo_flexionado', '36', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('674', '1', '29', '4', 'IMM - Perimetro_femoral', '55', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('675', '1', '29', '4', 'IMM - Perimetro_Pantorrilla', '33', 'No Aplica', '0', '2014-12-02 15:05:55');
INSERT INTO `sg_pruebas` VALUES ('676', '1', '29', '5', 'Stamina', '180', 'Pobre', '20', '2014-12-02 15:07:08');
INSERT INTO `sg_pruebas` VALUES ('677', '1', '29', '6', 'Fuerza', '40', 'Bueno', '80', '2014-12-02 15:07:41');
INSERT INTO `sg_pruebas` VALUES ('678', '1', '29', '7', 'Resistencia', '120', 'Excelente', '100', '2014-12-02 15:08:06');
INSERT INTO `sg_pruebas` VALUES ('679', '1', '29', '8', 'Flexibilidad', '0', 'Pobre', '40', '2014-12-02 15:08:29');
INSERT INTO `sg_pruebas` VALUES ('681', '1', '30', '1', 'condición Física', '66', 'Bueno', '60', '2015-01-15 21:46:57');
INSERT INTO `sg_pruebas` VALUES ('682', '19', '30', '2', 'Peso', '88', 'Sobre Peso', '60', '2015-01-15 22:13:31');
INSERT INTO `sg_pruebas` VALUES ('683', '19', '30', '3', 'IMC', '30', 'Obesidad', '20', '2015-01-15 22:14:40');
INSERT INTO `sg_pruebas` VALUES ('684', '19', '30', '4', 'IMM - Cintura', '60', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('685', '19', '30', '4', 'IMM - Cadera', '70', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('686', '19', '30', '4', 'IMM - Perimetro_Espalda', '80', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('687', '19', '30', '4', 'IMM - Perimetro_Pecho', '80', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('688', '19', '30', '4', 'IMM - Perimetro_brazo_relajado', '25', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('689', '19', '30', '4', 'IMM - Perimetro_brazo_flexionado', '29', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('690', '19', '30', '4', 'IMM - Perimetro_femoral', '40', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('691', '19', '30', '4', 'IMM - Perimetro_Pantorrilla', '19', 'No Aplica', '0', '2015-01-15 22:16:09');
INSERT INTO `sg_pruebas` VALUES ('692', '19', '30', '5', 'Stamina', '120', 'Promedio', '40', '2015-01-15 22:19:53');
INSERT INTO `sg_pruebas` VALUES ('693', '19', '30', '6', 'Fuerza', '40', 'Bueno', '80', '2015-01-15 22:22:26');
INSERT INTO `sg_pruebas` VALUES ('694', '19', '30', '7', 'Resistencia', '90', 'Excelente', '100', '2015-01-15 22:23:31');
INSERT INTO `sg_pruebas` VALUES ('695', '19', '30', '8', 'Flexibilidad', '0', 'Pobre', '40', '2015-01-15 22:23:54');
INSERT INTO `sg_pruebas` VALUES ('696', '1', '31', '1', 'condición Física', '66', 'Bueno', '60', '2015-01-16 14:32:14');
INSERT INTO `sg_pruebas` VALUES ('697', '1', '31', '2', 'Peso', '88', 'Sobre Peso', '60', '2015-01-16 14:33:26');
INSERT INTO `sg_pruebas` VALUES ('698', '1', '31', '3', 'IMC', '30', 'Obesidad', '20', '2015-01-16 14:33:54');
INSERT INTO `sg_pruebas` VALUES ('699', '1', '31', '4', 'IMM - Cintura', '70', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('700', '1', '31', '4', 'IMM - Cadera', '80', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('701', '1', '31', '4', 'IMM - Perimetro_Espalda', '100', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('702', '1', '31', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('703', '1', '31', '4', 'IMM - Perimetro_brazo_relajado', '24', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('704', '1', '31', '4', 'IMM - Perimetro_brazo_flexionado', '30', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('705', '1', '31', '4', 'IMM - Perimetro_femoral', '44', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('706', '1', '31', '4', 'IMM - Perimetro_Pantorrilla', '22', 'No Aplica', '0', '2015-01-16 14:35:37');
INSERT INTO `sg_pruebas` VALUES ('707', '1', '31', '5', 'Stamina', '150', 'Pobre', '20', '2015-01-16 14:36:45');
INSERT INTO `sg_pruebas` VALUES ('708', '1', '31', '6', 'Fuerza', '66', 'Excelente', '100', '2015-01-16 14:37:11');
INSERT INTO `sg_pruebas` VALUES ('709', '1', '31', '7', 'Resistencia', '20', 'Pobre', '40', '2015-01-16 14:38:11');
INSERT INTO `sg_pruebas` VALUES ('710', '1', '31', '8', 'Flexibilidad', '2', 'Pobre', '40', '2015-01-16 14:39:17');
INSERT INTO `sg_pruebas` VALUES ('711', '1', '31', '1', 'condición Física', '66', 'Bueno', '60', '2015-01-19 01:55:42');
INSERT INTO `sg_pruebas` VALUES ('712', '1', '31', '1', 'condición Física', '66', 'Bueno', '60', '2015-01-21 02:45:10');
INSERT INTO `sg_pruebas` VALUES ('713', '1', '31', '2', 'Peso', '77', 'Peso Ideal', '100', '2015-01-21 02:45:28');
INSERT INTO `sg_pruebas` VALUES ('714', '1', '31', '3', 'IMC', '25', 'Peso Ideal', '100', '2015-01-21 02:45:44');
INSERT INTO `sg_pruebas` VALUES ('715', '1', '31', '4', 'IMM - Cintura', '77', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('716', '1', '31', '4', 'IMM - Cadera', '87', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('717', '1', '31', '4', 'IMM - Perimetro_Espalda', '99', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('718', '1', '31', '4', 'IMM - Perimetro_Pecho', '99', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('719', '1', '31', '4', 'IMM - Perimetro_brazo_relajado', '33', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('720', '1', '31', '4', 'IMM - Perimetro_brazo_flexionado', '35', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('721', '1', '31', '4', 'IMM - Perimetro_femoral', '23', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('722', '1', '31', '4', 'IMM - Perimetro_Pantorrilla', '11', 'No Aplica', '0', '2015-01-21 02:46:13');
INSERT INTO `sg_pruebas` VALUES ('723', '1', '31', '5', 'Stamina', '122', 'Promedio', '40', '2015-01-21 02:46:31');
INSERT INTO `sg_pruebas` VALUES ('724', '1', '31', '6', 'Fuerza', '34', 'Bueno', '80', '2015-01-21 02:46:44');
INSERT INTO `sg_pruebas` VALUES ('725', '1', '31', '7', 'Resistencia', '55', 'Excelente', '100', '2015-01-21 02:47:10');
INSERT INTO `sg_pruebas` VALUES ('726', '1', '31', '8', 'Flexibilidad', '10', 'Pobre', '40', '2015-01-21 02:47:34');
INSERT INTO `sg_pruebas` VALUES ('727', '1', '31', '1', 'condición Física', '66', 'Bueno', '60', '2015-01-23 16:16:22');
INSERT INTO `sg_pruebas` VALUES ('744', '1', '17', '1', 'Condicion Física', '50', 'Atleta', '100', '2015-02-15 22:40:57');
INSERT INTO `sg_pruebas` VALUES ('745', '1', '17', '2', 'Peso', '78', 'Peso Ideal', '100', '2015-02-15 22:41:18');
INSERT INTO `sg_pruebas` VALUES ('746', '1', '17', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-02-15 22:41:54');
INSERT INTO `sg_pruebas` VALUES ('747', '1', '17', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('748', '1', '17', '4', 'IMM - Cadera', '85', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('749', '1', '17', '4', 'IMM - Perimetro_Espalda', '115', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('750', '1', '17', '4', 'IMM - Perimetro_Pecho', '80', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('751', '1', '17', '4', 'IMM - Perimetro_brazo_relajado', '60', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('752', '1', '17', '4', 'IMM - Perimetro_brazo_flexionado', '115', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('753', '1', '17', '4', 'IMM - Perimetro_femoral', '120', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('754', '1', '17', '4', 'IMM - Perimetro_Pantorrilla', '125', 'No Aplica', '0', '2015-02-15 22:42:28');
INSERT INTO `sg_pruebas` VALUES ('755', '1', '17', '5', 'Stamina', '20', 'Atleta', '100', '2015-02-15 22:42:45');
INSERT INTO `sg_pruebas` VALUES ('756', '1', '17', '6', 'Fuerza', '20', 'Bueno', '80', '2015-02-15 22:43:13');
INSERT INTO `sg_pruebas` VALUES ('757', '1', '17', '7', 'Resistencia', '20', 'Bueno', '80', '2015-02-15 22:43:30');
INSERT INTO `sg_pruebas` VALUES ('761', '1', '17', '8', 'Flexibilidad', '20', 'Pobre', '40', '2015-02-16 00:43:18');
INSERT INTO `sg_pruebas` VALUES ('762', '1', '37', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-03-05 21:08:32');
INSERT INTO `sg_pruebas` VALUES ('763', '1', '37', '2', 'Peso', '89', '', '0', '2015-03-05 21:08:53');
INSERT INTO `sg_pruebas` VALUES ('764', '1', '37', '3', 'IMC', '25', 'Peso Ideal', '100', '2015-03-05 21:09:29');
INSERT INTO `sg_pruebas` VALUES ('765', '1', '37', '4', 'IMM - Cintura', '45', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('766', '1', '37', '4', 'IMM - Cadera', '26', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('767', '1', '37', '4', 'IMM - Perimetro_Espalda', '456', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('768', '1', '37', '4', 'IMM - Perimetro_Pecho', '52', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('769', '1', '37', '4', 'IMM - Perimetro_brazo_relajado', '54', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('770', '1', '37', '4', 'IMM - Perimetro_brazo_flexionado', '32', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('771', '1', '37', '4', 'IMM - Perimetro_femoral', '1', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('772', '1', '37', '4', 'IMM - Perimetro_Pantorrilla', '5', 'No Aplica', '0', '2015-03-05 21:09:58');
INSERT INTO `sg_pruebas` VALUES ('773', '1', '37', '5', 'Stamina', '50', 'Atleta', '100', '2015-03-05 21:10:36');
INSERT INTO `sg_pruebas` VALUES ('774', '1', '37', '6', 'Fuerza', '25', 'Promedio', '60', '2015-03-05 21:10:58');
INSERT INTO `sg_pruebas` VALUES ('775', '1', '37', '7', 'Resistencia', '30', 'Atleta', '0', '2015-03-05 21:11:33');
INSERT INTO `sg_pruebas` VALUES ('776', '1', '37', '8', 'Flexibilidad', '50', 'Atleta', '0', '2015-03-05 21:11:49');
INSERT INTO `sg_pruebas` VALUES ('777', '1', '31', '1', 'Condicion Física', '66', 'Bueno', '60', '2015-03-06 15:41:58');
INSERT INTO `sg_pruebas` VALUES ('778', '1', '31', '2', 'Peso', '95', 'Obesidad', '20', '2015-03-06 15:46:29');
INSERT INTO `sg_pruebas` VALUES ('779', '1', '31', '3', 'IMC', '28', 'Sobre Peso', '60', '2015-03-06 15:46:43');
INSERT INTO `sg_pruebas` VALUES ('780', '1', '31', '4', 'IMM - Cintura', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('781', '1', '31', '4', 'IMM - Cadera', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('782', '1', '31', '4', 'IMM - Perimetro_Espalda', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('783', '1', '31', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('784', '1', '31', '4', 'IMM - Perimetro_brazo_relajado', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('785', '1', '31', '4', 'IMM - Perimetro_brazo_flexionado', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('786', '1', '31', '4', 'IMM - Perimetro_femoral', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('787', '1', '31', '4', 'IMM - Perimetro_Pantorrilla', '100', 'No Aplica', '0', '2015-03-06 15:49:03');
INSERT INTO `sg_pruebas` VALUES ('788', '1', '31', '5', 'Stamina', '188', 'Pobre', '20', '2015-03-06 15:54:58');
INSERT INTO `sg_pruebas` VALUES ('789', '1', '31', '6', 'Fuerza', '50', 'Atleta', '0', '2015-03-06 15:56:47');
INSERT INTO `sg_pruebas` VALUES ('790', '1', '31', '7', 'Resistencia', '50', 'Atleta', '0', '2015-03-06 15:59:39');
INSERT INTO `sg_pruebas` VALUES ('791', '1', '31', '8', 'Flexibilidad', '10', 'Pobre', '40', '2015-03-06 16:06:55');
INSERT INTO `sg_pruebas` VALUES ('807', '1', '37', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-03-24 11:12:01');
INSERT INTO `sg_pruebas` VALUES ('808', '1', '37', '2', 'Peso', '82', 'Peso Ideal', '100', '2015-03-24 11:12:52');
INSERT INTO `sg_pruebas` VALUES ('809', '1', '37', '3', 'IMC', '23', 'Peso Ideal', '100', '2015-03-24 11:13:20');
INSERT INTO `sg_pruebas` VALUES ('810', '1', '31', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-03-24 11:14:50');
INSERT INTO `sg_pruebas` VALUES ('811', '1', '31', '2', 'Peso', '94', 'Obesidad', '20', '2015-03-24 11:15:12');
INSERT INTO `sg_pruebas` VALUES ('812', '1', '31', '3', 'IMC', '33', 'Obesidad', '20', '2015-03-24 11:15:32');
INSERT INTO `sg_pruebas` VALUES ('813', '1', '31', '4', 'IMM - Cintura', '113', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('814', '1', '31', '4', 'IMM - Cadera', '109', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('815', '1', '31', '4', 'IMM - Perimetro_Espalda', '50', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('816', '1', '31', '4', 'IMM - Perimetro_Pecho', '115', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('817', '1', '31', '4', 'IMM - Perimetro_brazo_relajado', '33', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('818', '1', '31', '4', 'IMM - Perimetro_brazo_flexionado', '41', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('819', '1', '31', '4', 'IMM - Perimetro_femoral', '49', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('820', '1', '31', '4', 'IMM - Perimetro_Pantorrilla', '40', 'No Aplica', '0', '2015-03-24 11:16:29');
INSERT INTO `sg_pruebas` VALUES ('821', '1', '31', '5', 'Stamina', '65', 'Atleta', '100', '2015-03-24 11:17:12');
INSERT INTO `sg_pruebas` VALUES ('822', '1', '31', '6', 'Fuerza', '30', 'Excelente', '100', '2015-03-24 11:17:31');
INSERT INTO `sg_pruebas` VALUES ('823', '1', '31', '7', 'Resistencia', '50', 'Atleta', '0', '2015-03-24 11:18:23');
INSERT INTO `sg_pruebas` VALUES ('824', '1', '31', '8', 'Flexibilidad', '18', 'Promedio', '60', '2015-03-24 11:19:51');
INSERT INTO `sg_pruebas` VALUES ('825', '1', '36', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-03-04 11:48:04');
INSERT INTO `sg_pruebas` VALUES ('826', '1', '36', '2', 'Peso', '82', 'Peso Ideal', '100', '2015-03-04 11:48:18');
INSERT INTO `sg_pruebas` VALUES ('827', '1', '36', '3', 'IMC', '23', 'Peso Ideal', '100', '2015-03-04 11:48:32');
INSERT INTO `sg_pruebas` VALUES ('828', '1', '36', '4', 'IMM - Cintura', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('829', '1', '36', '4', 'IMM - Cadera', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('830', '1', '36', '4', 'IMM - Perimetro_Espalda', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('831', '1', '36', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('832', '1', '36', '4', 'IMM - Perimetro_brazo_relajado', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('833', '1', '36', '4', 'IMM - Perimetro_brazo_flexionado', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('834', '1', '36', '4', 'IMM - Perimetro_femoral', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('835', '1', '36', '4', 'IMM - Perimetro_Pantorrilla', '100', 'No Aplica', '0', '2015-03-04 11:48:50');
INSERT INTO `sg_pruebas` VALUES ('836', '1', '36', '5', 'Stamina', '50', 'Atleta', '100', '2015-03-04 11:49:03');
INSERT INTO `sg_pruebas` VALUES ('837', '1', '36', '6', 'Fuerza', '100', 'Atleta', '100', '2015-03-04 14:13:23');
INSERT INTO `sg_pruebas` VALUES ('838', '1', '36', '7', 'Resistencia', '100', 'Atleta', '60', '2015-03-04 15:55:05');
INSERT INTO `sg_pruebas` VALUES ('839', '1', '36', '8', 'Flexibilidad', '20', 'Pobre', '40', '2015-03-04 11:49:46');
INSERT INTO `sg_pruebas` VALUES ('876', '1', '36', '8', 'Flexibilidad', '45', 'Atleta', '100', '2015-03-25 16:10:37');
INSERT INTO `sg_pruebas` VALUES ('877', '1', '36', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-03-26 10:46:31');
INSERT INTO `sg_pruebas` VALUES ('878', '1', '36', '2', 'Peso', '82', 'Peso Ideal', '100', '2015-03-26 10:46:45');
INSERT INTO `sg_pruebas` VALUES ('879', '1', '36', '3', 'IMC', '23', 'Peso Ideal', '100', '2015-03-26 10:47:00');
INSERT INTO `sg_pruebas` VALUES ('880', '1', '36', '4', 'IMM - Cintura', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('881', '1', '36', '4', 'IMM - Cadera', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('882', '1', '36', '4', 'IMM - Perimetro_Espalda', '1000', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('883', '1', '36', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('884', '1', '36', '4', 'IMM - Perimetro_brazo_relajado', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('885', '1', '36', '4', 'IMM - Perimetro_brazo_flexionado', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('886', '1', '36', '4', 'IMM - Perimetro_femoral', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('887', '1', '36', '4', 'IMM - Perimetro_Pantorrilla', '100', 'No Aplica', '0', '2015-03-26 10:47:30');
INSERT INTO `sg_pruebas` VALUES ('888', '1', '36', '5', 'Stamina', '78', 'Atleta', '100', '2015-03-26 10:48:18');
INSERT INTO `sg_pruebas` VALUES ('889', '1', '36', '6', 'Fuerza', '15', 'Pobre', '20', '2015-03-26 10:49:38');
INSERT INTO `sg_pruebas` VALUES ('890', '1', '36', '7', 'Resistencia', '45', 'Atleta', '100', '2015-03-26 10:50:02');
INSERT INTO `sg_pruebas` VALUES ('891', '1', '36', '8', 'Flexibilidad', '10', 'Pobre', '20', '2015-03-26 10:50:26');
INSERT INTO `sg_pruebas` VALUES ('892', '1', '39', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-04-02 10:47:28');
INSERT INTO `sg_pruebas` VALUES ('893', '1', '39', '2', 'Peso', '88', 'Sobre Peso', '60', '2015-04-02 10:48:18');
INSERT INTO `sg_pruebas` VALUES ('894', '1', '39', '3', 'IMC', '30', 'Obesidad', '20', '2015-04-02 10:48:57');
INSERT INTO `sg_pruebas` VALUES ('895', '1', '39', '4', 'IMM - Cintura', '99', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('896', '1', '39', '4', 'IMM - Cadera', '103', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('897', '1', '39', '4', 'IMM - Perimetro_Espalda', '44', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('898', '1', '39', '4', 'IMM - Perimetro_Pecho', '106', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('899', '1', '39', '4', 'IMM - Perimetro_brazo_relajado', '35', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('900', '1', '39', '4', 'IMM - Perimetro_brazo_flexionado', '40', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('901', '1', '39', '4', 'IMM - Perimetro_femoral', '40', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('902', '1', '39', '4', 'IMM - Perimetro_Pantorrilla', '56', 'No Aplica', '0', '2015-04-02 10:50:34');
INSERT INTO `sg_pruebas` VALUES ('919', '1', '49', '1', 'Condicion Física', '66', 'Bueno', '60', '2015-04-02 17:38:42');
INSERT INTO `sg_pruebas` VALUES ('920', '1', '49', '2', 'Peso', '72', 'Peso Ideal', '100', '2015-04-02 17:38:57');
INSERT INTO `sg_pruebas` VALUES ('921', '1', '49', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-04-02 17:39:10');
INSERT INTO `sg_pruebas` VALUES ('922', '1', '49', '4', 'IMM - Cintura', '89', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('923', '1', '49', '4', 'IMM - Cadera', '90', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('924', '1', '49', '4', 'IMM - Perimetro_Espalda', '44', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('925', '1', '49', '4', 'IMM - Perimetro_Pecho', '97', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('926', '1', '49', '4', 'IMM - Perimetro_brazo_relajado', '34', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('927', '1', '49', '4', 'IMM - Perimetro_brazo_flexionado', '38', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('928', '1', '49', '4', 'IMM - Perimetro_femoral', '33', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('929', '1', '49', '4', 'IMM - Perimetro_Pantorrilla', '46', 'No Aplica', '0', '2015-04-02 17:40:34');
INSERT INTO `sg_pruebas` VALUES ('930', '1', '49', '5', 'Stamina', '28', 'Atleta', '100', '2015-04-02 17:40:58');
INSERT INTO `sg_pruebas` VALUES ('931', '1', '49', '6', 'Fuerza', '28', 'Promedio', '40', '2015-04-02 17:41:05');
INSERT INTO `sg_pruebas` VALUES ('932', '1', '49', '7', 'Resistencia', '33', 'Atleta', '100', '2015-04-02 17:41:25');
INSERT INTO `sg_pruebas` VALUES ('933', '1', '49', '8', 'Flexibilidad', '11', 'Pobre', '20', '2015-04-02 17:41:35');
INSERT INTO `sg_pruebas` VALUES ('934', '1', '47', '1', 'Condicion Física', '66', 'Excelente', '80', '2015-04-02 17:45:46');
INSERT INTO `sg_pruebas` VALUES ('935', '1', '50', '1', 'Condicion Física', '62', 'Excelente', '80', '2015-04-02 21:17:36');
INSERT INTO `sg_pruebas` VALUES ('936', '1', '50', '2', 'Peso', '63', 'Peso Ideal', '100', '2015-04-02 21:17:50');
INSERT INTO `sg_pruebas` VALUES ('937', '1', '50', '3', 'IMC', '25', 'Peso Ideal', '100', '2015-04-02 21:18:07');
INSERT INTO `sg_pruebas` VALUES ('938', '1', '50', '4', 'IMM - Cintura', '75', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('939', '1', '50', '4', 'IMM - Cadera', '96', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('940', '1', '50', '4', 'IMM - Perimetro_Espalda', '34', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('941', '1', '50', '4', 'IMM - Perimetro_Pecho', '88', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('942', '1', '50', '4', 'IMM - Perimetro_brazo_relajado', '30', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('943', '1', '50', '4', 'IMM - Perimetro_brazo_flexionado', '31', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('944', '1', '50', '4', 'IMM - Perimetro_femoral', '38', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('945', '1', '50', '4', 'IMM - Perimetro_Pantorrilla', '54', 'No Aplica', '0', '2015-04-02 21:18:41');
INSERT INTO `sg_pruebas` VALUES ('946', '1', '50', '5', 'Stamina', '16', 'Atleta', '100', '2015-04-02 21:18:58');
INSERT INTO `sg_pruebas` VALUES ('947', '1', '50', '6', 'Fuerza', '16', 'Bueno', '60', '2015-04-02 21:19:06');
INSERT INTO `sg_pruebas` VALUES ('948', '1', '50', '7', 'Resistencia', '33', 'Atleta', '100', '2015-04-02 21:19:17');
INSERT INTO `sg_pruebas` VALUES ('949', '1', '50', '8', 'Flexibilidad', '31', 'Promedio', '40', '2015-04-02 21:19:27');
INSERT INTO `sg_pruebas` VALUES ('950', '1', '54', '1', 'Condicion Física', '66', 'Excelente', '80', '2015-04-02 21:27:10');
INSERT INTO `sg_pruebas` VALUES ('951', '1', '54', '2', 'Peso', '64', 'Peso Ideal', '100', '2015-04-02 21:28:09');
INSERT INTO `sg_pruebas` VALUES ('952', '1', '54', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-04-02 21:28:25');
INSERT INTO `sg_pruebas` VALUES ('953', '1', '54', '4', 'IMM - Cintura', '70', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('954', '1', '54', '4', 'IMM - Cadera', '89', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('955', '1', '54', '4', 'IMM - Perimetro_Espalda', '36', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('956', '1', '54', '4', 'IMM - Perimetro_Pecho', '92', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('957', '1', '54', '4', 'IMM - Perimetro_brazo_relajado', '28', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('958', '1', '54', '4', 'IMM - Perimetro_brazo_flexionado', '30', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('959', '1', '54', '4', 'IMM - Perimetro_femoral', '53', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('960', '1', '54', '4', 'IMM - Perimetro_Pantorrilla', '36', 'No Aplica', '0', '2015-04-02 21:29:27');
INSERT INTO `sg_pruebas` VALUES ('961', '1', '54', '5', 'Stamina', '25', 'Atleta', '100', '2015-04-02 21:29:41');
INSERT INTO `sg_pruebas` VALUES ('962', '1', '54', '6', 'Fuerza', '25', 'Bueno', '60', '2015-04-02 21:29:47');
INSERT INTO `sg_pruebas` VALUES ('963', '1', '54', '7', 'Resistencia', '25', 'Atleta', '100', '2015-04-02 21:30:08');
INSERT INTO `sg_pruebas` VALUES ('964', '1', '54', '8', 'Flexibilidad', '29', 'Promedio', '40', '2015-04-02 21:30:21');
INSERT INTO `sg_pruebas` VALUES ('965', '1', '57', '1', 'Condicion Física', '65', 'Excelente', '80', '2015-04-02 21:35:04');
INSERT INTO `sg_pruebas` VALUES ('966', '1', '57', '2', 'Peso', '88', 'Obesidad', '20', '2015-04-02 21:35:27');
INSERT INTO `sg_pruebas` VALUES ('967', '1', '57', '3', 'IMC', '35', 'Obesidad', '20', '2015-04-02 21:35:41');
INSERT INTO `sg_pruebas` VALUES ('968', '1', '57', '4', 'IMM - Cintura', '101', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('969', '1', '57', '4', 'IMM - Cadera', '116', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('970', '1', '57', '4', 'IMM - Perimetro_Espalda', '37', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('971', '1', '57', '4', 'IMM - Perimetro_Pecho', '111', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('972', '1', '57', '4', 'IMM - Perimetro_brazo_relajado', '39', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('973', '1', '57', '4', 'IMM - Perimetro_brazo_flexionado', '40', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('974', '1', '57', '4', 'IMM - Perimetro_femoral', '62', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('975', '1', '57', '4', 'IMM - Perimetro_Pantorrilla', '40', 'No Aplica', '0', '2015-04-02 21:36:15');
INSERT INTO `sg_pruebas` VALUES ('976', '1', '57', '5', 'Stamina', '12', 'Atleta', '100', '2015-04-02 21:36:33');
INSERT INTO `sg_pruebas` VALUES ('977', '1', '57', '6', 'Fuerza', '12', 'Bueno', '60', '2015-04-02 21:36:42');
INSERT INTO `sg_pruebas` VALUES ('978', '1', '57', '7', 'Resistencia', '20', 'Excelente', '80', '2015-04-02 21:36:52');
INSERT INTO `sg_pruebas` VALUES ('979', '1', '57', '8', 'Flexibilidad', '15', 'Pobre', '20', '2015-04-02 21:37:00');
INSERT INTO `sg_pruebas` VALUES ('980', '1', '58', '1', 'Condicion Física', '70', 'Bueno', '60', '2015-04-02 21:45:58');
INSERT INTO `sg_pruebas` VALUES ('981', '1', '58', '2', 'Peso', '70', '', '0', '2015-04-02 21:46:11');
INSERT INTO `sg_pruebas` VALUES ('982', '1', '47', '2', 'Peso', '59', 'Peso Ideal', '100', '2015-04-02 22:20:19');
INSERT INTO `sg_pruebas` VALUES ('983', '1', '47', '3', 'IMC', '23', 'Peso Ideal', '100', '2015-04-02 22:20:32');
INSERT INTO `sg_pruebas` VALUES ('984', '1', '47', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('985', '1', '47', '4', 'IMM - Cadera', '89', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('986', '1', '47', '4', 'IMM - Perimetro_Espalda', '32', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('987', '1', '47', '4', 'IMM - Perimetro_Pecho', '96', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('988', '1', '47', '4', 'IMM - Perimetro_brazo_relajado', '28', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('989', '1', '47', '4', 'IMM - Perimetro_brazo_flexionado', '30', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('990', '1', '47', '4', 'IMM - Perimetro_femoral', '45', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('991', '1', '47', '4', 'IMM - Perimetro_Pantorrilla', '35', 'No Aplica', '0', '2015-04-02 22:21:01');
INSERT INTO `sg_pruebas` VALUES ('992', '1', '47', '5', 'Stamina', '8', 'Atleta', '100', '2015-04-02 22:21:22');
INSERT INTO `sg_pruebas` VALUES ('993', '1', '47', '6', 'Fuerza', '8', 'Promedio', '40', '2015-04-02 22:21:30');
INSERT INTO `sg_pruebas` VALUES ('994', '1', '47', '7', 'Resistencia', '32', 'Atleta', '100', '2015-04-02 22:21:48');
INSERT INTO `sg_pruebas` VALUES ('995', '1', '47', '8', 'Flexibilidad', '36', 'Bueno', '60', '2015-04-02 22:21:58');
INSERT INTO `sg_pruebas` VALUES ('996', '1', '57', '1', 'Condicion Física', '65', 'Excelente', '80', '2015-04-03 14:35:35');
INSERT INTO `sg_pruebas` VALUES ('997', '1', '57', '2', 'Peso', '88', 'Obesidad', '20', '2015-04-03 14:35:53');
INSERT INTO `sg_pruebas` VALUES ('998', '1', '57', '3', 'IMC', '35', 'Obesidad', '20', '2015-04-03 14:36:06');
INSERT INTO `sg_pruebas` VALUES ('999', '1', '54', '1', 'Condicion Física', '66', 'Excelente', '80', '2015-04-03 14:41:01');
INSERT INTO `sg_pruebas` VALUES ('1000', '1', '54', '2', 'Peso', '64', 'Peso Ideal', '100', '2015-04-03 14:41:28');
INSERT INTO `sg_pruebas` VALUES ('1001', '1', '54', '3', 'IMC', '0', 'Bajo de peso', '60', '2015-04-03 14:41:40');
INSERT INTO `sg_pruebas` VALUES ('1002', '1', '50', '1', 'Condicion Física', '62', 'Excelente', '80', '2015-04-03 14:47:41');
INSERT INTO `sg_pruebas` VALUES ('1003', '1', '49', '1', 'Condicion Física', '68', 'Bueno', '60', '2015-04-03 14:48:34');
INSERT INTO `sg_pruebas` VALUES ('1004', '1', '47', '1', 'Condicion Física', '68', 'Excelente', '80', '2015-04-03 14:49:43');
INSERT INTO `sg_pruebas` VALUES ('1005', '1', '47', '2', 'Peso', '59', 'Peso Ideal', '100', '2015-04-03 14:50:47');
INSERT INTO `sg_pruebas` VALUES ('1006', '1', '58', '1', 'Condicion Física', '70', 'Bueno', '60', '2015-04-03 14:51:21');
INSERT INTO `sg_pruebas` VALUES ('1007', '1', '59', '1', 'Condicion Física', '66', 'Excelente', '80', '2015-04-03 14:53:46');
INSERT INTO `sg_pruebas` VALUES ('1008', '1', '59', '2', 'Peso', '57', 'Peso Ideal', '100', '2015-04-03 14:54:00');
INSERT INTO `sg_pruebas` VALUES ('1009', '1', '59', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-04-03 14:54:29');
INSERT INTO `sg_pruebas` VALUES ('1010', '1', '59', '4', 'IMM - Cintura', '71', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1011', '1', '59', '4', 'IMM - Cadera', '72', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1012', '1', '59', '4', 'IMM - Perimetro_Espalda', '32', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1013', '1', '59', '4', 'IMM - Perimetro_Pecho', '91', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1014', '1', '59', '4', 'IMM - Perimetro_brazo_relajado', '28', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1015', '1', '59', '4', 'IMM - Perimetro_brazo_flexionado', '28', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1016', '1', '59', '4', 'IMM - Perimetro_femoral', '48', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1017', '1', '59', '4', 'IMM - Perimetro_Pantorrilla', '33', 'No Aplica', '0', '2015-04-03 14:55:33');
INSERT INTO `sg_pruebas` VALUES ('1018', '1', '59', '5', 'Stamina', '0', 'Atleta', '100', '2015-04-03 14:55:51');
INSERT INTO `sg_pruebas` VALUES ('1019', '1', '59', '6', 'Fuerza', '0', 'Pobre', '20', '2015-04-03 14:56:00');
INSERT INTO `sg_pruebas` VALUES ('1020', '1', '59', '7', 'Resistencia', '0', 'Pobre', '20', '2015-04-03 14:56:07');
INSERT INTO `sg_pruebas` VALUES ('1021', '1', '59', '8', 'Flexibilidad', '0', 'Pobre', '20', '2015-04-03 14:56:15');
INSERT INTO `sg_pruebas` VALUES ('1022', '1', '44', '1', 'Condicion Física', '75', 'Promedio', '40', '2015-04-03 15:02:15');
INSERT INTO `sg_pruebas` VALUES ('1023', '1', '44', '2', 'Peso', '84', 'Peso Ideal', '100', '2015-04-03 15:02:35');
INSERT INTO `sg_pruebas` VALUES ('1024', '1', '44', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-04-03 15:02:52');
INSERT INTO `sg_pruebas` VALUES ('1025', '1', '44', '4', 'IMM - Cintura', '100', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1026', '1', '44', '4', 'IMM - Cadera', '106', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1027', '1', '44', '4', 'IMM - Perimetro_Espalda', '34', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1028', '1', '44', '4', 'IMM - Perimetro_Pecho', '48', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1029', '1', '44', '4', 'IMM - Perimetro_brazo_relajado', '29', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1030', '1', '44', '4', 'IMM - Perimetro_brazo_flexionado', '30', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1031', '1', '44', '4', 'IMM - Perimetro_femoral', '53', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1032', '1', '44', '4', 'IMM - Perimetro_Pantorrilla', '39', 'No Aplica', '0', '2015-04-03 15:03:23');
INSERT INTO `sg_pruebas` VALUES ('1033', '1', '44', '5', 'Stamina', '75', 'Atleta', '100', '2015-04-03 15:03:32');
INSERT INTO `sg_pruebas` VALUES ('1034', '1', '44', '6', 'Fuerza', '6', 'Promedio', '40', '2015-04-03 15:03:40');
INSERT INTO `sg_pruebas` VALUES ('1035', '1', '44', '7', 'Resistencia', '20', 'Bueno', '60', '2015-04-03 15:03:51');
INSERT INTO `sg_pruebas` VALUES ('1036', '1', '44', '8', 'Flexibilidad', '19', 'Pobre', '20', '2015-04-03 15:03:58');
INSERT INTO `sg_pruebas` VALUES ('1037', '1', '40', '1', 'Condicion Física', '77', 'Promedio', '40', '2015-04-03 15:09:41');
INSERT INTO `sg_pruebas` VALUES ('1038', '1', '40', '2', 'Peso', '78', 'Sobre Peso', '60', '2015-04-03 15:09:53');
INSERT INTO `sg_pruebas` VALUES ('1039', '1', '40', '3', 'IMC', '30', 'Obesidad', '20', '2015-04-03 15:10:04');
INSERT INTO `sg_pruebas` VALUES ('1040', '1', '40', '4', 'IMM - Cintura', '90', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1041', '1', '40', '4', 'IMM - Cadera', '102', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1042', '1', '40', '4', 'IMM - Perimetro_Espalda', '38', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1043', '1', '40', '4', 'IMM - Perimetro_Pecho', '102', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1044', '1', '40', '4', 'IMM - Perimetro_brazo_relajado', '31', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1045', '1', '40', '4', 'IMM - Perimetro_brazo_flexionado', '31', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1046', '1', '40', '4', 'IMM - Perimetro_femoral', '58', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1047', '1', '40', '4', 'IMM - Perimetro_Pantorrilla', '38', 'No Aplica', '0', '2015-04-03 15:10:35');
INSERT INTO `sg_pruebas` VALUES ('1048', '1', '40', '5', 'Stamina', '0', 'Atleta', '100', '2015-04-03 15:10:56');
INSERT INTO `sg_pruebas` VALUES ('1049', '1', '40', '6', 'Fuerza', '0', 'Pobre', '20', '2015-04-03 15:11:00');
INSERT INTO `sg_pruebas` VALUES ('1050', '1', '40', '7', 'Resistencia', '0', 'Pobre', '20', '2015-04-03 15:11:08');
INSERT INTO `sg_pruebas` VALUES ('1051', '1', '40', '8', 'Flexibilidad', '0', 'Pobre', '20', '2015-04-03 15:11:14');
INSERT INTO `sg_pruebas` VALUES ('1052', '1', '43', '1', 'Condicion Física', '67', 'Bueno', '60', '2015-04-03 15:32:29');
INSERT INTO `sg_pruebas` VALUES ('1053', '1', '43', '2', 'Peso', '53', 'Bajo de peso', '60', '2015-04-03 15:33:11');
INSERT INTO `sg_pruebas` VALUES ('1054', '1', '43', '3', 'IMC', '20', 'Peso Ideal', '100', '2015-04-03 15:33:28');
INSERT INTO `sg_pruebas` VALUES ('1055', '1', '43', '4', 'IMM - Cintura', '70', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1056', '1', '43', '4', 'IMM - Cadera', '84', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1057', '1', '43', '4', 'IMM - Perimetro_Espalda', '30', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1058', '1', '43', '4', 'IMM - Perimetro_Pecho', '87', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1059', '1', '43', '4', 'IMM - Perimetro_brazo_relajado', '24', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1060', '1', '43', '4', 'IMM - Perimetro_brazo_flexionado', '25', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1061', '1', '43', '4', 'IMM - Perimetro_femoral', '30', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1062', '1', '43', '4', 'IMM - Perimetro_Pantorrilla', '40', 'No Aplica', '0', '2015-04-03 15:35:04');
INSERT INTO `sg_pruebas` VALUES ('1063', '1', '43', '5', 'Stamina', '27', 'Atleta', '100', '2015-04-03 15:35:17');
INSERT INTO `sg_pruebas` VALUES ('1064', '1', '43', '6', 'Fuerza', '27', 'Bueno', '60', '2015-04-03 15:35:26');
INSERT INTO `sg_pruebas` VALUES ('1065', '1', '43', '7', 'Resistencia', '0', 'Pobre', '20', '2015-04-03 15:35:34');
INSERT INTO `sg_pruebas` VALUES ('1066', '1', '43', '8', 'Flexibilidad', '0', 'Pobre', '20', '2015-04-03 15:35:41');
INSERT INTO `sg_pruebas` VALUES ('1067', '1', '42', '1', 'Condicion Física', '66', 'Bueno', '60', '2015-04-03 15:45:58');
INSERT INTO `sg_pruebas` VALUES ('1068', '1', '42', '2', 'Peso', '107', 'Obesidad', '20', '2015-04-03 15:46:24');
INSERT INTO `sg_pruebas` VALUES ('1069', '1', '42', '3', 'IMC', '35', 'Obesidad', '20', '2015-04-03 15:46:44');
INSERT INTO `sg_pruebas` VALUES ('1070', '1', '42', '4', 'IMM - Cintura', '117', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1071', '1', '42', '4', 'IMM - Cadera', '111', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1072', '1', '42', '4', 'IMM - Perimetro_Espalda', '45', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1073', '1', '42', '4', 'IMM - Perimetro_Pecho', '116', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1074', '1', '42', '4', 'IMM - Perimetro_brazo_relajado', '36', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1075', '1', '42', '4', 'IMM - Perimetro_brazo_flexionado', '39', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1076', '1', '42', '4', 'IMM - Perimetro_femoral', '57', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1077', '1', '42', '4', 'IMM - Perimetro_Pantorrilla', '42', 'No Aplica', '0', '2015-04-03 15:47:19');
INSERT INTO `sg_pruebas` VALUES ('1078', '1', '42', '5', 'Stamina', '0', 'Atleta', '100', '2015-04-03 15:47:40');
INSERT INTO `sg_pruebas` VALUES ('1079', '1', '42', '6', 'Fuerza', '0', 'Pobre', '20', '2015-04-03 15:47:47');
INSERT INTO `sg_pruebas` VALUES ('1080', '1', '42', '7', 'Resistencia', '0', 'Pobre', '20', '2015-04-03 15:47:51');
INSERT INTO `sg_pruebas` VALUES ('1081', '1', '42', '8', 'Flexibilidad', '0', 'Pobre', '20', '2015-04-03 15:47:55');
INSERT INTO `sg_pruebas` VALUES ('1082', '1', '41', '1', 'Condicion Física', '66', 'Bueno', '60', '2015-04-03 15:53:39');
INSERT INTO `sg_pruebas` VALUES ('1103', '1', '2', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-04-27 01:43:48');
INSERT INTO `sg_pruebas` VALUES ('1104', '1', '2', '2', 'Peso', '83', 'Peso Ideal', '100', '2015-04-27 01:44:35');
INSERT INTO `sg_pruebas` VALUES ('1106', '1', '2', '3', 'IMC', '26', 'Sobre Peso', '60', '2015-04-27 01:50:52');
INSERT INTO `sg_pruebas` VALUES ('1107', '1', '2', '4', 'IMM - Cintura', '80', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1108', '1', '2', '4', 'IMM - Cadera', '85', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1109', '1', '2', '4', 'IMM - Perimetro_Espalda', '115', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1110', '1', '2', '4', 'IMM - Perimetro_Pecho', '80', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1111', '1', '2', '4', 'IMM - Perimetro_brazo_relajado', '60', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1112', '1', '2', '4', 'IMM - Perimetro_brazo_flexionado', '115', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1113', '1', '2', '4', 'IMM - Perimetro_femoral', '120', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1114', '1', '2', '4', 'IMM - Perimetro_Pantorrilla', '125', 'No Aplica', '0', '2015-04-27 01:51:18');
INSERT INTO `sg_pruebas` VALUES ('1115', '1', '2', '5', 'Stamina', '28', 'Atleta', '100', '2015-04-27 01:51:40');
INSERT INTO `sg_pruebas` VALUES ('1116', '1', '2', '6', 'Fuerza', '20', 'Promedio', '40', '2015-04-27 01:51:59');
INSERT INTO `sg_pruebas` VALUES ('1117', '1', '2', '7', 'Resistencia', '20', 'Promedio', '40', '2015-04-27 01:52:12');
INSERT INTO `sg_pruebas` VALUES ('1121', '1', '2', '8', 'Flexibilidad', '28', 'Promedio', '40', '2015-04-27 01:59:18');
INSERT INTO `sg_pruebas` VALUES ('1122', '1', '13', '1', 'Condicion Física', '60', 'Excelente', '80', '2015-05-08 10:30:40');
INSERT INTO `sg_pruebas` VALUES ('1123', '1', '13', '2', 'Peso', '75', 'Bajo de peso', '60', '2015-05-08 10:30:59');
INSERT INTO `sg_pruebas` VALUES ('1124', '1', '13', '3', 'IMC', '21', 'Peso Ideal', '100', '2015-05-08 10:31:23');
INSERT INTO `sg_pruebas` VALUES ('1125', '1', '87', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-15 11:40:53');
INSERT INTO `sg_pruebas` VALUES ('1126', '1', '87', '2', 'Peso', '85', 'Peso Ideal', '100', '2015-05-15 11:41:09');
INSERT INTO `sg_pruebas` VALUES ('1127', '1', '87', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-05-15 11:41:23');
INSERT INTO `sg_pruebas` VALUES ('1128', '1', '87', '4', 'IMM - Cintura', '56', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1129', '1', '87', '4', 'IMM - Cadera', '67', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1130', '1', '87', '4', 'IMM - Perimetro_Espalda', '66', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1131', '1', '87', '4', 'IMM - Perimetro_Pecho', '108', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1132', '1', '87', '4', 'IMM - Perimetro_brazo_relajado', '55', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1133', '1', '87', '4', 'IMM - Perimetro_brazo_flexionado', '60', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1134', '1', '87', '4', 'IMM - Perimetro_femoral', '70', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1135', '1', '87', '4', 'IMM - Perimetro_Pantorrilla', '40', 'No Aplica', '0', '2015-05-15 11:44:52');
INSERT INTO `sg_pruebas` VALUES ('1136', '1', '87', '5', 'Stamina', '55', 'Atleta', '100', '2015-05-15 11:45:07');
INSERT INTO `sg_pruebas` VALUES ('1137', '1', '87', '6', 'Fuerza', '50', 'Excelente', '80', '2015-05-15 11:45:17');
INSERT INTO `sg_pruebas` VALUES ('1138', '1', '87', '7', 'Resistencia', '60', 'Atleta', '100', '2015-05-15 11:45:37');
INSERT INTO `sg_pruebas` VALUES ('1139', '1', '87', '8', 'Flexibilidad', '15', 'Pobre', '20', '2015-05-15 11:45:47');
INSERT INTO `sg_pruebas` VALUES ('1140', '1', '88', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-18 09:43:13');
INSERT INTO `sg_pruebas` VALUES ('1141', '1', '88', '2', 'Peso', '62', 'Peso Ideal', '100', '2015-05-18 09:44:07');
INSERT INTO `sg_pruebas` VALUES ('1142', '1', '88', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-05-18 09:44:24');
INSERT INTO `sg_pruebas` VALUES ('1143', '1', '88', '4', 'IMM - Cintura', '83', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1144', '1', '88', '4', 'IMM - Cadera', '103', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1145', '1', '88', '4', 'IMM - Perimetro_Espalda', '36', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1146', '1', '88', '4', 'IMM - Perimetro_Pecho', '92', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1147', '1', '88', '4', 'IMM - Perimetro_brazo_relajado', '27', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1148', '1', '88', '4', 'IMM - Perimetro_brazo_flexionado', '28', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1149', '1', '88', '4', 'IMM - Perimetro_femoral', '50', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1150', '1', '88', '4', 'IMM - Perimetro_Pantorrilla', '36', 'No Aplica', '0', '2015-05-18 09:45:59');
INSERT INTO `sg_pruebas` VALUES ('1151', '1', '88', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 09:46:16');
INSERT INTO `sg_pruebas` VALUES ('1152', '1', '88', '6', 'Fuerza', '15', 'Bueno', '60', '2015-05-18 09:46:27');
INSERT INTO `sg_pruebas` VALUES ('1153', '1', '88', '7', 'Resistencia', '30', 'Atleta', '100', '2015-05-18 09:46:37');
INSERT INTO `sg_pruebas` VALUES ('1154', '1', '88', '8', 'Flexibilidad', '10', 'Pobre', '20', '2015-05-18 09:46:51');
INSERT INTO `sg_pruebas` VALUES ('1155', '1', '89', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-18 20:12:40');
INSERT INTO `sg_pruebas` VALUES ('1156', '1', '89', '2', 'Peso', '76', 'Sobre Peso', '60', '2015-05-18 20:17:34');
INSERT INTO `sg_pruebas` VALUES ('1157', '1', '89', '3', 'IMC', '30', 'Sobre Peso', '60', '2015-05-18 20:17:57');
INSERT INTO `sg_pruebas` VALUES ('1158', '1', '89', '4', 'IMM - Cintura', '98', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1159', '1', '89', '4', 'IMM - Cadera', '110', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1160', '1', '89', '4', 'IMM - Perimetro_Espalda', '41', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1161', '1', '89', '4', 'IMM - Perimetro_Pecho', '108', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1162', '1', '89', '4', 'IMM - Perimetro_brazo_relajado', '30', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1163', '1', '89', '4', 'IMM - Perimetro_brazo_flexionado', '32', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1164', '1', '89', '4', 'IMM - Perimetro_femoral', '57', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1165', '1', '89', '4', 'IMM - Perimetro_Pantorrilla', '38', 'No Aplica', '0', '2015-05-18 20:18:52');
INSERT INTO `sg_pruebas` VALUES ('1166', '1', '89', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 20:19:25');
INSERT INTO `sg_pruebas` VALUES ('1167', '1', '89', '6', 'Fuerza', '10', 'Promedio', '40', '2015-05-18 20:20:21');
INSERT INTO `sg_pruebas` VALUES ('1168', '1', '89', '7', 'Resistencia', '30', 'Atleta', '100', '2015-05-18 20:21:33');
INSERT INTO `sg_pruebas` VALUES ('1169', '1', '89', '8', 'Flexibilidad', '10', 'Pobre', '20', '2015-05-18 20:22:22');
INSERT INTO `sg_pruebas` VALUES ('1170', '1', '90', '1', 'Condicion Física', '65', 'Excelente', '80', '2015-05-18 20:39:24');
INSERT INTO `sg_pruebas` VALUES ('1171', '1', '90', '2', 'Peso', '97', 'Obesidad', '20', '2015-05-18 20:45:53');
INSERT INTO `sg_pruebas` VALUES ('1172', '1', '90', '3', 'IMC', '32', 'Obesidad', '20', '2015-05-18 20:46:14');
INSERT INTO `sg_pruebas` VALUES ('1173', '1', '90', '4', 'IMM - Cintura', '116', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1174', '1', '90', '4', 'IMM - Cadera', '118', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1175', '1', '90', '4', 'IMM - Perimetro_Espalda', '46', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1176', '1', '90', '4', 'IMM - Perimetro_Pecho', '113', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1177', '1', '90', '4', 'IMM - Perimetro_brazo_relajado', '32', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1178', '1', '90', '4', 'IMM - Perimetro_brazo_flexionado', '34', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1179', '1', '90', '4', 'IMM - Perimetro_femoral', '61', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1180', '1', '90', '4', 'IMM - Perimetro_Pantorrilla', '42', 'No Aplica', '0', '2015-05-18 20:46:45');
INSERT INTO `sg_pruebas` VALUES ('1181', '1', '90', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 20:47:16');
INSERT INTO `sg_pruebas` VALUES ('1182', '1', '90', '6', 'Fuerza', '0', 'Pobre', '20', '2015-05-18 20:48:21');
INSERT INTO `sg_pruebas` VALUES ('1183', '1', '90', '7', 'Resistencia', '40', 'Atleta', '100', '2015-05-18 20:50:42');
INSERT INTO `sg_pruebas` VALUES ('1184', '1', '90', '8', 'Flexibilidad', '15', 'Pobre', '20', '2015-05-18 20:51:39');
INSERT INTO `sg_pruebas` VALUES ('1185', '1', '91', '1', 'Condicion Física', '75', 'Promedio', '40', '2015-05-18 21:43:20');
INSERT INTO `sg_pruebas` VALUES ('1186', '1', '91', '2', 'Peso', '51', 'Bajo de peso', '60', '2015-05-18 21:46:59');
INSERT INTO `sg_pruebas` VALUES ('1187', '1', '91', '3', 'IMC', '20', 'Peso Ideal', '100', '2015-05-18 21:47:12');
INSERT INTO `sg_pruebas` VALUES ('1188', '1', '91', '4', 'IMM - Cintura', '73', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1189', '1', '91', '4', 'IMM - Cadera', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1190', '1', '91', '4', 'IMM - Perimetro_Espalda', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1191', '1', '91', '4', 'IMM - Perimetro_Pecho', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1192', '1', '91', '4', 'IMM - Perimetro_brazo_relajado', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1193', '1', '91', '4', 'IMM - Perimetro_brazo_flexionado', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1194', '1', '91', '4', 'IMM - Perimetro_femoral', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1195', '1', '91', '4', 'IMM - Perimetro_Pantorrilla', '0', 'No Aplica', '0', '2015-05-18 21:49:45');
INSERT INTO `sg_pruebas` VALUES ('1196', '1', '91', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 21:51:36');
INSERT INTO `sg_pruebas` VALUES ('1197', '1', '91', '6', 'Fuerza', '28', 'Bueno', '60', '2015-05-18 21:53:47');
INSERT INTO `sg_pruebas` VALUES ('1198', '1', '91', '7', 'Resistencia', '30', 'Atleta', '100', '2015-05-18 21:53:55');
INSERT INTO `sg_pruebas` VALUES ('1199', '1', '91', '8', 'Flexibilidad', '5', 'Pobre', '20', '2015-05-18 21:54:47');
INSERT INTO `sg_pruebas` VALUES ('1200', '1', '92', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-18 22:13:00');
INSERT INTO `sg_pruebas` VALUES ('1201', '1', '93', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-18 22:13:58');
INSERT INTO `sg_pruebas` VALUES ('1202', '1', '93', '2', 'Peso', '92', 'Sobre Peso', '60', '2015-05-18 22:24:31');
INSERT INTO `sg_pruebas` VALUES ('1203', '1', '93', '3', 'IMC', '31', 'Obesidad', '20', '2015-05-18 22:24:44');
INSERT INTO `sg_pruebas` VALUES ('1204', '1', '93', '4', 'IMM - Cintura', '0', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1205', '1', '93', '4', 'IMM - Cadera', '107', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1206', '1', '93', '4', 'IMM - Perimetro_Espalda', '47', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1207', '1', '93', '4', 'IMM - Perimetro_Pecho', '109', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1208', '1', '93', '4', 'IMM - Perimetro_brazo_relajado', '32', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1209', '1', '93', '4', 'IMM - Perimetro_brazo_flexionado', '34', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1210', '1', '93', '4', 'IMM - Perimetro_femoral', '52', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1211', '1', '93', '4', 'IMM - Perimetro_Pantorrilla', '41', 'No Aplica', '0', '2015-05-18 22:25:38');
INSERT INTO `sg_pruebas` VALUES ('1212', '1', '93', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 22:25:48');
INSERT INTO `sg_pruebas` VALUES ('1213', '1', '94', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-18 22:46:48');
INSERT INTO `sg_pruebas` VALUES ('1214', '1', '93', '6', 'Fuerza', '20', 'Promedio', '40', '2015-05-18 22:49:14');
INSERT INTO `sg_pruebas` VALUES ('1215', '1', '93', '7', 'Resistencia', '32', 'Atleta', '100', '2015-05-18 22:49:22');
INSERT INTO `sg_pruebas` VALUES ('1216', '1', '93', '8', 'Flexibilidad', '13', 'Pobre', '20', '2015-05-18 22:49:30');
INSERT INTO `sg_pruebas` VALUES ('1217', '1', '94', '2', 'Peso', '81', 'Sobre Peso', '60', '2015-05-18 22:52:07');
INSERT INTO `sg_pruebas` VALUES ('1218', '1', '94', '3', 'IMC', '29', 'Sobre Peso', '60', '2015-05-18 22:52:20');
INSERT INTO `sg_pruebas` VALUES ('1219', '1', '94', '4', 'IMM - Cintura', '97', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1220', '1', '94', '4', 'IMM - Cadera', '0', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1221', '1', '94', '4', 'IMM - Perimetro_Espalda', '43', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1222', '1', '94', '4', 'IMM - Perimetro_Pecho', '100', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1223', '1', '94', '4', 'IMM - Perimetro_brazo_relajado', '35', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1224', '1', '94', '4', 'IMM - Perimetro_brazo_flexionado', '37', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1225', '1', '94', '4', 'IMM - Perimetro_femoral', '51', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1226', '1', '94', '4', 'IMM - Perimetro_Pantorrilla', '36', 'No Aplica', '0', '2015-05-18 22:53:08');
INSERT INTO `sg_pruebas` VALUES ('1227', '1', '94', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 22:53:17');
INSERT INTO `sg_pruebas` VALUES ('1228', '1', '94', '6', 'Fuerza', '25', 'Bueno', '60', '2015-05-18 22:54:22');
INSERT INTO `sg_pruebas` VALUES ('1229', '1', '94', '7', 'Resistencia', '20', 'Promedio', '40', '2015-05-18 22:56:02');
INSERT INTO `sg_pruebas` VALUES ('1230', '1', '94', '8', 'Flexibilidad', '0', 'Pobre', '20', '2015-05-18 22:56:14');
INSERT INTO `sg_pruebas` VALUES ('1231', '1', '92', '2', 'Peso', '81', 'Peso Ideal', '100', '2015-05-18 23:00:30');
INSERT INTO `sg_pruebas` VALUES ('1232', '1', '92', '3', 'IMC', '29', 'Sobre Peso', '60', '2015-05-18 23:00:42');
INSERT INTO `sg_pruebas` VALUES ('1233', '1', '92', '4', 'IMM - Cintura', '96', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1234', '1', '92', '4', 'IMM - Cadera', '0', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1235', '1', '92', '4', 'IMM - Perimetro_Espalda', '50', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1236', '1', '92', '4', 'IMM - Perimetro_Pecho', '105', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1237', '1', '92', '4', 'IMM - Perimetro_brazo_relajado', '31', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1238', '1', '92', '4', 'IMM - Perimetro_brazo_flexionado', '33', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1239', '1', '92', '4', 'IMM - Perimetro_femoral', '51', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1240', '1', '92', '4', 'IMM - Perimetro_Pantorrilla', '39', 'No Aplica', '0', '2015-05-18 23:01:17');
INSERT INTO `sg_pruebas` VALUES ('1241', '1', '92', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-18 23:01:25');
INSERT INTO `sg_pruebas` VALUES ('1242', '1', '92', '6', 'Fuerza', '25', 'Promedio', '40', '2015-05-18 23:01:35');
INSERT INTO `sg_pruebas` VALUES ('1243', '1', '92', '7', 'Resistencia', '50', 'Atleta', '100', '2015-05-18 23:01:45');
INSERT INTO `sg_pruebas` VALUES ('1244', '1', '92', '8', 'Flexibilidad', '15', 'Pobre', '20', '2015-05-18 23:01:54');
INSERT INTO `sg_pruebas` VALUES ('1245', '1', '97', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-19 13:17:40');
INSERT INTO `sg_pruebas` VALUES ('1246', '1', '97', '2', 'Peso', '58', 'Peso Ideal', '100', '2015-05-19 13:20:41');
INSERT INTO `sg_pruebas` VALUES ('1247', '1', '97', '3', 'IMC', '23', 'Peso Ideal', '100', '2015-05-19 13:20:59');
INSERT INTO `sg_pruebas` VALUES ('1248', '1', '98', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-19 13:51:31');
INSERT INTO `sg_pruebas` VALUES ('1249', '1', '98', '2', 'Peso', '73', '', '0', '2015-05-19 13:55:08');
INSERT INTO `sg_pruebas` VALUES ('1250', '1', '87', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-19 20:34:49');
INSERT INTO `sg_pruebas` VALUES ('1251', '1', '87', '2', 'Peso', '82', 'Peso Ideal', '100', '2015-05-19 20:35:01');
INSERT INTO `sg_pruebas` VALUES ('1252', '1', '87', '3', 'IMC', '110', 'Obesidad', '20', '2015-05-19 20:35:17');
INSERT INTO `sg_pruebas` VALUES ('1253', '1', '87', '4', 'IMM - Cintura', '45', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1254', '1', '87', '4', 'IMM - Cadera', '95', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1255', '1', '87', '4', 'IMM - Perimetro_Espalda', '85', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1256', '1', '87', '4', 'IMM - Perimetro_Pecho', '15', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1257', '1', '87', '4', 'IMM - Perimetro_brazo_relajado', '35', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1258', '1', '87', '4', 'IMM - Perimetro_brazo_flexionado', '45', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1259', '1', '87', '4', 'IMM - Perimetro_femoral', '85', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1260', '1', '87', '4', 'IMM - Perimetro_Pantorrilla', '95', 'No Aplica', '0', '2015-05-19 20:35:45');
INSERT INTO `sg_pruebas` VALUES ('1261', '1', '87', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-19 20:37:12');
INSERT INTO `sg_pruebas` VALUES ('1262', '1', '87', '6', 'Fuerza', '80', 'Atleta', '100', '2015-05-19 20:37:18');
INSERT INTO `sg_pruebas` VALUES ('1263', '1', '87', '7', 'Resistencia', '35', 'Atleta', '100', '2015-05-19 20:37:23');
INSERT INTO `sg_pruebas` VALUES ('1264', '1', '87', '8', 'Flexibilidad', '20', 'Pobre', '20', '2015-05-19 20:37:29');
INSERT INTO `sg_pruebas` VALUES ('1265', '1', '37', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-19 20:40:21');
INSERT INTO `sg_pruebas` VALUES ('1266', '1', '37', '2', 'Peso', '85', 'Peso Ideal', '100', '2015-05-19 20:40:30');
INSERT INTO `sg_pruebas` VALUES ('1267', '1', '37', '3', 'IMC', '24', 'Peso Ideal', '100', '2015-05-19 20:40:36');
INSERT INTO `sg_pruebas` VALUES ('1268', '1', '37', '4', 'IMM - Cintura', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1269', '1', '37', '4', 'IMM - Cadera', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1270', '1', '37', '4', 'IMM - Perimetro_Espalda', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1271', '1', '37', '4', 'IMM - Perimetro_Pecho', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1272', '1', '37', '4', 'IMM - Perimetro_brazo_relajado', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1273', '1', '37', '4', 'IMM - Perimetro_brazo_flexionado', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1274', '1', '37', '4', 'IMM - Perimetro_femoral', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1275', '1', '37', '4', 'IMM - Perimetro_Pantorrilla', '50', 'No Aplica', '0', '2015-05-19 20:40:50');
INSERT INTO `sg_pruebas` VALUES ('1276', '1', '37', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-19 22:04:29');
INSERT INTO `sg_pruebas` VALUES ('1277', '1', '37', '6', 'Fuerza', '36', 'Bueno', '60', '2015-05-19 22:04:35');
INSERT INTO `sg_pruebas` VALUES ('1278', '1', '37', '7', 'Resistencia', '36', 'Atleta', '100', '2015-05-19 22:04:41');
INSERT INTO `sg_pruebas` VALUES ('1279', '1', '37', '8', 'Flexibilidad', '25', 'Promedio', '40', '2015-05-19 22:04:47');
INSERT INTO `sg_pruebas` VALUES ('1280', '1', '104', '1', 'Condicion Física', '65', 'Excelente', '80', '2015-05-20 09:12:03');
INSERT INTO `sg_pruebas` VALUES ('1281', '1', '108', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-20 21:14:20');
INSERT INTO `sg_pruebas` VALUES ('1282', '1', '108', '2', 'Peso', '96', 'Sobre Peso', '60', '2015-05-20 21:14:44');
INSERT INTO `sg_pruebas` VALUES ('1283', '1', '108', '3', 'IMC', '29', 'Sobre Peso', '60', '2015-05-20 21:14:56');
INSERT INTO `sg_pruebas` VALUES ('1284', '1', '108', '4', 'IMM - Cintura', '100', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1285', '1', '108', '4', 'IMM - Cadera', '0', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1286', '1', '108', '4', 'IMM - Perimetro_Espalda', '42', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1287', '1', '108', '4', 'IMM - Perimetro_Pecho', '101', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1288', '1', '108', '4', 'IMM - Perimetro_brazo_relajado', '31', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1289', '1', '108', '4', 'IMM - Perimetro_brazo_flexionado', '32', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1290', '1', '108', '4', 'IMM - Perimetro_femoral', '60', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1291', '1', '108', '4', 'IMM - Perimetro_Pantorrilla', '43', 'No Aplica', '0', '2015-05-20 21:18:32');
INSERT INTO `sg_pruebas` VALUES ('1292', '1', '108', '5', 'Stamina', '65', 'Atleta', '100', '2015-05-20 21:19:30');
INSERT INTO `sg_pruebas` VALUES ('1293', '1', '108', '6', 'Fuerza', '10', 'Pobre', '20', '2015-05-20 21:20:04');
INSERT INTO `sg_pruebas` VALUES ('1294', '1', '108', '7', 'Resistencia', '15', 'Promedio', '40', '2015-05-20 21:21:27');
INSERT INTO `sg_pruebas` VALUES ('1295', '1', '108', '8', 'Flexibilidad', '12', 'Pobre', '20', '2015-05-20 21:22:21');
INSERT INTO `sg_pruebas` VALUES ('1296', '1', '49', '1', 'Condicion Física', '65', 'Bueno', '60', '2015-05-20 21:59:09');
INSERT INTO `sg_pruebas` VALUES ('1297', '1', '110', '1', 'Condicion Física', '70', 'Bueno', '60', '2015-05-20 22:00:00');

-- ----------------------------
-- Function structure for `SPLIT_STR`
-- ----------------------------
DROP FUNCTION IF EXISTS `SPLIT_STR`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(x VARCHAR(255),
  delim VARCHAR(12),
  pos INT) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '')
;;
DELIMITER ;
