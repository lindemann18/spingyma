angular.module('AppBiotest',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies',"highcharts-ng"])

.controller('MenuBiotest',function($scope,$http,$location,$methodsService,$routeParams){
	// Variables
	$scope.Cliente  = $routeParams.Cliente;
	$scope.showsend = false;
	$scope.errormsj = "";
	$scope.fallo    = 2;
	//Funciones
	$scope.enviar = function()
	{
		bootbox.confirm("Desea enviar los resultados del biotest?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
				var params = $methodsService.Json("UltimoBiotestCliente",$scope.cliente);
				var url = 'modulos/Biotest/crearPdfarchivo.php?Id_Cliente='+$scope.Cliente;
				$scope.showsend = true;
				 $http({method: "post",url: url,data: $.param({Params:params}), 
				  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
				})
				 .success(function(data, status, headers, config) 
				 {     
				 		exito 			= data.exito;
				 		$scope.showsend = false;
				 		if(exito==1)
				 		{
				 			$scope.fallo = 0; 
				 		}else{$scope.fallo=1; $scope.errormsj = "Error de mailing";}
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
		bootbox.confirm("Desea Aplicar el biotest?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
				$location.path('/Biotest').search({Cliente:$scope.Cliente});
			});
	  	}//if
	  });
		
	}
})

.controller('BiotestC',function($scope,$http,$location,$methodsService,$routeParams){
//Funciones
$scope.cliente = $routeParams.Cliente;
$scope.biotest = {peso:"",altura:"",espalda:"",pecho:"",abdomen:"",cadera:"",brazo:"",muslo:"",Accion:""};
//Se debe verificar el último biotest del cliente.s
var params = $methodsService.Json("UltimoBiotestCliente",$scope.cliente);
var url = 'modulos/Biotest/Funciones.php';
 $http({method: "post",url: url,data: $.param({Params:params}), 
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
})
 .success(function(data, status, headers, config) 
 {          	
   		$scope.permiso = data.permiso;
   		$scope.diastrans = data.Dias_trans;
   		if($scope.permiso==1)
   		{
   			$scope.url = "modulos/Biotest/paginas/form.html";
   		}//if
   		else
   		{
   			$scope.url = "modulos/Biotest/paginas/error.html";
   		}
  })  
 .error(function(data, status, headers, config){
 	$methodsService.alerta(2,"algo falló, disculpe las molestias");
 });

$scope.Redirigir = function(direccion)
{
	bootbox.confirm("Desea regresar a clientes?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
			$methodsService.Redirigir(direccion);
			});
	  	}//if
	  });
}

$scope.EjecutarTest = function()
{
	bootbox.confirm("Desea ejecutar el biotest?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$scope.biotest.Accion  = "EjecutarTest";
	  			$scope.biotest.cliente = $scope.cliente;
	  			console.log($scope.biotest);
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
	var params         = $methodsService.Json("ResultadosBiotest",$scope.cliente);
	
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
	   				$scope.peso 	= data.peso;
	   				$scope.imc  	= data.imc;
	   				$scope.imm  	= data.imm;
	   				$scope.immAnt   = data.immAnt;
	   				$scope.consejoP = data.consejoPeso;
	   				$scope.consejoI = data.consejoimc;
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

				        //Definiendo los datos de la prueba de IMM.
				        $scope.Fecha=$scope.imm[0].fh_creacion; //Fecha para todas las primeras 8 pruebas.
						
						//Perímetro brazo relajado
						Espalda       = "IMM - Espalda";
						$scope.Per_Espalda	  = "";
						//Perímetro brazo_flexionado
						Pecho 		  = "IMM - Pecho";
						$scope.Per_Pecho	  = "";
						//Perímetro Femoral
						Abdomen 	  = "IMM - Abdomen";
						$scope.Per_Abdomen	  = "";
						//Perímetro de pantorrilla
						Cadera 		  = "IMM - Cadera";
						$scope.Per_Cadera	  = "";
						//Perímetro Cintura
						Brazo	      = "IMM - Brazo";
						$scope.CantidadBrazo = "";
						//Perímetro Cadera
						Muslo		  = "IMM - Muslo";
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
					$scope.Per_Pecho2	   = "";
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
						$scope.Per_Pecho2	  = 0;
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
					$scope.chartimm = {
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

					//Definiendo los cambios entre los resultados de IMM
					// Espalda
					Reses=$scope.Per_Espalda-$scope.Per_Espalda2;
					if($scope.Per_Espalda==Reses)ResEspalda="Primer Biotest";
					if(Reses>0 && $scope.Per_Espalda!=Reses)ResEspalda="Aumentaste: "+Reses;
					if(Reses==0)ResEspalda="Sin Cambios";
					if(Reses<0)ResEspalda="Disminuiste: "+(Reses*-1);
					console.log(ResEspalda);
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

$scope.Redirigir = function(direccion)
{
	bootbox.confirm("Desea regresar a clientes?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
			$methodsService.Redirigir(direccion);
			});
	  	}//if
	  });
}//Volver

$scope.ObtenerOptions = function(Fecha,Fecha2,Per_Espalda,Per_Pecho,Per_Abdomen,Per_Cadera,CantidadBrazo,CantidadMuslo,Per_Espalda2,Per_Pecho2,Per_Abdomen2,Per_Cadera2,CantidadBrazo2,CantidadMuslo2)
{
	options = {
		options: {chart: {type: 'bar'}},
		series: [
		{name: Fecha,color: "#00a65a",data: [Per_Espalda,Per_Pecho,Per_Abdomen,Per_Cadera,CantidadBrazo,CantidadMuslo]}, 
		{name: Fecha2,color:"#428bca",data: [Per_Espalda2,Per_Pecho2,Per_Abdomen2,Per_Cadera2,CantidadBrazo2,CantidadMuslo2]}],
		title: {text: "IMM"},loading: false
	};
	return options;
}//Obtener optiosn



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