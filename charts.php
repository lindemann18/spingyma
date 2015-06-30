<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>
<!-- Save chart as image on the server -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/html2canvas.js"></script>
        <script type="text/javascript" src="js/jquery.plugin.html2canvas.js"></script>
 
		<style type="text/css">

		</style>
        
		<script type="text/javascript">
		$(document).ready(function(){
			options={
				 chart: {
                type: 'bar'
            },
            title: {
                text: 'Resultados condición Física'
            },
            subtitle: {
                text: 'BioTest'
            },
            xAxis: {
                categories: ['Cintura', 'Cadera', 'perímetro Espalda', 'Perímetro pecho', 'Perímetro Brazo Relajado', 'Perímetro Brazo flexionado', 'Perímetro Femoral', 'Perímetro Pantorrilla'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Resultados',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' Porciento'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
             series: [{
                name: '21 de julio del 2014',
                data: [5, 3, 4, 7, 2,5,8,4]
            }, {
                name: '21 de agosto del 2014',
                data: [2, 2, 3, 2, 1,6,8,7]
            }]	
			};
			});
			
$(function () {
         chart =$('#container').highcharts(options);
      
   });

    
function capture() {
    $('#container').html2canvas({
        onrendered: function (canvas) {
            //Set hidden field's value to image data (base-64 string)
            $('#img_val').val(canvas.toDataURL("image/png"));
            //Submit the form manually
            document.getElementById("myForm").submit();
        }
    });
}
		</script>
	</head>
    <div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto">

</div>

	<div id="target">
<!-- Render your page inside of this div. -->
<input type="submit" value="Take Screenshot Of Div" onclick="capture();" />
<form method="POST" enctype="multipart/form-data" action="savecharts.php" id="myForm">
    <input type="hidden" name="img_val" id="img_val" value="" />
</form>
</div>
	<body>
<script src="js/charts/highcharts.js"></script>
<script src="js/charts/exporting.js"></script>



	</body>
</html>
