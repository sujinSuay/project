<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
(document).ready(function(){
	$("#form").on("submit",function(){
		var flag = true;
		if($("#m_id").val().length<6){
			$("#id_er").text("6�����̻� �Է��� �ּ���");
			flag = false;
		} else{$("#id_er").text("");}
		if($("#password").val().length<1){
			$("#password_er").text("�н������ 6���� �̻��Դϴ�");
			flag= false;
		}else{$("#password_er").text("");}
		if(!flag) return false; 
	});
}); 
</script>
</head>
<body>
<h2>�α���</h2>
<form id="form" action="/Star_Planner/member/login.do" method="post">
<table>
	<tr>
		<td>���̵�</td>
		<td><input type="text" id="m_id" name="m_id" value="${requestScope.m_id }"></td>
		<td><span id="id_er"></span></td>
	</tr>
	<tr>
		<td>�н�����</td>
		<td><input type="password" id="password" name="password"></td>
		<td><span id="password_er"></span></td>
	</tr>
	<tr>
		<td><input type="button" id="join" value="ȸ������" onclick="location.href='/Star_Planner/member_join.do'"></td>
		<td><input type="submit" value="�α���"></td>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>