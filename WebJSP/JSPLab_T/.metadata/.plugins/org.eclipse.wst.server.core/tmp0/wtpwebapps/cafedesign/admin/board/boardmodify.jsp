<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="boardModifyModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 50%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">게시판이름변경</h4>
	      	</div>
	      	<div class="modal-body">
			    <form class="form-horizontal" action="#">
			    	<input type="hidden" name="bcode" id="bcode">
			    	<fieldset>
			    	<div class="form-group">
				    	<label class="col-lg-3 control-label">기존게시판이름</label>
	
	                    <label id="oldbname" class="col-lg-8 control-label"></label>
	                </div>
			        <div class="form-group">
				    	<label class="col-lg-3 control-label">변경할게시판이름</label>
	
	                    <div class="col-lg-8">
	                        <input type="text" id="newbname" class="form-control" placeholder="게시판새이름">
	                    </div>
	                </div>
			        </fieldset>
			    </form>
			</div>
			<script type="text/javascript">
            $(document).ready(function() {
            	$('#bnameModifyBtn').click(function() {
            		alert($('#bcode').val() + '번 게시판이름을 ' + $('#newbname').val() + '로 변경합니다.');
            	});
            });
            </script>
	      	<div class="modal-footer">
	      		<button type="button" id="bnameModifyBtn" class="btn btn-info">게시판이름변경</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>