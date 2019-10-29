<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<script type="text/javascript">
            $(document).ready(function() {
            	//게시판 펼치기
            	$('#categoryOpen').click(function() {
            		$(this).parent().siblings('li').children('div.tab-content').slideDown(100);
            		$(this).css('display', 'none');
            		$('#categoryClose').css('display', '');
            	});
            	//게시판 접기
            	$('#categoryClose').click(function() {
            		$(this).parent().siblings('li').children('div.tab-content').slideUp(100);
            		$(this).css('display', 'none');
            		$('#categoryOpen').css('display', '');
            	});
            	
            	$('#board_menu a.category_name').click(function() {
            		//$(this).siblings('div.tab-content').css({'color' : 'red', 'border' : '2px solid pink'}).parent().siblings('li').children('div.tab-content').css({'color' : 'red', 'border' : '2px solid blue'});
            		$(this).siblings('div.tab-content').slideDown(100).parent().siblings('li').children('div.tab-content').slideUp(100);
            	});
            	
            	$('.movelist').click(function() {
            		alert($(this).attr('data-bcode') + "번 게시판으로 이동!!!!");
            		$(location).attr('href', '${root}/board/list.jsp');
            	});
            });
            </script>
            <div>
            	<ul id="board_menu" class="nav nav-pills nav-stacked">
            		<li>
				    	<a id="categoryOpen" data-toggle="pill" style="background: #bdc1d5; display: none;">모든게시판펼치기</a>
				    	<a id="categoryClose" data-toggle="pill" style="background: #bdc1d5;">모든게시판접기</a>
				    </li>
				    <li>
				    	<a class="category_name" data-toggle="pill" href="#home" style="background: #bcbcbc;">갤럭시S8</a>
				    	<div class="tab-content">
				    		<div id="menu1">
				    			<ul class="nav nav-pills nav-stacked">
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="1">[갤럭시S8] 공지</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="2">[갤럭시S8] 궁금해요</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="3">[갤럭시S8] 공유해요</a></li>
				    			</ul>
						    </div>
						</div>
				    </li>
				    <li>
				    	<a class="category_name" data-toggle="pill" href="#menu1" style="background: #bcbcbc;">갤럭시노트8</a>
				    	<div class="tab-content">
				    		<div id="menu2">
				    			<ul class="nav nav-pills nav-stacked">
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="4">[갤럭시노트8] 사용법</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="5">[갤럭시노트8] Q&amp;A</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="6">[갤럭시노트8] 자랑하기</a></li>
				    			</ul>
						    </div>
						</div>
				    </li>
				    <li>
				    	<a class="category_name" data-toggle="pill" href="#menu2" style="background: #bcbcbc;">아이폰8Plus</a>
				    	<div class="tab-content">
				    		<div id="menu3">
				    			<ul class="nav nav-pills nav-stacked">
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="7">[아이폰8Plus] 숙지하세요</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="8">[아이폰8Plus] 묻고답하기</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="9">[아이폰8Plus] 스크린샷</a></li>
				    			</ul>
						    </div>
						</div>
				    </li>
				    <li>
				    	<a class="category_name" data-toggle="pill" href="#menu3" style="background: #bcbcbc;">G7</a>
				    	<div class="tab-content">
				    		<div class="tab-content">
				    		<div id="menu4">
				    			<ul class="nav nav-pills nav-stacked">
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="10">[G7] 공지사항</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="11">[G7] 사용설명</a></li>
				    				<li style="margin-left: 5%"><a class="movelist" data-toggle="collapse" data-bcode="12">[G7] 자료</a></li>
				    			</ul>
						    </div>
						</div>
						</div>
				    </li>
			  	</ul>
			</div>
