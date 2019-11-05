<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("ID");
	if (id.equals("hong")) {
%>
	<%= id %> <img alt="이미지" src="images/1.png" style="width: 100px; height: 100px">
<%
	}
%>

<h3>EL & JSTL 사용하기</h3>

<c:if test="${param.ID == 'hong'}">
	${param.ID}<img alt="이미지" src="images/1.png" style="width: 100px; height: 100px">
</c:if>
<h3>JSTL IF문</h3>
<c:if test="${param.age > 20}" var="result">
<!-- test는 조건문, var는 결과값 -->
	param.value: ${param.age}<br>
</c:if>
	if구문에서 만들었던 var 변수값: ${result}<br>
</body>
</html>