<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일 쿠키 read</h3>
<%
	// 클라이언트 브라우저가 가지고 있는(내 Domain) 쿠키를 가지고 오기 // Client의 모든 정보는 request, Server의 정보는 response
	Cookie[] cs = request.getCookies(); // s >> return type 배열: 아무 것도 없으면 null
	if(cs != null || cs.length>0) { // 둘 중에 하나라도 조건이 참이면 쿠키를 가져온 것
		for(Cookie c : cs) {
			out.print(c.getName() + "<br>");
			out.print(c.getValue() + "<br>");
			out.print(c.getMaxAge() + "<br>");
			out.print(c.getDomain() + "<br>");
		}
	}
%>
</body>
</html>