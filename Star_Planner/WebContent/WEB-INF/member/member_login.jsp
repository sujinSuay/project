<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> --> 
 <link rel="stylesheet" href="/Star_Planner/style/darkloginform/style.css"> 
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
<div class="loginForm">
	<form method="post" action="/Star_Planner/member/login.do" class="login">
    <p>
      <label for="login">Login Id</label>
      <input type="text" name="m_id" id="m_id" value="${requestScope.m_id }">
    </p>

    <p>
      <label for="password">Password:</label>
      <input type="password" name="password" id="password">
    </p>

    <p class="login-submit">
      <button type="submit" class="login-button">Login</button>
    </p>

    <p class="forgot-password"><a href="/Star_Planner/member/beforeJoin.do">Join Us</a></p>
  </form>
</div>
</body>
</html>