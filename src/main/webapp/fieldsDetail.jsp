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
	href="css/fieldDetail.css"
	type="text/css"
	rel="stylesheet"
/>
</head>
<body>
<%!String which;%>
<%
	which = request.getParameter("which");
	out.println("<h1 id=\"detailH1\">科目{kemu}场地情况</h1>");
	out.println("<table id=\"detailTable\"></table>");
%>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var jsWhich =
<%=which%>
	;
		console.log(jsWhich);
		createTable(jsWhich);
	});
	function createTable(jsWhich) {
		var whichList = [ "一", "二", "三", "四" ];
		$("#detailH1")
				.html(
						$("#detailH1").text().replace('{kemu}',
								whichList[jsWhich - 1]));
		var str;
		if (jsWhich == "3") {
			str = "<tr class=\"detailTableTr\"><th class=\"detailTableTd\">编号</th><th class=\"detailTableTd\">路段</th><th class=\"detailTableTd\">教练编号</th><th class=\"detailTableTd\">开始时间</th><th class=\"detailTableTd\">结束时间</th><th class=\"detailTableTd\">操作</th></tr>";
		} else {
			str = "<tr class=\"detailTableTr\"><th class=\"detailTableTd\">编号</th><th class=\"detailTableTd\">使用情况</th><th class=\"detailTableTd\">教练编号</th><th class=\"detailTableTd\">开始时间</th><th class=\"detailTableTd\">结束时间</th><th class=\"detailTableTd\">操作</th></tr>";
		}
		$("#detailTable").append(str);
		var url = "fields/getFieldDetail.do";
		var tableHeight;
		if (jsWhich == "1") {
			
			
			$.getJSON(url,{"whichField":jsWhich},function(result){
				var lists=result.data;
				tableHeight=lists.length;
				for(var i=0;i<lists.length;i++){
					var list=lists[i];
					str = "<tr class=\"detailTableTr\"><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\" id=\"fieldId"+i+"\" value=\"{fieldId}\"/></td><td class=\"detailTableTd\"><input type=\"checkBox\" disabled=\"disabled\"  {ifChecked} id=\"fieldSection"+i+"\" value=\"{fieldStatus}\">正在使用</td><td class=\"detailTableTd\" id=\"coachIdTd"+i+"\"><input type=\"hidden\"  id=\"coachId"+i+"\" value=\"{coachId}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"startTime"+i+"\" value=\"{startTime}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"finishTime"+i+"\" value=\"{finishTime}\"/></td><td class=\"detailTableTd\"><input type=\"button\" value=\"修改\" id=\"changeButton"+i+"\" onclick=\"clickChangeButton1("+i+")\"/><input type=\"button\" value=\"保存\" id=\"saveButton"+i+"\" onclick=\"clickSaveButton1("+i+")\" disabled=\"disabled\"/></td></tr>";
					if(list.fieldStatus==1)
						str=str.replace("{ifChecked}","checked=\"checked\"");
					str=str.replace("{fieldId}",list.fieldId).replace("{fieldStatus}",list.fieldStatus).replace("{coachId}",list.coachId).replace("{startTime}",list.startTime).replace("{finishTime}",list.finishTime);
					$("#detailTable").append(str);
				}
				$.getJSON("user/getCoaches.do",{},function(result){
					lists=result.data;
					for(var i=0;i<tableHeight;i++){
						var str="<select id=\"coachIdSelect"+i+"\" disabled=\"disabled\">";
						str=str+"<option value=\"0\">"+"无"+"</option>";
						for(var j=0;j<lists.length;j++){
							var list=lists[j];
							if(list.coachId==$("#coachId"+i).val()){
								str=str+"<option value=\""+list.coachId+"\" selected=\"selected\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}else{
								str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}
						}
						str=str+"</select>";
						$("#coachIdTd"+i).append(str);
					}
				});
			});
			
			
		} else if (jsWhich == "2") {
			
			
			$.getJSON(url,{"whichField":jsWhich},function(result){
				var lists=result.data;
				tableHeight=lists.length;
				for(var i=0;i<lists.length;i++){
					var list=lists[i];
					str = "<tr class=\"detailTableTr\"><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\" id=\"fieldId"+i+"\" value=\"{fieldId}\"/></td><td class=\"detailTableTd\"><input type=\"checkBox\" disabled=\"disabled\"  {ifChecked} id=\"fieldSection"+i+"\" value=\"{fieldStatus}\">正在使用</td><td class=\"detailTableTd\" id=\"coachIdTd"+i+"\"><input type=\"hidden\"  id=\"coachId"+i+"\" value=\"{coachId}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"startTime"+i+"\" value=\"{startTime}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"finishTime"+i+"\" value=\"{finishTime}\"/></td><td class=\"detailTableTd\"><input type=\"button\" value=\"修改\" id=\"changeButton"+i+"\" onclick=\"clickChangeButton2("+i+")\"/><input type=\"button\" value=\"保存\" id=\"saveButton"+i+"\" onclick=\"clickSaveButton2("+i+")\" disabled=\"disabled\"/></td></tr>";
					if(list.fieldStatus==1)
						str=str.replace("{ifChecked}","checked=\"checked\"");
					str=str.replace("{fieldId}",list.fieldId).replace("{fieldStatus}",list.fieldStatus).replace("{coachId}",list.coachId).replace("{startTime}",list.startTime).replace("{finishTime}",list.finishTime);
					$("#detailTable").append(str);
				}
				$.getJSON("user/getCoaches.do",{},function(result){
					lists=result.data;
					for(var i=0;i<tableHeight;i++){
						var str="<select id=\"coachIdSelect"+i+"\" disabled=\"disabled\">";
						str=str+"<option value=\"0\">"+"无"+"</option>";
						for(var j=0;j<lists.length;j++){
							var list=lists[j];
							if(list.coachId==$("#coachId"+i).val()){
								str=str+"<option value=\""+list.coachId+"\" selected=\"selected\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}else{
								str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}
						}
						str=str+"</select>";
						$("#coachIdTd"+i).append(str);
					}
				});
			});
			
			
		} else if (jsWhich == "3") {

			
			
			$.getJSON(url,{"whichField":jsWhich},function(result){
				var lists=result.data;
				tableHeight=lists.length;
				for(var i=0;i<lists.length;i++){
					var list=lists[i];
					str = "<tr class=\"detailTableTr\"><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\" id=\"fieldId"+i+"\" value=\"{fieldId}\"/></td><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\"  id=\"fieldSection"+i+"\" value=\"{fieldStatus}\"/></td><td class=\"detailTableTd\" id=\"coachIdTd"+i+"\"><input type=\"hidden\"  id=\"coachId"+i+"\" value=\"{coachId}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"startTime"+i+"\" value=\"{startTime}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"finishTime"+i+"\" value=\"{finishTime}\"/></td><td class=\"detailTableTd\"><input type=\"button\" value=\"修改\" id=\"changeButton"+i+"\" onclick=\"clickChangeButton3("+i+")\"/><input type=\"button\" value=\"保存\" id=\"saveButton"+i+"\" onclick=\"clickSaveButton3("+i+")\" disabled=\"disabled\"/><input type=\"button\" value=\"删除\" id=\"deleteButton"+i+"\" onclick=\"clickDeleteButton3("+i+")\"/></td></tr>";
					str=str.replace("{fieldId}",list.fieldId).replace("{fieldStatus}",list.fieldSection).replace("{coachId}",list.coachId).replace("{startTime}",list.startTime).replace("{finishTime}",list.finishTime);
					$("#detailTable").append(str);
				}
				$.getJSON("user/getCoaches.do",{},function(result){
					lists=result.data;
					for(var i=0;i<tableHeight;i++){
						var str="<select id=\"coachIdSelect"+i+"\" disabled=\"disabled\">";
						str=str+"<option value=\"0\">"+"无"+"</option>";
						for(var j=0;j<lists.length;j++){
							var list=lists[j];
							if(list.coachId==$("#coachId"+i).val()){
								str=str+"<option value=\""+list.coachId+"\" selected=\"selected\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}else{
								str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}
						}
						str=str+"</select>";
						$("#coachIdTd"+i).append(str);
					}
						$("#detailTable").after("<input type=\"button\" id=\"addButtonOnly\" value=\"添加数据\" name="+tableHeight+" onclick=\"addNewRow("+tableHeight+")\"/>");
						console.log($("#addButtonOnly").attr("name"));
				});
			});
			
			
		} else {

			
			
			$.getJSON(url,{"whichField":jsWhich},function(result){
				var lists=result.data;
				tableHeight=lists.length;
				for(var i=0;i<lists.length;i++){
					var list=lists[i];
					str = "<tr class=\"detailTableTr\"><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\" id=\"fieldId"+i+"\" value=\"{fieldId}\"/></td><td class=\"detailTableTd\"><input type=\"checkBox\" disabled=\"disabled\"  {ifChecked} id=\"fieldSection"+i+"\" value=\"{fieldStatus}\">正在使用</td><td class=\"detailTableTd\" id=\"coachIdTd"+i+"\"><input type=\"hidden\"  id=\"coachId"+i+"\" value=\"{coachId}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"startTime"+i+"\" value=\"{startTime}\"/></td><td class=\"detailTableTd\"><input type=\"date\" disabled=\"disabled\"  id=\"finishTime"+i+"\" value=\"{finishTime}\"/></td><td class=\"detailTableTd\"><input type=\"button\" value=\"修改\" id=\"changeButton"+i+"\" onclick=\"clickChangeButton4("+i+")\"/><input type=\"button\" value=\"保存\" id=\"saveButton"+i+"\" onclick=\"clickSaveButton4("+i+")\" disabled=\"disabled\"/></td></tr>";
					if(list.fieldStatus==1)
						str=str.replace("{ifChecked}","checked=\"checked\"");
					str=str.replace("{fieldId}",list.fieldId).replace("{fieldStatus}",list.fieldStatus).replace("{coachId}",list.coachId).replace("{startTime}",list.startTime).replace("{finishTime}",list.finishTime);
					$("#detailTable").append(str);
				}
				$.getJSON("user/getCoaches.do",{},function(result){
					lists=result.data;
					for(var i=0;i<tableHeight;i++){
						var str="<select id=\"coachIdSelect"+i+"\" disabled=\"disabled\">";
						str=str+"<option value=\"0\">"+"无"+"</option>";
						for(var j=0;j<lists.length;j++){
							var list=lists[j];
							if(list.coachId==$("#coachId"+i).val()){
								str=str+"<option value=\""+list.coachId+"\" selected=\"selected\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}else{
								str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
							}
						}
						str=str+"</select>";
						$("#coachIdTd"+i).append(str);
					}
				});
			});
			
			
		}
	}
	function clickChangeButton1(i){
		$("#fieldSection"+i).attr("disabled",false);
		$("#coachIdSelect"+i).attr("disabled",false);
		$("#finishTime"+i).attr("disabled",false);
		$("#startTime"+i).attr("disabled",false);
		$("#saveButton"+i).attr("disabled",false);
		$("#changeButton"+i).attr("disabled",true);
	}
	function clickSaveButton1(i){
		var fieldId=$("#fieldId"+i).val();
		var fieldSection;
		var coachId=$("#coachIdSelect"+i).val();
		var startTime=$("#startTime"+i).val();
		var finishTime=$("#finishTime"+i).val();
		var ruleDate=/^\d{4}-\d{2}-\d{2}$/;
		if(!ruleDate.test(startTime)||!ruleDate.test(finishTime)){
			alert('日期格式非法');
		}else{
			if($("#fieldSection"+i).prop('checked')){
				fieldSection=1;
			}else{
				fieldSection=0;
			}
			var data={"fieldId":fieldId,"fieldStatus":fieldSection,"coachId":coachId,"startTime":startTime,"finishTime":finishTime};
			var url="fields/changeField1.do";
			$.getJSON(url,data,function(result){
				if(result.state==1){
					alert("保存成功");
					$("#fieldSection"+i).attr("disabled",true);
					$("#coachIdSelect"+i).attr("disabled",true);
					$("#finishTime"+i).attr("disabled",true);
					$("#startTime"+i).attr("disabled",true);
					$("#saveButton"+i).attr("disabled",true);
					$("#changeButton"+i).attr("disabled",false);
				}else{
					alert(result.message);
				}
			});
		}
	}
	function clickChangeButton2(i){
		$("#fieldSection"+i).attr("disabled",false);
		$("#coachIdSelect"+i).attr("disabled",false);
		$("#finishTime"+i).attr("disabled",false);
		$("#startTime"+i).attr("disabled",false);
		$("#saveButton"+i).attr("disabled",false);
		$("#changeButton"+i).attr("disabled",true);
	}
	function clickSaveButton2(i){
		var fieldId=$("#fieldId"+i).val();
		var fieldSection;
		var coachId=$("#coachIdSelect"+i).val();
		var startTime=$("#startTime"+i).val();
		var finishTime=$("#finishTime"+i).val();
		var ruleDate=/^\d{4}-\d{2}-\d{2}$/;
		if(!ruleDate.test(startTime)||!ruleDate.test(finishTime)){
			alert('日期格式非法');
		}else{
			if($("#fieldSection"+i).prop('checked')){
				fieldSection=1;
			}else{
				fieldSection=0;
			}
			var data={"fieldId":fieldId,"fieldStatus":fieldSection,"coachId":coachId,"startTime":startTime,"finishTime":finishTime};
			var url="fields/changeField2.do";
			$.getJSON(url,data,function(result){
				if(result.state==1){
					alert("保存成功");
					$("#fieldSection"+i).attr("disabled",true);
					$("#coachIdSelect"+i).attr("disabled",true);
					$("#finishTime"+i).attr("disabled",true);
					$("#startTime"+i).attr("disabled",true);
					$("#saveButton"+i).attr("disabled",true);
					$("#changeButton"+i).attr("disabled",false);
				}else{
					alert(result.message);
				}
			});
		}
	}
	function clickChangeButton3(i){
		$("#fieldSection"+i).attr("disabled",false);
		$("#coachIdSelect"+i).attr("disabled",false);
		$("#finishTime"+i).attr("disabled",false);
		$("#startTime"+i).attr("disabled",false);
		$("#saveButton"+i).attr("disabled",false);
		$("#changeButton"+i).attr("disabled",true);
	}
	function clickSaveButton3(i){
		var fieldId=$("#fieldId"+i).val();
		var fieldSection=$("#fieldSection"+i).val();
		var coachId=$("#coachIdSelect"+i).val();
		var startTime=$("#startTime"+i).val();
		var finishTime=$("#finishTime"+i).val();
		var ruleDate=/^\d{4}-\d{2}-\d{2}$/;
		if(!ruleDate.test(startTime)||!ruleDate.test(finishTime)){
			alert('日期格式非法');
		}else{
			var data={"fieldId":fieldId,"fieldStatus":fieldSection,"coachId":coachId,"startTime":startTime,"finishTime":finishTime};
			var url="fields/changeField3.do";
			$.getJSON(url,data,function(result){
				if(result.state==1){
					alert("保存成功");
					$("#fieldSection"+i).attr("disabled",true);
					$("#coachIdSelect"+i).attr("disabled",true);
					$("#finishTime"+i).attr("disabled",true);
					$("#startTime"+i).attr("disabled",true);
					$("#saveButton"+i).attr("disabled",true);
					$("#changeButton"+i).attr("disabled",false);
				}else{
					alert(result.message);
				}
			});
		}
	}
	function clickChangeButton4(i){
		$("#fieldSection"+i).attr("disabled",false);
		$("#coachIdSelect"+i).attr("disabled",false);
		$("#finishTime"+i).attr("disabled",false);
		$("#startTime"+i).attr("disabled",false);
		$("#saveButton"+i).attr("disabled",false);
		$("#changeButton"+i).attr("disabled",true);
	}
	function clickSaveButton4(i){
		var fieldId=$("#fieldId"+i).val();
		var fieldSection;
		var coachId=$("#coachIdSelect"+i).val();
		var startTime=$("#startTime"+i).val();
		var finishTime=$("#finishTime"+i).val();
		var ruleDate=/^\d{4}-\d{2}-\d{2}$/;
		if(!ruleDate.test(startTime)||!ruleDate.test(finishTime)){
			alert('日期格式非法');
		}else{
			if($("#fieldSection"+i).prop('checked')){
				fieldSection=1;
			}else{
				fieldSection=0;
			}
			var data={"fieldId":fieldId,"fieldStatus":fieldSection,"coachId":coachId,"startTime":startTime,"finishTime":finishTime};
			var url="fields/changeField4.do";
			$.getJSON(url,data,function(result){
				if(result.state==1){
					alert("保存成功");
					$("#fieldSection"+i).attr("disabled",true);
					$("#coachIdSelect"+i).attr("disabled",true);
					$("#finishTime"+i).attr("disabled",true);
					$("#startTime"+i).attr("disabled",true);
					$("#saveButton"+i).attr("disabled",true);
					$("#changeButton"+i).attr("disabled",false);
				}else{
					alert(result.message);
				}
			});
		}
	}
	function addNewRow(tableHeight){
		str = "<tr class=\"detailTableTr\"><td class=\"detailTableTd\"><input type=\"text\" disabled=\"disabled\" value=\"自动\" id=\"fieldId"+tableHeight+"\"/></td><td class=\"detailTableTd\"><input type=\"text\"  id=\"fieldSection"+tableHeight+"\"/></td><td class=\"detailTableTd\" id=\"coachIdTd"+tableHeight+"\"></td><td class=\"detailTableTd\"><input type=\"date\"  id=\"startTime"+tableHeight+"\" value=\"2000-01-01\"/></td><td class=\"detailTableTd\"><input type=\"date\"  id=\"finishTime"+tableHeight+"\" value=\"2000-12-31\"/></td><td class=\"detailTableTd\"><input type=\"button\" value=\"保存\" id=\"addSaveButton"+tableHeight+"\" onclick=\"clickAddSaveButton("+tableHeight+")\"/></td></tr>";
		$("#detailTable").append(str);
		$.getJSON("user/getCoaches.do",{},function(result){
				lists=result.data;
				var str="<select id=\"coachIdSelect"+tableHeight+"\">";
				str=str+"<option value=\"0\">"+"无"+"</option>";
				for(var j=0;j<lists.length;j++){
					var list=lists[j];
					str=str+"<option value=\""+list.coachId+"\">"+list.coachName+"("+list.coachId+")"+"</option>";
				}
				str=str+"</select>";
				$("#coachIdTd"+tableHeight).append(str);
		});
		$("#addButtonOnly").attr("disabled","disabled");
	}
	function clickAddSaveButton(tableHeight){
		var fieldSection=$("#fieldSection"+tableHeight).val();
		var coachId=$("#coachIdSelect"+tableHeight).val();
		var startTime=$("#startTime"+tableHeight).val();
		var finishTime=$("#finishTime"+tableHeight).val();
		var ruleDate=/^\d{4}-\d{2}-\d{2}$/;
		if(!ruleDate.test(startTime)||!ruleDate.test(finishTime)){
			alert('日期格式非法');
		}else if(coachId==0){
			alert('请选择教练');
		}else if(fieldSection.length==0){
			alert('请认真填写路段');
		}else{
			var url="fields/addField3.do";
			console.log(fieldSection);
			var data={"fieldStatus":fieldSection,"coachId":coachId,"startTime":startTime,"finishTime":finishTime};
			$.getJSON(url,data,function(result){
				if(result.state==1){
					alert('保存成功');
					window.location.reload();
				}else{
					alert('保存失败');
				}
			});
		}
	}
	function clickDeleteButton3(i){
		var flag=confirm("确认要删除吗?");
		if(flag==true){
			var fieldId=$("#fieldId"+i).val();
			var url="fields/deleteField3.do";
			$.getJSON(url,{"fieldId":fieldId},function(result){
				if(result.state==1){
					alert("删除成功");
					window.location.reload();
				}
			});
			console.log("delete"+i);
		}
	}
</script>
</html>