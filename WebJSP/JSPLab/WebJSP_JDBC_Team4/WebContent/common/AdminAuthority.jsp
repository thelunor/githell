<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		// 강제로 페이지 이동
		out.print("이동할페이지 주소");
	}
%>