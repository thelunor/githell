<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
     <script type="text/javascript">
   //우편번호 검색 팝업
     function openAddrPop() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var fullAddr = ''; // 최종 주소 변수
                 var extraAddr = ''; // 조합형 주소 변수

                 // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                 if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                         extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 $("#postCd").prop('value', data.zonecode); //5자리 새우편번호 사용
                 $("#address1").prop('value', fullAddr);

                 // 상세주소 필드 비우고 해당 필드로 이동한다.
                 $("#address2").prop('value','').focus();
             }
         }).open();
     } 
     </script>
	<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>주소</th>
	 		<td>
	 			<input type="text" name="postCd" id="postCd" style="width: 45px;" maxlength="5" readonly="readonly"/>&nbsp;<a class="btn1" id="addrPopBtn" style="line-height: 25px;" href="javascript:openAddrPop();">검색</a>
	 			<p>
	 			<input type="text" name="address1" id="address1" style="width: 47%;" readonly="readonly"/>&nbsp;<input type="text" name="address2" id="address2" style="width: 47%;" placeholder="상세주소를 입력해주세요."/>
	 		</td>
		</tr>
	</table>
</body>
</html>