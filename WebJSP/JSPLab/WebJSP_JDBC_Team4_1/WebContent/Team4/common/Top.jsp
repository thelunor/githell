<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<!-- Start Atribute Navigation -->
	<div class="container">
		<div class="attr-nav">
			<ul>
				<li class="login">
				<%
				if(session.getAttribute("userid") != null){
					out.print("<a href ='Logout.jsp'>로그아웃</a>");
				}else{
					out.print("<a href ='Login_form.jsp'>로그인</a>");
				}	
				%>
				</li>			
				<li class="join"><a href="#">회원가입</a></li>
				<li class="mypage"><a href="#">마이페이지</a></li>
				<li class="side-menu">
				<%
					String id = null;
					id = (String)session.getAttribute("userid");
					
					if(id != null){
						if(id.equals("admin")){
							out.print("<a href='#'><i class='fa fa-bars'></i></a>");
						}
					}
				%>
			</ul>
		</div>
		<!-- End Atribute Navigation -->

		<!-- Start Header Navigation -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbar-menu"></button>

			<a class="navbar-brand" href="#brand"> <img src="./images/logo1.png" class="logo logo-display m-top-10" alt="">
				<img src="./images/logo.jpg" class="logo logo-scrolled" alt="">
			</a>
		</div>
	</div>

	<!-- End Header Navigation -->
</body>
</html>