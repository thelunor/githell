<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>greeting</title>
</head>
<body>
	<h3>FrontServletController에 의해 forward 된 페이지</h3>
	기존방식: <%= request.getAttribute("msg") %>
	<br>
	EL & JSTL: ${requestScope.msg}
	<br>
</body>
</html>