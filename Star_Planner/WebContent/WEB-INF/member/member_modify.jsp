<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보변경</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
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
	alert(flag);
	if(!flag){
		return false;
	}
});
});
</script>
</head>
<body>
<h2>회원정보변경</h2>
<form id="form" method="post" action="/Star_Planner/member/modify.do">
<input type='hidden' name='m_id' value="${requestScope.member.m_id }" id="m_id">
		<table>
			<tr>
				<td>회원등급</td>
				<td>
					<c:choose>
						<c:when test="${requestScope.member.group_id==2 }">
							일반회원
						</c:when>
						<c:when test="${requestScope.member.group_id>=3 }">
							매니저
						</c:when>
						<c:when test="${requestScope.member.group_id==-1 }">
							매니저 승인 대기중
						</c:when>
					</c:choose>
				</td>
				<td><span id="group_er"></span><td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${requestScope.member.m_id }</td>
				<td><span id="id_er"></span><td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${requestScope.member.name}</td>
				<td><span id="name_er"></span><td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password" value="${requestScope.member.password }"></td>
				<td><span id="password_er"></span><td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="passwordCK" id="passwordCK"></td>
				<td><span id="passwordCK_er"></span><td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email" value="${requestScope.member.email}"></td>
				<td><span id="email_er"></span><td>
			</tr>
			<tr>
				<td>연락번호</td>
				<td><input type="text" name="phone" id="phone" value="${requestScope.member.phone}"></td>
				<td><span id="phone_er"></span><td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test="${requestScope.member.gender}=='male'">
							남자
						</c:when>
						<c:otherwise>
							여자
						</c:otherwise>
					</c:choose>
				</td>
				<td><span id="gender_er"></span><td>
			</tr>
			<tr>
				<td colspan="3">
					${requestScope.member.address}
				</td>
			</tr>
		</table>
		<div id="favorite_tr">
			<table>
				<tr>
					<td>선호가수</td>
					<td>${requestScope.member.favorite}</td>
					<td></td>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td colspan="2">
					<input type="submit" id="checkForm" value="변경"></td>
			</tr>
		</table>
	</form>
</body>
</html>