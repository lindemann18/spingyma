<?php
include('conexion.php');

if( isset($_POST['eid']) && !empty($_POST['eid']) ){
	$query 		= "SELECT id_ciudad, nb_ciudad FROM sg_ciudades WHERE id_municipio = ".$_POST['eid']." ORDER BY nb_ciudad ASC";
	$RS_query	= mysql_query($query);
	$RS_num		=mysql_num_rows($RS_query);
	
	if( $RS_num > 0 ){
		echo(utf8_encode('<option value="">SELECCIONAR</option>'));

		while( $RS_reg = mysql_fetch_array($RS_query) ):
		echo('
			<option value="'.$RS_reg['id_ciudad'].'">'.$RS_reg['nb_ciudad'].'</option>
		');
		endwhile;
	}else{
		echo('0');
	}
}else{
	echo('0');
}
?>