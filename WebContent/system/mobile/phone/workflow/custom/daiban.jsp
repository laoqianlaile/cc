<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tianee.webframe.util.global.TeeSysProps"%>
<%@ page import="com.tianee.oa.oaconst.TeeModuleConst"%>
<!DOCTYPE HTML>
<html>
<head>
<title>我的待办</title>
<script>
var DING_APPID = "<%=TeeModuleConst.MODULE_SORT_DD_APP_ID.get("006")%>";
</script>
<%@ include file="/system/mobile/mui/header.jsp" %>
<%
	String flowTypeId = TeeStringUtil.getString(request.getParameter("flowTypeId"));
%>
<style>

</style>
</head>
<body>
        <header class="mui-bar mui-bar-nav">
			<span class="mui-icon mui-icon-back" id="backBtn"></span>
			<h1 class="mui-title">我的待办</h1>
		</header>
	<!--下拉刷新容器-->
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<!--数据列表-->
				<ul class="mui-table-view" id="list">
					
				</ul>
			</div>
		</div>
		
	<script>
		var page = 1;
		mui.init({
			pullRefresh: {
				container: '#pullrefresh',
				down: {
					callback: pulldownRefresh
				},
				up: {
					contentrefresh: '正在加载...',
					callback: pullupRefresh
				}
			}
		});
		
		/**
		 * 下拉刷新具体业务实现
		 */
		function pulldownRefresh() {
			page = 1;
			var url =contextPath+"/mobileWorkflow/getMyWorkList.action?flowId=<%=flowTypeId%>";
			mui.ajax(url,{
				type:"post",
				dataType:"html",
				data:{state:-1,rows:20,page:page++},
				timeout:10000,
				success:function(json){
					mui('#pullrefresh').pullRefresh().endPulldownToRefresh(false);
					json = eval("("+json+")");
					var render = [];
					for(var i=0;i<json.rows.length;i++){
						var item = json.rows[i];
						var readType = item.readType;
						render.push("<li class=\"mui-table-view-cell mui-media\" runId=\""+item.runId+"\" frpSid=\""+item.frpSid+"\" flowId=\""+item.flowId+"\">");
						
						render.push("<div class=\"mui-media-body  mui-slider-handle\">");
						render.push("<p class='mui-ellipsis' style='color:#000;font-size:14px'>");
						if(readType=="0"){
							render.push("<img src='readflag.png' style='height:15px'/>");
						}
						render.push("<span>["+item.runId+"]&nbsp;"+item.flowName+"</span></p>");
						render.push("<p style='font-size:12px'>"+item.runName+"</p>");
						render.push("<p style='font-size:12px'>"+item.prcsDesc+"</p>");
						render.push("</div>");
						
						render.push("<div class='mui-slider-right mui-disabled'>");
						render.push("<a class='mui-btn mui-btn-red qs' runId="+item.runId+" doDelete="+item.doDelete+" >删除</a>");   
						render.push("</div>");
						
						
						render.push("</li>");
					}
					$("#list").html(render.join(""));
					
					$(".mui-table-view-cell").each(function(i,obj){
						obj.removeEventListener("tap",detail);
						obj.addEventListener("tap",detail);
					});
					
					//删除
					$(".qs").each(function(i,obj){
						obj.removeEventListener("tap",del);
						obj.addEventListener("tap",del);
					});
				},
				error:function(){
					
				}
			});
			
		}
		
		/**
		 * 上拉加载具体业务实现
		 */
		function pullupRefresh() {
			var url = contextPath+"/mobileWorkflow/getMyWorkList.action?flowId=<%=flowTypeId%>";
			mui.ajax(url,{
				type:"post",
				dataType:"html",
				data:{state:-1,rows:20,page:page++},
				timeout:10000,
				success:function(json){
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
					json = eval("("+json+")");
					var render = [];
					for(var i=0;i<json.rows.length;i++){
						var item = json.rows[i];
						var readType = item.readType;
						render.push("<li class=\"mui-table-view-cell mui-media\" runId=\""+item.runId+"\" frpSid=\""+item.frpSid+"\" flowId=\""+item.flowId+"\">");
						
						render.push("<div class=\"mui-media-body mui-slider-handle\">");
						render.push("<p class='mui-ellipsis' style='color:#000;font-size:14px'>");
						if(readType=="0"){
							render.push("<img src='readflag.png' style='height:15px'/>");
						}
						render.push("<span>["+item.runId+"]&nbsp;"+item.flowName+"</span></p>");
						render.push("<p style='font-size:12px'>"+item.runName+"</p>");
						render.push("<p style='font-size:12px'>"+item.prcsDesc+"</p>");
						render.push("</div>");
						
						render.push("<div class='mui-slider-right mui-disabled'>");
						render.push("<a class='mui-btn mui-btn-red qs' runId="+item.runId+" doDelete="+item.doDelete+" >删除</a>");   
						render.push("</div>");
						
						render.push("</li>");
					}
					$("#list").append(render.join(""));
					
					$(".mui-table-view-cell").each(function(i,obj){
						obj.removeEventListener("tap",detail);
						obj.addEventListener("tap",detail);
					});
					
					//删除
					$(".qs").each(function(i,obj){
						obj.removeEventListener("tap",del);
						obj.addEventListener("tap",del);
					});
				},
				error:function(){
					
				}
			});
			
		}
		
		function del(){
			var obj = $(this);
			var runId = this.getAttribute("runId");
			var doDelete = this.getAttribute("doDelete");
			
			window.event.cancelBubble = true;

			if(doDelete!="删除"){
				alert("当前步骤下无法删除该流程！");
				return;
			}

			if(confirm("确定要删除？")){
				var url = contextPath+"/workflowManage/delRun.action?runId="+runId;
				$.ajax({
					url:url,
					type:"post",
					dataType:"TEXT",
					data:{},
					success:function(json){
						$("li[runId="+runId+"]").slideUp(100);
					}
				});
			}	
		}
		
		/**
		 * 跳转至查看详情界面
		 */
		function detail(){
			var runId = this.getAttribute("runId");
			var frpSid = this.getAttribute("frpSid");
			var flowId = this.getAttribute("flowId");
			//window.location = "../prcs/form.jsp?runId="+runId+"&frpSid="+frpSid+"&flowId="+flowId+"&flowTypeId=<%=flowTypeId%>";
			OpenWindow("流程办理","/system/mobile/phone/workflow/prcs/form.jsp?runId="+runId+"&frpSid="+frpSid+"&flowId="+flowId+"&flowTypeId=<%=flowTypeId%>",true);
		}
		
		var flowTypeId = "<%=flowTypeId%>";
		mui.ready(function() {
			window.history.forward(1);
			mui('#pullrefresh').pullRefresh().pullupLoading();
			
			backBtn.addEventListener("tap",function(){
				var  url = "customIndex.jsp?flowTypeId="+flowTypeId;
				window.location.href = url;
			});
			
		});
	</script>
</body>
</html>