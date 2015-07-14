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

.controller('RutinaAgregar',function($scope,$http,$location,$methodsService,$q,$cookies){
//Variables


//Funciones
$scope.AgregarRutina = function()
{
	//Si se llegó aquí es por que la rutina se puede registrar
	$scope.rutina.Accion = "AgregarRutina";
	//Tomando los textos de los días de rutina
  $scope.estructuraRutina();
  var lunes = $scope.rutina.lunes;

  $scope.estructuraRutina();
  $scope.TipoRutinaDias.lunes     = $("#lunes option:selected").text();
  $scope.TipoRutinaDias.martes    = $("#martes option:selected").text();
  $scope.TipoRutinaDias.miercoles = $("#miercoles option:selected").text();
  $scope.TipoRutinaDias.jueves    = $("#jueves option:selected").text();
  $scope.TipoRutinaDias.viernes   = $("#viernes option:selected").text();
  $scope.TipoRutinaDias.sabado    = $("#sabado option:selected").text();
  $scope.TipoRutinaDias.domingo   = $("#domingo option:selected").text();
  
  // Definiendo las cookies de los días.
  $cookies.put("TiposRutinasSemana",$scope.TipoRutinaDias);
  $cookies.put('id_CategoriaRutina', $scope.rutina.categoria);
  $cookies.put('Ejercicio_Lunes', $scope.TipoRutinaDias.lunes);
  $cookies.put('Ejercicio_Martes', $scope.TipoRutinaDias.martes);
  $cookies.put('Ejercicio_Miercoles', $scope.TipoRutinaDias.miercoles);
  $cookies.put('Ejercicio_Jueves', $scope.TipoRutinaDias.jueves);
  $cookies.put('Ejercicio_Viernes', $scope.TipoRutinaDias.viernes);
  $cookies.put('Ejercicio_Sabado', $scope.TipoRutinaDias.sabado);
  $cookies.put('Ejercicio_Domingo', $scope.TipoRutinaDias.domingo);
  $cookies.put('RutinasDias', $scope.rutina);

  var ContadorRutinasDias=0; //Contador para ir recorriendo ambos vectores, el de que valor tienes las categorías y el texto
  $cookies.put('ContadorRutinasDias', ContadorRutinasDias);

	//Definir el día actual para editar
  $cookies.put('Dia_ActualRutina', "Ejercicio_Lunes");  
  TipoRutina = $scope.TipoRutinaDias.lunes; //Tomando el tipo de rutina
  Tipo_RutinaActual=(TipoRutina!="Varios")?"Simple":"Compleja"; //Se toma el tipo de rutina que se ha seleccionado para ver a donde se 
  //Dirige al usuario, si a elegir varios tipos de rutina o ejercicios de forma directa.
  
   //Tipo de rutina a la que se mandará la primera opción si es Varios es rutina compleja, si no sencilla.
   $cookies.put('RutinasDias',Tipo_RutinaActual);
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
            $location.path('/RutinaComp').search({Day:DiaActual});
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
    lunes:"",
    martes:"",
    miercoles:"",
    jueves:"",
    viernes:"",
    sabado:"",
    domingo:""
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

.controller('RutinaCompleja',function($scope,$http,$location,$methodsService,$q,$cookies,$routeParams){
  //Variables
  $scope.id_dia    = $routeParams.Day;
  $scope.DiaActual = $methodsService.DefinirDia($scope.id_dia);

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
            var demo2 = $('.demo2').bootstrapDualListbox({
              nonSelectedListLabel: 'Non-selected',
              selectedListLabel: 'Selected',
              preserveSelectionOnMove: 'moved',
              moveOnSelect: false,
              nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
            });
            for(i=0; i<size; i++)
            {
              var object = $scope.tiposRut[i];
              var row ='<option value="'+object.id+'">'+object.nb_tiporutina+'</option>';
              console.log(row);
               demo2.append(row);
              demo2.bootstrapDualListbox('refresh');
             // $("#bootstrap-duallistbox-nonselected-list_duallistbox_demo2").append(row);
            }//for
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