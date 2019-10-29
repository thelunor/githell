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
	 Client   ->    Server
	       요청(request)

     Server   ->   Client
               응답(response)
               
     Tomcat (Javax....)
     
     response  
     1. 출력(표현식) 
     2. 페이지 이동 처리(sendRedirect)
     
     :javascript : 페이지 이동 : location.href="Ex01_Basic.jsp" 
     :** 페이지 서버 재요청  주소창에 엔터 , F5  **      
     
     :java : response.sendRedirect("Ex01_Basic.jsp")  ===   location.href="Ex01_Basic.jsp" 
-->
	 1. 일반적인 사용(=출력) : <%= 100 + 200 + 300 %><br>
	 2. sendRedirect : response객채의 함수 (클라이언트 서버에게 페이지를 재요청)
	 <%
	 	//response.sendRedirect("Ex01_Basic.jsp"); // 페이지에 대한 재요청
	 %>
	 
</body>
<!-- 
	response.sendRedirect 작성 javascript
	
 -->
 <script type="text/javascript">
 	location.href="Ex01_Basic.jsp";
 </script>
</html>





