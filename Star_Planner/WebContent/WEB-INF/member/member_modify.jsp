<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchBtn").on("click",function(){
			$.ajax({
				"url":"/Star_Planner/member/searchSinger.do",
				"type":"post",
				"data":"keyword="+$("#keyword").val(),
				"dataType":"json",
				"success":function(singer){
					$("#favoriteResult").html("검색된 가수:&nbsp;&nbsp;")
					if(singer == null){
						$("#favorite").append("조건에 일치하는 가수가 없습니다.");
					}else{
						for (var i = 0; i < singer.length; i++) {
							$("#favoriteResult").append("<input type='button' value='"+singer[i].singer_name+"' onclick='addFavorite(&quot;"+singer[i].singer_name+"&quot;,"+singer[i].singer_id+")'> &nbsp;&nbsp;");
						}
					}
				},
				"error":function(xhr, status, errorMsg){
					alert("오류 발생 - "+status+","+errorMsg);
				},
				"beforeSend":function(){
					if(!$("#keyword").val()){
						alert("조회할 가수 입력");
						$("#keyword").focus();
						return false;
					};
				}
			});
		});
		$("#form").on("submit",function(){
			var flag=true;
			if (!$("#password").val()){
				$("#password_er").text("Password를 입력해주세요");
				$("#password").focus();
				flag=false;
			}else{$("#password_er").text("");}
			if($("#password").val()!=$("#passwordCK").val()){
				$("#passwordCK_er").text("패스워드가 서로 다릅니다");
				$("#password").focus();
				flag=false;
			}else{$("#passwordCK_er").text("");}
			if(!$("#phone").val()){
				$("#phone_er").text("전화번호를 입력해주세요");
				$("#phone").focus();
				flag=false;
			}else{$("#phone").text("");}
			if(!$("#email").val()){
				$("#email_er").text("이메일을 입력해주세요");
				$("#email").focus();
				flag=false;
			}else{$("#email").text("");}
			/* alert(!flag + " / " + !window.ckflag); */
			if(!flag){
				return false;
			}
		});
		$("#favoriteList").on("click","td",function(){
			var id=this.getAttribute("id");
			$(this).remove();
			$.ajax({
				"url":"/Star_Planner/member/minusSingerFavorite.do",
				"type":"post",
				"data":"singer_id="+id,
				"dataType":"text",
				"success":function(){
				},
				"error":function(xhr, status, errorMsg){
					alert("오류 발생 - "+status+","+errorMsg);
				},
				"beforeSend":function(){
				}
			});
		});
	});
	function addFavorite(singer_name,singer_id){
		
		if(document.getElementById(singer_id) == null){
			$.ajax({
				"url":"/Star_Planner/member/plusSingerFavorite.do",
				"type":"post",
				"data":"singer_id="+singer_id,
				"dataType":"text",
				"success":function(){
				},
				"error":function(xhr, status, errorMsg){
					alert("오류 발생 - "+status+","+errorMsg);
				},
				"beforeSend":function(){
				}
			});
			var td = document.createElement("td");
			td.setAttribute("id",singer_id);
			td.innerHTML=singer_name+"<input type='hidden' value='"+singer_name+"' name='favorite'>";
			$("#favoriteList").append(td);
		}else {
			alert("이미 선택하셨습니다");
		}
	};

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
<div style="margin: 0px auto; width: 650px; padding-left: 400px;">
<h2>회원정보변경</h2>
	<form id="form" method="post" action="/Star_Planner/member/modify.do">
		<input type='hidden' name='m_id' value="${requestScope.member.m_id }"
			id="m_id">
		<table>
			<tr>
				<td>회원등급</td>
				<td><c:choose>
						<c:when test="${requestScope.member.group_id==2 }">
							일반회원
						</c:when>
						<c:when test="${requestScope.member.group_id>=3 }">
							매니저
						</c:when>
						<c:when test="${requestScope.member.group_id==-1 }">
							매니저 승인 대기중
						</c:when>
					</c:choose></td>
				<td><span id="group_er"></span>
				<td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${requestScope.member.m_id }</td>
				<td><span id="id_er"></span>
				<td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${requestScope.member.name}</td>
				<td><span id="name_er"></span>
				<td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"
					value="${requestScope.member.password }"></td>
				<td><span id="password_er"></span>
				<td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="passwordCK" id="passwordCK"></td>
				<td><span id="passwordCK_er"></span>
				<td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email"
					value="${requestScope.member.email}"></td>
				<td><span id="email_er"></span>
				<td>
			</tr>
			<tr>
				<td>연락번호</td>
				<td><input type="number" name="phone" id="phone"
					value="${requestScope.member.phone}"></td>
				<td><span id="phone_er"></span>
				<td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test="${requestScope.member.gender == '남'}">
							<label><input type="radio" id="gender1" name="gender" value='남' checked="checked">남자</label>
							<label><input type="radio" id="gender2" name="gender" value="여">여자</label>	
						</c:when>
						<c:otherwise>
							<label><input type="radio" id="gender1" name="gender" value='남'>남자</label>
							<label><input type="radio" id="gender2" name="gender" value="여" checked="checked">여자</label>
						</c:otherwise>
					</c:choose>
				</td>
				<td><span id="gender_er"></span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="2">
					<input type="text" id="postcode" name="member_address" value="${requestScope.temAdr[0] }" required="required" onclick="execDaumPostcode()" readonly="readonly"> 
					<input type="button" onclick="execDaumPostcode()" value="주소 찾기">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="text" id="address" name="member_address"	value="${requestScope.temAdr[1] }" required="required" onclick="execDaumPostcode()" readonly="readonly"> 
					<input type="text" id="address2" name="member_address" value="${requestScope.temAdr[2] }">
				</td>
			</tr>
		</table>

		<div id="favorite_tr">
			<table>
				<tr>
					<td><input type="text" size="10" id="keyword"></td>
					<td><input type="button" id="searchBtn" value="선호가수 검색"></td>
					<td><span id="favoriteResult"></span></td>
				</tr>
			</table>
			<table>
				<tr id="favoriteList">
					<c:forEach items="${requestScope.member.favoriteList }" var="name">
						<td id="${name}">${name} <input type='hidden'
							value='${name }' name='favorite'>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td colspan="2"><input type="submit" id="checkForm" value="변경"></td>
			</tr>
		</table>
	</form>
</div>
	
</body>
</html>