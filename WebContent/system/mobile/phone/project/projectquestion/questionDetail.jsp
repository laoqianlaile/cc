<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   //问题主键
   int sid=TeeStringUtil.getInteger(request.getParameter("sid"), 0);
%>

<!DOCTYPE HTML>
<html>
<head>
<title>项目问题</title>
<%@ include file="/system/mobile/mui/header.jsp" %>
<style>
#topPopover {
	position: fixed;
	top: 16px;
	right: 6px;
	width: 120px;
}
#topPopover .mui-popover-arrow {
	left: auto;
	right: 6px;
}

.app-row{
	margin-left:14px;
	padding-top:10px;
	padding-right:10px;
	padding-bottom:10px;
	border-bottom:1px solid #f0f0f0;
}
.app-row br{
	margin:0px;
}
.app-row-content{
	margin-left:14px;
	padding-top:10px;
	padding-right:10px;
	padding-bottom:10px;
	border-bottom:1px solid #f0f0f0;
	color:gray;
}

</style>
</head>

<script type="text/javascript">
//问题主键
var sid=<%=sid%>;
//初始化方法
function doInit(){
	getInfoBySid();
}

//获取详情
function getInfoBySid(){
	var url=contextPath+"/projectQuestionController/getInfoBySid.action";
	mui.ajax(url,{
		type:"POST",
		dataType:"JSON",
		data:{sid:sid},
		timeout:10000,
		async:false,
		success:function(text){
			var json = eval("("+text+")");
			if(json.rtState){	
				bindJsonObj2Cntrl(json.rtData);
				if(json.rtData.status==0){
					 $("#status").html("待处理");
					 $("#handleBtn").show();
				}else{
					 $("#status").html("已处理"); 
			    }
			}else{
				alert("数据获取失败！");
			}
		}
	});

}


//问题办理
function handle(){

   window.location.href="handle.jsp?sid="+sid;
}
</script>
<body onload="doInit()">
	<header class="mui-bar mui-bar-nav">
		<span class="mui-icon mui-icon-back" id="backBtn" onclick="history.go(-1)"></span>
		<h1 class="mui-title">问题详情</h1>
		<button id="handleBtn" class="mui-btn mui-btn-link mui-btn-nav mui-pull-right" onclick='handle()' style="display: none">办理</button>
	</header>
	<div id="muiContent" class="mui-content">
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>问题名称</label>
		</div>
		<div class="app-row-content" id="questionName" >
		</div>	
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>优先级</label>
		</div>
		<div class="app-row-content" id="questionLevel">
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>创建时间</label>
		</div>
		<div class="app-row-content" id="createTimeStr">
			
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>问题描述</label>
		</div>
		<div class="app-row-content" id="questionDesc">
			
		</div>
	</div>
    <div class="mui-input-group">
		<div class="mui-input-row">
			<label>问题状态</label>
		</div>
		<div class="app-row-content" id="status">
			
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>处理人</label>
		</div>
		<div class="app-row-content" id="operatorName">
			
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>处理结果</label>
		</div>
		<div class="app-row-content" id="result">
			
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>处理时间</label>
		</div>
		<div class="app-row-content" id="handleTimeStr">
			
		</div>
	</div>
</div>


</body>
</html>