<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 尿液沉渣紀錄資料 -->
<div class="container-fluid py-2 px-0">
	<div class="row m-0">
	
		<!-- 表格 -->
		<div class="chart_title fw-bolder text-center my-2">表格_尿液沉渣</div>
		<div class="col-10 my-2 mx-auto" id="table"></div>
		
		<div class="chart">
		
			<!-- 折線圖-尿紅血球 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿紅血球</div>
		  	<div class="col-10 my-2 mx-auto" id="RBC_lineChart"></div>
		  	
		  	<!-- 折線圖-尿白血球 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿白血球</div>
		  	<div class="col-10 my-2 mx-auto" id="WBC_lineChart"></div>
		  	
		  	<!-- 折線圖-上皮細胞 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_上皮細胞</div>
		  	<div class="col-10 my-2 mx-auto" id="epithelium_lineChart"></div>
		  		
		  	<!-- 柱狀圖-結晶體 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_結晶體</div>
		  	<div class="col-10 my-2 mx-auto" id="crystal_barChart"></div>
		  	
		  	<!-- 柱狀圖-尿圓柱體 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_尿圓柱體</div>
		  	<div class="col-10 my-2 mx-auto" id="cast_barChart"></div>
		  	 	
		  	<!-- 柱狀圖-細菌 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_細菌</div>
		  	<div class="col-10 my-2 mx-auto" id="bacteria_barChart"></div>
		  	 	 	
		  	<!-- 柱狀圖-其他 -->
		  	<div class="chart_title fw-bolder text-center my-2">折線圖_其他</div>
		  	<div class="col-10 my-2 mx-auto" id="other_barChart"></div>
		  	 	 	
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
		draw_RBCLineChart();
		draw_WBCLineChart();
		draw_epitheliumLineChart();
		draw_crystalBarChart();
		draw_castBarChart();
		draw_bacteriaBarChart();
		draw_otherBarChart();
	}

	//尿液表格
	function drawTable() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '時間');
		data.addColumn('number', '尿紅血球');
        data.addColumn('number', '尿白血球');
        data.addColumn('number', '上皮細胞');
        data.addColumn('boolean', '結晶體');
        data.addColumn('boolean', '尿圓柱體');
        data.addColumn('boolean', '細菌');
        data.addColumn('boolean', '其他');

        data.addRows([
          [new Date('2011-12-11'), 2, 2, 3, true, true, true, false],
          [new Date('2012-12-11'), 1, 2, 1, false, true, true, false],
        ]);

		var table = new google.visualization.Table(document
				.getElementById('table'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%'
		});
	}
	
	//尿紅血球圖表
	function draw_RBCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '尿紅血球');

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
	          title: '尿紅血球'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('RBC_lineChart'));

	      chart.draw(data, options);
	    }
	
	//尿白血球圖表
	function draw_WBCLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '尿白血球');

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
	          title: '尿白血球'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('WBC_lineChart'));

	      chart.draw(data, options);
	    }
	
	//上皮細胞圖表
	function draw_epitheliumLineChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('date', '時間');
	      data.addColumn('number', '上皮細胞');

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
	          title: '上皮細胞'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('epithelium_lineChart'));

	      chart.draw(data, options);
	    }
	
	
	//結晶體柱狀圖
	function draw_crystalBarChart() {
        var data = new google.visualization.arrayToDataTable([
          ['結晶體', '次數'],
          ["無", 44],
          ["有", 23]
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

        var chart = new google.charts.Bar(document.getElementById('crystal_barChart'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
	
    //尿圓柱體柱狀圖
  	function draw_castBarChart() {
          var data = new google.visualization.arrayToDataTable([
            ['尿圓柱體', '次數'],
            ["無", 44],
            ["有", 23]
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

          var chart = new google.charts.Bar(document.getElementById('cast_barChart'));
          // Convert the Classic options to Material options.
          chart.draw(data, google.charts.Bar.convertOptions(options));
        };
  	
      //細菌柱狀圖
    	function draw_bacteriaBarChart() {
            var data = new google.visualization.arrayToDataTable([
              ['細菌', '次數'],
              ["無", 44],
              ["有", 23]
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

            var chart = new google.charts.Bar(document.getElementById('bacteria_barChart'));
            // Convert the Classic options to Material options.
            chart.draw(data, google.charts.Bar.convertOptions(options));
          };
    	
        //其他柱狀圖
      	function draw_otherBarChart() {
              var data = new google.visualization.arrayToDataTable([
                ['其他', '次數'],
                ["無", 44],
                ["有", 23]
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

              var chart = new google.charts.Bar(document.getElementById('other_barChart'));
              // Convert the Classic options to Material options.
              chart.draw(data, google.charts.Bar.convertOptions(options));
            };
      	
</script>