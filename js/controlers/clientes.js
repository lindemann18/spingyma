angular.module('AppClientes',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('Clientes',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
$scope.clitr           = 0;

//Funciones
$scope.RutinaCliente = function(id)
{
	bootbox.confirm("Desea ir al apartado de rutinas para clientes?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/ClientesRutina').search({id:id});
	  		});
	  	}//if
	});
}//RutinaCliente

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

$scope.Filtrar = function()
{
	params = $methodsService.Json("FiltrarClientes",$scope.cliente.opcion);
	//Filtrando los clientes.
	var url = 'modulos/Clientes/Funciones.php';
				 $http({method: "post",url: url,data: $.param({Params:params}), 
				  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				})
				 .success(function(data, status, headers, config) 
				 {          	
				   		exito = data.exito;
				   		if(exito==1)
				   		{
				   			$scope.clientes = data.clientes;
				   			$methodsService.alerta(1,"Clientes Filtrados!");
				   		}//if
				   		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
				  })  
				 .error(function(data, status, headers, config){
				 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				 });
}//Filtrar

$scope.form = function(cliente)
{
	bootbox.confirm("Desea realizar el formulario a este cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/Formulario').search({cliente:cliente});
	  		});
	  	}//if
	});
}

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
})//Clientes


.controller('ClientesAgregar',function($scope,$http,$location,$methodsService){

	//Generando los datos para el formulario

	//Días
	$scope.dias = $methodsService.dias();
	
	//meses
	$scope.meses =$methodsService.meses();

	//años
	$scope.years = $methodsService.years();
	
	//Variable para desactivar el botón de agregar
	$scope.btnen = true;

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
		  		$scope.btnen = false;
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
		         		$scope.btnen = true;
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
//Variable para desactivar el botón de agregar
$scope.btnen = true;
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
	  		$scope.btnen 		  = false;
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
			         		$scope.btnen = true;
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

.controller('formcontroller',function($scope,$http,$location,$methodsService,$routeParams,respservice,$cookies){
//Variables
$scope.cliente = $routeParams.cliente;
params    = $methodsService.Json("InfoFormulario",$scope.cliente);
$scope.mostrarbuscando = true;
$scope.mostrarcontent  = false;

//Mandando por ajax el ejercicio a eliminar
  		var url = 'modulos/Clientes/Funciones.php';
	     $http({method: "post",url: url,data: $.param({Params:params}), 
	      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	    })
	     .success(function(data, status, headers, config) 
	     {          	
	       		exito = data.respuestas;
	       		if(exito!="Error")
	       		{
	       			$scope.resp = data.respuestas;
	       			console.log($scope.resp);
	       			$scope.mostrarbuscando = false;
					$scope.mostrarcontent  = true;
	       		}//if
	       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
	      })  
	     .error(function(data, status, headers, config){
	     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
	     });

$scope.SiguienteForm = function()	     
{
	bootbox.confirm("Desea pasar al siguiente formulario?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{	$scope.$apply(function(){
	  			var resps = JSON.stringify($scope.resp);
	  			$cookies.put('resp', resps)
	  			$location.path('/Formulario2').search({});
	  		});//apply
	  	}
	  });
}//SiguienteForm

$scope.Redirigir = function(direccion)
{
	$methodsService.Redirigir(direccion);
}//Redirigir

})//formcontroller

.controller('formcontroller2',function($scope,$http,$location,$methodsService,$routeParams,respservice,$cookies){
	$scope.resp = JSON.parse($cookies.get('resp'));
	console.log($scope.resp);

//funciones
$scope.Redirigir = function(direccion)
{
	$methodsService.Redirigir(direccion);
}//Redirigir

$scope.RegistrarForm = function()	
{
	bootbox.confirm("Desea pasar al siguiente formulario?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{	$scope.$apply(function(){
	  			$scope.resp.Accion = "RegistrarForm";
	  			//Enviadno los datos por ajax.
	  			params   			  = JSON.stringify($scope.resp);
		  		var url = 'modulos/Clientes/Funciones.php';
			         $http({method: "post",url: url,data: $.param({Params:params}), 
			          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
			        })
			         .success(function(data, status, headers, config) 
			         {          	
				         exito = data.exito;
				         if(exito==1)
				         {
				         	$methodsService.alerta(1,"Datos Guardados!");
				         	$cookies.remove("resp");
				         }//if
				         else
				         {
				         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				         }
			          })  
			         .error(function(data, status, headers, config){
			         	$methodsService.alerta(2,"algo falló, disculpe las molestias");
			         });
	  		});//apply
	  	}//if
	  });//botbox

}//RegistrarForm

})

.controller('RutinaClientes',function($scope,$http,$location,$methodsService,$routeParams){
$scope.id_cliente = $routeParams.id;
$params = $methodsService.Json("InfoClienteRutinas",$scope.id_cliente);

//Funciones
$scope.InfoRutina = function(id)
{
	bootbox.confirm("Desea ver la rutina de este cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{	$scope.$apply(function(){
	  			
	  		});//apply
	  	}//if
	  });//botbox
}//InfoRutina

$scope.RedirigirRutina = function(id)
{
	bootbox.confirm("Desea asignar una rutina a este cliente?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{	$scope.$apply(function(){
	  			$location.path('/RutinasAsignar').search({id:id});
	  		});//apply
	  	}//if
	  });//botbox
}//RedirigirRutina

var url = 'modulos/Clientes/Funciones.php';
 $http({method: "post",url: url,data: $.param({Params:params}), 
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
})
 .success(function(data, status, headers, config) 
 {          	
   		exito = data.exito;
   		if(exito==1)
   		{
   			$scope.datos = data.resultado;
   		}//if
  })  
 .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});
})//RutinaClientes

.controller('AsignarRutinas',function($scope,$http,$location,$methodsService,$routeParams){
alert("yo");
$scope.id = $routeParams.id;

// Verificando que el cliente no tenga rutnia asignada.
//Buscando las rutinas
params = $methodsService.Json("ExisteRutinaCliente",$scope.id);
var url = 'modulos/Clientes/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		cantidad = data.cantidad;
       		if(cantidad>0)
       		{
       			pagina = 0;
       		}//if
       		else{pagina = 1;}
       		dir = $scope.obtenerdir(pagina);
			
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });


$scope.obtenerdir = function(pagina)
{
	var direccion="";
	switch(pagina)
	{
		case '0':
			direccion = 'modulos/Clientes/paginas/rutinas_asignas.html';
		break;

		case '1':
			direccion = 'modulos/Clientes/paginas/rutinas_desasignar.html';
		break;
	}//switch

	return direccion;
}//

})

.service('respservice', function() {
  var respuestas = [];

  var addresp = function(newObj) {
      respuestas = newObj;
  };

  var getresp = function(){
      return respuestas;
  };

  return {
    addresp: addresp,
    getresp: getresp
  };

});