<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*  
 WAS : [여러개의 웹 어플리케이션]을 서비스 할수 있다
 WAS 안에 WebJSP 웹 프로젝트(어플리케이션)을 가지고 있다
 
 http://192.168.0.3:8090/WebJSP/Ex10_Application.jsp
 http://192.168.0.3:8090/WebJSP2/default.jsp
 
 WebJSP    어플리케이션 이름  , 프로젝트 이름 , 가상 디렉토리
 ---C:\SmartWeb\WebJSP\JSPLab\WebJSP 실경로 ..
 ---http://192.168.0.3:8090/WebJSP/  웹 경로(가상 디렉토리)
 WebJSP2   어플리케이션 이름  , 프로젝트 이름
 
 어플리케이션 이 가지는 default 서비스 경로 : 실 서비스 경로 : WebContent (Context root)
http://192.168.0.3:8090/WebJSP/

**우리가 만든 소스파일은 (html , htm , jsp , js , css)
WebContent 안에 있어야 합니다
WebContent 안에 있는 모든 페이지(JSP) 가 [공유]할 수 있는 [자원은 없을까] ??????******

저는 어떤 자원은 a.jsp , b.jsp 사용 .....

**웹 어플리케이션은 하나의 설정 파일을 가진다 (웹 전체를 설정 정보 가질 수 있다)
**web.xml(웹 어플리케이션의 설정 정보 관리) >> 가장 먼저 실행 
**WebContent > WEB-INF > web.xml 

**WEB-INF (보안폴더) >> 클라이언트가 접속할 수 없는 경로 >> 주소 접근(404)
**http://localhost:8090/Web_mall/WEB-INF/web.xml
**WEB-INF > views 폴더 > member 폴더 > login.jsp 생성  (나중에 : forward ..)


application 객체 처리 (web.xml 자원 ....)

*/	
int sum = 0; //유효범위 : page 생성되면 ... page 끝나면 소멸  (PAGE)
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String param = application.getInitParameter("email");
		out.print("<h3>" + param + "</h3>");
		
		String param2 = application.getInitParameter("FilePath");
		out.print("<h3>" + param2 + "</h3>");
	
	%>
</body>
</html>






