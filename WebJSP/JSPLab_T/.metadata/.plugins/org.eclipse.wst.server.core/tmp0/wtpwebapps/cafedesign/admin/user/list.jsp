<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/template/admintop.jsp"%>

<!-- Center ======================================================================================= -->
		<script type="text/javascript">
        $(document).ready(function() {
        	//네비바 체크
        	$('#amember').addClass('active');
        	
        	/*$('#modiBtn').click(function() {
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
        	});*/
        	
        	//회원정보수정
        	$('.btn.btn-xs.btn-primary').click(function() {
        		var row = $(this).parent('td').parent('tr');
        		//row.css('border', '2px solid lightblue');
        		var id = $(this).parents('td').siblings().eq(1).text();
        		alert(id + " 회원 수정 이동.");
        		$('#modifyModal').on('show.bs.modal', function(event) {
            		var modal = $(this)
            		modal.find('#userid').text(row.find('.userid').text());
            		modal.find('#username').text(row.find('.username').text());
            		modal.find('#eid').val(row.find('.email1').text());
            		modal.find('#edomain').val(row.find('.email2').text());
            		modal.find('#tel1').val(row.find('.tel1').text());
            		modal.find('#tel2').val(row.find('.tel2').text());
          		  	modal.find('#tel3').val(row.find('.tel3').text());
          		 	modal.find('#nzipcode').val(row.find('.zip').text());
          		  	modal.find('#naddress').val(row.find('.addr1').text());
          		  	modal.find('#naddress_detail').val(row.find('.addr2').text());
          		});   
        		$('#modifyModal').modal();
        	});
        	
        	//Blind
        	$('.btn.btn-xs.btn-danger').click(function() {
        		var id = $(this).parents('td').siblings().eq(1).text();
        		alert(id + " 회원 블라인드처리.");
        		$(this).siblings('.btn.btn-xs.btn-info').css('display', '');
        		$(this).css('display', 'none');
        	});
        	
        	//UnBlind
        	$('.btn.btn-xs.btn-info').click(function() {
        		var id = $(this).parents('td').siblings().eq(1).text();
        		alert(id + " 회원 블라인드 해제.");
        		$(this).siblings('.btn.btn-xs.btn-danger').css('display', '');
        		$(this).css('display', 'none');
        	});
        	
        	//정렬
        	$('.sort').click(function() {
        		$(this).addClass('active');
        		$(this).siblings().removeClass('active');
        		alert($(this).attr('data-sort') + '로 정렬하자!!!!');
        	});
        });
        </script>
        <div class="col-sm-12">
			<div class="page-header">
			    <h2 id="container">회원목록</h2>
			</div>
			
			<div class="col-sm-12">
				<ul class="nav nav-tabs">
					<li class="sort active" data-sort="new"><a href="#">최신가입</a></li>
					<li class="sort" data-sort="old"><a href="#">최장가입</a></li>
					<li class="sort" data-sort="name"><a href="#">이름</a></li>
					<li class="sort" data-sort="id"><a href="#">아이디</a></li>
					<li class="sort" data-sort="blind"><a href="#">블라인드회원</a></li>
				</ul>
			</div>
			
			<div class="col-sm-12" style="height: 15px;"></div>
			
			<div class="col-sm-12">
 				<div class="table-responsive">
            		<table class="table table-hover">
	            		<colgroup>
	                        <col width="40">
	                        <col width="80">
	                        <col width="80">
	                        <col width="80">
	                        <col width="*">
	                        <col width="80">
	                        <col width="80">
	                        <col width="120">
	                    </colgroup>
                    	<thead>
                        <tr>
	                        <th class="text-center">번호</th>
	                        <th class="text-center">ID</th>
	                        <th class="text-center">회원명</th>
	                        <th class="text-center">EMAIL</th>
	                        <th class="text-center">주소</th>
	                        <th class="text-center">전화번호</th>
	                        <th class="text-center">가입일</th>
	                        <th class="text-center">비고</th>
	                    </tr>
	                    </thead>
	                    <tbody>
                        <!--<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>-->
                        <tr>
                            <td class="text-center">1</td>
                            <td><span class="userid">java2</span></td>
                            <td><span class="username">임경균</span></td>
                            <td><span class="email1">java2</span>@<span class="email2">naver.com</span></td>
                            <td><span class="zip">125487</span> <span class="addr1">경기도 성남시 중원구 여수동</span> <span class="addr2">1234</span></td>
                            <td class="text-center"><span class="tel1">010</span>-<span class="tel2">0000</span>-<span class="tel3">0000</span></td>
                            <td class="text-center">2017/07/07</td>
                            <td class="text-center">
                            	<button type="button" id="modiBtn" class="btn btn-xs btn-primary" data-backdrop="static">수정</button>
            					<button type="button" id="blockBtn" class="btn btn-xs btn-danger" data-backdrop="static">Block</button>
            					<button type="button" id="blockBtn" class="btn btn-xs btn-info" data-backdrop="static" style="display: none;">UnBlock</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">2</td>
                            <td><span class="userid">spring</span></td>
                            <td><span class="username">스프링</span></td>
                            <td><span class="email1">spring</span>@<span class="email2">nate.com</span></td>
                            <td><span class="zip">98709</span> <span class="addr1">서울시 구로구 구로디지털로</span> <span class="addr2">코오롱싸이언스벨리</span></td>
                            <td class="text-center"><span class="tel1">010</span>-<span class="tel2">7777</span>-<span class="tel3">7777</span></td>
                            <td class="text-center">2017/07/17</td>
                            <td class="text-center">
                            	<button type="button" id="modiBtn" class="btn btn-xs btn-primary" data-backdrop="static">수정</button>
            					<button type="button" id="blockBtn" class="btn btn-xs btn-danger" data-backdrop="static">Block</button>
            					<button type="button" id="blockBtn" class="btn btn-xs btn-info" data-backdrop="static" style="display: none;">UnBlock</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
			</div>
        </div>
        
        <div class="col-sm-12" style="height: 5px;"></div>
        
        <div class="col-sm-12">
	        <form class="form-search">
	            <div class="input-group">
	                <input type="text" class="form-control" placeholder="회원명 또는 ID">
	                <span class="input-group-btn">
	                    <button type="submit" class="btn btn-primary">검색</button>
	                </span>
	            </div>
	        </form>
		</div>
		
        <div class="col-sm-12" style="text-align: center;">
          	<ul class="pagination">
          		<li class="firstpage">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">최신</span>
          			</a>
		    	</li>
          		<li class="page" data-page="0">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">이전</span>
          			</a>
			    </li>
				<li class="page" data-page="1"><a href="#">1</a></li>
				<li class="page active" data-page="2"><a href="#">2</a></li>
				<li class="page" data-page="3"><a href="#">3</a></li>
				<li class="page" data-page="4"><a href="#">4</a></li>
				<li class="page" data-page="5"><a href="#">5</a></li>
				<li class="page" data-page="6"><a href="#">6</a></li>
				<li class="page" data-page="7"><a href="#">7</a></li>
				<li class="page" data-page="8"><a href="#">8</a></li>
				<li class="page" data-page="9"><a href="#">9</a></li>
				<li class="page" data-page="10"><a href="#">10</a></li>
				<li class="page" data-page="11">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">다음</span>
	          		</a>
			    </li>
			    <li class="page" data-page="100">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">마지막</span>
	          		</a>
			    </li>
			</ul>
       	</div>
       	<!-- 회원정보 수정 Modal -->
        <%@ include file="/user/modify.jsp"%>
