<html>
<head>
<link href="http://phptopdf.com/bootstrap.css" rel="stylesheet">
<link href="http://getbootstrap.com/examples/dashboard/dashboard.css" rel="stylesheet">
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);

      function drawChart() {
    /*   var data = new google.visualization.DataTable();
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
        chart.draw(data, options);*/
		   var data = google.visualization.arrayToDataTable([
        ['Resultados', 'Condicion Fisica'],
        ['15 de marzo del 2015', 60],
        ['1 de febrero del 2015', 80],
        ['15 de enero del 2015', 100]
      ]);

     

      var options = {
        title: 'BIOTEST',
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
          title: 'City'
        }
      };
      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      }
    </script>    
</head>
<body>

 <div class="container-fluid" style="height:">
      <div class="row">
        <div class="main">
          <h1>Example Report</h1>
          <h3>with Page Numbers, Header and Footer - phpToPDF.com</h3>
          <br><br><br>
          <p>This is an example cover page</p>
      </div>
    </div>
  </div>
  

  <div class="container-fluid">
    <div class="row">
      <div class="main">
        Some test text here about the chart below.   Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.<br><br>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
        <div id="chart_div"></div>
    </div> 
    </div> 
  </div>  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script src="http://getbootstrap.com/assets/js/docs.min.js"></script>
      </body>
      </html>