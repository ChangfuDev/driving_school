<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约</title>
<link href="css/learnerReser.css" type="text/css" rel="stylesheet">
</head>
<body>
<p>&nbsp;</p>
	<div class="navDiv">
		<a
			id="navALab"
			href="index.jsp"
		> <img
			alt="主页"
			src="image/homePageIcon.png"
			id="homePageImg"
		>
		</a> <span id="navTitle">约车统计</span>
	</div>
	<table id="learnerReserTable">
		<tr>
			<th>学员编号</th>
			<th>姓名</th>
			<th>场地</th>
			<th>分配的教练</th>
			<th>时间</th>
			<th>考试科目</th>
			<th>联系电话</th>
			<th>Email</th>
			<th>审核结果</th>
		</tr>
	</table>
	<input type="button" value="添加约车" onclick="addCarReser()" style="margin-top:80px;">
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	loadCarReser();
});
function loadCarReser(){
	var url="cars/getCarReservation.do";
	$.getJSON(url,{},function(result){
		lists=result.data;
		for(var i=0;i<lists.length;i++){
			list=lists[i];
			var str="<tr class=\"carReserTr\">"+
					"<td id=\"learnerIdTd"+list.reserId+"\">"+list.learnerId+"</td>"+
					"<td id=\"learnerNameTd"+list.reserId+"\">"+list.learnerName+"</td>"+
					"<td>"+list.reserField+"</td>"+
					"<td>"+list.coachName+"</td>"+
					"<td>"+list.reserDate+"</td>"+
					"<td>"+list.reserSub+"</td>"+
					"<td>"+list.reserContact+"</td>"+
					"<td id=\"learnerEmailTd"+list.reserId+"\">"+list.reserEmail+"</td>"+
					"<td>{isChecked}</td>"+
					"</tr>";
			var isC;
			if(list.isChecked==0){
				isC="<input type=\"button\" onclick=\"checkReser("+list.reserId+")\" style=\"background-color:red;width:100%;\" value=\"未审核\">";
			}else{
				isC="<input type=\"button\" style=\"background-color:green;width:100%;\" value=\"已审核\">";
			}
			str=str.replace("{isChecked}",isC);
			$("#learnerReserTable").append(str);
		}
	});
}
function checkReser(reserId){
	var url="cars/checkReser.do";
	var data={"reserId":reserId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			alert(result.message);
		}else{
			var url1 = "mail2.jsp";
			var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
			form.append('<input type="hidden" name="learnerId" value="'+$("#learnerIdTd"+reserId).text()+'"></input>');
			form.append('<input type="hidden" name="learnerName" value="'+$("#learnerNameTd"+reserId).text()+'"></input>');
			form.append('<input type="hidden" name="learnerEmail" value="'+$("#learnerEmailTd"+reserId).text()+'"></input>');
			$(document.body).append(form);
			console.log(form);
			form.submit();
		}
	});
}
function addCarReser(){
	window.location.href="addCarReser.jsp";
}
</script>
</html>
