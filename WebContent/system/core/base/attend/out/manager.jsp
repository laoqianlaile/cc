<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp"%>
<%@ include file="/header/easyui2.0.jsp"%>
<title>外出管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=contextPath%>/system/core/base/attend/js/attend.js"></script>
<script type="text/javascript">
var datagrid;
/**
   初始化列表
 */
function doInit(){
	datagrid = $('#datagrid').datagrid({
		url:contextPath+"/attendOutManage/getOut.action",
		view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
		pagination:true,
		singleSelect:true,
		toolbar:'#toolbar',//工具条对象
		checkbox:false,
		border:false,
		//idField:'formId',//主键列
		fitColumns:true,//列是否进行自动宽度适应
		columns:[[
			/* {field:'sid',checkbox:true,title:'ID',width:100}, */
			{field:'createTimeStr',title:'申请时间',width:120},
			{field:'leaderName',title:'审批人员',width:100},
			{field:'startTimeStr',title:'开始时间',width:100},
			{field:'endTimeStr',title:'结束时间',width:100},
			{field:'days',title:'外出天数',width:100},
			{field:'outDesc',title:'外出原因',width:200,formatter:function(value,rowData,rowIndex){
				var str="<a href='javascript:void(0);' onclick='attendOutInfo(" + rowData.sid + ")' title='"+rowData.outDesc+"'>" +rowData.outDesc  + "</a>";
		        return str;	
			}},
			{field:'allowDesc',title:'审批状态',width:80,formatter:function(value,rowData,rowIndex){
				var allow = rowData.allow;
				var allowDesc= "待审批";
				if(allow == '1'){
					allowDesc = "已批准";
				}else if(allow == '2'){
					allowDesc = "未批准";
				}
				return allowDesc;
			}},
			{field:'ope_',title:'操作',width:160,formatter:function(value,rowData,rowIndex){
				var allow = rowData.allow;
				var opts = "<a href='javascript:void(0);' data-toggle=\"modal\" data-target=\"#myAffairModal\" onclick='toCreateOrUpdate(\"" + rowData.sid + "\");'> 编辑 </a>";      
				if(allow == "1"){
					opts = "&nbsp;&nbsp;<a href='javascript:void(0);' data-toggle=\"modal\" data-target=\"#myModal\" onclick='setOut(\"" + rowData.sid + "\");'> 外出归来</a>";
				}else{
					opts = opts+"&nbsp;&nbsp;<a href='javascript:void(0);' onclick='deleteAttendOut(\"" + rowData.sid + "\",this);'>删除 </a>";
				}
				return opts;
			}},
		]]});
	
}


/**
 * 填出新建日程
 */
function toCreateOrUpdate(id){
	if(id==0){//创建
		if(isOpenBisEngine(1)){
			createNewWork(1);
			return;
		}
	}
	
	var url = contextPath + "/system/core/base/attend/out/addOrUpdate.jsp?sid=" + id;
	bsWindow(url ,"外出申请",{width:"600",height:"240",buttons:[
		 {name:"保存",classStyle:"btn-alert-blue"},
	 	 {name:"关闭",classStyle:"btn-alert-gray"}
		 ],submit:function(v,h){
		var cw = h[0].contentWindow;
		if(v=="保存"){
			//cw.commit();
			var isStatus = cw.doSaveOrUpdate();
			if(isStatus){
				//window.location.reload();
				$.MsgBox.Alert_auto("操作成功！");
				datagrid.datagrid('reload');
				return true;
			}
		}else if(v=="关闭"){
			return true;
		}
	}});
}

function toHistory(){
	window.location.href = contextPath + "/system/core/base/attend/out/history.jsp";
}

/**
 * 外出归来
 */
function setOut(id){
	
	if(isOpenBisEngine(2)){
		
	}
	
	var url = contextPath + "/system/core/base/attend/out/comeback.jsp?sid=" + id;
	

	bsWindow(url ,"外出归来",{width:"600",height:"150",buttons:
		[
		 {name:"保存",classStyle:"btn-alert-blue"},
	 	 {name:"关闭",classStyle:"btn-alert-gray"}
		 ]
		,submit:function(v,h){
		var cw = h[0].contentWindow;
		if(v=="保存"){
			//cw.commit();
			var isStatus = cw.doComeBack();
			if(isStatus){
				//window.location.reload();
				$.MsgBox.Alert_auto("操作成功！");
				datagrid.datagrid('reload');
				return true;
			}
		}else if(v=="关闭"){
			//window.location.reload();
			return true;
		}
	}}); 
	
}
</script>
</head>
<body style="margin:0px;overflow:hidden" onload="doInit();">
<div id="toolbar" class = "clearfix">
   <div class="left fl setHeight">
	   <input type="button" value="外出申请" class="btn-win-white fr" onclick="toCreateOrUpdate(0);">
	   &nbsp;
	   <input type="button" value="外出历史记录" class="btn-win-white fr" onclick="toHistory();"> 
   </div> 
</div>
 
   <table id="datagrid" fit="true"></table>

</body>

</html>