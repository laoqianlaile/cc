package org.apache.jsp.system.core.orgselect;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tianee.webframe.util.servlet.TeeCookieUtils;
import java.util.*;
import com.tianee.oa.oaconst.TeeConst;
import com.tianee.oa.core.org.bean.TeePerson;
import com.tianee.webframe.util.str.TeeUtility;
import com.tianee.webframe.util.date.TeeDateUtil;
import com.tianee.webframe.util.global.TeeSysProps;
import com.tianee.webframe.util.str.TeeStringUtil;
import com.tianee.oa.core.org.service.TeePersonService;
import com.tianee.oa.oaconst.TeeModelIdConst;

public final class selectSingleUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/header/header2.0.jsp");
    _jspx_dependants.add("/header/ztree.jsp");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String moduleId = request.getParameter("moduleId");
if (moduleId == null) {
  moduleId = "";
}
String privNoFlag = request.getParameter("privNoFlag");
if (privNoFlag == null || "".equals(privNoFlag)) {
  privNoFlag = "0";
}
String privOp = request.getParameter("privOp");
if (privOp == null) {
  privOp = "";
}

String objSelectType = request.getParameter("objSelectType");
if (objSelectType == null) {
	objSelectType = "";
}


//人员条件filter，目前工作流需要处理
String userFilter = request.getParameter("userFilter") == null ? "0" : request.getParameter("userFilter")  ;

//回调方法参数
String callBackPara = request.getParameter("callBackPara") == null ? "" : request.getParameter("callBackPara")  ;
callBackPara = callBackPara.replace("\"", "\\\"");


//根据部门ids选择人员
String deptFilter=TeeStringUtil.getString(request.getParameter("deptFilter"));

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\"/>\r\n");
      out.write("<meta http-equiv=\"cache-control\" content=\"no-cache, must-revalidate\"/>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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


String loginOutText = TeeSysProps.getString("LOGIN_OUT_TEXT");
String ieTitle = TeeSysProps.getString("IE_TITLE");
String secUserMem = TeeSysProps.getString("SEC_USER_MEM");

Cookie cookie = TeeCookieUtils.getCookie(request, "skin_new");
String skinNew = "1";
if(cookie!=null){
	skinNew = cookie.getValue();
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- zt_webframe框架引入 jquery -->\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/jquery-easyui-1.6.11/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- zt_webframe框架引入 核心库 -->\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/zt_webframe/js/package.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/js/sys2.0.js?v=2\"></script>\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/js/sysUtil.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/js/src/orgselect.js\"></script>\n");
      out.write("<!--\n");
      out.write("\n");
      out.write("//-->\r\n");
      out.write("<!-- zt_webframe框架引入 css样式 -->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/common/zt_webframe/css/init");
      out.print(skinNew );
      out.write(".css\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/common/zt_webframe/css/package");
      out.print(skinNew );
      out.write(".css\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/js/tools2.0.js?v=1\"></script>\r\n");
      out.write("<script src=\"");
      out.print(contextPath );
      out.write("/common/js/TeeMenu.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("/** 变量定义 **/\r\n");
      out.write("var contextPath = \"");
      out.print(contextPath );
      out.write("\";\r\n");
      out.write("var systemImagePath = contextPath+\"/common/images\";\r\n");
      out.write("var uploadFlashUrl = \"");
      out.print(contextPath );
      out.write("/common/swfupload/swfupload.swf\";\r\n");
      out.write("var commonUploadUrl = \"");
      out.print(contextPath );
      out.write("/attachmentController/commonUpload.action;jsessionid=");
      out.print(session.getId());
      out.write("\";\r\n");
      out.write("var xparent;\r\n");
      out.write("var stylePath = \"");
      out.print(stylePath);
      out.write("\";\r\n");
      out.write("if(window.dialogArguments){\r\n");
      out.write("\txparent = window.dialogArguments;\r\n");
      out.write("}else if(window.opener){\r\n");
      out.write("\txparent = opener;\r\n");
      out.write("}else{\r\n");
      out.write("\txparent = window;\r\n");
      out.write("}\r\n");
      out.write("window.UEDITOR_HOME_URL = \"");
      out.print(contextPath);
      out.write("/common/ueditor/\";\r\n");
      out.write("$.browser = {};\r\n");
      out.write("$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());\r\n");
      out.write("$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());\r\n");
      out.write("$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());\r\n");
      out.write("$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());\r\n");
      out.write("</script>\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<!-- zTree库 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath() );
      out.write("/common/jquery/ztree/css/zTreeStyle/zTreeStyle.css\" type=\"text/css\"/>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/common/jquery/ztree/js/jquery.ztree.core-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/common/jquery/ztree/js/jquery.ztree.excheck-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/common/jquery/ztree/js/jquery.ztree.exedit-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/common/js/ZTreeSync.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>单个选择人员</title>\r\n");
      out.write("<link rel=\"stylesheet\" href =\"");
      out.print(cssPath );
      out.write("/org_select.css\"/>\r\n");
      out.write("<link href=\"");
      out.print(cssPath);
      out.write("/index1.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"");
      out.print(cssPath);
      out.write("/selectControls.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(contextPath);
      out.write("/common/easyui/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(contextPath );
      out.write("/common/jquery/ztree/js/jquery.ztree.core-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(contextPath );
      out.write("/common/jquery/ztree/js/jquery.ztree.excheck-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(contextPath );
      out.write("/common/jquery/ztree/js/jquery.ztree.exedit-3.5.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(contextPath);
      out.write("/system/core/orgselect/orgselect.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var selectedColor = \"rgb(0, 51, 255)\";\r\n");
      out.write("var RoleId,RoleName;\r\n");
      out.write("var moduleId = \"");
      out.print(moduleId);
      out.write("\";\r\n");
      out.write("objSelectType = '");
      out.print(objSelectType);
      out.write("';\r\n");
      out.write("var privOp = '");
      out.print(privOp);
      out.write("';\r\n");
      out.write("var privNoFlag = \"");
      out.print(privNoFlag);
      out.write("\";\r\n");
      out.write("var userFilter = '");
      out.print(userFilter);
      out.write("';\r\n");
      out.write("var deptFilter = \"");
      out.print(deptFilter );
      out.write("\";\r\n");
      out.write("var callBackPara = \"");
      out.print(callBackPara);
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("var parentWindowObj = xparent;\r\n");
      out.write("var to_id_field ;\r\n");
      out.write("var to_name_field;\r\n");
      out.write("var single_select = true;//是否是单用户选择\r\n");
      out.write("var ctroltime=null,key=\"\";\r\n");
      out.write("\r\n");
      out.write("function doInit(){\r\n");
      out.write("\t  var userRetNameArray = parentWindowObj[\"userRetNameArray\"];\r\n");
      out.write("\t  if (userRetNameArray && (userRetNameArray.length == 2 || userRetNameArray.length == 3 )) {\r\n");
      out.write("\t    var deptCntrl = userRetNameArray[0];\r\n");
      out.write("\t    var deptDescCntrl = userRetNameArray[1];  \r\n");
      out.write("\t    to_id_field = parentWindowObj.document.getElementById(deptCntrl);\r\n");
      out.write("\t    to_name_field = parentWindowObj.document.getElementById(deptDescCntrl);  \r\n");
      out.write("\t  }else {\r\n");
      out.write("\t\tto_id_field = parentWindowObj.document.getElementById(\"user\");\r\n");
      out.write("\t    to_name_field = parentWindowObj.document.getElementById(\"userName\");\r\n");
      out.write("\t  }  \r\n");
      out.write("\t  \r\n");
      out.write("\t//获取部门树\r\n");
      out.write("    getDeptTree();\r\n");
      out.write("\t\r\n");
      out.write("\t//初始化加载数据\r\n");
      out.write("    dataInit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/***\r\n");
      out.write(" * 按人员ID和用户名模糊查询\r\n");
      out.write(" */\r\n");
      out.write("function doSearch(name){\r\n");
      out.write("\tvar url = contextPath +  \"/orgSelectManager/getSelectUserByUserIdOrUserName.action\";\r\n");
      out.write("\tvar para = {user:name,moduleId:moduleId,privNoFlag:privNoFlag,userFilter:userFilter,deptFilter:deptFilter};\r\n");
      out.write("\tvar jsonRs = tools.requestJsonRs(url,para);\r\n");
      out.write("\tif(jsonRs.rtState){\r\n");
      out.write("\t\tvar dataList = jsonRs.rtData;\r\n");
      out.write("\t\tdataLoad(dataList,\"人员查询\");\r\n");
      out.write("\t\t//dataLoad(dataList,jsonRs.rtMsg);\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\talert(jsonRs.rtMsg);\r\n");
      out.write("\t} \r\n");
      out.write("}\r\n");
      out.write("/**\r\n");
      out.write(" * 处理数据\r\n");
      out.write(" */\r\n");
      out.write("function dataInit(){\r\n");
      out.write("\t\r\n");
      out.write("\tif(objSelectType &&objSelectType == '1'){//当为多选框时\r\n");
      out.write("\t\tgetMultiple();\r\n");
      out.write("\t\tto_id_field_value = item_id_multiple;\r\n");
      out.write("\t\tto_name_field_value = item_id_multiple_name;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tto_id_field_value = to_id_field.value;\r\n");
      out.write("\t\tto_name_field_value = to_name_field.value;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(to_id_field_value == ''){//如果初始化为空时，从当前部门获取\r\n");
      out.write("\t\tgetCurrentDeptPerson();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar dataList = new Array();\r\n");
      out.write("\tvar dataNameList  = new Array();\r\n");
      out.write("\tif(to_id_field_value != \"\"){\r\n");
      out.write("\t\tdataList = to_id_field_value.split(\",\");\r\n");
      out.write("\t\tdataNameList = to_name_field_value.split(\",\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//转数组对象\r\n");
      out.write("\tif(id_field_array.length <= 0){\r\n");
      out.write("\t\tfor(var i =0 ; i <dataList.length ; i++){\r\n");
      out.write("\t\t\tif(dataList[i] && dataList[i] != \"\" ){\r\n");
      out.write("\t\t\t\tvar item = {id:dataList[i] , name:dataNameList[i]};\r\n");
      out.write("\t\t\t\tid_field_array.push(item);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tdataLoadInit(id_field_array);\r\n");
      out.write("}\r\n");
      out.write("/**\r\n");
      out.write(" * 获取本部门人员\r\n");
      out.write(" */\r\n");
      out.write("function getCurrentDeptPerson(){\r\n");
      out.write("\tvar url = contextPath +  \"/orgSelectManager/getSelectUserByCurrentDept.action\";\r\n");
      out.write("\tvar para = {userFilter:userFilter,moduleId:moduleId,privNoFlag:privNoFlag,deptFilter:deptFilter};\r\n");
      out.write("\tvar jsonRs = tools.requestJsonRs(url,para);\r\n");
      out.write("\tif(jsonRs.rtState){\r\n");
      out.write("\t\tvar dataList = jsonRs.rtData;\r\n");
      out.write("\t\tdataLoad(dataList,jsonRs.rtMsg);\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\talert(jsonRs.rtMsg);\r\n");
      out.write("\t} \r\n");
      out.write("}\r\n");
      out.write("/**\r\n");
      out.write(" * 点击已选人员\r\n");
      out.write(" */\r\n");
      out.write("function clickSelectData(){\r\n");
      out.write("\tvar dataList = \"\";\r\n");
      out.write("\tvar dataList = to_id_field.value.split(\",\");\r\n");
      out.write("\tvar dataNameList = to_name_field.value.split(\",\");\r\n");
      out.write("\tif(to_id_field.value == ''){\r\n");
      out.write("\t\tdataList = [];\r\n");
      out.write("\t\tdataNameList = [];\r\n");
      out.write("\t}\r\n");
      out.write("\t//转数组对象\r\n");
      out.write("\tif(id_field_array.length <= 0){\r\n");
      out.write("\t\tfor(var i =0 ; i <dataList.length ; i++){\r\n");
      out.write("\t\t\tif(dataList[i] && dataList[i] != \"\" ){\r\n");
      out.write("\t\t\t\tvar item = {id:dataList[i] , name:dataNameList[i]};\r\n");
      out.write("\t\t\t\tid_field_array.push(item);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tdataLoadInit(id_field_array);;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/**\r\n");
      out.write(" * 获取部门select字符串\r\n");
      out.write(" * uuid:部门id\r\n");
      out.write(" * isCheck:是否是勾选 0-勾选为false,1-勾选为true\r\n");
      out.write(" */\r\n");
      out.write("function getDeptStr(uuid,isCheckedState,deptName){\r\n");
      out.write("\tvar url = contextPath +  \"/orgSelectManager/getSelectUserByDept.action\";\r\n");
      out.write("\tvar para = {deptId:uuid,isCheckedState:isCheckedState,userFilter:userFilter,moduleId:moduleId,privNoFlag:privNoFlag,deptFilter:deptFilter};\r\n");
      out.write("\tvar jsonRs = tools.requestJsonRs(url,para);\r\n");
      out.write("\tif(jsonRs.rtState){\r\n");
      out.write("\t\tvar dataList = jsonRs.rtData;\r\n");
      out.write("\t\tdataLoad(dataList,deptName);\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\talert(jsonRs.rtMsg);\r\n");
      out.write("\t} \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function getDeptTree(){\r\n");
      out.write("\tvar url =  \"");
      out.print(contextPath );
      out.write("/orgSelectManager/getSelectDeptTreeAll.action?moduleId=\"+moduleId+\"&deptFilter=\"+deptFilter;;\r\n");
      out.write("\tvar config = {\r\n");
      out.write("\t\t\tzTreeId:\"selectDeptZtree\",\r\n");
      out.write("\t\t\trequestURL:url,\r\n");
      out.write("           \tonClickFunc:deptOnClick,\r\n");
      out.write("\t\t\tasync:false,\r\n");
      out.write("\t\t\tonAsyncSuccess:function(event, treeId, treeNode, msg){\r\n");
      out.write("\t\t\t\t/* var ztreeObj = $.fn.zTree.getZTreeObj(\"selectDeptZtree\");\r\n");
      out.write("\t\t\t\tvar deptArr = ztreeObj.transformToArray(ztreeObj.getNodes());\r\n");
      out.write("\t\t\t\tfor(var i=0;i<deptArr.length;i++){\r\n");
      out.write("\t\t\t\t\tdeptFilter+=deptArr[i].id;\r\n");
      out.write("\t\t\t\t\tif(i!=deptArr.length-1){\r\n");
      out.write("\t\t\t\t\t\tdeptFilter+=\",\";\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t} */\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t};\r\n");
      out.write("\tzTreeObj = ZTreeTool.config(config); \t\r\n");
      out.write("}\r\n");
      out.write("/**\r\n");
      out.write(" *  点击\r\n");
      out.write(" */\r\n");
      out.write("function deptOnClick(event, treeId, treeNode) {\r\n");
      out.write("\tvar uuid = treeNode.id;\r\n");
      out.write("\tvar deptName = treeNode.name;\r\n");
      out.write("\tgetDeptStr(uuid,'',deptName);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\thtml{\r\n");
      out.write("\t\toverflow-y: hidden;\r\n");
      out.write("\t}\r\n");
      out.write("\ta:hover{\r\n");
      out.write("\t\tcolor:#fff;\r\n");
      out.write("\t\tbackground-color: #70beff;\r\n");
      out.write("\t}\r\n");
      out.write("\t.titlebar{\r\n");
      out.write("\t\toverflow:hidden;\r\n");
      out.write("\t}\r\n");
      out.write("\t.title1_img{\r\n");
      out.write("\t\twidth:40px;\r\n");
      out.write("\t\theight:40px;\r\n");
      out.write("\t\tdisplay: inline-block;\r\n");
      out.write("\t\tfloat: left;\r\n");
      out.write("\t}\r\n");
      out.write("\t.titleBlock{\r\n");
      out.write("\t\tfloat: left;\r\n");
      out.write("\t\tdisplay: inline-block;\r\n");
      out.write("\t}\r\n");
      out.write("\t.titleBlock .title{\r\n");
      out.write("\t\tmargin-left: 5px;\r\n");
      out.write("\t\tfont-weight: normal;\r\n");
      out.write("\t}\r\n");
      out.write("\t.tab{\r\n");
      out.write("\t\tmargin-left: 2px;\r\n");
      out.write("\t\toverflow:hidden;\r\n");
      out.write("\t}\r\n");
      out.write("\t.tab .tabMenu{\r\n");
      out.write("\t\tfloat: left;\r\n");
      out.write("\t\tmargin:0 3px;\r\n");
      out.write("\t\tpadding: 3px 0;\r\n");
      out.write("\t\tcursor: pointer;\r\n");
      out.write("\t}\r\n");
      out.write("\t.tabActive{\r\n");
      out.write("\t\tcolor:#379ff7;\r\n");
      out.write("\t\tborder-bottom:2px solid #379ff7;\r\n");
      out.write("\t}\r\n");
      out.write("\t.tabList .tabContent{\r\n");
      out.write("\t    height: 296px;\r\n");
      out.write("\t    width: 260px;\r\n");
      out.write("\t    border: 1px solid #dadada;\r\n");
      out.write("\t    overflow-x:hidden;\r\n");
      out.write("\t    overflow-y:auto;\r\n");
      out.write("\t    display: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.list-group-item{\r\n");
      out.write("\t\tdisplay:block;\r\n");
      out.write("\t\tline-height: 25px;\r\n");
      out.write("\t\t/* margin-left: 10px; */\r\n");
      out.write("\t}\r\n");
      out.write("\t.form-control{\r\n");
      out.write("\t\theight:26px;\r\n");
      out.write("\t\ttext-indent: 5px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.btn{\r\n");
      out.write("\t\tbackground-color: #0d93f6;\r\n");
      out.write("\t\tcolor:#fff;\r\n");
      out.write("\t\tborder:none;\r\n");
      out.write("\t\theight: 28px;\r\n");
      out.write("\t\twidth:53px;\r\n");
      out.write("\t}\r\n");
      out.write("\ta.list-group-item.active, a.list-group-item.active:hover, a.list-group-item.active:focus{\r\n");
      out.write("\t\tz-index: 2;\r\n");
      out.write("    color: #fff;\r\n");
      out.write("    background-color: #70beff;\r\n");
      out.write("    border-color: #428bca;\r\n");
      out.write("\t}\r\n");
      out.write("\t.tabList .list-group-item{\r\n");
      out.write("\t\twidth: 210px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.block-right{\r\n");
      out.write("\t\tborder: 1px solid #dadada;\r\n");
      out.write("\t\tmin-height: 305px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.block-right .list-group-item{\r\n");
      out.write("\t\t/* width: 183px; */\r\n");
      out.write("\t\tcursor: pointer;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.right.single{\r\n");
      out.write("\t\tpadding-top:13px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.list-group-item-header{\r\n");
      out.write("\t\tborder:none;\r\n");
      out.write("\t\tborder-bottom: 1px solid #dadada;\r\n");
      out.write("\t}\r\n");
      out.write("\t.block-select .list-group-item{\r\n");
      out.write("\t\t/* width: 195px; */\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv#select_item{\r\n");
      out.write("\t\theight: 380px;\r\n");
      out.write("\t\tmargin:8px;\r\n");
      out.write("\t\tpadding:0;\r\n");
      out.write("\t\tborder:1px solid #dadada;\r\n");
      out.write("\t}\r\n");
      out.write("\t.block-select{\r\n");
      out.write("\t\theight: 349px;\r\n");
      out.write("\t\toverflow-x: hidden;\r\n");
      out.write("\t\toverflow-y:auto;\r\n");
      out.write("\t}\r\n");
      out.write(" \t.selected_person{\r\n");
      out.write("\t\tdisplay:block;\r\n");
      out.write("\t\twidth:262px;\r\n");
      out.write("\t\theight:33px;\r\n");
      out.write("\t\ttext-align:left;\r\n");
      out.write("\t\ttext-indent:50px;\r\n");
      out.write("\t\tborder:1px solid #dadada;\r\n");
      out.write("\t\tline-height:33px;\r\n");
      out.write("\t\tmargin-top:5px;\r\n");
      out.write("\t\tcolor:#000;\r\n");
      out.write("\t\tbackground-image: url(unselected.png);\r\n");
      out.write("\t\tbackground-repeat:no-repeat;\r\n");
      out.write("\t\tbackground-position: 25px center;\r\n");
      out.write("\t}\r\n");
      out.write("\t.selected_person:hover{\r\n");
      out.write("\t\tbackground-color:#70beff;\r\n");
      out.write("\t\tcolor:#fff;\r\n");
      out.write("\t\tbackground-image: url(selected.png);\r\n");
      out.write("\t} \r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"doInit()\" >\r\n");
      out.write("<div style=\"margin-top:5px;margin-left:5px;\">\r\n");
      out.write("\t<div class=\"titlebar\">\r\n");
      out.write("\t\t<img src=\"");
      out.print(contextPath );
      out.write("/system/core/orgselect/icon_selecct.png\" alt=\"\" class='title1_img'/>\r\n");
      out.write("\t\t<div class=\"titleBlock\">\r\n");
      out.write("\t\t\t<p class=\"title\">选择人员</p>\r\n");
      out.write("\t\t\t<ul class=\"tab\">\r\n");
      out.write("\t\t\t\t<li class='tabMenu tabActive'>按部门选择</li>\r\n");
      out.write("\t\t\t\t<li class='tabMenu' onclick=\"getRole()\">按角色选择</li>\r\n");
      out.write("\t\t\t\t<li class='tabMenu' onclick=\"getGroup()\">自定义组</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class='panel-group'>\r\n");
      out.write("\t\t<ul class='tabList' id=\"accordion\" >\r\n");
      out.write("\t\t\t<li class=\"tabContent\" style=\"display:block;\">\r\n");
      out.write("\t\t\t\t<ul id=\"selectDeptZtree\" class=\"ztree\">\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"tabContent\">\r\n");
      out.write("\t\t\t\t<div class=\"list-group\" id=\"roleList\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"tabContent\">\r\n");
      out.write("\t\t\t\t<div class=\"list-group\" id=\"userGroupList\">\r\n");
      out.write("\t\t  \t\t<div class=\"panel-body\" id=\"defaultGroup\">\r\n");
      out.write("\t      \t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write(" \t<div>\r\n");
      out.write("\t\t<a onclick=\"clickSelectData()\" class='selected_person' style=\"cursor:pointer;\">\r\n");
      out.write("         \t 已选人员\r\n");
      out.write("        </a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t</div>\r\n");
      out.write("<div class=\"main-block\" id=\"block_dept\" style=\"display:block;top:0px;\">\r\n");
      out.write("   <div class=\"right single\" id=\"dept_item\" style=\"overflow: auto\">\r\n");
      out.write("   \t\t<div style=\"padding-bottom: 5px;\">\r\n");
      out.write("\t\t\t<table >\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t    \t<div class=\"input-group\">\r\n");
      out.write("          \t\t    <input class=\"form-control\" style=\"float:left;;width:170px;\" type=\"text\" id=\"kword\" name=\"kword\" value=\"按用户名或姓名搜索...\" onfocus=\"ctroltime=setTimeout(CheckSend,100);\" onblur=\"clearTimeout(ctroltime);if(this.value=='')this.value='按用户名或姓名搜索...';\"  >\r\n");
      out.write("            \t    <div class=\"input-group-btn\"  style=\"float:left;\">\r\n");
      out.write("\t            \t  <button tabindex=\"-1\" class=\"btn btn-default\" type=\"button\" value=\"\"  id=\"search_icon\">查询</button>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div style=\"clear:both;\"> </div>\r\n");
      out.write("                 </div>\r\n");
      out.write("\t\t\t    </td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"block-right\" id=\"dept_item_0\">\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t<div id=\"\" align=\"center\" style=\"margin-top:10px;height:40px;\">\r\n");
      out.write("   \t\t<!-- <input type=\"button\" class=\"btn btn-primary\" value=\"确定\" onclick=\"confirmCallBackFunc();close_window();\">&nbsp;&nbsp; -->\r\n");
      out.write("   \t\t<input type=\"button\" class=\"btn btn-primary\" value=\"确定\" onclick=\"close_window();\">&nbsp;&nbsp;\r\n");
      out.write("\t</div>\r\n");
      out.write(" \t</div>\r\n");
      out.write(" \t\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(\".tabMenu\").click(function(){\r\n");
      out.write("\t\tvar index = $(this).index();\r\n");
      out.write("\t\t$(\".tabMenu\").removeClass('tabActive');\r\n");
      out.write("\t\t$(this).addClass(\"tabActive\");\r\n");
      out.write("\t\t$(\".tabContent\").hide();\r\n");
      out.write("\t\t$(\".tabContent\").eq(index).show();\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
