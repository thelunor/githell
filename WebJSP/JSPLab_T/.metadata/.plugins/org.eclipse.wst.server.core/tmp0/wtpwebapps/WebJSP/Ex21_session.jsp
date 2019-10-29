<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
session : 브라우져(접속한 사용자) 마다 서버에서 부여하는 고유한 객체 

session 값 : 웹 서버가 접속한 클라이언트(브라우져)에게 부여하는 고유한 ID 값 (식별값)

A라는 사용자가 > 웹 서버에 접속 > session 객체 생성 > 고유한 ID 값을 만들고 > ID 값을 Client response 
자동으로 .....
JSESSIONID : 9C16E3985E5DEE06FDD80F128F18E30C
JSESSIONID : 0A4753B524E89D4CA4650D55A682BABA ,283A674AC76BADA40E53C41484F3FA81

광민씨 서버 : 9C16E3985E5DEE06FDD80F128F18E30C
제 서버 : 9C16E3985E5DEE06FDD80F128F18E30C

동기화 작업  (로그인 , 로그아웃 , 정보 )
처음 접속한 시간
마지막 접소한 시간

-->
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<h3>세션정보</h3>
session객체의 식별값 : <%= session.getId() %>
<hr>
<%
	time.setTime(session.getCreationTime());
%>
[session 생성된 시간] : <%=formatter.format(time) %>
<hr>
<%
	time.setTime(session.getLastAccessedTime());
%>
[session 마시막 접속 시간(client)] : <%=formatter.format(time) %>
</body>
</html>








