<?php

	class ConexionBean
	{
		function _Con()
		{
			//$con = new PDO('pgsql:dbname=RaspBerry;host=localhost;user=postgres;password=12345');
			//return $con;
			require("rb.php");
			$con = R::setup('mysql:host=localhost;dbname=asherne1_spingyma','asherne1_spingym', 'bereit50!' );
			return $con;
		}

		}//Conexion
	
?>