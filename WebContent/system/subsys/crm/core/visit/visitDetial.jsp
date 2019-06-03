<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String sid = request.getParameter("sid")==null?"0":request.getParameter("sid");
    String customerName = TeeStringUtil.getString(request.getParameter("customerName"), null);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp"%>
<%@ include file="/header/userheader.jsp" %>
<script type="text/javascript" src="<%=contextPath%>/common/js/layout/layout.js"></script>
<script type="text/javascript" src="<%=contextPath%>/system/subsys/crm/js/crmCode.js"></script>
<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
	<title>拜访记录详情</title>
	
	<style>

.secondMenu{
	position:absolute;
	right:101%;
	top:0;
	background-color:#fff;
	display:none;
	border:1px solid #eee;
}
.secondMenu li{
    width:100px;
	height:30px;
	padding:0 20px;
	line-height:30px;
	
}
.secondMenu li:hover{
	background-color:#daeeff;
}
</style>
	
<script type="text/javascript" >
var sid = "<%=sid%>";
var customerName = "<%=customerName%>";
/**
   初始化列表
 */
function doInit(){
	getCrmCodeByParentCodeNo("VISIT_TOPIC","visitTopic");
	
	getInfoBySid(sid);
	
	$("body").on("mouseover",".hasMenu",function(){
		$(".secondMenu").show();
	});
	$("body").on("mouseleave",".hasMenu",function(){
		$(".secondMenu").hide();
	});
}
var managerPerName = '';
var managerPerId = "";
var createUserId = "";
function getInfoBySid(sid){
	var url=contextPath+"/TeeCrmVisitController/getInfoBySid.action";
	var param={sid:sid};
	var json=tools.requestJsonRs(url,param);
	if(json.rtState){
		var data=json.rtData;
		
		bindJsonObj2Cntrl(data);
		//获取当前负责人
		managerPerName = data.managePersonName;
		managerPerId = data.managePersonId;
		createUserId = data.createUserId;
		visitStatus = data.visitStatusDesc;
		addMenu(visitStatus);
		}
}

//更多操作中根据拜访记录状态追加操作
function addMenu(data){
	var str;
	$(".btn-content").empty();
	if(managerPerId==loginPersonId&&loginPersonId ==createUserId){
		if(data == "未拜访"){
			$(".btn-group").show();
			str ='<li onclick="finishVisit('+sid+');"><a href="javascript:void(0);" >完成拜访</a></li>'+
	        '<li onclick="edit();"><a href="javascript:void(0);" >编辑</a></li>'+
	        '<li onclick="deleteById('+sid+');"><a href="javascript:void(0);" >删除</a></li>';
		}else if(data =="已完成"){
			$(".btn-group").show();
			str = '<li onclick="deleteById('+sid+');"><a href="javascript:void(0);">删除</a></li>';
		}
	}else if(loginPersonId ==createUserId&&managerPerId!=loginPersonId){
		$(".btn-group").show();
		str ='<li onclick="deleteById('+sid+');"><a href="javascript:void(0);" >删除</a></li>';
	}else{
		$(".btn-group").hide();
	}
	
	$(".btn-content").append(str);
}

//完成拜访
function finishVisit(sid){
	 $.MsgBox.Confirm ("提示", "确定完成拜访嘛？",function(){
		 var url=contextPath+"/TeeCrmVisitController/finishVisit.action?sid="+sid+"&visitStatus=2";
		 var jsonRs = tools.requestJsonRs(url,null);
			if(jsonRs.rtState){
				opener.$.MsgBox.Alert_auto("操作成功！");
				opener.datagrid.datagrid("unselectAll");
				opener.datagrid.datagrid('reload');
				CloseWindow();
			}else{
				$.MsgBox.Alert_auto(jsonRs.rtMsg);
			}
		 });
}

/**
 * 删除
 */
function deleteById(sid){
	$.MsgBox.Confirm("提示","确定删除此拜访记录？",function(){
		var url = contextPath+ "/TeeCrmVisitController/delById.action?sid="+sid;
		var json = tools.requestJsonRs(url, {sid:sid});
		if (json.rtState) {
			$.MsgBox.Alert_auto(json.rtMsg);
			opener.$.MsgBox.Alert_auto("删除成功！");
			opener.datagrid.datagrid("unselectAll");
			opener.datagrid.datagrid('reload');
			CloseWindow();
		} else {
			$.MsgBox.Alert_auto(json.rtMsg);
		}
	
	});
}

//编辑
function edit(){
	window.location.href = "<%=contextPath%>/system/subsys/crm/core/visit/addOrEditVisit.jsp?sid=" + sid +"&customerName="+customerName;
}



</script>
</head>
<body style="padding-left: 10px;padding-right: 10px;overflow-x:hidden;" onload="doInit();">

<div class="topbar clearfix" id="toolbar">
    <div class="fl" style="position:static;">
		<img id="img1" class = 'title_img' src="<%=contextPath %>/system/subsys/crm/img/icon_bfjlxq.png">
		<span class="title">{<%=customerName %>}--拜访记录详情</span>
	</div>
     <div class="btn-group fr" style="margin-right: 20px;margin-top: 5px;display: none;">
		  <button type="button" class="btn-win-white btn-menu" >
		    更多操作<span class="caret-down"></span>
		  </button>
		  <ul class="btn-content">
		  </ul>
		</div>
</div>

	<table style="width: 100%;margin-top: 10px;">
	    <div style="margin-top: 15px;margin-bottom: 5px;">
	         <img src="<%=contextPath %>/common/zt_webframe/imgs/zsjl/ggtxb/icon_fenzu.png" alt="" style="vertical-align: text-top;"/>
		    &nbsp;<span style="font-size: 16px;line-height: 16px;color: #0050aa;font-family: 'MicroSoft YaHei';">基本信息</span>
		    <span style="padding-top: 10px;padding-bottom: 5px;" class="basic_border_grey fl"></span> 
	    
	    </div>

		<tr class='TableData' align='left'>
			<td width="150" style="text-indent:15px;line-height: 30px;">
				客户名称：
			</td>
		    <td name ="customerName" id="customerName">
            </td>
		</tr>
		<tr>
            <td width="150" style="text-indent:15px;line-height: 30px;">拜访主题：</td>
            <td align="left" name="visitTopicDesc" id="visitTopicDesc">
           </td>
        </tr>
        <tr>
           <td width="150" style="text-indent:15px;line-height: 30px;">计划日期：</td>
		   <td id="visitTimeDesc" name="visitTimeDesc">
		   </td>
        </tr>
        <tr>
            <td width="150px;" style="text-indent: 15px;line-height: 30px;">拜访完成日期：</td>
			<td id="visitEndTimeDesc" name ="visitEndTimeDesc">
			</td>
        </tr>
        <tr>
           <td width="150px;" style="text-indent: 15px;line-height: 30px;">负责人：</td>
			<td name="managePersonName" id="managePersonName">
			</td>
        </tr>
        <tr>
		    <td width="150" style="text-indent:15px;line-height: 30px;">拜访状态：</td>
		    <td name="visitStatusDesc" id="visitStatusDesc">
		    </td>
	   </tr>
	    <tr>
		    <td width="150" style="text-indent:15px;line-height: 30px;">拜访名称：</td>
		    <td name="visitName" id="visitName">
		    </td>
	   </tr>
	 </table>
	  </br>
	  
 <table style="width: 100%;">
    <tr>
		   <td class=TableHeader colSpan=2 noWrap>
		       <img src="<%=contextPath %>/common/zt_webframe/imgs/zsjl/ggtxb/icon_fenzu.png" alt="" style="vertical-align:text-top;"/>
		       &nbsp;<span style="font-size: 16px;line-height: 16px;color: #0050aa;font-family: 'MicroSoft YaHei';">其他</span>
		       <span style="padding-top: 10px;padding-bottom: 5px;" class="basic_border_grey fl"></span>
		       
		   </td>
	</tr>
	
	<tr>
			<td width="150" style="text-indent:15px;line-height: 30px;">创建人：
			</td>
		    <td name="createUserName" id="createUserName">
            </td>
	</tr>
	<tr>
			<td width="150" style="text-indent:15px;line-height: 30px;">创建时间：
			</td>
		    <td name="createTimeDesc" id="createTimeDesc">
            </td>
	</tr>
	<tr>
			<td width="150" style="text-indent:15px;line-height: 30px;">最后变化时间：
			</td>
		    <td name="lastEditTimeDesc" id="lastEditTimeDesc">
            </td>
	</tr>

</table>

</body>

</html>