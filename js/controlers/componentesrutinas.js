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
				   		existenmus = data.existenmus;
				     	exito      = data.exito;
				     	exitorut   = data.exitorut;
			     	switch(true)
			     	{
			     		case existenmus==1:
			     			//Si existen ejercicios debe redirijirse a la pantalla de error.
			     			//diccionario de errores mus = musculos.
			     			$location.path('/Error').search({error: "rut",id:$scope.tipmtr});
			     		break;

			     		case exito!=1 && exitorut!=1:
			     			$methodsService.alerta(2,"algo falló, disculpe las molestias");
			     		break;

			     		case exitorut==1 && exito==1:
			     			$scope.TiposRutina = data.tiposRut;
			     			$methodsService.alerta(1,"Músculo eliminado correctamente.");
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
			     	console.log(data);
			     	//verificando que no existan ejercicios ligados al músculo
			     	existeneje = data.existeneje;
			     	exito      = data.exito;
			     	exitomus   = data.exitomus;
			     	switch(true)
			     	{
			     		case existeneje==1:
			     			//Si existen ejercicios debe redirijirse a la pantalla de error.
			     			//diccionario de errores mus = musculos.
			     			$location.path('/Error').search({error: "mus",id:$scope.mustr});
			     		break;

			     		case exito!=1 && exitomus!=1:
			     			$methodsService.alerta(2,"algo falló, disculpe las molestias");
			     		break;

			     		case exitomus==1 && exito==1:
			     			$scope.musculos = data.musculos;
			     			$methodsService.alerta(1,"Músculo eliminado correctamente.");
			     		break;
			     	}//switch
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

.controller('Ejercicios',function($scope,$http,$location,$methodsService,$routeParams){
// Variables
$scope.mostrarbuscando = true;
$scope.mostrarcontent  = false;
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.showfilter      = false;
$scope.ejetr 		   = 0;
//Funciones 

$scope.Selecciontr = function(tr)
{
	//Verificando que no se le hizo click al mismo tr
	if(tr.eje.id == $scope.ejetr)
	{
		//Si es el mismo tr se le asigna un 0.
		$scope.ejetr = 0;
		idtr = "#table"+tr.eje.id;
		$(idtr).removeClass("bg-blue");
		console.log($scope.ejetr);
	}//if
	else
	{
		$("tr").removeClass("bg-blue");
		$scope.ejetr = tr.eje.id;
		idtr          = "#table"+tr.eje.id;
		$(idtr).addClass("bg-blue");
		console.log($scope.ejetr);
	}
}//Selecciontr

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar Ejercicio?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/RegistrarEjercicio').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.Editar = function()
{
	if($scope.ejetr!=0)
	{
		bootbox.confirm("Desea Editar este Ejercicio?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/EditarEjercicio').search({eje:$scope.ejetr});
	  		});
	  	}//if
	});
	}//if
	else{$methodsService.alerta(2,"Favor de seleccionar un ejercicio");}
	
}//Editar

	//Buscando las pruebas por la número 1, condición física
	params = $methodsService.Json("ConsultarEjercicios",1);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito = data.exito;
       		console.log(data);
       		if(exito==1)
       		{
       			$scope.ejercicios      = data.ejercicios;
       			$scope.mostrarbuscando = false;	
				$scope.mostrarcontent  = true;		
       		}
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });	
})

.controller('EjercicioRegistrar',function($scope,$http,$location,$methodsService,$routeParams){
//Variables
$scope.actbtn = false; //Variable para desactivar el botón.	
//Funciones 
$scope.BuscarMusculos = function()
{
	if($scope.ejercicio.tiporut>0)
	{
		//Tomando el valor del tipo de rutina para buscar los músculos.
	params = $methodsService.Json("ConsultarMusculosLigados",$scope.ejercicio.tiporut);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito = data.exito;
       		if(exito==1)
       		{
       			$scope.musculos = data.musculos;
       			
       		}
       		else
       		{
       			//$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			$scope.musculos = {};
       			$scope.ejercicio.musculo = ""; //se debe blanquear por que queda el del último seleccionado.
       		}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}
}//BuscarMusculos

$scope.BuscarMaquina = function()
{
	if($scope.ejercicio.tipomaquina>0)
	{
			//Tomando el valor del tipo de rutina para buscar los músculos.
	params = $methodsService.Json("FiltrarMaquinas",$scope.ejercicio.tipomaquina);
	var url = 'modulos/Utilidades/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		existe = data.existe;
       		console.log(data); 
       		if(existe==1)
       		{
       			$scope.maquinas = data.maquinas;
       			//Si el array viene vacío vacíaos la variable ejercicio
       			var cantidad    = $scope.maquinas.length;
       			if(cantidad==0){$scope.ejercicio.maquina = "";}//bleanqueando el model máquina, se queda pegado en algún cambio.
       		}
       		else
       		{
       			$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			$scope.maquinas          = {};
       			 
       		}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}//if
}//BuscarMaquina

$scope.AgregarEjercicio = function()
{
	//Agregando el ejercicio
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		//Verificando si los datos opcionales tienen algo.
	  		$scope.ejercicio.musculo = ($scope.ejercicio.musculo!="")?$scope.ejercicio.musculo:0;
	  		$scope.ejercicio.maquina = ($scope.ejercicio.maquina!="")?$scope.ejercicio.maquina:0;
	  		$scope.actbtn 			 = true; //desactivando el botón
	  		$scope.$apply(function(){
	  			$scope.ejercicio.Accion = "AgregarEjercicio";
		  			params  = JSON.stringify($scope.ejercicio);
		  			var url = 'modulos/Rutinas/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
			         	$scope.actbtn = false;
			         	exito         = data.exito;
			         	if(exito==1)
			         	{
			         		$methodsService.alerta(1,"Ejercicio Agregado!");
			         		$scope.ejercicio = {};
			         	}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
			     });//apply
	  	}//if
	  });//bootbox
}//AgregarEjercicio

$scope.Redirigir = function(direccion)
{
	$methodsService.Redirigir(direccion);
}//Redirigir

	// Consultar Info Para Registro de ejercicios
	params = $methodsService.Json("ConsultarInfoEjercicios",1);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exister =  data.exister;
       		exitom  = data.exitom;
       		exitotr = data.exitotr;
       		console.log(data);
       		switch(true)
       		{
       			case exister==1 && exitom==1:
       				$scope.tiposrut    = data.tiposRut;
       				$scope.tipomaquina = data.TiposMaquina;
       			break;

       			case exister!=1 || exitom!=1:
       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			break;
       		}//switch
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });	
})

.controller('EjercicioEditar',function($scope,$http,$location,$methodsService,$routeParams){
//Variables
$scope.id = $routeParams.eje;

//funciones
$scope.BuscarMusculos = function()
{
	if($scope.ejercicio.id_tiporutina>0)
	{
		//Tomando el valor del tipo de rutina para buscar los músculos.
	params = $methodsService.Json("ConsultarMusculosLigados",$scope.ejercicio.id_tiporutina);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito = data.exito;
       		if(exito==1)
       		{
       			$scope.musculos = data.musculos;
       			
       		}
       		else
       		{
       			//$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			$scope.musculos = {};
       			$scope.ejercicio.id_musculo = ""; //se debe blanquear por que queda el del último seleccionado.
       		}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}
}//BuscarMusculos

$scope.BuscarMaquina = function()
{
	if($scope.ejercicio.id_categoriamaquina>0)
	{
			//Tomando el valor del tipo de rutina para buscar los músculos.
	params = $methodsService.Json("FiltrarMaquinas",$scope.ejercicio.id_categoriamaquina);
	var url = 'modulos/Utilidades/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		existe = data.existe;
       		console.log(data); 
       		if(existe==1)
       		{
       			$scope.maquinas = data.maquinas;
       			//Si el array viene vacío vacíaos la variable ejercicio
       			var cantidad    = $scope.maquinas.length;
       			if(cantidad==0){$scope.ejercicio.maquina = "";}//bleanqueando el model máquina, se queda pegado en algún cambio.
       		}
       		else
       		{
       			$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			$scope.maquinas          = {};
       			 
       		}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}//if
}//BuscarMaquina

$scope.EditarEjercicio = function()
{
	//Agregando el ejercicio
	bootbox.confirm("Desea Agregar un tipo de rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
			$scope.ejercicio.Accion = 'EditarEjercicio';
			console.log($scope.ejercicio);
		}//if
	});
}//EditarEjercicio

//Buscando los datos del ejercicio.
params = $methodsService.Json("BuscarEjercicioPorId",$scope.id);
	var url = 'modulos/Rutinas/Funciones.php';
	     $http({method: "post",url: url,data: $.param({Params:params}), 
	      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	    })
	     .success(function(data, status, headers, config) 
	     {          	
	       		exito  = data.exito;
	       		exitor = data.exitor;
	       		exitom = data.exitom;
	       		console.log(data);
	       		switch(true)
	       		{
	       			case exito==1 && exitor==1 && exitom==1:
	       				//Tomando las variables correspondientes.
	       				$scope.ejercicio   = data.ejercicio;
	       				$scope.tiposrut    = data.tiposRut;
	       				$scope.TipoMaquina = data.TipoMaquina;
	       				$scope.musculos    = data.musculos;
	       				$scope.maquinas    = data.maquinas;
	       			break;

	       			case exito!=1 && exitor!=1 && exitom!=1:
	       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
	       			break;
	       		}//switch
	      }).error(function(data, status, headers, config){
	     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	     });	


})//EjercicioEditar



.controller('Errors',function($scope,$http,$location,$methodsService,$routeParams){
// Variables
$scope.Error = $routeParams.error;
$scope.id    = $routeParams.id;
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.

//funciones 
$scope.Volver = function()
{
	dir = $scope.obtenerdir($scope.Error);
	$location.path(dir).search({});
}//Volver

$scope.obtenerdir = function(dir)
{
	switch(dir)
	{
		case 'mus':
			direccion = '/Musculos';
		break;

		case 'rut':
			direccion = '/TiposRutina';
		break;
	}//switch
	return direccion;
}//obtenerdir

	// Definiendo el tipo de error.
	switch($scope.Error)
		{
			case "mus":
				$scope.mensaje = 	'Si llegó a este apartado, es por que hay Musculos ligados a ejercicios que dependen de este Ejercicio';
				$scope.mensaje+=	'Para poder eliminar este músculo es necesario eliminar los ejercicios que dependen de este.';
				$scope.mensaje+=	'En la tabla inferior se muestran cuales son los ejercicios dependientes de estos músculos.';
				//Buscando los ejercicios ligados a estos músculos.
				params = $methodsService.Json("ConsultarEjerciciosLigados",$scope.id);
				var url = 'modulos/Rutinas/Funciones.php';
				     $http({method: "post",url: url,data: $.param({Params:params}), 
				      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				    })
				     .success(function(data, status, headers, config) 
				     {          	console.log(data);
				       		exito = data.exito;
				       		if(exito==1)
				       		{
				       			$scope.ejercicios = data.ejercicios;
				       			$scope.url = 'modulos/Rutinas/ErroresEliminar/DeleteMusculos.html';
				       		}
				       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
				       		
				      }).error(function(data, status, headers, config){
				     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				     });	
			break;
			case "Ejercicios":
				//Se toman las rutinas en las que existen los ejercicios
				
			$scope.mensaje =  'Si llegó a este apartado, es por que hay rutinas TEMPLATE existentes que dependen de estos ejercicios,';
			$scope.mensaje+=  'para poder eliminar los ejercicios es necesario eliminar estas rutinas. En la tabla inferior';
			$scope.mensaje+=  'se muestran cuales son las rutinas dependientes del ejercicio a eliminar.';
			break;
			
			case "EjerciciosClientes":
				
			$scope.mensaje = 'Si llegó a este apartado, es por que hay rutinas Personalizadas existentes que dependen de estos ejercicios,';
			$scope.mensaje+= 'para poder eliminar los ejercicios es necesario eliminar estas rutinas. En la tabla inferior';
			$scope.mensaje+= 'se muestran cuales son las rutinas dependientes del ejercicio a eliminar.';
			break;
			
			case "rut":
				$scope.mensaje = 'Si llegó a este apartado, es por que hay Tipos de Rutinas ligadas a Músculos que dependen'; 
				$scope.mensaje+= 'de estos Tipos De Rutinas. Para poder eliminar este músculo es necesario eliminar los ejercicios';
				$scope.mensaje+= 'que dependen de este. En la tabla inferior se muestran cuales son los ejercicios dependientes de estos músculos.';
				params = $methodsService.Json("ConsultarMusculosLigados",$scope.id);
				var url = 'modulos/Rutinas/Funciones.php';
				     $http({method: "post",url: url,data: $.param({Params:params}), 
				      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				    })
				     .success(function(data, status, headers, config) 
				     {     
				       		   
				       		exito = data.exito;
				       		console.log(data);
				       		if(exito==1)
				       		{
				       			$scope.musculos = data.musculos;
				       			$scope.url = 'modulos/Rutinas/ErroresEliminar/DeleteTipoRutina.html';
				       		}
				       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
				      }).error(function(data, status, headers, config){
				     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				     });
			break;
			
			case "Maquina":
			$scope.mensaje = 'Si llegó a este apartado, es por que hay ejercicios ligados a <strong>Máquina</strong> que dependen'; 
			$scope.mensaje+= 'de estos <strong>ejercicios</strong>. Para poder eliminar esta máquina es necesario eliminar los ejercicios '
			$scope.mensaje+= 'que dependen de esta. En la tabla inferior se muestran cuales son los ejercicios dependientes de esta máquina.';
			break;
			
		}//switch
})//Error