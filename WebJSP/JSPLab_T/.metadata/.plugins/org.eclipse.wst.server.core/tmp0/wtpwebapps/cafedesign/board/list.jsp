<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <script>
        $(document).ready(function() {
        	//새글, 전체글, 현재, 전체페이지 팦업
        	$('[data-toggle="popover"]').popover();
        	
        	//글쓰기 페이지 이동
        	$('#newBtn').click(function() {
        		alert("새글쓰기로 이동");
        		$(location).attr('href', '${root}/board/write.jsp');
        	});
        	
        	//글보기 페이지 이동
        	$('.article_list>tr').click(function() {
     			alert($(this).find('#article_seq').val() + "번 글보기!!!!");
     			$(location).attr('href', '${root}/board/view.jsp');
     		});
     		
        	//pagenavigation 페이지 이동
        	$('.firstpage').click(function() {
        		alert("최신목록");
        	});
        	
        	$('.page').click(function() {
        		alert($(this).attr('data-page') + '로 이동');
        	});
        	
        });
        </script>
        <div class="col-sm-9">
        	<div class="page-header">
                <h4 id="container">[갤럭시S8] 궁금해요</h4>
            </div>
            <div class="pull-left">
           		<button type="button" id="newBtn" class="btn btn-sm btn-default" data-backdrop="static">새글쓰기</button>
           	</div>
           	<div class="pull-right">
           		<label>
	           		<a href="#" data-toggle="popover" data-trigger="focus" data-placement="top" title="오늘쓴글수" data-content="2개">2</a> 
	           		/ <a href="#" data-toggle="popover" data-trigger="focus" data-placement="left" title="전체글수" data-content="1700개">1700</a>
           		</label>
           	</div>
			<div style="height: 30px;"></div>
            <div class="table-responsive">
                <!-- <table class="table table-bordered"> -->
                <table class="table table-hover">
                    <colgroup>
                        <col width="80">
                        <col width="*">
                        <col width="120">
                        <col width="80">
                        <col width="120">
                    </colgroup>
                    <thead>
                    <tr><th colspan="5"></th></tr>
                    <tr>
                        <th class="text-center">글번호</th>
                        <th class="text-center">제목</th>
                        <th class="text-center">작성자</th>
                        <th class="text-center">조회수</th>
                        <th class="text-center">작성일</th>
                    </tr>
                    </thead>
                    <tbody class="article_list">
                    <!-- 글목록 start -->
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">17</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="10">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">177</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="9">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">12</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="8">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">17</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="7">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">37</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="6">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;</td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="5">
                    </tr>
                    <tr>
                        <td class="text-center">10000</td>
                        <td class="text-left">안녕하세요~~~~~&nbsp;&nbsp;<span class="badge" style="background: orange;">27</span></td>
                        <td class="text-center">안효인</td>
                        <td class="text-center">777</td>
                        <td class="text-center">17.07.07</td>
                        <input type="hidden" id="article_seq" value="4">
                    </tr>
                    <!-- 글목록 end -->
                    </tbody>
				</table>
				<table class="table">
                    <tr>
                    	<td>
                    	<div class="pull-right">
			           		<label>
			           		<a href="#" data-toggle="popover" data-trigger="focus" data-placement="bottom" title="현재페이지" data-content="2 page">2</a> 
			           		/ <a href="#" data-toggle="popover" data-trigger="focus" data-placement="left" title="전체페이지" data-content="10 pages">10</a>
			           		</label>
			           	</div>
                    	<div class="col-sm-10" style="text-align: center;">
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
                    	</td>
                    </tr>
                </table>
            </div>
            <div class="col-sm-12 pull-right">
            <form class="navbar-form navbar-right">
			    <table>
			    <tr>
			    	<td>
					<div class="form-group">
						<select class="form-control" id="item">
					    	<option value="">제목 + 내용</option>
					    	<option value="">제목만</option>
					    	<option value="">글작성자</option>
					    	<option value="">댓글내용</option>
					  	</select>
						<input type="text" id="query" class="form-control" placeholder="검색어">
					</div>
					<button id="boardsearch" class="btn btn-default">
						<i class="glyphicon glyphicon-search"></i>
					</button>
					</td>
				</tr>
				</table>
			</form>
            </div>
        </div>

<%@ include file="/common/template/bottom.jsp"%>