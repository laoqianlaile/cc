<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<html>
<head>
<title>科目</title>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/ui/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="../js/ui/uni-form/uni-form-validation.jquery.js"></script>
<link rel="stylesheet" type="text/css" href="../css/ui/jqueryUI/base/jquery.ui.all.css"/>
<link rel="stylesheet" type="text/css" href="../css/ui/uni-form/css/uni-form.css" media="screen" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../css/ui/uni-form/css/default.uni-form.css" title="Default Style" media="screen" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>

<link id="easyuiTheme" href="<%=contextPath%>/common/easyui/themes/gray/easyui.css" rel="stylesheet" type="text/css" media="screen">
<link href="<%=contextPath%>/common/easyui/themes/icon.css" rel="stylesheet" type="text/css" media="screen">
<script src="<%=contextPath%>/common/jquery/jquery-min.js" charset="UTF-8" type="text/javascript"></script>
<script src="<%=contextPath%>/common/easyui/jquery.easyui.min.js" charset="UTF-8" type="text/javascript"></script>
<script src="<%=contextPath%>/common/easyui/locale/easyui-lang-zh_CN.js" charset="UTF-8" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	jQuery.noConflict();
  $(".top-toolbar a").button();
});
$('#tt').datagrid({
	url: 'datagrid_data2.json',
	title: 'DataGrid - ContextMenu',
	width: 600,
	height: 300,
	fitColumns: true,
	columns:[[
		{field:'itemid',title:'Item ID',width:80},
		{field:'productid',title:'Product ID',width:100},
		{field:'listprice',title:'List Price',width:80,align:'right'},
		{field:'unitcost',title:'Unit Cost',width:80,align:'right'},
		{field:'attr1',title:'Attribute',width:150},
		{field:'status',title:'Status',width:60,align:'center'}
	]]
});
function add() {
  $('<iframe src="/oaop/system/core/org/manageRole.jsp"></iframe>').dialog({
    title: "新建1",
    height: 450,
    width: 500,
    modal: true
  }).css({
    width: "100%"
  });
}


</script>
</head>
<body>
  <div class="top-toolbar">
    <a href="javascript:void(0)" onclick="add()"><span>新增</span></a>
    <a href="javascript:void(0)"><span>批量设置辅助核算</span></a>
    <a href="javascript:void(0)" onclick="del()"><span>批量删除</span></a>
    <a href="javascript:void(0)"><span>批量引入</span></a>
    <a href="javascript:void(0)"><span>引出 </span></a>
  </div>
    <div >
      <div style="background-color: red">TTTTTTT<br /><br /><br /><br /><br />T</div>
      <div  >
      	<table id="tt"></table>
      </div>
    </div>
</body>
</html>