<?php
	session_start();
	if(isset($_SESSION['usuario']) && $_SESSION['usuario']['id']!="")
	{
?>
<!-- js -->
<script src="js/angular.min.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-locale_es-mx.js"></script>
<script src="js/dirPagination.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootbox.min.js" type="text/javascript"></script>
<!-- Controlers-->
<script src="js/users.js"></script>
<script src="js/methods.js"></script>
<script src="js/controlers/utilidades.js"></script>
<script src="js/controlers/componentesrutinas.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/loading.css" />
<!-- jQuery 2.0.2 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php include('includes/head.php');?>

<body class="skin-blue" ng-app="app">
<?php include('modulos/header/header.php');?>


<div class="wrapper row-offcanvas row-offcanvas-left">
<?php include('modulos/menu_izquierdo.php');?>

<div  id="main-container" ng-view>
	
</div><!-- main container -->
<?php include('includes/footer.php');?>

<?php }else {header("Location: Login.php");}?>


        
</body>
</html>

<script type="text/javascript">
	angular.module('app',['ngRoute','AppUsuarios','Methods','AppUtilidades','AppRutinasComp'])
	.config(function($routeProvider)
	{
	    $routeProvider
	    .when('/',{
	      templateUrl:'modulos/inicio.html'

	    })
	    //Rutas de usuarios
	    .when('/Usuarios',{
	      templateUrl:'modulos/Usuarios/usuarios_listado.html'
	    })
	    .when('/EditarUsuario',{
	      templateUrl:'modulos/Usuarios/usuarios_editar.html'
	    })
	    .when('/AgregarUsuario',{
	      	templateUrl:'modulos/Usuarios/usuarios_registrar.html'
	    })

	    //Rutas de Utilidades
	    .when('/Consejos',{
	    	controller: 'Consejos',
	      	templateUrl:'modulos/Utilidades/Consejos.html'
	    })
	    .when('/EditarConsejo',{
	    	controller: 'ConsejosEditar',
	      	templateUrl:'modulos/Utilidades/Consejo_Editar.html'
	    })
	    .when('/Maquinas',{
	    	controller: 'Maquinas',
	      	templateUrl:'modulos/Utilidades/Maquinas.html'
	    })
	    .when('/EditarMaquina',{
	    	controller: 'MaquinasEditar',
	      	templateUrl:'modulos/Utilidades/Maquina_Editar.html'
	    })
	    .when('/AgregarMaquina',{
	    	controller: 'MaquinasAgregar',
	      	templateUrl:'modulos/Utilidades/maquinas_registrar.html'
	    })
	    .when('/CategoriaMaquinas',{
	    	controller: 'Categorias',
	      	templateUrl:'modulos/Utilidades/Categorias_Maquinas.html'
	    })
	    .when('/AgregarCategoria',{
	    	controller: 'AgregarCategorias',
	      	templateUrl:'modulos/Utilidades/Categoria_Registrar.html'
	    })
	    .when('/EditarCategoria',{
	    	controller: 'EditarCategorias',
	      	templateUrl:'modulos/Utilidades/Categoria_Editar.html'
	    })
	    //Rutas de rutinas
	    .when('/TiposRutina',{
	    	controller: 'TiposRutina',
	      	templateUrl:'modulos/Rutinas/Tipos_Rutina.html'
	    })
	    .when('/AgregarTiposRutina',{
	    	controller: 'TiposRutinaAgregar',
	      	templateUrl:'modulos/Rutinas/Registro_TipoRutina.html'
	    })

	    .when('/EditarCategoria',{
	    	controller: 'CategoriaEditar',
	      	templateUrl:'modulos/Rutinas/Editar_TipoRutina.html'
	    })

	    .when('/Musculos',{
	    	controller: 'Musculos',
	      	templateUrl:'modulos/Rutinas/Musculos.html'
	    })

	    .when('/AgregarMusculo',{
	    	controller: 'MusculosAgregar',
	      	templateUrl:'modulos/Rutinas/Registro_Musculos.html'
	    })

	    .when('/EditarMusculo',{
	    	controller: 'MusculosEditar',
	      	templateUrl:'modulos/Rutinas/Editar_Musculo.html'
	    })
	    .when('/Error',{
	    	controller: 'Errors',
	      	templateUrl:'modulos/Rutinas/Error.html'
	    })

	    .otherwise({
	      redirectTo:'/'
	    });/*otherwhise*/

  	})  /*angular.module*/
.directive('a', function() {
    return {
        restrict: 'E',
        link: function(scope, elem, attrs) {
            if(attrs.toggle){
                elem.on('click', function(e){
                    e.preventDefault();
                });
            }
        }
   };
})
    	.controller('Principal',function($scope,$http){
    		$(".Navegacion li").removeClass("active");
    		//Abriendo el logout.
    		$("#logout").click(function(){
    			$('.dropdown-toggle').dropdown()
    		});

    		
 	 })/*Usuarios*/
		
</script>		