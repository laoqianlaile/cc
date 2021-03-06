<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>收件箱</title>
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/system/core/email/css/email.css">
<style>
	.modal-test{
		width: 564px;
		height: 230px;
		position: absolute;
		display: none;
		z-index: 999;
	}
	.modal-test .modal-header{
		width: 100%;
		height: 50px;
		background-color:#8ab0e6;
	}
	.modal-test .modal-header .modal-title{
		color: #fff;
		font-size: 16px;
		line-height:50px;
		margin-left:20px;
		float: left;
	}
	.modal-test .modal-header .modal-win-close{
		color:#fff;
		font-size: 16px;
		line-height:50px;
		margin-right:20px;
		float: right;
		cursor: pointer;
	}
	.modal-test .modal-body{
		width: 100%;
		height: 120px;
		background-color:#f4f4f4;
	}
	.modal-test .modal-body ul{
		overflow: hidden;
		clear:both;
	}
	.modal-test .modal-body ul li{
		width: 510px;
		height: 30px;
		line-height: 30px;
		margin-top: 25px;
		margin-left: 20px;
	}
	.modal-test .modal-body ul li span{
		display: inline-block;
		float:left;
		vertical-align: middle;
	}
	.modal-test .modal-body ul li input{
		display: inline-block;
		float: right;
		width: 400px;
		height: 25px;
	}
	.modal-test .modal-footer{
		width: 100%;
		height: 60px;
		background-color:#f4f4f4;
	}
	.modal-test .modal-footer input{
		margin-top:12px;
		float: right;
		margin-right:20px;
	}
</style>


<!-- jQuery 布局器 -->
<script type="text/javascript" src="<%=contextPath%>/system/core/email/js/email.js?v=1"></script>
<script>

var datagrid ;
function doInit(){
	datagrid = $('#datagrid').datagrid({
		url:contextPath + "/emailController/getEmailListByType.action?optFlag=1",
		view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
		pagination:true,
		singleSelect:false,
		toolbar:'#toolbar',//工具条对象
		checkbox:false,
		border:false,
		//idField:'formId',//主键列
		fitColumns:true,//列是否进行自动宽度适应
		columns:[[
			{field:'sid',checkbox:true,title:'ID',width:200},
			{field:'fromUserName',title:'发件人',width:120,formatter:function(value,rowData,rowIndex){
				if(rowData.ifWebMail != "0"){
					value = rowData.fromWebMail;
				}
				if(value.length>45){
					value = value.substring(0,45) + "……";
				}
				var emailImg = "<img src='<%=stylePath%>/imgs/message_open.gif'/>&nbsp;";
				var attachImg = "&nbsp;&nbsp;";
				var readFlagStr = rowData.readFlag;
				if(readFlagStr =="0"){
					value = "<strong>" + value + "</strong>";
					emailImg = "<img src='<%=stylePath%>/imgs/message.gif'/>&nbsp;";
				}
				if(rowData.attachMentModel.length>0){
					attachImg = "<span class='glyphicon glyphicon-paperclip' />&nbsp;";
				}
				return emailImg + attachImg + "<a href='#' onclick='readEmailByMailId(" + rowData.sid + ")'>" + value + "</a>";
			}},
			{field:'subject',title:'主题',width:200,formatter:function(value,rowData,rowIndex){
				var readFlagStr = rowData.readFlag;
				var level = rowData.emailLevelDesc;
				var levelDesc = "";
				if(readFlagStr =="0"){
					value = "<strong>" + value + "</strong>";
				}
				if(level!=null&&level!=""){
					if(level!="普通"){
						levelDesc = "<span style='color:red;'>（"+level+"）</span>&nbsp;&nbsp;"; 
					}else{
						levelDesc = "<span>（"+level+"）</span>&nbsp;&nbsp;";
					}
				}else{
					levelDesc = "<span></span>&nbsp;&nbsp;"; 
				}
				return levelDesc+"<a href='#' onclick='readEmailByMailId(" + rowData.sid + ")'>" + value  + "</a>";
			}},
			{field:'sendTimeStr',title:'时间',width:80,sortable:true}
		]],onLoadSuccess:onLoadSuccessFunc
	});
	getEmailBoxList();

}

function onLoadSuccessFunc(){
	var data=$('#datagrid').datagrid('getData');
	$("#totalMail").text("(共" + data.total +"封)");
}

function exportEml(){
	var ids = getSelectItem();
	if(ids.length==0){
		$.MsgBox.Alert_auto("未选中任何邮件！");
		return ;
	}	
	//alert(contextPath);
	$("#exportIframe").attr("src",contextPath+"/mail/exportEml.action?mailIds="+ids);
}



</script>
</head>
<body onload="doInit()" style="font-size:12px;padding-left: 10px;padding-right: 10px">

<div id="toolbar" class = "topbar clearfix">
	<div class="fl" style="position:static;">
		<img id="img1" class = 'title_img' src="<%=contextPath %>/common/zt_webframe/imgs/grbg/gryj/icon_shoujianxiang.png">
		<span class="title">收件箱 <span id="totalMail" class="attach"></span></span>
	</div>
	<div class = "right fr clearfix">
		<input type="button" class="btn-del-red fl" onclick="delEmailById()" value="删除"/>
		<input type="button" class="btn-del-red fl" onclick="batchDestroyMails()" value="彻底删除"/>
		<input type="button" class="btn-win-white fl" onclick="setAllEmailReadFlag();" value="全部标记为已读"/>
		
		<div class="btn-group fl">
		  <button type="button" class="btn-win-white btn-menu" >
		    标记为<span class="caret-down"></span>
		  </button>
		  <ul class="btn-content" >
		    <li onclick="setEmailReadFlag(1);"><a href="javascript:void(0);" >已读邮件</a></li>
		    <li onclick="setEmailReadFlag(0);"><a href="javascript:void(0);" >未读邮件</a></li>
		    <li style="display:none;" class="divider"></li>
		    <li style="display:none;"><a href="#">星标邮件</a></li>
		    <li style="display:none;"><a href="#">取消星标</a></li>
		  </ul>
		</div>
		
		<div class="btn-group fl">
		  <button type="button" class="btn-win-white btn-menu">
		    移动到<span class="caret-down"></span>
		  </button>
		  <ul class="btn-content" id="mailBoxList">
		    <li style="display:none;"><a href="#">收件箱</a></li>
		    <li style="display:none;"><a href="#">已发送</a></li>
		  </ul>
		</div>
		<input type="button" class="btn-win-white fl" onclick="exportEml();" value="导出"/>
		<!-- <button type="button email_opt_float" class="btn btn-one" onclick="setWebMail();">设置外部发信箱</button> -->
		<div style="clear:both;"></div>
</div>
</div>
<table id="datagrid" fit="true"></table>
<iframe id="exportIframe" style="display:none"></iframe>
 <!-- Modal -->
 <div class="modal-test">
	<div class="modal-header">
		<p class="modal-title">
			新建邮件箱
		</p>
		<span class="modal-win-close">×</span>
	</div>
	<div class="modal-body" id="mailBoxForm">
		<ul>
			<li class="clearfix">
				<span>邮件箱名称:</span>
				<input type="text" id="boxInput" name="boxInput" />
			</li>
			<li class="clearfix">
				<span>序号:</span>
				<input type="text"  id="boxNo" name="boxNo"/>
			</li>
		</ul>
	</div>
	<div class="modal-footer clearfix">
		<input class = "modal-btn-close btn-alert-gray" type="button" value = '关闭'/>
		<input class = "modal-save btn-alert-blue" type="button" onclick="submitNewFolder();" value = '保存'/>
	</div>
</div>
</body>
</html>