<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#form").on("submit",function(){
		var flag = true;
		if($("#m_id").val().length<1){
			$("#id_er").text("6글자이상 입력해 주세요");
			flag = false;
		} else{$("#id_er").text("");}
		if($("#password").val().length<1){
			$("#password_er").text("패스워드는 6글자 이상입니다");
			flag= false;
		}else{$("#password_er").text("");}
		if(!flag) return false; 
	});
}); 
</script>
</head>
<body>
<h2>로그인</h2>
<form id="form" action="/Star_Planner/member/login.do" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" id="m_id" name="m_id" value="${requestScope.m_id }"></td>
		<td><span id="id_er"></span></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td><input type="password" id="password" name="password"></td>
		<td><span id="password_er"></span></td>
	</tr>
	<tr>
		<td><input type="button" id="join" value="회원가입" onclick="location.href='/Star_Planner/member/beforeJoin.do'"></td>
		<td><input type="submit" value="로그인"></td>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>