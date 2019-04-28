<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% String user=null;
	try{user=session.getAttribute("admin").toString();
	if(user==null||user.equals("")){
		response.sendRedirect("login.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("login.jsp");
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link href="css/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="navDiv">
		<p>&nbsp;</p>
			 <span id="navTitle">云安驾校信息管理</span>
		<p>&nbsp;</p>
	</div>
	<div id="div1">
		<select id="options">
			<option value="0">系统菜单</option>
			<option value="1">场地管理</option>
			<option value="2">用户管理</option>
			<option value="3">约车统计</option>
			<option value="4">人事管理</option>
			<option value="5">财务管理</option>
			<option value="6">车辆管理</option>
			<option value="7">报名管理</option>
			<option value="8">通知</option>
			<option value="9">设备管理</option>
		</select>
		<span id="loginUserState">当前登陆用户是:{user}</span>
		<input type="button" value="退出登录" id="quit" onclick="quit()">
	</div>
	<div id="div2">
		<iframe name="ifr" id="ifr"></iframe>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#options").change(function(){
		if($("#options").val()=="0"){
			$("#ifr").attr("src",'');
		}else if($("#options").val()=="1"){
			$("#ifr").attr("src",'fieldManage.jsp');
		}
		else if($("#options").val()=="2"){
			$("#ifr").attr("src",'userSelect.jsp');
		}
		else if($("#options").val()=="3"){
			$("#ifr").attr("src",'learnerReservation.jsp');
		}
		else if($("#options").val()=="4"){
			$("#ifr").attr("src",'personnelManage.jsp');
		}
		else if($("#options").val()=="5"){
			$("#ifr").attr("src",'finance.jsp');
		}
		else if($("#options").val()=="6"){
			$("#ifr").attr("src",'carsManage.jsp');
		}
		else if($("#options").val()=="7"){
			$("#ifr").attr("src",'enroll.jsp');
		}
		else if($("#options").val()=="8"){
			$("#ifr").attr("src",'mail.jsp');
		}else{
			$("#ifr").attr("src",'deviceManage.jsp');
		}
	});
	$("#loginUserState").html($("#loginUserState").text().replace("{user}",'<%=user %>'));
});
function quit(){
	var url="admin/quit.do";
	$.getJSON(url,{},function(result){
		window.location.href="login.jsp";
	});
}
</script>
</html>
