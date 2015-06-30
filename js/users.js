angular.module('AppUsuarios',['ngRoute','angularUtils.directives.dirPagination','Methods'])

	.controller('Users',function($scope,$http,$location,$methodsService){

		//Variables
		$scope.currentPage     = 1; // Página actual, para paginación
        $scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
		$scope.mostrarbuscando = true;	
		$scope.mostrarUsuarios = false;	
		$scope.usertr          = 0;


		// Funciones
		$scope.Selecciontr = function(tr)
		{
			//Verificando que no se le hizo click al mismo tr
			if(tr.user.id == $scope.usertr)
			{
				//Si es el mismo tr se le asigna un 0.
				$scope.usertr = 0;
				idtr = "#table"+tr.user.id;
				$(idtr).removeClass("bg-blue");
			}//if
			else
			{
				$("tr").removeClass("bg-blue");
				$scope.usertr = tr.user.id;
				idtr = "#table"+tr.user.id;
				$(idtr).addClass("bg-blue");
			}
			
			//añadiendo la clase al tr
			
		}//Selecciontr

		$scope.AgregarUsuario = function()
		{
			bootbox.confirm("Desea Agregar Un usuario nuevo?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/AgregarUsuario').search({});
						});
				  		
				  	}
				});
			
		}//AgregarUsuario

		$scope.Editar = function()
		{
			if($scope.usertr!=0)
			{
				bootbox.confirm("Desea editar este usuario?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			$location.path('/EditarUsuario').search({user: $scope.usertr});
						});
				  		
				  	}
				});
				
				 
			}//if
			else
			{
				$methodsService.alerta(2,"Favor de seleccionar un usuario");
			}
		}//Editar

		$scope.EliminarUsuario = function()
		{
			if($scope.usertr!=0)
			{
				bootbox.confirm("Desea eliminar a este usuario?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			// Eliminando al usuario seleccionado.
				  			params = $methodsService.Json("EliminarUsuario",$scope.usertr);
				  			//Enviando por ajax la peetición
				  			var url = 'modulos/usuarios/Funciones.php';
							 $http({method: "post",url: url,data: $.param({Params:params}), 
							  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
							})
							 .success(function(data, status, headers, config) 
							 {          	
							   		//Tomando los datos
							   		respuesta = data.respuesta;
							   		if($scope.usertr==respuesta)
							   		{
							   			$methodsService.alerta(1,"Usuario Eliminado!");
							   			$scope.usuarios = data.usuarios
							   		}//if
							   		else
							   		{
							   			$methodsService.alerta(2,"algo falló, disculpe las molestias");
							   		}
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
				$methodsService.alerta(2,"Favor de seleccionar un usuario");
			}
		}//EliminarUsuario

		// Definiendo el comportamiento onclick de la tabla
		//angular.element('#listados tbody').on

		//Buscando a los usuarios.
		Arr           = new Object();
        Arr['Accion'] = "BuscarUsuarios";
        params        = JSON.stringify(Arr);
        var url = 'modulos/usuarios/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         { 
         	console.log(data);
           		existe = data.existe;
           		if(existe!=1)
           		{
           			$methodsService.alerta(2,"algo falló, disculpe las molestias");
           		}
           		else
           		{
           			$scope.usuarios = data.usuarios;
	           		$scope.mostrarbuscando = false;
	           		$scope.mostrarUsuarios = true;
	           		console.log($scope.usuarios);
           		}
           		
          })  
         .error(function(data, status, headers, config){
         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
         });


	})

.controller('UsersEdit',function($scope,$http,$location,$methodsService,$routeParams){
	// Recibiendo los parámetros por get y buscando al empleado.
	$scope.id = $routeParams.user;

	//variables
	$scope.mostrarbuscando = true;
	$scope.mostrarform     = false;

	// Métodos

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}

	$scope.EditarUsuario = function()
	{
		bootbox.confirm("Desea editar este usuario?", function(result) {
					console.log(result);
				  	if(result==true)
				  	{
				  		$scope.$apply(function(){
				  			//Enviando el usuario a editar.
							$scope.usuario.Accion = "EditarUsuario";
							params        = JSON.stringify($scope.usuario);
							var url = 'modulos/usuarios/Funciones.php';
							 $http({method: "post",url: url,data: $.param({Params:params}), 
							  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
							})
							 .success(function(data, status, headers, config) 
							 {          	
							   		//Verificando la respuesta, si es igual al id,t odo salió bien.
							   		respuesta = data.respuesta;
							   		if(respuesta==$scope.id)
							   		{
							   			$methodsService.alerta(1,"Usuario editado!");
							   		}//if
							   		else
							   		{
							   			$methodsService.alerta(2,"algo falló, disculpe las molestias");
							   		}
							  })  
							 .error(function(data, status, headers, config){
							 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
							 });
						});
				  		
				  	}
				});
		
	}//EditarUsuario
	 
	//Generando el json a enviar.
	params = $methodsService.Json("BuscarInfoClientePorId",$scope.id);
	var url = 'modulos/usuarios/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {          	
           		existe = data.existe;
           		if(existe!=0)
           		{
           			$scope.usuario = data.usuario;
           			console.log($scope.usuario);
           			$scope.mostrarbuscando = false;
           			$scope.mostrarform     = true;
           		}
           		else
           		{
           			$methodsService.alerta(2,"algo falló, disculpe las molestias");
           		}//else
          })  
         .error(function(data, status, headers, config){
         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
})

.controller('AgregarUsuarios',function($scope,$http,$location,$methodsService){

	// Métodos
	$scope.AgregarUsuario = function()
	{
		bootbox.confirm("Desea Guardar este usuario?", function(result) {
			console.log(result);
		  	if(result==true)
		  	{
		  		$scope.$apply(function(){
		  			//enviando por ajax la información.
		  			$scope.usuario.Accion = "AgregarUsuario";
					params        = JSON.stringify($scope.usuario);
					var url = 'modulos/usuarios/Funciones.php';
					 $http({method: "post",url: url,data: $.param({Params:params}), 
					  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
					})
					 .success(function(data, status, headers, config) 
					 {          	
					   		//Verificando la respuesta, si es igual al id,t odo salió bien.
					   		agregado = data.agregado;
					   		if(agregado==1)
					   		{
					   			$methodsService.alerta(1,"Usuario Agregado!");
					   			$scope.usuario = [];
					   		}//if
					   		else
					   		{
					   			$methodsService.alerta(2,"algo falló, disculpe las molestias");
					   		}
					  })  
					 .error(function(data, status, headers, config){
					 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
					 });
				});//Apply
		  		
		  	}//if
		});//Bootbox
	}//AgregarUsuario

	$scope.Redirigir = function(direccion)
	{
		$methodsService.Redirigir(direccion);
	}
})