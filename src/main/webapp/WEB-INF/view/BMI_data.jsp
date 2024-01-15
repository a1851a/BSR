<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 質量指數紀錄資料 -->
<div class="container-fluid">
	<!-- 表格 -->
	<div class="chart_title fw-bolder text-center">表格_質量指數</div>
	<div class="m-2" id="table"></div>
	<!-- 折線圖 -->

  	<div class="chart_title fw-bolder text-center">折線圖_質量指數</div>
  	<div class="m-2" id="chart_div"></div>


</div>

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'table' ]
	});
	google.charts.setOnLoadCallback(drawTables);

	function drawTables() {
		drawTable();
		drawChart();
	}

	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Name');
		data.addColumn('number', 'Salary');
		data.addColumn('boolean', 'Full Time Employee');
		data.addColumn('boolean', 'Full Time Employee');
		data.addRows([ [ 'Mike', {
			v : 10000,
			f : '$10,000'
		}, true, true ], [ 'Bob', {
			v : 7000,
			f : '$7,000'
		}, true, true ] ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}

    google.charts.load('current', {'packages':['line', 'corechart']});
    google.charts.setOnLoadCallback(drawChart);

  function drawChart() {

    var button = document.getElementById('change-chart');
    var chartDiv = document.getElementById('chart_div');

    var data = new google.visualization.DataTable();
    data.addColumn('date', 'Month');
    data.addColumn('number', "Average Temperature");
    data.addColumn('number', "Average Hours of Daylight");

    data.addRows([
      [new Date(2014, 0),  -.5,  5.7],
      [new Date(2014, 1),   .4,  8.7],
      [new Date(2014, 2),   .5,   12],
      [new Date(2014, 3),  2.9, 15.3],
      [new Date(2014, 4),  6.3, 18.6],
      [new Date(2014, 5),    9, 20.9],
      [new Date(2014, 6), 10.6, 19.8],
      [new Date(2014, 7), 10.3, 16.6],
      [new Date(2014, 8),  7.4, 13.3],
      [new Date(2014, 9),  4.4,  9.9],
      [new Date(2014, 10), 1.1,  6.6],
      [new Date(2014, 11), -.2,  4.5]
    ]);

    var materialOptions = {
      width: 900,
      height: 500,
      series: {
        // Gives each series an axis name that matches the Y-axis below.
        0: {axis: 'Temps'},
        1: {axis: 'Daylight'}
      },
      axes: {
        // Adds labels to each axis; they don't have to match the axis names.
        y: {
          Temps: {label: 'Temps (Celsius)'},
          Daylight: {label: 'Daylight'}
        }
      }
    };

    var classicOptions = {
      title: 'Average Temperatures and Daylight in Iceland Throughout the Year',
      width: 900,
      height: 500,
      // Gives each series an axis that matches the vAxes number below.
      series: {
        0: {targetAxisIndex: 0},
        1: {targetAxisIndex: 1}
      },
      vAxes: {
        // Adds titles to each axis.
        0: {title: 'Temps (Celsius)'},
        1: {title: 'Daylight'}
      },
      hAxis: {
        ticks: [new Date(2014, 0), new Date(2014, 1), new Date(2014, 2), new Date(2014, 3),
                new Date(2014, 4),  new Date(2014, 5), new Date(2014, 6), new Date(2014, 7),
                new Date(2014, 8), new Date(2014, 9), new Date(2014, 10), new Date(2014, 11)
               ]
      },
      vAxis: {
        viewWindow: {
          max: 30
        }
      }
    };

    function drawMaterialChart() {
      var materialChart = new google.charts.Line(chartDiv);
      materialChart.draw(data, materialOptions);
    }
    drawMaterialChart();

  }
</script>