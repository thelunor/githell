<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 1. request 객체를 사용하여 클라이언트가 입력한 값 받아오기
	// input > text, password, radio, textarea, select(기본적으로는 단일값)
	// input > checkbox, select(multiple): 다중값
	// 넘어오는 값이 단일값이냐 다중값이냐
	
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("pwd");
	
	// 다중값
	// <input checkbox name="hobby" ... 여러 개
	// ?hobby=a&hobby=b&hobby=c
	String[] hobbys = request.getParameterValues("hobby");
	
	// for (String str : hobbys) {
		// 출력
	// }
	
	Enumeration<String> e = request.getParameterNames(); // 넘어오는 변수명들
	String name = "";
	while (e.hasMoreElements()) {
		name += " / " + e.nextElement();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
userid: <%= userid %><br>
userpwd: <%= userpwd %><br>
<%
	for (String str : hobbys) {
%>
	취미: <%= str %><br>
<%		
	}
%>
<br>
request.getParameterNames: <%= name %>
</body>
</html>