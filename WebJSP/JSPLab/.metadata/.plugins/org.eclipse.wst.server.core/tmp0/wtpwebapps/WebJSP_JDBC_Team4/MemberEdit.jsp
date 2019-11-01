<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./common/AdminAuthority.jsp"></jsp:include>

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
		
		rs.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member Edit</title>
	
	<jsp:include page="./css/css.jsp"></jsp:include>
	
</head>
<body>
	 <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">관리자 페이지</h1>
          <p class="mb-4">DataTables
          	<a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Position</th>
                      <th>Office</th>
                      <th>Age</th>
                      <th>Start date</th>
                      <th>Salary</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td>Tiger Nixon</td>
                      <td>System Architect</td>
                      <td>Edinburgh</td>
                      <td>61</td>
                      <td>2011/04/25</td>
                      <td>$320,800</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

</body>
</html>
<%
	} catch(Exception e) {
		e.getStackTrace();
	} finally {
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}
%>