angular.module('Rutinas',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('infoRutinas',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
$scope.clitr           = 0;
$scope.disablebtn      = false;

//funciones

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar una rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/AgregarRutina').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.FiltrarRutinas = function()
{
	$scope.rutina.Accion = "FiltrarRutinas";
	params   			 = JSON.stringify($scope.rutina);
	$scope.disablebtn    = true;
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		$scope.disablebtn = false;
       		exito  		      = data.exito;
       		if(exito==1)
       		{
       			cantidad = data.cantidad;
       			if(cantidad>0)
       			{
       				$methodsService.alerta(1,"Rutinas Filtradas");
       				$scope.rutinas = data.rutinas;
       			}//if
       			else{$methodsService.alerta(2,"No existen rutinas con estos criterios");}
       		}
       		else
       		{
       			$methodsService.alerta(2,"algo falló, disculpe las molestias");
       		}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//FiltrarRutinas

$scope.CategoriasporEnt = function()
{
	if($scope.rutina.entrenador!=undefined)
	{
		//Buscando las catgegorias
	params = $methodsService.Json("BuscarCategoriasPorEntrenador",$scope.rutina.entrenador);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito  = data.exito;
       		exitog = data.exitog;
       		if(exito==1)
       		{
       			$scope.tipos_rut = data.tipos_rut;
       			$scope.generos   = data.generos;
       		}//if
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}//if
	
}//CategoriasporEnt

//Buscando las rutinas
params = $methodsService.Json("Rutinas",1);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito    = data.exito;
       		exitot   = data.exitot;
       		exitog   = data.exitog;
       		exitoe   = data.exitoe;
       		switch(true)
       		{
       			case exito==1 && exitot==1 && exitog==1 && exitoe==1:
       				$scope.rutinas        = data.rutinas;
       				$scope.entrenadores    = data.entrenadores;
	       			$scope.mostrarbuscando = false;	
					$scope.mostrarcontent  = true;
					console.log($scope.entrenadores);
       			break;

       			case exito!=1 || exitot!=1 || exitog!=1 || exitoe!=1:
       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			break;
       		}//switch
       		if(exito==1)
       		{
       			
	
       		}//if
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})

.controller('RutinaAgregar',function($scope,$http,$location,$methodsService,$q,$cookies,$rootScope){
//Variables
var cookies = $cookies.getAll();
angular.forEach(cookies, function (v, k) {
    $cookies.remove(k);
});

//Funciones
$scope.AgregarRutina = function()
{
	//Si se llegó aquí es por que la rutina se puede registrar
	$scope.rutina.Accion = "AgregarRutina";
	//Tomando los textos de los días de rutina
  
  var lunes = $scope.rutina.lunes;

  $scope.estructuraRutina(); //Inicializando el objeto TipoRutinaDias
  $scope.TipoRutinaDias.Lunes     = $("#lunes option:selected").text();
  $scope.TipoRutinaDias.Martes    = $("#martes option:selected").text();
  $scope.TipoRutinaDias.Miercoles = $("#miercoles option:selected").text();
  $scope.TipoRutinaDias.Jueves    = $("#jueves option:selected").text();
  $scope.TipoRutinaDias.Viernes   = $("#viernes option:selected").text();
  $scope.TipoRutinaDias.Sabado    = $("#sabado option:selected").text();
  $scope.TipoRutinaDias.Domingo   = $("#domingo option:selected").text();
  var resps = JSON.stringify($scope.TipoRutinaDias);
  $cookies.put('TiposRutinasSemana', resps)
  // Definiendo las cookies de los días.
  //$cookies.put("TiposRutinasSemana",$scope.TipoRutinaDias);
  $cookies.put('id_categoriarutina', $scope.rutina.categoria);
  $cookies.put('Ejercicio_Lunes', $scope.TipoRutinaDias.lunes);
  $cookies.put('Ejercicio_Martes', $scope.TipoRutinaDias.martes);
  $cookies.put('Ejercicio_Miercoles', $scope.TipoRutinaDias.miercoles);
  $cookies.put('Ejercicio_Jueves', $scope.TipoRutinaDias.jueves);
  $cookies.put('Ejercicio_Viernes', $scope.TipoRutinaDias.viernes);
  $cookies.put('Ejercicio_Sabado', $scope.TipoRutinaDias.sabado);
  $cookies.put('Ejercicio_Domingo', $scope.TipoRutinaDias.domingo);

  //DEfiniendo el array de rutina días
  var RutinasDias = new Array();
  RutinasDias.push($scope.rutina.lunes)
  RutinasDias.push($scope.rutina.martes)
  RutinasDias.push($scope.rutina.miercoles)
  RutinasDias.push($scope.rutina.jueves)
  RutinasDias.push($scope.rutina.viernes)
  RutinasDias.push($scope.rutina.sabado)
  RutinasDias.push($scope.rutina.domingo)
  var respsrutinas = JSON.stringify(RutinasDias);
  $cookies.put('RutinasDias', respsrutinas);
 // console.log($cookies.get('RutinasDias'));

  var ContadorRutinasDias=0; //Contador para ir recorriendo ambos vectores, el de que valor tienes las categorías y el texto
  $cookies.put('ContadorRutinasDias', ContadorRutinasDias);

	//Definir el día actual para editar
  $cookies.put('Dia_ActualRutina', "Ejercicio_Lunes");  
  TipoRutina = $scope.TipoRutinaDias.lunes; //Tomando el tipo de rutina
  Tipo_RutinaActual=(TipoRutina!="Varios")?"Simple":"Compleja"; //Se toma el tipo de rutina que se ha seleccionado para ver a donde se 
  //Dirige al usuario, si a elegir varios tipos de rutina o ejercicios de forma directa.
  
   //Tipo de rutina a la que se mandará la primera opción si es Varios es rutina compleja, si no sencilla.
   $cookies.put('Tipo_RutinaActual',Tipo_RutinaActual);
   DiaActual = $methodsService.VerificarDiaPorCodigo("Ejercicio_Lunes");

   //Registrar la rutina
   params = JSON.stringify($scope.rutina);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito = data.exito;
          if(exito==1)
          {
            //si llegó quí es que se va a registrar la rutina
            //debes mandar por parámetro get el id de la sesión, 
            // en el proyecto viejo se guarda en sesión
            if(Tipo_RutinaActual!="Compleja")
            {
              $location.path('/AgregarRutina2').search({Day:DiaActual,Rut:$scope.rutina.lunes});
            }
            else{$location.path('/RutinaComp').search({Day:DiaActual});}
            
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
          }
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//AgregarRutina

$scope.estructuraRutina = function()
{
  $scope.TipoRutinaDias = {
    Lunes:"",
    Martes:"",
    Miercoles:"",
    Jueves:"",
    Viernes:"",
    Sabado:"",
    Domingo:""
  };
}//estructuraRutina 

$scope.veriricarRutina = function()
{
	bootbox.confirm("Desea Agregar esta rutina?", function(result) {
		$scope.rutina.Accion = "VerificarRutina";
		// Buscando que no exista una rutina con ese nombre y para esas
		// características
		params = JSON.stringify($scope.rutina);
		var url = 'modulos/Rutinas/Funciones.php';
		     $http({method: "post",url: url,data: $.param({Params:params}), 
		      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
		    })
		     .success(function(data, status, headers, config) 
		     {          	
		       		exito =  data.exito;
		       		if(exito==1)
		       		{
		       			$scope.AgregarRutina();
		       		}else{$methodsService.alerta(2,"ya existe una rutina con esos criterios");}
		      })  
		     .error(function(data, status, headers, config){
		     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
		     });
		     	
		});
}//veriricarRutina
	
	//Buscando las categorías de las rutinas.
	params = $methodsService.Json("RutinasAgregarCategorias",1);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		//Tomando los datos
       		exitot = data.exitot;
       		exitog = data.exitog;
       		exitoc = data.exitoc;
       		exitor = data.exitor;
       		console.log(data);
       		switch(true)
       		{
       			case exitot==1 && exitog==1 && exitoc==1 && exitor==1:
       				//Tomando los arrays de criterios
       				$scope.generos  = data.generos;
       				$scope.cuerpos  = data.cuerpos;
       				$scope.cat_rut  = data.cat_rut;
       				$scope.tiposRut = data.tiposRut;
       			break;

       			case exitot!=1 || exitog!=1 || exitoc!=1 || exitor!=1:
       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			break;

       		}//switch
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})//RutinaAgregar

.controller('RutinaCompleja',function($scope,$http,$location,$methodsService,$q,$cookies,$routeParams,$rootScope){
  //Variables
  $scope.id_dia    = $routeParams.Day;
  $scope.DiaActual = $methodsService.DefinirDia($scope.id_dia);
  $scope.btnactiv  = false;
  console.log($cookies.get('id_categoriarutina'));

  //funciones
  $scope.ComenzarSeleccion = function()
  {
    bootbox.confirm("Desea agregar estos tipos de rutina?", function(result) {
    if(result==true)
      {
        $scope.$apply(function(){
             //Tomando las tipos de rutina
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2");

            if(CantidadTiposRutina.length==$scope.tiposRut.length)
            {
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
            }//if
            else
            {
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                DiaRutina=new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  TipoRutina=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  DiaRutina.push(TipoRutina); //Insertando las Rutinas en el array.
                });//each
                console.log(DiaRutina);
                Contador         = 0;//Contador de actividades
                TotalActividades = DiaRutina.length;
                $cookies.put("Contador",Contador); //Se guarda en una cookie para ir acarreando el dato.
                $cookies.put("TotalActividades",TotalActividades); //Número total de actividades con el que se comara el contador.
                $cookies.put("DiaRutina",DiaRutina); //Vector con las rutinas que deben hacerse.
                Rut=DiaRutina[Contador];
                //Redirigiendo a la selección de ejercicios.
                $location.path('/AgregarRutina2').search({Day:$scope.id_dia,Rut:Rut});
            } //ELSE              
        });
      }//if
  });
  }//ComenzarSeleccion

  //inicializando el bootlist
  var demo2 = $('.demo2').bootstrapDualListbox({
          nonSelectedListLabel: 'Non-selected',
          selectedListLabel: 'Selected',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false
        });

  //Buscar la información
  params = $methodsService.Json("InfoRutinaCompleja",1);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exitor = data.exitor;
          if(exitor==1)
          {
            $scope.tiposRut = data.tiposRut;
            //console.log($scope.tiposRut);
            //Pegando los tipos rut en la tabla de selección
            var size = $scope.tiposRut.length;
            
            for(i=0; i<size; i++)
            {
              var object = $scope.tiposRut[i];
              var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_tiporutina+'</option>';
              demo2.append(row);
            }//for
             demo2.bootstrapDualListbox('refresh');
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");      
          }
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//RutinaCompleja

.controller('RutinaAgregar2',function($scope,$http,$location,$methodsService,$q,$cookies,$routeParams,$rootScope){
 //Variables
 $scope.Day = $routeParams.Day;
 $scope.Rut = $routeParams.Rut;
 $scope.dia = $methodsService.DefinirDia($scope.Day);

 //Funciones
 $scope.FuncionDia = function(dia)
 {
    rutina = "";
    switch(dia)
    {
      case '1':
        rutina = $scope.TiposRutinasVector.lunes;
      break;

      case '2':
        rutina = $scope.TiposRutinasVector.martes;
      break;

      case '3':
        rutina = $scope.TiposRutinasVector.miercoles;
      break;

      case '4':
        rutina = $scope.TiposRutinasVector.jueves;
      break;

      case '5':
        rutina = $scope.TiposRutinasVector.viernes;
      break;

      case '6':
        rutina = $scope.TiposRutinasVector.sabado;
      break;

      case '7':
        rutina = $scope.TiposRutinasVector.domingo;
      break;
    }//switch
    return rutina;
 }//FuncionDIa

 $scope.GuardarEjercicios = function()
 {
    //Verificando si se eligieron ejercicios
     $scope.btnactiv = true;
     bootbox.confirm("Desea agregar estos ejercicios?", function(result) {
    if(result==true)
      {
        $scope.$apply(function(){
             //Tomando las tipos de rutina
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2");

            if(CantidadTiposRutina.length==$scope.ejercicios.length)
            {
                //Si entra aquí es por que no había ejercicios seleccionados.
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
                $scope.btnactiv = false;
            }//if
            else
            {
                $scope.btnactiv = false;
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                EjerciciosRutina = new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  TipoRutina=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  EjerciciosRutina.push(TipoRutina); //Insertando las Rutinas en el array.
                });//each
                
                //Aquí se procede a obtener los datos para guardar los ejercicios.
                CantidadEjercicios  = DiaRutina.length;
                id_tiporutina       = $scope.ejercicios[0].id_tiporutina;
                id_CategoriaRutina  = $cookies.get("id_categoriarutina");
                Arr=new Object();
                Arr['id_dia']             = $scope.Day;
                Arr['id_CategoriaRutina'] = $cookies.get("id_categoriarutina");     
                Arr['EjerciciosRutina']   = EjerciciosRutina;
                Arr['CantidadEjercicios'] = CantidadEjercicios;
                Arr['id_TipoRutina']      = $scope.Rut;
                Arr['Accion']             = "RegistrarEjerciciosRutinas";
                var Params= JSON.stringify(Arr);
                //Mandando por ajax a guardar 
               
                // Verificando el tipo de rutina actual, si es compleja o simple
                var url = 'modulos/Rutinas/Funciones.php';
                 $http({method: "post",url: url,data: $.param({Params:Params}), 
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }})
                 .success(function(data, status, headers, config) 
                 {            
                      exito = data.exito;
                      if(exito==1)
                      {
                        var Tipo_RutinaActual = $cookies.get("Tipo_RutinaActual"); //tipo de rutina
                          //si tuvo exito se procede a continuar con la siguiente etapa
                          if(Tipo_RutinaActual=="Compleja")
                          {
                              //Rutina Compleja
                              // se toman los datos para continuar con el procedimiento.
                               Contador         = $cookies.get("Contador"); //Las cantidades actuales que se llevan registradas.
                               TotalActividades = $cookies.get("TotalActividades");  //Total de cantidades  de tipos de rutina que se definirán.
                               Contador++; //Se aumenta el contador para decir que ya va una más registrada
                               Dia_ActualRutina = $cookies.get('Dia_ActualRutina');
                               Rutina           = $cookies.get("DiaRutina");
                               DiaRutina        = Rutina.split(","); //Dia 
                               rut              = DiaRutina[Contador];
                              //Verificando en que tipo de rutina se encuentra, simple o compleja.
                               if(Contador==TotalActividades)
                                {
                                  // Aquí es cuando llegaste al tope de tipos de rutina para 
                                  // un solo día
                                  Dia_Codigo       = $methodsService.CambiarDiaActualRutina(Dia_ActualRutina); //Se cambia el día de la rutina
                                  $scope.DiaActual = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                                  //$cookies.put("Dia_ActualRutina",Dia_Codigo);//Se asigna a la variable de sesión el nuevo día de rutina.

                                  //Obtener que tipo de rutina será la del siguiente día
                                  ContadorRutinasDias = $cookies.get("ContadorRutinasDias"); //Contador. 
                                  ContadorRutinasDias++;
                                  $cookies.put("ContadorRutinasDias",ContadorRutinasDias); //Contador.
                                  console.log("el contador de días: "+ContadorRutinasDias);
                                  //Trayendo ambos vectores, valor de tipo rutina y su texto
                                  var RutinasVector       = $cookies.get('RutinasDias');
                                  var TiposRutinasVector  = $cookies.get('TiposRutinasSemana');
                                  

                                  //Separando ambos con split para poder acceder y evitar contar las "," como parte del vector.
                                  RutinasDias             = RutinasVector.split(",");
                                  TiposRutinasVector      = TiposRutinasVector.split(",");

                                  //Cambiar el tipo de rutina actual, ya sea sencilla o complicada.
                                  var rut                        = RutinasDias[ContadorRutinasDias]; //Tipo de rutina que será, es número
                                  var Tipo_RutinaActualVerificar = TiposRutinasVector[ContadorRutinasDias]; //Tomando el valor para verificar si es simple o compleja
                                  var Tipo_RutinaActual          = (Tipo_RutinaActualVerificar!="Varios")?"Simple":"Compleja"; //Definiendo que es
                                  var Rut = rut.split('"',2);
                                  Rut = Rut[1];
                                  console.log(Rut);
                                  console.log(Tipo_RutinaActualVerificar);
                                  console.log(Tipo_RutinaActual);
                                  console.log("dia codigo: "+Dia_Codigo);
                                  $scope.Day = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                                  $cookies.put("Tipo_RutinaActual",Tipo_RutinaActual); // Actualizando la cookie.
                                  if(Dia_Codigo=="Ejercicio_Terminado")
                                  {
                                      // Si entra aquí es que la rutina ya se terminó.
                                  }//if
                                  else
                                  {
                                      // SI entra aquí es por que la rutina todavía continua.
                                      // Verificando si el siguiente día es rutina sencilla o compleja.
                                      if(Tipo_RutinaActual=="Compleja")
                                      {
                                        //$location.path('/RutinaComp').search({Day:$scope.Day});
                                      }//if
                                      else
                                      {
                                        $location.path('/AgregarRutina2').search({Day:$scope.Day,Rut:Rut});
                                      }
                                  }//else
                                }//if
                                else
                                {
                                  //Aquí es cuando debes seguir con más actividades
                                  $cookies.put("Contador",Contador); // Actualizando la cookie de contador.
                                  $scope.day = $methodsService.VerificarDiaPorCodigo(Dia_ActualRutina);
                                  console.log($scope.day+" "+rut);
                                  $location.path('/AgregarRutina2').search({Day:$scope.day,Rut:rut});
                                }//else
                          }//if

                          //rutina Sencilla
                          else
                          {
                              //Si entra aquí es porq ue era una rutina sencilla.
                              var Dia_ActualRutina = $cookies.get("Dia_ActualRutina"); //Día en el que se encuentra el proceso de rutinas
                              var Dia_Codigo       = $methodsService.CambiarDiaActualRutina(Dia_ActualRutina); //Se cambia el día de la rutina
                              var DiaActual        = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                              //$cookies.put("Dia_ActualRutina",Dia_Codigo); // Actuañozamdp eñ nuevo día

                              //Obtener que tipo de rutina será la del siguiente día
                              ContadorRutinasDias  = $cookies.get("ContadorRutinasDias");
                              ContadorRutinasDias++;
                              console.log(ContadorRutinasDias);
                              //$cookies.put("ContadorRutinasDias",ContadorRutinasDias); //Actualizando el contador
                              //Trayendo ambos vectores, valor de tipo rutina y su texto
                              var RutinasVector      = JSON.parse($cookies.get("RutinasDias"));
                              var TiposRutinasVector = JSON.parse($cookies.get("TiposRutinasSemana"));
                              console.log(RutinasVector);
                              console.log(TiposRutinasVector);
                              //Separando ambos con split para poder acceder y evitar contar las "," como parte del vector.
                             // var RutinasDias        = RutinasVector.split(",");
                              //var TiposRutinasVector = TiposRutinasVector.split(",");
                              
                              //Cambiar el tipo de rutina actual, ya sea sencilla o complicada.
                              // Se saca el nombre del día en NombreDia para acceder en TiposRutinasVector
                              // Al valor que contiene para ese día el tipo de rutina.
                              rut                        = RutinasVector[ContadorRutinasDias]; //Tipo de rutina que será, es número
                              var NombreDia              = $methodsService.DefinirDia(DiaActual); // para sacar el tipo de rutina del objeto de tipos de rutina
                              Tipo_RutinaActualVerificar = TiposRutinasVector[NombreDia]; //Tomando el valor para verificar si es simple o compleja
                              
                              Tipo_RutinaActual = (Tipo_RutinaActualVerificar!="Varios")?"Simple":"Compleja"; //Definiendo que es
                              //$cookies.put("Tipo_RutinaActual",Tipo_RutinaActual); // Actualizando la cookie.
                              //Se verifica si es el último día de la semana, para pasar al final de la rutina
                              console.log(Tipo_RutinaActual);
                              if(Dia_Codigo=="Ejercicio_Terminado")
                              {
                                  //Aquí se termina y se manda al rutina Orden
                              }
                              else
                              {
                                //Si el siguiente día tiene rutina compleja se dirige a elegir los ejercicios de la rutina de esedía
                                if(Tipo_RutinaActual=="Compleja")
                                {
                                  $location.path('/RutinaComp').search({Day:DiaActual});
                                } //if compleja
                                else{$location.path('/AgregarRutina2').search({Day:DiaActual,Rut:rut});}
                              }//else
                          }//else
                      }else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
                  })  
                 .error(function(data, status, headers, config){ $methodsService.alerta(2,"algo falló, disculpe las molestias");});
                
            } //ELSE              
        });
      }//if
  });
 }//GuardarEjercicios

 //Situaciones


 //inicializando el bootlist
  var demo2 = $('.demo2').bootstrapDualListbox({
          nonSelectedListLabel: 'Non-selected',
          selectedListLabel: 'Selected',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false
  });

  //Obteniendo los datos de las cookies.
  //Añadiendo la cabeza del tipo de rutina que tendrá
  ContadorRutinasDiasTitulo = $cookies.get("ContadorRutinasDias"); //Contador.
  TiposRutinasSemana = $cookies.get('TiposRutinasSemana');
  $scope.TiposRutinasVector = JSON.parse(TiposRutinasSemana); // Tomando los valores para los dias de rutina
  $scope.nombreDia = $methodsService.DefinirDia($scope.Day); // Definiendo el nombre del día
  var tiporutinaPordia = $scope.TiposRutinasVector[$scope.nombreDia]; //Tomando el tipo de rutina por dia
  $scope.TipoRutinaTitulo = "Tipo de Rutina: "+tiporutinaPordia; // Asignando el scope el texto
  
  //Variables para manejo de rutina
  $scope.DiaActual       = 0;
  $scope.RutinaSiguiente = 0;

 //Buscando los ejercicios por tipos de rutina.
 params = $methodsService.Json("BuscarEjerciciosPorRutina",$scope.Rut);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito =  data.exito;
          if(exito==1)
          {
            $scope.ejercicios = data.ejercicios;
            //Pegando los datos al select
            var size = $scope.ejercicios.length;
            
            for(i=0; i<size; i++)
            {
              var object = $scope.ejercicios[i];
              var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_ejercicio+'</option>';
              demo2.append(row);
            }//for
             demo2.bootstrapDualListbox('refresh');
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");      
          }//else
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})