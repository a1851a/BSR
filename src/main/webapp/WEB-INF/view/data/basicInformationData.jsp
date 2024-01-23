<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 基本資訊紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_基本資訊</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-身高 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_身高</div>
		  	<div class="my-2 mx-auto" id="height_lineChart"></div>
		  	
		  	<!-- 折線圖-體重 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_體重</div>
		  	<div class="my-2 mx-auto" id="weight_lineChart"></div>
		  	
		  	<!-- 折線圖-BMI -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_BMI</div>
		  	<div class="my-2 mx-auto" id="BMI_lineChart"></div>
		  	
		  	<!-- 折線圖-BMR -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_BMR</div>
		  	<div class="my-2 mx-auto" id="BMR_lineChart"></div>
		  	
		  	<!-- 折線圖-代謝水平 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_代謝水平</div>
		  	<div class="my-2 mx-auto" id="level_lineChart"></div>
	  	
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
		draw_HeightLineChart();
		draw_WeightLineChart();
		draw_BMILineChart();
		draw_BMRLineChart();
		draw_levelLineChart();
	}

	//身體質量表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '身高(公分)');
        data.addColumn('number', '體重(公斤)');
        data.addColumn('number', 'BMI');
        data.addColumn('number', 'BMR');
        data.addColumn('number', '代謝水平');

        
        data.addRows([
          [new Date('2011-12-11'), 178, 55, 55, 55, 1],
          [new Date('2011-10-11'), 176, 67,  55, 55, 3]
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//身高圖表
	function draw_HeightLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '身高');

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
	          title: '身高'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('height_lineChart'));

	      chart.draw(data, options);
	    }

	//體重圖表
	function draw_WeightLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '體重');

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
	          title: '體重'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('weight_lineChart'));

	      chart.draw(data, options);
	    }

	//BMI圖表
	function draw_BMILineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', 'BMI');

	      data.addRows([
		    [new Date('2009-12-11'), 21], [new Date('2010-11-11'), 16],
	        [new Date('2011-12-11'), 11], [new Date('2021-11-11'), 15],
	        [new Date('2021-11-12'), 32], [new Date('2021-12-11'), 33]
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: 'BMI'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('BMI_lineChart'));

	      chart.draw(data, options);
	    }
	
	//BMR圖表
	function draw_BMRLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', 'BMR');

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
	          title: 'BMR'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('BMR_lineChart'));

	      chart.draw(data, options);
	    }
	
	//代謝水平圖表
	function draw_levelLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '代謝水平');

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
	          title: '代謝水平'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('level_lineChart'));

	      chart.draw(data, options);
	    }
</script>