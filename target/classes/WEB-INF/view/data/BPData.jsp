<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 血壓紀錄資料 -->
<div class="container-fluid py-2 px-0">
	<div class="row m-0">
		
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_血壓</div>
		<div class="col-10 my-2 mx-auto" id="table"></div>
		
		<div class="chart">
			
			<!-- 折線圖-收縮壓 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_收縮壓</div>
		  	<div class="col-10 my-2 mx-auto" id="SBP_lineChart"></div>
		  	
		  	<!-- 折線圖-舒張壓 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_舒張壓</div>
		  	<div class="col-10 my-2 mx-auto" id="DBP_lineChart"></div>
		  	
		  	<!-- 折線圖-脈搏 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_脈搏</div>
		  	<div class="col-10 my-2 mx-auto" id="pulse_lineChart"></div>

		</div>
	</div>
</div>

<style>
	
	table td,.google-visualization-table-td.google-visualization-table-type-number{
		text-align: center;
	}
	
	.google-visualization-table-type-date{
		white-space: nowrap;
	}
	
	.chart{
		width: 100%;
		height: 100%;
	}
	
</style>

<script type="text/javascript">
	
	//依螢幕大小調整圖表大小
	window.addEventListener('resize', function() {
	    drawCharts();
	});
	
	google.charts.load('current', {
		'packages' : [ 'table','line','corechart']
	});
	google.charts.setOnLoadCallback(drawCharts);

	function drawCharts() {
		drawTable();
		draw_SBPLineChart();
		draw_DBPLineChart();
		draw_pulseLineChart();
	}

	//身體質量表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '收縮壓');
        data.addColumn('number', '舒張壓');
        data.addColumn('number', '脈搏');
        
        data.addRows([
          [new Date('2011-12-11'), 178, 55, 85],
          [new Date('2011-10-11'), 176, 67, 75]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//收縮壓圖表
	function draw_SBPLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '收縮壓');

	      data.addRows([
		    [new Date('2009-12-11'), 80], [new Date('2010-11-11'), 96],
	        [new Date('2011-12-11'), 100], [new Date('2021-11-11'), 120],
	        [new Date('2021-11-12'), 123], [new Date('2021-12-11'), 170],
	        [new Date('2022-11-12'), 173], [new Date('2023-12-11'), 177]
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '收縮壓'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('SBP_lineChart'));

	      chart.draw(data, options);
	    }

	//舒張壓圖表
	function draw_DBPLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '舒張壓');

	      data.addRows([
		    [new Date('2009-12-11'), 40], [new Date('2010-11-11'), 50],
	        [new Date('2011-12-11'), 54], [new Date('2021-11-11'), 60],
	        [new Date('2021-11-12'), 56], [new Date('2021-12-11'), 70]
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '舒張壓'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('DBP_lineChart'));

	      chart.draw(data, options);
	    }

	//BMI圖表
	function draw_pulseLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '脈搏');

	      data.addRows([
		    [new Date('2009-12-11'), 40], [new Date('2010-11-11'), 50],
	        [new Date('2011-12-11'), 54], [new Date('2021-11-11'), 60],
	        [new Date('2021-11-12'), 56], [new Date('2021-12-11'), 70]
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '脈搏'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('pulse_lineChart'));

	      chart.draw(data, options);
	    }
	
</script>