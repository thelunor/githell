<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Tomcat Connection Pool</title>
</head>
<body>
<%
	Connection conn =null;
	
	Context context = new InitialContext(); //현재 웹 프로젝트에서 이릅 기반 검색 : naming
	DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/oracle"); //무조건 써야함 개발자들 끼리 약속 : java:comp/env/ + name 
	
	//POOL안에서 connection 가지고 오기  -> context.xml에서
	conn=ds.getConnection();
	
	out.print("db 연결 여부 : " + conn.isClosed()+"<br>");
	//db 연결확인은 project할때 먼저 돌려보고 문제 없으면 작업하기 
	//POINT
	//POOL에 connection 반환하기
	conn.close(); //보통 close는 연결 끊기 이지만 여기서는 반환하는 기능
	
	out.print("db 연결 여부 : " + conn.isClosed()+"<br>");

%>
</body>
</html>






