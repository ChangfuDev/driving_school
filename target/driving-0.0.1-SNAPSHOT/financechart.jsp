<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>财务</title>
<style type="text/css">
#main1 {
	width: 49.5%;
	height: 400px;
	display: inline-block;
	background-color: #EEEEEE;
}
#main2 {
	width: 50%;
	height: 400px;
	display: inline-block;
	background-color: #EEEEEE;
}
#main3 {
	width: 49.5%;
	height: 400px;
	display: inline-block;
	background-color: #EEEEEE;
}
#main4 {
	width: 50%;
	height: 400px;
	display: inline-block;
	background-color: #EEEEEE;
}
</style>
</head>
<body>
<%String startTime; %>
<%String endTime; %>
<%
	startTime=request.getParameter("startTime");
	endTime=request.getParameter("endTime");
%>
	<p>
		<a href="finance.jsp"> <img
			alt="返回"
			src="image/arrow-left.png"
			id="backPageImg"
			width="10px"
		>
		</a>
		<h1 style="text-align:center;" id="h1h1">
		test
		</h1>
	
	<div id="main1"></div>
	<div id="main2"></div>
	<div id="main3"></div>
	<div id="main4"></div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
	var start="<%=startTime%>";
	var end="<%=endTime%>";
	$("#h1h1").empty();
	$("#h1h1").html("日期:"+start+"到"+end+"财务明细");
	loadCharts1(start,end);
	loadCharts2(start,end);
	loadCharts3(start,end);
	loadCharts4(start,end);
});
function loadCharts1(start,end){
	var myChart = echarts.init(document.getElementById('main1'));
	// 使用刚指定的配置项和数据显示图表。
	$.getJSON("finance/getIncomeFinance.do",{"startTime":start,"endTime":end},function(result){
		lists=result.data;
		var arrDate = [];
		var arrAmount=[];
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			arrDate.push(list.finanDate);
			arrAmount.push(list.finanAmount);
		}
		myChart.setOption({
			title:{
			text: start+'到'+end+'收入明细图',
			left: 'center',
			top: 'top',
			textStyle:{
				fontSize:30
			}
			},
			tooltip: {
			trigger: 'axis'
			},
			legend: {
			data: ['收入'],
			right:50
			},
			grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
			},
			dataZoom: [
		        {   // 这个dataZoom组件，默认控制x轴。
		            type: 'slider', 
		            start: 0,
		            end: 100
		        }
		    ],
			xAxis: {
			type: 'category',
			boundaryGap: false,
			data: arrDate
			},
			yAxis: {
			type: 'value'
			},
			series: [{
			name: '收入明细',
			type: 'line',
			stack: '总量',
			data: arrAmount
			}]
		});
	});
}
function loadCharts2(start,end){
	var myChart = echarts.init(document.getElementById('main2'));
	// 使用刚指定的配置项和数据显示图表。
	$.getJSON("finance/getOutcomeFinance.do",{"startTime":start,"endTime":end},function(result){
		lists=result.data;
		var arrDate = [];
		var arrAmount=[];
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			arrDate.push(list.finanDate);
			arrAmount.push(list.finanAmount);
		}
		myChart.setOption({
			title:{
			text: start+'到'+end+'支出明细图',
			left: 'center',
			top: 'top',
			textStyle:{
				fontSize:30
			}
			},
			tooltip: {
			trigger: 'axis'
			},
			legend: {
			data: ['支出'],
			right:50
			},
			grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
			},
			dataZoom: [
		        {   // 这个dataZoom组件，默认控制x轴。
		            type: 'slider', 
		            start: 0,
		            end: 100
		        }
		    ],
			xAxis: {
			type: 'category',
			boundaryGap: false,
			data: arrDate
			},
			yAxis: {
			type: 'value'
			},
			series: [{
			name: '支出明细',
			type: 'line',
			stack: '总量',
			data: arrAmount
			}]
		});
	});
}
function loadCharts3(start,end){
	var myChart = echarts.init(document.getElementById('main3'));
	// 使用刚指定的配置项和数据显示图表。
	$.getJSON("finance/getProfitFinance.do",{"startTime":start,"endTime":end},function(result){
		lists=result.data;
		var arrDate = [];
		var arrAmount=[];
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			arrDate.push(list.finanDate);
			arrAmount.push(list.finanAmount);
		}
		myChart.setOption({
			title:{
			text: start+'到'+end+'利润明细图',
			left: 'center',
			top: 'top',
			textStyle:{
				fontSize:30
			}
			},
			tooltip: {
			trigger: 'axis'
			},
			legend: {
			data: ['利润'],
			right:50
			},
			grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
			},
			dataZoom: [
		        {   // 这个dataZoom组件，默认控制x轴。
		            type: 'slider', 
		            start: 0,
		            end: 100
		        }
		    ],
			xAxis: {
			type: 'category',
			boundaryGap: false,
			data: arrDate
			},
			yAxis: {
			type: 'value'
			},
			series: [{
			name: '利润明细',
			type: 'line',
			stack: '总量',
			data: arrAmount
			}]
		});
	});
}
function loadCharts4(start,end){
	var myChart = echarts.init(document.getElementById('main4'));
	// 使用刚指定的配置项和数据显示图表。
	$.getJSON("finance/getAllFinance.do",{},function(result){
		lists=result.data;
		var arrDate = [];
		var arrAmount=[];
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			arrDate.push(list.finanDate);
			arrAmount.push(list.finanAmount);
		}
		myChart.setOption({
			title:{
			text: '总收支明细折线图(按月)',
			left: 'center',
			top: 'top',
			textStyle:{
				fontSize:30
			}
			},
			tooltip: {
			trigger: 'axis'
			},
			legend: {
			data: ['收支明细'],
			right:50
			},
			grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
			},
			dataZoom: [
		        {   // 这个dataZoom组件，默认控制x轴。
		            type: 'slider', 
		            start: 0,
		            end: 100
		        }
		    ],
			xAxis: {
			type: 'category',
			boundaryGap: false,
			data: arrDate
			},
			yAxis: {
			type: 'value'
			},
			series: [{
			name: '收支明细',
			type: 'line',
			stack: '总量',
			data: arrAmount
			}]
		});
	});
}
</script>
</html>
