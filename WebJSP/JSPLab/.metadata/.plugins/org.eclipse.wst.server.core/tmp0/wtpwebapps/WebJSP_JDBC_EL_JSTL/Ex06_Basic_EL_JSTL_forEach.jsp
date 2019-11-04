<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<h3>JSTL for문</h3>
	<!--  
		Java
		int sum = 0;
		for(int i = 0; i < 10; i++) {sum += i;}
		for(String s : list) {}
	-->
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum + i}" />
		<!-- 여기서 만든 변수는 scope을 갖지 않는다 -->
	</c:forEach>
	sum 누적값: ${sum}<br>
	<ul>
	<h3>구구단 5단 출력하기</h3>
	<c:forEach var="i" begin="1" end="9">
		<li>5 * ${i} = ${5 * i}</li>
	</c:forEach>
	</ul>
	
	<h3>EL & JSTL 사용하여 2~9단 출력하세요 > forEach 중첩</h3>
	<table border="1">	
		<c:forEach var="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j == 0}">
						<!-- test: Java switch case -->
						<tr bgcolor="yellow"><th>${i}단</th></tr>				
					</c:when>
					<c:otherwise>
						<!-- otherwise: Java switch default -->
						<tr><td>${i} * ${j} = ${i * j}</td></tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>
	
	<h3>JSTL forEach 객체 출력하기</h3>
	<%
		int[] arr = new int[]{10, 20, 30, 40};
		// int[] arr = {10, 20, 30, 40};
		for (int i : arr) {
			out.print("출력값: " + i + "<br>");
		}
	%>
	<h3>***** EL Java 객체에 직접적인 접근 불가, JSTL 변수를 사용하여 데이터를 담은 후 EL 사용 *****</h3>
	arr 배열[객체] 접근 불가: ${arr}<br>
	<c:set var="intarr" value="<%= arr %>"/>
	c:set 변수에 접근: ${intarr}<br>
	<hr>
	<h3>Java 개선된 for문과 동일한 (items 제공)</h3>
	<!-- for (String s : list) {} -->
	<c:forEach var="i" items="${intarr}">
		배열값: ${i}<br>
	</c:forEach>
	
	<h3>단순하게... (편하게)</h3>
	<c:forEach var="i" items="<%= arr %>">
		배열값(단순하게): ${i}<br>
	</c:forEach>
	
	<h3>재미삼아... (자주 안 씀)</h3>
	<c:forEach var="i" items="<%= new int[]{1, 2, 3, 4, 5} %>">
		배열값(재미삼아): ${i}<br>
	</c:forEach>
	
	<h3>forEach 활용하기2</h3>
	<c:forEach var="i" items="${intarr}" varStatus="status">
		index: ${status.index}&nbsp;&nbsp;&nbsp;
		count: ${status.count}&nbsp;&nbsp;&nbsp;
		value: ${i}<br>
	</c:forEach>
	
	<h3>Today Point(JSTL forEach 활용)</h3>
	<%
		List<Emp> emplist = new ArrayList<>();
		// ArrayList<Emp> emplist = new ArrayList<>();
		emplist.add(new Emp(1000, "A"));
		emplist.add(new Emp(2000, "B"));
		emplist.add(new Emp(3000, "C"));

		// 출력은 아래가 아니라 EL & JSTL... > 화면 제어
		for (Emp e : emplist) {
			out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
		}
	%>
	<h3>JSTL 출력</h3>
	<c:set var="list" value="<%= emplist %>"/>
		<table border="1">
			<tr><td>사번</td><td>이름</td></tr>
			<c:forEach var="emp" items="${list}">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
			</c:forEach>
		</table>
		
	<h3>JSTL 출력</h3>
	<c:set var="list" value="<%= emplist %>"/>
		<table border="1">
			<tr><td>사번</td><td>이름</td></tr>
			<c:forEach var="emp" items="<%= emplist %>">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
			</c:forEach>
		</table>
		
	<h3>JSTL 사용하여 Map 다루기</h3>
	<%
		Map<String, Object> hm = new HashMap<>();
		hm.put("name", "hong");
		hm.put("pwd", "1004");
		hm.put("date", new Date());
	%>
	<h3>Java Map > EL & JSTL(key, value)</h3>
	<c:set var="hm" value="<%= hm %>"/>
	<c:forEach var="obj" items="${hm}">
		${obj.key} -> ${obj.value}<br>
		<!-- key, value 값이 제공, Map 순서 x -->
	</c:forEach>
	(key)name: ${hm.name}<br>
	
	<h3>JSLT 구분자 처리</h3>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
		${token}<br>
	</c:forTokens>
	
	<h3>JSLT 복합구분자 처리</h3>
	<c:forTokens var="token" items="A.B/C-D" delims="./-">
		${token}<br>
	</c:forTokens>
	
	<!-- 
		step 마이너스 값을 사요할 수 없습니다 
		step = -1 그래서 편법적으로 사용합니다
	-->
	<c:set var="nowNum" value="10"></c:set>
	<c:forEach var="i" begin="0" end="${nowNum}" step="1">
	   ${nowNum - i}
	</c:forEach>
		
	<c:forEach var="i" begin="0" end="${2016-1900}">
	    <c:set var="yearOption" value="${2016-i}" />
	    <option value="${yearOption}">${yearOption}</option>
	</c:forEach>
</body>
</html>