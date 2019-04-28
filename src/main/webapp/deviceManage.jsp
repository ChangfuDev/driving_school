<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<style type="text/css">
#homePageImg {
	width: 30px;
}

#navALab {
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

#navTitle {
	line-height: 30px;
	text-align: center;
	width: 95%;
	display: inline-block;
	font-size: 28px;
}
#chooseOption{
	width:100%;
	text-align:center;
	
}
#optionSelect{
	width:auto;
	display: inline-block;
	margin-top:50px;
	font-size:20px;
	padding:10px;
	cursor: pointer;
}
#mainDiv{
	width:100%;
	height:auto;
	marigin-top:50px;
}
table {
	border-collapse: collapse;
	width:100%;
	text-align: center;
	font-size:25px;
	margin-top:80px;
}
td{
	border:solid 1px;
}
input{
	font-size:25px;
}
select{
	font-size:25px;
}
.button{
	margin:50px;
	border-radius: 3px;
}
</style>
</head>
<body>
	<p>&nbsp;</p>
	<div class="navDiv">
		</a> <span id="navTitle">设备管理页面</span>
	</div>
	<div id="chooseOption">
		<select id="optionSelect">
			<option value="0">请选择操作</option>
			<option value="1">入库管理</option>
			<option value="2">出库管理</option>
			<option value="3">设备库存</option>
			<option value="4">流水设备单</option>
		</select>
	</div>
	<div id="mainDiv">
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#optionSelect").change(function(){
		if($("#optionSelect").val()=="0"){
			$("#mainDiv").empty();
		}else if($("#optionSelect").val()=="1"){
			loadIn();
		}else if($("#optionSelect").val()=="2"){
			loadOut();
		}else if($("#optionSelect").val()=="3"){
			loadStore();
		}else if($("#optionSelect").val()=="4"){
			loadList();
		}
	});
});


function loadIn(){
	$("#mainDiv").empty();
	var str="<table>"+
			"<tr>"+
			"<td width=\"16.7%\">供应商</td>"+
			"<td width=\"16.7%\"><input type=\"text\" id=\"supplierInputIn\"></td>"+
			"<td width=\"16.7%\">时间</td>"+
			"<td width=\"16.7%\"><input type=\"date\" id=\"dateInputIn\"></td>"+
			"<td width=\"16.7%\">备注(采购人)</td>"+
			"<td width=\"16.7%\"><input type=\"text\" id=\"pSInputIn\"></td>"+
			"</tr>"+
			"<tr>"+
			"<td colspan=\"2\">设备</td>"+
			"<td colspan=\"2\">数量</td>"+
			"<td colspan=\"2\">单价</td>"+
			"<td></td>"+
			"</tr>"+
			"<tr>"+
			"<td colspan=\"2\" id=\"deviceSelectInTd\">{deviceSelect}</td>"+
			"<td colspan=\"2\"><input type=\"number\" id=\"deviceNumInInput\"></td>"+
			"<td colspan=\"2\"><input type=\"number\" id=\"devicePriceInInput\"></td>"+
			"</tr>"+
			"</table>"+
			"<input class=\"button\" type=\"button\" value=\"保存\" onclick=\"saveIn()\">";
	$.ajaxSetup({async:false});
	var dS;
	$.getJSON("devices/getDevices.do",{},function(result){
		var lists=result.data;
		dS="<select id=\"deviceSelectIn\">";
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			dS=dS+"<option value=\""+list.devId+"\">"+list.devName+"("+list.devId+")"+"</option>";
		}
		dS=dS+"<option>";
	});
	str=str.replace("{deviceSelect}",dS);
	$("#mainDiv").append(str);
	
}
function saveIn(){
	var supplier=$("#supplierInputIn").val();
	var flistTime=$("#dateInputIn").val();
	var pS=$("#pSInputIn").val();
	var devId=$("#deviceSelectIn").val();
	var count=$("#deviceNumInInput").val();
	var price=$("#devicePriceInInput").val();
	if(supplier==""){
		alert("请填写供应商");
	}else if (flistTime==""){
		alert("请填写日期");
	}else if(pS==""){
		alert("请填写备注");
	}else if(count==""){
		alert("请填写数量");
	}else if(price==""){
		alert("请填写单价");
	}else{
		var url="devices/addDevicesIn.do";
		var data={"devId":devId,"price":price,"count":count,"pS":pS,"flistTime":flistTime,"supplier":supplier};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				alert('保存成功');
				window.location.reload();
			}
		});
	}
}

function loadOut(){
	$("#mainDiv").empty();
	var str="<table>"+
			"<tr>"+
			"<td width=\"16.7%\">时间</td>"+
			"<td width=\"33.2%\" colspan=\"2\"><input type=\"date\" id=\"dateInputIn\"></td>"+
			"<td width=\"16.7%\">备注(取货人))</td>"+
			"<td width=\"33.2%\" colspan=\"2\"><input type=\"text\" id=\"pSInputIn\"></td>"+
			"</tr>"+
			"<tr>"+
			"<td colspan=\"2\">设备</td>"+
			"<td colspan=\"2\">数量</td>"+
			"<td colspan=\"2\">单价</td>"+
			"<td></td>"+
			"</tr>"+
			"<tr>"+
			"<td colspan=\"2\" id=\"deviceSelectInTd\">{deviceSelect}</td>"+
			"<td colspan=\"2\"><input type=\"number\" id=\"deviceNumInInput\"></td>"+
			"<td colspan=\"2\"><input type=\"number\" id=\"devicePriceInInput\"></td>"+
			"</tr>"+
			"</table>"+
			"<input class=\"button\" type=\"button\" value=\"保存\" onclick=\"saveOut()\">";
	$.ajaxSetup({async:false});
	var dS;
	$.getJSON("devices/getDevices.do",{},function(result){
		var lists=result.data;
		dS="<select id=\"deviceSelectIn\">";
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			dS=dS+"<option value=\""+list.devId+"\">"+list.devName+"("+list.devId+")"+"</option>";
		}
		dS=dS+"<option>";
	});
	str=str.replace("{deviceSelect}",dS);
	$("#mainDiv").append(str);
	
}
function saveOut(){
	var supplier="无";
	var flistTime=$("#dateInputIn").val();
	var pS=$("#pSInputIn").val();
	var devId=$("#deviceSelectIn").val();
	var count=$("#deviceNumInInput").val();
	var price=$("#devicePriceInInput").val();
	if(flistTime==""){
		alert("请填写日期");
	}else if(pS==""){
		alert("请填写备注");
	}else if(count==""){
		alert("请填写数量");
	}else if(price==""){
		alert("请填写单价");
	}else{
		var url="devices/addDevicesOut.do";
		var data={"devId":devId,"price":price,"count":count,"pS":pS,"flistTime":flistTime,"supplier":supplier};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				alert('保存成功');
				window.location.reload();
			}
		});
	}
}

function loadStore(){
	$("#mainDiv").empty();
	var str="<table>"+
			"<tr>"+
			"<td width=\"20%\">设备编号</td>"+
			"<td width=\"20%\">设备名称</td>"+
			"<td width=\"20%\">数量</td>"+
			"<td width=\"20%\">单价</td>"+
			"<td width=\"20%\">金额</td>"+
			"</tr>";
	$.ajaxSetup({async:false});
	var dS;
	$.getJSON("devices/getAllDevStore.do",{},function(result){
		var lists=result.data;
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			str=str+"<tr><td width=\"20%\">"+list.devId+"</td><td width=\"20%\">"+list.devName+"</td><td width=\"20%\">"+list.count+"</td><td width=\"20%\">"+list.price+"</td><td width=\"20%\">"+list.count*list.price+"</td></tr>";
		}
	});
	str=str+"</table>";
	$("#mainDiv").append(str);
	
}

function loadList(){
	$("#mainDiv").empty();
	var str="<table id=\"flistTable\">"+
			"<tr>"+
			"<td width=\"11%\">设备编号</td>"+
			"<td width=\"11%\">设备名称</td>"+
			"<td width=\"11%\">数量</td>"+
			"<td width=\"11%\">单价</td>"+
			"<td width=\"11%\">金额</td>"+
			"<td width=\"11%\">出/入库</td>"+
			"<td width=\"11%\">备注</td>"+
			"<td width=\"11%\">时间</td>"+
			"<td width=\"11%\">供应商</td>"+
			"</tr>";
	$.ajaxSetup({async:false});
	var dS;
	$.getJSON("devices/getAllDevFlist.do",{},function(result){
		var lists=result.data;
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			var io;
			if(list.inOrOut==1){
				io="入库";
			}else{
				io="出库";
			}
			str=str+"<tr>"+
			"<td width=\"11%\">"+list.devId+"</td>"+
			"<td width=\"11%\">"+list.flistName+"</td>"+
			"<td width=\"11%\">"+list.count+"</td>"+
			"<td width=\"11%\">"+list.price+"</td>"+
			"<td width=\"11%\">"+list.count*list.price+"</td>"+
			"<td width=\"11%\">"+io+"</td>"+
			"<td width=\"11%\">"+list.pS+"</td>"+
			"<td width=\"11%\">"+list.flistTime+"</td>"+
			"<td width=\"11%\">"+list.supplier+"</td>"+
			"</tr>";
		}
	});
	str=str+"</table>";
	$("#mainDiv").append(str);
	
}
</script>
</html>
