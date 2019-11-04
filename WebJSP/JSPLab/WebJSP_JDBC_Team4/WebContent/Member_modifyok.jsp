<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String mname = request.getParameter("mname");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String userId = request.getParameter("userId");
	out.print(id + " / " + mname + " / " + age + " / " + email + "/" + gender + "/" + pwd + "/");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "update koreamember set id=?, pwd=?, name=? , age=?, gender=?, email=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, mname);
		pstmt.setString(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, userId);
		int result = pstmt.executeUpdate();
		out.print("<script>");
		out.print("location.href='AdminMain.jsp'");
		out.print("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		Singleton_Helper.close(pstmt);

	}
%>