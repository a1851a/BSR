<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Map"%>
<%@page import="com.example.entity.Urine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	interface Pattern{
		String table_pattern = "['%s', '%s', %.2f, '%s', '%s', '%s', '%s', '%s', '%s', '%s', %.2f, '%s'],";
		String ROW_PATTERN = "['%s', %s]";
		String line_pattern = "['%s',%.2f],";
	}
%>

<% 
	List <Urine> urineInformations = (List <Urine>) request.getAttribute("urineInformations");
	
	Map <String,Long> AppearanceMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getAppearance,Collectors.counting()));
	Map <String,Long> LeukocytesMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getLeukocytes,Collectors.counting()));
	Map <String,Long> GlucoseMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getGlucose,Collectors.counting()));
	Map <String,Long> ProteinMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getProtein,Collectors.counting()));
	Map <String,Long> BilirubinMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getBilirubin,Collectors.counting()));
	Map <String,Long> UrobilirubinMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getUrobilirubin,Collectors.counting()));
	Map <String,Long> KetonesMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getKetones,Collectors.counting()));
	Map <String,Long> OccultBloodMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getOccultBlood,Collectors.counting()));
	Map <String,Long> NitriteMap = urineInformations.stream().collect(Collectors.groupingBy(Urine::getNitrite,Collectors.counting()));

%>
<!-- 尿液紀錄資料 -->
<div class="container py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_尿液</div>
		<div class="my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 圓餅圖-外觀 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_外觀</div>
		  	<div class="my-2 mx-auto" id="appearance_pieChart"></div>
		  	
		  	<!-- 折線圖-酸鹼反應 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_酸鹼反應</div>
		  	<div class="my-2 mx-auto" id="PH_lineChart"></div>
		  	
		  	<!-- 圓餅圖-尿血白球 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿血白球</div>
		  	<div class="my-2 mx-auto" id="leukocytes_pieChart"></div>
		  	
		  	<!-- 圓餅圖-尿糖 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿糖</div>
		  	<div class="my-2 mx-auto" id="glucose_pieChart"></div>
		  	
		  	<!-- 圓餅圖-尿蛋白 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿蛋白</div>
		  	<div class="my-2 mx-auto" id="protein_pieChart"></div>
		  	
		  	<!-- 圓餅圖-尿膽紅素 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿膽紅素</div>
		  	<div class="my-2 mx-auto" id="bilirubin_pieChart"></div>
		  	
		  	<!-- 柱狀圖-尿膽素元 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿膽素元</div>
		  	<div class="my-2 mx-auto" id="urobilirubin_barChart"></div>
		  	
		  	<!-- 圓餅圖-尿丙酮體 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿丙酮體</div>
		  	<div class="my-2 mx-auto" id="ketones_pieChart"></div>
		  	
		  	<!-- 圓餅圖-潛血反應 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_潛血反應</div>
		  	<div class="my-2 mx-auto" id="occultBlood_pieChart"></div>

			<!-- 折線圖-比重 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_比重</div>
		  	<div class="my-2 mx-auto" id="specificGravity_lineChart"></div>
		  	
		  	<!-- 圓餅圖-亞硝酸鹽 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_亞硝酸鹽</div>
		  	<div class="my-2 mx-auto" id="nitrite_pieChart"></div>
		  	
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
		'packages' : [ 'table','line','corechart','bar']
	});
	google.charts.setOnLoadCallback(drawCharts);

	function drawCharts() {
		drawTable();
		draw_appearancePieChart();
		draw_PHLineChart();
		draw_leukocytesPieChart();
		draw_glucosePieChart();
		draw_proteinPieChart();
		draw_bilirubinPieChart();
		draw_urobilirubinBarChart();
		draw_ketonesPieChart();
		draw_ketonesPieChart();
		draw_occultBloodPieChart();
		draw_specificGravityLineChart();
		draw_nitritePieChart();
	}

	//尿液表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '時間');
		data.addColumn('string', '外觀');
        data.addColumn('number', '酸鹼反應');
        data.addColumn('string', '尿白血球');
        data.addColumn('string', '尿糖');
        data.addColumn('string', '尿蛋白');
        data.addColumn('string', '尿膽紅素');
        data.addColumn('string', '尿膽素元');
        data.addColumn('string', '尿丙酮體');
        data.addColumn('string', '潛血反應');
        data.addColumn('number', '比重');
        data.addColumn('string', '亞硝酸鹽');

        
        data.addRows([
        <%
      		for(Urine uinfo : urineInformations){
      			out.println(String.format(Pattern.table_pattern,uinfo.getRecordDay(),uinfo.getAppearance(),
      					uinfo.getPH(),uinfo.getLeukocytes(),uinfo.getGlucose(),uinfo.getProtein(),uinfo.getBilirubin(),
      					uinfo.getUrobilirubin(),uinfo.getKetones(),uinfo.getOccultBlood(),uinfo.getSpecificGravity(),uinfo.getNitrite()));
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
	
	//外觀圓餅圖
	function draw_appearancePieChart() {
        var data = google.visualization.arrayToDataTable([
        ['外觀','次數'],
        <%
          String AppearanceResult = AppearanceMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, AppearanceMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(AppearanceResult);
      	%>
        ]);
        
        var options = {
          is3D: true,
          legend: 'top',
          language: 'zh'
        };

        var chart = new google.visualization.PieChart(document.getElementById('appearance_pieChart'));
        chart.draw(data, options);
      }
	
	//酸鹼反應圖表
	function draw_PHLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '酸鹼反應');

	      data.addRows([
    	  <%
      		for(Urine uinfo : urineInformations){
      			out.println(String.format(Pattern.line_pattern,
      					uinfo.getRecordDay(),uinfo.getPH()));
      		}
	      %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '酸鹼反應'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('PH_lineChart'));

	      chart.draw(data, options);
	    }
	
	//尿白血球圓餅圖
	function draw_leukocytesPieChart() {
        var data = google.visualization.arrayToDataTable([
        ['尿白血球','次數'],
        <%
          String LeukocytesResult = LeukocytesMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, LeukocytesMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(LeukocytesResult);
      	%>
        ]);

        var options = {
          is3D: true,
          legend: 'top',
          language: 'zh'
        };

        var chart = new google.visualization.PieChart(document.getElementById('leukocytes_pieChart'));
        chart.draw(data, options);
      }
	
	//尿糖圓餅圖
	function draw_glucosePieChart() {
        var data = google.visualization.arrayToDataTable([
        ['尿糖','次數'],
        <%
          String GlucoseResult = GlucoseMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, GlucoseMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(GlucoseResult);
      	%>
        ]);

        var options = {
          is3D: true,
          legend: 'top',
          language: 'zh'
        };

        var chart = new google.visualization.PieChart(document.getElementById('glucose_pieChart'));
        chart.draw(data, options);
      }
	
	//尿蛋白圓餅圖
	function draw_proteinPieChart() {
        var data = google.visualization.arrayToDataTable([
        ['尿蛋白','次數'],
        <%
          String ProteinResult = ProteinMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, ProteinMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(ProteinResult);
      	%>
        ]);

        var options = {
          is3D: true,
          legend: 'top',
          language: 'zh'
        };

        var chart = new google.visualization.PieChart(document.getElementById('protein_pieChart'));
        chart.draw(data, options);
      }
	
	//尿膽紅素圓餅圖
	function draw_bilirubinPieChart() {
        var data = google.visualization.arrayToDataTable([
        ['尿膽紅素','次數'],
        <%
          String BilirubinResult = BilirubinMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, BilirubinMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(BilirubinResult);
      	%>
        ]);

        var options = {
          is3D: true,
          legend: 'top',
          language: 'zh'
        };

        var chart = new google.visualization.PieChart(document.getElementById('bilirubin_pieChart'));
        chart.draw(data, options);
      }
	
	//尿膽素元柱狀圖
	function draw_urobilirubinBarChart() {
        var data = new google.visualization.arrayToDataTable([
        ['尿膽素元', '次數'],
        <%
          String UrobilirubinResult = UrobilirubinMap.keySet().stream()
			  .map(key -> String.format(Pattern.ROW_PATTERN, key, UrobilirubinMap.get(key)))
			  .collect(Collectors.joining(","));

		  out.print(UrobilirubinResult);
      	%>
        ]);

        var options = {
          legend: { position: 'none' },
          axes: {
            x: {
              0: { side: 'top'} 
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('urobilirubin_barChart'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
	
    //尿丙酮體圓餅圖
  	function draw_ketonesPieChart() {
          var data = google.visualization.arrayToDataTable([
          ['尿丙酮體','次數'],
          <%
            String KetonesResult = KetonesMap.keySet().stream()
  			  .map(key -> String.format(Pattern.ROW_PATTERN, key, KetonesMap.get(key)))
  			  .collect(Collectors.joining(","));

  		  	out.print(KetonesResult);
          %>
          ]);

          var options = {
            is3D: true,
            legend: 'top',
            language: 'zh'
          };

          var chart = new google.visualization.PieChart(document.getElementById('ketones_pieChart'));
          chart.draw(data, options);
        }
    
  	//潛血反應圓餅圖
  	function draw_occultBloodPieChart() {
          var data = google.visualization.arrayToDataTable([
          ['潛血反應','次數'],
          <%
          	String OccultBloodResult = OccultBloodMap.keySet().stream()
  			  .map(key -> String.format(Pattern.ROW_PATTERN, key, OccultBloodMap.get(key)))
  			  .collect(Collectors.joining(","));

  		  	out.print(OccultBloodResult);
          %>
          ]);

          var options = {
            is3D: true,
            legend: 'top',
            language: 'zh'
          };

          var chart = new google.visualization.PieChart(document.getElementById('occultBlood_pieChart'));
          chart.draw(data, options);
        }
  	
  	//比重圖表
	function draw_specificGravityLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('string', '時間');
	      data.addColumn('number', '比重');

	      data.addRows([
	   	  <%
      		for(Urine uinfo : urineInformations){
      			out.println(String.format(Pattern.line_pattern,
      					uinfo.getRecordDay(),uinfo.getSpecificGravity()));
      		}
		  %>
	      ]);

	      var options = {
	        hAxis: {
	          title: '時間'
	        },
	        vAxis: {
	          title: '比重'
	        },
	        legend: 'top',
	        language: 'zh'
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('specificGravity_lineChart'));

	      chart.draw(data, options);
	    }
  	
	//潛血反應圓餅圖
  	function draw_nitritePieChart() {
          var data = google.visualization.arrayToDataTable([
          ['亞硝酸鹽','次數'],
          <%
            String NitriteResult = NitriteMap.keySet().stream()
  			  .map(key -> String.format(Pattern.ROW_PATTERN, key, NitriteMap.get(key)))
  			  .collect(Collectors.joining(","));

  		  	out.print(NitriteResult);
          %>
          ]);

          var options = {
            is3D: true,
            legend: 'top',
            language: 'zh'
          };

          var chart = new google.visualization.PieChart(document.getElementById('nitrite_pieChart'));
          chart.draw(data, options);
        }
</script>