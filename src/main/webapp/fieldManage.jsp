<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>场地管理</title>
<link href="css/fieldManage.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<table>
		<tr>
			<td onclick="turnToFieldMess(1)"><img alt="field1"
				src="image/fieldBackground.gif"> <span class="fieldTitle">科目一场地</span>
				<span id="fieldStatus1" class="fieldStatus">当前正在使用：{num}</span></td>
		</tr>
		<tr>
			<td onclick="turnToFieldMess(2)"><img alt="field2"
				src="image/fieldBackground.gif"> <span class="fieldTitle">科目二场地</span><span
				id="fieldStatus2" class="fieldStatus">当前正在使用：{num}</span></td>
		</tr>
		<tr>
			<td onclick="turnToFieldMess(3)"><img alt="field3"
				src="image/fieldBackground.gif"> <span class="fieldTitle">科目三场地</span><span
				id="fieldStatus3" class="fieldStatus">当前正在使用：{num}</span></td>
		</tr>
		<tr>
			<td onclick="turnToFieldMess(4)"><img alt="field4"
				src="image/fieldBackground.gif"> <span class="fieldTitle">科目四场地</span><span
				id="fieldStatus4" class="fieldStatus">当前正在使用：{num}</span></td>
		</tr>
	</table>
	<div id="contentDiv">
		<iframe id="contentFrame" name="contentList"></iframe>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		loadFieldsMessage();
	});

	function loadFieldsMessage() {
		var url = "fields/getFieldsStatus.do";
		$.getJSON(url, {}, function(list) {
			var fieldStatus1 = list[0];
			var fieldStatus2 = list[1];
			var fieldStatus3 = list[2];
			var fieldStatus4 = list[3];
			$("#fieldStatus1").html(
					$("#fieldStatus1").text().replace('{num}', fieldStatus1));
			$("#fieldStatus2").html(
					$("#fieldStatus2").text().replace('{num}', fieldStatus2));
			$("#fieldStatus3").html(
					$("#fieldStatus3").text().replace('{num}', fieldStatus3));
			$("#fieldStatus4").html(
					$("#fieldStatus4").text().replace('{num}', fieldStatus4));
			console.log(fieldStatus1);
		});
	}
	function turnToFieldMess(which) {
		$("#contentFrame").attr('src','fieldsDetail.jsp');
		var url1 = "fieldsDetail.jsp";
		var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\" target=\"contentList\"></form>");
		form.append('<input type="hidden" name="which" value="'+which+'"></input>');
		$(document.body).append(form);
		form.submit();
	}
</script>
</html>
