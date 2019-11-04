<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<div class="container">
    <div class="attr-nav">
        <ul>
            <li class="login">
            <c:choose>
         <c:when test="${sessionScope.userid != null}">
            <a href ='Logout.jsp'>로그아웃</a>
         </c:when>
         <c:otherwise>
            <a href ='Login_form.jsp'>로그인</a>
         </c:otherwise>
         </c:choose>
            </li>
            
            <li class="join">
            <c:set var="id" value="${sessionScope.userid}"/>  
            <c:if test="${id == null}">
               <a href='Join_form.jsp'>회원가입</a>
            </c:if>
            </li>


            <li class="mypage">
            <c:set var="id" value=" ${sessionScope.userid}"/>  
            <c:if test="${id != null}">
               <a href='#'>마이페이지</a>
            </c:if>
            </li>
            
            <li class="side-menu">
            <c:set var="id2" value="${sessionScope.userid}"/>
              <c:if test="${id2 != null}">
                 <c:if test="${id2 == 'admin'}">
                    <a href='#'><i class='fa fa-bars'></i></a>
                 </c:if>              
            </c:if>
            </li>
        </ul>
    </div>
    <div class="navbar-header">
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu"></button>

        <a class="navbar-brand" href="./Main.jsp"> <img src="./images/logo1.png" class="logo logo-display m-top-10"
                alt="">
            <img src="./images/logo.jpg" class="logo logo-scrolled" alt="">
        </a>
    </div>
</div>