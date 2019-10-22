<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 서버쪽 객체 사용...
	// 아파치톰캣: 웹 전용 객체를 제공(request, response)
	// new 없이 바로 사용가능한 객체(내장 객체)
	
	// client가 서버에 전달한 데이터 받기
	// Ex02_register.jsp?userid=hong&pwd=111&hobby=baseball&hobby=soccer...
	
	String uid = request.getParameter("userid"); // 단일값 받기
	String pwd = request.getParameter("pwd");
	// String hobby = request.getParameter("hobby"); 이건 (x) >> 같은 값(타입)이 여러 개이다 >> 배열
	String[] hobbys = request.getParameterValues("hobby");
	// JDBC 코드 DB 연결...
	
	// ***** 한글처리 *****
	/*
		전송방식: get(Tomcat 9.0 이상부터는 한글 문제 없음)
		Tomcat 9.0 버전 이하
			request.setCharacterEncoding("UTF-8");
			server.xml: 63 line: <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/>
				URIEncoding="UTF-8" 속성 추가
		
		전송방식: post(Tomcat 9.0)
		1. 반드시(데이터 받기 전에): request.setCharacterEncoding("UTF-8");
		
		무조건 받는 페이지 상단에: request.setCharacterEncoding("UTF-8"); 추가하자
	*/
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력값: <%= uid %><br>
입력값: <%= pwd %><br>
당신의 취미는: <br>
<%
	for (String str : hobbys) {
%>
	hobby: <%= str %><br>
<%	
	}
%>
</body>
</html>