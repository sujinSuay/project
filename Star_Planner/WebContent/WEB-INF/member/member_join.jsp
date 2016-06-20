<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_join</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("#checkForm").on("click", function() {
			$.ajax({
				"url" : "/Star_Planner/member/join.do",
				"type" : "POST",
				"data" : $("#form").serialize(),
				"dataType" : "text",
				"success" : function(txt) {
					alert(txt);
				},
				"error" : function(xhr, status, errorMsg) {
					alert("오류발생" + status + ", " + errorMsg);
				},
				"beforeSend" : function() {
					alert($("#gender").val().equal("undefinded"));
					var flag=true;
					if (!$("#id").val()) {
						$("#id_er").text("이름을 입력해주세요");
						$("#id").focus();
						flag=false;
					}
					if (!$("#name").val()){
						$("#name_er").text("이름을 입력해주세요");
						$("#name").focus();
						flag=false;
					}
					if (!$("#password").val()){
						$("#password_er").text("Password를 입력해주세요");
						$("#password").focus();
						flag=false;
					}
					if($("#password").val()!=$("#passwordCK").val()){
						$("#passwordCK_er").text("패스워드가 서로 다릅니다");
						$("#password").focus();
						flag=false;
					}
					if(!$("#gender").val()=="undefinded"){
						$("#gender_er").text("성별을 선택해 주세요");
					}
					if(!flag){
						return false;
					}
				}
			})
		});
		/* $("#group_id2").on("click",function(){
			document.$("#favorite_tr").show("fast");
		});
		$("#group_id1").on("click",function(){
			document.$("#favorite_tr").hide("fast");
		}); */

	});
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
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
	<form id="form" method="post">
		<table>
			<tr>
				<td colspan="2">
					<input type="radio" id="group_id1"	name="group_id" value='-1'>매니져
					<input type="radio"	id="group_id2" name="group_id" value="2" checked="checked">일반회원
				</td>
				<td><span id="group_er"></span><td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" value="${requestScope.id }"></td>
				<td><span id="id_er"></span><td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name"value="${requestScope.name }"></td>
				<td><span id="name_er"></span><td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"></td>
				<td><span id="password_er"></span><td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="passwordCK" id="passwordCK"></td>
				<td><span id="passwordCK_er"></span><td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value='male'>남자 <input
					type="radio" name="gender" value="female">여자</td>
				<td><span id="gender_er"></span><td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="postcode" id="postcode" placeholder="우편번호"> 
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="address" name="address"	placeholder="주소"> 
					<input type="text" id="address2" name="address2" placeholder="상세주소"></td>
				<td></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="social_no"></td>
				<td><span id="social_no_er"></span><td>
			</tr>
		</table>
		<div id="favorite_tr">
			<table>
				<tr>
					<td>선호가수</td>
					<td name="favorite">sdfasdfasd</td>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td colspan="2"><input type="reset" name="초기화"><input
					type="button" id="checkForm" value="가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>