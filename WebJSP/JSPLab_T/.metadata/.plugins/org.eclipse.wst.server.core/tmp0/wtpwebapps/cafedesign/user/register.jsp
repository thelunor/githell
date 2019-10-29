<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="registerModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 60%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">회원 정보 입력</h4>
	      	</div>
	      	<div class="modal-body">
                <form class="form-horizontal" action="#">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">아이디</label>

                            <div class="col-lg-6">
                                <input type="text" id="userid" class="form-control" placeholder="아이디">
                            	<label>사용할 수 있습니다.</label>
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">이름</label>

                            <div class="col-lg-6">
                                <input type="text" id="username" class="form-control" placeholder="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호</label>

                            <div class="col-lg-6">
                                <input type="password" id="userpwd" class="form-control" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호확인</label>

                            <div class="col-lg-6">
                                <input type="password" id="pwdcheck" class="form-control" placeholder="비밀번호 확인">
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            <label class="col-lg-2 control-label">생년월일</label>

                            <div class="col-lg-10">
                                <input type="text" class="form-control" placeholder="생년월일 (입력 예: 2000-12-01)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">성별</label>

                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                        남자
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        여자
                                    </label>
                                </div>
                            </div>
                        </div> -->
                        <div class="form-group">
                            <label class="col-lg-2 control-label">전화번호</label>

                            <div class="col-lg-3">
                                <select id="tel1" class="form-control">
                                	<option value="010">010</option>
                                	<option value="02">02</option>
                                	<option value="031">031</option>
                                </select>
							</div>
							<div class="col-lg-3">
                                <input type="text" id="tel2" class="form-control" placeholder="1234">
                            </div>
                            <div class="col-lg-3">
                                <input type="text" id="tel3" class="form-control" placeholder="5678">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">우편번호</label>
                            
                            <div class="col-lg-4">
                                <input type="text" id="nzipcode" class="form-control" placeholder="우편번호">
                            </div>
	                    </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">주소</label>
                            <div class="col-lg-9">
                                <input type="text" id="naddress" class="form-control" placeholder="주소">
                                <input type="text" id="naddress_detail" class="form-control" placeholder="상세주소">
                            </div>
                        </div>
                        <div class="form-group">
                        	<label class="col-lg-2 control-label">이메일</label>

                           	<div class="col-lg-4">
								<input type="text" id="eid" class="form-control" placeholder="이메일">
 							</div>
							<div class="col-lg-5">
                                <select id="edomain" class="form-control">
                                	<option value="naver.com">naver.com</option>
                                	<option value="daum.net">daum.net</option>
                                	<option value="nate.com">nate.com</option>
                                </select>
							</div>
                        </div>
                    </fieldset>
                </form>
	        </div>
	      	<div class="modal-footer">
	      		<button type="button" class="btn btn-info">가입</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>
