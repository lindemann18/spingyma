angular.module('AppBiotest',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies',"highcharts-ng"])

.controller('BiotestC',function($scope,$http,$location,$methodsService,$routeParams){
//Funciones
$scope.cliente = $routeParams.Cliente;

$scope.EjecutarTest = function()
{
	bootbox.confirm("Desea ejecutar el biotest?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.biotest.Accion  = "EjecutarTest";
	  			$scope.biotest.cliente = $scope.cliente;
	  			var params = JSON.stringify($scope.biotest);
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
				   		switch(true)
				   		{
				   			case exitoPeso==1 && exitoimc==1:
				   				//Si entra aquí se redirige al apartado de resultados.
				   				$location.path('/BiotestResultados').search({cliente:$scope.cliente});
				   			break;

				   			case exitoimc==0:
				   				//Dirigiendo a la página de errores del test
				   			break;

				   			case exitoPeso==0:
				   				//Dirigiendo a la página de errores del test
				   				$location.path('/BiotestError').search({cliente:$scope.cliente,peso:$scope.biotest.peso,alt: $scope.biotest.altura});
				   			break;
				   		}//switch
				  })  
				 .error(function(data, status, headers, config){
				 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
				 });
	  		});
	  	}//if
	});
}//EjecutarTest

})//BiotestC

.controller('ErrorBiotest',function($scope,$http,$location,$methodsService,$routeParams,$cookies){
	$scope.peso    = $routeParams.peso;
	$scope.altura  = $routeParams.alt;
	$scope.cliente = $routeParams.cliente;

	$scope.Volver = function()
	{
		$location.path('/Biotest').search({Cliente:$scope.cliente});
	}//Volver

})//ErrorBiotest

.controller('ResultadosBiotest',function($scope,$http,$location,$methodsService,$routeParams,$cookies){
	$scope.cliente = $routeParams.cliente;
	params         = $methodsService.Json("ResultadosBiotest",$scope.cliente);
	
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
	   				$scope.peso 	= data.peso;
	   				$scope.imc  	= data.imc;
	   				$scope.imm  	= data.imm;
	   				$scope.immAnt   = data.immAnt;
	   				$scope.condpeso = $scope.peso[0].resultado;
	   				$scope.condIMC  = $scope.imc[0].resultado;
	   				$methodsService.ResultadoPeso($scope.peso[0].porcentaje,"#ProgresBarPeso");
	   				$methodsService.ResultadoPeso($scope.imc[0].porcentaje,"#ProgresBarIMC");

	   				//Creando las high charts de peso.
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
					//$scope.options = this.ObtenerOptions(fecha3,$scope.resultado3,fecha2,resultado2,fecha1,resultado1,TituloPrueba,categoria);
					
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
				         series: [{name: fecha1,color: "#00a65a",data: [resultado1imc]}, {
				            name: fecha2,
				            color:"#428bca",
				            data: [resultado2imc]
				        }, {name: fecha3,color:"#f56954",data: [resultado3imc]}],
				        title: {text: TituloPrueba},loading: false};

				    $scope.chartConfig2 = {
				         options: {chart: {type: 'bar'}},
				       series: [{name: fecha1imc,color: "#00a65a",data: [resultado1imc]}, 
				       {name: fecha2imc,color:"#428bca",data: [resultado2imc]}, 
				       {name: fecha3imc,color:"#f56954",data: [resultado3imc]}],
				        title: {text: TituloPruebaimc},loading: false};

				        //Definiendo los datos de la prueba de IMM.
				        Fecha=pruebas[0].Fecha; //Fecha para todas las primeras 8 pruebas.
					//Perímetro brazo relajado
					Perimetro_brazo_relajado   = "IMM - Espalda";
					Per_Brazo				   = "";
					//Perímetro brazo_flexionado
					Perimetro_brazo_flexionado = "IMM - Pecho";
					Per_Brazo_Fle			   = "";
					//Perímetro Femoral
					Perimetro_femoral = "IMM - Abdomen";
					Per_Femoral		  = "";
					//Perímetro de pantorrilla
					Perimetro_Pantorrilla = "IMM - Cadera";
					Per_Pantorrilla		  = "";
					//Perímetro Cintura
					Cintura			= "IMM - Brazo";
					CantidadCintura = "";
					//Perímetro Cadera
					Cadera		   = "IMM - Muslo";
					CantidadCadera = "";
					
					//Se hace en un ciclo por que no se sabe en que orden vienen.
					for(i=0; i<6; i++)
					{
						//Tomando los valores de las pruebas a partir del nombre de las mismas.
						switch($scope.imm[i].DescPrueba)
						{
							case "IMM - Espalda": 
								Per_Brazo = $scope.imm[i].porcentaje;
							break;
							case 'IMM - Pecho': 
								Per_Brazo_Fle = $scope.imm[i].porcentaje;
							break;
							case 'IMM - Abdomen': 
								Per_Femoral = $scope.imm[i].porcentaje;
							break;
							case 'IMM - Cadera': 
								Per_Pantorrilla = $scope.imm[i].porcentaje;
							break;
							case 'IMM - Brazo': 
								CantidadCintura = $scope.imm[i].porcentaje;
							break;
							case 'IMM - Muslo': 
								CantidadCadera = $scope.imm[i].porcentaje;
							break;
							
						}//switch
						
					}//for

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