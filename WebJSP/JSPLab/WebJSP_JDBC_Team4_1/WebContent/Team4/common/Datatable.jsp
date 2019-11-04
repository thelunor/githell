<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="AdminAuthority.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
<div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               <%
                    Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, pwd, name, age, gender, email from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
               %>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Password</th>
                      <th>Name</th>
                      <th>Age</th>
                      <th>Gender</th>
                      <th>Email</th>
                      <th>정보수정</th>
                      <th>회원삭제</th>
                    </tr>
                  </thead>
                  	<% while (rs.next()) { %>
                    <tr>
                      <td><%= rs.getString("id") %></td>
                      <td><%= rs.getString("pwd") %></td>
                      <td><%= rs.getString("name") %></td>
                      <td><%= rs.getString("age") %></td>
                      <td><%= rs.getString("gender") %></td>
                      <td><%= rs.getString("email") %></td>
                      <td><a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">
                      		정보수정</a>
                      </td><td><a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">
                      		회원삭제</a>
                      </td>
                    </tr>
                  </tbody>
                 	  <% } %>
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
            </div>
</body>
</html>