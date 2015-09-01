<?php
 // INCLUDE THE phpToPDF.php FILE
require("phpToPDF.php"); 
include("../../libs/libs.php");
$conexion   = new ConexionBean(); //Variable de conexión
$con        = $conexion->_con(); //Variable de conexión
// Tomando los datos.


$id_cliente   = $_GET['Id_Cliente'];
$consultar   = new Consultar();
$Utilidades  = new Utilidades();
$json_return = $Utilidades->ReportePdfultra($id_cliente);
$decode      = json_decode($json_return,true);

?>

<pre><?php print_r($decode);?></pre>