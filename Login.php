<!doctype html>
<html ng-app="app">
<head >

	<!-- Basics -->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>Login</title>

	<!-- CSS -->
	
	<link rel="stylesheet" href="css/Login/reset.css">
	<link rel="stylesheet" href="css/Login/animate.css">
	<link rel="stylesheet" href="css/Login/styles.css">
	<script src="js/angular.min.js"></script>
	<script src="js/jquery-1.11.1.min.js"></script>
</head>

	<!-- Main HTML -->

<body ng-app>
	
	<!-- Begin Page Content -->
	
	<div id="container" ng-controller="LoginController">
		<h1>login</h1>
		<form  ng-submit="LoginUsuario()" role="form" name="form">
		
		<label for="name">Username:</label>
		
		<input type="name" name="nb_usuario" ng-model="usuario.name" required>
		
		<label for="username">Password:</label>
		
		<p><a href="#">Forgot your password?</a>
		
		<input type="password" name="pw_password" ng-model="usuario.password" required>
		
		<div id="lower">
		
		<input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label>
		
		<input type="submit" value="Login">
		
		</div>
		
		</form>
		
	</div>
	
	
	<!-- End Page Content -->
	
</body>

</html>
	
	<script>
	
	$(document).ready(function(){
		
	});

	 /* Angular */
	 var app = angular.module("app",[]);
	 app.controller("LoginController",['$scope','$log','$http', function($scope,$log,$http){

     $scope.usuario  = 
     {
     	name:"",
     	password:"",
     	activo:true
     };
    

      $scope.LoginUsuario = function()
      {
      	

      	 // Mandando por ajax, verificando la existencia del usuario. 
      	 //Obteniendo todos los datos y pintando todo
		Arr 		 	= new Object();
		Arr['usuario']  = $scope.usuario.name;
		Arr['password'] = $scope.usuario.password;
		Arr['Accion'] 	= "LoginUsuario";
		params 			= JSON.stringify(Arr);

     	var url = 'modulos/usuarios/Funciones.php';
        $http({
	      method: "post",
		      url: url,
		      data: $.param({Params:params}), 
		      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
	     	})
	       .success(function(data, status, headers, config) 
	       {
	    		existe = data.existe;
	    		console.log(existe);
	    		if(existe==1)
	    		{
	    			window.location = "index.php";
	    		}//if
	    		else
	    		{
	    			alert("ocurrió un error")
	    		}//else
	      	})
	       .error(function(data, status, headers, config) 
	       	{
	        	alert("Ha fallado la petición. Estado HTTP:"+status);
	      	});
	    }//LoginUsuario
  	}]);

	function CambiarColorAlerta(tipo_cambio,texto)
	{
		// Los tipos de cambio serán 1 y 2
		// 1) cuando la alerta es verde, mostrando algo positivo.
		// 2) cuando la alerta es roja, mostrando algo negativo, como errores.
		switch(tipo_cambio)
		{
			case 1:
			//Aquí la alerta se vuelve positiva.
			if($("#alerta").hasClass("alert-danger"))
			{
				$("#alerta").removeClass("alert-danger");
				$("#alerta").addClass("alert-success");
			}//if
			break;

			case 2:
			//Aquí la alerta se vuelve negativa.
			if($("#alerta").hasClass("alert-success"))
			{
				$("#alerta").removeClass("alert-success");
				$("#alerta").addClass("alert-danger");
			}//if
			break;
		} // switch

		$("#ErrorTexto").text(texto);
		$("#alerta").css("display","inherit");
		$("#alerta").fadeOut(5000);
		//
	}//CambiarColorAlerta

	
</script>
	
	
	
		
	