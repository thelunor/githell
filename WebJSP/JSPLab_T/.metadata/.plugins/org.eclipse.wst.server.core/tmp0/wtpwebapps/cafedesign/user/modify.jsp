<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$('#modifyBtn').click(function() {
				alert($('#modifyModal #eid').val());
			});
		});
        </script>
		<div id="modifyModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal">&times;</button>
			        	<h4 class="modal-title">회원 정보 수정</h4>
			      	</div>
			      	<div class="modal-body">
			        	<div class="table-responsive">
			        	<form class="form-horizontal" action="#">
			                <table class="table table-bordered">
			                    <colgroup>
			                        <col width="120">
			                        <col width="*">
			                        <col width="120">
			                        <col width="*">
			                    </colgroup>
			                    <tbody>
			                    <tr>
			                        <th class="text-center">ID</th>
			                        <td id="userid" class="text-left">java2</td>
			                        <th class="text-center">회원명</th>
			                        <td id="username" class="text-left">임경균</td>
			                    </tr>
			                    <tr>
			                    	<th class="text-center">비밀번호</th>
			                        <td class="text-left" colspan="3">
			                            <div class="col-lg-12">
			                                <input type="password" id="userpwd" class="form-control" placeholder="비밀번호">
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th class="text-center">이메일</th>
			                        <td class="text-left" colspan="3">
				                        <div class="col-lg-5">
											<input type="text" id="eid" class="form-control" placeholder="이메일">
			 							</div>
										<div class="col-lg-7">
			                                <select id="edomain" class="form-control">
			                                	<option value="naver.com">naver.com</option>
			                                	<option value="daum.net">daum.net</option>
			                                	<option value="nate.com">nate.com</option>
			                                </select>
										</div>
			                        </td>
			                    </tr>
			                    <tr>
			                    	<th class="text-center">전화번호</th>
			                        <td class="text-left" colspan="3">
			                        	<div class="col-lg-4">
			                                <select id="tel1" class="form-control">
			                                	<option value="010">010</option>
			                                	<option value="02">02</option>
			                                	<option value="031">031</option>
			                                </select>
										</div>
										<div class="col-lg-4">
			                                <input type="text" id="tel2" class="form-control" placeholder="1234">
			                            </div>
			                            <div class="col-lg-4">
			                                <input type="text" id="tel3" class="form-control" placeholder="5678">
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th class="text-center">주소</th>
			                        <td class="text-left" colspan="3">
			                        	<div class="col-lg-4">
			                                <input type="text" id="nzipcode" class="form-control" placeholder="우편번호">
			                            </div>
				                       	<div class="col-lg-12">
			                                <input type="text" id="naddress" class="form-control" placeholder="주소">
			                                <input type="text" id="naddress_detail" class="form-control" placeholder="상세주소">
			                            </div>
			                        </td>
			                    </tr>
			                    </tbody>
			                </table>
			            </form>
			            </div>
			      	</div>
			      	<div class="modal-footer">
			      		<button type="button" id="modifyBtn" class="btn btn-info">수정</button>
			        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      	</div>
			    </div>
			</div>
		</div>