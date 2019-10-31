<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/admintop.jsp"%>

<!-- Center ======================================================================================= -->
        <div class="col-sm-12">
			<div class="page-header">
			    <h2 id="container">카테고리생성 및 변경</h2>
			</div>
           	
           	<script type="text/javascript">
            $(document).ready(function() {
            	$(document).on('click', '#cmodifyBtn', function() {
            		var ccode = $(this).parents('li').attr('data-ccode');
            		var oldname = $(this).parents('li').children('.cname').text();
            		$('#categoryModifyModal').on('show.bs.modal', function(event) {
                		var modal = $(this);
                		modal.find('#oldcname').text(oldname);
                		modal.find('#newcname').val('');
                		modal.find('#ccode').val(ccode);
              		});          	
              		$('#categoryModifyModal').modal();
            	});
            	
            	$(document).on('click', '#cdeleteBtn', function() {
            		alert($(this).parents('li').attr('data-ccode'));
            	});
            	
            	$('#createBtn').click(function() {
            		var cname = $('#cname').val();
            		if($.trim(cname) == '') {
            			alert('카테고리 이름을 입력하세요');
            			return;
            		} else {
            			alert(cname + '으로 카테고리생성!!!');
            		}
            	});
            });
            </script>
            
			<div class="col-sm-12">
 				<form class="form-horizontal" action="#">
			    	<fieldset>
			    	<div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">현재  카테고리 목록</label>
	
	                    <div class="col-sm-12" style="margin-left: 15px; padding: 10px; border: 1px solid #bcbcbc; border-radius: 5px;">
	                        <ul class="nav nav-pills nav-stacked">
	                        	<li data-ccode="1">
		                        	<div class="cname col-sm-10">갤럭시S9</div>
		                        	<div class="col-sm-2">
	                        			<button type="button" id="cmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="cdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-ccode="2">
		                        	<div class="cname col-sm-10">갤럭시Note8</div>
		                        	<div class="col-sm-2">
	                        			<button type="button" id="cmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="cdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-ccode="3">
		                        	<div class="cname col-sm-10">아이폰8SPlus</div>
		                        	<div class="col-sm-2">
	                        			<button type="button" id="cmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="cdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        	<li data-ccode="4">
		                        	<div class="cname col-sm-10">G7</div>
		                        	<div class="col-sm-2">
	                        			<button type="button" id="cmodifyBtn" class="btn btn-xs btn-link" data-backdrop="static">이름변경</button>
				            			<button type="button" id="cdeleteBtn" class="btn btn-xs btn-link" data-backdrop="static">삭제</button>
	                        		</div>
	                        	</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="form-group col-sm-12">
				    	<label class="col-sm-12 control-label">생성할 카테고리이름</label>
	
	                    <div class="col-sm-12" style="margin-left: 15px; padding: 10px; border: 1px solid #bcbcbc; border-radius: 5px;">
	                        <div class="col-sm-10">
	                        	<input type="text" id="cname" class="form-control" placeholder="카테고리이름">
	                        </div>
	                        <div class="col-sm-2">
	                        	<button type="button" id="createBtn" class="btn btn-info">카테고리생성</button>
	                        </div>
	                    </div>
	                </div>
			        </fieldset>
			    </form>
 			</div>
       	</div>
<!-- 카테고리이름변경 Modal -->
<%@ include file="/admin/board/categorymodify.jsp"%>