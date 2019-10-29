<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
	1. 메모리 쿠키(브라우저 쿠키): Client가 강제적으로 지우지 않는 한, 브라우저를 종료하기 전까지, 강제로 소멸시간을 (-1) 부여
	2. 파일 쿠키: 소멸 시간을 가지고 있다: Client가 강제로 지우지 않는 한, 정해진 시간
		setMaxAge(60): 60초
		30일: 30*24*60*60(일*시*분*초)
-->
<%
	Cookie co = new Cookie("bit", "hong");
	co.setMaxAge(60);
	response.addCookie(co);
%>
</body>
</html>