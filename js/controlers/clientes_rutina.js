angular.module('AppClientesRutina',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('ClientesRutina',function($scope,$http,$location,$methodsService,$routeParams){
//Variables 
$scope.id = $routeParams.Cliente;

//Funciones
$scope.Redirigir = function(direccion)
  {
    $methodsService.Redirigir(direccion);
  }//Redirigir

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

  var ContadorRutinasDias = 0; //Contador para ir recorriendo ambos vectores, el de que valor tienes las categorías y el texto
  $cookies.put('ContadorRutinasDias', ContadorRutinasDias);

	//Definir el día actual para editar
  $cookies.put('Dia_ActualRutina', "Ejercicio_Lunes");  
  TipoRutina = $scope.TipoRutinaDias.Lunes; //Tomando el tipo de rutina
  Tipo_RutinaActual=(TipoRutina!="Varios")?"Simple":"Compleja"; //Se toma el tipo de rutina que se ha seleccionado para ver a donde se 
  //Dirige al usuario, si a elegir varios tipos de rutina o ejercicios de forma directa.
  
   //Tipo de rutina a la que se mandará la primera opción si es Varios es rutina compleja, si no sencilla.
   $cookies.put('Tipo_RutinaActual',Tipo_RutinaActual);
   DiaActual = $methodsService.VerificarDiaPorCodigo("Ejercicio_Lunes");

   //Registrar la rutina
   params = JSON.stringify($scope.rutina);
  var url = 'modulos/Clientes/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito = data.exito;
          if(exito==1)
          {
            //si llegó quí es que se va a registrar la rutina debes mandar por 
            //parámetro get el id de la sesión,en el proyecto viejo se guarda en sesión.
            // Se debe retornar el id de la rutina agregada y guardar en cookie.
            id_rutina = data.id_rutina;
             $cookies.put("id_rutina",id_rutina);
            console.log(Tipo_RutinaActual);
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

//Verificando si el cliente tiene una rutina asignada.
params = $methodsService.Json("ExisteRutinaCliente",$scope.id);
var url = 'modulos/Clientes/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		cantidad = data.cantidad;
       		if(cantidad>0)
       		{
       			pagina = 1;
       		}//if
       		else{pagina = 0;}
       		
       		$scope.obtenerdir(pagina);
       		console.log($scope.url);
			
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

$scope.obtenerdir = function(pagina)
{
	var direccion="";

	switch(pagina)
	{
		case 0:
			$scope.url  = 'modulos/Clientes/paginas/rutinas_registrar.html';
		break;

		case 1:
			$scope.url = 'modulos/Clientes/paginas/rutinas_desasignar.html';
		break;
	}//switch

	return direccion;
}//obtenerdir

$scope.ContinuarR = function()
{
	bootbox.confirm("Desea eliminar la rutina del cliente?.", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			params = $methodsService.Json("DesactivarRutina",$scope.id); var url = 'modulos/Clientes/Funciones.php';
			     $http({method: "post",url: url,data: $.param({Params:params}), 
			      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			    })
			     .success(function(data, status, headers, config) 
			     {          	
		       		exito = data.exito;
		       		if(exito==1)
		       		{
		       			$location.path('/ClientesRutina').search({id:$scope.id});
		       		}//if
		       		
		      }) .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
	  		});
	  	}//if
	});
}//ContinuarR

})