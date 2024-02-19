<%@page import="com.example.entity.Hyperlipidemia"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	interface Pattern{
		String table_pattern = "['%s',%d, %d, %d, %d, %d, %.2f, %.2f],";
		String line_pattern_int = "['%s',%d],";
	}
%>

<% 
	List <Hyperlipidemia> HyperlipidemiaInformations = (List <Hyperlipidemia>) request.getAttribute("HyperlipidemiaInformations");
%>
<!-- 血脂肪紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_血脂肪</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-三酸甘油脂 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_三酸甘油脂</div>
		  	<div class="my-2 mx-auto" id="TG_lineChart"></div>
		  	
		  	<!-- 折線圖-膽固醇 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_膽固醇</div>
		  	<div class="my-2 mx-auto" id="TC_lineChart"></div>
		  	
		  	<!-- 折線圖-高密度膽固醇 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_高密度膽固醇</div>
		  	<div class="my-2 mx-auto" id="HDL_lineChart"></div>
	
			<!-- 折線圖-低密度膽固醇 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_低密度膽固醇</div>
		  	<div class="my-2 mx-auto" id="LDL_lineChart"></div>
	
			<!-- 折線圖-極低密度膽固醇 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_極低密度膽固醇</div>
		  	<div class="my-2 mx-auto" id="vldl_lineChart"></div>
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
		draw_TGLineChart();
		draw_TCLineChart();
		draw_HDLLineChart();
		draw_LDLLineChart();
		draw_vldlLineChart();
	}

	//血脂肪表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '時間');
		data.addColumn('number', '三酸甘油脂');
        data.addColumn('number', '膽固醇');
        data.addColumn('number', '高密度膽固醇');
        data.addColumn('number', '低密度膽固醇');
        data.addColumn('number', '極低密度膽固醇');
        data.addColumn('number', '血管硬化機率');
        data.addColumn('number', '中風率');

        data.addRows([
        <%
       		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
       			out.println(String.format(Pattern.table_pattern,hyinfo.getRecordDay(),
       						hyinfo.getTG(),hyinfo.getTC(),hyinfo.getHDL(),hyinfo.getLDL(),
       						hyinfo.getVldl(),hyinfo.getAngiosclerosis(),hyinfo.getStroke()));
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
	
	//三酸甘油脂圖表
	function draw_TGLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'mg/dL');

	      data.addRows([
    	  <%
      		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					hyinfo.getRecordDay(),hyinfo.getTG()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '三酸甘油脂'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('TG_lineChart'));

	      chart.draw(data, options);
	    }

	//膽固醇圖表
	function draw_TCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'mg/dL');

	      data.addRows([
    	  <%
      		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					hyinfo.getRecordDay(),hyinfo.getTC()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '膽固醇'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('TC_lineChart'));

	      chart.draw(data, options);
	    }

	//高密度膽固醇圖表
	function draw_HDLLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'mg/dL');

	      data.addRows([
    	  <%
      		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					hyinfo.getRecordDay(),hyinfo.getHDL()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '高密度膽固醇'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('HDL_lineChart'));

	      chart.draw(data, options);
	    }
	
	//低密度膽固醇圖表
	function draw_LDLLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'mg/dL');

	      data.addRows([
    	  <%
      		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					hyinfo.getRecordDay(),hyinfo.getLDL()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '低密度膽固醇'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('LDL_lineChart'));

	      chart.draw(data, options);
	    }
	
	//極低密度膽固醇圖表
	function draw_vldlLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'mg/dL');

	      data.addRows([
    	  <%
      		for(Hyperlipidemia hyinfo : HyperlipidemiaInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					hyinfo.getRecordDay(),hyinfo.getVldl()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '極低密度膽固醇'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('vldl_lineChart'));

	      chart.draw(data, options);
	    }
	
	
</script>