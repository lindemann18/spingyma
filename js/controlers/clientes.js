angular.module('AppClientes',['ngRoute','angularUtils.directives.dirPagination','Methods'])

.controller('Clientes',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
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
	  			$location.path('/EditarCliente').search({cliente:$scope.clitr});
	  		});
	  	}//if
	});
	}//if
	else{$methodsService.alerta(2,"Favor de seleccionar un Cliente");}
}//Agregar

$scope.Eliminar = function()
{
	if($scope.clitr!=0)
	{
		bootbox.confirm("Desea Editar este Cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			params = $methodsService.Json("EliminarCliente",$scope.clitr);
	  			//Enviando por ajax la peetición
	  			var url = 'modulos/Clientes/Funciones.php';
				 $http({method: "post",url: url,data: $.param({Params:params}), 
				  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				})
				 .success(function(data, status, headers, config) 
				 {          	
				   		exito    = data.exito;
				   		exitocli = data.exitocli;
			         	
			         	switch(true)
			         	{
			         		case exito==1 && exitocli==1:
			         			$scope.clientes = data.clientes;
			         			$methodsService.alerta(1,"Cliente Eliminado");
			         		break;

			         		case exito!=1 && exitocli!=1:
			         			$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         		break;
			         	}//switch
				  })  
				 .error(function(data, status, headers, config){
				 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				 });
	  		});
	  	}//if
	});
	}//if
	else{$methodsService.alerta(2,"Favor de seleccionar un Cliente");}
}//Eliminar

//Buscando los clientes
//Buscando las pruebas por la número 1, condición física
params = $methodsService.Json("Clientes",1);
var url = 'modulos/Clientes/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito    = data.exito;
       		exitoent = data.exito;

       		switch(true)
       		{
       			case exito==1 && exitoent==1:
       				$scope.clientes        = data.clientes;
       				$scope.entrenadores    = data.entrenadores;
	       			$scope.mostrarbuscando = false;	
					$scope.mostrarcontent  = true;	
       			break;

       			case exito!=1 && exitoent!=1:
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
//Variables
//Días
$scope.dias = $methodsService.dias();
//meses
$scope.meses =$methodsService.meses();
//años
$scope.years = $methodsService.years();

//Funciones
$scope.modal = function()
{
	$("#ModalCuerpo").modal("show");
}//modal

$scope.Editar = function()
{
	bootbox.confirm("Desea Editar este cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.cliente.Accion = "Editarcliente";
	  		params   			  = JSON.stringify($scope.cliente);
	  		var url = 'modulos/Clientes/Funciones.php';
		         $http({method: "post",url: url,data: $.param({Params:params}), 
		          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
		        })
		         .success(function(data, status, headers, config) 
		         {          	
			         	exito = data.exito;
			         	if(exito==1)
			         	{
			         		$methodsService.alerta(1,"Cliente Editado");
			         	}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
		          })  
		         .error(function(data, status, headers, config){
		         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
		         });
	  	}//if
	});//bootbox
}//Editar

$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

$scope.id = $routeParams.cliente;
params    = $methodsService.Json("InfoCliente",$scope.id);
//Mandando por ajax el ejercicio a eliminar
  		var url = 'modulos/Clientes/Funciones.php';
	     $http({method: "post",url: url,data: $.param({Params:params}), 
	      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	    })
	     .success(function(data, status, headers, config) 
	     {          	
	       		exito = data.exito;
	       		if(exito==1)
	       		{
	       			$scope.cliente = data.cliente;
	       			console.log($scope.cliente);
	       		}//if
	       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	      })  
	     .error(function(data, status, headers, config){
	     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	     });
})//ClientesEditar