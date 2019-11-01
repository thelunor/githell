<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="./css/css.jsp"></jsp:include>
<style type="text/css">
.input-group {
	height: 50px;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="./common/Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="./common/Side.jsp"></jsp:include>
		</nav>
		<!--Login Sections-->
		<section id="id" class="about roomy-100">
		<form action="Login_ok.jsp" method="post" name="loginForm">
			<div class="container">
				<div class="about_content">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="signup-form">

									<br> <br> <br> <br>
									<h2 style="text-align: center">로그인</h2>
									<br>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input class="form-control" type="text" name="id" id="id"
												placeholder="아이디" required="required">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"></i></span>
											<input class="form-control" type="password" name="pwd" id="pwd"
												placeholder="비밀번호" required="required">
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block btn-lg">Log in</button>
									</div>

								
								<div class="text-center">
									회원이 아니신가요? <a href="Join_form.jsp">Click me</a>.
								</div>
								<br> <br> <br> <br>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			</form>
		</section>


		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="./common/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="./js/js.jsp"></jsp:include>


</body>

</html>