<script>
var system = require('system');
var page = require('webpage').create();
var fs = require('fs');
 
page.injectJs("js/jquery-1.11.1.min.js") || ( console.log("Unable to load jQuery") && phantom.exit());
page.injectJs("js/charts/highcharts.js") || ( console.log("Unable to load Highcharts") && phantom.exit());
page.injectJs("js/charts/exporting.js") || (console.log("Unable to load Highcharts") && phantom.exit());
 
page.onConsoleMessage = function (msg) {
    console.log(msg);
};
 
phantom.injectJs(system.args[1]) || (console.log("Unable to load json file") && phantom.exit());
 
var width = 350, height = 300;
if (system.args.length == 4) {
    width = parseInt(system.args[2], 10);
    height = parseInt(system.args[3], 10);
}
 
console.log("Loaded result file");
 
// Build up result and chart size args for evaluate function
var evalArg = {
   result: result,
   width: width,
   height: height
};
 
var svg = page.evaluate(function(opt) {
 
    // Inject container, so Highcharts can render to
    $('body').append('<div id="container"></div>');
 
    var seriesArray = [];
    $.each(opt.result.drivers, function(idx, driver) {
         seriesArray.push({
                           name: driver.name,
                           data: driver.laps,
                           color: driver.color,
                           animation: false
         });
    });
 
    var chart = new Highcharts.Chart({
             chart: {
                   renderTo: 'container',
                   animations: false,
                   width: opt.width,
                   height: opt.height
             },
             exporting: {
                   enabled: false,
             },
             series: seriesArray,
             title: {
                   text: 'Belgian Grand Prix 2012 - Drivers Lap Times'
             },
             credits: {
                   text: 'Source: www.f1fanatic.co.uk'
             },
             yAxis: {
                   title: {
                       text: 'Time (secs)'
                   },
                   maxPadding: 0.17
             },
             plotOptions: {
                   series: {
                       pointStart: 1
                    }
             },
             xAxis: {
                   title: {
                       text: 'Laps',
                       align: 'high'
                   }
             }
       });
 
       console.log("Exported to SVG");
       return chart.getSVG();
}, evalArg);
 
fs.isFile("/tmp/chart.svg") && fs.remove("/tmp/chart.svg");
console.log("Saved SVG to file");
fs.write("/tmp/chart.svg", svg);
phantom.exit();
</script>