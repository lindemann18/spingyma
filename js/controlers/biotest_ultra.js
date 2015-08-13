angular.module('AppBiotestUltra',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies',"highcharts-ng"])

.controller('BiotestUltra',function($scope,$http,$location,$methodsService,$routeParams){
	//Buscando las pruebas por la número 1, condición física
	//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
$scope.clitr           = 0;
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
					console.log($scope.entrenadores);
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
})