<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	margin: 0px;
	width: 100%;
	background-image: url("image/loginBack.png");
	background-repeat: no-repeat;
	background-size: 100%;
}
#div1{
	width:100%;
	height:700px;
	text-align: center;
}
#div2{
	margin-top:200px;
	width:400px;
	height:200px;
	display:inline-block;
	background-color: rgba(255,255,255,0.5);
	text-align: center;
	padding-top:30px;
	padding-bottom:30px;
	float: right;
	margin-right: 60px;
}
p{
	text-align: center;
	margin:10px;
}
p input{
	font-size:20px;
}
#div2p{
	font-family: 楷体;
	font-weight: bold;
	font-size: 28px;
	color: purple;
}
</style>
<title>登陆</title>
</head>
<body>
	<div id="div1">
		<div id="div2">
			<p id="div2p">
				<span>云安驾校信息管理</span>
			</p>
			<p id="div2p1">
				<span>用户&nbsp;</span>
				<input type="text" id="adminIdInput">
			</p>
			<p id="div2p2">
				<span>密码&nbsp;</span>
				<input type="password" id="adminPwdInput">
			</p>
			<br>
			<p id=div3p3>
				<input type="button" onclick="login()" value="登陆">
				<input type="button" onclick="register()" value="注册">
			</p>
		</div>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquerysession.js"></script>
<script type="text/javascript">
function login(){
	var adminId=$("#adminIdInput").val();
	var adminPwd=$("#adminPwdInput").val();
	if(adminId==""){
		alert("请输入用户名");
	}else if(adminPwd==""){
		alert("请输入密码");
	}else{
		console.log(adminId+adminPwd);
		var url="admin/login.do";
		var data={"adminId":adminId,"adminPwd":adminPwd};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.href="index.jsp";
			}
		});
	}
}
function register(){
	var str='<p id="div2p">'+
			'<span>云安驾校信息管理</span>'+
			'</p>'+
			'<p id="div2p1">'+
			'	<span>用户&nbsp;</span>'+
			'	<input type="text" id="adminIdInput" autocomplete="off">'+
			'</p>'+
			'<p id="div2p2">'+
			'	<span>密码&nbsp;</span>'+
			'	<input type="password" id="adminPwdInput" autocomplete="off">'+
			'</p>'+
			'<br>'+
			'<p id=div3p3>'+
			'	<input type="button" onclick="register2()" value="注册">'+
			'</p>';
	$("#div2").empty();
	$("#div2").append(str);
	$("#div2").css("float","none");
	$("#div2").css("margin-right","0");
	$("body").css("background-image",'url("image/loginBack2.jpg")');
}
function register2(){
	var adminId=$("#adminIdInput").val();
	var adminPwd=$("#adminPwdInput").val();
	var idRule=/^[a-z0-9_-]{3,16}$/;
	var pwdRule=/^[a-z0-9_-]{6,18}$/;
	if(adminId==""){
		alert("请输入用户名");
	}else if(adminPwd==""){
		alert("请输入密码");
	}else if(!idRule.test(adminId)){
		alert("用户名格式不规范,请使用字母数字或下划线(长度在3-16之间)");
	}else if(!pwdRule.test(adminPwd)){
		alert("密码格式不规范,请使用字母数字或下划线(长度在6-18之间)");
	}else{
		console.log(1);
		var url="admin/register.do";
		var data={"adminId":adminId,"adminPwd":adminPwd};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				alert(result.message);
				window.location.reload();
			}
		});
	}
}
</script>
</html>
