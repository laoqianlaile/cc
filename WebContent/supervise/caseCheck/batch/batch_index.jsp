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
<link rel="stylesheet" type="text/css" href="/common/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/supervise/common/css/supervise.css" />
<script type="text/javascript">
</script>
</head>
<body onload="doInit()" style="padding-right: 10px;padding-left: 10px;padding-top: 5px">
	<table id="datagrid" fit="true"></table>
	<div id="toolbar" class="titlebar clearfix">
			<div id="outwarp">
		<div class="fl left">
			<img id="img1" class='title_img'
                src="<%=contextPath%>/common/zt_webframe/imgs/xzbg/clgl/clsqcx.png" />
                <span class="title">组织评查维护</span>
		</div>
		<div class="fr">
			<button class="easyui-linkbutton" onclick="add()"><i class="fa fa-plus"></i>&nbsp;新 增</button>
            &nbsp;&nbsp;
            <button class="easyui-linkbutton" onclick="choose()"><i class="fa fa-plus"></i>&nbsp;抽 卷</button>
		</div>
	</div>
		<span class="basic_border"></span> 
		<div class="" style="padding-top: 5px; padding-bottom: 5px">
<!--             <form id="form1"> -->
<!--            	所属部门： <input class="easyui-textbox" data-options="validType:'length[0,200]'" name="deptName" id="deptName"  /> -->
<!--            	&nbsp;&nbsp;资料类型： <input class="easyui-textbox" name="messageType" data-options="editable:false" id="messageType"  /> -->
<!--            	&nbsp;&nbsp;资料名称： <input class="easyui-textbox" data-options="validType:'length[0,200]'" name="name" id="name"  /> -->
<!--             &nbsp;&nbsp;<a class="easyui-linkbutton" onclick="queryS()"><i class="fa fa-search"></i>&nbsp;查&nbsp;询</a> -->
<!--             </form> -->
        </div>
	</div>
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/supervise/caseCheck/batch/js/batch_index.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/js/sysUtil.js"></script>
<script type="text/javascript" src="<%=contextPath%>/supervise/common/js/common.js"></script>
</body>
</html>