<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String meetingId = request.getParameter("meetingId");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看会议签阅情况</title>
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<script type="text/javascript">
var sid = '<%=meetingId%>';
function doInit(){
	getObjList(sid);
}

/* 获取数据列表 */
function getObjList(id){
	var url = "<%=contextPath%>/TeeMeetingAttendConfirmController/showMeetingReadInfo.action";
	var para = {meetingId:id};
	var jsonObj = tools.requestJsonRs(url,para);
	if (jsonObj.rtState) {
		var prcs = jsonObj.rtData;
		//alert(prc[0].modelName + ">>" + prc[0].modelCount);
		var counter = 0;
		if(prcs.length>0){
			$("#tableList").append("<table id='tbody'  width='95%' class='TableBlock'>"
					+"<tr class='TableHeader' align='center'>"
					+"<td >序号</td>"
					+"<td >姓名</td>"
					+"<td >所属部门</td>"
					+"<td >角色</td>"
					+"<td >签阅状态</td>"
					+"<td >签阅时间</td>"
		  		+ "</tr>"); 
			jQuery.each(prcs,function(i,sysPara){
				counter++;
				var state = "<font color='red'>未签阅</font>";
				if(sysPara.readFlag =='1'){
					state = "<font color=' #007500 '>已签阅</font>";
				}
			$("#tbody").append("<tr class='TableData' align='center'>"
								+"<td >" + counter + "</td>"
								+"<td >" + sysPara.userName+ "</td>"
								+"<td >" + sysPara.deptName + "</td>"
								+"<td >" + sysPara.roleName + "</td>"
								+"<td >" + state + "</td>"
								+"<td >" + sysPara.readingTime + "</td>"
					  		+ "</tr>"); 
			});
			$("#tableList").append("</table>");
		}else{
			messageMsg("无相关数据！","tableList","info");
		}
	} else {
		$.MsgBox.Alert_auto(jsonObj.rtMsg);
	}
}



</script>
</head>
<body onload="doInit();" style="background: #f4f4f4;">
<center>
	<div id="tableList"></div>
</center>
</body>
</html>