<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="Top.jsp"></jsp:include>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="personal.css">
<!-- 로그인 페이지 -->
<div class="jumbotron" id="Login">

   <form action="/action_page.php" method="post">
      <div class="imgcontainer">
         <img src="./images/travel.png" class="pic">
      </div>
      <div class="container">
         <input type="text" placeholder="ID" name="id" required> 
         <input type="password" placeholder="Password" name="psw" required>
         <button type="submit">로그인</button>
         <br>
         <button type="button" style="width: 25%; background-color: #e6ac00;">카카오 계정으로 로그인</button>
         <button type="button" style="width: 25%; background-color: #003366;">페이스북 계정으로 로그인</button>
         <br>
      </div>
      <br>

   </form>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
