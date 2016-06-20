<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_join</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	
});
    function execDaumPostcode() {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
</head>
<body>
<h2>회원가입</h2>
<form action="/Star_Planner/member/join.do" method="post">
<table>
	<tr>
		<td colspan="2">
			<input type="radio" name="group_id" value='-1'>매니져
			<input type="radio" name="group_id" value="2">일반회원
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${requestScope.name }"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td>비밀번호확인</td>
		<td><input type="password" name="passwordCK"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" name="gender" value='male'>남자
			<input type="radio" name="gender" value="female">여자
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="text" id="postcode" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="text" id="address" placeholder="주소">
			<input type="text" id="address2" placeholder="상세주소">
		</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name="social_no"></td>
	</tr>
	<tr>
		<td>선호가수</td>
		<td>sdfasdfasd</td>
	</tr>		
	<tr>
		<td colspan="2"><input type="reset" name="초기화"><input type="submit" value="가입"></td>
	</tr>
</table>
</form>
</body>
</html>