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
<title>场地管理</title>
<link
	href="css/carDetail.css"
	type="text/css"
	rel="stylesheet"
/>
</head>
<body>
	<a href="carsManage.jsp"> <img alt="返回"
			src="image/arrow-left.png" id="backPageImg" style="width:10px;">
		</a>
	<%!String carId;%>
	<%
		carId = request.getParameter("carId");
		out.println("<h1 id=\"detailH1\">编号:"+carId+"&nbsp;车辆详细情况</h1>");
	%>
	<div id="carDetailDiv">
		<div id="carDetailDiv2">
			<table id="carDetailTable">
				<tr>
					<td width="14%">车辆编号</td>
					<td width="14%"><input type="text" id="carIdInput" disabled="disabled"></td>
					<td width="14%">型号</td>
					<td width="22%" colspan="2"><input type="text" id="carTypeInput" disabled="disabled"></td>
					<td width="16%">开始使用时间</td>
					<td width="20%"><input type="date" id="startTimeInput" disabled="disabled"></td>
				</tr>
				<tr style="background-color: #888888">
					<td width="100%" colspan="7">&nbsp;
					</td>
				</tr>
				<tr>
					<td width="56%" colspan="4">
						<table id="carUseTable">
							<tr>
								<td width="34%">
									使用情况
								</td>
								<td width="66%" colspan="3" id="carUseSitu">
								</td>
							</tr>
							<tr>
								<th width="33%">
									使用人员
								</th>
								<th width="33%">
									编号
								</th>
								<th width="34%">
									使用时间
								</th>
							</tr>
						</table>
					</td>
					<td width="44%" colspan="3">
						<table id="repairOrderTable">
							<tr>
								<td width="33%">
									配件更换
								</td>
								<td width="67%" colspan="2" id="repairOrderSitu">
								</td>
							</tr>
							<tr>
								<th width="33%">
									维修名称
								</th>
								<th width="33%">
									更换位置
								</th>
								<th width="34%">
									更换时间
								</th>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="addNewDiv">
	<input type="button" value="新增使用记录" id="addNewCarUse" onclick="addNewCarUse()">
	<input type="button" value="新增维修记录" id="addNewRepairOrder" onclick="addNewRepairOrder()">
		<table id="addNewObjectsTable">
		</table>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var carId=<%=carId %>;
	loadCar(carId);
	loadUseCar(carId);
	loadRepairOrder(carId);
});
function loadCar(carId){
	var url="cars/getCar.do";
	var data={"carId":carId};
	$.getJSON(url,data,function(result){
		var data=result.data;
		$("#carIdInput").val(data.carId);
		$("#carTypeInput").val(data.carType);
		$("#startTimeInput").val(data.startTime);
	});
}
function loadUseCar(carId){
	var url="cars/getCarUseById.do";
	var data={"carId":carId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			$("#carUseSitu").html(result.message);
		}else{
			lists=result.data;
			$("#carUseSitu").html(result.message);
			for(var i=0;i<lists.length;i++){
				list=lists[i];
				var str="<tr><td width=\"33%\">{coachName}</td><td width=\"33%\">{coachId}</td><td width=\"34%\">{startTime}</td></tr>";
				str=str.replace('{coachName}',list.coachName).replace('{coachId}',list.coachId).replace('{startTime}',list.useTime);
				$("#carUseTable").append(str);
			}
		}
	});
}
function loadRepairOrder(carId){
	var url="cars/getRepairOrderById.do";
	var data={"carId":carId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			$("#repairOrderSitu").html(result.message);
		}else{
			lists=result.data;
			$("#repairOrderSitu").html(result.message);
			for(var i=0;i<lists.length;i++){
				list=lists[i];
				var str="<tr><td width=\"33%\">{repName}</td><td width=\"33%\">{repLocation}</td><td width=\"34%\">{repTime}</td></tr>";
				str=str.replace('{repName}',list.repName).replace('{repLocation}',list.repLocation).replace('{repTime}',list.repTime);
				$("#repairOrderTable").append(str);
			}
		}
	});
}
function addNewCarUse(){
	var carId=<%=carId %>;
	$("#addNewCarUse").attr("disabled",true);
	$("#addNewRepairOrder").attr("disabled",true);
	var str="<tr><td width=\"15%\">车辆编号</td><td width=\"15%\">"+carId+"</td><td width=\"15%\">使用人</td><td id=\"coachSelect\" width=\"15%\"></td><td width=\"15%\">使用时间</td><td width=\"15%\"><input type=\"date\" id=\"useDatePicker\"></td><td  width=\"10%\"><input type=\"button\" value=\"保存\" onclick=\"saveNewCarUse()\"></td></tr>";
	$("#addNewObjectsTable").append(str);
	$.getJSON("user/getCoaches.do",{},function(result){
		lists=result.data;
		var str="<select id=\"coachIdSelect\">";
		var str=str+"<option value=\"0\">"+"无"+"</option>";
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
			str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
		}
		str=str+"</select>";
		$("#coachSelect").append(str);
	});
}

function addNewRepairOrder(){
	var carId=<%=carId %>;
	$("#addNewCarUse").attr("disabled",true);
	$("#addNewRepairOrder").attr("disabled",true);
	var str="<tr><td width=\"10%\">车辆编号</td><td width=\"10%\">"+carId+"</td><td width=\"10%\">零件编号</td><td id=\"deviceSelectTd\" width=\"10%\"></td><td width=\"10%\">维修名称</td><td width=\"10%\"><input type=\"text\" id=\"repairNameInput\"></td><td width=\"10%\">维修位置</td><td width=\"10%\">{location}</td><td width=\"10%\">维修时间</td><td width=\"10%\"><input type=\"date\" id=\"repairDatePicker\"></td><td  width=\"10%\"><input type=\"button\" value=\"保存\" onclick=\"saveNewRepairOrder()\"></td></tr>";
	var location="<select id=\"repLocationSelect\"><option value=\"前轮\">前轮</option><option value=\"后轮\">后轮</option><option value=\"挡风玻璃\">挡风玻璃</option><option value=\"前车门\">前车门</option><option value=\"后车门\">后车门额</option><option value=\"座椅\">座椅</option><option value=\"发动机\">发动机</option><option value=\"空调\">空调</option><option value=\"音响\">音响</option><option value=\"刹车\">刹车</option></select>";
	str=str.replace("{location}",location);
	$("#addNewObjectsTable").append(str);
	$.getJSON("devices/getDevices.do",{},function(result){
		lists=result.data;
		var str="<select id=\"deviceSelect\">";
		for(var j=0;j<lists.length;j++){
			var list=lists[j];
			str=str+"<option value=\""+list.devId+"\">"+list.devName+"(编号:"+list.devId+"-单价:￥"+list.devPrice+")"+"</option>";
		}
		str=str+"</select>";
		$("#deviceSelectTd").append(str);
	});
}


function saveNewCarUse(){
	var carId=<%=carId%>;
	var coachId=$("#coachIdSelect").val();
	var useTime=$("#useDatePicker").val();
	if(coachId=="0"){
		alert('请选择教练');
	}else if(useTime==""){
		alert('请选择使用日期');
	}else{
		var url="cars/addNewCarUse.do";
		var data={"carId":carId,"coachId":coachId,"useTime":useTime};
		$.getJSON(url,data,function(result){
			if(result.state==1){
				window.location.reload();
			}else{
				alert(result.message);
			}
		});
	}
}

function saveNewRepairOrder(){
	var carId=<%=carId%>;
	var devId=$("#deviceSelect").val();
	var repName=$("#repairNameInput").val();
	var repLocation=$("#repLocationSelect").val();
	var repTime=$("#repairDatePicker").val();
	if(repName==""){
		alert('请填写维修名称');
	}else if(repLocation==""){
		alert('请选择维修位置');
	}else if(repTime==""){
		alert('请选择维修时间');
	}else{
		var url="cars/addNewRepairOrder.do";
		var data={"carId":carId,"devId":devId,"repName":repName,"repLocation":repLocation,"repTime":repTime};
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
</script>
</html>