<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/easyui2.0.jsp"%>
<%@ include file="/header/ztree.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/supervise/subject/js/organization_index.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/sysUtil.js"></script>
<script type="text/javascript" src="<%=contextPath%>/supervise/common/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/common/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/supervise/common/css/supervise.css" />
<script type="text/javascript">
	$(document).ready(function(e) {
	    $(".but").click(function(e) {
	        $(".abc").toggle();
	    });
	});
</script>
</head>
<body onload="doInit()" style="padding-right: 10px;padding-left: 10px;padding-top: 5px">
	<table id="datagrid" fit="true"></table>
	<div id="toolbar" class="titlebar clearfix">
			<div id="outwarp">
			<div class="fl left">
			<img id="img1" class='title_img'
				src="<%=contextPath%>/common/zt_webframe/imgs/gzl/gzcx/icon_gongzuochaxun.png"/>
			<span class="title">受委托组织维护</span>
		</div>
		<div class="fr">
			<button class="easyui-linkbutton" onclick="add()"><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</button>
			&nbsp;&nbsp;
			<button class="easyui-linkbutton" onclick="dels()"><i class="fa fa-trash-o"></i>&nbsp;删&nbsp;除</button>
			&nbsp;&nbsp;
		</div>
	</div>
		<span class="basic_border"></span> 
		<div class="" style="padding-top: 5px; padding-bottom: 5px">
		受委托组织名称：<input  id='subName' name='subName' data-options="validType:'length[0,300]'" class="easyui-textbox"  />
		&nbsp;&nbsp;受委托组织性质：<input name="entrustNature" id="entrustNature" class="easyui-combobox"  data-options="editable:false,panelHeight:'auto'"/> 
		&nbsp;&nbsp;统一社会信用代码：<input  id='code' name='code' data-options="validType:'length[0,18]'" class="easyui-textbox"  />
		&nbsp;&nbsp;<button  class="easyui-linkbutton" onclick="queryS()" ><i class="fa fa-search"></i>&nbsp;查&nbsp;询</button>&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	
</body>
</html>