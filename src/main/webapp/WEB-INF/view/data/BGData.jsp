<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 血糖紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_血糖</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
			
			<!-- 折線圖-空腹血糖 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_空腹血糖</div>
		  	<div class="my-2 mx-auto" id="AC_lineChart"></div>
		  	
		  	<!-- 折線圖-飯後血糖 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_飯後血糖</div>
		  	<div class="my-2 mx-auto" id="PC_lineChart"></div>
		  	
		  	<!-- 折線圖-糖化血色素 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_糖化血色素</div>
		  	<div class="my-2 mx-auto" id="HbA1c_lineChart"></div>
	
			<!-- 折線圖-胰澱粉酶 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_胰澱粉酶</div>
		  	<div class="my-2 mx-auto" id="Amylase_lineChart"></div>
	
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
		draw_ACLineChart();
		draw_PCLineChart();
		draw_HbA1cLineChart();
		draw_AmylaseLineChart();
	}

	//血糖表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '空腹血糖');
        data.addColumn('number', '飯後血糖');
        data.addColumn('number', '糖化血色素');
        data.addColumn('number', '胰澱粉酶');

        data.addRows([
          [new Date('2011-12-11'), 178, 55, 55,100],
          [new Date('2011-10-11'), 176, 67, 55,123]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//空腹血糖圖表
	function draw_ACLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '空腹血糖');

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
	          title: '空腹血糖'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('AC_lineChart'));

	      chart.draw(data, options);
	    }

	//飯後血糖圖表
	function draw_PCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '飯後血糖');

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
	          title: '飯後血糖'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('PC_lineChart'));

	      chart.draw(data, options);
	    }

	//糖化血色素
	function draw_HbA1cLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '糖化血色素');

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
	          title: '糖化血色素'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('HbA1c_lineChart'));

	      chart.draw(data, options);
	    }
	
	//胰澱粉酶
	function draw_AmylaseLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '胰澱粉酶');

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
	          title: '胰澱粉酶'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Amylase_lineChart'));

	      chart.draw(data, options);
	    }
</script>