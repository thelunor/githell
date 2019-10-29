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
        		alert("새글쓰기");
        	});
        	
        	//글보기 페이지 이동
        	$('.article_list>tr').click(function() {
     			alert($(this).find('#article_seq').val());
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
        	<div>
                <h4 id="container">[인기앨범]</h4>
            </div>
        	<div class="row">
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/main_1.jpg" class="img-rounded" alt="Lights" style="width:100%">
						<div class="caption">
							<p>대구 커피튜드...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/main_2.jpg" class="img-rounded" alt="Nature" style="width:100%">
						<div class="caption">
							<p>위례 텐노트...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/main_3.jpg" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>광안리 앙드레...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/main_4.jpg" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>위례 텐노트...</p>
						</div>
					</div>
				</div>
			</div>
			
			<div>
                <h4 id="container">[최신앨범]</h4>
            </div>
        	<div class="row">
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/new_1.jpg" class="img-rounded" alt="Lights" style="width:100%">
						<div class="caption">
							<p>빵1...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/new_2.jpg" class="img-rounded" alt="Nature" style="width:100%">
						<div class="caption">
							<p>빵2...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/new_3.jpg" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>빵3...</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<img src="${root}/img/main/new_4.jpg" class="img-rounded" alt="Fjords" style="width:100%">
						<div class="caption">
							<p>커피...</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-12">			
				<div class="col-sm-6">
		        	<div>
		                <h4 id="container">[인기글]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover">
		                    <colgroup>
		                        <col width="*">
		                        <col width="60">
		                        <col width="60">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">제목</th>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center">조회수</th>
		                    </tr>
		                    </thead>
		                    <tbody class="article_list">
		                    <!-- 글목록 start -->
		                    <tr>
		                        <td class="text-left">200. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="200">
		                    </tr>
		                    <tr>
		                        <td class="text-left">199. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="199">
		                    </tr>
		                    <tr>
		                        <td class="text-left">198. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="198">
		                    </tr>
		                    <tr>
		                        <td class="text-left">197. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="197">
		                    </tr>
		                    <tr>
		                        <td class="text-left">196. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="196">
		                    </tr>
		                    <!-- 글목록 end -->
		                    </tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-6">
		        	<div>
		                <h4 id="container">[최신글]</h4>
		            </div>
		            <div class="table-responsive">
		                <!-- <table class="table table-bordered"> -->
		                <table class="table table-hover">
		                    <colgroup>
		                        <col width="*">
		                        <col width="60">
		                        <col width="60">
		                    </colgroup>
		                    <thead>
		                    <tr><th colspan="3"></th></tr>
		                    <tr>
		                        <th class="text-center">제목</th>
		                        <th class="text-center">작성자</th>
		                        <th class="text-center">조회수</th>
		                    </tr>
		                    </thead>
		                    <tbody class="article_list">
		                    <!-- 글목록 start -->
		                    <tr>
		                        <td class="text-left">100. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="100">
		                    </tr>
		                    <tr>
		                        <td class="text-left">99. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="99">
		                    </tr>
		                    <tr>
		                        <td class="text-left">98. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="98">
		                    </tr>
		                    <tr>
		                        <td class="text-left">97. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="97">
		                    </tr>
		                    <tr>
		                        <td class="text-left">96. 안녕하세요~~~~~</td>
		                        <td class="text-center">임경균</td>
		                        <td class="text-center">777</td>
		                        <input type="hidden" id="article_seq" value="96">
		                    </tr>
		                    <!-- 글목록 end -->
		                    </tbody>
						</table>
					</div>
				</div>
			</div>
        </div>

<%@ include file="/common/template/bottom.jsp"%>