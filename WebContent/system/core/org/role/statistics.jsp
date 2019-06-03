<%@page import="com.tianee.webframe.util.str.TeeStringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int roleId=TeeStringUtil.getInteger(request.getParameter("roleId"),0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<title>主角色用户数/辅助角色用户数</title>
<style type="text/css">
table{
	border-collapse: collapse;
    border: 1px solid #f2f2f2;
    width:100%;
}
table tr{
	line-height:35px;
	border-bottom:1px solid #f2f2f2;
}
table tr td:first-child{
	text-indent:10px;
}
table tr:first-child td{
	font-weight:bold;
}
table tr:first-child{
	border-bottom:2px solid #b0deff!important;
	background-color: #f8f8f8; 
}
</style>
<script type="text/javascript">
var roleId=<%=roleId %>; 
//初始化
function doInit(){
	var  url=contextPath+"/userRoleController/getStatisticsDetail.action";
	var json=tools.requestJsonRs(url,{roleId:roleId});
	if(json.rtState){
		var data=json.rtData;
		if(data!=null&&data.length>0){
			var html=[];
			html.push("<tr>");
			html.push("<td width=\"15%\">部门名称</td>");
			html.push("<td width=\"15%\">人数统计</td>");
			html.push("<td width=\"35%\">主角色用户</td>");
			html.push("<td width=\"35%\">辅助角色用户</td>");
			html.push("</tr>");
			for(var i=0;i<data.length;i++){
				html.push("<tr>");
				html.push("<td>"+data[i].deptName+"</td>");
				html.push("<td>"+data[i].statistics+"</td>");
				html.push("<td>"+data[i].zUserNames+"</td>");
				html.push("<td>"+data[i].fUserNames+"</td>");
				html.push("</tr>");
			}
			$("#tb").append(html.join(""));
		}else{
			$("#mess").show();
			messageMsg("暂无数据！", "mess","info");
		}
	}
	
	
}

</script>
</head>
<body onload="doInit();">
   <div id="mess" style="display: none;margin-top: 10px"></div>
   <table id="tb" style="width: 100%"></table>
</body>
</html>