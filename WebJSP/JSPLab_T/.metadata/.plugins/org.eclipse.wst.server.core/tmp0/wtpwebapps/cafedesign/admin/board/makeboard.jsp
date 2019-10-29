<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/admintop.jsp"%>

<!-- Center ======================================================================================= -->
        <div class="col-sm-12">
			<div class="page-header">
			    <h2 id="container">게시판생성 및 변경</h2>
			</div>
           	
           	<script type="text/javascript">
            $(document).ready(function() {
            	var selectcategory = '';
            	var selecttype = '';
            	$(document).on('change', '#ccode', function() {
            		selectcategory = $('#ccode option:selected').text();
            		$('#boardnames').text(selectcategory);
            		$('#mcategory').text(selectcategory);
            	});
            	
            	$(document).on('change', '#btype', function() {
            		selecttype = $('#btype option:selected').text();
            		$('#mtype').text(selecttype);
            	});
            	
            	$(document).on('click', '#bmodifyBtn', function() {
            		var bcode = $(this).parents('li').attr('data-bcode');
            		var oldname = $(this).parents('li').children('.bname').text();
            		$('#boardModifyModal').on('show.bs.modal', function(event) {
                		var modal = $(this);
                		modal.find('#oldbname').text(oldname);
                		modal.find('#newbname').val('');
                		modal.find('#bcode').val(bcode);
              		});          	
              		$('#boardModifyModal').modal();
            	});
            	
            	$(document).on('click', '#bdeleteBtn', function() {
            		alert($(this).parents('li').attr('data-bcode'));
            	});
            	
            	$(document).on('click', '#createBtn', function() {
            		if($('#ccode option:selected').length != 1) {
            			alert('한개의 카테고리를 선택하세요');
            			return;
            		} else if($('#btype option:selected').length != 1) {
            			alert('한개의 게시판형식을 선택하세요');
            			return;
            		} else if($.trim($('#bname').val()) == '') {
            			alert('게시판 이름 입력하세요');
            			return;
            		} else {
            			alert(selectcategory + '카테고리에 ' + selecttype + '형식의 ' + $('#bname').val() + '이름으로 게시판생성!!!');
            		}
            	});
            });
            </script>
            
			<div class="col-sm-12">
 				<form class="form-horizontal" action="#">
			    	<fieldset>
			    	<div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">카테고리 선택</label>
	
	                    <div class="col-sm-12">
	                        <select multiple class="form-control" id="ccode">
								<option value="1" data-bn="갤럭시S9">갤럭시S9</option>
								<option value="2" data-bn="갤럭시Note8">갤럭시Note8</option>
								<option value="3" data-bn="아이폰8SPlus">아이폰8SPlus</option>
								<option value="4" data-bn="G7">G7</option>
							</select>
	                    </div>
	                </div>
			    	<div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">게시판형식 선택</label>
	
	                    <div class="col-sm-12">
	                        <select multiple class="form-control" id="btype">
								<option value="1">공지사항</option>
								<option value="2">방명록</option>
								<option value="3">한줄메모</option>
								<option value="4">일반형게시판</option>
								<option value="5">답변형게시판</option>
								<option value="6">앨범형게시판</option>
								<option value="7">자료실</option>
							</select>
	                    </div>
	                </div>
			    	<div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">현재  <span id="boardnames"></span> 게시판</label>
	
	                    <div class="col-sm-12" style="margin-left: 15px; padding: 10px; border: 1px solid #bcbcbc; border-radius: 5px;">
	                        <ul class="nav nav-pills nav-stacked">
	                        	<li data-bcode="10">
	                        		<div class="bname col-sm-10">공지해요</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-bcode="9">
	                        		<div class="bname col-sm-10">출석체크해요</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-bcode="8">
	                        		<div class="bname col-sm-10">일상생활이야기</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-bcode="7">
	                        		<div class="bname col-sm-10">궁금해요</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-bcode="6">
	                        		<div class="bname col-sm-10">자랑할래요</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-bcode="5">
	                        		<div class="bname col-sm-10">공유해요</div>
	                        		<div class="col-sm-2">
	                        			<button type="button" id="bmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="bdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">생성할 게시판이름</label>
	
	                    <div class="col-sm-12" style="margin-left: 15px; padding: 10px; border: 1px solid #bcbcbc; border-radius: 5px;">
	                        <div class="col-sm-10">
	                        	<label class="col-sm-12"><span id="mcategory"></span> &gt;&gt; <span id="mtype"></span></label>
	                        </div>
	                        <div class="col-sm-10">
	                        	<input type="text" id="bname" class="form-control" placeholder="게시판이름">
	                        </div>
	                        <div class="col-sm-2">
	                        	<button type="button" id="createBtn" class="btn btn-info">게시판생성</button>
	                        </div>
	                    </div>
	                </div>
			        </fieldset>
			    </form>
 			</div>
       	</div>
<!-- 게시판이름변경 Modal -->
<%@ include file="/admin/board/boardmodify.jsp"%>