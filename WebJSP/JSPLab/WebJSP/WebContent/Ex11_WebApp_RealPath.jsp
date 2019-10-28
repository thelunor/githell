<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	URI (Universal Resource Identifier)
	- 인터넷상의 자원을 식별하기 위한 표기법 및 규약
	- URL + URN = URI
	- 인터넷 환경에서 URI는 대부분 URL을 의미, URN은 사용이 제한적
	
	URL (Uniform Resource Locator)
	- 물리적인 경로, 즉 자원의 위치 정보를 포함
	- 프로토콜, 도메인, 아이피, 포트 등
	- 컴퓨터로부터 접근 가능한 형태의 자원만 검색될 수 있어 제한적
	- 우리가 흔히 보는 'http://test.com/test.jpg' 형태
	
	URN (Uniform Resource Name)
	- 독립적인 이름을 제공하기 위해 존재
	- 자원에 대해 영속적이고 유일
	- 자원의 위치와는 무관
	- 예를들어 우리나라에서는 주민등록번호가 대표적
	
	 StringBuffer url = request.getRequestURL();    // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
	 String uri = request.getRequestURI();          // URI : 프로젝트 이하 경로 (CP + SP)
	 String cp = request.getContextPath();          // CP  : 프로젝트 명
	 String sp = request.getServletPath();          // SP  : 패키지 + 파일명
	 
	 System.out.println("URL : " + url);
	 System.out.println("URI  : " + uri);
	 System.out.println("CP   : " + cp);
	 System.out.println("SP   : " + sp);
	 
	-----------------------------------------------------------------
	 URL : http://localhost:8090/WebJSP/Ex11_WebApp_RealPath.jsp
	 URI : /WebJSP/Ex11_WebApp_RealPath.jsp
	 CP  : /WebJSP
	 SP  : /Ex11_WebApp_RealPath.jsp
	-----------------------------------------------------------------
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String resourcepath = "/download/note.txt";
	out.print(resourcepath + "<br>");
	
	// ContextPath(CP): /WebJSP: 웹에서 바라보는 경로(가상 경로)
	
	// 예상한 경로: C:\SmartWeb\WebJSP\JSPLab\WebJSP
	// 실제 경로: C:\SmartWeb\WebJSP\JSPLab\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\WebJSP
	
	// 예상과 실제 경로가 왜 다를까
	// tomcat을 이클립스에 내장하고 배포했을 때 그 경로가 위의 경로
	// getRealPath(실제 배포된 경로)
	
	// 게시판 만들기(파일 업로드)
	String realContextpath = application.getRealPath(request.getContextPath());
	out.print("ContextPath real path: " + realContextpath + "<br>");

	String realFilepath = application.getRealPath(resourcepath);
	out.print("realFilepath: " + realFilepath + "<br>");
	// 실제 경로: C:\SmartWeb\WebJSP\JSPLab\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download\note.txt
	
	out.print("request.getRequestURL(): " + request.getRequestURL() + "<br>");
	out.print("request.getRequestURI(): " + request.getRequestURI() + "<br>");
	out.print("request.getContextPath(): " + request.getContextPath() + "<br>");
	out.print("request.getServletPath(): " + request.getServletPath() + "<br>");
%>
</body>
</html>