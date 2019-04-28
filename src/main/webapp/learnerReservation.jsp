<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约</title>
<link href="css/learnerReser.css" type="text/css" rel="stylesheet">
<link href="css/table_jui.css" type="text/css" rel="stylesheet">
</head>
<body>
<p>&nbsp;</p>
	<div class="navDiv">
		 <span id="navTitle">约车统计</span>
	</div>
	<table id="learnerReserTable"  style="width: 100%; margin-bottom:8px; " class="dataTables_wrapper table"	>
		<thead style="font-size: 15px; font-weight: 800; background-color: #E7E5DA;">
			<tr>
				<td width="10%">学员编号</td>
				<td width="10%">姓名</td>
				<td width="10%">场地</td>
				<td width="10%">分配的教练</td>
				<td width="10%">时间</td>
				<td width="10%">考试科目</td>
				<td width="10%">联系电话</td>
				<td width="10%">Email</td>
				<td width="10%">审核结果</td>
			</tr>
		</thead>
		<tbody id="learnerReserTableBody" style="table-layout: fixed; word-wrap: break-word;">
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>                
             </tr>
        </tbody>
	</table>
	<input type="button" value="添加约车" onclick="addCarReser()" style="margin-top:80px;">
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(function(){
	loadCarReser();
});

function tableui() {
	var $table = $('#learnerReserTable');  
    var currentPage = 0;//当前页默认值为0  
    var pageSize = 3;//每一页显示的数目  
    $table.bind('paging',function(){  
        $table.find('tbody tr').hide().slice(currentPage*pageSize,(currentPage+1)*pageSize).show();  
    });       
    var sumRows = $table.find('tbody tr').length;  
    var sumPages = Math.ceil(sumRows/pageSize);//总页数  
      
    var $pager = $('<div class="page"></div>');  //新建div，放入a标签,显示底部分页码  
    for(var pageIndex = 0 ; pageIndex<sumPages ; pageIndex++){  
        $('<a href="#" id="pageStyle" onclick="changCss(this)"><span>'+(pageIndex+1)+'</span></a>').bind("click",{"newPage":pageIndex},function(event){  
            currentPage = event.data["newPage"];  
            $table.trigger("paging");  
              //触发分页函数  
            }).appendTo($pager);  
            $pager.append(" ");  
        }     
        $pager.insertAfter($table);  
        $table.trigger("paging");  
          
        //默认第一页的a标签效果  
        var $pagess = $('#pageStyle');  
        $pagess[0].style.backgroundColor="#006B00";  
        $pagess[0].style.color="#ffffff";  
} 
//a链接点击变色，再点其他回复原色  
function changCss(obj){  
   var arr = document.getElementsByTagName("a");  
   for(var i=0;i<arr.length;i++){     
    if(obj==arr[i]){       //当前页样式  
     obj.style.backgroundColor="#006B00";  
     obj.style.color="#ffffff";  
   }  
    else  
    {  
      arr[i].style.color="";  
      arr[i].style.backgroundColor="";  
    }  
   }  
}
function loadCarReser(){
	var url="cars/getCarReservation.do";
	$("#learnerReserTableBody").empty;
	$.getJSON(url,{},function(result){
		lists=result.data;
		for(var i=0;i<lists.length;i++){
			list=lists[i];
			var str="<tr class=\"carReserTr\">"+
					"<td id=\"learnerIdTd"+list.reserId+"\">"+list.learnerId+"</td>"+
					"<td id=\"learnerNameTd"+list.reserId+"\">"+list.learnerName+"</td>"+
					"<td>"+list.reserField+"</td>"+
					"<td>"+list.coachName+"</td>"+
					"<td>"+list.reserDate+"</td>"+
					"<td>"+list.reserSub+"</td>"+
					"<td>"+list.reserContact+"</td>"+
					"<td id=\"learnerEmailTd"+list.reserId+"\">"+list.reserEmail+"</td>"+
					"<td>{isChecked}</td>"+
					"</tr>";
			var isC;
			if(list.isChecked==0){
				isC="<input type=\"button\" onclick=\"checkReser("+list.reserId+")\" style=\"background-color:red;width:100%;\" value=\"未审核\">";
			}else{
				isC="<input type=\"button\" style=\"background-color:green;width:100%;\" value=\"已审核\">";
			}
			str=str.replace("{isChecked}",isC);
			$("#learnerReserTableBody").append(str);
		}
			tableui();
	});
}
function checkReser(reserId){
	var url="cars/checkReser.do";
	var data={"reserId":reserId};
	$.getJSON(url,data,function(result){
		if(result.state==0){
			alert(result.message);
		}else{
			var url1 = "mail2.jsp";
			var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
			form.append('<input type="hidden" name="learnerId" value="'+$("#learnerIdTd"+reserId).text()+'"></input>');
			form.append('<input type="hidden" name="learnerName" value="'+$("#learnerNameTd"+reserId).text()+'"></input>');
			form.append('<input type="hidden" name="learnerEmail" value="'+$("#learnerEmailTd"+reserId).text()+'"></input>');
			$(document.body).append(form);
			console.log(form);
			form.submit();
		}
	});
}
function addCarReser(){
	window.location.href="addCarReser.jsp";
}
</script>
</html>
