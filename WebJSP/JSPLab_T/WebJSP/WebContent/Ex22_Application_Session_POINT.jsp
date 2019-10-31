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
TODAY POINT
서버 자원(WAS .. memory) 활용

application    :   session
변수[전역]            변수 [개인에게 부여 : 접속한 브라우져 마다 : sessionID ]
                    (접속한 사용자마다 고유하게 부여되는 변수)

사이트 접속 : 전체 접속자 수 [10000명]
application.setAttribute("count",0); count 라는 전역변수 생성
사이트 접속하는 모든 session(사용자) 접근 가능 

[session]
session.setAttribute("userid","kglim");
접속한 사용자 마다 고유하게 부여되는 변수

A 라는 사용자가 웹 서버 접속
서버 session 객체 생성 > 식별값 (A001) > 클라이언트 브라우져(response) 
44051EA1ABF0B45917D8CBFAB8971948 >> session.setAttribute("userid","")


B 라는 사용자가 웹 서버 접속
서버 session 객체 생성 > 식별값 (B001) > 클라이언트 브라우져(response) 
B001 >> session.setAttribute("userid","")
-->
<h3>세션정보</h3>
웹 서버가 부여한 고유값 : <%= session.getId() %>
<hr>
<%
	String userid = request.getParameter("userid");
	session.setAttribute("id", userid); //id 라는 세션 변수
%>
<h3>세션 변수값</h3>
<%
	String id = (String)session.getAttribute("id");
	out.print("당신의 ID는 <b> " + id + "</b>");	
%>
</body>
</html>












