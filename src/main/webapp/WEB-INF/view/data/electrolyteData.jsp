<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 電解質紀錄資料 -->
<div class="container-fluid py-2 px-0">
	<div class="row m-0">
		
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_電解質</div>
		<div class="col-10 my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-鈉離子 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_鈉離子</div>
		  	<div class="col-10 my-2 mx-auto" id="na_lineChart"></div>
		  	
		  	<!-- 折線圖-鉀離子 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_鉀離子</div>
		  	<div class="col-10 my-2 mx-auto" id="k_lineChart"></div>
		  	
		  	<!-- 折線圖-氯離子 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_氯離子</div>
		  	<div class="col-10 my-2 mx-auto" id="cl_lineChart"></div>
	
			<!-- 折線圖-血中鈣 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_血中鈣</div>
		  	<div class="col-10 my-2 mx-auto" id="Ca_lineChart"></div>
		  	
		  	<!-- 折線圖-血中磷 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_血中磷</div>
		  	<div class="col-10 my-2 mx-auto" id="P_lineChart"></div>
		  	
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
		draw_naLineChart();
		draw_kLineChart();
		draw_clLineChart();
		draw_CaLineChart();
		draw_PLineChart();
	}

	//身體質量表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '鈉離子');
        data.addColumn('number', '鉀離子');
        data.addColumn('number', '氯離子');
        data.addColumn('number', '血中鈣');
        data.addColumn('number', '血中磷');
        
        data.addRows([
          [new Date('2011-12-11'), 178, 55, 85, 23, 43],
          [new Date('2011-10-11'), 176, 67, 75, 94, 53]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//鈉離子圖表
	function draw_naLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '鈉離子');

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
	          title: '鈉離子'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('na_lineChart'));

	      chart.draw(data, options);
	    }

	//鉀離子圖表
	function draw_kLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '鉀離子');

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
	          title: '鉀離子'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('k_lineChart'));

	      chart.draw(data, options);
	    }

	//氯離子圖表
	function draw_clLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '氯離子');

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
	          title: '氯離子'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('cl_lineChart'));

	      chart.draw(data, options);
	    }
	
	//血中鈣圖表
	function draw_CaLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '血中鈣');

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
	          title: '血中鈣'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Ca_lineChart'));

	      chart.draw(data, options);
	    }
	
	//血中磷圖表
	function draw_PLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '血中磷');

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
	          title: '血中磷'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('P_lineChart'));

	      chart.draw(data, options);
	    }
</script>