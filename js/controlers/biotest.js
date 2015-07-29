angular.module('AppBiotest',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('BiotestC',function($scope,$http,$location,$methodsService,$routeParams){
//Funciones
$scope.cliente = $routeParams.Cliente;
$scope.EjecutarTest = function()
{
	bootbox.confirm("Desea ejecutar el biotest?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.biotest.Accion  = "EjecutarTest";
	  			$scope.biotest.cliente = $scope.cliente;
	  			var params = JSON.stringify($scope.biotest);
	  			var url = 'modulos/Biotest/Funciones.php';
				 $http({method: "post",url: url,data: $.param({Params:params}), 
				  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				})
				 .success(function(data, status, headers, config) 
				 {          	
				   		
				  })  
				 .error(function(data, status, headers, config){
				 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				 });
	  		});
	  	}//if
	});
}//EjecutarTest

})