<%@page import="com.tianee.webframe.util.str.TeeUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id") == null ? "0" : request.getParameter("id") ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加通讯组</title>
	<%@ include file="/header/header2.0.jsp" %>
	<%@ include file="/header/easyui2.0.jsp" %>
	<%@ include file="/header/validator2.0.jsp"%>
	<script type="text/javascript" src="<%=contextPath%>/common/My97DatePicker/WdatePicker.js"></script>
<style>
#timesTips{
	color:#ffa800;
	font-weight:bold;
	margin-left:5px;
}
.time_info{
	line-height:30px;
	font-weight:bold;
}
.info img,.info span{
	vertical-align:middle;
}
table{
	border-collapse: collapse;
/*     border: 1px solid #f2f2f2; */
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
	/*font-weight:bold;*/
}
table tr:first-child{
	/* background-color: #f8f8f8;  */
}
</style>
<script type="text/javascript">

var id = '<%=id%>';
var groupId;
function doInit(){
	getAddressGroup();
	loadData(id);
	
	
}

function loadData(id){
	var url = "<%=contextPath%>/teeAddressController/getAddressById.action";
	var jsonRs = tools.requestJsonRs(url,{"id":id});
	if(jsonRs.rtState){
		var data = jsonRs.rtData;
		groupId =data.groupId;
		if(data){
			bindJsonObj2Cntrl(data);
		}
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
}
/**
 * 保存
 */
function doSave(){
	if (checkForm()){
		var url = "<%=contextPath%>/teeAddressController/updateAddress.action";
		var para =  tools.formToJson($("#form1")) ;
		var jsonRs = tools.requestJsonRs(url,para);
		if(jsonRs.rtState){
			 //top.$.jBox.tip("更新成功！");
			 $.MsgBox.Alert_auto('更新成功！');
			 //history.go(-1);
			window.location.href ="<%=contextPath%>/system/core/base/address/private/address/addressList.jsp?groupId="+groupId;
		}else{
			//$.MsgBox.Alert('提示',jsonRs.rtMsg);
			$.MsgBox.Alert_auto(jsonRs.rtMsg);
		}
	}
}

function checkForm(){
    return $("#form1").valid(); 
}



function getAddressGroup(){
	var url = "<%=contextPath%>/teeAddressGroupController/getAddressGroups.action";
	var para = {};
	var jsonRs = tools.requestJsonRs(url,para);
	if(jsonRs.rtState){
		createSelect(jsonRs.rtData);
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
}

function createSelect(rtData){
	var selectObj =$("#groupId");
	//$("<select name='groupId' ></select>");
	$.each(rtData,function(i,v){
	     var vOption=document.createElement("option");
	     vOption.setAttribute("value",v.seqId);
	     vOption.appendChild(document.createTextNode(v.groupName));
	     selectObj.append($(vOption));
	});
}
</script>
 
</head>
<body onload="doInit()" style="overflow:auto;padding:0 10px;box-sizing:border-box;">
<div class="topbar clearfix" style='padding:0!important;border-bottom:none!important;'>
	<table style="width:100%">
		<tr>
		    <td><b><i class="glyphicon glyphicon-sound-stereo"></i>编辑联系人</b></td>
			<td>
			    
				<input type="button" value="返回" class="btn-win-white fr" title="返回" onClick="history.go(-1);" style="margin-right:70px;margin-top:6px;">&nbsp;&nbsp;
				<input type="button" value="保存" class="btn-win-white fr" title="保存" onclick="doSave()" style="margin-right:10px;margin-top:6px;"> 
			</td>
			<td align=right>
				
			</td>
		</tr>
		
	</table>
	<span class='basic_border' style="margin-top:0;"></span>
</div>

<div class="time_info">
	<form  method="post" name="form1" id="form1" >
		<table class="none-table" style="width:100%">
			<tr>
				<TD class=TableHeader colSpan=2 noWrap>
					<fieldset>
						<legend style="margin-left:-10px;"><img src="/common/zt_webframe/imgs/grbg/grtxb/icon_修改密码.png">&nbsp;&nbsp;分组</legend>
					</fieldset>
				</TD>	
			</tr>
			<tr>
		    <td nowrap class="TableData" width="120" >分组：</td>
		    <td nowrap class="TableData" align="left" id="groupSelect" >
			    <select name="groupId" id="groupId" class="BigSelect">
			    </select>
		    </td>
		   </tr>
		   <tr>
				<TD class=TableHeader colSpan=2 noWrap>
					<fieldset>
						<legend style="margin-left:-10px;"><img src="/common/zt_webframe/imgs/grbg/grtxb/icon_修改密码.png">&nbsp;&nbsp;个人信息</legend>
					</fieldset>
				</TD>
			</tr>
		   <tr>
		    <td nowrap class="TableData" width="120" >排序号：</td>
		    <td nowrap class="TableData" align="left">
		        <input type='text' name="psnNo" id="psnNo" class="easyui-validatebox BigInput"  size='5' required="true"  maxlength="5"  validType='positivIntege[]'/>
		    </td>
		   </tr>
		   <tr>
		    <td nowrap class="TableData" width="120">姓名：</td>
		    <td nowrap class="TableData" align="left">
		        <input type='text' name="psnName" id="psnName" class="easyui-validatebox BigInput" maxlength="50"  size="20" required="true" />
		    </td>
		   </tr>
		   <tr>
		    <td nowrap class="TableData" width="120">性别：</td>
		    <td nowrap class="TableData" align="left">
		       <select id="sex" name="sex" class="BigSelect">
		       			<option value="0">男</option>
		       		    <option value="1">女</option>
		       </select>
		    </td>
		   </tr>
		   <tr>
				<td nowrap class="TableData" width="120">生日：</td>
				<td nowrap class="TableData">
				<input type="text" name="birthday" id="birthday" size="16" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate BigInput">
				</td>
			</tr>
		   <tr>
				<td nowrap class="TableData" width="120">昵称：</td>
				<td nowrap class="TableData">
				<input type='text' name="nickName" id="nickName"  class="easyui-validatebox BigInput" maxlength="50"  size="20"  />
				</td>
			</tr>
			 <tr>
				<td nowrap class="TableData" width="120">职务：</td>
				<td nowrap class="TableData">
				<input type='text' name="ministration"  id="ministration"  class="easyui-validatebox BigInput" maxlength="50"  size="20"  />
				</td>
			</tr>
			<tr>
				<TD class=TableHeader colSpan=2 noWrap>
					<fieldset>
					    <legend style="margin-left:-10px;"><img src="/common/zt_webframe/imgs/grbg/grtxb/icon_修改密码.png">&nbsp;&nbsp;联系方式（单位）</legend>
					</fieldset>
				</TD>
			</tr>
			 <tr>
				<td nowrap class="TableData" width="120">单位名称：</td>
				<td nowrap class="TableData">
				<input type='text' name="deptName"  id="deptName" class="easyui-validatebox BigInput" maxlength="50"  size="20"  />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">单位地址：</td>
				<td nowrap class="TableData">
				<input type='text' name="addDept"   id="addDept"  class="easyui-validatebox BigInput" maxlength="100"  size="45" />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">邮编：</td>
				<td nowrap class="TableData">
				<input type='text' name="postNoDept" id="postNoDept"  class="easyui-validatebox BigInput" maxlength="50"  size="20"  />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">工作电话：</td>
				<td nowrap class="TableData">
				<input type='text' name="telNoDept"  id="telNoDept"  class="easyui-validatebox BigInput" maxlength="50"  size="20" />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">工作传真：</td>
				<td nowrap class="TableData">
				<input type='text' name="faxNoDept" id="faxNoDept" class="easyui-validatebox BigInput" maxlength="50"  size="20" />
				</td>
			</tr>
			<tr>
				<TD class=TableHeader colSpan=2 noWrap>
					<fieldset>
						<legend style="margin-left:-10px;"><img src="/common/zt_webframe/imgs/grbg/grtxb/icon_修改密码.png">&nbsp;&nbsp;联系方式（个人）</legend>
					</fieldset>
				</TD>
			</tr>
			
			<tr>
				<td nowrap class="TableData" width="120">个人住址：</td>
				<td nowrap class="TableData">
				<input type='text' name="addHome" id="addHome" class="easyui-validatebox BigInput" maxlength="50"  size="50" />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">个人邮编：</td>
				<td nowrap class="TableData">
				<input type='text' name="postNoHome" id="postNoHome" class="easyui-validatebox BigInput" maxlength="50"  size="20" />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">个人电话：</td>
				<td nowrap class="TableData">
				<input type='text' name="telNoHome" id="telNoHome" class="easyui-validatebox BigInput" maxlength="50"  size="20" />
				</td>
			</tr>
			<tr>
				<td nowrap class="TableData" width="120">手机：</td>
				<td nowrap class="TableData">
				<input type='text' name="mobilNo" id="mobilNo"  class="easyui-validatebox BigInput" maxlength="50"  size="20"/>
				</td>
			</tr>
	<tr>
		<td nowrap class="TableData" width="120">邮箱：</td>
		<td nowrap class="TableData">
		<input type='text' name="email" id="email"   class="easyui-validatebox BigInput" maxlength="50"  size="20" />
		</td>
	</tr>
	<tr>
		<td nowrap class="TableData" width="120">QQ号码：</td>
		<td nowrap class="TableData">
		<input type='text' name="oicqNo" id="oicqNo" class="easyui-validatebox BigInput" maxlength="50"  size="20"  />
		</td>
	</tr>
	<tr>
		<TD class=TableHeader colSpan=2 noWrap>
			<fieldset>
				<legend style="margin-left:-10px;"><img src="/common/zt_webframe/imgs/grbg/grtxb/icon_修改密码.png">&nbsp;&nbsp;备注</legend>
			</fieldset>
		</TD>
	</tr>
	<tr>
	    <td nowrap class="TableData" width="120" >备注：</td>
		<TD class=TableHeader colSpan=2 noWrap>
			<textarea name="notes" id="notes"  class="BigTextarea" id="notes" rows="5" cols="60" wrap="on"></textarea>
		</TD>
	</tr>
	
	
	 <tr>
	    <td nowrap  class="TableControl" colspan="2" align="center">
	        <input type='hidden'  name="id" value="<%=id %>"  />
	        <input type='hidden' value='<%=id %>' name='sid'/>
	    </td>
   </tr>
</table>

</form>
</div>
</body>
</html>
 