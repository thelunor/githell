<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="Top.jsp"></jsp:include>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="personal.css">

<!-- 회원가입 페이지 -->
<div class="jumbotron" id="Signup">
<div id="SignUp">
  <div class="container" style="text-align:center" title="회원가입">

      <div class="row">
      <div class="col-sm-6" style="width: 100%">
      <input type="text" placeholder="ID" name="id" required> 
      <br>
      <br>
      <input type="password" placeholder="Password" name="psw" required>
      <br>
      <br>
      <input type="password" placeholder="Password Check" name="psw" required>    
      <br>
      <br>
      <input type="text" placeholder="name" name="name" required>    
      <br>
      <br>
      <input type="text" placeholder="email" name="email" required>    
      <br>
      <br>
      <input type="text" placeholder="phone" name="phone" required>    
      <br>
      <br>
      <button type="button">회원가입</button>
      </div>    
      </div>
      </div>

           
    </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    