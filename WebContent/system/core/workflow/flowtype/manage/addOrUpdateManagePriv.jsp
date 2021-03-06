<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String flowTypeId = request.getParameter("flowTypeId") == null ? "0" : request.getParameter("flowTypeId");
	String sid = request.getParameter("sid") == null? "": request.getParameter("sid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>新增或更新权限</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/header/header.jsp"%>
<%@ include file="/header/easyui.jsp"%>
<style type="text/css">
.imgMiddle{
	float:left;
	margin-top:5px;
}
.imgMiddleSpan{
	float:left;
	margin-top:4px;
}
</style>
<script type="text/javascript" src="<%=contextPath %>/common/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
var flowTypeId = '<%=flowTypeId%>';
var sid = '<%=sid%>';	
function doInit(){
	if(sid != "" && sid != '0'){
		var url = "<%=contextPath%>/flowPrivManage/getFlowPrivById.action";
		var para = {sid:sid};
		var jsonObj = tools.requestJsonRs(url,para);
		if(jsonObj.rtState){
			var json = jsonObj.rtData;
			if(json && json.sid){
			   bindJsonObj2Cntrl(json);
			   deptPostSet(json.privScope);
			   privTypeSet(json.privType);
			}
		}else{
			alert(jsonObj.rtMsg);
		}
	}
	
}

/**
 * 保存
 */
function doSave(){
	if (check()){
		var url = "<%=contextPath%>/flowPrivManage/addOrUpdate.action?flowTypeId=" + flowTypeId;
		var para =  tools.formToJson($("#form1")) ;
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			top.$.jBox.tip(jsonRs.rtMsg);
			return true;
		}else{
			top.$.jBox.tip(jsonRs.rtMsg,"error");
			return false;
		}
	}
	return false;
}

function check() {
	var privType = $("#privType").val();
	if(privType == ''){
		alert("权限类型时必填项！");
		return false ;
	}
	
	if($("#privUsersId").val()=="" && $("#privRolesId").val()=="" && $("#privDeptsId").val()==""){
		alert("请设置权限范围！");
		return false;
	}
	
	return true;
	
}

/**
 *设置管理权限为自定义
 */
function deptPostSet(value){
	if(value == '3'){
		$("#deptPostDiv").show();
	}else{
		
		$("#deptPostDiv").hide();
	}	
}
/**
 * 设置权限类型
 */
function privTypeSet(value){
	if(value == '1'){
		$("#privTypeDesc").html("管理权限（包含查询及监控权限），可执行的操作：转交、委托、结束、删除");
	}else if(value == '2'){
		$("#privTypeDesc").html("监控权限（包含查询权限），可执行的操作：转交、委托");
	}else{
		$("#privTypeDesc").html("");
	}
}
</script>

</head>
<body onload="doInit()">

<form  method="post" name="form1" id="form1" >
	<table class="TableBlock" width="800px" align="center">
   <tr>
    <td nowrap class="TableData TableBG"  align="center">权限设置：</td>
    <td nowrap class="TableData">
       <select id="privType" name="privType" onchange="privTypeSet(this.value)" class="BigSelect">
          <option value='1'>管理</option>
          <option value='2'>监控</option>
          <option value='3'>查询</option>
          <option value='4'>编辑</option>
          <option value='6'>公文分发反馈</option>
          <option value='7'>公文传阅反馈</option>
<!--           <option value='5'>点评</option> -->
       </select>
       <div  id="privTypeDesc">管理权限（包含查询及监控权限），可执行的操作：转交、委托、结束、删除</div>
    </td>
   </tr>
   <tr>
    <td nowrap class="TableData TableBG" align="center">权限范围:<br>(人员)</td>
    <td nowrap class="TableData">
    	<input type="hidden" name="privUsersId" id="privUsersId" value="">
    	<textarea name="privUsersName" id="privUsersName" style="width:290px;height:75px"  class="BigTextarea readonly" wrap="virtual" readonly></textarea>
		<a href="javascript:void(0);" class="orgAdd" onClick="selectUser(['privUsersId', 'privUsersName'])">添加</a>
		<a href="javascript:void(0);" class="orgClear" onClick="clearData('privUsersId', 'privUsersName')">清空</a>		
    </td>
    </tr>
    <tr>
    <td nowrap class="TableData TableBG" align="center">权限范围：<br>(部门)</td>
    <td nowrap class="TableData">
    	<input type="hidden" name="privDeptsId" id="privDeptsId" value="">
    	<textarea  name="privDeptsName" id="privDeptsName"  style="width:290px;height:75px" class="BigTextarea readonly" wrap="virtual" readonly></textarea>
		<a href="javascript:void(0);" class="orgAdd" onClick="selectDept(['privDeptsId', 'privDeptsName'])">添加</a>
		<a href="javascript:void(0);" class="orgClear" onClick="clearData('privDeptsId', 'privDeptsName')">清空</a>		
    </td>
   </tr>
   <tr>
    <td nowrap class="TableData TableBG" align="center">权限范围：<br>(角色)</td>
    <td nowrap class="TableData">
    	<input type="hidden" name="privRolesId" id="privRolesId" value="">
    	<textarea  name="privRolesName" id="privRolesName"  style="width:290px;height:75px"  class="BigTextarea readonly" wrap="virtual" readonly></textarea>
		<a href="javascript:void(0);" class="orgAdd" onClick="selectRole(['privRolesId', 'privRolesName'])">添加</a>
		<a href="javascript:void(0);" class="orgClear" onClick="clearData('privRolesId', 'privRolesName')">清空</a>		
    </td>
   </tr>
   
   
    <tr>
   		<td nowrap class="TableData TableBG" align="center">管理范围：<br>(以上权限设置在以下范围内有效)</td>
    	<td nowrap class="TableData">
              
               <select id="privScope" name="privScope"  onchange="deptPostSet(this.value)" class="BigSelect">
        		  <option value='0'>所有部门</option>
          		  <option value='1'>本部门，包含所有下级部门</option>
          		  <option value='2'>本部门</option>
         		  <option value='3'>自定义部门</option>
       			</select>
      	 	 <div style="display:none;" id="deptPostDiv">
		        <input type="hidden" name="deptPostId" id="deptPostId" value="">
		    	<textarea cols="45" name="deptPostName" id="deptPostName" rows="4" style="overflow-y: auto;" class="SmallStatic BigTextarea" wrap="yes" readonly></textarea>
				<a href="javascript:void(0);" class="orgAdd" onClick="selectDept(['deptPostId', 'deptPostName'])">添加</a>
				<a href="javascript:void(0);" class="orgClear" onClick="clearData('deptPostId', 'deptPostName')">清空</a>		
		 
       		 </div>
    	</td>
   </tr>
   					

  
   <tr>
    <td nowrap  class="TableControl" colspan="2" align="center" style="display:none">
        <input type="hidden" id="sid" name="sid"  value="0">
        <input type="button" value="保存" class="btn btn-primary" title="保存" onclick="doSave()" >&nbsp;&nbsp;
        <input type="button" value="返回" class="btn btn-primary" title="返回" onClick="history.go(-1);">
    </td>

</table>
  </form>
</body>
</html>
 