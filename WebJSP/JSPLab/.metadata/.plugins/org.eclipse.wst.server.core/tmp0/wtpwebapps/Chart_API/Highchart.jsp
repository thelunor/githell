<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<style type="text/css">
		#graph-container-01 {
			width: 600px;
			height: 500px;
		}
	</style>
</head>
<body>
	<div id="graph-container-01"></div>
	
	<script type="text/javascript">
		Highcharts.chart('graph-container-01', {
			title: {
				text: 'Title, 2010-2016'
			},
			subtitle: {
				text: 'subtitle'
			},
			yAxis: {
				title: {
					text: 'Number of Employees' 
				},
				labels: {
					align: "left",
					// y축 라벨: x와 y값만큼 위치조정가능
				},
				// gridLineWidth: 1, y축 Line 두께
				showFirstLabel: false
			},
			legend: {
				layout: 'vertical',
				align: 'right', // left, right, center(default)
				verticalAlign: 'middle' // top, middle, bottom(default)
			},
			series: [{ // 데이터 셋
				name: 'Installation',
				data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
			}, {
				name: 'Manufacturing',
				data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
			}, {
		        name: 'Project Development',
		        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
			}]
		});
	</script>
</body>
</html>