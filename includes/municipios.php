<?php
include('conexion.php');

if( isset($_POST['eid']) && !empty($_POST['eid']) ){
	$query 		= "SELECT id_municipio, nb_municipio FROM sg_municipios WHERE id_estado = ".$_POST['eid']." ORDER BY nb_municipio ASC";
	$RS_query	= mysql_query($query);
	$RS_num		=mysql_num_rows($RS_query);
	
	if( $RS_num > 0 ){
		echo(utf8_encode('<option value="">SELECCIONAR</option>'));
		
		while( $RS_reg = mysql_fetch_array($RS_query) ):
		echo('
			<option value="'.$RS_reg['id_municipio'].'">'.$RS_reg['nb_municipio'].'</option>
		');
		endwhile;
	}else{
		echo('0');
	}
}else{
	echo('0');
}
?>