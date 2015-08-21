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

//funciones 
$scope.AplicarBiotest = function(id)
{ 
   bootbox.confirm("Desea aplicar el biotest a este cliente?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/BiotestUltraMenu').search({Cliente:id});
        });
      }//if
  });
}//AplicarBiotest

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

.controller('BiotestUltraC',function($scope,$http,$location,$methodsService,$routeParams){
  // Variables
  $scope.cliente = $routeParams.Cliente;
  $scope.dias    = 0;
  //Funciones
  $scope.Aplicar = function()
  {
      bootbox.confirm("Desea aplicar el biotest a este cliente?", function(result) {
      console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/BiotestUltraAplicar').search({Cliente:$scope.cliente,Action:1});
        });
      }//if
  });
  }//Aplicar
})

.controller('UltraBiotest',function($scope,$http,$location,$methodsService,$routeParams){
$scope.cliente = $routeParams.Cliente;
$scope.Action  = $routeParams.Action;
$scope.Peso    = {Peso:"",Altura:"",Accion:"",Cliente:""}
$scope.btndes  = true;
//Evaluando lo que se debe hacer dependiendo de la acción.


//funciones
$scope.PesoEvaluar = function()
{
  bootbox.confirm("Desea Aplicar el test de peso?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.Peso.Accion  = "Peso";
            $scope.Peso.cliente = $scope.cliente;
            var params = JSON.stringify($scope.Peso);
            $scope.btndes  = false;
            // Enviadno por AJAX los datos.
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
               $scope.btndes  = true;
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });
      }//if
    });
}//Peso


$scope.Paginas = function(result,action)
{
  
}//Paginas

$scope.Evaluar = function(action)
{
    accion = parseInt(action);
    switch(accion)
    {
      case 1:
        // En este caso se va a iniciar el biotest ultra, se 
        // Evalua si ya se hizo un biotest light o un ultra previamente.
        var params = $methodsService.Json("UltimoBiotestCliente",$scope.cliente);
        var url = 'modulos/BiotestUltra/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {            
              $scope.permiso      = data.permiso;
              $scope.PermisoU     = data.PermisoU;
              $scope.Dias_trans   = data.Dias_trans;
              $scope.Dias_transUl = data.Dias_transUl;
              console.log(data);
              switch(true)
              {
                  case $scope.permiso ==1 &&  $scope.PermisoU==1:
                    $scope.url = "modulos/BiotestUltra/paginas/peso.html";
                  break;

                  case $scope.permiso ==1 &&  $scope.PermisoU==1:
                    $scope.url = "modulos/BiotestUltra/paginas/peso.html";
                    if($scope.Dias_trans>$scope.Dias_transUl)
                    {
                      $scope.dias = $scope.Dias_transUl;
                    }else{$scope.dias =$scope.Dias_trans}
                  break;

              }//switcgh

              if($scope.permiso==1)
              {
                $scope.url = "modulos/BiotestUltra/paginas/peso.html";
              }//if
              else
              {
                $scope.url = "modulos/BiotestUltra/paginas/error.html";
              }
          })  
         .error(function(data, status, headers, config){
          $methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
      break;
    }//switch
}//Evaluar

$scope.Evaluar($scope.Action);

})

.directive('onlyDigits', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attr, ngModelCtrl) {
            function fromUser(text) {
                if (text) {
                    var transformedInput = text.replace(/[^0-9]/g, '');

                    if (transformedInput !== text) {
                        ngModelCtrl.$setViewValue(transformedInput);
                        ngModelCtrl.$render();
                    }
                    return transformedInput;
                }
                return undefined;
            }            
            ngModelCtrl.$parsers.push(fromUser);
        }
    };
})