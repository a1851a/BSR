<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 腎臟功能錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_腎臟功能</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-尿素氮 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿素氮</div>
		  	<div class="my-2 mx-auto" id="BUN_lineChart"></div>
		  	
		  	<!-- 折線圖-肌酸酐 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_肌酸酐</div>
		  	<div class="my-2 mx-auto" id="Cr_lineChart"></div>
		  	
		  	<!-- 折線圖-尿酸 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿酸</div>
		  	<div class="my-2 mx-auto" id="UA_lineChart"></div>
	
			<!-- 折線圖-微量白蛋白 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_微量白蛋白</div>
		  	<div class="my-2 mx-auto" id="mAlb_lineChart"></div>
		
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
	//window.addEventListener('resize', function() {
	    //drawCharts();
	//});
	
	google.charts.load('current', {
		'packages' : [ 'table','line','corechart']
	});
	google.charts.setOnLoadCallback(drawCharts);

	function drawCharts() {
		drawTable();
		draw_BUNLineChart();
		draw_CrLineChart();
		draw_UALineChart();
		draw_mAlbLineChart();
	}

	//腎臟功能表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '尿素氮');
        data.addColumn('number', '肌酸酐');
        data.addColumn('number', '尿酸');
        data.addColumn('number', '微量白蛋白');

        data.addRows([
          [new Date('2011-12-11'), 178, 55, 100, 12],
          [new Date('2011-10-11'), 176, 67, 123, 21]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//尿素氮圖表
	function draw_BUNLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '尿素氮');

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
	          title: '尿素氮'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('BUN_lineChart'));

	      chart.draw(data, options);
	    }

	//肌酸酐圖表
	function draw_CrLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '肌酸酐');

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
	          title: '肌酸酐'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Cr_lineChart'));

	      chart.draw(data, options);
	    }

	//尿酸圖表
	function draw_UALineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '尿酸');

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
	          title: '尿酸'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('UA_lineChart'));

	      chart.draw(data, options);
	    }
	
	//微量白蛋白圖表
	function draw_mAlbLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '微量白蛋白');

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
	          title: '微量白蛋白'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('mAlb_lineChart'));

	      chart.draw(data, options);
	    }
	
</script>