<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String createTimeStrMin = request.getParameter("createTimeStrMin");
	String createTimeStrMax = request.getParameter("createTimeStrMax");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<%@ include file="/header/header2.0.jsp" %>
	<%@ include file="/header/easyui2.0.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>下属邮件</title>
	
	<script type="text/javascript" charset="UTF-8">
	var contextPath = '<%=contextPath%>';
	var userId = "<%=userId%>";
	$(function(){
		query();
	});

	function query(){
		var param = {createTimeStrMin:'<%=createTimeStrMin%>',createTimeStrMax:'<%=createTimeStrMax%>'};
		
		$('#datagrid').datagrid({
			url : contextPath+'/monitor/mailList.action?userId='+userId,
			view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
		    toolbar : '#toolbar',
			title : '',
			queryParams:param,
			singleSelect:true,
			iconCls : 'icon-save',
			pagination : true,
			pageSize : 10,
			/* pageList : [ 20, 30, 40, 50, 60, 70, 80, 90, 100 ], */
			fit : true,
			fitColumns : true,
			nowrap : true,
			border : false,
			idField : 'id',
			sortOrder: 'desc',
			striped: true,
			remoteSort: false,
			columns : [ [ {
				field : 'subject',
				title : '邮件主题',
				width :300,
				formatter:function(data,rowData){
					return "<a href='javascript:void(0)' onclick='detail("+rowData.sid+")'>"+data+"</a>";
				}
			},{
				field : 'time',
				title : '发送时间',
				width :150,
				formatter:function(data,rowData){
					return getFormatDateStr(data,"yyyy-MM-dd HH:mm");
				}
			},{
				field : 'toUsers',
				title : '发送对象',
				width :300,
				formatter:function(data,rowData){
					return data;
				}
			}
			] ],
			onLoadSuccess:function(){
				$('#datagrid').datagrid("unselectAll");
			}
		});
	}
	
	function detail(id){
		openFullWindow(contextPath+"/system/core/email/view.jsp?sid="+id+"&isSendBox=0");
	}
	
	
	</script>
</head>
<body style="padding-left: 10px;padding-right: 10px">
<table id="datagrid" fit="true"></table>
<div id="toolbar" class = "topbar clearfix">
	<div class="fl" style="position:static;">
		<img id="img1" class ='title_img' src="<%=contextPath %>/common/zt_webframe/imgs/grbg/gztj/icon_work.png">
		<span class="title">邮件</span>
	</div>
	<div class = "right fr clearfix">
		<input  type="button"  class="btn-win-white fl"  onclick="window.location='index.jsp'" value="返回"/>
    </div>
</div>
</body>
</html>