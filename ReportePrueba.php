<?php
		require("modulos/Clientes/phpToPDF.php"); 
		include("libs/libs.php");		
		$id_cliente  = 17;
		$consultar   = new Consultar();
		$Utilidades  = new Utilidades();
		$json_return = $Utilidades->ReportePdf($id_cliente);
		$decode      = json_decode($json_return,true);
		$Condicion   = $decode['Condicion']; //Array de datos de condición física.
		$Barra       = $Condicion[0]['Barra'];
		$Longitud    = $Condicion[0]['Longitud'];
		$Consejo     = $Condicion[0]['Consejo'];
		//Datos de condición física
		
		$dato1       = $Condicion[0]['resultado_numerico'];
		$fecha1      = $Condicion[0]['fecha'];
		$dato2       = $Condicion[1]['resultado_numerico'];
		$fecha2      = $Condicion[1]['fecha'];
		$dato3       = $Condicion[2]['resultado_numerico'];
		$fecha3      = $Condicion[2]['fecha'];
		//Datos de condición física.
		$Peso         = $decode['Peso']; //Array de resultados de la prueba de Peso.
		$BarraPeso    = $Peso[0]['Barra'];
		$LongitudPeso = $Peso[0]['Longitud'];
		$ConsejoPeso  = $Peso[0]['Consejo'];
		$Stamina	  = $decode['Stamina']; // Array de resultados de la prueba de Stamina.
		$BarraStam    = $Stamina[0]['Barra'];
		$Longitudstam = $Stamina[0]['Longitud'];
		$Consejostam  = $Stamina[0]['Consejo'];
		$Fuerza		  = $decode['Fuerza']; // Array de resultados de la prueba de Fuerza.
		$BarraFuerza  = $Fuerza[0]['Barra'];
		$Longitudfuer = $Fuerza[0]['Longitud'];
		$Consejofuer  = $Fuerza[0]['Consejo'];
		//Datos de resistencia
		$Resistencia  = $decode['Resistencia']; // Array de resultado de la prueba de Resistencia.
		
		$BarraResis   = $Resistencia[0]['Barra'];
		$LongitudResi = $Resistencia[0]['Longitud'];
		$ConsejoResi  = $Resistencia[0]['Consejo'];
		$Flexibilidad = $decode["Flexibilidad"]; // Array de resultado de pruebas de flexibilidad
		print_r($Flexibilidad);
		$BarraFlexi    = $Flexibilidad[0]['Barra'];
		$LongitudFlexi = $Flexibilidad[0]['Longitud'];
		$ConsejoFlexi = $Flexibilidad[0]['Consejo'];
		$IMM		   = $decode['IMM']; //Array de resultados de las pruebas de IMM.
		$IMM2 		   = $decode['IMM2']; //Array de segundos resultados de las pruebas de IMM.
		$IMMResultados = $decode['IMMResultados'];// Array con los resultados de las comparaciones de los arrays de IMM y IMM2.
		
		//Tomando los datos del IMM.
		$fecha			 = $IMM['fecha'];
		$Per_Brazo 		 = $IMM['Per_Brazo'];
		$Per_Brazo_Fle 	 = $IMM['Per_Brazo_Fle'];
		$Per_Femoral 	 = $IMM['Per_Femoral'];
		$Per_Pantorrilla = $IMM['Per_Pantorrilla'];
		$CantidadCintura = $IMM['CantidadCintura'];
		$CantidadCadera  = $IMM['CantidadCadera'];
		$per_espalda_can = $IMM['per_espalda_can'];
		$Per_Pecho 		 = $IMM['Per_Pecho'];
		
		//Tomando los datos del IMM2.
		$fecha2			  = $IMM2['fecha'];
		$Per_Brazo2       = $IMM2['Per_Brazo'];
		$Per_Brazo_Fle2   = $IMM2['Per_Brazo_Fle'];
		$Per_Femoral2 	  = $IMM2['Per_Femoral'];
		$Per_Pantorrilla2 = $IMM2['Per_Pantorrilla'];
		$CantidadCintura2 = $IMM2['CantidadCintura'];
		$CantidadCadera2  = $IMM2['CantidadCadera'];
		$per_espalda_can2 = $IMM2['per_espalda_can'];
		$Per_Pecho2		  = $IMM2['Per_Pecho'];
		
		//Tomando los datos del IMMResultados. 
		$ResCintura	  = $IMMResultados['ResCintura'];
		$Res_Cadera   = $IMMResultados['Res_Cadera'];
		$Res_per_esp  = $IMMResultados['Res_per_esp'];
		$Res_Brazo 	  = $IMMResultados['Res_Brazo'];
		$Res_pecho 	  = $IMMResultados['Res_pecho'];
		$Res_BrazoFle = $IMMResultados['Res_BrazoFle'];
		$Res_PeriFemo = $IMMResultados['Res_PeriFemo'];
		$ResPerPant   = $IMMResultados['ResPerPant'];
		$Res_pecho 	  = $IMMResultados['Res_pecho'];
		
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
			
?>
<html>
<head>
<link href="http://phptopdf.com/bootstrap.css" rel="stylesheet">
<link href="http://getbootstrap.com/examples/dashboard/dashboard.css" rel="stylesheet">
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Selection 1', 3],
          ['Selection 2', 1],
          ['Selection 3', 1],
          ['Selection 4', 1],
          ['Selection 5', 2]
        ]);

        var options = {'title':'Example Chart',
                       'width':800,
                       'height':600};

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>    
</head>
<body>

<style>
	.right{margin-left:7%;}
</style>

	<div class="container-fluid">
		<div class="row">
						<h4 class='text-center' id='TituloPrueba'>Resultados Biotest</h4>
                                     
                                       <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                                     <h1 class="text-center">Condición Física</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $Barra?> role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $Longitud?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
                                      <p class="text-center "><?php echo $Consejo; ?></p>
                                     </div><!--containerbar -->  
									 
									 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                                     <h1 class="text-center">Peso</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $BarraPeso?> role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $LongitudPeso?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
                                        <p class="text-center "><?php echo $ConsejoPeso; ?></p>
                                     </div><!--containerbar -->  
									 
									 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                                     <h1 class="text-center">Stamina</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $BarraStam?> role="progressbar" aria-valuenow="60"
											 aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $Longitudstam?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
									  <p class="text-center "><?php echo $Consejostam; ?></p>
                                     </div><!--containerbar --> 
									 
									 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"
									 style="display:none"> 
                                     
									 <p class="text-center "><?php echo $Consejofuer; ?></p>
                                     </div><!--containerbar -->  
									 
									  <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
                                     <h1 class="text-center">Fuerza</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $BarraFuerza?> role="progressbar" aria-valuenow="60"
											 aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $Longitudfuer?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
									 <p class="text-center "><?php echo $Consejofuer; ?></p>
                                     </div><!--containerbar -->  
									 
									  <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar"> 
									  </br></br>
									  <h1>&nbsp;</h1>
									  </br></br>
									  <h1>&nbsp;</h1>
                                     <h1 class="text-center">Resistencia</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $BarraResis?> role="progressbar" aria-valuenow="60"
											 aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $LongitudResi?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
									 <p class="text-center "><?php echo $ConsejoResi; ?></p>
                                     </div><!--containerbar --> 
									  
									 
									 
									 <div class="col-sm-12  col-xs-12 containerbar pull-right Grafica" id="ContainerBar">
									 <div class="col-sm-12  col-xs-12 " id="ContainerBar">
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									 </div> 
                                     <h1 class="text-center">Flexibilidad</h1>
                                      <h2 id="CondicionTitulo" ></h2>  
                                        <div class="progress">
                                            <div class="progress-bar <?php echo $BarraFlexi?> role="progressbar" aria-valuenow="60"
											 aria-valuemin="0"
                                             aria-valuemax="100" id="ProgresBarResultado" style=<?php echo $LongitudFlexi?>>
                                            <span class="sr-only">60% Complete</span>
                                          </div>
                                        </div><!--progress -->
                                        
                                        <!-- Barra de comparación-->
                                     <?php echo $progress; ?>
									 <p class="text-center "><?php echo $ConsejoFlexi; ?></p>
                                     </div><!--containerbar --> 
									 
									   <div class='col-sm-12 col-xs-12 containerbar pull-right Grafica' id='ContainerBar'> 
                                      <h2 id="CondicionTitulo" class="text-center" >IMM</h2>  
                                          <div class="Resultados2 col-sm-4 col-xs-4">
                                                      <!-- Segundos Resultados-->
                                                   <h5 id="Fecha" class="text-center"><?php echo $fecha2; ?></h5>
                                                    <!--Primeros Resultados -->
                                                	<div class="col-sm-12 col-xs-12 Cintura pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Cintura: ".$CantidadCintura2; ?>
                                                          </label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Cadera pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Cadera: ".$CantidadCadera2; ?>
                                                          </label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Espalda  pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Espalda: ".$per_espalda_can2; ?>
                                                         </label>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Pecho   pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Pecho: ".$Per_Pecho2 ; ?>
                                                          </label>
                                                     </div>
                                                    <div class="col-sm-21 col-xs-12 Per_Brazo pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12 ">
															<?php echo "Brazo: ".$Per_Brazo2; ?>
                                                            </label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Brazo_Fle pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12 ">
															<?php echo "Brazo Flexionado: ".$Per_Brazo_Fle2; ?>
                                                          </label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Perimetro_femoral pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Femoral: ".$Per_Femoral2; ?>
                                                        </label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Pantorrilla pull-right">
                                                    	<label for="" id="" class="text-center col-sm-12">
															<?php echo "Pantorrilla: ".$Per_Pantorrilla2; ?>
                                                           </label>
                                                    </div>
                                                </div><!-- Resultados -->
                                                
                                                
                                                <div class="Resultados col-sm-4 col-xs-4 pull-right">
                                                	<h5 id="text-left" style="margin-left:12%">Resultados</h5>
                                                    <!--Resultados Finales -->
                                                	<div class="col-sm-10 col-xs-10 Cintura pull-left">
                                                    	
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $ResCintura; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Cadera pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $Res_Cadera; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Per_Espalda  pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $Res_per_esp; ?></label>
                                                    </div>
                                                    <div class="col-sm-10 Per_Pecho   pull-left">
                                                    	<label for="" id=" " class="text-left col-sm-6 right col-xs-6"><?php echo $Res_pecho ; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Per_Brazo pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $Res_Brazo; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Per_Brazo_Fle pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $Res_BrazoFle; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Perimetro_femoral pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $Res_PeriFemo; ?></label>
                                                     </div>
                                                    <div class="col-sm-10 Per_Pantorrilla pull-left">
                                                    	<label for="" id="" class="text-left col-sm-6 right col-xs-6"><?php echo $ResPerPant; ?></label>
                                                    </div>
                                                </div><!-- Resultados -->
												
												
                                                
                                            	<div class="Resultados col-sm-4 col-xs-4 pull-right">
                                                	<h5 id="Fecha" class="text-center"><?php echo $fecha; ?></h5>
                                                    <!--Primeros Resultados -->
                                                	<div class="col-sm-12 col-xs-12 Cintura pull-right">
                                                    <label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $CantidadCintura; ?></label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Cadera pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $CantidadCadera; ?></label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Espalda  pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $per_espalda_can; ?></label>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Pecho   pull-right">
                                                    	<label for="" id=" " class="text-right col-xs-6 col-sm-6 right"><?php echo $Per_Pecho ; ?></label>
                                                     </div>
                                                    <div class="col-sm-21 col-xs-12 Per_Brazo pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $Per_Brazo; ?></label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Brazo_Fle pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $Per_Brazo_Fle; ?></label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Perimetro_femoral pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"col-xs-6 col-sm-6 right><?php echo $Per_Femoral; ?></label>
                                                     </div>
                                                    <div class="col-sm-12 col-xs-12 Per_Pantorrilla pull-right">
                                                    	<label for="" id="" class="text-right col-xs-6 col-sm-6 right"><?php echo $Per_Pantorrilla; ?></label>
                                                    </div>
                                                    </div><!-- Resultados-->
                                      </div><!--containerbar -->   
		</div> <!-- row -->
	</div> <!-- container fluid-->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script src="http://getbootstrap.com/assets/js/docs.min.js"></script>
      </body>
      </html>"