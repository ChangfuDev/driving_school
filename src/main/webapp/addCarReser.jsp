<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加约车</title>
<style type="text/css">
table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	margin-top:50px;
}
#backPageImg {
	width: 10px;
}
td{
	border:solid 1px;
}
table input{
	width:100%;
}
select{
	width:100%;
}
</style>
</head>
<body>
	<a href="learnerReservation.jsp"> <img
		alt="返回"
		src="image/arrow-left.png"
		id="backPageImg"
	>
	</a>
	<table id="addReserTable">
		<tr>
			<td width="16.7%">学员编号</td>
			<td
				width="16.7%"
				id="learnerIdSelectTd"
			>
			<select id="learnerIdSelect">
			</select>
			</td>
			<td width="16.7%">姓名</td>
			<td width="16.7%" id="learnerNameTd"></td>
			<td width="16.7%">场地</td>
			<td
				width="16.7%"
				id="fieldSelectTd"
			></td>
		</tr>
		<tr>
			<td width="16.7%">分配教练</td>
			<td
				width="16.7%"
				id="coachIdSelectTd"
			></td>
			<td width="16.7%">时间</td>
			<td width="16.7%"><input
				type="date"
				id="reserDateInput"
			></td>
			<td width="16.7%">科目</td>
			<td
				width="16.7%"
				id="reserSubSelectTd"
			>
			<select id="reserSubSelect">
				<option value="1">科目一</option>
				<option value="2">科目二</option>
				<option value="3">科目三</option>
				<option value="4">科目四</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="16.7%">联系电话</td>
			<td
				width="16.7%"
			>
			<input id="reserContactInput" type="number">
			</td>
			<td width="16.7%">Email</td>
			<td width="16.7%"><input
				type="text"
				id="reserEmailInput"
			></td>
		</tr>
	</table>
	<input type="button" onclick="addCarReser()" value="添加">
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#learnerIdSelect").change(changeLearnerId);
	load();
});
function load(){
	$.getJSON("user/getCoaches.do",{},function(result){
		lists=result.data;
		var str="<select id=\"coachIdSelect\">";
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
				str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
		}
		str=str+"</select>";
		$("#coachIdSelectTd").append(str);
	});
	$.getJSON("user/getLearners.do",{},function(result){
		lists=result.data;
		$("#learnerNameTd").html(lists[0].learnerName);
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
				var str="<option value=\""+list.learnerId+"\">"+list.learnerId+"</option>";
				$("#learnerIdSelect").append(str);
		}
	});
	$.getJSON("fields/getAllFieldId.do",{},function(result){
		lists=result.data;
		var str="<select id=\"fieldSelect\">";
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
				str=str+"<option value=\""+list+"\">"+list+"</option>";
		}
		str=str+"</select>";
		$("#fieldSelectTd").append(str);
	});
}
function changeLearnerId(){
	var learnerId=$("#learnerIdSelect").val();
	$.getJSON("user/getLearners.do",{},function(result){
		lists=result.data;
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
			if(learnerId==list.learnerId){
				$("#learnerNameTd").html(list.learnerName);
			}
		}
	});
}
function addCarReser(){
	var learnerId=$("#learnerIdSelect").val();
	var reserField=$("#fieldSelect").val();
	var coachId=$("#coachIdSelect").val();
	var reserSub=$("#reserSubSelect").val();
	var reserDate=$("#reserDateInput").val();
	var reserContact=$("#reserContactInput").val();
	var reserEmail=$("#reserEmailInput").val();
	if(reserDate==""){
		alert("请选择日期");
	}else if(reserContact==""){
		alert('请填写预约电话');
	}else if(reserEmail==""){
		alert('请填写预约邮箱');
	}else{
		var url="cars/addNewCarReser.do";
		var data={"learnerId":learnerId,"reserField":reserField,"coachId":coachId,"reserSub":reserSub,"reserDate":reserDate,"reserContact":reserContact,"reserEmail":reserEmail};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.href="learnerReservation.jsp";
			}
		});
	}
}
</script>
</html>
