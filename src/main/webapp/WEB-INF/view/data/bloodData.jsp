<%@page import="com.example.entity.Blood"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%!
	interface Pattern{
		String table_pattern = "['%s', %d, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f, %d],";
		String line_pattern_double = "['%s',%.2f],";
		String line_pattern_int = "['%s',%d],";
	}
%>

<% 
	List <Blood> bloodInformations = (List <Blood>) request.getAttribute("bloodInformations");
%>
<!-- 血液(全血)紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
		
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_血液(全血)</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-白血球 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_白血球</div>
		  	<div class="my-2 mx-auto" id="WBC_lineChart"></div>
		  	
		  	<!-- 折線圖-紅血球 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_紅血球</div>
		  	<div class="my-2 mx-auto" id="RBC_lineChart"></div>
		  	
		  	<!-- 折線圖-血色素 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_血色素</div>
		  	<div class="my-2 mx-auto" id="Hgb_lineChart"></div>
	
			<!-- 折線圖-血球容積比 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_血球容積比</div>
		  	<div class="my-2 mx-auto" id="Hct_lineChart"></div>
		  	
		  	<!-- 折線圖-平均紅血球容積 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_平均紅血球容積</div>
		  	<div class="my-2 mx-auto" id="MCV_lineChart"></div>
		  	
		  	<!-- 折線圖-平均紅血球血紅素量 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_平均紅血球血紅素量</div>
		  	<div class="my-2 mx-auto" id="MCH_lineChart"></div>
		  	
		  	<!-- 折線圖-平均紅血球血紅素濃度 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_平均紅血球血紅素濃度</div>
		  	<div class="my-2 mx-auto" id="MCHC_lineChart"></div>
		  	
		  	<!-- 折線圖-血小板 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_血小板</div>
		  	<div class="my-2 mx-auto" id="PLT_lineChart"></div>
		
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
		draw_WBCLineChart();
		draw_RBCLineChart();
		draw_HgbLineChart();
		draw_HctLineChart();
		draw_MCVLineChart();
		draw_MCHLineChart();
		draw_MCHCLineChart();
		draw_PLTLineChart();
	}

	//血液(全血)表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '時間');
		data.addColumn('number', '白血球');
        data.addColumn('number', '紅血球');
        data.addColumn('number', '血色素');
        data.addColumn('number', '血球容積比');
        data.addColumn('number', '平均紅血球容積');
        data.addColumn('number', '平均紅血球血紅素量');
        data.addColumn('number', '平均紅血球血紅素濃度');
        data.addColumn('number', '血小板');
        
        data.addRows([
       	<%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.table_pattern,binfo.getRecordDay(),
      					binfo.getWBC(),binfo.getRBC(),binfo.getHgb(),binfo.getHct(),
      					binfo.getMCV(),binfo.getMCH(),binfo.getMCHC(),binfo.getPLT()));
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
	
	//白血球圖表
	function draw_WBCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '白血球');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					binfo.getRecordDay(),binfo.getWBC()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '白血球'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('WBC_lineChart'));

	      chart.draw(data, options);
	    }

	//紅血球圖表
	function draw_RBCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '紅血球');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getRBC()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '紅血球'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('RBC_lineChart'));

	      chart.draw(data, options);
	    }

	//血色素圖表
	function draw_HgbLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '血色素');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getHgb()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '血色素'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Hgb_lineChart'));

	      chart.draw(data, options);
	    }
	
	//血球容積比圖表
	function draw_HctLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '血球容積比');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getHct()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '血球容積比'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('Hct_lineChart'));

	      chart.draw(data, options);
	    }
	
	//平均紅血球容積圖表
	function draw_MCVLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '平均紅血球容積');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getMCV()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '平均紅血球容積'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('MCV_lineChart'));

	      chart.draw(data, options);
	    }
	
	//平均紅血球血紅素量圖表
	function draw_MCHLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '平均紅血球血紅素量');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getMCH()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '平均紅血球血紅素量'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('MCH_lineChart'));

	      chart.draw(data, options);
	    }
	
	//平均紅血球血紅素濃度圖表
	function draw_MCHCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '平均紅血球血紅素濃度');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_double,
      					binfo.getRecordDay(),binfo.getMCHC()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '平均紅血球血紅素濃度'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('MCHC_lineChart'));

	      chart.draw(data, options);
	    }
	
	//血小板圖表
	function draw_PLTLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '血小板');

	      data.addRows([
    	  <%
      		for(Blood binfo : bloodInformations){
      			out.println(String.format(Pattern.line_pattern_int,
      					binfo.getRecordDay(),binfo.getPLT()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '血小板'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('PLT_lineChart'));

	      chart.draw(data, options);
	    }
</script>