<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("mname");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	System.out.println(id);
	System.out.println(pwd);
	System.out.println(name);
	System.out.println(age);
	System.out.println(gender);
	System.out.println(email);

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bituser", "1004");
		String sql = "insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, request.getRemoteAddr());

		int result = pstmt.executeUpdate();
		if (result != 0) {
			out.print("<script>");
			out.print("location.href='Join_finish.jsp'");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('가입실패');");
			out.print("</script>");
		}
	} catch (Exception e) {
		out.print("<script>");
		out.print("alert('가입실패');");
		out.print("location.href='Join_form.jsp'");
		out.print("</script>");
	} finally {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {

			}
		}
	}
%>