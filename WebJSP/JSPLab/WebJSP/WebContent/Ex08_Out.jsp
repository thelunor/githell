<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체(WAS 가지는 없는...): Out</title>
</head>
<body>
	<%
		boolean b = true;
		if(10 > 5) {
	%>
		IF(true): <font color="red"><%= b %></font>
		<!-- <5=는 <5 5> 안에 들어갈 수 없다 -->
	<%
		} else {
			b=false;
	%>
		IF(true): <font color="blue"><%= b %></font>
	<%
		}
	%>
	<h3>out 객체(서버코드 작업이 편하다: UI 작업)</h3>
	<!-- out 객체와 스파게티 코드 둘 다 사용할 줄 알아야 한다 -->
	<%
		boolean b2 = true;
		if(10>5) {
			out.print("IF(true): <font color='red'>" + b2 + "</font>"); // html 지원(x), 문자열만 가능
		} else {
			out.print("IF(true): <font color='blue'>" + b2 + "</font>"); // html 지원(x), 문자열만 가능
			
		}
	%>
</body>
</html>