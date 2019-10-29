<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/public.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cafe</title>
    <link href="${root}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${root}/css/bootswatch.min.css" rel="stylesheet">
    <script src="${root}/js/jquery-2.1.0.js"></script>
    <script src="${root}/js/bootstrap.min.js"></script>
    <script src="${root}/js/bootswatch.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.${root}/js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!-- Main Navigation ========================================================================================== -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/index.jsp">My Cafe</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
                <li id="amember">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원</a>
                	<ul class="dropdown-menu">
                        <li><a href="${root}/admin/user/list.jsp">회원 리스트</a></li>
                    </ul>
                </li>
                <li id="anotice">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">공지사항</a>
                	<ul class="dropdown-menu">
                        <li><a href="${root}/admin/notice/list.jsp">공지사항 리스트</a></li>
                    </ul>
                </li>
                <li id="aboard">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판</a>
                	<ul class="dropdown-menu">
                        <li><a href="${root}/admin/board/makecategory.jsp">카테고리생성</a></li>
                        <li><a href="${root}/admin/board/makeboard.jsp">게시판생성</a></li>
                    </ul>
                </li>
                <li id="apoll">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">POLL</a>
                	<ul class="dropdown-menu">
                        <li><a href="${root}/admin/poll/list.jsp">이전 poll 리스트</a></li>
                    </ul>
                </li>
                <li id="astats">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">통계</a>
                	<ul class="dropdown-menu">
                        <li><a href="${root}/admin/stats/list.jsp">회원 거주지 분포</a></li>
                        <li><a href="${root}/admin/stats/list.jsp">게시판별 등록글</a></li>
                        <li><a href="${root}/admin/stats/list.jsp">등록글별 댓글</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${root}/">로그아웃 (userId)</a></li>
            </ul>
        </div>
    </div>
</div>


<!-- Container ======================================================================================= -->
<div class="container">
    <div class="row">