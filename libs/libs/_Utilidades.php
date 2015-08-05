<?php

class Utilidades
{
	function udate($fecha_comparacion, $fecha_actual) 
	{
		$query = '
			SELECT DATEDIFF(?,?) as Dias_Transcurridos;
		';
		R::freeze(1);
			R::begin();
			    try{
			       $info = R::getRow($query,[$fecha_comparacion,$fecha_actual]);
			        R::commit();
			    }
			    catch(Exception $e) {
			       $info =  R::rollback();
			       $info = "Error";
			    }
			R::close();
			return $info;
	}//udate
	
	function ReportePdf($id_cliente)
	{
		$consultar = new Consultar();
		//Conseguir información de todas las pruebas
		$Prueba     = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Peso' ] );
		$id_peso    = $Prueba->id;

		$resultPeso = $consultar->_ConsultarResultadosPruebasReporte($id_peso,$id_cliente);
		$num_rows   = count($resultPeso);
		$Peso       = array();
		//tomando los resultados
		for($i=0; $i<$num_rows; $i++)
		{

		}//for
		
	}//ReportePdf

	function ReportePdf2($id_cliente)
	{
		
		$consultar = new Consultar();
		//Conseguir información de todas las pruebas
		$result    = $consultar->_ConsultarResultadosPruebasReporte(1,$id_cliente);
		$num_rows  = $result->num_rows;
		$Condicion = array();
		//tomando los resultados

			
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $result->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0;
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(1,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$resultadosCondicion = $this->CondicionFisicaResultados($Cond);
			$Barra				 = $resultadosCondicion['Barra'];
			$Longitud			 = $resultadosCondicion['Longitud'];
			
			$Con = array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,"fecha"=>$fecha,
			"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($Condicion,$Con);
		}//for	
		
		//Tomando los resultados de Peso
		$result    = $consultar->_ConsultarResultadosPruebasReporte(2,$id_cliente);
		$num_rows  = $result->num_rows;
		$PesosTot  = array();
		
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $result->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(2,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$ResultadosPeso = $this->PesoResultados($Porcentaje);
			$Barra		 	= $ResultadosPeso['Barra'];
			$Longitud		= $ResultadosPeso['Longitud'];
			
			$Peso   = array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($PesosTot,$Peso);
		}//for	
		
		//Tomando los datos de Stamina
		$resultStamina = $consultar->_ConsultarResultadosPruebasReporte(5,$id_cliente);
		$num_rows  	   = $resultStamina->num_rows;
		$Staminas  	   = array();
		
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $resultStamina->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(5,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$ResultadosPeso = $this->CondicionFisicaResultados($Cond);
			$Barra		 	= $ResultadosPeso['Barra'];
			$Longitud		= $ResultadosPeso['Longitud'];
			
			$Stamina   = array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($Staminas,$Stamina);
		}//for	
		
		//Tomando los de fuerzaç
		$resultFuerza  = $consultar->_ConsultarResultadosPruebasReporte(6,$id_cliente);
		$num_rows  	   = $resultFuerza->num_rows;
		$Fuerzas  	   = array();
		
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $resultFuerza->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(6,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$ResultadosPeso = $this->CondicionFisicaResultados($Cond);
			$Barra		 	= $ResultadosPeso['Barra'];
			$Longitud		= $ResultadosPeso['Longitud'];
			
			$Fuerza	 	    = array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($Fuerzas,$Fuerza);
		}//for	
		
		//Tomando los de resistencia.
		$ResultResist  = $consultar->_ConsultarResultadosPruebasReporte(7,$id_cliente);
		$num_rows  	   = $resultFuerza->num_rows;
		$Resistencias  = array();
		
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $ResultResist->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(7,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$ResultadosPeso = $this->CondicionFisicaResultados($Cond);
			$Barra		 	= $ResultadosPeso['Barra'];
			$Longitud		= $ResultadosPeso['Longitud'];
			
			$Resistencia	= array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($Resistencias,$Resistencia);
		}//for	
		
		//Tomando los de flexibilidad
		$ResultFlexi   = $consultar->_ConsultarResultadosPruebasReporte(8,$id_cliente);
		$num_rowsflex  = $ResultFlexi->num_rows;
		$Flexibilidad  = array();
		
		for($i=0; $i<3; $i++)			
		{
			$fila			    = $ResultFlexi->fetch_assoc();
			$resultado_numerico = ($fila['resultado_numerico']!=null)?$fila['resultado_numerico']:0; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?$this->ConvertirTimeStamp($fila['fecha']):"BioTest No Hecho";
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(8,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			$ResultadosPeso = $this->CondicionFisicaResultados($Cond);
			$Barra		 	= $ResultadosPeso['Barra'];
			$Longitud		= $ResultadosPeso['Longitud'];
			
			$Flexi			= array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$Longitud);
			array_push($Flexibilidad,$Flexi);
		}//for
		
		//tomando los resultados de IMM
		$ResultadosIMM = $consultar->_ConsultarResultadosPruebasIMM(4,$id_cliente);
		$num_rowsIMM   = $ResultadosIMM->num_rows;
		$IMM		   = array();
		$IMM2		   = array();
		
		for($i=0; $i<=15; $i++)
		{
			$filaIMM 	 = $ResultadosIMM->fetch_assoc();
			//Guardando en el primer array para asegurarnos si el usuario ha hecho más de un biotest.
			if($i<=7)
			{
				$desc_prueba = $filaIMM['Desc_Prueba'];
				$resultado   = $filaIMM['resultado_numerico'];
				$fecha       = $filaIMM['fecha'];
				$pruebaimm   = array("desc_prueba"=>$desc_prueba, "resultado"=>$resultado, "fecha"=>$fecha);
				array_push($IMM, $pruebaimm);
			}//if
			if($i>=8)
			{
				if($num_rowsIMM<16)
				{
					$desc_prueba = 0;
					$resultado2  = 0;
					$fecha2      = "Biotest No Hecho";
				}
				else
				{
					$desc_prueba  = $filaIMM['Desc_Prueba'];
					$resultado2   = $filaIMM['resultado_numerico'];
					$fecha2       = $filaIMM['fecha'];				
				}

				$pruebaimm2=array("desc_prueba"=>$desc_prueba,"resultado"=>$resultado2, "fecha"=>$fecha2);	
				array_push ($IMM2,$pruebaimm2); //Los primeros 8 que toma los los actuales
			}
		}//for
		
		//Lógica de la masa musculoar.
		$FechaIMM = $IMM[0]['fecha'];//Perímetro brazo relajado
		$Perimetro_brazo_relajado = "IMM - Perimetro_brazo_relajado";
		$Per_Brazo				 = "";
		//Perímetro brazo_flexionado
		$Perimetro_brazo_flexionado = "IMM - Perimetro_brazo_flexionado";
		$Per_Brazo_Fle			   = "";
		//Perímetro Femoral
		$Perimetro_femoral = "IMM - Perimetro_femoral";
		$Per_Femoral		  = "";
		//Perímetro de pantorrilla
		$Perimetro_Pantorrilla = "IMM - Perimetro_Pantorrilla";
		$Per_Pantorrilla		  = "";
		//Perímetro Cintura
		$Cintura			= "IMM - Cintura";
		$CantidadCintura = "";
		//Perímetro Cadera
		$Cadera		   = "IMM - Cadera";
		$CantidadCadera = "";
		//Perímetro Espalda
		$Perimetro_Espalda = "IMM - Perimetro_Espalda";
		$per_espalda_can	  = "";
		//Perímetro Pecho
		$Perimetro_Pecho = "IMM - Perimetro_Pecho";
		$Per_Pecho		= "";
		
		$IMMLibre  = $this->DespejarValoresArrayIMM($IMM);
		$IMMLibre2 = $this->DespejarValoresArrayIMM($IMM2);
		
		//Sacando ls diferencias de los resultados.
		
		//Cintura	
		$CantidadCintura  = $IMMLibre['CantidadCintura'];
		$CantidadCintura2 = $IMMLibre2['CantidadCintura'];
		$ResCintura		  = 0;
		$ResCin			  = $CantidadCintura-$CantidadCintura2;
		if($CantidadCintura==$ResCin)$ResCintura="Primer Biotest";
		if($ResCin>0 && $CantidadCintura!=$ResCin)$ResCintura="Disminuiste: ".$ResCin;
		if($ResCin==0)$ResCintura="Sin Cambios";
		if($ResCin<0)$ResCintura="Aumentaste: ".($ResCin*-1);
			
		//Cadera.
		$CantidadCadera  = $IMMLibre['CantidadCadera'];
		$CantidadCadera2 = $IMMLibre2['CantidadCadera'];
		$Res_Cadera		 = 0;
		$ResCad 		 = $CantidadCadera-$CantidadCadera2;
		if($CantidadCadera==$ResCad)$Res_Cadera="Primer Biotest";
		if($ResCad>0 && $CantidadCadera!=$ResCad)$Res_Cadera="Disminuiste: ".$ResCad;
		if($ResCad==0)$Res_Cadera="Sin Cambios";
		if($ResCad<0)$Res_Cadera="Aumentaste: ".($ResCad*-1);
		
		//Perímetro Espalda.
		$Perimetro_Espalda  = $IMMLibre['per_espalda_can'];
		$Perimetro_Espalda2 = $IMMLibre2['per_espalda_can'];
		$Res_per_esp		= 0;
		$Resesp				= $Perimetro_Espalda-$Perimetro_Espalda2;
		if($Perimetro_Espalda==$Resesp)$Res_per_esp="Primer Biotest"; //Da la misma cantidad por que se le resta un 0 y no hay cambios.
		if($Resesp>0 && $Perimetro_Espalda!=$Resesp)$Res_per_esp="Disminuiste: ".$Resesp;
		if($Resesp==0)$Res_per_esp="Sin Cambios";
		if($Resesp<0)$Res_per_esp="Aumentaste: ".($Resesp*-1);
		
		//Perímetro Pecho.
		$Per_Pecho  = $IMMLibre['Per_Pecho'];
		$Per_Pecho2 = $IMMLibre2['Per_Pecho'];
		$Res_pecho	 = 0;
		$ResPecho=$Per_Pecho-$Per_Pecho2;
		if($Per_Pecho==$ResPecho)$Res_pecho="Primer Biotest";
		if($ResPecho>0 && $Per_Pecho!=$ResPecho)$Res_pecho="Disminuiste: ".$ResPecho;
		if($ResPecho==0)$Res_pecho="Sin Cambios";
		if($ResPecho<0)$Res_pecho="Aumentaste: ".($ResPecho*-1);

		
		//Perímetro BRazo Relajado.
		$Perimetro_brazo  = $IMMLibre['Per_Brazo'];
		$Perimetro_brazo2 = $IMMLibre2['Per_Brazo'];
		$Res_Brazo		  = 0;
		$PerBrazo		  = $Perimetro_brazo-$Perimetro_brazo2;
		if($Perimetro_brazo==$PerBrazo)$Res_Brazo="Primer Biotest";
		if($PerBrazo>0 && $Perimetro_brazo!=$PerBrazo)$Res_Brazo="Disminuiste: ".$PerBrazo;
		if($PerBrazo==0)$Res_Brazo="Sin Cambios";
		if($PerBrazo<0)$Res_Brazo="Aumentaste: ".($PerBrazo*-1);
		
		//Perímetro BRazo Flexionado.
		$Per_Brazo_Fle  = $IMMLibre['Per_Brazo_Fle'];
		$Per_Brazo_Fle2 = $IMMLibre2['Per_Brazo_Fle'];
		$Res_BrazoFle		  = 0;
		$PerBrazoFle = $Per_Brazo_Fle-$Per_Brazo_Fle2;
		if($PerBrazoFle==$PerBrazoFle)$Res_BrazoFle="Primer Biotest";
		if($PerBrazoFle>0 && $Per_Brazo_Fle!=$PerBrazoFle)$Res_BrazoFle="Disminuiste: ".$PerBrazoFle;
		if($PerBrazoFle==0)$Res_BrazoFle="Sin Cambios";
		if($PerBrazoFle<0)$Res_BrazoFle="Aumentaste: ".($PerBrazoFle*-1);
		
		//Perímetro BRazo Femoral.
		$Per_Femoral  = $IMMLibre['Per_Femoral'];
		$Per_Femoral2 = $IMMLibre2['Per_Femoral'];
		$Res_PeriFemo = 0;
		$Perfemo	  = $Per_Femoral-$Per_Femoral2;
		if($Per_Femoral==$Perfemo)$Res_PeriFemo="Primer Biotest";
		if($Perfemo>0 && $Per_Femoral!=$Perfemo)$Res_PeriFemo="Disminuiste: ".$Perfemo;
		if($Perfemo==0)$Res_PeriFemo="Sin Cambios";
		if($Perfemo<0)$Res_PeriFemo="Aumentaste: ".($Perfemo*-1);
		
		//Perímetro Pantorrila.
		$Per_Pantorrilla  = $IMMLibre['Per_Pantorrilla'];
		$Per_Pantorrilla2 = $IMMLibre2['Per_Pantorrilla'];
		$ResPerPant		  = 0;
		$PerPanto		  = $Per_Pantorrilla-$Per_Pantorrilla2;
		if($Per_Pantorrilla==$PerPanto)$ResPerPant="Primer Biotest";
		if($PerPanto>0 && $Per_Pantorrilla!=$PerPanto)$ResPerPant="Disminuiste: ".$PerPanto;
		if($PerPanto==0)$ResPerPant="Sin Cambios";
		if($PerPanto<0)$ResPerPant="Aumentaste: ".($PerPanto*-1);

		
		
		$IMMResultados = array("ResCintura"=>$ResCintura,"Res_Cadera"=>$Res_Cadera,"Res_per_esp"=>$Res_per_esp,"Res_Brazo"=>$Res_Brazo,
		"Res_pecho"=>$Res_pecho,"Res_BrazoFle"=>$Res_BrazoFle,"Res_PeriFemo"=>$Res_PeriFemo,"ResPerPant"=>$ResPerPant);
		
		//Devolviendo los resultados.
		$salidaJson = array("Condicion"=>$Condicion,"Peso"=>$PesosTot,"Stamina"=>$Staminas,"Fuerza"=>$Fuerzas,"Resistencia"=>$Resistencias,
		"Flexibilidad"=>$Flexibilidad, "IMM"=>$IMMLibre,"IMM2"=>$IMMLibre2,"IMMResultados"=>$IMMResultados);
		$salidaJson = json_encode($salidaJson);	
		return $salidaJson;
	}//ReportePdf
	
	function ConvertirTimeStamp($time) //función para devolver un string de la fecha a partir de una time stamp de mysql
	{
		//Quitando las horas y minutos
		$fechas		    = explode(" ",$time);
		$fechaSinHoras  = $fechas[0];
		//Seperando los elementos de año, mes y día.
		$ElementosFecha = explode("-",$fechaSinHoras);
		$year			= $ElementosFecha[0];
		@$month			= $ElementosFecha[1];
		@$day			= $ElementosFecha[2];
		$mes="";
		//Asignando el nombre del mes correspondiente
			if($month==1) $mes = "Enero";
			if($month==2) $mes = "Febrero";
			if($month==3) $mes = "Marzo";
			if($month==4) $mes = "Abril";
			if($month==5) $mes = "Mayo";
			if($month==6) $mes = "Junio";
			if($month==7) $mes = "Julio";
			if($month==8) $mes = "Agosto";
			if($month==9) $mes = "Septiembre";
			if($month==10)$mes = "Octubre";
			if($month==11)$mes = "Noviembre";
			if($month==12)$mes = "Diciembre";	
		
		//Devolviendo el string de la fecha adecuado.
		$Fechafinal = $day." de ".$mes." de ".$year;
		return $Fechafinal;
	}
	
	function CondicionFisicaResultados($Cond)
	{
		$Barra 	  = '';
		$longitud = "";
			switch($Cond)
			{
				case 'Atleta':
					$Barra    = "progress-bar-success";
					$longitud = "width:100%";
				break;
				
				case 'Excelente':
					$Barra    ="progress-bar-success";
					$longitud = "width:80%";
				break;
				
				case 'Bueno':
					$Barra    =" ";
					$longitud = "width:60%";
				break;
				
				case 'Promedio':
					$Barra    ="progress-bar-warning";
					$longitud = "width:40%";
				break;
				
				case 'Pobre':
					$Barra    ="progress-bar-danger";
					$longitud = "width:20%";
				break;
			}//switch	
			
			$result = array("Barra"=>$Barra, "Longitud"=>$longitud);
			return $result;
	}//CondicionFisicaResultados
	
	function PesoResultados($Porcentaje)
	{
		$Barra 	  = '';
		$longitud = "";
		switch($Porcentaje)
		{
			case 100:
				$Barra    = "progress-bar-success";
				$longitud = "width:100%";
			break;
			
			case 60:
				$Barra    = "progress-bar-success";
				$longitud = "width:60%";
			break;
			
			case 20:
				$Barra    = "progress-bar-danger";
				$longitud = "width:20%";
			break;
		}//switch	
		$result = array("Barra"=>$Barra, "Longitud"=>$longitud);
		return $result;
	}//PesoResultados

	
	function AsignarValoresArrayIMM($cadena,$pruebas,$i)
	{
		
	
		switch($cadena)
		{
			case "IMM - Perimetro_brazo_relajado": 
				$Per_Brazo = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Perimetro_brazo_flexionado': 
				$Per_Brazo_Fle = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Perimetro_femoral': 
				$Per_Femoral = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Perimetro_Pantorrilla': 
				$Per_Pantorrilla = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Cintura': 
				$CantidadCintura= $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Cadera': 
				$CantidadCadera = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Perimetro_Espalda': 
				$per_espalda_can = $pruebas[$i]['resultado'];
			break;
			
			case 'IMM - Perimetro_Pecho': 
				$Per_Pecho = $pruebas[$i]['resultado'];
			break;
		}//switch
		
	}//AsignarValoresArrayIMM
	
	
	function DespejarValoresArrayIMM($IMM)
	{
		//Se hace un ciclo para saber que es lo que viene y tomar los datos correctamente.
		$Per_Brazo 	     = 0;
		$Per_Brazo_Fle   = 0;
		$Per_Femoral   	 = 0;
		$Per_Pantorrilla = 0;
		$CantidadCintura = 0;
		$CantidadCadera  = 0;
		$per_espalda_can = 0;
		$Per_Pecho  	 = 0;
		for($i=0; $i<8; $i++)
		{
			//Tomando los valores de las pruebas a partir del nombre de las mismas.
			switch($IMM[$i]['desc_prueba'])
			{
				case "IMM - Perimetro_brazo_relajado": 
					$Per_Brazo 	     = $IMM[$i]['resultado'];
				break;
				case 'IMM - Perimetro_brazo_flexionado': 
					$Per_Brazo_Fle   = $IMM[$i]['resultado'];
				break;
				case 'IMM - Perimetro_femoral': 
					$Per_Femoral     = $IMM[$i]['resultado'];
				break;
				case 'IMM - Perimetro_Pantorrilla': 
					$Per_Pantorrilla = $IMM[$i]['resultado'];
				break;
				case 'IMM - Cintura': 
					$CantidadCintura = $IMM[$i]['resultado'];
				break;
				case 'IMM - Cadera': 
					$CantidadCadera  = $IMM[$i]['resultado'];
				break;
				case 'IMM - Perimetro_Espalda': 
					$per_espalda_can = $IMM[$i]['resultado'];
				break;
				case 'IMM - Perimetro_Pecho': 
					$Per_Pecho		 = $IMM[$i]['resultado'];
				break;
				
			}//switch				
		}//for
		
		$fecha = $IMM[0]['fecha'];
		$fecha = $this->ConvertirTimeStamp($fecha);
		$IMMLibre = array("Per_Brazo"=>$Per_Brazo,"Per_Brazo_Fle"=>$Per_Brazo_Fle,"Per_Femoral"=>$Per_Femoral,"Per_Pantorrilla"=>$Per_Pantorrilla,
		"CantidadCintura"=>$CantidadCintura,"CantidadCadera"=>$CantidadCadera,"per_espalda_can"=>$per_espalda_can,"Per_Pecho"=>$Per_Pecho,"fecha"=>$fecha);	
		return $IMMLibre;
	}//DespejarValoresArrayIMM
	
	
	function _DefinirTipoRutinaCategoria($categoria)
	{
		$consultar = new Consultar();
		$result    = $consultar->_ConsultarCategoriasRutinas($categoria);
		$fila      = $result->fetch_assoc();
		$id		   = $fila['id'];
		return $id;
	}//_DefinirTipoRutinaCategoria
	
}// class Utilidades

?>