<%@page import="com.example.entity.BP"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%!
	interface Pattern{
		String table_pattern = "['%s',%d, %d, %d],";
		String line_pattern = "['%s',%d],";
	}
%>

<%
	List <BP> BPInformations =(List <BP>) request.getAttribute("BPInfomations");
%>

<!-- 血壓紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
		
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_血壓</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
			
			<!-- 折線圖-收縮壓 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_收縮壓</div>
		  	<div class="my-2 mx-auto" id="SBP_lineChart"></div>
		  	
		  	<!-- 折線圖-舒張壓 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_舒張壓</div>
		  	<div class="my-2 mx-auto" id="DBP_lineChart"></div>
		  	
		  	<!-- 折線圖-脈搏 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_脈搏</div>
		  	<div class="my-2 mx-auto" id="pulse_lineChart"></div>

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
		data.addColumn('string', '時間');
		data.addColumn('number', '收縮壓');
        data.addColumn('number', '舒張壓');
        data.addColumn('number', '脈搏');
        
        data.addRows([
        	<%
        		for(BP bpinfo: BPInformations){
        			out.println(String.format(Pattern.table_pattern,bpinfo.getRecordDay(),
        					bpinfo.getSBP(),bpinfo.getDBP(),bpinfo.getPulse()));
        		}
        	%>
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
	      data.addColumn('string', '時間');
	      data.addColumn('number', '收縮壓');

	      data.addRows([
	    	<%
	       		for(BP bpinfo : BPInformations){
	       			out.println(String.format(Pattern.line_pattern,bpinfo.getRecordDay(),
	       					bpinfo.getSBP()));
	       		}
	       	%>	
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '收縮壓'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('SBP_lineChart'));

	      chart.draw(data, options);
	    }

	//舒張壓圖表
	function draw_DBPLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '舒張壓');

	      data.addRows([
	      	<%
	       		for(BP bpinfo : BPInformations){
	       			out.println(String.format(Pattern.line_pattern,bpinfo.getRecordDay(),
	       					bpinfo.getDBP()));
	       		}
	       	%>	
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '舒張壓'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('DBP_lineChart'));

	      chart.draw(data, options);
	    }

	//BMI圖表
	function draw_pulseLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '脈搏');

	      data.addRows([
			<%
	       		for(BP bpinfo : BPInformations){
	       			out.println(String.format(Pattern.line_pattern,bpinfo.getRecordDay(),
	       					bpinfo.getPulse()));
	       		}
	       	%>	
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '脈搏'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('pulse_lineChart'));

	      chart.draw(data, options);
	    }
	
</script>