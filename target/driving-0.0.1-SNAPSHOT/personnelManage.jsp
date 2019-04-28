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
<title>人事管理</title>
<link
	href="css/personnelManage.css"
	type="text/css"
	rel="stylesheet"
/>
</head>
<body>
	<p>&nbsp;</p>
	<div class="navDiv">
		<a
			id="navALab"
			href="index.jsp"
		> <img
			alt="主页"
			src="image/homePageIcon.png"
			id="homePageImg"
		>
		</a> <span id="navTitle">人事管理页面</span>
	</div>
	<div class="searchDiv">
		<div class="searchDiv2">
			<input
				type="text"
				id="searchInput"
				placeholder="请输入教练编号"
			> <a
				id="searchALab"
				onclick="searchForCoach()"
			> <img
				alt="搜索"
				src="image/search.png"
				id="searchImage"
			>
			</a>
		</div>
	</div>
	<div class="coachListDiv">
		<div class="coachListDiv2" id="coachListDiv2">
			<span class="coachListSpan">搜索结果</span>
			<table id="coachListTable">
				<tr>
					<td width="25%" colspan="2">教练</td>
					<td width="25%" colspan="2" id="coachTd"></td>
					<td width="25%" colspan="2">学员人数</td>
					<td width="25%" colspan="2" id="learnerNumTd"></td>
				</tr>
				<tr>
					<td width="25%" colspan="2">分配的车辆</td>
					<td width="25%" colspan="2" id="carsTd"></td>
					<td width="25%" colspan="2">场地</td>
					<td width="25%" colspan="2" id="fieldsTd"></td>
				</tr>
				<tr>
				<td colspan="8">&nbsp;</td>
				</tr>
				<tr>
					<th>编号</th>
					<th>学员姓名</th>
					<th>年龄</th>
					<th>申领车型</th>
					<th>科目</th>
					<th>联系电话</th>
					<th>操作</th>
				</tr>
			</table>
		</div>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#coachListDiv2").hide();
		$("#searchInput").focus(function() {
			$("#searchInput").val("");
		});
	});
	function searchForCoach() {
		var content = $("#searchInput").val();
		var url = "user/getCoachById.do";
		var data = {
			"coachId" : content
		};
		var data1;
		$.getJSON(url,data,function(result) {
				data1 = result.data;
				if(data1==null){
						alert(result.message);
				}else{
					$("#coachListDiv2").show();
					$("#coachListDiv2").empty();
					var str="<table id=\"coachListTable\">"+
								"<tr>"+
									"<td width=\"25%\" colspan=\"2\">教练</td>"+
									"<td width=\"25%\" colspan=\"2\" id=\"coachTd\"></td>"+
									"<td width=\"25%\" colspan=\"2\">学员人数</td>"+
									"<td width=\"25%\" colspan=\"2\" id=\"learnerNumTd\"></td>"+
								"</tr>"+
								"<tr>"+
									"<td width=\"25%\" colspan=\"2\">分配的车辆</td>"+
									"<td width=\"25%\" colspan=\"2\" id=\"carsTd\"></td>"+
									"<td width=\"25%\" colspan=\"2\">场地</td>"+
									"<td width=\"25%\" colspan=\"2\" id=\"fieldsTd\"></td>"+
								"</tr>"+
								"<tr>"+
								"<td colspan=\"8\">&nbsp;</td>"+
								"</tr>"+
								"<tr>"+
									"<th>编号</th>"+
									"<th>学员姓名</th>"+
									"<th>年龄</th>"+
									"<th>申领车型</th>"+
									"<th>科目</th>"+
									"<th>联系电话</th>"+
									"<th>操作</th>"+
								"</tr>"+
							"</table>";
							$("#coachListDiv2").append(str);
					$("#coachTd").html(data1.coachId+"("+data1.coachName+")");
					var str;
					url="cars/getCarReservationById.do"
					$.getJSON(url,data,function(result){
						var lists=result.data;
						if(result.state==0){
							str="<tr><td colspan=\"8\">"+result.message+"</td></tr>";
							$("#learnerNumTd").html("0");
							$("#carsTd").html("无车辆");
							$("#fieldsTd").html("无场地");
						}else{
							$("#learnerNumTd").html(lists.length);
							var fields="";
							for(var ii=0;ii<lists.length;ii++){
								var list=lists[ii];
								var learnerName;
								var claimType;
								var learnerAge;
								$.ajaxSetup({async:false});
								$.getJSON("user/getLearnerById.do",{"learnerId":list.learnerId},function(result){
									learnerName=result.data.learnerName;
									console.log(result.data.learnerName);
									claimType=result.data.claimType;
									learnerAge=result.data.learnerAge;
								});
								str="<tr>"+
								"<td>"+list.learnerId+"</td>"+
								"<td>"+learnerName+"</td>"+
								"<td>"+learnerAge+"</td>"+
								"<td>"+claimType+"</td>"+
								"<td>"+list.reserSub+"</td>"+
								"<td>"+list.reserContact+"</td>"+
								"<td colspan=\"2\"><input type=\"button\" value=\"删除\" onclick=\"deleteCarReser("+list.reserId+")\"></td>"+
								"</tr>";
								console.log(str);
								fields=fields+" "+list.reserField;
								$("#coachListTable").append(str);
							}
							$("#fieldsTd").html(fields);
						}
						if(lists.length<=5){
							var str="<input type=\"button\" id=\"addNewCarReserButton\" onclick=\"addNewCarReser()\" value=\"添加\">";
							$("#coachListTable").after(str);
						}
					});
				}
							
		});
	}
function deleteCarReser(reserId){
	var mess=confirm("确定要删除吗?");
	if(mess==true){
		var url="cars/deleteCarReser.do";
		var data={"reserId":reserId};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				alert("删除成功");
				window.location.reload();
			}
		});
	}	
}
function addNewCarReser(){
	window.location.href="addCarReser.jsp";
}
</script>
</html>
