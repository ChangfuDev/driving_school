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
<a href="userLearner.jsp"> <img alt="返回"
			src="image/arrow-left.png" id="backPageImg">
		</a>
<%!String learnerId;%>
<%
	learnerId = request.getParameter("learnerId");
%>
	<table id="learnerDetailTable">
		<tr>
			<td width="16%">
			姓名
			</td>
			<td width="16%">
			<input id="learnerNameInput" type="text">
			</td>
			<td width="16%">
			年龄
			</td>
			<td width="16%">
			<input id="learnerAgeInput" type="number">
			</td>
			<td width="16%">
			性别
			</td>
			<td width="20%">
			<select id="learnerGenderInput">
			<option value="男">
			男
			</option>
			<option value="女">
			女
			</option>
			</select>
			</td>
		</tr>
		<tr>
		<td colspan="6"></td>
		</tr>
		<tr>
			<td width="16%">
			出生日期
			</td>
			<td width="16%">
			<input id="learnerBirthdayInput" type="date">
			</td>
			<td width="16%">
			联系方式
			</td>
			<td width="16%">
			<input id="learnerContactInput" type="text">
			</td>
			<td width="16%">
			Email
			</td>
			<td width="20%">
			<input id="learnerEmailInput" type="text">
			</td>
		</tr>
		<tr>
		<td colspan="6"></td>
		</tr>
		<tr>
			<td width="16%">
			身份证号
			</td>
			<td width="16%">
			<input id="learnerIcardInput" type="text">
			</td>
			<td width="16%">
			微信
			</td>
			<td width="16%">
			<input id="learnerWechatInput" type="text">
			</td>
			<td width="16%">
			QQ
			</td>
			<td width="20%">
			<input id="learnerQqInput" type="text">
			</td>
		</tr>
		<tr>
		<td colspan="6"></td>
		</tr>
		<tr>
			<td width="16%">
			家庭住址
			</td>
			<td width="16%">
			<input id="learnerAddressInput" type="text">
			</td>
			<td width="16%">
			学籍状态
			</td>
			<td width="16%">
			<select id="learnStatusSelect">
				<option value="0">退学</option>
				<option value="1">在职</option>
				<option value="2">毕业</option>
			</select>
			<td width="16%">
			正在报考科目
			</td>
			<td width="20%">
			<select id="presentSubjectSelect">
				<option value="0">无</option>
				<option value="1">科目一</option>
				<option value="2">科目二</option>
				<option value="3">科目三</option>
				<option value="4">科目四</option>
			</select>
			</td>
		</tr>
		<tr>
		<td colspan="6"></td>
		</tr>
		<tr>
			<td width="16%">
			申领车型
			</td>
			<td width="16%">
			<select id="claimTypeSelect">
				<option value="A1">A1</option>
				<option value="A2">A2</option>
				<option value="A3">A3</option>
				<option value="B1">B1</option>
				<option value="B2">B2</option>
				<option value="C1">C1</option>
				<option value="C2">C2</option>
				<option value="C3">C3</option>
				<option value="C4">C4</option>
				<option value="D">D</option>
				<option value="E">E</option>
				<option value="F">F</option>
				<option value="M">M</option>
				<option value="N">N</option>
				<option value="P">P</option>
			</select>
			</td>
			<td width="16%">
			开始时间
			</td>
			<td width="16%">
			<input id="beginDateInput" type="date">
			</td>
			<td width="16%">
			结束时间
			</td>
			<td width="20%">
			<input id="finishDateInput" type="date">
			</td>
		</tr>
	</table>
	<p/><p/>
	<%
		if(!learnerId.equals("-1")){
			out.println("<input type=\"button\" value=\"保存\" id=\"updateLearnerButton\" onclick=\"updateLearner()\" disabled=\"disabled\">");
			out.println("<input type=\"button\"  value=\"修改\" id=\"changeLearnerButton\" onclick=\"changeLearner()\">");
		}else{
			out.println("<input type=\"button\" value=\"保存\" id=\"insertLearnerButton\" onclick=\"insertLearner()\"");
		}
	%>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var learnerId=<%=learnerId%>;
	if(learnerId=="-1"){
		
	}else{
		loadLearnerById(learnerId);
	}
});
function loadLearnerById(learnerId){
	var url="user/getLearnerById.do";
	var data={"learnerId":learnerId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			alert(result.messge);
		}else{
			data=result.data;
			$("#learnerNameInput").val(data.learnerName);
			$("#learnerAgeInput").val(data.learnerAge);
			$("#learnerGenderInput").val(data.learnerGender);
			$("#learnerBirthdayInput").val(data.learnerBirthday);
			$("#learnerContactInput").val(data.learnerContact);
			$("#learnerEmailInput").val(data.learnerEmail);
			$("#learnerIcardInput").val(data.learnerIcard);
			$("#learnerWechatInput").val(data.learnerWechat);
			$("#learnerQqInput").val(data.learnerQq);
			$("#learnerAddressInput").val(data.learnerAddress);
			$("#learnStatusSelect").val(data.learnStatus);
			$("#presentSubjectSelect").val(data.presentSubject);
			$("#claimTypeSelect").val(data.claimType);
			$("#beginDateInput").val(data.beginDate);
			$("#finishDateInput").val(data.finishDate);
			
			$("#learnerNameInput").attr("disabled",true);
			$("#learnerAgeInput").attr("disabled",true);
			$("#learnerGenderInput").attr("disabled",true);
			$("#learnerBirthdayInput").attr("disabled",true);
			$("#learnerContactInput").attr("disabled",true);
			$("#learnerEmailInput").attr("disabled",true);
			$("#learnerIcardInput").attr("disabled",true);
			$("#learnerWechatInput").attr("disabled",true);
			$("#learnerQqInput").attr("disabled",true);
			$("#learnerAddressInput").attr("disabled",true);
			$("#learnStatusSelect").attr("disabled",true);
			$("#presentSubjectSelect").attr("disabled",true);
			$("#claimTypeSelect").attr("disabled",true);
			$("#beginDateInput").attr("disabled",true);
			$("#finishDateInput").attr("disabled",true);
		}
	});
}
function changeLearner(){
	$("#learnerNameInput").attr("disabled",false);
	$("#learnerAgeInput").attr("disabled",false);
	$("#learnerGenderInput").attr("disabled",false);
	$("#learnerBirthdayInput").attr("disabled",false);
	$("#learnerContactInput").attr("disabled",false);
	$("#learnerEmailInput").attr("disabled",false);
	$("#learnerIcardInput").attr("disabled",false);
	$("#learnerWechatInput").attr("disabled",false);
	$("#learnerQqInput").attr("disabled",false);
	$("#learnerAddressInput").attr("disabled",false);
	$("#learnStatusSelect").attr("disabled",false);
	$("#presentSubjectSelect").attr("disabled",false);
	$("#claimTypeSelect").attr("disabled",false);
	$("#beginDateInput").attr("disabled",false);
	$("#finishDateInput").attr("disabled",false);
	$("#changeLearnerButton").attr("disabled",true);
	$("#updateLearnerButton").attr("disabled",false);
}
function updateLearner(){
	var learnerId=<%=learnerId%>;
	var learnerName=$("#learnerNameInput").val();
	var learnerAge=$("#learnerAgeInput").val();
	var learnerGender=$("#learnerGenderInput").val();
	var learnerBirthday=$("#learnerBirthdayInput").val();
	var learnerContact=$("#learnerContactInput").val();
	var learnerEmail=$("#learnerEmailInput").val();
	var learnerIcard=$("#learnerIcardInput").val();
	var learnerWechat=$("#learnerWechatInput").val();
	var learnerQq=$("#learnerQqInput").val();
	var learnerAddress=$("#learnerAddressInput").val();
	var learnStatus=$("#learnStatusSelect").val();
	var presentSubject=$("#presentSubjectSelect").val();
	var claimType=$("#claimTypeSelect").val();
	var beginDate=$("#beginDateInput").val();
	var finishDate=$("#finishDateInput").val();
	if(finishDate==null)
		finishDate="";
	if(learnerName==""){
		alert('请填写学员姓名');
	}else if(learnerAge==""){
		alert('请填写学员年龄');
	}else if(learnerBirthday==""){
		alert('请填写学员生日');
	}else if(learnerContact==""){
		alert('请填写学员联系方式');
	}else if(learnerIcard==""){
		alert('请填写学员身份证');
	}else if(learnerWechat==""){
		alert('请填写学员微信号');
	}else if(learnerAddress==""){
		alert('请填写学员地址');
	}else if(beginDate==""){
		alert('请选择开始日期');
	}else{
		var url="user/updateLearner.do";
		var data={"learnerId":learnerId,"learnerName":learnerName,"learnerAge":learnerAge,"learnerGender":learnerGender,"learnerBirthday":learnerBirthday,"learnerContact":learnerContact,"learnerEmail":learnerEmail,"learnerIcard":learnerIcard,"learnerWechat":learnerWechat,"learnerQq":learnerQq,"learnerAddress":learnerAddress,"learnStatus":learnStatus,"presentSubject":presentSubject,"claimType":claimType,"beginDate":beginDate,"finishDate":finishDate};
		console.log(data);
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.reload();
			}
		});
	}
}
function insertLearner(){
	$("#learnerNameInput").attr("disabled",false);
	$("#learnerAgeInput").attr("disabled",false);
	$("#learnerGenderInput").attr("disabled",false);
	$("#learnerBirthdayInput").attr("disabled",false);
	$("#learnerContactInput").attr("disabled",false);
	$("#learnerEmailInput").attr("disabled",false);
	$("#learnerIcardInput").attr("disabled",false);
	$("#learnerWechatInput").attr("disabled",false);
	$("#learnerQqInput").attr("disabled",false);
	$("#learnerAddressInput").attr("disabled",false);
	$("#learnStatusSelect").attr("disabled",false);
	$("#presentSubjectSelect").attr("disabled",false);
	$("#claimTypeSelect").attr("disabled",false);
	$("#beginDateInput").attr("disabled",false);
	$("#finishDateInput").attr("disabled",false);
	var learnerId=<%=learnerId%>;
	var learnerName=$("#learnerNameInput").val();
	var learnerAge=$("#learnerAgeInput").val();
	var learnerGender=$("#learnerGenderInput").val();
	var learnerBirthday=$("#learnerBirthdayInput").val();
	var learnerContact=$("#learnerContactInput").val();
	var learnerEmail=$("#learnerEmailInput").val();
	var learnerIcard=$("#learnerIcardInput").val();
	var learnerWechat=$("#learnerWechatInput").val();
	var learnerQq=$("#learnerQqInput").val();
	var learnerAddress=$("#learnerAddressInput").val();
	var learnStatus=$("#learnStatusSelect").val();
	var presentSubject=$("#presentSubjectSelect").val();
	var claimType=$("#claimTypeSelect").val();
	var beginDate=$("#beginDateInput").val();
	var finishDate=$("#finishDateInput").val();
	if(finishDate==null)
		finishDate="";
	if(learnerName==""){
		alert('请填写学员姓名');
	}else if(learnerAge==""){
		alert('请填写学员年龄');
	}else if(learnerBirthday==""){
		alert('请填写学员生日');
	}else if(learnerContact==""){
		alert('请填写学员联系方式');
	}else if(learnerIcard==""){
		alert('请填写学员身份证');
	}else if(learnerWechat==""){
		alert('请填写学员微信号');
	}else if(learnerAddress==""){
		alert('请填写学员地址');
	}else if(beginDate==""){
		alert('请选择开始日期');
	}else{
		var url="user/insertLearner.do";
		var data={"learnerId":learnerId,"learnerName":learnerName,"learnerAge":learnerAge,"learnerGender":learnerGender,"learnerBirthday":learnerBirthday,"learnerContact":learnerContact,"learnerEmail":learnerEmail,"learnerIcard":learnerIcard,"learnerWechat":learnerWechat,"learnerQq":learnerQq,"learnerAddress":learnerAddress,"learnStatus":learnStatus,"presentSubject":presentSubject,"claimType":claimType,"beginDate":beginDate,"finishDate":finishDate};
		console.log(data);
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.href="userLearner.jsp";
			}
		});
	}
}
</script>
</html>
