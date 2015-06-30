<?php
include('conexion.php');


	$query 		= "SELECT id_estado, nb_estado FROM sg_estados ORDER BY nb_estado ASC";
	$RS_query	= mysql_query($query);
	$RS_num		=mysql_num_rows($RS_query);
	
	if( $RS_num > 0 ){
		echo(utf8_encode('<option value="">SELECCIONAR</option>'));
		
		while( $RS_reg = mysql_fetch_array($RS_query) ):
		echo('
			<option value="'.$RS_reg['id_estado'].'">'.$RS_reg['nb_estado'].'</option>
		');
		endwhile;
	}else{
		echo('0');
	}

?>