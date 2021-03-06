<%@page import="kr.or.bit.Emp"%>
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
Tomcat(WAS) 기본적으로 제공하는 객체
1. request (요청 : 클라이언트 정보)
2. response (응답 : 특정 페이지 이동 , 정보 출력 , 쿠키 쓰기)
3. application(전역객체 : web.xml 파일 자원 처리 , 전역변수 )
4. session (접속 사용자 마다(sessionid) 마다 부여되는 고유한 객체 , 변수)
5. out (print)

session 객체
[session 변수 생성]
scope : (현재 웹 프로젝트:WebContent) 모든 페이지에서 사용가능
        a.jsp (session.setAt...)  -> b.jsp(session.getAtt ...)
Life-cycle : 소멸(sessoinId 동일) >> 서버 리부팅 , session.invalidate()    

application 객체
[application 변수 : 전역 : 모든 session 이 공유할 수 있다]
scope : 모든 사용자가 모든 페이지에서 제어 가능 (java : static 비교 하자면)
Life-cycle : 소멸 >> 서버 리부팅

+
request  객체
[request  변수] : request.setAttribute("type","A");
scope : 요청 페이지 (login.jsp -> request 객체 ... page scope)
예외적으로 ..
*****~~~~~~~ login.jsp (include , forward) request 객체 공유한다 ****~~~~~~
    
-->
<%
  Emp emp = new Emp();
  emp.setEmpno(2000);
  emp.setEname("홍길동");
  
  session.setAttribute("empobj", emp);
  
  Emp e = (Emp)session.getAttribute("empobj");
  out.print(e.getEmpno() + "<br>");
  out.print(e.getEname() + "<br>");

  request.setAttribute("who", "king"); //scope >> Ex24_Objet_Scope.jsp 안에서
  String who = (String)request.getAttribute("who");
  out.print("request : " + who);
%>
<%-- <jsp:include page="b.jsp"></jsp:include> --%>
<!--  
  session.getAttribute("empobj");
  request.getAttribute("who");
-->
</body>
</html>




