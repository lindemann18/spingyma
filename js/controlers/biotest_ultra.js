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
  $scope.enviar = function()
  {
    bootbox.confirm("Desea enviar los resultados del biotest?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
        var params = $methodsService.Json("UltimoBiotestCliente",$scope.cliente);
        var url = 'modulos/BiotestUltra/crearPdfarchivo.php?Id_Cliente='+$scope.cliente;
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
  }//enviar

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
//Variables de evaluación
$scope.Peso      = {Peso:"",Altura:"",Accion:"",Cliente:""};
$scope.condicion = {Resultado:"",Cliente:"",Accion:""};
$scope.fuerza    = {repeticiones:"",Cliente:"",Accion:""};
$scope.Stamina   = {repeticiones:"",Cliente:"",Accion:""};
$scope.Resist    = {repeticiones:"",Cliente:"",Accion:""};
$scope.flexib    = {repeticiones:"",Cliente:"",Accion:""};
$scope.masa      = {espalda:"",pecho:"",abdomen:"",cadera:"",brazo:"",muslo:"",Cliente:"",Accion:""};
$scope.btndes    = true;
//Evaluando lo que se debe hacer dependiendo de la acción.


//funciones
$scope.EvaluarIMM = function()
{
  bootbox.confirm("Desea Aplicar el test de IMM?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.masa.Accion    = "IMM";
            $scope.masa.Cliente   = $scope.cliente;
            var params            = JSON.stringify($scope.masa);
            $scope.btndes         = false;
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
              exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResultimm').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes = true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 6;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. repeticiones: "+$scope.Resist.repeticiones;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });//apply
      }//if
    });//boot box
}

$scope.EvaluarFlexibilidad = function()
{
  bootbox.confirm("Desea Aplicar el test de Stamina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.flexib.Accion  = "Flexibilidad";
            $scope.flexib.Cliente = $scope.cliente;
            var params            = JSON.stringify($scope.flexib);
            $scope.btndes         = false;
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
               exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResult').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes = true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 6;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. repeticiones: "+$scope.Resist.repeticiones;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });//apply
      }//if
    });//bootbox
}//EvaluarFlexibilidad

$scope.EvaluarResistencia = function()
{
    bootbox.confirm("Desea Aplicar el test de Stamina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.Resist.Accion  = "Resistencia";
            $scope.Resist.Cliente = $scope.cliente;
            var params            = JSON.stringify($scope.Resist);
            $scope.btndes         = false;
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
               exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResult').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes = true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 5;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. repeticiones: "+$scope.Resist.repeticiones;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });
      }//if
    });//bootbox
}//EvaluarResistencia

$scope.EvaluarStamina = function()
{
    bootbox.confirm("Desea Aplicar el test de Stamina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.Stamina.Accion  = "Stamina";
            $scope.Stamina.Cliente = $scope.cliente;
            var params            = JSON.stringify($scope.Stamina);
            $scope.btndes         = false;
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
               exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResult').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes=true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 4;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. repeticiones: "+$scope.fuerza.repeticiones;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });//apply
      }//if
    });//bootbox
}//EvaluarStamina

$scope.FuerzaEvaluar = function()
{
  bootbox.confirm("Desea Aplicar el test de Fuerza?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.fuerza.Accion  = "Fuerza";
            $scope.fuerza.Cliente = $scope.cliente;
            var params            = JSON.stringify($scope.fuerza);
            $scope.btndes         = false;
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
                // Tomando los datos.
                exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResult').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes=true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 2;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. repeticiones: "+$scope.fuerza.repeticiones;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });//apply
      }//if
    });//bootbox
}//FuerzaEvaluar


$scope.CondicionEvaluar = function()
{
    bootbox.confirm("Desea Aplicar el test de condición?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.condicion.Accion  = "CondicionFisica";
            $scope.condicion.Cliente = $scope.cliente;
            var params = JSON.stringify($scope.condicion);
            $scope.btndes            = false;
            // Enviadno por AJAX los datos.
            var url = 'modulos/BiotestUltra/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
                // Tomando los datos.
                exito = data.exito;
                if(exito==1)
                {
                  $scope.btndes = true;
                  //Se redirige al apartado de resultados.
                  $location.path('/BiotestUltraResult').search({Cliente:$scope.cliente,Action:$scope.Action});
                }else
                {
                  $methodsService.alerta(2,"algo falló, disculpe las molestias"); 
                  $scope.btndes=true;
                  $scope.url    = "modulos/BiotestUltra/paginas/error_prueba.html";
                  $scope.prueba = 2;
                  $scope.error  = "Ha ocurrido un error, verique los datos ingresados y vuelva a intentarlo. Condicion: "+$scope.condicion.Resultado;
                }
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });
      }//if
    });
}//CondicionEvaluar

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

      case 2:
         $scope.url = "modulos/BiotestUltra/paginas/condicion.html";
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
              /*switch(true)
              {

                  case $scope.permiso ==1 &&  $scope.PermisoU==1:
                    $scope.url = "modulos/BiotestUltra/paginas/peso.html";
                    if($scope.Dias_trans>$scope.Dias_transUl)
                    {
                      $scope.dias = $scope.Dias_transUl;
                    }else{$scope.dias =$scope.Dias_trans}
                  break;

              }//switcgh*/

              if($scope.permiso==1 && $scope.PermisoU==1)
              {
                $scope.url = "modulos/BiotestUltra/paginas/peso.html";
              }//if
              else
              {
                $scope.bioerror = "Han transcurrido "+$scope.Dias_trans+" días desde el último biotest light y has transcurrido "+$scope.Dias_transUl+" desde el biotest ultra, debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest."
                $scope.url = "modulos/BiotestUltra/paginas/error.html";
              }
          })  
         .error(function(data, status, headers, config){
          $methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
      break;

      case 2:
          // En esta prueba se evalua la condición Física.
          Arr = new Object();
        Arr['id']     = $scope.cliente;
        Arr['Prueba'] = "Condición Física";
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
              /*switch(true)
              {

                  case $scope.permiso ==1 &&  $scope.PermisoU==1:
                    $scope.url = "modulos/BiotestUltra/paginas/peso.html";
                    if($scope.Dias_trans>$scope.Dias_transUl)
                    {
                      $scope.dias = $scope.Dias_transUl;
                    }else{$scope.dias =$scope.Dias_trans}
                  break;

              }//switcgh*/

              if($scope.permiso==1 && $scope.PermisoU==1)
              {
                $scope.url = "modulos/BiotestUltra/paginas/condicion.html";
              }//if
              else
              {
                $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                $scope.url      = "modulos/BiotestUltra/paginas/error.html";
              }
          })  
         .error(function(data, status, headers, config){
          $methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
          
      break;

      case 3:
         Arr = new Object();
        Arr['id']     = $scope.cliente;
        Arr['Prueba'] = "Fuerza";
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

              if($scope.permiso==1 && $scope.PermisoU==1)
              {
                $scope.url = "modulos/BiotestUltra/paginas/Fuerza.html";
              }//if
              else
              {
                $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                $scope.url      = "modulos/BiotestUltra/paginas/error.html";
              }
          })  
         .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
      break;

      case 4:
          Arr = new Object();
          Arr['id']     = $scope.cliente;
          Arr['Prueba'] = "Stamina";
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

                if($scope.permiso==1 && $scope.PermisoU==1)
                {
                  $scope.url = "modulos/BiotestUltra/paginas/Stamina.html";
                }//if
                else
                {
                  $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                  $scope.url      = "modulos/BiotestUltra/paginas/error.html";
                }
            })  
           .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
      break;

      case 5:
          Arr = new Object();
          Arr['id']     = $scope.cliente;
          Arr['Prueba'] = "Resistencia";
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

                if($scope.permiso==1 && $scope.PermisoU==1)
                {
                  $scope.url = "modulos/BiotestUltra/paginas/Resistencia.html";
                }//if
                else
                {
                  $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                  $scope.url      = "modulos/BiotestUltra/paginas/error.html";
                }
            })  
           .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
      break;

      case 6:
        Arr = new Object();
          Arr['id']     = $scope.cliente;
          Arr['Prueba'] = "Flexibilidad";
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

                if($scope.permiso==1 && $scope.PermisoU==1)
                {
                  $scope.url = "modulos/BiotestUltra/paginas/Flexibilidad.html";
                }//if
                else
                {
                  $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                  $scope.url      = "modulos/BiotestUltra/paginas/error.html";
                }
            })  
           .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
      break;

      case 7:
        Arr = new Object();
          Arr['id']     = $scope.cliente;
          Arr['Prueba'] = "Imm";
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

                if($scope.permiso==1 && $scope.PermisoU==1)
                {
                  $scope.url = "modulos/BiotestUltra/paginas/Masa.html";
                }//if
                else
                {
                  $scope.bioerror = "Han transcurrido "+$scope.Dias_transUl+" días desde el último biotest debe esperar 15 días para ambas pruebas como mínimo para aplicar nuevamente el biotest.";
                  $scope.url      = "modulos/BiotestUltra/paginas/error.html";
                }
            })  
           .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
      break;

    }//switch
}//Evaluar

$scope.Evaluar($scope.Action);

})

.controller('ResultadosUltraBiotestPeso',function($scope,$http,$location,$methodsService,$routeParams,$timeout){

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
      bootbox.confirm("Desea pasar a la siguiente prueba?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/BiotestUltraAplicar').search({Cliente:$scope.cliente,Action:"2"});
        });
      }//if
  });
   }//SiguientePrueba

})//ResultadosUltraBiotestPeso

.controller('ResultadosUltraBiotest',function($scope,$http,$location,$methodsService,$routeParams){

  //Buscando los resultados de la prueba de peso
  $scope.cliente      = $routeParams.Cliente;
  $scope.Action       = $routeParams.Action;
  
  // Funciones
  $scope.EnviarResultados = function()   
  {
    bootbox.confirm("Desea enviar los resultados?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            
        });//apply
      }//if
    });//bootbbox
  }

  $scope.DefinePrueba = function(action)
  { 
      actint = parseInt(action);
      var prueba = "";
      switch(actint)
      {
        case 2:
          prueba        = "Condicion Fisica";
          $scope.prueba = 3;
        break;

        case 3:
          prueba        = "Fuerza";
          $scope.prueba = 4;
        break;

        case  4:
          prueba        = "Stamina";
          $scope.prueba = 5;
        break;

        case  5:
          prueba        = "Resistencia";
          $scope.prueba = 6;
        break;

        case  6:
          prueba        = "Flexibilidad";
          $scope.prueba = 7;
        break;

        case  6:
          prueba        = "IMM";
          $scope.prueba = 8;
        break;

      }//switch
      return prueba;
  }//DefinePrueba

  $scope.nombrePrueba = $scope.DefinePrueba($scope.Action);
  // Buscando Los resultados.
  var Arr = new Object();
  Arr['cliente'] = $scope.cliente;
  Arr['prueba']  = $scope.nombrePrueba;
  Arr['Accion']  = "Resultados";
  var params     = JSON.stringify(Arr)
  var url        = 'modulos/BiotestUltra/Funciones.php';

   $http({method: "post",url: url,data: $.param({Params:params}), 
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
  })
   .success(function(data, status, headers, config) 
   {            
        console.log(data);
        //Tomando los datos.
        exito  = data.exito;
        exito  = parseInt(exito);
         
        if(exito==1)
        {
            // Tomando los datos.
            // Asignando la primera barra de resultados
            
            $scope.resultados = data.resultados;
            $scope.porcentaje = $scope.resultados[0].porcentaje;
            $methodsService.ResultadoPrueba($scope.porcentaje,"#ProgresBar");

            //Asignando el consejo.
            $scope.consejo = data.consejo; 

            //Creando las high charts de peso.
            // Armando las fechas.
            datosfec  = $scope.resultados[0].fecha;
            datosfec  = datosfec.split(" ");
            fecha3    = datosfec[0];
            
            datosfec2  = $scope.resultados[1].fecha;
            if(datosfec2!=0){datosfec2= datosfec2.split(" "); fecha2 = datosfec2[0]}
            else{fecha2 = "biotest no hecho";}

            datosfec3  = $scope.resultados[2].fecha;
            if(datosfec3!=0){datosfec3= datosfec3.split(" "); fecha = datosfec3[0]}
            else{fecha = "biotest no hecho";}

            TituloPrueba = $scope.nombrePrueba;

            //Tomando los resultados 
            var resultado3 = parseInt($scope.resultados[0].porcentaje);
            var resultado2 = parseInt($scope.resultados[1].porcentaje);
            var resultado1 = parseInt($scope.resultados[2].porcentaje);

            $scope.chartConfig = {
                 options: {chart: {type: 'bar'}},
                 series: [{name: fecha,color: "#00a65a",data: [resultado1]}, {
                    name: fecha2,
                    color:"#428bca",
                    data: [resultado2]
                }, {name: fecha3,color:"#f56954",data: [resultado3]}],
                title: {text: TituloPrueba},loading: false};
                
        }//if


        switch(true)
        {
          case exito==2:
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

   $scope.DefinePrueba = function() 
   {
    
   }

   $scope.SiguientePrueba = function(prueba)
   {
      bootbox.confirm("Desea pasar a la siguiente prueba?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/BiotestUltraAplicar').search({Cliente:$scope.cliente,Action:prueba});
        });
      }//if
  });
   }//SiguientePrueba

})//ResultadosUltraBiotestPeso

.controller('ResultadosUltraBiotestimm',function($scope,$http,$location,$methodsService,$routeParams){

  //Buscando los resultados de la prueba de peso
  $scope.cliente      = $routeParams.Cliente;
  $scope.Action       = $routeParams.Action;

  var params          = $methodsService.Json("ResultadosBiotest",$scope.cliente);
  
  //Funciones
  $scope.enviar = function()
  {
    bootbox.confirm("Desea regresar a clientes?", function(result) {
        if(result==true)
        {
          $scope.$apply(function(){
          var params = $methodsService.Json("EnviarResultados",$scope.cliente);
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
  }//enviar

  var url = 'modulos/Biotest/Funciones.php';
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
          case exitoPeso==1 && exitoimc==1 && exitoimm==1:
            //Pegando los resultados.
            $scope.peso   = data.peso;
            $scope.imc    = data.imc;
            $scope.imm    = data.imm;
            $scope.immAnt   = data.immAnt;

            
            //Perímetro brazo relajado
            Espalda       = "IMM - Espalda";
            $scope.Per_Espalda    = "";
            //Perímetro brazo_flexionado
            Pecho       = "IMM - Pecho";
            $scope.Per_Pecho    = "";
            //Perímetro Femoral
            Abdomen     = "IMM - Abdomen";
            $scope.Per_Abdomen    = "";
            //Perímetro de pantorrilla
            Cadera      = "IMM - Cadera";
            $scope.Per_Cadera   = "";
            //Perímetro Cintura
            Brazo       = "IMM - Brazo";
            $scope.CantidadBrazo = "";
            //Perímetro Cadera
            Muslo     = "IMM - Muslo";
            $scope.CantidadMuslo = "";
          
          //Se hace en un ciclo por que no se sabe en que orden vienen.
          for(i=0; i<6; i++)
          {
            //Tomando los valores de las pruebas a partir del nombre de las mismas.
            switch($scope.imm[i].desc_prueba)
            {
              case "IMM - Espalda": 
                $scope.Per_Espalda   = parseInt($scope.imm[i].resultado_numerico);
              break;
              case 'IMM - Pecho': 
                $scope.Per_Pecho     = parseInt($scope.imm[i].resultado_numerico);
              break;
              case 'IMM - Abdomen': 
                $scope.Per_Abdomen   = parseInt($scope.imm[i].resultado_numerico);
              break;
              case 'IMM - Cadera': 
                $scope.Per_Cadera    = parseInt($scope.imm[i].resultado_numerico);
              break;
              case 'IMM - Brazo': 
                $scope.CantidadBrazo = parseInt($scope.imm[i].resultado_numerico);
              break;
              case 'IMM - Muslo': 
                $scope.CantidadMuslo = parseInt($scope.imm[i].resultado_numerico);
              break;
              
            }//switch
            
          }//for

          //2dos resultados de IMM
          //Tomando los valores de Pruebas 2, que son las pruebas más antiguas del mes pasado.
          //Perímetro Per_Espalda2
          $scope.Per_Espalda2   = "";
          //Perímetro Per_Pecho2
          $scope.Per_Pecho2    = "";
          //Perímetro de Per_Abdomen2
          $scope.Per_Abdomen2   = "";
          //Perímetro Per_Cadera2
          $scope.Per_Cadera2    = "";
          //Perímetro CantidadBrazo2
          $scope.CantidadBrazo2 = "";
          //Perímetro CantidadMuslo2
          $scope.CantidadMuslo2 = "";
          
          //Se hace en un ciclo por que no se sabe en que orden vienen.
          $scope.Fecha2=($scope.immAnt[0].fh_creacion!=0)?$scope.immAnt[0].fh_creacion:"BioTest No hecho"; //Fecha para todas las primeras 8 pruebas.
          
          // Si vienen en 0 cualquiera de la descripción de las pruebas es el primer biotest, de no ser así es el 2do o cualquier otro.
          // Para efecto de que se vean las pruebas se asignan en 0 todos los valores dado que no hay otro punto de comparación.
          
          if($scope.immAnt[0].desc_prueba == 0)
          {
            $scope.Per_Espalda2   = 0;
            $scope.Per_Pecho2   = 0;
            $scope.Per_Abdomen2   = 0;
            $scope.Per_Cadera2    = 0;
            $scope.CantidadBrazo2 = 0;
            $scope.CantidadMuslo2 = 0;
          }
          else
          {
            for(i=0; i<6; i++)
            {
              //Tomando los valores de las pruebas a partir del nombre de las mismas.
              switch($scope.immAnt[i].desc_prueba)
              {
                case "IMM - Espalda": 
                  $scope.Per_Espalda2   = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                case 'IMM - Pecho': 
                  $scope.Per_Pecho2     = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                case 'IMM - Abdomen': 
                  $scope.Per_Abdomen2   = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                case 'IMM - Cadera': 
                  $scope.Per_Cadera2    = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                case 'IMM - Brazo': 
                  $scope.CantidadBrazo2 = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                case 'IMM - Muslo': 
                  $scope.CantidadMuslo2 = parseInt($scope.immAnt[i].resultado_numerico);
                break;
                
              }//switch
              
            }//for
            
          }//else
          $scope.chartConfig = {
             xAxis: {
                categories: ['Espalda', 'Pecho', 'Abdomen', 'Cadera', 'Brazo','Muslo'],
                title: {
                    text: null
                }
            },
            options: {chart: {type: 'bar'}},
               series: [{name: $scope.Fecha,color: "#00a65a",data: [$scope.Per_Espalda,$scope.Per_Pecho,$scope.Per_Abdomen,$scope.Per_Cadera,$scope.CantidadBrazo,$scope.CantidadMuslo]}, 
                    {name: $scope.Fecha2,color:"#428bca",data: [$scope.Per_Espalda2,$scope.Per_Pecho2,$scope.Per_Abdomen2,$scope.Per_Cadera2,$scope.CantidadBrazo2,$scope.CantidadMuslo2]}],
              title: {text: "IMM"},loading: false
            
          };

          console.log($scope.chartConfig);

          //Definiendo los cambios entre los resultados de IMM
          // Espalda
          Reses=$scope.Per_Espalda-$scope.Per_Espalda2;
          if($scope.Per_Espalda==Reses)ResEspalda="Primer Biotest";
          if(Reses>0 && $scope.Per_Espalda!=Reses)ResEspalda="Aumentaste: "+Reses;
          if(Reses==0)ResEspalda="Sin Cambios";
          if(Reses<0)ResEspalda="Disminuiste: "+(Reses*-1);
          
          $scope.ResEsp = ResEspalda;

          //Pecho
          Respe=$scope.Per_Pecho-$scope.Per_Pecho2;
          if($scope.Per_Pecho==Respe)resPecho="Primer Biotest";
          if(Respe>0 && $scope.Per_Pecho!=Respe)resPecho="Aumentaste: "+Respe;
          if(Respe==0)resPecho="Sin Cambios";
          if(Respe<0)resPecho="Disminuiste: "+(Respe*-1);
          $scope.ResPe = resPecho;

          //Abdomen
          Resab=$scope.Per_Abdomen-$scope.Per_Abdomen2;
          if($scope.Per_Abdomen==Resab)resAbdomen="Primer Biotest";
          if(Resab>0 && $scope.Per_Abdomen!=Resab)resAbdomen="Aumentaste: "+Resab;
          if(Resab==0)resAbdomen="Sin Cambios";
          if(Resab<0)resAbdomen="Disminuiste: "+(Resab*-1);
          $scope.ResAb = resAbdomen;

          //Cadera
          Rescad=$scope.Per_Cadera-$scope.Per_Cadera2;
          if($scope.Per_Cadera==Rescad)resCadera="Primer Biotest";
          if(Rescad>0 && $scope.Per_Cadera!=Rescad)resCadera="Aumentaste: "+Rescad;
          if(Rescad==0)resCadera="Sin Cambios";
          if(Rescad<0)resCadera="Disminuiste: "+(Rescad*-1);
          $scope.Resca = resCadera;

          //Brazo
          resbraz=$scope.CantidadBrazo-$scope.CantidadBrazo2;
          if($scope.CantidadBrazo==resbraz)resBrazo="Primer Biotest";
          if(resbraz>0 && $scope.CantidadBrazo!=resbraz)resBrazo="Aumentaste: "+resbraz;
          if(resbraz==0)resBrazo="Sin Cambios";
          if(resbraz<0)resBrazo="Disminuiste: "+(resbraz*-1);
          $scope.Resbr = resBrazo;

          //Muslo
          resmusl=$scope.CantidadMuslo-$scope.CantidadMuslo2;
          if($scope.CantidadMuslo==resmusl)resmuslo="Primer Biotest";
          if(resmusl>0 && $scope.CantidadMuslo!=resmusl)resmuslo="Aumentaste: "+resmusl;
          if(resmusl==0)resmuslo="Sin Cambios";
          if(resmusl<0)resmuslo="Disminuiste: "+(resmusl*-1);
          $scope.resmus = resmuslo;
          
          break;

          case exitoPeso!=1 || exitoimc!=1 || exitoimm!=1:
            //Dirigiendo a la página de errores del test
          break;
        }//switch
    })  
 .error(function(data, status, headers, config){
  $methodsService.alerta(2,"algo falló, disculpe las molestias");
 });

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