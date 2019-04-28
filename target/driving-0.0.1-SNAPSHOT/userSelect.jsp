<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<style type="text/css">
.div1{
	width:100%;
	height:1000px;
	display:block;
	text-align: center;
}
.div2{
	width:50%;
	height:500px;
	display: inline-block;
	margin-top: 150px;
}
table{
	width:100%;
	text-align: center;
}
tr{
	height:500px;
	cursor: pointer;
}
td{
	border-radius: 15px;
	background-color: yellow;

}
td span{
	font-size:25px;
}
</style>
</head>
<body>
	<div class="div1">
		<div class="div2">
			<table>
				<tr>
					<td onclick="userLearner()">
						<span>学员管理</span>
					</td>
					<td onclick="userCoach()">
						<span>教练管理</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
function userLearner(){
	window.location.href="userLearner.jsp";
}
function userCoach(){
	window.location.href="userCoach.jsp";
}
</script>
</html>
