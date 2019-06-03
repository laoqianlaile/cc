package org.apache.jsp.xzfy.jsp.caseFillin;

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
import com.tianee.webframe.util.servlet.TeeCookieUtils;

public final class caseFillin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/header/header2.0.jsp");
    _jspx_dependants.add("/header/easyui2.0.jsp");
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
      out.write("/common/js/src/orgselect.js\"></script>\r\n");
      out.write("<!--\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- zt_webframe框架引入 核心库 -->\r\n");
      out.write("<script type=\"text/javascript\" src = '");
      out.print(request.getContextPath() );
      out.write("/common/jquery-easyui-1.6.11/jquery.easyui.min.js'></script>\r\n");
      out.write("<script type=\"text/javascript\" src = '");
      out.print(request.getContextPath() );
      out.write("/common/zt_webframe/js/jquery.datagrid.extend.js'></script>\r\n");
      out.write("<script type=\"text/javascript\" src = '");
      out.print(request.getContextPath() );
      out.write("/common/jquery-easyui-1.6.11/locale/easyui-lang-zh_CN.js'></script>\r\n");
      out.write("\r\n");

Cookie __cookie = TeeCookieUtils.getCookie(request, "skin_new");
String __skinNew = "1";
if(__cookie!=null){
	__skinNew = __cookie.getValue();
}

      out.write("\r\n");
      out.write("<!-- zt_webframe框架引入 css样式 -->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/common/jquery-easyui-1.6.11/themes/metro/easyui.css\">\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n");
      out.write("    <title>案件填报</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../css/common.css\">\r\n");
      out.write("    <script src=\"../../js/base/jquery-1.9.1.min.js\"></script>\r\n");
      out.write("    <script src=\"../../js/base/juicer-min.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../css/init1.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/easyui.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/icon.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/demo.css\">\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../js/base/jquery.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../js/base/jquery.easyui.min.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"case.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../../css/common.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/iconfont/iconfont.css\" />\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            overflow-y: auto;\r\n");
      out.write("            overflow-x: hidden;\r\n");
      out.write("            padding-left: 10px;\r\n");
      out.write("            padding-right: 10px;\r\n");
      out.write("            background-color: #EFF0F4;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        #d1 {\r\n");
      out.write("            margin-bottom: 40px;\r\n");
      out.write("            padding: 10px;\r\n");
      out.write("            background-color: #fff;\r\n");
      out.write("            margin-top: 10px;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        .tab ul li {\r\n");
      out.write("            width: 20%;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body onload=\"doInit();\">\r\n");
      out.write("    <div class=\"tab\">\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li onclick=\"showpage(0);\"><span class=\"case-tab case-tab-active\">当事人信息</span></li>\r\n");
      out.write("            <li onclick=\"showpage(1);\"><span class=\"case-tab\">复议事项</span></li>\r\n");
      out.write("            <li onclick=\"showpage(2);\"><span class=\"case-tab\">立案信息</span></li>\r\n");
      out.write("            <li onclick=\"showpage(3);\"><span class=\"case-tab\">审理信息</span></li>\r\n");
      out.write("            <li onclick=\"showpage(4);\"><span class=\"case-tab\">案卷管理</span></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- 当事人信息  -->\r\n");
      out.write("    <div class=\"content\" id=\"d1\">\r\n");
      out.write("        <div class=\"partyDiv\">\r\n");
      out.write("\r\n");
      out.write("            <p class=\"case-head-title\">申请人</p>\r\n");
      out.write("            <div class=\"party-body\">\r\n");
      out.write("                <div>\r\n");
      out.write("                    <label>申请人类别：</label>\r\n");
      out.write("                    <span><input type=\"radio\" name=\"optradio\" />   公民</span>\r\n");
      out.write("                    <span><input type=\"radio\" name=\"optradio\" />   法人或其他组织</span>\r\n");
      out.write("                    <span><input type=\"radio\" name=\"optradio\" />   个体工商户</span>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"edit-table-div applicant-div\">\r\n");
      out.write("                    <table id=\"applicant-table\" class=\"edit-table\"></table>\r\n");
      out.write("                    <p class=\"edit-table-add\" onclick=\"applicant_insertRow();\">添加</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <hr/>\r\n");
      out.write("                <!-- 用button控制添加的表格-->\r\n");
      out.write("                <input class=\"fy-btn blue-btn party-btn\" type=\"button\" value=\"添加申请人代理人\" title=\"添加申请人代理人\" onclick=\"add_agent();\" />\r\n");
      out.write("                <div class=\"edit-table-div applicant-agent-div\">\r\n");
      out.write("                    <table id=\"applicant-agent-table\" class=\"edit-table\"></table>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- 复议事项  -->\r\n");
      out.write("    <div class=\"content\" id=\"d1\">\r\n");
      out.write("        <div class=\"fyform\">\r\n");
      out.write("            <table class=\"table-col4\">\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">案件编号：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请日期：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请事项：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><select class=\"fyselect\">\r\n");
      out.write("                            <option>1</option>\r\n");
      out.write("                            <option>2</option>\r\n");
      out.write("                            <option>3</option>\r\n");
      out.write("                            <option>4</option>\r\n");
      out.write("                            <option>5</option>\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">行政类别管理：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><select class=\"fyselect\">\r\n");
      out.write("                            <option>1</option>\r\n");
      out.write("                            <option>2</option>\r\n");
      out.write("                            <option>3</option>\r\n");
      out.write("                            <option>4</option>\r\n");
      out.write("                            <option>5</option>\r\n");
      out.write("                            </select></td>\r\n");
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">行政不作为：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"> <span class=\"radio-group\">\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz4\" onclick=\"yesDuty();\"/><label>是</label>\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz4\" onclick=\"noDuty();\" checked=\"ture\"/><label>否</label>\r\n");
      out.write("                            </span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <!-- 点击是 yesduty -->\r\n");
      out.write("                    <td class=\"td-col4-title yesduty\"><label class=\"inputlable\">不作为事项：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content yesduty\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                    <!-- 点击否 noduty -->\r\n");
      out.write("                    <td class=\"td-col4-title noduty\"><label class=\"inputlable\">行政类别管理：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content noduty\"><select class=\"fyselect\">\r\n");
      out.write("                            <option>1</option>\r\n");
      out.write("                            <option>2</option>\r\n");
      out.write("                            <option>3</option>\r\n");
      out.write("                            <option>4</option>\r\n");
      out.write("                            <option>5</option>\r\n");
      out.write("                            </select></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <!-- 点击否 noduty -->\r\n");
      out.write("                <tr class=\"tr-col4 noduty\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">具体行政行为文号：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">具体行政行为做出日期：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <!-- 点击否 noduty -->\r\n");
      out.write("                <tr class=\"tr-col4 noduty\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">收到处罚决定书日期：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">得知该具体行为途径：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <!-- 点击是 yesduty -->\r\n");
      out.write("                <tr class=\"tr-col4 yesduty\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请人要求被申请人履行该项法定职责日期：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td class=\"td-col4-title\"></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <!--单列表单-->\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">具体行政行为：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <textarea class=\"rowinput\" rows=\"3\"></textarea></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">行政复议请求：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <textarea class=\"rowinput\" rows=\"3\"></textarea></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">行政复议请求：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <textarea class=\"rowinput\" rows=\"3\"></textarea></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <!-- 按钮组 -->\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">行政复议前置：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <span class=\"radio-group\">\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz1\" /><label>是</label>\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz1\" /><label>否</label>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请举行听证会：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <span class=\"radio-group\">\r\n");
      out.write("                             <input type=\"radio\" name=\"radio-xz3\" /><label>是</label>\r\n");
      out.write("                             <input type=\"radio\" name=\"radio-xz3\" /><label>否</label>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请赔偿：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <span class=\"radio-group\">\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz4\" onclick=\"showInput(this);\"/><label>是</label>\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz4\" onclick=\"hideInput(this);\"/><label>否</label>\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"li-input\">\r\n");
      out.write("                        <label class=\"lilable\">赔偿请求类型：</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"\" placeholder=\"\">\r\n");
      out.write("                        <label class=\"lilable\">赔偿请求金额：</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"\" placeholder=\"\">\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">申请附带对规范性文件的审查：</label></td>\r\n");
      out.write("                    <td colspan=\"3\"> <span class=\"radio-group\">\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz5\" onclick=\"showInput(this);\"/><label>是</label>\r\n");
      out.write("                            <input type=\"radio\" name=\"radio-xz5\" onclick=\"hideInput(this);\"/><label>否</label>\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"li-input\">\r\n");
      out.write("                                <label class=\"lilable\">规范性文件名称：</label>\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"\" placeholder=\"\">\r\n");
      out.write("                                </span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- 立案信息  -->\r\n");
      out.write("    <div class=\"content\" id=\"d1\">\r\n");
      out.write("        <div class=\"fyform\">\r\n");
      out.write("            <table class=\"table-col4\">\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">受理结果：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">受理承办人：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">案件编号：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">立案时间:</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">立案意见：</label></td>\r\n");
      out.write("                    <td class=\"\" colspan=\"3\"><textarea class=\"rowinput\" rows=\"5\"></textarea></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">是否经过补办：</label></td>\r\n");
      out.write("                    <td class=\"\" colspan=\"3\">\r\n");
      out.write("                        <input type=\"radio\" name=\"optradio\" /><span>是</span>\r\n");
      out.write("                        <input type=\"radio\" name=\"optradio\" /><span>否</span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- 审理信息  -->\r\n");
      out.write("    <div class=\"content\" id=\"d1\">\r\n");
      out.write("        <div class=\"fyform\">\r\n");
      out.write("            <table class=\"table-col4\">\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">结案类型：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><select class=\"fyselect\">\r\n");
      out.write("                            <option>1</option>\r\n");
      out.write("                            <option>2</option>\r\n");
      out.write("                            <option>3</option>\r\n");
      out.write("                            <option>4</option>\r\n");
      out.write("                            <option>5</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">审理承办人：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><select class=\"fyselect\">\r\n");
      out.write("                            <option>1</option>\r\n");
      out.write("                            <option>2</option>\r\n");
      out.write("                            <option>3</option>\r\n");
      out.write("                            <option>4</option>\r\n");
      out.write("                            <option>5</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">结案时间:</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">结案法律文书文号：</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\"><input type=\"text\" class=\"fyinput\" id=\"\" placeholder=\"\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">处理理由：</label></td>\r\n");
      out.write("                    <td class=\"\" colspan=\"3\"><textarea class=\"rowinput\" rows=\"6\"></textarea></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">是否经过补办：</label></td>\r\n");
      out.write("                    <td class=\"\" colspan=\"3\">\r\n");
      out.write("                        <input type=\"radio\" name=\"optradio\" /><span>是</span>\r\n");
      out.write("                        <input type=\"radio\" name=\"optradio\" /><span>否</span>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                <tr class=\"tr-col4\">\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">终止日期:</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td class=\"td-col4-title\"><label class=\"inputlable\">恢复日期:</label></td>\r\n");
      out.write("                    <td class=\"td-col4-content\">\r\n");
      out.write("                        <div class=\"fyinput\">\r\n");
      out.write("                            <input class=\"easyui-datetimebox\" style=\"width:100%;height: 100%;\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"content materialDiv\" id=\"d1\">\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div id=\"rp_btn\" class=\"fr\">\r\n");
      out.write("        <!-- 放左侧的按钮统一加在这 -->\r\n");
      out.write("        <span class=\"rp-btn-left\"> \r\n");
      out.write("           \r\n");
      out.write("        </span>\r\n");
      out.write("\r\n");
      out.write("        <input id=\"back\" class=\"fy-btn blue-btn\" type=\"button\" value=\"上一步\" title=\"上一步\" onclick=\"back();\" />\r\n");
      out.write("        <input id=\"submit\" class=\"fy-btn green-btn\" type=\"button\" value=\"提  交\" title=\"提交\" onclick=\"\" />\r\n");
      out.write("        <input id=\"fill\" class=\"fy-btn green-btn\" type=\"button\" value=\"填报完成\" title=\"填报完成\" onclick=\"\" />\r\n");
      out.write("        <input id=\"forward\" class=\"fy-btn blue-btn\" type=\"button\" value=\"下一步\" title=\"下一步\" onclick=\"forward();\" />\r\n");
      out.write("        <input id=\"finish\" class=\"fy-btn blue-btn\" type=\"button\" value=\"完成并继续填报\" title=\"完成并继续填报\" onclick=\"forward();\" />\r\n");
      out.write("    </div>\r\n");
      out.write("    <script>\r\n");
      out.write("        $('.li-input').hide();\r\n");
      out.write("        $('.select-two').hide();\r\n");
      out.write("        $('.yesduty').hide();\r\n");
      out.write("        $('.noduty').show();\r\n");
      out.write("\r\n");
      out.write("        function showInput(that) {\r\n");
      out.write("\r\n");
      out.write("            $(that).parent().siblings('.li-input').show();\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function hideInput(that) {\r\n");
      out.write("\r\n");
      out.write("            $(that).parent().siblings('.li-input').hide();\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function yesDuty() {\r\n");
      out.write("            $('.yesduty').show();\r\n");
      out.write("            $('.noduty').hide();\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function noDuty() {\r\n");
      out.write("            $('.noduty').show();\r\n");
      out.write("            $('.yesduty').hide();\r\n");
      out.write("        }\r\n");
      out.write("        $(\".apply-select\").change(function() {\r\n");
      out.write("            var selected = $(\".apply-select\").val();\r\n");
      out.write("            if (selected == \"当面接待\") {\r\n");
      out.write("                $('.select-one').show();\r\n");
      out.write("                $('.select-two').hide();\r\n");
      out.write("            } else if (selected == \"书面来件\") {\r\n");
      out.write("                $('.select-one').hide();\r\n");
      out.write("                $('.select-two').show();\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        $('.case-tab').click(function() {\r\n");
      out.write("            $('.case-tab').removeClass('case-tab-active');\r\n");
      out.write("            $(this).addClass('case-tab-active');\r\n");
      out.write("        })\r\n");
      out.write("    </script>\r\n");
      out.write("    <script src=\"case.js\"></script>\r\n");
      out.write("    <script src=\"party.js\"></script>\r\n");
      out.write("    <script src=\"case_fillin.js\"></script>\r\n");
      out.write("    <script src=\"material.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
