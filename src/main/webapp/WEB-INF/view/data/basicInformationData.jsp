<%@page import="com.example.entity.BasicInformation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	interface Pattern{
		String table_pattern = "['%s',%.2f, %.2f, %.2f, %.2f],";
		String line_pattern = "['%s',%.2f],";
	}
%>

<% 
	List <BasicInformation> basicInformations = (List <BasicInformation>) request.getAttribute("basicInformations");
%>
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
	}

	//身體質量表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '時間');
		data.addColumn('number', '身高(公分)');
        data.addColumn('number', '體重(公斤)');
        data.addColumn('number', 'BMI');
        data.addColumn('number', 'BMR');
        
        data.addRows([
       	<%
       		for(BasicInformation binfo : basicInformations){
       			out.println(String.format(Pattern.table_pattern,binfo.getRecordDay(),
       						binfo.getHeight(),binfo.getWeight(),binfo.getBMI(),binfo.getBMR()));
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
	
	//身高圖表
	function draw_HeightLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '公分(cm)');

	      data.addRows([
	      <%
      		for(BasicInformation binfo : basicInformations){
      			out.println(String.format(Pattern.line_pattern,
      					binfo.getRecordDay(),binfo.getHeight()));
      		}
	      %>
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
	      data.addColumn('string', '時間');
	      data.addColumn('number', '公斤(kg)');

	      data.addRows([
	    	  <%
	      		for(BasicInformation binfo : basicInformations){
	      			out.println(String.format(Pattern.line_pattern,
	      					binfo.getRecordDay(),binfo.getWeight()));
	      		}
		      %>
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
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'BMI');

	      data.addRows([
	    	  <%
	      		for(BasicInformation binfo : basicInformations){
	      			out.println(String.format(Pattern.line_pattern,
	      					binfo.getRecordDay(),binfo.getBMI()));
	      		}
		      %>
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
	      data.addColumn('string', '時間');
	      data.addColumn('number', 'BMR');

	      data.addRows([
	    	  <%
	      		for(BasicInformation binfo : basicInformations){
	      			out.println(String.format(Pattern.line_pattern,
	      					binfo.getRecordDay(),binfo.getBMR()));
	      		}
		      %>
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
</script>