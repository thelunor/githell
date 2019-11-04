/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.26
 * Generated at: 2019-11-04 06:52:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kr.or.bit.utils.Singleton_Helper;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class Memberlist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("kr.or.bit.utils.Singleton_Helper");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("UTF-8");

      out.write("\r\n");
      out.write("\r\n");


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
	conn = Singleton_Helper.getConnection("oracle");
	String sql = "select id, pwd, name, age, gender, email from koreaMember";

	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();


      out.write("\r\n");
      out.write("\r\n");
      out.write("<section id=\"id\" class=\"about roomy-100\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"about_content\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <h1 class=\"h3 mb-2 text-gray-800\">회원 관리</h1>\r\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Topbar_Search.jsp", out, false);
      out.write("\r\n");
      out.write("                <!-- DataTales Example -->\r\n");
      out.write("                <div class=\"card-header py-3\">\r\n");
      out.write("                    <h6 class=\"m-0 font-weight-bold text-primary\">회원목록</h6>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"card-body\">\r\n");
      out.write("                    <div class=\"table-responsive\">\r\n");
      out.write("\r\n");
      out.write("                        <form action=\"Ex03_MemberEditok.jsp\" method=\"post\">\r\n");
      out.write("                            <table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\r\n");
      out.write("                                <thead>\r\n");
      out.write("                                    <tr>\r\n");
      out.write("                                        <th>ID</th>\r\n");
      out.write("                                        <th>Password</th>\r\n");
      out.write("                                        <th>Name</th>\r\n");
      out.write("                                        <th>Age</th>\r\n");
      out.write("                                        <th>Gender</th>\r\n");
      out.write("                                        <th>Email</th>\r\n");
      out.write("                                    </tr>\r\n");
      out.write("                                </thead>\r\n");
      out.write("                                ");
 while (rs.next()) {
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td><a\r\n");
      out.write("                                            href=\"MemberDetail.jsp?id=");
      out.print(rs.getString("id"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("id"));
      out.write("</a>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                    <td>");
      out.print(rs.getString("pwd"));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print(rs.getString("name"));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print(rs.getString("age"));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print(rs.getString("gender"));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print(rs.getString("email"));
      out.write("</td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                                ");
} 
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            </table>\r\n");
      out.write("                        </form>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <a href=\"Member_modify.jsp?userId=");
      out.print(rs.getString("id"));
      out.write("\">수정</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

					}catch(Exception e){
						
					}finally{
							Singleton_Helper.close(rs);
							Singleton_Helper.close(pstmt);
					}
				
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--End off container -->\r\n");
      out.write("</section>\r\n");
      out.write("<!-- scroll up-->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "ScrollUp.jsp", out, false);
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
