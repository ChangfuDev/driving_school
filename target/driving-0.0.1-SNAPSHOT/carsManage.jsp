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
	href="css/carsManage.css"
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
		</a> <span id="navTitle">车辆管理页面</span>
	</div>
	<div class="searchDiv">
		<div class="searchDiv2">
			<input
				type="text"
				id="searchInput"
				placeholder="请输入搜索内容(支持模糊查询)"
			> <a
				id="searchALab"
				onclick="searchForCars()"
			> <img
				alt="搜索"
				src="image/search.png"
				id="searchImage"
			>
			</a>
		</div>
	</div>
	<div class="carsListDiv">
		<div class="carsListDiv2">
			<span class="carsListSpan">搜索结果</span>
			<ul
				class="carsListUl"
				id="carsListUl"
			>
				<li class="carsListLi"><span class="carsListLiSpan">车辆编号:1;车辆型号:法拉利;开始使用时间:2018-01-02</span>
				</li>
			</ul>
		</div>
	</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#carsListUl").empty();
		$("#searchInput").focus(function() {
			$("#searchInput").val("");
		});
	});
	function searchForCars() {
		$("#carsListUl").empty();
		var content = $("#searchInput").val();
		var url = "cars/searchCars.do";
		var data = {
			"content" : content
		};
		$.post(
			url,
			data,
			function(result) {
				var lists = result.data;
				if(lists==null){
						alert(result.message);
				}else{
					for (var i = 0; i < lists.length; i++) {
						var list = lists[i];
						var str = "<li class=\"carsListLi\" id=\"carsListLi"
								+ i
								+ "\" onclick=\"turnToCarMess("
								+ list.carId
								+ ")\"> <span class=\"carsListLiSpan\">车辆编号:{carId}; 车辆型号:{carType}; 开始使用时间:{startTime}</span></li>";
						str = str.replace('{carId}', list.carId)
								.replace('{carType}', list.carType)
								.replace('{startTime}', list.startTime);
						$("#carsListUl").append(str);
					}
				}
							
		});
	}
	function turnToCarMess(carId) {
		var url1 = "carDetail.jsp";
		var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
		form
				.append('<input type="hidden" name="carId" value="'+carId+'"></input>');
		$(document.body).append(form);
		form.submit();
	}
</script>
</html>
