<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
out.print("<script>");
out.print("location.href='Main.jsp'");
out.print("</script>");
request.setCharacterEncoding("UTF-8");


String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//Class.forName("oracle.jdbc.OracleDriver"); tomcat 9.0 생략 가능
try{
	
	//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
	//비기능적 요구사항
	conn = Singleton_Helper.getConnection("oracle");
	String sql="select id, pwd from koreamember where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery(); 
	System.out.println(rs+"성공");
	//업무 (아이디가 있는지 없는지 확인)
	while(rs.next()){ //데이터가 있다(id가 존재) -> 이사람의 pwd가 DB pwd와 맞는지 확인
		if(pwd.equals(rs.getString("pwd"))){ //아이디 존재, 비밀번호도 맞음
			//ID 존재, pwd(O)
			//정상회원
			
			//Top.jsp 정보를 줌 (로그인 상태)
			session.setAttribute("userid", rs.getString("id"));
			
			//이동 처리
			response.sendRedirect("Main.jsp");
		}else { //아이디는 존재,그러나 비밀번호가 맞지 않음
			out.print("<script>");
				out.print("location.href='Login_form.jsp'");
			out.print("</script>");
		}
	}
	//while 타지 않는 경우
	out.print("<script>");
		out.print("location.href='Join_form.jsp'");
	out.print("</script>");	

}catch(Exception e){
	System.out.println(e.getMessage());
}finally{
	Singleton_Helper.close(rs);
	Singleton_Helper.close(pstmt);
}
%>