package org.apache.jsp.xzfy.jsp.caseAcceptence;

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

public final class caseInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/header/header2.0.jsp");
    _jspx_dependants.add("/header/easyui.jsp");
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
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/common/easyui/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/common/easyui/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/common/js/src/teeValidagteBox.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/common/easyui/datagrid-groupview.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/common/easyui/themes/gray/easyui.css\">");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\"/>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("\t\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/xzfy/css/init1.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/xzfy/css/common.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/xzfy/css/index.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/xzfy/css/case.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/xzfy/imgs/caseInfo_icon/iconfont.css\" />\r\n");
      out.write("    \r\n");
      out.write("    <script type=\"text/javascript\" src=\"/xzfy/js/common/common.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/xzfy/js/base/juicer-min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/common/My97DatePicker/WdatePicker.js\"></script>\r\n");
      out.write("    <title>案件信息</title>\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("    html, body, div{\r\n");
      out.write("\tmargin:0;\r\n");
      out.write("\tpadding:0;\r\n");
      out.write("\tborder:0;\r\n");
      out.write("\toutline:0;\r\n");
      out.write("\tfont-weight:inherit;\r\n");
      out.write("\tfont-style:inherit;\r\n");
      out.write("\tfont-size:100%;\r\n");
      out.write("\tfont-family:inherit;\r\n");
      out.write("\tvertical-align:baseline;\r\n");
      out.write("\t-webkit-text-size-adjust:90%;\r\n");
      out.write("    overflow: auto;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t.iconfont {\r\n");
      out.write("\t\tcursor: pointer;\r\n");
      out.write("\t}\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body onload=\"doInit()\" >\r\n");
      out.write("    <div id=\"toolbar\" class = \" clearfix\" style=\"margin-top: 5px\">\r\n");
      out.write("\t    <div class=\"fl\" style=\"position:static\">\r\n");
      out.write("\t\t    <span class=\"title\" id=\"title\"></span>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t    <div class = \"right fr clearfix\" id=\"accept\" >\r\n");
      out.write("\t        <input type=\"button\" class=\"btn-win-white\" onclick=\"submit();\" value=\"保存\"/>&nbsp;\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t    <span class=\"basic_border_grey\" style=\"margin-top: 10px\"></span>\r\n");
      out.write("   \t</div>\r\n");
      out.write("    <div id=\"case-div\">\r\n");
      out.write("\t\t<div class=\"lanky-container\">\r\n");
      out.write("\t\t\t<div class=\"lanky-title\">当事人信息</div>\r\n");
      out.write("\t\t\t<table class=\"lanky-table\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">申请人类型：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t\t\t<select class=\"lanky-input\" id=\"applicantType\" name=\"applicantType\">\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">申请人总数：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\"id=\"totalApplicant\">0</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">是否有申请人代理人：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isAgent\" id=\"isAgentA\" value=\"1\" onclick=\"agent(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isAgent\" id=\"isAgentB\" value=\"0\" onclick=\"agent(0)\" />否\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">是否有被申请人代理人：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isRespondent\" id=\"isRespondentA\" value=\"1\" onclick=\"respondentA(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isRespondent\" id=\"isRespondentB\" value=\"0\" onclick=\"respondentA(0)\" />否\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">是否有第三人：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isThird\" id=\"isThirdA\" value=\"1\" onclick=\"third(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isThird\" id=\"isThirdB\" value=\"0\" onclick=\"third(0)\" />否\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-item\">是否有第三人代理人：</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isThirdAgent\" id=\"isThirdAgentA\" value=\"1\" onclick=\"thirdAgent(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t\t\t\t\t\t&nbsp;<input type=\"radio\" name=\"isThirdAgent\" id=\"isThirdAgentB\" value=\"0\" onclick=\"thirdAgent(0)\"/>否\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 申请人信息 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\">\r\n");
      out.write("\t\t\t<p class=\"case-head-title\">申请人信息：</p>\r\n");
      out.write("\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t<table id=\"applicant-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">姓名</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">性别</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">民族</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">送达地址</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">邮编</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">联系电话</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<p class=\"edit-table-add\" onclick=\"addApplicantRow();\">添加</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<!-- 其他申请人 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\">\r\n");
      out.write("\t\t\t<p class=\"case-head-title\">其他申请人信息：</p>\r\n");
      out.write("\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t<table id=\"otherApplicant-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">姓名</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">性别</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<p class=\"edit-table-add\" onclick=\"addOtherRow();\">添加</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 申请人代理人 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\" id=\"applicantAgent\">\r\n");
      out.write("\t\t\t<p class=\"case-head-title\">申请人代理人信息：</p>\r\n");
      out.write("\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t<table id=\"applicantAgent-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">代理人类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">代理人姓名</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">联系电话</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">是否授权书</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">被代理人</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<p class=\"edit-table-add\" onclick=\"addApplicantAgentRow();\">添加</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 被申请人 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\">\r\n");
      out.write("\t\t\t<p class=\"case-head-title\">被申请人：</p>\r\n");
      out.write("\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t<table id=\"respondent-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">被申请人类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">被申请人姓名</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<p class=\"edit-table-add\" onclick=\"addRespondentRow();\">添加</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- 被申请人代理人 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\" id=\"respondentAgent\">\r\n");
      out.write("\t\t\t<p class=\"case-head-title\">被申请人代理人信息：</p>\r\n");
      out.write("\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t<table id=\"respondentAgent-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">代理人类型</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">代理人姓名</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">联系电话</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">是否授权书</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">被代理人</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<p class=\"edit-table-add\" onclick=\"addRespondentAgentRow();\">添加</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- 第三人 -->\r\n");
      out.write("\t<div class=\"recpinfo\" id=\"third\">\r\n");
      out.write("\t\t<p class=\"case-head-title\">第三人信息：</p>\r\n");
      out.write("\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t<table id=\"third-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">姓名</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">性别</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">民族</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">送达地址</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">邮编</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">联系电话</th>\r\n");
      out.write("\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<p class=\"edit-table-add\" onclick=\"addThirdRow();\">添加</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<!-- 第三人代理人 -->\r\n");
      out.write("\t\t<div class=\"recpinfo\" id=\"thirdAgent\">\r\n");
      out.write("\t\t\t\t<p class=\"case-head-title\">第三人代理人信息：</p>\r\n");
      out.write("\t\t\t\t<div class=\"edit-table-div\">\r\n");
      out.write("\t\t\t\t\t<table id=\"thirdAgent-table\" class=\"edit-table\">\r\n");
      out.write("\t\t\t\t\t\t<tr class=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">序号</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">代理人类型</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">代理人姓名</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">证件类型</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">证件号</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">联系电话</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">是否授权书</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">被代理人</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th class=\"\">&nbsp;</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t<p class=\"edit-table-add\" onclick=\"addThirdAgentRow();\">添加</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- 复议事项 -->\r\n");
      out.write("\t<div class=\"lanky-container\">\r\n");
      out.write("\t\t<div class=\"lanky-title\">复议事项</div>\r\n");
      out.write("\t\t<div class=\"lanky-content\">\r\n");
      out.write("\t\t\t\t<table class=\"lanky-table\" id=\" \">\r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">申请日期：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<input class=\"lanky-input Wdate\" type=\"text\" id=\"applicationDate\" readonly onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\"/>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">行政类别管理：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t    \t\t<select class=\"lanky-input\" id=\"category\" name=\"category\">\r\n");
      out.write("\t        \t\t\t</select>\r\n");
      out.write("\t\t\t   \t\t</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">申请事项：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<select class=\"lanky-input\" id=\"applicationItem\" name=\"applicationItem\">\r\n");
      out.write("\t          \t\t\t</select>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item\">行政不作为：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td\">\r\n");
      out.write("\t\t\t\t          &nbsp;<input type=\"radio\" id=\"isNonfeasanceA\" name=\"isNonfeasance\" onclick=\"nonfeasanceCheck(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t\t\t\t          &nbsp;<input type=\"radio\" id=\"isNonfeasanceB\" name=\"isNonfeasance\" onclick=\"nonfeasanceCheck(0)\"/>否\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    <tr id=\"isNonfeasanceAtra\" style=\"display: none;\">\r\n");
      out.write("\t\t\t        <td class=\"lanky-item \">具体行政行为名称：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<input class=\"lanky-input \" type=\"text\" id=\"specificAdministrativeName\"/>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">具体行政行为文号：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t   \t\t<input class=\"lanky-input \" type=\"text\" id=\"specificAdministrativeNo\" />\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">具体行政行为做出日期：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t        <input class=\"lanky-input Wdate\" type=\"text\" id=\"specificAdministrativeDate\" readonly onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\"/>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">收到处罚决定书日期：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<input class=\"lanky-input Wdate\" type=\"text\" id=\"receivedPunishDate\" readonly onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\"/>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    <tr id=\"isNonfeasanceAtrb\" style=\"display: none;\">\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">得知该具体行为途径：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<input class=\"lanky-input \" type=\"text\" id=\"receivedSpecificWay\" />\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    <tr id=\"isNonfeasanceBtr\" style=\"display: none;\">\r\n");
      out.write("\t\t\t        <td class=\"lanky-item \">不作为事项：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<select class=\"lanky-input\" id=\"nonfeasanceItem\" name=\"applicationItem\">\r\n");
      out.write("\t          \t\t\t</select>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \" colspan=\"3\">申请人要求被申请人履行该项法定责任日期：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<input class=\"lanky-input Wdate\" type=\"text\" id=\"nonfeasanceDate\" readonly onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\"/>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">具体行政行为：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \" colspan=\"7 \">\r\n");
      out.write("\t\t\t\t    \t<textarea class=\"lanky-input \" rows=\"3 \" cols=\"100 \" id=\"specificAdministrativeDetail\"></textarea>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">行政复议请求：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \" colspan=\"7 \">\r\n");
      out.write("\t\t\t\t    \t<textarea class=\"lanky-input \" rows=\"3 \" cols=\"100 \" id=\"requestForReconsideration\"></textarea>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">行政复议前置：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t&nbsp;<input type=\"radio\" id=\"isReviewA\" name=\"isReview\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t        \t\t\t&nbsp;<input type=\"radio\" id=\"isReviewB\" name=\"isReview\" />否\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t   \r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">申请举行听证会：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t\t    &nbsp;<input type=\"radio\" id=\"isHoldHearingA\" name=\"isHoldHearing\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t          \t\t\t&nbsp;<input type=\"radio\" id=\"isHoldHearingB\" name=\"isHoldHearing\" />否\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    \r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">申请对规范性文件审查：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t\t    &nbsp;<input type=\"radio\" id=\"isDocumentReviewA\" name=\"isDocumentReview\" onclick=\"docCheck(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t        \t\t\t&nbsp;<input type=\"radio\" id=\"isDocumentReviewB\" name=\"isDocumentReview\" onclick=\"docCheck(0)\"/>否\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">规范性文件名称：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t\t    <input class=\"lanky-input \" type=\"text\" id=\"documentReviewName\" />\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    \r\n");
      out.write("\t\t\t    </tr>\r\n");
      out.write("\t\t\t    <tr>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">申请赔偿：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t\t    &nbsp;<input type=\"radio\" id=\"isCompensationA\" name=\"isCompensation\" onclick=\"payCheck(1)\" checked=\"checked\"/>是&nbsp;\r\n");
      out.write("\t         \t\t\t&nbsp;<input type=\"radio\" id=\"isCompensationB\" name=\"isCompensation\" onclick=\"payCheck(0)\"/>否\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">赔偿请求类型：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t    \t<select class=\"lanky-input\" id=\"compensationTypeCode\" name=\"compensationTypeCode\">\r\n");
      out.write("\t    \t\t\t\t</select>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-item \">赔偿请求金额：</td>\r\n");
      out.write("\t\t\t\t    <td class=\"lanky-td \">\r\n");
      out.write("\t\t\t\t   \t\t<input class=\"lanky-input \" type=\"text\" id=\"compensationAmount\" />\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t     </tr>\r\n");
      out.write("\t\t    </table>\r\n");
      out.write("\t\t    </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/xzfy/js/caseAcceptence/acceptcommon.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/xzfy/js/caseAcceptence/caseInfoInit.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"/xzfy/js/caseAcceptence/caseInfo.js\"></script>\r\n");
      out.write("    \r\n");
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