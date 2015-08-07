<?php
 // INCLUDE THE phpToPDF.php FILE
		
		include("../../libs/libs.php");
		$conexion   = new ConexionBean(); //Variable de conexión
		$con        = $conexion->_con(); //Variable de conexión
		// Tomando los datos.
		

		$id_cliente   = $_GET['Id_Cliente'];
		$consultar   = new Consultar();
		$Utilidades  = new Utilidades();
		$json_return = $Utilidades->ReportePdf($id_cliente);
		$decode      = json_decode($json_return,true);
		//Datos de Peso.
		$Peso         = $decode['Peso']; //Array de resultados de la prueba de Peso.
		$BarraPeso    = $Peso[0]['Barra'];
		$LongitudPeso = $Peso[0]['Longitud'];
		$ConsejoPeso  = $Peso[0]['consejo'];
		$PorcenPeso1  = $Peso[0]['Porcentaje'];
		$fechaPeso    = $Peso[0]['fecha'];
		$PorcenPeso2  = $Peso[1]['Porcentaje'];
		$fechaPeso2   = $Peso[1]['fecha'];
		$PorcenPeso3  = $Peso[2]['Porcentaje'];
		$fechaPeso3   = $Peso[2]['fecha'];

		//Datos de IMC
		$Imc 	      = $decode['Imc'];
		$BarraImc     = $Imc[0]['Barra'];
		$LongitudImc  = $Imc[0]['Longitud'];
		$ConsejoImc   = $Imc[0]['consejo'];
		$PorcenImc1   = $Imc[0]['porcentaje'];
		$fechaImc     = $Imc[0]['fh_creacion'];
		$PorcenImc2   = $Imc[1]['porcentaje'];
		$fechaImc2    = $Imc[1]['fh_creacion'];
		$PorcenImc3   = $Imc[2]['porcentaje'];
		$fechaImc3    = $Imc[2]['fh_creacion'];

		// Datos de IMM
		$IMM 		     = $decode['IMM'];
		$fecha			 = $IMM['fecha'];
		

		// DAtos de IMM2
		//Tomando los datos del IMM2.
		$IMM2 		 	  = $decode['IMM2'];
		

		//Datos de la diferencia de IMM
		$resultadosIMM = $decode['resultadosIMM'];

		
		//Consultar la información del cliente
		$ResultCliente   = $consultar->_ConsultarClientesPorId($id_cliente);
		$nb_nombre 	  	 = $ResultCliente['nb_cliente'];
		$nb_apellidos 	 = $ResultCliente['nb_apellidos'];
		$de_email	  	 = $ResultCliente['de_email'];

		$nombre_completo = utf8_decode($nb_nombre." ".$nb_apellidos);	
		
		$progress    = '
			   <div class="progress">
                                                 <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" 
                                                	 aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                               		Pobre&nbsp;&nbsp;
                                                 </div>
                                             	
                                                 <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="40" 
                                                 	aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                               		Promedio&nbsp;&nbsp;
                                                 </div>
                                                
                                              <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                                   aria-valuemax="100" style="width: 20%">
                                                   Bueno&nbsp;&nbsp;
                                               </div>
                                               
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" 
                                                    aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                	Excelente&nbsp;&nbsp;
                                                </div>
                                                
                                               <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" 
                                               		aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                               		Atleta&nbsp;&nbsp;
                                               </div>
												
                                        </div><!-- Progress -->
		';
		//Fecha actual
date_default_timezone_set("Mexico/General");
$fecha_actual = date("Y-m-d"); //fecha del día de hoy
?>
<style type="text/css">
body{    padding-top: 0px !important;}
.Cabecera {background-color: #b02823; color:white; font-family: serif;}
.right{margin-right:8%;}
.ResultImg{background-image: url(../../css/img/grafica.jpg);
        background-repeat: no-repeat;
    background-size: 78%;
    background-position: 0px 35px;
    height: 233px;}
.Logo {background-image: url(../../css/img/logosinfondo.png);
        background-repeat: no-repeat;
    background-size: 96%;
    background-position: 0px 37px;
    height: 200px;}
#datos{margin-top: 50%;}    

</style>
<html>
<head>
<link href="http://phptopdf.com/bootstrap.css" rel="stylesheet">
<link href="http://getbootstrap.com/examples/dashboard/dashboard.css" rel="stylesheet">
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script src="http://getbootstrap.com/assets/js/docs.min.js"></script>
     
</head>
<body>



	<div class="container-fluid">
		<div class="row">
		<!-- valores escondidos-->
		
		
		<!-- fin valores escondidos-->
				
                 
				 <!-- Peso-->
                   <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
	                   	<div class="col-md-12 Cabecera">
	                   		<h1 class="text-left">Peso</h1>
	                   	</div>
	                   	<div class="col-md-12 Datos">
	                   		<div class="col-md-3 ResultImg">
	                   		</div>

	                   		<div class="col-md-2 Logo pull-right">
	                   			<div class="col-md-12" id="datos">
	                   				<h5 class="text-left">Resultados De <strong>Biotest</strong></h5>
	                   			</div>
	                   		</div>
	                   		<div class="col-md-8 Consejo">
	                   			<p class="text-center">
	                   				<?php echo utf8_decode($ConsejoPeso);?>
	                   			</p>
	                   		</div>
	                   	</div><!-- Datos -->
                 	</div><!--containerbar -->  
				 
				 <!-- Peso -->
				 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                 <h1 class="text-center">Peso</h1>
                  <h2 id="CondicionTitulo" ></h2>  
                    <div class="progress">
                        <div class="progress-bar ".$BarraPeso."" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                         aria-valuemax="100" id="ProgresBarResultado" style="".$LongitudPeso."">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div><!--progress -->
                    
                    <!-- Barra de comparación-->
                 ".$progress."
                    <p class="text-center ">".$ConsejoPeso."</p>
					<div id="chart_peso" style="height:270px; width:800px;"align="center"></div>
					<h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
					<h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
                 </div><!--containerbar -->  
				 <!-- Final de Peso  -->
				 
				 <!-- Stamina -->
				 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                 <h1 class="text-center">Stamina</h1>
                  <h2 id="CondicionTitulo" ></h2>  
                    <div class="progress">
                        <div class="progress-bar ".$BarraStam."" role="progressbar" aria-valuenow="60"
						 aria-valuemin="0"
                         aria-valuemax="100" id="ProgresBarResultado" style="".$Longitudstam."">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div><!--progress -->
                    
                    <!-- Barra de comparación-->
                 ".$progress."
				  <p class="text-center ">".$Consejostam."</p>
				  <div id="chart_stamina" style="height:270px; width:800px;"align="center"></div>
                 </div><!--containerbar --> 
				 
				 <!-- final stamina-->
				 
				 <!-- fuerza-->
			
				 
				  <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                 <h1 class="text-center">Fuerza</h1>
                  <h2 id="CondicionTitulo" ></h2>  
                    <div class="progress">
                        <div class="progress-bar ".$BarraFuerza."" role="progressbar" aria-valuenow="60"
						 aria-valuemin="0"
                         aria-valuemax="100" id="ProgresBarResultado" style="".$Longitudfuer."">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div><!--progress -->
                    
                    <!-- Barra de comparación-->
                 ".$progress."
				 <p class="text-center ">".$Consejofuer."</p>
				 <div id="chart_fuerza" style="height:270px; width:800px;"align="center"></div>
				 <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
                 </div><!--containerbar -->  
				 
				  <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
				  </br></br>
				  <h1>&nbsp;</h1>
				  <h1>&nbsp;</h1>
				  <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
				  <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
                 <h1 class="text-center">Resistencia</h1>
                  <h2 id="CondicionTitulo" ></h2>  
                    <div class="progress">
                        <div class="progress-bar ".$BarraResis."" role="progressbar" aria-valuenow="60"
						 aria-valuemin="0"
                         aria-valuemax="100" id="ProgresBarResultado" style="".$LongitudResi."">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div><!--progress -->
                    
                    <!-- Barra de comparación--> 
                 ".$progress."
				 <p class="text-center ">".$ConsejoResi."</p>
				 <div id="chart_Resistencia" style="height:270px; width:800px;"align="center"></div>
                 </div><!--containerbar --> 
				  
				 
				 
				 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar">
				 <div class="col-sm-12  col-xs-12 " id="ContainerBar">
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				 </div> 
                 <h1 class="text-center">Flexibilidad</h1>
                  <h2 id="CondicionTitulo" ></h2>  
                    <div class="progress">
                        <div class="progress-bar ".$BarraFlexi."" role="progressbar" aria-valuenow="60"
						 aria-valuemin="0"
                         aria-valuemax="100" id="ProgresBarResultado" style="".$LongitudFlexi."">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div><!--progress -->
                    
                    <!-- Barra de comparación-->
                 ".$progress."
				 <p class="text-center ">".$ConsejoFlexi."</p>
				 <div id="chart_flexibilidad" style="height:270px; width:800px;"align="center"></div>
				 <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
				 <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
				 <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
				 <h1>&nbsp;</h1> <!-- para hacer el espacio y bajarlo-->
                 </div><!--containerbar --> 
				 
				   <div class='col-sm-12 col-xs-12 containerbar pull-left Grafica' id='ContainerBar'> 
                  <h2 id="CondicionTitulo" class="text-center" >IMM</h2>  
                      <div class="Resultados2 col-sm-4 col-xs-4">
                                  <!-- Segundos Resultados-->
                               <h5 id="Fecha" class="text-center">".$fecha2."</h5>
                                <!--Primeros Resultados -->
                            	<div class="col-sm-12 col-xs-12 Cintura pull-right">
                                	<label class="text-center col-sm-12 col-xs-12 ">Cintura: ".$CantidadCintura2."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Cadera pull-right">
                                	<label class="text-center col-sm-12 col-xs-12">Cadera: ". $CantidadCadera2."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Espalda  pull-right">
                                	<label class="text-center col-sm-12 col-xs-12">Espalda: ". $per_espalda_can2."</label>
                                </div>
                                <div class="col-sm-12 col-xs-12 Per_Pecho  pull-right">
                                	<label class="text-center col-sm-12 col-xs-12 ">Pecho: ". $Per_Pecho2 ."</label>
                                 </div>
                                <div class="col-sm-21 col-xs-12 Per_Brazo pull-right">
                                	<label class="text-center col-sm-12 col-xs-12 right">Brazo: ". $Per_Brazo2."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Brazo_Fle pull-right">
                                	<label class="text-center col-sm-12 col-xs-12">Brazo Flexionado: ". $Per_Brazo_Fle2."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Perimetro_femoral pull-right">
                                	<label class="text-center col-sm-12 col-xs-12">Femoral: ".$Per_Femoral2."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Pantorrilla pull-right">
                                	<label class="text-center col-sm-12 col-xs-12">Pantorrilla: ". $Per_Pantorrilla2."</label>
                                </div>
                            </div><!-- Resultados -->
                            
                            
                            <div class="Resultados col-sm-4 col-xs-4 pull-right">
                            	<h5 id="text-left" style="margin-left:12%">Resultados</h5>
                                <!--Resultados Finales -->
                            	<div class="col-sm-10  col-xs-10 Cintura pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $ResCintura."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Cadera pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $Res_Cadera."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Per_Espalda  pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $Res_per_esp."</label>
                                </div>
                                <div class="col-sm-10  col-xs-10 Per_Pecho   pull-left">
                                	<label for="" id=" " class="text-left col-sm-6 right">". $Res_pecho ."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Per_Brazo pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $Res_Brazo."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Per_Brazo_Fle pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $Res_BrazoFle."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Perimetro_femoral pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $Res_PeriFemo."</label>
                                 </div>
                                <div class="col-sm-10  col-xs-10 Per_Pantorrilla pull-left">
                                	<label for="" id="" class="text-left col-sm-6 right">". $ResPerPant."</label>
                                </div>
                            </div><!-- Resultados -->
							
							
                            
                        	<div class="Resultados col-sm-4 col-xs-4 pull-right">
                            	<h5 id="Fecha" class="text-center">". $fecha."</h5>
                                <!--Primeros Resultados -->
                            	<div class="col-sm-12 col-xs-12 Cintura pull-right">
                                <label class="text-center col-xs-12 col-sm-12">Cintura: ".$CantidadCintura."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Cadera pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Cadera: ". $CantidadCadera."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Espalda  pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Espalda: ". $per_espalda_can."</label>
                                </div>
                                <div class="col-sm-12 col-xs-12 Per_Pecho pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Pecho: ". $Per_Pecho ."</label>
                                 </div>
                                <div class="col-sm-21 col-xs-12 Per_Brazo pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Brazo: ". $Per_Brazo."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Brazo_Fle pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Brazo Flexionado: ". $Per_Brazo_Fle."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Perimetro_femoral pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Femoral: ". $Per_Femoral."</label>
                                 </div>
                                <div class="col-sm-12 col-xs-12 Per_Pantorrilla pull-right">
                                	<label class="text-center col-xs-12 col-sm-12">Pantorrill: ". $Per_Pantorrilla."</label>
                                </div>
                                </div><!-- Resultados-->
								
                  </div><!--containerbar -->
				  <div id="chart_imm" style="height:300px; width:800px;"align="center"
				  class="col-md-12 col-xs-12"></div>
		</div> <!-- row -->
	</div> <!-- container fluid-->

    
      </body>
	   <script type="text/javascript">
      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);

      function drawChart() {
		  
		  //Tomando los datos de las fechas
		  
        var data = google.visualization.arrayToDataTable([
        ['Resultados', 'Condicion Fisica',{ role: 'style' }],
        ['".$fechaCond."', ".$dato1.",'silver'],
        ['".$fechaCond2."', ".$dato2.",'silver'],
        ['".$fechaCond3."', ".$dato3.",'silver']
      ]);
	
		var data2 = google.visualization.arrayToDataTable([
        ['Resultados', 'Peso',{ role: 'style' }],
        ['".$fechaPeso."', ".$PorcenPeso1.",'silver'],
        ['".$fechaPeso2."', ".$PorcenPeso2.",'silver'],
        ['".$fechaPeso3."', ".$PorcenPeso3.",'silver']
      ]);
	  
	  var data3 = google.visualization.arrayToDataTable([
        ['Resultados', 'Stamina',{ role: 'style' }],
        ['".$fechaStam."', ".$PorcenStam1.",'silver'],
        ['".$fechaStam2."', ".$PorcenStam2.",'silver'],
        ['".$fechaStam3."', ".$PorcenStam3.",'silver']
      ]);
	  
	  var data4 = google.visualization.arrayToDataTable([
        ['Resultados', 'Fuerza',{ role: 'style' }],
        ['".$fechaFuer."', ".$PorcenFuer.",'silver'],
        ['".$fechaFuer2."', ".$PorcenFuer2.",'silver'],
        ['".$fechaFuer3."', ".$PorcenFuer3.",'silver']
      ]);
	  
	  var data5 = google.visualization.arrayToDataTable([
        ['Resultados', 'Resistencia',{ role: 'style' }],
        ['".$fechaResis."', ".$PorcenResis.",'silver'],
        ['".$fechaResis2."', ".$PorcenResis2.",'silver'],
        ['".$fechaResis3."', ".$PorcenResis3.",'silver']
      ]);
	  
	  var data6 = google.visualization.arrayToDataTable([
        ['Resultados', 'Flexibilidad',{ role: 'style' }],
        ['".$fechaFlexi."', ".$PorcenFlexi.",'silver'],
        ['".$fechaFlexi2."', ".$PorcenFlexi2.",'silver'],
        ['".$fechaFlexi3."', ".$PorcenFlexi3.",'silver']
      ]);
	
		var data7 = new google.visualization.arrayToDataTable([
          ['Resultados', '".$fecha."', '".$fecha2."'],
          ['Cintura', ".$CantidadCintura.", ".$CantidadCintura2."],
          ['Cadera', ".$CantidadCadera.", ".$CantidadCadera2."],
          ['Espalda', ".$per_espalda_can.", ".$per_espalda_can2."],
          ['Pecho', ".$Per_Pecho.", ".$Per_Pecho2."],
          ['Brazo', ".$Per_Brazo.", ".$Per_Brazo2."],
		  ['brazo Flexionado', ".$Per_Brazo_Fle.", ".$Per_Brazo_Fle2."],
		  ['Perimetro femoral', ".$Per_Femoral.", ".$Per_Femoral2."],
		  ['Pantorrilla', ".$Per_Pantorrilla.", ".$Per_Pantorrilla2."]
        ]);
     

      var options = {
        title: 'Condicion Fisica',
		colors: ['silver'],
        chartArea: {width: '50%'},
        annotations: {
          alwaysOutside: true,
          textStyle: {
            fontSize: 12,
            auraColor: 'none',
            color: '#555'
          },
          boxStyle: {
            stroke: '#ccc',
            strokeWidth: 1,
            gradient: {
              color1: '#f3e5f5',
              color2: '#f3e5f5',
              x1: '0%', y1: '0%',
              x2: '100%', y2: '100%'
            }
          }
        },
        hAxis: {
          title: 'Resultados Totales',
          minValue: 0,
        },
        vAxis: {
          title: 'Resultados'
        }
      };
	  
	 var options2 = {
        title: 'Peso', chartArea: {width: '50%'},
		colors: ['silver'],
        annotations: {alwaysOutside: true, textStyle: {fontSize: 12,auraColor: 'none',color: '#555'},
          boxStyle: { stroke: '#ccc', strokeWidth: 1, gradient: {color1: '#f3e5f5',color2: '#f3e5f5',x1: '0%', y1: '0%',x2: '100%', y2: '100%'}}
        },
        hAxis: {title: 'Resultados Totales',minValue: 0,},
        vAxis: {title: 'Resultados'}
      }; // Options 2
	  
	  var options3 = {
        title: 'Stamina', chartArea: {width: '50%'},
		colors: ['silver'],
        annotations: {alwaysOutside: true, textStyle: {fontSize: 12,auraColor: 'none',color: '#555'},
          boxStyle: { stroke: '#ccc', strokeWidth: 1, gradient: {color1: '#f3e5f5',color2: '#f3e5f5',x1: '0%', y1: '0%',x2: '100%', y2: '100%'}}
        },
        hAxis: {title: 'Resultados Totales',minValue: 0,},
        vAxis: {title: 'Resultados'}
      }; // Options 3
	  
	  var options4 = {
        title: 'Fuerza', chartArea: {width: '50%'},
		colors: ['silver'],
        annotations: {alwaysOutside: true, textStyle: {fontSize: 12,auraColor: 'none',color: '#555'},
          boxStyle: { stroke: '#ccc', strokeWidth: 1, gradient: {color1: '#f3e5f5',color2: '#f3e5f5',x1: '0%', y1: '0%',x2: '100%', y2: '100%'}}
        },
        hAxis: {title: 'Resultados Totales',minValue: 0,},
        vAxis: {title: 'Resultados'}
      }; // Options 4
	  
	   var options5 = {
        title: 'Resistencia', chartArea: {width: '50%'},
		colors: ['silver'],
        annotations: {alwaysOutside: true, textStyle: {fontSize: 12,auraColor: 'none',color: '#555'},
          boxStyle: { stroke: '#ccc', strokeWidth: 1, gradient: {color1: '#f3e5f5',color2: '#f3e5f5',x1: '0%', y1: '0%',x2: '100%', y2: '100%'}}
        },
        hAxis: {title: 'Resultados Totales',minValue: 0,},
        vAxis: {title: 'Resultados'}
      }; // Options 5
	  
	   var options6 = {
        title: 'Flexibilidad', chartArea: {width: '50%'},
		colors: ['silver'],
        annotations: {alwaysOutside: true, textStyle: {fontSize: 12,auraColor: 'none',color: '#555'},
          boxStyle: { stroke: '#ccc', strokeWidth: 1, gradient: {color1: '#f3e5f5',color2: '#f3e5f5',x1: '0%', y1: '0%',x2: '100%', y2: '100%'}}
        },
        hAxis: {title: 'Resultados Totales',minValue: 0,},
        vAxis: {title: 'Resultados'}
      }; // Options 6
	  
	   var options7 = {
          width: 900,
          chart: {
            title: 'IMM',
			colors: ['silver'],
            subtitle: ''
          },
          bars: 'horizontal', // Required for Material Bar Charts.
          series: {
            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
          },
          axes: {
            x: {
              distance: {label: 'parsecs'}, // Bottom x-axis.
              brightness: {side: 'top', label: 'apparent magnitude'} // Top x-axis.
            }
          } // option 7
        };
	  
	   var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
	  
	  var chart2 = new google.visualization.BarChart(document.getElementById('chart_peso'));
      chart2.draw(data2, options2);
	  
	  var chart3 = new google.visualization.BarChart(document.getElementById('chart_stamina'));
      chart3.draw(data3, options3);
	  
	  var chart4 = new google.visualization.BarChart(document.getElementById('chart_fuerza'));
      chart4.draw(data4, options4);
	  
	  var chart5 = new google.visualization.BarChart(document.getElementById('chart_Resistencia'));
      chart5.draw(data5, options5);
	  
	  var chart6 = new google.visualization.BarChart(document.getElementById('chart_flexibilidad'));
      chart6.draw(data6, options6);
	  
	   var chart7 = new google.visualization.BarChart(document.getElementById('chart_imm'));
      chart7.draw(data7, options7);
	  
      }
    </script>  
      </html>";



// PUT YOUR HTML HEADER IN A VARIABLE
$my_html_header="
<div style="display:block; background-color:#f2f2f2; padding:10px; border-bottom:2pt solid #cccccc; color:#6e6e6e; font-size:.85em; font-family:verdana;">
  <div style="float:left; width:33%; text-align:left;">
      <img src="http://imagizer.imageshack.us/v2/128x32q90/673/NaZt1l.png">
  </div>
  <div style="float:left; width:33%; text-align:center;">
     Resultados de Biotest
  </div>
  <div style="float:left; width:33%; text-align:right;">
     Reporte: ".$fecha_actual."
  </div>
  <br style="clear:left;"/>
</div>";






?>