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
               $scope.exito   = data.exito; 
               if($scope.exito ==1)
               {
                  //Si entra aquí es por que hay resultados.
                  var params = $methodsService.Json("ResultadosPeso",$scope.cliente);
                  var url = 'modulos/BiotestUltra/Funciones.php';
                 $http({method: "post",url: url,data: $.param({Params:params}), 
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                })
                 .success(function(data, status, headers, config) 
                 {            
                      //Si enra aquí se va a redirigir a la parte de resultados.
                      $location.path('/BiotestUltraResultados').search({Cliente:$scope.cliente,Result:"Peso"});
                  })  
                 .error(function(data, status, headers, config){
                  $methodsService.alerta(2,"algo falló, disculpe las molestias");
                 });
               }
               else
               {
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 1;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. Peso: "+$scope.Peso.Peso+" Altura: "+$scope.Peso.Altura;

               }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });
      }//if
    });
}//Peso

$scope.volverPrueba = function(prueba)
{
    test = parseInt(prueba);
    switch(test)
    {
      case 1:
        $scope.url = "modulos/BiotestUltra/paginas/peso.html";
      break;
    }//switch

}//volverPrueba


$scope.Evaluar = function(action)
{
    accion = parseInt(action);
    switch(accion)
    {
      case 1:
        // En este caso se va a iniciar el biotest ultra, se 
        // Evalua si ya se hizo un biotest light o un ultra previamente.
        Arr = new Object();
        Arr['id']     = $scope.cliente;
        Arr['Prueba'] = "Peso";
        Arr['Accion'] = "UltimoBiotestCliente";
        var params    = JSON.stringify(Arr);
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
                    if($scope.Dias_trans>$scope.Dias_transUl)
                    {
                      $scope.dias = $scope.Dias_transUl;
                    }else{$scope.dias =$scope.Dias_trans}
                  break;

              }//switcgh

              if($scope.permiso==1 && $scope.PermisoU==1)
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

.controller('ResultadosUltraBiotestPeso',function($scope,$http,$location,$methodsService,$routeParams){

  //Buscando los resultados de la prueba de peso
  $scope.cliente = $routeParams.Cliente;

  // Buscando Los resultados.
  var params = $methodsService.Json("ResultadosPeso",$scope.cliente);
  var url = 'modulos/BiotestUltra/Funciones.php';
   $http({method: "post",url: url,data: $.param({Params:params}), 
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
  })
   .success(function(data, status, headers, config) 
   {            
        console.log(data);
        //Tomando los datos.
        exitoimc  = data.exitoimc;
        exitoPeso = data.exitoPeso;
        exitoimm  = data.exitoimm;
        switch(true)
        {
          case exitoPeso==1 && exitoimc==1:
            //Pegando los resultados.
            $scope.peso   = data.peso;
            $scope.imc    = data.imc;
            $scope.consejoP = data.consejoPeso;
            $scope.consejoI = data.consejoimc;
            $scope.condpeso = $scope.peso[0].resultado;
            $scope.condIMC  = $scope.imc[0].resultado;
            $methodsService.ResultadoPeso($scope.peso[0].porcentaje,"#ProgresBarPeso");
            $methodsService.ResultadoPeso($scope.imc[0].porcentaje,"#ProgresBarIMC");

            //Valores de la prueba 3
          fecha3=$scope.peso[0].fh_creacion;
          var resultado3 = parseInt($scope.peso[0].porcentaje);
          
          //valores de la prueba 2
          if($scope.peso[1].fh_creacion!=0){fecha2=$scope.peso[1].fh_creacion}else{fecha2="BioTest No Hecho"} 
          var resultado2=($scope.peso[1].porcentaje!=0)?parseInt($scope.peso[1].porcentaje):0;
          
          //valores de la prueba 3
          fecha1=($scope.peso[2].fh_creacion!=0)?$scope.peso[2].fh_creacion:"BioTest No Hecho";
          var resultado1=($scope.peso[2].porcentaje!=0)?parseInt($scope.peso[2].porcentaje):0;
          
          TituloPrueba="Resultados Peso";

          //Tomando los resultados de IMC
          fecha3imc=$scope.imc[0].fh_creacion;
          var resultado3imc = parseInt($scope.imc[0].porcentaje);
          
          //valores de la prueba 2
          if($scope.imc[1].fh_creacion!=0){fecha2imc=$scope.imc[1].fh_creacion}else{fecha2imc="BioTest No Hecho"} 
          var resultado2imc =($scope.imc[1].porcentaje!=0)?parseInt($scope.imc[1].porcentaje):0;
          
          //valores de la prueba 3
          fecha1imc=($scope.imc[2].fh_creacion!=0)?$scope.imc[2].fh_creacion:"BioTest No Hecho";
          var resultado1imc=($scope.imc[2].porcentaje!=0)?parseInt($scope.imc[2].porcentaje):0;
          
          TituloPruebaimc="Resultados IMC";

          $scope.chartConfig = {
                 options: {chart: {type: 'bar'}},
                 series: [{name: fecha1,color: "#00a65a",data: [resultado1]}, {
                    name: fecha2,
                    color:"#428bca",
                    data: [resultado2]
                }, {name: fecha3,color:"#f56954",data: [resultado3]}],
                title: {text: TituloPrueba},loading: false};

            $scope.chartConfig2 = {
                 options: {chart: {type: 'bar'}},
               series: [{name: fecha1imc,color: "#00a65a",data: [resultado1imc]}, 
               {name: fecha2imc,color:"#428bca",data: [resultado2imc]}, 
               {name: fecha3imc,color:"#f56954",data: [resultado3imc]}],
                title: {text: TituloPruebaimc},loading: false};

            break;
          }//switch
    })  
   .error(function(data, status, headers, config){
    $methodsService.alerta(2,"algo falló, disculpe las molestias");
   });

   $scope.SiguientePrueba = function()
   {
    alert("hola");
   }//SiguientePrueba

})//ResultadosUltraBiotestPeso

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