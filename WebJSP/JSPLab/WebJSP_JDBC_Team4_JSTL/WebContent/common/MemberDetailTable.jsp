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
	String userId = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	conn = Singleton_Helper.getConnection("oracle");
	String sql="select id, pwd, name, age, gender, email, ip from koreamember where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	rs = pstmt.executeQuery();
%>
<section id="join" class="about roomy-100">
    <form action="Member_modifyok.jsp" method="post" name="modifyOk">
        <div class="container">
            <div class="about_content">
                <%
					if (rs.next()) {
						String id = rs.getString(1);
						String pwd = rs.getString(2);
						String mname = rs.getString(3);
						String age = rs.getString(4);
						String gender = rs.getString(5);
						String email = rs.getString(6);
				%>
                <div class="row">
                    <div class="col-md-3"></div>

                    <div class="col-md-6">

                        <div class="signup-form">

                            <br> <br> <br>
                            <h2 style="text-align: center">회원수정</h2>
                            <br>
                            <hr>
                            <div class="form-group">
                                <input type="hidden" value="<%=id %>" name="userId">
                                <label>UserID &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
                                <input type="text" class="form-control" name="id" id="id" value="<%=id%>"
                                    required="required">
                            </div>
                            <div class="form-group">
                                <label>Email Address &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdEmail"></span></label>
                                <input type="email" class="form-control" name="email" id="email" value="<%=email%>"
                                    required="required">
                            </div>
                            <div class="form-group">
                                <label>Password &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdPw"></span></label>
                                <input type="password" class="form-control" name="pwd" id="pwd" required="required">
                            </div>
                            <div class="form-group">
                                <label>Confirm Password &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
                                <input type="password" class="form-control" name="userPassCheck" id="userPassCheck"
                                    required="required">
                            </div>

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="mname" id="mname" value="<%=mname%>"
                                    required="required">
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Age</label>
                                        <input type="text" class="form-control" name="age" id="age" value="<%=age%>"
                                            required="required">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Gender</label><br>
                                        <div class="genderbox">
                                            &nbsp;&nbsp;&nbsp; <input name="gender" value="남" type="radio" checked><span
                                                style=" position: relative; top: -15px;">&nbsp;남자</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input name="gender" value="여" type="radio"><span
                                                style=" position: relative; top: -15px;">&nbsp;여자</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
									}									
								%>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block btn-lg">수정완료</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="reset" class="btn btn-primary btn-block btn-lg">Cancel</button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <%
							Singleton_Helper.close(rs);
							Singleton_Helper.close(pstmt);
						%>
                        </div>
                    </div>
                </div>
            </div>
            <!--End off row-->
        </div>
        <!--End off container -->
    </form>

    <!-- scroll up-->
    <jsp:include page="ScrollUp.jsp"></jsp:include>
</section>