<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>信息上报</title>
<%@ include file="/system/mobile/mui/header.jsp" %>
<style>
	.mui-media-body{
		line-height:42px;
	}
</style>
</head>
<body>
		<header class="mui-bar mui-bar-nav">
			<span class="mui-icon mui-icon-back" onclick="CloseWindow()"></span>
			<h1 class="mui-title">信息上报</h1>
		</header>
		<div class="mui-content">
			<div id="wrapper">
				<ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media">
					<a href="myReport/index.jsp" class="">
						<img class="mui-media-object mui-pull-left" src="imgs/icon_wdsb.png">
						<div class="mui-media-body">
							我的上报
						</div>
					</a>
				</li>
				<li class="mui-table-view-cell mui-media">
					<a href="query/index.jsp" class="">
						<img class="mui-media-object mui-pull-left" src="imgs/icon_sbxxcx.png">
						<div class="mui-media-body">
							上报信息查询
						</div>
					</a>
				</li>
				
			</ul>
			</div>
		</div>
</body>
</html>