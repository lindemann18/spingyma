<?php
	session_start();
	if(isset($_SESSION['usuario']) && $_SESSION['usuario']['id']!="")
	{
?>
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-locale_es-mx.js"></script>
<script src="js/dirPagination.js"></script>
<script src="js/angular-cookies.min.js"></script>
<script src="js/bootbox.min.js" type="text/javascript"></script>
<script src="js/highcharts-ng.js" type="text/javascript"></script>
<!-- Controlers-->
<script src="js/users.js"></script>
<script src="js/methods.js"></script>
<script src="js/controlers/utilidades.js"></script>
<script src="js/controlers/componentesrutinas.js"></script>
<script src="js/controlers/rutinas.js"></script>
<script src="js/controlers/clientes.js"></script>
<script src="js/controlers/biotest.js"></script>
<script src="js/controlers/clientes_rutina.js"></script>
<script src="js/controlers/biotest_ultra.js"></script>
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
	angular.module('app',['ngRoute','AppUsuarios','Methods','AppUtilidades','AppRutinasComp','AppClientes','ngCookies','Rutinas','AppBiotest','AppClientesRutina','AppBiotestUltra'])
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

	    .when('/Ejercicios',{
	    	controller: 'Ejercicios',
	      	templateUrl:'modulos/Rutinas/Ejercicios.html'
	    })
	    .when('/RegistrarEjercicio',{
	    	controller: 'EjercicioRegistrar',
	      	templateUrl:'modulos/Rutinas/Ejercicios_registrar.html'
	    })
	    .when('/EditarEjercicio',{
	    	controller: 'EjercicioEditar',
	      	templateUrl:'modulos/Rutinas/Ejercicio_Editar.html'
	    })

	    .when('/Rutinas',{
	    	controller: 'infoRutinas',
	      	templateUrl:'modulos/Rutinas/Rutinas.html'
	    })

	    .when('/AgregarRutina',{
	    	controller: 'RutinaAgregar',
	      	templateUrl:'modulos/Rutinas/Rutinas_Registrar.html'
	    })

	    .when('/AgregarRutina2',{
	    	controller: 'RutinaAgregar2',
	      	templateUrl:'modulos/Rutinas/Rutinas_Registrar2.html'
	    })

	    .when('/RutinaComp',{
	    	controller: 'RutinaCompleja',
	      	templateUrl:'modulos/Rutinas/Rutina_Comp.html'
	    })

	    .when('/RutinaOrdenEnt',{
	    	controller: 'RutinaOrden',
	      	templateUrl:'modulos/Rutinas/RutinaOrden.html'
	    })

	    .when('/RutinaPrefinal',{
	    	controller: 'Rutinaprefinal',
	      	templateUrl:'modulos/Rutinas/Rutinas_Prefinal.html'
	    })

	    .when('/EditarRutina',{
	    	controller: 'RutinaEditar',
	      	templateUrl:'modulos/Rutinas/Rutinas_EditarDatos.html'
	    })

	    .when('/EditarDiasRutina',{
	    	controller: 'DiasRutinaEditar',
	      	templateUrl:'modulos/Rutinas/Rutinas_Editar.html'
	    })

	    .when('/Rutinas_EditarDias',{
	    	controller: 'DiasRutinaSeleccion',
	      	templateUrl:'modulos/Rutinas/Rutinas_EditarDias.html'
	    })

	    .when('/Rutina_CompEdit',{
	    	controller: 'RutinaCompEdit',
	      	templateUrl:'modulos/Rutinas/Rutina_CompEdit.html'
	    })

	    .when('/Rutina_EditarSencillo',{
	    	controller: 'RutinaEditarSencillo',
	      	templateUrl:'modulos/Rutinas/Rutina_EditarSencillo.html'
	    })

	    .when('/Error',{
	    	controller: 'Errors',
	      	templateUrl:'modulos/Rutinas/Error.html'
	    })

	    //direcciones de Clientes
	    .when('/Clientes',{
	    	controller: 'Clientes',
	      	templateUrl:'modulos/Clientes/clientes_listado.html'
	    })

	    .when('/AgregarCliente',{
	    	controller: 'ClientesAgregar',
	      	templateUrl:'modulos/Clientes/clientes_registrar.html'
	    })

	    .when('/EditarCliente',{
	    	controller: 'ClientesEditar',
	      	templateUrl:'modulos/Clientes/clientes_editar.html'
	    })

	    .when('/Formulario',{
	    	controller: 'formcontroller',
	      	templateUrl:'modulos/Clientes/Formulario.html'
	    })

	    .when('/Formulario2',{
	    	controller: 'formcontroller2',
	      	templateUrl:'modulos/Clientes/Formulario2.html'
	    })

	    .when('/ClientesRutina',{
	    	controller: 'RutinaClientes',
	      	templateUrl:'modulos/Clientes/clientes_rutina.html'
	    })

	    .when('/RutinaOrdenC',{
	    	controller: 'RutinaOrdenC',
	      	templateUrl:'modulos/Clientes/RutinaOrden.html'
	    })

	    .when('/RutinasAsignar',{
	    	controller: 'AsignarRutinas',
	      	templateUrl:'modulos/Clientes/Asignar_Rutinas.html'
	    })

	    .when('/Rutinas_Registrar',{
	    	controller: 'ClientesRutina',
	      	templateUrl:'modulos/Clientes/Rutinas_Registrar.html'
	    })
	    
	    .when('/RutinaPrefinalC',{
	    	controller: 'RutinaprefinalC',
	      	templateUrl:'modulos/Clientes/Rutinas_Prefinal.html'
	    })

	    .when('/RutinaCompC',{
	    	controller: 'RutinaComplejaC',
	      	templateUrl:'modulos/Clientes/Rutina_Comp.html'
	    })

	    .when('/AgregarRutina2C',{
	    	controller: 'RutinaAgregar2C',
	      	templateUrl:'modulos/Clientes/Rutinas_Registrar2.html'
	    })


	    //Direcciones de biotest.
	    .when('/BiotestMenu',{
	    	controller: 'MenuBiotest',
	      	templateUrl:'modulos/Biotest/biotest_menu.html'
	    })
	    .when('/Biotest',{
	    	controller: 'BiotestC',
	      	templateUrl:'modulos/Biotest/Biotest.html'
	    })

	    .when('/BiotestError',{
	    	controller: 'ErrorBiotest',
	      	templateUrl:'modulos/Biotest/Error.html'
	    })
	    .when('/BiotestResultados',{
	    	controller: 'ResultadosBiotest',
	      	templateUrl:'modulos/Biotest/Resultadolight.html'
	    })

	    //Direcciones de Biotest Ultra
	     .when('/Biotestultra',{
	    	controller: 'BiotestUltra',
	      	templateUrl:'modulos/BiotestUltra/clientes_listado.html'
	    })

	     .when('/BiotestUltraMenu',{
	    	controller: 'BiotestUltraC',
	      	templateUrl:'modulos/BiotestUltra/biotest_menu.html'
	    })

	     .when('/BiotestUltraAplicar',{
	    	controller: 'UltraBiotest',
	      	templateUrl:'modulos/BiotestUltra/biotest.html'
	    })

	     .when('/BiotestUltraResultados',{
	    	controller: 'ResultadosUltraBiotestPeso',
	      	templateUrl:'modulos/BiotestUltra/ResultadoPeso.html'
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