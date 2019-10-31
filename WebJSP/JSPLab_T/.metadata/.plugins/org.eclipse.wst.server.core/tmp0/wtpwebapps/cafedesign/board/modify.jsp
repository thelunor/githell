<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <div class="col-sm-9">
        	<div class="page-header">
                <h4 id="container">[갤럭시S8] 궁금해요</h4>
            </div>
            <div class="form-group">
	        	<form class="form-horizontal" action="#">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">제목</label>

                            <div class="col-sm-10">
                                <input type="text" id="subject" class="form-control" value="수정전 제목이 나올거에요">
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">내용</label>

                            <div class="col-sm-10">
                                <textarea id="content" class="form-control" rows="15" cols="150" placeholder="내용">수정전 내용이 나올거에요</textarea>
                            </div>
                        </div>
                    </fieldset>
                </form>
        	</div>
        	
            <script type="text/javascript">
            $(document).ready(function() {
				$('#writeBtn').click(function() {
            		
            	});
				
				$('#resetBtn').click(function() {
	
				});
            });
            </script>
            <div class="pull-right">
            	<button type="button" id="writeBtn" class="btn btn-sm btn-default" data-backdrop="static">글쓰기</button>
                <button type="button" id="resetBtn" class="btn btn-sm btn-default" data-backdrop="static">초기화</button>
            </div>

        </div>

<%@ include file="/common/template/bottom.jsp"%>