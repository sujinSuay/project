<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdPassword</title>
<script type="text/javascript" src="/Star_Planner/scripts/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#findPasswordDiv").hide();
});

function changeFindForm(check){
	if(check=="id"){
		$("#findIdDiv").show();
		$("#findPasswordDiv").hide();
	}else {
		$("#findIdDiv").hide();
		$("#findPasswordDiv").show();
	}
}
function findIdBtn(){
	$.ajax({
		"url":"/Star_Planner/member/findId.do",
		"type":"post",
		"data":"name="+$("#name").val()+"&social_no="+$("#social_no1").val()+","+$("#social_no2").val(),
		"dataType":"json",
		"success":function(txt){
			if(txt=="numberFormat"){
				$("#social_no_er").html("<span style='color: red;'>잘못된 주민번호 입니다.</span>");
				$("#social_no1").focus();
				return;
			}else if(txt.m_id=="noMatch"){
				$("#result").html("<span style='color:red;'>가입된 정보가 없습니다.</span>");
				return;
			}else{
				window.email = txt.email;
				$("#result").html("가입하신 ID는 [" + txt.m_id + "] 입니다.<br>"+
								"<a onclick=\"gofindPassword('"+txt.m_id+"')\">이 아이디의 패스워드를 찾으시려면 클릭하세요.</a>");
			}
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
			var flag = true;
			if(!$("#name").val()){
				$("#name_er").text("이름을 입력해 주세요");
				$("#name").focus();
				flag = false;
			} else $("#name_er").text("");
		 	if($("#social_no1").val().length<6 || $("#social_no2").val().length<7){
		 		alert(33);
              	$("#social_no_er").html("<span style='color: red;'>잘못된 주민번호 입니다.</span>");
              	flag = false;
            } else $("#social_no_er").html("");
		 	if(!flag) return false;
		}
	});
}
function gofindPassword(m_id){
	$("#findIdDiv").hide();
	$("#findPasswordDiv").show();
	$("#m_id").val(m_id);
}
function findPasswordBtn(){
	$.ajax({
		"url":"/Star_Planner/member/findPassword.do",
		"type":"post",
		"data":"m_id="+$("#m_id").val()+"&email="+$("#email").val(),
		"dataType":"text",
		"success":function(txt){
			if(txt=="success"){
				alert($("#email").val()+"로 패스워드를 발송하였습니다.");
				window.location.href="/Star_Planner/member_login.do";
			}else if(txt=="noMatch"){
				$("#result").html("<span style='color:red;'>정보가 일치하지 않습니다.</span>");
				return;
			}
		},
		"error":function(xhr, status, errorMsg){
			alert("오류 발생 - "+status+","+errorMsg);
		},
		"beforeSend":function(){
			var flag = true;
			if(!$("#email").val()){
				$("#email_er").text("이름을 입력해 주세요");
				$("#email").focus();
				flag = false;
			} else $("#email_er").text("");
		 	if(!$("#m_id").val()){
              	$("#m_id_er").html("<span style='color: red;'>잘못된 주민번호 입니다.</span>");
              	flag = false;
            } else $("#m_id_er").html("");
		 	if(!flag) return false;
		}
	});
}
</script>
</head>
<body>
	<label><input type="radio" name="IdPasswordRadio" id="IdPasswordRadio1" checked="checked" onclick="changeFindForm('id')">ID찾기</label>
	<label><input type="radio" name="IdPasswordRadio" id="IdPasswordRadio" onclick="changeFindForm('password')">Password찾기</label>
		
	<div id="findIdDiv">
		<table>
			<tr>
				<td>이름</td>
				<td><input type='text' id='name'></td>
				<td><span id="name_er" style="color:red;"></span></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type='text' id='social_no1' name='social_no' maxlength='6' size='6'>-<input type='password' id='social_no2' name='social_no' maxlength='7' size='7'></td>
				<td><span id="social_no_er" style="color:red;"></span></td>
			</tr>
			<tr>
				<td></td><td><button onclick="findIdBtn()">ID찾기</button></td>
			</tr>
		</table>
	</div>
	<div id="findPasswordDiv">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" id="m_id"></td>
				<td><span id="m_id_er" style="color:red;"></span></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" id="email"></td>
				<td><span id="email_er" style="color:red;"></span></td>
			</tr>
			<tr>
				<td></td><td><button onclick="findPasswordBtn()">Password찾기</button></td>
		</table>
	</div>
	<div id="result">
	</div>
</body>
</html>