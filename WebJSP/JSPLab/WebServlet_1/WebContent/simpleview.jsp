<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>simpleController에서 Forward 된 Page</h3>
	요청한 결과 출력: <%= request.getAttribute("result") %>
	<br>
	<h3>EL & JSTL 표기 권장</h3>
	EL 요청한 결과: ${requestScope.result}
	<br>
</body>
</html>