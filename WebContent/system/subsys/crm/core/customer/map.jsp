<%@page import="com.tianee.oa.oaconst.TeeAttachmentModelKeys"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
TeePerson person = (TeePerson) request.getSession().getAttribute(TeeConst.LOGIN_USER);

String addr=request.getParameter("addr");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ include file="/header/header2.0.jsp" %>
<%@ include file="/header/easyui2.0.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&&ak=jEtlvZ7UXrKl6FtnqikedMIz"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css" />
<title>地图选点</title>
</head>
<style type="text/css">
    body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
<script type="text/javascript">
var addr="<%=addr%>";
//初始化地图
function doInit(){
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,11);	
	if(addr != ""){
		map.centerAndZoom(addr,11);      // 用城市名设置地图中心点
	}
	var geoc = new BMap.Geocoder();  
	
	//创建检索控件
	var searchControl = new BMapLib.SearchControl({
	    container : "searchBox" //存放控件的容器
	    , map     : map  //关联地图对象
	    , type    : "LOCAL_SEARCH"  //检索类型
	});
	
	
	//编写自定义函数,创建标注
	function addMarker(point){
	  var marker = new BMap.Marker(point);
	  map.addOverlay(marker);
	}
	
	map.addEventListener("click", function(e){        
		var pt = e.point;
		 $.MsgBox.Confirm ("提示", "确定选取该点吗？", function(){
			 geoc.getLocation(pt, function(rs){
					var addComp = rs.addressComponents;
					var  desc=addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
					var  xaddr=pt.lng;
					var  yaddr=pt.lat;
			        var coordinate="{xaddr:"+xaddr+",yaddr:"+yaddr+"}";
			        window.opener.document.getElementById('addressDesc').value=desc;
			        window.opener.document.getElementById("coordinate").value=coordinate;
			        window.close();
				});  
		 });
		
		 
	});
}

</script>

<body onload="doInit();">
   <div id="searchBox"></div>
   <div id="allmap"></div>
</body>
</html>{
