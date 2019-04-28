<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<style type="text/css">
body{
	margin:0px;
}
p {
	margin: 0px;
}
#navTitle {
	line-height: 30px;
	text-align: right;
	width: 95%;
	display: inline-block;
	font-size: 28px;
	font-family:楷体;
	font-weight: bold;
	color:white;
}

.navDiv{
	background-image: url("image/longBack.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

table{
	width:20%;
	height:400px;
	text-align: center;
	float:left;
}
tr{
	width:50%;
	cursor: pointer;
	background-color: #DDDDDD;
}
tr:hover{
	width:50%;
	cursor: pointer;
	background-color: #AAAAAA;
}
td{
	width:30%;

}
td span{
	font-size:25px;
}
#navALab {
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}
#homePageImg {
	width: 30px;
}
#contentDiv{
	width:80%;
	height:800px;
	float:left;
}
#contentDiv iframe{
	width:100%;
	height:100%;
	background-color: #DDDDDD;
}
</style>
</head>
<body>
	</div>
			<table>
				<tr>
					<td onclick="userLearner()">
						<span>学员管理</span>
					</td>
				</tr>
				<tr>
					<td onclick="userCoach()">
						<span>教练管理</span>
					</td>
				</tr>
			</table>
	<div id="contentDiv">
		<iframe id="contentFrame" name="contentList"></iframe>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function userLearner(){
	$("#contentFrame").attr('src','userLearner.jsp');
}
function userCoach(){
	$("#contentFrame").attr('src','userCoach.jsp');
}
</script>
</html>
