<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

 <%
	String sid = request.getParameter("sid")==null?"0":request.getParameter("sid");
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
html{
  padding: 5px;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
}
</style>
<!-- jQuery 布局器 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/common/jqueryui/jquery.layout-latest.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/subsys/crm/js/crm.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/layout/layout.js"></script>
<script type="text/javascript">


//新建订单
function add(){
	var url = contextPath+"/system/subsys/crm/core/order/addOrUpdate.jsp";
	location.href=url;
}

function selectCustomer(){
	var url = contextPath+"/system/subsys/crm/core/customer/query.jsp";
	dialogChangesize(url, 860, 500);
}


//重置form表单
function  resetForm(){
	document.getElementById("form1").reset(); 
	$("#customerId").remove();
}

function fresh(){
	var params = tools.formToJson($("#form1"));
	$("#tab-content").find("iframe")[0].contentWindow.query(params);
	$(".searchCancel").click();
}
</script>
</head>
<body onload=""  style="overflow:hidden;padding-left:10px;padding-right:10px;">

 <div class="titlebar clearfix" >
		<img class = 'tit_img' style="margin-right: 10px;" src="<%=contextPath%>/system/subsys/crm/img/icon_dd.png">
		<p class="title">订单</p>
		<ul id = 'tab' class = 'tab clearfix' style='display:inline-block;'>
		</ul>
	<div class="right fr clearfix" style="padding-top: -1px;">
      <input type="button" value="新建订单" class="btn-win-white" onclick="add();"/>
      <button type="button" onclick="" class="advancedSearch btn-win-white">高级查询</button>
   </div>
		
		<span class="basic_border_grey fl"></span>
 </div>
	
	<div id="tab-content" style="padding-left: 10px;padding-right: 10px;"></div>
	
	
	 <form id="form1" class='ad_sea_Content'>
       <table class="TableBlock" width="100%"  style="font-size:12px" id="searchTable">
          <tr>
             <td width="10%">
				所属客户：
			</td>
			<td width="40%">
				<input style="width: 300px;" id='customerName' name='customerName' type='text' readonly="readonly"/>
				<input id='customerId' name='customerId' class="BigInput" type='hidden'/>
				<a href="javascript:void(0);" class="orgAdd" onClick="selectCustomerInfo(['customerId','customerName'])">选择客户</a>&nbsp;&nbsp;
				<a href="javascript:void(0);" class="orgClear" onClick="clearData('customerId','customerName')">清空</a>
			</td>
             <td width="10%">订单编号：</td>
             <td width="40%">
                <input  style="width: 300px;" type="text" name="orderNo" id="orderNo"/>
             </td>
          </tr>
          <tr>
            <td>下单日期：</td>
             <td>
                 <input type="text" style="width: 300px;" requried id='orderTimeDesc' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" name='orderTimeDesc' class="Wdate BigInput" />
             </td>
              <td>状态：</td>
             <td>
                <select style="width: 300px;" id="orderStatusDesc" name="orderStatusDesc" onchange="renderCostomFileds()">
                   <option value="0">全部</option>
                   <option value="1">确认中</option>
                   <option value="2">已确认</option>
                   <option value="3">已驳回</option>
                   <option value="4">已作废</option>
                </select>
             </td>
          </tr>
       </table>
       <div class='btn_search'>
		<input type='button' class='btn-win-white' value='查询' onclick="fresh()">&nbsp;&nbsp;&nbsp;
		<input type='button' class='btn-win-white' value='重置' onclick='resetForm()'>&nbsp;&nbsp;&nbsp;
		<input type='button' class='btn-win-white searchCancel' value='取消'>
		</div>
    </form>
	
</body>
<script type="text/javascript">
var customerId = "<%=sid%>";
 $.addTab("tab","tab-content",[{title:"全部",url:contextPath+"/system/subsys/crm/core/order/allOrderList.jsp?type=1"},
                              {title:"我负责的",url:contextPath+"/system/subsys/crm/core/order/allOrderList.jsp?type=2"},
                              {title:"我下属负责的",url:contextPath+"/system/subsys/crm/core/order/allOrderList.jsp?type=3"},
                              ]); 
 
 
	var btn_top = $(".advancedSearch").offset().top;
	var brn_height = $(".advancedSearch").outerHeight();
	$(".ad_sea_Content").css('top',(btn_top + brn_height));
	$(".advancedSearch").click(function(){
		$(".ad_sea_Content").slideToggle(200);
		if($(this).hasClass("searchOpen")){//显示前
		$(".serch_zhezhao").remove();
		$(this).removeClass("searchOpen");
		$(this).css({"border":"1px solid #0d93f6",});
		$(this).css('border-bottom','1px solid #0d93f6');
		}else{
		$(this).addClass("searchOpen");//显示时
		$(this).css({"border":"1px solid #dadada",'border-bottom':'1px solid #fff'});
		$('body').append('<div class="serch_zhezhao"></div>');
	}
	var _offsetTop = $("#form1").offset().top;
	$(".serch_zhezhao").css("top",_offsetTop)
	});
	$(".searchCancel").click(function(){
		$(".advancedSearch").removeClass("searchOpen");
	$("#form1").slideUp(200);
	$(".serch_zhezhao").remove();
	});

</script>
</html>
