<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <div class="col-sm-9">
			<div class="page-header">
			    <h2 id="container">공지사항</h2>
			</div>
           	
           	<script type="text/javascript">
            $(document).ready(function() {
            	//글보기 페이지 이동
            	$(".notice_list>tr").on('click', 'td[class!="etc text-center"]', function(event) {
           			var tr = $(this).parent();
         			var seq = tr.attr('data-seq');
         			var subject = tr.children('.subject').text();
            		var content = tr.children('.content').html();
         			$('#noticeViewModal').on('show.bs.modal', function(event) {
                		var modal = $(this)
              		  	modal.find('#subject').text(seq + ". " + subject);
                		modal.find('#content').html(content);
              		});          	
              		$('#noticeViewModal').modal();
         		});
            	
            });
            </script>
            
			<div class="col-sm-12">
 				<div class="table-responsive">
            		<table class="table table-hover">
                    <colgroup>
                        <col width="80">
                        <col width="*">
                        <col width="80">
                        <col width="120">
                    </colgroup>
                    <thead>
                    <tr><th colspan="5"></th></tr>
                    <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">제목</th>
                        <th class="text-center">조회수</th>
                        <th class="text-center">작성일</th>
                        <th class="text-center">비고</th>
                    </tr>
                    </thead>
                    <tbody class="notice_list">
                        <!--<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>-->
                        <tr data-seq="2">
                            <td class="text-center">2</td>
                            <td class="subject">공지사항입니다22222 제목입니다.. 필독하세요</td>
                            <td class="content" style="display: none;">공지사항내용입니다222222.. <br>필독하세요<br>공지사항내용입니다2222222.. <br>필독하세요<br>공지사항내용입니다22222222.. <br>필독하세요</td>
                            <td class="text-center">247</td>
                            <td class="text-center">17.07.07</td>
                        </tr>
                        <tr data-seq="1">
                            <td class="text-center">1</td>
                            <td class="subject">공지사항입니다11111 제목입니다.. 필독하세요</td>
                            <td class="content" style="display: none;">공지사항내용입니다111111.. <br>필독하세요<br>공지사항내용입니다111111.. <br>필독하세요<br>공지사항내용입니다111111.. <br>필독하세요</td>
                            <td class="text-center">324</td>
                            <td class="text-center">17.06.07</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
			</div>
        </div>
        
        <div class="col-sm-9" style="height: 5px;"></div>
		
        <div class="col-sm-9" style="text-align: center;">
          	<ul class="pagination">
          		<li class="firstpage">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">최신</span>
          			</a>
		    	</li>
          		<li class="page" data-page="0">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">이전</span>
          			</a>
			    </li>
				<li class="page" data-page="1"><a href="#">1</a></li>
				<li class="page active" data-page="2"><a href="#">2</a></li>
				<li class="page" data-page="3"><a href="#">3</a></li>
				<li class="page" data-page="4"><a href="#">4</a></li>
				<li class="page" data-page="5"><a href="#">5</a></li>
				<li class="page" data-page="6"><a href="#">6</a></li>
				<li class="page" data-page="7"><a href="#">7</a></li>
				<li class="page" data-page="8"><a href="#">8</a></li>
				<li class="page" data-page="9"><a href="#">9</a></li>
				<li class="page" data-page="10"><a href="#">10</a></li>
				<li class="page" data-page="11">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">다음</span>
	          		</a>
			    </li>
			    <li class="page" data-page="100">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">마지막</span>
	          		</a>
			    </li>
			</ul>
       	</div>
<!-- 공지사항 보기 Modal -->
<%@ include file="/admin/notice/view.jsp"%>
