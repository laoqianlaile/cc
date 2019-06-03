
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.SimpleDateFormat"%>

<%
	Date curDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat dateFormatWeek = new SimpleDateFormat("E");
	Calendar c = Calendar.getInstance();
	String curDateStr = dateFormat.format(curDate);
	int month = Integer.parseInt(curDateStr.substring(5, 7));
	int day = Integer.parseInt(curDateStr.substring(8, 10));
	int hour = Integer.parseInt(curDateStr.substring(11, 13));
	int minute = Integer.parseInt(curDateStr.substring(14, 16));
	int second = Integer.parseInt(curDateStr.substring(17, 19));
	String time = curDateStr.substring(11, 19);
	c.setTime(curDate);
	int week = c.get(Calendar.DAY_OF_WEEK);
	if (week == 1) {
		week = 7;
	} else {
		week = week - 1;
	}
	String weeks[] = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期天"};
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/header/header2.0.jsp"%>
		<%@ include file="/header/easyui2.0.jsp"%>
		<%@ include file="/header/userheader.jsp"%>
		<%@ include file="/header/validator2.0.jsp"%>
		<title>周期性事务</title> <%-- <link  rel='stylesheet' href='<%=contextPath %>/system/core/base/calendar/css/calendar.css'type="text/css" /> --%>
		<style type="text/css">
.modal-test {
	width: 564px;
	position: absolute;
	display: none;
	z-index: 999;
}

.modal-test .modal-header {
	width: 100%;
	height: 50px;
	background-color: #8ab0e6;
}

.modal-test .modal-header .modal-title {
	color: #fff;
	font-size: 16px;
	line-height: 50px;
	margin-left: 20px;
	float: left;
}

.modal-test .modal-header .modal-win-close {
	color: #fff;
	font-size: 16px;
	line-height: 50px;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}

.modal-test .modal-body {
	width: 100%;
	height: 410px;
	background-color: #f4f4f4;
}

.modal-test .modal-body ul {
	overflow: hidden;
	clear: both;
}

.modal-test .modal-body ul li {
	width: 455px;
	height: 30px;
	line-height: 30px;
	margin-top: 10px;
	margin-left: 20px;
	margin-bottom:10px;
	padding-bottom:10px;
	border-bottom:1px solid #e5e5e5;
}

.modal-test .modal-body ul li span {
	display: inline-block;
	float: left;
	vertical-align: middle;
}

.modal-test .modal-body ul li input {
	display: inline-block;
	float: right;
	width: 400px;
	height: 25px;
	float:left;
	margin-left:20px;
}

.modal-test .modal-footer {
	width: 100%;
	height: 60px;
	background-color: #f4f4f4;
}

.modal-test .modal-footer input {
	margin-top: 12px;
	float: right;
	margin-right: 20px;
}
input[type=checkbox] 
{ 
vertical-align: middle; 
padding: 2px; 
} 
label 
{ 
vertical-align: middle; 
}
.basic_border_grey
{
    border-bottom:2px solid #e5e5e5;
	margin-top:5px;
} 
</style>
		<script type="text/javascript"
			src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>

		<script type="text/javascript"
			src="<%=contextPath%>/system/core/base/calendar/js/affair.js"></script>


		<script type="text/javascript">
function doInit()
{
// 	$("#remindTime").popover();
	//得到提醒时间设置select
	getRemindTimeDataContent(<%=hour%>,<%=minute%>,<%=second%>);
	
	//处理提醒时间点击时间
	/* $("input[data-toggle='popover']").click(function(event){
		setRemindTime(this);
	}); */
	
	//处理提醒时间点击后处理样式
	$("input[data-toggle='popover']").on('shown.bs.popover', function () {//展示后执行触发时间
		  // do something…
		  //alert("ddd");
		  $(".popover .popover-content").css({"background-color":"#fbfafb"});
		  //设置时间
		  var remindTimeValue = $("#remindTime" ).val();
		  if(remindTimeValue && remindTimeValue != ""){
			  var remindTimeValueArr = remindTimeValue.split(":");
			  if(remindTimeValueArr.length != 3){
				  $("#remindTimeHour").val(remindTimeValueArr[0]);
				  $("#remindTimeMinute").val(remindTimeValueArr[1]);
				  $("#remindTimeSecond").val(remindTimeValueArr[2]);
			  }
		  }
	});
	
	doQuery(0);
}
/**
 * 查询
 */
function doQuery(type){
	var url =   "<%=contextPath%>/affairManage/queryAffair.action";
	var para =  tools.formToJson($("#formquery")) ;
	var jsonObj = tools.requestJsonRs(url,para);
	if(jsonObj.rtState){
		var prcs = jsonObj.rtData;
		$("#listDiv").empty();
		if(prcs.length > 0){
			var tableStr = "<table class='TableBlock_page' width='90%' align='center'><tbody id='listTbody'>";
		    	 tableStr = tableStr + "<tr class='TableHeader'>"
			      	 + "<td width='140' align='center'>起始时间</td>"
			      	 +"<td nowrap width='140' align='center'>结束时间  </td>"
			     	 +"<td nowrap  width='120'  align='center'>创建人姓名</td>"
			     	 +"<td nowrap  width='100'  align='center'>提醒类型</td>"
			      	 +"<td nowrap  width='100'  align='center'>提醒日期</td>"
			      	 +"<td nowrap  width='100' align='center'>提醒时间</td>"
			      	 +"<td nowrap align='center'>事务内容</td>"
			      	 +"<td nowrap  width='80' align='center'>操作</td>"
			         +"</tr>";
			for(var i = 0;i<prcs.length ; i++){
				var prc = prcs[i];
				var id = prc.sid;
				var fontStr = "";
				var remindTypeStr = "按日";
				var remindDateStr = "";
				if(prc.remindType == 3){
					remindTypeStr = "按周";
					if(prc.remindDate == 1){
						remindDateStr = "周一";
					}else if(prc.remindDate == 2){
						remindDateStr = "周二";
					}else if(prc.remindDate == 3){
						remindDateStr = "周三";
					}else if(prc.remindDate == 4){
						remindDateStr = "周四";
					}else if(prc.remindDate == 5){
						remindDateStr = "周五";
					}else if(prc.remindDate == 6){
						remindDateStr = "周周";
					}else if(prc.remindDate == 7){
						remindDateStr = "周日";
					}
				}else if(prc.remindType == 4){
					remindTypeStr = "按月";
					remindDateStr = prc.remindDate + "日";
				}else if(prc.remindType == 5){
					remindTypeStr = "按年";
					var remindDateArray = prc.remindDate.split("-");
					remindDateStr = remindDateArray[0] + "月" +  remindDateArray[1] + "日";
				}
				var userId = prc.userId;
				var managerId = prc.managerId;
				var opt = "";
				if(userId == loginPersonId || userId == managerId){
					opt =  "<a href='javascript:void(0);' class='modal-menu-test' data-toggle=\"modal\" data-target=\"#myAffairModal\" onclick='$(this).modal(); toAddUpdateAffair(\"" + id + "\");'> 编辑 </a>"
			      	 +"&nbsp;&nbsp;<a href='javascript:void(0);' onclick='delAffair(this,\"" + id + "\");'>删除 </a>";
				     
				}
				tableStr = tableStr +"<tr class=''>"
				      	 + "<td width='140' align='center'><font color='" + fontStr + "'>"+ prc.startTimeStr +"</font></td>"
				      	 +"<td nowrap align='center'><font color='" + fontStr + "'>" + prc.endTimeStr + "</font></td>"
				     	 +"<td nowrap align='center'><font color='" + fontStr + "'>" + prc.userName + "</font></td>"
				     	 +"<td nowrap align='center'><font color='" + fontStr + "'>" + remindTypeStr + "</font></td>"
				      	 +"<td nowrap align='center'><font color='" + fontStr + "'>" + remindDateStr  + "</font></td>"
				      	 +"<td nowrap align='center'><font color='" + fontStr + "'>" + prc.remindTimeStr + "</font></td>"
				      	 +"<td nowrap align='center'><font color='" + fontStr + "'><a href='javascript:void(0);' onclick='toAffairDetail(\"" + id + "\")'>" + prc.content + "</a></font></td>"
				      	 +"<td nowrap align='center'>"
				      	 + opt
				      	 +"</td>"
				         +"</tr>";
				
		
			}
			tableStr = tableStr + "</tbody></table>";
				
			$("#listDiv").append(tableStr);	
		}else{
		 	messageMsg("没有查询到相关周期性事务", "listDiv" ,'' ,380);
		}
		if(type == 1){
// 			$("#myAffairQuery").modal('hide');
		}
		
	}else{
		$.MsgBox.Alert_auto(jsonObj.rtMsg);
	}
}

/**
 * 新建或者更新周期性事务
 */
function doSaveOrUpdateAffair(){
	if(checkFrom()){
		var url =   "<%=contextPath%>/affairManage/addOrUpdate.action";
		var para =  tools.formToJson($("#form1")) ;
		var jsonObj = tools.requestJsonRs(url,para);
		
		if(jsonObj.rtState){
			//$.jBox.tip();
			//alert(jsonObj.rtMsg);
			window.location.reload();
		}else{
			//alert(jsonObj.rtMsg);
			$.MsgBox.Alert_auto(jsonObj.rtMsg);
		}
	}
}
function checkFrom(){
	 var check = $("#form1").valid();
	 if(check ){
		 
		 return true;
		 
	 }
	 return false;
}
/**
 * 删除周期性事务
 */
<%-- var  delAffair = function(funcObj , id){
	var msg = "确定要删除此周期性事务,删除后不可恢复？";
	if(confirm(msg)){
		var url =   "<%=contextPath%>/affairManage/deleteById.action";
		var para = {sid:id};
		var jsonObj = tools.requestJsonRs(url,para);
		
		if(jsonObj.rtState){
// 			$.jBox.tip('sss');
			//alert("");
			$(funcObj).parent().parent().remove();
// 			$.jBox.tip('删除成功','info',{timeout:1000});
            $.MsgBox.Alert_auto('删除成功！');
			//window.location.reload();
		}else{
			$.MsgBox.Alert_auto(jsonObj.rtMsg);
		}
	}

} --%>

function delAffair(funcObj,id) 
{
	var submit = function () {
	    //if (v == 'ok'){
 		var url = contextPath + "/affairManage/deleteById.action";
    	var jsonRs = tools.requestJsonRs(url,{sid:id});
    	if(jsonRs.rtState){
	    		//$.jBox.tip('删除成功','info',{timeout:1000});
	    		$(funcObj).parent().parent().remove();
                $.MsgBox.Alert_auto('删除成功');
	    	
	    	}else{
	    		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	    	}
	    //}
	};
	//$.jBox.confirm("确定要删除吗,删除后不可恢复？", "提示", submit);
    $.MsgBox.Confirm("提示", "确定删除所选记录,删除后将不可恢复！", submit);
	
}

function toAddUpdateAffair(id){
	if(id){
		var url =   "<%=contextPath%>/affairManage/selectById.action";
		var para = {sid:id};
		var jsonObj = tools.requestJsonRs(url,para);
		if(jsonObj.rtState){
			var prc = jsonObj.rtData;
			if(prc && prc.sid){
				bindJsonObj2Cntrl(prc);
				$("#startTime").val("");
				$("#endTime").val("");
				$("#myModalLabel").html("编辑周期性事务");
				$("#startDate").val(prc.startTimeStr);
				$("#endDate").val(prc.endTimeStr);
				/* if(prc.remindType == 3 || prc.remindType == 4 || prc.remindType == 5){//周、月、年
					$("#remindTime" + prc.remindType).val(prc.remindTimeStr);
				}else{
					$("#remindTime").val(prc.remindTimeStr);
				} */
				$("#remindTime").val(prc.remindTimeStr);
				sel_change(prc.remindType);
				
				if(prc.remindType == 3){
					$("#remindDate3").val(prc.remindDate);
				}else if(prc.remindType == 4){
					$("#remindDate4" ).val(prc.remindDate);
				}else if(prc.remindType == 5){
					var remindDateArray = prc.remindDate.split("-");
					$("#remindDate5Mon").val(remindDateArray[0]);
					$("#remindDate5Day").val(remindDateArray[1]);
				}
				
			}
		}else{
			$.MsgBox.Alert_auto(jsonObj.rtMsg);
		}
	}else{
		$("#myModalLabel").html("新建周期性事务");
		$("#startDate").val("");
		$("#endDate").val("");
		$("#calType").val("1");
		$("#remindType").val('2');
		sel_change('2');
		$("#content").val("");
		$("#actorIds").val("");
		$("#actorNames").val("");
		$("#remindTime").val('<%=time%>');
		$("#sid").val("0");
				}

			}
		</script>
</head>
<body onload="doInit();">

	<div class="">
		<table border="0" width="100%" cellspacing="0" cellpadding="3"
			class="small">
			<tr>
				<td class="Big"><span style="margin-left: 20px;">
				    <form id="form1" name="form1" method="post">
						<div class="modal-test">
							<div class="modal-header">
								<p class="modal-title" id="myModalLabel">新建周期性事务</p>
								<span class="modal-win-close">×</span>
							</div>
							<div class="modal-body" id="mailBoxForm">
								<ul>
									<li class="clearfix" style="padding-left:20px;"><span>起始时间:</span> <input type="text"
										id="startDate" name="startDate" size="20" maxlength="19"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										class="BigInput" required value="" style="width:140px;" readonly></li>
									<li class="clearfix" style="padding-left:20px;"><span>结束时间:</span> <input type="text" id="endDate"
															name="endDate" size="20" maxlength="19"
															onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
															class="BigInput" required value="" style="width:140px;" readonly></li>
									<li class="clearfix" style="padding-left:20px;"><span>事务类型:</span> <select class="BigSelect"
															name="calType" id="calType" style="width:100px;margin-left:20px;margin-top:5px;">
																<option value="1">工作事务</option>
																<option value="2">个人事务</option>
														</select></li>
									<li class="clearfix" style="padding-left:20px;"><span>提醒类型:</span> <select id="remindType"
															name="remindType" class="BigSelect"
															onchange="sel_change(this.value)" style="width:100px;margin-left:20px;margin-top:5px;float:left;">
																<option value="2">按日提醒</option>
																<option value="3">按周提醒</option>
																<option value="4">按月提醒</option>
																<option value="5">按年提醒</option>
														</select> <span id="dayShow"> &nbsp;&nbsp;<input type="checkbox"
																name="isWeekend" id="isWeekend" value='1' style="width:15px;float:none;"/>&nbsp;选中为排除周六、日
														</span>
														</li>
									<li class="clearfix" style="padding-left:20px;"><span>提醒时间:</span> <span id="day"> </span> <span
															id="week" style="display: none"> <select
																id="remindDate3" name="remindDate3" class="BigSelect" style="margin-left:20px;margin-top:5px;float:left;">
																	<%
																		for (int i = 1; i <= 7; i++) {
																			if (i == week) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=weeks[i - 1]%></option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=weeks[i - 1]%></option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <span id="mon" style="display: none"> <select
																id="remindDate4" name="remindDate4" class="BigSelect" style="margin-left:20px;margin-top:5px;float:left;">
																	<%
																		for (int i = 1; i <= 31; i++) {
																			if (i == day) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>日
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>日
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <span id="years" style="display: none"> <select
																id="remindDate5Mon" name="remindDate5Mon"
																class="BigSelect" style="margin-left:20px;margin-top:5px;float:left;">
																	<%
																		for (int i = 1; i <= 12; i++) {
																			if (i == month) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>月
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>月
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp; <select id="remindDate5Day"
																name="remindDate5Day" class="BigSelect" style="margin-left:20px;margin-top:5px;float:left;">
																	<%
																		for (int i = 1; i <= 31; i++) {
																			if (i == day) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>日
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>日
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <input id="remindTime" type='text' name="remindTime"
															onclick="setRemindTime(this);" style="width: 60px;height:17px;margin-left:20px;margin-top:5px;float:left;"
															class="BigInput easyui-validatebox" validType="time[]"
															value="<%=time%>" data-placement="right" data-content=""
															data-toggle="popover" data-html="true">
																&nbsp;&nbsp;为空为当前时间 </li>
										<li class="clearfix" style="padding-left:20px;height:50px;"><span>事务内容:</span> <textarea id="content"
																name="content" cols="42" rows="3"
																class="BigInput easyui-validatebox" required="true" style="margin-left:20px;"></textarea></li>
										<li class="clearfix" style="border-bottom:none;padding-left:20px;height:50px;"><span>参与者:</span> <input id="actorIds"
															name="actorIds" type="hidden"/> <textarea
																	name="actorNames" id="actorNames"
																	class="SmallStatic BigTextarea" rows="2" cols="35"
																	readonly="readonly" style="margin-left:32px;"></textarea> &nbsp;&nbsp;<a
																href="javascript:void(0);" class="orgAdd"
																onClick="selectUser(['actorIds','actorNames'],'1')">选择</a>
																&nbsp;&nbsp; <a href="javascript:void(0);"
																class="orgClear"
																onClick="clearData('actorIds','actorNames')">清空</a></li>
								</ul>
							</div>
							<div class="modal-footer clearfix">
							    <input id="sid" name="sid" type="hidden" value="0">
								<input id="calAffType" name="calAffType" type="hidden" value="1">
								<input class="modal-btn-close btn-alert-gray" type="button"
									value='关闭' /> 
								<input class="modal-save btn-alert-blue"
									type="button" onclick="doSaveOrUpdateAffair();" value='保存' />
							</div>
						</div> 
						</form>
						<!-- Modal --> <%-- <form id="form1" name="form1" method="post">
							<div class="modal-test">
								<div class="modal fade" id="myAffairModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width: 550px;">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">新建周期性事务</h4>
												</div>
											</div>
											<div class="modal-body">
												<table class="TableBlock" width="520px" align="center">
													<tr>
														<td nowrap class="TableData" width="100">起始时间：</td>
														<td class="TableData"><input type="text"
															id="startDate" name="startDate" size="20" maxlength="19"
															onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
															class="BigInput easyui-validatebox" required="true"
															value=""></td>
													</tr>
													<tr>
														<td nowrap class="TableData" width="100">结束时间：</td>
														<td class="TableData"><input type="text" id="endDate"
															name="endDate" size="20" maxlength="19"
															onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
															class="BigInput" value=""></td>
													</tr>
													<tr class="TableData">
														<td nowrap>事务类型：</td>
														<td nowrap align="left"><select class="BigSelect"
															name="calType" id="calType">
																<option value="1">工作事务</option>
																<option value="2">个人事务</option>
														</select></td>
													</tr>
													<tr>
														<td nowrap class="TableData">提醒类型：</td>
														<td class="TableData"><select id="remindType"
															name="remindType" class="BigSelect"
															onchange="sel_change(this.value)">
																<option value="2">按日提醒</option>
																<option value="3">按周提醒</option>
																<option value="4">按月提醒</option>
																<option value="5">按年提醒</option>
														</select> <span id="dayShow"> <input type="checkbox"
																name="isWeekend" id="isWeekend" value='1'></input>&nbsp;选中为排除周六、日
														</span></td>
													</tr>
													<tr>
														<td nowrap class="TableData">提醒时间：</td>
														<td class="TableData"><span id="day"> </span> <span
															id="week" style="display: none"> <select
																id="remindDate3" name="remindDate3" class="BigSelect">
																	<%
																		for (int i = 1; i <= 7; i++) {
																			if (i == week) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=weeks[i - 1]%></option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=weeks[i - 1]%></option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <span id="mon" style="display: none"> <select
																id="remindDate4" name="remindDate4" class="BigSelect">
																	<%
																		for (int i = 1; i <= 31; i++) {
																			if (i == day) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>日
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>日
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <span id="years" style="display: none"> <select
																id="remindDate5Mon" name="remindDate5Mon"
																class="BigSelect">
																	<%
																		for (int i = 1; i <= 12; i++) {
																			if (i == month) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>月
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>月
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp; <select id="remindDate5Day"
																name="remindDate5Day" class="BigSelect">
																	<%
																		for (int i = 1; i <= 31; i++) {
																			if (i == day) {
																	%>
																	<option value="<%=i%>" selected="selected"><%=i%>日
																	</option>
																	<%
																		} else {
																	%>
																	<option value="<%=i%>"><%=i%>日
																	</option>
																	<%
																		}
																		}
																	%>
															</select>&nbsp;&nbsp;
														</span> <input id="remindTime" type='text' name="remindTime"
															onclick="setRemindTime(this);" style="width: 60px;"
															class="BigInput easyui-validatebox" validType="time[]"
															value="<%=time%>" data-placement="right" data-content=""
															data-toggle="popover" data-html="true">
																&nbsp;&nbsp;为空为当前时间 </td>
													</tr>
													<tr>
														<td nowrap class="TableData">事务内容：</td>
														<td class="TableData"><textarea id="content"
																name="content" cols="42" rows="3"
																class="BigInput easyui-validatebox" required="true"></textarea>
														</td>
													</tr>
													<tr class="TableData">
														<td nowrap>参与者：</td>
														<td nowrap align="left"><input id="actorIds"
															name="actorIds" type="hidden"> <textarea
																	name="actorNames" id="actorNames"
																	class="SmallStatic BigTextarea" rows="2" cols="35"
																	readonly="readonly"></textarea> &nbsp;&nbsp;<a
																href="javascript:void(0);" class="orgAdd"
																onClick="selectUser(['actorIds','actorNames'],'1')">选择</a>
																&nbsp;&nbsp; <a href="javascript:void(0);"
																class="orgClear"
																onClick="clearData('actorIds','actorNames')">清空</a></td>
													</tr>
													<tr>
														<td colspan="2">
															<div class="modal-footer clearfix" align="center">
																<input id="sid" name="sid" type="hidden" value="0">
																	<input id="calAffType" name="calAffType" type="hidden"
																	value="1">

																		<button type="button" class="btn btn-primary"
																			onclick="doSaveOrUpdateAffair();">保存</button>
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">关闭</button>
															</div>
														</td>
													</tr>
												</table>
											</div>
											<!--   <div class="modal-footer">
				       
				      </div> -->
										</div>
										<!-- /.modal-content -->
									</div>
								</div>
								<!-- /.modal-dialog -->
							</div>
						</form> --%>
				</span> <!-- <div style="margin-top:20px;"> -->
					<form method="post" name="formquery" id="formquery">
						<table class="TableBlock"
							style="width: 100%; background-color: #fff;">
							<tr>
								<td nowrap class="TableData"
									style="width: 70px; text-indent: 15px;">日期：</td>
								<td class="TableData"><input type="text" id="startTime"
									name="startTime" size="15" maxlength="10"
									onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="BigInput"
									value=""> 至 <input type="text" id="endTime"
										name="endTime" size="15" maxlength="10"
										onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="BigInput"
										value=""></td>
							</tr>

							<tr>
								<td nowrap class="TableData" style="text-indent: 15px;">
									内容：</td>
								<td class="TableData"><textarea rows="3" cols="50"
										name="contentQuery" class="BigTextarea"></textarea></td>
							</tr>
							<tr style="border-bottom:none;">
								<td nowrap class="TableData" colspan="2">
									<div class="" align="left"
										style="text-indent: 305px; margin-top: 5px;">
										<input type="button" class="btn-win-white modal-menu-test"
											data-toggle="modal" data-target="#myAffairModal" value="新建"
											onclick="$(this).modal(); toAddUpdateAffair()" />
										<button type="button" class="btn-win-white"
											onclick="doQuery(1);">查询</button>
										<button type="reset" class="btn-win-white">重置</button>
									</div>
								</td>
							</tr>
						</table>
					</form> <!-- </div> --> <!-- 周期性事务查询 --> <!-- 
	    	<span style="margin-left:20px;">
	    		<input type="button" class="btn" data-toggle="modal" data-target="#myAffairQuery" value="查询周期性事务" onclick="">
	   			
	   			<div class="modal fade" id="myAffairQuery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog"  style="width:550px;">
				    <div class="modal-content">
				    	<div class="modal-header" style="margin:0 auto;">
				        	 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				      	</div> 
				      <div class="modal-body">
				   			<form  method="post" name="formquery" id="formquery">
								 <table  class="TableBlock" width="550" align="center">
								    <tr>
								      <td nowrap class="TableData" width="100"> 日期：</td>
								      <td class="TableData">
								      	 <input type="text" id="startTime" name="startTime" size="15" maxlength="10" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="BigInput" value="">
								       		至
								       	 <input type="text" id="endTime" name="endTime" size="15" maxlength="10" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="BigInput" value="">
								      				     
								       </td>
								    </tr>
								    
								    <tr>
								      <td nowrap class="TableData"> 内容：</td>
								      <td class="TableData">
								        	<textarea rows="3" cols="50" name="contentQuery"></textarea>
								      </td>
								    </tr>
								     <tr>
								      <td nowrap class="TableData" colspan="2">
								     	   <div class="" align="center">
									    	 	
						       				 	<button type="button" class="btn btn-primary" onclick="doQuery(1);">查询</button>
								    			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								    		</div>
								      </td>
								    </tr>
								</table>
							 </form>
						</div>
					 </div>/.modal-content
				  </div>/.modal-dialog
				</div>
	   		</span> --></td>
			</tr>
		</table>

		<!-- 周期性事务列表 -->
		<div id="listDiv" style="margin-top: 20px;"></div>
	</div>

</body>

</html>
