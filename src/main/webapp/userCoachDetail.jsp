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
<a href="userCoach.jsp"> <img alt="返回"
			src="image/arrow-left.png" id="backPageImg">
		</a>
<%!String coachId;%>
<%
	coachId = request.getParameter("coachId");
%>
	<table id="coachDetailTable">
		<tr>
			<td>
			姓名
			</td>
			<td>
			<input id="coachNameInput" type="text">
			</td>
			<td>
			年龄
			</td>
			<td>
			<input id="coachAgeInput" type="number">
			</td>
			<td>
			性别
			</td>
			<td>
			<select id="coachGenderSelect">
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="6">
			</td>
		</tr>
		<tr>
			<td>
			出生日期
			</td>
			<td>
			<input id="coachBirthdayInput" type="date">
			</td>
			<td>
			家庭住址
			</td>
			<td>
			<input id="coachAddressInput" type="text">
			</td>
			<td>
			联系电话
			</td>
			<td>
			<input id="coachContactInput" type="text">
			</td>
		</tr>
		<tr>
			<td colspan="6">
			</td>
		</tr>
		<tr>
			<td>
			身份证号
			</td>
			<td>
			<input id="coachIcardInput" type="text">
			</td>
			<td>
			微信
			</td>
			<td>
			<input id="coachWechatInput" type="text">
			</td>
			<td>
			执教开始时间
			</td>
			<td>
			<input id="beginTimeInput" type="date">
			</td>
		</tr>
	</table>
	<p/><p/>
	<%
		if(!coachId.equals("-1")){
			out.println("<input type=\"button\" value=\"保存\" id=\"updateCoachButton\" onclick=\"updateCoach()\" disabled=\"disabled\">");
			out.println("<input type=\"button\"  value=\"修改\" id=\"changeCoachButton\" onclick=\"changeCoach()\">");
		}else{
			out.println("<input type=\"button\" value=\"保存\" id=\"insertCoachButton\" onclick=\"insertCoach()\"");
		}
	%>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var coachId=<%=coachId%>;
	if(coachId=="-1"){
		
	}else{
		loadCoachById(coachId);
	}
});
function loadCoachById(coachId){
	var url="user/getCoachById.do";
	var data={"coachId":coachId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			alert(result.messge);
		}else{
			data=result.data;
			$("#coachNameInput").val(data.coachName);
			$("#coachAgeInput").val(data.coachAge);
			$("#coachGenderSelect").val(data.coachGender);
			$("#coachBirthdayInput").val(data.coachBirthday);
			$("#coachAddressInput").val(data.coachAddress);
			$("#coachContactInput").val(data.coachContact);
			$("#coachIcardInput").val(data.coachIcard);
			$("#coachWechatInput").val(data.coachWechat);
			$("#beginTimeInput").val(data.beginTime);
			
			
			$("#coachNameInput").attr("disabled",true);
			$("#coachAgeInput").attr("disabled",true);
			$("#coachGenderSelect").attr("disabled",true);
			$("#coachBirthdayInput").attr("disabled",true);
			$("#coachAddressInput").attr("disabled",true);
			$("#coachContactInput").attr("disabled",true);
			$("#coachIcardInput").attr("disabled",true);
			$("#coachWechatInput").attr("disabled",true);
			$("#beginTimeInput").attr("disabled",true);
		}
	});
}
function changeCoach(){
	$("#coachNameInput").attr("disabled",false);
	$("#coachAgeInput").attr("disabled",false);
	$("#coachGenderSelect").attr("disabled",false);
	$("#coachBirthdayInput").attr("disabled",false);
	$("#coachAddressInput").attr("disabled",false);
	$("#coachContactInput").attr("disabled",false);
	$("#coachIcardInput").attr("disabled",false);
	$("#coachWechatInput").attr("disabled",false);
	$("#beginTimeInput").attr("disabled",false);
	$("#changeCoachButton").attr("disabled",true);
	$("#updateCoachButton").attr("disabled",false);
}
function updateCoach(){
	var coachId=<%=coachId%>;
	var coachName=$("#coachNameInput").val();
	var coachAge=$("#coachAgeInput").val();
	var coachGender=$("#coachGenderSelect").val();
	var coachBirthday=$("#coachBirthdayInput").val();
	var coachAddress=$("#coachAddressInput").val();
	var coachContact=$("#coachContactInput").val();
	var coachIcard=$("#coachIcardInput").val();
	var coachWechat=$("#coachWechatInput").val();
	var beginTime=$("#beginTimeInput").val();
	if(coachName==""){
		alert('请填写教练名称');
	}else if(coachAge==""){
		alert('请填写教练年龄');
	}else if(coachBirthday==""){
		alert('请填写教练生日');
	}else if(coachAddress==""){
		alert('请填写教练地址');
	}else if(coachContact==""){
		alert('请填写教练联系方式');
	}else if(coachIcard==""){
		alert('请填写教练身份证');
	}else if(coachWechat==""){
		alert('请填写教练微信号');
	}else if(beginTime==""){
		alert('请选择开始时间');
	}else{
		var url="user/updateCoach.do";
		var data={"coachId":coachId,"coachName":coachName,"coachAge":coachAge,"coachGender":coachGender,"coachBirthday":coachBirthday,"coachAddress":coachAddress,"coachContact":coachContact,"coachIcard":coachIcard,"coachWechat":coachWechat,"beginTime":beginTime};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.reload();
			}
		});
	}

}
function insertCoach(){
	var coachId=<%=coachId%>;
	var coachName=$("#coachNameInput").val();
	var coachAge=$("#coachAgeInput").val();
	var coachGender=$("#coachGenderSelect").val();
	var coachBirthday=$("#coachBirthdayInput").val();
	var coachAddress=$("#coachAddressInput").val();
	var coachContact=$("#coachContactInput").val();
	var coachIcard=$("#coachIcardInput").val();
	var coachWechat=$("#coachWechatInput").val();
	var beginTime=$("#beginTimeInput").val();
	if(coachName==""){
		alert('请填写教练名称');
	}else if(coachAge==""){
		alert('请填写教练年龄');
	}else if(coachBirthday==""){
		alert('请填写教练生日');
	}else if(coachAddress==""){
		alert('请填写教练地址');
	}else if(coachContact==""){
		alert('请填写教练联系方式');
	}else if(coachIcard==""){
		alert('请填写教练身份证');
	}else if(coachWechat==""){
		alert('请填写教练微信号');
	}else if(beginTime==""){
		alert('请选择开始时间');
	}else{
		var url="user/insertCoach.do";
		var data={"coachId":coachId,"coachName":coachName,"coachAge":coachAge,"coachGender":coachGender,"coachBirthday":coachBirthday,"coachAddress":coachAddress,"coachContact":coachContact,"coachIcard":coachIcard,"coachWechat":coachWechat,"beginTime":beginTime};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.href="userCoach.jsp";
			}
		});
	}
}
</script>
</html>
