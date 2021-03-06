<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<%@ include file="/header/ztree.jsp" %>
<%@ include file="/header/upload.jsp" %>
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
		height: 80px;
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
<% 
	String flowId = TeeStringUtil.getString(request.getParameter("flowId"), "");
%>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>待签收公文</title>
	
	<script type="text/javascript" charset="UTF-8">
	var contextPath = '<%=contextPath%>';
	var datagrid;
	var userDialog;
	var userForm;
	var passwordInput;
	var userRoleDialog;
	var userRoleForm;
	$(function() {
		query();
	});

	function doPageHandler(){
		query();
	}
	
	function query(){
		var para =  tools.formToJson($("#form")) ;
		var opts = [{field:'d.fwdw',
					title:'发文单位',
					sortable:true,
					width:50,
					formatter:function(a,data,c){
						return data.fwdw;
					}
				},
				{field:'d.recDept',
					title:'收文单位',
					sortable:true,
					width:50,
					formatter:function(a,data,c){
						return data.recDeptName;
					}
				},
				{field:'d.bt',
					title:'公文标题',
					width:200,
					sortable:true,
					formatter:function(a,data,c){
						return "<a href='javascript:void(0)' onclick=\"detail('"+data.uuid+"')\">"+data.bt+"</a>";
					}
				},
				{field:'d.zh',
					title:'字号',
					width:60,
					sortable:true,
					formatter:function(a,data,c){
						return data.zh;
					}
				},
				{field:'d.sendTime',
					title:'下发时间',
					width:60,
					sortable:true,
					formatter:function(a,data,c){
						return getFormatDateStr(data.sendTime,"yyyy-MM-dd HH:mm");
					}
				},{field:'_manage',
					title:'操作',
					ext:'@操作',
					width:60,
					formatter:function(value,rowData,rowIndex){
						var render = "";
						render+="<a href='javascript:void(0)' onclick=\"rec('"+rowIndex+"')\" >签收</a>";
						render+="&nbsp;<a href='javascript:void(0)' class='modal-menu-test' onclick=\"$(this).modal();notRec('"+rowIndex+"')\" >拒签</a>";
						return render;
					}
				}];

		datagrid = $('#datagrid').datagrid({
			url:'<%=contextPath%>/doc/DaiShou.action?type=0&flowId=<%=flowId%>',//待签收
			view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
		    toolbar : '#toolbar',
			queryParams:para,
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ],
			fit : true,
			fitColumns : true,
			nowrap : true,
			border : false,
			idField : 'id',
			sortOrder: 'desc',
			striped: true,
			remoteSort: true,
			singleSelect:true,
			columns:[opts],
			pagination:true,
			onLoadSuccess:function(){
				$('#datagrid').datagrid("unselectAll");
			}
		});
	}
	
	function detail(uuid){
		var url = contextPath+"/system/subsys/doc/daishou/print/index.jsp?uuid="+uuid;
		openFullWindow(url,"公文详情");
	}
	
	//签收
	function rec(rowIndex){
		var rows = $('#datagrid').datagrid('getRows');
		var uuid = rows[rowIndex].uuid;
		var bt = rows[rowIndex].bt;
		
		$.MsgBox.Confirm ("提示", "确认要签收 "+bt+" 吗？", function(){
			tools.requestJsonRs(contextPath+"/doc/updateRecFlag.action?flag=1&uuid="+uuid);
			$.MsgBox.Alert_auto("签收成功！");
			$("#datagrid").datagrid("reload");   
		  });
	}
	
	function notRec(rowIndex){
		var rows = $('#datagrid').datagrid('getRows');
		var uuid = rows[rowIndex].uuid;
		var bt = rows[rowIndex].bt;
		$("#btName").html(bt);
		$("#remark").val("");
		$("#uuid").val(uuid);
		/* $("#myModal").modal("show"); */
	}
	
	function doNotRec(){
		tools.requestJsonRs(contextPath+"/doc/updateRecFlag.action?flag=2&uuid="+$("#uuid").val(),{remark:$("#remark").val()});
		$.MsgBox.Alert_auto("拒签成功！");
		$("#datagrid").datagrid("reload");
		//关闭modal窗口
		$(".modal-win-close").click();
		/* $("#myModal").modal("hide"); */
	}
	</script>
</head>
<body fit="true">

<table id="datagrid" fit="true"></table>
<div id="toolbar" class="clearfix">
  <div class="fl left setHeight">
     <form id="form">
		<table class="SearchTable">
			<tr>
				<td class="SearchTableTitle">公文标题：</td>
				<td><input type="text" name="bt" style="width:150px;height: 23px" class="BigInput"/></td>
				<td class="SearchTableTitle">&nbsp;&nbsp;发文单位：</td>
				<td><input type="text" name="fwdw"  style="width:150px;height: 23px" class="BigInput"/></td>
				<td class="SearchTableTitle">&nbsp;&nbsp;文号：</td>
				<td><input type="text" name="zh"  style="width:150px;height: 23px" class="BigInput"/></td>
				<td>&nbsp;&nbsp;<button type="button"  onclick="query()" class="btn-win-white">查询</button></td>
			</tr>
		</table>
	</form>
  </div>
	
</div>


 <!-- Modal -->
 <div class="modal-test">
	<div class="modal-header">
		<p class="modal-title">
			拒签确认
		</p>
		<span class="modal-win-close">×</span>
	</div>
	<div class="modal-body" id="mailBoxForm">
		<ul>
			<li class="clearfix">
				<span>拒签意见：&nbsp;&nbsp;</span>
				<textarea id="remark" class="BigTextarea" style="width:400px;height:60px"></textarea>
        	    <input type="hidden" id="uuid" />
			</li>
		</ul>
	</div>
	<div class="modal-footer clearfix">
		<input class = "modal-btn-close btn-alert-gray" type="button" value = '关闭'/>
		<input class = "modal-save btn-alert-blue" type="button" onclick="doNotRec();" value = '确定'/>
	</div>
</div>


</body>
</html>