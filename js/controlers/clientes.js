angular.module('AppClientes',['ngRoute','angularUtils.directives.dirPagination','Methods'])

.controller('Clientes',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.clitr           = 0;

//Funciones
$scope.Selecciontr = function(tr)
{
	//Verificando que no se le hizo click al mismo tr
	if(tr.cli.id == $scope.clitr)
	{
		//Si es el mismo tr se le asigna un 0.
		$scope.clitr = 0;
		idtr = "#table"+tr.cli.id;
		$(idtr).removeClass("bg-blue");
		console.log($scope.clitr);
	}//if
	else
	{
		$("tr").removeClass("bg-blue");
		$scope.clitr = tr.cli.id;
		idtr          = "#table"+tr.cli.id;
		$(idtr).addClass("bg-blue");
		console.log($scope.clitr);
	}
	
	//añadiendo la clase al tr
}//Selecciontr

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar un Cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/AgregarCliente').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.Editar = function()
{	
	if($scope.clitr!=0)
	{
		bootbox.confirm("Desea Editar este Cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/EditarCliente').search({cliente:});
	  		});
	  	}//if
	});
	}//if
	else{$methodsService.alerta(2,"Favor de seleccionar un cliente");}
}//Agregar

//Buscando los clientes
//Buscando las pruebas por la número 1, condición física
params = $methodsService.Json("Clientes",1);
var url = 'modulos/Clientes/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito = data.exito;
       		if(exito==1)
       		{
       			$scope.clientes = data.clientes;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarcontent  = true;	
	
       		}//if
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//Clientes


.controller('ClientesAgregar',function($scope,$http,$location,$methodsService){

	//Generando los datos para el formulario

	//Días
	$scope.dias = $methodsService.dias();
	
	//meses
	$scope.meses =$methodsService.meses();

	//años
	$scope.years = $methodsService.years();
	

	//funciones
	$scope.Agregar = function()	
	{
		//verificando el tipo de cuerpo
		if($scope.cliente.id_cuerpo==	undefined)
		{
			bootbox.confirm("Favor de elegir un tipo de cuerpo", function(result) {}); //bootbox
		}
		else
		{
			bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
				//Mandando la petición AJAX al controller.
				$scope.cliente.Accion = "AgregarCliente";
				params  = JSON.stringify($scope.cliente);
	  			var url = 'modulos/Clientes/Funciones.php';
		         $http({method: "post",url: url,data: $.param({Params:params}), 
		          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
		        })
		         .success(function(data, status, headers, config) 
		         {          	
		         	exito = data.exito;
		         	if(exito==1)
		         	{
		         		$methodsService.alerta(1,"Cliente Agregado!");
		         		$scope.cliente = {};
		         	}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
		          })  
		         .error(function(data, status, headers, config){
		         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
		         });
	     	}//if
	     });//botbox
		}//else
	}//Agregar

	$scope.modal = function()
	{
		$("#ModalCuerpo").modal("show");
	}//modal

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

})

.controller('ClientesEditar',function($scope,$http,$location,$methodsService,$routeParams){

	$scope.id = $routeParams.cliente;

})