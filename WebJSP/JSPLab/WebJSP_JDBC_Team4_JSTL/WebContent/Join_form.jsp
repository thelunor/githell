<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<head>
    <meta charset="utf-8">
    <title>Drop 4our bit</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <jsp:include page="./css/css.jsp"></jsp:include>
    <jsp:include page="ValidationCheck.jsp"></jsp:include>

    <style type="text/css">
        h2 {
            font-family: 'Jua', sans-serif;

        }

        input {
            height: 40px;
        }

        form-control {
            height: 40px;
        }

        .genderbox {
            padding: 1px;
            border: 1px solid #cccccc;
            height: 40px;
        }

        #tdId,
        #tdEmail,
        #tdPw,
        #tdCh {
            font-size: 13px;
            font-family: 'Jua', sans-serif;
            color: #ff6600;
        }

        .form-group input[type="text"],
        input[type="email"],
        input[type="password"] {
            border: 1px solid #e5e5e5;
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
        <section id="join" class="about roomy-100">
            <form action="Join_ok.jsp" method="post" name="loginForm">
                <div class="container">
                    <div class="about_content">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div class="signup-form">

                                    <br> <br> <br>
                                    <h2 style="text-align: center">회원가입</h2>
                                    <br>
                                    <hr>
                                    <div class="form-group">
                                        <label>UserID &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
                                        <input type="text" class="form-control" name="id" id="id" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdEmail"></span></label>
                                        <input type="email" class="form-control" name="email" id="email"
                                            required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Password &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdPw"></span></label>
                                        <input type="password" class="form-control" name="pwd" id="pwd"
                                            required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
                                        <input type="password" class="form-control" name="userPassCheck"
                                            id="userPassCheck" required="required">
                                    </div>

                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control" name="mname" id="mname"
                                            required="required">
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Age</label>
                                                <input type="text" class="form-control" name="age" id="age"
                                                    required="required">
                                            </div>
                                            <div class="col-sm-6">
                                                <label>Gender</label><br>
                                                <div class="genderbox">
                                                    &nbsp;&nbsp;&nbsp; <input name="gender" value="남" type="radio"
                                                        checked><span
                                                        style=" position: relative; top: -15px;">&nbsp;남자</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input name="gender" value="여" type="radio"><span
                                                        style=" position: relative; top: -15px;">&nbsp;여자</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>가입 경로 (선택 항목)</label>
                                        <select class="form-control">
                                            <option value="blank">-</option>
                                            <option value="people">지인 추천</option>
                                            <option value="blog">블로그 또는 카페</option>
                                            <option value="site">포털 사이트 광고</option>
                                            <option value="etc">기타</option>
                                        </select>
                                    </div>


                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <button type="submit" class="btn btn-primary btn-block btn-lg">Sign
                                                    Up</button>
                                            </div>
                                            <div class="col-sm-6">
                                                <button type="reset"
                                                    class="btn btn-primary btn-block btn-lg">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <br>
                                    <div class="text-center">이미 회원이신가요? <a href="Login_form.jsp">Click here</a></div>

                                    <br> <br> <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>
        <jsp:include page="./common/Bottom.jsp"></jsp:include>
    </div>

    <jsp:include page="./js/js.jsp"></jsp:include>


</body>

</html>