<?php

#$mysql_host 	= "localhost";

#$mysql_database = "spingym";

#$mysql_user 	= "root";

#$mysql_password = "";



$mysql_host 	= "localhost";

$mysql_database = "spingym";

$mysql_user 	= "localhost";

$mysql_password = "";



$conexion = mysql_connect($mysql_host, $mysql_user, $mysql_password);

mysql_select_db($mysql_database, $conexion);





#VARIABLES GLOBALES PARA LAS CADENAS DE REGISTROS A LA BASE DE DATOS

$id_autor		=	'1';

$dragSortOrder	=	time();

$fecha_registro	=	date("Y-m-d H:i:s", strtotime("-2 hours"));

?>