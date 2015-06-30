<?php
	include("../../libs/libs.php");
	$Params=(isset($_GET['Params']))?$_GET['Params']:$_POST['Params'];
	
	$Parametros = json_decode($Params,true);
	
	$Accion=$Parametros['Accion'];
	//Switch de las funciones
	switch($Accion)
	{
		case 'Agregar'://Agregando a la BD
			AgregarCliente($Parametros);
				
			//DEvolviendo parámetros para la notificación				
			$salidaJson = array("Agregado"=>"1" );
			echo json_encode($salidaJson);
		break;	
		
		case 'Editar':
			//Agregando a la BD
			EditarCliente($Parametros);
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Editado"=>"1" );
			echo json_encode($salidaJson);
		break;	
		
		case 'Eliminar':
			$id=$Parametros['id_cliente']; 
			EliminarCliente($id);
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Agregado"=>"1" );
			echo json_encode($salidaJson);
		break;
		
		case 'AgregarFormulario':
			$id=$Parametros['id_cliente']; 
			//Tomar los parámetros que serán mandados a BD
			
			echo "yo yo";
			//Primer formulario
			$Condicion_Cardiaca=		$Parametros['Condicion_Cardiaca'];	
			$Condicion_Pecho=			$Parametros['Condicion_Pecho'];	
			$Condicion_Pecho_reciente=	$Parametros['Condicion_Pecho_reciente'];	
			$Condicion_Balance=			$Parametros['Condicion_Balance'];
			$Lesion_Fisica=				$Parametros['Lesion_Fisica'];	
			$Medicamentos_Corazon=		$Parametros['Medicamentos_Corazon'];	
			$Impedimento_Entrenamiento=	$Parametros['Impedimento_Entrenamiento'];	
			$Lecturas_Anormales=	   	$Parametros['Lecturas_Anormales'];	
			$Cirujia_Bypass=			$Parametros['Cirujia_Bypass'];	
			$Dificultad_Respirar=		$Parametros['Dificultad_Respirar'];	
			$Enfermedades_Renales=		$Parametros['Enfermedades_Renales'];	
			$Arritmia=					$Parametros['Arritmia'];
			$Colesterol=				$Parametros['Colesterol'];	
			$Presion_Alta=				$Parametros['Presion_Alta'];	
			$cantidad_Cigarros=			$Parametros['cantidad_Cigarros'];	
			$Molestias_Articulaciones=	$Parametros['Molestias_Articulaciones'];		
			$Molestias_Espalda=			$Parametros['Molestias_Espalda'];			
		
			//2do formulario
			$Desayuno_Diario =			$Parametros['Desayuno_Diario'];	
			$Comida_Diaria =		 	$Parametros['Comida_Diaria'];	
			$Cena_Diaria =			 	$Parametros['Cena_Diaria'];	
			$EntreComida_Diaria =	 	$Parametros['EntreComida_Diaria'];
			$Frecuencia_EntreComida =	$Parametros['Frecuencia_EntreComida'];
			$Plan_Alimenticio=		 	$Parametros['Plan_Alimenticio'];	
			$Intensidad_Ejercicio=	 	$Parametros['Intensidad_Ejercicio'];	
			$Intensidad_Ejercicio2=	 	$Parametros['Intensidad_Ejercicio2'];	
			$Intensidad_Ejercicio3=	 	$Parametros['Intensidad_Ejercicio3'];	
			$Intensidad_Ejercicio4=		$Parametros['Intensidad_Ejercicio4'];	
			$Intensidad_Ejercicio5=	 	$Parametros['Intensidad_Ejercicio5'];
			$Programa_Ejercicio=	 	$Parametros['Programa_Ejercicio'];	
			$Actividades_deseables=  	$Parametros['Actividades_deseables'];
			$Actividades_indeseables=	$Parametros['Actividades_indeseables'];	
			$deporte_Frecuente=		 	$Parametros['deporte_Frecuente'];	
			$Minutos_Dia=			 	$Parametros['Minutos_Dia'];	
			$Dias_Semana=			 	$Parametros['Dias_Semana'];		
			$Resultado_Ejercicio=	 	$Parametros['Resultado_Ejercicio'];
			
			//Datos default
			$id_cliente=				$Parametros['id_cliente'];
			$id_instructor=				$Parametros['id_instructor'];			
			
			//Verificando si el usuario ya hizo el biotest
			$consultar=new Consultar();
			$result=$consultar->_ConsultarBioTestPorIdCliente($id);
			$num=$result->num_rows;
			//Si existe más de 0 registros, la persona ya hizo el biotest, lo que significa que ahora se editan los datos del biotest
			if($num>0)
			{
				//Mandando a Editar los datos a BD
				EditarDatosFormulario($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, 
				$Medicamentos_Corazon,$Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,
				$Arritmia,$Colesterol, $Presion_Alta,$cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria,
				$Cena_Diaria, $EntreComida_Diaria,$Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,
				$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,$Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, 
				$Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,$Resultado_Ejercicio,$id_cliente ,$id_instructor );
			}
			else
			{
				//Mandando a guardar los datos a BD
				GuardarDatosFormulario($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, 
				$Medicamentos_Corazon,$Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,
				$Arritmia,$Colesterol, $Presion_Alta,$cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria,
				$Cena_Diaria, $EntreComida_Diaria,$Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,
				$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,$Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, 
				$Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,$Resultado_Ejercicio,$id_cliente ,$id_instructor );	
			}
			//DEvolviendo parámetros para la notificación				
			$salidaJson=array("Agregado"=>"1" );
			echo json_encode($salidaJson);
		break;
		
		case 'AgregarRutina':
			$nb_rutina			= $Parametros['nb_rutina'];
			$id_CategoriaRutina	= $Parametros['id_CategoriaRutina'];			
			$desc_rutina		= $Parametros['desc_rutina'];
			$id_usuario			= $Parametros['id_usuario'];
			$id_cliente			= $Parametros['id_cliente'];
			//Llamando a la función de edición
			
			//DEvolviendo parámetros para la notificación				
			$salidaJson = AgregarRutina($nb_rutina, $id_CategoriaRutina,$desc_rutina,$id_usuario, $id_cliente);
			echo json_encode($salidaJson);
		break;
		
		case 'RegistrarEjerciciosRutinas':
			$id_rutina			= $Parametros['id_rutina'];
			$id_usuario			= $Parametros['id_usuario'];
			$id_dia				= $Parametros['id_dia'];
			$id_CategoriaRutina	= $Parametros['id_CategoriaRutina'];			
			$EjerciciosRutina	= $Parametros['EjerciciosRutina'];
			$id_TipoRutina		= $Parametros['id_TipoRutina'];
			$CantidadEjercicios	= $Parametros['CantidadEjercicios'];
			//Llamando a la función de edición
			
			//DEvolviendo parámetros para la notificación				
			RegistrarEjerciciosRutinas($id_rutina, $id_usuario,$id_dia,$id_CategoriaRutina, $EjerciciosRutina, $CantidadEjercicios, $id_TipoRutina);
			//echo json_encode($salidaJson);
		break;
		
		case 'AgregarRepeticionesEjercicio':
			
			//Tomando los valores
			$id_ejercicio		=$Parametros['id_ejercicio'];
			$num_repeticiones	=$Parametros['num_repeticiones'];
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			AgregarRepeticionesEjercicio($id_ejercicio, $num_repeticiones);
		break;
		
		case 'AgregarCircuitosEjercicio':
			
			//Tomando los valores
			$id_ejercicio		=$Parametros['id_ejercicio'];
			$num_circuitos		=$Parametros['num_circuitos'];
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			AgregarCircuitosEjercicio($id_ejercicio, $num_circuitos);
		break;
		
		case 'AgregarRelacionEjercicio':
			
			//Tomando los valores
			$id_ejercicio	= $Parametros['id_ejercicio'];
			$relacion		= $Parametros['relacion'];
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			AgregarRelacionEjercicio($id_ejercicio, $relacion);
		break;
		
		case 'AsignarRutinaACliente':
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			$salidaJson = AsignarRutinaACliente($Parametros);
			echo json_encode($salidaJson);
		break;
		
		
		case 'AgregarRepeticionesEjercicio':
			
			//Tomando los valores
			$id_ejercicio		= $Parametros['id_ejercicio'];
			$num_repeticiones	= $Parametros['num_repeticiones'];
			$id_rutina			= $Parametros['id_rutina'];	
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			AgregarRepeticionesEjercicio($id_ejercicio, $num_repeticiones, $id_rutina);
		break;
		
		case 'AgregarCircuitosEjercicio':
			
			//Tomando los valores
			$id_ejercicio	= $Parametros['id_ejercicio'];
			$num_circuitos	= $Parametros['num_circuitos'];
			
			//Mandando los valores a BD ya sea para agregar y o actualizar
			AgregarCircuitosEjercicio($id_ejercicio, $num_circuitos);
		break;
		
		case 'DesactivarRutina':
			
			//Tomando los valores
			$id_cliente	= $Parametros['id_cliente'];
			//Desactivando la rutina para asignar una nueva
			DesactivarRutina($id_cliente);
		break;
		
		case 'CambioLugarEjercicio':

			//Tomando los valores
			$id_Rutina		  = $Parametros['id_Rutina'];
			$id_Cambio 		  = $Parametros['id_Cambio'];
			$id_Hijo		  = $Parametros['id_Hijo']; 
			$id_Padre		  = $Parametros['id_Padre'];
			$Cantidad_Puestos = $Parametros['Cantidad_Puestos'];
			$AccionCambio	  = $Parametros['AccionCambio'];
			
			//Decisiones sobre el tipo de cambio que se hará 1)Sin padre 2) Sin hijo 3)Con padre he hijo.
			
			switch($AccionCambio)
			{
				case 'SinPadre':
					CambioLugarEjercicioSinPadre($id_Rutina,$id_Cambio,$id_Hijo, $Cantidad_Puestos);
				break;
				
				case 'SinHijo':
					CambioLugarEjercicioSinHijo($id_Rutina,$id_Cambio,$id_Padre, $Cantidad_Puestos);
				break;
				
				case 'ConAmbosBajoPosicion':
					ConAmbosBajoPosicion($id_Rutina,$id_Cambio,$id_Padre, $id_Hijo,$Cantidad_Puestos);
				break;
				
				case 'ConAmbosSubioPosicion':
					ConAmbosSubioPosicion($id_Rutina,$id_Cambio,$id_Padre, $id_Hijo,$Cantidad_Puestos);
				break;
				
			}//switch
			
		break;

		case 'ConsultarTiposCuerpo':
			$salidaJson = ConsultarTiposCuerpo();
			echo json_encode($salidaJson);
		break;
		
	}//switch
	
	
	function AgregarCliente($Parametros)
	{
		//Tomamos los datos.
		$nb_nombre  	  = $Parametros['nb_cliente'];
		$nb_apellidos	  = $Parametros['nb_apellidos'];
		$de_genero	 	  = $Parametros['de_genero'];
		$fh_nacimiento	  = $Parametros['fh_nacimiento'];
		$de_email	   	  = $Parametros['de_email'];
		$num_telefono  	  = $Parametros['num_telefono'];
		$num_celular   	  = $Parametros['num_celular'];
		$de_colonia	 	  = $Parametros['de_colonia'];
		$de_domicilio     = $Parametros['de_domicilio'];
		$num_codigoPostal = $Parametros['num_codigoPostal'];
		$nb_cliente		  = $Parametros['nb_cliente'];
		$id_usuario		  = $Parametros['id_usuario'];
		$id_cuerpo 		  = $Parametros['id_cuerpo'];
		$agregar 		  = new Agregar();
		$consultar        = new Consultar();
		//Buscando el id del tipo de cuerpo por el texto.
		$resultCuerpo     = $consultar->_ConsultarCuerpoPorTexto($id_cuerpo);
		$filaCuerpo       = $resultCuerpo->fetch_assoc();
		$id_tipoCuerpo    = $filaCuerpo['id'];

		// Buscar el valo del tipo de cuerpo.
		$result=$agregar->_AgregarCliente($nb_apellidos,$de_genero,$fh_nacimiento,$de_email,
				$num_telefono,$num_celular,$de_colonia,$de_domicilio,$num_codigoPostal,$nb_nombre,$id_usuario,$id_tipoCuerpo);	
	}
	
	function EditarCliente($Parametros)
	{
		//Tomamos los datos.
		$consultar        = new Consultar();
		$nb_apellidos	  = $Parametros['nb_apellidos'];
		$de_genero		  = $Parametros['de_genero'];
		$fh_nacimiento    = $Parametros['fh_nacimiento'];
		$de_email		  = $Parametros['de_email'];
		$num_telefono	  = $Parametros['num_telefono'];
		$num_celular	  = $Parametros['num_celular'];
		$de_colonia		  = $Parametros['de_colonia'];
		$de_domicilio	  = $Parametros['de_domicilio'];
		$num_codigoPostal = $Parametros['num_codigoPostal'];
		$nb_cliente		  = $Parametros['nb_cliente'];
		$id_cliente		  = $Parametros['id_cliente'];
		$id_cuerpo        = $Parametros['id_cuerpo'];
		$resultCuerpo     = $consultar->_ConsultarCuerpoPorTexto($id_cuerpo);
		$filaCuerpo       = $resultCuerpo->fetch_assoc();
		$id_tipoCuerpo    = $filaCuerpo['id'];
		$editar = new Actualizar();
		$result = $editar->_EditarCliente($nb_apellidos,$de_genero,$fh_nacimiento,$de_email,
				$num_telefono,$num_celular,$de_colonia,$de_domicilio,$num_codigoPostal,$nb_cliente, $id_cliente,$id_tipoCuerpo);
	}
	
	function EliminarCliente($id)
	{
		$eliminar=new Actualizar();
		$result=$eliminar->_Eliminarcliente($id);
	}
	
	function GuardarDatosFormulario($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, $Medicamentos_Corazon,
	 $Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,$Arritmia,$Colesterol, $Presion_Alta,
	  $cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria, $Cena_Diaria, $EntreComida_Diaria,
	  $Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,
	  $Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, $Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,
	  $Resultado_Ejercicio,$id_cliente ,$id_instructor )
	{
		$agregar=new Agregar();
		$result=$agregar->_AgregarDatosFormularioSalud($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, $Medicamentos_Corazon,
		$Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,$Arritmia,$Colesterol, $Presion_Alta,
		$cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria, $Cena_Diaria, $EntreComida_Diaria,
		$Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,
		$Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, $Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,
		$Resultado_Ejercicio,$id_cliente ,$id_instructor);											
	}
	
	function EditarDatosFormulario($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, 
				$Medicamentos_Corazon,$Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,
				$Arritmia,$Colesterol, $Presion_Alta,$cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria,
				$Cena_Diaria, $EntreComida_Diaria,$Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,
				$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,$Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, 
				$Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,$Resultado_Ejercicio,$id_cliente ,$id_instructor )
	{
		$Actualizar=new Actualizar();
		$result=$Actualizar->EditarDatosFormularioPorIdCliente($Condicion_Cardiaca,$Condicion_Pecho,$Condicion_Pecho_reciente,$Condicion_Balance, $Lesion_Fisica, $Medicamentos_Corazon,
		$Impedimento_Entrenamiento,$Lecturas_Anormales, $Cirujia_Bypass, $Dificultad_Respirar, $Enfermedades_Renales,$Arritmia,$Colesterol, $Presion_Alta,
		$cantidad_Cigarros,$Molestias_Articulaciones,$Molestias_Espalda, $Desayuno_Diario, $Comida_Diaria, $Cena_Diaria, $EntreComida_Diaria,
		$Frecuencia_EntreComida,$Plan_Alimenticio, $Intensidad_Ejercicio,$Intensidad_Ejercicio2,$Intensidad_Ejercicio3, $Intensidad_Ejercicio4,
		$Intensidad_Ejercicio5, $Programa_Ejercicio, $Actividades_deseables, $Actividades_indeseables,$deporte_Frecuente, $Minutos_Dia, $Dias_Semana,
		$Resultado_Ejercicio,$id_cliente ,$id_instructor);		
	}				
	
	function AgregarRutina($nb_rutina, $id_CategoriaRutina,$desc_rutina,$id_usuario ,$id_cliente)
	{
		session_start();
		$agregar=new Agregar();
		//Tomar la fecha de hoy
			date_default_timezone_set("America/Chihuahua");
			$fh_Creacion = date("Y-m-d"); //fecha del día de hoy		
			$result		 = $agregar->_AgregarRutinaCliente($nb_rutina, $id_CategoriaRutina,$desc_rutina,$id_usuario, $fh_Creacion,$id_cliente);
			$fila		 = $result->fetch_assoc();
			$id_rutina	 = $fila['id_rutinaCliente'];
			
			//Guardar en una variable de sesión la rutina
			$_SESSION['id_rutina'] = $id_rutina;
			$salidaJson=array("id_rutina"=>$id_rutina);
			return $salidaJson;
	}//AgregarRutina
	
	function RegistrarEjerciciosRutinas($id_rutina, $id_usuario,$id_dia,$id_CategoriaRutina, $EjerciciosRutina, $CantidadEjercicios, $id_TipoRutina)
	{
		$agregar=new Agregar();
		$result=$agregar->_RegistrarEjerciciosRutinasClientes($id_rutina, $id_usuario,$id_dia,$id_CategoriaRutina, $EjerciciosRutina, $CantidadEjercicios, $id_TipoRutina);
	}//RegistrarEjerciciosRutinas
	
	function AgregarRepeticionesEjercicio($id_ejercicio, $num_repeticiones)
	{
		//Buscar si ya existe algún valor, de ser así entonces se actualiza
		$consultar 	= new Consultar();
		$agregar	= new Agregar();
		$actualizar = new Actualizar();
		
		$result=$actualizar->_ActualizarNumeroRepeticionesEjercicioClientePorId($id_ejercicio, $num_repeticiones);	
		
	}//AgregarRepeticionesEjercicio
	
	function AgregarCircuitosEjercicio($id_ejercicio, $num_circuitos)
	{
		//Buscar si ya existe algún valor, de ser así entonces se actualiza
		$consultar=new Consultar();
		$actualizar=new Actualizar();
		
		$result=$actualizar->_ActualizarNumeroCircuitosEjercicioClientePorId($id_ejercicio, $num_circuitos);
		
	}///AgregarCircuitosEjercicio
	
	function AgregarRelacionEjercicio($id_ejercicio, $relacion)
	{
		$actualizar = new Actualizar();
		$result     = $actualizar->_ActualizarRelacionEjerciciosClientes($id_ejercicio, $relacion);
	}//AgregarRelacionEjercicio
	
	
	function AsignarRutinaACliente($Parametros)
	{
		date_default_timezone_set("Mexico/General");
		//Tomando los valores
		$id_cliente		= $Parametros['id_cliente'];
		$id_rutina		= $Parametros['id_rutina'];
		$id_instructor	= $Parametros['id_instructor'];
		$consultar 		= new Consultar();
		$agregar  		= new Agregar();
		
		//tomar todos los datos de la rutina que asignaremos al cliente
		$resultRutina 		= $consultar->_ConsultarRutinaPorId($id_rutina);
		$filarutina  		= $resultRutina->fetch_assoc();
		$id_CategoriaRutina = $filarutina['id_CategoriaRutina'];
		$nb_rutina			= $filarutina['nb_rutina'];
		$desc_rutina		= $filarutina['desc_rutina'];
		$id_tipocuerpo 		= $filarutina['id_tipocuerpo'];
		$fh_Creacion		= date("Y-m-d"); //fecha del día de hoy
		
		//Agregando en la Tabla sg_rutinasclientes Los datos de la rutina
		$ResultAgregarRutinaCliente = $agregar->_AgregarRutinaCliente($nb_rutina, $id_CategoriaRutina,$desc_rutina,$id_instructor, $fh_Creacion,$id_cliente,$id_tipocuerpo);
		$filaResultAgregarRutina	= $ResultAgregarRutinaCliente->fetch_assoc();
		$id_RutinaCliente			= $filaResultAgregarRutina['id_rutinaCliente']; //id de la rutina recien insertada.
		
		//Tomando la información de la rutina recien agregadadel cliente.
		$resultRutinaCliente = $consultar->_ConsultarRutinasClientesPorIdCliente($id_cliente);
		$filaRutinaCliente   = $resultRutinaCliente->fetch_assoc();
		$id_RutinaCliente    = $filaRutinaCliente['id_rutinaCliente'];
		
		//Tomando los ejercicios de la rutina
		$ResultEjercicios = $consultar->_ConsultarInfoTotalEjerciciosPorIdRutina($id_rutina);
		$num_Ejercicios   = $ResultEjercicios->num_rows; //Num Ejercicios
		
		
		
		//se toma la información de cada ejercicio y se manda a la base de datos
		$ejercicios = array();
		for($i=0; $i<$num_Ejercicios; $i++)
		{
			$filaEjercicio = $ResultEjercicios->fetch_assoc(); //Se toma la primera fila del ejercicio.
			 
			 //Tomando los datos del ejercicio
			 $id_Ejercicio 		   	 = $filaEjercicio['id_Ejercicio'];
			 $id_dia 	   		   	 = $filaEjercicio['id_dia'];
			 $id_RutinaEj  		  	 = $filaEjercicio['id_Rutina'];	
			 $id_CategoriaRutinaEj	 = $filaEjercicio['id_Ejercicio'];
			 $id_TipoRutinaEjercicio = $filaEjercicio['id_TipoRutinaEjercicio'];
			 $id_PosicionEjercicio	 = $filaEjercicio['id_PosicionEjercicio'];
			 $num_Circuitos			 = $filaEjercicio['num_Circuitos'];
			 $num_Repeticiones		 = $filaEjercicio['num_Repeticiones'];
			 $ejercicio_relacion	 = $filaEjercicio['ejercicio_relacion'];
			 
			 //Creando un array y guardando los valores para mandarlos a un array total.
			 $ejercicio = array("id_Ejercicio"=>$id_Ejercicio,"id_dia"=>$id_dia,"id_Rutina"=>$id_RutinaCliente,
			 					"id_CategoriaRutinaEj"=>$id_CategoriaRutinaEj,"id_TipoRutinaEjercicio"=>$id_TipoRutinaEjercicio,
								"id_TipoRutinaEjercicio"=>$id_TipoRutinaEjercicio,"id_PosicionEjercicio"=>$id_PosicionEjercicio,
								"num_Circuitos"=>$num_Circuitos,"num_Repeticiones"=>$num_Repeticiones,"num_Repeticiones"=>$num_Repeticiones,
								"id_instructor"=>$id_instructor,"ejercicio_relacion"=>$ejercicio_relacion);	
								
			array_push($ejercicios,$ejercicio);
			//$ResultAgregarEjercicioRutinaCliente = $agregar->_RegistrarEjerciciosRutinaClienteAsignacion($id_Ejercicio,$id_instructor,$id_dia, $id_RutinaCliente, $id_CategoriaRutinaEj, $id_TipoRutinaEjercicio, $num_Circuitos, $num_Repeticiones, $id_PosicionEjercicio);
		}//for
		
		$ResultAgregarEjercicioRutinaCliente = $agregar->_RegistrarEjerciciosRutinaClienteAsignacion($ejercicios);
		$salidaJson=array("id_rutina"=>$id_RutinaCliente);
		return $salidaJson;
	}//AsignarRutinaACliente
	
	function DesactivarRutina($id_cliente)
	{
		date_default_timezone_set("Mexico/General");
		$consultar  = new Consultar();
		$agregar    = new Agregar();
		$actualizar = new Actualizar();
		$result		= $actualizar->_EliminarRutinaClientePorIdcliente($id_cliente);
		
	}//DesactivarRutina
	
	//Funciones de cambio de logar de la rutina de clientes
	
	function CambioLugarEjercicioSinPadre($id_Rutina,$id_Cambio,$id_Hijo, $Cantidad_Puestos)
	{
		
		$consultar  = new Consultar();
		$agregar    = new Agregar();
		$actualizar = new Actualizar();
		
		//Casos a definir 1) cuando la cantidad de puestos es 1 2) cuando la cantidad de puestos es mayor a 1
		
		//Caso 1) cuando la cantidad de puestos es 1, solo se hará un intercambio de valores
		if ($Cantidad_Puestos == 1)
		{
			//Obteniendo el id del id_PosicionEjercicio que fue movido
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaCambio 				 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteCambio 	 = $filaCambio['id_ejercicioRutinaCliente'];
			
			//Obtener el id del id_PosicionEjercicio hijo a intercambiar
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Hijo);
			$filaCambioHijo 			 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteHijo 	 = $filaCambioHijo['id_ejercicioRutinaCliente'];
			
			//Cambiando el valor para ambos, el que fue movido y el hijo.
			
			// 1)  id que fue movido
			$ResPosicionMovido = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteCambio, $id_Hijo);
			
			// 2) id del hijo, del id que fue movido
			$ResPosicionHijo   = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteHijo, $id_Cambio);
		}
		else  
		{
			//Caso 2) se tiene que hace run cambio por la cantidad de espacios recorridos
			
			//Obtener el id del ejercicio que contiene el id_PosicionEjercicio
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaIdEjercicioCambiar = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_ejercicioRutinaCliente = $filaIdEjercicioCambiar['id_ejercicioRutinaCliente']; //Id del ejercicio a cambairle la posición
			
			//Tomando el id desde el último a cambiarse hasta el primero, se hace desde el último para evitar repetidos u otros problemas
			
			$contador = 0;
			echo "Cambio, no padre más de un espacio";
			for($i=0; $i<$Cantidad_Puestos; $i++)
			{
				$contador++;
				$id_PosicionEjercicioCambiar = $id_Cambio-$contador;
				//Actualizando la posición del ejercicioo del último al primero
				$resulAc=$actualizar -> _ActualizarIdPosicionEjercicioPorIdRutinaYidPosicionEjercicio($id_Rutina, $id_PosicionEjercicioCambiar);
			
			}//for
			
			//Actualizando el id_PosicionEjercicio por el del hijo, que solía ser la primera posición
			
			//Cambiarle el id_PosicionEjercicio por el del id_hijo
			$ResPosicionActualiza = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_ejercicioRutinaCliente, $id_Hijo);
			
		} //else
	} //CambioLugarEjercicioSinPadre
	
	function CambioLugarEjercicioSinHijo($id_Rutina,$id_Cambio,$id_Padre, $Cantidad_Puestos)
	{
		$consultar  = new Consultar();
		$agregar    = new Agregar();
		$actualizar = new Actualizar();
		
		//Casos a definir 1) cuando la cantidad de puestos es 1 2) cuando la cantidad de puestos es mayor a 1
		
		//Caso 1) cuando la cantidad de puestos es 1, solo se hará un intercambio de valores
		if ($Cantidad_Puestos == 1)
		{
			//Obteniendo el id del id_PosicionEjercicio que fue movido
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaCambio 				 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteCambio 	 = $filaCambio['id_ejercicioRutinaCliente'];
			
			//Obtener el id del id_PosicionEjercicio hijo a intercambiar
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Padre);
			$filaCambioHijo 			 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteHijo 	 = $filaCambioHijo['id_ejercicioRutinaCliente'];
			
			//Cambiando el valor para ambos, el que fue movido y el hijo.
			
			// 1)  id que fue movido
			$ResPosicionMovido = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteCambio, $id_Padre);
			
			// 2) id del hijo, del id que fue movido
			$ResPosicionHijo   = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteHijo, $id_Cambio);
		}
		else  
		{
			//Caso 2) se tiene que hace run cambio por la cantidad de espacios recorridos
			
			//Obtener el id del ejercicio que contiene el id_PosicionEjercicio
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaIdEjercicioCambiar = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_ejercicioRutinaCliente = $filaIdEjercicioCambiar['id_ejercicioRutinaCliente']; //Id del ejercicio a cambairle la posición
			
			//Se debe tomar la posición del td que s emovió y sumarle la cantidad de de puestos que se bajó
			//Para ir avanzando se le va restando 1, por cada vez que entra al ciclo y así irá dando los números
			echo "Cambio, no hijo más de un espacio";
			$contador		 = 0;
			$Posicion_Cambio = $Cantidad_Puestos;
			for($i=0; $i<$Cantidad_Puestos; $i++)
			{
				$contador++;
				echo $id_PosicionEjercicioCambiar = $id_Cambio+$contador;
				//Actualizando la posición del ejercicioo del último al primero
				$resulAc=$actualizar -> _ActualizarIdPosicionEjercicioPorIdRutinaYidPosicionEjercicioResta($id_Rutina, $id_PosicionEjercicioCambiar);
				
			}//for
			
			//Actualizando el id_PosicionEjercicio por el del hijo, que solía ser la primera posición
			
			
			//Cambiarle el id_PosicionEjercicio por el del id_hijo
			$ResPosicionActualiza = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_ejercicioRutinaCliente, $id_Padre);
			
		} //else
	}//CambioLugarEjercicioSinHijo
	
	function ConAmbosBajoPosicion($id_Rutina,$id_Cambio,$id_Padre, $id_Hijo,$Cantidad_Puestos)
	{
		$consultar  = new Consultar();
		$agregar    = new Agregar();
		$actualizar = new Actualizar();
		
		//Casos a definir 1) cuando la cantidad de puestos es 1 2) cuando la cantidad de puestos es mayor a 1
		
		//Caso 1) cuando la cantidad de puestos es 1, solo se hará un intercambio de valores
		if ($Cantidad_Puestos == 1)
		{
			//Obteniendo el id del id_PosicionEjercicio que fue movido
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaCambio 				 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteCambio 	 = $filaCambio['id_ejercicioRutinaCliente'];
			
			//Obtener el id del id_PosicionEjercicio padre a intercambiar
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Padre);
			$filaCambioHijo 			 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClientPadre 	 = $filaCambioHijo['id_ejercicioRutinaCliente'];
			
			//Cuando se baja una sola posición en la lista y se tiene, padre he hijo, se hace meramente un intercambio de posiciones tal cual
			//Al que se le movió se le asigna la posición del padre y al pdre se le asigna la posición del que fue movido
			
			// 1)  id que fue movido
			$ResPosicionMovido = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteCambio, $id_Padre);
			
			// 2) id del hijo, del id que fue movido
			$ResPosicionHijo   = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClientPadre, $id_Cambio);
		}
		else
		{
			//caso 2= cuando la cantidad de puestos que se ha bajado es mayor que 1, se cuenta con padre he hijo.
			echo "ambos, bajó posición";
			//Obtener el id del ejercicio que contiene el id_PosicionEjercicio
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaIdEjercicioCambiar 	 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_ejercicioRutinaCliente 	 = $filaIdEjercicioCambiar['id_ejercicioRutinaCliente']; //Id del ejercicio a cambairle la posición
			
			$Inicio_Cambio = $id_Cambio + 1; //es desde donde se comienza a hacer el ajuste de posiciones.
			$contador 	   = 1; // Donde se da el incremento de posiciones.
			for ($i=0; $i<$Cantidad_Puestos; $i++)
			{
				//Actualizando la posición del ejercicioo del último al primero.
				$resulAc = $actualizar -> _ActualizarIdPosicionEjercicioPorIdRutinaYidPosicionEjercicioResta($id_Rutina, $Inicio_Cambio);
			 $Inicio_Cambio = $Inicio_Cambio + $contador;
			}//for
			//Actualizando el id_PosicionEjercicio por el del hijo, que solía ser la primera posición
			
			//Cambiarle el id_PosicionEjercicio por el del id_hijo
			$ResPosicionActualiza = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_ejercicioRutinaCliente, $id_Padre);
			
		}//else
	}//ConAmbosBajoPosicion
	
	function ConAmbosSubioPosicion($id_Rutina,$id_Cambio,$id_Padre, $id_Hijo,$Cantidad_Puestos)
	{
		$consultar  = new Consultar();
		$agregar    = new Agregar();
		$actualizar = new Actualizar();
		
		//Casos a definir 1) cuando la cantidad de puestos es 1 2) cuando la cantidad de puestos es mayor a 1
		
		//Caso 1) cuando la cantidad de puestos es 1, solo se hará un intercambio de valores
		if ($Cantidad_Puestos == 1)
		{
			//Obteniendo el id del id_PosicionEjercicio que fue movido
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaCambio 				 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClienteCambio 	 = $filaCambio['id_ejercicioRutinaCliente'];
			
			//Obtener el id del id_PosicionEjercicio padre a intercambiar
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Hijo);
			$filaCambioHijo 			 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_EjercicioClientPadre 	 = $filaCambioHijo['id_ejercicioRutinaCliente'];
			
			//Cuando se baja una sola posición en la lista y se tiene, padre he hijo, se hace meramente un intercambio de posiciones tal cual
			//Al que se le movió se le asigna la posición del padre y al pdre se le asigna la posición del que fue movido
			
			// 1)  id que fue movido
			$ResPosicionMovido = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClienteCambio, $id_Hijo);
			
			// 2) id del hijo, del id que fue movido
			$ResPosicionHijo   = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_EjercicioClientPadre, $id_Cambio);
		}//if
		else
		{
			//caso 2= cuando la cantidad de puestos que se ha bajado es mayor que 1, se cuenta con padre he hijo.
			
			//Obtener el id del ejercicio que contiene el id_PosicionEjercicio
			$ResultadoIdEjercicioCambiar = $consultar->_ConsultarId_EjercicioClientePorId_PosicionEjercicio($id_Rutina, $id_Cambio);
			$filaIdEjercicioCambiar 	 = $ResultadoIdEjercicioCambiar->fetch_assoc();
			$id_ejercicioRutinaCliente 	 = $filaIdEjercicioCambiar['id_ejercicioRutinaCliente']; //Id del ejercicio a cambairle la posición
			echo "ambos, subió posición";
			$Inicio_Cambio = $id_Cambio - 1; //es desde donde se comienza a hacer el ajuste de posiciones.
			$contador 	   = 1; // Donde se da el incremento de posiciones.
			for ($i=0; $i<$Cantidad_Puestos; $i++)
			{
				//Actualizando la posición del ejercicioo del último al primero.
				$resulAc = $actualizar -> _ActualizarIdPosicionEjercicioPorIdRutinaYidPosicionEjercicio($id_Rutina, $Inicio_Cambio);
				 $Inicio_Cambio = $Inicio_Cambio - $contador;
			}//for
			//Actualizando el id_PosicionEjercicio por el del hijo, que solía ser la primera posición
			
			//Cambiarle el id_PosicionEjercicio por el del id_hijo
			$ResPosicionActualiza = $actualizar->_ActualizarPosicionPorRutinaEjercicioYValor($id_Rutina,$id_ejercicioRutinaCliente, $id_Hijo);
		}//else
	}//ConAmbosSubioPosicion
	
	function ConsultarTiposCuerpo()
	{
		//Buscando los tipos de cuerpo existentes
		$consultar = new Consultar();
		$result    = $consultar->_ConsultarTiposCuerpo();
		$num_rows  = $result->num_rows;
		$cuerpos   = array();

		for($i=0; $i<$num_rows; $i++)
		{
			$fila   = $result->fetch_assoc();
			$cuerpo = array("id"=>$fila['id'],"nb_cuerpo"=>$fila['nb_cuerpo'],
				            "desc_tipocuerpo"=>$fila['desc_tipocuerpo'],
				            "url_img"=>$fila['url_img']);
			array_push($cuerpos, $cuerpo);
		}//for
		
		return $datos = array("cuerpos"=>$cuerpos);
	}//ConsultarTiposCuerpo
?>