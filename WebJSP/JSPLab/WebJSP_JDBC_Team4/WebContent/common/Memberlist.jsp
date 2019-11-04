<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
	conn = Singleton_Helper.getConnection("oracle");
	String sql = "select id, pwd, name, age, gender, email from koreaMember";

	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

%>

<section id="id" class="about roomy-100">
    <div class="container">
        <div class="about_content">
            <div class="container-fluid">
                <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
                <jsp:include page="Topbar_Search.jsp"></jsp:include>
                <!-- DataTales Example -->
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <form action="Ex03_MemberEditok.jsp" method="post">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Password</th>
                                        <th>Name</th>
                                        <th>Age</th>
                                        <th>Gender</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <% while (rs.next()) {%>
                                <tr>
                                    <td><a
                                            href="MemberDetail.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id")%></a>
                                    </td>
                                    <td><%=rs.getString("pwd")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("age")%></td>
                                    <td><%=rs.getString("gender")%></td>
                                    <td><%=rs.getString("email")%></td>
                                </tr>
                                <%} %>

                            </table>
                        </form>

                    </div>
                    <a href="Member_modify.jsp?userId=<%=rs.getString("id")%>">수정</a>
                </div>
                <%
					}catch(Exception e){
						
					}finally{
							Singleton_Helper.close(rs);
							Singleton_Helper.close(pstmt);
					}
				%>
            </div>
        </div>
    </div>
    <!--End off container -->
</section>
<!-- scroll up-->
<jsp:include page="ScrollUp.jsp"></jsp:include>