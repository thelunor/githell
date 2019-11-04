<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String userId = request.getParameter("member_search");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	conn = Singleton_Helper.getConnection("oracle");
	String sql = "select count(*) from koreaMember where id like ?";
	String sql2 = "select id, pwd, name, age, gender, email from koreaMember where id like '%" + userId + "%'";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, '%' + userId + '%');
	rs = pstmt.executeQuery();
	int rowCount = 0;
	if (rs.next()) {
		rowCount = rs.getInt(1);
	}
%>
<section id="id" class="about roomy-100">
    <div class="container">
        <div class="about_content">
            <div class="container-fluid">
                <jsp:include page="Topbar_Search.jsp" />
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
                                <%
									if (rowCount > 0) {
										pstmt = conn.prepareStatement(sql2);
										rs = pstmt.executeQuery();
										while (rs.next()) {
											String id = rs.getString(1);
											String pwd = rs.getString(2);
											String mname = rs.getString(3);
											String age = rs.getString(4);
											String gender = rs.getString(5);
											String email = rs.getString(6);
								%>
                                <tr>
                                    <td><a href="MemberDetail.jsp?id=<%=rs.getString("id")%>"><%=id%></a></td>
                                    <td><%=pwd%></td>
                                    <td><%=mname%></td>
                                    <td><%=age%></td>
                                    <td><%=gender%></td>
                                    <td><%=email%></td>
                                </tr>
                                <%
									}
										out.print("<b>[" + userId + "] 조회결과: " + rowCount + "건 조회되었습니다.</b>");
									} else {
										out.print("<b>[" + userId + "] 조회결과가 없습니다.</b>");
									}
								%>
                            </table>
                        </form>
                        <%
							Singleton_Helper.close(rs);
							Singleton_Helper.close(pstmt);
						%>
                    </div>
                    <button class="btn btn-primary" onclick="location.href='Member_modify.jsp?userId=<%=userId%>' ">정보
                        수정</button>
                </div>
            </div>
        </div>
    </div>
    <!--End off container -->
</section>
<!-- scroll up-->
<jsp:include page="ScrollUp.jsp" />

