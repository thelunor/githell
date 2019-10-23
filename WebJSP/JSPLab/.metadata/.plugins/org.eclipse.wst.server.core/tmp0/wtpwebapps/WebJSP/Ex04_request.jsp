<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 한글처리***항상
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	/*
		request 객체(요청 객체)
		- Tomcat이 가지고 있는 내장 객체
		[jsp 파일에서는 Default로 Tomcat이 가지고 있는 내장 객체를 선언없이 사용 가능]
		
		1. 요청 페이지당 한 개의 request 객체 생성
		2. 클라이언트 정보를 서버로 보내기(request 객체에 숨겨서)
		3. 클라이언트 정보(IP, 웹 브라우저(버전, 종류))
		
		request 내장 객체는 클라이언트에서 서버로 요청할 때 생성
		HttpServletRequest 타입을 갖는 객체가 자동생성되고 그 주소를 참조하는 객체가 request...
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 객체 함수</title>
</head>
<body>
id: <%= id %><hr>
접속한 클라이언트 IP: <%= request.getRemoteAddr() %><br>
서버:(요청한 방식: 인코딩): <%= request.getCharacterEncoding() %><br>
전송방식: <%= request.getMethod() %><br>
포트번호: <%= request.getServerPort() %><br>
context root(홈 디렉토리(가상 디렉토리, 웹 경로)): <%= request.getContextPath() %><br>
<!--  
	request.getContextPath() >>
	가상경로(웹에서): /WebJSP
	실제경로: C:\SmartWeb\WebJSP\JSPLab\WebJSP
	
	http://192.168.0.145:8090/WebJSP/Ex04_request.jsp >> 가상경로
	
	http://192.168.0.145:8090/WebJSP/images/1.jpg 가지는 서비스 경로(default) >> WebContent 폴더를 의미합니다
-->
<%= request.getRequestURI() %>
<!--  
/WebJSP/Ex04_request.jsp 
-->
</body>
</html>