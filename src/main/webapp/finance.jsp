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
<link href="css/table_jui.css" type="text/css" rel="stylesheet">
<title>财务</title>
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
table{
	margin-top:50px;
	font-size:20px;
	border-collapse: collapse;
	text-align: center;
}
td{
	border:solid;
}
li{
	list-style: none;
}
</style>
</head>
<body>
	<p>&nbsp;</p>
	<div class="navDiv">
		</a> <span id="navTitle">财务管理</span>
	</div>
	<table id="financeTable"  style="width: 100%; margin-bottom:8px; " class="dataTables_wrapper table"	>
		<thead style="font-size: 15px; font-weight: 800; background-color: #E7E5DA;">
			<tr>
				<td width="10%">单号</td>
				<td width="10%">报销人</td>
				<td width="10%">费用类型</td>
				<td width="10%">金额</td>
				<td width="10%">说明</td>
				<td width="10%">日期</td>
				<td width="15%">操作</td>
			</tr>
		</thead>
		<tbody id="financeTableBody" style="table-layout: fixed; word-wrap: break-word;">
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
	<ul>
		<li><span>选择起始日期</span><input type="date" id="startDateInput"></li>
		<li><span>选择终止始日期</span><input type="date" id="endDateInput"></li>
		<li><input type="button" onclick="seeDetail()" value="查看"></li>
		<li><span id="incomeSpan"></span></li>
		<li><span id="outcomeSpan"></span></li>
		<li><span id="profitSpan"></span></li>
		<li><input type="button" id="chartShow" value="折线图显示" disabled="disabled"></li>
	</ul>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(function(){
	loadFinance();
});
function loadFinance(){
	var url="finance/getAllFinance.do";
	$.getJSON(url,{},function(result){
		$('#financeTableBody').empty();
        lists=result.data;
        for(var i=0;i<lists.length;i++){
        	var list=lists[i];
        	var finanType;
        	var finanAmount;
        	if(list.finanAmount>=0){
        		finanType="收入";
        		finanAmount=list.finanAmount;
        	}else{
        		finanType="支出";
        		finanAmount=-1*list.finanAmount;
        	}
        	var str="<tr>"+
        			"<td>"+list.finanId+"</td>"+
        			"<td>"+list.reimPerson+"</td>"+
        			"<td>"+finanType+"</td>"+
        			"<td>"+finanAmount+"</td>"+
        			"<td>"+list.finanDescri+"</td>"+
        			"<td>"+list.finanDate+"</td>"+
        			"<td><input type=\"button\" value=\"删除\" onclick=\"deleteFinance("+list.finanId+")\"></td>"+
        			"</tr>"
        			;
        	$('#financeTableBody').append(str);
        }
        
        var str="<tr>"+
		"<td>new</td>"+
		"<td><input id=\"reimPersonInput\" type=\"text\"></td>"+
		"<td><select id=\"finanTypeSelect\"><option value=\"1\">收入</option><option value=\"-1\">支出</option></select></td>"+
		"<td><input type=\"number\" id=\"finanAmountInput\"></td>"+
		"<td><input type=\"text\" id=\"finanDescriInput\"></td>"+
		"<td><input type=\"date\" id=\"finanDateInput\"></td>"+
		"<td><input type=\"button\" value=\"添加\" onclick=\"addFinance()\"></td>"+
		"</tr>"
		;
		$('#financeTableBody').append(str);
        
        tableui();
	});
}
function tableui() {
	var $table = $('#financeTable');  
    var currentPage = 0;//当前页默认值为0  
    var pageSize = 8;//每一页显示的数目  
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
function deleteFinance(finanId){
	var mess=confirm("确认要删除吗?");
	if(mess==true){
		var url="finance/deleteFinanceById.do";
		data={"finanId":finanId};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.reload();
			}
		});
	}
}
function addFinance(){
	var reimPerson=$("#reimPersonInput").val();
	var inOrOut=$("#finanTypeSelect").val();
	var finanAmount=$("#finanAmountInput").val();
	var finanDescri=$("#finanDescriInput").val();
	var finanDate=$("#finanDateInput").val();
	finanAmount=inOrOut*finanAmount;
	if(reimPerson==""){
		alert('请填写报销人姓名');
	}else if(finanAmount==""){
		alert('请填写金额');
	}else if(finanDate==""){
		alert("请选择日期");
	}else if(finanDescri==""){
		alert("请填写财务用途");
	}
	else{
		var url="finance/addNewFinance.do";
		var data={"reimPerson":reimPerson,"finanAmount":finanAmount,"finanDescri":finanDescri,"finanDate":finanDate};
		$.getJSON(url,data,function(result){
			if(result.state==0){
				alert(result.message);
			}else{
				window.location.reload();
			}
		});
	}
}
function seeDetail(){
	var startTime = $("#startDateInput").val();
    var endTime = $("#endDateInput").val();
    if (startTime=="") {
        alert('请选择起始日期');
    }else if(endTime==""){
    	alert('请选择终止日期');
    }else{
	    var start = new Date(startTime.replace("-", "/").replace("-", "/"));
	    var end = new Date(endTime.replace("-", "/").replace("-", "/"));
    	if(end <start){
    		alert('起始日期应先于终止时日期');
    	}else{
    		var income;
    		var outcome;
    		var profit;
    		$.ajaxSetup({async:false});
    		$.getJSON("finance/getIncomeInPeriod.do",{"startTime":startTime,"endTime":endTime},function(result){
    			income=result.data;
    		});
    		$.ajaxSetup({async:false});
    		$.getJSON("finance/getOutcomeInPeriod.do",{"startTime":startTime,"endTime":endTime},function(result){
    			outcome=result.data;
    		});
    		$.ajaxSetup({async:false});
    		$.getJSON("finance/getProfitInPeriod.do",{"startTime":startTime,"endTime":endTime},function(result){
    			profit=result.data;
    		});
    		$("#incomeSpan").html("该时间段的收入是:"+income);
    		$("#outcomeSpan").html("该时间段的支出是:"+(-1)*outcome);
    		$("#profitSpan").html("该时间段的总利润是:"+profit);
    		$("#chartShow").attr("disabled",false);
    		$("#chartShow").attr("onclick","showChart(\""+startTime+"\",\""+endTime+"\")");
    	}
    }
}
function showChart(startTime,endTime){
	var url1 = "financechart.jsp";
	var form = $("<form method=\"post\" id=\"form11\" action=\""+url1+"\"></form>");
	form.append('<input type="hidden" name="startTime" value="'+startTime+'"></input>');
	form.append('<input type="hidden" name="endTime" value="'+endTime+'"></input>');
	$(document.body).append(form);
	console.log(startTime+","+endTime);
	form.submit();
}
</script>
</html>
