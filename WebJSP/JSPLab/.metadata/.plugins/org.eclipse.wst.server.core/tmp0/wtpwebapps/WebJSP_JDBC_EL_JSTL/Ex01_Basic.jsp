<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// login.html -> submit -> Ex01_Basic.jsp (요청 받는 패이지)
	String id = request.getParameter("userid");
	
	// include, forward 페이지에서만 사용하겠다
	request.setAttribute("name", "korea");
	session.setAttribute("user", "bit");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<!--  
	EL(표현식): jsp 페이지에서 사용하는 script 언어(화면 출력)
	이유: 스파게티 코드(%와 html 혼재되는 코드) > 유지보수, 코드 해석(가독성)의 어려움
		>> 문제를 개선하기 위해 script 기반의 EL, JSTL 생성(jsp 페이지에서만 사용가능)
	목적: jsp 페이지에서 화면 출력(% 없이 서버쪽 자원을 화면에 출력)
	
	EL이 가지는 기본 객체
	paramValues: 요청 parameter <파라미터 이름, 값배열> 매핑을 저장한 Map 객체
	param: 요청 parameter <파라미터 이름, 값> 매핑을 저자한 Map 객체
	requestScope: request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체
	sessionScope: session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체
	applicationscope: application 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체
-->
스크립트 릿: <b><%= id %></b><br>
스크립트 릿: <%= request.getAttribute("name") %><br>
스크립트 릿: <%= session.getAttribute("user") %><br>
<hr>
EL request value: ${requestScope.name}<br>
EL request value(생략: requestScope.): ${name}<br>
EL session value(생략: sessiontScope.): ${user}<br>
EL session value: ${sessionScope.user}<br>
<hr>
기존: <%= request.getParameter("userid") %><br>
EL: ${ param.userid }<br>

<h3>EL 기본 문법</h3>
<b>EL 표현식(출력 목적)</b><br>
스크립트 릿 <%= 200 + 400 %><br>
EL: ${200 + 300} <br>
EL: ${"1" + 1} <br> <!-- 문자형 숫자에 대해 자동형변환 > 연산 -->
EL: ${1==1}<br> <!-- 논리연산 -->
EL: ${!true}<br>
EL: ${empty x}<br> <!-- x라는 값이 비어있니 -->
<%-- EL: ${null + 1}<br> --%> <!-- null 값을 0 변환 후 연산 -->
</body>
</html>