<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response</title>
</head>
<body>
<!--  
	Client -> Server
		요청(request)
	
	Server -> Client
		응답(response)
		
	Tomcat (JavaX...)
	
	response
	1. 출력(표현식): <5=
	2. 페이지 이동처리(sendRedirect)
	
		javascript: 페이지 이동: location.href="Ex01_Basic.jsp"
		: *** 페이지를 서버에 재요청 ***(주소창에 엔터, F5)
		
		java: response.sendRedirect("Ex01_Basic.jsp") === location.href="Ex01_Basic.jsp" // response는 tomcat이 가지고 있다
		java 코드는 Client 브라우저가 해석하지 못해서 was에서 location.href로 바꿔서 해석할 수 있도록
-->
	1. 일반적인 사용(=출력): <%= 100 + 200 + 300 %><br>
	2. sendRedirect: response 객체의 함수(클라이언트가 서버에게 페이지 재요청)
	<%
		// response.sendRedirect("Ex01_Basic.jsp"); // 페이지에 대한 재요청
	%>
</body>
<!--  
	response.sendRedirect("Ex01_Basic.jsp");
	이 코드를 javascript로 바꾸면
-->
<script type="text/javascript">
	location.href="Ex01_Basic.jsp";
</script>
</html>