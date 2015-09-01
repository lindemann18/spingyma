<?php
	session_start();
	include("../../libs/libs.php");
	$conexion   = new ConexionBean(); //Variable de conexión
	$con        = $conexion->_con(); //Variable de conexión
	$Params=(isset($_GET['Params']))?$_GET['Params']:$_POST['Params'];
	$Parametros=json_decode($Params,true);
	$Accion=$Parametros['Accion'];

	//Switch de las funciones
	switch($Accion)
	{
		case 'UltimoBiotestCliente':
			$salidaJson = UltimoBiotestCliente($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'Peso':
			$salidaJson = Peso($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'ResultadosPeso':
			$salidaJson = ResultadosPeso($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'CondicionFisica':
			$salidaJson = CondicionFisica($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'Fuerza':
			$salidaJson = Fuerza($Parametros);
			echo json_encode($salidaJson);
		break;
		

		case 'Resultados':
			$salidaJson = Resultados($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'Stamina':
			$salidaJson = Stamina($Parametros);
			echo json_encode($salidaJson);
		break;


		case 'Resistencia':
			$salidaJson = Resistencia($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'Flexibilidad':
			$salidaJson = Flexibilidad($Parametros);
			echo json_encode($salidaJson);
		break;

		case 'IMM':
			$salidaJson = IMM($Parametros);
			echo json_encode($salidaJson);
		break;

		//Casos viejos
		
		
		
		case 'IMC':
			$id_Cliente	   = $Parametros['Id_Cliente'];
			$Altura		   = $Parametros['Altura'];
			$peso		   = $Parametros['peso'];
			$id_instructor = $Parametros['id_instructor'];
			$salidaJson	   = IMC($id_Cliente,$Altura,$id_instructor,$peso);
			echo json_encode($salidaJson);
		break;
		
		
		
		
		case 'ReportePdf':
			$id_Cliente =  $Parametros['Id_Cliente'];
			$salidaJson = ReportePdf($id_Cliente);
			echo json_encode($salidaJson);
		break;
		
		case 'CrearCapturaImagen':
		$Params=$_POST['Params'];
		$Parametros=json_decode($Params,true);
		$de_imagen=$Parametros['de_imagen'];
	}
		
	function Peso($Parametros)
	{
		// Tomando los datos
		$Altura     = $Parametros['Altura'];
		$Peso       = $Parametros['Peso'];
		$id_Cliente = $Parametros['cliente'];
		$pesoDatos  = "";
		$imcDatos   = "";
		//tomando el id de la prueba
		$Prueba     = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Peso' ] );
		$id_peso    = $Prueba->id;

		//Tomando los resultados acorde a los datos enviados
		$RangoDePeso = RangoDePesoPorAltura($Altura, $Peso);

		if($RangoDePeso!="Fuera de rango")
		{
			// Si entró aquí es por que el rango de datos es el correcto.
			$exito = 1;
			date_default_timezone_set("America/Chihuahua");
			$fh_creacion  = date("Y-m-d"); //fecha del día de hoy
			$id_inst      = $_SESSION['usuario']['id'];
			$pesoDatos    = EvaluarPeso($Peso,$Altura,$id_Cliente,$fh_creacion,$id_inst);
			$imcDatos     = IMCEvaluar($Peso,$Altura,$id_Cliente,$fh_creacion,$id_inst);
			
		}//if
		else{$exito = ($RangoDePeso!="Fuera de rango")?1:0;}//else
		$datos = array("imc"=>$imcDatos,"peso"=>$pesoDatos,"exito"=>$exito);
		return $datos;
	}//Peso


	///Funciones de condición física///

	

	function ResultadosBiotest($Parametros)
	{
		//Tomando los valores
		$cliente       = $Parametros['id'];
		$consultar     = new Consultar();
		//Se deben buscar los resultados de toda slas pruebas.
		// Resuiltados de peso.
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Peso' ] );
		$id_prueba     = $Prueba->id;
		$resultadoPeso = $consultar->_ConsultarResultadosPruebaslight($id_prueba,$cliente);
		$cantidadpeso  = count($resultadoPeso);
		$exitopeso     = ($cantidadpeso>0)?1:0;
		$datospeso     = $consultar->_ConsultarResultadoPruebaCliente($cliente,$id_prueba);
		$resultpeso    = $datospeso['resultado'];
		$Prueba        = R::findOne( 'sgconsejos', ' id_tipo_prueba = ?  and Resultado = ?', [$id_prueba,$resultpeso] );
		$consejoPeso   = $Prueba['consejo'];
		// Resuiltados de IMC.
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Imc' ] );
		$id_pruebaimc  = $Prueba->id;
		$resultadoImc  = $consultar->_ConsultarResultadosPruebaslight($id_pruebaimc,$cliente);
		$cantidadimc   = count($resultadoImc);
		$exitoimc      = ($cantidadimc>0)?1:0;
		$datosimc      = $consultar->_ConsultarResultadoPruebaCliente($cliente,$id_pruebaimc);
		$resulimc      = $datosimc['resultado'];
		$Prueba        = R::findOne( 'sgconsejos', ' id_tipo_prueba = ?  and Resultado = ?', [$id_pruebaimc,$resulimc] );
		$consejoimc    = $Prueba['consejo'];
		// Resuiltados de IMM.
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Imm' ] );
		$id_prueba     = $Prueba->id;
		$resultadoImm  = $consultar->_ConsultarResultadosPruebasIMM($id_prueba,$cliente);
		$cantidadimm   = count($resultadoImm);
		$exitoimm      = ($cantidadimm>0)?1:0;

		//Resultados de los consejos.
		

		//Verificando la cantidad de resultados para autocompletar.
		if($cantidadpeso<3)
		{
			for($i=0; $i<=$cantidadpeso; $i++)
			{
				$datopeso = array("desc_prueba"=>0,"fh_creacion"=>0,"id"=>0,"id_cliente"=>$cliente,
								  "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								  "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($resultadoPeso,$datopeso);
			}//for
		}//if

		if($cantidadimc<3)
		{
			for($i=0; $i<=$cantidadimm; $i++)
			{
				$datopeso = array("desc_prueba"=>0,"fh_creacion"=>0,"id"=>0,"id_cliente"=>$cliente,
								  "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								  "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($resultadoImc,$datopeso);
			}//for
		}//if

		// Verificando la cantidad de reusltados de IMM
		// se debe agrupar por fechas.
		$immActuales   = array();
		$immAnteriores = array();

		if($cantidadimm<12)
		{
			$immActuales = $resultadoImm;

			//Haciendo un ciclo para insertar los datos falsos.
			for($i=0; $i<6; $i++)
			{
				$datoimm = array("desc_prueba"=>0,"fh_creacion"=>0,"id"=>0,"id_cliente"=>0,
								 "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								 "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($immAnteriores,$datoimm);
			}//for


		}//if
		else
		{
			// Si entra aquí es por que tiene resultads viejos.
			$fechaprueba = $resultadoImm[0]['fh_creacion'];
			for($i=0; $i<12; $i++)
			{
				$fechaimm = $resultadoImm[$i]['fh_creacion'];
				if($fechaprueba==$fechaimm)
				{
					array_push($immActuales,$resultadoImm[$i]);
				}else{array_push($immAnteriores,$resultadoImm[$i]);}
			}//for
		}//else

		//Devolviendo los datos
		$datos =  array("exitoPeso"=>$exitopeso,"exitoimc"=>$exitoimc,"exitoimm"=>$exitoimm,
						"peso"=>$resultadoPeso,"imc"=>$resultadoImc,"imm"=>$immActuales,
						"immAnt"=>$immAnteriores,"consejoPeso"=>$consejoPeso,"consejoimc"=>$consejoimc);
		return $datos;
	}//ResultadosBiotest

	function UltimoBiotestCliente($Parametros)	
	{
		$cliente   = $Parametros['id'];
		$prueba    = $Parametros['Prueba'];
		$consultar = new Consultar();
		//Tomando el id del tipo prueba
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [$prueba] );
		$id_prueba     = $Prueba->id;

		//Verificando el biotest light y el biotest ultra.
		$bioresult  = $consultar->_ConsultarUltimoBiotestPruebaLight($cliente,$id_prueba);
		$fecha      = $bioresult['Ultimo_Biotest'];
		$permiso    = 0;
		$PermisoU   = 0;
		$Dias_trans = 0;
		$Dias_transUl = 0;
		$dias_limit = 15;
		// Evaluando el biotest light
		if($prueba=="Peso")
		{
			if ($fecha !="")
			{
				date_default_timezone_set("America/Chihuahua");
				$Fecha_Actual  = date("Y-m-d"); //fecha del día de hoy.
				//Si trae una fecha se verifica cuantos días han transcurrido.
				$fechas		   = explode(" ",$fecha);
				$fechaSinHoras = $fechas[0];
				$Utilidades	   = new Utilidades();
				$resdias       = $Utilidades->udate($Fecha_Actual,$fechaSinHoras);
				$Dias_trans    = ($resdias['Dias_Transcurridos']!="")?$resdias['Dias_Transcurridos']:0;
				$permiso       = ($Dias_trans >=15)?1:0; //Silas fechas osn idénticas, no hay permiso
				
			}//if
			else
			{
				$permiso = 1; 
			}//else
		}//if $prueba=="Peso"
		else{$permiso=1;}

		// Evaluando el biotest ultra
		$biotestUltra = $consultar->_ConsultarUltimoBiotestPrueba($cliente,$id_prueba);
		$fechaUltra   = $biotestUltra['Ultimo_Biotest'];

		if ($fechaUltra !="")
		{
			date_default_timezone_set("America/Chihuahua");
			$Fecha_Actual  = date("Y-m-d"); //fecha del día de hoy.
			//Si trae una fecha se verifica cuantos días han transcurrido.
			$fechas		   = explode(" ",$fechaUltra);
			$fechaSinHoras = $fechas[0];
			$Utilidades	   = new Utilidades();
			$resdias       = $Utilidades->udate($Fecha_Actual,$fechaSinHoras);
			$Dias_transUl  = ($resdias['Dias_Transcurridos']!="")?$resdias['Dias_Transcurridos']:0;
			$PermisoU      = ($Dias_transUl >=15)?1:0; //Silas fechas osn idénticas, no hay permiso
			
		}//if
		else
		{
			$PermisoU = 1; 
		}//else

		$datos = array("permiso"=>$permiso,"PermisoU"=>$PermisoU,
					   "Dias_trans"=>$Dias_trans,"Dias_transUl"=>$Dias_transUl,
					   "dias_limit"=>$dias_limit);
		return $datos;
	}//UltimoBiotestCliente

	function ResultadosPeso($Parametros)
	{
		$cliente       = $Parametros['id'];
		$consultar     = new Consultar();
		//Se deben buscar los resultados de toda slas pruebas.
		// Resuiltados de peso.
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Peso' ] );
		$id_prueba     = $Prueba->id;
		$resultadoPeso = $consultar->_ConsultarResultadosPruebaslight($id_prueba,$cliente);
		$cantidadpeso  = count($resultadoPeso);
		$exitopeso     = ($cantidadpeso>0)?1:0;
		$datospeso     = $consultar->_ConsultarResultadoPruebaCliente($cliente,$id_prueba);
		$resultpeso    = $datospeso['resultado'];
		$Prueba        = R::findOne( 'sgconsejos', ' id_tipo_prueba = ?  and Resultado = ?', [$id_prueba,$resultpeso] );
		$consejoPeso   = $Prueba['consejo'];
		// Resuiltados de IMC.
		$Prueba        = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Imc' ] );
		$id_pruebaimc  = $Prueba->id;
		$resultadoImc  = $consultar->_ConsultarResultadosPruebaslight($id_pruebaimc,$cliente);
		$cantidadimc   = count($resultadoImc);
		$exitoimc      = ($cantidadimc>0)?1:0;
		$datosimc      = $consultar->_ConsultarResultadoPruebaCliente($cliente,$id_pruebaimc);
		$resulimc      = $datosimc['resultado'];
		$Prueba        = R::findOne( 'sgconsejos', ' id_tipo_prueba = ?  and Resultado = ?', [$id_pruebaimc,$resulimc] );
		$consejoimc    = $Prueba['consejo'];

		//Verificando la cantidad de resultados para autocompletar.
		if($cantidadpeso<3)
		{
			for($i=0; $i<=$cantidadpeso; $i++)
			{
				$datopeso = array("desc_prueba"=>0,"fh_creacion"=>0,"id"=>0,"id_cliente"=>$cliente,
								  "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								  "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($resultadoPeso,$datopeso);
			}//for
		}//if

		if($cantidadimc<3)
		{
			for($i=0; $i<=$cantidadimc; $i++)
			{
				$datopeso = array("desc_prueba"=>0,"fh_creacion"=>0,"id"=>0,"id_cliente"=>$cliente,
								  "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								  "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($resultadoImc,$datopeso);
			}//for
		}//if
		//Devolviendo los datos
		$datos =  array("exitoPeso"=>$exitopeso,"exitoimc"=>$exitoimc,"peso"=>$resultadoPeso,
						"imc"=>$resultadoImc,"consejoPeso"=>$consejoPeso,"consejoimc"=>$consejoimc);
		return $datos;
	}//ResultadosPeso


	function EnviarResultados($Parametros)
	{
		$cliente = $Parametros['id'];
		
	}//ResultadosBiotest

	function IMCResultado ($peso,$altura)
	{
		//Sacando el índice de masa corporal
		$alturaMetros   = $altura/100; //convirtiéndo la altura en metros
		$alturaCuadrada = $alturaMetros*$alturaMetros;
		$imc			= number_format($peso/$alturaCuadrada,2); //Dejando el númnero con solo 2 decimales	
		$Diagnostico	= DiagnosticoAcordeResultadoIMC($imc);
		return $Diagnostico;
	}//IMCResultado

	function IMCOperacion($peso,$altura)
	{
		$alturaMetros   = $altura/100; //convirtiéndo la altura en metros
		$alturaCuadrada = $alturaMetros*$alturaMetros;
		$imc			= number_format($peso/$alturaCuadrada,2); //Dejando el númnero con solo 2 decimales	
		return $imc;
	}//IMCOperacion

	function IMCEvaluar($peso,$altura,$cliente,$fh_creacion,$id_inst)
	{
		$imc 				 = IMCOperacion($peso,$altura);
		$Diagnostico	     = DiagnosticoAcordeResultadoIMC($imc);
		$porcentajeResultado = "";
		$consultar        	 = new Consultar();
		$resultadoPruebas 	 = "";

		//Verificando si está dentro del rango 
		if($Diagnostico != "Fuera de rango")
		{
			//Tomar la fecha de hoy
			$porcentaje  = PorcentajeAcordeResultadoPeso($Diagnostico);

			//Guardando el resultado.
			$Prueba      = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Imc' ] );
			$id_prueba   = $Prueba->id;
			$desc_prueba = "IMC";
			$respuesta   = GuardarResultadoPruebas($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$imc);
			$respuesta   = GuardarResultadoPruebasLight($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$imc);

			//Tomando los resultados del cliente de esa prueba.
			$resultadoPruebas=$consultar->_ConsultarResultadosPruebaslight($id_prueba,$cliente);
			
		}//else
		$datosimc    = array("resultado_numerico"=>$imc,"Diagnostico"=>$Diagnostico,"resultados"=>$resultadoPruebas);
		return $datosimc;
	}//IMC

	function EvaluarPeso($peso,$altura,$cliente,$fh_creacion,$id_inst)
	{
		$Diagnostico = RangoDePesoPorAltura($altura, $peso);
		$porcentaje  = "";
		$consultar   = new Consultar();

		//haciendo la verificación de errores
		if($Diagnostico!="Fuera de rango")
		{
			$porcentaje  = PorcentajeAcordeResultadoPeso($Diagnostico);	
			$Prueba      = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [ 'Peso' ] );
			$id_prueba   = $Prueba->id;
			$desc_prueba = "Peso";
			$respuesta   = GuardarResultadoPruebas($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$peso);
			$respuesta2  = GuardarResultadoPruebasLight($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$peso);

			//Tomando los resultados del cliente de esa prueba.
			$resultadoPruebas=$consultar->_ConsultarResultadosPruebaslight($id_prueba,$cliente);
		}//else
		$datosimc    = array("resultado_numerico"=>$peso,"Diagnostico"=>$Diagnostico,"resultados"=>$resultadoPruebas);
		return $datosimc;
	}//Peso

	function GuardarResultadoPruebas($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$imc)
	{
		$pruebastore 					 = R::dispense("sgpruebas");
		$pruebastore->id_instructor      = $id_inst;
		$pruebastore->id_cliente         = $cliente;
		$pruebastore->tipo_prueba        = $id_prueba;
		$pruebastore->desc_prueba        = $desc_prueba;
		$pruebastore->resultado_numerico = $imc;
		$pruebastore->resultado          = $Diagnostico;
		$pruebastore->porcentaje         = $porcentaje;
		$pruebastore->fecha  		     = $fh_creacion;
		$respuesta = EjecutarTransaccion($pruebastore);
		return $respuesta;
	}//GuardarResultadoPruebas

	function GuardarResultadoPruebasLight($id_inst,$cliente,$id_prueba,$desc_prueba,$Diagnostico,$porcentaje,$fh_creacion,$imc)
	{
		$pruebastore 					 = R::dispense("sgpruebaslight");
		$pruebastore->id_instructor      = $id_inst;
		$pruebastore->id_cliente         = $cliente;
		$pruebastore->tipo_prueba        = $id_prueba;
		$pruebastore->desc_prueba        = $desc_prueba;
		$pruebastore->resultado_numerico = $imc;
		$pruebastore->resultado          = $Diagnostico;
		$pruebastore->porcentaje         = $porcentaje;
		$pruebastore->fh_creacion        = $fh_creacion;
		$respuesta = EjecutarTransaccion($pruebastore);
		return $respuesta;
	}//GuardarResultadoPruebas

	function EjecutarTransaccion($objeto)
	{
		R::freeze(1);
		R::begin();
		    try{
		       $respuesta = R::store($objeto);
		        R::commit();
		    }
		    catch(Exception $e) {
		       $respuesta =  R::rollback();
		       $respuesta = "Error";
		    }
		R::close();
		return $respuesta;
	}//EjecutarTransacción

	function CondicionFisica($Parametros)
	{
		// Tomando los datos
		$id_cliente = $Parametros['Cliente'];
		$Resultado  = $Parametros['Resultado'];

		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();
		$result	    = $consultar->_ConsultarClientesPorId($id_cliente);	
		//tomando sexo y edad
		$edad	    = $result['num_edad'];
		$sexo	    = $result['de_genero'];
		$DescPrueba = "Condicion Física";
		$Condicion  = "";
		$exito      = 0;
		$desc_prueba = "Condicion Física";
		// tomando los datos de la prueba
		$Prueba      = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [$desc_prueba] );
		$id_prueba   = $Prueba->id;
		$res_prueba  = "";
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];

		if($sexo=="MASCULINO")	
		{
			$Condicion = EvaluacionMasculinaCondicionFisica($edad,$Resultado); //resultado de la prueba
			//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			if($Condicion=="Fuera de rango")
			{
				
			}
			else
			{	
				
				// Agregando los datos
				$porcentaje = PorcentajeAcordeResultado($Condicion);
				$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$desc_prueba,$Condicion,$porcentaje,$fh_creacion,$Resultado);
				$exito      = (is_numeric($res_prueba))?1:0;
			}
		}//if
		else
		{
			$Condicion = EvaluacionFemeninaCondicionFisica($edad,$ResultadoEvaluado); //resultado de la prueba
			//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			if($Condicion=="Fuera de rango")
			{
				
			}

			else
			{
				// Agregando los datos
				$porcentaje = PorcentajeAcordeResultado($Condicion);
				$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$desc_prueba,$Condicion,$porcentaje,$fh_creacion,$Resultado);
				$exito      = (is_numeric($res_prueba))?1:0;
			}
			
		}
		
		$datos = array("exito"=>$exito,"res_prueba"=>$res_prueba);
		return $datos;
	}//CondicionFisica

	function ObtenerIdPrueba($prueba)
	{
		$Prueba      = R::findOne( 'sgtipospruebas', ' nm_prueba = ? ', [$prueba] );
		$id_prueba   = $Prueba->id;
		return $id_prueba;
	}//ObtenerIdPrueba

	function Resultados($Parametros)
	{
		$nb_prueba = $Parametros['prueba'];
		$cliente   = $Parametros['cliente'];
		//Tomando el id de la prueba
		$prueba    = R::findOne("sgtipospruebas","nm_prueba=?",[$nb_prueba]);
		$id_prueba = $prueba->id;

		//Buscando los resultados del cliente
		$consultar  = new Consultar();
		$resultados = $consultar->_ConsultarResultadosPruebas($id_prueba,$cliente);
		$cantidad   = count($resultados);
		$exito      = ($cantidad>0)?1:0;
		$cantidadTo = 3-$cantidad;

		// Obteniendo el consejo


		if($cantidadTo<3)
		{
			for($i=0; $i<$cantidadTo; $i++)
			{
				$dato = array("desc_prueba"=>0,"fecha"=>0,"id"=>0,"id_cliente"=>$cliente,
								  "id_instructor"=>0,"porcentaje"=>0,"resultado"=>0,
								  "resultado_numerico"=>0,"tipo_prueba"=>0);
				array_push($resultados,$dato);
			}//for
		}//if

		// Obteniendo el consejo.
		$resporcen = ResultadoAcordePorcentaje($resultados[0]['porcentaje']);
		$datoscons = $consultar->_ConsultarConsejoAcordeResultado($id_prueba,$resporcen);
		$consejo   = $datoscons['consejo'];

		$datos = array("exito"=>$exito,"resultados"=>$resultados,"consejo"=>$consejo);
		return $datos;
	}//Resultados

	function ResultadoAcordePorcentaje($porcentaje)
	{
		$resultado = 0;
		switch($resultado)	
		{
			case 100: $resultado = 'Atleta'; break;
			case 80:  $resultado = 'Excelente';  break;
			case 60:  $resultado = 'Bueno';  break;
			case 40:  $resultado = 'Promedio';  break;
			case 20:  $resultado = 'Pobre' ;  break;
		}//switch
		
		return $resultado;
	}//ResultadoAcordePorcentaje

	function Fuerza($Parametros)
	{
		// Tomando los datos
		$id_cliente   = $Parametros['Cliente'];
		$repeticiones = $Parametros['repeticiones'];

		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();
		$result	    = $consultar->_ConsultarClientesPorId($id_cliente);	
		//tomando sexo y edad
		$edad	    = $result['num_edad'];
		$sexo	    = $result['de_genero'];
		$DescPrueba = "Fuerza";

		// tomando los datos de la prueba
		$id_prueba   = ObtenerIdPrueba("Fuerza");
		$res_prueba  = "";
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];

		if($sexo=="MASCULINO")	
		{
			$Condicion  = EvaluacionMasculinaFuerza($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultadoFuerza($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}//if
		else
		{
			$Condicion  = EvaluacionFemeninaFuerza($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultadoFuerza($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}
		
		$datos = array("exito"=>$exito);
		return $datos;
	}//Fuerza

	function EvaluacionFuerza($id_instructor,$id_Cliente,$Condicion,$repeticiones)
	{
		$agregar   = new Agregar();
		$consultar = new Consultar();
		//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			
			//Tomando los valores para guardar el resultado de la prueba en la BD
			$TipoPrueba		  = 6;
			$DescPrueba		  = "Fuerza";
			$porcentajeActual = PorcentajeAcordeResultadoFuerza($Condicion);
			//Guardando los resultados de la prueba
			$resultado = $agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Condicion, $porcentajeActual,$repeticiones);
			
			//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
			$resultadoPruebas = $consultar->_ConsultarResultadosPruebas(6,$id_Cliente);
			
			//Creando un array con los resultados de las pruebas
			$arrayResultados = array();
			
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba="Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha=($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje = ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado  = $fila['Resultado'];
				$Prueba		= array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}
			//print_r($arrayResultados);
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(6,$Condicion); //El número es el tipo de prueba
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			//DEvolviendo parámetros para la notificación				
			$salidaJson	   = array("Condicion"=>$Condicion, "Resultado"=>$repeticiones, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo, "Porcentaje"=>$porcentajeActual);
			return $salidaJson;	
	}//AgregarResultadosYDevolverInformacionFuerza

	function EvaluacionMasculinaFuerza($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=29:
				
						if($res=="" && $resultado>54) 					   $res="Atleta";
						if($res=="" && $resultado>=45 && $resultado<=54)   $res="Excelente";	
						if($res=="" && $resultado>=35 && $resultado<=44)   $res="Bueno";	
						if($res=="" && $resultado>=20 && $resultado<=34)   $res="Promedio";
						if($res=="" && $resultado<20)					   $res="Pobre";
				break;
				
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>44)							$res="Atleta";
					if($res=="" && $resultado>=35 && $resultado<=44)		$res="Excelente";
					if($res=="" && $resultado>=24 && $resultado<=34)		$res="Bueno";
					if($res=="" && $resultado>=15 && $resultado<=24)		$res="Promedio";
					if($res=="" && $resultado<15)							$res="Pobre";
				break;
					
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>39)							$res="Atleta";
					if($res=="" && $resultado>=30 && $resultado<=39)		$res="Excelente";
					if($res=="" && $resultado>=20 && $resultado<=29)		$res="Bueno";
					if($res=="" && $resultado>=12 && $resultado<=19)		$res="Promedio";
					if($res=="" && $resultado<12)							$res="Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>34)							$res="Atleta";
					if($res=="" && $resultado>=25 && $resultado<=34)		$res="Excelente";
					if($res=="" && $resultado>=15 && $resultado<=24)		$res="Bueno";
					if($res=="" && $resultado>=8 && $resultado<=14)			$res="Promedio";
					if($res=="" && $resultado<8)							$res="Pobre";
				break;
				
				case $edad >=60:
					if($res=="" && $resultado>29)							$res="Atleta";
					if($res=="" && $resultado>=20 && $resultado<=29)		$res="Excelente";
					if($res=="" && $resultado>=10 && $resultado<=19)		$res="Bueno";
					if($res=="" && $resultado>=5 && $resultado<=9)			$res="Promedio";
					if($res=="" && $resultado<5)							$res="Pobre";
				break;
				
			}//switch
			$condicion=$res;
			return $condicion;
	}//EvaluacionMasculinaFuerza
	
	function EvaluacionFemeninaFuerza($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=29:
				
						if($res=="" && $resultado>48) 					   $res="Atleta";
						if($res=="" && $resultado>=34 && $resultado<=48)   $res="Excelente";	
						if($res=="" && $resultado>=17 && $resultado<=33)   $res="Bueno";	
						if($res=="" && $resultado>=6  && $resultado<=16)   $res="Promedio";
						if($res=="" && $resultado<6)					   $res="Pobre";
				break;
				
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>39)						   $res="Atleta";
					if($res=="" && $resultado>=25 && $resultado<=39)	   $res="Excelente";
					if($res=="" && $resultado>=12 && $resultado<=24)	   $res="Bueno";
					if($res=="" && $resultado>=4 && $resultado<=11)		   $res="Promedio";
					if($res=="" && $resultado<4)						   $res="Pobre";
				break;
					
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>34)						   $res="Atleta";
					if($res=="" && $resultado>=20 && $resultado<=34)	   $res="Excelente";
					if($res=="" && $resultado>=8 && $resultado<=19)		   $res="Bueno";
					if($res=="" && $resultado>=3 && $resultado<=7)		   $res="Promedio";
					if($res=="" && $resultado<3)						   $res="Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>29)						   $res="Atleta";
					if($res=="" && $resultado>=15 && $resultado<=29)	   $res="Excelente";
					if($res=="" && $resultado>=6  && $resultado<=14)	   $res="Bueno";
					if($res=="" && $resultado>=2  && $resultado<=5)		   $res="Promedio";
					if($res=="" && $resultado<2)						   $res="Pobre";
				break;
				
				case $edad >=60:
					if($res=="" && $resultado>19)						   $res="Atleta";
					if($res=="" && $resultado>=5 && $resultado<=19)		   $res="Excelente";
					if($res=="" && $resultado>=3 && $resultado<=4)		   $res="Bueno";
					if($res=="" && $resultado>=1 && $resultado<=2)		   $res="Promedio";
					if($res=="" && $resultado<1)						   $res="Pobre";
				break;
				
			}//switch
			$condicion = $res;
			return $condicion;
	}//EvaluacionMasculinaStamina

	///Funciones de Stamina////
	function Stamina($Parametros)
	{
		// Tomando los datos
		$id_cliente   = $Parametros['Cliente'];
		$repeticiones = $Parametros['repeticiones'];
		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();
		$result	    = $consultar->_ConsultarClientesPorId($id_cliente);	
		//tomando sexo y edad
		$edad	    = $result['num_edad'];
		$sexo	    = $result['de_genero'];
		$DescPrueba = "Stamina";

		// tomando los datos de la prueba
		$id_prueba   = ObtenerIdPrueba("Stamina");
		$res_prueba  = "";
		date_default_timezone_set("America/Chihuahua");
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];
		
		if($sexo=="MASCULINO")	
		{
			$Condicion  = EvaluacionMasculinaStamina($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}//if
		else
		{
			$Condicion = EvaluacionFemeninaStamina($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}
		$datos = array("exito"=>$exito);
		return $datos;
	}//Stamina
	
	function EvaluacionMasculinaStamina($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=25:
				
						if($res=="" && $resultado<79) 					   $res="Atleta";
						if($res=="" && $resultado>=79 && $resultado<=89)   $res="Excelente";	
						if($res=="" && $resultado>=90 && $resultado<=105)  $res="Bueno";	
						if($res=="" && $resultado>=106 && $resultado<=128) $res="Promedio";
						if($res=="" && $resultado>128)					   $res="Pobre";
				break;
				
				case $edad >=26 && $edad<=35:
					if($res=="" && $resultado<81)						   $res = "Atleta";
					if($res=="" && $resultado>=81 && $resultado<=89)	   $res = "Excelente";
					if($res=="" && $resultado>=90 && $resultado<=107)	   $res = "Bueno";
					if($res=="" && $resultado>=108 && $resultado<=128)	   $res = "Promedio";
					if($res=="" && $resultado>128)						   $res = "Pobre";
				break;
					
				case $edad >=36 && $edad<=45:
					if($res=="" && $resultado<83)$res="Atleta";
					if($res=="" && $resultado>=83 && $resultado<=96)$res="Excelente";
					if($res=="" && $resultado>=97 && $resultado<=112)$res="Bueno";
					if($res=="" && $resultado>=113 && $resultado<=130)$res="Promedio";
					if($res=="" && $resultado>130)$res="Pobre";
				break;
				
				case $edad >=46 && $edad<=55:
					if($res=="" && $resultado<87)$res="Atleta";
					if($res=="" && $resultado>=87 && $resultado<=97)$res="Excelente";
					if($res=="" && $resultado>=98 && $resultado<=116)$res="Bueno";
					if($res=="" && $resultado>=117 && $resultado<=132)$res="Promedio";
					if($res=="" && $resultado>132)$res="Pobre";
				break;
				
				case $edad >=56 && $edad<=65:
					if($res=="" && $resultado<86)$res="Atleta";
					if($res=="" && $resultado>=86 && $resultado<=97)$res="Excelente";
					if($res=="" && $resultado>=98 && $resultado<=112)$res="Bueno";
					if($res=="" && $resultado>=113 && $resultado<=129)$res="Promedio";
					if($res=="" && $resultado>129)$res="Pobre";
				break;
				
				case $edad >65:
					if($res=="" && $resultado<88)$res="Atleta";
					if($res=="" && $resultado>=88 && $resultado<=96)$res="Excelente";
					if($res=="" && $resultado>=97 && $resultado<=113)$res="Bueno";
					if($res=="" && $resultado>=114 && $resultado<=130)$res="Promedio";
					if($res=="" && $resultado>130)$res="Pobre";
				break;
				
			}//switch
			$condicion=$res;
			return $condicion;
	}//EvaluacionMasculinaStamina
	
	function EvaluacionFemeninaStamina($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=25:
				
						if($res=="" && $resultado<85) 					    $res = "Atleta";
						if($res=="" && $resultado>=85  && $resultado<=98)   $res = "Excelente";	
						if($res=="" && $resultado>=99  && $resultado<=117)  $res = "Bueno";	
						if($res=="" && $resultado>=118 && $resultado<=140)  $res = "Promedio";
						if($res=="" && $resultado>140)					    $res = "Pobre";
				break;
				
				case $edad >=26 && $edad<=35:
					if($res=="" && $resultado<88)							$res = "Atleta";
					if($res=="" && $resultado>=88 && $resultado<=99)		$res = "Excelente";
					if($res=="" && $resultado>=100 && $resultado<=119)		$res = "Bueno";
					if($res=="" && $resultado>=120 && $resultado<=138)		$res = "Promedio";
					if($res=="" && $resultado>138)							$res = "Pobre";
				break;
					
				case $edad >=36 && $edad<=45:
					if($res=="" && $resultado<90)							$res = "Atleta";
					if($res=="" && $resultado>=90 && $resultado<=102)		$res = "Excelente";
					if($res=="" && $resultado>=103 && $resultado<=118)		$res = "Bueno";
					if($res=="" && $resultado>=119 && $resultado<=140)		$res = "Promedio";
					if($res=="" && $resultado>140)							$res = "Pobre";
				break;
				
				case $edad >=46 && $edad<=55:
					if($res=="" && $resultado<94)							$res = "Atleta";
					if($res=="" && $resultado>=94 && $resultado<=104)		$res = "Excelente";
					if($res=="" && $resultado>=105 && $resultado<=120)		$res = "Bueno";
					if($res=="" && $resultado>=121 && $resultado<=135)		$res = "Promedio";
					if($res=="" && $resultado>135)							$res = "Pobre";
				break;
				
				case $edad >=56 && $edad<=65:
					if($res=="" && $resultado<95)							$res = "Atleta";
					if($res=="" && $resultado>=95 && $resultado<=104)		$res = "Excelente";
					if($res=="" && $resultado>=105 && $resultado<=118)		$res = "Bueno";
					if($res=="" && $resultado>=119 && $resultado<=139)		$res = "Promedio";
					if($res=="" && $resultado>139)							$res = "Pobre";
				break;
				
				case $edad >65:
					if($res=="" && $resultado<90)							$res = "Atleta";
					if($res=="" && $resultado>=90 && $resultado<=102)		$res = "Excelente";
					if($res=="" && $resultado>=103 && $resultado<=122)		$res = "Bueno";
					if($res=="" && $resultado>=123 && $resultado<=134)		$res = "Promedio";
					if($res=="" && $resultado>134)							$res = "Pobre";
				break;
				
			}//switch
			$condicion = $res;
			return $condicion;
	}//EvaluacionMasculinaStamina

	//Apartado de Resistencia//	
	function Resistencia($Parametros)
	{
		// Tomando los datos
		$id_cliente   = $Parametros['Cliente'];
		$repeticiones = $Parametros['repeticiones'];
		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();
		$result	    = $consultar->_ConsultarClientesPorId($id_cliente);	
		//tomando sexo y edad
		$edad	    = $result['num_edad'];
		$sexo	    = $result['de_genero'];
		$DescPrueba = "Resistencia";

		// tomando los datos de la prueba
		$id_prueba   = ObtenerIdPrueba("Resistencia");
		$res_prueba  = "";
		date_default_timezone_set("America/Chihuahua");
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];

		if($sexo=="MASCULINO")	
		{
			$Condicion  = EvaluacionMasculinaResistencia($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}//if
		else
		{
			$Condicion  = EvaluacionFemeninaResistencia($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}
		$datos = array("exito"=>$exito);
		return $datos;
	}//Resistencia
	
	function  EvaluacionMasculinaResistencia($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=15 && $edad<=19:
						if($res=="" && $resultado>=25) 					   $res="Atleta";
						if($res=="" && $resultado>=23 && $resultado<=24)   $res="Excelente";	
						if($res=="" && $resultado>=21 && $resultado<=22)   $res="Bueno";	
						if($res=="" && $resultado>=16 && $resultado<=20)   $res="Promedio";
						if($res=="" && $resultado<16)					   $res="Pobre";
				break;
				
				case $edad >=20 && $edad<=29:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=23 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=21 && $resultado<=22)   $res="Bueno";	
					if($res=="" && $resultado>=13 && $resultado<=20)   $res="Promedio";
					if($res=="" && $resultado<13)					   $res="Pobre";
				break;
					
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=23 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=21 && $resultado<=22)   $res="Bueno";	
					if($res=="" && $resultado>=13 && $resultado<=20)   $res="Promedio";
					if($res=="" && $resultado<13)					   $res="Pobre";

				break;
				
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=22 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=16 && $resultado<=21)   $res="Bueno";	
					if($res=="" && $resultado>=11 && $resultado<=15)   $res="Promedio";
					if($res=="" && $resultado<11)					   $res="Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=20 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=14 && $resultado<=19)   $res="Bueno";	
					if($res=="" && $resultado>=9  && $resultado<=13)   $res="Promedio";
					if($res=="" && $resultado<9)					   $res="Pobre";
				break;
				
				case $edad >=60 && $edad<=69:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=16 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=10 && $resultado<=15)   $res="Bueno";	
					if($res=="" && $resultado>=4  && $resultado<=9)    $res="Promedio";
					if($res=="" && $resultado<4)					   $res="Pobre";
				break;
				
			}//switch
			$condicion=$res;
			return $condicion;
	}// evaluación masculina resistencia
	
	function  EvaluacionFemeninaResistencia($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=15 && $edad<=19:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=23 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=21 && $resultado<=22)   $res="Bueno";	
					if($res=="" && $resultado>=16 && $resultado<=20)   $res="Promedio";
					if($res=="" && $resultado<16)					   $res="Pobre";
				break;
				
				case $edad >=20 && $edad<=29:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=23 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=19 && $resultado<=22)   $res="Bueno";	
					if($res=="" && $resultado>=13 && $resultado<=18)   $res="Promedio";
					if($res=="" && $resultado<13)					   $res="Pobre";
				break;
					
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=22 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=16 && $resultado<=21)   $res="Bueno";	
					if($res=="" && $resultado>=11 && $resultado<=15)   $res="Promedio";
					if($res=="" && $resultado<11)					   $res="Pobre";

				break;
				
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=21 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=13 && $resultado<=20)   $res="Bueno";	
					if($res=="" && $resultado>=6  && $resultado<=12)   $res="Promedio";
					if($res=="" && $resultado<6)					   $res="Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>=25) 					   $res="Atleta";
					if($res=="" && $resultado>=16 && $resultado<=24)   $res="Excelente";	
					if($res=="" && $resultado>=9  && $resultado<=15)   $res="Bueno";	
					if($res=="" && $resultado>=4  && $resultado<=8)    $res="Promedio";
					if($res=="" && $resultado<4)					   $res="Pobre";
				break;
				
				case $edad >=60 && $edad<=69:
					if($res=="" && $resultado>=18) 					   $res="Atleta";
					if($res=="" && $resultado>=11 && $resultado<=17)   $res="Excelente";	
					if($res=="" && $resultado>=6  && $resultado<=10)   $res="Bueno";	
					if($res=="" && $resultado>=2  && $resultado<=5)    $res="Promedio";
					if($res=="" && $resultado<2)					   $res="Pobre";
				break;
				
			}//switch
			$condicion=$res;
			return $condicion;
	}// evaluación masculina resistencia

	//Flexibilidad//
	function Flexibilidad($Parametros)
	{
		$id_cliente   = $Parametros['Cliente'];
		$repeticiones = $Parametros['repeticiones'];
		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();
		$result	    = $consultar->_ConsultarClientesPorId($id_cliente);	
		//tomando sexo y edad
		$edad	    = $result['num_edad'];
		$sexo	    = $result['de_genero'];
		$DescPrueba = "Flexibilidad";

		// tomando los datos de la prueba
		$id_prueba   = ObtenerIdPrueba("Flexibilidad");
		$res_prueba  = "";
		date_default_timezone_set("America/Chihuahua");
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];

		if($sexo=="MASCULINO")	
		{
			$Condicion  = EvaluacionMasculinaFlexibilidad($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}//if
		else
		{
			$Condicion = EvaluacionFemeninaFlexibilidad($edad,$repeticiones); //resultado de la prueba
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			$res_prueba = GuardarResultadoPruebas($id_inst,$id_cliente,$id_prueba,$DescPrueba,$Condicion,$porcentaje,$fh_creacion,$repeticiones);
			$exito      = (is_numeric($res_prueba))?1:0;
		}
		$datos = array("exito"=>$exito);
		return $datos;
	}//Flexibilidad
	
	function  EvaluacionMasculinaFlexibilidad($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=15 && $edad<=19:
					if($res=="" && $resultado>38) 					   $res = "Atleta";
					if($res=="" && $resultado>=34 && $resultado<=38)   $res = "Excelente";	
					if($res=="" && $resultado>=29 && $resultado<=33)   $res = "Bueno";	
					if($res=="" && $resultado>=24 && $resultado<=28)   $res = "Promedio";
					if($res=="" && $resultado<24)					   $res = "Pobre";
				break;
				
				case $edad >=20 && $edad<=29:
					if($res=="" && $resultado>39) 					   	   $res = "Atleta";
					if($res=="" && $resultado>=34 && $resultado<=39)   	   $res = "Excelente";	
					if($res=="" && $resultado>=30 && $resultado<=33)   	   $res = "Bueno";	
					if($res=="" && $resultado>=25 && $resultado<=29)   	   $res = "Promedio";
					if($res=="" && $resultado<25)					   	   $res = "Pobre";
				break;
					
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>37) 					   	   $res = "Atleta";
					if($res=="" && $resultado>=33 && $resultado<=37)       $res = "Excelente";	
					if($res=="" && $resultado>=28 && $resultado<=32)       $res = "Bueno";	
					if($res=="" && $resultado>=23 && $resultado<=27)       $res = "Promedio";
					if($res=="" && $resultado<23)					       $res = "Pobre";

				break;
				
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>34) 					       $res = "Atleta";
					if($res=="" && $resultado>=29 && $resultado<=34)       $res = "Excelente";	
					if($res=="" && $resultado>=24 && $resultado<=28)       $res = "Bueno";	
					if($res=="" && $resultado>=18 && $resultado<=23)       $res = "Promedio";
					if($res=="" && $resultado<18)					       $res = "Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>34) 					       $res = "Atleta";
					if($res=="" && $resultado>=28 && $resultado<=34)       $res = "Excelente";	
					if($res=="" && $resultado>=24  && $resultado<=27)      $res = "Bueno";	
					if($res=="" && $resultado>=16  && $resultado<=23)      $res = "Promedio";
					if($res=="" && $resultado<16)					       $res = "Pobre";
				break;
				
				case $edad >=60 && $edad<=69:
					if($res=="" && $resultado>32) 					       $res = "Atleta";
					if($res=="" && $resultado>=25 && $resultado<=32)       $res = "Excelente";	
					if($res=="" && $resultado>=20 && $resultado<=24)   	   $res = "Bueno";	
					if($res=="" && $resultado>=15 && $resultado<=19)       $res = "Promedio";
					if($res=="" && $resultado<15)					       $res = "Pobre";
				break;
				
			}//switch
			$condicion = $res;
			return $condicion;
	}// evaluación masculina resistencia
	
	function  EvaluacionFemeninaFlexibilidad($edad, $resultado)
	{
		$res="";
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=15 && $edad<=19:
					if($res=="" && $resultado>42) 					  $res = "Atleta";
					if($res=="" && $resultado>=38 && $resultado<=42)  $res = "Excelente";	
					if($res=="" && $resultado>=34 && $resultado<=37)  $res = "Bueno";	
					if($res=="" && $resultado>=29 && $resultado<=33)  $res = "Promedio";
					if($res=="" && $resultado<29)					  $res = "Pobre";
				break;
				
				case $edad >=20 && $edad<=29:
					if($res=="" && $resultado>40) 					  $res = "Atleta";
					if($res=="" && $resultado>=37 && $resultado<=40)  $res = "Excelente";	
					if($res=="" && $resultado>=33 && $resultado<=36)  $res = "Bueno";	
					if($res=="" && $resultado>=28 && $resultado<=32)  $res = "Promedio";
					if($res=="" && $resultado<28)					  $res = "Pobre";
				break;
					
				case $edad >=30 && $edad<=39:
					if($res=="" && $resultado>40) 					   $res="Atleta";
					if($res=="" && $resultado>=36 && $resultado<=40)   $res="Excelente";	
					if($res=="" && $resultado>=32 && $resultado<=35)   $res="Bueno";	
					if($res=="" && $resultado>=27 && $resultado<=31)   $res="Promedio";
					if($res=="" && $resultado<27)					   $res="Pobre";

				break;
				
				case $edad >=40 && $edad<=49:
					if($res=="" && $resultado>37) 					   $res="Atleta";
					if($res=="" && $resultado>=34 && $resultado<=37)   $res="Excelente";	
					if($res=="" && $resultado>=30 && $resultado<=33)   $res="Bueno";	
					if($res=="" && $resultado>=25 && $resultado<=29)   $res="Promedio";
					if($res=="" && $resultado<25)					   $res="Pobre";
				break;
				
				case $edad >=50 && $edad<=59:
					if($res=="" && $resultado>38) 					   $res="Atleta";
					if($res=="" && $resultado>=33  && $resultado<=36)   $res="Excelente";	
					if($res=="" && $resultado>=30  && $resultado<=32)   $res="Bueno";	
					if($res=="" && $resultado>=25  && $resultado<=29)   $res="Promedio";
					if($res=="" && $resultado<25)					   $res="Pobre";
				break;
				
				case $edad >=60 && $edad<=69:
					if($res=="" && $resultado>34) 					   $res="Atleta";
					if($res=="" && $resultado>=31 && $resultado<=34)   $res="Excelente";	
					if($res=="" && $resultado>=27 && $resultado<=30)   $res="Bueno";	
					if($res=="" && $resultado>=23 && $resultado<=26)    $res="Promedio";
					if($res=="" && $resultado<23)					   $res="Pobre";
				break;
				
			}//switch
			$condicion=$res;
			return $condicion;
	}// evaluación masculina resistencia

	function IMM($Parametros)
	{
		$id_cliente   = $Parametros['Cliente'];
		$repeticiones = $Parametros['repeticiones'];
		$espalda 	  = $Parametros['espalda'];
		$pecho   	  = $Parametros['pecho'];
		$abdomen 	  = $Parametros['abdomen'];
		$cadera  	  = $Parametros['cadera'];
		$brazo   	  = $Parametros['brazo'];
		$muslo   	  = $Parametros['muslo'];
		
		//Tomando los datos del cliente
		//Buscando la información del cliente para hacer el test
		$consultar  = new Consultar();

		// tomando los datos de la prueba
		$id_prueba   = ObtenerIdPrueba("Imm");
		$res_prueba  = "";
		date_default_timezone_set("America/Chihuahua");
		$fh_creacion = date("Y-m-d"); //fecha del día de hoy
		$id_inst     = $_SESSION['usuario']['id'];	

	} //Imm

	//Funciones viejas
	/////Funciones de medida de peso //////
	
	function RangoDePesoPorAltura($altura, $peso)
	{
		if( $altura<140 || $altura>=200 || $peso<43)
		{
			 $resultado="Fuera de rango";
		}//if
		else {
		switch($altura)
		{
				case $altura>=140 && $altura<=142:
					if($peso<43)$resultado="Bajo de peso";
					if($peso>=43 && $peso<=53)$resultado="Peso Ideal";
					if($peso>=54 && $peso<=61)$resultado="Sobre Peso";
					if($peso>61)$resultado="Obesidad";
				break;
				
				case $altura>=143 && $altura<=144:
					if($peso<44)$resultado="Bajo de peso";
					if($peso>=44 && $peso<=54)$resultado="Peso Ideal";
					if($peso>=55 && $peso<=65)$resultado="Sobre Peso";
					if($peso>65)$resultado="Obesidad";
				break;
				
				case $altura>=145 && $altura<=146:
					if($peso<45)$resultado="Bajo de peso";
					if($peso>=45 && $peso<=55)$resultado="Peso Ideal";
					if($peso>=56 && $peso<=66)$resultado="Sobre Peso";
					if($peso>66)$resultado="Obesidad";
				break;
				
				case $altura>=147 && $altura<=148:
					if($peso<46)$resultado="Bajo de peso";
					if($peso>=46 && $peso<=56)$resultado="Peso Ideal";
					if($peso>=57 && $peso<=68)$resultado="Sobre Peso";
					if($peso>68)$resultado="Obesidad";
				break;
				
				case $altura>=149 && $altura<=150:
					if($peso<50)$resultado="Bajo de peso";
					if($peso>=50 && $peso<=60)$resultado="Peso Ideal";
					if($peso>=61 && $peso<=71)$resultado="Sobre Peso";
					if($peso>71)$resultado="Obesidad";
				break;
				
				case $altura>=151 && $altura<=152:
					if($peso<51)$resultado="Bajo de peso";
					if($peso>=51 && $peso<=61)$resultado="Peso Ideal";
					if($peso>=62 && $peso<=72)$resultado="Sobre Peso";
					if($peso>72)$resultado="Obesidad";
				break;
				
				case $altura>=153 && $altura<=154:
					if($peso<52)$resultado="Bajo de peso";
					if($peso>=52 && $peso<=62)$resultado="Peso Ideal";
					if($peso>=63 && $peso<=75)$resultado="Sobre Peso";
					if($peso>75)$resultado="Obesidad";
				break;
				
				case $altura>=155 && $altura<=156:
					if($peso<55)$resultado="Bajo de peso";
					if($peso>=55 && $peso<=65)$resultado="Peso Ideal";
					if($peso>=66 && $peso<=75)$resultado="Sobre Peso";
					if($peso>75)$resultado="Obesidad";
				break;
				
				case $altura>=157 && $altura<=158:
					if($peso<56)$resultado="Bajo de peso";
					if($peso>=56 && $peso<=66)$resultado="Peso Ideal";
					if($peso>=67 && $peso<=77)$resultado="Sobre Peso";
					if($peso>77)$resultado="Obesidad";
				break;
				
				case $altura>=159 && $altura<=160:
					if($peso<57)$resultado="Bajo de peso";
					if($peso>=57 && $peso<=70)$resultado="Peso Ideal";
					if($peso>=71 && $peso<=81)$resultado="Sobre Peso";
					if($peso>81)$resultado="Obesidad";
				break;
				
				case $altura>=161 && $altura<=162:
					if($peso<58)$resultado="Bajo de peso";
					if($peso>58 && $peso<=70)$resultado="Peso Ideal";
					if($peso>=71 && $peso<=81)$resultado="Sobre Peso";
					if($peso>81)$resultado="Obesidad";
				break;
				
				case $altura>=163 && $altura<=164:
					if($peso<59)$resultado="Bajo de peso";
					if($peso>=59 && $peso<=73)$resultado="Peso Ideal";
					if($peso>=74 && $peso<=81)$resultado="Sobre Peso";
					if($peso>81)$resultado="Obesidad";
				break;
				
				case $altura>=165 && $altura<=166:
					if($peso<60)$resultado="Bajo de peso";
					if($peso>=60 && $peso<=74)$resultado="Peso Ideal";
					if($peso>=75 && $peso<=86)$resultado="Sobre Peso";
					if($peso>86)$resultado="Obesidad";
				break;
				
				case $altura>=167 && $altura<=168:
					if($peso<62)$resultado="Bajo de peso";
					if($peso>=62 && $peso<=75)$resultado="Peso Ideal";
					if($peso>=76 && $peso<=88)$resultado="Sobre Peso";
					if($peso>88)$resultado="Obesidad";
				break;
				
				case $altura>=169 && $altura<=170:
					if($peso<65)$resultado="Bajo de peso";
					if($peso>=65 && $peso<=78)$resultado="Peso Ideal";
					if($peso>=79 && $peso<=91)$resultado="Sobre Peso";
					if($peso>91)$resultado="Obesidad";
				break;
				
				case $altura>=171 && $altura<=173:
					if($peso<66)$resultado="Bajo de peso";
					if($peso>=66 && $peso<=80)$resultado="Peso Ideal";
					if($peso>=81 && $peso<=94)$resultado="Sobre Peso";
					if($peso>94)$resultado="Obesidad";
				break;
				
				case $altura>=174 && $altura<=175:
					if($peso<67)$resultado="Bajo de peso";
					if($peso>=67 && $peso<=82)$resultado="Peso Ideal";
					if($peso>=83 && $peso<=96)$resultado="Sobre Peso";
					if($peso>96)$resultado="Obesidad";
				break;
				
				case $altura>=176 && $altura<=177:
					if($peso<68)$resultado="Bajo de peso";
					if($peso>=68 && $peso<=84)$resultado="Peso Ideal";
					if($peso>=85 && $peso<=100)$resultado="Sobre Peso";
					if($peso>100)$resultado="Obesidad";
				break;
				
				case $altura>=178 && $altura<=179:
					if($peso<70)$resultado="Bajo de peso";
					if($peso>=70 && $peso<=85)$resultado="Peso Ideal";
					if($peso>=86 && $peso<=101)$resultado="Sobre Peso";
					if($peso>101)$resultado="Obesidad";
				break;
				
				case $altura>=180 && $altura<=181:
					if($peso<71)$resultado="Bajo de peso";
					if($peso>=71 && $peso<=86)$resultado="Peso Ideal";
					if($peso>=87 && $peso<=104)$resultado="Sobre Peso";
					if($peso>104)$resultado="Obesidad";
				break;
				
				case $altura>=182 && $altura<=183:
					if($peso<72)$resultado="Bajo de peso";
					if($peso>=72 && $peso<=88)$resultado="Peso Ideal";
					if($peso>=89 && $peso<=105)$resultado="Sobre Peso";
					if($peso>105)$resultado="Obesidad";
				break;
				
				case $altura>=184 && $altura<=185:
					if($peso<75)$resultado="Bajo de peso";
					if($peso>=75 && $peso<=93)$resultado="Peso Ideal";
					if($peso>=94 && $peso<=110)$resultado="Sobre Peso";
					if($peso>110)$resultado="Obesidad";
				break;
				
				case $altura>=186 && $altura<=187:
					if($peso<76)$resultado="Bajo de peso";
					if($peso>=76 && $peso<=94)$resultado="Peso Ideal";
					if($peso>=95 && $peso<=110)$resultado="Sobre Peso";
					if($peso>110)$resultado="Obesidad";
				break;
				
				case $altura>=188 && $altura<=189:
					if($peso<77)$resultado="Bajo de peso";
					if($peso>=77 && $peso<=95)$resultado="Peso Ideal";
					if($peso>=96 && $peso<=111)$resultado="Sobre Peso";
					if($peso>115)$resultado="Obesidad";
				break;
				
				case $altura>=190 && $altura<=191:
					if($peso<80)$resultado="Bajo de peso";
					if($peso>=80 && $peso<=85)$resultado="Peso Ideal";
					if($peso>=96 && $peso<=115)$resultado="Sobre Peso";
					if($peso>115)$resultado="Obesidad";
				break;
				
				case $altura>=192 && $altura<=193:
					if($peso<82)$resultado="Bajo de peso";
					if($peso>=82 && $peso<=96)$resultado="Peso Ideal";
					if($peso>=97 && $peso<=115)$resultado="Sobre Peso";
					if($peso>115)$resultado="Obesidad";
				break;
				
				case $altura>=190 && $altura<=191:
					if($peso<80)$resultado="Bajo de peso";
					if($peso>=80 && $peso<=95)$resultado="Peso Ideal";
					if($peso>=96 && $peso<=115)$resultado="Sobre Peso";
					if($peso>115)$resultado="Obesidad";
				break;
				
				case $altura>=192&& $altura<=193:
					if($peso<82)$resultado="Bajo de peso";
					if($peso>=82 && $peso<=96)$resultado="Peso Ideal";
					if($peso>=97 && $peso<=115)$resultado="Sobre Peso";
					if($peso>115)$resultado="Obesidad";
				break;
				
				case $altura>=194 && $altura<=195:
					if($peso<84)$resultado="Bajo de peso";
					if($peso>=84 && $peso<=103)$resultado="Peso Ideal";
					if($peso>=104 && $peso<=120)$resultado="Sobre Peso";
					if($peso>120)$resultado="Obesidad";
				break;
				
				case $altura>=196 && $altura<=197:
					if($peso<85)$resultado="Bajo de peso";
					if($peso>=85 && $peso<=104)$resultado="Peso Ideal";
					if($peso>=105 && $peso<=121)$resultado="Sobre Peso";
					if($peso>121)$resultado="Obesidad";
				break;
				
				case $altura>=198 && $altura<=199:
					if($peso<86)$resultado="Bajo de peso";
					if($peso>=86 && $peso<=108)$resultado="Peso Ideal";
					if($peso>=109 && $peso<=122)$resultado="Sobre Peso";
					if($peso>122)$resultado="Obesidad";
				break;
				case $altura>=200:
					if($peso<88)$resultado="Bajo de peso";
					if($peso>=88 && $peso<=108)$resultado="Peso Ideal";
					if($peso>=109 && $peso<=127)$resultado="Sobre Peso";
					if($peso>127)$resultado="Obesidad";
				break;
		}//switch
		}//else
		
		return $resultado;
	}//RangoDePesoPorAltura

	//Funciones de IMC///
	function IMC1($id_Cliente,$Altura,$id_instructor,$peso)
	{
		$agregar   = new Agregar();
		$consultar = new Consultar();
		
		//Sacando el índice de masa corporal
		$alturaMetros   = $Altura/100; //convirtiéndo la altura en metros
		$alturaCuadrada = $alturaMetros*$alturaMetros;
		$imc			= number_format($peso/$alturaCuadrada,2); //Dejando el númnero con solo 2 decimales	
		$Diagnostico	= DiagnosticoAcordeResultadoIMC($imc);
		//Verificando si está dentro del rango 
		if($Diagnostico == "Fuera de rango")
		{
			
		}
		else
		{
		 $porcentajeAcordeResultado = PorcentajeAcordeResultadoPeso($Diagnostico);
		
		//Agregando el resultado en la BD
		$TipoPrueba = 3;
		$DescPrueba = "IMC";
		//Guardando los resultados de la prueba
		$resAgregar=$agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Diagnostico, $porcentajeAcordeResultado,$imc);
		
		//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
		$resultadoPruebas=$consultar->_ConsultarResultadosPruebas(3,$id_Cliente);
		
		//Creando un array con los resultados de las pruebas
			$arrayResultados=array();
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba="Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha=($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje=($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado=$fila['Resultado'];
				$Prueba=array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}//for
			
			//Tomando el consejo de la evaluación física
			$resultConsejo=$consultar->_ConsultarConsejoAcordeResultado(3,$Diagnostico);
			$filaConsejo=$resultConsejo->fetch_assoc();
			$consejo=$filaConsejo['Consejo'];
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Condicion"=>$Diagnostico, "Porcentaje"=>$porcentajeAcordeResultado, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo, "CantidadResultado"=>$imc);
		}
			return $salidaJson;
	}

	
	

	//Función para determinar el rango de edades en el que se encuentra la persona
	function EvaluacionMasculinaCondicionFisica($edad, $resultado)
	{
		$res="";
		if($res=="" && $resultado<49 || $resultado>82)
		{
			 $res="Fuera de rango";
		}//if
		else{
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=25:
				
					if($res=="" && $resultado>=49 && $resultado<=55) $res="Atleta";
					if($res=="" && $resultado>=56 && $resultado<=61) $res="Excelente";	
					if($res=="" && $resultado>=62 && $resultado<=69) $res="Bueno";	
					if($res=="" && $resultado>=70 && $resultado<=81) $res="Promedio";
					if($res=="" && $resultado>=82)$res="Pobre";
				break;
				
				case $edad >=26 && $edad<=35:
					if($res=="" && $resultado>=49 && $resultado<=54) $res="Atleta";
					if($res=="" && $resultado>=55 && $resultado<=61) $res="Excelente";
					if($res=="" && $resultado>=62 && $resultado<=70) $res="Bueno";
					if($res=="" && $resultado>=71 && $resultado<=81) $res="Promedio";
					if($res=="" && $resultado>=82)$res="Pobre";
				break;
					
				case $edad >=36 && $edad<=45:
					if($res=="" && $resultado>=50 && $resultado<=56) $res="Atleta";
					if($res=="" && $resultado>=57 && $resultado<=62) $res="Excelente";
					if($res=="" && $resultado>=63 && $resultado<=70) $res="Bueno";
					if($res=="" && $resultado>=71 && $resultado<=82) $res="Promedio";
					if($res=="" && $resultado>=83)					 $res="Pobre";
				break;
				
				case $edad >=46 && $edad<=55:
					if($res=="" && $resultado>=50 && $resultado<=57) $res="Atleta";
					if($res=="" && $resultado>=58 && $resultado<=63) $res="Excelente";
					if($res=="" && $resultado>=64 && $resultado<=71) $res="Bueno";
					if($res=="" && $resultado>=72 && $resultado<=83) $res="Promedio";
					if($res=="" && $resultado>=84)					 $res="Pobre";
				break;
				
				case $edad >=56 && $edad<=65:
					if($res=="" && $resultado>=51 && $resultado<=56) $res="Atleta";
					if($res=="" && $resultado>=57 && $resultado<=61) $res="Excelente";
					if($res=="" && $resultado>=62 && $resultado<=71) $res="Bueno";
					if($res=="" && $resultado>=72 && $resultado<=81) $res="Promedio";
					if($res=="" && $resultado>=82)					 $res="Pobre";
				break;
				
				case $edad >65:
					if($res=="" && $resultado>=50 && $resultado<=55) $res="Atleta";
					if($res=="" && $resultado>=56 && $resultado<=61) $res="Excelente";
					if($res=="" && $resultado>=62 && $resultado<=69) $res="Bueno";
					if($res=="" && $resultado>=70 && $resultado<=79) $res="Promedio";
					if($res=="" && $resultado>=80)					 $res="Pobre";
				break;
				
				default:
					$res="Fuera de rango";
				break;
				
			}//switch
		}//else
			$condicion = $res;
			return $condicion;
	}//EvaluacionMasculina
	
	function EvaluacionFemeninaCondicionFisica($edad, $resultado)
	{
		$res="";
		if($res=="" && $resultado<49 || $resultado>82)
		{
			 $res="Fuera de rango";
		}//if
		else{
		switch($edad)
			{
				//se declara res vacío, si cae en alguno de los rangos de edad, se debe verificar que 
				//resultado fue, si no es se asigna cadena vacía y se sigue buscando.
								
				//case de las edades
				case $edad >=18 && $edad<=25:
						if($res=="" && $resultado>=50 && $resultado<=60) $res="Atleta";
						if($res=="" && $resultado>=61 && $resultado<=68) $res="Excelente";	
						if($res=="" && $resultado>=69 && $resultado<=73) $res="Bueno";	
						if($res=="" && $resultado>=74 && $resultado<=84) $res="Promedio";
						if($res=="" && $resultado>=85)					 $res="Pobre";						
				break;
				
				case $edad >=26 && $edad<=35:
					if($res=="" && $resultado>=50 && $resultado<=59)$res="Atleta";
					if($res=="" && $resultado>=60 && $resultado<=64)$res="Excelente";
					if($res=="" && $resultado>=65 && $resultado<=72)$res="Bueno";
					if($res=="" && $resultado>=73 && $resultado<=82)$res="Promedio";
					if($res=="" && $resultado>=83)$res="Pobre";
				break;
					
				case $edad >=36 && $edad<=45:
					if($res=="" && $resultado>=50 && $resultado<=59)$res="Atleta";
					if($res=="" && $resultado>=60 && $resultado<=64)$res="Excelente";
					if($res=="" && $resultado>=65 && $resultado<=73)$res="Bueno";
					if($res=="" && $resultado>=74 && $resultado<=84)$res="Promedio";
					if($res=="" && $resultado>=85)$res="Pobre";
				break;
				
				case $edad >=46 && $edad<=55:
					if($res=="" && $resultado>=50 && $resultado<=60)$res="Atleta";
					if($res=="" && $resultado>=61 && $resultado<=65)$res="Excelente";
					if($res=="" && $resultado>=66 && $resultado<=73)$res="Bueno";
					if($res=="" && $resultado>=74 && $resultado<=83)$res="Promedio";
					if($res=="" && $resultado>=84)$res="Pobre";
				break;
				
				case $edad >=56 && $edad<=65:
					if($res=="" && $resultado>=50 && $resultado<=59)$res="Atleta";
					if($res=="" && $resultado>=60 && $resultado<=64)$res="Excelente";
					if($res=="" && $resultado>=65 && $resultado<=73)$res="Bueno";
					if($res=="" && $resultado>=74 && $resultado<=83)$res="Promedio";
					if($res=="" && $resultado>=84)$res="Pobre";
				break;
				
				case $edad >65:
					if($res=="" && $resultado>=50 && $resultado<=59)$res="Atleta";
					if($res=="" && $resultado>=60 && $resultado<=64)$res="Excelente";
					if($res=="" && $resultado>=65 && $resultado<=72)$res="Bueno";
					if($res=="" && $resultado>=73 && $resultado<=84)$res="Promedio";
					if($res=="" && $resultado>=84)$res="Pobre";
				break;
				
				
				default:
					$res="Fuera de rango";
				break;
				
			}//switch
	}//else
			$condicion=$res;
			return $condicion;
	}
	
	function PorcentajeAcordeResultado($resultado)
	{
		$porcentaje = 0;
		switch($resultado)	
		{
			case 'Atleta':    $porcentaje = 100; break;
			case 'Excelente': $porcentaje = 80;  break;
			case 'Bueno':     $porcentaje = 60;  break;
			case 'Promedio':  $porcentaje = 40;  break;
			case 'Pobre':     $porcentaje = 20;  break;
		}//switch
		
		return $porcentaje;
	}//PorcentajeAcordeResultado

	
	
	function AgregadoYfuncionesDeCondicionFisica($id_instructor,$id_Cliente,$Condicion,$ResultadoEvaluado,$DescPrueba)
	{
			$agregar    = new Agregar();
			$consultar  = new Consultar(); 
			//Tomando los valores para guardar el resultado de la prueba en la BD
			$TipoPrueba = 1;
			$porcentaje = PorcentajeAcordeResultado($Condicion);
			//Guardando los resultados de la prueba
			$resultado=$agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Condicion, $porcentaje,$ResultadoEvaluado);
			
			//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
			$resultadoPruebas=$consultar->_ConsultarResultadosPruebas(1,$id_Cliente);
			
			//Creando un array con los resultados de las pruebas
			$arrayResultados=array();
			
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba="Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha=($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje = ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado  = $fila['Resultado'];
				$Prueba     = array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}
			//print_r($arrayResultados);
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(1,$Condicion);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Guardando en la bitácora el biotest hecho
			$ResultBitacora = $agregar->_AgregarRegistroBitacoraBiotest($id_instructor,$id_Cliente);
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Condicion"=>$Condicion, "Resultado"=>$ResultadoEvaluado, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo);
			return $salidaJson;
	}
	
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
	
	
	

	function PorcentajeAcordeResultadoPeso($resultado)
	{
		switch($resultado)	
		{
			case 'Peso Ideal': 	 $porcentaje=100; break;
			case 'Sobre Peso': 	 $porcentaje=60;  break;
			case 'Bajo de peso': $porcentaje=60;  break;
			case 'Obesidad':     $porcentaje=20;  break;
		}//switch
		
		return $porcentaje;
	}//PorcentajeAcordeResultado
	
	
	
	function DiagnosticoAcordeResultadoIMC($resultado)
	{
		switch($resultado)
		{
			case $resultado<18.5:
				$resultado="Bajo de peso";	
			break;	
			
			case $resultado>=18.5 && $resultado<=24.99:
				$resultado="Peso Ideal";	
			break;	
			
			case $resultado>=25 && $resultado<=29.99:
				$resultado="Sobre Peso";	
			break;	
			
			case $resultado>=30:
				$resultado="Obesidad";	
			break;	
			
			default :
			$resultado="Fuera de rango";	
			break;
		}//switch
		return $resultado;
	}//	function PorcentajeAcordeResultadoIMC($resultado)
	
	
	//Funciones de IMM Masa muscular //
	
	
	function MultiQuery($id_cliente,$id_instructor,$Cintura, $Cadera,$Perimetro_Espalda, $Perimetro_Pecho,$Perimetro_brazo_relajado, 
			$Perimetro_brazo_flexionado,$Perimetro_femoral,$Perimetro_Pantorrilla)
	{
			$tipo_prueba=4; //índice de masa corporal es la prueba 4
			$Condicion="No Aplica";
			$porcentaje =0;
			
			$DescPrueba1 = "IMM - Cintura";
			$DescPrueba2 = "IMM - Cadera";
			$DescPrueba3 = "IMM - Perimetro_Espalda";
			$DescPrueba4 = "IMM - Perimetro_Pecho";
			$DescPrueba5 = "IMM - Perimetro_brazo_relajado";
			$DescPrueba6 = "IMM - Perimetro_brazo_flexionado";
			$DescPrueba7 = "IMM - Perimetro_femoral";
			$DescPrueba8 = "IMM - Perimetro_Pantorrilla";
		$query='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba1.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Cintura.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba2.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Cadera.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba3.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_Espalda.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba4.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_Pecho.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba5.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_brazo_relajado.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba6.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_brazo_flexionado.'");';
		
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba7.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_femoral.'");';
		$query .='
		INSERT INTO sg_pruebas (id_instructor,id_cliente,Tipo_Prueba,Desc_Prueba, Resultado, Porcentaje,resultado_numerico)
		VALUES("'.$id_instructor.'", "'.$id_cliente.'", "'.$tipo_prueba.'", "'.$DescPrueba8.'", "'.$Condicion.'", "'.$porcentaje.'", "'.$Perimetro_Pantorrilla.'");';
		
		$query .='	select * from sg_pruebas pruebas 
			where Tipo_Prueba="'.$tipo_prueba.'" 
			and id_cliente="'.$id_cliente.'" order by fecha desc limit 16;';
		
		$agregar   = new Agregar();
		$resultado = $agregar->_AgregarResultadoMultiQuery($id_cliente, $query);
		return $resultado;
	}
	
	
	
	
	function AgregarResultadosYDevolverInformacionStamina($id_instructor,$id_Cliente,$Condicion,$repeticiones)
	{
		$agregar   = new Agregar();
		$consultar = new Consultar();
		//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			
			//Tomando los valores para guardar el resultado de la prueba en la BD
			$TipoPrueba		  = 5;
			$DescPrueba		  = "Stamina";
			$porcentajeActual = PorcentajeAcordeResultado($Condicion);
			//Guardando los resultados de la prueba
			$resultado = $agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Condicion, $porcentajeActual,$repeticiones);
			
			//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
			$resultadoPruebas=$consultar->_ConsultarResultadosPruebas(5,$id_Cliente);
			
			//Creando un array con los resultados de las pruebas
			$arrayResultados = array();
			
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba="Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha=($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje=($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado=$fila['Resultado'];
				$Prueba=array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}
			//print_r($arrayResultados);
			
			//Tomando el consejo de la evaluación física
			$resultConsejo=$consultar->_ConsultarConsejoAcordeResultado(5,$Condicion); //El número es el tipo de prueba
			$filaConsejo=$resultConsejo->fetch_assoc();
			$consejo=$filaConsejo['Consejo'];
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Condicion"=>$Condicion, "Resultado"=>$repeticiones, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo, "Porcentaje"=>$porcentajeActual);
			return $salidaJson;	
	}
	
	function ConsultarResultadosPruebasIMM($tipo_prueba, $id_cliente) //consulta el último biotest para imm se necesitan 16 campos.
	{
		$query='
			select * from sg_pruebas pruebas 
			where Tipo_Prueba="'.$tipo_prueba.'" 
			and id_cliente="'.$id_cliente.'" order by pruebas.id DESC limit 16
		';
		$con=Conectar::_con();
		$result=$con->query($query) or die("Error en: $query ".mysqli_error($query));
		return $result;
	}
	
	
	
	
	function PorcentajeAcordeResultadoFuerza($resultado)
	{
		$porcentaje = 0;
		switch($resultado)	
		{
			case 'Atleta': 	 $porcentaje = 100; break;
			case 'Excelente': 		 $porcentaje = 80;  break;
			case 'Bueno': 	 $porcentaje = 60;  break;
			case 'Promedio':     	 $porcentaje = 40;  break;
			case 'Pobre':    $porcentaje = 20;  break;
		}//switch
		
		return $porcentaje;
	}//PorcentajeAcordeResultado
	
	
	
	function AgregarResultadosYDevolverInformacionResistencia($id_instructor,$id_Cliente,$Condicion,$repeticiones)
	{
		$agregar=new Agregar();
		$consultar=new Consultar();
		//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			
			//Tomando los valores para guardar el resultado de la prueba en la BD
			$TipoPrueba		  = 7;
			$DescPrueba		  = "Resistencia";
			$porcentajeActual = PorcentajeAcordeResultadoFuerza($Condicion);

			//Guardando los resultados de la prueba
			$resultado=$agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Condicion, $porcentajeActual,$repeticiones);
			
			//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
			$resultadoPruebas=$consultar->_ConsultarResultadosPruebas(7,$id_Cliente);
			
			//Creando un array con los resultados de las pruebas
			$arrayResultados=array();
			
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba = "Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha=($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje = ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado	= $fila['Resultado'];
				$Prueba		= array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}
			//print_r($arrayResultados);
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(7,$Condicion); //El número es el tipo de prueba
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Condicion"=>$Condicion, "Resultado"=>$repeticiones, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo, "Porcentaje"=>$porcentajeActual);
			return $salidaJson;		
	}
	
	
	
	function AgregarResultadosYDevolverInformacionFlexibilidad($id_instructor,$id_Cliente,$Condicion,$repeticiones)
	{
		$agregar   = new Agregar();
		$consultar = new Consultar();
		//En esta línea se agregan el resultado de la prueba, se obtienen los datos necesarios y se devuelve el array para
			//devolver a la pantalla principal.
			
			//Tomando los valores para guardar el resultado de la prueba en la BD
			$TipoPrueba		  = 8;
			$DescPrueba		  = "Flexibilidad";
			$porcentajeActual = PorcentajeAcordeResultadoFuerza($Condicion);
			//Guardando los resultados de la prueba
			$resultado = $agregar->_AgregarResultadoPrueba($id_instructor, $id_Cliente, $TipoPrueba, $DescPrueba, $Condicion, $porcentajeActual,$repeticiones);
			
			//Obteniendo pruebas de los últimos 3 meses para saber el resultado de la persona en las gráficas
			$resultadoPruebas = $consultar->_ConsultarResultadosPruebas(8,$id_Cliente);
			
			//Creando un array con los resultados de las pruebas
			$arrayResultados = array();
			
			//tomando los resultados
			for($i=0; $i<3; $i++)
			{
				$fila=$resultadoPruebas->fetch_assoc();
				$NumPrueba="Prueba".$i;
				//Tomando los valores para asignarlos al array.
				
				//Si los valores vienen null, se les asigna 0 para que al llegar al lado del cliente se asigne otro valor y se cargue la gráfica
				$fecha 		= ($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0; //Devolviendo un string con la fecha con el método de la línea 148
				$porcentaje = ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
				$resultado  = $fila['Resultado'];
				$Prueba 	= array("Resultado"=>$resultado,"Porcentaje"=>$porcentaje, "Fecha"=>$fecha);	
				array_push ($arrayResultados,$Prueba);
			}
			//print_r($arrayResultados);
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(6,$Condicion); //El número es el tipo de prueba
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo 	   = $filaConsejo['Consejo'];
			//DEvolviendo parámetros para la notificación				
			$salidaJson = array("Condicion"=>$Condicion, "Resultado"=>$repeticiones, "id_cliente"=>$id_Cliente,"Resultados"=>$arrayResultados,
			"TipoPrueba"=>$TipoPrueba, "Consejo"=>$consejo, "Porcentaje"=>$porcentajeActual);
			return $salidaJson;		
	}
	
	
	function ReportePdf($id_cliente)
	{
		
		$consultar = new Consultar();
		
		//Conseguir información de todas las pruebas
		$result    = $consultar->_ConsultarResultadosPruebasReporte(1,$id_cliente);
		$num_rows  = $result->num_rows;
		$Condicion = array();
		//tomando los resultados
			
		for($i=0; $i<$num_rows; $i++)			
		{
			$fila			    = $result->fetch_assoc();
			$resultado_numerico = $fila['resultado_numerico']; 
			$des_prueba 		= ($fila['Desc_Prueba']!=null)?$fila['Desc_Prueba']:0;
			$Cond	 		    = $fila['Resultado'];
			$fecha 				= ($fila['fecha']!=null)?ConvertirTimeStamp($fila['fecha']):0;
			$Porcentaje			= ($fila['Porcentaje']!=null)?$fila['Porcentaje']:0;
			
			//Tomando el consejo de la evaluación física
			$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(1,$Cond);
			$filaConsejo   = $resultConsejo->fetch_assoc();
			$consejo	   = $filaConsejo['Consejo'];
			
			//Obteniendo tamaño de la barra de progreso.
			switch($Cond)
					{
						case 'Atleta':
							$Barra    = "progress-bar-success";
							$longitud = '"width","100%"';
						break;
						
						case 'Excelente':
							$Barra    ="progress-bar-success";
							$longitud = '"width","80%"';
						break;
						
						case 'Bueno':
							$longitud = '"width","60%"';
						break;
						
						case 'Promedio':
							$Barra    ="progress-bar-warning";
							$longitud = '"width","40%"';
						break;
						
						case 'Pobre':
							$Barra    ="progress-bar-danger";
							$longitud = '"width","20%"';
						break;
					}//switch
			
			$Con   				= array("resultado_numerico"=>$resultado_numerico,"des_prueba"=>$des_prueba,"Condicion"=>$Cond,
			"fecha"=>$fecha,"Porcentaje"=>$Porcentaje,"Consejo"=>$consejo,"Barra"=>$Barra, "Longitud"=>$longitud);
			array_push($Condicion,$Con);
		}//for	
		
		/*$resultConsejo = $consultar->_ConsultarConsejoAcordeResultado(1,$Condicion);
		$filaConsejo   = $resultConsejo->fetch_assoc();
		$consejo	   = $filaConsejo['Consejo'];*/
		
		$salidaJson = array("Condicion"=>$Condicion);		
		return $salidaJson;
	}//ReportePdf
?>