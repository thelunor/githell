<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "delete from koreaMember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeQuery();

		out.print("<script>location.href='Member_modify.jsp?userId=" + userId + "'</script>");
	} catch (Exception e) {

	} finally {
		Singleton_Helper.close(pstmt);
	}
%>


