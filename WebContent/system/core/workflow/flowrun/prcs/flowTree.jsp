<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="background:#f0f0f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/ztree.jsp" %>
<title>流程树</title>
</head>
<script type="text/javascript">
function doInit(){
	getFileTree();
}


function getFileTree(){
	var url =  contextPath+"/workQuery/getFlowType2SelectCtrl.action";
	var config = {
			zTreeId:"selectFlowTypeZtree",
			requestURL:url,
           	onClickFunc:onClickTree,
			async:false
			
		};
	zTreeObj = ZTreeTool.config(config); 	
}

/**
 *  点击
 */
function onClickTree(event, treeId, treeNode) {
	//alert(treeId + " treeNode>>" + treeNode);
	var sid = treeNode.id;
	var folderName = treeNode.name;
	//alert(sid + " folderName>>" + folderName);
	parent.$("#flowId").val(sid);
	parent.$("#flowName").val(folderName);
	parent.$("#flowDiv").hide();
	
}
</script>


<body onload="doInit();" style="background-color: #f2f2f2;">
 <ul id="selectFlowTypeZtree" class="ztree" style="overflow-x:hidden;border:0px;width:98%;"></ul>
 
 <form id="form1" name="form1" action="" method="post">
 	<input type="hidden" id="flowId" name="flowId" value=""/>
 	<input type="hidden" id="flowName" name="flowName" value=""/>
 </form>
 
 
 
</body>
</html>