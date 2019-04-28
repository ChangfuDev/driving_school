<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学员</title>
<link href="css/users.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<p>&nbsp;</p>
	<div class="navDiv">
		</a> <span id="navTitle">学员管理</span>
	</div>
	<table id="userListTable">
	<tr>
	<th width="12.5%">编号</th>
	<th width="12.5%">姓名</th>
	<th width="12.5%">考试科目</th>
	<th width="12.5%">申领车型</th>
	<th width="12.5%">开始时间</th>
	<th width="12.5%">Email</th>
	<th width="12.5%">联系方式</th>
	</tr>
	</table>
	<input type="button" onclick="turnToDetail(-1)" value="添加学员">
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	loadLearners();
});
function loadLearners(){
	var url="user/getLearners.do";
	$.getJSON(url,{},function(result){
		lists=result.data;
		var subs=["无","科目一","科目二","科目三","科目四"];
		for(var i=0;i<lists.length;i++){
			list=lists[i];
			var str="<tr onclick=\"turnToDetail("+list.learnerId+")\">";
			str=str+"<td width=\"12.5%\">"+list.learnerId+"</td>";
			str=str+"<td width=\"12.5%\">"+list.learnerName+"</td>";
			str=str+"<td width=\"12.5%\">"+subs[list.presentSubject]+"</td>";
			str=str+"<td width=\"12.5%\">"+list.claimType+"</td>";
			str=str+"<td width=\"12.5%\">"+list.beginDate+"</td>";
			str=str+"<td width=\"12.5%\">"+list.learnerEmail+"</td>";
			str=str+"<td width=\"12.5%\">"+list.learnerContact+"</td>";
			str=str.replace("null","无");
			console.log(str);
			$("#userListTable").append(str);
		}
	});
}
function turnToDetail(learnerId){
	var url1 = "userLearnerDetail.jsp";
	var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
	form.append('<input type="hidden" name="learnerId" value="'+learnerId+'"></input>');
	$(document.body).append(form);
	form.submit();
}
</script>
</html>
