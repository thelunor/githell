<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <script>
        $(document).ready(function() {
        	$('#newBtn').click(function() {
        		alert("새글쓰기로 이동");
        		$(location).attr('href', '${root}/board/write.jsp');
        	});
        	
        	$('#reBtn').click(function() {
        		alert("답글쓰기로 이동");
        		$(location).attr('href', '${root}/board/rewrite.jsp');
        	});
        	
        	$('#modiBtn').click(function() {
        		alert("글수정으로 이동");
        		$(location).attr('href', '${root}/board/modify.jsp');
        	});
        	
        	$('#delBtn').click(function() {
        		alert("글삭제");
        	});
        	
        	$('#firstBtn').click(function() {
        		alert("최신목록");
        	});
        	
        	$('#preBtn').click(function() {
        		alert("이전목록");
        	});
        	
        	//댓글 기능
        	$('#memoBtn').click(function() {
        		alert("글쓰자 : " + $('#mcontent').val());
        		$('#mcontent').val('');
        	});
        	
        	$('#bestBtn').click(function() {
        		alert("베스트글 정렬");
        	});
        	
        	$('#latestBtn').click(function() {
        		alert("최신글 정렬");
        	});
        	
        	$('#memolist>div #mmodiBtn').click(function() {
        		alert("수정 : " + $(this).parent().parent().attr('data-seq'));
        	});
        	
        	$('#memolist>div #mdelBtn').click(function() {
        		alert("삭제 : " + $(this).parent().parent().attr('data-seq'));
        	});
        	
        	$('#memolist>div #goodBtn').click(function() {
        		alert("좋아요 : " + $(this).parent().parent().attr('data-seq'));
        	});
        	
        	$('#memolist>div #hateBtn').click(function() {
        		alert("싫어요 : " + $(this).parent().parent().attr('data-seq'));
        	});
        });
        </script>
        <div class="col-sm-9">
        	<div class="page-header">
                <h4 id="container">[갤럭시S8] 궁금해요</h4>
            </div>
            <div class="pull-left">
	        	<button type="button" id="newBtn" class="btn btn-sm btn-default" data-backdrop="static">새글쓰기</button>
	            <button type="button" id="reBtn" class="btn btn-sm btn-default" data-backdrop="static">답글</button>
	            
	            <button type="button" id="modiBtn" class="btn btn-xs btn-default" data-backdrop="static">수정</button>
	            <button type="button" id="delBtn" class="btn btn-xs btn-default" data-backdrop="static">삭제</button>
            
        	</div>
        	<div class="pull-right">
	        	<button type="button" id="firstBtn" class="btn btn-xs btn-info" data-backdrop="static">최신목록</button>
	            <button type="button" id="preBtn" class="btn btn-xs btn-info" data-backdrop="static">이전목록</button>
        	</div>
			<div style="height: 40px;"></div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="100">
                        <col width="*">
                        <col width="100">
                        <col width="*">
                        <col width="100">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">제목</th>
                        <td class="text-left" colspan="5"><strong>10. 글제목이 와요!!!</strong></td>
                    </tr>
                    <tr>
                    	<th class="text-center">작성자</th>
                        <td class="text-center">안효인(java2)</td>
                        <th class="text-center">조회수</th>
                        <td class="text-center">20</td>
                        <th class="text-center">작성일</th>
                        <td class="text-center">2017.07.03</td>
                    </tr>
                    <tr>
                        <td class="text-left" colspan="6">안<br>녕<br>하<br>세<br>요<br>글내용입니다...</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="col-sm-12">
            	<div class="page-header">
	                <h5 id="container">댓글 77</h5>
	                <button type="button" id="bestBtn" class="btn btn-sm btn-link" data-backdrop="static">Best댓글</button>
		            <button type="button" id="latestBtn" class="btn btn-sm btn-link" data-backdrop="static">최신글</button>
	            </div>
		        	<form class="form-horizontal" action="#">
	                    <fieldset>
	                        <div class="form-group">
	                            <div class="col-sm-10">
	                                <textarea id="mcontent" class="form-control" rows="3" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea>
	                            </div>
	                            <div class="col-sm-2" style="text-align: left;">
	                            	<button type="button" id="memoBtn" class="btn btn-lg btn-info" style="height: 70px">작성</button>
	                            </div>
	                        </div>
	                    </fieldset>
	                </form>
	                <div class="col-sm-12" style="border-top: 2px solid #ecf0f1"></div>
	        	
	        	<!-- 댓글리스트 start -->
	        	<div id="memolist">
		        	<div class="col-sm-12" data-seq="10" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
			        	<div class="pull-right">
				        	<button type="button" id="mmodiBtn" class="btn btn-xs btn-link" data-backdrop="static">수정</button>
				            <button type="button" id="mdelBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
			        	</div>
			        	<label><b>아이디</b></label><br>
			        	글내용<br/>
			        	글내용<br/>
			        	글내용<br/>
			        	<label style="color: #a6a6a6;">3시간전</label>
			        	<div class="pull-right">
				        	<button type="button" id="goodBtn" class="btn btn-xs btn-danger" data-backdrop="static">좋아요(1000)</button>
				            <button type="button" id="hateBtn" class="btn btn-xs btn-primary" data-backdrop="static">싫어요(25)</button>
			        	</div>
		        	</div>
	        		
	        		<div class="col-sm-12" data-seq="9" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
			        	<div class="pull-right">
				        	<button type="button" id="mmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">수정</button>
				            <button type="button" id="mdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
			        	</div>
			        	<label><b>아이디</b></label><br>
			        	글내용<br/>
			        	글내용<br/>
			        	글내용<br/>
			        	<label style="color: #a6a6a6;">3시간전</label>
			        	<div class="pull-right">
				        	<button type="button" id="goodBtn" class="btn btn-xs btn-danger" data-backdrop="static">좋아요(1000)</button>
				            <button type="button" id="hateBtn" class="btn btn-xs btn-primary" data-backdrop="static">싫어요(25)</button>
			        	</div>
		        	</div>
		        	
		        	<div class="col-sm-12" data-seq="8" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
			        	<div class="pull-right">
				        	<button type="button" id="mmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">수정</button>
				            <button type="button" id="mdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
			        	</div>
			        	<label><b>아이디</b></label><br>
			        	글내용<br/>
			        	글내용<br/>
			        	글내용<br/>
			        	<label style="color: #a6a6a6;">3시간전</label>
			        	<div class="pull-right">
				        	<button type="button" id="goodBtn" class="btn btn-xs btn-danger" data-backdrop="static">좋아요(1000)</button>
				            <button type="button" id="hateBtn" class="btn btn-xs btn-primary" data-backdrop="static">싫어요(25)</button>
			        	</div>
		        	</div>
	        	
	        	</div>
	        	<!-- 댓글리스트 end -->
            </div>
        </div>

<%@ include file="/common/template/bottom.jsp"%>