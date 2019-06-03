<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="com.tianee.oa.oaconst.TeeConst" %>
<%@ page import="com.tianee.oa.oaconst.TeeModelIdConst" %>
<%@ page import="com.tianee.oa.core.org.bean.TeePerson" %>
<%@ page import="com.tianee.webframe.servlet.TeeResPrivServlet"%>
<%@ page import="com.tianee.webframe.util.str.TeeUtility"%>
<%@ page import="com.tianee.webframe.util.date.TeeDateUtil"%>
<%@ page import="com.tianee.webframe.util.global.TeeSysProps"%>

<%@page import="com.tianee.webframe.util.str.TeeStringUtil"%>
<%@page import="org.springframework.core.io.ClassPathResource"%>
<%@page import="com.tianee.oa.core.org.service.TeePersonService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
	String contextPath = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	//获取主题的索引号
	int styleIndex = 1;
	Integer styleInSession = (Integer) request.getSession().getAttribute("STYLE_TYPE_INDEX");
	if (styleInSession != null) {
		styleIndex = styleInSession;
	}
	String stylePath = contextPath + "/common/styles";
	String imgPath = stylePath + "/style" + styleIndex + "/img";
	String cssPath = stylePath + "/style" + styleIndex + "/css";
	String systemImagePath = contextPath+"/common/images";
	
	//第二套风格
	int STYLE_TYPE_INDEX_2 = TeeStringUtil.getInteger( request.getSession().getAttribute("STYLE_TYPE_INDEX_2"), 1);
	String cssPathSecond = contextPath + "/system/frame/2/styles/style" + STYLE_TYPE_INDEX_2 + "/css";
	String imgPathSecond = contextPath + "/system/frame/2/styles/style" + STYLE_TYPE_INDEX_2 + "/img";
	
	
	String loginOutText = (String) request.getSession().getAttribute("LOGIN_OUT_TEXT") == null ? "" : (String) request.getSession().getAttribute("LOGIN_OUT_TEXT");//退出提示语
	String ieTitle = (String) request.getSession().getAttribute("IE_TITLE") == null ? "" : (String) request.getSession().getAttribute("IE_TITLE");//主界面IEtitle
	String secUserMem = (String) request.getSession().getAttribute("SEC_USER_MEM") == null ? "" : (String) request.getSession().getAttribute("SEC_USER_MEM");//是否记忆用户名
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META http-equiv="X-UA-Compatible" content="IE=Edge">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- jQuery库 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.min.js"></SCRIPT>
<LINK href="个人桌面_files/style.css" rel="stylesheet" type="text/css">
<SCRIPT type="text/javascript">
	window.UEDITOR_HOME_URL = "<%=request.getContextPath() %>/common/ueditor/";
	$.browser = {};
	$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
	$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
	$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
	$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
</SCRIPT>
<!-- Bootstrap通用UI组件 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/bootstrap.min.js"></SCRIPT>
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/bootstrap-ie7.css" rel="stylesheet"
	type="text/css">
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/bootstrap.css" rel="stylesheet" type="text/css">
<!-- JBOX通用UI组件 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.jBox-2.3.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.jBox-zh-CN.js" type="text/javascript"></SCRIPT>
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/jbox.css" rel="stylesheet" type="text/css">
<SCRIPT></SCRIPT>
<!-- 其他工具库类 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/tools.js"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/sys.js"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/sysUtil.js"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/orgselect.js"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/easyuiTools.js" type="text/javascript"></SCRIPT>
<!-- jQuery Tooltip -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.tooltip.min.js" type="text/javascript"></SCRIPT>
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.tooltip.css" rel="stylesheet"
	type="text/css">
<!-- 图片预览器 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.mousewheel.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/picexplore.js" type="text/javascript"></SCRIPT>
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/picexplore.css" rel="stylesheet" type="text/css">
<SCRIPT type="text/javascript">
	/** 常量定义 **/
	var TDJSCONST = {
		YES : 1,
		NO : 0
	};
	/** 变量定义 **/
	var contextPath = "<%=request.getContextPath() %>";
	var imgPath = "<%=request.getContextPath() %>/common/styles/style1/img";
	var cssPath = "<%=request.getContextPath() %>/common/styles/style1/css";
	var stylePath = "<%=request.getContextPath() %>/common/styles";

	var cssPathSecond = "<%=request.getContextPath() %>/system/frame/2/styles/style1/css";
	var imgPathSecond = "<%=request.getContextPath() %>/system/frame/2/styles/style1/img";
	var loginOutText = "感谢您使用，再见！";
	var uploadFlashUrl = "<%=request.getContextPath() %>/common/swfupload/swfupload.swf";
	var commonUploadUrl = "<%=request.getContextPath() %>/attachmentController/commonUpload.action";
	var systemImagePath = "<%=request.getContextPath() %>/common/images";
	var xparent;
	if (window.dialogArguments) {
		xparent = window.dialogArguments;
	} else if (window.opener) {
		xparent = opener;
	} else {
		xparent = window;
	}
	function parseNumber(value, defValue) {
		if (isNaN(value)) {
			return defValue;
		}
		return value * 1;
	}
</SCRIPT>

<STYLE>
body {
	scrollbar-arrow-color: #4e9be9; /*图6,三角箭头的颜色*/
	scrollbar-face-color: #c0c0c0; /*图5,立体滚动条的颜色*/
	scrollbar-3dlight-color: #dfdcdc; /*图1,立体滚动条亮边的颜色*/
	scrollbar-highlight-color: #dfdcdc; /*图2,滚动条空白部分的颜色*/
	scrollbar-shadow-color: #999; /*图3,立体滚动条阴影的颜色*/
	scrollbar-darkshadow-color: #666; /*图4,立体滚动条强阴影的颜色*/
	scrollbar-track-color: #dfdcdc; /*图7,立体滚动条背景颜色*/
	scrollbar-base-color: #f8f8f8; /*滚动条的基本颜色*/
	Cursor: url(mouse.cur); /*自定义个性鼠标*/
}

</STYLE>
<TITLE>个人桌面</TITLE>
<LINK href="<%=contextPath %>/system/frame/3/个人桌面_files/personal.css" rel="stylesheet" type="text/css">
<STYLE>
table {
	border-collapse: collapse;
	padding: 0;
	margin: 0;
}

html,body {
	height: 100%;
}

body {
	position: relative;
	text-align: center;
	margin: 0;
	padding: 0;
	background: #FFF;
}

.slidebox-container {
	margin: 0;
	padding: 0;
	overflow: hidden;
	background: #FFF;
}

#controller {
	height: 26px;
	left: 0;
	position: absolute;
	top: 30px;
	z-index: 3;
	width: 100%;
	text-align: center;
	background: #FFF;
}

#container {
	background: #FFF;
}
</STYLE>
<!-- jQuery库 -->
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.core.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.widget.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.mouse.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.draggable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.droppable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.resizable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.selectable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ui.sortable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=contextPath %>/system/frame/3/个人桌面_files/jquery.ux.slidebox.js" type="text/javascript"></SCRIPT>
<SCRIPT type="text/javascript">
	var modules;
	var slidebox;
	/** 变量定义 **/
	var contextPath = "<%=contextPath%>";
	var imgPath = "oaop/common/styles/style1/img";
	var cssPath = "oaop/common/styles/style1/css";
	var stylePath = "oaop/common/styles";
	var screenCount = 0;//屏幕数量
	var moduleNoHandleCount ;//各模块待办数
	$(function() {
		modules = [ 
		            [ 
		              {icon : "default.png",menuCode : "/system/core/org/index.jsp",menuName : "单位管理",uuid : "600402"} 
		            ], 
		            [ 
		              {icon : "default.png",menuCode : "/system/core/menu/index.jsp",menuName : "菜单设置",uuid : "600402"}, 
		              {icon : "default.png",menuCode : "/system/core/menuGroup/manageGroup.jsp",menuName : "权限组管理",id : "600410"}
		              ] 
		            ];
		moduleNoHandleCount = getModuleNoHandleCount();
	
		var url = "<%=contextPath%>/systemAction/getPostChildMenuToFrame2.action";
		var para =  {type:'1'};
		var jsonObj = tools.requestJsonRs(url, para);
		if (jsonObj.rtState) {
			var data = jsonObj.rtData;
			modules = jsonObj.rtData.selectSysMenuModelList;
			if(modules.length == 0){
				modules = [[]];
			}
		}
		screenCount = modules.length;
		slidebox = $("#container").slideBox({
			control : ".controller-c",
			count : modules.length,
			cancel : ".block",
			listeners : {
				afterScroll : function(i) {
				},
				beforeScroll : function(i) {
					jQuery(".background").animate({
						left : -i * 70
					}, "normal");
				}
			}
		});

		initScreens();
		initTrash();

		//去掉父级菜单显示
		$("body").click(function() {
			//parent.hideMenuInfo();
		});

	});

	//初始化
	function initScreens() {
		$("#container .screen").append("<ul class='blocks' style='margin-top:20px;' ></ul><div style='clear: both;'></div>");
		$.each(modules, function(i, e) {
	
			$.each(e, function(j, m) {
				addModule(i, m);
			});
			var s = slidebox.getScreen(i);
			var ul = s.find("ul");
			var click;
			ul.sortable({
				revert : true,
				//delay: 200,
				//distance: 10,               //延迟拖拽事件(鼠标移动十像素),便于操作性
				tolerance : 'pointer', //通过鼠标的位置计算拖动的位置*重要属性*
				connectWith : ".screen ul",
				scroll : false,
				stop : function(e, ui) {
					setTimeout(function() {
						$(".block.remove").remove();
						$("#trash").hide();
						//ui.item[0].onclick = click;
						serializeSlide();
						ui.item.removeAttr("clickdisabled");
					}, 0);
				},
				start : function(e, ui) {
					$("#trash").show();
					ui.item.attr("clickdisabled", true);
				}
			});
		});
	}

	function addScreen() {
		slidebox.addScreen();
		slidebox.scroll(slidebox.getCount() - 1);
		var newScreen = slidebox.getScreen(slidebox.getCount() - 1);
		var ul = $("<ul class='blocks'></ul>");
		newScreen.append(ul);
		ul.sortable({
			revert : true,
			//delay: 200,
			//distance: 10,               //延迟拖拽事件(鼠标移动十像素),便于操作性
			tolerance : 'pointer', //通过鼠标的位置计算拖动的位置*重要属性*
			connectWith : ".screen ul",
			scroll : false,
			stop : function(e, ui) {
				setTimeout(function() {
					$(".block.remove").remove();
					$("#trash").hide();
					//ui.item.click(openUrl);
					serializeSlide();
				}, 0);
			},
			start : function(e, ui) {
				$("#trash").show();
				//ui.item.unbind("click");
			}
		});
	}


	/**
	 * 获取各模块中未办理的数字
	 */
	function getModuleNoHandleCount(){
		var url = contextPath+"/TeeSystemOtherController/getModelHandCount.action";
		var json = tools.requestJsonRs(url);
		if(json.rtState){
			var data  = json.rtData;  
			return data;
		}else{
			alert(json.rtMsg);
		}
	}
	//添加模型
	function addModule(screen, module) {
		var el = slidebox.getScreen(screen).find("ul.blocks");
		var _id = module.uuid;
		var iconTemp = module.icon;
		var icon = "51.png";
		if (iconTemp && iconTemp != '') {
			icon = iconTemp;
		}
		var li = $("<li class=\"block\"></li>");
		var img = $("<div class='img'><p><img src='" + contextPath + "/system/frame/3/icons/" + icon+ "' /></p></div>");
		var divT = $("<div class=\"count\" align=''></div>");
		li.attr("id", "block_" + module.uuid);
		li.attr("title", module.menuName);
		li.attr("index", module.uuid);
		divT.attr("id", "count_" + module.uuid);
	
		if (module.count > 0) {
			//divT.addClass("count" + module.count);   
		}
		if (module.uuid == 25) {//邮件
			var noHandleCount = moduleNoHandleCount["emailCount"];
			if(noHandleCount > 0){
				if(noHandleCount > 10){
					noHandleCount = 10;
				}
				divT.addClass("count" + noHandleCount);
			}
		}
		if (module.uuid == 29) {//公告
			var noHandleCount = moduleNoHandleCount["notifyCount"];
			if(noHandleCount > 0){
				if(noHandleCount > 10){
					noHandleCount = 10;
				}
				divT.addClass("count" + noHandleCount);
			}   
		}
		if (module.uuid == 27) {//新闻
			var noHandleCount = moduleNoHandleCount["newsCount"];
			if(noHandleCount > 0){
				if(noHandleCount > 10){
					noHandleCount = 10;
				}
				divT.addClass("count" + noHandleCount);
			}      
		}
		if (module.uuid == 13) {//待办工作
			var noHandleCount = moduleNoHandleCount["workFlow"];
			if(noHandleCount > 0){
				if(noHandleCount > 10){
					noHandleCount = 10;
				}
				divT.addClass("count" + noHandleCount);
			}         
		}
		if (module.uuid == 36) {//日程安排
			var noHandleCount = moduleNoHandleCount["calendarCount"];
			if(noHandleCount > 0){
				if(noHandleCount > 10){
					noHandleCount = 10;
				}
				divT.addClass("count" + noHandleCount);
			}         
		}
		

	
		// var a = $("<span class=\"icon-text\" href=\"javascript: void(0)\"></span>"); 
		var div = $("<div  class=\"icon-text\" ></div>").text(module.menuName);
		/*   var span = $("<span  class=\"span-icon-text\" ></span>").text(module.menuName);  */
		li.append(img.append(divT)).append(div);
		el.append(li);
		var url = "";
		if ((module.menuCode).startWith("/oaop")) {
			url = module.menuCode;
		} else {
			url = new RegExp("^\/").test(module.menuCode) ? module.menuCode
					: module.menuCode;
		}
		//点击触发事件
		li.click(function() {
			if (li.attr("clickdisabled")) {
				return;
			}
			var menuName = module.menuName;
			var menuCode = module.menuCode;
			parent.addTabFunc(menuName,menuCode);
			//parent.toSrcUrl("用户管理","/system/core/person/index.jsp");
		});
	}

	String.prototype.startWith = function(str) {
		if (str == null || str == "" || this.length == 0
				|| str.length > this.length)
			return false;
		if (this.substr(0, str.length) == str)
			return true;
		else
			return false;
		return true;
	}
	/**
	 * 点击应用盒子
	 */
	function openAppBox() {
		var title = "桌面应用设置";
		var index = 0;
		var url = "<%=contextPath%>/system/frame/3/portal/setting.jsp?index=" + index;
		bsWindow(url, title, {
			width : "800",
			height : "360",
			buttons : [

			//{name:"关闭",classStyle:"btn btn-primary"}
			],
			submit : function(v, h) {
				var cw = h[0].contentWindow;
				if (v == "保存") {
					var isOk = cw.doSaveOrUpdate();
					return isOk;
				} else if (v == "关闭") {
					return true;
				}
			}
		});
	}

	/**
	 * 消息
	 */
	function portalMessage(msg) {
		if (!msg)
			return;
		msgObj = $("#portalSettingMsg");
		msgObj.html(msg).show();
		setTimeout(function() {
			msgObj.empty().hide()
		}, 5000);
	}

	/**
	 * 改变时触发时间
	 */
	function serializeSlide() {

		var s = "[";
		jQuery("#container .screen").each(function(i, e) {
			var ss = "";
			jQuery(this).find("li.block").each(function(j, el) {
				if (!$(el).attr("index"))
					return true;
				ss += $(el).attr("index");
				ss += ",";
			});
			if (ss != "") {
				ss = ss.substring(0, ss.length - 1);
			}

			s = s + "{data:\"" + ss + "\"},";
		});
		if (s.length) {
			s = s.replace(/\|$/, "");
		}
		if (s != "[") {
			s = s.substring(0, s.length - 1);
		}
		s = s + "]";
		//alert(s)
		// return ;
		var url = contextPath
				+ "/personManager/updatePersonMenuParamSet.action";
		var para = {
			menuParamSet : s
		};
		var jsonObj = tools.requestJsonRs(url, para);
		return jsonObj.rtState;
	}

	/**
	 * 初始化垃圾箱 ，移动、移出等事件
	 */
	function initTrash() {
		$("#trash").droppable({
			over : function() {
				$("#trash").addClass("hover");
			},
			out : function() {
				$("#trash").removeClass("hover");
			},
			drop : function(event, ui) {
				ui.draggable.addClass("remove").hide();
				delModule(ui.draggable.attr("index"));
				$(".ui-sortable-placeholder").animate({
					width : "0"
				}, "normal", function() {
				});
				$("#trash").removeClass("hover");
			}
		});
	}

	/**
	 * 删除对象
	 */
	function delModule(el) {
		var pObj = jQuery("#container .screen ul li.block");
		pObj.each(function() {
			var index = jQuery(this).attr("index");
			if (el == index) {
				jQuery(this).remove();
				var flag = serializeSlide();
			}
		});
	}

	function doInit() {
		//处理应用盒子
		//$("a").removeClass("btn");
		//$("#openAppBox").show();
	}
</SCRIPT>
<style>
#trash {
    background: url("trash.png") no-repeat scroll center top transparent;
    bottom: 10px;
    display: none;
    height: 128px;
    left: 50%;
    position: absolute;
    width: 128px;
    z-index: 99;
    margin-left: -64px;
}

#trash.hover {
    background: url("trash_hover.png") no-repeat scroll center top transparent;
}
</style>
<META name="GENERATOR" content="MSHTML 11.00.9600.17496">
</HEAD>
<BODY onLoad="doInit()" style="background: #FFF;">
	<DIV id="trash" ></DIV>
	<DIV id="container" style="background: #FFF;"></DIV>
	<DIV id="controller" style="background: #FFF;">
		<TABLE align="center" cellspacing="0" cellpadding="0"
			style="background: #FFF;">
			<TBODY>
				<TR>
					<TD class="controller-l"></TD>
					<TD class="controller-c"></TD>
					<TD class="controller-r"><A title="打开应用盒子" class="cfg"
						id="openAppBox" onclick="openAppBox()" href="javascript: void(0)"></A></TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>
	<DIV class="background" style="left: 0px;" style="background:#FFF;"></DIV>
</BODY>
</HTML>
