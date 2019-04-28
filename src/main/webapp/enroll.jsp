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
<title>报名</title>
<style type="text/css">
#chooseFileSpan{
	border:solid 1px;
}
table{
	width:100%;
	border-collapse: collapse;
	text-align: center;
}
th{
	border:solid;
}
td{
	border:solid 1px;
}
#tableTitle{
	font-size:26px;
	display: block;
	margin:60px;
}
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
</style>
</head>
<body>
<div class="navDiv">
		</a> <span id="navTitle">报名管理页面</span>
	</div>
<h1>学生报名(请上传EXCEL报名表)</h1>
<span>已选择文件:</span>
<span id="chooseFileSpan"></span>
	<div id="addStu_mid">
		<input
			type="button"
			name="file_copy"
			id="file_copy"
			value="upload"
		/> <input
			type="button"
			name="download"
			id="download"
			value="submit"
		/>
	</div>

	<div
		id="hidden_file_div"
		style="display: none"
	>
		<form
			id="form_excel"
			name="form_excel"
			action="user/uploadExcel.do"
			method="post"
			enctype="multipart/form-data"
		>
			<input
				type="file"
				id="file_excel"
				name="file_excel"
			/> <input type="submit" />
		</form>
		<input
			type="text"
			name="filename"
			id="filename"
		/>
	</div>
	<span id="tableTitle">报名信息统计表</span>
	<table id="enrollTable">
		<tr>
			<th>报名号</th>
			<th>学员姓名</th>
			<th>身份证号</th>
			<th>考试科目</th>
			<th>考试时间</th>
		</tr>
	</table>
</body>
<script
	type="text/javascript"
	src="js/jquery-3.3.1.min.js"
></script>
<script type="text/javascript">
	$(function() {
		$('#file_copy').click(function() {
			$('#file_excel').click();
		})
		$("#file_excel").bind("change", function() {
			$("#filename").attr("value", $("#file_excel").val());
			$("#chooseFileSpan").html( $("#file_excel").val());
		});
		//点击提交
		$('#download').click(function() {
			$("#form_excel").submit();
		})
		loadEnroll();
	});
function loadEnroll(){
	var url="user/getAllEnroll.do";
	$.getJSON(url,{},function(result){
		var lists=result.data;
		for(var i=0;i<lists.length;i++){
			var list=lists[i];
			var str="<tr>"+
					"<td>"+list.enId+"</td>"+
					"<td>"+list.enName+"</td>"+
					"<td>"+list.enIcard+"</td>"+
					"<td>"+list.enSub+"</td>"+
					"<td>"+list.enDate+"</td>"+
					"</tr>";
			$("#enrollTable").append(str);
		}
	});
}
</script>
</html>
