<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   //反馈主键
   int sid=TeeStringUtil.getInteger(request.getParameter("sid"), 0);
   //任务主键
   int supId=TeeStringUtil.getInteger(request.getParameter("supId"), 0);
   
   String option=TeeStringUtil.getString(request.getParameter("option"),"wjs");
   
%>

<!DOCTYPE HTML>
<html>
<head>
<title>反馈详情</title>
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
//反馈主键
var sid=<%=sid %>;
//任务主键
var supId=<%=supId %>;

var option="<%=option%>";

//初始化方法
function doInit(){
	getInfoBySid();
	
	//回复列表
	a2.addEventListener("tap",function(){
		window.location = "fbReplyRecords.jsp?fbId="+sid+"&&supId="+supId+"&&option="+option;
	});
	
	
	//返回
	backBtn.addEventListener("tap",function(){
		window.location = "feedBackRecords.jsp?supId="+supId+"&&option="+option;
	});
}


//获取详情
function getInfoBySid(){
	var url=contextPath+"/supFeedBackController/getInfoBySid.action";
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
			}else{
				alert("数据获取失败！");
			}
		}
	});

}




</script>
<body onload="doInit()">
	<header class="mui-bar mui-bar-nav">
		<span class="mui-icon mui-icon-back" id="backBtn" onclick=""></span>
		<h1 class="mui-title">反馈详情</h1>
	</header>
	<div id="muiContent" class="mui-content">
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>反馈标题</label>
		</div>
		<div class="app-row-content" id="title" >
		</div>	
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>反馈内容</label>
		</div>
		<div class="app-row-content" id="content">
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>反馈人</label>
		</div>
		<div class="app-row-content" id="createrName">
			
		</div>
	</div>
	<div class="mui-input-group">
		<div class="mui-input-row">
			<label>反馈时间</label>
		</div>
		<div class="app-row-content" id="createTimeStr" >
		
		</div>
	</div>
	
</div>

<nav class="mui-bar mui-bar-tab" id="footerDiv"  >
		<a id="a1" class="mui-tab-item mui-active" style="font-weight:bold">
			<span class="mui-tab-label" >基本详情</span>
		</a>
		<a id="a2" class="mui-tab-item mui-active" onclick="">
			<span class="mui-tab-label" >回复列表</span>
		</a>
</nav>
<br/><br/><br/>	
</body>
</html>