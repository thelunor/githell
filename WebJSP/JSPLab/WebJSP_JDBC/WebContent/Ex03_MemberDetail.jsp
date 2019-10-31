<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
		회원 상세 페이지 (id 컬럼 PK)
		1.권한 검사
		2.id 값 받기 (request.getparameter("id")) >> 한글처리
		3.select id,pwd,name,age,gender,email from koreamember where id=?
		4.id primary key (데이터 1건 보장)
		5.화면 출력 UI 구성
	*/
	/*
	1. 관리자만 접근 가능한 페이지
	2. 로그인한 일반회원이 주소값을 외워서 접근불가
	3. 그러면 회원에 관련된 모든 페이지 상단에는 아래의 코드를 걸어야 할까? >> include... >> sessionCheck.jsp
	*/
		if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
			// 강제로 페이지 이동
			out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<!--  
					회원리스트 출력(1건이라 Loop 불필요)
					<table style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
					</table>
				-->
				<%
					request.setCharacterEncoding("UTF-8");
					
					String id = request.getParameter("id");
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id,pwd,name,age,gender,email from koreamember where id=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
				%>
						<table style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
							<tr><th>회원정보</th></tr>
							<% while(rs.next()) { %>
								<tr>
									<td><%= rs.getString("id") %></td>
								</tr>
								<tr>
									<td><%= rs.getString("pwd") %></td>
								</tr>
								<tr>
									<td><%= rs.getString("name") %></td>
								</tr>
								<tr>
									<td><%= rs.getString("age") %></td>
								</tr>
								<tr>
									<td><%= rs.getString("gender") %></td>
								</tr>
								<tr>
									<td><%= rs.getString("email") %></td>
								</tr>
								<tr>
									<td>
										<a href="Ex03_Memberlist.jsp">목록으로 돌아가기</a>
									</td>
								</tr>
								<!--  
								<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto;">
				  			 	<tr>
				  			 		<td style="width:100px">아이디</td>
				  			 		<td style="width:100px"><5= rs.getString("id") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">비번</td>
				  			 		<td style="width:100px"><5= rs.getString("pwd") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">이름</td>
				  			 		<td style="width:100px"><5= rs.getString("name") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">나이</td>
				  			 		<td style="width:100px"><5= rs.getString("age") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">성별</td>
				  			 		<td style="width:100px"><5= rs.getString("gender") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td style="width:100px">이메일</td>
				  			 		<td style="width:100px"><5= rs.getString("email") 5></td>
				  			 	</tr>
				  			 	<tr>
				  			 		<td colspan="2">
				  			 			<a href="Ex03_Memberlist.jsp">목록가기</a>
				  			 		</td>
				  			 	</tr>
								-->
							<% } %>
						</table>
				<%
					} catch(Exception e) {
						
					} finally {
						Singleton_Helper.close(rs);	
						Singleton_Helper.close(pstmt);	
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>