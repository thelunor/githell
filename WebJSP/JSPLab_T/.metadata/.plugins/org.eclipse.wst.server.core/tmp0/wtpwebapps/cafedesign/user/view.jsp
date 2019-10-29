<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/top.jsp"%>
<%@ include file="/common/template/left.jsp"%>

<!-- Center ======================================================================================= -->
        <div class="col-sm-9">
        	<div class="page-header">
                <h2 id="container">회원 정보</h2>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="text-center">ID(이메일)</th>
                        <td class="text-left">kglim(i7027@naver.com)</td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">임경균</td>
                    </tr>
                    <tr>
                    	<th class="text-center">전화번호</th>
                        <td class="text-left">010-0000-0000</td>
                        <th class="text-center">가입일</th>
                        <td class="text-left">2019.07.03 15:25:56</td>
                    </tr>
                    <tr>
                        <th class="text-center">주소</th>
                        <td class="text-left" colspan="3">서울시 강남구 역삼동</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <script type="text/javascript">
            $(document).ready(function() {
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
            });
            </script>
            <div class="pull-right">
            	<button type="button" id="modiBtn" class="btn btn-success" data-backdrop="static">수정</button>
            	<!-- button type="button" class="btn btn-success" data-toggle="modal" data-target="#modifyModal" data-backdrop="static">수정</button -->
                <!-- a href="./modify.html" class="btn btn-success btn-default">수정</a-->
                <a href="#" class="btn btn-large btn-default">탈퇴</a>
            </div>

        </div>
        <!-- 회원정보 수정 Modal -->
        <%@ include file="/user/modify.jsp"%>

<%@ include file="/common/template/bottom.jsp"%>