<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		String groupId = request.getParameter("groupId");
		String seqIds = request.getParameter("seqIds");
		if(groupId == null || "".equals(groupId)){
			groupId = "0";
		}
		
		String typeId = request.getParameter("typeId");
		typeId=typeId==null?"":typeId;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/header/header2.0.jsp" %>
	<%@ include file="/header/easyui2.0.jsp" %>

	<title>查看新闻</title>

	<script type="text/javascript" charset="UTF-8">
	var contextPath = '<%=contextPath%>';
	var datagrid;
	var userDialog;
	var userForm;
	var passwordInput;
	var userRoleDialog;
	var userRoleForm;
	var seqIds = '<%=seqIds%>';
	var groupId = '<%=groupId%>';
	var typeId='<%=typeId%>';
	var para = {};
	para['groupId'] = groupId;
	para['seqIds'] = seqIds;
	para['typeId'] = '<%=typeId%>';
	$(function() {
	
		datagrid = $('#datagrid').datagrid({
			url : contextPath + '/teeNewsController/getReadNews.action?state=0',
		//	toolbar : '#toolbar',
			title : '',
			iconCls : 'icon-save',
			pagination : true,
			pageSize : 10,
			view:window.EASYUI_DATAGRID_NONE_DATA_TIP,
			//pageList : [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ],
			fit : true,
			queryParams:para,
			fitColumns : true,
			nowrap : true,
			border : false,
			idField : 'sid',
			sortOrder: 'desc',
			striped: true,
			singleSelect:true,
			remoteSort: true,
			toolbar: '#toolbar',
			columns : [ [ 
			 {field:'ck',checkbox:true},{
				title : 'id',
				field : 'sid',
				width : 100,
				hidden:true
				//sortable:true
			}, {
				field : 'provider1',
				title : '发布人',
				width : 100,
				sortable : true
			},{
				field : 'typeId',
				title : '新闻类型',
				width : 80,
				sortable : true,
				formatter:function(value,rowData,rowIndex){
					return  rowData.typeDesc;
				}
			},
			{
				field : 'typeDesc',
				title : '类型描述',
				width : 10,
				hidden:true
			},
			 {
				title : '置顶',
				field : 'top',
				width : 10,
				hidden:true
				
			},
			{
				field : 'anonymityYn',
				title : '评论类型',
				width : 10,
				hidden:true
			}
			,{
				field : 'subject',
				title : '新闻标题',
				width : 200,
				sortable : true,
				formatter:function(value,rowData,rowIndex){
					var top = rowData.top;
					var topDesc = "";
					if(top == '1'){
						topDesc = "red";
					}
					return "<B>标题：</B>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick=loadDetail('"+rowData.sid+"') style='color:"+topDesc+"'>"+rowData.subject+"</a>";
				}
			},{
				field : 'userId',
				title : '发布范围',
				width : 200,
				formatter:function(value,rowData,rowIndex){
				var deptNames = rowData.toDeptNames;
				var personNames = rowData.toUserNames;
				var toRolesNames = rowData.toRolesNames;
				var renderHtml = "";
				if(deptNames && deptNames != ""){
					renderHtml = renderHtml + "<div><B>部门：</B>&nbsp;&nbsp;"+deptNames+""+"</div>";
				}
				if(personNames && personNames != ""){
					renderHtml = renderHtml + "<div><B>人员：</B>&nbsp;&nbsp;"+personNames+""+"</div>";
				}
				if(toRolesNames && toRolesNames != ""){
					renderHtml = renderHtml + "<div><B>角色：</B>&nbsp;&nbsp;"+toRolesNames+""+"</div>";
				}
				if(rowData.allPriv==1){
					renderHtml="<div>全体人员</div>";
				}
				return "<div>"+renderHtml+"</div>";
				}
			},
			{	field : 'clickCount',
				title : '点击次数',
				width : 60,
				align:'center',
				sortable : true
			}
			,{
				field : 'newsTime',
				title : '发布时间',
				width : 120,
				sortable : true,
				align:'center',
				formatter:function(value,rowData,rowIndex){
				 return "<center>"+getFormatDateStr(value , 'yyyy-MM-dd HH:mm')+"</center>";
				}
			}
		/* 	,{field:'_manage',title:'操作',width : 60,formatter:function(value,rowData,rowIndex){
				var publish = rowData.publish;
				var anonymityYn = rowData.anonymityYn;
				if(anonymityYn == '2'){
					return "";
				}
				return '<input type="button" class="btn btn-primary btn-xs" onclick="addComment('+rowIndex+')" value="评论" /> ';
			
				}} */
			] ]
		});
		//$("[title]").tooltips();
	});

	
	/***
	*
	*查看新闻详情
	*/
    function loadDetail(seqId){
         var url = contextPath + "/system/core/base/news/person/readNewsReplay.jsp?id="+seqId+"&isLooked=0";
         openFullWindow(url);
//         top.bsWindow(url,"查看新闻",{width:"900px", height:"400px",buttons:[{name:"关闭"}],submit:function(v,h){
// 	        if(v=="关闭"){
// 	        	$('#datagrid').datagrid("reload");
// 				return true;
// 	        }
//         }});

     }
	
	/**
	*
	*评论新闻
	*/
    function addComment(rowIndex){
    	var rows = $('#datagrid').datagrid('getRows');
        var seqId = rows[rowIndex].sid;
         var url = contextPath + "/system/core/base/news/person/readNewsReplay.jsp?id="+seqId+"&isLooked=0";
        top.bsWindow(url,"评论新闻",{width:"1000px", height:"400px",buttons:[{name:"关闭"}],submit:function(v,h){
	        if(v=="关闭"){
	        	$('#datagrid').datagrid("reload");
				return true;
	        }
        }});
     }
	
	
    //全部已阅
    function readAll(){
    	var url = "<%=contextPath %>/teeNewsController/readAll.action";
		var json = tools.requestJsonRs(url,{groupId:groupId,seqIds:seqIds,typeId:typeId});
    	if(json.rtState){
    		
    		datagrid.datagrid('reload');
    	}
    	
    }
	</script>
</head>
<body>
<div id="toolbar" class ="clearfix" style="margin-top: 5px">
  <input style="margin-bottom: 5px;" type="button" value="全部已阅" class="fl btn-win-white" title="返回" onClick="readAll();">
</div>


<table id="datagrid" fit="true"></table>
</body>
</html>