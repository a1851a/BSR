<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 肝臟功能錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_肝臟功能</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-總膽紅素 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_總膽紅素</div>
		  	<div class="my-2 mx-auto" id="dbit_lineChart"></div>
		  	
		  	<!-- 折線圖-直接膽紅素 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_直接膽紅素</div>
		  	<div class="my-2 mx-auto" id="dbil_lineChart"></div>
		  	
		  	<!-- 折線圖-總蛋白 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_總蛋白</div>
		  	<div class="my-2 mx-auto" id="TP_lineChart"></div>
	
			<!-- 折線圖-白蛋白 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_白蛋白</div>
		  	<div class="my-2 mx-auto" id="Alb_lineChart"></div>
	
			<!-- 折線圖-球蛋白 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_球蛋白</div>
		  	<div class="my-2 mx-auto" id="Glo_lineChart"></div>
	
			<!-- 折線圖-麩胺酸苯醋酸轉氨基酶 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_麩胺酸苯醋酸轉氨基酶</div>
		  	<div class="my-2 mx-auto" id="sGOT_lineChart"></div>
	
			<!-- 折線圖-麩胺酸丙酮酸轉氨酶 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_麩胺酸丙酮酸轉氨酶</div>
		  	<div class="my-2 mx-auto" id="sGPT_lineChart"></div>
		
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
		draw_dbitLineChart();
		draw_dbilLineChart();
		draw_TPLineChart();
		draw_AlbLineChart();
		draw_GloLineChart();
		draw_sGOTLineChart();
		draw_sGPTLineChart();
	}

	//腎臟功能表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '總膽紅素');
        data.addColumn('number', '直接膽紅素');
        data.addColumn('number', '總蛋白');
        data.addColumn('number', '白蛋白');
        data.addColumn('number', '球蛋白');
        data.addColumn('number', '麩胺酸苯醋酸轉氨基酶');
        data.addColumn('number', '麩胺酸丙酮酸轉氨酶');

        data.addRows([
          [new Date('2011-12-11'), 178, 55, 100, 12, 122, 123, 34],
          [new Date('2011-10-11'), 176, 67, 123, 21, 21, 43, 321]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//總膽紅素圖表
	function draw_dbitLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '總膽紅素');

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
	          title: '總膽紅素'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('dbit_lineChart'));

	      chart.draw(data, options);
	    }

	//直接膽紅素圖表
	function draw_dbilLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '直接膽紅素');

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
	          title: '直接膽紅素'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('dbil_lineChart'));

	      chart.draw(data, options);
	    }

	//總蛋白圖表
	function draw_TPLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '總蛋白');

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
	          title: '總蛋白'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('TP_lineChart'));

	      chart.draw(data, options);
	    }
	
	//白蛋白圖表
	function draw_AlbLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '白蛋白');

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
	          title: '白蛋白'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Alb_lineChart'));

	      chart.draw(data, options);
	    }
	
	//球蛋白圖表
	function draw_GloLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '球蛋白');

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
	          title: '球蛋白'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Glo_lineChart'));

	      chart.draw(data, options);
	    }
	
	//麩胺酸苯醋酸轉氨基酶圖表
	function draw_sGOTLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '麩胺酸苯醋酸轉氨基酶');

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
	          title: '麩胺酸苯醋酸轉氨基酶'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('sGOT_lineChart'));

	      chart.draw(data, options);
	    }
	
	//麩胺酸丙酮酸轉氨酶圖表
	function draw_sGPTLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '麩胺酸丙酮酸轉氨酶');

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
	          title: '麩胺酸丙酮酸轉氨酶'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('sGPT_lineChart'));

	      chart.draw(data, options);
	    }
</script>