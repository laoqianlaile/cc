<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<%@ include file="/header/header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	
	<title>流程管理</title>
	<script>
	</script>
</head>
<body style="overflow:hidden">
	<div style="position:absolute;top:0px;left:0px;bottom:0px;width:200px;border-right:1px solid #f0f0f0">
		<iframe id="left" src="left.jsp" frameborder=0 style="width:100%;height:100%"></iframe>
	</div>
	<div style="position:absolute;top:0px;left:201px;right:0px;bottom:0px;">
		<iframe id="right" src="new.jsp" frameborder=0 style="width:100%;height:100%"></iframe>
	</div
</body>
</html>