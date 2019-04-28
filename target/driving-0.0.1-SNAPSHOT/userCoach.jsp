<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教练</title>
<link href="css/users.css" type="text/css" rel="stylesheet" />
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
		</a> <span id="navTitle">教练管理</span>
	</div>
	<table id="userListTable">
	<tr>
	<th width="25%">姓名</th>
	<th width="25%">年龄</th>
	<th width="25%">联系电话</th>
	<th width="25%">执教时长</th>
	</tr>
	</table>
	<input type="button" onclick="turnToDetail(-1)" value="添加教练">
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	loadCoaches();
});
function loadCoaches(){
	var url="user/getCoaches.do";
	$.getJSON(url,{},function(result){
		lists=result.data;
		for(var i=0;i<lists.length;i++){
			list=lists[i];
			var myDate=new Date();
			var date=myDate.getDate();
			var date1=Date.parse(new Date(date));
			var date2=Date.parse(new Date(list.beginTime));
			var nDays = Math.abs(parseInt((date1 - date2)/1000/3600/24));
			var str="<tr onclick=\"turnToDetail("+list.coachId+")\">";
			str=str+"<td width=\"25%\">"+list.coachName+"</td>";
			str=str+"<td width=\"25%\">"+list.coachAge+"</td>";
			str=str+"<td width=\"25%\">"+list.coachContact+"</td>";
			str=str+"<td width=\"25%\">"+nDays+"天</td>";
			str=str.replace("null","无");
			console.log(str);
			$("#userListTable").append(str);
		}
	});
}
function turnToDetail(coachId){
	var url1 = "userCoachDetail.jsp";
	var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
	form.append('<input type="hidden" name="coachId" value="'+coachId+'"></input>');
	$(document.body).append(form);
	form.submit();
}
</script>
</html>
