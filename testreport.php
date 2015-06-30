<?php
include("libs/libs.php");
$id_rutina=26;


$consultar=new Consultar();
//Consultar los ejercicios de la rutina
$result   = $consultar->_ConsultarInformacionRutinaPreFinalClientePorId($id_rutina);
$num_rows = $result->num_rows;

//Consultar información del cliente acorde la rutina
$resultCliente = $consultar->_ConsultarInformacionClientePorRutinaId($id_rutina);
$filaCliente   = $resultCliente->fetch_assoc();

//Datos del cliente
$nb_nombre 	  	 = $filaCliente['nb_cliente'];
$nb_apellidos 	 = $filaCliente['nb_apellidos'];
$de_email	  	 = $filaCliente['de_email'];
$id_cliente		 = $filaCliente['id_cliente'];
$nombre_completo = utf8_decode($nb_nombre." ".$nb_apellidos);		

//Datos del cliente
$nb_nombre 	  	 = $filaCliente['nb_cliente'];
$nb_apellidos 	 = $filaCliente['nb_apellidos'];
$de_email	  	 = $filaCliente['de_email'];
$id_cliente		 = $filaCliente['id_cliente'];

//Fecha actual
date_default_timezone_set("Mexico/General");
$fecha_actual = date("Y-m-d"); //fecha del día de hoy

//Tomando los datos
$ejercicios="";

for($i=0; $i<$num_rows; $i++)
{
	$filaInfo = $result->fetch_assoc();
	$ejercicios.='
	<tr>
		<td class="text-center">'.$filaInfo['num_maquina'].'</td>
		<td class="text-center">'.$filaInfo['nb_ejercicio'].'</td>
		<td class="text-center">'.$filaInfo['nb_TipoRutina'].'</td>
		<td class="text-center">'.utf8_decode($filaInfo['nb_dia']).'</td>
		<td class="text-center">'.$filaInfo['num_Circuitos'].'</td>
		<td class="text-center">'.$filaInfo['num_Repeticiones'].'</td>
		<td class="text-center">'.$filaInfo['ejercicio_relacion'].'</td>
	</tr>';
}

?>
<html>
  <head>
    <title>Example Report with Page Numbers, Header and Footer - phpToPDF.com</title>
    <link href="css/bootstrap.css" rel="stylesheet">
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


    

    <div class="container-fluid">
      <div class="row">

        <div class="main">
          <h1 class="page-header text-center">Rutina Creada en SpinGym</h1>



          <h2 class="sub-header text-center"><?php echo $nombre_completo?> </h2>
          <p class="text-center">Las letras en el apartado relaci&oacute;n indican los ejercicios que van relacionados y la secuencia.</p> 
          <p class="text-center">Ejemplo: El A1 y el A2 se hacen en orden A1, despu&eacute;s A2 y as&iacute;. Si no contiene relación es que no
          va seriado y puede hacerse a decisi&oacute;n propia.</p>
          <div class="">
            <table class="table table-striped">
              <thead>
                <tr>
					<th class="text-center">MAQUINA</th>
                	<th class="text-center">EJERCICIO</th>
                 	<th class="text-center">TIPO RUTINA</th>
					<th class="text-center">DIA</th>
					<th class="text-center">CIRCUITOS</th>
					<th class="text-center">REPETICIONES</th>
					<th class="text-center">RELACION</th>
                </tr>
              </thead>
              <tbody>
               <?php
			   	echo $ejercicios;
			   ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script src="http://getbootstrap.com/assets/js/docs.min.js"></script>
  </body>
</html>