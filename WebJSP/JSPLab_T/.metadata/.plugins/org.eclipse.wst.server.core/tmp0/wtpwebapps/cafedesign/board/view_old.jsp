<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <script>
        $(document).ready(function() {
        	$('#newBtn').click(function() {
        		alert("새글쓰기");
        	});
        	
        	$('#reBtn').click(function() {
        		alert("답글쓰기");
        	});
        	
        	$('#modiBtn').click(function() {
        		$('#modifyModal').on('show.bs.modal', function(event) {
            		var modal = $(this)
          		  	modal.find('#userpwd').val('1234');
            		modal.find('#eid').val('java2');
            		modal.find('#edomain').val('nate.com');
            		modal.find('#tel1').val('031');
            		modal.find('#tel2').val('1234');
          		  	modal.find('#tel3').val('5678');
          		 	modal.find('#nzipcode').val('58965');
          		  	modal.find('#naddress').val('경기도 성남시 중원구');
          		  	modal.find('#naddress_detail').val('469');
          		});          	
          		$('#modifyModal').modal();
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
        <div class="col-sm-9" style="background: cyan;">
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
			<div style="height: 50px;"></div>
            <div class="table-responsive" style="background: pink;">
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
        
	        <div class="col-sm-9 pull-right" style="background: orange;">
	        	<div class="page-header">
	                <h5 id="container">댓글 77</h5>
	                <button type="button" id="bestBtn" class="btn btn-sm btn-link" data-backdrop="static">Best댓글</button>
		            <button type="button" id="latestBtn" class="btn btn-sm btn-link" data-backdrop="static">최신글</button>
	            </div>
	            <div class="form-group">
		        	<form class="form-horizontal" action="#">
	                    <fieldset>
	                        <div class="form-group">
	                            <div class="col-sm-8">
	                                <textarea id="mcontent" class="form-control" rows="3" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea>
	                            </div>
	                            <div class="col-sm-1" style="text-align: left;">
	                            	<button type="button" id="memoBtn" class="btn btn-lg btn-info" style="height: 70px">작성</button>
	                            </div>
	                        </div>
	                    </fieldset>
	                </form>
	        	</div>
	        	
	        	<div class="col-sm-9" style="border-top: 2px solid #ecf0f1"></div>
	        	
	        	<!-- 댓글리스트 start -->
	        	<div id="memolist">
		        	<div class="col-sm-9" data-seq="10" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
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
	        		
	        		<div class="col-sm-9" data-seq="9" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
			        	<div class="pull-right">
				        	<button type="button" id="goodBtn" class="btn btn-xs btn-link" data-backdrop="static">수정</button>
				            <button type="button" id="hateBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
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
		        	
		        	<div class="col-sm-9" data-seq="8" style="border-bottom: 2px solid #ecf0f1; margin-top: 15px; margin-bottom: 15px;">
			        	<div class="pull-right">
				        	<button type="button" id="goodBtn" class="btn btn-xs btn-link" data-backdrop="static">수정</button>
				            <button type="button" id="hateBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
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
        <!-- 회원정보 수정 Modal -->
        <%@ include file="/user/modify.jsp"%>

<%@ include file="/common/template/bottom.jsp"%>