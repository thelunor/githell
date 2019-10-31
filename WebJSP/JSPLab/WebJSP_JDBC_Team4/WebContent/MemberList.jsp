<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="./common/AdminAuthority.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member List</title>
</head>
<body>
	<!-- MemberList -->
	<div id="memberdiv">
		<table>
			<tr>
				<td>
					<%
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						try {
							conn = Singleton_Helper.getConnection("oracle");
							String sql="select id, name, age, email from koreamember";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
					%>
							<table>
							<% while(rs.next()) { %>
								<tr>
									<th colspan="4">회원목록</th>
								</tr>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>나이</th>
									<th>이메일</th>
								</tr>
								<tr>
									<td>
										<a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">
											<%= rs.getString("id") %>
										</a>
									</td>
									<td>
										<%= rs.getString("name") %>
									</td>
									<td>
										<%= rs.getString("age") %>
									</td>
									<td>
										<%= rs.getString("email") %>
									</td>
									<td>
										<a href="MemberEdit.jsp?id=<%= rs.getString("id") %>">[수정]</a>
									</td>
									<td>
										<a href="MemberDelete.jsp?id=<%= rs.getString("id") %>">[삭제]</a>
									</td>
								</tr>
							<% } %>
							</table>
							<hr>
							<div style="text-align: center;">
								<form action="MemberSearch.jsp" method="post">
									회원명: <input type="text" name="search" placeholder="회원명으로 검색">
										<input type="submit" value="검색">
								</form>
							</div>
							<hr>
					<%	
							
						} catch(Exception e) {
							e.getStackTrace();
						} finally {
							Singleton_Helper.close(rs);
							Singleton_Helper.close(pstmt);
						}
					%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>