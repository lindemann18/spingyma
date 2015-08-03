angular.module('AppUtilidades',['ngRoute','angularUtils.directives.dirPagination','Methods'])

	.controller('Consejos',function($scope,$http,$location,$methodsService){

		//Variables 
		$scope.currentPage     = 1; // Página actual, para paginación
        $scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
		$scope.mostrarbuscando = true;	
		$scope.mostrarConsejos = false;	
		$scope.consejotr       = 0;
		$scope.ListaInst       = false;

		//Funciones
		$scope.Selecciontr = function(tr)
		{
			//Verificando que no se le hizo click al mismo tr
			if(tr.consejo.id == $scope.consejotr)
			{
				//Si es el mismo tr se le asigna un 0.
				$scope.consejotr = 0;
				idtr = "#table"+tr.consejo.id;
				$(idtr).removeClass("bg-blue");
				console.log($scope.consejotr);
			}//if
			else
			{
				$("tr").removeClass("bg-blue");
				$scope.consejotr = tr.consejo.id;
				idtr  			 = "#table"+tr.consejo.id;
				$(idtr).addClass("bg-blue");
				console.log($scope.consejotr);
			}
			
			//añadiendo la clase al tr
		}//Selecciontr

		$scope.Editar = function()
		{
			if($scope.consejotr!=0)
			{
				bootbox.confirm("Desea editar este Consejo?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/EditarConsejo').search({consejo: $scope.consejotr});
						});
				  	}
				});
				
			}//if
			else{$methodsService.alerta(2,"Favor de seleccionar un consejo");}
		}//Editar

		$scope.FiltrarConsejos = function()
		{
			params = $methodsService.Json("ConsultarConsejos",$scope.consejo.opcion);
			var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {  
	         	console.log(data);
	           		existe  = data.existe;
	           		existep = data.existep;
	           		if(existe==1 && existep==1)
	           		{
	           			//Tomando los consejos
	           			$scope.consejos = data.consejos;
	           			$scope.pruebas  = data.pruebas;
	           		}
	         })
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });
		}//FiltrarConsejos

		//Final de métodos

		//Buscando las pruebas por la número 1, condición física
		params = $methodsService.Json("ConsultarConsejos",1);
		var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {          	
	           		console.log(data);
	           		existe  = data.existe;
	           		existep = data.existep;
	           		if(existe==1 && existep==1)
	           		{
	           			//Tomando los consejos
	           			$scope.consejos = data.consejos;
	           			$scope.pruebas  = data.pruebas;
	           			$scope.mostrarbuscando = false;
	           			$scope.mostrarConsejos = true;
	           		}
	           		else
	           		{
	           			$methodsService.alerta(2,"algo falló, disculpe las molestias");		
	           		}
	          })  
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });
	})

.controller('ConsejosEditar',function($scope,$http,$location,$methodsService,$routeParams){
	//Tomando el id del consejo.
	$scope.id = $routeParams.consejo;

	// Variables
	$scope.mostrarbuscando = true;
	$scope.mostrarform     = false;
	$scope.lengthad        = 0;

	//funciones
	$scope.countChar = function()
	{
		$scope.lengthad = $scope.consejo.Consejo.length;
		if($scope.lengthad>=160)
		{
			bootbox.confirm("No pueden anotarse más de 160 caracteres", function(result) {

			});
		}
	}//countChar

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

	$scope.GuardarConsejo = function()
	{
		bootbox.confirm("Desea Editar Este Consejo?", function(result) {
			if(result)
			{
				$scope.$apply(function(){
					//Mandando al controler el consejo.
					$scope.consejo.Accion = "EditarConsejo";
					params        = JSON.stringify($scope.consejo);
					console.log(params);
					var url = 'modulos/Utilidades/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {     console.log(data);
			         		//Verificando la respuesta, si es igual al id,t odo salió bien.
					   		respuesta = data.respuesta;
					   		if(respuesta===1)
					   		{
					   			$methodsService.alerta(1,"Consejo editado!");
					   		}//if
					   		else
					   		{
					   			$methodsService.alerta(2,"algo falló, disculpe las molestias");
					   		}
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         })
				});
			}
		});
		
	}

	//Generando el json a enviar.
	params = $methodsService.Json("BuscarInfoConsejoPorId",$scope.id);
	var url = 'modulos/Utilidades/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {     
         		existe = data.existe;     	
           		if(existe==1)
           		{
           			$scope.consejo  	   = data.consejo;
           			$scope.mostrarbuscando = false;
           			$scope.mostrarform     = true;
           		}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
          })  
         .error(function(data, status, headers, config){
         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
         })
})//ConsejosEditar

.controller('Maquinas',function($scope,$http,$location,$methodsService,$routeParams){
	//Variables
	$scope.currentPage     = 1; // Página actual, para paginación
    $scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
	$scope.mostrarbuscando = true;
	$scope.mostrarmaquinas = false;
	$scope.maqtr    	   = 0;
	$scope.ListaCateg      = false;

	//Funciones
	$scope.Selecciontr = function(tr)
	{
		//Verificando que no se le hizo click al mismo tr
			if(tr.maq.id == $scope.maqtr)
			{
				//Si es el mismo tr se le asigna un 0.
				$scope.maqtr = 0;
				idtr = "#table"+tr.maq.id;
				$(idtr).removeClass("bg-blue");
				
			}//if
			else
			{
				$("tr").removeClass("bg-blue");
				$scope.maqtr = tr.maq.id;
				idtr = "#table"+tr.maq.id;
				$(idtr).addClass("bg-blue");
				
			}
	}//Selecciontr

	$scope.Agregar = function()
	{
		bootbox.confirm("Desea Agregar una máquina?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/AgregarMaquina').search({});
						});
				  		
				  	}//if
				});
		
	}//Agregar

	$scope.Editar = function()
	{
		if($scope.maqtr!=0)
			{
				bootbox.confirm("Desea editar esta máquina?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/EditarMaquina').search({maq: $scope.maqtr});
						});
				  		
				  	}//if
				});
				
			}//if
			else{$methodsService.alerta(2,"Favor de seleccionar una Máquina");}
	}//Editar

	$scope.Eliminar = function()
	{
		if($scope.maqtr!=0)
			{
				bootbox.confirm("Desea eliminar a esta máquina?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			// Eliminando al usuario seleccionado.
				  			params = $methodsService.Json("EliminarMaquina",$scope.maqtr);
				  			//Enviando por ajax la peetición
				  			var url = 'modulos/Utilidades/Funciones.php';
							 $http({method: "post",url: url,data: $.param({Params:params}), 
							  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
							})
							 .success(function(data, status, headers, config) 
							 {          	
							   		//Tomando los datos
							   		respuesta = data.respuesta;
							   		existe    = data.existe;
							   		if(respuesta==$scope.maqtr && existe==1)
							   		{
							   			$scope.maquinas = data.maquinas
							   			$methodsService.alerta(1,"Máquina eliminada");
							   		}//if
							   		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
							  })  
							 .error(function(data, status, headers, config){
							 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
							 });
						});
				  		
				  	}//if
				});
			}
			else
			{
				$methodsService.alerta(2,"Favor de seleccionar una máquina");
			}
	}//Eliminar

	$scope.FiltrarMaquinas = function()
	{

		//Filtrando las máquinas por el tipo de categoría seleccionada.
		params = $methodsService.Json("FiltrarMaquinas",$scope.maquina.opcion);
		var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {          	
	         	existe  = data.existe;
	         	if(existe==1 && existem==1)
	         	{
	         		console.log(data);
	         		$scope.maquinas = data.maquinas;
	         	}//if
	         	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	           	console.log(data);	
	          })  
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });
	}//FiltrarMaquinas

	//Buscando las máquinas
		params = $methodsService.Json("ConsultarMaquinas",1);
		var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {          	
	         	existe  = data.existe;
	         	existem = data.existem; 
	         	if(existe==1 && existem==1)
	         	{
	         		$scope.maquinas 	   = data.maquinas;
	         		$scope.tiposMaquinas    = data.tiposMaquinas;
	         		$scope.mostrarbuscando = false;
	         		$scope.mostrarmaquinas = true;
	         	}//if
	         	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	           	console.log(data);	
	          })  
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });

})

.controller('MaquinasEditar',function($scope,$http,$location,$methodsService,$routeParams){
	
	//Consiguiendo la info de la máquina
	$scope.id_maquina = $routeParams.maq;

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

	//funciones
	$scope.EditarMaquina = function()
	{
		//añadiendo la opción de ACción
		$scope.maquina.Accion = "EditarMaquina";
		params        = JSON.stringify($scope.maquina);
		bootbox.confirm("Desea editar esta máquina?", function(result) {
			if(result==true)
		  	{
		  		$scope.$apply(function(){
					  	var url = 'modulos/Utilidades/Funciones.php';
						 $http({method: "post",url: url,data: $.param({Params:params}), 
						  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
						})
						 .success(function(data, status, headers, config) 
						 {          	
						 		respuesta = data.respuesta;
						 		if($scope.id_maquina == respuesta)
						 		{
						 			$methodsService.alerta(1,"Máquina Editada");
						 		}//if
						 		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
						  })  
						 .error(function(data, status, headers, config){
						 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
						 });		
				});//apply
		  	}//if
		});//botbox
		//Enviando al controlador.
		
	}//EditarMaquina

	params = $methodsService.Json("BuscarMaquinaId",$scope.id_maquina);
	var url = 'modulos/Utilidades/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
     		existe    = data.existe;
     		existemaq = data.existemaq;
     		if(existe==1 && existemaq==1)
     		{
     			$scope.maquina      = data.maquina;
     			$scope.tipoMaquinas = data.tipoMaquinas;
     			console.log(data);
     		}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//Maquinas Editar

.controller('MaquinasAgregar',function($scope,$http,$location,$methodsService,$routeParams){
	//Buscando las opciones de categoría.

	// Métodos
	$scope.AgregarMaquina = function()
	{
		bootbox.confirm("Desea Agregar esta máquina?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
		  		$scope.$apply(function(){
		  			$scope.maquina.Accion = "AgregarMaquina";
		  			params  = JSON.stringify($scope.maquina);
		  			var url = 'modulos/Utilidades/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
			         	agregado = data.agregado;
			         	if(agregado==1)
			         	{
			         		$scope.maquina = {};
			         		$methodsService.alerta(1,"Máquina Agregado!");
			         	}//if
			         	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
			           	console.log(data);	
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
				});
		  	}
		});
	}//AgregarMaquina

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir


		params = $methodsService.Json("BuscarCategoriasMaquina",1);
		var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {          	
	         	existe = data.existe;
	         	if(existe==1)
	         	{
	         		$scope.tipoMaquinas 	   = data.tipoMaquinas;
	         		
	         	}//if
	         	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	           	console.log(data);	
	          })  
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });
})//MaquinasAgregar

.controller('Categorias',function($scope,$http,$location,$methodsService,$routeParams){

	//Variables
	$scope.currentPage     = 1; // Página actual, para paginación
    $scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
	$scope.mostrarbuscando = true;
	$scope.mostrarcat      = false;
	$scope.cattr 		   = 0;

	//Funciones
	$scope.AgregarCategoria = function()
	{
		bootbox.confirm("Desea agregar una categoría?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
		  		$scope.$apply(function(){
		  			$location.path('/AgregarCategoria').search({});
		  		});
		  	}//if
		  });
	}//AgregarCategoria

	$scope.Selecciontr = function(tr)
	{
		//Verificando que no se le hizo click al mismo tr
			if(tr.cat.id == $scope.cattr)
			{
				//Si es el mismo tr se le asigna un 0.
				$scope.cattr = 0;
				idtr = "#table"+tr.cat.id;
				$(idtr).removeClass("bg-blue");
				
			}//if
			else
			{
				$("tr").removeClass("bg-blue");
				$scope.cattr = tr.cat.id;
				idtr = "#table"+tr.cat.id;
				$(idtr).addClass("bg-blue");
				
			}
	}//Selecciontr

	$scope.Editar = function()
	{
		if($scope.cattr!=0)
			{
				bootbox.confirm("Desea editar esta Categoría?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/EditarCategoria').search({maq: $scope.cattr});
						});
				  		
				  	}//if
				});
				
			}//if
			else{$methodsService.alerta(2,"Favor de seleccionar una Máquina");}
	}//Editar

	$scope.Eliminar = function()
	{
		if($scope.cattr!=0)
			{
				bootbox.confirm("Desea Eliminar esta Categoría?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			params = $methodsService.Json("EliminarCategoria",$scope.cattr);
				  			//Enviando por ajax la peetición
				  			var url = 'modulos/Utilidades/Funciones.php';
							 $http({method: "post",url: url,data: $.param({Params:params}), 
							  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
							})
							 .success(function(data, status, headers, config) 
							 {          	
							   	exito   = data.exito;
							   	existec = data.existec;
							   	if(exito==1 && existec==1)
							   	{
							   		$scope.Categorias = data.Categorias;
							   		$methodsService.alerta(1,"Categoría eliminada!");
							   	}
							   	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}	
							  })  
							 .error(function(data, status, headers, config){
							 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
							 });
						});
				  		
				  	}//if
				});
				
			}//if
			else{$methodsService.alerta(2,"Favor de seleccionar una Máquina");}
	}//Eliminar

	//Buscando las categorías de las máquinas
	params = $methodsService.Json("BuscarCategoriasMaquina",1);
		var url = 'modulos/Utilidades/Funciones.php';
	         $http({method: "post",url: url,data: $.param({Params:params}), 
	          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	        })
	         .success(function(data, status, headers, config) 
	         {          	
	         	existe = data.existe;
	         	if(existe==1)
	         	{
	         		$scope.Categorias 	   = data.tipoMaquinas;
	         		$scope.mostrarbuscando = false;
					$scope.mostrarcat      = true;
	         	}//if
	         	else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	           	console.log(data);
	          })  
	         .error(function(data, status, headers, config){
	         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	         });

})//Categorias controller
.controller('AgregarCategorias',function($scope,$http,$location,$methodsService,$routeParams){
	$scope.GuardarCategoria = function()
	{
		bootbox.confirm("Desea agregar esta categoría?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
		  		$scope.$apply(function(){
		  			$scope.cat.Accion = "AgregarCategoria";
		  			params  = JSON.stringify($scope.cat);
		  			var url = 'modulos/Utilidades/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
			         		existe = data.existe;
			         		if(existe==1)
			         		{
			         			$methodsService.alerta(1,"Categoría, Agregada");
			         			$scope.cat = {};
			         		}
			         		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");	}
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
		  		});
		  	}//if
		  });
	}//GuardarCategoria

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir
})
.controller('EditarCategorias',function($scope,$http,$location,$methodsService,$routeParams){
	//Variables
	$scope.id  			   = $routeParams.maq;
	$scope.mostrarbuscando = true;
	$scope.mostrarform     = false;

	//Funciones
	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}//Redirigir

	$scope.EditarCat = function()
	{
		bootbox.confirm("Desea Editar esta categoría?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
		  		$scope.$apply(function(){
		  			$scope.cat.Accion = "EditarCategoria";
		  			params  = JSON.stringify($scope.cat);
		  			var url = 'modulos/Utilidades/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
			         		exito = data.exito;
			         		if(exito==1)
			         		{
			         			$methodsService.alerta(1,"Categoría Editada");
			         		}
			         		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
		  		});
		  	}//if
		  });
	}//EditarCat

//Generando el json a enviar.
	params = $methodsService.Json("BuscarCategoriaPorId",$scope.id);
	var url = 'modulos/Utilidades/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {     
         		existe = data.existe;     	
           		if(existe==1)
           		{
           			$scope.cat  	       = data.cat;
           			$scope.mostrarbuscando = false;
           			$scope.mostrarform     = true;
           		}else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
          })  
         .error(function(data, status, headers, config){
         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
         })
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