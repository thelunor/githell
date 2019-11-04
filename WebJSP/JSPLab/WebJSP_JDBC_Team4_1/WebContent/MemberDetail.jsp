<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./common/AdminAuthority.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member Detail</title>
</head>
<body>
	<div class="panel-heading">
		<h3 class="panel-title">Table Inside No Padding</h3>
	</div>
	<div class="panel-body no-padding">
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("id");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = Singleton_Helper.getConnection("oracle");
				String sql = "select id, name, age, email from koreamember where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
		%>
				<table>
					<thead>
						<tr>
							<th>회원정보</th>
						</tr>
					</thead>
					<tbody>
						<% while(rs.next()) { %>
							<tr>
								<td>ID</td>
								<td><%= rs.getString("id") %></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><%= rs.getString("name") %></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><%= rs.getString("age") %></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><%= rs.getString("email") %></td>
							</tr>
							<tr>
								<td colspan="1">
									<a href="MemberList.jsp">목록으로 돌아가기</a>
								</td>
							</tr>
						<% } %>
					</tbody>
				</table>
		<%		
			} catch(Exception e) {
				e.getStackTrace();
			} finally {
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
			}
		%>

	</div>
</body>
</html>