angular.module('AppRutinasComp',['ngRoute','angularUtils.directives.dirPagination','Methods'])

.controller('TiposRutina',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarmaquinas = false;	
$scope.tipmtr          = 0;
$scope.ListaInst       = false;

//Funciones
$scope.Selecciontr = function(tr)
{
	//Verificando que no se le hizo click al mismo tr
	if(tr.tipr.id == $scope.tipmtr)
	{
		//Si es el mismo tr se le asigna un 0.
		$scope.tipmtr = 0;
		idtr = "#table"+tr.tipr.id;
		$(idtr).removeClass("bg-blue");
		console.log($scope.tipmtr);
	}//if
	else
	{
		$("tr").removeClass("bg-blue");
		$scope.tipmtr = tr.tipr.id;
		idtr          = "#table"+tr.tipr.id;
		$(idtr).addClass("bg-blue");
		console.log($scope.tipmtr);
	}
	
	//añadiendo la clase al tr
}//Selecciontr

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/AgregarTiposRutina').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.Editar = function()
{
	if($scope.tipmtr!=0)
	{
		bootbox.confirm("Desea Editar este tipo de rutina?", function(result) {
			if(result==true)
			{
				$scope.$apply(function(){
				$location.path('/EditarCategoria').search({cat: $scope.tipmtr});
				});
			}//if
		});//bootbox
	}//if
}//editar

$scope.Eliminar = function()
{
	if($scope.tipmtr!=0)
	{
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			params = $methodsService.Json("EliminarTipoRutina",$scope.tipmtr);
	  			//Enviando por ajax la peetición
	  			var url = 'modulos/Rutinas/Funciones.php';
				 $http({method: "post",url: url,data: $.param({Params:params}), 
				  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				})
				 .success(function(data, status, headers, config) 
				 {          	
				   		//Tomando los datos
				   		exito = data.exito;
				   		existe = data.existe;
				   		if( existe==1 && exito==1)
				   		{
				   			$scope.TiposRutina = data.tiposRut
				   			$methodsService.alerta(1,"Tipo de rutina eliminada");
				   		}//if
				   		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
				  })  
				 .error(function(data, status, headers, config){
				 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				 });
	  		});
	  	}//if
	});
	}//if
	else{$methodsService.alerta(2,"Favor de seleccionar una categoría.");}
}//Eliminar

//Buscando las pruebas por la número 1, condición física
params = $methodsService.Json("TiposRutina",1);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		existe = data.existe;
       		if(existe==1)
       		{
       			$scope.TiposRutina = data.tiposRut;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarmaquinas = true;		
       		}
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})//TiposRutina

.controller('TiposRutinaAgregar',function($scope,$http,$location,$methodsService){
$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir
$scope.Registro = function()	
{
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.tipru.Accion = "AgregarTipoRutina";
		  			params  = JSON.stringify($scope.tipru);
		  			var url = 'modulos/Rutinas/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
			         	exito = data.exito;
			         	if(exito==1)
			         	{
			         		$methodsService.alerta(1,"Tipo de rutina Agregada");
			         		$scope.tipru = {};
			         	}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
	  		});
	  	}//if
	});
}//Registro

})//TiposRutinaAgregar

.controller('CategoriaEditar',function($scope,$http,$location,$methodsService,$routeParams){
	//Tomando los datos
	$scope.cat = $routeParams.cat;

	//funciones
	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

	$scope.editar = function()
	{
		bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.tipru.Accion = "EditarCategoria";
	  			params              = JSON.stringify($scope.tipru);
	  			//Mandando por ajax al controler la edición.
	  			var url = 'modulos/Rutinas/Funciones.php';
						 $http({method: "post",url: url,data: $.param({Params:params}), 
						  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
						})
						 .success(function(data, status, headers, config) 
						 {          	
						 		respuesta = data.respuesta;
						 		exito     = data.exito;
						 		if($scope.cat == respuesta)
						 		{
						 			$methodsService.alerta(1,"Tipo Rutina");
						 		}//if
						 		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
						  })  
						 .error(function(data, status, headers, config){
						 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
						 });
	  		});//aply
	  	}//if
	  	});//bootbox	
	}//editar

	params = $methodsService.Json("BuscarTipoRutinaId",$scope.cat);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
     		existe    = data.existe;
     		if(existe==1 )
     		{
     			$scope.tipru      = data.tipo_rutina;
     		
     		}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})
.controller('Musculos',function($scope,$http,$location,$methodsService,$routeParams){
//Variables
$scope.mostrarbuscando = true;	
$scope.mostrarmaquinas = false;
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mustr   		   = 0;
//funciones
$scope.Selecciontr = function(tr)
{
	//Verificando que no se le hizo click al mismo tr
	if(tr.mus.id == $scope.mustr)
	{
		//Si es el mismo tr se le asigna un 0.
		$scope.mustr = 0;
		idtr = "#table"+tr.mus.id;
		$(idtr).removeClass("bg-blue");
		console.log($scope.mustr);
	}//if
	else
	{
		$("tr").removeClass("bg-blue");
		$scope.mustr = tr.mus.id;
		idtr          = "#table"+tr.mus.id;
		$(idtr).addClass("bg-blue");
		console.log($scope.mustr);
	}
	
	//añadiendo la clase al tr
}//Selecciontr

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/AgregarMusculo').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.Editar = function()
{
	if($scope.mustr!=0)
	{
		bootbox.confirm("Desea Editar este tipo de rutina?", function(result) {
			if(result==true)
			{
				$scope.$apply(function(){
					$location.path('/EditarMusculo').search({cat: $scope.mustr});
				});
			}//if
		});//bootbox
	}//if
}//Editar

$scope.Eliminar = function()
{
	if($scope.mustr!=0)
	{
		bootbox.confirm("Desea Eliminar este músculo?", function(result) {
			if(result==true)
			{
				params = $methodsService.Json("EliminarMusculo",$scope.mustr);
				var url = 'modulos/Rutinas/Funciones.php';
			     $http({method: "post",url: url,data: $.param({Params:params}), 
			      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			    })
			     .success(function(data, status, headers, config) 
			     {          	
			     		
			      })  
			     .error(function(data, status, headers, config){
			     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			     });
			}//if
		});//bootbox
	}//if
	else
		{$methodsService.alerta(2,"Seleccione un músculo");}
}//Eliminar

//Buscando las pruebas por la número 1, condición física
params = $methodsService.Json("ConsultarMusculos",1);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito = data.exito;
       		if(exito==1)
       		{
       			$scope.musculos        = data.musculos;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarmaquinas = true;		
       		}
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });	

})
.controller('MusculosAgregar',function($scope,$http,$location,$methodsService,$routeParams){

//Variables
$scope.mostrarbuscando = true;	
$scope.mostrarContent  = false;

//funciones
$scope.Redirigir = function(direccion)
{
	$methodsService.Redirigir(direccion);
}//Redirigir

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar un Músculo?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
  		$scope.$apply(function(){
			$scope.mus.Accion = "AgregarMusculo";
			params  = JSON.stringify($scope.mus);
			var url = 'modulos/Rutinas/Funciones.php';
		     $http({method: "post",url: url,data: $.param({Params:params}), 
		      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
		    })
		     .success(function(data, status, headers, config) 
		     {          	
		     		exito = data.exito;
		         	if(exito==1)
		         	{
		         		$methodsService.alerta(1,"Musculo Agregado");
		         		$scope.mus = {};
		         	}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
		      })  
		     .error(function(data, status, headers, config){
		     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
		     });
	  		});
	  	}//if
	});
}

	params = $methodsService.Json("TiposRutina",1);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		existe = data.existe;
       		if(existe==1)
       		{
       			$scope.TiposRutina = data.tiposRut;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarContent = true;	
				console.log($scope.TiposRutina);	
       		}
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})//MusculosAgregar

.controller('MusculosEditar',function($scope,$http,$location,$methodsService,$routeParams){
//Variables
$scope.id 			   = $routeParams.cat;
$scope.mostrarbuscando = true;	
$scope.mostrarContent  = false;

$scope.Redirigir = function(direccion)
{
	$methodsService.Redirigir(direccion);
}//Redirigir




//Funciones
$scope.Editar = function()
{
	bootbox.confirm("Desea Editar este Músculo?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.mus.Accion   = "EditarMusculo";
	  			params              = JSON.stringify($scope.mus);
	  			//Mandando por ajax al controler la edición.
	  			var url = 'modulos/Rutinas/Funciones.php';
						 $http({method: "post",url: url,data: $.param({Params:params}), 
						  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
						})
						 .success(function(data, status, headers, config) 
						 {          	
						 		respuesta = data.respuesta;
						 		if(respuesta==$scope.id)
						 		{
						 			$methodsService.alerta(1,"Músculo Editado")
						 		}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
						 		
						  })  
						 .error(function(data, status, headers, config){
						 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
						 });
	  		});//aply
	  	}//if
	  	});//bootbox
}//Editar

params = $methodsService.Json("BuscarMusculoPorId",$scope.id);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito  = data.exito;
       		existe = data.existe;
       		console.log(data);
       		if(exito==1 && existe==1)
       		{
       			console.log(data);
       			$scope.mus             = data.musculo;
       			$scope.TiposRutina 	   = data.tiposRut;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarContent  = true;	

       		}
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})