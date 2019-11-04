<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
</div>
<div class="card-body">
    <div class="table-responsive">

        <%
			String userId = request.getParameter("userId");
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
        <form action="Member_modifyok.jsp" method="post">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>회원삭제</th>
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
                    <td><input type="text" id="idText" name="idText" value="<%=id%>" readonly="readonly"
                            style="font-size: 15px;"></td>
                    <td><input type="text" id="pwdText" name="pwdText" value="<%=pwd%>" style="font-size: 15px;"></td>
                    <td><input type="text" id="mnameText" name="mnameText" value="<%=mname%>" style="font-size: 15px;">
                    </td>
                    <td><input type="text" id="ageText" name="ageText" value="<%=age%>" style="font-size: 15px;"></td>
                    <td><input type="text" id="genderText" name="genderText" value="<%=gender%>"
                            style="font-size: 15px;"></td>
                    <td><input type="text" id="emailText" name="emailText" value="<%=email%>" style="font-size: 15px;">
                    </td>
                    <td><a href="Member_delete.jsp?id=<%=id%>&userId=<%=userId%>" style="font-size: 15px;">삭제</a></td>
                    <input type="hidden" name="userId" value="<%=userId%>">
                </tr>

                <%
					}
					}
				%>
            </table>
            <button type="submit" class="btn btn-primary">저장</button>
            <button id="button" class="btn btn-primary" onclick="link(); return false;">돌아가기</button>
        </form>
        <%
			Singleton_Helper.close(rs);
			Singleton_Helper.close(pstmt);
		%>
    </div>
</div>

<!-- scroll up-->
<jsp:include page="ScrollUp.jsp"></jsp:include>
<script>
    function link() {
        location.href = "AdminMain.jsp";
    }
</script>