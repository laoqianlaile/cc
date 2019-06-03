<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    String customerId = request.getParameter("customerId")==null?"0":request.getParameter("customerId");
    String customerName = TeeStringUtil.getString(request.getParameter("customerName"), null);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<%@ include file="/header/userheader.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=contextPath%>/common/js/layout/layout.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/subsys/crm/js/crm.js"></script>
<script>
var datagrid;
var cusId = "<%=customerId%>";
var customerId = "<%=customerId%>";
var customerName = "<%=customerName%>";
function doInit(){
	datagrid = $('#datagrid').datagrid({
		url:contextPath+'/TeeCrmOrderController/datagrid.action?cusId='+cusId,  //订单列表
		pagination:true,
		singleSelect:true,
		toolbar:'#toolbar',//工具条对象
		view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
		checkbox:false,
		border:false,
		idField:'sid',//主键列
		fitColumns:true,//列是否进行自动宽度适应
		columns:[[
			{field:'sid',checkbox:true,title:'ID',width:100},
			{field:'orderNo',title:'订单编号',width:80,formatter:function(value,rowData,rowIndex){
				return "<a href=\"#\" onclick=\"showDetail("+rowData.sid+",'"+rowData.customerName+"')\">"+rowData.orderNo+"</a>";
			}   
			},
			{field:'customerName',title:'客户名称',width:80},
			{field:'orderTimeDesc',title:'下单日期 ',align: 'center',width:120},
			{field:'orderStatusDesc',title:'状态',align: 'center',width:80},
			{field:'receiverName',title:'收货人',align: 'center',width:60},
			{field:'managePersonName',title:'负责人',align: 'center',width:60},
			{field:'createTimeDesc',title:'创建时间 ',align: 'center',width:120},
			{field:'addPersonName',title:'创建人',align: 'center',width:100},
			{field:'2',title:'操作',align: 'center',width:80,formatter:function(value,rowData,rowIndex){
				return "<a href=\"#\" onclick=\"showDetail("+rowData.sid+",'"+rowData.customerName+"')\">详情</a>&nbsp;&nbsp;";
			}},
		]]
	});
	
	
}

//查看订单详情
function showDetail(sid,customerName){
	var url = contextPath+"/system/subsys/crm/core/customer/order/orderInfo.jsp?sid="+sid+"&customerName="+customerName;
	location.href=url; 
}

//添加订单
function add(){
	  var title = "新建订单";
	  var url = contextPath+"/system/subsys/crm/core/customer/order/addOrUpdateOrder.jsp?customerId="+cusId+"&customerName="+customerName;
	  bsWindow(url ,title,{width:"900",height:"350",buttons:
			[
			 {name:"确定",classStyle:"btn-alert-blue"},
		 	 {name:"关闭",classStyle:"btn-alert-gray"}
			 ]
			,submit:function(v,h){
			var cw = h[0].contentWindow;
			if(v=="确定"){
				cw.save(function(){
				  //$.MsgBox.Alert_auto("保存成功！"); 
				  window.location.reload();
				});
			}else if(v=="关闭"){
				return true;
			}
		}});
}


</script>

</head>
<body onload="doInit()" style="overflow:hidden;font-size:12px;padding-left: 10px;padding-right: 10px;">
	<table id="datagrid" fit="true"></table>
	<div class="topbar clearfix" id="toolbar">
	 <div class="fl">
      <input type="button" value="新建订单" class="btn-win-white" onclick="add();"/>
   </div>
</div>
 
</body>
</html>