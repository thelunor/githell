<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
         
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 middle"
                        style="position: relative; top: -8px;">관리자</span>
                    <img class="img-profile rounded-circle" src="images/admin.jpg"
                        style="height: 40px; position: relative; top: -10px;">
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#"> <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                </div>
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