<?php
 // INCLUDE THE phpToPDF.php FILE
require("phpToPDF.php"); 

include("libs/libs.php");
$id_rutina="1";


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

//Tomando los datos
$ejercicios="";

for($i=0; $i<$num_rows; $i++)
{
	$filaInfo = $result->fetch_assoc();
	$ejercicios.='
	<tr>
		<td>'.$filaInfo['nb_ejercicio'].'</td>
		<td class="text-center">'.$filaInfo['nb_TipoRutina'].'</td>
		<td>'.$filaInfo['nb_dia'].'</td>
		<td class="text-center">'.$filaInfo['num_Circuitos'].'</td>
		<td class="text-center">'.$filaInfo['num_Repeticiones'].'</td>
		<td> </td>
	</tr>';
}

// PUT YOUR HTML IN A VARIABLE
$my_html="<html>
  <head>
    <title>Example Report with Page Numbers, Header and Footer - phpToPDF.com</title>
    <link href=\"http://phptopdf.com/bootstrap.css\" rel=\"stylesheet\">
    <link href=\"http://getbootstrap.com/examples/dashboard/dashboard.css\" rel=\"stylesheet\">
    <script type=\"text/javascript\" src=\"https://www.google.com/jsapi\"></script>
    <script type=\"text/javascript\">
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


    

    <div class=\"container-fluid\">
      <div class=\"row\">

        <div class=\"main\">
          <h1 class=\"page-header text-center\">Rutina Creada en SpinGym</h1>



          <h2 class=\"sub-header\">Example Table</h2>
          <div class=\"\">
            <table class=\"table table-striped\">
              <thead>
                <tr>
                  <th>EJERCICIO</th>
                 	<th>TIPO RUTINA</th>
					<th>DIA</th>
					<th>CIRCUITOS</th>
					<th>REPETICIONES</th>
					<th>PESO</th>
                </tr>
              </thead>
              <tbody>
                ".$ejercicios."
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>



    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>
    <script src=\"http://getbootstrap.com/dist/js/bootstrap.min.js\"></script>
    <script src=\"http://getbootstrap.com/assets/js/docs.min.js\"></script>
  </body>
</html>
";




// PUT YOUR HTML HEADER IN A VARIABLE
$my_html_header="
<div style=\"display:block; background-color:#f2f2f2; padding:10px; border-bottom:2pt solid #cccccc; color:#6e6e6e; font-size:.85em; font-family:verdana;\">
  <div style=\"float:left; width:33%; text-align:left;\">
      <img src=\"http://imagizer.imageshack.us/v2/128x32q90/673/NaZt1l.png\">
  </div>
  <div style=\"float:left; width:33%; text-align:center;\">
      My Sample Header
  </div>
  <div style=\"float:left; width:33%; text-align:right;\">
      Report: January - April
  </div>
  <br style=\"clear:left;\"/>
</div>";




// PUT YOUR HTML FOOTER IN A VARIABLE (AND I USE PAGE NUMBERS)
$my_html_footer="
<div style=\"display:block;\">
  <div style=\"float:left; width:33%; text-align:left;\">
          &nbsp; 
  </div>
  <div style=\"float:left; width:33%; text-align:center;\">
         Page phptopdf_on_page_number of phptopdf_pages_total
  </div>
  <div style=\"float:left; width:33%; text-align:right;\">
          &nbsp;
   </div>
   <br style=\"clear:left;\"/>
</div>";




// SET YOUR PDF OPTIONS -- FOR ALL AVAILABLE OPTIONS, VISIT HERE:  http://phptopdf.com/documentation/
$pdf_options = array(
  "source_type" => 'html',
  "source" => $my_html,
  "action" => 'save',
  "save_directory" => 'pdf',
  "file_name" => 'sample_pdf_report.pdf',
  "header" => $my_html_header,
  "footer" => $my_html_footer);


// CALL THE phpToPDF FUNCTION WITH THE OPTIONS SET ABOVE
phptopdf($pdf_options);

// OPTIONAL - PUT A LINK TO DOWNLOAD THE PDF YOU JUST CREATED
echo ("<a href='sample_pdf_report.pdf'>Download Your PDF</a>".'<pre>'.$ejercicios.'</pre>');

?>